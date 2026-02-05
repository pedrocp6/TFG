set clock_constraint { \
    name clk \
    module v_csc \
    port ap_clk \
    period 5 \
    uncertainty 1.35 \
}

set all_path {}

set false_path {}

set one_path { \
    name conx_path_0 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_InVideoFormat \
            bitWidth 8 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_0

set one_path { \
    name conx_path_1 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_OutVideoFormat \
            bitWidth 8 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_1

set one_path { \
    name conx_path_2 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_width \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_2

set one_path { \
    name conx_path_3 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_height \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_3

set one_path { \
    name conx_path_4 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_ColStart \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_4

set one_path { \
    name conx_path_5 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_ColEnd \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_5

set one_path { \
    name conx_path_6 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_RowStart \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_6

set one_path { \
    name conx_path_7 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_RowEnd \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_7

set one_path { \
    name conx_path_8 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K11 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_8

set one_path { \
    name conx_path_9 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K12 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_9

set one_path { \
    name conx_path_10 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K13 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_10

set one_path { \
    name conx_path_11 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K21 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_11

set one_path { \
    name conx_path_12 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K22 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_12

set one_path { \
    name conx_path_13 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K23 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_13

set one_path { \
    name conx_path_14 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K31 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_14

set one_path { \
    name conx_path_15 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K32 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_15

set one_path { \
    name conx_path_16 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K33 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_16

set one_path { \
    name conx_path_17 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_ROffset \
            bitWidth 10 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_17

set one_path { \
    name conx_path_18 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_GOffset \
            bitWidth 10 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_18

set one_path { \
    name conx_path_19 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_BOffset \
            bitWidth 10 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_19

set one_path { \
    name conx_path_20 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_ClampMin \
            bitWidth 8 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_20

set one_path { \
    name conx_path_21 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_ClipMax \
            bitWidth 8 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_21

set one_path { \
    name conx_path_22 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K11_2 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_22

set one_path { \
    name conx_path_23 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K12_2 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_23

set one_path { \
    name conx_path_24 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K13_2 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_24

set one_path { \
    name conx_path_25 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K21_2 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_25

set one_path { \
    name conx_path_26 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K22_2 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_26

set one_path { \
    name conx_path_27 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K23_2 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_27

set one_path { \
    name conx_path_28 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K31_2 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_28

set one_path { \
    name conx_path_29 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K32_2 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_29

set one_path { \
    name conx_path_30 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_K33_2 \
            bitWidth 16 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_30

set one_path { \
    name conx_path_31 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_ROffset_2 \
            bitWidth 10 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_31

set one_path { \
    name conx_path_32 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_GOffset_2 \
            bitWidth 10 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_32

set one_path { \
    name conx_path_33 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_BOffset_2 \
            bitWidth 10 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_33

set one_path { \
    name conx_path_34 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_ClampMin_2 \
            bitWidth 8 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_34

set one_path { \
    name conx_path_35 \
    type single_source \
    source { \
            module v_csc \
            instance CTRL_s_axi_U/int_ClipMax_2 \
            bitWidth 8 \
            type register \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_35

