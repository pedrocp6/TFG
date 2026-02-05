set moduleName MultiPixStream2Bytes
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
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
set C_modelName {MultiPixStream2Bytes}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ img int 48 regular {fifo 0 volatile }  }
	{ bytePlanes_plane0 int 128 regular {fifo 1 volatile }  }
	{ bytePlanes_plane1 int 128 regular {fifo 1 volatile }  }
	{ Height_val int 11 regular {ap_stable 0} }
	{ WidthInPix_val int 11 regular {ap_stable 0} }
	{ WidthInBytes_val int 14 regular {ap_stable 0} }
	{ VideoFormat_val int 6 regular {ap_stable 0} }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "img", "interface" : "fifo", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes_plane0", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bytePlanes_plane1", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Height_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "WidthInPix_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "WidthInBytes_val", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "VideoFormat_val", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ img_dout sc_in sc_lv 48 signal 0 } 
	{ img_empty_n sc_in sc_logic 1 signal 0 } 
	{ img_read sc_out sc_logic 1 signal 0 } 
	{ img_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ img_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ bytePlanes_plane0_din sc_out sc_lv 128 signal 1 } 
	{ bytePlanes_plane0_full_n sc_in sc_logic 1 signal 1 } 
	{ bytePlanes_plane0_write sc_out sc_logic 1 signal 1 } 
	{ bytePlanes_plane0_num_data_valid sc_in sc_lv 32 signal 1 } 
	{ bytePlanes_plane0_fifo_cap sc_in sc_lv 32 signal 1 } 
	{ bytePlanes_plane1_din sc_out sc_lv 128 signal 2 } 
	{ bytePlanes_plane1_full_n sc_in sc_logic 1 signal 2 } 
	{ bytePlanes_plane1_write sc_out sc_logic 1 signal 2 } 
	{ bytePlanes_plane1_num_data_valid sc_in sc_lv 9 signal 2 } 
	{ bytePlanes_plane1_fifo_cap sc_in sc_lv 9 signal 2 } 
	{ Height_val sc_in sc_lv 11 signal 3 } 
	{ WidthInPix_val sc_in sc_lv 11 signal 4 } 
	{ WidthInBytes_val sc_in sc_lv 14 signal 5 } 
	{ VideoFormat_val sc_in sc_lv 6 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
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
 	{ "name": "bytePlanes_plane1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "din" }} , 
 	{ "name": "bytePlanes_plane1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "full_n" }} , 
 	{ "name": "bytePlanes_plane1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "write" }} , 
 	{ "name": "bytePlanes_plane1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "num_data_valid" }} , 
 	{ "name": "bytePlanes_plane1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "fifo_cap" }} , 
 	{ "name": "Height_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "Height_val", "role": "default" }} , 
 	{ "name": "WidthInPix_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "WidthInPix_val", "role": "default" }} , 
 	{ "name": "WidthInBytes_val", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "WidthInBytes_val", "role": "default" }} , 
 	{ "name": "VideoFormat_val", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "VideoFormat_val", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	MultiPixStream2Bytes {
		img {Type I LastRead 8 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 4}
		bytePlanes_plane1 {Type O LastRead -1 FirstWrite 9}
		Height_val {Type I LastRead 0 FirstWrite -1}
		WidthInPix_val {Type I LastRead 0 FirstWrite -1}
		WidthInBytes_val {Type I LastRead 0 FirstWrite -1}
		VideoFormat_val {Type I LastRead 0 FirstWrite -1}}
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
		pix_30_out {Type O LastRead -1 FirstWrite 1}}
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
		pix_20_out {Type O LastRead -1 FirstWrite 1}}
	MultiPixStream2Bytes_Pipeline_VITIS_LOOP_863_5 {
		pix_7 {Type I LastRead 0 FirstWrite -1}
		pix_6 {Type I LastRead 0 FirstWrite -1}
		pix_5 {Type I LastRead 0 FirstWrite -1}
		pix_4 {Type I LastRead 0 FirstWrite -1}
		loopWidth_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 5}
		icmp_ln851 {Type I LastRead 0 FirstWrite -1}
		icmp_ln868_2 {Type I LastRead 0 FirstWrite -1}
		icmp9 {Type I LastRead 0 FirstWrite -1}
		sext_ln868 {Type I LastRead 0 FirstWrite -1}
		icmp_ln868 {Type I LastRead 0 FirstWrite -1}
		img {Type I LastRead 4 FirstWrite -1}
		pix_19_out {Type O LastRead -1 FirstWrite 1}
		pix_18_out {Type O LastRead -1 FirstWrite 1}
		pix_17_out {Type O LastRead -1 FirstWrite 1}
		pix_16_out {Type O LastRead -1 FirstWrite 1}}
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
	{"Name" : "Latency", "Min" : "1", "Max" : "6227282"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "6227282"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	img { ap_fifo {  { img_dout fifo_data_out 0 48 }  { img_empty_n fifo_status_empty 0 1 }  { img_read fifo_data_in 1 1 }  { img_num_data_valid fifo_update 0 3 }  { img_fifo_cap fifo_data 0 3 } } }
	bytePlanes_plane0 { ap_fifo {  { bytePlanes_plane0_din fifo_data_out 1 128 }  { bytePlanes_plane0_full_n fifo_status_empty 0 1 }  { bytePlanes_plane0_write fifo_data_in 1 1 }  { bytePlanes_plane0_num_data_valid fifo_update 0 32 }  { bytePlanes_plane0_fifo_cap fifo_data 0 32 } } }
	bytePlanes_plane1 { ap_fifo {  { bytePlanes_plane1_din fifo_data_out 1 128 }  { bytePlanes_plane1_full_n fifo_status_empty 0 1 }  { bytePlanes_plane1_write fifo_data_in 1 1 }  { bytePlanes_plane1_num_data_valid fifo_update 0 9 }  { bytePlanes_plane1_fifo_cap fifo_data 0 9 } } }
	Height_val { ap_stable {  { Height_val in_data 0 11 } } }
	WidthInPix_val { ap_stable {  { WidthInPix_val in_data 0 11 } } }
	WidthInBytes_val { ap_stable {  { WidthInBytes_val in_data 0 14 } } }
	VideoFormat_val { ap_stable {  { VideoFormat_val in_data 0 6 } } }
}
