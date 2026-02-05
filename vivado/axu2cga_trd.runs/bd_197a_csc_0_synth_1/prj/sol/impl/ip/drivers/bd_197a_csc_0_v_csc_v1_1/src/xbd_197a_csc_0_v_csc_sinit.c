// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xbd_197a_csc_0_v_csc.h"

extern XBd_197a_csc_0_v_csc_Config XBd_197a_csc_0_v_csc_ConfigTable[];

#ifdef SDT
XBd_197a_csc_0_v_csc_Config *XBd_197a_csc_0_v_csc_LookupConfig(UINTPTR BaseAddress) {
	XBd_197a_csc_0_v_csc_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XBd_197a_csc_0_v_csc_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XBd_197a_csc_0_v_csc_ConfigTable[Index].Bd_197a_csc_0_ctrl_BaseAddress == BaseAddress) {
			ConfigPtr = &XBd_197a_csc_0_v_csc_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XBd_197a_csc_0_v_csc_Initialize(XBd_197a_csc_0_v_csc *InstancePtr, UINTPTR BaseAddress) {
	XBd_197a_csc_0_v_csc_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XBd_197a_csc_0_v_csc_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XBd_197a_csc_0_v_csc_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XBd_197a_csc_0_v_csc_Config *XBd_197a_csc_0_v_csc_LookupConfig(u16 DeviceId) {
	XBd_197a_csc_0_v_csc_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XBD_197A_CSC_0_V_CSC_NUM_INSTANCES; Index++) {
		if (XBd_197a_csc_0_v_csc_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XBd_197a_csc_0_v_csc_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XBd_197a_csc_0_v_csc_Initialize(XBd_197a_csc_0_v_csc *InstancePtr, u16 DeviceId) {
	XBd_197a_csc_0_v_csc_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XBd_197a_csc_0_v_csc_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XBd_197a_csc_0_v_csc_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

