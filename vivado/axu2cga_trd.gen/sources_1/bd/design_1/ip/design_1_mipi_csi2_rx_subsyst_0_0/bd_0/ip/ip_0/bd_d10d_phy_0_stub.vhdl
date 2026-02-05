-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Wed Jan 21 12:59:20 2026
-- Host        : LAPTOP-N1KB207U running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_mipi_csi2_rx_subsyst_0_0/bd_0/ip/ip_0/bd_d10d_phy_0_stub.vhdl
-- Design      : bd_d10d_phy_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu2cg-sfvc784-1-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bd_d10d_phy_0 is
  Port ( 
    core_clk : in STD_LOGIC;
    core_rst : in STD_LOGIC;
    rxbyteclkhs : out STD_LOGIC;
    clkoutphy_out : out STD_LOGIC;
    pll_lock_out : out STD_LOGIC;
    system_rst_out : out STD_LOGIC;
    init_done : out STD_LOGIC;
    cl_rxclkactivehs : out STD_LOGIC;
    cl_stopstate : out STD_LOGIC;
    cl_enable : in STD_LOGIC;
    cl_rxulpsclknot : out STD_LOGIC;
    cl_ulpsactivenot : out STD_LOGIC;
    dl0_rxdatahs : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dl0_rxvalidhs : out STD_LOGIC;
    dl0_rxactivehs : out STD_LOGIC;
    dl0_rxsynchs : out STD_LOGIC;
    dl0_forcerxmode : in STD_LOGIC;
    dl0_stopstate : out STD_LOGIC;
    dl0_enable : in STD_LOGIC;
    dl0_ulpsactivenot : out STD_LOGIC;
    dl0_rxclkesc : out STD_LOGIC;
    dl0_rxlpdtesc : out STD_LOGIC;
    dl0_rxulpsesc : out STD_LOGIC;
    dl0_rxtriggeresc : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dl0_rxdataesc : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dl0_rxvalidesc : out STD_LOGIC;
    dl0_errsoths : out STD_LOGIC;
    dl0_errsotsynchs : out STD_LOGIC;
    dl0_erresc : out STD_LOGIC;
    dl0_errsyncesc : out STD_LOGIC;
    dl0_errcontrol : out STD_LOGIC;
    dl1_rxdatahs : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dl1_rxvalidhs : out STD_LOGIC;
    dl1_rxactivehs : out STD_LOGIC;
    dl1_rxsynchs : out STD_LOGIC;
    dl1_forcerxmode : in STD_LOGIC;
    dl1_stopstate : out STD_LOGIC;
    dl1_enable : in STD_LOGIC;
    dl1_ulpsactivenot : out STD_LOGIC;
    dl1_rxclkesc : out STD_LOGIC;
    dl1_rxlpdtesc : out STD_LOGIC;
    dl1_rxulpsesc : out STD_LOGIC;
    dl1_rxtriggeresc : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dl1_rxdataesc : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dl1_rxvalidesc : out STD_LOGIC;
    dl1_errsoths : out STD_LOGIC;
    dl1_errsotsynchs : out STD_LOGIC;
    dl1_erresc : out STD_LOGIC;
    dl1_errsyncesc : out STD_LOGIC;
    dl1_errcontrol : out STD_LOGIC;
    clk_rxp : in STD_LOGIC;
    clk_rxn : in STD_LOGIC;
    data_rxp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    data_rxn : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );

  attribute C_CAL_MODE : string;
  attribute C_CAL_MODE of bd_d10d_phy_0 : entity is "FIXED";
  attribute C_DIV4_CLK_PERIOD : string;
  attribute C_DIV4_CLK_PERIOD of bd_d10d_phy_0 : entity is "8.000000";
  attribute C_DPHY_LANES : integer;
  attribute C_DPHY_LANES of bd_d10d_phy_0 : entity is 2;
  attribute C_DPHY_MODE : string;
  attribute C_DPHY_MODE of bd_d10d_phy_0 : entity is "SLAVE";
  attribute C_EN_DEBUG_REGS : integer;
  attribute C_EN_DEBUG_REGS of bd_d10d_phy_0 : entity is 0;
  attribute C_EN_DEBUG_TX_CALIB : string;
  attribute C_EN_DEBUG_TX_CALIB of bd_d10d_phy_0 : entity is "0";
  attribute C_EN_EXT_TAP : string;
  attribute C_EN_EXT_TAP of bd_d10d_phy_0 : entity is "0";
  attribute C_EN_REG_IF : integer;
  attribute C_EN_REG_IF of bd_d10d_phy_0 : entity is 0;
  attribute C_EN_SSC : string;
  attribute C_EN_SSC of bd_d10d_phy_0 : entity is "0";
  attribute C_EN_TIMEOUT_REGS : integer;
  attribute C_EN_TIMEOUT_REGS of bd_d10d_phy_0 : entity is 0;
  attribute C_ESC_CLK_PERIOD : string;
  attribute C_ESC_CLK_PERIOD of bd_d10d_phy_0 : entity is "50.000000";
  attribute C_ESC_TIMEOUT : integer;
  attribute C_ESC_TIMEOUT of bd_d10d_phy_0 : entity is 25600;
  attribute C_EXAMPLE_SIMULATION : string;
  attribute C_EXAMPLE_SIMULATION of bd_d10d_phy_0 : entity is "true";
  attribute C_HS_LINE_RATE : integer;
  attribute C_HS_LINE_RATE of bd_d10d_phy_0 : entity is 1000;
  attribute C_HS_TIMEOUT : integer;
  attribute C_HS_TIMEOUT of bd_d10d_phy_0 : entity is 65541;
  attribute C_IDLY_TAP : integer;
  attribute C_IDLY_TAP of bd_d10d_phy_0 : entity is 0;
  attribute C_LPX_PERIOD : integer;
  attribute C_LPX_PERIOD of bd_d10d_phy_0 : entity is 50;
  attribute C_RCVE_DESKEW_SEQ : string;
  attribute C_RCVE_DESKEW_SEQ of bd_d10d_phy_0 : entity is "false";
  attribute C_SKEWCAL_FIRST_TIME : integer;
  attribute C_SKEWCAL_FIRST_TIME of bd_d10d_phy_0 : entity is 4096;
  attribute C_SKEWCAL_PERIODIC_TIME : integer;
  attribute C_SKEWCAL_PERIODIC_TIME of bd_d10d_phy_0 : entity is 128;
  attribute C_STABLE_CLK_PERIOD : string;
  attribute C_STABLE_CLK_PERIOD of bd_d10d_phy_0 : entity is "5.000000";
  attribute C_TXPLL_CLKIN_PERIOD : string;
  attribute C_TXPLL_CLKIN_PERIOD of bd_d10d_phy_0 : entity is "8.000000";
  attribute C_WAKEUP : integer;
  attribute C_WAKEUP of bd_d10d_phy_0 : entity is 1000;
  attribute C_XMIT_FIRST_DESKEW_SEQ : string;
  attribute C_XMIT_FIRST_DESKEW_SEQ of bd_d10d_phy_0 : entity is "false";
  attribute C_XMIT_PERIODIC_DESKEW_SEQ : string;
  attribute C_XMIT_PERIODIC_DESKEW_SEQ of bd_d10d_phy_0 : entity is "false";
  attribute DPHY_PRESET : string;
  attribute DPHY_PRESET of bd_d10d_phy_0 : entity is "CSI2RX_XLNX";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of bd_d10d_phy_0 : entity is "yes";
  attribute MTBF_SYNC_STAGES : integer;
  attribute MTBF_SYNC_STAGES of bd_d10d_phy_0 : entity is 3;
  attribute SUPPORT_LEVEL : integer;
  attribute SUPPORT_LEVEL of bd_d10d_phy_0 : entity is 1;
end bd_d10d_phy_0;

architecture stub of bd_d10d_phy_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "core_clk,core_rst,rxbyteclkhs,clkoutphy_out,pll_lock_out,system_rst_out,init_done,cl_rxclkactivehs,cl_stopstate,cl_enable,cl_rxulpsclknot,cl_ulpsactivenot,dl0_rxdatahs[7:0],dl0_rxvalidhs,dl0_rxactivehs,dl0_rxsynchs,dl0_forcerxmode,dl0_stopstate,dl0_enable,dl0_ulpsactivenot,dl0_rxclkesc,dl0_rxlpdtesc,dl0_rxulpsesc,dl0_rxtriggeresc[3:0],dl0_rxdataesc[7:0],dl0_rxvalidesc,dl0_errsoths,dl0_errsotsynchs,dl0_erresc,dl0_errsyncesc,dl0_errcontrol,dl1_rxdatahs[7:0],dl1_rxvalidhs,dl1_rxactivehs,dl1_rxsynchs,dl1_forcerxmode,dl1_stopstate,dl1_enable,dl1_ulpsactivenot,dl1_rxclkesc,dl1_rxlpdtesc,dl1_rxulpsesc,dl1_rxtriggeresc[3:0],dl1_rxdataesc[7:0],dl1_rxvalidesc,dl1_errsoths,dl1_errsotsynchs,dl1_erresc,dl1_errsyncesc,dl1_errcontrol,clk_rxp,clk_rxn,data_rxp[1:0],data_rxn[1:0]";
begin
end;
