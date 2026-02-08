/******************************************************************************
 *
 * Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Use of the Software is limited solely to applications:
 * (a) running on a Xilinx device, or
 * (b) that interact with a Xilinx device through a bus or interconnect.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
 * OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * Except as contained in this notice, the name of the Xilinx shall not be used
 * in advertising or otherwise to promote the sale, use or other dealings in
 * this Software without prior written authorization from Xilinx.
 *
 ******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
// #include "xil_printf.h" // Debuggear con prinf
#include "xuartps_hw.h"		// Información del hardware. Dirección UART
#include "xparameters.h"	// Información del hardware. Dirección UART, temporizador
// #include "sleep.h"		// Usar usleep
#include "xtime_l.h"		// Temporizador

// Dirección base de la UART
#define UART_BASEADDR XPAR_XUARTPS_0_BASEADDR

// Frecuencia del temporizador
#define FRECUENCIA_HZ 100
#define CUENTAS_POR_LOOP (COUNTS_PER_SECOND / FRECUENCIA_HZ)

// --- Estructuras para el envío y recibo de bits ---

// Estructura de los torques
typedef struct {
	float torque_FL;
	float torque_FR;
	float torque_RL;
	float torque_RR;
} TorqueValues;

// Comanda de par que se envía
typedef union {
	TorqueValues torque;
	unsigned char bytes[16];
} cmd;

// Datos que se reciben del vehículo
typedef struct {
	float load_cell;
} CocheData;

// Comanda de par que se envía
typedef union {
	TorqueValues torque;
	unsigned char bytes[16]; // 2 floats * 4 bytes = 8 bytes
} ReceiverUnion;

// Declaración para recibir los datos
ReceiverUnion rx_buffer;

// Función para mandar bytes por UART
void outbyte(char c);


// --- FUNCIÓN DE LECTURA ---
// Intenta leer un paquete completo. Devuelve 1 si recibió datos nuevos, 0 si no.
int leer_datos_coche() {
	static int estado = 0; // 0: Buscando Header 1, 1: Buscando Header 2, 2: Leyendo Datos
	static int indice_bytes = 0;

	// Mientras haya bytes esperando en el puerto serie...
	while (XUartPs_IsReceiveData(UART_BASEADDR)) {
		// Se lee un byte del hardware
		u8 byte_leido = XUartPs_ReadReg(UART_BASEADDR, XUARTPS_FIFO_OFFSET);

		switch (estado) {
		case 0: // Buscando primera cabecera (0xCA = 202)
			if (byte_leido == 0xCA) estado = 1;
			break;

		case 1: // Buscando segunda cabecera (0xFE = 254)
			if (byte_leido == 0xFE) {
				estado = 2;
				indice_bytes = 0; // Preparamos para leer el contenido
			} else {
				estado = 0; // Falsa alarma, volvemos a empezar
			}
			break;

		case 2: // Leyendo el cuerpo del mensaje
			rx_buffer.bytes[indice_bytes] = byte_leido;
			indice_bytes++;

			// Si ya hemos leído todos los bytes
			if (indice_bytes >= 16) {
				estado = 0; // Reiniciamos para el próximo paquete
				return 1;   // ¡ÉXITO! Tenemos datos nuevos
			}
			break;
		}
	}
	return 0; // No se completó ningún paquete en esta vuelta
}

int main() {
	// Inicialización de la placa
	init_platform();

	// Inicialización de las variables
	cmd cmd;
	cmd.torque.torque_FL = 0.0;
	cmd.torque.torque_FR = 0.0;
	cmd.torque.torque_RL = 0.0;
	cmd.torque.torque_RR = 0.0;

	rx_buffer.torque.torque_FL = 0.0;
	rx_buffer.torque.torque_FR = 0.0;
	rx_buffer.torque.torque_RL = 0.0;
	rx_buffer.torque.torque_RR = 0.0;

	// Declaración del temporizador
	XTime t_proximo_disparo;
	XTime t_actual;


	// Se toma el tiempo actual como referencia inicial
	XTime_GetTime(&t_proximo_disparo);

	// Se programa el primer disparo para dentro de 1 periodo
	t_proximo_disparo += CUENTAS_POR_LOOP;

	while(1) {
		// Si se leen datos correctamente, se entra al bucle de control
		if (leer_datos_coche()) {

			// En este caso, se envía lo mismo que se recibe
			cmd.torque.torque_FL = rx_buffer.torque.torque_FL;
			cmd.torque.torque_FR = rx_buffer.torque.torque_FR;
			cmd.torque.torque_RL = rx_buffer.torque.torque_RL;
			cmd.torque.torque_RR = rx_buffer.torque.torque_RR;

			// Enviar la cabecera
			outbyte(0xAB);
			outbyte(0xCD);

			// Enviar todos los bytes del dato
			for(int k=0; k<16; k++){
				outbyte(cmd.bytes[k]);
			}

			// Espera menos precisa, no depende del tiempo de procesamiento de los datos anteriores
			// usleep(10000); // 10ms (100 Hz)
		}

		// Espera del temporizador
		do {
			XTime_GetTime(&t_actual);
		} while (t_actual < t_proximo_disparo);

		// Actualización del temporizador
		t_proximo_disparo += CUENTAS_POR_LOOP;

	}

	cleanup_platform();
	return 0;
}
