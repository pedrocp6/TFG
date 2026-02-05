-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Wed Jan 21 13:04:09 2026
-- Host        : LAPTOP-N1KB207U running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top design_1_v_frmbuf_wr_1_0 -prefix
--               design_1_v_frmbuf_wr_1_0_ design_1_v_frmbuf_wr_1_0_stub.vhdl
-- Design      : design_1_v_frmbuf_wr_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu2cg-sfvc784-1-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_v_frmbuf_wr_1_0 is
  Port ( 
    s_axi_CTRL_AWADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_CTRL_AWVALID : in STD_LOGIC;
    s_axi_CTRL_AWREADY : out STD_LOGIC;
    s_axi_CTRL_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_CTRL_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_CTRL_WVALID : in STD_LOGIC;
    s_axi_CTRL_WREADY : out STD_LOGIC;
    s_axi_CTRL_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_CTRL_BVALID : out STD_LOGIC;
    s_axi_CTRL_BREADY : in STD_LOGIC;
    s_axi_CTRL_ARADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_CTRL_ARVALID : in STD_LOGIC;
    s_axi_CTRL_ARREADY : out STD_LOGIC;
    s_axi_CTRL_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_CTRL_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_CTRL_RVALID : out STD_LOGIC;
    s_axi_CTRL_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    m_axi_mm_video_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm_video_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_mm_video_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm_video_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm_video_AWLOCK : out STD_LOGIC;
    m_axi_mm_video_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm_video_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm_video_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm_video_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm_video_AWVALID : out STD_LOGIC;
    m_axi_mm_video_AWREADY : in STD_LOGIC;
    m_axi_mm_video_WDATA : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axi_mm_video_WSTRB : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_mm_video_WLAST : out STD_LOGIC;
    m_axi_mm_video_WVALID : out STD_LOGIC;
    m_axi_mm_video_WREADY : in STD_LOGIC;
    m_axi_mm_video_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm_video_BVALID : in STD_LOGIC;
    m_axi_mm_video_BREADY : out STD_LOGIC;
    m_axi_mm_video_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm_video_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_mm_video_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm_video_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm_video_ARLOCK : out STD_LOGIC;
    m_axi_mm_video_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm_video_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm_video_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm_video_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm_video_ARVALID : out STD_LOGIC;
    m_axi_mm_video_ARREADY : in STD_LOGIC;
    m_axi_mm_video_RDATA : in STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axi_mm_video_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm_video_RLAST : in STD_LOGIC;
    m_axi_mm_video_RVALID : in STD_LOGIC;
    m_axi_mm_video_RREADY : out STD_LOGIC;
    s_axis_video_TVALID : in STD_LOGIC;
    s_axis_video_TREADY : out STD_LOGIC;
    s_axis_video_TDATA : in STD_LOGIC_VECTOR ( 47 downto 0 );
    s_axis_video_TKEEP : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axis_video_TSTRB : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axis_video_TUSER : in STD_LOGIC;
    s_axis_video_TLAST : in STD_LOGIC;
    s_axis_video_TID : in STD_LOGIC;
    s_axis_video_TDEST : in STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_v_frmbuf_wr_1_0 : entity is "design_1_v_frmbuf_wr_1_0,design_1_v_frmbuf_wr_1_0_v_frmbuf_wr,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1_v_frmbuf_wr_1_0 : entity is "design_1_v_frmbuf_wr_1_0,design_1_v_frmbuf_wr_1_0_v_frmbuf_wr,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=v_frmbuf_wr,x_ipVersion=3.0,x_ipCoreRevision=2,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_S_AXI_CTRL_ADDR_WIDTH=7,C_S_AXI_CTRL_DATA_WIDTH=32,C_M_AXI_MM_VIDEO_ID_WIDTH=1,C_M_AXI_MM_VIDEO_ADDR_WIDTH=32,C_M_AXI_MM_VIDEO_DATA_WIDTH=128,C_M_AXI_MM_VIDEO_AWUSER_WIDTH=1,C_M_AXI_MM_VIDEO_ARUSER_WIDTH=1,C_M_AXI_MM_VIDEO_WUSER_WIDTH=1,C_M_AXI_MM_VIDEO_RUSER_WIDTH=1,C_M_AXI_MM_VIDEO_BUSER_WIDTH=1,C_M_AXI_MM_VIDEO_USER_VALUE=0x00000000,C_M_AXI_MM_VIDEO_PROT_VALUE=0x0,C_M_AXI_MM_VIDEO_CACHE_VALUE=0x3}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_v_frmbuf_wr_1_0 : entity is "yes";
  attribute hls_module : string;
  attribute hls_module of design_1_v_frmbuf_wr_1_0 : entity is "yes";
end design_1_v_frmbuf_wr_1_0;

architecture stub of design_1_v_frmbuf_wr_1_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "s_axi_CTRL_AWADDR[6:0],s_axi_CTRL_AWVALID,s_axi_CTRL_AWREADY,s_axi_CTRL_WDATA[31:0],s_axi_CTRL_WSTRB[3:0],s_axi_CTRL_WVALID,s_axi_CTRL_WREADY,s_axi_CTRL_BRESP[1:0],s_axi_CTRL_BVALID,s_axi_CTRL_BREADY,s_axi_CTRL_ARADDR[6:0],s_axi_CTRL_ARVALID,s_axi_CTRL_ARREADY,s_axi_CTRL_RDATA[31:0],s_axi_CTRL_RRESP[1:0],s_axi_CTRL_RVALID,s_axi_CTRL_RREADY,ap_clk,ap_rst_n,interrupt,m_axi_mm_video_AWADDR[31:0],m_axi_mm_video_AWLEN[7:0],m_axi_mm_video_AWSIZE[2:0],m_axi_mm_video_AWBURST[1:0],m_axi_mm_video_AWLOCK,m_axi_mm_video_AWREGION[3:0],m_axi_mm_video_AWCACHE[3:0],m_axi_mm_video_AWPROT[2:0],m_axi_mm_video_AWQOS[3:0],m_axi_mm_video_AWVALID,m_axi_mm_video_AWREADY,m_axi_mm_video_WDATA[127:0],m_axi_mm_video_WSTRB[15:0],m_axi_mm_video_WLAST,m_axi_mm_video_WVALID,m_axi_mm_video_WREADY,m_axi_mm_video_BRESP[1:0],m_axi_mm_video_BVALID,m_axi_mm_video_BREADY,m_axi_mm_video_ARADDR[31:0],m_axi_mm_video_ARLEN[7:0],m_axi_mm_video_ARSIZE[2:0],m_axi_mm_video_ARBURST[1:0],m_axi_mm_video_ARLOCK,m_axi_mm_video_ARREGION[3:0],m_axi_mm_video_ARCACHE[3:0],m_axi_mm_video_ARPROT[2:0],m_axi_mm_video_ARQOS[3:0],m_axi_mm_video_ARVALID,m_axi_mm_video_ARREADY,m_axi_mm_video_RDATA[127:0],m_axi_mm_video_RRESP[1:0],m_axi_mm_video_RLAST,m_axi_mm_video_RVALID,m_axi_mm_video_RREADY,s_axis_video_TVALID,s_axis_video_TREADY,s_axis_video_TDATA[47:0],s_axis_video_TKEEP[5:0],s_axis_video_TSTRB[5:0],s_axis_video_TUSER,s_axis_video_TLAST,s_axis_video_TID,s_axis_video_TDEST";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s_axi_CTRL_AWADDR : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL AWADDR";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of s_axi_CTRL_AWADDR : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s_axi_CTRL_AWADDR : signal is "XIL_INTERFACENAME s_axi_CTRL, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 200000000, ID_WIDTH 0, ADDR_WIDTH 7, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_CTRL_AWVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL AWVALID";
  attribute X_INTERFACE_INFO of s_axi_CTRL_AWREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL AWREADY";
  attribute X_INTERFACE_INFO of s_axi_CTRL_WDATA : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL WDATA";
  attribute X_INTERFACE_INFO of s_axi_CTRL_WSTRB : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL WSTRB";
  attribute X_INTERFACE_INFO of s_axi_CTRL_WVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL WVALID";
  attribute X_INTERFACE_INFO of s_axi_CTRL_WREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL WREADY";
  attribute X_INTERFACE_INFO of s_axi_CTRL_BRESP : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL BRESP";
  attribute X_INTERFACE_INFO of s_axi_CTRL_BVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL BVALID";
  attribute X_INTERFACE_INFO of s_axi_CTRL_BREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL BREADY";
  attribute X_INTERFACE_INFO of s_axi_CTRL_ARADDR : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL ARADDR";
  attribute X_INTERFACE_INFO of s_axi_CTRL_ARVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL ARVALID";
  attribute X_INTERFACE_INFO of s_axi_CTRL_ARREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL ARREADY";
  attribute X_INTERFACE_INFO of s_axi_CTRL_RDATA : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL RDATA";
  attribute X_INTERFACE_INFO of s_axi_CTRL_RRESP : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL RRESP";
  attribute X_INTERFACE_INFO of s_axi_CTRL_RVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL RVALID";
  attribute X_INTERFACE_INFO of s_axi_CTRL_RREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_CTRL RREADY";
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute X_INTERFACE_MODE of ap_clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_CTRL:m_axi_mm_video:s_axis_video:sync_eof, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  attribute X_INTERFACE_MODE of ap_rst_n : signal is "slave";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of interrupt : signal is "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  attribute X_INTERFACE_MODE of interrupt : signal is "master";
  attribute X_INTERFACE_PARAMETER of interrupt : signal is "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  attribute X_INTERFACE_INFO of m_axi_mm_video_AWADDR : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video AWADDR";
  attribute X_INTERFACE_MODE of m_axi_mm_video_AWADDR : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_axi_mm_video_AWADDR : signal is "XIL_INTERFACENAME m_axi_mm_video, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 200000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 4, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axi_mm_video_AWLEN : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video AWLEN";
  attribute X_INTERFACE_INFO of m_axi_mm_video_AWSIZE : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video AWSIZE";
  attribute X_INTERFACE_INFO of m_axi_mm_video_AWBURST : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video AWBURST";
  attribute X_INTERFACE_INFO of m_axi_mm_video_AWLOCK : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video AWLOCK";
  attribute X_INTERFACE_INFO of m_axi_mm_video_AWREGION : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video AWREGION";
  attribute X_INTERFACE_INFO of m_axi_mm_video_AWCACHE : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video AWCACHE";
  attribute X_INTERFACE_INFO of m_axi_mm_video_AWPROT : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video AWPROT";
  attribute X_INTERFACE_INFO of m_axi_mm_video_AWQOS : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video AWQOS";
  attribute X_INTERFACE_INFO of m_axi_mm_video_AWVALID : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video AWVALID";
  attribute X_INTERFACE_INFO of m_axi_mm_video_AWREADY : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video AWREADY";
  attribute X_INTERFACE_INFO of m_axi_mm_video_WDATA : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video WDATA";
  attribute X_INTERFACE_INFO of m_axi_mm_video_WSTRB : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video WSTRB";
  attribute X_INTERFACE_INFO of m_axi_mm_video_WLAST : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video WLAST";
  attribute X_INTERFACE_INFO of m_axi_mm_video_WVALID : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video WVALID";
  attribute X_INTERFACE_INFO of m_axi_mm_video_WREADY : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video WREADY";
  attribute X_INTERFACE_INFO of m_axi_mm_video_BRESP : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video BRESP";
  attribute X_INTERFACE_INFO of m_axi_mm_video_BVALID : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video BVALID";
  attribute X_INTERFACE_INFO of m_axi_mm_video_BREADY : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video BREADY";
  attribute X_INTERFACE_INFO of m_axi_mm_video_ARADDR : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video ARADDR";
  attribute X_INTERFACE_INFO of m_axi_mm_video_ARLEN : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video ARLEN";
  attribute X_INTERFACE_INFO of m_axi_mm_video_ARSIZE : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video ARSIZE";
  attribute X_INTERFACE_INFO of m_axi_mm_video_ARBURST : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video ARBURST";
  attribute X_INTERFACE_INFO of m_axi_mm_video_ARLOCK : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video ARLOCK";
  attribute X_INTERFACE_INFO of m_axi_mm_video_ARREGION : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video ARREGION";
  attribute X_INTERFACE_INFO of m_axi_mm_video_ARCACHE : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video ARCACHE";
  attribute X_INTERFACE_INFO of m_axi_mm_video_ARPROT : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video ARPROT";
  attribute X_INTERFACE_INFO of m_axi_mm_video_ARQOS : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video ARQOS";
  attribute X_INTERFACE_INFO of m_axi_mm_video_ARVALID : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video ARVALID";
  attribute X_INTERFACE_INFO of m_axi_mm_video_ARREADY : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video ARREADY";
  attribute X_INTERFACE_INFO of m_axi_mm_video_RDATA : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video RDATA";
  attribute X_INTERFACE_INFO of m_axi_mm_video_RRESP : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video RRESP";
  attribute X_INTERFACE_INFO of m_axi_mm_video_RLAST : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video RLAST";
  attribute X_INTERFACE_INFO of m_axi_mm_video_RVALID : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video RVALID";
  attribute X_INTERFACE_INFO of m_axi_mm_video_RREADY : signal is "xilinx.com:interface:aximm:1.0 m_axi_mm_video RREADY";
  attribute X_INTERFACE_INFO of s_axis_video_TVALID : signal is "xilinx.com:interface:axis:1.0 s_axis_video TVALID";
  attribute X_INTERFACE_MODE of s_axis_video_TVALID : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axis_video_TVALID : signal is "XIL_INTERFACENAME s_axis_video, TDATA_NUM_BYTES 6, TDEST_WIDTH 1, TID_WIDTH 1, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 200000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_video_TREADY : signal is "xilinx.com:interface:axis:1.0 s_axis_video TREADY";
  attribute X_INTERFACE_INFO of s_axis_video_TDATA : signal is "xilinx.com:interface:axis:1.0 s_axis_video TDATA";
  attribute X_INTERFACE_INFO of s_axis_video_TKEEP : signal is "xilinx.com:interface:axis:1.0 s_axis_video TKEEP";
  attribute X_INTERFACE_INFO of s_axis_video_TSTRB : signal is "xilinx.com:interface:axis:1.0 s_axis_video TSTRB";
  attribute X_INTERFACE_INFO of s_axis_video_TUSER : signal is "xilinx.com:interface:axis:1.0 s_axis_video TUSER";
  attribute X_INTERFACE_INFO of s_axis_video_TLAST : signal is "xilinx.com:interface:axis:1.0 s_axis_video TLAST";
  attribute X_INTERFACE_INFO of s_axis_video_TID : signal is "xilinx.com:interface:axis:1.0 s_axis_video TID";
  attribute X_INTERFACE_INFO of s_axis_video_TDEST : signal is "xilinx.com:interface:axis:1.0 s_axis_video TDEST";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "design_1_v_frmbuf_wr_1_0_v_frmbuf_wr,Vivado 2025.2";
begin
end;
