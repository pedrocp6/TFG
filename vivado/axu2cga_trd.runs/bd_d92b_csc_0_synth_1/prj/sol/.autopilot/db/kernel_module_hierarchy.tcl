set ModuleHierarchy {[{
"Name" : "v_csc", "RefName" : "v_csc","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "AXIvideo2MultiPixStream_U0", "RefName" : "AXIvideo2MultiPixStream","ID" : "1","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_150", "RefName" : "AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "loop_wait_for_start","RefName" : "loop_wait_for_start","ID" : "3","Type" : "pipeline"},]},
		{"Name" : "grp_reg_unsigned_short_s_fu_233", "RefName" : "reg_unsigned_short_s","ID" : "4","Type" : "pipeline"},
		{"Name" : "grp_reg_unsigned_short_s_fu_239", "RefName" : "reg_unsigned_short_s","ID" : "5","Type" : "pipeline"},],
		"SubLoops" : [
		{"Name" : "loop_height","RefName" : "loop_height","ID" : "6","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_170", "RefName" : "AXIvideo2MultiPixStream_Pipeline_loop_width","ID" : "7","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "loop_width","RefName" : "loop_width","ID" : "8","Type" : "pipeline"},]},
		{"Name" : "grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_199", "RefName" : "AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol","ID" : "9","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "loop_wait_for_eol","RefName" : "loop_wait_for_eol","ID" : "10","Type" : "pipeline"},]},]},]},
	{"Name" : "Block_entry_proc_1_U0", "RefName" : "Block_entry_proc_1","ID" : "11","Type" : "sequential"},
	{"Name" : "v_hcresampler_core_U0", "RefName" : "v_hcresampler_core","ID" : "12","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_767_1","RefName" : "VITIS_LOOP_767_1","ID" : "13","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_v_hcresampler_core_Pipeline_VITIS_LOOP_769_2_fu_184", "RefName" : "v_hcresampler_core_Pipeline_VITIS_LOOP_769_2","ID" : "14","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_769_2","RefName" : "VITIS_LOOP_769_2","ID" : "15","Type" : "pipeline"},]},]},]},
	{"Name" : "v_csc_core_U0", "RefName" : "v_csc_core","ID" : "16","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_134_1","RefName" : "VITIS_LOOP_134_1","ID" : "17","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_v_csc_core_Pipeline_VITIS_LOOP_136_2_fu_326", "RefName" : "v_csc_core_Pipeline_VITIS_LOOP_136_2","ID" : "18","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_136_2","RefName" : "VITIS_LOOP_136_2","ID" : "19","Type" : "pipeline"},]},]},]},
	{"Name" : "v_hcresampler_core_1_U0", "RefName" : "v_hcresampler_core_1","ID" : "20","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_767_1","RefName" : "VITIS_LOOP_767_1","ID" : "21","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_v_hcresampler_core_1_Pipeline_VITIS_LOOP_769_2_fu_190", "RefName" : "v_hcresampler_core_1_Pipeline_VITIS_LOOP_769_2","ID" : "22","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_769_2","RefName" : "VITIS_LOOP_769_2","ID" : "23","Type" : "pipeline"},]},]},]},
	{"Name" : "MultiPixStream2AXIvideo_U0", "RefName" : "MultiPixStream2AXIvideo","ID" : "24","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_reg_unsigned_short_s_fu_149", "RefName" : "reg_unsigned_short_s","ID" : "25","Type" : "pipeline"},
		{"Name" : "grp_reg_unsigned_short_s_fu_155", "RefName" : "reg_unsigned_short_s","ID" : "26","Type" : "pipeline"},],
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_662_1","RefName" : "VITIS_LOOP_662_1","ID" : "27","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_664_2_fu_116", "RefName" : "MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_664_2","ID" : "28","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_664_2","RefName" : "VITIS_LOOP_664_2","ID" : "29","Type" : "pipeline"},]},]},]},]
}]}