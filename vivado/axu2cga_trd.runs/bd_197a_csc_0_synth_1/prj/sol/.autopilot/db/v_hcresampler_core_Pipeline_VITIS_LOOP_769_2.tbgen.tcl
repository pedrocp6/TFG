set moduleName v_hcresampler_core_Pipeline_VITIS_LOOP_769_2
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
set C_modelName {v_hcresampler_core_Pipeline_VITIS_LOOP_769_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ pixbuf_y_18 int 8 regular  }
	{ pixbuf_y_17 int 8 regular  }
	{ pixbuf_y_16 int 8 regular  }
	{ pixbuf_y_15 int 8 regular  }
	{ mpix_cr int 8 regular  }
	{ mpix_cb int 8 regular  }
	{ storemerge_lcssa850_i int 8 regular  }
	{ p_0_0_0_0_0509_1_3788_lcssa847_i int 8 regular  }
	{ p_0_3_0_0_0760_lcssa821_i int 8 regular  }
	{ p_0_0_0_0_0517758_lcssa818_i int 8 regular  }
	{ loopWidth int 16 regular  }
	{ stream_in_hresampled int 48 regular {fifo 1 volatile }  }
	{ p_read int 1 regular  }
	{ select_ln765 int 1 regular  }
	{ lshr_ln int 15 regular {ap_stable 0} }
	{ stream_in int 48 regular {fifo 0 volatile }  }
	{ pixbuf_y_24_out int 8 regular {pointer 1}  }
	{ pixbuf_y_23_out int 8 regular {pointer 1}  }
	{ pixbuf_y_22_out int 8 regular {pointer 1}  }
	{ pixbuf_y_21_out int 8 regular {pointer 1}  }
	{ pixbuf_y_20_out int 8 regular {pointer 2}  }
	{ pixbuf_y_19_out int 8 regular {pointer 2}  }
	{ mpix_cr_8_out int 8 regular {pointer 1}  }
	{ mpix_cb_8_out int 8 regular {pointer 1}  }
	{ p_0_0_0_0_0_3782_i_out int 8 regular {pointer 2}  }
	{ p_0_0_0_0_0509_3778_i_out int 8 regular {pointer 2}  }
	{ p_0_0_0_0_0_2774_i_out int 8 regular {pointer 2}  }
	{ p_0_0_0_0_0509_2770_i_out int 8 regular {pointer 2}  }
	{ inpix_0_5_0_0_0_load755_i_out int 8 regular {pointer 2}  }
	{ inpix_0_4_0_0_0_load753_i_out int 8 regular {pointer 2}  }
	{ inpix_0_3_0_0_0_load751_i_out int 8 regular {pointer 2}  }
	{ inpix_0_2_0_0_0_load749_i_out int 8 regular {pointer 2}  }
	{ inpix_0_1_0_0_0_load747_i_out int 8 regular {pointer 2}  }
	{ inpix_0_0_0_0_0_load745_i_out int 8 regular {pointer 2}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "pixbuf_y_18", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pixbuf_y_17", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pixbuf_y_16", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pixbuf_y_15", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "mpix_cr", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "mpix_cb", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "storemerge_lcssa850_i", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0_0_0509_1_3788_lcssa847_i", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_3_0_0_0760_lcssa821_i", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0_0_0517758_lcssa818_i", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "loopWidth", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in_hresampled", "interface" : "fifo", "bitwidth" : 48, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln765", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "lshr_ln", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in", "interface" : "fifo", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "pixbuf_y_24_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pixbuf_y_23_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pixbuf_y_22_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pixbuf_y_21_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pixbuf_y_20_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "pixbuf_y_19_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "mpix_cr_8_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "mpix_cb_8_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0_0_0_3782_i_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "p_0_0_0_0_0509_3778_i_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "p_0_0_0_0_0_2774_i_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "p_0_0_0_0_0509_2770_i_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "inpix_0_5_0_0_0_load755_i_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "inpix_0_4_0_0_0_load753_i_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "inpix_0_3_0_0_0_load751_i_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "inpix_0_2_0_0_0_load749_i_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "inpix_0_1_0_0_0_load747_i_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "inpix_0_0_0_0_0_load745_i_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 78
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ stream_in_dout sc_in sc_lv 48 signal 15 } 
	{ stream_in_empty_n sc_in sc_logic 1 signal 15 } 
	{ stream_in_read sc_out sc_logic 1 signal 15 } 
	{ stream_in_num_data_valid sc_in sc_lv 5 signal 15 } 
	{ stream_in_fifo_cap sc_in sc_lv 5 signal 15 } 
	{ stream_in_hresampled_din sc_out sc_lv 48 signal 11 } 
	{ stream_in_hresampled_full_n sc_in sc_logic 1 signal 11 } 
	{ stream_in_hresampled_write sc_out sc_logic 1 signal 11 } 
	{ stream_in_hresampled_num_data_valid sc_in sc_lv 32 signal 11 } 
	{ stream_in_hresampled_fifo_cap sc_in sc_lv 32 signal 11 } 
	{ pixbuf_y_18 sc_in sc_lv 8 signal 0 } 
	{ pixbuf_y_17 sc_in sc_lv 8 signal 1 } 
	{ pixbuf_y_16 sc_in sc_lv 8 signal 2 } 
	{ pixbuf_y_15 sc_in sc_lv 8 signal 3 } 
	{ mpix_cr sc_in sc_lv 8 signal 4 } 
	{ mpix_cb sc_in sc_lv 8 signal 5 } 
	{ storemerge_lcssa850_i sc_in sc_lv 8 signal 6 } 
	{ p_0_0_0_0_0509_1_3788_lcssa847_i sc_in sc_lv 8 signal 7 } 
	{ p_0_3_0_0_0760_lcssa821_i sc_in sc_lv 8 signal 8 } 
	{ p_0_0_0_0_0517758_lcssa818_i sc_in sc_lv 8 signal 9 } 
	{ loopWidth sc_in sc_lv 16 signal 10 } 
	{ p_read sc_in sc_lv 1 signal 12 } 
	{ select_ln765 sc_in sc_lv 1 signal 13 } 
	{ lshr_ln sc_in sc_lv 15 signal 14 } 
	{ pixbuf_y_24_out sc_out sc_lv 8 signal 16 } 
	{ pixbuf_y_24_out_ap_vld sc_out sc_logic 1 outvld 16 } 
	{ pixbuf_y_23_out sc_out sc_lv 8 signal 17 } 
	{ pixbuf_y_23_out_ap_vld sc_out sc_logic 1 outvld 17 } 
	{ pixbuf_y_22_out sc_out sc_lv 8 signal 18 } 
	{ pixbuf_y_22_out_ap_vld sc_out sc_logic 1 outvld 18 } 
	{ pixbuf_y_21_out sc_out sc_lv 8 signal 19 } 
	{ pixbuf_y_21_out_ap_vld sc_out sc_logic 1 outvld 19 } 
	{ pixbuf_y_20_out_i sc_in sc_lv 8 signal 20 } 
	{ pixbuf_y_20_out_o sc_out sc_lv 8 signal 20 } 
	{ pixbuf_y_20_out_o_ap_vld sc_out sc_logic 1 outvld 20 } 
	{ pixbuf_y_19_out_i sc_in sc_lv 8 signal 21 } 
	{ pixbuf_y_19_out_o sc_out sc_lv 8 signal 21 } 
	{ pixbuf_y_19_out_o_ap_vld sc_out sc_logic 1 outvld 21 } 
	{ mpix_cr_8_out sc_out sc_lv 8 signal 22 } 
	{ mpix_cr_8_out_ap_vld sc_out sc_logic 1 outvld 22 } 
	{ mpix_cb_8_out sc_out sc_lv 8 signal 23 } 
	{ mpix_cb_8_out_ap_vld sc_out sc_logic 1 outvld 23 } 
	{ p_0_0_0_0_0_3782_i_out_i sc_in sc_lv 8 signal 24 } 
	{ p_0_0_0_0_0_3782_i_out_o sc_out sc_lv 8 signal 24 } 
	{ p_0_0_0_0_0_3782_i_out_o_ap_vld sc_out sc_logic 1 outvld 24 } 
	{ p_0_0_0_0_0509_3778_i_out_i sc_in sc_lv 8 signal 25 } 
	{ p_0_0_0_0_0509_3778_i_out_o sc_out sc_lv 8 signal 25 } 
	{ p_0_0_0_0_0509_3778_i_out_o_ap_vld sc_out sc_logic 1 outvld 25 } 
	{ p_0_0_0_0_0_2774_i_out_i sc_in sc_lv 8 signal 26 } 
	{ p_0_0_0_0_0_2774_i_out_o sc_out sc_lv 8 signal 26 } 
	{ p_0_0_0_0_0_2774_i_out_o_ap_vld sc_out sc_logic 1 outvld 26 } 
	{ p_0_0_0_0_0509_2770_i_out_i sc_in sc_lv 8 signal 27 } 
	{ p_0_0_0_0_0509_2770_i_out_o sc_out sc_lv 8 signal 27 } 
	{ p_0_0_0_0_0509_2770_i_out_o_ap_vld sc_out sc_logic 1 outvld 27 } 
	{ inpix_0_5_0_0_0_load755_i_out_i sc_in sc_lv 8 signal 28 } 
	{ inpix_0_5_0_0_0_load755_i_out_o sc_out sc_lv 8 signal 28 } 
	{ inpix_0_5_0_0_0_load755_i_out_o_ap_vld sc_out sc_logic 1 outvld 28 } 
	{ inpix_0_4_0_0_0_load753_i_out_i sc_in sc_lv 8 signal 29 } 
	{ inpix_0_4_0_0_0_load753_i_out_o sc_out sc_lv 8 signal 29 } 
	{ inpix_0_4_0_0_0_load753_i_out_o_ap_vld sc_out sc_logic 1 outvld 29 } 
	{ inpix_0_3_0_0_0_load751_i_out_i sc_in sc_lv 8 signal 30 } 
	{ inpix_0_3_0_0_0_load751_i_out_o sc_out sc_lv 8 signal 30 } 
	{ inpix_0_3_0_0_0_load751_i_out_o_ap_vld sc_out sc_logic 1 outvld 30 } 
	{ inpix_0_2_0_0_0_load749_i_out_i sc_in sc_lv 8 signal 31 } 
	{ inpix_0_2_0_0_0_load749_i_out_o sc_out sc_lv 8 signal 31 } 
	{ inpix_0_2_0_0_0_load749_i_out_o_ap_vld sc_out sc_logic 1 outvld 31 } 
	{ inpix_0_1_0_0_0_load747_i_out_i sc_in sc_lv 8 signal 32 } 
	{ inpix_0_1_0_0_0_load747_i_out_o sc_out sc_lv 8 signal 32 } 
	{ inpix_0_1_0_0_0_load747_i_out_o_ap_vld sc_out sc_logic 1 outvld 32 } 
	{ inpix_0_0_0_0_0_load745_i_out_i sc_in sc_lv 8 signal 33 } 
	{ inpix_0_0_0_0_0_load745_i_out_o sc_out sc_lv 8 signal 33 } 
	{ inpix_0_0_0_0_0_load745_i_out_o_ap_vld sc_out sc_logic 1 outvld 33 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "stream_in_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "stream_in", "role": "dout" }} , 
 	{ "name": "stream_in_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in", "role": "empty_n" }} , 
 	{ "name": "stream_in_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in", "role": "read" }} , 
 	{ "name": "stream_in_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "stream_in", "role": "num_data_valid" }} , 
 	{ "name": "stream_in_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "stream_in", "role": "fifo_cap" }} , 
 	{ "name": "stream_in_hresampled_din", "direction": "out", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "stream_in_hresampled", "role": "din" }} , 
 	{ "name": "stream_in_hresampled_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in_hresampled", "role": "full_n" }} , 
 	{ "name": "stream_in_hresampled_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in_hresampled", "role": "write" }} , 
 	{ "name": "stream_in_hresampled_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stream_in_hresampled", "role": "num_data_valid" }} , 
 	{ "name": "stream_in_hresampled_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stream_in_hresampled", "role": "fifo_cap" }} , 
 	{ "name": "pixbuf_y_18", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_18", "role": "default" }} , 
 	{ "name": "pixbuf_y_17", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_17", "role": "default" }} , 
 	{ "name": "pixbuf_y_16", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_16", "role": "default" }} , 
 	{ "name": "pixbuf_y_15", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_15", "role": "default" }} , 
 	{ "name": "mpix_cr", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mpix_cr", "role": "default" }} , 
 	{ "name": "mpix_cb", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mpix_cb", "role": "default" }} , 
 	{ "name": "storemerge_lcssa850_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "storemerge_lcssa850_i", "role": "default" }} , 
 	{ "name": "p_0_0_0_0_0509_1_3788_lcssa847_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_0_0_0509_1_3788_lcssa847_i", "role": "default" }} , 
 	{ "name": "p_0_3_0_0_0760_lcssa821_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_3_0_0_0760_lcssa821_i", "role": "default" }} , 
 	{ "name": "p_0_0_0_0_0517758_lcssa818_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_0_0_0517758_lcssa818_i", "role": "default" }} , 
 	{ "name": "loopWidth", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "loopWidth", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "select_ln765", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "select_ln765", "role": "default" }} , 
 	{ "name": "lshr_ln", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "lshr_ln", "role": "default" }} , 
 	{ "name": "pixbuf_y_24_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_24_out", "role": "default" }} , 
 	{ "name": "pixbuf_y_24_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pixbuf_y_24_out", "role": "ap_vld" }} , 
 	{ "name": "pixbuf_y_23_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_23_out", "role": "default" }} , 
 	{ "name": "pixbuf_y_23_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pixbuf_y_23_out", "role": "ap_vld" }} , 
 	{ "name": "pixbuf_y_22_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_22_out", "role": "default" }} , 
 	{ "name": "pixbuf_y_22_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pixbuf_y_22_out", "role": "ap_vld" }} , 
 	{ "name": "pixbuf_y_21_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_21_out", "role": "default" }} , 
 	{ "name": "pixbuf_y_21_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pixbuf_y_21_out", "role": "ap_vld" }} , 
 	{ "name": "pixbuf_y_20_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_20_out", "role": "i" }} , 
 	{ "name": "pixbuf_y_20_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_20_out", "role": "o" }} , 
 	{ "name": "pixbuf_y_20_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pixbuf_y_20_out", "role": "o_ap_vld" }} , 
 	{ "name": "pixbuf_y_19_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_19_out", "role": "i" }} , 
 	{ "name": "pixbuf_y_19_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_19_out", "role": "o" }} , 
 	{ "name": "pixbuf_y_19_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pixbuf_y_19_out", "role": "o_ap_vld" }} , 
 	{ "name": "mpix_cr_8_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mpix_cr_8_out", "role": "default" }} , 
 	{ "name": "mpix_cr_8_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mpix_cr_8_out", "role": "ap_vld" }} , 
 	{ "name": "mpix_cb_8_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mpix_cb_8_out", "role": "default" }} , 
 	{ "name": "mpix_cb_8_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mpix_cb_8_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0_0_0_3782_i_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_0_0_0_3782_i_out", "role": "i" }} , 
 	{ "name": "p_0_0_0_0_0_3782_i_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_0_0_0_3782_i_out", "role": "o" }} , 
 	{ "name": "p_0_0_0_0_0_3782_i_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0_0_0_3782_i_out", "role": "o_ap_vld" }} , 
 	{ "name": "p_0_0_0_0_0509_3778_i_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_0_0_0509_3778_i_out", "role": "i" }} , 
 	{ "name": "p_0_0_0_0_0509_3778_i_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_0_0_0509_3778_i_out", "role": "o" }} , 
 	{ "name": "p_0_0_0_0_0509_3778_i_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0_0_0509_3778_i_out", "role": "o_ap_vld" }} , 
 	{ "name": "p_0_0_0_0_0_2774_i_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_0_0_0_2774_i_out", "role": "i" }} , 
 	{ "name": "p_0_0_0_0_0_2774_i_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_0_0_0_2774_i_out", "role": "o" }} , 
 	{ "name": "p_0_0_0_0_0_2774_i_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0_0_0_2774_i_out", "role": "o_ap_vld" }} , 
 	{ "name": "p_0_0_0_0_0509_2770_i_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_0_0_0509_2770_i_out", "role": "i" }} , 
 	{ "name": "p_0_0_0_0_0509_2770_i_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_0_0_0509_2770_i_out", "role": "o" }} , 
 	{ "name": "p_0_0_0_0_0509_2770_i_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0_0_0509_2770_i_out", "role": "o_ap_vld" }} , 
 	{ "name": "inpix_0_5_0_0_0_load755_i_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inpix_0_5_0_0_0_load755_i_out", "role": "i" }} , 
 	{ "name": "inpix_0_5_0_0_0_load755_i_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inpix_0_5_0_0_0_load755_i_out", "role": "o" }} , 
 	{ "name": "inpix_0_5_0_0_0_load755_i_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inpix_0_5_0_0_0_load755_i_out", "role": "o_ap_vld" }} , 
 	{ "name": "inpix_0_4_0_0_0_load753_i_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inpix_0_4_0_0_0_load753_i_out", "role": "i" }} , 
 	{ "name": "inpix_0_4_0_0_0_load753_i_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inpix_0_4_0_0_0_load753_i_out", "role": "o" }} , 
 	{ "name": "inpix_0_4_0_0_0_load753_i_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inpix_0_4_0_0_0_load753_i_out", "role": "o_ap_vld" }} , 
 	{ "name": "inpix_0_3_0_0_0_load751_i_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inpix_0_3_0_0_0_load751_i_out", "role": "i" }} , 
 	{ "name": "inpix_0_3_0_0_0_load751_i_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inpix_0_3_0_0_0_load751_i_out", "role": "o" }} , 
 	{ "name": "inpix_0_3_0_0_0_load751_i_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inpix_0_3_0_0_0_load751_i_out", "role": "o_ap_vld" }} , 
 	{ "name": "inpix_0_2_0_0_0_load749_i_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inpix_0_2_0_0_0_load749_i_out", "role": "i" }} , 
 	{ "name": "inpix_0_2_0_0_0_load749_i_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inpix_0_2_0_0_0_load749_i_out", "role": "o" }} , 
 	{ "name": "inpix_0_2_0_0_0_load749_i_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inpix_0_2_0_0_0_load749_i_out", "role": "o_ap_vld" }} , 
 	{ "name": "inpix_0_1_0_0_0_load747_i_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inpix_0_1_0_0_0_load747_i_out", "role": "i" }} , 
 	{ "name": "inpix_0_1_0_0_0_load747_i_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inpix_0_1_0_0_0_load747_i_out", "role": "o" }} , 
 	{ "name": "inpix_0_1_0_0_0_load747_i_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inpix_0_1_0_0_0_load747_i_out", "role": "o_ap_vld" }} , 
 	{ "name": "inpix_0_0_0_0_0_load745_i_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inpix_0_0_0_0_0_load745_i_out", "role": "i" }} , 
 	{ "name": "inpix_0_0_0_0_0_load745_i_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inpix_0_0_0_0_0_load745_i_out", "role": "o" }} , 
 	{ "name": "inpix_0_0_0_0_0_load745_i_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inpix_0_0_0_0_0_load745_i_out", "role": "o_ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	v_hcresampler_core_Pipeline_VITIS_LOOP_769_2 {
		pixbuf_y_18 {Type I LastRead 0 FirstWrite -1}
		pixbuf_y_17 {Type I LastRead 0 FirstWrite -1}
		pixbuf_y_16 {Type I LastRead 0 FirstWrite -1}
		pixbuf_y_15 {Type I LastRead 0 FirstWrite -1}
		mpix_cr {Type I LastRead 0 FirstWrite -1}
		mpix_cb {Type I LastRead 0 FirstWrite -1}
		storemerge_lcssa850_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0_0_0509_1_3788_lcssa847_i {Type I LastRead 0 FirstWrite -1}
		p_0_3_0_0_0760_lcssa821_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0_0_0517758_lcssa818_i {Type I LastRead 0 FirstWrite -1}
		loopWidth {Type I LastRead 0 FirstWrite -1}
		stream_in_hresampled {Type O LastRead -1 FirstWrite 2}
		p_read {Type I LastRead 0 FirstWrite -1}
		select_ln765 {Type I LastRead 0 FirstWrite -1}
		lshr_ln {Type I LastRead 0 FirstWrite -1}
		stream_in {Type I LastRead 1 FirstWrite -1}
		pixbuf_y_24_out {Type O LastRead -1 FirstWrite 2}
		pixbuf_y_23_out {Type O LastRead -1 FirstWrite 2}
		pixbuf_y_22_out {Type O LastRead -1 FirstWrite 2}
		pixbuf_y_21_out {Type O LastRead -1 FirstWrite 2}
		pixbuf_y_20_out {Type IO LastRead 2 FirstWrite 2}
		pixbuf_y_19_out {Type IO LastRead 2 FirstWrite 2}
		mpix_cr_8_out {Type O LastRead -1 FirstWrite 2}
		mpix_cb_8_out {Type O LastRead -1 FirstWrite 2}
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
	{"Name" : "Latency", "Min" : "4", "Max" : "32771"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "32768"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	pixbuf_y_18 { ap_none {  { pixbuf_y_18 in_data 0 8 } } }
	pixbuf_y_17 { ap_none {  { pixbuf_y_17 in_data 0 8 } } }
	pixbuf_y_16 { ap_none {  { pixbuf_y_16 in_data 0 8 } } }
	pixbuf_y_15 { ap_none {  { pixbuf_y_15 in_data 0 8 } } }
	mpix_cr { ap_none {  { mpix_cr in_data 0 8 } } }
	mpix_cb { ap_none {  { mpix_cb in_data 0 8 } } }
	storemerge_lcssa850_i { ap_none {  { storemerge_lcssa850_i in_data 0 8 } } }
	p_0_0_0_0_0509_1_3788_lcssa847_i { ap_none {  { p_0_0_0_0_0509_1_3788_lcssa847_i in_data 0 8 } } }
	p_0_3_0_0_0760_lcssa821_i { ap_none {  { p_0_3_0_0_0760_lcssa821_i in_data 0 8 } } }
	p_0_0_0_0_0517758_lcssa818_i { ap_none {  { p_0_0_0_0_0517758_lcssa818_i in_data 0 8 } } }
	loopWidth { ap_none {  { loopWidth in_data 0 16 } } }
	stream_in_hresampled { ap_fifo {  { stream_in_hresampled_din fifo_data_out 1 48 }  { stream_in_hresampled_full_n fifo_status_empty 0 1 }  { stream_in_hresampled_write fifo_data_in 1 1 }  { stream_in_hresampled_num_data_valid fifo_update 0 32 }  { stream_in_hresampled_fifo_cap fifo_data 0 32 } } }
	p_read { ap_none {  { p_read in_data 0 1 } } }
	select_ln765 { ap_none {  { select_ln765 in_data 0 1 } } }
	lshr_ln { ap_stable {  { lshr_ln in_data 0 15 } } }
	stream_in { ap_fifo {  { stream_in_dout fifo_data_out 0 48 }  { stream_in_empty_n fifo_status_empty 0 1 }  { stream_in_read fifo_data_in 1 1 }  { stream_in_num_data_valid fifo_update 0 5 }  { stream_in_fifo_cap fifo_data 0 5 } } }
	pixbuf_y_24_out { ap_vld {  { pixbuf_y_24_out out_data 1 8 }  { pixbuf_y_24_out_ap_vld out_vld 1 1 } } }
	pixbuf_y_23_out { ap_vld {  { pixbuf_y_23_out out_data 1 8 }  { pixbuf_y_23_out_ap_vld out_vld 1 1 } } }
	pixbuf_y_22_out { ap_vld {  { pixbuf_y_22_out out_data 1 8 }  { pixbuf_y_22_out_ap_vld out_vld 1 1 } } }
	pixbuf_y_21_out { ap_vld {  { pixbuf_y_21_out out_data 1 8 }  { pixbuf_y_21_out_ap_vld out_vld 1 1 } } }
	pixbuf_y_20_out { ap_ovld {  { pixbuf_y_20_out_i in_data 0 8 }  { pixbuf_y_20_out_o out_data 1 8 }  { pixbuf_y_20_out_o_ap_vld out_vld 1 1 } } }
	pixbuf_y_19_out { ap_ovld {  { pixbuf_y_19_out_i in_data 0 8 }  { pixbuf_y_19_out_o out_data 1 8 }  { pixbuf_y_19_out_o_ap_vld out_vld 1 1 } } }
	mpix_cr_8_out { ap_vld {  { mpix_cr_8_out out_data 1 8 }  { mpix_cr_8_out_ap_vld out_vld 1 1 } } }
	mpix_cb_8_out { ap_vld {  { mpix_cb_8_out out_data 1 8 }  { mpix_cb_8_out_ap_vld out_vld 1 1 } } }
	p_0_0_0_0_0_3782_i_out { ap_ovld {  { p_0_0_0_0_0_3782_i_out_i in_data 0 8 }  { p_0_0_0_0_0_3782_i_out_o out_data 1 8 }  { p_0_0_0_0_0_3782_i_out_o_ap_vld out_vld 1 1 } } }
	p_0_0_0_0_0509_3778_i_out { ap_ovld {  { p_0_0_0_0_0509_3778_i_out_i in_data 0 8 }  { p_0_0_0_0_0509_3778_i_out_o out_data 1 8 }  { p_0_0_0_0_0509_3778_i_out_o_ap_vld out_vld 1 1 } } }
	p_0_0_0_0_0_2774_i_out { ap_ovld {  { p_0_0_0_0_0_2774_i_out_i in_data 0 8 }  { p_0_0_0_0_0_2774_i_out_o out_data 1 8 }  { p_0_0_0_0_0_2774_i_out_o_ap_vld out_vld 1 1 } } }
	p_0_0_0_0_0509_2770_i_out { ap_ovld {  { p_0_0_0_0_0509_2770_i_out_i in_data 0 8 }  { p_0_0_0_0_0509_2770_i_out_o out_data 1 8 }  { p_0_0_0_0_0509_2770_i_out_o_ap_vld out_vld 1 1 } } }
	inpix_0_5_0_0_0_load755_i_out { ap_ovld {  { inpix_0_5_0_0_0_load755_i_out_i in_data 0 8 }  { inpix_0_5_0_0_0_load755_i_out_o out_data 1 8 }  { inpix_0_5_0_0_0_load755_i_out_o_ap_vld out_vld 1 1 } } }
	inpix_0_4_0_0_0_load753_i_out { ap_ovld {  { inpix_0_4_0_0_0_load753_i_out_i in_data 0 8 }  { inpix_0_4_0_0_0_load753_i_out_o out_data 1 8 }  { inpix_0_4_0_0_0_load753_i_out_o_ap_vld out_vld 1 1 } } }
	inpix_0_3_0_0_0_load751_i_out { ap_ovld {  { inpix_0_3_0_0_0_load751_i_out_i in_data 0 8 }  { inpix_0_3_0_0_0_load751_i_out_o out_data 1 8 }  { inpix_0_3_0_0_0_load751_i_out_o_ap_vld out_vld 1 1 } } }
	inpix_0_2_0_0_0_load749_i_out { ap_ovld {  { inpix_0_2_0_0_0_load749_i_out_i in_data 0 8 }  { inpix_0_2_0_0_0_load749_i_out_o out_data 1 8 }  { inpix_0_2_0_0_0_load749_i_out_o_ap_vld out_vld 1 1 } } }
	inpix_0_1_0_0_0_load747_i_out { ap_ovld {  { inpix_0_1_0_0_0_load747_i_out_i in_data 0 8 }  { inpix_0_1_0_0_0_load747_i_out_o out_data 1 8 }  { inpix_0_1_0_0_0_load747_i_out_o_ap_vld out_vld 1 1 } } }
	inpix_0_0_0_0_0_load745_i_out { ap_ovld {  { inpix_0_0_0_0_0_load745_i_out_i in_data 0 8 }  { inpix_0_0_0_0_0_load745_i_out_o out_data 1 8 }  { inpix_0_0_0_0_0_load745_i_out_o_ap_vld out_vld 1 1 } } }
}
