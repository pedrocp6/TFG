set moduleName FrmbufWrHlsDataFlow
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set isPipelined_legacy 1
set pipeline_type dataflow
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
set C_modelName {FrmbufWrHlsDataFlow}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ s_axis_video_V_data_V int 48 regular {axi_s 0 volatile  { s_axis_video Data } }  }
	{ s_axis_video_V_keep_V int 6 regular {axi_s 0 volatile  { s_axis_video Keep } }  }
	{ s_axis_video_V_strb_V int 6 regular {axi_s 0 volatile  { s_axis_video Strb } }  }
	{ s_axis_video_V_user_V int 1 regular {axi_s 0 volatile  { s_axis_video User } }  }
	{ s_axis_video_V_last_V int 1 regular {axi_s 0 volatile  { s_axis_video Last } }  }
	{ s_axis_video_V_id_V int 1 regular {axi_s 0 volatile  { s_axis_video ID } }  }
	{ s_axis_video_V_dest_V int 1 regular {axi_s 0 volatile  { s_axis_video Dest } }  }
	{ mm_video int 128 regular {axi_master 1}  }
	{ HwReg_frm_buffer int 32 regular {ap_stable 0} }
	{ HwReg_frm_buffer2 int 32 regular {ap_stable 0} }
	{ WidthInBytes_val2 int 14 regular {ap_stable 0} }
	{ colorFormat_val3 int 3 regular {ap_stable 0} }
	{ width_val5 int 11 regular {ap_stable 0} }
	{ height_val8 int 11 regular {ap_stable 0} }
	{ stride_val9 int 16 regular {ap_stable 0} }
	{ video_format_val11 int 6 regular {ap_stable 0} }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_video_V_data_V", "interface" : "axis", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_keep_V", "interface" : "axis", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_strb_V", "interface" : "axis", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "mm_video", "interface" : "axi_master", "bitwidth" : 128, "direction" : "WRITEONLY", "id_num" : 0, "bitSlice":[ {"cElement": [{"cName": "frm_buffer","offset": { "type": "dynamic","port_name": "frm_buffer","bundle": "CTRL"},"direction": "WRITEONLY"},{"cName": "frm_buffer2","offset": { "type": "dynamic","port_name": "frm_buffer2","bundle": "CTRL"},"direction": "WRITEONLY"},{"cName": "frm_buffer3","offset": { "type": "dynamic","port_name": "frm_buffer3","bundle": "CTRL"}}]}]} , 
 	{ "Name" : "HwReg_frm_buffer", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_frm_buffer2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "WidthInBytes_val2", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "colorFormat_val3", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "width_val5", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "height_val8", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "stride_val9", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "video_format_val11", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 78
set portList { 
	{ s_axis_video_TDATA sc_in sc_lv 48 signal 0 } 
	{ s_axis_video_TKEEP sc_in sc_lv 6 signal 1 } 
	{ s_axis_video_TSTRB sc_in sc_lv 6 signal 2 } 
	{ s_axis_video_TUSER sc_in sc_lv 1 signal 3 } 
	{ s_axis_video_TLAST sc_in sc_lv 1 signal 4 } 
	{ s_axis_video_TID sc_in sc_lv 1 signal 5 } 
	{ s_axis_video_TDEST sc_in sc_lv 1 signal 6 } 
	{ m_axi_mm_video_0_AWVALID sc_out sc_logic 1 signal 7 } 
	{ m_axi_mm_video_0_AWREADY sc_in sc_logic 1 signal 7 } 
	{ m_axi_mm_video_0_AWADDR sc_out sc_lv 32 signal 7 } 
	{ m_axi_mm_video_0_AWID sc_out sc_lv 1 signal 7 } 
	{ m_axi_mm_video_0_AWLEN sc_out sc_lv 32 signal 7 } 
	{ m_axi_mm_video_0_AWSIZE sc_out sc_lv 3 signal 7 } 
	{ m_axi_mm_video_0_AWBURST sc_out sc_lv 2 signal 7 } 
	{ m_axi_mm_video_0_AWLOCK sc_out sc_lv 2 signal 7 } 
	{ m_axi_mm_video_0_AWCACHE sc_out sc_lv 4 signal 7 } 
	{ m_axi_mm_video_0_AWPROT sc_out sc_lv 3 signal 7 } 
	{ m_axi_mm_video_0_AWQOS sc_out sc_lv 4 signal 7 } 
	{ m_axi_mm_video_0_AWREGION sc_out sc_lv 4 signal 7 } 
	{ m_axi_mm_video_0_AWUSER sc_out sc_lv 1 signal 7 } 
	{ m_axi_mm_video_0_WVALID sc_out sc_logic 1 signal 7 } 
	{ m_axi_mm_video_0_WREADY sc_in sc_logic 1 signal 7 } 
	{ m_axi_mm_video_0_WDATA sc_out sc_lv 128 signal 7 } 
	{ m_axi_mm_video_0_WSTRB sc_out sc_lv 16 signal 7 } 
	{ m_axi_mm_video_0_WLAST sc_out sc_logic 1 signal 7 } 
	{ m_axi_mm_video_0_WID sc_out sc_lv 1 signal 7 } 
	{ m_axi_mm_video_0_WUSER sc_out sc_lv 1 signal 7 } 
	{ m_axi_mm_video_0_ARVALID sc_out sc_logic 1 signal 7 } 
	{ m_axi_mm_video_0_ARREADY sc_in sc_logic 1 signal 7 } 
	{ m_axi_mm_video_0_ARADDR sc_out sc_lv 32 signal 7 } 
	{ m_axi_mm_video_0_ARID sc_out sc_lv 1 signal 7 } 
	{ m_axi_mm_video_0_ARLEN sc_out sc_lv 32 signal 7 } 
	{ m_axi_mm_video_0_ARSIZE sc_out sc_lv 3 signal 7 } 
	{ m_axi_mm_video_0_ARBURST sc_out sc_lv 2 signal 7 } 
	{ m_axi_mm_video_0_ARLOCK sc_out sc_lv 2 signal 7 } 
	{ m_axi_mm_video_0_ARCACHE sc_out sc_lv 4 signal 7 } 
	{ m_axi_mm_video_0_ARPROT sc_out sc_lv 3 signal 7 } 
	{ m_axi_mm_video_0_ARQOS sc_out sc_lv 4 signal 7 } 
	{ m_axi_mm_video_0_ARREGION sc_out sc_lv 4 signal 7 } 
	{ m_axi_mm_video_0_ARUSER sc_out sc_lv 1 signal 7 } 
	{ m_axi_mm_video_0_RVALID sc_in sc_logic 1 signal 7 } 
	{ m_axi_mm_video_0_RREADY sc_out sc_logic 1 signal 7 } 
	{ m_axi_mm_video_0_RDATA sc_in sc_lv 128 signal 7 } 
	{ m_axi_mm_video_0_RLAST sc_in sc_logic 1 signal 7 } 
	{ m_axi_mm_video_0_RID sc_in sc_lv 1 signal 7 } 
	{ m_axi_mm_video_0_RFIFONUM sc_in sc_lv 9 signal 7 } 
	{ m_axi_mm_video_0_RUSER sc_in sc_lv 1 signal 7 } 
	{ m_axi_mm_video_0_RRESP sc_in sc_lv 2 signal 7 } 
	{ m_axi_mm_video_0_BVALID sc_in sc_logic 1 signal 7 } 
	{ m_axi_mm_video_0_BREADY sc_out sc_logic 1 signal 7 } 
	{ m_axi_mm_video_0_BRESP sc_in sc_lv 2 signal 7 } 
	{ m_axi_mm_video_0_BID sc_in sc_lv 1 signal 7 } 
	{ m_axi_mm_video_0_BUSER sc_in sc_lv 1 signal 7 } 
	{ HwReg_frm_buffer sc_in sc_lv 32 signal 8 } 
	{ HwReg_frm_buffer2 sc_in sc_lv 32 signal 9 } 
	{ WidthInBytes_val2 sc_in sc_lv 14 signal 10 } 
	{ colorFormat_val3 sc_in sc_lv 3 signal 11 } 
	{ width_val5 sc_in sc_lv 11 signal 12 } 
	{ height_val8 sc_in sc_lv 11 signal 13 } 
	{ stride_val9 sc_in sc_lv 16 signal 14 } 
	{ video_format_val11 sc_in sc_lv 6 signal 15 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ s_axis_video_TVALID sc_in sc_logic 1 invld 6 } 
	{ s_axis_video_TREADY sc_out sc_logic 1 inacc 6 } 
	{ height_val8_ap_vld sc_in sc_logic 1 invld 13 } 
	{ width_val5_ap_vld sc_in sc_logic 1 invld 12 } 
	{ colorFormat_val3_ap_vld sc_in sc_logic 1 invld 11 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ WidthInBytes_val2_ap_vld sc_in sc_logic 1 invld 10 } 
	{ video_format_val11_ap_vld sc_in sc_logic 1 invld 15 } 
	{ HwReg_frm_buffer_ap_vld sc_in sc_logic 1 invld 8 } 
	{ HwReg_frm_buffer2_ap_vld sc_in sc_logic 1 invld 9 } 
	{ stride_val9_ap_vld sc_in sc_logic 1 invld 14 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
}
set NewPortList {[ 
	{ "name": "s_axis_video_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "s_axis_video_V_data_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "s_axis_video_V_keep_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "s_axis_video_V_strb_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video_V_user_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video_V_last_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video_V_id_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video_V_dest_V", "role": "default" }} , 
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
 	{ "name": "HwReg_frm_buffer", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "HwReg_frm_buffer", "role": "default" }} , 
 	{ "name": "HwReg_frm_buffer2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "HwReg_frm_buffer2", "role": "default" }} , 
 	{ "name": "WidthInBytes_val2", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "WidthInBytes_val2", "role": "default" }} , 
 	{ "name": "colorFormat_val3", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "colorFormat_val3", "role": "default" }} , 
 	{ "name": "width_val5", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "width_val5", "role": "default" }} , 
 	{ "name": "height_val8", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "height_val8", "role": "default" }} , 
 	{ "name": "stride_val9", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "stride_val9", "role": "default" }} , 
 	{ "name": "video_format_val11", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "video_format_val11", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "s_axis_video_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_video_V_dest_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_video_V_dest_V", "role": "default" }} , 
 	{ "name": "height_val8_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "height_val8", "role": "ap_vld" }} , 
 	{ "name": "width_val5_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "width_val5", "role": "ap_vld" }} , 
 	{ "name": "colorFormat_val3_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "colorFormat_val3", "role": "ap_vld" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "WidthInBytes_val2_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "WidthInBytes_val2", "role": "ap_vld" }} , 
 	{ "name": "video_format_val11_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "video_format_val11", "role": "ap_vld" }} , 
 	{ "name": "HwReg_frm_buffer_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_frm_buffer", "role": "ap_vld" }} , 
 	{ "name": "HwReg_frm_buffer2_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_frm_buffer2", "role": "ap_vld" }} , 
 	{ "name": "stride_val9_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "stride_val9", "role": "ap_vld" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	FrmbufWrHlsDataFlow {
		s_axis_video_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_dest_V {Type I LastRead 1 FirstWrite -1}
		mm_video {Type O LastRead 112 FirstWrite 2}
		HwReg_frm_buffer {Type I LastRead 4 FirstWrite -1}
		HwReg_frm_buffer2 {Type I LastRead 4 FirstWrite -1}
		WidthInBytes_val2 {Type I LastRead 2 FirstWrite -1}
		colorFormat_val3 {Type I LastRead 0 FirstWrite -1}
		width_val5 {Type I LastRead 0 FirstWrite -1}
		height_val8 {Type I LastRead 0 FirstWrite -1}
		stride_val9 {Type I LastRead 4 FirstWrite -1}
		video_format_val11 {Type I LastRead 2 FirstWrite -1}}
	AXIvideo2MultiPixStream {
		s_axis_video_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_dest_V {Type I LastRead 1 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 2}
		Height_val {Type I LastRead 1 FirstWrite -1}
		WidthIn_val {Type I LastRead 1 FirstWrite -1}
		colorFormat_val {Type I LastRead 2 FirstWrite -1}}
	AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start {
		s_axis_video_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_strb_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_user_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_last_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_id_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_dest_V {Type I LastRead 0 FirstWrite -1}
		axi_last_out {Type O LastRead -1 FirstWrite 0}
		axi_data_promoted429_out {Type O LastRead -1 FirstWrite 0}}
	AXIvideo2MultiPixStream_Pipeline_loop_width {
		p_4_0_0_0187423_lcssa448 {Type I LastRead 0 FirstWrite -1}
		p_0_0_0_0179416_lcssa432 {Type I LastRead 0 FirstWrite -1}
		sof_2 {Type I LastRead 0 FirstWrite -1}
		colorFormat_val {Type I LastRead 0 FirstWrite -1}
		trunc_ln7 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 2}
		s_axis_video_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_dest_V {Type I LastRead 1 FirstWrite -1}
		p_4_0_0_0187424_out {Type O LastRead -1 FirstWrite 1}
		p_0_0_0_0179415_out {Type O LastRead -1 FirstWrite 1}}
	AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol {
		p_4_0_0_0187424_reload {Type I LastRead 0 FirstWrite -1}
		p_0_0_0_0179415_reload {Type I LastRead 0 FirstWrite -1}
		and_ln407 {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_strb_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_user_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_last_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_id_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_dest_V {Type I LastRead 0 FirstWrite -1}
		p_4_0_0_0187423_lcssa446_out {Type O LastRead -1 FirstWrite 0}
		p_0_0_0_0179416_lcssa430_out {Type O LastRead -1 FirstWrite 0}}
	reg_unsigned_short_s {
		d {Type I LastRead 1 FirstWrite -1}}
	reg_unsigned_short_s {
		d {Type I LastRead 1 FirstWrite -1}}
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
		pix_12_out {Type O LastRead -1 FirstWrite 1}}
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
	{"Name" : "Latency", "Min" : "265731", "Max" : "6227285"}
	, {"Name" : "Interval", "Min" : "7106", "Max" : "6227283"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_axis_video_V_data_V { axis {  { s_axis_video_TDATA in_data 0 48 } } }
	s_axis_video_V_keep_V { axis {  { s_axis_video_TKEEP in_data 0 6 } } }
	s_axis_video_V_strb_V { axis {  { s_axis_video_TSTRB in_data 0 6 } } }
	s_axis_video_V_user_V { axis {  { s_axis_video_TUSER in_data 0 1 } } }
	s_axis_video_V_last_V { axis {  { s_axis_video_TLAST in_data 0 1 } } }
	s_axis_video_V_id_V { axis {  { s_axis_video_TID in_data 0 1 } } }
	s_axis_video_V_dest_V { axis {  { s_axis_video_TDEST in_data 0 1 }  { s_axis_video_TVALID in_vld 0 1 }  { s_axis_video_TREADY in_acc 1 1 } } }
	 { m_axi {  { m_axi_mm_video_0_AWVALID VALID 1 1 }  { m_axi_mm_video_0_AWREADY READY 0 1 }  { m_axi_mm_video_0_AWADDR ADDR 1 32 }  { m_axi_mm_video_0_AWID ID 1 1 }  { m_axi_mm_video_0_AWLEN SIZE 1 32 }  { m_axi_mm_video_0_AWSIZE BURST 1 3 }  { m_axi_mm_video_0_AWBURST LOCK 1 2 }  { m_axi_mm_video_0_AWLOCK CACHE 1 2 }  { m_axi_mm_video_0_AWCACHE PROT 1 4 }  { m_axi_mm_video_0_AWPROT QOS 1 3 }  { m_axi_mm_video_0_AWQOS REGION 1 4 }  { m_axi_mm_video_0_AWREGION USER 1 4 }  { m_axi_mm_video_0_AWUSER DATA 1 1 }  { m_axi_mm_video_0_WVALID VALID 1 1 }  { m_axi_mm_video_0_WREADY READY 0 1 }  { m_axi_mm_video_0_WDATA FIFONUM 1 128 }  { m_axi_mm_video_0_WSTRB STRB 1 16 }  { m_axi_mm_video_0_WLAST LAST 1 1 }  { m_axi_mm_video_0_WID ID 1 1 }  { m_axi_mm_video_0_WUSER DATA 1 1 }  { m_axi_mm_video_0_ARVALID VALID 1 1 }  { m_axi_mm_video_0_ARREADY READY 0 1 }  { m_axi_mm_video_0_ARADDR ADDR 1 32 }  { m_axi_mm_video_0_ARID ID 1 1 }  { m_axi_mm_video_0_ARLEN SIZE 1 32 }  { m_axi_mm_video_0_ARSIZE BURST 1 3 }  { m_axi_mm_video_0_ARBURST LOCK 1 2 }  { m_axi_mm_video_0_ARLOCK CACHE 1 2 }  { m_axi_mm_video_0_ARCACHE PROT 1 4 }  { m_axi_mm_video_0_ARPROT QOS 1 3 }  { m_axi_mm_video_0_ARQOS REGION 1 4 }  { m_axi_mm_video_0_ARREGION USER 1 4 }  { m_axi_mm_video_0_ARUSER DATA 1 1 }  { m_axi_mm_video_0_RVALID VALID 0 1 }  { m_axi_mm_video_0_RREADY READY 1 1 }  { m_axi_mm_video_0_RDATA FIFONUM 0 128 }  { m_axi_mm_video_0_RLAST LAST 0 1 }  { m_axi_mm_video_0_RID ID 0 1 }  { m_axi_mm_video_0_RFIFONUM LEN 0 9 }  { m_axi_mm_video_0_RUSER DATA 0 1 }  { m_axi_mm_video_0_RRESP RESP 0 2 }  { m_axi_mm_video_0_BVALID VALID 0 1 }  { m_axi_mm_video_0_BREADY READY 1 1 }  { m_axi_mm_video_0_BRESP RESP 0 2 }  { m_axi_mm_video_0_BID ID 0 1 }  { m_axi_mm_video_0_BUSER DATA 0 1 } } }
	HwReg_frm_buffer { ap_none {  { HwReg_frm_buffer in_data 0 32 }  { HwReg_frm_buffer_ap_vld in_vld 0 1 } } }
	HwReg_frm_buffer2 { ap_none {  { HwReg_frm_buffer2 in_data 0 32 }  { HwReg_frm_buffer2_ap_vld in_vld 0 1 } } }
	WidthInBytes_val2 { ap_none {  { WidthInBytes_val2 in_data 0 14 }  { WidthInBytes_val2_ap_vld in_vld 0 1 } } }
	colorFormat_val3 { ap_none {  { colorFormat_val3 in_data 0 3 }  { colorFormat_val3_ap_vld in_vld 0 1 } } }
	width_val5 { ap_none {  { width_val5 in_data 0 11 }  { width_val5_ap_vld in_vld 0 1 } } }
	height_val8 { ap_none {  { height_val8 in_data 0 11 }  { height_val8_ap_vld in_vld 0 1 } } }
	stride_val9 { ap_none {  { stride_val9 in_data 0 16 }  { stride_val9_ap_vld in_vld 0 1 } } }
	video_format_val11 { ap_none {  { video_format_val11 in_data 0 6 }  { video_format_val11_ap_vld in_vld 0 1 } } }
}
