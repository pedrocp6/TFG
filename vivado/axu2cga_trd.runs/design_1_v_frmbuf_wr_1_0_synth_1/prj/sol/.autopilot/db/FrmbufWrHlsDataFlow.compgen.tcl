# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler design_1_v_frmbuf_wr_1_0_fifo_w48_d2_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {img_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler design_1_v_frmbuf_wr_1_0_fifo_w128_d241_B BINDTYPE {storage} TYPE {fifo} IMPL {bram} ALLOW_PRAGMA 1 INSTNAME {bytePlanes_plane0_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler design_1_v_frmbuf_wr_1_0_fifo_w128_d241_B BINDTYPE {storage} TYPE {fifo} IMPL {bram} ALLOW_PRAGMA 1 INSTNAME {bytePlanes_plane1_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler design_1_v_frmbuf_wr_1_0_start_for_MultiPixStream2Bytes_U0 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {start_for_MultiPixStream2Bytes_U0_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler design_1_v_frmbuf_wr_1_0_start_for_Bytes2AXIMMvideo_U0 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {start_for_Bytes2AXIMMvideo_U0_U}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 163 \
    name s_axis_video_V_data_V \
    reset_level 1 \
    sync_rst true \
    corename {s_axis_video} \
    metadata {  } \
    op interface \
    ports { s_axis_video_TDATA { I 48 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_video_V_data_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 164 \
    name s_axis_video_V_keep_V \
    reset_level 1 \
    sync_rst true \
    corename {s_axis_video} \
    metadata {  } \
    op interface \
    ports { s_axis_video_TKEEP { I 6 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_video_V_keep_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 165 \
    name s_axis_video_V_strb_V \
    reset_level 1 \
    sync_rst true \
    corename {s_axis_video} \
    metadata {  } \
    op interface \
    ports { s_axis_video_TSTRB { I 6 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_video_V_strb_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 166 \
    name s_axis_video_V_user_V \
    reset_level 1 \
    sync_rst true \
    corename {s_axis_video} \
    metadata {  } \
    op interface \
    ports { s_axis_video_TUSER { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_video_V_user_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 167 \
    name s_axis_video_V_last_V \
    reset_level 1 \
    sync_rst true \
    corename {s_axis_video} \
    metadata {  } \
    op interface \
    ports { s_axis_video_TLAST { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_video_V_last_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 168 \
    name s_axis_video_V_id_V \
    reset_level 1 \
    sync_rst true \
    corename {s_axis_video} \
    metadata {  } \
    op interface \
    ports { s_axis_video_TID { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_video_V_id_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 169 \
    name s_axis_video_V_dest_V \
    reset_level 1 \
    sync_rst true \
    corename {s_axis_video} \
    metadata {  } \
    op interface \
    ports { s_axis_video_TDEST { I 1 vector } s_axis_video_TVALID { I 1 bit } s_axis_video_TREADY { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_video_V_dest_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 170 \
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
    id 171 \
    name HwReg_frm_buffer \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_HwReg_frm_buffer \
    op interface \
    ports { HwReg_frm_buffer { I 32 vector } HwReg_frm_buffer_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 172 \
    name HwReg_frm_buffer2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_HwReg_frm_buffer2 \
    op interface \
    ports { HwReg_frm_buffer2 { I 32 vector } HwReg_frm_buffer2_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 173 \
    name WidthInBytes_val2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_WidthInBytes_val2 \
    op interface \
    ports { WidthInBytes_val2 { I 14 vector } WidthInBytes_val2_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 174 \
    name colorFormat_val3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_colorFormat_val3 \
    op interface \
    ports { colorFormat_val3 { I 3 vector } colorFormat_val3_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 175 \
    name width_val5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_width_val5 \
    op interface \
    ports { width_val5 { I 11 vector } width_val5_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 176 \
    name height_val8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_height_val8 \
    op interface \
    ports { height_val8 { I 11 vector } height_val8_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 177 \
    name stride_val9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stride_val9 \
    op interface \
    ports { stride_val9 { I 16 vector } stride_val9_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 178 \
    name video_format_val11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_video_format_val11 \
    op interface \
    ports { video_format_val11 { I 6 vector } video_format_val11_ap_vld { I 1 bit } } \
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


