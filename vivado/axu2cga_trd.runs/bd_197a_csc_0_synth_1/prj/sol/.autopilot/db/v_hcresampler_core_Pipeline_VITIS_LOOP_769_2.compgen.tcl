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
    id 58 \
    name pixbuf_y_18 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_18 \
    op interface \
    ports { pixbuf_y_18 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 59 \
    name pixbuf_y_17 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_17 \
    op interface \
    ports { pixbuf_y_17 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 60 \
    name pixbuf_y_16 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_16 \
    op interface \
    ports { pixbuf_y_16 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 61 \
    name pixbuf_y_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_15 \
    op interface \
    ports { pixbuf_y_15 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 62 \
    name mpix_cr \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mpix_cr \
    op interface \
    ports { mpix_cr { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 63 \
    name mpix_cb \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mpix_cb \
    op interface \
    ports { mpix_cb { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 64 \
    name storemerge_lcssa850_i \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_storemerge_lcssa850_i \
    op interface \
    ports { storemerge_lcssa850_i { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 65 \
    name p_0_0_0_0_0509_1_3788_lcssa847_i \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_0_0_0_0_0509_1_3788_lcssa847_i \
    op interface \
    ports { p_0_0_0_0_0509_1_3788_lcssa847_i { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 66 \
    name p_0_3_0_0_0760_lcssa821_i \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_0_3_0_0_0760_lcssa821_i \
    op interface \
    ports { p_0_3_0_0_0760_lcssa821_i { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 67 \
    name p_0_0_0_0_0517758_lcssa818_i \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_0_0_0_0_0517758_lcssa818_i \
    op interface \
    ports { p_0_0_0_0_0517758_lcssa818_i { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 68 \
    name loopWidth \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_loopWidth \
    op interface \
    ports { loopWidth { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 69 \
    name stream_in_hresampled \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_stream_in_hresampled \
    op interface \
    ports { stream_in_hresampled_din { O 48 vector } stream_in_hresampled_full_n { I 1 bit } stream_in_hresampled_write { O 1 bit } stream_in_hresampled_num_data_valid { I 32 vector } stream_in_hresampled_fifo_cap { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 70 \
    name p_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read \
    op interface \
    ports { p_read { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 71 \
    name select_ln765 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_select_ln765 \
    op interface \
    ports { select_ln765 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 72 \
    name lshr_ln \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_lshr_ln \
    op interface \
    ports { lshr_ln { I 15 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 73 \
    name stream_in \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stream_in \
    op interface \
    ports { stream_in_dout { I 48 vector } stream_in_empty_n { I 1 bit } stream_in_read { O 1 bit } stream_in_num_data_valid { I 5 vector } stream_in_fifo_cap { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 74 \
    name pixbuf_y_24_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_24_out \
    op interface \
    ports { pixbuf_y_24_out { O 8 vector } pixbuf_y_24_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 75 \
    name pixbuf_y_23_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_23_out \
    op interface \
    ports { pixbuf_y_23_out { O 8 vector } pixbuf_y_23_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 76 \
    name pixbuf_y_22_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_22_out \
    op interface \
    ports { pixbuf_y_22_out { O 8 vector } pixbuf_y_22_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 77 \
    name pixbuf_y_21_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_21_out \
    op interface \
    ports { pixbuf_y_21_out { O 8 vector } pixbuf_y_21_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 78 \
    name pixbuf_y_20_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_20_out \
    op interface \
    ports { pixbuf_y_20_out_i { I 8 vector } pixbuf_y_20_out_o { O 8 vector } pixbuf_y_20_out_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 79 \
    name pixbuf_y_19_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_19_out \
    op interface \
    ports { pixbuf_y_19_out_i { I 8 vector } pixbuf_y_19_out_o { O 8 vector } pixbuf_y_19_out_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 80 \
    name mpix_cr_8_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mpix_cr_8_out \
    op interface \
    ports { mpix_cr_8_out { O 8 vector } mpix_cr_8_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 81 \
    name mpix_cb_8_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mpix_cb_8_out \
    op interface \
    ports { mpix_cb_8_out { O 8 vector } mpix_cb_8_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 82 \
    name p_0_0_0_0_0_3782_i_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_p_0_0_0_0_0_3782_i_out \
    op interface \
    ports { p_0_0_0_0_0_3782_i_out_i { I 8 vector } p_0_0_0_0_0_3782_i_out_o { O 8 vector } p_0_0_0_0_0_3782_i_out_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 83 \
    name p_0_0_0_0_0509_3778_i_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_p_0_0_0_0_0509_3778_i_out \
    op interface \
    ports { p_0_0_0_0_0509_3778_i_out_i { I 8 vector } p_0_0_0_0_0509_3778_i_out_o { O 8 vector } p_0_0_0_0_0509_3778_i_out_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 84 \
    name p_0_0_0_0_0_2774_i_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_p_0_0_0_0_0_2774_i_out \
    op interface \
    ports { p_0_0_0_0_0_2774_i_out_i { I 8 vector } p_0_0_0_0_0_2774_i_out_o { O 8 vector } p_0_0_0_0_0_2774_i_out_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 85 \
    name p_0_0_0_0_0509_2770_i_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_p_0_0_0_0_0509_2770_i_out \
    op interface \
    ports { p_0_0_0_0_0509_2770_i_out_i { I 8 vector } p_0_0_0_0_0509_2770_i_out_o { O 8 vector } p_0_0_0_0_0509_2770_i_out_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 86 \
    name inpix_0_5_0_0_0_load755_i_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_inpix_0_5_0_0_0_load755_i_out \
    op interface \
    ports { inpix_0_5_0_0_0_load755_i_out_i { I 8 vector } inpix_0_5_0_0_0_load755_i_out_o { O 8 vector } inpix_0_5_0_0_0_load755_i_out_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 87 \
    name inpix_0_4_0_0_0_load753_i_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_inpix_0_4_0_0_0_load753_i_out \
    op interface \
    ports { inpix_0_4_0_0_0_load753_i_out_i { I 8 vector } inpix_0_4_0_0_0_load753_i_out_o { O 8 vector } inpix_0_4_0_0_0_load753_i_out_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 88 \
    name inpix_0_3_0_0_0_load751_i_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_inpix_0_3_0_0_0_load751_i_out \
    op interface \
    ports { inpix_0_3_0_0_0_load751_i_out_i { I 8 vector } inpix_0_3_0_0_0_load751_i_out_o { O 8 vector } inpix_0_3_0_0_0_load751_i_out_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 89 \
    name inpix_0_2_0_0_0_load749_i_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_inpix_0_2_0_0_0_load749_i_out \
    op interface \
    ports { inpix_0_2_0_0_0_load749_i_out_i { I 8 vector } inpix_0_2_0_0_0_load749_i_out_o { O 8 vector } inpix_0_2_0_0_0_load749_i_out_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 90 \
    name inpix_0_1_0_0_0_load747_i_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_inpix_0_1_0_0_0_load747_i_out \
    op interface \
    ports { inpix_0_1_0_0_0_load747_i_out_i { I 8 vector } inpix_0_1_0_0_0_load747_i_out_o { O 8 vector } inpix_0_1_0_0_0_load747_i_out_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 91 \
    name inpix_0_0_0_0_0_load745_i_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_inpix_0_0_0_0_0_load745_i_out \
    op interface \
    ports { inpix_0_0_0_0_0_load745_i_out_i { I 8 vector } inpix_0_0_0_0_0_load745_i_out_o { O 8 vector } inpix_0_0_0_0_0_load745_i_out_o_ap_vld { O 1 bit } } \
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
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
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


# flow_control definition:
set InstName bd_197a_csc_0_flow_control_loop_pipe_sequential_init_U
set CompName bd_197a_csc_0_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix bd_197a_csc_0_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


