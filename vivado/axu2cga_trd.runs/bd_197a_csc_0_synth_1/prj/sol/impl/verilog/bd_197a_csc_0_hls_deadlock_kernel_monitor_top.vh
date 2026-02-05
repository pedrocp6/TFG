
wire kernel_monitor_reset;
wire kernel_monitor_clock;
wire kernel_monitor_report;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
assign kernel_monitor_report = 1'b0;
wire [3:0] axis_block_sigs;
wire [12:0] inst_idle_sigs;
wire [5:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~AXIvideo2MultiPixStream_U0.grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_150.s_axis_video_TDATA_blk_n;
assign axis_block_sigs[1] = ~AXIvideo2MultiPixStream_U0.grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_170.s_axis_video_TDATA_blk_n;
assign axis_block_sigs[2] = ~AXIvideo2MultiPixStream_U0.grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_199.s_axis_video_TDATA_blk_n;
assign axis_block_sigs[3] = ~MultiPixStream2AXIvideo_U0.grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_664_2_fu_116.m_axis_video_TDATA_blk_n;

assign inst_idle_sigs[0] = Block_entry_proc_1_U0.ap_idle;
assign inst_block_sigs[0] = (Block_entry_proc_1_U0.ap_done & ~Block_entry_proc_1_U0.ap_continue);
assign inst_idle_sigs[1] = AXIvideo2MultiPixStream_U0.ap_idle;
assign inst_block_sigs[1] = (AXIvideo2MultiPixStream_U0.ap_done & ~AXIvideo2MultiPixStream_U0.ap_continue) | ~AXIvideo2MultiPixStream_U0.grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_170.stream_in_blk_n;
assign inst_idle_sigs[2] = v_hcresampler_core_U0.ap_idle;
assign inst_block_sigs[2] = (v_hcresampler_core_U0.ap_done & ~v_hcresampler_core_U0.ap_continue) | ~v_hcresampler_core_U0.grp_v_hcresampler_core_Pipeline_VITIS_LOOP_769_2_fu_184.stream_in_blk_n | ~v_hcresampler_core_U0.grp_v_hcresampler_core_Pipeline_VITIS_LOOP_769_2_fu_184.stream_in_hresampled_blk_n;
assign inst_idle_sigs[3] = v_csc_core_U0.ap_idle;
assign inst_block_sigs[3] = (v_csc_core_U0.ap_done & ~v_csc_core_U0.ap_continue) | ~v_csc_core_U0.grp_v_csc_core_Pipeline_VITIS_LOOP_136_2_fu_326.stream_in_hresampled_blk_n | ~v_csc_core_U0.grp_v_csc_core_Pipeline_VITIS_LOOP_136_2_fu_326.stream_csc_blk_n;
assign inst_idle_sigs[4] = v_hcresampler_core_1_U0.ap_idle;
assign inst_block_sigs[4] = (v_hcresampler_core_1_U0.ap_done & ~v_hcresampler_core_1_U0.ap_continue) | ~v_hcresampler_core_1_U0.grp_v_hcresampler_core_1_Pipeline_VITIS_LOOP_769_2_fu_190.stream_csc_blk_n | ~v_hcresampler_core_1_U0.grp_v_hcresampler_core_1_Pipeline_VITIS_LOOP_769_2_fu_190.stream_out_hresampled_blk_n;
assign inst_idle_sigs[5] = MultiPixStream2AXIvideo_U0.ap_idle;
assign inst_block_sigs[5] = (MultiPixStream2AXIvideo_U0.ap_done & ~MultiPixStream2AXIvideo_U0.ap_continue) | ~MultiPixStream2AXIvideo_U0.grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_664_2_fu_116.stream_out_hresampled_blk_n;

assign inst_idle_sigs[6] = 1'b0;
assign inst_idle_sigs[7] = AXIvideo2MultiPixStream_U0.ap_idle;
assign inst_idle_sigs[8] = AXIvideo2MultiPixStream_U0.grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_150.ap_idle;
assign inst_idle_sigs[9] = AXIvideo2MultiPixStream_U0.grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_170.ap_idle;
assign inst_idle_sigs[10] = AXIvideo2MultiPixStream_U0.grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_199.ap_idle;
assign inst_idle_sigs[11] = MultiPixStream2AXIvideo_U0.ap_idle;
assign inst_idle_sigs[12] = MultiPixStream2AXIvideo_U0.grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_664_2_fu_116.ap_idle;

bd_197a_csc_0_hls_deadlock_idx0_monitor bd_197a_csc_0_hls_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);


always @ (kernel_block or kernel_monitor_reset) begin
    if (kernel_block == 1'b1 && kernel_monitor_reset == 1'b0) begin
        find_kernel_block = 1'b1;
    end
    else begin
        find_kernel_block = 1'b0;
    end
end
