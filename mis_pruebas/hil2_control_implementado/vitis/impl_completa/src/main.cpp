#include <cstdio>
#include <cstdint>
#include <cstring>
#include "platform.h"
#include "xuartps_hw.h"
#include "xparameters.h"
#include "xtime_l.h"
#include "control/main.hpp" // Asegúrate de que este archivo existe o coméntalo si no

// Dirección base de la UART
#define UART_BASEADDR XPAR_XUARTPS_0_BASEADDR

// Frecuencia del temporizador
constexpr uint32_t FRECUENCIA_HZ = 100;
constexpr uint32_t CUENTAS_POR_LOOP = (COUNTS_PER_SECOND / FRECUENCIA_HZ);

// ============================================================================
// DEFINICIÓN DE TIPOS DE MENSAJES
// ============================================================================
enum class MessageType : uint8_t {
    SENSOR_DATA = 0x01,      // Datos de sensores (Simulink a Placa)
    FX_REQUEST = 0x02,       // Fuerza longitudinal (Placa a Simulink)
    // TORQUE_COMMAND = 0x03, // Futuro uso
};

// ============================================================================
// ESTRUCTURAS DE DATOS (Recuerda alinear con Simulink)
// ============================================================================

// --- ESTRUCTURAS INTERNAS ---
struct IMU_Data { float r; float ax; float ay; IMU_Data() : r(0), ax(0), ay(0) {} };
struct Encoder_Data { float wFL; float wFR; float wRL; float wRR; Encoder_Data() : wFL(0), wFR(0), wRL(0), wRR(0) {} };
struct Ext_Data { float steering; Ext_Data() : steering(0) {} };
struct GSS_Data { float vx; float vy; GSS_Data() : vx(0), vy(0) {} };

// --- ESTRUCTURA PRINCIPAL DE RECEPCIÓN (Simulink -> FPGA) ---
struct SensorStruct {
	// IMU_Data imu;
    // Encoder_Data encoder;
    // Ext_Data ext;
    // GSS_Data gss;
	float load_cell;  // Freno
    float apps;       // Acelerador

    SensorStruct() : apps(0.0f), load_cell(0.0f) {}
};

// --- ESTRUCTURA PRINCIPAL DE ENVÍO (FPGA -> Simulink) ---
struct FxRequestData {
    float fx_request;
    FxRequestData() : fx_request(0.0f) {}
};

struct ParameterStruct {
    bool mode_2wd;
    float torque_min;
    float torque_max;
    float gear_ratio;
    float rdyn;

    ParameterStruct() :
        mode_2wd(false), torque_min(-21.0f), torque_max(21.0f),
        gear_ratio(12.48f), rdyn(0.225f) {}
};

// ============================================================================
// VARIABLES GLOBALES PARA TAMAÑOS DE MENSAJE
// ============================================================================
// Modifica esto si Simulink manda padding extra o si cambias las estructuras
uint16_t SIZE_RX_SENSORS = sizeof(SensorStruct);
uint16_t SIZE_TX_FX      = sizeof(FxRequestData);

// ============================================================================
// CLASE UART MODULAR
// ============================================================================
class UARTComm {
private:
    uint32_t base_address;

    // Estado de la máquina de estados para recepción
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

    // --- MODIFICADO: Ya no envía el tamaño ---
    template<typename T>
    void sendPacket(MessageType msg_type, const T& packet) {
        // Usamos la variable global para el tamaño si coincide con el tipo,
        // o sizeof(T) por seguridad para tipos genéricos.
        uint16_t size = sizeof(T);

        // 1. Enviar Cabecera
        sendByte(HEADER1);
        sendByte(HEADER2);

        // 2. Enviar Tipo
        sendByte(static_cast<uint8_t>(msg_type));

        // 3. ELIMINADO: Enviar Tamaño (2 bytes)

        // 4. Enviar Datos
        const uint8_t* data_bytes = reinterpret_cast<const uint8_t*>(&packet);
        for (uint16_t i = 0; i < size; ++i) {
            sendByte(data_bytes[i]);
        }
    }

    void sendFxRequest(float fx_request) {
        FxRequestData packet;
        packet.fx_request = fx_request;
        // Simulink debe esperar recibir SIZE_TX_FX bytes de datos
        sendPacket(MessageType::FX_REQUEST, packet);
    }

    // --- MODIFICADO: Máquina de estados sin lectura de tamaño ---
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

                    // AQUI ESTÁ EL CAMBIO IMPORTANTE:
                    // Asignamos el tamaño esperado basándonos en el tipo recibido
                    // usando las variables globales.
                    switch (current_msg_type) {
                        case MessageType::SENSOR_DATA:
                            expected_size = SIZE_RX_SENSORS;
                            break;
                        case MessageType::FX_REQUEST: // (Raro recibir esto, pero por si acaso)
                            expected_size = SIZE_TX_FX;
                            break;
                        default:
                            // Tipo desconocido, reseteamos para evitar desincronización
                            rx_state = RxState::WAITING_HEADER1;
                            continue;
                    }

                    // Verificación de seguridad buffer interno
                    if (expected_size > sizeof(rx_buffer)) {
                        rx_state = RxState::WAITING_HEADER1;
                    } else {
                        byte_index = 0;
                        rx_state = RxState::READING_DATA; // Pasamos directo a leer datos
                    }
                    break;

                // ELIMINADO: case RxState::WAITING_SIZE

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

    bool readSensorData(SensorStruct& sensors) {
        // Pasamos el tamaño máximo permitido
        int msg_type = readPacket(&sensors, sizeof(SensorStruct));
        return (msg_type == static_cast<int>(MessageType::SENSOR_DATA));
    }
};

// ============================================================================
// CLASE TEMPORIZADOR (Sin cambios)
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
// FUNCIÓN DRIVER_REQUEST (Adaptada a Simulink, no es la real)
// ============================================================================
float driver_request(const SensorStruct& sensors, const ParameterStruct& parameters) {
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

    UARTComm uart(UART_BASEADDR);
    Timer timer(CUENTAS_POR_LOOP);

    SensorStruct sensors;
    ParameterStruct parameters;
    float fx_request_value = 0.0f;

    while (true) {
        timer.waitNextTrigger();

        if (uart.readSensorData(sensors)) {
            // Procesamiento
            fx_request_value = driver_request(sensors, parameters);

            // Envío
            uart.sendFxRequest(fx_request_value);
        }
    }

    cleanup_platform();
    return 0;
}
