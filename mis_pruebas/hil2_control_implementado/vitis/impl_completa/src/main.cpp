#include <cstdio>
#include <cstdint>
#include "platform.h"
#include "xuartps_hw.h"
#include "xparameters.h"
#include "xtime_l.h"

// Dirección base de la UART
#define UART_BASEADDR XPAR_XUARTPS_0_BASEADDR

// Frecuencia del temporizador
constexpr uint32_t FRECUENCIA_HZ = 100;
constexpr uint32_t CUENTAS_POR_LOOP = (COUNTS_PER_SECOND / FRECUENCIA_HZ);

// Tamaño del paquete de datos
constexpr size_t TORQUE_PACKET_SIZE = 16;

// --- Estructuras para el envío y recibo de datos ---
struct TorqueValues {
    float torque_FL;
    float torque_FR;
    float torque_RL;
    float torque_RR;

    // Constructor por defecto
    TorqueValues() : torque_FL(0.0f), torque_FR(0.0f),
                     torque_RL(0.0f), torque_RR(0.0f) {}
};

// Union para facilitar la conversión entre estructura y bytes
union TorquePacket {
    TorqueValues torque;
    uint8_t bytes[TORQUE_PACKET_SIZE];

    // Constructor por defecto
    TorquePacket() : torque() {}
};

// Clase para manejar la comunicación UART
class UARTComm {
private:
    uint32_t base_address;

    // Estado de la máquina de estados para recepción
    enum class RxState : uint8_t {
        WAITING_HEADER1 = 0,
        WAITING_HEADER2 = 1,
        READING_DATA = 2
    };

    RxState rx_state;
    size_t byte_index;

    // Headers del protocolo
    static constexpr uint8_t HEADER1_RX = 0xCA;
    static constexpr uint8_t HEADER2_RX = 0xFE;
    static constexpr uint8_t HEADER1_TX = 0xAB;
    static constexpr uint8_t HEADER2_TX = 0xCD;

public:
    // Constructor
    explicit UARTComm(uint32_t uart_base)
        : base_address(uart_base),
          rx_state(RxState::WAITING_HEADER1),
          byte_index(0) {}

    // Enviar un byte por UART
    void sendByte(uint8_t byte) {
        XUartPs_WriteReg(base_address, XUARTPS_FIFO_OFFSET, byte);
    }

    // Enviar un paquete completo de torques
    void sendTorquePacket(const TorquePacket& packet) {
        // Enviar cabecera
        sendByte(HEADER1_TX);
        sendByte(HEADER2_TX);

        // Enviar todos los bytes del paquete
        for (size_t i = 0; i < TORQUE_PACKET_SIZE; ++i) {
            sendByte(packet.bytes[i]);
        }
    }

    // Intentar leer un paquete completo
    // Retorna true si se recibió un paquete completo
    bool readTorquePacket(TorquePacket& packet) {
        // Mientras haya bytes disponibles en el buffer de recepción
        while (XUartPs_IsReceiveData(base_address)) {
            uint8_t byte_leido = XUartPs_ReadReg(base_address, XUARTPS_FIFO_OFFSET);

            switch (rx_state) {
                case RxState::WAITING_HEADER1:
                    if (byte_leido == HEADER1_RX) {
                        rx_state = RxState::WAITING_HEADER2;
                    }
                    break;

                case RxState::WAITING_HEADER2:
                    if (byte_leido == HEADER2_RX) {
                        rx_state = RxState::READING_DATA;
                        byte_index = 0;
                    } else {
                        // Falsa alarma, reiniciar
                        rx_state = RxState::WAITING_HEADER1;
                    }
                    break;

                case RxState::READING_DATA:
                    packet.bytes[byte_index++] = byte_leido;

                    if (byte_index >= TORQUE_PACKET_SIZE) {
                        // Paquete completo recibido
                        rx_state = RxState::WAITING_HEADER1;
                        byte_index = 0;
                        return true;
                    }
                    break;
            }
        }

        return false; // No se completó ningún paquete
    }
};

// Clase para el temporizador
class Timer {
private:
    XTime next_trigger;
    uint32_t counts_per_period;

public:
    explicit Timer(uint32_t counts) : counts_per_period(counts) {
        XTime_GetTime(&next_trigger);
        next_trigger += counts_per_period;
    }

    // Esperar hasta el próximo disparo
    void waitNextTrigger() {
        XTime current_time;
        do {
            XTime_GetTime(&current_time);
        } while (current_time < next_trigger);

        // Programar el siguiente disparo
        next_trigger += counts_per_period;
    }
};

// Función principal
int main() {
    // Inicialización de la plataforma
    init_platform();

    // Inicialización de objetos
    UARTComm uart(UART_BASEADDR);
    Timer timer(CUENTAS_POR_LOOP);

    TorquePacket cmd_tx;      // Comando a enviar
    TorquePacket data_rx;     // Datos recibidos

    // Bucle principal
    while (true) {
        // Intentar leer datos del vehículo
        if (uart.readTorquePacket(data_rx)) {
            // Copiar los datos recibidos al comando de envío
            // (en este ejemplo simple, se reenvía lo mismo)
            cmd_tx.torque = data_rx.torque;

            // Enviar el comando de torque
            uart.sendTorquePacket(cmd_tx);
        }

        // Esperar al siguiente periodo de control
        timer.waitNextTrigger();
    }

    cleanup_platform();
    return 0;
}
