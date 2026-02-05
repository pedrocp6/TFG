set moduleName v_csc_core
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
set C_modelName {v_csc_core}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ height int 16 regular {pointer 0 stable }  }
	{ width int 16 regular {pointer 0 stable }  }
	{ ColStart int 16 regular {pointer 0 stable }  }
	{ ColEnd int 16 regular {pointer 0 stable }  }
	{ RowStart int 16 regular {pointer 0 stable }  }
	{ RowEnd int 16 regular {pointer 0 stable }  }
	{ K11 int 16 regular {pointer 0 stable }  }
	{ K12 int 16 regular {pointer 0 stable }  }
	{ K13 int 16 regular {pointer 0 stable }  }
	{ K21 int 16 regular {pointer 0 stable }  }
	{ K22 int 16 regular {pointer 0 stable }  }
	{ K23 int 16 regular {pointer 0 stable }  }
	{ K31 int 16 regular {pointer 0 stable }  }
	{ K32 int 16 regular {pointer 0 stable }  }
	{ K33 int 16 regular {pointer 0 stable }  }
	{ ROffset int 10 regular {pointer 0 stable }  }
	{ GOffset int 10 regular {pointer 0 stable }  }
	{ BOffset int 10 regular {pointer 0 stable }  }
	{ ClampMin int 8 regular {pointer 0 stable }  }
	{ ClipMax int 8 regular {pointer 0 stable }  }
	{ K11_2 int 16 regular {pointer 0 stable }  }
	{ K12_2 int 16 regular {pointer 0 stable }  }
	{ K13_2 int 16 regular {pointer 0 stable }  }
	{ K21_2 int 16 regular {pointer 0 stable }  }
	{ K22_2 int 16 regular {pointer 0 stable }  }
	{ K23_2 int 16 regular {pointer 0 stable }  }
	{ K31_2 int 16 regular {pointer 0 stable }  }
	{ K32_2 int 16 regular {pointer 0 stable }  }
	{ K33_2 int 16 regular {pointer 0 stable }  }
	{ ROffset_2 int 10 regular {pointer 0 stable }  }
	{ GOffset_2 int 10 regular {pointer 0 stable }  }
	{ BOffset_2 int 10 regular {pointer 0 stable }  }
	{ ClampMin_2 int 8 regular {pointer 0 stable }  }
	{ ClipMax_2 int 8 regular {pointer 0 stable }  }
	{ stream_in_hresampled int 48 regular {fifo 0 volatile }  }
	{ stream_csc int 48 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "height", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "width", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "ColStart", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "ColEnd", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "RowStart", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "RowEnd", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K11", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K12", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K13", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K21", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K22", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K23", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K31", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K32", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K33", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "ROffset", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "GOffset", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "BOffset", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "ClampMin", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "ClipMax", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "K11_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K12_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K13_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K21_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K22_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K23_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K31_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K32_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K33_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "ROffset_2", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "GOffset_2", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "BOffset_2", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "ClampMin_2", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "ClipMax_2", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_hresampled", "interface" : "fifo", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "stream_csc", "interface" : "fifo", "bitwidth" : 48, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 51
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ height sc_in sc_lv 16 signal 0 } 
	{ width sc_in sc_lv 16 signal 1 } 
	{ ColStart sc_in sc_lv 16 signal 2 } 
	{ ColEnd sc_in sc_lv 16 signal 3 } 
	{ RowStart sc_in sc_lv 16 signal 4 } 
	{ RowEnd sc_in sc_lv 16 signal 5 } 
	{ K11 sc_in sc_lv 16 signal 6 } 
	{ K12 sc_in sc_lv 16 signal 7 } 
	{ K13 sc_in sc_lv 16 signal 8 } 
	{ K21 sc_in sc_lv 16 signal 9 } 
	{ K22 sc_in sc_lv 16 signal 10 } 
	{ K23 sc_in sc_lv 16 signal 11 } 
	{ K31 sc_in sc_lv 16 signal 12 } 
	{ K32 sc_in sc_lv 16 signal 13 } 
	{ K33 sc_in sc_lv 16 signal 14 } 
	{ ROffset sc_in sc_lv 10 signal 15 } 
	{ GOffset sc_in sc_lv 10 signal 16 } 
	{ BOffset sc_in sc_lv 10 signal 17 } 
	{ ClampMin sc_in sc_lv 8 signal 18 } 
	{ ClipMax sc_in sc_lv 8 signal 19 } 
	{ K11_2 sc_in sc_lv 16 signal 20 } 
	{ K12_2 sc_in sc_lv 16 signal 21 } 
	{ K13_2 sc_in sc_lv 16 signal 22 } 
	{ K21_2 sc_in sc_lv 16 signal 23 } 
	{ K22_2 sc_in sc_lv 16 signal 24 } 
	{ K23_2 sc_in sc_lv 16 signal 25 } 
	{ K31_2 sc_in sc_lv 16 signal 26 } 
	{ K32_2 sc_in sc_lv 16 signal 27 } 
	{ K33_2 sc_in sc_lv 16 signal 28 } 
	{ ROffset_2 sc_in sc_lv 10 signal 29 } 
	{ GOffset_2 sc_in sc_lv 10 signal 30 } 
	{ BOffset_2 sc_in sc_lv 10 signal 31 } 
	{ ClampMin_2 sc_in sc_lv 8 signal 32 } 
	{ ClipMax_2 sc_in sc_lv 8 signal 33 } 
	{ stream_in_hresampled_dout sc_in sc_lv 48 signal 34 } 
	{ stream_in_hresampled_empty_n sc_in sc_logic 1 signal 34 } 
	{ stream_in_hresampled_read sc_out sc_logic 1 signal 34 } 
	{ stream_in_hresampled_num_data_valid sc_in sc_lv 5 signal 34 } 
	{ stream_in_hresampled_fifo_cap sc_in sc_lv 5 signal 34 } 
	{ stream_csc_din sc_out sc_lv 48 signal 35 } 
	{ stream_csc_full_n sc_in sc_logic 1 signal 35 } 
	{ stream_csc_write sc_out sc_logic 1 signal 35 } 
	{ stream_csc_num_data_valid sc_in sc_lv 32 signal 35 } 
	{ stream_csc_fifo_cap sc_in sc_lv 32 signal 35 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "height", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "height", "role": "default" }} , 
 	{ "name": "width", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "width", "role": "default" }} , 
 	{ "name": "ColStart", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ColStart", "role": "default" }} , 
 	{ "name": "ColEnd", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ColEnd", "role": "default" }} , 
 	{ "name": "RowStart", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RowStart", "role": "default" }} , 
 	{ "name": "RowEnd", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RowEnd", "role": "default" }} , 
 	{ "name": "K11", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K11", "role": "default" }} , 
 	{ "name": "K12", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K12", "role": "default" }} , 
 	{ "name": "K13", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K13", "role": "default" }} , 
 	{ "name": "K21", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K21", "role": "default" }} , 
 	{ "name": "K22", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K22", "role": "default" }} , 
 	{ "name": "K23", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K23", "role": "default" }} , 
 	{ "name": "K31", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K31", "role": "default" }} , 
 	{ "name": "K32", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K32", "role": "default" }} , 
 	{ "name": "K33", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K33", "role": "default" }} , 
 	{ "name": "ROffset", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "ROffset", "role": "default" }} , 
 	{ "name": "GOffset", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "GOffset", "role": "default" }} , 
 	{ "name": "BOffset", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "BOffset", "role": "default" }} , 
 	{ "name": "ClampMin", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ClampMin", "role": "default" }} , 
 	{ "name": "ClipMax", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ClipMax", "role": "default" }} , 
 	{ "name": "K11_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K11_2", "role": "default" }} , 
 	{ "name": "K12_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K12_2", "role": "default" }} , 
 	{ "name": "K13_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K13_2", "role": "default" }} , 
 	{ "name": "K21_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K21_2", "role": "default" }} , 
 	{ "name": "K22_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K22_2", "role": "default" }} , 
 	{ "name": "K23_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K23_2", "role": "default" }} , 
 	{ "name": "K31_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K31_2", "role": "default" }} , 
 	{ "name": "K32_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K32_2", "role": "default" }} , 
 	{ "name": "K33_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K33_2", "role": "default" }} , 
 	{ "name": "ROffset_2", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "ROffset_2", "role": "default" }} , 
 	{ "name": "GOffset_2", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "GOffset_2", "role": "default" }} , 
 	{ "name": "BOffset_2", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "BOffset_2", "role": "default" }} , 
 	{ "name": "ClampMin_2", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ClampMin_2", "role": "default" }} , 
 	{ "name": "ClipMax_2", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ClipMax_2", "role": "default" }} , 
 	{ "name": "stream_in_hresampled_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "stream_in_hresampled", "role": "dout" }} , 
 	{ "name": "stream_in_hresampled_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in_hresampled", "role": "empty_n" }} , 
 	{ "name": "stream_in_hresampled_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in_hresampled", "role": "read" }} , 
 	{ "name": "stream_in_hresampled_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "stream_in_hresampled", "role": "num_data_valid" }} , 
 	{ "name": "stream_in_hresampled_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "stream_in_hresampled", "role": "fifo_cap" }} , 
 	{ "name": "stream_csc_din", "direction": "out", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "stream_csc", "role": "din" }} , 
 	{ "name": "stream_csc_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_csc", "role": "full_n" }} , 
 	{ "name": "stream_csc_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_csc", "role": "write" }} , 
 	{ "name": "stream_csc_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stream_csc", "role": "num_data_valid" }} , 
 	{ "name": "stream_csc_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stream_csc", "role": "fifo_cap" }}  ]}

set ArgLastReadFirstWriteLatency {
	v_csc_core {
		height {Type I LastRead 0 FirstWrite -1}
		width {Type I LastRead 0 FirstWrite -1}
		ColStart {Type I LastRead 0 FirstWrite -1}
		ColEnd {Type I LastRead 0 FirstWrite -1}
		RowStart {Type I LastRead 0 FirstWrite -1}
		RowEnd {Type I LastRead 0 FirstWrite -1}
		K11 {Type I LastRead 0 FirstWrite -1}
		K12 {Type I LastRead 0 FirstWrite -1}
		K13 {Type I LastRead 0 FirstWrite -1}
		K21 {Type I LastRead 0 FirstWrite -1}
		K22 {Type I LastRead 0 FirstWrite -1}
		K23 {Type I LastRead 0 FirstWrite -1}
		K31 {Type I LastRead 0 FirstWrite -1}
		K32 {Type I LastRead 0 FirstWrite -1}
		K33 {Type I LastRead 0 FirstWrite -1}
		ROffset {Type I LastRead 0 FirstWrite -1}
		GOffset {Type I LastRead 0 FirstWrite -1}
		BOffset {Type I LastRead 0 FirstWrite -1}
		ClampMin {Type I LastRead 0 FirstWrite -1}
		ClipMax {Type I LastRead 0 FirstWrite -1}
		K11_2 {Type I LastRead 0 FirstWrite -1}
		K12_2 {Type I LastRead 0 FirstWrite -1}
		K13_2 {Type I LastRead 0 FirstWrite -1}
		K21_2 {Type I LastRead 0 FirstWrite -1}
		K22_2 {Type I LastRead 0 FirstWrite -1}
		K23_2 {Type I LastRead 0 FirstWrite -1}
		K31_2 {Type I LastRead 0 FirstWrite -1}
		K32_2 {Type I LastRead 0 FirstWrite -1}
		K33_2 {Type I LastRead 0 FirstWrite -1}
		ROffset_2 {Type I LastRead 0 FirstWrite -1}
		GOffset_2 {Type I LastRead 0 FirstWrite -1}
		BOffset_2 {Type I LastRead 0 FirstWrite -1}
		ClampMin_2 {Type I LastRead 0 FirstWrite -1}
		ClipMax_2 {Type I LastRead 0 FirstWrite -1}
		stream_in_hresampled {Type I LastRead 1 FirstWrite -1}
		stream_csc {Type O LastRead -1 FirstWrite 5}}
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
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	height { ap_none {  { height in_data 0 16 } } }
	width { ap_none {  { width in_data 0 16 } } }
	ColStart { ap_none {  { ColStart in_data 0 16 } } }
	ColEnd { ap_none {  { ColEnd in_data 0 16 } } }
	RowStart { ap_none {  { RowStart in_data 0 16 } } }
	RowEnd { ap_none {  { RowEnd in_data 0 16 } } }
	K11 { ap_none {  { K11 in_data 0 16 } } }
	K12 { ap_none {  { K12 in_data 0 16 } } }
	K13 { ap_none {  { K13 in_data 0 16 } } }
	K21 { ap_none {  { K21 in_data 0 16 } } }
	K22 { ap_none {  { K22 in_data 0 16 } } }
	K23 { ap_none {  { K23 in_data 0 16 } } }
	K31 { ap_none {  { K31 in_data 0 16 } } }
	K32 { ap_none {  { K32 in_data 0 16 } } }
	K33 { ap_none {  { K33 in_data 0 16 } } }
	ROffset { ap_none {  { ROffset in_data 0 10 } } }
	GOffset { ap_none {  { GOffset in_data 0 10 } } }
	BOffset { ap_none {  { BOffset in_data 0 10 } } }
	ClampMin { ap_none {  { ClampMin in_data 0 8 } } }
	ClipMax { ap_none {  { ClipMax in_data 0 8 } } }
	K11_2 { ap_none {  { K11_2 in_data 0 16 } } }
	K12_2 { ap_none {  { K12_2 in_data 0 16 } } }
	K13_2 { ap_none {  { K13_2 in_data 0 16 } } }
	K21_2 { ap_none {  { K21_2 in_data 0 16 } } }
	K22_2 { ap_none {  { K22_2 in_data 0 16 } } }
	K23_2 { ap_none {  { K23_2 in_data 0 16 } } }
	K31_2 { ap_none {  { K31_2 in_data 0 16 } } }
	K32_2 { ap_none {  { K32_2 in_data 0 16 } } }
	K33_2 { ap_none {  { K33_2 in_data 0 16 } } }
	ROffset_2 { ap_none {  { ROffset_2 in_data 0 10 } } }
	GOffset_2 { ap_none {  { GOffset_2 in_data 0 10 } } }
	BOffset_2 { ap_none {  { BOffset_2 in_data 0 10 } } }
	ClampMin_2 { ap_none {  { ClampMin_2 in_data 0 8 } } }
	ClipMax_2 { ap_none {  { ClipMax_2 in_data 0 8 } } }
	stream_in_hresampled { ap_fifo {  { stream_in_hresampled_dout fifo_data_out 0 48 }  { stream_in_hresampled_empty_n fifo_status_empty 0 1 }  { stream_in_hresampled_read fifo_data_in 1 1 }  { stream_in_hresampled_num_data_valid fifo_update 0 5 }  { stream_in_hresampled_fifo_cap fifo_data 0 5 } } }
	stream_csc { ap_fifo {  { stream_csc_din fifo_data_out 1 48 }  { stream_csc_full_n fifo_status_empty 0 1 }  { stream_csc_write fifo_data_in 1 1 }  { stream_csc_num_data_valid fifo_update 0 32 }  { stream_csc_fifo_cap fifo_data 0 32 } } }
}
