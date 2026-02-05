set moduleName MultiPixStream2Bytes_Pipeline_VITIS_LOOP_904_8
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
set C_modelName {MultiPixStream2Bytes_Pipeline_VITIS_LOOP_904_8}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ pix_11 int 8 regular  }
	{ pix_10 int 8 regular  }
	{ pix_9 int 8 regular  }
	{ pix_8 int 8 regular  }
	{ loopWidth_2 int 10 regular {ap_stable 0} }
	{ bytePlanes_plane1 int 128 regular {fifo 1 volatile }  }
	{ bytePlanes_plane0 int 128 regular {fifo 1 volatile }  }
	{ VideoFormat_val int 5 regular {ap_stable 0} }
	{ empty int 1 regular  }
	{ icmp_ln892 int 1 regular {ap_stable 0} }
	{ icmp_ln909_6 int 1 regular {ap_stable 0} }
	{ icmp_ln909_5 int 1 regular {ap_stable 0} }
	{ icmp_ln909_4 int 1 regular {ap_stable 0} }
	{ icmp15 int 1 regular {ap_stable 0} }
	{ icmp_ln909_2 int 1 regular {ap_stable 0} }
	{ icmp12 int 1 regular {ap_stable 0} }
	{ sext_ln909 int 11 regular {ap_stable 0} }
	{ icmp_ln909 int 1 regular {ap_stable 0} }
	{ img int 48 regular {fifo 0 volatile }  }
	{ pix_23_out int 8 regular {pointer 1}  }
	{ pix_22_out int 8 regular {pointer 1}  }
	{ pix_21_out int 8 regular {pointer 1}  }
	{ pix_20_out int 8 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "pix_11", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pix_10", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pix_9", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pix_8", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "loopWidth_2", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes_plane1", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bytePlanes_plane0", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "VideoFormat_val", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln892", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln909_6", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln909_5", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln909_4", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp15", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln909_2", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp12", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln909", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln909", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "img", "interface" : "fifo", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "pix_23_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pix_22_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pix_21_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pix_20_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 45
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ img_dout sc_in sc_lv 48 signal 18 } 
	{ img_empty_n sc_in sc_logic 1 signal 18 } 
	{ img_read sc_out sc_logic 1 signal 18 } 
	{ img_num_data_valid sc_in sc_lv 3 signal 18 } 
	{ img_fifo_cap sc_in sc_lv 3 signal 18 } 
	{ bytePlanes_plane0_din sc_out sc_lv 128 signal 6 } 
	{ bytePlanes_plane0_full_n sc_in sc_logic 1 signal 6 } 
	{ bytePlanes_plane0_write sc_out sc_logic 1 signal 6 } 
	{ bytePlanes_plane0_num_data_valid sc_in sc_lv 9 signal 6 } 
	{ bytePlanes_plane0_fifo_cap sc_in sc_lv 9 signal 6 } 
	{ bytePlanes_plane1_din sc_out sc_lv 128 signal 5 } 
	{ bytePlanes_plane1_full_n sc_in sc_logic 1 signal 5 } 
	{ bytePlanes_plane1_write sc_out sc_logic 1 signal 5 } 
	{ bytePlanes_plane1_num_data_valid sc_in sc_lv 9 signal 5 } 
	{ bytePlanes_plane1_fifo_cap sc_in sc_lv 9 signal 5 } 
	{ pix_11 sc_in sc_lv 8 signal 0 } 
	{ pix_10 sc_in sc_lv 8 signal 1 } 
	{ pix_9 sc_in sc_lv 8 signal 2 } 
	{ pix_8 sc_in sc_lv 8 signal 3 } 
	{ loopWidth_2 sc_in sc_lv 10 signal 4 } 
	{ VideoFormat_val sc_in sc_lv 5 signal 7 } 
	{ empty sc_in sc_lv 1 signal 8 } 
	{ icmp_ln892 sc_in sc_lv 1 signal 9 } 
	{ icmp_ln909_6 sc_in sc_lv 1 signal 10 } 
	{ icmp_ln909_5 sc_in sc_lv 1 signal 11 } 
	{ icmp_ln909_4 sc_in sc_lv 1 signal 12 } 
	{ icmp15 sc_in sc_lv 1 signal 13 } 
	{ icmp_ln909_2 sc_in sc_lv 1 signal 14 } 
	{ icmp12 sc_in sc_lv 1 signal 15 } 
	{ sext_ln909 sc_in sc_lv 11 signal 16 } 
	{ icmp_ln909 sc_in sc_lv 1 signal 17 } 
	{ pix_23_out sc_out sc_lv 8 signal 19 } 
	{ pix_23_out_ap_vld sc_out sc_logic 1 outvld 19 } 
	{ pix_22_out sc_out sc_lv 8 signal 20 } 
	{ pix_22_out_ap_vld sc_out sc_logic 1 outvld 20 } 
	{ pix_21_out sc_out sc_lv 8 signal 21 } 
	{ pix_21_out_ap_vld sc_out sc_logic 1 outvld 21 } 
	{ pix_20_out sc_out sc_lv 8 signal 22 } 
	{ pix_20_out_ap_vld sc_out sc_logic 1 outvld 22 } 
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
 	{ "name": "bytePlanes_plane1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "din" }} , 
 	{ "name": "bytePlanes_plane1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "full_n" }} , 
 	{ "name": "bytePlanes_plane1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "write" }} , 
 	{ "name": "bytePlanes_plane1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "num_data_valid" }} , 
 	{ "name": "bytePlanes_plane1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "fifo_cap" }} , 
 	{ "name": "pix_11", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_11", "role": "default" }} , 
 	{ "name": "pix_10", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_10", "role": "default" }} , 
 	{ "name": "pix_9", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_9", "role": "default" }} , 
 	{ "name": "pix_8", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_8", "role": "default" }} , 
 	{ "name": "loopWidth_2", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "loopWidth_2", "role": "default" }} , 
 	{ "name": "VideoFormat_val", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "VideoFormat_val", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "icmp_ln892", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln892", "role": "default" }} , 
 	{ "name": "icmp_ln909_6", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln909_6", "role": "default" }} , 
 	{ "name": "icmp_ln909_5", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln909_5", "role": "default" }} , 
 	{ "name": "icmp_ln909_4", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln909_4", "role": "default" }} , 
 	{ "name": "icmp15", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp15", "role": "default" }} , 
 	{ "name": "icmp_ln909_2", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln909_2", "role": "default" }} , 
 	{ "name": "icmp12", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp12", "role": "default" }} , 
 	{ "name": "sext_ln909", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "sext_ln909", "role": "default" }} , 
 	{ "name": "icmp_ln909", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln909", "role": "default" }} , 
 	{ "name": "pix_23_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_23_out", "role": "default" }} , 
 	{ "name": "pix_23_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pix_23_out", "role": "ap_vld" }} , 
 	{ "name": "pix_22_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_22_out", "role": "default" }} , 
 	{ "name": "pix_22_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pix_22_out", "role": "ap_vld" }} , 
 	{ "name": "pix_21_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_21_out", "role": "default" }} , 
 	{ "name": "pix_21_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pix_21_out", "role": "ap_vld" }} , 
 	{ "name": "pix_20_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pix_20_out", "role": "default" }} , 
 	{ "name": "pix_20_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pix_20_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	MultiPixStream2Bytes_Pipeline_VITIS_LOOP_904_8 {
		pix_11 {Type I LastRead 0 FirstWrite -1}
		pix_10 {Type I LastRead 0 FirstWrite -1}
		pix_9 {Type I LastRead 0 FirstWrite -1}
		pix_8 {Type I LastRead 0 FirstWrite -1}
		loopWidth_2 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane1 {Type O LastRead -1 FirstWrite 9}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 9}
		VideoFormat_val {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		icmp_ln892 {Type I LastRead 0 FirstWrite -1}
		icmp_ln909_6 {Type I LastRead 0 FirstWrite -1}
		icmp_ln909_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln909_4 {Type I LastRead 0 FirstWrite -1}
		icmp15 {Type I LastRead 0 FirstWrite -1}
		icmp_ln909_2 {Type I LastRead 0 FirstWrite -1}
		icmp12 {Type I LastRead 0 FirstWrite -1}
		sext_ln909 {Type I LastRead 0 FirstWrite -1}
		icmp_ln909 {Type I LastRead 0 FirstWrite -1}
		img {Type I LastRead 8 FirstWrite -1}
		pix_23_out {Type O LastRead -1 FirstWrite 1}
		pix_22_out {Type O LastRead -1 FirstWrite 1}
		pix_21_out {Type O LastRead -1 FirstWrite 1}
		pix_20_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "5763"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "5762"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	pix_11 { ap_none {  { pix_11 in_data 0 8 } } }
	pix_10 { ap_none {  { pix_10 in_data 0 8 } } }
	pix_9 { ap_none {  { pix_9 in_data 0 8 } } }
	pix_8 { ap_none {  { pix_8 in_data 0 8 } } }
	loopWidth_2 { ap_stable {  { loopWidth_2 in_data 0 10 } } }
	bytePlanes_plane1 { ap_fifo {  { bytePlanes_plane1_din fifo_data_out 1 128 }  { bytePlanes_plane1_full_n fifo_status_empty 0 1 }  { bytePlanes_plane1_write fifo_data_in 1 1 }  { bytePlanes_plane1_num_data_valid fifo_update 0 9 }  { bytePlanes_plane1_fifo_cap fifo_data 0 9 } } }
	bytePlanes_plane0 { ap_fifo {  { bytePlanes_plane0_din fifo_data_out 1 128 }  { bytePlanes_plane0_full_n fifo_status_empty 0 1 }  { bytePlanes_plane0_write fifo_data_in 1 1 }  { bytePlanes_plane0_num_data_valid fifo_update 0 9 }  { bytePlanes_plane0_fifo_cap fifo_data 0 9 } } }
	VideoFormat_val { ap_stable {  { VideoFormat_val in_data 0 5 } } }
	empty { ap_none {  { empty in_data 0 1 } } }
	icmp_ln892 { ap_stable {  { icmp_ln892 in_data 0 1 } } }
	icmp_ln909_6 { ap_stable {  { icmp_ln909_6 in_data 0 1 } } }
	icmp_ln909_5 { ap_stable {  { icmp_ln909_5 in_data 0 1 } } }
	icmp_ln909_4 { ap_stable {  { icmp_ln909_4 in_data 0 1 } } }
	icmp15 { ap_stable {  { icmp15 in_data 0 1 } } }
	icmp_ln909_2 { ap_stable {  { icmp_ln909_2 in_data 0 1 } } }
	icmp12 { ap_stable {  { icmp12 in_data 0 1 } } }
	sext_ln909 { ap_stable {  { sext_ln909 in_data 0 11 } } }
	icmp_ln909 { ap_stable {  { icmp_ln909 in_data 0 1 } } }
	img { ap_fifo {  { img_dout fifo_data_out 0 48 }  { img_empty_n fifo_status_empty 0 1 }  { img_read fifo_data_in 1 1 }  { img_num_data_valid fifo_update 0 3 }  { img_fifo_cap fifo_data 0 3 } } }
	pix_23_out { ap_vld {  { pix_23_out out_data 1 8 }  { pix_23_out_ap_vld out_vld 1 1 } } }
	pix_22_out { ap_vld {  { pix_22_out out_data 1 8 }  { pix_22_out_ap_vld out_vld 1 1 } } }
	pix_21_out { ap_vld {  { pix_21_out out_data 1 8 }  { pix_21_out_ap_vld out_vld 1 1 } } }
	pix_20_out { ap_vld {  { pix_20_out out_data 1 8 }  { pix_20_out_ap_vld out_vld 1 1 } } }
}
