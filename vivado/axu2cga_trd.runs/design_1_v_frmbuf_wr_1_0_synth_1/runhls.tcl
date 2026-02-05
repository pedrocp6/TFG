::common::set_param hls.enable_ippack_subcore_use_xci_files false -quiet
open_project -reset prj
set_top v_frmbuf_wr
open_solution sol
set_part {xczu2cg-sfvc784-1-e}
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/v_frmbuf_wr_config.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/v_frmbuf_wr.cpp
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/v_frmbuf_wr.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls_video.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls_opencv.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls/hls_axi_io.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls/hls_video_arithm.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls/hls_video_core.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls/hls_video_fast.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls/hls_video_haar.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls/hls_video_harris.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls/hls_video_histogram.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls/hls_video_hough.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls/hls_video_imgbase.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls/hls_video_imgproc.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls/hls_video_io.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls/hls_video_mem.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls/hls_video_stereobm.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls/hls_video_types.h
add_files -cflags " -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls -I c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src " c:/TFG_Vivado/vivado/axu2cga_trd.gen/sources_1/bd/design_1/ip/design_1_v_frmbuf_wr_1_0/src/hls/hls_video_undistort.h

create_clock -period 5 -name ap_clk


#config_rtl -enable_maxiConservative -enable_axiFlushable
config_interface -m_axi_flush_mode
config_interface -m_axi_conservative_mode 

#config_interface -input_reg_mode both -output_reg_mode both
config_interface -m_axi_addr64=false




config_rtl -module_prefix design_1_v_frmbuf_wr_1_0_
config_export -vendor xilinx.com -library ip -version 3.0
csynth_design
export_design -format ip_catalog
exit
