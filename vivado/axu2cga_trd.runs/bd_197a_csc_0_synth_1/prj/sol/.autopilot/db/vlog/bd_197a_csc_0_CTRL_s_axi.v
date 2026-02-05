// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
`timescale 1ns/1ps
(* DowngradeIPIdentifiedWarnings="yes" *) module bd_197a_csc_0_CTRL_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 9,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire [7:0]                    InVideoFormat,
    output wire [7:0]                    OutVideoFormat,
    output wire [15:0]                   width,
    output wire [15:0]                   height,
    output wire [15:0]                   ColStart,
    output wire [15:0]                   ColEnd,
    output wire [15:0]                   RowStart,
    output wire [15:0]                   RowEnd,
    output wire [15:0]                   K11,
    output wire [15:0]                   K12,
    output wire [15:0]                   K13,
    output wire [15:0]                   K21,
    output wire [15:0]                   K22,
    output wire [15:0]                   K23,
    output wire [15:0]                   K31,
    output wire [15:0]                   K32,
    output wire [15:0]                   K33,
    output wire [9:0]                    ROffset,
    output wire [9:0]                    GOffset,
    output wire [9:0]                    BOffset,
    output wire [7:0]                    ClampMin,
    output wire [7:0]                    ClipMax,
    output wire [15:0]                   K11_2,
    output wire [15:0]                   K12_2,
    output wire [15:0]                   K13_2,
    output wire [15:0]                   K21_2,
    output wire [15:0]                   K22_2,
    output wire [15:0]                   K23_2,
    output wire [15:0]                   K31_2,
    output wire [15:0]                   K32_2,
    output wire [15:0]                   K33_2,
    output wire [9:0]                    ROffset_2,
    output wire [9:0]                    GOffset_2,
    output wire [9:0]                    BOffset_2,
    output wire [7:0]                    ClampMin_2,
    output wire [7:0]                    ClipMax_2,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle
);
//------------------------Address Info-------------------
// Protocol Used: ap_ctrl_hs
//
// 0x000 : Control signals
//         bit 0  - ap_start (Read/Write/COH)
//         bit 1  - ap_done (Read/COR)
//         bit 2  - ap_idle (Read)
//         bit 3  - ap_ready (Read/COR)
//         bit 7  - auto_restart (Read/Write)
//         bit 9  - interrupt (Read)
//         others - reserved
// 0x004 : Global Interrupt Enable Register
//         bit 0  - Global Interrupt Enable (Read/Write)
//         others - reserved
// 0x008 : IP Interrupt Enable Register (Read/Write)
//         bit 0 - enable ap_done interrupt (Read/Write)
//         bit 1 - enable ap_ready interrupt (Read/Write)
//         others - reserved
// 0x00c : IP Interrupt Status Register (Read/TOW)
//         bit 0 - ap_done (Read/TOW)
//         bit 1 - ap_ready (Read/TOW)
//         others - reserved
// 0x010 : Data signal of InVideoFormat
//         bit 7~0 - InVideoFormat[7:0] (Read/Write)
//         others  - reserved
// 0x014 : reserved
// 0x018 : Data signal of OutVideoFormat
//         bit 7~0 - OutVideoFormat[7:0] (Read/Write)
//         others  - reserved
// 0x01c : reserved
// 0x020 : Data signal of width
//         bit 15~0 - width[15:0] (Read/Write)
//         others   - reserved
// 0x024 : reserved
// 0x028 : Data signal of height
//         bit 15~0 - height[15:0] (Read/Write)
//         others   - reserved
// 0x02c : reserved
// 0x030 : Data signal of ColStart
//         bit 15~0 - ColStart[15:0] (Read/Write)
//         others   - reserved
// 0x034 : reserved
// 0x038 : Data signal of ColEnd
//         bit 15~0 - ColEnd[15:0] (Read/Write)
//         others   - reserved
// 0x03c : reserved
// 0x040 : Data signal of RowStart
//         bit 15~0 - RowStart[15:0] (Read/Write)
//         others   - reserved
// 0x044 : reserved
// 0x048 : Data signal of RowEnd
//         bit 15~0 - RowEnd[15:0] (Read/Write)
//         others   - reserved
// 0x04c : reserved
// 0x050 : Data signal of K11
//         bit 15~0 - K11[15:0] (Read/Write)
//         others   - reserved
// 0x054 : reserved
// 0x058 : Data signal of K12
//         bit 15~0 - K12[15:0] (Read/Write)
//         others   - reserved
// 0x05c : reserved
// 0x060 : Data signal of K13
//         bit 15~0 - K13[15:0] (Read/Write)
//         others   - reserved
// 0x064 : reserved
// 0x068 : Data signal of K21
//         bit 15~0 - K21[15:0] (Read/Write)
//         others   - reserved
// 0x06c : reserved
// 0x070 : Data signal of K22
//         bit 15~0 - K22[15:0] (Read/Write)
//         others   - reserved
// 0x074 : reserved
// 0x078 : Data signal of K23
//         bit 15~0 - K23[15:0] (Read/Write)
//         others   - reserved
// 0x07c : reserved
// 0x080 : Data signal of K31
//         bit 15~0 - K31[15:0] (Read/Write)
//         others   - reserved
// 0x084 : reserved
// 0x088 : Data signal of K32
//         bit 15~0 - K32[15:0] (Read/Write)
//         others   - reserved
// 0x08c : reserved
// 0x090 : Data signal of K33
//         bit 15~0 - K33[15:0] (Read/Write)
//         others   - reserved
// 0x094 : reserved
// 0x098 : Data signal of ROffset
//         bit 9~0 - ROffset[9:0] (Read/Write)
//         others  - reserved
// 0x09c : reserved
// 0x0a0 : Data signal of GOffset
//         bit 9~0 - GOffset[9:0] (Read/Write)
//         others  - reserved
// 0x0a4 : reserved
// 0x0a8 : Data signal of BOffset
//         bit 9~0 - BOffset[9:0] (Read/Write)
//         others  - reserved
// 0x0ac : reserved
// 0x0b0 : Data signal of ClampMin
//         bit 7~0 - ClampMin[7:0] (Read/Write)
//         others  - reserved
// 0x0b4 : reserved
// 0x0b8 : Data signal of ClipMax
//         bit 7~0 - ClipMax[7:0] (Read/Write)
//         others  - reserved
// 0x0bc : reserved
// 0x0c0 : Data signal of K11_2
//         bit 15~0 - K11_2[15:0] (Read/Write)
//         others   - reserved
// 0x0c4 : reserved
// 0x0c8 : Data signal of K12_2
//         bit 15~0 - K12_2[15:0] (Read/Write)
//         others   - reserved
// 0x0cc : reserved
// 0x0d0 : Data signal of K13_2
//         bit 15~0 - K13_2[15:0] (Read/Write)
//         others   - reserved
// 0x0d4 : reserved
// 0x0d8 : Data signal of K21_2
//         bit 15~0 - K21_2[15:0] (Read/Write)
//         others   - reserved
// 0x0dc : reserved
// 0x0e0 : Data signal of K22_2
//         bit 15~0 - K22_2[15:0] (Read/Write)
//         others   - reserved
// 0x0e4 : reserved
// 0x0e8 : Data signal of K23_2
//         bit 15~0 - K23_2[15:0] (Read/Write)
//         others   - reserved
// 0x0ec : reserved
// 0x0f0 : Data signal of K31_2
//         bit 15~0 - K31_2[15:0] (Read/Write)
//         others   - reserved
// 0x0f4 : reserved
// 0x0f8 : Data signal of K32_2
//         bit 15~0 - K32_2[15:0] (Read/Write)
//         others   - reserved
// 0x0fc : reserved
// 0x100 : Data signal of K33_2
//         bit 15~0 - K33_2[15:0] (Read/Write)
//         others   - reserved
// 0x104 : reserved
// 0x108 : Data signal of ROffset_2
//         bit 9~0 - ROffset_2[9:0] (Read/Write)
//         others  - reserved
// 0x10c : reserved
// 0x110 : Data signal of GOffset_2
//         bit 9~0 - GOffset_2[9:0] (Read/Write)
//         others  - reserved
// 0x114 : reserved
// 0x118 : Data signal of BOffset_2
//         bit 9~0 - BOffset_2[9:0] (Read/Write)
//         others  - reserved
// 0x11c : reserved
// 0x120 : Data signal of ClampMin_2
//         bit 7~0 - ClampMin_2[7:0] (Read/Write)
//         others  - reserved
// 0x124 : reserved
// 0x128 : Data signal of ClipMax_2
//         bit 7~0 - ClipMax_2[7:0] (Read/Write)
//         others  - reserved
// 0x12c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL               = 9'h000,
    ADDR_GIE                   = 9'h004,
    ADDR_IER                   = 9'h008,
    ADDR_ISR                   = 9'h00c,
    ADDR_INVIDEOFORMAT_DATA_0  = 9'h010,
    ADDR_INVIDEOFORMAT_CTRL    = 9'h014,
    ADDR_OUTVIDEOFORMAT_DATA_0 = 9'h018,
    ADDR_OUTVIDEOFORMAT_CTRL   = 9'h01c,
    ADDR_WIDTH_DATA_0          = 9'h020,
    ADDR_WIDTH_CTRL            = 9'h024,
    ADDR_HEIGHT_DATA_0         = 9'h028,
    ADDR_HEIGHT_CTRL           = 9'h02c,
    ADDR_COLSTART_DATA_0       = 9'h030,
    ADDR_COLSTART_CTRL         = 9'h034,
    ADDR_COLEND_DATA_0         = 9'h038,
    ADDR_COLEND_CTRL           = 9'h03c,
    ADDR_ROWSTART_DATA_0       = 9'h040,
    ADDR_ROWSTART_CTRL         = 9'h044,
    ADDR_ROWEND_DATA_0         = 9'h048,
    ADDR_ROWEND_CTRL           = 9'h04c,
    ADDR_K11_DATA_0            = 9'h050,
    ADDR_K11_CTRL              = 9'h054,
    ADDR_K12_DATA_0            = 9'h058,
    ADDR_K12_CTRL              = 9'h05c,
    ADDR_K13_DATA_0            = 9'h060,
    ADDR_K13_CTRL              = 9'h064,
    ADDR_K21_DATA_0            = 9'h068,
    ADDR_K21_CTRL              = 9'h06c,
    ADDR_K22_DATA_0            = 9'h070,
    ADDR_K22_CTRL              = 9'h074,
    ADDR_K23_DATA_0            = 9'h078,
    ADDR_K23_CTRL              = 9'h07c,
    ADDR_K31_DATA_0            = 9'h080,
    ADDR_K31_CTRL              = 9'h084,
    ADDR_K32_DATA_0            = 9'h088,
    ADDR_K32_CTRL              = 9'h08c,
    ADDR_K33_DATA_0            = 9'h090,
    ADDR_K33_CTRL              = 9'h094,
    ADDR_ROFFSET_DATA_0        = 9'h098,
    ADDR_ROFFSET_CTRL          = 9'h09c,
    ADDR_GOFFSET_DATA_0        = 9'h0a0,
    ADDR_GOFFSET_CTRL          = 9'h0a4,
    ADDR_BOFFSET_DATA_0        = 9'h0a8,
    ADDR_BOFFSET_CTRL          = 9'h0ac,
    ADDR_CLAMPMIN_DATA_0       = 9'h0b0,
    ADDR_CLAMPMIN_CTRL         = 9'h0b4,
    ADDR_CLIPMAX_DATA_0        = 9'h0b8,
    ADDR_CLIPMAX_CTRL          = 9'h0bc,
    ADDR_K11_2_DATA_0          = 9'h0c0,
    ADDR_K11_2_CTRL            = 9'h0c4,
    ADDR_K12_2_DATA_0          = 9'h0c8,
    ADDR_K12_2_CTRL            = 9'h0cc,
    ADDR_K13_2_DATA_0          = 9'h0d0,
    ADDR_K13_2_CTRL            = 9'h0d4,
    ADDR_K21_2_DATA_0          = 9'h0d8,
    ADDR_K21_2_CTRL            = 9'h0dc,
    ADDR_K22_2_DATA_0          = 9'h0e0,
    ADDR_K22_2_CTRL            = 9'h0e4,
    ADDR_K23_2_DATA_0          = 9'h0e8,
    ADDR_K23_2_CTRL            = 9'h0ec,
    ADDR_K31_2_DATA_0          = 9'h0f0,
    ADDR_K31_2_CTRL            = 9'h0f4,
    ADDR_K32_2_DATA_0          = 9'h0f8,
    ADDR_K32_2_CTRL            = 9'h0fc,
    ADDR_K33_2_DATA_0          = 9'h100,
    ADDR_K33_2_CTRL            = 9'h104,
    ADDR_ROFFSET_2_DATA_0      = 9'h108,
    ADDR_ROFFSET_2_CTRL        = 9'h10c,
    ADDR_GOFFSET_2_DATA_0      = 9'h110,
    ADDR_GOFFSET_2_CTRL        = 9'h114,
    ADDR_BOFFSET_2_DATA_0      = 9'h118,
    ADDR_BOFFSET_2_CTRL        = 9'h11c,
    ADDR_CLAMPMIN_2_DATA_0     = 9'h120,
    ADDR_CLAMPMIN_2_CTRL       = 9'h124,
    ADDR_CLIPMAX_2_DATA_0      = 9'h128,
    ADDR_CLIPMAX_2_CTRL        = 9'h12c,
    WRIDLE                     = 2'd0,
    WRDATA                     = 2'd1,
    WRRESP                     = 2'd2,
    WRRESET                    = 2'd3,
    RDIDLE                     = 2'd0,
    RDDATA                     = 2'd1,
    RDRESET                    = 2'd2,
    ADDR_BITS                = 9;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle = 1'b0;
    reg                           int_ap_ready = 1'b0;
    wire                          task_ap_ready;
    reg                           int_ap_done = 1'b0;
    wire                          task_ap_done;
    reg                           int_task_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_interrupt = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           auto_restart_status = 1'b0;
    wire                          auto_restart_done;
    reg                           int_gie = 1'b0;
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
    reg  [7:0]                    int_InVideoFormat = 'b0;
    reg  [7:0]                    int_OutVideoFormat = 'b0;
    reg  [15:0]                   int_width = 'b0;
    reg  [15:0]                   int_height = 'b0;
    reg  [15:0]                   int_ColStart = 'b0;
    reg  [15:0]                   int_ColEnd = 'b0;
    reg  [15:0]                   int_RowStart = 'b0;
    reg  [15:0]                   int_RowEnd = 'b0;
    reg  [15:0]                   int_K11 = 'b0;
    reg  [15:0]                   int_K12 = 'b0;
    reg  [15:0]                   int_K13 = 'b0;
    reg  [15:0]                   int_K21 = 'b0;
    reg  [15:0]                   int_K22 = 'b0;
    reg  [15:0]                   int_K23 = 'b0;
    reg  [15:0]                   int_K31 = 'b0;
    reg  [15:0]                   int_K32 = 'b0;
    reg  [15:0]                   int_K33 = 'b0;
    reg  [9:0]                    int_ROffset = 'b0;
    reg  [9:0]                    int_GOffset = 'b0;
    reg  [9:0]                    int_BOffset = 'b0;
    reg  [7:0]                    int_ClampMin = 'b0;
    reg  [7:0]                    int_ClipMax = 'b0;
    reg  [15:0]                   int_K11_2 = 'b0;
    reg  [15:0]                   int_K12_2 = 'b0;
    reg  [15:0]                   int_K13_2 = 'b0;
    reg  [15:0]                   int_K21_2 = 'b0;
    reg  [15:0]                   int_K22_2 = 'b0;
    reg  [15:0]                   int_K23_2 = 'b0;
    reg  [15:0]                   int_K31_2 = 'b0;
    reg  [15:0]                   int_K32_2 = 'b0;
    reg  [15:0]                   int_K33_2 = 'b0;
    reg  [9:0]                    int_ROffset_2 = 'b0;
    reg  [9:0]                    int_GOffset_2 = 'b0;
    reg  [9:0]                    int_BOffset_2 = 'b0;
    reg  [7:0]                    int_ClampMin_2 = 'b0;
    reg  [7:0]                    int_ClipMax_2 = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BVALID  = (wstate == WRRESP);
assign BRESP   = 2'b00;  // OKAY
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY & BVALID)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= {AWADDR[ADDR_BITS-1:2], {2{1'b0}}};
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_task_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                    rdata[9] <= int_interrupt;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_INVIDEOFORMAT_DATA_0: begin
                    rdata <= int_InVideoFormat[7:0];
                end
                ADDR_OUTVIDEOFORMAT_DATA_0: begin
                    rdata <= int_OutVideoFormat[7:0];
                end
                ADDR_WIDTH_DATA_0: begin
                    rdata <= int_width[15:0];
                end
                ADDR_HEIGHT_DATA_0: begin
                    rdata <= int_height[15:0];
                end
                ADDR_COLSTART_DATA_0: begin
                    rdata <= int_ColStart[15:0];
                end
                ADDR_COLEND_DATA_0: begin
                    rdata <= int_ColEnd[15:0];
                end
                ADDR_ROWSTART_DATA_0: begin
                    rdata <= int_RowStart[15:0];
                end
                ADDR_ROWEND_DATA_0: begin
                    rdata <= int_RowEnd[15:0];
                end
                ADDR_K11_DATA_0: begin
                    rdata <= int_K11[15:0];
                end
                ADDR_K12_DATA_0: begin
                    rdata <= int_K12[15:0];
                end
                ADDR_K13_DATA_0: begin
                    rdata <= int_K13[15:0];
                end
                ADDR_K21_DATA_0: begin
                    rdata <= int_K21[15:0];
                end
                ADDR_K22_DATA_0: begin
                    rdata <= int_K22[15:0];
                end
                ADDR_K23_DATA_0: begin
                    rdata <= int_K23[15:0];
                end
                ADDR_K31_DATA_0: begin
                    rdata <= int_K31[15:0];
                end
                ADDR_K32_DATA_0: begin
                    rdata <= int_K32[15:0];
                end
                ADDR_K33_DATA_0: begin
                    rdata <= int_K33[15:0];
                end
                ADDR_ROFFSET_DATA_0: begin
                    rdata <= int_ROffset[9:0];
                end
                ADDR_GOFFSET_DATA_0: begin
                    rdata <= int_GOffset[9:0];
                end
                ADDR_BOFFSET_DATA_0: begin
                    rdata <= int_BOffset[9:0];
                end
                ADDR_CLAMPMIN_DATA_0: begin
                    rdata <= int_ClampMin[7:0];
                end
                ADDR_CLIPMAX_DATA_0: begin
                    rdata <= int_ClipMax[7:0];
                end
                ADDR_K11_2_DATA_0: begin
                    rdata <= int_K11_2[15:0];
                end
                ADDR_K12_2_DATA_0: begin
                    rdata <= int_K12_2[15:0];
                end
                ADDR_K13_2_DATA_0: begin
                    rdata <= int_K13_2[15:0];
                end
                ADDR_K21_2_DATA_0: begin
                    rdata <= int_K21_2[15:0];
                end
                ADDR_K22_2_DATA_0: begin
                    rdata <= int_K22_2[15:0];
                end
                ADDR_K23_2_DATA_0: begin
                    rdata <= int_K23_2[15:0];
                end
                ADDR_K31_2_DATA_0: begin
                    rdata <= int_K31_2[15:0];
                end
                ADDR_K32_2_DATA_0: begin
                    rdata <= int_K32_2[15:0];
                end
                ADDR_K33_2_DATA_0: begin
                    rdata <= int_K33_2[15:0];
                end
                ADDR_ROFFSET_2_DATA_0: begin
                    rdata <= int_ROffset_2[9:0];
                end
                ADDR_GOFFSET_2_DATA_0: begin
                    rdata <= int_GOffset_2[9:0];
                end
                ADDR_BOFFSET_2_DATA_0: begin
                    rdata <= int_BOffset_2[9:0];
                end
                ADDR_CLAMPMIN_2_DATA_0: begin
                    rdata <= int_ClampMin_2[7:0];
                end
                ADDR_CLIPMAX_2_DATA_0: begin
                    rdata <= int_ClipMax_2[7:0];
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign interrupt         = int_interrupt;
assign ap_start          = int_ap_start;
assign task_ap_done      = (ap_done && !auto_restart_status) || auto_restart_done;
assign task_ap_ready     = ap_ready && !int_auto_restart;
assign auto_restart_done = auto_restart_status && (ap_idle && !int_ap_idle);
assign InVideoFormat     = int_InVideoFormat;
assign OutVideoFormat    = int_OutVideoFormat;
assign width             = int_width;
assign height            = int_height;
assign ColStart          = int_ColStart;
assign ColEnd            = int_ColEnd;
assign RowStart          = int_RowStart;
assign RowEnd            = int_RowEnd;
assign K11               = int_K11;
assign K12               = int_K12;
assign K13               = int_K13;
assign K21               = int_K21;
assign K22               = int_K22;
assign K23               = int_K23;
assign K31               = int_K31;
assign K32               = int_K32;
assign K33               = int_K33;
assign ROffset           = int_ROffset;
assign GOffset           = int_GOffset;
assign BOffset           = int_BOffset;
assign ClampMin          = int_ClampMin;
assign ClipMax           = int_ClipMax;
assign K11_2             = int_K11_2;
assign K12_2             = int_K12_2;
assign K13_2             = int_K13_2;
assign K21_2             = int_K21_2;
assign K22_2             = int_K22_2;
assign K23_2             = int_K23_2;
assign K31_2             = int_K31_2;
assign K32_2             = int_K32_2;
assign K33_2             = int_K33_2;
assign ROffset_2         = int_ROffset_2;
assign GOffset_2         = int_GOffset_2;
assign BOffset_2         = int_BOffset_2;
assign ClampMin_2        = int_ClampMin_2;
assign ClipMax_2         = int_ClipMax_2;
// int_interrupt
always @(posedge ACLK) begin
    if (ARESET)
        int_interrupt <= 1'b0;
    else if (ACLK_EN) begin
        if (int_gie && (|int_isr))
            int_interrupt <= 1'b1;
        else
            int_interrupt <= 1'b0;
    end
end

// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_done <= ap_done;
    end
end

// int_task_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_task_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_done)
            int_task_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_task_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_ready)
            int_ap_ready <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_ready <= 1'b0;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <= WDATA[7];
    end
end

// auto_restart_status
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_status <= 1'b0;
    else if (ACLK_EN) begin
        if (int_auto_restart)
            auto_restart_status <= 1'b1;
        else if (ap_idle)
            auto_restart_status <= 1'b0;
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_InVideoFormat[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_InVideoFormat[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_INVIDEOFORMAT_DATA_0)
            int_InVideoFormat[7:0] <= (WDATA[31:0] & wmask) | (int_InVideoFormat[7:0] & ~wmask);
    end
end

// int_OutVideoFormat[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_OutVideoFormat[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTVIDEOFORMAT_DATA_0)
            int_OutVideoFormat[7:0] <= (WDATA[31:0] & wmask) | (int_OutVideoFormat[7:0] & ~wmask);
    end
end

// int_width[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_width[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_WIDTH_DATA_0)
            int_width[15:0] <= (WDATA[31:0] & wmask) | (int_width[15:0] & ~wmask);
    end
end

// int_height[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_height[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_HEIGHT_DATA_0)
            int_height[15:0] <= (WDATA[31:0] & wmask) | (int_height[15:0] & ~wmask);
    end
end

// int_ColStart[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ColStart[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COLSTART_DATA_0)
            int_ColStart[15:0] <= (WDATA[31:0] & wmask) | (int_ColStart[15:0] & ~wmask);
    end
end

// int_ColEnd[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ColEnd[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COLEND_DATA_0)
            int_ColEnd[15:0] <= (WDATA[31:0] & wmask) | (int_ColEnd[15:0] & ~wmask);
    end
end

// int_RowStart[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_RowStart[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ROWSTART_DATA_0)
            int_RowStart[15:0] <= (WDATA[31:0] & wmask) | (int_RowStart[15:0] & ~wmask);
    end
end

// int_RowEnd[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_RowEnd[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ROWEND_DATA_0)
            int_RowEnd[15:0] <= (WDATA[31:0] & wmask) | (int_RowEnd[15:0] & ~wmask);
    end
end

// int_K11[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K11[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K11_DATA_0)
            int_K11[15:0] <= (WDATA[31:0] & wmask) | (int_K11[15:0] & ~wmask);
    end
end

// int_K12[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K12[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K12_DATA_0)
            int_K12[15:0] <= (WDATA[31:0] & wmask) | (int_K12[15:0] & ~wmask);
    end
end

// int_K13[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K13[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K13_DATA_0)
            int_K13[15:0] <= (WDATA[31:0] & wmask) | (int_K13[15:0] & ~wmask);
    end
end

// int_K21[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K21[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K21_DATA_0)
            int_K21[15:0] <= (WDATA[31:0] & wmask) | (int_K21[15:0] & ~wmask);
    end
end

// int_K22[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K22[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K22_DATA_0)
            int_K22[15:0] <= (WDATA[31:0] & wmask) | (int_K22[15:0] & ~wmask);
    end
end

// int_K23[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K23[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K23_DATA_0)
            int_K23[15:0] <= (WDATA[31:0] & wmask) | (int_K23[15:0] & ~wmask);
    end
end

// int_K31[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K31[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K31_DATA_0)
            int_K31[15:0] <= (WDATA[31:0] & wmask) | (int_K31[15:0] & ~wmask);
    end
end

// int_K32[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K32[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K32_DATA_0)
            int_K32[15:0] <= (WDATA[31:0] & wmask) | (int_K32[15:0] & ~wmask);
    end
end

// int_K33[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K33[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K33_DATA_0)
            int_K33[15:0] <= (WDATA[31:0] & wmask) | (int_K33[15:0] & ~wmask);
    end
end

// int_ROffset[9:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ROffset[9:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ROFFSET_DATA_0)
            int_ROffset[9:0] <= (WDATA[31:0] & wmask) | (int_ROffset[9:0] & ~wmask);
    end
end

// int_GOffset[9:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_GOffset[9:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GOFFSET_DATA_0)
            int_GOffset[9:0] <= (WDATA[31:0] & wmask) | (int_GOffset[9:0] & ~wmask);
    end
end

// int_BOffset[9:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_BOffset[9:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_BOFFSET_DATA_0)
            int_BOffset[9:0] <= (WDATA[31:0] & wmask) | (int_BOffset[9:0] & ~wmask);
    end
end

// int_ClampMin[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ClampMin[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_CLAMPMIN_DATA_0)
            int_ClampMin[7:0] <= (WDATA[31:0] & wmask) | (int_ClampMin[7:0] & ~wmask);
    end
end

// int_ClipMax[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ClipMax[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_CLIPMAX_DATA_0)
            int_ClipMax[7:0] <= (WDATA[31:0] & wmask) | (int_ClipMax[7:0] & ~wmask);
    end
end

// int_K11_2[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K11_2[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K11_2_DATA_0)
            int_K11_2[15:0] <= (WDATA[31:0] & wmask) | (int_K11_2[15:0] & ~wmask);
    end
end

// int_K12_2[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K12_2[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K12_2_DATA_0)
            int_K12_2[15:0] <= (WDATA[31:0] & wmask) | (int_K12_2[15:0] & ~wmask);
    end
end

// int_K13_2[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K13_2[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K13_2_DATA_0)
            int_K13_2[15:0] <= (WDATA[31:0] & wmask) | (int_K13_2[15:0] & ~wmask);
    end
end

// int_K21_2[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K21_2[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K21_2_DATA_0)
            int_K21_2[15:0] <= (WDATA[31:0] & wmask) | (int_K21_2[15:0] & ~wmask);
    end
end

// int_K22_2[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K22_2[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K22_2_DATA_0)
            int_K22_2[15:0] <= (WDATA[31:0] & wmask) | (int_K22_2[15:0] & ~wmask);
    end
end

// int_K23_2[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K23_2[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K23_2_DATA_0)
            int_K23_2[15:0] <= (WDATA[31:0] & wmask) | (int_K23_2[15:0] & ~wmask);
    end
end

// int_K31_2[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K31_2[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K31_2_DATA_0)
            int_K31_2[15:0] <= (WDATA[31:0] & wmask) | (int_K31_2[15:0] & ~wmask);
    end
end

// int_K32_2[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K32_2[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K32_2_DATA_0)
            int_K32_2[15:0] <= (WDATA[31:0] & wmask) | (int_K32_2[15:0] & ~wmask);
    end
end

// int_K33_2[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K33_2[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K33_2_DATA_0)
            int_K33_2[15:0] <= (WDATA[31:0] & wmask) | (int_K33_2[15:0] & ~wmask);
    end
end

// int_ROffset_2[9:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ROffset_2[9:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ROFFSET_2_DATA_0)
            int_ROffset_2[9:0] <= (WDATA[31:0] & wmask) | (int_ROffset_2[9:0] & ~wmask);
    end
end

// int_GOffset_2[9:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_GOffset_2[9:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GOFFSET_2_DATA_0)
            int_GOffset_2[9:0] <= (WDATA[31:0] & wmask) | (int_GOffset_2[9:0] & ~wmask);
    end
end

// int_BOffset_2[9:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_BOffset_2[9:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_BOFFSET_2_DATA_0)
            int_BOffset_2[9:0] <= (WDATA[31:0] & wmask) | (int_BOffset_2[9:0] & ~wmask);
    end
end

// int_ClampMin_2[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ClampMin_2[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_CLAMPMIN_2_DATA_0)
            int_ClampMin_2[7:0] <= (WDATA[31:0] & wmask) | (int_ClampMin_2[7:0] & ~wmask);
    end
end

// int_ClipMax_2[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ClipMax_2[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_CLIPMAX_2_DATA_0)
            int_ClipMax_2[7:0] <= (WDATA[31:0] & wmask) | (int_ClipMax_2[7:0] & ~wmask);
    end
end

//synthesis translate_off
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (int_gie & ~int_isr[0] & int_ier[0] & ap_done)
            $display ("// Interrupt Monitor : interrupt for ap_done detected @ \"%0t\"", $time);
        if (int_gie & ~int_isr[1] & int_ier[1] & ap_ready)
            $display ("// Interrupt Monitor : interrupt for ap_ready detected @ \"%0t\"", $time);
    end
end
//synthesis translate_on

//------------------------Memory logic-------------------

endmodule
