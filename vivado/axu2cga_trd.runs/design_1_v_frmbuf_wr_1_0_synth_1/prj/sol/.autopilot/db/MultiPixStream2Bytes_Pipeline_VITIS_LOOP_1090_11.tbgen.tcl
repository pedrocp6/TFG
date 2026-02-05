set moduleName MultiPixStream2Bytes_Pipeline_VITIS_LOOP_1090_11
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set isPipelined_legacy 1
set pipeline_type loop_auto_rewind
set FunctionProtocol ap_ctrl_hs
set restart_counter_num 0
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 17
set C_modelName {MultiPixStream2Bytes_Pipeline_VITIS_LOOP_1090_11}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ pix_29 int 8 regular  }
	{ pix_28 int 8 regular  }
	{ pix_27 int 8 regular  }
	{ pix_26 int 8 regular  }
	{ pix_25 int 8 regular  }
	{ pix_24 int 8 regular  }
	{ trunc_ln1 int 8 regular {ap_stable 0} }
	{ icmp_ln1110_1 int 1 regular {ap_stable 0} }
	{ bytePlanes_plane0 int 128 regular {fifo 1 volatile }  }
	{ empty int 1 regular {ap_stable 0} }
	{ icmp_ln1077 int 1 regular {ap_stable 0} }
	{ icmp_ln1095_6 int 1 regular {ap_stable 0} }
	{ icmp_ln1095_5 int 1 regular {ap_stable 0} }
	{ icmp_ln1095_4 int 1 regular {ap_stable 0} }
	{ icmp21 int 1 regular {ap_stable 0} }
	{ icmp_ln1095_2 int 1 regular {ap_stable 0} }
	{ icmp18 int 1 regular {ap_stable 0} }
	{ add_ln1095 int 9 regular {ap_stable 0} }
	{ icmp_ln1095 int 1 regular {ap_stable 0} }
	{ img int 48 regular {fifo 0 volatile }  }
	{ pix_39_out int 8 regular {pointer 1}  }
	{ pix_38_out int 8 regular {pointer 1}  }
	{ pix_33_out int 8 regular {pointer 1}  }
	{ pix_32_out int 8 regular {pointer 1}  }
	{ pix_31_out int 8 regular {pointer 1}  }
	{ pix_30_out int 8 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "pix_29", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pix_28", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pix_27", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pix_26", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pix_25", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pix_24", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln1", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1110_1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes_plane0", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1077", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1095_6", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1095_5", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1095_4", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp21", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1095_2", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp18", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln1095", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1095", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "img", "interface" : "fifo", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "pix_39_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pix_38_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pix_33_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pix_32_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pix_31_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pix_30_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 46
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ img_dout sc_in sc_lv 48 signal 19 } 
	{ img_empty_n sc_in sc_logic 1 signal 19 } 
	{ img_read sc_out sc_logic 1 signal 19 } 
	{ img_num_data_valid sc_in sc_lv 3 signal 19 } 
	{ img_fifo_cap sc_in sc_lv 3 signal 19 } 
	{ bytePlanes_plane0_din sc_out sc_lv 128 signal 8 } 
	{ bytePlanes_plane0_full_n sc_in sc_logic 1 signal 8 } 
	{ bytePlanes_plane0_write sc_out sc_logic 1 signal 8 } 
	{ bytePlanes_plane0_num_data_valid sc_in sc_lv 9 signal 8 } 
	{ bytePlanes_plane0_fifo_cap sc_in sc_lv 9 signal 8 } 
	{ pix_29 sc_in sc_lv 8 signal 0 } 
	{ pix_28 sc_in sc_lv 8 signal 1 } 
	{ pix_27 sc_in sc_lv 8 signal 2 } 
	{ pix_26 sc_in sc_lv 8 signal 3 } 
	{ pix_25 sc_in sc_lv 8 signal 4 } 
	{ pix_24 sc_in sc_lv 8 signal 5 } 
	{ trunc_ln1 sc_in sc_lv 8 signal 6 } 
	{ icmp_ln1110_1 sc_in sc_lv 1 signal 7 } 
	{ empty sc_in sc_lv 1 signal 9 } 
	{ icmp_ln1077 sc_in sc_lv 1 signal 10 } 
	{ icmp_ln1095_6 sc_in sc_lv 1 signal 11 } 
	{ icmp_ln1095_5 sc_in sc_lv 1 signal 12 } 
	{ icmp_ln1095_4 sc_in sc_lv 1 signal 13 } 
	{ icmp21 sc_in sc_lv 1 signal 14 } 
	{ icmp_ln1095_2 sc_in sc_lv 1 signal 15 } 
	{ icmp18 sc_in sc_lv 1 signal 16 } 
	{ add_ln1095 sc_in sc_lv 9 signal 17 } 
	{ icmp_ln1095 sc_in sc_lv 1 signal 18 } 
	{ pix_39_out sc_out sc_lv 8 signal 20 } 
	{ pix_39_out_ap_vld sc_out sc_logic 1 outvld 20 } 
	{ pix_38_out sc_out sc_lv 8 signal 21 } 
	{ pix_38_out_ap_vld sc_out sc_logic 1 outvld 21 } 
	{ pix_33_out sc_out sc_lv 8 signal 22 } 
	{ pix_33_out_ap_vld sc_out sc_logic 1 outvld 22 } 
	{ pix_32_out sc_out sc_lv 8 signal 23 } 
	{ pix_32_out_ap_vld sc_out sc_logic 1 outvld 23 } 
	{ pix_31_out sc_out sc_lv 8 signal 24 } 
	{ pix_31_out_ap_vld sc_out sc_logic 1 outvld 24 } 
	{ pix_30_out sc_out sc_lv 8 signal 25 } 
	{ pix_30_out_ap_vld sc_out sc_logic 1 outvld 25 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "img_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "img", "role": "dout" }} , 
 	{ "name": "img_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img", "role": "empty_n" }} , 
 	{ "name": "img_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img", "role": "read" }} , 
 	{ "name": "img_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "img", "role": "num_data_valid" }} , 
 	{ "name": "img_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "img", "role": "fifo_cap" }} , 
 	{ "name": "bytePlanes_plane0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "din" }} , 
 	{ "name": "bytePlanes_plane0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "full_n" }} , 
 	{ "name": "bytePlanes_plane0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "write" }} , 
 	{ "name": "bytePlanes_plane0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "num_data_valid" }} , 
 	{ "name": "bytePlanes_plane0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "fifo_cap" }} , 
 	{ "name": "pix_29", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_29", "role": "default" }} , 
 	{ "name": "pix_28", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_28", "role": "default" }} , 
 	{ "name": "pix_27", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_27", "role": "default" }} , 
 	{ "name": "pix_26", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_26", "role": "default" }} , 
 	{ "name": "pix_25", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_25", "role": "default" }} , 
 	{ "name": "pix_24", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_24", "role": "default" }} , 
 	{ "name": "trunc_ln1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "trunc_ln1", "role": "default" }} , 
 	{ "name": "icmp_ln1110_1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1110_1", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "icmp_ln1077", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1077", "role": "default" }} , 
 	{ "name": "icmp_ln1095_6", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1095_6", "role": "default" }} , 
 	{ "name": "icmp_ln1095_5", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1095_5", "role": "default" }} , 
 	{ "name": "icmp_ln1095_4", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1095_4", "role": "default" }} , 
 	{ "name": "icmp21", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp21", "role": "default" }} , 
 	{ "name": "icmp_ln1095_2", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1095_2", "role": "default" }} , 
 	{ "name": "icmp18", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp18", "role": "default" }} , 
 	{ "name": "add_ln1095", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "add_ln1095", "role": "default" }} , 
 	{ "name": "icmp_ln1095", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1095", "role": "default" }} , 
 	{ "name": "pix_39_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_39_out", "role": "default" }} , 
 	{ "name": "pix_39_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pix_39_out", "role": "ap_vld" }} , 
 	{ "name": "pix_38_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_38_out", "role": "default" }} , 
 	{ "name": "pix_38_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pix_38_out", "role": "ap_vld" }} , 
 	{ "name": "pix_33_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_33_out", "role": "default" }} , 
 	{ "name": "pix_33_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pix_33_out", "role": "ap_vld" }} , 
 	{ "name": "pix_32_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_32_out", "role": "default" }} , 
 	{ "name": "pix_32_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pix_32_out", "role": "ap_vld" }} , 
 	{ "name": "pix_31_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_31_out", "role": "default" }} , 
 	{ "name": "pix_31_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pix_31_out", "role": "ap_vld" }} , 
 	{ "name": "pix_30_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_30_out", "role": "default" }} , 
 	{ "name": "pix_30_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pix_30_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	MultiPixStream2Bytes_Pipeline_VITIS_LOOP_1090_11 {
		pix_29 {Type I LastRead 0 FirstWrite -1}
		pix_28 {Type I LastRead 0 FirstWrite -1}
		pix_27 {Type I LastRead 0 FirstWrite -1}
		pix_26 {Type I LastRead 0 FirstWrite -1}
		pix_25 {Type I LastRead 0 FirstWrite -1}
		pix_24 {Type I LastRead 0 FirstWrite -1}
		trunc_ln1 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1110_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 4}
		empty {Type I LastRead 0 FirstWrite -1}
		icmp_ln1077 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1095_6 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1095_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1095_4 {Type I LastRead 0 FirstWrite -1}
		icmp21 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1095_2 {Type I LastRead 0 FirstWrite -1}
		icmp18 {Type I LastRead 0 FirstWrite -1}
		add_ln1095 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1095 {Type I LastRead 0 FirstWrite -1}
		img {Type I LastRead 8 FirstWrite -1}
		pix_39_out {Type O LastRead -1 FirstWrite 1}
		pix_38_out {Type O LastRead -1 FirstWrite 1}
		pix_33_out {Type O LastRead -1 FirstWrite 1}
		pix_32_out {Type O LastRead -1 FirstWrite 1}
		pix_31_out {Type O LastRead -1 FirstWrite 1}
		pix_30_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "1923"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "1922"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	pix_29 { ap_none {  { pix_29 in_data 0 8 } } }
	pix_28 { ap_none {  { pix_28 in_data 0 8 } } }
	pix_27 { ap_none {  { pix_27 in_data 0 8 } } }
	pix_26 { ap_none {  { pix_26 in_data 0 8 } } }
	pix_25 { ap_none {  { pix_25 in_data 0 8 } } }
	pix_24 { ap_none {  { pix_24 in_data 0 8 } } }
	trunc_ln1 { ap_stable {  { trunc_ln1 in_data 0 8 } } }
	icmp_ln1110_1 { ap_stable {  { icmp_ln1110_1 in_data 0 1 } } }
	bytePlanes_plane0 { ap_fifo {  { bytePlanes_plane0_din fifo_data_out 1 128 }  { bytePlanes_plane0_full_n fifo_status_empty 0 1 }  { bytePlanes_plane0_write fifo_data_in 1 1 }  { bytePlanes_plane0_num_data_valid fifo_update 0 9 }  { bytePlanes_plane0_fifo_cap fifo_data 0 9 } } }
	empty { ap_stable {  { empty in_data 0 1 } } }
	icmp_ln1077 { ap_stable {  { icmp_ln1077 in_data 0 1 } } }
	icmp_ln1095_6 { ap_stable {  { icmp_ln1095_6 in_data 0 1 } } }
	icmp_ln1095_5 { ap_stable {  { icmp_ln1095_5 in_data 0 1 } } }
	icmp_ln1095_4 { ap_stable {  { icmp_ln1095_4 in_data 0 1 } } }
	icmp21 { ap_stable {  { icmp21 in_data 0 1 } } }
	icmp_ln1095_2 { ap_stable {  { icmp_ln1095_2 in_data 0 1 } } }
	icmp18 { ap_stable {  { icmp18 in_data 0 1 } } }
	add_ln1095 { ap_stable {  { add_ln1095 in_data 0 9 } } }
	icmp_ln1095 { ap_stable {  { icmp_ln1095 in_data 0 1 } } }
	img { ap_fifo {  { img_dout fifo_data_out 0 48 }  { img_empty_n fifo_status_empty 0 1 }  { img_read fifo_data_in 1 1 }  { img_num_data_valid fifo_update 0 3 }  { img_fifo_cap fifo_data 0 3 } } }
	pix_39_out { ap_vld {  { pix_39_out out_data 1 8 }  { pix_39_out_ap_vld out_vld 1 1 } } }
	pix_38_out { ap_vld {  { pix_38_out out_data 1 8 }  { pix_38_out_ap_vld out_vld 1 1 } } }
	pix_33_out { ap_vld {  { pix_33_out out_data 1 8 }  { pix_33_out_ap_vld out_vld 1 1 } } }
	pix_32_out { ap_vld {  { pix_32_out out_data 1 8 }  { pix_32_out_ap_vld out_vld 1 1 } } }
	pix_31_out { ap_vld {  { pix_31_out out_data 1 8 }  { pix_31_out_ap_vld out_vld 1 1 } } }
	pix_30_out { ap_vld {  { pix_30_out out_data 1 8 }  { pix_30_out_ap_vld out_vld 1 1 } } }
}
