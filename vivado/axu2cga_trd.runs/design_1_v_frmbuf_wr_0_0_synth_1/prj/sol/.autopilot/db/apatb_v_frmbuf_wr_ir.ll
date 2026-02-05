; ModuleID = 'C:/TFG_Vivado/vivado/axu2cga_trd.runs/design_1_v_frmbuf_wr_0_0_synth_1/prj/sol/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<128>" = type { %"struct.ap_int_base<128, false>" }
%"struct.ap_int_base<128, false>" = type { %"struct.ssdm_int<128, false>" }
%"struct.ssdm_int<128, false>" = type { i128 }
%"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>" = type { %"struct.hls::axis<ap_uint<48>, 1, 1, 1>" }
%"struct.hls::axis<ap_uint<48>, 1, 1, 1>" = type { %"struct.ap_uint<48>", %"struct.ap_uint<6>", %"struct.ap_uint<6>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>" }
%"struct.ap_uint<48>" = type { %"struct.ap_int_base<48, false>" }
%"struct.ap_int_base<48, false>" = type { %"struct.ssdm_int<48, false>" }
%"struct.ssdm_int<48, false>" = type { i48 }
%"struct.ap_uint<6>" = type { %"struct.ap_int_base<6, false>" }
%"struct.ap_int_base<6, false>" = type { %"struct.ssdm_int<6, false>" }
%"struct.ssdm_int<6, false>" = type { i6 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }

; Function Attrs: noinline
define void @apatb_v_frmbuf_wr_ir(i16 zeroext %width, i16 zeroext %height, i16 zeroext %stride, i16 zeroext %video_format, %"struct.ap_uint<128>"* noalias nonnull "maxi" %frm_buffer, %"struct.ap_uint<128>"* noalias nonnull "maxi" %frm_buffer2, %"struct.ap_uint<128>"* noalias nonnull "maxi" %frm_buffer3, %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* noalias nonnull align 8 dereferenceable(16) %s_axis_video) local_unnamed_addr #0 {
entry:
  %0 = bitcast %"struct.ap_uint<128>"* %frm_buffer to [2073600 x %"struct.ap_uint<128>"]*
  %1 = call i8* @malloc(i64 33177600)
  %frm_buffer_copy = bitcast i8* %1 to [2073600 x i128]*
  %2 = bitcast %"struct.ap_uint<128>"* %frm_buffer2 to [2073600 x %"struct.ap_uint<128>"]*
  %3 = call i8* @malloc(i64 33177600)
  %frm_buffer2_copy = bitcast i8* %3 to [2073600 x i128]*
  %4 = bitcast %"struct.ap_uint<128>"* %frm_buffer3 to [2073600 x %"struct.ap_uint<128>"]*
  %5 = call i8* @malloc(i64 33177600)
  %frm_buffer3_copy = bitcast i8* %5 to [2073600 x i128]*
  %6 = getelementptr [2073600 x i128], [2073600 x i128]* %frm_buffer3_copy, i64 0, i64 0
  %s_axis_video_copy.data = alloca i48, align 512
  %s_axis_video_copy.keep = alloca i6, align 512
  %s_axis_video_copy.strb = alloca i6, align 512
  %s_axis_video_copy.user = alloca i1, align 512
  %s_axis_video_copy.last = alloca i1, align 512
  %s_axis_video_copy.id = alloca i1, align 512
  %s_axis_video_copy.dest = alloca i1, align 512
  call fastcc void @copy_in([2073600 x %"struct.ap_uint<128>"]* nonnull %0, [2073600 x i128]* %frm_buffer_copy, [2073600 x %"struct.ap_uint<128>"]* nonnull %2, [2073600 x i128]* %frm_buffer2_copy, [2073600 x %"struct.ap_uint<128>"]* nonnull %4, [2073600 x i128]* %frm_buffer3_copy, %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* nonnull %s_axis_video, i48* nonnull align 512 %s_axis_video_copy.data, i6* nonnull align 512 %s_axis_video_copy.keep, i6* nonnull align 512 %s_axis_video_copy.strb, i1* nonnull align 512 %s_axis_video_copy.user, i1* nonnull align 512 %s_axis_video_copy.last, i1* nonnull align 512 %s_axis_video_copy.id, i1* nonnull align 512 %s_axis_video_copy.dest)
  call void @apatb_v_frmbuf_wr_hw(i16 %width, i16 %height, i16 %stride, i16 %video_format, [2073600 x i128]* %frm_buffer_copy, [2073600 x i128]* %frm_buffer2_copy, i128* %6, i48* %s_axis_video_copy.data, i6* %s_axis_video_copy.keep, i6* %s_axis_video_copy.strb, i1* %s_axis_video_copy.user, i1* %s_axis_video_copy.last, i1* %s_axis_video_copy.id, i1* %s_axis_video_copy.dest)
  call void @copy_back([2073600 x %"struct.ap_uint<128>"]* %0, [2073600 x i128]* %frm_buffer_copy, [2073600 x %"struct.ap_uint<128>"]* %2, [2073600 x i128]* %frm_buffer2_copy, [2073600 x %"struct.ap_uint<128>"]* %4, [2073600 x i128]* %frm_buffer3_copy, %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %s_axis_video, i48* %s_axis_video_copy.data, i6* %s_axis_video_copy.keep, i6* %s_axis_video_copy.strb, i1* %s_axis_video_copy.user, i1* %s_axis_video_copy.last, i1* %s_axis_video_copy.id, i1* %s_axis_video_copy.dest)
  call void @free(i8* %1)
  call void @free(i8* %3)
  call void @free(i8* %5)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_in([2073600 x %"struct.ap_uint<128>"]* readonly "unpacked"="0", [2073600 x i128]* nocapture "unpacked"="1.0", [2073600 x %"struct.ap_uint<128>"]* readonly "unpacked"="2", [2073600 x i128]* nocapture "unpacked"="3.0", [2073600 x %"struct.ap_uint<128>"]* readonly "unpacked"="4", [2073600 x i128]* nocapture "unpacked"="5.0", %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* "unpacked"="6", i48* align 512 "unpacked"="7.0" %_V_data_V, i6* align 512 "unpacked"="7.1" %_V_keep_V, i6* align 512 "unpacked"="7.2" %_V_strb_V, i1* align 512 "unpacked"="7.3" %_V_user_V, i1* align 512 "unpacked"="7.4" %_V_last_V, i1* align 512 "unpacked"="7.5" %_V_id_V, i1* align 512 "unpacked"="7.6" %_V_dest_V) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<128>"([2073600 x i128]* %1, [2073600 x %"struct.ap_uint<128>"]* %0)
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<128>"([2073600 x i128]* %3, [2073600 x %"struct.ap_uint<128>"]* %2)
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<128>"([2073600 x i128]* %5, [2073600 x %"struct.ap_uint<128>"]* %4)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>.97"(i48* align 512 %_V_data_V, i6* align 512 %_V_keep_V, i6* align 512 %_V_strb_V, i1* align 512 %_V_user_V, i1* align 512 %_V_last_V, i1* align 512 %_V_id_V, i1* align 512 %_V_dest_V, %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %6)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a2073600struct.ap_uint<128>"([2073600 x %"struct.ap_uint<128>"]* %dst, [2073600 x %"struct.ap_uint<128>"]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [2073600 x %"struct.ap_uint<128>"]* %src, null
  %1 = icmp eq [2073600 x %"struct.ap_uint<128>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [2073600 x %"struct.ap_uint<128>"], [2073600 x %"struct.ap_uint<128>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [2073600 x %"struct.ap_uint<128>"], [2073600 x %"struct.ap_uint<128>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = load i128, i128* %src.addr.0.0.05, align 16
  store i128 %3, i128* %dst.addr.0.0.06, align 16
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %dst, i48* align 512 "unpacked"="1.0" %src_V_data_V, i6* align 512 "unpacked"="1.1" %src_V_keep_V, i6* align 512 "unpacked"="1.2" %src_V_strb_V, i1* align 512 "unpacked"="1.3" %src_V_user_V, i1* align 512 "unpacked"="1.4" %src_V_last_V, i1* align 512 "unpacked"="1.5" %src_V_id_V, i1* align 512 "unpacked"="1.6" %src_V_dest_V) unnamed_addr #3 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* nonnull %dst, i48* align 512 %src_V_data_V, i6* align 512 %src_V_keep_V, i6* align 512 %src_V_strb_V, i1* align 512 %src_V_user_V, i1* align 512 %src_V_last_V, i1* align 512 %src_V_id_V, i1* align 512 %src_V_dest_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* nocapture, i48* nocapture align 512 "unpacked"="1.0" %_V_data_V, i6* nocapture align 512 "unpacked"="1.1" %_V_keep_V, i6* nocapture align 512 "unpacked"="1.2" %_V_strb_V, i1* nocapture align 512 "unpacked"="1.3" %_V_user_V, i1* nocapture align 512 "unpacked"="1.4" %_V_last_V, i1* nocapture align 512 "unpacked"="1.5" %_V_id_V, i1* nocapture align 512 "unpacked"="1.6" %_V_dest_V) unnamed_addr #4 {
entry:
  %1 = alloca i48
  %2 = alloca i6
  %3 = alloca i6
  %4 = alloca i1
  %5 = alloca i1
  %6 = alloca i1
  %7 = alloca i1
  %8 = alloca %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %9 = bitcast i48* %_V_data_V to i8*
  %10 = call i1 @fpga_fifo_not_empty_8(i8* %9)
  br i1 %10, label %push, label %ret

push:                                             ; preds = %empty
  %11 = bitcast i48* %1 to i8*
  %12 = bitcast i48* %_V_data_V to i8*
  call void @fpga_fifo_pop_8(i8* %11, i8* %12)
  %13 = load volatile i48, i48* %1
  %14 = bitcast i6* %3 to i8*
  %15 = bitcast i6* %_V_keep_V to i8*
  call void @fpga_fifo_pop_1(i8* %14, i8* %15)
  %16 = bitcast i6* %3 to i8*
  %17 = load i8, i8* %16
  %18 = trunc i8 %17 to i6
  %19 = bitcast i6* %2 to i8*
  %20 = bitcast i6* %_V_strb_V to i8*
  call void @fpga_fifo_pop_1(i8* %19, i8* %20)
  %21 = bitcast i6* %2 to i8*
  %22 = load i8, i8* %21
  %23 = trunc i8 %22 to i6
  %24 = bitcast i1* %7 to i8*
  %25 = bitcast i1* %_V_user_V to i8*
  call void @fpga_fifo_pop_1(i8* %24, i8* %25)
  %26 = bitcast i1* %7 to i8*
  %27 = load i8, i8* %26
  %28 = trunc i8 %27 to i1
  %29 = bitcast i1* %6 to i8*
  %30 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_pop_1(i8* %29, i8* %30)
  %31 = bitcast i1* %6 to i8*
  %32 = load i8, i8* %31
  %33 = trunc i8 %32 to i1
  %34 = bitcast i1* %5 to i8*
  %35 = bitcast i1* %_V_id_V to i8*
  call void @fpga_fifo_pop_1(i8* %34, i8* %35)
  %36 = bitcast i1* %5 to i8*
  %37 = load i8, i8* %36
  %38 = trunc i8 %37 to i1
  %39 = bitcast i1* %4 to i8*
  %40 = bitcast i1* %_V_dest_V to i8*
  call void @fpga_fifo_pop_1(i8* %39, i8* %40)
  %41 = bitcast i1* %4 to i8*
  %42 = load i8, i8* %41
  %43 = trunc i8 %42 to i1
  %.fca.0.0.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>" undef, i48 %13, 0, 0, 0, 0, 0
  %.fca.0.1.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>" %.fca.0.0.0.0.0.insert, i6 %18, 0, 1, 0, 0, 0
  %.fca.0.2.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>" %.fca.0.1.0.0.0.insert, i6 %23, 0, 2, 0, 0, 0
  %.fca.0.3.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>" %.fca.0.2.0.0.0.insert, i1 %28, 0, 3, 0, 0, 0
  %.fca.0.4.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>" %.fca.0.3.0.0.0.insert, i1 %33, 0, 4, 0, 0, 0
  %.fca.0.5.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>" %.fca.0.4.0.0.0.insert, i1 %38, 0, 5, 0, 0, 0
  %.fca.0.6.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>" %.fca.0.5.0.0.0.insert, i1 %43, 0, 6, 0, 0, 0
  store %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>" %.fca.0.6.0.0.0.insert, %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %8
  %44 = bitcast %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %8 to i8*
  %45 = bitcast %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %0 to i8*
  call void @fpga_fifo_push_16(i8* %44, i8* %45)
  br label %empty, !llvm.loop !6

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_out([2073600 x %"struct.ap_uint<128>"]* "unpacked"="0", [2073600 x i128]* nocapture readonly "unpacked"="1.0", [2073600 x %"struct.ap_uint<128>"]* "unpacked"="2", [2073600 x i128]* nocapture readonly "unpacked"="3.0", [2073600 x %"struct.ap_uint<128>"]* "unpacked"="4", [2073600 x i128]* nocapture readonly "unpacked"="5.0", %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* "unpacked"="6", i48* align 512 "unpacked"="7.0" %_V_data_V, i6* align 512 "unpacked"="7.1" %_V_keep_V, i6* align 512 "unpacked"="7.2" %_V_strb_V, i1* align 512 "unpacked"="7.3" %_V_user_V, i1* align 512 "unpacked"="7.4" %_V_last_V, i1* align 512 "unpacked"="7.5" %_V_id_V, i1* align 512 "unpacked"="7.6" %_V_dest_V) unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<128>.64"([2073600 x %"struct.ap_uint<128>"]* %0, [2073600 x i128]* %1)
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<128>.64"([2073600 x %"struct.ap_uint<128>"]* %2, [2073600 x i128]* %3)
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<128>.64"([2073600 x %"struct.ap_uint<128>"]* %4, [2073600 x i128]* %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %6, i48* align 512 %_V_data_V, i6* align 512 %_V_keep_V, i6* align 512 %_V_strb_V, i1* align 512 %_V_user_V, i1* align 512 %_V_last_V, i1* align 512 %_V_id_V, i1* align 512 %_V_dest_V)
  ret void
}

declare i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<128>.64"([2073600 x %"struct.ap_uint<128>"]* "unpacked"="0" %dst, [2073600 x i128]* nocapture readonly "unpacked"="1.0" %src) unnamed_addr #6 {
entry:
  %0 = icmp eq [2073600 x %"struct.ap_uint<128>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a2073600struct.ap_uint<128>.67"([2073600 x %"struct.ap_uint<128>"]* nonnull %dst, [2073600 x i128]* %src, i64 2073600)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a2073600struct.ap_uint<128>.67"([2073600 x %"struct.ap_uint<128>"]* "unpacked"="0" %dst, [2073600 x i128]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [2073600 x %"struct.ap_uint<128>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [2073600 x i128], [2073600 x i128]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [2073600 x %"struct.ap_uint<128>"], [2073600 x %"struct.ap_uint<128>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i128, i128* %src.addr.0.0.05, align 16
  store i128 %1, i128* %dst.addr.0.0.06, align 16
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<128>"([2073600 x i128]* nocapture "unpacked"="0.0" %dst, [2073600 x %"struct.ap_uint<128>"]* readonly "unpacked"="1" %src) unnamed_addr #6 {
entry:
  %0 = icmp eq [2073600 x %"struct.ap_uint<128>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a2073600struct.ap_uint<128>.74"([2073600 x i128]* %dst, [2073600 x %"struct.ap_uint<128>"]* nonnull %src, i64 2073600)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a2073600struct.ap_uint<128>.74"([2073600 x i128]* nocapture "unpacked"="0.0" %dst, [2073600 x %"struct.ap_uint<128>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [2073600 x %"struct.ap_uint<128>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [2073600 x %"struct.ap_uint<128>"], [2073600 x %"struct.ap_uint<128>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [2073600 x i128], [2073600 x i128]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i128, i128* %src.addr.0.0.05, align 16
  store i128 %1, i128* %dst.addr.0.0.06, align 16
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>.97"(i48* align 512 "unpacked"="0.0" %dst_V_data_V, i6* align 512 "unpacked"="0.1" %dst_V_keep_V, i6* align 512 "unpacked"="0.2" %dst_V_strb_V, i1* align 512 "unpacked"="0.3" %dst_V_user_V, i1* align 512 "unpacked"="0.4" %dst_V_last_V, i1* align 512 "unpacked"="0.5" %dst_V_id_V, i1* align 512 "unpacked"="0.6" %dst_V_dest_V, %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %src) unnamed_addr #3 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>.100"(i48* align 512 %dst_V_data_V, i6* align 512 %dst_V_keep_V, i6* align 512 %dst_V_strb_V, i1* align 512 %dst_V_user_V, i1* align 512 %dst_V_last_V, i1* align 512 %dst_V_id_V, i1* align 512 %dst_V_dest_V, %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>.100"(i48* nocapture align 512 "unpacked"="0.0" %_V_data_V, i6* nocapture align 512 "unpacked"="0.1" %_V_keep_V, i6* nocapture align 512 "unpacked"="0.2" %_V_strb_V, i1* nocapture align 512 "unpacked"="0.3" %_V_user_V, i1* nocapture align 512 "unpacked"="0.4" %_V_last_V, i1* nocapture align 512 "unpacked"="0.5" %_V_id_V, i1* nocapture align 512 "unpacked"="0.6" %_V_dest_V, %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* nocapture) unnamed_addr #4 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"
  %2 = alloca i48
  %3 = alloca i6
  %4 = alloca i6
  %5 = alloca i1
  %6 = alloca i1
  %7 = alloca i1
  %8 = alloca i1
  br label %empty

empty:                                            ; preds = %push, %entry
  %9 = bitcast %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %0 to i8*
  %10 = call i1 @fpga_fifo_not_empty_16(i8* %9)
  br i1 %10, label %push, label %ret

push:                                             ; preds = %empty
  %11 = bitcast %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %1 to i8*
  %12 = bitcast %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %0 to i8*
  call void @fpga_fifo_pop_16(i8* %11, i8* %12)
  %13 = load volatile %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>", %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %1
  %.fca.0.0.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>" %13, 0, 0, 0, 0, 0
  %.fca.0.1.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>" %13, 0, 1, 0, 0, 0
  %.fca.0.2.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>" %13, 0, 2, 0, 0, 0
  %.fca.0.3.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>" %13, 0, 3, 0, 0, 0
  %.fca.0.4.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>" %13, 0, 4, 0, 0, 0
  %.fca.0.5.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>" %13, 0, 5, 0, 0, 0
  %.fca.0.6.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>" %13, 0, 6, 0, 0, 0
  store i48 %.fca.0.0.0.0.0.extract, i48* %2
  %14 = bitcast i48* %2 to i8*
  %15 = bitcast i48* %_V_data_V to i8*
  call void @fpga_fifo_push_8(i8* %14, i8* %15)
  store i6 %.fca.0.1.0.0.0.extract, i6* %4
  %16 = bitcast i6* %4 to i8*
  %17 = bitcast i6* %_V_keep_V to i8*
  call void @fpga_fifo_push_1(i8* %16, i8* %17)
  store i6 %.fca.0.2.0.0.0.extract, i6* %3
  %18 = bitcast i6* %3 to i8*
  %19 = bitcast i6* %_V_strb_V to i8*
  call void @fpga_fifo_push_1(i8* %18, i8* %19)
  store i1 %.fca.0.3.0.0.0.extract, i1* %8
  %20 = bitcast i1* %8 to i8*
  %21 = bitcast i1* %_V_user_V to i8*
  call void @fpga_fifo_push_1(i8* %20, i8* %21)
  store i1 %.fca.0.4.0.0.0.extract, i1* %7
  %22 = bitcast i1* %7 to i8*
  %23 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_push_1(i8* %22, i8* %23)
  store i1 %.fca.0.5.0.0.0.extract, i1* %6
  %24 = bitcast i1* %6 to i8*
  %25 = bitcast i1* %_V_id_V to i8*
  call void @fpga_fifo_push_1(i8* %24, i8* %25)
  store i1 %.fca.0.6.0.0.0.extract, i1* %5
  %26 = bitcast i1* %5 to i8*
  %27 = bitcast i1* %_V_dest_V to i8*
  call void @fpga_fifo_push_1(i8* %26, i8* %27)
  br label %empty, !llvm.loop !6

ret:                                              ; preds = %empty
  ret void
}

declare void @apatb_v_frmbuf_wr_hw(i16, i16, i16, i16, [2073600 x i128]*, [2073600 x i128]*, i128*, i48*, i6*, i6*, i1*, i1*, i1*, i1*)

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_back([2073600 x %"struct.ap_uint<128>"]* "unpacked"="0", [2073600 x i128]* nocapture readonly "unpacked"="1.0", [2073600 x %"struct.ap_uint<128>"]* "unpacked"="2", [2073600 x i128]* nocapture readonly "unpacked"="3.0", [2073600 x %"struct.ap_uint<128>"]* "unpacked"="4", [2073600 x i128]* nocapture readonly "unpacked"="5.0", %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* "unpacked"="6", i48* align 512 "unpacked"="7.0" %_V_data_V, i6* align 512 "unpacked"="7.1" %_V_keep_V, i6* align 512 "unpacked"="7.2" %_V_strb_V, i1* align 512 "unpacked"="7.3" %_V_user_V, i1* align 512 "unpacked"="7.4" %_V_last_V, i1* align 512 "unpacked"="7.5" %_V_id_V, i1* align 512 "unpacked"="7.6" %_V_dest_V) unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<128>.64"([2073600 x %"struct.ap_uint<128>"]* %0, [2073600 x i128]* %1)
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<128>.64"([2073600 x %"struct.ap_uint<128>"]* %2, [2073600 x i128]* %3)
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<128>.64"([2073600 x %"struct.ap_uint<128>"]* %4, [2073600 x i128]* %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %6, i48* align 512 %_V_data_V, i6* align 512 %_V_keep_V, i6* align 512 %_V_strb_V, i1* align 512 %_V_user_V, i1* align 512 %_V_last_V, i1* align 512 %_V_id_V, i1* align 512 %_V_dest_V)
  ret void
}

declare void @v_frmbuf_wr_hw_stub(i16 zeroext, i16 zeroext, i16 zeroext, i16 zeroext, %"struct.ap_uint<128>"* noalias nonnull, %"struct.ap_uint<128>"* noalias nonnull, %"struct.ap_uint<128>"* noalias nonnull, %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* noalias nonnull)

define void @v_frmbuf_wr_hw_stub_wrapper(i16, i16, i16, i16, [2073600 x i128]*, [2073600 x i128]*, i128*, i48*, i6*, i6*, i1*, i1*, i1*, i1*) #7 {
entry:
  %14 = call i8* @malloc(i64 33177600)
  %15 = bitcast i8* %14 to [2073600 x %"struct.ap_uint<128>"]*
  %16 = call i8* @malloc(i64 33177600)
  %17 = bitcast i8* %16 to [2073600 x %"struct.ap_uint<128>"]*
  %18 = call i8* @malloc(i64 33177600)
  %19 = bitcast i8* %18 to [2073600 x %"struct.ap_uint<128>"]*
  %20 = bitcast i128* %6 to [2073600 x i128]*
  %21 = call i8* @malloc(i64 16)
  %22 = bitcast i8* %21 to %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"*
  call void @copy_out([2073600 x %"struct.ap_uint<128>"]* %15, [2073600 x i128]* %4, [2073600 x %"struct.ap_uint<128>"]* %17, [2073600 x i128]* %5, [2073600 x %"struct.ap_uint<128>"]* %19, [2073600 x i128]* %20, %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %22, i48* %7, i6* %8, i6* %9, i1* %10, i1* %11, i1* %12, i1* %13)
  %23 = bitcast [2073600 x %"struct.ap_uint<128>"]* %15 to %"struct.ap_uint<128>"*
  %24 = bitcast [2073600 x %"struct.ap_uint<128>"]* %17 to %"struct.ap_uint<128>"*
  %25 = bitcast [2073600 x %"struct.ap_uint<128>"]* %19 to %"struct.ap_uint<128>"*
  call void @v_frmbuf_wr_hw_stub(i16 %0, i16 %1, i16 %2, i16 %3, %"struct.ap_uint<128>"* %23, %"struct.ap_uint<128>"* %24, %"struct.ap_uint<128>"* %25, %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %22)
  call void @copy_in([2073600 x %"struct.ap_uint<128>"]* %15, [2073600 x i128]* %4, [2073600 x %"struct.ap_uint<128>"]* %17, [2073600 x i128]* %5, [2073600 x %"struct.ap_uint<128>"]* %19, [2073600 x i128]* %20, %"class.hls::stream<hls::axis<ap_uint<48>, 1, 1, 1, '8', false>, 0>"* %22, i48* %7, i6* %8, i6* %9, i1* %10, i1* %11, i1* %12, i1* %13)
  call void @free(i8* %14)
  call void @free(i8* %16)
  call void @free(i8* %18)
  call void @free(i8* %21)
  ret void
}

declare i1 @fpga_fifo_not_empty_16(i8*)

declare i1 @fpga_fifo_not_empty_8(i8*)

declare void @fpga_fifo_pop_16(i8*, i8*)

declare void @fpga_fifo_pop_8(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_push_16(i8*, i8*)

declare void @fpga_fifo_push_8(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #3 = { argmemonly noinline willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline willreturn "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyout" }
attributes #6 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #7 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1}
!llvm.module.flags = !{!2, !3, !4}
!blackbox_cfg = !{!5}

!0 = !{!"AMD/Xilinx clang version 16.0.6"}
!1 = !{!"clang version 7.0.0 "}
!2 = !{i32 2, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.rotate.disable"}
