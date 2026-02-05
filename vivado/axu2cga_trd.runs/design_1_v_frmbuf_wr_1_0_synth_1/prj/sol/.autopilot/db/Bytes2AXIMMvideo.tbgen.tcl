set moduleName Bytes2AXIMMvideo
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
set C_modelName {Bytes2AXIMMvideo}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ bytePlanes_plane0 int 128 regular {fifo 0 volatile }  }
	{ bytePlanes_plane1 int 128 regular {fifo 0 volatile }  }
	{ mm_video int 128 regular {axi_master 1}  }
	{ dstImg int 32 regular {ap_stable 0} }
	{ dstImg2 int 32 regular {ap_stable 0} }
	{ Height_val int 11 regular {ap_stable 0} }
	{ WidthInBytes_val int 14 regular {ap_stable 0} }
	{ StrideInBytes_val int 16 regular {ap_stable 0} }
	{ VideoFormat_val int 6 regular {ap_stable 0} }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "bytePlanes_plane0", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes_plane1", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "mm_video", "interface" : "axi_master", "bitwidth" : 128, "direction" : "WRITEONLY", "id_num" : 0, "bitSlice":[ {"cElement": [{"cName": "frm_buffer","offset": { "type": "dynamic","port_name": "frm_buffer","bundle": "CTRL"},"direction": "WRITEONLY"},{"cName": "frm_buffer2","offset": { "type": "dynamic","port_name": "frm_buffer2","bundle": "CTRL"},"direction": "WRITEONLY"},{"cName": "frm_buffer3","offset": { "type": "dynamic","port_name": "frm_buffer3","bundle": "CTRL"}}]}]} , 
 	{ "Name" : "dstImg", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dstImg2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "Height_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "WidthInBytes_val", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "StrideInBytes_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "VideoFormat_val", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 69
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ bytePlanes_plane0_dout sc_in sc_lv 128 signal 0 } 
	{ bytePlanes_plane0_empty_n sc_in sc_logic 1 signal 0 } 
	{ bytePlanes_plane0_read sc_out sc_logic 1 signal 0 } 
	{ bytePlanes_plane0_num_data_valid sc_in sc_lv 9 signal 0 } 
	{ bytePlanes_plane0_fifo_cap sc_in sc_lv 9 signal 0 } 
	{ bytePlanes_plane1_dout sc_in sc_lv 128 signal 1 } 
	{ bytePlanes_plane1_empty_n sc_in sc_logic 1 signal 1 } 
	{ bytePlanes_plane1_read sc_out sc_logic 1 signal 1 } 
	{ bytePlanes_plane1_num_data_valid sc_in sc_lv 9 signal 1 } 
	{ bytePlanes_plane1_fifo_cap sc_in sc_lv 9 signal 1 } 
	{ m_axi_mm_video_0_AWVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_mm_video_0_AWREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_mm_video_0_AWADDR sc_out sc_lv 32 signal 2 } 
	{ m_axi_mm_video_0_AWID sc_out sc_lv 1 signal 2 } 
	{ m_axi_mm_video_0_AWLEN sc_out sc_lv 32 signal 2 } 
	{ m_axi_mm_video_0_AWSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_mm_video_0_AWBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_mm_video_0_AWLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_mm_video_0_AWCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_mm_video_0_AWPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_mm_video_0_AWQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_mm_video_0_AWREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_mm_video_0_AWUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_mm_video_0_WVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_mm_video_0_WREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_mm_video_0_WDATA sc_out sc_lv 128 signal 2 } 
	{ m_axi_mm_video_0_WSTRB sc_out sc_lv 16 signal 2 } 
	{ m_axi_mm_video_0_WLAST sc_out sc_logic 1 signal 2 } 
	{ m_axi_mm_video_0_WID sc_out sc_lv 1 signal 2 } 
	{ m_axi_mm_video_0_WUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_mm_video_0_ARVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_mm_video_0_ARREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_mm_video_0_ARADDR sc_out sc_lv 32 signal 2 } 
	{ m_axi_mm_video_0_ARID sc_out sc_lv 1 signal 2 } 
	{ m_axi_mm_video_0_ARLEN sc_out sc_lv 32 signal 2 } 
	{ m_axi_mm_video_0_ARSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_mm_video_0_ARBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_mm_video_0_ARLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_mm_video_0_ARCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_mm_video_0_ARPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_mm_video_0_ARQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_mm_video_0_ARREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_mm_video_0_ARUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_mm_video_0_RVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_mm_video_0_RREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_mm_video_0_RDATA sc_in sc_lv 128 signal 2 } 
	{ m_axi_mm_video_0_RLAST sc_in sc_logic 1 signal 2 } 
	{ m_axi_mm_video_0_RID sc_in sc_lv 1 signal 2 } 
	{ m_axi_mm_video_0_RFIFONUM sc_in sc_lv 9 signal 2 } 
	{ m_axi_mm_video_0_RUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_mm_video_0_RRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_mm_video_0_BVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_mm_video_0_BREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_mm_video_0_BRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_mm_video_0_BID sc_in sc_lv 1 signal 2 } 
	{ m_axi_mm_video_0_BUSER sc_in sc_lv 1 signal 2 } 
	{ dstImg sc_in sc_lv 32 signal 3 } 
	{ dstImg2 sc_in sc_lv 32 signal 4 } 
	{ Height_val sc_in sc_lv 11 signal 5 } 
	{ WidthInBytes_val sc_in sc_lv 14 signal 6 } 
	{ StrideInBytes_val sc_in sc_lv 16 signal 7 } 
	{ VideoFormat_val sc_in sc_lv 6 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "bytePlanes_plane0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "dout" }} , 
 	{ "name": "bytePlanes_plane0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "empty_n" }} , 
 	{ "name": "bytePlanes_plane0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "read" }} , 
 	{ "name": "bytePlanes_plane0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "num_data_valid" }} , 
 	{ "name": "bytePlanes_plane0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "fifo_cap" }} , 
 	{ "name": "bytePlanes_plane1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "dout" }} , 
 	{ "name": "bytePlanes_plane1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "empty_n" }} , 
 	{ "name": "bytePlanes_plane1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "read" }} , 
 	{ "name": "bytePlanes_plane1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "num_data_valid" }} , 
 	{ "name": "bytePlanes_plane1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "fifo_cap" }} , 
 	{ "name": "m_axi_mm_video_0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_AWVALID" }} , 
 	{ "name": "m_axi_mm_video_0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_AWREADY" }} , 
 	{ "name": "m_axi_mm_video_0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mm_video", "role": "0_AWADDR" }} , 
 	{ "name": "m_axi_mm_video_0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_AWID" }} , 
 	{ "name": "m_axi_mm_video_0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mm_video", "role": "0_AWLEN" }} , 
 	{ "name": "m_axi_mm_video_0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mm_video", "role": "0_AWSIZE" }} , 
 	{ "name": "m_axi_mm_video_0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video", "role": "0_AWBURST" }} , 
 	{ "name": "m_axi_mm_video_0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video", "role": "0_AWLOCK" }} , 
 	{ "name": "m_axi_mm_video_0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video", "role": "0_AWCACHE" }} , 
 	{ "name": "m_axi_mm_video_0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mm_video", "role": "0_AWPROT" }} , 
 	{ "name": "m_axi_mm_video_0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video", "role": "0_AWQOS" }} , 
 	{ "name": "m_axi_mm_video_0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video", "role": "0_AWREGION" }} , 
 	{ "name": "m_axi_mm_video_0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_AWUSER" }} , 
 	{ "name": "m_axi_mm_video_0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_WVALID" }} , 
 	{ "name": "m_axi_mm_video_0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_WREADY" }} , 
 	{ "name": "m_axi_mm_video_0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "mm_video", "role": "0_WDATA" }} , 
 	{ "name": "m_axi_mm_video_0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mm_video", "role": "0_WSTRB" }} , 
 	{ "name": "m_axi_mm_video_0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_WLAST" }} , 
 	{ "name": "m_axi_mm_video_0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_WID" }} , 
 	{ "name": "m_axi_mm_video_0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_WUSER" }} , 
 	{ "name": "m_axi_mm_video_0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_ARVALID" }} , 
 	{ "name": "m_axi_mm_video_0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_ARREADY" }} , 
 	{ "name": "m_axi_mm_video_0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mm_video", "role": "0_ARADDR" }} , 
 	{ "name": "m_axi_mm_video_0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_ARID" }} , 
 	{ "name": "m_axi_mm_video_0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mm_video", "role": "0_ARLEN" }} , 
 	{ "name": "m_axi_mm_video_0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mm_video", "role": "0_ARSIZE" }} , 
 	{ "name": "m_axi_mm_video_0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video", "role": "0_ARBURST" }} , 
 	{ "name": "m_axi_mm_video_0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video", "role": "0_ARLOCK" }} , 
 	{ "name": "m_axi_mm_video_0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video", "role": "0_ARCACHE" }} , 
 	{ "name": "m_axi_mm_video_0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mm_video", "role": "0_ARPROT" }} , 
 	{ "name": "m_axi_mm_video_0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video", "role": "0_ARQOS" }} , 
 	{ "name": "m_axi_mm_video_0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video", "role": "0_ARREGION" }} , 
 	{ "name": "m_axi_mm_video_0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_ARUSER" }} , 
 	{ "name": "m_axi_mm_video_0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_RVALID" }} , 
 	{ "name": "m_axi_mm_video_0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_RREADY" }} , 
 	{ "name": "m_axi_mm_video_0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "mm_video", "role": "0_RDATA" }} , 
 	{ "name": "m_axi_mm_video_0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_RLAST" }} , 
 	{ "name": "m_axi_mm_video_0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_RID" }} , 
 	{ "name": "m_axi_mm_video_0_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "mm_video", "role": "0_RFIFONUM" }} , 
 	{ "name": "m_axi_mm_video_0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_RUSER" }} , 
 	{ "name": "m_axi_mm_video_0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video", "role": "0_RRESP" }} , 
 	{ "name": "m_axi_mm_video_0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_BVALID" }} , 
 	{ "name": "m_axi_mm_video_0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_BREADY" }} , 
 	{ "name": "m_axi_mm_video_0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video", "role": "0_BRESP" }} , 
 	{ "name": "m_axi_mm_video_0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_BID" }} , 
 	{ "name": "m_axi_mm_video_0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "0_BUSER" }} , 
 	{ "name": "dstImg", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dstImg", "role": "default" }} , 
 	{ "name": "dstImg2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dstImg2", "role": "default" }} , 
 	{ "name": "Height_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "Height_val", "role": "default" }} , 
 	{ "name": "WidthInBytes_val", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "WidthInBytes_val", "role": "default" }} , 
 	{ "name": "StrideInBytes_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "StrideInBytes_val", "role": "default" }} , 
 	{ "name": "VideoFormat_val", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "VideoFormat_val", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	Bytes2AXIMMvideo {
		bytePlanes_plane0 {Type I LastRead 1 FirstWrite -1}
		bytePlanes_plane1 {Type I LastRead 1 FirstWrite -1}
		mm_video {Type O LastRead 112 FirstWrite 2}
		dstImg {Type I LastRead 0 FirstWrite -1}
		dstImg2 {Type I LastRead 0 FirstWrite -1}
		Height_val {Type I LastRead 0 FirstWrite -1}
		WidthInBytes_val {Type I LastRead 0 FirstWrite -1}
		StrideInBytes_val {Type I LastRead 0 FirstWrite -1}
		VideoFormat_val {Type I LastRead 0 FirstWrite -1}}
	Bytes2AXIMMvideo_Pipeline_VITIS_LOOP_1599_1 {
		loopWidth {Type I LastRead 0 FirstWrite -1}
		mm_video {Type O LastRead -1 FirstWrite 2}
		sext_ln1599 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 1 FirstWrite -1}}
	Bytes2AXIMMvideo_Pipeline_VITIS_LOOP_1609_2 {
		loopWidth {Type I LastRead 0 FirstWrite -1}
		mm_video {Type O LastRead -1 FirstWrite 2}
		sext_ln1609 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane1 {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "7105", "Max" : "1793881"}
	, {"Name" : "Interval", "Min" : "7105", "Max" : "1793881"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	bytePlanes_plane0 { ap_fifo {  { bytePlanes_plane0_dout fifo_data_out 0 128 }  { bytePlanes_plane0_empty_n fifo_status_empty 0 1 }  { bytePlanes_plane0_read fifo_data_in 1 1 }  { bytePlanes_plane0_num_data_valid fifo_update 0 9 }  { bytePlanes_plane0_fifo_cap fifo_data 0 9 } } }
	bytePlanes_plane1 { ap_fifo {  { bytePlanes_plane1_dout fifo_data_out 0 128 }  { bytePlanes_plane1_empty_n fifo_status_empty 0 1 }  { bytePlanes_plane1_read fifo_data_in 1 1 }  { bytePlanes_plane1_num_data_valid fifo_update 0 9 }  { bytePlanes_plane1_fifo_cap fifo_data 0 9 } } }
	 { m_axi {  { m_axi_mm_video_0_AWVALID VALID 1 1 }  { m_axi_mm_video_0_AWREADY READY 0 1 }  { m_axi_mm_video_0_AWADDR ADDR 1 32 }  { m_axi_mm_video_0_AWID ID 1 1 }  { m_axi_mm_video_0_AWLEN SIZE 1 32 }  { m_axi_mm_video_0_AWSIZE BURST 1 3 }  { m_axi_mm_video_0_AWBURST LOCK 1 2 }  { m_axi_mm_video_0_AWLOCK CACHE 1 2 }  { m_axi_mm_video_0_AWCACHE PROT 1 4 }  { m_axi_mm_video_0_AWPROT QOS 1 3 }  { m_axi_mm_video_0_AWQOS REGION 1 4 }  { m_axi_mm_video_0_AWREGION USER 1 4 }  { m_axi_mm_video_0_AWUSER DATA 1 1 }  { m_axi_mm_video_0_WVALID VALID 1 1 }  { m_axi_mm_video_0_WREADY READY 0 1 }  { m_axi_mm_video_0_WDATA FIFONUM 1 128 }  { m_axi_mm_video_0_WSTRB STRB 1 16 }  { m_axi_mm_video_0_WLAST LAST 1 1 }  { m_axi_mm_video_0_WID ID 1 1 }  { m_axi_mm_video_0_WUSER DATA 1 1 }  { m_axi_mm_video_0_ARVALID VALID 1 1 }  { m_axi_mm_video_0_ARREADY READY 0 1 }  { m_axi_mm_video_0_ARADDR ADDR 1 32 }  { m_axi_mm_video_0_ARID ID 1 1 }  { m_axi_mm_video_0_ARLEN SIZE 1 32 }  { m_axi_mm_video_0_ARSIZE BURST 1 3 }  { m_axi_mm_video_0_ARBURST LOCK 1 2 }  { m_axi_mm_video_0_ARLOCK CACHE 1 2 }  { m_axi_mm_video_0_ARCACHE PROT 1 4 }  { m_axi_mm_video_0_ARPROT QOS 1 3 }  { m_axi_mm_video_0_ARQOS REGION 1 4 }  { m_axi_mm_video_0_ARREGION USER 1 4 }  { m_axi_mm_video_0_ARUSER DATA 1 1 }  { m_axi_mm_video_0_RVALID VALID 0 1 }  { m_axi_mm_video_0_RREADY READY 1 1 }  { m_axi_mm_video_0_RDATA FIFONUM 0 128 }  { m_axi_mm_video_0_RLAST LAST 0 1 }  { m_axi_mm_video_0_RID ID 0 1 }  { m_axi_mm_video_0_RFIFONUM LEN 0 9 }  { m_axi_mm_video_0_RUSER DATA 0 1 }  { m_axi_mm_video_0_RRESP RESP 0 2 }  { m_axi_mm_video_0_BVALID VALID 0 1 }  { m_axi_mm_video_0_BREADY READY 1 1 }  { m_axi_mm_video_0_BRESP RESP 0 2 }  { m_axi_mm_video_0_BID ID 0 1 }  { m_axi_mm_video_0_BUSER DATA 0 1 } } }
	dstImg { ap_stable {  { dstImg in_data 0 32 } } }
	dstImg2 { ap_stable {  { dstImg2 in_data 0 32 } } }
	Height_val { ap_stable {  { Height_val in_data 0 11 } } }
	WidthInBytes_val { ap_stable {  { WidthInBytes_val in_data 0 14 } } }
	StrideInBytes_val { ap_stable {  { StrideInBytes_val in_data 0 16 } } }
	VideoFormat_val { ap_stable {  { VideoFormat_val in_data 0 6 } } }
}
