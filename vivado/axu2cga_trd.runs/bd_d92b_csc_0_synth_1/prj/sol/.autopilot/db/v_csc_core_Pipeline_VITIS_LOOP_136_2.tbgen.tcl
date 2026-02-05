set moduleName v_csc_core_Pipeline_VITIS_LOOP_136_2
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
set C_modelName {v_csc_core_Pipeline_VITIS_LOOP_136_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ add_ln134 int 16 regular {ap_stable 0} }
	{ stream_in_hresampled int 48 regular {fifo 0 volatile }  }
	{ loopStart int 16 regular {ap_stable 0} }
	{ loopEnd int 16 regular {ap_stable 0} }
	{ xor_ln148_1 int 1 regular {ap_stable 0} }
	{ or_ln147 int 1 regular  }
	{ coef11 int 16 regular {ap_stable 0} }
	{ K11_2_load int 16 regular {ap_stable 0} }
	{ coef12 int 16 regular {ap_stable 0} }
	{ K12_2_load int 16 regular {ap_stable 0} }
	{ coef13 int 16 regular {ap_stable 0} }
	{ K13_2_load int 16 regular {ap_stable 0} }
	{ coef21 int 16 regular {ap_stable 0} }
	{ K21_2_load int 16 regular {ap_stable 0} }
	{ coef22 int 16 regular {ap_stable 0} }
	{ K22_2_load int 16 regular {ap_stable 0} }
	{ coef23 int 16 regular {ap_stable 0} }
	{ K23_2_load int 16 regular {ap_stable 0} }
	{ coef31 int 16 regular {ap_stable 0} }
	{ K31_2_load int 16 regular {ap_stable 0} }
	{ coef32 int 16 regular {ap_stable 0} }
	{ K32_2_load int 16 regular {ap_stable 0} }
	{ coef33 int 16 regular {ap_stable 0} }
	{ K33_2_load int 16 regular {ap_stable 0} }
	{ offsetR int 22 regular {ap_stable 0} }
	{ shl_ln int 22 regular {ap_stable 0} }
	{ offsetG int 22 regular {ap_stable 0} }
	{ shl_ln2 int 22 regular {ap_stable 0} }
	{ offsetB int 22 regular {ap_stable 0} }
	{ shl_ln3 int 22 regular {ap_stable 0} }
	{ max_val int 8 regular {ap_stable 0} }
	{ ClipMax_2_load int 8 regular {ap_stable 0} }
	{ min_val int 8 regular {ap_stable 0} }
	{ ClampMin_2_load int 8 regular {ap_stable 0} }
	{ empty int 1 regular {ap_stable 0} }
	{ stream_csc int 48 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "add_ln134", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_hresampled", "interface" : "fifo", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "loopStart", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "loopEnd", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "xor_ln148_1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "or_ln147", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coef11", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K11_2_load", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "coef12", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K12_2_load", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "coef13", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K13_2_load", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "coef21", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K21_2_load", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "coef22", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K22_2_load", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "coef23", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K23_2_load", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "coef31", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K31_2_load", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "coef32", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K32_2_load", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "coef33", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K33_2_load", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "offsetR", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "shl_ln", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "offsetG", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "shl_ln2", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "offsetB", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "shl_ln3", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "max_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "ClipMax_2_load", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "min_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "ClampMin_2_load", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "stream_csc", "interface" : "fifo", "bitwidth" : 48, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 50
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ stream_in_hresampled_dout sc_in sc_lv 48 signal 1 } 
	{ stream_in_hresampled_empty_n sc_in sc_logic 1 signal 1 } 
	{ stream_in_hresampled_read sc_out sc_logic 1 signal 1 } 
	{ stream_in_hresampled_num_data_valid sc_in sc_lv 5 signal 1 } 
	{ stream_in_hresampled_fifo_cap sc_in sc_lv 5 signal 1 } 
	{ stream_csc_din sc_out sc_lv 48 signal 35 } 
	{ stream_csc_full_n sc_in sc_logic 1 signal 35 } 
	{ stream_csc_write sc_out sc_logic 1 signal 35 } 
	{ stream_csc_num_data_valid sc_in sc_lv 32 signal 35 } 
	{ stream_csc_fifo_cap sc_in sc_lv 32 signal 35 } 
	{ add_ln134 sc_in sc_lv 16 signal 0 } 
	{ loopStart sc_in sc_lv 16 signal 2 } 
	{ loopEnd sc_in sc_lv 16 signal 3 } 
	{ xor_ln148_1 sc_in sc_lv 1 signal 4 } 
	{ or_ln147 sc_in sc_lv 1 signal 5 } 
	{ coef11 sc_in sc_lv 16 signal 6 } 
	{ K11_2_load sc_in sc_lv 16 signal 7 } 
	{ coef12 sc_in sc_lv 16 signal 8 } 
	{ K12_2_load sc_in sc_lv 16 signal 9 } 
	{ coef13 sc_in sc_lv 16 signal 10 } 
	{ K13_2_load sc_in sc_lv 16 signal 11 } 
	{ coef21 sc_in sc_lv 16 signal 12 } 
	{ K21_2_load sc_in sc_lv 16 signal 13 } 
	{ coef22 sc_in sc_lv 16 signal 14 } 
	{ K22_2_load sc_in sc_lv 16 signal 15 } 
	{ coef23 sc_in sc_lv 16 signal 16 } 
	{ K23_2_load sc_in sc_lv 16 signal 17 } 
	{ coef31 sc_in sc_lv 16 signal 18 } 
	{ K31_2_load sc_in sc_lv 16 signal 19 } 
	{ coef32 sc_in sc_lv 16 signal 20 } 
	{ K32_2_load sc_in sc_lv 16 signal 21 } 
	{ coef33 sc_in sc_lv 16 signal 22 } 
	{ K33_2_load sc_in sc_lv 16 signal 23 } 
	{ offsetR sc_in sc_lv 22 signal 24 } 
	{ shl_ln sc_in sc_lv 22 signal 25 } 
	{ offsetG sc_in sc_lv 22 signal 26 } 
	{ shl_ln2 sc_in sc_lv 22 signal 27 } 
	{ offsetB sc_in sc_lv 22 signal 28 } 
	{ shl_ln3 sc_in sc_lv 22 signal 29 } 
	{ max_val sc_in sc_lv 8 signal 30 } 
	{ ClipMax_2_load sc_in sc_lv 8 signal 31 } 
	{ min_val sc_in sc_lv 8 signal 32 } 
	{ ClampMin_2_load sc_in sc_lv 8 signal 33 } 
	{ empty sc_in sc_lv 1 signal 34 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "stream_in_hresampled_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "stream_in_hresampled", "role": "dout" }} , 
 	{ "name": "stream_in_hresampled_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in_hresampled", "role": "empty_n" }} , 
 	{ "name": "stream_in_hresampled_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in_hresampled", "role": "read" }} , 
 	{ "name": "stream_in_hresampled_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "stream_in_hresampled", "role": "num_data_valid" }} , 
 	{ "name": "stream_in_hresampled_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "stream_in_hresampled", "role": "fifo_cap" }} , 
 	{ "name": "stream_csc_din", "direction": "out", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "stream_csc", "role": "din" }} , 
 	{ "name": "stream_csc_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_csc", "role": "full_n" }} , 
 	{ "name": "stream_csc_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_csc", "role": "write" }} , 
 	{ "name": "stream_csc_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stream_csc", "role": "num_data_valid" }} , 
 	{ "name": "stream_csc_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stream_csc", "role": "fifo_cap" }} , 
 	{ "name": "add_ln134", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "add_ln134", "role": "default" }} , 
 	{ "name": "loopStart", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "loopStart", "role": "default" }} , 
 	{ "name": "loopEnd", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "loopEnd", "role": "default" }} , 
 	{ "name": "xor_ln148_1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "xor_ln148_1", "role": "default" }} , 
 	{ "name": "or_ln147", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "or_ln147", "role": "default" }} , 
 	{ "name": "coef11", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coef11", "role": "default" }} , 
 	{ "name": "K11_2_load", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K11_2_load", "role": "default" }} , 
 	{ "name": "coef12", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coef12", "role": "default" }} , 
 	{ "name": "K12_2_load", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K12_2_load", "role": "default" }} , 
 	{ "name": "coef13", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coef13", "role": "default" }} , 
 	{ "name": "K13_2_load", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K13_2_load", "role": "default" }} , 
 	{ "name": "coef21", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coef21", "role": "default" }} , 
 	{ "name": "K21_2_load", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K21_2_load", "role": "default" }} , 
 	{ "name": "coef22", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coef22", "role": "default" }} , 
 	{ "name": "K22_2_load", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K22_2_load", "role": "default" }} , 
 	{ "name": "coef23", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coef23", "role": "default" }} , 
 	{ "name": "K23_2_load", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K23_2_load", "role": "default" }} , 
 	{ "name": "coef31", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coef31", "role": "default" }} , 
 	{ "name": "K31_2_load", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K31_2_load", "role": "default" }} , 
 	{ "name": "coef32", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coef32", "role": "default" }} , 
 	{ "name": "K32_2_load", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K32_2_load", "role": "default" }} , 
 	{ "name": "coef33", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coef33", "role": "default" }} , 
 	{ "name": "K33_2_load", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K33_2_load", "role": "default" }} , 
 	{ "name": "offsetR", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "offsetR", "role": "default" }} , 
 	{ "name": "shl_ln", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "shl_ln", "role": "default" }} , 
 	{ "name": "offsetG", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "offsetG", "role": "default" }} , 
 	{ "name": "shl_ln2", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "shl_ln2", "role": "default" }} , 
 	{ "name": "offsetB", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "offsetB", "role": "default" }} , 
 	{ "name": "shl_ln3", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "shl_ln3", "role": "default" }} , 
 	{ "name": "max_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_val", "role": "default" }} , 
 	{ "name": "ClipMax_2_load", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ClipMax_2_load", "role": "default" }} , 
 	{ "name": "min_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_val", "role": "default" }} , 
 	{ "name": "ClampMin_2_load", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ClampMin_2_load", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "empty", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	v_csc_core_Pipeline_VITIS_LOOP_136_2 {
		add_ln134 {Type I LastRead 0 FirstWrite -1}
		stream_in_hresampled {Type I LastRead 1 FirstWrite -1}
		loopStart {Type I LastRead 0 FirstWrite -1}
		loopEnd {Type I LastRead 0 FirstWrite -1}
		xor_ln148_1 {Type I LastRead 0 FirstWrite -1}
		or_ln147 {Type I LastRead 0 FirstWrite -1}
		coef11 {Type I LastRead 0 FirstWrite -1}
		K11_2_load {Type I LastRead 0 FirstWrite -1}
		coef12 {Type I LastRead 0 FirstWrite -1}
		K12_2_load {Type I LastRead 0 FirstWrite -1}
		coef13 {Type I LastRead 0 FirstWrite -1}
		K13_2_load {Type I LastRead 0 FirstWrite -1}
		coef21 {Type I LastRead 0 FirstWrite -1}
		K21_2_load {Type I LastRead 0 FirstWrite -1}
		coef22 {Type I LastRead 0 FirstWrite -1}
		K22_2_load {Type I LastRead 0 FirstWrite -1}
		coef23 {Type I LastRead 0 FirstWrite -1}
		K23_2_load {Type I LastRead 0 FirstWrite -1}
		coef31 {Type I LastRead 0 FirstWrite -1}
		K31_2_load {Type I LastRead 0 FirstWrite -1}
		coef32 {Type I LastRead 0 FirstWrite -1}
		K32_2_load {Type I LastRead 0 FirstWrite -1}
		coef33 {Type I LastRead 0 FirstWrite -1}
		K33_2_load {Type I LastRead 0 FirstWrite -1}
		offsetR {Type I LastRead 0 FirstWrite -1}
		shl_ln {Type I LastRead 0 FirstWrite -1}
		offsetG {Type I LastRead 0 FirstWrite -1}
		shl_ln2 {Type I LastRead 0 FirstWrite -1}
		offsetB {Type I LastRead 0 FirstWrite -1}
		shl_ln3 {Type I LastRead 0 FirstWrite -1}
		max_val {Type I LastRead 0 FirstWrite -1}
		ClipMax_2_load {Type I LastRead 0 FirstWrite -1}
		min_val {Type I LastRead 0 FirstWrite -1}
		ClampMin_2_load {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		stream_csc {Type O LastRead -1 FirstWrite 5}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "7", "Max" : "32772"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "32767"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	add_ln134 { ap_stable {  { add_ln134 in_data 0 16 } } }
	stream_in_hresampled { ap_fifo {  { stream_in_hresampled_dout fifo_data_out 0 48 }  { stream_in_hresampled_empty_n fifo_status_empty 0 1 }  { stream_in_hresampled_read fifo_data_in 1 1 }  { stream_in_hresampled_num_data_valid fifo_update 0 5 }  { stream_in_hresampled_fifo_cap fifo_data 0 5 } } }
	loopStart { ap_stable {  { loopStart in_data 0 16 } } }
	loopEnd { ap_stable {  { loopEnd in_data 0 16 } } }
	xor_ln148_1 { ap_stable {  { xor_ln148_1 in_data 0 1 } } }
	or_ln147 { ap_none {  { or_ln147 in_data 0 1 } } }
	coef11 { ap_stable {  { coef11 in_data 0 16 } } }
	K11_2_load { ap_stable {  { K11_2_load in_data 0 16 } } }
	coef12 { ap_stable {  { coef12 in_data 0 16 } } }
	K12_2_load { ap_stable {  { K12_2_load in_data 0 16 } } }
	coef13 { ap_stable {  { coef13 in_data 0 16 } } }
	K13_2_load { ap_stable {  { K13_2_load in_data 0 16 } } }
	coef21 { ap_stable {  { coef21 in_data 0 16 } } }
	K21_2_load { ap_stable {  { K21_2_load in_data 0 16 } } }
	coef22 { ap_stable {  { coef22 in_data 0 16 } } }
	K22_2_load { ap_stable {  { K22_2_load in_data 0 16 } } }
	coef23 { ap_stable {  { coef23 in_data 0 16 } } }
	K23_2_load { ap_stable {  { K23_2_load in_data 0 16 } } }
	coef31 { ap_stable {  { coef31 in_data 0 16 } } }
	K31_2_load { ap_stable {  { K31_2_load in_data 0 16 } } }
	coef32 { ap_stable {  { coef32 in_data 0 16 } } }
	K32_2_load { ap_stable {  { K32_2_load in_data 0 16 } } }
	coef33 { ap_stable {  { coef33 in_data 0 16 } } }
	K33_2_load { ap_stable {  { K33_2_load in_data 0 16 } } }
	offsetR { ap_stable {  { offsetR in_data 0 22 } } }
	shl_ln { ap_stable {  { shl_ln in_data 0 22 } } }
	offsetG { ap_stable {  { offsetG in_data 0 22 } } }
	shl_ln2 { ap_stable {  { shl_ln2 in_data 0 22 } } }
	offsetB { ap_stable {  { offsetB in_data 0 22 } } }
	shl_ln3 { ap_stable {  { shl_ln3 in_data 0 22 } } }
	max_val { ap_stable {  { max_val in_data 0 8 } } }
	ClipMax_2_load { ap_stable {  { ClipMax_2_load in_data 0 8 } } }
	min_val { ap_stable {  { min_val in_data 0 8 } } }
	ClampMin_2_load { ap_stable {  { ClampMin_2_load in_data 0 8 } } }
	empty { ap_stable {  { empty in_data 0 1 } } }
	stream_csc { ap_fifo {  { stream_csc_din fifo_data_out 1 48 }  { stream_csc_full_n fifo_status_empty 0 1 }  { stream_csc_write fifo_data_in 1 1 }  { stream_csc_num_data_valid fifo_update 0 32 }  { stream_csc_fifo_cap fifo_data 0 32 } } }
}
