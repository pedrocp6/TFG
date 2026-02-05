-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Wed Jan 21 13:03:25 2026
-- Host        : LAPTOP-N1KB207U running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_mipi_csi2_rx_subsyst_1_0/bd_0/ip/ip_1/bd_115c_rx_0_stub.vhdl
-- Design      : bd_115c_rx_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu2cg-sfvc784-1-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bd_115c_rx_0 is
  Port ( 
    core_clk : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    cl_stopstate : in STD_LOGIC;
    cl_enable : out STD_LOGIC;
    cl_rxulpsclknot : in STD_LOGIC;
    vfb_full : in STD_LOGIC;
    vfb_wc_full : in STD_LOGIC;
    core_men_ack_vfb : in STD_LOGIC;
    core_men_vfb : out STD_LOGIC;
    dl0_rxbyteclkhs : in STD_LOGIC;
    dl0_rxdatahs : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dl0_rxvalidhs : in STD_LOGIC;
    dl0_rxactivehs : in STD_LOGIC;
    dl0_rxsynchs : in STD_LOGIC;
    dl0_stopstate : in STD_LOGIC;
    dl0_shutdown : out STD_LOGIC;
    dl0_rxulpmesc : in STD_LOGIC;
    dl0_errsoths : in STD_LOGIC;
    dl0_errsotsynchs : in STD_LOGIC;
    dl0_erresc : in STD_LOGIC;
    dl0_errcontrol : in STD_LOGIC;
    dl1_rxbyteclkhs : in STD_LOGIC;
    dl1_rxdatahs : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dl1_rxvalidhs : in STD_LOGIC;
    dl1_rxactivehs : in STD_LOGIC;
    dl1_rxsynchs : in STD_LOGIC;
    dl1_stopstate : in STD_LOGIC;
    dl1_shutdown : out STD_LOGIC;
    dl1_rxulpmesc : in STD_LOGIC;
    dl1_errsoths : in STD_LOGIC;
    dl1_errsotsynchs : in STD_LOGIC;
    dl1_erresc : in STD_LOGIC;
    dl1_errcontrol : in STD_LOGIC;
    video_aclk : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tlast : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 95 downto 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 3 downto 0 );
    mdt_tv : in STD_LOGIC;
    mdt_tr : in STD_LOGIC;
    sdt_tv : in STD_LOGIC;
    sdt_tr : in STD_LOGIC;
    vfb_tv : in STD_LOGIC;
    vfb_tr : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    frame_rcvd_pulse_out : out STD_LOGIC
  );

  attribute AXIS_FIFO_DCNT_WIDTH : integer;
  attribute AXIS_FIFO_DCNT_WIDTH of bd_115c_rx_0 : entity is 11;
  attribute AXIS_FIFO_DEPTH : integer;
  attribute AXIS_FIFO_DEPTH of bd_115c_rx_0 : entity is 2048;
  attribute AXIS_TDATA_WIDTH : integer;
  attribute AXIS_TDATA_WIDTH of bd_115c_rx_0 : entity is 64;
  attribute AXIS_TDEST_WIDTH : integer;
  attribute AXIS_TDEST_WIDTH of bd_115c_rx_0 : entity is 4;
  attribute AXIS_TUSER_WIDTH : integer;
  attribute AXIS_TUSER_WIDTH of bd_115c_rx_0 : entity is 96;
  attribute CMN_INC_VFB : string;
  attribute CMN_INC_VFB of bd_115c_rx_0 : entity is "true";
  attribute CSI_EN_VC_SUPPORT : integer;
  attribute CSI_EN_VC_SUPPORT of bd_115c_rx_0 : entity is 1;
  attribute CSI_FIXED_VC : integer;
  attribute CSI_FIXED_VC of bd_115c_rx_0 : entity is 0;
  attribute CSI_INV_SHUTDOWN : integer;
  attribute CSI_INV_SHUTDOWN of bd_115c_rx_0 : entity is 1;
  attribute CSI_LANES : integer;
  attribute CSI_LANES of bd_115c_rx_0 : entity is 2;
  attribute CSI_OFFLOAD_NONIMAGE : integer;
  attribute CSI_OFFLOAD_NONIMAGE of bd_115c_rx_0 : entity is 0;
  attribute CSI_VC_OFF_0 : integer;
  attribute CSI_VC_OFF_0 of bd_115c_rx_0 : entity is 1;
  attribute CSI_VC_OFF_1 : integer;
  attribute CSI_VC_OFF_1 of bd_115c_rx_0 : entity is 2;
  attribute CSI_VC_OFF_10 : integer;
  attribute CSI_VC_OFF_10 of bd_115c_rx_0 : entity is 11;
  attribute CSI_VC_OFF_11 : integer;
  attribute CSI_VC_OFF_11 of bd_115c_rx_0 : entity is 12;
  attribute CSI_VC_OFF_12 : integer;
  attribute CSI_VC_OFF_12 of bd_115c_rx_0 : entity is 13;
  attribute CSI_VC_OFF_13 : integer;
  attribute CSI_VC_OFF_13 of bd_115c_rx_0 : entity is 14;
  attribute CSI_VC_OFF_14 : integer;
  attribute CSI_VC_OFF_14 of bd_115c_rx_0 : entity is 15;
  attribute CSI_VC_OFF_2 : integer;
  attribute CSI_VC_OFF_2 of bd_115c_rx_0 : entity is 3;
  attribute CSI_VC_OFF_3 : integer;
  attribute CSI_VC_OFF_3 of bd_115c_rx_0 : entity is 4;
  attribute CSI_VC_OFF_4 : integer;
  attribute CSI_VC_OFF_4 of bd_115c_rx_0 : entity is 5;
  attribute CSI_VC_OFF_5 : integer;
  attribute CSI_VC_OFF_5 of bd_115c_rx_0 : entity is 6;
  attribute CSI_VC_OFF_6 : integer;
  attribute CSI_VC_OFF_6 of bd_115c_rx_0 : entity is 7;
  attribute CSI_VC_OFF_7 : integer;
  attribute CSI_VC_OFF_7 of bd_115c_rx_0 : entity is 8;
  attribute CSI_VC_OFF_8 : integer;
  attribute CSI_VC_OFF_8 of bd_115c_rx_0 : entity is 9;
  attribute CSI_VC_OFF_9 : integer;
  attribute CSI_VC_OFF_9 of bd_115c_rx_0 : entity is 10;
  attribute C_CSI2RX_DBG : integer;
  attribute C_CSI2RX_DBG of bd_115c_rx_0 : entity is 0;
  attribute C_CSI_FILTER_USERDATATYPE : integer;
  attribute C_CSI_FILTER_USERDATATYPE of bd_115c_rx_0 : entity is 0;
  attribute C_CSI_OPT1_REGS : integer;
  attribute C_CSI_OPT1_REGS of bd_115c_rx_0 : entity is 0;
  attribute C_CSI_OPT2_CRC : integer;
  attribute C_CSI_OPT2_CRC of bd_115c_rx_0 : entity is 0;
  attribute C_CSI_OPT3_FIXEDLANES : integer;
  attribute C_CSI_OPT3_FIXEDLANES of bd_115c_rx_0 : entity is 1;
  attribute C_DISABLE_LITE : integer;
  attribute C_DISABLE_LITE of bd_115c_rx_0 : entity is 0;
  attribute C_EN_CSI_V2_0 : string;
  attribute C_EN_CSI_V2_0 of bd_115c_rx_0 : entity is "false";
  attribute C_EN_VCX : string;
  attribute C_EN_VCX of bd_115c_rx_0 : entity is "false";
  attribute C_FAMILY : string;
  attribute C_FAMILY of bd_115c_rx_0 : entity is "zynquplus";
  attribute C_HS_LINE_RATE : integer;
  attribute C_HS_LINE_RATE of bd_115c_rx_0 : entity is 1000;
  attribute C_MIPI_SLV_INT : integer;
  attribute C_MIPI_SLV_INT of bd_115c_rx_0 : entity is 0;
  attribute C_RCVE_DESKEW_SEQ : string;
  attribute C_RCVE_DESKEW_SEQ of bd_115c_rx_0 : entity is "false";
  attribute C_SPRT_ISP_BRIDGE : integer;
  attribute C_SPRT_ISP_BRIDGE of bd_115c_rx_0 : entity is 0;
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of bd_115c_rx_0 : entity is 8;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of bd_115c_rx_0 : entity is 32;
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of bd_115c_rx_0 : entity is "yes";
end bd_115c_rx_0;

architecture stub of bd_115c_rx_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "core_clk,s_axi_aclk,s_axi_aresetn,s_axi_awaddr[7:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_araddr[7:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_rready,cl_stopstate,cl_enable,cl_rxulpsclknot,vfb_full,vfb_wc_full,core_men_ack_vfb,core_men_vfb,dl0_rxbyteclkhs,dl0_rxdatahs[7:0],dl0_rxvalidhs,dl0_rxactivehs,dl0_rxsynchs,dl0_stopstate,dl0_shutdown,dl0_rxulpmesc,dl0_errsoths,dl0_errsotsynchs,dl0_erresc,dl0_errcontrol,dl1_rxbyteclkhs,dl1_rxdatahs[7:0],dl1_rxvalidhs,dl1_rxactivehs,dl1_rxsynchs,dl1_stopstate,dl1_shutdown,dl1_rxulpmesc,dl1_errsoths,dl1_errsotsynchs,dl1_erresc,dl1_errcontrol,video_aclk,m_axis_aclk,m_axis_aresetn,m_axis_tready,m_axis_tvalid,m_axis_tlast,m_axis_tdata[63:0],m_axis_tkeep[7:0],m_axis_tuser[95:0],m_axis_tdest[3:0],mdt_tv,mdt_tr,sdt_tv,sdt_tr,vfb_tv,vfb_tr,interrupt,frame_rcvd_pulse_out";
begin
end;
