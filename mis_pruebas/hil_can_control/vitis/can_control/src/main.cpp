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
#define CAN_ID_TORQUE_1       0x100
#define CAN_ID_TORQUE_2       0x101
#define CAN_ID_T_OBJ_1        0x102
#define CAN_ID_T_OBJ_2        0x103
#define CAN_ID_TORQUE_TV_1    0x104
#define CAN_ID_TORQUE_TV_2    0x105
#define CAN_ID_TARGET_R       0x106

// ========== CAN IDs PARA RECEPCIÓN (Exterior → FPGA) ==========
#define CAN_ID_SENSOR_VEL      0x010  // speed_x, speed_y (2 floats)
#define CAN_ID_SENSOR_YAW      0x011  // angular_z, steering_angle (2 floats)
#define CAN_ID_SENSOR_PEDALS   0x012  // apps, load_cell (2 floats)
#define CAN_ID_SENSOR_ACCEL    0x013  // accel_x, accel_y (2 floats)
#define CAN_ID_SENSOR_MOT_1    0x014  // motor_speed[0], motor_speed[1] (2 floats)
#define CAN_ID_SENSOR_MOT_2    0x015  // motor_speed[2], motor_speed[3] (2 floats)

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
	bool data_ready = false; // Bandera para avisar al main
	
	// Procesar todos los mensajes CAN disponibles
	while (!XCanPs_IsRxEmpty(&Can0)) {
		if (RecvFrame(&Can0, &rx_id, rx_data, &rx_len) == XST_SUCCESS) {
			switch(rx_id) {
                case CAN_ID_SENSOR_VEL:
                    if (rx_len >= 8) {
                        memcpy(&sensors.speed_x, &rx_data[0], 4);
                        memcpy(&sensors.speed_y, &rx_data[4], 4);
                    }
                    break;
                case CAN_ID_SENSOR_YAW:
                    if (rx_len >= 8) {
                        memcpy(&sensors.angular_z, &rx_data[0], 4);
                        memcpy(&sensors.steering_angle, &rx_data[4], 4);
                    }
                    break;
                case CAN_ID_SENSOR_PEDALS:
                    if (rx_len >= 8) {
                        memcpy(&sensors.load_cell, &rx_data[0], 4);
                        memcpy(&sensors.apps, &rx_data[4], 4);
                    }
                    break;
                case CAN_ID_SENSOR_ACCEL:
                    if (rx_len >= 8) {
                        memcpy(&sensors.acceleration_y, &rx_data[0], 4);
                        memcpy(&sensors.acceleration_x, &rx_data[4], 4);
                    }
                    break;
                case CAN_ID_SENSOR_MOT_1:
                    if (rx_len >= 8) {
                        memcpy(&sensors.motor_speed[0], &rx_data[0], 4);
                        memcpy(&sensors.motor_speed[1], &rx_data[4], 4);
                    }
                    break;
                case CAN_ID_SENSOR_MOT_2:
                    if (rx_len >= 8) {
                        memcpy(&sensors.motor_speed[2], &rx_data[0], 4);
                        memcpy(&sensors.motor_speed[3], &rx_data[4], 4);
                        data_ready = true;
                    }
                    break;
                default:
                    break;
			}
		}
	}
	return data_ready;
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
    
    xil_printf("\r\n========================================\r\n");
    xil_printf("  Vehicle Control System - CAN\r\n");
    xil_printf("========================================\r\n");

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

    double tiempo_ant = 0;

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
        if(pid_tc.last_timestamp == 0) {
        	XTime_GetTime(&current_time);
            pid_tc.last_timestamp = current_time;
        } else {
        	XTime_GetTime(&current_time);
            pid_tc.ts = (double)(current_time - pid_tc.last_timestamp) / COUNTS_PER_SECOND;
            pid_tc.last_timestamp = current_time;
        }
        if (!pid_tc.init) {
        	pid_tc.init = 1;
        }

        // Actualizar timestamps TV
        if(pid_tv.last_timestamp == 0) {
        	XTime_GetTime(&current_time);
        	pid_tv.last_timestamp = current_time;
        } else {
        	XTime_GetTime(&current_time);
        	pid_tv.ts = (double)(current_time - pid_tv.last_timestamp) / COUNTS_PER_SECOND;
        	pid_tv.last_timestamp = current_time;
        }
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
        double target_r = torque_vectoring.torque_vectoring_update(&parameters, &sensors, 
                                                                     &pid_tv, &tire, &dv, 
                                                                     fx_request, state, torque_cmd);
        
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
        float temp_f1, temp_f2;

        // Mensaje 1: Torque FL y FR
        temp_f1 = (float)torque_cmd[0];
        temp_f2 = (float)torque_cmd[1];
        memcpy(&can_data[0], &temp_f1, 4);
        memcpy(&can_data[4], &temp_f2, 4);
        SendFrame(&Can0, CAN_ID_TORQUE_1, can_data, 8);

        // Mensaje 2: Torque RL y RR
        temp_f1 = (float)torque_cmd[2];
        temp_f2 = (float)torque_cmd[3];
        memcpy(&can_data[0], &temp_f1, 4);
        memcpy(&can_data[4], &temp_f2, 4);
        SendFrame(&Can0, CAN_ID_TORQUE_2, can_data, 8);

        // Mensaje 3: Target R
        temp_f1 = (float)target_r;
        memcpy(&can_data[0], &temp_f1, 4);
        SendFrame(&Can0, CAN_ID_TARGET_R, can_data, 4);

        // Mensaje 4: T_obj FL y FR
        temp_f1 = (float)sensors.motor_speed[0]/parameters.gear_ratio;
        temp_f2 = (float)sensors.motor_speed[1]/parameters.gear_ratio;
        memcpy(&can_data[0], &temp_f1, 4);
        memcpy(&can_data[4], &temp_f2, 4);
        SendFrame(&Can0, CAN_ID_T_OBJ_1, can_data, 8);

        // Mensaje 5: T_obj RL y RR
        temp_f1 = (float)sensors.motor_speed[2]/parameters.gear_ratio;
        temp_f2 = (float)sensors.motor_speed[3]/parameters.gear_ratio;
        memcpy(&can_data[0], &temp_f1, 4);
        memcpy(&can_data[4], &temp_f2, 4);
        SendFrame(&Can0, CAN_ID_T_OBJ_2, can_data, 8);

        // Mensaje 6: Torque TV FL y FR
        temp_f1 = (float)SR[0];
        temp_f2 = (float)SR[1];
        memcpy(&can_data[0], &temp_f1, 4);
        memcpy(&can_data[4], &temp_f2, 4);
        SendFrame(&Can0, CAN_ID_TORQUE_TV_1, can_data, 8);

        XTime_GetTime(&current_time);
        double tiempo = (double)(current_time - tiempo_ant) / COUNTS_PER_SECOND;
        tiempo_ant = current_time;

        // Mensaje 7: Torque TV RL y RR
        temp_f1 = (float)tiempo;
        temp_f2 = (float)SR[3];
        memcpy(&can_data[0], &temp_f1, 4);
        memcpy(&can_data[4], &temp_f2, 4);
        SendFrame(&Can0, CAN_ID_TORQUE_TV_2, can_data, 8);
    }

    cleanup_platform();
    return 0;
}
