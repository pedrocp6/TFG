set moduleName MultiPixStream2Bytes_Pipeline_VITIS_LOOP_821_1
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
set C_modelName {MultiPixStream2Bytes_Pipeline_VITIS_LOOP_821_1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ pix_3 int 8 regular  }
	{ pix_2 int 8 regular  }
	{ pix_1 int 8 regular  }
	{ pix int 8 regular  }
	{ trunc_ln805_1 int 10 regular {ap_stable 0} }
	{ bytePlanes_plane0 int 128 regular {fifo 1 volatile }  }
	{ icmp_ln809 int 1 regular {ap_stable 0} }
	{ icmp_ln826_2 int 1 regular {ap_stable 0} }
	{ icmp6 int 1 regular {ap_stable 0} }
	{ add_ln826 int 11 regular {ap_stable 0} }
	{ icmp_ln826 int 1 regular {ap_stable 0} }
	{ img int 48 regular {fifo 0 volatile }  }
	{ pix_15_out int 8 regular {pointer 1}  }
	{ pix_14_out int 8 regular {pointer 1}  }
	{ pix_13_out int 8 regular {pointer 1}  }
	{ pix_12_out int 8 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "pix_3", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pix_2", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pix_1", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pix", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln805_1", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes_plane0", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "icmp_ln809", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln826_2", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp6", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln826", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln826", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "img", "interface" : "fifo", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "pix_15_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pix_14_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pix_13_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pix_12_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ img_dout sc_in sc_lv 48 signal 11 } 
	{ img_empty_n sc_in sc_logic 1 signal 11 } 
	{ img_read sc_out sc_logic 1 signal 11 } 
	{ img_num_data_valid sc_in sc_lv 3 signal 11 } 
	{ img_fifo_cap sc_in sc_lv 3 signal 11 } 
	{ bytePlanes_plane0_din sc_out sc_lv 128 signal 5 } 
	{ bytePlanes_plane0_full_n sc_in sc_logic 1 signal 5 } 
	{ bytePlanes_plane0_write sc_out sc_logic 1 signal 5 } 
	{ bytePlanes_plane0_num_data_valid sc_in sc_lv 32 signal 5 } 
	{ bytePlanes_plane0_fifo_cap sc_in sc_lv 32 signal 5 } 
	{ pix_3 sc_in sc_lv 8 signal 0 } 
	{ pix_2 sc_in sc_lv 8 signal 1 } 
	{ pix_1 sc_in sc_lv 8 signal 2 } 
	{ pix sc_in sc_lv 8 signal 3 } 
	{ trunc_ln805_1 sc_in sc_lv 10 signal 4 } 
	{ icmp_ln809 sc_in sc_lv 1 signal 6 } 
	{ icmp_ln826_2 sc_in sc_lv 1 signal 7 } 
	{ icmp6 sc_in sc_lv 1 signal 8 } 
	{ add_ln826 sc_in sc_lv 11 signal 9 } 
	{ icmp_ln826 sc_in sc_lv 1 signal 10 } 
	{ pix_15_out sc_out sc_lv 8 signal 12 } 
	{ pix_15_out_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ pix_14_out sc_out sc_lv 8 signal 13 } 
	{ pix_14_out_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ pix_13_out sc_out sc_lv 8 signal 14 } 
	{ pix_13_out_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ pix_12_out sc_out sc_lv 8 signal 15 } 
	{ pix_12_out_ap_vld sc_out sc_logic 1 outvld 15 } 
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
 	{ "name": "bytePlanes_plane0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "num_data_valid" }} , 
 	{ "name": "bytePlanes_plane0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "fifo_cap" }} , 
 	{ "name": "pix_3", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_3", "role": "default" }} , 
 	{ "name": "pix_2", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_2", "role": "default" }} , 
 	{ "name": "pix_1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_1", "role": "default" }} , 
 	{ "name": "pix", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix", "role": "default" }} , 
 	{ "name": "trunc_ln805_1", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "trunc_ln805_1", "role": "default" }} , 
 	{ "name": "icmp_ln809", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln809", "role": "default" }} , 
 	{ "name": "icmp_ln826_2", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln826_2", "role": "default" }} , 
 	{ "name": "icmp6", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp6", "role": "default" }} , 
 	{ "name": "add_ln826", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "add_ln826", "role": "default" }} , 
 	{ "name": "icmp_ln826", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln826", "role": "default" }} , 
 	{ "name": "pix_15_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_15_out", "role": "default" }} , 
 	{ "name": "pix_15_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pix_15_out", "role": "ap_vld" }} , 
 	{ "name": "pix_14_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_14_out", "role": "default" }} , 
 	{ "name": "pix_14_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pix_14_out", "role": "ap_vld" }} , 
 	{ "name": "pix_13_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_13_out", "role": "default" }} , 
 	{ "name": "pix_13_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pix_13_out", "role": "ap_vld" }} , 
 	{ "name": "pix_12_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_12_out", "role": "default" }} , 
 	{ "name": "pix_12_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pix_12_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	MultiPixStream2Bytes_Pipeline_VITIS_LOOP_821_1 {
		pix_3 {Type I LastRead 0 FirstWrite -1}
		pix_2 {Type I LastRead 0 FirstWrite -1}
		pix_1 {Type I LastRead 0 FirstWrite -1}
		pix {Type I LastRead 0 FirstWrite -1}
		trunc_ln805_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 5}
		icmp_ln809 {Type I LastRead 0 FirstWrite -1}
		icmp_ln826_2 {Type I LastRead 0 FirstWrite -1}
		icmp6 {Type I LastRead 0 FirstWrite -1}
		add_ln826 {Type I LastRead 0 FirstWrite -1}
		icmp_ln826 {Type I LastRead 0 FirstWrite -1}
		img {Type I LastRead 4 FirstWrite -1}
		pix_15_out {Type O LastRead -1 FirstWrite 1}
		pix_14_out {Type O LastRead -1 FirstWrite 1}
		pix_13_out {Type O LastRead -1 FirstWrite 1}
		pix_12_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "2883"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "2882"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	pix_3 { ap_none {  { pix_3 in_data 0 8 } } }
	pix_2 { ap_none {  { pix_2 in_data 0 8 } } }
	pix_1 { ap_none {  { pix_1 in_data 0 8 } } }
	pix { ap_none {  { pix in_data 0 8 } } }
	trunc_ln805_1 { ap_stable {  { trunc_ln805_1 in_data 0 10 } } }
	bytePlanes_plane0 { ap_fifo {  { bytePlanes_plane0_din fifo_data_out 1 128 }  { bytePlanes_plane0_full_n fifo_status_empty 0 1 }  { bytePlanes_plane0_write fifo_data_in 1 1 }  { bytePlanes_plane0_num_data_valid fifo_update 0 32 }  { bytePlanes_plane0_fifo_cap fifo_data 0 32 } } }
	icmp_ln809 { ap_stable {  { icmp_ln809 in_data 0 1 } } }
	icmp_ln826_2 { ap_stable {  { icmp_ln826_2 in_data 0 1 } } }
	icmp6 { ap_stable {  { icmp6 in_data 0 1 } } }
	add_ln826 { ap_stable {  { add_ln826 in_data 0 11 } } }
	icmp_ln826 { ap_stable {  { icmp_ln826 in_data 0 1 } } }
	img { ap_fifo {  { img_dout fifo_data_out 0 48 }  { img_empty_n fifo_status_empty 0 1 }  { img_read fifo_data_in 1 1 }  { img_num_data_valid fifo_update 0 3 }  { img_fifo_cap fifo_data 0 3 } } }
	pix_15_out { ap_vld {  { pix_15_out out_data 1 8 }  { pix_15_out_ap_vld out_vld 1 1 } } }
	pix_14_out { ap_vld {  { pix_14_out out_data 1 8 }  { pix_14_out_ap_vld out_vld 1 1 } } }
	pix_13_out { ap_vld {  { pix_13_out out_data 1 8 }  { pix_13_out_ap_vld out_vld 1 1 } } }
	pix_12_out { ap_vld {  { pix_12_out out_data 1 8 }  { pix_12_out_ap_vld out_vld 1 1 } } }
}
