#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"h264.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	IsSTRefFlg
	.type	IsSTRefFlg, %function
IsSTRefFlg:
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
	.size	IsSTRefFlg, .-IsSTRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsLTRefFlg
	.type	IsLTRefFlg, %function
IsLTRefFlg:
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
	.size	IsLTRefFlg, .-IsLTRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	compare_pic_by_pic_num_desc
	.type	compare_pic_by_pic_num_desc, %function
compare_pic_by_pic_num_desc:
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
	ldr	w1, [x0, 8]
	ldr	w2, [x2, 8]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	csetm	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	compare_pic_by_pic_num_desc, .-compare_pic_by_pic_num_desc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	compare_pic_by_lt_pic_num_asc
	.type	compare_pic_by_lt_pic_num_asc, %function
compare_pic_by_lt_pic_num_asc:
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
	ldr	w1, [x0, 4]
	ldr	w2, [x2, 4]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	compare_pic_by_lt_pic_num_asc, .-compare_pic_by_lt_pic_num_asc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	compare_fs_by_frame_num_desc
	.type	compare_fs_by_frame_num_desc, %function
compare_fs_by_frame_num_desc:
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
	ldr	w1, [x0, 664]
	ldr	w2, [x2, 664]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	csetm	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	compare_fs_by_frame_num_desc, .-compare_fs_by_frame_num_desc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	compare_fs_by_lt_pic_idx_asc
	.type	compare_fs_by_lt_pic_idx_asc, %function
compare_fs_by_lt_pic_idx_asc:
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
	ldr	w1, [x0, 668]
	ldr	w2, [x2, 668]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, hi
	csel	w0, w0, w3, cs
	ret
	.size	compare_fs_by_lt_pic_idx_asc, .-compare_fs_by_lt_pic_idx_asc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	compare_pic_by_poc_asc
	.type	compare_pic_by_poc_asc, %function
compare_pic_by_poc_asc:
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
	ldr	w1, [x0, 12]
	ldr	w2, [x2, 12]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	compare_pic_by_poc_asc, .-compare_pic_by_poc_asc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	compare_pic_by_poc_desc
	.type	compare_pic_by_poc_desc, %function
compare_pic_by_poc_desc:
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
	ldr	w1, [x0, 12]
	ldr	w2, [x2, 12]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	csetm	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	compare_pic_by_poc_desc, .-compare_pic_by_poc_desc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	compare_fs_by_poc_asc
	.type	compare_fs_by_poc_asc, %function
compare_fs_by_poc_asc:
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
	ldr	w1, [x0, 672]
	ldr	w2, [x2, 672]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	compare_fs_by_poc_asc, .-compare_fs_by_poc_asc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	compare_fs_by_poc_desc
	.type	compare_fs_by_poc_desc, %function
compare_fs_by_poc_desc:
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
	ldr	w1, [x0, 672]
	ldr	w2, [x2, 672]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	csetm	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	compare_fs_by_poc_desc, .-compare_fs_by_poc_desc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	SetFrmRepeatCount.part.7, %function
SetFrmRepeatCount.part.7:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	add	x3, x19, 65536
	add	x19, x19, 24576
	ldr	w2, [x3, 2028]
	ldr	w1, [x19, 3704]
	ldr	w0, [x3, 2024]
	add	w2, w1, w2, lsr 1
	lsr	w0, w0, 1
	add	w4, w2, 1
	cmp	w0, w4
	bcc	.L28
	sub	w0, w0, #1
	sub	w0, w0, w2
	cmp	w0, 1
	bls	.L29
	mov	w0, 2
	str	w0, [x20, 16]
	ldr	w0, [x3, 2028]
	add	w0, w0, 4
	str	w0, [x3, 2028]
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
	ldr	w0, [x3, 2028]
	add	w0, w0, 2
	str	w0, [x3, 2028]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SetFrmRepeatCount.part.7, .-SetFrmRepeatCount.part.7
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	DumpList.part.10, %function
DumpList.part.10:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x24, x20, 20480
	mov	w21, 0
	bl	_mcount
	ldr	x23, .LC3
	add	x25, x24, 1624
.L33:
	ldr	w0, [x25]
	cbz	w0, .L37
	uxtw	x0, w21
	mov	w19, 0
	lsl	x22, x0, 5
	add	x22, x22, x0
	.p2align 2
.L34:
	add	x4, x22, x19, uxtw
	mov	w3, w19
	mov	w2, w21
	mov	x1, x23
	add	x4, x20, x4, lsl 3
	mov	w0, 13
	add	w19, w19, 1
	ldr	x4, [x4, 28696]
	ldr	x4, [x4, 40]
	ldr	w5, [x4, 672]
	ldr	w4, [x4, 660]
	bl	dprint_vfmw
	ldr	w0, [x25]
	cmp	w19, w0
	bcc	.L34
.L37:
	add	w21, w21, 1
	add	x25, x25, 4
	cmp	w21, 2
	bne	.L33
	ldr	w0, [x24, 1624]
	cbnz	w0, .L65
.L38:
	ldr	w0, [x24, 1628]
	cbnz	w0, .L66
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L66:
	ldr	x1, .LC15
	mov	w0, 13
	mov	w19, 0
	bl	dprint_vfmw
	ldr	w0, [x24, 1628]
	cbz	w0, .L53
	ldr	x23, .LC9
	ldr	x21, .LC13
	ldr	x22, .LC11
	b	.L58
	.p2align 3
.L67:
	cmp	w0, 2
	cbz	w0, .L50
	mov	x1, x21
	mov	w0, 13
	bne	.L48
	ldr	x2, [x2, 40]
	ldr	w2, [x2, 672]
	bl	dprint_vfmw
.L48:
	ldr	w0, [x24, 1628]
	add	w19, w19, 1
	cmp	w19, w0
	bcs	.L53
.L58:
	add	x0, x20, x19, uxtw 3
	ldr	x2, [x0, 28960]
	ldrb	w0, [x2]
	cmp	w0, 1
	bne	.L67
	ldr	x2, [x2, 40]
	mov	x1, x22
	mov	w0, 13
	add	w19, w19, 1
	ldr	w2, [x2, 672]
	bl	dprint_vfmw
	ldr	w0, [x24, 1628]
	cmp	w19, w0
	bcc	.L58
.L53:
	ldr	x1, .LC7
	mov	w0, 13
	bl	dprint_vfmw
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L50:
	ldr	x2, [x2, 40]
	mov	x1, x23
	mov	w0, 13
	ldr	w2, [x2, 672]
	bl	dprint_vfmw
	b	.L48
	.p2align 3
.L65:
	ldr	x1, .LC5
	mov	w0, 13
	mov	w19, 0
	bl	dprint_vfmw
	ldr	w0, [x24, 1624]
	cbz	w0, .L45
	ldr	x23, .LC9
	ldr	x21, .LC13
	ldr	x22, .LC11
	b	.L59
	.p2align 3
.L68:
	cmp	w0, 2
	cbz	w0, .L42
	mov	x1, x21
	mov	w0, 13
	bne	.L40
	ldr	x2, [x2, 40]
	ldr	w2, [x2, 812]
	bl	dprint_vfmw
.L40:
	ldr	w0, [x24, 1624]
	add	w19, w19, 1
	cmp	w19, w0
	bcs	.L45
.L59:
	add	x0, x20, x19, uxtw 3
	ldr	x2, [x0, 28696]
	ldrb	w0, [x2]
	cmp	w0, 1
	bne	.L68
	ldr	x2, [x2, 40]
	mov	x1, x22
	mov	w0, 13
	add	w19, w19, 1
	ldr	w2, [x2, 764]
	bl	dprint_vfmw
	ldr	w0, [x24, 1624]
	cmp	w19, w0
	bcc	.L59
.L45:
	ldr	x1, .LC7
	mov	w0, 13
	bl	dprint_vfmw
	b	.L38
	.p2align 3
.L42:
	ldr	x2, [x2, 40]
	mov	x1, x23
	mov	w0, 13
	ldr	w2, [x2, 672]
	bl	dprint_vfmw
	b	.L40
	.size	DumpList.part.10, .-DumpList.part.10
	.align	3
.LC3:
	.xword	.LC2
	.align	3
.LC5:
	.xword	.LC4
	.align	3
.LC7:
	.xword	.LC6
	.align	3
.LC9:
	.xword	.LC8
	.align	3
.LC11:
	.xword	.LC10
	.align	3
.LC13:
	.xword	.LC12
	.align	3
.LC15:
	.xword	.LC14
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	CombinePacket.part.17, %function
CombinePacket.part.17:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC17
	mov	w0, 7
	bl	dprint_vfmw
	ldr	x2, [x19, 632]
	mov	w0, 7
	ldr	x1, .LC19
	ldp	w5, w3, [x2, 48]
	ldr	w4, [x2, 16]
	ldr	w2, [x2, 20]
	bl	dprint_vfmw
	ldr	x1, [x19, 632]
	ldr	x3, .LC20
	ldr	w2, [x1, 16]
	ldr	x0, [x1, 40]
	ldr	x3, [x3, 104]
	ldr	x1, [x1, 8]
	sub	x0, x0, x2
	blr	x3
	ldr	x2, [x19, 632]
	mov	w4, 1
	ldr	x1, .LC22
	mov	w0, 7
	ldr	w3, [x2, 68]
	ldr	w20, [x2, 36]
	str	w3, [x2, 36]
	ldr	x2, [x19, 632]
	str	wzr, [x2, 28]
	ldr	x2, [x19, 632]
	ldr	w5, [x2, 16]
	ldr	x3, [x2, 40]
	sub	x3, x3, x5
	str	x3, [x2, 8]
	ldr	x2, [x19, 632]
	ldr	w5, [x2, 16]
	ldr	w3, [x2, 52]
	sub	w3, w3, w5
	str	w3, [x2, 20]
	ldr	x2, [x19, 632]
	ldr	w5, [x2, 16]
	ldr	w3, [x2, 48]
	add	w3, w5, w3
	str	w3, [x2, 16]
	ldr	x2, [x19, 632]
	str	w4, [x2, 76]
	ldr	x2, [x19, 632]
	ldp	w3, w2, [x2, 16]
	bl	dprint_vfmw
	add	x0, x19, 65536
	mov	w1, w20
	ldr	w0, [x0, 1980]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 632]
	str	xzr, [x0, 40]
	ldr	x0, [x19, 632]
	str	wzr, [x0, 60]
	ldr	x0, [x19, 632]
	str	wzr, [x0, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CombinePacket.part.17, .-CombinePacket.part.17
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC19:
	.xword	.LC18
	.align	3
.LC20:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC22:
	.xword	.LC21
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ue_v
	.type	ue_v, %function
ue_v:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x21, x22, 12288
	mov	x23, x1
	add	x21, x21, 2600
	bl	_mcount
	mov	w1, 32
	mov	x0, x21
	bl	BsShow
	mov	w20, w0
	bl	ZerosMS_32
	cmp	w0, 15
	mov	w19, w0
	bls	.L74
	cmp	w0, 31
	bls	.L75
	add	x0, x22, 65536
	mov	w1, 1
	mov	w20, -1
	mov	w19, 32
	str	w1, [x0, 1920]
.L72:
	ldr	x4, [x22, 632]
	mov	w3, w20
	ldr	x1, .LC24
	mov	x2, x23
	mov	w0, 21
	ldr	w5, [x4, 72]
	add	w19, w5, w19
	str	w19, [x4, 72]
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L74:
	lsl	w19, w0, 1
	mov	w2, 32
	add	w19, w19, 1
	mov	x0, x21
	sub	w2, w2, w19
	mov	w1, w19
	lsr	w20, w20, w2
	sub	w20, w20, #1
	bl	BsSkip
	b	.L72
	.p2align 3
.L75:
	mov	w1, w0
	mov	x0, x21
	add	w24, w19, 1
	lsl	w19, w19, 1
	bl	BsSkip
	add	w19, w19, 1
	mov	w1, w24
	mov	x0, x21
	bl	BsShow
	sub	w20, w0, #1
	mov	w1, w24
	mov	x0, x21
	bl	BsSkip
	b	.L72
	.size	ue_v, .-ue_v
	.align	3
.LC24:
	.xword	.LC23
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	se_v
	.type	se_v, %function
se_v:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x21, x22, 12288
	mov	x23, x1
	add	x21, x21, 2600
	bl	_mcount
	mov	w1, 32
	mov	x0, x21
	bl	BsShow
	mov	w20, w0
	bl	ZerosMS_32
	cmp	w0, 15
	mov	w19, w0
	bhi	.L77
	lsl	w19, w0, 1
	mov	w2, 32
	add	w19, w19, 1
	mov	x0, x21
	sub	w2, w2, w19
	mov	w1, w19
	lsr	w20, w20, w2
	and	w2, w20, 1
	lsr	w20, w20, 1
	cmp	w2, wzr
	csneg	w20, w20, w20, eq
	bl	BsSkip
.L79:
	ldr	x4, [x22, 632]
	mov	w3, w20
	ldr	x1, .LC25
	mov	x2, x23
	mov	w0, 21
	ldr	w5, [x4, 72]
	add	w19, w5, w19
	str	w19, [x4, 72]
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L77:
	cmp	w0, 31
	bls	.L86
	add	x0, x22, 65536
	mov	w1, 1
	mov	w20, 2147483647
	mov	w19, 32
	str	w1, [x0, 1920]
	b	.L79
	.p2align 3
.L86:
	mov	w1, w0
	mov	x0, x21
	bl	BsSkip
	mov	w1, w19
	mov	x0, x21
	lsl	w19, w19, 1
	bl	BsGet
	mov	w20, w0
	mov	w1, 1
	mov	x0, x21
	add	w19, w19, 1
	bl	BsGet
	and	w0, w0, 1
	cmp	w0, wzr
	csneg	w20, w20, w20, eq
	b	.L79
	.size	se_v, .-se_v
	.align	3
.LC25:
	.xword	.LC23
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	u_v
	.type	u_v, %function
u_v:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x22, x2
	mov	w19, w1
	bl	_mcount
	add	x0, x21, 12288
	mov	w1, w19
	add	x0, x0, 2600
	bl	BsGet
	mov	w20, w0
	ldr	x4, [x21, 632]
	mov	w3, w0
	ldr	x1, .LC26
	mov	x2, x22
	mov	w0, 21
	ldr	w5, [x4, 72]
	add	w19, w5, w19
	str	w19, [x4, 72]
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	u_v, .-u_v
	.align	3
.LC26:
	.xword	.LC23
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	u_1
	.type	u_1, %function
u_1:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	add	x0, x20, 12288
	mov	w1, 1
	add	x0, x0, 2600
	bl	BsGet
	mov	w19, w0
	ldr	x5, [x20, 632]
	mov	w3, w0
	ldr	x1, .LC27
	mov	x2, x21
	mov	w0, 21
	ldr	w4, [x5, 72]
	add	w4, w4, 1
	str	w4, [x5, 72]
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	u_1, .-u_1
	.align	3
.LC27:
	.xword	.LC23
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FrameStoreRefFlg
	.type	FrameStoreRefFlg, %function
FrameStoreRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 2]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	FrameStoreRefFlg, .-FrameStoreRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseNAL
	.type	ReleaseNAL, %function
ReleaseNAL:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w21, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L99
	ldr	x23, .LC35
	add	x19, x20, 8
	strb	wzr, [x20, 1]
	add	x22, x20, 72
	strb	wzr, [x20, 4]
.L94:
	ldr	x1, [x19]
	mov	w0, w21
	cbz	x1, .L93
	ldr	w1, [x19, 28]
	bl	SM_ReleaseStreamSeg
	ldr	w3, [x19, 8]
	mov	x1, x23
	ldr	x2, [x19]
	mov	w0, 7
	bl	dprint_vfmw
	str	xzr, [x19]
	str	wzr, [x19, 8]
	str	wzr, [x19, 20]
.L93:
	add	x19, x19, 32
	cmp	x19, x22
	bne	.L94
	strb	wzr, [x20]
	str	wzr, [x20, 76]
.L90:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L99:
	ldr	x2, .LC31
	mov	w3, 422
	ldr	x1, .LC33
	mov	w0, 0
	bl	dprint_vfmw
	b	.L90
	.size	ReleaseNAL, .-ReleaseNAL
	.align	3
.LC31:
	.xword	.LC30
	.align	3
.LC33:
	.xword	.LC32
	.align	3
.LC35:
	.xword	.LC34
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetMinPOC
	.type	GetMinPOC, %function
GetMinPOC:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x2
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	str	wzr, [x21]
	add	x1, x20, 24576
	mov	w0, 2147483647
	str	w0, [x19]
	ldr	w0, [x1, 3704]
	ldr	w2, [x1, 3708]
	cmp	w2, w0
	bls	.L101
	mov	w2, w0
	str	w0, [x1, 3708]
.L101:
	mov	w0, 0
	cbz	w2, .L100
	.p2align 2
.L108:
	add	x3, x20, x0, uxtw 3
	ldr	w5, [x19]
	ldr	x3, [x3, 27896]
	ldr	w4, [x3, 672]
	cmp	w5, w4
	ble	.L103
	ldrb	w3, [x3, 4]
	cbz	w3, .L103
	str	w4, [x19]
	str	w0, [x21]
.L103:
	ldr	w3, [x1, 3708]
	add	w0, w0, 1
	cmp	w3, w0
	bhi	.L108
.L100:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	GetMinPOC, .-GetMinPOC
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	RemoveFrameStoreOutDPB
	.type	RemoveFrameStoreOutDPB, %function
RemoveFrameStoreOutDPB:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	uxtw	x21, w1
	mov	x20, x0
	mov	x0, x30
	mov	x19, x21
	add	x22, x20, x21, lsl 3
	bl	_mcount
	ldr	x1, [x22, 27896]
	cbz	x1, .L129
	ldr	w0, [x1, 696]
	add	x23, x20, 24576
	add	x24, x20, 65536
	add	x0, x0, 4096
	add	x0, x0, 2980
	str	wzr, [x20, x0, lsl 2]
	ldr	w0, [x23, 3988]
	cmp	w0, wzr
	cset	w2, ne
	sub	w0, w0, w2
	str	w0, [x23, 3988]
	ldr	w1, [x1, 656]
	ldr	w0, [x24, 1980]
	bl	FSP_GetLogicFs
	cbz	x0, .L115
	ldrsb	w0, [x0, 1]
	cmp	w0, 3
	beq	.L116
	ldr	x1, [x22, 27896]
	mov	w2, 0
	ldr	w0, [x24, 1980]
	ldr	w1, [x1, 656]
	bl	FSP_SetDisplay
.L116:
	ldr	x1, [x22, 27896]
	mov	w2, 0
	ldr	w0, [x24, 1980]
	ldr	w1, [x1, 656]
	bl	FSP_SetRef
.L115:
	ldr	x0, [x22, 27896]
	mov	w1, -1
	strb	wzr, [x0, 1]
	ldr	x0, [x22, 27896]
	strb	wzr, [x0, 4]
	ldr	x0, [x22, 27896]
	strb	wzr, [x0, 2]
	ldr	x0, [x22, 27896]
	str	w1, [x0, 656]
	ldr	w2, [x23, 3708]
	add	w2, w2, w1
	cmp	w19, w2
	bcs	.L118
	.p2align 2
.L126:
	add	w0, w19, 1
	add	x1, x20, x21, lsl 3
	mov	w19, w0
	cmp	w0, w2
	mov	x21, x0
	add	x0, x20, x0, lsl 3
	ldr	x0, [x0, 27896]
	str	x0, [x1, 27896]
	bne	.L126
.L118:
	add	x20, x20, x2, uxtw 3
	str	xzr, [x20, 27896]
	str	w2, [x23, 3708]
.L111:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L129:
	ldr	x2, .LC36
	mov	w3, w21
	ldr	x1, .LC38
	mov	w0, 1
	bl	dprint_vfmw
	b	.L111
	.size	RemoveFrameStoreOutDPB, .-RemoveFrameStoreOutDPB
	.align	3
.LC36:
	.xword	.LANCHOR0
	.align	3
.LC38:
	.xword	.LC37
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	RemoveUnUsedFrameStore
	.type	RemoveUnUsedFrameStore, %function
RemoveUnUsedFrameStore:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	bl	_mcount
	cbz	x22, .L140
	add	x0, x22, 24576
	ldr	w23, [x0, 3708]
	cbz	w23, .L139
	mov	w21, 0
	mov	w20, 0
	add	x24, x22, 65536
	mov	w25, -1
	b	.L138
	.p2align 3
.L149:
	ldrb	w1, [x0, 4]
	cbnz	w1, .L136
	ldr	w1, [x0, 848]
	cmp	w1, 1
	beq	.L136
	strb	wzr, [x0, 1]
	mov	w1, w21
	mov	x0, x22
	add	w20, w20, 1
	bl	RemoveFrameStoreOutDPB
	cmp	w23, w20
	beq	.L139
	.p2align 2
.L138:
	add	x19, x22, x21, uxtw 3
	ldr	w0, [x24, 1980]
	ldr	x1, [x19, 27896]
	ldr	w1, [x1, 656]
	bl	FSP_GetLogicFs
	cbz	x0, .L133
	ldrsh	w1, [x0]
	cbnz	w1, .L134
	ldr	x1, [x19, 27896]
	ldrb	w2, [x1, 2]
	cbnz	w2, .L135
	ldrsb	w0, [x0]
	cbnz	w0, .L148
.L135:
	str	w25, [x1, 656]
	ldr	x0, [x19, 27896]
	strb	wzr, [x0, 2]
.L133:
	ldr	x0, [x19, 27896]
	ldr	w1, [x0, 848]
	cmp	w1, 1
	cset	w1, eq
	strb	w1, [x0, 4]
.L134:
	ldr	x0, [x19, 27896]
	ldrb	w1, [x0, 2]
	cbz	w1, .L149
.L136:
	add	w20, w20, 1
	add	w21, w21, 1
	cmp	w23, w20
	bne	.L138
.L139:
	mov	w0, 0
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L148:
	ldr	w1, [x1, 656]
	ldr	w0, [x24, 1980]
	bl	FSP_SetRef
	ldr	x1, [x19, 27896]
	b	.L135
	.p2align 3
.L140:
	mov	w0, -1
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.size	RemoveUnUsedFrameStore, .-RemoveUnUsedFrameStore
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UnMarkFrameStoreRef
	.type	UnMarkFrameStoreRef, %function
UnMarkFrameStoreRef:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 1]
	tbz	x0, 0, .L151
	ldrb	w1, [x19, 2]
	strb	wzr, [x19, 753]
	and	w1, w1, 2
	strb	wzr, [x19, 754]
	strb	w1, [x19, 2]
.L151:
	tbz	x0, 1, .L152
	ldrb	w1, [x19, 2]
	strb	wzr, [x19, 801]
	and	w1, w1, 1
	strb	wzr, [x19, 802]
	strb	w1, [x19, 2]
.L152:
	cmp	w0, 3
	bne	.L153
	strb	wzr, [x19, 706]
	strb	wzr, [x19, 705]
.L153:
	add	x20, x20, 65536
	strb	wzr, [x19, 2]
	ldr	w1, [x19, 656]
	mov	w2, 0
	ldr	w0, [x20, 1980]
	bl	FSP_SetRef
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	UnMarkFrameStoreRef, .-UnMarkFrameStoreRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InitOldSlice
	.type	InitOldSlice, %function
InitOldSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 20480
	mov	w4, 32
	ldr	w8, [x19, 14948]
	mov	w7, 23352
	movk	w7, 0x1, lsl 16
	mov	w6, 2
	strb	w4, [x0, 3226]
	add	x4, x0, 3072
	strb	wzr, [x0, 3224]
	mov	w5, 7
	strb	w6, [x0, 3225]
	mov	w3, 3
	str	w8, [x0, 3232]
	mov	w2, -1
	str	w5, [x0, 3236]
	mov	w1, 262144
	str	w7, [x0, 3240]
	stp	w3, w2, [x4, 176]
	stp	wzr, wzr, [x4, 184]
	str	w1, [x0, 3264]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	InitOldSlice, .-InitOldSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ClearAllSlice
	.type	ClearAllSlice, %function
ClearAllSlice:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 65536
	add	x19, x19, 61440
	add	x19, x19, 3576
	add	x20, x21, 568
	bl	_mcount
	.p2align 2
.L163:
	ldr	x0, [x19]
	mov	x1, x0
	cbz	x0, .L162
	ldr	w0, [x21, 1980]
	bl	ReleaseNAL
	str	xzr, [x19]
.L162:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L163
	str	wzr, [x21, 1904]
	mov	w0, 0
	str	wzr, [x21, 1964]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	ClearAllSlice, .-ClearAllSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_IsEosNal
	.type	H264_IsEosNal, %function
H264_IsEosNal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 12288
	bl	_mcount
	add	x19, x19, 2600
	mov	w1, 32
	mov	x0, x19
	bl	BsGet
	mov	w20, w0
	mov	w1, 32
	mov	x0, x19
	bl	BsGet
	mov	w2, 20553
	mov	w1, 20036
	movk	w2, 0x4853, lsl 16
	movk	w1, 0x4345, lsl 16
	cmp	w20, w2
	ccmp	w0, w1, 0, eq
	cset	w0, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H264_IsEosNal, .-H264_IsEosNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ClearCurrNal
	.type	ClearCurrNal, %function
ClearCurrNal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19, 632]
	cbz	x1, .L170
	add	x0, x19, 65536
	ldr	w0, [x0, 1980]
	bl	ReleaseNAL
	str	xzr, [x19, 632]
.L170:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ClearCurrNal, .-ClearCurrNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ClearAllNal
	.type	ClearAllNal, %function
ClearAllNal:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 640
	add	x21, x20, 65536
	add	x20, x20, 12288
	bl	_mcount
	add	x20, x20, 2600
	b	.L176
	.p2align 3
.L175:
	add	x19, x19, 104
	cmp	x19, x20
	beq	.L178
.L176:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L175
	ldr	w0, [x21, 1980]
	mov	x1, x19
	add	x19, x19, 104
	bl	ReleaseNAL
	cmp	x19, x20
	bne	.L176
.L178:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	ClearAllNal, .-ClearAllNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ClearCurrSlice
	.type	ClearCurrSlice, %function
ClearCurrSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 65536
	bl	_mcount
	ldr	x1, .LC42
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbz	x1, .L180
	ldr	w0, [x19, 1980]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L180:
	ldr	w1, [x19, 1936]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 1936]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ClearCurrSlice, .-ClearCurrSlice
	.align	3
.LC42:
	.xword	.LC41
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_ClearCurrPic
	.type	H264_ClearCurrPic, %function
H264_ClearCurrPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L187
	mov	x0, x19
	bl	ClearAllSlice
	add	x0, x19, 20480
	mov	w4, 32
	ldr	w8, [x19, 14948]
	mov	w7, 23352
	movk	w7, 0x1, lsl 16
	mov	w6, 2
	strb	w4, [x0, 3226]
	add	x4, x0, 3072
	strb	wzr, [x0, 3224]
	mov	w5, 7
	strb	w6, [x0, 3225]
	mov	w3, 3
	str	w8, [x0, 3232]
	mov	w2, -1
	str	w5, [x0, 3236]
	mov	w1, 262144
	str	w7, [x0, 3240]
	stp	w3, w2, [x4, 176]
	stp	wzr, wzr, [x4, 184]
	str	w1, [x0, 3264]
	mov	w0, 0
.L186:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L187:
	ldr	x2, .LC43
	mov	w3, 737
	ldr	x1, .LC44
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L186
	.size	H264_ClearCurrPic, .-H264_ClearCurrPic
	.align	3
.LC43:
	.xword	.LC30
	.align	3
.LC44:
	.xword	.LC32
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetMinPOCInDPB
	.type	GetMinPOCInDPB, %function
GetMinPOCInDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x2
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	str	wzr, [x21]
	add	x1, x20, 24576
	mov	w0, 2147483647
	str	w0, [x19]
	ldr	w0, [x1, 3704]
	ldr	w2, [x1, 3708]
	cmp	w2, w0
	bls	.L189
	mov	w2, w0
	str	w0, [x1, 3708]
.L189:
	mov	w0, 0
	cbz	w2, .L188
	.p2align 2
.L194:
	add	x3, x20, x0, uxtw 3
	ldr	w4, [x19]
	ldr	x3, [x3, 27896]
	ldr	w3, [x3, 672]
	cmp	w4, w3
	ble	.L191
	str	w3, [x19]
	str	w0, [x21]
.L191:
	ldr	w3, [x1, 3708]
	add	w0, w0, 1
	cmp	w3, w0
	bhi	.L194
.L188:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	GetMinPOCInDPB, .-GetMinPOCInDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetMaxPOC
	.type	GetMaxPOC, %function
GetMaxPOC:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x2
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	str	wzr, [x21]
	add	x1, x20, 24576
	str	wzr, [x19]
	ldr	w0, [x1, 3704]
	ldr	w2, [x1, 3708]
	cmp	w2, w0
	bls	.L197
	mov	w2, w0
	str	w0, [x1, 3708]
.L197:
	mov	w0, 0
	cbz	w2, .L196
	.p2align 2
.L204:
	add	x3, x20, x0, uxtw 3
	ldr	w5, [x19]
	ldr	x3, [x3, 27896]
	ldr	w4, [x3, 672]
	cmp	w5, w4
	bge	.L199
	ldrb	w3, [x3, 4]
	cbz	w3, .L199
	str	w4, [x19]
	str	w0, [x21]
.L199:
	ldr	w3, [x1, 3708]
	add	w0, w0, 1
	cmp	w3, w0
	bhi	.L204
.L196:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	GetMaxPOC, .-GetMaxPOC
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ShortTermRefFlg
	.type	ShortTermRefFlg, %function
ShortTermRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w1, [x19, 2]
	cmp	w1, 3
	beq	.L223
	tbnz	x1, 0, .L224
.L211:
	mov	w0, 0
	tbnz	x1, 1, .L212
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L224:
	ldr	w0, [x19, 752]
	and	w0, w0, 16776960
	cmp	w0, 65536
	bne	.L211
.L216:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L223:
	ldr	w0, [x19, 704]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L216
	ldr	w0, [x19, 752]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L216
.L212:
	ldr	w0, [x19, 800]
	ldr	x19, [sp, 16]
	and	w0, w0, 16776960
	cmp	w0, 65536
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	ShortTermRefFlg, .-ShortTermRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	LongTermRefFlg
	.type	LongTermRefFlg, %function
LongTermRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w1, [x19, 2]
	cmp	w1, 3
	beq	.L241
	tbnz	x1, 0, .L242
.L229:
	mov	w0, 0
	tbnz	x1, 1, .L230
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L242:
	ldr	w0, [x19, 752]
	and	w0, w0, 16776960
	cmp	w0, 256
	bne	.L229
.L234:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L241:
	ldr	w0, [x19, 704]
	and	w0, w0, 16776960
	cmp	w0, 256
	beq	.L234
	ldr	w0, [x19, 752]
	and	w0, w0, 16776960
	cmp	w0, 256
	beq	.L234
.L230:
	ldr	w0, [x19, 800]
	ldr	x19, [sp, 16]
	and	w0, w0, 16776960
	cmp	w0, 256
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	LongTermRefFlg, .-LongTermRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UpdateLTReflist
	.type	UpdateLTReflist, %function
UpdateLTReflist:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x24, x22, 24576
	bl	_mcount
	ldr	w0, [x24, 3708]
	cbz	w0, .L250
	sub	w23, w0, #1
	add	x20, x24, 3320
	add	x23, x23, 3488
	mov	w19, 0
	add	x23, x22, x23, lsl 3
	.p2align 2
.L246:
	ldr	x21, [x20]
	add	x20, x20, 8
	mov	x0, x21
	bl	LongTermRefFlg
	add	x1, x22, x19, uxtw 3
	cmp	x20, x23
	cbz	w0, .L245
	add	w19, w19, 1
	str	x21, [x1, 28152]
.L245:
	bne	.L246
.L244:
	ldr	w1, [x24, 3704]
	str	w19, [x24, 3716]
	cmp	w1, w19
	bls	.L243
	.p2align 2
.L253:
	add	x0, x22, x19, uxtw 3
	add	w19, w19, 1
	cmp	w19, w1
	str	xzr, [x0, 28152]
	bne	.L253
.L243:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L250:
	mov	w19, 0
	b	.L244
	.size	UpdateLTReflist, .-UpdateLTReflist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UpdateReflist
	.type	UpdateReflist, %function
UpdateReflist:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x24, x22, 24576
	bl	_mcount
	ldr	w0, [x24, 3708]
	cbz	w0, .L264
	sub	w23, w0, #1
	add	x20, x24, 3320
	add	x23, x23, 3488
	mov	w19, 0
	add	x23, x22, x23, lsl 3
	.p2align 2
.L260:
	ldr	x21, [x20]
	add	x20, x20, 8
	mov	x0, x21
	bl	ShortTermRefFlg
	add	x1, x22, x19, uxtw 3
	cmp	x20, x23
	cbz	w0, .L259
	add	w19, w19, 1
	str	x21, [x1, 28024]
.L259:
	bne	.L260
.L258:
	ldr	w1, [x24, 3704]
	str	w19, [x24, 3712]
	cmp	w1, w19
	bls	.L257
	.p2align 2
.L267:
	add	x0, x22, x19, uxtw 3
	add	w19, w19, 1
	cmp	w19, w1
	str	xzr, [x0, 28024]
	bne	.L267
.L257:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L264:
	mov	w19, 0
	b	.L258
	.size	UpdateReflist, .-UpdateReflist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	SlidingWinMark.part.8, %function
SlidingWinMark.part.8:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	add	x19, x22, 24576
	bl	_mcount
	ldr	w0, [x19, 3708]
	cbz	w0, .L271
	sub	w21, w0, #1
	add	x19, x19, 3320
	add	x21, x21, 3488
	add	x21, x22, x21, lsl 3
	.p2align 2
.L274:
	ldr	x20, [x19]
	add	x19, x19, 8
	mov	x0, x20
	ldrb	w1, [x20, 2]
	cbz	w1, .L273
	bl	ShortTermRefFlg
	cbnz	w0, .L285
.L273:
	cmp	x19, x21
	bne	.L274
.L271:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L285:
	mov	x1, x20
	mov	x0, x22
	bl	UnMarkFrameStoreRef
	mov	x0, x22
	bl	UpdateReflist
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	SlidingWinMark.part.8, .-SlidingWinMark.part.8
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetPicNumX
	.type	GetPicNumX, %function
GetPicNumX:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldrb	w0, [x20, 3]
	ldr	w2, [x20, 672]
	cbz	w0, .L288
	lsl	w2, w2, 1
	add	w2, w2, 1
.L288:
	mvn	w0, w19
	add	w0, w0, w2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetPicNumX, .-GetPicNumX
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UnMarkLTFrmByFrmIdx
	.type	UnMarkLTFrmByFrmIdx, %function
UnMarkLTFrmByFrmIdx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	x0, x20, 24576
	ldr	w4, [x0, 3716]
	cbz	w4, .L289
	ldr	x1, [x20, 28152]
	ldr	w0, [x1, 668]
	cmp	w19, w0
	beq	.L291
	sub	w4, w4, #1
	mov	x0, x20
	add	x4, x20, x4, lsl 3
	b	.L293
	.p2align 3
.L294:
	ldr	x1, [x0, 28160]
	add	x0, x0, 8
	ldr	w3, [x1, 668]
	cmp	w3, w19
	beq	.L291
.L293:
	cmp	x0, x4
	bne	.L294
.L289:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L291:
	mov	x0, x20
	bl	UnMarkFrameStoreRef
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	UnMarkLTFrmByFrmIdx, .-UnMarkLTFrmByFrmIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UnMarkLTFldByFrmIdx
	.type	UnMarkLTFldByFrmIdx, %function
UnMarkLTFldByFrmIdx:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	mov	x21, x1
	mov	w20, w2
	mov	w19, w3
	bl	_mcount
	add	x0, x22, 24576
	ldr	w4, [x0, 3716]
	cbz	w4, .L300
	sub	w6, w4, #1
	add	x0, x0, 3576
	add	x6, x6, 3520
	add	x6, x22, x6, lsl 3
	b	.L304
	.p2align 3
.L302:
	cmp	x0, x6
	beq	.L300
.L304:
	ldr	x4, [x0]
	add	x0, x0, 8
	ldr	w5, [x4, 668]
	cmp	w5, w19
	bne	.L302
	cmp	w20, 1
	beq	.L316
	cmp	w20, 2
	bne	.L302
	ldrb	w1, [x4, 753]
	cmp	w1, wzr
	ccmp	x4, x21, 0, ne
	beq	.L302
.L315:
	mov	x1, x4
	mov	x0, x22
	bl	UnMarkFrameStoreRef
.L300:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L316:
	ldrb	w1, [x4, 801]
	cmp	w1, wzr
	ccmp	x4, x21, 0, ne
	beq	.L302
	b	.L315
	.size	UnMarkLTFldByFrmIdx, .-UnMarkLTFldByFrmIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UnMarkSTRef
	.type	UnMarkSTRef, %function
UnMarkSTRef:
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
	cbnz	w0, .L318
	add	x0, x19, 24576
	ldr	w3, [x20, 672]
	sub	w3, w3, #1
	ldr	w1, [x0, 3712]
	sub	w2, w3, w21
	cbz	w1, .L317
	sub	w4, w1, #1
	add	x0, x0, 3448
	add	x4, x4, 3504
	add	x4, x19, x4, lsl 3
	b	.L324
	.p2align 3
.L323:
	cmp	x0, x4
	beq	.L317
.L324:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldr	w3, [x1, 712]
	cmp	w3, w2
	bne	.L323
	ldrb	w3, [x1, 2]
	cmp	w3, 3
	bne	.L323
	ldr	w3, [x1, 704]
	and	w3, w3, 16776960
	cmp	w3, 65536
	bne	.L323
	mov	x0, x19
	bl	UnMarkFrameStoreRef
.L317:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L318:
	add	x1, x19, 24576
	ldr	w0, [x20, 672]
	add	x4, x1, 3448
	mov	w3, 0
	lsl	w0, w0, 1
	ldr	w6, [x1, 3712]
	sub	w2, w0, w21
	cbz	w6, .L317
	.p2align 2
.L338:
	ldr	x1, [x4]
	add	x4, x4, 8
	ldrb	w0, [x1, 2]
	and	w7, w0, 1
	tbz	x0, 0, .L325
	ldr	w5, [x1, 752]
	and	w5, w5, 16776960
	cmp	w5, 65536
	beq	.L350
.L325:
	tbz	x0, 1, .L327
	ldr	w0, [x1, 800]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L351
.L327:
	add	w3, w3, 1
	cmp	w3, w6
	bne	.L338
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L350:
	ldr	w5, [x1, 760]
	cmp	w5, w2
	bne	.L325
	add	x3, x19, x3, uxtw 3
	and	w0, w0, 2
	strb	w0, [x1, 2]
	ldr	x0, [x3, 28024]
	strb	wzr, [x0, 754]
	b	.L349
	.p2align 3
.L351:
	ldr	w0, [x1, 808]
	cmp	w0, w2
	bne	.L327
	add	x3, x19, x3, uxtw 3
	strb	w7, [x1, 2]
	ldr	x0, [x3, 28024]
	strb	wzr, [x0, 802]
.L349:
	ldr	x0, [x3, 28024]
	ldrb	w1, [x0, 704]
	cmp	w1, 3
	ccmp	w1, wzr, 4, ne
	bne	.L328
	strb	wzr, [x0, 706]
	ldr	x0, [x3, 28024]
	strb	wzr, [x0, 705]
	ldr	x0, [x3, 28024]
.L328:
	ldrb	w1, [x0, 2]
	cbnz	w1, .L317
	ldr	w1, [x0, 692]
	add	x3, x19, 65536
	mov	w2, 0
	add	x1, x1, 16384
	add	x19, x19, x1, lsl 2
	str	wzr, [x19, 568]
	ldr	w1, [x0, 656]
	ldr	w0, [x3, 1980]
	bl	FSP_SetRef
	b	.L317
	.size	UnMarkSTRef, .-UnMarkSTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UnMarkLTRef
	.type	UnMarkLTRef, %function
UnMarkLTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x1
	mov	x20, x0
	mov	x0, x30
	mov	w19, w2
	bl	_mcount
	ldrb	w0, [x21, 3]
	cbz	w0, .L353
	add	x0, x20, 24576
	mov	w3, 0
	add	x4, x0, 3576
	ldr	w2, [x0, 3716]
	cbz	w2, .L352
	.p2align 2
.L373:
	ldr	x1, [x4]
	add	x4, x4, 8
	ldrb	w0, [x1, 2]
	and	w6, w0, 1
	tbz	x0, 0, .L358
	ldr	w5, [x1, 752]
	and	w5, w5, 16776960
	cmp	w5, 256
	beq	.L385
.L358:
	tbz	x0, 1, .L360
	ldr	w0, [x1, 800]
	and	w0, w0, 16776960
	cmp	w0, 256
	beq	.L386
.L360:
	add	w3, w3, 1
	cmp	w3, w2
	bne	.L373
.L352:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L385:
	ldr	w5, [x1, 756]
	cmp	w19, w5
	bne	.L358
	add	x3, x20, x3, uxtw 3
	and	w0, w0, 2
	strb	w0, [x1, 2]
	ldr	x0, [x3, 28152]
	strb	wzr, [x0, 753]
	b	.L384
	.p2align 3
.L386:
	ldr	w0, [x1, 804]
	cmp	w19, w0
	bne	.L360
	add	x3, x20, x3, uxtw 3
	strb	w6, [x1, 2]
	ldr	x0, [x3, 28152]
	strb	wzr, [x0, 801]
.L384:
	ldr	x0, [x3, 28152]
	ldrb	w1, [x0, 704]
	cmp	w1, 3
	ccmp	w1, wzr, 4, ne
	bne	.L361
	strb	wzr, [x0, 706]
	ldr	x0, [x3, 28152]
	strb	wzr, [x0, 705]
	ldr	x0, [x3, 28152]
.L361:
	ldrb	w1, [x0, 2]
	cbnz	w1, .L352
	ldr	w0, [x0, 692]
	add	x0, x0, 16384
	add	x20, x20, x0, lsl 2
	str	wzr, [x20, 568]
	b	.L352
	.p2align 3
.L353:
	add	x0, x20, 24576
	ldr	w1, [x0, 3716]
	cbz	w1, .L352
	sub	w2, w1, #1
	add	x0, x0, 3576
	add	x2, x2, 3520
	add	x2, x20, x2, lsl 3
	b	.L364
	.p2align 3
.L363:
	cmp	x0, x2
	beq	.L352
.L364:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldr	w3, [x1, 708]
	cmp	w3, w19
	bne	.L363
	ldrb	w3, [x1, 2]
	cmp	w3, 3
	bne	.L363
	ldr	w3, [x1, 704]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L363
	mov	x0, x20
	bl	UnMarkFrameStoreRef
	b	.L352
	.size	UnMarkLTRef, .-UnMarkLTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MarkPicLTRef
	.type	MarkPicLTRef, %function
MarkPicLTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x3
	mov	x21, x0
	mov	x0, x30
	mov	w19, w2
	mov	w20, w1
	bl	_mcount
	ldrb	w2, [x22, 3]
	add	x0, x21, 24576
	cbz	w2, .L388
	ldr	w7, [x0, 3712]
	mov	w3, 0
	add	x4, x0, 3448
	cbz	w7, .L387
	.p2align 2
.L409:
	ldr	x0, [x4]
	ldrb	w5, [x0, 2]
	tbz	x5, 0, .L394
	ldr	w6, [x0, 752]
	and	w6, w6, 16776960
	cmp	w6, 65536
	beq	.L415
.L394:
	tbz	x5, 1, .L397
	ldr	w5, [x0, 800]
	and	w5, w5, 16776960
	cmp	w5, 65536
	beq	.L416
.L397:
	add	w3, w3, 1
	add	x4, x4, 8
	cmp	w3, w7
	bne	.L409
.L387:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L415:
	ldr	w1, [x0, 760]
	cmp	w19, w1
	bne	.L394
	ldrb	w1, [x0, 801]
	cmp	w1, 1
	bne	.L398
	ldr	w1, [x0, 668]
	cmp	w20, w1
	bne	.L397
.L398:
	add	x3, x21, x3, uxtw 3
	str	w20, [x0, 668]
	cmp	w2, 1
	lsl	w0, w20, 1
	csinc	w0, w0, w0, ne
	mov	w1, 1
	ldr	x2, [x3, 28024]
	str	w0, [x2, 756]
	ldr	x0, [x3, 28024]
	strb	w1, [x0, 753]
	ldr	x0, [x3, 28024]
	strb	wzr, [x0, 754]
	ldr	x0, [x3, 28024]
	ldrb	w1, [x0, 704]
	cmp	w1, 3
	ccmp	w1, wzr, 4, ne
	bne	.L387
	ldrb	w2, [x0, 753]
	ldrb	w1, [x0, 801]
	cmp	w1, w2
	bne	.L387
	strb	w1, [x0, 705]
	ldr	x0, [x3, 28024]
	ldrb	w1, [x0, 754]
	strb	w1, [x0, 706]
	b	.L387
	.p2align 3
.L416:
	ldr	w1, [x0, 808]
	cmp	w1, w19
	bne	.L397
	ldrb	w1, [x0, 753]
	cmp	w1, 1
	bne	.L401
	ldr	w1, [x0, 668]
	cmp	w1, w20
	bne	.L397
.L401:
	add	x3, x21, x3, uxtw 3
	str	w20, [x0, 668]
	cmp	w2, 2
	lsl	w0, w20, 1
	csinc	w0, w0, w0, ne
	mov	w1, 1
	ldr	x2, [x3, 28024]
	str	w0, [x2, 804]
	ldr	x0, [x3, 28024]
	strb	w1, [x0, 801]
	ldr	x0, [x3, 28024]
	strb	wzr, [x0, 802]
	ldr	x0, [x3, 28024]
	ldrb	w1, [x0, 704]
	cmp	w1, 3
	ccmp	w1, wzr, 4, ne
	bne	.L387
	ldrb	w2, [x0, 753]
	ldrb	w1, [x0, 801]
	cmp	w1, w2
	bne	.L387
	strb	w1, [x0, 705]
	ldr	x0, [x3, 28024]
	ldrb	w1, [x0, 802]
	strb	w1, [x0, 706]
	b	.L387
	.p2align 3
.L388:
	ldr	w7, [x0, 3712]
	cbz	w7, .L387
	add	x0, x0, 3448
	mov	w4, 0
	b	.L393
	.p2align 3
.L392:
	add	w4, w4, 1
	cmp	w4, w7
	beq	.L387
.L393:
	ldr	x5, [x0]
	add	x0, x0, 8
	ldrb	w6, [x5, 2]
	cmp	w6, 3
	bne	.L392
	ldr	w6, [x5, 704]
	and	w6, w6, 16776960
	cmp	w6, 65536
	bne	.L392
	ldr	w1, [x5, 712]
	cmp	w19, w1
	bne	.L392
	add	x4, x21, x4, uxtw 3
	str	w20, [x5, 668]
	mov	w0, 1
	ldr	x1, [x4, 28024]
	str	w20, [x1, 708]
	ldr	x1, [x4, 28024]
	strb	w0, [x1, 705]
	ldr	x1, [x4, 28024]
	strb	w0, [x1, 753]
	ldr	x1, [x4, 28024]
	strb	w0, [x1, 801]
	ldr	x0, [x4, 28024]
	strb	wzr, [x0, 706]
	ldr	x0, [x4, 28024]
	strb	wzr, [x0, 754]
	ldr	x0, [x4, 28024]
	strb	wzr, [x0, 802]
	b	.L387
	.size	MarkPicLTRef, .-MarkPicLTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MarkSTToLTRef
	.type	MarkSTToLTRef, %function
MarkSTToLTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x1
	mov	x21, x0
	mov	x0, x30
	mov	w19, w2
	mov	w20, w3
	bl	_mcount
	ldrb	w0, [x22, 3]
	cbnz	w0, .L418
	add	x0, x21, 24576
	ldr	w2, [x22, 672]
	sub	w2, w2, #1
	ldr	w4, [x0, 3716]
	sub	w19, w2, w19
	cbz	w4, .L420
	ldr	x1, [x21, 28152]
	ldr	w0, [x1, 668]
	cmp	w20, w0
	beq	.L422
	sub	w4, w4, #1
	mov	x0, x21
	add	x4, x21, x4, lsl 3
	b	.L424
	.p2align 3
.L425:
	ldr	x1, [x0, 28160]
	add	x0, x0, 8
	ldr	w3, [x1, 668]
	cmp	w20, w3
	beq	.L422
.L424:
	cmp	x4, x0
	bne	.L425
.L420:
	mov	x3, x22
	mov	w2, w19
	mov	w1, w20
	mov	x0, x21
	bl	MarkPicLTRef
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L418:
	add	x0, x21, 24576
	ldr	w2, [x22, 672]
	lsl	w2, w2, 1
	ldr	w1, [x0, 3712]
	sub	w19, w2, w19
	cbz	w1, .L420
	sub	w5, w1, #1
	add	x0, x0, 3448
	add	x5, x5, 3504
	add	x5, x21, x5, lsl 3
	.p2align 2
.L428:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w3, [x1, 2]
	tbz	x3, 0, .L426
	ldr	w4, [x1, 752]
	and	w4, w4, 16776960
	cmp	w4, 65536
	beq	.L438
.L426:
	tbz	x3, 1, .L427
	ldr	w3, [x1, 800]
	and	w3, w3, 16776960
	cmp	w3, 65536
	beq	.L439
.L427:
	cmp	x0, x5
	bne	.L428
	b	.L420
	.p2align 3
.L438:
	ldr	w2, [x1, 760]
	cmp	w2, w19
	bne	.L426
	mov	w3, w20
	mov	w2, 1
	mov	x0, x21
	bl	UnMarkLTFldByFrmIdx
	b	.L420
	.p2align 3
.L439:
	ldr	w2, [x1, 808]
	cmp	w2, w19
	bne	.L427
	mov	w3, w20
	mov	w2, 2
	mov	x0, x21
	bl	UnMarkLTFldByFrmIdx
	b	.L420
	.p2align 3
.L422:
	mov	x0, x21
	bl	UnMarkFrameStoreRef
	b	.L420
	.size	MarkSTToLTRef, .-MarkSTToLTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UpdateMaxLTFrmIdx
	.type	UpdateMaxLTFrmIdx, %function
UpdateMaxLTFrmIdx:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	add	x21, x22, 24576
	mov	w20, w1
	bl	_mcount
	ldr	w0, [x21, 3716]
	str	w20, [x21, 3720]
	cbz	w0, .L440
	mov	w19, 0
	mov	w2, w20
	b	.L442
	.p2align 3
.L443:
	ldr	w0, [x21, 3716]
	cmp	w0, w19
	bls	.L440
.L447:
	ldr	w2, [x21, 3720]
.L442:
	add	x0, x22, x19, uxtw 3
	add	w19, w19, 1
	ldr	x1, [x0, 28152]
	ldr	w0, [x1, 668]
	cmp	w0, w2
	bcc	.L443
	mov	x0, x22
	bl	UnMarkFrameStoreRef
	ldr	w0, [x21, 3716]
	cmp	w0, w19
	bhi	.L447
.L440:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	UpdateMaxLTFrmIdx, .-UpdateMaxLTFrmIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UnMarkAllSTRef
	.type	UnMarkAllSTRef, %function
UnMarkAllSTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 24576
	mov	w19, 0
	bl	_mcount
	ldr	w0, [x21, 3712]
	cbz	w0, .L448
	.p2align 2
.L452:
	add	x1, x20, x19, uxtw 3
	mov	x0, x20
	add	w19, w19, 1
	ldr	x1, [x1, 28024]
	bl	UnMarkFrameStoreRef
	ldr	w0, [x21, 3712]
	cmp	w0, w19
	bhi	.L452
.L448:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	UnMarkAllSTRef, .-UnMarkAllSTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MarkCurrPicLT
	.type	MarkCurrPicLT, %function
MarkCurrPicLT:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x1
	mov	x21, x0
	mov	x0, x30
	mov	w19, w2
	bl	_mcount
	ldrb	w2, [x20, 3]
	cbnz	w2, .L455
	add	x0, x21, 24576
	ldr	w3, [x0, 3716]
	cbz	w3, .L456
	ldr	x1, [x21, 28152]
	ldr	w0, [x1, 668]
	cmp	w19, w0
	beq	.L457
	sub	w3, w3, #1
	mov	x0, x21
	add	x3, x21, x3, lsl 3
	b	.L459
	.p2align 3
.L460:
	ldr	x1, [x0, 28160]
	add	x0, x0, 8
	ldr	w2, [x1, 668]
	cmp	w19, w2
	beq	.L457
.L459:
	cmp	x0, x3
	bne	.L460
.L456:
	strb	wzr, [x20, 5]
	mov	w0, 1
	str	w19, [x20, 676]
	strb	w0, [x20, 4]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L457:
	mov	x0, x21
	bl	UnMarkFrameStoreRef
	strb	wzr, [x20, 5]
	str	w19, [x20, 676]
	mov	w0, 1
	strb	w0, [x20, 4]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L455:
	ldr	x1, [x20, 656]
	mov	w3, w19
	mov	x0, x21
	bl	UnMarkLTFldByFrmIdx
	strb	wzr, [x20, 5]
	str	w19, [x20, 676]
	mov	w0, 1
	strb	w0, [x20, 4]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MarkCurrPicLT, .-MarkCurrPicLT
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_Sei_Get_Dpb_Output_Time
	.type	H264_Sei_Get_Dpb_Output_Time, %function
H264_Sei_Get_Dpb_Output_Time:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L476
	add	x0, x19, 20480
	mov	w1, 2208
	ldr	x9, [x19, 14968]
	add	x2, x19, 24576
	ldr	x8, [x19, 14960]
	ldr	w3, [x0, 1592]
	mov	w0, 4000
	ldr	w5, [x2, 3240]
	ldr	w6, [x2, 3236]
	umull	x1, w3, w1
	add	w3, w5, 1
	ldr	w5, [x2, 3224]
	add	x1, x9, x1
	add	w6, w6, 1
	cmp	w6, 1
	ccmp	w5, wzr, 0, ne
	ldr	w1, [x1, 28]
	str	w3, [x2, 3240]
	ldr	w3, [x2, 3228]
	umull	x0, w1, w0
	str	w6, [x2, 3236]
	add	x0, x8, x0
	str	w5, [x2, 3244]
	add	x0, x0, 3292
	str	w3, [x2, 3252]
	ldr	w1, [x0, 52]
	str	w1, [x2, 3288]
	ldr	w1, [x0, 56]
	str	w1, [x2, 3292]
	bne	.L469
	ldr	w5, [x2, 3248]
	add	w5, w5, 2
	str	w5, [x2, 3244]
.L469:
	cmp	w6, 1
	add	x1, x2, 3232
	beq	.L477
	ldrb	w4, [x1, 80]
	cmp	w4, 1
	ldr	x4, [x1, 48]
	add	x4, x4, x5, uxtw
	str	x4, [x1, 40]
	beq	.L478
.L471:
	strb	wzr, [x2, 3312]
	add	x1, x2, 3232
	add	x2, x4, x3, uxtw
	ldr	w3, [x0, 76]
	lsr	x2, x2, 1
	ldr	w4, [x0, 52]
	sub	x3, x2, x3
	mul	x3, x3, x4
	str	x3, [x1, 24]
	ldr	w0, [x0, 76]
	str	w5, [x1, 16]
	sub	x2, x2, x0
	str	x2, [x1, 32]
.L466:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L477:
	mov	x4, 0
	str	xzr, [x2, 3272]
	str	xzr, [x2, 3280]
	b	.L471
	.p2align 3
.L478:
	str	x4, [x1, 48]
	b	.L471
	.p2align 3
.L476:
	ldr	x2, .LC45
	mov	w3, 1475
	ldr	x1, .LC46
	mov	w0, 0
	bl	dprint_vfmw
	b	.L466
	.size	H264_Sei_Get_Dpb_Output_Time, .-H264_Sei_Get_Dpb_Output_Time
	.align	3
.LC45:
	.xword	.LC30
	.align	3
.LC46:
	.xword	.LC32
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_Get_Last_IDR_Frame_Info
	.type	H264_Get_Last_IDR_Frame_Info, %function
H264_Get_Last_IDR_Frame_Info:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L485
	cmp	w20, 5
	beq	.L486
.L479:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L486:
	ldr	x0, [x19]
	ldr	x0, [x0, 64]
	cmn	x0, #1
	beq	.L479
	ldr	x1, [x19, 27840]
	str	x0, [x19, 27872]
	str	x1, [x19, 27880]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L485:
	ldr	x2, .LC47
	mov	w3, 1543
	ldr	x1, .LC48
	mov	w0, 0
	bl	dprint_vfmw
	b	.L479
	.size	H264_Get_Last_IDR_Frame_Info, .-H264_Get_Last_IDR_Frame_Info
	.align	3
.LC47:
	.xword	.LC30
	.align	3
.LC48:
	.xword	.LC32
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_Sei_Get_Frame_Pts
	.type	H264_Sei_Get_Frame_Pts, %function
H264_Sei_Get_Frame_Pts:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L494
	add	x2, x19, 24576
	ldr	x3, [x19, 27840]
	ldr	x6, [x19, 27872]
	ldr	x7, [x19, 27880]
	ldr	w4, [x2, 3288]
	ldr	w5, [x2, 3292]
	cbz	w4, .L492
	mov	w1, w4
	mov	w2, w5
	b	.L491
	.p2align 3
.L493:
	mov	w1, w0
.L491:
	udiv	w0, w2, w1
	msub	w0, w0, w1, w2
	mov	w2, w1
	cbnz	w0, .L493
.L490:
	udiv	w4, w4, w1
	sub	x0, x3, x7
	lsl	w2, w0, 6
	add	x19, x19, 61440
	sub	w2, w2, w0
	lsl	w2, w2, 1
	sub	w0, w2, w0
	lsl	w0, w0, 3
	udiv	w1, w5, w1
	mul	w0, w0, w4
	udiv	w1, w0, w1
	add	x1, x1, x6
	str	x1, [x19, 2624]
.L487:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L492:
	mov	w1, w5
	b	.L490
.L494:
	ldr	x2, .LC49
	mov	w3, 1565
	ldr	x1, .LC50
	mov	w0, 0
	bl	dprint_vfmw
	b	.L487
	.size	H264_Sei_Get_Frame_Pts, .-H264_Sei_Get_Frame_Pts
	.align	3
.LC49:
	.xword	.LC30
	.align	3
.LC50:
	.xword	.LC32
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckFrameStore
	.type	CheckFrameStore, %function
CheckFrameStore:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	add	x0, x20, 65536
	ldr	w1, [x0, 652]
	cbnz	w1, .L496
	ldr	w1, [x19, 848]
	cmp	w1, 1
	beq	.L497
	ldr	w1, [x0, 1908]
	cbz	w1, .L522
.L497:
	mov	w1, 1
	str	w1, [x0, 652]
.L496:
	ldr	w0, [x0, 1980]
	ldr	w1, [x19, 656]
	bl	FSP_GetLogicFs
	cbz	x0, .L499
	ldrsb	w3, [x0, 1]
	cmp	w3, 3
	ccmp	w3, wzr, 4, ne
	beq	.L523
	ldrb	w2, [x19, 1]
	ldrb	w3, [x19]
	cbz	w2, .L507
	cmp	w3, 1
	beq	.L507
	ldr	w1, [x19]
	mov	w3, 50332416
	and	w1, w1, -16711936
	cmp	w1, w3
	beq	.L524
	cmp	w2, 1
	beq	.L525
	cmp	w2, 2
	beq	.L526
.L505:
	ldr	x1, [x20]
	ldr	w2, [x0, 200]
	mov	w0, 0
	ldr	w3, [x1, 4]
	cmp	w2, w3
	bls	.L518
	ldr	w1, [x1, 684]
	cbz	w1, .L527
.L518:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L522:
	ldr	x1, [x20]
	ldr	w1, [x1, 24]
	cbnz	w1, .L497
	mov	w0, -1
	b	.L518
	.p2align 3
.L523:
	ldr	x1, .LC52
	mov	w0, 1
	ldr	w2, [x19, 656]
	bl	dprint_vfmw
.L501:
	ldr	w0, [x19, 848]
	cmp	w0, 1
	beq	.L508
	mov	w0, -3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L525:
	ldrb	w3, [x19, 3]
	tbz	x3, 0, .L505
	ldr	x1, .LC60
	mov	w0, w2
	bl	dprint_vfmw
	mov	w0, -1
	b	.L518
	.p2align 3
.L526:
	ldrb	w3, [x19, 3]
	tbz	x3, 1, .L505
	ldr	x1, .LC62
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L518
	.p2align 3
.L508:
	mov	w1, 2
	mov	w0, -3
	str	w1, [x19, 848]
	b	.L518
	.p2align 3
.L499:
	ldr	x1, .LC54
	mov	x2, x19
	ldr	w4, [x19, 656]
	mov	w0, 1
	ldr	w3, [x19, 848]
	bl	dprint_vfmw
	b	.L501
	.p2align 3
.L507:
	ldr	x1, .LC56
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L518
.L527:
	ldr	x1, .LC64
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L518
.L524:
	ldrb	w3, [x19, 3]
	mov	w0, 1
	ldr	x1, .LC58
	bl	dprint_vfmw
	mov	w0, -1
	b	.L518
	.size	CheckFrameStore, .-CheckFrameStore
	.align	3
.LC52:
	.xword	.LC51
	.align	3
.LC54:
	.xword	.LC53
	.align	3
.LC56:
	.xword	.LC55
	.align	3
.LC58:
	.xword	.LC57
	.align	3
.LC60:
	.xword	.LC59
	.align	3
.LC62:
	.xword	.LC61
	.align	3
.LC64:
	.xword	.LC63
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetImagePara
	.type	GetImagePara, %function
GetImagePara:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	add	x23, x21, 65536
	bl	_mcount
	add	x26, x21, 24576
	add	x0, x21, 20480
	mov	w1, 2208
	ldr	x4, [x21, 14968]
	ldrb	w3, [x20, 80]
	ldr	w2, [x0, 1592]
	mov	w0, 4000
	ldr	x6, [x21, 14960]
	and	w5, w3, -4
	ldrb	w7, [x20, 5]
	mov	w3, w5
	umull	x1, w2, w1
	add	x1, x4, x1
	ldrb	w4, [x20, 82]
	bfi	w4, w7, 1, 1
	ldr	w7, [x20, 8]
	ldr	w2, [x1, 28]
	strb	w5, [x20, 80]
	ldrb	w5, [x20, 1]
	ldr	w1, [x23, 660]
	umull	x0, w2, w0
	cmp	w5, 3
	strb	w4, [x20, 82]
	str	w1, [x20, 124]
	add	x0, x6, x0
	str	w7, [x20, 136]
	bhi	.L529
	ldr	x1, .LC65
	ldrh	w1, [x1,w5,uxtw #1]
	adr	x2, .Lrtx531
	add	x1, x2, w1, sxth #2
	br	x1
.Lrtx531:
	.section	.rodata
	.align	0
	.align	2
.L531:
	.2byte	(.L530 - .Lrtx531) / 4
	.2byte	(.L532 - .Lrtx531) / 4
	.2byte	(.L533 - .Lrtx531) / 4
	.2byte	(.L530 - .Lrtx531) / 4
	.text
	.p2align 3
.L530:
	ldrb	w1, [x20, 704]
	cbnz	w1, .L534
	ldr	w1, [x20, 688]
	mov	w7, 3
	ldr	w8, [x20, 684]
	ldr	w6, [x20, 772]
	ldr	w4, [x20, 820]
	str	w1, [x20, 168]
.L535:
	ldr	w2, [x20, 764]
	ldr	w1, [x20, 812]
	cmp	w2, w1
	beq	.L593
	cset	w1, le
.L546:
	add	x26, x21, 24576
	ldrb	w2, [x26, 3220]
	cmp	w2, 3
	beq	.L562
	cmp	w2, 4
	mov	w2, 0
	csel	w2, w1, w2, ne
.L547:
	mov	w1, w3
	bfi	w1, w8, 0, 2
	strb	w1, [x20, 80]
	ldrb	w1, [x20, 81]
	stp	w6, w4, [x20, 72]
	bfi	w1, w2, 4, 2
	bfi	w1, w7, 2, 2
	strb	w1, [x20, 81]
.L529:
	ldrb	w1, [x0, 18]
	mov	w2, 0
	str	w1, [x20, 412]
	str	w1, [x20, 416]
	ldrb	w1, [x0, 22]
	cbz	w1, .L548
	ldr	w2, [x0, 3332]
.L548:
	str	w2, [x20, 424]
	mov	w0, 1
	str	w0, [x20, 420]
	ldr	x0, [x21]
	ldr	w0, [x0, 644]
	str	w0, [x20, 140]
	ldr	x0, [x21]
	ldr	w0, [x0, 648]
	str	w0, [x20, 144]
	ldr	x0, [x21]
	ldr	w0, [x0, 652]
	str	w0, [x20, 148]
	ldr	x0, [x21]
	ldr	w0, [x0, 24]
	cbz	w0, .L549
	ldrb	w0, [x20, 704]
	cbz	w0, .L594
.L549:
	ldr	x0, [x20, 600]
	cmn	x0, #1
	beq	.L551
	ldr	w0, [x26, 3708]
	cbz	w0, .L551
	mov	w25, -1
	mov	x24, -2
	mov	w19, 0
	.p2align 2
.L554:
	add	x22, x21, x19, sxtw 3
	ldr	x0, [x22, 27896]
	cbz	x0, .L553
	ldr	w1, [x0, 656]
	ldr	w0, [x23, 1980]
	bl	FSP_GetLogicFs
	cbz	x0, .L553
	ldrsb	w0, [x0, 1]
	cmp	w0, 3
	ccmp	w0, wzr, 4, ne
	beq	.L553
	ldr	x0, [x22, 27896]
	ldr	x0, [x0, 600]
	cmp	x0, x24
	bcs	.L553
	mov	w25, w19
	mov	x24, x0
	.p2align 2
.L553:
	ldr	w0, [x26, 3708]
	add	w19, w19, 1
	cmp	w0, w19
	bhi	.L554
	cmn	w25, #1
	beq	.L551
	ldr	x1, [x20, 600]
	cmp	x1, x24
	bhi	.L595
.L551:
	ldrsb	w0, [x26, 3184]
	cbz	w0, .L555
	ldr	w0, [x26, 3200]
	cmp	w0, 3
	beq	.L596
	cmp	w0, 4
	beq	.L597
	cmp	w0, 5
	beq	.L598
	str	wzr, [x20, 292]
	mov	w0, 0
	ldr	x1, .LC69
	ldr	w2, [x26, 3200]
	bl	dprint_vfmw
	.p2align 2
.L555:
	ldr	w1, [x20, 656]
	ldr	w0, [x23, 1980]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L528
	ldr	x3, .LC70
	mov	x2, 640
	add	x1, x20, 16
	ldr	x3, [x3, 104]
	blr	x3
	str	wzr, [x19, 296]
	mov	w2, 4
	mov	w1, 1
	ldrb	w0, [x20, 704]
	strb	w1, [x19, 291]
	cmp	w0, wzr
	csel	w0, w0, w2, eq
	strb	w0, [x19, 284]
	ldr	w0, [x20, 728]
	str	w0, [x19, 300]
	strb	w1, [x19, 289]
	str	w0, [x19, 304]
	str	w0, [x19, 308]
	ldr	w0, [x20, 736]
	str	w0, [x19, 236]
.L528:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L595:
	ldr	w0, [x23, 1980]
	mov	x2, x24
	bl	IsPtsRewind
	cbnz	w0, .L551
	ldr	x1, .LC67
	mov	x3, x24
	ldr	x2, [x20, 600]
	mov	w0, 29
	add	x21, x21, x25, sxtw 3
	bl	dprint_vfmw
	ldr	x0, [x21, 27896]
	ldr	x1, [x20, 600]
	str	x1, [x0, 600]
	str	x24, [x20, 600]
	b	.L551
	.p2align 3
.L594:
	cmp	w5, 3
	bne	.L549
	ldrb	w0, [x20, 81]
	and	w0, w0, -4
	strb	w0, [x20, 81]
	b	.L549
	.p2align 3
.L532:
	ldrb	w2, [x20, 81]
	mov	w7, 1
	ldr	w6, [x20, 684]
	mov	w1, w3
	bfi	w2, w7, 2, 2
	ldr	w4, [x20, 688]
	ldr	w3, [x20, 772]
	bfi	w1, w6, 0, 2
	ldr	w7, [x20, 784]
	mov	w6, 3
	strb	w2, [x20, 81]
	add	x26, x21, 24576
	strb	w1, [x20, 80]
	stp	w3, w6, [x20, 72]
	str	w4, [x20, 168]
	str	w7, [x20, 736]
	b	.L529
	.p2align 3
.L533:
	ldrb	w2, [x20, 81]
	mov	w7, 2
	ldr	w6, [x20, 684]
	mov	w1, w3
	bfi	w2, w7, 2, 2
	ldr	w4, [x20, 688]
	ldr	w7, [x20, 820]
	bfi	w1, w6, 0, 2
	ldr	w3, [x20, 832]
	mov	w6, 3
	strb	w2, [x20, 81]
	add	x26, x21, 24576
	strb	w1, [x20, 80]
	stp	w6, w7, [x20, 72]
	str	w4, [x20, 168]
	str	w3, [x20, 736]
	b	.L529
	.p2align 3
.L596:
	mov	w0, 1
	str	w0, [x20, 292]
	b	.L555
	.p2align 3
.L598:
	mov	w0, 3
	str	w0, [x20, 292]
	b	.L555
	.p2align 3
.L534:
	ldr	w2, [x20, 768]
	ldr	w1, [x23, 1976]
	ldr	w9, [x20, 816]
	cmp	w2, w1
	bhi	.L599
	cmp	w1, w9
	bcc	.L539
.L537:
	ldr	w1, [x20, 688]
	mov	w7, 3
	ldr	w8, [x20, 684]
	ldr	w6, [x20, 772]
	ldr	w4, [x20, 820]
	str	w1, [x20, 168]
.L540:
	ldrb	w1, [x20, 3]
	cmp	w1, 1
	beq	.L600
	cmp	w1, 2
	beq	.L601
.L542:
	ldr	w2, [x20, 784]
	ldr	w1, [x20, 832]
	stp	w6, w4, [x20, 72]
	add	w1, w2, w1
	add	w1, w1, w1, lsr 31
	asr	w1, w1, 1
	str	w1, [x20, 736]
	b	.L535
.L539:
	ldr	w8, [x20, 772]
	mov	w7, 1
	ldr	w4, [x20, 820]
	mov	w6, w8
	str	w2, [x20, 168]
	b	.L540
	.p2align 3
.L597:
	mov	w0, 2
	str	w0, [x20, 292]
	b	.L555
.L562:
	mov	w2, 1
	b	.L547
.L593:
	ldr	w1, [x20, 84]
	cmp	w1, 720
	mov	w1, 1
	bne	.L546
	ldr	w1, [x20, 88]
	cmp	w1, 480
	cset	w1, ne
	b	.L546
.L599:
	cmp	w1, w9
	bcc	.L537
	ldr	w8, [x20, 820]
	mov	w7, 2
	ldr	w6, [x20, 772]
	mov	w4, w8
	str	w9, [x20, 168]
	b	.L540
.L600:
	mov	w8, w4
	mov	w7, 2
	str	w9, [x20, 168]
	b	.L542
.L601:
	mov	w8, w6
	mov	w7, 1
	str	w2, [x20, 168]
	b	.L542
	.size	GetImagePara, .-GetImagePara
	.align	3
.LC65:
	.xword	.L531
	.align	3
.LC67:
	.xword	.LC66
	.align	3
.LC69:
	.xword	.LC68
	.align	3
.LC70:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SetFrmRepeatCount
	.type	SetFrmRepeatCount, %function
SetFrmRepeatCount:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, [x19]
	ldr	w0, [x0, 660]
	add	w0, w0, 2047
	cmp	w0, 4095
	bls	.L603
	mov	x1, x20
	mov	x0, x19
	bl	SetFrmRepeatCount.part.7
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L603:
	str	wzr, [x20, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SetFrmRepeatCount, .-SetFrmRepeatCount
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SplitFrmToFlds
	.type	SplitFrmToFlds, %function
SplitFrmToFlds:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w4, [x19, 705]
	mov	w6, 1
	ldrb	w3, [x19, 706]
	mov	w5, 2
	ldr	w2, [x19, 720]
	ldr	w1, [x19, 724]
	ldr	x0, [x19, 744]
	strb	w4, [x19, 753]
	strb	w3, [x19, 754]
	strb	w6, [x19, 752]
	strb	w4, [x19, 801]
	strb	w3, [x19, 802]
	strb	w5, [x19, 800]
	str	w2, [x19, 768]
	str	w1, [x19, 772]
	str	x0, [x19, 792]
	str	w2, [x19, 816]
	str	w1, [x19, 820]
	str	x0, [x19, 840]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SplitFrmToFlds, .-SplitFrmToFlds
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CombineFldsToFrm
	.type	CombineFldsToFrm, %function
CombineFldsToFrm:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 764]
	mov	w5, 3
	ldr	w3, [x19, 768]
	ldr	w2, [x19, 812]
	ldr	w0, [x19, 816]
	cmp	w1, w2
	ldr	x4, [x19, 792]
	add	w0, w3, w0
	ldrb	w3, [x19, 801]
	csel	w1, w1, w2, le
	lsr	w0, w0, 1
	strb	w5, [x19, 704]
	str	w1, [x19, 672]
	str	w1, [x19, 716]
	str	w0, [x19, 720]
	str	x4, [x19, 744]
	cbz	w3, .L607
	ldrb	w1, [x19, 753]
	cbz	w1, .L607
	mov	w1, 1
	strb	w1, [x19, 705]
.L609:
	mov	w2, 0
.L610:
	ldr	w1, [x19, 772]
	strb	w2, [x19, 706]
	cbz	w1, .L611
	ldr	w2, [x19, 820]
	cbz	w2, .L613
	cmp	w1, w2
	csel	w1, w1, w2, cs
.L611:
	str	w1, [x19, 684]
	str	w0, [x19, 688]
	str	w1, [x19, 724]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L607:
	ldr	w1, [x19, 800]
	strb	wzr, [x19, 705]
	tst	w1, 16776960
	beq	.L609
	ldr	w1, [x19, 752]
	mov	w2, 1
	tst	w1, 16776960
	bne	.L610
	b	.L609
	.p2align 3
.L613:
	mov	w1, 0
	str	w0, [x19, 688]
	str	w1, [x19, 684]
	str	w1, [x19, 724]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CombineFldsToFrm, .-CombineFldsToFrm
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetAPC
	.type	GetAPC, %function
GetAPC:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x22, x1
	mov	x0, x30
	mov	w19, w2
	bl	_mcount
	cbz	x22, .L648
	cmp	w19, 1
	beq	.L628
	cmp	w19, 2
	beq	.L629
	ldr	w23, [x22, 764]
	ldr	w24, [x22, 812]
.L630:
	add	x21, x20, 24576
	ldr	w2, [x21, 3984]
	cbz	w2, .L639
	ldr	w0, [x21, 3728]
	cbz	w0, .L649
	add	x0, x21, 3732
	mov	w19, 0
	b	.L633
	.p2align 3
.L637:
	ldr	w1, [x0], 4
	cbz	w1, .L631
.L633:
	add	w19, w19, 1
	cmp	w19, w2
	bne	.L637
.L639:
	mov	w0, -1
.L643:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L629:
	ldr	w23, [x22, 812]
	mov	w24, w23
	b	.L630
.L649:
	mov	w19, 0
	.p2align 2
.L631:
	add	x0, x20, 65536
	ldr	w1, [x22, 656]
	ldr	w0, [x0, 1980]
	bl	FSP_GetLogicFs
	cbz	x0, .L634
	ldr	x1, [x0, 32]
	cbz	x1, .L634
	add	x20, x20, x19, uxtw 2
	mov	w1, 1
	add	x20, x20, 24576
	mov	w4, 16
	mov	w3, w19
	str	w1, [x20, 3728]
	ldr	x1, .LC74
	ldr	x0, [x0, 32]
	ldr	w0, [x0, 4]
	str	w0, [x20, 3792]
	mov	w0, 13
	str	w23, [x20, 3856]
	str	w24, [x20, 3920]
	ldr	w2, [x21, 3988]
	cmp	w2, 15
	csinc	w2, w4, w2, hi
	str	w2, [x21, 3988]
	ldr	w2, [x22, 164]
	bl	dprint_vfmw
	str	w19, [x22, 696]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L628:
	ldr	w23, [x22, 764]
	mov	w24, w23
	b	.L630
.L634:
	ldrb	w3, [x22, 2]
	mov	x4, x0
	ldr	x1, .LC76
	mov	x5, 0
	ldr	w2, [x22, 656]
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L643
.L648:
	ldr	x2, .LC71
	mov	w3, 2518
	ldr	x1, .LC72
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L643
	.size	GetAPC, .-GetAPC
	.align	3
.LC71:
	.xword	.LC30
	.align	3
.LC72:
	.xword	.LC32
	.align	3
.LC74:
	.xword	.LC73
	.align	3
.LC76:
	.xword	.LC75
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SlidingWinMark
	.type	SlidingWinMark, %function
SlidingWinMark:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 24576
	add	x0, x19, 16384
	ldr	w2, [x1, 3716]
	ldr	w0, [x0, 1836]
	ldr	w1, [x1, 3712]
	sub	w0, w0, w2
	cmp	w1, w0
	bne	.L650
	mov	x0, x19
	bl	SlidingWinMark.part.8
.L650:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SlidingWinMark, .-SlidingWinMark
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DumpDPB
	.type	DumpDPB, %function
DumpDPB:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC77
	ldr	w0, [x0]
	tbz	x0, 14, .L652
	add	x21, x22, 24576
	ldr	w0, [x21, 3708]
	cbz	w0, .L658
	ldr	x20, .LC80
	mov	w19, 0
	.p2align 2
.L657:
	add	x3, x22, x19, uxtw 3
	mov	w2, w19
	mov	x1, x20
	mov	w0, 14
	add	w19, w19, 1
	ldr	x3, [x3, 27896]
	ldrb	w5, [x3, 2]
	ldr	w4, [x3, 672]
	ldr	w3, [x3, 660]
	bl	dprint_vfmw
	ldr	w0, [x21, 3708]
	cmp	w0, w19
	bhi	.L657
.L658:
	ldr	x25, .LC78
	mov	w0, 14
	mov	x1, x25
	bl	dprint_vfmw
	ldr	w0, [x21, 3712]
	cbz	w0, .L656
	ldr	x24, .LC82
	mov	w19, 0
	ldr	x23, .LC84
	.p2align 2
.L659:
	add	x20, x22, x19, uxtw 3
	mov	w2, w19
	mov	x1, x24
	mov	w0, 14
	ldr	x3, [x20, 28024]
	ldrb	w5, [x3, 2]
	ldr	w4, [x3, 672]
	ldr	w3, [x3, 660]
	bl	dprint_vfmw
	ldr	x3, [x20, 28024]
	mov	w2, w19
	mov	x1, x23
	mov	w0, 14
	add	w19, w19, 1
	ldr	w3, [x3, 716]
	bl	dprint_vfmw
	ldr	w0, [x21, 3712]
	cmp	w0, w19
	bhi	.L659
.L656:
	mov	x1, x25
	mov	w0, 14
	bl	dprint_vfmw
.L652:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	DumpDPB, .-DumpDPB
	.align	3
.LC77:
	.xword	g_PrintEnable
	.align	3
.LC78:
	.xword	.LC6
	.align	3
.LC80:
	.xword	.LC79
	.align	3
.LC82:
	.xword	.LC81
	.align	3
.LC84:
	.xword	.LC83
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UpdateCurrFrameInfo
	.type	UpdateCurrFrameInfo, %function
UpdateCurrFrameInfo:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 61440
	mov	w2, 3
	ldr	x19, [x1, 2680]
	ldrb	w3, [x1, 2026]
	strb	w3, [x19]
	ldrb	w3, [x1, 2028]
	cbnz	w3, .L666
	ldrb	w2, [x1, 2029]
	mov	w0, 3
	cmp	w2, wzr
	csel	w2, w2, w0, eq
.L666:
	add	x3, x1, 2024
	strb	w2, [x19, 2]
	mov	w2, 3
	ldr	w0, [x3, 672]
	str	w0, [x19, 660]
	ldr	w0, [x3, 708]
	str	w0, [x19, 688]
	ldr	w0, [x3, 700]
	str	w0, [x19, 684]
	ldr	w0, [x3, 684]
	str	w0, [x19, 672]
	ldr	w0, [x3, 732]
	str	w0, [x19, 692]
	ldr	w0, [x3, 676]
	str	w0, [x19, 668]
	ldrb	w0, [x3, 9]
	str	w0, [x19, 680]
	ldrb	w0, [x3, 7]
	cmp	w0, 1
	csel	w0, w2, wzr, eq
	strb	w0, [x19, 3]
	ldrb	w4, [x3, 3]
	cmp	w4, 1
	beq	.L669
	cbz	w4, .L670
	cmp	w4, 2
	bne	.L665
	str	x19, [x19, 840]
	mov	w5, 1
	strb	w5, [x19, 800]
	ldrb	w5, [x3, 4]
	strb	w5, [x19, 801]
	ldrb	w5, [x3, 5]
	strb	w5, [x19, 802]
	ldr	w5, [x3, 692]
	str	w5, [x19, 812]
	ldr	w6, [x3, 700]
	str	w6, [x19, 820]
	ldr	w5, [x3, 708]
	str	w5, [x19, 816]
	str	wzr, [x19, 680]
	ldrb	w7, [x3, 1]
	cbz	w7, .L692
	ldr	w4, [x19, 768]
	orr	w0, w0, 2
	strb	w2, [x19, 1]
	mov	w2, 0
	add	w5, w5, w4
	str	w5, [x19, 688]
	str	w5, [x19, 720]
	ldrb	w3, [x3, 7]
	cmp	w3, 1
	csel	w0, w0, w2, eq
	strb	w0, [x19, 3]
	ldr	x0, [x1, 2624]
	cmn	x0, #1
	beq	.L678
	ldr	x2, [x19, 600]
	cmn	x2, #1
	beq	.L693
.L678:
	ldr	w2, [x19, 772]
.L696:
	cmp	w2, w6
	mov	x0, x19
	csel	w6, w2, w6, cs
	str	w6, [x19, 684]
	ldr	w1, [x1, 2708]
	str	w1, [x19, 672]
	bl	CombineFldsToFrm
.L665:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L670:
	strb	w2, [x19, 1]
	add	x1, x1, 2040
	strb	wzr, [x19, 704]
	mov	x2, 640
	str	x19, [x19, 744]
	add	x0, x19, 16
	ldrb	w23, [x3, 4]
	strb	w23, [x19, 705]
	ldrb	w22, [x3, 5]
	strb	w22, [x19, 706]
	ldr	w4, [x3, 688]
	str	w4, [x19, 716]
	ldr	w20, [x3, 700]
	str	w20, [x19, 724]
	ldr	w21, [x3, 708]
	str	w21, [x19, 720]
	ldr	w4, [x3, 692]
	str	w4, [x19, 764]
	ldr	w3, [x3, 696]
	str	w3, [x19, 812]
	bl	memcpy
	strb	w23, [x19, 753]
	strb	w22, [x19, 754]
	mov	w1, 1
	strb	w23, [x19, 801]
	mov	w0, 2
	strb	w1, [x19, 752]
	strb	w22, [x19, 802]
	strb	w0, [x19, 800]
	str	w21, [x19, 768]
	str	w20, [x19, 772]
	str	x19, [x19, 792]
	str	w21, [x19, 816]
	str	w20, [x19, 820]
	str	x19, [x19, 840]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L669:
	strb	w4, [x19, 752]
	str	x19, [x19, 792]
	ldrb	w5, [x3, 4]
	strb	w5, [x19, 753]
	ldrb	w5, [x3, 5]
	strb	w5, [x19, 754]
	ldr	w5, [x3, 692]
	str	w5, [x19, 764]
	ldr	w6, [x3, 700]
	str	w6, [x19, 772]
	ldr	w5, [x3, 708]
	str	w5, [x19, 768]
	str	wzr, [x19, 680]
	ldrb	w7, [x3, 1]
	cbz	w7, .L694
	ldr	w4, [x19, 816]
	orr	w0, w0, 1
	strb	w2, [x19, 1]
	mov	w2, 0
	add	w5, w5, w4
	str	w5, [x19, 688]
	str	w5, [x19, 720]
	ldrb	w3, [x3, 7]
	cmp	w3, 1
	csel	w0, w0, w2, eq
	strb	w0, [x19, 3]
	ldr	x0, [x1, 2624]
	cmn	x0, #1
	beq	.L674
	ldr	x2, [x19, 600]
	cmn	x2, #1
	beq	.L695
.L674:
	ldr	w2, [x19, 820]
	mov	x0, x19
	cmp	w2, w6
	csel	w6, w2, w6, cs
	str	w6, [x19, 684]
	ldr	w1, [x1, 2708]
	str	w1, [x19, 672]
	bl	CombineFldsToFrm
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L692:
	strb	w4, [x19, 1]
	mov	x2, 640
	str	w5, [x19, 688]
	add	x1, x1, 2040
	str	w5, [x19, 720]
	add	x0, x19, 16
	ldrb	w3, [x3, 7]
	cmp	w3, 1
	csel	w7, wzr, w4, ne
	strb	w7, [x19, 3]
	bl	memcpy
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L694:
	strb	w4, [x19, 1]
	mov	x2, 640
	str	w5, [x19, 688]
	add	x1, x1, 2040
	str	w5, [x19, 720]
	add	x0, x19, 16
	ldrb	w3, [x3, 7]
	cmp	w3, 1
	cset	w3, eq
	strb	w3, [x19, 3]
	bl	memcpy
	b	.L665
	.p2align 3
.L695:
	str	x0, [x19, 600]
	b	.L674
	.p2align 3
.L693:
	str	x0, [x19, 600]
	ldr	w2, [x19, 772]
	b	.L696
	.size	UpdateCurrFrameInfo, .-UpdateCurrFrameInfo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SimpleSlideDPB
	.type	SimpleSlideDPB, %function
SimpleSlideDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 24576
	ldr	w1, [x0, 3708]
	ldr	w0, [x0, 3704]
	cmp	w1, w0
	bcs	.L703
.L698:
	add	x19, x19, 61440
	ldr	w0, [x19, 2704]
	strb	wzr, [x19, 2028]
	cbz	w0, .L697
	mov	w0, 1
	strb	w0, [x19, 2029]
.L697:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L703:
	ldr	x1, [x19, 27896]
	mov	x0, x19
	bl	UnMarkFrameStoreRef
	mov	w1, 0
	mov	x0, x19
	bl	RemoveFrameStoreOutDPB
	b	.L698
	.size	SimpleSlideDPB, .-SimpleSlideDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_ArrangeVahbMem
	.type	H264_ArrangeVahbMem, %function
H264_ArrangeVahbMem:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w20, w2
	mov	w19, w1
	mov	w22, w4
	bl	_mcount
	mov	w0, 8160
	sub	w2, w20, #32
	sub	w1, w19, #32
	cmp	w2, w0
	ccmp	w1, w0, 2, ls
	bhi	.L705
	ldr	x3, .LC85
	mov	x2, 20
	mov	w1, 0
	add	x0, x29, 56
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x0, [x21]
	stp	w19, w20, [x29, 60]
	stp	w19, w20, [x29, 68]
	ldr	w0, [x0, 28]
	cmp	w0, 24
	beq	.L721
	add	x0, x21, 24576
	mov	w1, 5
	sxtb	w4, w22
	strb	w1, [x29, 58]
	ldr	w0, [x0, 3704]
	add	w0, w0, 1
	strb	w0, [x29, 57]
.L714:
	mov	w0, 63
	strb	w4, [x29, 59]
	cmp	w19, w0
	ccmp	w20, w0, 0, hi
	bls	.L722
	add	x19, x21, 65536
	add	x1, x29, 56
	ldr	w0, [x19, 1980]
	bl	FSP_ConfigInstance
	cbnz	w0, .L710
	ldr	x1, [x21]
	add	x3, x29, 52
	ldr	w0, [x19, 1980]
	ldr	w2, [x1, 20]
	ldr	w1, [x1, 16]
	bl	FSP_ConfigFrameBuf
	cmp	w0, 2
	mov	w1, w0
	beq	.L723
	mov	w0, 1
	cbnz	w1, .L724
.L715:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L721:
	mov	w1, 1
	mov	w0, 5
	strb	w1, [x29, 57]
	mov	w4, 1
	strb	w0, [x29, 58]
	b	.L714
	.p2align 3
.L705:
	ldr	x1, .LC87
.L718:
	mov	w3, w20
	mov	w2, w19
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
.L725:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L722:
	ldr	x1, .LC89
	b	.L718
	.p2align 3
.L710:
	ldr	x1, .LC93
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L715
	.p2align 3
.L724:
	ldr	x1, .LC91
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L725
.L723:
	add	x0, x21, 8
	bl	ResetVoQueue
	mov	w0, -20
	b	.L725
	.size	H264_ArrangeVahbMem, .-H264_ArrangeVahbMem
	.align	3
.LC85:
	.xword	vfmw_Osal_Func_Ptr_S
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
.LC93:
	.xword	.LC92
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	RepairList
	.type	RepairList, %function
RepairList:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L758
	add	x7, x19, 20480
	ldrb	w2, [x7, 1584]
	cmp	w2, 1
	beq	.L746
	cbz	w2, .L731
	cmp	w2, 2
	mov	w0, 0
	bne	.L759
.L749:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L759:
	ldr	x1, .LC97
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	ClearCurrSlice
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L731:
	mov	w11, 1
.L730:
	add	x6, x19, 28672
	add	x7, x7, 1624
	add	x6, x6, 24
	mov	x8, 0
	mov	x9, 0
	mov	w2, 0
	mov	w13, 1
	add	x12, x19, 61440
	.p2align 2
.L742:
	ldr	w0, [x7]
	cbz	w0, .L732
	ldr	x1, [x6]
	cbnz	x1, .L760
	sub	w3, w0, #1
	add	x10, x8, 3588
	add	x0, x6, 8
	add	x5, x10, x3, uxtw
	add	x5, x19, x5, lsl 3
	b	.L735
	.p2align 3
.L736:
	ldr	x4, [x0], 8
	cbnz	x4, .L733
.L735:
	cmp	x0, x5
	bne	.L736
	ldr	x0, [x19]
	ldr	w0, [x0, 24]
	cmp	w0, 2
	bne	.L761
	ldr	x9, [x12, 2680]
	add	x9, x9, 704
.L745:
	add	x3, x10, x3, uxtw
	mov	x0, x6
	add	x3, x19, x3, lsl 3
	cbz	x1, .L762
	.p2align 2
.L738:
	add	x0, x0, 8
	cmp	x0, x3
	beq	.L739
.L763:
	ldr	x1, [x0]
	cbnz	x1, .L738
.L762:
	str	x9, [x0]
	add	x0, x0, 8
	cmp	x0, x3
	bne	.L763
	.p2align 2
.L739:
	add	w2, w2, 1
	add	x7, x7, 4
	cmp	w2, w11
	add	x6, x6, 264
	add	x8, x8, 33
	bcc	.L742
.L765:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L732:
	ldr	x0, [x19]
	ldr	w0, [x0, 24]
	cmp	w0, 2
	bne	.L764
	str	w13, [x7]
	add	w2, w2, 1
	cmp	w2, w11
	add	x7, x7, 4
	ldr	x0, [x12, 2680]
	add	x8, x8, 33
	add	x0, x0, 704
	str	x0, [x6]
	add	x6, x6, 264
	bcc	.L742
	b	.L765
.L760:
	sub	w3, w0, #1
	mov	x4, x1
	add	x10, x8, 3588
	.p2align 2
.L733:
	mov	x9, x4
	b	.L745
.L746:
	mov	w11, 2
	b	.L730
.L764:
	ldr	x1, .LC101
	mov	w3, 0
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	ClearCurrSlice
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L761:
	ldr	x1, .LC99
	mov	w3, 0
	mov	x2, x9
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	ClearCurrSlice
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L758:
	ldr	x2, .LC94
	mov	w3, 4315
	ldr	x1, .LC95
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L749
	.size	RepairList, .-RepairList
	.align	3
.LC94:
	.xword	.LC30
	.align	3
.LC95:
	.xword	.LC32
	.align	3
.LC97:
	.xword	.LC96
	.align	3
.LC99:
	.xword	.LC98
	.align	3
.LC101:
	.xword	.LC100
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetShortTermPicPoint
	.type	GetShortTermPicPoint, %function
GetShortTermPicPoint:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	x0, x20, 20480
	mov	w5, 0
	ldrb	w1, [x0, 1585]
	cbz	w1, .L767
	ldrb	w0, [x0, 1586]
	mov	w5, 2
	cmp	w0, wzr
	csinc	w5, w5, wzr, ne
.L767:
	add	x0, x20, 24576
	ldr	w2, [x0, 3712]
	cbz	w2, .L775
	sub	w2, w2, #1
	add	x0, x0, 3448
	add	x2, x2, 3504
	add	x4, x20, x2, lsl 3
	b	.L772
	.p2align 3
.L785:
	cmp	w3, 3
	beq	.L784
.L770:
	add	x0, x0, 8
	cmp	x0, x4
	beq	.L775
.L772:
	ldr	x2, [x0]
	ldrb	w3, [x2, 2]
	cbz	w5, .L785
	tbz	x3, 0, .L771
	ldr	w6, [x2, 752]
	and	w6, w6, 16776960
	cmp	w6, 65536
	beq	.L786
.L771:
	tbz	x3, 1, .L770
	ldr	w3, [x2, 800]
	and	w3, w3, 16776960
	cmp	w3, 65536
	bne	.L770
	ldr	w1, [x2, 808]
	cmp	w19, w1
	bne	.L770
	add	x0, x2, 800
	b	.L768
	.p2align 3
.L786:
	ldr	w1, [x2, 760]
	cmp	w1, w19
	bne	.L771
	add	x0, x2, 752
	b	.L768
	.p2align 3
.L784:
	ldr	w3, [x2, 704]
	and	w3, w3, 16776960
	cmp	w3, 65536
	bne	.L770
	ldr	w1, [x2, 712]
	cmp	w19, w1
	bne	.L770
	add	x0, x2, 704
	b	.L768
	.p2align 3
.L775:
	mov	x0, 0
.L768:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetShortTermPicPoint, .-GetShortTermPicPoint
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetLongTermPicPoint
	.type	GetLongTermPicPoint, %function
GetLongTermPicPoint:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	x0, x20, 20480
	mov	w5, 0
	ldrb	w1, [x0, 1585]
	cbz	w1, .L788
	ldrb	w0, [x0, 1586]
	mov	w5, 2
	cmp	w0, wzr
	csinc	w5, w5, wzr, ne
.L788:
	add	x0, x20, 24576
	ldr	w2, [x0, 3716]
	cbz	w2, .L796
	sub	w2, w2, #1
	add	x0, x0, 3576
	add	x2, x2, 3520
	add	x4, x20, x2, lsl 3
	b	.L793
	.p2align 3
.L806:
	cmp	w3, 3
	beq	.L805
.L791:
	add	x0, x0, 8
	cmp	x0, x4
	beq	.L796
.L793:
	ldr	x2, [x0]
	ldrb	w3, [x2, 2]
	cbz	w5, .L806
	tbz	x3, 0, .L792
	ldr	w6, [x2, 752]
	and	w6, w6, 16776960
	cmp	w6, 256
	beq	.L807
.L792:
	tbz	x3, 1, .L791
	ldr	w3, [x2, 800]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L791
	ldr	w1, [x2, 804]
	cmp	w19, w1
	bne	.L791
	add	x0, x2, 800
	b	.L789
	.p2align 3
.L807:
	ldr	w1, [x2, 756]
	cmp	w1, w19
	bne	.L792
	add	x0, x2, 752
	b	.L789
	.p2align 3
.L805:
	ldr	w3, [x2, 704]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L791
	ldr	w1, [x2, 708]
	cmp	w19, w1
	bne	.L791
	add	x0, x2, 704
	b	.L789
	.p2align 3
.L796:
	mov	x0, 0
.L789:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetLongTermPicPoint, .-GetLongTermPicPoint
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReorderSTList
	.type	ReorderSTList, %function
ReorderSTList:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x23, x0
	mov	x0, x30
	mov	w22, w3
	mov	x21, x4
	mov	w20, w2
	mov	x19, x1
	bl	_mcount
	mov	w1, w22
	mov	x0, x23
	bl	GetShortTermPicPoint
	ldr	w5, [x21]
	add	w2, w20, 1
	cmp	w2, w5
	ble	.L809
	mov	w1, w2
	.p2align 2
.L810:
	add	x5, x19, x1, sxtw 3
	ldr	x5, [x5, -8]
	str	x5, [x19, w1, sxtw 3]
	sub	w1, w1, #1
	ldr	w5, [x21]
	cmp	w5, w1
	blt	.L810
.L809:
	add	w1, w5, 1
	str	w1, [x21]
	str	x0, [x19, w5, sxtw 3]
	ldr	w0, [x21]
	cmp	w2, w0
	mov	w4, w0
	blt	.L808
	.p2align 2
.L818:
	ldr	x1, [x19, w0, sxtw 3]
	add	w0, w0, 1
	cbz	x1, .L812
	ldrb	w5, [x1, 1]
	cbnz	w5, .L813
	ldr	w5, [x1, 8]
	cmp	w22, w5
	beq	.L812
.L813:
	str	x1, [x19, w4, sxtw 3]
	add	w4, w4, 1
.L812:
	cmp	w2, w0
	bge	.L818
.L808:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	ReorderSTList, .-ReorderSTList
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReorderLTList
	.type	ReorderLTList, %function
ReorderLTList:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x23, x0
	mov	x0, x30
	mov	w22, w3
	mov	x21, x4
	mov	w20, w2
	mov	x19, x1
	bl	_mcount
	mov	w1, w22
	mov	x0, x23
	bl	GetLongTermPicPoint
	ldr	w5, [x21]
	add	w2, w20, 1
	cmp	w2, w5
	ble	.L823
	mov	w1, w2
	.p2align 2
.L824:
	add	x5, x19, x1, sxtw 3
	ldr	x5, [x5, -8]
	str	x5, [x19, w1, sxtw 3]
	sub	w1, w1, #1
	ldr	w5, [x21]
	cmp	w5, w1
	blt	.L824
.L823:
	add	w1, w5, 1
	str	w1, [x21]
	str	x0, [x19, w5, sxtw 3]
	ldr	w0, [x21]
	cmp	w2, w0
	mov	w4, w0
	blt	.L822
	.p2align 2
.L834:
	ldr	x1, [x19, w0, sxtw 3]
	add	w0, w0, 1
	cbz	x1, .L826
	ldrb	w5, [x1, 1]
	cbz	w5, .L827
	ldr	w5, [x1, 4]
	cmp	w22, w5
	beq	.L826
.L827:
	str	x1, [x19, w4, sxtw 3]
	add	w4, w4, 1
.L826:
	cmp	w2, w0
	bge	.L834
.L822:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	ReorderLTList, .-ReorderLTList
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReorderRefPiclist
	.type	ReorderRefPiclist, %function
ReorderRefPiclist:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	x22, x1
	mov	w21, w3
	mov	x25, x4
	mov	x28, x5
	str	x6, [x29, 104]
	bl	_mcount
	add	x0, x20, 20480
	str	wzr, [x29, 124]
	ldrb	w1, [x0, 1585]
	ldr	w2, [x0, 1592]
	cbz	w1, .L840
	mov	w1, 2208
	ldr	w26, [x0, 1600]
	ldr	x3, [x20, 14968]
	mov	w23, 2
	umull	x0, w2, w1
	ldr	x2, [x20, 14960]
	lsl	w26, w26, 1
	add	x1, x3, x0
	mov	w0, 4000
	add	w26, w26, 1
	ldr	w1, [x1, 28]
	umull	x0, w1, w0
	add	x0, x2, x0
	ldr	w0, [x0, 2196]
	add	w0, w0, 4
	lsl	w23, w23, w0
.L850:
	cmn	w21, #2
	beq	.L839
	ldr	w3, [x25]
	cmp	w3, 3
	beq	.L839
	add	w24, w21, 1
	mov	w27, w26
	lsl	x24, x24, 2
	mov	x19, 0
	b	.L843
	.p2align 3
.L844:
	ldr	x3, [x29, 104]
	ldr	w3, [x3, x19]
	bl	ReorderLTList
	cmp	x24, x19
	add	x19, x19, 4
	beq	.L839
.L849:
	ldr	w3, [x25, x19]
	cmp	w3, 3
	beq	.L839
.L843:
	cmp	w3, 1
	add	x4, x29, 124
	mov	w2, w21
	mov	x1, x22
	mov	x0, x20
	bhi	.L844
	ldr	w0, [x28, x19]
	cbnz	w3, .L845
	mvn	w0, w0
	add	w27, w27, w0
	add	w0, w27, w23
	cmp	w27, wzr
	csel	w27, w0, w27, lt
.L846:
	cmp	w26, w27
	sub	w3, w27, w23
	csel	w3, w3, w27, lt
	add	x4, x29, 124
	mov	w2, w21
	mov	x1, x22
	mov	x0, x20
	bl	ReorderSTList
	cmp	x24, x19
	add	x19, x19, 4
	bne	.L849
.L839:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L845:
	add	w0, w0, 1
	add	w27, w27, w0
	cmp	w23, w27
	sub	w0, w27, w23
	csel	w27, w0, w27, le
	b	.L846
	.p2align 3
.L840:
	mov	w1, 2208
	ldr	w26, [x0, 1600]
	ldr	x3, [x20, 14968]
	mov	w23, 1
	umull	x0, w2, w1
	ldr	x2, [x20, 14960]
	add	x1, x3, x0
	mov	w0, 4000
	ldr	w1, [x1, 28]
	umull	x0, w1, w0
	add	x0, x2, x0
	ldr	w0, [x0, 2196]
	add	w0, w0, 4
	lsl	w23, w23, w0
	b	.L850
	.size	ReorderRefPiclist, .-ReorderRefPiclist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReorderListX
	.type	ReorderListX, %function
ReorderListX:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 20480
	bl	_mcount
	ldrb	w0, [x19, 1584]
	cmp	w0, 2
	beq	.L858
	ldrb	w1, [x19, 796]
	cbnz	w1, .L870
.L861:
	ldr	w1, [x19, 1636]
	cmp	w0, 1
	add	w0, w1, 1
	str	w0, [x19, 1624]
	bne	.L858
	ldrb	w0, [x19, 797]
	cbnz	w0, .L871
.L863:
	ldr	w0, [x19, 1640]
	add	w0, w0, 1
	str	w0, [x19, 1628]
.L858:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L870:
	add	x1, x20, 28672
	ldr	w3, [x19, 1636]
	mov	x0, x20
	add	x6, x19, 1328
	add	x5, x19, 1064
	add	x4, x19, 800
	add	x2, x19, 1624
	add	x1, x1, 24
	bl	ReorderRefPiclist
	ldrb	w0, [x19, 1584]
	b	.L861
	.p2align 3
.L871:
	add	x1, x20, 28672
	ldr	w3, [x19, 1640]
	add	x6, x19, 1456
	add	x5, x19, 1196
	add	x4, x19, 932
	add	x2, x19, 1628
	add	x1, x1, 288
	mov	x0, x20
	bl	ReorderRefPiclist
	b	.L863
	.size	ReorderListX, .-ReorderListX
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GenPiclistfromFrmlist
	.type	GenPiclistfromFrmlist, %function
GenPiclistfromFrmlist:
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
	cbnz	w23, .L894
	cmp	w21, 1
	ldr	x23, .LC103
	beq	.L934
.L874:
	cmp	w21, 2
	bne	.L883
	mov	w21, 0
	mov	w20, 0
	.p2align 2
.L885:
	cmp	w20, w22
	ccmp	w21, w22, 0, cs
	bcs	.L883
.L935:
	cmp	w21, w22
	bcc	.L918
	b	.L890
	.p2align 3
.L886:
	add	w21, w21, 1
	cmp	w22, w21
	bls	.L890
.L918:
	ldr	x0, [x19, w21, uxtw 3]
	add	x26, x19, x21, uxtw 3
	ldrb	w1, [x0, 1]
	tbz	x1, 1, .L886
	add	x0, x0, 800
	blr	x23
	cbz	w0, .L886
	ldr	w1, [x24]
	add	w21, w21, 1
	ldr	x0, [x26]
	add	x0, x0, 800
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
.L890:
	cmp	w20, w22
	bcc	.L917
	b	.L885
	.p2align 3
.L891:
	add	w20, w20, 1
	cmp	w22, w20
	bls	.L885
.L917:
	ldr	x0, [x19, w20, uxtw 3]
	add	x26, x19, x20, uxtw 3
	ldrb	w1, [x0, 1]
	tbz	x1, 0, .L891
	add	x0, x0, 752
	blr	x23
	cbz	w0, .L891
	ldr	w1, [x24]
	add	w20, w20, 1
	ldr	x0, [x26]
	cmp	w20, w22
	ccmp	w21, w22, 0, cs
	add	x0, x0, 752
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
	bcc	.L935
.L883:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L894:
	cmp	w21, 1
	ldr	x23, .LC102
	bne	.L874
.L934:
	mov	w21, 0
	mov	w20, 0
	.p2align 2
.L875:
	cmp	w20, w22
	ccmp	w21, w22, 0, cs
	bcs	.L883
	cmp	w20, w22
	bcc	.L916
	b	.L933
	.p2align 3
.L876:
	add	w20, w20, 1
	cmp	w20, w22
	bcs	.L933
.L916:
	ldr	x0, [x19, w20, uxtw 3]
	add	x26, x19, x20, uxtw 3
	ldrb	w1, [x0, 1]
	tbz	x1, 0, .L876
	add	x0, x0, 752
	blr	x23
	cbz	w0, .L876
	ldr	w1, [x24]
	add	w20, w20, 1
	ldr	x0, [x26]
	add	x0, x0, 752
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
	.p2align 2
.L933:
	cmp	w21, w22
	bcs	.L875
	ldr	x0, [x19, w21, uxtw 3]
	add	x26, x19, x21, uxtw 3
	ldrb	w1, [x0, 1]
	tbnz	x1, 1, .L936
.L881:
	add	w21, w21, 1
	b	.L933
	.p2align 3
.L936:
	add	x0, x0, 800
	blr	x23
	cbz	w0, .L881
	ldr	w1, [x24]
	add	w21, w21, 1
	ldr	x0, [x26]
	add	x0, x0, 800
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
	b	.L875
	.size	GenPiclistfromFrmlist, .-GenPiclistfromFrmlist
	.align	3
.LC102:
	.xword	IsLTRefFlg
	.align	3
.LC103:
	.xword	IsSTRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InitListX
	.type	InitListX, %function
InitListX:
	stp	x29, x30, [sp, -480]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1058
	add	x20, x19, 20480
	add	x22, x19, 61440
	ldrb	w0, [x20, 1584]
	cbz	w0, .L1059
	ldrb	w0, [x22, 2027]
	add	x21, x19, 24576
	cbz	w0, .L960
	ldr	w0, [x21, 3712]
	cbz	w0, .L1060
	sub	w3, w0, #1
	mov	w23, 0
	add	x3, x3, 3504
	add	x0, x21, 3448
	add	x3, x19, x3, lsl 3
	.p2align 2
.L979:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 1]
	cbz	w2, .L978
	ldr	w4, [x1, 672]
	add	x2, x29, 480
	ldr	w5, [x22, 2708]
	add	x2, x2, x23, uxtw 3
	sub	x2, x2, #4096
	cmp	w5, w4
	blt	.L978
	add	w23, w23, 1
	str	x1, [x2, 3712]
.L978:
	cmp	x0, x3
	bne	.L979
	add	x26, x29, 96
	ldr	x3, .LC114
	mov	w2, 8
	mov	w1, w23
	mov	x0, x26
	bl	qsort
	ldr	w24, [x21, 3712]
	cbz	w24, .L980
.L1004:
	sub	w1, w24, #1
	add	x0, x21, 3448
	add	x1, x1, 3504
	mov	w25, w23
	add	x1, x19, x1, lsl 3
	.p2align 2
.L982:
	ldr	x2, [x0]
	add	x0, x0, 8
	ldrb	w3, [x2, 1]
	cbz	w3, .L981
	ldr	w4, [x2, 672]
	add	x3, x29, 480
	ldr	w5, [x22, 2708]
	add	x3, x3, x25, uxtw 3
	sub	x3, x3, #4096
	cmp	w5, w4
	bge	.L981
	add	w25, w25, 1
	str	x2, [x3, 3712]
.L981:
	cmp	x0, x1
	bne	.L982
	sub	w24, w25, w23
	ldr	x3, .LC115
	mov	w2, 8
	mov	w1, w24
	add	x0, x26, x23, uxtw 3
	bl	qsort
	cbz	w23, .L983
.L1003:
	mov	x0, 0
	.p2align 2
.L984:
	add	w1, w24, w0
	add	x3, x29, 480
	ldr	x2, [x26, x0, lsl 3]
	add	x0, x0, 1
	add	x1, x3, x1, lsl 3
	cmp	w23, w0
	str	x2, [x1, -256]
	bhi	.L984
.L983:
	cmp	w25, w23
	bls	.L985
	mov	w0, w23
	.p2align 2
.L986:
	add	x2, x29, 480
	sub	w1, w0, w23
	add	x2, x2, x0, uxtw 3
	add	x3, x29, 480
	sub	x2, x2, #4096
	add	x1, x3, x1, lsl 3
	add	w0, w0, 1
	cmp	w25, w0
	ldr	x2, [x2, 3712]
	str	x2, [x1, -256]
	bne	.L986
.L985:
	str	wzr, [x20, 1624]
	add	x23, x19, 28672
	str	wzr, [x20, 1628]
	add	x24, x23, 24
	add	x27, x20, 1624
	mov	x1, x26
	ldrb	w0, [x22, 2027]
	mov	w2, w25
	mov	w5, 0
	mov	x4, x27
	mov	x3, x24
	add	x23, x23, 288
	add	x26, x20, 1628
	bl	GenPiclistfromFrmlist
	ldrb	w0, [x22, 2027]
	mov	w2, w25
	mov	w5, 0
	mov	x4, x26
	mov	x3, x23
	add	x1, x29, 224
	add	x25, x29, 352
	bl	GenPiclistfromFrmlist
	ldr	w28, [x21, 3716]
	cbz	w28, .L987
	add	x21, x21, 3576
	mov	x0, 0
	add	x25, x29, 352
	.p2align 2
.L988:
	ldr	x1, [x21], 8
	str	x1, [x25, x0, lsl 3]
	add	x0, x0, 1
	cmp	w28, w0
	bhi	.L988
.L987:
	ldr	x3, .LC109
	mov	w2, 8
	mov	w1, w28
	mov	x0, x25
	bl	qsort
	ldrb	w0, [x22, 2027]
	mov	w5, 1
	mov	x4, x27
	mov	x3, x24
	mov	w2, w28
	mov	x1, x25
	bl	GenPiclistfromFrmlist
	ldrb	w0, [x22, 2027]
	mov	x4, x26
	mov	x3, x23
	mov	x1, x25
	mov	w5, 1
	mov	w2, w28
	bl	GenPiclistfromFrmlist
	ldr	w3, [x20, 1624]
	ldr	w4, [x20, 1628]
	cmp	w4, w3
	cset	w1, eq
.L977:
	cmp	w3, 1
	cset	w0, hi
	tst	w1, w0
	beq	.L989
	cbz	w3, .L990
	ldr	x6, [x19, 28696]
	ldr	x0, [x19, 28960]
	cmp	x6, x0
	bne	.L989
	sub	w0, w3, #1
	mov	x2, x19
	add	x0, x19, x0, lsl 3
.L992:
	cmp	x0, x2
	beq	.L994
	ldr	x5, [x2, 28704]
	add	x2, x2, 8
	ldr	x1, [x2, 28960]
	cmp	x5, x1
	beq	.L992
	.p2align 2
.L989:
	ldr	x0, [x19, 22104]
	cbz	x0, .L1061
	ldr	w0, [x20, 1636]
	ldr	w1, [x20, 1640]
	add	w0, w0, 1
	add	w1, w1, 1
	cmp	w0, w3
	csel	w0, w0, w3, ls
	cmp	w1, w4
	csel	w1, w1, w4, ls
	str	w0, [x20, 1624]
	cmp	w0, 32
	str	w1, [x20, 1628]
	bhi	.L1000
	.p2align 2
.L999:
	add	x2, x19, x0, uxtw 3
	add	w0, w0, 1
	cmp	w0, 33
	str	xzr, [x2, 28696]
	bne	.L999
.L1000:
	cmp	w1, 32
	bhi	.L998
	.p2align 2
.L1001:
	add	x0, x19, x1, uxtw 3
	add	w1, w1, 1
	cmp	w1, 33
	str	xzr, [x0, 28960]
	bne	.L1001
.L998:
	mov	w0, 0
.L1049:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 480
	ret
	.p2align 3
.L1059:
	ldrb	w0, [x22, 2027]
	add	x21, x19, 24576
	cbz	w0, .L941
	ldr	w0, [x21, 3712]
	mov	w23, 0
	cbz	w0, .L943
	sub	w4, w0, #1
	mov	w23, 0
	add	x4, x4, 3504
	add	x0, x21, 3448
	add	x4, x19, x4, lsl 3
	.p2align 2
.L952:
	ldr	x2, [x0]
	add	x1, x29, 480
	add	x1, x1, x23, uxtw 3
	add	x0, x0, 8
	sub	x1, x1, #4096
	cmp	x4, x0
	ldrb	w3, [x2, 2]
	cbz	w3, .L951
	add	w23, w23, 1
	str	x2, [x1, 3712]
.L951:
	bne	.L952
.L943:
	ldr	x3, .LC108
	mov	w1, w23
	mov	w2, 8
	add	x0, x29, 96
	add	x24, x19, 28672
	add	x26, x20, 1624
	bl	qsort
	str	wzr, [x20, 1624]
	add	x24, x24, 24
	mov	w2, w23
	ldrb	w0, [x22, 2027]
	mov	w5, 0
	mov	x4, x26
	add	x1, x29, 96
	mov	x3, x24
	add	x25, x29, 352
	bl	GenPiclistfromFrmlist
	ldr	w23, [x21, 3716]
	cbz	w23, .L953
	add	x21, x21, 3576
	mov	x0, 0
	add	x25, x29, 352
	.p2align 2
.L954:
	ldr	x1, [x21], 8
	str	x1, [x25, x0, lsl 3]
	add	x0, x0, 1
	cmp	w23, w0
	bhi	.L954
.L953:
	ldr	x3, .LC109
	mov	w2, 8
	mov	w1, w23
	mov	x0, x25
	bl	qsort
	ldrb	w0, [x22, 2027]
	mov	w2, w23
	mov	w5, 1
	mov	x4, x26
	mov	x3, x24
	mov	x1, x25
	bl	GenPiclistfromFrmlist
	ldr	w2, [x20, 1624]
.L950:
	str	wzr, [x20, 1628]
	cbnz	w2, .L955
	ldr	x0, [x19]
	ldr	w0, [x0, 24]
	cmp	w0, 2
	bne	.L956
	ldrb	w0, [x22, 2027]
	cbz	w0, .L1062
	cmp	w0, 1
	ldr	x0, [x22, 2680]
	beq	.L1063
	add	x0, x0, 800
	mov	w2, 1
	str	x0, [x19, 28696]
	.p2align 2
.L955:
	ldr	w0, [x20, 1636]
	mov	w1, 0
	str	wzr, [x20, 1628]
	add	w0, w0, 1
	cmp	w0, w2
	csel	w0, w0, w2, ls
	str	w0, [x20, 1624]
	cmp	w0, 32
	bls	.L999
	b	.L1001
	.p2align 3
.L941:
	ldr	w0, [x21, 3712]
	cbz	w0, .L1006
	sub	w3, w0, #1
	mov	w23, 0
	add	x3, x3, 3504
	add	x0, x21, 3448
	add	x3, x19, x3, lsl 3
	b	.L946
	.p2align 3
.L945:
	cmp	x3, x0
	beq	.L944
.L946:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 2]
	cmp	w2, 3
	bne	.L945
	ldr	w2, [x1, 704]
	and	w2, w2, 16776960
	cmp	w2, 65536
	bne	.L945
	add	x2, x19, x23, uxtw 3
	add	x1, x1, 704
	cmp	x3, x0
	add	w23, w23, 1
	str	x1, [x2, 28696]
	bne	.L946
	.p2align 2
.L944:
	add	x0, x19, 28672
	ldr	x3, .LC106
	mov	w1, w23
	mov	w2, 8
	add	x0, x0, 24
	bl	qsort
	str	w23, [x20, 1624]
	ldr	w1, [x21, 3716]
	cbz	w1, .L1007
	sub	w3, w1, #1
	add	x0, x21, 3576
	add	x3, x3, 3520
	mov	w21, w23
	add	x3, x19, x3, lsl 3
	b	.L949
	.p2align 3
.L948:
	cmp	x0, x3
	beq	.L1064
.L949:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 2]
	cmp	w2, 3
	bne	.L948
	ldr	w2, [x1, 704]
	and	w2, w2, 16776960
	cmp	w2, 256
	bne	.L948
	add	x2, x19, x21, uxtw 3
	add	x1, x1, 704
	cmp	x0, x3
	add	w21, w21, 1
	str	x1, [x2, 28696]
	bne	.L949
	.p2align 2
.L1064:
	sub	w1, w21, w23
.L947:
	uxtw	x0, w23
	ldr	x3, .LC107
	add	x0, x0, 3586
	mov	w2, 8
	add	x0, x19, x0, lsl 3
	add	x0, x0, 8
	bl	qsort
	str	w21, [x20, 1624]
	mov	w2, w21
	b	.L950
	.p2align 3
.L960:
	ldr	w0, [x21, 3712]
	cbz	w0, .L1008
	sub	w3, w0, #1
	mov	w23, 0
	add	x3, x3, 3504
	add	x0, x21, 3448
	add	x3, x19, x3, lsl 3
	b	.L965
	.p2align 3
.L964:
	cmp	x0, x3
	beq	.L963
.L965:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 2]
	cmp	w2, 3
	bne	.L964
	ldr	w2, [x1, 716]
	add	x5, x19, x23, uxtw 3
	ldr	w4, [x22, 2712]
	add	x1, x1, 704
	cmp	w4, w2
	blt	.L964
	str	x1, [x5, 28696]
	cmp	x0, x3
	add	w23, w23, 1
	bne	.L965
	.p2align 2
.L963:
	add	x25, x19, 28672
	ldr	x3, .LC112
	mov	w2, 8
	mov	w1, w23
	add	x0, x25, 24
	bl	qsort
	ldr	w24, [x21, 3712]
	cbz	w24, .L966
	sub	w3, w24, #1
	add	x0, x21, 3448
	add	x3, x3, 3504
	mov	w26, w23
	add	x3, x19, x3, lsl 3
	b	.L968
	.p2align 3
.L967:
	cmp	x0, x3
	beq	.L1065
.L968:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 2]
	cmp	w2, 3
	bne	.L967
	ldr	w2, [x1, 716]
	add	x5, x19, x26, uxtw 3
	ldr	w4, [x22, 2712]
	add	x1, x1, 704
	cmp	w4, w2
	bge	.L967
	str	x1, [x5, 28696]
	cmp	x0, x3
	add	w26, w26, 1
	bne	.L968
	.p2align 2
.L1065:
	uxtw	x0, w23
	uxtw	x22, w26
	add	x0, x0, 3586
	sub	w24, w26, w23
	ldr	x3, .LC113
	add	x22, x22, 3586
	add	x0, x19, x0, lsl 3
	mov	w2, 8
	add	x0, x0, 8
	mov	w1, w24
	add	x22, x19, x22, lsl 3
	bl	qsort
	add	x22, x22, 8
	cbz	w23, .L970
.L1002:
	add	x25, x25, 24
	mov	w0, 0
	.p2align 2
.L971:
	add	w1, w24, w0
	ldr	x2, [x25], 8
	add	w0, w0, 1
	add	x1, x19, x1, lsl 3
	cmp	w0, w23
	str	x2, [x1, 28960]
	bcc	.L971
.L970:
	cmp	w26, w23
	bls	.L972
	mov	w0, w23
	.p2align 2
.L973:
	sub	w1, w0, w23
	add	x2, x19, x0, uxtw 3
	add	w0, w0, 1
	add	x1, x19, x1, lsl 3
	cmp	w0, w26
	ldr	x2, [x2, 28696]
	str	x2, [x1, 28960]
	bne	.L973
.L972:
	str	w26, [x20, 1624]
	str	w26, [x20, 1628]
	ldr	w1, [x21, 3716]
	cbz	w1, .L1009
	sub	w3, w1, #1
	add	x0, x21, 3576
	add	x3, x3, 3520
	mov	w21, w26
	add	x3, x19, x3, lsl 3
	b	.L976
	.p2align 3
.L975:
	cmp	x3, x0
	beq	.L1066
.L976:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 1]
	cmp	w2, 3
	bne	.L975
	ldrb	w2, [x1, 705]
	cmp	w2, 1
	bne	.L975
	add	x2, x19, x21, uxtw 3
	add	x1, x1, 704
	cmp	x3, x0
	add	w21, w21, 1
	str	x1, [x2, 28696]
	str	x1, [x2, 28960]
	bne	.L976
	.p2align 2
.L1066:
	sub	w1, w21, w26
.L974:
	ldr	x23, .LC107
	mov	w2, 8
	mov	x0, x22
	mov	x3, x23
	bl	qsort
	ldr	w0, [x20, 1624]
	mov	x3, x23
	mov	w2, 8
	sub	w1, w21, w0
	uxtw	x0, w0
	add	x0, x0, 3619
	add	x0, x19, x0, lsl 3
	add	x0, x0, 8
	bl	qsort
	str	w21, [x20, 1624]
	mov	w4, w21
	mov	w3, w21
	mov	w1, 1
	str	w21, [x20, 1628]
	b	.L977
	.p2align 3
.L1062:
	ldr	x0, [x22, 2680]
	mov	w2, 1
	add	x0, x0, 704
	str	x0, [x19, 28696]
	b	.L955
.L990:
	ldr	x6, [x19, 28960]
.L994:
	ldr	x0, [x19, 28968]
	str	x0, [x19, 28960]
	str	x6, [x19, 28968]
	b	.L989
.L1063:
	add	x0, x0, 752
	mov	w2, 1
	str	x0, [x19, 28696]
	b	.L955
.L1060:
	add	x26, x29, 96
	ldr	x3, .LC114
	mov	w2, 8
	mov	w1, 0
	mov	x0, x26
	mov	w23, 0
	bl	qsort
	ldr	w24, [x21, 3712]
	cbnz	w24, .L1004
	ldr	x3, .LC115
	mov	w2, 8
	mov	w1, 0
	mov	x0, x26
	mov	w25, 0
	bl	qsort
	b	.L985
	.p2align 3
.L1006:
	mov	w23, 0
	b	.L944
.L1008:
	mov	w23, 0
	b	.L963
.L1009:
	mov	w21, w26
	b	.L974
.L966:
	uxtw	x22, w23
	ldr	x3, .LC113
	add	x22, x22, 3586
	mov	w2, 8
	mov	w1, 0
	mov	w26, w23
	add	x22, x19, x22, lsl 3
	add	x22, x22, 8
	mov	x0, x22
	bl	qsort
	cbnz	w23, .L1002
	b	.L972
	.p2align 3
.L1007:
	mov	w21, w23
	b	.L947
.L980:
	ldr	x3, .LC115
	mov	w2, 8
	mov	w1, 0
	add	x0, x26, x23, uxtw 3
	mov	w25, w23
	bl	qsort
	cbnz	w23, .L1003
	b	.L985
	.p2align 3
.L956:
	ldr	x1, .LC111
.L1055:
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	ClearCurrSlice
	mov	w0, -1
	b	.L1049
.L1061:
	ldr	x1, .LC117
	b	.L1055
.L1058:
	ldr	x2, .LC104
	mov	w3, 5073
	ldr	x1, .LC105
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1049
	.size	InitListX, .-InitListX
	.align	3
.LC104:
	.xword	.LC30
	.align	3
.LC105:
	.xword	.LC32
	.align	3
.LC106:
	.xword	compare_pic_by_pic_num_desc
	.align	3
.LC107:
	.xword	compare_pic_by_lt_pic_num_asc
	.align	3
.LC108:
	.xword	compare_fs_by_frame_num_desc
	.align	3
.LC109:
	.xword	compare_fs_by_lt_pic_idx_asc
	.align	3
.LC111:
	.xword	.LC110
	.align	3
.LC112:
	.xword	compare_pic_by_poc_desc
	.align	3
.LC113:
	.xword	compare_pic_by_poc_asc
	.align	3
.LC114:
	.xword	compare_fs_by_poc_desc
	.align	3
.LC115:
	.xword	compare_fs_by_poc_asc
	.align	3
.LC117:
	.xword	.LC116
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DumpList
	.type	DumpList, %function
DumpList:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC118
	ldr	w0, [x0]
	tbz	x0, 13, .L1067
	mov	x0, x19
	bl	DumpList.part.10
.L1067:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	DumpList, .-DumpList
	.align	3
.LC118:
	.xword	g_PrintEnable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FindNearestPOCPicId
	.type	FindNearestPOCPicId, %function
FindNearestPOCPicId:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x2, x19, 24576
	ldr	w0, [x2, 3708]
	cbz	w0, .L1076
	add	x1, x19, 61440
	ldr	x3, [x19, 27896]
	cmp	w0, 1
	ldr	w7, [x1, 2708]
	ldr	w1, [x3, 672]
	sub	w1, w7, w1
	sxtw	x1, w1
	eor	x6, x1, x1, asr 63
	sub	x6, x6, x1, asr 63
	bls	.L1077
	sub	w0, w0, #2
	add	x2, x2, 3328
	add	x1, x0, 3489
	mov	w0, 0
	add	x5, x19, x1, lsl 3
	.p2align 2
.L1075:
	ldr	x4, [x2]
	add	x2, x2, 8
	ldr	w1, [x4, 672]
	sub	w1, w7, w1
	sxtw	x1, w1
	eor	x3, x1, x1, asr 63
	sub	x3, x3, x1, asr 63
	cmp	w3, w6
	bge	.L1074
	ldr	w0, [x4, 164]
	mov	w6, w3
.L1074:
	cmp	x2, x5
	bne	.L1075
.L1073:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1077:
	mov	w0, 0
	b	.L1073
.L1076:
	mov	w0, -1
	b	.L1073
	.size	FindNearestPOCPicId, .-FindNearestPOCPicId
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FindMinRefIdx
	.type	FindMinRefIdx, %function
FindMinRefIdx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 20480
	ldrb	w1, [x0, 1584]
	cmp	w1, 2
	beq	.L1079
	add	x1, x19, 61440
	ldrb	w1, [x1, 2027]
	cbnz	w1, .L1109
	add	x6, x19, 24576
	ldr	w5, [x0, 1624]
	add	x6, x6, 3992
	mov	w4, 0
	add	x7, x19, 28672
	.p2align 2
.L1083:
	cbz	w5, .L1087
	add	x1, x7, 24
	mov	w3, 32
	mov	w0, 0
	b	.L1085
	.p2align 3
.L1084:
	add	w0, w0, 1
	cmp	w0, w5
	beq	.L1110
.L1085:
	ldr	x2, [x1]
	add	x1, x1, 8
	ldr	x2, [x2, 40]
	ldr	w2, [x2, 696]
	cmp	w2, w4
	bne	.L1084
	cmp	w3, w0
	csel	w3, w3, w0, ls
	add	w0, w0, 1
	stp	w3, w3, [x6]
	cmp	w0, w5
	bne	.L1085
.L1110:
	cmp	w3, 31
	bhi	.L1087
.L1086:
	add	w4, w4, 1
	add	x6, x6, 8
	cmp	w4, 16
	bne	.L1083
.L1079:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1109:
	ldr	w6, [x0, 1624]
	add	x7, x19, 24576
	add	x7, x7, 3992
	mov	w4, 0
	add	x8, x19, 28672
	cbz	w6, .L1091
	.p2align 2
.L1112:
	add	x2, x8, 24
	mov	w5, 32
	mov	w1, 0
	b	.L1089
	.p2align 3
.L1088:
	add	w1, w1, 1
	cmp	w1, w6
	beq	.L1111
.L1089:
	ldr	x0, [x2]
	add	x2, x2, 8
	ldr	x3, [x0, 40]
	ldrb	w0, [x0]
	cmp	w0, 2
	ldr	w0, [x3, 696]
	cset	w3, eq
	orr	w0, w3, w0, lsl 1
	cmp	w0, w4
	bne	.L1088
	cmp	w5, w1
	csel	w5, w5, w1, ls
	add	w1, w1, 1
	str	w5, [x7]
	cmp	w1, w6
	bne	.L1089
.L1111:
	cmp	w5, 31
	bhi	.L1091
.L1090:
	add	w4, w4, 1
	add	x7, x7, 4
	cmp	w4, 32
	beq	.L1079
	cbnz	w6, .L1112
	.p2align 2
.L1091:
	str	wzr, [x7]
	b	.L1090
	.p2align 3
.L1087:
	stp	wzr, wzr, [x6]
	b	.L1086
	.size	FindMinRefIdx, .-FindMinRefIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UvmosDeleteList
	.type	UvmosDeleteList, %function
UvmosDeleteList:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x6, x19, 20480
	ldrb	w2, [x6, 1584]
	cmp	w2, 1
	beq	.L1115
	cbz	w2, .L1122
	cmp	w2, 2
	mov	w0, 0
	bne	.L1135
.L1117:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1135:
	ldr	x1, .LC119
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	ClearCurrSlice
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L1122:
	mov	w9, 1
.L1116:
	add	x5, x19, 28672
	add	x6, x6, 1624
	add	x5, x5, 24
	mov	x7, 0
	mov	w8, 0
	add	x4, x19, 65536
.L1120:
	ldr	w0, [x6]
	cbz	w0, .L1121
	sub	w0, w0, #1
	add	x3, x7, 3588
	add	x3, x3, x0
	mov	x0, x5
	add	x3, x19, x3, lsl 3
	.p2align 2
.L1119:
	ldr	x1, [x0]
	add	x0, x0, 8
	cbz	x1, .L1118
	ldr	w2, [x1, 16]
	ldr	w1, [x4, 1972]
	cmp	w2, w1
	bls	.L1118
	ldr	x1, [x19]
	ldr	w1, [x1, 684]
	cmp	w1, 1
	beq	.L1136
.L1118:
	cmp	x0, x3
	bne	.L1119
.L1121:
	add	w8, w8, 1
	add	x6, x6, 4
	cmp	w8, w9
	add	x5, x5, 264
	add	x7, x7, 33
	bcc	.L1120
	mov	w0, 0
	b	.L1117
	.p2align 3
.L1136:
	mov	x0, x19
	bl	ClearCurrSlice
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L1115:
	mov	w9, 2
	b	.L1116
	.size	UvmosDeleteList, .-UvmosDeleteList
	.align	3
.LC119:
	.xword	.LC96
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecList
	.type	DecList, %function
DecList:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1161
	add	x1, x19, 24576
	mov	w7, -1
	ldr	w0, [x1, 3708]
	cbz	w0, .L1140
	add	x2, x19, 61440
	ldr	x3, [x19, 27896]
	cmp	w0, 1
	ldr	w6, [x2, 2708]
	ldr	w2, [x3, 672]
	sub	w2, w6, w2
	sxtw	x2, w2
	eor	x5, x2, x2, asr 63
	sub	x5, x5, x2, asr 63
	bls	.L1153
	sub	w4, w0, #2
	add	x1, x1, 3328
	add	x4, x4, 3489
	mov	w7, 0
	add	x4, x19, x4, lsl 3
	.p2align 2
.L1142:
	ldr	x3, [x1]
	add	x1, x1, 8
	ldr	w0, [x3, 672]
	sub	w0, w6, w0
	sxtw	x0, w0
	eor	x2, x0, x0, asr 63
	sub	x2, x2, x0, asr 63
	cmp	w2, w5
	bge	.L1141
	ldr	w7, [x3, 164]
	mov	w5, w2
.L1141:
	cmp	x1, x4
	bne	.L1142
.L1140:
	add	x20, x19, 20480
	mov	w21, -1
	ldrb	w0, [x20, 1584]
	str	w21, [x20, 3208]
	cmp	w0, 2
	str	w7, [x20, 3212]
	beq	.L1162
	mov	x0, x19
	bl	InitListX
	cbnz	w0, .L1163
	ldr	x1, .LC125
	mov	w0, 13
	bl	dprint_vfmw
	ldr	x22, .LC126
	ldr	w0, [x22]
	tbnz	x0, 13, .L1164
.L1145:
	mov	x0, x19
	bl	ReorderListX
	mov	x0, x19
	bl	RepairList
	cbnz	w0, .L1150
	mov	x0, x19
	bl	FindMinRefIdx
	ldr	x0, [x19]
	ldr	w0, [x0, 684]
	cmp	w0, 1
	beq	.L1147
.L1151:
	ldr	x0, [x19, 28696]
	cbz	x0, .L1165
	ldr	x0, [x0, 40]
	ldr	w0, [x0, 164]
.L1149:
	ldr	x1, .LC128
	mov	w21, 0
	str	w0, [x20, 3208]
	mov	w0, 13
	bl	dprint_vfmw
	ldr	w0, [x22]
	tbz	x0, 13, .L1139
	mov	x0, x19
	bl	DumpList.part.10
.L1139:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1162:
	str	wzr, [x20, 1624]
	mov	w21, 0
	str	wzr, [x20, 1628]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1164:
	mov	x0, x19
	bl	DumpList.part.10
	b	.L1145
	.p2align 3
.L1165:
	mov	w0, -1
	b	.L1149
	.p2align 3
.L1147:
	mov	x0, x19
	bl	UvmosDeleteList
	cbz	w0, .L1151
	.p2align 2
.L1150:
	mov	w21, -1
	b	.L1139
.L1153:
	mov	w7, 0
	b	.L1140
.L1163:
	ldr	x1, .LC123
	mov	w0, 13
	bl	dprint_vfmw
	b	.L1139
.L1161:
	ldr	x2, .LC120
	mov	w3, 5591
	ldr	x1, .LC121
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L1139
	.size	DecList, .-DecList
	.align	3
.LC120:
	.xword	.LC30
	.align	3
.LC121:
	.xword	.LC32
	.align	3
.LC123:
	.xword	.LC122
	.align	3
.LC125:
	.xword	.LC124
	.align	3
.LC126:
	.xword	g_PrintEnable
	.align	3
.LC128:
	.xword	.LC127
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	NoPicOut
	.type	NoPicOut, %function
NoPicOut:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 65536
	ldr	w0, [x1, 636]
	cbz	w0, .L1173
	sub	w2, w0, #1
	mov	w4, 856
	mov	x3, 30084
	add	x0, x19, 28672
	add	x0, x0, 556
	umaddl	x3, w2, w4, x3
	add	x3, x19, x3
	b	.L1172
	.p2align 3
.L1180:
	ldrb	w2, [x0]
	cmp	w2, 1
	beq	.L1170
	add	x0, x0, 856
	cmp	x0, x3
	beq	.L1173
.L1172:
	ldr	w2, [x0, 672]
	cmp	w2, 1
	bne	.L1180
.L1170:
	strb	wzr, [x0, -3]
	strb	wzr, [x0, -2]
	add	x0, x0, 856
	cmp	x0, x3
	bne	.L1172
.L1173:
	ldr	w0, [x1, 640]
	cbz	w0, .L1166
	sub	w0, w0, #1
	add	x1, x1, 568
	add	x0, x0, 16384
	add	x0, x0, 143
	add	x0, x19, x0, lsl 2
	.p2align 2
.L1174:
	str	wzr, [x1], 4
	cmp	x1, x0
	bne	.L1174
.L1166:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	NoPicOut, .-NoPicOut
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetBackPicFromVOQueue
	.type	GetBackPicFromVOQueue, %function
GetBackPicFromVOQueue:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x20, x22, 65536
	bl	_mcount
	ldr	w0, [x20, 1980]
	bl	FSP_GetFspType
	cbz	w0, .L1198
.L1182:
	ldr	w0, [x20, 636]
	mov	w21, 0
	mov	w23, 856
	cbz	w0, .L1189
	.p2align 2
.L1193:
	uxtw	x1, w21
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	umull	x24, w21, w23
	add	x0, x22, x0, lsl 3
	add	x0, x0, 28672
	add	x24, x24, 28672
	add	x19, x24, 1112
	add	x24, x24, 1144
	add	x19, x22, x19
	add	x24, x22, x24
	strb	wzr, [x0, 553]
	strb	wzr, [x0, 554]
.L1187:
	ldr	x0, [x19]
	mov	x1, x0
	cbz	x0, .L1186
	ldr	w0, [x20, 1980]
	bl	FreeUsdByDec
	str	xzr, [x19]
.L1186:
	add	x19, x19, 8
	cmp	x19, x24
	bne	.L1187
	ldr	w0, [x20, 636]
	add	w21, w21, 1
	cmp	w0, w21
	bhi	.L1193
.L1189:
	ldr	w0, [x20, 640]
	cbz	w0, .L1181
	sub	w0, w0, #1
	add	x20, x20, 568
	add	x0, x0, 16384
	add	x0, x0, 143
	add	x22, x22, x0, lsl 2
	.p2align 2
.L1190:
	str	wzr, [x20], 4
	cmp	x20, x22
	bne	.L1190
.L1181:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L1198:
	add	x0, x22, 8
	bl	ResetVoQueue
	b	.L1182
	.size	GetBackPicFromVOQueue, .-GetBackPicFromVOQueue
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	wait_vo
	.type	wait_vo, %function
wait_vo:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	wait_vo, .-wait_vo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetReRangeFlag
	.type	GetReRangeFlag, %function
GetReRangeFlag:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	mov	w19, 4000
	bl	_mcount
	add	x1, x21, 20480
	mov	w0, 2208
	ldr	x5, [x21, 14968]
	ldr	x2, [x21, 14960]
	ldr	w1, [x1, 1592]
	ldr	w4, [x21, 14932]
	ldr	w3, [x21, 14936]
	umull	x0, w1, w0
	mov	w1, 2
	add	x0, x5, x0
	ldr	w0, [x0, 28]
	umull	x0, w0, w19
	add	x19, x2, x0
	ldrb	w0, [x19, 18]
	ldr	w5, [x19, 3252]
	sub	w0, w1, w0
	ldr	w2, [x19, 3248]
	madd	w0, w5, w0, w0
	add	w1, w2, 1
	cmp	w4, w1
	ccmp	w3, w0, 0, eq
	bne	.L1201
	add	x2, x21, 24576
	ldr	w5, [x19, 3272]
	ldr	w2, [x2, 3704]
	add	w2, w2, 1
	cmp	w5, w2
	beq	.L1204
.L1201:
	ldr	x2, .LC129
	ldr	x6, [x2]
	cbz	x6, .L1205
	add	x5, x21, 65536
	ubfiz	w2, w1, 4, 12
	ubfiz	w3, w3, 4, 12
	ubfiz	w1, w0, 4, 12
	ubfiz	w4, w4, 4, 12
	strh	w3, [x29, 58]
	ldr	w0, [x5, 1980]
	mov	w3, 8
	strh	w2, [x29, 60]
	add	x2, x29, 56
	strh	w1, [x29, 62]
	mov	w1, 2
	strh	w4, [x29, 56]
	blr	x6
.L1205:
	ldr	w2, [x19, 3272]
	mov	w3, 1
.L1202:
	add	x1, x21, 16384
	ldr	w4, [x19, 36]
	ldr	w5, [x21, 15012]
	mov	w0, w3
	ldr	w1, [x1, 1864]
	cmp	w5, w4
	ccmp	w1, w2, 0, eq
	cset	w1, ne
	orr	w1, w3, w1
	str	w1, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1204:
	mov	w3, 0
	b	.L1202
	.size	GetReRangeFlag, .-GetReRangeFlag
	.align	3
.LC129:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecPOC
	.type	DecPOC, %function
DecPOC:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 20480
	mov	w2, 2208
	ldr	x6, [x19, 14968]
	mov	w1, 4000
	ldr	x5, [x19, 14960]
	mov	w4, 1
	ldr	w3, [x0, 1592]
	ldrb	w7, [x0, 1587]
	umull	x2, w3, w2
	add	x2, x6, x2
	ldr	w2, [x2, 28]
	umull	x1, w2, w1
	add	x1, x5, x1
	ldr	w3, [x1, 2200]
	ldr	w2, [x1, 2196]
	cmp	w3, w4
	add	w2, w2, 4
	lsl	w2, w4, w2
	beq	.L1208
	cbz	w3, .L1209
	cmp	w3, 2
	bne	.L1206
	cmp	w7, 5
	beq	.L1263
	ldr	w1, [x0, 728]
	cbz	w1, .L1242
	ldr	w1, [x0, 768]
	mov	w3, 0
	mov	w2, 0
	str	wzr, [x0, 764]
	str	wzr, [x0, 776]
.L1243:
	str	w2, [x0, 772]
.L1245:
	ldr	w4, [x0, 1612]
	add	w2, w1, w2
	str	w2, [x0, 760]
	lsl	w1, w2, 1
	cbnz	w4, .L1246
	sub	w1, w1, #1
	str	w1, [x0, 748]
.L1247:
	ldrb	w2, [x0, 1585]
	cbnz	w2, .L1248
	str	w1, [x0, 736]
	str	w1, [x0, 740]
	str	w1, [x0, 744]
.L1241:
	ldr	w1, [x0, 768]
	str	w1, [x0, 764]
	str	w3, [x0, 776]
.L1206:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1209:
	ldr	w1, [x1, 2204]
	cmp	w7, 5
	add	w1, w1, 4
	lsl	w4, w4, w1
	beq	.L1215
	ldr	w1, [x0, 728]
	cbnz	w1, .L1213
	ldr	w5, [x0, 712]
	ldr	w3, [x0, 716]
	mov	w2, w5
.L1214:
	ldr	w1, [x0, 704]
	cmp	w1, w3
	bcs	.L1212
	sub	w6, w3, w1
	cmp	w6, w4, lsr 1
	bcc	.L1212
	add	w2, w2, w4
	str	w2, [x0, 720]
.L1216:
	ldrb	w3, [x0, 1585]
	cbnz	w3, .L1218
.L1266:
	ldr	w3, [x0, 708]
	add	w1, w1, w2
	str	w1, [x0, 736]
	add	w2, w1, w3
	str	w2, [x0, 740]
	cmp	w1, w2
	csel	w1, w1, w2, le
	str	w1, [x0, 748]
.L1219:
	ldr	w3, [x0, 764]
	ldr	w2, [x0, 768]
	str	w1, [x0, 744]
	cmp	w2, w3
	beq	.L1221
	str	w2, [x0, 764]
.L1221:
	ldr	w1, [x0, 1612]
	cbz	w1, .L1206
	ldr	w2, [x0, 704]
	ldr	w1, [x0, 720]
	str	w1, [x0, 712]
	str	w2, [x0, 716]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1208:
	cmp	w7, 5
	beq	.L1264
	ldr	w3, [x0, 728]
	cbz	w3, .L1224
	mov	w2, 0
	str	wzr, [x0, 764]
	str	wzr, [x0, 776]
.L1225:
	str	w2, [x0, 772]
.L1223:
	ldr	w2, [x1, 2216]
	cbz	w2, .L1227
	ldr	w2, [x0, 768]
	ldr	w5, [x0, 772]
	ldr	w6, [x0, 1612]
	add	w5, w5, w2
	str	w5, [x0, 760]
	cbnz	w6, .L1229
	cbz	w5, .L1230
	sub	w5, w5, #1
	str	w5, [x0, 760]
.L1229:
	str	wzr, [x0, 792]
	ldr	w2, [x1, 2216]
	cmp	w2, wzr
	ble	.L1231
.L1250:
	mov	w4, 0
	mov	w3, 0
	.p2align 2
.L1232:
	add	x2, x1, x3, sxtw 2
	add	w3, w3, 1
	ldr	w2, [x2, 2220]
	add	w4, w4, w2
	str	w4, [x0, 792]
	ldr	w2, [x1, 2216]
	cmp	w2, w3
	bgt	.L1232
.L1231:
	cbz	w5, .L1233
	sub	w5, w5, #1
	ldr	w7, [x0, 792]
	udiv	w2, w5, w2
	str	w2, [x0, 784]
	ldr	w4, [x1, 2216]
	udiv	w3, w5, w4
	mul	w2, w2, w7
	str	w2, [x0, 788]
	msub	w5, w3, w4, w5
	str	w5, [x0, 780]
	tbnz	w5, #31, .L1234
	mov	w3, 0
	.p2align 2
.L1235:
	add	x4, x1, x3, sxtw 2
	add	w3, w3, 1
	cmp	w5, w3
	ldr	w4, [x4, 2220]
	add	w2, w2, w4
	str	w2, [x0, 788]
	bge	.L1235
.L1234:
	cbnz	w6, .L1236
	ldr	w3, [x1, 2208]
	add	w2, w2, w3
	str	w2, [x0, 788]
.L1236:
	ldrb	w3, [x0, 1585]
	cbnz	w3, .L1237
	ldr	w3, [x0, 752]
	ldr	w4, [x0, 756]
	add	w2, w2, w3
	str	w2, [x0, 736]
	ldr	w1, [x1, 2212]
	add	w1, w2, w1
	add	w1, w1, w4
	str	w1, [x0, 740]
	cmp	w2, w1
	csel	w2, w2, w1, le
	str	w2, [x0, 748]
.L1238:
	ldr	w3, [x0, 768]
	ldr	w1, [x0, 772]
	str	w2, [x0, 744]
	str	w3, [x0, 764]
	str	w1, [x0, 776]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1213:
	ldr	w5, [x0, 732]
	cbz	w5, .L1265
.L1215:
	ldr	w1, [x0, 704]
	mov	w2, 0
	mov	w5, 0
	str	wzr, [x0, 712]
	str	wzr, [x0, 716]
.L1212:
	cmp	w1, w3
	bls	.L1217
	sub	w3, w1, w3
	cmp	w3, w4, lsr 1
	bls	.L1217
	sub	w2, w2, w4
	str	w2, [x0, 720]
	b	.L1216
	.p2align 3
.L1263:
	add	x1, x0, 512
	mov	w3, 0
	stp	wzr, wzr, [x1, 224]
	stp	wzr, wzr, [x1, 232]
	str	wzr, [x0, 772]
	b	.L1241
	.p2align 3
.L1264:
	str	wzr, [x0, 772]
	b	.L1223
	.p2align 3
.L1217:
	ldrb	w3, [x0, 1585]
	str	w5, [x0, 720]
	cbz	w3, .L1266
.L1218:
	ldrb	w3, [x0, 1586]
	add	w1, w1, w2
	cbnz	w3, .L1220
	str	w1, [x0, 736]
	str	w1, [x0, 748]
	b	.L1219
	.p2align 3
.L1227:
	ldr	w6, [x0, 1612]
	str	wzr, [x0, 760]
.L1230:
	str	wzr, [x0, 792]
	mov	w5, 0
	ldr	w2, [x1, 2216]
	cmp	w2, wzr
	bgt	.L1250
	.p2align 2
.L1233:
	mov	w2, 0
	str	wzr, [x0, 788]
	b	.L1234
	.p2align 3
.L1237:
	ldrb	w3, [x0, 1586]
	cbnz	w3, .L1239
	ldr	w1, [x0, 752]
	add	w2, w2, w1
	str	w2, [x0, 736]
	str	w2, [x0, 748]
	b	.L1238
	.p2align 3
.L1242:
	ldr	w3, [x0, 764]
	ldr	w1, [x0, 768]
	cmp	w1, w3
	ldr	w3, [x0, 776]
	bcs	.L1244
	add	w2, w2, w3
	str	w2, [x0, 772]
	mov	w3, w2
	b	.L1245
	.p2align 3
.L1224:
	ldr	w3, [x0, 764]
	ldr	w4, [x0, 768]
	cmp	w4, w3
	bcs	.L1226
	ldr	w3, [x0, 776]
	add	w2, w3, w2
	str	w2, [x0, 772]
	b	.L1223
	.p2align 3
.L1248:
	ldrb	w2, [x0, 1586]
	str	w1, [x0, 744]
	cbnz	w2, .L1249
	str	w1, [x0, 736]
	b	.L1241
	.p2align 3
.L1246:
	str	w1, [x0, 748]
	b	.L1247
	.p2align 3
.L1220:
	str	w1, [x0, 740]
	str	w1, [x0, 748]
	b	.L1219
	.p2align 3
.L1239:
	ldr	w3, [x1, 2212]
	ldr	w1, [x0, 752]
	add	w2, w2, w3
	add	w2, w2, w1
	str	w2, [x0, 740]
	str	w2, [x0, 748]
	b	.L1238
	.p2align 3
.L1265:
	ldr	w3, [x0, 736]
	mov	w2, 0
	str	wzr, [x0, 712]
	str	w3, [x0, 716]
	b	.L1214
	.p2align 3
.L1249:
	str	w1, [x0, 740]
	b	.L1241
.L1226:
	ldr	w2, [x0, 776]
	b	.L1225
.L1244:
	mov	w2, w3
	b	.L1243
	.size	DecPOC, .-DecPOC
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CalcPicNum
	.type	CalcPicNum, %function
CalcPicNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x2, x19, 20480
	mov	w1, 2208
	ldr	x4, [x19, 14968]
	mov	w0, 4000
	ldr	x3, [x19, 14960]
	add	x6, x19, 61440
	ldr	w2, [x2, 1592]
	mov	w7, 1
	umull	x1, w2, w1
	ldrb	w2, [x6, 2027]
	add	x1, x4, x1
	ldr	w1, [x1, 28]
	umull	x0, w1, w0
	add	x0, x3, x0
	ldr	w0, [x0, 2196]
	add	w0, w0, 4
	lsl	w7, w7, w0
	add	x0, x19, 24576
	cbz	w2, .L1268
	cmp	w2, 1
	mov	w1, 0
	cset	w8, eq
	cmp	w2, 2
	ldr	w2, [x0, 3712]
	cset	w9, eq
	cbz	w2, .L1288
	.p2align 2
.L1305:
	add	x3, x19, x1, uxtw 3
	ldr	x2, [x3, 28024]
	ldrb	w4, [x2, 2]
	cbz	w4, .L1282
	ldr	w4, [x2, 660]
	ldr	w5, [x6, 2696]
	cmp	w4, w5
	bls	.L1283
	sub	w4, w4, w7
	str	w4, [x2, 664]
.L1284:
	ldr	x2, [x3, 28024]
	ldrb	w4, [x2, 2]
	tbz	x4, 0, .L1285
	ldr	w5, [x2, 752]
	and	w5, w5, 16776960
	cmp	w5, 65536
	beq	.L1315
.L1285:
	tbz	x4, 1, .L1282
	ldr	w3, [x2, 800]
	and	w3, w3, 16776960
	cmp	w3, 65536
	beq	.L1316
	.p2align 2
.L1282:
	ldr	w2, [x0, 3712]
	add	w1, w1, 1
	cmp	w2, w1
	bhi	.L1305
.L1288:
	ldr	w2, [x0, 3716]
	mov	w1, 0
	cbz	w2, .L1267
	.p2align 2
.L1304:
	add	x4, x19, x1, uxtw 3
	add	w1, w1, 1
	ldr	x3, [x4, 28152]
	ldrb	w2, [x3, 2]
	cbz	w2, .L1290
	tbz	x2, 0, .L1291
	ldr	w5, [x3, 752]
	and	w5, w5, 16776960
	cmp	w5, 256
	beq	.L1317
.L1291:
	tbz	x2, 1, .L1290
	ldr	w2, [x3, 800]
	and	w2, w2, 16776960
	cmp	w2, 256
	beq	.L1318
	.p2align 2
.L1290:
	ldr	w2, [x0, 3716]
	cmp	w2, w1
	bhi	.L1304
.L1267:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1283:
	str	w4, [x2, 664]
	b	.L1284
	.p2align 3
.L1268:
	ldr	w2, [x0, 3712]
	mov	w1, 0
	cbnz	w2, .L1303
	.p2align 2
.L1278:
	ldr	w2, [x0, 3716]
	mov	w1, 0
	cbz	w2, .L1267
	add	x2, x19, x1, uxtw 3
	add	w1, w1, 1
	ldr	x2, [x2, 28152]
	ldrb	w3, [x2, 2]
	cmp	w3, 3
	beq	.L1319
	.p2align 2
.L1279:
	ldr	w2, [x0, 3716]
	cmp	w2, w1
	bls	.L1267
	add	x2, x19, x1, uxtw 3
	add	w1, w1, 1
	ldr	x2, [x2, 28152]
	ldrb	w3, [x2, 2]
	cmp	w3, 3
	bne	.L1279
.L1319:
	ldr	w3, [x2, 704]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L1279
	ldr	w3, [x2, 668]
	str	w3, [x2, 708]
	b	.L1279
	.p2align 3
.L1321:
	ldr	w4, [x2, 704]
	and	w4, w4, 16776960
	cmp	w4, 65536
	bne	.L1274
	ldr	w4, [x2, 660]
	ldr	w5, [x6, 2696]
	cmp	w4, w5
	sub	w5, w4, w7
	bhi	.L1320
	str	w4, [x2, 664]
.L1276:
	ldr	x2, [x3, 28024]
	ldr	w3, [x2, 664]
	str	w3, [x2, 712]
	.p2align 2
.L1274:
	ldr	w2, [x0, 3712]
	add	w1, w1, 1
	cmp	w2, w1
	bls	.L1278
.L1303:
	add	x3, x19, x1, uxtw 3
	ldr	x2, [x3, 28024]
	ldrb	w4, [x2, 2]
	cmp	w4, 3
	bne	.L1274
	b	.L1321
	.p2align 3
.L1317:
	ldr	w2, [x3, 668]
	add	w2, w8, w2, lsl 1
	str	w2, [x3, 756]
	ldr	x3, [x4, 28152]
	ldrb	w2, [x3, 2]
	b	.L1291
	.p2align 3
.L1315:
	ldr	w4, [x2, 664]
	add	w4, w8, w4, lsl 1
	str	w4, [x2, 760]
	ldr	x2, [x3, 28024]
	ldrb	w4, [x2, 2]
	b	.L1285
	.p2align 3
.L1318:
	ldr	w2, [x3, 668]
	add	w2, w9, w2, lsl 1
	str	w2, [x3, 804]
	b	.L1290
	.p2align 3
.L1316:
	ldr	w3, [x2, 664]
	add	w3, w9, w3, lsl 1
	str	w3, [x2, 808]
	b	.L1282
	.p2align 3
.L1320:
	str	w5, [x2, 664]
	b	.L1276
	.size	CalcPicNum, .-CalcPicNum
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsOutDPB
	.type	IsOutDPB, %function
IsOutDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L1327
	add	x0, x19, 24576
	ldr	w3, [x0, 3708]
	cbz	w3, .L1327
	ldr	x0, [x19, 27896]
	cmp	x20, x0
	beq	.L1329
	sub	w3, w3, #1
	mov	x0, x19
	add	x3, x19, x3, lsl 3
	b	.L1324
	.p2align 3
.L1325:
	ldr	x2, [x0, 27896]
	cmp	x20, x2
	beq	.L1329
.L1324:
	cmp	x0, x3
	add	x0, x0, 8
	bne	.L1325
.L1327:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1329:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	IsOutDPB, .-IsOutDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	WritePicMsg
	.type	WritePicMsg, %function
WritePicMsg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L1368
	add	x21, x20, 61440
	ldr	x1, .LC133
	add	x19, x20, 65536
	mov	w0, 2
	ldr	w4, [x21, 2188]
	ldrb	w3, [x21, 2027]
	ldr	w2, [x21, 2704]
	ldr	w5, [x21, 2756]
	bl	dprint_vfmw
	str	wzr, [x19, 1904]
	ldr	w4, [x19, 1992]
	str	wzr, [x19, 2004]
	cmp	w4, 1
	beq	.L1333
	add	x2, x20, 16384
	add	x0, x20, 12288
	add	x2, x2, 2592
	add	x0, x0, 2688
	add	x3, x20, 20480
.L1334:
	ldr	x5, [x21, 2624]
	cmp	w4, 1
	ldr	x1, [x19, 1896]
	str	x5, [x19, 728]
	str	x1, [x19, 1648]
	ldr	w1, [x21, 2152]
	str	w1, [x19, 1424]
	ldr	w1, [x21, 2156]
	str	w1, [x19, 1428]
	ldr	w1, [x21, 2176]
	str	w1, [x19, 1432]
	ldr	w1, [x21, 2180]
	str	w1, [x19, 1436]
	ldr	w1, [x21, 2704]
	str	w1, [x19, 736]
	ldrb	w1, [x21, 2027]
	strb	w1, [x19, 704]
	ldrb	w1, [x0, 19]
	str	w1, [x19, 752]
	ldr	w1, [x21, 2740]
	str	w1, [x19, 740]
	ldr	w1, [x21, 2744]
	str	w1, [x19, 744]
	ldr	w1, [x0, 3248]
	add	w1, w1, 1
	str	w1, [x19, 748]
	ldrb	w1, [x0, 18]
	strb	w1, [x19, 707]
	ldr	w1, [x2, 60]
	str	w1, [x19, 756]
	ldrb	w1, [x2]
	str	w1, [x19, 760]
	ldr	w0, [x0, 40]
	strb	w0, [x19, 705]
	ldrb	w0, [x2, 4]
	str	w0, [x19, 764]
	ldr	w0, [x3, 748]
	str	w0, [x19, 768]
	ldr	w0, [x3, 736]
	str	w0, [x19, 772]
	ldr	w0, [x3, 740]
	str	w0, [x19, 776]
	beq	.L1349
	ldr	x1, [x21, 2680]
	ldr	w0, [x19, 1980]
	ldr	w1, [x1, 656]
	bl	FSP_GetLogicFs
	mov	x23, x0
	cbz	x0, .L1369
	ldp	x2, x3, [x0, 32]
	cbz	x2, .L1338
	cbz	x3, .L1338
	ldr	w0, [x19, 1980]
	add	x3, x19, 1156
	add	x2, x19, 1028
	add	x1, x19, 1284
	add	x22, x20, 24576
	bl	FSP_GetDecFsAddrTab
	ldr	x3, [x23, 32]
	add	x2, x19, 1288
	ldr	w0, [x19, 1980]
	add	x1, x19, 1416
	ldr	w3, [x3, 4]
	str	w3, [x19, 1012]
	bl	FSP_GetPmvAddrTab
	ldr	w0, [x21, 2756]
	str	w0, [x19, 1020]
	ldr	w0, [x23, 12]
	str	w0, [x19, 1420]
	ldr	x0, [x23, 40]
	ldr	w0, [x0, 8]
	str	w0, [x19, 1016]
	ldr	x0, [x23, 40]
	ldr	w0, [x0, 64]
	str	w0, [x19, 1024]
	ldr	w4, [x22, 3984]
	str	w4, [x19, 1640]
	cbz	w4, .L1344
	sub	w3, w4, #1
	add	x0, x22, 3792
	add	x3, x3, 4096
	add	x1, x19, 1448
	add	x3, x3, 2997
	add	x3, x20, x3, lsl 2
	.p2align 2
.L1343:
	ldr	w2, [x0]
	add	x0, x0, 4
	str	w2, [x1]
	add	x1, x1, 4
	cmp	x3, x0
	ldr	w2, [x0, 60]
	str	w2, [x1, 60]
	ldr	w2, [x0, 124]
	str	w2, [x1, 124]
	bne	.L1343
.L1344:
	add	x0, x20, 12288
	ldrb	w0, [x0, 2713]
	cbz	w0, .L1341
	add	x0, x20, 16384
	ldrb	w0, [x0, 2610]
.L1345:
	cmp	w0, 1
	add	x5, x19, 780
	mov	w1, 0
	beq	.L1351
	.p2align 2
.L1354:
	uxtw	x0, w1
	add	w1, w1, 1
	add	x0, x0, 4096
	cmp	w1, 24
	add	x0, x20, x0, lsl 2
	ldr	w0, [x0, 564]
	ubfx	x3, x0, 8, 8
	lsr	w2, w0, 16
	ubfiz	w2, w2, 8, 8
	and	w0, w0, -16776961
	orr	w2, w2, w3, lsl 16
	orr	w0, w2, w0
	str	w0, [x5], 4
	bne	.L1354
	add	x6, x19, 876
	mov	w10, 1
	mov	w5, 0
	.p2align 2
.L1355:
	ubfx	x1, x5, 3, 29
	ubfiz	x0, x5, 1, 3
	and	x2, x10, 15
	lsl	x1, x1, 4
	add	x2, x1, x2
	add	x1, x1, x0
	add	x1, x1, 4096
	add	x0, x2, 4096
	add	x6, x6, 8
	add	w5, w5, 1
	add	x0, x20, x0, lsl 2
	add	x1, x20, x1, lsl 2
	cmp	w5, 16
	add	w10, w10, 2
	ldr	w0, [x0, 660]
	ldr	w1, [x1, 660]
	lsr	w3, w0, 16
	ubfx	x8, x0, 8, 8
	lsr	w9, w1, 16
	lsr	w7, w1, 24
	ubfiz	w12, w0, 16, 8
	ubfiz	w11, w9, 8, 8
	ubfx	x2, x1, 8, 8
	and	w9, w1, 255
	lsl	w7, w7, 8
	and	w1, w0, -16777216
	orr	w0, w2, w1
	orr	w3, w12, w3, lsl 24
	orr	w9, w11, w9
	orr	w7, w7, w8, lsl 16
	orr	w1, w9, w3
	orr	w0, w7, w0
	stp	w1, w0, [x6, -8]
	bne	.L1355
.L1353:
	mov	w23, 0
	cbz	w4, .L1349
	.p2align 2
.L1357:
	add	x21, x20, x23, uxtw 2
	ldr	w0, [x19, 1980]
	add	x24, x21, 24576
	mov	w1, 0
	add	x21, x21, 65536
	add	w23, w23, 1
	ldr	w2, [x24, 3792]
	bl	FSP_GetStoreType
	cmp	w0, wzr
	cset	w0, ne
	str	w0, [x21, 1760]
	ldr	w0, [x24, 3792]
	str	w0, [x21, 1824]
	ldr	w0, [x22, 3984]
	cmp	w0, w23
	bhi	.L1357
.L1349:
	mov	w0, 0
.L1332:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1351:
	uxtw	x0, w1
	add	w1, w1, 1
	add	x0, x0, 4096
	cmp	w1, 24
	add	x0, x0, 1144
	ldr	w0, [x20, x0, lsl 2]
	ubfx	x3, x0, 8, 8
	lsr	w2, w0, 16
	ubfiz	w2, w2, 8, 8
	and	w0, w0, -16776961
	orr	w2, w2, w3, lsl 16
	orr	w0, w2, w0
	str	w0, [x5], 4
	bne	.L1351
	add	x6, x19, 876
	mov	w10, 1
	mov	w5, 0
	.p2align 2
.L1352:
	ubfx	x1, x5, 3, 29
	ubfiz	x0, x5, 1, 3
	and	x2, x10, 15
	lsl	x1, x1, 4
	add	x2, x1, x2
	add	x1, x1, x0
	add	x1, x1, 4096
	add	x0, x2, 4096
	add	x0, x0, 1168
	add	x1, x1, 1168
	add	x6, x6, 8
	add	w5, w5, 1
	cmp	w5, 16
	add	w10, w10, 2
	ldr	w0, [x20, x0, lsl 2]
	ldr	w1, [x20, x1, lsl 2]
	lsr	w9, w0, 16
	ubfx	x8, x0, 8, 8
	lsr	w3, w1, 16
	lsr	w7, w1, 24
	ubfiz	w12, w0, 16, 8
	ubfiz	w11, w3, 8, 8
	ubfx	x2, x1, 8, 8
	and	w3, w1, 255
	lsl	w7, w7, 8
	and	w1, w0, -16777216
	orr	w0, w2, w1
	orr	w9, w12, w9, lsl 24
	orr	w3, w11, w3
	orr	w7, w7, w8, lsl 16
	orr	w1, w9, w3
	orr	w0, w7, w0
	stp	w1, w0, [x6, -8]
	bne	.L1352
	b	.L1353
	.p2align 3
.L1341:
	add	x0, x20, 16384
	ldrb	w0, [x0, 2610]
	cbnz	w0, .L1345
	ldr	x10, .LC138
	add	x5, x19, 780
	mov	w1, 0
	.p2align 2
.L1346:
	and	w0, w1, 3
	add	w1, w1, 1
	cmp	w1, 24
	ldr	w0, [x10, w0, uxtw 2]
	ubfx	x3, x0, 8, 8
	lsr	w2, w0, 16
	ubfiz	w2, w2, 8, 8
	and	w0, w0, -16776961
	orr	w2, w2, w3, lsl 16
	orr	w0, w2, w0
	str	w0, [x5], 4
	bne	.L1346
	add	x6, x19, 876
	mov	w5, 0
	.p2align 2
.L1347:
	add	w0, w5, 1
	and	w2, w5, 14
	add	x1, x10, 16
	and	w0, w0, 15
	add	x6, x6, 8
	add	w5, w5, 2
	cmp	w5, 32
	ldr	w0, [x1, w0, uxtw 2]
	ldr	w1, [x1, w2, uxtw 2]
	lsr	w8, w0, 16
	ubfx	x2, x0, 8, 8
	lsr	w3, w1, 16
	lsr	w7, w1, 24
	ubfiz	w11, w0, 16, 8
	ubfiz	w9, w3, 8, 8
	and	w0, w0, -16777216
	and	w3, w1, 255
	ubfx	x1, x1, 8, 8
	orr	w0, w0, w2, lsl 16
	orr	w8, w11, w8, lsl 24
	orr	w3, w9, w3
	orr	w1, w1, w7, lsl 8
	orr	w2, w8, w3
	orr	w0, w1, w0
	stp	w2, w0, [x6, -8]
	bne	.L1347
	b	.L1353
	.p2align 3
.L1333:
	add	x3, x20, 20480
	mov	w2, 2208
	ldr	x6, [x20, 14968]
	mov	w0, 4000
	ldr	x5, [x20, 14960]
	ldr	w1, [x3, 1592]
	umull	x1, w1, w2
	add	x2, x6, x1
	ldr	w1, [x2, 28]
	umull	x0, w1, w0
	add	x0, x5, x0
	b	.L1334
.L1338:
	ldr	x1, .LC137
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1332
.L1368:
	ldr	x2, .LC130
	mov	w3, 6948
	ldr	x1, .LC131
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1332
.L1369:
	ldr	x2, [x21, 2680]
	mov	w0, 0
	ldr	x1, .LC135
	ldr	w2, [x2, 656]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1332
	.size	WritePicMsg, .-WritePicMsg
	.align	3
.LC130:
	.xword	.LC30
	.align	3
.LC131:
	.xword	.LC32
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
.LC138:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UpdatePicQpInf
	.type	UpdatePicQpInf, %function
UpdatePicQpInf:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	ldp	w1, w0, [x19, 24]
	cmp	w1, w20
	csel	w1, w1, w20, ge
	cmp	w0, w20
	csel	w0, w0, w20, le
	stp	w1, w0, [x19, 24]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	UpdatePicQpInf, .-UpdatePicQpInf
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	WriteSliceMsg
	.type	WriteSliceMsg, %function
WriteSliceMsg:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	add	x26, x21, 65536
	bl	_mcount
	ldr	w0, [x26, 1992]
	ldr	w7, [x26, 1904]
	cmp	w0, 1
	beq	.L1372
	add	x4, x21, 16384
	add	x6, x21, 12288
	add	x4, x4, 2592
	add	x6, x6, 2688
	add	x25, x21, 20480
.L1373:
	add	w0, w7, 1
	str	w0, [x26, 1904]
	uxtw	x20, w7
	ldr	x8, [x26, 1896]
	ldr	w1, [x21, 14940]
	lsl	x5, x20, 7
	sub	x5, x5, x20
	sub	w1, w1, #1
	lsl	x5, x5, 5
	cmp	w7, w1
	add	x19, x8, x5
	bcs	.L1374
	lsl	x1, x0, 7
	sub	x0, x1, x0
	add	x0, x8, x0, lsl 5
	str	x0, [x19, 4056]
.L1375:
	ldr	x3, [x21, 632]
	ldrb	w2, [x3]
	ldr	w0, [x3, 76]
	cmp	w2, 1
	ccmp	w2, w0, 2, ls
	bcs	.L1376
	.p2align 2
.L1377:
	uxtw	x0, w2
	add	w2, w2, 1
	lsl	x1, x0, 5
	add	x3, x3, x1
	add	x0, x19, x0, lsl 2
	ldr	w3, [x3, 28]
	str	w3, [x0, 16]
	ldr	x3, [x21, 632]
	add	x3, x3, x1
	ldr	w3, [x3, 24]
	str	w3, [x0, 8]
	ldr	x3, [x21, 632]
	add	x1, x3, x1
	ldr	w1, [x1, 32]
	str	w1, [x0, 24]
	ldr	x3, [x21, 632]
	ldr	w0, [x3, 76]
	cmp	w0, w2
	ccmp	w2, 1, 2, hi
	bls	.L1377
.L1376:
	cmp	w0, 1
	bhi	.L1382
	.p2align 2
.L1458:
	add	x1, x19, x0, uxtw 2
	add	w0, w0, 1
	cmp	w0, 2
	str	wzr, [x1, 8]
	str	wzr, [x1, 16]
	str	wzr, [x1, 24]
	bne	.L1458
.L1382:
	add	x22, x21, 61440
	ldrb	w0, [x22, 2033]
	strb	w0, [x19, 1]
	ldr	w0, [x4, 48]
	ldr	w1, [x25, 3192]
	add	w0, w0, 26
	add	w0, w0, w1
	str	w0, [x19, 32]
	ldr	w1, [x25, 3188]
	str	w1, [x19, 36]
	ldr	w1, [x25, 1640]
	str	w1, [x19, 40]
	ldr	w1, [x25, 1636]
	str	w1, [x19, 44]
	ldrb	w1, [x25, 1584]
	strb	w1, [x8, x5]
	ldr	w1, [x25, 1632]
	str	w1, [x19, 48]
	ldrb	w1, [x25, 1590]
	strb	w1, [x19, 2]
	ldrb	w1, [x6, 20]
	strb	w1, [x19, 3]
	ldr	w1, [x25, 1624]
	str	w1, [x19, 52]
	ldr	w1, [x25, 1628]
	str	w1, [x19, 56]
	ldrb	w1, [x25, 1584]
	cmp	w1, 1
	beq	.L1484
	cbz	w1, .L1485
	strb	wzr, [x19, 4]
.L1383:
	ldr	w1, [x4, 52]
	str	w1, [x19, 60]
	ldr	w1, [x4, 56]
	str	w1, [x19, 64]
	ldr	w1, [x25, 3200]
	str	w1, [x19, 68]
	ldr	w1, [x25, 3204]
	str	w1, [x19, 72]
	ldr	w1, [x25, 3196]
	str	w1, [x19, 76]
	ldr	w1, [x26, 1992]
	cmp	w1, 1
	beq	.L1371
	ldrb	w1, [x25, 1585]
	cbnz	w1, .L1386
	ldr	x2, [x22, 2680]
	ldr	w1, [x2, 700]
	madd	w0, w7, w1, w0
	ldr	w1, [x26, 1904]
	udiv	w0, w0, w1
	str	w0, [x2, 736]
.L1387:
	ldr	x0, [x22, 2680]
	cbnz	w7, .L1389
	ldr	w1, [x19, 32]
	str	w1, [x0, 728]
	ldr	x0, [x22, 2680]
	ldr	w1, [x19, 32]
	str	w1, [x0, 732]
.L1390:
	ldrb	w0, [x25, 1584]
	cmp	w0, 2
	beq	.L1427
	ldr	w0, [x25, 1624]
	cbz	w0, .L1430
	ldr	x1, [x21, 28696]
	ldr	x1, [x1, 40]
	ldrb	w2, [x1]
	cbz	w2, .L1393
	sub	w3, w0, #1
	mov	x0, x21
	add	x3, x21, x3, lsl 3
	b	.L1395
	.p2align 3
.L1397:
	ldr	x1, [x0, 28704]
	add	x0, x0, 8
	ldr	x1, [x1, 40]
	ldrb	w2, [x1]
	cbz	w2, .L1393
.L1395:
	cmp	x3, x0
	bne	.L1397
.L1430:
	mov	w23, 0
.L1392:
	ldr	w0, [x25, 1628]
	cbz	w0, .L1431
	ldr	x1, [x21, 28960]
	ldr	x1, [x1, 40]
	ldrb	w2, [x1]
	cbz	w2, .L1399
	sub	w3, w0, #1
	mov	x0, x21
	add	x3, x21, x3, lsl 3
	b	.L1401
	.p2align 3
.L1403:
	ldr	x1, [x0, 28968]
	add	x0, x0, 8
	ldr	x1, [x1, 40]
	ldrb	w2, [x1]
	cbz	w2, .L1399
.L1401:
	cmp	x3, x0
	bne	.L1403
.L1431:
	mov	w24, 0
.L1398:
	ldrb	w0, [x22, 2027]
	cbz	w0, .L1404
	ldr	w0, [x25, 1624]
	mov	w28, 0
	cbnz	w0, .L1457
	b	.L1420
	.p2align 3
.L1487:
	cbz	x0, .L1437
	ldr	x0, [x0, 32]
	ldr	w1, [x0, 4]
.L1416:
	lsl	x0, x22, 5
	add	x0, x0, x22, lsl 2
	add	x0, x19, x0
	str	w1, [x0, 1640]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 696]
	str	w1, [x0, 1644]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 672]
	str	w1, [x0, 1632]
	ldr	x1, [x27, 28696]
	ldrb	w1, [x1]
	strb	w1, [x0, 1624]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1, 704]
	strb	w1, [x0, 1626]
	ldr	x1, [x27, 28696]
	ldrb	w1, [x1]
	cmp	w1, 1
	beq	.L1486
	strb	w1, [x0, 1630]
	ldr	x1, [x27, 28696]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 1631]
	ldr	x1, [x27, 28696]
	ldr	w1, [x1, 12]
	str	w1, [x0, 1656]
.L1418:
	ldr	w0, [x25, 1624]
	add	w28, w28, 1
	cmp	w0, w28
	bls	.L1420
.L1457:
	uxtw	x22, w28
	ldr	w0, [x26, 1980]
	add	x27, x21, x22, lsl 3
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 656]
	bl	FSP_GetLogicFs
	ldr	x2, [x27, 28696]
	lsl	x1, x22, 5
	add	x1, x1, x22, lsl 2
	add	x1, x19, x1
	ldr	x2, [x2, 40]
	ldr	w2, [x2, 692]
	str	w2, [x1, 1636]
	ldr	x2, [x27, 28696]
	ldr	x2, [x2, 40]
	ldrb	w2, [x2, 1]
	strb	w2, [x1, 1625]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1]
	cmp	w1, 1
	bne	.L1487
	mov	w1, w23
	b	.L1416
	.p2align 3
.L1374:
	str	xzr, [x19, 4056]
	b	.L1375
	.p2align 3
.L1485:
	ldrb	w1, [x4, 2]
	strb	w1, [x19, 4]
	b	.L1383
	.p2align 3
.L1420:
	ldrb	w0, [x25, 1584]
	cmp	w0, 1
	beq	.L1488
.L1407:
	add	x1, x21, 24576
	add	x0, x19, 3928
	add	x1, x1, 3992
	add	x3, x19, 4056
	.p2align 2
.L1413:
	ldr	w2, [x1], 4
	str	w2, [x0], 4
	cmp	x3, x0
	bne	.L1413
	add	x1, x21, 16384
	ldrb	w0, [x1, 2594]
	str	w0, [x26, 1004]
	ldr	w1, [x1, 2636]
	str	w1, [x26, 1008]
	cbz	w0, .L1425
	ldrb	w0, [x25, 1584]
	cbz	w0, .L1426
.L1425:
	cmp	w1, 1
	beq	.L1489
.L1427:
	add	x20, x20, 4096
	ldr	x0, [x21, 632]
	add	x20, x21, x20, lsl 3
	str	x0, [x20, 32248]
	str	xzr, [x21, 632]
.L1371:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1486:
	strb	w1, [x0, 1628]
	ldr	x1, [x27, 28696]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 1629]
	ldr	x1, [x27, 28696]
	ldr	w1, [x1, 12]
	str	w1, [x0, 1652]
	b	.L1418
	.p2align 3
.L1389:
	ldr	w2, [x19, 32]
	ldr	w1, [x0, 728]
	cmp	w1, w2
	csel	w1, w1, w2, ge
	str	w1, [x0, 728]
	ldr	w1, [x0, 732]
	cmp	w1, w2
	csel	w1, w1, w2, le
	str	w1, [x0, 732]
	b	.L1390
	.p2align 3
.L1386:
	ldrb	w1, [x25, 1586]
	ldr	x2, [x22, 2680]
	cbnz	w1, .L1388
	ldr	w1, [x2, 700]
	madd	w0, w7, w1, w0
	ldr	w1, [x26, 1904]
	udiv	w0, w0, w1
	str	w0, [x2, 784]
	b	.L1387
	.p2align 3
.L1437:
	mov	w1, 0
	b	.L1416
	.p2align 3
.L1393:
	ldr	w1, [x1, 656]
	ldr	w0, [x26, 1980]
	bl	FSP_GetLogicFs
	cbz	x0, .L1490
	ldr	x0, [x0, 32]
	ldr	w23, [x0, 4]
	b	.L1392
	.p2align 3
.L1484:
	ldr	w1, [x4, 44]
	strb	w1, [x19, 4]
	b	.L1383
	.p2align 3
.L1372:
	add	x25, x21, 20480
	mov	w4, 2208
	ldr	x0, [x21, 14968]
	mov	w6, 4000
	ldr	x2, [x21, 14960]
	ldr	w1, [x25, 1592]
	umull	x1, w1, w4
	add	x4, x0, x1
	ldr	w0, [x4, 28]
	umull	x0, w0, w6
	add	x6, x2, x0
	b	.L1373
	.p2align 3
.L1404:
	ldr	w0, [x25, 1624]
	mov	w28, 0
	cbnz	w0, .L1456
	b	.L1412
	.p2align 3
.L1491:
	cbz	x0, .L1433
	ldr	x0, [x0, 32]
	ldr	w1, [x0, 4]
.L1410:
	lsl	x0, x22, 5
	add	w28, w28, 1
	add	x0, x0, x22, lsl 2
	add	x0, x19, x0
	str	w1, [x0, 1640]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 696]
	str	w1, [x0, 1644]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 672]
	str	w1, [x0, 1632]
	ldr	x1, [x27, 28696]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 1627]
	ldr	x1, [x27, 28696]
	ldrb	w1, [x1]
	strb	w1, [x0, 1626]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 716]
	str	w1, [x0, 1648]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 764]
	str	w1, [x0, 1652]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 812]
	str	w1, [x0, 1656]
	strb	wzr, [x0, 1624]
	ldr	w0, [x25, 1624]
	cmp	w0, w28
	bls	.L1412
.L1456:
	uxtw	x22, w28
	ldr	w0, [x26, 1980]
	add	x27, x21, x22, lsl 3
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 656]
	bl	FSP_GetLogicFs
	ldr	x2, [x27, 28696]
	lsl	x1, x22, 5
	add	x1, x1, x22, lsl 2
	add	x1, x19, x1
	ldr	x2, [x2, 40]
	ldr	w2, [x2, 692]
	str	w2, [x1, 1636]
	ldr	x2, [x27, 28696]
	ldr	x2, [x2, 40]
	ldrb	w2, [x2, 1]
	strb	w2, [x1, 1625]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1]
	cmp	w1, 1
	bne	.L1491
	mov	w1, w23
	b	.L1410
	.p2align 3
.L1433:
	mov	w1, 0
	b	.L1410
	.p2align 3
.L1412:
	ldrb	w0, [x25, 1584]
	cmp	w0, 1
	bne	.L1407
	ldr	w0, [x25, 1628]
	cbz	w0, .L1407
	mov	w27, 0
	b	.L1415
	.p2align 3
.L1492:
	cbz	x0, .L1435
	ldr	x0, [x0, 32]
	ldr	w1, [x0, 4]
.L1414:
	lsl	x0, x22, 5
	add	w27, w27, 1
	add	x0, x0, x22, lsl 2
	add	x0, x19, x0
	str	w1, [x0, 1640]
	ldr	x1, [x23, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 696]
	str	w1, [x0, 2796]
	ldr	x1, [x23, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 672]
	str	w1, [x0, 2784]
	ldr	x1, [x23, 28960]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2779]
	ldr	x1, [x23, 28960]
	ldrb	w1, [x1]
	strb	w1, [x0, 2778]
	ldr	x1, [x23, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 716]
	str	w1, [x0, 2800]
	ldr	x1, [x23, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 764]
	str	w1, [x0, 2804]
	ldr	x1, [x23, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 812]
	str	w1, [x0, 2808]
	strb	wzr, [x0, 2776]
	ldr	w0, [x25, 1628]
	cmp	w0, w27
	bls	.L1407
.L1415:
	uxtw	x22, w27
	ldr	w0, [x26, 1980]
	add	x23, x21, x22, lsl 3
	ldr	x1, [x23, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 656]
	bl	FSP_GetLogicFs
	ldr	x1, [x23, 28960]
	ldr	x1, [x1, 40]
	ldr	w2, [x1, 692]
	lsl	x1, x22, 5
	add	x1, x1, x22, lsl 2
	add	x1, x19, x1
	str	w2, [x1, 2788]
	ldr	x2, [x23, 28960]
	ldr	x2, [x2, 40]
	ldrb	w2, [x2, 1]
	strb	w2, [x1, 2777]
	ldr	x1, [x23, 28960]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1]
	cmp	w1, 1
	bne	.L1492
	mov	w1, w24
	b	.L1414
	.p2align 3
.L1399:
	ldr	w1, [x1, 656]
	ldr	w0, [x26, 1980]
	bl	FSP_GetLogicFs
	cbz	x0, .L1493
	ldr	x0, [x0, 32]
	ldr	w24, [x0, 4]
	b	.L1398
	.p2align 3
.L1388:
	ldr	w1, [x2, 700]
	madd	w0, w7, w1, w0
	ldr	w1, [x26, 1904]
	udiv	w0, w0, w1
	str	w0, [x2, 832]
	b	.L1387
.L1489:
	ldrb	w0, [x25, 1584]
	cmp	w0, 1
	bne	.L1427
.L1426:
	ldr	w0, [x25, 1644]
	mov	w2, 0
	str	w0, [x19, 80]
	ldr	w0, [x25, 1648]
	str	w0, [x19, 84]
	.p2align 2
.L1428:
	ubfiz	x0, x2, 2, 32
	add	w2, w2, 1
	add	x1, x21, x0
	add	x0, x19, x0
	add	x1, x1, 20480
	ldr	w3, [x1, 1652]
	str	w3, [x0, 88]
	ldr	w3, [x1, 1780]
	str	w3, [x0, 216]
	ldr	w3, [x1, 1908]
	str	w3, [x0, 344]
	ldr	w3, [x1, 2420]
	str	w3, [x0, 856]
	ldr	w3, [x1, 2548]
	str	w3, [x0, 984]
	ldr	w1, [x1, 2676]
	str	w1, [x0, 1112]
	ldr	w0, [x25, 1636]
	cmp	w0, w2
	bcs	.L1428
	ldrb	w0, [x25, 1584]
	cmp	w0, 1
	bne	.L1427
	mov	w2, 0
	.p2align 2
.L1429:
	ubfiz	x0, x2, 2, 32
	add	w2, w2, 1
	add	x1, x21, x0
	add	x0, x19, x0
	add	x1, x1, 20480
	ldr	w3, [x1, 2036]
	str	w3, [x0, 472]
	ldr	w3, [x1, 2164]
	str	w3, [x0, 600]
	ldr	w3, [x1, 2292]
	str	w3, [x0, 728]
	ldr	w3, [x1, 2804]
	str	w3, [x0, 1240]
	ldr	w3, [x1, 2932]
	str	w3, [x0, 1368]
	ldr	w1, [x1, 3060]
	str	w1, [x0, 1496]
	ldr	w0, [x25, 1640]
	cmp	w0, w2
	bcs	.L1429
	b	.L1427
.L1435:
	mov	w1, 0
	b	.L1414
.L1488:
	ldr	w0, [x25, 1628]
	cbz	w0, .L1407
	mov	w27, 0
	b	.L1424
	.p2align 3
.L1495:
	cbz	x0, .L1439
	ldr	x0, [x0, 32]
	ldr	w1, [x0, 4]
.L1421:
	lsl	x0, x22, 5
	add	x0, x0, x22, lsl 2
	add	x0, x19, x0
	str	w1, [x0, 2792]
	ldr	x1, [x23, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 696]
	str	w1, [x0, 2796]
	ldr	x1, [x23, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 672]
	str	w1, [x0, 2784]
	ldr	x1, [x23, 28960]
	ldrb	w1, [x1]
	strb	w1, [x0, 2776]
	ldr	x1, [x23, 28960]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1, 704]
	strb	w1, [x0, 2778]
	ldr	x1, [x23, 28960]
	ldrb	w1, [x1]
	cmp	w1, 1
	beq	.L1494
	strb	w1, [x0, 2782]
	ldr	x1, [x23, 28960]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2783]
	ldr	x1, [x23, 28960]
	ldr	w1, [x1, 12]
	str	w1, [x0, 2808]
.L1423:
	ldr	w0, [x25, 1628]
	add	w27, w27, 1
	cmp	w0, w27
	bls	.L1407
.L1424:
	uxtw	x22, w27
	ldr	w0, [x26, 1980]
	add	x23, x21, x22, lsl 3
	ldr	x1, [x23, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 656]
	bl	FSP_GetLogicFs
	ldr	x1, [x23, 28960]
	ldr	x1, [x1, 40]
	ldr	w2, [x1, 692]
	lsl	x1, x22, 5
	add	x1, x1, x22, lsl 2
	add	x1, x19, x1
	str	w2, [x1, 2788]
	ldr	x2, [x23, 28960]
	ldr	x2, [x2, 40]
	ldrb	w2, [x2, 1]
	strb	w2, [x1, 2777]
	ldr	x1, [x23, 28960]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1]
	cmp	w1, 1
	bne	.L1495
	mov	w1, w24
	b	.L1421
	.p2align 3
.L1494:
	strb	w1, [x0, 2780]
	ldr	x1, [x23, 28960]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2781]
	ldr	x1, [x23, 28960]
	ldr	w1, [x1, 12]
	str	w1, [x0, 2804]
	b	.L1423
.L1439:
	mov	w1, 0
	b	.L1421
.L1493:
	ldr	x1, .LC141
	mov	w2, 7332
	bl	dprint_vfmw
	b	.L1371
.L1490:
	ldr	x1, .LC141
	mov	w2, 7311
	bl	dprint_vfmw
	b	.L1371
	.size	WriteSliceMsg, .-WriteSliceMsg
	.align	3
.LC141:
	.xword	.LC140
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_GetPicStreamSize
	.type	H264_GetPicStreamSize, %function
H264_GetPicStreamSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 65536
	bl	_mcount
	mov	w0, 0
	ldr	x2, [x19, 1648]
	cbz	x2, .L1497
	.p2align 2
.L1498:
	ldp	w3, w1, [x2, 8]
	ldr	x2, [x2, 4056]
	add	w1, w3, w1
	add	w1, w1, 7
	add	w0, w0, w1, lsr 3
	cbnz	x2, .L1498
.L1497:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H264_GetPicStreamSize, .-H264_GetPicStreamSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SliceCheck
	.type	SliceCheck, %function
SliceCheck:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 20480
	add	x20, x19, 65536
	bl	_mcount
	ldr	x1, .LC143
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1632]
	ldr	w1, [x20, 1920]
	cbnz	w1, .L1511
	mov	w1, 262143
	cmp	w0, w1
	bhi	.L1512
	ldr	w1, [x19, 14932]
	ldr	w2, [x19, 14936]
	mul	w1, w1, w2
	sub	w1, w1, #1
	cmp	w0, w1
	bhi	.L1511
	ldr	x1, .LC147
	mov	x0, x19
	bl	ue_v
	mov	w2, w0
	ldr	x1, .LC149
	mov	w19, w0
	mov	w0, 19
	bl	dprint_vfmw
	ldr	w0, [x20, 1920]
	cbnz	w0, .L1511
	cmp	w19, 9
	bls	.L1513
	ldr	x1, .LC152
	mov	w2, w19
	mov	w0, 1
	bl	dprint_vfmw
.L1511:
	mov	w0, -1
.L1503:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1513:
	ldr	x0, .LC150
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx1508
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1508:
	.section	.rodata
	.align	0
	.align	2
.L1508:
	.byte	(.L1507 - .Lrtx1508) / 4
	.byte	(.L1509 - .Lrtx1508) / 4
	.byte	(.L1510 - .Lrtx1508) / 4
	.byte	(.L1507 - .Lrtx1508) / 4
	.byte	(.L1510 - .Lrtx1508) / 4
	.byte	(.L1507 - .Lrtx1508) / 4
	.byte	(.L1509 - .Lrtx1508) / 4
	.byte	(.L1510 - .Lrtx1508) / 4
	.byte	(.L1507 - .Lrtx1508) / 4
	.byte	(.L1510 - .Lrtx1508) / 4
	.text
	.p2align 3
.L1507:
	strb	wzr, [x21, 1584]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1510:
	mov	w1, 2
	strb	w1, [x21, 1584]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1509:
	mov	w1, 1
	strb	w1, [x21, 1584]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1512:
	ldr	x1, .LC145
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1503
	.size	SliceCheck, .-SliceCheck
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
.LC150:
	.xword	.L1508
	.align	3
.LC152:
	.xword	.LC151
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PPSSPSCheck
	.type	PPSSPSCheck, %function
PPSSPSCheck:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 20480
	bl	_mcount
	ldr	x1, .LC154
	mov	w0, 19
	ldr	w2, [x20, 1592]
	bl	dprint_vfmw
	ldr	w2, [x20, 1592]
	mov	w1, 2208
	ldr	x3, [x19, 14968]
	umull	x0, w2, w1
	adds	x0, x3, x0
	beq	.L1520
	ldrb	w1, [x0, 19]
	cbz	w1, .L1521
	ldr	w2, [x0, 28]
	mov	w0, 4000
	ldr	x1, [x19, 14960]
	umull	x0, w2, w0
	adds	x0, x1, x0
	beq	.L1522
	ldrb	w1, [x0, 23]
	mov	w0, 0
	cbz	w1, .L1523
.L1516:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1521:
	ldr	x1, .LC158
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1516
	.p2align 3
.L1523:
	ldr	x1, .LC160
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1516
.L1520:
	ldr	x2, .LC155
	mov	w3, 7798
	ldr	x1, .LC156
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1516
.L1522:
	ldr	x2, .LC155
	mov	w3, 7809
	ldr	x1, .LC156
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1516
	.size	PPSSPSCheck, .-PPSSPSCheck
	.align	3
.LC154:
	.xword	.LC153
	.align	3
.LC155:
	.xword	.LC30
	.align	3
.LC156:
	.xword	.LC32
	.align	3
.LC158:
	.xword	.LC157
	.align	3
.LC160:
	.xword	.LC159
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PPSSPSCheckTmpId
	.type	PPSSPSCheckTmpId, %function
PPSSPSCheckTmpId:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	x1, .LC162
	mov	w2, w20
	mov	w0, 19
	bl	dprint_vfmw
	cbz	x19, .L1530
	mov	w0, 2208
	ldr	x1, [x19, 14968]
	umull	x0, w20, w0
	add	x0, x1, x0
	ldrb	w1, [x0, 19]
	cbz	w1, .L1531
	ldr	w1, [x19, 14944]
	ldr	w2, [x0, 28]
	sub	w0, w1, #1
	cmp	w2, w0
	bhi	.L1532
	mov	w1, 4000
	ldr	x3, [x19, 14960]
	mov	w0, 0
	umull	x1, w2, w1
	add	x1, x3, x1
	ldrb	w1, [x1, 23]
	cbz	w1, .L1533
.L1526:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1531:
	ldr	x1, .LC166
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1526
	.p2align 3
.L1532:
	ldr	x1, .LC168
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1526
	.p2align 3
.L1533:
	ldr	x1, .LC170
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1526
.L1530:
	ldr	x2, .LC163
	mov	w3, 7837
	ldr	x1, .LC164
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1526
	.size	PPSSPSCheckTmpId, .-PPSSPSCheckTmpId
	.align	3
.LC162:
	.xword	.LC161
	.align	3
.LC163:
	.xword	.LC30
	.align	3
.LC164:
	.xword	.LC32
	.align	3
.LC166:
	.xword	.LC165
	.align	3
.LC168:
	.xword	.LC167
	.align	3
.LC170:
	.xword	.LC169
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsNewPic
	.type	IsNewPic, %function
IsNewPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1547
	add	x1, x19, 20480
	ldr	w2, [x19, 15012]
	ldr	w0, [x1, 1592]
	ldr	w3, [x1, 3232]
	ldr	w6, [x1, 3228]
	cmp	w3, w0
	ldr	w5, [x1, 3240]
	ldr	w0, [x1, 1600]
	ccmp	w6, w2, 0, eq
	ldrb	w4, [x1, 1585]
	cset	w2, ne
	ldrb	w3, [x1, 3224]
	cmp	w5, w0
	ccmp	w3, w4, 0, eq
	cset	w0, ne
	cmp	w4, wzr
	ccmp	w3, wzr, 4, ne
	orr	w2, w2, w0
	mov	w0, w2
	bne	.L1548
	ldr	w3, [x1, 1612]
	ldr	w2, [x1, 3236]
	cmp	w2, w3
	beq	.L1543
.L1551:
	cmp	w3, wzr
	ccmp	w2, wzr, 4, ne
	cset	w3, eq
.L1539:
	ldrb	w5, [x1, 3226]
	ldrb	w4, [x1, 1587]
	cmp	w5, w4
	cset	w2, ne
	cmp	w5, 5
	ccmp	w4, 5, 0, eq
	orr	w2, w2, w0
	orr	w2, w2, w3
	beq	.L1549
.L1540:
	add	x19, x19, 16384
	ldr	w0, [x19, 792]
	cbz	w0, .L1550
	cmp	w0, 1
	bne	.L1542
	ldr	w4, [x1, 752]
	ldr	w5, [x1, 3256]
	ldr	w0, [x1, 756]
	ldr	w3, [x1, 3260]
	cmp	w5, w4
	ccmp	w3, w0, 0, eq
	cset	w0, ne
	orr	w2, w2, w0
.L1542:
	ldr	w3, [x1, 1632]
	mov	w0, 19
	ldr	x1, .LC174
	cmp	w3, wzr
	cset	w19, eq
	orr	w19, w19, w2
	mov	w2, w19
	bl	dprint_vfmw
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1550:
	ldr	w4, [x1, 704]
	ldr	w5, [x1, 3248]
	ldr	w0, [x1, 708]
	ldr	w3, [x1, 3252]
	cmp	w5, w4
	ccmp	w3, w0, 0, eq
	cset	w0, ne
	orr	w2, w2, w0
	b	.L1542
	.p2align 3
.L1548:
	ldrb	w3, [x1, 3225]
	ldrb	w0, [x1, 1586]
	cmp	w3, w0
	ldr	w3, [x1, 1612]
	cset	w0, ne
	orr	w0, w2, w0
	ldr	w2, [x1, 3236]
	cmp	w2, w3
	bne	.L1551
.L1543:
	mov	w3, 0
	b	.L1539
	.p2align 3
.L1547:
	ldr	x2, .LC171
	mov	w3, 7877
	ldr	x1, .LC172
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1549:
	ldr	w0, [x1, 1620]
	ldr	w3, [x1, 3244]
	cmp	w3, w0
	cset	w0, ne
	orr	w2, w2, w0
	b	.L1540
	.size	IsNewPic, .-IsNewPic
	.align	3
.LC171:
	.xword	.LC30
	.align	3
.LC172:
	.xword	.LC32
	.align	3
.LC174:
	.xword	.LC173
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ref_pic_list_reordering
	.type	ref_pic_list_reordering, %function
ref_pic_list_reordering:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 20480
	mov	w23, 1
	bl	_mcount
	mov	w1, 2208
	ldr	x5, [x19, 14968]
	ldr	w2, [x20, 1592]
	mov	w0, 4000
	ldr	x4, [x19, 14960]
	ldrb	w3, [x20, 1585]
	umull	x1, w2, w1
	add	x1, x5, x1
	ldr	w1, [x1, 28]
	strb	wzr, [x20, 796]
	strb	wzr, [x20, 797]
	umull	x0, w1, w0
	add	x0, x4, x0
	ldr	w0, [x0, 2196]
	cbz	w3, .L1553
	add	w0, w0, 5
	add	x22, x19, 65536
	lsl	w23, w23, w0
	ldrb	w0, [x20, 1584]
	cmp	w0, 1
	bls	.L1604
.L1603:
	ldr	w3, [x22, 1920]
.L1571:
	cmp	w3, wzr
	csetm	w0, ne
.L1602:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1553:
	add	w0, w0, 4
	add	x22, x19, 65536
	lsl	w23, w23, w0
	ldrb	w0, [x20, 1584]
	cmp	w0, 1
	bhi	.L1603
.L1604:
	ldr	x1, .LC176
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 796]
	cbz	w0, .L1562
	ldr	w0, [x20, 1636]
	cmn	w0, #2
	beq	.L1585
	ldr	x24, .LC178
	mov	w27, 0
	ldr	x26, .LC186
	ldr	x25, .LC182
	b	.L1568
	.p2align 3
.L1563:
	cmp	w0, 2
	beq	.L1605
.L1566:
	ldr	w0, [x20, 1636]
	add	w0, w0, 2
	cmp	w0, w27
	bls	.L1606
.L1568:
	add	x21, x19, x27, uxtw 2
	mov	x1, x24
	add	x21, x21, 20480
	mov	x0, x19
	add	w27, w27, 1
	bl	ue_v
	cmp	w0, 3
	str	w0, [x21, 800]
	ldr	w3, [x22, 1920]
	bhi	.L1559
	cbnz	w3, .L1559
	beq	.L1562
	cmp	w0, 1
	bhi	.L1563
	mov	x1, x25
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1064]
	cmp	w23, w0
	ldr	w3, [x22, 1920]
	bls	.L1565
	cbz	w3, .L1566
.L1565:
	ldr	x1, .LC184
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1602
	.p2align 3
.L1562:
	ldrb	w0, [x20, 1584]
.L1555:
	cmp	w0, 1
	bne	.L1603
	ldr	x1, .LC190
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 797]
	cbz	w0, .L1603
	ldr	w0, [x20, 1640]
	cmn	w0, #2
	beq	.L1603
	ldr	x24, .LC192
	mov	w27, 0
	ldr	x26, .LC200
	ldr	x25, .LC196
	b	.L1583
	.p2align 3
.L1577:
	cmp	w0, 2
	beq	.L1607
	ldr	w0, [x20, 1640]
	add	w0, w0, 2
	cmp	w27, w0
	beq	.L1584
.L1582:
	add	w27, w27, 1
	cmp	w27, w0
	bcs	.L1603
.L1583:
	add	x21, x19, x27, uxtw 2
	mov	x1, x24
	add	x21, x21, 20480
	mov	x0, x19
	bl	ue_v
	cmp	w0, 3
	str	w0, [x21, 932]
	ldr	w3, [x22, 1920]
	bhi	.L1575
	cbnz	w3, .L1575
	beq	.L1571
	cmp	w0, 1
	bhi	.L1577
	mov	x1, x25
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1196]
	cmp	w23, w0
	ldr	w3, [x22, 1920]
	bls	.L1579
	cbnz	w3, .L1579
.L1580:
	ldr	w0, [x20, 1640]
	add	w0, w0, 2
	cmp	w0, w27
	bne	.L1582
	ldr	w1, [x21, 932]
	cmp	w1, 3
	beq	.L1582
.L1584:
	ldr	x1, .LC202
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1602
	.p2align 3
.L1605:
	mov	x1, x26
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1328]
	b	.L1566
	.p2align 3
.L1607:
	mov	x1, x26
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1456]
	b	.L1580
	.p2align 3
.L1559:
	ldr	x1, .LC180
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1602
	.p2align 3
.L1575:
	ldr	x1, .LC194
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1602
	.p2align 3
.L1606:
	bne	.L1562
.L1557:
	uxtw	x0, w27
	add	x0, x0, 4096
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 4896]
	cmp	w0, 3
	bne	.L1569
	ldrb	w0, [x20, 1584]
	add	x22, x19, 65536
	b	.L1555
.L1579:
	ldr	x1, .LC198
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1602
.L1585:
	mov	w27, 0
	b	.L1557
.L1569:
	ldr	x1, .LC188
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1602
	.size	ref_pic_list_reordering, .-ref_pic_list_reordering
	.align	3
.LC176:
	.xword	.LC175
	.align	3
.LC178:
	.xword	.LC177
	.align	3
.LC180:
	.xword	.LC179
	.align	3
.LC182:
	.xword	.LC181
	.align	3
.LC184:
	.xword	.LC183
	.align	3
.LC186:
	.xword	.LC185
	.align	3
.LC188:
	.xword	.LC187
	.align	3
.LC190:
	.xword	.LC189
	.align	3
.LC192:
	.xword	.LC191
	.align	3
.LC194:
	.xword	.LC193
	.align	3
.LC196:
	.xword	.LC195
	.align	3
.LC198:
	.xword	.LC197
	.align	3
.LC200:
	.xword	.LC199
	.align	3
.LC202:
	.xword	.LC201
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	pred_weight_table
	.type	pred_weight_table, %function
pred_weight_table:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x26, x0
	mov	x0, x30
	add	x21, x26, 20480
	mov	w24, 2208
	bl	_mcount
	mov	w20, 4000
	ldr	x2, [x26, 14968]
	mov	x0, x26
	ldr	w4, [x21, 1592]
	mov	w19, 1
	ldr	x1, .LC204
	mov	w25, 0
	ldr	x5, [x26, 14960]
	umull	x4, w4, w24
	add	x24, x2, x4
	ldr	w2, [x24, 28]
	umull	x2, w2, w20
	add	x20, x5, x2
	bl	ue_v
	str	w0, [x21, 1644]
	lsl	w23, w19, w0
	ldr	w1, [x20, 40]
	cbnz	w1, .L1633
.L1609:
	cmp	w0, 7
	bhi	.L1612
	ldr	w0, [x21, 1648]
	cmp	w0, 7
	bhi	.L1612
	add	x0, x26, 65536
	str	x0, [x29, 104]
	ldr	w2, [x0, 1920]
	cbnz	w2, .L1611
	ldr	x22, .LC210
	mov	w27, 0
	b	.L1620
	.p2align 3
.L1615:
	str	w23, [x1, 1652]
	add	x0, x26, x19, lsl 2
	str	wzr, [x1, 2420]
	add	x0, x0, 20480
	ldr	w1, [x20, 40]
	cbnz	w1, .L1634
.L1617:
	str	wzr, [x0, 1780]
	str	wzr, [x0, 1908]
	str	wzr, [x0, 2548]
	str	wzr, [x0, 2676]
.L1619:
	ldr	w0, [x21, 1636]
	add	w27, w27, 1
	cmp	w0, w27
	bcc	.L1635
.L1620:
	mov	x1, x22
	mov	x0, x26
	uxtw	x19, w27
	bl	u_1
	add	x1, x26, x19, lsl 2
	add	x1, x1, 20480
	cbz	w0, .L1615
	ldr	x1, .LC212
	mov	x0, x26
	bl	se_v
	add	x4, x26, x19, lsl 2
	ldr	x1, .LC214
	add	x28, x4, 20480
	str	w0, [x28, 1652]
	mov	x0, x26
	bl	se_v
	str	w0, [x28, 2420]
	add	x0, x26, x19, lsl 2
	ldr	w1, [x20, 40]
	add	x0, x0, 20480
	cbz	w1, .L1617
.L1634:
	ldr	x1, .LC216
	mov	x0, x26
	bl	u_1
	add	x1, x26, x19, lsl 2
	add	x1, x1, 20480
	cbnz	w0, .L1636
	str	w25, [x1, 1780]
	add	w27, w27, 1
	str	w25, [x1, 1908]
	str	wzr, [x1, 2548]
	str	wzr, [x1, 2676]
	ldr	w0, [x21, 1636]
	cmp	w0, w27
	bcs	.L1620
.L1635:
	ldr	w0, [x24, 44]
	cmp	w0, 1
	beq	.L1621
.L1622:
	ldr	x0, [x29, 104]
	ldr	w0, [x0, 1920]
	cmp	w0, wzr
	csetm	w0, ne
.L1614:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1636:
	ldr	x1, .LC218
	mov	x0, x26
	add	x19, x26, x19, lsl 2
	add	x19, x19, 20480
	bl	se_v
	ldr	x1, .LC220
	str	w0, [x19, 1780]
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 2548]
	ldr	x1, .LC218
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 1908]
	ldr	x1, .LC220
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 2676]
	b	.L1619
	.p2align 3
.L1633:
	ldr	x1, .LC206
	mov	x0, x26
	bl	ue_v
	mov	w25, w0
	ldr	w0, [x21, 1644]
	str	w25, [x21, 1648]
	lsl	w25, w19, w25
	b	.L1609
	.p2align 3
.L1621:
	ldrb	w0, [x21, 1584]
	cmp	w0, 1
	bne	.L1622
	ldr	x22, .LC222
	mov	w28, 0
	ldr	x27, .LC224
	b	.L1628
	.p2align 3
.L1623:
	add	x0, x26, x19, lsl 2
	add	x0, x0, 20480
	str	w23, [x0, 2036]
	str	wzr, [x0, 2804]
	add	x0, x26, x19, lsl 2
	add	x0, x0, 20480
	ldr	w1, [x20, 40]
	cbnz	w1, .L1637
.L1625:
	str	wzr, [x0, 2164]
	str	wzr, [x0, 2292]
	str	wzr, [x0, 2932]
	str	wzr, [x0, 3060]
.L1627:
	ldr	w0, [x21, 1640]
	add	w28, w28, 1
	cmp	w0, w28
	bcc	.L1622
.L1628:
	mov	x1, x22
	mov	x0, x26
	uxtw	x19, w28
	bl	u_1
	cbz	w0, .L1623
	mov	x1, x27
	mov	x0, x26
	bl	se_v
	add	x4, x26, x19, lsl 2
	ldr	x1, .LC226
	add	x24, x4, 20480
	str	w0, [x24, 2036]
	mov	x0, x26
	bl	se_v
	str	w0, [x24, 2804]
	add	x0, x26, x19, lsl 2
	ldr	w1, [x20, 40]
	add	x0, x0, 20480
	cbz	w1, .L1625
.L1637:
	ldr	x1, .LC228
	mov	x0, x26
	bl	u_1
	cbnz	w0, .L1638
	add	x0, x26, x19, lsl 2
	add	x0, x0, 20480
	str	w25, [x0, 2164]
	str	w25, [x0, 2292]
	str	wzr, [x0, 2932]
	str	wzr, [x0, 3060]
	b	.L1627
.L1612:
	add	x3, x26, 65536
	ldr	w2, [x3, 1920]
.L1611:
	ldr	x1, .LC208
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1614
.L1638:
	ldr	x1, .LC230
	mov	x0, x26
	add	x19, x26, x19, lsl 2
	add	x19, x19, 20480
	bl	se_v
	ldr	x1, .LC232
	str	w0, [x19, 2164]
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 2932]
	ldr	x1, .LC230
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 2292]
	ldr	x1, .LC232
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 3060]
	b	.L1627
	.size	pred_weight_table, .-pred_weight_table
	.align	3
.LC204:
	.xword	.LC203
	.align	3
.LC206:
	.xword	.LC205
	.align	3
.LC208:
	.xword	.LC207
	.align	3
.LC210:
	.xword	.LC209
	.align	3
.LC212:
	.xword	.LC211
	.align	3
.LC214:
	.xword	.LC213
	.align	3
.LC216:
	.xword	.LC215
	.align	3
.LC218:
	.xword	.LC217
	.align	3
.LC220:
	.xword	.LC219
	.align	3
.LC222:
	.xword	.LC221
	.align	3
.LC224:
	.xword	.LC223
	.align	3
.LC226:
	.xword	.LC225
	.align	3
.LC228:
	.xword	.LC227
	.align	3
.LC230:
	.xword	.LC229
	.align	3
.LC232:
	.xword	.LC231
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecMMCO
	.type	DecMMCO, %function
DecMMCO:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	w19, w1
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L1640
	mov	w22, 100
	ldr	x21, .LC236
	ldr	x25, .LC238
	add	x23, x20, 65536
	ldr	x27, .LC244
	ldr	x24, .LC242
	ldr	x26, .LC240
	b	.L1651
	.p2align 3
.L1652:
	cmp	w19, 2
	beq	.L1665
.L1653:
	cmp	w19, 6
	cset	w0, eq
	orr	w0, w28, w0
	cbnz	w0, .L1656
	cmp	w19, 4
	beq	.L1666
.L1657:
	cmp	w19, 6
	bhi	.L1649
	ldr	w0, [x23, 1920]
	cbnz	w0, .L1649
.L1667:
	cbz	w19, .L1659
.L1658:
	subs	w22, w22, #1
	beq	.L1660
.L1651:
	mov	x1, x21
	mov	x0, x20
	bl	ue_v
	cmp	w0, 3
	mov	w19, w0
	and	w0, w0, -3
	cset	w28, eq
	cmp	w0, 1
	bne	.L1652
	mov	x1, x25
	mov	x0, x20
	bl	ue_v
	cmp	w19, 2
	bne	.L1653
.L1665:
	mov	x1, x26
	mov	x0, x20
	bl	ue_v
	ldr	w0, [x23, 1920]
	cbz	w0, .L1667
	.p2align 2
.L1649:
	ldr	x1, .LC246
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
.L1643:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1656:
	mov	x1, x24
	mov	x0, x20
	bl	ue_v
	cmp	w19, 4
	bne	.L1657
.L1666:
	mov	x1, x27
	mov	x0, x20
	bl	ue_v
	ldr	w0, [x23, 1920]
	cbz	w0, .L1658
	b	.L1649
	.p2align 3
.L1640:
	ldr	x21, .LC236
	mov	w26, 0
	ldr	x25, .LC238
	add	x22, x20, 24576
	ldr	x24, .LC242
	add	x23, x20, 65536
	b	.L1642
	.p2align 3
.L1644:
	cmp	w1, 2
	beq	.L1668
.L1645:
	cmp	w1, 3
	ccmp	w1, 6, 4, ne
	beq	.L1669
.L1646:
	cmp	w1, 4
	beq	.L1670
.L1647:
	cmp	w1, 6
	bhi	.L1649
	ldr	w0, [x23, 1920]
	cbnz	w0, .L1649
	add	w26, w26, 1
	cbz	w1, .L1659
	cmp	w26, 100
	beq	.L1671
.L1642:
	ldr	w28, [x22, 3180]
	mov	x1, x21
	mov	x0, x20
	uxtw	x27, w26
	lsl	x19, x27, 4
	bl	ue_v
	uxtw	x28, w28
	mov	w1, w0
	lsl	x0, x28, 6
	sub	x0, x0, x28
	add	x19, x19, x27, lsl 2
	lsl	x0, x0, 2
	and	w2, w1, -3
	sub	x0, x0, x28
	cmp	w2, 1
	lsl	x0, x0, 1
	sub	x0, x0, x28
	add	x19, x19, x0, lsl 2
	add	x19, x20, x19
	add	x19, x19, 20480
	str	w1, [x19, 3272]
	bne	.L1644
	mov	x1, x25
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3276]
	ldr	w1, [x19, 3272]
	cmp	w1, 2
	bne	.L1645
.L1668:
	ldr	x1, .LC240
	mov	x0, x20
	bl	ue_v
	lsl	x1, x28, 6
	sub	x1, x1, x28
	lsl	x1, x1, 2
	sub	x1, x1, x28
	lsl	x1, x1, 1
	sub	x2, x1, x28
	lsl	x1, x27, 4
	add	x1, x1, x27, lsl 2
	add	x1, x1, x2, lsl 2
	add	x1, x20, x1
	add	x1, x1, 20480
	str	w0, [x1, 3280]
	ldr	w1, [x1, 3272]
	cmp	w1, 3
	ccmp	w1, 6, 4, ne
	bne	.L1646
	.p2align 2
.L1669:
	mov	x1, x24
	mov	x0, x20
	bl	ue_v
	lsl	x1, x28, 6
	lsl	x2, x27, 4
	sub	x1, x1, x28
	add	x2, x2, x27, lsl 2
	lsl	x1, x1, 2
	sub	x1, x1, x28
	lsl	x1, x1, 1
	sub	x1, x1, x28
	add	x2, x2, x1, lsl 2
	add	x2, x20, x2
	add	x2, x2, 20480
	ldr	w1, [x2, 3272]
	str	w0, [x2, 3284]
	cmp	w1, 4
	bne	.L1647
.L1670:
	ldr	x1, .LC244
	mov	x0, x20
	bl	ue_v
	lsl	x1, x28, 6
	sub	x1, x1, x28
	lsl	x1, x1, 2
	sub	x1, x1, x28
	lsl	x1, x1, 1
	sub	x28, x1, x28
	lsl	x1, x27, 4
	add	x3, x1, x27, lsl 2
	add	x3, x3, x28, lsl 2
	add	x3, x20, x3
	add	x3, x3, 20480
	ldr	w1, [x3, 3272]
	str	w0, [x3, 3288]
	b	.L1647
	.p2align 3
.L1659:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L1671:
	ldr	x1, .LC234
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1643
.L1660:
	mov	w0, -1
	b	.L1643
	.size	DecMMCO, .-DecMMCO
	.align	3
.LC234:
	.xword	.LC233
	.align	3
.LC236:
	.xword	.LC235
	.align	3
.LC238:
	.xword	.LC237
	.align	3
.LC240:
	.xword	.LC239
	.align	3
.LC242:
	.xword	.LC241
	.align	3
.LC244:
	.xword	.LC243
	.align	3
.LC246:
	.xword	.LC245
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	dec_ref_pic_marking
	.type	dec_ref_pic_marking, %function
dec_ref_pic_marking:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x20, x22, 24576
	bl	_mcount
	ldr	w24, [x20, 3180]
	cbz	x22, .L1697
	add	x23, x22, 65536
	mov	w19, w24
	ldr	w0, [x23, 1992]
	cmp	w0, 1
	beq	.L1698
.L1675:
	add	x0, x22, 20480
	ldrb	w1, [x0, 1589]
	cbz	w1, .L1676
	cmp	w19, wzr
	cset	w19, eq
	str	w19, [x20, 3180]
.L1684:
	ldrb	w0, [x0, 1587]
	cmp	w0, 5
	beq	.L1699
	ldr	x1, .LC256
	mov	x0, x22
	bl	u_1
	mov	w4, w0
	lsl	x3, x19, 6
	ldr	x1, .LC258
	sub	x3, x3, x19
	uxtb	w2, w0
	lsl	x3, x3, 2
	mov	w0, 16
	sub	x3, x3, x19
	lsl	x3, x3, 1
	sub	x19, x3, x19
	add	x19, x22, x19, lsl 2
	add	x19, x19, 20480
	strb	w4, [x19, 3271]
	bl	dprint_vfmw
	ldrb	w0, [x19, 3271]
	cbnz	w0, .L1678
.L1682:
	mov	w21, 0
.L1694:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1676:
	uxtw	x19, w19
	lsl	x21, x19, 6
	sub	x21, x21, x19
	lsl	x21, x21, 2
	sub	x21, x21, x19
	lsl	x21, x21, 1
	sub	x21, x21, x19
	add	x21, x22, x21, lsl 2
	add	x21, x21, 20480
	ldrb	w1, [x21, 3268]
	cbz	w1, .L1684
	ldrb	w0, [x0, 1587]
	cmp	w0, 5
	beq	.L1700
	ldr	x1, .LC256
	mov	x0, x22
	ldrb	w19, [x21, 3271]
	bl	u_1
	cmp	w19, w0
	bne	.L1701
	ldrb	w0, [x21, 3271]
	cbz	w0, .L1682
	mov	w1, 0
	mov	x0, x22
	bl	DecMMCO
	mov	w21, w0
	b	.L1694
	.p2align 3
.L1678:
	mov	w1, 1
	mov	x0, x22
	bl	DecMMCO
	cmn	w0, #1
	mov	w21, w0
	beq	.L1702
	mov	w0, 1
	strb	w0, [x19, 3268]
	mov	w21, 0
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1700:
	ldr	x1, .LC250
	mov	x0, x22
	ldrb	w19, [x21, 3269]
	bl	u_1
	cmp	w19, w0
	bne	.L1703
	ldr	x1, .LC252
	mov	x0, x22
	ldrb	w19, [x21, 3270]
	bl	u_1
	cmp	w19, w0
	beq	.L1682
	ldr	x1, .LC264
	mov	w0, 1
	mov	w21, -1
	bl	dprint_vfmw
	b	.L1694
	.p2align 3
.L1699:
	ldr	x1, .LC250
	mov	x0, x22
	mov	w21, 0
	bl	u_1
	lsl	x2, x19, 6
	ldr	x1, .LC252
	sub	x2, x2, x19
	lsl	x2, x2, 2
	sub	x2, x2, x19
	lsl	x2, x2, 1
	sub	x19, x2, x19
	add	x19, x22, x19, lsl 2
	add	x19, x19, 20480
	strb	w0, [x19, 3269]
	mov	x0, x22
	bl	u_1
	strb	w0, [x19, 3270]
	ldrb	w2, [x19, 3269]
	mov	w0, 16
	ldr	x1, .LC254
	bl	dprint_vfmw
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1698:
	add	x0, x22, 12288
	add	x0, x0, 2600
	bl	BsResidBits
	cmp	w0, 15
	ble	.L1687
	ldr	w19, [x20, 3180]
	b	.L1675
.L1701:
	ldr	x1, .LC266
	mov	w0, 1
	mov	w21, -1
	bl	dprint_vfmw
	ldr	x1, .LC268
	mov	w0, 1
	ldr	w4, [x23, 1924]
	ldr	w2, [x23, 1944]
	ldr	w3, [x23, 1960]
	bl	dprint_vfmw
	b	.L1694
.L1703:
	ldr	x1, .LC262
	mov	w0, 1
	mov	w21, -1
	bl	dprint_vfmw
	b	.L1694
.L1687:
	mov	w21, -1
	b	.L1694
.L1697:
	ldr	x2, .LC247
	mov	w3, 8305
	ldr	x1, .LC248
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L1694
.L1702:
	strb	wzr, [x19, 3268]
	mov	w0, 1
	ldr	x1, .LC260
	str	w24, [x20, 3180]
	bl	dprint_vfmw
	b	.L1694
	.size	dec_ref_pic_marking, .-dec_ref_pic_marking
	.align	3
.LC247:
	.xword	.LC30
	.align	3
.LC248:
	.xword	.LC32
	.align	3
.LC250:
	.xword	.LC249
	.align	3
.LC252:
	.xword	.LC251
	.align	3
.LC254:
	.xword	.LC253
	.align	3
.LC256:
	.xword	.LC255
	.align	3
.LC258:
	.xword	.LC257
	.align	3
.LC260:
	.xword	.LC259
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessSliceHeaderFirstPart
	.type	ProcessSliceHeaderFirstPart, %function
ProcessSliceHeaderFirstPart:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x23, x0
	mov	x0, x30
	bl	_mcount
	cbz	x23, .L1769
	ldr	x1, .LC272
	mov	x0, x23
	bl	ue_v
	mov	w21, w0
	ldr	w0, [x23, 14948]
	sub	w0, w0, #1
	cmp	w21, w0
	bhi	.L1707
	add	x24, x23, 65536
	ldr	w0, [x24, 1920]
	cbnz	w0, .L1707
	mov	w1, w21
	mov	x0, x23
	bl	PPSSPSCheckTmpId
	mov	w22, w0
	cbnz	w0, .L1770
	add	x19, x23, 20480
	mov	w1, 2208
	mov	w20, 4000
	umull	x1, w21, w1
	str	w21, [x19, 1592]
	ldrb	w0, [x19, 1587]
	ldr	x21, [x23, 14968]
	cmp	w0, 5
	ldr	x2, [x23, 14960]
	add	x21, x21, x1
	ldr	w0, [x21, 28]
	umull	x0, w0, w20
	add	x20, x2, x0
	beq	.L1710
	ldr	w0, [x20, 3244]
	cbz	w0, .L1710
.L1711:
	ldr	w1, [x20, 2196]
	mov	x0, x23
	ldr	x2, .LC280
	add	w1, w1, 4
	bl	u_v
	str	w0, [x19, 1600]
	ldr	w1, [x24, 1920]
	cbnz	w1, .L1735
	ldrb	w1, [x19, 1587]
	cmp	w1, 5
	beq	.L1771
.L1714:
	strb	wzr, [x19, 1585]
	strb	wzr, [x19, 1586]
	ldrb	w0, [x20, 18]
	cbz	w0, .L1772
	ldr	w1, [x20, 3252]
	ldr	w2, [x20, 3248]
	add	w0, w1, 1
	madd	w0, w2, w0, w0
.L1738:
	ldrb	w1, [x20, 19]
	cbnz	w1, .L1721
	strb	wzr, [x19, 1588]
.L1723:
	ldr	w1, [x19, 1632]
	cmp	w1, w0
	bcs	.L1773
.L1724:
	ldrb	w0, [x19, 1587]
	cmp	w0, 5
	beq	.L1774
.L1726:
	str	wzr, [x19, 704]
	str	wzr, [x19, 708]
	ldr	w0, [x20, 2200]
	cbz	w0, .L1775
.L1730:
	str	wzr, [x19, 752]
	str	wzr, [x19, 756]
	ldr	w0, [x20, 2200]
	cmp	w0, 1
	beq	.L1776
.L1733:
	ldr	w0, [x24, 1920]
	cbnz	w0, .L1735
	ldrb	w0, [x21, 17]
	cbz	w0, .L1736
	ldr	x1, .LC304
	mov	x0, x23
	bl	ue_v
	cbnz	w0, .L1737
	ldr	w0, [x24, 1920]
	cbnz	w0, .L1737
.L1736:
	mov	x0, x23
	bl	IsNewPic
	uxtb	w0, w0
	strb	w0, [x19, 1589]
	cbnz	w0, .L1749
	ldr	w1, [x19, 1632]
	ldr	w0, [x19, 3264]
	cmp	w1, w0
	bls	.L1777
.L1749:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1710:
	ldrb	w0, [x19, 1584]
	cmp	w0, 2
	beq	.L1711
	ldr	x1, .LC278
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1749
	.p2align 3
.L1721:
	mov	w1, 1
	strb	w1, [x19, 1588]
.L1740:
	ldr	w1, [x19, 1632]
	cmp	w1, w0, lsr 1
	bcc	.L1724
	ldr	x1, .LC288
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1749
	.p2align 3
.L1737:
	ldr	x1, .LC306
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC307
	ldr	x4, [x0]
	cbz	x4, .L1735
	ldr	w0, [x24, 1980]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	mov	w22, -1
	blr	x4
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1772:
	ldr	x1, .LC284
	mov	x0, x23
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x19, 1585]
	cbnz	w0, .L1778
	ldr	w2, [x20, 3252]
	ldr	w1, [x20, 3248]
	add	w0, w2, 1
	ldrb	w3, [x20, 18]
	madd	w1, w1, w0, w0
	lsl	w0, w1, 1
	cbz	w3, .L1738
.L1718:
	ldrb	w2, [x19, 1585]
	mov	w0, 1
	b	.L1719
	.p2align 3
.L1775:
	ldr	w1, [x20, 2204]
	mov	x0, x23
	ldr	x2, .LC296
	add	w1, w1, 4
	bl	u_v
	str	w0, [x19, 704]
	ldrb	w0, [x21, 1]
	cbz	w0, .L1730
	ldrb	w0, [x19, 1585]
	cbnz	w0, .L1730
	ldr	x1, .LC298
	mov	x0, x23
	bl	se_v
	str	w0, [x19, 708]
	b	.L1730
	.p2align 3
.L1771:
	str	w0, [x19, 1596]
	cbz	w0, .L1714
	ldr	x1, .LC282
	mov	w0, 1
	bl	dprint_vfmw
	b	.L1714
	.p2align 3
.L1776:
	ldrb	w0, [x20, 16]
	cbnz	w0, .L1733
	ldr	x1, .LC300
	mov	x0, x23
	bl	se_v
	str	w0, [x19, 752]
	ldrb	w0, [x21, 1]
	cmp	w0, 1
	bne	.L1733
	ldrb	w0, [x19, 1585]
	cbnz	w0, .L1733
	ldr	x1, .LC302
	mov	x0, x23
	bl	se_v
	str	w0, [x19, 756]
	b	.L1733
	.p2align 3
.L1735:
	mov	w22, -1
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1778:
	ldr	x1, .LC286
	mov	x0, x23
	bl	u_1
	strb	w0, [x19, 1586]
	ldr	w0, [x20, 3252]
	ldr	w1, [x20, 3248]
	ldrb	w2, [x20, 18]
	add	w0, w0, 1
	madd	w1, w1, w0, w0
	cbnz	w2, .L1718
	ldrb	w2, [x19, 1585]
	mov	w0, 2
.L1719:
	mul	w0, w0, w1
	cbz	w2, .L1738
	strb	wzr, [x19, 1588]
	cmp	w2, 1
	bne	.L1723
	b	.L1740
	.p2align 3
.L1774:
	ldr	x1, .LC292
	mov	x0, x23
	bl	ue_v
	str	w0, [x19, 1620]
	mov	w1, 65535
	cmp	w0, w1
	bhi	.L1727
	ldr	w0, [x24, 1920]
	cbz	w0, .L1726
.L1727:
	ldr	x1, .LC294
	mov	w0, 1
	bl	dprint_vfmw
	b	.L1726
	.p2align 3
.L1707:
	ldr	x1, .LC274
	mov	w2, w21
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1770:
	ldr	x1, .LC276
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1749
.L1769:
	ldr	x2, .LC269
	mov	w3, 8407
	ldr	x1, .LC270
	mov	w0, 0
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1749
.L1773:
	ldr	x1, .LC290
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1749
.L1777:
	ldr	x1, .LC309
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1749
	.size	ProcessSliceHeaderFirstPart, .-ProcessSliceHeaderFirstPart
	.align	3
.LC269:
	.xword	.LC30
	.align	3
.LC270:
	.xword	.LC32
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
	.align	3
.LC307:
	.xword	g_event_report
	.align	3
.LC309:
	.xword	.LC308
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessSliceHeaderSecondPart
	.type	ProcessSliceHeaderSecondPart, %function
ProcessSliceHeaderSecondPart:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L1865
	add	x19, x20, 20480
	ldr	w0, [x20, 14948]
	sub	w0, w0, #1
	ldr	w2, [x19, 1592]
	cmp	w0, w2
	bcc	.L1782
	add	x25, x20, 65536
	ldr	w0, [x25, 1920]
	cbnz	w0, .L1782
	mov	x0, x20
	bl	PPSSPSCheck
	cbnz	w0, .L1866
	ldr	w21, [x19, 1592]
	mov	w1, 2208
	ldr	x23, [x20, 14968]
	umull	x21, w21, w1
	adds	x22, x23, x21
	beq	.L1867
	ldrb	w1, [x19, 1584]
	cmp	w1, 1
	beq	.L1868
	ldr	w0, [x22, 36]
	cmp	w1, 1
	str	w0, [x19, 1636]
	ldr	w0, [x22, 40]
	str	w0, [x19, 1640]
	bls	.L1869
.L1787:
	cmp	w1, 2
	beq	.L1813
.L1797:
	mov	w0, 32
	str	w0, [x19, 1640]
.L1798:
	mov	x0, x20
	bl	ref_pic_list_reordering
	mov	w24, w0
	cbnz	w0, .L1870
	ldrb	w0, [x22, 2]
	cbz	w0, .L1800
	ldrb	w0, [x19, 1584]
	cbnz	w0, .L1800
	mov	w0, 1
	mov	w2, w0
.L1876:
	ldr	x1, .LC329
	strb	w0, [x19, 1591]
	mov	w0, 19
	bl	dprint_vfmw
	str	wzr, [x19, 1644]
	ldrb	w0, [x19, 1591]
	str	wzr, [x19, 1648]
	cbz	w0, .L1802
.L1872:
	mov	x0, x20
	bl	pred_weight_table
	cbz	w0, .L1802
	ldr	x1, .LC331
	mov	w0, 1
	mov	w24, -1
	bl	dprint_vfmw
	b	.L1833
	.p2align 3
.L1800:
	ldr	w0, [x22, 44]
	cmp	w0, 1
	beq	.L1871
.L1817:
	mov	w0, 0
	ldr	x1, .LC329
	strb	w0, [x19, 1591]
	mov	w2, 0
	mov	w0, 19
	bl	dprint_vfmw
	str	wzr, [x19, 1644]
	ldrb	w0, [x19, 1591]
	str	wzr, [x19, 1648]
	cbnz	w0, .L1872
.L1802:
	ldr	w0, [x19, 1612]
	cbnz	w0, .L1873
.L1803:
	str	wzr, [x19, 3188]
	ldrb	w0, [x23, x21]
	cbz	w0, .L1804
	ldrb	w0, [x19, 1584]
	cmp	w0, 1
	bls	.L1874
.L1804:
	ldr	x1, .LC339
	mov	x0, x20
	bl	se_v
	add	x1, x19, 3072
	stp	w0, wzr, [x1, 120]
	stp	wzr, wzr, [x1, 128]
	ldrb	w0, [x22, 3]
	cbnz	w0, .L1875
.L1833:
	mov	w0, w24
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1875:
	ldr	x1, .LC341
	mov	x0, x20
	bl	ue_v
	cmp	w0, 2
	str	w0, [x19, 3196]
	bhi	.L1807
	ldr	w1, [x25, 1920]
	cbnz	w1, .L1807
	cmp	w0, 1
	beq	.L1833
	ldr	x1, .LC345
	mov	x0, x20
	bl	se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x19, 3200]
	bhi	.L1810
	ldr	w0, [x25, 1920]
	cbnz	w0, .L1810
	ldr	x1, .LC349
	mov	x0, x20
	bl	se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x19, 3204]
	bhi	.L1812
	ldr	w0, [x25, 1920]
	cbz	w0, .L1833
.L1812:
	ldr	x1, .LC351
	mov	w0, 1
	mov	w24, -1
	bl	dprint_vfmw
	b	.L1833
	.p2align 3
.L1873:
	mov	x0, x20
	bl	dec_ref_pic_marking
	cbz	w0, .L1803
	ldr	x1, .LC333
	mov	w0, 1
	mov	w24, -1
	bl	dprint_vfmw
	b	.L1833
	.p2align 3
.L1813:
	mov	w0, 32
	str	w0, [x19, 1636]
	b	.L1797
	.p2align 3
.L1871:
	ldrb	w0, [x19, 1584]
	cmp	w0, 1
	bne	.L1817
	mov	w2, w0
	b	.L1876
	.p2align 3
.L1868:
	ldr	x1, .LC315
	mov	x0, x20
	bl	u_1
	strb	w0, [x19, 1590]
	ldrb	w1, [x19, 1584]
	ldr	w0, [x22, 36]
	str	w0, [x19, 1636]
	cmp	w1, 1
	ldr	w0, [x22, 40]
	str	w0, [x19, 1640]
	bhi	.L1787
	.p2align 2
.L1869:
	ldr	x1, .LC317
	mov	x0, x20
	bl	u_1
	cbnz	w0, .L1788
	ldr	w1, [x19, 1636]
.L1789:
	ldrb	w0, [x19, 1585]
	cbnz	w0, .L1790
	cmp	w1, 15
	bhi	.L1791
	ldr	w0, [x19, 1640]
	cmp	w0, 15
	bhi	.L1877
.L1792:
	ldr	w0, [x25, 1920]
	cbnz	w0, .L1791
.L1793:
	ldrb	w0, [x19, 1584]
	cmp	w0, 2
	beq	.L1813
	cmp	w0, 1
	beq	.L1798
	b	.L1797
	.p2align 3
.L1782:
	ldr	x1, .LC312
	mov	w0, 1
	mov	w24, -1
	bl	dprint_vfmw
	ldr	x25, [sp, 64]
	mov	w0, w24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1874:
	ldr	x1, .LC335
	mov	x0, x20
	bl	ue_v
	cmp	w0, 2
	str	w0, [x19, 3188]
	bhi	.L1805
	ldr	w0, [x25, 1920]
	cbz	w0, .L1804
.L1805:
	ldr	x1, .LC337
	mov	w0, 1
	mov	w24, -1
	bl	dprint_vfmw
	b	.L1833
	.p2align 3
.L1790:
	cmp	w1, 31
	bhi	.L1794
	ldr	w0, [x19, 1640]
	cmp	w0, 31
	bls	.L1795
	ldrb	w0, [x19, 1584]
	cmp	w0, 1
	bne	.L1795
.L1794:
	ldr	x1, .LC325
	mov	w0, 1
	mov	w24, -1
	bl	dprint_vfmw
	b	.L1833
	.p2align 3
.L1795:
	ldr	w0, [x25, 1920]
	cbz	w0, .L1793
	b	.L1794
	.p2align 3
.L1877:
	ldrb	w0, [x19, 1584]
	cmp	w0, 1
	bne	.L1792
.L1791:
	ldr	x1, .LC323
	mov	w0, 1
	mov	w24, -1
	bl	dprint_vfmw
	b	.L1833
	.p2align 3
.L1788:
	ldr	x1, .LC319
	mov	x0, x20
	bl	ue_v
	mov	w1, w0
	ldrb	w0, [x19, 1584]
	str	w1, [x19, 1636]
	cmp	w0, 1
	bne	.L1789
	ldr	x1, .LC321
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 1640]
	ldr	w1, [x19, 1636]
	b	.L1789
	.p2align 3
.L1810:
	ldr	x1, .LC347
	mov	w0, 1
	mov	w24, -1
	bl	dprint_vfmw
	b	.L1833
	.p2align 3
.L1807:
	ldr	x1, .LC343
	mov	w0, 1
	mov	w24, -1
	bl	dprint_vfmw
	b	.L1833
	.p2align 3
.L1866:
	ldr	x1, .LC313
	mov	w0, 1
	mov	w24, -1
	bl	dprint_vfmw
	b	.L1833
	.p2align 3
.L1870:
	ldr	x1, .LC327
	mov	w0, 1
	mov	w24, -1
	bl	dprint_vfmw
	b	.L1833
.L1865:
	ldr	x2, .LC310
	mov	w3, 8571
	ldr	x1, .LC311
	mov	w0, 0
	mov	w24, -1
	bl	dprint_vfmw
	b	.L1833
.L1867:
	ldr	x2, .LC310
	mov	w3, 8588
	ldr	x1, .LC311
	mov	w24, -1
	bl	dprint_vfmw
	b	.L1833
	.size	ProcessSliceHeaderSecondPart, .-ProcessSliceHeaderSecondPart
	.align	3
.LC310:
	.xword	.LC30
	.align	3
.LC311:
	.xword	.LC32
	.align	3
.LC312:
	.xword	.LC273
	.align	3
.LC313:
	.xword	.LC275
	.align	3
.LC315:
	.xword	.LC314
	.align	3
.LC317:
	.xword	.LC316
	.align	3
.LC319:
	.xword	.LC318
	.align	3
.LC321:
	.xword	.LC320
	.align	3
.LC323:
	.xword	.LC322
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ExitSlice
	.type	ExitSlice, %function
ExitSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1888
	add	x0, x19, 20480
	mov	w2, 2208
	ldr	x8, [x19, 14968]
	mov	w1, 4000
	ldr	x7, [x19, 14960]
	ldr	w4, [x0, 1592]
	ldrb	w3, [x0, 1585]
	ldr	w5, [x0, 1600]
	umull	x2, w4, w2
	ldr	w6, [x0, 1632]
	add	x2, x8, x2
	ldr	w2, [x2, 28]
	str	w4, [x0, 3232]
	umull	x1, w2, w1
	add	x1, x7, x1
	ldr	w2, [x1, 36]
	str	w2, [x0, 3228]
	strb	w3, [x0, 3224]
	str	w5, [x0, 3240]
	str	w6, [x0, 3264]
	cbnz	w3, .L1889
	ldrb	w2, [x0, 1587]
	ldr	w3, [x0, 1612]
	strb	w2, [x0, 3226]
	cmp	w2, 5
	str	w3, [x0, 3236]
	beq	.L1890
.L1882:
	ldr	w2, [x1, 2200]
	cbz	w2, .L1891
	cmp	w2, 1
	beq	.L1892
.L1884:
	add	x19, x19, 65536
	ldr	w0, [x19, 1936]
	add	w0, w0, 1
	str	w0, [x19, 1936]
.L1878:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1891:
	ldr	w2, [x0, 708]
	ldr	w3, [x0, 704]
	str	w3, [x0, 3248]
	str	w2, [x0, 3252]
	ldr	w2, [x1, 2200]
	cmp	w2, 1
	bne	.L1884
.L1892:
	ldr	w2, [x0, 752]
	ldr	w1, [x0, 756]
	str	w2, [x0, 3256]
	str	w1, [x0, 3260]
	b	.L1884
	.p2align 3
.L1889:
	ldrb	w2, [x0, 1586]
	strb	w2, [x0, 3225]
	ldrb	w2, [x0, 1587]
	ldr	w3, [x0, 1612]
	strb	w2, [x0, 3226]
	cmp	w2, 5
	str	w3, [x0, 3236]
	bne	.L1882
.L1890:
	ldr	w2, [x0, 1620]
	str	w2, [x0, 3244]
	b	.L1882
	.p2align 3
.L1888:
	ldr	x2, .LC352
	mov	w3, 8759
	ldr	x1, .LC353
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1878
	.size	ExitSlice, .-ExitSlice
	.align	3
.LC352:
	.xword	.LC30
	.align	3
.LC353:
	.xword	.LC32
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PicTypeStatistic
	.type	PicTypeStatistic, %function
PicTypeStatistic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1904
	add	x1, x19, 20480
	ldrb	w0, [x1, 1584]
	cmp	w0, 1
	beq	.L1896
	cbz	w0, .L1897
	cmp	w0, 2
	bne	.L1893
	ldrb	w0, [x1, 1587]
	add	x19, x19, 61440
	cmp	w0, 5
	beq	.L1905
.L1899:
	str	wzr, [x19, 2728]
.L1893:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1897:
	add	x19, x19, 61440
	ldr	w0, [x19, 2724]
	cmp	w0, 2
	beq	.L1899
	mov	w0, 1
	str	w0, [x19, 2724]
	b	.L1899
	.p2align 3
.L1896:
	add	x19, x19, 61440
	mov	w0, 2
	str	wzr, [x19, 2728]
	str	w0, [x19, 2724]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1905:
	mov	w0, 1
	str	w0, [x19, 2728]
	b	.L1893
	.p2align 3
.L1904:
	ldr	x2, .LC354
	mov	w3, 8810
	ldr	x1, .LC355
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1893
	.size	PicTypeStatistic, .-PicTypeStatistic
	.align	3
.LC354:
	.xword	.LC30
	.align	3
.LC355:
	.xword	.LC32
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CalcStreamBits
	.type	CalcStreamBits, %function
CalcStreamBits:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1931
	add	x0, x19, 16384
	ldrb	w0, [x0, 2592]
	cbnz	w0, .L1932
.L1909:
	ldr	x3, [x19, 632]
	ldrb	w21, [x3]
	cbz	w21, .L1919
	sub	w1, w21, #1
	mov	w4, 32
	mov	x2, 48
	add	x0, x3, 16
	mov	w20, 0
	umaddl	x2, w1, w4, x2
	add	x2, x3, x2
	.p2align 2
.L1911:
	ldr	w1, [x0], 32
	cmp	x0, x2
	add	w20, w20, w1
	bne	.L1911
.L1910:
	sbfiz	x4, x21, 5, 32
	ldr	w2, [x3, 72]
	add	x4, x3, x4
	ldr	w5, [x3, 80]
	ldr	x1, .LC359
	mov	w3, w20
	mov	w0, 7
	ldr	w4, [x4, 16]
	bl	dprint_vfmw
	ldr	x2, [x19, 632]
	ubfiz	x3, x21, 5, 8
	ldrb	w0, [x2]
	ldr	w1, [x2, 72]
	add	x0, x2, x0, lsl 5
	and	w1, w1, 7
	str	w1, [x0, 28]
	ldr	x2, [x19, 632]
	ldrb	w1, [x2]
	ldr	w0, [x2, 72]
	add	x1, x2, x1, lsl 5
	ldr	w2, [x1, 20]
	add	w0, w2, w0, lsr 3
	mov	w2, w21
	sub	w0, w0, w20
	str	w0, [x1, 32]
	ldr	x4, [x19, 632]
	ldrb	w1, [x4]
	ldr	w0, [x4, 72]
	add	x4, x4, x1, lsl 5
	ldr	w1, [x4, 16]
	add	w20, w20, w1
	lsl	w20, w20, 3
	sub	w0, w20, w0
	str	w0, [x4, 24]
	ldr	x1, [x19, 632]
	ldrb	w0, [x1]
	add	x0, x1, x0, lsl 5
	ldp	w4, w1, [x0, 28]
	ubfiz	w1, w1, 3, 2
	add	w1, w1, w4
	str	w1, [x0, 28]
	ldr	x1, .LC361
	ldr	x4, [x19, 632]
	ldrb	w0, [x4]
	add	x4, x4, x0, lsl 5
	mov	w0, 7
	ldr	w5, [x4, 32]
	and	w5, w5, -4
	str	w5, [x4, 32]
	ldr	x6, [x19, 632]
	add	x3, x6, x3
	ldrb	w5, [x6]
	ldp	w4, w3, [x3, 24]
	add	x5, x6, x5, lsl 5
	ldr	w5, [x5, 32]
	bl	dprint_vfmw
	ldr	x0, [x19, 632]
	ldr	w2, [x0, 76]
	sub	w1, w2, #1
	cmp	w1, 1
	bhi	.L1933
	ldrb	w20, [x0]
	add	w3, w20, 1
	cmp	w3, 1
	ccmp	w2, w3, 0, ls
	bls	.L1913
	ldr	x21, .LC365
	add	w20, w20, 2
	.p2align 2
.L1914:
	sub	w2, w20, #1
	mov	x1, x21
	ubfiz	x3, x2, 5, 32
	add	x4, x0, x3
	mov	w0, 7
	str	wzr, [x4, 28]
	ldr	x4, [x19, 632]
	add	x4, x4, x3
	ldr	w5, [x4, 20]
	str	w5, [x4, 32]
	ldr	x4, [x19, 632]
	add	x4, x4, x3
	ldr	w5, [x4, 16]
	lsl	w5, w5, 3
	str	w5, [x4, 24]
	ldr	x4, [x19, 632]
	add	x4, x4, x3
	ldp	w6, w5, [x4, 28]
	ubfiz	w5, w5, 3, 2
	add	w5, w5, w6
	str	w5, [x4, 28]
	ldr	x4, [x19, 632]
	add	x4, x4, x3
	ldr	w5, [x4, 32]
	and	w5, w5, -4
	str	w5, [x4, 32]
	ldr	x4, [x19, 632]
	add	x3, x4, x3
	ldp	w4, w3, [x3, 24]
	bl	dprint_vfmw
	ldr	x0, [x19, 632]
	cmp	w20, 1
	cset	w3, ls
	ldr	w1, [x0, 76]
	cmp	w1, w20
	add	w20, w20, 1
	cset	w2, hi
	tst	w3, w2
	bne	.L1914
	sub	w1, w1, #1
.L1913:
	ubfiz	x1, x1, 5, 32
	ldr	w2, [x0, 80]
	add	x0, x0, x1
	add	x5, x19, 61440
	ldr	w1, [x0, 24]
	sub	w1, w1, w2
	str	w1, [x0, 24]
	ldr	x3, [x19, 632]
	ldrb	w0, [x3]
	ldr	w4, [x3, 76]
	.p2align 2
.L1930:
	cmp	w0, w4
	bcs	.L1906
.L1934:
	ubfiz	x1, x0, 5, 32
	ldr	w2, [x5, 2752]
	add	x1, x3, x1
	add	w0, w0, 1
	ldr	w1, [x1, 32]
	cmp	w1, w2
	bcs	.L1930
	str	w1, [x5, 2752]
	ldr	w4, [x3, 76]
	cmp	w0, w4
	bcc	.L1934
.L1906:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1932:
	ldr	x1, [x19, 632]
	ldr	w0, [x1, 72]
	add	w0, w0, 7
	and	w0, w0, -8
	str	w0, [x1, 72]
	ldr	x1, [x19, 632]
	ldr	w0, [x1, 80]
	sub	w0, w0, #1
	str	w0, [x1, 80]
	b	.L1909
	.p2align 3
.L1933:
	ldr	x1, .LC363
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L1919:
	mov	w20, 0
	b	.L1910
.L1931:
	ldr	x2, .LC356
	mov	w3, 8864
	ldr	x1, .LC357
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1906
	.size	CalcStreamBits, .-CalcStreamBits
	.align	3
.LC356:
	.xword	.LC30
	.align	3
.LC357:
	.xword	.LC32
	.align	3
.LC359:
	.xword	.LC358
	.align	3
.LC361:
	.xword	.LC360
	.align	3
.LC363:
	.xword	.LC362
	.align	3
.LC365:
	.xword	.LC364
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsRefListWrong
	.type	IsRefListWrong, %function
IsRefListWrong:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L1966
	add	x21, x20, 20480
	ldr	w0, [x21, 1624]
	cbz	w0, .L1938
	mov	w19, 0
	add	x22, x20, 65536
	b	.L1942
	.p2align 3
.L1939:
	ldr	x0, [x0, 32]
	cbz	x0, .L1941
	ldr	w0, [x21, 1624]
	cmp	w0, w19
	bls	.L1967
.L1942:
	add	x1, x20, x19, sxtw 3
	ldr	w0, [x22, 1980]
	add	w19, w19, 1
	ldr	x1, [x1, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 656]
	bl	FSP_GetLogicFs
	cbnz	x0, .L1939
.L1941:
	mov	w0, -1
.L1969:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1938:
	mov	w0, 0
.L1962:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1967:
	cbz	w0, .L1938
	ldr	w0, [x21, 1628]
	mov	w19, 0
	cbnz	w0, .L1955
	b	.L1938
	.p2align 3
.L1968:
	ldr	x0, [x0, 32]
	cbz	x0, .L1941
	ldr	w0, [x21, 1628]
	cmp	w0, w19
	bls	.L1938
.L1955:
	add	x1, x20, x19, sxtw 3
	ldr	w0, [x22, 1980]
	add	w19, w19, 1
	ldr	x1, [x1, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 656]
	bl	FSP_GetLogicFs
	cbnz	x0, .L1968
	mov	w0, -1
	b	.L1969
.L1966:
	ldr	x2, .LC366
	mov	w3, 8973
	ldr	x1, .LC367
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1962
	.size	IsRefListWrong, .-IsRefListWrong
	.align	3
.LC366:
	.xword	.LC30
	.align	3
.LC367:
	.xword	.LC32
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Scaling_List
	.type	Scaling_List, %function
Scaling_List:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	stp	x4, x0, [x29, 96]
	mov	x0, x30
	mov	w20, w3
	mov	x21, x1
	mov	x23, x2
	bl	_mcount
	cmp	w20, wzr
	ble	.L1979
	sub	w19, w20, #1
	mov	w3, 8
	ldr	x25, .LC370
	add	x19, x19, 1
	mov	x28, 0
	mov	w24, w3
	mov	w22, 255
	b	.L1978
	.p2align 3
.L1975:
	lsr	w6, w27, 2
	str	w24, [x21, w27, uxtw 2]
	ubfiz	w0, w27, 3, 2
	and	w1, w24, 255
	lsl	w4, w22, w0
	lsl	w1, w1, w0
	ldr	w0, [x23, w6, sxtw 2]
	cmp	x19, x28
	bic	w0, w0, w4
	orr	w0, w0, w1
	str	w0, [x23, w6, sxtw 2]
	beq	.L1979
.L1978:
	cmp	w20, 16
	add	x0, x25, 16
	beq	.L1986
	ldrb	w27, [x28, x0]
.L1974:
	add	x28, x28, 1
	cbz	w3, .L1975
	ldr	x1, .LC372
	ldr	x0, [x29, 104]
	bl	se_v
	mov	w1, w0
	mov	w0, w24
	add	w26, w1, w24
	bl	check_signed_integer_operation_overflow
	cbnz	w0, .L1987
	mov	w0, w26
	mov	w1, 256
	add	w26, w26, 256
	bl	check_signed_integer_operation_overflow
	asr	w3, w26, 31
	cmp	w27, wzr
	lsr	w3, w3, 24
	cbnz	w0, .L1988
	add	w26, w26, w3
	ldr	x1, [x29, 96]
	and	w26, w26, 255
	sub	w3, w26, w3
	ccmp	w3, wzr, 0, eq
	cset	w0, eq
	cmp	w3, wzr
	csel	w24, w24, w3, eq
	str	w0, [x1]
	b	.L1975
	.p2align 3
.L1986:
	ldrb	w27, [x25, x28]
	b	.L1974
	.p2align 3
.L1979:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, 0
	ldp	x29, x30, [sp], 112
	ret
.L1987:
	ldr	x1, .LC374
	add	x2, x25, 80
	mov	w3, 9214
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L1988:
	ldr	x1, .LC374
	add	x2, x25, 80
	mov	w3, 9220
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.size	Scaling_List, .-Scaling_List
	.align	3
.LC370:
	.xword	.LANCHOR2
	.align	3
.LC372:
	.xword	.LC371
	.align	3
.LC374:
	.xword	.LC373
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessPPS
	.type	ProcessPPS, %function
ProcessPPS:
	stp	x29, x30, [sp, -128]!
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
	cbz	x19, .L2045
	cbz	x20, .L2046
	ldr	x1, .LC380
	mov	x0, x19
	add	x21, x19, 65536
	bl	u_1
	strb	w0, [x20]
	ldr	w0, [x21, 1920]
	cbnz	w0, .L2044
	ldr	x1, .LC382
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 1]
	ldr	w0, [x21, 1920]
	cbnz	w0, .L2044
	ldr	x1, .LC384
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 32]
	cbnz	w0, .L1995
	ldr	w0, [x21, 1920]
	cbz	w0, .L1996
.L1995:
	ldr	x1, .LC386
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC387
	ldr	x4, [x0]
	cbz	x4, .L2044
	ldr	w0, [x21, 1980]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
	mov	w0, -1
.L1991:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2054:
	ldr	x22, .LC426
	add	x24, x20, 2080
	ldr	x23, .LC376
	add	x25, x29, 96
	add	x26, x20, 448
	add	x28, x20, 11
	mov	w27, 0
.L2023:
	ldr	w0, [x20, 60]
	cmp	w0, 1
	beq	.L2047
	strb	wzr, [x28]
	str	wzr, [x25]
.L2017:
	ldr	w0, [x20, 28]
	mov	w1, 4000
	umull	x0, w0, w1
	ldr	x1, [x19, 14960]
	add	x0, x1, x0
	ldrb	w1, [x0, 25]
	cmp	w1, 1
	beq	.L2048
	add	x1, x23, 176
	ldr	x3, [x22, 104]
	cbz	w27, .L2049
.L2022:
	mov	x2, 64
	mov	x0, x24
	blr	x3
.L2019:
	add	w27, w27, 1
	add	x24, x24, 64
	cmp	w27, 2
	add	x25, x25, 4
	add	x26, x26, 256
	add	x28, x28, 1
	bne	.L2023
.L2024:
	ldr	x1, .LC421
	mov	x0, x19
	bl	se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x20, 56]
	bhi	.L2005
	ldr	w0, [x21, 1920]
	cbz	w0, .L2025
.L2005:
	ldr	x1, .LC430
	mov	w0, 1
	bl	dprint_vfmw
.L2044:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, -1
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L1996:
	ldr	x1, .LC389
	mov	x0, x19
	bl	ue_v
	cmp	w0, 31
	str	w0, [x20, 36]
	bhi	.L1997
	ldr	w0, [x21, 1920]
	cbnz	w0, .L1997
	ldr	x1, .LC393
	mov	x0, x19
	bl	ue_v
	cmp	w0, 31
	str	w0, [x20, 40]
	bhi	.L1999
	ldr	w0, [x21, 1920]
	cbnz	w0, .L1999
	ldr	x1, .LC397
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 2]
	ldr	w0, [x21, 1920]
	cbnz	w0, .L2044
	ldr	x2, .LC399
	mov	w1, 2
	mov	x0, x19
	bl	u_v
	cmp	w0, 2
	str	w0, [x20, 44]
	bhi	.L2050
	ldr	x1, .LC403
	mov	x0, x19
	bl	se_v
	str	w0, [x20, 48]
	ldr	x1, .LC405
	mov	x0, x19
	bl	se_v
	ldr	x1, .LC407
	mov	x0, x19
	bl	se_v
	str	w0, [x20, 52]
	ldr	x1, .LC409
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 3]
	ldr	x1, .LC411
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 4]
	ldr	x1, .LC413
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 17]
	cbnz	w0, .L2051
.L2002:
	ldr	w1, [x20, 52]
	add	x0, x19, 12288
	stp	w1, wzr, [x20, 56]
	strb	wzr, [x20, 18]
	add	x0, x0, 2600
	bl	BsResidBits
	ldr	x1, [x19, 632]
	ldr	w1, [x1, 80]
	add	w1, w1, 3
	cmp	w0, w1
	bcs	.L2003
.L2025:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, 0
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2003:
	ldr	x1, .LC417
	mov	x0, x19
	bl	u_1
	str	w0, [x20, 60]
	ldr	x1, .LC419
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x20, 18]
	bne	.L2024
	ldr	x28, .LC426
	add	x22, x29, 104
	ldr	x26, .LC423
	add	x24, x20, 5
	add	x23, x20, 1984
	add	x25, x20, 64
	mov	w27, 0
	b	.L2014
	.p2align 3
.L2056:
	ldr	w0, [x20, 28]
	mov	w1, 4000
	umull	x0, w0, w1
	ldr	x1, [x19, 14960]
	add	x0, x1, x0
	ldrb	w1, [x0, 25]
	cmp	w1, 1
	beq	.L2052
	ldr	x0, .LC426
	ldr	x3, [x0, 104]
	ldr	x0, .LC376
	add	x1, x0, 96
	cbz	w27, .L2053
.L2043:
	mov	x2, 16
	mov	x0, x23
	blr	x3
.L2009:
	add	w27, w27, 1
	add	x22, x22, 4
	cmp	w27, 6
	add	x24, x24, 1
	add	x23, x23, 16
	add	x25, x25, 64
	beq	.L2054
.L2014:
	mov	x1, x26
	mov	x0, x19
	bl	u_1
	cmp	w0, 1
	strb	w0, [x24]
	str	w0, [x22]
	beq	.L2055
	cmp	w27, wzr
	ccmp	w27, 3, 4, ne
	beq	.L2056
	sub	w1, w27, #1
	ldr	x3, [x28, 104]
	add	x1, x1, 124
	add	x1, x20, x1, lsl 4
	b	.L2043
	.p2align 3
.L2051:
	ldr	x1, .LC415
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2002
	.p2align 3
.L1997:
	ldr	x1, .LC391
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1991
	.p2align 3
.L2055:
	mov	x4, x22
	mov	w3, 16
	mov	x2, x23
	mov	x1, x25
	mov	x0, x19
	bl	Scaling_List
	cbnz	w0, .L2018
	ldr	w0, [x22]
	cmp	w0, 1
	bne	.L2009
	ldr	x0, .LC376
	cmp	w27, 2
	add	x1, x0, 80
	add	x0, x0, 96
	csel	x1, x0, x1, hi
.L2042:
	ldr	x0, .LC426
	mov	x2, 16
	ldr	x3, [x0, 104]
	mov	x0, x23
	blr	x3
	b	.L2009
	.p2align 3
.L1999:
	ldr	x1, .LC395
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1991
	.p2align 3
.L2052:
	uxtw	x1, w27
	add	x1, x0, x1, lsl 4
	add	x1, x1, 1972
	b	.L2042
.L2046:
	ldr	x2, .LC377
	mov	w3, 9259
	ldr	x1, .LC378
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1991
.L2047:
	ldr	x1, .LC428
	mov	x0, x19
	bl	u_1
	cmp	w0, 1
	strb	w0, [x28]
	str	w0, [x25]
	bne	.L2017
	mov	x4, x25
	mov	w3, 64
	mov	x2, x24
	mov	x1, x26
	mov	x0, x19
	bl	Scaling_List
	cbnz	w0, .L2018
	ldr	w0, [x25]
	cmp	w0, 1
	bne	.L2019
	ldr	x0, .LC426
	ldr	x3, [x0, 104]
	ldr	x0, .LC376
	add	x1, x0, 176
	cbnz	w27, .L2022
	add	x1, x0, 112
	b	.L2022
	.p2align 3
.L2048:
	ubfiz	x1, x27, 6, 32
	mov	x2, 64
	add	x1, x0, x1
	ldr	x0, .LC426
	add	x1, x1, 2068
	ldr	x3, [x0, 104]
	mov	x0, x24
	blr	x3
	b	.L2019
.L2050:
	ldr	x1, .LC401
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1991
.L2045:
	ldr	x2, .LC377
	mov	w3, 9258
	ldr	x1, .LC378
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1991
.L2018:
	ldr	x1, .LC425
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1991
.L2053:
	add	x1, x0, 80
	b	.L2043
.L2049:
	ldr	x1, .LC376
	add	x1, x1, 112
	b	.L2022
	.size	ProcessPPS, .-ProcessPPS
	.align	3
.LC376:
	.xword	.LANCHOR1
	.align	3
.LC377:
	.xword	.LC30
	.align	3
.LC378:
	.xword	.LC32
	.align	3
.LC380:
	.xword	.LC379
	.align	3
.LC382:
	.xword	.LC381
	.align	3
.LC384:
	.xword	.LC383
	.align	3
.LC386:
	.xword	.LC385
	.align	3
.LC387:
	.xword	g_event_report
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
.LC426:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC428:
	.xword	.LC427
	.align	3
.LC430:
	.xword	.LC429
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PPSEqual
	.type	PPSEqual, %function
PPSEqual:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cbz	x19, .L2079
	cbz	x20, .L2080
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
	ldr	w10, [x19, 60]
	cmp	w5, w4
	ldrb	w5, [x20, 2]
	ccmp	w3, w0, 0, eq
	ldr	w4, [x19, 44]
	cset	w3, eq
	cmp	w7, w5
	ldp	w0, w5, [x20, 44]
	ldr	w7, [x19, 52]
	and	w1, w1, w2
	ccmp	w4, w0, 0, eq
	ldr	w4, [x20, 52]
	cset	w0, eq
	cmp	w6, w5
	ldrb	w5, [x20, 3]
	and	w1, w3, w1
	ldrb	w6, [x19, 3]
	ccmp	w7, w4, 0, eq
	cset	w4, eq
	ldrb	w2, [x20, 4]
	and	w0, w0, w1
	cmp	w6, w5
	ldrb	w5, [x19, 4]
	and	w0, w4, w0
	ldr	w4, [x20, 60]
	ccmp	w5, w2, 0, eq
	ldrb	w3, [x19, 18]
	ldrb	w1, [x20, 18]
	cset	w2, eq
	cmp	w4, w10
	and	w0, w2, w0
	ccmp	w1, w3, 0, eq
	cset	w2, eq
	and	w2, w2, w0
	cbz	w3, .L2061
	lsl	w10, w10, 1
	cmn	w10, #6
	beq	.L2061
	mov	x1, x20
	add	x7, x19, 64
	mov	w9, -6
	mov	x8, 0
	.p2align 2
.L2066:
	add	x3, x19, x8
	add	x0, x20, x8
	ldrsb	w3, [x3, 5]
	ldrsb	w0, [x0, 5]
	cmp	w0, w3
	cset	w0, eq
	and	w2, w2, w0
	cbz	w3, .L2062
	cmp	w8, 5
	bhi	.L2063
	sub	x0, x7, #64
	mov	x3, x1
	.p2align 2
.L2064:
	ldr	w5, [x0, 64]
	add	x0, x0, 4
	ldr	w4, [x3, 64]
	add	x3, x3, 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x7, x0
	and	w2, w2, w4
	bne	.L2064
.L2062:
	add	w9, w9, 1
	add	x8, x8, 1
	cmp	w9, w10
	add	x1, x1, 64
	add	x7, x7, 64
	bne	.L2066
.L2061:
	ldr	w0, [x20, 56]
	ldr	w1, [x19, 56]
	cmp	w1, w0
	cset	w0, eq
	tst	w0, w2
	csetm	w0, eq
.L2059:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2063:
	ubfiz	x0, x9, 8, 32
	add	x3, x0, 448
	add	x6, x0, 704
	add	x6, x19, x6
	add	x0, x19, x3
	add	x3, x20, x3
	.p2align 2
.L2065:
	ldr	w5, [x0], 4
	ldr	w4, [x3], 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x6, x0
	and	w2, w2, w4
	bne	.L2065
	add	w9, w9, 1
	add	x8, x8, 1
	cmp	w9, w10
	add	x1, x1, 64
	add	x7, x7, 64
	bne	.L2066
	b	.L2061
.L2080:
	ldr	x2, .LC431
	mov	w3, 9455
	ldr	x1, .LC432
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2059
.L2079:
	ldr	x2, .LC431
	mov	w3, 9454
	ldr	x1, .LC432
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2059
	.size	PPSEqual, .-PPSEqual
	.align	3
.LC431:
	.xword	.LC30
	.align	3
.LC432:
	.xword	.LC32
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_DecPPS
	.type	H264_DecPPS, %function
H264_DecPPS:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L2095
	ldr	x1, .LC436
	mov	x0, x19
	bl	ue_v
	mov	w20, w0
	ldr	w0, [x19, 14948]
	sub	w0, w0, #1
	cmp	w20, w0
	bhi	.L2096
	ldr	x1, .LC441
	mov	x0, x19
	bl	ue_v
	mov	w2, w0
	ldr	w0, [x19, 14944]
	sub	w0, w0, #1
	cmp	w2, w0
	bhi	.L2097
	mov	w0, 4000
	ldr	x1, [x19, 14960]
	umull	x0, w2, w0
	add	x0, x1, x0
	ldrb	w0, [x0, 23]
	cbz	w0, .L2098
	mov	w21, 2208
	ldr	x0, [x19, 14968]
	umull	x21, w20, w21
	add	x0, x0, x21
	ldrb	w1, [x0, 19]
	cbz	w1, .L2087
	ldr	x22, .LC446
	mov	x0, x19
	mov	x1, x22
	stp	w20, w2, [x22, 24]
	bl	ProcessPPS
	cbnz	w0, .L2099
	ldr	x1, [x19, 14968]
	mov	x0, x22
	add	x1, x1, x21
	bl	PPSEqual
	cbz	w0, .L2083
	ldr	x3, .LC450
	mov	w1, 1
	ldr	x0, [x19, 14968]
	mov	x2, 2208
	strb	w1, [x22, 20]
	ldr	x3, [x3, 112]
	add	x0, x0, x21
	strb	w1, [x22, 19]
	mov	x1, x22
	blr	x3
	mov	w0, 0
	b	.L2083
	.p2align 3
.L2096:
	ldr	x1, .LC438
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x19, 14948]
	sub	w1, w0, #1
	cmp	w20, w1
	bls	.L2091
	ldr	x1, .LC439
	ldr	x4, [x1]
	cbz	x4, .L2091
	add	x19, x19, 65536
	mov	w3, 8
	stp	w20, w0, [x29, 56]
	add	x2, x29, 56
	mov	w1, 110
	ldr	w0, [x19, 1980]
	blr	x4
	mov	w0, -1
.L2083:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2087:
	str	w20, [x0, 24]
	mov	x0, x19
	ldr	x1, [x19, 14968]
	add	x1, x1, x21
	str	w2, [x1, 28]
	ldr	x1, [x19, 14968]
	add	x1, x1, x21
	bl	ProcessPPS
	cbnz	w0, .L2100
	ldr	x1, [x19, 14968]
	mov	w2, 1
	add	x1, x1, x21
	strb	w2, [x1, 20]
	ldr	x1, [x19, 14968]
	add	x21, x1, x21
	strb	w2, [x21, 19]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2091:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, -1
	ldp	x29, x30, [sp], 64
	ret
.L2099:
	ldr	x2, .LC447
	mov	w0, 1
	ldr	x1, .LC449
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2083
.L2097:
	ldr	x1, .LC443
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2083
.L2098:
	ldr	x1, .LC445
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2083
.L2095:
	ldr	x2, .LC433
	mov	w3, 9522
	ldr	x1, .LC434
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2083
.L2100:
	ldr	x2, .LC447
	mov	w0, 1
	ldr	x1, .LC452
	add	x2, x2, 96
	bl	dprint_vfmw
	ldr	x1, [x19, 14968]
	mov	w2, 1
	mov	w0, -1
	add	x1, x1, x21
	strb	w2, [x1, 20]
	ldr	x1, [x19, 14968]
	add	x21, x1, x21
	strb	wzr, [x21, 19]
	b	.L2083
	.size	H264_DecPPS, .-H264_DecPPS
	.align	3
.LC433:
	.xword	.LC30
	.align	3
.LC434:
	.xword	.LC32
	.align	3
.LC436:
	.xword	.LC435
	.align	3
.LC438:
	.xword	.LC437
	.align	3
.LC439:
	.xword	g_event_report
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
.LC446:
	.xword	.LANCHOR3
	.align	3
.LC447:
	.xword	.LANCHOR2
	.align	3
.LC449:
	.xword	.LC448
	.align	3
.LC450:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC452:
	.xword	.LC451
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	vui_parameters
	.type	vui_parameters, %function
vui_parameters:
	stp	x29, x30, [sp, -96]!
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
	cbz	x19, .L2145
	ldr	x1, .LC454
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20]
	cbnz	w0, .L2146
	strb	wzr, [x20, 15]
.L2105:
	ldr	x1, .LC462
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 1]
	cbnz	w0, .L2147
.L2106:
	ldr	x1, .LC466
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 3]
	cbnz	w0, .L2148
	mov	w0, 5
	str	w0, [x20, 28]
.L2108:
	ldr	x1, .LC480
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 6]
	cbnz	w0, .L2149
.L2109:
	ldr	x1, .LC486
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 8]
	cbnz	w0, .L2150
.L2111:
	ldr	x1, .LC495
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 7]
	cbz	w0, .L2113
	ldr	x1, .LC497
	mov	x0, x19
	add	x24, x20, 84
	bl	ue_v
	ldr	x2, .LC499
	mov	w1, 4
	str	w0, [x24, 36]
	mov	x0, x19
	bl	u_v
	strb	w0, [x24, 32]
	ldr	x2, .LC501
	mov	w1, 4
	mov	x0, x19
	bl	u_v
	strb	w0, [x24, 33]
	ldr	w1, [x24, 36]
	cmp	w1, 31
	bhi	.L2115
	add	x28, x19, 65536
	ldr	w0, [x28, 1920]
	cbnz	w0, .L2115
	ldr	x27, .LC505
	mov	w21, 0
	ldr	x26, .LC507
	ldr	x25, .LC509
	.p2align 2
.L2116:
	uxtw	x22, w21
	mov	x1, x27
	mov	x0, x19
	add	w21, w21, 1
	add	x23, x20, x22, lsl 2
	bl	ue_v
	mov	x1, x26
	str	w0, [x23, 124]
	mov	x0, x19
	bl	ue_v
	str	w0, [x23, 252]
	mov	x1, x25
	mov	x0, x19
	bl	u_1
	strb	w0, [x24, x22]
	ldr	w0, [x24, 36]
	cmp	w0, w21
	bcs	.L2116
	ldr	x2, .LC511
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 296]
	ldr	x2, .LC513
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 300]
	ldr	x2, .LC515
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 304]
	ldr	x2, .LC517
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 308]
.L2113:
	ldr	x1, .LC519
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 10]
	cbnz	w0, .L2151
	ldrb	w0, [x20, 7]
	add	x28, x19, 65536
	cbz	w0, .L2120
.L2121:
	ldr	x1, .LC521
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 14]
.L2120:
	ldr	x1, .LC523
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 11]
	ldr	x1, .LC525
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 12]
	cbnz	w0, .L2122
	ldr	w0, [x28, 1920]
.L2123:
	cmp	w0, wzr
	csetm	w0, ne
.L2144:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2150:
	ldr	x2, .LC488
	mov	w1, 32
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 52]
	ldr	x2, .LC490
	mov	w1, 32
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 56]
	ldr	x1, .LC492
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 9]
	ldr	w1, [x20, 52]
	cbz	w1, .L2111
	ldr	w0, [x20, 56]
	mov	w3, 10000
	ldr	x2, .LC493
	add	x28, x19, 65536
	umull	x0, w0, w3
	ldr	x2, [x2, 488]
	lsr	x0, x0, 1
	blr	x2
	add	w0, w0, 5
	mov	w1, 52429
	movk	w1, 0xcccc, lsl 16
	umull	x0, w0, w1
	lsr	x0, x0, 35
	str	w0, [x28, 660]
	b	.L2111
	.p2align 3
.L2149:
	ldr	x1, .LC482
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 44]
	ldr	x1, .LC484
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 48]
	b	.L2109
	.p2align 3
.L2148:
	ldr	x2, .LC468
	mov	w1, 3
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 28]
	ldr	x1, .LC470
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 4]
	ldr	x1, .LC472
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 5]
	cbz	w0, .L2108
	ldr	x2, .LC474
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 32]
	ldr	x2, .LC476
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 36]
	ldr	x2, .LC478
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 40]
	b	.L2108
	.p2align 3
.L2147:
	ldr	x1, .LC464
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 2]
	b	.L2106
	.p2align 3
.L2146:
	ldr	x2, .LC456
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	uxtb	w0, w0
	cmp	w0, 255
	strb	w0, [x20, 15]
	bne	.L2105
	ldr	x2, .LC458
	mov	w1, 16
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 16]
	ldr	x2, .LC460
	mov	w1, 16
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 20]
	b	.L2105
	.p2align 3
.L2151:
	ldr	x1, .LC497
	mov	x0, x19
	add	x24, x20, 396
	bl	ue_v
	ldr	x2, .LC499
	mov	w1, 4
	str	w0, [x24, 36]
	mov	x0, x19
	bl	u_v
	strb	w0, [x24, 32]
	ldr	x2, .LC501
	mov	w1, 4
	mov	x0, x19
	bl	u_v
	strb	w0, [x24, 33]
	ldr	w1, [x24, 36]
	cmp	w1, 31
	bhi	.L2115
	add	x28, x19, 65536
	ldr	w0, [x28, 1920]
	cbnz	w0, .L2115
	ldr	x27, .LC505
	mov	w21, 0
	ldr	x26, .LC507
	ldr	x25, .LC509
	.p2align 2
.L2118:
	uxtw	x22, w21
	mov	x1, x27
	mov	x0, x19
	add	w21, w21, 1
	add	x23, x20, x22, lsl 2
	bl	ue_v
	mov	x1, x26
	str	w0, [x23, 436]
	mov	x0, x19
	bl	ue_v
	str	w0, [x23, 564]
	mov	x1, x25
	mov	x0, x19
	bl	u_1
	strb	w0, [x24, x22]
	ldr	w0, [x24, 36]
	cmp	w0, w21
	bcs	.L2118
	ldr	x2, .LC511
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 296]
	ldr	x2, .LC513
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 300]
	ldr	x2, .LC515
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 304]
	ldr	x2, .LC517
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 308]
	ldrb	w0, [x20, 7]
	cbnz	w0, .L2121
	ldrb	w0, [x20, 10]
	cbnz	w0, .L2121
	b	.L2120
	.p2align 3
.L2122:
	ldr	x1, .LC527
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 13]
	ldr	x1, .LC529
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 60]
	ldr	x1, .LC531
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 64]
	ldr	x1, .LC533
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 72]
	ldr	x1, .LC535
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 68]
	ldr	x1, .LC537
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 76]
	ldr	x1, .LC539
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 80]
	ldr	w0, [x28, 1920]
	cbz	w0, .L2123
.L2145:
	mov	w0, -1
	b	.L2144
.L2115:
	ldr	x1, .LC503
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2144
	.size	vui_parameters, .-vui_parameters
	.align	3
.LC454:
	.xword	.LC453
	.align	3
.LC456:
	.xword	.LC455
	.align	3
.LC458:
	.xword	.LC457
	.align	3
.LC460:
	.xword	.LC459
	.align	3
.LC462:
	.xword	.LC461
	.align	3
.LC464:
	.xword	.LC463
	.align	3
.LC466:
	.xword	.LC465
	.align	3
.LC468:
	.xword	.LC467
	.align	3
.LC470:
	.xword	.LC469
	.align	3
.LC472:
	.xword	.LC471
	.align	3
.LC474:
	.xword	.LC473
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
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC495:
	.xword	.LC494
	.align	3
.LC497:
	.xword	.LC496
	.align	3
.LC499:
	.xword	.LC498
	.align	3
.LC501:
	.xword	.LC500
	.align	3
.LC503:
	.xword	.LC502
	.align	3
.LC505:
	.xword	.LC504
	.align	3
.LC507:
	.xword	.LC506
	.align	3
.LC509:
	.xword	.LC508
	.align	3
.LC511:
	.xword	.LC510
	.align	3
.LC513:
	.xword	.LC512
	.align	3
.LC515:
	.xword	.LC514
	.align	3
.LC517:
	.xword	.LC516
	.align	3
.LC519:
	.xword	.LC518
	.align	3
.LC521:
	.xword	.LC520
	.align	3
.LC523:
	.xword	.LC522
	.align	3
.LC525:
	.xword	.LC524
	.align	3
.LC527:
	.xword	.LC526
	.align	3
.LC529:
	.xword	.LC528
	.align	3
.LC531:
	.xword	.LC530
	.align	3
.LC533:
	.xword	.LC532
	.align	3
.LC535:
	.xword	.LC534
	.align	3
.LC537:
	.xword	.LC536
	.align	3
.LC539:
	.xword	.LC538
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SPSEqual
	.type	SPSEqual, %function
SPSEqual:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cbz	x19, .L2184
	cbz	x20, .L2185
	ldp	w3, w6, [x19, 28]
	ldp	w2, w5, [x20, 28]
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
	ldr	w2, [x20, 36]
	ccmp	w1, w0, 0, eq
	ldr	w4, [x19, 36]
	cset	w0, eq
	ldrb	w1, [x19, 25]
	and	w0, w3, w0
	cmp	w6, w5
	ldrb	w3, [x20, 25]
	ccmp	w4, w2, 0, eq
	cset	w2, eq
	cmp	w3, w1
	and	w0, w2, w0
	cset	w2, eq
	and	w0, w2, w0
	cbz	w1, .L2156
	mov	x2, x19
	mov	x8, x20
	mov	w9, -6
	mov	x1, 0
	.p2align 2
.L2161:
	add	x4, x19, x1
	add	x3, x20, x1
	add	x6, x2, 64
	ldrsb	w3, [x3, 4]
	ldrsb	w4, [x4, 4]
	cmp	w3, w4
	cset	w3, eq
	and	w0, w0, w3
	cbz	w4, .L2157
	cmp	w1, 5
	bhi	.L2158
	mov	x3, x8
	.p2align 2
.L2159:
	ldr	w5, [x2, 52]
	add	x2, x2, 4
	ldr	w4, [x3, 52]
	add	x3, x3, 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x2, x6
	and	w0, w0, w4
	bne	.L2159
.L2157:
	add	x1, x1, 1
	add	w9, w9, 1
	cmp	x1, 8
	mov	x2, x6
	add	x8, x8, 64
	bne	.L2161
.L2156:
	ldr	w4, [x19, 2196]
	ldr	w3, [x20, 2196]
	ldr	w2, [x20, 2200]
	ldr	w1, [x19, 2200]
	cmp	w4, w3
	ccmp	w2, w1, 0, eq
	cset	w2, eq
	and	w0, w2, w0
	cbz	w1, .L2163
	cmp	w1, 1
	bne	.L2162
	ldrb	w4, [x19, 16]
	ldrb	w3, [x20, 16]
	ldr	w2, [x19, 2208]
	ldr	w1, [x20, 2208]
	cmp	w4, w3
	ldr	w5, [x19, 2212]
	ldr	w4, [x20, 2212]
	ccmp	w2, w1, 0, eq
	ldr	w2, [x20, 2216]
	cset	w3, eq
	ldr	w1, [x19, 2216]
	cmp	w5, w4
	ccmp	w2, w1, 0, eq
	cset	w2, eq
	and	w2, w3, w2
	and	w0, w0, w2
	cbz	w1, .L2162
	sub	w5, w1, #1
	add	x2, x20, 2220
	add	x5, x5, 556
	add	x1, x19, 2220
	add	x5, x19, x5, lsl 2
	.p2align 2
.L2165:
	ldr	w4, [x1], 4
	ldr	w3, [x2], 4
	cmp	w4, w3
	cset	w3, eq
	cmp	x1, x5
	and	w0, w0, w3
	bne	.L2165
.L2162:
	ldr	w4, [x19, 3244]
	ldr	w3, [x20, 3244]
	ldrb	w2, [x19, 17]
	ldrb	w1, [x20, 17]
	cmp	w4, w3
	ldr	w6, [x19, 3248]
	ldr	w4, [x20, 3248]
	ccmp	w2, w1, 0, eq
	ldr	w5, [x19, 3252]
	cset	w2, eq
	ldr	w1, [x20, 3252]
	cmp	w6, w4
	ldrb	w3, [x19, 18]
	ldrb	w4, [x20, 18]
	ccmp	w5, w1, 0, eq
	cset	w1, eq
	cmp	w4, w3
	and	w2, w2, w1
	cset	w1, eq
	and	w1, w2, w1
	and	w0, w1, w0
	cbnz	w3, .L2166
	ldrb	w1, [x20, 19]
	ldrb	w2, [x19, 19]
	cmp	w2, w1
	cset	w1, eq
	and	w0, w0, w1
.L2166:
	ldrb	w4, [x19, 20]
	ldrb	w3, [x20, 20]
	ldrb	w2, [x20, 21]
	ldrb	w1, [x19, 21]
	cmp	w4, w3
	ccmp	w2, w1, 0, eq
	cset	w2, eq
	and	w0, w2, w0
	cbnz	w1, .L2186
.L2167:
	ldrb	w4, [x19, 22]
	ldrb	w3, [x20, 22]
	ldr	w1, [x20, 3316]
	ldr	w2, [x19, 3316]
	cmp	w4, w3
	ccmp	w2, w1, 0, eq
	cset	w1, eq
	tst	w1, w0
	csetm	w0, eq
.L2154:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2186:
	ldr	w4, [x19, 3264]
	ldr	w3, [x20, 3264]
	ldr	w2, [x19, 3268]
	ldr	w1, [x20, 3268]
	cmp	w4, w3
	ldr	w5, [x19, 3256]
	ldr	w4, [x20, 3256]
	ccmp	w2, w1, 0, eq
	ldr	w3, [x19, 3260]
	cset	w2, eq
	ldr	w1, [x20, 3260]
	cmp	w5, w4
	ccmp	w3, w1, 0, eq
	cset	w1, eq
	and	w1, w2, w1
	and	w0, w0, w1
	b	.L2167
	.p2align 3
.L2158:
	ubfiz	x3, x9, 8, 32
	add	x4, x3, 436
	add	x7, x3, 692
	add	x7, x19, x7
	add	x3, x19, x4
	add	x4, x20, x4
	.p2align 2
.L2160:
	ldr	w6, [x3], 4
	ldr	w5, [x4], 4
	cmp	w6, w5
	cset	w5, eq
	cmp	x3, x7
	and	w0, w0, w5
	bne	.L2160
	add	x1, x1, 1
	add	x6, x2, 64
	cmp	x1, 8
	add	w9, w9, 1
	mov	x2, x6
	add	x8, x8, 64
	bne	.L2161
	b	.L2156
	.p2align 3
.L2163:
	ldr	w1, [x20, 2204]
	ldr	w2, [x19, 2204]
	cmp	w2, w1
	cset	w1, eq
	and	w0, w0, w1
	b	.L2162
.L2185:
	ldr	x2, .LC540
	mov	w3, 9782
	ldr	x1, .LC541
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2154
.L2184:
	ldr	x2, .LC540
	mov	w3, 9781
	ldr	x1, .LC541
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2154
	.size	SPSEqual, .-SPSEqual
	.align	3
.LC540:
	.xword	.LC30
	.align	3
.LC541:
	.xword	.LC32
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264GetDar
	.type	H264GetDar, %function
H264GetDar:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	w22, w2
	mov	w21, w3
	mov	w23, w4
	bl	_mcount
	cbz	w19, .L2199
	mov	w0, 255
	cmp	w19, 16
	ccmp	w19, w0, 4, gt
	bne	.L2199
	cmp	w20, wzr
	ccmp	w22, wzr, 4, ne
	ccmp	w19, w0, 0, eq
	beq	.L2199
	cmp	w19, 1
	beq	.L2213
	cmp	w19, 255
	beq	.L2190
	ldr	x0, .LC542
	sbfiz	x19, x19, 3, 32
	add	x0, x0, 112
	add	x1, x0, x19
	ldr	w20, [x0, x19]
	ldr	w22, [x1, 4]
.L2190:
	lsl	w20, w20, 10
	lsl	w21, w21, 10
	sdiv	w20, w20, w22
	sdiv	w2, w21, w23
	mul	w2, w20, w2
	cmp	w2, wzr
	add	w0, w2, 1023
	csel	w2, w0, w2, lt
	asr	w2, w2, 10
	subs	w1, w2, #2406
	bmi	.L2214
.L2191:
	subs	w0, w2, #2263
	bmi	.L2215
	cmp	w1, w0
	mov	w19, 4
	blt	.L2188
.L2195:
	subs	w1, w2, #1820
	bmi	.L2216
	cmp	w0, w1
	mov	w19, 3
	blt	.L2188
.L2196:
	subs	w0, w2, #1365
	bmi	.L2217
.L2194:
	mov	w19, 2
	cmp	w1, w0
	csinc	w19, w19, wzr, lt
	b	.L2188
	.p2align 3
.L2199:
	mov	w19, 0
	mov	w2, 0
.L2188:
	ldr	x1, .LC544
	mov	w3, w19
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2215:
	mov	w0, 2263
	mov	w19, 4
	sub	w0, w0, w2
	cmp	w1, w0
	blt	.L2188
	b	.L2195
	.p2align 3
.L2214:
	mov	w1, 2406
	sub	w1, w1, w2
	b	.L2191
	.p2align 3
.L2213:
	mov	w0, 2160
	cmp	w21, 3840
	ccmp	w23, w0, 0, eq
	bne	.L2218
.L2202:
	mov	w19, 2
	mov	w2, 0
	b	.L2188
	.p2align 3
.L2218:
	sub	w0, w23, #1080
	mov	w1, 1920
	and	w0, w0, -9
	cmp	w0, wzr
	ccmp	w21, w1, 0, eq
	beq	.L2202
	mov	w0, 720
	cmp	w21, 1280
	ccmp	w23, w0, 0, eq
	beq	.L2202
	mov	w0, 480
	cmp	w21, 640
	ccmp	w23, w0, 0, eq
	mov	w19, 5
	cset	w0, eq
	mov	w2, 0
	cmp	w0, wzr
	csinc	w19, w19, wzr, eq
	b	.L2188
	.p2align 3
.L2216:
	mov	w1, 1820
	mov	w19, 3
	sub	w1, w1, w2
	cmp	w0, w1
	blt	.L2188
	b	.L2196
.L2217:
	mov	w0, 1365
	sub	w0, w0, w2
	b	.L2194
	.size	H264GetDar, .-H264GetDar
	.align	3
.LC542:
	.xword	.LANCHOR2
	.align	3
.LC544:
	.xword	.LC543
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessSPS
	.type	ProcessSPS, %function
ProcessSPS:
	stp	x29, x30, [sp, -144]!
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
	cbz	x20, .L2346
	cbz	x19, .L2349
	ldr	w0, [x19, 28]
	mov	w2, 144
	mov	w1, 110
	mov	w3, 86
	cmp	w0, 122
	ccmp	w0, w2, 4, ne
	cset	w2, eq
	cmp	w0, 100
	ccmp	w0, w1, 4, ne
	cset	w1, eq
	cmp	w0, 83
	ccmp	w0, w3, 4, ne
	orr	w0, w2, w1
	cset	w1, eq
	orr	w0, w1, w0
	cbnz	w0, .L2350
	mov	w0, 1
	strb	wzr, [x19, 25]
	str	w0, [x19, 40]
.L2237:
	ldr	x1, .LC572
	mov	x0, x20
	bl	ue_v
	cmp	w0, 12
	str	w0, [x19, 2196]
	bhi	.L2252
	add	x21, x20, 65536
	ldr	w0, [x21, 1920]
	cbnz	w0, .L2252
	ldr	x1, .LC576
	mov	x0, x20
	bl	ue_v
	cmp	w0, 2
	str	w0, [x19, 2200]
	bhi	.L2254
	ldr	w1, [x21, 1920]
	cbnz	w1, .L2254
	cbz	w0, .L2351
	cmp	w0, 1
	beq	.L2352
.L2258:
	ldr	x1, .LC633
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3244]
	ldr	w0, [x21, 1920]
	cbnz	w0, .L2346
	ldr	x1, .LC596
	mov	x0, x20
	bl	u_1
	strb	w0, [x19, 17]
	ldr	w0, [x21, 1920]
	cbnz	w0, .L2346
	ldr	x1, .LC598
	mov	x0, x20
	bl	ue_v
	sub	w1, w0, #1
	cmp	w1, 509
	str	w0, [x19, 3248]
	bhi	.L2263
	ldr	w1, [x21, 1920]
	cbnz	w1, .L2263
	ldr	x1, .LC602
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3252]
	ldr	w0, [x21, 1920]
	cbnz	w0, .L2346
	ldr	x1, .LC604
	mov	x0, x20
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x19, 18]
	ldr	w1, [x21, 1920]
	cbnz	w1, .L2346
	cbnz	w0, .L2353
	ldr	x1, .LC635
	mov	x0, x20
	bl	u_1
	ldr	w23, [x19, 3252]
	strb	w0, [x19, 19]
	add	w23, w23, 1
	cmp	w23, 255
	bhi	.L2299
	ldr	w0, [x19, 3248]
	cmp	w23, 1
	mov	w24, 2
	add	w0, w0, 1
	ccmp	w0, 3, 0, hi
	cset	w1, ls
	cbnz	w1, .L2299
.L2267:
	mul	w23, w24, w23
	lsl	w25, w0, 4
	mov	w1, 100663296
	lsl	w23, w23, 4
	mul	w0, w25, w23
	lsr	w0, w0, 1
	lsl	w22, w0, 2
	sub	w0, w22, w0
	cmp	w0, w1
	bhi	.L2354
	ldr	w2, [x19, 32]
	sub	w1, w2, #10
	cmp	w1, 31
	bls	.L2355
.L2269:
	ldr	x1, .LC611
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2338
	.p2align 3
.L2350:
	ldr	x1, .LC550
	mov	x0, x20
	bl	ue_v
	cmp	w0, 1
	str	w0, [x19, 40]
	bls	.L2356
.L2224:
	ldr	x1, .LC552
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, .LC554
	mov	x0, x20
	bl	ue_v
	uxth	w0, w0
	add	w2, w0, 8
	str	w2, [x19, 44]
	cmp	w2, 8
	beq	.L2357
.L2226:
	ldr	x1, .LC556
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC557
	ldr	x4, [x0]
	cbz	x4, .L2346
	add	x20, x20, 65536
	ldr	w0, [x19, 44]
	stp	wzr, w0, [x29, 120]
	mov	w3, 8
	add	x2, x29, 120
	ldr	w0, [x20, 1980]
	mov	w1, 119
	blr	x4
	mov	w0, -1
.L2338:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2356:
	add	x21, x20, 65536
	ldr	w1, [x21, 1920]
	cbnz	w1, .L2224
	ldr	x1, .LC554
	mov	x0, x20
	bl	ue_v
	uxth	w0, w0
	add	w2, w0, 8
	str	w2, [x19, 44]
	cmp	w2, 8
	bne	.L2228
	ldr	w0, [x21, 1920]
	cbz	w0, .L2229
.L2228:
	ldr	x1, .LC556
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC557
	ldr	x4, [x0]
	cbz	x4, .L2229
	ldr	w1, [x19, 44]
	mov	w3, 8
	ldr	w0, [x21, 1980]
	add	x2, x29, 120
	stp	wzr, w1, [x29, 120]
	mov	w1, 119
	blr	x4
.L2229:
	ldr	x1, .LC559
	mov	x0, x20
	bl	ue_v
	uxth	w0, w0
	add	w2, w0, 8
	str	w2, [x19, 48]
	cmp	w2, 8
	bne	.L2231
	ldr	w0, [x21, 1920]
	cbnz	w0, .L2231
.L2232:
	ldr	x1, .LC563
	mov	x0, x20
	bl	u_1
	cbnz	w0, .L2234
	ldr	w0, [x21, 1920]
	cbnz	w0, .L2234
	ldr	x1, .LC567
	mov	x0, x20
	bl	u_1
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 25]
	bne	.L2237
	ldr	x26, .LC546
	add	x21, x29, 120
	ldr	x25, .LC568
	add	x23, x19, 4
	add	x22, x19, 1972
	add	x24, x19, 52
	mov	w28, 0
	ldr	x27, .LC570
	b	.L2244
	.p2align 3
.L2360:
	ldr	x0, .LC546
	cmp	w28, wzr
	ldr	x3, [x27, 104]
	mov	x2, 16
	add	x1, x0, 80
	add	x0, x26, 96
	csel	x1, x0, x1, ne
	mov	x0, x22
	blr	x3
.L2240:
	add	w28, w28, 1
	add	x21, x21, 4
	cmp	w28, 6
	add	x23, x23, 1
	add	x22, x22, 16
	add	x24, x24, 64
	beq	.L2358
.L2244:
	mov	x1, x25
	mov	x0, x20
	bl	u_1
	cmp	w0, 1
	strb	w0, [x23]
	str	w0, [x21]
	beq	.L2359
	cmp	w28, wzr
	ccmp	w28, 3, 4, ne
	beq	.L2360
	ldr	x0, .LC570
	sub	w1, w28, #1
	mov	x2, 16
	add	x1, x19, x1, lsl 4
	ldr	x3, [x0, 104]
	add	x1, x1, 1972
	mov	x0, x22
	blr	x3
	b	.L2240
	.p2align 3
.L2357:
	add	x0, x20, 65536
	ldr	w0, [x0, 1920]
	cbnz	w0, .L2226
	.p2align 2
.L2346:
	mov	w0, -1
.L2366:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2351:
	ldr	x1, .LC580
	mov	x0, x20
	bl	ue_v
	cmp	w0, 12
	str	w0, [x19, 2204]
	bhi	.L2257
	ldr	w0, [x21, 1920]
	cbz	w0, .L2258
.L2257:
	ldr	x1, .LC582
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2338
	.p2align 3
.L2231:
	ldr	x1, .LC561
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC557
	ldr	x4, [x0]
	cbz	x4, .L2232
	ldr	w1, [x19, 48]
	mov	w3, 8
	ldr	w0, [x21, 1980]
	add	x2, x29, 120
	stp	wzr, w1, [x29, 120]
	mov	w1, 119
	blr	x4
	b	.L2232
	.p2align 3
.L2353:
	ldr	w23, [x19, 3252]
	strb	wzr, [x19, 19]
	sub	w0, w23, #1
	cmp	w0, 509
	bhi	.L2299
	ldr	w0, [x19, 3248]
	mov	w24, 1
	add	w23, w23, 1
	add	w0, w0, w24
	b	.L2267
	.p2align 3
.L2355:
	ldr	x3, .LC609
	ldrh	w1, [x3,w1,uxtw #1]
	adr	x3, .Lrtx2271
	add	x1, x3, w1, sxth #2
	br	x1
.Lrtx2271:
	.section	.rodata
	.align	0
	.align	2
.L2271:
	.2byte	(.L2270 - .Lrtx2271) / 4
	.2byte	(.L2306 - .Lrtx2271) / 4
	.2byte	(.L2273 - .Lrtx2271) / 4
	.2byte	(.L2273 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2273 - .Lrtx2271) / 4
	.2byte	(.L2274 - .Lrtx2271) / 4
	.2byte	(.L2276 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2276 - .Lrtx2271) / 4
	.2byte	(.L2277 - .Lrtx2271) / 4
	.2byte	(.L2278 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2269 - .Lrtx2271) / 4
	.2byte	(.L2280 - .Lrtx2271) / 4
	.2byte	(.L2280 - .Lrtx2271) / 4
	.text
	.p2align 3
.L2273:
	mov	w22, 60416
	movk	w22, 0xd, lsl 16
.L2272:
	udiv	w22, w22, w0
	mov	w2, 16
	ldr	x1, .LC613
	mov	w0, 21
	cmp	w22, w2
	csel	w22, w22, w2, ls
	mov	w2, w22
	bl	dprint_vfmw
	ldr	w2, [x19, 3244]
	cmp	w2, w22
	bhi	.L2281
	ldr	w0, [x21, 1920]
	cbz	w0, .L2282
.L2281:
	ldr	x1, .LC615
	mov	w3, w22
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x19, 3244]
	cmp	w0, 16
	bhi	.L2343
	cmp	w22, w0
	csel	w22, w22, w0, cs
.L2343:
	str	w22, [x19, 3244]
.L2282:
	ldr	x1, .LC617
	mov	x0, x20
	bl	u_1
	strb	w0, [x19, 20]
	ldr	w0, [x21, 1920]
	cbnz	w0, .L2346
	ldr	x1, .LC619
	mov	x0, x20
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x19, 21]
	ldr	w1, [x21, 1920]
	cbnz	w1, .L2346
	cbnz	w0, .L2361
.L2284:
	add	x2, x19, 3072
	lsr	w1, w25, 1
	lsr	w0, w23, 1
	stp	w25, w23, [x2, 204]
	stp	w1, w0, [x2, 212]
.L2286:
	ldr	x1, .LC629
	mov	x0, x20
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x19, 22]
	ldr	w1, [x21, 1920]
	cbnz	w1, .L2346
	mov	w1, 2
	str	w1, [x19, 3332]
	cbnz	w0, .L2362
	mov	w0, 5
	strb	wzr, [x19, 3307]
	str	w0, [x19, 3320]
	mov	w0, 0
.L2289:
	ldr	w1, [x19, 3308]
	mov	w4, w23
	ldr	w2, [x19, 3312]
	mov	w3, w25
	bl	H264GetDar
	str	w0, [x19, 3316]
	ldr	w1, [x19, 3244]
	cbnz	w1, .L2292
	ldr	x0, [x20]
.L2293:
	cmp	w22, 16
	mov	w1, 16
	csel	w22, w22, w1, ls
	str	w22, [x20, 14952]
	ldr	w1, [x0, 28]
	cmp	w1, 25
	beq	.L2363
.L2296:
	add	w22, w22, 1
	mov	w0, 0
	str	w22, [x19, 3272]
	b	.L2338
	.p2align 3
.L2280:
	mov	w22, 12582912
	b	.L2272
	.p2align 3
.L2276:
	mov	w22, 30208
	movk	w22, 0x2f, lsl 16
	b	.L2272
.L2306:
	mov	w22, 17920
	movk	w22, 0x5, lsl 16
	b	.L2272
.L2270:
	mov	w22, 20992
	movk	w22, 0x2, lsl 16
	b	.L2272
.L2277:
	mov	w22, 30720
	movk	w22, 0x69, lsl 16
	b	.L2272
.L2274:
	mov	w22, 55296
	movk	w22, 0x1b, lsl 16
	b	.L2272
.L2278:
	mov	w22, 7864320
	b	.L2272
.L2299:
	ldr	x1, .LC606
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2338
	.p2align 3
.L2292:
	ldr	w0, [x19, 3372]
	cmp	w1, w0
	ldr	x0, [x20]
	bhi	.L2295
	ldr	w2, [x0, 24]
	sub	w2, w2, #2
	cmp	w2, 1
	bhi	.L2293
.L2295:
	cmp	w22, w1
	csel	w22, w22, w1, ls
	b	.L2293
	.p2align 3
.L2252:
	ldr	x1, .LC574
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2338
	.p2align 3
.L2361:
	ldr	x1, .LC621
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3256]
	ldr	x1, .LC623
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3260]
	ldr	x1, .LC625
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3264]
	ldr	x1, .LC627
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3268]
	ldr	w1, [x19, 3264]
	ldr	w2, [x19, 3256]
	lsl	w1, w1, 1
	ldr	w3, [x19, 3260]
	lsl	w2, w2, 1
	mul	w1, w1, w24
	sub	w4, w25, w2
	lsl	w24, w24, 1
	sub	w3, w4, w3, lsl 1
	sub	w4, w23, w1
	cmp	w3, wzr
	msub	w0, w24, w0, w4
	ccmp	w0, wzr, 4, gt
	ble	.L2284
	add	x4, x19, 3072
	add	w2, w2, w3, lsr 1
	add	w1, w1, w0, lsr 1
	stp	w3, w0, [x4, 204]
	stp	w2, w1, [x4, 212]
	b	.L2286
	.p2align 3
.L2362:
	add	x1, x19, 3292
	mov	x0, x20
	bl	vui_parameters
	cbnz	w0, .L2345
	ldrb	w0, [x19, 3304]
	cbz	w0, .L2345
	ldr	w2, [x19, 3372]
	cmp	w2, wzr
	ccmp	w22, w2, 0, ne
	bcc	.L2364
	ldr	w22, [x19, 3244]
	ldrb	w0, [x19, 3307]
	cmp	w22, w2
	csel	w22, w22, w2, cs
	b	.L2289
	.p2align 3
.L2363:
	ldr	w1, [x0, 772]
	cbnz	w1, .L2296
	ldr	w1, [x0, 756]
	cmp	w22, w1
	bls	.L2297
	ldr	x0, .LC557
	ldr	x4, [x0]
	cbz	x4, .L2346
	ldr	w0, [x21, 1980]
	mov	w3, 8
	stp	w22, w1, [x29, 112]
	add	x2, x29, 112
	mov	w1, 106
	blr	x4
	mov	w0, -1
	b	.L2338
.L2364:
	ldr	x1, .LC631
	mov	w3, w22
	mov	w0, 1
	bl	dprint_vfmw
	.p2align 2
.L2345:
	ldrb	w0, [x19, 3307]
	b	.L2289
	.p2align 3
.L2352:
	ldr	x1, .LC584
	mov	x0, x20
	bl	u_1
	strb	w0, [x19, 16]
	ldr	w0, [x21, 1920]
	cbnz	w0, .L2346
	ldr	x1, .LC586
	mov	x0, x20
	bl	se_v
	str	w0, [x19, 2208]
	ldr	w0, [x21, 1920]
	cbnz	w0, .L2346
	ldr	x1, .LC588
	mov	x0, x20
	bl	se_v
	str	w0, [x19, 2212]
	ldr	w0, [x21, 1920]
	cbnz	w0, .L2346
	ldr	x1, .LC590
	mov	x0, x20
	bl	ue_v
	cmp	w0, 255
	str	w0, [x19, 2216]
	bhi	.L2259
	ldr	w1, [x21, 1920]
	cbnz	w1, .L2259
	cbz	w0, .L2258
	ldr	x23, .LC594
	mov	w22, 0
	b	.L2262
	.p2align 3
.L2365:
	ldr	w0, [x19, 2216]
	cmp	w0, w22
	bls	.L2258
.L2262:
	mov	x1, x23
	mov	x0, x20
	bl	se_v
	add	x1, x19, x22, uxtw 2
	add	w22, w22, 1
	str	w0, [x1, 2220]
	ldr	w0, [x21, 1920]
	cbz	w0, .L2365
	mov	w0, -1
	b	.L2366
	.p2align 3
.L2358:
	ldr	x26, .LC570
	add	x21, x29, 104
	ldr	x24, .LC546
	add	x22, x19, 2068
	add	x23, x19, 436
	mov	x27, 0
	mov	x28, x26
.L2250:
	mov	x1, x25
	mov	x0, x20
	bl	u_1
	cmp	w0, 1
	add	x2, x19, x27
	str	w0, [x21]
	add	x1, x24, 176
	strb	w0, [x2, 10]
	beq	.L2367
	ldr	x3, [x26, 104]
	cbz	w27, .L2368
.L2249:
	mov	x0, x22
	mov	x2, 64
.L2342:
	blr	x3
.L2247:
	add	x27, x27, 1
	add	x21, x21, 4
	cmp	x27, 2
	add	x22, x22, 64
	add	x23, x23, 256
	bne	.L2250
	b	.L2237
	.p2align 3
.L2359:
	mov	x4, x21
	mov	x2, x22
	mov	x1, x24
	mov	w3, 16
	mov	x0, x20
	bl	Scaling_List
	cbnz	w0, .L2246
	ldr	w0, [x21]
	cmp	w0, 1
	bne	.L2240
	ldr	x0, .LC546
	cmp	w28, 2
	mov	x2, 16
	add	x1, x0, 80
	add	x0, x0, 96
	csel	x1, x0, x1, hi
	ldr	x0, .LC570
	ldr	x3, [x0, 104]
	mov	x0, x22
	blr	x3
	b	.L2240
	.p2align 3
.L2263:
	ldr	x1, .LC600
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2338
	.p2align 3
.L2254:
	ldr	x1, .LC578
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2338
	.p2align 3
.L2234:
	ldr	x1, .LC565
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2338
.L2367:
	mov	x4, x21
	mov	x2, x22
	mov	x1, x23
	mov	w3, 64
	mov	x0, x20
	bl	Scaling_List
	cbnz	w0, .L2246
	ldr	w0, [x21]
	cmp	w0, 1
	bne	.L2247
	ldr	x1, .LC546
	mov	x2, 64
	mov	x0, x22
	ldr	x3, [x28, 104]
	add	x1, x1, 176
	cbnz	w27, .L2342
	ldr	x1, .LC546
	add	x1, x1, 112
	b	.L2342
	.p2align 3
.L2297:
	ldr	w2, [x0, 732]
	ldr	w1, [x0, 736]
	cmp	w25, w2
	ccmp	w23, w1, 2, ls
	bls	.L2296
	ldr	x0, .LC557
	ldr	x4, [x0]
	cbz	x4, .L2346
	ldr	w0, [x21, 1980]
	mov	w3, 8
	strh	w2, [x29, 116]
	add	x2, x29, 112
	strh	w1, [x29, 118]
	mov	w1, 107
	strh	w25, [x29, 112]
	strh	w23, [x29, 114]
	blr	x4
	mov	w0, -1
	b	.L2366
.L2349:
	ldr	x2, .LC547
	mov	w3, 9994
	ldr	x1, .LC548
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2338
.L2354:
	ldr	x1, .LC608
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2338
.L2246:
	ldr	x1, .LC569
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2338
.L2259:
	ldr	x1, .LC592
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2338
.L2368:
	ldr	x1, .LC546
	add	x1, x1, 112
	b	.L2249
	.size	ProcessSPS, .-ProcessSPS
	.align	3
.LC546:
	.xword	.LANCHOR1
	.align	3
.LC547:
	.xword	.LC30
	.align	3
.LC548:
	.xword	.LC32
	.align	3
.LC550:
	.xword	.LC549
	.align	3
.LC552:
	.xword	.LC551
	.align	3
.LC554:
	.xword	.LC553
	.align	3
.LC556:
	.xword	.LC555
	.align	3
.LC557:
	.xword	g_event_report
	.align	3
.LC559:
	.xword	.LC558
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
.LC568:
	.xword	.LC422
	.align	3
.LC569:
	.xword	.LC424
	.align	3
.LC570:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC572:
	.xword	.LC571
	.align	3
.LC574:
	.xword	.LC573
	.align	3
.LC576:
	.xword	.LC575
	.align	3
.LC578:
	.xword	.LC577
	.align	3
.LC580:
	.xword	.LC579
	.align	3
.LC582:
	.xword	.LC581
	.align	3
.LC584:
	.xword	.LC583
	.align	3
.LC586:
	.xword	.LC585
	.align	3
.LC588:
	.xword	.LC587
	.align	3
.LC590:
	.xword	.LC589
	.align	3
.LC592:
	.xword	.LC591
	.align	3
.LC594:
	.xword	.LC593
	.align	3
.LC596:
	.xword	.LC595
	.align	3
.LC598:
	.xword	.LC597
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
.LC609:
	.xword	.L2271
	.align	3
.LC611:
	.xword	.LC610
	.align	3
.LC613:
	.xword	.LC612
	.align	3
.LC615:
	.xword	.LC614
	.align	3
.LC617:
	.xword	.LC616
	.align	3
.LC619:
	.xword	.LC618
	.align	3
.LC621:
	.xword	.LC620
	.align	3
.LC623:
	.xword	.LC622
	.align	3
.LC625:
	.xword	.LC624
	.align	3
.LC627:
	.xword	.LC626
	.align	3
.LC629:
	.xword	.LC628
	.align	3
.LC631:
	.xword	.LC630
	.align	3
.LC633:
	.xword	.LC632
	.align	3
.LC635:
	.xword	.LC634
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Sps_SvcExt
	.type	Sps_SvcExt, %function
Sps_SvcExt:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, 4000
	bl	_mcount
	add	x1, x19, 20480
	mov	w3, 2208
	ldr	x2, [x19, 14968]
	add	x0, x19, 12288
	ldr	x5, [x19, 14960]
	add	x0, x0, 2600
	ldr	w4, [x1, 1592]
	mov	w1, 32
	umull	x3, w4, w3
	add	x3, x2, x3
	ldr	w2, [x3, 28]
	umull	x2, w2, w20
	add	x20, x5, x2
	bl	BsGet
	mov	w21, w0
	ldr	x1, .LC637
	mov	x0, x19
	bl	u_1
	mov	w2, w0
	ldr	x1, .LC639
	mov	w0, 17
	bl	dprint_vfmw
	ldr	x2, .LC641
	mov	w1, 2
	mov	x0, x19
	bl	u_v
	cmp	w0, 1
	beq	.L2380
	ldr	w0, [x20, 40]
	sub	w1, w0, #1
	cmp	w1, 1
	bls	.L2381
.L2372:
	cmp	w0, 1
	beq	.L2382
.L2373:
	ldr	x1, .LC653
	mov	x0, x19
	bl	u_1
	cbnz	w0, .L2383
.L2374:
	ldr	x1, .LC659
	mov	x0, x19
	mov	w19, 0
	bl	u_1
	cmp	w0, 1
	beq	.L2371
	ldr	x1, .LC661
	mov	w2, w0
	ldr	w4, [x20, 40]
	mov	w3, w21
	mov	w0, 1
	bl	dprint_vfmw
.L2371:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2383:
	ldr	x1, .LC655
	mov	x0, x19
	bl	u_1
	mov	w2, w0
	ldr	x1, .LC657
	mov	w0, 17
	bl	dprint_vfmw
	b	.L2374
	.p2align 3
.L2382:
	ldr	x2, .LC649
	mov	w1, 2
	mov	x0, x19
	bl	u_v
	mov	w2, w0
	ldr	x1, .LC651
	mov	w0, 17
	bl	dprint_vfmw
	b	.L2373
	.p2align 3
.L2381:
	ldr	x1, .LC645
	mov	x0, x19
	bl	u_1
	mov	w2, w0
	ldr	x1, .LC647
	mov	w0, 17
	bl	dprint_vfmw
	ldr	w0, [x20, 40]
	b	.L2372
.L2380:
	ldr	x1, .LC643
	mov	w19, -1
	bl	dprint_vfmw
	b	.L2371
	.size	Sps_SvcExt, .-Sps_SvcExt
	.align	3
.LC637:
	.xword	.LC636
	.align	3
.LC639:
	.xword	.LC638
	.align	3
.LC641:
	.xword	.LC640
	.align	3
.LC643:
	.xword	.LC642
	.align	3
.LC645:
	.xword	.LC644
	.align	3
.LC647:
	.xword	.LC646
	.align	3
.LC649:
	.xword	.LC648
	.align	3
.LC651:
	.xword	.LC650
	.align	3
.LC653:
	.xword	.LC652
	.align	3
.LC655:
	.xword	.LC654
	.align	3
.LC657:
	.xword	.LC656
	.align	3
.LC659:
	.xword	.LC658
	.align	3
.LC661:
	.xword	.LC660
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_DecSPS
	.type	H264_DecSPS, %function
H264_DecSPS:
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
	cbz	x19, .L2415
	ldr	x2, .LC665
	mov	w1, 8
	mov	x0, x19
	add	x27, x19, 65536
	bl	u_v
	mov	w22, w0
	ldr	x1, .LC667
	mov	x0, x19
	bl	u_1
	mov	w26, w0
	ldr	x1, .LC669
	mov	x0, x19
	bl	u_1
	mov	w25, w0
	ldr	x1, .LC671
	mov	x0, x19
	bl	u_1
	mov	w24, w0
	ldr	x1, .LC673
	mov	x0, x19
	bl	u_1
	mov	w23, w0
	ldr	x2, .LC675
	mov	w1, 4
	mov	x0, x19
	bl	u_v
	ldr	x2, .LC677
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	mov	w20, w0
	ldr	x1, .LC679
	mov	x0, x19
	bl	ue_v
	mov	w21, w0
	ldr	w0, [x27, 1920]
	cbnz	w0, .L2414
	ldr	w0, [x19, 14944]
	sub	w0, w0, #1
	cmp	w21, w0
	bhi	.L2416
	sub	w0, w22, #66
	mov	w27, w22
	cmp	w0, 78
	bls	.L2417
.L2390:
	ldr	x1, .LC690
	mov	w2, w22
	mov	w0, 1
	mov	w27, 100
	bl	dprint_vfmw
.L2393:
	cmp	w20, 9
	mov	w3, w20
	bls	.L2413
	cmp	w20, 41
	bhi	.L2413
	mov	w20, 4000
	ldr	x0, [x19, 14960]
	umull	x20, w21, w20
	add	x0, x0, x20
	ldrb	w1, [x0, 23]
	cbz	w1, .L2398
.L2420:
	ldr	x28, .LC693
	mov	w1, 0
	ldr	x4, .LC694
	mov	x2, 4000
	str	w3, [x29, 100]
	add	x22, x4, 2208
	ldr	x5, [x28, 96]
	mov	x0, x22
	str	x4, [x29, 104]
	blr	x5
	strb	w25, [x22, 1]
	ldr	w3, [x29, 100]
	mov	x1, x22
	ldr	x4, [x29, 104]
	mov	x0, x19
	strb	w24, [x22, 2]
	strb	w23, [x22, 3]
	strb	w26, [x4, 2208]
	stp	w27, w3, [x22, 28]
	str	w21, [x22, 36]
	bl	ProcessSPS
	cbnz	w0, .L2418
	ldr	x1, [x19, 14960]
	mov	x0, x22
	add	x1, x1, x20
	bl	SPSEqual
	cbnz	w0, .L2419
.L2400:
	mov	w0, 86
	cmp	w27, 83
	ccmp	w27, w0, 4, ne
	beq	.L2402
.L2403:
	mov	w0, 0
.L2386:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2417:
	ldr	x1, .LC682
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx2392
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx2392:
	.section	.rodata
	.align	0
	.align	2
.L2392:
	.byte	(.L2391 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2393 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2393 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2393 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2394 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2393 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2395 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2395 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2390 - .Lrtx2392) / 4
	.byte	(.L2395 - .Lrtx2392) / 4
	.text
	.p2align 3
.L2402:
	mov	x0, x19
	bl	Sps_SvcExt
	cbz	w0, .L2403
	ldr	x1, .LC698
	mov	w0, 1
	bl	dprint_vfmw
.L2414:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, -1
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2413:
	ldr	x1, .LC692
	mov	w2, w3
	mov	w0, 1
	mov	w3, 41
	mov	w20, 4000
	bl	dprint_vfmw
	umull	x20, w21, w20
	ldr	x0, [x19, 14960]
	mov	w3, 41
	add	x0, x0, x20
	ldrb	w1, [x0, 23]
	cbnz	w1, .L2420
.L2398:
	str	w27, [x0, 28]
	ldr	x0, [x19, 14960]
	strb	w26, [x0, x20]
	mov	x0, x19
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	strb	w25, [x1, 1]
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	strb	w24, [x1, 2]
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	strb	w23, [x1, 3]
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	str	w3, [x1, 32]
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	str	w21, [x1, 36]
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	bl	ProcessSPS
	cbnz	w0, .L2421
	ldr	x0, [x19, 14960]
	mov	w1, 1
	add	x0, x0, x20
	strb	w1, [x0, 24]
	ldr	x0, [x19, 14960]
	add	x20, x0, x20
	strb	w1, [x20, 23]
	b	.L2400
	.p2align 3
.L2416:
	ldr	x1, .LC680
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x19, 14944]
	sub	w0, w1, #1
	cmp	w21, w0
	bls	.L2414
	ldr	x0, .LC681
	ldr	x4, [x0]
	cbz	x4, .L2414
	ldr	w0, [x27, 1980]
	add	x2, x29, 120
	stp	w21, w1, [x29, 120]
	mov	w3, 8
	mov	w1, 109
	blr	x4
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2394:
	ldr	x1, .LC686
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2393
	.p2align 3
.L2395:
	ldr	x1, .LC688
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2393
	.p2align 3
.L2391:
	ldr	x1, .LC684
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2393
	.p2align 3
.L2419:
	ldr	x0, [x19, 14960]
	mov	w1, 1
	ldr	x3, [x28, 112]
	mov	x2, 4000
	strb	w1, [x22, 24]
	add	x0, x0, x20
	strb	w1, [x22, 23]
	mov	x1, x22
	blr	x3
	b	.L2400
	.p2align 3
.L2418:
	ldr	x1, .LC696
	mov	w3, w21
	mov	w2, 10620
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2386
.L2415:
	ldr	x2, .LC662
	mov	w3, 10533
	ldr	x1, .LC663
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2386
.L2421:
	ldr	x1, .LC696
	mov	w2, 10645
	mov	w3, w21
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 14960]
	mov	w2, 1
	mov	w0, -1
	add	x1, x1, x20
	strb	w2, [x1, 24]
	ldr	x1, [x19, 14960]
	add	x20, x1, x20
	strb	wzr, [x20, 23]
	b	.L2386
	.size	H264_DecSPS, .-H264_DecSPS
	.align	3
.LC662:
	.xword	.LC30
	.align	3
.LC663:
	.xword	.LC32
	.align	3
.LC665:
	.xword	.LC664
	.align	3
.LC667:
	.xword	.LC666
	.align	3
.LC669:
	.xword	.LC668
	.align	3
.LC671:
	.xword	.LC670
	.align	3
.LC673:
	.xword	.LC672
	.align	3
.LC675:
	.xword	.LC674
	.align	3
.LC677:
	.xword	.LC676
	.align	3
.LC679:
	.xword	.LC678
	.align	3
.LC680:
	.xword	.LC442
	.align	3
.LC681:
	.xword	g_event_report
	.align	3
.LC682:
	.xword	.L2392
	.align	3
.LC684:
	.xword	.LC683
	.align	3
.LC686:
	.xword	.LC685
	.align	3
.LC688:
	.xword	.LC687
	.align	3
.LC690:
	.xword	.LC689
	.align	3
.LC692:
	.xword	.LC691
	.align	3
.LC693:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC694:
	.xword	.LANCHOR3
	.align	3
.LC696:
	.xword	.LC695
	.align	3
.LC698:
	.xword	.LC697
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PassBytes
	.type	PassBytes, %function
PassBytes:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x0, [x20, 632]
	cmp	w19, wzr
	ccmp	x0, xzr, 4, ne
	beq	.L2431
	ldrb	w2, [x0]
	sbfiz	x1, x2, 5, 32
	add	x1, x0, x1
	ldr	x1, [x1, 8]
	cbz	x1, .L2431
	ldr	w1, [x0, 76]
	cmp	w2, 1
	ccmp	w1, 2, 2, ls
	bhi	.L2431
	cmp	w1, w2
	bls	.L2431
	uxtw	x5, w2
	add	x3, x0, x5, lsl 5
	ldr	w1, [x3, 28]
	ldr	w3, [x3, 16]
	add	w1, w1, w19, lsl 3
	lsl	w3, w3, 3
	cmp	w1, w3
	bhi	.L2426
	b	.L2424
	.p2align 3
.L2427:
	ldr	w4, [x6, 28]
	ldr	w6, [x6, 16]
	sub	w4, w4, w3
	add	w1, w1, w4
	lsl	w3, w6, 3
	cmp	w1, w3
	bls	.L2424
.L2426:
	add	x0, x0, x5, lsl 5
	add	w5, w2, 1
	mov	x2, x5
	str	w3, [x0, 28]
	ldr	x0, [x20, 632]
	ldrb	w4, [x0]
	add	w4, w4, 1
	strb	w4, [x0]
	ldr	x0, [x20, 632]
	add	x6, x0, x5, lsl 5
	ldr	w4, [x0, 76]
	cmp	w4, w5
	bhi	.L2427
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2424:
	add	x5, x0, x5, lsl 5
	mov	w0, 1
	str	w1, [x5, 28]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2431:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	PassBytes, .-PassBytes
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetBytes
	.type	GetBytes, %function
GetBytes:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x19, x1
	mov	x0, x30
	mov	w20, w2
	bl	_mcount
	cbz	x19, .L2447
	ldr	x1, [x21, 632]
	cmp	x1, xzr
	ccmp	w20, wzr, 4, ne
	ble	.L2447
	ldrb	w2, [x1]
	sbfiz	x0, x2, 5, 32
	add	x0, x1, x0
	ldr	x0, [x0, 8]
	cbz	x0, .L2447
	ldr	w0, [x1, 76]
	cmp	w2, 1
	ccmp	w0, 2, 2, ls
	bhi	.L2447
	cmp	w0, w2
	bls	.L2447
	mov	w6, 0
.L2442:
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
	bcs	.L2437
	ldrb	w0, [x4, x0]
	add	w6, w6, 1
	strb	w0, [x19]
	cmp	w6, w20
	add	x19, x19, 1
	add	x5, x5, 1
	ldr	x0, [x21, 632]
	add	x0, x0, x7
	ldr	w3, [x0, 28]
	add	w3, w3, 8
	str	w3, [x0, 28]
	bcc	.L2440
	b	.L2439
	.p2align 3
.L2441:
	ldrb	w1, [x5], 1
	add	w6, w6, 1
	strb	w1, [x19], 1
	cmp	w6, w20
	ldr	x3, [x21, 632]
	add	x3, x3, x7
	ldr	w4, [x3, 28]
	add	w4, w4, 8
	str	w4, [x3, 28]
	bcs	.L2439
.L2440:
	cmp	x8, x5
	bne	.L2441
	ldr	x1, [x21, 632]
.L2437:
	ldrb	w0, [x1]
	add	w2, w2, 1
	add	w0, w0, 1
	strb	w0, [x1]
	ldr	x1, [x21, 632]
	ldr	w0, [x1, 76]
	cmp	w0, w2
	bhi	.L2442
	mov	w0, w6
	b	.L2436
	.p2align 3
.L2439:
	mov	w0, w20
.L2436:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2447:
	mov	w0, -1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	GetBytes, .-GetBytes
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SkipBytes
	.type	SkipBytes, %function
SkipBytes:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w22, w1
	bl	_mcount
	cmp	w22, wzr
	ble	.L2454
	ldr	w1, [x20, 14912]
	ldr	w0, [x20, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2454
	add	x21, x20, 12288
	mov	w19, 0
	add	x21, x21, 2600
	b	.L2451
	.p2align 3
.L2452:
	ldr	w1, [x20, 14912]
	ldr	w0, [x20, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2455
.L2451:
	mov	w1, 8
	mov	x0, x21
	add	w19, w19, 1
	bl	BsSkip
	cmp	w22, w19
	bne	.L2452
.L2450:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2455:
	mov	w22, w19
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L2454:
	mov	w22, 0
	b	.L2450
	.size	SkipBytes, .-SkipBytes
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_DecFramePackingSEI
	.type	H264_DecFramePackingSEI, %function
H264_DecFramePackingSEI:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 24576
	bl	_mcount
	add	x20, x21, 3184
	ldr	x1, .LC701
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 24]
	ldr	x2, .LC703
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	sxtb	w0, w0
	strb	w0, [x20, 1]
	cbz	w0, .L2462
.L2457:
	ldr	x2, .LC735
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x21, 3186]
	mov	w1, 1
	strb	w1, [x21, 3184]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2462:
	ldr	x2, .LC705
	mov	w1, 7
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 16]
	ldr	x2, .LC707
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 3]
	ldr	x2, .LC709
	mov	w1, 6
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 20]
	ldr	x2, .LC711
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 4]
	ldr	x2, .LC713
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 5]
	ldr	x2, .LC715
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 6]
	ldr	x2, .LC717
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 7]
	ldr	x2, .LC719
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 8]
	ldr	x2, .LC721
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 9]
	ldrsb	w1, [x20, 3]
	cbnz	w1, .L2458
	ldr	w0, [x20, 16]
	cmp	w0, 5
	beq	.L2458
	ldr	x2, .LC723
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 10]
	ldr	x2, .LC725
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 11]
	ldr	x2, .LC727
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 12]
	ldr	x2, .LC729
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 13]
.L2458:
	ldr	x2, .LC731
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	str	w0, [x21, 3212]
	ldr	x1, .LC733
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 3216]
	b	.L2457
	.size	H264_DecFramePackingSEI, .-H264_DecFramePackingSEI
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
.LC721:
	.xword	.LC720
	.align	3
.LC723:
	.xword	.LC722
	.align	3
.LC725:
	.xword	.LC724
	.align	3
.LC727:
	.xword	.LC726
	.align	3
.LC729:
	.xword	.LC728
	.align	3
.LC731:
	.xword	.LC730
	.align	3
.LC733:
	.xword	.LC732
	.align	3
.LC735:
	.xword	.LC734
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_DecPicTimingSEI
	.type	H264_DecPicTimingSEI, %function
H264_DecPicTimingSEI:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 4000
	bl	_mcount
	ldr	w0, [x20, 15012]
	ldr	x3, [x20, 14960]
	umull	x19, w0, w19
	add	x19, x3, x19
	ldrb	w0, [x19, 23]
	cbnz	w0, .L2464
	ldr	w1, [x20, 14944]
	cmp	w1, wzr
	ble	.L2465
	ldrb	w0, [x3, 23]
	cbnz	w0, .L2482
	sub	w1, w1, #1
	add	x0, x3, 4000
	add	x2, x1, 1
	lsl	x1, x2, 6
	sub	x1, x1, x2
	lsl	x1, x1, 1
	sub	x1, x1, x2
	add	x2, x3, x1, lsl 5
	b	.L2468
	.p2align 3
.L2469:
	ldrb	w1, [x1]
	cbnz	w1, .L2466
.L2468:
	cmp	x0, x2
	mov	x19, x0
	add	x0, x0, 4000
	sub	x1, x0, #3977
	bne	.L2469
.L2465:
	ldr	x1, .LC737
	mov	w0, 1
	mov	w19, -1
	bl	dprint_vfmw
.L2470:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L2482:
	mov	x19, x3
	.p2align 2
.L2466:
	cbz	x19, .L2465
.L2464:
	ldrb	w0, [x19, 22]
	cbz	w0, .L2472
	ldrb	w0, [x19, 3299]
	cbz	w0, .L2483
	ldr	w1, [x19, 3676]
	ldr	w22, [x19, 3680]
	add	w1, w1, 1
	add	w22, w22, 1
.L2476:
	ldr	x2, .LC739
	mov	x0, x20
	add	x21, x20, 24576
	bl	u_v
	ldr	x2, .LC741
	mov	w1, w22
	str	w0, [x21, 3224]
	mov	x0, x20
	bl	u_v
	str	w0, [x21, 3228]
	add	x1, x20, 65536
	ldr	x0, .LC742
	ldrsw	x1, [x1, 1980]
	ldr	x0, [x0, x1, lsl 3]
	ldrsb	w1, [x0, 44]
	cmp	w1, 1
	beq	.L2484
.L2472:
	ldrb	w0, [x19, 3303]
	mov	w19, 0
	cbz	w0, .L2470
	ldr	x2, .LC744
	mov	w1, 4
	mov	x0, x20
	bl	u_v
	add	x1, x20, 24576
	strb	w0, [x1, 3220]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2483:
	ldrb	w0, [x19, 3302]
	cbz	w0, .L2472
	ldr	w1, [x19, 3988]
	ldr	w22, [x19, 3992]
	add	w1, w1, 1
	add	w22, w22, 1
	b	.L2476
	.p2align 3
.L2484:
	ldr	x1, [x0, 160]
	mov	x0, 1
	movk	x0, 0x2, lsl 32
	cmp	x1, x0
	bne	.L2472
	mov	x0, x20
	bl	H264_Sei_Get_Dpb_Output_Time
	b	.L2472
	.size	H264_DecPicTimingSEI, .-H264_DecPicTimingSEI
	.align	3
.LC737:
	.xword	.LC736
	.align	3
.LC739:
	.xword	.LC738
	.align	3
.LC741:
	.xword	.LC740
	.align	3
.LC742:
	.xword	s_pstVfmwChan
	.align	3
.LC744:
	.xword	.LC743
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_DecSEI
	.type	H264_DecSEI, %function
H264_DecSEI:
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
	strb	wzr, [x29, 127]
	cbz	x19, .L2611
	add	x22, x19, 65536
	ldr	x0, .LC747
	ldrsw	x1, [x22, 1980]
	ldr	x0, [x0, x1, lsl 3]
	ldrsb	w1, [x0, 44]
	cmp	w1, 1
	beq	.L2612
.L2488:
	ldr	x0, [x19, 632]
	mov	w1, 32
	str	w1, [x0, 28]
.L2489:
	mov	w20, 0
	b	.L2493
	.p2align 3
.L2490:
	ldrb	w2, [x29, 127]
	mov	w1, 1
	mov	x0, x19
	add	w20, w20, w2
	bl	SkipBytes
	cmp	w0, wzr
	ble	.L2492
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2613
.L2493:
	mov	w2, 1
	add	x1, x29, 127
	mov	x0, x19
	bl	GetBytes
	cmp	w0, wzr
	bgt	.L2490
.L2492:
	ldr	x1, .LC749
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
.L2487:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2613:
	ldr	x23, .LC755
	mov	w24, 0
	ldr	x27, .LC757
	add	x23, x23, 248
	mov	x26, x23
	mov	x25, x23
.L2579:
	mov	w21, 0
	b	.L2496
	.p2align 3
.L2494:
	ldrb	w2, [x29, 127]
	mov	w1, 1
	mov	x0, x19
	add	w21, w21, w2
	bl	SkipBytes
	cmp	w0, wzr
	ble	.L2492
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2614
.L2496:
	mov	w2, 1
	add	x1, x29, 127
	mov	x0, x19
	bl	GetBytes
	cmp	w0, wzr
	bgt	.L2494
.L2497:
	ldr	x1, .LC751
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2612:
	mov	x1, 1
	ldr	x2, [x0, 160]
	movk	x1, 0x2, lsl 32
	cmp	x2, x1
	bne	.L2488
	ldr	w0, [x0, 156]
	cmp	w0, 1
	bne	.L2488
	ldr	x0, [x19, 632]
	mov	w1, 48
	str	w1, [x0, 28]
	b	.L2489
	.p2align 3
.L2614:
	cmp	w21, 409600
	bgt	.L2497
	ldr	x0, [x19, 632]
	ldr	w1, [x0, 76]
	ldr	w2, [x0, 28]
	cmp	w1, 2
	beq	.L2615
.L2499:
	cmp	w20, 45
	bls	.L2616
.L2500:
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbnz	w0, #31, .L2617
.L2575:
	mov	w1, w21
	mov	x0, x19
	bl	SkipBytes
.L2606:
	ldr	w0, [x22, 664]
.L2525:
	cmp	w0, 3
	bhi	.L2618
	mov	w20, 0
	b	.L2578
	.p2align 3
.L2620:
	ldrb	w2, [x29, 127]
	mov	w1, 1
	mov	x0, x19
	add	w20, w20, w2
	bl	SkipBytes
	cmp	w0, wzr
	ble	.L2492
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2619
.L2578:
	mov	w2, 1
	add	x1, x29, 127
	mov	x0, x19
	bl	GetBytes
	cmp	w0, wzr
	bgt	.L2620
	b	.L2492
.L2616:
	ldr	x0, .LC752
	ldrh	w0, [x0,w20,uxtw #1]
	adr	x1, .Lrtx2502
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx2502:
	.section	.rodata
	.align	0
	.align	2
.L2502:
	.2byte	(.L2501 - .Lrtx2502) / 4
	.2byte	(.L2503 - .Lrtx2502) / 4
	.2byte	(.L2504 - .Lrtx2502) / 4
	.2byte	(.L2505 - .Lrtx2502) / 4
	.2byte	(.L2506 - .Lrtx2502) / 4
	.2byte	(.L2506 - .Lrtx2502) / 4
	.2byte	(.L2507 - .Lrtx2502) / 4
	.2byte	(.L2508 - .Lrtx2502) / 4
	.2byte	(.L2509 - .Lrtx2502) / 4
	.2byte	(.L2510 - .Lrtx2502) / 4
	.2byte	(.L2511 - .Lrtx2502) / 4
	.2byte	(.L2512 - .Lrtx2502) / 4
	.2byte	(.L2513 - .Lrtx2502) / 4
	.2byte	(.L2514 - .Lrtx2502) / 4
	.2byte	(.L2515 - .Lrtx2502) / 4
	.2byte	(.L2516 - .Lrtx2502) / 4
	.2byte	(.L2517 - .Lrtx2502) / 4
	.2byte	(.L2518 - .Lrtx2502) / 4
	.2byte	(.L2519 - .Lrtx2502) / 4
	.2byte	(.L2520 - .Lrtx2502) / 4
	.2byte	(.L2521 - .Lrtx2502) / 4
	.2byte	(.L2522 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2500 - .Lrtx2502) / 4
	.2byte	(.L2523 - .Lrtx2502) / 4
	.text
.L2523:
	mov	w1, w21
	mov	x0, x19
	ldr	w20, [x19, 14920]
	bl	H264_DecFramePackingSEI
	ldr	w0, [x19, 14920]
	sub	w20, w0, w20
	lsl	w0, w21, 3
	cmp	w20, w0
	blt	.L2621
.L2572:
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2606
	ldr	x1, .LC757
	mov	w3, 11494
	mov	x2, x26
	mov	w0, 20
	bl	dprint_vfmw
	ldr	w0, [x22, 664]
	b	.L2525
.L2522:
	ldr	x1, .LC810
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x1, .LC757
	mov	w3, 11467
	mov	x2, x25
	mov	w0, 20
	bl	dprint_vfmw
	b	.L2575
.L2521:
	ldr	x1, .LC808
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x2, .LC755
	mov	w3, 11454
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2575
.L2520:
	ldr	x1, .LC806
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x2, .LC755
	mov	w3, 11441
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2575
.L2519:
	ldr	x1, .LC804
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x2, .LC755
	mov	w3, 11428
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2575
.L2518:
	ldr	x1, .LC802
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x2, .LC755
	mov	w3, 11415
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2575
.L2517:
	ldr	x1, .LC800
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x2, .LC755
	mov	w3, 11402
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2575
.L2516:
	ldr	x1, .LC798
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x2, .LC755
	mov	w3, 11389
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2575
.L2515:
	ldr	x1, .LC796
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x2, .LC755
	mov	w3, 11376
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2575
.L2514:
	ldr	x1, .LC794
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x2, .LC755
	mov	w3, 11362
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2575
.L2513:
	ldr	x1, .LC792
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x2, .LC755
	mov	w3, 11349
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2575
.L2512:
	ldr	x1, .LC790
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x2, .LC755
	mov	w3, 11336
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2575
.L2511:
	ldr	x1, .LC788
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x2, .LC755
	mov	w3, 11323
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2575
.L2510:
	ldr	x1, .LC786
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x2, .LC755
	mov	w3, 11310
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2575
.L2509:
	ldr	x1, .LC784
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x2, .LC755
	mov	w3, 11297
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2575
.L2508:
	ldr	x1, .LC782
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x2, .LC755
	mov	w3, 11284
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2575
.L2507:
	ldr	x1, .LC780
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	SkipBytes
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2606
	ldr	x2, .LC755
	mov	w3, 11272
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	ldr	w0, [x22, 664]
	b	.L2525
.L2506:
	cmp	w20, 4
	beq	.L2532
	cbnz	w24, .L2532
	ldr	x1, .LC767
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
.L2534:
	ldr	w20, [x22, 664]
	cmp	w20, 3
	bhi	.L2622
.L2535:
	ldr	w0, [x22, 1980]
	bl	GetUsd
	uxtw	x1, w20
	add	x1, x1, 8192
	add	x1, x1, 84
	str	x0, [x19, x1, lsl 3]
	ldr	w0, [x22, 664]
	add	x0, x0, 8192
	add	x0, x0, 84
	ldr	x5, [x19, x0, lsl 3]
	cbz	x5, .L2582
	ldr	x3, [x19, 632]
	cmp	w21, 1024
	mov	w20, 1024
	csel	w20, w21, w20, le
	ldrb	w2, [x3]
	ldr	w4, [x3, 76]
	cmp	w4, w2
	bls	.L2583
	mov	w28, 0
.L2537:
	ubfiz	x1, x2, 5, 32
	add	w2, w2, 1
	add	x1, x3, x1
	cmp	w4, w2
	ldr	w0, [x1, 28]
	ldr	w1, [x1, 16]
	add	w0, w0, 7
	sub	w0, w1, w0, lsr 3
	add	w28, w28, w0
	bne	.L2537
	mov	w0, w28
.L2536:
	cmp	w20, w0
	csel	w28, w28, w20, gt
	cbnz	w24, .L2623
	mov	w3, 0
	mov	w5, 0
.L2539:
	sub	w2, w28, w3
	cmp	w2, wzr
	ble	.L2624
	ldr	w0, [x22, 664]
	str	w5, [x29, 104]
	add	x0, x0, 8192
	add	x0, x0, 84
	ldr	x1, [x19, x0, lsl 3]
	mov	x0, x19
	bl	GetBytes
	cmp	w0, wzr
	ldr	w5, [x29, 104]
	ble	.L2625
	cmp	w0, 4
	bgt	.L2545
	ldr	w1, [x22, 664]
	add	x1, x1, 8192
	add	x1, x1, 84
	ldr	x2, [x19, x1, lsl 3]
.L2546:
	sub	w1, w20, w5
	cmp	w0, w1
	blt	.L2626
	sub	w28, w21, w5
	cmp	w20, w21
	str	w28, [x2, 1052]
	bcc	.L2627
.L2551:
	mov	w1, w28
	mov	x0, x19
	bl	SkipBytes
.L2549:
	ldr	w0, [x22, 664]
	cmp	w24, 1
	ldr	x1, [x19]
	mov	w2, 8
	add	x0, x0, 8192
	add	x0, x0, 84
	ldr	x1, [x1, 64]
	ldr	x0, [x19, x0, lsl 3]
	str	x1, [x0, 1056]
	ldr	w0, [x22, 664]
	add	x0, x0, 8192
	add	x0, x0, 84
	ldr	x1, [x19, x0, lsl 3]
	mov	w0, 9
	csel	w0, w0, w2, ne
	str	w0, [x1, 1040]
.L2610:
	ldr	w0, [x22, 664]
	ldr	x1, .LC774
	add	x0, x0, 8192
	add	x0, x0, 84
	ldr	x4, [x1]
	ldr	w1, [x22, 1940]
	ldr	x0, [x19, x0, lsl 3]
	str	w1, [x0, 1044]
	cbz	x4, .L2554
	ldr	w0, [x22, 664]
	mov	w3, 1064
	mov	w1, 6
	add	x0, x0, 8192
	add	x0, x0, 84
	ldr	x2, [x19, x0, lsl 3]
	ldr	w0, [x22, 1980]
	blr	x4
.L2554:
	ldr	w0, [x22, 664]
	add	w0, w0, 1
	str	w0, [x22, 664]
	b	.L2525
.L2505:
	ldr	x1, .LC763
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x2, .LC755
	mov	w3, 11100
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2575
.L2504:
	ldr	x1, .LC761
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x2, .LC755
	mov	w3, 11086
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2575
.L2503:
	ldr	x1, .LC759
	mov	w3, w21
	mov	w0, 20
	bl	dprint_vfmw
	ldr	w20, [x19, 14920]
	mov	w1, w21
	mov	x0, x19
	bl	H264_DecPicTimingSEI
	ldr	w0, [x19, 14920]
	sub	w20, w0, w20
	lsl	w0, w21, 3
	cmp	w20, w0
	blt	.L2628
.L2527:
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2606
	ldr	x2, .LC755
	mov	w3, 11074
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	ldr	w0, [x22, 664]
	b	.L2525
.L2501:
	add	x0, x19, 24576
	mov	w3, 1
	ldr	w1, [x0, 3232]
	strb	w3, [x0, 3312]
	mov	w3, w21
	add	w1, w1, 1
	str	w1, [x0, 3232]
	ldr	x1, .LC754
	str	wzr, [x0, 3240]
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2575
	ldr	x2, .LC755
	mov	w3, 11046
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2575
.L2617:
	mov	w3, 11506
	mov	x2, x23
	mov	x1, x27
	mov	w0, 20
	bl	dprint_vfmw
	b	.L2575
	.p2align 3
.L2619:
	cmp	w0, 128
	bne	.L2579
	mov	w0, 0
	b	.L2487
	.p2align 3
.L2615:
	ldr	w0, [x0, 60]
	add	w2, w2, w0
	lsr	w2, w2, 3
	b	.L2499
.L2611:
	ldr	x2, .LC745
	mov	w3, 10947
	ldr	x1, .LC746
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2487
.L2545:
	ldr	w3, [x22, 664]
	mov	w1, 21572
	movk	w1, 0x3147, lsl 16
	add	x3, x19, x3, lsl 3
	add	x3, x3, 65536
	ldr	x2, [x3, 672]
	ldr	w4, [x2]
	cmp	w4, w1
	bne	.L2546
	ldrb	w1, [x2, 4]
	ldrb	w4, [x22, 2068]
	cmp	w1, 65
	cset	w1, eq
	bfi	w4, w1, 0, 1
	strb	w4, [x22, 2068]
	tbz	x4, 0, .L2605
	ldrb	w1, [x2, 5]
	bfi	w4, w1, 1, 4
	strb	w4, [x22, 2068]
.L2605:
	ldr	x2, [x3, 672]
	b	.L2546
.L2618:
	ldr	x1, .LC812
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2487
.L2621:
	sub	w20, w0, w20
	mov	x0, x19
	cmp	w20, wzr
	add	w1, w20, 7
	csel	w1, w1, w20, lt
	asr	w1, w1, 3
	bl	SkipBytes
	asr	w1, w20, 31
	ldr	w2, [x19, 14912]
	lsr	w1, w1, 29
	add	w0, w20, w1
	and	w0, w0, 7
	sub	w1, w0, w1
	ldr	w0, [x19, 14920]
	add	w0, w1, w0
	cmp	w0, w2, lsl 3
	bhi	.L2572
	add	x0, x19, 12288
	add	x0, x0, 2600
	bl	BsSkip
	b	.L2572
	.p2align 3
.L2627:
	sub	w1, w21, w20
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2551
	ldr	x2, .LC755
	mov	w3, 11246
	ldr	x1, .LC757
	mov	w0, 20
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L2551
	.p2align 3
.L2626:
	mov	w1, w0
	str	w0, [x2, 1052]
	mov	x0, x19
	bl	SkipBytes
	b	.L2549
.L2623:
	strb	w24, [x5, 1026]
	mov	w1, 8
	ldr	x2, .LC769
	mov	x0, x19
	ldr	w3, [x22, 664]
	add	x3, x3, 8192
	add	x3, x3, 84
	ldr	x3, [x19, x3, lsl 3]
	str	x3, [x29, 104]
	bl	u_v
	ldr	x3, [x29, 104]
	strb	w0, [x3, 1027]
	ldr	w0, [x22, 664]
	add	x0, x0, 8192
	add	x0, x0, 84
	ldr	x3, [x19, x0, lsl 3]
	ldrb	w0, [x3, 1027]
	cmp	w0, 255
	beq	.L2540
	strb	wzr, [x3, 1028]
	mov	w3, 3
	mov	w5, w3
.L2541:
	ldr	w0, [x22, 664]
	mov	w1, 16
	ldr	x2, .LC773
	add	x0, x0, 8192
	add	x0, x0, 84
	stp	w3, w5, [x29, 96]
	ldr	x4, [x19, x0, lsl 3]
	mov	x0, x19
	str	x4, [x29, 104]
	bl	u_v
	ldr	x4, [x29, 104]
	ldr	w3, [x29, 96]
	str	w3, [x29, 104]
	mov	w1, w3
	strh	w0, [x4, 1030]
	mov	x0, x19
	bl	PassBytes
	ldp	w5, w3, [x29, 100]
	cmp	w28, w3
	bne	.L2539
	ldr	w0, [x22, 664]
	ldr	x1, [x19]
	add	x0, x0, 8192
	add	x0, x0, 84
	ldr	x1, [x1, 64]
	ldr	x0, [x19, x0, lsl 3]
	str	x1, [x0, 1056]
	mov	w1, 8
	ldr	w0, [x22, 664]
	add	x0, x0, 8192
	add	x0, x0, 84
	ldr	x0, [x19, x0, lsl 3]
	str	w1, [x0, 1040]
	b	.L2610
	.p2align 3
.L2622:
	ldr	w0, [x22, 1980]
	mov	w20, 0
	ldr	x1, [x22, 672]
	bl	FreeUsdByDec
	ldr	w0, [x22, 1980]
	ldr	x1, [x22, 680]
	bl	FreeUsdByDec
	ldr	w0, [x22, 1980]
	ldr	x1, [x22, 688]
	bl	FreeUsdByDec
	ldr	w0, [x22, 1980]
	ldr	x1, [x22, 696]
	bl	FreeUsdByDec
	str	wzr, [x22, 664]
	add	x0, x22, 512
	stp	xzr, xzr, [x0, 160]
	stp	xzr, xzr, [x0, 176]
	b	.L2535
.L2628:
	sub	w20, w0, w20
	mov	x0, x19
	cmp	w20, wzr
	add	w1, w20, 7
	csel	w1, w1, w20, lt
	asr	w1, w1, 3
	bl	SkipBytes
	asr	w1, w20, 31
	ldr	w2, [x19, 14912]
	lsr	w1, w1, 29
	add	w0, w20, w1
	and	w0, w0, 7
	sub	w1, w0, w1
	ldr	w0, [x19, 14920]
	add	w0, w1, w0
	cmp	w0, w2, lsl 3
	bhi	.L2527
	add	x0, x19, 12288
	add	x0, x0, 2600
	bl	BsSkip
	b	.L2527
	.p2align 3
.L2532:
	ldr	x1, .LC765
	mov	w3, w21
	mov	w0, 20
	mov	w24, 1
	bl	dprint_vfmw
	b	.L2534
.L2540:
	ldr	x2, .LC771
	mov	w1, 8
	mov	x0, x19
	str	x3, [x29, 104]
	bl	u_v
	ldr	x3, [x29, 104]
	strb	w0, [x3, 1028]
	mov	w3, 4
	mov	w5, w3
	b	.L2541
.L2625:
	ldr	x1, .LC778
	mov	w0, 1
	bl	dprint_vfmw
.L2607:
	ldr	w1, [x22, 664]
	ldr	w0, [x22, 1980]
	add	x1, x1, 8192
	add	x1, x1, 84
	ldr	x1, [x19, x1, lsl 3]
	bl	FreeUsdByDec
	ldr	w1, [x22, 664]
	mov	w0, -1
	add	x1, x1, 8192
	add	x1, x1, 84
	str	xzr, [x19, x1, lsl 3]
	b	.L2487
.L2624:
	ldr	x1, .LC776
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2607
.L2583:
	mov	w0, 0
	mov	w28, 0
	b	.L2536
.L2582:
	mov	w0, -1
	b	.L2487
	.size	H264_DecSEI, .-H264_DecSEI
	.align	3
.LC745:
	.xword	.LC30
	.align	3
.LC746:
	.xword	.LC32
	.align	3
.LC747:
	.xword	s_pstVfmwChan
	.align	3
.LC749:
	.xword	.LC748
	.align	3
.LC751:
	.xword	.LC750
	.align	3
.LC752:
	.xword	.L2502
	.align	3
.LC754:
	.xword	.LC753
	.align	3
.LC755:
	.xword	.LANCHOR2
	.align	3
.LC757:
	.xword	.LC756
	.align	3
.LC759:
	.xword	.LC758
	.align	3
.LC761:
	.xword	.LC760
	.align	3
.LC763:
	.xword	.LC762
	.align	3
.LC765:
	.xword	.LC764
	.align	3
.LC767:
	.xword	.LC766
	.align	3
.LC769:
	.xword	.LC768
	.align	3
.LC771:
	.xword	.LC770
	.align	3
.LC773:
	.xword	.LC772
	.align	3
.LC774:
	.xword	g_event_report
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
	.align	3
.LC784:
	.xword	.LC783
	.align	3
.LC786:
	.xword	.LC785
	.align	3
.LC788:
	.xword	.LC787
	.align	3
.LC790:
	.xword	.LC789
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
.LC810:
	.xword	.LC809
	.align	3
.LC812:
	.xword	.LC811
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_IsNewPicNal
	.type	H264_IsNewPicNal, %function
H264_IsNewPicNal:
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
	bls	.L2638
.L2637:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2638:
	ldr	x1, .LC814
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx2632
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx2632:
	.section	.rodata
	.align	0
	.align	2
.L2632:
	.byte	(.L2631 - .Lrtx2632) / 4
	.byte	(.L2637 - .Lrtx2632) / 4
	.byte	(.L2637 - .Lrtx2632) / 4
	.byte	(.L2637 - .Lrtx2632) / 4
	.byte	(.L2631 - .Lrtx2632) / 4
	.byte	(.L2637 - .Lrtx2632) / 4
	.byte	(.L2633 - .Lrtx2632) / 4
	.byte	(.L2633 - .Lrtx2632) / 4
	.text
	.p2align 3
.L2633:
	ldr	w0, [x19]
	mov	w1, 1
	str	w1, [x19]
	cmp	w0, wzr
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2631:
	ldr	w0, [x19]
	cbz	w0, .L2634
.L2636:
	mov	w0, -1
	str	wzr, [x19]
.L2639:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2634:
	ldr	w20, [x20, 4]
	rev	w20, w20
	mov	w0, w20
	bl	ZerosMS_32
	cmp	w0, 15
	bhi	.L2636
	mov	w1, 31
	str	wzr, [x19]
	sub	w0, w1, w0, lsl 1
	lsr	w20, w20, w0
	cmp	w20, 1
	csetm	w0, ne
	b	.L2639
	.size	H264_IsNewPicNal, .-H264_IsNewPicNal
	.align	3
.LC814:
	.xword	.L2632
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FindZeroBitsInSeg
	.type	FindZeroBitsInSeg, %function
FindZeroBitsInSeg:
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
	ble	.L2660
	and	w1, w23, 63
	add	w0, w23, 63
	cmp	w1, wzr
	cset	w26, ne
	cmp	w23, wzr
	csel	w0, w0, w23, lt
	add	w26, w26, w0, asr 6
	cmp	w26, wzr
	ble	.L2653
	ldr	x20, .LC818
	mov	w25, w23
	ldr	x27, .LC817
	mov	w19, 0
	mov	w24, 64
	add	x20, x20, 1856
	.p2align 2
.L2652:
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
	cbnz	w1, .L2644
	cmp	x0, x20
	add	w19, w19, 1
	bne	.L2647
	b	.L2645
	.p2align 3
.L2648:
	add	w19, w19, 1
	beq	.L2645
.L2647:
	ldrb	w1, [x0, -1]!
	cmp	x0, x20
	cbz	w1, .L2648
.L2644:
	lsl	w0, w19, 3
.L2643:
	cmp	w19, w23
	mov	w1, 0
	bge	.L2649
	sxtw	x2, w23
	sub	x2, x2, #1
	sub	x19, x2, x19, sxtw
	ldrb	w2, [x22, x19]
	tbnz	x2, 0, .L2649
	lsr	w2, w2, 1
	mov	w1, 1
	.p2align 2
.L2651:
	tbnz	x2, 0, .L2649
	add	w1, w1, 1
	lsr	w2, w2, 1
	cmp	w1, 8
	bne	.L2651
.L2649:
	add	w0, w1, w0
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2645:
	subs	w26, w26, #1
	sub	w25, w25, #64
	bne	.L2652
	b	.L2644
.L2660:
	ldr	x1, .LC816
	mov	w2, w23
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x27, [sp, 80]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
.L2653:
	mov	w0, 0
	mov	w19, 0
	b	.L2643
	.size	FindZeroBitsInSeg, .-FindZeroBitsInSeg
	.align	3
.LC816:
	.xword	.LC815
	.align	3
.LC817:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC818:
	.xword	.LANCHOR4
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FindTrailZeros
	.type	FindTrailZeros, %function
FindTrailZeros:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L2667
	ldr	x2, [x19, 632]
	ldr	w0, [x2, 76]
	cmp	w0, 1
	bls	.L2666
	ldr	w1, [x2, 48]
	ldr	x0, [x2, 40]
	bl	FindZeroBitsInSeg
	ldr	x2, [x19, 632]
	ldr	w1, [x2, 48]
	cmp	w0, w1, lsl 3
	bcs	.L2670
	cmn	w0, #1
	beq	.L2666
	add	w0, w0, 1
	str	w0, [x2, 80]
	ldr	x0, [x19, 632]
	ldr	w1, [x0, 76]
	cmp	w1, 1
	bls	.L2668
.L2671:
	ldr	w2, [x0, 48]
	mov	w20, 0
	ldr	w1, [x0, 80]
	cmp	w1, w2, lsl 3
	bcc	.L2662
	add	x2, x19, 65536
	ldr	w1, [x0, 68]
	ldr	w0, [x2, 1980]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 632]
	mov	w1, 1
	str	xzr, [x0, 40]
	ldr	x0, [x19, 632]
	str	w1, [x0, 76]
	ldr	x0, [x19, 632]
	str	wzr, [x0, 80]
.L2662:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2670:
	add	x0, x19, 65536
	ldr	w1, [x2, 68]
	ldr	w0, [x0, 1980]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 632]
	mov	w1, 1
	str	xzr, [x0, 40]
	ldr	x0, [x19, 632]
	str	w1, [x0, 76]
	ldr	x2, [x19, 632]
.L2666:
	ldr	w1, [x2, 16]
	ldr	x0, [x2, 8]
	bl	FindZeroBitsInSeg
	add	w0, w0, 1
	ldr	x2, [x19, 632]
	str	w0, [x2, 80]
	ldr	x0, [x19, 632]
	ldr	w1, [x0, 76]
	cmp	w1, 1
	bhi	.L2671
.L2668:
	mov	w20, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L2667:
	mov	w20, -1
	b	.L2662
	.size	FindTrailZeros, .-FindTrailZeros
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CombinePacket
	.type	CombinePacket, %function
CombinePacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L2672
	ldr	x0, [x19, 632]
	ldr	w0, [x0, 16]
	cmp	w0, 4095
	bhi	.L2672
	mov	x0, x19
	bl	CombinePacket.part.17
.L2672:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CombinePacket, .-CombinePacket
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FindNaluArraySlot
	.type	FindNaluArraySlot, %function
FindNaluArraySlot:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L2682
	ldrb	w0, [x19, 641]
	cbz	w0, .L2683
	add	x0, x19, 745
	mov	x1, 1
	b	.L2681
	.p2align 3
.L2680:
	add	w1, w1, 1
	cmp	w1, 137
	beq	.L2682
.L2681:
	ldrb	w2, [x0]
	add	x0, x0, 104
	cbnz	w2, .L2680
	mov	w0, w1
.L2679:
	lsl	x2, x1, 3
	mov	w3, 1
	sub	x2, x2, x1
	lsl	x2, x2, x3
	sub	x1, x2, x1
	add	x1, x19, x1, lsl 3
	strb	w3, [x1, 641]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2682:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L2683:
	mov	w0, 0
	mov	x1, 0
	b	.L2679
	.size	FindNaluArraySlot, .-FindNaluArraySlot
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InquireSliceExtProperty
	.type	InquireSliceExtProperty, %function
InquireSliceExtProperty:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 12288
	mov	w1, 24
	add	x0, x0, 2600
	bl	BsGet
	ubfx	x2, x0, 23, 1
	ldr	x1, [x19, 632]
	strb	w2, [x1, 3]
	ldr	x3, [x19, 632]
	ldrb	w1, [x3, 3]
	cbnz	w1, .L2687
	add	x1, x19, 61440
	ldrb	w2, [x1, 3560]
.L2688:
	cmp	w2, 1
	bne	.L2689
	mov	w0, 5
	strb	w0, [x3, 2]
.L2689:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2687:
	add	x1, x19, 61440
	ubfx	x5, x0, 16, 6
	ubfx	x4, x0, 15, 1
	ubfx	x2, x0, 22, 1
	ubfx	x9, x0, 12, 3
	ubfx	x8, x0, 8, 4
	ubfx	x7, x0, 5, 3
	ubfx	x6, x0, 4, 1
	strb	w5, [x1, 3561]
	ubfx	x5, x0, 3, 1
	strb	w4, [x1, 3562]
	ubfx	x4, x0, 2, 1
	strb	w2, [x1, 3560]
	and	w0, w0, 3
	strb	w9, [x1, 3563]
	strb	w8, [x1, 3564]
	strb	w7, [x1, 3565]
	strb	w6, [x1, 3566]
	strb	w5, [x1, 3567]
	strb	w4, [x1, 3568]
	strb	w0, [x1, 3569]
	b	.L2688
	.size	InquireSliceExtProperty, .-InquireSliceExtProperty
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InquireSliceProperty
	.type	InquireSliceProperty, %function
InquireSliceProperty:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x22, x19, 65536
	mov	x23, x1
	mov	x21, x2
	bl	_mcount
	ldr	x1, .LC821
	mov	w0, 22
	ldr	w2, [x22, 1924]
	add	x20, x19, 20480
	sub	w2, w2, #1
	bl	dprint_vfmw
	str	wzr, [x21]
	str	wzr, [x23]
	mov	x0, x19
	ldr	x1, [x19, 632]
	ldrb	w2, [x1, 2]
	strb	w2, [x20, 1587]
	ldr	w1, [x1, 84]
	str	w1, [x20, 1612]
	bl	SliceCheck
	mov	w24, w0
	cbnz	w0, .L2695
	mov	x0, x19
	bl	ProcessSliceHeaderFirstPart
	cbnz	w0, .L2699
	ldrb	w2, [x20, 1589]
	mov	w1, 2208
	mov	w0, 4000
	cmp	w2, 1
	cset	w2, eq
	str	w2, [x23]
	ldr	w2, [x20, 1592]
	ldr	x4, [x19, 14968]
	ldr	x3, [x19, 14960]
	umull	x1, w2, w1
	ldr	w2, [x22, 1992]
	add	x1, x4, x1
	ldr	w5, [x19, 14932]
	cmp	w2, 1
	ldr	w4, [x19, 14936]
	ldr	w1, [x1, 28]
	umull	x0, w1, w0
	add	x0, x3, x0
	ldr	w2, [x0, 3248]
	ldrb	w1, [x0, 18]
	ldr	w20, [x0, 3252]
	add	w23, w2, 1
	mov	w2, 2
	sub	w1, w2, w1
	madd	w20, w20, w1, w1
	beq	.L2700
	cmp	w5, w23
	ccmp	w4, w20, 0, eq
	bne	.L2701
.L2694:
	add	x19, x19, 24576
	ldr	w1, [x0, 3272]
	ldr	w0, [x19, 3704]
	add	w0, w0, 1
	cmp	w1, w0
	beq	.L2691
	mov	w0, 1
	str	w0, [x21]
.L2691:
	mov	w0, w24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2701:
	mov	w1, 1
	str	w1, [x21]
	b	.L2694
	.p2align 3
.L2700:
	add	x0, x19, 12288
	add	x0, x0, 2600
	bl	BsResidBits
	ldr	w1, [x22, 1904]
	mul	w2, w23, w20
	add	w1, w1, 1
	ldp	x19, x20, [sp, 16]
	udiv	w1, w2, w1
	ldp	x21, x22, [sp, 32]
	cmp	w0, w1
	ccmp	w0, wzr, 1, ge
	csetm	w24, lt
	mov	w0, w24
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2695:
	mov	w24, -1
	b	.L2691
	.p2align 3
.L2699:
	ldr	x1, .LC823
	mov	w0, 1
	mov	w24, -1
	bl	dprint_vfmw
	b	.L2691
	.size	InquireSliceProperty, .-InquireSliceProperty
	.align	3
.LC821:
	.xword	.LC820
	.align	3
.LC823:
	.xword	.LC822
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HaveSliceToDec
	.type	HaveSliceToDec, %function
HaveSliceToDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 65536
	bl	_mcount
	ldr	w0, [x19, 1904]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	csetm	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	HaveSliceToDec, .-HaveSliceToDec
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_Destroy
	.type	H264DEC_Destroy, %function
H264DEC_Destroy:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	bl	_mcount
	cbz	x22, .L2727
	mov	x0, x22
	add	x20, x22, 12288
	add	x19, x22, 640
	add	x21, x22, 65536
	bl	H264_ClearCurrPic
	add	x20, x20, 2600
	b	.L2707
	.p2align 3
.L2706:
	add	x19, x19, 104
	cmp	x20, x19
	beq	.L2728
.L2707:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L2706
	ldr	w0, [x21, 1980]
	mov	x1, x19
	add	x19, x19, 104
	bl	ReleaseNAL
	cmp	x20, x19
	bne	.L2707
.L2728:
	ldr	w0, [x21, 1916]
	cmp	w0, 1
	beq	.L2729
.L2708:
	ldr	w0, [x21, 664]
	mov	w20, 0
	cbz	w0, .L2713
	.p2align 2
.L2721:
	add	x19, x22, x20, uxtw 3
	add	w20, w20, 1
	add	x19, x19, 65536
	ldr	x0, [x19, 672]
	mov	x1, x0
	cbz	x0, .L2711
	ldr	w0, [x21, 1980]
	bl	FreeUsdByDec
	str	xzr, [x19, 672]
.L2711:
	ldr	w0, [x21, 664]
	cmp	w0, w20
	bhi	.L2721
.L2713:
	add	x20, x22, 28672
	add	x22, x22, 61440
	add	x20, x20, 1144
	add	x22, x22, 2616
	.p2align 2
.L2710:
	sub	x19, x20, #32
.L2715:
	ldr	x0, [x19]
	mov	x1, x0
	cbz	x0, .L2714
	ldr	w0, [x21, 1980]
	bl	FreeUsdByDec
	str	xzr, [x19]
.L2714:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L2715
	add	x20, x19, 856
	cmp	x20, x22
	bne	.L2710
	ldr	x1, .LC827
	mov	w0, 2
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L2729:
	str	wzr, [x21, 1916]
	b	.L2708
.L2727:
	ldr	x2, .LC824
	mov	w3, 12475
	ldr	x1, .LC825
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	H264DEC_Destroy, .-H264DEC_Destroy
	.align	3
.LC824:
	.xword	.LC30
	.align	3
.LC825:
	.xword	.LC32
	.align	3
.LC827:
	.xword	.LC826
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_IsNeedSedOnly
	.type	H264DEC_IsNeedSedOnly, %function
H264DEC_IsNeedSedOnly:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 65536
	bl	_mcount
	ldr	w0, [x20, 1904]
	cbz	w0, .L2733
	ldr	x1, [x19, 616]
	cbz	x1, .L2738
.L2733:
	mov	w0, 0
.L2732:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2738:
	ldr	w1, [x20, 2004]
	cmp	w0, w1
	beq	.L2733
	ldr	w0, [x20, 1992]
	cmp	w0, 1
	beq	.L2739
	cbnz	w0, .L2733
	ldr	w0, [x20, 1980]
	bl	VCTRL_CheckFreshRaw
	cbz	w0, .L2733
	ldr	w0, [x20, 1980]
	bl	VCTRL_CheckFreshSeg
	cmp	w0, wzr
	cset	w0, ne
	b	.L2732
	.p2align 3
.L2739:
	ldr	x0, [x19, 632]
	cmp	x0, xzr
	cset	w0, ne
	b	.L2732
	.size	H264DEC_IsNeedSedOnly, .-H264DEC_IsNeedSedOnly
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_IsSliceUnit
	.type	H264DEC_IsSliceUnit, %function
H264DEC_IsSliceUnit:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	and	w0, w19, -5
	cmp	w0, 1
	ccmp	w19, 20, 4, ne
	ldr	x19, [sp, 16]
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	H264DEC_IsSliceUnit, .-H264DEC_IsSliceUnit
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_IsFrameEndNal
	.type	H264DEC_IsFrameEndNal, %function
H264DEC_IsFrameEndNal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sub	w0, w19, #7
	cmp	w0, 1
	bls	.L2743
	and	w0, w19, -5
	cmp	w0, 11
	ccmp	w19, 30, 4, ne
	ldr	x19, [sp, 16]
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2743:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H264DEC_IsFrameEndNal, .-H264DEC_IsFrameEndNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_RecycleImage
	.type	H264DEC_RecycleImage, %function
H264DEC_RecycleImage:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w22, w1
	bl	_mcount
	ldr	x1, .LC829
	mov	w0, 2
	bl	dprint_vfmw
	cbz	x21, .L2755
	add	x21, x21, 65536
	mov	w1, w22
	ldr	w0, [x21, 1980]
	bl	FSP_GetLogicFs
	cbz	x0, .L2750
	ldrsb	w1, [x0, 1]
	cbz	w1, .L2750
	add	x19, x0, 592
	add	x20, x0, 624
.L2748:
	ldr	x1, [x19]
	cbnz	x1, .L2756
.L2747:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L2748
	ldr	w0, [x21, 1980]
	mov	w2, 0
	mov	w1, w22
	bl	FSP_SetDisplay
	mov	w0, 0
.L2746:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2756:
	ldr	w0, [x21, 1980]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L2747
	.p2align 3
.L2750:
	mov	w0, -1
	b	.L2746
.L2755:
	ldr	x2, .LC830
	mov	w3, 13211
	ldr	x1, .LC831
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2746
	.size	H264DEC_RecycleImage, .-H264DEC_RecycleImage
	.align	3
.LC829:
	.xword	.LC828
	.align	3
.LC830:
	.xword	.LC30
	.align	3
.LC831:
	.xword	.LC32
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	OutputFrmToVO
	.type	OutputFrmToVO, %function
OutputFrmToVO:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x22, x1
	mov	w23, w2
	bl	_mcount
	cmp	x19, xzr
	ccmp	x22, xzr, 4, ne
	beq	.L2799
	ldr	x0, [x19]
	ldr	w0, [x0, 24]
	cbz	w0, .L2760
	add	x0, x19, 65536
	ldr	w0, [x0, 1908]
	cmp	w0, 2
	beq	.L2760
	add	x19, x19, 61440
	ldr	x0, [x19, 3544]
	cbz	x0, .L2762
	strb	wzr, [x0, 1]
	mov	w0, 1
	str	xzr, [x19, 3544]
.L2759:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2760:
	mov	x1, x22
	mov	x0, x19
	bl	CheckFrameStore
	cmn	w0, #3
	beq	.L2762
	add	x20, x19, 61440
	ldr	x1, [x20, 3544]
	cbz	x1, .L2763
	mov	x0, x19
	bl	GetImagePara
	ldr	x1, [x20, 3544]
	mov	x0, x19
	bl	CheckFrameStore
	cbz	w0, .L2800
	cmn	w0, #3
	beq	.L2770
	ldr	x1, .LC839
	mov	w3, w0
	mov	w2, 2194
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x20, 3544]
	mov	x0, x19
	ldr	w1, [x1, 164]
	bl	H264DEC_RecycleImage
.L2770:
	ldr	x0, [x20, 3544]
	strb	wzr, [x0, 1]
	ldr	x0, [x20, 3544]
	str	xzr, [x20, 3544]
	cmp	x22, x0
	beq	.L2801
.L2763:
	mov	x1, x22
	mov	x0, x19
	bl	GetImagePara
	mov	x1, x22
	mov	x0, x19
	bl	CheckFrameStore
	cbz	w0, .L2802
	cmn	w0, #3
	beq	.L2762
	ldr	x1, .LC839
	mov	w3, w0
	mov	w2, 2251
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x22, 164]
	mov	x0, x19
	bl	H264DEC_RecycleImage
	mov	w0, 2
	b	.L2759
	.p2align 3
.L2799:
	ldr	x1, .LC833
	mov	x3, x22
	mov	x2, x19
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 2
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2762:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2802:
	add	x21, x19, 65536
	ldr	w1, [x22, 656]
	mov	w2, 1
	ldr	w0, [x21, 1980]
	bl	FSP_SetDisplay
	ldr	w0, [x21, 1980]
	ldr	w1, [x22, 656]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L2803
	cmp	w23, 1
	beq	.L2804
.L2774:
	ldr	w0, [x21, 1980]
	mov	x4, x20
	add	x3, x19, 8
	mov	x2, x19
	mov	w1, 0
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L2805
	ldr	x0, [x19]
	ldr	w0, [x0, 660]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L2806
	str	wzr, [x20, 16]
.L2777:
	ldr	w1, [x21, 2028]
	mov	w0, 0
	ldr	w2, [x21, 2036]
	add	w1, w1, 2
	str	w1, [x21, 2028]
	add	w2, w2, 1
	str	w2, [x21, 2036]
	b	.L2759
	.p2align 3
.L2800:
	ldr	x0, [x20, 3544]
	add	x21, x19, 65536
	mov	w2, 1
	ldr	w1, [x0, 656]
	ldr	w0, [x21, 1980]
	bl	FSP_SetDisplay
	ldr	x1, [x20, 3544]
	ldr	w0, [x21, 1980]
	ldr	w1, [x1, 656]
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	cbz	x0, .L2807
	ldr	x0, [x20, 3544]
	cmp	x0, x22
	ccmp	w23, 1, 0, eq
	beq	.L2808
.L2766:
	ldr	w0, [x21, 1980]
	mov	x4, x24
	add	x3, x19, 8
	mov	x2, x19
	mov	w1, 0
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L2809
	ldr	x0, [x19]
	ldr	w0, [x0, 660]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L2810
	str	wzr, [x24, 16]
.L2769:
	ldr	w0, [x21, 2028]
	ldr	w1, [x21, 2036]
	add	w0, w0, 2
	str	w0, [x21, 2028]
	add	w1, w1, 1
	str	w1, [x21, 2036]
	b	.L2770
	.p2align 3
.L2804:
	str	w23, [x0, 180]
	b	.L2774
	.p2align 3
.L2806:
	mov	x1, x20
	mov	x0, x19
	bl	SetFrmRepeatCount.part.7
	b	.L2777
	.p2align 3
.L2810:
	mov	x1, x24
	mov	x0, x19
	bl	SetFrmRepeatCount.part.7
	b	.L2769
	.p2align 3
.L2808:
	mov	w0, 1
	str	w0, [x24, 180]
	b	.L2766
	.p2align 3
.L2801:
	mov	w0, 0
	b	.L2759
.L2805:
	ldr	x1, .LC837
	mov	w2, w0
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x21, 1980]
	mov	w2, 0
	ldr	w1, [x22, 656]
	bl	FSP_SetDisplay
	mov	w1, 1
	mov	x0, x19
	bl	ClearAll
	mov	w0, -1
	b	.L2759
.L2809:
	ldr	x1, .LC837
	mov	w2, w0
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x0, [x20, 3544]
	mov	w2, 0
	strb	wzr, [x0, 1]
	ldr	x1, [x20, 3544]
	ldr	w0, [x21, 1980]
	ldr	w1, [x1, 656]
	bl	FSP_SetDisplay
	str	xzr, [x20, 3544]
	mov	w1, 1
	mov	x0, x19
	bl	ClearAll
	mov	w0, -1
	b	.L2759
.L2807:
	ldr	x1, .LC835
	mov	w2, 2165
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2759
.L2803:
	ldr	x1, .LC841
	mov	w2, 2221
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2759
	.size	OutputFrmToVO, .-OutputFrmToVO
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	OutputFrmFromDPB
	.type	OutputFrmFromDPB, %function
OutputFrmFromDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w21, w1
	bl	_mcount
	cbz	x19, .L2816
	add	x20, x19, x21, uxtw 3
	ldr	x0, [x20, 27896]
	cbz	x0, .L2817
	strb	wzr, [x0, 4]
	mov	w2, 0
	mov	x0, x19
	ldr	x1, [x20, 27896]
	bl	OutputFrmToVO
	ldr	x1, [x20, 27896]
	mov	w20, w0
	ldrb	w0, [x1, 2]
	cbnz	w0, .L2813
	mov	w1, w21
	mov	x0, x19
	bl	RemoveFrameStoreOutDPB
.L2813:
	mov	w0, w20
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L2817:
	ldr	x2, .LC842
	mov	w3, 2271
	ldr	x1, .LC843
	mov	w20, -1
	bl	dprint_vfmw
	b	.L2813
.L2816:
	ldr	x2, .LC842
	mov	w3, 2270
	ldr	x1, .LC843
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L2813
	.size	OutputFrmFromDPB, .-OutputFrmFromDPB
	.align	3
.LC842:
	.xword	.LC30
	.align	3
.LC843:
	.xword	.LC32
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FlushDPB
	.type	FlushDPB, %function
FlushDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L2819
	add	x19, x20, 24576
	mov	w21, 0
	ldr	w0, [x19, 3708]
	cbnz	w0, .L2837
	b	.L2821
	.p2align 3
.L2823:
	ldr	w0, [x19, 3708]
	cmp	w0, w21
	bls	.L2821
.L2837:
	add	x0, x20, x21, uxtw 3
	add	w21, w21, 1
	ldr	x1, [x0, 27896]
	ldrb	w0, [x1, 2]
	cbz	w0, .L2823
	mov	x0, x20
	bl	UnMarkFrameStoreRef
	ldr	w0, [x19, 3708]
	cmp	w0, w21
	bhi	.L2837
	.p2align 2
.L2821:
	mov	x0, x20
	bl	RemoveUnUsedFrameStore
	cbnz	w0, .L2821
	.p2align 2
.L2826:
	ldr	w6, [x19, 3708]
	cbz	w6, .L2842
	ldr	w0, [x19, 3704]
	cmp	w6, w0
	bls	.L2827
	str	w0, [x19, 3708]
	cbz	w0, .L2832
	mov	w6, w0
.L2827:
	add	x2, x19, 3320
	mov	w5, 2147483647
	mov	w0, 0
	mov	w1, 0
	.p2align 2
.L2830:
	ldr	x4, [x2]
	add	x2, x2, 8
	ldr	w3, [x4, 672]
	cmp	w3, w5
	bge	.L2829
	ldrb	w4, [x4, 4]
	cmp	w4, wzr
	csel	w5, w5, w3, eq
	csel	w1, w1, w0, eq
.L2829:
	add	w0, w0, 1
	cmp	w6, w0
	bhi	.L2830
	mov	x0, x20
	bl	OutputFrmFromDPB
	cmn	w0, #1
	bne	.L2826
.L2822:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L2832:
	mov	w1, 0
	mov	x0, x20
	bl	OutputFrmFromDPB
	cmn	w0, #1
	bne	.L2826
	b	.L2822
	.p2align 3
.L2842:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L2819:
	ldr	x2, .LC844
	mov	w3, 2393
	ldr	x1, .LC845
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2822
	.size	FlushDPB, .-FlushDPB
	.align	3
.LC844:
	.xword	.LC30
	.align	3
.LC845:
	.xword	.LC32
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AdaptiveMemMark
	.type	AdaptiveMemMark, %function
AdaptiveMemMark:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	add	x26, x21, 61440
	add	x25, x21, 20480
	bl	_mcount
	ldr	x24, .LC846
	add	x23, x26, 2024
	mov	w27, 1
	ldr	x22, [x26, 2688]
	add	x20, x22, 8
	add	x22, x22, 2008
	.p2align 2
.L2856:
	ldr	w0, [x20, -4]
	cmp	w0, 6
	bhi	.L2844
	ldrb	w0, [x24,w0,uxtw]
	adr	x1, .Lrtx2846
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx2846:
	.section	.rodata
	.align	0
	.align	2
.L2846:
	.byte	(.L2845 - .Lrtx2846) / 4
	.byte	(.L2847 - .Lrtx2846) / 4
	.byte	(.L2848 - .Lrtx2846) / 4
	.byte	(.L2849 - .Lrtx2846) / 4
	.byte	(.L2850 - .Lrtx2846) / 4
	.byte	(.L2851 - .Lrtx2846) / 4
	.byte	(.L2852 - .Lrtx2846) / 4
	.text
	.p2align 3
.L2851:
	add	x28, x21, 24576
	mov	w19, 0
	ldr	w0, [x28, 3712]
	cbz	w0, .L2855
	.p2align 2
.L2863:
	add	x1, x21, x19, uxtw 3
	mov	x0, x21
	add	w19, w19, 1
	ldr	x1, [x1, 28024]
	bl	UnMarkFrameStoreRef
	ldr	w0, [x28, 3712]
	cmp	w19, w0
	bcc	.L2863
.L2855:
	mov	x0, x21
	bl	UpdateReflist
	mov	w1, 0
	mov	x0, x21
	bl	UpdateMaxLTFrmIdx
	mov	x0, x21
	bl	UpdateLTReflist
	str	w27, [x25, 728]
	.p2align 2
.L2844:
	add	x20, x20, 20
	cmp	x20, x22
	bne	.L2856
	.p2align 2
.L2845:
	ldr	w1, [x25, 728]
	mov	w0, 0
	cmp	w1, 1
	beq	.L2866
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2850:
	ldr	w1, [x20, 12]
	mov	x0, x21
	bl	UpdateMaxLTFrmIdx
	mov	x0, x21
	bl	UpdateLTReflist
	b	.L2844
	.p2align 3
.L2849:
	ldr	w2, [x20]
	mov	x1, x23
	ldr	w3, [x20, 8]
	mov	x0, x21
	bl	MarkSTToLTRef
	mov	x0, x21
	bl	UpdateReflist
	mov	x0, x21
	bl	UpdateLTReflist
	b	.L2844
	.p2align 3
.L2848:
	ldr	w2, [x20, 4]
	mov	x0, x21
	mov	x1, x23
	bl	UnMarkLTRef
	mov	x0, x21
	bl	UpdateLTReflist
	b	.L2844
	.p2align 3
.L2847:
	ldr	w2, [x20]
	mov	x0, x21
	mov	x1, x23
	bl	UnMarkSTRef
	mov	x0, x21
	bl	UpdateReflist
	b	.L2844
	.p2align 3
.L2852:
	ldr	w2, [x20, 8]
	mov	x1, x23
	mov	x0, x21
	bl	MarkCurrPicLT
	b	.L2844
	.p2align 3
.L2866:
	ldrb	w0, [x26, 2027]
	str	wzr, [x26, 2696]
	cmp	w0, 1
	beq	.L2859
	cbz	w0, .L2860
	cmp	w0, 2
	bne	.L2858
	str	wzr, [x26, 2708]
	str	wzr, [x26, 2720]
	str	wzr, [x25, 740]
	str	wzr, [x25, 748]
.L2858:
	mov	x0, x21
	bl	FlushDPB
	cmp	w0, wzr
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L2860:
	ldr	w2, [x26, 2708]
	ldr	w0, [x26, 2716]
	ldr	w1, [x26, 2720]
	sub	w0, w0, w2
	str	w0, [x26, 2716]
	sub	w1, w1, w2
	str	w1, [x26, 2720]
	cmp	w0, w1
	csel	w0, w0, w1, le
	str	w0, [x26, 2708]
	str	w0, [x26, 2712]
	ldr	w2, [x25, 748]
	ldr	w0, [x25, 736]
	ldr	w1, [x25, 740]
	sub	w0, w0, w2
	str	w0, [x25, 736]
	sub	w1, w1, w2
	str	w1, [x25, 740]
	cmp	w0, w1
	csel	w0, w0, w1, le
	str	w0, [x25, 744]
	str	w0, [x25, 748]
	b	.L2858
.L2859:
	str	wzr, [x26, 2708]
	str	wzr, [x26, 2716]
	str	wzr, [x25, 736]
	str	wzr, [x25, 748]
	b	.L2858
	.size	AdaptiveMemMark, .-AdaptiveMemMark
	.align	3
.LC846:
	.xword	.L2846
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IDRMemMarking
	.type	IDRMemMarking, %function
IDRMemMarking:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	add	x24, x22, 61440
	bl	_mcount
	ldr	x0, [x24, 2688]
	ldrb	w0, [x0, 1]
	cbz	w0, .L2868
	add	x23, x22, 24576
	mov	w21, 0
	add	x20, x22, 65536
	mov	w25, 1
	ldr	w0, [x23, 3708]
	cbnz	w0, .L2883
	b	.L2875
	.p2align 3
.L2872:
	strb	wzr, [x0, 706]
	strb	wzr, [x0, 705]
	ldr	x0, [x19, 27896]
	strb	wzr, [x0, 754]
	strb	wzr, [x0, 753]
	ldr	x0, [x19, 27896]
	strb	wzr, [x0, 802]
	strb	wzr, [x0, 801]
	ldr	x0, [x19, 27896]
	strb	wzr, [x0, 2]
	ldr	x1, [x19, 27896]
	ldr	w0, [x20, 1980]
	ldr	w1, [x1, 656]
	bl	FSP_SetRef
	ldr	x0, [x19, 27896]
	strb	wzr, [x0, 1]
	ldr	x0, [x19, 27896]
	strb	wzr, [x0, 4]
	ldr	x0, [x19, 27896]
	str	w25, [x0, 676]
	ldr	x1, [x19, 27896]
	ldr	w0, [x1, 696]
	add	x0, x0, 4096
	add	x0, x0, 2980
	str	wzr, [x22, x0, lsl 2]
	ldr	w1, [x1, 656]
	ldr	w0, [x20, 1980]
	bl	FSP_GetDisplay
	cmp	w0, 3
	mov	w2, 0
	beq	.L2873
	ldr	x1, [x19, 27896]
	ldr	w0, [x20, 1980]
	ldr	w1, [x1, 656]
	bl	FSP_SetDisplay
.L2873:
	str	xzr, [x19, 27896]
	str	xzr, [x19, 28024]
	str	xzr, [x19, 28152]
	ldr	w0, [x23, 3708]
	cmp	w0, w21
	bls	.L2875
.L2883:
	add	x19, x22, x21, uxtw 3
	mov	w2, 0
	add	w21, w21, 1
	ldr	x0, [x19, 27896]
	ldr	w1, [x0, 848]
	cmp	w1, 1
	bne	.L2872
	str	w1, [x20, 652]
	b	.L2872
	.p2align 3
.L2875:
	str	wzr, [x23, 3708]
	ldr	w0, [x20, 640]
	cbz	w0, .L2871
	sub	w1, w0, #1
	add	x0, x20, 568
	add	x1, x1, 16384
	add	x1, x1, 143
	add	x1, x22, x1, lsl 2
	.p2align 2
.L2878:
	str	wzr, [x0], 4
	cmp	x0, x1
	bne	.L2878
.L2871:
	mov	x0, x22
	bl	UpdateReflist
	mov	x0, x22
	bl	UpdateLTReflist
	ldr	x0, [x24, 2688]
	ldrb	w0, [x0, 2]
	cbnz	w0, .L2889
	mov	w0, 1
	str	wzr, [x23, 3720]
	strb	w0, [x24, 2029]
	mov	w0, 0
	strb	wzr, [x24, 2028]
.L2879:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L2889:
	mov	w0, 1
	str	w0, [x23, 3720]
	strb	w0, [x24, 2028]
	mov	w0, 0
	strb	wzr, [x24, 2029]
	str	wzr, [x24, 2700]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L2868:
	mov	x0, x22
	bl	FlushDPB
	cbnz	w0, .L2880
	add	x23, x22, 24576
	b	.L2871
.L2880:
	mov	w0, -1
	b	.L2879
	.size	IDRMemMarking, .-IDRMemMarking
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Marking
	.type	Marking, %function
Marking:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 61440
	bl	_mcount
	add	x0, x20, 20480
	str	wzr, [x0, 728]
	ldrb	w1, [x19, 2027]
	cmp	w1, 2
	cset	w1, eq
	str	w1, [x0, 732]
	ldrb	w0, [x19, 2030]
	cmp	w0, 5
	beq	.L2891
	ldr	w0, [x19, 2724]
	cbnz	w0, .L2892
	ldr	x0, [x20]
	mov	x1, 4294967296
	ldr	x2, [x0, 696]
	cmp	x2, x1
	beq	.L2916
.L2892:
	ldr	x0, [x19, 2688]
	ldrb	w0, [x0, 3]
	cbz	w0, .L2917
	ldr	w0, [x19, 2704]
	cbnz	w0, .L2918
.L2899:
	mov	w0, 0
.L2896:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2917:
	ldr	w0, [x19, 2704]
	cbz	w0, .L2899
.L2898:
	ldrb	w1, [x19, 2025]
	cbnz	w1, .L2903
	add	x1, x20, 24576
	add	x2, x20, 16384
	ldr	w4, [x1, 3716]
	ldr	w2, [x2, 1836]
	ldr	w3, [x1, 3712]
	sub	w1, w2, w4
	cmp	w3, w1
	beq	.L2919
	strb	wzr, [x19, 2028]
.L2901:
	cbz	w0, .L2899
.L2903:
	ldrb	w1, [x19, 2028]
	mov	w0, 0
	cmp	w1, wzr
	cset	w1, eq
	strb	w1, [x19, 2029]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2916:
	ldr	w1, [x0, 704]
	cbnz	w1, .L2892
	ldr	w0, [x0, 660]
	add	w0, w0, 1024
	cmp	w0, 2048
	bls	.L2892
	.p2align 2
.L2891:
	mov	x0, x20
	bl	IDRMemMarking
	cbz	w0, .L2900
.L2893:
	mov	w0, -1
	b	.L2896
	.p2align 3
.L2918:
	mov	x0, x20
	bl	AdaptiveMemMark
	cbnz	w0, .L2893
.L2900:
	ldrb	w0, [x19, 2030]
	cmp	w0, 5
	bne	.L2920
	ldr	w0, [x19, 2704]
	b	.L2901
	.p2align 3
.L2919:
	mov	x0, x20
	bl	SlidingWinMark.part.8
	strb	wzr, [x19, 2028]
	ldr	w0, [x19, 2704]
	b	.L2901
.L2920:
	ldr	w0, [x19, 2704]
	cbz	w0, .L2899
	ldr	x1, [x19, 2688]
	ldrb	w1, [x1, 3]
	cbnz	w1, .L2903
	b	.L2898
	.size	Marking, .-Marking
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InitDPB
	.type	InitDPB, %function
InitDPB:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	cbz	x21, .L2959
	mov	x0, x21
	add	x23, x21, 24576
	add	x19, x23, 3320
	add	x22, x23, 3448
	add	x20, x21, 65536
	bl	ClearAllSlice
	.p2align 2
.L2927:
	ldr	x0, [x19]
	mov	w2, 1
	cbz	x0, .L2924
	ldr	w1, [x0, 656]
	ldr	w0, [x20, 1980]
	bl	FSP_ClearLogicFs
.L2924:
	ldr	x0, [x19, 128]
	mov	w2, 1
	cbz	x0, .L2925
	ldr	w1, [x0, 656]
	ldr	w0, [x20, 1980]
	bl	FSP_ClearLogicFs
.L2925:
	ldr	x0, [x19, 256]
	mov	w2, 1
	cbz	x0, .L2926
	ldr	w1, [x0, 656]
	ldr	w0, [x20, 1980]
	bl	FSP_ClearLogicFs
.L2926:
	str	xzr, [x19, 128]
	str	xzr, [x19, 256]
	str	xzr, [x19], 8
	cmp	x19, x22
	bne	.L2927
	add	x0, x21, 16384
	add	x1, x23, 3584
	add	x19, x21, 61440
	ldr	w0, [x0, 1864]
	stp	wzr, wzr, [x1, 128]
	sub	w0, w0, #1
	stp	w0, wzr, [x1, 120]
	str	wzr, [x23, 3720]
	ldr	x1, [x19, 3544]
	cbz	x1, .L2929
	ldr	w0, [x20, 1908]
	cmp	w0, 2
	beq	.L2960
.L2930:
	ldr	w0, [x20, 1980]
	mov	w2, 1
	ldr	w1, [x1, 656]
	bl	FSP_ClearLogicFs
	ldr	x0, [x19, 2680]
	cbz	x0, .L2933
	ldr	x2, [x19, 3544]
	ldr	w1, [x0, 656]
	ldr	w0, [x2, 656]
	cmp	w0, w1
	beq	.L2933
	ldr	w0, [x20, 1980]
	mov	w2, 1
	bl	FSP_ClearLogicFs
.L2933:
	str	xzr, [x19, 3544]
.L2929:
	ldr	x3, .LC852
	mov	x2, 392
	mov	w1, 0
	add	x0, x23, 3728
	ldr	x3, [x3, 96]
	blr	x3
	str	wzr, [x23, 3988]
	ldr	w0, [x23, 3704]
	str	w0, [x23, 3984]
	add	x0, x20, 568
	add	x20, x20, 636
	.p2align 2
.L2934:
	str	wzr, [x0], 4
	cmp	x0, x20
	bne	.L2934
	add	x2, x21, 28672
	add	x1, x2, 24
	add	x0, x2, 288
	.p2align 2
.L2935:
	str	xzr, [x1], 8
	cmp	x0, x1
	bne	.L2935
	add	x21, x21, 20480
	add	x1, x2, 552
	str	wzr, [x21, 1624]
	.p2align 2
.L2936:
	str	xzr, [x0], 8
	cmp	x1, x0
	bne	.L2936
	mov	w0, 0
	str	wzr, [x21, 1628]
.L2923:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L2960:
	mov	w2, 0
	mov	x0, x21
	bl	OutputFrmToVO
	cbnz	w0, .L2961
.L2931:
	ldr	x1, [x19, 3544]
	cbz	x1, .L2929
	b	.L2930
	.p2align 3
.L2961:
	ldr	x2, .LC849
	mov	w4, w0
	ldr	x1, .LC851
	mov	w3, 2336
	add	x2, x2, 264
	mov	w0, 22
	bl	dprint_vfmw
	b	.L2931
.L2959:
	ldr	x2, .LC847
	mov	w3, 2298
	ldr	x1, .LC848
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2923
	.size	InitDPB, .-InitDPB
	.align	3
.LC847:
	.xword	.LC30
	.align	3
.LC848:
	.xword	.LC32
	.align	3
.LC849:
	.xword	.LANCHOR2
	.align	3
.LC851:
	.xword	.LC850
	.align	3
.LC852:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ClearAll
	.type	ClearAll, %function
ClearAll:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	mov	w21, w1
	str	x19, [x29, 104]
	bl	_mcount
	ldr	x1, .LC854
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x19
	cbz	x19, .L2993
	ldr	x20, [x29, 104]
	mov	x0, x20
	add	x19, x20, 640
	add	x22, x20, 65536
	add	x20, x20, 12288
	bl	H264_ClearCurrPic
	add	x20, x20, 2600
	b	.L2966
	.p2align 3
.L2965:
	add	x19, x19, 104
	cmp	x19, x20
	beq	.L2994
.L2966:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L2965
	ldr	w0, [x22, 1980]
	mov	x1, x19
	add	x19, x19, 104
	bl	ReleaseNAL
	cmp	x19, x20
	bne	.L2966
.L2994:
	ldr	x19, [x29, 104]
	mov	x0, x19
	bl	InitDPB
	cbz	w21, .L2967
	ldr	w0, [x22, 1980]
	add	x1, x19, 8
	bl	FSP_ClearNotInVoQueue
.L2968:
	ldr	x0, [x29, 104]
	mov	w21, 0
	mov	w28, -1
	mov	w23, 1
	add	x19, x0, 28672
	mov	w27, 17
	mov	w25, 16
	mov	w24, 2
	add	x19, x19, 552
	.p2align 2
.L2971:
	add	x0, x19, 512
	strb	wzr, [x19]
	strb	wzr, [x19, 1]
	add	x26, x19, 560
	strb	wzr, [x19, 2]
	add	x20, x19, 592
	strb	wzr, [x19, 4]
	strb	wzr, [x19, 704]
	strb	w23, [x19, 752]
	strb	w24, [x19, 800]
	str	w21, [x19, 164]
	stp	wzr, w28, [x0, 148]
	stp	wzr, wzr, [x0, 156]
	str	w23, [x19, 676]
	str	w27, [x19, 692]
	str	w25, [x19, 696]
	str	x19, [x19, 744]
	str	x19, [x19, 792]
	str	x19, [x19, 840]
.L2970:
	ldr	x0, [x26]
	mov	x1, x0
	cbz	x0, .L2969
	ldr	w0, [x22, 1980]
	bl	FreeUsdByDec
	str	xzr, [x26]
.L2969:
	add	x26, x26, 8
	cmp	x26, x20
	bne	.L2970
	add	w21, w21, 1
	add	x19, x19, 856
	cmp	w21, 40
	bne	.L2971
	ldr	x0, [x29, 104]
	add	x21, x0, 61440
	add	x19, x21, 2584
	add	x20, x21, 2616
.L2973:
	ldr	x0, [x19]
	mov	x1, x0
	cbz	x0, .L2972
	ldr	w0, [x22, 1980]
	bl	FreeUsdByDec
	str	xzr, [x19]
.L2972:
	add	x19, x19, 8
	cmp	x20, x19
	bne	.L2973
	ldr	w0, [x22, 664]
	mov	w20, 0
	cbz	w0, .L2977
	.p2align 2
.L2984:
	ldr	x0, [x29, 104]
	add	x19, x0, x20, uxtw 3
	add	w20, w20, 1
	add	x19, x19, 65536
	ldr	x0, [x19, 672]
	mov	x1, x0
	cbz	x0, .L2975
	ldr	w0, [x22, 1980]
	bl	FreeUsdByDec
	str	xzr, [x19, 672]
.L2975:
	ldr	w0, [x22, 664]
	cmp	w0, w20
	bhi	.L2984
.L2977:
	ldr	x1, [x29, 104]
	mov	x2, 1640
	str	wzr, [x22, 644]
	add	x0, x1, 24576
	str	wzr, [x22, 652]
	str	wzr, [x22, 656]
	add	x19, x1, 20480
	str	wzr, [x22, 664]
	str	wzr, [x22, 1904]
	str	wzr, [x22, 1912]
	str	wzr, [x22, 1956]
	str	wzr, [x22, 1964]
	str	wzr, [x22, 2012]
	str	xzr, [x1, 632]
	mov	w1, 0
	ldr	x3, .LC857
	strb	wzr, [x0, 1176]
	str	wzr, [x0, 3180]
	strb	wzr, [x19, 3268]
	strb	wzr, [x0, 1177]
	add	x0, x19, 1584
	ldr	x3, [x3, 96]
	strb	wzr, [x19, 3269]
	blr	x3
	mov	w0, 1
	mov	w1, 2
	strb	w0, [x19, 1589]
	mov	w0, 256
	strb	w1, [x19, 1584]
	str	w0, [x21, 3520]
	mov	w0, 0
	strb	wzr, [x21, 2024]
	strb	wzr, [x21, 3512]
	str	wzr, [x21, 3516]
.L2964:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L2967:
	ldr	x0, [x29, 104]
	add	x0, x0, 8
	bl	ResetVoQueue
	ldr	w0, [x22, 1980]
	bl	FSP_EmptyInstance
	b	.L2968
.L2993:
	ldr	x2, .LC855
	mov	w3, 2012
	ldr	x1, .LC856
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2964
	.size	ClearAll, .-ClearAll
	.align	3
.LC854:
	.xword	.LC853
	.align	3
.LC855:
	.xword	.LC30
	.align	3
.LC856:
	.xword	.LC32
	.align	3
.LC857:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AllocFrameStore
	.type	AllocFrameStore, %function
AllocFrameStore:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x28, x0
	mov	x0, x30
	add	x20, x28, 20480
	mov	w23, w1
	bl	_mcount
	ldrb	w0, [x20, 1585]
	cbz	w0, .L2996
	ldrb	w1, [x20, 1586]
	cbz	w1, .L3065
	ldr	w2, [x20, 1592]
	mov	w1, 2208
	add	x21, x28, 65536
	ldr	x3, [x28, 14968]
	ldr	x4, [x28, 14960]
	umull	x1, w2, w1
	ldr	w22, [x21, 1908]
	add	x1, x3, x1
	str	x4, [x29, 104]
	cmp	w22, 2
	ldr	w25, [x1, 28]
	beq	.L3066
	add	x27, x28, 61440
	mov	w22, 2
	ldrb	w1, [x27, 3512]
	strb	wzr, [x27, 2025]
	cmp	w1, 1
	bne	.L2999
	b	.L3024
	.p2align 3
.L2996:
	ldr	w1, [x20, 1592]
	mov	w0, 2208
	add	x21, x28, 65536
	ldr	x2, [x28, 14968]
	ldr	x3, [x28, 14960]
	umull	x0, w1, w0
	ldr	w1, [x21, 1908]
	add	x0, x2, x0
	str	x3, [x29, 104]
	cmp	w1, 2
	ldr	w25, [x0, 28]
	beq	.L3067
	add	x27, x28, 61440
	mov	w22, 0
.L3060:
	strb	wzr, [x27, 2025]
.L2999:
	strb	wzr, [x27, 2024]
	ldr	w3, [x21, 636]
	cbz	w3, .L3014
	add	x19, x28, 28672
	mov	x26, 0
	add	x19, x19, 552
	.p2align 2
.L3013:
	ldrb	w0, [x19, 1]
	cbnz	w0, .L3008
	cbz	x19, .L3009
	add	x0, x28, 24576
	ldr	w2, [x0, 3708]
	cbz	w2, .L3009
	ldr	x0, [x28, 27896]
	cmp	x0, x19
	beq	.L3008
	sub	w2, w2, #1
	mov	x0, x28
	add	x2, x28, x2, lsl 3
	b	.L3011
	.p2align 3
.L3012:
	ldr	x1, [x0, 27896]
	cmp	x1, x19
	beq	.L3008
.L3011:
	cmp	x0, x2
	add	x0, x0, 8
	bne	.L3012
.L3009:
	lsl	x1, x26, 3
	str	x19, [x27, 2680]
	sub	x1, x1, x26
	mov	w24, 1
	lsl	x1, x1, 2
	strb	w24, [x27, 2024]
	sub	x1, x1, x26
	mov	w4, 101
	lsl	x1, x1, 2
	mov	x2, 640
	sub	x26, x1, x26
	add	x0, x27, 2040
	add	x26, x28, x26, lsl 3
	add	x26, x26, 28672
	add	x1, x26, 568
	str	wzr, [x26, 1240]
	str	w4, [x27, 2732]
	bl	memcpy
	str	wzr, [x27, 2192]
	strb	wzr, [x26, 555]
	str	wzr, [x19, 676]
	ldr	x0, [x27, 2680]
	strb	wzr, [x0, 2]
	ldr	x0, [x27, 2680]
	strb	w24, [x0, 4]
	ldr	x0, [x27, 2680]
	str	wzr, [x0, 848]
	ldrb	w19, [x27, 2024]
	cmp	w19, 1
	bne	.L3014
	cmp	w23, wzr
	ldr	w0, [x21, 1980]
	cset	w1, eq
	bl	FSP_NewLogicFs
	mov	w26, w0
	mov	w1, w0
	ldr	w0, [x21, 1980]
	bl	FSP_GetLogicFs
	mov	x23, x0
	cmp	w26, wzr
	ccmp	x0, xzr, 4, ge
	beq	.L3015
	mov	w0, 4000
	add	x1, x23, 48
	umull	x25, w25, w0
	ldr	x0, [x29, 104]
	add	x24, x0, x25
	ldrb	w0, [x24, 3296]
	strb	w0, [x23, 488]
	ldr	w0, [x24, 3324]
	strb	w0, [x23, 489]
	ldr	w0, [x24, 3332]
	strb	w0, [x23, 490]
	ldr	w0, [x24, 3328]
	str	w0, [x23, 492]
	ldr	x0, [x28]
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L3068
.L3016:
	ldr	x19, .LC860
	mov	x2, 640
	ldr	x0, [x27, 2680]
	ldr	x3, [x19, 104]
	add	x0, x0, 16
	blr	x3
	ldr	x1, [x27, 2680]
	mov	x2, 640
	ldr	x3, [x19, 104]
	add	x0, x27, 2040
	add	x1, x1, 16
	blr	x3
	ldr	x0, [x27, 2680]
	mov	w4, w26
	str	w26, [x0, 656]
	ldrsb	w0, [x23, 4]
	str	w0, [x27, 2756]
	ldr	x3, [x27, 2680]
	ldrb	w0, [x20, 1585]
.L3006:
	cmp	w0, wzr
	uxtb	w1, w22
	mov	w2, 3
	strb	w1, [x27, 2027]
	csel	w0, w0, w2, eq
	strb	w0, [x3, 704]
	ldrb	w0, [x27, 2025]
	cmp	w0, 1
	beq	.L3069
	strb	w1, [x27, 3512]
	ldr	w0, [x20, 1600]
	str	w0, [x27, 3520]
	ldr	w0, [x20, 1612]
	str	w0, [x27, 3516]
	ldr	w0, [x21, 2020]
	str	w0, [x27, 3528]
	str	w4, [x27, 3532]
	cbnz	w22, .L3070
	strb	wzr, [x27, 3513]
	mov	w0, 0
.L3055:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3065:
	ldr	w2, [x20, 1592]
	mov	w1, 2208
	add	x21, x28, 65536
	ldr	x3, [x28, 14968]
	ldr	x4, [x28, 14960]
	umull	x1, w2, w1
	ldr	w2, [x21, 1908]
	add	x1, x3, x1
	str	x4, [x29, 104]
	cmp	w2, 2
	ldr	w25, [x1, 28]
	beq	.L3071
	add	x27, x28, 61440
	mov	w22, 1
	ldrb	w1, [x27, 3512]
	strb	wzr, [x27, 2025]
	cmp	w1, 2
	bne	.L2999
.L3024:
	ldr	w1, [x20, 1600]
	ldr	w2, [x27, 3520]
	cmp	w2, w1
	bne	.L2999
	ldr	w1, [x20, 1612]
	cbnz	w1, .L3000
	ldr	w1, [x27, 3516]
	cbnz	w1, .L2999
.L3001:
	ldr	w2, [x21, 2016]
	ldr	w1, [x21, 2020]
	sub	w1, w1, w2
	cmp	w1, 2
	bhi	.L2999
	ldr	x3, [x27, 2680]
	mov	w1, 1
	strb	w1, [x27, 2025]
	cbz	x3, .L3060
	cmp	w22, 2
	beq	.L3072
	cmp	w22, 1
	mov	w4, 0
	bne	.L3006
	ldrb	w1, [x3, 1]
	cmp	w1, 2
	bne	.L3060
	b	.L3006
	.p2align 3
.L3008:
	add	w26, w26, 1
	add	x19, x19, 856
	cmp	w26, w3
	bne	.L3013
.L3014:
	ldr	x1, .LC859
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, 1
	mov	x0, x28
	bl	ClearAll
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3070:
	mov	w1, 1
	strb	w1, [x27, 3513]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3067:
	mov	w22, 0
	add	x27, x28, 61440
	b	.L3060
.L3071:
	mov	w22, 1
	add	x27, x28, 61440
	b	.L3060
.L3069:
	strb	wzr, [x27, 3512]
	mov	w0, 0
	ldr	w1, [x20, 1600]
	str	w1, [x27, 3520]
	ldr	w1, [x20, 1612]
	str	w1, [x27, 3516]
	ldr	w1, [x21, 2020]
	str	w1, [x27, 3528]
	strb	wzr, [x27, 3513]
	str	w4, [x27, 3532]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3068:
	ldr	w2, [x28, 14936]
	ldr	w0, [x1, 112]
	lsl	w2, w2, 4
	ldr	w3, [x28, 14932]
	stp	wzr, wzr, [x1, 240]
	mul	w19, w2, w0
	ldr	w0, [x1, 36]
	lsl	w3, w3, 4
	stp	wzr, wzr, [x1, 248]
	stp	w3, w2, [x1, 68]
	add	w0, w19, w0
	str	wzr, [x1, 256]
	str	w0, [x1, 40]
	str	x1, [x29, 104]
	bl	MEM_Phy2Vir
	ldr	x1, [x29, 104]
	ldr	w2, [x1, 20]
	ldr	w3, [x1, 116]
	str	x0, [x1, 512]
	add	w0, w19, w2
	str	w0, [x1, 24]
	add	w0, w3, w0
	str	w0, [x1, 32]
	b	.L3016
.L3066:
	add	x27, x28, 61440
	b	.L3060
.L3000:
	ldr	w1, [x27, 3516]
	cbz	w1, .L2999
	b	.L3001
.L3015:
	ldr	x2, [x27, 2680]
	mov	w0, 0
	strb	wzr, [x27, 2024]
	ldr	x1, .LC862
	strb	wzr, [x2, 4]
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x28
	bl	ClearAll
	mov	w0, -1
	b	.L3055
.L3072:
	ldrb	w1, [x3, 1]
	mov	w4, 0
	cmp	w1, 1
	bne	.L3060
	b	.L3006
	.size	AllocFrameStore, .-AllocFrameStore
	.align	3
.LC859:
	.xword	.LC858
	.align	3
.LC860:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC862:
	.xword	.LC861
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_Init
	.type	H264DEC_Init, %function
H264DEC_Init:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cbz	x20, .L3085
	cbz	x21, .L3086
	ldr	x22, .LC865
	mov	x2, 2072
	movk	x2, 0x1, lsl 16
	mov	w1, 0
	mov	x0, x20
	ldr	w19, [x20, 608]
	ldr	x3, [x22, 96]
	blr	x3
	str	w19, [x20, 608]
	add	x0, x20, 8
	bl	ResetVoQueue
	str	x21, [x20]
	str	xzr, [x20, 616]
	str	wzr, [x20, 624]
	ldr	w0, [x21, 28]
	cmp	w0, 25
	beq	.L3087
	mov	w2, 32
	mov	w1, 256
	mov	w0, 136
	str	w2, [x20, 14944]
	str	w0, [x20, 14940]
	str	w1, [x20, 14948]
.L3078:
	ldr	w0, [x21, 632]
	mov	w23, 2208
	add	x19, x20, 65536
	bl	MEM_Phy2Vir
	ldr	x1, [x20]
	mov	w2, 4000
	ldr	w4, [x20, 14944]
	ldr	w5, [x20, 14948]
	ldrsw	x3, [x1, 628]
	smull	x2, w4, w2
	add	x3, x0, x3
	str	x3, [x20, 14960]
	add	x1, x3, x2
	str	x1, [x20, 14968]
	cmp	x1, xzr
	smaddl	x0, w5, w23, x1
	ccmp	x3, xzr, 4, ne
	str	x0, [x19, 1896]
	ccmp	x0, xzr, 4, ne
	beq	.L3088
	ldr	w6, [x21, 664]
	cmp	w6, wzr
	ccmp	x3, xzr, 4, eq
	ccmp	x1, xzr, 4, ne
	beq	.L3080
	ldr	x4, [x22, 96]
	mov	w1, 0
	mov	x0, x3
	blr	x4
	ldr	w2, [x20, 14948]
	mov	w1, 0
	ldr	x0, [x20, 14968]
	ldr	x3, [x22, 96]
	smull	x2, w2, w23
	blr	x3
	ldr	w4, [x20, 14944]
	ldr	w5, [x20, 14948]
	ldr	x0, [x19, 1896]
.L3080:
	add	x2, x20, 16384
	ldr	x6, [x22, 96]
	mov	w1, 0
	str	w5, [x2, 2616]
	str	w4, [x20, 15012]
	ldrsw	x3, [x20, 14940]
	lsl	x2, x3, 7
	sub	x2, x2, x3
	lsl	x2, x2, 5
	blr	x6
	str	wzr, [x19, 644]
	mov	w0, 17
	mov	w1, 40
	str	w0, [x19, 640]
	add	x0, x19, 512
	str	w1, [x19, 636]
	add	x1, x19, 512
	add	x2, x19, 1792
	add	x3, x19, 1792
	stp	wzr, wzr, [x0, 140]
	stp	wzr, wzr, [x0, 148]
	stp	xzr, xzr, [x1, 160]
	stp	xzr, xzr, [x1, 176]
	str	wzr, [x19, 1916]
	mov	x0, x20
	stp	wzr, wzr, [x2, 132]
	stp	wzr, wzr, [x2, 140]
	stp	wzr, wzr, [x3, 148]
	stp	wzr, wzr, [x3, 156]
	str	wzr, [x19, 2012]
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x19, 1980]
	beq	.L3089
	mov	w1, 0
	mov	x0, x20
	bl	ClearAll
	str	wzr, [x19, 2008]
	mov	w0, 1
	ldr	x1, [x20]
	ldr	w1, [x1, 680]
	str	w1, [x19, 1984]
.L3075:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3087:
	ldr	w0, [x21, 748]
	str	w0, [x20, 14944]
	ldr	w0, [x21, 752]
	str	w0, [x20, 14948]
	ldr	w0, [x21, 740]
	str	w0, [x20, 14940]
	b	.L3078
.L3088:
	ldr	x2, .LC866
	mov	w3, 12404
	ldr	x1, .LC868
	mov	w0, 0
	add	x2, x2, 272
	bl	dprint_vfmw
	mov	w0, -20
	b	.L3075
	.p2align 3
.L3089:
	ldr	x1, .LC870
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L3075
.L3086:
	ldr	x2, .LC863
	mov	w3, 12370
	ldr	x1, .LC864
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3075
.L3085:
	ldr	x2, .LC863
	mov	w3, 12369
	ldr	x1, .LC864
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3075
	.size	H264DEC_Init, .-H264DEC_Init
	.align	3
.LC863:
	.xword	.LC30
	.align	3
.LC864:
	.xword	.LC32
	.align	3
.LC865:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC866:
	.xword	.LANCHOR2
	.align	3
.LC868:
	.xword	.LC867
	.align	3
.LC870:
	.xword	.LC869
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ClearDPB
	.type	ClearDPB, %function
ClearDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	FlushDPB
	cbz	w0, .L3091
	ldr	x1, .LC872
	mov	w3, w0
	mov	w2, 2428
	mov	w0, 0
	bl	dprint_vfmw
.L3091:
	mov	x0, x19
	add	x19, x19, 65536
	bl	InitDPB
	str	wzr, [x19, 652]
	mov	w0, 0
	str	wzr, [x19, 2012]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ClearDPB, .-ClearDPB
	.align	3
.LC872:
	.xword	.LC871
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InsertFrmInDPB
	.type	InsertFrmInDPB, %function
InsertFrmInDPB:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x23, x0
	mov	x0, x30
	mov	w20, w1
	mov	x19, x2
	bl	_mcount
	cmp	w20, 15
	bhi	.L3190
	ldrb	w21, [x19, 3]
	cmp	w21, 1
	beq	.L3099
	cbz	w21, .L3100
	cmp	w21, 2
	bne	.L3191
	ldr	x0, [x19, 656]
	mov	w1, 3
	uxtw	x22, w20
	strb	w1, [x0, 704]
	ldrb	w0, [x19, 1]
	cbz	w0, .L3118
	add	x20, x23, x22, lsl 3
	ldr	x0, [x20, 27896]
	cbz	x0, .L3118
	strb	w21, [x0, 800]
	ldr	x0, [x20, 27896]
	ldr	x1, [x19, 656]
	str	x1, [x0, 840]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x19, 4]
	strb	w1, [x0, 801]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x19, 5]
	strb	w1, [x0, 802]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 696]
	str	w1, [x0, 812]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 700]
	str	w1, [x0, 820]
	ldr	x1, [x19, 656]
	ldr	x0, [x20, 27896]
	ldr	w1, [x1, 832]
	str	w1, [x0, 832]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 708]
	str	w1, [x0, 816]
	ldr	x0, [x20, 27896]
	ldr	w2, [x0, 768]
	ldr	w1, [x0, 816]
	add	w1, w2, w1
	str	w1, [x0, 688]
	str	w1, [x0, 720]
	ldr	x1, [x20, 27896]
	ldrb	w0, [x1]
	cbz	w0, .L3124
	ldrb	w0, [x19, 2]
.L3124:
	strb	w0, [x1]
	ldr	x1, [x20, 27896]
	ldrb	w0, [x1, 1]
	orr	w0, w0, 2
	strb	w0, [x1, 1]
	ldrb	w0, [x19, 7]
	ldr	x1, [x20, 27896]
	cmp	w0, 1
	beq	.L3192
	ldrb	w0, [x1, 3]
.L3126:
	strb	w0, [x1, 3]
	mov	x2, 640
	add	x1, x19, 16
	ldr	x3, [x20, 27896]
	add	x0, x3, 16
	ldr	x4, [x3, 600]
	str	x4, [x29, 104]
	ldp	w26, w25, [x3, 16]
	ldp	w24, w21, [x3, 24]
	ldr	x28, [x3, 608]
	ldr	x27, [x3, 616]
	bl	memcpy
	ldr	x4, [x29, 104]
	cmn	x4, #1
	beq	.L3127
	ldr	x0, [x20, 27896]
	str	x4, [x0, 600]
.L3127:
	ldr	x0, [x19, 608]
	ldr	x1, [x20, 27896]
	cmp	x0, x28
	csel	x0, x0, x28, ls
	str	x0, [x1, 608]
	ldr	x0, [x19, 616]
	ldr	x1, [x20, 27896]
	cmp	x0, x27
	csel	x0, x0, x27, ls
	str	x0, [x1, 616]
	ldr	w0, [x19, 16]
	ldr	x1, [x20, 27896]
	cmp	w0, w26
	csel	w0, w0, w26, ls
	str	w0, [x1, 16]
	ldr	w0, [x19, 20]
	ldr	x1, [x20, 27896]
	cmp	w0, w25
	csel	w0, w0, w25, ls
	str	w0, [x1, 20]
	ldr	w0, [x19, 24]
	ldr	x1, [x20, 27896]
	cmp	w0, w24
	csel	w0, w0, w24, ls
	str	w0, [x1, 24]
	ldr	w0, [x19, 28]
	ldr	x1, [x20, 27896]
	cmp	w0, w21
	csel	w0, w0, w21, ls
	str	w0, [x1, 28]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3128
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3128
.L3129:
	ldr	x1, [x20, 27896]
	ldr	w0, [x1, 772]
	ldr	w2, [x1, 820]
	cmp	w0, w2
	csel	w0, w0, w2, cs
	str	w0, [x1, 684]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 684]
	str	w1, [x0, 672]
	ldr	x0, [x20, 27896]
	bl	CombineFldsToFrm
	ldr	x1, [x20, 27896]
	ldr	w0, [x1, 696]
	ldr	w1, [x1, 812]
	add	x0, x0, 4096
	add	x0, x0, 3028
	str	w1, [x23, x0, lsl 2]
	b	.L3117
	.p2align 3
.L3100:
	uxtw	x22, w20
	ldr	x1, [x19, 656]
	mov	w2, 3
	mov	w0, 3
	add	x20, x23, x22, lsl 3
	str	x1, [x20, 27896]
	ldrb	w3, [x19, 2]
	strb	w3, [x1]
	ldr	x1, [x20, 27896]
	strb	w2, [x1, 1]
	ldr	x2, [x19, 656]
	ldr	x1, [x20, 27896]
	ldrb	w2, [x2, 4]
	strb	w2, [x1, 4]
	ldr	x2, [x19, 656]
	ldr	x1, [x20, 27896]
	ldr	w2, [x2, 676]
	str	w2, [x1, 676]
	ldrb	w2, [x19, 4]
	ldr	x1, [x20, 27896]
	cbz	w2, .L3193
.L3102:
	strb	w0, [x1, 2]
	mov	x2, 640
	add	x1, x19, 16
	mov	w21, 3
	ldr	x0, [x20, 27896]
	ldr	w3, [x19, 732]
	str	w3, [x0, 692]
	ldr	x0, [x20, 27896]
	add	x0, x0, 16
	bl	memcpy
	ldr	x0, [x20, 27896]
	mov	w3, 2
	ldr	w1, [x19, 708]
	mov	w6, 1
	str	w1, [x0, 688]
	str	w1, [x0, 720]
	ldr	x0, [x20, 27896]
	ldr	x1, [x19, 656]
	str	x1, [x0, 744]
	str	x1, [x0, 792]
	str	x1, [x0, 840]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 676]
	str	w1, [x0, 668]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 672]
	str	w1, [x0, 660]
	ldr	x0, [x20, 27896]
	strb	wzr, [x0, 704]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x19, 4]
	strb	w1, [x0, 705]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x19, 5]
	strb	w1, [x0, 706]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 700]
	str	w1, [x0, 684]
	str	w1, [x0, 724]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x19, 9]
	str	w1, [x0, 680]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 684]
	str	w1, [x0, 672]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 688]
	str	w1, [x0, 716]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 692]
	str	w1, [x0, 764]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 696]
	str	w1, [x0, 812]
	ldrb	w1, [x19, 7]
	ldr	x0, [x20, 27896]
	cmp	w1, 1
	csel	w21, wzr, w21, ne
	strb	w21, [x0, 3]
	ldr	x1, [x19, 656]
	ldr	x0, [x20, 27896]
	ldr	w1, [x1, 736]
	str	w1, [x0, 736]
	ldr	x0, [x20, 27896]
	ldr	w2, [x0, 720]
	ldr	x1, [x0, 744]
	ldrb	w5, [x0, 705]
	ldrb	w4, [x0, 706]
	strb	w3, [x0, 800]
	ldr	w3, [x0, 724]
	str	w2, [x0, 768]
	str	x1, [x0, 792]
	str	w2, [x0, 816]
	mov	w2, 0
	strb	w5, [x0, 753]
	strb	w4, [x0, 754]
	strb	w6, [x0, 752]
	strb	w5, [x0, 801]
	strb	w4, [x0, 802]
	str	w3, [x0, 772]
	str	w3, [x0, 820]
	str	x1, [x0, 840]
	mov	x0, x23
	ldr	x1, [x19, 656]
	bl	GetAPC
	cbnz	w0, .L3194
.L3117:
	add	x3, x23, x22, lsl 3
	add	x0, x23, 65536
	mov	w2, 1
	ldr	x1, [x3, 27896]
	ldr	w0, [x0, 1980]
	ldr	w1, [x1, 656]
	bl	FSP_SetRef
	mov	w0, 0
.L3097:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3191:
	ldr	x1, .LC878
	mov	w2, w21
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, 1
	mov	x0, x23
	bl	ClearAll
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3099:
	ldr	x0, [x19, 656]
	mov	w1, 3
	uxtw	x22, w20
	strb	w1, [x0, 704]
	ldrb	w0, [x19, 1]
	cbz	w0, .L3105
	add	x20, x23, x22, lsl 3
	ldr	x0, [x20, 27896]
	cbz	x0, .L3105
	strb	w21, [x0, 752]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 700]
	str	w1, [x0, 772]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x19, 4]
	strb	w1, [x0, 753]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x19, 5]
	strb	w1, [x0, 754]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 692]
	str	w1, [x0, 764]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 700]
	str	w1, [x0, 772]
	ldr	x1, [x19, 656]
	ldr	x0, [x20, 27896]
	ldr	w1, [x1, 784]
	str	w1, [x0, 784]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 708]
	str	w1, [x0, 768]
	ldr	x0, [x20, 27896]
	ldr	w2, [x0, 768]
	ldr	w1, [x0, 816]
	add	w1, w2, w1
	str	w1, [x0, 688]
	str	w1, [x0, 720]
	ldr	x1, [x20, 27896]
	ldrb	w0, [x1]
	cbz	w0, .L3110
	ldrb	w0, [x19, 2]
.L3110:
	strb	w0, [x1]
	ldr	x1, [x20, 27896]
	ldrb	w0, [x1, 1]
	orr	w0, w0, 1
	strb	w0, [x1, 1]
	ldrb	w0, [x19, 7]
	ldr	x1, [x20, 27896]
	cmp	w0, 1
	beq	.L3195
	ldrb	w0, [x1, 3]
.L3112:
	strb	w0, [x1, 3]
	mov	x2, 640
	add	x1, x19, 16
	ldr	x3, [x20, 27896]
	add	x0, x3, 16
	ldr	x4, [x3, 600]
	str	x4, [x29, 104]
	ldp	w26, w25, [x3, 16]
	ldp	w24, w21, [x3, 24]
	ldr	x28, [x3, 608]
	ldr	x27, [x3, 616]
	bl	memcpy
	ldr	x0, [x19, 600]
	ldr	x4, [x29, 104]
	cmn	x0, #1
	ccmn	x4, #1, 4, eq
	beq	.L3113
	ldr	x0, [x20, 27896]
	str	x4, [x0, 600]
.L3113:
	ldr	x0, [x19, 608]
	ldr	x1, [x20, 27896]
	cmp	x0, x28
	csel	x0, x0, x28, ls
	str	x0, [x1, 608]
	ldr	x0, [x19, 616]
	ldr	x1, [x20, 27896]
	cmp	x0, x27
	csel	x0, x0, x27, ls
	str	x0, [x1, 616]
	ldr	w0, [x19, 16]
	ldr	x1, [x20, 27896]
	cmp	w0, w26
	csel	w0, w0, w26, ls
	str	w0, [x1, 16]
	ldr	w0, [x19, 20]
	ldr	x1, [x20, 27896]
	cmp	w0, w25
	csel	w0, w0, w25, ls
	str	w0, [x1, 20]
	ldr	w0, [x19, 24]
	ldr	x1, [x20, 27896]
	cmp	w0, w24
	csel	w0, w0, w24, ls
	str	w0, [x1, 24]
	ldr	w0, [x19, 28]
	ldr	x1, [x20, 27896]
	cmp	w0, w21
	csel	w0, w0, w21, ls
	str	w0, [x1, 28]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3114
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3114
.L3115:
	ldr	x1, [x20, 27896]
	ldr	w0, [x1, 772]
	ldr	w2, [x1, 820]
	cmp	w0, w2
	csel	w0, w0, w2, cs
	str	w0, [x1, 684]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 684]
	str	w1, [x0, 672]
	ldr	x0, [x20, 27896]
	bl	CombineFldsToFrm
	ldr	x1, [x20, 27896]
	ldr	w0, [x1, 696]
	ldr	w1, [x1, 764]
	add	x0, x0, 4096
	add	x0, x0, 3012
	str	w1, [x23, x0, lsl 2]
	b	.L3117
	.p2align 3
.L3105:
	add	x20, x23, x22, lsl 3
	ldr	x0, [x19, 656]
	mov	w1, 1
	str	x0, [x20, 27896]
	strb	w1, [x0, 752]
	ldr	x0, [x20, 27896]
	ldr	x2, [x19, 656]
	str	x2, [x0, 792]
	ldr	x0, [x20, 27896]
	ldrb	w2, [x19, 4]
	strb	w2, [x0, 753]
	ldr	x0, [x20, 27896]
	ldrb	w2, [x19, 5]
	strb	w2, [x0, 754]
	ldr	x0, [x20, 27896]
	ldr	w2, [x19, 692]
	str	w2, [x0, 764]
	ldr	x0, [x20, 27896]
	ldr	w2, [x19, 700]
	str	w2, [x0, 772]
	ldr	x2, [x19, 656]
	ldr	x0, [x20, 27896]
	ldr	w2, [x2, 784]
	str	w2, [x0, 784]
	ldr	x0, [x20, 27896]
	ldr	w2, [x19, 708]
	str	w2, [x0, 768]
	ldr	x0, [x20, 27896]
	ldr	w2, [x0, 768]
	str	w2, [x0, 688]
	str	w2, [x0, 720]
	ldr	x0, [x20, 27896]
	ldrb	w2, [x19, 2]
	strb	w2, [x0]
	ldr	x0, [x20, 27896]
	strb	w1, [x0, 1]
	ldr	x1, [x19, 656]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x1, 4]
	strb	w1, [x0, 4]
	ldr	x1, [x19, 656]
	ldr	x0, [x20, 27896]
	ldr	w1, [x1, 676]
	str	w1, [x0, 676]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3107
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3107
.L3108:
	ldr	x0, [x20, 27896]
	mov	x2, 640
	add	x1, x19, 16
	str	wzr, [x0, 680]
	ldr	x0, [x20, 27896]
	add	x0, x0, 16
	bl	memcpy
	ldr	x1, [x20, 27896]
	mov	w2, 1
	ldr	w3, [x19, 732]
	mov	x0, x23
	str	w3, [x1, 692]
	ldr	x1, [x20, 27896]
	ldr	w3, [x19, 672]
	str	w3, [x1, 660]
	ldr	x1, [x20, 27896]
	ldr	w3, [x19, 684]
	str	w3, [x1, 672]
	ldr	x1, [x20, 27896]
	ldr	w3, [x19, 700]
	str	w3, [x1, 684]
	ldrb	w3, [x19, 7]
	ldr	x1, [x20, 27896]
	cmp	w3, w2
	cset	w3, eq
	strb	w3, [x1, 3]
	ldr	x1, [x19, 656]
	bl	GetAPC
	cbz	w0, .L3117
	ldr	x1, .LC876
	mov	w3, w0
	mov	w2, 2686
	b	.L3188
	.p2align 3
.L3118:
	add	x20, x23, x22, lsl 3
	ldr	x0, [x19, 656]
	mov	w1, 2
	str	x0, [x20, 27896]
	strb	w1, [x0, 800]
	ldr	x0, [x20, 27896]
	ldr	x2, [x19, 656]
	str	x2, [x0, 840]
	ldr	x0, [x20, 27896]
	ldrb	w2, [x19, 4]
	strb	w2, [x0, 801]
	ldr	x0, [x20, 27896]
	ldrb	w2, [x19, 5]
	strb	w2, [x0, 802]
	ldr	x0, [x20, 27896]
	ldr	w2, [x19, 696]
	str	w2, [x0, 812]
	ldr	x0, [x20, 27896]
	ldr	w2, [x19, 700]
	str	w2, [x0, 820]
	ldr	x2, [x19, 656]
	ldr	x0, [x20, 27896]
	ldr	w2, [x2, 832]
	str	w2, [x0, 832]
	ldr	x0, [x20, 27896]
	ldr	w2, [x19, 708]
	str	w2, [x0, 816]
	ldr	x0, [x20, 27896]
	ldr	w2, [x0, 768]
	str	w2, [x0, 688]
	str	w2, [x0, 720]
	ldr	x0, [x20, 27896]
	ldrb	w2, [x19, 2]
	strb	w2, [x0]
	ldr	x0, [x20, 27896]
	strb	w1, [x0, 1]
	ldr	x1, [x19, 656]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x1, 4]
	strb	w1, [x0, 4]
	ldr	x1, [x19, 656]
	ldr	x0, [x20, 27896]
	ldr	w1, [x1, 676]
	str	w1, [x0, 676]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3120
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3120
.L3121:
	ldr	x0, [x20, 27896]
	mov	x2, 640
	add	x1, x19, 16
	str	wzr, [x0, 680]
	ldr	x0, [x20, 27896]
	add	x0, x0, 16
	bl	memcpy
	ldr	x1, [x20, 27896]
	mov	w2, 2
	ldr	w3, [x19, 732]
	mov	x0, x23
	str	w3, [x1, 692]
	ldr	x1, [x20, 27896]
	ldr	w3, [x19, 672]
	str	w3, [x1, 660]
	ldr	x1, [x20, 27896]
	ldr	w3, [x19, 684]
	str	w3, [x1, 672]
	ldr	x1, [x20, 27896]
	ldr	w3, [x19, 700]
	str	w3, [x1, 684]
	str	w3, [x1, 820]
	ldrb	w3, [x19, 7]
	ldr	x1, [x20, 27896]
	cmp	w3, 1
	csel	w21, w21, wzr, eq
	strb	w21, [x1, 3]
	ldr	x1, [x19, 656]
	bl	GetAPC
	cbz	w0, .L3117
	ldr	x1, .LC876
	mov	w3, w0
	mov	w2, 2809
.L3188:
	mov	w0, 0
	bl	dprint_vfmw
	mov	x0, x23
	bl	ClearDPB
	mov	w0, -1
	b	.L3097
	.p2align 3
.L3193:
	ldrb	w0, [x19, 5]
	mov	w2, 3
	cmp	w0, wzr
	csel	w0, w0, w2, eq
	b	.L3102
	.p2align 3
.L3120:
	ldr	x0, [x20, 27896]
	mov	w1, 2
	strb	w1, [x0, 2]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3121
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 676]
	str	w1, [x0, 668]
	b	.L3121
	.p2align 3
.L3107:
	ldr	x0, [x20, 27896]
	mov	w1, 1
	strb	w1, [x0, 2]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3108
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 676]
	str	w1, [x0, 668]
	b	.L3108
	.p2align 3
.L3128:
	ldr	x1, [x20, 27896]
	ldrb	w0, [x1, 2]
	orr	w0, w0, 2
	strb	w0, [x1, 2]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3129
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 676]
	str	w1, [x0, 668]
	b	.L3129
	.p2align 3
.L3114:
	ldr	x1, [x20, 27896]
	ldrb	w0, [x1, 2]
	orr	w0, w0, 1
	strb	w0, [x1, 2]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3115
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 676]
	str	w1, [x0, 668]
	b	.L3115
	.p2align 3
.L3192:
	ldrb	w0, [x1, 3]
	orr	w0, w0, 2
	uxtb	w0, w0
	b	.L3126
	.p2align 3
.L3195:
	ldrb	w0, [x1, 3]
	orr	w0, w0, 1
	uxtb	w0, w0
	b	.L3112
	.p2align 3
.L3190:
	ldr	x1, .LC874
	mov	w3, w20
	mov	w2, 2592
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3097
.L3194:
	ldr	x1, .LC876
	mov	w3, w0
	mov	w2, 2631
	b	.L3188
	.size	InsertFrmInDPB, .-InsertFrmInDPB
	.align	3
.LC874:
	.xword	.LC873
	.align	3
.LC876:
	.xword	.LC875
	.align	3
.LC878:
	.xword	.LC877
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecVDM
	.type	DecVDM, %function
DecVDM:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	bl	_mcount
	cbz	x22, .L3287
	add	x21, x22, 61440
	ldrb	w0, [x21, 2027]
	cbnz	w0, .L3288
.L3199:
	add	x19, x22, 65536
	ldr	w0, [x19, 2032]
	ldr	w1, [x19, 2036]
	add	w0, w0, 1
	cmp	w0, w1
	csel	w0, w0, w1, ge
	str	w0, [x19, 2032]
	sub	w0, w0, w1
	ldr	x1, [x22]
	str	w0, [x1, 624]
.L3200:
	ldr	w20, [x19, 1968]
	ldr	w0, [x19, 1908]
	ubfx	x20, x20, 16, 3
	cmp	w20, w0
	beq	.L3201
	sub	w0, w0, #2
	cmp	w0, 1
	ccmp	w20, 2, 4, ls
	beq	.L3201
	cmp	w20, 1
	ccmp	w20, 4, 4, hi
	beq	.L3289
.L3201:
	cmp	w20, 2
	str	w20, [x19, 1908]
	beq	.L3203
	cmp	w20, 3
	beq	.L3204
	cmp	w20, 1
	beq	.L3290
	ldr	w0, [x19, 1904]
	cbz	w0, .L3207
	cmp	w20, 4
	ldr	w0, [x21, 2724]
	bne	.L3214
	cbnz	w0, .L3214
	ldr	w0, [x19, 656]
	cbnz	w0, .L3215
	mov	w0, 2
	str	w0, [x19, 656]
	b	.L3228
	.p2align 3
.L3288:
	ldrb	w0, [x21, 2025]
	add	x19, x22, 65536
	cmp	w0, 1
	bne	.L3200
	b	.L3199
.L3289:
	ldr	x1, .LC882
	mov	w2, w20
	mov	w0, 2
	bl	dprint_vfmw
	str	w20, [x19, 1908]
	.p2align 2
.L3204:
	mov	x0, x22
	bl	H264_ClearCurrPic
	mov	x0, x22
	bl	ClearDPB
	mov	w0, -1
.L3281:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3203:
	ldr	w0, [x21, 2724]
	cbnz	w0, .L3210
	ldr	w0, [x19, 1904]
	cbz	w0, .L3207
	ldr	x0, [x19, 1896]
	ldr	w0, [x0, 48]
	cbz	w0, .L3228
	mov	w1, 1
	mov	x0, x22
	strb	w1, [x21, 2031]
	bl	H264_ClearCurrPic
	ldr	x1, .LC884
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3281
	.p2align 3
.L3207:
	mov	x0, x22
	bl	H264_ClearCurrPic
	ldr	x0, .LC885
	ldr	x4, [x0]
	cbz	x4, .L3285
	ldr	w0, [x19, 1980]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3290:
	ldr	w0, [x21, 2724]
	cmp	w0, 2
	beq	.L3291
	ldr	w1, [x19, 1904]
	cbz	w1, .L3207
.L3216:
	cmp	w0, 1
	bne	.L3228
	str	w0, [x19, 656]
.L3228:
	ldr	w2, [x19, 1944]
	mov	w0, 2
	ldr	x1, .LC890
	ldrb	w3, [x21, 2027]
	sub	w2, w2, #1
	bl	dprint_vfmw
	ldr	w0, [x21, 2748]
	str	w0, [x19, 1444]
	mov	w0, 1
	strb	w0, [x19, 706]
	ldr	w2, [x19, 1904]
	ldr	w1, [x21, 2752]
	ldr	w0, [x19, 1944]
	str	w1, [x19, 1440]
	str	w2, [x19, 1644]
	cbnz	w0, .L3218
	ldr	x1, [x22]
.L3219:
	ldr	w2, [x1, 640]
	mov	w0, 0
	strb	w2, [x19, 708]
	ldr	w2, [x1, 648]
	str	w2, [x19, 712]
	ldr	w2, [x1, 652]
	str	w2, [x19, 716]
	ldr	w2, [x1, 644]
	strb	w2, [x19, 709]
	ldr	w1, [x1, 692]
	strb	w1, [x19, 720]
	ldr	w4, [x21, 2764]
	ldr	x3, [x21, 2680]
	ldr	w1, [x21, 2760]
	str	w4, [x21, 2760]
	sub	w1, w1, w4
	ldr	w2, [x3, 256]
	add	w2, w2, w1
	str	w2, [x3, 256]
	ldr	w2, [x21, 2280]
	add	w1, w2, w1
	str	w1, [x21, 2280]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3291:
	ldr	w0, [x21, 2704]
	cbz	w0, .L3210
	ldr	w0, [x19, 1904]
	cbz	w0, .L3207
.L3229:
	ldr	w0, [x19, 656]
	cmp	w0, 2
	bne	.L3228
	ldr	x0, [x22]
	ldr	w0, [x0, 24]
	cbnz	w0, .L3228
	ldr	x0, .LC886
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L3228
	ldr	x1, .LC888
	mov	w0, 1
	ldr	w3, [x21, 2704]
	ldr	w2, [x21, 2708]
	bl	dprint_vfmw
	mov	x0, x22
	bl	H264_ClearCurrPic
	ldr	x0, .LC885
	ldr	x4, [x0]
	cbz	x4, .L3217
	ldr	w0, [x19, 1980]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
.L3217:
	ldr	x1, [x21, 2680]
	mov	w2, 0
	ldr	w0, [x19, 1980]
	ldr	w1, [x1, 656]
	bl	FSP_SetDisplay
	mov	w0, -1
	b	.L3281
	.p2align 3
.L3220:
	add	x0, x22, 24576
	ldr	w0, [x0, 3708]
	cbnz	w0, .L3221
	ldr	x1, [x22]
	ldr	w0, [x1, 24]
	cmp	w0, 2
	beq	.L3224
	ldr	x0, .LC885
	ldr	x4, [x0]
	cbz	x4, .L3284
	ldr	w0, [x19, 1980]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
.L3284:
	mov	x0, x22
	bl	H264_ClearCurrPic
	.p2align 2
.L3285:
	mov	w0, -1
	b	.L3281
	.p2align 3
.L3214:
	cmp	w0, 2
	beq	.L3229
	b	.L3216
	.p2align 3
.L3218:
	ldr	w4, [x21, 2724]
	cbnz	w4, .L3220
	ldr	x0, .LC885
	ldr	x5, [x0]
	cbz	x5, .L3221
	ldr	x1, [x19, 1648]
	cbz	x1, .L3222
	mov	w2, 0
	.p2align 2
.L3223:
	ldp	w3, w0, [x1, 8]
	ldr	x1, [x1, 4056]
	add	w0, w3, w0
	add	w0, w0, 7
	add	w2, w2, w0, lsr 3
	mov	w4, w2
	cbnz	x1, .L3223
.L3222:
	add	x2, x29, 64
	ldr	w0, [x19, 1980]
	mov	w1, 20
	mov	w3, 4
	str	w4, [x2, -8]!
	blr	x5
	ldr	x1, [x22]
.L3224:
	add	x2, x19, 704
	str	x2, [x22, 616]
	ldr	w0, [x1, 984]
	cmp	w0, 1
	beq	.L3292
	cmp	w0, 2
	beq	.L3293
.L3227:
	str	wzr, [x19, 1892]
	b	.L3219
	.p2align 3
.L3293:
	ldr	w0, [x1, 988]
	cmp	w0, wzr
	ccmp	x2, xzr, 4, gt
	beq	.L3227
	ldr	w0, [x21, 2724]
	cmp	w0, 2
	bne	.L3227
	str	xzr, [x22, 616]
	mov	w2, 0
	ldr	x1, [x21, 2680]
	ldr	w0, [x19, 1980]
	ldr	w1, [x1, 656]
	bl	FSP_SetDisplay
	ldr	x2, [x22]
	mov	x0, x22
	ldr	w1, [x2, 988]
	sub	w1, w1, #1
	str	w1, [x2, 988]
	bl	H264_ClearCurrPic
	mov	w0, -1
	b	.L3281
	.p2align 3
.L3221:
	ldr	x1, [x22]
	b	.L3224
	.p2align 3
.L3292:
	cbz	x2, .L3227
	ldr	w0, [x21, 2724]
	cmp	w0, 2
	bne	.L3227
	str	xzr, [x22, 616]
	mov	w2, 0
	ldr	x1, [x21, 2680]
	ldr	w0, [x19, 1980]
	ldr	w1, [x1, 656]
	bl	FSP_SetDisplay
	b	.L3284
	.p2align 3
.L3215:
	mov	w0, 1
	str	w0, [x19, 656]
	b	.L3228
.L3210:
	mov	w1, 1
	mov	x0, x22
	strb	w1, [x21, 2031]
	bl	H264_ClearCurrPic
	mov	w0, -1
	b	.L3281
.L3287:
	ldr	x2, .LC879
	mov	w3, 7510
	ldr	x1, .LC880
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3281
	.size	DecVDM, .-DecVDM
	.align	3
.LC879:
	.xword	.LC30
	.align	3
.LC880:
	.xword	.LC32
	.align	3
.LC882:
	.xword	.LC881
	.align	3
.LC884:
	.xword	.LC883
	.align	3
.LC885:
	.xword	g_event_report
	.align	3
.LC886:
	.xword	g_allow_B_before_P
	.align	3
.LC888:
	.xword	.LC887
	.align	3
.LC890:
	.xword	.LC889
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_FlushDecoder
	.type	H264_FlushDecoder, %function
H264_FlushDecoder:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L3300
	add	x1, x19, 20480
	mov	w2, 1
	mov	w20, 1
	mov	x0, x19
	strb	w2, [x1, 1589]
	str	wzr, [x1, 1632]
	str	w20, [x19, 624]
	bl	DecVDM
	cbz	w0, .L3294
	ldr	x1, .LC894
	mov	w0, w20
	bl	dprint_vfmw
.L3294:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3300:
	ldr	x2, .LC891
	mov	w3, 11558
	ldr	x1, .LC892
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H264_FlushDecoder, .-H264_FlushDecoder
	.align	3
.LC891:
	.xword	.LC30
	.align	3
.LC892:
	.xword	.LC32
	.align	3
.LC894:
	.xword	.LC893
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_VES_Splitter
	.type	H264_VES_Splitter, %function
H264_VES_Splitter:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	add	x19, x21, 12288
	mov	w20, w1
	mov	w23, w2
	mov	w24, w3
	add	x19, x19, 2600
	bl	_mcount
	mov	w1, 24
	add	x22, x21, 61440
	mov	x0, x19
	str	xzr, [x29, 72]
	bl	BsSkip
	str	wzr, [x22, 2460]
	ldr	x1, [x22, 2472]
	str	x1, [x29, 72]
	cbz	w20, .L3303
	cmp	w20, 1
	bne	.L3408
	cmp	w23, 1
	mov	w1, 16
	mov	x0, x19
	beq	.L3409
	bl	BsGet
	mov	w20, w0
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	mov	w1, 31745
	cmp	w20, w1
	beq	.L3325
	mov	w1, 24
	mov	x0, x19
	bl	BsBack
	mov	w1, 24
	mov	x0, x19
	bl	BsBack
	mov	w0, 32257
	cmp	w20, w0
	beq	.L3410
.L3391:
	mov	w0, 0
.L3412:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3408:
	ldr	x1, .LC908
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
.L3388:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3303:
	cmp	w23, 1
	beq	.L3411
	mov	w1, 24
	mov	x0, x19
	bl	BsBack
	mov	w0, 0
	b	.L3412
	.p2align 3
.L3325:
	and	w0, w0, 31
	cmp	w0, 25
	bne	.L3391
	ldr	x19, .LC895
	ldr	x4, [x19]
	cbz	x4, .L3327
	add	x0, x21, 65536
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	ldr	w0, [x0, 1980]
	blr	x4
.L3327:
	mov	x0, x21
	bl	DecVDM
	cbz	w0, .L3328
.L3398:
	ldr	x4, [x19]
	cbz	x4, .L3392
	add	x21, x21, 65536
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	ldr	w0, [x21, 1980]
	blr	x4
	mov	w0, -1
	b	.L3388
	.p2align 3
.L3410:
	ldr	x2, .LC896
	mov	w3, 12762
	ldr	x1, .LC906
	mov	w0, 0
	add	x2, x2, 288
	bl	dprint_vfmw
	.p2align 2
.L3401:
	ldr	x1, [x21, 632]
	cbz	x1, .L3392
	add	x0, x21, 65536
	ldr	w0, [x0, 1980]
	bl	ReleaseNAL
	str	xzr, [x21, 632]
.L3392:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, -1
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3411:
	mov	w1, 16
	mov	x0, x19
	mov	w23, 31745
	bl	BsGet
	mov	w20, w0
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	cmp	w20, w23
	beq	.L3306
	mov	w1, 24
	mov	x0, x19
	and	w20, w20, -513
	bl	BsBack
	mov	w1, 24
	mov	x0, x19
	bl	BsBack
	cmp	w20, w23
	beq	.L3401
	mov	w0, 0
	b	.L3412
	.p2align 3
.L3409:
	bl	BsGet
	mov	w20, w0
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	mov	w1, 31745
	cmp	w20, w1
	beq	.L3318
	mov	w1, 32
	mov	x0, x19
	bl	BsBack
	ldr	x0, [x21, 632]
	mov	w2, 32257
	mov	w1, 16
	cmp	w20, w2
	str	w1, [x0, 72]
	beq	.L3413
	mov	w1, 8
	mov	x0, x19
	bl	BsSkip
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	and	w0, w0, 31
	cmp	w0, 11
	bne	.L3401
	mov	x0, x21
	bl	H264_IsEosNal
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L3401
	ldr	x1, [x21, 632]
	mov	x0, x19
	ldr	w2, [x1, 16]
	ldr	x1, [x1, 8]
	bl	BsInit
	mov	w0, 3
	b	.L3388
	.p2align 3
.L3306:
	and	w0, w0, 31
	cmp	w0, 25
	bne	.L3401
	ldr	x19, .LC895
	ldr	x4, [x19]
	cbz	x4, .L3309
	add	x0, x21, 65536
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	ldr	w0, [x0, 1980]
	blr	x4
.L3309:
	mov	x0, x21
	bl	DecVDM
	cbnz	w0, .L3398
	ldr	x0, [x21, 632]
	add	x23, x22, 2456
	add	x20, x21, 65536
	ldr	w1, [x23, 8]
	add	x2, x29, 72
	ldr	w4, [x0, 16]
	ldr	w3, [x0, 48]
	ldr	w0, [x20, 1980]
	add	w3, w4, w3
	sub	w3, w3, #1
	bl	MetadataMapToSec
	cbnz	w0, .L3414
	ldr	x19, .LC899
	mov	x2, 5
	ldr	x1, .LC900
	ldr	x0, [x29, 72]
	ldr	x3, [x19, 104]
	blr	x3
	ldr	x1, [x21, 632]
	ldr	x0, [x29, 72]
	ldr	x3, [x19, 104]
	ldr	w2, [x1, 16]
	add	x0, x0, 5
	sub	w2, w2, #6
	str	w2, [x23, 4]
	ldr	x1, [x1, 8]
	add	x1, x1, 6
	blr	x3
	ldr	w0, [x23, 4]
	add	w0, w0, 5
	str	w0, [x23, 4]
	ldr	x1, [x21, 632]
	ldr	w2, [x1, 48]
	cbnz	w2, .L3415
.L3313:
	ldr	x23, .LC901
	ldr	w0, [x20, 1980]
	ldr	x1, [x23, w0, sxtw 3]
	cbz	x1, .L3314
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	ldrsw	x2, [x20, 1980]
	ldr	w1, [x22, 2460]
	ldr	x3, [x19, 88]
	ldr	x2, [x23, x2, lsl 3]
	ldr	x0, [x29, 72]
	blr	x3
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
	ldr	w0, [x20, 1980]
.L3314:
	ldr	x1, [x29, 72]
	bl	MetadataUnMapToSec
	cbnz	w0, .L3416
.L3332:
	ldr	x1, [x21, 632]
	cbz	x1, .L3392
	ldr	w0, [x20, 1980]
	bl	ReleaseNAL
	str	xzr, [x21, 632]
	mov	w0, -1
	b	.L3388
	.p2align 3
.L3318:
	and	w0, w0, 31
	cmp	w0, 25
	ccmp	w24, 2, 0, eq
	bne	.L3401
	ldr	x19, .LC895
	ldr	x4, [x19]
	cbz	x4, .L3321
	add	x0, x21, 65536
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	ldr	w0, [x0, 1980]
	blr	x4
.L3321:
	mov	x0, x21
	bl	DecVDM
	cbz	w0, .L3401
	b	.L3398
	.p2align 3
.L3413:
	add	x22, x21, 65536
	ldr	x20, .LC904
	ldrsw	x0, [x22, 1980]
	ldr	x0, [x20, x0, lsl 3]
	cbz	x0, .L3391
	ldr	x19, .LC899
	mov	w0, 0
	ldr	x1, [x19, 32]
	blr	x1
	ldr	x0, [x21, 632]
	ldrsw	x2, [x22, 1980]
	ldr	x3, [x19, 88]
	ldr	w1, [x0, 16]
	ldr	x2, [x20, x2, lsl 3]
	ldr	x0, [x0, 8]
	blr	x3
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
	mov	w0, 0
	b	.L3388
	.p2align 3
.L3328:
	ldr	x0, [x21, 632]
	add	x23, x22, 2456
	add	x20, x21, 65536
	ldr	w1, [x23, 8]
	add	x2, x29, 72
	ldr	w4, [x0, 16]
	ldr	w3, [x0, 48]
	ldr	w0, [x20, 1980]
	add	w3, w4, w3
	sub	w3, w3, #1
	bl	MetadataMapToSec
	cbnz	w0, .L3417
	ldr	x19, .LC899
	mov	x2, 5
	ldr	x1, .LC900
	ldr	x0, [x29, 72]
	ldr	x3, [x19, 104]
	blr	x3
	ldr	x1, [x21, 632]
	ldr	x0, [x29, 72]
	ldr	x3, [x19, 104]
	ldr	w2, [x1, 16]
	add	x0, x0, 5
	sub	w2, w2, #6
	str	w2, [x23, 4]
	ldr	x1, [x1, 8]
	add	x1, x1, 6
	blr	x3
	ldr	w0, [x23, 4]
	add	w0, w0, 5
	str	w0, [x23, 4]
	ldr	x1, [x21, 632]
	ldr	w2, [x1, 48]
	cbnz	w2, .L3418
.L3330:
	ldr	x23, .LC901
	ldr	w0, [x20, 1980]
	ldr	x1, [x23, w0, sxtw 3]
	cbz	x1, .L3331
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	ldrsw	x2, [x20, 1980]
	ldr	w1, [x22, 2460]
	ldr	x3, [x19, 88]
	ldr	x2, [x23, x2, lsl 3]
	ldr	x0, [x29, 72]
	blr	x3
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
	ldr	w0, [x20, 1980]
.L3331:
	ldr	x1, [x29, 72]
	bl	MetadataUnMapToSec
	cbz	w0, .L3332
	ldr	x2, .LC896
	mov	w3, 12750
	ldr	x1, .LC903
	mov	w0, 0
	add	x2, x2, 288
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3388
	.p2align 3
.L3418:
	ldr	x4, [x29, 72]
	uxtw	x2, w2
	ldr	x1, [x1, 40]
	ldr	x3, [x19, 104]
	add	x0, x4, x0, uxtw
	blr	x3
	ldr	x1, [x21, 632]
	ldr	w0, [x23, 4]
	ldr	w1, [x1, 48]
	add	w0, w1, w0
	str	w0, [x23, 4]
	b	.L3330
.L3415:
	ldr	x4, [x29, 72]
	uxtw	x2, w2
	ldr	x1, [x1, 40]
	ldr	x3, [x19, 104]
	add	x0, x4, x0, uxtw
	blr	x3
	ldr	x1, [x21, 632]
	ldr	w0, [x23, 4]
	ldr	w1, [x1, 48]
	add	w0, w1, w0
	str	w0, [x23, 4]
	b	.L3313
.L3417:
	ldr	x2, .LC896
	mov	w3, 12720
	ldr	x1, .LC898
	mov	w0, 0
	add	x2, x2, 288
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3388
.L3414:
	ldr	x2, .LC896
	mov	w3, 12559
	ldr	x1, .LC898
	mov	w0, 0
	add	x2, x2, 288
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3388
.L3416:
	ldr	x2, .LC896
	mov	w3, 12593
	ldr	x1, .LC903
	mov	w0, 0
	add	x2, x2, 288
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3388
	.size	H264_VES_Splitter, .-H264_VES_Splitter
	.align	3
.LC895:
	.xword	g_event_report
	.align	3
.LC896:
	.xword	.LANCHOR2
	.align	3
.LC898:
	.xword	.LC897
	.align	3
.LC899:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC900:
	.xword	g_RpuStartCode
	.align	3
.LC901:
	.xword	vfmw_save_metadata_file
	.align	3
.LC903:
	.xword	.LC902
	.align	3
.LC904:
	.xword	vfmw_save_el_file
	.align	3
.LC906:
	.xword	.LC905
	.align	3
.LC908:
	.xword	.LC907
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_SetDecParam
	.type	H264DEC_SetDecParam, %function
H264DEC_SetDecParam:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 65536
	bl	_mcount
	ldr	w21, [x19, 1996]
	cmp	w21, 1
	beq	.L3441
.L3420:
	mov	x0, x20
	bl	H264DEC_IsNeedSedOnly
	cmp	w0, 1
	beq	.L3442
	ldr	w0, [x19, 1992]
	cmp	w0, 1
	beq	.L3443
.L3419:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3443:
	ldr	w0, [x19, 1904]
	sub	w0, w0, #1
	str	w0, [x19, 1904]
.L3440:
	ldr	x1, [x20, 632]
	cbz	x1, .L3419
	ldr	w0, [x19, 1980]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3441:
	ldr	w0, [x19, 1904]
	cbz	w0, .L3420
	ldr	x0, [x20, 616]
	cbnz	x0, .L3420
	mov	x0, x20
	bl	DecVDM
	cbnz	w0, .L3444
.L3421:
	ldr	x0, [x20, 616]
	cbnz	x0, .L3419
	b	.L3440
	.p2align 3
.L3442:
	ldr	w1, [x19, 1904]
	add	x2, x20, 61440
	str	w0, [x19, 1892]
	add	x0, x19, 704
	str	w1, [x19, 2004]
	ldr	w2, [x2, 2748]
	str	w2, [x19, 1444]
	str	w1, [x19, 1644]
	ldr	x1, [x20]
	ldr	w1, [x1, 692]
	strb	w1, [x19, 720]
	str	x0, [x20, 616]
	str	wzr, [x19, 1996]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L3444:
	ldr	x1, .LC910
	mov	w0, w21
	bl	dprint_vfmw
	b	.L3421
	.size	H264DEC_SetDecParam, .-H264DEC_SetDecParam
	.align	3
.LC910:
	.xword	.LC909
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_CheckSedOnly
	.type	H264DEC_CheckSedOnly, %function
H264DEC_CheckSedOnly:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 65536
	bl	_mcount
	ldr	w0, [x19, 1988]
	str	wzr, [x19, 1992]
	cmp	w0, 2
	beq	.L3482
	cmp	w0, 1
	mov	w0, 0
	beq	.L3483
.L3475:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3483:
	ldr	w1, [x19, 1996]
	cmp	w1, 1
	bne	.L3475
	mov	w0, -1
	str	wzr, [x19, 1996]
	b	.L3475
	.p2align 3
.L3482:
	ldr	w0, [x19, 1984]
	cbz	w0, .L3481
	ldr	w1, [x19, 1996]
	mov	w0, 0
	cmp	w1, 1
	beq	.L3475
	ldr	w0, [x19, 1980]
	bl	VCTRL_CheckFreshSeg
	cbz	w0, .L3481
	ldr	w0, [x19, 1980]
	bl	VCTRL_CheckFreshRaw
	cbz	w0, .L3481
	ldr	x0, [x20, 632]
	ldr	w2, [x0, 16]
	ldr	x1, [x0, 8]
	cmp	w2, 3
	bls	.L3481
	add	x21, x20, 12288
	add	x21, x21, 2600
	mov	x0, x21
	bl	BsInit
	mov	w1, 24
	mov	x0, x21
	bl	BsSkip
	mov	x0, x21
	bl	BsResidBits
	cmp	w0, 7
	ble	.L3481
	mov	w1, 3
	mov	x0, x21
	bl	BsSkip
	mov	w1, 5
	mov	x0, x21
	bl	BsGet
	cmp	w0, 20
	mov	w22, w0
	beq	.L3484
	and	w0, w0, -5
	cmp	w0, 1
	cset	w23, eq
	beq	.L3451
	ldr	w1, [x19, 1904]
	mov	w0, 0
	cbz	w1, .L3481
.L3458:
	and	w1, w22, -9
	cmp	w1, 7
	beq	.L3456
	cmp	w22, 8
	ccmp	w22, 30, 4, ne
	ccmp	w22, 11, 4, ne
	ccmp	w0, wzr, 0, ne
	bne	.L3456
	cbz	w23, .L3481
.L3459:
	add	x20, x20, 61440
	mov	w0, 1
	str	wzr, [x19, 1996]
	str	w0, [x19, 1992]
	mov	w0, 0
	ldrb	w1, [x20, 2024]
	str	w1, [x19, 2000]
	b	.L3475
	.p2align 3
.L3456:
	mov	x0, x20
	bl	DecVDM
	cbz	w0, .L3481
	ldr	x1, .LC911
	mov	w0, 1
	bl	dprint_vfmw
.L3481:
	mov	w0, -1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3484:
	mov	x0, x21
	bl	BsResidBits
	cmp	w0, 23
	ble	.L3481
	mov	w1, 24
	mov	x0, x21
	mov	w23, 1
	bl	BsGet
	tbnz	x0, 23, .L3485
.L3451:
	mov	x0, x21
	bl	BsResidBits
	cmp	w0, wzr
	mov	w0, 0
	ble	.L3455
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
.L3455:
	ldr	w1, [x19, 1904]
	cbz	w1, .L3459
	b	.L3458
	.p2align 3
.L3485:
	ubfx	x0, x0, 22, 1
	mov	w1, 5
	cmp	w0, w23
	csel	w22, w22, w1, ne
	b	.L3451
	.size	H264DEC_CheckSedOnly, .-H264DEC_CheckSedOnly
	.align	3
.LC911:
	.xword	.LC909
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReceivePacket
	.type	ReceivePacket, %function
ReceivePacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 65536
	bl	_mcount
	ldr	x1, .LC913
	mov	w0, 7
	ldp	w3, w4, [x19, 16]
	ldr	x2, [x19, 8]
	bl	dprint_vfmw
	str	wzr, [x21, 2040]
	ldr	x0, [x20]
	ldr	w1, [x0, 936]
	cmp	w1, 1
	beq	.L3558
.L3487:
	ldr	x0, [x20, 632]
	cbz	x0, .L3492
	ldrb	w1, [x19]
	cmp	w1, 1
	beq	.L3559
.L3490:
	ldr	x1, .LC915
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbz	x1, .L3492
	ldr	w0, [x21, 1980]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L3492:
	ldr	w0, [x19, 20]
	cmp	w0, wzr
	ble	.L3494
	ldr	x0, [x19, 8]
	cbz	x0, .L3494
	ldr	w0, [x19, 16]
	cbz	w0, .L3494
	cbz	x20, .L3500
	ldrb	w0, [x20, 641]
	cbz	w0, .L3516
	add	x1, x20, 745
	mov	x0, 1
	b	.L3499
	.p2align 3
.L3498:
	add	w0, w0, 1
	cmp	w0, 137
	beq	.L3500
.L3499:
	ldrb	w2, [x1]
	add	x1, x1, 104
	cbnz	w2, .L3498
	mov	w2, w0
.L3497:
	lsl	x1, x0, 3
	mov	w3, 1
	sub	x1, x1, x0
	cmn	w2, #1
	lsl	x1, x1, x3
	sub	x0, x1, x0
	add	x0, x20, x0, lsl 3
	strb	w3, [x0, 641]
	beq	.L3500
	sxtw	x1, w2
	mov	w2, 1
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 1
	sub	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, x0, 640
	add	x0, x20, x0
	add	x1, x20, x1
	str	x1, [x20, 632]
	ldr	x1, [x19, 8]
	str	x1, [x0, 648]
	ldr	w1, [x19, 20]
	str	w1, [x0, 656]
	ldr	w1, [x19, 16]
	str	w1, [x0, 660]
	ldr	x0, [x20, 632]
	str	wzr, [x0, 28]
	ldr	x0, [x20, 632]
	ldr	w1, [x19, 24]
	str	w1, [x0, 36]
	ldr	x0, [x20, 632]
	ldr	x1, [x19, 32]
	str	x1, [x0, 96]
	ldr	x0, [x20, 632]
	str	w2, [x0, 76]
	ldr	x0, [x20, 632]
	strb	wzr, [x0]
	ldr	x0, [x20, 632]
	ldrb	w1, [x19]
	strb	w1, [x0, 4]
	ldr	w0, [x19, 28]
	str	w0, [x21, 1988]
	ldr	x0, [x20]
	ldrb	w0, [x0, 1016]
	cmp	w0, w2
	beq	.L3555
	add	x0, x20, 61440
	ldr	w2, [x19, 20]
	ldr	w1, [x0, 2760]
	ldr	w3, [x0, 2764]
	add	w2, w1, w2
	str	w2, [x0, 2760]
	ldr	w1, [x19, 20]
	add	w1, w3, w1
	str	w1, [x0, 2764]
	ldr	x0, [x20, 632]
	b	.L3505
	.p2align 3
.L3559:
	ldr	w2, [x0, 76]
	cmp	w2, 1
	bhi	.L3490
	ldrb	w2, [x0, 4]
	cmp	w2, 1
	bne	.L3491
	b	.L3490
	.p2align 3
.L3558:
	ldr	w0, [x0, 992]
	cbz	w0, .L3487
	ldr	x0, [x20, 632]
	cbz	x0, .L3492
	ldrb	w1, [x19]
.L3491:
	strb	w1, [x0, 4]
	ldr	x0, [x20]
	ldr	w1, [x0, 936]
	cmp	w1, 1
	beq	.L3560
.L3507:
	ldr	w0, [x19, 20]
	cmp	w0, wzr
	ble	.L3508
	ldr	x1, [x19, 8]
	cbz	x1, .L3508
	ldr	w0, [x19, 16]
	cbz	w0, .L3508
	ldr	x0, [x20, 632]
	ldr	w2, [x0, 76]
	cmp	w2, 1
	bls	.L3561
.L3509:
	mov	w1, 1
	strb	w1, [x0, 4]
	ldr	w1, [x19, 24]
	ldr	w0, [x21, 1980]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC918
	ldr	x4, [x0]
	cbz	x4, .L3555
	ldr	w0, [x21, 1980]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L3555:
	ldr	x0, [x20, 632]
.L3505:
	ldrb	w0, [x0, 4]
	ldp	x19, x20, [sp, 16]
	cmp	w0, wzr
	csetm	w0, eq
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3494:
	ldr	x1, .LC920
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x19, 24]
	ldr	w0, [x21, 1980]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC918
	ldr	x4, [x0]
	cbz	x4, .L3557
.L3556:
	ldr	w0, [x21, 1980]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L3557:
	mov	w0, -1
.L3564:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3508:
	ldr	x0, [x20, 632]
	b	.L3509
	.p2align 3
.L3560:
	ldr	w0, [x0, 992]
	cbnz	w0, .L3555
	b	.L3507
	.p2align 3
.L3561:
	ubfiz	x2, x2, 5, 32
	add	x0, x0, x2
	str	x1, [x0, 8]
	ldr	x1, [x20, 632]
	ldr	w2, [x19, 20]
	ldr	w0, [x1, 76]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 16]
	ldr	x1, [x20, 632]
	ldr	w2, [x19, 16]
	ldr	w0, [x1, 76]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 20]
	ldr	x1, [x20, 632]
	ldr	w0, [x1, 76]
	add	x0, x1, x0, lsl 5
	str	wzr, [x0, 28]
	ldr	x1, [x20, 632]
	ldr	w2, [x19, 24]
	ldr	w0, [x1, 76]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 36]
	ldr	x1, [x20, 632]
	ldr	w0, [x1, 76]
	add	w0, w0, 1
	str	w0, [x1, 76]
	ldr	x0, [x20]
	ldrb	w0, [x0, 1016]
	cmp	w0, 1
	beq	.L3510
	add	x0, x20, 61440
	ldr	w2, [x19, 20]
	ldr	w1, [x0, 2760]
	ldr	w3, [x0, 2764]
	add	w2, w1, w2
	str	w2, [x0, 2760]
	ldr	w1, [x19, 20]
	add	w1, w3, w1
	str	w1, [x0, 2764]
.L3510:
	ldr	x0, [x20, 632]
	cbz	x20, .L3512
	ldr	w1, [x0, 16]
	cmp	w1, 4095
	bls	.L3562
.L3512:
	mov	w1, 1
	str	w1, [x21, 2040]
	b	.L3505
	.p2align 3
.L3562:
	mov	x0, x20
	bl	CombinePacket.part.17
	ldr	x0, [x20, 632]
	b	.L3512
	.p2align 3
.L3500:
	ldr	x1, .LC917
	mov	w0, 0
	add	x22, x20, 12288
	add	x19, x20, 640
	add	x22, x22, 2600
	bl	dprint_vfmw
	b	.L3496
	.p2align 3
.L3501:
	add	x19, x19, 104
	cmp	x22, x19
	beq	.L3563
.L3496:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L3501
	ldr	w0, [x21, 1980]
	mov	x1, x19
	bl	ReleaseNAL
	b	.L3501
.L3563:
	mov	x0, x20
	bl	H264_ClearCurrPic
	mov	x0, x20
	bl	ClearDPB
	ldr	x0, .LC918
	ldr	x4, [x0]
	cbnz	x4, .L3556
	mov	w0, -1
	b	.L3564
.L3516:
	mov	w2, 0
	mov	x0, 0
	b	.L3497
	.size	ReceivePacket, .-ReceivePacket
	.align	3
.LC913:
	.xword	.LC912
	.align	3
.LC915:
	.xword	.LC914
	.align	3
.LC917:
	.xword	.LC916
	.align	3
.LC918:
	.xword	g_event_report
	.align	3
.LC920:
	.xword	.LC919
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DirectOutput
	.type	DirectOutput, %function
DirectOutput:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 61440
	bl	_mcount
	ldrb	w0, [x19, 2027]
	cmp	w0, 1
	beq	.L3567
	cbz	w0, .L3568
	cmp	w0, 2
	beq	.L3569
	mov	w21, 0
.L3566:
	mov	w0, w21
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3569:
	ldr	x0, [x19, 2680]
	mov	w1, 3
	strb	w1, [x0, 704]
	ldrb	w0, [x19, 2025]
	cbz	w0, .L3651
	ldr	x0, [x19, 3544]
	cbz	x0, .L3652
.L3591:
	ldr	x27, [x0, 600]
	mov	x2, 640
	ldp	w24, w23, [x0, 16]
	ldp	w22, w21, [x0, 24]
	ldr	x26, [x0, 608]
	add	x1, x19, 2040
	ldr	x25, [x0, 616]
	add	x0, x0, 16
	bl	memcpy
	cmn	x27, #1
	beq	.L3592
	ldr	x0, [x19, 3544]
	str	x27, [x0, 600]
.L3592:
	ldr	x0, [x19, 2632]
	ldr	x1, [x19, 3544]
	cmp	x0, x26
	csel	x0, x0, x26, ls
	str	x0, [x1, 608]
	ldr	x0, [x19, 2640]
	ldr	x1, [x19, 3544]
	cmp	x0, x25
	csel	x0, x0, x25, ls
	str	x0, [x1, 616]
	ldr	w0, [x19, 2040]
	ldr	x1, [x19, 3544]
	cmp	w0, w24
	csel	w0, w0, w24, ls
	str	w0, [x1, 16]
	ldr	w0, [x19, 2044]
	ldr	x1, [x19, 3544]
	cmp	w0, w23
	csel	w0, w0, w23, ls
	str	w0, [x1, 20]
	ldr	w0, [x19, 2048]
	ldr	x1, [x19, 3544]
	cmp	w0, w22
	csel	w0, w0, w22, ls
	str	w0, [x1, 24]
	ldr	w0, [x19, 2052]
	ldr	x1, [x19, 3544]
	cmp	w0, w21
	csel	w0, w0, w21, ls
	str	w0, [x1, 28]
	ldr	x1, [x19, 3544]
	ldrb	w0, [x1]
	cbz	w0, .L3593
	ldrb	w0, [x19, 2026]
.L3593:
	strb	w0, [x1]
	mov	w4, 2
	mov	w3, 3
	ldr	x1, [x19, 3544]
	ldrb	w0, [x1, 1]
	orr	w0, w0, 2
	strb	w0, [x1, 1]
	ldr	x1, [x19, 3544]
	ldr	w0, [x19, 2724]
	ldr	w2, [x1, 684]
	cmp	w0, w2
	csel	w0, w0, w2, cs
	str	w0, [x1, 684]
	ldr	x0, [x19, 3544]
	strb	w4, [x0, 800]
	ldr	x0, [x19, 3544]
	strb	w3, [x0, 704]
	ldr	x0, [x19, 3544]
	ldr	w1, [x19, 2732]
	str	w1, [x0, 816]
	ldr	x1, [x19, 3544]
	ldr	w2, [x1, 768]
	ldr	w0, [x1, 816]
	add	w0, w2, w0
	lsr	w0, w0, 1
	str	w0, [x1, 720]
	ldr	x0, [x19, 3544]
	ldr	w1, [x0, 720]
	str	w1, [x0, 688]
	ldr	x0, [x19, 3544]
	ldr	x1, [x0, 840]
	str	x1, [x0, 744]
	ldrb	w0, [x19, 2031]
	ldr	x1, [x19, 3544]
	cmp	w0, 1
	beq	.L3653
.L3594:
	ldrb	w0, [x1, 3]
.L3595:
	strb	w0, [x1, 3]
	add	x22, x20, 65536
	mov	w2, 0
	b	.L3648
	.p2align 3
.L3568:
	ldr	x0, [x19, 2680]
	strb	wzr, [x0, 704]
	ldr	x1, [x19, 3544]
	cbz	x1, .L3641
	mov	w2, 0
	mov	x0, x20
	bl	OutputFrmToVO
	cbnz	w0, .L3654
.L3571:
	ldr	x0, [x19, 3544]
	cbz	x0, .L3641
	ldr	x0, [x19, 2680]
	add	x22, x20, 65536
	mov	w2, 1
	ldr	w1, [x0, 656]
	ldr	w0, [x22, 1980]
	bl	FSP_ClearLogicFs
.L3570:
	ldr	x0, [x19, 2680]
	mov	w3, 3
	str	x0, [x19, 3544]
	mov	x2, 640
	add	x1, x19, 2040
	str	x0, [x0, 744]
	ldr	x0, [x19, 3544]
	ldr	x4, [x19, 2680]
	str	x4, [x0, 792]
	ldr	x0, [x19, 3544]
	ldr	x4, [x19, 2680]
	str	x4, [x0, 840]
	ldr	x0, [x19, 3544]
	ldrb	w4, [x19, 2026]
	strb	w4, [x0]
	ldr	x0, [x19, 3544]
	strb	w3, [x0, 1]
	ldr	x0, [x19, 3544]
	strb	wzr, [x0, 2]
	ldr	x0, [x19, 3544]
	strb	wzr, [x0, 4]
	ldr	x0, [x19, 3544]
	str	wzr, [x0, 676]
	ldr	x0, [x19, 3544]
	add	x0, x0, 16
	bl	memcpy
	ldr	x1, [x19, 3544]
	mov	w0, 3
	ldr	w3, [x19, 2732]
	mov	w2, 0
	str	w3, [x1, 688]
	str	w3, [x1, 720]
	ldr	x1, [x19, 3544]
	strb	wzr, [x1, 704]
	ldr	x1, [x19, 3544]
	ldr	w3, [x19, 2724]
	str	w3, [x1, 684]
	ldr	x1, [x19, 3544]
	ldrb	w3, [x19, 2033]
	str	w3, [x1, 680]
	ldrb	w3, [x19, 2031]
	ldr	x1, [x19, 3544]
	cmp	w3, 1
	csel	w0, wzr, w0, ne
	strb	w0, [x1, 3]
.L3648:
	ldr	x1, [x19, 3544]
	ldr	w0, [x22, 1980]
	ldr	w1, [x1, 656]
	bl	FSP_SetRef
	ldr	x1, [x19, 3544]
	mov	w2, 0
	mov	x0, x20
	bl	OutputFrmToVO
	mov	w21, w0
	ldr	x0, [x19, 3544]
	cbz	x0, .L3596
	ldr	x1, [x19, 2680]
	mov	w2, 1
	ldr	w0, [x22, 1980]
	ldr	w1, [x1, 656]
	bl	FSP_ClearLogicFs
.L3596:
	str	xzr, [x19, 3544]
.L3656:
	mov	w0, w21
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3567:
	ldr	x0, [x19, 2680]
	mov	w1, 3
	strb	w1, [x0, 704]
	ldrb	w0, [x19, 2025]
	cbnz	w0, .L3574
	ldr	x1, [x19, 3544]
	cbz	x1, .L3575
	mov	w2, 0
	mov	x0, x20
	bl	OutputFrmToVO
	mov	w21, w0
	cbnz	w0, .L3655
.L3576:
	ldr	x0, [x19, 2680]
	str	x0, [x19, 3544]
	str	x0, [x0, 792]
.L3577:
	ldr	x0, [x19, 3544]
	mov	w22, 1
	ldrb	w3, [x19, 2026]
	add	x1, x19, 2040
	mov	x2, 640
	add	x23, x20, 65536
	strb	w3, [x0]
	ldr	x0, [x19, 3544]
	strb	w22, [x0, 1]
	ldr	x0, [x19, 3544]
	strb	wzr, [x0, 4]
	ldr	x0, [x19, 3544]
	str	wzr, [x0, 676]
	ldr	x0, [x19, 3544]
	strb	wzr, [x0, 2]
	ldr	x0, [x19, 3544]
	ldr	w3, [x19, 2724]
	str	w3, [x0, 684]
	ldr	x0, [x19, 3544]
	str	wzr, [x0, 680]
	ldr	x0, [x19, 3544]
	add	x0, x0, 16
	bl	memcpy
	ldr	x0, [x19, 3544]
	ldr	w1, [x19, 2732]
	str	w1, [x0, 768]
	ldr	x0, [x19, 3544]
	ldr	w1, [x0, 768]
	str	w1, [x0, 688]
	str	w1, [x0, 720]
	ldr	x0, [x19, 3544]
	strb	w22, [x0, 752]
	ldrb	w1, [x19, 2031]
	ldr	x0, [x19, 3544]
	cmp	w1, 1
	cset	w1, eq
	strb	w1, [x0, 3]
	ldr	w22, [x23, 1912]
	cmp	w22, 1
	bne	.L3566
.L3645:
	ldr	x1, [x19, 3544]
	mov	w2, 0
	ldr	w0, [x23, 1980]
	ldr	w1, [x1, 656]
	bl	FSP_SetRef
	ldr	x1, [x19, 3544]
	mov	w2, 0
	mov	x0, x20
	bl	OutputFrmToVO
	mov	w21, w0
	ldr	x0, [x19, 3544]
	cbz	x0, .L3596
	ldr	x1, [x19, 2680]
	mov	w2, w22
	ldr	w0, [x23, 1980]
	ldr	w1, [x1, 656]
	bl	FSP_ClearLogicFs
	str	xzr, [x19, 3544]
	b	.L3656
	.p2align 3
.L3651:
	ldr	x1, [x19, 3544]
	cbz	x1, .L3586
	mov	w2, 0
	mov	x0, x20
	bl	OutputFrmToVO
	mov	w21, w0
	cbnz	w0, .L3657
.L3587:
	ldr	x0, [x19, 2680]
	str	x0, [x19, 3544]
	str	x0, [x0, 840]
.L3588:
	ldr	x0, [x19, 3544]
	mov	w22, 2
	ldrb	w3, [x19, 2026]
	mov	x2, 640
	add	x1, x19, 2040
	add	x23, x20, 65536
	strb	w3, [x0]
	ldr	x0, [x19, 3544]
	strb	w22, [x0, 1]
	ldr	x0, [x19, 3544]
	strb	wzr, [x0, 4]
	ldr	x0, [x19, 3544]
	str	wzr, [x0, 676]
	ldr	x0, [x19, 3544]
	strb	wzr, [x0, 2]
	ldr	x0, [x19, 3544]
	ldr	w3, [x19, 2724]
	str	w3, [x0, 684]
	ldr	x0, [x19, 3544]
	str	wzr, [x0, 680]
	ldr	x0, [x19, 3544]
	add	x0, x0, 16
	bl	memcpy
	ldr	x1, [x19, 3544]
	mov	w0, 2
	ldr	w2, [x19, 2732]
	str	w2, [x1, 816]
	ldr	x1, [x19, 3544]
	ldr	w2, [x1, 816]
	str	w2, [x1, 688]
	str	w2, [x1, 720]
	ldr	x1, [x19, 3544]
	strb	w22, [x1, 800]
	ldrb	w2, [x19, 2031]
	ldr	x1, [x19, 3544]
	cmp	w2, 1
	csel	w0, wzr, w0, ne
	strb	w0, [x1, 3]
	ldr	w22, [x23, 1912]
	cmp	w22, 1
	beq	.L3645
	mov	w0, w21
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3574:
	ldr	x0, [x19, 3544]
	cbz	x0, .L3658
.L3579:
	ldr	x27, [x0, 600]
	mov	x2, 640
	ldp	w24, w23, [x0, 16]
	ldp	w22, w21, [x0, 24]
	ldr	x26, [x0, 608]
	add	x1, x19, 2040
	ldr	x25, [x0, 616]
	add	x0, x0, 16
	bl	memcpy
	ldr	x0, [x19, 2624]
	cmn	x0, #1
	ccmn	x27, #1, 4, eq
	beq	.L3580
	ldr	x0, [x19, 3544]
	str	x27, [x0, 600]
.L3580:
	ldr	x0, [x19, 2632]
	ldr	x1, [x19, 3544]
	cmp	x0, x26
	csel	x0, x0, x26, ls
	str	x0, [x1, 608]
	ldr	x0, [x19, 2640]
	ldr	x1, [x19, 3544]
	cmp	x0, x25
	csel	x0, x0, x25, ls
	str	x0, [x1, 616]
	ldr	w0, [x19, 2040]
	ldr	x1, [x19, 3544]
	cmp	w0, w24
	csel	w0, w0, w24, ls
	str	w0, [x1, 16]
	ldr	w0, [x19, 2044]
	ldr	x1, [x19, 3544]
	cmp	w0, w23
	csel	w0, w0, w23, ls
	str	w0, [x1, 20]
	ldr	w0, [x19, 2048]
	ldr	x1, [x19, 3544]
	cmp	w0, w22
	csel	w0, w0, w22, ls
	str	w0, [x1, 24]
	ldr	w0, [x19, 2052]
	ldr	x1, [x19, 3544]
	cmp	w0, w21
	csel	w0, w0, w21, ls
	str	w0, [x1, 28]
	ldr	x1, [x19, 3544]
	ldrb	w0, [x1]
	cbz	w0, .L3581
	ldrb	w0, [x19, 2026]
.L3581:
	strb	w0, [x1]
	mov	w4, 1
	mov	w3, 3
	ldr	x1, [x19, 3544]
	ldrb	w0, [x1, 1]
	orr	w0, w0, 1
	strb	w0, [x1, 1]
	ldr	x1, [x19, 3544]
	ldr	w0, [x19, 2724]
	ldr	w2, [x1, 684]
	cmp	w0, w2
	csel	w0, w0, w2, cs
	str	w0, [x1, 684]
	ldr	x0, [x19, 3544]
	strb	w4, [x0, 752]
	ldr	x0, [x19, 3544]
	strb	w3, [x0, 704]
	ldr	x0, [x19, 3544]
	ldr	w1, [x19, 2732]
	str	w1, [x0, 768]
	ldr	x1, [x19, 3544]
	ldr	w2, [x1, 768]
	ldr	w0, [x1, 816]
	add	w0, w2, w0
	lsr	w0, w0, w4
	str	w0, [x1, 720]
	ldr	x0, [x19, 3544]
	ldr	w1, [x0, 720]
	str	w1, [x0, 688]
	ldr	x0, [x19, 3544]
	ldr	x1, [x0, 792]
	str	x1, [x0, 744]
	ldrb	w0, [x19, 2031]
	ldr	x1, [x19, 3544]
	cmp	w0, 1
	bne	.L3594
	ldrb	w0, [x1, 3]
	orr	w0, w0, 1
	uxtb	w0, w0
	b	.L3595
	.p2align 3
.L3641:
	add	x22, x20, 65536
	b	.L3570
	.p2align 3
.L3654:
	ldr	x2, .LC921
	mov	w4, w0
	ldr	x1, .LC922
	mov	w3, 2940
	add	x2, x2, 312
	mov	w0, 22
	bl	dprint_vfmw
	b	.L3571
	.p2align 3
.L3653:
	ldrb	w0, [x1, 3]
	orr	w0, w0, 2
	uxtb	w0, w0
	b	.L3595
	.p2align 3
.L3586:
	ldr	x0, [x19, 2680]
	mov	w21, 0
	str	x0, [x19, 3544]
	str	x0, [x0, 840]
	b	.L3588
	.p2align 3
.L3575:
	ldr	x0, [x19, 2680]
	mov	w21, 0
	str	x0, [x19, 3544]
	str	x0, [x0, 792]
	b	.L3577
	.p2align 3
.L3657:
	ldr	x2, .LC921
	mov	w4, w0
	ldr	x1, .LC922
	mov	w3, 3108
	add	x2, x2, 312
	mov	w0, 22
	bl	dprint_vfmw
	b	.L3587
	.p2align 3
.L3655:
	ldr	x2, .LC921
	mov	w4, w0
	ldr	x1, .LC922
	mov	w3, 2992
	add	x2, x2, 312
	mov	w0, 22
	bl	dprint_vfmw
	b	.L3576
	.p2align 3
.L3652:
	ldr	x0, [x19, 2680]
	str	x0, [x19, 3544]
	str	x0, [x0, 840]
	ldr	x0, [x19, 3544]
	b	.L3591
	.p2align 3
.L3658:
	ldr	x0, [x19, 2680]
	str	x0, [x19, 3544]
	str	x0, [x0, 792]
	ldr	x0, [x19, 3544]
	b	.L3579
	.size	DirectOutput, .-DirectOutput
	.align	3
.LC921:
	.xword	.LANCHOR2
	.align	3
.LC922:
	.xword	.LC850
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	StorePicInDPB
	.type	StorePicInDPB, %function
StorePicInDPB:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L3851
	add	x0, x20, 20480
	add	x23, x20, 61440
	str	wzr, [x0, 728]
	ldrb	w1, [x23, 2027]
	cmp	w1, 2
	cset	w1, eq
	str	w1, [x0, 732]
	ldrb	w0, [x23, 2024]
	cbz	w0, .L3852
	add	x21, x20, 65536
	ldr	x0, .LC929
	ldrsw	x1, [x21, 1980]
	ldr	w2, [x21, 2020]
	str	w2, [x21, 2016]
	ldr	x0, [x0, x1, lsl 3]
	ldrsb	w1, [x0, 44]
	cmp	w1, 1
	beq	.L3853
.L3664:
	ldr	w0, [x21, 1908]
	cmp	w0, 2
	beq	.L3854
	ldr	x19, [x20]
	ldr	w0, [x19, 24]
	cbnz	w0, .L3669
	ldr	w1, [x21, 2012]
	cmp	w1, 2
	beq	.L3671
	ldrb	w1, [x23, 2026]
	cbnz	w1, .L3671
	ldrb	w1, [x23, 2027]
	ldr	x24, [x23, 2680]
	sub	w2, w1, #1
	uxtb	w2, w2
	cbnz	w1, .L3855
.L3673:
	cmp	w2, 1
	bls	.L3856
.L3835:
	cbz	w1, .L3678
	ldrb	w2, [x24, 1]
	cbnz	w2, .L3678
.L3672:
	cmp	w0, 2
	beq	.L3857
.L3671:
	ldr	w6, [x23, 2704]
	cbz	w6, .L3707
	ldr	w3, [x21, 1972]
	ldr	w2, [x23, 2732]
	cmp	w3, w2
	bcs	.L3708
	ldrb	w0, [x23, 2026]
	cbnz	w0, .L3708
	ldr	w0, [x19, 684]
	cbz	w0, .L3858
.L3708:
	mov	x0, x20
	bl	Marking
	cbnz	w0, .L3859
	mov	x0, x20
	bl	UpdateReflist
	mov	x0, x20
	bl	UpdateLTReflist
	mov	x0, x20
	bl	RemoveUnUsedFrameStore
	cbnz	w0, .L3860
.L3701:
	ldrb	w0, [x23, 2025]
	cmp	w0, 1
	beq	.L3712
	add	x24, x20, 24576
.L3716:
	ldr	w6, [x23, 2704]
	cbz	w6, .L3861
	ldr	w4, [x24, 3712]
	ldr	w5, [x24, 3716]
	ldr	w3, [x24, 3704]
	add	w0, w4, w5
	cmp	w3, w0
	bhi	.L3724
	ldr	x0, [x20]
	ldr	w0, [x0, 24]
	cmp	w0, 3
	beq	.L3725
	ldr	x0, .LC946
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L3725
	ldr	x1, .LC948
	mov	w2, 4110
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x20
	bl	ClearDPB
	ldr	x1, .LC928
	mov	w3, 4112
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x20, .LC939
	b	.L3755
	.p2align 3
.L3669:
	ldrb	w1, [x23, 2026]
	cbnz	w1, .L3672
	ldrb	w1, [x23, 2027]
	ldr	x24, [x23, 2680]
	sub	w2, w1, #1
	uxtb	w2, w2
	cbz	w1, .L3673
	b	.L3855
.L3852:
	ldr	x1, .LC926
	add	x21, x20, 65536
	bl	dprint_vfmw
	ldr	x1, .LC928
	mov	w3, 3787
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x20, .LC939
.L3755:
	ldr	x1, [x23, 2680]
	mov	w2, 1
	ldr	w0, [x21, 1980]
	mov	w19, -1
	ldr	w1, [x1, 656]
	bl	FSP_ClearLogicFs
	mov	w3, w19
	mov	w2, 4210
	mov	x1, x20
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, [x23, 2680]
	strb	wzr, [x0, 4]
	ldr	x0, [x23, 2680]
	strb	wzr, [x0, 1]
.L3752:
	strb	wzr, [x23, 2024]
	mov	w0, w19
.L3834:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
.L3853:
	ldr	x1, [x0, 160]
	mov	x0, 1
	movk	x0, 0x2, lsl 32
	cmp	x1, x0
	bne	.L3664
	mov	x0, x20
	bl	H264_Sei_Get_Frame_Pts
	b	.L3664
.L3855:
	ldrb	w3, [x24, 1]
	cmp	w3, wzr
	ccmp	w2, 1, 0, eq
	bhi	.L3672
	b	.L3673
.L3859:
	ldr	x1, .LC943
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, .LC928
	mov	w3, 4031
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x20, .LC939
	b	.L3755
.L3856:
	ldr	w2, [x21, 2012]
	cbnz	w2, .L3675
	mov	w0, 1
	mov	x2, 744
	str	w0, [x21, 2012]
	add	x1, x23, 2024
	add	x0, x23, 2768
	bl	memcpy
	ldr	w0, [x19, 24]
	b	.L3672
.L3678:
	add	x22, x23, 2024
.L3681:
	cbz	w1, .L3682
	ldrb	w0, [x22, 1]
	cmp	w0, 1
	beq	.L3862
.L3682:
	ldr	w0, [x22, 708]
	str	w0, [x24, 688]
.L3683:
	mov	x1, x24
	mov	x0, x20
	bl	GetImagePara
	ldr	w0, [x21, 1980]
	ldr	w1, [x24, 656]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L3863
	ldrb	w0, [x22, 3]
	cbz	w0, .L3685
	ldrb	w0, [x22, 1]
	cmp	w0, 1
	beq	.L3864
.L3685:
	ldr	x0, [x22, 600]
.L3843:
	str	x0, [x19, 584]
.L3686:
	ldr	x0, [x22, 608]
	add	x1, x22, 560
	str	x0, [x19, 592]
	mov	x2, 32
	ldr	x3, .LC934
	add	x0, x19, 544
	ldr	x4, [x22, 616]
	str	x4, [x19, 600]
	ldr	w4, [x22, 16]
	str	w4, [x19]
	ldr	w4, [x22, 20]
	str	w4, [x19, 4]
	ldr	w4, [x22, 24]
	str	w4, [x19, 8]
	ldr	w4, [x22, 28]
	str	w4, [x19, 12]
	ldr	w4, [x24, 688]
	str	w4, [x19, 152]
	ldr	x3, [x3, 104]
	ldr	w4, [x22, 440]
	str	w4, [x19, 424]
	ldr	w4, [x22, 436]
	str	w4, [x19, 420]
	ldr	x4, [x22, 448]
	str	x4, [x19, 432]
	blr	x3
	ldr	w1, [x19, 152]
	cbz	w1, .L3692
	ldrb	w0, [x19, 64]
	and	w0, w0, 3
	cbz	w0, .L3865
.L3690:
	ldr	x0, [x20]
	ldr	w2, [x0, 4]
	cmp	w2, w1
	bcs	.L3692
	ldr	w0, [x0, 684]
	cmp	w0, 1
	beq	.L3692
	ldr	x0, .LC937
	ldr	x4, [x0]
	cbz	x4, .L3699
	ldr	w0, [x21, 1980]
	mov	w3, 8
	stp	w1, w2, [x29, 88]
	add	x2, x29, 88
	mov	w1, 104
	blr	x4
.L3699:
	ldr	w0, [x21, 1980]
	mov	w2, 0
	ldr	w1, [x24, 656]
	bl	FSP_SetDisplay
	ldr	x1, .LC928
	mov	w3, 3954
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x20, .LC939
	b	.L3755
.L3675:
	cmp	w2, 1
	bne	.L3835
	cmp	w1, 1
	add	x22, x23, 2024
	ldr	x24, [x23, 3424]
	beq	.L3866
	cmp	w1, 2
	bne	.L3681
	ldr	w0, [x23, 2720]
	str	w0, [x24, 812]
	ldrb	w1, [x22, 3]
	b	.L3681
.L3865:
	ldr	x1, .LC936
	mov	w2, 3929
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC937
	ldr	x4, [x0]
	cbz	x4, .L3691
	ldr	w0, [x21, 1980]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 111
	blr	x4
.L3691:
	ldr	w1, [x19, 152]
	cbnz	w1, .L3690
.L3692:
	ldr	w0, [x21, 1980]
	mov	w2, 1
	ldr	w1, [x24, 656]
	bl	FSP_SetDisplay
	ldr	w0, [x21, 1980]
	mov	x4, x19
	add	x3, x20, 8
	mov	x2, x20
	mov	w1, 0
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L3867
	ldr	w0, [x21, 1980]
	mov	w2, 0
	ldr	w1, [x24, 656]
	bl	FSP_SetDisplay
.L3694:
	ldr	x0, [x20]
	ldr	w0, [x0, 660]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L3868
	str	wzr, [x19, 16]
.L3696:
	ldr	w0, [x21, 2028]
	ldr	w1, [x21, 2012]
	add	w0, w0, 2
	str	w0, [x21, 2028]
	cmp	w1, 2
	beq	.L3698
	mov	w0, 1
	str	w0, [x24, 848]
.L3698:
	mov	w0, 2
	str	w0, [x21, 2012]
	ldr	x19, [x20]
	ldr	w0, [x19, 24]
	cmp	w0, 2
	bne	.L3671
.L3857:
	ldr	w0, [x23, 2704]
	cbz	w0, .L3701
	ldrb	w0, [x23, 2030]
	cmp	w0, 5
	beq	.L3702
.L3705:
	mov	x0, x20
	add	x19, x20, 24576
	bl	SimpleSlideDPB
	ldr	w1, [x19, 3708]
	add	x2, x23, 2024
	mov	x0, x20
	bl	InsertFrmInDPB
	cbz	w0, .L3869
	ldr	x20, .LC939
	mov	w3, w0
	mov	w2, 3997
	mov	w0, 0
	mov	x1, x20
	bl	dprint_vfmw
	ldr	x1, .LC928
	mov	w3, 3998
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3755
.L3707:
	ldrb	w0, [x23, 2025]
	cmp	w0, 1
	beq	.L3712
	add	x24, x20, 24576
	ldr	w3, [x24, 3704]
.L3724:
	mov	w7, -1
	mov	w8, w7
	.p2align 2
.L3743:
	ldr	w1, [x24, 3708]
	cmp	w1, w3
	bcc	.L3870
	cmp	w1, w3
	mov	w19, w1
	bls	.L3731
	mov	w19, w3
	str	w3, [x24, 3708]
.L3731:
	cbz	w19, .L3762
	add	x1, x24, 3320
	mov	w5, 2147483647
	mov	w22, 0
	mov	w0, 0
	.p2align 2
.L3734:
	ldr	x4, [x1]
	add	x1, x1, 8
	ldr	w2, [x4, 672]
	cmp	w2, w5
	bge	.L3733
	ldrb	w4, [x4, 4]
	cmp	w4, wzr
	csel	w22, w22, w0, eq
	csel	w5, w5, w2, eq
.L3733:
	add	w0, w0, 1
	cmp	w0, w19
	bne	.L3734
.L3732:
	cbnz	w6, .L3735
	ldr	w0, [x23, 2708]
	cmp	w0, w5
	blt	.L3736
.L3735:
	cbz	w3, .L3736
	cmp	w8, w22
	ccmp	w7, w19, 0, eq
	beq	.L3871
	mov	w1, w22
	mov	x0, x20
	bl	OutputFrmFromDPB
	cmn	w0, #1
	mov	w25, w0
	beq	.L3742
	mov	w7, w19
	mov	w8, w22
	ldr	w6, [x23, 2704]
	ldr	w3, [x24, 3704]
	b	.L3743
.L3736:
	ldr	w0, [x21, 1908]
	cmp	w0, 2
	beq	.L3872
.L3738:
	mov	x0, x20
	bl	DirectOutput
	cmn	w0, #1
	mov	w19, w0
	beq	.L3873
	cmp	w0, 1
	bne	.L3740
	ldr	x0, [x23, 2680]
	strb	wzr, [x0, 4]
	ldr	x0, [x23, 2680]
	strb	wzr, [x0, 1]
.L3740:
	ldr	x1, .LC928
	mov	w3, 4141
	mov	w2, w19
	mov	w0, 14
	bl	dprint_vfmw
.L3668:
	cmn	w19, #1
	bne	.L3752
	ldr	x20, .LC939
	b	.L3755
	.p2align 3
.L3762:
	mov	w5, 2147483647
	mov	w22, 0
	b	.L3732
.L3712:
	ldr	x0, [x23, 3544]
	ldr	x3, [x23, 2680]
	cmp	x3, x0
	ccmp	x0, xzr, 4, eq
	beq	.L3874
	mov	x0, x20
	bl	DirectOutput
	cmn	w0, #1
	mov	w19, w0
	beq	.L3875
	cmp	w0, 1
	bne	.L3720
	ldr	x0, [x23, 2680]
	strb	wzr, [x0, 4]
	ldr	x0, [x23, 2680]
	strb	wzr, [x0, 1]
.L3720:
	ldr	x1, .LC928
	mov	w3, 4067
	mov	w2, w19
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3668
.L3854:
	ldr	x1, .LC931
	bl	dprint_vfmw
	mov	x0, x20
	bl	DirectOutput
	mov	w19, w0
	ldr	w1, [x21, 640]
	ldr	w0, [x23, 2756]
	cmp	w0, w1
	beq	.L3666
	uxtw	x0, w0
	add	x0, x0, 16384
	add	x20, x20, x0, lsl 2
	str	wzr, [x20, 568]
	str	w1, [x23, 2756]
.L3666:
	cmp	w19, 1
	beq	.L3876
.L3667:
	ldr	x1, .LC928
	mov	w3, 3821
	mov	w2, w19
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3668
.L3870:
	cbz	w6, .L3745
	ldrb	w0, [x23, 2028]
	cbnz	w0, .L3745
	ldr	w0, [x24, 3712]
	cbz	w0, .L3745
	mov	w0, 0
	b	.L3750
.L3747:
	ldr	w1, [x24, 3712]
	cmp	w1, w0
	bls	.L3877
.L3750:
	add	x1, x20, x0, uxtw 3
	ldr	w3, [x23, 2696]
	add	w0, w0, 1
	ldr	x2, [x1, 28024]
	ldr	w4, [x2, 660]
	cmp	w4, w3
	bne	.L3747
	ldr	w3, [x2, 848]
	cmp	w3, 1
	beq	.L3747
	strb	wzr, [x2, 2]
	ldr	x2, [x1, 28024]
	ldrb	w3, [x2, 4]
	cmp	w3, 1
	bne	.L3749
	str	w3, [x2, 676]
	ldr	x2, [x1, 28024]
	strb	wzr, [x2, 4]
	ldr	x2, [x1, 28024]
.L3749:
	ldr	w1, [x2, 692]
	ldr	w3, [x21, 640]
	cmp	w1, w3
	uxtw	x1, w1
	add	x1, x1, 16384
	beq	.L3747
	add	x1, x20, x1, lsl 2
	str	wzr, [x1, 568]
	str	w3, [x2, 692]
	b	.L3747
.L3877:
	ldr	w1, [x24, 3708]
.L3745:
	add	x2, x23, 2024
	mov	x0, x20
	bl	InsertFrmInDPB
	ldr	w1, [x24, 3708]
	str	w1, [x23, 3536]
	cbz	w0, .L3751
	ldr	x20, .LC939
	mov	w3, w0
	mov	w2, 4196
	mov	w0, 1
	mov	x1, x20
	bl	dprint_vfmw
	ldr	x1, .LC928
	mov	w3, 4197
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3755
.L3742:
	ldr	x20, .LC939
	mov	w3, w0
	mov	w2, 4159
	mov	w0, 1
	mov	x1, x20
	bl	dprint_vfmw
	ldr	x1, .LC928
	mov	w3, 4160
	mov	w2, w25
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3755
.L3867:
	ldr	w0, [x21, 2036]
	add	w0, w0, 1
	str	w0, [x21, 2036]
	b	.L3694
.L3869:
	ldr	w1, [x19, 3708]
	mov	x0, x20
	add	w1, w1, 1
	str	w1, [x19, 3708]
	mov	w19, 0
	bl	UpdateReflist
	mov	x0, x20
	bl	UpdateLTReflist
	ldr	x1, .LC928
	mov	w3, 4006
	mov	w2, 0
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3752
.L3751:
	add	w1, w1, 1
	mov	x0, x20
	str	w1, [x24, 3708]
	mov	w19, 0
	bl	UpdateReflist
	mov	x0, x20
	bl	UpdateLTReflist
	b	.L3752
.L3725:
	ldr	w5, [x24, 3708]
	cmp	w5, w3
	bls	.L3727
	mov	w5, w3
	str	w3, [x24, 3708]
.L3727:
	cbz	w5, .L3759
	add	x2, x24, 3320
	mov	w1, 0
	mov	w0, 0
	mov	w4, 2147483647
	.p2align 2
.L3730:
	ldr	x3, [x2]
	add	x2, x2, 8
	ldr	w3, [x3, 672]
	cmp	w3, w4
	bge	.L3729
	mov	w1, w0
	mov	w4, w3
.L3729:
	add	w0, w0, 1
	cmp	w0, w5
	bne	.L3730
.L3728:
	mov	x0, x20
	bl	RemoveFrameStoreOutDPB
	mov	x0, x20
	bl	UpdateReflist
	mov	x0, x20
	bl	UpdateLTReflist
	ldr	w6, [x23, 2704]
	ldr	w3, [x24, 3704]
	b	.L3724
.L3858:
	ldr	x1, .LC941
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC937
	ldr	x4, [x0]
	cbz	x4, .L3709
	ldr	w1, [x21, 1972]
	mov	w3, 8
	ldr	w2, [x23, 2732]
	ldr	w0, [x21, 1980]
	stp	w2, w1, [x29, 88]
	add	x2, x29, 88
	mov	w1, 104
	blr	x4
.L3709:
	mov	x0, x20
	bl	H264_ClearCurrPic
	mov	x0, x20
	bl	ClearDPB
	ldr	x1, .LC928
	mov	w3, 4023
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x20, .LC939
	b	.L3755
.L3864:
	ldr	x0, [x22, 600]
	cmn	x0, #1
	bne	.L3686
	ldr	x0, [x23, 3368]
	cmn	x0, #1
	bne	.L3843
	b	.L3686
	.p2align 3
.L3871:
	ldr	x2, .LC949
	mov	w3, w22
	ldr	x1, .LC951
	mov	w0, 1
	add	x2, x2, 328
	bl	dprint_vfmw
	ldr	x1, .LC928
	mov	w3, 4148
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x20, .LC939
	b	.L3755
.L3872:
	ldrb	w0, [x23, 2027]
	cbz	w0, .L3738
	ldr	x0, [x23, 2680]
	str	x0, [x23, 3552]
	b	.L3738
.L3860:
	ldr	x1, .LC945
	mov	w0, 22
	bl	dprint_vfmw
	b	.L3701
.L3868:
	mov	x1, x19
	mov	x0, x20
	bl	SetFrmRepeatCount.part.7
	b	.L3696
.L3861:
	ldr	w3, [x24, 3704]
	b	.L3724
.L3874:
	add	x24, x20, 24576
	ldr	w4, [x24, 3708]
	cbz	w4, .L3716
	ldr	x0, [x20, 27896]
	cmp	x3, x0
	beq	.L3878
	add	x0, x24, 3328
	mov	w1, 0
	.p2align 2
.L3721:
	add	w1, w1, 1
	cmp	w1, w4
	beq	.L3716
	ldr	x2, [x0], 8
	cmp	x3, x2
	bne	.L3721
.L3717:
	add	x2, x23, 2024
	mov	x0, x20
	bl	InsertFrmInDPB
	cmn	w0, #1
	mov	w19, w0
	beq	.L3879
	mov	x0, x20
	mov	w19, 0
	bl	UpdateReflist
	mov	x0, x20
	bl	UpdateLTReflist
	ldr	x1, .LC928
	mov	w3, 4087
	mov	w2, 0
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3752
.L3876:
	ldr	x0, [x23, 2680]
	strb	wzr, [x0, 4]
	ldr	x0, [x23, 2680]
	strb	wzr, [x0, 1]
	b	.L3667
.L3702:
	mov	x0, x20
	bl	IDRMemMarking
	cbz	w0, .L3705
	mov	w0, -1
	b	.L3834
	.p2align 3
.L3862:
	mov	w0, 3
	strb	w0, [x24, 1]
	ldr	w1, [x24, 688]
	ldr	w0, [x22, 708]
	add	w0, w1, w0
	str	w0, [x24, 688]
	b	.L3683
.L3873:
	ldr	x1, .LC939
	mov	w3, w0
	mov	w2, 4132
	mov	w0, 1
	bl	dprint_vfmw
	b	.L3740
.L3863:
	ldr	x1, .LC933
	mov	w2, 3894
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x1, .LC928
	mov	w3, 3895
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x20, .LC939
	b	.L3755
.L3879:
	ldr	x20, .LC939
	mov	w3, w0
	mov	w2, 4080
	mov	w0, 1
	mov	x1, x20
	bl	dprint_vfmw
	ldr	x1, .LC928
	mov	w3, 4081
	mov	w2, w19
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3755
.L3759:
	mov	w1, 0
	b	.L3728
.L3851:
	ldr	x2, .LC923
	mov	w3, 3778
	ldr	x1, .LC924
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3834
.L3866:
	ldr	w0, [x23, 2716]
	str	w0, [x24, 764]
	ldrb	w1, [x22, 3]
	b	.L3681
.L3878:
	mov	w1, 0
	b	.L3717
.L3875:
	ldr	x1, .LC939
	mov	w3, w0
	mov	w2, 4057
	mov	w0, 1
	bl	dprint_vfmw
	b	.L3720
	.size	StorePicInDPB, .-StorePicInDPB
	.align	3
.LC923:
	.xword	.LC30
	.align	3
.LC924:
	.xword	.LC32
	.align	3
.LC926:
	.xword	.LC925
	.align	3
.LC928:
	.xword	.LC927
	.align	3
.LC929:
	.xword	s_pstVfmwChan
	.align	3
.LC931:
	.xword	.LC930
	.align	3
.LC933:
	.xword	.LC932
	.align	3
.LC934:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC936:
	.xword	.LC935
	.align	3
.LC937:
	.xword	g_event_report
	.align	3
.LC939:
	.xword	.LC938
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
.LC946:
	.xword	g_apple_airplay_mirrorinig_flag
	.align	3
.LC948:
	.xword	.LC947
	.align	3
.LC949:
	.xword	.LANCHOR2
	.align	3
.LC951:
	.xword	.LC950
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecGap
	.type	DecGap, %function
DecGap:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x25, x19, 24576
	add	x20, x19, 20480
	bl	_mcount
	add	x28, x19, 16384
	add	x0, x19, 12288
	add	x27, x19, 61440
	ldr	w1, [x25, 3180]
	mov	w22, 2
	ldr	w2, [x20, 1600]
	ldrb	w0, [x0, 2705]
	ldr	w5, [x20, 1596]
	cmp	w0, 1
	lsl	x0, x1, 6
	sub	x0, x0, x1
	ldr	w21, [x28, 788]
	lsl	x0, x0, 2
	str	w2, [x29, 120]
	sub	x0, x0, x1
	lsl	x0, x0, 1
	sub	x0, x0, x1
	lsl	x0, x0, 2
	add	x1, x19, x0
	add	x0, x0, 20480
	add	x1, x1, 20480
	add	x0, x19, x0
	add	x0, x0, 3268
	ldrb	w1, [x1, 3271]
	str	w1, [x29, 104]
	ldr	w1, [x20, 752]
	str	w1, [x29, 112]
	ldr	w1, [x20, 756]
	str	x0, [x27, 2688]
	str	w1, [x29, 108]
	csel	w1, wzr, w22, ne
	ldr	w0, [x25, 3708]
	str	w1, [x29, 116]
	cbz	w0, .L3904
	mov	w0, 1
	add	w21, w21, 4
	add	w2, w5, 1
	lsl	w21, w0, w21
	ldr	x1, .LC955
	mov	w0, w22
	udiv	w5, w2, w21
	str	wzr, [x20, 752]
	str	wzr, [x20, 756]
	msub	w26, w5, w21, w2
	bl	dprint_vfmw
	ldr	x1, .LC957
	mov	w3, w26
	ldr	w2, [x29, 120]
	mov	w0, w22
	bl	dprint_vfmw
	ldr	w1, [x25, 3704]
	ldr	w0, [x25, 3708]
	cmp	w0, w1
	bhi	.L3905
.L3884:
	cbz	w0, .L3895
	sub	w3, w0, #1
	mov	w22, 0
	add	x3, x3, 3488
	add	x0, x25, 3320
	add	x3, x19, x3, lsl 3
	.p2align 2
.L3887:
	ldr	x2, [x0]
	add	x0, x0, 8
	ldr	w1, [x2, 672]
	cmp	w22, w1
	bge	.L3886
	ldrb	w2, [x2, 4]
	cmp	w2, wzr
	csel	w22, w22, w1, eq
.L3886:
	cmp	x0, x3
	bne	.L3887
.L3885:
	ldr	w0, [x29, 120]
	mov	w23, 1
	str	wzr, [x29, 124]
	mov	w24, w23
	cmp	w0, w26
	bne	.L3900
	b	.L3892
	.p2align 3
.L3890:
	mov	x1, 0
	mov	x0, x19
	strb	wzr, [x27, 2028]
	bl	StorePicInDPB
	add	w1, w26, 1
	cbnz	w0, .L3906
.L3891:
	sdiv	w0, w1, w21
	str	w26, [x20, 1596]
	msub	w26, w0, w21, w1
	ldr	w0, [x29, 120]
	cmp	w0, w26
	beq	.L3892
	ldr	w0, [x25, 3708]
	ldr	w1, [x29, 124]
	cmp	w1, w0
	bhi	.L3892
.L3900:
	mov	w1, 1
	mov	x0, x19
	bl	AllocFrameStore
	cbnz	w0, .L3907
	ldr	x1, .LC961
	mov	w0, 2
	bl	dprint_vfmw
	strb	w24, [x27, 2030]
	ldr	x0, [x27, 2680]
	str	w26, [x0, 660]
	str	w26, [x27, 2696]
	ldr	x0, [x27, 2680]
	str	w26, [x0, 712]
	ldr	w0, [x29, 116]
	str	w0, [x27, 2704]
	ldr	x0, [x27, 2680]
	str	wzr, [x0, 708]
	ldr	x0, [x27, 2680]
	str	w23, [x0, 676]
	ldr	x0, [x27, 2680]
	strb	wzr, [x0, 4]
	ldr	x0, [x27, 2680]
	strb	w23, [x0]
	strb	w24, [x27, 2026]
	ldr	x0, [x27, 2688]
	strb	wzr, [x0, 3]
	ldr	w0, [x28, 792]
	cbz	w0, .L3890
	mov	x0, x19
	str	w26, [x20, 768]
	bl	DecPOC
	ldr	w0, [x20, 748]
	str	w0, [x27, 2708]
	ldr	w0, [x20, 744]
	str	w0, [x27, 2712]
	ldr	w0, [x20, 736]
	str	w0, [x27, 2716]
	cmp	w0, w22
	ldr	w0, [x20, 740]
	str	w0, [x27, 2720]
	bls	.L3890
	cmp	w0, w22
	ldr	w0, [x29, 124]
	mov	x1, 0
	strb	wzr, [x27, 2028]
	csinc	w0, w0, w0, ls
	str	w0, [x29, 124]
	mov	x0, x19
	bl	StorePicInDPB
	add	w1, w26, 1
	cbz	w0, .L3891
.L3906:
	ldr	w1, [x29, 112]
	mov	w3, w0
	str	w1, [x20, 752]
	mov	w2, 6473
	ldr	w1, [x29, 108]
	mov	w0, 0
	str	w1, [x20, 756]
	ldrb	w5, [x29, 104]
	ldr	x4, [x27, 2688]
	ldr	x1, .LC963
	strb	w5, [x4, 3]
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L3905:
	mov	w0, w1
	str	w1, [x25, 3708]
	b	.L3884
	.p2align 3
.L3904:
	ldr	x1, .LC953
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L3892:
	ldr	w0, [x29, 112]
	str	w0, [x20, 752]
	ldr	w0, [x29, 108]
	str	w0, [x20, 756]
	mov	w0, 0
	ldrb	w2, [x29, 104]
	ldr	x1, [x27, 2688]
	strb	w2, [x1, 3]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L3907:
	ldr	w0, [x29, 112]
	str	w0, [x20, 752]
	ldr	w0, [x29, 108]
	str	w0, [x20, 756]
	mov	w0, 0
	ldrb	w3, [x29, 104]
	ldr	x2, [x27, 2688]
	ldr	x1, .LC959
	strb	w3, [x2, 3]
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
.L3895:
	mov	w22, 0
	b	.L3885
	.size	DecGap, .-DecGap
	.align	3
.LC953:
	.xword	.LC952
	.align	3
.LC955:
	.xword	.LC954
	.align	3
.LC957:
	.xword	.LC956
	.align	3
.LC959:
	.xword	.LC958
	.align	3
.LC961:
	.xword	.LC960
	.align	3
.LC963:
	.xword	.LC962
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InitPic
	.type	InitPic, %function
InitPic:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L4038
	add	x22, x20, 20480
	mov	w1, 2208
	ldr	x4, [x20, 14968]
	add	x23, x20, 65536
	mov	w21, 4000
	ldr	x2, [x20, 14960]
	ldr	w0, [x22, 1592]
	ldr	w3, [x23, 1992]
	umull	x0, w0, w1
	cmp	w3, 1
	add	x25, x4, x0
	ldr	w1, [x25, 28]
	umull	x1, w1, w21
	add	x21, x2, x1
	beq	.L4039
	add	x19, x20, 61440
	ldrb	w0, [x19, 2024]
	cbz	w0, .L3913
	ldr	x0, [x19, 2680]
	cbz	x0, .L3914
	ldrb	w1, [x0, 1]
	cbz	w1, .L4040
	strb	wzr, [x19, 2024]
.L3913:
	add	x1, x29, 108
	mov	x0, x20
	bl	GetReRangeFlag
	mov	w24, w0
	ldr	w1, [x20, 15012]
	ldr	w0, [x21, 36]
	cmp	w1, w0
	beq	.L4041
.L3916:
	ldr	x1, .LC969
	add	x0, x20, 12288
	strb	wzr, [x21, 24]
	mov	x2, 4000
	add	x0, x0, 2688
	ldr	x3, [x1, 112]
	mov	x1, x21
	blr	x3
.L3917:
	ldr	w0, [x29, 108]
	cbz	w0, .L4042
.L3918:
	ldr	w0, [x23, 1940]
	add	w0, w0, 1
	str	w0, [x23, 1940]
	cbnz	w24, .L3920
	ldr	x0, [x20]
	ldr	w0, [x0, 992]
	cmp	w0, 1
	beq	.L3921
	mov	x0, x20
	bl	FlushDPB
	cbnz	w0, .L4043
.L4032:
	mov	x0, x20
	bl	InitDPB
	cbnz	w0, .L3968
	ldr	x0, [x20]
	ldr	w0, [x0, 992]
	cmp	w0, 1
	bne	.L4033
.L3925:
	add	x24, x20, 16384
	add	x1, x20, 12288
	add	x3, x23, 636
	ldr	w4, [x24, 1864]
	str	w4, [x23, 640]
	ldr	w0, [x24, 1844]
	ldrb	w26, [x1, 2706]
	mov	w1, 2
	add	w0, w0, 1
	ldr	w27, [x24, 1840]
	sub	w26, w1, w26
	lsl	w0, w0, 4
	add	w27, w27, 1
	mul	w26, w0, w26
	lsl	w27, w27, 4
	mov	x0, x20
	mov	w1, w27
	mov	w2, w26
	bl	H264_ArrangeVahbMem
	cmp	w0, 1
	beq	.L4044
	ldr	x1, [x20]
	mov	w0, -2
	ldr	w1, [x1, 992]
	cmp	w1, 1
	beq	.L4009
	ldr	x1, .LC974
	mov	w0, 0
	str	wzr, [x20, 14932]
	str	wzr, [x20, 14936]
	bl	dprint_vfmw
	mov	w1, 0
	mov	x0, x20
	bl	ClearAll
	mov	w0, -1
	b	.L4009
	.p2align 3
.L4042:
	ldr	x0, [x20]
	ldr	w0, [x0, 992]
	cmp	w0, 1
	beq	.L3918
.L4033:
	add	x24, x20, 16384
.L3919:
	ldr	w1, [x24, 2616]
	ldr	w0, [x25, 24]
	cmp	w1, w0
	bne	.L3927
	ldrb	w0, [x25, 20]
	cbnz	w0, .L3927
.L3928:
	ldr	w0, [x22, 728]
	ldr	w3, [x24, 788]
	cbz	w0, .L3929
	str	wzr, [x22, 1596]
	str	wzr, [x19, 3520]
.L3929:
	ldr	w0, [x23, 1908]
	cmp	w0, 2
	beq	.L3930
	ldr	x2, [x20]
	ldr	w0, [x2, 24]
	sub	w0, w0, #2
	cmp	w0, 1
	bls	.L3930
	ldr	w1, [x22, 1596]
	ldr	w4, [x22, 1600]
	cmp	w4, w1
	beq	.L3931
	mov	w0, 1
	add	w3, w3, 4
	lsl	w3, w0, w3
	add	w5, w1, w0
	udiv	w0, w5, w3
	msub	w0, w0, w3, w5
	cmp	w4, w0
	beq	.L3975
	ldr	w0, [x2, 656]
	cbnz	w0, .L3932
	ldr	x5, [x2, 696]
	mov	x0, 4294967296
	cmp	x5, x0
	beq	.L4045
.L3933:
	cmp	w4, w1
	bls	.L3934
	ldr	w0, [x24, 1864]
	sub	w1, w4, w1
	cmp	w0, w1
	bcs	.L3932
	ldrb	w0, [x22, 1584]
	cmp	w0, 2
	beq	.L3935
.L3940:
	ldr	w0, [x23, 1976]
	cbnz	w0, .L3932
	mov	x0, x20
	bl	H264_ClearCurrPic
	ldr	x0, .LC975
	ldrb	w0, [x0]
	cbz	w0, .L4046
.L3941:
	ldr	w0, [x22, 1596]
	mov	w2, 6688
	ldr	w3, [x22, 1600]
	ldr	x1, .LC977
	ldr	w4, [x24, 1864]
	sub	w3, w3, w0
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4009
	.p2align 3
.L4041:
	ldrb	w0, [x21, 24]
	cbz	w0, .L3917
	b	.L3916
	.p2align 3
.L3927:
	ldr	x0, .LC969
	mov	x2, 2208
	strb	wzr, [x25, 20]
	mov	x1, x25
	ldr	x3, [x0, 112]
	add	x0, x24, 2592
	blr	x3
	b	.L3928
	.p2align 3
.L3975:
	mov	w1, w4
	.p2align 2
.L3931:
	ldr	w0, [x22, 1612]
	cbz	w0, .L3950
	str	w1, [x22, 1596]
.L3950:
	mov	x0, x20
	str	w1, [x22, 768]
	bl	DecPOC
	mov	w1, 0
	mov	x0, x20
	bl	AllocFrameStore
	cbnz	w0, .L4047
	strb	wzr, [x19, 2031]
	mov	w0, 1
	strb	w0, [x19, 2024]
	mov	w1, -1
	mov	w4, 1
	ldrb	w0, [x22, 1587]
	strb	w0, [x19, 2030]
	ldr	w5, [x22, 1600]
	str	w5, [x19, 2696]
	ldr	w3, [x22, 1612]
	str	w3, [x19, 2704]
	ldr	w0, [x22, 748]
	str	w0, [x19, 2708]
	ldr	w0, [x22, 744]
	str	w0, [x19, 2712]
	ldr	w0, [x22, 736]
	str	w0, [x19, 2716]
	ldr	w0, [x22, 740]
	str	w0, [x19, 2720]
	strb	wzr, [x19, 2026]
	strb	wzr, [x19, 2029]
	strb	wzr, [x19, 2028]
	str	w1, [x19, 2752]
	ldrb	w2, [x22, 1585]
	cbz	w2, .L3952
	strb	w4, [x22, 1585]
	mov	w2, w4
	mov	w4, 2
.L3952:
	add	x25, x20, 12288
	ldr	w6, [x24, 1844]
	mov	w1, 2
	ldrb	w0, [x25, 2706]
	sub	w0, w1, w0
	madd	w0, w6, w0, w0
	str	w0, [x19, 2744]
	udiv	w0, w0, w4
	str	w0, [x19, 2740]
	ldr	w1, [x24, 1840]
	add	w1, w1, 1
	str	w1, [x19, 2736]
	mul	w0, w0, w1
	str	w0, [x19, 2748]
	ldrb	w0, [x24, 2592]
	strb	w0, [x19, 2032]
	cbnz	w2, .L3977
	ldrb	w0, [x25, 2707]
	mov	w1, 0
	cbnz	w0, .L4048
.L3953:
	strb	w0, [x19, 2033]
	str	w1, [x23, 1888]
	cbz	w3, .L3954
	str	w5, [x22, 1596]
.L3954:
	add	x26, x20, 24576
	ldr	w1, [x26, 3180]
	lsl	x0, x1, 6
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 1
	sub	x0, x0, x1
	add	x0, x20, x0, lsl 2
	add	x0, x0, 20480
	add	x0, x0, 3268
	str	x0, [x19, 2688]
	ldr	x0, [x20]
	ldr	x1, [x0, 64]
	str	x1, [x19, 2624]
	ldr	x1, [x0, 80]
	str	x1, [x19, 2632]
	ldr	x1, [x0, 96]
	str	x1, [x19, 2640]
	ldr	w1, [x0, 112]
	str	w1, [x19, 2040]
	ldr	w1, [x0, 116]
	str	w1, [x19, 2044]
	ldr	w1, [x0, 120]
	str	w1, [x19, 2048]
	ldr	w1, [x0, 136]
	str	w1, [x19, 2052]
	ldrb	w1, [x0, 56]
	strb	w1, [x19, 2672]
	ldr	w1, [x21, 44]
	str	w1, [x19, 2208]
	ldr	w1, [x21, 48]
	str	w1, [x19, 2212]
	mov	x1, -1
	str	x1, [x0, 64]
	mov	w0, 29
	ldr	x1, .LC983
	ldr	x2, [x19, 2624]
	bl	dprint_vfmw
	ldr	x1, .LC985
	mov	w0, 29
	ldr	x2, [x19, 2632]
	bl	dprint_vfmw
	ldr	w0, [x24, 1840]
	mov	w1, 2
	add	w0, w0, 1
	lsl	w0, w0, 4
	str	w0, [x19, 2108]
	ldrb	w2, [x25, 2706]
	ldr	w3, [x24, 1844]
	sub	w0, w1, w2
	madd	w0, w3, w0, w0
	lsl	w0, w0, 4
	str	w0, [x19, 2112]
	ldr	w0, [x20, 15016]
	ldr	w27, [x24, 1908]
	cmp	w0, 1
	ldr	w0, [x24, 792]
	cset	w28, ne
	and	w27, w27, 7
	cmp	w0, 1
	beq	.L3980
	ldr	w0, [x22, 1632]
	cbz	w0, .L4049
.L3980:
	mov	w0, 0
.L3955:
	cmp	w2, 1
	bne	.L4050
.L3970:
	ldrb	w0, [x26, 3220]
	sub	w0, w0, #3
	uxtb	w0, w0
	cmp	w0, 1
	cset	w25, ls
.L3956:
	ldr	x0, .LC969
	mov	x2, 4
	mov	w1, 0
	ldr	x3, [x0, 96]
	add	x0, x19, 2104
	blr	x3
	ldrb	w0, [x19, 2104]
	mov	w2, 2
	and	w0, w0, 252
	bfi	w0, w28, 2, 3
	strb	w0, [x19, 2104]
	ldr	w1, [x24, 1912]
	bfi	w0, w1, 5, 3
	ldrb	w1, [x19, 2105]
	strb	w0, [x19, 2104]
	bfi	w1, w25, 0, 2
	and	w0, w1, -13
	bfi	w0, w2, 4, 2
	strb	w0, [x19, 2105]
	ldr	w0, [x19, 2104]
	bfi	w0, w27, 14, 3
	str	w0, [x19, 2104]
	ldrb	w0, [x22, 1584]
	cmp	w0, w2
	beq	.L3957
	ldrb	w3, [x23, 2064]
	ubfx	x4, x3, 1, 4
	and	w3, w3, 1
.L3958:
	ldrb	w2, [x19, 2676]
	mov	w1, w27
	add	x0, x19, 2040
	bfi	w2, w4, 1, 4
	bfi	w2, w3, 0, 1
	strb	w2, [x19, 2676]
	ldrb	w2, [x23, 2068]
	and	w2, w2, -32
	strb	w2, [x23, 2068]
	bl	SetAspectRatio
	ldrb	w2, [x19, 2027]
	ldr	w1, [x23, 1940]
	cmp	w2, wzr
	ldr	x0, [x19, 2680]
	str	w1, [x19, 2196]
	cset	w1, ne
	str	w1, [x19, 2092]
	cbz	x0, .L4051
	ldr	w1, [x19, 2104]
	str	w1, [x0, 80]
	ldr	x0, [x19, 2680]
	ldr	w1, [x19, 2092]
	str	w1, [x0, 68]
	ldr	x0, [x19, 2680]
	ldr	w1, [x19, 2144]
	str	w1, [x0, 120]
	ldr	x0, [x19, 2680]
	ldr	w1, [x19, 2140]
	str	w1, [x0, 116]
	ldr	x0, [x19, 2680]
	ldr	w1, [x19, 2108]
	str	w1, [x0, 84]
	ldr	x0, [x19, 2680]
	ldr	w1, [x19, 2112]
	str	w1, [x0, 88]
	ldr	x1, [x19, 2680]
	ldr	w0, [x21, 3284]
	str	w0, [x1, 100]
	str	w0, [x19, 2124]
	ldr	x1, [x19, 2680]
	ldr	w0, [x21, 3288]
	str	w0, [x1, 104]
	str	w0, [x19, 2128]
	ldr	x1, [x19, 2680]
	ldr	w0, [x21, 3276]
	str	w0, [x1, 92]
	str	w0, [x19, 2116]
	ldr	x1, [x19, 2680]
	ldr	w0, [x21, 3280]
	str	w0, [x1, 96]
	str	w0, [x19, 2120]
	ldr	x1, [x19, 2680]
	ldr	w0, [x23, 1980]
	ldr	w1, [x1, 656]
	bl	FSP_GetDispPhyFs
	cbz	x0, .L3960
	ldr	w3, [x19, 2092]
	mov	w1, 0
	ldr	w2, [x0, 4]
	cmp	w3, wzr
	ldr	w0, [x23, 1980]
	cset	w3, ne
	bl	FSP_SetStoreType
.L3960:
	ldr	w1, [x23, 664]
	add	x2, x19, 2584
	add	x5, x19, 2616
.L3964:
	ldr	x0, [x2]
	cbz	x0, .L4052
.L3961:
	add	x2, x2, 8
	cmp	x5, x2
	bne	.L3964
	cbz	w1, .L3966
	cmp	w1, wzr
	ble	.L3966
	.p2align 2
.L3967:
	add	x22, x20, x1, sxtw 3
	sub	w21, w1, #1
	add	x22, x22, 65536
	ldr	w0, [x23, 1980]
	ldr	x1, [x22, 664]
	bl	FreeUsdByDec
	str	xzr, [x22, 664]
	mov	w1, w21
	cbnz	w21, .L3967
.L3966:
	str	wzr, [x23, 664]
	mov	x0, x20
	str	wzr, [x19, 2724]
	bl	CalcPicNum
	mov	w0, 0
.L4009:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3935:
	cbnz	w4, .L3937
	sub	w3, w3, #1
.L3938:
	mov	x0, x20
	str	w3, [x22, 1596]
	bl	FlushDPB
	cbnz	w0, .L4053
	ldrb	w0, [x22, 1584]
	cmp	w0, 2
	bne	.L3940
	.p2align 2
.L3932:
	mov	x0, x20
	bl	DecGap
	cbnz	w0, .L4054
.L3930:
	ldr	w1, [x22, 1600]
	b	.L3931
	.p2align 3
.L4052:
	cbz	w1, .L3961
	ldr	x0, [x23, 672]
	subs	w1, w1, #1
	str	x0, [x2]
	beq	.L3962
	add	x4, x23, 672
	mov	w3, 0
	.p2align 2
.L3963:
	add	w0, w3, 1
	mov	x3, x0
	cmp	w0, w1
	add	x0, x0, 8192
	add	x0, x0, 84
	ldr	x0, [x20, x0, lsl 3]
	str	x0, [x4], 8
	bne	.L3963
.L3962:
	uxtw	x0, w1
	add	x0, x0, 8192
	add	x0, x0, 84
	str	xzr, [x20, x0, lsl 3]
	str	w1, [x23, 664]
	b	.L3961
	.p2align 3
.L4039:
	ldrb	w2, [x21, 18]
	mov	w5, 2
	ldr	w7, [x21, 3252]
	add	x19, x20, 61440
	sub	w1, w5, w2
	ldrb	w6, [x22, 1585]
	madd	w1, w7, w1, w1
	add	w2, w6, 1
	udiv	w1, w1, w2
	str	w1, [x19, 2740]
	ldrb	w2, [x21, 18]
	ldr	w7, [x21, 3252]
	sub	w2, w5, w2
	madd	w2, w7, w2, w2
	str	w2, [x19, 2744]
	ldr	w2, [x21, 3248]
	add	w2, w2, 1
	str	w2, [x19, 2736]
	mul	w1, w1, w2
	str	w1, [x19, 2748]
	ldrb	w0, [x4, x0]
	strb	w0, [x19, 2032]
	cbnz	w6, .L3972
	ldrb	w0, [x21, 19]
	cbnz	w0, .L4055
	mov	w3, 0
	b	.L3912
	.p2align 3
.L3977:
	mov	w1, 0
	mov	w0, 0
	b	.L3953
	.p2align 3
.L4049:
	ldrb	w0, [x22, 1585]
	cmp	w0, 1
	beq	.L3955
	ldrb	w0, [x25, 2707]
	mov	w25, 1
	cbnz	w0, .L3956
	b	.L3970
	.p2align 3
.L3921:
	ldr	x1, .LC989
	mov	w0, 22
	bl	dprint_vfmw
	b	.L4032
	.p2align 3
.L3972:
	mov	w3, 0
	mov	w0, 0
.L3912:
	strb	w0, [x19, 2033]
	mov	w0, 0
	str	w3, [x23, 1888]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4048:
	mov	w1, 1
	mov	w0, w1
	b	.L3953
	.p2align 3
.L4040:
	ldr	w1, [x0, 656]
	mov	w2, 1
	ldr	w0, [x23, 1980]
	bl	FSP_ClearLogicFs
	ldr	x0, [x19, 2680]
	strb	wzr, [x0, 1]
	ldr	x0, [x19, 2680]
	strb	wzr, [x0, 4]
	strb	wzr, [x19, 2024]
	b	.L3913
	.p2align 3
.L3957:
	ldrb	w3, [x23, 2068]
	ldrb	w0, [x23, 2064]
	ubfx	x4, x3, 1, 4
	and	w3, w3, 1
	bfi	w0, w4, 1, 4
	bfi	w0, w3, 0, 1
	strb	w0, [x23, 2064]
	b	.L3958
	.p2align 3
.L4050:
	cmp	w0, wzr
	cset	w25, ne
	b	.L3956
	.p2align 3
.L3920:
	ldr	x1, .LC989
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x20
	bl	InitDPB
	cbz	w0, .L3925
.L3968:
	ldr	x1, .LC972
	mov	w3, w0
	mov	w2, 6592
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4009
	.p2align 3
.L4044:
	lsr	w27, w27, 4
	lsr	w26, w26, 4
	str	w27, [x20, 14932]
	str	w26, [x20, 14936]
	b	.L3919
	.p2align 3
.L4055:
	mov	w0, w3
	b	.L3912
	.p2align 3
.L3934:
	sub	w0, w4, w1
	ldr	w1, [x24, 1864]
	add	w0, w0, w3
	cmp	w1, w0
	bcs	.L3932
	ldrb	w0, [x22, 1584]
	cmp	w0, 2
	beq	.L3942
.L3947:
	ldr	w0, [x23, 1976]
	cbnz	w0, .L3932
	mov	x0, x20
	bl	H264_ClearCurrPic
	ldr	x0, .LC975
	ldrb	w0, [x0]
	cbz	w0, .L4056
.L3948:
	ldr	w0, [x22, 1596]
	mov	w2, 6721
	ldr	w3, [x22, 1600]
	ldr	x1, .LC977
	ldr	w4, [x24, 1864]
	sub	w3, w3, w0
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4009
.L4054:
	ldr	x1, .LC979
	mov	w2, 6731
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4009
	.p2align 3
.L3914:
	ldr	x2, .LC966
	mov	w3, 6555
	ldr	x1, .LC968
	mov	w0, 22
	add	x2, x2, 344
	bl	dprint_vfmw
	strb	wzr, [x19, 2024]
	b	.L3913
.L4045:
	ldr	w0, [x2, 704]
	cbnz	w0, .L3933
	ldr	w0, [x2, 660]
	add	w0, w0, 1024
	cmp	w0, 2048
	bhi	.L3932
	b	.L3933
.L4047:
	ldr	x1, .LC981
	mov	w2, 6750
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4009
.L3942:
	cbnz	w4, .L3944
	sub	w3, w3, #1
.L3945:
	mov	x0, x20
	str	w3, [x22, 1596]
	bl	FlushDPB
	cbnz	w0, .L4057
	ldrb	w0, [x22, 1584]
	cmp	w0, 2
	beq	.L3932
	b	.L3947
	.p2align 3
.L4051:
	ldr	x2, .LC966
	mov	w3, 6872
	ldr	x1, .LC987
	mov	w0, 22
	add	x2, x2, 344
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4009
.L4038:
	ldr	x2, .LC964
	mov	w3, 6522
	ldr	x1, .LC965
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4009
.L4043:
	ldr	x1, .LC970
	mov	w3, w0
	mov	w2, 6584
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4009
.L3944:
	sub	w3, w4, #1
	b	.L3945
.L3937:
	sub	w3, w4, #1
	b	.L3938
.L4057:
	ldr	x1, .LC970
	mov	w3, w0
	mov	w2, 6705
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4009
.L4053:
	ldr	x1, .LC970
	mov	w3, w0
	mov	w2, 6672
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4009
.L4046:
	mov	x0, x20
	bl	ClearDPB
	b	.L3941
.L4056:
	mov	x0, x20
	bl	ClearDPB
	b	.L3948
	.size	InitPic, .-InitPic
	.align	3
.LC964:
	.xword	.LC30
	.align	3
.LC965:
	.xword	.LC32
	.align	3
.LC966:
	.xword	.LANCHOR2
	.align	3
.LC968:
	.xword	.LC967
	.align	3
.LC969:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC970:
	.xword	.LC871
	.align	3
.LC972:
	.xword	.LC971
	.align	3
.LC974:
	.xword	.LC973
	.align	3
.LC975:
	.xword	g_apple_airplay_mirrorinig_flag
	.align	3
.LC977:
	.xword	.LC976
	.align	3
.LC979:
	.xword	.LC978
	.align	3
.LC981:
	.xword	.LC980
	.align	3
.LC983:
	.xword	.LC982
	.align	3
.LC985:
	.xword	.LC984
	.align	3
.LC987:
	.xword	.LC986
	.align	3
.LC989:
	.xword	.LC988
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_DecSlice
	.type	H264_DecSlice, %function
H264_DecSlice:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L4113
	add	x20, x19, 65536
	ldr	x1, .LC992
	mov	w0, 22
	add	x21, x19, 20480
	ldr	w2, [x20, 1924]
	sub	w2, w2, #1
	bl	dprint_vfmw
	ldr	x0, [x19, 632]
	ldr	x2, .LC993
	ldrb	w1, [x0, 2]
	strb	w1, [x21, 1587]
	ldr	w0, [x0, 84]
	str	w0, [x21, 1612]
	ldrsw	x0, [x20, 1980]
	ldr	x0, [x2, x0, lsl 3]
	ldrsb	w2, [x0, 44]
	cmp	w2, 1
	beq	.L4114
.L4061:
	mov	x0, x19
	bl	ProcessSliceHeaderFirstPart
	cbnz	w0, .L4112
	mov	x0, x19
	bl	ProcessSliceHeaderSecondPart
	cbnz	w0, .L4112
	ldr	w2, [x20, 1904]
	mov	w3, 0
	add	x22, x19, 61440
	cbz	w2, .L4067
	sub	w9, w2, #1
	add	x22, x19, 61440
	add	x9, x9, 4096
	add	x4, x22, 3576
	add	x9, x9, 4032
	mov	w10, 0
	mov	w3, 0
	mov	x0, 0
	add	x9, x19, x9, lsl 3
	.p2align 2
.L4075:
	ldr	x1, [x4]
	ldr	x6, [x1, 8]
	cbz	x6, .L4090
	ldr	x5, [x1, 40]
	ldr	w7, [x1, 16]
	cbz	x5, .L4091
.L4121:
	ldr	w1, [x1, 48]
.L4070:
	cbz	x0, .L4071
	cmp	x6, x0
	mov	w8, w7
	bls	.L4072
	sub	x0, x6, x0
	sub	w0, w0, w10
	add	w8, w0, w7
.L4072:
	add	w3, w1, w3
	add	w3, w8, w3
.L4073:
	cbz	x5, .L4115
	mov	x0, x5
	mov	w10, w1
.L4074:
	add	x4, x4, 8
	cmp	x9, x4
	bne	.L4075
.L4067:
	str	w3, [x20, 1964]
	ldr	w0, [x22, 2736]
	ldr	w4, [x22, 2740]
	mul	w4, w0, w4
	cmp	w4, 1620
	bgt	.L4116
	lsl	w0, w4, 2
	mov	w1, 32769
	sub	w4, w0, w4
	mov	w0, 16384
	lsl	w4, w4, 8
	cmp	w4, w1
	asr	w4, w4, 1
	csel	w4, w4, w0, gt
.L4077:
	ldr	w0, [x19, 14940]
	cmp	w0, w2
	bls	.L4078
	cmp	w4, w3
	bcc	.L4078
	ldrb	w0, [x21, 1589]
	cbz	w0, .L4081
	ldr	x1, .LC1001
	mov	w0, 2
	bl	dprint_vfmw
	ldrb	w0, [x21, 1587]
	cmp	w0, 5
	ldr	w0, [x20, 1944]
	beq	.L4117
.L4083:
	add	w0, w0, 1
	str	wzr, [x20, 1960]
	str	w0, [x20, 1944]
	ldrb	w0, [x22, 2027]
	cbnz	w0, .L4084
	ldr	w0, [x20, 1948]
	add	w0, w0, 1
	str	w0, [x20, 1948]
.L4085:
	mov	x0, x19
	bl	InitPic
	cmn	w0, #2
	beq	.L4060
	cbnz	w0, .L4118
	mov	x0, x19
	bl	WritePicMsg
.L4081:
	mov	x0, x19
	bl	PicTypeStatistic
	ldr	w0, [x20, 1992]
	cbnz	w0, .L4087
	mov	x0, x19
	bl	DecList
	cbnz	w0, .L4119
	mov	x0, x19
	bl	IsRefListWrong
	cbnz	w0, .L4120
	mov	x0, x19
	bl	ExitSlice
.L4087:
	mov	x0, x19
	bl	CalcStreamBits
	mov	x0, x19
	bl	WriteSliceMsg
	ldr	w1, [x20, 1960]
	mov	w2, 1
	mov	w0, 0
	str	w2, [x20, 644]
	add	w1, w1, w2
	str	w1, [x20, 1960]
.L4060:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L4115:
	mov	x0, x6
	mov	w10, w7
	b	.L4074
	.p2align 3
.L4071:
	add	w3, w7, w3
	add	w3, w3, w1
	b	.L4073
	.p2align 3
.L4090:
	ldr	x5, [x1, 40]
	mov	w7, 0
	cbnz	x5, .L4121
	.p2align 2
.L4091:
	mov	w1, 0
	b	.L4070
	.p2align 3
.L4116:
	lsl	w4, w4, 8
	b	.L4077
	.p2align 3
.L4114:
	ldr	x2, [x0, 160]
	mov	x0, 1
	movk	x0, 0x2, lsl 32
	cmp	x2, x0
	bne	.L4061
	cmp	w1, 5
	bne	.L4061
	ldr	x0, [x19]
	ldr	x0, [x0, 64]
	cmn	x0, #1
	beq	.L4061
	ldr	x1, [x19, 27840]
	str	x0, [x19, 27872]
	str	x1, [x19, 27880]
	b	.L4061
	.p2align 3
.L4084:
	ldr	w0, [x20, 1952]
	add	w0, w0, 1
	str	w0, [x20, 1952]
	b	.L4085
	.p2align 3
.L4117:
	str	w0, [x20, 1956]
	b	.L4083
.L4112:
	ldr	x1, .LC994
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC995
	ldr	x4, [x0]
	cbz	x4, .L4110
	add	x2, x29, 64
	ldr	w0, [x20, 1980]
	mov	w5, -1
	mov	w3, 4
	mov	w1, 100
	str	w5, [x2, -8]!
	blr	x4
.L4110:
	mov	x0, x19
	bl	ClearCurrSlice
	mov	w0, -1
	b	.L4060
.L4078:
	ldr	x1, .LC997
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w1, [x19, 14940]
	ldr	w2, [x20, 1904]
	cmp	w2, w1
	bcc	.L4080
	ldr	x0, .LC995
	ldr	x4, [x0]
	cbz	x4, .L4080
	ldr	w0, [x20, 1980]
	mov	w3, 8
	stp	w2, w1, [x29, 56]
	add	x2, x29, 56
	mov	w1, 108
	blr	x4
.L4080:
	ldr	x1, .LC999
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	H264_ClearCurrPic
	mov	w0, -1
	b	.L4060
.L4119:
	ldr	x1, .LC1005
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4060
.L4120:
	ldr	x1, .LC1007
	mov	w0, 1
	ldr	w2, [x22, 2708]
	bl	dprint_vfmw
	b	.L4110
.L4118:
	ldr	x1, .LC1003
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4060
.L4113:
	ldr	x2, .LC990
	mov	w3, 9029
	ldr	x1, .LC991
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4060
	.size	H264_DecSlice, .-H264_DecSlice
	.align	3
.LC990:
	.xword	.LC30
	.align	3
.LC991:
	.xword	.LC32
	.align	3
.LC992:
	.xword	.LC820
	.align	3
.LC993:
	.xword	s_pstVfmwChan
	.align	3
.LC994:
	.xword	.LC822
	.align	3
.LC995:
	.xword	g_event_report
	.align	3
.LC997:
	.xword	.LC996
	.align	3
.LC999:
	.xword	.LC998
	.align	3
.LC1001:
	.xword	.LC1000
	.align	3
.LC1003:
	.xword	.LC1002
	.align	3
.LC1005:
	.xword	.LC1004
	.align	3
.LC1007:
	.xword	.LC1006
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_DecOneNal
	.type	H264_DecOneNal, %function
H264_DecOneNal:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	w21, w1
	bl	_mcount
	cbz	x20, .L4259
	ldr	x3, [x20, 632]
	add	x19, x20, 65536
	ldr	w0, [x3, 76]
	cbz	w0, .L4129
	ldr	w2, [x19, 1964]
	mov	w0, 0
	.p2align 2
.L4128:
	ubfiz	x1, x0, 5, 32
	add	w0, w0, 1
	add	x1, x3, x1
	ldr	w1, [x1, 16]
	add	w2, w2, w1
	str	w2, [x19, 1964]
	ldr	w1, [x3, 76]
	cmp	w1, w0
	bhi	.L4128
.L4129:
	strb	wzr, [x3]
	ldr	x0, .LC1008
	ldrsw	x1, [x19, 1980]
	ldr	x0, [x0, x1, lsl 3]
	ldrsb	w1, [x0, 44]
	cmp	w1, 1
	beq	.L4274
.L4127:
	add	x23, x20, 12288
	mov	w1, 32
	add	x0, x23, 2600
	bl	BsGet
	mov	w22, w0
	ldr	x1, [x20, 632]
	ldr	w0, [x1, 72]
	add	w0, w0, 32
	str	w0, [x1, 72]
.L4130:
	ldr	x4, [x20, 632]
	and	w0, w22, 31
	ubfx	x2, x22, 5, 2
	ubfx	x3, x22, 7, 1
	ldr	x1, .LC1010
	strb	w0, [x4, 2]
	ldr	x0, [x20, 632]
	str	w2, [x0, 84]
	mov	w0, 22
	ldr	x2, [x20, 632]
	str	w3, [x2, 88]
	str	wzr, [x19, 1920]
	ldr	w2, [x19, 1924]
	ldr	x3, [x20, 632]
	ldrb	w3, [x3, 2]
	bl	dprint_vfmw
	ldr	w0, [x19, 1924]
	cmp	w0, 371
	beq	.L4275
	add	w0, w0, 1
	str	w0, [x19, 1924]
	ldr	x0, [x20, 632]
	ldrb	w2, [x0, 2]
	cmp	w2, 20
	beq	.L4276
.L4132:
	sub	w0, w2, #1
	cmp	w0, 29
	bls	.L4277
.L4137:
	ldr	x1, .LC1053
	mov	w3, w22
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x2, [x20, 632]
	mov	w0, 0
	ldr	x1, .LC1055
	ldrb	w2, [x2, 2]
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbz	x1, .L4163
	ldr	w0, [x19, 1980]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4163:
	ldr	x0, .LC1024
	ldr	x4, [x0]
	cbz	x4, .L4260
.L4264:
	ldr	w0, [x19, 1980]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L4260:
	mov	w0, 0
.L4124:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4277:
	ldr	x1, .LC1019
	ldrh	w0, [x1,w0,uxtw #1]
	adr	x1, .Lrtx4139
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx4139:
	.section	.rodata
	.align	0
	.align	2
.L4139:
	.2byte	(.L4138 - .Lrtx4139) / 4
	.2byte	(.L4137 - .Lrtx4139) / 4
	.2byte	(.L4137 - .Lrtx4139) / 4
	.2byte	(.L4137 - .Lrtx4139) / 4
	.2byte	(.L4138 - .Lrtx4139) / 4
	.2byte	(.L4140 - .Lrtx4139) / 4
	.2byte	(.L4141 - .Lrtx4139) / 4
	.2byte	(.L4142 - .Lrtx4139) / 4
	.2byte	(.L4143 - .Lrtx4139) / 4
	.2byte	(.L4144 - .Lrtx4139) / 4
	.2byte	(.L4145 - .Lrtx4139) / 4
	.2byte	(.L4146 - .Lrtx4139) / 4
	.2byte	(.L4147 - .Lrtx4139) / 4
	.2byte	(.L4137 - .Lrtx4139) / 4
	.2byte	(.L4141 - .Lrtx4139) / 4
	.2byte	(.L4137 - .Lrtx4139) / 4
	.2byte	(.L4137 - .Lrtx4139) / 4
	.2byte	(.L4137 - .Lrtx4139) / 4
	.2byte	(.L4148 - .Lrtx4139) / 4
	.2byte	(.L4138 - .Lrtx4139) / 4
	.2byte	(.L4137 - .Lrtx4139) / 4
	.2byte	(.L4137 - .Lrtx4139) / 4
	.2byte	(.L4137 - .Lrtx4139) / 4
	.2byte	(.L4137 - .Lrtx4139) / 4
	.2byte	(.L4137 - .Lrtx4139) / 4
	.2byte	(.L4137 - .Lrtx4139) / 4
	.2byte	(.L4137 - .Lrtx4139) / 4
	.2byte	(.L4137 - .Lrtx4139) / 4
	.2byte	(.L4137 - .Lrtx4139) / 4
	.2byte	(.L4149 - .Lrtx4139) / 4
	.text
	.p2align 3
.L4274:
	mov	x1, 1
	ldr	x2, [x0, 160]
	movk	x1, 0x2, lsl 32
	cmp	x2, x1
	bne	.L4127
	ldr	w0, [x0, 156]
	cmp	w0, 1
	ccmp	w21, wzr, 0, eq
	bne	.L4127
	add	x23, x20, 12288
	mov	w1, 40
	add	x22, x23, 2600
	mov	x0, x22
	bl	BsSkip
	mov	w1, 8
	mov	x0, x22
	bl	BsGet
	mov	w22, w0
	ldr	x1, [x20, 632]
	ldr	w0, [x1, 72]
	add	w0, w0, 48
	str	w0, [x1, 72]
	b	.L4130
.L4148:
	ldr	x1, .LC1049
	mov	w2, 19
	mov	w0, 22
	bl	dprint_vfmw
.L4269:
	ldr	x1, [x20, 632]
	cbz	x1, .L4260
.L4261:
	ldr	w0, [x19, 1980]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L4147:
	ldr	x1, .LC1047
	mov	w2, 13
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbnz	x1, .L4261
	b	.L4260
.L4146:
	ldr	x1, .LC1043
	mov	w2, 12
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbnz	x1, .L4261
	b	.L4260
.L4145:
	ldr	x1, .LC1045
	mov	w2, 11
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x20
	bl	H264_IsEosNal
	uxtb	w1, w0
	cmp	w1, 1
	bne	.L4269
	ldr	x21, .LC1024
	strb	w0, [x23, 2640]
	ldr	x4, [x21]
	cbz	x4, .L4159
	ldr	w0, [x19, 1980]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 117
	blr	x4
.L4159:
	mov	x0, x20
	str	wzr, [x20, 624]
	bl	DecVDM
	cbz	w0, .L4269
	ldr	x1, [x20, 632]
	cbz	x1, .L4271
	ldr	w0, [x19, 1980]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
	b	.L4271
.L4144:
	ldr	x1, .LC1041
	mov	w2, 10
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbnz	x1, .L4261
	b	.L4260
.L4143:
	ldr	x1, .LC1039
	mov	w2, 9
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbnz	x1, .L4261
	b	.L4260
.L4149:
	ldr	x1, .LC1051
	mov	w2, 30
	mov	w0, 22
	add	x23, x23, 2600
	bl	dprint_vfmw
	mov	w1, 32
	mov	x0, x23
	bl	BsGet
	mov	w24, w0
	mov	w1, 32
	mov	x0, x23
	bl	BsGet
	mov	w22, w0
	cbnz	w21, .L4161
	ldr	x1, [x20, 632]
	cbz	x1, .L4161
	ldr	w0, [x19, 1980]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4161:
	mov	w1, 20553
	mov	w0, 20036
	movk	w1, 0x4853, lsl 16
	movk	w0, 0x4345, lsl 16
	cmp	w24, w1
	ccmp	w22, w0, 0, eq
	bne	.L4260
	ldr	x21, .LC1024
	ldr	x4, [x21]
	cbz	x4, .L4162
	ldr	w0, [x19, 1980]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L4162:
	mov	x0, x20
	str	wzr, [x20, 624]
	bl	DecVDM
	cbz	w0, .L4260
.L4271:
	ldr	x4, [x21]
	cbz	x4, .L4259
.L4263:
	ldr	w0, [x19, 1980]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L4259:
	mov	w0, -1
.L4280:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L4142:
	ldr	x1, .LC1026
	mov	w2, 8
	ldr	w3, [x19, 1932]
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x20
	bl	H264_DecPPS
	mov	w21, w0
	ldr	x1, [x20, 632]
	cbz	x1, .L4152
	ldr	w0, [x19, 1980]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4152:
	cbnz	w21, .L4278
	ldr	w1, [x19, 1932]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 1932]
	b	.L4124
.L4140:
	ldr	x1, .LC1035
	mov	w2, 6
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x20
	bl	H264_DecSEI
	mov	w21, w0
	ldr	x1, [x20, 632]
	cbz	x1, .L4156
	ldr	w0, [x19, 1980]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4156:
	cbz	w21, .L4260
	ldr	x1, .LC1037
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC1024
	ldr	x4, [x0]
	cbnz	x4, .L4264
	b	.L4260
.L4138:
	ldr	x1, .LC1021
	mov	w0, 22
	ldr	w3, [x19, 1936]
	bl	dprint_vfmw
	ldr	x2, [x20, 632]
	add	x1, x20, 20480
	mov	x0, x20
	ldrb	w3, [x2, 2]
	strb	w3, [x1, 1587]
	ldr	w2, [x2, 84]
	str	w2, [x1, 1612]
	bl	SliceCheck
	cbnz	w0, .L4279
	mov	x0, x20
	bl	H264_DecSlice
	cmn	w0, #2
	beq	.L4124
	cbz	w0, .L4260
	ldr	x0, .LC1024
	ldr	x4, [x0]
	cbnz	x4, .L4263
	mov	w0, -1
	b	.L4280
	.p2align 3
.L4141:
	ldr	x1, .LC1031
	mov	w0, 22
	ldr	w3, [x19, 1928]
	bl	dprint_vfmw
	mov	x0, x20
	bl	H264_DecSPS
	mov	w21, w0
	ldr	x1, [x20, 632]
	cbz	x1, .L4154
	ldr	w0, [x19, 1980]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4154:
	cbnz	w21, .L4281
	ldr	w1, [x19, 1928]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 1928]
	b	.L4124
	.p2align 3
.L4275:
	ldr	x1, .LC1012
	mov	w0, 22
	bl	dprint_vfmw
	ldr	w0, [x19, 1924]
	add	w0, w0, 1
	str	w0, [x19, 1924]
	ldr	x0, [x20, 632]
	ldrb	w2, [x0, 2]
	cmp	w2, 20
	bne	.L4132
	.p2align 2
.L4276:
	mov	w1, 24
	add	x0, x23, 2600
	bl	BsGet
	mov	w22, w0
	ldr	x1, [x20, 632]
	ubfx	x2, x22, 23, 1
	add	x0, x20, 61440
	strb	w2, [x1, 3]
	ldr	x2, [x20, 632]
	ldrb	w1, [x2, 3]
	cbz	w1, .L4133
	ubfx	x1, x22, 16, 6
	strb	w1, [x0, 3561]
	ubfx	x1, x22, 12, 3
	ubfx	x3, x22, 22, 1
	strb	w1, [x0, 3563]
	ubfx	x1, x22, 5, 3
	ubfx	x4, x22, 15, 1
	strb	w3, [x0, 3560]
	strb	w1, [x0, 3565]
	ubfx	x3, x22, 8, 4
	ubfx	x1, x22, 3, 1
	strb	w4, [x0, 3562]
	strb	w3, [x0, 3564]
	ubfx	x4, x22, 4, 1
	ubfx	x3, x22, 2, 1
	strb	w1, [x0, 3567]
	strb	w4, [x0, 3566]
	and	w1, w22, 3
	strb	w3, [x0, 3568]
	strb	w1, [x0, 3569]
.L4133:
	mov	x1, 16711680
	ldr	x3, [x0, 3560]
	movk	x1, 0xff, lsl 32
	and	x1, x3, x1
	cmp	x1, 65536
	beq	.L4134
	ldrb	w3, [x0, 3562]
	ldrb	w2, [x0, 3564]
	mov	w0, 1
	ldr	x1, .LC1014
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbz	x1, .L4259
	ldr	w0, [x19, 1980]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
	mov	w0, -1
	b	.L4124
.L4134:
	ldrb	w1, [x0, 3560]
	cmp	w1, 1
	beq	.L4282
.L4136:
	ldrb	w4, [x0, 3565]
	ldrb	w3, [x0, 3563]
	ldrb	w2, [x0, 3564]
	mov	w0, 22
	ldr	x1, .LC1016
	bl	dprint_vfmw
	ldr	x1, .LC1018
	mov	w2, w22
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	ldr	w0, [x1, 72]
	add	w0, w0, 24
	str	w0, [x1, 72]
	ldr	x0, [x20, 632]
	ldrb	w2, [x0, 2]
	b	.L4132
.L4279:
	ldr	x1, .LC1023
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x20
	bl	ClearCurrSlice
	ldr	x0, .LC1024
	ldr	x4, [x0]
	cbnz	x4, .L4263
	mov	w0, -1
	b	.L4280
.L4278:
	ldr	x2, .LC1027
	mov	w0, 1
	ldr	x1, .LC1029
	add	x2, x2, 352
	bl	dprint_vfmw
	ldr	x21, .LC1024
	ldr	x4, [x21]
	cbz	x4, .L4259
.L4267:
	add	x2, x29, 80
	ldr	w0, [x19, 1980]
	mov	w20, -1
	mov	w3, 4
	mov	w1, 100
	str	w20, [x2, -8]!
	blr	x4
	ldr	x4, [x21]
	cbz	x4, .L4259
	ldr	w0, [x19, 1980]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	mov	w0, w20
	b	.L4124
.L4281:
	ldr	x1, .LC1033
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x21, .LC1024
	ldr	x4, [x21]
	cbnz	x4, .L4267
	mov	w0, -1
	b	.L4280
.L4282:
	mov	w1, 5
	strb	w1, [x2, 2]
	b	.L4136
	.size	H264_DecOneNal, .-H264_DecOneNal
	.align	3
.LC1008:
	.xword	s_pstVfmwChan
	.align	3
.LC1010:
	.xword	.LC1009
	.align	3
.LC1012:
	.xword	.LC1011
	.align	3
.LC1014:
	.xword	.LC1013
	.align	3
.LC1016:
	.xword	.LC1015
	.align	3
.LC1018:
	.xword	.LC1017
	.align	3
.LC1019:
	.xword	.L4139
	.align	3
.LC1021:
	.xword	.LC1020
	.align	3
.LC1023:
	.xword	.LC1022
	.align	3
.LC1024:
	.xword	g_event_report
	.align	3
.LC1026:
	.xword	.LC1025
	.align	3
.LC1027:
	.xword	.LANCHOR2
	.align	3
.LC1029:
	.xword	.LC1028
	.align	3
.LC1031:
	.xword	.LC1030
	.align	3
.LC1033:
	.xword	.LC1032
	.align	3
.LC1035:
	.xword	.LC1034
	.align	3
.LC1037:
	.xword	.LC1036
	.align	3
.LC1039:
	.xword	.LC1038
	.align	3
.LC1041:
	.xword	.LC1040
	.align	3
.LC1043:
	.xword	.LC1042
	.align	3
.LC1045:
	.xword	.LC1044
	.align	3
.LC1047:
	.xword	.LC1046
	.align	3
.LC1049:
	.xword	.LC1048
	.align	3
.LC1051:
	.xword	.LC1050
	.align	3
.LC1053:
	.xword	.LC1052
	.align	3
.LC1055:
	.xword	.LC1054
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_DecodePacket
	.type	H264DEC_DecodePacket, %function
H264DEC_DecodePacket:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	str	wzr, [x29, 84]
	stp	wzr, wzr, [x29, 76]
	cbz	x19, .L4343
	cbz	x21, .L4344
	ldr	x0, [x19]
	add	x20, x19, 65536
	ldr	w2, [x0, 8]
	ldr	w1, [x20, 648]
	ubfiz	w2, w2, 16, 3
	str	w2, [x20, 1968]
	cmp	w1, 1
	ldr	w1, [x0]
	str	w1, [x20, 1972]
	ldr	w1, [x0, 4]
	str	w1, [x20, 1976]
	str	wzr, [x20, 1920]
	beq	.L4287
	ldr	w1, [x0, 936]
	cmp	w1, 1
	beq	.L4345
.L4288:
	mov	x1, x21
	mov	x0, x19
	bl	ReceivePacket
	ldr	x1, [x19, 632]
	str	x1, [x20, 2048]
.L4290:
	str	wzr, [x20, 648]
	cbz	w0, .L4289
.L4311:
	mov	w21, 0
.L4341:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L4345:
	ldr	w0, [x0, 992]
	cmp	w0, 1
	bne	.L4288
	ldr	w0, [x20, 2040]
	cmp	w0, 1
	bne	.L4288
	ldr	x0, [x20, 2048]
	str	x0, [x19, 632]
	str	wzr, [x20, 648]
	str	wzr, [x20, 2040]
	.p2align 2
.L4289:
	mov	x0, x19
	bl	H264DEC_CheckSedOnly
	mov	w21, w0
	ldr	x1, [x19, 632]
	cbnz	w0, .L4346
	str	wzr, [x1, 72]
	add	x22, x19, 12288
	add	x22, x22, 2600
	ldr	x1, [x19, 632]
	mov	x0, x22
	ldr	w2, [x1, 16]
	ldr	x1, [x1, 8]
	bl	BsInit
	ldr	x0, .LC1058
	ldrsw	x1, [x20, 1980]
	ldr	x0, [x0, x1, lsl 3]
	ldrsb	w23, [x0, 44]
	cmp	w23, 1
	beq	.L4293
.L4295:
	mov	w23, 0
.L4294:
	mov	w1, 32
	mov	x0, x22
	bl	BsGet
	uxtb	w0, w0
	ldr	x3, [x19, 632]
	and	w2, w0, 31
	mov	w1, 27
	and	w1, w0, w1
	ubfx	x0, x0, 5, 2
	strb	w2, [x3, 2]
	cmp	w1, 1
	ccmp	w2, 20, 4, ne
	ldr	x1, [x19, 632]
	str	w0, [x1, 84]
	beq	.L4347
.L4296:
	mov	x0, x19
	bl	FindTrailZeros
	cbnz	w0, .L4348
	ldr	x1, [x19, 632]
	mov	x0, x22
	str	wzr, [x1, 72]
	ldr	x1, [x19, 632]
	ldr	w2, [x1, 16]
	ldr	x1, [x1, 8]
	bl	BsInit
	mov	w1, w23
	mov	x0, x19
	bl	H264_DecOneNal
	cmn	w0, #2
	beq	.L4316
	cbnz	w0, .L4349
	add	x0, x19, 61440
	str	wzr, [x0, 2764]
	ldr	w0, [x20, 1984]
	cmp	w0, 1
	bne	.L4311
	mov	x0, x19
	bl	H264DEC_SetDecParam
	b	.L4341
	.p2align 3
.L4287:
	ldr	x0, [x19, 632]
	cmp	x0, xzr
	csetm	w0, eq
	b	.L4290
	.p2align 3
.L4347:
	cmp	w2, 20
	beq	.L4350
.L4297:
	add	x2, x29, 92
	add	x1, x29, 88
	mov	x0, x19
	bl	InquireSliceProperty
	cbz	w0, .L4351
	ldr	x1, [x19, 632]
	cbz	x1, .L4308
	ldr	w0, [x20, 1980]
	bl	ReleaseNAL
	str	xzr, [x19, 632]
.L4308:
	ldr	x0, .LC1061
	ldr	x4, [x0]
	cbz	x4, .L4315
	ldr	w0, [x20, 1980]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	mov	w21, -1
	blr	x4
	b	.L4341
	.p2align 3
.L4351:
	ldr	w1, [x29, 88]
	ldr	w0, [x20, 2020]
	cmp	w1, 1
	csinc	w0, w0, w0, ne
	str	w0, [x20, 2020]
	beq	.L4352
.L4299:
	ldr	w0, [x29, 92]
	cmp	w0, 1
	bne	.L4296
	mov	x0, x19
	bl	FlushDPB
	cbnz	w0, .L4353
.L4306:
	ldr	w0, [x20, 1980]
	bl	FSP_GetFspType
	cbnz	w0, .L4296
	ldr	w0, [x20, 1980]
	add	x3, x29, 84
	add	x2, x29, 80
	add	x1, x29, 76
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x19]
	ldr	w0, [x0, 772]
	cmp	w0, 1
	bne	.L4296
	ldr	w0, [x29, 84]
	cmp	w0, wzr
	ble	.L4354
.L4303:
	mov	w0, 1
	mov	w21, -2
	str	w0, [x20, 648]
	b	.L4341
	.p2align 3
.L4293:
	ldp	w1, w2, [x0, 156]
	ldr	w3, [x0, 164]
	mov	x0, x19
	bl	H264_VES_Splitter
	cmp	w0, 3
	beq	.L4294
	cbz	w0, .L4295
.L4316:
	mov	w21, w0
	b	.L4341
	.p2align 3
.L4350:
	mov	x0, x19
	bl	InquireSliceExtProperty
	b	.L4297
.L4348:
	ldr	x1, .LC1063
	mov	w0, 22
	mov	w21, -1
	bl	dprint_vfmw
	b	.L4341
	.p2align 3
.L4346:
	cbz	x1, .L4292
	ldr	w0, [x20, 1980]
	bl	ReleaseNAL
	str	xzr, [x19, 632]
.L4292:
	mov	x0, x19
	mov	w21, -1
	bl	H264DEC_SetDecParam
	b	.L4341
	.p2align 3
.L4352:
	add	x24, x19, 20480
	ldrb	w0, [x24, 1585]
	cmp	w0, 1
	ldr	w0, [x20, 2024]
	beq	.L4355
	add	w0, w0, 2
	str	w0, [x20, 2024]
.L4301:
	ldr	w0, [x20, 1904]
	cbz	w0, .L4299
	ldr	x3, [x19, 632]
	mov	w2, 20
	ldr	x1, .LC1059
	mov	x0, x22
	add	x1, x1, 432
	str	wzr, [x3, 72]
	bl	BsInit
	mov	w1, 1
	mov	x0, x19
	bl	H264_DecOneNal
	ldrb	w0, [x24, 1585]
	cmp	w0, 1
	ldr	w0, [x20, 2024]
	beq	.L4356
	sub	w0, w0, #2
	str	w0, [x20, 2024]
	b	.L4303
	.p2align 3
.L4315:
	mov	w21, -1
	b	.L4341
.L4355:
	add	w0, w0, 1
	str	w0, [x20, 2024]
	b	.L4301
.L4353:
	ldr	x1, .LC1060
	mov	w3, w0
	mov	w2, 13120
	mov	w0, 0
	bl	dprint_vfmw
	b	.L4306
.L4343:
	ldr	x2, .LC1056
	mov	w3, 12999
	ldr	x1, .LC1057
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L4341
.L4344:
	ldr	x2, .LC1056
	mov	w3, 13000
	ldr	x1, .LC1057
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L4341
.L4349:
	ldr	x1, .LC1065
	mov	w0, 22
	mov	w21, -1
	bl	dprint_vfmw
	b	.L4341
.L4356:
	sub	w0, w0, #1
	str	w0, [x20, 2024]
	b	.L4303
.L4354:
	ldr	w0, [x29, 80]
	cmp	w0, 32
	bgt	.L4303
	ldr	x0, [x19, 616]
	cbnz	x0, .L4303
	ldr	w0, [x20, 1944]
	cbz	w0, .L4296
	ldr	w0, [x19, 14932]
	cbz	w0, .L4296
	ldr	w1, [x19, 14936]
	ldr	w2, [x20, 2056]
	cmp	w1, w2
	beq	.L4296
	ldr	w2, [x20, 2060]
	cmp	w0, w2
	beq	.L4296
	ldr	x2, .LC1061
	str	w1, [x20, 2056]
	str	w0, [x20, 2060]
	ldr	x4, [x2]
	cbz	x4, .L4296
	ldr	w0, [x20, 1980]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 120
	blr	x4
	b	.L4296
	.size	H264DEC_DecodePacket, .-H264DEC_DecodePacket
	.align	3
.LC1056:
	.xword	.LC30
	.align	3
.LC1057:
	.xword	.LC32
	.align	3
.LC1058:
	.xword	s_pstVfmwChan
	.align	3
.LC1059:
	.xword	.LANCHOR1
	.align	3
.LC1060:
	.xword	.LC871
	.align	3
.LC1061:
	.xword	g_event_report
	.align	3
.LC1063:
	.xword	.LC1062
	.align	3
.LC1065:
	.xword	.LC1064
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_GetRemainImg
	.type	H264DEC_GetRemainImg, %function
H264DEC_GetRemainImg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	cbz	x21, .L4358
	add	x20, x21, 24576
	mov	w19, 0
	ldr	w0, [x20, 3708]
	cbnz	w0, .L4377
	b	.L4360
	.p2align 3
.L4362:
	ldr	w0, [x20, 3708]
	cmp	w0, w19
	bls	.L4360
.L4377:
	add	x0, x21, x19, uxtw 3
	add	w19, w19, 1
	ldr	x1, [x0, 27896]
	ldrb	w0, [x1, 2]
	cbz	w0, .L4362
	mov	x0, x21
	bl	UnMarkFrameStoreRef
	ldr	w0, [x20, 3708]
	cmp	w0, w19
	bhi	.L4377
	.p2align 2
.L4360:
	mov	x0, x21
	bl	RemoveUnUsedFrameStore
	cbnz	w0, .L4360
	mov	w23, -1
	.p2align 2
.L4365:
	ldr	w5, [x20, 3708]
	cbz	w5, .L4383
.L4371:
	ldr	w0, [x20, 3704]
	cmp	w5, w0
	bls	.L4366
	str	w0, [x20, 3708]
	cbz	w0, .L4372
	mov	w5, w0
.L4366:
	add	x1, x20, 3320
	mov	w4, 2147483647
	mov	w0, 0
	mov	w19, 0
	.p2align 2
.L4369:
	ldr	x3, [x1]
	add	x1, x1, 8
	ldr	w2, [x3, 672]
	cmp	w2, w4
	bge	.L4368
	ldrb	w3, [x3, 4]
	cmp	w3, wzr
	csel	w4, w4, w2, eq
	csel	w19, w19, w0, eq
.L4368:
	add	w0, w0, 1
	cmp	w5, w0
	bhi	.L4369
.L4367:
	add	x22, x21, x19, uxtw 3
	mov	x0, x21
	ldr	x1, [x22, 27896]
	strb	wzr, [x1, 4]
	ldr	w2, [x20, 3708]
	ldr	x1, [x22, 27896]
	bl	OutputFrmToVO
	mov	w23, w0
	ldr	x0, [x22, 27896]
	ldrb	w0, [x0, 2]
	cbnz	w0, .L4365
	mov	w1, w19
	mov	x0, x21
	bl	RemoveFrameStoreOutDPB
	ldr	w5, [x20, 3708]
	cbnz	w5, .L4371
.L4383:
	mov	w0, 0
	cbz	w23, .L4361
	add	x0, x21, 8
	bl	GetVoLastImageID
.L4361:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L4372:
	mov	w19, 0
	b	.L4367
.L4358:
	ldr	x2, .LC1066
	mov	w3, 3235
	ldr	x1, .LC1067
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4361
	.size	H264DEC_GetRemainImg, .-H264DEC_GetRemainImg
	.align	3
.LC1066:
	.xword	.LC30
	.align	3
.LC1067:
	.xword	.LC32
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_VDMPostProc
	.type	H264DEC_VDMPostProc, %function
H264DEC_VDMPostProc:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	mov	w26, w1
	mov	x21, x3
	mov	w25, w4
	mov	w24, w5
	bl	_mcount
	cbz	x19, .L4424
	add	x20, x19, 61440
	ldr	x0, [x20, 2680]
	cbz	x0, .L4425
	ldr	x2, [x19, 616]
	cbz	x2, .L4426
	ldr	x3, [x19]
	add	x23, x19, 65536
	ldrb	w1, [x2, 17]
	ldr	w27, [x3, 684]
	strb	w1, [x0, 5]
	ldrb	w1, [x2, 4]
	str	w1, [x0, 8]
	ldr	w0, [x23, 2008]
	ldr	x1, [x19]
	cmp	w0, 1
	bls	.L4427
	ldr	w0, [x1, 8]
	cmp	w0, 2
	beq	.L4391
	ldr	w0, [x20, 2736]
	lsl	w0, w0, 4
	cmp	w0, 1920
	bhi	.L4428
.L4391:
	ldr	w0, [x1, 680]
	str	w0, [x23, 1984]
.L4390:
	ldr	w22, [x19, 624]
	str	w26, [x20, 2732]
	cbnz	w22, .L4392
.L4433:
	cbz	w25, .L4393
	ldr	x0, .LC1075
	sbfiz	x24, x24, 6, 32
	add	x24, x0, x24
	ldr	w0, [x24, 44]
	cmp	w0, 3
	beq	.L4429
	cmp	w0, 1
	beq	.L4430
.L4395:
	ldrb	w0, [x23, 705]
	cbz	w0, .L4431
.L4396:
	cmp	w27, 1
	beq	.L4432
.L4397:
	mov	x1, x21
	mov	x0, x19
	bl	StorePicInDPB
	cmp	w0, 1
	mov	w21, w0
	bls	.L4407
	ldr	x1, [x20, 2680]
	mov	w2, 1
	ldr	w0, [x23, 1980]
	mov	w22, -1
	ldr	w1, [x1, 656]
	bl	FSP_ClearLogicFs
	ldr	x1, .LC1074
	mov	w2, w21
.L4423:
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	H264_ClearCurrPic
	mov	x0, x19
	bl	ClearDPB
	str	xzr, [x20, 2680]
.L4422:
	mov	w0, w22
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L4426:
	ldr	x2, .LC1070
	mov	w0, 1
	ldr	x1, .LC1072
	mov	w22, -1
	add	x2, x2, 368
	bl	dprint_vfmw
	ldr	x1, .LC1074
	mov	w2, w22
	b	.L4423
	.p2align 3
.L4427:
	ldr	w1, [x1, 680]
	add	w0, w0, 1
	str	w1, [x23, 1984]
	str	w0, [x23, 2008]
	ldr	w22, [x19, 624]
	str	w26, [x20, 2732]
	cbz	w22, .L4433
.L4392:
	mov	x0, x19
	bl	ClearAllSlice
	mov	x1, x21
	mov	x0, x19
	bl	StorePicInDPB
	cbnz	w0, .L4434
.L4408:
	mov	x0, x19
	bl	FlushDPB
	cbnz	w0, .L4435
.L4409:
	add	x0, x19, 20480
	str	wzr, [x23, 644]
	mov	w4, 32
	mov	w7, 23352
	ldr	w8, [x19, 14948]
	movk	w7, 0x1, lsl 16
	strb	w4, [x0, 3226]
	add	x4, x0, 3072
	strb	wzr, [x0, 3224]
	mov	w6, 2
	str	w8, [x0, 3232]
	mov	w5, 7
	strb	w6, [x0, 3225]
	mov	w3, 3
	str	w5, [x0, 3236]
	mov	w2, -1
	str	w7, [x0, 3240]
	mov	w1, 262144
	stp	w3, w2, [x4, 176]
	stp	wzr, wzr, [x4, 184]
	str	w1, [x0, 3264]
	mov	w22, 0
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L4428:
	str	wzr, [x23, 1984]
	b	.L4390
	.p2align 3
.L4431:
	ldr	x2, [x20, 2680]
	mov	w0, 1
	ldr	x1, .LC1077
	str	wzr, [x2, 228]
	ldr	x2, [x20, 2680]
	str	xzr, [x2, 536]
	bl	dprint_vfmw
	b	.L4396
	.p2align 3
.L4424:
	ldr	x2, .LC1068
	mov	w3, 13269
	ldr	x1, .LC1069
	mov	w0, 0
	mov	w22, -1
	bl	dprint_vfmw
	ldr	x27, [sp, 80]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L4393:
	mov	x0, x19
	bl	ClearAllSlice
	cmp	w27, 1
	bne	.L4397
.L4432:
	ldr	x26, [x19, 616]
	ldr	w0, [x26, 316]
	add	x0, x26, x0, lsl 2
	ldr	w27, [x0, 584]
	mov	w0, w27
	bl	MEM_Phy2Vir
	mov	x25, x0
	ldr	w1, [x26, 36]
	ldr	w7, [x26, 44]
	ldr	x2, .LC1078
	mul	w24, w7, w1
	ldr	x3, [x2, 280]
	mov	w1, w27
	lsl	w2, w24, 2
	blr	x3
	cbz	w24, .L4410
	mov	w7, 0
	mov	w6, 0
	mov	w4, 2147483647
	mov	w5, 0
	mov	w2, 0
	.p2align 2
.L4404:
	ubfiz	x0, x2, 2, 30
	ldr	w1, [x25, x0]
	and	w3, w1, 16383
	and	w8, w1, 8191
	neg	w3, w3
	tbz	x1, 13, .L4400
	and	w8, w3, 8191
.L4400:
	asr	w1, w1, 14
	and	w3, w1, 4095
	and	w0, w1, 2047
	neg	w3, w3
	tbz	x1, 11, .L4402
	and	w0, w3, 2047
.L4402:
	add	w0, w8, w0
	add	w2, w2, 1
	cmp	w4, w0
	add	w7, w7, w0
	csel	w4, w4, w0, le
	cmp	w5, w0
	csel	w5, w5, w0, ge
	cmp	w0, wzr
	csinc	w6, w6, w6, ne
	cmp	w24, w2
	bne	.L4404
	lsl	w0, w6, 2
	sub	w0, w0, w6
	lsl	w1, w0, 5
	add	w0, w0, w1
	add	w6, w0, w6
.L4398:
	udiv	w6, w6, w24
	ldr	x1, [x20, 2680]
	cmp	w6, 100
	csel	w4, w4, wzr, ne
	udiv	w7, w7, w24
	cbz	x1, .L4406
	ldr	w0, [x1, 260]
	cmp	w0, w5
	csel	w5, w0, w5, cs
	str	w5, [x1, 260]
	ldr	x1, [x20, 2680]
	ldr	w0, [x1, 264]
	cmp	w0, w4
	csel	w4, w0, w4, cs
	str	w4, [x1, 264]
	ldr	x0, [x20, 2680]
	str	w7, [x0, 268]
	ldr	x0, [x20, 2680]
	str	w6, [x0, 272]
	ldr	x0, [x20, 2680]
	ldr	w1, [x0, 260]
	str	w1, [x20, 2284]
	ldr	w1, [x0, 264]
	str	w1, [x20, 2288]
	str	w7, [x20, 2292]
	ldr	w0, [x0, 272]
	str	w0, [x20, 2296]
	b	.L4397
	.p2align 3
.L4407:
	mov	w0, 1
	str	w0, [x23, 644]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L4425:
	ldr	x2, .LC1068
	mov	w3, 13270
	ldr	x1, .LC1069
	mov	w22, -1
	bl	dprint_vfmw
	ldr	x27, [sp, 80]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L4434:
	ldr	x1, .LC1082
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	b	.L4408
	.p2align 3
.L4435:
	ldr	x1, .LC1084
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	b	.L4409
	.p2align 3
.L4430:
	mov	x0, x19
	bl	ClearAllSlice
	b	.L4395
	.p2align 3
.L4429:
	mov	x0, x19
	bl	ClearAllSlice
	b	.L4422
	.p2align 3
.L4406:
	ldr	x1, .LC1080
	mov	w0, 0
	mov	w22, -1
	bl	dprint_vfmw
	b	.L4422
.L4410:
	mov	w6, 0
	mov	w7, 0
	mov	w4, 2147483647
	mov	w5, 0
	b	.L4398
	.size	H264DEC_VDMPostProc, .-H264DEC_VDMPostProc
	.align	3
.LC1068:
	.xword	.LC30
	.align	3
.LC1069:
	.xword	.LC32
	.align	3
.LC1070:
	.xword	.LANCHOR2
	.align	3
.LC1072:
	.xword	.LC1071
	.align	3
.LC1074:
	.xword	.LC1073
	.align	3
.LC1075:
	.xword	g_VdmDrvParam
	.align	3
.LC1077:
	.xword	.LC1076
	.align	3
.LC1078:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1080:
	.xword	.LC1079
	.align	3
.LC1082:
	.xword	.LC1081
	.align	3
.LC1084:
	.xword	.LC1083
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_VDMProcSedOnly
	.type	H264DEC_VDMProcSedOnly, %function
H264DEC_VDMProcSedOnly:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x21, .L4449
	sxtw	x1, w20
	ldr	x3, [x21, 616]
	lsl	x0, x1, 2
	add	x22, x21, 65536
	sub	x1, x0, x1
	ldr	x20, .LC1088
	lsl	x2, x1, 4
	ldr	w0, [x3, 44]
	sub	x1, x2, x1
	ldr	w19, [x3, 36]
	ldr	x2, .LC1087
	add	x20, x20, x1, lsl 2
	ldrsw	x3, [x22, 1980]
	mul	w19, w0, w19
	ldr	x1, .LC1090
	mov	w0, 22
	ldr	x23, [x2, x3, lsl 3]
	sub	w19, w19, #1
	ldr	w3, [x20, 20]
	mov	w2, w19
	bl	dprint_vfmw
	ldr	w0, [x20, 20]
	cmp	w19, w0
	ldr	w0, [x22, 1992]
	beq	.L4450
	cmp	w0, 1
	beq	.L4451
.L4442:
	mov	w1, 0
	str	xzr, [x21, 616]
.L4438:
	mov	w0, w1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L4449:
	ldr	x2, .LC1085
	mov	w3, 13466
	ldr	x1, .LC1086
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w1, -1
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L4450:
	cmp	w0, 1
	beq	.L4440
	mov	x0, x21
	bl	DecVDM
	mov	w1, 0
	cbz	w0, .L4438
	b	.L4442
	.p2align 3
.L4451:
	ldr	w0, [x22, 1904]
	str	wzr, [x22, 1996]
	sub	w0, w0, #1
	str	w0, [x22, 1904]
	ldr	x1, [x21, 632]
	cbz	x1, .L4442
	ldr	w0, [x22, 1980]
	bl	ReleaseNAL
	str	xzr, [x21, 632]
	b	.L4442
	.p2align 3
.L4440:
	ldr	w2, [x22, 1904]
	mov	w1, 0
	str	w0, [x22, 1996]
	sub	w2, w2, #1
	str	w2, [x22, 1904]
	strb	w0, [x23, 825]
	str	w0, [x22, 648]
	str	xzr, [x21, 616]
	b	.L4438
	.size	H264DEC_VDMProcSedOnly, .-H264DEC_VDMProcSedOnly
	.align	3
.LC1085:
	.xword	.LC30
	.align	3
.LC1086:
	.xword	.LC32
	.align	3
.LC1087:
	.xword	s_pstVfmwChan
	.align	3
.LC1088:
	.xword	g_BackUp
	.align	3
.LC1090:
	.xword	.LC1089
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_GetImageBuffer
	.type	H264DEC_GetImageBuffer, %function
H264DEC_GetImageBuffer:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	cbz	x21, .L4494
	add	x19, x21, 65536
	ldr	w0, [x19, 636]
	cbz	w0, .L4456
	add	x1, x21, 61440
	ldrb	w1, [x1, 2024]
	cmp	w1, 1
	beq	.L4456
	sub	w0, w0, #1
	mov	w4, 856
	mov	x2, 30080
	add	x1, x21, 28672
	add	x1, x1, 552
	umaddl	x4, w0, w4, x2
	add	x4, x21, x4
	.p2align 2
.L4462:
	ldrb	w0, [x1, 1]
	cbnz	w0, .L4457
	cbz	x1, .L4458
	add	x23, x21, 24576
	ldr	w3, [x23, 3708]
	cbz	w3, .L4458
	ldr	x0, [x21, 27896]
	cmp	x0, x1
	beq	.L4457
	sub	w3, w3, #1
	mov	x0, x21
	add	x3, x21, x3, lsl 3
	b	.L4459
	.p2align 3
.L4460:
	ldr	x2, [x0, 27896]
	cmp	x2, x1
	beq	.L4457
.L4459:
	cmp	x3, x0
	add	x0, x0, 8
	bne	.L4460
.L4458:
	ldr	w0, [x19, 1980]
	bl	FSP_IsNewFsAvalible
	cmp	w0, 1
	beq	.L4456
	cmn	w0, #1
	beq	.L4495
.L4492:
	mov	w0, 0
.L4497:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4456:
	mov	w0, 1
.L4490:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4457:
	add	x1, x1, 856
	cmp	x1, x4
	bne	.L4462
	add	x2, x29, 76
	add	x1, x29, 72
	add	x0, x21, 8
	bl	GetQueueImgNum
	ldr	x1, .LC1094
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x1, .LC1096
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x19, 636]
	cbz	w0, .L4496
	ldr	x20, .LC1100
	mov	w22, 0
	add	x23, x21, 24576
	.p2align 2
.L4469:
	uxtw	x1, w22
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x1, x0, x1
	lsl	x1, x1, 3
	add	x0, x21, x1
	add	x1, x1, 28672
	add	x0, x0, 28672
	add	x1, x21, x1
	adds	x1, x1, 552
	ldrb	w3, [x0, 553]
	ldrb	w4, [x0, 556]
	beq	.L4473
	ldr	w5, [x23, 3708]
	cbz	w5, .L4473
	ldr	x0, [x21, 27896]
	cmp	x1, x0
	beq	.L4475
	sub	w5, w5, #1
	mov	x0, x21
	add	x5, x21, x5, lsl 3
	b	.L4467
	.p2align 3
.L4468:
	ldr	x2, [x0, 27896]
	cmp	x1, x2
	beq	.L4475
.L4467:
	cmp	x5, x0
	add	x0, x0, 8
	bne	.L4468
.L4473:
	mov	w5, 1
.L4466:
	mov	w2, w22
	mov	x1, x20
	mov	w0, 0
	add	w22, w22, 1
	bl	dprint_vfmw
	ldr	w0, [x19, 636]
	cmp	w0, w22
	bhi	.L4469
.L4470:
	ldp	w2, w3, [x29, 72]
	ldr	x1, .LC1098
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x19, 636]
	ldr	w2, [x23, 3708]
	ldp	w3, w1, [x29, 72]
	sub	w0, w0, #2
	sub	w0, w0, w2
	add	w1, w3, w1
	cmp	w1, w0
	bge	.L4492
	ldr	x1, .LC1102
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, 1
	mov	x0, x21
	bl	ClearAll
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, 0
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4475:
	mov	w5, 0
	b	.L4466
.L4495:
	ldr	w0, [x19, 1980]
	add	x1, x21, 8
	bl	FSP_ClearNotInVoQueue
	mov	w0, 0
	b	.L4497
.L4496:
	add	x23, x21, 24576
	b	.L4470
.L4494:
	ldr	x2, .LC1091
	mov	w3, 13512
	ldr	x1, .LC1092
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4490
	.size	H264DEC_GetImageBuffer, .-H264DEC_GetImageBuffer
	.align	3
.LC1091:
	.xword	.LC30
	.align	3
.LC1092:
	.xword	.LC32
	.align	3
.LC1094:
	.xword	.LC1093
	.align	3
.LC1096:
	.xword	.LC1095
	.align	3
.LC1098:
	.xword	.LC1097
	.align	3
.LC1100:
	.xword	.LC1099
	.align	3
.LC1102:
	.xword	.LC1101
	.global	TmpBuf
	.global	g_CabacMN
	.global	quant8_org
	.global	quant_org
	.global	quant8_inter_default
	.global	quant8_intra_default
	.global	quant_inter_default
	.global	quant_intra_default
	.global	g_ZZ_SCAN8
	.global	g_ZZ_SCAN
	.global	CalcZeroNum
	.global	g_AspecRatioIdc
	.global	g_NalTypeEOPIC
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.11111, %object
	.size	__func__.11111, 23
__func__.11111:
	.string	"RemoveFrameStoreOutDPB"
	.align	3
.LANCHOR2 = . + 0
	.type	g_ZZ_SCAN, %object
	.size	g_ZZ_SCAN, 16
g_ZZ_SCAN:
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
	.type	g_ZZ_SCAN8, %object
	.size	g_ZZ_SCAN8, 64
g_ZZ_SCAN8:
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
	.type	__func__.12350, %object
	.size	__func__.12350, 13
__func__.12350:
	.string	"Scaling_List"
	.zero	3
	.type	__func__.12393, %object
	.size	__func__.12393, 12
__func__.12393:
	.string	"H264_DecPPS"
	.zero	4
	.type	SarTable.12440, %object
	.size	SarTable.12440, 136
SarTable.12440:
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
	.type	__func__.12603, %object
	.size	__func__.12603, 12
__func__.12603:
	.string	"H264_DecSEI"
	.zero	4
	.type	__func__.11408, %object
	.size	__func__.11408, 8
__func__.11408:
	.string	"InitDPB"
	.type	__FUNCTION__.12756, %object
	.size	__FUNCTION__.12756, 13
__FUNCTION__.12756:
	.string	"H264DEC_Init"
	.zero	3
	.type	__func__.12787, %object
	.size	__func__.12787, 18
__func__.12787:
	.string	"H264_VES_Splitter"
	.zero	6
	.type	__func__.11491, %object
	.size	__func__.11491, 13
__func__.11491:
	.string	"DirectOutput"
	.zero	3
	.type	__func__.11602, %object
	.size	__func__.11602, 14
__func__.11602:
	.string	"StorePicInDPB"
	.zero	2
	.type	__FUNCTION__.12070, %object
	.size	__FUNCTION__.12070, 8
__FUNCTION__.12070:
	.string	"InitPic"
	.type	__func__.12671, %object
	.size	__func__.12671, 15
__func__.12671:
	.string	"H264_DecOneNal"
	.zero	1
	.type	__func__.12898, %object
	.size	__func__.12898, 26
__func__.12898:
	.string	"H264DEC_GetCurImageFormat"
	.data
	.align	3
.LANCHOR1 = . + 0
	.type	quant_org, %object
	.size	quant_org, 16
quant_org:
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.type	quant8_org, %object
	.size	quant8_org, 64
quant8_org:
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
	.type	quant_intra_default, %object
	.size	quant_intra_default, 16
quant_intra_default:
	.word	471076102
	.word	538711053
	.word	622861332
	.word	707076124
	.type	quant_inter_default, %object
	.size	quant_inter_default, 16
quant_inter_default:
	.word	403967498
	.word	454562830
	.word	505092116
	.word	572398360
	.type	quant8_intra_default, %object
	.size	quant8_intra_default, 64
quant8_intra_default:
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
	.type	quant8_inter_default, %object
	.size	quant8_inter_default, 256
quant8_inter_default:
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
	.type	g_NalTypeEOPIC, %object
	.size	g_NalTypeEOPIC, 20
g_NalTypeEOPIC:
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
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.zero	4
	.type	g_CabacMN, %object
	.size	g_CabacMN, 5120
g_CabacMN:
	.word	388044546
	.word	352326208
	.word	153820416
	.word	721207
	.word	4522025
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	521477919
	.word	422707200
	.word	0
	.word	0
	.word	87683918
	.word	-180289218
	.word	17367089
	.word	-613020375
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	21230414
	.word	-180289218
	.word	440602714
	.word	157864575
	.word	-328728576
	.word	0
	.word	0
	.word	0
	.word	204602441
	.word	288553558
	.word	-278922691
	.word	154007875
	.word	-78971830
	.word	-78579384
	.word	20578304
	.word	0
	.word	-45745583
	.word	-178256329
	.word	121895766
	.word	39321658
	.word	-45287842
	.word	87426117
	.word	-45023144
	.word	0
	.word	370745856
	.word	268442146
	.word	320219136
	.word	721207
	.word	4522025
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	521477919
	.word	422707200
	.word	0
	.word	0
	.word	37878343
	.word	-212925132
	.word	-32963543
	.word	-478802647
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	-62064057
	.word	-212925132
	.word	956442916
	.word	440783743
	.word	-245039104
	.word	0
	.word	0
	.word	0
	.word	154336582
	.word	171312709
	.word	-212205516
	.word	137101122
	.word	-11730618
	.word	-27854008
	.word	3997696
	.word	0
	.word	-28968110
	.word	-161480133
	.word	38534487
	.word	-43777736
	.word	-45417899
	.word	3931473
	.word	-111740065
	.word	0
	.word	487594240
	.word	234886184
	.word	336207104
	.word	721207
	.word	4522025
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	521477919
	.word	422707200
	.word	0
	.word	0
	.word	437320789
	.word	-395967175
	.word	-164364994
	.word	-446493399
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	-28640171
	.word	-395967175
	.word	905979178
	.word	207741055
	.word	-361431040
	.word	0
	.word	0
	.word	0
	.word	104460105
	.word	238680669
	.word	-229049812
	.word	70714167
	.word	-61866421
	.word	-194905806
	.word	20709376
	.word	0
	.word	-178654873
	.word	-344714439
	.word	339346516
	.word	106955071
	.word	-78253206
	.word	88016459
	.word	-44368027
	.word	0
	.word	388044546
	.word	352326208
	.word	153820416
	.word	3013710
	.word	-44040151
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	203950899
	.word	238747648
	.word	0
	.word	0
	.word	87683918
	.word	-180289218
	.word	17367089
	.word	-613020375
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	21230414
	.word	-180289218
	.word	440602714
	.word	157864575
	.word	-328728576
	.word	0
	.word	0
	.word	0
	.word	204602441
	.word	288553558
	.word	-278922691
	.word	154007875
	.word	-78971830
	.word	-78579384
	.word	20578304
	.word	0
	.word	-45745583
	.word	-178256329
	.word	121895766
	.word	39321658
	.word	-45287842
	.word	87426117
	.word	-45023144
	.word	0
	.word	370745856
	.word	268442146
	.word	320219136
	.word	219088691
	.word	38797353
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	421532977
	.word	355860480
	.word	0
	.word	0
	.word	37878343
	.word	-212925132
	.word	-32963543
	.word	-478802647
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	-62064057
	.word	-212925132
	.word	956442916
	.word	440783743
	.word	-245039104
	.word	0
	.word	0
	.word	0
	.word	154336582
	.word	171312709
	.word	-212205516
	.word	137101122
	.word	-11730618
	.word	-27854008
	.word	3997696
	.word	0
	.word	-28968110
	.word	-161480133
	.word	38534487
	.word	-43777736
	.word	-45417899
	.word	3931473
	.word	-111740065
	.word	0
	.word	487594240
	.word	234886184
	.word	336207104
	.word	119732056
	.word	-327221207
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	354489138
	.word	289210368
	.word	0
	.word	0
	.word	437320789
	.word	-395967175
	.word	-164364994
	.word	-446493399
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	-28640171
	.word	-395967175
	.word	905979178
	.word	207741055
	.word	-361431040
	.word	0
	.word	0
	.word	0
	.word	104460105
	.word	238680669
	.word	-229049812
	.word	70714167
	.word	-61866421
	.word	-194905806
	.word	20709376
	.word	0
	.word	-178654873
	.word	-344714439
	.word	339346516
	.word	106955071
	.word	-78253206
	.word	88016459
	.word	-44368027
	.word	0
	.word	-276827290
	.word	5437770
	.word	-345250433
	.word	-511711105
	.word	-295705217
	.word	-344792449
	.word	0
	.word	0
	.word	-277089165
	.word	-260377229
	.word	-45614550
	.word	-80544458
	.word	-29491142
	.word	20971080
	.word	-11864229
	.word	0
	.word	-111282857
	.word	-45221049
	.word	-62915516
	.word	-195757762
	.word	-113178563
	.word	87621186
	.word	20971581
	.word	-28442624
	.word	402657033
	.word	135859474
	.word	252251411
	.word	170200082
	.word	102568993
	.word	253625389
	.word	20578366
	.word	121438208
	.word	-94504364
	.word	-129040318
	.word	-12124098
	.word	-29557189
	.word	-78906050
	.word	-63244478
	.word	-11599801
	.word	54788096
	.word	252053011
	.word	118492174
	.word	302845195
	.word	219090704
	.word	202837271
	.word	252972570
	.word	237769000
	.word	288292864
	.word	-197132732
	.word	-246090904
	.word	-79430885
	.word	-47710676
	.word	3076160
	.word	-129698226
	.word	-95553962
	.word	0
	.word	20055860
	.word	170065964
	.word	187040045
	.word	3015980
	.word	521208115
	.word	120724499
	.word	270601790
	.word	0
	.word	203819821
	.word	254217002
	.word	220991533
	.word	204016177
	.word	505549354
	.word	171381043
	.word	288227417
	.word	0
	.word	170719550
	.word	254021160
	.word	270208029
	.word	19665956
	.word	304088362
	.word	19925566
	.word	288229696
	.word	0
	.word	403772693
	.word	420880155
	.word	371004195
	.word	238160441
	.word	121634381
	.word	-61670050
	.word	155579501
	.word	0
	.word	-45680547
	.word	-161815937
	.word	-195235529
	.word	-163775938
	.word	-62786487
	.word	-129173168
	.word	-145166482
	.word	0
	.word	-210964124
	.word	-211422373
	.word	-195103144
	.word	-262867370
	.word	-111938729
	.word	-312606394
	.word	4782922
	.word	305856512
	.word	451745519
	.word	451878631
	.word	485237225
	.word	635773417
	.word	686040815
	.word	569714929
	.word	704259585
	.word	688979968
	.word	-194448031
	.word	-262080168
	.word	-128583339
	.word	-145362088
	.word	71499085
	.word	-45286836
	.word	171638604
	.word	-11337728
	.word	618472670
	.word	551953890
	.word	752886510
	.word	586230001
	.word	569975803
	.word	553657858
	.word	554506019
	.word	221904896
	.word	-11863455
	.word	-111416193
	.word	-178131884
	.word	-179307959
	.word	-62196906
	.word	-211749535
	.word	-311099392
	.word	0
	.word	-127471260
	.word	6225920
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	519707395
	.word	437649408
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-110890401
	.word	39780352
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	503126528
	.word	371064832
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-63374510
	.word	-112399747
	.word	-129041631
	.word	-63898059
	.word	-46206137
	.word	-162532266
	.word	-212143519
	.word	0
	.word	-62193080
	.word	-179569337
	.word	254735173
	.word	4063297
	.word	354808136
	.word	154734646
	.word	4066376
	.word	0
	.word	636494844
	.word	653797117
	.word	620963333
	.word	704652048
	.word	655756848
	.word	455415100
	.word	205783649
	.word	0
	.word	5045066
	.word	4650315
	.word	21233729
	.word	-230096066
	.word	71237444
	.word	-213185737
	.word	88083526
	.word	0
	.word	536421361
	.word	587014659
	.word	620700165
	.word	537600773
	.word	571221771
	.word	505225754
	.word	489100098
	.word	0
	.word	0
	.word	0
	.word	-45351145
	.word	19005739
	.word	3604023
	.word	3998016
	.word	4519772
	.word	0
	.word	-277287824
	.word	-294455979
	.word	-245566887
	.word	-431492783
	.word	-229638076
	.word	-230234056
	.word	-381360078
	.word	-179699712
	.word	401808115
	.word	686895602
	.word	738405638
	.word	740434230
	.word	324141056
	.word	0
	.word	0
	.word	0
	.word	-227871903
	.word	-245697446
	.word	-296159671
	.word	-145755562
	.word	-162924986
	.word	-163185854
	.word	-146736326
	.word	37421056
	.word	368449781
	.word	486022399
	.word	486743305
	.word	588520740
	.word	239271936
	.word	0
	.word	0
	.word	0
	.word	-444668830
	.word	-412751549
	.word	-464327586
	.word	-262935954
	.word	-346296730
	.word	-211950721
	.word	0
	.word	0
	.word	-111346855
	.word	-111086740
	.word	-95617492
	.word	2949172
	.word	-46072261
	.word	-62456757
	.word	-128782490
	.word	0
	.word	-27919794
	.word	-11798195
	.word	37094706
	.word	-45874894
	.word	103480401
	.word	20970566
	.word	4391481
	.word	-28573696
	.word	186384936
	.word	53215281
	.word	3015212
	.word	36896815
	.word	69665342
	.word	103678006
	.word	53871162
	.word	71237632
	.word	-211095446
	.word	-162010254
	.word	-294718878
	.word	-361829526
	.word	-295179413
	.word	-378739088
	.word	-161418145
	.word	-77922304
	.word	235604750
	.word	151720459
	.word	352917502
	.word	552673521
	.word	585836521
	.word	719268321
	.word	786704116
	.word	354222080
	.word	-47251647
	.word	-12978339
	.word	-145947880
	.word	2752560
	.word	3668539
	.word	-112724909
	.word	-178789769
	.word	0
	.word	186844224
	.word	20777763
	.word	303631384
	.word	220007716
	.word	-161613495
	.word	-28766930
	.word	154270052
	.word	0
	.word	104007225
	.word	120915508
	.word	104270637
	.word	237242421
	.word	-11401417
	.word	-45215954
	.word	371195732
	.word	0
	.word	-144840098
	.word	-78247613
	.word	-61802923
	.word	-12187844
	.word	154797373
	.word	204607282
	.word	305205558
	.word	0
	.word	770192851
	.word	820396501
	.word	736962550
	.word	503910938
	.word	337313849
	.word	-229442741
	.word	-312353411
	.word	0
	.word	-45418660
	.word	-128456322
	.word	20643101
	.word	-14417626
	.word	36436535
	.word	3801152
	.word	-45418918
	.word	0
	.word	154468917
	.word	87424573
	.word	3670072
	.word	-213910724
	.word	-12712903
	.word	-96140231
	.word	237438003
	.word	222560256
	.word	419897081
	.word	469965828
	.word	536879871
	.word	503717382
	.word	537468691
	.word	437983774
	.word	622074914
	.word	289800192
	.word	170460974
	.word	-13433039
	.word	137627945
	.word	103744055
	.word	220793388
	.word	103941429
	.word	221316159
	.word	104857600
	.word	452992000
	.word	536615686
	.word	570957322
	.word	404103443
	.word	371202591
	.word	355015212
	.word	388960321
	.word	239534080
	.word	87426620
	.word	104531525
	.word	4652061
	.word	85919530
	.word	20708922
	.word	-45548207
	.word	-178192384
	.word	0
	.word	54526269
	.word	155123712
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	21169467
	.word	155385856
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-28967365
	.word	105250816
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	138151487
	.word	289472512
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-13631420
	.word	-62523304
	.word	3803141
	.word	168693266
	.word	219873832
	.word	3865926
	.word	-95422379
	.word	0
	.word	120721447
	.word	86770740
	.word	187759420
	.word	-12910533
	.word	371262764
	.word	237764430
	.word	3934533
	.word	0
	.word	270406176
	.word	304289309
	.word	404690726
	.word	304813097
	.word	188680507
	.word	155254622
	.word	-27658388
	.word	0
	.word	170658079
	.word	204145461
	.word	237111846
	.word	-46920408
	.word	287311660
	.word	119934258
	.word	171514411
	.word	0
	.word	353900308
	.word	437721888
	.word	471276568
	.word	388503584
	.word	471668522
	.word	322508341
	.word	373099350
	.word	0
	.word	0
	.word	0
	.word	-96274141
	.word	-114624467
	.word	-80677832
	.word	-96666818
	.word	-129828788
	.word	0
	.word	-61867705
	.word	-79300794
	.word	-129829308
	.word	-313920443
	.word	-263786173
	.word	-331420346
	.word	-264050111
	.word	-331415552
	.word	167647991
	.word	569845753
	.word	704523523
	.word	822684955
	.word	607846400
	.word	0
	.word	0
	.word	0
	.word	-78251439
	.word	-162662063
	.word	-279908791
	.word	-62196141
	.word	-146278589
	.word	-12715966
	.word	-230555589
	.word	37421056
	.word	368255474
	.word	670641918
	.word	855784454
	.word	1024538402
	.word	708706304
	.word	0
	.word	0
	.word	0
	.word	-645927333
	.word	-278862255
	.word	-580720538
	.word	-379460233
	.word	-396104850
	.word	-295248769
	.word	0
	.word	0
	.word	5307225
	.word	-111215524
	.word	-378474169
	.word	-113442763
	.word	-79497907
	.word	-145688748
	.word	-162013569
	.word	0
	.word	-211291301
	.word	-145100196
	.word	-129174441
	.word	-378607511
	.word	-162599824
	.word	-278678913
	.word	-1166029185
	.word	-763428864
	.word	70060572
	.word	169812469
	.word	886379023
	.word	469771242
	.word	652681728
	.word	669917428
	.word	1721892864
	.word	955318272
	.word	-344004228
	.word	-328276354
	.word	-411242647
	.word	-444996235
	.word	-278469003
	.word	-445325446
	.word	-161484188
	.word	-127991808
	.word	335155962
	.word	234887924
	.word	535831015
	.word	568993252
	.word	669133538
	.word	802565596
	.word	836643311
	.word	537460736
	.word	2555969
	.word	-246096513
	.word	-345637593
	.word	-80348867
	.word	-179572403
	.word	-279189653
	.word	-412097414
	.word	0
	.word	-62719154
	.word	-62392248
	.word	37486391
	.word	-112788917
	.word	-128328073
	.word	-45408236
	.word	504812671
	.word	0
	.word	570170634
	.word	637219811
	.word	670512350
	.word	1170621377
	.word	754655239
	.word	937631745
	.word	6948
	.word	0
	.word	-277879694
	.word	-94765488
	.word	-61671595
	.word	-128843960
	.word	88080707
	.word	154665029
	.word	21301061
	.word	0
	.word	1169768385
	.word	1119899062
	.word	920204509
	.word	703996928
	.word	687808014
	.word	471471909
	.word	204933953
	.word	0
	.word	-28707736
	.word	-144973441
	.word	-179505620
	.word	-164301255
	.word	-147132344
	.word	-112853947
	.word	-78973098
	.word	0
	.word	3603261
	.word	3866428
	.word	-46270397
	.word	-413863350
	.word	-79624908
	.word	37290045
	.word	-146410170
	.word	305594368
	.word	568795874
	.word	618931940
	.word	652550894
	.word	602940146
	.word	553133562
	.word	587210250
	.word	470948377
	.word	489226240
	.word	-112854461
	.word	-263324096
	.word	37616195
	.word	-46136775
	.word	-46006974
	.word	4065587
	.word	-12386745
	.word	-28639232
	.word	635381724
	.word	685450978
	.word	786377442
	.word	686305763
	.word	653535478
	.word	654126843
	.word	521411870
	.word	422313984
	.word	53937976
	.word	121047101
	.word	37943074
	.word	18877215
	.word	87359031
	.word	-29163447
	.word	-128385024
	.word	0
	.word	-62455750
	.word	121438208
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	4915784
	.word	139264000
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-12126392
	.word	238813184
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	204475185
	.word	439156736
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-46858172
	.word	-112527528
	.word	53741316
	.word	168300808
	.word	269681445
	.word	-12715191
	.word	-12125106
	.word	0
	.word	153686553
	.word	153093419
	.word	154075180
	.word	3342894
	.word	321322050
	.word	254151722
	.word	153223257
	.word	0
	.word	237179423
	.word	287511838
	.word	288166954
	.word	304945946
	.word	271976258
	.word	272108361
	.word	172226164
	.word	0
	.word	270860335
	.word	304286501
	.word	204016169
	.word	36703273
	.word	220790843
	.word	53613352
	.word	54661682
	.word	0
	.word	370546454
	.word	454369556
	.word	438050328
	.word	455217706
	.word	421990962
	.word	205919542
	.word	239536979
	.word	0
	.word	0
	.word	0
	.word	-79233000
	.word	-14352854
	.word	-30083271
	.word	-96469951
	.word	-62654126
	.word	0
	.word	-78251439
	.word	-162662063
	.word	-279908791
	.word	-62196141
	.word	-146278589
	.word	-12715966
	.word	-230555589
	.word	37421056
	.word	301342963
	.word	720843259
	.word	889208835
	.word	1141522971
	.word	792264704
	.word	0
	.word	0
	.word	0
	.word	-44958388
	.word	-112657842
	.word	-196545980
	.word	-45680052
	.word	-79496386
	.word	3800125
	.word	-147062474
	.word	37355520
	.word	301342963
	.word	720843259
	.word	889208835
	.word	1141522971
	.word	792264704
	.word	0
	.word	0
	.word	0
	.word	-595595429
	.word	-228595884
	.word	-413731751
	.word	-279191169
	.word	-229839257
	.word	-212149377
	.word	0
	.word	0
	.word	189793612
	.word	39060814
	.word	-395056558
	.word	-146931659
	.word	3928661
	.word	-212208802
	.word	-178461825
	.word	0
	.word	-61410216
	.word	-78447288
	.word	-62654392
	.word	-262539451
	.word	-12909246
	.word	70908999
	.word	-28900806
	.word	-11927552
	.word	69664810
	.word	119671581
	.word	136250917
	.word	120193832
	.word	136383787
	.word	220464175
	.word	53936698
	.word	104595456
	.word	-360716417
	.word	-411507329
	.word	-311236235
	.word	-411638155
	.word	-395189130
	.word	-512173188
	.word	-161549978
	.word	-161284096
	.word	301142263
	.word	301210603
	.word	635578840
	.word	718745809
	.word	669003480
	.word	885862103
	.word	886647789
	.word	537591808
	.word	-97057731
	.word	-229385345
	.word	-345705927
	.word	-196872889
	.word	-162665643
	.word	-262608536
	.word	-245179521
	.word	0
	.word	-64159931
	.word	4127027
	.word	-63964630
	.word	-47580619
	.word	139261774
	.word	-179107532
	.word	4455258
	.word	0
	.word	137104172
	.word	237635376
	.word	70779956
	.word	220530993
	.word	322570800
	.word	204275781
	.word	337709119
	.word	0
	.word	-211104129
	.word	-77852359
	.word	-78187682
	.word	-195297715
	.word	4718409
	.word	71366993
	.word	88084281
	.word	0
	.word	1036597458
	.word	1053708733
	.word	770450430
	.word	470753793
	.word	654384657
	.word	338039341
	.word	255197263
	.word	0
	.word	-78645912
	.word	-178527617
	.word	-162334672
	.word	-130156478
	.word	-112790965
	.word	-162531501
	.word	-195236244
	.word	0
	.word	21229896
	.word	-78907312
	.word	-346821824
	.word	-216012992
	.word	-480376501
	.word	289405002
	.word	-81527269
	.word	224067584
	.word	602808807
	.word	486348810
	.word	452993778
	.word	886319080
	.word	319889177
	.word	605886497
	.word	571416084
	.word	373882880
	.word	21168196
	.word	-163380924
	.word	5046848
	.word	4520782
	.word	121046331
	.word	37817910
	.word	254543164
	.word	38141952
	.word	619718130
	.word	636428289
	.word	571415823
	.word	404300310
	.word	521151250
	.word	521937193
	.word	605821743
	.word	356384768
	.word	4324943
	.word	4783196
	.word	-61871547
	.word	-263455174
	.word	20640590
	.word	-145490863
	.word	-211615744
	.word	0
	.word	54655301
	.word	139264000
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	337777439
	.word	455868416
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-28512682
	.word	205914112
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	304026394
	.word	605552640
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-96992444
	.word	-129502366
	.word	-212731354
	.word	-213976518
	.word	-29626295
	.word	-162729130
	.word	-145492393
	.word	0
	.word	-163445954
	.word	-45814703
	.word	1966343
	.word	-48764086
	.word	272820604
	.word	287649006
	.word	853469823
	.word	0
	.word	319819556
	.word	254022940
	.word	420814356
	.word	520887056
	.word	405405789
	.word	238554937
	.word	438757503
	.word	0
	.word	88142918
	.word	188155192
	.word	4522561
	.word	-95812298
	.word	121043532
	.word	-179110323
	.word	-28501718
	.word	0
	.word	404167440
	.word	404627229
	.word	371791402
	.word	272371508
	.word	238814030
	.word	-260369099
	.word	372775229
	.word	0
	.word	0
	.word	0
	.word	-146278107
	.word	-131271375
	.word	-164039621
	.word	-130025661
	.word	-96143793
	.word	0
	.word	-45156278
	.word	-146213304
	.word	-297012153
	.word	-180356282
	.word	-280235448
	.word	-263981003
	.word	-230951116
	.word	-180092928
	.word	167649014
	.word	536617471
	.word	554114828
	.word	622272294
	.word	339738624
	.word	0
	.word	0
	.word	0
	.word	-45156278
	.word	-146213304
	.word	-297012153
	.word	-180356282
	.word	-280235448
	.word	-263981003
	.word	-230951116
	.word	-180092928
	.word	167649014
	.word	536617471
	.word	554114828
	.word	622272294
	.word	339738624
	.word	0
	.word	0
	.word	0
	.type	CalcZeroNum, %object
	.size	CalcZeroNum, 256
CalcZeroNum:
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
	.type	g_AspecRatioIdc, %object
	.size	g_AspecRatioIdc, 112
g_AspecRatioIdc:
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
.LC2:
	ASCII(.string	"list[%d][%d]: frame_num=%d, poc=%d\n" )
	.zero	4
.LC4:
	ASCII(.string	"L0: " )
	.zero	3
.LC6:
	ASCII(.string	"\n" )
	.zero	6
.LC8:
	ASCII(.string	"%d " )
	.zero	4
.LC10:
	ASCII(.string	"%dt " )
	.zero	3
.LC12:
	ASCII(.string	"%db " )
	.zero	3
.LC14:
	ASCII(.string	"L1:" )
	.zero	4
.LC16:
	ASCII(.string	"\n\nEND of the bit buffer, copy the first packet!\n\n" )
	.zero	6
.LC18:
	ASCII(.string	"0:phy:0x%x, 1:phy:0x%x; len0:%d len1:%d\n" )
	.zero	7
.LC21:
	ASCII(.string	"0:phy:0x%x, len0:%d\n" )
	.zero	3
.LC23:
	ASCII(.string	"%-50s%50d\n" )
	.zero	5
.LC30:
	ASCII(.string	"../../core/syntax/h264.c" )
	.zero	7
.LC32:
	ASCII(.string	"NULL pointer: %s, L%d\n" )
	.zero	1
.LC34:
	ASCII(.string	"\n VFMW ** release streambuff=%p   bitstream_length=%d\n" )
	.zero	1
.LC37:
	ASCII(.string	"%s DPB.fs[%d] = NULL\n" )
	.zero	2
.LC41:
	ASCII(.string	"clear curr slice.\n" )
	.zero	5
.LC51:
	ASCII(.string	"frame %d, state=%d, is already output\n" )
	.zero	1
.LC53:
	ASCII(.string	"plfs(fs=%p, eFoState=%d) is null, logic_fs_id = %d\n" )
	.zero	4
.LC55:
	ASCII(.string	"not used frame: (%d,%d)\n" )
	.zero	7
.LC57:
	ASCII(.string	"frame skip: is_used=%d,skip=%d\n" )
.LC59:
	ASCII(.string	"topfield skip: is_used=%d,skip=%d\n" )
	.zero	5
.LC61:
	ASCII(.string	"bottom field skip: is_used=%d,skip=%d\n" )
	.zero	1
.LC63:
	ASCII(.string	"err(%d) > out_thr(%d)\n" )
	.zero	1
.LC66:
	ASCII(.string	"exg_pts: %lld <-> %lld\n" )
.LC68:
	ASCII(.string	"stream frame packing type is %d! what can we do?\n" )
	.zero	6
.LC73:
	ASCII(.string	"framestore %d allocate apc %d\n" )
	.zero	1
.LC75:
	ASCII(.string	"find APC, but logic_fs_id %d abnormal(ref=%d,plfs=%p, pdfs=%p)\n" )
.LC79:
	ASCII(.string	"pH264Ctx->DPB.fs[%d]: frame_num=%d poc=%d is_reference=%d\n" )
	.zero	5
.LC81:
	ASCII(.string	"pH264Ctx->DPB.fs_ref[%d]: frame_num=%d poc=%d is_reference=%d\n" )
	.zero	1
.LC83:
	ASCII(.string	"pH264Ctx->DPB.fs_ref[%d]: frame.poc=%d \n" )
	.zero	7
.LC86:
	ASCII(.string	"image size abnormal(%dx%d)\n" )
	.zero	4
.LC88:
	ASCII(.string	"resolution error, ImageWidth=%d, ImageHeight=%d\n" )
	.zero	7
.LC90:
	ASCII(.string	"partition fs memory fail!\n" )
	.zero	5
.LC92:
	ASCII(.string	"ERROR: FSP_ConfigInstance fail!\n" )
	.zero	7
.LC96:
	ASCII(.string	"slice_type %d invalid, clear current slice.\n" )
	.zero	3
.LC98:
	ASCII(.string	"pRepairPic(%p)/found(%d) = 0, clear current slice.\n" )
	.zero	4
.LC100:
	ASCII(.string	"listXsize[%d] = %d, clear current slice.\n" )
	.zero	6
.LC110:
	ASCII(.string	"for P slice size of list equal 0.\n" )
	.zero	5
.LC116:
	ASCII(.string	"for B slice size of two list all equal 0.\n" )
	.zero	5
.LC122:
	ASCII(.string	"init list error.\n" )
	.zero	6
.LC124:
	ASCII(.string	"L0: list after init.\n" )
	.zero	2
.LC127:
	ASCII(.string	"L0: list after reorder.\n" )
	.zero	7
.LC132:
	ASCII(.string	"nal_ref_idc=%d, structure=%d, image_id=%d, pmv_idc=%d\n" )
	.zero	1
.LC134:
	ASCII(.string	"logic frame id(=%d): get LogicFs error!\n" )
	.zero	7
.LC136:
	ASCII(.string	"phy fs is null: pstDecodeFs = %p, pstDispOutFs = %p\n" )
	.zero	3
.LC140:
	ASCII(.string	"line: %d pstLogicFs is null\n" )
	.zero	3
.LC142:
	ASCII(.string	"SH: first_mb_in_slice" )
	.zero	2
.LC144:
	ASCII(.string	"slicecheck first_mb_in_slice >= MAX_MB_NUM_IN_PIC error.\n" )
	.zero	6
.LC146:
	ASCII(.string	"SH: slice_type" )
	.zero	1
.LC148:
	ASCII(.string	"slice type = %d\n" )
	.zero	7
.LC151:
	ASCII(.string	"slice type = %d, err\n" )
	.zero	2
.LC153:
	ASCII(.string	"slice  pps id = %d\n" )
	.zero	4
.LC157:
	ASCII(.string	"pps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	1
.LC159:
	ASCII(.string	"sps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	1
.LC161:
	ASCII(.string	"tmp slice  pps id = %d\n" )
.LC165:
	ASCII(.string	"PPSSPSCheckTmpId: pps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	7
.LC167:
	ASCII(.string	"PPSSPSCheckTmpId: seq_parameter_set_id out of range.\n" )
	.zero	2
.LC169:
	ASCII(.string	"PPSSPSCheckTmpId: sps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	7
.LC173:
	ASCII(.string	"new pic flag = %d\n" )
	.zero	5
.LC175:
	ASCII(.string	"SH: ref_pic_list_reordering_flag_l0" )
	.zero	4
.LC177:
	ASCII(.string	"SH: reordering_of_pic_nums_idc_l0" )
	.zero	6
.LC179:
	ASCII(.string	"reorder idc l0 = %d, g_SeErrFlag=%d\n" )
	.zero	3
.LC181:
	ASCII(.string	"SH: abs_diff_pic_num_minus1_l0" )
	.zero	1
.LC183:
	ASCII(.string	"abs_diff_pic_num_minus1_l0 = %d, g_SeErrFlag=%d\n" )
	.zero	7
.LC185:
	ASCII(.string	"SH: long_term_pic_idx_l0" )
	.zero	7
.LC187:
	ASCII(.string	"num of idc l0 exceed\n" )
	.zero	2
.LC189:
	ASCII(.string	"SH: ref_pic_list_reordering_flag_l1" )
	.zero	4
.LC191:
	ASCII(.string	"SH: reordering_of_pic_nums_idc_l1" )
	.zero	6
.LC193:
	ASCII(.string	"reorder idc l1 = %d, g_SeErrFlag=%d\n" )
	.zero	3
.LC195:
	ASCII(.string	"SH: abs_diff_pic_num_minus1_l1" )
	.zero	1
.LC197:
	ASCII(.string	"abs_diff_pic_num_minus1_l1 = %d, g_SeErrFlag=%d\n" )
	.zero	7
.LC199:
	ASCII(.string	"SH: long_term_pic_idx_l1" )
	.zero	7
.LC201:
	ASCII(.string	"num of idc l1 exceed\n" )
	.zero	2
.LC203:
	ASCII(.string	"SH: luma_log2_weight_denom" )
	.zero	5
.LC205:
	ASCII(.string	"SH: chroma_log2_weight_denom" )
	.zero	3
.LC207:
	ASCII(.string	"WP log2 exceed  and err flag = %d\n" )
	.zero	5
.LC209:
	ASCII(.string	"SH: luma_weight_flag_l0" )
.LC211:
	ASCII(.string	"SH: luma_weight_l0" )
	.zero	5
.LC213:
	ASCII(.string	"SH: luma_offset_l0" )
	.zero	5
.LC215:
	ASCII(.string	"SH: chroma_weight_flag_l0" )
	.zero	6
.LC217:
	ASCII(.string	"SH: chroma_weight_l0" )
	.zero	3
.LC219:
	ASCII(.string	"SH: chroma_offset_l0" )
	.zero	3
.LC221:
	ASCII(.string	"SH: luma_weight_flag_l1" )
.LC223:
	ASCII(.string	"SH: luma_weight_l1" )
	.zero	5
.LC225:
	ASCII(.string	"SH: luma_offset_l1" )
	.zero	5
.LC227:
	ASCII(.string	"SH: chroma_weight_flag_l1" )
	.zero	6
.LC229:
	ASCII(.string	"SH: chroma_weight_l1" )
	.zero	3
.LC231:
	ASCII(.string	"SH: chroma_offset_l1" )
	.zero	3
.LC233:
	ASCII(.string	"overflow MAX_MMCO_LEN\n" )
	.zero	1
.LC235:
	ASCII(.string	"SH: memory_management_control_operation" )
.LC237:
	ASCII(.string	"SH: difference_of_pic_nums_minus1" )
	.zero	6
.LC239:
	ASCII(.string	"SH: long_term_pic_num" )
	.zero	2
.LC241:
	ASCII(.string	"SH: long_term_frame_idx" )
.LC243:
	ASCII(.string	"SH: max_long_term_frame_idx_plus1" )
	.zero	6
.LC245:
	ASCII(.string	"mmco exceed 6\n" )
	.zero	1
.LC249:
	ASCII(.string	"SH: no_output_of_prior_pics_flag" )
	.zero	7
.LC251:
	ASCII(.string	"SH: long_term_reference_flag" )
	.zero	3
.LC253:
	ASCII(.string	"IDR and no_output_of_prior_pics_flag = %d\n" )
	.zero	5
.LC255:
	ASCII(.string	"SH: adaptive_ref_pic_marking_mode_flag" )
	.zero	1
.LC257:
	ASCII(.string	"adaptive_ref_pic_marking_mode_flag = %d\n" )
	.zero	7
.LC259:
	ASCII(.string	"MMCO para would save dec err\n" )
	.zero	2
.LC261:
	ASCII(.string	"mulitislice diff no_out_of_prior_pics_flag, used first.\n" )
	.zero	7
.LC263:
	ASCII(.string	"mulitislice diff long_term_reference_flag, used first.\n" )
.LC265:
	ASCII(.string	"mulitislice diff adaptive_ref_pic_marking_mode_flag, used first.\n" )
	.zero	6
.LC267:
	ASCII(.string	"TotalPicNum=%d, SliceNumInPic=%d, TotalNal=%d\n" )
	.zero	1
.LC271:
	ASCII(.string	"SH: pic_parameter_set_id" )
	.zero	7
.LC273:
	ASCII(.string	"pps id:%d in sliceheader err\n" )
	.zero	2
.LC275:
	ASCII(.string	"PPS or SPS of this slice not valid\n" )
	.zero	4
.LC277:
	ASCII(.string	"recover point but isn't I_SLICE.\n" )
	.zero	6
.LC279:
	ASCII(.string	"SH: frame_num" )
	.zero	2
.LC281:
	ASCII(.string	"IDR NAL but frame_num!=0.\n" )
	.zero	5
.LC283:
	ASCII(.string	"SH: field_pic_flag" )
	.zero	5
.LC285:
	ASCII(.string	"SH: bottom_field_flag" )
	.zero	2
.LC287:
	ASCII(.string	"field first_mb_in_slice bigger than pic size\n" )
	.zero	2
.LC289:
	ASCII(.string	"frame first_mb_in_slice bigger than pic size\n" )
	.zero	2
.LC291:
	ASCII(.string	"SH: idr_pic_id" )
	.zero	1
.LC293:
	ASCII(.string	"idr_pic_id bigger than 65535\n" )
	.zero	2
.LC295:
	ASCII(.string	"SH: pic_order_cnt_lsb" )
	.zero	2
.LC297:
	ASCII(.string	"SH: delta_pic_order_cnt_bottom" )
	.zero	1
.LC299:
	ASCII(.string	"SH: delta_pic_order_cnt[0]" )
	.zero	5
.LC301:
	ASCII(.string	"SH: delta_pic_order_cnt[1]" )
	.zero	5
.LC303:
	ASCII(.string	"SH: redundant_pic_cnt" )
	.zero	2
.LC305:
	ASCII(.string	"redundant pic not support.\n" )
	.zero	4
.LC308:
	ASCII(.string	"first_mb_in_slice in currslice small than prevslice in same pic\n" )
	.zero	7
.LC314:
	ASCII(.string	"SH: direct_spatial_mv_pred_flag" )
.LC316:
	ASCII(.string	"SH: num_ref_idx_override_flag" )
	.zero	2
.LC318:
	ASCII(.string	"SH: num_ref_idx_l0_active_minus1" )
	.zero	7
.LC320:
	ASCII(.string	"SH: num_ref_idx_l1_active_minus1" )
	.zero	7
.LC322:
	ASCII(.string	"frame num_ref_idx_lx_active_minus1 exceed\n" )
	.zero	5
.LC324:
	ASCII(.string	"field num_ref_idx_lx_active_minus1 exceed\n" )
	.zero	5
.LC326:
	ASCII(.string	"reordering para dec err\n" )
	.zero	7
.LC328:
	ASCII(.string	"apply_weights_flag=%d\n" )
	.zero	1
.LC330:
	ASCII(.string	"wpt dec err\n" )
	.zero	3
.LC332:
	ASCII(.string	"mark para dec err\n" )
	.zero	5
.LC334:
	ASCII(.string	"SH: cabac_init_idc" )
	.zero	5
.LC336:
	ASCII(.string	"cabac_init_idc bigger than 3\n" )
	.zero	2
.LC338:
	ASCII(.string	"SH: slice_qp_delta" )
	.zero	5
.LC340:
	ASCII(.string	"SH: disable_deblocking_filter_idc" )
	.zero	6
.LC342:
	ASCII(.string	"disable_deblocking_filter_idc dec err\n" )
	.zero	1
.LC344:
	ASCII(.string	"SH: slice_alpha_c0_offset_div2" )
	.zero	1
.LC346:
	ASCII(.string	"slice_alpha_c0_offset_div2 dec err\n" )
	.zero	4
.LC348:
	ASCII(.string	"SH: slice_beta_offset_div2" )
	.zero	5
.LC350:
	ASCII(.string	"slice_beta_offset_div2 dec err\n" )
.LC358:
	ASCII(.string	"pH264Ctx->pCurrNal->nal_bitoffset = %d; code_len_byte = %d; bitstream_length = %d; pH264Ctx->pCurrNal->nal_trail_zero_bit_num = %d\n" )
	.zero	4
.LC360:
	ASCII(.string	"stream[%d]: bitsoffset = %d; valid_bitlen = %d; bytespos = %x\n" )
	.zero	1
.LC362:
	ASCII(.string	"nal_segment = %d is not expected value\n" )
.LC364:
	ASCII(.string	"stream[%d]: bitsoffset = %d; valid_bitlen = %d\n" )
.LC371:
	ASCII(.string	": delta_sl" )
	.zero	5
.LC373:
	ASCII(.string	"%s, %d: integer operation overflow\n" )
	.zero	4
.LC379:
	ASCII(.string	"PPS: entropy_coding_mode_flag" )
	.zero	2
.LC381:
	ASCII(.string	"PPS: pic_order_present_flag" )
	.zero	4
.LC383:
	ASCII(.string	"PPS: num_slice_groups_minus1" )
	.zero	3
.LC385:
	ASCII(.string	"Baseline stream with FMO, not support.\n" )
.LC388:
	ASCII(.string	"PPS: num_ref_idx_l0_active_minus1" )
	.zero	6
.LC390:
	ASCII(.string	"num_ref_idx_l0_active_minus1 out of range.\n" )
	.zero	4
.LC392:
	ASCII(.string	"PPS: num_ref_idx_l1_active_minus1" )
	.zero	6
.LC394:
	ASCII(.string	"num_ref_idx_l1_active_minus1 out of range.\n" )
	.zero	4
.LC396:
	ASCII(.string	"PPS: weighted prediction flag" )
	.zero	2
.LC398:
	ASCII(.string	"PPS: weighted_bipred_idc" )
	.zero	7
.LC400:
	ASCII(.string	"weighted_bipred_idc out of range\n" )
	.zero	6
.LC402:
	ASCII(.string	"PPS: pic_init_qp_minus26" )
	.zero	7
.LC404:
	ASCII(.string	"PPS: pic_init_qs_minus26" )
	.zero	7
.LC406:
	ASCII(.string	"PPS: chroma_qp_index_offset" )
	.zero	4
.LC408:
	ASCII(.string	"PPS: deblocking_filter_control_present_flag" )
	.zero	4
.LC410:
	ASCII(.string	"PPS: constrained_intra_pred_flag" )
	.zero	7
.LC412:
	ASCII(.string	"PPS: redundant_pic_cnt_present_flag" )
	.zero	4
.LC414:
	ASCII(.string	"redundant pic not support when find redundant slice later, exit\n" )
	.zero	7
.LC416:
	ASCII(.string	"PPS: transform_8x8_mode_flag" )
	.zero	3
.LC418:
	ASCII(.string	"PPS: pic_scaling_matrix_present_flag" )
	.zero	3
.LC420:
	ASCII(.string	"PPS: second_chroma_qp_index_offset" )
	.zero	5
.LC422:
	ASCII(.string	"SPS: seq_scaling_list_present_flag" )
	.zero	5
.LC424:
	ASCII(.string	"Scaling_List failed\n" )
	.zero	3
.LC427:
	ASCII(.string	"PPS: pic_scaling_list_present_flag" )
	.zero	5
.LC429:
	ASCII(.string	"second_chroma_qp_index_offset out of range.\n" )
	.zero	3
.LC435:
	ASCII(.string	"PPS: pic_parameter_set_id" )
	.zero	6
.LC437:
	ASCII(.string	"pic_parameter_set_id out of range.\n" )
	.zero	4
.LC440:
	ASCII(.string	"PPS: seq_parameter_set_id" )
	.zero	6
.LC442:
	ASCII(.string	"seq_parameter_set_id out of range.\n" )
	.zero	4
.LC444:
	ASCII(.string	"SPS haven't decode.\n" )
	.zero	3
.LC448:
	ASCII(.string	"%s: PPS decode error 1.\n" )
	.zero	7
.LC451:
	ASCII(.string	"%s: PPS decode error 2.\n" )
	.zero	7
.LC453:
	ASCII(.string	"VUI: aspect_ratio_info_present_flag" )
	.zero	4
.LC455:
	ASCII(.string	"VUI: aspect_ratio_idc" )
	.zero	2
.LC457:
	ASCII(.string	"VUI: sar_width" )
	.zero	1
.LC459:
	ASCII(.string	"VUI: sar_height" )
.LC461:
	ASCII(.string	"VUI: overscan_info_present_flag" )
.LC463:
	ASCII(.string	"VUI: overscan_appropriate_flag" )
	.zero	1
.LC465:
	ASCII(.string	"VUI: video_signal_type_present_flag" )
	.zero	4
.LC467:
	ASCII(.string	"VUI: video_format" )
	.zero	6
.LC469:
	ASCII(.string	"VUI: video_full_range_flag" )
	.zero	5
.LC471:
	ASCII(.string	"VUI: color_description_present_flag" )
	.zero	4
.LC473:
	ASCII(.string	"VUI: colour_primaries" )
	.zero	2
.LC475:
	ASCII(.string	"VUI: transfer_characteristics" )
	.zero	2
.LC477:
	ASCII(.string	"VUI: matrix_coefficients" )
	.zero	7
.LC479:
	ASCII(.string	"VUI: chroma_loc_info_present_flag" )
	.zero	6
.LC481:
	ASCII(.string	"VUI: chroma_sample_loc_type_top_field" )
	.zero	2
.LC483:
	ASCII(.string	"VUI: chroma_sample_loc_type_bottom_field" )
	.zero	7
.LC485:
	ASCII(.string	"VUI: timing_info_present_flag" )
	.zero	2
.LC487:
	ASCII(.string	"VUI: num_units_in_tick" )
	.zero	1
.LC489:
	ASCII(.string	"VUI: time_scale" )
.LC491:
	ASCII(.string	"VUI: fixed_frame_rate_flag" )
	.zero	5
.LC494:
	ASCII(.string	"VUI: nal_hrd_parameters_present_flag" )
	.zero	3
.LC496:
	ASCII(.string	"VUI: cpb_cnt_minus1" )
	.zero	4
.LC498:
	ASCII(.string	"VUI: bit_rate_scale" )
	.zero	4
.LC500:
	ASCII(.string	"VUI: cpb_size_scale" )
	.zero	4
.LC502:
	ASCII(.string	"hrd->cpb_cnt_minus1 out of range\n" )
	.zero	6
.LC504:
	ASCII(.string	"VUI: bit_rate_value_minus1" )
	.zero	5
.LC506:
	ASCII(.string	"VUI: cpb_size_value_minus1" )
	.zero	5
.LC508:
	ASCII(.string	"VUI: cbr_flag" )
	.zero	2
.LC510:
	ASCII(.string	"VUI: initial_cpb_removal_delay_length_minus1" )
	.zero	3
.LC512:
	ASCII(.string	"VUI: cpb_removal_delay_length_minus1" )
	.zero	3
.LC514:
	ASCII(.string	"VUI: dpb_output_delay_length_minus1" )
	.zero	4
.LC516:
	ASCII(.string	"VUI: time_offset_length" )
.LC518:
	ASCII(.string	"VUI: vcl_hrd_parameters_present_flag" )
	.zero	3
.LC520:
	ASCII(.string	"VUI: low_delay_hrd_flag" )
.LC522:
	ASCII(.string	"VUI: pic_struct_present_flag" )
	.zero	3
.LC524:
	ASCII(.string	"VUI: bitstream_restriction_flag" )
.LC526:
	ASCII(.string	"VUI: motion_vectors_over_pic_boundaries_flag" )
	.zero	3
.LC528:
	ASCII(.string	"VUI: max_bytes_per_pic_denom" )
	.zero	3
.LC530:
	ASCII(.string	"VUI: max_bits_per_mb_denom" )
	.zero	5
.LC532:
	ASCII(.string	"VUI: log2_max_mv_length_horizontal" )
	.zero	5
.LC534:
	ASCII(.string	"VUI: log2_max_mv_length_vertical" )
	.zero	7
.LC536:
	ASCII(.string	"VUI: num_reorder_frames" )
.LC538:
	ASCII(.string	"VUI: max_dec_frame_buffering" )
	.zero	3
.LC543:
	ASCII(.string	"dar=%d, final_dar=%d\n" )
	.zero	2
.LC549:
	ASCII(.string	"SPS: chroma_format_idc" )
	.zero	1
.LC551:
	ASCII(.string	"pSPS->chroma_format_idc = %d out of range.\n" )
	.zero	4
.LC553:
	ASCII(.string	"SPS: bit_depth_luma_minus8" )
	.zero	5
.LC555:
	ASCII(.string	"bit_depth_luma(%d) not equal 8.\n" )
	.zero	7
.LC558:
	ASCII(.string	"SPS: bit_depth_chroma_minus8" )
	.zero	3
.LC560:
	ASCII(.string	"bit_depth_chroma(%d) not equal 8.\n" )
	.zero	5
.LC562:
	ASCII(.string	"SPS: qpprime_y_zero_trans_bypass_flag" )
	.zero	2
.LC564:
	ASCII(.string	"qpprime_y_zero_trans_bypass_flag not equal 0.\n" )
	.zero	1
.LC566:
	ASCII(.string	"SPS: seq_scaling_matrix_present_flag" )
	.zero	3
.LC571:
	ASCII(.string	"SPS: log2_max_frame_num_minus4" )
	.zero	1
.LC573:
	ASCII(.string	"pSPS->log2_max_frame_num_minus4 out of range.\n" )
	.zero	1
.LC575:
	ASCII(.string	"SPS: pic_order_cnt_type" )
.LC577:
	ASCII(.string	"pSPS->pic_order_cnt_type out of range.\n" )
.LC579:
	ASCII(.string	"SPS: log2_max_pic_order_cnt_lsb_minus4" )
	.zero	1
.LC581:
	ASCII(.string	"pSPS->log2_max_pic_order_cnt_lsb_minus4 out of range.\n" )
	.zero	1
.LC583:
	ASCII(.string	"SPS: delta_pic_order_always_zero_flag" )
	.zero	2
.LC585:
	ASCII(.string	"SPS: offset_for_non_ref_pic" )
	.zero	4
.LC587:
	ASCII(.string	"SPS: offset_for_top_to_bottom_field" )
	.zero	4
.LC589:
	ASCII(.string	"SPS: num_ref_frames_in_pic_order_cnt_cycle" )
	.zero	5
.LC591:
	ASCII(.string	"pSPS->num_ref_frames_in_pic_order_cnt_cycle out of range.\n" )
	.zero	5
.LC593:
	ASCII(.string	"SPS: offset_for_ref_frame[i]" )
	.zero	3
.LC595:
	ASCII(.string	"SPS: gaps_in_frame_num_value_allowed_flag" )
	.zero	6
.LC597:
	ASCII(.string	"SPS: pic_width_in_mbs_minus1" )
	.zero	3
.LC599:
	ASCII(.string	"pSPS->pic_width_in_mbs_minus1 out of range(=%d).\n" )
	.zero	6
.LC601:
	ASCII(.string	"SPS: pic_height_in_map_units_minus1" )
	.zero	4
.LC603:
	ASCII(.string	"SPS: frame_mbs_only_flag" )
	.zero	7
.LC605:
	ASCII(.string	"pSPS->pic_height_in_map_units_minus1 out of range.\n" )
	.zero	4
.LC607:
	ASCII(.string	"pic size too large.\n" )
	.zero	3
.LC610:
	ASCII(.string	"level_idc %d not support.\n" )
	.zero	5
.LC612:
	ASCII(.string	"dpb size according level : %d\n" )
	.zero	1
.LC614:
	ASCII(.string	"pSPS->num_ref_frames(%d) > DPB size(%d), try to select the reasonable one.\n" )
	.zero	4
.LC616:
	ASCII(.string	"SPS: direct_8x8_inference_flag" )
	.zero	1
.LC618:
	ASCII(.string	"SPS: frame_cropping_flag" )
	.zero	7
.LC620:
	ASCII(.string	"SPS: frame_cropping_rect_left_offset" )
	.zero	3
.LC622:
	ASCII(.string	"SPS: frame_cropping_rect_right_offset" )
	.zero	2
.LC624:
	ASCII(.string	"SPS: frame_cropping_rect_top_offset" )
	.zero	4
.LC626:
	ASCII(.string	"SPS: frame_cropping_rect_bottom_offset" )
	.zero	1
.LC628:
	ASCII(.string	"SPS: vui_parameters_present_flag" )
	.zero	7
.LC630:
	ASCII(.string	"max_dec_frame_buffering(%d) > MaxDpbSize(%d)\n" )
	.zero	2
.LC632:
	ASCII(.string	"SPS: num_ref_frames" )
	.zero	4
.LC634:
	ASCII(.string	"SPS: mb_adaptive_frame_field_flag" )
	.zero	6
.LC636:
	ASCII(.string	"SPS_SVC_EXT: inter_layer_deblocking_filter_control_present_flag" )
.LC638:
	ASCII(.string	"inter_layer_present_flag:%d!\n" )
	.zero	2
.LC640:
	ASCII(.string	"SPS_SVC_EXT: extended_spatial_scalability_idc" )
	.zero	2
.LC642:
	ASCII(.string	"spatial scalability not support!!\n" )
	.zero	5
.LC644:
	ASCII(.string	"SPS_SVC_EXT: chroma_phase_x_plus1_flag" )
	.zero	1
.LC646:
	ASCII(.string	"chroma_phase_x_plus1_flag:%d!!\n" )
.LC648:
	ASCII(.string	"SPS_SVC_EXT: chroma_phase_y_plus1" )
	.zero	6
.LC650:
	ASCII(.string	"chroma_phase_y_plus1:%d!\n" )
	.zero	6
.LC652:
	ASCII(.string	"SPS_SVC_EXT: seq_tcoeff_level_prediction_flag" )
	.zero	2
.LC654:
	ASCII(.string	"SPS_SVC_EXT: adaptive_tcoeff_level_prediction_flag" )
	.zero	5
.LC656:
	ASCII(.string	"adaptive_tcoeff_level_prediction_flag:%d!\n" )
	.zero	5
.LC658:
	ASCII(.string	"SPS_SVC_EXT: slice_header_restriction_flag" )
	.zero	5
.LC660:
	ASCII(.string	"slice_header_restriction_flag error:%d,%x,%d\n" )
	.zero	2
.LC664:
	ASCII(.string	"SPS: profile_idc" )
	.zero	7
.LC666:
	ASCII(.string	"SPS: constrained_set0_flag" )
	.zero	5
.LC668:
	ASCII(.string	"SPS: constrained_set1_flag" )
	.zero	5
.LC670:
	ASCII(.string	"SPS: constrained_set2_flag" )
	.zero	5
.LC672:
	ASCII(.string	"SPS: constrained_set3_flag" )
	.zero	5
.LC674:
	ASCII(.string	"SPS: reserved_zero_4bits" )
	.zero	7
.LC676:
	ASCII(.string	"SPS: level_idc" )
	.zero	1
.LC678:
	ASCII(.string	"SPS: seq_parameter_set_id" )
	.zero	6
.LC683:
	ASCII(.string	"Baseline stream, try to decode, exit when FMO occurred.\n" )
	.zero	7
.LC685:
	ASCII(.string	"EXTENDED stream, try to decode, exit when datapartition occurred.\n" )
	.zero	5
.LC687:
	ASCII(.string	"others High profile stream, try to decode, exit when high profile not support occurred.\n" )
	.zero	7
.LC689:
	ASCII(.string	"profile_idc = %5d error, try to decode as main profile.\n" )
	.zero	7
.LC691:
	ASCII(.string	"level_idc = %5d error, try to decode as level_idc %d.\n" )
	.zero	1
.LC695:
	ASCII(.string	"Line %d: SPS[%d] decode error.\n" )
.LC697:
	ASCII(.string	"svc ext error:\n" )
.LC700:
	ASCII(.string	"SEI: frame_packing_arrangement_id" )
	.zero	6
.LC702:
	ASCII(.string	"SEI: frame_packing_arrangement_cancel_flag" )
	.zero	5
.LC704:
	ASCII(.string	"SEI: frame_packing_arrangement_type" )
	.zero	4
.LC706:
	ASCII(.string	"SEI: quincunx_sampling_flag" )
	.zero	4
.LC708:
	ASCII(.string	"SEI: content_interpretation_type" )
	.zero	7
.LC710:
	ASCII(.string	"SEI: spatial_flipping_flag" )
	.zero	5
.LC712:
	ASCII(.string	"SEI: frame0_flipped_flag" )
	.zero	7
.LC714:
	ASCII(.string	"SEI: field_views_flag" )
	.zero	2
.LC716:
	ASCII(.string	"SEI: current_frame_is_frame0_flag" )
	.zero	6
.LC718:
	ASCII(.string	"SEI: frame0_self_contained_flag" )
.LC720:
	ASCII(.string	"SEI: frame1_self_contained_flag" )
.LC722:
	ASCII(.string	"SEI: frame0_grid_position_x" )
	.zero	4
.LC724:
	ASCII(.string	"SEI: frame0_grid_position_y" )
	.zero	4
.LC726:
	ASCII(.string	"SEI: frame1_grid_position_x" )
	.zero	4
.LC728:
	ASCII(.string	"SEI: frame1_grid_position_y" )
	.zero	4
.LC730:
	ASCII(.string	"SEI: frame_packing_arrangement_reserved_byte" )
	.zero	3
.LC732:
	ASCII(.string	"SEI: frame_packing_arrangement_repetition_period" )
	.zero	7
.LC734:
	ASCII(.string	"SEI: frame_packing_arrangement_extension_flag" )
	.zero	2
.LC736:
	ASCII(.string	"DecPicTimingSEI but SPS is invalid.\n" )
	.zero	3
.LC738:
	ASCII(.string	"SEI: cpb_removal_delay" )
	.zero	1
.LC740:
	ASCII(.string	"SEI: dpb_output_delay" )
	.zero	2
.LC743:
	ASCII(.string	"pic_struct" )
	.zero	5
.LC748:
	ASCII(.string	"SEI nal dec payload type err\n" )
	.zero	2
.LC750:
	ASCII(.string	"SEI nal dec payloadSize err\n" )
	.zero	3
.LC753:
	ASCII(.string	"SEI_BUFFERING_PERIOD,offset = %d,payload_size = %d \n" )
	.zero	3
.LC756:
	ASCII(.string	"PassBytes err [%s][%d]\n" )
.LC758:
	ASCII(.string	"SEI_PIC_TIMING,offset = %d,payload_size = %d \n" )
	.zero	1
.LC760:
	ASCII(.string	"SEI_PAN_SCAN_RECT,offset = %d,payload_size = %d \n" )
	.zero	6
.LC762:
	ASCII(.string	"SEI_FILLER_PAYLOAD,offset = %d,payload_size = %d \n" )
	.zero	5
.LC764:
	ASCII(.string	"SEI_USER_DATA_REGISTERED_ITU_T_T35, offset = %d, payload_size = %d \n" )
	.zero	3
.LC766:
	ASCII(.string	"SEI_USER_DATA_UNREGISTERED, offset = %d, payload_size = %d \n" )
	.zero	3
.LC768:
	ASCII(.string	"SEI: itu_t_t35_country_code" )
	.zero	4
.LC770:
	ASCII(.string	"SEI: itu_t_t35_country_code_extension_byte" )
	.zero	5
.LC772:
	ASCII(.string	"SEI: itu_t_t35_provider_code" )
	.zero	3
.LC775:
	ASCII(.string	"len_tmp = %d cann't dec usrdata\n" )
	.zero	7
.LC777:
	ASCII(.string	"cann't dec usrdata\n" )
	.zero	4
.LC779:
	ASCII(.string	"SEI_RECOVERY_POINT,offset = %d,payload_size = %d \n" )
	.zero	5
.LC781:
	ASCII(.string	"SEI_DEC_REF_PIC_MARKING_REPETITION,offset = %d,payload_size = %d \n" )
	.zero	5
.LC783:
	ASCII(.string	"SEI_SPARE_PIC,offset = %d,payload_size = %d \n" )
	.zero	2
.LC785:
	ASCII(.string	"SEI_SCENE_INFO,offset = %d,payload_size = %d \n" )
	.zero	1
.LC787:
	ASCII(.string	"SEI_SUB_SEQ_INFO,offset = %d,payload_size = %d \n" )
	.zero	7
.LC789:
	ASCII(.string	"SEI_SUB_SEQ_LAYER_CHARACTERISTICS,offset = %d,payload_size = %d \n" )
	.zero	6
.LC791:
	ASCII(.string	"SEI_SUB_SEQ_CHARACTERISTICS,offset = %d,payload_size = %d \n" )
	.zero	4
.LC793:
	ASCII(.string	"SEI_FULL_FRAME_FREEZE,offset = %d,payload_size = %d \n" )
	.zero	2
.LC795:
	ASCII(.string	"SEI_FULL_FRAME_FREEZE_RELEASE,offset = %d,payload_size = %d \n" )
	.zero	2
.LC797:
	ASCII(.string	"SEI_FULL_FRAME_SNAPSHOT,offset = %d,payload_size = %d \n" )
.LC799:
	ASCII(.string	"SEI_PROGRESSIVE_REFINEMENT_SEGMENT_START,offset = %d,payload_size = %d \n" )
	.zero	7
.LC801:
	ASCII(.string	"SEI_PROGRESSIVE_REFINEMENT_SEGMENT_END,offset = %d,payload_size = %d \n" )
	.zero	1
.LC803:
	ASCII(.string	"SEI_MOTION_CONSTRAINED_SLICE_GROUP_SET,offset = %d,payload_size = %d \n" )
	.zero	1
.LC805:
	ASCII(.string	"SEI_FILM_GRAIN_CHARACTERISTICS,offset = %d,payload_size = %d \n" )
	.zero	1
.LC807:
	ASCII(.string	"SEI_DEBLOCKING_FILTER_DISPLAY_PREFERENCE,offset = %d,payload_size = %d \n" )
	.zero	7
.LC809:
	ASCII(.string	"SEI_STEREO_VIDEO_INFO,offset = %d,payload_size = %d \n" )
	.zero	2
.LC811:
	ASCII(.string	"too much usrdat, cann't dec SEI\n" )
	.zero	7
.LC815:
	ASCII(.string	"\nthe stream is error,len:%d\n" )
	.zero	3
.LC820:
	ASCII(.string	"\nSlice nal or IDR nal = %d\n" )
	.zero	4
.LC822:
	ASCII(.string	"sliceheader dec err\n" )
	.zero	3
.LC826:
	ASCII(.string	"H264Dec destroy\n" )
	.zero	7
.LC828:
	ASCII(.string	"H264 recycle image\n" )
	.zero	4
.LC832:
	ASCII(.string	"pH264Ctx is %p, pFrameStore is %p\n" )
	.zero	5
.LC834:
	ASCII(.string	"line; %d pstLogicFsImage is NULL!\n" )
	.zero	5
.LC836:
	ASCII(.string	"InsertVO err:%d, ClearAll\n" )
	.zero	5
.LC838:
	ASCII(.string	"H264.c line %d: frame para err(ret=%d), recycle image self\n" )
	.zero	4
.LC840:
	ASCII(.string	"line: %d pstLogicFsImage is NULL!\n" )
	.zero	5
.LC850:
	ASCII(.string	"[%s][%d] OutputFrmToVO return %d\n" )
	.zero	6
.LC853:
	ASCII(.string	"clear all dec para\n" )
	.zero	4
.LC858:
	ASCII(.string	"FS_ALLOC_ERR, ClearAll\n" )
.LC861:
	ASCII(.string	"Can not new logic fs! ClearAll\n" )
.LC867:
	ASCII(.string	"%s %d unknow error!!\n" )
	.zero	2
.LC869:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC871:
	ASCII(.string	"line %d: flush dpb return %d\n" )
	.zero	2
.LC873:
	ASCII(.string	"[%s %d], pos is %d out of range\n" )
	.zero	7
.LC875:
	ASCII(.string	"line %d, get APC error, ret %d\n" )
.LC877:
	ASCII(.string	"InserFrmInDPB: cur pic struct = %d!\n" )
	.zero	3
.LC881:
	ASCII(.string	"----------------- Imode -> %d ------------------\n" )
	.zero	6
.LC883:
	ASCII(.string	"I_MODE but first_mb_in_slice != 0\n" )
	.zero	5
.LC887:
	ASCII(.string	"Discard this B(poc=%d) befor P, is_ref_idc=%d.\n" )
.LC889:
	ASCII(.string	"***** VDM start, TotalPicNum=%d, pH264Ctx->CurrPic.structure=%d.\n" )
	.zero	6
.LC893:
	ASCII(.string	"DecVDM ERR\n" )
	.zero	4
.LC897:
	ASCII(.string	"%s:%d Metadata map failed\n" )
	.zero	5
.LC902:
	ASCII(.string	"%s:%d Metadata unmap failed\n" )
	.zero	3
.LC905:
	ASCII(.string	"*****[%s][%d],EL Codec can only dec EL stream in DV_DUAL_VES_IMP stream!!*****\n" )
.LC907:
	ASCII(.string	"***** VES Splitter: UNSUPPORT, HDR_capacity=%d*****\n" )
	.zero	3
.LC909:
	ASCII(.string	"%s, %d: DecVDM failed\n" )
	.zero	1
.LC912:
	ASCII(.string	"\n receive streambuff=%p; phy_addr=0x%x; bitstream_length=%d\n" )
	.zero	3
.LC914:
	ASCII(.string	"nal_release_err\n" )
	.zero	7
.LC916:
	ASCII(.string	"cann't find slot for current nal\n" )
	.zero	6
.LC919:
	ASCII(.string	"receive a zero packet\n" )
	.zero	1
.LC925:
	ASCII(.string	"CurrPic.state is 'EMPTY'\n" )
	.zero	6
.LC927:
	ASCII(.string	"StorePicInDPB return(%d) from L%d\n" )
	.zero	5
.LC930:
	ASCII(.string	"directoutput mode\n" )
	.zero	5
.LC932:
	ASCII(.string	"line: %d pImg is NULL!\n" )
.LC935:
	ASCII(.string	"line %d, REPORT_IFRAME_ERR\n" )
	.zero	4
.LC938:
	ASCII(.string	"line %d, return %d\n" )
	.zero	4
.LC940:
	ASCII(.string	"err(%d) > ref_thr(%d)\n" )
	.zero	1
.LC942:
	ASCII(.string	"marking return %d\n" )
	.zero	5
.LC944:
	ASCII(.string	"return value is unexpeced!\n" )
	.zero	4
.LC947:
	ASCII(.string	"line %d: pH264Ctx->DPB.size = %d, ref %d, ltref %d\n" )
	.zero	4
.LC950:
	ASCII(.string	"%s: pos(%d) = pre_pos, force return.\n" )
	.zero	2
.LC952:
	ASCII(.string	"GAP found while DPB is empty!\n" )
	.zero	1
.LC954:
	ASCII(.string	"frame num gap try to fill it \n" )
	.zero	1
.LC956:
	ASCII(.string	"CurrFrameNum = %d  UnusedShortTermFrameNum = %d\n" )
	.zero	7
.LC958:
	ASCII(.string	"cann't allocate frame store when gap find\n" )
	.zero	5
.LC960:
	ASCII(.string	"allocate frame store when gap find\n" )
	.zero	4
.LC962:
	ASCII(.string	"line %d: store gap pic err, ret=%d\n" )
	.zero	4
.LC967:
	ASCII(.string	"%s %d frame_store is null!!\n" )
	.zero	3
.LC971:
	ASCII(.string	"line %d: init dpb return %d\n" )
	.zero	3
.LC973:
	ASCII(.string	"mem arrange err, ClearAll\n" )
	.zero	5
.LC976:
	ASCII(.string	"line %d: frame gap(=%d) > dpb size(=%d)\n" )
	.zero	7
.LC978:
	ASCII(.string	"line %d: dec gap failed\n" )
	.zero	7
.LC980:
	ASCII(.string	"line %d: alloc framestore failed\n" )
	.zero	6
.LC982:
	ASCII(.string	"dec_pts: %lld\n" )
	.zero	1
.LC984:
	ASCII(.string	"dec_usertag: %lld\n" )
	.zero	5
.LC986:
	ASCII(.string	"%s %d NULL == pH264Ctx->CurrPic.frame_store!!\n" )
	.zero	1
.LC988:
	ASCII(.string	"get back frm\n" )
	.zero	2
.LC996:
	ASCII(.string	"Start Reason: SliceParaNum, MaxBytesReceived = %d, %d(thr=%d)\n" )
	.zero	1
.LC998:
	ASCII(.string	"Too many slice or bitstream, err!\n" )
	.zero	5
.LC1000:
	ASCII(.string	"Start Reason: new_pic_flag\n" )
	.zero	4
.LC1002:
	ASCII(.string	"init pic err, find next recover point or next valid sps, pps, or exit\n" )
	.zero	1
.LC1004:
	ASCII(.string	"DecList error, ret=%d\n" )
	.zero	1
.LC1006:
	ASCII(.string	"dec list err, cur pic poc %d.\n" )
	.zero	1
.LC1009:
	ASCII(.string	"pH264Ctx->TotalNal = %d, type:%d\n" )
	.zero	6
.LC1011:
	ASCII(.string	"stop i want\n" )
	.zero	3
.LC1013:
	ASCII(.string	"svc_extension_flag error:priority_id:%d, pred_flag%d\n" )
	.zero	2
.LC1015:
	ASCII(.string	"%d,%d,%d\n" )
	.zero	6
.LC1017:
	ASCII(.string	"svc stream,nal_header:%x\n" )
	.zero	6
.LC1020:
	ASCII(.string	"***** NAL: IDR/Slice, nal_unit_type=%d, TotalSlice=%d\n" )
	.zero	1
.LC1022:
	ASCII(.string	"SliceCheck failed, clear current slice.\n" )
	.zero	7
.LC1025:
	ASCII(.string	"***** NAL: PPS, nal_unit_type=%d, TotalPPS=%d\n" )
	.zero	1
.LC1028:
	ASCII(.string	"%s: PPS decode error.\n" )
	.zero	1
.LC1030:
	ASCII(.string	"***** NAL: SPS, nal_unit_type=%d, TotalSPS=%d\n" )
	.zero	1
.LC1032:
	ASCII(.string	"SPS decode error.\n" )
	.zero	5
.LC1034:
	ASCII(.string	"***** NAL: SEI, nal_unit_type=%d\n" )
	.zero	6
.LC1036:
	ASCII(.string	"SEI decode error.\n" )
	.zero	5
.LC1038:
	ASCII(.string	"***** NAL: AUD, nal_unit_type=%d\n" )
	.zero	6
.LC1040:
	ASCII(.string	"***** NAL: EOSEQ, nal_unit_type=%d\n" )
	.zero	4
.LC1042:
	ASCII(.string	"***** NAL: FILL, nal_unit_type=%d\n" )
	.zero	5
.LC1044:
	ASCII(.string	"***** NAL: EOSTREAM, nal_unit_type=%d\n" )
	.zero	1
.LC1046:
	ASCII(.string	"***** NAL: SPSEXT, nal_unit_type=%d\n" )
	.zero	3
.LC1048:
	ASCII(.string	"***** NAL: AUX, nal_unit_type=%d\n" )
	.zero	6
.LC1050:
	ASCII(.string	"***** NAL: EOPIC, nal_unit_type=%d\n" )
	.zero	4
.LC1052:
	ASCII(.string	"***** NAL: UNSUPPORT, nal_unit_type=%d,nalu header:%x\n" )
	.zero	1
.LC1054:
	ASCII(.string	"***** NAL: UNSUPPORT, nal_unit_type=%d\n" )
.LC1062:
	ASCII(.string	"FindTrailZeros ERR\n" )
	.zero	4
.LC1064:
	ASCII(.string	"H264_DecOneNal ERR\n" )
	.zero	4
.LC1071:
	ASCII(.string	"%s frame_store or pH264DecParam is null\n" )
	.zero	7
.LC1073:
	ASCII(.string	"store pic err, ret = %d\n" )
	.zero	7
.LC1076:
	ASCII(.string	"if h264 no chroma and no lowdelay line num!\n" )
	.zero	3
.LC1079:
	ASCII(.string	"pH264Ctx->CurrPic.frame_store is null pointer\n" )
	.zero	1
.LC1081:
	ASCII(.string	"imode nal store pic err, ret = %d\n" )
	.zero	5
.LC1083:
	ASCII(.string	"imode nal flush dpb err, ret = %d\n" )
	.zero	5
.LC1089:
	ASCII(.string	"CtbNumOneFrame=%d, SedEnd0=%d\n" )
	.zero	1
.LC1093:
	ASCII(.string	"cann't find FrameStore\n" )
.LC1095:
	ASCII(.string	"========== H264 FrameStore state(is_used, is_in_dpb, IsOutDPB) ========\n" )
	.zero	7
.LC1097:
	ASCII(.string	"ReadImgNum = %d, NewImgNum = %d\n" )
	.zero	7
.LC1099:
	ASCII(.string	"%02d: %d %d %d\n" )
.LC1101:
	ASCII(.string	"FrameStore leak, ClearAll\n" )
	.bss
	.align	3
.LANCHOR3 = . + 0
.LANCHOR4 = . + 4352
	.type	pps_tmp.12389, %object
	.size	pps_tmp.12389, 2208
pps_tmp.12389:
	.zero	2208
	.type	sps_tmp.12511, %object
	.size	sps_tmp.12511, 4000
sps_tmp.12511:
	.zero	4000
	.type	TmpBuf, %object
	.size	TmpBuf, 68
TmpBuf:
	.zero	68
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
