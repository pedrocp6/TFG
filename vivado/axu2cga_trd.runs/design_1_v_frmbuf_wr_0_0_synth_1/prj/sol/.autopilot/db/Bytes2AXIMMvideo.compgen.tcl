# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 149 \
    name bytePlanes_plane0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bytePlanes_plane0 \
    op interface \
    ports { bytePlanes_plane0_dout { I 128 vector } bytePlanes_plane0_empty_n { I 1 bit } bytePlanes_plane0_read { O 1 bit } bytePlanes_plane0_num_data_valid { I 9 vector } bytePlanes_plane0_fifo_cap { I 9 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 150 \
    name bytePlanes_plane1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bytePlanes_plane1 \
    op interface \
    ports { bytePlanes_plane1_dout { I 128 vector } bytePlanes_plane1_empty_n { I 1 bit } bytePlanes_plane1_read { O 1 bit } bytePlanes_plane1_num_data_valid { I 9 vector } bytePlanes_plane1_fifo_cap { I 9 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 151 \
    name mm_video \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mm_video \
    op interface \
    ports { m_axi_mm_video_0_AWVALID { O 1 bit } m_axi_mm_video_0_AWREADY { I 1 bit } m_axi_mm_video_0_AWADDR { O 32 vector } m_axi_mm_video_0_AWID { O 1 vector } m_axi_mm_video_0_AWLEN { O 32 vector } m_axi_mm_video_0_AWSIZE { O 3 vector } m_axi_mm_video_0_AWBURST { O 2 vector } m_axi_mm_video_0_AWLOCK { O 2 vector } m_axi_mm_video_0_AWCACHE { O 4 vector } m_axi_mm_video_0_AWPROT { O 3 vector } m_axi_mm_video_0_AWQOS { O 4 vector } m_axi_mm_video_0_AWREGION { O 4 vector } m_axi_mm_video_0_AWUSER { O 1 vector } m_axi_mm_video_0_WVALID { O 1 bit } m_axi_mm_video_0_WREADY { I 1 bit } m_axi_mm_video_0_WDATA { O 128 vector } m_axi_mm_video_0_WSTRB { O 16 vector } m_axi_mm_video_0_WLAST { O 1 bit } m_axi_mm_video_0_WID { O 1 vector } m_axi_mm_video_0_WUSER { O 1 vector } m_axi_mm_video_0_ARVALID { O 1 bit } m_axi_mm_video_0_ARREADY { I 1 bit } m_axi_mm_video_0_ARADDR { O 32 vector } m_axi_mm_video_0_ARID { O 1 vector } m_axi_mm_video_0_ARLEN { O 32 vector } m_axi_mm_video_0_ARSIZE { O 3 vector } m_axi_mm_video_0_ARBURST { O 2 vector } m_axi_mm_video_0_ARLOCK { O 2 vector } m_axi_mm_video_0_ARCACHE { O 4 vector } m_axi_mm_video_0_ARPROT { O 3 vector } m_axi_mm_video_0_ARQOS { O 4 vector } m_axi_mm_video_0_ARREGION { O 4 vector } m_axi_mm_video_0_ARUSER { O 1 vector } m_axi_mm_video_0_RVALID { I 1 bit } m_axi_mm_video_0_RREADY { O 1 bit } m_axi_mm_video_0_RDATA { I 128 vector } m_axi_mm_video_0_RLAST { I 1 bit } m_axi_mm_video_0_RID { I 1 vector } m_axi_mm_video_0_RFIFONUM { I 9 vector } m_axi_mm_video_0_RUSER { I 1 vector } m_axi_mm_video_0_RRESP { I 2 vector } m_axi_mm_video_0_BVALID { I 1 bit } m_axi_mm_video_0_BREADY { O 1 bit } m_axi_mm_video_0_BRESP { I 2 vector } m_axi_mm_video_0_BID { I 1 vector } m_axi_mm_video_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 152 \
    name dstImg \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dstImg \
    op interface \
    ports { dstImg { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 153 \
    name dstImg2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dstImg2 \
    op interface \
    ports { dstImg2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 154 \
    name Height_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Height_val \
    op interface \
    ports { Height_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 155 \
    name WidthInBytes_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_WidthInBytes_val \
    op interface \
    ports { WidthInBytes_val { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 156 \
    name StrideInBytes_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_StrideInBytes_val \
    op interface \
    ports { StrideInBytes_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 157 \
    name VideoFormat_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_VideoFormat_val \
    op interface \
    ports { VideoFormat_val { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


