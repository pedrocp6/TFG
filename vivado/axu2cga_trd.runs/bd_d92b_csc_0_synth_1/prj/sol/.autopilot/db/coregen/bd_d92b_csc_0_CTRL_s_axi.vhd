-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
-- Tool Version Limit: 2025.11
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- 
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity bd_d92b_csc_0_CTRL_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 9;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    interrupt             :out  STD_LOGIC;
    InVideoFormat         :out  STD_LOGIC_VECTOR(7 downto 0);
    OutVideoFormat        :out  STD_LOGIC_VECTOR(7 downto 0);
    width                 :out  STD_LOGIC_VECTOR(15 downto 0);
    height                :out  STD_LOGIC_VECTOR(15 downto 0);
    ColStart              :out  STD_LOGIC_VECTOR(15 downto 0);
    ColEnd                :out  STD_LOGIC_VECTOR(15 downto 0);
    RowStart              :out  STD_LOGIC_VECTOR(15 downto 0);
    RowEnd                :out  STD_LOGIC_VECTOR(15 downto 0);
    K11                   :out  STD_LOGIC_VECTOR(15 downto 0);
    K12                   :out  STD_LOGIC_VECTOR(15 downto 0);
    K13                   :out  STD_LOGIC_VECTOR(15 downto 0);
    K21                   :out  STD_LOGIC_VECTOR(15 downto 0);
    K22                   :out  STD_LOGIC_VECTOR(15 downto 0);
    K23                   :out  STD_LOGIC_VECTOR(15 downto 0);
    K31                   :out  STD_LOGIC_VECTOR(15 downto 0);
    K32                   :out  STD_LOGIC_VECTOR(15 downto 0);
    K33                   :out  STD_LOGIC_VECTOR(15 downto 0);
    ROffset               :out  STD_LOGIC_VECTOR(9 downto 0);
    GOffset               :out  STD_LOGIC_VECTOR(9 downto 0);
    BOffset               :out  STD_LOGIC_VECTOR(9 downto 0);
    ClampMin              :out  STD_LOGIC_VECTOR(7 downto 0);
    ClipMax               :out  STD_LOGIC_VECTOR(7 downto 0);
    K11_2                 :out  STD_LOGIC_VECTOR(15 downto 0);
    K12_2                 :out  STD_LOGIC_VECTOR(15 downto 0);
    K13_2                 :out  STD_LOGIC_VECTOR(15 downto 0);
    K21_2                 :out  STD_LOGIC_VECTOR(15 downto 0);
    K22_2                 :out  STD_LOGIC_VECTOR(15 downto 0);
    K23_2                 :out  STD_LOGIC_VECTOR(15 downto 0);
    K31_2                 :out  STD_LOGIC_VECTOR(15 downto 0);
    K32_2                 :out  STD_LOGIC_VECTOR(15 downto 0);
    K33_2                 :out  STD_LOGIC_VECTOR(15 downto 0);
    ROffset_2             :out  STD_LOGIC_VECTOR(9 downto 0);
    GOffset_2             :out  STD_LOGIC_VECTOR(9 downto 0);
    BOffset_2             :out  STD_LOGIC_VECTOR(9 downto 0);
    ClampMin_2            :out  STD_LOGIC_VECTOR(7 downto 0);
    ClipMax_2             :out  STD_LOGIC_VECTOR(7 downto 0);
    ap_start              :out  STD_LOGIC;
    ap_done               :in   STD_LOGIC;
    ap_ready              :in   STD_LOGIC;
    ap_idle               :in   STD_LOGIC
);
end entity bd_d92b_csc_0_CTRL_s_axi;

-- ------------------------Address Info-------------------
-- Protocol Used: ap_ctrl_hs
--
-- 0x000 : Control signals
--         bit 0  - ap_start (Read/Write/COH)
--         bit 1  - ap_done (Read/COR)
--         bit 2  - ap_idle (Read)
--         bit 3  - ap_ready (Read/COR)
--         bit 7  - auto_restart (Read/Write)
--         bit 9  - interrupt (Read)
--         others - reserved
-- 0x004 : Global Interrupt Enable Register
--         bit 0  - Global Interrupt Enable (Read/Write)
--         others - reserved
-- 0x008 : IP Interrupt Enable Register (Read/Write)
--         bit 0 - enable ap_done interrupt (Read/Write)
--         bit 1 - enable ap_ready interrupt (Read/Write)
--         others - reserved
-- 0x00c : IP Interrupt Status Register (Read/TOW)
--         bit 0 - ap_done (Read/TOW)
--         bit 1 - ap_ready (Read/TOW)
--         others - reserved
-- 0x010 : Data signal of InVideoFormat
--         bit 7~0 - InVideoFormat[7:0] (Read/Write)
--         others  - reserved
-- 0x014 : reserved
-- 0x018 : Data signal of OutVideoFormat
--         bit 7~0 - OutVideoFormat[7:0] (Read/Write)
--         others  - reserved
-- 0x01c : reserved
-- 0x020 : Data signal of width
--         bit 15~0 - width[15:0] (Read/Write)
--         others   - reserved
-- 0x024 : reserved
-- 0x028 : Data signal of height
--         bit 15~0 - height[15:0] (Read/Write)
--         others   - reserved
-- 0x02c : reserved
-- 0x030 : Data signal of ColStart
--         bit 15~0 - ColStart[15:0] (Read/Write)
--         others   - reserved
-- 0x034 : reserved
-- 0x038 : Data signal of ColEnd
--         bit 15~0 - ColEnd[15:0] (Read/Write)
--         others   - reserved
-- 0x03c : reserved
-- 0x040 : Data signal of RowStart
--         bit 15~0 - RowStart[15:0] (Read/Write)
--         others   - reserved
-- 0x044 : reserved
-- 0x048 : Data signal of RowEnd
--         bit 15~0 - RowEnd[15:0] (Read/Write)
--         others   - reserved
-- 0x04c : reserved
-- 0x050 : Data signal of K11
--         bit 15~0 - K11[15:0] (Read/Write)
--         others   - reserved
-- 0x054 : reserved
-- 0x058 : Data signal of K12
--         bit 15~0 - K12[15:0] (Read/Write)
--         others   - reserved
-- 0x05c : reserved
-- 0x060 : Data signal of K13
--         bit 15~0 - K13[15:0] (Read/Write)
--         others   - reserved
-- 0x064 : reserved
-- 0x068 : Data signal of K21
--         bit 15~0 - K21[15:0] (Read/Write)
--         others   - reserved
-- 0x06c : reserved
-- 0x070 : Data signal of K22
--         bit 15~0 - K22[15:0] (Read/Write)
--         others   - reserved
-- 0x074 : reserved
-- 0x078 : Data signal of K23
--         bit 15~0 - K23[15:0] (Read/Write)
--         others   - reserved
-- 0x07c : reserved
-- 0x080 : Data signal of K31
--         bit 15~0 - K31[15:0] (Read/Write)
--         others   - reserved
-- 0x084 : reserved
-- 0x088 : Data signal of K32
--         bit 15~0 - K32[15:0] (Read/Write)
--         others   - reserved
-- 0x08c : reserved
-- 0x090 : Data signal of K33
--         bit 15~0 - K33[15:0] (Read/Write)
--         others   - reserved
-- 0x094 : reserved
-- 0x098 : Data signal of ROffset
--         bit 9~0 - ROffset[9:0] (Read/Write)
--         others  - reserved
-- 0x09c : reserved
-- 0x0a0 : Data signal of GOffset
--         bit 9~0 - GOffset[9:0] (Read/Write)
--         others  - reserved
-- 0x0a4 : reserved
-- 0x0a8 : Data signal of BOffset
--         bit 9~0 - BOffset[9:0] (Read/Write)
--         others  - reserved
-- 0x0ac : reserved
-- 0x0b0 : Data signal of ClampMin
--         bit 7~0 - ClampMin[7:0] (Read/Write)
--         others  - reserved
-- 0x0b4 : reserved
-- 0x0b8 : Data signal of ClipMax
--         bit 7~0 - ClipMax[7:0] (Read/Write)
--         others  - reserved
-- 0x0bc : reserved
-- 0x0c0 : Data signal of K11_2
--         bit 15~0 - K11_2[15:0] (Read/Write)
--         others   - reserved
-- 0x0c4 : reserved
-- 0x0c8 : Data signal of K12_2
--         bit 15~0 - K12_2[15:0] (Read/Write)
--         others   - reserved
-- 0x0cc : reserved
-- 0x0d0 : Data signal of K13_2
--         bit 15~0 - K13_2[15:0] (Read/Write)
--         others   - reserved
-- 0x0d4 : reserved
-- 0x0d8 : Data signal of K21_2
--         bit 15~0 - K21_2[15:0] (Read/Write)
--         others   - reserved
-- 0x0dc : reserved
-- 0x0e0 : Data signal of K22_2
--         bit 15~0 - K22_2[15:0] (Read/Write)
--         others   - reserved
-- 0x0e4 : reserved
-- 0x0e8 : Data signal of K23_2
--         bit 15~0 - K23_2[15:0] (Read/Write)
--         others   - reserved
-- 0x0ec : reserved
-- 0x0f0 : Data signal of K31_2
--         bit 15~0 - K31_2[15:0] (Read/Write)
--         others   - reserved
-- 0x0f4 : reserved
-- 0x0f8 : Data signal of K32_2
--         bit 15~0 - K32_2[15:0] (Read/Write)
--         others   - reserved
-- 0x0fc : reserved
-- 0x100 : Data signal of K33_2
--         bit 15~0 - K33_2[15:0] (Read/Write)
--         others   - reserved
-- 0x104 : reserved
-- 0x108 : Data signal of ROffset_2
--         bit 9~0 - ROffset_2[9:0] (Read/Write)
--         others  - reserved
-- 0x10c : reserved
-- 0x110 : Data signal of GOffset_2
--         bit 9~0 - GOffset_2[9:0] (Read/Write)
--         others  - reserved
-- 0x114 : reserved
-- 0x118 : Data signal of BOffset_2
--         bit 9~0 - BOffset_2[9:0] (Read/Write)
--         others  - reserved
-- 0x11c : reserved
-- 0x120 : Data signal of ClampMin_2
--         bit 7~0 - ClampMin_2[7:0] (Read/Write)
--         others  - reserved
-- 0x124 : reserved
-- 0x128 : Data signal of ClipMax_2
--         bit 7~0 - ClipMax_2[7:0] (Read/Write)
--         others  - reserved
-- 0x12c : reserved
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of bd_d92b_csc_0_CTRL_s_axi is
attribute DowngradeIPIdentifiedWarnings : STRING;
attribute DowngradeIPIdentifiedWarnings of behave : architecture is "yes";
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_AP_CTRL               : INTEGER := 16#000#;
    constant ADDR_GIE                   : INTEGER := 16#004#;
    constant ADDR_IER                   : INTEGER := 16#008#;
    constant ADDR_ISR                   : INTEGER := 16#00c#;
    constant ADDR_INVIDEOFORMAT_DATA_0  : INTEGER := 16#010#;
    constant ADDR_INVIDEOFORMAT_CTRL    : INTEGER := 16#014#;
    constant ADDR_OUTVIDEOFORMAT_DATA_0 : INTEGER := 16#018#;
    constant ADDR_OUTVIDEOFORMAT_CTRL   : INTEGER := 16#01c#;
    constant ADDR_WIDTH_DATA_0          : INTEGER := 16#020#;
    constant ADDR_WIDTH_CTRL            : INTEGER := 16#024#;
    constant ADDR_HEIGHT_DATA_0         : INTEGER := 16#028#;
    constant ADDR_HEIGHT_CTRL           : INTEGER := 16#02c#;
    constant ADDR_COLSTART_DATA_0       : INTEGER := 16#030#;
    constant ADDR_COLSTART_CTRL         : INTEGER := 16#034#;
    constant ADDR_COLEND_DATA_0         : INTEGER := 16#038#;
    constant ADDR_COLEND_CTRL           : INTEGER := 16#03c#;
    constant ADDR_ROWSTART_DATA_0       : INTEGER := 16#040#;
    constant ADDR_ROWSTART_CTRL         : INTEGER := 16#044#;
    constant ADDR_ROWEND_DATA_0         : INTEGER := 16#048#;
    constant ADDR_ROWEND_CTRL           : INTEGER := 16#04c#;
    constant ADDR_K11_DATA_0            : INTEGER := 16#050#;
    constant ADDR_K11_CTRL              : INTEGER := 16#054#;
    constant ADDR_K12_DATA_0            : INTEGER := 16#058#;
    constant ADDR_K12_CTRL              : INTEGER := 16#05c#;
    constant ADDR_K13_DATA_0            : INTEGER := 16#060#;
    constant ADDR_K13_CTRL              : INTEGER := 16#064#;
    constant ADDR_K21_DATA_0            : INTEGER := 16#068#;
    constant ADDR_K21_CTRL              : INTEGER := 16#06c#;
    constant ADDR_K22_DATA_0            : INTEGER := 16#070#;
    constant ADDR_K22_CTRL              : INTEGER := 16#074#;
    constant ADDR_K23_DATA_0            : INTEGER := 16#078#;
    constant ADDR_K23_CTRL              : INTEGER := 16#07c#;
    constant ADDR_K31_DATA_0            : INTEGER := 16#080#;
    constant ADDR_K31_CTRL              : INTEGER := 16#084#;
    constant ADDR_K32_DATA_0            : INTEGER := 16#088#;
    constant ADDR_K32_CTRL              : INTEGER := 16#08c#;
    constant ADDR_K33_DATA_0            : INTEGER := 16#090#;
    constant ADDR_K33_CTRL              : INTEGER := 16#094#;
    constant ADDR_ROFFSET_DATA_0        : INTEGER := 16#098#;
    constant ADDR_ROFFSET_CTRL          : INTEGER := 16#09c#;
    constant ADDR_GOFFSET_DATA_0        : INTEGER := 16#0a0#;
    constant ADDR_GOFFSET_CTRL          : INTEGER := 16#0a4#;
    constant ADDR_BOFFSET_DATA_0        : INTEGER := 16#0a8#;
    constant ADDR_BOFFSET_CTRL          : INTEGER := 16#0ac#;
    constant ADDR_CLAMPMIN_DATA_0       : INTEGER := 16#0b0#;
    constant ADDR_CLAMPMIN_CTRL         : INTEGER := 16#0b4#;
    constant ADDR_CLIPMAX_DATA_0        : INTEGER := 16#0b8#;
    constant ADDR_CLIPMAX_CTRL          : INTEGER := 16#0bc#;
    constant ADDR_K11_2_DATA_0          : INTEGER := 16#0c0#;
    constant ADDR_K11_2_CTRL            : INTEGER := 16#0c4#;
    constant ADDR_K12_2_DATA_0          : INTEGER := 16#0c8#;
    constant ADDR_K12_2_CTRL            : INTEGER := 16#0cc#;
    constant ADDR_K13_2_DATA_0          : INTEGER := 16#0d0#;
    constant ADDR_K13_2_CTRL            : INTEGER := 16#0d4#;
    constant ADDR_K21_2_DATA_0          : INTEGER := 16#0d8#;
    constant ADDR_K21_2_CTRL            : INTEGER := 16#0dc#;
    constant ADDR_K22_2_DATA_0          : INTEGER := 16#0e0#;
    constant ADDR_K22_2_CTRL            : INTEGER := 16#0e4#;
    constant ADDR_K23_2_DATA_0          : INTEGER := 16#0e8#;
    constant ADDR_K23_2_CTRL            : INTEGER := 16#0ec#;
    constant ADDR_K31_2_DATA_0          : INTEGER := 16#0f0#;
    constant ADDR_K31_2_CTRL            : INTEGER := 16#0f4#;
    constant ADDR_K32_2_DATA_0          : INTEGER := 16#0f8#;
    constant ADDR_K32_2_CTRL            : INTEGER := 16#0fc#;
    constant ADDR_K33_2_DATA_0          : INTEGER := 16#100#;
    constant ADDR_K33_2_CTRL            : INTEGER := 16#104#;
    constant ADDR_ROFFSET_2_DATA_0      : INTEGER := 16#108#;
    constant ADDR_ROFFSET_2_CTRL        : INTEGER := 16#10c#;
    constant ADDR_GOFFSET_2_DATA_0      : INTEGER := 16#110#;
    constant ADDR_GOFFSET_2_CTRL        : INTEGER := 16#114#;
    constant ADDR_BOFFSET_2_DATA_0      : INTEGER := 16#118#;
    constant ADDR_BOFFSET_2_CTRL        : INTEGER := 16#11c#;
    constant ADDR_CLAMPMIN_2_DATA_0     : INTEGER := 16#120#;
    constant ADDR_CLAMPMIN_2_CTRL       : INTEGER := 16#124#;
    constant ADDR_CLIPMAX_2_DATA_0      : INTEGER := 16#128#;
    constant ADDR_CLIPMAX_2_CTRL        : INTEGER := 16#12c#;
    constant ADDR_BITS         : INTEGER := 9;

    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    signal BVALID_t            : STD_LOGIC;
    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    -- internal registers
    signal int_ap_idle         : STD_LOGIC := '0';
    signal int_ap_ready        : STD_LOGIC := '0';
    signal task_ap_ready       : STD_LOGIC;
    signal int_ap_done         : STD_LOGIC := '0';
    signal task_ap_done        : STD_LOGIC;
    signal int_task_ap_done    : STD_LOGIC := '0';
    signal int_ap_start        : STD_LOGIC := '0';
    signal int_interrupt       : STD_LOGIC := '0';
    signal int_auto_restart    : STD_LOGIC := '0';
    signal auto_restart_status : STD_LOGIC := '0';
    signal auto_restart_done   : STD_LOGIC;
    signal int_gie             : STD_LOGIC := '0';
    signal int_ier             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_isr             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_InVideoFormat   : UNSIGNED(7 downto 0) := (others => '0');
    signal int_OutVideoFormat  : UNSIGNED(7 downto 0) := (others => '0');
    signal int_width           : UNSIGNED(15 downto 0) := (others => '0');
    signal int_height          : UNSIGNED(15 downto 0) := (others => '0');
    signal int_ColStart        : UNSIGNED(15 downto 0) := (others => '0');
    signal int_ColEnd          : UNSIGNED(15 downto 0) := (others => '0');
    signal int_RowStart        : UNSIGNED(15 downto 0) := (others => '0');
    signal int_RowEnd          : UNSIGNED(15 downto 0) := (others => '0');
    signal int_K11             : UNSIGNED(15 downto 0) := (others => '0');
    signal int_K12             : UNSIGNED(15 downto 0) := (others => '0');
    signal int_K13             : UNSIGNED(15 downto 0) := (others => '0');
    signal int_K21             : UNSIGNED(15 downto 0) := (others => '0');
    signal int_K22             : UNSIGNED(15 downto 0) := (others => '0');
    signal int_K23             : UNSIGNED(15 downto 0) := (others => '0');
    signal int_K31             : UNSIGNED(15 downto 0) := (others => '0');
    signal int_K32             : UNSIGNED(15 downto 0) := (others => '0');
    signal int_K33             : UNSIGNED(15 downto 0) := (others => '0');
    signal int_ROffset         : UNSIGNED(9 downto 0) := (others => '0');
    signal int_GOffset         : UNSIGNED(9 downto 0) := (others => '0');
    signal int_BOffset         : UNSIGNED(9 downto 0) := (others => '0');
    signal int_ClampMin        : UNSIGNED(7 downto 0) := (others => '0');
    signal int_ClipMax         : UNSIGNED(7 downto 0) := (others => '0');
    signal int_K11_2           : UNSIGNED(15 downto 0) := (others => '0');
    signal int_K12_2           : UNSIGNED(15 downto 0) := (others => '0');
    signal int_K13_2           : UNSIGNED(15 downto 0) := (others => '0');
    signal int_K21_2           : UNSIGNED(15 downto 0) := (others => '0');
    signal int_K22_2           : UNSIGNED(15 downto 0) := (others => '0');
    signal int_K23_2           : UNSIGNED(15 downto 0) := (others => '0');
    signal int_K31_2           : UNSIGNED(15 downto 0) := (others => '0');
    signal int_K32_2           : UNSIGNED(15 downto 0) := (others => '0');
    signal int_K33_2           : UNSIGNED(15 downto 0) := (others => '0');
    signal int_ROffset_2       : UNSIGNED(9 downto 0) := (others => '0');
    signal int_GOffset_2       : UNSIGNED(9 downto 0) := (others => '0');
    signal int_BOffset_2       : UNSIGNED(9 downto 0) := (others => '0');
    signal int_ClampMin_2      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_ClipMax_2       : UNSIGNED(7 downto 0) := (others => '0');


begin
-- ----------------------- Instantiation------------------


-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata else '0';
    WREADY    <=  WREADY_t;
    BVALID_t  <=  '1' when wstate = wrresp else '0';
    BVALID    <=  BVALID_t;
    BRESP     <=  "00";  -- OKAY
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, WVALID, BREADY, BVALID_t)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (WVALID = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1' and BVALID_t = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 2) & (1 downto 0 => '0'));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    rdata_data <= (others => '0');
                    case (TO_INTEGER(raddr)) is
                    when ADDR_AP_CTRL =>
                        rdata_data(9) <= int_interrupt;
                        rdata_data(7) <= int_auto_restart;
                        rdata_data(3) <= int_ap_ready;
                        rdata_data(2) <= int_ap_idle;
                        rdata_data(1) <= int_task_ap_done;
                        rdata_data(0) <= int_ap_start;
                    when ADDR_GIE =>
                        rdata_data(0) <= int_gie;
                    when ADDR_IER =>
                        rdata_data(1 downto 0) <= int_ier;
                    when ADDR_ISR =>
                        rdata_data(1 downto 0) <= int_isr;
                    when ADDR_INVIDEOFORMAT_DATA_0 =>
                        rdata_data <= RESIZE(int_InVideoFormat(7 downto 0), 32);
                    when ADDR_OUTVIDEOFORMAT_DATA_0 =>
                        rdata_data <= RESIZE(int_OutVideoFormat(7 downto 0), 32);
                    when ADDR_WIDTH_DATA_0 =>
                        rdata_data <= RESIZE(int_width(15 downto 0), 32);
                    when ADDR_HEIGHT_DATA_0 =>
                        rdata_data <= RESIZE(int_height(15 downto 0), 32);
                    when ADDR_COLSTART_DATA_0 =>
                        rdata_data <= RESIZE(int_ColStart(15 downto 0), 32);
                    when ADDR_COLEND_DATA_0 =>
                        rdata_data <= RESIZE(int_ColEnd(15 downto 0), 32);
                    when ADDR_ROWSTART_DATA_0 =>
                        rdata_data <= RESIZE(int_RowStart(15 downto 0), 32);
                    when ADDR_ROWEND_DATA_0 =>
                        rdata_data <= RESIZE(int_RowEnd(15 downto 0), 32);
                    when ADDR_K11_DATA_0 =>
                        rdata_data <= RESIZE(int_K11(15 downto 0), 32);
                    when ADDR_K12_DATA_0 =>
                        rdata_data <= RESIZE(int_K12(15 downto 0), 32);
                    when ADDR_K13_DATA_0 =>
                        rdata_data <= RESIZE(int_K13(15 downto 0), 32);
                    when ADDR_K21_DATA_0 =>
                        rdata_data <= RESIZE(int_K21(15 downto 0), 32);
                    when ADDR_K22_DATA_0 =>
                        rdata_data <= RESIZE(int_K22(15 downto 0), 32);
                    when ADDR_K23_DATA_0 =>
                        rdata_data <= RESIZE(int_K23(15 downto 0), 32);
                    when ADDR_K31_DATA_0 =>
                        rdata_data <= RESIZE(int_K31(15 downto 0), 32);
                    when ADDR_K32_DATA_0 =>
                        rdata_data <= RESIZE(int_K32(15 downto 0), 32);
                    when ADDR_K33_DATA_0 =>
                        rdata_data <= RESIZE(int_K33(15 downto 0), 32);
                    when ADDR_ROFFSET_DATA_0 =>
                        rdata_data <= RESIZE(int_ROffset(9 downto 0), 32);
                    when ADDR_GOFFSET_DATA_0 =>
                        rdata_data <= RESIZE(int_GOffset(9 downto 0), 32);
                    when ADDR_BOFFSET_DATA_0 =>
                        rdata_data <= RESIZE(int_BOffset(9 downto 0), 32);
                    when ADDR_CLAMPMIN_DATA_0 =>
                        rdata_data <= RESIZE(int_ClampMin(7 downto 0), 32);
                    when ADDR_CLIPMAX_DATA_0 =>
                        rdata_data <= RESIZE(int_ClipMax(7 downto 0), 32);
                    when ADDR_K11_2_DATA_0 =>
                        rdata_data <= RESIZE(int_K11_2(15 downto 0), 32);
                    when ADDR_K12_2_DATA_0 =>
                        rdata_data <= RESIZE(int_K12_2(15 downto 0), 32);
                    when ADDR_K13_2_DATA_0 =>
                        rdata_data <= RESIZE(int_K13_2(15 downto 0), 32);
                    when ADDR_K21_2_DATA_0 =>
                        rdata_data <= RESIZE(int_K21_2(15 downto 0), 32);
                    when ADDR_K22_2_DATA_0 =>
                        rdata_data <= RESIZE(int_K22_2(15 downto 0), 32);
                    when ADDR_K23_2_DATA_0 =>
                        rdata_data <= RESIZE(int_K23_2(15 downto 0), 32);
                    when ADDR_K31_2_DATA_0 =>
                        rdata_data <= RESIZE(int_K31_2(15 downto 0), 32);
                    when ADDR_K32_2_DATA_0 =>
                        rdata_data <= RESIZE(int_K32_2(15 downto 0), 32);
                    when ADDR_K33_2_DATA_0 =>
                        rdata_data <= RESIZE(int_K33_2(15 downto 0), 32);
                    when ADDR_ROFFSET_2_DATA_0 =>
                        rdata_data <= RESIZE(int_ROffset_2(9 downto 0), 32);
                    when ADDR_GOFFSET_2_DATA_0 =>
                        rdata_data <= RESIZE(int_GOffset_2(9 downto 0), 32);
                    when ADDR_BOFFSET_2_DATA_0 =>
                        rdata_data <= RESIZE(int_BOffset_2(9 downto 0), 32);
                    when ADDR_CLAMPMIN_2_DATA_0 =>
                        rdata_data <= RESIZE(int_ClampMin_2(7 downto 0), 32);
                    when ADDR_CLIPMAX_2_DATA_0 =>
                        rdata_data <= RESIZE(int_ClipMax_2(7 downto 0), 32);
                    when others =>
                        NULL;
                    end case;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    interrupt            <= int_interrupt;
    ap_start             <= int_ap_start;
    task_ap_done         <= (ap_done and not auto_restart_status) or auto_restart_done;
    task_ap_ready        <= ap_ready and not int_auto_restart;
    auto_restart_done    <= auto_restart_status and (ap_idle and not int_ap_idle);
    InVideoFormat        <= STD_LOGIC_VECTOR(int_InVideoFormat);
    OutVideoFormat       <= STD_LOGIC_VECTOR(int_OutVideoFormat);
    width                <= STD_LOGIC_VECTOR(int_width);
    height               <= STD_LOGIC_VECTOR(int_height);
    ColStart             <= STD_LOGIC_VECTOR(int_ColStart);
    ColEnd               <= STD_LOGIC_VECTOR(int_ColEnd);
    RowStart             <= STD_LOGIC_VECTOR(int_RowStart);
    RowEnd               <= STD_LOGIC_VECTOR(int_RowEnd);
    K11                  <= STD_LOGIC_VECTOR(int_K11);
    K12                  <= STD_LOGIC_VECTOR(int_K12);
    K13                  <= STD_LOGIC_VECTOR(int_K13);
    K21                  <= STD_LOGIC_VECTOR(int_K21);
    K22                  <= STD_LOGIC_VECTOR(int_K22);
    K23                  <= STD_LOGIC_VECTOR(int_K23);
    K31                  <= STD_LOGIC_VECTOR(int_K31);
    K32                  <= STD_LOGIC_VECTOR(int_K32);
    K33                  <= STD_LOGIC_VECTOR(int_K33);
    ROffset              <= STD_LOGIC_VECTOR(int_ROffset);
    GOffset              <= STD_LOGIC_VECTOR(int_GOffset);
    BOffset              <= STD_LOGIC_VECTOR(int_BOffset);
    ClampMin             <= STD_LOGIC_VECTOR(int_ClampMin);
    ClipMax              <= STD_LOGIC_VECTOR(int_ClipMax);
    K11_2                <= STD_LOGIC_VECTOR(int_K11_2);
    K12_2                <= STD_LOGIC_VECTOR(int_K12_2);
    K13_2                <= STD_LOGIC_VECTOR(int_K13_2);
    K21_2                <= STD_LOGIC_VECTOR(int_K21_2);
    K22_2                <= STD_LOGIC_VECTOR(int_K22_2);
    K23_2                <= STD_LOGIC_VECTOR(int_K23_2);
    K31_2                <= STD_LOGIC_VECTOR(int_K31_2);
    K32_2                <= STD_LOGIC_VECTOR(int_K32_2);
    K33_2                <= STD_LOGIC_VECTOR(int_K33_2);
    ROffset_2            <= STD_LOGIC_VECTOR(int_ROffset_2);
    GOffset_2            <= STD_LOGIC_VECTOR(int_GOffset_2);
    BOffset_2            <= STD_LOGIC_VECTOR(int_BOffset_2);
    ClampMin_2           <= STD_LOGIC_VECTOR(int_ClampMin_2);
    ClipMax_2            <= STD_LOGIC_VECTOR(int_ClipMax_2);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_interrupt <= '0';
            elsif (ACLK_EN = '1') then
                if (int_gie = '1' and (int_isr(0) or int_isr(1)) = '1') then
                    int_interrupt <= '1';
                else
                    int_interrupt <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_start <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1' and WDATA(0) = '1') then
                    int_ap_start <= '1';
                elsif (ap_ready = '1') then
                    int_ap_start <= int_auto_restart; -- clear on handshake/auto restart
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_done <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_done <= ap_done;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_task_ap_done <= '0';
            elsif (ACLK_EN = '1') then
                if (task_ap_done = '1') then
                    int_task_ap_done <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AP_CTRL) then
                    int_task_ap_done <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_idle <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_idle <= ap_idle;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_ready <= '0';
            elsif (ACLK_EN = '1') then
                if (task_ap_ready = '1') then
                    int_ap_ready <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AP_CTRL) then
                    int_ap_ready <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_auto_restart <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1') then
                    int_auto_restart <= WDATA(7);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                auto_restart_status <= '0';
            elsif (ACLK_EN = '1') then
                if (int_auto_restart = '1') then
                    auto_restart_status <= '1';
                elsif (ap_idle = '1') then
                    auto_restart_status <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_gie <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_GIE and WSTRB(0) = '1') then
                    int_gie <= WDATA(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ier <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_IER and WSTRB(0) = '1') then
                    int_ier <= UNSIGNED(WDATA(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(0) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(0) = '1' and ap_done = '1') then
                    int_isr(0) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(0) <= int_isr(0) xor WDATA(0); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(1) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(1) = '1' and ap_ready = '1') then
                    int_isr(1) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(1) <= int_isr(1) xor WDATA(1); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_InVideoFormat(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_INVIDEOFORMAT_DATA_0) then
                    int_InVideoFormat(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_InVideoFormat(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_OutVideoFormat(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_OUTVIDEOFORMAT_DATA_0) then
                    int_OutVideoFormat(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_OutVideoFormat(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_width(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_WIDTH_DATA_0) then
                    int_width(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_width(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_height(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_HEIGHT_DATA_0) then
                    int_height(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_height(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ColStart(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COLSTART_DATA_0) then
                    int_ColStart(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_ColStart(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ColEnd(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COLEND_DATA_0) then
                    int_ColEnd(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_ColEnd(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_RowStart(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_ROWSTART_DATA_0) then
                    int_RowStart(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_RowStart(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_RowEnd(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_ROWEND_DATA_0) then
                    int_RowEnd(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_RowEnd(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K11(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K11_DATA_0) then
                    int_K11(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K11(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K12(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K12_DATA_0) then
                    int_K12(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K12(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K13(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K13_DATA_0) then
                    int_K13(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K13(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K21(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K21_DATA_0) then
                    int_K21(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K21(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K22(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K22_DATA_0) then
                    int_K22(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K22(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K23(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K23_DATA_0) then
                    int_K23(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K23(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K31(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K31_DATA_0) then
                    int_K31(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K31(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K32(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K32_DATA_0) then
                    int_K32(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K32(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K33(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K33_DATA_0) then
                    int_K33(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K33(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ROffset(9 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_ROFFSET_DATA_0) then
                    int_ROffset(9 downto 0) <= (UNSIGNED(WDATA(9 downto 0)) and wmask(9 downto 0)) or ((not wmask(9 downto 0)) and int_ROffset(9 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_GOffset(9 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_GOFFSET_DATA_0) then
                    int_GOffset(9 downto 0) <= (UNSIGNED(WDATA(9 downto 0)) and wmask(9 downto 0)) or ((not wmask(9 downto 0)) and int_GOffset(9 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_BOffset(9 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_BOFFSET_DATA_0) then
                    int_BOffset(9 downto 0) <= (UNSIGNED(WDATA(9 downto 0)) and wmask(9 downto 0)) or ((not wmask(9 downto 0)) and int_BOffset(9 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ClampMin(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_CLAMPMIN_DATA_0) then
                    int_ClampMin(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_ClampMin(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ClipMax(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_CLIPMAX_DATA_0) then
                    int_ClipMax(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_ClipMax(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K11_2(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K11_2_DATA_0) then
                    int_K11_2(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K11_2(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K12_2(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K12_2_DATA_0) then
                    int_K12_2(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K12_2(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K13_2(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K13_2_DATA_0) then
                    int_K13_2(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K13_2(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K21_2(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K21_2_DATA_0) then
                    int_K21_2(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K21_2(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K22_2(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K22_2_DATA_0) then
                    int_K22_2(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K22_2(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K23_2(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K23_2_DATA_0) then
                    int_K23_2(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K23_2(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K31_2(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K31_2_DATA_0) then
                    int_K31_2(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K31_2(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K32_2(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K32_2_DATA_0) then
                    int_K32_2(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K32_2(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_K33_2(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_K33_2_DATA_0) then
                    int_K33_2(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_K33_2(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ROffset_2(9 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_ROFFSET_2_DATA_0) then
                    int_ROffset_2(9 downto 0) <= (UNSIGNED(WDATA(9 downto 0)) and wmask(9 downto 0)) or ((not wmask(9 downto 0)) and int_ROffset_2(9 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_GOffset_2(9 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_GOFFSET_2_DATA_0) then
                    int_GOffset_2(9 downto 0) <= (UNSIGNED(WDATA(9 downto 0)) and wmask(9 downto 0)) or ((not wmask(9 downto 0)) and int_GOffset_2(9 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_BOffset_2(9 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_BOFFSET_2_DATA_0) then
                    int_BOffset_2(9 downto 0) <= (UNSIGNED(WDATA(9 downto 0)) and wmask(9 downto 0)) or ((not wmask(9 downto 0)) and int_BOffset_2(9 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ClampMin_2(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_CLAMPMIN_2_DATA_0) then
                    int_ClampMin_2(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_ClampMin_2(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ClipMax_2(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_CLIPMAX_2_DATA_0) then
                    int_ClipMax_2(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_ClipMax_2(7 downto 0));
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------

end architecture behave;
