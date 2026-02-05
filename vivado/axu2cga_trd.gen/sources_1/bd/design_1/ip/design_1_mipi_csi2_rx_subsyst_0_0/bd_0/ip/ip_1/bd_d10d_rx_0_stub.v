// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Wed Jan 21 13:03:25 2026
// Host        : LAPTOP-N1KB207U running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_mipi_csi2_rx_subsyst_0_0/bd_0/ip/ip_1/bd_d10d_rx_0_stub.v
// Design      : bd_d10d_rx_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu2cg-sfvc784-1-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* AXIS_FIFO_DCNT_WIDTH = "11" *) (* AXIS_FIFO_DEPTH = "2048" *) (* AXIS_TDATA_WIDTH = "64" *) 
(* AXIS_TDEST_WIDTH = "4" *) (* AXIS_TUSER_WIDTH = "96" *) (* CMN_INC_VFB = "true" *) 
(* CSI_EN_VC_SUPPORT = "1" *) (* CSI_FIXED_VC = "0" *) (* CSI_INV_SHUTDOWN = "1" *) 
(* CSI_LANES = "2" *) (* CSI_OFFLOAD_NONIMAGE = "0" *) (* CSI_VC_OFF_0 = "1" *) 
(* CSI_VC_OFF_1 = "2" *) (* CSI_VC_OFF_10 = "11" *) (* CSI_VC_OFF_11 = "12" *) 
(* CSI_VC_OFF_12 = "13" *) (* CSI_VC_OFF_13 = "14" *) (* CSI_VC_OFF_14 = "15" *) 
(* CSI_VC_OFF_2 = "3" *) (* CSI_VC_OFF_3 = "4" *) (* CSI_VC_OFF_4 = "5" *) 
(* CSI_VC_OFF_5 = "6" *) (* CSI_VC_OFF_6 = "7" *) (* CSI_VC_OFF_7 = "8" *) 
(* CSI_VC_OFF_8 = "9" *) (* CSI_VC_OFF_9 = "10" *) (* C_CSI2RX_DBG = "0" *) 
(* C_CSI_FILTER_USERDATATYPE = "0" *) (* C_CSI_OPT1_REGS = "0" *) (* C_CSI_OPT2_CRC = "0" *) 
(* C_CSI_OPT3_FIXEDLANES = "1" *) (* C_DISABLE_LITE = "0" *) (* C_EN_CSI_V2_0 = "false" *) 
(* C_EN_VCX = "false" *) (* C_FAMILY = "zynquplus" *) (* C_HS_LINE_RATE = "1000" *) 
(* C_MIPI_SLV_INT = "0" *) (* C_RCVE_DESKEW_SEQ = "false" *) (* C_SPRT_ISP_BRIDGE = "0" *) 
(* C_S_AXI_ADDR_WIDTH = "8" *) (* C_S_AXI_DATA_WIDTH = "32" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
module bd_d10d_rx_0(core_clk, s_axi_aclk, s_axi_aresetn, 
  s_axi_awaddr, s_axi_awvalid, s_axi_awready, s_axi_wdata, s_axi_wstrb, s_axi_wvalid, 
  s_axi_wready, s_axi_bresp, s_axi_bvalid, s_axi_bready, s_axi_araddr, s_axi_arvalid, 
  s_axi_arready, s_axi_rdata, s_axi_rresp, s_axi_rvalid, s_axi_rready, cl_stopstate, cl_enable, 
  cl_rxulpsclknot, vfb_full, vfb_wc_full, core_men_ack_vfb, core_men_vfb, dl0_rxbyteclkhs, 
  dl0_rxdatahs, dl0_rxvalidhs, dl0_rxactivehs, dl0_rxsynchs, dl0_stopstate, dl0_shutdown, 
  dl0_rxulpmesc, dl0_errsoths, dl0_errsotsynchs, dl0_erresc, dl0_errcontrol, dl1_rxbyteclkhs, 
  dl1_rxdatahs, dl1_rxvalidhs, dl1_rxactivehs, dl1_rxsynchs, dl1_stopstate, dl1_shutdown, 
  dl1_rxulpmesc, dl1_errsoths, dl1_errsotsynchs, dl1_erresc, dl1_errcontrol, video_aclk, 
  m_axis_aclk, m_axis_aresetn, m_axis_tready, m_axis_tvalid, m_axis_tlast, m_axis_tdata, 
  m_axis_tkeep, m_axis_tuser, m_axis_tdest, mdt_tv, mdt_tr, sdt_tv, sdt_tr, vfb_tv, vfb_tr, 
  interrupt, frame_rcvd_pulse_out)
/* synthesis syn_black_box black_box_pad_pin="s_axi_aresetn,s_axi_awaddr[7:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_araddr[7:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_rready,cl_stopstate,cl_enable,cl_rxulpsclknot,vfb_full,vfb_wc_full,core_men_ack_vfb,core_men_vfb,dl0_rxdatahs[7:0],dl0_rxvalidhs,dl0_rxactivehs,dl0_rxsynchs,dl0_stopstate,dl0_shutdown,dl0_rxulpmesc,dl0_errsoths,dl0_errsotsynchs,dl0_erresc,dl0_errcontrol,dl1_rxdatahs[7:0],dl1_rxvalidhs,dl1_rxactivehs,dl1_rxsynchs,dl1_stopstate,dl1_shutdown,dl1_rxulpmesc,dl1_errsoths,dl1_errsotsynchs,dl1_erresc,dl1_errcontrol,m_axis_aresetn,m_axis_tready,m_axis_tvalid,m_axis_tlast,m_axis_tdata[63:0],m_axis_tkeep[7:0],m_axis_tuser[95:0],m_axis_tdest[3:0],mdt_tv,mdt_tr,sdt_tv,sdt_tr,vfb_tv,vfb_tr,interrupt,frame_rcvd_pulse_out" */
/* synthesis syn_force_seq_prim="core_clk" */
/* synthesis syn_force_seq_prim="s_axi_aclk" */
/* synthesis syn_force_seq_prim="dl0_rxbyteclkhs" */
/* synthesis syn_force_seq_prim="dl1_rxbyteclkhs" */
/* synthesis syn_force_seq_prim="video_aclk" */
/* synthesis syn_force_seq_prim="m_axis_aclk" */;
  input core_clk /* synthesis syn_isclock = 1 */;
  input s_axi_aclk /* synthesis syn_isclock = 1 */;
  input s_axi_aresetn;
  input [7:0]s_axi_awaddr;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [7:0]s_axi_araddr;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input s_axi_rready;
  input cl_stopstate;
  output cl_enable;
  input cl_rxulpsclknot;
  input vfb_full;
  input vfb_wc_full;
  input core_men_ack_vfb;
  output core_men_vfb;
  input dl0_rxbyteclkhs /* synthesis syn_isclock = 1 */;
  input [7:0]dl0_rxdatahs;
  input dl0_rxvalidhs;
  input dl0_rxactivehs;
  input dl0_rxsynchs;
  input dl0_stopstate;
  output dl0_shutdown;
  input dl0_rxulpmesc;
  input dl0_errsoths;
  input dl0_errsotsynchs;
  input dl0_erresc;
  input dl0_errcontrol;
  input dl1_rxbyteclkhs /* synthesis syn_isclock = 1 */;
  input [7:0]dl1_rxdatahs;
  input dl1_rxvalidhs;
  input dl1_rxactivehs;
  input dl1_rxsynchs;
  input dl1_stopstate;
  output dl1_shutdown;
  input dl1_rxulpmesc;
  input dl1_errsoths;
  input dl1_errsotsynchs;
  input dl1_erresc;
  input dl1_errcontrol;
  input video_aclk /* synthesis syn_isclock = 1 */;
  input m_axis_aclk /* synthesis syn_isclock = 1 */;
  input m_axis_aresetn;
  input m_axis_tready;
  output m_axis_tvalid;
  output m_axis_tlast;
  output [63:0]m_axis_tdata;
  output [7:0]m_axis_tkeep;
  output [95:0]m_axis_tuser;
  output [3:0]m_axis_tdest;
  input mdt_tv;
  input mdt_tr;
  input sdt_tv;
  input sdt_tr;
  input vfb_tv;
  input vfb_tr;
  output interrupt;
  output frame_rcvd_pulse_out;
endmodule
