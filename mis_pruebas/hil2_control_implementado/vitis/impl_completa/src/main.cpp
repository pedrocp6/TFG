#include <cstdio>
#include <cstdint>
#include <cstring>
#include "platform.h"
#include "xuartps_hw.h"
#include "xparameters.h"
#include "xtime_l.h"
#include "control/main.hpp"
#include "xuartps.h"

// Direcciï¿½n base de la UART
#define UART_BASEADDR XPAR_XUARTPS_0_BASEADDR

// Frecuencia del temporizador
constexpr uint32_t FRECUENCIA_HZ = 200;
constexpr uint32_t CUENTAS_POR_LOOP = (COUNTS_PER_SECOND / FRECUENCIA_HZ);

// Cambiar la frecuencia de la UART (base: 115200 baudios)
XUartPs UartInst;

void configurar_uart_rapida() {
    int Status;
    XUartPs_Config *Config;

    // Buscar la configuración de hardware de la UART 0
    Config = XUartPs_LookupConfig(XPAR_XUARTPS_0_DEVICE_ID);
    if (NULL == Config) {
        xil_printf("Error: No se encuentra la UART\r\n");
        return;
    }

    // Inicializar el driver
    Status = XUartPs_CfgInitialize(&UartInst, Config, Config->BaseAddress);
    if (Status != XST_SUCCESS) {
        xil_printf("Error: Fallo al inicializar UART\r\n");
        return;
    }

    // FORZAR LA NUEVA VELOCIDAD (921600 baudios)
    Status = XUartPs_SetBaudRate(&UartInst, 921600);
    if (Status != XST_SUCCESS) {
        xil_printf("Error: No se pudo cambiar la velocidad de la UART\r\n");
    } else {
        xil_printf("Exito: UART configurada a 921600 baudios\r\n");
    }
}

// ============================================================================
// DEFINICIï¿½N DE TIPOS DE MENSAJES
// ============================================================================
enum class MessageType : uint8_t {
    SENSOR_DATA = 0x01,      // Datos de sensores (Simulink a Placa)
    TORQUE_COMMAND = 0x02,       // Fuerza longitudinal (Placa a Simulink)
	DEBUG = 0X03,
};

// ============================================================================
// ESTRUCTURAS DE DATOS (Recuerda alinear con Simulink)
// ============================================================================

// --- ESTRUCTURA PRINCIPAL DE ENVï¿½O (FPGA -> Simulink) ---
struct TorqueCommandData {
    float torque_FL;
    float torque_FR;
    float torque_RL;
    float torque_RR;
    float pw_debug;
    float sr_fl;
    float sr_fr;
    float sr_rl;
    float sr_rr;
    float T_obj_fl;
    float T_obj_fr;
    float T_obj_rl;
    float T_obj_rr;
};

union Send_cmd {
	TorqueCommandData data;
	uint8_t bytes[sizeof(TorqueCommandData)];
};

// ============================================================================
// VARIABLES GLOBALES PARA TAMAï¿½OS DE MENSAJE
// ============================================================================
uint16_t SIZE_RX_SENSORS = sizeof(SensorData) - sizeof(double)*8;	// Se eliminan 8 doubles de las variables que no se emplean
uint16_t SIZE_TX_FX      = sizeof(Send_cmd);

// ============================================================================
// CLASE UART MODULAR
// ============================================================================
class UARTComm {
private:
    uint32_t base_address;

    // Estado de la mï¿½quina de estados para recepciï¿½n
    // NOTA: Se ha eliminado WAITING_SIZE
    enum class RxState : uint8_t {
        WAITING_HEADER1 = 0,
        WAITING_HEADER2 = 1,
        WAITING_TYPE = 2,
        READING_DATA = 3
    };

    RxState rx_state;
    MessageType current_msg_type;
    uint16_t expected_size;
    uint16_t byte_index;
    uint8_t rx_buffer[512];

    // Headers del protocolo
    static constexpr uint8_t HEADER1 = 0xAB;
    static constexpr uint8_t HEADER2 = 0xCD;

public:
    explicit UARTComm(uint32_t uart_base)
        : base_address(uart_base),
          rx_state(RxState::WAITING_HEADER1),
          current_msg_type(MessageType::SENSOR_DATA),
          expected_size(0),
          byte_index(0) {}

    void sendByte(uint8_t byte) {
        XUartPs_WriteReg(base_address, XUARTPS_FIFO_OFFSET, byte);
    }

    template<typename T>
    void sendPacket(MessageType msg_type, const T& packet) {
        // Usamos la variable global para el tamaï¿½o si coincide con el tipo,
        // o sizeof(T) por seguridad para tipos genï¿½ricos.
        uint16_t size = sizeof(T);

        // 1. Enviar Cabecera
        sendByte(HEADER1);
        sendByte(HEADER2);

        // 2. Enviar Tipo
        sendByte(static_cast<uint8_t>(msg_type));

        // 3. ELIMINADO: Enviar Tamaï¿½o (2 bytes)

        // 4. Enviar Datos
        const uint8_t* data_bytes = reinterpret_cast<const uint8_t*>(&packet);
        for (uint16_t i = 0; i < size; ++i) {
            sendByte(data_bytes[i]);
        }
    }

    void sendData(double torque[4], double pw_total, double sr_debug[4], double T_obj[4]) {
        Send_cmd packet;
        packet.data.torque_FL = (float) torque[0];
        packet.data.torque_FR = (float) torque[1];
        packet.data.torque_RL = (float) torque[2];
        packet.data.torque_RR = (float) torque[3];
        packet.data.pw_debug = (float) pw_total;
        packet.data.sr_fl = (float) sr_debug[0];
        packet.data.sr_fr = (float) sr_debug[1];
        packet.data.sr_rl = (float) sr_debug[2];
        packet.data.sr_rr = (float) sr_debug[3];
        packet.data.T_obj_fl = (float) T_obj[0];
        packet.data.T_obj_fr = (float) T_obj[1];
        packet.data.T_obj_rl = (float) T_obj[2];
        packet.data.T_obj_rr = (float) T_obj[3];
        // Simulink debe esperar recibir SIZE_TX_FX bytes de datos
        sendPacket(MessageType::TORQUE_COMMAND, packet);
    }

    int readPacket(void* output_buffer, uint16_t max_size) {
        while (XUartPs_IsReceiveData(base_address)) {
            uint8_t byte_leido = XUartPs_ReadReg(base_address, XUARTPS_FIFO_OFFSET);

            switch (rx_state) {
                case RxState::WAITING_HEADER1:
                    if (byte_leido == HEADER1) rx_state = RxState::WAITING_HEADER2;
                    break;

                case RxState::WAITING_HEADER2:
                    if (byte_leido == HEADER2) rx_state = RxState::WAITING_TYPE;
                    else rx_state = RxState::WAITING_HEADER1;
                    break;

                case RxState::WAITING_TYPE:
                    current_msg_type = static_cast<MessageType>(byte_leido);

                    // Asignamos el tamaï¿½o esperado basï¿½ndonos en el tipo recibido
                    // usando las variables globales.
                    switch (current_msg_type) {
                        case MessageType::SENSOR_DATA:
                            expected_size = SIZE_RX_SENSORS;
                            break;
                        default:
                            // Tipo desconocido, reseteamos para evitar desincronizaciï¿½n
                            rx_state = RxState::WAITING_HEADER1;
                            continue;
                    }

                    // Verificaciï¿½n de seguridad buffer interno
                    if (expected_size > sizeof(rx_buffer)) {
                        rx_state = RxState::WAITING_HEADER1;
                    } else {
                        byte_index = 0;
                        rx_state = RxState::READING_DATA; // Pasamos directo a leer datos
                    }
                    break;

                case RxState::READING_DATA:
                    rx_buffer[byte_index++] = byte_leido;

                    if (byte_index >= expected_size) {
                        // Paquete completo
                        if (expected_size <= max_size && output_buffer != nullptr) {
                            memcpy(output_buffer, rx_buffer, expected_size);
                        }

                        rx_state = RxState::WAITING_HEADER1;
                        return static_cast<int>(current_msg_type);
                    }
                    break;
            }
        }
        return -1;
    }

    bool readSensorData(SensorData& sensors) {
        // Pasamos el tamaï¿½o mï¿½ximo permitido
        int msg_type = readPacket(&sensors, SIZE_RX_SENSORS);
        return (msg_type == static_cast<int>(MessageType::SENSOR_DATA));
    }
};

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
// FUNCIï¿½N DRIVER_REQUEST (Adaptada a Simulink, no es la real)
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

    UARTComm uart(UART_BASEADDR);
    configurar_uart_rapida();
    Timer timer(CUENTAS_POR_LOOP);
    bool ini=false;

    while(ini==false){
    	ini = parameters_init(&parameters);
    }
    // estimation.estimation_init(&parameters);
    torque_vectoring.torque_vectoring_init(&parameters, &pid_tv);
    traction_control.traction_control_init(&pid_tc, &parameters);
    power_limitation.power_limitation_init();

    // Inicializaciï¿½n de los sensores que no se leen para un buen comportamiento del control
    sensors.angular_x = 0.0;
    sensors.angular_y = 0.0;
    sensors.angular_z = 0.0;
    sensors.current = 0.0;
    sensors.battery_voltage = 500;
    sensors.vehicle_side_voltage = 500;
    sensors.power = 0;
    sensors.v_soc = 500;
    float slip_angle[4];

    while (true) {
        timer.waitNextTrigger();

        if(pid_tc.last_timestamp == 0) {
        	XTime_GetTime(&current_time);
            pid_tc.last_timestamp = current_time;
        } else {
        	XTime_GetTime(&current_time);
            pid_tc.ts = (double)(current_time - pid_tc.last_timestamp)/COUNTS_PER_SECOND;
            pid_tc.last_timestamp = current_time;
        }

        if (!pid_tc.init) {
        	pid_tc.init = 1;
        }


        if(pid_tv.last_timestamp == 0) {
        	XTime_GetTime(&current_time);
        	pid_tv.last_timestamp = current_time;
        } else {
        	XTime_GetTime(&current_time);
        	pid_tv.ts = (double)(current_time - pid_tv.last_timestamp)/COUNTS_PER_SECOND;
        	pid_tv.last_timestamp = current_time;
        }

        if (!pid_tv.init) {
        	pid_tv.init = 1;
        }

        static double TC[4] = {0,0,0,0};
        static double SR[4] = {0,0,0,0};
        static double T_obj[4] = {0,0,0,0};

        if (uart.readSensorData(sensors)) {
            // Procesamiento
        	state[0] =	sensors.speed_x;
        	state[1] =	sensors.speed_y;
        	state[2] =	sensors.angular_z;
            double fx_request = driver_request(sensors, parameters);
            double target_r = torque_vectoring.torque_vectoring_update(&parameters, &sensors, &pid_tv, &tire, &dv, fx_request, state, torque_cmd);
            double debug[4];
            debug[0] = torque_cmd[0];
            debug[1] = torque_cmd[1];
            debug[2] = torque_cmd[2];
            debug[3] = torque_cmd[3];
            traction_control.traction_control_update(&parameters, &sensors, state, torque_cmd, &pid_tc, &tire, torque_cmd, TC, SR, &dv, T_obj, slip_angle);
            double pw_total = power_limitation.power_limitation_update(&parameters, &sensors, torque_cmd);
            // Envï¿½o
            uart.sendData(torque_cmd,target_r, T_obj, debug);
        }
    }

    cleanup_platform();
    return 0;
}
