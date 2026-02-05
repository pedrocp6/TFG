set SynModuleInfo {
  {SRCNAME {reg<unsigned short>} MODELNAME reg_unsigned_short_s RTLNAME design_1_v_frmbuf_wr_0_0_reg_unsigned_short_s}
  {SRCNAME AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start MODELNAME AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start RTLNAME design_1_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start
    SUBMODULES {
      {MODELNAME design_1_v_frmbuf_wr_0_0_flow_control_loop_pipe_sequential_init RTLNAME design_1_v_frmbuf_wr_0_0_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME design_1_v_frmbuf_wr_0_0_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME AXIvideo2MultiPixStream_Pipeline_loop_width MODELNAME AXIvideo2MultiPixStream_Pipeline_loop_width RTLNAME design_1_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream_Pipeline_loop_width
    SUBMODULES {
      {MODELNAME design_1_v_frmbuf_wr_0_0_sparsemux_5_8_8_1_1 RTLNAME design_1_v_frmbuf_wr_0_0_sparsemux_5_8_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_realdef}
    }
  }
  {SRCNAME AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol MODELNAME AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol RTLNAME design_1_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol}
  {SRCNAME AXIvideo2MultiPixStream MODELNAME AXIvideo2MultiPixStream RTLNAME design_1_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream}
  {SRCNAME MultiPixStream2Bytes_Pipeline_VITIS_LOOP_1090_11 MODELNAME MultiPixStream2Bytes_Pipeline_VITIS_LOOP_1090_11 RTLNAME design_1_v_frmbuf_wr_0_0_MultiPixStream2Bytes_Pipeline_VITIS_LOOP_1090_11}
  {SRCNAME MultiPixStream2Bytes_Pipeline_VITIS_LOOP_904_8 MODELNAME MultiPixStream2Bytes_Pipeline_VITIS_LOOP_904_8 RTLNAME design_1_v_frmbuf_wr_0_0_MultiPixStream2Bytes_Pipeline_VITIS_LOOP_904_8}
  {SRCNAME MultiPixStream2Bytes_Pipeline_VITIS_LOOP_863_5 MODELNAME MultiPixStream2Bytes_Pipeline_VITIS_LOOP_863_5 RTLNAME design_1_v_frmbuf_wr_0_0_MultiPixStream2Bytes_Pipeline_VITIS_LOOP_863_5}
  {SRCNAME MultiPixStream2Bytes_Pipeline_VITIS_LOOP_821_1 MODELNAME MultiPixStream2Bytes_Pipeline_VITIS_LOOP_821_1 RTLNAME design_1_v_frmbuf_wr_0_0_MultiPixStream2Bytes_Pipeline_VITIS_LOOP_821_1}
  {SRCNAME MultiPixStream2Bytes MODELNAME MultiPixStream2Bytes RTLNAME design_1_v_frmbuf_wr_0_0_MultiPixStream2Bytes
    SUBMODULES {
      {MODELNAME design_1_v_frmbuf_wr_0_0_mul_10ns_12ns_21_1_1 RTLNAME design_1_v_frmbuf_wr_0_0_mul_10ns_12ns_21_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Bytes2AXIMMvideo_Pipeline_VITIS_LOOP_1599_1 MODELNAME Bytes2AXIMMvideo_Pipeline_VITIS_LOOP_1599_1 RTLNAME design_1_v_frmbuf_wr_0_0_Bytes2AXIMMvideo_Pipeline_VITIS_LOOP_1599_1}
  {SRCNAME Bytes2AXIMMvideo_Pipeline_VITIS_LOOP_1609_2 MODELNAME Bytes2AXIMMvideo_Pipeline_VITIS_LOOP_1609_2 RTLNAME design_1_v_frmbuf_wr_0_0_Bytes2AXIMMvideo_Pipeline_VITIS_LOOP_1609_2}
  {SRCNAME Bytes2AXIMMvideo MODELNAME Bytes2AXIMMvideo RTLNAME design_1_v_frmbuf_wr_0_0_Bytes2AXIMMvideo}
  {SRCNAME FrmbufWrHlsDataFlow MODELNAME FrmbufWrHlsDataFlow RTLNAME design_1_v_frmbuf_wr_0_0_FrmbufWrHlsDataFlow
    SUBMODULES {
      {MODELNAME design_1_v_frmbuf_wr_0_0_fifo_w48_d2_S RTLNAME design_1_v_frmbuf_wr_0_0_fifo_w48_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME img_U}
      {MODELNAME design_1_v_frmbuf_wr_0_0_fifo_w128_d241_B RTLNAME design_1_v_frmbuf_wr_0_0_fifo_w128_d241_B BINDTYPE storage TYPE fifo IMPL bram ALLOW_PRAGMA 1 INSTNAME bytePlanes_plane0_U}
      {MODELNAME design_1_v_frmbuf_wr_0_0_fifo_w128_d241_B RTLNAME design_1_v_frmbuf_wr_0_0_fifo_w128_d241_B BINDTYPE storage TYPE fifo IMPL bram ALLOW_PRAGMA 1 INSTNAME bytePlanes_plane1_U}
      {MODELNAME design_1_v_frmbuf_wr_0_0_start_for_MultiPixStream2Bytes_U0 RTLNAME design_1_v_frmbuf_wr_0_0_start_for_MultiPixStream2Bytes_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_MultiPixStream2Bytes_U0_U}
      {MODELNAME design_1_v_frmbuf_wr_0_0_start_for_Bytes2AXIMMvideo_U0 RTLNAME design_1_v_frmbuf_wr_0_0_start_for_Bytes2AXIMMvideo_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Bytes2AXIMMvideo_U0_U}
    }
  }
  {SRCNAME v_frmbuf_wr MODELNAME v_frmbuf_wr RTLNAME design_1_v_frmbuf_wr_0_0_v_frmbuf_wr IS_TOP 1
    SUBMODULES {
      {MODELNAME design_1_v_frmbuf_wr_0_0_mul_14s_3ns_14_1_1 RTLNAME design_1_v_frmbuf_wr_0_0_mul_14s_3ns_14_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME design_1_v_frmbuf_wr_0_0_BYTES_PER_PIXEL_ROM_AUTO_1R RTLNAME design_1_v_frmbuf_wr_0_0_BYTES_PER_PIXEL_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME design_1_v_frmbuf_wr_0_0_MEMORY2LIVE_ROM_AUTO_1R RTLNAME design_1_v_frmbuf_wr_0_0_MEMORY2LIVE_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME design_1_v_frmbuf_wr_0_0_mm_video_m_axi RTLNAME design_1_v_frmbuf_wr_0_0_mm_video_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME design_1_v_frmbuf_wr_0_0_CTRL_s_axi RTLNAME design_1_v_frmbuf_wr_0_0_CTRL_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME design_1_v_frmbuf_wr_0_0_regslice_both RTLNAME design_1_v_frmbuf_wr_0_0_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
