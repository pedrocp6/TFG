set SynModuleInfo {
  {SRCNAME Block_entry_proc.1 MODELNAME Block_entry_proc_1 RTLNAME bd_d92b_csc_0_Block_entry_proc_1}
  {SRCNAME {reg<unsigned short>} MODELNAME reg_unsigned_short_s RTLNAME bd_d92b_csc_0_reg_unsigned_short_s}
  {SRCNAME AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start MODELNAME AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start RTLNAME bd_d92b_csc_0_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start
    SUBMODULES {
      {MODELNAME bd_d92b_csc_0_flow_control_loop_pipe_sequential_init RTLNAME bd_d92b_csc_0_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME bd_d92b_csc_0_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME AXIvideo2MultiPixStream_Pipeline_loop_width MODELNAME AXIvideo2MultiPixStream_Pipeline_loop_width RTLNAME bd_d92b_csc_0_AXIvideo2MultiPixStream_Pipeline_loop_width
    SUBMODULES {
      {MODELNAME bd_d92b_csc_0_sparsemux_5_8_8_1_1 RTLNAME bd_d92b_csc_0_sparsemux_5_8_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_realdef}
    }
  }
  {SRCNAME AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol MODELNAME AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol RTLNAME bd_d92b_csc_0_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol}
  {SRCNAME AXIvideo2MultiPixStream MODELNAME AXIvideo2MultiPixStream RTLNAME bd_d92b_csc_0_AXIvideo2MultiPixStream
    SUBMODULES {
      {MODELNAME bd_d92b_csc_0_regslice_both RTLNAME bd_d92b_csc_0_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
  {SRCNAME v_hcresampler_core_Pipeline_VITIS_LOOP_769_2 MODELNAME v_hcresampler_core_Pipeline_VITIS_LOOP_769_2 RTLNAME bd_d92b_csc_0_v_hcresampler_core_Pipeline_VITIS_LOOP_769_2}
  {SRCNAME v_hcresampler_core MODELNAME v_hcresampler_core RTLNAME bd_d92b_csc_0_v_hcresampler_core}
  {SRCNAME v_csc_core_Pipeline_VITIS_LOOP_136_2 MODELNAME v_csc_core_Pipeline_VITIS_LOOP_136_2 RTLNAME bd_d92b_csc_0_v_csc_core_Pipeline_VITIS_LOOP_136_2
    SUBMODULES {
      {MODELNAME bd_d92b_csc_0_mul_16s_8ns_24_1_1 RTLNAME bd_d92b_csc_0_mul_16s_8ns_24_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME bd_d92b_csc_0_mul_8ns_16s_24_1_1 RTLNAME bd_d92b_csc_0_mul_8ns_16s_24_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME bd_d92b_csc_0_mac_muladd_16s_8ns_22s_25_4_1 RTLNAME bd_d92b_csc_0_mac_muladd_16s_8ns_22s_25_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME bd_d92b_csc_0_mac_muladd_16s_8ns_12ns_24_4_1 RTLNAME bd_d92b_csc_0_mac_muladd_16s_8ns_12ns_24_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME v_csc_core MODELNAME v_csc_core RTLNAME bd_d92b_csc_0_v_csc_core}
  {SRCNAME v_hcresampler_core.1_Pipeline_VITIS_LOOP_769_2 MODELNAME v_hcresampler_core_1_Pipeline_VITIS_LOOP_769_2 RTLNAME bd_d92b_csc_0_v_hcresampler_core_1_Pipeline_VITIS_LOOP_769_2}
  {SRCNAME v_hcresampler_core.1 MODELNAME v_hcresampler_core_1 RTLNAME bd_d92b_csc_0_v_hcresampler_core_1}
  {SRCNAME MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_664_2 MODELNAME MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_664_2 RTLNAME bd_d92b_csc_0_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_664_2}
  {SRCNAME MultiPixStream2AXIvideo MODELNAME MultiPixStream2AXIvideo RTLNAME bd_d92b_csc_0_MultiPixStream2AXIvideo}
  {SRCNAME v_csc MODELNAME v_csc RTLNAME bd_d92b_csc_0_v_csc IS_TOP 1
    SUBMODULES {
      {MODELNAME bd_d92b_csc_0_fifo_w1_d2_S RTLNAME bd_d92b_csc_0_fifo_w1_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME cond_loc_channel_U}
      {MODELNAME bd_d92b_csc_0_fifo_w1_d4_S RTLNAME bd_d92b_csc_0_fifo_w1_d4_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME cond64_loc_channel_U}
      {MODELNAME bd_d92b_csc_0_fifo_w48_d16_S RTLNAME bd_d92b_csc_0_fifo_w48_d16_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME stream_in_U}
      {MODELNAME bd_d92b_csc_0_fifo_w48_d16_S RTLNAME bd_d92b_csc_0_fifo_w48_d16_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME stream_in_hresampled_U}
      {MODELNAME bd_d92b_csc_0_fifo_w48_d16_S RTLNAME bd_d92b_csc_0_fifo_w48_d16_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME stream_csc_U}
      {MODELNAME bd_d92b_csc_0_fifo_w48_d16_S RTLNAME bd_d92b_csc_0_fifo_w48_d16_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME stream_out_hresampled_U}
      {MODELNAME bd_d92b_csc_0_start_for_v_csc_core_U0 RTLNAME bd_d92b_csc_0_start_for_v_csc_core_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_v_csc_core_U0_U}
      {MODELNAME bd_d92b_csc_0_start_for_MultiPixStream2AXIvideo_U0 RTLNAME bd_d92b_csc_0_start_for_MultiPixStream2AXIvideo_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_MultiPixStream2AXIvideo_U0_U}
      {MODELNAME bd_d92b_csc_0_CTRL_s_axi RTLNAME bd_d92b_csc_0_CTRL_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
