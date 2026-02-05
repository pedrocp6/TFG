set moduleName v_hcresampler_core_1_Pipeline_VITIS_LOOP_769_2
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
set C_modelName {v_hcresampler_core.1_Pipeline_VITIS_LOOP_769_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ pixbuf_y_5 int 8 regular  }
	{ pixbuf_y_4 int 8 regular  }
	{ pixbuf_y_3 int 8 regular  }
	{ pixbuf_y_2 int 8 regular  }
	{ mpix_cr_1 int 8 regular  }
	{ mpix_cb_1 int 8 regular  }
	{ storemerge_lcssa850_i int 8 regular  }
	{ p_0_0_0_0_0509_1_3788_lcssa847_i int 8 regular  }
	{ p_0_3_0_0_0760_lcssa821_i int 8 regular  }
	{ p_0_0_0_0_0517758_lcssa818_i int 8 regular  }
	{ loopWidth int 16 regular  }
	{ stream_out_hresampled int 48 regular {fifo 1 volatile }  }
	{ p_read int 1 regular  }
	{ zext_ln730 int 1 regular  }
	{ lshr_ln int 15 regular {ap_stable 0} }
	{ stream_csc int 48 regular {fifo 0 volatile }  }
	{ pixbuf_y_11_out int 8 regular {pointer 1}  }
	{ pixbuf_y_10_out int 8 regular {pointer 1}  }
	{ pixbuf_y_9_out int 8 regular {pointer 1}  }
	{ pixbuf_y_8_out int 8 regular {pointer 1}  }
	{ pixbuf_y_7_out int 8 regular {pointer 2}  }
	{ pixbuf_y_6_out int 8 regular {pointer 2}  }
	{ mpix_cr_3_out int 8 regular {pointer 1}  }
	{ mpix_cr_2_out int 8 regular {pointer 2}  }
	{ mpix_cb_3_out int 8 regular {pointer 1}  }
	{ mpix_cb_2_out int 8 regular {pointer 2}  }
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
	{ "Name" : "pixbuf_y_5", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pixbuf_y_4", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pixbuf_y_3", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pixbuf_y_2", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "mpix_cr_1", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "mpix_cb_1", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "storemerge_lcssa850_i", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0_0_0509_1_3788_lcssa847_i", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_3_0_0_0760_lcssa821_i", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0_0_0517758_lcssa818_i", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "loopWidth", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "stream_out_hresampled", "interface" : "fifo", "bitwidth" : 48, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln730", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "lshr_ln", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "stream_csc", "interface" : "fifo", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "pixbuf_y_11_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pixbuf_y_10_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pixbuf_y_9_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pixbuf_y_8_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pixbuf_y_7_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "pixbuf_y_6_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "mpix_cr_3_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "mpix_cr_2_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "mpix_cb_3_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "mpix_cb_2_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
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
set portNum 84
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ stream_csc_dout sc_in sc_lv 48 signal 15 } 
	{ stream_csc_empty_n sc_in sc_logic 1 signal 15 } 
	{ stream_csc_read sc_out sc_logic 1 signal 15 } 
	{ stream_csc_num_data_valid sc_in sc_lv 5 signal 15 } 
	{ stream_csc_fifo_cap sc_in sc_lv 5 signal 15 } 
	{ stream_out_hresampled_din sc_out sc_lv 48 signal 11 } 
	{ stream_out_hresampled_full_n sc_in sc_logic 1 signal 11 } 
	{ stream_out_hresampled_write sc_out sc_logic 1 signal 11 } 
	{ stream_out_hresampled_num_data_valid sc_in sc_lv 32 signal 11 } 
	{ stream_out_hresampled_fifo_cap sc_in sc_lv 32 signal 11 } 
	{ pixbuf_y_5 sc_in sc_lv 8 signal 0 } 
	{ pixbuf_y_4 sc_in sc_lv 8 signal 1 } 
	{ pixbuf_y_3 sc_in sc_lv 8 signal 2 } 
	{ pixbuf_y_2 sc_in sc_lv 8 signal 3 } 
	{ mpix_cr_1 sc_in sc_lv 8 signal 4 } 
	{ mpix_cb_1 sc_in sc_lv 8 signal 5 } 
	{ storemerge_lcssa850_i sc_in sc_lv 8 signal 6 } 
	{ p_0_0_0_0_0509_1_3788_lcssa847_i sc_in sc_lv 8 signal 7 } 
	{ p_0_3_0_0_0760_lcssa821_i sc_in sc_lv 8 signal 8 } 
	{ p_0_0_0_0_0517758_lcssa818_i sc_in sc_lv 8 signal 9 } 
	{ loopWidth sc_in sc_lv 16 signal 10 } 
	{ p_read sc_in sc_lv 1 signal 12 } 
	{ zext_ln730 sc_in sc_lv 1 signal 13 } 
	{ lshr_ln sc_in sc_lv 15 signal 14 } 
	{ pixbuf_y_11_out sc_out sc_lv 8 signal 16 } 
	{ pixbuf_y_11_out_ap_vld sc_out sc_logic 1 outvld 16 } 
	{ pixbuf_y_10_out sc_out sc_lv 8 signal 17 } 
	{ pixbuf_y_10_out_ap_vld sc_out sc_logic 1 outvld 17 } 
	{ pixbuf_y_9_out sc_out sc_lv 8 signal 18 } 
	{ pixbuf_y_9_out_ap_vld sc_out sc_logic 1 outvld 18 } 
	{ pixbuf_y_8_out sc_out sc_lv 8 signal 19 } 
	{ pixbuf_y_8_out_ap_vld sc_out sc_logic 1 outvld 19 } 
	{ pixbuf_y_7_out_i sc_in sc_lv 8 signal 20 } 
	{ pixbuf_y_7_out_o sc_out sc_lv 8 signal 20 } 
	{ pixbuf_y_7_out_o_ap_vld sc_out sc_logic 1 outvld 20 } 
	{ pixbuf_y_6_out_i sc_in sc_lv 8 signal 21 } 
	{ pixbuf_y_6_out_o sc_out sc_lv 8 signal 21 } 
	{ pixbuf_y_6_out_o_ap_vld sc_out sc_logic 1 outvld 21 } 
	{ mpix_cr_3_out sc_out sc_lv 8 signal 22 } 
	{ mpix_cr_3_out_ap_vld sc_out sc_logic 1 outvld 22 } 
	{ mpix_cr_2_out_i sc_in sc_lv 8 signal 23 } 
	{ mpix_cr_2_out_o sc_out sc_lv 8 signal 23 } 
	{ mpix_cr_2_out_o_ap_vld sc_out sc_logic 1 outvld 23 } 
	{ mpix_cb_3_out sc_out sc_lv 8 signal 24 } 
	{ mpix_cb_3_out_ap_vld sc_out sc_logic 1 outvld 24 } 
	{ mpix_cb_2_out_i sc_in sc_lv 8 signal 25 } 
	{ mpix_cb_2_out_o sc_out sc_lv 8 signal 25 } 
	{ mpix_cb_2_out_o_ap_vld sc_out sc_logic 1 outvld 25 } 
	{ p_0_0_0_0_0_3782_i_out_i sc_in sc_lv 8 signal 26 } 
	{ p_0_0_0_0_0_3782_i_out_o sc_out sc_lv 8 signal 26 } 
	{ p_0_0_0_0_0_3782_i_out_o_ap_vld sc_out sc_logic 1 outvld 26 } 
	{ p_0_0_0_0_0509_3778_i_out_i sc_in sc_lv 8 signal 27 } 
	{ p_0_0_0_0_0509_3778_i_out_o sc_out sc_lv 8 signal 27 } 
	{ p_0_0_0_0_0509_3778_i_out_o_ap_vld sc_out sc_logic 1 outvld 27 } 
	{ p_0_0_0_0_0_2774_i_out_i sc_in sc_lv 8 signal 28 } 
	{ p_0_0_0_0_0_2774_i_out_o sc_out sc_lv 8 signal 28 } 
	{ p_0_0_0_0_0_2774_i_out_o_ap_vld sc_out sc_logic 1 outvld 28 } 
	{ p_0_0_0_0_0509_2770_i_out_i sc_in sc_lv 8 signal 29 } 
	{ p_0_0_0_0_0509_2770_i_out_o sc_out sc_lv 8 signal 29 } 
	{ p_0_0_0_0_0509_2770_i_out_o_ap_vld sc_out sc_logic 1 outvld 29 } 
	{ inpix_0_5_0_0_0_load755_i_out_i sc_in sc_lv 8 signal 30 } 
	{ inpix_0_5_0_0_0_load755_i_out_o sc_out sc_lv 8 signal 30 } 
	{ inpix_0_5_0_0_0_load755_i_out_o_ap_vld sc_out sc_logic 1 outvld 30 } 
	{ inpix_0_4_0_0_0_load753_i_out_i sc_in sc_lv 8 signal 31 } 
	{ inpix_0_4_0_0_0_load753_i_out_o sc_out sc_lv 8 signal 31 } 
	{ inpix_0_4_0_0_0_load753_i_out_o_ap_vld sc_out sc_logic 1 outvld 31 } 
	{ inpix_0_3_0_0_0_load751_i_out_i sc_in sc_lv 8 signal 32 } 
	{ inpix_0_3_0_0_0_load751_i_out_o sc_out sc_lv 8 signal 32 } 
	{ inpix_0_3_0_0_0_load751_i_out_o_ap_vld sc_out sc_logic 1 outvld 32 } 
	{ inpix_0_2_0_0_0_load749_i_out_i sc_in sc_lv 8 signal 33 } 
	{ inpix_0_2_0_0_0_load749_i_out_o sc_out sc_lv 8 signal 33 } 
	{ inpix_0_2_0_0_0_load749_i_out_o_ap_vld sc_out sc_logic 1 outvld 33 } 
	{ inpix_0_1_0_0_0_load747_i_out_i sc_in sc_lv 8 signal 34 } 
	{ inpix_0_1_0_0_0_load747_i_out_o sc_out sc_lv 8 signal 34 } 
	{ inpix_0_1_0_0_0_load747_i_out_o_ap_vld sc_out sc_logic 1 outvld 34 } 
	{ inpix_0_0_0_0_0_load745_i_out_i sc_in sc_lv 8 signal 35 } 
	{ inpix_0_0_0_0_0_load745_i_out_o sc_out sc_lv 8 signal 35 } 
	{ inpix_0_0_0_0_0_load745_i_out_o_ap_vld sc_out sc_logic 1 outvld 35 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "stream_csc_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "stream_csc", "role": "dout" }} , 
 	{ "name": "stream_csc_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_csc", "role": "empty_n" }} , 
 	{ "name": "stream_csc_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_csc", "role": "read" }} , 
 	{ "name": "stream_csc_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "stream_csc", "role": "num_data_valid" }} , 
 	{ "name": "stream_csc_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "stream_csc", "role": "fifo_cap" }} , 
 	{ "name": "stream_out_hresampled_din", "direction": "out", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "stream_out_hresampled", "role": "din" }} , 
 	{ "name": "stream_out_hresampled_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_out_hresampled", "role": "full_n" }} , 
 	{ "name": "stream_out_hresampled_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_out_hresampled", "role": "write" }} , 
 	{ "name": "stream_out_hresampled_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stream_out_hresampled", "role": "num_data_valid" }} , 
 	{ "name": "stream_out_hresampled_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stream_out_hresampled", "role": "fifo_cap" }} , 
 	{ "name": "pixbuf_y_5", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_5", "role": "default" }} , 
 	{ "name": "pixbuf_y_4", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_4", "role": "default" }} , 
 	{ "name": "pixbuf_y_3", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_3", "role": "default" }} , 
 	{ "name": "pixbuf_y_2", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_2", "role": "default" }} , 
 	{ "name": "mpix_cr_1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mpix_cr_1", "role": "default" }} , 
 	{ "name": "mpix_cb_1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mpix_cb_1", "role": "default" }} , 
 	{ "name": "storemerge_lcssa850_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "storemerge_lcssa850_i", "role": "default" }} , 
 	{ "name": "p_0_0_0_0_0509_1_3788_lcssa847_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_0_0_0509_1_3788_lcssa847_i", "role": "default" }} , 
 	{ "name": "p_0_3_0_0_0760_lcssa821_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_3_0_0_0760_lcssa821_i", "role": "default" }} , 
 	{ "name": "p_0_0_0_0_0517758_lcssa818_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_0_0_0517758_lcssa818_i", "role": "default" }} , 
 	{ "name": "loopWidth", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "loopWidth", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "zext_ln730", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "zext_ln730", "role": "default" }} , 
 	{ "name": "lshr_ln", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "lshr_ln", "role": "default" }} , 
 	{ "name": "pixbuf_y_11_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_11_out", "role": "default" }} , 
 	{ "name": "pixbuf_y_11_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pixbuf_y_11_out", "role": "ap_vld" }} , 
 	{ "name": "pixbuf_y_10_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_10_out", "role": "default" }} , 
 	{ "name": "pixbuf_y_10_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pixbuf_y_10_out", "role": "ap_vld" }} , 
 	{ "name": "pixbuf_y_9_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_9_out", "role": "default" }} , 
 	{ "name": "pixbuf_y_9_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pixbuf_y_9_out", "role": "ap_vld" }} , 
 	{ "name": "pixbuf_y_8_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_8_out", "role": "default" }} , 
 	{ "name": "pixbuf_y_8_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pixbuf_y_8_out", "role": "ap_vld" }} , 
 	{ "name": "pixbuf_y_7_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_7_out", "role": "i" }} , 
 	{ "name": "pixbuf_y_7_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_7_out", "role": "o" }} , 
 	{ "name": "pixbuf_y_7_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pixbuf_y_7_out", "role": "o_ap_vld" }} , 
 	{ "name": "pixbuf_y_6_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_6_out", "role": "i" }} , 
 	{ "name": "pixbuf_y_6_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixbuf_y_6_out", "role": "o" }} , 
 	{ "name": "pixbuf_y_6_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pixbuf_y_6_out", "role": "o_ap_vld" }} , 
 	{ "name": "mpix_cr_3_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mpix_cr_3_out", "role": "default" }} , 
 	{ "name": "mpix_cr_3_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mpix_cr_3_out", "role": "ap_vld" }} , 
 	{ "name": "mpix_cr_2_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mpix_cr_2_out", "role": "i" }} , 
 	{ "name": "mpix_cr_2_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mpix_cr_2_out", "role": "o" }} , 
 	{ "name": "mpix_cr_2_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mpix_cr_2_out", "role": "o_ap_vld" }} , 
 	{ "name": "mpix_cb_3_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mpix_cb_3_out", "role": "default" }} , 
 	{ "name": "mpix_cb_3_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mpix_cb_3_out", "role": "ap_vld" }} , 
 	{ "name": "mpix_cb_2_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mpix_cb_2_out", "role": "i" }} , 
 	{ "name": "mpix_cb_2_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mpix_cb_2_out", "role": "o" }} , 
 	{ "name": "mpix_cb_2_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mpix_cb_2_out", "role": "o_ap_vld" }} , 
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
	{"Name" : "Latency", "Min" : "4", "Max" : "32771"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "32768"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	pixbuf_y_5 { ap_none {  { pixbuf_y_5 in_data 0 8 } } }
	pixbuf_y_4 { ap_none {  { pixbuf_y_4 in_data 0 8 } } }
	pixbuf_y_3 { ap_none {  { pixbuf_y_3 in_data 0 8 } } }
	pixbuf_y_2 { ap_none {  { pixbuf_y_2 in_data 0 8 } } }
	mpix_cr_1 { ap_none {  { mpix_cr_1 in_data 0 8 } } }
	mpix_cb_1 { ap_none {  { mpix_cb_1 in_data 0 8 } } }
	storemerge_lcssa850_i { ap_none {  { storemerge_lcssa850_i in_data 0 8 } } }
	p_0_0_0_0_0509_1_3788_lcssa847_i { ap_none {  { p_0_0_0_0_0509_1_3788_lcssa847_i in_data 0 8 } } }
	p_0_3_0_0_0760_lcssa821_i { ap_none {  { p_0_3_0_0_0760_lcssa821_i in_data 0 8 } } }
	p_0_0_0_0_0517758_lcssa818_i { ap_none {  { p_0_0_0_0_0517758_lcssa818_i in_data 0 8 } } }
	loopWidth { ap_none {  { loopWidth in_data 0 16 } } }
	stream_out_hresampled { ap_fifo {  { stream_out_hresampled_din fifo_data_out 1 48 }  { stream_out_hresampled_full_n fifo_status_empty 0 1 }  { stream_out_hresampled_write fifo_data_in 1 1 }  { stream_out_hresampled_num_data_valid fifo_update 0 32 }  { stream_out_hresampled_fifo_cap fifo_data 0 32 } } }
	p_read { ap_none {  { p_read in_data 0 1 } } }
	zext_ln730 { ap_none {  { zext_ln730 in_data 0 1 } } }
	lshr_ln { ap_stable {  { lshr_ln in_data 0 15 } } }
	stream_csc { ap_fifo {  { stream_csc_dout fifo_data_out 0 48 }  { stream_csc_empty_n fifo_status_empty 0 1 }  { stream_csc_read fifo_data_in 1 1 }  { stream_csc_num_data_valid fifo_update 0 5 }  { stream_csc_fifo_cap fifo_data 0 5 } } }
	pixbuf_y_11_out { ap_vld {  { pixbuf_y_11_out out_data 1 8 }  { pixbuf_y_11_out_ap_vld out_vld 1 1 } } }
	pixbuf_y_10_out { ap_vld {  { pixbuf_y_10_out out_data 1 8 }  { pixbuf_y_10_out_ap_vld out_vld 1 1 } } }
	pixbuf_y_9_out { ap_vld {  { pixbuf_y_9_out out_data 1 8 }  { pixbuf_y_9_out_ap_vld out_vld 1 1 } } }
	pixbuf_y_8_out { ap_vld {  { pixbuf_y_8_out out_data 1 8 }  { pixbuf_y_8_out_ap_vld out_vld 1 1 } } }
	pixbuf_y_7_out { ap_ovld {  { pixbuf_y_7_out_i in_data 0 8 }  { pixbuf_y_7_out_o out_data 1 8 }  { pixbuf_y_7_out_o_ap_vld out_vld 1 1 } } }
	pixbuf_y_6_out { ap_ovld {  { pixbuf_y_6_out_i in_data 0 8 }  { pixbuf_y_6_out_o out_data 1 8 }  { pixbuf_y_6_out_o_ap_vld out_vld 1 1 } } }
	mpix_cr_3_out { ap_vld {  { mpix_cr_3_out out_data 1 8 }  { mpix_cr_3_out_ap_vld out_vld 1 1 } } }
	mpix_cr_2_out { ap_ovld {  { mpix_cr_2_out_i in_data 0 8 }  { mpix_cr_2_out_o out_data 1 8 }  { mpix_cr_2_out_o_ap_vld out_vld 1 1 } } }
	mpix_cb_3_out { ap_vld {  { mpix_cb_3_out out_data 1 8 }  { mpix_cb_3_out_ap_vld out_vld 1 1 } } }
	mpix_cb_2_out { ap_ovld {  { mpix_cb_2_out_i in_data 0 8 }  { mpix_cb_2_out_o out_data 1 8 }  { mpix_cb_2_out_o_ap_vld out_vld 1 1 } } }
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
