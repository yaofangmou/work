#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"mvc.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	MVC_IsSTRefFlg
	.type	MVC_IsSTRefFlg, %function
MVC_IsSTRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	ldr	x19, [sp, 16]
	and	w0, w0, 16776960
	cmp	w0, 65536
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_IsSTRefFlg, .-MVC_IsSTRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_IsLTRefFlg
	.type	MVC_IsLTRefFlg, %function
MVC_IsLTRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	ldr	x19, [sp, 16]
	and	w0, w0, 16776960
	cmp	w0, 256
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_IsLTRefFlg, .-MVC_IsLTRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_compare_pic_by_pic_num_desc
	.type	MVC_compare_pic_by_pic_num_desc, %function
MVC_compare_pic_by_pic_num_desc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19]
	mov	w3, 1
	ldr	x2, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x0, 20]
	ldr	w2, [x2, 20]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	csetm	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	MVC_compare_pic_by_pic_num_desc, .-MVC_compare_pic_by_pic_num_desc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_compare_pic_by_lt_pic_num_asc
	.type	MVC_compare_pic_by_lt_pic_num_asc, %function
MVC_compare_pic_by_lt_pic_num_asc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19]
	mov	w3, -1
	ldr	x2, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x0, 16]
	ldr	w2, [x2, 16]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	MVC_compare_pic_by_lt_pic_num_asc, .-MVC_compare_pic_by_lt_pic_num_asc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_compare_fs_by_frame_num_desc
	.type	MVC_compare_fs_by_frame_num_desc, %function
MVC_compare_fs_by_frame_num_desc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19]
	mov	w3, 1
	ldr	x2, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x0, 24]
	ldr	w2, [x2, 24]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	csetm	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	MVC_compare_fs_by_frame_num_desc, .-MVC_compare_fs_by_frame_num_desc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_compare_fs_by_lt_pic_idx_asc
	.type	MVC_compare_fs_by_lt_pic_idx_asc, %function
MVC_compare_fs_by_lt_pic_idx_asc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19]
	mov	w3, -1
	ldr	x2, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x0, 28]
	ldr	w2, [x2, 28]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, hi
	csel	w0, w0, w3, cs
	ret
	.size	MVC_compare_fs_by_lt_pic_idx_asc, .-MVC_compare_fs_by_lt_pic_idx_asc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_compare_pic_by_poc_asc
	.type	MVC_compare_pic_by_poc_asc, %function
MVC_compare_pic_by_poc_asc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19]
	mov	w3, -1
	ldr	x2, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x0, 24]
	ldr	w2, [x2, 24]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	MVC_compare_pic_by_poc_asc, .-MVC_compare_pic_by_poc_asc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_compare_pic_by_poc_desc
	.type	MVC_compare_pic_by_poc_desc, %function
MVC_compare_pic_by_poc_desc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19]
	mov	w3, 1
	ldr	x2, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x0, 24]
	ldr	w2, [x2, 24]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	csetm	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	MVC_compare_pic_by_poc_desc, .-MVC_compare_pic_by_poc_desc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_compare_fs_by_poc_asc
	.type	MVC_compare_fs_by_poc_asc, %function
MVC_compare_fs_by_poc_asc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19]
	mov	w3, -1
	ldr	x2, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x0, 32]
	ldr	w2, [x2, 32]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	MVC_compare_fs_by_poc_asc, .-MVC_compare_fs_by_poc_asc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_compare_fs_by_poc_desc
	.type	MVC_compare_fs_by_poc_desc, %function
MVC_compare_fs_by_poc_desc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19]
	mov	w3, 1
	ldr	x2, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x0, 32]
	ldr	w2, [x2, 32]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	csetm	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	MVC_compare_fs_by_poc_desc, .-MVC_compare_fs_by_poc_desc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	MVC_SetFrmRepeatCount.part.1, %function
MVC_SetFrmRepeatCount.part.1:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	add	x3, x19, 11124736
	ldp	w0, w2, [x19, 132]
	ldr	w3, [x3, 408]
	lsr	w0, w0, 1
	add	w2, w3, w2, lsr 1
	add	w3, w2, 1
	cmp	w0, w3
	bcc	.L28
	sub	w0, w0, #1
	sub	w0, w0, w2
	cmp	w0, 1
	bls	.L29
	mov	w0, 2
	str	w0, [x20, 16]
	ldr	w0, [x19, 136]
	add	w0, w0, 4
	str	w0, [x19, 136]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L28:
	str	wzr, [x20, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L29:
	mov	w0, 1
	str	w0, [x20, 16]
	ldr	w0, [x19, 136]
	add	w0, w0, 2
	str	w0, [x19, 136]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_SetFrmRepeatCount.part.1, .-MVC_SetFrmRepeatCount.part.1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	MVC_CombinePacket.part.11, %function
MVC_CombinePacket.part.11:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC1
	mov	w1, 11097
	mov	w0, 8
	bl	dprint_normal
	ldr	x3, [x19, 240]
	mov	w1, 11100
	ldr	x2, .LC3
	mov	w0, 8
	ldp	w6, w4, [x3, 48]
	ldr	w5, [x3, 16]
	ldr	w3, [x3, 20]
	bl	dprint_normal
	ldr	x1, [x19, 240]
	ldr	x3, .LC4
	ldr	w2, [x1, 16]
	ldr	x0, [x1, 40]
	ldr	x3, [x3, 104]
	ldr	x1, [x1, 8]
	sub	x0, x0, x2
	blr	x3
	ldr	x3, [x19, 240]
	mov	w5, 1
	ldr	x2, .LC6
	mov	w1, 11111
	mov	w0, 8
	ldr	w4, [x3, 68]
	ldr	w20, [x3, 36]
	str	w4, [x3, 36]
	ldr	x3, [x19, 240]
	str	wzr, [x3, 28]
	ldr	x3, [x19, 240]
	ldr	w6, [x3, 16]
	ldr	x4, [x3, 40]
	sub	x4, x4, x6
	str	x4, [x3, 8]
	ldr	x3, [x19, 240]
	ldr	w6, [x3, 16]
	ldr	w4, [x3, 52]
	sub	w4, w4, w6
	str	w4, [x3, 20]
	ldr	x3, [x19, 240]
	ldr	w6, [x3, 16]
	ldr	w4, [x3, 48]
	add	w4, w6, w4
	str	w4, [x3, 16]
	ldr	x3, [x19, 240]
	str	w5, [x3, 76]
	ldr	x3, [x19, 240]
	ldp	w4, w3, [x3, 16]
	bl	dprint_normal
	ldr	w0, [x19, 120]
	mov	w1, w20
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 240]
	str	xzr, [x0, 40]
	ldr	x0, [x19, 240]
	str	wzr, [x0, 60]
	ldr	x0, [x19, 240]
	str	wzr, [x0, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_CombinePacket.part.11, .-MVC_CombinePacket.part.11
	.align	3
.LC1:
	.xword	.LC0
	.align	3
.LC3:
	.xword	.LC2
	.align	3
.LC4:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC6:
	.xword	.LC5
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_ue_v
	.type	mvc_ue_v, %function
mvc_ue_v:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x22, x1
	add	x23, x21, 872
	bl	_mcount
	mov	w1, 32
	mov	x0, x23
	bl	BsShow
	mov	w20, w0
	bl	ZerosMS_32
	cmp	w0, 15
	mov	w19, w0
	bls	.L37
	cmp	w0, 31
	bls	.L38
	mov	w0, 1
	mov	w20, -1
	strb	w0, [x21, 10]
	mov	w19, 32
.L35:
	ldr	x5, [x21, 240]
	mov	w4, w20
	ldr	x2, .LC8
	mov	x3, x22
	mov	w1, 111
	mov	w0, 19
	ldr	w6, [x5, 72]
	add	w19, w6, w19
	str	w19, [x5, 72]
	bl	dprint_normal
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L37:
	lsl	w19, w0, 1
	mov	w2, 32
	add	w19, w19, 1
	mov	x0, x23
	sub	w2, w2, w19
	mov	w1, w19
	lsr	w20, w20, w2
	sub	w20, w20, #1
	bl	BsSkip
	b	.L35
	.p2align 3
.L38:
	mov	w1, w0
	mov	x0, x23
	add	w24, w19, 1
	lsl	w19, w19, 1
	bl	BsSkip
	add	w19, w19, 1
	mov	w1, w24
	mov	x0, x23
	bl	BsShow
	sub	w20, w0, #1
	mov	w1, w24
	mov	x0, x23
	bl	BsSkip
	b	.L35
	.size	mvc_ue_v, .-mvc_ue_v
	.align	3
.LC8:
	.xword	.LC7
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_se_v
	.type	mvc_se_v, %function
mvc_se_v:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x22, x1
	add	x23, x21, 872
	bl	_mcount
	mov	w1, 32
	mov	x0, x23
	bl	BsShow
	mov	w20, w0
	bl	ZerosMS_32
	cmp	w0, 15
	mov	w19, w0
	bhi	.L40
	lsl	w19, w0, 1
	mov	w2, 32
	add	w19, w19, 1
	mov	x0, x23
	sub	w2, w2, w19
	mov	w1, w19
	lsr	w20, w20, w2
	and	w2, w20, 1
	lsr	w20, w20, 1
	cmp	w2, wzr
	csneg	w20, w20, w20, eq
	bl	BsSkip
.L42:
	ldr	x5, [x21, 240]
	mov	w4, w20
	ldr	x2, .LC9
	mov	x3, x22
	mov	w1, 151
	mov	w0, 19
	ldr	w6, [x5, 72]
	add	w19, w6, w19
	str	w19, [x5, 72]
	bl	dprint_normal
	ldr	x23, [sp, 48]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L40:
	cmp	w0, 31
	bls	.L49
	mov	w0, 1
	mov	w20, 2147483647
	strb	w0, [x21, 10]
	mov	w19, 32
	b	.L42
	.p2align 3
.L49:
	mov	w1, w0
	mov	x0, x23
	bl	BsSkip
	mov	w1, w19
	mov	x0, x23
	lsl	w19, w19, 1
	bl	BsGet
	mov	w20, w0
	mov	w1, 1
	mov	x0, x23
	add	w19, w19, 1
	bl	BsGet
	and	w0, w0, 1
	cmp	w0, wzr
	csneg	w20, w20, w20, eq
	b	.L42
	.size	mvc_se_v, .-mvc_se_v
	.align	3
.LC9:
	.xword	.LC7
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_u_v
	.type	mvc_u_v, %function
mvc_u_v:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x22, x2
	mov	w19, w1
	bl	_mcount
	mov	w1, w19
	add	x0, x21, 872
	bl	BsGet
	mov	w20, w0
	ldr	x5, [x21, 240]
	mov	w4, w0
	ldr	x2, .LC10
	mov	x3, x22
	mov	w1, 163
	mov	w0, 19
	ldr	w6, [x5, 72]
	add	w19, w6, w19
	str	w19, [x5, 72]
	bl	dprint_normal
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	mvc_u_v, .-mvc_u_v
	.align	3
.LC10:
	.xword	.LC7
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_u_1
	.type	mvc_u_1, %function
mvc_u_1:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	mov	w1, 1
	add	x0, x20, 872
	bl	BsGet
	mov	w19, w0
	ldr	x6, [x20, 240]
	mov	w4, w0
	ldr	x2, .LC11
	mov	x3, x21
	mov	w1, 174
	mov	w0, 19
	ldr	w5, [x6, 72]
	add	w5, w5, 1
	str	w5, [x6, 72]
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	mvc_u_1, .-mvc_u_1
	.align	3
.LC11:
	.xword	.LC7
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetMinPOC
	.type	MVC_GetMinPOC, %function
MVC_GetMinPOC:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x24, x3
	mov	x21, x0
	mov	x0, x30
	mov	x23, x2
	mov	w22, w1
	add	x26, x21, 11124736
	bl	_mcount
	mov	w0, -1
	str	w0, [x24]
	mov	w0, 2147483647
	str	w0, [x23]
	ldr	w0, [x26, 408]
	ldr	w1, [x26, 412]
	cmp	w1, w0
	bls	.L53
	str	w0, [x26, 412]
.L53:
	mov	w25, -1
	mov	w20, 0
	cbnz	w0, .L68
	b	.L59
	.p2align 3
.L56:
	ldr	w2, [x1, 32]
	ldr	w3, [x23]
	cmp	w3, w2
	ble	.L55
	ldrb	w3, [x1, 5]
	cbz	w3, .L55
	ldr	w0, [x0, 20]
	sub	w0, w0, #1
	cmp	w0, 1
	bls	.L75
	.p2align 2
.L55:
	ldr	w0, [x26, 408]
	add	w20, w20, 1
	cmp	w0, w20
	bls	.L59
.L68:
	add	x19, x21, x20, uxtw 3
	add	x19, x19, 11124736
	ldr	x0, [x19, 24]
	cbz	x0, .L55
	ldrsb	w1, [x0, 6]
	ldr	w0, [x21, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L55
	cmn	w22, #1
	ldr	x1, [x19, 24]
	bne	.L56
	ldrb	w2, [x1, 5]
	cbz	w2, .L55
	ldr	w0, [x0, 20]
	sub	w0, w0, #1
	cmp	w0, 1
	bhi	.L55
	ldr	w0, [x1, 32]
	ldr	w2, [x23]
	cmp	w2, w0
	ble	.L57
	str	w0, [x23]
	str	w20, [x24]
	add	w20, w20, 1
	ldr	x0, [x19, 24]
	ldr	w25, [x0, 56]
	ldr	w0, [x26, 408]
	cmp	w0, w20
	bhi	.L68
.L59:
	ldr	w0, [x24]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x25, x26, [sp, 64]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L75:
	ldr	w0, [x1, 56]
	cmp	w22, w0
	bne	.L55
	str	w2, [x23]
	str	w20, [x24]
	b	.L55
	.p2align 3
.L57:
	bne	.L55
	ldr	w0, [x1, 56]
	cmp	w0, w25
	bge	.L55
	str	w20, [x24]
	ldr	x0, [x19, 24]
	ldr	w25, [x0, 56]
	b	.L55
	.size	MVC_GetMinPOC, .-MVC_GetMinPOC
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_FrameStoreRefFlg
	.type	MVC_FrameStoreRefFlg, %function
MVC_FrameStoreRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 3]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_FrameStoreRefFlg, .-MVC_FrameStoreRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_NonLongTermRefFlg
	.type	MVC_NonLongTermRefFlg, %function
MVC_NonLongTermRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w1, [x19, 3]
	cmp	w1, 3
	beq	.L96
	tbnz	x1, 0, .L97
	mov	w0, 0
	tbnz	x1, 1, .L82
.L89:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L97:
	ldrb	w2, [x19, 657]
	mov	w0, 1
	cbz	w2, .L89
	mov	w0, 0
	tbz	x1, 1, .L89
	b	.L82
	.p2align 3
.L96:
	ldrb	w1, [x19, 609]
	mov	w0, 1
	cbz	w1, .L89
	ldrb	w1, [x19, 657]
	cbz	w1, .L89
.L82:
	ldrb	w0, [x19, 705]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_NonLongTermRefFlg, .-MVC_NonLongTermRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ShortTermRefFlg
	.type	MVC_ShortTermRefFlg, %function
MVC_ShortTermRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w1, [x19, 3]
	cmp	w1, 3
	beq	.L114
	tbnz	x1, 0, .L115
.L102:
	mov	w0, 0
	tbnz	x1, 1, .L103
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L115:
	ldr	w0, [x19, 656]
	and	w0, w0, 16776960
	cmp	w0, 65536
	bne	.L102
.L107:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L114:
	ldr	w0, [x19, 608]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L107
	ldr	w0, [x19, 656]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L107
.L103:
	ldr	w0, [x19, 704]
	ldr	x19, [sp, 16]
	and	w0, w0, 16776960
	cmp	w0, 65536
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_ShortTermRefFlg, .-MVC_ShortTermRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_LongTermRefFlg
	.type	MVC_LongTermRefFlg, %function
MVC_LongTermRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w1, [x19, 3]
	cmp	w1, 3
	beq	.L132
	tbnz	x1, 0, .L133
.L120:
	mov	w0, 0
	tbnz	x1, 1, .L121
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L133:
	ldr	w0, [x19, 656]
	and	w0, w0, 16776960
	cmp	w0, 256
	bne	.L120
.L125:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L132:
	ldr	w0, [x19, 608]
	and	w0, w0, 16776960
	cmp	w0, 256
	beq	.L125
	ldr	w0, [x19, 656]
	and	w0, w0, 16776960
	cmp	w0, 256
	beq	.L125
.L121:
	ldr	w0, [x19, 704]
	ldr	x19, [sp, 16]
	and	w0, w0, 16776960
	cmp	w0, 256
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_LongTermRefFlg, .-MVC_LongTermRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UpdateLTReflist
	.type	MVC_UpdateLTReflist, %function
MVC_UpdateLTReflist:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x23, x0
	mov	x0, x30
	add	x26, x23, 11124736
	bl	_mcount
	ldr	w24, [x26, 408]
	cbz	w24, .L135
	sub	w22, w24, #1
	add	x20, x26, 24
	add	x22, x22, 1388544
	mov	w19, 0
	add	x22, x22, 2052
	add	x25, x23, 11153408
	add	x22, x23, x22, lsl 3
	b	.L137
	.p2align 3
.L136:
	cmp	x22, x20
	beq	.L151
.L137:
	ldr	x21, [x20]
	add	x20, x20, 8
	mov	x0, x21
	cbz	x21, .L136
	bl	MVC_LongTermRefFlg
	cbz	w0, .L136
	ldr	w1, [x21, 56]
	ldr	w0, [x25, 2824]
	cmp	w1, w0
	bne	.L136
	uxtw	x0, w19
	cmp	x22, x20
	add	x0, x0, 1388544
	add	w19, w19, 1
	add	x0, x23, x0, lsl 3
	str	x21, [x0, 16664]
	bne	.L137
	.p2align 2
.L151:
	cmp	w19, w24
	str	w19, [x26, 420]
	bcs	.L134
	.p2align 2
.L146:
	uxtw	x0, w19
	add	w19, w19, 1
	add	x0, x0, 1388544
	cmp	w19, w24
	add	x0, x23, x0, lsl 3
	str	xzr, [x0, 16664]
	bne	.L146
.L134:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L135:
	str	wzr, [x26, 420]
	b	.L134
	.size	MVC_UpdateLTReflist, .-MVC_UpdateLTReflist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UpdateReflist
	.type	MVC_UpdateReflist, %function
MVC_UpdateReflist:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x23, x0
	mov	x0, x30
	add	x26, x23, 11124736
	bl	_mcount
	ldr	w24, [x26, 408]
	cbz	w24, .L153
	sub	w22, w24, #1
	add	x20, x26, 24
	add	x22, x22, 1388544
	mov	w19, 0
	add	x22, x22, 2052
	add	x25, x23, 11153408
	add	x22, x23, x22, lsl 3
	b	.L155
	.p2align 3
.L154:
	cmp	x22, x20
	beq	.L169
.L155:
	ldr	x21, [x20]
	add	x20, x20, 8
	mov	x0, x21
	cbz	x21, .L154
	bl	MVC_ShortTermRefFlg
	cbz	w0, .L154
	ldr	w1, [x21, 56]
	ldr	w0, [x25, 2824]
	cmp	w1, w0
	bne	.L154
	uxtw	x0, w19
	cmp	x22, x20
	add	x0, x0, 1388544
	add	w19, w19, 1
	add	x0, x23, x0, lsl 3
	str	x21, [x0, 16536]
	bne	.L155
	.p2align 2
.L169:
	cmp	w19, w24
	str	w19, [x26, 416]
	bcs	.L152
	.p2align 2
.L164:
	uxtw	x0, w19
	add	w19, w19, 1
	add	x0, x0, 1388544
	cmp	w19, w24
	add	x0, x23, x0, lsl 3
	str	xzr, [x0, 16536]
	bne	.L164
.L152:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L153:
	str	wzr, [x26, 416]
	b	.L152
	.size	MVC_UpdateReflist, .-MVC_UpdateReflist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetPicNumX
	.type	MVC_GetPicNumX, %function
MVC_GetPicNumX:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldrb	w0, [x20, 3]
	ldr	w2, [x20, 568]
	cbz	w0, .L172
	lsl	w2, w2, 1
	add	w2, w2, 1
.L172:
	mvn	w0, w19
	add	w0, w0, w2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_GetPicNumX, .-MVC_GetPicNumX
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UnMarkFrameStoreRef
	.type	MVC_UnMarkFrameStoreRef, %function
MVC_UnMarkFrameStoreRef:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 2]
	tbz	x0, 0, .L174
	ldrb	w1, [x19, 3]
	strb	wzr, [x19, 657]
	and	w1, w1, 2
	strb	wzr, [x19, 658]
	strb	w1, [x19, 3]
.L174:
	tbz	x0, 1, .L175
	ldrb	w1, [x19, 3]
	strb	wzr, [x19, 705]
	and	w1, w1, 1
	strb	wzr, [x19, 706]
	strb	w1, [x19, 3]
.L175:
	cmp	w0, 3
	bne	.L176
	strb	wzr, [x19, 610]
	strb	wzr, [x19, 609]
.L176:
	strb	wzr, [x19, 3]
	mov	w2, 0
	ldrsb	w1, [x19, 6]
	ldr	w0, [x20, 120]
	bl	FSP_SetRef
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_UnMarkFrameStoreRef, .-MVC_UnMarkFrameStoreRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	MVC_SlidingWinMark.part.2, %function
MVC_SlidingWinMark.part.2:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 11124736
	ldr	w5, [x1, 408]
	cbz	w5, .L200
	add	x1, x1, 24
	mov	w7, 0
	mov	w6, 2147483647
	mov	w2, 0
	add	x8, x19, 11153408
	.p2align 2
.L190:
	ldr	x0, [x1]
	cbz	x0, .L185
	ldr	w3, [x0, 64]
	cmp	w3, w6
	bcs	.L185
	ldrb	w4, [x0, 3]
	cbz	w4, .L185
	cmp	w4, 3
	beq	.L256
	tbnz	x4, 0, .L257
.L189:
	tbnz	x4, 1, .L198
	.p2align 2
.L185:
	add	w2, w2, 1
	add	x1, x1, 8
	cmp	w2, w5
	bne	.L190
.L184:
	sxtw	x0, w7
	add	x0, x0, 1388544
	add	x0, x19, x0, lsl 3
	ldr	x1, [x0, 16408]
	cbz	x1, .L183
	ldrb	w0, [x1, 3]
	cbz	w0, .L183
	cmp	w0, 3
	beq	.L258
	tbnz	x0, 0, .L259
.L195:
	tbnz	x0, 1, .L199
.L183:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L257:
	ldrb	w9, [x0, 657]
	cbnz	w9, .L189
.L187:
	ldr	w4, [x0, 56]
	ldr	w0, [x8, 2824]
	cmp	w4, w0
	csel	w6, w6, w3, ne
	csel	w7, w7, w2, ne
	b	.L185
	.p2align 3
.L256:
	ldrb	w4, [x0, 609]
	cbz	w4, .L187
	ldrb	w4, [x0, 657]
	cbz	w4, .L187
.L198:
	ldrb	w4, [x0, 705]
	cbnz	w4, .L185
	ldr	w4, [x0, 56]
	ldr	w0, [x8, 2824]
	cmp	w4, w0
	csel	w6, w6, w3, ne
	csel	w7, w7, w2, ne
	b	.L185
	.p2align 3
.L259:
	ldrb	w2, [x1, 657]
	cbnz	w2, .L195
.L193:
	add	x0, x19, 11153408
	ldr	w2, [x1, 56]
	ldr	w0, [x0, 2824]
	cmp	w2, w0
	bne	.L183
	mov	x0, x19
	bl	MVC_UnMarkFrameStoreRef
	mov	x0, x19
	bl	MVC_UpdateReflist
	b	.L183
	.p2align 3
.L258:
	ldrb	w0, [x1, 609]
	cbz	w0, .L193
	ldrb	w0, [x1, 657]
	cbz	w0, .L193
.L199:
	ldrb	w0, [x1, 705]
	cbz	w0, .L193
	b	.L183
.L200:
	mov	w7, 0
	b	.L184
	.size	MVC_SlidingWinMark.part.2, .-MVC_SlidingWinMark.part.2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UnMarkLTFrmByFrmIdx
	.type	MVC_UnMarkLTFrmByFrmIdx, %function
MVC_UnMarkLTFrmByFrmIdx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	x0, x20, 11124736
	ldr	w2, [x0, 420]
	cbz	w2, .L260
	sub	w4, w2, #1
	add	x0, x0, 280
	add	x4, x4, 1388544
	add	x5, x20, 11153408
	add	x4, x4, 2084
	add	x4, x20, x4, lsl 3
	b	.L263
	.p2align 3
.L262:
	cmp	x0, x4
	beq	.L260
.L263:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldr	w3, [x1, 28]
	cmp	w3, w19
	bne	.L262
	ldr	w3, [x1, 56]
	ldr	w2, [x5, 2824]
	cmp	w3, w2
	bne	.L262
	mov	x0, x20
	bl	MVC_UnMarkFrameStoreRef
.L260:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_UnMarkLTFrmByFrmIdx, .-MVC_UnMarkLTFrmByFrmIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UnMarkLTFldByFrmIdx
	.type	MVC_UnMarkLTFldByFrmIdx, %function
MVC_UnMarkLTFldByFrmIdx:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x22, x1
	mov	w20, w2
	mov	w19, w3
	bl	_mcount
	add	x0, x21, 11124736
	ldr	w4, [x0, 420]
	cbz	w4, .L268
	sub	w6, w4, #1
	add	x0, x0, 280
	add	x6, x6, 1388544
	add	x7, x21, 11153408
	add	x6, x6, 2084
	add	x6, x21, x6, lsl 3
	b	.L272
	.p2align 3
.L270:
	cmp	x0, x6
	beq	.L268
.L272:
	ldr	x4, [x0]
	add	x0, x0, 8
	ldr	w5, [x4, 28]
	cmp	w5, w19
	bne	.L270
	ldr	w5, [x4, 56]
	ldr	w3, [x7, 2824]
	cmp	w5, w3
	bne	.L270
	cmp	w20, 1
	beq	.L284
	cmp	w20, 2
	bne	.L270
	ldrb	w1, [x4, 657]
	cmp	w1, wzr
	ccmp	x4, x22, 0, ne
	beq	.L270
.L283:
	mov	x1, x4
	mov	x0, x21
	bl	MVC_UnMarkFrameStoreRef
.L268:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L284:
	ldrb	w1, [x4, 705]
	cmp	w1, wzr
	ccmp	x4, x22, 0, ne
	beq	.L270
	b	.L283
	.size	MVC_UnMarkLTFldByFrmIdx, .-MVC_UnMarkLTFldByFrmIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UnMarkSTRef
	.type	MVC_UnMarkSTRef, %function
MVC_UnMarkSTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	mov	w21, w2
	bl	_mcount
	ldrb	w0, [x20, 3]
	cbnz	w0, .L286
	add	x0, x19, 11124736
	ldr	w3, [x20, 568]
	sub	w3, w3, #1
	ldr	w1, [x0, 416]
	sub	w2, w3, w21
	cbz	w1, .L285
	sub	w4, w1, #1
	add	x0, x0, 152
	add	x4, x4, 1388544
	add	x5, x19, 11153408
	add	x4, x4, 2068
	add	x4, x19, x4, lsl 3
	b	.L292
	.p2align 3
.L291:
	cmp	x0, x4
	beq	.L285
.L292:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldr	w3, [x1, 628]
	cmp	w3, w2
	bne	.L291
	ldrb	w3, [x1, 3]
	cmp	w3, 3
	bne	.L291
	ldr	w3, [x1, 608]
	and	w3, w3, 16776960
	cmp	w3, 65536
	bne	.L291
	ldr	w6, [x1, 56]
	ldr	w3, [x5, 2824]
	cmp	w6, w3
	bne	.L291
	mov	x0, x19
	bl	MVC_UnMarkFrameStoreRef
.L285:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L286:
	add	x1, x19, 11124736
	ldr	w0, [x20, 568]
	add	x4, x1, 152
	mov	w3, 0
	lsl	w0, w0, 1
	add	x8, x19, 11153408
	ldr	w6, [x1, 416]
	sub	w2, w0, w21
	cbz	w6, .L285
	.p2align 2
.L306:
	ldr	x1, [x4]
	add	x4, x4, 8
	ldrb	w0, [x1, 3]
	and	w7, w0, 1
	tbz	x0, 0, .L293
	ldr	w5, [x1, 656]
	and	w5, w5, 16776960
	cmp	w5, 65536
	beq	.L313
.L293:
	tbz	x0, 1, .L295
	ldr	w0, [x1, 704]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L314
.L295:
	add	w3, w3, 1
	cmp	w3, w6
	bne	.L306
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L313:
	ldr	w9, [x1, 56]
	ldr	w5, [x8, 2824]
	cmp	w9, w5
	bne	.L293
	ldr	w5, [x1, 676]
	cmp	w5, w2
	bne	.L293
	add	x2, x19, x3, uxtw 3
	and	w0, w0, 2
	add	x2, x2, 11124736
	strb	w0, [x1, 3]
	ldr	x0, [x2, 152]
	strb	wzr, [x0, 658]
	ldr	x0, [x2, 152]
	ldrb	w1, [x0, 608]
	cmp	w1, 3
	ccmp	w1, wzr, 4, ne
	bne	.L294
	strb	wzr, [x0, 610]
	ldr	x0, [x2, 152]
	strb	wzr, [x0, 609]
	ldr	x0, [x2, 152]
.L294:
	ldrb	w1, [x0, 3]
	cbnz	w1, .L285
	ldr	w1, [x0, 48]
	mov	w2, 0
	add	x1, x19, x1, lsl 2
	str	wzr, [x1, 148]
	ldrsb	w1, [x0, 6]
	ldr	w0, [x19, 120]
	bl	FSP_SetRef
	b	.L285
	.p2align 3
.L314:
	ldr	w5, [x1, 56]
	ldr	w0, [x8, 2824]
	cmp	w5, w0
	bne	.L295
	ldr	w0, [x1, 724]
	cmp	w0, w2
	bne	.L295
	add	x0, x19, x3, uxtw 3
	strb	w7, [x1, 3]
	add	x0, x0, 11124736
	ldr	x1, [x0, 152]
	strb	wzr, [x1, 706]
	ldr	x1, [x0, 152]
	ldrb	w2, [x1, 608]
	cmp	w2, 3
	ccmp	w2, wzr, 4, ne
	bne	.L296
	strb	wzr, [x1, 610]
	ldr	x1, [x0, 152]
	strb	wzr, [x1, 609]
	ldr	x1, [x0, 152]
.L296:
	ldrb	w0, [x1, 3]
	cbnz	w0, .L285
	ldr	w0, [x1, 48]
	mov	w2, 0
	add	x0, x19, x0, lsl 2
	str	wzr, [x0, 148]
	ldrsb	w1, [x1, 6]
	ldr	w0, [x19, 120]
	bl	FSP_SetRef
	b	.L285
	.size	MVC_UnMarkSTRef, .-MVC_UnMarkSTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UnMarkLTRef
	.type	MVC_UnMarkLTRef, %function
MVC_UnMarkLTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x1
	mov	x19, x0
	mov	x0, x30
	mov	w20, w2
	bl	_mcount
	ldrb	w0, [x21, 3]
	cbz	w0, .L316
	add	x0, x19, 11124736
	mov	w3, 0
	add	x4, x0, 280
	add	x2, x19, 11153408
	ldr	w6, [x0, 420]
	cbz	w6, .L315
	.p2align 2
.L336:
	ldr	x1, [x4]
	add	x4, x4, 8
	ldrb	w0, [x1, 3]
	and	w7, w0, 1
	tbz	x0, 0, .L321
	ldr	w5, [x1, 656]
	and	w5, w5, 16776960
	cmp	w5, 256
	beq	.L343
.L321:
	tbz	x0, 1, .L323
	ldr	w0, [x1, 704]
	and	w0, w0, 16776960
	cmp	w0, 256
	beq	.L344
.L323:
	add	w3, w3, 1
	cmp	w3, w6
	bne	.L336
.L315:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L343:
	ldr	w8, [x1, 56]
	ldr	w5, [x2, 2824]
	cmp	w8, w5
	bne	.L321
	ldr	w5, [x1, 672]
	cmp	w20, w5
	bne	.L321
	add	x2, x19, x3, uxtw 3
	and	w0, w0, 2
	add	x2, x2, 11124736
	strb	w0, [x1, 3]
	ldr	x0, [x2, 280]
	strb	wzr, [x0, 657]
	ldr	x0, [x2, 280]
	ldrb	w1, [x0, 608]
	cmp	w1, 3
	ccmp	w1, wzr, 4, ne
	bne	.L322
	strb	wzr, [x0, 610]
	ldr	x0, [x2, 280]
	strb	wzr, [x0, 609]
	ldr	x0, [x2, 280]
.L322:
	ldrb	w1, [x0, 3]
	cbnz	w1, .L315
	ldr	w1, [x0, 48]
	mov	w2, 0
	add	x1, x19, x1, lsl 2
	str	wzr, [x1, 148]
	ldrsb	w1, [x0, 6]
	ldr	w0, [x19, 120]
	bl	FSP_SetRef
	b	.L315
	.p2align 3
.L344:
	ldr	w5, [x1, 56]
	ldr	w0, [x2, 2824]
	cmp	w5, w0
	bne	.L323
	ldr	w0, [x1, 720]
	cmp	w20, w0
	bne	.L323
	add	x0, x19, x3, uxtw 3
	strb	w7, [x1, 3]
	add	x0, x0, 11124736
	ldr	x1, [x0, 280]
	strb	wzr, [x1, 705]
	ldr	x1, [x0, 280]
	ldrb	w2, [x1, 608]
	cmp	w2, 3
	ccmp	w2, wzr, 4, ne
	bne	.L324
	strb	wzr, [x1, 610]
	ldr	x1, [x0, 280]
	strb	wzr, [x1, 609]
	ldr	x1, [x0, 280]
.L324:
	ldrb	w0, [x1, 3]
	cbnz	w0, .L315
	ldr	w0, [x1, 48]
	mov	w2, 0
	add	x0, x19, x0, lsl 2
	str	wzr, [x0, 148]
	ldrsb	w1, [x1, 6]
	ldr	w0, [x19, 120]
	bl	FSP_SetRef
	b	.L315
	.p2align 3
.L316:
	add	x0, x19, 11124736
	ldr	w1, [x0, 420]
	cbz	w1, .L315
	sub	w4, w1, #1
	add	x0, x0, 280
	add	x4, x4, 1388544
	add	x5, x19, 11153408
	add	x4, x4, 2084
	add	x4, x19, x4, lsl 3
	b	.L327
	.p2align 3
.L326:
	cmp	x0, x4
	beq	.L315
.L327:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldr	w3, [x1, 624]
	cmp	w3, w20
	bne	.L326
	ldrb	w2, [x1, 3]
	cmp	w2, 3
	bne	.L326
	ldr	w2, [x1, 608]
	and	w2, w2, 16776960
	cmp	w2, 256
	bne	.L326
	ldr	w3, [x1, 56]
	ldr	w2, [x5, 2824]
	cmp	w3, w2
	bne	.L326
	mov	x0, x19
	bl	MVC_UnMarkFrameStoreRef
	b	.L315
	.size	MVC_UnMarkLTRef, .-MVC_UnMarkLTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_MarkPicLTRef
	.type	MVC_MarkPicLTRef, %function
MVC_MarkPicLTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x3
	mov	x21, x0
	mov	x0, x30
	mov	w20, w2
	mov	w19, w1
	bl	_mcount
	ldrb	w2, [x22, 3]
	add	x0, x21, 11124736
	cbz	w2, .L346
	ldr	w7, [x0, 416]
	mov	w3, 0
	add	x4, x0, 152
	add	x8, x21, 11153408
	cbz	w7, .L345
	.p2align 2
.L367:
	ldr	x0, [x4]
	ldrb	w5, [x0, 3]
	tbz	x5, 0, .L352
	ldr	w6, [x0, 656]
	and	w6, w6, 16776960
	cmp	w6, 65536
	beq	.L373
.L352:
	tbz	x5, 1, .L355
	ldr	w1, [x0, 704]
	and	w1, w1, 16776960
	cmp	w1, 65536
	beq	.L374
.L355:
	add	w3, w3, 1
	add	x4, x4, 8
	cmp	w3, w7
	bne	.L367
.L345:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L373:
	ldr	w1, [x0, 676]
	cmp	w20, w1
	bne	.L352
	ldr	w6, [x0, 56]
	ldr	w1, [x8, 2824]
	cmp	w6, w1
	bne	.L352
	ldrb	w1, [x0, 705]
	cmp	w1, 1
	bne	.L356
	ldr	w1, [x0, 28]
	cmp	w19, w1
	bne	.L355
.L356:
	add	x3, x21, x3, uxtw 3
	str	w19, [x0, 28]
	add	x0, x3, 11124736
	cmp	w2, 1
	lsl	w1, w19, 1
	mov	w2, 1
	csinc	w1, w1, w1, ne
	ldr	x3, [x0, 152]
	str	w1, [x3, 672]
	ldr	x1, [x0, 152]
	strb	w2, [x1, 657]
	ldr	x1, [x0, 152]
	strb	wzr, [x1, 658]
	ldr	x1, [x0, 152]
	ldrb	w2, [x1, 608]
	cmp	w2, 3
	ccmp	w2, wzr, 4, ne
	bne	.L345
	ldrb	w3, [x1, 657]
	ldrb	w2, [x1, 705]
	cmp	w2, w3
	bne	.L345
	strb	w2, [x1, 609]
	ldr	x0, [x0, 152]
	ldrb	w1, [x0, 658]
	strb	w1, [x0, 610]
	b	.L345
	.p2align 3
.L374:
	ldr	w1, [x0, 724]
	cmp	w1, w20
	bne	.L355
	ldr	w5, [x0, 56]
	ldr	w1, [x8, 2824]
	cmp	w5, w1
	bne	.L355
	ldrb	w1, [x0, 657]
	cmp	w1, 1
	bne	.L359
	ldr	w1, [x0, 28]
	cmp	w1, w19
	bne	.L355
.L359:
	add	x3, x21, x3, uxtw 3
	str	w19, [x0, 28]
	add	x0, x3, 11124736
	cmp	w2, 2
	lsl	w1, w19, 1
	mov	w2, 1
	csinc	w1, w1, w1, ne
	ldr	x3, [x0, 152]
	str	w1, [x3, 720]
	ldr	x1, [x0, 152]
	strb	w2, [x1, 705]
	ldr	x1, [x0, 152]
	strb	wzr, [x1, 706]
	ldr	x1, [x0, 152]
	ldrb	w2, [x1, 608]
	cmp	w2, 3
	ccmp	w2, wzr, 4, ne
	bne	.L345
	ldrb	w3, [x1, 657]
	ldrb	w2, [x1, 705]
	cmp	w2, w3
	bne	.L345
	strb	w2, [x1, 609]
	ldr	x0, [x0, 152]
	ldrb	w1, [x0, 706]
	strb	w1, [x0, 610]
	b	.L345
	.p2align 3
.L346:
	ldr	w6, [x0, 416]
	cbz	w6, .L345
	add	x0, x0, 152
	mov	w1, 0
	add	x3, x21, 11153408
	b	.L351
	.p2align 3
.L350:
	add	w1, w1, 1
	cmp	w1, w6
	beq	.L345
.L351:
	ldr	x4, [x0]
	add	x0, x0, 8
	ldrb	w5, [x4, 3]
	cmp	w5, 3
	bne	.L350
	ldr	w5, [x4, 608]
	and	w5, w5, 16776960
	cmp	w5, 65536
	bne	.L350
	ldr	w2, [x4, 628]
	cmp	w20, w2
	bne	.L350
	ldr	w2, [x3, 2824]
	ldr	w5, [x4, 56]
	cmp	w5, w2
	bne	.L350
	add	x0, x21, x1, uxtw 3
	str	w19, [x4, 28]
	add	x0, x0, 11124736
	mov	w1, 1
	ldr	x2, [x0, 152]
	str	w19, [x2, 624]
	ldr	x2, [x0, 152]
	strb	w1, [x2, 609]
	ldr	x2, [x0, 152]
	strb	w1, [x2, 657]
	ldr	x2, [x0, 152]
	strb	w1, [x2, 705]
	ldr	x1, [x0, 152]
	strb	wzr, [x1, 610]
	ldr	x1, [x0, 152]
	strb	wzr, [x1, 658]
	ldr	x0, [x0, 152]
	strb	wzr, [x0, 706]
	b	.L345
	.size	MVC_MarkPicLTRef, .-MVC_MarkPicLTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_MarkSTToLTRef
	.type	MVC_MarkSTToLTRef, %function
MVC_MarkSTToLTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x1
	mov	x21, x0
	mov	x0, x30
	mov	w20, w2
	mov	w19, w3
	bl	_mcount
	ldrb	w0, [x22, 3]
	cbnz	w0, .L376
	ldr	w2, [x22, 568]
	mov	w1, w19
	mov	x0, x21
	sub	w2, w2, #1
	sub	w20, w2, w20
	bl	MVC_UnMarkLTFrmByFrmIdx
.L377:
	mov	x3, x22
	mov	w2, w20
	mov	w1, w19
	mov	x0, x21
	bl	MVC_MarkPicLTRef
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L376:
	add	x0, x21, 11124736
	ldr	w3, [x22, 568]
	lsl	w3, w3, 1
	ldr	w1, [x0, 416]
	sub	w20, w3, w20
	cbz	w1, .L377
	sub	w5, w1, #1
	add	x0, x0, 152
	add	x5, x5, 1388544
	add	x6, x21, 11153408
	add	x5, x5, 2068
	add	x5, x21, x5, lsl 3
	.p2align 2
.L380:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w3, [x1, 3]
	tbz	x3, 0, .L378
	ldr	w4, [x1, 656]
	and	w4, w4, 16776960
	cmp	w4, 65536
	beq	.L391
.L378:
	tbz	x3, 1, .L379
	ldr	w3, [x1, 704]
	and	w3, w3, 16776960
	cmp	w3, 65536
	beq	.L392
.L379:
	cmp	x0, x5
	bne	.L380
	b	.L377
	.p2align 3
.L391:
	ldr	w2, [x1, 676]
	cmp	w2, w20
	bne	.L378
	ldr	w4, [x1, 56]
	ldr	w2, [x6, 2824]
	cmp	w4, w2
	bne	.L378
	mov	w3, w19
	mov	w2, 1
	mov	x0, x21
	bl	MVC_UnMarkLTFldByFrmIdx
	b	.L377
	.p2align 3
.L392:
	ldr	w2, [x1, 724]
	cmp	w2, w20
	bne	.L379
	ldr	w3, [x1, 56]
	ldr	w2, [x6, 2824]
	cmp	w3, w2
	bne	.L379
	mov	w3, w19
	mov	w2, 2
	mov	x0, x21
	bl	MVC_UnMarkLTFldByFrmIdx
	b	.L377
	.size	MVC_MarkSTToLTRef, .-MVC_MarkSTToLTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UpdateMaxLTFrmIdx
	.type	MVC_UpdateMaxLTFrmIdx, %function
MVC_UpdateMaxLTFrmIdx:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	add	x21, x22, 11124736
	mov	w20, w1
	bl	_mcount
	ldr	w0, [x21, 420]
	str	w20, [x21, 424]
	cbz	w0, .L393
	mov	w2, w20
	mov	w19, 0
	add	x20, x22, 11153408
	b	.L395
	.p2align 3
.L401:
	ldr	w2, [x21, 424]
.L395:
	uxtw	x0, w19
	add	w19, w19, 1
	add	x0, x0, 1388544
	add	x0, x22, x0, lsl 3
	ldr	x1, [x0, 16664]
	ldr	w0, [x1, 28]
	cmp	w0, w2
	bcc	.L396
	ldr	w2, [x1, 56]
	ldr	w0, [x20, 2824]
	cmp	w2, w0
	beq	.L400
.L396:
	ldr	w0, [x21, 420]
	cmp	w0, w19
	bhi	.L401
.L393:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L400:
	mov	x0, x22
	bl	MVC_UnMarkFrameStoreRef
	b	.L396
	.size	MVC_UpdateMaxLTFrmIdx, .-MVC_UpdateMaxLTFrmIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UnMarkAllSTRef
	.type	MVC_UnMarkAllSTRef, %function
MVC_UnMarkAllSTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 11124736
	mov	w19, 0
	bl	_mcount
	add	x22, x20, 11153408
	ldr	w0, [x21, 416]
	cbnz	w0, .L407
	b	.L402
	.p2align 3
.L404:
	ldr	w0, [x21, 416]
	cmp	w0, w19
	bls	.L402
.L407:
	uxtw	x0, w19
	ldr	w2, [x22, 2824]
	add	x0, x0, 1388544
	add	w19, w19, 1
	add	x0, x20, x0, lsl 3
	ldr	x1, [x0, 16536]
	ldr	w0, [x1, 56]
	cmp	w0, w2
	bne	.L404
	mov	x0, x20
	bl	MVC_UnMarkFrameStoreRef
	ldr	w0, [x21, 416]
	cmp	w0, w19
	bhi	.L407
.L402:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MVC_UnMarkAllSTRef, .-MVC_UnMarkAllSTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_MarkCurrPicLT
	.type	MVC_MarkCurrPicLT, %function
MVC_MarkCurrPicLT:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x1
	mov	x21, x0
	mov	x0, x30
	mov	w20, w2
	bl	_mcount
	ldrb	w2, [x19, 3]
	cbz	w2, .L412
	ldr	x1, [x19, 552]
	mov	w3, w20
	mov	x0, x21
	bl	MVC_UnMarkLTFldByFrmIdx
	strb	wzr, [x19, 5]
	str	w20, [x19, 572]
	mov	w0, 1
	strb	w0, [x19, 4]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L412:
	mov	w1, w20
	mov	x0, x21
	bl	MVC_UnMarkLTFrmByFrmIdx
	strb	wzr, [x19, 5]
	str	w20, [x19, 572]
	mov	w0, 1
	strb	w0, [x19, 4]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MVC_MarkCurrPicLT, .-MVC_MarkCurrPicLT
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_RemoveFrameStoreOutDPB
	.type	MVC_RemoveFrameStoreOutDPB, %function
MVC_RemoveFrameStoreOutDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w1
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, x19, uxtw 3
	add	x19, x19, 11124736
	bl	_mcount
	ldr	x1, [x19, 24]
	cbz	x1, .L413
	ldr	w0, [x1, 52]
	add	x21, x20, 11124736
	add	x0, x20, x0
	add	x0, x0, 11124736
	strb	wzr, [x0, 432]
	ldr	w0, [x21, 644]
	cmp	w0, wzr
	cset	w2, ne
	sub	w0, w0, w2
	str	w0, [x21, 644]
	ldrsb	w1, [x1, 6]
	ldr	w0, [x20, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L416
	ldr	w0, [x0, 20]
	cmp	w0, 3
	beq	.L417
	ldr	x1, [x19, 24]
	mov	w2, 0
	ldr	w0, [x20, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetDisplay
.L417:
	ldr	x1, [x19, 24]
	mov	w2, 0
	ldr	w0, [x20, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetRef
.L416:
	ldr	x0, [x19, 24]
	strb	wzr, [x0, 2]
	ldr	x0, [x19, 24]
	strb	wzr, [x0, 5]
	ldr	x0, [x19, 24]
	strb	wzr, [x0, 3]
	str	xzr, [x19, 24]
	ldr	w0, [x21, 412]
	sub	w0, w0, #1
	str	w0, [x21, 412]
.L413:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MVC_RemoveFrameStoreOutDPB, .-MVC_RemoveFrameStoreOutDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_RemoveUnUsedFrameStore
	.type	MVC_RemoveUnUsedFrameStore, %function
MVC_RemoveUnUsedFrameStore:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x23, x0
	mov	x0, x30
	mov	w22, w1
	mov	w19, 0
	bl	_mcount
	add	x0, x23, 11124736
	add	x20, x0, 24
	ldr	w21, [x0, 408]
	cbz	w21, .L445
	.p2align 2
.L440:
	ldr	x2, [x20]
	add	x20, x20, 8
	cbz	x2, .L431
	ldrb	w0, [x2, 3]
	cbnz	w0, .L431
	ldrb	w0, [x2, 5]
	cbnz	w0, .L431
	ldr	w0, [x2, 56]
	cmp	w0, w22
	ccmn	w22, #1, 4, ne
	beq	.L446
	.p2align 2
.L431:
	add	w19, w19, 1
	cmp	w21, w19
	bne	.L440
.L445:
	mov	w0, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L446:
	ldr	w3, [x2, 16]
	mov	w1, w19
	mov	x0, x23
	cmp	w3, 1
	beq	.L431
	strb	wzr, [x2, 2]
	bl	MVC_RemoveFrameStoreOutDPB
	b	.L431
	.size	MVC_RemoveUnUsedFrameStore, .-MVC_RemoveUnUsedFrameStore
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_CheckFrameStore
	.type	MVC_CheckFrameStore, %function
MVC_CheckFrameStore:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldrb	w0, [x20, 6]
	cbnz	w0, .L448
	ldrsb	w0, [x19, 8]
	cmp	w0, 1
	bne	.L463
	strb	w0, [x20, 6]
.L448:
	ldrsb	w1, [x19, 6]
	ldr	w0, [x20, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L450
	ldr	w4, [x0, 20]
	cmp	w4, wzr
	ccmp	w4, 3, 4, ne
	beq	.L451
	ldrb	w3, [x19, 2]
	ldrb	w4, [x19, 1]
	cbz	w3, .L454
	cmp	w4, 1
	beq	.L454
	mov	x1, 16711680
	ldr	x4, [x19]
	movk	x1, 0xff, lsl 32
	mov	x2, 196608
	movk	x2, 0x3, lsl 32
	and	x1, x4, x1
	cmp	x1, x2
	beq	.L475
	cmp	w3, 1
	beq	.L476
	cmp	w3, 2
	beq	.L477
.L458:
	ldr	x1, [x20, 224]
	ldr	w3, [x0, 152]
	mov	w0, 0
	ldr	w4, [x1, 4]
	cmp	w3, w4
	bls	.L469
	ldr	x2, .LC28
	mov	w1, 1176
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L469
	.p2align 3
.L451:
	ldr	w1, [x19, 16]
	cmp	w1, 1
	beq	.L478
.L462:
	ldr	x3, .LC14
	mov	w1, 1143
	ldr	x2, .LC18
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -3
.L469:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L476:
	ldrb	w4, [x19, 4]
	tbz	x4, 0, .L458
	ldr	x2, .LC24
	mov	w1, 1164
	mov	w0, w3
	bl	dprint_normal
	mov	w0, -1
	b	.L469
	.p2align 3
.L478:
	mov	w1, 2
	str	w1, [x19, 16]
	ldr	w4, [x0, 20]
	b	.L462
	.p2align 3
.L450:
	ldr	w0, [x19, 16]
	cmp	w0, 1
	bne	.L460
	mov	w0, 2
	str	w0, [x19, 16]
.L460:
	ldr	x3, .LC14
	mov	w1, 1139
	ldr	x2, .LC16
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -3
	b	.L469
	.p2align 3
.L477:
	ldrb	w4, [x19, 4]
	tbz	x4, 1, .L458
	ldr	x2, .LC26
	mov	w1, 1170
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L469
	.p2align 3
.L463:
	mov	w0, -1
	b	.L469
.L454:
	ldr	x2, .LC20
	mov	w1, 1152
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L469
.L475:
	ldrb	w4, [x19, 4]
	mov	w1, 1158
	ldr	x2, .LC22
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L469
	.size	MVC_CheckFrameStore, .-MVC_CheckFrameStore
	.align	3
.LC14:
	.xword	.LANCHOR0
	.align	3
.LC16:
	.xword	.LC15
	.align	3
.LC18:
	.xword	.LC17
	.align	3
.LC20:
	.xword	.LC19
	.align	3
.LC22:
	.xword	.LC21
	.align	3
.LC24:
	.xword	.LC23
	.align	3
.LC26:
	.xword	.LC25
	.align	3
.LC28:
	.xword	.LC27
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ExchangePts
	.type	MVC_ExchangePts, %function
MVC_ExchangePts:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x24, x1
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x24, 280]
	cmn	x0, #1
	beq	.L479
	add	x25, x21, 11124736
	ldr	w0, [x25, 408]
	cbz	w0, .L479
	mov	w23, -1
	mov	w20, 0
	mov	x22, -2
	.p2align 2
.L484:
	add	x19, x21, x20, sxtw 3
	add	x19, x19, 11124736
	ldr	x0, [x19, 24]
	cbz	x0, .L483
	ldrsb	w1, [x0, 6]
	ldr	w0, [x21, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L483
	ldr	w0, [x0, 20]
	cmp	w0, 3
	ccmp	w0, wzr, 4, ne
	beq	.L483
	ldr	x0, [x19, 24]
	ldr	x0, [x0, 280]
	cmp	x0, x22
	bcs	.L483
	mov	w23, w20
	mov	x22, x0
	.p2align 2
.L483:
	ldr	w0, [x25, 408]
	add	w20, w20, 1
	cmp	w0, w20
	bhi	.L484
	cmn	w23, #1
	beq	.L479
	ldr	x4, [x24, 280]
	cmp	x22, x4
	bcc	.L498
.L479:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L498:
	ldr	w3, [x21, 120]
	mov	x5, x22
	ldr	x2, .LC30
	mov	w1, 1224
	mov	w0, 24
	bl	dprint_normal
	sxtw	x0, w23
	ldr	x1, [x24, 280]
	add	x0, x0, 1388544
	add	x21, x21, x0, lsl 3
	ldr	x0, [x21, 16408]
	str	x1, [x0, 280]
	str	x22, [x24, 280]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	MVC_ExchangePts, .-MVC_ExchangePts
	.align	3
.LC30:
	.xword	.LC29
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetImagePara
	.type	MVC_GetImagePara, %function
MVC_GetImagePara:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	add	x4, x20, 11116544
	mov	w1, 2240
	ldp	x7, x9, [x20, 272]
	ldrb	w3, [x19, 229]
	mov	w8, 3992
	ldr	w2, [x4, 2472]
	ldrb	w0, [x19, 228]
	and	w5, w3, -4
	ldrb	w6, [x19, 2]
	mov	w3, w5
	umull	x1, w2, w1
	and	w0, w0, -4
	cmp	w6, 3
	add	x1, x9, x1
	ldr	w2, [x1, 28]
	strb	w5, [x19, 229]
	strb	w0, [x19, 228]
	umull	x1, w2, w8
	ldr	w2, [x20, 56]
	str	w2, [x19, 136]
	add	x1, x7, x1
	bhi	.L500
	ldr	x2, .LC31
	ldrb	w2, [x2,w6,uxtw]
	adr	x5, .Lrtx502
	add	x2, x5, w2, sxtb #2
	br	x2
.Lrtx502:
	.section	.rodata
	.align	0
	.align	2
.L502:
	.byte	(.L501 - .Lrtx502) / 4
	.byte	(.L503 - .Lrtx502) / 4
	.byte	(.L504 - .Lrtx502) / 4
	.byte	(.L501 - .Lrtx502) / 4
	.text
	.p2align 3
.L504:
	mov	w2, 2
	bfi	w3, w2, 2, 2
.L503:
	ldrb	w7, [x19]
	orr	w2, w3, 3
	ldr	w5, [x19, 44]
	mov	w3, w2
	bfi	w0, w7, 0, 2
	strb	w2, [x19, 229]
	strb	w0, [x19, 228]
	str	w5, [x19, 168]
.L500:
	ldrb	w2, [x1, 20]
	mov	w0, 0
	str	w2, [x19, 572]
	str	w2, [x19, 576]
	ldrb	w2, [x1, 24]
	cbz	w2, .L518
	ldr	w0, [x1, 68]
.L518:
	str	w0, [x19, 584]
	mov	w0, 1
	str	w0, [x19, 580]
	ldrb	w0, [x4, 2467]
	cmp	w0, 1
	csel	w0, w0, wzr, eq
	str	w0, [x19, 188]
	ldr	x0, [x20, 224]
	ldr	w0, [x0, 12]
	cbz	w0, .L521
	ldrb	w0, [x19, 608]
	cbz	w0, .L543
.L521:
	add	x3, x20, 11120640
	ldrsb	w0, [x3, 4072]
	cbz	w0, .L522
	ldr	w0, [x3, 4088]
	cmp	w0, 3
	beq	.L544
	cmp	w0, 4
	beq	.L545
	cmp	w0, 5
	beq	.L546
	str	wzr, [x19, 224]
	mov	w1, 1427
	ldr	x2, .LC33
	mov	w0, 0
	ldr	w3, [x3, 4088]
	bl	dprint_normal
	.p2align 2
.L522:
	ldrsb	w1, [x19, 6]
	ldr	w0, [x20, 120]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L499
	ldrb	w5, [x19, 230]
	add	x19, x19, 72
	ldr	w4, [x0, 68]
	mov	x2, 536
	ldr	x6, .LC34
	mov	x1, x19
	str	w4, [x19, 68]
	ldrb	w4, [x0, 158]
	ubfx	x4, x4, 1, 1
	bfi	w5, w4, 1, 1
	strb	w5, [x19, 158]
	ldrb	w5, [x0, 420]
	strb	w5, [x19, 420]
	ldr	x4, [x6, 104]
	ldr	w5, [x0, 432]
	str	w5, [x19, 432]
	ldr	w5, [x0, 436]
	str	w5, [x19, 436]
	ldr	w5, [x0, 424]
	str	w5, [x19, 424]
	ldr	w5, [x0, 428]
	str	w5, [x19, 428]
	ldr	w3, [x0, 452]
	str	w3, [x19, 452]
	blr	x4
.L499:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L543:
	cmp	w6, 3
	bne	.L521
	and	w0, w3, -4
	strb	w0, [x19, 229]
	b	.L521
	.p2align 3
.L501:
	ldrb	w2, [x19, 608]
	cbnz	w2, .L505
	ldp	w2, w5, [x19, 40]
	str	w5, [x19, 168]
	ldrb	w8, [x19]
	cbnz	w2, .L527
	mov	w9, 2
	mov	w5, 3
.L506:
	ldr	w7, [x19, 680]
	ldr	w2, [x19, 728]
	cmp	w7, w2
	beq	.L547
	cset	w2, le
.L516:
	add	x7, x20, 11124736
	ldrb	w7, [x7, 12]
	cmp	w7, 3
	beq	.L528
	cmp	w7, 4
	mov	w7, 0
	csel	w2, w2, w7, ne
.L517:
	bfi	w3, w2, 4, 2
	bfi	w0, w8, 0, 2
	bfi	w3, w5, 2, 2
	strb	w0, [x19, 228]
	mov	w0, w3
	bfi	w0, w9, 0, 2
	strb	w0, [x19, 229]
	mov	w3, w0
	b	.L500
	.p2align 3
.L544:
	mov	w0, 1
	str	w0, [x19, 224]
	b	.L522
	.p2align 3
.L546:
	mov	w0, 3
	str	w0, [x19, 224]
	b	.L522
	.p2align 3
.L505:
	ldr	w7, [x19, 688]
	ldr	w2, [x20, 116]
	ldr	w11, [x19, 736]
	cmp	w7, w2
	bhi	.L548
	cmp	w2, w11
	bcc	.L510
.L508:
	ldr	w2, [x19, 44]
	mov	w5, 3
	ldrb	w8, [x19]
	ldrb	w9, [x19, 707]
	ldrb	w10, [x19, 659]
	str	w2, [x19, 168]
.L511:
	ldrb	w2, [x19, 4]
	cmp	w2, 1
	beq	.L549
	cmp	w2, 2
	beq	.L550
.L513:
	stp	w10, w9, [x19, 96]
	mov	w9, 3
	b	.L506
	.p2align 3
.L510:
	ldrb	w8, [x19, 659]
	mov	w5, 1
	ldrb	w9, [x19, 707]
	mov	w10, w8
	str	w7, [x19, 168]
	b	.L511
	.p2align 3
.L545:
	mov	w0, 2
	str	w0, [x19, 224]
	b	.L522
	.p2align 3
.L528:
	mov	w2, 1
	b	.L517
	.p2align 3
.L547:
	mov	x2, 720
	ldr	x7, [x19, 104]
	movk	x2, 0x1e0, lsl 32
	cmp	x7, x2
	cset	w2, ne
	b	.L516
	.p2align 3
.L548:
	cmp	w2, w11
	bcc	.L508
	ldrb	w8, [x19, 707]
	mov	w5, 2
	ldrb	w10, [x19, 659]
	mov	w9, w8
	str	w11, [x19, 168]
	b	.L511
	.p2align 3
.L527:
	mov	w9, 3
	mov	w5, w9
	b	.L506
	.p2align 3
.L549:
	mov	w8, w9
	mov	w5, 2
	str	w11, [x19, 168]
	b	.L513
	.p2align 3
.L550:
	mov	w8, w10
	mov	w5, 1
	str	w7, [x19, 168]
	b	.L513
	.size	MVC_GetImagePara, .-MVC_GetImagePara
	.align	3
.LC31:
	.xword	.L502
	.align	3
.LC33:
	.xword	.LC32
	.align	3
.LC34:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_SetFrmRepeatCount
	.type	MVC_SetFrmRepeatCount, %function
MVC_SetFrmRepeatCount:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 632]
	add	w0, w0, 2047
	cmp	w0, 4095
	bls	.L552
	mov	x1, x20
	mov	x0, x19
	bl	MVC_SetFrmRepeatCount.part.1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L552:
	str	wzr, [x20, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_SetFrmRepeatCount, .-MVC_SetFrmRepeatCount
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_SplitFrmToFlds
	.type	MVC_SplitFrmToFlds, %function
MVC_SplitFrmToFlds:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w4, [x19, 609]
	mov	w6, 1
	ldrb	w3, [x19, 610]
	mov	w5, 2
	ldrb	w1, [x19, 611]
	ldr	w2, [x19, 640]
	ldr	x0, [x19, 616]
	strb	w4, [x19, 657]
	strb	w3, [x19, 658]
	strb	w6, [x19, 656]
	strb	w1, [x19, 659]
	strb	w4, [x19, 705]
	strb	w3, [x19, 706]
	strb	w5, [x19, 704]
	strb	w1, [x19, 707]
	str	x0, [x19, 664]
	str	w2, [x19, 688]
	str	x0, [x19, 712]
	str	w2, [x19, 736]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_SplitFrmToFlds, .-MVC_SplitFrmToFlds
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_CombineFldsToFrm
	.type	MVC_CombineFldsToFrm, %function
MVC_CombineFldsToFrm:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 680]
	mov	w5, 3
	ldr	w3, [x19, 688]
	ldr	w2, [x19, 728]
	ldr	w0, [x19, 736]
	cmp	w1, w2
	ldr	x4, [x19, 664]
	add	w0, w3, w0
	ldrb	w3, [x19, 705]
	csel	w1, w1, w2, le
	lsr	w0, w0, 1
	strb	w5, [x19, 608]
	str	w1, [x19, 32]
	str	x4, [x19, 616]
	str	w1, [x19, 632]
	str	w0, [x19, 640]
	cbz	w3, .L556
	ldrb	w1, [x19, 657]
	cbz	w1, .L556
	mov	w1, 1
	strb	w1, [x19, 609]
.L558:
	mov	w3, 0
.L559:
	ldrb	w2, [x19, 707]
	ldrb	w1, [x19, 659]
	str	w0, [x19, 44]
	cmp	w1, w2, uxtb
	strb	w3, [x19, 610]
	csel	w0, w1, w2, cs
	strb	w0, [x19, 611]
	strb	w0, [x19]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L556:
	ldr	w1, [x19, 704]
	strb	wzr, [x19, 609]
	tst	w1, 16776960
	beq	.L558
	ldr	w1, [x19, 656]
	mov	w3, 1
	tst	w1, 16776960
	bne	.L559
	b	.L558
	.size	MVC_CombineFldsToFrm, .-MVC_CombineFldsToFrm
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetAPC
	.type	MVC_GetAPC, %function
MVC_GetAPC:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x21, x1
	mov	x0, x30
	mov	w19, w2
	bl	_mcount
	cbz	x21, .L592
	cmp	w19, 1
	beq	.L572
	cmp	w19, 2
	beq	.L573
	ldr	w23, [x21, 680]
	ldr	w24, [x21, 728]
.L574:
	add	x20, x22, 11124736
	ldr	w2, [x20, 640]
	cbz	w2, .L583
	ldrb	w0, [x20, 432]
	cbz	w0, .L593
	add	x0, x20, 433
	mov	w19, 0
	b	.L577
	.p2align 3
.L581:
	ldrb	w1, [x0], 1
	cbz	w1, .L575
.L577:
	add	w19, w19, 1
	cmp	w19, w2
	bne	.L581
.L583:
	mov	w0, -1
.L587:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L573:
	ldr	w23, [x21, 728]
	mov	w24, w23
	b	.L574
.L593:
	mov	w19, 0
	.p2align 2
.L575:
	ldrsb	w1, [x21, 6]
	ldr	w0, [x22, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L578
	ldr	x1, [x0, 24]
	cbz	x1, .L578
	uxtw	x1, w19
	mov	w3, 1
	add	x2, x22, x1
	mov	w5, 16
	add	x2, x2, 11124736
	add	x1, x22, x1, lsl 2
	add	x1, x1, 11124736
	mov	w4, w19
	strb	w3, [x2, 432]
	ldr	x2, .LC42
	ldr	x0, [x0, 24]
	ldr	w0, [x0, 36]
	str	w0, [x1, 448]
	mov	w0, 11
	str	w23, [x1, 512]
	str	w24, [x1, 576]
	mov	w1, 1722
	ldr	w3, [x20, 644]
	cmp	w3, 15
	csinc	w3, w5, w3, hi
	str	w3, [x20, 644]
	ldr	w3, [x21, 160]
	bl	dprint_normal
	str	w19, [x21, 52]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L572:
	ldr	w23, [x21, 680]
	mov	w24, w23
	b	.L574
.L578:
	ldrsb	w3, [x21, 6]
	mov	x5, x0
	ldrb	w4, [x21, 3]
	mov	x6, 0
	ldr	x2, .LC44
	mov	w1, 1730
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L587
.L592:
	mov	w4, 1688
	ldr	x3, .LC38
	ldr	x2, .LC40
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L587
	.size	MVC_GetAPC, .-MVC_GetAPC
	.align	3
.LC38:
	.xword	.LC37
	.align	3
.LC40:
	.xword	.LC39
	.align	3
.LC42:
	.xword	.LC41
	.align	3
.LC44:
	.xword	.LC43
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_SlidingWinMark
	.type	MVC_SlidingWinMark, %function
MVC_SlidingWinMark:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 11124736
	ldr	x0, [x19, 248]
	ldr	w2, [x1, 420]
	ldr	w0, [x0, 3944]
	ldr	w1, [x1, 416]
	sub	w0, w0, w2
	cmp	w1, w0
	bne	.L594
	mov	x0, x19
	bl	MVC_SlidingWinMark.part.2
.L594:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_SlidingWinMark, .-MVC_SlidingWinMark
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_SimpleSlideDPB
	.type	MVC_SimpleSlideDPB, %function
MVC_SimpleSlideDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 11153408
	bl	_mcount
	add	x0, x21, 11124736
	ldr	w19, [x0, 408]
	ldr	w1, [x0, 412]
	cmp	w1, w19
	bcc	.L597
	cbz	w19, .L602
	add	x0, x0, 24
	mov	w5, 0
	mov	w4, 2147483647
	mov	w1, 0
	.p2align 2
.L600:
	ldr	x2, [x0]
	add	x0, x0, 8
	cbz	x2, .L599
	ldr	w3, [x2, 64]
	cmp	w3, w4
	bcs	.L599
	ldr	w6, [x2, 56]
	ldr	w2, [x20, 2824]
	cmp	w6, w2
	csel	w4, w4, w3, ne
	csel	w5, w5, w1, ne
.L599:
	add	w1, w1, 1
	cmp	w19, w1
	bne	.L600
	mov	w19, w5
.L598:
	sxtw	x1, w5
	mov	x0, x21
	add	x1, x1, 1388544
	add	x1, x21, x1, lsl 3
	ldr	x1, [x1, 16408]
	bl	MVC_UnMarkFrameStoreRef
	mov	w1, w19
	mov	x0, x21
	bl	MVC_RemoveFrameStoreOutDPB
.L597:
	ldr	w0, [x20, 2760]
	strb	wzr, [x20, 2188]
	cbz	w0, .L596
	mov	w0, 1
	strb	w0, [x20, 2189]
.L596:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L602:
	mov	w5, 0
	b	.L598
	.size	MVC_SimpleSlideDPB, .-MVC_SimpleSlideDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ReleaseNAL
	.type	MVC_ReleaseNAL, %function
MVC_ReleaseNAL:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w21, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L620
	ldr	x23, .LC50
	add	x19, x20, 8
	strb	wzr, [x20, 1]
	add	x22, x20, 72
	strb	wzr, [x20, 3]
.L615:
	ldr	x1, [x19]
	mov	w0, w21
	cbz	x1, .L614
	ldr	w1, [x19, 28]
	bl	SM_ReleaseStreamSeg
	ldr	w4, [x19, 8]
	mov	x2, x23
	ldr	x3, [x19]
	mov	w1, 3254
	mov	w0, 8
	bl	dprint_normal
	str	xzr, [x19]
	str	wzr, [x19, 8]
	str	wzr, [x19, 20]
.L614:
	add	x19, x19, 32
	cmp	x19, x22
	bne	.L615
	strb	wzr, [x20]
	str	wzr, [x20, 76]
.L611:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L620:
	mov	w4, 3241
	ldr	x3, .LC47
	ldr	x2, .LC48
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	b	.L611
	.size	MVC_ReleaseNAL, .-MVC_ReleaseNAL
	.align	3
.LC47:
	.xword	.LC37
	.align	3
.LC48:
	.xword	.LC39
	.align	3
.LC50:
	.xword	.LC49
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ClearCurrNal
	.type	MVC_ClearCurrNal, %function
MVC_ClearCurrNal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19, 240]
	cbz	x1, .L622
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L622:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_ClearCurrNal, .-MVC_ClearCurrNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ClearCurrSlice
	.type	MVC_ClearCurrSlice, %function
MVC_ClearCurrSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC52
	mov	w1, 210
	mov	w0, 1
	bl	dprint_normal
	ldr	x1, [x19, 240]
	cbz	x1, .L627
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L627:
	ldr	w1, [x19, 80]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 80]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_ClearCurrSlice, .-MVC_ClearCurrSlice
	.align	3
.LC52:
	.xword	.LC51
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ClearAllNal
	.type	MVC_ClearAllNal, %function
MVC_ClearAllNal:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 12288
	add	x19, x21, 1520
	bl	_mcount
	add	x20, x20, 2384
	b	.L633
	.p2align 3
.L632:
	add	x19, x19, 96
	cmp	x19, x20
	beq	.L635
.L633:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L632
	ldr	w0, [x21, 120]
	mov	x1, x19
	add	x19, x19, 96
	bl	MVC_ReleaseNAL
	cmp	x19, x20
	bne	.L633
.L635:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	MVC_ClearAllNal, .-MVC_ClearAllNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ClearAllSlice
	.type	MVC_ClearAllSlice, %function
MVC_ClearAllSlice:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x19, x21, 11153408
	add	x20, x21, 11157504
	add	x19, x19, 3512
	add	x20, x20, 504
	bl	_mcount
	.p2align 2
.L638:
	ldr	x0, [x19]
	mov	x1, x0
	cbz	x0, .L637
	ldr	w0, [x21, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19]
.L637:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L638
	str	wzr, [x21, 64]
	mov	w0, 0
	str	wzr, [x21, 104]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MVC_ClearAllSlice, .-MVC_ClearAllSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ClearCurrPic
	.type	MVC_ClearCurrPic, %function
MVC_ClearCurrPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	MVC_ClearAllSlice
	add	x0, x19, 11120640
	ldr	w8, [x19, 40]
	mov	w7, 23352
	mov	w6, 2
	movk	w7, 0x1, lsl 16
	mov	w5, 7
	strb	wzr, [x0, 16]
	mov	w4, 32
	strb	w6, [x0, 17]
	mov	w3, 3
	strb	w5, [x0, 19]
	mov	w2, -1
	strb	w4, [x0, 18]
	mov	w1, 1048576
	stp	w8, w7, [x0, 28]
	stp	w3, w2, [x0, 40]
	stp	wzr, wzr, [x0, 48]
	str	w1, [x0, 56]
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_ClearCurrPic, .-MVC_ClearCurrPic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ArrangeVahbMem
	.type	MVC_ArrangeVahbMem, %function
MVC_ArrangeVahbMem:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w22, w1
	mov	w21, w2
	bl	_mcount
	ldr	x0, .LC53
	add	x4, x20, 11124736
	mov	x2, 36
	mov	w1, 0
	ldr	x3, [x0, 96]
	add	x0, x29, 56
	ldr	w19, [x4, 408]
	blr	x3
	add	w19, w19, 3
	add	x4, x20, 11112448
	ldr	x3, [x20, 224]
	mov	w5, 15
	ldr	w0, [x20, 120]
	str	w5, [x29, 56]
	mov	w2, 0
	ldr	w6, [x4, 3160]
	mov	w5, 8
	ldr	w4, [x4, 3164]
	add	x1, x29, 56
	stp	w6, w4, [x29, 72]
	stp	w22, w21, [x29, 64]
	ldr	w4, [x3, 16]
	strb	w5, [x29, 61]
	cmp	w4, 24
	csinc	w4, w19, wzr, ne
	str	w4, [x29, 80]
	ldr	w3, [x3, 16]
	cmp	w3, 24
	csinc	w19, w19, wzr, ne
	str	w19, [x29, 84]
	bl	FSP_ArrangeFsPool
	cmp	w0, 2
	beq	.L653
	mov	w1, 1
	cbnz	w0, .L654
.L648:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, w1
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L654:
	ldr	x3, .LC54
	mov	w1, 3298
	ldr	x2, .LC56
	mov	w0, 0
	bl	dprint_normal
	mov	w1, -20
	b	.L648
.L653:
	add	x0, x20, 912
	bl	ResetVoQueue
	mov	w1, -20
	b	.L648
	.size	MVC_ArrangeVahbMem, .-MVC_ArrangeVahbMem
	.align	3
.LC53:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC54:
	.xword	.LANCHOR1
	.align	3
.LC56:
	.xword	.LC55
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_RepairList
	.type	MVC_RepairList, %function
MVC_RepairList:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x6, x19, 11116544
	ldrb	w0, [x6, 2456]
	cmp	w0, 1
	beq	.L673
	cbz	w0, .L658
	cmp	w0, 2
	mov	w0, 0
	bne	.L669
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L669:
	mov	x0, x19
	bl	MVC_ClearCurrSlice
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L673:
	mov	w10, 2
.L657:
	add	x6, x6, 2504
	add	x5, x19, 288
	mov	x8, 0
	mov	w7, 0
	mov	w12, 1
	add	x11, x19, 11153408
	.p2align 2
.L670:
	ldr	w0, [x6]
	cbz	w0, .L660
	ldr	x1, [x5]
	cbnz	x1, .L684
	sub	w3, w0, #1
	add	x9, x8, 37
	add	x0, x5, 8
	add	x4, x9, x3, uxtw
	add	x4, x19, x4, lsl 3
	b	.L663
	.p2align 3
.L664:
	ldr	x2, [x0], 8
	cbnz	x2, .L671
.L663:
	cmp	x0, x4
	bne	.L664
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L669
	ldr	x2, [x11, 2736]
	add	x2, x2, 608
.L671:
	add	x3, x9, x3, uxtw
	mov	x0, x5
	add	x3, x19, x3, lsl 3
	cbz	x1, .L685
	.p2align 2
.L666:
	add	x0, x0, 8
	cmp	x3, x0
	beq	.L667
.L686:
	ldr	x1, [x0]
	cbnz	x1, .L666
.L685:
	str	x2, [x0]
	add	x0, x0, 8
	cmp	x3, x0
	bne	.L686
	.p2align 2
.L667:
	add	w7, w7, 1
	add	x6, x6, 4
	cmp	w7, w10
	add	x5, x5, 264
	add	x8, x8, 33
	bcc	.L670
.L687:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L660:
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L669
	str	w12, [x6]
	add	w7, w7, 1
	cmp	w7, w10
	add	x6, x6, 4
	ldr	x0, [x11, 2736]
	add	x8, x8, 33
	add	x0, x0, 608
	str	x0, [x5]
	add	x5, x5, 264
	bcc	.L670
	b	.L687
.L684:
	sub	w3, w0, #1
	mov	x2, x1
	add	x9, x8, 37
	b	.L671
.L658:
	mov	w10, 1
	b	.L657
	.size	MVC_RepairList, .-MVC_RepairList
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetShortTermPicPoint
	.type	MVC_GetShortTermPicPoint, %function
MVC_GetShortTermPicPoint:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	x0, x20, 11116544
	mov	w5, 0
	ldrb	w1, [x0, 2457]
	cbz	w1, .L689
	ldrb	w0, [x0, 2458]
	mov	w5, 2
	cmp	w0, wzr
	csinc	w5, w5, wzr, ne
.L689:
	add	x0, x20, 11124736
	ldr	w2, [x0, 416]
	cbz	w2, .L697
	sub	w2, w2, #1
	add	x0, x0, 152
	add	x2, x2, 1388544
	add	x2, x2, 2068
	add	x4, x20, x2, lsl 3
	b	.L694
	.p2align 3
.L707:
	cmp	w3, 3
	beq	.L706
.L692:
	add	x0, x0, 8
	cmp	x0, x4
	beq	.L697
.L694:
	ldr	x2, [x0]
	ldrb	w3, [x2, 3]
	cbz	w5, .L707
	tbz	x3, 0, .L693
	ldr	w6, [x2, 656]
	and	w6, w6, 16776960
	cmp	w6, 65536
	beq	.L708
.L693:
	tbz	x3, 1, .L692
	ldr	w3, [x2, 704]
	and	w3, w3, 16776960
	cmp	w3, 65536
	bne	.L692
	ldr	w1, [x2, 724]
	cmp	w19, w1
	bne	.L692
	add	x0, x2, 704
	b	.L690
	.p2align 3
.L708:
	ldr	w1, [x2, 676]
	cmp	w1, w19
	bne	.L693
	add	x0, x2, 656
	b	.L690
	.p2align 3
.L706:
	ldr	w3, [x2, 608]
	and	w3, w3, 16776960
	cmp	w3, 65536
	bne	.L692
	ldr	w1, [x2, 628]
	cmp	w19, w1
	bne	.L692
	add	x0, x2, 608
	b	.L690
	.p2align 3
.L697:
	mov	x0, 0
.L690:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_GetShortTermPicPoint, .-MVC_GetShortTermPicPoint
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetLongTermPicPoint
	.type	MVC_GetLongTermPicPoint, %function
MVC_GetLongTermPicPoint:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	x0, x20, 11116544
	mov	w5, 0
	ldrb	w1, [x0, 2457]
	cbz	w1, .L710
	ldrb	w0, [x0, 2458]
	mov	w5, 2
	cmp	w0, wzr
	csinc	w5, w5, wzr, ne
.L710:
	add	x0, x20, 11124736
	ldr	w2, [x0, 420]
	cbz	w2, .L718
	sub	w2, w2, #1
	add	x0, x0, 280
	add	x2, x2, 1388544
	add	x2, x2, 2084
	add	x4, x20, x2, lsl 3
	b	.L715
	.p2align 3
.L728:
	cmp	w3, 3
	beq	.L727
.L713:
	add	x0, x0, 8
	cmp	x0, x4
	beq	.L718
.L715:
	ldr	x2, [x0]
	ldrb	w3, [x2, 3]
	cbz	w5, .L728
	tbz	x3, 0, .L714
	ldr	w6, [x2, 656]
	and	w6, w6, 16776960
	cmp	w6, 256
	beq	.L729
.L714:
	tbz	x3, 1, .L713
	ldr	w3, [x2, 704]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L713
	ldr	w1, [x2, 720]
	cmp	w19, w1
	bne	.L713
	add	x0, x2, 704
	b	.L711
	.p2align 3
.L729:
	ldr	w1, [x2, 672]
	cmp	w1, w19
	bne	.L714
	add	x0, x2, 656
	b	.L711
	.p2align 3
.L727:
	ldr	w3, [x2, 608]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L713
	ldr	w1, [x2, 624]
	cmp	w19, w1
	bne	.L713
	add	x0, x2, 608
	b	.L711
	.p2align 3
.L718:
	mov	x0, 0
.L711:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_GetLongTermPicPoint, .-MVC_GetLongTermPicPoint
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ReorderSTList
	.type	MVC_ReorderSTList, %function
MVC_ReorderSTList:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	mov	w21, w2
	mov	w23, w3
	mov	x22, x4
	mov	w24, w5
	bl	_mcount
	uxtw	x6, w20
	mov	x0, x19
	lsl	x2, x6, 8
	mov	w1, w23
	add	x6, x2, x6, lsl 3
	add	x6, x6, 288
	add	x19, x19, x6
	bl	MVC_GetShortTermPicPoint
	ldr	w6, [x22]
	add	w2, w21, 1
	cmp	w2, w6
	ble	.L731
	mov	w1, w2
	.p2align 2
.L732:
	add	x6, x19, x1, sxtw 3
	ldr	x6, [x6, -8]
	str	x6, [x19, w1, sxtw 3]
	sub	w1, w1, #1
	ldr	w6, [x22]
	cmp	w6, w1
	blt	.L732
.L731:
	add	w1, w6, 1
	str	w1, [x22]
	str	x0, [x19, w6, sxtw 3]
	ldr	w0, [x22]
	cmp	w2, w0
	mov	w4, w0
	bge	.L740
	b	.L730
	.p2align 3
.L735:
	str	x1, [x19, w4, sxtw 3]
	add	w4, w4, 1
.L734:
	cmp	w2, w0
	blt	.L730
.L740:
	ldr	x1, [x19, w0, sxtw 3]
	add	w0, w0, 1
	cbz	x1, .L734
	ldrb	w6, [x1, 1]
	cbnz	w6, .L735
	ldr	w6, [x1, 20]
	cmp	w23, w6
	bne	.L735
	ldr	x3, [x1, 8]
	ldr	w3, [x3, 56]
	cmp	w3, w24
	bne	.L735
	cmp	w2, w0
	bge	.L740
.L730:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	MVC_ReorderSTList, .-MVC_ReorderSTList
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ReorderLTList
	.type	MVC_ReorderLTList, %function
MVC_ReorderLTList:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	mov	w21, w2
	mov	w23, w3
	mov	x22, x4
	mov	w24, w5
	bl	_mcount
	uxtw	x6, w20
	mov	x0, x19
	lsl	x2, x6, 8
	mov	w1, w23
	add	x6, x2, x6, lsl 3
	add	x6, x6, 288
	add	x19, x19, x6
	bl	MVC_GetLongTermPicPoint
	ldr	w6, [x22]
	add	w2, w21, 1
	cmp	w2, w6
	ble	.L746
	mov	w1, w2
	.p2align 2
.L747:
	add	x6, x19, x1, sxtw 3
	ldr	x6, [x6, -8]
	str	x6, [x19, w1, sxtw 3]
	sub	w1, w1, #1
	ldr	w6, [x22]
	cmp	w6, w1
	blt	.L747
.L746:
	add	w1, w6, 1
	str	w1, [x22]
	str	x0, [x19, w6, sxtw 3]
	ldr	w0, [x22]
	cmp	w2, w0
	mov	w4, w0
	bge	.L757
	b	.L745
	.p2align 3
.L750:
	str	x1, [x19, w4, sxtw 3]
	add	w4, w4, 1
.L749:
	cmp	w2, w0
	blt	.L745
.L757:
	ldr	x1, [x19, w0, sxtw 3]
	add	w0, w0, 1
	cbz	x1, .L749
	ldrb	w6, [x1, 1]
	cbz	w6, .L750
	ldr	w6, [x1, 16]
	cmp	w23, w6
	bne	.L750
	ldr	x3, [x1, 8]
	ldr	w3, [x3, 56]
	cmp	w3, w24
	bne	.L750
	cmp	w2, w0
	bge	.L757
.L745:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	MVC_ReorderLTList, .-MVC_ReorderLTList
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetMaxViewIdx
	.type	MVC_GetMaxViewIdx, %function
MVC_GetMaxViewIdx:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w19, w1
	mov	w22, w2
	mov	w20, w3
	bl	_mcount
	add	x0, x21, 10768384
	add	x1, x0, 4068
	ldr	w5, [x0, 4064]
	adds	w5, w5, 1
	beq	.L771
	ldr	w0, [x0, 4068]
	cmp	w19, w0
	beq	.L771
	mov	w6, w5
	mov	w0, 0
	b	.L765
	.p2align 3
.L767:
	ldr	w4, [x1, w0, sxtw 2]
	cmp	w19, w4
	beq	.L773
.L765:
	add	w0, w0, 1
	cmp	w0, w5
	bne	.L767
.L768:
	mov	w0, 0
	tbnz	w6, #31, .L766
.L764:
	sbfiz	x0, x20, 1, 32
	add	x0, x0, x6, sxtw
	cbnz	w22, .L774
	add	x0, x21, x0, lsl 2
	add	x0, x0, 10772480
	ldr	w0, [x0, 12]
.L766:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L774:
	add	x0, x0, 2691072
	ldp	x19, x20, [sp, 16]
	add	x0, x21, x0, lsl 2
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ldr	w0, [x0, 8172]
	ret
	.p2align 3
.L773:
	mov	w6, w0
	b	.L768
.L771:
	mov	w6, 0
	b	.L764
	.size	MVC_GetMaxViewIdx, .-MVC_GetMaxViewIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_get_inter_view_pic
	.type	mvc_get_inter_view_pic, %function
mvc_get_inter_view_pic:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w22, w3
	mov	w19, w1
	mov	w21, w2
	bl	_mcount
	uxtw	x1, w22
	lsl	x0, x1, 2
	add	x2, x20, x1, lsl 2
	sub	x0, x0, x1
	add	x2, x2, 11120640
	lsl	x0, x0, 4
	sub	x0, x0, x1
	lsl	x0, x0, 5
	ldr	w1, [x2, 8]
	add	x0, x0, 11108352
	add	x0, x0, 272
	add	x0, x20, x0
	cbz	w1, .L781
	sub	w4, w1, #1
	add	x5, x20, 11153408
	add	x4, x4, 1
	lsl	x3, x4, 2
	sub	x3, x3, x4
	lsl	x3, x3, 4
	sub	x4, x3, x4
	add	x4, x0, x4, lsl 4
	b	.L780
	.p2align 3
.L777:
	add	x0, x0, 752
	cmp	x0, x4
	beq	.L781
.L780:
	ldr	w3, [x0, 56]
	cmp	w3, w19
	bne	.L777
	ldrb	w1, [x5, 2187]
	cmp	w1, 1
	cbnz	w1, .L778
	ldr	w1, [x0, 636]
	cmp	w21, w1
	bne	.L777
	add	x0, x0, 608
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L778:
	bne	.L779
	ldr	w1, [x0, 684]
	cmp	w1, w21
	bne	.L777
	add	x0, x0, 656
	b	.L776
	.p2align 3
.L779:
	cmp	w1, 2
	bne	.L777
	ldr	w1, [x0, 732]
	cmp	w21, w1
	bne	.L777
	add	x0, x0, 704
	b	.L776
	.p2align 3
.L781:
	mov	x0, 0
.L776:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	mvc_get_inter_view_pic, .-mvc_get_inter_view_pic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_reorder_interview
	.type	mvc_reorder_interview, %function
mvc_reorder_interview:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	w24, w5
	mov	w22, w3
	mov	w23, w4
	mov	w20, w1
	mov	x21, x2
	bl	_mcount
	uxtw	x0, w24
	mov	w3, w24
	lsl	x5, x0, 8
	mov	w2, w23
	add	x5, x5, x0, lsl 3
	mov	w1, w22
	mov	x0, x19
	add	x5, x5, 288
	add	x19, x19, x5
	bl	mvc_get_inter_view_pic
	cbz	x0, .L783
	ldr	w3, [x21]
	add	w1, w20, 1
	cmp	w1, w3
	bls	.L785
	mov	w2, w1
	uxtw	x5, w1
	.p2align 2
.L786:
	sub	w2, w2, #1
	lsl	x3, x5, 3
	uxtw	x5, w2
	ldr	x6, [x19, w2, uxtw 3]
	str	x6, [x19, x3]
	ldr	w3, [x21]
	cmp	w3, w2
	bcc	.L786
.L785:
	add	w2, w3, 1
	str	w2, [x21]
	str	x0, [x19, w3, uxtw 3]
	ldr	w0, [x21]
	cmp	w1, w0
	bcc	.L783
	mov	w3, w0
	b	.L790
	.p2align 3
.L788:
	str	x2, [x19, w3, uxtw 3]
	cmp	w1, w0
	add	w3, w3, 1
	bcc	.L783
.L790:
	ldr	x2, [x19, w0, uxtw 3]
	add	w0, w0, 1
	cbz	x2, .L788
	ldr	x5, [x2, 8]
	ldr	w5, [x5, 56]
	cmp	w22, w5
	bne	.L788
	ldr	w5, [x2, 28]
	cmp	w23, w5
	bne	.L788
	cmp	w1, w0
	bcs	.L790
.L783:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	mvc_reorder_interview, .-mvc_reorder_interview
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ReorderRefPiclist
	.type	MVC_ReorderRefPiclist, %function
MVC_ReorderRefPiclist:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x27, x0
	mov	x0, x30
	add	x20, x27, 11116544
	mov	w19, w1
	mov	w21, w2
	bl	_mcount
	str	wzr, [x29, 188]
	mov	w0, 0
	ldrb	w1, [x20, 2457]
	cbz	w1, .L798
	ldrb	w1, [x20, 2458]
	mov	w0, 2
	cmp	w1, wzr
	csinc	w0, w0, wzr, ne
.L798:
	cmp	w19, 1
	bls	.L854
.L797:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L854:
	cbz	w19, .L855
	add	x1, x20, 1540
	str	x1, [x29, 168]
	add	x1, x20, 1804
	str	x1, [x29, 120]
	add	x1, x20, 2064
	str	x1, [x29, 104]
	ldr	x1, [x27, 248]
	add	x28, x20, 2324
	ldr	w25, [x1, 2896]
	add	w1, w25, 4
	mov	w25, 1
	lsl	w1, w25, w1
	str	w1, [x29, 148]
	cbnz	w0, .L802
.L860:
	ldr	w0, [x20, 2484]
	str	w0, [x29, 144]
.L803:
	cmn	w21, #2
	beq	.L797
	ldr	x0, [x29, 168]
	ldr	w1, [x0]
	cmp	w1, 3
	beq	.L797
	add	w23, w21, 1
	mov	w2, 1
	lsl	x0, x23, 2
	str	x0, [x29, 160]
	stp	w2, wzr, [x29, 152]
	add	x0, x27, 10768384
	add	x2, x27, 11153408
	mov	x23, 0
	str	x2, [x29, 136]
	mov	w22, 0
	ubfiz	x2, x19, 1, 32
	mov	w26, 0
	ldr	w24, [x29, 144]
	add	x25, x0, 4068
	str	x0, [x29, 112]
	str	x2, [x29, 128]
	b	.L806
	.p2align 3
.L859:
	ldr	w3, [x0, 8188]
.L829:
	ldr	x0, [x29, 136]
	mov	w5, w19
	add	x2, x29, 188
	mov	w1, w21
	ldr	w4, [x0, 2764]
	mov	x0, x27
	bl	mvc_reorder_interview
.L811:
	ldr	x0, [x29, 160]
	cmp	x0, x23
	beq	.L797
	add	x23, x23, 4
	ldr	x0, [x29, 168]
	ldr	w1, [x0, x23]
	cmp	w1, 3
	beq	.L797
.L806:
	cmp	w1, 1
	bls	.L856
	cmp	w1, 2
	beq	.L857
	ldr	w0, [x29, 152]
	cbnz	w0, .L813
	ldrb	w5, [x20, 2465]
	mov	w6, w26
.L814:
	cmp	w1, 4
	ldr	w0, [x28, x23]
	beq	.L858
	add	w0, w0, 1
	add	w26, w0, w6
	cmp	w22, w26
	sub	w0, w26, w22
	csel	w26, w0, w26, le
.L827:
	ldr	w1, [x29, 156]
	ldr	x0, [x29, 128]
	add	x0, x0, x26, sxtw
	add	x0, x0, x1, sxtw
	add	x0, x0, 2691072
	add	x0, x27, x0, lsl 2
	cbnz	w5, .L859
	ldr	w3, [x0, 8220]
	b	.L829
	.p2align 3
.L855:
	add	x1, x20, 1408
	str	x1, [x29, 168]
	add	x1, x20, 1672
	str	x1, [x29, 120]
	add	x1, x20, 1936
	str	x1, [x29, 104]
	ldr	x1, [x27, 248]
	add	x28, x20, 2192
	ldr	w25, [x1, 2896]
	add	w1, w25, 4
	mov	w25, 1
	lsl	w1, w25, w1
	str	w1, [x29, 148]
	cbz	w0, .L860
.L802:
	ldr	w0, [x20, 2484]
	ldr	w1, [x29, 148]
	lsl	w0, w0, 1
	add	w0, w0, 1
	lsl	w1, w1, 1
	stp	w0, w1, [x29, 144]
	b	.L803
	.p2align 3
.L856:
	ldr	x0, [x29, 120]
	ldr	w0, [x0, x23]
	cbnz	w1, .L808
	mvn	w0, w0
	add	w24, w24, w0
	ldr	w0, [x29, 148]
	cmp	w24, wzr
	add	w0, w24, w0
	csel	w24, w0, w24, lt
.L809:
	ldr	w0, [x29, 144]
	add	x4, x29, 188
	mov	w2, w21
	mov	w1, w19
	cmp	w0, w24
	add	x0, x27, 11120640
	ldr	w5, [x0]
	ldr	w0, [x29, 148]
	sub	w3, w24, w0
	mov	x0, x27
	csel	w3, w3, w24, lt
	bl	MVC_ReorderSTList
	b	.L811
	.p2align 3
.L858:
	mvn	w0, w0
	add	w26, w0, w6
	cmp	w26, wzr
	add	w0, w26, w22
	csel	w26, w0, w26, lt
	b	.L827
	.p2align 3
.L813:
	ldr	x4, [x29, 112]
	add	x0, x27, 11120640
	ldr	w2, [x4, 4064]
	ldr	w3, [x0]
	adds	w2, w2, 1
	beq	.L816
	ldr	w0, [x4, 4068]
	cmp	w3, w0
	beq	.L816
	mov	w0, 0
	str	w2, [x29, 156]
	b	.L819
	.p2align 3
.L820:
	ldr	w4, [x25, w0, sxtw 2]
	cmp	w3, w4
	beq	.L861
.L819:
	add	w0, w0, 1
	cmp	w2, w0
	bne	.L820
.L851:
	ldrb	w5, [x20, 2465]
	mov	w6, w2
	mov	w0, 0
	b	.L823
	.p2align 3
.L824:
	ldr	w4, [x25, w0, sxtw 2]
	cmp	w3, w4
	beq	.L853
.L823:
	add	w0, w0, 1
	cmp	w0, w2
	bne	.L824
	tbnz	w6, #31, .L837
.L831:
	sbfiz	x0, x19, 1, 32
	add	x0, x0, x6, sxtw
	cbz	w5, .L825
	add	x0, x0, 2691072
	mov	w6, -1
	str	wzr, [x29, 152]
	add	x0, x27, x0, lsl 2
	ldr	w22, [x0, 8172]
	b	.L814
	.p2align 3
.L808:
	add	w0, w0, 1
	add	w24, w24, w0
	ldr	w0, [x29, 148]
	cmp	w0, w24
	sub	w0, w24, w0
	csel	w24, w0, w24, le
	b	.L809
	.p2align 3
.L857:
	add	x0, x27, 11120640
	add	x4, x29, 188
	mov	w2, w21
	mov	w1, w19
	ldr	w5, [x0]
	ldr	x0, [x29, 104]
	ldr	w3, [x0, x23]
	mov	x0, x27
	bl	MVC_ReorderLTList
	b	.L811
	.p2align 3
.L853:
	mov	w6, w0
	tbz	w6, #31, .L831
.L837:
	mov	w6, -1
	mov	w22, 0
	str	wzr, [x29, 152]
	b	.L814
	.p2align 3
.L861:
	str	w0, [x29, 156]
	b	.L851
	.p2align 3
.L825:
	add	x0, x27, x0, lsl 2
	mov	w6, -1
	add	x0, x0, 10772480
	str	wzr, [x29, 152]
	ldr	w22, [x0, 12]
	b	.L814
.L816:
	ldrb	w5, [x20, 2465]
	mov	w6, 0
	str	wzr, [x29, 156]
	b	.L831
	.size	MVC_ReorderRefPiclist, .-MVC_ReorderRefPiclist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ReorderListX
	.type	MVC_ReorderListX, %function
MVC_ReorderListX:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 11116544
	bl	_mcount
	ldrb	w1, [x19, 2456]
	cmp	w1, 2
	beq	.L862
	ldrb	w0, [x19, 1404]
	cbnz	w0, .L874
.L865:
	ldr	w0, [x19, 2516]
	cmp	w1, 1
	add	w0, w0, 1
	str	w0, [x19, 2504]
	bne	.L862
	ldrb	w0, [x19, 1405]
	cbnz	w0, .L875
.L867:
	ldr	w0, [x19, 2520]
	add	w0, w0, 1
	str	w0, [x19, 2508]
.L862:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L874:
	ldr	w2, [x19, 2516]
	mov	w1, 0
	mov	x0, x20
	bl	MVC_ReorderRefPiclist
	ldrb	w1, [x19, 2456]
	b	.L865
	.p2align 3
.L875:
	ldr	w2, [x19, 2520]
	mov	x0, x20
	bl	MVC_ReorderRefPiclist
	b	.L867
	.size	MVC_ReorderListX, .-MVC_ReorderListX
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GenPiclistfromFrmlist
	.type	MVC_GenPiclistfromFrmlist, %function
MVC_GenPiclistfromFrmlist:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w21, w0
	mov	x0, x30
	mov	w20, w2
	mov	x19, x1
	mov	x25, x3
	mov	x24, x4
	mov	w23, w5
	bl	_mcount
	cmp	w20, 31
	mov	w22, 31
	csel	w22, w20, w22, ls
	cbnz	w23, .L898
	cmp	w21, 1
	ldr	x23, .LC58
	beq	.L938
.L878:
	cmp	w21, 2
	bne	.L887
	mov	w21, 0
	mov	w20, 0
	.p2align 2
.L889:
	cmp	w20, w22
	ccmp	w21, w22, 0, cs
	bcs	.L887
.L939:
	cmp	w21, w22
	bcc	.L922
	b	.L894
	.p2align 3
.L890:
	add	w21, w21, 1
	cmp	w22, w21
	bls	.L894
.L922:
	ldr	x0, [x19, w21, uxtw 3]
	add	x26, x19, x21, uxtw 3
	ldrb	w1, [x0, 2]
	tbz	x1, 1, .L890
	add	x0, x0, 704
	blr	x23
	cbz	w0, .L890
	ldr	w1, [x24]
	add	w21, w21, 1
	ldr	x0, [x26]
	add	x0, x0, 704
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
.L894:
	cmp	w20, w22
	bcc	.L921
	b	.L889
	.p2align 3
.L895:
	add	w20, w20, 1
	cmp	w22, w20
	bls	.L889
.L921:
	ldr	x0, [x19, w20, uxtw 3]
	add	x26, x19, x20, uxtw 3
	ldrb	w1, [x0, 2]
	tbz	x1, 0, .L895
	add	x0, x0, 656
	blr	x23
	cbz	w0, .L895
	ldr	w1, [x24]
	add	w20, w20, 1
	ldr	x0, [x26]
	cmp	w20, w22
	ccmp	w21, w22, 0, cs
	add	x0, x0, 656
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
	bcc	.L939
.L887:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L898:
	cmp	w21, 1
	ldr	x23, .LC57
	bne	.L878
.L938:
	mov	w21, 0
	mov	w20, 0
	.p2align 2
.L879:
	cmp	w20, w22
	ccmp	w21, w22, 0, cs
	bcs	.L887
	cmp	w20, w22
	bcc	.L920
	b	.L937
	.p2align 3
.L880:
	add	w20, w20, 1
	cmp	w20, w22
	bcs	.L937
.L920:
	ldr	x0, [x19, w20, uxtw 3]
	add	x26, x19, x20, uxtw 3
	ldrb	w1, [x0, 2]
	tbz	x1, 0, .L880
	add	x0, x0, 656
	blr	x23
	cbz	w0, .L880
	ldr	w1, [x24]
	add	w20, w20, 1
	ldr	x0, [x26]
	add	x0, x0, 656
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
	.p2align 2
.L937:
	cmp	w21, w22
	bcs	.L879
	ldr	x0, [x19, w21, uxtw 3]
	add	x26, x19, x21, uxtw 3
	ldrb	w1, [x0, 2]
	tbnz	x1, 1, .L940
.L885:
	add	w21, w21, 1
	b	.L937
	.p2align 3
.L940:
	add	x0, x0, 704
	blr	x23
	cbz	w0, .L885
	ldr	w1, [x24]
	add	w21, w21, 1
	ldr	x0, [x26]
	add	x0, x0, 704
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
	b	.L879
	.size	MVC_GenPiclistfromFrmlist, .-MVC_GenPiclistfromFrmlist
	.align	3
.LC57:
	.xword	MVC_IsLTRefFlg
	.align	3
.LC58:
	.xword	MVC_IsSTRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetBaseViewId
	.type	MVC_GetBaseViewId, %function
MVC_GetBaseViewId:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 12288
	mov	x1, 0
	add	x0, x0, 2400
	.p2align 2
.L944:
	ldr	w2, [x0]
	add	x3, x0, 335872
	cbz	w2, .L942
	ldrb	w0, [x0, -4]
	cbnz	w0, .L952
.L942:
	add	w1, w1, 1
	add	x0, x3, 308
	cmp	w1, 32
	bne	.L944
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L952:
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 4
	sub	x1, x0, x1
	lsl	x0, x1, 2
	sub	x1, x0, x1
	lsl	x0, x1, 6
	add	x0, x1, x0
	add	x0, x19, x0, lsl 2
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 14692]
	ret
	.size	MVC_GetBaseViewId, .-MVC_GetBaseViewId
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetVOIdx
	.type	MVC_GetVOIdx, %function
MVC_GetVOIdx:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	w19, w1
	mov	x0, x30
	mov	w21, w2
	bl	_mcount
	cbz	w19, .L958
	ldr	w0, [x20]
	cmp	w21, w0
	beq	.L958
	mov	w0, w19
	mov	w3, 0
	b	.L955
	.p2align 3
.L956:
	ldr	w4, [x20, w3, sxtw 2]
	cmp	w4, w21
	beq	.L959
.L955:
	add	w3, w3, 1
	cmp	w3, w19
	bne	.L956
.L954:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L959:
	mov	w0, w3
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L958:
	mov	w0, 0
	b	.L954
	.size	MVC_GetVOIdx, .-MVC_GetVOIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_is_view_id_in_ref_view_list
	.type	MVC_is_view_id_in_ref_view_list, %function
MVC_is_view_id_in_ref_view_list:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	w19, w2
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cbz	w19, .L965
	ldr	w0, [x21]
	cmp	w20, w0
	beq	.L965
	mov	w0, 0
	b	.L962
	.p2align 3
.L963:
	ldr	w3, [x21, w0, sxtw 2]
	cmp	w3, w20
	beq	.L961
.L962:
	add	w0, w0, 1
	cmp	w0, w19
	mov	w1, w0
	bne	.L963
.L961:
	cmp	w19, wzr
	ldr	x21, [sp, 32]
	ccmp	w19, w1, 0, ne
	cset	w0, hi
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L965:
	mov	w1, 0
	b	.L961
	.size	MVC_is_view_id_in_ref_view_list, .-MVC_is_view_id_in_ref_view_list
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GenPiclistfromFrmlist_Interview
	.type	MVC_GenPiclistfromFrmlist_Interview, %function
MVC_GenPiclistfromFrmlist_Interview:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w22, w0
	mov	x0, x30
	mov	x23, x1
	mov	w20, w2
	mov	x21, x3
	mov	x19, x4
	bl	_mcount
	cmp	w22, 1
	beq	.L980
	cmp	w22, 2
	bne	.L966
	cbz	w20, .L966
	sub	w2, w20, #1
	mov	x1, 1456
	mov	w20, 752
	ldr	w0, [x19]
	add	x5, x23, 704
	umaddl	x20, w2, w20, x1
	add	x1, x23, x20
	.p2align 2
.L971:
	str	x5, [x21, w0, uxtw 3]
	add	x5, x5, 752
	cmp	x5, x1
	ldr	w0, [x19]
	add	w0, w0, 1
	str	w0, [x19]
	bne	.L971
.L966:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L980:
	cbz	w20, .L966
	sub	w2, w20, #1
	mov	x1, 1408
	mov	w20, 752
	ldr	w0, [x19]
	add	x4, x23, 656
	umaddl	x20, w2, w20, x1
	add	x1, x23, x20
	.p2align 2
.L969:
	str	x4, [x21, w0, uxtw 3]
	add	x4, x4, 752
	cmp	x1, x4
	ldr	w0, [x19]
	add	w0, w0, 1
	str	w0, [x19]
	bne	.L969
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	MVC_GenPiclistfromFrmlist_Interview, .-MVC_GenPiclistfromFrmlist_Interview
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_append_interview_list
	.type	mvc_append_interview_list, %function
mvc_append_interview_list:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x22, x0
	mov	x0, x30
	mov	w19, w1
	mov	x21, x2
	mov	x24, x3
	bl	_mcount
	add	x0, x22, 10768384
	add	x1, x22, 11120640
	add	x6, x0, 4068
	ldr	w2, [x0, 4064]
	ldr	w3, [x1]
	adds	w2, w2, 1
	beq	.L982
	ldr	w0, [x0, 4068]
	cmp	w3, w0
	beq	.L1000
	mov	w5, w2
	mov	w0, 0
	b	.L983
	.p2align 3
.L984:
	ldr	w4, [x6, w0, sxtw 2]
	cmp	w3, w4
	beq	.L982
.L983:
	add	w0, w0, 1
	cmp	w0, w5
	mov	w2, w0
	bne	.L984
.L982:
	add	x0, x22, 11116544
	ldrb	w0, [x0, 2465]
	cbz	w0, .L985
	ubfiz	x0, x19, 1, 32
	add	x0, x0, x2, uxtw
	add	x0, x0, 2691072
	add	x23, x0, 2044
	add	x0, x22, x0, lsl 2
	add	x23, x22, x23, lsl 2
	add	x23, x23, 12
	ldr	w25, [x0, 8172]
.L986:
	add	x20, x22, 11153408
	add	x0, x22, 11124736
	ldrb	w1, [x20, 2187]
	ldr	w19, [x0, 408]
	cmp	w1, 2
	cset	w26, eq
	subs	w19, w19, #1
	bmi	.L981
	ldr	x28, .LC59
	mov	w27, 752
	b	.L1017
	.p2align 3
.L1028:
	ldrb	w0, [x1, 2]
	cmp	w0, 3
	beq	.L1027
.L988:
	subs	w19, w19, #1
	bmi	.L981
.L1017:
	sxtw	x0, w19
	add	x0, x0, 1388544
	add	x0, x22, x0, lsl 3
	ldr	x1, [x0, 16408]
	cbz	x1, .L988
	ldrb	w0, [x20, 2187]
	cbz	w0, .L1028
	cmp	w0, 1
	beq	.L1029
	cmp	w0, 2
	bne	.L988
	ldrb	w2, [x20, 2185]
	ldrb	w0, [x1, 2]
	ubfx	x0, x0, 1, 1
	cbz	w2, .L994
	ldr	x2, [x20, 2736]
	ldr	w3, [x2, 684]
	ldr	w2, [x1, 684]
	cmp	w3, w2
	cset	w2, eq
	and	w0, w0, w2
.L994:
	cbz	w0, .L988
	ldr	w2, [x1, 732]
	.p2align 2
.L990:
	add	x0, x1, x26
	ldrb	w0, [x0, 12]
	cbz	w0, .L988
	ldr	w0, [x20, 2764]
	cmp	w0, w2
	bne	.L988
	ldr	w3, [x1, 56]
	cbz	w25, .L988
	ldr	w0, [x23]
	cmp	w3, w0
	beq	.L995
	mov	w0, 0
	.p2align 2
.L996:
	add	w0, w0, 1
	cmp	w25, w0
	beq	.L988
	ldr	w2, [x23, w0, sxtw 2]
	cmp	w3, w2
	bne	.L996
.L995:
	ldr	w0, [x24]
	mov	x2, 752
	ldr	x3, [x28, 104]
	umull	x0, w0, w27
	add	x0, x21, x0
	blr	x3
	ldr	w0, [x24]
	umull	x0, w0, w27
	add	x0, x21, x0
	str	x0, [x0, 616]
	str	x0, [x0, 664]
	str	x0, [x0, 712]
	ldr	w0, [x24]
	ldr	w1, [x22, 52]
	umull	x0, w0, w27
	sub	w1, w1, #1
	add	x0, x21, x0
	str	w1, [x0, 48]
	ldr	w0, [x24]
	cmp	w25, w0
	beq	.L981
	add	w0, w0, 1
	subs	w19, w19, #1
	str	w0, [x24]
	bpl	.L1017
.L981:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1029:
	ldrb	w2, [x20, 2185]
	ldrb	w0, [x1, 2]
	and	w0, w0, 1
	cbz	w2, .L992
	ldr	x3, [x20, 2736]
	ldr	w2, [x1, 732]
	ldr	w3, [x3, 732]
	cmp	w3, w2
	cset	w2, eq
	and	w0, w0, w2
.L992:
	cbz	w0, .L988
	ldr	w2, [x1, 684]
	b	.L990
	.p2align 3
.L1027:
	ldr	w2, [x1, 636]
	b	.L990
	.p2align 3
.L985:
	ubfiz	x0, x19, 1, 32
	add	x0, x0, x2, uxtw
	add	x0, x0, 2691072
	add	x23, x0, 2052
	add	x0, x22, x0, lsl 2
	add	x23, x22, x23, lsl 2
	add	x23, x23, 12
	ldr	w25, [x0, 8204]
	b	.L986
.L1000:
	mov	w2, 0
	b	.L982
	.size	mvc_append_interview_list, .-mvc_append_interview_list
	.align	3
.LC59:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_InitListX
	.type	MVC_InitListX, %function
MVC_InitListX:
	stp	x29, x30, [sp, -480]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 11120640
	add	x20, x19, 11116544
	bl	_mcount
	add	x26, x19, 11153408
	stp	wzr, wzr, [x21, 8]
	ldrb	w0, [x20, 2456]
	cbnz	w0, .L1031
	ldrb	w0, [x26, 2187]
	add	x27, x19, 11124736
	cbnz	w0, .L1174
	ldr	w0, [x27, 416]
	cbz	w0, .L1111
	sub	w3, w0, #1
	mov	w23, 0
	add	x3, x3, 1388544
	add	x0, x27, 152
	add	x3, x3, 2068
	add	x3, x19, x3, lsl 3
	b	.L1037
	.p2align 3
.L1036:
	cmp	x0, x3
	beq	.L1035
.L1037:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 3]
	cmp	w2, 3
	bne	.L1036
	ldr	w2, [x1, 608]
	and	w2, w2, 16776960
	cmp	w2, 65536
	bne	.L1036
	add	x2, x19, x23, uxtw 3
	add	x1, x1, 608
	cmp	x0, x3
	add	w23, w23, 1
	str	x1, [x2, 288]
	bne	.L1037
	.p2align 2
.L1035:
	add	x22, x19, 288
	ldr	x3, .LC60
	mov	w1, w23
	mov	w2, 8
	mov	x0, x22
	bl	qsort
	str	w23, [x20, 2504]
	ldr	w1, [x27, 420]
	cbz	w1, .L1112
	sub	w2, w1, #1
	add	x0, x27, 280
	add	x2, x2, 1388544
	mov	w24, w23
	add	x2, x2, 2084
	add	x2, x19, x2, lsl 3
	b	.L1040
	.p2align 3
.L1039:
	cmp	x2, x0
	beq	.L1175
.L1040:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w3, [x1, 3]
	cmp	w3, 3
	bne	.L1039
	ldr	w3, [x1, 608]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L1039
	add	x3, x19, x24, uxtw 3
	add	x1, x1, 608
	cmp	x2, x0
	add	w24, w24, 1
	str	x1, [x3, 288]
	bne	.L1040
	.p2align 2
.L1175:
	sub	w1, w24, w23
.L1038:
	uxtw	x0, w23
	ldr	x3, .LC61
	add	x0, x0, 36
	mov	w2, 8
	add	x0, x19, x0, lsl 3
	bl	qsort
	str	w24, [x20, 2504]
	ldrsb	w0, [x20, 2468]
	str	wzr, [x20, 2508]
	cbnz	w0, .L1046
.L1090:
	add	x23, x19, 11108352
	mov	x0, x19
	add	x24, x23, 272
	add	x3, x21, 8
	mov	w1, 0
	mov	x2, x24
	bl	mvc_append_interview_list
	ldrb	w0, [x26, 2187]
	cbnz	w0, .L1176
	ldr	w3, [x21, 8]
	ldr	w0, [x20, 2504]
	cbz	w3, .L1115
	add	x1, x23, 880
	add	w3, w0, w3
	.p2align 2
.L1093:
	add	x2, x19, x0, uxtw 3
	add	w0, w0, 1
	cmp	w3, w0
	str	x1, [x2, 288]
	add	x1, x1, 752
	bne	.L1093
.L1092:
	str	w3, [x20, 2504]
.L1094:
	ldrb	w1, [x20, 2456]
	cmp	w1, 1
	beq	.L1177
.L1091:
	cbnz	w1, .L1098
.L1180:
	ldr	w2, [x20, 2504]
	cbz	w2, .L1178
.L1099:
	ldr	w1, [x20, 2516]
	ldr	w0, [x20, 2520]
	ldr	w3, [x20, 2508]
	add	w1, w1, 1
	add	w0, w0, 1
	cmp	w1, w2
	csel	w1, w1, w2, ls
	cmp	w0, w3
	csel	w0, w0, w3, ls
	str	w1, [x20, 2504]
	cmp	w1, 32
	str	w0, [x20, 2508]
	bhi	.L1105
	.p2align 2
.L1137:
	add	x2, x19, x1, uxtw 3
	add	w1, w1, 1
	cmp	w1, 33
	str	xzr, [x2, 288]
	bne	.L1137
.L1105:
	cmp	w0, 32
	bhi	.L1103
	.p2align 2
.L1136:
	add	x1, x19, x0, uxtw 3
	add	w0, w0, 1
	cmp	w0, 33
	str	xzr, [x1, 552]
	bne	.L1136
.L1103:
	mov	w0, 0
.L1164:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 480
	ret
	.p2align 3
.L1031:
	ldrb	w0, [x26, 2187]
	add	x27, x19, 11124736
	cbz	w0, .L1055
	ldr	w0, [x27, 416]
	cbz	w0, .L1179
	sub	w3, w0, #1
	mov	w22, 0
	add	x3, x3, 1388544
	add	x0, x27, 152
	add	x3, x3, 2068
	add	x3, x19, x3, lsl 3
	.p2align 2
.L1074:
	ldr	x2, [x0]
	add	x0, x0, 8
	ldrb	w1, [x2, 2]
	cbz	w1, .L1073
	ldr	w4, [x2, 32]
	add	x1, x29, 480
	ldr	w5, [x26, 2764]
	add	x1, x1, x22, uxtw 3
	sub	x1, x1, #4096
	cmp	w5, w4
	blt	.L1073
	add	w22, w22, 1
	str	x2, [x1, 3712]
.L1073:
	cmp	x0, x3
	bne	.L1074
	add	x24, x29, 96
	ldr	x3, .LC68
	mov	w2, 8
	mov	w1, w22
	mov	x0, x24
	bl	qsort
	ldr	w23, [x27, 416]
	cbz	w23, .L1075
.L1109:
	sub	w1, w23, #1
	add	x0, x27, 152
	add	x1, x1, 1388544
	mov	w28, w22
	add	x1, x1, 2068
	add	x1, x19, x1, lsl 3
	.p2align 2
.L1077:
	ldr	x3, [x0]
	add	x0, x0, 8
	ldrb	w2, [x3, 2]
	cbz	w2, .L1076
	ldr	w4, [x3, 32]
	add	x2, x29, 480
	ldr	w5, [x26, 2764]
	add	x2, x2, x28, uxtw 3
	sub	x2, x2, #4096
	cmp	w5, w4
	bge	.L1076
	add	w28, w28, 1
	str	x3, [x2, 3712]
.L1076:
	cmp	x0, x1
	bne	.L1077
	sub	w23, w28, w22
	ldr	x3, .LC69
	mov	w2, 8
	mov	w1, w23
	add	x0, x24, x22, uxtw 3
	bl	qsort
	cbz	w22, .L1078
.L1108:
	mov	x0, 0
	.p2align 2
.L1079:
	add	w1, w23, w0
	add	x3, x29, 480
	ldr	x2, [x24, x0, lsl 3]
	add	x0, x0, 1
	add	x1, x3, x1, lsl 3
	cmp	w22, w0
	str	x2, [x1, -256]
	bhi	.L1079
.L1078:
	cmp	w28, w22
	bls	.L1080
	mov	w0, w22
	.p2align 2
.L1081:
	add	x2, x29, 480
	sub	w1, w0, w22
	add	x2, x2, x0, uxtw 3
	add	x3, x29, 480
	sub	x2, x2, #4096
	add	x1, x3, x1, lsl 3
	add	w0, w0, 1
	cmp	w28, w0
	ldr	x2, [x2, 3712]
	str	x2, [x1, -256]
	bne	.L1081
.L1080:
	str	wzr, [x20, 2504]
	add	x22, x19, 288
	str	wzr, [x20, 2508]
	add	x25, x20, 2504
	mov	x1, x24
	mov	w2, w28
	ldrb	w0, [x26, 2187]
	mov	w5, 0
	mov	x4, x25
	mov	x3, x22
	add	x23, x19, 552
	add	x24, x20, 2508
	bl	MVC_GenPiclistfromFrmlist
	ldrb	w0, [x26, 2187]
	mov	w2, w28
	mov	w5, 0
	mov	x4, x24
	mov	x3, x23
	add	x1, x29, 224
	bl	MVC_GenPiclistfromFrmlist
	ldr	w28, [x27, 420]
	add	x27, x29, 352
	cbz	w28, .L1082
	mov	x1, 0
	add	x27, x29, 352
	.p2align 2
.L1083:
	lsl	x0, x1, 3
	add	x0, x0, 11124736
	add	x0, x0, 280
	ldr	x0, [x19, x0]
	str	x0, [x27, x1, lsl 3]
	add	x1, x1, 1
	cmp	w28, w1
	bhi	.L1083
.L1082:
	ldr	x3, .LC63
	mov	w2, 8
	mov	w1, w28
	mov	x0, x27
	bl	qsort
	ldrb	w0, [x26, 2187]
	mov	x4, x25
	mov	w5, 1
	mov	x3, x22
	mov	w2, w28
	mov	x1, x27
	bl	MVC_GenPiclistfromFrmlist
	ldrb	w0, [x26, 2187]
	mov	x3, x23
	mov	x1, x27
	mov	w5, 1
	mov	x4, x24
	mov	w2, w28
	bl	MVC_GenPiclistfromFrmlist
	ldr	w23, [x20, 2504]
	ldr	w0, [x20, 2508]
	cmp	w0, w23
	cset	w1, eq
.L1072:
	cmp	w23, 1
	cset	w0, hi
	tst	w1, w0
	beq	.L1084
	cbz	w23, .L1085
	ldr	x4, [x19, 288]
	ldr	x0, [x19, 552]
	cmp	x4, x0
	bne	.L1084
	sub	w23, w23, #1
	mov	x1, x19
	add	x0, x19, x23, lsl 3
.L1087:
	cmp	x0, x1
	beq	.L1089
	ldr	x3, [x1, 296]
	add	x1, x1, 8
	ldr	x2, [x1, 552]
	cmp	x3, x2
	beq	.L1087
	.p2align 2
.L1084:
	ldrsb	w0, [x20, 2468]
	cbz	w0, .L1090
.L1169:
	ldrb	w1, [x20, 2456]
.L1183:
	cbz	w1, .L1180
.L1098:
	ldr	x0, [x20, 2504]
	cbz	x0, .L1100
	ldr	w2, [x20, 2504]
	b	.L1099
	.p2align 3
.L1055:
	ldr	w0, [x27, 416]
	cbz	w0, .L1113
	sub	w3, w0, #1
	mov	w23, 0
	add	x3, x3, 1388544
	add	x0, x27, 152
	add	x3, x3, 2068
	add	x3, x19, x3, lsl 3
	b	.L1060
	.p2align 3
.L1059:
	cmp	x0, x3
	beq	.L1058
.L1060:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 3]
	cmp	w2, 3
	bne	.L1059
	ldr	w2, [x1, 632]
	add	x5, x19, x23, uxtw 3
	ldr	w4, [x26, 2768]
	add	x1, x1, 608
	cmp	w4, w2
	blt	.L1059
	str	x1, [x5, 288]
	cmp	x0, x3
	add	w23, w23, 1
	bne	.L1060
	.p2align 2
.L1058:
	add	x22, x19, 288
	ldr	x3, .LC66
	mov	w2, 8
	mov	w1, w23
	mov	x0, x22
	bl	qsort
	ldr	w24, [x27, 416]
	cbz	w24, .L1061
	sub	w1, w24, #1
	add	x0, x27, 152
	add	x1, x1, 1388544
	mov	w25, w23
	add	x1, x1, 2068
	add	x1, x19, x1, lsl 3
	b	.L1063
	.p2align 3
.L1062:
	cmp	x0, x1
	beq	.L1181
.L1063:
	ldr	x2, [x0]
	add	x0, x0, 8
	ldrb	w3, [x2, 3]
	cmp	w3, 3
	bne	.L1062
	ldr	w3, [x2, 632]
	add	x5, x19, x25, uxtw 3
	ldr	w4, [x26, 2768]
	add	x2, x2, 608
	cmp	w4, w3
	bge	.L1062
	str	x2, [x5, 288]
	cmp	x0, x1
	add	w25, w25, 1
	bne	.L1063
	.p2align 2
.L1181:
	uxtw	x0, w23
	sub	w24, w25, w23
	add	x0, x0, 36
	ldr	x3, .LC67
	uxtw	x28, w25
	mov	w2, 8
	add	x0, x19, x0, lsl 3
	mov	w1, w24
	add	x28, x28, 36
	bl	qsort
	add	x28, x19, x28, lsl 3
	cbz	w23, .L1065
.L1107:
	mov	x2, x22
	mov	w0, 0
	.p2align 2
.L1066:
	add	w1, w24, w0
	ldr	x3, [x2], 8
	add	x1, x1, 69
	add	w0, w0, 1
	cmp	w0, w23
	str	x3, [x19, x1, lsl 3]
	bcc	.L1066
.L1065:
	cmp	w25, w23
	bls	.L1067
	mov	w0, w23
	.p2align 2
.L1068:
	sub	w1, w0, w23
	add	x2, x19, x0, uxtw 3
	add	x1, x1, 69
	add	w0, w0, 1
	cmp	w0, w25
	ldr	x2, [x2, 288]
	str	x2, [x19, x1, lsl 3]
	bne	.L1068
.L1067:
	str	w25, [x20, 2504]
	str	w25, [x20, 2508]
	ldr	w1, [x27, 420]
	cbz	w1, .L1114
	sub	w2, w1, #1
	add	x0, x27, 280
	add	x2, x2, 1388544
	mov	w23, w25
	add	x2, x2, 2084
	add	x2, x19, x2, lsl 3
	b	.L1071
	.p2align 3
.L1070:
	cmp	x0, x2
	beq	.L1182
.L1071:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w3, [x1, 2]
	cmp	w3, 3
	bne	.L1070
	ldrb	w3, [x1, 609]
	cmp	w3, 1
	bne	.L1070
	add	x3, x19, x23, uxtw 3
	add	x1, x1, 608
	cmp	x0, x2
	add	w23, w23, 1
	str	x1, [x3, 288]
	str	x1, [x3, 552]
	bne	.L1071
	.p2align 2
.L1182:
	sub	w1, w23, w25
.L1069:
	ldr	x24, .LC61
	mov	x0, x28
	mov	w2, 8
	mov	x3, x24
	bl	qsort
	ldr	w0, [x20, 2504]
	mov	x3, x24
	mov	w2, 8
	sub	w1, w23, w0
	uxtw	x0, w0
	add	x0, x0, 69
	add	x0, x19, x0, lsl 3
	bl	qsort
	str	w23, [x20, 2504]
	mov	w1, 1
	str	w23, [x20, 2508]
	b	.L1072
	.p2align 3
.L1174:
	ldr	w0, [x27, 416]
	mov	w24, 0
	cbz	w0, .L1034
	sub	w4, w0, #1
	mov	w24, 0
	add	x4, x4, 1388544
	add	x0, x27, 152
	add	x4, x4, 2068
	add	x4, x19, x4, lsl 3
	.p2align 2
.L1043:
	ldr	x2, [x0]
	add	x1, x29, 480
	add	x1, x1, x24, uxtw 3
	add	x0, x0, 8
	sub	x1, x1, #4096
	cmp	x4, x0
	ldrb	w3, [x2, 3]
	cbz	w3, .L1042
	add	w24, w24, 1
	str	x2, [x1, 3712]
.L1042:
	bne	.L1043
.L1034:
	ldr	x3, .LC62
	mov	w1, w24
	mov	w2, 8
	add	x0, x29, 96
	add	x22, x19, 288
	add	x23, x20, 2504
	bl	qsort
	str	wzr, [x20, 2504]
	mov	w2, w24
	mov	w5, 0
	ldrb	w0, [x26, 2187]
	add	x1, x29, 96
	mov	x4, x23
	mov	x3, x22
	bl	MVC_GenPiclistfromFrmlist
	ldr	w24, [x27, 420]
	add	x27, x29, 352
	cbz	w24, .L1044
	mov	x1, 0
	add	x27, x29, 352
	.p2align 2
.L1045:
	lsl	x0, x1, 3
	add	x0, x0, 11124736
	add	x0, x0, 280
	ldr	x0, [x19, x0]
	str	x0, [x27, x1, lsl 3]
	add	x1, x1, 1
	cmp	w24, w1
	bhi	.L1045
.L1044:
	ldr	x3, .LC63
	mov	w2, 8
	mov	w1, w24
	mov	x0, x27
	bl	qsort
	ldrb	w0, [x26, 2187]
	mov	w5, 1
	mov	x4, x23
	mov	x3, x22
	mov	w2, w24
	mov	x1, x27
	bl	MVC_GenPiclistfromFrmlist
	str	wzr, [x20, 2508]
	ldrsb	w0, [x20, 2468]
	cbz	w0, .L1090
.L1046:
	ldr	w0, [x20, 2504]
	cbnz	w0, .L1169
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L1050
	ldrb	w0, [x26, 2187]
	cbnz	w0, .L1051
	ldr	x0, [x26, 2736]
	add	x0, x0, 608
	str	x0, [x19, 288]
.L1052:
	mov	w0, 1
	ldrb	w1, [x20, 2456]
	str	w0, [x20, 2504]
	b	.L1183
.L1176:
	ldr	w2, [x21, 8]
	add	x4, x20, 2504
	mov	x3, x22
	mov	x1, x24
	bl	MVC_GenPiclistfromFrmlist_Interview
	b	.L1094
.L1085:
	ldr	x4, [x19, 552]
.L1089:
	ldr	x0, [x19, 560]
	str	x0, [x19, 552]
	str	x4, [x19, 560]
	b	.L1084
.L1051:
	cmp	w0, 1
	ldr	x0, [x26, 2736]
	beq	.L1184
	add	x0, x0, 704
	str	x0, [x19, 288]
	b	.L1052
.L1177:
	add	x22, x23, 1776
	mov	x0, x19
	add	x3, x21, 12
	mov	x2, x22
	bl	mvc_append_interview_list
	ldrb	w0, [x26, 2187]
	cbnz	w0, .L1095
	ldr	w3, [x21, 12]
	ldr	w1, [x20, 2508]
	cbz	w3, .L1116
	add	x0, x23, 2384
	add	w3, w3, w1
	.p2align 2
.L1097:
	add	x2, x19, x1, uxtw 3
	add	w1, w1, 1
	cmp	w3, w1
	str	x0, [x2, 552]
	add	x0, x0, 752
	bne	.L1097
.L1096:
	ldrb	w1, [x20, 2456]
	str	w3, [x20, 2508]
	b	.L1091
.L1115:
	mov	w3, w0
	b	.L1092
.L1184:
	add	x0, x0, 656
	str	x0, [x19, 288]
	b	.L1052
.L1112:
	mov	w24, w23
	b	.L1038
.L1061:
	uxtw	x28, w23
	ldr	x3, .LC67
	add	x28, x28, 36
	mov	w2, 8
	mov	w1, 0
	mov	w25, w23
	add	x28, x19, x28, lsl 3
	mov	x0, x28
	bl	qsort
	cbnz	w23, .L1107
	b	.L1067
	.p2align 3
.L1114:
	mov	w23, w25
	b	.L1069
.L1111:
	mov	w23, 0
	b	.L1035
.L1179:
	add	x24, x29, 96
	ldr	x3, .LC68
	mov	w2, 8
	mov	w1, 0
	mov	x0, x24
	mov	w22, 0
	bl	qsort
	ldr	w23, [x27, 416]
	cbnz	w23, .L1109
	ldr	x3, .LC69
	mov	w2, 8
	mov	w1, 0
	mov	x0, x24
	mov	w28, 0
	bl	qsort
	b	.L1080
	.p2align 3
.L1113:
	mov	w23, 0
	b	.L1058
.L1075:
	ldr	x3, .LC69
	mov	w2, 8
	mov	w1, 0
	add	x0, x24, x22, uxtw 3
	mov	w28, w22
	bl	qsort
	cbnz	w22, .L1108
	b	.L1080
	.p2align 3
.L1095:
	ldr	w2, [x21, 12]
	mov	x1, x22
	add	x4, x20, 2508
	add	x3, x19, 552
	bl	MVC_GenPiclistfromFrmlist_Interview
	ldrb	w1, [x20, 2456]
	b	.L1183
.L1100:
	ldr	x2, .LC73
	mov	w1, 4480
.L1170:
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x19
	bl	MVC_ClearCurrSlice
	mov	w0, -1
	b	.L1164
.L1178:
	ldr	x2, .LC71
	mov	w1, 4471
	b	.L1170
.L1050:
	ldr	x2, .LC65
	mov	w1, 4277
	b	.L1170
.L1116:
	mov	w3, w1
	b	.L1096
	.size	MVC_InitListX, .-MVC_InitListX
	.align	3
.LC60:
	.xword	MVC_compare_pic_by_pic_num_desc
	.align	3
.LC61:
	.xword	MVC_compare_pic_by_lt_pic_num_asc
	.align	3
.LC62:
	.xword	MVC_compare_fs_by_frame_num_desc
	.align	3
.LC63:
	.xword	MVC_compare_fs_by_lt_pic_idx_asc
	.align	3
.LC65:
	.xword	.LC64
	.align	3
.LC66:
	.xword	MVC_compare_pic_by_poc_desc
	.align	3
.LC67:
	.xword	MVC_compare_pic_by_poc_asc
	.align	3
.LC68:
	.xword	MVC_compare_fs_by_poc_desc
	.align	3
.LC69:
	.xword	MVC_compare_fs_by_poc_asc
	.align	3
.LC71:
	.xword	.LC70
	.align	3
.LC73:
	.xword	.LC72
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_FindNearestPOCPicId
	.type	MVC_FindNearestPOCPicId, %function
MVC_FindNearestPOCPicId:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x2, x19, 11124736
	ldr	w0, [x2, 412]
	cbz	w0, .L1189
	add	x1, x19, 11153408
	ldr	w0, [x2, 408]
	ldr	w7, [x1, 2764]
	cbz	w0, .L1190
	sub	w1, w0, #1
	add	x2, x2, 24
	add	x1, x1, 1388544
	mov	w6, 2147483647
	add	x1, x1, 2052
	mov	w0, 0
	add	x5, x19, x1, lsl 3
	.p2align 2
.L1188:
	ldr	x3, [x2]
	add	x2, x2, 8
	cbz	x3, .L1187
	ldr	w1, [x3, 32]
	sub	w1, w7, w1
	sxtw	x1, w1
	eor	x4, x1, x1, asr 63
	sub	x4, x4, x1, asr 63
	cmp	w4, w6
	bge	.L1187
	ldr	w0, [x3, 160]
	mov	w6, w4
.L1187:
	cmp	x2, x5
	bne	.L1188
.L1186:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1190:
	mov	w0, 0
	b	.L1186
.L1189:
	mov	w0, -1
	b	.L1186
	.size	MVC_FindNearestPOCPicId, .-MVC_FindNearestPOCPicId
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_FindMinRefIdx
	.type	MVC_FindMinRefIdx, %function
MVC_FindMinRefIdx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 11116544
	ldrb	w1, [x0, 2456]
	cmp	w1, 2
	beq	.L1195
	add	x1, x19, 11153408
	ldrb	w1, [x1, 2187]
	cbnz	w1, .L1225
	add	x6, x19, 11124736
	ldr	w5, [x0, 2504]
	add	x6, x6, 648
	mov	w4, 0
	.p2align 2
.L1199:
	cbz	w5, .L1203
	add	x1, x19, 288
	mov	w3, 32
	mov	w0, 0
	b	.L1201
	.p2align 3
.L1200:
	add	w0, w0, 1
	cmp	w0, w5
	beq	.L1226
.L1201:
	ldr	x2, [x1]
	add	x1, x1, 8
	ldr	x2, [x2, 8]
	ldr	w2, [x2, 52]
	cmp	w2, w4
	bne	.L1200
	cmp	w3, w0
	csel	w3, w3, w0, ls
	add	w0, w0, 1
	stp	w3, w3, [x6]
	cmp	w0, w5
	bne	.L1201
.L1226:
	cmp	w3, 31
	bhi	.L1203
.L1202:
	add	w4, w4, 1
	add	x6, x6, 8
	cmp	w4, 16
	bne	.L1199
.L1195:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1225:
	ldr	w6, [x0, 2504]
	add	x7, x19, 11124736
	add	x7, x7, 648
	mov	w4, 0
	cbz	w6, .L1207
	.p2align 2
.L1228:
	add	x2, x19, 288
	mov	w5, 32
	mov	w1, 0
	b	.L1205
	.p2align 3
.L1204:
	add	w1, w1, 1
	cmp	w1, w6
	beq	.L1227
.L1205:
	ldr	x0, [x2]
	add	x2, x2, 8
	ldr	x3, [x0, 8]
	ldrb	w0, [x0]
	cmp	w0, 2
	ldr	w0, [x3, 52]
	cset	w3, eq
	orr	w0, w3, w0, lsl 1
	cmp	w0, w4
	bne	.L1204
	cmp	w5, w1
	csel	w5, w5, w1, ls
	add	w1, w1, 1
	str	w5, [x7]
	cmp	w1, w6
	bne	.L1205
.L1227:
	cmp	w5, 31
	bhi	.L1207
.L1206:
	add	w4, w4, 1
	add	x7, x7, 4
	cmp	w4, 32
	beq	.L1195
	cbnz	w6, .L1228
	.p2align 2
.L1207:
	str	wzr, [x7]
	b	.L1206
	.p2align 3
.L1203:
	stp	wzr, wzr, [x6]
	b	.L1202
	.size	MVC_FindMinRefIdx, .-MVC_FindMinRefIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecList
	.type	MVC_DecList, %function
MVC_DecList:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 11124736
	mov	w6, -1
	ldr	w0, [x1, 412]
	cbz	w0, .L1230
	add	x2, x19, 11153408
	ldr	w0, [x1, 408]
	ldr	w7, [x2, 2764]
	cbz	w0, .L1238
	add	w4, w0, w6
	add	x1, x1, 24
	add	x4, x4, 1388544
	mov	w6, 0
	add	x4, x4, 2052
	mov	w5, 2147483647
	add	x4, x19, x4, lsl 3
	.p2align 2
.L1232:
	ldr	x2, [x1]
	add	x1, x1, 8
	cbz	x2, .L1231
	ldr	w0, [x2, 32]
	sub	w0, w7, w0
	sxtw	x0, w0
	eor	x3, x0, x0, asr 63
	sub	x3, x3, x0, asr 63
	cmp	w3, w5
	bge	.L1231
	ldr	w6, [x2, 160]
	mov	w5, w3
.L1231:
	cmp	x1, x4
	bne	.L1232
.L1230:
	add	x20, x19, 11116544
	mov	w21, -1
	ldrb	w0, [x20, 2456]
	str	w21, [x20, 4088]
	cmp	w0, 2
	str	w6, [x20, 4092]
	beq	.L1246
	mov	x0, x19
	bl	MVC_InitListX
	cbnz	w0, .L1247
	mov	x0, x19
	bl	MVC_ReorderListX
	mov	x0, x19
	bl	MVC_RepairList
	cbnz	w0, .L1239
	mov	x0, x19
	bl	MVC_FindMinRefIdx
	ldr	x0, [x19, 288]
	cbz	x0, .L1236
	ldr	x0, [x0, 8]
	ldr	w21, [x0, 160]
.L1236:
	mov	w0, 0
	str	w21, [x20, 4088]
.L1234:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1246:
	str	wzr, [x20, 2504]
	mov	w0, 0
	str	wzr, [x20, 2508]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1239:
	mov	w0, w21
	b	.L1234
.L1238:
	mov	w6, 0
	b	.L1230
.L1247:
	ldr	x2, .LC75
	mov	w1, 4619
	mov	w0, 11
	bl	dprint_normal
	mov	w0, w21
	b	.L1234
	.size	MVC_DecList, .-MVC_DecList
	.align	3
.LC75:
	.xword	.LC74
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetBackPicFromVOQueue
	.type	MVC_GetBackPicFromVOQueue, %function
MVC_GetBackPicFromVOQueue:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	mov	w23, 0
	mov	w21, 752
	bl	_mcount
	add	x0, x22, 912
	bl	ResetVoQueue
	ldr	w0, [x22, 48]
	cbz	w0, .L1255
	.p2align 2
.L1259:
	uxtw	x1, w23
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x0, x0, 4
	sub	x0, x0, x1
	umull	x20, w23, w21
	add	x0, x22, x0, lsl 4
	add	x0, x0, 11124736
	add	x20, x20, 11124736
	add	x19, x20, 1016
	add	x20, x20, 1048
	add	x19, x22, x19
	add	x20, x22, x20
	strb	wzr, [x0, 778]
	strb	wzr, [x0, 779]
.L1253:
	ldr	x1, [x19]
	cbnz	x1, .L1264
.L1252:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L1253
	ldr	w0, [x22, 48]
	add	w23, w23, 1
	cmp	w0, w23
	bhi	.L1259
.L1255:
	ldr	w0, [x22, 52]
	cbz	w0, .L1248
	sub	w1, w0, #1
	add	x0, x22, 148
	add	x1, x1, 38
	add	x22, x22, x1, lsl 2
	.p2align 2
.L1256:
	str	wzr, [x0], 4
	cmp	x0, x22
	bne	.L1256
.L1248:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1264:
	ldr	w0, [x22, 120]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L1252
	.size	MVC_GetBackPicFromVOQueue, .-MVC_GetBackPicFromVOQueue
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_RoundLog2
	.type	MVC_RoundLog2, %function
MVC_RoundLog2:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mul	w2, w19, w19
	mov	w0, 0
	mov	w3, 1
	.p2align 2
.L1266:
	add	w0, w0, 1
	lsl	w1, w3, w0
	cmp	w2, w1
	bge	.L1266
	asr	w0, w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_RoundLog2, .-MVC_RoundLog2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetReRangeFlag
	.type	MVC_GetReRangeFlag, %function
MVC_GetReRangeFlag:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x22, x20, 11116544
	mov	x19, x1
	bl	_mcount
	mov	w0, 2240
	ldr	x2, [x20, 280]
	ldr	w1, [x22, 2472]
	ldrsb	w3, [x22, 2468]
	umull	x0, w1, w0
	cmn	w3, #1
	add	x0, x2, x0
	beq	.L1285
	cbnz	w3, .L1271
	ldrb	w1, [x20, 2]
	cmp	w1, 1
	beq	.L1286
	ldr	w0, [x0, 28]
	ldr	w1, [x20, 28]
	cmp	w1, w0
	beq	.L1273
	ldr	x2, .LC77
	mov	w1, 4808
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1271:
	ldr	x2, .LC79
	mov	w1, 4817
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1285:
	ldr	w0, [x0, 28]
	mov	w21, 3992
	ldr	x1, [x20, 272]
	umull	x0, w0, w21
	add	x21, x1, x0
.L1270:
	ldrb	w0, [x21, 20]
	mov	w2, 2
	ldr	w1, [x21, 3952]
	sub	w0, w2, w0
	ldr	w3, [x21, 3948]
	ldp	w6, w5, [x20, 12]
	madd	w1, w1, w0, w0
	add	w2, w3, 1
	cmp	w6, w2
	ccmp	w5, w1, 0, eq
	bne	.L1275
	add	x0, x20, 11124736
	ldr	w3, [x21, 3972]
	mov	w4, 0
	ldr	w0, [x0, 408]
	add	w0, w0, 1
	cmp	w3, w0
	bhi	.L1275
.L1276:
	ldrb	w0, [x22, 2467]
	cmp	w0, 1
	beq	.L1287
.L1280:
	ldr	w1, [x21, 3972]
	sub	w1, w1, #1
.L1279:
	ldr	w2, [x20, 44]
	mov	w0, w4
	cmp	w2, w1
	cset	w2, ne
	orr	w4, w2, w4
	str	w4, [x19]
	str	w1, [x20, 44]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1275:
	ldr	x0, .LC80
	ldr	x4, [x0]
	cbz	x4, .L1282
	ubfiz	w2, w2, 4, 12
	ubfiz	w1, w1, 4, 12
	ldr	w0, [x20, 120]
	ubfiz	w6, w6, 4, 12
	ubfiz	w5, w5, 4, 12
	strh	w2, [x29, 60]
	strh	w1, [x29, 62]
	mov	w3, 8
	strh	w6, [x29, 56]
	add	x2, x29, 56
	strh	w5, [x29, 58]
	mov	w1, 1
	blr	x4
	ldrb	w0, [x22, 2467]
	mov	w4, 1
	cmp	w0, 1
	bne	.L1280
.L1287:
	add	x0, x20, 290816
	add	x3, x20, 11051008
	add	x0, x0, 2488
	add	x3, x3, 56
	mov	w2, 0
	.p2align 2
.L1278:
	ldr	w1, [x0]
	add	x0, x0, 335872
	add	x0, x0, 308
	cmp	w1, w2
	sub	w1, w1, #1
	csel	w2, w1, w2, hi
	cmp	x0, x3
	bne	.L1278
	add	w0, w2, 1
	mov	w1, 16
	lsl	w0, w0, 1
	cmp	w0, w1
	csel	w1, w0, w1, cc
	b	.L1279
	.p2align 3
.L1273:
	add	x21, x20, 11046912
	add	x21, x21, 180
	b	.L1270
	.p2align 3
.L1286:
	ldr	w1, [x0, 28]
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 4
	sub	x0, x0, x1
	lsl	x21, x0, 2
	sub	x21, x21, x0
	lsl	x1, x21, 6
	add	x21, x21, x1
	add	x21, x20, x21, lsl 2
	add	x21, x21, 286720
	add	x21, x21, 2612
	b	.L1270
	.p2align 3
.L1282:
	mov	w4, 1
	b	.L1276
	.size	MVC_GetReRangeFlag, .-MVC_GetReRangeFlag
	.align	3
.LC77:
	.xword	.LC76
	.align	3
.LC79:
	.xword	.LC78
	.align	3
.LC80:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecPOC
	.type	MVC_DecPOC, %function
MVC_DecPOC:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, [x19, 248]
	mov	w4, 1
	add	x0, x19, 11116544
	ldr	w3, [x2, 2900]
	ldr	w1, [x2, 2896]
	cmp	w3, w4
	ldrb	w5, [x0, 2459]
	add	w1, w1, 4
	lsl	w1, w4, w1
	beq	.L1290
	cbz	w3, .L1291
	cmp	w3, 2
	bne	.L1288
	cmp	w5, 5
	beq	.L1345
	ldrsb	w2, [x0, 1320]
	cbz	w2, .L1324
	ldr	w3, [x0, 1376]
	mov	w2, 0
	mov	w1, 0
	str	wzr, [x0, 1372]
	str	wzr, [x0, 1384]
.L1325:
	str	w1, [x0, 1380]
.L1327:
	ldrb	w4, [x0, 2464]
	add	w1, w3, w1
	str	w1, [x0, 1368]
	lsl	w1, w1, 1
	cbnz	w4, .L1328
	sub	w1, w1, #1
	str	w1, [x0, 1356]
.L1329:
	ldrb	w3, [x0, 2457]
	cbnz	w3, .L1330
	str	w1, [x0, 1344]
	str	w1, [x0, 1348]
	str	w1, [x0, 1352]
.L1323:
	ldr	w1, [x0, 1376]
	str	w1, [x0, 1372]
	str	w2, [x0, 1384]
.L1288:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1291:
	ldr	w1, [x2, 2904]
	cmp	w5, 5
	add	w1, w1, 4
	lsl	w4, w4, w1
	beq	.L1297
	ldrsb	w1, [x0, 1320]
	cbnz	w1, .L1295
	ldr	w5, [x0, 1332]
	ldr	w3, [x0, 1336]
	mov	w2, w5
.L1296:
	ldr	w1, [x0, 1324]
	cmp	w1, w3
	bcs	.L1294
	sub	w6, w3, w1
	cmp	w6, w4, lsr 1
	bcc	.L1294
	add	w2, w2, w4
	str	w2, [x0, 1340]
.L1298:
	ldrb	w3, [x0, 2457]
	cbnz	w3, .L1300
.L1348:
	ldr	w3, [x0, 1328]
	add	w1, w1, w2
	str	w1, [x0, 1344]
	add	w2, w1, w3
	str	w2, [x0, 1348]
	cmp	w1, w2
	csel	w1, w1, w2, le
	str	w1, [x0, 1356]
.L1301:
	ldr	w3, [x0, 1372]
	ldr	w2, [x0, 1376]
	str	w1, [x0, 1352]
	cmp	w2, w3
	beq	.L1303
	str	w2, [x0, 1372]
.L1303:
	ldrb	w1, [x0, 2464]
	cbz	w1, .L1288
	ldr	w2, [x0, 1324]
	ldr	w1, [x0, 1340]
	str	w1, [x0, 1332]
	str	w2, [x0, 1336]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1290:
	cmp	w5, 5
	beq	.L1346
	ldrsb	w3, [x0, 1320]
	cbz	w3, .L1306
	mov	w1, 0
	str	wzr, [x0, 1372]
	str	wzr, [x0, 1384]
.L1307:
	str	w1, [x0, 1380]
.L1305:
	ldr	w1, [x2, 2916]
	cbz	w1, .L1309
	ldr	w1, [x0, 1376]
	ldr	w5, [x0, 1380]
	ldrb	w6, [x0, 2464]
	add	w5, w5, w1
	str	w5, [x0, 1368]
	cbnz	w6, .L1311
	cbz	w5, .L1312
	sub	w5, w5, #1
	str	w5, [x0, 1368]
.L1311:
	str	wzr, [x0, 1400]
	ldr	w1, [x2, 2916]
	cmp	w1, wzr
	ble	.L1313
.L1332:
	mov	w4, 0
	mov	w3, 0
	.p2align 2
.L1314:
	add	x1, x2, x3, sxtw 2
	add	w3, w3, 1
	ldr	w1, [x1, 2920]
	add	w4, w4, w1
	str	w4, [x0, 1400]
	ldr	w1, [x2, 2916]
	cmp	w1, w3
	bgt	.L1314
.L1313:
	cbz	w5, .L1315
	sub	w5, w5, #1
	ldr	w7, [x0, 1400]
	udiv	w1, w5, w1
	str	w1, [x0, 1392]
	ldr	w4, [x2, 2916]
	udiv	w3, w5, w4
	mul	w1, w1, w7
	str	w1, [x0, 1396]
	msub	w5, w3, w4, w5
	str	w5, [x0, 1388]
	tbnz	w5, #31, .L1316
	mov	w3, 0
	.p2align 2
.L1317:
	add	x4, x2, x3, sxtw 2
	add	w3, w3, 1
	cmp	w5, w3
	ldr	w4, [x4, 2920]
	add	w1, w1, w4
	str	w1, [x0, 1396]
	bge	.L1317
.L1316:
	cbnz	w6, .L1318
	ldr	w3, [x2, 2908]
	add	w1, w1, w3
	str	w1, [x0, 1396]
.L1318:
	ldrb	w3, [x0, 2457]
	cbnz	w3, .L1319
	ldr	w3, [x0, 1360]
	ldr	w4, [x0, 1364]
	add	w1, w1, w3
	str	w1, [x0, 1344]
	ldr	w2, [x2, 2912]
	add	w2, w1, w2
	add	w2, w2, w4
	str	w2, [x0, 1348]
	cmp	w1, w2
	csel	w1, w1, w2, le
	str	w1, [x0, 1356]
.L1320:
	ldr	w3, [x0, 1376]
	ldr	w2, [x0, 1380]
	str	w1, [x0, 1352]
	str	w3, [x0, 1372]
	str	w2, [x0, 1384]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1295:
	ldrsb	w1, [x0, 1321]
	cbz	w1, .L1347
.L1297:
	ldr	w1, [x0, 1324]
	mov	w2, 0
	mov	w5, 0
	str	wzr, [x0, 1332]
	str	wzr, [x0, 1336]
.L1294:
	cmp	w1, w3
	bls	.L1299
	sub	w3, w1, w3
	cmp	w3, w4, lsr 1
	bls	.L1299
	sub	w2, w2, w4
	str	w2, [x0, 1340]
	b	.L1298
	.p2align 3
.L1345:
	add	x1, x0, 1280
	mov	w2, 0
	stp	wzr, wzr, [x1, 64]
	stp	wzr, wzr, [x1, 72]
	str	wzr, [x0, 1380]
	b	.L1323
	.p2align 3
.L1346:
	str	wzr, [x0, 1380]
	b	.L1305
	.p2align 3
.L1299:
	ldrb	w3, [x0, 2457]
	str	w5, [x0, 1340]
	cbz	w3, .L1348
.L1300:
	ldrb	w3, [x0, 2458]
	add	w1, w1, w2
	cbnz	w3, .L1302
	str	w1, [x0, 1344]
	str	w1, [x0, 1356]
	b	.L1301
	.p2align 3
.L1309:
	ldrb	w6, [x0, 2464]
	str	wzr, [x0, 1368]
.L1312:
	str	wzr, [x0, 1400]
	mov	w5, 0
	ldr	w1, [x2, 2916]
	cmp	w1, wzr
	bgt	.L1332
	.p2align 2
.L1315:
	mov	w1, 0
	str	wzr, [x0, 1396]
	b	.L1316
	.p2align 3
.L1319:
	ldrb	w3, [x0, 2458]
	cbnz	w3, .L1321
	ldr	w2, [x0, 1360]
	add	w1, w1, w2
	str	w1, [x0, 1344]
	str	w1, [x0, 1356]
	b	.L1320
	.p2align 3
.L1324:
	ldr	w2, [x0, 1372]
	ldr	w3, [x0, 1376]
	cmp	w3, w2
	ldr	w2, [x0, 1384]
	bcs	.L1326
	add	w1, w1, w2
	str	w1, [x0, 1380]
	mov	w2, w1
	b	.L1327
	.p2align 3
.L1306:
	ldr	w3, [x0, 1372]
	ldr	w4, [x0, 1376]
	cmp	w4, w3
	bcs	.L1308
	ldr	w3, [x0, 1384]
	add	w1, w3, w1
	str	w1, [x0, 1380]
	b	.L1305
	.p2align 3
.L1330:
	ldrb	w3, [x0, 2458]
	str	w1, [x0, 1352]
	cbnz	w3, .L1331
	str	w1, [x0, 1344]
	b	.L1323
	.p2align 3
.L1328:
	str	w1, [x0, 1356]
	b	.L1329
	.p2align 3
.L1302:
	str	w1, [x0, 1348]
	str	w1, [x0, 1356]
	b	.L1301
	.p2align 3
.L1321:
	ldr	w3, [x2, 2912]
	ldr	w2, [x0, 1360]
	add	w1, w1, w3
	add	w1, w1, w2
	str	w1, [x0, 1348]
	str	w1, [x0, 1356]
	b	.L1320
	.p2align 3
.L1347:
	ldr	w3, [x0, 1344]
	mov	w2, 0
	mov	w5, 0
	str	wzr, [x0, 1332]
	str	w3, [x0, 1336]
	b	.L1296
	.p2align 3
.L1331:
	str	w1, [x0, 1348]
	b	.L1323
.L1308:
	ldr	w1, [x0, 1384]
	b	.L1307
.L1326:
	mov	w1, w2
	b	.L1325
	.size	MVC_DecPOC, .-MVC_DecPOC
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_CalcPicNum
	.type	MVC_CalcPicNum, %function
MVC_CalcPicNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x8, x19, 11153408
	ldr	x0, [x19, 248]
	mov	w9, 1
	add	x1, x19, 11124736
	ldr	w0, [x0, 2896]
	ldrb	w2, [x8, 2187]
	add	w0, w0, 4
	lsl	w9, w9, w0
	cbz	w2, .L1350
	ldr	w0, [x1, 416]
	cmp	w2, 1
	cset	w6, eq
	cmp	w2, 2
	cset	w7, eq
	mov	w2, 0
	cbz	w0, .L1370
	.p2align 2
.L1387:
	add	x0, x19, x2, uxtw 3
	add	x0, x0, 11124736
	ldr	x3, [x0, 152]
	ldrb	w4, [x3, 3]
	cbz	w4, .L1364
	ldr	w4, [x3, 20]
	ldr	w5, [x8, 2752]
	cmp	w4, w5
	bls	.L1365
	sub	w4, w4, w9
	str	w4, [x3, 24]
.L1366:
	ldr	x3, [x0, 152]
	ldrb	w4, [x3, 3]
	tbz	x4, 0, .L1367
	ldr	w5, [x3, 656]
	and	w5, w5, 16776960
	cmp	w5, 65536
	beq	.L1397
.L1367:
	tbz	x4, 1, .L1364
	ldr	w0, [x3, 704]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L1398
	.p2align 2
.L1364:
	ldr	w0, [x1, 416]
	add	w2, w2, 1
	cmp	w0, w2
	bhi	.L1387
.L1370:
	ldr	w0, [x1, 420]
	mov	w2, 0
	cbz	w0, .L1349
	.p2align 2
.L1386:
	add	x0, x19, x2, uxtw 3
	add	w2, w2, 1
	add	x0, x0, 11124736
	ldr	x4, [x0, 280]
	ldrb	w3, [x4, 3]
	cbz	w3, .L1372
	tbz	x3, 0, .L1373
	ldr	w5, [x4, 656]
	and	w5, w5, 16776960
	cmp	w5, 256
	beq	.L1399
.L1373:
	tbz	x3, 1, .L1372
	ldr	w0, [x4, 704]
	and	w0, w0, 16776960
	cmp	w0, 256
	beq	.L1400
	.p2align 2
.L1372:
	ldr	w0, [x1, 420]
	cmp	w0, w2
	bhi	.L1386
.L1349:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1365:
	str	w4, [x3, 24]
	b	.L1366
	.p2align 3
.L1350:
	ldr	w2, [x1, 416]
	mov	w0, 0
	cbnz	w2, .L1385
	.p2align 2
.L1360:
	ldr	w0, [x1, 420]
	mov	w2, 0
	cbz	w0, .L1349
	uxtw	x0, w2
	add	w2, w2, 1
	add	x0, x0, 1388544
	add	x0, x19, x0, lsl 3
	ldr	x0, [x0, 16664]
	ldrb	w3, [x0, 3]
	cmp	w3, 3
	beq	.L1401
	.p2align 2
.L1361:
	ldr	w0, [x1, 420]
	cmp	w0, w2
	bls	.L1349
	uxtw	x0, w2
	add	w2, w2, 1
	add	x0, x0, 1388544
	add	x0, x19, x0, lsl 3
	ldr	x0, [x0, 16664]
	ldrb	w3, [x0, 3]
	cmp	w3, 3
	bne	.L1361
.L1401:
	ldr	w3, [x0, 608]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L1361
	ldr	w3, [x0, 28]
	str	w3, [x0, 624]
	b	.L1361
	.p2align 3
.L1403:
	ldr	w4, [x3, 608]
	and	w4, w4, 16776960
	cmp	w4, 65536
	bne	.L1356
	ldr	w4, [x3, 20]
	ldr	w5, [x8, 2752]
	cmp	w4, w5
	sub	w5, w4, w9
	bhi	.L1402
	str	w4, [x3, 24]
.L1358:
	ldr	x2, [x2, 152]
	ldr	w3, [x2, 24]
	str	w3, [x2, 628]
	.p2align 2
.L1356:
	ldr	w2, [x1, 416]
	add	w0, w0, 1
	cmp	w2, w0
	bls	.L1360
.L1385:
	add	x2, x19, x0, uxtw 3
	add	x2, x2, 11124736
	ldr	x3, [x2, 152]
	ldrb	w4, [x3, 3]
	cmp	w4, 3
	bne	.L1356
	b	.L1403
	.p2align 3
.L1399:
	ldr	w3, [x4, 28]
	add	w3, w6, w3, lsl 1
	str	w3, [x4, 672]
	ldr	x4, [x0, 280]
	ldrb	w3, [x4, 3]
	b	.L1373
	.p2align 3
.L1397:
	ldr	w4, [x3, 24]
	add	w4, w6, w4, lsl 1
	str	w4, [x3, 676]
	ldr	x3, [x0, 152]
	ldrb	w4, [x3, 3]
	b	.L1367
	.p2align 3
.L1400:
	ldr	w0, [x4, 28]
	add	w0, w7, w0, lsl 1
	str	w0, [x4, 720]
	b	.L1372
	.p2align 3
.L1398:
	ldr	w0, [x3, 24]
	add	w0, w7, w0, lsl 1
	str	w0, [x3, 724]
	b	.L1364
	.p2align 3
.L1402:
	str	w5, [x3, 24]
	b	.L1358
	.size	MVC_CalcPicNum, .-MVC_CalcPicNum
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_IsOutDPB
	.type	MVC_IsOutDPB, %function
MVC_IsOutDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1409
	add	x2, x20, 11124736
	ldr	w0, [x2, 408]
	cbz	w0, .L1409
	ldr	x1, [x2, 24]
	cmp	x19, x1
	ccmp	x1, xzr, 4, eq
	bne	.L1411
	sub	w0, w0, #1
	add	x2, x2, 32
	add	x0, x0, 1388544
	add	x0, x0, 2052
	add	x0, x20, x0, lsl 3
	b	.L1406
	.p2align 3
.L1407:
	ldr	x3, [x2], 8
	cmp	x19, x3
	ccmp	x3, xzr, 4, eq
	bne	.L1411
.L1406:
	cmp	x2, x0
	bne	.L1407
.L1409:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1411:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_IsOutDPB, .-MVC_IsOutDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_assign_quant_params
	.type	mvc_assign_quant_params, %function
mvc_assign_quant_params:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	mov	w4, 5536
	cbz	x20, .L1442
	cbz	x19, .L1444
	ldrb	w0, [x19, 18]
	cbz	w0, .L1432
	ldr	x21, .LC84
	add	x0, x19, 2016
	ldr	x22, .LC81
	add	x24, x19, 5
	mov	x26, x0
	add	x25, x19, 1984
	mov	w27, 1
	mov	w28, 0
	mov	x23, x21
	str	x0, [x29, 104]
	b	.L1417
	.p2align 3
.L1447:
	cbz	w28, .L1445
	cmp	w28, 3
	beq	.L1446
	ldr	x8, .LC84
	sub	w1, w28, #1
	add	x1, x1, 126
	mov	x2, 16
	mov	x0, x26
	ldr	x8, [x8, 104]
	add	x1, x19, x1, lsl 4
	blr	x8
.L1425:
	cmp	w27, 7
	bhi	.L1432
.L1431:
	add	w28, w28, 1
	add	w27, w27, 1
	add	x24, x24, 1
	add	x26, x26, 16
	add	x25, x25, 4
.L1417:
	cmp	w28, 5
	ldrsb	w0, [x24]
	bhi	.L1418
	cbz	w0, .L1447
	ldr	w0, [x25]
	cbz	w0, .L1425
	cmp	w28, 2
	ldr	x1, .LC81
	ldr	x8, [x23, 104]
	bls	.L1426
	add	x1, x1, 16
.L1426:
	mov	x2, 16
	mov	x0, x26
	blr	x8
	cmp	w27, 7
	bls	.L1431
	.p2align 2
.L1432:
	mov	w0, 0
.L1414:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1418:
	cbnz	w0, .L1427
	ldrb	w0, [x20, 27]
	cbnz	w0, .L1428
	ldr	x1, .LC84
	sub	w0, w28, #6
	add	x0, x0, 33
	cmp	w28, 6
	ldr	x8, [x1, 104]
	add	x0, x19, x0, lsl 6
	ldr	x1, .LC81
	beq	.L1443
	add	x1, x1, 96
.L1430:
	mov	x2, 64
	blr	x8
	b	.L1425
	.p2align 3
.L1427:
	sub	w0, w28, #6
	add	x1, x19, x0, lsl 2
	ldr	w1, [x1, 2008]
	cbz	w1, .L1425
	add	x0, x0, 33
	cmp	w28, 6
	ldr	x8, [x21, 104]
	add	x0, x19, x0, lsl 6
	beq	.L1435
	add	x1, x22, 96
	b	.L1430
	.p2align 3
.L1428:
	ldr	x0, .LC84
	sub	w1, w28, #6
	mov	x2, 64
	ldr	x8, [x0, 104]
	add	x0, x1, 33
	add	x1, x20, x1, lsl 6
	add	x1, x1, 2768
	add	x0, x19, x0, lsl 6
	blr	x8
	b	.L1425
.L1444:
	mov	w4, 5537
.L1442:
	ldr	x3, .LC82
	mov	w1, w4
	ldr	x2, .LC83
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1414
.L1445:
	ldrb	w0, [x20, 27]
	cbnz	w0, .L1421
	ldr	x0, .LC84
	mov	x2, 16
	ldr	x1, .LC81
	ldr	x8, [x0, 104]
	ldr	x0, [x29, 104]
	blr	x8
	b	.L1431
.L1446:
	ldrb	w0, [x20, 27]
	cbnz	w0, .L1424
	ldr	x0, .LC84
	mov	x2, 16
	ldr	x1, .LC85
	ldr	x8, [x0, 104]
	add	x0, x19, 2064
	blr	x8
	b	.L1431
.L1421:
	ldr	x0, .LC84
	mov	x2, 16
	add	x1, x20, 2672
	ldr	x8, [x0, 104]
	ldr	x0, [x29, 104]
	blr	x8
	b	.L1431
.L1424:
	ldr	x0, .LC84
	mov	x2, 16
	add	x1, x20, 2720
	ldr	x8, [x0, 104]
	add	x0, x19, 2064
	blr	x8
	b	.L1431
.L1435:
	ldr	x1, .LC81
.L1443:
	add	x1, x1, 32
	b	.L1430
	.size	mvc_assign_quant_params, .-mvc_assign_quant_params
	.align	3
.LC81:
	.xword	.LANCHOR2
	.align	3
.LC82:
	.xword	.LC37
	.align	3
.LC83:
	.xword	.LC39
	.align	3
.LC84:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC85:
	.xword	.LANCHOR2+16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_WritePicMsg
	.type	MVC_WritePicMsg, %function
MVC_WritePicMsg:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x23, x20, 11153408
	add	x19, x20, 11157504
	bl	_mcount
	add	x22, x20, 11108352
	ldr	x2, .LC87
	mov	w1, 6065
	ldrb	w4, [x23, 2187]
	mov	w0, 3
	ldr	w5, [x23, 2288]
	add	x25, x20, 11112448
	ldr	w3, [x23, 2760]
	ldr	w6, [x23, 2820]
	bl	dprint_normal
	str	wzr, [x20, 64]
	ldr	x0, [x20, 864]
	str	x0, [x19, 1304]
	add	x0, x20, 11116544
	ldr	w1, [x23, 2572]
	str	w1, [x19, 1080]
	ldr	w1, [x23, 2576]
	str	w1, [x19, 1084]
	ldr	w1, [x23, 2580]
	str	w1, [x19, 1088]
	ldr	w1, [x23, 2584]
	str	w1, [x19, 1092]
	ldr	w1, [x23, 2760]
	str	w1, [x19, 512]
	ldrb	w1, [x23, 2187]
	strb	w1, [x19, 504]
	ldr	x1, [x20, 248]
	ldrb	w2, [x1, 21]
	str	w2, [x19, 528]
	ldr	w2, [x23, 2804]
	str	w2, [x19, 516]
	ldr	w2, [x23, 2808]
	str	w2, [x19, 520]
	ldr	w2, [x1, 3948]
	add	w2, w2, 1
	str	w2, [x19, 524]
	ldrb	w2, [x22, 3300]
	strb	w2, [x19, 507]
	ldr	w2, [x25, 3236]
	str	w2, [x19, 532]
	ldrb	w2, [x25, 3176]
	str	w2, [x19, 536]
	ldr	w1, [x1, 748]
	strb	w1, [x19, 505]
	ldrb	w1, [x25, 3180]
	str	w1, [x19, 540]
	ldr	w1, [x0, 1356]
	str	w1, [x19, 544]
	ldr	w1, [x0, 1344]
	str	w1, [x19, 548]
	ldr	w0, [x0, 1348]
	str	w0, [x19, 552]
	ldr	x1, [x23, 2736]
	ldr	w0, [x20, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_GetLogicFs
	mov	x24, x0
	cbz	x0, .L1482
	ldr	x3, [x0, 24]
	ldr	x4, [x0, 40]
	cbz	x3, .L1452
	cbz	x4, .L1452
	ldr	w0, [x20, 120]
	add	x2, x19, 804
	add	x1, x19, 940
	add	x21, x20, 11124736
	bl	FSP_GetDecFsAddrTab
	ldr	w0, [x24, 200]
	add	x2, x19, 944
	str	w0, [x19, 932]
	add	x1, x19, 1072
	ldr	x0, [x24, 24]
	ldr	w0, [x0, 36]
	str	w0, [x19, 788]
	ldrb	w0, [x24, 424]
	strb	w0, [x19, 508]
	ldr	w0, [x20, 120]
	bl	FSP_GetPmvAddrTab
	ldr	w0, [x23, 2820]
	str	w0, [x19, 796]
	ldr	x0, [x24, 40]
	ldr	w0, [x0, 16]
	str	w0, [x19, 1076]
	ldr	x0, [x24, 24]
	ldr	w0, [x0, 4]
	str	w0, [x19, 792]
	ldr	x0, [x24, 24]
	ldr	w0, [x0, 72]
	str	w0, [x19, 800]
	ldr	w4, [x21, 640]
	str	w4, [x19, 1296]
	cbz	w4, .L1458
	sub	w3, w4, #1
	add	x0, x21, 448
	add	x3, x3, 2781184
	add	x1, x19, 1104
	add	x3, x3, 113
	add	x3, x20, x3, lsl 2
	.p2align 2
.L1457:
	ldr	w2, [x0]
	add	x0, x0, 4
	str	w2, [x1]
	add	x1, x1, 4
	cmp	x3, x0
	ldr	w2, [x0, 60]
	str	w2, [x1, 60]
	ldr	w2, [x0, 124]
	str	w2, [x1, 124]
	bne	.L1457
.L1458:
	ldrb	w0, [x22, 3307]
	cbnz	w0, .L1483
	ldrb	w0, [x25, 3194]
	cbnz	w0, .L1459
	ldr	x9, .LC92
	add	x5, x19, 556
	mov	w1, 0
	.p2align 2
.L1460:
	and	w2, w1, 3
	add	x0, x9, 352
	add	w1, w1, 1
	cmp	w1, 24
	ldr	w0, [x0, w2, uxtw 2]
	ubfx	x3, x0, 8, 8
	lsr	w2, w0, 16
	ubfiz	w2, w2, 8, 8
	and	w0, w0, -16776961
	orr	w2, w2, w3, lsl 16
	orr	w0, w2, w0
	str	w0, [x5], 4
	bne	.L1460
	add	x19, x19, 652
	mov	w5, 0
	.p2align 2
.L1461:
	add	w0, w5, 1
	and	w2, w5, 14
	add	x1, x9, 368
	and	w0, w0, 15
	add	x19, x19, 8
	add	w5, w5, 2
	cmp	w5, 32
	ldr	w0, [x1, w0, uxtw 2]
	ldr	w1, [x1, w2, uxtw 2]
	lsr	w7, w0, 16
	ubfx	x2, x0, 8, 8
	lsr	w3, w1, 16
	lsr	w6, w1, 24
	ubfiz	w10, w0, 16, 8
	ubfiz	w8, w3, 8, 8
	and	w0, w0, -16777216
	and	w3, w1, 255
	ubfx	x1, x1, 8, 8
	orr	w0, w0, w2, lsl 16
	orr	w7, w10, w7, lsl 24
	orr	w3, w8, w3
	orr	w1, w1, w6, lsl 8
	orr	w2, w7, w3
	orr	w0, w1, w0
	stp	w2, w0, [x19, -8]
	bne	.L1461
.L1467:
	mov	w22, 0
	cbz	w4, .L1463
	.p2align 2
.L1471:
	add	x19, x20, x22, uxtw 2
	ldr	w0, [x20, 120]
	add	x23, x19, 11124736
	add	x19, x19, 11157504
	add	w22, w22, 1
	ldr	w1, [x23, 448]
	bl	FSP_GetStoreType
	cmp	w0, wzr
	cset	w0, ne
	str	w0, [x19, 1312]
	ldr	w0, [x23, 448]
	str	w0, [x19, 1376]
	ldr	w0, [x21, 640]
	cmp	w0, w22
	bhi	.L1471
.L1463:
	mov	w0, 0
.L1450:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1483:
	ldrb	w0, [x25, 3194]
.L1459:
	cmp	w0, 1
	add	x5, x19, 556
	mov	w1, 0
	beq	.L1465
	.p2align 2
.L1468:
	uxtw	x0, w1
	add	w1, w1, 1
	add	x0, x0, 2777088
	cmp	w1, 24
	add	x0, x0, 1488
	ldr	w0, [x20, x0, lsl 2]
	ubfx	x3, x0, 8, 8
	lsr	w2, w0, 16
	ubfiz	w2, w2, 8, 8
	and	w0, w0, -16776961
	orr	w2, w2, w3, lsl 16
	orr	w0, w2, w0
	str	w0, [x5], 4
	bne	.L1468
	add	x19, x19, 652
	mov	w9, 1
	mov	w5, 0
	.p2align 2
.L1469:
	ubfx	x1, x5, 3, 29
	ubfiz	x0, x5, 1, 3
	and	x2, x9, 15
	lsl	x1, x1, 4
	add	x2, x1, x2
	add	x1, x1, x0
	add	x1, x1, 2777088
	add	x0, x2, 2777088
	add	x0, x0, 1512
	add	x1, x1, 1512
	add	x19, x19, 8
	add	w5, w5, 1
	cmp	w5, 16
	add	w9, w9, 2
	ldr	w0, [x20, x0, lsl 2]
	ldr	w1, [x20, x1, lsl 2]
	lsr	w3, w0, 16
	ubfx	x7, x0, 8, 8
	lsr	w8, w1, 16
	lsr	w6, w1, 24
	ubfiz	w10, w8, 8, 8
	ubfiz	w11, w0, 16, 8
	and	w8, w1, 255
	ubfx	x2, x1, 8, 8
	lsl	w6, w6, 8
	and	w1, w0, -16777216
	orr	w0, w2, w1
	orr	w8, w10, w8
	orr	w3, w11, w3, lsl 24
	orr	w6, w6, w7, lsl 16
	orr	w1, w8, w3
	orr	w0, w6, w0
	stp	w1, w0, [x19, -8]
	bne	.L1469
	b	.L1467
	.p2align 3
.L1465:
	uxtw	x0, w1
	add	w1, w1, 1
	add	x0, x0, 2777088
	cmp	w1, 24
	add	x0, x20, x0, lsl 2
	ldr	w0, [x0, 9288]
	ubfx	x3, x0, 8, 8
	lsr	w2, w0, 16
	ubfiz	w2, w2, 8, 8
	and	w0, w0, -16776961
	orr	w2, w2, w3, lsl 16
	orr	w0, w2, w0
	str	w0, [x5], 4
	bne	.L1465
	add	x19, x19, 652
	mov	w9, 1
	mov	w5, 0
	.p2align 2
.L1466:
	ubfx	x1, x5, 3, 29
	ubfiz	x0, x5, 1, 3
	and	x2, x9, 15
	lsl	x1, x1, 4
	add	x2, x1, x2
	add	x1, x1, x0
	add	x1, x1, 2777088
	add	x0, x2, 2777088
	add	x19, x19, 8
	add	w5, w5, 1
	add	x0, x20, x0, lsl 2
	add	x1, x20, x1, lsl 2
	cmp	w5, 16
	add	w9, w9, 2
	ldr	w0, [x0, 9384]
	ldr	w1, [x1, 9384]
	lsr	w8, w0, 16
	ubfx	x7, x0, 8, 8
	lsr	w3, w1, 16
	lsr	w6, w1, 24
	ubfiz	w11, w0, 16, 8
	ubfiz	w10, w3, 8, 8
	ubfx	x2, x1, 8, 8
	and	w3, w1, 255
	lsl	w6, w6, 8
	and	w1, w0, -16777216
	orr	w0, w2, w1
	orr	w8, w11, w8, lsl 24
	orr	w3, w10, w3
	orr	w6, w6, w7, lsl 16
	orr	w1, w8, w3
	orr	w0, w6, w0
	stp	w1, w0, [x19, -8]
	bne	.L1466
	b	.L1467
.L1452:
	ldr	x2, .LC91
	mov	w1, 6100
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1450
.L1482:
	ldr	x3, [x23, 2736]
	mov	w1, 6094
	ldr	x2, .LC89
	mov	w0, 0
	ldrsb	w3, [x3, 6]
	bl	dprint_normal
	mov	w0, -1
	b	.L1450
	.size	MVC_WritePicMsg, .-MVC_WritePicMsg
	.align	3
.LC87:
	.xword	.LC86
	.align	3
.LC89:
	.xword	.LC88
	.align	3
.LC91:
	.xword	.LC90
	.align	3
.LC92:
	.xword	.LANCHOR2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UpdatePicQpInf
	.type	MVC_UpdatePicQpInf, %function
MVC_UpdatePicQpInf:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	ldp	w1, w0, [x19, 36]
	cmp	w1, w20
	csel	w1, w1, w20, ge
	cmp	w0, w20
	csel	w0, w0, w20, le
	stp	w1, w0, [x19, 36]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_UpdatePicQpInf, .-MVC_UpdatePicQpInf
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_WriteSliceMsg
	.type	MVC_WriteSliceMsg, %function
MVC_WriteSliceMsg:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w5, [x19, 64]
	ldr	w1, [x19, 32]
	add	w0, w5, 1
	ldr	x6, [x19, 864]
	uxtw	x21, w5
	sub	w1, w1, #1
	lsl	x4, x21, 7
	cmp	w5, w1
	sub	x4, x4, x21
	str	w0, [x19, 64]
	lsl	x4, x4, 5
	add	x22, x6, x4
	bcs	.L1486
	lsl	x1, x0, 7
	sub	x0, x1, x0
	add	x0, x6, x0, lsl 5
	str	x0, [x22, 4056]
.L1487:
	ldr	x3, [x19, 240]
	ldrb	w2, [x3]
	ldr	w0, [x3, 76]
	cmp	w2, 1
	ccmp	w2, w0, 2, ls
	bcs	.L1488
	.p2align 2
.L1489:
	uxtw	x0, w2
	add	w2, w2, 1
	lsl	x1, x0, 5
	add	x3, x3, x1
	add	x0, x22, x0, lsl 2
	ldr	w3, [x3, 28]
	str	w3, [x0, 16]
	ldr	x3, [x19, 240]
	add	x3, x3, x1
	ldr	w3, [x3, 24]
	str	w3, [x0, 8]
	ldr	x3, [x19, 240]
	add	x1, x3, x1
	ldr	w1, [x1, 32]
	str	w1, [x0, 24]
	ldr	x3, [x19, 240]
	ldr	w0, [x3, 76]
	cmp	w0, w2
	ccmp	w2, 1, 2, hi
	bls	.L1489
.L1488:
	cmp	w0, 1
	bhi	.L1494
	.p2align 2
.L1565:
	add	x1, x22, x0, uxtw 2
	add	w0, w0, 1
	cmp	w0, 2
	str	wzr, [x1, 8]
	str	wzr, [x1, 16]
	str	wzr, [x1, 24]
	bne	.L1565
.L1494:
	add	x20, x19, 11153408
	add	x23, x19, 11112448
	add	x27, x19, 11116544
	ldrb	w0, [x20, 2193]
	strb	w0, [x22, 1]
	ldr	w0, [x23, 3224]
	add	w1, w0, 26
	ldr	w0, [x27, 4072]
	add	w0, w1, w0
	str	w0, [x22, 32]
	cbnz	w5, .L1590
	ldr	x1, [x20, 2736]
	str	w0, [x1, 644]
	ldr	x0, [x20, 2736]
	ldr	w1, [x22, 32]
	str	w1, [x0, 648]
.L1495:
	ldr	w0, [x27, 4068]
	str	w0, [x22, 36]
	ldr	w0, [x27, 2520]
	str	w0, [x22, 40]
	ldr	w0, [x27, 2516]
	str	w0, [x22, 44]
	ldrb	w0, [x27, 2456]
	strb	w0, [x6, x4]
	ldr	w0, [x27, 2512]
	str	w0, [x22, 48]
	ldrb	w0, [x27, 2462]
	strb	w0, [x22, 2]
	ldr	x0, [x19, 248]
	ldrb	w0, [x0, 22]
	strb	w0, [x22, 3]
	ldr	w0, [x27, 2504]
	str	w0, [x22, 52]
	ldr	w0, [x27, 2508]
	str	w0, [x22, 56]
	ldrb	w0, [x27, 2456]
	cmp	w0, 1
	beq	.L1591
	cbz	w0, .L1592
	strb	wzr, [x22, 4]
.L1497:
	ldr	w0, [x23, 3228]
	str	w0, [x22, 60]
	ldr	w0, [x23, 3232]
	str	w0, [x22, 64]
	ldr	w0, [x27, 4080]
	str	w0, [x22, 68]
	ldr	w0, [x27, 4084]
	str	w0, [x22, 72]
	ldr	w0, [x27, 4076]
	str	w0, [x22, 76]
	ldrb	w0, [x27, 2456]
	cmp	w0, 2
	beq	.L1536
	ldr	w0, [x27, 2504]
	cbz	w0, .L1539
	ldr	x1, [x19, 288]
	ldr	x1, [x1, 8]
	ldrb	w2, [x1, 1]
	cbz	w2, .L1502
	sub	w3, w0, #1
	mov	x0, x19
	add	x3, x19, x3, lsl 3
	b	.L1504
	.p2align 3
.L1506:
	ldr	x1, [x0, 296]
	add	x0, x0, 8
	ldr	x1, [x1, 8]
	ldrb	w2, [x1, 1]
	cbz	w2, .L1502
.L1504:
	cmp	x3, x0
	bne	.L1506
.L1539:
	mov	w24, 0
.L1501:
	ldr	w0, [x27, 2508]
	cbz	w0, .L1540
	ldr	x1, [x19, 552]
	ldr	x1, [x1, 8]
	ldrb	w2, [x1, 1]
	cbz	w2, .L1508
	sub	w3, w0, #1
	mov	x0, x19
	add	x3, x19, x3, lsl 3
	b	.L1510
	.p2align 3
.L1512:
	ldr	x1, [x0, 560]
	add	x0, x0, 8
	ldr	x1, [x1, 8]
	ldrb	w2, [x1, 1]
	cbz	w2, .L1508
.L1510:
	cmp	x3, x0
	bne	.L1512
.L1540:
	mov	w25, 0
.L1507:
	ldrb	w0, [x20, 2187]
	cbz	w0, .L1513
	ldr	w0, [x27, 2504]
	mov	w28, 0
	cbnz	w0, .L1564
	b	.L1529
	.p2align 3
.L1594:
	cbz	x0, .L1546
	ldr	x0, [x0, 24]
	ldr	w1, [x0, 36]
.L1525:
	lsl	x0, x20, 5
	add	x0, x0, x20, lsl 2
	add	x0, x22, x0
	str	w1, [x0, 1640]
	ldr	x1, [x26, 288]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 52]
	str	w1, [x0, 1644]
	ldr	x1, [x26, 288]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 32]
	str	w1, [x0, 1632]
	ldr	x1, [x26, 288]
	ldrb	w1, [x1]
	strb	w1, [x0, 1624]
	ldr	x1, [x26, 288]
	ldr	x1, [x1, 8]
	ldrb	w1, [x1, 608]
	strb	w1, [x0, 1626]
	ldr	x1, [x26, 288]
	ldrb	w1, [x1]
	cmp	w1, 1
	beq	.L1593
	strb	w1, [x0, 1630]
	add	w28, w28, 1
	ldr	x1, [x26, 288]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 1631]
	ldr	x1, [x26, 288]
	ldr	w1, [x1, 24]
	str	w1, [x0, 1656]
	ldr	w0, [x27, 2504]
	cmp	w0, w28
	bls	.L1529
.L1564:
	uxtw	x20, w28
	ldr	w0, [x19, 120]
	add	x26, x19, x20, lsl 3
	ldr	x1, [x26, 288]
	ldr	x1, [x1, 8]
	ldrsb	w1, [x1, 6]
	bl	FSP_GetLogicFs
	ldr	x2, [x26, 288]
	lsl	x1, x20, 5
	add	x1, x1, x20, lsl 2
	add	x1, x22, x1
	ldr	x2, [x2, 8]
	ldr	w2, [x2, 48]
	str	w2, [x1, 1636]
	ldr	x2, [x26, 288]
	ldr	x2, [x2, 8]
	ldrb	w2, [x2, 2]
	strb	w2, [x1, 1625]
	ldr	x1, [x26, 288]
	ldr	x1, [x1, 8]
	ldrb	w1, [x1, 1]
	cmp	w1, 1
	bne	.L1594
	mov	w1, w24
	b	.L1525
	.p2align 3
.L1486:
	str	xzr, [x22, 4056]
	b	.L1487
	.p2align 3
.L1590:
	ldr	x1, [x20, 2736]
	ldr	w2, [x1, 644]
	cmp	w2, w0
	csel	w2, w2, w0, ge
	str	w2, [x1, 644]
	ldr	w2, [x1, 648]
	cmp	w2, w0
	csel	w0, w2, w0, le
	str	w0, [x1, 648]
	b	.L1495
	.p2align 3
.L1592:
	ldrb	w0, [x23, 3178]
	strb	w0, [x22, 4]
	b	.L1497
	.p2align 3
.L1593:
	strb	w1, [x0, 1628]
	add	w28, w28, 1
	ldr	x1, [x26, 288]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 1629]
	ldr	x1, [x26, 288]
	ldr	w1, [x1, 24]
	str	w1, [x0, 1652]
	ldr	w0, [x27, 2504]
	cmp	w0, w28
	bhi	.L1564
.L1529:
	ldrb	w0, [x27, 2456]
	cmp	w0, 1
	beq	.L1595
.L1516:
	add	x1, x19, 11124736
	add	x0, x22, 3928
	add	x1, x1, 648
	add	x3, x22, 4056
	.p2align 2
.L1522:
	ldr	w2, [x1], 4
	str	w2, [x0], 4
	cmp	x3, x0
	bne	.L1522
	add	x0, x19, 11157504
	ldrb	w1, [x23, 3178]
	str	w1, [x0, 780]
	ldr	w2, [x23, 3220]
	str	w2, [x0, 784]
	cbz	w1, .L1534
	ldrb	w0, [x27, 2456]
	cbnz	w0, .L1534
.L1535:
	ldr	w0, [x27, 2524]
	mov	w2, 0
	str	w0, [x22, 80]
	ldr	w0, [x27, 2528]
	str	w0, [x22, 84]
	.p2align 2
.L1537:
	ubfiz	x0, x2, 2, 32
	add	w2, w2, 1
	add	x1, x19, x0
	add	x0, x22, x0
	add	x1, x1, 11116544
	ldr	w3, [x1, 2532]
	str	w3, [x0, 88]
	ldr	w3, [x1, 2660]
	str	w3, [x0, 216]
	ldr	w3, [x1, 2788]
	str	w3, [x0, 344]
	ldr	w3, [x1, 3300]
	str	w3, [x0, 856]
	ldr	w3, [x1, 3428]
	str	w3, [x0, 984]
	ldr	w1, [x1, 3556]
	str	w1, [x0, 1112]
	ldr	w0, [x27, 2516]
	cmp	w0, w2
	bcs	.L1537
	ldrb	w0, [x27, 2456]
	cmp	w0, 1
	beq	.L1596
	.p2align 2
.L1536:
	add	x21, x21, 1392640
	ldr	x0, [x19, 240]
	add	x21, x19, x21, lsl 3
	str	x0, [x21, 15800]
	str	xzr, [x19, 240]
.L1485:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1546:
	mov	w1, 0
	b	.L1525
	.p2align 3
.L1502:
	ldrsb	w1, [x1, 6]
	ldr	w0, [x19, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L1597
	ldr	x0, [x0, 24]
	ldr	w24, [x0, 36]
	b	.L1501
	.p2align 3
.L1534:
	cmp	w2, 1
	bne	.L1536
	ldrb	w0, [x27, 2456]
	cmp	w0, 1
	bne	.L1536
	b	.L1535
	.p2align 3
.L1513:
	ldr	w0, [x27, 2504]
	mov	w28, 0
	cbnz	w0, .L1563
	b	.L1521
	.p2align 3
.L1598:
	cbz	x0, .L1542
	ldr	x0, [x0, 24]
	ldr	w1, [x0, 36]
.L1519:
	lsl	x0, x20, 5
	add	w28, w28, 1
	add	x0, x0, x20, lsl 2
	add	x0, x22, x0
	str	w1, [x0, 1640]
	ldr	x1, [x26, 288]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 52]
	str	w1, [x0, 1644]
	ldr	x1, [x26, 288]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 32]
	str	w1, [x0, 1632]
	ldr	x1, [x26, 288]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 1627]
	ldr	x1, [x26, 288]
	ldrb	w1, [x1]
	strb	w1, [x0, 1626]
	ldr	x1, [x26, 288]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 632]
	str	w1, [x0, 1648]
	ldr	x1, [x26, 288]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 680]
	str	w1, [x0, 1652]
	ldr	x1, [x26, 288]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 728]
	str	w1, [x0, 1656]
	strb	wzr, [x0, 1624]
	ldr	w0, [x27, 2504]
	cmp	w0, w28
	bls	.L1521
.L1563:
	uxtw	x20, w28
	ldr	w0, [x19, 120]
	add	x26, x19, x20, lsl 3
	ldr	x1, [x26, 288]
	ldr	x1, [x1, 8]
	ldrsb	w1, [x1, 6]
	bl	FSP_GetLogicFs
	ldr	x2, [x26, 288]
	lsl	x1, x20, 5
	add	x1, x1, x20, lsl 2
	add	x1, x22, x1
	ldr	x2, [x2, 8]
	ldr	w2, [x2, 48]
	str	w2, [x1, 1636]
	ldr	x2, [x26, 288]
	ldr	x2, [x2, 8]
	ldrb	w2, [x2, 2]
	strb	w2, [x1, 1625]
	ldr	x1, [x26, 288]
	ldr	x1, [x1, 8]
	ldrb	w1, [x1, 1]
	cmp	w1, 1
	bne	.L1598
	mov	w1, w24
	b	.L1519
	.p2align 3
.L1542:
	mov	w1, 0
	b	.L1519
	.p2align 3
.L1521:
	ldrb	w0, [x27, 2456]
	cmp	w0, 1
	bne	.L1516
	ldr	w0, [x27, 2508]
	cbz	w0, .L1516
	mov	w26, 0
	b	.L1524
	.p2align 3
.L1599:
	cbz	x0, .L1544
	ldr	x0, [x0, 24]
	ldr	w1, [x0, 36]
.L1523:
	lsl	x0, x20, 5
	add	w26, w26, 1
	add	x0, x0, x20, lsl 2
	add	x0, x22, x0
	str	w1, [x0, 1640]
	ldr	x1, [x24, 552]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 52]
	str	w1, [x0, 2796]
	ldr	x1, [x24, 552]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 32]
	str	w1, [x0, 2784]
	ldr	x1, [x24, 552]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2779]
	ldr	x1, [x24, 552]
	ldrb	w1, [x1]
	strb	w1, [x0, 2778]
	ldr	x1, [x24, 552]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 632]
	str	w1, [x0, 2800]
	ldr	x1, [x24, 552]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 680]
	str	w1, [x0, 2804]
	ldr	x1, [x24, 552]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 728]
	str	w1, [x0, 2808]
	strb	wzr, [x0, 2776]
	ldr	w0, [x27, 2508]
	cmp	w0, w26
	bls	.L1516
.L1524:
	uxtw	x20, w26
	ldr	w0, [x19, 120]
	add	x24, x19, x20, lsl 3
	ldr	x1, [x24, 552]
	ldr	x1, [x1, 8]
	ldrsb	w1, [x1, 6]
	bl	FSP_GetLogicFs
	ldr	x1, [x24, 552]
	ldr	x1, [x1, 8]
	ldr	w2, [x1, 48]
	lsl	x1, x20, 5
	add	x1, x1, x20, lsl 2
	add	x1, x22, x1
	str	w2, [x1, 2788]
	ldr	x2, [x24, 552]
	ldr	x2, [x2, 8]
	ldrb	w2, [x2, 2]
	strb	w2, [x1, 2777]
	ldr	x1, [x24, 552]
	ldr	x1, [x1, 8]
	ldrb	w1, [x1, 1]
	cmp	w1, 1
	bne	.L1599
	mov	w1, w25
	b	.L1523
	.p2align 3
.L1508:
	ldrsb	w1, [x1, 6]
	ldr	w0, [x19, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L1600
	ldr	x0, [x0, 24]
	ldr	w25, [x0, 36]
	b	.L1507
	.p2align 3
.L1591:
	ldr	w0, [x23, 3220]
	strb	w0, [x22, 4]
	b	.L1497
.L1596:
	mov	w2, 0
	.p2align 2
.L1538:
	ubfiz	x0, x2, 2, 32
	add	w2, w2, 1
	add	x1, x19, x0
	add	x0, x22, x0
	add	x1, x1, 11116544
	ldr	w3, [x1, 2916]
	str	w3, [x0, 472]
	ldr	w3, [x1, 3044]
	str	w3, [x0, 600]
	ldr	w3, [x1, 3172]
	str	w3, [x0, 728]
	ldr	w3, [x1, 3684]
	str	w3, [x0, 1240]
	ldr	w3, [x1, 3812]
	str	w3, [x0, 1368]
	ldr	w1, [x1, 3940]
	str	w1, [x0, 1496]
	ldr	w0, [x27, 2520]
	cmp	w0, w2
	bcs	.L1538
	b	.L1536
.L1544:
	mov	w1, 0
	b	.L1523
.L1595:
	ldr	w0, [x27, 2508]
	cbz	w0, .L1516
	mov	w26, 0
	b	.L1533
	.p2align 3
.L1602:
	cbz	x0, .L1548
	ldr	x0, [x0, 24]
	ldr	w1, [x0, 36]
.L1530:
	lsl	x0, x20, 5
	add	x0, x0, x20, lsl 2
	add	x0, x22, x0
	str	w1, [x0, 2792]
	ldr	x1, [x24, 552]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 52]
	str	w1, [x0, 2796]
	ldr	x1, [x24, 552]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 32]
	str	w1, [x0, 2784]
	ldr	x1, [x24, 552]
	ldrb	w1, [x1]
	strb	w1, [x0, 2776]
	ldr	x1, [x24, 552]
	ldr	x1, [x1, 8]
	ldrb	w1, [x1, 608]
	strb	w1, [x0, 2778]
	ldr	x1, [x24, 552]
	ldrb	w1, [x1]
	cmp	w1, 1
	beq	.L1601
	strb	w1, [x0, 2782]
	ldr	x1, [x24, 552]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2783]
	ldr	x1, [x24, 552]
	ldr	w1, [x1, 24]
	str	w1, [x0, 2808]
.L1532:
	ldr	w0, [x27, 2508]
	add	w26, w26, 1
	cmp	w0, w26
	bls	.L1516
.L1533:
	uxtw	x20, w26
	ldr	w0, [x19, 120]
	add	x24, x19, x20, lsl 3
	ldr	x1, [x24, 552]
	ldr	x1, [x1, 8]
	ldrsb	w1, [x1, 6]
	bl	FSP_GetLogicFs
	ldr	x2, [x24, 552]
	lsl	x1, x20, 5
	add	x1, x1, x20, lsl 2
	add	x1, x22, x1
	ldr	x2, [x2, 8]
	ldr	w2, [x2, 48]
	str	w2, [x1, 2788]
	ldr	x2, [x24, 552]
	ldr	x2, [x2, 8]
	ldrb	w2, [x2, 2]
	strb	w2, [x1, 2777]
	ldr	x1, [x24, 552]
	ldr	x1, [x1, 8]
	ldrb	w1, [x1, 1]
	cmp	w1, 1
	bne	.L1602
	mov	w1, w25
	b	.L1530
	.p2align 3
.L1601:
	strb	w1, [x0, 2780]
	ldr	x1, [x24, 552]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2781]
	ldr	x1, [x24, 552]
	ldr	w1, [x1, 24]
	str	w1, [x0, 2804]
	b	.L1532
.L1548:
	mov	w1, 0
	b	.L1530
.L1597:
	ldr	x3, .LC95
	mov	w4, 6312
	ldr	x2, .LC97
	mov	w1, w4
	add	x3, x3, 24
	bl	dprint_normal
	b	.L1485
.L1600:
	ldr	x3, .LC95
	mov	w4, 6332
	ldr	x2, .LC97
	mov	w1, w4
	add	x3, x3, 24
	bl	dprint_normal
	b	.L1485
	.size	MVC_WriteSliceMsg, .-MVC_WriteSliceMsg
	.align	3
.LC95:
	.xword	.LANCHOR1
	.align	3
.LC97:
	.xword	.LC96
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetPicStreamSize
	.type	MVC_GetPicStreamSize, %function
MVC_GetPicStreamSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 11157504
	bl	_mcount
	mov	w0, 0
	ldr	x2, [x19, 1304]
	cbz	x2, .L1604
	.p2align 2
.L1605:
	ldp	w3, w1, [x2, 8]
	ldr	x2, [x2, 4056]
	add	w1, w3, w1
	add	w1, w1, 7
	add	w0, w0, w1, lsr 3
	cbnz	x2, .L1605
.L1604:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_GetPicStreamSize, .-MVC_GetPicStreamSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_SliceCheck
	.type	MVC_SliceCheck, %function
MVC_SliceCheck:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 11116544
	bl	_mcount
	ldr	x1, .LC99
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x21, 2512]
	ldrb	w1, [x19, 10]
	cbnz	w1, .L1618
	mov	w1, 1048575
	cmp	w0, w1
	bhi	.L1619
	ldp	w1, w2, [x19, 12]
	mul	w1, w1, w2
	sub	w1, w1, #1
	cmp	w0, w1
	bhi	.L1618
	ldr	x1, .LC103
	mov	x0, x19
	bl	mvc_ue_v
	mov	w3, w0
	ldr	x2, .LC105
	mov	w20, w0
	mov	w1, 6711
	mov	w0, 17
	bl	dprint_normal
	ldrb	w0, [x19, 10]
	cbnz	w0, .L1618
	cmp	w20, 9
	bls	.L1620
	ldr	x2, .LC108
	mov	w3, w20
	mov	w1, 6736
	mov	w0, 1
	bl	dprint_normal
.L1618:
	mov	w0, -1
.L1610:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1620:
	ldr	x0, .LC106
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx1615
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1615:
	.section	.rodata
	.align	0
	.align	2
.L1615:
	.byte	(.L1614 - .Lrtx1615) / 4
	.byte	(.L1616 - .Lrtx1615) / 4
	.byte	(.L1617 - .Lrtx1615) / 4
	.byte	(.L1614 - .Lrtx1615) / 4
	.byte	(.L1617 - .Lrtx1615) / 4
	.byte	(.L1614 - .Lrtx1615) / 4
	.byte	(.L1616 - .Lrtx1615) / 4
	.byte	(.L1617 - .Lrtx1615) / 4
	.byte	(.L1614 - .Lrtx1615) / 4
	.byte	(.L1617 - .Lrtx1615) / 4
	.text
	.p2align 3
.L1614:
	strb	wzr, [x21, 2456]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1617:
	mov	w1, 2
	strb	w1, [x21, 2456]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1616:
	mov	w1, 1
	strb	w1, [x21, 2456]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1619:
	ldr	x2, .LC101
	mov	w1, 6699
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1610
	.size	MVC_SliceCheck, .-MVC_SliceCheck
	.align	3
.LC99:
	.xword	.LC98
	.align	3
.LC101:
	.xword	.LC100
	.align	3
.LC103:
	.xword	.LC102
	.align	3
.LC105:
	.xword	.LC104
	.align	3
.LC106:
	.xword	.L1615
	.align	3
.LC108:
	.xword	.LC107
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_PPSSPSCheck
	.type	MVC_PPSSPSCheck, %function
MVC_PPSSPSCheck:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 11116544
	bl	_mcount
	ldr	x2, .LC110
	mov	w1, 6750
	ldr	w3, [x19, 2472]
	mov	w0, 17
	bl	dprint_normal
	ldr	w3, [x19, 2472]
	mov	w0, 2240
	ldr	x2, [x20, 280]
	umull	x0, w3, w0
	add	x2, x2, x0
	ldrb	w0, [x2, 19]
	cbz	w0, .L1631
	ldrsb	w19, [x19, 2468]
	cmn	w19, #1
	beq	.L1632
	cbnz	w19, .L1626
	ldr	w3, [x2, 28]
	uxtw	x1, w3
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 4
	sub	x0, x0, x1
	lsl	x1, x0, 2
	sub	x1, x1, x0
	lsl	x0, x1, 6
	add	x1, x1, x0
	lsl	x1, x1, 2
	add	x0, x20, x1
	add	x1, x1, 286720
	add	x4, x0, 12288
	add	x1, x20, x1
	add	x1, x1, 2612
	ldrb	w4, [x4, 2396]
	cbz	w4, .L1627
	add	x0, x0, 286720
	ldrb	w0, [x0, 2637]
	cbz	w0, .L1627
.L1625:
	mov	w0, 0
	stp	x1, x2, [x20, 256]
.L1623:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1632:
	ldr	w3, [x2, 28]
	mov	w1, 3992
	ldr	x0, [x20, 272]
	umull	x1, w3, w1
	add	x1, x0, x1
	ldrb	w0, [x1, 25]
	cbnz	w0, .L1625
	ldr	x2, .LC114
	mov	w1, 6767
	mov	w0, 1
	bl	dprint_normal
	mov	w0, w19
	b	.L1623
	.p2align 3
.L1627:
	ldr	x2, .LC116
	mov	w1, 6778
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1623
	.p2align 3
.L1631:
	ldr	x2, .LC112
	mov	w1, 6756
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1623
	.p2align 3
.L1626:
	ldr	x2, .LC117
	mov	w3, w19
	mov	w1, 6784
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1623
	.size	MVC_PPSSPSCheck, .-MVC_PPSSPSCheck
	.align	3
.LC110:
	.xword	.LC109
	.align	3
.LC112:
	.xword	.LC111
	.align	3
.LC114:
	.xword	.LC113
	.align	3
.LC116:
	.xword	.LC115
	.align	3
.LC117:
	.xword	.LC78
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_PPSSPSCheckTmpId
	.type	MVC_PPSSPSCheckTmpId, %function
MVC_PPSSPSCheckTmpId:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	x2, .LC119
	mov	w1, 6800
	mov	w3, w20
	mov	w0, 17
	bl	dprint_normal
	mov	w0, 2240
	ldr	x1, [x19, 280]
	umull	x0, w20, w0
	add	x0, x1, x0
	ldrb	w1, [x0, 19]
	cbz	w1, .L1639
	ldr	w1, [x19, 36]
	ldr	w3, [x0, 28]
	sub	w0, w1, #1
	cmp	w3, w0
	bhi	.L1640
	add	x1, x19, 11116544
	mov	w0, 0
	ldrsb	w20, [x1, 2468]
	cmn	w20, #1
	beq	.L1641
.L1635:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1641:
	mov	w1, 3992
	ldr	x2, [x19, 272]
	umull	x1, w3, w1
	add	x1, x2, x1
	ldrb	w1, [x1, 25]
	cbnz	w1, .L1635
	ldr	x2, .LC125
	mov	w1, 6823
	mov	w0, 1
	bl	dprint_normal
	mov	w0, w20
	b	.L1635
	.p2align 3
.L1639:
	ldr	x2, .LC121
	mov	w3, w20
	mov	w1, 6806
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1635
	.p2align 3
.L1640:
	ldr	x2, .LC123
	mov	w1, 6812
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1635
	.size	MVC_PPSSPSCheckTmpId, .-MVC_PPSSPSCheckTmpId
	.align	3
.LC119:
	.xword	.LC118
	.align	3
.LC121:
	.xword	.LC120
	.align	3
.LC123:
	.xword	.LC122
	.align	3
.LC125:
	.xword	.LC124
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_IsNewPic
	.type	MVC_IsNewPic, %function
MVC_IsNewPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 11120640
	add	x2, x19, 11116544
	ldr	x4, [x19, 248]
	ldp	w6, w8, [x1, 24]
	ldr	w5, [x2, 2472]
	ldr	w3, [x4, 744]
	ldr	w0, [x2, 2484]
	cmp	w8, w5
	ldr	w7, [x1, 32]
	ccmp	w6, w3, 0, eq
	ldrb	w5, [x1, 16]
	cset	w3, ne
	ldrb	w6, [x2, 2457]
	cmp	w7, w0
	ccmp	w5, w6, 0, eq
	cset	w0, ne
	cmp	w6, wzr
	ccmp	w5, wzr, 4, ne
	orr	w0, w3, w0
	beq	.L1644
	ldrb	w3, [x2, 2458]
	ldrb	w5, [x1, 17]
	cmp	w5, w3
	cset	w3, ne
	orr	w0, w0, w3
.L1644:
	ldrb	w3, [x1, 19]
	ldrb	w5, [x2, 2464]
	cmp	w3, w5
	beq	.L1650
	cmp	w5, wzr
	ccmp	w3, wzr, 4, ne
	cset	w7, eq
.L1645:
	ldrb	w6, [x1, 18]
	ldrb	w5, [x2, 2459]
	cmp	w6, w5
	cset	w3, ne
	cmp	w6, 5
	ccmp	w5, 5, 0, eq
	orr	w0, w3, w0
	orr	w3, w0, w7
	beq	.L1657
.L1646:
	ldr	w0, [x4, 2900]
	cbnz	w0, .L1647
	ldp	w6, w4, [x1, 40]
	ldr	w5, [x2, 1324]
	ldr	w0, [x2, 1328]
	cmp	w6, w5
	ccmp	w4, w0, 0, eq
	cset	w0, ne
	orr	w3, w3, w0
.L1648:
	ldrb	w0, [x2, 2467]
	cbz	w0, .L1649
	ldr	w4, [x1]
	ldr	w5, [x1, 60]
	ldrb	w6, [x1, 20]
	ldrb	w0, [x2, 2465]
	cmp	w5, w4
	ldrb	w5, [x1, 21]
	cset	w1, ne
	ldrb	w4, [x2, 2466]
	cmp	w6, w0
	cset	w0, ne
	cmp	w5, w4
	orr	w0, w1, w0
	cset	w1, ne
	orr	w0, w1, w0
	orr	w3, w3, w0
.L1649:
	ldr	w4, [x2, 2512]
	mov	w1, 6875
	ldr	x2, .LC127
	mov	w0, 17
	cmp	w4, wzr
	cset	w19, eq
	orr	w19, w19, w3
	mov	w3, w19
	bl	dprint_normal
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1647:
	cmp	w0, 1
	bne	.L1648
	ldp	w6, w4, [x1, 48]
	ldr	w5, [x2, 1360]
	ldr	w0, [x2, 1364]
	cmp	w6, w5
	ccmp	w4, w0, 0, eq
	cset	w0, ne
	orr	w3, w3, w0
	b	.L1648
	.p2align 3
.L1650:
	mov	w7, 0
	b	.L1645
	.p2align 3
.L1657:
	ldr	w0, [x2, 2500]
	ldr	w5, [x1, 36]
	cmp	w5, w0
	cset	w0, ne
	orr	w3, w3, w0
	b	.L1646
	.size	MVC_IsNewPic, .-MVC_IsNewPic
	.align	3
.LC127:
	.xword	.LC126
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_ref_pic_list_reordering
	.type	mvc_ref_pic_list_reordering, %function
mvc_ref_pic_list_reordering:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 11116544
	mov	w21, 3
	bl	_mcount
	mov	w22, 1
	ldr	x0, [x19, 256]
	mov	w2, 5
	ldrb	w3, [x20, 2467]
	ldrb	w1, [x20, 2457]
	strb	wzr, [x20, 1404]
	cmp	w3, wzr
	strb	wzr, [x20, 1405]
	csel	w21, w21, w2, eq
	ldr	w0, [x0, 2896]
	cbz	w1, .L1660
	add	w0, w0, w2
	lsl	w22, w22, w0
	ldrb	w0, [x20, 2456]
	cmp	w0, 1
	bls	.L1713
.L1712:
	ldrb	w4, [x19, 10]
.L1679:
	cmp	w4, wzr
	csetm	w0, ne
.L1711:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1660:
	add	w0, w0, 4
	lsl	w22, w22, w0
	ldrb	w0, [x20, 2456]
	cmp	w0, 1
	bhi	.L1712
.L1713:
	ldr	x1, .LC129
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 1404]
	cbz	w0, .L1669
	ldr	w0, [x20, 2516]
	cmn	w0, #2
	beq	.L1695
	ldr	x23, .LC131
	mov	w28, 0
	ldr	x26, .LC141
	ldr	x25, .LC139
	ldr	x24, .LC135
	b	.L1676
	.p2align 3
.L1670:
	cmp	w0, 2
	beq	.L1714
	sub	w0, w0, #4
	cmp	w0, 1
	bls	.L1715
.L1673:
	ldr	w0, [x20, 2516]
	add	w28, w28, 1
	add	w0, w0, 2
	cmp	w0, w28
	bls	.L1716
.L1676:
	add	x27, x19, x28, uxtw 2
	mov	x1, x23
	add	x27, x27, 11116544
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w21, w0
	str	w0, [x27, 1408]
	ldrb	w4, [x19, 10]
	bcc	.L1666
	cbnz	w4, .L1666
	cmp	w0, 3
	beq	.L1669
	cmp	w0, 1
	bhi	.L1670
	mov	x1, x24
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x27, 1672]
	cmp	w22, w0
	ldrb	w4, [x19, 10]
	bls	.L1672
	cbz	w4, .L1673
.L1672:
	ldr	x2, .LC137
	mov	w3, w0
	mov	w1, 6929
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1711
	.p2align 3
.L1669:
	ldrb	w0, [x20, 2456]
	cmp	w0, 1
	bne	.L1712
	ldr	x1, .LC145
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 1405]
	cbz	w0, .L1712
	ldr	w0, [x20, 2520]
	cmn	w0, #2
	beq	.L1712
	ldr	x23, .LC147
	mov	w27, 0
	ldr	x26, .LC157
	ldr	x25, .LC155
	ldr	x24, .LC151
	b	.L1692
	.p2align 3
.L1685:
	cmp	w0, 2
	beq	.L1717
	sub	w0, w0, #4
	cmp	w0, 1
	bls	.L1718
	ldr	w0, [x20, 2520]
	add	w0, w0, 2
	cmp	w27, w0
	beq	.L1693
.L1691:
	add	w27, w27, 1
	cmp	w27, w0
	bcs	.L1712
.L1692:
	add	x28, x19, x27, uxtw 2
	mov	x1, x23
	add	x28, x28, 11116544
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w21, w0
	str	w0, [x28, 1540]
	ldrb	w4, [x19, 10]
	bcc	.L1683
	cbnz	w4, .L1683
	cmp	w0, 3
	beq	.L1679
	cmp	w0, 1
	bhi	.L1685
	mov	x1, x24
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x28, 1804]
	cmp	w22, w0
	ldrb	w4, [x19, 10]
	bls	.L1687
	cbnz	w4, .L1687
.L1688:
	ldr	w0, [x20, 2520]
	add	w0, w0, 2
	cmp	w0, w27
	bne	.L1691
	ldr	w1, [x28, 1540]
	cmp	w1, 3
	beq	.L1691
.L1693:
	ldr	x2, .LC159
	mov	w1, 6997
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1711
	.p2align 3
.L1714:
	mov	x1, x25
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x27, 1936]
	b	.L1673
	.p2align 3
.L1717:
	mov	x1, x25
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x28, 2064]
	b	.L1688
	.p2align 3
.L1715:
	mov	x1, x26
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x27, 2192]
	b	.L1673
	.p2align 3
.L1718:
	mov	x1, x26
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x28, 2324]
	b	.L1688
	.p2align 3
.L1666:
	ldr	x2, .LC133
	mov	w3, w0
	mov	w1, 6913
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1711
	.p2align 3
.L1683:
	ldr	x2, .LC149
	mov	w3, w0
	mov	w1, 6965
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1711
	.p2align 3
.L1716:
	bne	.L1669
.L1664:
	uxtw	x0, w28
	add	x0, x0, 2777088
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 9600]
	cmp	w0, 3
	beq	.L1669
	ldr	x2, .LC143
	mov	w1, 6946
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1711
.L1687:
	ldr	x2, .LC153
	mov	w3, w0
	mov	w1, 6981
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1711
.L1695:
	mov	w28, 0
	b	.L1664
	.size	mvc_ref_pic_list_reordering, .-mvc_ref_pic_list_reordering
	.align	3
.LC129:
	.xword	.LC128
	.align	3
.LC131:
	.xword	.LC130
	.align	3
.LC133:
	.xword	.LC132
	.align	3
.LC135:
	.xword	.LC134
	.align	3
.LC137:
	.xword	.LC136
	.align	3
.LC139:
	.xword	.LC138
	.align	3
.LC141:
	.xword	.LC140
	.align	3
.LC143:
	.xword	.LC142
	.align	3
.LC145:
	.xword	.LC144
	.align	3
.LC147:
	.xword	.LC146
	.align	3
.LC149:
	.xword	.LC148
	.align	3
.LC151:
	.xword	.LC150
	.align	3
.LC153:
	.xword	.LC152
	.align	3
.LC155:
	.xword	.LC154
	.align	3
.LC157:
	.xword	.LC156
	.align	3
.LC159:
	.xword	.LC158
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_pred_weight_table
	.type	mvc_pred_weight_table, %function
mvc_pred_weight_table:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x28, x0
	mov	x0, x30
	add	x20, x28, 11116544
	mov	w19, 1
	bl	_mcount
	mov	w24, 0
	ldp	x21, x2, [x28, 256]
	ldr	x1, .LC161
	mov	x0, x28
	str	x2, [x29, 104]
	bl	mvc_ue_v
	str	w0, [x20, 2524]
	lsl	w23, w19, w0
	ldr	w1, [x21, 748]
	cbnz	w1, .L1744
.L1720:
	cmp	w0, 7
	bhi	.L1723
	ldr	w0, [x20, 2528]
	cmp	w0, 7
	bhi	.L1723
	ldrb	w3, [x28, 10]
	cbnz	w3, .L1722
	ldr	x22, .LC167
	mov	w25, 0
	ldr	x27, .LC169
	b	.L1731
	.p2align 3
.L1726:
	str	w23, [x1, 2532]
	add	x0, x28, x19, lsl 2
	str	wzr, [x1, 3300]
	add	x0, x0, 11116544
	ldr	w1, [x21, 748]
	cbnz	w1, .L1745
.L1728:
	str	wzr, [x0, 2660]
	str	wzr, [x0, 2788]
	str	wzr, [x0, 3428]
	str	wzr, [x0, 3556]
.L1730:
	ldr	w0, [x20, 2516]
	add	w25, w25, 1
	cmp	w0, w25
	bcc	.L1746
.L1731:
	mov	x1, x22
	mov	x0, x28
	uxtw	x19, w25
	bl	mvc_u_1
	add	x1, x28, x19, lsl 2
	add	x1, x1, 11116544
	cbz	w0, .L1726
	mov	x1, x27
	mov	x0, x28
	bl	mvc_se_v
	add	x4, x28, x19, lsl 2
	ldr	x1, .LC171
	add	x26, x4, 11116544
	str	w0, [x26, 2532]
	mov	x0, x28
	bl	mvc_se_v
	str	w0, [x26, 3300]
	add	x0, x28, x19, lsl 2
	ldr	w1, [x21, 748]
	add	x0, x0, 11116544
	cbz	w1, .L1728
.L1745:
	ldr	x1, .LC173
	mov	x0, x28
	bl	mvc_u_1
	add	x1, x28, x19, lsl 2
	add	x1, x1, 11116544
	cbnz	w0, .L1747
	str	w24, [x1, 2660]
	add	w25, w25, 1
	str	w24, [x1, 2788]
	str	wzr, [x1, 3428]
	str	wzr, [x1, 3556]
	ldr	w0, [x20, 2516]
	cmp	w0, w25
	bcs	.L1731
.L1746:
	ldr	x0, [x29, 104]
	ldr	w0, [x0, 44]
	cmp	w0, 1
	beq	.L1732
.L1733:
	ldrb	w0, [x28, 10]
	cmp	w0, wzr
	csetm	w0, ne
.L1725:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1747:
	ldr	x1, .LC175
	mov	x0, x28
	add	x19, x28, x19, lsl 2
	add	x19, x19, 11116544
	bl	mvc_se_v
	ldr	x1, .LC177
	str	w0, [x19, 2660]
	mov	x0, x28
	bl	mvc_se_v
	str	w0, [x19, 3428]
	ldr	x1, .LC175
	mov	x0, x28
	bl	mvc_se_v
	str	w0, [x19, 2788]
	ldr	x1, .LC177
	mov	x0, x28
	bl	mvc_se_v
	str	w0, [x19, 3556]
	b	.L1730
	.p2align 3
.L1744:
	ldr	x1, .LC163
	mov	x0, x28
	bl	mvc_ue_v
	mov	w24, w0
	ldr	w0, [x20, 2524]
	str	w24, [x20, 2528]
	lsl	w24, w19, w24
	b	.L1720
	.p2align 3
.L1732:
	ldrb	w0, [x20, 2456]
	cmp	w0, 1
	bne	.L1733
	ldr	x22, .LC179
	mov	w25, 0
	ldr	x27, .LC181
	b	.L1739
	.p2align 3
.L1734:
	add	x0, x28, x19, lsl 2
	add	x0, x0, 11116544
	str	w23, [x0, 2916]
	str	wzr, [x0, 3684]
	add	x0, x28, x19, lsl 2
	add	x0, x0, 11116544
	ldr	w1, [x21, 748]
	cbnz	w1, .L1748
.L1736:
	str	wzr, [x0, 3044]
	str	wzr, [x0, 3172]
	str	wzr, [x0, 3812]
	str	wzr, [x0, 3940]
.L1738:
	ldr	w0, [x20, 2520]
	add	w25, w25, 1
	cmp	w0, w25
	bcc	.L1733
.L1739:
	mov	x1, x22
	mov	x0, x28
	uxtw	x19, w25
	bl	mvc_u_1
	cbz	w0, .L1734
	mov	x1, x27
	mov	x0, x28
	bl	mvc_se_v
	add	x4, x28, x19, lsl 2
	ldr	x1, .LC183
	add	x26, x4, 11116544
	str	w0, [x26, 2916]
	mov	x0, x28
	bl	mvc_se_v
	str	w0, [x26, 3684]
	add	x0, x28, x19, lsl 2
	ldr	w1, [x21, 748]
	add	x0, x0, 11116544
	cbz	w1, .L1736
.L1748:
	ldr	x1, .LC185
	mov	x0, x28
	bl	mvc_u_1
	cbnz	w0, .L1749
	add	x0, x28, x19, lsl 2
	add	x0, x0, 11116544
	str	w24, [x0, 3044]
	str	w24, [x0, 3172]
	str	wzr, [x0, 3812]
	str	wzr, [x0, 3940]
	b	.L1738
.L1723:
	ldrb	w3, [x28, 10]
.L1722:
	ldr	x2, .LC165
	mov	w1, 7030
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1725
.L1749:
	ldr	x1, .LC187
	mov	x0, x28
	add	x19, x28, x19, lsl 2
	add	x19, x19, 11116544
	bl	mvc_se_v
	ldr	x1, .LC189
	str	w0, [x19, 3044]
	mov	x0, x28
	bl	mvc_se_v
	str	w0, [x19, 3812]
	ldr	x1, .LC187
	mov	x0, x28
	bl	mvc_se_v
	str	w0, [x19, 3172]
	ldr	x1, .LC189
	mov	x0, x28
	bl	mvc_se_v
	str	w0, [x19, 3940]
	b	.L1738
	.size	mvc_pred_weight_table, .-mvc_pred_weight_table
	.align	3
.LC161:
	.xword	.LC160
	.align	3
.LC163:
	.xword	.LC162
	.align	3
.LC165:
	.xword	.LC164
	.align	3
.LC167:
	.xword	.LC166
	.align	3
.LC169:
	.xword	.LC168
	.align	3
.LC171:
	.xword	.LC170
	.align	3
.LC173:
	.xword	.LC172
	.align	3
.LC175:
	.xword	.LC174
	.align	3
.LC177:
	.xword	.LC176
	.align	3
.LC179:
	.xword	.LC178
	.align	3
.LC181:
	.xword	.LC180
	.align	3
.LC183:
	.xword	.LC182
	.align	3
.LC185:
	.xword	.LC184
	.align	3
.LC187:
	.xword	.LC186
	.align	3
.LC189:
	.xword	.LC188
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecMMCO
	.type	MVC_DecMMCO, %function
MVC_DecMMCO:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x26, x0
	mov	w19, w1
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L1751
	mov	w21, 100
	ldr	x20, .LC193
	ldr	x23, .LC195
	ldr	x25, .LC201
	ldr	x22, .LC199
	ldr	x24, .LC197
	b	.L1762
	.p2align 3
.L1763:
	cmp	w19, 2
	beq	.L1777
.L1764:
	cmp	w19, 6
	cset	w0, eq
	orr	w0, w27, w0
	cbnz	w0, .L1767
	cmp	w19, 4
	beq	.L1778
.L1768:
	cmp	w19, 6
	bhi	.L1769
	ldrb	w0, [x26, 10]
	cbnz	w0, .L1769
.L1779:
	cbz	w19, .L1771
.L1770:
	subs	w21, w21, #1
	beq	.L1772
.L1762:
	mov	x1, x20
	mov	x0, x26
	bl	mvc_ue_v
	cmp	w0, 3
	mov	w19, w0
	and	w0, w0, -3
	cset	w27, eq
	cmp	w0, 1
	bne	.L1763
	mov	x1, x23
	mov	x0, x26
	bl	mvc_ue_v
	cmp	w19, 2
	bne	.L1764
.L1777:
	mov	x1, x24
	mov	x0, x26
	bl	mvc_ue_v
	ldrb	w0, [x26, 10]
	cbz	w0, .L1779
	.p2align 2
.L1769:
	ldr	x2, .LC203
	mov	w1, 7220
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
.L1754:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1767:
	mov	x1, x22
	mov	x0, x26
	bl	mvc_ue_v
	cmp	w19, 4
	bne	.L1768
.L1778:
	mov	x1, x25
	mov	x0, x26
	bl	mvc_ue_v
	ldrb	w0, [x26, 10]
	cbz	w0, .L1770
	b	.L1769
	.p2align 3
.L1751:
	ldr	x20, .LC193
	mov	w28, 0
	ldr	x22, .LC195
	ldr	x24, .LC197
	ldr	x21, .LC199
	ldr	x23, .LC201
	b	.L1753
	.p2align 3
.L1755:
	cmp	w1, 2
	beq	.L1780
.L1756:
	cmp	w1, 3
	ccmp	w1, 6, 4, ne
	beq	.L1781
.L1757:
	cmp	w1, 4
	beq	.L1782
.L1758:
	cmp	w1, 6
	bhi	.L1759
.L1784:
	ldrb	w0, [x26, 10]
	cbnz	w0, .L1759
	add	w28, w28, 1
	cbz	w1, .L1771
	cmp	w28, 100
	beq	.L1783
.L1753:
	mov	x1, x20
	mov	x0, x26
	ldrb	w25, [x26, 3]
	uxtw	x27, w28
	bl	mvc_ue_v
	mov	w1, w0
	lsl	x0, x25, 6
	lsl	x19, x27, 4
	sub	x0, x0, x25
	add	x19, x19, x27, lsl 2
	lsl	x0, x0, 2
	and	w2, w1, -3
	sub	x0, x0, x25
	cmp	w2, 1
	lsl	x0, x0, 1
	sub	x0, x0, x25
	add	x19, x19, x0, lsl 2
	add	x19, x26, x19
	add	x19, x19, 11120640
	str	w1, [x19, 68]
	bne	.L1755
	mov	x1, x22
	mov	x0, x26
	bl	mvc_ue_v
	str	w0, [x19, 72]
	ldr	w1, [x19, 68]
	cmp	w1, 2
	bne	.L1756
.L1780:
	mov	x1, x24
	mov	x0, x26
	bl	mvc_ue_v
	lsl	x1, x25, 6
	sub	x1, x1, x25
	lsl	x1, x1, 2
	sub	x1, x1, x25
	lsl	x1, x1, 1
	sub	x2, x1, x25
	lsl	x1, x27, 4
	add	x1, x1, x27, lsl 2
	add	x1, x1, x2, lsl 2
	add	x1, x26, x1
	add	x1, x1, 11120640
	str	w0, [x1, 76]
	ldr	w1, [x1, 68]
	cmp	w1, 3
	ccmp	w1, 6, 4, ne
	bne	.L1757
	.p2align 2
.L1781:
	mov	x1, x21
	mov	x0, x26
	bl	mvc_ue_v
	lsl	x1, x25, 6
	lsl	x2, x27, 4
	sub	x1, x1, x25
	add	x2, x2, x27, lsl 2
	lsl	x1, x1, 2
	sub	x1, x1, x25
	lsl	x1, x1, 1
	sub	x1, x1, x25
	add	x2, x2, x1, lsl 2
	add	x2, x26, x2
	add	x2, x2, 11120640
	ldr	w1, [x2, 68]
	str	w0, [x2, 80]
	cmp	w1, 4
	bne	.L1758
.L1782:
	mov	x1, x23
	mov	x0, x26
	bl	mvc_ue_v
	lsl	x1, x25, 6
	sub	x1, x1, x25
	lsl	x1, x1, 2
	sub	x1, x1, x25
	lsl	x1, x1, 1
	sub	x25, x1, x25
	lsl	x1, x27, 4
	add	x27, x1, x27, lsl 2
	add	x27, x27, x25, lsl 2
	add	x27, x26, x27
	add	x27, x27, 11120640
	ldr	w1, [x27, 68]
	str	w0, [x27, 84]
	cmp	w1, 6
	bls	.L1784
.L1759:
	ldr	x2, .LC203
	mov	w1, 7173
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1771:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L1783:
	ldr	x2, .LC191
	mov	w1, 7137
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1754
.L1772:
	mov	w0, -1
	b	.L1754
	.size	MVC_DecMMCO, .-MVC_DecMMCO
	.align	3
.LC191:
	.xword	.LC190
	.align	3
.LC193:
	.xword	.LC192
	.align	3
.LC195:
	.xword	.LC194
	.align	3
.LC197:
	.xword	.LC196
	.align	3
.LC199:
	.xword	.LC198
	.align	3
.LC201:
	.xword	.LC200
	.align	3
.LC203:
	.xword	.LC202
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_dec_ref_pic_marking
	.type	mvc_dec_ref_pic_marking, %function
mvc_dec_ref_pic_marking:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x21, 11116544
	ldrb	w22, [x21, 3]
	ldrb	w0, [x1, 2461]
	cbz	w0, .L1786
	cmp	w22, wzr
	cset	w19, eq
	strb	w19, [x21, 3]
.L1795:
	ldrb	w0, [x1, 2459]
	cmp	w0, 5
	beq	.L1806
	ldr	x1, .LC209
	mov	x0, x21
	sxtw	x19, w19
	bl	mvc_u_1
	uxtb	w0, w0
	lsl	x1, x19, 6
	sub	x1, x1, x19
	lsl	x1, x1, 2
	sub	x1, x1, x19
	lsl	x1, x1, 1
	sub	x19, x1, x19
	add	x19, x21, x19, lsl 2
	add	x19, x19, 11120640
	strb	w0, [x19, 67]
	cbnz	w0, .L1789
.L1793:
	mov	w20, 0
.L1803:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1786:
	sxtw	x20, w22
	mov	w19, w22
	lsl	x0, x20, 6
	sub	x0, x0, x20
	lsl	x0, x0, 2
	sub	x0, x0, x20
	lsl	x0, x0, 1
	sub	x20, x0, x20
	add	x20, x21, x20, lsl 2
	add	x20, x20, 11120640
	ldrb	w0, [x20, 64]
	cbz	w0, .L1795
	ldrb	w0, [x1, 2459]
	cmp	w0, 5
	beq	.L1807
	ldr	x1, .LC209
	mov	x0, x21
	ldrb	w19, [x20, 67]
	bl	mvc_u_1
	cmp	w19, w0
	bne	.L1808
	ldrb	w0, [x20, 67]
	cbz	w0, .L1793
	mov	w1, 0
	mov	x0, x21
	bl	MVC_DecMMCO
	mov	w20, w0
	b	.L1803
	.p2align 3
.L1789:
	mov	w1, 1
	mov	x0, x21
	bl	MVC_DecMMCO
	cmn	w0, #1
	mov	w20, w0
	beq	.L1809
	mov	w0, 1
	strb	w0, [x19, 64]
	mov	w20, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1807:
	ldr	x1, .LC205
	mov	x0, x21
	ldrb	w19, [x20, 65]
	bl	mvc_u_1
	cmp	w19, w0
	bne	.L1810
	ldr	x1, .LC207
	mov	x0, x21
	ldrb	w19, [x20, 66]
	bl	mvc_u_1
	cmp	w19, w0
	beq	.L1793
	ldr	x2, .LC215
	mov	w1, 7283
	mov	w0, 1
	mov	w20, -1
	bl	dprint_normal
	b	.L1803
	.p2align 3
.L1806:
	ldr	x1, .LC205
	mov	x0, x21
	sxtw	x19, w19
	mov	w20, 0
	bl	mvc_u_1
	lsl	x2, x19, 6
	ldr	x1, .LC207
	sub	x2, x2, x19
	lsl	x2, x2, 2
	sub	x2, x2, x19
	lsl	x2, x2, 1
	sub	x19, x2, x19
	add	x19, x21, x19, lsl 2
	add	x19, x19, 11120640
	strb	w0, [x19, 65]
	mov	x0, x21
	bl	mvc_u_1
	strb	w0, [x19, 66]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1808:
	ldr	x2, .LC217
	mov	w1, 7292
	mov	w0, 1
	mov	w20, -1
	bl	dprint_normal
	ldr	x2, .LC219
	mov	w1, 7294
	ldr	w5, [x21, 68]
	mov	w0, 1
	ldr	w3, [x21, 88]
	ldr	w4, [x21, 100]
	bl	dprint_normal
	b	.L1803
.L1810:
	ldr	x2, .LC213
	mov	w1, 7276
	mov	w0, 1
	mov	w20, -1
	bl	dprint_normal
	b	.L1803
.L1809:
	strb	wzr, [x19, 64]
	mov	w1, 7261
	ldr	x2, .LC211
	mov	w0, 1
	strb	w22, [x21, 3]
	bl	dprint_normal
	b	.L1803
	.size	mvc_dec_ref_pic_marking, .-mvc_dec_ref_pic_marking
	.align	3
.LC205:
	.xword	.LC204
	.align	3
.LC207:
	.xword	.LC206
	.align	3
.LC209:
	.xword	.LC208
	.align	3
.LC211:
	.xword	.LC210
	.align	3
.LC213:
	.xword	.LC212
	.align	3
.LC215:
	.xword	.LC214
	.align	3
.LC217:
	.xword	.LC216
	.align	3
.LC219:
	.xword	.LC218
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ProcessSliceHeaderFirstPart
	.type	MVC_ProcessSliceHeaderFirstPart, %function
MVC_ProcessSliceHeaderFirstPart:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC221
	mov	x0, x19
	bl	mvc_ue_v
	mov	w21, w0
	ldr	w0, [x19, 40]
	sub	w0, w0, #1
	cmp	w21, w0
	bhi	.L1812
	ldrb	w0, [x19, 10]
	cbnz	w0, .L1812
	mov	w1, w21
	mov	x0, x19
	bl	MVC_PPSSPSCheckTmpId
	cbnz	w0, .L1866
	add	x20, x19, 11116544
	mov	x0, x19
	str	w21, [x20, 2472]
	bl	MVC_PPSSPSCheck
	mov	w22, w0
	cbnz	w0, .L1867
	ldp	x21, x23, [x19, 256]
	ldr	x2, .LC229
	mov	x0, x19
	ldr	w1, [x21, 2896]
	add	w1, w1, 4
	bl	mvc_u_v
	str	w0, [x20, 2484]
	ldrb	w1, [x19, 10]
	cbnz	w1, .L1838
	ldrb	w1, [x20, 2459]
	cmp	w1, 5
	ccmp	w0, wzr, 4, eq
	bne	.L1868
.L1818:
	strb	wzr, [x20, 2457]
	strb	wzr, [x20, 2458]
	ldrb	w0, [x21, 20]
	cbz	w0, .L1869
	ldr	w1, [x21, 3952]
	ldr	w2, [x21, 3948]
	add	w0, w1, 1
	madd	w0, w2, w0, w0
.L1841:
	ldrb	w1, [x21, 21]
	cbnz	w1, .L1824
	strb	wzr, [x20, 2460]
.L1826:
	ldr	w1, [x20, 2512]
	cmp	w1, w0
	bcs	.L1870
.L1827:
	ldrb	w0, [x20, 2459]
	cmp	w0, 5
	beq	.L1871
.L1829:
	str	wzr, [x20, 1324]
	str	wzr, [x20, 1328]
	ldr	w0, [x21, 2900]
	cbz	w0, .L1872
.L1833:
	str	wzr, [x20, 1360]
	str	wzr, [x20, 1364]
	ldr	w0, [x21, 2900]
	cmp	w0, 1
	beq	.L1873
.L1836:
	ldrb	w0, [x19, 10]
	cbnz	w0, .L1838
	ldrb	w0, [x23, 17]
	cbz	w0, .L1839
	ldr	x1, .LC253
	mov	x0, x19
	bl	mvc_ue_v
	cbnz	w0, .L1840
	ldrb	w0, [x19, 10]
	cbz	w0, .L1839
.L1840:
	ldr	x2, .LC255
	mov	w1, 7443
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC256
	ldr	x4, [x0]
	cbz	x4, .L1838
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	mov	w22, -1
	blr	x4
.L1850:
	mov	w0, w22
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1869:
	ldr	x1, .LC233
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 2457]
	cbnz	w0, .L1874
	ldr	w2, [x21, 3952]
	ldr	w1, [x21, 3948]
	add	w0, w2, 1
	ldrb	w3, [x21, 20]
	madd	w1, w1, w0, w0
	lsl	w0, w1, 1
	cbz	w3, .L1841
.L1821:
	ldrb	w2, [x20, 2457]
	mov	w0, 1
	b	.L1822
	.p2align 3
.L1824:
	mov	w1, 1
	strb	w1, [x20, 2460]
.L1843:
	ldr	w1, [x20, 2512]
	cmp	w1, w0, lsr 1
	bcc	.L1827
	ldr	x2, .LC237
	mov	w1, 7382
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	b	.L1850
	.p2align 3
.L1874:
	ldr	x1, .LC235
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 2458]
	ldr	w0, [x21, 3952]
	ldr	w1, [x21, 3948]
	ldrb	w2, [x21, 20]
	add	w0, w0, 1
	madd	w1, w1, w0, w0
	cbnz	w2, .L1821
	ldrb	w2, [x20, 2457]
	mov	w0, 2
.L1822:
	mul	w0, w0, w1
	cbz	w2, .L1841
	strb	wzr, [x20, 2460]
	cmp	w2, 1
	bne	.L1826
	b	.L1843
	.p2align 3
.L1839:
	mov	x0, x19
	bl	MVC_IsNewPic
	uxtb	w0, w0
	strb	w0, [x20, 2461]
	cbnz	w0, .L1850
	add	x19, x19, 11120640
	ldr	w1, [x20, 2512]
	ldr	w0, [x19, 56]
	cmp	w1, w0
	bhi	.L1850
	ldr	x2, .LC258
	mov	w1, 7454
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	b	.L1850
	.p2align 3
.L1872:
	ldr	w1, [x21, 2904]
	mov	x0, x19
	ldr	x2, .LC245
	add	w1, w1, 4
	bl	mvc_u_v
	str	w0, [x20, 1324]
	ldrb	w0, [x23, 1]
	cbz	w0, .L1833
	ldrb	w0, [x20, 2457]
	cbnz	w0, .L1833
	ldr	x1, .LC247
	mov	x0, x19
	bl	mvc_se_v
	str	w0, [x20, 1328]
	b	.L1833
	.p2align 3
.L1873:
	ldrb	w0, [x21, 18]
	cbnz	w0, .L1836
	ldr	x1, .LC249
	mov	x0, x19
	bl	mvc_se_v
	str	w0, [x20, 1360]
	ldrb	w0, [x23, 1]
	cmp	w0, 1
	bne	.L1836
	ldrb	w0, [x20, 2457]
	cbnz	w0, .L1836
	ldr	x1, .LC251
	mov	x0, x19
	bl	mvc_se_v
	str	w0, [x20, 1364]
	b	.L1836
	.p2align 3
.L1838:
	mov	w22, -1
	ldr	x23, [sp, 48]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1812:
	ldr	x2, .LC223
	mov	w3, w21
	mov	w1, 7323
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	ldr	x23, [sp, 48]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1871:
	ldr	x1, .LC241
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 2500]
	mov	w1, 65535
	cmp	w0, w1
	bhi	.L1830
	ldrb	w0, [x19, 10]
	cbz	w0, .L1829
.L1830:
	ldr	x2, .LC243
	mov	w1, 7403
	mov	w0, 1
	bl	dprint_normal
	b	.L1829
	.p2align 3
.L1866:
	ldr	x2, .LC225
	mov	w1, 7329
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	b	.L1850
	.p2align 3
.L1867:
	ldr	x2, .LC227
	mov	w1, 7337
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	b	.L1850
	.p2align 3
.L1868:
	add	x0, x19, 11120640
	ldr	w0, [x0]
	cmp	w0, wzr
	bgt	.L1818
	ldr	x2, .LC231
	mov	w1, 7352
	mov	w0, 1
	bl	dprint_normal
	b	.L1818
.L1870:
	ldr	x2, .LC239
	mov	w1, 7391
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	b	.L1850
	.size	MVC_ProcessSliceHeaderFirstPart, .-MVC_ProcessSliceHeaderFirstPart
	.align	3
.LC221:
	.xword	.LC220
	.align	3
.LC223:
	.xword	.LC222
	.align	3
.LC225:
	.xword	.LC224
	.align	3
.LC227:
	.xword	.LC226
	.align	3
.LC229:
	.xword	.LC228
	.align	3
.LC231:
	.xword	.LC230
	.align	3
.LC233:
	.xword	.LC232
	.align	3
.LC235:
	.xword	.LC234
	.align	3
.LC237:
	.xword	.LC236
	.align	3
.LC239:
	.xword	.LC238
	.align	3
.LC241:
	.xword	.LC240
	.align	3
.LC243:
	.xword	.LC242
	.align	3
.LC245:
	.xword	.LC244
	.align	3
.LC247:
	.xword	.LC246
	.align	3
.LC249:
	.xword	.LC248
	.align	3
.LC251:
	.xword	.LC250
	.align	3
.LC253:
	.xword	.LC252
	.align	3
.LC255:
	.xword	.LC254
	.align	3
.LC256:
	.xword	g_EventReportFunc
	.align	3
.LC258:
	.xword	.LC257
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ProcessSliceHeaderSecondPart
	.type	MVC_ProcessSliceHeaderSecondPart, %function
MVC_ProcessSliceHeaderSecondPart:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 11116544
	bl	_mcount
	ldr	w0, [x20, 40]
	ldr	w3, [x19, 2472]
	sub	w0, w0, #1
	ldr	x21, [x20, 264]
	cmp	w0, w3
	bcc	.L1876
	ldrb	w22, [x20, 10]
	cbnz	w22, .L1876
	mov	x0, x20
	bl	MVC_PPSSPSCheck
	cbnz	w0, .L1958
	ldrb	w1, [x19, 2456]
	cmp	w1, 1
	beq	.L1959
	ldr	w0, [x21, 36]
	cmp	w1, 1
	str	w0, [x19, 2516]
	ldr	w0, [x21, 40]
	str	w0, [x19, 2520]
	bls	.L1960
.L1881:
	cmp	w1, 2
	beq	.L1907
.L1891:
	mov	w0, 32
	str	w0, [x19, 2520]
.L1892:
	mov	x0, x20
	bl	mvc_ref_pic_list_reordering
	mov	w23, w0
	cbnz	w0, .L1961
	ldrb	w0, [x21, 2]
	cbz	w0, .L1894
	ldrb	w0, [x19, 2456]
	cbnz	w0, .L1894
	mov	w22, 1
	mov	w3, w22
.L1895:
	ldr	x2, .LC276
	mov	w1, 7547
	strb	w22, [x19, 2463]
	mov	w0, 17
	bl	dprint_normal
	str	wzr, [x19, 2524]
	ldrb	w0, [x19, 2463]
	str	wzr, [x19, 2528]
	cbnz	w0, .L1962
.L1896:
	ldrb	w0, [x19, 2464]
	cbnz	w0, .L1963
.L1897:
	str	wzr, [x19, 4068]
	ldrb	w0, [x21]
	cbz	w0, .L1898
	ldrb	w0, [x19, 2456]
	cmp	w0, 1
	bls	.L1964
.L1898:
	ldr	x1, .LC286
	mov	x0, x20
	bl	mvc_se_v
	add	x1, x19, 3840
	stp	w0, wzr, [x1, 232]
	stp	wzr, wzr, [x1, 240]
	ldrb	w0, [x21, 3]
	cbnz	w0, .L1965
.L1927:
	mov	w0, w23
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1894:
	ldr	w0, [x21, 44]
	mov	w3, 0
	cmp	w0, 1
	bne	.L1895
	ldrb	w0, [x19, 2456]
	cmp	w0, 1
	bne	.L1895
	mov	w22, w0
	mov	w3, w0
	b	.L1895
	.p2align 3
.L1965:
	ldr	x1, .LC288
	mov	x0, x20
	bl	mvc_ue_v
	cmp	w0, 2
	str	w0, [x19, 4076]
	bhi	.L1901
	ldrb	w1, [x20, 10]
	cbnz	w1, .L1901
	cmp	w0, 1
	beq	.L1927
	ldr	x1, .LC292
	mov	x0, x20
	bl	mvc_se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x19, 4080]
	bhi	.L1904
	ldrb	w0, [x20, 10]
	cbnz	w0, .L1904
	ldr	x1, .LC296
	mov	x0, x20
	bl	mvc_se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x19, 4084]
	bhi	.L1906
	ldrb	w0, [x20, 10]
	cbz	w0, .L1927
.L1906:
	ldr	x2, .LC298
	mov	w1, 7618
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1927
	.p2align 3
.L1962:
	mov	x0, x20
	bl	mvc_pred_weight_table
	cbz	w0, .L1896
	ldr	x2, .LC278
	mov	w1, 7555
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1927
	.p2align 3
.L1963:
	mov	x0, x20
	bl	mvc_dec_ref_pic_marking
	cbz	w0, .L1897
	ldr	x2, .LC280
	mov	w1, 7565
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1927
	.p2align 3
.L1907:
	mov	w0, 32
	str	w0, [x19, 2516]
	b	.L1891
	.p2align 3
.L1959:
	ldr	x1, .LC262
	mov	x0, x20
	bl	mvc_u_1
	strb	w0, [x19, 2462]
	ldrb	w1, [x19, 2456]
	ldr	w0, [x21, 36]
	str	w0, [x19, 2516]
	cmp	w1, 1
	ldr	w0, [x21, 40]
	str	w0, [x19, 2520]
	bhi	.L1881
	.p2align 2
.L1960:
	ldr	x1, .LC264
	mov	x0, x20
	bl	mvc_u_1
	cbnz	w0, .L1882
	ldr	w1, [x19, 2516]
.L1883:
	ldrb	w0, [x19, 2457]
	cbnz	w0, .L1884
	cmp	w1, 15
	bhi	.L1885
	ldr	w0, [x19, 2520]
	cmp	w0, 15
	bhi	.L1966
.L1886:
	ldrb	w0, [x20, 10]
	cbnz	w0, .L1885
.L1887:
	ldrb	w0, [x19, 2456]
	cmp	w0, 2
	beq	.L1907
	cmp	w0, 1
	beq	.L1892
	b	.L1891
	.p2align 3
.L1876:
	ldr	x2, .LC259
	mov	w1, 7468
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	mov	w0, w23
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1964:
	ldr	x1, .LC282
	mov	x0, x20
	bl	mvc_ue_v
	cmp	w0, 2
	str	w0, [x19, 4068]
	bhi	.L1899
	ldrb	w0, [x20, 10]
	cbz	w0, .L1898
.L1899:
	ldr	x2, .LC284
	mov	w1, 7579
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1927
	.p2align 3
.L1884:
	cmp	w1, 31
	bhi	.L1888
	ldr	w0, [x19, 2520]
	cmp	w0, 31
	bls	.L1889
	ldrb	w0, [x19, 2456]
	cmp	w0, 1
	bne	.L1889
.L1888:
	ldr	x2, .LC272
	mov	w1, 7520
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1927
	.p2align 3
.L1889:
	ldrb	w0, [x20, 10]
	cbz	w0, .L1887
	b	.L1888
	.p2align 3
.L1966:
	ldrb	w0, [x19, 2456]
	cmp	w0, 1
	bne	.L1886
.L1885:
	ldr	x2, .LC270
	mov	w1, 7509
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1927
	.p2align 3
.L1882:
	ldr	x1, .LC266
	mov	x0, x20
	bl	mvc_ue_v
	mov	w1, w0
	ldrb	w0, [x19, 2456]
	str	w1, [x19, 2516]
	cmp	w0, 1
	bne	.L1883
	ldr	x1, .LC268
	mov	x0, x20
	bl	mvc_ue_v
	str	w0, [x19, 2520]
	ldr	w1, [x19, 2516]
	b	.L1883
	.p2align 3
.L1904:
	ldr	x2, .LC294
	mov	w1, 7609
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1927
	.p2align 3
.L1901:
	ldr	x2, .LC290
	mov	w1, 7598
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1927
	.p2align 3
.L1958:
	ldr	x2, .LC260
	mov	w1, 7474
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1927
	.p2align 3
.L1961:
	ldr	x2, .LC274
	mov	w1, 7540
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1927
	.size	MVC_ProcessSliceHeaderSecondPart, .-MVC_ProcessSliceHeaderSecondPart
	.align	3
.LC259:
	.xword	.LC222
	.align	3
.LC260:
	.xword	.LC224
	.align	3
.LC262:
	.xword	.LC261
	.align	3
.LC264:
	.xword	.LC263
	.align	3
.LC266:
	.xword	.LC265
	.align	3
.LC268:
	.xword	.LC267
	.align	3
.LC270:
	.xword	.LC269
	.align	3
.LC272:
	.xword	.LC271
	.align	3
.LC274:
	.xword	.LC273
	.align	3
.LC276:
	.xword	.LC275
	.align	3
.LC278:
	.xword	.LC277
	.align	3
.LC280:
	.xword	.LC279
	.align	3
.LC282:
	.xword	.LC281
	.align	3
.LC284:
	.xword	.LC283
	.align	3
.LC286:
	.xword	.LC285
	.align	3
.LC288:
	.xword	.LC287
	.align	3
.LC290:
	.xword	.LC289
	.align	3
.LC292:
	.xword	.LC291
	.align	3
.LC294:
	.xword	.LC293
	.align	3
.LC296:
	.xword	.LC295
	.align	3
.LC298:
	.xword	.LC297
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ExitSlice
	.type	MVC_ExitSlice, %function
MVC_ExitSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 11116544
	add	x0, x19, 11120640
	ldr	x3, [x19, 248]
	ldr	w2, [x1, 2472]
	str	w2, [x0, 28]
	ldr	w2, [x3, 744]
	str	w2, [x0, 24]
	ldr	w2, [x1, 2512]
	str	w2, [x0, 56]
	ldr	w2, [x1, 2484]
	str	w2, [x0, 32]
	ldrb	w2, [x1, 2457]
	strb	w2, [x0, 16]
	cbz	w2, .L1968
	ldrb	w2, [x1, 2458]
	strb	w2, [x0, 17]
.L1968:
	ldrb	w2, [x1, 2464]
	strb	w2, [x0, 19]
	ldrb	w2, [x1, 2459]
	strb	w2, [x0, 18]
	cmp	w2, 5
	beq	.L1976
.L1969:
	ldr	w2, [x3, 2900]
	cbnz	w2, .L1970
	ldr	w2, [x1, 1324]
	str	w2, [x0, 40]
	ldr	w2, [x1, 1328]
	str	w2, [x0, 44]
	ldr	w2, [x3, 2900]
.L1970:
	cmp	w2, 1
	beq	.L1977
.L1971:
	ldrb	w2, [x1, 2467]
	cmp	w2, 1
	bne	.L1972
	ldr	w2, [x0]
	str	w2, [x0, 60]
	ldrb	w2, [x1, 2465]
	strb	w2, [x0, 20]
	ldrb	w1, [x1, 2466]
	strb	w1, [x0, 21]
.L1972:
	ldr	w0, [x19, 80]
	add	w0, w0, 1
	str	w0, [x19, 80]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1977:
	ldr	w2, [x1, 1360]
	str	w2, [x0, 48]
	ldr	w2, [x1, 1364]
	str	w2, [x0, 52]
	b	.L1971
	.p2align 3
.L1976:
	ldr	w2, [x1, 2500]
	str	w2, [x0, 36]
	b	.L1969
	.size	MVC_ExitSlice, .-MVC_ExitSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_PicTypeStatistic
	.type	MVC_PicTypeStatistic, %function
MVC_PicTypeStatistic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 11116544
	ldrb	w0, [x1, 2456]
	cmp	w0, 1
	beq	.L1980
	cbz	w0, .L1981
	cmp	w0, 2
	bne	.L1978
	ldrb	w0, [x1, 2459]
	add	x19, x19, 11153408
	cmp	w0, 5
	beq	.L1988
.L1983:
	strb	wzr, [x19, 2197]
.L1978:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1981:
	add	x19, x19, 11153408
	ldrb	w0, [x19, 2196]
	cmp	w0, 2
	beq	.L1983
	mov	w0, 1
	strb	wzr, [x19, 2197]
	strb	w0, [x19, 2196]
	b	.L1978
	.p2align 3
.L1980:
	add	x19, x19, 11153408
	mov	w0, 2
	strb	wzr, [x19, 2197]
	strb	w0, [x19, 2196]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1988:
	mov	w0, 1
	strb	w0, [x19, 2197]
	b	.L1978
	.size	MVC_PicTypeStatistic, .-MVC_PicTypeStatistic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_CalcStreamBits
	.type	MVC_CalcStreamBits, %function
MVC_CalcStreamBits:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 11112448
	ldrb	w0, [x0, 3176]
	cbz	w0, .L1990
	ldr	x1, [x19, 240]
	ldr	w0, [x1, 72]
	add	w0, w0, 7
	and	w0, w0, -8
	str	w0, [x1, 72]
	ldr	x1, [x19, 240]
	ldr	w0, [x1, 80]
	sub	w0, w0, #1
	str	w0, [x1, 80]
.L1990:
	ldr	x3, [x19, 240]
	ldrb	w21, [x3]
	cbz	w21, .L2001
	sub	w1, w21, #1
	mov	w4, 32
	mov	x2, 48
	add	x0, x3, 16
	mov	w20, 0
	umaddl	x2, w1, w4, x2
	add	x2, x3, x2
	.p2align 2
.L1992:
	ldr	w1, [x0], 32
	cmp	x0, x2
	add	w20, w20, w1
	bne	.L1992
.L1991:
	sbfiz	x5, x21, 5, 32
	ldr	w6, [x3, 80]
	add	x5, x3, x5
	ldr	x2, .LC300
	ldr	w3, [x3, 72]
	mov	w4, w20
	mov	w1, 7742
	mov	w0, 8
	ldr	w5, [x5, 16]
	bl	dprint_normal
	ldr	x2, [x19, 240]
	ubfiz	x4, x21, 5, 8
	mov	w3, w21
	ldrb	w0, [x2]
	ldr	w1, [x2, 72]
	add	x0, x2, x0, lsl 5
	and	w1, w1, 7
	str	w1, [x0, 28]
	ldr	x2, [x19, 240]
	ldrb	w1, [x2]
	ldr	w0, [x2, 72]
	add	x1, x2, x1, lsl 5
	ldr	w2, [x1, 20]
	add	w0, w2, w0, lsr 3
	sub	w0, w0, w20
	str	w0, [x1, 32]
	ldr	x2, [x19, 240]
	ldrb	w1, [x2]
	ldr	w0, [x2, 72]
	add	x2, x2, x1, lsl 5
	ldr	w1, [x2, 16]
	add	w20, w20, w1
	lsl	w20, w20, 3
	sub	w0, w20, w0
	str	w0, [x2, 24]
	ldr	x1, [x19, 240]
	ldrb	w0, [x1]
	add	x0, x1, x0, lsl 5
	ldp	w2, w1, [x0, 28]
	ubfiz	w1, w1, 3, 2
	add	w1, w1, w2
	str	w1, [x0, 28]
	ldr	x2, .LC302
	mov	w1, 7751
	ldr	x5, [x19, 240]
	ldrb	w0, [x5]
	add	x5, x5, x0, lsl 5
	mov	w0, 8
	ldr	w6, [x5, 32]
	and	w6, w6, -4
	str	w6, [x5, 32]
	ldr	x7, [x19, 240]
	add	x4, x7, x4
	ldrb	w6, [x7]
	ldp	w5, w4, [x4, 24]
	add	x6, x7, x6, lsl 5
	ldr	w6, [x6, 32]
	bl	dprint_normal
	ldr	x0, [x19, 240]
	ldr	w3, [x0, 76]
	sub	w1, w3, #1
	cmp	w1, 1
	bhi	.L2012
	ldrb	w20, [x0]
	add	w2, w20, 1
	cmp	w2, 1
	ccmp	w3, w2, 0, ls
	bls	.L1995
	ldr	x21, .LC306
	add	w20, w20, 2
	.p2align 2
.L1996:
	sub	w3, w20, #1
	mov	x2, x21
	ubfiz	x4, x3, 5, 32
	mov	w1, 7769
	add	x5, x0, x4
	mov	w0, 8
	str	wzr, [x5, 28]
	ldr	x5, [x19, 240]
	add	x5, x5, x4
	ldr	w6, [x5, 20]
	str	w6, [x5, 32]
	ldr	x5, [x19, 240]
	add	x5, x5, x4
	ldr	w6, [x5, 16]
	lsl	w6, w6, 3
	str	w6, [x5, 24]
	ldr	x5, [x19, 240]
	add	x5, x5, x4
	ldp	w7, w6, [x5, 28]
	ubfiz	w6, w6, 3, 2
	add	w6, w6, w7
	str	w6, [x5, 28]
	ldr	x5, [x19, 240]
	add	x5, x5, x4
	ldr	w6, [x5, 32]
	and	w6, w6, -4
	str	w6, [x5, 32]
	ldr	x5, [x19, 240]
	add	x4, x5, x4
	ldp	w5, w4, [x4, 24]
	bl	dprint_normal
	ldr	x0, [x19, 240]
	cmp	w20, 1
	cset	w3, ls
	ldr	w1, [x0, 76]
	cmp	w1, w20
	add	w20, w20, 1
	cset	w2, hi
	tst	w3, w2
	bne	.L1996
	sub	w1, w1, #1
.L1995:
	ubfiz	x1, x1, 5, 32
	ldr	w2, [x0, 80]
	add	x0, x0, x1
	add	x5, x19, 11153408
	ldr	w1, [x0, 24]
	sub	w1, w1, w2
	str	w1, [x0, 24]
	ldr	x3, [x19, 240]
	ldrb	w0, [x3]
	ldr	w4, [x3, 76]
	cmp	w0, w4
	bcs	.L1989
	.p2align 2
.L2006:
	ubfiz	x1, x0, 5, 32
	ldr	w2, [x5, 2816]
	add	x1, x3, x1
	add	w0, w0, 1
	ldr	w1, [x1, 32]
	cmp	w1, w2
	bcs	.L1998
	str	w1, [x5, 2816]
	ldr	w4, [x3, 76]
.L1998:
	cmp	w4, w0
	bhi	.L2006
.L1989:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2012:
	ldr	x2, .LC304
	mov	w1, 7756
	mov	w0, 0
	bl	dprint_normal
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L2001:
	mov	w20, 0
	b	.L1991
	.size	MVC_CalcStreamBits, .-MVC_CalcStreamBits
	.align	3
.LC300:
	.xword	.LC299
	.align	3
.LC302:
	.xword	.LC301
	.align	3
.LC304:
	.xword	.LC303
	.align	3
.LC306:
	.xword	.LC305
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_Scaling_List
	.type	MVC_Scaling_List, %function
MVC_Scaling_List:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	str	x0, [x29, 104]
	mov	x0, x30
	mov	w27, w3
	mov	x28, x1
	mov	x25, x2
	mov	x22, x4
	bl	_mcount
	cmp	w27, wzr
	ble	.L2013
	sub	w26, w27, #1
	mov	w0, 8
	ldr	x21, .LC309
	add	x26, x26, 1
	mov	x20, 0
	mov	w24, w0
	mov	w23, 255
	.p2align 2
.L2019:
	cmp	w27, 16
	add	x1, x21, 64
	beq	.L2024
	ldrb	w19, [x20, x1]
.L2016:
	cbnz	w0, .L2017
	mov	w2, w24
.L2018:
	lsr	w6, w19, 2
	str	w2, [x28, w19, uxtw 2]
	ubfiz	w1, w19, 3, 2
	and	w4, w24, 255
	lsl	w5, w23, w1
	lsl	w4, w4, w1
	ldr	w1, [x25, w6, sxtw 2]
	add	x20, x20, 1
	cmp	x26, x20
	bic	w1, w1, w5
	orr	w1, w1, w4
	str	w1, [x25, w6, sxtw 2]
	bne	.L2019
.L2013:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2017:
	ldr	x1, .LC311
	ldr	x0, [x29, 104]
	bl	mvc_se_v
	add	w0, w0, w24
	and	w0, w0, 255
	cmp	w19, wzr
	ccmp	w0, wzr, 0, eq
	cset	w1, eq
	cmp	w0, wzr
	csel	w2, w24, w0, eq
	str	w1, [x22]
	mov	w24, w2
	b	.L2018
	.p2align 3
.L2024:
	add	x1, x21, 48
	ldrb	w19, [x20, x1]
	b	.L2016
	.size	MVC_Scaling_List, .-MVC_Scaling_List
	.align	3
.LC309:
	.xword	.LANCHOR1
	.align	3
.LC311:
	.xword	.LC310
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ProcessPPS
	.type	MVC_ProcessPPS, %function
MVC_ProcessPPS:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x1, .LC316
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2074
	ldr	x1, .LC318
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 1]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2074
	ldr	x1, .LC320
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 32]
	cbnz	w0, .L2029
	ldrb	w0, [x19, 10]
	cbz	w0, .L2030
.L2029:
	ldr	x2, .LC322
	mov	w1, 8089
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC323
	ldr	x4, [x0]
	cbz	x4, .L2074
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
	mov	w0, -1
.L2027:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2030:
	ldr	x1, .LC325
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w0, 31
	str	w0, [x20, 36]
	bhi	.L2031
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2031
	ldr	x1, .LC329
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w0, 31
	str	w0, [x20, 40]
	bhi	.L2033
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2033
	ldr	x1, .LC333
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 2]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2074
	ldr	x2, .LC335
	mov	w1, 2
	mov	x0, x19
	bl	mvc_u_v
	cmp	w0, 2
	str	w0, [x20, 44]
	bhi	.L2075
	ldr	x1, .LC339
	mov	x0, x19
	bl	mvc_se_v
	str	w0, [x20, 48]
	ldr	x1, .LC341
	mov	x0, x19
	bl	mvc_se_v
	ldr	x1, .LC343
	mov	x0, x19
	bl	mvc_se_v
	str	w0, [x20, 52]
	ldr	x1, .LC345
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 3]
	ldr	x1, .LC347
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 4]
	ldr	x1, .LC349
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 17]
	cbnz	w0, .L2076
.L2036:
	ldr	w0, [x20, 52]
	stp	w0, wzr, [x20, 56]
	strb	wzr, [x20, 18]
	add	x0, x19, 872
	bl	BsResidBits
	ldr	x1, [x19, 240]
	ldr	w1, [x1, 80]
	add	w1, w1, 3
	cmp	w0, w1
	bcc	.L2057
	ldr	x1, .LC353
	mov	x0, x19
	bl	mvc_u_1
	str	w0, [x20, 60]
	ldr	x1, .LC355
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x20, 18]
	beq	.L2038
.L2056:
	ldr	x1, .LC357
	mov	x0, x19
	bl	mvc_se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x20, 56]
	bhi	.L2039
	ldrb	w0, [x19, 10]
	cbz	w0, .L2057
.L2039:
	ldr	x2, .LC364
	mov	w1, 8226
	mov	w0, 1
	bl	dprint_normal
.L2074:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, -1
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2057:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, 0
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2076:
	ldr	x2, .LC351
	mov	w1, 8134
	mov	w0, 1
	bl	dprint_normal
	b	.L2036
	.p2align 3
.L2031:
	ldr	x2, .LC327
	mov	w1, 8098
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2027
	.p2align 3
.L2033:
	ldr	x2, .LC331
	mov	w1, 8107
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2027
	.p2align 3
.L2038:
	ldr	x27, .LC360
	add	x21, x29, 120
	ldr	x25, .LC359
	add	x23, x20, 5
	add	x22, x20, 2016
	add	x24, x20, 64
	mov	w26, 0
	mov	x28, x27
	b	.L2047
	.p2align 3
.L2080:
	ldr	w0, [x20, 28]
	mov	x2, 16
	umull	x0, w0, w3
	ldr	x3, [x19, 272]
	add	x3, x3, x0
	ldr	x0, .LC314
	add	x1, x0, 16
	mov	x0, x22
	ldrb	w4, [x3, 27]
	cmp	w4, 1
	beq	.L2077
	ldr	x4, .LC314
	cmp	w26, wzr
	ldr	x3, [x28, 104]
	csel	x1, x1, x4, ne
	blr	x3
.L2042:
	add	w26, w26, 1
	add	x21, x21, 4
	cmp	w26, 6
	add	x23, x23, 1
	add	x22, x22, 16
	add	x24, x24, 64
	beq	.L2078
.L2047:
	mov	x1, x25
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x23]
	cmp	w0, 1
	str	w0, [x21]
	mov	w3, 3992
	beq	.L2079
	cmp	w26, wzr
	ccmp	w26, 3, 4, ne
	beq	.L2080
	sub	w1, w26, #1
	ldr	x3, [x27, 104]
	add	x1, x1, 126
	mov	x0, x22
	mov	x2, 16
	add	x1, x20, x1, lsl 4
	blr	x3
	b	.L2042
	.p2align 3
.L2078:
	ldr	x21, .LC360
	add	x26, x20, 2112
	ldr	x23, .LC314
	add	x28, x20, 448
	mov	x27, 0
	add	x22, x29, 112
	mov	w24, 3992
	mov	x25, x21
.L2055:
	ldr	w0, [x20, 60]
	mov	w8, w27
	cmp	w0, 1
	beq	.L2081
	add	x0, x20, x27
	str	wzr, [x22, x27, lsl 2]
	strb	wzr, [x0, 11]
.L2050:
	ldr	w0, [x20, 28]
	ldr	x1, [x19, 272]
	umull	x0, w0, w24
	add	x0, x1, x0
	ldrb	w1, [x0, 27]
	cmp	w1, 1
	beq	.L2082
	add	x1, x23, 96
	ldr	x3, [x21, 104]
	cbz	w8, .L2083
.L2054:
	mov	x2, 64
	mov	x0, x26
	blr	x3
.L2051:
	add	x27, x27, 1
	add	x26, x26, 64
	cmp	x27, 2
	add	x28, x28, 256
	bne	.L2055
	b	.L2056
	.p2align 3
.L2079:
	mov	x0, x19
	mov	x4, x21
	mov	x2, x22
	mov	x1, x24
	mov	w3, 16
	bl	MVC_Scaling_List
	ldr	w0, [x21]
	cmp	w0, 1
	bne	.L2042
	ldr	x0, .LC314
	cmp	w26, 2
	mov	x2, 16
	add	x1, x0, 16
	csel	x1, x0, x1, ls
	ldr	x0, .LC360
	ldr	x3, [x0, 104]
	mov	x0, x22
	blr	x3
	b	.L2042
.L2077:
	uxtw	x1, w26
	ldr	x0, .LC360
	add	x1, x1, 167
	add	x1, x3, x1, lsl 4
	ldr	x3, [x0, 104]
	mov	x0, x22
	blr	x3
	b	.L2042
.L2075:
	ldr	x2, .LC337
	mov	w1, 8119
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2027
.L2081:
	ldr	x1, .LC362
	mov	x0, x19
	str	w27, [x29, 108]
	bl	mvc_u_1
	cmp	w0, 1
	add	x1, x20, x27
	str	w0, [x22, x27, lsl 2]
	ldr	w8, [x29, 108]
	strb	w0, [x1, 11]
	bne	.L2050
	mov	x0, x19
	add	x4, x22, x27, lsl 2
	mov	w3, 64
	mov	x2, x26
	mov	x1, x28
	str	w8, [x29, 108]
	bl	MVC_Scaling_List
	ldr	w0, [x22, x27, lsl 2]
	ldr	w8, [x29, 108]
	cmp	w0, 1
	bne	.L2051
	ldr	x0, .LC360
	ldr	x3, [x0, 104]
	ldr	x0, .LC314
	add	x1, x0, 96
	cbnz	w8, .L2054
	add	x1, x0, 32
	b	.L2054
	.p2align 3
.L2082:
	ubfiz	x1, x8, 6, 32
	ldr	x3, [x25, 104]
	add	x1, x1, 2768
	mov	x2, 64
	add	x1, x0, x1
	mov	x0, x26
	blr	x3
	b	.L2051
.L2083:
	ldr	x1, .LC314
	add	x1, x1, 32
	b	.L2054
	.size	MVC_ProcessPPS, .-MVC_ProcessPPS
	.align	3
.LC314:
	.xword	.LANCHOR2
	.align	3
.LC316:
	.xword	.LC315
	.align	3
.LC318:
	.xword	.LC317
	.align	3
.LC320:
	.xword	.LC319
	.align	3
.LC322:
	.xword	.LC321
	.align	3
.LC323:
	.xword	g_EventReportFunc
	.align	3
.LC325:
	.xword	.LC324
	.align	3
.LC327:
	.xword	.LC326
	.align	3
.LC329:
	.xword	.LC328
	.align	3
.LC331:
	.xword	.LC330
	.align	3
.LC333:
	.xword	.LC332
	.align	3
.LC335:
	.xword	.LC334
	.align	3
.LC337:
	.xword	.LC336
	.align	3
.LC339:
	.xword	.LC338
	.align	3
.LC341:
	.xword	.LC340
	.align	3
.LC343:
	.xword	.LC342
	.align	3
.LC345:
	.xword	.LC344
	.align	3
.LC347:
	.xword	.LC346
	.align	3
.LC349:
	.xword	.LC348
	.align	3
.LC351:
	.xword	.LC350
	.align	3
.LC353:
	.xword	.LC352
	.align	3
.LC355:
	.xword	.LC354
	.align	3
.LC357:
	.xword	.LC356
	.align	3
.LC359:
	.xword	.LC358
	.align	3
.LC360:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC362:
	.xword	.LC361
	.align	3
.LC364:
	.xword	.LC363
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_PPSEqual
	.type	MVC_PPSEqual, %function
MVC_PPSEqual:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	mov	w4, 8241
	cbz	x19, .L2106
	cbz	x20, .L2107
	ldrb	w3, [x19]
	ldrb	w2, [x20]
	ldrb	w1, [x19, 1]
	ldrb	w0, [x20, 1]
	cmp	w3, w2
	ldp	w4, w2, [x19, 24]
	ccmp	w1, w0, 0, eq
	ldr	w5, [x19, 36]
	ldp	w3, w0, [x20, 24]
	cset	w1, eq
	ldrb	w7, [x19, 2]
	cmp	w4, w3
	ldr	w3, [x19, 40]
	ccmp	w2, w0, 0, eq
	ldr	w6, [x19, 48]
	ldp	w4, w0, [x20, 36]
	cset	w2, eq
	ldr	w12, [x19, 60]
	cmp	w5, w4
	ldrb	w5, [x20, 2]
	ccmp	w3, w0, 0, eq
	ldr	w3, [x19, 44]
	cset	w4, eq
	cmp	w7, w5
	ldp	w0, w5, [x20, 44]
	ldr	w7, [x19, 52]
	and	w1, w1, w2
	ccmp	w3, w0, 0, eq
	ldr	w3, [x20, 52]
	cset	w0, eq
	cmp	w6, w5
	ldrb	w5, [x20, 3]
	and	w1, w4, w1
	ldrb	w6, [x19, 3]
	ccmp	w7, w3, 0, eq
	cset	w3, eq
	and	w0, w0, w1
	cmp	w6, w5
	ldrb	w1, [x20, 4]
	ldrb	w5, [x19, 4]
	and	w0, w3, w0
	ldr	w4, [x20, 60]
	ccmp	w5, w1, 0, eq
	ldrb	w2, [x19, 18]
	ldrb	w3, [x20, 18]
	cset	w1, eq
	cmp	w4, w12
	and	w0, w1, w0
	ccmp	w3, w2, 0, eq
	cset	w1, eq
	and	w0, w1, w0
	cbz	w2, .L2088
	lsl	w12, w12, 1
	cmn	w12, #6
	beq	.L2088
	add	x10, x19, 1984
	add	x9, x20, 1984
	mov	x11, x20
	add	x7, x19, 64
	mov	w8, -6
	mov	x1, 0
	.p2align 2
.L2093:
	add	x3, x19, x1
	add	x2, x20, x1
	ldrsb	w3, [x3, 5]
	ldrsb	w2, [x2, 5]
	cmp	w2, w3
	cset	w2, eq
	and	w0, w0, w2
	cbz	w3, .L2089
	cmp	w1, 5
	bhi	.L2090
	ldr	w3, [x9]
	ldr	w2, [x10]
	cmp	w3, w2
	cset	w3, eq
	and	w0, w0, w3
	cbnz	w2, .L2089
	sub	x2, x7, #64
	mov	x3, x11
	.p2align 2
.L2091:
	ldr	w5, [x2, 64]
	add	x2, x2, 4
	ldr	w4, [x3, 64]
	add	x3, x3, 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x7, x2
	and	w0, w0, w4
	bne	.L2091
	.p2align 2
.L2089:
	add	w8, w8, 1
	add	x1, x1, 1
	cmp	w8, w12
	add	x10, x10, 4
	add	x9, x9, 4
	add	x11, x11, 64
	add	x7, x7, 64
	bne	.L2093
.L2088:
	ldr	w1, [x20, 56]
	ldr	w2, [x19, 56]
	cmp	w2, w1
	cset	w1, eq
	tst	w1, w0
	csetm	w0, eq
.L2086:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2090:
	uxtw	x2, w8
	add	x3, x2, 500
	lsl	x3, x3, 2
	add	x4, x19, x3
	add	x3, x20, x3
	ldr	w4, [x4, 8]
	ldr	w3, [x3, 8]
	cmp	w3, w4
	cset	w3, eq
	and	w0, w0, w3
	cbnz	w4, .L2089
	lsl	x2, x2, 8
	add	x3, x2, 448
	add	x2, x2, 704
	add	x6, x19, x2
	add	x2, x19, x3
	add	x3, x20, x3
	.p2align 2
.L2092:
	ldr	w5, [x2], 4
	ldr	w4, [x3], 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x6, x2
	and	w0, w0, w4
	bne	.L2092
	add	w8, w8, 1
	add	x1, x1, 1
	cmp	w8, w12
	add	x10, x10, 4
	add	x9, x9, 4
	add	x11, x11, 64
	add	x7, x7, 64
	bne	.L2093
	b	.L2088
.L2107:
	mov	w4, 8242
.L2106:
	ldr	x3, .LC365
	mov	w1, w4
	ldr	x2, .LC366
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L2086
	.size	MVC_PPSEqual, .-MVC_PPSEqual
	.align	3
.LC365:
	.xword	.LC37
	.align	3
.LC366:
	.xword	.LC39
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecPPS
	.type	MVC_DecPPS, %function
MVC_DecPPS:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC368
	mov	x0, x19
	bl	mvc_ue_v
	mov	w20, w0
	ldr	w0, [x19, 40]
	sub	w0, w0, #1
	cmp	w20, w0
	bls	.L2109
	ldr	x2, .LC370
	mov	w1, 8006
	mov	w3, w20
	mov	w0, 1
	bl	dprint_normal
	ldr	w1, [x19, 40]
	sub	w0, w1, #1
	cmp	w20, w0
	bls	.L2116
	ldr	x0, .LC371
	ldr	x4, [x0]
	cbz	x4, .L2116
	ldr	w0, [x19, 120]
	mov	w3, 8
	stp	w20, w1, [x29, 56]
	add	x2, x29, 56
	mov	w1, 29
	blr	x4
	mov	w0, -1
.L2110:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2109:
	ldr	x1, .LC373
	mov	x0, x19
	bl	mvc_ue_v
	mov	w2, w0
	ldr	w0, [x19, 36]
	sub	w0, w0, #1
	cmp	w2, w0
	bhi	.L2120
	mov	w21, 2240
	ldr	x0, [x19, 280]
	umull	x21, w20, w21
	add	x0, x0, x21
	ldrb	w1, [x0, 19]
	cbz	w1, .L2112
	ldr	x22, .LC376
	mov	x0, x19
	mov	x1, x22
	stp	w20, w2, [x22, 24]
	bl	MVC_ProcessPPS
	cbnz	w0, .L2121
	ldr	x1, [x19, 280]
	mov	x0, x22
	add	x1, x1, x21
	bl	MVC_PPSEqual
	cbz	w0, .L2110
	ldr	x3, .LC379
	mov	w1, 1
	ldr	x0, [x19, 280]
	mov	x2, 2240
	strb	w1, [x22, 20]
	ldr	x3, [x3, 112]
	add	x0, x0, x21
	strb	w1, [x22, 19]
	mov	x1, x22
	blr	x3
	mov	w0, 0
	b	.L2110
	.p2align 3
.L2112:
	str	w20, [x0, 24]
	mov	x0, x19
	ldr	x1, [x19, 280]
	add	x1, x1, x21
	str	w2, [x1, 28]
	ldr	x1, [x19, 280]
	add	x1, x1, x21
	bl	MVC_ProcessPPS
	cbnz	w0, .L2122
	ldr	x1, [x19, 280]
	mov	w2, 1
	add	x1, x1, x21
	strb	w2, [x1, 20]
	ldr	x1, [x19, 280]
	add	x21, x1, x21
	strb	w2, [x21, 19]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2116:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, -1
	ldp	x29, x30, [sp], 64
	ret
.L2120:
	ldr	x2, .LC375
	mov	w1, 8020
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2110
.L2121:
	mov	w3, 8038
	ldr	x2, .LC378
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2110
.L2122:
	mov	w3, 8057
	ldr	x2, .LC378
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	ldr	x1, [x19, 280]
	mov	w2, 1
	mov	w0, -1
	add	x1, x1, x21
	strb	w2, [x1, 20]
	ldr	x1, [x19, 280]
	add	x21, x1, x21
	strb	wzr, [x21, 19]
	b	.L2110
	.size	MVC_DecPPS, .-MVC_DecPPS
	.align	3
.LC368:
	.xword	.LC367
	.align	3
.LC370:
	.xword	.LC369
	.align	3
.LC371:
	.xword	g_EventReportFunc
	.align	3
.LC373:
	.xword	.LC372
	.align	3
.LC375:
	.xword	.LC374
	.align	3
.LC376:
	.xword	.LANCHOR3
	.align	3
.LC378:
	.xword	.LC377
	.align	3
.LC379:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_vui_parameters
	.type	mvc_vui_parameters, %function
mvc_vui_parameters:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x1, .LC381
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20]
	cbnz	w0, .L2167
	strb	wzr, [x20, 15]
.L2125:
	ldr	x1, .LC389
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 1]
	cbnz	w0, .L2168
.L2126:
	ldr	x1, .LC393
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 3]
	cbnz	w0, .L2169
	mov	w0, 5
	str	w0, [x20, 28]
.L2128:
	ldr	x1, .LC407
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 6]
	cbnz	w0, .L2170
.L2129:
	ldr	x1, .LC413
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 8]
	cbnz	w0, .L2171
.L2131:
	ldr	x1, .LC421
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 7]
	cbz	w0, .L2133
	ldr	x1, .LC423
	mov	x0, x19
	add	x24, x20, 60
	bl	mvc_ue_v
	ldr	x2, .LC425
	mov	w1, 4
	str	w0, [x24, 36]
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x24, 32]
	ldr	x2, .LC427
	mov	w1, 4
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x24, 33]
	ldr	w1, [x24, 36]
	cmp	w1, 31
	bhi	.L2134
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2134
	ldr	x27, .LC431
	mov	w21, 0
	ldr	x26, .LC433
	ldr	x25, .LC435
	.p2align 2
.L2137:
	uxtw	x22, w21
	mov	x1, x27
	mov	x0, x19
	add	w21, w21, 1
	add	x23, x20, x22, lsl 2
	bl	mvc_ue_v
	mov	x1, x26
	str	w0, [x23, 100]
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x23, 228]
	mov	x1, x25
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x24, x22]
	ldr	w0, [x24, 36]
	cmp	w0, w21
	bcs	.L2137
	ldr	x2, .LC437
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x24, 296]
	ldr	x2, .LC439
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x24, 300]
	ldr	x2, .LC441
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x24, 304]
	ldr	x2, .LC443
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x24, 308]
.L2133:
	ldr	x1, .LC445
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 10]
	cbnz	w0, .L2172
	ldrb	w0, [x20, 7]
	cbz	w0, .L2143
.L2144:
	ldr	x1, .LC447
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 14]
.L2143:
	ldr	x1, .LC449
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 11]
	ldr	x1, .LC451
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 12]
	cbnz	w0, .L2145
	ldrb	w0, [x19, 10]
.L2146:
	cmp	w0, wzr
	csetm	w0, ne
.L2166:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2171:
	ldr	x2, .LC415
	mov	w1, 32
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 52]
	ldr	x2, .LC417
	mov	w1, 32
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 56]
	ldr	x1, .LC419
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 9]
	ldr	w1, [x20, 52]
	cbz	w1, .L2131
	ldr	w2, [x20, 56]
	lsl	w0, w2, 6
	sub	w0, w0, w2
	lsl	w0, w0, 1
	sub	w0, w0, w2
	lsl	w0, w0, 3
	udiv	w0, w0, w1
	lsr	w0, w0, 1
	str	w0, [x19, 56]
	b	.L2131
	.p2align 3
.L2170:
	ldr	x1, .LC409
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 44]
	ldr	x1, .LC411
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 48]
	b	.L2129
	.p2align 3
.L2169:
	ldr	x2, .LC395
	mov	w1, 3
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 28]
	ldr	x1, .LC397
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 4]
	ldr	x1, .LC399
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 5]
	cbz	w0, .L2128
	ldr	x2, .LC401
	mov	w1, 8
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 32]
	ldr	x2, .LC403
	mov	w1, 8
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 36]
	ldr	x2, .LC405
	mov	w1, 8
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 40]
	b	.L2128
	.p2align 3
.L2168:
	ldr	x1, .LC391
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 2]
	b	.L2126
	.p2align 3
.L2167:
	ldr	x2, .LC383
	mov	w1, 8
	mov	x0, x19
	bl	mvc_u_v
	uxtb	w0, w0
	cmp	w0, 255
	strb	w0, [x20, 15]
	bne	.L2125
	ldr	x2, .LC385
	mov	w1, 16
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 16]
	ldr	x2, .LC387
	mov	w1, 16
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 20]
	b	.L2125
	.p2align 3
.L2172:
	ldr	x1, .LC423
	mov	x0, x19
	add	x24, x20, 372
	bl	mvc_ue_v
	ldr	x2, .LC425
	mov	w1, 4
	str	w0, [x24, 36]
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x24, 32]
	ldr	x2, .LC427
	mov	w1, 4
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x24, 33]
	ldr	w1, [x24, 36]
	cmp	w1, 31
	bhi	.L2139
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2139
	ldr	x27, .LC431
	mov	w21, 0
	ldr	x26, .LC433
	ldr	x25, .LC435
	.p2align 2
.L2141:
	uxtw	x22, w21
	mov	x1, x27
	mov	x0, x19
	add	w21, w21, 1
	add	x23, x20, x22, lsl 2
	bl	mvc_ue_v
	mov	x1, x26
	str	w0, [x23, 412]
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x23, 540]
	mov	x1, x25
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x24, x22]
	ldr	w0, [x24, 36]
	cmp	w0, w21
	bcs	.L2141
	ldr	x2, .LC437
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x24, 296]
	ldr	x2, .LC439
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x24, 300]
	ldr	x2, .LC441
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x24, 304]
	ldr	x2, .LC443
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x24, 308]
	ldrb	w0, [x20, 7]
	cbnz	w0, .L2144
	ldrb	w0, [x20, 10]
	cbnz	w0, .L2144
	b	.L2143
	.p2align 3
.L2145:
	ldr	x1, .LC453
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 13]
	ldr	x1, .LC455
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 684]
	ldr	x1, .LC457
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 688]
	ldr	x1, .LC459
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 696]
	ldr	x1, .LC461
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 692]
	ldr	x1, .LC463
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 700]
	ldr	x1, .LC465
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 704]
	ldrb	w0, [x19, 10]
	cbz	w0, .L2146
	mov	w0, -1
	b	.L2166
.L2134:
	ldr	x2, .LC429
	mov	w1, 8387
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2166
.L2139:
	ldr	x2, .LC429
	mov	w1, 8417
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2166
	.size	mvc_vui_parameters, .-mvc_vui_parameters
	.align	3
.LC381:
	.xword	.LC380
	.align	3
.LC383:
	.xword	.LC382
	.align	3
.LC385:
	.xword	.LC384
	.align	3
.LC387:
	.xword	.LC386
	.align	3
.LC389:
	.xword	.LC388
	.align	3
.LC391:
	.xword	.LC390
	.align	3
.LC393:
	.xword	.LC392
	.align	3
.LC395:
	.xword	.LC394
	.align	3
.LC397:
	.xword	.LC396
	.align	3
.LC399:
	.xword	.LC398
	.align	3
.LC401:
	.xword	.LC400
	.align	3
.LC403:
	.xword	.LC402
	.align	3
.LC405:
	.xword	.LC404
	.align	3
.LC407:
	.xword	.LC406
	.align	3
.LC409:
	.xword	.LC408
	.align	3
.LC411:
	.xword	.LC410
	.align	3
.LC413:
	.xword	.LC412
	.align	3
.LC415:
	.xword	.LC414
	.align	3
.LC417:
	.xword	.LC416
	.align	3
.LC419:
	.xword	.LC418
	.align	3
.LC421:
	.xword	.LC420
	.align	3
.LC423:
	.xword	.LC422
	.align	3
.LC425:
	.xword	.LC424
	.align	3
.LC427:
	.xword	.LC426
	.align	3
.LC429:
	.xword	.LC428
	.align	3
.LC431:
	.xword	.LC430
	.align	3
.LC433:
	.xword	.LC432
	.align	3
.LC435:
	.xword	.LC434
	.align	3
.LC437:
	.xword	.LC436
	.align	3
.LC439:
	.xword	.LC438
	.align	3
.LC441:
	.xword	.LC440
	.align	3
.LC443:
	.xword	.LC442
	.align	3
.LC445:
	.xword	.LC444
	.align	3
.LC447:
	.xword	.LC446
	.align	3
.LC449:
	.xword	.LC448
	.align	3
.LC451:
	.xword	.LC450
	.align	3
.LC453:
	.xword	.LC452
	.align	3
.LC455:
	.xword	.LC454
	.align	3
.LC457:
	.xword	.LC456
	.align	3
.LC459:
	.xword	.LC458
	.align	3
.LC461:
	.xword	.LC460
	.align	3
.LC463:
	.xword	.LC462
	.align	3
.LC465:
	.xword	.LC464
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_SPSEqual
	.type	MVC_SPSEqual, %function
MVC_SPSEqual:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	mov	w4, 8465
	cbz	x19, .L2205
	cbz	x20, .L2206
	ldr	w3, [x19, 736]
	ldr	w2, [x20, 736]
	ldrb	w1, [x19]
	ldrb	w0, [x20]
	cmp	w3, w2
	ldrb	w4, [x19, 1]
	ldrb	w2, [x20, 1]
	ccmp	w1, w0, 0, eq
	ldrb	w1, [x19, 2]
	cset	w3, eq
	ldrb	w0, [x20, 2]
	cmp	w4, w2
	ldr	w6, [x19, 740]
	ccmp	w1, w0, 0, eq
	ldr	w5, [x20, 740]
	cset	w0, eq
	ldr	w2, [x20, 744]
	ldr	w4, [x19, 744]
	and	w0, w3, w0
	ldrb	w1, [x19, 27]
	cmp	w6, w5
	ldrb	w3, [x20, 27]
	ccmp	w4, w2, 0, eq
	cset	w2, eq
	cmp	w3, w1
	and	w0, w2, w0
	cset	w2, eq
	and	w0, w2, w0
	cbz	w1, .L2177
	mov	x2, x19
	mov	x8, x20
	mov	w9, -6
	mov	x1, 0
	.p2align 2
.L2182:
	add	x4, x19, x1
	add	x3, x20, x1
	add	x6, x2, 64
	ldrsb	w3, [x3, 6]
	ldrsb	w4, [x4, 6]
	cmp	w3, w4
	cset	w3, eq
	and	w0, w0, w3
	cbz	w4, .L2178
	cmp	w1, 5
	bhi	.L2179
	mov	x3, x8
	.p2align 2
.L2180:
	ldr	w5, [x2, 752]
	add	x2, x2, 4
	ldr	w4, [x3, 752]
	add	x3, x3, 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x2, x6
	and	w0, w0, w4
	bne	.L2180
.L2178:
	add	x1, x1, 1
	add	w9, w9, 1
	cmp	x1, 8
	mov	x2, x6
	add	x8, x8, 64
	bne	.L2182
.L2177:
	ldr	w4, [x19, 2896]
	ldr	w3, [x20, 2896]
	ldr	w2, [x20, 2900]
	ldr	w1, [x19, 2900]
	cmp	w4, w3
	ccmp	w2, w1, 0, eq
	cset	w2, eq
	and	w0, w2, w0
	cbz	w1, .L2184
	cmp	w1, 1
	bne	.L2183
	ldrb	w4, [x19, 18]
	ldrb	w3, [x20, 18]
	ldr	w2, [x19, 2908]
	ldr	w1, [x20, 2908]
	cmp	w4, w3
	ldr	w5, [x19, 2912]
	ldr	w4, [x20, 2912]
	ccmp	w2, w1, 0, eq
	ldr	w2, [x20, 2916]
	cset	w3, eq
	ldr	w1, [x19, 2916]
	cmp	w5, w4
	ccmp	w2, w1, 0, eq
	cset	w2, eq
	and	w2, w3, w2
	and	w0, w0, w2
	cbz	w1, .L2183
	sub	w5, w1, #1
	add	x2, x20, 2920
	add	x5, x5, 731
	add	x1, x19, 2920
	add	x5, x19, x5, lsl 2
	.p2align 2
.L2186:
	ldr	w4, [x1], 4
	ldr	w3, [x2], 4
	cmp	w4, w3
	cset	w3, eq
	cmp	x1, x5
	and	w0, w0, w3
	bne	.L2186
.L2183:
	ldr	w4, [x19, 3944]
	ldr	w3, [x20, 3944]
	ldrb	w2, [x19, 19]
	ldrb	w1, [x20, 19]
	cmp	w4, w3
	ldr	w6, [x19, 3948]
	ldr	w4, [x20, 3948]
	ccmp	w2, w1, 0, eq
	ldr	w5, [x19, 3952]
	cset	w2, eq
	ldr	w1, [x20, 3952]
	cmp	w6, w4
	ldrb	w3, [x19, 20]
	ldrb	w4, [x20, 20]
	ccmp	w5, w1, 0, eq
	cset	w1, eq
	cmp	w4, w3
	and	w2, w2, w1
	cset	w1, eq
	and	w1, w2, w1
	and	w0, w1, w0
	cbnz	w3, .L2187
	ldrb	w1, [x20, 21]
	ldrb	w2, [x19, 21]
	cmp	w2, w1
	cset	w1, eq
	and	w0, w0, w1
.L2187:
	ldrb	w4, [x19, 22]
	ldrb	w3, [x20, 22]
	ldrb	w2, [x20, 23]
	ldrb	w1, [x19, 23]
	cmp	w4, w3
	ccmp	w2, w1, 0, eq
	cset	w2, eq
	and	w0, w2, w0
	cbnz	w1, .L2207
.L2188:
	ldrb	w4, [x19, 24]
	ldrb	w3, [x20, 24]
	ldr	w1, [x20, 52]
	ldr	w2, [x19, 52]
	cmp	w4, w3
	ccmp	w2, w1, 0, eq
	cset	w1, eq
	tst	w1, w0
	csetm	w0, eq
.L2175:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2207:
	ldr	w4, [x19, 3964]
	ldr	w3, [x20, 3964]
	ldr	w2, [x19, 3968]
	ldr	w1, [x20, 3968]
	cmp	w4, w3
	ldr	w5, [x19, 3956]
	ldr	w4, [x20, 3956]
	ccmp	w2, w1, 0, eq
	ldr	w3, [x19, 3960]
	cset	w2, eq
	ldr	w1, [x20, 3960]
	cmp	w5, w4
	ccmp	w3, w1, 0, eq
	cset	w1, eq
	and	w1, w2, w1
	and	w0, w0, w1
	b	.L2188
	.p2align 3
.L2179:
	ubfiz	x3, x9, 8, 32
	add	x4, x3, 1136
	add	x7, x3, 1392
	add	x7, x19, x7
	add	x3, x19, x4
	add	x4, x20, x4
	.p2align 2
.L2181:
	ldr	w6, [x3], 4
	ldr	w5, [x4], 4
	cmp	w6, w5
	cset	w5, eq
	cmp	x3, x7
	and	w0, w0, w5
	bne	.L2181
	add	x1, x1, 1
	add	x6, x2, 64
	cmp	x1, 8
	add	w9, w9, 1
	mov	x2, x6
	add	x8, x8, 64
	bne	.L2182
	b	.L2177
	.p2align 3
.L2184:
	ldr	w1, [x20, 2904]
	ldr	w2, [x19, 2904]
	cmp	w2, w1
	cset	w1, eq
	and	w0, w0, w1
	b	.L2183
.L2206:
	mov	w4, 8466
.L2205:
	ldr	x3, .LC466
	mov	w1, w4
	ldr	x2, .LC467
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L2175
	.size	MVC_SPSEqual, .-MVC_SPSEqual
	.align	3
.LC466:
	.xword	.LC37
	.align	3
.LC467:
	.xword	.LC39
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetDar
	.type	MVC_GetDar, %function
MVC_GetDar:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	mov	w21, w2
	mov	w23, w3
	mov	w22, w4
	bl	_mcount
	cbz	w20, .L2219
	mov	w0, 255
	cmp	w20, 16
	ccmp	w20, w0, 4, gt
	bne	.L2219
	cmp	w19, wzr
	ccmp	w21, wzr, 4, ne
	ccmp	w20, w0, 0, eq
	beq	.L2219
	cmp	w20, 1
	beq	.L2220
	cmp	w20, w0
	beq	.L2210
	ldr	x0, .LC468
	sbfiz	x20, x20, 3, 32
	add	x0, x0, 128
	add	x1, x0, x20
	ldr	w19, [x0, x20]
	ldr	w21, [x1, 4]
.L2210:
	mul	w19, w19, w23
	mul	w3, w21, w22
	lsl	w19, w19, 10
	sdiv	w3, w19, w3
	subs	w1, w3, #2406
	bmi	.L2230
.L2211:
	subs	w0, w3, #2263
	bmi	.L2231
	cmp	w1, w0
	mov	w19, 4
	blt	.L2209
.L2215:
	subs	w1, w3, #1820
	bmi	.L2232
	cmp	w0, w1
	mov	w19, 3
	blt	.L2209
.L2216:
	subs	w0, w3, #1365
	bmi	.L2233
.L2214:
	mov	w19, 2
	cmp	w1, w0
	csinc	w19, w19, wzr, lt
	b	.L2209
	.p2align 3
.L2219:
	mov	w19, 0
	mov	w3, 0
.L2209:
	ldr	x2, .LC470
	mov	w4, w19
	mov	w1, 8609
	mov	w0, 20
	bl	dprint_normal
	ldr	x23, [sp, 48]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2220:
	mov	w19, 5
	mov	w3, 0
	b	.L2209
	.p2align 3
.L2231:
	mov	w0, 2263
	mov	w19, 4
	sub	w0, w0, w3
	cmp	w1, w0
	blt	.L2209
	b	.L2215
	.p2align 3
.L2230:
	mov	w1, 2406
	sub	w1, w1, w3
	b	.L2211
	.p2align 3
.L2232:
	mov	w1, 1820
	mov	w19, 3
	sub	w1, w1, w3
	cmp	w0, w1
	blt	.L2209
	b	.L2216
.L2233:
	mov	w0, 1365
	sub	w0, w0, w3
	b	.L2214
	.size	MVC_GetDar, .-MVC_GetDar
	.align	3
.LC468:
	.xword	.LANCHOR1
	.align	3
.LC470:
	.xword	.LC469
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ProcessSPS
	.type	MVC_ProcessSPS, %function
MVC_ProcessSPS:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L2343
	ldr	w0, [x20, 736]
	mov	w3, 128
	mov	w2, 122
	sub	w1, w0, #110
	and	w4, w0, -17
	and	w1, w1, -9
	cmp	w1, wzr
	ccmp	w4, w3, 4, ne
	cset	w1, eq
	cmp	w0, 100
	ccmp	w0, w2, 4, ne
	cset	w0, eq
	orr	w0, w1, w0
	cbnz	w0, .L2344
	mov	w0, 1
	strb	wzr, [x20, 27]
	str	w0, [x20, 748]
.L2247:
	ldr	x1, .LC496
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w0, 12
	str	w0, [x20, 2896]
	bhi	.L2260
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2260
	ldr	x1, .LC500
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w0, 2
	str	w0, [x20, 2900]
	bhi	.L2262
	ldrb	w1, [x19, 10]
	cbnz	w1, .L2262
	cbz	w0, .L2345
	cmp	w0, 1
	beq	.L2346
.L2266:
	ldr	x1, .LC557
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 3944]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2341
	ldr	x1, .LC520
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 19]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2341
	ldr	x1, .LC522
	mov	x0, x19
	bl	mvc_ue_v
	sub	w1, w0, #1
	cmp	w1, 253
	str	w0, [x20, 3948]
	bhi	.L2273
	ldrb	w1, [x19, 10]
	cbnz	w1, .L2273
	ldr	x1, .LC526
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 3952]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2341
	ldr	x1, .LC528
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 20]
	ldrb	w1, [x19, 10]
	cbnz	w1, .L2341
	cbnz	w0, .L2347
	ldr	x1, .LC559
	mov	x0, x19
	bl	mvc_u_1
	ldr	w22, [x20, 3952]
	strb	w0, [x20, 21]
	add	w22, w22, 1
	cmp	w22, 127
	bhi	.L2306
	ldr	w3, [x20, 3948]
	cmp	w22, 1
	mov	w23, 2
	add	w3, w3, 1
	ccmp	w3, 3, 0, hi
	cset	w0, ls
	cbz	w0, .L2277
.L2306:
	ldr	x2, .LC530
	mov	w1, 8823
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2333
	.p2align 3
.L2344:
	ldr	x1, .LC476
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w0, 1
	str	w0, [x20, 748]
	bhi	.L2238
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2238
	ldr	x1, .LC480
	mov	x0, x19
	bl	mvc_ue_v
	cbnz	w0, .L2240
	ldrb	w0, [x19, 10]
	cbz	w0, .L2241
.L2240:
	ldr	x2, .LC482
	mov	w1, 8652
	mov	w0, 1
	bl	dprint_normal
.L2241:
	ldr	x1, .LC484
	mov	x0, x19
	bl	mvc_ue_v
	cbnz	w0, .L2242
	ldrb	w0, [x19, 10]
	cbz	w0, .L2243
.L2242:
	ldr	x2, .LC486
	mov	w1, 8660
	mov	w0, 1
	bl	dprint_normal
.L2243:
	ldr	x1, .LC488
	mov	x0, x19
	bl	mvc_u_1
	cbnz	w0, .L2244
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2244
	ldr	x1, .LC492
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x20, 27]
	bne	.L2247
	ldr	x25, .LC472
	add	x21, x29, 104
	ldr	x26, .LC493
	add	x23, x20, 6
	add	x22, x20, 2672
	add	x24, x20, 752
	mov	w28, 0
	ldr	x27, .LC494
	b	.L2253
	.p2align 3
.L2350:
	ldr	x0, .LC472
	cmp	w28, wzr
	ldr	x3, [x27, 104]
	mov	x2, 16
	csel	x1, x0, x1, eq
	mov	x0, x22
	blr	x3
.L2249:
	add	w28, w28, 1
	add	x21, x21, 4
	cmp	w28, 6
	add	x23, x23, 1
	add	x22, x22, 16
	add	x24, x24, 64
	beq	.L2348
.L2253:
	mov	x1, x26
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x23]
	cmp	w0, 1
	str	w0, [x21]
	add	x1, x25, 16
	beq	.L2349
	cmp	w28, wzr
	ccmp	w28, 3, 4, ne
	beq	.L2350
	ldr	x0, .LC494
	sub	w1, w28, #1
	add	x1, x1, 167
	mov	x2, 16
	add	w28, w28, 1
	add	x21, x21, 4
	ldr	x3, [x0, 104]
	add	x1, x20, x1, lsl 4
	mov	x0, x22
	add	x23, x23, 1
	add	x22, x22, 16
	add	x24, x24, 64
	blr	x3
	cmp	w28, 6
	bne	.L2253
.L2348:
	ldr	x24, .LC494
	add	x21, x20, 2768
	ldr	x23, .LC472
	add	x22, x20, 1136
	mov	x27, 0
	add	x25, x29, 96
	mov	x28, x24
.L2258:
	mov	x1, x26
	mov	x0, x19
	bl	mvc_u_1
	cmp	w0, 1
	add	x2, x20, x27
	str	w0, [x25, x27, lsl 2]
	add	x1, x23, 96
	strb	w0, [x2, 12]
	beq	.L2351
	ldr	x3, [x24, 104]
	cbz	w27, .L2352
.L2257:
	mov	x0, x21
	mov	x2, 64
.L2337:
	blr	x3
.L2255:
	add	x27, x27, 1
	add	x21, x21, 64
	cmp	x27, 2
	add	x22, x22, 256
	bne	.L2258
	b	.L2247
	.p2align 3
.L2347:
	ldr	w22, [x20, 3952]
	strb	wzr, [x20, 21]
	sub	w0, w22, #1
	cmp	w0, 253
	bhi	.L2305
	ldr	w3, [x20, 3948]
	mov	w23, 1
	add	w22, w22, 1
	add	w3, w3, w23
.L2277:
	mul	w22, w23, w22
	lsl	w24, w3, 4
	mov	w1, 25165824
	lsl	w22, w22, 4
	mul	w0, w24, w22
	lsr	w0, w0, 1
	lsl	w21, w0, 2
	sub	w0, w21, w0
	cmp	w0, w1
	bhi	.L2353
	ldr	w3, [x20, 740]
	sub	w1, w3, #10
	cmp	w1, 31
	bls	.L2354
.L2279:
	ldr	x2, .LC535
	mov	w1, 8899
	mov	w0, 1
	bl	dprint_normal
	.p2align 2
.L2341:
	mov	w0, -1
.L2333:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2345:
	ldr	x1, .LC504
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w0, 12
	str	w0, [x20, 2904]
	bhi	.L2265
	ldrb	w0, [x19, 10]
	cbz	w0, .L2266
.L2265:
	ldr	x2, .LC506
	mov	w1, 8757
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2333
	.p2align 3
.L2354:
	ldr	x2, .LC533
	ldrh	w1, [x2,w1,uxtw #1]
	adr	x2, .Lrtx2281
	add	x1, x2, w1, sxth #2
	br	x1
.Lrtx2281:
	.section	.rodata
	.align	0
	.align	2
.L2281:
	.2byte	(.L2280 - .Lrtx2281) / 4
	.2byte	(.L2313 - .Lrtx2281) / 4
	.2byte	(.L2283 - .Lrtx2281) / 4
	.2byte	(.L2283 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2283 - .Lrtx2281) / 4
	.2byte	(.L2284 - .Lrtx2281) / 4
	.2byte	(.L2286 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2286 - .Lrtx2281) / 4
	.2byte	(.L2287 - .Lrtx2281) / 4
	.2byte	(.L2288 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2279 - .Lrtx2281) / 4
	.2byte	(.L2290 - .Lrtx2281) / 4
	.2byte	(.L2290 - .Lrtx2281) / 4
	.text
	.p2align 3
.L2283:
	mov	w21, 60416
	movk	w21, 0xd, lsl 16
.L2282:
	udiv	w21, w21, w0
	mov	w3, 16
	ldr	x2, .LC537
	mov	w1, 8910
	cmp	w21, w3
	mov	w0, 19
	csel	w21, w21, w3, ls
	mov	w3, w21
	bl	dprint_normal
	ldr	w3, [x20, 3944]
	cmp	w3, w21
	bhi	.L2291
	ldrb	w0, [x19, 10]
	cbz	w0, .L2292
.L2291:
	ldr	x2, .LC539
	mov	w4, w21
	mov	w1, 8915
	mov	w0, 0
	bl	dprint_normal
	ldr	w0, [x20, 3944]
	cmp	w0, 16
	bhi	.L2338
	cmp	w21, w0
	csel	w21, w21, w0, cs
.L2338:
	str	w21, [x20, 3944]
.L2292:
	ldr	x1, .LC541
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 22]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2341
	ldr	x1, .LC543
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 23]
	ldrb	w1, [x19, 10]
	cbnz	w1, .L2341
	cbnz	w0, .L2355
.L2294:
	add	x2, x20, 3840
	lsr	w1, w24, 1
	lsr	w0, w22, 1
	stp	w24, w22, [x2, 136]
	stp	w1, w0, [x2, 144]
.L2296:
	ldr	x1, .LC553
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 24]
	ldrb	w1, [x19, 10]
	cbnz	w1, .L2341
	mov	w1, 2
	str	w1, [x20, 68]
	cbnz	w0, .L2356
	mov	w0, 5
	strb	wzr, [x20, 43]
	str	w0, [x20, 56]
	mov	w0, 0
.L2299:
	ldp	w1, w2, [x20, 44]
	mov	w4, w22
	mov	w3, w24
	bl	MVC_GetDar
	str	w0, [x20, 52]
	ldr	w1, [x20, 3944]
	cbz	w1, .L2302
	cmp	w21, w1
	csel	w21, w21, w1, ls
.L2302:
	cmp	w21, 16
	mov	w0, 16
	csel	w21, w21, w0, ls
	cmp	w22, 1919
	bls	.L2303
	mov	w0, 4
	cmp	w21, w0
	csel	w21, w21, w0, ls
.L2303:
	add	w21, w21, 1
	str	w21, [x20, 3972]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2290:
	mov	w21, 12582912
	b	.L2282
	.p2align 3
.L2286:
	mov	w21, 30208
	movk	w21, 0x2f, lsl 16
	b	.L2282
	.p2align 3
.L2349:
	mov	x0, x19
	mov	x4, x21
	mov	x2, x22
	mov	x1, x24
	mov	w3, 16
	bl	MVC_Scaling_List
	ldr	w0, [x21]
	cmp	w0, 1
	bne	.L2249
	ldr	x0, .LC472
	cmp	w28, 2
	mov	x2, 16
	add	x1, x0, 16
	csel	x1, x0, x1, ls
	ldr	x0, .LC494
	ldr	x3, [x0, 104]
	mov	x0, x22
	blr	x3
	b	.L2249
	.p2align 3
.L2238:
	ldr	x2, .LC478
	mov	w1, 8644
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2260:
	ldr	x2, .LC498
	mov	w1, 8739
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2333
	.p2align 3
.L2355:
	ldr	x1, .LC545
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 3956]
	ldr	x1, .LC547
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 3960]
	ldr	x1, .LC549
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 3964]
	ldr	x1, .LC551
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 3968]
	ldr	w1, [x20, 3964]
	ldr	w2, [x20, 3956]
	lsl	w1, w1, 1
	ldr	w3, [x20, 3960]
	lsl	w2, w2, 1
	mul	w1, w1, w23
	sub	w4, w24, w2
	lsl	w23, w23, 1
	sub	w3, w4, w3, lsl 1
	sub	w4, w22, w1
	cmp	w3, wzr
	msub	w0, w23, w0, w4
	ccmp	w0, wzr, 4, gt
	ble	.L2294
	add	x4, x20, 3840
	add	w2, w2, w3, lsr 1
	add	w1, w1, w0, lsr 1
	stp	w3, w0, [x4, 136]
	stp	w2, w1, [x4, 144]
	b	.L2296
	.p2align 3
.L2356:
	add	x1, x20, 28
	mov	x0, x19
	bl	mvc_vui_parameters
	cbnz	w0, .L2340
	ldrb	w0, [x20, 40]
	cbz	w0, .L2340
	ldr	w3, [x20, 732]
	cmp	w3, wzr
	ccmp	w21, w3, 0, ne
	bcc	.L2357
	ldr	w21, [x20, 3944]
	ldrb	w0, [x20, 43]
	cmp	w21, w3
	csel	w21, w21, w3, cs
	b	.L2299
.L2357:
	ldr	x2, .LC555
	mov	w4, w21
	mov	w1, 8990
	mov	w0, 1
	bl	dprint_normal
	.p2align 2
.L2340:
	ldrb	w0, [x20, 43]
	b	.L2299
	.p2align 3
.L2244:
	ldr	x2, .LC490
	mov	w1, 8668
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2333
	.p2align 3
.L2346:
	ldr	x1, .LC508
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 18]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2341
	ldr	x1, .LC510
	mov	x0, x19
	bl	mvc_se_v
	str	w0, [x20, 2908]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2341
	ldr	x1, .LC512
	mov	x0, x19
	bl	mvc_se_v
	str	w0, [x20, 2912]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2341
	ldr	x1, .LC514
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w0, 255
	str	w0, [x20, 2916]
	bhi	.L2269
	ldrb	w1, [x19, 10]
	cbnz	w1, .L2269
	cbz	w0, .L2266
	ldr	x22, .LC518
	mov	w21, 0
	b	.L2272
	.p2align 3
.L2358:
	ldr	w0, [x20, 2916]
	cmp	w0, w21
	bls	.L2266
.L2272:
	mov	x1, x22
	mov	x0, x19
	bl	mvc_se_v
	add	x1, x20, x21, uxtw 2
	add	w21, w21, 1
	str	w0, [x1, 2920]
	ldrb	w0, [x19, 10]
	cbz	w0, .L2358
	b	.L2341
	.p2align 3
.L2273:
	ldr	x2, .LC524
	mov	w3, w0
	mov	w1, 8799
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2333
	.p2align 3
.L2313:
	mov	w21, 17920
	movk	w21, 0x5, lsl 16
	b	.L2282
	.p2align 3
.L2287:
	mov	w21, 30720
	movk	w21, 0x69, lsl 16
	b	.L2282
	.p2align 3
.L2284:
	mov	w21, 55296
	movk	w21, 0x1b, lsl 16
	b	.L2282
	.p2align 3
.L2288:
	mov	w21, 7864320
	b	.L2282
	.p2align 3
.L2280:
	mov	w21, 20992
	movk	w21, 0x2, lsl 16
	b	.L2282
.L2269:
	ldr	x2, .LC516
	mov	w1, 8776
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2333
	.p2align 3
.L2351:
	mov	x0, x19
	add	x4, x25, x27, lsl 2
	mov	x2, x21
	mov	x1, x22
	mov	w3, 64
	bl	MVC_Scaling_List
	ldr	w0, [x25, x27, lsl 2]
	cmp	w0, 1
	bne	.L2255
	ldr	x1, .LC472
	mov	x2, 64
	mov	x0, x21
	ldr	x3, [x28, 104]
	add	x1, x1, 96
	cbnz	w27, .L2337
	ldr	x1, .LC472
	add	x1, x1, 32
	b	.L2337
	.p2align 3
.L2262:
	ldr	x2, .LC502
	mov	w1, 8747
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2333
.L2353:
	ldr	x2, .LC532
	mov	w1, 8844
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L2333
.L2305:
	ldr	x2, .LC530
	mov	w1, 8833
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2333
.L2343:
	mov	w4, 8633
	ldr	x3, .LC473
	ldr	x2, .LC474
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L2333
.L2352:
	ldr	x1, .LC472
	add	x1, x1, 32
	b	.L2257
	.size	MVC_ProcessSPS, .-MVC_ProcessSPS
	.align	3
.LC472:
	.xword	.LANCHOR2
	.align	3
.LC473:
	.xword	.LC37
	.align	3
.LC474:
	.xword	.LC39
	.align	3
.LC476:
	.xword	.LC475
	.align	3
.LC478:
	.xword	.LC477
	.align	3
.LC480:
	.xword	.LC479
	.align	3
.LC482:
	.xword	.LC481
	.align	3
.LC484:
	.xword	.LC483
	.align	3
.LC486:
	.xword	.LC485
	.align	3
.LC488:
	.xword	.LC487
	.align	3
.LC490:
	.xword	.LC489
	.align	3
.LC492:
	.xword	.LC491
	.align	3
.LC493:
	.xword	.LC358
	.align	3
.LC494:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC496:
	.xword	.LC495
	.align	3
.LC498:
	.xword	.LC497
	.align	3
.LC500:
	.xword	.LC499
	.align	3
.LC502:
	.xword	.LC501
	.align	3
.LC504:
	.xword	.LC503
	.align	3
.LC506:
	.xword	.LC505
	.align	3
.LC508:
	.xword	.LC507
	.align	3
.LC510:
	.xword	.LC509
	.align	3
.LC512:
	.xword	.LC511
	.align	3
.LC514:
	.xword	.LC513
	.align	3
.LC516:
	.xword	.LC515
	.align	3
.LC518:
	.xword	.LC517
	.align	3
.LC520:
	.xword	.LC519
	.align	3
.LC522:
	.xword	.LC521
	.align	3
.LC524:
	.xword	.LC523
	.align	3
.LC526:
	.xword	.LC525
	.align	3
.LC528:
	.xword	.LC527
	.align	3
.LC530:
	.xword	.LC529
	.align	3
.LC532:
	.xword	.LC531
	.align	3
.LC533:
	.xword	.L2281
	.align	3
.LC535:
	.xword	.LC534
	.align	3
.LC537:
	.xword	.LC536
	.align	3
.LC539:
	.xword	.LC538
	.align	3
.LC541:
	.xword	.LC540
	.align	3
.LC543:
	.xword	.LC542
	.align	3
.LC545:
	.xword	.LC544
	.align	3
.LC547:
	.xword	.LC546
	.align	3
.LC549:
	.xword	.LC548
	.align	3
.LC551:
	.xword	.LC550
	.align	3
.LC553:
	.xword	.LC552
	.align	3
.LC555:
	.xword	.LC554
	.align	3
.LC557:
	.xword	.LC556
	.align	3
.LC559:
	.xword	.LC558
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecSPS
	.type	MVC_DecSPS, %function
MVC_DecSPS:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC561
	mov	w1, 8
	mov	x0, x19
	bl	mvc_u_v
	mov	w21, w0
	ldr	x1, .LC563
	mov	x0, x19
	bl	mvc_u_1
	mov	w27, w0
	ldr	x1, .LC565
	mov	x0, x19
	bl	mvc_u_1
	mov	w26, w0
	ldr	x1, .LC567
	mov	x0, x19
	bl	mvc_u_1
	mov	w25, w0
	ldr	x1, .LC569
	mov	x0, x19
	bl	mvc_u_1
	mov	w24, w0
	ldr	x1, .LC571
	mov	x0, x19
	bl	mvc_u_1
	mov	w23, w0
	ldr	x1, .LC573
	mov	x0, x19
	bl	mvc_u_1
	mov	w22, w0
	ldr	x2, .LC575
	mov	w1, 2
	mov	x0, x19
	bl	mvc_u_v
	ldr	x2, .LC577
	mov	w1, 8
	mov	x0, x19
	bl	mvc_u_v
	mov	w20, w0
	ldr	x1, .LC579
	mov	x0, x19
	bl	mvc_ue_v
	mov	w28, w0
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2396
	ldr	w0, [x19, 36]
	sub	w0, w0, #1
	cmp	w28, w0
	bhi	.L2398
	cmp	w21, 100
	mov	w5, w21
	beq	.L2365
	bgt	.L2366
	cmp	w21, 77
	beq	.L2365
	cmp	w21, 88
	beq	.L2367
	cmp	w21, 66
	bne	.L2364
	ldr	x2, .LC583
	mov	w1, 9071
	mov	w0, 1
	str	w21, [x29, 108]
	bl	dprint_normal
	ldr	w5, [x29, 108]
.L2365:
	cmp	w20, 9
	mov	w3, w20
	bls	.L2399
.L2370:
	cmp	w20, 41
	bls	.L2371
	ldr	x2, .LC591
	mov	w4, 41
	mov	w1, 9104
	mov	w0, 1
	str	w5, [x29, 108]
	bl	dprint_normal
	ldr	w5, [x29, 108]
	mov	w3, 41
.L2371:
	mov	w20, 3992
	ldr	x0, [x19, 272]
	umull	x20, w28, w20
	add	x0, x0, x20
	ldrb	w1, [x0, 25]
	cbz	w1, .L2372
	ldr	x21, .LC592
	mov	x0, x19
	add	x21, x21, 2240
	strb	w27, [x21]
	str	w5, [x21, 736]
	mov	x1, x21
	strb	w26, [x21, 1]
	strb	w25, [x21, 2]
	strb	w24, [x21, 3]
	strb	w23, [x21, 4]
	strb	w22, [x21, 5]
	str	w3, [x21, 740]
	str	w28, [x21, 744]
	bl	MVC_ProcessSPS
	cbnz	w0, .L2400
	ldr	x1, [x19, 272]
	mov	x0, x21
	add	x1, x1, x20
	bl	MVC_SPSEqual
	cbnz	w0, .L2401
.L2361:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2366:
	cmp	w21, 122
	beq	.L2369
	cmp	w21, 144
	beq	.L2369
	cmp	w21, 110
	beq	.L2369
.L2364:
	ldr	x2, .LC589
	mov	w3, w21
	mov	w1, 9091
	mov	w0, 1
	bl	dprint_normal
	cmp	w20, 9
	mov	w5, 100
	mov	w3, w20
	bhi	.L2370
	b	.L2399
	.p2align 3
.L2372:
	str	w5, [x0, 736]
	mov	x0, x19
	ldr	x1, [x19, 272]
	strb	w27, [x1, x20]
	ldr	x1, [x19, 272]
	add	x1, x1, x20
	strb	w26, [x1, 1]
	ldr	x1, [x19, 272]
	add	x1, x1, x20
	strb	w25, [x1, 2]
	ldr	x1, [x19, 272]
	add	x1, x1, x20
	strb	w24, [x1, 3]
	ldr	x1, [x19, 272]
	add	x1, x1, x20
	strb	w23, [x1, 4]
	ldr	x1, [x19, 272]
	add	x1, x1, x20
	strb	w22, [x1, 5]
	ldr	x1, [x19, 272]
	add	x1, x1, x20
	str	w3, [x1, 740]
	ldr	x1, [x19, 272]
	add	x1, x1, x20
	str	w28, [x1, 744]
	ldr	x1, [x19, 272]
	add	x1, x1, x20
	bl	MVC_ProcessSPS
	cbnz	w0, .L2402
	ldr	x1, [x19, 272]
	mov	w2, 1
	add	x1, x1, x20
	strb	w2, [x1, 26]
	ldr	x1, [x19, 272]
	add	x20, x1, x20
	strb	w2, [x20, 25]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2398:
	ldr	x2, .LC580
	mov	w1, 9058
	mov	w0, 1
	bl	dprint_normal
	ldr	w1, [x19, 36]
	sub	w0, w1, #1
	cmp	w28, w0
	bls	.L2396
	ldr	x0, .LC581
	ldr	x4, [x0]
	cbz	x4, .L2396
	ldr	w0, [x19, 120]
	mov	w3, 8
	stp	w28, w1, [x29, 120]
	add	x2, x29, 120
	mov	w1, 28
	blr	x4
.L2396:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, -1
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2399:
	ldr	x2, .LC591
	mov	w4, 41
	mov	w1, 9098
	mov	w0, 1
	str	w5, [x29, 108]
	bl	dprint_normal
	mov	w3, 41
	ldr	w5, [x29, 108]
	b	.L2371
	.p2align 3
.L2369:
	ldr	x2, .LC587
	mov	w1, 9087
	mov	w0, 1
	str	w5, [x29, 108]
	bl	dprint_normal
	cmp	w20, 9
	ldr	w5, [x29, 108]
	mov	w3, w20
	bhi	.L2370
	b	.L2399
	.p2align 3
.L2367:
	ldr	x2, .LC585
	mov	w1, 9075
	mov	w0, 1
	str	w21, [x29, 108]
	bl	dprint_normal
	cmp	w20, 9
	ldr	w5, [x29, 108]
	mov	w3, w20
	bhi	.L2370
	b	.L2399
	.p2align 3
.L2401:
	ldr	x3, .LC595
	mov	w1, 1
	ldr	x0, [x19, 272]
	mov	x2, 3992
	strb	w1, [x21, 26]
	ldr	x3, [x3, 112]
	add	x0, x0, x20
	strb	w1, [x21, 25]
	mov	x1, x21
	blr	x3
	mov	w0, 0
	b	.L2361
	.p2align 3
.L2400:
	mov	w3, 9122
	ldr	x2, .LC594
	mov	w4, w28
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2361
.L2402:
	mov	w3, 9148
	ldr	x2, .LC594
	mov	w1, w3
	mov	w4, w28
	mov	w0, 1
	bl	dprint_normal
	ldr	x1, [x19, 272]
	mov	w2, 1
	mov	w0, -1
	add	x1, x1, x20
	strb	w2, [x1, 26]
	ldr	x1, [x19, 272]
	add	x20, x1, x20
	strb	wzr, [x20, 25]
	b	.L2361
	.size	MVC_DecSPS, .-MVC_DecSPS
	.align	3
.LC561:
	.xword	.LC560
	.align	3
.LC563:
	.xword	.LC562
	.align	3
.LC565:
	.xword	.LC564
	.align	3
.LC567:
	.xword	.LC566
	.align	3
.LC569:
	.xword	.LC568
	.align	3
.LC571:
	.xword	.LC570
	.align	3
.LC573:
	.xword	.LC572
	.align	3
.LC575:
	.xword	.LC574
	.align	3
.LC577:
	.xword	.LC576
	.align	3
.LC579:
	.xword	.LC578
	.align	3
.LC580:
	.xword	.LC374
	.align	3
.LC581:
	.xword	g_EventReportFunc
	.align	3
.LC583:
	.xword	.LC582
	.align	3
.LC585:
	.xword	.LC584
	.align	3
.LC587:
	.xword	.LC586
	.align	3
.LC589:
	.xword	.LC588
	.align	3
.LC591:
	.xword	.LC590
	.align	3
.LC592:
	.xword	.LANCHOR3
	.align	3
.LC594:
	.xword	.LC593
	.align	3
.LC595:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ProcessSUBSPSMvcExt
	.type	MVC_ProcessSUBSPSMvcExt, %function
MVC_ProcessSUBSPSMvcExt:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L2463
	ldr	x1, .LC600
	mov	x0, x20
	bl	mvc_ue_v
	cmp	w0, 1
	str	w0, [x19, 4]
	bhi	.L2406
	ldrb	w1, [x20, 10]
	cbnz	w1, .L2406
	ldr	x22, .LC604
	mov	w21, 0
	.p2align 2
.L2408:
	mov	x1, x22
	mov	x0, x20
	bl	mvc_ue_v
	add	x1, x19, x21, uxtw 2
	add	w21, w21, 1
	str	w0, [x1, 8]
	ldr	w0, [x19, 4]
	cmp	w0, w21
	bcs	.L2408
	str	wzr, [x19, 16]
	str	wzr, [x19, 24]
	cbz	w0, .L2409
	ldr	x27, .LC606
	mov	w25, 1
	ldr	x23, .LC612
	mov	w26, 15
	ldr	x24, .LC616
	.p2align 2
.L2419:
	uxtw	x22, w25
	mov	x1, x27
	mov	x0, x20
	add	x21, x19, x22, lsl 2
	bl	mvc_ue_v
	str	w0, [x21, 16]
	ldr	w1, [x19, 4]
	cmp	w1, 15
	csel	w1, w1, w26, ls
	cmp	w0, w1
	bhi	.L2410
	ldrb	w1, [x20, 10]
	cbnz	w1, .L2410
	mov	w28, 0
	cbz	w0, .L2415
	.p2align 2
.L2414:
	mov	x1, x23
	mov	x0, x20
	bl	mvc_ue_v
	add	x1, x22, x28, uxtw
	add	w28, w28, 1
	add	x1, x1, 8
	str	w0, [x19, x1, lsl 2]
	ldr	w0, [x21, 16]
	cmp	w0, w28
	bhi	.L2414
.L2415:
	ldr	x1, .LC608
	mov	x0, x20
	bl	mvc_ue_v
	str	w0, [x21, 24]
	ldr	w1, [x19, 4]
	cmp	w1, 15
	csel	w2, w1, w26, ls
	cmp	w0, w2
	bhi	.L2412
	ldrb	w2, [x20, 10]
	cbnz	w2, .L2412
	mov	w28, 0
	cbz	w0, .L2417
	.p2align 2
.L2418:
	mov	x1, x24
	mov	x0, x20
	bl	mvc_ue_v
	add	x1, x22, x28, uxtw
	add	w28, w28, 1
	add	x1, x1, 10
	str	w0, [x19, x1, lsl 2]
	ldr	w0, [x21, 24]
	cmp	w0, w28
	bhi	.L2418
	ldr	w1, [x19, 4]
.L2417:
	add	w25, w25, 1
	cmp	w25, w1
	bls	.L2419
	str	wzr, [x19, 48]
	str	wzr, [x19, 56]
	cbz	w1, .L2433
	ldr	x27, .LC620
	mov	w25, 1
	ldr	x23, .LC626
	mov	w26, 15
	ldr	x24, .LC630
	.p2align 2
.L2432:
	uxtw	x22, w25
	mov	x1, x27
	mov	x0, x20
	add	x21, x19, x22, lsl 2
	bl	mvc_ue_v
	str	w0, [x21, 48]
	ldr	w1, [x19, 4]
	cmp	w1, 15
	csel	w1, w1, w26, ls
	cmp	w0, w1
	bhi	.L2423
	ldrb	w1, [x20, 10]
	cbnz	w1, .L2423
	mov	w28, 0
	cbz	w0, .L2428
	.p2align 2
.L2427:
	mov	x1, x23
	mov	x0, x20
	bl	mvc_ue_v
	add	x1, x22, x28, uxtw
	add	w28, w28, 1
	add	x1, x1, 16
	str	w0, [x19, x1, lsl 2]
	ldr	w0, [x21, 48]
	cmp	w0, w28
	bhi	.L2427
.L2428:
	ldr	x1, .LC622
	mov	x0, x20
	bl	mvc_ue_v
	str	w0, [x21, 56]
	ldr	w1, [x19, 4]
	cmp	w1, 15
	csel	w2, w1, w26, ls
	cmp	w0, w2
	bhi	.L2425
	ldrb	w2, [x20, 10]
	cbnz	w2, .L2425
	mov	w28, 0
	cbz	w0, .L2430
	.p2align 2
.L2431:
	mov	x1, x24
	mov	x0, x20
	bl	mvc_ue_v
	add	x1, x22, x28, uxtw
	add	w28, w28, 1
	add	x1, x1, 18
	str	w0, [x19, x1, lsl 2]
	ldr	w0, [x21, 56]
	cmp	w0, w28
	bhi	.L2431
	ldr	w1, [x19, 4]
.L2430:
	add	w25, w25, 1
	cmp	w25, w1
	bls	.L2432
.L2433:
	ldr	x1, .LC618
	mov	x0, x20
	bl	mvc_ue_v
	add	w1, w0, 1
	cmp	w1, 16
	str	w0, [x19, 80]
	str	w1, [x29, 132]
	bhi	.L2421
	ldrb	w0, [x20, 10]
	cbnz	w0, .L2421
	ldr	w0, [x29, 132]
	cbz	w0, .L2438
	add	x0, x19, 8192
	ldr	x22, .LC648
	add	x1, x19, 84
	add	x0, x0, 212
	str	x1, [x29, 120]
	stp	xzr, x0, [x29, 104]
	str	x19, [x29, 136]
	str	wzr, [x29, 144]
.L2437:
	ldr	x2, .LC634
	mov	w1, 8
	mov	x0, x20
	bl	mvc_u_v
	ldr	x21, [x29, 120]
	ldr	x1, .LC636
	str	w0, [x21]
	mov	x0, x20
	bl	mvc_ue_v
	add	w27, w0, 1
	cmp	w27, 64
	str	w0, [x21, 64]
	bhi	.L2435
	ldrb	w0, [x20, 10]
	cbnz	w0, .L2435
	cbz	w27, .L2446
	ldp	x26, x25, [x29, 104]
	ldr	x23, [x29, 136]
	mov	w24, 0
.L2436:
	ldr	x2, .LC640
	mov	w1, 3
	mov	x0, x20
	bl	mvc_u_v
	str	w0, [x23, 212]
	ldr	x1, .LC642
	mov	x0, x20
	bl	mvc_ue_v
	add	w3, w0, 1
	cmp	w3, 64
	str	w0, [x23, 4308]
	bhi	.L2439
	ldrb	w1, [x20, 10]
	cbnz	w1, .L2439
	cbz	w3, .L2444
	add	x21, x26, x0, uxtw
	mov	x28, x25
	add	x21, x21, 2102
	add	x21, x19, x21, lsl 2
	.p2align 2
.L2443:
	mov	x1, x22
	mov	x0, x20
	bl	mvc_ue_v
	str	w0, [x28], 4
	cmp	x28, x21
	bne	.L2443
.L2444:
	ldr	x1, .LC644
	mov	x0, x20
	bl	mvc_ue_v
	cmp	w0, 1023
	add	x1, x23, 270336
	str	w0, [x1, 212]
	bhi	.L2441
	ldrb	w1, [x20, 10]
	cbnz	w1, .L2441
	add	w24, w24, 1
	add	x23, x23, 4
	cmp	w27, w24
	add	x25, x25, 256
	add	x26, x26, 64
	bne	.L2436
.L2446:
	ldr	x1, [x29, 120]
	ldr	w0, [x29, 144]
	add	x1, x1, 4
	str	x1, [x29, 120]
	ldr	w1, [x29, 132]
	add	w0, w0, 1
	str	w0, [x29, 144]
	cmp	w1, w0
	ldr	x0, [x29, 136]
	add	x0, x0, 256
	str	x0, [x29, 136]
	ldr	x0, [x29, 112]
	add	x0, x0, 16384
	str	x0, [x29, 112]
	ldr	x0, [x29, 104]
	add	x0, x0, 4096
	str	x0, [x29, 104]
	bne	.L2437
.L2438:
	mov	w0, 0
	b	.L2458
	.p2align 3
.L2410:
	ldr	x2, .LC610
	mov	w3, w0
	mov	w1, 9200
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
.L2458:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	ret
.L2412:
	ldr	x2, .LC614
	mov	w3, w0
	mov	w1, 9213
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	ret
.L2423:
	ldr	x2, .LC624
	mov	w3, w0
	mov	w1, 9232
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2458
.L2406:
	mov	w1, 65534
	ldr	x2, .LC602
	mov	w3, w0
	str	w1, [x19, 80]
	mov	w0, 1
	mov	w1, 9182
	bl	dprint_normal
	mov	w0, -1
	b	.L2458
.L2425:
	ldr	x2, .LC628
	mov	w3, w0
	mov	w1, 9245
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2458
.L2409:
	str	wzr, [x19, 48]
	str	wzr, [x19, 56]
	b	.L2433
.L2441:
	ldr	x2, .LC650
	mov	w3, w0
	mov	w1, 9300
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2458
.L2439:
	ldr	x0, [x29, 144]
	mov	w4, 65534
	ldr	x2, .LC646
	mov	w1, 9287
	ubfiz	x28, x0, 6, 32
	mov	w0, 1
	add	x24, x28, x24, uxtw
	add	x19, x19, x24, lsl 2
	str	w4, [x19, 4308]
	bl	dprint_normal
	mov	w0, -1
	b	.L2458
.L2463:
	mov	w4, 9175
	ldr	x3, .LC597
	ldr	x2, .LC598
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L2458
.L2421:
	mov	w0, 65534
	ldr	x2, .LC632
	ldr	w3, [x29, 132]
	mov	w1, 9261
	str	w0, [x19, 80]
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2458
.L2435:
	ldr	x0, [x29, 144]
	mov	w4, 65534
	ldr	x2, .LC638
	mov	w3, w27
	mov	w1, 9274
	add	x19, x19, x0, uxtw 2
	mov	w0, 1
	str	w4, [x19, 148]
	bl	dprint_normal
	mov	w0, -1
	b	.L2458
	.size	MVC_ProcessSUBSPSMvcExt, .-MVC_ProcessSUBSPSMvcExt
	.align	3
.LC597:
	.xword	.LC37
	.align	3
.LC598:
	.xword	.LC39
	.align	3
.LC600:
	.xword	.LC599
	.align	3
.LC602:
	.xword	.LC601
	.align	3
.LC604:
	.xword	.LC603
	.align	3
.LC606:
	.xword	.LC605
	.align	3
.LC608:
	.xword	.LC607
	.align	3
.LC610:
	.xword	.LC609
	.align	3
.LC612:
	.xword	.LC611
	.align	3
.LC614:
	.xword	.LC613
	.align	3
.LC616:
	.xword	.LC615
	.align	3
.LC618:
	.xword	.LC617
	.align	3
.LC620:
	.xword	.LC619
	.align	3
.LC622:
	.xword	.LC621
	.align	3
.LC624:
	.xword	.LC623
	.align	3
.LC626:
	.xword	.LC625
	.align	3
.LC628:
	.xword	.LC627
	.align	3
.LC630:
	.xword	.LC629
	.align	3
.LC632:
	.xword	.LC631
	.align	3
.LC634:
	.xword	.LC633
	.align	3
.LC636:
	.xword	.LC635
	.align	3
.LC638:
	.xword	.LC637
	.align	3
.LC640:
	.xword	.LC639
	.align	3
.LC642:
	.xword	.LC641
	.align	3
.LC644:
	.xword	.LC643
	.align	3
.LC646:
	.xword	.LC645
	.align	3
.LC648:
	.xword	.LC647
	.align	3
.LC650:
	.xword	.LC649
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ProcessSUBSPSMvcVuiExt
	.type	MVC_ProcessSUBSPSMvcVuiExt, %function
MVC_ProcessSUBSPSMvcVuiExt:
	stp	x29, x30, [sp, -224]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	mov	x27, x1
	bl	_mcount
	add	x0, x27, 278528
	ldr	x1, .LC652
	mov	x20, x0
	mov	x0, x19
	str	x20, [x29, 120]
	bl	mvc_ue_v
	cmp	w0, 1023
	str	w0, [x20, 560]
	bhi	.L2499
	ldr	x2, [x29, 120]
	uxtw	x0, w0
	add	x0, x0, 1
	add	x1, x27, 294912
	str	x0, [x29, 128]
	add	x0, x2, 432
	ldr	x26, .LC664
	add	x25, x1, 1368
	str	x0, [x29, 184]
	add	x0, x2, 820
	str	x27, [x29, 152]
	stp	x27, x27, [x29, 168]
	str	xzr, [x29, 192]
	str	x0, [x29, 160]
	.p2align 2
.L2485:
	ldr	x3, [x29, 168]
	mov	w1, 3
	ldr	x2, .LC656
	mov	x0, x19
	add	x3, x3, 278528
	mov	x20, x3
	ldr	w3, [x29, 192]
	str	w3, [x29, 148]
	str	x20, [x29, 200]
	bl	mvc_u_v
	strb	w0, [x20, 112]
	ldr	x1, .LC658
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w0, 1023
	ldr	x1, [x29, 176]
	add	x1, x1, 278528
	str	w0, [x1, 564]
	bhi	.L2500
	cmn	w0, #1
	beq	.L2473
	uxtw	x20, w0
	ldr	x0, [x29, 192]
	ldr	x21, [x29, 160]
	add	x20, x20, x0, lsl 6
	add	x20, x20, 69632
	add	x20, x20, 206
	add	x20, x27, x20, lsl 2
	.p2align 2
.L2472:
	mov	x1, x26
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x21], 4
	cmp	x20, x21
	bne	.L2472
.L2473:
	ldr	x1, .LC662
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	ldr	x1, [x29, 200]
	strb	w0, [x1, 368]
	cbnz	w0, .L2501
.L2471:
	ldr	x1, .LC672
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	ldr	x1, [x29, 184]
	strb	w0, [x1]
	cbz	w0, .L2474
	ldr	x2, [x29, 152]
	mov	x0, x19
	ldr	x1, .LC674
	add	x2, x2, 294912
	str	x2, [x29, 136]
	mov	x20, x2
	bl	mvc_ue_v
	str	w0, [x25]
	ldr	x2, .LC676
	mov	w1, 4
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 1364]
	ldr	x2, .LC678
	mov	w1, 4
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 1365]
	ldr	w0, [x25]
	cmp	w0, 31
	bhi	.L2475
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2475
	ldr	x0, [x29, 192]
	mov	w28, 0
	ldr	w23, [x29, 148]
	and	x24, x0, 4294967295
	ldr	x22, .LC681
	lsl	x1, x24, 3
	lsl	x0, x23, 3
	sub	x1, x1, x24
	sub	x0, x0, x23
	lsl	x1, x1, 1
	lsl	x0, x0, 1
	sub	x1, x1, x24
	sub	x0, x0, x23
	lsl	x24, x1, 2
	lsl	x23, x0, 2
	sub	x24, x24, x1
	sub	x0, x23, x0
	lsl	x1, x24, 1
	str	x1, [x29, 216]
	ldr	x1, [x29, 120]
	mov	w24, w28
	ldr	x21, .LC683
	mov	x28, x25
	add	x23, x1, 112
	ldr	x20, .LC685
	add	x0, x23, x0, lsl 3
	str	x0, [x29, 208]
	.p2align 2
.L2477:
	mov	x1, x22
	mov	x0, x19
	uxtw	x23, w24
	add	w24, w24, 1
	bl	mvc_ue_v
	ldr	x1, [x29, 216]
	add	x1, x1, x23
	add	x1, x27, x1, lsl 2
	add	x25, x1, 294912
	mov	x1, x21
	str	w0, [x25, 1372]
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x25, 1500]
	mov	x1, x20
	mov	x0, x19
	bl	mvc_u_1
	ldr	x1, [x29, 208]
	add	x23, x1, x23
	add	x23, x23, 16384
	strb	w0, [x23, 1220]
	ldr	w0, [x28]
	cmp	w0, w24
	bcs	.L2477
	ldr	x2, .LC687
	mov	w1, 5
	mov	x0, x19
	mov	x25, x28
	bl	mvc_u_v
	ldr	x20, [x29, 136]
	ldr	x2, .LC689
	mov	w1, 5
	str	w0, [x20, 1628]
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 1632]
	ldr	x2, .LC691
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 1636]
	ldr	x2, .LC693
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 1640]
.L2474:
	ldr	x20, [x29, 200]
	mov	x0, x19
	ldr	x1, .LC695
	add	x2, x20, 496
	str	x2, [x29, 136]
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 496]
	cbnz	w0, .L2502
	ldr	x0, [x29, 184]
	ldrb	w0, [x0]
	cbz	w0, .L2483
.L2484:
	ldr	x1, .LC697
	mov	x0, x19
	bl	mvc_u_1
	ldr	x1, [x29, 200]
	strb	w0, [x1, 176]
.L2483:
	ldr	x2, [x29, 192]
	mov	x0, x19
	ldr	x1, .LC699
	add	x25, x25, 312
	add	x2, x2, 1
	mov	x20, x2
	ldr	x2, [x29, 168]
	str	x20, [x29, 192]
	add	x2, x2, 1
	str	x2, [x29, 168]
	ldr	x2, [x29, 176]
	add	x2, x2, 4
	str	x2, [x29, 176]
	ldr	x2, [x29, 152]
	add	x2, x2, 312
	str	x2, [x29, 152]
	bl	mvc_u_1
	ldr	w1, [x29, 148]
	add	w1, w1, 1
	cmp	w1, 63
	ldr	x1, [x29, 200]
	strb	w0, [x1, 304]
	ldr	x0, [x29, 128]
	ccmp	x0, x20, 0, ls
	ldr	x0, [x29, 184]
	add	x0, x0, 1
	str	x0, [x29, 184]
	ldr	x0, [x29, 160]
	add	x0, x0, 256
	str	x0, [x29, 160]
	bhi	.L2485
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, 0
	ldp	x29, x30, [sp], 224
	ret
	.p2align 3
.L2501:
	ldr	x0, [x29, 176]
	mov	w1, 32
	ldr	x2, .LC666
	add	x20, x0, 294912
	mov	x0, x19
	bl	mvc_u_v
	ldr	x2, .LC668
	mov	w1, 32
	str	w0, [x20, 820]
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 1076]
	ldr	x1, .LC670
	mov	x0, x19
	bl	mvc_u_1
	ldr	x1, [x29, 200]
	strb	w0, [x1, 240]
	b	.L2471
	.p2align 3
.L2502:
	ldr	x1, .LC674
	mov	x0, x19
	bl	mvc_ue_v
	ldr	x1, [x29, 152]
	ldr	x2, .LC676
	add	x1, x1, 315392
	mov	x20, x1
	str	x20, [x29, 112]
	str	w0, [x1, 856]
	mov	w1, 4
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 852]
	ldr	x2, .LC678
	mov	w1, 4
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 853]
	ldr	w0, [x20, 856]
	add	x5, x20, 856
	cmp	w0, 31
	bhi	.L2479
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2479
	ldr	x0, [x29, 192]
	ldr	w23, [x29, 148]
	and	x24, x0, 4294967295
	ldr	x22, .LC681
	lsl	x1, x24, 3
	lsl	x0, x23, 3
	sub	x1, x1, x24
	sub	x0, x0, x23
	lsl	x1, x1, 1
	lsl	x0, x0, 1
	sub	x1, x1, x24
	sub	x0, x0, x23
	lsl	x24, x1, 2
	lsl	x23, x0, 2
	sub	x24, x24, x1
	sub	x0, x23, x0
	lsl	x1, x24, 1
	str	x1, [x29, 216]
	ldr	x1, [x29, 120]
	ldr	x21, .LC683
	add	x23, x1, 112
	ldr	x20, .LC685
	add	x0, x23, x0, lsl 3
	mov	w23, 0
	str	x25, [x29, 104]
	mov	w25, w23
	str	x0, [x29, 208]
	mov	x23, x5
	.p2align 2
.L2481:
	mov	x1, x22
	mov	x0, x19
	uxtw	x24, w25
	add	w25, w25, 1
	bl	mvc_ue_v
	ldr	x1, [x29, 216]
	add	x2, x1, x24
	mov	x1, x21
	add	x2, x27, x2, lsl 2
	add	x28, x2, 315392
	str	w0, [x28, 860]
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x28, 988]
	mov	x1, x20
	mov	x0, x19
	bl	mvc_u_1
	ldr	x1, [x29, 208]
	add	x24, x1, x24
	add	x24, x24, 36864
	strb	w0, [x24, 708]
	ldr	w0, [x23]
	cmp	w0, w25
	bcs	.L2481
	ldr	x2, .LC687
	mov	w1, 5
	mov	x0, x19
	ldr	x25, [x29, 104]
	bl	mvc_u_v
	ldr	x20, [x29, 112]
	ldr	x2, .LC689
	mov	w1, 5
	str	w0, [x20, 1116]
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 1120]
	ldr	x2, .LC691
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 1124]
	ldr	x2, .LC693
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 1128]
	ldr	x0, [x29, 184]
	ldrb	w0, [x0]
	cbnz	w0, .L2484
	ldr	x0, [x29, 136]
	ldrb	w0, [x0]
	cbnz	w0, .L2484
	b	.L2483
	.p2align 3
.L2475:
	ldr	x2, .LC679
	mov	w1, 9366
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
.L2495:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 224
	ret
.L2500:
	ldr	x2, .LC660
	mov	w3, w0
	mov	w1, 9333
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 224
	ret
.L2479:
	ldr	x2, .LC679
	mov	w1, 9396
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 224
	ret
.L2499:
	ldr	x2, .LC654
	mov	w3, w0
	mov	w1, 9320
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2495
	.size	MVC_ProcessSUBSPSMvcVuiExt, .-MVC_ProcessSUBSPSMvcVuiExt
	.align	3
.LC652:
	.xword	.LC651
	.align	3
.LC654:
	.xword	.LC653
	.align	3
.LC656:
	.xword	.LC655
	.align	3
.LC658:
	.xword	.LC657
	.align	3
.LC660:
	.xword	.LC659
	.align	3
.LC662:
	.xword	.LC661
	.align	3
.LC664:
	.xword	.LC663
	.align	3
.LC666:
	.xword	.LC665
	.align	3
.LC668:
	.xword	.LC667
	.align	3
.LC670:
	.xword	.LC669
	.align	3
.LC672:
	.xword	.LC671
	.align	3
.LC674:
	.xword	.LC673
	.align	3
.LC676:
	.xword	.LC675
	.align	3
.LC678:
	.xword	.LC677
	.align	3
.LC679:
	.xword	.LC428
	.align	3
.LC681:
	.xword	.LC680
	.align	3
.LC683:
	.xword	.LC682
	.align	3
.LC685:
	.xword	.LC684
	.align	3
.LC687:
	.xword	.LC686
	.align	3
.LC689:
	.xword	.LC688
	.align	3
.LC691:
	.xword	.LC690
	.align	3
.LC693:
	.xword	.LC692
	.align	3
.LC695:
	.xword	.LC694
	.align	3
.LC697:
	.xword	.LC696
	.align	3
.LC699:
	.xword	.LC698
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecSubSPS
	.type	MVC_DecSubSPS, %function
MVC_DecSubSPS:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC701
	mov	w1, 8
	mov	x0, x19
	bl	mvc_u_v
	mov	w20, w0
	ldr	x1, .LC703
	mov	x0, x19
	bl	mvc_u_1
	mov	w27, w0
	ldr	x1, .LC705
	mov	x0, x19
	bl	mvc_u_1
	mov	w26, w0
	ldr	x1, .LC707
	mov	x0, x19
	bl	mvc_u_1
	mov	w25, w0
	ldr	x1, .LC709
	mov	x0, x19
	bl	mvc_u_1
	str	w0, [x29, 120]
	ldr	x1, .LC711
	mov	x0, x19
	bl	mvc_u_1
	str	w0, [x29, 116]
	ldr	x1, .LC713
	mov	x0, x19
	bl	mvc_u_1
	mov	w22, w0
	ldr	x2, .LC715
	mov	w1, 2
	mov	x0, x19
	bl	mvc_u_v
	ldr	x2, .LC717
	mov	w1, 8
	mov	x0, x19
	bl	mvc_u_v
	mov	w21, w0
	ldr	x1, .LC719
	mov	x0, x19
	bl	mvc_ue_v
	mov	w4, w0
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2516
	cmp	w4, 31
	bhi	.L2526
	sub	w0, w20, #66
	cmp	w0, 78
	bls	.L2527
.L2506:
	ldr	x2, .LC726
	mov	w3, w20
	mov	w1, 9491
	mov	w0, 1
	mov	w21, -1
	bl	dprint_normal
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2527:
	ldr	x1, .LC721
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx2508
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx2508:
	.section	.rodata
	.align	0
	.align	2
.L2508:
	.byte	(.L2507 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2509 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2510 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2509 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2511 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2509 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2511 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2509 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2506 - .Lrtx2508) / 4
	.byte	(.L2511 - .Lrtx2508) / 4
	.text
	.p2align 3
.L2507:
	ldr	x2, .LC722
	mov	w1, 9465
	mov	w0, 1
	str	w4, [x29, 104]
	bl	dprint_normal
	ldr	w4, [x29, 104]
.L2509:
	cmp	w21, 41
	bhi	.L2528
.L2512:
	uxtw	x23, w4
	mov	x0, x19
	lsl	x1, x23, 3
	sub	x1, x1, x23
	lsl	x1, x1, 2
	sub	x1, x1, x23
	lsl	x1, x1, 4
	sub	x1, x1, x23
	lsl	x2, x1, 2
	sub	x1, x2, x1
	lsl	x2, x1, 6
	add	x2, x1, x2
	lsl	x24, x2, 2
	ldrb	w2, [x29, 120]
	add	x5, x19, x24
	add	x1, x24, 286720
	add	x28, x5, 286720
	add	x1, x19, x1
	add	x1, x1, 2612
	str	x5, [x29, 104]
	strb	w2, [x28, 2615]
	ldrb	w2, [x29, 116]
	str	w21, [x28, 3352]
	strb	w27, [x28, 2612]
	strb	w26, [x28, 2613]
	strb	w25, [x28, 2614]
	strb	w2, [x28, 2616]
	strb	w22, [x28, 2617]
	str	w20, [x28, 3348]
	str	w4, [x28, 3356]
	bl	MVC_ProcessSPS
	mov	w21, w0
	ldr	x5, [x29, 104]
	cbnz	w0, .L2529
	mov	w1, 128
	cmp	w20, 118
	mov	w0, 1
	ccmp	w20, w1, 4, ne
	strb	w0, [x28, 2637]
	beq	.L2530
.L2514:
	lsl	x0, x23, 3
	mov	w2, 1
	sub	x0, x0, x23
	lsl	x0, x0, 2
	sub	x0, x0, x23
	lsl	x0, x0, 4
	sub	x0, x0, x23
	lsl	x1, x0, 2
	sub	x0, x1, x0
	lsl	x1, x0, 6
	add	x0, x0, x1
	add	x19, x19, x0, lsl 2
	add	x19, x19, 12288
	strb	w2, [x19, 2396]
.L2504:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2528:
	ldr	x2, .LC728
	mov	w3, w21
	mov	w1, 9498
	mov	w0, 1
	str	w4, [x29, 104]
	mov	w21, 41
	bl	dprint_normal
	ldr	w4, [x29, 104]
	b	.L2512
	.p2align 3
.L2530:
	ldr	x1, .LC732
	add	x22, x5, 12288
	mov	x0, x19
	add	x20, x24, 12288
	add	x20, x19, x20
	bl	mvc_u_1
	add	x20, x20, 2396
	strb	w0, [x22, 2397]
	mov	x1, x20
	mov	x0, x19
	bl	MVC_ProcessSUBSPSMvcExt
	cbnz	w0, .L2531
	ldr	x1, .LC736
	mov	x0, x19
	bl	mvc_u_1
	str	w0, [x28, 2608]
	cbz	w0, .L2514
	mov	x1, x20
	mov	x0, x19
	bl	MVC_ProcessSUBSPSMvcVuiExt
	cbz	w0, .L2514
	ldr	x2, .LC738
	mov	w1, 9549
	mov	w0, 1
	mov	w21, -1
	bl	dprint_normal
	strb	wzr, [x22, 2396]
	b	.L2504
	.p2align 3
.L2511:
	ldr	x2, .LC724
	mov	w1, 9487
	mov	w0, 1
	str	w4, [x29, 104]
	bl	dprint_normal
	ldr	w4, [x29, 104]
	b	.L2509
	.p2align 3
.L2510:
	ldr	x2, .LC723
	mov	w1, 9469
	mov	w0, 1
	str	w4, [x29, 104]
	bl	dprint_normal
	ldr	w4, [x29, 104]
	b	.L2509
	.p2align 3
.L2516:
	mov	w21, -1
	b	.L2504
	.p2align 3
.L2526:
	ldr	x2, .LC720
	mov	w1, 9457
	mov	w0, 1
	mov	w21, -1
	bl	dprint_normal
	b	.L2504
	.p2align 3
.L2529:
	ldr	x2, .LC730
	mov	w1, 9524
	mov	w0, 1
	str	x5, [x29, 120]
	mov	w21, -1
	bl	dprint_normal
	ldr	x5, [x29, 120]
	add	x5, x5, 12288
	strb	wzr, [x5, 2396]
	strb	wzr, [x28, 2637]
	b	.L2504
.L2531:
	ldr	x2, .LC734
	mov	w1, 9538
	mov	w0, 1
	mov	w21, -1
	bl	dprint_normal
	strb	wzr, [x22, 2396]
	b	.L2504
	.size	MVC_DecSubSPS, .-MVC_DecSubSPS
	.align	3
.LC701:
	.xword	.LC700
	.align	3
.LC703:
	.xword	.LC702
	.align	3
.LC705:
	.xword	.LC704
	.align	3
.LC707:
	.xword	.LC706
	.align	3
.LC709:
	.xword	.LC708
	.align	3
.LC711:
	.xword	.LC710
	.align	3
.LC713:
	.xword	.LC712
	.align	3
.LC715:
	.xword	.LC714
	.align	3
.LC717:
	.xword	.LC716
	.align	3
.LC719:
	.xword	.LC718
	.align	3
.LC720:
	.xword	.LC374
	.align	3
.LC721:
	.xword	.L2508
	.align	3
.LC722:
	.xword	.LC582
	.align	3
.LC723:
	.xword	.LC584
	.align	3
.LC724:
	.xword	.LC586
	.align	3
.LC726:
	.xword	.LC725
	.align	3
.LC728:
	.xword	.LC727
	.align	3
.LC730:
	.xword	.LC729
	.align	3
.LC732:
	.xword	.LC731
	.align	3
.LC734:
	.xword	.LC733
	.align	3
.LC736:
	.xword	.LC735
	.align	3
.LC738:
	.xword	.LC737
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_PassBytes
	.type	MVC_PassBytes, %function
MVC_PassBytes:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x0, [x20, 240]
	cmp	w19, wzr
	ccmp	x0, xzr, 4, ne
	beq	.L2541
	ldrb	w2, [x0]
	sbfiz	x1, x2, 5, 32
	add	x1, x0, x1
	ldr	x1, [x1, 8]
	cbz	x1, .L2541
	ldr	w1, [x0, 76]
	cmp	w2, 1
	ccmp	w1, 2, 2, ls
	bhi	.L2541
	cmp	w1, w2
	bls	.L2541
	uxtw	x5, w2
	add	x3, x0, x5, lsl 5
	ldr	w1, [x3, 28]
	ldr	w3, [x3, 16]
	add	w1, w1, w19, lsl 3
	lsl	w3, w3, 3
	cmp	w1, w3
	bhi	.L2536
	b	.L2534
	.p2align 3
.L2537:
	ldr	w4, [x6, 28]
	ldr	w6, [x6, 16]
	sub	w4, w4, w3
	add	w1, w1, w4
	lsl	w3, w6, 3
	cmp	w1, w3
	bls	.L2534
.L2536:
	add	x0, x0, x5, lsl 5
	add	w5, w2, 1
	mov	x2, x5
	str	w3, [x0, 28]
	ldr	x0, [x20, 240]
	ldrb	w4, [x0]
	add	w4, w4, 1
	strb	w4, [x0]
	ldr	x0, [x20, 240]
	add	x6, x0, x5, lsl 5
	ldr	w4, [x0, 76]
	cmp	w4, w5
	bhi	.L2537
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2534:
	add	x5, x0, x5, lsl 5
	mov	w0, 1
	str	w1, [x5, 28]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2541:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_PassBytes, .-MVC_PassBytes
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetBytes
	.type	MVC_GetBytes, %function
MVC_GetBytes:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x19, x1
	mov	x0, x30
	mov	w20, w2
	bl	_mcount
	cbz	x19, .L2557
	ldr	x1, [x21, 240]
	cmp	x1, xzr
	ccmp	w20, wzr, 4, ne
	beq	.L2557
	ldrb	w2, [x1]
	sbfiz	x0, x2, 5, 32
	add	x0, x1, x0
	ldr	x0, [x0, 8]
	cbz	x0, .L2557
	ldr	w0, [x1, 76]
	cmp	w2, 1
	ccmp	w0, 2, 2, ls
	bhi	.L2557
	cmp	w0, w2
	bls	.L2557
	mov	w6, 0
.L2552:
	ubfiz	x7, x2, 5, 32
	add	x3, x1, x7
	ldr	w0, [x3, 28]
	ldr	x4, [x3, 8]
	ldr	w8, [x3, 16]
	add	w0, w0, 7
	ubfx	x0, x0, 3, 29
	add	x8, x4, x8
	add	x5, x4, x0
	cmp	x5, x8
	bcs	.L2547
	ldrb	w0, [x4, x0]
	add	w6, w6, 1
	strb	w0, [x19]
	cmp	w20, w6
	add	x19, x19, 1
	add	x5, x5, 1
	ldr	x0, [x21, 240]
	add	x0, x0, x7
	ldr	w3, [x0, 28]
	add	w3, w3, 8
	str	w3, [x0, 28]
	bhi	.L2550
	b	.L2549
	.p2align 3
.L2551:
	ldrb	w1, [x5], 1
	add	w6, w6, 1
	strb	w1, [x19], 1
	cmp	w20, w6
	ldr	x3, [x21, 240]
	add	x3, x3, x7
	ldr	w4, [x3, 28]
	add	w4, w4, 8
	str	w4, [x3, 28]
	bls	.L2549
.L2550:
	cmp	x8, x5
	bne	.L2551
	ldr	x1, [x21, 240]
.L2547:
	ldrb	w0, [x1]
	add	w2, w2, 1
	add	w0, w0, 1
	strb	w0, [x1]
	ldr	x1, [x21, 240]
	ldr	w0, [x1, 76]
	cmp	w0, w2
	bhi	.L2552
	mov	w0, w6
	b	.L2546
	.p2align 3
.L2549:
	mov	w0, w20
.L2546:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2557:
	mov	w0, -1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	MVC_GetBytes, .-MVC_GetBytes
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecFramePackingSEI
	.type	MVC_DecFramePackingSEI, %function
MVC_DecFramePackingSEI:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 11124736
	bl	_mcount
	ldr	x1, .LC740
	mov	x0, x20
	bl	mvc_ue_v
	str	w0, [x19]
	ldr	x2, .LC742
	mov	w1, 1
	mov	x0, x20
	bl	mvc_u_v
	sxtb	w0, w0
	strb	w0, [x19, -23]
	cbz	w0, .L2565
.L2560:
	ldr	x2, .LC774
	mov	w1, 1
	mov	x0, x20
	bl	mvc_u_v
	strb	w0, [x19, -22]
	mov	w1, 1
	strb	w1, [x19, -24]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2565:
	ldr	x2, .LC744
	mov	w1, 7
	mov	x0, x20
	bl	mvc_u_v
	str	w0, [x19, -8]
	ldr	x2, .LC746
	mov	w1, 1
	mov	x0, x20
	bl	mvc_u_v
	strb	w0, [x19, -21]
	ldr	x2, .LC748
	mov	w1, 6
	mov	x0, x20
	bl	mvc_u_v
	str	w0, [x19, -4]
	ldr	x2, .LC750
	mov	w1, 1
	mov	x0, x20
	bl	mvc_u_v
	strb	w0, [x19, -20]
	ldr	x2, .LC752
	mov	w1, 1
	mov	x0, x20
	bl	mvc_u_v
	strb	w0, [x19, -19]
	ldr	x2, .LC754
	mov	w1, 1
	mov	x0, x20
	bl	mvc_u_v
	strb	w0, [x19, -18]
	ldr	x2, .LC756
	mov	w1, 1
	mov	x0, x20
	bl	mvc_u_v
	strb	w0, [x19, -17]
	ldr	x2, .LC758
	mov	w1, 1
	mov	x0, x20
	bl	mvc_u_v
	strb	w0, [x19, -16]
	ldr	x2, .LC760
	mov	w1, 1
	mov	x0, x20
	bl	mvc_u_v
	strb	w0, [x19, -15]
	ldrsb	w1, [x19, -21]
	cbnz	w1, .L2561
	ldr	w0, [x19, -8]
	cmp	w0, 5
	beq	.L2561
	ldr	x2, .LC762
	mov	w1, 1
	mov	x0, x20
	bl	mvc_u_v
	strb	w0, [x19, -14]
	ldr	x2, .LC764
	mov	w1, 1
	mov	x0, x20
	bl	mvc_u_v
	strb	w0, [x19, -13]
	ldr	x2, .LC766
	mov	w1, 1
	mov	x0, x20
	bl	mvc_u_v
	strb	w0, [x19, -12]
	ldr	x2, .LC768
	mov	w1, 1
	mov	x0, x20
	bl	mvc_u_v
	strb	w0, [x19, -11]
.L2561:
	ldr	x2, .LC770
	mov	w1, 8
	mov	x0, x20
	bl	mvc_u_v
	str	w0, [x19, 4]
	ldr	x1, .LC772
	mov	x0, x20
	bl	mvc_ue_v
	str	w0, [x19, 8]
	b	.L2560
	.size	MVC_DecFramePackingSEI, .-MVC_DecFramePackingSEI
	.align	3
.LC740:
	.xword	.LC739
	.align	3
.LC742:
	.xword	.LC741
	.align	3
.LC744:
	.xword	.LC743
	.align	3
.LC746:
	.xword	.LC745
	.align	3
.LC748:
	.xword	.LC747
	.align	3
.LC750:
	.xword	.LC749
	.align	3
.LC752:
	.xword	.LC751
	.align	3
.LC754:
	.xword	.LC753
	.align	3
.LC756:
	.xword	.LC755
	.align	3
.LC758:
	.xword	.LC757
	.align	3
.LC760:
	.xword	.LC759
	.align	3
.LC762:
	.xword	.LC761
	.align	3
.LC764:
	.xword	.LC763
	.align	3
.LC766:
	.xword	.LC765
	.align	3
.LC768:
	.xword	.LC767
	.align	3
.LC770:
	.xword	.LC769
	.align	3
.LC772:
	.xword	.LC771
	.align	3
.LC774:
	.xword	.LC773
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecPicTimingSEI
	.type	MVC_DecPicTimingSEI, %function
MVC_DecPicTimingSEI:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 3992
	bl	_mcount
	add	x0, x20, 11108352
	ldr	x3, [x20, 272]
	ldr	w0, [x0, 4024]
	umull	x19, w0, w19
	add	x19, x3, x19
	ldrb	w0, [x19, 25]
	cbnz	w0, .L2567
	ldr	w0, [x20, 36]
	cmp	w0, wzr
	ble	.L2568
	ldrb	w1, [x3, 25]
	cbnz	w1, .L2586
	sub	w1, w0, #1
	add	x0, x3, 3992
	add	x1, x1, 1
	lsl	x2, x1, 6
	sub	x2, x2, x1
	lsl	x2, x2, 1
	sub	x2, x2, x1
	lsl	x2, x2, 2
	sub	x1, x2, x1
	add	x1, x3, x1, lsl 3
	b	.L2571
	.p2align 3
.L2572:
	ldrb	w2, [x2]
	cbnz	w2, .L2569
.L2571:
	cmp	x0, x1
	mov	x19, x0
	add	x0, x0, 3992
	sub	x2, x0, #3967
	bne	.L2572
.L2568:
	ldr	x2, .LC776
	mov	w1, 9725
	mov	w0, 1
	mov	w19, -1
	bl	dprint_normal
.L2573:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L2586:
	mov	x19, x3
	.p2align 2
.L2569:
	cbz	x19, .L2568
.L2567:
	ldrb	w0, [x19, 24]
	cbz	w0, .L2574
	ldrb	w0, [x19, 35]
	cbz	w0, .L2587
	ldr	w1, [x19, 388]
	ldr	w22, [x19, 392]
	add	w1, w1, 1
	add	w22, w22, 1
.L2577:
	ldr	x2, .LC778
	mov	x0, x20
	add	x21, x20, 11124736
	bl	mvc_u_v
	ldr	x2, .LC780
	mov	w1, w22
	str	w0, [x21, 16]
	mov	x0, x20
	bl	mvc_u_v
	str	w0, [x21, 20]
.L2574:
	ldrb	w0, [x19, 39]
	mov	w19, 0
	cbz	w0, .L2573
	ldr	x2, .LC782
	mov	x0, x20
	add	x20, x20, 11124736
	mov	w1, 4
	bl	mvc_u_v
	strb	w0, [x20, 12]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2587:
	ldrb	w0, [x19, 38]
	cbz	w0, .L2574
	ldr	w1, [x19, 700]
	ldr	w22, [x19, 704]
	add	w1, w1, 1
	add	w22, w22, 1
	b	.L2577
	.size	MVC_DecPicTimingSEI, .-MVC_DecPicTimingSEI
	.align	3
.LC776:
	.xword	.LC775
	.align	3
.LC778:
	.xword	.LC777
	.align	3
.LC780:
	.xword	.LC779
	.align	3
.LC782:
	.xword	.LC781
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecSEI
	.type	MVC_DecSEI, %function
MVC_DecSEI:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x26, x0
	mov	x0, x30
	add	x21, x29, 128
	mov	w23, 0
	bl	_mcount
	add	x20, x26, 872
	ldr	x0, [x26, 240]
	mov	w1, 32
	strb	wzr, [x21, -1]!
	str	w1, [x0, 28]
	b	.L2591
	.p2align 3
.L2758:
	mov	w1, 8
	mov	x0, x20
	bl	BsSkip
	cmp	w19, wzr
	ble	.L2590
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2757
.L2591:
	mov	w2, 1
	mov	x1, x21
	mov	x0, x26
	bl	MVC_GetBytes
	mov	w19, w0
	ldr	w2, [x26, 896]
	ldr	w0, [x26, 904]
	ldrb	w1, [x29, 127]
	add	w0, w0, 8
	cmp	w0, w2, lsl 3
	add	w23, w23, w1
	bls	.L2758
.L2590:
	ldr	x2, .LC784
	mov	w1, 9799
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2593
	.p2align 3
.L2757:
	ldr	x24, .LC790
	mov	w25, 0
	ldr	x22, .LC787
	add	x24, x24, 264
	.p2align 2
.L2728:
	mov	w19, 0
	b	.L2597
	.p2align 3
.L2760:
	mov	w1, 8
	mov	x0, x20
	bl	BsSkip
	cmp	w28, wzr
	ble	.L2595
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2759
.L2597:
	mov	w2, 1
	mov	x1, x21
	mov	x0, x26
	bl	MVC_GetBytes
	mov	w28, w0
	ldr	w2, [x26, 896]
	ldr	w0, [x26, 904]
	ldrb	w1, [x29, 127]
	add	w0, w0, 8
	cmp	w0, w2, lsl 3
	add	w19, w19, w1
	bls	.L2760
.L2595:
	ldr	x2, .LC786
	mov	w1, 9827
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
.L2593:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2759:
	cmp	w19, 409600
	bgt	.L2595
	ldr	x0, [x26, 240]
	ldr	w1, [x0, 76]
	ldr	w3, [x0, 28]
	cmp	w1, 2
	beq	.L2761
.L2599:
	cmp	w23, 45
	bls	.L2762
.L2600:
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2763
.L2720:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2721
	.p2align 3
.L2722:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2721:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2722
	.p2align 2
.L2625:
	ldr	w0, [x26, 60]
	cmp	w0, 3
	bhi	.L2764
.L2723:
	mov	w23, 0
	b	.L2727
	.p2align 3
.L2725:
	mov	w1, 8
	mov	x0, x20
	bl	BsSkip
	cmp	w19, wzr
	ble	.L2726
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2765
.L2727:
	mov	w2, 1
	mov	x1, x21
	mov	x0, x26
	bl	MVC_GetBytes
	mov	w19, w0
	ldr	w2, [x26, 896]
	ldr	w0, [x26, 904]
	ldrb	w1, [x29, 127]
	add	w0, w0, 8
	cmp	w0, w2, lsl 3
	add	w23, w23, w1
	bls	.L2725
.L2726:
	mov	w0, 0
.L2766:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2765:
	cmp	w0, 128
	bne	.L2728
	mov	w0, 0
	b	.L2766
	.p2align 3
.L2762:
	ldrh	w0, [x22,w23,uxtw #1]
	adr	x1, .Lrtx2602
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx2602:
	.section	.rodata
	.align	0
	.align	2
.L2602:
	.2byte	(.L2601 - .Lrtx2602) / 4
	.2byte	(.L2603 - .Lrtx2602) / 4
	.2byte	(.L2604 - .Lrtx2602) / 4
	.2byte	(.L2605 - .Lrtx2602) / 4
	.2byte	(.L2606 - .Lrtx2602) / 4
	.2byte	(.L2606 - .Lrtx2602) / 4
	.2byte	(.L2607 - .Lrtx2602) / 4
	.2byte	(.L2608 - .Lrtx2602) / 4
	.2byte	(.L2609 - .Lrtx2602) / 4
	.2byte	(.L2610 - .Lrtx2602) / 4
	.2byte	(.L2611 - .Lrtx2602) / 4
	.2byte	(.L2612 - .Lrtx2602) / 4
	.2byte	(.L2613 - .Lrtx2602) / 4
	.2byte	(.L2614 - .Lrtx2602) / 4
	.2byte	(.L2615 - .Lrtx2602) / 4
	.2byte	(.L2616 - .Lrtx2602) / 4
	.2byte	(.L2617 - .Lrtx2602) / 4
	.2byte	(.L2618 - .Lrtx2602) / 4
	.2byte	(.L2619 - .Lrtx2602) / 4
	.2byte	(.L2620 - .Lrtx2602) / 4
	.2byte	(.L2621 - .Lrtx2602) / 4
	.2byte	(.L2622 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2600 - .Lrtx2602) / 4
	.2byte	(.L2623 - .Lrtx2602) / 4
	.text
.L2623:
	mov	w1, w19
	mov	x0, x26
	ldr	w28, [x26, 904]
	bl	MVC_DecFramePackingSEI
	ldr	w3, [x26, 904]
	sub	w0, w3, w28
	lsl	w28, w19, 3
	cmp	w0, w28
	bge	.L2714
	sub	w28, w28, w0
	ldr	w0, [x26, 896]
	cmp	w28, wzr
	add	w23, w28, 7
	csel	w23, w23, w28, lt
	lsl	w0, w0, 3
	asr	w23, w23, 3
	cmp	w23, wzr
	ble	.L2716
	add	w1, w3, 8
	cmp	w1, w0
	bhi	.L2716
	mov	w27, 0
	b	.L2717
	.p2align 3
.L2718:
	ldr	w0, [x26, 896]
	ldr	w3, [x26, 904]
	lsl	w0, w0, 3
	add	w1, w3, 8
	cmp	w1, w0
	bhi	.L2716
.L2717:
	mov	w1, 8
	mov	x0, x20
	add	w27, w27, 1
	bl	BsSkip
	cmp	w27, w23
	bne	.L2718
	ldr	w0, [x26, 896]
	ldr	w3, [x26, 904]
	lsl	w0, w0, 3
.L2716:
	asr	w1, w28, 31
	lsr	w2, w1, 29
	add	w1, w28, w2
	and	w1, w1, 7
	sub	w1, w1, w2
	add	w3, w1, w3
	cmp	w0, w3
	bcs	.L2767
.L2714:
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbz	w0, #31, .L2625
	mov	w4, 10552
	ldr	x2, .LC792
	ldr	x3, .LC846
	mov	w1, w4
	mov	w0, 18
	bl	dprint_normal
	b	.L2625
.L2622:
	ldr	x2, .LC843
	mov	w1, 10494
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2768
.L2710:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2711
	.p2align 3
.L2712:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2711:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2712
	ldr	w0, [x26, 60]
	cmp	w0, 3
	bls	.L2723
.L2764:
	ldr	x2, .LC845
	mov	w1, 10586
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2593
.L2621:
	ldr	x2, .LC841
	mov	w1, 10468
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2769
.L2707:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2708
	.p2align 3
.L2709:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2708:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2709
	b	.L2625
.L2620:
	ldr	x2, .LC839
	mov	w1, 10442
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2770
.L2704:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2705
	.p2align 3
.L2706:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2705:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2706
	b	.L2625
.L2619:
	ldr	x2, .LC837
	mov	w1, 10416
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2771
.L2701:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2702
	.p2align 3
.L2703:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2702:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2703
	b	.L2625
.L2618:
	ldr	x2, .LC835
	mov	w1, 10390
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2772
.L2698:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2699
	.p2align 3
.L2700:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2699:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2700
	b	.L2625
.L2617:
	ldr	x2, .LC833
	mov	w1, 10364
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2773
.L2695:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2696
	.p2align 3
.L2697:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2696:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2697
	b	.L2625
.L2616:
	ldr	x2, .LC831
	mov	w1, 10338
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2774
.L2692:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2693
	.p2align 3
.L2694:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2693:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2694
	b	.L2625
.L2615:
	ldr	x2, .LC829
	mov	w1, 10312
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2775
.L2689:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2690
	.p2align 3
.L2691:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2690:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2691
	b	.L2625
.L2614:
	ldr	x2, .LC827
	mov	w1, 10286
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2776
.L2686:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2687
	.p2align 3
.L2688:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2687:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2688
	b	.L2625
.L2613:
	ldr	x2, .LC825
	mov	w1, 10260
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2777
.L2683:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2684
	.p2align 3
.L2685:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2684:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2685
	b	.L2625
.L2612:
	ldr	x2, .LC823
	mov	w1, 10234
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2778
.L2680:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2681
	.p2align 3
.L2682:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2681:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2682
	b	.L2625
.L2611:
	ldr	x2, .LC821
	mov	w1, 10208
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2779
.L2677:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2678
	.p2align 3
.L2679:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2678:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2679
	b	.L2625
.L2610:
	ldr	x2, .LC819
	mov	w1, 10182
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2780
.L2674:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2675
	.p2align 3
.L2676:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2675:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2676
	b	.L2625
.L2609:
	ldr	x2, .LC817
	mov	w1, 10156
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2781
.L2671:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2672
	.p2align 3
.L2673:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2672:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2673
	b	.L2625
.L2608:
	ldr	x2, .LC815
	mov	w1, 10130
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2782
.L2668:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2669
	.p2align 3
.L2670:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2669:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2670
	b	.L2625
.L2607:
	ldr	x2, .LC813
	mov	w4, w19
	mov	w1, 10102
	mov	w0, 18
	bl	dprint_normal
	cmp	w19, wzr
	ble	.L2665
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2665
	mov	w23, 0
	b	.L2666
	.p2align 3
.L2667:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2665
.L2666:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2667
.L2665:
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbz	w0, #31, .L2625
	ldr	x3, .LC790
	mov	w4, 10124
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2625
.L2606:
	cmp	w23, 4
	beq	.L2641
	cbnz	w25, .L2641
	ldr	x2, .LC802
	mov	w4, w19
	mov	w1, 9974
	mov	w0, 18
	bl	dprint_normal
.L2643:
	ldr	w23, [x26, 60]
	ldr	w0, [x26, 120]
	add	x23, x26, x23, uxtw 3
	bl	GetUsd
	str	x0, [x23, 832]
	ldr	w0, [x26, 60]
	add	x0, x0, 104
	ldr	x1, [x26, x0, lsl 3]
	cbz	x1, .L2731
	ldr	x4, [x26, 240]
	cmp	w19, 1024
	mov	w7, 1024
	csel	w27, w19, w7, le
	ldrb	w3, [x4]
	ldr	w6, [x4, 76]
	cmp	w3, w6
	bcs	.L2732
	mov	w28, 0
	.p2align 2
.L2645:
	ubfiz	x2, x3, 5, 32
	add	w3, w3, 1
	add	x2, x4, x2
	cmp	w3, w6
	ldr	w0, [x2, 28]
	ldr	w2, [x2, 16]
	add	w0, w0, 7
	sub	w0, w2, w0, lsr 3
	add	w28, w28, w0
	bne	.L2645
	mov	w0, w28
.L2644:
	cmp	w27, w0
	csel	w28, w28, w27, gt
	cbnz	w25, .L2783
	mov	w23, 0
	mov	w3, 0
.L2647:
	sub	w2, w28, w23
	mov	x0, x26
	str	w3, [x29, 104]
	bl	MVC_GetBytes
	cmp	w0, wzr
	mov	w28, w0
	ldr	w3, [x29, 104]
	ble	.L2784
	sub	w0, w27, w3
	cmp	w28, w0
	bge	.L2652
	ldr	w0, [x26, 60]
	add	x0, x0, 104
	ldr	x0, [x26, x0, lsl 3]
	str	w28, [x0, 1052]
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2653
	mov	w19, 0
	b	.L2654
	.p2align 3
.L2657:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2653
.L2654:
	mov	w1, 8
	mov	x0, x20
	add	w19, w19, 1
	bl	BsSkip
	cmp	w28, w19
	bne	.L2657
.L2653:
	ldr	w0, [x26, 60]
	cmp	w25, 1
	ldr	x1, [x26, 224]
	mov	w2, 9
	add	x0, x0, 104
	ldr	x1, [x1, 32]
	ldr	x0, [x26, x0, lsl 3]
	str	x1, [x0, 1056]
	ldr	w0, [x26, 60]
	add	x0, x0, 104
	ldr	x1, [x26, x0, lsl 3]
	mov	w0, 8
	csel	w0, w0, w2, eq
	str	w0, [x1, 1040]
.L2755:
	ldr	w0, [x26, 60]
	ldr	x1, .LC809
	add	x0, x0, 104
	ldr	x4, [x1]
	ldr	x0, [x26, x0, lsl 3]
	ldr	w1, [x26, 84]
	str	w1, [x0, 1044]
	cbz	x4, .L2625
	ldr	w0, [x26, 60]
	mov	w3, 1064
	mov	w1, 5
	add	x0, x0, 104
	ldr	x2, [x26, x0, lsl 3]
	ldr	w0, [x26, 120]
	blr	x4
	b	.L2625
.L2605:
	ldr	x2, .LC798
	mov	w1, 9936
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2785
.L2638:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2639
	.p2align 3
.L2640:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2639:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2640
	b	.L2625
.L2604:
	ldr	x2, .LC796
	mov	w1, 9910
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2786
.L2635:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2636
	.p2align 3
.L2637:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2636:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2637
	b	.L2625
.L2603:
	ldr	x2, .LC794
	mov	w4, w19
	mov	w1, 9871
	mov	w0, 18
	bl	dprint_normal
	ldr	w28, [x26, 904]
	mov	w1, w19
	mov	x0, x26
	bl	MVC_DecPicTimingSEI
	ldr	w3, [x26, 904]
	sub	w0, w3, w28
	lsl	w28, w19, 3
	cmp	w0, w28
	bge	.L2629
	sub	w28, w28, w0
	ldr	w0, [x26, 896]
	cmp	w28, wzr
	add	w23, w28, 7
	csel	w23, w23, w28, lt
	lsl	w0, w0, 3
	asr	w23, w23, 3
	cmp	w23, wzr
	ble	.L2631
	add	w1, w3, 8
	cmp	w1, w0
	bhi	.L2631
	mov	w27, 0
	b	.L2632
	.p2align 3
.L2633:
	ldr	w0, [x26, 896]
	ldr	w3, [x26, 904]
	lsl	w0, w0, 3
	add	w1, w3, 8
	cmp	w1, w0
	bhi	.L2631
.L2632:
	mov	w1, 8
	mov	x0, x20
	add	w27, w27, 1
	bl	BsSkip
	cmp	w27, w23
	bne	.L2633
	ldr	w0, [x26, 896]
	ldr	w3, [x26, 904]
	lsl	w0, w0, 3
.L2631:
	asr	w1, w28, 31
	lsr	w2, w1, 29
	add	w1, w28, w2
	and	w1, w1, 7
	sub	w1, w1, w2
	add	w3, w1, w3
	cmp	w3, w0
	bls	.L2787
.L2629:
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbz	w0, #31, .L2625
	ldr	x3, .LC790
	mov	w4, 9904
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2625
.L2601:
	ldr	x2, .LC789
	mov	w1, 9845
	mov	w4, w19
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2788
.L2624:
	cmp	w19, wzr
	ble	.L2625
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
	mov	w23, 0
	b	.L2626
	.p2align 3
.L2627:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2625
.L2626:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2627
	b	.L2625
	.p2align 3
.L2761:
	ldr	w0, [x0, 60]
	add	w3, w3, w0
	lsr	w3, w3, 3
	b	.L2599
.L2652:
	ldr	w0, [x26, 60]
	sub	w23, w19, w3
	cmp	w27, w19
	add	x0, x0, 104
	ldr	x0, [x26, x0, lsl 3]
	str	w23, [x0, 1052]
	bcc	.L2789
.L2659:
	cmp	w23, wzr
	ble	.L2653
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2653
	mov	w19, 0
	b	.L2661
	.p2align 3
.L2662:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2653
.L2661:
	mov	w1, 8
	mov	x0, x20
	add	w19, w19, 1
	bl	BsSkip
	cmp	w23, w19
	bne	.L2662
	b	.L2653
.L2787:
	mov	x0, x20
	bl	BsSkip
	b	.L2629
.L2767:
	mov	x0, x20
	bl	BsSkip
	b	.L2714
.L2789:
	sub	w1, w19, w27
	mov	x0, x26
	bl	MVC_PassBytes
	tbz	w0, #31, .L2659
	ldr	x3, .LC790
	mov	w4, 10076
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2659
	.p2align 3
.L2641:
	ldr	x2, .LC800
	mov	w4, w19
	mov	w1, 9970
	mov	w0, 18
	mov	w25, 1
	bl	dprint_normal
	b	.L2643
.L2783:
	strb	w25, [x1, 1026]
	mov	x0, x26
	ldr	x2, .LC804
	mov	w1, 8
	ldr	w3, [x26, 60]
	add	x3, x3, 104
	ldr	x23, [x26, x3, lsl 3]
	bl	mvc_u_v
	strb	w0, [x23, 1027]
	ldr	w0, [x26, 60]
	add	x0, x0, 104
	ldr	x23, [x26, x0, lsl 3]
	ldrb	w0, [x23, 1027]
	cmp	w0, 255
	beq	.L2648
	strb	wzr, [x23, 1028]
	mov	w23, 3
	mov	w3, w23
.L2649:
	ldr	w0, [x26, 60]
	mov	w1, 16
	ldr	x2, .LC808
	add	x0, x0, 104
	str	w3, [x29, 100]
	ldr	x4, [x26, x0, lsl 3]
	mov	x0, x26
	str	x4, [x29, 104]
	bl	mvc_u_v
	ldr	x4, [x29, 104]
	mov	w1, w23
	strh	w0, [x4, 1030]
	mov	x0, x26
	bl	MVC_PassBytes
	ldr	w0, [x26, 60]
	cmp	w28, w23
	add	x0, x0, 104
	beq	.L2650
	ldr	x1, [x26, x0, lsl 3]
	ldr	w3, [x29, 100]
	b	.L2647
.L2782:
	ldr	x3, .LC790
	mov	w4, 10136
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2668
.L2786:
	ldr	x3, .LC790
	mov	w4, 9916
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2635
.L2785:
	ldr	x3, .LC790
	mov	w4, 9942
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2638
.L2788:
	ldr	x3, .LC790
	mov	w4, 9851
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2624
.L2763:
	mov	w4, 10564
	ldr	x2, .LC792
	mov	x3, x24
	mov	w1, w4
	mov	w0, 18
	bl	dprint_normal
	b	.L2720
.L2769:
	ldr	x3, .LC790
	mov	w4, 10474
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2707
.L2768:
	mov	w4, 10500
	ldr	x2, .LC792
	ldr	x3, .LC846
	mov	w1, w4
	mov	w0, 18
	bl	dprint_normal
	b	.L2710
.L2773:
	ldr	x3, .LC790
	mov	w4, 10370
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2695
.L2772:
	ldr	x3, .LC790
	mov	w4, 10396
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2698
.L2771:
	ldr	x3, .LC790
	mov	w4, 10422
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2701
.L2770:
	ldr	x3, .LC790
	mov	w4, 10448
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2704
.L2781:
	ldr	x3, .LC790
	mov	w4, 10162
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2671
.L2780:
	ldr	x3, .LC790
	mov	w4, 10188
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2674
.L2779:
	ldr	x3, .LC790
	mov	w4, 10214
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2677
.L2778:
	ldr	x3, .LC790
	mov	w4, 10240
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2680
.L2777:
	ldr	x3, .LC790
	mov	w4, 10266
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2683
.L2776:
	ldr	x3, .LC790
	mov	w4, 10292
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2686
.L2775:
	ldr	x3, .LC790
	mov	w4, 10318
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2689
.L2774:
	ldr	x3, .LC790
	mov	w4, 10344
	ldr	x2, .LC792
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 18
	bl	dprint_normal
	b	.L2692
.L2732:
	mov	w0, 0
	mov	w28, 0
	b	.L2644
.L2650:
	ldr	x1, [x26, 224]
	ldr	x0, [x26, x0, lsl 3]
	ldr	x1, [x1, 32]
	str	x1, [x0, 1056]
	mov	w1, 8
	ldr	w0, [x26, 60]
	add	x0, x0, 104
	ldr	x0, [x26, x0, lsl 3]
	str	w1, [x0, 1040]
	b	.L2755
.L2648:
	ldr	x2, .LC806
	mov	w1, 8
	mov	x0, x26
	bl	mvc_u_v
	strb	w0, [x23, 1028]
	mov	w23, 4
	mov	w3, w23
	b	.L2649
.L2784:
	ldr	x2, .LC811
	mov	w1, 10040
	mov	w0, 1
	bl	dprint_normal
	ldr	w1, [x26, 60]
	ldr	w0, [x26, 120]
	add	x1, x1, 104
	ldr	x1, [x26, x1, lsl 3]
	bl	FreeUsdByDec
	ldr	w1, [x26, 60]
	mov	w0, -1
	add	x1, x1, 104
	str	xzr, [x26, x1, lsl 3]
	b	.L2593
.L2731:
	mov	w0, -1
	b	.L2593
	.size	MVC_DecSEI, .-MVC_DecSEI
	.align	3
.LC784:
	.xword	.LC783
	.align	3
.LC786:
	.xword	.LC785
	.align	3
.LC787:
	.xword	.L2602
	.align	3
.LC789:
	.xword	.LC788
	.align	3
.LC790:
	.xword	.LANCHOR1
	.align	3
.LC792:
	.xword	.LC791
	.align	3
.LC794:
	.xword	.LC793
	.align	3
.LC796:
	.xword	.LC795
	.align	3
.LC798:
	.xword	.LC797
	.align	3
.LC800:
	.xword	.LC799
	.align	3
.LC802:
	.xword	.LC801
	.align	3
.LC804:
	.xword	.LC803
	.align	3
.LC806:
	.xword	.LC805
	.align	3
.LC808:
	.xword	.LC807
	.align	3
.LC809:
	.xword	g_EventReportFunc
	.align	3
.LC811:
	.xword	.LC810
	.align	3
.LC813:
	.xword	.LC812
	.align	3
.LC815:
	.xword	.LC814
	.align	3
.LC817:
	.xword	.LC816
	.align	3
.LC819:
	.xword	.LC818
	.align	3
.LC821:
	.xword	.LC820
	.align	3
.LC823:
	.xword	.LC822
	.align	3
.LC825:
	.xword	.LC824
	.align	3
.LC827:
	.xword	.LC826
	.align	3
.LC829:
	.xword	.LC828
	.align	3
.LC831:
	.xword	.LC830
	.align	3
.LC833:
	.xword	.LC832
	.align	3
.LC835:
	.xword	.LC834
	.align	3
.LC837:
	.xword	.LC836
	.align	3
.LC839:
	.xword	.LC838
	.align	3
.LC841:
	.xword	.LC840
	.align	3
.LC843:
	.xword	.LC842
	.align	3
.LC845:
	.xword	.LC844
	.align	3
.LC846:
	.xword	.LANCHOR1+264
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_InitOldSlice
	.type	MVC_InitOldSlice, %function
MVC_InitOldSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 11120640
	ldr	w8, [x19, 40]
	mov	w7, 23352
	mov	w6, 2
	movk	w7, 0x1, lsl 16
	mov	w5, 7
	strb	wzr, [x0, 16]
	mov	w4, 32
	strb	w6, [x0, 17]
	mov	w3, 3
	strb	w5, [x0, 19]
	mov	w2, -1
	strb	w4, [x0, 18]
	mov	w1, 1048576
	stp	w8, w7, [x0, 28]
	stp	w3, w2, [x0, 40]
	stp	wzr, wzr, [x0, 48]
	str	w1, [x0, 56]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_InitOldSlice, .-MVC_InitOldSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_IsNewPicNal
	.type	MVC_IsNewPicNal, %function
MVC_IsNewPicNal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x20, 3]
	and	w0, w0, 31
	sub	w0, w0, #1
	cmp	w0, 7
	bls	.L2800
.L2799:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2800:
	ldr	x1, .LC847
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx2794
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx2794:
	.section	.rodata
	.align	0
	.align	2
.L2794:
	.byte	(.L2793 - .Lrtx2794) / 4
	.byte	(.L2799 - .Lrtx2794) / 4
	.byte	(.L2799 - .Lrtx2794) / 4
	.byte	(.L2799 - .Lrtx2794) / 4
	.byte	(.L2793 - .Lrtx2794) / 4
	.byte	(.L2799 - .Lrtx2794) / 4
	.byte	(.L2795 - .Lrtx2794) / 4
	.byte	(.L2795 - .Lrtx2794) / 4
	.text
	.p2align 3
.L2795:
	ldr	w0, [x19]
	mov	w1, 1
	str	w1, [x19]
	cmp	w0, wzr
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2793:
	ldr	w0, [x19]
	cbz	w0, .L2796
.L2798:
	mov	w0, -1
	str	wzr, [x19]
.L2801:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2796:
	ldr	w20, [x20, 4]
	rev	w20, w20
	mov	w0, w20
	bl	ZerosMS_32
	cmp	w0, 15
	bhi	.L2798
	mov	w1, 31
	str	wzr, [x19]
	sub	w0, w1, w0, lsl 1
	lsr	w20, w20, w0
	cmp	w20, 1
	csetm	w0, ne
	b	.L2801
	.size	MVC_IsNewPicNal, .-MVC_IsNewPicNal
	.align	3
.LC847:
	.xword	.L2794
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_FindZeroBitsInSeg
	.type	MVC_FindZeroBitsInSeg, %function
MVC_FindZeroBitsInSeg:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x22, x0
	mov	x0, x30
	mov	w23, w1
	bl	_mcount
	cmp	x22, xzr
	ccmp	w23, wzr, 4, ne
	ble	.L2822
	and	w1, w23, 63
	add	w0, w23, 63
	cmp	w1, wzr
	cset	w26, ne
	cmp	w23, wzr
	csel	w0, w0, w23, lt
	add	w26, w26, w0, asr 6
	cmp	w26, wzr
	ble	.L2815
	ldr	x20, .LC851
	mov	w25, w23
	ldr	x27, .LC850
	mov	w19, 0
	mov	w24, 64
	add	x20, x20, 1880
	.p2align 2
.L2814:
	cmp	w25, 64
	uxtw	x1, w25
	csel	w21, w25, w24, ls
	ldr	x3, [x27, 104]
	sub	x1, x1, x21
	mov	x2, x21
	add	x1, x22, x1
	sub	x21, x21, #1
	mov	x0, x20
	blr	x3
	ldrb	w1, [x20, x21]
	add	x0, x20, x21
	cbnz	w1, .L2806
	cmp	x0, x20
	add	w19, w19, 1
	bne	.L2809
	b	.L2807
	.p2align 3
.L2810:
	add	w19, w19, 1
	beq	.L2807
.L2809:
	ldrb	w1, [x0, -1]!
	cmp	x0, x20
	cbz	w1, .L2810
.L2806:
	lsl	w0, w19, 3
.L2805:
	cmp	w19, w23
	mov	w1, 0
	bge	.L2811
	sxtw	x2, w23
	sub	x2, x2, #1
	sub	x19, x2, x19, sxtw
	ldrb	w2, [x22, x19]
	tbnz	x2, 0, .L2811
	lsr	w2, w2, 1
	mov	w1, 1
	.p2align 2
.L2813:
	tbnz	x2, 0, .L2811
	add	w1, w1, 1
	lsr	w2, w2, 1
	cmp	w1, 8
	bne	.L2813
.L2811:
	add	w0, w1, w0
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2807:
	subs	w26, w26, #1
	sub	w25, w25, #64
	bne	.L2814
	b	.L2806
.L2822:
	ldr	x2, .LC849
	mov	w3, w23
	mov	w1, 10971
	mov	w0, 0
	bl	dprint_normal
	ldr	x27, [sp, 80]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
.L2815:
	mov	w0, 0
	mov	w19, 0
	b	.L2805
	.size	MVC_FindZeroBitsInSeg, .-MVC_FindZeroBitsInSeg
	.align	3
.LC849:
	.xword	.LC848
	.align	3
.LC850:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC851:
	.xword	.LANCHOR4
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_FindTrailZeros
	.type	MVC_FindTrailZeros, %function
MVC_FindTrailZeros:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L2829
	ldr	x2, [x19, 240]
	ldr	w0, [x2, 76]
	cmp	w0, 1
	bls	.L2828
	ldr	w1, [x2, 48]
	ldr	x0, [x2, 40]
	bl	MVC_FindZeroBitsInSeg
	ldr	x2, [x19, 240]
	ldr	w1, [x2, 48]
	cmp	w0, w1, lsl 3
	bcs	.L2832
	cmn	w0, #1
	beq	.L2828
	add	w0, w0, 1
	str	w0, [x2, 80]
	ldr	x0, [x19, 240]
	ldr	w1, [x0, 76]
	cmp	w1, 1
	bls	.L2830
.L2833:
	ldr	w2, [x0, 48]
	mov	w20, 0
	ldr	w1, [x0, 80]
	cmp	w1, w2, lsl 3
	bcc	.L2824
	ldr	w1, [x0, 68]
	ldr	w0, [x19, 120]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 240]
	mov	w1, 1
	str	xzr, [x0, 40]
	ldr	x0, [x19, 240]
	str	w1, [x0, 76]
	ldr	x0, [x19, 240]
	str	wzr, [x0, 80]
.L2824:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2832:
	ldr	w1, [x2, 68]
	ldr	w0, [x19, 120]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 240]
	mov	w1, 1
	str	xzr, [x0, 40]
	ldr	x0, [x19, 240]
	str	w1, [x0, 76]
	ldr	x2, [x19, 240]
.L2828:
	ldr	w1, [x2, 16]
	ldr	x0, [x2, 8]
	bl	MVC_FindZeroBitsInSeg
	add	w0, w0, 1
	ldr	x2, [x19, 240]
	str	w0, [x2, 80]
	ldr	x0, [x19, 240]
	ldr	w1, [x0, 76]
	cmp	w1, 1
	bhi	.L2833
.L2830:
	mov	w20, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L2829:
	mov	w20, -1
	b	.L2824
	.size	MVC_FindTrailZeros, .-MVC_FindTrailZeros
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_CombinePacket
	.type	MVC_CombinePacket, %function
MVC_CombinePacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 240]
	ldr	w0, [x0, 16]
	cmp	w0, 4095
	bhi	.L2834
	mov	x0, x19
	bl	MVC_CombinePacket.part.11
.L2834:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_CombinePacket, .-MVC_CombinePacket
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_FindNaluArraySlot
	.type	MVC_FindNaluArraySlot, %function
MVC_FindNaluArraySlot:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 1521]
	cbz	w0, .L2841
	add	x0, x19, 1617
	mov	x1, 1
	b	.L2839
	.p2align 3
.L2838:
	add	w1, w1, 1
	cmp	w1, 137
	beq	.L2844
.L2839:
	ldrb	w2, [x0]
	add	x0, x0, 96
	cbnz	w2, .L2838
	mov	w0, w1
.L2837:
	lsl	x2, x1, 2
	mov	w3, 1
	sub	x1, x2, x1
	add	x1, x19, x1, lsl 5
	strb	w3, [x1, 1521]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2844:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L2841:
	mov	w0, 0
	mov	x1, 0
	b	.L2837
	.size	MVC_FindNaluArraySlot, .-MVC_FindNaluArraySlot
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_InquireSliceProperty
	.type	MVC_InquireSliceProperty, %function
MVC_InquireSliceProperty:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x23, x1
	mov	x21, x2
	bl	_mcount
	add	x20, x19, 11116544
	ldr	w3, [x19, 68]
	mov	w1, 11246
	ldr	x2, .LC854
	mov	w0, 20
	sub	w3, w3, #1
	bl	dprint_normal
	str	wzr, [x21]
	str	wzr, [x23]
	add	x2, x19, 11120640
	add	x0, x19, 12288
	mov	w3, -1
	ldr	x1, [x19, 240]
	ldrb	w4, [x1, 2]
	strb	w4, [x20, 2459]
	ldrb	w5, [x1, 4]
	strb	w5, [x20, 2464]
	ldrsb	w1, [x1, 5]
	strb	w1, [x20, 2468]
	strb	wzr, [x20, 2467]
	str	w3, [x2]
	ldrb	w3, [x0, 2384]
	cmp	w3, 1
	beq	.L2881
	cmn	w1, #1
	beq	.L2882
.L2847:
	mov	x0, x19
	bl	MVC_SliceCheck
	mov	w22, w0
	cbnz	w0, .L2863
	mov	x0, x19
	bl	MVC_ProcessSliceHeaderFirstPart
	cbnz	w0, .L2883
	ldrb	w1, [x20, 2461]
	mov	w0, 2240
	cmp	w1, 1
	cset	w1, eq
	str	w1, [x23]
	ldr	w1, [x20, 2472]
	ldrsb	w3, [x20, 2468]
	ldr	x2, [x19, 280]
	umull	x0, w1, w0
	cmn	w3, #1
	add	x0, x2, x0
	beq	.L2884
	cbnz	w3, .L2859
	ldrb	w1, [x19, 2]
	cmp	w1, 1
	beq	.L2885
	ldr	w1, [x0, 28]
	add	x0, x19, 11046912
	ldr	w2, [x19, 28]
	add	x0, x0, 180
	cmp	w2, w1
	bne	.L2886
.L2858:
	ldrb	w1, [x0, 20]
	mov	w2, 2
	ldr	w5, [x0, 3952]
	sub	w1, w2, w1
	ldr	w2, [x0, 3948]
	ldp	w3, w4, [x19, 12]
	madd	w1, w5, w1, w1
	add	w2, w2, 1
	cmp	w1, w4
	ccmp	w2, w3, 0, eq
	beq	.L2862
	mov	w1, 1
	str	w1, [x21]
.L2862:
	add	x19, x19, 11124736
	ldr	w1, [x0, 3972]
	ldr	w0, [x19, 408]
	add	w0, w0, 1
	cmp	w1, w0
	bls	.L2855
	mov	w0, 1
	str	w0, [x21]
.L2855:
	mov	w0, w22
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2881:
	strb	w3, [x20, 2467]
	ldr	w1, [x19, 14680]
	str	w1, [x2]
	ldrb	w1, [x0, 2388]
	strb	w1, [x20, 2465]
	ldrb	w0, [x0, 2389]
	strb	w0, [x20, 2466]
	b	.L2847
	.p2align 3
.L2884:
	ldr	w1, [x0, 28]
	mov	w0, 3992
	ldr	x2, [x19, 272]
	umull	x0, w1, w0
	add	x0, x2, x0
	b	.L2858
	.p2align 3
.L2882:
	ldr	w1, [x19, 20]
	cbz	w1, .L2847
	add	x1, x19, 10768384
	ldr	w3, [x1, 4064]
	cbnz	w3, .L2850
	ldrb	w3, [x1, 4060]
	cbnz	w3, .L2850
	add	x0, x0, 2400
	mov	x1, 0
	.p2align 2
.L2853:
	ldr	w3, [x0]
	add	x5, x0, 335872
	cbz	w3, .L2851
	ldrb	w0, [x0, -4]
	cbnz	w0, .L2887
.L2851:
	add	w1, w1, 1
	add	x0, x5, 308
	cmp	w1, 32
	bne	.L2853
	mov	w0, -1
	b	.L2880
	.p2align 3
.L2885:
	ldr	w1, [x0, 28]
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 4
	sub	x0, x0, x1
	lsl	x1, x0, 2
	sub	x1, x1, x0
	lsl	x0, x1, 6
	add	x0, x1, x0
	add	x0, x19, x0, lsl 2
	add	x0, x0, 286720
	add	x0, x0, 2612
	b	.L2858
	.p2align 3
.L2850:
	ldr	w0, [x1, 4068]
.L2880:
	cmn	w0, #1
	str	w0, [x2]
	beq	.L2847
	cmp	w4, 5
	mov	w0, 1
	cset	w1, eq
	strb	w0, [x20, 2467]
	strb	w0, [x20, 2466]
	strb	w1, [x20, 2465]
	b	.L2847
	.p2align 3
.L2863:
	mov	w22, -1
	b	.L2855
	.p2align 3
.L2886:
	ldr	x2, .LC857
	mov	w1, 11313
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	b	.L2855
	.p2align 3
.L2883:
	ldr	x2, .LC856
	mov	w1, 11291
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	b	.L2855
	.p2align 3
.L2859:
	ldr	x2, .LC859
	mov	w1, 11322
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	b	.L2855
	.p2align 3
.L2887:
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 4
	sub	x1, x0, x1
	lsl	x0, x1, 2
	sub	x1, x0, x1
	lsl	x0, x1, 6
	add	x0, x1, x0
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 14692]
	b	.L2880
	.size	MVC_InquireSliceProperty, .-MVC_InquireSliceProperty
	.align	3
.LC854:
	.xword	.LC853
	.align	3
.LC856:
	.xword	.LC855
	.align	3
.LC857:
	.xword	.LC76
	.align	3
.LC859:
	.xword	.LC858
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_HaveSliceToDec
	.type	MVC_HaveSliceToDec, %function
MVC_HaveSliceToDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 64]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	csetm	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_HaveSliceToDec, .-MVC_HaveSliceToDec
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_IsRefListWrong
	.type	MVC_IsRefListWrong, %function
MVC_IsRefListWrong:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 11116544
	bl	_mcount
	ldr	w0, [x21, 2504]
	cbz	w0, .L2890
	mov	w19, 0
	b	.L2894
	.p2align 3
.L2891:
	ldr	x0, [x0, 24]
	cbz	x0, .L2893
	ldr	w0, [x21, 2504]
	cmp	w0, w19
	bls	.L2918
.L2894:
	add	x1, x20, x19, sxtw 3
	ldr	w0, [x20, 120]
	add	w19, w19, 1
	ldr	x1, [x1, 288]
	ldr	x1, [x1, 8]
	ldrsb	w1, [x1, 6]
	bl	FSP_GetLogicFs
	cbnz	x0, .L2891
.L2893:
	mov	w0, -1
.L2920:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2890:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2918:
	cbz	w0, .L2890
	ldr	w0, [x21, 2508]
	mov	w19, 0
	cbnz	w0, .L2907
	b	.L2890
	.p2align 3
.L2919:
	ldr	x0, [x0, 24]
	cbz	x0, .L2893
	ldr	w0, [x21, 2508]
	cmp	w0, w19
	bls	.L2890
.L2907:
	add	x1, x20, x19, sxtw 3
	ldr	w0, [x20, 120]
	add	w19, w19, 1
	ldr	x1, [x1, 552]
	ldr	x1, [x1, 8]
	ldrsb	w1, [x1, 6]
	bl	FSP_GetLogicFs
	cbnz	x0, .L2919
	mov	w0, -1
	b	.L2920
	.size	MVC_IsRefListWrong, .-MVC_IsRefListWrong
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DEC_RecycleImage
	.type	MVC_DEC_RecycleImage, %function
MVC_DEC_RecycleImage:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w22, w1
	bl	_mcount
	ldr	x2, .LC861
	mov	w1, 11706
	mov	w0, 3
	bl	dprint_normal
	ldr	w0, [x21, 120]
	mov	w1, w22
	bl	FSP_GetLogicFs
	cbz	x0, .L2926
	ldr	w1, [x0, 20]
	cbz	w1, .L2926
	add	x19, x0, 224
	add	x20, x0, 256
.L2924:
	ldr	x1, [x19]
	cbnz	x1, .L2931
.L2923:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L2924
	ldr	w0, [x21, 120]
	mov	w2, 0
	mov	w1, w22
	bl	FSP_SetDisplay
	mov	w0, 0
.L2922:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2931:
	ldr	w0, [x21, 120]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L2923
	.p2align 3
.L2926:
	mov	w0, -1
	b	.L2922
	.size	MVC_DEC_RecycleImage, .-MVC_DEC_RecycleImage
	.align	3
.LC861:
	.xword	.LC860
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_OutputFrmToVO
	.type	MVC_OutputFrmToVO, %function
MVC_OutputFrmToVO:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	w21, w2
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L2974
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 12]
	cbz	w0, .L2935
	ldrb	w0, [x19, 8]
	cmp	w0, 2
	beq	.L2935
	ldr	x0, [x19, 816]
	cbz	x0, .L2937
	strb	wzr, [x0, 2]
	mov	w0, 1
	str	xzr, [x19, 816]
.L2972:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2935:
	mov	x1, x20
	mov	x0, x19
	bl	MVC_CheckFrameStore
	cmn	w0, #3
	beq	.L2937
	ldr	x1, [x19, 816]
	cbz	x1, .L2938
	mov	x0, x19
	bl	MVC_GetImagePara
	ldr	x1, [x19, 816]
	mov	x0, x19
	bl	MVC_CheckFrameStore
	mov	w22, w0
	cbz	w0, .L2975
	cmn	w0, #3
	beq	.L2946
	mov	w3, 1543
	ldr	x2, .LC869
	mov	w1, w3
	mov	w4, w0
	mov	w0, 1
	bl	dprint_normal
	ldr	x1, [x19, 816]
	mov	x0, x19
	ldr	w1, [x1, 160]
	bl	MVC_DEC_RecycleImage
	cmp	w22, 1
	cset	w1, eq
.L2945:
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 2]
	ldr	x0, [x19, 816]
	cmp	x0, x20
	cset	w0, eq
	tst	w1, w0
	bne	.L2976
	str	xzr, [x19, 816]
.L2938:
	mov	x1, x20
	mov	x0, x19
	bl	MVC_GetImagePara
	mov	x1, x20
	mov	x0, x19
	bl	MVC_CheckFrameStore
	cbz	w0, .L2977
	mov	w3, 1596
	ldr	x2, .LC869
	mov	w1, w3
	mov	w4, w0
	mov	w0, 1
	bl	dprint_normal
	ldr	w1, [x20, 160]
	mov	x0, x19
	bl	MVC_DEC_RecycleImage
	mov	w0, 2
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2974:
	ldr	x2, .LC863
	mov	x4, x20
	mov	x3, x19
	mov	w1, 1480
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 2
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2977:
	ldrsb	w1, [x20, 6]
	ldr	w0, [x19, 120]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L2978
	cmp	w21, 1
	beq	.L2979
.L2950:
	ldrsb	w1, [x20, 6]
	mov	w2, 1
	ldr	w0, [x19, 120]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 120]
	mov	x4, x22
	add	x3, x19, 912
	mov	x2, x19
	mov	w1, 15
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L2980
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 632]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L2981
	str	wzr, [x22, 16]
.L2953:
	ldr	w1, [x19, 136]
	mov	w0, 0
	ldr	w2, [x19, 144]
	add	w1, w1, 2
	str	w1, [x19, 136]
	add	w2, w2, 1
	str	w2, [x19, 144]
	b	.L2972
	.p2align 3
.L2937:
	mov	w0, 1
	b	.L2972
	.p2align 3
.L2946:
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 2]
	str	xzr, [x19, 816]
	b	.L2938
	.p2align 3
.L2975:
	ldr	x1, [x19, 816]
	ldr	w0, [x19, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	mov	w3, 1513
	cbz	x0, .L2973
	ldr	x0, [x19, 816]
	cmp	x20, x0
	ccmp	w21, 1, 0, eq
	beq	.L2982
.L2941:
	ldrsb	w1, [x0, 6]
	mov	w2, 1
	ldr	w0, [x19, 120]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 120]
	mov	x4, x22
	add	x3, x19, 912
	mov	x2, x19
	mov	w1, 15
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L2983
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 632]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L2984
	str	wzr, [x22, 16]
.L2944:
	ldr	w0, [x19, 136]
	mov	w1, 1
	ldr	w2, [x19, 144]
	add	w0, w0, 2
	str	w0, [x19, 136]
	add	w2, w2, w1
	str	w2, [x19, 144]
	b	.L2945
	.p2align 3
.L2976:
	mov	w0, 0
	str	xzr, [x19, 816]
	b	.L2972
	.p2align 3
.L2979:
	str	w21, [x0, 108]
	b	.L2950
	.p2align 3
.L2981:
	mov	x1, x22
	mov	x0, x19
	bl	MVC_SetFrmRepeatCount.part.1
	b	.L2953
	.p2align 3
.L2984:
	mov	x1, x22
	mov	x0, x19
	bl	MVC_SetFrmRepeatCount.part.1
	b	.L2944
	.p2align 3
.L2982:
	mov	w0, 1
	str	w0, [x22, 108]
	ldr	x0, [x19, 816]
	b	.L2941
.L2980:
	ldr	x2, .LC867
	mov	w3, w0
	mov	w1, 1584
	mov	w0, 0
	bl	dprint_normal
	ldrsb	w1, [x20, 6]
	mov	w2, 0
	ldr	w0, [x19, 120]
	bl	FSP_SetDisplay
	mov	w1, 1
	mov	x0, x19
	bl	MVC_ClearAll
	mov	w0, -1
	b	.L2972
.L2983:
	ldr	x2, .LC867
	mov	w3, w0
	mov	w1, 1528
	mov	w0, 0
	bl	dprint_normal
	ldr	x0, [x19, 816]
	mov	w2, 0
	strb	wzr, [x0, 2]
	ldr	x1, [x19, 816]
	ldr	w0, [x19, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetDisplay
	str	xzr, [x19, 816]
	mov	w1, 1
	mov	x0, x19
	bl	MVC_ClearAll
	mov	w0, -1
	b	.L2972
.L2978:
	mov	w3, 1569
.L2973:
	ldr	x2, .LC865
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L2972
	.size	MVC_OutputFrmToVO, .-MVC_OutputFrmToVO
	.align	3
.LC863:
	.xword	.LC862
	.align	3
.LC865:
	.xword	.LC864
	.align	3
.LC867:
	.xword	.LC866
	.align	3
.LC869:
	.xword	.LC868
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_OutputFrmFromDPB
	.type	MVC_OutputFrmFromDPB, %function
MVC_OutputFrmFromDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, 15
	bhi	.L2989
	add	x19, x21, x20, uxtw 3
	add	x19, x19, 11124736
	ldr	x0, [x19, 24]
	cbz	x0, .L2988
	strb	wzr, [x0, 5]
	mov	w2, 0
	mov	x0, x21
	ldr	x1, [x19, 24]
	bl	MVC_OutputFrmToVO
	cmn	w0, #1
	ldr	x1, [x19, 24]
	csetm	w19, eq
	ldrb	w0, [x1, 3]
	cbz	w0, .L2990
.L2987:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2990:
	mov	w1, w20
	mov	x0, x21
	bl	MVC_RemoveFrameStoreOutDPB
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2988:
	mov	w19, 0
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2989:
	ldr	x4, .LC870
	mov	w3, 1610
	ldr	x2, .LC872
	mov	w5, w20
	add	x4, x4, 280
	mov	w1, w3
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L2987
	.size	MVC_OutputFrmFromDPB, .-MVC_OutputFrmFromDPB
	.align	3
.LC870:
	.xword	.LANCHOR1
	.align	3
.LC872:
	.xword	.LC871
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_FlushDPB
	.type	MVC_FlushDPB, %function
MVC_FlushDPB:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cbz	x20, .L3010
	add	x21, x20, 11124736
	mov	w22, 0
	ldr	w0, [x21, 408]
	cbz	w0, .L2998
	.p2align 2
.L3032:
	uxtw	x0, w22
	add	w22, w22, 1
	add	x0, x0, 1388544
	add	x0, x20, x0, lsl 3
	ldr	x1, [x0, 16408]
	cbz	x1, .L2996
	ldrb	w0, [x1, 3]
	cbz	w0, .L2996
	ldr	w0, [x1, 56]
	cmp	w0, w19
	ccmn	w19, #1, 4, ne
	bne	.L2996
	mov	x0, x20
	bl	MVC_UnMarkFrameStoreRef
	.p2align 2
.L2996:
	ldr	w0, [x21, 408]
	cmp	w0, w22
	bhi	.L3032
.L2998:
	mov	w1, w19
	mov	x0, x20
	bl	MVC_RemoveUnUsedFrameStore
	ldr	w0, [x21, 408]
	cbz	w0, .L2995
	sub	w2, w0, #1
	mov	w22, -1
	add	x2, x2, 1388544
	add	x0, x21, 24
	add	x2, x2, 2052
	mov	w21, 0
	add	x2, x20, x2, lsl 3
	.p2align 2
.L3002:
	ldr	x1, [x0]
	cmn	w19, #1
	add	x0, x0, 8
	cbz	x1, .L3000
	ldr	w1, [x1, 56]
	ccmp	w19, w1, 4, ne
	csinc	w21, w21, w21, ne
	cmp	w19, w1
	ccmn	w19, #1, 4, ne
	csel	w22, w22, w1, eq
.L3000:
	cmp	x2, x0
	bne	.L3002
	cbz	w21, .L2995
	cmn	w22, #1
	cset	w24, ne
	cmp	w19, w22
	cset	w23, gt
	and	w23, w24, w23
	b	.L3008
	.p2align 3
.L3009:
	subs	w21, w21, #1
	beq	.L2995
.L3008:
	add	x3, x29, 72
	add	x2, x29, 76
	mov	w1, w22
	mov	x0, x20
	cbz	w23, .L3005
	bl	MVC_GetMinPOC
	ldr	w1, [x29, 72]
	mov	x0, x20
	cmn	w1, #1
	beq	.L2995
	bl	MVC_OutputFrmFromDPB
	cbnz	w0, .L3010
.L3005:
	mov	w1, w19
	add	x3, x29, 72
	add	x2, x29, 76
	mov	x0, x20
	bl	MVC_GetMinPOC
	ldr	w1, [x29, 72]
	mov	x0, x20
	cmn	w1, #1
	beq	.L2995
	bl	MVC_OutputFrmFromDPB
	cbnz	w0, .L3010
	cmp	w19, w22
	cset	w0, lt
	tst	w24, w0
	beq	.L3009
	mov	w1, w22
	add	x3, x29, 72
	add	x2, x29, 76
	mov	x0, x20
	bl	MVC_GetMinPOC
	ldr	w1, [x29, 72]
	mov	x0, x20
	cmn	w1, #1
	beq	.L2995
	bl	MVC_OutputFrmFromDPB
	cbz	w0, .L3009
.L3010:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, -1
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L2995:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, 0
	ldp	x29, x30, [sp], 80
	ret
	.size	MVC_FlushDPB, .-MVC_FlushDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_AdaptiveMemMark
	.type	MVC_AdaptiveMemMark, %function
MVC_AdaptiveMemMark:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x24, x20, 11153408
	add	x25, x20, 11116544
	bl	_mcount
	ldr	x22, .LC873
	add	x23, x24, 2184
	mov	w26, 1
	ldr	x21, [x24, 2744]
	add	x19, x21, 8
	add	x21, x21, 2008
	.p2align 2
.L3056:
	ldr	w0, [x19, -4]
	cmp	w0, 6
	bhi	.L3047
	ldrb	w0, [x22,w0,uxtw]
	adr	x1, .Lrtx3049
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx3049:
	.section	.rodata
	.align	0
	.align	2
.L3049:
	.byte	(.L3048 - .Lrtx3049) / 4
	.byte	(.L3050 - .Lrtx3049) / 4
	.byte	(.L3051 - .Lrtx3049) / 4
	.byte	(.L3052 - .Lrtx3049) / 4
	.byte	(.L3053 - .Lrtx3049) / 4
	.byte	(.L3054 - .Lrtx3049) / 4
	.byte	(.L3055 - .Lrtx3049) / 4
	.text
	.p2align 3
.L3054:
	mov	x0, x20
	bl	MVC_UnMarkAllSTRef
	mov	x0, x20
	bl	MVC_UpdateReflist
	mov	w1, 0
	mov	x0, x20
	bl	MVC_UpdateMaxLTFrmIdx
	mov	x0, x20
	bl	MVC_UpdateLTReflist
	strb	w26, [x25, 1320]
	.p2align 2
.L3047:
	add	x19, x19, 20
	cmp	x19, x21
	bne	.L3056
	.p2align 2
.L3048:
	ldrsb	w1, [x25, 1320]
	mov	w0, 0
	cmp	w1, 1
	beq	.L3064
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3053:
	ldr	w1, [x19, 12]
	mov	x0, x20
	bl	MVC_UpdateMaxLTFrmIdx
	mov	x0, x20
	bl	MVC_UpdateLTReflist
	b	.L3047
	.p2align 3
.L3052:
	ldr	w2, [x19]
	mov	x1, x23
	ldr	w3, [x19, 8]
	mov	x0, x20
	bl	MVC_MarkSTToLTRef
	mov	x0, x20
	bl	MVC_UpdateReflist
	mov	x0, x20
	bl	MVC_UpdateLTReflist
	b	.L3047
	.p2align 3
.L3051:
	ldr	w2, [x19, 4]
	mov	x0, x20
	mov	x1, x23
	bl	MVC_UnMarkLTRef
	mov	x0, x20
	bl	MVC_UpdateLTReflist
	b	.L3047
	.p2align 3
.L3050:
	ldr	w2, [x19]
	mov	x0, x20
	mov	x1, x23
	bl	MVC_UnMarkSTRef
	mov	x0, x20
	bl	MVC_UpdateReflist
	b	.L3047
	.p2align 3
.L3055:
	ldr	w2, [x19, 8]
	mov	x1, x23
	mov	x0, x20
	bl	MVC_MarkCurrPicLT
	b	.L3047
	.p2align 3
.L3064:
	add	x0, x20, 11120640
	str	wzr, [x24, 2752]
	ldr	w0, [x0, 4]
	add	x0, x0, 2777088
	add	x0, x20, x0, lsl 2
	str	wzr, [x0, 10668]
	str	wzr, [x24, 3488]
	ldrb	w0, [x24, 2187]
	cmp	w0, 1
	beq	.L3059
	cbz	w0, .L3060
	cmp	w0, 2
	bne	.L3058
	str	wzr, [x24, 2764]
	str	wzr, [x24, 2776]
	str	wzr, [x25, 1348]
	str	wzr, [x25, 1356]
.L3058:
	ldr	w1, [x24, 2824]
	mov	x0, x20
	bl	MVC_FlushDPB
	cmp	w0, wzr
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L3060:
	ldr	w2, [x24, 2764]
	ldr	w0, [x24, 2772]
	ldr	w1, [x24, 2776]
	sub	w0, w0, w2
	str	w0, [x24, 2772]
	sub	w1, w1, w2
	str	w1, [x24, 2776]
	cmp	w0, w1
	csel	w0, w0, w1, le
	str	w0, [x24, 2764]
	str	w0, [x24, 2768]
	ldr	w2, [x25, 1356]
	ldr	w0, [x25, 1344]
	ldr	w1, [x25, 1348]
	sub	w0, w0, w2
	str	w0, [x25, 1344]
	sub	w1, w1, w2
	str	w1, [x25, 1348]
	cmp	w0, w1
	csel	w0, w0, w1, le
	str	w0, [x25, 1352]
	str	w0, [x25, 1356]
	b	.L3058
.L3059:
	str	wzr, [x24, 2764]
	str	wzr, [x24, 2772]
	str	wzr, [x25, 1344]
	str	wzr, [x25, 1356]
	b	.L3058
	.size	MVC_AdaptiveMemMark, .-MVC_AdaptiveMemMark
	.align	3
.LC873:
	.xword	.L3049
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_IDRMemMarking
	.type	MVC_IDRMemMarking, %function
MVC_IDRMemMarking:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x20, x22, 11153408
	bl	_mcount
	ldr	x0, [x20, 2744]
	ldrb	w0, [x0, 1]
	cbz	w0, .L3066
	ldr	w0, [x22, 52]
	cbz	w0, .L3093
	sub	w4, w0, #1
	add	x24, x22, 11124736
	add	x4, x4, 38
	add	x2, x24, 24
	add	x1, x22, 148
	add	x4, x22, x4, lsl 2
	b	.L3074
	.p2align 3
.L3072:
	ldr	w3, [x0, 56]
	ldr	w0, [x20, 2824]
	cmp	w3, w0
	beq	.L3094
.L3071:
	add	x1, x1, 4
	cmp	x1, x4
	beq	.L3075
.L3074:
	ldr	x0, [x2]
	add	x2, x2, 8
	cbz	x0, .L3071
	ldr	w3, [x0, 16]
	cmp	w3, 1
	bne	.L3072
	strb	w3, [x22, 6]
	ldr	w3, [x0, 56]
	ldr	w0, [x20, 2824]
	cmp	w3, w0
	bne	.L3071
.L3094:
	str	wzr, [x1]
	add	x1, x1, 4
	cmp	x1, x4
	bne	.L3074
.L3075:
	ldr	w0, [x24, 408]
	cbz	w0, .L3069
	sub	w21, w0, #1
	add	x19, x24, 24
	add	x21, x21, 1388544
	mov	w23, 1
	add	x21, x21, 2052
	add	x21, x22, x21, lsl 3
	b	.L3080
	.p2align 3
.L3078:
	add	x19, x19, 8
	cmp	x19, x21
	beq	.L3069
.L3080:
	ldr	x0, [x19]
	cbz	x0, .L3078
	ldr	w2, [x0, 56]
	ldr	w1, [x20, 2824]
	cmp	w2, w1
	bne	.L3078
	strb	wzr, [x0, 610]
	mov	w2, 0
	strb	wzr, [x0, 609]
	ldr	x0, [x19]
	strb	wzr, [x0, 658]
	strb	wzr, [x0, 657]
	ldr	x0, [x19]
	strb	wzr, [x0, 706]
	strb	wzr, [x0, 705]
	ldr	x0, [x19]
	strb	wzr, [x0, 3]
	ldr	x1, [x19]
	ldr	w0, [x22, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetRef
	ldr	x0, [x19]
	strb	wzr, [x0, 2]
	ldr	x0, [x19]
	strb	wzr, [x0, 5]
	ldr	x0, [x19]
	strb	w23, [x0, 7]
	ldr	x1, [x19]
	ldr	w0, [x1, 52]
	add	x0, x22, x0
	add	x0, x0, 11124736
	strb	wzr, [x0, 432]
	ldrsb	w1, [x1, 6]
	ldr	w0, [x22, 120]
	bl	FSP_GetDisplay
	cmp	w0, 3
	mov	w2, 0
	beq	.L3079
	ldr	x1, [x19]
	ldr	w0, [x22, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetDisplay
.L3079:
	str	xzr, [x19]
	add	x19, x19, 8
	str	xzr, [x19, 120]
	str	xzr, [x19, 248]
	cmp	x19, x21
	ldr	w0, [x24, 412]
	sub	w0, w0, #1
	str	w0, [x24, 412]
	bne	.L3080
	.p2align 2
.L3069:
	mov	x0, x22
	bl	MVC_UpdateReflist
	mov	x0, x22
	bl	MVC_UpdateLTReflist
	ldr	x0, [x20, 2744]
	ldrb	w0, [x0, 2]
	cbnz	w0, .L3095
	mov	w0, 1
	str	wzr, [x24, 424]
	strb	w0, [x20, 2189]
	mov	w0, 0
	strb	wzr, [x20, 2188]
.L3081:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3095:
	mov	w0, 1
	str	w0, [x24, 424]
	strb	w0, [x20, 2188]
	mov	w0, 0
	strb	wzr, [x20, 2189]
	str	wzr, [x20, 2756]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3066:
	ldr	w1, [x20, 2824]
	mov	x0, x22
	bl	MVC_FlushDPB
	cbnz	w0, .L3082
	add	x24, x22, 11124736
	b	.L3069
.L3093:
	add	x24, x22, 11124736
	b	.L3075
.L3082:
	mov	w0, -1
	b	.L3081
	.size	MVC_IDRMemMarking, .-MVC_IDRMemMarking
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_Marking
	.type	MVC_Marking, %function
MVC_Marking:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 11153408
	bl	_mcount
	add	x0, x20, 11116544
	strb	wzr, [x0, 1320]
	ldrb	w1, [x19, 2187]
	cmp	w1, 2
	cset	w1, eq
	strb	w1, [x0, 1321]
	ldrb	w0, [x19, 2190]
	cmp	w0, 5
	beq	.L3097
	ldrb	w0, [x19, 2196]
	cbnz	w0, .L3098
	ldr	x0, [x20, 224]
	ldr	w1, [x0, 672]
	cmp	w1, 1
	beq	.L3122
.L3098:
	ldr	x0, [x19, 2744]
	ldrb	w1, [x0, 3]
	cbz	w1, .L3123
	ldr	w0, [x19, 2760]
	cbnz	w0, .L3124
.L3105:
	mov	w0, 0
.L3120:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3123:
	ldr	w1, [x19, 2760]
	cbz	w1, .L3105
.L3108:
	ldrb	w1, [x19, 2185]
	cbnz	w1, .L3109
	add	x1, x20, 11124736
	ldr	x2, [x20, 248]
	ldr	w4, [x1, 420]
	ldr	w2, [x2, 3944]
	ldr	w3, [x1, 416]
	sub	w1, w2, w4
	cmp	w3, w1
	beq	.L3125
.L3110:
	strb	wzr, [x0]
	strb	wzr, [x19, 2188]
.L3101:
	ldr	w0, [x19, 2760]
	cbz	w0, .L3105
.L3109:
	ldrb	w1, [x19, 2188]
	mov	w0, 0
	cmp	w1, wzr
	cset	w1, eq
	strb	w1, [x19, 2189]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3124:
	mov	x0, x20
	bl	MVC_AdaptiveMemMark
	ldr	x1, [x19, 2744]
	strb	wzr, [x1]
	cbnz	w0, .L3099
.L3106:
	ldrb	w0, [x19, 2190]
	cmp	w0, 5
	beq	.L3101
	ldr	w0, [x19, 2760]
	cbz	w0, .L3105
	ldr	x0, [x19, 2744]
	ldrb	w1, [x0, 3]
	cbnz	w1, .L3109
	b	.L3108
	.p2align 3
.L3122:
	ldr	w1, [x0, 668]
	cbnz	w1, .L3098
	ldr	w1, [x0, 676]
	cbnz	w1, .L3098
	ldr	w0, [x0, 632]
	add	w0, w0, 1024
	cmp	w0, 2048
	bls	.L3098
	.p2align 2
.L3097:
	mov	x0, x20
	bl	MVC_IDRMemMarking
	cbz	w0, .L3106
.L3099:
	mov	w0, -1
	b	.L3120
	.p2align 3
.L3125:
	mov	x0, x20
	bl	MVC_SlidingWinMark.part.2
	ldr	x0, [x19, 2744]
	b	.L3110
	.size	MVC_Marking, .-MVC_Marking
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DirectOutput
	.type	MVC_DirectOutput, %function
MVC_DirectOutput:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 11153408
	bl	_mcount
	ldrb	w0, [x20, 2187]
	cmp	w0, 1
	beq	.L3128
	cbz	w0, .L3129
	cmp	w0, 2
	beq	.L3130
	mov	w21, 0
.L3127:
	mov	w0, w21
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3130:
	ldr	x0, [x20, 2736]
	mov	w1, 3
	strb	w1, [x0, 608]
	ldrb	w0, [x20, 2185]
	cbz	w0, .L3205
	ldr	x3, [x19, 816]
	cbz	x3, .L3206
.L3150:
	mov	x2, 536
	add	x1, x20, 2200
	add	x0, x3, 72
	ldr	x21, [x3, 296]
	ldp	x23, x22, [x3, 280]
	bl	memcpy
	cmn	x23, #1
	beq	.L3151
	ldr	x0, [x19, 816]
	str	x23, [x0, 280]
.L3151:
	ldr	x0, [x20, 2416]
	ldr	x1, [x19, 816]
	cmp	x0, x22
	csel	x0, x0, x22, ls
	str	x0, [x1, 288]
	ldr	x0, [x20, 2424]
	ldr	x1, [x19, 816]
	cmp	x0, x21
	csel	x0, x0, x21, ls
	str	x0, [x1, 296]
	ldr	x1, [x19, 816]
	ldrb	w0, [x1, 1]
	cbz	w0, .L3152
	ldrb	w0, [x20, 2186]
.L3152:
	strb	w0, [x1, 1]
	mov	w4, 2
	mov	w3, 3
	ldr	x1, [x19, 816]
	ldrb	w0, [x1, 2]
	orr	w0, w0, 2
	strb	w0, [x1, 2]
	ldr	x1, [x19, 816]
	ldrb	w0, [x20, 2196]
	ldrb	w2, [x1]
	cmp	w0, w2, uxtb
	csel	w0, w0, w2, cs
	strb	w0, [x1]
	ldr	x0, [x19, 816]
	strb	w4, [x0, 704]
	ldr	x0, [x19, 816]
	strb	w3, [x0, 608]
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 2796]
	str	w1, [x0, 736]
	ldr	x1, [x19, 816]
	ldr	w2, [x1, 688]
	ldr	w0, [x1, 736]
	add	w0, w2, w0
	lsr	w0, w0, 1
	str	w0, [x1, 640]
	ldr	x0, [x19, 816]
	ldr	w1, [x0, 640]
	str	w1, [x0, 44]
	ldr	x0, [x19, 816]
	ldr	x1, [x0, 712]
	str	x1, [x0, 616]
	ldrb	w0, [x20, 2191]
	ldr	x1, [x19, 816]
	cmp	w0, 1
	beq	.L3207
.L3153:
	ldrb	w0, [x1, 4]
.L3154:
	strb	w0, [x1, 4]
	mov	w2, 0
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 2764]
	str	w1, [x0, 32]
	b	.L3200
	.p2align 3
.L3129:
	ldr	x0, [x20, 2736]
	strb	wzr, [x0, 608]
	ldr	x1, [x19, 816]
	cbz	x1, .L3131
	mov	w2, 0
	mov	x0, x19
	bl	MVC_OutputFrmToVO
	cbnz	w0, .L3208
.L3132:
	ldr	x0, [x19, 816]
	cbz	x0, .L3131
	ldr	x1, [x20, 2736]
	ldr	w0, [x19, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_ClearLogicFs
.L3131:
	ldr	x0, [x20, 2736]
	mov	w3, 3
	str	x0, [x19, 816]
	mov	x2, 536
	add	x1, x20, 2200
	str	x0, [x0, 616]
	ldr	x0, [x19, 816]
	ldr	x4, [x20, 2736]
	str	x4, [x0, 664]
	ldr	x0, [x19, 816]
	ldr	x4, [x20, 2736]
	str	x4, [x0, 712]
	ldr	x0, [x19, 816]
	ldrb	w4, [x20, 2186]
	strb	w4, [x0, 1]
	ldr	x0, [x19, 816]
	strb	w3, [x0, 2]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 3]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 5]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 7]
	ldr	x0, [x19, 816]
	add	x0, x0, 72
	bl	memcpy
	ldr	x1, [x19, 816]
	mov	w0, 3
	ldr	w3, [x20, 2796]
	mov	w2, 0
	str	w3, [x1, 44]
	str	w3, [x1, 640]
	ldr	x1, [x19, 816]
	strb	wzr, [x1, 608]
	ldr	x1, [x19, 816]
	ldrb	w3, [x20, 2196]
	strb	w3, [x1]
	ldr	x1, [x19, 816]
	ldrb	w3, [x20, 2193]
	str	w3, [x1, 40]
	ldrb	w3, [x20, 2191]
	ldr	x1, [x19, 816]
	cmp	w3, 1
	csel	w0, wzr, w0, ne
	strb	w0, [x1, 4]
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 2764]
	str	w1, [x0, 32]
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 2824]
	str	w1, [x0, 56]
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 2828]
	str	w1, [x0, 60]
.L3200:
	ldr	w0, [x19, 120]
	ldr	x1, [x19, 816]
.L3196:
	ldrsb	w1, [x1, 6]
	bl	FSP_SetRef
	ldr	x1, [x19, 816]
	mov	w2, 0
	mov	x0, x19
	bl	MVC_OutputFrmToVO
	mov	w21, w0
	ldr	x0, [x19, 816]
	cbz	x0, .L3155
	ldr	x1, [x20, 2736]
	ldr	w0, [x19, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_ClearLogicFs
.L3155:
	str	xzr, [x19, 816]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3128:
	ldr	x0, [x20, 2736]
	mov	w1, 3
	strb	w1, [x0, 608]
	ldrb	w0, [x20, 2185]
	cbnz	w0, .L3135
	ldr	x1, [x19, 816]
	cbz	x1, .L3136
	mov	w2, 0
	mov	x0, x19
	bl	MVC_OutputFrmToVO
	mov	w21, w0
	ldr	x0, [x20, 2736]
	str	x0, [x19, 816]
	str	x0, [x0, 664]
.L3137:
	ldr	x0, [x19, 816]
	mov	w22, 1
	ldrb	w3, [x20, 2186]
	add	x1, x20, 2200
	mov	x2, 536
	strb	w3, [x0, 1]
	ldr	x0, [x19, 816]
	strb	w22, [x0, 2]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 5]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 7]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 3]
	ldr	x0, [x19, 816]
	ldrb	w3, [x20, 2196]
	strb	w3, [x0]
	ldr	x0, [x19, 816]
	str	wzr, [x0, 40]
	ldr	x0, [x19, 816]
	add	x0, x0, 72
	bl	memcpy
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 2796]
	str	w1, [x0, 688]
	ldr	x0, [x19, 816]
	ldr	w1, [x0, 688]
	str	w1, [x0, 44]
	str	w1, [x0, 640]
	ldr	x0, [x19, 816]
	strb	w22, [x0, 656]
	ldrb	w1, [x20, 2191]
	ldr	x0, [x19, 816]
	cmp	w1, 1
	cset	w1, eq
	strb	w1, [x0, 4]
	b	.L3203
	.p2align 3
.L3135:
	ldr	x3, [x19, 816]
	cbz	x3, .L3209
.L3139:
	mov	x2, 536
	add	x1, x20, 2200
	add	x0, x3, 72
	ldr	x21, [x3, 296]
	ldp	x23, x22, [x3, 280]
	bl	memcpy
	ldr	x0, [x20, 2408]
	cmn	x0, #1
	ccmn	x23, #1, 4, eq
	beq	.L3140
	ldr	x0, [x19, 816]
	str	x23, [x0, 280]
.L3140:
	ldr	x0, [x20, 2416]
	ldr	x1, [x19, 816]
	cmp	x0, x22
	csel	x0, x0, x22, ls
	str	x0, [x1, 288]
	ldr	x0, [x20, 2424]
	ldr	x1, [x19, 816]
	cmp	x0, x21
	csel	x0, x0, x21, ls
	str	x0, [x1, 296]
	ldr	x1, [x19, 816]
	ldrb	w0, [x1, 1]
	cbz	w0, .L3141
	ldrb	w0, [x20, 2186]
.L3141:
	strb	w0, [x1, 1]
	mov	w4, 1
	mov	w3, 3
	ldr	x1, [x19, 816]
	ldrb	w0, [x1, 2]
	orr	w0, w0, 1
	strb	w0, [x1, 2]
	ldr	x1, [x19, 816]
	ldrb	w0, [x20, 2196]
	ldrb	w2, [x1]
	cmp	w0, w2, uxtb
	csel	w0, w0, w2, cs
	strb	w0, [x1]
	ldr	x0, [x19, 816]
	strb	w4, [x0, 656]
	ldr	x0, [x19, 816]
	strb	w3, [x0, 608]
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 2796]
	str	w1, [x0, 688]
	ldr	x1, [x19, 816]
	ldr	w2, [x1, 688]
	ldr	w0, [x1, 736]
	add	w0, w2, w0
	lsr	w0, w0, w4
	str	w0, [x1, 640]
	ldr	x0, [x19, 816]
	ldr	w1, [x0, 640]
	str	w1, [x0, 44]
	ldr	x0, [x19, 816]
	ldr	x1, [x0, 664]
	str	x1, [x0, 616]
	ldrb	w0, [x20, 2191]
	ldr	x1, [x19, 816]
	cmp	w0, 1
	bne	.L3153
	ldrb	w0, [x1, 4]
	orr	w0, w0, 1
	uxtb	w0, w0
	b	.L3154
	.p2align 3
.L3205:
	ldr	x1, [x19, 816]
	cbz	x1, .L3146
	mov	w2, 0
	mov	x0, x19
	bl	MVC_OutputFrmToVO
	mov	w21, w0
	ldr	x0, [x20, 2736]
	str	x0, [x19, 816]
	str	x0, [x0, 712]
.L3147:
	ldr	x0, [x19, 816]
	mov	w22, 2
	ldrb	w3, [x20, 2186]
	mov	x2, 536
	add	x1, x20, 2200
	strb	w3, [x0, 1]
	ldr	x0, [x19, 816]
	strb	w22, [x0, 2]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 5]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 7]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 3]
	ldr	x0, [x19, 816]
	ldrb	w3, [x20, 2196]
	strb	w3, [x0]
	ldr	x0, [x19, 816]
	str	wzr, [x0, 40]
	ldr	x0, [x19, 816]
	add	x0, x0, 72
	bl	memcpy
	ldr	x1, [x19, 816]
	mov	w0, 2
	ldr	w2, [x20, 2796]
	str	w2, [x1, 736]
	ldr	x1, [x19, 816]
	ldr	w2, [x1, 736]
	str	w2, [x1, 44]
	str	w2, [x1, 640]
	ldr	x1, [x19, 816]
	strb	w22, [x1, 704]
	ldrb	w2, [x20, 2191]
	ldr	x1, [x19, 816]
	cmp	w2, 1
	csel	w0, wzr, w0, ne
	strb	w0, [x1, 4]
.L3203:
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 2764]
	str	w1, [x0, 32]
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 2824]
	str	w1, [x0, 56]
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 2828]
	str	w1, [x0, 60]
	ldrb	w0, [x19, 9]
	cmp	w0, 1
	bne	.L3127
	mov	w2, 0
	ldr	w0, [x19, 120]
	ldr	x1, [x19, 816]
	b	.L3196
	.p2align 3
.L3208:
	ldr	x3, .LC874
	mov	w4, 2087
	ldr	x2, .LC876
	mov	w5, w0
	add	x3, x3, 304
	mov	w1, w4
	mov	w0, 20
	bl	dprint_normal
	b	.L3132
	.p2align 3
.L3207:
	ldrb	w0, [x1, 4]
	orr	w0, w0, 2
	uxtb	w0, w0
	b	.L3154
	.p2align 3
.L3136:
	ldr	x0, [x20, 2736]
	mov	w21, 0
	str	x0, [x19, 816]
	str	x0, [x0, 664]
	b	.L3137
	.p2align 3
.L3146:
	ldr	x0, [x20, 2736]
	mov	w21, 0
	str	x0, [x19, 816]
	str	x0, [x0, 712]
	b	.L3147
	.p2align 3
.L3206:
	ldr	x0, [x20, 2736]
	str	x0, [x19, 816]
	str	x0, [x0, 712]
	ldr	x3, [x19, 816]
	b	.L3150
	.p2align 3
.L3209:
	ldr	x0, [x20, 2736]
	str	x0, [x19, 816]
	str	x0, [x0, 664]
	ldr	x3, [x19, 816]
	b	.L3139
	.size	MVC_DirectOutput, .-MVC_DirectOutput
	.align	3
.LC874:
	.xword	.LANCHOR1
	.align	3
.LC876:
	.xword	.LC875
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DEC_FlushRemainImg
	.type	MVC_DEC_FlushRemainImg, %function
MVC_DEC_FlushRemainImg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x19, x21, 11124736
	bl	_mcount
	ldr	w0, [x19, 408]
	cbz	w0, .L3211
	mov	w20, 0
	mov	w22, 0
	b	.L3213
	.p2align 3
.L3212:
	ldr	w0, [x19, 408]
	cmp	w0, w22
	bls	.L3247
.L3213:
	uxtw	x0, w22
	add	w22, w22, 1
	add	x0, x0, 1388544
	add	x0, x21, x0, lsl 3
	ldr	x0, [x0, 16408]
	cbz	x0, .L3212
	ldrb	w1, [x0, 5]
	cbz	w1, .L3212
	ldrsb	w1, [x0, 6]
	ldr	w0, [x21, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L3212
	ldr	w0, [x0, 20]
	sub	w0, w0, #1
	cmp	w0, 1
	ldr	w0, [x19, 408]
	csinc	w20, w20, w20, hi
	cmp	w0, w22
	bhi	.L3213
.L3247:
	cbnz	w20, .L3217
	b	.L3214
	.p2align 3
.L3215:
	add	x1, x21, x1, lsl 3
	ldr	x1, [x1, 16408]
	bl	MVC_OutputFrmToVO
	subs	w20, w20, #1
	beq	.L3246
.L3217:
	add	x2, x29, 60
	mov	w1, -1
	add	x3, x29, 56
	mov	x0, x21
	bl	MVC_GetMinPOC
	ldr	w1, [x29, 56]
	mov	w2, w20
	mov	x0, x21
	cmn	w1, #1
	uxtw	x1, w1
	add	x1, x1, 1388544
	bne	.L3215
.L3246:
	ldr	w0, [x19, 408]
.L3214:
	mov	w20, 0
	cbnz	w0, .L3234
	b	.L3211
	.p2align 3
.L3218:
	ldr	w0, [x19, 408]
	cmp	w0, w20
	bls	.L3211
.L3234:
	uxtw	x0, w20
	add	w20, w20, 1
	add	x0, x0, 1388544
	add	x0, x21, x0, lsl 3
	ldr	x1, [x0, 16408]
	cbz	x1, .L3218
	ldrb	w0, [x1, 3]
	cbz	w0, .L3218
	mov	x0, x21
	bl	MVC_UnMarkFrameStoreRef
	ldr	w0, [x19, 408]
	cmp	w0, w20
	bhi	.L3234
.L3211:
	mov	w1, -1
	mov	x0, x21
	bl	MVC_RemoveUnUsedFrameStore
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	MVC_DEC_FlushRemainImg, .-MVC_DEC_FlushRemainImg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	MVC_InitDPB.part.15, %function
MVC_InitDPB.part.15:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x22, x20, 11124736
	add	x19, x22, 24
	add	x21, x22, 152
	bl	_mcount
	.p2align 2
.L3252:
	ldr	x0, [x19]
	cbz	x0, .L3249
	ldrsb	w1, [x0, 6]
	ldr	w0, [x20, 120]
	bl	FSP_ClearLogicFs
.L3249:
	ldr	x0, [x19, 128]
	cbz	x0, .L3250
	ldrsb	w1, [x0, 6]
	ldr	w0, [x20, 120]
	bl	FSP_ClearLogicFs
.L3250:
	ldr	x0, [x19, 256]
	cbz	x0, .L3251
	ldrsb	w1, [x0, 6]
	ldr	w0, [x20, 120]
	bl	FSP_ClearLogicFs
.L3251:
	str	xzr, [x19, 128]
	str	xzr, [x19, 256]
	str	xzr, [x19], 8
	cmp	x19, x21
	bne	.L3252
	add	x1, x22, 256
	ldr	w0, [x20, 44]
	stp	w0, wzr, [x1, 152]
	stp	wzr, wzr, [x1, 160]
	str	wzr, [x22, 424]
	ldr	x1, [x20, 816]
	cbz	x1, .L3254
	ldrb	w0, [x20, 8]
	cmp	w0, 2
	beq	.L3255
.L3259:
	add	x0, x20, 11153408
	ldr	x0, [x0, 2736]
	cbz	x0, .L3257
	ldrsb	w1, [x0, 6]
	ldr	w0, [x20, 120]
	bl	FSP_ClearLogicFs
.L3257:
	str	xzr, [x20, 816]
.L3254:
	ldr	x3, .LC880
	mov	w1, 0
	mov	x2, 344
	add	x0, x22, 432
	ldr	x3, [x3, 96]
	blr	x3
	str	wzr, [x22, 644]
	ldr	w0, [x22, 408]
	add	x1, x20, 220
	str	w0, [x22, 640]
	add	x0, x20, 148
	.p2align 2
.L3261:
	str	wzr, [x0], 4
	cmp	x0, x1
	bne	.L3261
	add	x1, x20, 288
	add	x0, x20, 552
	.p2align 2
.L3262:
	str	xzr, [x1], 8
	cmp	x1, x0
	bne	.L3262
	add	x1, x20, 11116544
	add	x20, x20, 816
	str	wzr, [x1, 2504]
	.p2align 2
.L3263:
	str	xzr, [x0], 8
	cmp	x20, x0
	bne	.L3263
	str	wzr, [x1, 2508]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L3255:
	mov	w2, 0
	mov	x0, x20
	bl	MVC_OutputFrmToVO
	cbnz	w0, .L3280
.L3258:
	ldr	x0, [x20, 816]
	cbnz	x0, .L3259
	b	.L3254
	.p2align 3
.L3280:
	ldr	x3, .LC877
	mov	w4, 4690
	ldr	x2, .LC879
	mov	w5, w0
	add	x3, x3, 328
	mov	w1, w4
	mov	w0, 20
	bl	dprint_normal
	b	.L3258
	.size	MVC_InitDPB.part.15, .-MVC_InitDPB.part.15
	.align	3
.LC877:
	.xword	.LANCHOR1
	.align	3
.LC879:
	.xword	.LC878
	.align	3
.LC880:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_InitDPB
	.type	MVC_InitDPB, %function
MVC_InitDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L3283
	mov	x0, x19
	bl	MVC_ClearAllSlice
	mov	x0, x19
	bl	MVC_InitDPB.part.15
.L3282:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3283:
	mov	w0, -1
	b	.L3282
	.size	MVC_InitDPB, .-MVC_InitDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ClearDPB
	.type	MVC_ClearDPB, %function
MVC_ClearDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	mov	w1, w20
	mov	x0, x19
	bl	MVC_FlushDPB
	cbnz	w0, .L3292
	cbz	x19, .L3288
.L3286:
	mov	x0, x19
	bl	MVC_ClearAllSlice
	mov	x0, x19
	bl	MVC_InitDPB.part.15
	cbnz	w0, .L3288
	strb	wzr, [x19, 6]
	mov	w0, 0
	str	wzr, [x19, 220]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3292:
	ldr	x3, .LC881
	mov	w4, 253
	ldr	x2, .LC883
	mov	w1, w4
	add	x3, x3, 344
	mov	w0, 20
	bl	dprint_normal
	cbnz	x19, .L3286
.L3288:
	ldr	x3, .LC881
	mov	w4, 258
	ldr	x2, .LC885
	mov	w1, w4
	add	x3, x3, 344
	mov	w0, 20
	bl	dprint_normal
	strb	wzr, [x19, 6]
	str	wzr, [x19, 220]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_ClearDPB, .-MVC_ClearDPB
	.align	3
.LC881:
	.xword	.LANCHOR1
	.align	3
.LC883:
	.xword	.LC882
	.align	3
.LC885:
	.xword	.LC884
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecVDM
	.type	MVC_DecVDM, %function
MVC_DecVDM:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 11153408
	bl	_mcount
	ldrb	w0, [x21, 2187]
	cbz	w0, .L3294
	ldrb	w0, [x21, 2185]
	cmp	w0, 1
	beq	.L3294
.L3295:
	ldr	w20, [x19, 108]
	ldrb	w0, [x19, 8]
	ubfx	x20, x20, 16, 2
	cmp	w20, w0
	beq	.L3296
	sub	w0, w0, #2
	uxtb	w0, w0
	cmp	w0, 1
	ccmp	w20, 1, 2, ls
	bls	.L3360
.L3296:
	uxtb	w20, w20
	strb	w20, [x19, 8]
	cmp	w20, 2
	beq	.L3299
	cmp	w20, 3
	beq	.L3300
	cmp	w20, 1
	beq	.L3361
	ldrb	w0, [x19, 11]
	cmp	w0, 1
	beq	.L3362
.L3307:
	ldr	w0, [x19, 64]
.L3320:
	ldrb	w1, [x21, 2197]
	strb	w1, [x19, 11]
.L3308:
	cbz	w0, .L3358
	ldrb	w0, [x21, 2196]
	cmp	w0, 2
	beq	.L3363
	cmp	w0, 1
	beq	.L3364
.L3311:
	ldr	w3, [x19, 88]
	mov	w1, 6622
	ldrb	w4, [x21, 2187]
	mov	w0, 3
	ldr	x2, .LC891
	sub	w3, w3, #1
	add	x20, x19, 11157504
	bl	dprint_normal
	ldr	w0, [x21, 2812]
	str	w0, [x20, 1100]
	mov	w0, 1
	strb	w0, [x20, 506]
	ldr	w0, [x21, 2816]
	str	w0, [x20, 1096]
	ldr	w0, [x19, 64]
	str	w0, [x20, 1300]
	ldr	w0, [x19, 88]
	cbz	w0, .L3319
	ldrb	w0, [x21, 2196]
	cbnz	w0, .L3313
	ldr	x0, .LC892
	ldr	x5, [x0]
	cbz	x5, .L3314
	ldr	x1, [x20, 1304]
	cbz	x1, .L3322
	mov	w2, 0
	.p2align 2
.L3316:
	ldp	w3, w0, [x1, 8]
	ldr	x1, [x1, 4056]
	add	w0, w3, w0
	add	w0, w0, 7
	add	w2, w2, w0, lsr 3
	mov	w4, w2
	cbnz	x1, .L3316
.L3315:
	add	x2, x29, 64
	ldr	w0, [x19, 120]
	mov	w1, 8
	mov	w3, 4
	str	w4, [x2, -8]!
	blr	x5
	ldr	x1, [x19, 224]
.L3317:
	add	x20, x20, 504
	str	x20, [x19, 232]
	ldr	w0, [x1, 880]
	cmp	w0, 1
	beq	.L3365
.L3318:
	cmp	w0, 2
	bne	.L3319
	ldr	w0, [x1, 884]
	cmp	w0, wzr
	ccmp	x20, xzr, 4, gt
	beq	.L3319
	ldrb	w20, [x21, 2196]
	cmp	w20, 2
	beq	.L3366
.L3319:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, 0
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3294:
	ldp	w0, w1, [x19, 140]
	ldr	x2, [x19, 224]
	add	w0, w0, 1
	cmp	w0, w1
	csel	w0, w0, w1, ge
	str	w0, [x19, 140]
	sub	w0, w0, w1
	str	w0, [x2, 592]
	b	.L3295
	.p2align 3
.L3300:
	mov	x0, x19
	mov	w21, -1
	bl	MVC_ClearAllSlice
	add	x0, x19, 11120640
	ldr	w4, [x19, 40]
	mov	w1, 7
	mov	w3, 23352
	movk	w3, 0x1, lsl 16
	mov	w2, 2
	strb	w1, [x0, 19]
	mov	w1, 32
	strb	wzr, [x0, 16]
	strb	w2, [x0, 17]
	strb	w1, [x0, 18]
	stp	w4, w3, [x0, 28]
	str	w20, [x0, 40]
.L3356:
	mov	w2, 1048576
	mov	w1, w21
	stp	w21, wzr, [x0, 44]
	stp	wzr, w2, [x0, 52]
	mov	x0, x19
	bl	MVC_ClearDPB
	mov	w0, w21
.L3351:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3299:
	ldrb	w0, [x21, 2196]
	cbnz	w0, .L3304
	ldr	w0, [x19, 64]
	cbz	w0, .L3320
	ldr	x1, [x19, 864]
	ldr	w1, [x1, 48]
	cbz	w1, .L3320
.L3304:
	mov	w1, 1
	mov	x0, x19
	strb	w1, [x21, 2191]
	b	.L3357
	.p2align 3
.L3361:
	ldrb	w0, [x21, 2196]
	cmp	w0, 2
	bne	.L3307
	ldr	w0, [x21, 2760]
	cbz	w0, .L3304
	ldrb	w0, [x19, 11]
	cmp	w0, 1
	bne	.L3307
.L3321:
	ldrb	w1, [x21, 2197]
	strb	w1, [x19, 11]
	ldr	w0, [x19, 64]
	b	.L3308
	.p2align 3
.L3313:
	add	x0, x19, 11124736
	ldr	w0, [x0, 412]
	cbnz	w0, .L3314
	ldr	x1, [x19, 224]
	ldr	w0, [x1, 12]
	cmp	w0, 2
	beq	.L3317
.L3358:
	mov	x0, x19
.L3357:
	bl	MVC_ClearAllSlice
	add	x1, x19, 11120640
	ldr	w8, [x19, 40]
	mov	w7, 23352
	mov	w6, 2
	movk	w7, 0x1, lsl 16
	mov	w0, -1
	mov	w5, 7
	mov	w4, 32
	mov	w3, 3
	mov	w2, 1048576
	strb	wzr, [x1, 16]
	strb	w6, [x1, 17]
	stp	w8, w7, [x1, 28]
.L3355:
	strb	w5, [x1, 19]
	strb	w4, [x1, 18]
	stp	w3, w0, [x1, 40]
	stp	wzr, wzr, [x1, 48]
	str	w2, [x1, 56]
	b	.L3351
	.p2align 3
.L3363:
	ldrb	w22, [x19, 7]
	cmp	w22, 2
	bne	.L3311
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 12]
	cbnz	w0, .L3311
	ldr	x2, .LC889
	mov	w1, 6612
	ldr	w4, [x21, 2760]
	mov	w0, 1
	ldr	w3, [x21, 2764]
	mov	w20, -1
	bl	dprint_normal
	mov	x0, x19
	bl	MVC_ClearAllSlice
	add	x0, x19, 11120640
	ldr	w4, [x19, 40]
	mov	w2, 7
	mov	w1, 32
	mov	w3, 23352
	strb	w2, [x0, 19]
	movk	w3, 0x1, lsl 16
	strb	w1, [x0, 18]
	mov	w2, 3
	strb	wzr, [x0, 16]
	mov	w1, 1048576
	stp	w2, w20, [x0, 40]
	strb	w22, [x0, 17]
	mov	w2, 0
	stp	w4, w3, [x0, 28]
	stp	wzr, wzr, [x0, 48]
	str	w1, [x0, 56]
	ldr	x1, [x21, 2736]
	ldr	w0, [x19, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetDisplay
	mov	w0, w20
	b	.L3351
	.p2align 3
.L3364:
	ldr	w1, [x21, 2824]
	cbnz	w1, .L3311
	strb	w0, [x19, 7]
	b	.L3311
	.p2align 3
.L3314:
	ldr	x1, [x19, 224]
	add	x20, x20, 504
	str	x20, [x19, 232]
	ldr	w0, [x1, 880]
	cmp	w0, 1
	bne	.L3318
.L3365:
	cbz	x20, .L3319
	ldrb	w20, [x21, 2196]
	cmp	w20, 2
	bne	.L3319
	str	xzr, [x19, 232]
	mov	w2, 0
	ldr	w0, [x19, 120]
	ldr	x1, [x21, 2736]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetDisplay
	mov	x0, x19
.L3354:
	bl	MVC_ClearAllSlice
	add	x1, x19, 11120640
	ldr	w7, [x19, 40]
	mov	w6, 23352
	mov	w0, -1
	movk	w6, 0x1, lsl 16
	mov	w5, 7
	mov	w4, 32
	mov	w3, 3
	mov	w2, 1048576
	strb	wzr, [x1, 16]
	strb	w20, [x1, 17]
	stp	w7, w6, [x1, 28]
	b	.L3355
	.p2align 3
.L3362:
	ldrb	w0, [x21, 2196]
	cmp	w0, 2
	beq	.L3321
	b	.L3307
.L3366:
	str	xzr, [x19, 232]
	mov	w2, 0
	ldr	w0, [x19, 120]
	ldr	x1, [x21, 2736]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetDisplay
	ldr	x2, [x19, 224]
	mov	x0, x19
	ldr	w1, [x2, 884]
	sub	w1, w1, #1
	str	w1, [x2, 884]
	b	.L3354
	.p2align 3
.L3322:
	mov	w4, 0
	b	.L3315
.L3360:
	ldr	x2, .LC887
	mov	w3, w20
	mov	w1, 6524
	mov	w0, 3
	mov	w21, -1
	bl	dprint_normal
	strb	w20, [x19, 8]
	mov	x0, x19
	bl	MVC_ClearAllSlice
	add	x0, x19, 11120640
	ldr	w4, [x19, 40]
	mov	w2, 2
	mov	w1, 7
	mov	w3, 23352
	movk	w3, 0x1, lsl 16
	strb	w2, [x0, 17]
	strb	w1, [x0, 19]
	mov	w2, 32
	mov	w1, 3
	strb	wzr, [x0, 16]
	strb	w2, [x0, 18]
	stp	w4, w3, [x0, 28]
	str	w1, [x0, 40]
	b	.L3356
	.size	MVC_DecVDM, .-MVC_DecVDM
	.align	3
.LC887:
	.xword	.LC886
	.align	3
.LC889:
	.xword	.LC888
	.align	3
.LC891:
	.xword	.LC890
	.align	3
.LC892:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ReceivePacket
	.type	MVC_ReceivePacket, %function
MVC_ReceivePacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 11157504
	bl	_mcount
	ldr	x2, .LC894
	mov	w1, 11124
	ldp	w4, w5, [x20, 16]
	ldr	x3, [x20, 8]
	mov	w0, 8
	bl	dprint_normal
	str	wzr, [x21, 1448]
	ldr	x0, [x19, 224]
	ldr	w1, [x0, 856]
	cmp	w1, 1
	beq	.L3432
.L3368:
	ldr	x0, [x19, 240]
	cbz	x0, .L3373
	ldrb	w1, [x20]
	cmp	w1, 1
	beq	.L3433
.L3371:
	ldr	x2, .LC896
	mov	w1, 11135
	mov	w0, 1
	bl	dprint_normal
	ldr	x1, [x19, 240]
	cbz	x1, .L3373
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L3373:
	ldr	w0, [x20, 20]
	cmp	w0, wzr
	ble	.L3375
	ldr	x0, [x20, 8]
	cbz	x0, .L3375
	ldr	w0, [x20, 16]
	cbz	w0, .L3375
	ldrb	w0, [x19, 1521]
	cbz	w0, .L3393
	add	x1, x19, 1617
	mov	x0, 1
	b	.L3378
	.p2align 3
.L3377:
	add	w0, w0, 1
	cmp	w0, 137
	beq	.L3391
.L3378:
	ldrb	w2, [x1]
	add	x1, x1, 96
	cbnz	w2, .L3377
	sxtw	x1, w0
.L3376:
	lsl	x2, x0, 2
	mov	w3, 1
	sub	x0, x2, x0
	cmn	w1, #1
	add	x0, x19, x0, lsl 5
	strb	w3, [x0, 1521]
	beq	.L3391
	lsl	x0, x1, 2
	mov	w2, 1
	sub	x0, x0, x1
	lsl	x0, x0, 5
	add	x1, x0, 1520
	add	x0, x19, x0
	add	x1, x19, x1
	str	x1, [x19, 240]
	ldr	x1, [x20, 8]
	str	x1, [x0, 1528]
	ldr	w1, [x20, 20]
	str	w1, [x0, 1536]
	ldr	w1, [x20, 16]
	str	w1, [x0, 1540]
	ldr	x0, [x19, 240]
	str	wzr, [x0, 28]
	ldr	x0, [x19, 240]
	ldr	w1, [x20, 24]
	str	w1, [x0, 36]
	ldr	x0, [x19, 240]
	ldr	x1, [x20, 32]
	str	x1, [x0, 88]
	ldr	x0, [x19, 240]
	str	w2, [x0, 76]
	ldr	x0, [x19, 240]
	strb	wzr, [x0]
	ldr	x0, [x19, 240]
	ldrb	w1, [x20]
	strb	w1, [x0, 3]
	ldr	x0, [x19, 240]
	b	.L3383
	.p2align 3
.L3433:
	ldr	w2, [x0, 76]
	cmp	w2, 1
	bhi	.L3371
	ldrb	w2, [x0, 3]
	cmp	w2, 1
	bne	.L3372
	b	.L3371
	.p2align 3
.L3432:
	ldr	w0, [x0, 888]
	cbz	w0, .L3368
	ldr	x0, [x19, 240]
	cbz	x0, .L3373
	ldrb	w1, [x20]
.L3372:
	strb	w1, [x0, 3]
	ldr	x0, [x19, 224]
	ldr	w1, [x0, 856]
	cmp	w1, 1
	beq	.L3434
.L3385:
	ldr	w0, [x20, 20]
	cmp	w0, wzr
	ble	.L3386
	ldr	x1, [x20, 8]
	cbz	x1, .L3386
	ldr	w0, [x20, 16]
	cbz	w0, .L3386
	ldr	x0, [x19, 240]
	ldr	w2, [x0, 76]
	cmp	w2, 1
	bls	.L3435
.L3387:
	mov	w1, 1
	strb	w1, [x0, 3]
	ldr	w0, [x19, 120]
	ldr	w1, [x20, 24]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC899
	ldr	x4, [x0]
	cbz	x4, .L3429
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L3429:
	ldr	x0, [x19, 240]
.L3383:
	ldrb	w0, [x0, 3]
	ldp	x19, x20, [sp, 16]
	cmp	w0, wzr
	ldr	x21, [sp, 32]
	csetm	w0, eq
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3375:
	ldr	x2, .LC901
	mov	w1, 11173
	mov	w0, 1
	bl	dprint_normal
	ldr	w0, [x19, 120]
	ldr	w1, [x20, 24]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC899
	ldr	x4, [x0]
	cbz	x4, .L3431
.L3430:
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L3431:
	mov	w0, -1
.L3438:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3386:
	ldr	x0, [x19, 240]
	b	.L3387
	.p2align 3
.L3434:
	ldr	w0, [x0, 888]
	cbnz	w0, .L3429
	b	.L3385
	.p2align 3
.L3435:
	ubfiz	x2, x2, 5, 32
	add	x0, x0, x2
	str	x1, [x0, 8]
	ldr	x1, [x19, 240]
	ldr	w2, [x20, 20]
	ldr	w0, [x1, 76]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 16]
	ldr	x1, [x19, 240]
	ldr	w2, [x20, 16]
	ldr	w0, [x1, 76]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 20]
	ldr	x1, [x19, 240]
	ldr	w0, [x1, 76]
	add	x0, x1, x0, lsl 5
	str	wzr, [x0, 28]
	ldr	x1, [x19, 240]
	ldr	w2, [x20, 24]
	ldr	w0, [x1, 76]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 36]
	ldr	x1, [x19, 240]
	ldr	w0, [x1, 76]
	add	w0, w0, 1
	str	w0, [x1, 76]
	ldr	x0, [x19, 240]
	ldr	w1, [x0, 16]
	cmp	w1, 4095
	bls	.L3436
.L3388:
	mov	w1, 1
	str	w1, [x21, 1448]
	b	.L3383
	.p2align 3
.L3436:
	mov	x0, x19
	bl	MVC_CombinePacket.part.11
	ldr	x0, [x19, 240]
	b	.L3388
.L3391:
	ldr	x2, .LC898
	mov	w1, 11149
	mov	w0, 0
	add	x21, x19, 12288
	add	x20, x19, 1520
	add	x21, x21, 2384
	bl	dprint_normal
	b	.L3380
	.p2align 3
.L3379:
	add	x20, x20, 96
	cmp	x21, x20
	beq	.L3437
.L3380:
	ldrb	w0, [x20, 1]
	cmp	w0, 1
	bne	.L3379
	ldr	w0, [x19, 120]
	mov	x1, x20
	bl	MVC_ReleaseNAL
	b	.L3379
.L3437:
	mov	x0, x19
	mov	w20, -1
	bl	MVC_ClearAllSlice
	add	x0, x19, 11120640
	mov	w2, 2
	mov	w1, 7
	ldr	w4, [x19, 40]
	mov	w3, 23352
	strb	w2, [x0, 17]
	mov	w2, 32
	strb	w1, [x0, 19]
	mov	w1, 3
	strb	w2, [x0, 18]
	movk	w3, 0x1, lsl 16
	stp	w1, w20, [x0, 40]
	stp	w4, w3, [x0, 28]
	strb	wzr, [x0, 16]
	mov	w2, 1048576
	stp	wzr, wzr, [x0, 48]
	str	w2, [x0, 56]
	mov	w1, w20
	mov	x0, x19
	bl	MVC_ClearDPB
	ldr	x0, .LC899
	ldr	x4, [x0]
	cbnz	x4, .L3430
	mov	w0, -1
	b	.L3438
.L3393:
	mov	x1, 0
	mov	x0, 0
	b	.L3376
	.size	MVC_ReceivePacket, .-MVC_ReceivePacket
	.align	3
.LC894:
	.xword	.LC893
	.align	3
.LC896:
	.xword	.LC895
	.align	3
.LC898:
	.xword	.LC897
	.align	3
.LC899:
	.xword	g_EventReportFunc
	.align	3
.LC901:
	.xword	.LC900
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ClearAll
	.type	MVC_ClearAll, %function
MVC_ClearAll:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	w22, w1
	mov	x0, x30
	add	x1, x20, 11120640
	mov	x23, x1
	str	x1, [x29, 104]
	bl	_mcount
	add	x21, x20, 12288
	ldr	x2, .LC903
	mov	w1, 274
	mov	w0, 20
	add	x19, x20, 1520
	add	x21, x21, 2384
	bl	dprint_normal
	mov	x0, x20
	bl	MVC_ClearAllSlice
	mov	w1, 23352
	ldr	w2, [x20, 40]
	movk	w1, 0x1, lsl 16
	mov	w0, 7
	stp	w2, w1, [x23, 28]
	mov	w4, 2
	mov	w3, 32
	strb	w0, [x23, 19]
	mov	w2, 3
	mov	w0, 1048576
	mov	w1, -1
	strb	wzr, [x23, 16]
	strb	w4, [x23, 17]
	strb	w3, [x23, 18]
	stp	wzr, wzr, [x23, 48]
	str	w0, [x23, 56]
	stp	w2, w1, [x23, 40]
	b	.L3441
	.p2align 3
.L3440:
	add	x19, x19, 96
	cmp	x19, x21
	beq	.L3472
.L3441:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L3440
	ldr	w0, [x20, 120]
	mov	x1, x19
	add	x19, x19, 96
	bl	MVC_ReleaseNAL
	cmp	x19, x21
	bne	.L3441
.L3472:
	cbz	x20, .L3444
	mov	x0, x20
	bl	MVC_ClearAllSlice
	mov	x0, x20
	bl	MVC_InitDPB.part.15
	cbnz	w0, .L3444
.L3443:
	cbz	w22, .L3445
	ldr	w0, [x20, 120]
	add	x1, x20, 912
	bl	FSP_ClearNotInVoQueue
.L3446:
	mov	x25, x20
	mov	w28, 0
	mov	w26, -1
	mov	w21, 1
	mov	w24, 18
	mov	w23, 16
	mov	w22, 2
	.p2align 2
.L3449:
	add	x0, x25, 11124736
	add	x2, x0, 768
	add	x1, x0, 776
	add	x19, x0, 1016
	add	x27, x0, 1048
	strb	wzr, [x0, 777]
	strb	wzr, [x0, 778]
	strb	wzr, [x0, 779]
	strb	wzr, [x0, 781]
	strb	w21, [x0, 783]
	strb	wzr, [x0, 1384]
	strb	w21, [x0, 1432]
	strb	w22, [x0, 1480]
	stp	wzr, w26, [x2, 28]
	stp	wzr, wzr, [x2, 36]
	str	w24, [x0, 824]
	str	w23, [x0, 828]
	str	w28, [x0, 936]
	str	x1, [x0, 1392]
	str	x1, [x0, 1440]
	str	x1, [x0, 1488]
.L3448:
	ldr	x1, [x19]
	cbnz	x1, .L3473
.L3447:
	add	x19, x19, 8
	cmp	x19, x27
	bne	.L3448
	add	w28, w28, 1
	add	x25, x25, 752
	cmp	w28, 40
	bne	.L3449
	add	x22, x20, 11153408
	add	x19, x22, 2368
	add	x21, x22, 2400
.L3451:
	ldr	x1, [x19]
	cbnz	x1, .L3474
.L3450:
	add	x19, x19, 8
	cmp	x21, x19
	bne	.L3451
	ldr	w2, [x20, 60]
	mov	w19, 0
	cbz	w2, .L3455
	.p2align 2
.L3462:
	add	x21, x20, x19, uxtw 3
	add	w19, w19, 1
	ldr	x0, [x21, 832]
	mov	x1, x0
	cbz	x0, .L3453
	ldr	w0, [x20, 120]
	bl	FreeUsdByDec
	str	xzr, [x21, 832]
	ldr	w2, [x20, 60]
.L3453:
	cmp	w2, w19
	bhi	.L3462
.L3455:
	ldr	x0, .LC906
	mov	x2, 1656
	strb	wzr, [x20, 4]
	mov	w1, 0
	strb	wzr, [x20, 9]
	strb	wzr, [x20, 6]
	strb	wzr, [x20, 7]
	strb	wzr, [x20, 3]
	stp	wzr, wzr, [x20, 60]
	str	wzr, [x20, 104]
	ldr	x3, [x0, 96]
	ldr	x0, [x29, 104]
	str	wzr, [x20, 220]
	str	xzr, [x20, 240]
	add	x20, x20, 11116544
	strb	wzr, [x0, 2068]
	strb	wzr, [x0, 64]
	strb	wzr, [x0, 2069]
	strb	wzr, [x0, 65]
	add	x0, x20, 2456
	blr	x3
	mov	w1, 2
	mov	w0, 1
	strb	w1, [x20, 2456]
	strb	w0, [x20, 2461]
	mov	w0, 256
	strb	wzr, [x22, 2184]
	str	w0, [x22, 3488]
	mov	w0, 0
	strb	wzr, [x22, 3480]
	str	wzr, [x22, 3484]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3473:
	ldr	w0, [x20, 120]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L3447
.L3474:
	ldr	w0, [x20, 120]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L3450
.L3445:
	add	x0, x20, 912
	bl	ResetVoQueue
	ldr	w0, [x20, 120]
	bl	FSP_ResetInstance
	b	.L3446
.L3444:
	ldr	x3, .LC904
	mov	w4, 283
	ldr	x2, .LC905
	mov	w1, w4
	add	x3, x3, 360
	mov	w0, 20
	bl	dprint_normal
	b	.L3443
	.size	MVC_ClearAll, .-MVC_ClearAll
	.align	3
.LC903:
	.xword	.LC902
	.align	3
.LC904:
	.xword	.LANCHOR1
	.align	3
.LC905:
	.xword	.LC884
	.align	3
.LC906:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_InsertFrmInDPB
	.type	MVC_InsertFrmInDPB, %function
MVC_InsertFrmInDPB:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	mov	w20, w1
	mov	x19, x2
	bl	_mcount
	cmp	w20, 15
	bhi	.L3573
	add	x0, x22, 11124736
	ldr	w0, [x0, 412]
	cbz	w0, .L3574
	ldrb	w21, [x19, 3]
	cmp	w21, 1
	beq	.L3480
.L3577:
	cbz	w21, .L3481
	cmp	w21, 2
	bne	.L3575
	ldr	x0, [x19, 552]
	mov	w1, 3
	uxtw	x23, w20
	strb	w1, [x0, 608]
	ldrb	w0, [x19, 1]
	cbz	w0, .L3499
	add	x20, x22, x23, lsl 3
	add	x20, x20, 11124736
	ldr	x0, [x20, 24]
	cbz	x0, .L3499
	strb	w21, [x0, 704]
	ldr	x0, [x20, 24]
	ldr	x1, [x19, 552]
	str	x1, [x0, 712]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 4]
	strb	w1, [x0, 705]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 5]
	strb	w1, [x0, 706]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 592]
	str	w1, [x0, 728]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 12]
	strb	w1, [x0, 707]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 612]
	str	w1, [x0, 736]
	ldr	x0, [x20, 24]
	ldr	w2, [x0, 688]
	ldr	w1, [x0, 736]
	add	w1, w2, w1
	str	w1, [x0, 44]
	str	w1, [x0, 640]
	ldr	x1, [x20, 24]
	ldrb	w0, [x1, 1]
	cbz	w0, .L3505
	ldrb	w0, [x19, 2]
.L3505:
	strb	w0, [x1, 1]
	ldr	x1, [x20, 24]
	ldrb	w0, [x1, 2]
	orr	w0, w0, 2
	strb	w0, [x1, 2]
	ldrb	w0, [x19, 7]
	ldr	x1, [x20, 24]
	cmp	w0, 1
	beq	.L3576
	ldrb	w0, [x1, 4]
.L3507:
	strb	w0, [x1, 4]
	mov	x2, 536
	add	x1, x19, 16
	ldr	x0, [x20, 24]
	ldp	x25, x24, [x0, 280]
	ldr	x21, [x0, 296]
	add	x0, x0, 72
	bl	memcpy
	cmn	x25, #1
	beq	.L3508
	ldr	x0, [x20, 24]
	str	x25, [x0, 280]
.L3508:
	ldr	x0, [x19, 232]
	ldr	x1, [x20, 24]
	cmp	x0, x24
	csel	x0, x0, x24, ls
	str	x0, [x1, 288]
	ldr	x0, [x19, 240]
	ldr	x1, [x20, 24]
	cmp	x0, x21
	csel	x0, x0, x21, ls
	str	x0, [x1, 296]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3509
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3509
.L3510:
	ldr	x1, [x20, 24]
	ldrb	w2, [x1, 707]
	ldrb	w0, [x1, 659]
	cmp	w0, w2, uxtb
	csel	w0, w0, w2, cs
	strb	w0, [x1]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 608]
	str	w1, [x0, 732]
	ldr	x1, [x20, 24]
	ldr	w0, [x1, 684]
	ldr	w2, [x1, 732]
	cmp	w0, w2
	csel	w0, w0, w2, le
	str	w0, [x1, 36]
	ldr	x0, [x20, 24]
	bl	MVC_CombineFldsToFrm
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 11]
	strb	w1, [x0, 13]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 10]
	strb	w1, [x0, 11]
	ldr	x1, [x20, 24]
	ldr	w0, [x1, 52]
	ldr	w1, [x1, 728]
	add	x0, x0, 2781184
	add	x0, x0, 144
	str	w1, [x22, x0, lsl 2]
	b	.L3498
	.p2align 3
.L3574:
	ldr	x0, .LC909
	ldrb	w21, [x19, 3]
	str	wzr, [x0, 1948]
	cmp	w21, 1
	bne	.L3577
.L3480:
	ldr	x0, [x19, 552]
	mov	w1, 3
	uxtw	x23, w20
	strb	w1, [x0, 608]
	ldrb	w0, [x19, 1]
	cbz	w0, .L3486
	add	x20, x22, x23, lsl 3
	add	x20, x20, 11124736
	ldr	x0, [x20, 24]
	cbz	x0, .L3486
	strb	w21, [x0, 656]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 12]
	strb	w1, [x0, 659]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 4]
	strb	w1, [x0, 657]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 5]
	strb	w1, [x0, 658]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 588]
	str	w1, [x0, 680]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 12]
	strb	w1, [x0, 659]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 612]
	str	w1, [x0, 688]
	ldr	x0, [x20, 24]
	ldr	w2, [x0, 688]
	ldr	w1, [x0, 736]
	add	w1, w2, w1
	str	w1, [x0, 44]
	str	w1, [x0, 640]
	ldr	x1, [x20, 24]
	ldrb	w0, [x1, 1]
	cbz	w0, .L3491
	ldrb	w0, [x19, 2]
.L3491:
	strb	w0, [x1, 1]
	ldr	x1, [x20, 24]
	ldrb	w0, [x1, 2]
	orr	w0, w0, 1
	strb	w0, [x1, 2]
	ldrb	w0, [x19, 7]
	ldr	x1, [x20, 24]
	cmp	w0, 1
	beq	.L3578
	ldrb	w0, [x1, 4]
.L3493:
	strb	w0, [x1, 4]
	mov	x2, 536
	add	x1, x19, 16
	ldr	x0, [x20, 24]
	ldp	x25, x24, [x0, 280]
	ldr	x21, [x0, 296]
	add	x0, x0, 72
	bl	memcpy
	ldr	x0, [x19, 224]
	cmn	x0, #1
	ccmn	x25, #1, 4, eq
	beq	.L3494
	ldr	x0, [x20, 24]
	str	x25, [x0, 280]
.L3494:
	ldr	x0, [x19, 232]
	ldr	x1, [x20, 24]
	cmp	x0, x24
	csel	x0, x0, x24, ls
	str	x0, [x1, 288]
	ldr	x0, [x19, 240]
	ldr	x1, [x20, 24]
	cmp	x0, x21
	csel	x0, x0, x21, ls
	str	x0, [x1, 296]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3495
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3495
.L3496:
	ldr	x1, [x20, 24]
	ldrb	w2, [x1, 707]
	ldrb	w0, [x1, 659]
	cmp	w0, w2, uxtb
	csel	w0, w0, w2, cs
	strb	w0, [x1]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 604]
	str	w1, [x0, 684]
	ldr	x1, [x20, 24]
	ldr	w0, [x1, 684]
	ldr	w2, [x1, 732]
	cmp	w0, w2
	csel	w0, w0, w2, le
	str	w0, [x1, 36]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 11]
	strb	w1, [x0, 12]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 10]
	strb	w1, [x0, 10]
	ldr	x0, [x20, 24]
	bl	MVC_CombineFldsToFrm
	ldr	x1, [x20, 24]
	ldr	w0, [x1, 52]
	ldr	w1, [x1, 680]
	add	x0, x0, 2781184
	add	x0, x0, 128
	str	w1, [x22, x0, lsl 2]
	b	.L3498
	.p2align 3
.L3481:
	uxtw	x23, w20
	ldr	x1, [x19, 552]
	mov	w2, 3
	mov	w0, 3
	add	x20, x22, x23, lsl 3
	add	x20, x20, 11124736
	str	x1, [x20, 24]
	ldrb	w3, [x19, 2]
	strb	w3, [x1, 1]
	ldr	x1, [x20, 24]
	strb	w2, [x1, 2]
	ldr	x2, [x19, 552]
	ldr	x1, [x20, 24]
	ldrb	w2, [x2, 5]
	strb	w2, [x1, 5]
	ldr	x2, [x19, 552]
	ldr	x1, [x20, 24]
	ldrb	w2, [x2, 7]
	strb	w2, [x1, 7]
	ldrb	w2, [x19, 4]
	ldr	x1, [x20, 24]
	cbz	w2, .L3579
.L3483:
	strb	w0, [x1, 3]
	mov	x2, 536
	add	x1, x19, 16
	mov	w21, 3
	ldr	x0, [x20, 24]
	ldr	w3, [x19, 636]
	str	w3, [x0, 48]
	ldr	x0, [x20, 24]
	add	x0, x0, 72
	bl	memcpy
	ldr	x0, [x20, 24]
	mov	w6, 1
	ldr	w1, [x19, 612]
	str	w1, [x0, 44]
	str	w1, [x0, 640]
	ldr	x0, [x20, 24]
	ldr	x1, [x19, 552]
	str	x1, [x0, 616]
	str	x1, [x0, 664]
	str	x1, [x0, 712]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 572]
	str	w1, [x0, 28]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 568]
	str	w1, [x0, 20]
	ldr	x0, [x20, 24]
	strb	wzr, [x0, 608]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 4]
	strb	w1, [x0, 609]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 5]
	strb	w1, [x0, 610]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 12]
	strb	w1, [x0, 611]
	strb	w1, [x0]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 9]
	str	w1, [x0, 40]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 580]
	str	w1, [x0, 32]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 584]
	str	w1, [x0, 632]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 588]
	str	w1, [x0, 680]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 592]
	str	w1, [x0, 728]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 596]
	str	w1, [x0, 36]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 600]
	str	w1, [x0, 636]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 604]
	str	w1, [x0, 684]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 608]
	str	w1, [x0, 732]
	ldrb	w1, [x19, 7]
	ldr	x0, [x20, 24]
	cmp	w1, 1
	csel	w21, wzr, w21, ne
	strb	w21, [x0, 4]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 640]
	str	w1, [x0, 56]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 644]
	str	w1, [x0, 60]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 11]
	strb	w1, [x0, 13]
	strb	w1, [x0, 12]
	ldr	x1, .LC909
	ldr	x2, [x20, 24]
	ldrb	w3, [x19, 10]
	ldr	w0, [x1, 1948]
	strb	w3, [x2, 11]
	strb	w3, [x2, 10]
	add	w2, w0, 1
	str	w2, [x1, 1948]
	ldr	x1, [x20, 24]
	str	w0, [x1, 64]
	ldr	x0, [x20, 24]
	ldrb	w3, [x0, 610]
	ldrb	w2, [x0, 611]
	ldr	x1, [x0, 616]
	ldrb	w4, [x0, 609]
	ldr	w5, [x0, 640]
	strb	w3, [x0, 658]
	strb	w2, [x0, 659]
	strb	w3, [x0, 706]
	strb	w2, [x0, 707]
	mov	w2, 0
	str	x1, [x0, 664]
	str	x1, [x0, 712]
	mov	w1, 2
	strb	w4, [x0, 657]
	strb	w6, [x0, 656]
	strb	w4, [x0, 705]
	str	w5, [x0, 688]
	str	w5, [x0, 736]
	strb	w1, [x0, 704]
	mov	x0, x22
	ldr	x1, [x19, 552]
	bl	MVC_GetAPC
	mov	w3, 1804
	cbnz	w0, .L3571
.L3498:
	add	x1, x23, 1388544
	mov	w19, 0
	add	x1, x22, x1, lsl 3
	ldr	x0, [x1, 16408]
	ldrb	w1, [x0, 3]
	cbz	w1, .L3477
	ldrsb	w1, [x0, 6]
	mov	w2, 1
	ldr	w0, [x22, 120]
	bl	FSP_SetRef
.L3477:
	mov	w0, w19
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3575:
	ldr	x2, .LC913
	mov	w3, w21
	mov	w1, 2056
	mov	w0, 0
	mov	w19, 0
	bl	dprint_normal
	mov	w1, 1
	mov	x0, x22
	bl	MVC_ClearAll
	ldr	x25, [sp, 64]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3486:
	add	x20, x22, x23, lsl 3
	ldr	x0, [x19, 552]
	add	x20, x20, 11124736
	mov	w1, 1
	str	x0, [x20, 24]
	strb	w1, [x0, 656]
	ldr	x0, [x20, 24]
	ldr	x2, [x19, 552]
	str	x2, [x0, 664]
	ldr	x0, [x20, 24]
	ldrb	w2, [x19, 4]
	strb	w2, [x0, 657]
	ldr	x0, [x20, 24]
	ldrb	w2, [x19, 5]
	strb	w2, [x0, 658]
	ldr	x0, [x20, 24]
	ldr	w2, [x19, 588]
	str	w2, [x0, 680]
	ldr	x0, [x20, 24]
	ldrb	w2, [x19, 12]
	strb	w2, [x0, 659]
	ldr	x0, [x20, 24]
	ldr	w2, [x19, 612]
	str	w2, [x0, 688]
	ldr	x0, [x20, 24]
	ldr	w2, [x0, 688]
	str	w2, [x0, 44]
	str	w2, [x0, 640]
	ldr	x0, [x20, 24]
	ldrb	w2, [x19, 2]
	strb	w2, [x0, 1]
	ldr	x0, [x20, 24]
	strb	w1, [x0, 2]
	ldr	x1, [x19, 552]
	ldr	x0, [x20, 24]
	ldrb	w1, [x1, 5]
	strb	w1, [x0, 5]
	ldr	x1, [x19, 552]
	ldr	x0, [x20, 24]
	ldrb	w1, [x1, 7]
	strb	w1, [x0, 7]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3488
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3488
.L3489:
	ldr	x0, [x20, 24]
	mov	x2, 536
	add	x1, x19, 16
	str	wzr, [x0, 40]
	ldr	x0, [x20, 24]
	add	x0, x0, 72
	bl	memcpy
	ldr	x0, [x20, 24]
	mov	w2, 1
	ldr	w1, [x19, 636]
	ldr	x3, .LC909
	str	w1, [x0, 48]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 568]
	str	w1, [x0, 20]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 580]
	str	w1, [x0, 32]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 596]
	str	w1, [x0, 36]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 12]
	strb	w1, [x0]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 604]
	str	w1, [x0, 684]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 640]
	str	w1, [x0, 56]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 644]
	str	w1, [x0, 60]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 11]
	strb	w1, [x0, 12]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 10]
	strb	w1, [x0, 10]
	mov	x0, x22
	ldr	x4, [x20, 24]
	ldr	w1, [x3, 1948]
	str	w1, [x4, 64]
	add	w5, w1, w2
	str	w5, [x3, 1948]
	ldr	x1, [x20, 24]
	ldrb	w3, [x19, 7]
	cmp	w3, w2
	cset	w3, eq
	strb	w3, [x1, 4]
	ldr	x1, [x19, 552]
	bl	MVC_GetAPC
	cbz	w0, .L3498
	mov	w3, 1866
.L3571:
	ldr	x2, .LC911
	mov	w1, w3
	mov	w4, w0
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x22
	bl	MVC_ClearDPB
	b	.L3477
	.p2align 3
.L3499:
	add	x20, x22, x23, lsl 3
	ldr	x0, [x19, 552]
	add	x20, x20, 11124736
	mov	w1, 2
	str	x0, [x20, 24]
	strb	w1, [x0, 704]
	ldr	x0, [x20, 24]
	ldr	x2, [x19, 552]
	str	x2, [x0, 712]
	ldr	x0, [x20, 24]
	ldrb	w2, [x19, 4]
	strb	w2, [x0, 705]
	ldr	x0, [x20, 24]
	ldrb	w2, [x19, 5]
	strb	w2, [x0, 706]
	ldr	x0, [x20, 24]
	ldr	w2, [x19, 592]
	str	w2, [x0, 728]
	ldr	x0, [x20, 24]
	ldrb	w2, [x19, 12]
	strb	w2, [x0, 707]
	ldr	x0, [x20, 24]
	ldr	w2, [x19, 612]
	str	w2, [x0, 736]
	ldr	x0, [x20, 24]
	ldr	w2, [x0, 688]
	str	w2, [x0, 44]
	str	w2, [x0, 640]
	ldr	x0, [x20, 24]
	ldrb	w2, [x19, 2]
	strb	w2, [x0, 1]
	ldr	x0, [x20, 24]
	strb	w1, [x0, 2]
	ldr	x1, [x19, 552]
	ldr	x0, [x20, 24]
	ldrb	w1, [x1, 5]
	strb	w1, [x0, 5]
	ldr	x1, [x19, 552]
	ldr	x0, [x20, 24]
	ldrb	w1, [x1, 7]
	strb	w1, [x0, 7]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3501
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3501
.L3502:
	ldr	x0, [x20, 24]
	mov	x2, 536
	add	x1, x19, 16
	str	wzr, [x0, 40]
	ldr	x0, [x20, 24]
	add	x0, x0, 72
	bl	memcpy
	ldr	x0, [x20, 24]
	mov	w2, 2
	ldr	w1, [x19, 636]
	str	w1, [x0, 48]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 568]
	str	w1, [x0, 20]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 580]
	str	w1, [x0, 32]
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 596]
	str	w1, [x0, 36]
	ldr	x0, [x20, 24]
	ldrb	w1, [x19, 12]
	strb	w1, [x0, 707]
	strb	w1, [x0]
	mov	x0, x22
	ldr	x1, [x20, 24]
	ldr	w3, [x19, 608]
	str	w3, [x1, 732]
	ldr	x1, [x20, 24]
	ldr	w3, [x19, 640]
	str	w3, [x1, 56]
	ldr	x1, [x20, 24]
	ldr	w3, [x19, 644]
	str	w3, [x1, 60]
	ldr	x1, [x20, 24]
	ldrb	w3, [x19, 11]
	strb	w3, [x1, 13]
	ldr	x1, [x20, 24]
	ldrb	w3, [x19, 10]
	strb	w3, [x1, 11]
	ldr	x4, [x20, 24]
	ldr	x3, .LC909
	ldr	w1, [x3, 1948]
	str	w1, [x4, 64]
	add	w1, w1, 1
	str	w1, [x3, 1948]
	ldrb	w3, [x19, 7]
	ldr	x1, [x20, 24]
	cmp	w3, 1
	csel	w21, w21, wzr, eq
	strb	w21, [x1, 4]
	ldr	x1, [x19, 552]
	bl	MVC_GetAPC
	mov	w3, 1989
	cbz	w0, .L3498
	b	.L3571
	.p2align 3
.L3579:
	ldrb	w0, [x19, 5]
	mov	w2, 3
	cmp	w0, wzr
	csel	w0, w0, w2, eq
	b	.L3483
	.p2align 3
.L3488:
	ldr	x0, [x20, 24]
	mov	w1, 1
	strb	w1, [x0, 3]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3489
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 572]
	str	w1, [x0, 28]
	b	.L3489
	.p2align 3
.L3501:
	ldr	x0, [x20, 24]
	mov	w1, 2
	strb	w1, [x0, 3]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3502
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 572]
	str	w1, [x0, 28]
	b	.L3502
	.p2align 3
.L3495:
	ldr	x1, [x20, 24]
	ldrb	w0, [x1, 3]
	orr	w0, w0, 1
	strb	w0, [x1, 3]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3496
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 572]
	str	w1, [x0, 28]
	b	.L3496
	.p2align 3
.L3509:
	ldr	x1, [x20, 24]
	ldrb	w0, [x1, 3]
	orr	w0, w0, 2
	strb	w0, [x1, 3]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3510
	ldr	x0, [x20, 24]
	ldr	w1, [x19, 572]
	str	w1, [x0, 28]
	b	.L3510
	.p2align 3
.L3576:
	ldrb	w0, [x1, 4]
	orr	w0, w0, 2
	uxtb	w0, w0
	b	.L3507
	.p2align 3
.L3578:
	ldrb	w0, [x1, 4]
	orr	w0, w0, 1
	uxtb	w0, w0
	b	.L3493
	.p2align 3
.L3573:
	ldr	x4, .LC907
	mov	w3, 1749
	ldr	x2, .LC908
	mov	w5, w20
	add	x4, x4, 376
	mov	w1, w3
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L3477
	.size	MVC_InsertFrmInDPB, .-MVC_InsertFrmInDPB
	.align	3
.LC907:
	.xword	.LANCHOR1
	.align	3
.LC908:
	.xword	.LC871
	.align	3
.LC909:
	.xword	.LANCHOR4
	.align	3
.LC911:
	.xword	.LC910
	.align	3
.LC913:
	.xword	.LC912
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_AllocFrameStore
	.type	MVC_AllocFrameStore, %function
MVC_AllocFrameStore:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x25, x0
	mov	x0, x30
	add	x20, x25, 11116544
	mov	w21, w1
	bl	_mcount
	mov	w26, 0
	ldrb	w0, [x20, 2457]
	cbz	w0, .L3581
	ldrb	w0, [x20, 2458]
	mov	w26, 2
	cmp	w0, wzr
	csinc	w26, w26, wzr, ne
.L3581:
	cmp	w21, 1
	ldrb	w0, [x25, 8]
	beq	.L3582
	cmp	w0, 2
	add	x22, x25, 11153408
	beq	.L3677
	sub	w0, w26, #1
	strb	wzr, [x22, 2185]
	cmp	w0, 1
	bls	.L3681
.L3584:
	strb	wzr, [x22, 2184]
	ldr	w5, [x25, 48]
	cbz	w5, .L3609
	add	x4, x25, 11124736
	mov	x3, 0
	add	x19, x4, 776
	.p2align 2
.L3608:
	ldrb	w0, [x19, 2]
	cbnz	w0, .L3603
	cbz	x19, .L3604
	ldr	w0, [x4, 408]
	cbz	w0, .L3604
	ldr	x1, [x4, 24]
	cmp	x1, x19
	ccmp	x1, xzr, 4, eq
	bne	.L3603
	sub	w2, w0, #1
	add	x0, x4, 32
	add	x2, x2, 1388544
	add	x2, x2, 2052
	add	x2, x25, x2, lsl 3
	b	.L3606
	.p2align 3
.L3607:
	ldr	x1, [x0], 8
	cmp	x1, x19
	ccmp	x1, xzr, 4, eq
	bne	.L3603
.L3606:
	cmp	x0, x2
	bne	.L3607
.L3604:
	lsl	x23, x3, 2
	str	x19, [x22, 2736]
	sub	x23, x23, x3
	mov	w27, 1
	lsl	x23, x23, 4
	strb	w27, [x22, 2184]
	sub	x3, x23, x3
	add	x24, x22, 2200
	mov	w4, 101
	mov	x2, 536
	add	x23, x25, x3, lsl 4
	mov	x0, x24
	add	x23, x23, 11124736
	add	x1, x23, 848
	str	wzr, [x23, 820]
	str	w4, [x22, 2796]
	bl	memcpy
	str	wzr, [x22, 2296]
	strb	wzr, [x23, 780]
	strb	wzr, [x19, 7]
	ldr	x0, [x22, 2736]
	strb	wzr, [x0, 3]
	ldr	x0, [x22, 2736]
	strb	w27, [x0, 5]
	ldr	x0, [x22, 2736]
	str	wzr, [x0, 16]
	ldrb	w19, [x22, 2184]
	cmp	w19, 1
	bne	.L3609
	cmp	w21, wzr
	mov	w1, 3
	ldr	w0, [x25, 120]
	csel	w1, w1, wzr, ne
	bl	FSP_NewLogicFs
	mov	w23, w0
	mov	w1, w0
	ldr	w0, [x25, 120]
	bl	FSP_GetLogicFs
	mov	x27, x0
	cmp	w23, wzr
	ccmp	x0, xzr, 4, ge
	beq	.L3611
	ldr	x19, .LC918
	add	x1, x0, 56
	ldr	x0, [x22, 2736]
	mov	x2, 536
	ldr	x3, [x19, 104]
	add	x0, x0, 72
	blr	x3
	ldr	x1, [x22, 2736]
	mov	x0, x24
	ldr	x3, [x19, 104]
	mov	x2, 536
	add	x1, x1, 72
	blr	x3
	ldr	x0, [x22, 2736]
	strb	w23, [x0, 6]
	ldr	x0, [x27, 40]
	ldr	w0, [x0, 4]
	str	w0, [x22, 2820]
.L3602:
	uxtb	w1, w26
	cmp	w21, 1
	strb	w1, [x22, 2187]
	beq	.L3622
.L3687:
	ldrb	w0, [x20, 2457]
	mov	w3, 3
	ldr	x2, [x22, 2736]
	cmp	w0, wzr
	csel	w0, w0, w3, eq
	strb	w0, [x2, 608]
	ldrb	w0, [x22, 2185]
	cmp	w0, 1
	beq	.L3682
	strb	w1, [x22, 3480]
	add	x0, x25, 11120640
	ldr	w1, [x20, 2484]
	str	w1, [x22, 3488]
	ldrb	w1, [x20, 2464]
	str	w1, [x22, 3484]
	ldr	w1, [x25, 128]
	str	w1, [x22, 3492]
	ldr	w0, [x0]
	str	w0, [x22, 3504]
	str	w23, [x22, 3496]
	cbnz	w26, .L3683
	strb	wzr, [x22, 3481]
	mov	w0, 0
.L3671:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3603:
	add	w3, w3, 1
	add	x19, x19, 752
	cmp	w3, w5
	bne	.L3608
.L3609:
	ldr	x2, .LC917
	mov	w1, 5366
	mov	w0, 0
	bl	dprint_normal
	mov	w1, 1
	mov	x0, x25
	bl	MVC_ClearAll
	ldr	x27, [sp, 80]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
.L3683:
	mov	w1, 1
	strb	w1, [x22, 3481]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L3582:
	cmp	w0, 2
	beq	.L3684
	add	x22, x25, 11153408
	mov	w26, 0
.L3677:
	strb	wzr, [x22, 2185]
	b	.L3584
.L3681:
	ldrb	w0, [x22, 3480]
	cbz	w0, .L3585
	add	x1, x25, 11120640
	ldr	w2, [x22, 3504]
	ldr	w1, [x1]
	cmp	w2, w1
	beq	.L3586
.L3585:
	add	x0, x25, 11124736
	ldr	w1, [x0, 408]
	subs	w1, w1, #1
	bmi	.L3584
	add	x3, x25, 11120640
	b	.L3596
	.p2align 3
.L3588:
	cmp	w26, 2
	beq	.L3685
.L3587:
	subs	w1, w1, #1
	bmi	.L3584
.L3596:
	sxtw	x0, w1
	add	x0, x0, 1388544
	add	x0, x25, x0, lsl 3
	ldr	x19, [x0, 16408]
	cbz	x19, .L3587
	cmp	w26, 1
	bne	.L3588
	ldrb	w0, [x19, 2]
	cmp	w0, 2
	bne	.L3587
.L3589:
	ldr	w0, [x19, 20]
	ldr	w2, [x20, 2484]
	cmp	w2, w0
	bne	.L3587
	ldr	w2, [x3]
	ldr	w0, [x19, 56]
	cmp	w2, w0
	bne	.L3587
	ldrb	w0, [x20, 2464]
	cbz	w0, .L3686
	ldrb	w0, [x19, 3]
	cbz	w0, .L3587
.L3591:
	mov	w0, 1
	add	x1, x19, 72
	strb	w0, [x22, 2185]
	mov	x2, 536
	add	x0, x22, 2200
	str	x19, [x22, 2736]
	bl	memcpy
	ldrsb	w1, [x19, 6]
	ldr	w0, [x25, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L3592
	ldr	x0, [x0, 40]
	cbz	x0, .L3592
	ldr	w1, [x0, 4]
	ldrb	w0, [x22, 2185]
	str	w1, [x22, 2820]
	cbz	w0, .L3584
	ldr	x0, [x22, 2736]
	cbz	x0, .L3584
.L3676:
	uxtb	w1, w26
	cmp	w21, 1
	strb	w1, [x22, 2187]
	mov	w23, 0
	bne	.L3687
.L3622:
	mov	w0, 0
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3685:
	ldrb	w0, [x19, 2]
	cmp	w0, 1
	bne	.L3587
	b	.L3589
.L3682:
	strb	wzr, [x22, 3480]
	add	x1, x25, 11120640
	mov	w0, 0
	ldr	w2, [x20, 2484]
	str	w2, [x22, 3488]
	ldrb	w2, [x20, 2464]
	str	w2, [x22, 3484]
	ldr	w2, [x25, 128]
	str	w2, [x22, 3492]
	strb	wzr, [x22, 3481]
	str	w23, [x22, 3496]
	ldr	w1, [x1]
	str	w1, [x22, 3504]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L3684:
	add	x22, x25, 11153408
	mov	w26, 0
	strb	wzr, [x22, 2185]
	b	.L3584
.L3686:
	ldrb	w0, [x19, 3]
	cbnz	w0, .L3587
	b	.L3591
	.p2align 3
.L3611:
	ldr	x3, [x22, 2736]
	mov	w1, 5387
	strb	wzr, [x22, 2184]
	mov	w0, 0
	ldr	x2, .LC920
	strb	wzr, [x3, 5]
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x25
	bl	MVC_ClearAll
	mov	w0, -1
	b	.L3671
.L3586:
	cmp	w0, 1
	ccmp	w26, 2, 0, eq
	beq	.L3597
	cmp	w0, 2
	ccmp	w26, 1, 0, eq
	bne	.L3584
.L3597:
	ldr	w0, [x20, 2484]
	ldr	w1, [x22, 3488]
	cmp	w1, w0
	bne	.L3584
	ldrb	w0, [x20, 2464]
	cbnz	w0, .L3598
	ldr	w0, [x22, 3484]
	cbnz	w0, .L3584
.L3599:
	ldp	w1, w0, [x25, 124]
	sub	w0, w0, w1
	cmp	w0, 2
	bhi	.L3584
	ldr	x0, [x22, 2736]
	mov	w1, 1
	strb	w1, [x22, 2185]
	cbz	x0, .L3677
	cmp	w26, 2
	beq	.L3688
	cmp	w26, 1
	mov	w23, 0
	bne	.L3602
	ldrb	w0, [x0, 2]
	cmp	w0, 2
	beq	.L3602
	strb	wzr, [x22, 2185]
	b	.L3584
.L3592:
	mov	w3, 5281
	ldr	x2, .LC915
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L3671
.L3688:
	ldrb	w0, [x0, 2]
	cmp	w0, 1
	beq	.L3676
	strb	wzr, [x22, 2185]
	b	.L3584
.L3598:
	ldr	w0, [x22, 3484]
	cbz	w0, .L3584
	b	.L3599
	.size	MVC_AllocFrameStore, .-MVC_AllocFrameStore
	.align	3
.LC915:
	.xword	.LC914
	.align	3
.LC917:
	.xword	.LC916
	.align	3
.LC918:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC920:
	.xword	.LC919
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DEC_Init
	.type	MVC_DEC_Init, %function
MVC_DEC_Init:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	mov	w21, 2240
	bl	_mcount
	ldr	x22, .LC921
	mov	x2, 17856
	mov	w1, 0
	movk	x2, 0xaa, lsl 16
	mov	x0, x20
	ldr	x3, [x22, 96]
	ldr	w23, [x20, 1512]
	blr	x3
	str	w23, [x20, 1512]
	add	x0, x20, 912
	bl	ResetVoQueue
	strb	wzr, [x20]
	stp	x19, xzr, [x20, 224]
	ldr	w0, [x19, 716]
	str	w0, [x20, 36]
	ldr	w0, [x19, 720]
	str	w0, [x20, 40]
	ldr	w0, [x19, 708]
	str	w0, [x20, 32]
	ldr	w0, [x19, 600]
	bl	MEM_Phy2Vir
	ldr	x1, [x20, 224]
	mov	w2, 3992
	ldp	w4, w5, [x20, 36]
	ldrsw	x3, [x1, 596]
	smull	x2, w4, w2
	add	x3, x0, x3
	add	x1, x3, x2
	cmp	x1, xzr
	smaddl	x0, w5, w21, x1
	ccmp	x3, xzr, 4, ne
	str	x0, [x20, 864]
	ccmp	x0, xzr, 4, ne
	stp	x3, x1, [x20, 272]
	beq	.L3696
	ldr	w1, [x19, 636]
	cbz	w1, .L3697
.L3692:
	add	x2, x20, 11112448
	add	x23, x20, 11108352
	ldr	x6, [x22, 96]
	mov	w1, 0
	add	x24, x20, 12288
	add	x21, x20, 10768384
	str	w5, [x2, 3200]
	add	x19, x24, 2396
	str	w4, [x23, 4024]
	add	x21, x21, 4060
	ldrsw	x3, [x20, 32]
	lsl	x2, x3, 7
	sub	x2, x2, x3
	lsl	x2, x2, 5
	blr	x6
	strb	wzr, [x20, 4]
	ldr	w0, [x20, 108]
	mov	w1, 40
	strb	wzr, [x20, 6]
	mov	x2, 9856
	ubfx	x0, x0, 16, 2
	strb	w0, [x20, 8]
	mov	w0, 18
	strb	wzr, [x20, 7]
	stp	w1, w0, [x20, 48]
	add	x0, x20, 512
	str	wzr, [x20, 220]
	stp	wzr, wzr, [x20, 56]
	stp	wzr, wzr, [x20, 68]
	stp	wzr, wzr, [x20, 76]
	stp	wzr, wzr, [x20, 84]
	stp	wzr, wzr, [x20, 92]
	stp	xzr, xzr, [x0, 320]
	stp	xzr, xzr, [x0, 336]
	movk	x2, 0xa4, lsl 16
	mov	w1, 0
	ldr	x3, [x22, 96]
	mov	x0, x19
	blr	x3
	mov	x2, 8500
	ldr	x3, [x22, 96]
	mov	w1, 0
	movk	x2, 0x5, lsl 16
	mov	x0, x21
	blr	x3
	mov	x0, x19
	.p2align 2
.L3693:
	add	x1, x0, 274432
	add	x2, x0, 335872
	strb	wzr, [x0]
	add	x0, x2, 308
	cmp	x0, x21
	strb	wzr, [x1, 241]
	bne	.L3693
	strb	wzr, [x24, 2384]
	mov	w0, 32
	strb	wzr, [x20, 2]
	add	x23, x23, 3280
	stp	wzr, w0, [x20, 20]
	str	w0, [x20, 28]
	mov	x0, x20
	str	x23, [x20, 248]
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x20, 120]
	beq	.L3698
	mov	w1, 0
	mov	x0, x20
	bl	MVC_ClearAll
	mov	w0, 1
.L3691:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L3697:
	ldr	x4, [x22, 96]
	mov	x0, x3
	blr	x4
	ldr	w2, [x20, 40]
	mov	w1, 0
	ldr	x0, [x20, 280]
	ldr	x3, [x22, 96]
	smull	x2, w2, w21
	blr	x3
	ldp	w4, w5, [x20, 36]
	ldr	x0, [x20, 864]
	b	.L3692
.L3696:
	ldr	x3, .LC922
	mov	w4, 11441
	ldr	x2, .LC924
	mov	w1, w4
	add	x3, x3, 400
	mov	w0, 20
	bl	dprint_normal
	mov	w0, -20
	b	.L3691
.L3698:
	ldr	x2, .LC926
	mov	w1, 11504
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -20
	b	.L3691
	.size	MVC_DEC_Init, .-MVC_DEC_Init
	.align	3
.LC921:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC922:
	.xword	.LANCHOR1
	.align	3
.LC924:
	.xword	.LC923
	.align	3
.LC926:
	.xword	.LC925
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_StorePicInDpb
	.type	MVC_StorePicInDpb, %function
MVC_StorePicInDpb:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 11153408
	bl	_mcount
	add	x0, x19, 11116544
	strb	wzr, [x0, 1320]
	ldrb	w1, [x21, 2187]
	cmp	w1, 2
	cset	w1, eq
	strb	w1, [x0, 1321]
	ldrb	w0, [x21, 2184]
	cbz	w0, .L3879
	ldr	w0, [x19, 128]
	str	w0, [x19, 124]
	ldrb	w0, [x21, 2197]
	cbz	w0, .L3702
	ldr	x0, [x21, 2744]
	ldrb	w0, [x0, 1]
	cbz	w0, .L3703
	cbz	x19, .L3705
	mov	x0, x19
	bl	MVC_ClearAllSlice
	mov	x0, x19
	bl	MVC_InitDPB.part.15
	cbnz	w0, .L3705
.L3702:
	ldrb	w0, [x19, 8]
	cmp	w0, 2
	beq	.L3880
	ldr	x20, [x19, 224]
	ldr	w0, [x20, 12]
	cbz	w0, .L3881
	ldrb	w1, [x21, 2186]
	cbnz	w1, .L3712
.L3782:
	ldrb	w2, [x21, 2187]
	ldr	x22, [x21, 2736]
	sub	w1, w2, #1
	uxtb	w1, w1
	cbnz	w2, .L3882
.L3713:
	cmp	w1, 1
	bls	.L3883
.L3858:
	cbnz	w2, .L3884
.L3718:
	cbz	w0, .L3788
	add	x24, x21, 2184
	mov	x20, x22
.L3721:
	cbz	w2, .L3723
	ldrb	w0, [x24, 1]
	cmp	w0, 1
	beq	.L3885
.L3723:
	ldr	w0, [x24, 612]
	str	w0, [x20, 44]
.L3724:
	mov	x1, x20
	mov	x0, x19
	bl	MVC_GetImagePara
	ldrsb	w1, [x20, 6]
	ldr	w0, [x19, 120]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	mov	w4, 2967
	cbz	x0, .L3867
	ldr	x0, [x24, 224]
	str	x0, [x23, 208]
	ldr	x0, [x24, 232]
	str	x0, [x23, 216]
	ldr	x0, [x24, 240]
	str	x0, [x23, 224]
	ldr	w0, [x20, 44]
	str	w0, [x23, 96]
	cbz	w0, .L3731
	ldrb	w1, [x23, 156]
	and	w1, w1, 3
	cbz	w1, .L3886
.L3729:
	ldr	x1, [x19, 224]
	ldr	w1, [x1, 4]
	cmp	w1, w0
	bcc	.L3887
.L3731:
	ldrsb	w1, [x20, 6]
	mov	w2, 1
	ldr	w0, [x19, 120]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 120]
	mov	x4, x23
	add	x3, x19, 912
	mov	x2, x19
	mov	w1, 15
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L3728
	ldrsb	w1, [x20, 6]
	mov	w2, 0
	ldr	w0, [x19, 120]
	bl	FSP_SetDisplay
.L3728:
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 632]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L3888
	str	wzr, [x23, 16]
.L3734:
	ldr	w0, [x19, 136]
	add	w0, w0, 2
	str	w0, [x19, 136]
.L3722:
	ldr	w0, [x19, 220]
	cmp	w0, 2
	beq	.L3735
.L3720:
	mov	w0, 1
	str	w0, [x20, 16]
	strb	w0, [x22, 8]
.L3735:
	ldr	x0, [x19, 224]
	mov	w1, 2
	str	w1, [x19, 220]
	ldr	w0, [x0, 12]
.L3712:
	cmp	w0, 2
	bne	.L3711
	ldr	w0, [x21, 2760]
	cbz	w0, .L3736
	add	x20, x19, 11124736
	mov	x0, x19
	bl	MVC_SimpleSlideDPB
	ldr	w1, [x20, 408]
	cbz	w1, .L3737
	ldr	x0, [x20, 24]
	cbz	x0, .L3889
	add	x2, x20, 32
	mov	w0, 0
	b	.L3739
	.p2align 3
.L3740:
	ldr	x3, [x2], 8
	cbz	x3, .L3890
.L3739:
	add	w0, w0, 1
	cmp	w0, w1
	bne	.L3740
.L3737:
	add	x2, x21, 2184
	mov	x0, x19
	bl	MVC_InsertFrmInDPB
	cbnz	w0, .L3891
	ldr	w1, [x20, 412]
	mov	x0, x19
	add	w1, w1, 1
	str	w1, [x20, 412]
	bl	MVC_UpdateReflist
	mov	x0, x19
	bl	MVC_UpdateLTReflist
	mov	w4, 3042
	b	.L3869
	.p2align 3
.L3881:
	ldr	w1, [x19, 220]
	cmp	w1, 2
	beq	.L3711
	ldrb	w1, [x21, 2186]
	cbz	w1, .L3782
.L3711:
	ldr	w0, [x21, 2760]
	cbz	w0, .L3743
	ldr	w4, [x19, 112]
	ldr	w3, [x21, 2796]
	cmp	w4, w3
	bcs	.L3744
	ldrb	w0, [x21, 2186]
	cbz	w0, .L3892
.L3744:
	mov	x0, x19
	bl	MVC_Marking
	cbnz	w0, .L3893
	mov	x0, x19
	bl	MVC_UpdateReflist
	mov	x0, x19
	bl	MVC_UpdateLTReflist
	ldr	w1, [x21, 2824]
	mov	x0, x19
	bl	MVC_RemoveUnUsedFrameStore
.L3736:
	ldrb	w0, [x21, 2185]
	cmp	w0, 1
	beq	.L3747
	add	x20, x19, 11124736
	ldr	w4, [x20, 408]
.L3748:
	ldr	w0, [x21, 2760]
	cbz	w0, .L3757
	ldr	w5, [x20, 416]
	ldr	w6, [x20, 420]
	add	w0, w5, w6
	cmp	w0, w4
	bcs	.L3784
.L3757:
	mov	w23, -1
	mov	w22, w23
	b	.L3766
	.p2align 3
.L3760:
	ldr	w22, [x29, 72]
.L3761:
	ldr	w3, [x21, 2760]
	mov	w1, w22
	mov	x0, x19
	mov	w23, w2
	cbnz	w3, .L3762
	ldr	w3, [x21, 2764]
	ldr	w2, [x29, 68]
	cmp	w3, w2
	blt	.L3894
.L3762:
	bl	MVC_OutputFrmFromDPB
	cmn	w0, #1
	mov	w24, w0
	beq	.L3765
	ldr	w4, [x20, 408]
.L3766:
	ldr	w0, [x20, 412]
	add	x3, x29, 72
	add	x2, x29, 68
	mov	w1, -1
	cmp	w0, w4
	mov	x0, x19
	bcc	.L3759
	bl	MVC_GetMinPOC
	tbnz	w0, #31, .L3895
	ldr	w2, [x20, 412]
	cmp	w23, w2
	bne	.L3760
	ldr	w0, [x29, 72]
	cmp	w22, w0
	beq	.L3896
	mov	w22, w0
	b	.L3761
	.p2align 3
.L3895:
	mov	w3, 3132
	ldr	x2, .LC949
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w1, -1
	mov	x0, x19
	bl	MVC_ClearDPB
.L3759:
	ldr	w0, [x21, 2760]
	cbz	w0, .L3771
	ldrb	w0, [x21, 2188]
	cbnz	w0, .L3771
	ldr	w0, [x20, 416]
	cbz	w0, .L3771
	mov	w1, 0
	b	.L3776
	.p2align 3
.L3773:
	ldr	w0, [x20, 416]
	cmp	w0, w1
	bls	.L3771
.L3776:
	add	x0, x19, x1, uxtw 3
	ldr	w3, [x21, 2752]
	add	x0, x0, 11124736
	add	w1, w1, 1
	ldr	x2, [x0, 152]
	ldr	w4, [x2, 20]
	cmp	w4, w3
	bne	.L3773
	ldr	w4, [x2, 56]
	ldr	w3, [x21, 2824]
	cmp	w4, w3
	bne	.L3773
	strb	wzr, [x2, 3]
	ldr	x2, [x0, 152]
	ldrb	w3, [x2, 5]
	cmp	w3, 1
	beq	.L3897
.L3775:
	ldr	w0, [x2, 48]
	ldr	w3, [x19, 52]
	cmp	w0, w3
	add	x0, x19, x0, uxtw 2
	beq	.L3773
	str	wzr, [x0, 148]
	str	w3, [x2, 48]
	b	.L3773
	.p2align 3
.L3771:
	ldr	w1, [x20, 408]
	cbz	w1, .L3770
	ldr	x0, [x20, 24]
	cbz	x0, .L3898
	add	x2, x20, 32
	mov	w0, 0
	b	.L3778
	.p2align 3
.L3779:
	ldr	x3, [x2], 8
	cbz	x3, .L3899
.L3778:
	add	w0, w0, 1
	cmp	w0, w1
	bne	.L3779
.L3770:
	add	x2, x21, 2184
	mov	x0, x19
	bl	MVC_InsertFrmInDPB
	cbnz	w0, .L3900
	ldr	w1, [x20, 412]
	mov	x0, x19
	add	w1, w1, 1
	str	w1, [x20, 412]
	bl	MVC_UpdateReflist
	mov	x0, x19
	bl	MVC_UpdateLTReflist
.L3742:
	mov	w20, 0
.L3781:
	strb	wzr, [x21, 2184]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3743:
	ldrb	w0, [x21, 2185]
	cmp	w0, 1
	beq	.L3747
	add	x20, x19, 11124736
	ldr	w4, [x20, 408]
	b	.L3757
	.p2align 3
.L3747:
	ldr	x0, [x19, 816]
	ldr	x3, [x21, 2736]
	cmp	x0, xzr
	ccmp	x3, x0, 0, ne
	bne	.L3901
	mov	x0, x19
	bl	MVC_DirectOutput
	cmn	w0, #1
	mov	w20, w0
	beq	.L3902
	mov	w4, 3087
	b	.L3866
	.p2align 3
.L3882:
	ldrb	w3, [x22, 2]
	cmp	w3, wzr
	ccmp	w1, 1, 0, eq
	bhi	.L3712
	b	.L3713
	.p2align 3
.L3884:
	ldrb	w1, [x22, 2]
	cbz	w1, .L3712
	b	.L3718
.L3883:
	ldr	w1, [x19, 220]
	cbnz	w1, .L3715
	mov	w0, 1
	mov	x2, 648
	str	w0, [x19, 220]
	add	x1, x21, 2184
	add	x0, x21, 2832
	bl	memcpy
	ldr	w0, [x20, 12]
	b	.L3712
.L3901:
	add	x20, x19, 11124736
	ldr	w4, [x20, 408]
	cbz	w4, .L3750
	ldr	x0, [x20, 24]
	add	x2, x20, 32
	mov	w1, 0
	cmp	x3, x0
	ccmp	x0, xzr, 4, eq
	bne	.L3903
	.p2align 2
.L3754:
	add	w1, w1, 1
	cmp	w1, w4
	beq	.L3748
	ldr	x0, [x2], 8
	cmp	x3, x0
	ccmp	x0, xzr, 4, eq
	beq	.L3754
.L3751:
	add	x2, x21, 2184
	mov	x0, x19
	bl	MVC_InsertFrmInDPB
	cmn	w0, #1
	mov	w20, w0
	beq	.L3904
	mov	x0, x19
	bl	MVC_UpdateReflist
	mov	x0, x19
	bl	MVC_UpdateLTReflist
	mov	w4, 3113
.L3869:
	ldr	x2, .LC930
	mov	w3, 0
	mov	w1, w4
	mov	w0, 12
	bl	dprint_normal
	b	.L3742
.L3715:
	cmp	w1, 1
	bne	.L3858
	ldr	x20, [x21, 3384]
	cbz	w0, .L3720
	add	x24, x21, 2832
	ldrb	w2, [x24, 3]
	b	.L3721
.L3896:
	ldr	x3, .LC950
	mov	w4, w22
	ldr	x2, .LC952
	mov	w1, 3139
	add	x3, x3, 416
	mov	w0, 1
	bl	dprint_normal
	mov	w4, 3140
.L3867:
	ldr	x2, .LC930
	mov	w3, -1
	mov	w1, w4
	mov	w0, 12
	bl	dprint_normal
	ldr	x22, .LC941
.L3786:
	ldr	x1, [x21, 2736]
	mov	w20, -1
	ldr	w0, [x19, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_ClearLogicFs
	mov	w3, 3227
	mov	w4, w20
	mov	x2, x22
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, [x21, 2736]
	strb	wzr, [x0, 5]
	ldr	x0, [x21, 2736]
	strb	wzr, [x0, 2]
	mov	w0, w20
	strb	wzr, [x21, 2184]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3765:
	ldr	x22, .LC941
	mov	w3, 3171
	mov	w4, w0
	mov	w1, w3
	mov	x2, x22
	mov	w0, 1
	bl	dprint_normal
	mov	w4, 3172
	ldr	x2, .LC930
	mov	w3, w24
	mov	w1, w4
	mov	w0, 12
	bl	dprint_normal
	b	.L3786
	.p2align 3
.L3899:
	mov	w1, w0
	b	.L3770
	.p2align 3
.L3703:
	mov	w1, -1
	mov	x0, x19
	bl	MVC_FlushDPB
	cbz	w0, .L3702
	ldr	x2, .LC934
	mov	w1, 2886
	mov	w0, 0
	bl	dprint_normal
	mov	w4, 2887
	b	.L3867
	.p2align 3
.L3880:
	ldr	x2, .LC936
	mov	w1, 2894
	mov	w0, 3
	bl	dprint_normal
	mov	x0, x19
	bl	MVC_DirectOutput
	mov	w20, w0
	ldr	w1, [x19, 52]
	ldr	w0, [x21, 2820]
	cmp	w0, w1
	beq	.L3707
	add	x0, x19, x0, uxtw 2
	str	wzr, [x0, 148]
	str	w1, [x21, 2820]
.L3707:
	mov	w4, 2904
.L3866:
.L3708:
	ldr	x2, .LC930
	mov	w3, w20
	mov	w1, w4
	mov	w0, 12
	bl	dprint_normal
	cmn	w20, #1
	bne	.L3781
	ldr	x22, .LC941
	b	.L3786
	.p2align 3
.L3894:
	ldrb	w0, [x19, 8]
	cmp	w0, 2
	beq	.L3905
.L3763:
	mov	x0, x19
	bl	MVC_DirectOutput
	cmn	w0, #1
	mov	w20, w0
	beq	.L3906
	mov	w4, 3163
	b	.L3866
	.p2align 3
.L3705:
	ldr	x2, .LC932
	mov	w1, 2876
	mov	w0, 0
	bl	dprint_normal
	mov	w4, 2877
	b	.L3867
	.p2align 3
.L3788:
	mov	x20, x22
	b	.L3722
.L3897:
	strb	w3, [x2, 7]
	ldr	x2, [x0, 152]
	strb	wzr, [x2, 5]
	ldr	x2, [x0, 152]
	b	.L3775
.L3906:
	mov	w3, 3160
	ldr	x2, .LC941
	mov	w4, w0
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w4, 3163
	b	.L3866
.L3885:
	mov	w0, 3
	strb	w0, [x20, 2]
	ldr	w1, [x20, 44]
	ldr	w0, [x24, 612]
	add	w0, w1, w0
	str	w0, [x20, 44]
	b	.L3724
.L3886:
	mov	w3, 2978
	ldr	x2, .LC938
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC939
	ldr	x4, [x0]
	cbz	x4, .L3730
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 40
	blr	x4
.L3730:
	ldr	w0, [x23, 96]
	cbnz	w0, .L3729
	b	.L3731
	.p2align 3
.L3902:
	mov	w3, 3083
	ldr	x2, .LC941
	mov	w4, w0
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w4, 3087
	b	.L3866
.L3905:
	ldrb	w0, [x21, 2187]
	cbz	w0, .L3763
	ldr	x0, [x21, 2736]
	str	x0, [x19, 824]
	b	.L3763
.L3890:
	mov	w1, w0
	b	.L3737
.L3888:
	mov	x1, x23
	mov	x0, x19
	bl	MVC_SetFrmRepeatCount.part.1
	b	.L3734
.L3879:
	ldr	x2, .LC928
	mov	w1, 2862
	bl	dprint_normal
	mov	w4, 2863
	b	.L3867
.L3893:
	ldr	x2, .LC945
	mov	w3, w0
	mov	w1, 3064
	mov	w0, 1
	bl	dprint_normal
	mov	w4, 3065
	b	.L3867
.L3898:
	mov	w1, 0
	b	.L3770
.L3900:
	ldr	x22, .LC941
	mov	w3, 3213
	mov	w4, w0
	mov	w1, w3
	mov	x2, x22
	mov	w0, 1
	bl	dprint_normal
	mov	w4, 3214
.L3868:
	ldr	x2, .LC930
	mov	w3, -1
	mov	w1, w4
	mov	w0, 12
	bl	dprint_normal
	b	.L3786
.L3750:
	ldr	w0, [x21, 2760]
	cbz	w0, .L3757
	ldr	w5, [x20, 416]
	ldr	w6, [x20, 420]
.L3784:
	mov	w3, 3122
	ldr	x2, .LC947
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w1, -1
	mov	x0, x19
	bl	MVC_ClearDPB
	mov	w4, 3125
	b	.L3867
.L3892:
	ldr	x2, .LC943
	mov	w1, 3050
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC939
	ldr	x4, [x0]
	cbz	x4, .L3745
	ldr	w1, [x19, 112]
	mov	w3, 8
	ldr	w2, [x21, 2796]
	ldr	w0, [x19, 120]
	stp	w2, w1, [x29, 72]
	add	x2, x29, 72
	mov	w1, 23
	blr	x4
.L3745:
	mov	x0, x19
	mov	w20, -1
	bl	MVC_ClearAllSlice
	add	x2, x19, 11120640
	mov	w0, 2
	mov	w3, 23352
	ldr	w4, [x19, 40]
	movk	w3, 0x1, lsl 16
	mov	w1, w20
	strb	w0, [x2, 17]
	mov	w0, 32
	stp	w4, w3, [x2, 28]
	strb	w0, [x2, 18]
	mov	w3, 7
	mov	w0, 3
	strb	w3, [x2, 19]
	stp	w0, w20, [x2, 40]
	mov	w3, 1048576
	strb	wzr, [x2, 16]
	str	w3, [x2, 56]
	mov	x0, x19
	stp	wzr, wzr, [x2, 48]
	bl	MVC_ClearDPB
	mov	w4, 3056
	ldr	x2, .LC930
	mov	w3, w20
	mov	w1, w4
	mov	w0, 12
	bl	dprint_normal
	ldr	x22, .LC941
	b	.L3786
.L3889:
	mov	w1, 0
	b	.L3737
.L3903:
	mov	w1, 0
	b	.L3751
.L3891:
	ldr	x22, .LC941
	mov	w3, 3033
	mov	w4, w0
	mov	w1, w3
	mov	x2, x22
	mov	w0, 0
	bl	dprint_normal
	mov	w4, 3034
	b	.L3868
.L3904:
	ldr	x22, .LC941
	mov	w3, 3106
	mov	w4, w0
	mov	w1, w3
	mov	x2, x22
	mov	w0, 1
	bl	dprint_normal
	mov	w4, 3107
	ldr	x2, .LC930
	mov	w3, w20
	mov	w1, w4
	mov	w0, 12
	bl	dprint_normal
	b	.L3786
.L3887:
	ldrsb	w1, [x20, 6]
	mov	w2, 0
	ldr	w0, [x19, 120]
	bl	FSP_SetDisplay
	mov	w4, 2997
	b	.L3867
	.size	MVC_StorePicInDpb, .-MVC_StorePicInDpb
	.align	3
.LC928:
	.xword	.LC927
	.align	3
.LC930:
	.xword	.LC929
	.align	3
.LC932:
	.xword	.LC931
	.align	3
.LC934:
	.xword	.LC933
	.align	3
.LC936:
	.xword	.LC935
	.align	3
.LC938:
	.xword	.LC937
	.align	3
.LC939:
	.xword	g_EventReportFunc
	.align	3
.LC941:
	.xword	.LC940
	.align	3
.LC943:
	.xword	.LC942
	.align	3
.LC945:
	.xword	.LC944
	.align	3
.LC947:
	.xword	.LC946
	.align	3
.LC949:
	.xword	.LC948
	.align	3
.LC950:
	.xword	.LANCHOR1
	.align	3
.LC952:
	.xword	.LC951
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecGap
	.type	MVC_DecGap, %function
MVC_DecGap:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x22, x19, 11116544
	add	x23, x19, 11120640
	bl	_mcount
	add	x27, x19, 11153408
	ldrb	w2, [x19, 3]
	mov	w24, 2
	ldr	w0, [x22, 1360]
	str	w0, [x29, 108]
	lsl	x0, x2, 6
	sub	x0, x0, x2
	ldr	x3, [x19, 248]
	lsl	x0, x0, 2
	ldr	w1, [x23, 4]
	sub	x0, x0, x2
	ldr	w25, [x22, 2484]
	lsl	x0, x0, 1
	add	x1, x1, 2777088
	sub	x0, x0, x2
	ldrb	w2, [x3, 19]
	lsl	x0, x0, 2
	add	x1, x19, x1, lsl 2
	cmp	w2, 1
	add	x2, x19, x0
	add	x2, x2, 11120640
	add	x0, x0, 11120640
	ldr	w6, [x1, 10668]
	add	x0, x0, 64
	add	x0, x19, x0
	ldr	w21, [x3, 2896]
	ldrb	w1, [x2, 67]
	csel	w24, w24, wzr, eq
	ldr	w2, [x22, 1364]
	stp	w1, w2, [x29, 100]
	add	x1, x19, 11124736
	str	x0, [x27, 2744]
	ldr	w0, [x1, 412]
	cbz	w0, .L3923
	add	w21, w21, 4
	mov	w20, 1
	add	w3, w6, 1
	lsl	w21, w20, w21
	ldr	x2, .LC956
	mov	w1, 5461
	udiv	w6, w3, w21
	mov	w0, 3
	str	wzr, [x22, 1360]
	str	wzr, [x22, 1364]
	msub	w28, w6, w21, w3
	bl	dprint_normal
	ldr	x2, .LC958
	mov	w4, w28
	mov	w3, w25
	mov	w1, 5462
	mov	w0, 3
	bl	dprint_normal
	cmp	w25, w28
	ble	.L3916
	ldr	x26, .LC962
	b	.L3920
	.p2align 3
.L3913:
	strb	wzr, [x27, 2188]
	mov	x0, x19
	bl	MVC_StorePicInDpb
	add	w1, w28, 1
	cbnz	w0, .L3924
.L3914:
	sdiv	w2, w1, w21
	ldr	w0, [x23, 4]
	add	x0, x0, 2777088
	add	x0, x19, x0, lsl 2
	str	w28, [x0, 10668]
	msub	w28, w2, w21, w1
	cmp	w25, w28
	ble	.L3916
.L3920:
	mov	w1, 1
	mov	x0, x19
	bl	MVC_AllocFrameStore
	cbnz	w0, .L3925
	mov	w1, 5478
	mov	x2, x26
	mov	w0, 3
	bl	dprint_normal
	strb	w20, [x27, 2190]
	ldr	x0, [x27, 2736]
	str	w28, [x0, 20]
	str	w28, [x27, 2752]
	ldr	x0, [x27, 2736]
	str	w28, [x0, 628]
	str	w24, [x27, 2760]
	ldr	x0, [x27, 2736]
	str	wzr, [x0, 624]
	ldr	x0, [x27, 2736]
	strb	w20, [x0, 7]
	ldr	x0, [x27, 2736]
	strb	wzr, [x0, 5]
	ldr	x0, [x27, 2736]
	strb	w20, [x0, 1]
	strb	w20, [x27, 2186]
	ldr	x0, [x27, 2744]
	ldr	w1, [x23]
	str	w1, [x27, 2824]
	strb	wzr, [x0, 3]
	ldr	x0, [x19, 248]
	ldr	w0, [x0, 2900]
	cbz	w0, .L3913
	mov	x0, x19
	str	w28, [x22, 1376]
	bl	MVC_DecPOC
	ldr	w0, [x22, 1356]
	str	w0, [x27, 2764]
	ldr	w0, [x22, 1352]
	str	w0, [x27, 2768]
	ldr	w0, [x22, 1344]
	str	w0, [x27, 2772]
	ldr	w0, [x22, 1348]
	str	w0, [x27, 2776]
	mov	x0, x19
	strb	wzr, [x27, 2188]
	bl	MVC_StorePicInDpb
	add	w1, w28, 1
	cbz	w0, .L3914
.L3924:
	ldr	w1, [x29, 108]
	mov	w3, 5514
	str	w1, [x22, 1360]
	mov	w4, w0
	ldr	w1, [x29, 104]
	mov	w0, 0
	str	w1, [x22, 1364]
	mov	w1, w3
	ldrb	w6, [x29, 100]
	ldr	x5, [x27, 2744]
	ldr	x2, .LC964
	strb	w6, [x5, 3]
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3923:
	ldr	x2, .LC954
	mov	w1, 5454
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3916:
	ldr	w0, [x29, 108]
	str	w0, [x22, 1360]
	ldr	w0, [x29, 104]
	str	w0, [x22, 1364]
	mov	w0, 0
	ldrb	w2, [x29, 100]
	ldr	x1, [x27, 2744]
	strb	w2, [x1, 3]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3925:
	ldr	w0, [x29, 108]
	mov	w1, 5474
	str	w0, [x22, 1360]
	ldr	w0, [x29, 104]
	str	w0, [x22, 1364]
	mov	w0, 0
	ldrb	w4, [x29, 100]
	ldr	x3, [x27, 2744]
	ldr	x2, .LC960
	strb	w4, [x3, 3]
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.size	MVC_DecGap, .-MVC_DecGap
	.align	3
.LC954:
	.xword	.LC953
	.align	3
.LC956:
	.xword	.LC955
	.align	3
.LC958:
	.xword	.LC957
	.align	3
.LC960:
	.xword	.LC959
	.align	3
.LC962:
	.xword	.LC961
	.align	3
.LC964:
	.xword	.LC963
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_InitPic
	.type	MVC_InitPic, %function
MVC_InitPic:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 11116544
	add	x20, x19, 11153408
	bl	_mcount
	mov	w22, 2240
	ldr	x2, [x19, 280]
	ldr	w0, [x21, 2472]
	ldrb	w1, [x20, 2184]
	str	wzr, [x29, 92]
	umull	x0, w0, w22
	add	x22, x2, x0
	cbz	w1, .L3927
	ldr	x0, [x20, 2736]
	cbz	x0, .L3928
	ldrb	w1, [x0, 2]
	cbz	w1, .L4067
.L3928:
	strb	wzr, [x20, 2184]
.L3927:
	add	x1, x29, 92
	mov	x0, x19
	bl	MVC_GetReRangeFlag
	mov	w24, w0
	ldrsb	w0, [x21, 2468]
	cmn	w0, #1
	beq	.L4068
.L3929:
	cbnz	w0, .L3932
	ldrb	w0, [x19, 2]
	cmp	w0, 1
	beq	.L4069
	ldr	w1, [x19, 28]
	ldr	w0, [x22, 28]
	cmp	w1, w0
	bne	.L4070
	add	x0, x19, 11046912
	add	x0, x0, 180
	str	x0, [x19, 248]
.L3932:
	add	x23, x19, 11112448
	ldr	w0, [x22, 24]
	ldr	w1, [x23, 3200]
	cmp	w1, w0
	beq	.L4071
.L3936:
	strb	wzr, [x22, 20]
	mov	x1, x22
	ldr	x0, [x19, 248]
	bl	mvc_assign_quant_params
	ldr	x3, .LC965
	mov	x2, 2240
	mov	x1, x22
	add	x0, x23, 3176
	ldr	x3, [x3, 112]
	blr	x3
.L3937:
	ldr	w0, [x29, 92]
	cbnz	w0, .L3938
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 888]
	cmp	w0, 1
	beq	.L3938
.L3939:
	ldr	w0, [x22, 24]
	ldr	w1, [x23, 3200]
	cmp	w1, w0
	bne	.L3948
	ldrb	w0, [x22, 20]
	cbnz	w0, .L3948
	ldrsb	w0, [x21, 2468]
	cmn	w0, #1
	beq	.L4072
.L3950:
	cbnz	w0, .L3951
	add	x0, x19, 10768384
	add	x22, x19, 11120640
	add	x5, x0, 4068
	ldr	w2, [x0, 4064]
	ldr	w3, [x22]
	adds	w2, w2, 1
	beq	.L3952
	ldr	w0, [x0, 4068]
	cmp	w3, w0
	beq	.L4073
	mov	w4, w2
	mov	w0, 0
	b	.L3954
	.p2align 3
.L3955:
	ldr	w1, [x5, w0, sxtw 2]
	cmp	w3, w1
	beq	.L3952
.L3954:
	add	w0, w0, 1
	cmp	w0, w4
	mov	w2, w0
	bne	.L3955
.L3952:
	str	w2, [x22, 4]
.L3951:
	ldrb	w1, [x21, 2459]
	ldr	x0, [x19, 248]
	cmp	w1, 5
	ldr	w2, [x0, 2896]
	beq	.L3956
.L4079:
	ldrb	w0, [x19, 8]
	ldr	w1, [x21, 2484]
	cmp	w0, 2
	beq	.L3958
.L4080:
	ldr	x3, [x19, 224]
	ldr	w0, [x3, 12]
	cmp	w0, 2
	beq	.L3958
	add	x22, x19, 11120640
	ldr	w0, [x22, 4]
	add	x0, x0, 2777088
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 10668]
	cmp	w0, w1
	beq	.L3958
	add	w2, w2, 4
	mov	w4, 1
	lsl	w24, w4, w2
	add	w0, w0, w4
	udiv	w2, w0, w24
	msub	w0, w2, w24, w0
	cmp	w0, w1
	beq	.L3958
	str	w4, [x3, 628]
	ldr	x0, [x19, 224]
	ldr	w1, [x0, 628]
	cbnz	w1, .L3959
	ldr	w1, [x0, 672]
	cmp	w1, w4
	beq	.L4074
.L3960:
	ldr	w0, [x22, 4]
	ldr	w2, [x21, 2484]
	add	x0, x19, x0, lsl 2
	add	x0, x0, 11116544
	ldr	w1, [x0, 2476]
	cmp	w2, w1
	sub	w3, w2, w1
	bhi	.L4075
	ldr	w4, [x23, 3156]
	add	w3, w3, w24
	cmp	w4, w3
	ccmp	w1, wzr, 4, cc
	beq	.L3959
	ldrb	w1, [x21, 2456]
	cmp	w1, 2
	bne	.L4076
	cbnz	w2, .L3966
	sub	w2, w24, #1
.L3967:
	str	w2, [x0, 2476]
	mov	w1, -1
	mov	x0, x19
	bl	MVC_FlushDPB
	mov	w3, 5845
	ldr	x2, .LC970
	cbz	w0, .L3959
.L4063:
	mov	w4, w0
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
.L3935:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3938:
	ldr	w0, [x19, 84]
	add	w0, w0, 1
	str	w0, [x19, 84]
	cbnz	w24, .L3940
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 888]
	cmp	w0, 1
	beq	.L3940
	mov	w1, -1
	mov	x0, x19
	bl	MVC_FlushDPB
	cbnz	w0, .L4077
	cbz	x19, .L3988
.L4084:
	mov	x0, x19
	bl	MVC_ClearAllSlice
	mov	x0, x19
	bl	MVC_InitDPB.part.15
	cbnz	w0, .L3943
	cbnz	w24, .L3945
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 888]
	cmp	w0, 1
	bne	.L3939
.L3945:
	ldr	w1, [x23, 3156]
	add	x3, x19, 11108352
	mov	w2, 2
	mov	x0, x19
	lsl	w1, w1, 1
	str	w1, [x19, 52]
	ldr	w1, [x23, 3136]
	ldrb	w24, [x3, 3300]
	add	w1, w1, 1
	ldr	w25, [x23, 3132]
	sub	w24, w2, w24
	lsl	w1, w1, 4
	add	w25, w25, 1
	mul	w24, w1, w24
	lsl	w25, w25, 4
	mov	w1, w25
	mov	w2, w24
	bl	MVC_ArrangeVahbMem
	cmp	w0, 1
	beq	.L3947
	ldr	x1, [x19, 224]
	mov	w0, -2
	ldr	w1, [x1, 888]
	cmp	w1, 1
	beq	.L3935
	ldr	x2, .LC974
	mov	w1, 5741
	stp	wzr, wzr, [x19, 12]
	mov	w0, 0
	bl	dprint_normal
	mov	w1, 0
	mov	x0, x19
	bl	MVC_ClearAll
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, -1
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L4068:
	mov	w1, 1
	strb	w1, [x19, 2]
	mov	w1, 3992
	ldr	x5, [x19, 272]
	ldr	w2, [x22, 28]
	add	x3, x19, 11108352
	str	w2, [x19, 24]
	ldr	w2, [x22, 28]
	ldr	w4, [x3, 4024]
	umull	x1, w2, w1
	add	x1, x5, x1
	ldr	w2, [x1, 744]
	cmp	w4, w2
	beq	.L4078
.L3930:
	ldr	w0, [x19, 84]
	add	x23, x3, 3280
	ldr	x4, .LC965
	mov	x2, 3992
	add	w0, w0, 1
	str	w0, [x19, 84]
	strb	wzr, [x1, 26]
	mov	x0, x23
	ldr	x3, [x4, 112]
	blr	x3
	ldrsb	w0, [x21, 2468]
	str	x23, [x19, 248]
	b	.L3929
	.p2align 3
.L3948:
	ldr	x3, .LC965
	mov	x2, 2240
	strb	wzr, [x22, 20]
	mov	x1, x22
	add	x0, x23, 3176
	ldr	x3, [x3, 112]
	blr	x3
	ldrsb	w0, [x21, 2468]
	cmn	w0, #1
	bne	.L3950
.L4072:
	add	x22, x19, 11120640
	str	wzr, [x22, 4]
	ldrb	w1, [x21, 2459]
	ldr	x0, [x19, 248]
	cmp	w1, 5
	ldr	w2, [x0, 2896]
	bne	.L4079
.L3956:
	add	x22, x19, 11120640
	ldr	w1, [x21, 2484]
	ldr	w0, [x22, 4]
	add	x0, x0, 2777088
	add	x0, x19, x0, lsl 2
	str	w1, [x0, 10668]
	ldrb	w0, [x19, 8]
	cmp	w0, 2
	bne	.L4080
	.p2align 2
.L3958:
	ldrb	w0, [x21, 2464]
	cbz	w0, .L3972
	add	x22, x19, 11120640
	ldr	w0, [x22, 4]
	add	x0, x0, 2777088
	add	x0, x19, x0, lsl 2
	str	w1, [x0, 10668]
.L3972:
	mov	x0, x19
	str	w1, [x21, 1376]
	bl	MVC_DecPOC
	mov	w1, 0
	mov	x0, x19
	bl	MVC_AllocFrameStore
	cbnz	w0, .L4081
	strb	wzr, [x20, 2191]
	mov	w0, 1
	strb	w0, [x20, 2184]
	add	x4, x20, 2560
	mov	w6, 1
	ldrb	w0, [x21, 2459]
	strb	w0, [x20, 2190]
	ldr	w8, [x21, 2484]
	str	w8, [x20, 2752]
	ldrb	w7, [x21, 2464]
	str	w7, [x20, 2760]
	ldr	w3, [x21, 1356]
	str	w3, [x20, 2764]
	ldr	w2, [x21, 1352]
	str	w2, [x20, 2768]
	ldr	w1, [x21, 1344]
	str	w1, [x20, 2772]
	ldr	w0, [x21, 1348]
	strb	wzr, [x20, 2186]
	strb	wzr, [x20, 2189]
	strb	wzr, [x20, 2188]
	stp	w0, w3, [x4, 216]
	stp	w2, w1, [x4, 224]
	str	w0, [x20, 2792]
	mov	w0, -1
	str	w0, [x20, 2816]
	ldrb	w5, [x21, 2457]
	cbz	w5, .L3974
	strb	w6, [x21, 2457]
	mov	w5, w6
	mov	w6, 2
.L3974:
	ldr	x4, [x19, 248]
	mov	w3, 2
	ldrb	w2, [x4, 20]
	ldr	w0, [x4, 3952]
	sub	w1, w3, w2
	mov	w2, 0
	madd	w1, w0, w1, w1
	udiv	w0, w1, w6
	str	w0, [x20, 2804]
	ldrb	w1, [x4, 20]
	sub	w1, w3, w1
	ldr	w3, [x4, 3952]
	madd	w1, w3, w1, w1
	str	w1, [x20, 2808]
	ldr	w1, [x4, 3948]
	add	w1, w1, 1
	str	w1, [x20, 2800]
	mul	w0, w0, w1
	str	w0, [x20, 2812]
	ldrb	w0, [x23, 3176]
	strb	w0, [x20, 2192]
	cbnz	w5, .L3975
	ldrb	w0, [x4, 21]
	cmp	w0, wzr
	cset	w2, ne
.L3975:
	strb	w2, [x20, 2193]
	add	x22, x19, 11120640
	cbz	w7, .L3976
	ldr	w0, [x22, 4]
	add	x0, x0, 2777088
	add	x0, x19, x0, lsl 2
	str	w8, [x0, 10668]
.L3976:
	ldr	x0, [x20, 2736]
	cbz	x0, .L3977
	ldrsb	w1, [x21, 2468]
	strb	w1, [x0, 9]
.L3977:
	mov	w0, -1
	str	w0, [x20, 2824]
	ldrb	w0, [x21, 2467]
	cbz	w0, .L3978
	ldr	w0, [x22]
	str	w0, [x20, 2824]
	ldrb	w0, [x21, 2465]
	strb	w0, [x20, 2194]
	ldrb	w0, [x21, 2466]
	strb	w0, [x20, 2195]
.L3978:
	ldr	w0, [x22, 4]
	mov	x21, -1
	str	w0, [x20, 2828]
	mov	w1, 5973
	ldr	x2, .LC986
	mov	w0, 24
	ldrb	w4, [x19, 3]
	lsl	x3, x4, 6
	sub	x3, x3, x4
	lsl	x3, x3, 2
	sub	x3, x3, x4
	lsl	x3, x3, 1
	sub	x3, x3, x4
	lsl	x3, x3, 2
	add	x3, x3, 11120640
	add	x3, x3, 64
	add	x3, x19, x3
	str	x3, [x20, 2744]
	ldr	x3, [x19, 224]
	ldr	x4, [x3, 32]
	str	x4, [x20, 2408]
	ldr	x4, [x3, 48]
	str	x4, [x20, 2416]
	ldr	x4, [x3, 64]
	str	x4, [x20, 2424]
	str	x21, [x3, 32]
	ldr	w3, [x19, 120]
	ldr	x4, [x20, 2408]
	bl	dprint_normal
	ldr	x2, .LC988
	mov	w1, 5974
	ldr	w3, [x19, 120]
	mov	w0, 24
	ldr	x4, [x20, 2416]
	bl	dprint_normal
	ldr	x4, [x19, 248]
	mov	w2, 2
	ldrb	w3, [x20, 2357]
	add	x1, x19, 11108352
	ldrb	w0, [x20, 2356]
	ldr	w5, [x4, 748]
	bfi	w3, w2, 0, 2
	and	w3, w3, -13
	and	w0, w0, 252
	cmp	w5, 1
	bfi	w3, w2, 4, 2
	cset	w2, ne
	ldr	w1, [x1, 3332]
	bfi	w0, w2, 2, 3
	strb	w0, [x20, 2356]
	mov	w2, w0
	and	w1, w1, 7
	ldr	w5, [x4, 56]
	add	x0, x20, 2200
	strb	w3, [x20, 2357]
	bfi	w2, w5, 5, 3
	strb	w2, [x20, 2356]
	ldr	w3, [x4, 52]
	ldr	w2, [x20, 2356]
	bfi	w2, w3, 14, 3
	str	w2, [x20, 2356]
	bl	SetAspectRatio
	ldr	w0, [x19, 84]
	ldr	x1, [x20, 2736]
	str	w0, [x20, 2300]
	cbz	x1, .L4082
	ldr	x0, [x19, 248]
	ldr	w0, [x0, 3984]
	str	w0, [x1, 120]
	str	w0, [x20, 2248]
	ldr	x1, [x20, 2736]
	ldr	x0, [x19, 248]
	ldr	w0, [x0, 3988]
	str	w0, [x1, 124]
	str	w0, [x20, 2252]
	ldr	x0, [x20, 2736]
	ldr	w1, [x20, 2240]
	str	w1, [x0, 112]
	ldr	x0, [x20, 2736]
	ldr	w1, [x20, 2244]
	str	w1, [x0, 116]
	ldrb	w2, [x20, 2187]
	ldr	x0, [x20, 2736]
	cmp	w2, wzr
	ldr	w1, [x20, 2356]
	cset	w2, ne
	str	w2, [x20, 2220]
	str	w1, [x0, 228]
	ldr	x0, [x20, 2736]
	ldr	w1, [x20, 2220]
	str	w1, [x0, 92]
	ldr	x1, [x20, 2736]
	ldr	w0, [x22]
	str	w0, [x20, 2312]
	str	w0, [x1, 184]
	ldr	x1, [x20, 2736]
	ldr	w2, [x20, 2220]
	ldr	w0, [x19, 120]
	cmp	w2, wzr
	ldrsb	w1, [x1, 6]
	cset	w2, ne
	bl	FSP_SetStoreType
	cbnz	w0, .L4083
.L3980:
	ldr	w1, [x19, 60]
	add	x4, x20, 2368
	add	x5, x20, 2400
.L3984:
	ldr	x0, [x4]
	cbnz	x0, .L3981
	cbz	w1, .L3981
	ldr	x0, [x19, 832]
	subs	w1, w1, #1
	str	x0, [x4]
	beq	.L3982
	add	x2, x19, 832
	mov	w0, 0
	.p2align 2
.L3983:
	add	w0, w0, 1
	cmp	w0, w1
	add	x3, x19, x0, uxtw 3
	ldr	x3, [x3, 832]
	str	x3, [x2], 8
	bne	.L3983
.L3982:
	add	x0, x19, x1, uxtw 3
	str	xzr, [x0, 832]
	str	w1, [x19, 60]
.L3981:
	add	x4, x4, 8
	cmp	x5, x4
	bne	.L3984
	cbz	w1, .L3986
	cmp	w1, wzr
	ble	.L3986
	.p2align 2
.L3987:
	add	x22, x19, x1, sxtw 3
	sub	w21, w1, #1
	ldr	w0, [x19, 120]
	ldr	x1, [x22, 824]
	bl	FreeUsdByDec
	str	xzr, [x22, 824]
	mov	w1, w21
	cbnz	w21, .L3987
.L3986:
	str	wzr, [x19, 60]
	mov	x0, x19
	strb	wzr, [x20, 2196]
	bl	MVC_UpdateReflist
	mov	x0, x19
	bl	MVC_UpdateLTReflist
	mov	x0, x19
	bl	MVC_CalcPicNum
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, 0
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3940:
	ldr	x2, .LC968
	mov	w1, 5705
	mov	w0, 20
	bl	dprint_normal
	mov	x0, x19
	bl	MVC_GetBackPicFromVOQueue
	cbnz	x19, .L4084
.L3988:
	mov	w0, -1
.L3943:
	mov	w3, 5723
	ldr	x2, .LC972
	b	.L4063
.L4075:
	ldr	w4, [x23, 3156]
	cmp	w4, w3
	ccmp	w1, wzr, 4, cc
	beq	.L3959
	ldrb	w1, [x21, 2456]
	cmp	w1, 2
	bne	.L4085
	cbnz	w2, .L3963
	sub	w2, w24, #1
.L3964:
	str	w2, [x0, 2476]
	mov	w1, -1
	mov	x0, x19
	bl	MVC_FlushDPB
	mov	w3, 5818
	ldr	x2, .LC970
	cbnz	w0, .L4063
	.p2align 2
.L3959:
	add	x0, x19, 11108352
	ldrb	w0, [x0, 3299]
	cbnz	w0, .L3968
	ldr	x2, .LC978
	mov	w1, 5855
	mov	w0, 3
	bl	dprint_normal
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 632]
	tst	w0, -1025
	bne	.L4062
	ldr	w0, [x22]
	cbnz	w0, .L4062
	ldr	w0, [x22, 4]
	ldr	w1, [x21, 2484]
	add	x0, x0, 2777088
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 10668]
	add	w0, w0, 1
	udiv	w2, w0, w24
	msub	w0, w2, w24, w0
	cmp	w1, w0
	bcs	.L3958
	ldrb	w0, [x21, 2456]
	cmp	w0, 2
	beq	.L3958
	mov	x0, x19
	mov	w20, -1
	bl	MVC_ClearAllSlice
	ldr	w0, [x19, 40]
	mov	w2, 2
	str	w0, [x22, 28]
	mov	w0, 23352
	movk	w0, 0x1, lsl 16
	str	w0, [x22, 32]
	mov	w0, 7
	strb	w2, [x22, 17]
	strb	w0, [x22, 19]
	mov	w2, 32
	mov	w0, 3
	mov	w1, w20
	strb	w2, [x22, 18]
	mov	w2, 1048576
	str	w0, [x22, 40]
	mov	x0, x19
	stp	wzr, w2, [x22, 52]
	strb	wzr, [x22, 16]
	stp	w20, wzr, [x22, 44]
	bl	MVC_ClearDPB
	ldr	w5, [x22, 4]
	mov	w3, 5867
	ldr	x2, .LC980
	mov	w1, w3
	add	x5, x5, 2777088
	ldr	w4, [x21, 2484]
	mov	w0, 0
	add	x19, x19, x5, lsl 2
	ldr	w5, [x19, 10668]
	add	w5, w5, 1
	udiv	w6, w5, w24
	msub	w5, w6, w24, w5
	bl	dprint_normal
	mov	w0, w20
	b	.L3935
	.p2align 3
.L4071:
	ldrb	w0, [x22, 20]
	cbz	w0, .L3937
	b	.L3936
	.p2align 3
.L4083:
	ldr	x3, .LC991
	mov	w1, 6016
	ldr	x2, .LC993
	mov	w0, 1
	add	x3, x3, 440
	bl	dprint_normal
	b	.L3980
	.p2align 3
.L4078:
	ldrb	w2, [x1, 26]
	add	x23, x3, 3280
	cbnz	w2, .L3930
	str	x23, [x19, 248]
	b	.L3929
	.p2align 3
.L4067:
	ldrsb	w1, [x0, 6]
	ldr	w0, [x19, 120]
	bl	FSP_ClearLogicFs
	ldr	x0, [x20, 2736]
	strb	wzr, [x0, 2]
	ldr	x0, [x20, 2736]
	strb	wzr, [x0, 5]
	b	.L3928
	.p2align 3
.L3968:
	mov	x0, x19
	bl	MVC_DecGap
	cbnz	w0, .L3971
.L4062:
	ldr	w1, [x21, 2484]
	b	.L3958
.L4069:
	strb	wzr, [x19, 2]
	ldr	x0, .LC965
	ldr	w1, [x22, 28]
	ldr	x3, [x0, 112]
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 4
	sub	x1, x0, x1
	add	x0, x19, 10768384
	lsl	x2, x1, 2
	add	x0, x0, 4060
	sub	x1, x2, x1
	lsl	x2, x1, 6
	add	x1, x1, x2
	mov	x2, 8500
	movk	x2, 0x5, lsl 16
	add	x1, x19, x1, lsl 2
	add	x1, x1, 12288
	add	x1, x1, 2396
	blr	x3
	add	x0, x19, 11046912
	add	x0, x0, 180
	str	x0, [x19, 248]
	ldr	w0, [x0, 744]
	str	w0, [x19, 28]
	b	.L3932
	.p2align 3
.L3947:
	lsr	w25, w25, 4
	lsr	w24, w24, 4
	stp	w25, w24, [x19, 12]
	b	.L3939
.L4077:
	mov	w3, 5714
	ldr	x2, .LC970
	b	.L4063
.L3971:
	mov	w3, 5890
	ldr	x2, .LC982
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L3935
	.p2align 3
.L4074:
	ldr	w1, [x0, 668]
	cbnz	w1, .L3960
	ldr	w1, [x0, 676]
	cbnz	w1, .L3960
	ldr	w0, [x0, 632]
	add	w0, w0, 1024
	cmp	w0, 2048
	bhi	.L3959
	b	.L3960
.L4070:
	ldr	x2, .LC966
	mov	w1, 5683
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L3935
.L4073:
	mov	w2, 0
	b	.L3952
.L4081:
	mov	w3, 5909
	ldr	x2, .LC984
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L3935
.L4082:
	mov	w3, 5995
	ldr	x2, .LC990
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, w21
	b	.L3935
.L3966:
	sub	w2, w2, #1
	b	.L3967
.L3963:
	sub	w2, w2, #1
	b	.L3964
.L4076:
	mov	x0, x19
	mov	w20, -1
	bl	MVC_ClearAllSlice
	ldr	w0, [x19, 40]
	mov	w2, 2
	str	w0, [x22, 28]
	mov	w0, 23352
	movk	w0, 0x1, lsl 16
	str	w0, [x22, 32]
	mov	w0, 7
	strb	w2, [x22, 17]
	strb	w0, [x22, 19]
	mov	w2, 32
	mov	w0, 3
	strb	w2, [x22, 18]
	str	w0, [x22, 40]
	mov	w2, 1048576
	mov	w1, w20
	strb	wzr, [x22, 16]
	stp	w20, wzr, [x22, 44]
	stp	wzr, w2, [x22, 52]
	mov	x0, x19
	bl	MVC_ClearDPB
	ldr	w6, [x21, 2484]
	mov	w3, 5834
	ldr	w0, [x22, 4]
.L4064:
	add	x0, x0, 2777088
	ldr	x2, .LC976
	ldr	w5, [x23, 3156]
	mov	w1, w3
	add	x19, x19, x0, lsl 2
	mov	w0, 0
	ldr	w4, [x19, 10668]
	sub	w4, w6, w4
	bl	dprint_normal
	mov	w0, w20
	b	.L3935
.L4085:
	mov	x0, x19
	mov	w20, -1
	bl	MVC_ClearAllSlice
	ldr	w0, [x19, 40]
	mov	w2, 2
	str	w0, [x22, 28]
	mov	w0, 23352
	movk	w0, 0x1, lsl 16
	str	w0, [x22, 32]
	mov	w0, 7
	strb	w2, [x22, 17]
	strb	w0, [x22, 19]
	mov	w2, 32
	mov	w0, 3
	strb	w2, [x22, 18]
	str	w0, [x22, 40]
	mov	w2, 1048576
	mov	w1, w20
	strb	wzr, [x22, 16]
	stp	w20, wzr, [x22, 44]
	stp	wzr, w2, [x22, 52]
	mov	x0, x19
	bl	MVC_ClearDPB
	mov	w3, 5807
	ldr	w6, [x21, 2484]
	ldr	w0, [x22, 4]
	b	.L4064
	.size	MVC_InitPic, .-MVC_InitPic
	.align	3
.LC965:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC966:
	.xword	.LC76
	.align	3
.LC968:
	.xword	.LC967
	.align	3
.LC970:
	.xword	.LC969
	.align	3
.LC972:
	.xword	.LC971
	.align	3
.LC974:
	.xword	.LC973
	.align	3
.LC976:
	.xword	.LC975
	.align	3
.LC978:
	.xword	.LC977
	.align	3
.LC980:
	.xword	.LC979
	.align	3
.LC982:
	.xword	.LC981
	.align	3
.LC984:
	.xword	.LC983
	.align	3
.LC986:
	.xword	.LC985
	.align	3
.LC988:
	.xword	.LC987
	.align	3
.LC990:
	.xword	.LC989
	.align	3
.LC991:
	.xword	.LANCHOR1
	.align	3
.LC993:
	.xword	.LC992
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecSlice
	.type	MVC_DecSlice, %function
MVC_DecSlice:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 11116544
	bl	_mcount
	ldr	w3, [x20, 68]
	mov	w1, 7826
	ldr	x2, .LC994
	mov	w0, 20
	sub	w3, w3, #1
	bl	dprint_normal
	ldr	x1, [x20, 240]
	mov	x0, x20
	ldrb	w2, [x1, 2]
	strb	w2, [x19, 2459]
	ldrb	w1, [x1, 4]
	strb	w1, [x19, 2464]
	bl	MVC_ProcessSliceHeaderFirstPart
	cbnz	w0, .L4133
	mov	x0, x20
	bl	MVC_ProcessSliceHeaderSecondPart
	cbnz	w0, .L4091
	ldr	w3, [x20, 64]
	mov	w4, 0
	add	x21, x20, 11153408
	cbz	w3, .L4093
	sub	w9, w3, #1
	add	x21, x20, 11153408
	add	x9, x9, 1392640
	add	x2, x21, 3512
	add	x9, x9, 1976
	mov	x0, 0
	mov	w10, 0
	mov	w4, 0
	add	x9, x20, x9, lsl 3
	.p2align 2
.L4101:
	ldr	x1, [x2]
	ldr	x6, [x1, 8]
	cbz	x6, .L4113
	ldr	x5, [x1, 40]
	ldr	w7, [x1, 16]
	cbz	x5, .L4114
.L4138:
	ldr	w1, [x1, 48]
.L4096:
	cbz	x0, .L4097
	cmp	x6, x0
	mov	w8, w7
	bls	.L4098
	sub	x0, x6, x0
	sub	w0, w0, w10
	add	w8, w0, w7
.L4098:
	add	w4, w1, w4
	add	w4, w8, w4
.L4099:
	cbz	x5, .L4116
	mov	x0, x5
	mov	w10, w1
.L4100:
	add	x2, x2, 8
	cmp	x9, x2
	bne	.L4101
.L4093:
	str	w4, [x20, 104]
	ldr	w0, [x21, 2800]
	ldr	w5, [x21, 2804]
	mul	w5, w0, w5
	cmp	w5, 1620
	bgt	.L4134
	lsl	w1, w5, 2
	mov	w2, 32769
	sub	w1, w1, w5
	mov	w5, 16384
	lsl	w1, w1, 8
	asr	w0, w1, 1
	cmp	w1, w2
	csel	w5, w0, w5, gt
.L4103:
	ldr	w0, [x20, 32]
	cmp	w0, w3
	bls	.L4104
	cmp	w5, w4
	bcc	.L4104
	ldrb	w0, [x19, 2461]
	cbz	w0, .L4107
	ldr	x2, .LC1002
	mov	w1, 7905
	mov	w0, 3
	bl	dprint_normal
	str	wzr, [x20, 100]
	ldr	w0, [x20, 88]
	add	w0, w0, 1
	str	w0, [x20, 88]
	ldrb	w0, [x21, 2187]
	cbnz	w0, .L4108
	ldr	w0, [x20, 92]
	add	w0, w0, 1
	str	w0, [x20, 92]
.L4109:
	mov	x0, x20
	bl	MVC_InitPic
	cmn	w0, #2
	beq	.L4090
	cbnz	w0, .L4135
	mov	x0, x20
	bl	MVC_WritePicMsg
.L4107:
	mov	x0, x20
	bl	MVC_PicTypeStatistic
	mov	x0, x20
	bl	MVC_DecList
	cbnz	w0, .L4136
	mov	x0, x20
	bl	MVC_IsRefListWrong
	cbnz	w0, .L4137
	mov	x0, x20
	bl	MVC_CalcStreamBits
	mov	x0, x20
	bl	MVC_WriteSliceMsg
	mov	x0, x20
	bl	MVC_ExitSlice
	ldr	w1, [x20, 100]
	mov	w2, 1
	mov	w0, 0
	strb	w2, [x20, 4]
	add	w1, w1, 1
	str	w1, [x20, 100]
.L4090:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L4116:
	mov	x0, x6
	mov	w10, w7
	b	.L4100
	.p2align 3
.L4097:
	add	w4, w7, w4
	add	w4, w4, w1
	b	.L4099
	.p2align 3
.L4113:
	ldr	x5, [x1, 40]
	mov	w7, 0
	cbnz	x5, .L4138
	.p2align 2
.L4114:
	mov	w1, 0
	b	.L4096
	.p2align 3
.L4134:
	lsl	w5, w5, 7
	b	.L4103
	.p2align 3
.L4108:
	ldr	w0, [x20, 96]
	add	w0, w0, 1
	str	w0, [x20, 96]
	b	.L4109
.L4104:
	ldr	x2, .LC998
	mov	w1, 7892
	mov	w0, 0
	bl	dprint_normal
	ldr	w1, [x20, 32]
	ldr	w2, [x20, 64]
	cmp	w2, w1
	bcc	.L4106
	ldr	x0, .LC996
	ldr	x4, [x0]
	cbz	x4, .L4106
	ldr	w0, [x20, 120]
	mov	w3, 8
	stp	w2, w1, [x29, 56]
	add	x2, x29, 56
	mov	w1, 27
	blr	x4
.L4106:
	ldr	x2, .LC1000
	mov	w1, 7899
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x20
	bl	MVC_ClearAllSlice
	add	x1, x20, 11120640
	ldr	w8, [x20, 40]
	mov	w7, 23352
	mov	w0, -1
	movk	w7, 0x1, lsl 16
	mov	w6, 2
	mov	w5, 7
	mov	w4, 32
	mov	w3, 3
	mov	w2, 1048576
	strb	wzr, [x1, 16]
	strb	w6, [x1, 17]
	strb	w5, [x1, 19]
	strb	w4, [x1, 18]
	stp	w8, w7, [x1, 28]
	stp	w3, w0, [x1, 40]
	stp	wzr, wzr, [x1, 48]
	str	w2, [x1, 56]
	b	.L4090
.L4133:
	ldr	x2, .LC995
	mov	w1, 7835
.L4132:
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC996
	ldr	x4, [x0]
	cbz	x4, .L4130
	add	x2, x29, 64
	ldr	w0, [x20, 120]
	mov	w5, -1
	mov	w3, 4
	mov	w1, 9
	str	w5, [x2, -8]!
	blr	x4
.L4130:
	mov	x0, x20
	bl	MVC_ClearCurrSlice
	mov	w0, -1
	b	.L4090
.L4136:
	ldr	x2, .LC1006
	mov	w3, w0
	mov	w1, 7939
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L4090
.L4137:
	ldr	x2, .LC1008
	mov	w1, 7947
	mov	w0, 1
	bl	dprint_normal
	b	.L4130
.L4091:
	ldr	x2, .LC995
	mov	w1, 7845
	b	.L4132
.L4135:
	ldr	x2, .LC1004
	mov	w1, 7926
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L4090
	.size	MVC_DecSlice, .-MVC_DecSlice
	.align	3
.LC994:
	.xword	.LC853
	.align	3
.LC995:
	.xword	.LC855
	.align	3
.LC996:
	.xword	g_EventReportFunc
	.align	3
.LC998:
	.xword	.LC997
	.align	3
.LC1000:
	.xword	.LC999
	.align	3
.LC1002:
	.xword	.LC1001
	.align	3
.LC1004:
	.xword	.LC1003
	.align	3
.LC1006:
	.xword	.LC1005
	.align	3
.LC1008:
	.xword	.LC1007
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecOneNal
	.type	MVC_DecOneNal, %function
MVC_DecOneNal:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	x3, [x19, 240]
	ldr	w0, [x3, 76]
	cbz	w0, .L4144
	ldr	w2, [x19, 104]
	mov	w0, 0
	.p2align 2
.L4143:
	ubfiz	x1, x0, 5, 32
	add	w0, w0, 1
	add	x1, x3, x1
	ldr	w1, [x1, 16]
	add	w2, w2, w1
	str	w2, [x19, 104]
	ldr	w1, [x3, 76]
	cmp	w1, w0
	bhi	.L4143
.L4144:
	add	x22, x19, 872
	strb	wzr, [x3]
	mov	w1, 32
	mov	x0, x22
	bl	BsGet
	mov	w21, w0
	and	w4, w0, 31
	ldr	x0, [x19, 240]
	ubfx	x3, x21, 5, 2
	ubfx	x1, x21, 7, 1
	mov	w2, -1
	strb	w4, [x0, 2]
	ldr	x0, [x19, 240]
	strb	w3, [x0, 4]
	ldr	x0, [x19, 240]
	str	w1, [x0, 84]
	ldr	x1, [x19, 240]
	ldr	w0, [x1, 72]
	add	w0, w0, 32
	str	w0, [x1, 72]
	strb	wzr, [x19, 10]
	ldr	x0, [x19, 240]
	strb	w2, [x0, 5]
	ldr	x0, [x19, 240]
	ldrb	w4, [x0, 2]
	cmp	w4, 20
	beq	.L4323
	ldr	x2, .LC1010
	mov	w1, 10726
	ldr	w3, [x19, 68]
	mov	w0, 20
	bl	dprint_normal
	ldr	w0, [x19, 68]
	cmp	w0, 371
	beq	.L4324
.L4147:
	ldr	x1, [x19, 240]
	add	w0, w0, 1
	str	w0, [x19, 68]
	ldrb	w3, [x1, 2]
	sub	w0, w3, #1
	cmp	w0, 29
	bls	.L4325
.L4148:
	ldr	x2, .LC1052
	mov	w4, w21
	mov	w1, 10944
	mov	w0, 20
	bl	dprint_normal
	cmp	w21, 256
	beq	.L4190
	ldr	x2, .LC1054
	mov	w1, 10948
	mov	w0, 1
	bl	dprint_normal
.L4190:
	ldr	x1, [x19, 240]
	cbz	x1, .L4191
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L4191:
	ldr	x0, .LC1018
	ldr	x4, [x0]
	cbz	x4, .L4306
.L4310:
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L4306:
	mov	w0, 0
.L4330:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L4325:
	ldr	x1, .LC1013
	ldrh	w0, [x1,w0,uxtw #1]
	adr	x1, .Lrtx4150
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx4150:
	.section	.rodata
	.align	0
	.align	2
.L4150:
	.2byte	(.L4149 - .Lrtx4150) / 4
	.2byte	(.L4148 - .Lrtx4150) / 4
	.2byte	(.L4148 - .Lrtx4150) / 4
	.2byte	(.L4148 - .Lrtx4150) / 4
	.2byte	(.L4149 - .Lrtx4150) / 4
	.2byte	(.L4151 - .Lrtx4150) / 4
	.2byte	(.L4152 - .Lrtx4150) / 4
	.2byte	(.L4153 - .Lrtx4150) / 4
	.2byte	(.L4154 - .Lrtx4150) / 4
	.2byte	(.L4155 - .Lrtx4150) / 4
	.2byte	(.L4156 - .Lrtx4150) / 4
	.2byte	(.L4157 - .Lrtx4150) / 4
	.2byte	(.L4158 - .Lrtx4150) / 4
	.2byte	(.L4159 - .Lrtx4150) / 4
	.2byte	(.L4160 - .Lrtx4150) / 4
	.2byte	(.L4148 - .Lrtx4150) / 4
	.2byte	(.L4148 - .Lrtx4150) / 4
	.2byte	(.L4148 - .Lrtx4150) / 4
	.2byte	(.L4161 - .Lrtx4150) / 4
	.2byte	(.L4148 - .Lrtx4150) / 4
	.2byte	(.L4148 - .Lrtx4150) / 4
	.2byte	(.L4148 - .Lrtx4150) / 4
	.2byte	(.L4148 - .Lrtx4150) / 4
	.2byte	(.L4148 - .Lrtx4150) / 4
	.2byte	(.L4148 - .Lrtx4150) / 4
	.2byte	(.L4148 - .Lrtx4150) / 4
	.2byte	(.L4148 - .Lrtx4150) / 4
	.2byte	(.L4148 - .Lrtx4150) / 4
	.2byte	(.L4148 - .Lrtx4150) / 4
	.2byte	(.L4162 - .Lrtx4150) / 4
	.text
.L4162:
	ldr	x2, .LC1049
	mov	w3, 30
	mov	w1, 10914
	mov	w0, 20
	bl	dprint_normal
	cbnz	w20, .L4188
	ldr	x1, [x19, 240]
	cbz	x1, .L4188
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L4188:
	mov	w1, 32
	mov	x0, x22
	bl	BsGet
	mov	w20, w0
	mov	w1, 32
	mov	x0, x22
	rev	w20, w20
	bl	BsGet
	rev	w0, w0
	ldr	x1, .LC1050
	add	x1, x1, 432
	ldr	w2, [x1, 4]
	ldr	w1, [x1, 8]
	cmp	w2, w20
	ccmp	w1, w0, 0, eq
	bne	.L4306
	ldr	x20, .LC1018
	ldr	x4, [x20]
	cbz	x4, .L4189
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	blr	x4
.L4189:
	strb	wzr, [x19]
	mov	x0, x19
	bl	MVC_DecVDM
	cbz	w0, .L4306
.L4317:
	ldr	x4, [x20]
	cbz	x4, .L4305
.L4307:
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L4305:
	mov	w0, -1
.L4329:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L4149:
	ldr	x2, .LC1015
	mov	w1, 10739
	ldr	w4, [x19, 80]
	mov	w0, 20
	bl	dprint_normal
	ldr	x1, [x19, 240]
	add	x2, x19, 11116544
	add	x5, x19, 11120640
	add	x0, x19, 12288
	mov	w3, -1
	ldrb	w6, [x1, 2]
	strb	w6, [x2, 2459]
	ldrb	w4, [x1, 4]
	strb	w4, [x2, 2464]
	ldrsb	w1, [x1, 5]
	strb	w1, [x2, 2468]
	strb	wzr, [x2, 2467]
	str	w3, [x5]
	ldrb	w3, [x0, 2384]
	cmp	w3, 1
	beq	.L4326
	cmn	w1, #1
	beq	.L4327
.L4164:
	ldr	x2, .LC1017
	mov	w1, 10774
	ldr	w3, [x19, 88]
	mov	w0, 19
	bl	dprint_normal
	mov	x0, x19
	bl	MVC_SliceCheck
	cbnz	w0, .L4328
	mov	x0, x19
	bl	MVC_DecSlice
	cmn	w0, #2
	beq	.L4175
	cbz	w0, .L4306
	ldr	x0, .LC1018
	ldr	x4, [x0]
	cbnz	x4, .L4307
	mov	w0, -1
	b	.L4329
	.p2align 3
.L4154:
	ldr	x2, .LC1032
	mov	w1, 10845
	mov	w3, 9
	mov	w0, 20
	bl	dprint_normal
	ldr	x1, [x19, 240]
	cbz	x1, .L4306
	.p2align 2
.L4309:
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
	mov	w0, 0
.L4175:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L4155:
	ldr	x2, .LC1034
	mov	w1, 10850
	mov	w3, 10
	mov	w0, 20
	bl	dprint_normal
	ldr	x1, [x19, 240]
	cbnz	x1, .L4309
	mov	w0, 0
	b	.L4330
.L4156:
	ldr	x2, .LC1038
	mov	w3, 11
	mov	w1, 10860
	mov	w0, 20
	bl	dprint_normal
	mov	w1, 32
	mov	x0, x22
	bl	BsGet
	mov	w20, w0
	mov	w1, 32
	mov	x0, x22
	bl	BsGet
	mov	w2, 20553
	mov	w1, 20036
	movk	w2, 0x4853, lsl 16
	movk	w1, 0x4345, lsl 16
	cmp	w20, w2
	ccmp	w0, w1, 0, eq
	bne	.L4315
	ldr	x20, .LC1018
	mov	w0, 1
	strb	w0, [x19, 1]
	ldr	x4, [x20]
	cbz	x4, .L4185
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	blr	x4
.L4185:
	strb	wzr, [x19]
	mov	x0, x19
	bl	MVC_DecVDM
	cbz	w0, .L4315
	b	.L4317
.L4157:
	ldr	x2, .LC1036
	mov	w1, 10855
	mov	w3, 12
	mov	w0, 20
	bl	dprint_normal
	ldr	x1, [x19, 240]
	cbnz	x1, .L4309
	mov	w0, 0
	b	.L4330
.L4158:
	ldr	x2, .LC1040
	mov	w1, 10882
	mov	w3, 13
	mov	w0, 20
	bl	dprint_normal
	ldr	x1, [x19, 240]
	cbnz	x1, .L4309
	mov	w0, 0
	b	.L4330
.L4159:
	ldr	x2, .LC1042
	mov	w1, 10888
	mov	w3, 14
	mov	w0, 20
	bl	dprint_normal
	ldr	x1, [x19, 240]
	cbnz	x1, .L4309
	mov	w0, 0
	b	.L4330
.L4160:
	ldr	x2, .LC1044
	mov	w1, 10893
	mov	w3, 15
	mov	w0, 20
	bl	dprint_normal
	mov	x0, x19
	bl	MVC_DecSubSPS
	mov	w20, w0
	ldr	x1, [x19, 240]
	cbz	x1, .L4186
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L4186:
	cbnz	w20, .L4331
	ldr	w1, [x19, 20]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 20]
	b	.L4175
.L4161:
	ldr	x2, .LC1047
	mov	w3, 19
	mov	w1, 10909
	mov	w0, 20
	bl	dprint_normal
.L4315:
	ldr	x1, [x19, 240]
	cbnz	x1, .L4309
	mov	w0, 0
	b	.L4330
.L4152:
	ldr	x2, .LC1024
	mov	w1, 10815
	ldr	w4, [x19, 72]
	mov	w3, 7
	mov	w0, 20
	bl	dprint_normal
	mov	x0, x19
	bl	MVC_DecSPS
	mov	w20, w0
	ldr	x1, [x19, 240]
	cbz	x1, .L4180
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L4180:
	cbnz	w20, .L4332
	ldr	w1, [x19, 72]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 72]
	b	.L4175
.L4153:
	ldr	x2, .LC1020
	mov	w1, 10799
	ldr	w4, [x19, 76]
	mov	w3, 8
	mov	w0, 20
	bl	dprint_normal
	mov	x0, x19
	bl	MVC_DecPPS
	mov	w20, w0
	ldr	x1, [x19, 240]
	cbz	x1, .L4178
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L4178:
	cbnz	w20, .L4333
	ldr	w1, [x19, 76]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 76]
	b	.L4175
.L4151:
	ldr	x2, .LC1028
	mov	w1, 10832
	mov	w3, 6
	mov	w0, 20
	bl	dprint_normal
	mov	x0, x19
	bl	MVC_DecSEI
	mov	w20, w0
	ldr	x1, [x19, 240]
	cbz	x1, .L4182
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L4182:
	cbz	w20, .L4306
	ldr	x2, .LC1030
	mov	w1, 10838
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC1018
	ldr	x4, [x0]
	cbnz	x4, .L4310
	mov	w0, 0
	b	.L4330
	.p2align 3
.L4323:
	mov	w1, 24
	mov	x0, x22
	bl	BsGet
	mov	w21, w0
	ldr	x0, [x19, 240]
	ubfx	x1, x21, 23, 1
	strb	w1, [x0, 5]
	ldr	x1, [x19, 240]
	ldrsb	w0, [x1, 5]
	cbnz	w0, .L4145
	add	x0, x19, 12288
	ubfx	x4, x21, 16, 6
	ubfx	x2, x21, 6, 10
	mov	w5, 1
	ubfx	x3, x21, 22, 1
	strb	w4, [x0, 2386]
	ubfx	x4, x21, 3, 3
	strb	w5, [x0, 2384]
	strb	w3, [x0, 2385]
	str	w2, [x19, 14680]
	ubfx	x2, x21, 2, 1
	strb	w4, [x0, 2387]
	ubfx	x4, x21, 1, 1
	strb	w2, [x0, 2388]
	and	w2, w21, 1
	strb	w4, [x0, 2389]
	strb	w2, [x0, 2390]
	ldrb	w0, [x1, 2]
	cmp	w0, 20
	beq	.L4334
.L4145:
	ldr	w0, [x1, 72]
	ldr	x2, .LC1010
	add	w0, w0, 24
	str	w0, [x1, 72]
	mov	w1, 10726
	ldr	x0, [x19, 240]
	ldr	w3, [x19, 68]
	ldrb	w4, [x0, 2]
	mov	w0, 20
	bl	dprint_normal
	ldr	w0, [x19, 68]
	cmp	w0, 371
	bne	.L4147
	.p2align 2
.L4324:
	ldr	x2, .LC1012
	mov	w1, 10730
	mov	w0, 20
	bl	dprint_normal
	ldr	w0, [x19, 68]
	b	.L4147
.L4328:
	mov	x0, x19
	bl	MVC_ClearCurrSlice
	ldr	x0, .LC1018
	ldr	x4, [x0]
	cbnz	x4, .L4307
	mov	w0, -1
	b	.L4329
.L4333:
	ldr	x2, .LC1022
	mov	w1, 10805
.L4319:
	mov	w0, 1
	bl	dprint_normal
	ldr	x21, .LC1018
	ldr	x4, [x21]
	cbz	x4, .L4305
	add	x2, x29, 64
	ldr	w0, [x19, 120]
	mov	w20, -1
	mov	w3, 4
	mov	w1, 9
	str	w20, [x2, -8]!
	blr	x4
	ldr	x4, [x21]
	cbz	x4, .L4305
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
	mov	w0, w20
	b	.L4175
.L4332:
	ldr	x2, .LC1026
	mov	w1, 10821
	b	.L4319
.L4331:
	ldr	x2, .LC1045
	mov	w1, 10899
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC1018
	ldr	x4, [x0]
	cbz	x4, .L4305
	add	x2, x29, 64
	ldr	w0, [x19, 120]
	mov	w20, -1
	mov	w3, 4
	mov	w1, 9
	str	w20, [x2, -8]!
	blr	x4
	mov	w0, w20
	b	.L4175
.L4327:
	ldr	w1, [x19, 20]
	cbz	w1, .L4164
	add	x1, x19, 10768384
	ldr	w3, [x1, 4064]
	cbz	w3, .L4167
	ldrb	w3, [x1, 4060]
	cmp	w3, 1
	beq	.L4168
.L4167:
	add	x0, x0, 2400
	mov	x1, 0
	.p2align 2
.L4171:
	ldr	w4, [x0]
	add	x3, x0, 335872
	cbz	w4, .L4169
	ldrb	w0, [x0, -4]
	cbnz	w0, .L4335
.L4169:
	add	w1, w1, 1
	add	x0, x3, 308
	cmp	w1, 32
	bne	.L4171
	mov	w0, -1
.L4304:
	cmn	w0, #1
	str	w0, [x5]
	beq	.L4164
	cmp	w6, 5
	mov	w0, 1
	cset	w1, eq
	strb	w0, [x2, 2467]
	strb	w0, [x2, 2466]
	strb	w1, [x2, 2465]
	b	.L4164
.L4326:
	strb	w3, [x2, 2467]
	ldr	w1, [x19, 14680]
	str	w1, [x5]
	ldrb	w1, [x0, 2388]
	strb	w1, [x2, 2465]
	ldrb	w1, [x0, 2389]
	strb	w1, [x2, 2466]
	strb	wzr, [x0, 2384]
	b	.L4164
.L4334:
	mov	w0, 5
	cmp	w3, wzr
	csinc	w0, w0, wzr, eq
	strb	w0, [x1, 2]
	ldr	x1, [x19, 240]
	b	.L4145
.L4335:
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 4
	sub	x1, x0, x1
	lsl	x0, x1, 2
	sub	x1, x0, x1
	lsl	x0, x1, 6
	add	x0, x1, x0
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 14692]
	b	.L4304
.L4168:
	ldr	w0, [x1, 4068]
	b	.L4304
	.size	MVC_DecOneNal, .-MVC_DecOneNal
	.align	3
.LC1010:
	.xword	.LC1009
	.align	3
.LC1012:
	.xword	.LC1011
	.align	3
.LC1013:
	.xword	.L4150
	.align	3
.LC1015:
	.xword	.LC1014
	.align	3
.LC1017:
	.xword	.LC1016
	.align	3
.LC1018:
	.xword	g_EventReportFunc
	.align	3
.LC1020:
	.xword	.LC1019
	.align	3
.LC1022:
	.xword	.LC1021
	.align	3
.LC1024:
	.xword	.LC1023
	.align	3
.LC1026:
	.xword	.LC1025
	.align	3
.LC1028:
	.xword	.LC1027
	.align	3
.LC1030:
	.xword	.LC1029
	.align	3
.LC1032:
	.xword	.LC1031
	.align	3
.LC1034:
	.xword	.LC1033
	.align	3
.LC1036:
	.xword	.LC1035
	.align	3
.LC1038:
	.xword	.LC1037
	.align	3
.LC1040:
	.xword	.LC1039
	.align	3
.LC1042:
	.xword	.LC1041
	.align	3
.LC1044:
	.xword	.LC1043
	.align	3
.LC1045:
	.xword	.LC729
	.align	3
.LC1047:
	.xword	.LC1046
	.align	3
.LC1049:
	.xword	.LC1048
	.align	3
.LC1050:
	.xword	.LANCHOR2
	.align	3
.LC1052:
	.xword	.LC1051
	.align	3
.LC1054:
	.xword	.LC1053
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DEC_DecodePacket
	.type	MVC_DEC_DecodePacket, %function
MVC_DEC_DecodePacket:
	sub	sp, sp, #96
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	str	x21, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	str	wzr, [x29, 68]
	stp	wzr, wzr, [x29, 60]
	cbz	x20, .L4398
	ldr	x0, [x19, 224]
	ldrb	w1, [x19, 5]
	ldr	w2, [x0, 8]
	cmp	w1, 1
	ubfiz	w2, w2, 16, 2
	str	w2, [x19, 108]
	ldr	w1, [x0]
	str	w1, [x19, 112]
	ldr	w1, [x0, 4]
	str	w1, [x19, 116]
	strb	wzr, [x19, 10]
	beq	.L4339
	ldr	w1, [x0, 856]
	add	x21, x19, 11157504
	cmp	w1, 1
	beq	.L4399
.L4340:
	mov	x1, x20
	mov	x0, x19
	bl	MVC_ReceivePacket
	ldr	x1, [x19, 240]
	str	x1, [x21, 1456]
.L4342:
	strb	wzr, [x19, 5]
	cbz	w0, .L4343
.L4362:
	mov	w0, 0
.L4391:
	add	sp, x29, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4343:
	ldr	x0, [x19, 240]
.L4341:
	str	wzr, [x0, 72]
	add	x21, x19, 872
	mov	x0, x21
	ldr	x1, [x19, 240]
	ldr	w2, [x1, 16]
	ldr	x1, [x1, 8]
	bl	BsInit
	mov	w1, 32
	mov	x0, x21
	bl	BsGet
	mov	w20, w0
	and	w3, w0, 31
	ldr	x0, [x19, 240]
	ubfx	x2, x20, 5, 2
	mov	w1, -1
	strb	w3, [x0, 2]
	ldr	x0, [x19, 240]
	strb	w2, [x0, 4]
	ldr	x0, [x19, 240]
	strb	w1, [x0, 5]
	ldr	x0, [x19, 240]
	ldrb	w0, [x0, 2]
	cmp	w0, 20
	beq	.L4400
.L4392:
	mov	w0, 27
	strb	wzr, [x19, 10]
	and	w20, w20, w0
	cmp	w20, 1
	beq	.L4348
.L4349:
	mov	x0, x19
	bl	MVC_FindTrailZeros
	cbnz	w0, .L4401
.L4361:
	ldr	x1, [x19, 240]
	mov	x0, x21
	str	wzr, [x1, 72]
	ldr	x1, [x19, 240]
	ldr	w2, [x1, 16]
	ldr	x1, [x1, 8]
	bl	BsInit
	mov	w1, 0
	mov	x0, x19
	bl	MVC_DecOneNal
	cmn	w0, #2
	beq	.L4391
	cbz	w0, .L4362
.L4396:
	ldr	x0, .LC1062
	ldr	x4, [x0]
	cbz	x4, .L4394
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L4394:
	add	sp, x29, 0
	mov	w0, -1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4399:
	ldr	w0, [x0, 888]
	cmp	w0, 1
	bne	.L4340
	ldr	w0, [x21, 1448]
	cmp	w0, 1
	bne	.L4340
	ldr	x0, [x21, 1456]
	str	x0, [x19, 240]
	str	wzr, [x21, 1448]
	strb	wzr, [x19, 5]
	b	.L4341
	.p2align 3
.L4339:
	ldr	x0, [x19, 240]
	cmp	x0, xzr
	csetm	w0, eq
	b	.L4342
	.p2align 3
.L4400:
	mov	w1, 24
	mov	x0, x21
	bl	BsGet
	ubfx	x2, x0, 23, 1
	ldr	x1, [x19, 240]
	strb	w2, [x1, 5]
	ldr	x2, [x19, 240]
	ldrsb	w1, [x2, 5]
	cbnz	w1, .L4392
	add	x1, x19, 12288
	ubfx	x4, x0, 22, 1
	mov	w6, 1
	ubfx	x3, x0, 6, 10
	ubfx	x5, x0, 2, 1
	cmp	w4, wzr
	strb	w6, [x1, 2384]
	ubfx	x0, x0, 1, 1
	strb	w4, [x1, 2385]
	str	w3, [x19, 14680]
	mov	w3, 5
	strb	w0, [x1, 2389]
	csinc	w0, w3, wzr, eq
	strb	w5, [x1, 2388]
	strb	w0, [x2, 2]
	strb	wzr, [x19, 10]
	.p2align 2
.L4348:
	add	x2, x29, 76
	add	x1, x29, 72
	mov	x0, x19
	bl	MVC_InquireSliceProperty
	cbnz	w0, .L4350
	ldr	w1, [x29, 72]
	ldr	w0, [x19, 128]
	cmp	w1, 1
	csinc	w0, w0, w0, ne
	str	w0, [x19, 128]
	beq	.L4402
.L4351:
	ldr	w0, [x29, 76]
	cmp	w0, 1
	bne	.L4349
	mov	w1, -1
	mov	x0, x19
	bl	MVC_FlushDPB
	cbnz	w0, .L4403
.L4358:
	ldr	w0, [x19, 120]
	add	x3, x29, 68
	add	x2, x29, 64
	add	x1, x29, 60
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x19, 224]
	ldr	w3, [x0, 736]
	cmp	w3, 1
	bne	.L4349
	ldr	w0, [x29, 68]
	cmp	w0, wzr
	ble	.L4404
.L4355:
	mov	w1, 1
	mov	w0, -2
	strb	w1, [x19, 5]
	b	.L4391
	.p2align 3
.L4401:
	ldr	x2, .LC1064
	mov	w1, 11670
	mov	w0, 20
	bl	dprint_normal
	b	.L4361
	.p2align 3
.L4350:
	ldr	x1, [x19, 240]
	cbz	x1, .L4396
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
	b	.L4396
	.p2align 3
.L4402:
	add	x20, x19, 11116544
	ldrb	w0, [x20, 2457]
	cmp	w0, 1
	ldr	w0, [x19, 132]
	beq	.L4405
	add	w0, w0, 2
	str	w0, [x19, 132]
.L4353:
	ldr	w0, [x19, 64]
	cbz	w0, .L4351
	ldr	x3, [x19, 240]
	mov	w2, 12
	ldr	x1, .LC1058
	mov	x0, x21
	add	x1, x1, 432
	str	wzr, [x3, 72]
	bl	BsInit
	mov	w1, 1
	mov	x0, x19
	bl	MVC_DecOneNal
	ldrb	w0, [x20, 2457]
	cmp	w0, 1
	ldr	w0, [x19, 132]
	beq	.L4406
	sub	w0, w0, #2
	str	w0, [x19, 132]
	b	.L4355
.L4405:
	add	w0, w0, 1
	str	w0, [x19, 132]
	b	.L4353
.L4403:
	mov	w3, 11633
	ldr	x2, .LC1059
	mov	w4, 0
	mov	w1, w3
	mov	w0, 20
	bl	dprint_normal
	b	.L4358
.L4398:
	mov	w4, 11522
	ldr	x3, .LC1056
	ldr	x2, .LC1057
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L4391
.L4406:
	sub	w0, w0, #1
	str	w0, [x19, 132]
	b	.L4355
.L4404:
	ldr	w0, [x29, 64]
	cmp	w0, 32
	bgt	.L4355
	ldr	x0, [x19, 232]
	cbnz	x0, .L4355
	ldr	w4, [x19, 88]
	cbz	w4, .L4349
	ldr	w7, [x19, 12]
	cbz	w7, .L4349
	add	x20, x19, 11157504
	ldr	w0, [x19, 16]
	ldr	w6, [x20, 1464]
	cmp	w0, w6
	beq	.L4349
	ldr	w5, [x20, 1468]
	cmp	w7, w5
	beq	.L4349
	ldr	x2, .LC1061
	mov	w1, 11650
	str	w0, [sp]
	mov	w0, w3
	bl	dprint_normal
	ldr	w0, [x19, 16]
	ldr	x1, .LC1062
	str	w0, [x20, 1464]
	ldr	x4, [x1]
	ldr	w0, [x19, 12]
	str	w0, [x20, 1468]
	cbz	x4, .L4349
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 48
	blr	x4
	b	.L4349
	.size	MVC_DEC_DecodePacket, .-MVC_DEC_DecodePacket
	.align	3
.LC1056:
	.xword	.LC37
	.align	3
.LC1057:
	.xword	.LC39
	.align	3
.LC1058:
	.xword	.LANCHOR2
	.align	3
.LC1059:
	.xword	.LC969
	.align	3
.LC1061:
	.xword	.LC1060
	.align	3
.LC1062:
	.xword	g_EventReportFunc
	.align	3
.LC1064:
	.xword	.LC1063
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DEC_VDMPostProc
	.type	MVC_DEC_VDMPostProc, %function
MVC_DEC_VDMPostProc:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldrb	w0, [x19]
	cbnz	w0, .L4408
	add	x21, x19, 11153408
	mov	x0, x19
	str	w20, [x21, 2796]
	bl	MVC_ClearAllSlice
	mov	x0, x19
	bl	MVC_StorePicInDpb
	mov	w22, w0
	cbnz	w0, .L4419
	mov	w1, 1
	strb	w1, [x19, 4]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L4408:
	add	x2, x19, 11153408
	mov	x0, x19
	str	w20, [x2, 2796]
	bl	MVC_ClearAllSlice
	mov	x0, x19
	bl	MVC_StorePicInDpb
	cbnz	w0, .L4420
	mov	w1, -1
	mov	x0, x19
	bl	MVC_FlushDPB
	cbnz	w0, .L4421
.L4412:
	add	x0, x19, 11120640
	strb	wzr, [x19, 4]
	ldr	w8, [x19, 40]
	mov	w7, 23352
	movk	w7, 0x1, lsl 16
	mov	w6, 2
	strb	wzr, [x0, 16]
	mov	w5, 7
	strb	w6, [x0, 17]
	mov	w4, 32
	strb	w5, [x0, 19]
	mov	w3, 3
	strb	w4, [x0, 18]
	mov	w2, -1
	stp	w8, w7, [x0, 28]
	stp	w3, w2, [x0, 40]
	stp	wzr, wzr, [x0, 48]
	mov	w1, 1048576
	str	w1, [x0, 56]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L4419:
	ldr	x1, [x21, 2736]
	mov	w20, -1
	ldr	w0, [x19, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_ClearLogicFs
	ldr	x2, .LC1066
	mov	w3, w22
	mov	w1, 11748
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x19
	bl	MVC_ClearAllSlice
	add	x0, x19, 11120640
	mov	w2, 2
	mov	w1, 7
	ldr	w4, [x19, 40]
	mov	w3, 23352
	strb	w2, [x0, 17]
	mov	w2, 32
	strb	w1, [x0, 19]
	mov	w1, 3
	movk	w3, 0x1, lsl 16
	strb	w2, [x0, 18]
	stp	w1, w20, [x0, 40]
	mov	w2, 1048576
	mov	w1, w20
	stp	w4, w3, [x0, 28]
	str	w2, [x0, 56]
	strb	wzr, [x0, 16]
	stp	wzr, wzr, [x0, 48]
	mov	x0, x19
	bl	MVC_ClearDPB
	str	xzr, [x21, 2736]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L4421:
	ldr	x2, .LC1070
	mov	w3, w0
	mov	w1, 11774
	mov	w0, 1
	bl	dprint_normal
	b	.L4412
	.p2align 3
.L4420:
	ldr	x2, .LC1068
	mov	w3, w0
	mov	w1, 11767
	mov	w0, 1
	bl	dprint_normal
	mov	w1, -1
	mov	x0, x19
	bl	MVC_FlushDPB
	cbz	w0, .L4412
	b	.L4421
	.size	MVC_DEC_VDMPostProc, .-MVC_DEC_VDMPostProc
	.align	3
.LC1066:
	.xword	.LC1065
	.align	3
.LC1068:
	.xword	.LC1067
	.align	3
.LC1070:
	.xword	.LC1069
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DEC_GetImageBuffer
	.type	MVC_DEC_GetImageBuffer, %function
MVC_DEC_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w6, [x19, 48]
	cbz	w6, .L4431
	add	x7, x19, 11124736
	mov	w5, 0
	add	x4, x7, 776
	.p2align 2
.L4429:
	ldrb	w0, [x4, 2]
	cbnz	w0, .L4425
	cbz	x4, .L4426
	ldr	w0, [x7, 408]
	cbz	w0, .L4426
	ldr	x2, [x7, 24]
	cmp	x2, x4
	ccmp	x2, xzr, 4, eq
	bne	.L4425
	sub	w3, w0, #1
	add	x0, x7, 32
	add	x3, x3, 1388544
	add	x3, x3, 2052
	add	x3, x19, x3, lsl 3
	b	.L4427
	.p2align 3
.L4428:
	ldr	x2, [x0], 8
	cmp	x2, x4
	ccmp	x2, xzr, 4, eq
	bne	.L4425
.L4427:
	cmp	x0, x3
	bne	.L4428
.L4426:
	cmp	w6, w5
	bls	.L4442
	ldr	w0, [x19, 120]
	bl	FSP_IsNewFsAvailable
	cmp	w0, 1
	beq	.L4431
	cmn	w0, #1
	beq	.L4443
.L4442:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L4425:
	add	w5, w5, 1
	add	x4, x4, 752
	cmp	w6, w5
	bne	.L4429
	b	.L4442
.L4431:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L4443:
	ldr	w0, [x19, 120]
	add	x1, x19, 912
	bl	FSP_ClearNotInVoQueue
	b	.L4442
	.size	MVC_DEC_GetImageBuffer, .-MVC_DEC_GetImageBuffer
	.global	MvcTmpBuf
	.global	MVC_quant8_org
	.global	MVC_quant_org
	.global	MVC_quant8_inter_default
	.global	MVC_quant8_intra_default
	.global	MVC_quant_inter_default
	.global	MVC_quant_intra_default
	.global	MVC_g_ZZ_SCAN8
	.global	MVC_g_ZZ_SCAN
	.global	MVC_CalcZeroNum
	.global	MVC_g_AspecRatioIdc
	.global	MVC_g_NalTypeEOPIC
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.10065, %object
	.size	__func__.10065, 20
__func__.10065:
	.string	"MVC_CheckFrameStore"
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.10318, %object
	.size	__func__.10318, 19
__func__.10318:
	.string	"MVC_ArrangeVahbMem"
	.zero	5
	.type	__FUNCTION__.10914, %object
	.size	__FUNCTION__.10914, 18
__FUNCTION__.10914:
	.string	"MVC_WriteSliceMsg"
	.zero	6
	.type	MVC_g_ZZ_SCAN, %object
	.size	MVC_g_ZZ_SCAN, 16
MVC_g_ZZ_SCAN:
	.byte	0
	.byte	1
	.byte	4
	.byte	8
	.byte	5
	.byte	2
	.byte	3
	.byte	6
	.byte	9
	.byte	12
	.byte	13
	.byte	10
	.byte	7
	.byte	11
	.byte	14
	.byte	15
	.type	MVC_g_ZZ_SCAN8, %object
	.size	MVC_g_ZZ_SCAN8, 64
MVC_g_ZZ_SCAN8:
	.byte	0
	.byte	1
	.byte	8
	.byte	16
	.byte	9
	.byte	2
	.byte	3
	.byte	10
	.byte	17
	.byte	24
	.byte	32
	.byte	25
	.byte	18
	.byte	11
	.byte	4
	.byte	5
	.byte	12
	.byte	19
	.byte	26
	.byte	33
	.byte	40
	.byte	48
	.byte	41
	.byte	34
	.byte	27
	.byte	20
	.byte	13
	.byte	6
	.byte	7
	.byte	14
	.byte	21
	.byte	28
	.byte	35
	.byte	42
	.byte	49
	.byte	56
	.byte	57
	.byte	50
	.byte	43
	.byte	36
	.byte	29
	.byte	22
	.byte	15
	.byte	23
	.byte	30
	.byte	37
	.byte	44
	.byte	51
	.byte	58
	.byte	59
	.byte	52
	.byte	45
	.byte	38
	.byte	31
	.byte	39
	.byte	46
	.byte	53
	.byte	60
	.byte	61
	.byte	54
	.byte	47
	.byte	55
	.byte	62
	.byte	63
	.type	MVC_SarTable.11204, %object
	.size	MVC_SarTable.11204, 136
MVC_SarTable.11204:
	.word	1
	.word	1
	.word	1
	.word	1
	.word	12
	.word	11
	.word	10
	.word	11
	.word	16
	.word	11
	.word	40
	.word	33
	.word	24
	.word	11
	.word	20
	.word	11
	.word	32
	.word	11
	.word	80
	.word	33
	.word	18
	.word	11
	.word	15
	.word	11
	.word	64
	.word	33
	.word	160
	.word	99
	.word	4
	.word	3
	.word	3
	.word	2
	.word	2
	.word	1
	.type	__func__.11427, %object
	.size	__func__.11427, 11
__func__.11427:
	.string	"MVC_DecSEI"
	.zero	5
	.type	__func__.10115, %object
	.size	__func__.10115, 21
__func__.10115:
	.string	"MVC_OutputFrmFromDPB"
	.zero	3
	.type	__func__.10163, %object
	.size	__func__.10163, 17
__func__.10163:
	.string	"MVC_DirectOutput"
	.zero	7
	.type	__func__.10700, %object
	.size	__func__.10700, 12
__func__.10700:
	.string	"MVC_InitDPB"
	.zero	4
	.type	__FUNCTION__.9877, %object
	.size	__FUNCTION__.9877, 13
__FUNCTION__.9877:
	.string	"MVC_ClearDPB"
	.zero	3
	.type	__FUNCTION__.9885, %object
	.size	__FUNCTION__.9885, 13
__FUNCTION__.9885:
	.string	"MVC_ClearAll"
	.zero	3
	.type	__func__.10149, %object
	.size	__func__.10149, 19
__func__.10149:
	.string	"MVC_InsertFrmInDPB"
	.zero	5
	.type	__FUNCTION__.11660, %object
	.size	__FUNCTION__.11660, 13
__FUNCTION__.11660:
	.string	"MVC_DEC_Init"
	.zero	3
	.type	__func__.10292, %object
	.size	__func__.10292, 18
__func__.10292:
	.string	"MVC_StorePicInDpb"
	.zero	6
	.type	__func__.10855, %object
	.size	__func__.10855, 12
__func__.10855:
	.string	"MVC_InitPic"
	.data
	.align	3
.LANCHOR2 = . + 0
	.type	MVC_quant_intra_default, %object
	.size	MVC_quant_intra_default, 16
MVC_quant_intra_default:
	.word	471076102
	.word	538711053
	.word	622861332
	.word	707076124
	.type	MVC_quant_inter_default, %object
	.size	MVC_quant_inter_default, 16
MVC_quant_inter_default:
	.word	403967498
	.word	454562830
	.word	505092116
	.word	572398360
	.type	MVC_quant8_intra_default, %object
	.size	MVC_quant8_intra_default, 64
MVC_quant8_intra_default:
	.word	269289990
	.word	454629138
	.word	303041290
	.word	488315159
	.word	387059725
	.word	522001177
	.word	420942352
	.word	555687195
	.word	454629138
	.word	606150429
	.word	488315159
	.word	639901983
	.word	522001177
	.word	673588257
	.word	555687195
	.word	707274276
	.type	MVC_quant8_inter_default, %object
	.size	MVC_quant8_inter_default, 256
MVC_quant8_inter_default:
	.word	286199049
	.word	404100371
	.word	319884557
	.word	421008917
	.word	353571087
	.word	454629398
	.word	370479889
	.word	471537944
	.word	404100371
	.word	505158425
	.word	421008917
	.word	538844187
	.word	454629398
	.word	555752988
	.word	471537944
	.word	589373470
	.zero	192
	.type	MVC_quant_org, %object
	.size	MVC_quant_org, 16
MVC_quant_org:
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.type	MVC_quant8_org, %object
	.size	MVC_quant8_org, 64
MVC_quant8_org:
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.type	MVC_g_NalTypeEOPIC, %object
	.size	MVC_g_NalTypeEOPIC, 12
MVC_g_NalTypeEOPIC:
	.byte	0
	.byte	0
	.byte	1
	.byte	30
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.zero	4
	.type	MVC_CalcZeroNum, %object
	.size	MVC_CalcZeroNum, 256
MVC_CalcZeroNum:
	.byte	8
	.byte	7
	.byte	6
	.byte	6
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	MVC_g_AspecRatioIdc, %object
	.size	MVC_g_AspecRatioIdc, 112
MVC_g_AspecRatioIdc:
	.word	1
	.word	1
	.word	1
	.word	1
	.word	12
	.word	11
	.word	10
	.word	11
	.word	16
	.word	11
	.word	40
	.word	33
	.word	24
	.word	11
	.word	20
	.word	11
	.word	32
	.word	11
	.word	80
	.word	33
	.word	18
	.word	11
	.word	15
	.word	11
	.word	64
	.word	33
	.word	160
	.word	99
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	ASCII(.string	"\n\nEND of the bit buffer, copy the first packet!\n\n" )
	.zero	6
.LC2:
	ASCII(.string	"0:phy:0x%x, 1:phy:0x%x; len0:%d len1:%d\n" )
	.zero	7
.LC5:
	ASCII(.string	"0:phy:0x%x, len0:%d\n" )
	.zero	3
.LC7:
	ASCII(.string	"%-50s%50d\n" )
	.zero	5
.LC15:
	ASCII(.string	"%s pstLogicFs = NULL!\n" )
	.zero	1
.LC17:
	ASCII(.string	"%s LogicFs FsState %d invalid!\n" )
.LC19:
	ASCII(.string	"not used MVC_FRAME: (%d,%d)\n" )
	.zero	3
.LC21:
	ASCII(.string	"MVC_FRAME skip: is_used=%d,skip=%d\n" )
	.zero	4
.LC23:
	ASCII(.string	"topfield skip\n" )
	.zero	1
.LC25:
	ASCII(.string	"bottom field skip\n" )
	.zero	5
.LC27:
	ASCII(.string	"err(%d) > out_thr(%d)\n" )
	.zero	1
.LC29:
	ASCII(.string	"Chan:%d exg_pts: %lld <-> %lld\n" )
.LC32:
	ASCII(.string	"stream MVC_FRAME packing type is %d! what can we do?\n" )
	.zero	2
.LC37:
	ASCII(.string	"../../core/syntax/mvc.c" )
.LC39:
	ASCII(.string	"NULL pointer: %s, L%d\n" )
	.zero	1
.LC41:
	ASCII(.string	"framestore %d allocate apc %d\n" )
	.zero	1
.LC43:
	ASCII(.string	"find APC, but logic_fs_id %d abnormal(ref=%d,plfs=%p, pdfs=%p)\n" )
.LC49:
	ASCII(.string	"\n VFMW ** release streambuff=%p   bitstream_length=%d\n" )
	.zero	1
.LC51:
	ASCII(.string	"clear curr slice.\n" )
	.zero	5
.LC55:
	ASCII(.string	"%s arrange fs pool failed!\n" )
	.zero	4
.LC64:
	ASCII(.string	"for P slice size of list equal 0(1st).\n" )
.LC70:
	ASCII(.string	"for P slice size of list equal 0(2nd).\n" )
.LC72:
	ASCII(.string	"for B slice size of two list all equal 0.\n" )
	.zero	5
.LC74:
	ASCII(.string	"init list error.\n" )
	.zero	6
.LC76:
	ASCII(.string	"In one access unit,all non-base view should have the same subsps!\n" )
	.zero	5
.LC78:
	ASCII(.string	"sps but mvc flag %d is wrong\n" )
	.zero	2
.LC86:
	ASCII(.string	"nal_ref_idc=%d, structure=%d, image_id=%d, pmv_idc=%d\n" )
	.zero	1
.LC88:
	ASCII(.string	"logic MVC_FRAME id(=%d): get LogicFs error!\n" )
	.zero	3
.LC90:
	ASCII(.string	"phy fs is null: pstDecodeFs = %p, pstPmv = %p\n" )
	.zero	1
.LC96:
	ASCII(.string	"fuction return value is null,%s %d unknow error!!\n" )
	.zero	5
.LC98:
	ASCII(.string	"SH: first_mb_in_slice" )
	.zero	2
.LC100:
	ASCII(.string	"MVC_SliceCheck first_mb_in_slice >= MAX_MB_NUM_IN_PIC error.\n" )
	.zero	2
.LC102:
	ASCII(.string	"SH: slice_type" )
	.zero	1
.LC104:
	ASCII(.string	"slice type = %d\n" )
	.zero	7
.LC107:
	ASCII(.string	"slice type = %d, err\n" )
	.zero	2
.LC109:
	ASCII(.string	"slice  pps id = %d\n" )
	.zero	4
.LC111:
	ASCII(.string	"pps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	1
.LC113:
	ASCII(.string	"sps with this pic_parameter_set_id havn't decode\n" )
	.zero	6
.LC115:
	ASCII(.string	"subsps with this seq_parameter_set_id = %d havn't decoded\n" )
	.zero	5
.LC118:
	ASCII(.string	"tmp slice  pps id = %d\n" )
.LC120:
	ASCII(.string	"MVC_PPSSPSCheckTmpId: pps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	3
.LC122:
	ASCII(.string	"MVC_PPSSPSCheckTmpId: seq_parameter_set_id out of range.\n" )
	.zero	6
.LC124:
	ASCII(.string	"MVC_PPSSPSCheckTmpId: sps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	3
.LC126:
	ASCII(.string	"new pic flag = %d\n" )
	.zero	5
.LC128:
	ASCII(.string	"SH: ref_pic_list_reordering_flag_l0" )
	.zero	4
.LC130:
	ASCII(.string	"SH: reordering_of_pic_nums_idc_l0" )
	.zero	6
.LC132:
	ASCII(.string	"reorder idc l0 = %d, g_SeErrFlag=%d\n" )
	.zero	3
.LC134:
	ASCII(.string	"SH: abs_diff_pic_num_minus1_l0" )
	.zero	1
.LC136:
	ASCII(.string	"abs_diff_pic_num_minus1_l0 = %d, g_SeErrFlag=%d\n" )
	.zero	7
.LC138:
	ASCII(.string	"SH: long_term_pic_idx_l0" )
	.zero	7
.LC140:
	ASCII(.string	"SH: abs_diff_view_idx_minus1_l0" )
.LC142:
	ASCII(.string	"num of idc l0 exceed\n" )
	.zero	2
.LC144:
	ASCII(.string	"SH: ref_pic_list_reordering_flag_l1" )
	.zero	4
.LC146:
	ASCII(.string	"SH: reordering_of_pic_nums_idc_l1" )
	.zero	6
.LC148:
	ASCII(.string	"reorder idc l1 = %d, g_SeErrFlag=%d\n" )
	.zero	3
.LC150:
	ASCII(.string	"SH: abs_diff_pic_num_minus1_l1" )
	.zero	1
.LC152:
	ASCII(.string	"abs_diff_pic_num_minus1_l1 = %d, g_SeErrFlag=%d\n" )
	.zero	7
.LC154:
	ASCII(.string	"SH: long_term_pic_idx_l1" )
	.zero	7
.LC156:
	ASCII(.string	"SH: abs_diff_view_idx_minus1_l1" )
.LC158:
	ASCII(.string	"num of idc l1 exceed\n" )
	.zero	2
.LC160:
	ASCII(.string	"SH: luma_log2_weight_denom" )
	.zero	5
.LC162:
	ASCII(.string	"SH: chroma_log2_weight_denom" )
	.zero	3
.LC164:
	ASCII(.string	"WP log2 exceed  and err flag = %d\n" )
	.zero	5
.LC166:
	ASCII(.string	"SH: luma_weight_flag_l0" )
.LC168:
	ASCII(.string	"SH: luma_weight_l0" )
	.zero	5
.LC170:
	ASCII(.string	"SH: luma_offset_l0" )
	.zero	5
.LC172:
	ASCII(.string	"SH: chroma_weight_flag_l0" )
	.zero	6
.LC174:
	ASCII(.string	"SH: chroma_weight_l0" )
	.zero	3
.LC176:
	ASCII(.string	"SH: chroma_offset_l0" )
	.zero	3
.LC178:
	ASCII(.string	"SH: luma_weight_flag_l1" )
.LC180:
	ASCII(.string	"SH: luma_weight_l1" )
	.zero	5
.LC182:
	ASCII(.string	"SH: luma_offset_l1" )
	.zero	5
.LC184:
	ASCII(.string	"SH: chroma_weight_flag_l1" )
	.zero	6
.LC186:
	ASCII(.string	"SH: chroma_weight_l1" )
	.zero	3
.LC188:
	ASCII(.string	"SH: chroma_offset_l1" )
	.zero	3
.LC190:
	ASCII(.string	"overflow MVC_MAX_MMCO_LEN\n" )
	.zero	5
.LC192:
	ASCII(.string	"SH: memory_management_control_operation" )
.LC194:
	ASCII(.string	"SH: difference_of_pic_nums_minus1" )
	.zero	6
.LC196:
	ASCII(.string	"SH: long_term_pic_num" )
	.zero	2
.LC198:
	ASCII(.string	"SH: long_term_frame_idx" )
.LC200:
	ASCII(.string	"SH: max_long_term_frame_idx_plus1" )
	.zero	6
.LC202:
	ASCII(.string	"mmco exceed 6\n" )
	.zero	1
.LC204:
	ASCII(.string	"SH: no_output_of_prior_pics_flag" )
	.zero	7
.LC206:
	ASCII(.string	"SH: long_term_reference_flag" )
	.zero	3
.LC208:
	ASCII(.string	"SH: adaptive_ref_pic_marking_mode_flag" )
	.zero	1
.LC210:
	ASCII(.string	"MMCO para would save dec err\n" )
	.zero	2
.LC212:
	ASCII(.string	"mulitislice diff no_out_of_prior_pics_flag, used first.\n" )
	.zero	7
.LC214:
	ASCII(.string	"mulitislice diff long_term_reference_flag, used first.\n" )
.LC216:
	ASCII(.string	"mulitislice diff adaptive_ref_pic_marking_mode_flag, used first.\n" )
	.zero	6
.LC218:
	ASCII(.string	"TotalPicNum=%d, SliceNumInPic=%d, TotalNal=%d\n" )
	.zero	1
.LC220:
	ASCII(.string	"SH: pic_parameter_set_id" )
	.zero	7
.LC222:
	ASCII(.string	"pps id:%d in sliceheader err\n" )
	.zero	2
.LC224:
	ASCII(.string	"PPS or SPS of this slice not valid\n" )
	.zero	4
.LC226:
	ASCII(.string	"MVC_PPSSPSCheck failed, PPS or SPS of this slice not valid\n" )
	.zero	4
.LC228:
	ASCII(.string	"SH: frame_num" )
	.zero	2
.LC230:
	ASCII(.string	"IDR NAL but frame_num!=0.\n" )
	.zero	5
.LC232:
	ASCII(.string	"SH: field_pic_flag" )
	.zero	5
.LC234:
	ASCII(.string	"SH: bottom_field_flag" )
	.zero	2
.LC236:
	ASCII(.string	"field first_mb_in_slice bigger than pic size\n" )
	.zero	2
.LC238:
	ASCII(.string	"MVC_FRAME first_mb_in_slice bigger than pic size\n" )
	.zero	6
.LC240:
	ASCII(.string	"SH: idr_pic_id" )
	.zero	1
.LC242:
	ASCII(.string	"idr_pic_id bigger than 65535\n" )
	.zero	2
.LC244:
	ASCII(.string	"SH: pic_order_cnt_lsb" )
	.zero	2
.LC246:
	ASCII(.string	"SH: delta_pic_order_cnt_bottom" )
	.zero	1
.LC248:
	ASCII(.string	"SH: delta_pic_order_cnt[0]" )
	.zero	5
.LC250:
	ASCII(.string	"SH: delta_pic_order_cnt[1]" )
	.zero	5
.LC252:
	ASCII(.string	"SH: redundant_pic_cnt" )
	.zero	2
.LC254:
	ASCII(.string	"redundant pic not support.\n" )
	.zero	4
.LC257:
	ASCII(.string	"first_mb_in_slice in currslice small than prevslice in same pic\n" )
	.zero	7
.LC261:
	ASCII(.string	"SH: direct_spatial_mv_pred_flag" )
.LC263:
	ASCII(.string	"SH: num_ref_idx_override_flag" )
	.zero	2
.LC265:
	ASCII(.string	"SH: num_ref_idx_l0_active_minus1" )
	.zero	7
.LC267:
	ASCII(.string	"SH: num_ref_idx_l1_active_minus1" )
	.zero	7
.LC269:
	ASCII(.string	"MVC_FRAME num_ref_idx_lx_active_minus1 exceed\n" )
	.zero	1
.LC271:
	ASCII(.string	"field num_ref_idx_lx_active_minus1 exceed\n" )
	.zero	5
.LC273:
	ASCII(.string	"reordering para dec err\n" )
	.zero	7
.LC275:
	ASCII(.string	"apply_weights_flag=%d\n" )
	.zero	1
.LC277:
	ASCII(.string	"wpt dec err\n" )
	.zero	3
.LC279:
	ASCII(.string	"mark para dec err\n" )
	.zero	5
.LC281:
	ASCII(.string	"SH: cabac_init_idc" )
	.zero	5
.LC283:
	ASCII(.string	"cabac_init_idc bigger than 3\n" )
	.zero	2
.LC285:
	ASCII(.string	"SH: slice_qp_delta" )
	.zero	5
.LC287:
	ASCII(.string	"SH: disable_deblocking_filter_idc" )
	.zero	6
.LC289:
	ASCII(.string	"disable_deblocking_filter_idc dec err\n" )
	.zero	1
.LC291:
	ASCII(.string	"SH: slice_alpha_c0_offset_div2" )
	.zero	1
.LC293:
	ASCII(.string	"slice_alpha_c0_offset_div2 dec err\n" )
	.zero	4
.LC295:
	ASCII(.string	"SH: slice_beta_offset_div2" )
	.zero	5
.LC297:
	ASCII(.string	"slice_beta_offset_div2 dec err\n" )
.LC299:
	ASCII(.string	"pMvcCtx->pCurrNal->nal_bitoffset = %d; code_len_byte = %d; bitstream_length = %d; pMvcCtx->pCurrNal->nal_trail_zero_bit_num = %d\n" )
	.zero	6
.LC301:
	ASCII(.string	"stream[%d]: bitsoffset = %d; valid_bitlen = %d; bytespos = %x\n" )
	.zero	1
.LC303:
	ASCII(.string	"nal_segment = %d is not expected value\n" )
.LC305:
	ASCII(.string	"stream[%d]: bitsoffset = %d; valid_bitlen = %d\n" )
.LC310:
	ASCII(.string	"   : delta_sl   " )
	.zero	7
.LC315:
	ASCII(.string	"PPS: entropy_coding_mode_flag" )
	.zero	2
.LC317:
	ASCII(.string	"PPS: pic_order_present_flag" )
	.zero	4
.LC319:
	ASCII(.string	"PPS: num_slice_groups_minus1" )
	.zero	3
.LC321:
	ASCII(.string	"MVC_BASELINE stream with FMO, not support.\n" )
	.zero	4
.LC324:
	ASCII(.string	"PPS: num_ref_idx_l0_active_minus1" )
	.zero	6
.LC326:
	ASCII(.string	"num_ref_idx_l0_active_minus1 out of range.\n" )
	.zero	4
.LC328:
	ASCII(.string	"PPS: num_ref_idx_l1_active_minus1" )
	.zero	6
.LC330:
	ASCII(.string	"num_ref_idx_l1_active_minus1 out of range.\n" )
	.zero	4
.LC332:
	ASCII(.string	"PPS: weighted prediction flag" )
	.zero	2
.LC334:
	ASCII(.string	"PPS: weighted_bipred_idc" )
	.zero	7
.LC336:
	ASCII(.string	"weighted_bipred_idc out of range\n" )
	.zero	6
.LC338:
	ASCII(.string	"PPS: pic_init_qp_minus26" )
	.zero	7
.LC340:
	ASCII(.string	"PPS: pic_init_qs_minus26" )
	.zero	7
.LC342:
	ASCII(.string	"PPS: chroma_qp_index_offset" )
	.zero	4
.LC344:
	ASCII(.string	"PPS: deblocking_filter_control_present_flag" )
	.zero	4
.LC346:
	ASCII(.string	"PPS: constrained_intra_pred_flag" )
	.zero	7
.LC348:
	ASCII(.string	"PPS: redundant_pic_cnt_present_flag" )
	.zero	4
.LC350:
	ASCII(.string	"redundant pic not support when find redundant slice later, exit\n" )
	.zero	7
.LC352:
	ASCII(.string	"PPS: transform_8x8_mode_flag" )
	.zero	3
.LC354:
	ASCII(.string	"PPS: pic_scaling_matrix_present_flag" )
	.zero	3
.LC356:
	ASCII(.string	"PPS: second_chroma_qp_index_offset" )
	.zero	5
.LC358:
	ASCII(.string	"SPS: seq_scaling_list_present_flag" )
	.zero	5
.LC361:
	ASCII(.string	"PPS: pic_scaling_list_present_flag" )
	.zero	5
.LC363:
	ASCII(.string	"second_chroma_qp_index_offset out of range.\n" )
	.zero	3
.LC367:
	ASCII(.string	"PPS: pic_parameter_set_id" )
	.zero	6
.LC369:
	ASCII(.string	"pic_parameter_set_id(%d) out of range.\n" )
.LC372:
	ASCII(.string	"PPS: seq_parameter_set_id" )
	.zero	6
.LC374:
	ASCII(.string	"seq_parameter_set_id out of range.\n" )
	.zero	4
.LC377:
	ASCII(.string	"PPS decode error line: %d.\n" )
	.zero	4
.LC380:
	ASCII(.string	"VUI: aspect_ratio_info_present_flag" )
	.zero	4
.LC382:
	ASCII(.string	"VUI: aspect_ratio_idc" )
	.zero	2
.LC384:
	ASCII(.string	"VUI: sar_width" )
	.zero	1
.LC386:
	ASCII(.string	"VUI: sar_height" )
.LC388:
	ASCII(.string	"VUI: overscan_info_present_flag" )
.LC390:
	ASCII(.string	"VUI: overscan_appropriate_flag" )
	.zero	1
.LC392:
	ASCII(.string	"VUI: video_signal_type_present_flag" )
	.zero	4
.LC394:
	ASCII(.string	"VUI: video_format" )
	.zero	6
.LC396:
	ASCII(.string	"VUI: video_full_range_flag" )
	.zero	5
.LC398:
	ASCII(.string	"VUI: color_description_present_flag" )
	.zero	4
.LC400:
	ASCII(.string	"VUI: colour_primaries" )
	.zero	2
.LC402:
	ASCII(.string	"VUI: transfer_characteristics" )
	.zero	2
.LC404:
	ASCII(.string	"VUI: matrix_coefficients" )
	.zero	7
.LC406:
	ASCII(.string	"VUI: chroma_loc_info_present_flag" )
	.zero	6
.LC408:
	ASCII(.string	"VUI: chroma_sample_loc_type_top_field" )
	.zero	2
.LC410:
	ASCII(.string	"VUI: chroma_sample_loc_type_bottom_field" )
	.zero	7
.LC412:
	ASCII(.string	"VUI: timing_info_present_flag" )
	.zero	2
.LC414:
	ASCII(.string	"VUI: num_units_in_tick" )
	.zero	1
.LC416:
	ASCII(.string	"VUI: time_scale" )
.LC418:
	ASCII(.string	"VUI: fixed_frame_rate_flag" )
	.zero	5
.LC420:
	ASCII(.string	"VUI: nal_hrd_parameters_present_flag" )
	.zero	3
.LC422:
	ASCII(.string	"VUI: cpb_cnt_minus1" )
	.zero	4
.LC424:
	ASCII(.string	"VUI: bit_rate_scale" )
	.zero	4
.LC426:
	ASCII(.string	"VUI: cpb_size_scale" )
	.zero	4
.LC428:
	ASCII(.string	"hrd->cpb_cnt_minus1 out of range\n" )
	.zero	6
.LC430:
	ASCII(.string	"VUI: bit_rate_value_minus1" )
	.zero	5
.LC432:
	ASCII(.string	"VUI: cpb_size_value_minus1" )
	.zero	5
.LC434:
	ASCII(.string	"VUI: cbr_flag" )
	.zero	2
.LC436:
	ASCII(.string	"VUI: initial_cpb_removal_delay_length_minus1" )
	.zero	3
.LC438:
	ASCII(.string	"VUI: cpb_removal_delay_length_minus1" )
	.zero	3
.LC440:
	ASCII(.string	"VUI: dpb_output_delay_length_minus1" )
	.zero	4
.LC442:
	ASCII(.string	"VUI: time_offset_length" )
.LC444:
	ASCII(.string	"VUI: vcl_hrd_parameters_present_flag" )
	.zero	3
.LC446:
	ASCII(.string	"VUI: low_delay_hrd_flag" )
.LC448:
	ASCII(.string	"VUI: pic_struct_present_flag" )
	.zero	3
.LC450:
	ASCII(.string	"VUI: bitstream_restriction_flag" )
.LC452:
	ASCII(.string	"VUI: motion_vectors_over_pic_boundaries_flag" )
	.zero	3
.LC454:
	ASCII(.string	"VUI: max_bytes_per_pic_denom" )
	.zero	3
.LC456:
	ASCII(.string	"VUI: max_bits_per_mb_denom" )
	.zero	5
.LC458:
	ASCII(.string	"VUI: log2_max_mv_length_horizontal" )
	.zero	5
.LC460:
	ASCII(.string	"VUI: log2_max_mv_length_vertical" )
	.zero	7
.LC462:
	ASCII(.string	"VUI: num_reorder_frames" )
.LC464:
	ASCII(.string	"VUI: max_dec_frame_buffering" )
	.zero	3
.LC469:
	ASCII(.string	"dar=%d, final_dar=%d\n" )
	.zero	2
.LC475:
	ASCII(.string	"SPS: chroma_format_idc" )
	.zero	1
.LC477:
	ASCII(.string	"pSPS->chroma_format_idc out of range.\n" )
	.zero	1
.LC479:
	ASCII(.string	"SPS: bit_depth_luma_minus8" )
	.zero	5
.LC481:
	ASCII(.string	"bit_depth_luma_minus8 not equal 0.\n" )
	.zero	4
.LC483:
	ASCII(.string	"SPS: bit_depth_chroma_minus8" )
	.zero	3
.LC485:
	ASCII(.string	"bit_depth_chroma_minus8 not equal 0.\n" )
	.zero	2
.LC487:
	ASCII(.string	"SPS: qpprime_y_zero_trans_bypass_flag" )
	.zero	2
.LC489:
	ASCII(.string	"qpprime_y_zero_trans_bypass_flag not equal 0.\n" )
	.zero	1
.LC491:
	ASCII(.string	"SPS: seq_scaling_matrix_present_flag" )
	.zero	3
.LC495:
	ASCII(.string	"SPS: log2_max_frame_num_minus4" )
	.zero	1
.LC497:
	ASCII(.string	"pSPS->log2_max_frame_num_minus4 out of range.\n" )
	.zero	1
.LC499:
	ASCII(.string	"SPS: pic_order_cnt_type" )
.LC501:
	ASCII(.string	"pSPS->pic_order_cnt_type out of range.\n" )
.LC503:
	ASCII(.string	"SPS: log2_max_pic_order_cnt_lsb_minus4" )
	.zero	1
.LC505:
	ASCII(.string	"pSPS->log2_max_pic_order_cnt_lsb_minus4 out of range.\n" )
	.zero	1
.LC507:
	ASCII(.string	"SPS: delta_pic_order_always_zero_flag" )
	.zero	2
.LC509:
	ASCII(.string	"SPS: offset_for_non_ref_pic" )
	.zero	4
.LC511:
	ASCII(.string	"SPS: offset_for_top_to_bottom_field" )
	.zero	4
.LC513:
	ASCII(.string	"SPS: num_ref_frames_in_pic_order_cnt_cycle" )
	.zero	5
.LC515:
	ASCII(.string	"pSPS->num_ref_frames_in_pic_order_cnt_cycle out of range.\n" )
	.zero	5
.LC517:
	ASCII(.string	"SPS: offset_for_ref_frame[i]" )
	.zero	3
.LC519:
	ASCII(.string	"SPS: gaps_in_frame_num_value_allowed_flag" )
	.zero	6
.LC521:
	ASCII(.string	"SPS: pic_width_in_mbs_minus1" )
	.zero	3
.LC523:
	ASCII(.string	"pSPS->pic_width_in_mbs_minus1 out of range(=%d).\n" )
	.zero	6
.LC525:
	ASCII(.string	"SPS: pic_height_in_map_units_minus1" )
	.zero	4
.LC527:
	ASCII(.string	"SPS: frame_mbs_only_flag" )
	.zero	7
.LC529:
	ASCII(.string	"pSPS->pic_height_in_map_units_minus1 out of range.\n" )
	.zero	4
.LC531:
	ASCII(.string	"pic size too large.\n" )
	.zero	3
.LC534:
	ASCII(.string	"level_idc %d not support.\n" )
	.zero	5
.LC536:
	ASCII(.string	"dpb size according level : %d\n" )
	.zero	1
.LC538:
	ASCII(.string	"pSPS->num_ref_frames(%d) > DPB size(%d), try to select the reasonable one.\n" )
	.zero	4
.LC540:
	ASCII(.string	"SPS: direct_8x8_inference_flag" )
	.zero	1
.LC542:
	ASCII(.string	"SPS: frame_cropping_flag" )
	.zero	7
.LC544:
	ASCII(.string	"SPS: frame_cropping_rect_left_offset" )
	.zero	3
.LC546:
	ASCII(.string	"SPS: frame_cropping_rect_right_offset" )
	.zero	2
.LC548:
	ASCII(.string	"SPS: frame_cropping_rect_top_offset" )
	.zero	4
.LC550:
	ASCII(.string	"SPS: frame_cropping_rect_bottom_offset" )
	.zero	1
.LC552:
	ASCII(.string	"SPS: vui_parameters_present_flag" )
	.zero	7
.LC554:
	ASCII(.string	"max_dec_frame_buffering(%d) > MaxDpbSize(%d)\n" )
	.zero	2
.LC556:
	ASCII(.string	"SPS: num_ref_frames" )
	.zero	4
.LC558:
	ASCII(.string	"SPS: mb_adaptive_frame_field_flag" )
	.zero	6
.LC560:
	ASCII(.string	"SPS: profile_idc" )
	.zero	7
.LC562:
	ASCII(.string	"SPS: constrained_set0_flag" )
	.zero	5
.LC564:
	ASCII(.string	"SPS: constrained_set1_flag" )
	.zero	5
.LC566:
	ASCII(.string	"SPS: constrained_set2_flag" )
	.zero	5
.LC568:
	ASCII(.string	"SPS: constrained_set3_flag" )
	.zero	5
.LC570:
	ASCII(.string	"SPS: constrained_set4_flag" )
	.zero	5
.LC572:
	ASCII(.string	"SPS: constrained_set5_flag" )
	.zero	5
.LC574:
	ASCII(.string	"SPS: reserved_zero_2bits" )
	.zero	7
.LC576:
	ASCII(.string	"SPS: level_idc" )
	.zero	1
.LC578:
	ASCII(.string	"SPS: seq_parameter_set_id" )
	.zero	6
.LC582:
	ASCII(.string	"MVC_BASELINE stream, try to decode, exit when FMO occurred.\n" )
	.zero	3
.LC584:
	ASCII(.string	"MVC_EXTENDED stream, try to decode, exit when datapartition occurred.\n" )
	.zero	1
.LC586:
	ASCII(.string	"others High profile stream, try to decode, exit when high profile not support occurred.\n" )
	.zero	7
.LC588:
	ASCII(.string	"profile_idc = %5d error, try to decode as main profile.\n" )
	.zero	7
.LC590:
	ASCII(.string	"level_idc = %5d error, try to decode as level_idc %d.\n" )
	.zero	1
.LC593:
	ASCII(.string	"Line %d: SPS[%d] decode error.\n" )
.LC599:
	ASCII(.string	"SUBSPS: num_views_minus1" )
	.zero	7
.LC601:
	ASCII(.string	"pSubsps->num_views_minus1(%d) out of range.\n" )
	.zero	3
.LC603:
	ASCII(.string	"SUBSPS: view_id[]" )
	.zero	6
.LC605:
	ASCII(.string	"SUBSPS: num_anchor_refs_l0[]" )
	.zero	3
.LC607:
	ASCII(.string	"SUBSPS: num_anchor_refs_l1[]" )
	.zero	3
.LC609:
	ASCII(.string	"pSubsps->num_anchor_refs_l0(%d) out of range.\n" )
	.zero	1
.LC611:
	ASCII(.string	"SUBSPS: anchor_ref_l0[][]" )
	.zero	6
.LC613:
	ASCII(.string	"pSubsps->num_anchor_refs_l1(%d) out of range.\n" )
	.zero	1
.LC615:
	ASCII(.string	"SUBSPS: anchor_ref_l1[][]" )
	.zero	6
.LC617:
	ASCII(.string	"SUBSPS: num_level_values_signalled_minus1" )
	.zero	6
.LC619:
	ASCII(.string	"SUBSPS: num_non_anchor_refs_l0[]" )
	.zero	7
.LC621:
	ASCII(.string	"SUBSPS: num_non_anchor_refs_l1[]" )
	.zero	7
.LC623:
	ASCII(.string	"pSubsps->num_non_anchor_refs_l0(%d) out of range.\n" )
	.zero	5
.LC625:
	ASCII(.string	"SUBSPS: non_anchor_ref_l0[][]" )
	.zero	2
.LC627:
	ASCII(.string	"pSubsps->num_non_anchor_refs_l1(%d) out of range.\n" )
	.zero	5
.LC629:
	ASCII(.string	"SUBSPS: non_anchor_ref_l1[][]" )
	.zero	2
.LC631:
	ASCII(.string	"num_level(%d) out of range.\n" )
	.zero	3
.LC633:
	ASCII(.string	"SUBSPS: level_idc[]" )
	.zero	4
.LC635:
	ASCII(.string	"SUBSPS: num_applicable_ops_minus1" )
	.zero	6
.LC637:
	ASCII(.string	"num_ops(%d) out of range.\n" )
	.zero	5
.LC639:
	ASCII(.string	"SUBSPS: applicable_op_temporal_id[][]" )
	.zero	2
.LC641:
	ASCII(.string	"SUBSPS: applicable_op_num_target_views_minus1[][]" )
	.zero	6
.LC643:
	ASCII(.string	"SUBSPS: applicable_op_num_views_minus1" )
	.zero	1
.LC645:
	ASCII(.string	"applicable_op_num_target_views(%d) out of range.\n" )
	.zero	6
.LC647:
	ASCII(.string	"SUBSPS: applicable_op_target_view_id[][][]" )
	.zero	5
.LC649:
	ASCII(.string	"pSubsps->applicable_op_num_views_minus1(%d) out of range.\n" )
	.zero	5
.LC651:
	ASCII(.string	"MVC VUI: vui_mvc_num_ops_minus1" )
.LC653:
	ASCII(.string	"vui_mvc_num_ops_minus1 %d out of range\n" )
.LC655:
	ASCII(.string	"MVC VUI: vui_mvc_temporal_id[]" )
	.zero	1
.LC657:
	ASCII(.string	"SUBSPS VUI: vui_mvc_num_target_output_views_minus1[]" )
	.zero	3
.LC659:
	ASCII(.string	"vui_mvc_num_target_output_views_minus1 %d out of range\n" )
.LC661:
	ASCII(.string	"MVC VUI: vui_mvc_timing_info_present_flag" )
	.zero	6
.LC663:
	ASCII(.string	"MVC VUI: vui_mvc_view_id[][]" )
	.zero	3
.LC665:
	ASCII(.string	"MVC VUI: vui_mvc_num_units_in_tick" )
	.zero	5
.LC667:
	ASCII(.string	"MVC VUI: vui_mvc_time_scale[]" )
	.zero	2
.LC669:
	ASCII(.string	"MVC VUI: vui_mvc_fixed_frame_rate_flag" )
	.zero	1
.LC671:
	ASCII(.string	"MVC VUI: vui_mvc_nal_hrd_parameters_present_flag[]" )
	.zero	5
.LC673:
	ASCII(.string	"MVC VUI: cpb_cnt_minus1" )
.LC675:
	ASCII(.string	"MVC VUI: bit_rate_scale" )
.LC677:
	ASCII(.string	"MVC VUI: cpb_size_scale" )
.LC680:
	ASCII(.string	"MVC VUI: bit_rate_value_minus1" )
	.zero	1
.LC682:
	ASCII(.string	"MVC VUI: cpb_size_value_minus1" )
	.zero	1
.LC684:
	ASCII(.string	"MVC VUI: cbr_flag" )
	.zero	6
.LC686:
	ASCII(.string	"MVC VUI: initial_cpb_removal_delay_length_minus1" )
	.zero	7
.LC688:
	ASCII(.string	"MVC VUI: cpb_removal_delay_length_minus1" )
	.zero	7
.LC690:
	ASCII(.string	"MVC VUI: dpb_output_delay_length_minus1" )
.LC692:
	ASCII(.string	"MVC VUI: time_offset_length" )
	.zero	4
.LC694:
	ASCII(.string	"MVC VUI: vui_mvc_vcl_hrd_parameters_present_flag[]" )
	.zero	5
.LC696:
	ASCII(.string	"MVC VUI: vui_mvc_low_delay_hrd_flag[]" )
	.zero	2
.LC698:
	ASCII(.string	"MVC VUI: vui_mvc_pic_struct_present_flag[]" )
	.zero	5
.LC700:
	ASCII(.string	"SUBSPS: profile_idc" )
	.zero	4
.LC702:
	ASCII(.string	"SUBSPS: constrained_set0_flag" )
	.zero	2
.LC704:
	ASCII(.string	"SUBSPS: constrained_set1_flag" )
	.zero	2
.LC706:
	ASCII(.string	"SUBSPS: constrained_set2_flag" )
	.zero	2
.LC708:
	ASCII(.string	"SUBSPS: constrained_set3_flag" )
	.zero	2
.LC710:
	ASCII(.string	"SUBSPS: constrained_set4_flag" )
	.zero	2
.LC712:
	ASCII(.string	"SUBSPS: constrained_set5_flag" )
	.zero	2
.LC714:
	ASCII(.string	"SUBSPS: reserved_zero_2bits" )
	.zero	4
.LC716:
	ASCII(.string	"SUBSPS: level_idc" )
	.zero	6
.LC718:
	ASCII(.string	"SUBSPS: seq_parameter_set_id" )
	.zero	3
.LC725:
	ASCII(.string	"profile_idc = %5d error\n" )
	.zero	7
.LC727:
	ASCII(.string	"level_idc = %5d error, try to decode as level_idc 41.\n" )
	.zero	1
.LC729:
	ASCII(.string	"SUBSPS decode error.\n" )
	.zero	2
.LC731:
	ASCII(.string	"SUBSPS: bit_equal_to_one" )
	.zero	7
.LC733:
	ASCII(.string	"SUBSPS Mvc Ext decode error.\n" )
	.zero	2
.LC735:
	ASCII(.string	"SUBSPS: mvc_vui_parameters_present_flag" )
.LC737:
	ASCII(.string	"SUBSPS Mvc Vui Ext decode error.\n" )
	.zero	6
.LC739:
	ASCII(.string	"SEI: frame_packing_arrangement_id" )
	.zero	6
.LC741:
	ASCII(.string	"SEI: frame_packing_arrangement_cancel_flag" )
	.zero	5
.LC743:
	ASCII(.string	"SEI: frame_packing_arrangement_type" )
	.zero	4
.LC745:
	ASCII(.string	"SEI: quincunx_sampling_flag" )
	.zero	4
.LC747:
	ASCII(.string	"SEI: content_interpretation_type" )
	.zero	7
.LC749:
	ASCII(.string	"SEI: spatial_flipping_flag" )
	.zero	5
.LC751:
	ASCII(.string	"SEI: frame0_flipped_flag" )
	.zero	7
.LC753:
	ASCII(.string	"SEI: field_views_flag" )
	.zero	2
.LC755:
	ASCII(.string	"SEI: current_frame_is_frame0_flag" )
	.zero	6
.LC757:
	ASCII(.string	"SEI: frame0_self_contained_flag" )
.LC759:
	ASCII(.string	"SEI: frame1_self_contained_flag" )
.LC761:
	ASCII(.string	"SEI: frame0_grid_position_x" )
	.zero	4
.LC763:
	ASCII(.string	"SEI: frame0_grid_position_y" )
	.zero	4
.LC765:
	ASCII(.string	"SEI: frame1_grid_position_x" )
	.zero	4
.LC767:
	ASCII(.string	"SEI: frame1_grid_position_y" )
	.zero	4
.LC769:
	ASCII(.string	"SEI: frame_packing_arrangement_reserved_byte" )
	.zero	3
.LC771:
	ASCII(.string	"SEI: frame_packing_arrangement_repetition_period" )
	.zero	7
.LC773:
	ASCII(.string	"SEI: frame_packing_arrangement_extension_flag" )
	.zero	2
.LC775:
	ASCII(.string	"DecPicTimingSEI but SPS is invalid.\n" )
	.zero	3
.LC777:
	ASCII(.string	"SEI: cpb_removal_delay" )
	.zero	1
.LC779:
	ASCII(.string	"SEI: dpb_output_delay" )
	.zero	2
.LC781:
	ASCII(.string	"pic_struct" )
	.zero	5
.LC783:
	ASCII(.string	"SEI nal dec payload type err\n" )
	.zero	2
.LC785:
	ASCII(.string	"SEI nal dec payloadSize err\n" )
	.zero	3
.LC788:
	ASCII(.string	"MVC_SEI_BUFFERING_PERIOD,offset = %d,payload_size = %d \n" )
	.zero	7
.LC791:
	ASCII(.string	"MVC_PassBytes err [%s][%d]\n" )
	.zero	4
.LC793:
	ASCII(.string	"MVC_SEI_PIC_TIMING,offset = %d,payload_size = %d \n" )
	.zero	5
.LC795:
	ASCII(.string	"MVC_SEI_PAN_SCAN_RECT,offset = %d,payload_size = %d \n" )
	.zero	2
.LC797:
	ASCII(.string	"MVC_SEI_FILLER_PAYLOAD,offset = %d,payload_size = %d \n" )
	.zero	1
.LC799:
	ASCII(.string	"MVC_SEI_USER_DATA_REGISTERED_ITU_T_T35, offset = %d, payload_size = %d \n" )
	.zero	7
.LC801:
	ASCII(.string	"MVC_SEI_USER_DATA_UNREGISTERED, offset = %d, payload_size = %d \n" )
	.zero	7
.LC803:
	ASCII(.string	"SEI: itu_t_t35_country_code" )
	.zero	4
.LC805:
	ASCII(.string	"SEI: itu_t_t35_country_code_extension_byte" )
	.zero	5
.LC807:
	ASCII(.string	"SEI: itu_t_t35_provider_code" )
	.zero	3
.LC810:
	ASCII(.string	"cann't dec usrdata\n" )
	.zero	4
.LC812:
	ASCII(.string	"MVC_SEI_RECOVERY_POINT,offset = %d,payload_size = %d \n" )
	.zero	1
.LC814:
	ASCII(.string	"MVC_SEI_DEC_REF_PIC_MARKING_REPETITION,offset = %d,payload_size = %d \n" )
	.zero	1
.LC816:
	ASCII(.string	"MVC_SEI_SPARE_PIC,offset = %d,payload_size = %d \n" )
	.zero	6
.LC818:
	ASCII(.string	"MVC_SEI_SCENE_INFO,offset = %d,payload_size = %d \n" )
	.zero	5
.LC820:
	ASCII(.string	"MVC_SEI_SUB_SEQ_INFO,offset = %d,payload_size = %d \n" )
	.zero	3
.LC822:
	ASCII(.string	"MVC_SEI_SUB_SEQ_LAYER_CHARACTERISTICS,offset = %d,payload_size = %d \n" )
	.zero	2
.LC824:
	ASCII(.string	"MVC_SEI_SUB_SEQ_CHARACTERISTICS,offset = %d,payload_size = %d \n" )
.LC826:
	ASCII(.string	"MVC_SEI_FULL_FRAME_FREEZE,offset = %d,payload_size = %d \n" )
	.zero	6
.LC828:
	ASCII(.string	"MVC_SEI_FULL_FRAME_FREEZE_RELEASE,offset = %d,payload_size = %d \n" )
	.zero	6
.LC830:
	ASCII(.string	"MVC_SEI_FULL_FRAME_SNAPSHOT,offset = %d,payload_size = %d \n" )
	.zero	4
.LC832:
	ASCII(.string	"MVC_SEI_PROGRESSIVE_REFINEMENT_SEGMENT_START,offset = %d,payload_size = %d \n" )
	.zero	3
.LC834:
	ASCII(.string	"MVC_SEI_PROGRESSIVE_REFINEMENT_SEGMENT_END,offset = %d,payload_size = %d \n" )
	.zero	5
.LC836:
	ASCII(.string	"MVC_SEI_MOTION_CONSTRAINED_SLICE_GROUP_SET,offset = %d,payload_size = %d \n" )
	.zero	5
.LC838:
	ASCII(.string	"MVC_SEI_FILM_GRAIN_CHARACTERISTICS,offset = %d,payload_size = %d \n" )
	.zero	5
.LC840:
	ASCII(.string	"MVC_SEI_DEBLOCKING_FILTER_DISPLAY_PREFERENCE,offset = %d,payload_size = %d \n" )
	.zero	3
.LC842:
	ASCII(.string	"MVC_SEI_STEREO_VIDEO_INFO,offset = %d,payload_size = %d \n" )
	.zero	6
.LC844:
	ASCII(.string	"too much usrdat, cann't dec SEI\n" )
	.zero	7
.LC848:
	ASCII(.string	"\n mvc the stream is error,len:%d\n" )
	.zero	6
.LC853:
	ASCII(.string	"\nSlice nal or IDR nal = %d\n" )
	.zero	4
.LC855:
	ASCII(.string	"sliceheader dec err\n" )
	.zero	3
.LC858:
	ASCII(.string	"MVC_InquireSliceProperty mvc flag %d is wrong\n" )
	.zero	1
.LC860:
	ASCII(.string	"MVC recycle image\n" )
	.zero	5
.LC862:
	ASCII(.string	"pH264Ctx is %#x, pFrameStore is %#x\n" )
	.zero	3
.LC864:
	ASCII(.string	"line: %d, pstLogicFsImage is NULL\n" )
	.zero	5
.LC866:
	ASCII(.string	"InsertVO err:%d, MVC_ClearAll\n" )
	.zero	1
.LC868:
	ASCII(.string	"mvc.c line %d: MVC_FRAME para err(ret=%d), recycle image self\n" )
	.zero	1
.LC871:
	ASCII(.string	"line %d func %s pos = %d\n" )
	.zero	6
.LC875:
	ASCII(.string	"[%s][%d] MVC_OutputFrmToVO return %d !\n" )
.LC878:
	ASCII(.string	"[%s][%d] MVC_OutputFrmToVO return %d\n" )
	.zero	2
.LC882:
	ASCII(.string	"%s %d MVC_OK != MVC_FlushDPB!!\n" )
.LC884:
	ASCII(.string	"%s %d MVC_OK != MVC_InitDPB!!\n" )
	.zero	1
.LC886:
	ASCII(.string	"----------------- MVC_IMODE -> %d ------------------\n" )
	.zero	2
.LC888:
	ASCII(.string	"Discard this B(poc=%d) befor P, is_ref_idc=%d.\n" )
.LC890:
	ASCII(.string	"***** VDM start, TotalPicNum=%d, pMvcCtx->CurrPic.structure=%d.\n" )
	.zero	7
.LC893:
	ASCII(.string	"\n receive streambuff=%p; phy_addr=0x%x; bitstream_length=%d\n" )
	.zero	3
.LC895:
	ASCII(.string	"nal_releaMVC_SE_ERR\n" )
	.zero	3
.LC897:
	ASCII(.string	"cann't find slot for current nal\n" )
	.zero	6
.LC900:
	ASCII(.string	"receive a zero packet\n" )
	.zero	1
.LC902:
	ASCII(.string	"clear all dec para\n" )
	.zero	4
.LC910:
	ASCII(.string	"line %d, get APC error, ret %d\n" )
.LC912:
	ASCII(.string	"InserFrmInDPB: cur pic struct = %d!\n" )
	.zero	3
.LC914:
	ASCII(.string	"line: %d, pImage/pPmv is NULL!\n" )
.LC916:
	ASCII(.string	"FS_ALLOC_ERR, MVC_ClearAll\n" )
	.zero	4
.LC919:
	ASCII(.string	"Can not new logic fs! MVC_ClearAll\n" )
	.zero	4
.LC923:
	ASCII(.string	"%s %d NULL== pMvcCtx->SPS || NULL == pMvcCtx->PPS || NULL == pMvcCtx->DecSlicePara!!\n" )
	.zero	2
.LC925:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC927:
	ASCII(.string	"CurrPic.state is 'MVC_EMPTY'\n" )
	.zero	2
.LC929:
	ASCII(.string	"MVC_StorePicInDpb return(%d) from L%d\n" )
	.zero	1
.LC931:
	ASCII(.string	"Is IDR, but init DPB failed!\n" )
	.zero	2
.LC933:
	ASCII(.string	"Is IDR, but FlushDPB failed!\n" )
	.zero	2
.LC935:
	ASCII(.string	"MVC_DirectOutput mode\n" )
	.zero	1
.LC937:
	ASCII(.string	"line %d, REPORT_IFRAME_ERR\n" )
	.zero	4
.LC940:
	ASCII(.string	"line %d, return %d\n" )
	.zero	4
.LC942:
	ASCII(.string	"err(%d) > ref_thr(%d)\n" )
	.zero	1
.LC944:
	ASCII(.string	"MVC_Marking return %d\n" )
	.zero	1
.LC946:
	ASCII(.string	"line %d: pMvcCtx->DPB.size = %d, ref %d, ltref %d\n" )
	.zero	5
.LC948:
	ASCII(.string	"line %d, MVC_GetMinPOC failed\n" )
	.zero	1
.LC951:
	ASCII(.string	"%s: pos(%d) = pre_pos, force return.\n" )
	.zero	2
.LC953:
	ASCII(.string	"GAP found while DPB is MVC_EMPTY!\n" )
	.zero	5
.LC955:
	ASCII(.string	"MVC_FRAME num gap try to fill it \n" )
	.zero	5
.LC957:
	ASCII(.string	"CurrFrameNum = %d  UnusedShortTermFrameNum = %d\n" )
	.zero	7
.LC959:
	ASCII(.string	"cann't allocate MVC_FRAME store when gap find\n" )
	.zero	1
.LC961:
	ASCII(.string	"allocate MVC_FRAME store when gap find\n" )
.LC963:
	ASCII(.string	"line %d: store gap pic err, ret=%d\n" )
	.zero	4
.LC967:
	ASCII(.string	"get back frm\n" )
	.zero	2
.LC969:
	ASCII(.string	"line %d: flush dpb return %d\n" )
	.zero	2
.LC971:
	ASCII(.string	"line %d: init dpb return %d\n" )
	.zero	3
.LC973:
	ASCII(.string	"mem arrange err, MVC_ClearAll\n" )
	.zero	1
.LC975:
	ASCII(.string	"line %d: MVC_FRAME gap(=%d) > dpb size(=%d)\n" )
	.zero	3
.LC977:
	ASCII(.string	"MVC_FRAME num gap don't allowed but gap find\n" )
	.zero	2
.LC979:
	ASCII(.string	"line %d: frame num(%d/%d) find gap in NON-I slice but here gap is not allowed\n" )
	.zero	1
.LC981:
	ASCII(.string	"line %d: dec gap failed\n" )
	.zero	7
.LC983:
	ASCII(.string	"line %d: alloc framestore failed\n" )
	.zero	6
.LC985:
	ASCII(.string	"Chan:%d dec_pts: %lld\n" )
	.zero	1
.LC987:
	ASCII(.string	"Chan:%d dec_usertag: %lld\n" )
	.zero	5
.LC989:
	ASCII(.string	"line %d: CurrPic.frame_store is NULL\n" )
	.zero	2
.LC992:
	ASCII(.string	"%s set fs store type failed.\n" )
	.zero	2
.LC997:
	ASCII(.string	"Start Reason: SliceParaNum, MaxBytesReceived = %d, %d(thr=%d)\n" )
	.zero	1
.LC999:
	ASCII(.string	"Too many slice or bitstream, err!\n" )
	.zero	5
.LC1001:
	ASCII(.string	"Start Reason: new_pic_flag\n" )
	.zero	4
.LC1003:
	ASCII(.string	"init pic err, find next recover point or next valid sps, pps, or exit\n" )
	.zero	1
.LC1005:
	ASCII(.string	"MVC_DecList error, ret=%d\n" )
	.zero	5
.LC1007:
	ASCII(.string	"dec list err.\n" )
	.zero	1
.LC1009:
	ASCII(.string	"pMvcCtx->TotalNal = %d, type:%d\n" )
	.zero	7
.LC1011:
	ASCII(.string	"stop i want\n" )
	.zero	3
.LC1014:
	ASCII(.string	"***** NAL: IDR/Slice, nal_unit_type=%d, TotalSlice=%d\n" )
	.zero	1
.LC1016:
	ASCII(.string	"*******TotalPicNum=%d********\n" )
	.zero	1
.LC1019:
	ASCII(.string	"***** NAL: PPS, nal_unit_type=%d, TotalPPS=%d\n" )
	.zero	1
.LC1021:
	ASCII(.string	"PPS decode error.\n" )
	.zero	5
.LC1023:
	ASCII(.string	"***** NAL: SPS, nal_unit_type=%d, TotalSPS=%d\n" )
	.zero	1
.LC1025:
	ASCII(.string	"SPS decode error.\n" )
	.zero	5
.LC1027:
	ASCII(.string	"***** NAL: SEI, nal_unit_type=%d\n" )
	.zero	6
.LC1029:
	ASCII(.string	"SEI decode error.\n" )
	.zero	5
.LC1031:
	ASCII(.string	"***** NAL: AUD, nal_unit_type=%d\n" )
	.zero	6
.LC1033:
	ASCII(.string	"***** NAL: EOSEQ, nal_unit_type=%d\n" )
	.zero	4
.LC1035:
	ASCII(.string	"***** NAL: FILL, nal_unit_type=%d\n" )
	.zero	5
.LC1037:
	ASCII(.string	"***** NAL: EOSTREAM, nal_unit_type=%d\n" )
	.zero	1
.LC1039:
	ASCII(.string	"***** NAL: SPSEXT, nal_unit_type=%d\n" )
	.zero	3
.LC1041:
	ASCII(.string	"***** NAL: PREFIX, nal_unit_type=%d\n" )
	.zero	3
.LC1043:
	ASCII(.string	"***** NAL: SUBSPS, nal_unit_type=%d\n" )
	.zero	3
.LC1046:
	ASCII(.string	"***** NAL: AUX, nal_unit_type=%d\n" )
	.zero	6
.LC1048:
	ASCII(.string	"***** NAL: EOPIC, nal_unit_type=%d\n" )
	.zero	4
.LC1051:
	ASCII(.string	"***** NAL: UNSUPPORT, nal_unit_type=%d,nalu header:%x\n" )
	.zero	1
.LC1053:
	ASCII(.string	"nal_header != 0x00000100 not support.\n" )
	.zero	1
.LC1060:
	ASCII(.string	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d,new w/h = %d/%d\n" )
	.zero	3
.LC1063:
	ASCII(.string	"MVC_FindTrailZeros ERR\n" )
.LC1065:
	ASCII(.string	"store pic err, ret = %d\n" )
	.zero	7
.LC1067:
	ASCII(.string	"MVC_IMODE nal store pic err, ret = %d\n" )
	.zero	1
.LC1069:
	ASCII(.string	"MVC_IMODE nal flush dpb err, ret = %d\n" )
	.bss
	.align	3
.LANCHOR3 = . + 0
.LANCHOR4 = . + 4352
	.type	pps_tmp.11124, %object
	.size	pps_tmp.11124, 2240
pps_tmp.11124:
	.zero	2240
	.type	sps_tmp.11255, %object
	.size	sps_tmp.11255, 3992
sps_tmp.11255:
	.zero	3992
	.type	MvcTmpBuf, %object
	.size	MvcTmpBuf, 68
MvcTmpBuf:
	.zero	68
	.type	cnt.10148, %object
	.size	cnt.10148, 4
cnt.10148:
	.zero	4
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
