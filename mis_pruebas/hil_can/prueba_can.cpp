#include <cstdio>
#include <cstdint>
#include <cstring>

// --- LIBRERÍAS DE XILINX ---
#include "platform.h"
#include "xparameters.h"
#include "xtime_l.h"
#include "xcanps.h"

// ============================================================================
// CONFIGURACIÓN DE TIEMPOS Y HARDWARE
// ============================================================================
constexpr uint32_t FRECUENCIA_HZ = 100;
constexpr uint32_t CUENTAS_POR_LOOP = (COUNTS_PER_SECOND / FRECUENCIA_HZ);

// ID del dispositivo CAN
#define CAN_DEVICE_ID XPAR_XCANPS_0_DEVICE_ID

// ============================================================================
// ESTRUCTURA DE DATOS A ENVIAR
// ============================================================================
struct CarStatusPayload {
    float fx_request;
    uint32_t loop_counter;

    CarStatusPayload() : fx_request(0.0f), loop_counter(0) {}
};

// ============================================================================
// CLASE CAN MODULAR (Corregida basándonos en xcanps_polled_example.c)
// ============================================================================
class CANComm {
private:
    XCanPs CanInst;

public:
    bool init(uint16_t device_id) {
        XCanPs_Config *Config;

        // 1. Buscar configuración
        Config = XCanPs_LookupConfig(device_id);
        if (Config == nullptr) {
            printf("Error: No se encuentra el periferico CAN.\r\n");
            return false;
        }

        // 2. Inicializar el driver
        if (XCanPs_CfgInitialize(&CanInst, Config, Config->BaseAddr) != XST_SUCCESS) {
            printf("Error: Fallo al inicializar el CAN.\r\n");
            return false;
        }

        // 3. NUEVO: Ejecutar Self-Test recomendado por Xilinx
        if (XCanPs_SelfTest(&CanInst) != XST_SUCCESS) {
            printf("Error: El Self-Test del CAN ha fallado. Revisa el reloj en Vivado.\r\n");
            return false;
        }

        // 4. Entrar en modo configuración
        XCanPs_EnterMode(&CanInst, XCANPS_MODE_CONFIG);
        while (XCanPs_GetMode(&CanInst) != XCANPS_MODE_CONFIG);

        // 5. CONFIGURACIÓN A 1 Mbps (Asumiendo reloj base de 100 MHz)
        XCanPs_SetBaudRatePrescaler(&CanInst, 5);
        XCanPs_SetBitTiming(&CanInst, 0, 3, 14);

        // 6. Activar modo normal
        XCanPs_EnterMode(&CanInst, XCANPS_MODE_NORMAL);
        while (XCanPs_GetMode(&CanInst) != XCANPS_MODE_NORMAL);

        printf("CAN Inicializado correctamente a 1 Mbps.\r\n");
        return true;
    }

    bool sendStandardMessage(uint32_t can_id, const void* data, uint8_t length) {
        if (length > 8) return false;

        uint32_t TxFrame[4] = {0, 0, 0, 0};

        TxFrame[0] = (uint32_t)XCanPs_CreateIdValue(can_id, 0, 0, 0, 0);
        TxFrame[1] = (uint32_t)XCanPs_CreateDlcValue(length);

        uint8_t* frame_data = (uint8_t*)&TxFrame[2];
        memcpy(frame_data, data, length);

        // NUEVO: Esperar activamente a que el TX FIFO tenga hueco libre
        // Previsto en los ejemplos de Xilinx para evitar sobreescritura.
        while (XCanPs_IsTxFifoFull(&CanInst) == TRUE);

        // Enviar al bus físico
        int Status = XCanPs_Send(&CanInst, TxFrame);
        return (Status == XST_SUCCESS);
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
// MAIN
// ============================================================================
int main() {
    init_platform();
    printf("--- Iniciando Simulacion HIL por CAN a 1 Mbps ---\r\n");

    CANComm can_bus;

    if (!can_bus.init(CAN_DEVICE_ID)) {
        printf("Fallo crítico: Sistema detenido.\r\n");
        while(1);
    }

    Timer timer(CUENTAS_POR_LOOP);
    CarStatusPayload my_payload;
    uint32_t can_id_to_send = 0x100;

    while (true) {
        timer.waitNextTrigger();

        my_payload.fx_request = 1500.5f;
        my_payload.loop_counter++;

        can_bus.sendStandardMessage(can_id_to_send, &my_payload, sizeof(CarStatusPayload));
    }

    cleanup_platform();
    return 0;
}
