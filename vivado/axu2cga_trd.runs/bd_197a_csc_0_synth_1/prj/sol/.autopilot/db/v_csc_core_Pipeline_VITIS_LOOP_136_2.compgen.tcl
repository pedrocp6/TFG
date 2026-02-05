# This script segment is generated automatically by AutoPilot

set name bd_197a_csc_0_mul_16s_8ns_24_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name bd_197a_csc_0_mul_8ns_16s_24_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler bd_197a_csc_0_mac_muladd_16s_8ns_22s_25_4_1 BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler bd_197a_csc_0_mac_muladd_16s_8ns_12ns_24_4_1 BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 119 \
    name add_ln134 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_add_ln134 \
    op interface \
    ports { add_ln134 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 120 \
    name stream_in_hresampled \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stream_in_hresampled \
    op interface \
    ports { stream_in_hresampled_dout { I 48 vector } stream_in_hresampled_empty_n { I 1 bit } stream_in_hresampled_read { O 1 bit } stream_in_hresampled_num_data_valid { I 5 vector } stream_in_hresampled_fifo_cap { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 121 \
    name loopStart \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_loopStart \
    op interface \
    ports { loopStart { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 122 \
    name loopEnd \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_loopEnd \
    op interface \
    ports { loopEnd { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 123 \
    name xor_ln148_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_xor_ln148_1 \
    op interface \
    ports { xor_ln148_1 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 124 \
    name or_ln147 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_or_ln147 \
    op interface \
    ports { or_ln147 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 125 \
    name coef11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coef11 \
    op interface \
    ports { coef11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 126 \
    name K11_2_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K11_2_load \
    op interface \
    ports { K11_2_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 127 \
    name coef12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coef12 \
    op interface \
    ports { coef12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 128 \
    name K12_2_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K12_2_load \
    op interface \
    ports { K12_2_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 129 \
    name coef13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coef13 \
    op interface \
    ports { coef13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 130 \
    name K13_2_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K13_2_load \
    op interface \
    ports { K13_2_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 131 \
    name coef21 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coef21 \
    op interface \
    ports { coef21 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 132 \
    name K21_2_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K21_2_load \
    op interface \
    ports { K21_2_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 133 \
    name coef22 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coef22 \
    op interface \
    ports { coef22 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 134 \
    name K22_2_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K22_2_load \
    op interface \
    ports { K22_2_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 135 \
    name coef23 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coef23 \
    op interface \
    ports { coef23 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 136 \
    name K23_2_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K23_2_load \
    op interface \
    ports { K23_2_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 137 \
    name coef31 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coef31 \
    op interface \
    ports { coef31 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 138 \
    name K31_2_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K31_2_load \
    op interface \
    ports { K31_2_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 139 \
    name coef32 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coef32 \
    op interface \
    ports { coef32 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 140 \
    name K32_2_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K32_2_load \
    op interface \
    ports { K32_2_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 141 \
    name coef33 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coef33 \
    op interface \
    ports { coef33 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 142 \
    name K33_2_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K33_2_load \
    op interface \
    ports { K33_2_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 143 \
    name offsetR \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_offsetR \
    op interface \
    ports { offsetR { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 144 \
    name shl_ln \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_shl_ln \
    op interface \
    ports { shl_ln { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 145 \
    name offsetG \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_offsetG \
    op interface \
    ports { offsetG { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 146 \
    name shl_ln2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_shl_ln2 \
    op interface \
    ports { shl_ln2 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 147 \
    name offsetB \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_offsetB \
    op interface \
    ports { offsetB { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 148 \
    name shl_ln3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_shl_ln3 \
    op interface \
    ports { shl_ln3 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 149 \
    name max_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_max_val \
    op interface \
    ports { max_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 150 \
    name ClipMax_2_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ClipMax_2_load \
    op interface \
    ports { ClipMax_2_load { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 151 \
    name min_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_min_val \
    op interface \
    ports { min_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 152 \
    name ClampMin_2_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ClampMin_2_load \
    op interface \
    ports { ClampMin_2_load { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 153 \
    name empty \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty \
    op interface \
    ports { empty { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 154 \
    name stream_csc \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_stream_csc \
    op interface \
    ports { stream_csc_din { O 48 vector } stream_csc_full_n { I 1 bit } stream_csc_write { O 1 bit } stream_csc_num_data_valid { I 32 vector } stream_csc_fifo_cap { I 32 vector } } \
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


