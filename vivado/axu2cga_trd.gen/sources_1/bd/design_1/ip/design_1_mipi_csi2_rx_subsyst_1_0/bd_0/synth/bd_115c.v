//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_115c.bd
//Design : bd_115c
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_115c,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_115c,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1_mipi_csi2_rx_subsyst_1_0.hwdef" *) 
module bd_115c
   (clkoutphy_out,
    csirxss_csi_irq,
    csirxss_s_axi_araddr,
    csirxss_s_axi_arready,
    csirxss_s_axi_arvalid,
    csirxss_s_axi_awaddr,
    csirxss_s_axi_awready,
    csirxss_s_axi_awvalid,
    csirxss_s_axi_bready,
    csirxss_s_axi_bresp,
    csirxss_s_axi_bvalid,
    csirxss_s_axi_rdata,
    csirxss_s_axi_rready,
    csirxss_s_axi_rresp,
    csirxss_s_axi_rvalid,
    csirxss_s_axi_wdata,
    csirxss_s_axi_wready,
    csirxss_s_axi_wstrb,
    csirxss_s_axi_wvalid,
    dphy_clk_200M,
    lite_aclk,
    lite_aresetn,
    mipi_phy_if_clk_n,
    mipi_phy_if_clk_p,
    mipi_phy_if_data_n,
    mipi_phy_if_data_p,
    pll_lock_out,
    rxbyteclkhs,
    system_rst_out,
    video_aclk,
    video_aresetn,
    video_out_tdata,
    video_out_tdest,
    video_out_tlast,
    video_out_tready,
    video_out_tuser,
    video_out_tvalid);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLKOUTPHY_OUT CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLKOUTPHY_OUT, CLK_DOMAIN bd_115c_phy_0_clkoutphy_out, FREQ_HZ 1500000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output clkoutphy_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.CSIRXSS_CSI_IRQ INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.CSIRXSS_CSI_IRQ, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) output csirxss_csi_irq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csirxss_s_axi ARADDR" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME csirxss_s_axi, ADDR_WIDTH 12, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, DATA_WIDTH 32, FREQ_HZ 200000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [7:0]csirxss_s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csirxss_s_axi ARREADY" *) output csirxss_s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csirxss_s_axi ARVALID" *) input csirxss_s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csirxss_s_axi AWADDR" *) input [7:0]csirxss_s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csirxss_s_axi AWREADY" *) output csirxss_s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csirxss_s_axi AWVALID" *) input csirxss_s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csirxss_s_axi BREADY" *) input csirxss_s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csirxss_s_axi BRESP" *) output [1:0]csirxss_s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csirxss_s_axi BVALID" *) output csirxss_s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csirxss_s_axi RDATA" *) output [31:0]csirxss_s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csirxss_s_axi RREADY" *) input csirxss_s_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csirxss_s_axi RRESP" *) output [1:0]csirxss_s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csirxss_s_axi RVALID" *) output csirxss_s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csirxss_s_axi WDATA" *) input [31:0]csirxss_s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csirxss_s_axi WREADY" *) output csirxss_s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csirxss_s_axi WSTRB" *) input [3:0]csirxss_s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csirxss_s_axi WVALID" *) input csirxss_s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.DPHY_CLK_200M CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.DPHY_CLK_200M, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input dphy_clk_200M;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.LITE_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.LITE_ACLK, ASSOCIATED_BUSIF csirxss_s_axi, ASSOCIATED_RESET lite_aresetn, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input lite_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.LITE_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.LITE_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input lite_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if CLK_N" *) (* X_INTERFACE_MODE = "Slave" *) input mipi_phy_if_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if CLK_P" *) input mipi_phy_if_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if DATA_N" *) input [1:0]mipi_phy_if_data_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if DATA_P" *) input [1:0]mipi_phy_if_data_p;
  output pll_lock_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.RXBYTECLKHS CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.RXBYTECLKHS, CLK_DOMAIN bd_115c_phy_0_rxbyteclkhs, FREQ_HZ 125000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0" *) output rxbyteclkhs;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.SYSTEM_RST_OUT RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.SYSTEM_RST_OUT, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) output system_rst_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.VIDEO_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.VIDEO_ACLK, ASSOCIATED_BUSIF video_out, ASSOCIATED_RESET video_aresetn, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input video_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.VIDEO_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.VIDEO_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input video_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 video_out TDATA" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME video_out, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, FREQ_HZ 200000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 4, TDEST_WIDTH 10, TID_WIDTH 0, TUSER_WIDTH 1" *) output [31:0]video_out_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 video_out TDEST" *) output [9:0]video_out_tdest;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 video_out TLAST" *) output video_out_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 video_out TREADY" *) input video_out_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 video_out TUSER" *) output [0:0]video_out_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 video_out TVALID" *) output video_out_tvalid;

  wire clkoutphy_out;
  wire csirxss_csi_irq;
  wire [7:0]csirxss_s_axi_araddr;
  wire csirxss_s_axi_arready;
  wire csirxss_s_axi_arvalid;
  wire [7:0]csirxss_s_axi_awaddr;
  wire csirxss_s_axi_awready;
  wire csirxss_s_axi_awvalid;
  wire csirxss_s_axi_bready;
  wire [1:0]csirxss_s_axi_bresp;
  wire csirxss_s_axi_bvalid;
  wire [31:0]csirxss_s_axi_rdata;
  wire csirxss_s_axi_rready;
  wire [1:0]csirxss_s_axi_rresp;
  wire csirxss_s_axi_rvalid;
  wire [31:0]csirxss_s_axi_wdata;
  wire csirxss_s_axi_wready;
  wire [3:0]csirxss_s_axi_wstrb;
  wire csirxss_s_axi_wvalid;
  wire dphy_clk_200M;
  wire lite_aclk;
  wire lite_aresetn;
  wire mipi_phy_if_clk_n;
  wire mipi_phy_if_clk_p;
  wire [1:0]mipi_phy_if_data_n;
  wire [1:0]mipi_phy_if_data_p;
  wire phy_csirx_ppi_if_CL_ENABLE;
  wire phy_csirx_ppi_if_CL_RXULPSCLKNOT;
  wire phy_csirx_ppi_if_CL_STOPSTATE;
  wire phy_csirx_ppi_if_DL0_ENABLE;
  wire phy_csirx_ppi_if_DL0_ERRCONTROL;
  wire phy_csirx_ppi_if_DL0_ERRESC;
  wire phy_csirx_ppi_if_DL0_ERRSOTHS;
  wire phy_csirx_ppi_if_DL0_ERRSOTSYNCHS;
  wire phy_csirx_ppi_if_DL0_RXACTIVEHS;
  wire [7:0]phy_csirx_ppi_if_DL0_RXDATAHS;
  wire phy_csirx_ppi_if_DL0_RXSYNCHS;
  wire phy_csirx_ppi_if_DL0_RXVALIDHS;
  wire phy_csirx_ppi_if_DL0_STOPSTATE;
  wire phy_csirx_ppi_if_DL1_ENABLE;
  wire phy_csirx_ppi_if_DL1_ERRCONTROL;
  wire phy_csirx_ppi_if_DL1_ERRESC;
  wire phy_csirx_ppi_if_DL1_ERRSOTHS;
  wire phy_csirx_ppi_if_DL1_ERRSOTSYNCHS;
  wire phy_csirx_ppi_if_DL1_RXACTIVEHS;
  wire [7:0]phy_csirx_ppi_if_DL1_RXDATAHS;
  wire phy_csirx_ppi_if_DL1_RXSYNCHS;
  wire phy_csirx_ppi_if_DL1_RXVALIDHS;
  wire phy_csirx_ppi_if_DL1_STOPSTATE;
  wire pll_lock_out;
  wire [0:0]r_sync_peripheral_reset;
  wire rx_core_men_vfb;
  wire [63:0]rx_m_axis_TDATA;
  wire [3:0]rx_m_axis_TDEST;
  wire [7:0]rx_m_axis_TKEEP;
  wire rx_m_axis_TLAST;
  wire rx_m_axis_TREADY;
  wire [95:0]rx_m_axis_TUSER;
  wire rx_m_axis_TVALID;
  wire rxbyteclkhs;
  wire system_rst_out;
  wire vfb_0_core_men_ack_vfb;
  wire vfb_0_mdt_tr;
  wire vfb_0_mdt_tv;
  wire vfb_0_sdt_tr;
  wire vfb_0_sdt_tv;
  wire vfb_0_vfb_full;
  wire vfb_0_vfb_tr;
  wire vfb_0_vfb_tv;
  wire vfb_0_vfb_wc_full;
  wire video_aclk;
  wire video_aresetn;
  wire [31:0]video_out_tdata;
  wire [9:0]video_out_tdest;
  wire video_out_tlast;
  wire video_out_tready;
  wire [0:0]video_out_tuser;
  wire video_out_tvalid;

  bd_115c_phy_0 phy
       (.cl_enable(phy_csirx_ppi_if_CL_ENABLE),
        .cl_rxulpsclknot(phy_csirx_ppi_if_CL_RXULPSCLKNOT),
        .cl_stopstate(phy_csirx_ppi_if_CL_STOPSTATE),
        .clk_rxn(mipi_phy_if_clk_n),
        .clk_rxp(mipi_phy_if_clk_p),
        .clkoutphy_out(clkoutphy_out),
        .core_clk(dphy_clk_200M),
        .core_rst(r_sync_peripheral_reset),
        .data_rxn(mipi_phy_if_data_n),
        .data_rxp(mipi_phy_if_data_p),
        .dl0_enable(phy_csirx_ppi_if_DL0_ENABLE),
        .dl0_errcontrol(phy_csirx_ppi_if_DL0_ERRCONTROL),
        .dl0_erresc(phy_csirx_ppi_if_DL0_ERRESC),
        .dl0_errsoths(phy_csirx_ppi_if_DL0_ERRSOTHS),
        .dl0_errsotsynchs(phy_csirx_ppi_if_DL0_ERRSOTSYNCHS),
        .dl0_forcerxmode(1'b0),
        .dl0_rxactivehs(phy_csirx_ppi_if_DL0_RXACTIVEHS),
        .dl0_rxdatahs(phy_csirx_ppi_if_DL0_RXDATAHS),
        .dl0_rxsynchs(phy_csirx_ppi_if_DL0_RXSYNCHS),
        .dl0_rxvalidhs(phy_csirx_ppi_if_DL0_RXVALIDHS),
        .dl0_stopstate(phy_csirx_ppi_if_DL0_STOPSTATE),
        .dl1_enable(phy_csirx_ppi_if_DL1_ENABLE),
        .dl1_errcontrol(phy_csirx_ppi_if_DL1_ERRCONTROL),
        .dl1_erresc(phy_csirx_ppi_if_DL1_ERRESC),
        .dl1_errsoths(phy_csirx_ppi_if_DL1_ERRSOTHS),
        .dl1_errsotsynchs(phy_csirx_ppi_if_DL1_ERRSOTSYNCHS),
        .dl1_forcerxmode(1'b0),
        .dl1_rxactivehs(phy_csirx_ppi_if_DL1_RXACTIVEHS),
        .dl1_rxdatahs(phy_csirx_ppi_if_DL1_RXDATAHS),
        .dl1_rxsynchs(phy_csirx_ppi_if_DL1_RXSYNCHS),
        .dl1_rxvalidhs(phy_csirx_ppi_if_DL1_RXVALIDHS),
        .dl1_stopstate(phy_csirx_ppi_if_DL1_STOPSTATE),
        .pll_lock_out(pll_lock_out),
        .rxbyteclkhs(rxbyteclkhs),
        .system_rst_out(system_rst_out));
  bd_115c_r_sync_0 r_sync
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(video_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_reset(r_sync_peripheral_reset),
        .slowest_sync_clk(dphy_clk_200M));
  bd_115c_rx_0 rx
       (.cl_enable(phy_csirx_ppi_if_CL_ENABLE),
        .cl_rxulpsclknot(phy_csirx_ppi_if_CL_RXULPSCLKNOT),
        .cl_stopstate(phy_csirx_ppi_if_CL_STOPSTATE),
        .core_clk(dphy_clk_200M),
        .core_men_ack_vfb(vfb_0_core_men_ack_vfb),
        .core_men_vfb(rx_core_men_vfb),
        .dl0_errcontrol(phy_csirx_ppi_if_DL0_ERRCONTROL),
        .dl0_erresc(phy_csirx_ppi_if_DL0_ERRESC),
        .dl0_errsoths(phy_csirx_ppi_if_DL0_ERRSOTHS),
        .dl0_errsotsynchs(phy_csirx_ppi_if_DL0_ERRSOTSYNCHS),
        .dl0_rxactivehs(phy_csirx_ppi_if_DL0_RXACTIVEHS),
        .dl0_rxbyteclkhs(rxbyteclkhs),
        .dl0_rxdatahs(phy_csirx_ppi_if_DL0_RXDATAHS),
        .dl0_rxsynchs(phy_csirx_ppi_if_DL0_RXSYNCHS),
        .dl0_rxulpmesc(1'b0),
        .dl0_rxvalidhs(phy_csirx_ppi_if_DL0_RXVALIDHS),
        .dl0_shutdown(phy_csirx_ppi_if_DL0_ENABLE),
        .dl0_stopstate(phy_csirx_ppi_if_DL0_STOPSTATE),
        .dl1_errcontrol(phy_csirx_ppi_if_DL1_ERRCONTROL),
        .dl1_erresc(phy_csirx_ppi_if_DL1_ERRESC),
        .dl1_errsoths(phy_csirx_ppi_if_DL1_ERRSOTHS),
        .dl1_errsotsynchs(phy_csirx_ppi_if_DL1_ERRSOTSYNCHS),
        .dl1_rxactivehs(phy_csirx_ppi_if_DL1_RXACTIVEHS),
        .dl1_rxbyteclkhs(rxbyteclkhs),
        .dl1_rxdatahs(phy_csirx_ppi_if_DL1_RXDATAHS),
        .dl1_rxsynchs(phy_csirx_ppi_if_DL1_RXSYNCHS),
        .dl1_rxulpmesc(1'b0),
        .dl1_rxvalidhs(phy_csirx_ppi_if_DL1_RXVALIDHS),
        .dl1_shutdown(phy_csirx_ppi_if_DL1_ENABLE),
        .dl1_stopstate(phy_csirx_ppi_if_DL1_STOPSTATE),
        .interrupt(csirxss_csi_irq),
        .m_axis_aclk(video_aclk),
        .m_axis_aresetn(video_aresetn),
        .m_axis_tdata(rx_m_axis_TDATA),
        .m_axis_tdest(rx_m_axis_TDEST),
        .m_axis_tkeep(rx_m_axis_TKEEP),
        .m_axis_tlast(rx_m_axis_TLAST),
        .m_axis_tready(rx_m_axis_TREADY),
        .m_axis_tuser(rx_m_axis_TUSER),
        .m_axis_tvalid(rx_m_axis_TVALID),
        .mdt_tr(vfb_0_mdt_tr),
        .mdt_tv(vfb_0_mdt_tv),
        .s_axi_aclk(lite_aclk),
        .s_axi_araddr(csirxss_s_axi_araddr),
        .s_axi_aresetn(lite_aresetn),
        .s_axi_arready(csirxss_s_axi_arready),
        .s_axi_arvalid(csirxss_s_axi_arvalid),
        .s_axi_awaddr(csirxss_s_axi_awaddr),
        .s_axi_awready(csirxss_s_axi_awready),
        .s_axi_awvalid(csirxss_s_axi_awvalid),
        .s_axi_bready(csirxss_s_axi_bready),
        .s_axi_bresp(csirxss_s_axi_bresp),
        .s_axi_bvalid(csirxss_s_axi_bvalid),
        .s_axi_rdata(csirxss_s_axi_rdata),
        .s_axi_rready(csirxss_s_axi_rready),
        .s_axi_rresp(csirxss_s_axi_rresp),
        .s_axi_rvalid(csirxss_s_axi_rvalid),
        .s_axi_wdata(csirxss_s_axi_wdata),
        .s_axi_wready(csirxss_s_axi_wready),
        .s_axi_wstrb(csirxss_s_axi_wstrb),
        .s_axi_wvalid(csirxss_s_axi_wvalid),
        .sdt_tr(vfb_0_sdt_tr),
        .sdt_tv(vfb_0_sdt_tv),
        .vfb_full(vfb_0_vfb_full),
        .vfb_tr(vfb_0_vfb_tr),
        .vfb_tv(vfb_0_vfb_tv),
        .vfb_wc_full(vfb_0_vfb_wc_full),
        .video_aclk(video_aclk));
  bd_115c_vfb_0_0 vfb_0
       (.core_men_ack_vfb(vfb_0_core_men_ack_vfb),
        .core_men_vfb(rx_core_men_vfb),
        .mdt_tr(vfb_0_mdt_tr),
        .mdt_tv(vfb_0_mdt_tv),
        .s_axis_aclk(video_aclk),
        .s_axis_aresetn(video_aresetn),
        .s_axis_tdata(rx_m_axis_TDATA),
        .s_axis_tdest(rx_m_axis_TDEST),
        .s_axis_tkeep(rx_m_axis_TKEEP),
        .s_axis_tlast(rx_m_axis_TLAST),
        .s_axis_tready(rx_m_axis_TREADY),
        .s_axis_tuser(rx_m_axis_TUSER),
        .s_axis_tvalid(rx_m_axis_TVALID),
        .sdt_tr(vfb_0_sdt_tr),
        .sdt_tv(vfb_0_sdt_tv),
        .vfb_arstn(video_aresetn),
        .vfb_clk(video_aclk),
        .vfb_data(video_out_tdata),
        .vfb_eol(video_out_tlast),
        .vfb_full(vfb_0_vfb_full),
        .vfb_ready(video_out_tready),
        .vfb_sof(video_out_tuser),
        .vfb_tr(vfb_0_vfb_tr),
        .vfb_tv(vfb_0_vfb_tv),
        .vfb_valid(video_out_tvalid),
        .vfb_vcdt(video_out_tdest),
        .vfb_wc_full(vfb_0_vfb_wc_full));
endmodule
