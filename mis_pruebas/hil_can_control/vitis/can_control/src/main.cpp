#include <cstdio>
#include <cstdint>
#include <cstring>
#include "platform.h"
#include "xparameters.h"
#include "xtime_l.h"
#include "control/main.hpp"
#include "xil_printf.h"

// ========== CAN INCLUDES ==========
#include "xcanps.h"
// #include "sleep.h"

// Frecuencia del temporizador
constexpr uint32_t FRECUENCIA_HZ = 200;  // 100 Hz = 10 ms por ciclo
constexpr uint32_t CUENTAS_POR_LOOP = (COUNTS_PER_SECOND / FRECUENCIA_HZ);

// ========== CAN DEFINITIONS ==========
#define CAN_DEVICE_ID	XPAR_XCANPS_0_DEVICE_ID
#define XCANPS_MAX_FRAME_SIZE_IN_WORDS (XCANPS_MAX_FRAME_SIZE / sizeof(u32))

// ========== CAN IDs PARA TRANSMISIÓN (FPGA → Exterior) ==========
#define CAN_ID_TORQUE       0x100
#define CAN_ID_TIEMPO       0x101
#define CAN_ID_DEBUG_1      0x102
#define CAN_ID_DEBUG_2      0x103
#define CAN_ID_DEBUG_3      0x104
#define CAN_ID_DEBUG_4      0x105

// ========== CAN IDs PARA RECEPCIÓN (Exterior → FPGA) ==========
#define CAN_ID_SENSOR_VEL      0x010  // speed_x, speed_y (2 floats)
#define CAN_ID_SENSOR_YAW      0x011  // angular_z, steering_angle (2 floats)
#define CAN_ID_SENSOR_PEDALS   0x012  // apps, load_cell (2 floats)
#define CAN_ID_SENSOR_ACCEL    0x013  // accel_x, accel_y (2 floats)
#define CAN_ID_SENSOR_MOT_1    0x014  // motor_speed[0], motor_speed[1] (2 floats)
#define CAN_ID_SENSOR_MOT_2    0x015  // motor_speed[2], motor_speed[3] (2 floats)
#define CAN_ID_BR_TORQUE_1     0x016  // brake_torque[0], brake_torque[1] (2 floats)
#define CAN_ID_BR_TORQUE_2     0x017  // brake_torque[2], brake_torque[3] (2 floats)

// CAN Configuration
#define TEST_BTR_SYNCJUMPWIDTH		1
#define TEST_BTR_SECOND_TIMESEGMENT	3
#define TEST_BTR_FIRST_TIMESEGMENT	14
#define TEST_BRPR_BAUD_PRESCALAR	4

// ========== CAN VARIABLES ==========
static XCanPs Can0;
static u32 TxFrame[XCANPS_MAX_FRAME_SIZE_IN_WORDS];
static u32 RxFrame[XCANPS_MAX_FRAME_SIZE_IN_WORDS];

// ========== CAN FUNCTIONS ==========
int CanInitial(u16 DeviceId, XCanPs *CanPtr)
{
	int Status;
	XCanPs *CanInstPtr = CanPtr;
	XCanPs_Config *ConfigPtr;

	ConfigPtr = XCanPs_LookupConfig(DeviceId);
	if (CanInstPtr == NULL) {
		return XST_FAILURE;
	}
	Status = XCanPs_CfgInitialize(CanInstPtr, ConfigPtr, ConfigPtr->BaseAddr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = XCanPs_SelfTest(CanInstPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XCanPs_EnterMode(CanInstPtr, XCANPS_MODE_CONFIG);
	while(XCanPs_GetMode(CanInstPtr) != XCANPS_MODE_CONFIG);

	XCanPs_SetBaudRatePrescaler(CanInstPtr, TEST_BRPR_BAUD_PRESCALAR);
	Status = XCanPs_SetBitTiming(CanInstPtr, TEST_BTR_SYNCJUMPWIDTH,
			TEST_BTR_SECOND_TIMESEGMENT,
			TEST_BTR_FIRST_TIMESEGMENT);
	if (Status != XST_SUCCESS) {
	    xil_printf("ERROR: El hardware ha rechazado la configuracion de tiempos CAN.\r\n");
	}

	XCanPs_EnterMode(CanInstPtr, XCANPS_MODE_NORMAL);
	while(XCanPs_GetMode(CanInstPtr) != XCANPS_MODE_NORMAL);

	/* Diagnostic info */
	{
		u32 BaseAddr = CanInstPtr->CanConfig.BaseAddr;
		u32 brpr_reg, btr_reg;
		u32 brpr_val, tseg1_val, tseg2_val, sjw_val;
		u32 prescaler, tq_per_bit;

		brpr_reg = XCanPs_ReadReg(BaseAddr, XCANPS_BRPR_OFFSET);
		btr_reg = XCanPs_ReadReg(BaseAddr, XCANPS_BTR_OFFSET);

		brpr_val = brpr_reg & 0xFF;
		tseg2_val = (btr_reg >> 4) & 0x7;
		tseg1_val = (btr_reg >> 0) & 0xF;
		sjw_val   = (btr_reg >> 7) & 0x3;

		prescaler = brpr_val + 1;
		tq_per_bit = 1 + (tseg1_val + 1) + (tseg2_val + 1);

		xil_printf("\r\n=== CAN Config ===\r\n");
		xil_printf("BRPR=%lu, TSEG1=%lu, TSEG2=%lu, SJW=%lu\r\n",
				brpr_val, tseg1_val, tseg2_val, sjw_val);
		xil_printf("Prescaler=%lu, TQ_per_bit=%lu\r\n", prescaler, tq_per_bit);
		xil_printf("Baud Rate: %lu kbps (100 MHz CAN_CLK)\r\n", 100000 / (prescaler * tq_per_bit));
		xil_printf("==================\r\n\r\n");
	}

	return Status;
}

static int SendFrame(XCanPs *InstancePtr, u32 MessageId, u8 *MsgData, u8 DataLen)
{
	u8 *FramePtr;
	int Index;
	int Status;

	TxFrame[0] = (u32)XCanPs_CreateIdValue(MessageId, 0, 0, 0, 0);
	TxFrame[1] = (u32)XCanPs_CreateDlcValue((u32)DataLen);

	FramePtr = (u8 *)(&TxFrame[2]);
	for (Index = 0; Index < DataLen; Index++) {
		*FramePtr++ = MsgData[Index];
	}

	while (XCanPs_IsTxFifoFull(InstancePtr) == TRUE);

	Status = XCanPs_Send(InstancePtr, TxFrame);

	return Status;
}

static int RecvFrame(XCanPs *InstancePtr, u32 *RxId, u8 *RxData, u8 *RxLen)
{
	int Status;
	int Index;
	u8 *FramePtr;

	/* Recibir el frame */
	Status = XCanPs_Recv(InstancePtr, RxFrame);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Extraer ID (shift right 21 bits para ID estandar de 11 bits) */
	*RxId = RxFrame[0] >> 21;

	/* Extraer longitud de datos (DLC esta en los bits 0-3 del segundo word) */
	*RxLen = (u8)(RxFrame[1] & 0x0F);

	/* Copiar datos recibidos al array proporcionado */
	FramePtr = (u8 *)(&RxFrame[2]);
	for (Index = 0; Index < *RxLen && Index < 8; Index++) {
		RxData[Index] = *FramePtr++;
	}

	return XST_SUCCESS;
}



// ========== FUNCIÓN PARA LEER SENSORES POR CAN ==========
bool read_sensors_can(SensorData& sensors) {
    u32 rx_id = 0;
    u8 rx_data[8];
    u8 rx_len = 0;

    // Flags individuales por mensaje
    static bool got_vel    = false;
    static bool got_yaw    = false;
    static bool got_pedals = false;
    static bool got_accel  = false;
    static bool got_mot1   = false;
    static bool got_mot2   = false;
    static bool got_br1    = false;
    static bool got_br2    = false;

    while (!XCanPs_IsRxEmpty(&Can0)) {
        if (RecvFrame(&Can0, &rx_id, rx_data, &rx_len) == XST_SUCCESS) {
            switch(rx_id) {
                case CAN_ID_SENSOR_VEL:
                    if (rx_len >= 8) {
                        memcpy(&sensors.speed_x,  &rx_data[0], 4);
                        memcpy(&sensors.speed_y,  &rx_data[4], 4);
                        got_vel = true;
                    }
                    break;
                case CAN_ID_SENSOR_YAW:
                    if (rx_len >= 8) {
                        memcpy(&sensors.angular_z,      &rx_data[0], 4);
                        memcpy(&sensors.steering_angle, &rx_data[4], 4);
                        got_yaw = true;
                    }
                    break;
                case CAN_ID_SENSOR_PEDALS:
                    if (rx_len >= 8) {
                        memcpy(&sensors.load_cell, &rx_data[0], 4);
                        memcpy(&sensors.apps,      &rx_data[4], 4);
                        got_pedals = true;
                    }
                    break;
                case CAN_ID_SENSOR_ACCEL:
                    if (rx_len >= 8) {
                        memcpy(&sensors.acceleration_y, &rx_data[0], 4);
                        memcpy(&sensors.acceleration_x, &rx_data[4], 4);
                        got_accel = true;
                    }
                    break;
                case CAN_ID_SENSOR_MOT_1:
                    if (rx_len >= 8) {
                        memcpy(&sensors.motor_speed[0], &rx_data[0], 4);
                        memcpy(&sensors.motor_speed[1], &rx_data[4], 4);
                        got_mot1 = true;
                    }
                    break;
                case CAN_ID_SENSOR_MOT_2:
                    if (rx_len >= 8) {
                        memcpy(&sensors.motor_speed[2], &rx_data[0], 4);
                        memcpy(&sensors.motor_speed[3], &rx_data[4], 4);
                        got_mot2 = true;
                    }
                    break;
                case CAN_ID_BR_TORQUE_1:
					if (rx_len >= 8) {
						memcpy(&sensors.br_torque[0], &rx_data[0], 4);
						memcpy(&sensors.br_torque[1], &rx_data[4], 4);
						got_br1 = true;
					}
					break;
                case CAN_ID_BR_TORQUE_2:
					if (rx_len >= 8) {
						memcpy(&sensors.br_torque[2], &rx_data[0], 4);
						memcpy(&sensors.br_torque[3], &rx_data[4], 4);
						got_br2 = true;
					}
					break;
                default:
                    break;
            }

            // Solo retornar true cuando han llegado TODOS los mensajes
                bool all_ready = got_vel && got_yaw && got_pedals &&
                                 got_accel && got_mot1 && got_mot2 && got_br1 && got_br2;

                if (all_ready) {
                    // Resetear flags para el siguiente ciclo
                    got_vel = got_yaw = got_pedals = false;
                    got_accel = got_mot1 = got_mot2 = false;
                    got_br1 = got_br2 = false;
                }

                return true;

        }
    }

    return false;
}

// ============================================================================
// CLASE TEMPORIZADOR
// ============================================================================
class Timer {
private:
    XTime next_trigger;
    uint32_t counts_per_period;
public:
    explicit Timer(uint32_t counts) : counts_per_period(counts) {
        XTime_GetTime(&next_trigger);
        next_trigger += counts_per_period;
    }
    void waitNextTrigger() {
        XTime current_time;
        do {
            XTime_GetTime(&current_time);
        } while (current_time < next_trigger);
        next_trigger += counts_per_period;
    }
};

// ============================================================================
// FUNCIÓN DRIVER_REQUEST
// ============================================================================
float driver_request(const SensorData& sensors, const Parameters& parameters) {
	float driver_wheels = parameters.mode_2wd ? 2.0f : 4.0f;
	float fx_req_pos = sensors.apps * driver_wheels * parameters.torque_max *
			parameters.gear_ratio / parameters.rdyn;
	float fx_req_neg = sensors.load_cell * driver_wheels * parameters.torque_min *
			parameters.gear_ratio / parameters.rdyn / 400;

	float fx_req = fx_req_pos + fx_req_neg;

	return fx_req;
}

// ============================================================================
// MAIN
// ============================================================================
int main() {
    init_platform();
    XTime current_time;
    XTime tiempo_ant;
    XTime_GetTime(&tiempo_ant); // Inicialízalo con la hora actual antes de entrar al bucle

    Timer timer(CUENTAS_POR_LOOP);
    bool ini = false;

    // ========== INICIALIZAR CAN ==========
    int Status = CanInitial(CAN_DEVICE_ID, &Can0);
    if (Status != XST_SUCCESS) {
        xil_printf("X CAN initialization failed\r\n");
        return XST_FAILURE;
    }
    xil_printf("V CAN initialized successfully\r\n\r\n");

    // ========== INICIALIZAR SISTEMA DE CONTROL ==========
    while(ini == false) {
    	ini = parameters_init(&parameters);
    }
    torque_vectoring.torque_vectoring_init(&parameters, &pid_tv);
    traction_control.traction_control_init(&pid_tc, &parameters);
    power_limitation.power_limitation_init();
    mpcTorqueVectoring.mpc_init(&parameters);

    // Inicialización de sensores (valores por defecto)
    sensors.speed_x = 0.0;
    sensors.speed_y = 0.0;
    sensors.angular_x = 0.0;
    sensors.angular_y = 0.0;
    sensors.angular_z = 0.0;
    sensors.apps = 0.0;
    sensors.load_cell = 0.0;
    sensors.current = 0.0;
    sensors.battery_voltage = 500;
    sensors.vehicle_side_voltage = 500;
    sensors.power = 0;
    sensors.v_soc = 500;
    
    float slip_angle[4];
    static double TC[4] = {0, 0, 0, 0};
    static double SR[4] = {0, 0, 0, 0};
    static double T_obj[4] = {0, 0, 0, 0};

    xil_printf("V Control system initialized\r\n");
    xil_printf("Starting control loop @ %lu Hz...\r\n\r\n", FRECUENCIA_HZ);

    // ========== LOOP PRINCIPAL ==========
    while (true) {
        // timer.waitNextTrigger();

        // ========== LEER SENSORES POR CAN (si hay mensajes disponibles) ==========
        // read_sensors_can(sensors);
        bool step_ready = false;
        while (!step_ready) {
        	step_ready = read_sensors_can(sensors);
        }

        // ========== ACTUALIZAR TIMESTAMPS ==========
        // Actualizar timestamps TC
        /*if(pid_tc.last_timestamp == 0) {
        	XTime_GetTime(&current_time);
            pid_tc.last_timestamp = current_time;
        } else {
        	XTime_GetTime(&current_time);
            pid_tc.ts = (double)(current_time - pid_tc.last_timestamp) / COUNTS_PER_SECOND;
            pid_tc.last_timestamp = current_time;
        }*/
        if (!pid_tc.init) {
        	pid_tc.init = 1;
        }

        // Actualizar timestamps TV
        /*if(pid_tv.last_timestamp == 0) {
        	XTime_GetTime(&current_time);
        	pid_tv.last_timestamp = current_time;
        } else {
        	XTime_GetTime(&current_time);
        	pid_tv.ts = (double)(current_time - pid_tv.last_timestamp) / COUNTS_PER_SECOND;
        	pid_tv.last_timestamp = current_time;
        }*/
        if (!pid_tv.init) {
        	pid_tv.init = 1;
        }
        pid_tc.ts = 0.005;
        pid_tv.ts = 0.005;

        // ========== PROCESAMIENTO DE CONTROL ==========
        state[0] = sensors.speed_x;
        state[1] = sensors.speed_y;
        state[2] = sensors.angular_z;
        
        double fx_request = driver_request(sensors, parameters);
        double target_r;
        double mpc_sol;
        
        if (parameters.tv_mpc_active) {
            target_r = mpcTorqueVectoring.torque_vectoring_mpc(&parameters, &sensors, &tire, fx_request, state, torque_cmd);
        } else {
            mpc_sol = torque_vectoring.torque_vectoring_update(&parameters, &sensors,
                                                                     &pid_tv, &tire, &dv, 
                                                                     fx_request, state, torque_cmd);
        }
        
        
        double torque_tv[4];
        torque_tv[0] = torque_cmd[0];
        torque_tv[1] = torque_cmd[1];
        torque_tv[2] = torque_cmd[2];
        torque_tv[3] = torque_cmd[3];
        
        traction_control.traction_control_update(&parameters, &sensors, state, torque_cmd, 
                                                   &pid_tc, &tire, torque_cmd, TC, SR, 
                                                   &dv, T_obj, slip_angle);

        double pw_total = power_limitation.power_limitation_update(&parameters, &sensors, torque_cmd);

        // ========== ENV�O CAN - TOTALMENTE MODULAR ==========
        u8 can_data[8];  // Buffer temporal para datos CAN
        int16_t m1, m2, m3, m4;

        // Mensaje 1: Torque FL y FR
        m1 = (int16_t)(torque_cmd[0] * 100);
        m2 = (int16_t)(torque_cmd[1] * 100);
        m3 = (int16_t)(torque_cmd[2] * 100);
        m4 = (int16_t)(torque_cmd[3] * 100);
        can_data[0] = (u8)(m1 & 0xFF);
        can_data[1] = (u8)((m1 >> 8) & 0xFF);
        can_data[2] = (u8)(m2 & 0xFF);
        can_data[3] = (u8)((m2 >> 8) & 0xFF);
        can_data[4] = (u8)(m3 & 0xFF);
        can_data[5] = (u8)((m3 >> 8) & 0xFF);
        can_data[6] = (u8)(m4 & 0xFF);
        can_data[7] = (u8)((m4 >> 8) & 0xFF);
        SendFrame(&Can0, CAN_ID_TORQUE, can_data, 8);

        XTime_GetTime(&current_time);
		// Calculamos el tiempo transcurrido en SEGUNDOS (double)
        double tiempo_segundos = (double)(current_time - tiempo_ant) / COUNTS_PER_SECOND;
        tiempo_ant = current_time;

        m1 = (int16_t)(tiempo_segundos * 100000.0);
        can_data[0] = (u8)(m1 & 0xFF);
        can_data[1] = (u8)((m1 >> 8) & 0xFF);
        SendFrame(&Can0, CAN_ID_TIEMPO, can_data, 2);

        m1 = (int32_t)(mpc_sol * 1000.0);
        can_data[0] = (u8)(m1 & 0xFF);
        can_data[1] = (u8)((m1 >> 8) & 0xFF);
        // memcpy(can_data, &sensors.steering_angle, 4);
        SendFrame(&Can0, CAN_ID_DEBUG_1, can_data, 2);


        int16_t dbg_vx = (int16_t)(mpcTorqueVectoring.debug.vx_ref * 1000.0);
        int16_t dbg_vy  = (int16_t)(mpcTorqueVectoring.debug.vy_ref * 1000.0);
        int16_t dbg_r  = (int16_t)(mpcTorqueVectoring.debug.r_ref * 10000.0);
        int16_t dbg_solver_status = (int16_t)(mpcTorqueVectoring.debug.solver_status);

        can_data[0] = (u8)(dbg_vx & 0xFF);
        can_data[1] = (u8)((dbg_vx >> 8) & 0xFF);
        can_data[2] = (u8)(dbg_vy & 0xFF);
        can_data[3] = (u8)((dbg_vy >> 8) & 0xFF);
        can_data[4] = (u8)(dbg_r & 0xFF);
        can_data[5] = (u8)((dbg_r >> 8) & 0xFF);
        can_data[6] = (u8)(dbg_solver_status & 0xFF);
        can_data[7] = (u8)((dbg_solver_status >> 8) & 0xFF);

        SendFrame(&Can0, CAN_ID_DEBUG_2, can_data, 8);

    }

    cleanup_platform();
    return 0;
}
