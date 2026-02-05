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
    id 155 \
    name height \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_height \
    op interface \
    ports { height { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 156 \
    name width \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_width \
    op interface \
    ports { width { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 157 \
    name ColStart \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ColStart \
    op interface \
    ports { ColStart { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 158 \
    name ColEnd \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ColEnd \
    op interface \
    ports { ColEnd { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 159 \
    name RowStart \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_RowStart \
    op interface \
    ports { RowStart { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 160 \
    name RowEnd \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_RowEnd \
    op interface \
    ports { RowEnd { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 161 \
    name K11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K11 \
    op interface \
    ports { K11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 162 \
    name K12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K12 \
    op interface \
    ports { K12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 163 \
    name K13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K13 \
    op interface \
    ports { K13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 164 \
    name K21 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K21 \
    op interface \
    ports { K21 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 165 \
    name K22 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K22 \
    op interface \
    ports { K22 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 166 \
    name K23 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K23 \
    op interface \
    ports { K23 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 167 \
    name K31 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K31 \
    op interface \
    ports { K31 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 168 \
    name K32 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K32 \
    op interface \
    ports { K32 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 169 \
    name K33 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K33 \
    op interface \
    ports { K33 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 170 \
    name ROffset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ROffset \
    op interface \
    ports { ROffset { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 171 \
    name GOffset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_GOffset \
    op interface \
    ports { GOffset { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 172 \
    name BOffset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_BOffset \
    op interface \
    ports { BOffset { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 173 \
    name ClampMin \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ClampMin \
    op interface \
    ports { ClampMin { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 174 \
    name ClipMax \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ClipMax \
    op interface \
    ports { ClipMax { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 175 \
    name K11_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K11_2 \
    op interface \
    ports { K11_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 176 \
    name K12_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K12_2 \
    op interface \
    ports { K12_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 177 \
    name K13_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K13_2 \
    op interface \
    ports { K13_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 178 \
    name K21_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K21_2 \
    op interface \
    ports { K21_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 179 \
    name K22_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K22_2 \
    op interface \
    ports { K22_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 180 \
    name K23_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K23_2 \
    op interface \
    ports { K23_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 181 \
    name K31_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K31_2 \
    op interface \
    ports { K31_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 182 \
    name K32_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K32_2 \
    op interface \
    ports { K32_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 183 \
    name K33_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K33_2 \
    op interface \
    ports { K33_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 184 \
    name ROffset_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ROffset_2 \
    op interface \
    ports { ROffset_2 { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 185 \
    name GOffset_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_GOffset_2 \
    op interface \
    ports { GOffset_2 { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 186 \
    name BOffset_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_BOffset_2 \
    op interface \
    ports { BOffset_2 { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 187 \
    name ClampMin_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ClampMin_2 \
    op interface \
    ports { ClampMin_2 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 188 \
    name ClipMax_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ClipMax_2 \
    op interface \
    ports { ClipMax_2 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 189 \
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
    id 190 \
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


