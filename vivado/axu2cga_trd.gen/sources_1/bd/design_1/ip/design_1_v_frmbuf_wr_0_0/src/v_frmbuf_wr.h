// (c) Copyright 2023 Advanced Micro Devices, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
////////////////////////////////////////////////////////////
#ifndef _V_FRMBUF_WR_TOP_H_
#define _V_FRMBUF_WR_TOP_H_
#define AP_INT_MAX_W 4096
#include "hls_video.h"
#include "ap_int.h"

typedef unsigned char U8;
typedef unsigned short U16;
typedef unsigned int U32;

typedef signed char I8;
typedef signed short I16;
typedef signed int I32;

#define MIN_ROWS 64
#define MIN_COLS 64

// Streaming video formats
#define RGB444                  0
#define YUV444                  1
#define YUV422                  2
#define YUV420                  3
#define Y                       4
#define RGBA                    5
#define YUVA444                 6

// Video in memory formats
#define RGBX8                   10  // [31:0] x:B:G:R 8:8:8:8
#define YUVX8                   11  // [31:0] x:V:U:Y 8:8:8:8
#define YUYV8                   12  // [31:0] V:Y:U:Y 8:8:8:8
#define RGBA8                   13  // [31:0] A:B:G:R 8:8:8:8
#define YUVA8                   14  // [31:0] A:V:U:Y 8:8:8:8
#define RGBX10                  15  // [31:0] x:B:G:R 2:10:10:10
#define YUVX10                  16  // [31:0] x:V:U:Y 2:10:10:10
#define RGB565                  17  // [15:0] B:G:R 5:6:5
#define Y_UV8                   18  // [15:0] Y:Y 8:8, [15:0] V:U 8:8
#define Y_UV8_420               19  // [15:0] Y:Y 8:8, [15:0] V:U 8:8
#define RGB8                    20  // [23:0] B:G:R 8:8:8
#define YUV8                    21  // [24:0] V:U:Y 8:8:8
#define Y_UV10                  22  // [31:0] x:Y:Y:Y 2:10:10:10, [31:0] x:U:V:U 2:10:10:10
#define Y_UV10_420              23  // [31:0] x:Y:Y:Y 2:10:10:10, [31:0] x:U:V:U 2:10:10:10
#define Y8                      24  // [31:0] Y3:Y2:Y1:Y0 8:8:8:8
#define Y10                     25  // [31:0] x:Y2:Y1:Y0 2:10:10:10
#define BGRA8                   26  // [31:0] A:R:G:B 8:8:8:8
#define BGRX8                   27  // [31:0] X:R:G:B 8:8:8:8
#define UYVY8                   28  // [31:0] Y:V:Y:U 8:8:8:8
#define BGR8                    29  // [23:0] R:G:B 8:8:8
#define RGBX12                  30  // [39:0] x:R:G:B 4:12:12:12
#define YUVX12                  31  // [39:0] x:V:U:Y 4:12:12:12
#define Y_UV12                  32  // [23:0] Y:Y 12:12, [23:0] V:U 12:12
#define Y_UV12_420              33  // [23:0] Y:Y 12:12, [23:0] V:U 12:12
#define Y12                     34  // [39:0] x:Y2:Y1:Y0 4:12:12:12
#define RGB16                   35  // [47:0] R:G:B 16:16:16
#define YUV16                   36  // [47:0] V:U:Y 16:16:16
#define Y_UV16                  37  // [31:0] Y:Y 16:16, [31:0] V:U 16:16
#define Y_UV16_420              38  // [31:0] Y:Y 16:16, [31:0] V:U 16:16
#define Y16                     39  // [47:0] Y2:Y1:Y0 16:16:16
#define Y_U_V8_420              41  // [7:0] Y, [7:0] U, [7:0] V
#define Y_U_V8                  42  // [7:0] Y, [7:0] U, [7:0] V
#define Y_U_V10                 43  // [9:0] Y, [9:0] U, [9:0] V
#define Y_U_V12                 44  // [11:0] Y, [11:0] U, [11:0] V

#define IS_PIXEL_ALPHA(a)       ((a)==RGBA8 || (a)==YUVA8 || (a)==BGRA8)
#define IS_YUV(a)               ((a)==YUV444 || (a)==YUV422 || (a)==YUV420 || (a)==YUVA444 || (a)==YUVX8 || (a)==YUYV8 || (a)==YUVA8 || (a)==YUVX10 || (a)==Y_UV8 || (a)==Y_UV8_420 || \
								 (a)==YUV8 || (a)==Y_UV10 || (a)==Y_UV10_420 || (a)==Y8 || (a)==Y10 || (a)==UYVY8 || (a)==YUVX12 || (a)==Y_UV12 || (a)==Y_UV12_420 || (a)==Y12 || \
								 (a)==YUV16 || (a)==Y_UV16 || (a)==Y_UV16_420 || (a)==Y16)
#define IS_444(a)               ((a)==YUV444 || (a)==YUVA444 || (a)==YUVX8 || (a)==YUVA8 || (a)==YUVX10 || (a)==YUV8 || (a)==Y8 || (a)==Y10 || (a)==YUVX12 || (a)==Y12 || (a)==YUV16 || (a)==Y16)
#define IS_422(a)               ((a)==YUV422 || (a)==YUYV8 || (a)==Y_UV8 || (a)==Y_UV10 || (a)==UYVY8 || (a)==Y_UV12 || (a)==Y_UV16 )
#define NR_PLANES_ONE_OR_TWO(a)	(((a)==Y_UV8 || (a)==Y_UV8_420 || (a)==Y_UV10 || (a)==Y_UV10_420 || (a)==Y_UV12 || (a)==Y_UV12_420 || (a)==Y_UV16 || (a)==Y_UV16_420) ? 2 :1)
#define NR_PLANES(a)			(((a)==Y_U_V8_420 || (a)==Y_U_V8 || (a)==Y_U_V10 || (a)==Y_U_V12) ? 3 : NR_PLANES_ONE_OR_TWO(a))
#define IS_420(a)               ((a)==YUV420 || (a)==Y_UV8_420 || (a)==Y_U_V8_420 || (a)==Y_UV10_420 || (a)==Y_UV12_420 || (a)==Y_UV16_420)
inline U8 DEPTH(U16 a)
{
	if ((a) == RGBX10 || (a) == YUVX10 || (a) == Y_UV10 || (a) == Y_UV10_420 || (a) == Y10
			|| (a) == Y_U_V10)
	{
		return 10;
	}
	else if ((a) == RGBX12 || (a) == YUVX12 || (a) == Y_UV12 || (a) == Y_UV12_420 || (a) == Y12 
			|| (a) == Y_U_V12)
	{
		return 12;
	}
	else if ((a) == RGB16 || (a) == YUV16 || (a) == Y_UV16 || (a) == Y_UV16_420 || (a) == Y16)
	{
		return 16;
	}
	return 8;
}

const int MAX_BYTES_PER_PIXEL = 4;

const int BYTES_PER_PIXEL[] =
{
// Streaming video formats
		0,// RGB444
		0, // YUV444
		0, // YUV422
		0, // YUV420
		0, // unused
		0, // unused
		0, // unused
		0, // unused
		0, // unused
		0, // unused

		// Video in memory formats
		4,// RGBX8
		4, // YUVX8
		2, // YUYV8
		4, // RGBA8
		4, // YUVA8
		4, // RGBX10
		4, // YUVX10
		2, // unused
		1, // Y_UV8
		1, // Y_UV8_420
		3, // RGB8
		3, // YUV8
		4, // Y_UV10        4 bytes per 3 pixels
		4, // Y_UV10_420    4 bytes per 3 pixels
		1, // Y8
		4, // Y10           4 bytes per 3 pixels
		4, // BGRA8
		4, // BGRX8
		2, // UYVY8
		3, // BGR8
		5, // RGBX12         5 bytes per pixel
		5, // YUVX12         5 bytes per pixel
		3, // Y_UV12         3 bytes per 2 pixels
		3, // Y_UV12_420     3 bytes per 2 pixels
		3, // Y12            3 bytes per 2 pixels
		6, // RGB16          6 bytes per pixel
		6, // YUV16          6 bytes per pixel
		2, // Y_UV16         2 bytes per pixel
		2, // Y_UV16_420     2 bytes per pixel
		2,  // Y16            2 bytes per pixel
		0, // unused
		1, // Y_U_V8_420
		1,  // Y_U_V8
		4,   //Y_U_V10		4 bytes per 3 pixels
		3   //Y_U_V12		3 bytes per 2 pixels
		};

const int MEMORY2LIVE[] =
{
// Streaming video formats
		0,// RGB444
		1, // YUV444
		2, // YUV422
		3, // YUV420
		0, // unused
		5, // unused
		6, // unused
		0, // unused
		0, // unused
		0, // unused

		// Video in memory formats
		0,// RGBX8
		1, // YUVX8
		2, // YUYV8
		5, // RGBA8
		6, // YUVA8
		0, // RGBX10
		1, // YUVX10
		0, // unused
		2, // Y_UV8
		3, // Y_UV8_420
		0, // RGB8
		1, // YUV8
		2, // Y_UV10
		3, // Y_UV10_420
		1, // Y8
		1, // Y10
		5, // BGRA8
		0, // BGRX8
		2, // UYVY8
		0, // BGR8
		0, // RGBX12
		1, // YUVX12
		2, // Y_UV12
		3, // Y_UV12_420
		1, // Y12
		0, // RGB16
		1, // YUV16
		2, // Y_UV16
		3, // Y_UV16_420
		1,  // Y16
		0, //unused
		3,	//Y_U_V8_420
		1,  // Y_U_V8
		1,  // Y_U_V10
		1  // Y_U_V12
		};

typedef ap_uint<MAX_DATA_WIDTH> PIXEL_TYPE;
typedef hls::Scalar<NR_COMPONENTS, PIXEL_TYPE> YUV_PIXEL;
typedef hls::Scalar<NR_COMPONENTS * SAMPLES_PER_CLOCK, PIXEL_TYPE> YUV_MULTI_PIXEL;

typedef hls::stream<ap_axiu<BITS_PER_CLOCK, 1, 1, 1> > AXI_STREAM_IN;
typedef hls::stream<ap_axiu<BITS_PER_CLOCK, 1, 1, 1> > AXI_STREAM_OUT;

typedef hls::stream<YUV_MULTI_PIXEL> STREAM_MULTIPIX;

typedef ap_uint<AXIMM_DATA_WIDTH> *AXIMM;

typedef hls::stream<ap_uint<AXIMM_DATA_WIDTH> > STREAM_BYTES;
#define AXIMM_DATA_WIDTH8           (AXIMM_DATA_WIDTH/8)
typedef struct
{
	STREAM_BYTES plane0;
#if (MAX_NR_PLANES==2)
    STREAM_BYTES plane1;
#endif
#if (MAX_NR_PLANES==3)
    STREAM_BYTES plane1;
    STREAM_BYTES plane2;
#endif
} STREAM_PLANES;


#if IS_TILE_FORMAT
#define BLOCK_ROWS 4
#define BLOCK_COLUMNS 4
#define BROWS_PER_CLOCK (SAMPLES_PER_CLOCK/BLOCK_COLUMNS)
#define CLOCKS_PER_BLOCK ((BLOCK_ROWS * BLOCK_COLUMNS) / SAMPLES_PER_CLOCK)

typedef ap_uint<MAX_DATA_WIDTH * SAMPLES_PER_CLOCK> PLANE_MULTI_PIXEL_TYPE;

#if USE_URAM
typedef hls::LineBuffer<2, BLOCK_ROWS * (MAX_COLS / SAMPLES_PER_CLOCK), PLANE_MULTI_PIXEL_TYPE> MEM_LINE_BUFFER;
typedef hls::Scalar<NR_COMPONENTS * SAMPLES_PER_CLOCK, PIXEL_TYPE> YUV_ROW_MULTI_PIXEL;
#else

#if (SAMPLES_PER_CLOCK <=  BLOCK_COLUMNS)
	typedef hls::LineBuffer<2, BLOCK_ROWS * (MAX_COLS / SAMPLES_PER_CLOCK), PLANE_MULTI_PIXEL_TYPE> MEM_LINE_BUFFER;
#else
	typedef ap_uint<BLOCK_COLUMNS*MAX_DATA_WIDTH> PLANE_COL_PIXEL_TYPE;
	typedef hls::LineBuffer<2, BLOCK_ROWS * (MAX_COLS / BLOCK_COLUMNS), PLANE_COL_PIXEL_TYPE> MEM_LINE_BUFFER;	
#endif

#endif

#endif

//HW Registers
typedef struct
{
	U16 width;          //width in pixels
	U16 height;         //height in lines
	U16 stride;         //stride in bytes
	U16 video_format;
	AXIMM frm_buffer;
	AXIMM frm_buffer2;
	AXIMM frm_buffer3;
} HW_STRUCT_REG;

// top level function for HW synthesis
void v_frmbuf_wr(U16 width, U16 height, U16 stride, U16 video_format, AXIMM frm_buffer,
		AXIMM frm_buffer2, AXIMM frm_buffer3, AXI_STREAM_IN &s_axis_video
#if ENABLE_SYNC_SIGNALS
		, hls::ap_none<bool> &sync_eol, hls::ap_none<bool> &sync_eof
#endif
#if HAS_INTERLACED
					 ,
					 bool& HwReg_field_id,
					 bool field_id
#endif
		);

#endif
