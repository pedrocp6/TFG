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
    id 191 \
    name pixbuf_y_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_5 \
    op interface \
    ports { pixbuf_y_5 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 192 \
    name pixbuf_y_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_4 \
    op interface \
    ports { pixbuf_y_4 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 193 \
    name pixbuf_y_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_3 \
    op interface \
    ports { pixbuf_y_3 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 194 \
    name pixbuf_y_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_2 \
    op interface \
    ports { pixbuf_y_2 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 195 \
    name mpix_cr_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mpix_cr_1 \
    op interface \
    ports { mpix_cr_1 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 196 \
    name mpix_cb_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mpix_cb_1 \
    op interface \
    ports { mpix_cb_1 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 197 \
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
    id 198 \
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
    id 199 \
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
    id 200 \
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
    id 201 \
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
    id 202 \
    name stream_out_hresampled \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_stream_out_hresampled \
    op interface \
    ports { stream_out_hresampled_din { O 48 vector } stream_out_hresampled_full_n { I 1 bit } stream_out_hresampled_write { O 1 bit } stream_out_hresampled_num_data_valid { I 32 vector } stream_out_hresampled_fifo_cap { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 203 \
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
    id 204 \
    name zext_ln730 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln730 \
    op interface \
    ports { zext_ln730 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 205 \
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
    id 206 \
    name stream_csc \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stream_csc \
    op interface \
    ports { stream_csc_dout { I 48 vector } stream_csc_empty_n { I 1 bit } stream_csc_read { O 1 bit } stream_csc_num_data_valid { I 5 vector } stream_csc_fifo_cap { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 207 \
    name pixbuf_y_11_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_11_out \
    op interface \
    ports { pixbuf_y_11_out { O 8 vector } pixbuf_y_11_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 208 \
    name pixbuf_y_10_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_10_out \
    op interface \
    ports { pixbuf_y_10_out { O 8 vector } pixbuf_y_10_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 209 \
    name pixbuf_y_9_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_9_out \
    op interface \
    ports { pixbuf_y_9_out { O 8 vector } pixbuf_y_9_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 210 \
    name pixbuf_y_8_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_8_out \
    op interface \
    ports { pixbuf_y_8_out { O 8 vector } pixbuf_y_8_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 211 \
    name pixbuf_y_7_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_7_out \
    op interface \
    ports { pixbuf_y_7_out_i { I 8 vector } pixbuf_y_7_out_o { O 8 vector } pixbuf_y_7_out_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 212 \
    name pixbuf_y_6_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_pixbuf_y_6_out \
    op interface \
    ports { pixbuf_y_6_out_i { I 8 vector } pixbuf_y_6_out_o { O 8 vector } pixbuf_y_6_out_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 213 \
    name mpix_cr_3_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mpix_cr_3_out \
    op interface \
    ports { mpix_cr_3_out { O 8 vector } mpix_cr_3_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 214 \
    name mpix_cr_2_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_mpix_cr_2_out \
    op interface \
    ports { mpix_cr_2_out_i { I 8 vector } mpix_cr_2_out_o { O 8 vector } mpix_cr_2_out_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 215 \
    name mpix_cb_3_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mpix_cb_3_out \
    op interface \
    ports { mpix_cb_3_out { O 8 vector } mpix_cb_3_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 216 \
    name mpix_cb_2_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_mpix_cb_2_out \
    op interface \
    ports { mpix_cb_2_out_i { I 8 vector } mpix_cb_2_out_o { O 8 vector } mpix_cb_2_out_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 217 \
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
    id 218 \
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
    id 219 \
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
    id 220 \
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
    id 221 \
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
    id 222 \
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
    id 223 \
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
    id 224 \
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
    id 225 \
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
    id 226 \
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
set InstName bd_d92b_csc_0_flow_control_loop_pipe_sequential_init_U
set CompName bd_d92b_csc_0_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix bd_d92b_csc_0_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


