/******************************************************************************
 *
 * Copyright (C) 2010 - 2015 Xilinx, Inc.  All rights reserved.
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
/****************************************************************************/
/**
 *
 * @file xcanps_polled_example.c
 *
 * Contains an example of how to use the XCanPs driver directly.
 * This example shows the using the driver/device in polled mode.
 *
 * @note
 *
 * None.
 *
 * <pre>
 * MODIFICATION HISTORY:
 *
 * Ver   Who    Date	Changes
 * ----- -----  -------- -----------------------------------------------
 * 1.00a xd/sv  01/12/10 First release
 * 2.1 adk 		23/08/14 Fixed CR:798792 Peripheral test for CANPS IP in
 *						 SDK claims a 40kbps baud rate but it's not.
 * </pre>
 *
 ******************************************************************************/

/***************************** Include Files *********************************/

#include "xcanps.h"
#include "xparameters.h"
#include "xil_printf.h"
#include "sleep.h"

/************************** Constant Definitions *****************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define CAN_DEVICE_ID	XPAR_XCANPS_0_DEVICE_ID

/*
 * Maximum CAN frame length in words.
 */
#define XCANPS_MAX_FRAME_SIZE_IN_WORDS (XCANPS_MAX_FRAME_SIZE / sizeof(u32))

#define FRAME_DATA_LENGTH 		8  /* Frame Data field length */

/*
 * Message Id Constant.
 */
#define TEST_MESSAGE_ID			2000

/*
 * The Baud Rate Prescaler Register (BRPR) and Bit Timing Register (BTR)
 * are setup such that CAN baud rate equals 40Kbps, assuming that the
 * the CAN clock is 24MHz. The user needs to modify these values based on
 * the desired baud rate and the CAN clock frequency. For more information
 * see the CAN 2.0A, CAN 2.0B, ISO 11898-1 specifications.
 */

/*
 * Timing parameters to be set in the Bit Timing Register (BTR).
 * These values are for a 40 Kbps baudrate assuming the CAN input clock
 frequency
 * is 24 MHz.
 */
#define TEST_BTR_SYNCJUMPWIDTH		1	// 3	1
#define TEST_BTR_SECOND_TIMESEGMENT	3	// 2	2
#define TEST_BTR_FIRST_TIMESEGMENT	14	// 15	15

/*
 * The Baud rate Prescalar value in the Baud Rate Prescaler Register (BRPR)
 * needs to be set based on the input clock  frequency to the CAN core and
 * the desired CAN baud rate.
 * This value is for a 40 Kbps baudrate assuming the CAN input clock frequency
 * is 24 MHz.
 */
#define TEST_BRPR_BAUD_PRESCALAR	4	// 29	9

/**************************** Type Definitions *******************************/

/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/

int CanInitial(u16 DeviceId, XCanPs *CanPtr);
static int SendFrame(XCanPs *InstancePtr, u32 MessageId, u8 *MsgData, u8 DataLen);
static int RecvFrame(XCanPs *InstancePtr, u32 *RxId, u8 *RxData, u8 *RxLen);

/************************** Variable Definitions *****************************/

/*
 * Buffers to hold frames to send and receive. These are declared as global so
 * that they are not on the stack.
 * These buffers need to be 32-bit aligned
 */
static u32 TxFrame[XCANPS_MAX_FRAME_SIZE_IN_WORDS];
static u32 RxFrame[XCANPS_MAX_FRAME_SIZE_IN_WORDS];

/* Driver instance */
static XCanPs Can0;

/****************************************************************************/
/**
 *
 * This function is the main function of the Can polled example.
 *
 * @param	None
 *
 * @return
 *		- XST_SUCCESS if the example has completed successfully.
 *		- XST_FAILURE if the example has failed.
 *
 * @note		None
 *
 *****************************************************************************/
#ifndef TESTAPP_GEN
int main()
{
	int Status;
	u32 tx_counter = 0;

	xil_printf("CAN Polled Mode Example Test \r\n");

	/*
	 * Run the Can Polled example, specify the Device ID that is generated
	 * in xparameters.h .
	 */
	Status = CanInitial(XPAR_XCANPS_0_DEVICE_ID, &Can0);
	if (Status != XST_SUCCESS) {
		xil_printf("CAN Initial Failed\r\n");
		return XST_FAILURE;
	}
	xil_printf("CAN 0 Initial Successful\r\n");
	xil_printf("Iniciando transmision y recepcion CAN...\r\n");

	/* Preparamos nuestro mensaje y nuestra ID en el main */
	u32 my_can_id = 0x2A;
	u8 my_payload[8] = {0xDE, 0xAD, 0xBE, 0xEF, 0x00, 0x00, 0x00, 0x00};

	u32 my_can_id2 = 0x1A;
	u8 my_payload2[4] = {0x01, 0x02, 0x03, 0x04};

	/* Variables para recepcion */
	u32 rx_id = 0;
	u8 rx_data[8];
	u8 rx_len = 0;

	u16 valor_16bit = 0;

	while (1) {
		/* Enviar frames */
		Status = SendFrame(&Can0, my_can_id, my_payload, 8);
		Status = SendFrame(&Can0, my_can_id2, my_payload2, 4);
		if (Status != XST_SUCCESS) {
			xil_printf("X 0 Error mandando frame\r\n");
		}

		/* Intentar recibir (no bloqueante) */
		if (!XCanPs_IsRxEmpty(&Can0)) {
			Status = RecvFrame(&Can0, &rx_id, rx_data, &rx_len);
			if (Status == XST_SUCCESS) {
				/* Interpretar mensaje de 3 bytes:
				 * Bytes 0-1: número de 16 bits (little endian)
				 * Byte 2: otro número de 8 bits
				 */
				if (rx_len >= 3) {
					valor_16bit = (u16)(rx_data[0] | (rx_data[1] << 8));
					u8 valor_8bit = rx_data[2];

					xil_printf("RX: ID=0x%03X, Len=%d, Valor16=%u, Valor8=%u\r\n",
							   rx_id, rx_len, valor_16bit, valor_8bit);
				} else {
					xil_printf("RX: ID=0x%03X, Len=%d (insuficiente para interpretar)\r\n",
							   rx_id, rx_len);
				}
			}
		}

		/* Incrementar ultimo byte para ver cambios en PCAN */
		my_payload2[0]++;

		// Dividir en dos bytes (u8)
		my_payload[6] = (u8)(valor_16bit & 0xFF);        // LSB (Least Significant Byte)
		my_payload[7] = (u8)((valor_16bit >> 8) & 0xFF); // MSB (Most Significant Byte)
		my_payload[6]++;

		/* 100 Hz */
		usleep(10000);
	}
}
#endif

/*****************************************************************************/
/**
 *
 * The entry point for showing the XCanPs driver in polled mode. The example
 * configures the device for internal loop back mode, then sends a Can
 * frame, receives the same Can frame, and verifies the frame contents.
 *
 * @param	DeviceId is the XPAR_<CANPS_instance>_DEVICE_ID value from
 *		xparameters.h
 *
 * @return	XST_SUCCESS if successful, otherwise driver-specific error code.
 *
 * @note
 *
 * If the device is not working correctly, this function may enter an infinite
 * loop and will never return to the caller.
 *
 ******************************************************************************/
int CanInitial(u16 DeviceId, XCanPs *CanPtr)
{
	int Status;
	XCanPs *CanInstPtr = CanPtr ;
	XCanPs_Config *ConfigPtr;

	/*
	 * Initialize the Can device.
	 */
	ConfigPtr = XCanPs_LookupConfig(DeviceId);
	if (CanInstPtr == NULL) {
		return XST_FAILURE;
	}
	Status = XCanPs_CfgInitialize(CanInstPtr,
			ConfigPtr,
			ConfigPtr->BaseAddr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Run self-test on the device, which verifies basic sanity of the
	 * device and the driver.
	 */
	Status = XCanPs_SelfTest(CanInstPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enter Configuration Mode so we can setup Baud Rate Prescaler
	 * Register (BRPR) and Bit Timing Register (BTR).
	 */
	XCanPs_EnterMode(CanInstPtr, XCANPS_MODE_CONFIG);
	while(XCanPs_GetMode(CanInstPtr) != XCANPS_MODE_CONFIG);

	/*
	 * Setup Baud Rate Prescaler Register (BRPR) and
	 * Bit Timing Register (BTR).
	 */
	XCanPs_SetBaudRatePrescaler(CanInstPtr, TEST_BRPR_BAUD_PRESCALAR);
	Status = XCanPs_SetBitTiming(CanInstPtr, TEST_BTR_SYNCJUMPWIDTH,
			TEST_BTR_SECOND_TIMESEGMENT,
			TEST_BTR_FIRST_TIMESEGMENT);
	if (Status != XST_SUCCESS) {
	    xil_printf("ERROR: El hardware ha rechazado la configuracion de tiempos CAN.\r\n");
	}

	/*
	 * Enter Normal Mode.
	 */
	XCanPs_EnterMode(CanInstPtr, XCANPS_MODE_NORMAL);
	while(XCanPs_GetMode(CanInstPtr) != XCANPS_MODE_NORMAL);

	/* ========== DIAGNOSTIC: Read actual config ========== */
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

		xil_printf("\r\n=== CAN Config (read from registers) ===\r\n");
		xil_printf("BRPR=%lu, TSEG1=%lu, TSEG2=%lu, SJW=%lu\r\n",
				brpr_val, tseg1_val, tseg2_val, sjw_val);
		xil_printf("Prescaler=%lu, TQ_per_bit=%lu\r\n", prescaler, tq_per_bit);
		xil_printf("Baud Rate (assuming CAN_CLK):\r\n");
		xil_printf("  100 MHz -> %lu kbps\r\n", 100000 / (prescaler * tq_per_bit));
		xil_printf("========================================\r\n\r\n");
	}

	return Status;
}

/*****************************************************************************/
/**
 *
 * Send a CAN frame.
 *
 * @param	InstancePtr is a pointer to the driver instance
 *
 * @return	XST_SUCCESS if successful, a driver-specific return code if not.
 *
 * @note
 *
 * This function waits until TX FIFO has room for at least one frame before
 * sending a frame. So this function may block if the hardware is not built
 * correctly.
 *
 ******************************************************************************/
static int SendFrame(XCanPs *InstancePtr, u32 MessageId, u8 *MsgData, u8 DataLen)
{
	u8 *FramePtr;
	int Index;
	int Status;

	/*
	 * Configurar el ID (estándar, 11 bits) y el DLC (longitud de datos)
	 */
	TxFrame[0] = (u32)XCanPs_CreateIdValue(MessageId, 0, 0, 0, 0);
	TxFrame[1] = (u32)XCanPs_CreateDlcValue((u32)DataLen);

	/*
	 * Rellenar el array interno (TxFrame) con los datos que le hemos pasado
	 */
	FramePtr = (u8 *)(&TxFrame[2]);
	for (Index = 0; Index < DataLen; Index++) {
		*FramePtr++ = MsgData[Index];
	}

	/* Wait until TX FIFO has room. */
	while (XCanPs_IsTxFifoFull(InstancePtr) == TRUE);

	/* Send the frame */
	Status = XCanPs_Send(InstancePtr, TxFrame);

	return Status;
}


/*****************************************************************************/
/**
 *
 * Recibe un mensaje CAN y lo guarda en las variables proporcionadas.
 *
 * @param	InstancePtr puntero a la instancia del driver CAN
 * @param	RxId puntero donde se guardara el ID recibido
 * @param	RxData puntero al array donde se guardaran los datos
 * @param	RxLen puntero donde se guardara la longitud de datos recibidos
 *
 * @return	XST_SUCCESS si se recibio correctamente, XST_FAILURE si no
 *
 * @note	Esta funcion NO es bloqueante. El usuario debe verificar primero
 * 			que hay mensajes con XCanPs_IsRxEmpty() antes de llamarla.
 *
 ******************************************************************************/
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
