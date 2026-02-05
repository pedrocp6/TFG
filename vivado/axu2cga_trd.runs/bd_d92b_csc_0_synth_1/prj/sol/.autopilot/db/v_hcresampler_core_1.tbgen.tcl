set moduleName v_hcresampler_core_1
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
set C_modelName {v_hcresampler_core.1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ height int 16 regular {pointer 0 stable }  }
	{ width int 16 regular {pointer 0 stable }  }
	{ p_read int 1 regular  }
	{ stream_csc int 48 regular {fifo 0 volatile }  }
	{ stream_out_hresampled int 48 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "height", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "width", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "stream_csc", "interface" : "fifo", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "stream_out_hresampled", "interface" : "fifo", "bitwidth" : 48, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 23
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
	{ height sc_in sc_lv 16 signal 0 } 
	{ width sc_in sc_lv 16 signal 1 } 
	{ p_read sc_in sc_lv 1 signal 2 } 
	{ stream_csc_dout sc_in sc_lv 48 signal 3 } 
	{ stream_csc_empty_n sc_in sc_logic 1 signal 3 } 
	{ stream_csc_read sc_out sc_logic 1 signal 3 } 
	{ stream_csc_num_data_valid sc_in sc_lv 5 signal 3 } 
	{ stream_csc_fifo_cap sc_in sc_lv 5 signal 3 } 
	{ stream_out_hresampled_din sc_out sc_lv 48 signal 4 } 
	{ stream_out_hresampled_full_n sc_in sc_logic 1 signal 4 } 
	{ stream_out_hresampled_write sc_out sc_logic 1 signal 4 } 
	{ stream_out_hresampled_num_data_valid sc_in sc_lv 32 signal 4 } 
	{ stream_out_hresampled_fifo_cap sc_in sc_lv 32 signal 4 } 
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
 	{ "name": "height", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "height", "role": "default" }} , 
 	{ "name": "width", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "width", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "stream_csc_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "stream_csc", "role": "dout" }} , 
 	{ "name": "stream_csc_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_csc", "role": "empty_n" }} , 
 	{ "name": "stream_csc_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_csc", "role": "read" }} , 
 	{ "name": "stream_csc_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "stream_csc", "role": "num_data_valid" }} , 
 	{ "name": "stream_csc_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "stream_csc", "role": "fifo_cap" }} , 
 	{ "name": "stream_out_hresampled_din", "direction": "out", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "stream_out_hresampled", "role": "din" }} , 
 	{ "name": "stream_out_hresampled_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_out_hresampled", "role": "full_n" }} , 
 	{ "name": "stream_out_hresampled_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_out_hresampled", "role": "write" }} , 
 	{ "name": "stream_out_hresampled_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stream_out_hresampled", "role": "num_data_valid" }} , 
 	{ "name": "stream_out_hresampled_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stream_out_hresampled", "role": "fifo_cap" }}  ]}

set ArgLastReadFirstWriteLatency {
	v_hcresampler_core_1 {
		height {Type I LastRead 1 FirstWrite -1}
		width {Type I LastRead 1 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		stream_csc {Type I LastRead 1 FirstWrite -1}
		stream_out_hresampled {Type O LastRead -1 FirstWrite 2}}
	v_hcresampler_core_1_Pipeline_VITIS_LOOP_769_2 {
		pixbuf_y_5 {Type I LastRead 0 FirstWrite -1}
		pixbuf_y_4 {Type I LastRead 0 FirstWrite -1}
		pixbuf_y_3 {Type I LastRead 0 FirstWrite -1}
		pixbuf_y_2 {Type I LastRead 0 FirstWrite -1}
		mpix_cr_1 {Type I LastRead 0 FirstWrite -1}
		mpix_cb_1 {Type I LastRead 0 FirstWrite -1}
		storemerge_lcssa850_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0_0_0509_1_3788_lcssa847_i {Type I LastRead 0 FirstWrite -1}
		p_0_3_0_0_0760_lcssa821_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0_0_0517758_lcssa818_i {Type I LastRead 0 FirstWrite -1}
		loopWidth {Type I LastRead 0 FirstWrite -1}
		stream_out_hresampled {Type O LastRead -1 FirstWrite 2}
		p_read {Type I LastRead 0 FirstWrite -1}
		zext_ln730 {Type I LastRead 0 FirstWrite -1}
		lshr_ln {Type I LastRead 0 FirstWrite -1}
		stream_csc {Type I LastRead 1 FirstWrite -1}
		pixbuf_y_11_out {Type O LastRead -1 FirstWrite 2}
		pixbuf_y_10_out {Type O LastRead -1 FirstWrite 2}
		pixbuf_y_9_out {Type O LastRead -1 FirstWrite 2}
		pixbuf_y_8_out {Type O LastRead -1 FirstWrite 2}
		pixbuf_y_7_out {Type IO LastRead 3 FirstWrite 3}
		pixbuf_y_6_out {Type IO LastRead 3 FirstWrite 3}
		mpix_cr_3_out {Type O LastRead -1 FirstWrite 2}
		mpix_cr_2_out {Type IO LastRead 2 FirstWrite 1}
		mpix_cb_3_out {Type O LastRead -1 FirstWrite 2}
		mpix_cb_2_out {Type IO LastRead 2 FirstWrite 1}
		p_0_0_0_0_0_3782_i_out {Type IO LastRead 2 FirstWrite 2}
		p_0_0_0_0_0509_3778_i_out {Type IO LastRead 2 FirstWrite 2}
		p_0_0_0_0_0_2774_i_out {Type IO LastRead 2 FirstWrite 2}
		p_0_0_0_0_0509_2770_i_out {Type IO LastRead 2 FirstWrite 2}
		inpix_0_5_0_0_0_load755_i_out {Type IO LastRead 2 FirstWrite 1}
		inpix_0_4_0_0_0_load753_i_out {Type IO LastRead 2 FirstWrite 1}
		inpix_0_3_0_0_0_load751_i_out {Type IO LastRead 2 FirstWrite 1}
		inpix_0_2_0_0_0_load749_i_out {Type IO LastRead 2 FirstWrite 1}
		inpix_0_1_0_0_0_load747_i_out {Type IO LastRead 2 FirstWrite 1}
		inpix_0_0_0_0_0_load745_i_out {Type IO LastRead 2 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "1073938427"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "1073938427"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	height { ap_none {  { height in_data 0 16 } } }
	width { ap_none {  { width in_data 0 16 } } }
	p_read { ap_none {  { p_read in_data 0 1 } } }
	stream_csc { ap_fifo {  { stream_csc_dout fifo_data_out 0 48 }  { stream_csc_empty_n fifo_status_empty 0 1 }  { stream_csc_read fifo_data_in 1 1 }  { stream_csc_num_data_valid fifo_update 0 5 }  { stream_csc_fifo_cap fifo_data 0 5 } } }
	stream_out_hresampled { ap_fifo {  { stream_out_hresampled_din fifo_data_out 1 48 }  { stream_out_hresampled_full_n fifo_status_empty 0 1 }  { stream_out_hresampled_write fifo_data_in 1 1 }  { stream_out_hresampled_num_data_valid fifo_update 0 32 }  { stream_out_hresampled_fifo_cap fifo_data 0 32 } } }
}
