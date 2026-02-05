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

#define BD_D92B_CSC_0_CTRL_ADDR_AP_CTRL             0x000
#define BD_D92B_CSC_0_CTRL_ADDR_GIE                 0x004
#define BD_D92B_CSC_0_CTRL_ADDR_IER                 0x008
#define BD_D92B_CSC_0_CTRL_ADDR_ISR                 0x00c
#define BD_D92B_CSC_0_CTRL_ADDR_INVIDEOFORMAT_DATA  0x010
#define BD_D92B_CSC_0_CTRL_BITS_INVIDEOFORMAT_DATA  8
#define BD_D92B_CSC_0_CTRL_ADDR_OUTVIDEOFORMAT_DATA 0x018
#define BD_D92B_CSC_0_CTRL_BITS_OUTVIDEOFORMAT_DATA 8
#define BD_D92B_CSC_0_CTRL_ADDR_WIDTH_DATA          0x020
#define BD_D92B_CSC_0_CTRL_BITS_WIDTH_DATA          16
#define BD_D92B_CSC_0_CTRL_ADDR_HEIGHT_DATA         0x028
#define BD_D92B_CSC_0_CTRL_BITS_HEIGHT_DATA         16
#define BD_D92B_CSC_0_CTRL_ADDR_COLSTART_DATA       0x030
#define BD_D92B_CSC_0_CTRL_BITS_COLSTART_DATA       16
#define BD_D92B_CSC_0_CTRL_ADDR_COLEND_DATA         0x038
#define BD_D92B_CSC_0_CTRL_BITS_COLEND_DATA         16
#define BD_D92B_CSC_0_CTRL_ADDR_ROWSTART_DATA       0x040
#define BD_D92B_CSC_0_CTRL_BITS_ROWSTART_DATA       16
#define BD_D92B_CSC_0_CTRL_ADDR_ROWEND_DATA         0x048
#define BD_D92B_CSC_0_CTRL_BITS_ROWEND_DATA         16
#define BD_D92B_CSC_0_CTRL_ADDR_K11_DATA            0x050
#define BD_D92B_CSC_0_CTRL_BITS_K11_DATA            16
#define BD_D92B_CSC_0_CTRL_ADDR_K12_DATA            0x058
#define BD_D92B_CSC_0_CTRL_BITS_K12_DATA            16
#define BD_D92B_CSC_0_CTRL_ADDR_K13_DATA            0x060
#define BD_D92B_CSC_0_CTRL_BITS_K13_DATA            16
#define BD_D92B_CSC_0_CTRL_ADDR_K21_DATA            0x068
#define BD_D92B_CSC_0_CTRL_BITS_K21_DATA            16
#define BD_D92B_CSC_0_CTRL_ADDR_K22_DATA            0x070
#define BD_D92B_CSC_0_CTRL_BITS_K22_DATA            16
#define BD_D92B_CSC_0_CTRL_ADDR_K23_DATA            0x078
#define BD_D92B_CSC_0_CTRL_BITS_K23_DATA            16
#define BD_D92B_CSC_0_CTRL_ADDR_K31_DATA            0x080
#define BD_D92B_CSC_0_CTRL_BITS_K31_DATA            16
#define BD_D92B_CSC_0_CTRL_ADDR_K32_DATA            0x088
#define BD_D92B_CSC_0_CTRL_BITS_K32_DATA            16
#define BD_D92B_CSC_0_CTRL_ADDR_K33_DATA            0x090
#define BD_D92B_CSC_0_CTRL_BITS_K33_DATA            16
#define BD_D92B_CSC_0_CTRL_ADDR_ROFFSET_DATA        0x098
#define BD_D92B_CSC_0_CTRL_BITS_ROFFSET_DATA        10
#define BD_D92B_CSC_0_CTRL_ADDR_GOFFSET_DATA        0x0a0
#define BD_D92B_CSC_0_CTRL_BITS_GOFFSET_DATA        10
#define BD_D92B_CSC_0_CTRL_ADDR_BOFFSET_DATA        0x0a8
#define BD_D92B_CSC_0_CTRL_BITS_BOFFSET_DATA        10
#define BD_D92B_CSC_0_CTRL_ADDR_CLAMPMIN_DATA       0x0b0
#define BD_D92B_CSC_0_CTRL_BITS_CLAMPMIN_DATA       8
#define BD_D92B_CSC_0_CTRL_ADDR_CLIPMAX_DATA        0x0b8
#define BD_D92B_CSC_0_CTRL_BITS_CLIPMAX_DATA        8
#define BD_D92B_CSC_0_CTRL_ADDR_K11_2_DATA          0x0c0
#define BD_D92B_CSC_0_CTRL_BITS_K11_2_DATA          16
#define BD_D92B_CSC_0_CTRL_ADDR_K12_2_DATA          0x0c8
#define BD_D92B_CSC_0_CTRL_BITS_K12_2_DATA          16
#define BD_D92B_CSC_0_CTRL_ADDR_K13_2_DATA          0x0d0
#define BD_D92B_CSC_0_CTRL_BITS_K13_2_DATA          16
#define BD_D92B_CSC_0_CTRL_ADDR_K21_2_DATA          0x0d8
#define BD_D92B_CSC_0_CTRL_BITS_K21_2_DATA          16
#define BD_D92B_CSC_0_CTRL_ADDR_K22_2_DATA          0x0e0
#define BD_D92B_CSC_0_CTRL_BITS_K22_2_DATA          16
#define BD_D92B_CSC_0_CTRL_ADDR_K23_2_DATA          0x0e8
#define BD_D92B_CSC_0_CTRL_BITS_K23_2_DATA          16
#define BD_D92B_CSC_0_CTRL_ADDR_K31_2_DATA          0x0f0
#define BD_D92B_CSC_0_CTRL_BITS_K31_2_DATA          16
#define BD_D92B_CSC_0_CTRL_ADDR_K32_2_DATA          0x0f8
#define BD_D92B_CSC_0_CTRL_BITS_K32_2_DATA          16
#define BD_D92B_CSC_0_CTRL_ADDR_K33_2_DATA          0x100
#define BD_D92B_CSC_0_CTRL_BITS_K33_2_DATA          16
#define BD_D92B_CSC_0_CTRL_ADDR_ROFFSET_2_DATA      0x108
#define BD_D92B_CSC_0_CTRL_BITS_ROFFSET_2_DATA      10
#define BD_D92B_CSC_0_CTRL_ADDR_GOFFSET_2_DATA      0x110
#define BD_D92B_CSC_0_CTRL_BITS_GOFFSET_2_DATA      10
#define BD_D92B_CSC_0_CTRL_ADDR_BOFFSET_2_DATA      0x118
#define BD_D92B_CSC_0_CTRL_BITS_BOFFSET_2_DATA      10
#define BD_D92B_CSC_0_CTRL_ADDR_CLAMPMIN_2_DATA     0x120
#define BD_D92B_CSC_0_CTRL_BITS_CLAMPMIN_2_DATA     8
#define BD_D92B_CSC_0_CTRL_ADDR_CLIPMAX_2_DATA      0x128
#define BD_D92B_CSC_0_CTRL_BITS_CLIPMAX_2_DATA      8
