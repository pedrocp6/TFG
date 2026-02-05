# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_CTRL {
InVideoFormat { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
OutVideoFormat { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
width { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
height { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
ColStart { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
ColEnd { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 56
	offset_end 63
}
RowStart { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 64
	offset_end 71
}
RowEnd { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 72
	offset_end 79
}
K11 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 80
	offset_end 87
}
K12 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 88
	offset_end 95
}
K13 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 96
	offset_end 103
}
K21 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 104
	offset_end 111
}
K22 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 112
	offset_end 119
}
K23 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 120
	offset_end 127
}
K31 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 128
	offset_end 135
}
K32 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 136
	offset_end 143
}
K33 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 144
	offset_end 151
}
ROffset { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 152
	offset_end 159
}
GOffset { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 160
	offset_end 167
}
BOffset { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 168
	offset_end 175
}
ClampMin { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 176
	offset_end 183
}
ClipMax { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 184
	offset_end 191
}
K11_2 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 192
	offset_end 199
}
K12_2 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 200
	offset_end 207
}
K13_2 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 208
	offset_end 215
}
K21_2 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 216
	offset_end 223
}
K22_2 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 224
	offset_end 231
}
K23_2 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 232
	offset_end 239
}
K31_2 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 240
	offset_end 247
}
K32_2 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 248
	offset_end 255
}
K33_2 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 256
	offset_end 263
}
ROffset_2 { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 264
	offset_end 271
}
GOffset_2 { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 272
	offset_end 279
}
BOffset_2 { 
	dir I
	width 10
	depth 1
	mode ap_none
	offset 280
	offset_end 287
}
ClampMin_2 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 288
	offset_end 295
}
ClipMax_2 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 296
	offset_end 303
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict CTRL $port_CTRL


