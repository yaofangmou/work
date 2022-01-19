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
	ldr	w1, [x0, 552]
	ldr	w2, [x2, 552]
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
	ldr	w1, [x0, 556]
	ldr	w2, [x2, 556]
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
	ldr	w1, [x0, 560]
	ldr	w2, [x2, 560]
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
	ldr	w1, [x0, 560]
	ldr	w2, [x2, 560]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	csetm	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	compare_fs_by_poc_desc, .-compare_fs_by_poc_desc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	SetFrmRepeatCount.part.2, %function
SetFrmRepeatCount.part.2:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	add	x3, x19, 61440
	add	x19, x19, 24576
	ldr	w2, [x3, 1188]
	ldr	w1, [x19, 3704]
	ldr	w0, [x3, 1184]
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
	ldr	w0, [x3, 1188]
	add	w0, w0, 4
	str	w0, [x3, 1188]
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
	ldr	w0, [x3, 1188]
	add	w0, w0, 2
	str	w0, [x3, 1188]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SetFrmRepeatCount.part.2, .-SetFrmRepeatCount.part.2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	DumpList.part.6, %function
DumpList.part.6:
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
	add	x5, x22, x19, uxtw
	mov	w4, w19
	mov	w3, w21
	mov	x2, x23
	add	x5, x20, x5, lsl 3
	mov	w1, 4185
	mov	w0, 11
	add	w19, w19, 1
	ldr	x5, [x5, 28696]
	ldr	x5, [x5, 40]
	ldr	w6, [x5, 560]
	ldr	w5, [x5, 548]
	bl	dprint_normal
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
	ldr	x2, .LC15
	mov	w1, 4219
	mov	w0, 11
	mov	w19, 0
	bl	dprint_normal
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
	mov	x2, x21
	mov	w1, 4234
	mov	w0, 11
	bne	.L48
	ldr	x3, [x3, 40]
	ldr	w3, [x3, 560]
	bl	dprint_normal
.L48:
	ldr	w0, [x24, 1628]
	add	w19, w19, 1
	cmp	w19, w0
	bcs	.L53
.L58:
	add	x0, x20, x19, uxtw 3
	ldr	x3, [x0, 28960]
	ldrb	w0, [x3]
	cmp	w0, 1
	bne	.L67
	ldr	x3, [x3, 40]
	mov	x2, x22
	mov	w1, 4230
	mov	w0, 11
	add	w19, w19, 1
	ldr	w3, [x3, 560]
	bl	dprint_normal
	ldr	w0, [x24, 1628]
	cmp	w19, w0
	bcc	.L58
.L53:
	ldr	x2, .LC7
	mov	w1, 4242
	mov	w0, 11
	bl	dprint_normal
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L50:
	ldr	x3, [x3, 40]
	mov	x2, x23
	mov	w1, 4226
	mov	w0, 11
	ldr	w3, [x3, 560]
	bl	dprint_normal
	b	.L48
	.p2align 3
.L65:
	ldr	x2, .LC5
	mov	w1, 4191
	mov	w0, 11
	mov	w19, 0
	bl	dprint_normal
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
	mov	x2, x21
	mov	w1, 4206
	mov	w0, 11
	bne	.L40
	ldr	x3, [x3, 40]
	ldr	w3, [x3, 700]
	bl	dprint_normal
.L40:
	ldr	w0, [x24, 1624]
	add	w19, w19, 1
	cmp	w19, w0
	bcs	.L45
.L59:
	add	x0, x20, x19, uxtw 3
	ldr	x3, [x0, 28696]
	ldrb	w0, [x3]
	cmp	w0, 1
	bne	.L68
	ldr	x3, [x3, 40]
	mov	x2, x22
	mov	w1, 4202
	mov	w0, 11
	add	w19, w19, 1
	ldr	w3, [x3, 652]
	bl	dprint_normal
	ldr	w0, [x24, 1624]
	cmp	w19, w0
	bcc	.L59
.L45:
	ldr	x2, .LC7
	mov	w1, 4214
	mov	w0, 11
	bl	dprint_normal
	b	.L38
	.p2align 3
.L42:
	ldr	x3, [x3, 40]
	mov	x2, x23
	mov	w1, 4198
	mov	w0, 11
	ldr	w3, [x3, 560]
	bl	dprint_normal
	b	.L40
	.size	DumpList.part.6, .-DumpList.part.6
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
	.type	CombinePacket.part.12, %function
CombinePacket.part.12:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC17
	mov	w1, 10375
	mov	w0, 8
	bl	dprint_normal
	ldr	x3, [x19, 632]
	mov	w1, 10379
	ldr	x2, .LC19
	mov	w0, 8
	ldp	w6, w4, [x3, 80]
	ldr	w5, [x3, 48]
	ldr	w3, [x3, 52]
	bl	dprint_normal
	ldr	x1, [x19, 632]
	ldr	x3, .LC20
	ldr	w2, [x1, 48]
	ldr	x0, [x1, 72]
	ldr	x3, [x3, 104]
	ldr	x1, [x1, 40]
	sub	x0, x0, x2
	blr	x3
	ldr	x3, [x19, 632]
	mov	w5, 1
	ldr	x2, .LC22
	mov	w1, 10390
	mov	w0, 8
	ldr	w4, [x3, 100]
	ldr	w20, [x3, 68]
	str	w4, [x3, 68]
	ldr	x3, [x19, 632]
	str	wzr, [x3, 60]
	ldr	x3, [x19, 632]
	ldr	w6, [x3, 48]
	ldr	x4, [x3, 72]
	sub	x4, x4, x6
	str	x4, [x3, 40]
	ldr	x3, [x19, 632]
	ldr	w6, [x3, 48]
	ldr	w4, [x3, 84]
	sub	w4, w4, w6
	str	w4, [x3, 52]
	ldr	x3, [x19, 632]
	ldr	w6, [x3, 48]
	ldr	w4, [x3, 80]
	add	w4, w6, w4
	str	w4, [x3, 48]
	ldr	x3, [x19, 632]
	str	w5, [x3, 12]
	ldr	x3, [x19, 632]
	ldp	w4, w3, [x3, 48]
	bl	dprint_normal
	add	x0, x19, 61440
	mov	w1, w20
	ldr	w0, [x0, 1140]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 632]
	str	xzr, [x0, 72]
	ldr	x0, [x19, 632]
	str	wzr, [x0, 92]
	ldr	x0, [x19, 632]
	str	wzr, [x0, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CombinePacket.part.12, .-CombinePacket.part.12
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
	add	x0, x22, 61440
	mov	w1, 1
	mov	w20, -1
	mov	w19, 32
	str	w1, [x0, 1080]
.L72:
	ldr	x5, [x22, 632]
	mov	w4, w20
	ldr	x2, .LC24
	mov	x3, x23
	mov	w1, 289
	mov	w0, 19
	ldr	w6, [x5, 8]
	add	w19, w6, w19
	str	w19, [x5, 8]
	bl	dprint_normal
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
	ldr	x5, [x22, 632]
	mov	w4, w20
	ldr	x2, .LC25
	mov	x3, x23
	mov	w1, 329
	mov	w0, 19
	ldr	w6, [x5, 8]
	add	w19, w6, w19
	str	w19, [x5, 8]
	bl	dprint_normal
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
	add	x0, x22, 61440
	mov	w1, 1
	mov	w20, 2147483647
	mov	w19, 32
	str	w1, [x0, 1080]
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
	ldr	x5, [x21, 632]
	mov	w4, w0
	ldr	x2, .LC26
	mov	x3, x22
	mov	w1, 341
	mov	w0, 19
	ldr	w6, [x5, 8]
	add	w19, w6, w19
	str	w19, [x5, 8]
	bl	dprint_normal
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
	ldr	x6, [x20, 632]
	mov	w4, w0
	ldr	x2, .LC27
	mov	x3, x21
	mov	w1, 352
	mov	w0, 19
	ldr	w5, [x6, 8]
	add	w5, w5, 1
	str	w5, [x6, 8]
	bl	dprint_normal
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
	bls	.L91
	mov	w2, w0
	str	w0, [x1, 3708]
.L91:
	mov	w0, 0
	cbz	w2, .L90
	.p2align 2
.L98:
	add	x3, x20, x0, uxtw 3
	ldr	w5, [x19]
	ldr	x3, [x3, 27896]
	ldr	w4, [x3, 560]
	cmp	w5, w4
	ble	.L93
	ldrb	w3, [x3, 4]
	cbz	w3, .L93
	str	w4, [x19]
	str	w0, [x21]
.L93:
	ldr	w3, [x1, 3708]
	add	w0, w0, 1
	cmp	w3, w0
	bhi	.L98
.L90:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	GetMinPOC, .-GetMinPOC
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
	bls	.L102
	mov	w2, w0
	str	w0, [x1, 3708]
.L102:
	mov	w0, 0
	cbz	w2, .L101
	.p2align 2
.L107:
	add	x3, x20, x0, uxtw 3
	ldr	w4, [x19]
	ldr	x3, [x3, 27896]
	ldr	w3, [x3, 560]
	cmp	w4, w3
	ble	.L104
	str	w3, [x19]
	str	w0, [x21]
.L104:
	ldr	w3, [x1, 3708]
	add	w0, w0, 1
	cmp	w3, w0
	bhi	.L107
.L101:
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
	bls	.L110
	mov	w2, w0
	str	w0, [x1, 3708]
.L110:
	mov	w0, 0
	cbz	w2, .L109
	.p2align 2
.L117:
	add	x3, x20, x0, uxtw 3
	ldr	w5, [x19]
	ldr	x3, [x3, 27896]
	ldr	w4, [x3, 560]
	cmp	w5, w4
	bge	.L112
	ldrb	w3, [x3, 4]
	cbz	w3, .L112
	str	w4, [x19]
	str	w0, [x21]
.L112:
	ldr	w3, [x1, 3708]
	add	w0, w0, 1
	cmp	w3, w0
	bhi	.L117
.L109:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	GetMaxPOC, .-GetMaxPOC
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
	beq	.L137
	tbnz	x1, 0, .L138
.L125:
	mov	w0, 0
	tbnz	x1, 1, .L126
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L138:
	ldr	w0, [x19, 640]
	and	w0, w0, 16776960
	cmp	w0, 65536
	bne	.L125
.L130:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L137:
	ldr	w0, [x19, 592]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L130
	ldr	w0, [x19, 640]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L130
.L126:
	ldr	w0, [x19, 688]
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
	beq	.L155
	tbnz	x1, 0, .L156
.L143:
	mov	w0, 0
	tbnz	x1, 1, .L144
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L156:
	ldr	w0, [x19, 640]
	and	w0, w0, 16776960
	cmp	w0, 256
	bne	.L143
.L148:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L155:
	ldr	w0, [x19, 592]
	and	w0, w0, 16776960
	cmp	w0, 256
	beq	.L148
	ldr	w0, [x19, 640]
	and	w0, w0, 16776960
	cmp	w0, 256
	beq	.L148
.L144:
	ldr	w0, [x19, 688]
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
	cbz	w0, .L164
	sub	w23, w0, #1
	add	x20, x24, 3320
	add	x23, x23, 3488
	mov	w19, 0
	add	x23, x22, x23, lsl 3
	.p2align 2
.L160:
	ldr	x21, [x20]
	add	x20, x20, 8
	mov	x0, x21
	bl	LongTermRefFlg
	add	x1, x22, x19, uxtw 3
	cmp	x20, x23
	cbz	w0, .L159
	add	w19, w19, 1
	str	x21, [x1, 28152]
.L159:
	bne	.L160
.L158:
	ldr	w1, [x24, 3704]
	str	w19, [x24, 3716]
	cmp	w1, w19
	bls	.L157
	.p2align 2
.L167:
	add	x0, x22, x19, uxtw 3
	add	w19, w19, 1
	cmp	w19, w1
	str	xzr, [x0, 28152]
	bne	.L167
.L157:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L164:
	mov	w19, 0
	b	.L158
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
	cbz	w0, .L178
	sub	w23, w0, #1
	add	x20, x24, 3320
	add	x23, x23, 3488
	mov	w19, 0
	add	x23, x22, x23, lsl 3
	.p2align 2
.L174:
	ldr	x21, [x20]
	add	x20, x20, 8
	mov	x0, x21
	bl	ShortTermRefFlg
	add	x1, x22, x19, uxtw 3
	cmp	x20, x23
	cbz	w0, .L173
	add	w19, w19, 1
	str	x21, [x1, 28024]
.L173:
	bne	.L174
.L172:
	ldr	w1, [x24, 3704]
	str	w19, [x24, 3712]
	cmp	w1, w19
	bls	.L171
	.p2align 2
.L181:
	add	x0, x22, x19, uxtw 3
	add	w19, w19, 1
	cmp	w19, w1
	str	xzr, [x0, 28024]
	bne	.L181
.L171:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L178:
	mov	w19, 0
	b	.L172
	.size	UpdateReflist, .-UpdateReflist
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
	ldr	w2, [x20, 568]
	cbz	w0, .L187
	lsl	w2, w2, 1
	add	w2, w2, 1
.L187:
	mvn	w0, w19
	add	w0, w0, w2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetPicNumX, .-GetPicNumX
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
	tbz	x0, 0, .L189
	ldrb	w1, [x19, 2]
	strb	wzr, [x19, 641]
	and	w1, w1, 2
	strb	wzr, [x19, 642]
	strb	w1, [x19, 2]
.L189:
	tbz	x0, 1, .L190
	ldrb	w1, [x19, 2]
	strb	wzr, [x19, 689]
	and	w1, w1, 1
	strb	wzr, [x19, 690]
	strb	w1, [x19, 2]
.L190:
	cmp	w0, 3
	bne	.L191
	strb	wzr, [x19, 594]
	strb	wzr, [x19, 593]
.L191:
	add	x20, x20, 61440
	strb	wzr, [x19, 2]
	ldr	w1, [x19, 544]
	mov	w2, 0
	ldr	w0, [x20, 1140]
	bl	FSP_SetRef
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	UnMarkFrameStoreRef, .-UnMarkFrameStoreRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	SlidingWinMark.part.3, %function
SlidingWinMark.part.3:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	add	x19, x22, 24576
	bl	_mcount
	ldr	w0, [x19, 3708]
	cbz	w0, .L198
	sub	w21, w0, #1
	add	x19, x19, 3320
	add	x21, x21, 3488
	add	x21, x22, x21, lsl 3
	.p2align 2
.L201:
	ldr	x20, [x19]
	add	x19, x19, 8
	mov	x0, x20
	ldrb	w1, [x20, 2]
	cbz	w1, .L200
	bl	ShortTermRefFlg
	cbnz	w0, .L212
.L200:
	cmp	x19, x21
	bne	.L201
.L198:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L212:
	mov	x1, x20
	mov	x0, x22
	bl	UnMarkFrameStoreRef
	mov	x0, x22
	bl	UpdateReflist
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	SlidingWinMark.part.3, .-SlidingWinMark.part.3
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
	cbz	w4, .L213
	ldr	x1, [x20, 28152]
	ldr	w0, [x1, 556]
	cmp	w19, w0
	beq	.L215
	sub	w4, w4, #1
	mov	x0, x20
	add	x4, x20, x4, lsl 3
	b	.L217
	.p2align 3
.L218:
	ldr	x1, [x0, 28160]
	add	x0, x0, 8
	ldr	w3, [x1, 556]
	cmp	w3, w19
	beq	.L215
.L217:
	cmp	x0, x4
	bne	.L218
.L213:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L215:
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
	cbz	w4, .L224
	sub	w6, w4, #1
	add	x0, x0, 3576
	add	x6, x6, 3520
	add	x6, x22, x6, lsl 3
	b	.L228
	.p2align 3
.L226:
	cmp	x0, x6
	beq	.L224
.L228:
	ldr	x4, [x0]
	add	x0, x0, 8
	ldr	w5, [x4, 556]
	cmp	w5, w19
	bne	.L226
	cmp	w20, 1
	beq	.L240
	cmp	w20, 2
	bne	.L226
	ldrb	w1, [x4, 641]
	cmp	w1, wzr
	ccmp	x4, x21, 0, ne
	beq	.L226
.L239:
	mov	x1, x4
	mov	x0, x22
	bl	UnMarkFrameStoreRef
.L224:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L240:
	ldrb	w1, [x4, 689]
	cmp	w1, wzr
	ccmp	x4, x21, 0, ne
	beq	.L226
	b	.L239
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
	cbnz	w0, .L242
	add	x0, x19, 24576
	ldr	w3, [x20, 568]
	sub	w3, w3, #1
	ldr	w1, [x0, 3712]
	sub	w2, w3, w21
	cbz	w1, .L241
	sub	w4, w1, #1
	add	x0, x0, 3448
	add	x4, x4, 3504
	add	x4, x19, x4, lsl 3
	b	.L248
	.p2align 3
.L247:
	cmp	x0, x4
	beq	.L241
.L248:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldr	w3, [x1, 600]
	cmp	w3, w2
	bne	.L247
	ldrb	w3, [x1, 2]
	cmp	w3, 3
	bne	.L247
	ldr	w3, [x1, 592]
	and	w3, w3, 16776960
	cmp	w3, 65536
	bne	.L247
	mov	x0, x19
	bl	UnMarkFrameStoreRef
.L241:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L242:
	add	x1, x19, 24576
	ldr	w0, [x20, 568]
	add	x4, x1, 3448
	mov	w3, 0
	lsl	w0, w0, 1
	ldr	w6, [x1, 3712]
	sub	w2, w0, w21
	cbz	w6, .L241
	.p2align 2
.L262:
	ldr	x1, [x4]
	add	x4, x4, 8
	ldrb	w0, [x1, 2]
	and	w7, w0, 1
	tbz	x0, 0, .L249
	ldr	w5, [x1, 640]
	and	w5, w5, 16776960
	cmp	w5, 65536
	beq	.L274
.L249:
	tbz	x0, 1, .L251
	ldr	w0, [x1, 688]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L275
.L251:
	add	w3, w3, 1
	cmp	w3, w6
	bne	.L262
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L274:
	ldr	w5, [x1, 648]
	cmp	w5, w2
	bne	.L249
	add	x3, x19, x3, uxtw 3
	and	w0, w0, 2
	strb	w0, [x1, 2]
	ldr	x0, [x3, 28024]
	strb	wzr, [x0, 642]
	b	.L273
	.p2align 3
.L275:
	ldr	w0, [x1, 696]
	cmp	w0, w2
	bne	.L251
	add	x3, x19, x3, uxtw 3
	strb	w7, [x1, 2]
	ldr	x0, [x3, 28024]
	strb	wzr, [x0, 690]
.L273:
	ldr	x0, [x3, 28024]
	ldrb	w1, [x0, 592]
	cmp	w1, 3
	ccmp	w1, wzr, 4, ne
	bne	.L252
	strb	wzr, [x0, 594]
	ldr	x0, [x3, 28024]
	strb	wzr, [x0, 593]
	ldr	x0, [x3, 28024]
.L252:
	ldrb	w1, [x0, 2]
	cbnz	w1, .L241
	ldr	w1, [x0, 580]
	add	x3, x19, 61440
	mov	w2, 0
	add	x1, x1, 12288
	add	x19, x19, x1, lsl 2
	str	wzr, [x19, 12264]
	ldr	w1, [x0, 544]
	ldr	w0, [x3, 1140]
	bl	FSP_SetRef
	b	.L241
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
	cbz	w0, .L277
	add	x0, x20, 24576
	mov	w3, 0
	add	x4, x0, 3576
	ldr	w2, [x0, 3716]
	cbz	w2, .L276
	.p2align 2
.L297:
	ldr	x1, [x4]
	add	x4, x4, 8
	ldrb	w0, [x1, 2]
	and	w6, w0, 1
	tbz	x0, 0, .L282
	ldr	w5, [x1, 640]
	and	w5, w5, 16776960
	cmp	w5, 256
	beq	.L309
.L282:
	tbz	x0, 1, .L284
	ldr	w0, [x1, 688]
	and	w0, w0, 16776960
	cmp	w0, 256
	beq	.L310
.L284:
	add	w3, w3, 1
	cmp	w3, w2
	bne	.L297
.L276:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L309:
	ldr	w5, [x1, 644]
	cmp	w19, w5
	bne	.L282
	add	x3, x20, x3, uxtw 3
	and	w0, w0, 2
	strb	w0, [x1, 2]
	ldr	x0, [x3, 28152]
	strb	wzr, [x0, 641]
	b	.L308
	.p2align 3
.L310:
	ldr	w0, [x1, 692]
	cmp	w19, w0
	bne	.L284
	add	x3, x20, x3, uxtw 3
	strb	w6, [x1, 2]
	ldr	x0, [x3, 28152]
	strb	wzr, [x0, 689]
.L308:
	ldr	x0, [x3, 28152]
	ldrb	w1, [x0, 592]
	cmp	w1, 3
	ccmp	w1, wzr, 4, ne
	bne	.L285
	strb	wzr, [x0, 594]
	ldr	x0, [x3, 28152]
	strb	wzr, [x0, 593]
	ldr	x0, [x3, 28152]
.L285:
	ldrb	w1, [x0, 2]
	cbnz	w1, .L276
	ldr	w0, [x0, 580]
	add	x0, x0, 12288
	add	x20, x20, x0, lsl 2
	str	wzr, [x20, 12264]
	b	.L276
	.p2align 3
.L277:
	add	x0, x20, 24576
	ldr	w1, [x0, 3716]
	cbz	w1, .L276
	sub	w2, w1, #1
	add	x0, x0, 3576
	add	x2, x2, 3520
	add	x2, x20, x2, lsl 3
	b	.L288
	.p2align 3
.L287:
	cmp	x0, x2
	beq	.L276
.L288:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldr	w3, [x1, 596]
	cmp	w3, w19
	bne	.L287
	ldrb	w3, [x1, 2]
	cmp	w3, 3
	bne	.L287
	ldr	w3, [x1, 592]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L287
	mov	x0, x20
	bl	UnMarkFrameStoreRef
	b	.L276
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
	cbz	w2, .L312
	ldr	w7, [x0, 3712]
	mov	w3, 0
	add	x4, x0, 3448
	cbz	w7, .L311
	.p2align 2
.L333:
	ldr	x0, [x4]
	ldrb	w5, [x0, 2]
	tbz	x5, 0, .L318
	ldr	w6, [x0, 640]
	and	w6, w6, 16776960
	cmp	w6, 65536
	beq	.L339
.L318:
	tbz	x5, 1, .L321
	ldr	w5, [x0, 688]
	and	w5, w5, 16776960
	cmp	w5, 65536
	beq	.L340
.L321:
	add	w3, w3, 1
	add	x4, x4, 8
	cmp	w3, w7
	bne	.L333
.L311:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L339:
	ldr	w1, [x0, 648]
	cmp	w19, w1
	bne	.L318
	ldrb	w1, [x0, 689]
	cmp	w1, 1
	bne	.L322
	ldr	w1, [x0, 556]
	cmp	w20, w1
	bne	.L321
.L322:
	add	x3, x21, x3, uxtw 3
	str	w20, [x0, 556]
	cmp	w2, 1
	lsl	w0, w20, 1
	csinc	w0, w0, w0, ne
	mov	w1, 1
	ldr	x2, [x3, 28024]
	str	w0, [x2, 644]
	ldr	x0, [x3, 28024]
	strb	w1, [x0, 641]
	ldr	x0, [x3, 28024]
	strb	wzr, [x0, 642]
	ldr	x0, [x3, 28024]
	ldrb	w1, [x0, 592]
	cmp	w1, 3
	ccmp	w1, wzr, 4, ne
	bne	.L311
	ldrb	w2, [x0, 641]
	ldrb	w1, [x0, 689]
	cmp	w1, w2
	bne	.L311
	strb	w1, [x0, 593]
	ldr	x0, [x3, 28024]
	ldrb	w1, [x0, 642]
	strb	w1, [x0, 594]
	b	.L311
	.p2align 3
.L340:
	ldr	w1, [x0, 696]
	cmp	w1, w19
	bne	.L321
	ldrb	w1, [x0, 641]
	cmp	w1, 1
	bne	.L325
	ldr	w1, [x0, 556]
	cmp	w1, w20
	bne	.L321
.L325:
	add	x3, x21, x3, uxtw 3
	str	w20, [x0, 556]
	cmp	w2, 2
	lsl	w0, w20, 1
	csinc	w0, w0, w0, ne
	mov	w1, 1
	ldr	x2, [x3, 28024]
	str	w0, [x2, 692]
	ldr	x0, [x3, 28024]
	strb	w1, [x0, 689]
	ldr	x0, [x3, 28024]
	strb	wzr, [x0, 690]
	ldr	x0, [x3, 28024]
	ldrb	w1, [x0, 592]
	cmp	w1, 3
	ccmp	w1, wzr, 4, ne
	bne	.L311
	ldrb	w2, [x0, 641]
	ldrb	w1, [x0, 689]
	cmp	w1, w2
	bne	.L311
	strb	w1, [x0, 593]
	ldr	x0, [x3, 28024]
	ldrb	w1, [x0, 690]
	strb	w1, [x0, 594]
	b	.L311
	.p2align 3
.L312:
	ldr	w7, [x0, 3712]
	cbz	w7, .L311
	add	x0, x0, 3448
	mov	w4, 0
	b	.L317
	.p2align 3
.L316:
	add	w4, w4, 1
	cmp	w4, w7
	beq	.L311
.L317:
	ldr	x5, [x0]
	add	x0, x0, 8
	ldrb	w6, [x5, 2]
	cmp	w6, 3
	bne	.L316
	ldr	w6, [x5, 592]
	and	w6, w6, 16776960
	cmp	w6, 65536
	bne	.L316
	ldr	w1, [x5, 600]
	cmp	w19, w1
	bne	.L316
	add	x4, x21, x4, uxtw 3
	str	w20, [x5, 556]
	mov	w0, 1
	ldr	x1, [x4, 28024]
	str	w20, [x1, 596]
	ldr	x1, [x4, 28024]
	strb	w0, [x1, 593]
	ldr	x1, [x4, 28024]
	strb	w0, [x1, 641]
	ldr	x1, [x4, 28024]
	strb	w0, [x1, 689]
	ldr	x0, [x4, 28024]
	strb	wzr, [x0, 594]
	ldr	x0, [x4, 28024]
	strb	wzr, [x0, 642]
	ldr	x0, [x4, 28024]
	strb	wzr, [x0, 690]
	b	.L311
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
	cbnz	w0, .L342
	add	x0, x21, 24576
	ldr	w2, [x22, 568]
	sub	w2, w2, #1
	ldr	w4, [x0, 3716]
	sub	w19, w2, w19
	cbz	w4, .L344
	ldr	x1, [x21, 28152]
	ldr	w0, [x1, 556]
	cmp	w20, w0
	beq	.L346
	sub	w4, w4, #1
	mov	x0, x21
	add	x4, x21, x4, lsl 3
	b	.L348
	.p2align 3
.L349:
	ldr	x1, [x0, 28160]
	add	x0, x0, 8
	ldr	w3, [x1, 556]
	cmp	w20, w3
	beq	.L346
.L348:
	cmp	x4, x0
	bne	.L349
.L344:
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
.L342:
	add	x0, x21, 24576
	ldr	w2, [x22, 568]
	lsl	w2, w2, 1
	ldr	w1, [x0, 3712]
	sub	w19, w2, w19
	cbz	w1, .L344
	sub	w5, w1, #1
	add	x0, x0, 3448
	add	x5, x5, 3504
	add	x5, x21, x5, lsl 3
	.p2align 2
.L352:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w3, [x1, 2]
	tbz	x3, 0, .L350
	ldr	w4, [x1, 640]
	and	w4, w4, 16776960
	cmp	w4, 65536
	beq	.L362
.L350:
	tbz	x3, 1, .L351
	ldr	w3, [x1, 688]
	and	w3, w3, 16776960
	cmp	w3, 65536
	beq	.L363
.L351:
	cmp	x0, x5
	bne	.L352
	b	.L344
	.p2align 3
.L362:
	ldr	w2, [x1, 648]
	cmp	w2, w19
	bne	.L350
	mov	w3, w20
	mov	w2, 1
	mov	x0, x21
	bl	UnMarkLTFldByFrmIdx
	b	.L344
	.p2align 3
.L363:
	ldr	w2, [x1, 696]
	cmp	w2, w19
	bne	.L351
	mov	w3, w20
	mov	w2, 2
	mov	x0, x21
	bl	UnMarkLTFldByFrmIdx
	b	.L344
	.p2align 3
.L346:
	mov	x0, x21
	bl	UnMarkFrameStoreRef
	b	.L344
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
	cbz	w0, .L364
	mov	w19, 0
	mov	w2, w20
	b	.L366
	.p2align 3
.L367:
	ldr	w0, [x21, 3716]
	cmp	w0, w19
	bls	.L364
.L371:
	ldr	w2, [x21, 3720]
.L366:
	add	x0, x22, x19, uxtw 3
	add	w19, w19, 1
	ldr	x1, [x0, 28152]
	ldr	w0, [x1, 556]
	cmp	w0, w2
	bcc	.L367
	mov	x0, x22
	bl	UnMarkFrameStoreRef
	ldr	w0, [x21, 3716]
	cmp	w0, w19
	bhi	.L371
.L364:
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
	cbz	w0, .L372
	.p2align 2
.L376:
	add	x1, x20, x19, uxtw 3
	mov	x0, x20
	add	w19, w19, 1
	ldr	x1, [x1, 28024]
	bl	UnMarkFrameStoreRef
	ldr	w0, [x21, 3712]
	cmp	w0, w19
	bhi	.L376
.L372:
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
	cbnz	w2, .L379
	add	x0, x21, 24576
	ldr	w3, [x0, 3716]
	cbz	w3, .L380
	ldr	x1, [x21, 28152]
	ldr	w0, [x1, 556]
	cmp	w19, w0
	beq	.L381
	sub	w3, w3, #1
	mov	x0, x21
	add	x3, x21, x3, lsl 3
	b	.L383
	.p2align 3
.L384:
	ldr	x1, [x0, 28160]
	add	x0, x0, 8
	ldr	w2, [x1, 556]
	cmp	w19, w2
	beq	.L381
.L383:
	cmp	x0, x3
	bne	.L384
.L380:
	strb	wzr, [x20, 5]
	mov	w0, 1
	str	w19, [x20, 572]
	strb	w0, [x20, 4]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L381:
	mov	x0, x21
	bl	UnMarkFrameStoreRef
	strb	wzr, [x20, 5]
	str	w19, [x20, 572]
	mov	w0, 1
	strb	w0, [x20, 4]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L379:
	ldr	x1, [x20, 552]
	mov	w3, w19
	mov	x0, x21
	bl	UnMarkLTFldByFrmIdx
	strb	wzr, [x20, 5]
	str	w19, [x20, 572]
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
	cbz	x1, .L408
	ldr	w0, [x1, 584]
	add	x23, x20, 24576
	add	x24, x20, 61440
	add	x0, x0, 4096
	add	x0, x0, 2980
	str	wzr, [x20, x0, lsl 2]
	ldr	w0, [x23, 3988]
	cmp	w0, wzr
	cset	w2, ne
	sub	w0, w0, w2
	str	w0, [x23, 3988]
	ldr	w1, [x1, 544]
	ldr	w0, [x24, 1140]
	bl	FSP_GetLogicFs
	cbz	x0, .L394
	ldr	w0, [x0, 20]
	cmp	w0, 3
	beq	.L395
	ldr	x1, [x22, 27896]
	mov	w2, 0
	ldr	w0, [x24, 1140]
	ldr	w1, [x1, 544]
	bl	FSP_SetDisplay
.L395:
	ldr	x1, [x22, 27896]
	mov	w2, 0
	ldr	w0, [x24, 1140]
	ldr	w1, [x1, 544]
	bl	FSP_SetRef
.L394:
	ldr	x0, [x22, 27896]
	mov	w1, -1
	strb	wzr, [x0, 1]
	ldr	x0, [x22, 27896]
	strb	wzr, [x0, 4]
	ldr	x0, [x22, 27896]
	strb	wzr, [x0, 2]
	ldr	x0, [x22, 27896]
	str	w1, [x0, 544]
	ldr	w2, [x23, 3708]
	add	w2, w2, w1
	cmp	w19, w2
	bcs	.L397
	.p2align 2
.L405:
	add	w0, w19, 1
	add	x1, x20, x21, lsl 3
	mov	w19, w0
	cmp	w0, w2
	mov	x21, x0
	add	x0, x20, x0, lsl 3
	ldr	x0, [x0, 27896]
	str	x0, [x1, 27896]
	bne	.L405
.L397:
	add	x20, x20, x2, uxtw 3
	str	xzr, [x20, 27896]
	str	w2, [x23, 3708]
.L390:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L408:
	ldr	x3, .LC30
	mov	w4, w21
	ldr	x2, .LC32
	mov	w1, 1207
	mov	w0, 1
	bl	dprint_normal
	b	.L390
	.size	RemoveFrameStoreOutDPB, .-RemoveFrameStoreOutDPB
	.align	3
.LC30:
	.xword	.LANCHOR0
	.align	3
.LC32:
	.xword	.LC31
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
	cbz	x22, .L419
	add	x0, x22, 24576
	ldr	w23, [x0, 3708]
	cbz	w23, .L418
	mov	w21, 0
	mov	w20, 0
	add	x24, x22, 61440
	mov	w25, -1
	b	.L417
	.p2align 3
.L428:
	ldrb	w1, [x0, 4]
	cbnz	w1, .L415
	ldr	w1, [x0, 736]
	cmp	w1, 1
	beq	.L415
	strb	wzr, [x0, 1]
	mov	w1, w21
	mov	x0, x22
	add	w20, w20, 1
	bl	RemoveFrameStoreOutDPB
	cmp	w23, w20
	beq	.L418
	.p2align 2
.L417:
	add	x19, x22, x21, uxtw 3
	ldr	w0, [x24, 1140]
	ldr	x1, [x19, 27896]
	ldr	w1, [x1, 544]
	bl	FSP_GetLogicFs
	cbz	x0, .L412
	ldrsb	w1, [x0]
	cbnz	w1, .L413
	ldr	w0, [x0, 20]
	cmp	w0, wzr
	ccmp	w0, 3, 4, ne
	bne	.L413
	ldr	x0, [x19, 27896]
	ldrb	w1, [x0, 2]
	cbz	w1, .L427
.L414:
	str	w25, [x0, 544]
	ldr	x0, [x19, 27896]
	strb	wzr, [x0, 2]
.L412:
	ldr	x0, [x19, 27896]
	ldr	w1, [x0, 736]
	cmp	w1, 1
	cset	w1, eq
	strb	w1, [x0, 4]
.L413:
	ldr	x0, [x19, 27896]
	ldrb	w1, [x0, 2]
	cbz	w1, .L428
.L415:
	add	w20, w20, 1
	add	w21, w21, 1
	cmp	w23, w20
	bne	.L417
.L418:
	mov	w0, 0
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L427:
	ldr	w1, [x0, 544]
	mov	w2, 0
	ldr	w0, [x24, 1140]
	bl	FSP_SetRef
	ldr	x0, [x19, 27896]
	b	.L414
	.p2align 3
.L419:
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
	add	x0, x20, 61440
	ldr	w1, [x0, 60]
	cbnz	w1, .L430
	ldr	w1, [x19, 736]
	cmp	w1, 1
	beq	.L431
	ldr	w1, [x0, 1068]
	cbz	w1, .L462
.L431:
	mov	w1, 1
	str	w1, [x0, 60]
.L430:
	ldr	w0, [x0, 1140]
	ldr	w1, [x19, 544]
	bl	FSP_GetLogicFs
	cbz	x0, .L433
	ldr	w4, [x0, 20]
	cmp	w4, wzr
	ccmp	w4, 3, 4, ne
	beq	.L434
	ldrb	w3, [x19, 1]
	ldrb	w4, [x19]
	cbz	w3, .L437
	cmp	w4, 1
	beq	.L437
	ldr	w1, [x19]
	mov	w2, 50332416
	and	w1, w1, -16711936
	cmp	w1, w2
	beq	.L463
	cmp	w3, 1
	beq	.L464
	cmp	w3, 2
	beq	.L465
.L441:
	ldr	x1, [x20]
	ldr	w3, [x0, 152]
	mov	w0, 0
	ldr	w4, [x1, 4]
	cmp	w3, w4
	bls	.L455
	ldr	w1, [x1, 656]
	cbnz	w1, .L455
	ldr	x2, .LC47
	mov	w1, 1361
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L455
	.p2align 3
.L434:
	ldr	w1, [x19, 736]
	cmp	w1, 1
	beq	.L466
.L445:
	ldr	x3, .LC33
	mov	w1, 1327
	ldr	x2, .LC37
	mov	w0, 1
	add	x3, x3, 24
	bl	dprint_normal
	mov	w0, -3
.L455:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L462:
	ldr	x1, [x20]
	ldr	w1, [x1, 12]
	cbnz	w1, .L431
	mov	w0, -1
	b	.L455
	.p2align 3
.L465:
	ldrb	w4, [x19, 3]
	tbz	x4, 1, .L441
	ldr	x2, .LC45
	mov	w1, 1354
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L455
	.p2align 3
.L466:
	mov	w1, 2
	str	w1, [x19, 736]
	ldr	w4, [x0, 20]
	b	.L445
	.p2align 3
.L433:
	ldr	w0, [x19, 736]
	cmp	w0, 1
	bne	.L443
	mov	w0, 2
	str	w0, [x19, 736]
.L443:
	ldr	x3, .LC33
	mov	w1, 1323
	ldr	x2, .LC35
	mov	w0, 1
	add	x3, x3, 24
	bl	dprint_normal
	mov	w0, -3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L464:
	ldrb	w4, [x19, 3]
	tbz	x4, 0, .L441
	ldr	x2, .LC43
	mov	w1, 1348
	mov	w0, w3
	bl	dprint_normal
	mov	w0, -1
	b	.L455
.L437:
	ldr	x2, .LC39
	mov	w1, 1336
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L455
.L463:
	ldrb	w4, [x19, 3]
	mov	w1, 1342
	ldr	x2, .LC41
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L455
	.size	CheckFrameStore, .-CheckFrameStore
	.align	3
.LC33:
	.xword	.LANCHOR0
	.align	3
.LC35:
	.xword	.LC34
	.align	3
.LC37:
	.xword	.LC36
	.align	3
.LC39:
	.xword	.LC38
	.align	3
.LC41:
	.xword	.LC40
	.align	3
.LC43:
	.xword	.LC42
	.align	3
.LC45:
	.xword	.LC44
	.align	3
.LC47:
	.xword	.LC46
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
	mov	x22, x0
	mov	x0, x30
	mov	x20, x1
	add	x23, x22, 61440
	bl	_mcount
	add	x26, x22, 24576
	add	x0, x22, 20480
	mov	w1, 2208
	ldr	x5, [x22, 14968]
	ldrb	w3, [x20, 164]
	ldr	w2, [x0, 1592]
	mov	w0, 4000
	ldr	x6, [x22, 14960]
	and	w4, w3, -4
	mov	w3, w4
	umull	x1, w2, w1
	add	x1, x5, x1
	ldrb	w5, [x20, 1]
	cmp	w5, 3
	ldr	w2, [x1, 28]
	strb	w4, [x20, 164]
	ldr	w1, [x23, 68]
	umull	x0, w2, w0
	str	w1, [x20, 72]
	add	x0, x6, x0
	bhi	.L468
	ldr	x1, .LC48
	ldrh	w1, [x1,w5,uxtw #1]
	adr	x2, .Lrtx470
	add	x1, x2, w1, sxth #2
	br	x1
.Lrtx470:
	.section	.rodata
	.align	0
	.align	2
.L470:
	.2byte	(.L469 - .Lrtx470) / 4
	.2byte	(.L471 - .Lrtx470) / 4
	.2byte	(.L472 - .Lrtx470) / 4
	.2byte	(.L469 - .Lrtx470) / 4
	.text
	.p2align 3
.L469:
	ldrb	w1, [x20, 592]
	cbnz	w1, .L473
	ldr	w1, [x20, 576]
	mov	w7, 3
	ldr	w8, [x20, 572]
	ldr	w6, [x20, 660]
	ldr	w4, [x20, 708]
	str	w1, [x20, 104]
.L474:
	ldr	w2, [x20, 652]
	ldr	w1, [x20, 700]
	cmp	w2, w1
	beq	.L525
	cset	w1, le
.L484:
	add	x26, x22, 24576
	ldrb	w2, [x26, 3220]
	cmp	w2, 3
	beq	.L498
	cmp	w2, 4
	mov	w2, 0
	csel	w2, w1, w2, ne
.L485:
	mov	w1, w3
	bfi	w1, w8, 0, 2
	strb	w1, [x20, 164]
	ldrb	w1, [x20, 165]
	stp	w6, w4, [x20, 32]
	bfi	w1, w2, 4, 2
	bfi	w1, w7, 2, 2
	strb	w1, [x20, 165]
.L468:
	ldrb	w1, [x0, 18]
	mov	w2, 0
	str	w1, [x20, 508]
	str	w1, [x20, 512]
	ldrb	w1, [x0, 22]
	cbz	w1, .L486
	ldr	w2, [x0, 3332]
.L486:
	mov	w0, 1
	str	w2, [x20, 520]
	str	w0, [x20, 516]
	ldr	x0, [x22]
	ldr	w0, [x0, 12]
	cbz	w0, .L487
	ldrb	w0, [x20, 592]
	cbz	w0, .L526
.L487:
	ldr	x0, [x20, 216]
	cmn	x0, #1
	beq	.L489
	ldr	w0, [x26, 3708]
	sub	w0, w0, #1
	cmp	w0, 14
	bhi	.L489
	mov	w25, -1
	mov	x24, -2
	mov	w19, 0
	.p2align 2
.L492:
	add	x21, x22, x19, sxtw 3
	ldr	x0, [x21, 27896]
	cbz	x0, .L491
	ldr	w1, [x0, 544]
	ldr	w0, [x23, 1140]
	bl	FSP_GetLogicFs
	cbz	x0, .L491
	ldr	w0, [x0, 20]
	cmp	w0, 3
	ccmp	w0, wzr, 4, ne
	beq	.L491
	ldr	x0, [x21, 27896]
	ldr	x0, [x0, 216]
	cmp	x0, x24
	bcs	.L491
	mov	w25, w19
	mov	x24, x0
	.p2align 2
.L491:
	ldr	w0, [x26, 3708]
	add	w19, w19, 1
	cmp	w0, 15
	ccmp	w0, w19, 0, ls
	bhi	.L492
	cmn	w25, #1
	beq	.L489
	ldr	x1, [x20, 216]
	cmp	x1, x24
	bhi	.L527
.L489:
	ldrsb	w0, [x26, 3184]
	cbz	w0, .L493
	ldr	w0, [x26, 3200]
	cmp	w0, 3
	beq	.L528
	cmp	w0, 4
	beq	.L529
	cmp	w0, 5
	beq	.L530
	str	wzr, [x20, 160]
	mov	w1, 1606
	ldr	x2, .LC52
	mov	w0, 0
	ldr	w3, [x26, 3200]
	bl	dprint_normal
	.p2align 2
.L493:
	ldr	w1, [x20, 544]
	ldr	w0, [x23, 1140]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L467
	ldr	w4, [x0, 68]
	add	x3, x20, 8
	str	w4, [x20, 76]
	mov	x2, 536
	ldrb	w5, [x20, 166]
	mov	x1, x3
	ldrb	w4, [x0, 158]
	ldr	x6, .LC53
	ubfx	x4, x4, 1, 1
	bfi	w5, w4, 1, 1
	strb	w5, [x20, 166]
	ldrb	w5, [x0, 420]
	strb	w5, [x20, 428]
	ldr	x4, [x6, 104]
	ldr	w5, [x0, 432]
	str	w5, [x20, 440]
	ldr	w5, [x0, 436]
	str	w5, [x20, 444]
	ldr	w5, [x0, 424]
	str	w5, [x20, 432]
	ldr	w5, [x0, 428]
	str	w5, [x20, 436]
	ldr	w5, [x0, 452]
	str	w5, [x20, 460]
	blr	x4
	ldr	w0, [x20, 624]
	str	w0, [x19, 232]
.L467:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L527:
	ldr	w0, [x23, 1140]
	mov	x2, x24
	bl	IsPtsRewind
	cbnz	w0, .L489
	ldr	x2, .LC50
	mov	w1, 1414
	ldr	w3, [x23, 1140]
	mov	x5, x24
	ldr	x4, [x20, 216]
	mov	w0, 24
	add	x22, x22, x25, sxtw 3
	bl	dprint_normal
	ldr	x0, [x22, 27896]
	ldr	x1, [x20, 216]
	str	x1, [x0, 216]
	str	x24, [x20, 216]
	b	.L489
	.p2align 3
.L526:
	cmp	w5, 3
	bne	.L487
	ldrb	w0, [x20, 165]
	and	w0, w0, -4
	strb	w0, [x20, 165]
	b	.L487
	.p2align 3
.L471:
	ldrb	w2, [x20, 165]
	mov	w7, 1
	ldr	w6, [x20, 572]
	mov	w1, w4
	bfi	w2, w7, 2, 2
	ldr	w4, [x20, 576]
	ldr	w3, [x20, 660]
	bfi	w1, w6, 0, 2
	ldr	w7, [x20, 672]
	mov	w6, 3
	strb	w2, [x20, 165]
	add	x26, x22, 24576
	strb	w1, [x20, 164]
	stp	w3, w6, [x20, 32]
	str	w4, [x20, 104]
	str	w7, [x20, 624]
	b	.L468
	.p2align 3
.L472:
	ldrb	w2, [x20, 165]
	mov	w7, 2
	ldr	w6, [x20, 572]
	mov	w1, w4
	bfi	w2, w7, 2, 2
	ldr	w4, [x20, 576]
	ldr	w7, [x20, 708]
	bfi	w1, w6, 0, 2
	ldr	w3, [x20, 720]
	mov	w6, 3
	strb	w2, [x20, 165]
	add	x26, x22, 24576
	strb	w1, [x20, 164]
	stp	w6, w7, [x20, 32]
	str	w4, [x20, 104]
	str	w3, [x20, 624]
	b	.L468
	.p2align 3
.L528:
	mov	w0, 1
	str	w0, [x20, 160]
	b	.L493
	.p2align 3
.L530:
	mov	w0, 3
	str	w0, [x20, 160]
	b	.L493
	.p2align 3
.L473:
	ldr	w2, [x20, 656]
	ldr	w1, [x23, 1136]
	ldr	w9, [x20, 704]
	cmp	w2, w1
	bhi	.L531
	cmp	w1, w9
	bcc	.L478
.L476:
	ldr	w1, [x20, 576]
	mov	w7, 3
	ldr	w8, [x20, 572]
	ldr	w6, [x20, 660]
	ldr	w4, [x20, 708]
	str	w1, [x20, 104]
.L479:
	ldrb	w1, [x20, 3]
	cmp	w1, 1
	beq	.L532
	cmp	w1, 2
	beq	.L533
.L481:
	ldr	w2, [x20, 672]
	ldr	w1, [x20, 720]
	stp	w6, w4, [x20, 32]
	add	w1, w2, w1
	add	w1, w1, w1, lsr 31
	asr	w1, w1, 1
	str	w1, [x20, 624]
	b	.L474
.L478:
	ldr	w8, [x20, 660]
	mov	w7, 1
	ldr	w4, [x20, 708]
	mov	w6, w8
	str	w2, [x20, 104]
	b	.L479
	.p2align 3
.L529:
	mov	w0, 2
	str	w0, [x20, 160]
	b	.L493
.L498:
	mov	w2, 1
	b	.L485
.L525:
	mov	x1, 720
	ldr	x2, [x20, 40]
	movk	x1, 0x1e0, lsl 32
	cmp	x2, x1
	cset	w1, ne
	b	.L484
.L531:
	cmp	w1, w9
	bcc	.L476
	ldr	w8, [x20, 708]
	mov	w7, 2
	ldr	w6, [x20, 660]
	mov	w4, w8
	str	w9, [x20, 104]
	b	.L479
.L532:
	mov	w8, w4
	mov	w7, 2
	str	w9, [x20, 104]
	b	.L481
.L533:
	mov	w8, w6
	mov	w7, 1
	str	w2, [x20, 104]
	b	.L481
	.size	GetImagePara, .-GetImagePara
	.align	3
.LC48:
	.xword	.L470
	.align	3
.LC50:
	.xword	.LC49
	.align	3
.LC52:
	.xword	.LC51
	.align	3
.LC53:
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
	ldr	w0, [x0, 632]
	add	w0, w0, 2047
	cmp	w0, 4095
	bls	.L535
	mov	x1, x20
	mov	x0, x19
	bl	SetFrmRepeatCount.part.2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L535:
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
	ldrb	w4, [x19, 593]
	mov	w6, 1
	ldrb	w3, [x19, 594]
	mov	w5, 2
	ldr	w2, [x19, 608]
	ldr	w1, [x19, 612]
	ldr	x0, [x19, 632]
	strb	w4, [x19, 641]
	strb	w3, [x19, 642]
	strb	w6, [x19, 640]
	strb	w4, [x19, 689]
	strb	w3, [x19, 690]
	strb	w5, [x19, 688]
	str	w2, [x19, 656]
	str	w1, [x19, 660]
	str	x0, [x19, 680]
	str	w2, [x19, 704]
	str	w1, [x19, 708]
	str	x0, [x19, 728]
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
	ldr	w1, [x19, 652]
	mov	w5, 3
	ldr	w3, [x19, 656]
	ldr	w2, [x19, 700]
	ldr	w0, [x19, 704]
	cmp	w1, w2
	ldr	x4, [x19, 680]
	add	w0, w3, w0
	ldrb	w3, [x19, 689]
	csel	w1, w1, w2, le
	lsr	w0, w0, 1
	strb	w5, [x19, 592]
	str	w1, [x19, 560]
	str	w1, [x19, 604]
	str	w0, [x19, 608]
	str	x4, [x19, 632]
	cbz	w3, .L539
	ldrb	w1, [x19, 641]
	cbz	w1, .L539
	mov	w1, 1
	strb	w1, [x19, 593]
.L541:
	mov	w2, 0
.L542:
	ldr	w1, [x19, 660]
	strb	w2, [x19, 594]
	cbz	w1, .L543
	ldr	w2, [x19, 708]
	cbz	w2, .L545
	cmp	w1, w2
	csel	w1, w1, w2, cs
.L543:
	str	w1, [x19, 572]
	str	w0, [x19, 576]
	str	w1, [x19, 612]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L539:
	ldr	w1, [x19, 688]
	strb	wzr, [x19, 593]
	tst	w1, 16776960
	beq	.L541
	ldr	w1, [x19, 640]
	mov	w2, 1
	tst	w1, 16776960
	bne	.L542
	b	.L541
	.p2align 3
.L545:
	mov	w1, 0
	str	w0, [x19, 576]
	str	w1, [x19, 572]
	str	w1, [x19, 612]
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
	cbz	x22, .L580
	cmp	w19, 1
	beq	.L560
	cmp	w19, 2
	beq	.L561
	ldr	w23, [x22, 652]
	ldr	w24, [x22, 700]
.L562:
	add	x21, x20, 24576
	ldr	w2, [x21, 3984]
	cbz	w2, .L571
	ldr	w0, [x21, 3728]
	cbz	w0, .L581
	add	x0, x21, 3732
	mov	w19, 0
	b	.L565
	.p2align 3
.L569:
	ldr	w1, [x0], 4
	cbz	w1, .L563
.L565:
	add	w19, w19, 1
	cmp	w19, w2
	bne	.L569
.L571:
	mov	w0, -1
.L575:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L561:
	ldr	w23, [x22, 700]
	mov	w24, w23
	b	.L562
.L581:
	mov	w19, 0
	.p2align 2
.L563:
	add	x0, x20, 61440
	ldr	w1, [x22, 544]
	ldr	w0, [x0, 1140]
	bl	FSP_GetLogicFs
	cbz	x0, .L566
	ldr	x1, [x0, 24]
	cbz	x1, .L566
	add	x20, x20, x19, uxtw 2
	mov	w1, 1
	add	x20, x20, 24576
	mov	w5, 16
	ldr	x2, .LC59
	mov	w4, w19
	str	w1, [x20, 3728]
	mov	w1, 1884
	ldr	x0, [x0, 24]
	ldr	w0, [x0, 36]
	str	w0, [x20, 3792]
	mov	w0, 11
	str	w23, [x20, 3856]
	str	w24, [x20, 3920]
	ldr	w3, [x21, 3988]
	cmp	w3, 15
	csinc	w3, w5, w3, hi
	str	w3, [x21, 3988]
	ldr	w3, [x22, 96]
	bl	dprint_normal
	str	w19, [x22, 584]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L560:
	ldr	w23, [x22, 652]
	mov	w24, w23
	b	.L562
.L566:
	ldrb	w4, [x22, 2]
	mov	x5, x0
	ldr	x2, .LC61
	mov	x6, 0
	ldr	w3, [x22, 544]
	mov	w1, 1892
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L575
.L580:
	mov	w4, 1850
	ldr	x3, .LC55
	ldr	x2, .LC57
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L575
	.size	GetAPC, .-GetAPC
	.align	3
.LC55:
	.xword	.LC54
	.align	3
.LC57:
	.xword	.LC56
	.align	3
.LC59:
	.xword	.LC58
	.align	3
.LC61:
	.xword	.LC60
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
	bne	.L582
	mov	x0, x19
	bl	SlidingWinMark.part.3
.L582:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SlidingWinMark, .-SlidingWinMark
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
	bcs	.L590
.L585:
	add	x19, x19, 57344
	ldr	w0, [x19, 2216]
	strb	wzr, [x19, 1644]
	cbz	w0, .L584
	mov	w0, 1
	strb	w0, [x19, 1645]
.L584:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L590:
	ldr	x1, [x19, 27896]
	mov	x0, x19
	bl	UnMarkFrameStoreRef
	mov	w1, 0
	mov	x0, x19
	bl	RemoveFrameStoreOutDPB
	b	.L585
	.size	SimpleSlideDPB, .-SimpleSlideDPB
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
	cbz	x20, .L600
	ldr	x23, .LC65
	add	x19, x20, 40
	strb	wzr, [x20, 1]
	add	x22, x20, 104
	strb	wzr, [x20, 4]
.L595:
	ldr	x1, [x19]
	mov	w0, w21
	cbz	x1, .L594
	ldr	w1, [x19, 28]
	bl	SM_ReleaseStreamSeg
	ldr	w4, [x19, 8]
	mov	x2, x23
	ldr	x3, [x19]
	mov	w1, 3285
	mov	w0, 8
	bl	dprint_normal
	str	xzr, [x19]
	str	wzr, [x19, 8]
	str	wzr, [x19, 20]
.L594:
	add	x19, x19, 32
	cmp	x19, x22
	bne	.L595
	strb	wzr, [x20]
	str	wzr, [x20, 12]
.L591:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L600:
	mov	w4, 3272
	ldr	x3, .LC62
	ldr	x2, .LC63
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	b	.L591
	.size	ReleaseNAL, .-ReleaseNAL
	.align	3
.LC62:
	.xword	.LC54
	.align	3
.LC63:
	.xword	.LC56
	.align	3
.LC65:
	.xword	.LC64
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
	cbz	x1, .L602
	add	x0, x19, 61440
	ldr	w0, [x0, 1140]
	bl	ReleaseNAL
	str	xzr, [x19, 632]
.L602:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ClearCurrNal, .-ClearCurrNal
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
	add	x19, x20, 61440
	bl	_mcount
	ldr	x2, .LC67
	mov	w1, 405
	mov	w0, 1
	bl	dprint_normal
	ldr	x1, [x20, 632]
	cbz	x1, .L607
	ldr	w0, [x19, 1140]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L607:
	ldr	w1, [x19, 1096]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 1096]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ClearCurrSlice, .-ClearCurrSlice
	.align	3
.LC67:
	.xword	.LC66
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
	add	x21, x20, 61440
	add	x20, x20, 12288
	bl	_mcount
	add	x20, x20, 2600
	b	.L613
	.p2align 3
.L612:
	add	x19, x19, 104
	cmp	x19, x20
	beq	.L615
.L613:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L612
	ldr	w0, [x21, 1140]
	mov	x1, x19
	add	x19, x19, 104
	bl	ReleaseNAL
	cmp	x19, x20
	bne	.L613
.L615:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	ClearAllNal, .-ClearAllNal
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
	add	x20, x19, 57344
	add	x21, x19, 61440
	add	x19, x20, 2984
	add	x20, x20, 4072
	bl	_mcount
	.p2align 2
.L618:
	ldr	x0, [x19]
	mov	x1, x0
	cbz	x0, .L617
	ldr	w0, [x21, 1140]
	bl	ReleaseNAL
	str	xzr, [x19]
.L617:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L618
	str	wzr, [x21, 1064]
	mov	w0, 0
	str	wzr, [x21, 1124]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	ClearAllSlice, .-ClearAllSlice
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
	mov	w1, 1048576
	str	w7, [x0, 3240]
	stp	w3, w2, [x4, 176]
	stp	wzr, wzr, [x4, 184]
	str	w1, [x0, 3264]
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H264_ClearCurrPic, .-H264_ClearCurrPic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_ArrangeVahbMem
	.type	H264_ArrangeVahbMem, %function
H264_ArrangeVahbMem:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w22, w1
	mov	w21, w2
	bl	_mcount
	ldr	x0, .LC70
	add	x4, x20, 24576
	mov	x2, 36
	mov	w1, 0
	ldr	x3, [x0, 96]
	add	x0, x29, 56
	ldr	w19, [x4, 3704]
	blr	x3
	add	w19, w19, 1
	add	x0, x20, 16384
	ldr	x3, [x20]
	add	x4, x20, 61440
	mov	w2, 0
	add	x1, x29, 56
	str	wzr, [x29, 56]
	ldr	w5, [x0, 1868]
	ldr	w0, [x0, 1872]
	stp	w5, w0, [x29, 72]
	ldr	w0, [x4, 1140]
	mov	w5, 8
	ldr	w4, [x3, 16]
	stp	w22, w21, [x29, 64]
	cmp	w4, 24
	strb	w5, [x29, 61]
	csinc	w4, w19, wzr, ne
	str	w4, [x29, 80]
	ldr	w3, [x3, 16]
	cmp	w3, 24
	csinc	w19, w19, wzr, ne
	str	w19, [x29, 84]
	bl	FSP_ArrangeFsPool
	cmp	w0, 2
	beq	.L633
	mov	w1, 1
	cbnz	w0, .L634
.L628:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, w1
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L634:
	ldr	x3, .LC71
	mov	w1, 3329
	ldr	x2, .LC73
	mov	w0, 0
	bl	dprint_normal
	mov	w1, -20
	b	.L628
.L633:
	add	x0, x20, 8
	bl	ResetVoQueue
	mov	w1, -20
	b	.L628
	.size	H264_ArrangeVahbMem, .-H264_ArrangeVahbMem
	.align	3
.LC70:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC71:
	.xword	.LANCHOR1
	.align	3
.LC73:
	.xword	.LC72
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
	add	x7, x19, 20480
	ldrb	w3, [x7, 1584]
	cmp	w3, 1
	beq	.L654
	cbz	w3, .L638
	cmp	w3, 2
	mov	w0, 0
	bne	.L666
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L666:
	ldr	x2, .LC75
	mov	w1, 3357
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x19
	bl	ClearCurrSlice
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L638:
	mov	w11, 1
.L637:
	add	x6, x19, 28672
	add	x7, x7, 1624
	add	x6, x6, 24
	mov	x8, 0
	mov	x9, 0
	mov	w3, 0
	mov	w13, 1
	add	x12, x19, 57344
	.p2align 2
.L650:
	ldr	w0, [x7]
	cbz	w0, .L640
	ldr	x1, [x6]
	cbnz	x1, .L667
	sub	w2, w0, #1
	add	x10, x8, 3588
	add	x0, x6, 8
	add	x5, x10, x2, uxtw
	add	x5, x19, x5, lsl 3
	b	.L643
	.p2align 3
.L644:
	ldr	x4, [x0], 8
	cbnz	x4, .L641
.L643:
	cmp	x0, x5
	bne	.L644
	ldr	x0, [x19]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L668
	ldr	x9, [x12, 2192]
	add	x9, x9, 592
.L651:
	add	x2, x10, x2, uxtw
	mov	x0, x6
	add	x2, x19, x2, lsl 3
	cbz	x1, .L669
	.p2align 2
.L646:
	add	x0, x0, 8
	cmp	x0, x2
	beq	.L647
.L670:
	ldr	x1, [x0]
	cbnz	x1, .L646
.L669:
	str	x9, [x0]
	add	x0, x0, 8
	cmp	x0, x2
	bne	.L670
	.p2align 2
.L647:
	add	w3, w3, 1
	add	x7, x7, 4
	cmp	w3, w11
	add	x6, x6, 264
	add	x8, x8, 33
	bcc	.L650
.L672:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L640:
	ldr	x0, [x19]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L671
	str	w13, [x7]
	add	w3, w3, 1
	cmp	w3, w11
	add	x7, x7, 4
	ldr	x0, [x12, 2192]
	add	x8, x8, 33
	add	x0, x0, 592
	str	x0, [x6]
	add	x6, x6, 264
	bcc	.L650
	b	.L672
.L667:
	sub	w2, w0, #1
	mov	x4, x1
	add	x10, x8, 3588
	.p2align 2
.L641:
	mov	x9, x4
	b	.L651
.L654:
	mov	w11, 2
	b	.L637
.L671:
	ldr	x2, .LC79
	mov	w4, 0
	mov	w1, 3412
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x19
	bl	ClearCurrSlice
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L668:
	ldr	x2, .LC77
	mov	w4, 0
	mov	x3, x9
	mov	w1, 3389
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x19
	bl	ClearCurrSlice
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
	.size	RepairList, .-RepairList
	.align	3
.LC75:
	.xword	.LC74
	.align	3
.LC77:
	.xword	.LC76
	.align	3
.LC79:
	.xword	.LC78
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
	cbz	w1, .L674
	ldrb	w0, [x0, 1586]
	mov	w5, 2
	cmp	w0, wzr
	csinc	w5, w5, wzr, ne
.L674:
	add	x0, x20, 24576
	ldr	w2, [x0, 3712]
	cbz	w2, .L682
	sub	w2, w2, #1
	add	x0, x0, 3448
	add	x2, x2, 3504
	add	x4, x20, x2, lsl 3
	b	.L679
	.p2align 3
.L692:
	cmp	w3, 3
	beq	.L691
.L677:
	add	x0, x0, 8
	cmp	x0, x4
	beq	.L682
.L679:
	ldr	x2, [x0]
	ldrb	w3, [x2, 2]
	cbz	w5, .L692
	tbz	x3, 0, .L678
	ldr	w6, [x2, 640]
	and	w6, w6, 16776960
	cmp	w6, 65536
	beq	.L693
.L678:
	tbz	x3, 1, .L677
	ldr	w3, [x2, 688]
	and	w3, w3, 16776960
	cmp	w3, 65536
	bne	.L677
	ldr	w1, [x2, 696]
	cmp	w19, w1
	bne	.L677
	add	x0, x2, 688
	b	.L675
	.p2align 3
.L693:
	ldr	w1, [x2, 648]
	cmp	w1, w19
	bne	.L678
	add	x0, x2, 640
	b	.L675
	.p2align 3
.L691:
	ldr	w3, [x2, 592]
	and	w3, w3, 16776960
	cmp	w3, 65536
	bne	.L677
	ldr	w1, [x2, 600]
	cmp	w19, w1
	bne	.L677
	add	x0, x2, 592
	b	.L675
	.p2align 3
.L682:
	mov	x0, 0
.L675:
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
	cbz	w1, .L695
	ldrb	w0, [x0, 1586]
	mov	w5, 2
	cmp	w0, wzr
	csinc	w5, w5, wzr, ne
.L695:
	add	x0, x20, 24576
	ldr	w2, [x0, 3716]
	cbz	w2, .L703
	sub	w2, w2, #1
	add	x0, x0, 3576
	add	x2, x2, 3520
	add	x4, x20, x2, lsl 3
	b	.L700
	.p2align 3
.L713:
	cmp	w3, 3
	beq	.L712
.L698:
	add	x0, x0, 8
	cmp	x0, x4
	beq	.L703
.L700:
	ldr	x2, [x0]
	ldrb	w3, [x2, 2]
	cbz	w5, .L713
	tbz	x3, 0, .L699
	ldr	w6, [x2, 640]
	and	w6, w6, 16776960
	cmp	w6, 256
	beq	.L714
.L699:
	tbz	x3, 1, .L698
	ldr	w3, [x2, 688]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L698
	ldr	w1, [x2, 692]
	cmp	w19, w1
	bne	.L698
	add	x0, x2, 688
	b	.L696
	.p2align 3
.L714:
	ldr	w1, [x2, 644]
	cmp	w1, w19
	bne	.L699
	add	x0, x2, 640
	b	.L696
	.p2align 3
.L712:
	ldr	w3, [x2, 592]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L698
	ldr	w1, [x2, 596]
	cmp	w19, w1
	bne	.L698
	add	x0, x2, 592
	b	.L696
	.p2align 3
.L703:
	mov	x0, 0
.L696:
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
	ble	.L716
	mov	w1, w2
	.p2align 2
.L717:
	add	x5, x19, x1, sxtw 3
	ldr	x5, [x5, -8]
	str	x5, [x19, w1, sxtw 3]
	sub	w1, w1, #1
	ldr	w5, [x21]
	cmp	w5, w1
	blt	.L717
.L716:
	add	w1, w5, 1
	str	w1, [x21]
	str	x0, [x19, w5, sxtw 3]
	ldr	w0, [x21]
	cmp	w2, w0
	mov	w4, w0
	blt	.L715
	.p2align 2
.L725:
	ldr	x1, [x19, w0, sxtw 3]
	add	w0, w0, 1
	cbz	x1, .L719
	ldrb	w5, [x1, 1]
	cbnz	w5, .L720
	ldr	w5, [x1, 8]
	cmp	w22, w5
	beq	.L719
.L720:
	str	x1, [x19, w4, sxtw 3]
	add	w4, w4, 1
.L719:
	cmp	w2, w0
	bge	.L725
.L715:
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
	ble	.L730
	mov	w1, w2
	.p2align 2
.L731:
	add	x5, x19, x1, sxtw 3
	ldr	x5, [x5, -8]
	str	x5, [x19, w1, sxtw 3]
	sub	w1, w1, #1
	ldr	w5, [x21]
	cmp	w5, w1
	blt	.L731
.L730:
	add	w1, w5, 1
	str	w1, [x21]
	str	x0, [x19, w5, sxtw 3]
	ldr	w0, [x21]
	cmp	w2, w0
	mov	w4, w0
	blt	.L729
	.p2align 2
.L741:
	ldr	x1, [x19, w0, sxtw 3]
	add	w0, w0, 1
	cbz	x1, .L733
	ldrb	w5, [x1, 1]
	cbz	w5, .L734
	ldr	w5, [x1, 4]
	cmp	w22, w5
	beq	.L733
.L734:
	str	x1, [x19, w4, sxtw 3]
	add	w4, w4, 1
.L733:
	cmp	w2, w0
	bge	.L741
.L729:
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
	cbz	w1, .L747
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
.L757:
	cmn	w21, #2
	beq	.L746
	ldr	w3, [x25]
	cmp	w3, 3
	beq	.L746
	add	w24, w21, 1
	mov	w27, w26
	lsl	x24, x24, 2
	mov	x19, 0
	b	.L750
	.p2align 3
.L751:
	ldr	x3, [x29, 104]
	ldr	w3, [x3, x19]
	bl	ReorderLTList
	cmp	x24, x19
	add	x19, x19, 4
	beq	.L746
.L756:
	ldr	w3, [x25, x19]
	cmp	w3, 3
	beq	.L746
.L750:
	cmp	w3, 1
	add	x4, x29, 124
	mov	w2, w21
	mov	x1, x22
	mov	x0, x20
	bhi	.L751
	ldr	w0, [x28, x19]
	cbnz	w3, .L752
	mvn	w0, w0
	add	w27, w27, w0
	add	w0, w27, w23
	cmp	w27, wzr
	csel	w27, w0, w27, lt
.L753:
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
	bne	.L756
.L746:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L752:
	add	w0, w0, 1
	add	w27, w27, w0
	cmp	w23, w27
	sub	w0, w27, w23
	csel	w27, w0, w27, le
	b	.L753
	.p2align 3
.L747:
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
	b	.L757
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
	beq	.L765
	ldrb	w1, [x19, 796]
	cbnz	w1, .L777
.L768:
	ldr	w1, [x19, 1636]
	cmp	w0, 1
	add	w0, w1, 1
	str	w0, [x19, 1624]
	bne	.L765
	ldrb	w0, [x19, 797]
	cbnz	w0, .L778
.L770:
	ldr	w0, [x19, 1640]
	add	w0, w0, 1
	str	w0, [x19, 1628]
.L765:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L777:
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
	b	.L768
	.p2align 3
.L778:
	add	x1, x20, 28672
	ldr	w3, [x19, 1640]
	add	x6, x19, 1456
	add	x5, x19, 1196
	add	x4, x19, 932
	add	x2, x19, 1628
	add	x1, x1, 288
	mov	x0, x20
	bl	ReorderRefPiclist
	b	.L770
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
	cbnz	w23, .L801
	cmp	w21, 1
	ldr	x23, .LC81
	beq	.L841
.L781:
	cmp	w21, 2
	bne	.L790
	mov	w21, 0
	mov	w20, 0
	.p2align 2
.L792:
	cmp	w20, w22
	ccmp	w21, w22, 0, cs
	bcs	.L790
.L842:
	cmp	w21, w22
	bcc	.L825
	b	.L797
	.p2align 3
.L793:
	add	w21, w21, 1
	cmp	w22, w21
	bls	.L797
.L825:
	ldr	x0, [x19, w21, uxtw 3]
	add	x26, x19, x21, uxtw 3
	ldrb	w1, [x0, 1]
	tbz	x1, 1, .L793
	add	x0, x0, 688
	blr	x23
	cbz	w0, .L793
	ldr	w1, [x24]
	add	w21, w21, 1
	ldr	x0, [x26]
	add	x0, x0, 688
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
.L797:
	cmp	w20, w22
	bcc	.L824
	b	.L792
	.p2align 3
.L798:
	add	w20, w20, 1
	cmp	w22, w20
	bls	.L792
.L824:
	ldr	x0, [x19, w20, uxtw 3]
	add	x26, x19, x20, uxtw 3
	ldrb	w1, [x0, 1]
	tbz	x1, 0, .L798
	add	x0, x0, 640
	blr	x23
	cbz	w0, .L798
	ldr	w1, [x24]
	add	w20, w20, 1
	ldr	x0, [x26]
	cmp	w20, w22
	ccmp	w21, w22, 0, cs
	add	x0, x0, 640
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
	bcc	.L842
.L790:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L801:
	cmp	w21, 1
	ldr	x23, .LC80
	bne	.L781
.L841:
	mov	w21, 0
	mov	w20, 0
	.p2align 2
.L782:
	cmp	w20, w22
	ccmp	w21, w22, 0, cs
	bcs	.L790
	cmp	w20, w22
	bcc	.L823
	b	.L840
	.p2align 3
.L783:
	add	w20, w20, 1
	cmp	w20, w22
	bcs	.L840
.L823:
	ldr	x0, [x19, w20, uxtw 3]
	add	x26, x19, x20, uxtw 3
	ldrb	w1, [x0, 1]
	tbz	x1, 0, .L783
	add	x0, x0, 640
	blr	x23
	cbz	w0, .L783
	ldr	w1, [x24]
	add	w20, w20, 1
	ldr	x0, [x26]
	add	x0, x0, 640
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
	.p2align 2
.L840:
	cmp	w21, w22
	bcs	.L782
	ldr	x0, [x19, w21, uxtw 3]
	add	x26, x19, x21, uxtw 3
	ldrb	w1, [x0, 1]
	tbnz	x1, 1, .L843
.L788:
	add	w21, w21, 1
	b	.L840
	.p2align 3
.L843:
	add	x0, x0, 688
	blr	x23
	cbz	w0, .L788
	ldr	w1, [x24]
	add	w21, w21, 1
	ldr	x0, [x26]
	add	x0, x0, 688
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
	b	.L782
	.size	GenPiclistfromFrmlist, .-GenPiclistfromFrmlist
	.align	3
.LC80:
	.xword	IsLTRefFlg
	.align	3
.LC81:
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
	add	x20, x19, 20480
	add	x22, x19, 57344
	bl	_mcount
	ldrb	w0, [x20, 1584]
	cbnz	w0, .L845
	ldrb	w0, [x22, 1643]
	add	x21, x19, 24576
	cbnz	w0, .L965
	ldr	w0, [x21, 3712]
	cbz	w0, .L912
	sub	w3, w0, #1
	mov	w23, 0
	add	x3, x3, 3504
	add	x0, x21, 3448
	add	x3, x19, x3, lsl 3
	b	.L851
	.p2align 3
.L850:
	cmp	x3, x0
	beq	.L849
.L851:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 2]
	cmp	w2, 3
	bne	.L850
	ldr	w2, [x1, 592]
	and	w2, w2, 16776960
	cmp	w2, 65536
	bne	.L850
	add	x2, x19, x23, uxtw 3
	add	x1, x1, 592
	cmp	x3, x0
	add	w23, w23, 1
	str	x1, [x2, 28696]
	bne	.L851
	.p2align 2
.L849:
	add	x0, x19, 28672
	ldr	x3, .LC82
	mov	w1, w23
	mov	w2, 8
	add	x0, x0, 24
	bl	qsort
	str	w23, [x20, 1624]
	ldr	w1, [x21, 3716]
	cbz	w1, .L913
	sub	w3, w1, #1
	add	x0, x21, 3576
	add	x3, x3, 3520
	mov	w21, w23
	add	x3, x19, x3, lsl 3
	b	.L854
	.p2align 3
.L853:
	cmp	x0, x3
	beq	.L966
.L854:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 2]
	cmp	w2, 3
	bne	.L853
	ldr	w2, [x1, 592]
	and	w2, w2, 16776960
	cmp	w2, 256
	bne	.L853
	add	x2, x19, x21, uxtw 3
	add	x1, x1, 592
	cmp	x0, x3
	add	w21, w21, 1
	str	x1, [x2, 28696]
	bne	.L854
	.p2align 2
.L966:
	sub	w1, w21, w23
.L852:
	uxtw	x0, w23
	ldr	x3, .LC83
	add	x0, x0, 3586
	mov	w2, 8
	add	x0, x19, x0, lsl 3
	add	x0, x0, 8
	bl	qsort
	str	w21, [x20, 1624]
	mov	w2, w21
	str	wzr, [x20, 1628]
	cbz	w2, .L967
.L860:
	ldr	w0, [x20, 1636]
	mov	w1, 0
	str	wzr, [x20, 1628]
	add	w0, w0, 1
	cmp	w0, w2
	csel	w0, w0, w2, ls
	str	w0, [x20, 1624]
	cmp	w0, 32
	bhi	.L907
	add	x2, x19, x0, uxtw 3
	add	w0, w0, 1
	cmp	w0, 33
	str	xzr, [x2, 28696]
	bne	.L905
	.p2align 2
.L906:
	cmp	w1, 32
	bhi	.L904
	.p2align 2
.L907:
	add	x0, x19, x1, uxtw 3
	add	w1, w1, 1
	cmp	w1, 33
	str	xzr, [x0, 28960]
	bne	.L907
.L904:
	mov	w0, 0
.L956:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 480
	ret
	.p2align 3
.L845:
	ldrb	w0, [x22, 1643]
	add	x21, x19, 24576
	cbz	w0, .L866
	ldr	w0, [x21, 3712]
	cbz	w0, .L968
	sub	w3, w0, #1
	mov	w23, 0
	add	x3, x3, 3504
	add	x0, x21, 3448
	add	x3, x19, x3, lsl 3
	.p2align 2
.L885:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 1]
	cbz	w2, .L884
	ldr	w4, [x1, 560]
	add	x2, x29, 480
	ldr	w5, [x22, 2220]
	add	x2, x2, x23, uxtw 3
	sub	x2, x2, #4096
	cmp	w5, w4
	blt	.L884
	add	w23, w23, 1
	str	x1, [x2, 3712]
.L884:
	cmp	x0, x3
	bne	.L885
	add	x26, x29, 96
	ldr	x3, .LC90
	mov	w2, 8
	mov	w1, w23
	mov	x0, x26
	bl	qsort
	ldr	w24, [x21, 3712]
	cbz	w24, .L886
.L910:
	sub	w1, w24, #1
	add	x0, x21, 3448
	add	x1, x1, 3504
	mov	w25, w23
	add	x1, x19, x1, lsl 3
	.p2align 2
.L888:
	ldr	x2, [x0]
	add	x0, x0, 8
	ldrb	w3, [x2, 1]
	cbz	w3, .L887
	ldr	w4, [x2, 560]
	add	x3, x29, 480
	ldr	w5, [x22, 2220]
	add	x3, x3, x25, uxtw 3
	sub	x3, x3, #4096
	cmp	w5, w4
	bge	.L887
	add	w25, w25, 1
	str	x2, [x3, 3712]
.L887:
	cmp	x0, x1
	bne	.L888
	sub	w24, w25, w23
	ldr	x3, .LC91
	mov	w2, 8
	mov	w1, w24
	add	x0, x26, x23, uxtw 3
	bl	qsort
	cbz	w23, .L889
.L909:
	mov	x0, 0
	.p2align 2
.L890:
	add	w1, w24, w0
	add	x3, x29, 480
	ldr	x2, [x26, x0, lsl 3]
	add	x0, x0, 1
	add	x1, x3, x1, lsl 3
	cmp	w23, w0
	str	x2, [x1, -256]
	bhi	.L890
.L889:
	cmp	w25, w23
	bls	.L891
	mov	w0, w23
	.p2align 2
.L892:
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
	bne	.L892
.L891:
	str	wzr, [x20, 1624]
	add	x23, x19, 28672
	str	wzr, [x20, 1628]
	add	x24, x23, 24
	add	x27, x20, 1624
	mov	x1, x26
	ldrb	w0, [x22, 1643]
	mov	w2, w25
	mov	w5, 0
	mov	x4, x27
	mov	x3, x24
	add	x23, x23, 288
	add	x26, x20, 1628
	bl	GenPiclistfromFrmlist
	ldrb	w0, [x22, 1643]
	mov	w2, w25
	mov	w5, 0
	mov	x4, x26
	mov	x3, x23
	add	x1, x29, 224
	add	x25, x29, 352
	bl	GenPiclistfromFrmlist
	ldr	w28, [x21, 3716]
	cbz	w28, .L893
	add	x21, x21, 3576
	mov	x0, 0
	add	x25, x29, 352
	.p2align 2
.L894:
	ldr	x1, [x21], 8
	str	x1, [x25, x0, lsl 3]
	add	x0, x0, 1
	cmp	w28, w0
	bhi	.L894
.L893:
	ldr	x3, .LC85
	mov	w2, 8
	mov	w1, w28
	mov	x0, x25
	bl	qsort
	ldrb	w0, [x22, 1643]
	mov	w5, 1
	mov	x4, x27
	mov	x3, x24
	mov	w2, w28
	mov	x1, x25
	bl	GenPiclistfromFrmlist
	ldrb	w0, [x22, 1643]
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
.L883:
	cmp	w3, 1
	cset	w0, hi
	tst	w1, w0
	beq	.L895
	cbz	w3, .L896
	ldr	x6, [x19, 28696]
	ldr	x0, [x19, 28960]
	cmp	x6, x0
	bne	.L895
	sub	w0, w3, #1
	mov	x2, x19
	add	x0, x19, x0, lsl 3
.L898:
	cmp	x0, x2
	beq	.L900
	ldr	x5, [x2, 28704]
	add	x2, x2, 8
	ldr	x1, [x2, 28960]
	cmp	x5, x1
	beq	.L898
	.p2align 2
.L895:
	ldr	x0, [x19, 22104]
	cbz	x0, .L969
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
	bhi	.L906
	.p2align 2
.L905:
	add	x2, x19, x0, uxtw 3
	add	w0, w0, 1
	cmp	w0, 33
	str	xzr, [x2, 28696]
	bne	.L905
	b	.L906
	.p2align 3
.L866:
	ldr	w0, [x21, 3712]
	cbz	w0, .L914
	sub	w3, w0, #1
	mov	w23, 0
	add	x3, x3, 3504
	add	x0, x21, 3448
	add	x3, x19, x3, lsl 3
	b	.L871
	.p2align 3
.L870:
	cmp	x0, x3
	beq	.L869
.L871:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 2]
	cmp	w2, 3
	bne	.L870
	ldr	w2, [x1, 604]
	add	x5, x19, x23, uxtw 3
	ldr	w4, [x22, 2224]
	add	x1, x1, 592
	cmp	w4, w2
	blt	.L870
	str	x1, [x5, 28696]
	cmp	x0, x3
	add	w23, w23, 1
	bne	.L871
	.p2align 2
.L869:
	add	x25, x19, 28672
	ldr	x3, .LC88
	mov	w2, 8
	mov	w1, w23
	add	x0, x25, 24
	bl	qsort
	ldr	w24, [x21, 3712]
	cbz	w24, .L872
	sub	w3, w24, #1
	add	x0, x21, 3448
	add	x3, x3, 3504
	mov	w26, w23
	add	x3, x19, x3, lsl 3
	b	.L874
	.p2align 3
.L873:
	cmp	x0, x3
	beq	.L970
.L874:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 2]
	cmp	w2, 3
	bne	.L873
	ldr	w2, [x1, 604]
	add	x5, x19, x26, uxtw 3
	ldr	w4, [x22, 2224]
	add	x1, x1, 592
	cmp	w4, w2
	bge	.L873
	str	x1, [x5, 28696]
	cmp	x0, x3
	add	w26, w26, 1
	bne	.L874
	.p2align 2
.L970:
	uxtw	x0, w23
	uxtw	x22, w26
	add	x0, x0, 3586
	sub	w24, w26, w23
	ldr	x3, .LC89
	add	x22, x22, 3586
	add	x0, x19, x0, lsl 3
	mov	w2, 8
	add	x0, x0, 8
	mov	w1, w24
	add	x22, x19, x22, lsl 3
	bl	qsort
	add	x22, x22, 8
	cbz	w23, .L876
.L908:
	add	x25, x25, 24
	mov	w0, 0
	.p2align 2
.L877:
	add	w1, w24, w0
	ldr	x2, [x25], 8
	add	w0, w0, 1
	add	x1, x19, x1, lsl 3
	cmp	w0, w23
	str	x2, [x1, 28960]
	bcc	.L877
.L876:
	cmp	w26, w23
	bls	.L878
	mov	w0, w23
	.p2align 2
.L879:
	sub	w1, w0, w23
	add	x2, x19, x0, uxtw 3
	add	w0, w0, 1
	add	x1, x19, x1, lsl 3
	cmp	w0, w26
	ldr	x2, [x2, 28696]
	str	x2, [x1, 28960]
	bne	.L879
.L878:
	str	w26, [x20, 1624]
	str	w26, [x20, 1628]
	ldr	w1, [x21, 3716]
	cbz	w1, .L915
	sub	w3, w1, #1
	add	x0, x21, 3576
	add	x3, x3, 3520
	mov	w21, w26
	add	x3, x19, x3, lsl 3
	b	.L882
	.p2align 3
.L881:
	cmp	x3, x0
	beq	.L971
.L882:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 1]
	cmp	w2, 3
	bne	.L881
	ldrb	w2, [x1, 593]
	cmp	w2, 1
	bne	.L881
	add	x2, x19, x21, uxtw 3
	add	x1, x1, 592
	cmp	x3, x0
	add	w21, w21, 1
	str	x1, [x2, 28696]
	str	x1, [x2, 28960]
	bne	.L882
	.p2align 2
.L971:
	sub	w1, w21, w26
.L880:
	ldr	x23, .LC83
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
	b	.L883
	.p2align 3
.L965:
	ldr	w0, [x21, 3712]
	mov	w23, 0
	cbz	w0, .L848
	sub	w4, w0, #1
	mov	w23, 0
	add	x4, x4, 3504
	add	x0, x21, 3448
	add	x4, x19, x4, lsl 3
	.p2align 2
.L857:
	ldr	x2, [x0]
	add	x1, x29, 480
	add	x1, x1, x23, uxtw 3
	add	x0, x0, 8
	sub	x1, x1, #4096
	cmp	x4, x0
	ldrb	w3, [x2, 2]
	cbz	w3, .L856
	add	w23, w23, 1
	str	x2, [x1, 3712]
.L856:
	bne	.L857
.L848:
	ldr	x3, .LC84
	mov	w1, w23
	mov	w2, 8
	add	x0, x29, 96
	add	x24, x19, 28672
	add	x26, x20, 1624
	bl	qsort
	str	wzr, [x20, 1624]
	add	x24, x24, 24
	mov	w2, w23
	ldrb	w0, [x22, 1643]
	mov	w5, 0
	mov	x4, x26
	add	x1, x29, 96
	mov	x3, x24
	add	x25, x29, 352
	bl	GenPiclistfromFrmlist
	ldr	w23, [x21, 3716]
	cbz	w23, .L858
	add	x21, x21, 3576
	mov	x0, 0
	add	x25, x29, 352
	.p2align 2
.L859:
	ldr	x1, [x21], 8
	str	x1, [x25, x0, lsl 3]
	add	x0, x0, 1
	cmp	w23, w0
	bhi	.L859
.L858:
	ldr	x3, .LC85
	mov	w2, 8
	mov	w1, w23
	mov	x0, x25
	bl	qsort
	ldrb	w0, [x22, 1643]
	mov	w2, w23
	mov	w5, 1
	mov	x4, x26
	mov	x3, x24
	mov	x1, x25
	bl	GenPiclistfromFrmlist
	str	wzr, [x20, 1628]
	ldr	w2, [x20, 1624]
	cbnz	w2, .L860
.L967:
	ldr	x0, [x19]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L861
	ldrb	w0, [x22, 1643]
	cbz	w0, .L972
	cmp	w0, 1
	ldr	x0, [x22, 2192]
	beq	.L973
	add	x0, x0, 688
	mov	w2, 1
	str	x0, [x19, 28696]
	b	.L860
	.p2align 3
.L972:
	ldr	x0, [x22, 2192]
	mov	w2, 1
	add	x0, x0, 592
	str	x0, [x19, 28696]
	b	.L860
.L896:
	ldr	x6, [x19, 28960]
.L900:
	ldr	x0, [x19, 28968]
	str	x0, [x19, 28960]
	str	x6, [x19, 28968]
	b	.L895
.L973:
	add	x0, x0, 640
	mov	w2, 1
	str	x0, [x19, 28696]
	b	.L860
.L968:
	add	x26, x29, 96
	ldr	x3, .LC90
	mov	w2, 8
	mov	w1, 0
	mov	x0, x26
	mov	w23, 0
	bl	qsort
	ldr	w24, [x21, 3712]
	cbnz	w24, .L910
	ldr	x3, .LC91
	mov	w2, 8
	mov	w1, 0
	mov	x0, x26
	mov	w25, 0
	bl	qsort
	b	.L891
	.p2align 3
.L914:
	mov	w23, 0
	b	.L869
.L872:
	uxtw	x22, w23
	ldr	x3, .LC89
	add	x22, x22, 3586
	mov	w2, 8
	mov	w1, 0
	mov	w26, w23
	add	x22, x19, x22, lsl 3
	add	x22, x22, 8
	mov	x0, x22
	bl	qsort
	cbnz	w23, .L908
	b	.L878
	.p2align 3
.L915:
	mov	w21, w26
	b	.L880
.L913:
	mov	w21, w23
	b	.L852
.L912:
	mov	w23, 0
	b	.L849
.L886:
	ldr	x3, .LC91
	mov	w2, 8
	mov	w1, 0
	add	x0, x26, x23, uxtw 3
	mov	w25, w23
	bl	qsort
	cbnz	w23, .L909
	b	.L891
	.p2align 3
.L861:
	ldr	x2, .LC87
	mov	w1, 4001
.L961:
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x19
	bl	ClearCurrSlice
	mov	w0, -1
	b	.L956
.L969:
	ldr	x2, .LC93
	mov	w1, 4147
	b	.L961
	.size	InitListX, .-InitListX
	.align	3
.LC82:
	.xword	compare_pic_by_pic_num_desc
	.align	3
.LC83:
	.xword	compare_pic_by_lt_pic_num_asc
	.align	3
.LC84:
	.xword	compare_fs_by_frame_num_desc
	.align	3
.LC85:
	.xword	compare_fs_by_lt_pic_idx_asc
	.align	3
.LC87:
	.xword	.LC86
	.align	3
.LC88:
	.xword	compare_pic_by_poc_desc
	.align	3
.LC89:
	.xword	compare_pic_by_poc_asc
	.align	3
.LC90:
	.xword	compare_fs_by_poc_desc
	.align	3
.LC91:
	.xword	compare_fs_by_poc_asc
	.align	3
.LC93:
	.xword	.LC92
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
	ldr	x0, .LC94
	ldr	w0, [x0]
	tbz	x0, 11, .L974
	mov	x0, x19
	bl	DumpList.part.6
.L974:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	DumpList, .-DumpList
	.align	3
.LC94:
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
	cbz	w0, .L983
	add	x1, x19, 57344
	ldr	x3, [x19, 27896]
	cmp	w0, 1
	ldr	w7, [x1, 2220]
	ldr	w1, [x3, 560]
	sub	w1, w7, w1
	sxtw	x1, w1
	eor	x6, x1, x1, asr 63
	sub	x6, x6, x1, asr 63
	bls	.L984
	sub	w0, w0, #2
	add	x2, x2, 3328
	add	x1, x0, 3489
	mov	w0, 0
	add	x5, x19, x1, lsl 3
	.p2align 2
.L982:
	ldr	x4, [x2]
	add	x2, x2, 8
	ldr	w1, [x4, 560]
	sub	w1, w7, w1
	sxtw	x1, w1
	eor	x3, x1, x1, asr 63
	sub	x3, x3, x1, asr 63
	cmp	w3, w6
	bge	.L981
	ldr	w0, [x4, 96]
	mov	w6, w3
.L981:
	cmp	x2, x5
	bne	.L982
.L980:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L984:
	mov	w0, 0
	b	.L980
.L983:
	mov	w0, -1
	b	.L980
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
	beq	.L986
	add	x1, x19, 57344
	ldrb	w1, [x1, 1643]
	cbnz	w1, .L1016
	add	x6, x19, 24576
	ldr	w5, [x0, 1624]
	add	x6, x6, 3992
	mov	w4, 0
	add	x7, x19, 28672
	.p2align 2
.L990:
	cbz	w5, .L994
	add	x1, x7, 24
	mov	w3, 32
	mov	w0, 0
	b	.L992
	.p2align 3
.L991:
	add	w0, w0, 1
	cmp	w0, w5
	beq	.L1017
.L992:
	ldr	x2, [x1]
	add	x1, x1, 8
	ldr	x2, [x2, 40]
	ldr	w2, [x2, 584]
	cmp	w2, w4
	bne	.L991
	cmp	w3, w0
	csel	w3, w3, w0, ls
	add	w0, w0, 1
	stp	w3, w3, [x6]
	cmp	w0, w5
	bne	.L992
.L1017:
	cmp	w3, 31
	bhi	.L994
.L993:
	add	w4, w4, 1
	add	x6, x6, 8
	cmp	w4, 16
	bne	.L990
.L986:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1016:
	ldr	w6, [x0, 1624]
	add	x7, x19, 24576
	add	x7, x7, 3992
	mov	w4, 0
	add	x8, x19, 28672
	cbz	w6, .L998
	.p2align 2
.L1019:
	add	x2, x8, 24
	mov	w5, 32
	mov	w1, 0
	b	.L996
	.p2align 3
.L995:
	add	w1, w1, 1
	cmp	w1, w6
	beq	.L1018
.L996:
	ldr	x0, [x2]
	add	x2, x2, 8
	ldr	x3, [x0, 40]
	ldrb	w0, [x0]
	cmp	w0, 2
	ldr	w0, [x3, 584]
	cset	w3, eq
	orr	w0, w3, w0, lsl 1
	cmp	w0, w4
	bne	.L995
	cmp	w5, w1
	csel	w5, w5, w1, ls
	add	w1, w1, 1
	str	w5, [x7]
	cmp	w1, w6
	bne	.L996
.L1018:
	cmp	w5, 31
	bhi	.L998
.L997:
	add	w4, w4, 1
	add	x7, x7, 4
	cmp	w4, 32
	beq	.L986
	cbnz	w6, .L1019
	.p2align 2
.L998:
	str	wzr, [x7]
	b	.L997
	.p2align 3
.L994:
	stp	wzr, wzr, [x6]
	b	.L993
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
	ldrb	w3, [x6, 1584]
	cmp	w3, 1
	beq	.L1022
	cbz	w3, .L1029
	cmp	w3, 2
	mov	w0, 0
	bne	.L1042
.L1024:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1042:
	ldr	x2, .LC95
	mov	w1, 4360
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x19
	bl	ClearCurrSlice
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L1029:
	mov	w9, 1
.L1023:
	add	x5, x19, 28672
	add	x6, x6, 1624
	add	x5, x5, 24
	mov	x7, 0
	mov	w8, 0
	add	x4, x19, 61440
.L1027:
	ldr	w0, [x6]
	cbz	w0, .L1028
	sub	w0, w0, #1
	add	x3, x7, 3588
	add	x3, x3, x0
	mov	x0, x5
	add	x3, x19, x3, lsl 3
	.p2align 2
.L1026:
	ldr	x1, [x0]
	add	x0, x0, 8
	cbz	x1, .L1025
	ldr	w2, [x1, 16]
	ldr	w1, [x4, 1132]
	cmp	w2, w1
	bls	.L1025
	ldr	x1, [x19]
	ldr	w1, [x1, 656]
	cmp	w1, 1
	beq	.L1043
.L1025:
	cmp	x0, x3
	bne	.L1026
.L1028:
	add	w8, w8, 1
	add	x6, x6, 4
	cmp	w8, w9
	add	x5, x5, 264
	add	x7, x7, 33
	bcc	.L1027
	mov	w0, 0
	b	.L1024
	.p2align 3
.L1043:
	mov	x0, x19
	bl	ClearCurrSlice
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L1022:
	mov	w9, 2
	b	.L1023
	.size	UvmosDeleteList, .-UvmosDeleteList
	.align	3
.LC95:
	.xword	.LC74
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
	add	x1, x19, 24576
	mov	w7, -1
	ldr	w0, [x1, 3708]
	cbz	w0, .L1045
	add	x2, x19, 57344
	ldr	x3, [x19, 27896]
	cmp	w0, 1
	ldr	w6, [x2, 2220]
	ldr	w2, [x3, 560]
	sub	w2, w6, w2
	sxtw	x2, w2
	eor	x5, x2, x2, asr 63
	sub	x5, x5, x2, asr 63
	bls	.L1059
	sub	w4, w0, #2
	add	x1, x1, 3328
	add	x4, x4, 3489
	mov	w7, 0
	add	x4, x19, x4, lsl 3
	.p2align 2
.L1047:
	ldr	x3, [x1]
	add	x1, x1, 8
	ldr	w0, [x3, 560]
	sub	w0, w6, w0
	sxtw	x0, w0
	eor	x2, x0, x0, asr 63
	sub	x2, x2, x0, asr 63
	cmp	w2, w5
	bge	.L1046
	ldr	w7, [x3, 96]
	mov	w5, w2
.L1046:
	cmp	x1, x4
	bne	.L1047
.L1045:
	add	x20, x19, 20480
	mov	w21, -1
	ldrb	w0, [x20, 1584]
	str	w21, [x20, 3208]
	cmp	w0, 2
	str	w7, [x20, 3212]
	beq	.L1067
	mov	x0, x19
	bl	InitListX
	cbnz	w0, .L1068
	ldr	x2, .LC99
	mov	w1, 4406
	mov	w0, 11
	bl	dprint_normal
	ldr	x22, .LC100
	ldr	w0, [x22]
	tbnz	x0, 11, .L1069
.L1051:
	mov	x0, x19
	bl	ReorderListX
	mov	x0, x19
	bl	RepairList
	cbnz	w0, .L1056
	mov	x0, x19
	bl	FindMinRefIdx
	ldr	x0, [x19]
	ldr	w0, [x0, 656]
	cmp	w0, 1
	beq	.L1053
.L1057:
	ldr	x0, [x19, 28696]
	cbz	x0, .L1070
	ldr	x0, [x0, 40]
	ldr	w0, [x0, 96]
.L1055:
	ldr	x2, .LC102
	mov	w1, 4429
	str	w0, [x20, 3208]
	mov	w0, 11
	mov	w21, 0
	bl	dprint_normal
	ldr	w0, [x22]
	tbz	x0, 11, .L1049
	mov	x0, x19
	bl	DumpList.part.6
.L1049:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1067:
	str	wzr, [x20, 1624]
	mov	w21, 0
	str	wzr, [x20, 1628]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1069:
	mov	x0, x19
	bl	DumpList.part.6
	b	.L1051
	.p2align 3
.L1070:
	mov	w0, -1
	b	.L1055
	.p2align 3
.L1053:
	mov	x0, x19
	bl	UvmosDeleteList
	cbz	w0, .L1057
	.p2align 2
.L1056:
	mov	w21, -1
	b	.L1049
.L1059:
	mov	w7, 0
	b	.L1045
.L1068:
	ldr	x2, .LC97
	mov	w1, 4402
	mov	w0, 11
	bl	dprint_normal
	b	.L1049
	.size	DecList, .-DecList
	.align	3
.LC97:
	.xword	.LC96
	.align	3
.LC99:
	.xword	.LC98
	.align	3
.LC100:
	.xword	g_PrintEnable
	.align	3
.LC102:
	.xword	.LC101
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
	bne	.L1072
	add	x2, x21, 24576
	ldr	w5, [x19, 3272]
	ldr	w2, [x2, 3704]
	add	w2, w2, 1
	cmp	w5, w2
	beq	.L1075
.L1072:
	ldr	x2, .LC103
	ldr	x6, [x2]
	cbz	x6, .L1076
	add	x5, x21, 61440
	ubfiz	w2, w1, 4, 12
	ubfiz	w3, w3, 4, 12
	ubfiz	w1, w0, 4, 12
	ubfiz	w4, w4, 4, 12
	strh	w3, [x29, 58]
	ldr	w0, [x5, 1140]
	mov	w3, 8
	strh	w2, [x29, 60]
	add	x2, x29, 56
	strh	w1, [x29, 62]
	mov	w1, 1
	strh	w4, [x29, 56]
	blr	x6
.L1076:
	ldr	w2, [x19, 3272]
	mov	w3, 1
.L1073:
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
.L1075:
	mov	w3, 0
	b	.L1073
	.size	GetReRangeFlag, .-GetReRangeFlag
	.align	3
.LC103:
	.xword	g_EventReportFunc
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
	beq	.L1079
	cbz	w3, .L1080
	cmp	w3, 2
	bne	.L1077
	cmp	w7, 5
	beq	.L1134
	ldr	w1, [x0, 728]
	cbz	w1, .L1113
	ldr	w1, [x0, 768]
	mov	w3, 0
	mov	w2, 0
	str	wzr, [x0, 764]
	str	wzr, [x0, 776]
.L1114:
	str	w2, [x0, 772]
.L1116:
	ldr	w4, [x0, 1612]
	add	w2, w1, w2
	str	w2, [x0, 760]
	lsl	w1, w2, 1
	cbnz	w4, .L1117
	sub	w1, w1, #1
	str	w1, [x0, 748]
.L1118:
	ldrb	w2, [x0, 1585]
	cbnz	w2, .L1119
	str	w1, [x0, 736]
	str	w1, [x0, 740]
	str	w1, [x0, 744]
.L1112:
	ldr	w1, [x0, 768]
	str	w1, [x0, 764]
	str	w3, [x0, 776]
.L1077:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1080:
	ldr	w1, [x1, 2204]
	cmp	w7, 5
	add	w1, w1, 4
	lsl	w4, w4, w1
	beq	.L1086
	ldr	w1, [x0, 728]
	cbnz	w1, .L1084
	ldr	w5, [x0, 712]
	ldr	w3, [x0, 716]
	mov	w2, w5
.L1085:
	ldr	w1, [x0, 704]
	cmp	w1, w3
	bcs	.L1083
	sub	w6, w3, w1
	cmp	w6, w4, lsr 1
	bcc	.L1083
	add	w2, w2, w4
	str	w2, [x0, 720]
.L1087:
	ldrb	w3, [x0, 1585]
	cbnz	w3, .L1089
.L1137:
	ldr	w3, [x0, 708]
	add	w1, w1, w2
	str	w1, [x0, 736]
	add	w2, w1, w3
	str	w2, [x0, 740]
	cmp	w1, w2
	csel	w1, w1, w2, le
	str	w1, [x0, 748]
.L1090:
	ldr	w3, [x0, 764]
	ldr	w2, [x0, 768]
	str	w1, [x0, 744]
	cmp	w2, w3
	beq	.L1092
	str	w2, [x0, 764]
.L1092:
	ldr	w1, [x0, 1612]
	cbz	w1, .L1077
	ldr	w2, [x0, 704]
	ldr	w1, [x0, 720]
	str	w1, [x0, 712]
	str	w2, [x0, 716]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1079:
	cmp	w7, 5
	beq	.L1135
	ldr	w3, [x0, 728]
	cbz	w3, .L1095
	mov	w2, 0
	str	wzr, [x0, 764]
	str	wzr, [x0, 776]
.L1096:
	str	w2, [x0, 772]
.L1094:
	ldr	w2, [x1, 2216]
	cbz	w2, .L1098
	ldr	w2, [x0, 768]
	ldr	w5, [x0, 772]
	ldr	w6, [x0, 1612]
	add	w5, w5, w2
	str	w5, [x0, 760]
	cbnz	w6, .L1100
	cbz	w5, .L1101
	sub	w5, w5, #1
	str	w5, [x0, 760]
.L1100:
	str	wzr, [x0, 792]
	ldr	w2, [x1, 2216]
	cmp	w2, wzr
	ble	.L1102
.L1121:
	mov	w4, 0
	mov	w3, 0
	.p2align 2
.L1103:
	add	x2, x1, x3, sxtw 2
	add	w3, w3, 1
	ldr	w2, [x2, 2220]
	add	w4, w4, w2
	str	w4, [x0, 792]
	ldr	w2, [x1, 2216]
	cmp	w2, w3
	bgt	.L1103
.L1102:
	cbz	w5, .L1104
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
	tbnz	w5, #31, .L1105
	mov	w3, 0
	.p2align 2
.L1106:
	add	x4, x1, x3, sxtw 2
	add	w3, w3, 1
	cmp	w5, w3
	ldr	w4, [x4, 2220]
	add	w2, w2, w4
	str	w2, [x0, 788]
	bge	.L1106
.L1105:
	cbnz	w6, .L1107
	ldr	w3, [x1, 2208]
	add	w2, w2, w3
	str	w2, [x0, 788]
.L1107:
	ldrb	w3, [x0, 1585]
	cbnz	w3, .L1108
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
.L1109:
	ldr	w3, [x0, 768]
	ldr	w1, [x0, 772]
	str	w2, [x0, 744]
	str	w3, [x0, 764]
	str	w1, [x0, 776]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1084:
	ldr	w5, [x0, 732]
	cbz	w5, .L1136
.L1086:
	ldr	w1, [x0, 704]
	mov	w2, 0
	mov	w5, 0
	str	wzr, [x0, 712]
	str	wzr, [x0, 716]
.L1083:
	cmp	w1, w3
	bls	.L1088
	sub	w3, w1, w3
	cmp	w3, w4, lsr 1
	bls	.L1088
	sub	w2, w2, w4
	str	w2, [x0, 720]
	b	.L1087
	.p2align 3
.L1134:
	add	x1, x0, 512
	mov	w3, 0
	stp	wzr, wzr, [x1, 224]
	stp	wzr, wzr, [x1, 232]
	str	wzr, [x0, 772]
	b	.L1112
	.p2align 3
.L1135:
	str	wzr, [x0, 772]
	b	.L1094
	.p2align 3
.L1088:
	ldrb	w3, [x0, 1585]
	str	w5, [x0, 720]
	cbz	w3, .L1137
.L1089:
	ldrb	w3, [x0, 1586]
	add	w1, w1, w2
	cbnz	w3, .L1091
	str	w1, [x0, 736]
	str	w1, [x0, 748]
	b	.L1090
	.p2align 3
.L1098:
	ldr	w6, [x0, 1612]
	str	wzr, [x0, 760]
.L1101:
	str	wzr, [x0, 792]
	mov	w5, 0
	ldr	w2, [x1, 2216]
	cmp	w2, wzr
	bgt	.L1121
	.p2align 2
.L1104:
	mov	w2, 0
	str	wzr, [x0, 788]
	b	.L1105
	.p2align 3
.L1108:
	ldrb	w3, [x0, 1586]
	cbnz	w3, .L1110
	ldr	w1, [x0, 752]
	add	w2, w2, w1
	str	w2, [x0, 736]
	str	w2, [x0, 748]
	b	.L1109
	.p2align 3
.L1113:
	ldr	w3, [x0, 764]
	ldr	w1, [x0, 768]
	cmp	w1, w3
	ldr	w3, [x0, 776]
	bcs	.L1115
	add	w2, w2, w3
	str	w2, [x0, 772]
	mov	w3, w2
	b	.L1116
	.p2align 3
.L1095:
	ldr	w3, [x0, 764]
	ldr	w4, [x0, 768]
	cmp	w4, w3
	bcs	.L1097
	ldr	w3, [x0, 776]
	add	w2, w3, w2
	str	w2, [x0, 772]
	b	.L1094
	.p2align 3
.L1119:
	ldrb	w2, [x0, 1586]
	str	w1, [x0, 744]
	cbnz	w2, .L1120
	str	w1, [x0, 736]
	b	.L1112
	.p2align 3
.L1117:
	str	w1, [x0, 748]
	b	.L1118
	.p2align 3
.L1091:
	str	w1, [x0, 740]
	str	w1, [x0, 748]
	b	.L1090
	.p2align 3
.L1110:
	ldr	w3, [x1, 2212]
	ldr	w1, [x0, 752]
	add	w2, w2, w3
	add	w2, w2, w1
	str	w2, [x0, 740]
	str	w2, [x0, 748]
	b	.L1109
	.p2align 3
.L1136:
	ldr	w3, [x0, 736]
	mov	w2, 0
	str	wzr, [x0, 712]
	str	w3, [x0, 716]
	b	.L1085
	.p2align 3
.L1120:
	str	w1, [x0, 740]
	b	.L1112
.L1097:
	ldr	w2, [x0, 776]
	b	.L1096
.L1115:
	mov	w2, w3
	b	.L1114
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
	add	x6, x19, 57344
	ldr	w2, [x2, 1592]
	mov	w7, 1
	umull	x1, w2, w1
	ldrb	w2, [x6, 1643]
	add	x1, x4, x1
	ldr	w1, [x1, 28]
	umull	x0, w1, w0
	add	x0, x3, x0
	ldr	w0, [x0, 2196]
	add	w0, w0, 4
	lsl	w7, w7, w0
	add	x0, x19, 24576
	cbz	w2, .L1139
	cmp	w2, 1
	mov	w1, 0
	cset	w8, eq
	cmp	w2, 2
	ldr	w2, [x0, 3712]
	cset	w9, eq
	cbz	w2, .L1159
	.p2align 2
.L1176:
	add	x3, x19, x1, uxtw 3
	ldr	x2, [x3, 28024]
	ldrb	w4, [x2, 2]
	cbz	w4, .L1153
	ldr	w4, [x2, 548]
	ldr	w5, [x6, 2208]
	cmp	w4, w5
	bls	.L1154
	sub	w4, w4, w7
	str	w4, [x2, 552]
.L1155:
	ldr	x2, [x3, 28024]
	ldrb	w4, [x2, 2]
	tbz	x4, 0, .L1156
	ldr	w5, [x2, 640]
	and	w5, w5, 16776960
	cmp	w5, 65536
	beq	.L1186
.L1156:
	tbz	x4, 1, .L1153
	ldr	w3, [x2, 688]
	and	w3, w3, 16776960
	cmp	w3, 65536
	beq	.L1187
	.p2align 2
.L1153:
	ldr	w2, [x0, 3712]
	add	w1, w1, 1
	cmp	w2, w1
	bhi	.L1176
.L1159:
	ldr	w2, [x0, 3716]
	mov	w1, 0
	cbz	w2, .L1138
	.p2align 2
.L1175:
	add	x4, x19, x1, uxtw 3
	add	w1, w1, 1
	ldr	x3, [x4, 28152]
	ldrb	w2, [x3, 2]
	cbz	w2, .L1161
	tbz	x2, 0, .L1162
	ldr	w5, [x3, 640]
	and	w5, w5, 16776960
	cmp	w5, 256
	beq	.L1188
.L1162:
	tbz	x2, 1, .L1161
	ldr	w2, [x3, 688]
	and	w2, w2, 16776960
	cmp	w2, 256
	beq	.L1189
	.p2align 2
.L1161:
	ldr	w2, [x0, 3716]
	cmp	w2, w1
	bhi	.L1175
.L1138:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1154:
	str	w4, [x2, 552]
	b	.L1155
	.p2align 3
.L1139:
	ldr	w2, [x0, 3712]
	mov	w1, 0
	cbnz	w2, .L1174
	.p2align 2
.L1149:
	ldr	w2, [x0, 3716]
	mov	w1, 0
	cbz	w2, .L1138
	add	x2, x19, x1, uxtw 3
	add	w1, w1, 1
	ldr	x2, [x2, 28152]
	ldrb	w3, [x2, 2]
	cmp	w3, 3
	beq	.L1190
	.p2align 2
.L1150:
	ldr	w2, [x0, 3716]
	cmp	w2, w1
	bls	.L1138
	add	x2, x19, x1, uxtw 3
	add	w1, w1, 1
	ldr	x2, [x2, 28152]
	ldrb	w3, [x2, 2]
	cmp	w3, 3
	bne	.L1150
.L1190:
	ldr	w3, [x2, 592]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L1150
	ldr	w3, [x2, 556]
	str	w3, [x2, 596]
	b	.L1150
	.p2align 3
.L1192:
	ldr	w4, [x2, 592]
	and	w4, w4, 16776960
	cmp	w4, 65536
	bne	.L1145
	ldr	w4, [x2, 548]
	ldr	w5, [x6, 2208]
	cmp	w4, w5
	sub	w5, w4, w7
	bhi	.L1191
	str	w4, [x2, 552]
.L1147:
	ldr	x2, [x3, 28024]
	ldr	w3, [x2, 552]
	str	w3, [x2, 600]
	.p2align 2
.L1145:
	ldr	w2, [x0, 3712]
	add	w1, w1, 1
	cmp	w2, w1
	bls	.L1149
.L1174:
	add	x3, x19, x1, uxtw 3
	ldr	x2, [x3, 28024]
	ldrb	w4, [x2, 2]
	cmp	w4, 3
	bne	.L1145
	b	.L1192
	.p2align 3
.L1188:
	ldr	w2, [x3, 556]
	add	w2, w8, w2, lsl 1
	str	w2, [x3, 644]
	ldr	x3, [x4, 28152]
	ldrb	w2, [x3, 2]
	b	.L1162
	.p2align 3
.L1186:
	ldr	w4, [x2, 552]
	add	w4, w8, w4, lsl 1
	str	w4, [x2, 648]
	ldr	x2, [x3, 28024]
	ldrb	w4, [x2, 2]
	b	.L1156
	.p2align 3
.L1189:
	ldr	w2, [x3, 556]
	add	w2, w9, w2, lsl 1
	str	w2, [x3, 692]
	b	.L1161
	.p2align 3
.L1187:
	ldr	w3, [x2, 552]
	add	w3, w9, w3, lsl 1
	str	w3, [x2, 696]
	b	.L1153
	.p2align 3
.L1191:
	str	w5, [x2, 552]
	b	.L1147
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
	cbz	x20, .L1198
	add	x0, x19, 24576
	ldr	w3, [x0, 3708]
	cbz	w3, .L1198
	ldr	x0, [x19, 27896]
	cmp	x20, x0
	beq	.L1200
	sub	w3, w3, #1
	mov	x0, x19
	add	x3, x19, x3, lsl 3
	b	.L1195
	.p2align 3
.L1196:
	ldr	x2, [x0, 27896]
	cmp	x20, x2
	beq	.L1200
.L1195:
	cmp	x0, x3
	add	x0, x0, 8
	bne	.L1196
.L1198:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1200:
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
	add	x21, x20, 57344
	add	x19, x20, 61440
	bl	_mcount
	ldr	x2, .LC105
	mov	w1, 5620
	ldrb	w4, [x21, 1643]
	mov	w0, 3
	ldr	w5, [x21, 1744]
	ldr	w3, [x21, 2216]
	ldr	w6, [x21, 2268]
	bl	dprint_normal
	str	wzr, [x19, 1064]
	ldr	w4, [x19, 1152]
	str	wzr, [x19, 1164]
	cmp	w4, 1
	beq	.L1202
	add	x2, x20, 16384
	add	x0, x20, 12288
	add	x2, x2, 2592
	add	x0, x0, 2688
	add	x3, x20, 20480
.L1203:
	ldr	x1, [x19, 1056]
	cmp	w4, 1
	str	x1, [x19, 912]
	ldr	w1, [x21, 2028]
	str	w1, [x19, 688]
	ldr	w1, [x21, 2032]
	str	w1, [x19, 692]
	ldr	w1, [x21, 2036]
	str	w1, [x19, 696]
	ldr	w1, [x21, 2040]
	str	w1, [x19, 700]
	ldr	w1, [x21, 2216]
	str	w1, [x19, 120]
	ldrb	w1, [x21, 1643]
	strb	w1, [x19, 112]
	ldrb	w1, [x0, 19]
	str	w1, [x19, 136]
	ldr	w1, [x21, 2252]
	str	w1, [x19, 124]
	ldr	w1, [x21, 2256]
	str	w1, [x19, 128]
	ldr	w1, [x0, 3248]
	add	w1, w1, 1
	str	w1, [x19, 132]
	ldrb	w1, [x0, 18]
	strb	w1, [x19, 115]
	ldr	w1, [x2, 60]
	str	w1, [x19, 140]
	ldrb	w1, [x2]
	str	w1, [x19, 144]
	ldr	w0, [x0, 40]
	strb	w0, [x19, 113]
	ldrb	w0, [x2, 4]
	str	w0, [x19, 148]
	ldr	w0, [x3, 748]
	str	w0, [x19, 152]
	ldr	w0, [x3, 736]
	str	w0, [x19, 156]
	ldr	w0, [x3, 740]
	str	w0, [x19, 160]
	beq	.L1219
	ldr	x1, [x21, 2192]
	ldr	w0, [x19, 1140]
	ldr	w1, [x1, 544]
	bl	FSP_GetLogicFs
	mov	x23, x0
	cbz	x0, .L1238
	ldr	x3, [x0, 24]
	ldr	x4, [x0, 40]
	cbz	x3, .L1208
	cbz	x4, .L1208
	ldr	w0, [x19, 1140]
	add	x2, x19, 412
	add	x1, x19, 548
	add	x22, x20, 24576
	bl	FSP_GetDecFsAddrTab
	ldr	w0, [x23, 200]
	add	x2, x19, 552
	str	w0, [x19, 540]
	add	x1, x19, 680
	ldr	w0, [x19, 1140]
	ldr	x3, [x23, 24]
	ldr	w3, [x3, 16]
	str	w3, [x19, 544]
	ldr	x3, [x23, 24]
	ldr	w3, [x3, 36]
	str	w3, [x19, 396]
	bl	FSP_GetPmvAddrTab
	ldr	w0, [x21, 2268]
	str	w0, [x19, 404]
	ldr	x0, [x23, 40]
	ldr	w0, [x0, 16]
	str	w0, [x19, 684]
	ldr	x0, [x23, 24]
	ldr	w0, [x0, 4]
	str	w0, [x19, 400]
	ldr	x0, [x23, 24]
	ldr	w0, [x0, 72]
	str	w0, [x19, 408]
	ldrb	w0, [x23, 424]
	strb	w0, [x19, 116]
	ldr	w4, [x22, 3984]
	str	w4, [x19, 904]
	cbz	w4, .L1214
	sub	w3, w4, #1
	add	x0, x22, 3792
	add	x3, x3, 4096
	add	x1, x19, 712
	add	x3, x3, 2997
	add	x3, x20, x3, lsl 2
	.p2align 2
.L1213:
	ldr	w2, [x0]
	add	x0, x0, 4
	str	w2, [x1]
	add	x1, x1, 4
	cmp	x3, x0
	ldr	w2, [x0, 60]
	str	w2, [x1, 60]
	ldr	w2, [x0, 124]
	str	w2, [x1, 124]
	bne	.L1213
.L1214:
	add	x0, x20, 12288
	ldrb	w0, [x0, 2713]
	cbz	w0, .L1211
	add	x0, x20, 16384
	ldrb	w0, [x0, 2610]
.L1215:
	cmp	w0, 1
	add	x5, x19, 164
	mov	w1, 0
	beq	.L1221
	.p2align 2
.L1224:
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
	bne	.L1224
	add	x6, x19, 260
	mov	w10, 1
	mov	w5, 0
	.p2align 2
.L1225:
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
	bne	.L1225
.L1223:
	mov	w23, 0
	cbz	w4, .L1219
	.p2align 2
.L1227:
	add	x21, x20, x23, uxtw 2
	ldr	w0, [x19, 1140]
	add	x24, x21, 24576
	add	x21, x21, 61440
	add	w23, w23, 1
	ldr	w1, [x24, 3792]
	bl	FSP_GetStoreType
	cmp	w0, wzr
	cset	w0, ne
	str	w0, [x21, 920]
	ldr	w0, [x24, 3792]
	str	w0, [x21, 984]
	ldr	w0, [x22, 3984]
	cmp	w0, w23
	bhi	.L1227
.L1219:
	mov	w0, 0
.L1205:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1221:
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
	bne	.L1221
	add	x6, x19, 260
	mov	w10, 1
	mov	w5, 0
	.p2align 2
.L1222:
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
	bne	.L1222
	b	.L1223
	.p2align 3
.L1211:
	add	x0, x20, 16384
	ldrb	w0, [x0, 2610]
	cbnz	w0, .L1215
	ldr	x10, .LC110
	add	x5, x19, 164
	mov	w1, 0
	.p2align 2
.L1216:
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
	bne	.L1216
	add	x6, x19, 260
	mov	w5, 0
	.p2align 2
.L1217:
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
	bne	.L1217
	b	.L1223
	.p2align 3
.L1202:
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
	b	.L1203
.L1208:
	ldr	x2, .LC109
	mov	w1, 5676
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1205
.L1238:
	ldr	x3, [x21, 2192]
	mov	w1, 5670
	ldr	x2, .LC107
	mov	w0, 0
	ldr	w3, [x3, 544]
	bl	dprint_normal
	mov	w0, -1
	b	.L1205
	.size	WritePicMsg, .-WritePicMsg
	.align	3
.LC105:
	.xword	.LC104
	.align	3
.LC107:
	.xword	.LC106
	.align	3
.LC109:
	.xword	.LC108
	.align	3
.LC110:
	.xword	.LANCHOR2
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
	mov	x22, x0
	mov	x0, x30
	add	x20, x22, 61440
	bl	_mcount
	ldr	w0, [x20, 1152]
	ldr	w7, [x20, 1064]
	cmp	w0, 1
	beq	.L1241
	add	x4, x22, 16384
	add	x6, x22, 12288
	add	x4, x4, 2592
	add	x6, x6, 2688
	add	x26, x22, 20480
.L1242:
	add	w0, w7, 1
	str	w0, [x20, 1064]
	uxtw	x21, w7
	ldr	x8, [x20, 1056]
	ldr	w1, [x22, 14940]
	lsl	x5, x21, 7
	sub	x5, x5, x21
	sub	w1, w1, #1
	lsl	x5, x5, 5
	cmp	w7, w1
	add	x19, x8, x5
	bcs	.L1243
	lsl	x1, x0, 7
	sub	x0, x1, x0
	add	x0, x8, x0, lsl 5
	str	x0, [x19, 4056]
.L1244:
	ldr	x3, [x22, 632]
	ldrb	w2, [x3]
	ldr	w0, [x3, 12]
	cmp	w2, 1
	ccmp	w2, w0, 2, ls
	bcs	.L1245
	.p2align 2
.L1246:
	uxtw	x0, w2
	add	w2, w2, 1
	lsl	x1, x0, 5
	add	x3, x3, x1
	add	x0, x19, x0, lsl 2
	ldr	w3, [x3, 60]
	str	w3, [x0, 16]
	ldr	x3, [x22, 632]
	add	x3, x3, x1
	ldr	w3, [x3, 56]
	str	w3, [x0, 8]
	ldr	x3, [x22, 632]
	add	x1, x3, x1
	ldr	w1, [x1, 64]
	str	w1, [x0, 24]
	ldr	x3, [x22, 632]
	ldr	w0, [x3, 12]
	cmp	w0, w2
	ccmp	w2, 1, 2, hi
	bls	.L1246
.L1245:
	cmp	w0, 1
	bhi	.L1251
	.p2align 2
.L1324:
	add	x1, x19, x0, uxtw 2
	add	w0, w0, 1
	cmp	w0, 2
	str	wzr, [x1, 8]
	str	wzr, [x1, 16]
	str	wzr, [x1, 24]
	bne	.L1324
.L1251:
	add	x23, x22, 57344
	ldrb	w0, [x23, 1649]
	strb	w0, [x19, 1]
	ldr	w0, [x4, 48]
	ldr	w1, [x26, 3192]
	add	w0, w0, 26
	add	w0, w0, w1
	str	w0, [x19, 32]
	ldr	w1, [x26, 3188]
	str	w1, [x19, 36]
	ldr	w1, [x26, 1640]
	str	w1, [x19, 40]
	ldr	w1, [x26, 1636]
	str	w1, [x19, 44]
	ldrb	w1, [x26, 1584]
	strb	w1, [x8, x5]
	ldr	w1, [x26, 1632]
	str	w1, [x19, 48]
	ldrb	w1, [x26, 1590]
	strb	w1, [x19, 2]
	ldrb	w1, [x6, 20]
	strb	w1, [x19, 3]
	ldr	w1, [x26, 1624]
	str	w1, [x19, 52]
	ldr	w1, [x26, 1628]
	str	w1, [x19, 56]
	ldrb	w1, [x26, 1584]
	cmp	w1, 1
	beq	.L1350
	cbz	w1, .L1351
	strb	wzr, [x19, 4]
.L1252:
	ldr	w1, [x4, 52]
	str	w1, [x19, 60]
	ldr	w1, [x4, 56]
	str	w1, [x19, 64]
	ldr	w1, [x26, 3200]
	str	w1, [x19, 68]
	ldr	w1, [x26, 3204]
	str	w1, [x19, 72]
	ldr	w1, [x26, 3196]
	str	w1, [x19, 76]
	ldr	w1, [x20, 1152]
	cmp	w1, 1
	beq	.L1240
	ldr	x1, [x23, 2192]
	cbnz	w7, .L1255
	str	w0, [x1, 616]
	ldr	x0, [x23, 2192]
	ldr	w1, [x19, 32]
	str	w1, [x0, 620]
.L1256:
	ldrb	w0, [x26, 1584]
	cmp	w0, 2
	beq	.L1293
	ldr	w0, [x26, 1624]
	cbz	w0, .L1296
	ldr	x1, [x22, 28696]
	ldr	x1, [x1, 40]
	ldrb	w2, [x1]
	cbz	w2, .L1259
	sub	w3, w0, #1
	mov	x0, x22
	add	x3, x22, x3, lsl 3
	b	.L1261
	.p2align 3
.L1263:
	ldr	x1, [x0, 28704]
	add	x0, x0, 8
	ldr	x1, [x1, 40]
	ldrb	w2, [x1]
	cbz	w2, .L1259
.L1261:
	cmp	x3, x0
	bne	.L1263
.L1296:
	mov	w24, 0
.L1258:
	ldr	w0, [x26, 1628]
	cbz	w0, .L1297
	ldr	x1, [x22, 28960]
	ldr	x1, [x1, 40]
	ldrb	w2, [x1]
	cbz	w2, .L1265
	sub	w3, w0, #1
	mov	x0, x22
	add	x3, x22, x3, lsl 3
	b	.L1267
	.p2align 3
.L1269:
	ldr	x1, [x0, 28968]
	add	x0, x0, 8
	ldr	x1, [x1, 40]
	ldrb	w2, [x1]
	cbz	w2, .L1265
.L1267:
	cmp	x3, x0
	bne	.L1269
.L1297:
	mov	w25, 0
.L1264:
	ldrb	w0, [x23, 1643]
	cbz	w0, .L1270
	ldr	w0, [x26, 1624]
	mov	w28, 0
	cbnz	w0, .L1323
	b	.L1286
	.p2align 3
.L1353:
	cbz	x0, .L1303
	ldr	x0, [x0, 24]
	ldr	w1, [x0, 36]
.L1282:
	lsl	x0, x23, 5
	add	x0, x0, x23, lsl 2
	add	x0, x19, x0
	str	w1, [x0, 1640]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 584]
	str	w1, [x0, 1644]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 560]
	str	w1, [x0, 1632]
	ldr	x1, [x27, 28696]
	ldrb	w1, [x1]
	strb	w1, [x0, 1624]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1, 592]
	strb	w1, [x0, 1626]
	ldr	x1, [x27, 28696]
	ldrb	w1, [x1]
	cmp	w1, 1
	beq	.L1352
	strb	w1, [x0, 1630]
	ldr	x1, [x27, 28696]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 1631]
	ldr	x1, [x27, 28696]
	ldr	w1, [x1, 12]
	str	w1, [x0, 1656]
.L1284:
	ldr	w0, [x26, 1624]
	add	w28, w28, 1
	cmp	w0, w28
	bls	.L1286
.L1323:
	uxtw	x23, w28
	ldr	w0, [x20, 1140]
	add	x27, x22, x23, lsl 3
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 544]
	bl	FSP_GetLogicFs
	ldr	x2, [x27, 28696]
	lsl	x1, x23, 5
	add	x1, x1, x23, lsl 2
	add	x1, x19, x1
	ldr	x2, [x2, 40]
	ldr	w2, [x2, 580]
	str	w2, [x1, 1636]
	ldr	x2, [x27, 28696]
	ldr	x2, [x2, 40]
	ldrb	w2, [x2, 1]
	strb	w2, [x1, 1625]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1]
	cmp	w1, 1
	bne	.L1353
	mov	w1, w24
	b	.L1282
	.p2align 3
.L1243:
	str	xzr, [x19, 4056]
	b	.L1244
	.p2align 3
.L1351:
	ldrb	w1, [x4, 2]
	strb	w1, [x19, 4]
	b	.L1252
	.p2align 3
.L1286:
	ldrb	w0, [x26, 1584]
	cmp	w0, 1
	beq	.L1354
.L1273:
	add	x1, x22, 24576
	add	x0, x19, 3928
	add	x1, x1, 3992
	add	x3, x19, 4056
	.p2align 2
.L1279:
	ldr	w2, [x1], 4
	str	w2, [x0], 4
	cmp	x3, x0
	bne	.L1279
	add	x1, x22, 16384
	ldrb	w0, [x1, 2594]
	str	w0, [x20, 388]
	ldr	w1, [x1, 2636]
	str	w1, [x20, 392]
	cbz	w0, .L1291
	ldrb	w0, [x26, 1584]
	cbz	w0, .L1292
.L1291:
	cmp	w1, 1
	beq	.L1355
.L1293:
	add	x21, x21, 4096
	ldr	x0, [x22, 632]
	add	x21, x22, x21, lsl 3
	str	x0, [x21, 27560]
	str	xzr, [x22, 632]
.L1240:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1352:
	strb	w1, [x0, 1628]
	ldr	x1, [x27, 28696]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 1629]
	ldr	x1, [x27, 28696]
	ldr	w1, [x1, 12]
	str	w1, [x0, 1652]
	b	.L1284
	.p2align 3
.L1255:
	ldr	w2, [x1, 616]
	cmp	w2, w0
	csel	w2, w2, w0, ge
	str	w2, [x1, 616]
	ldr	w2, [x1, 620]
	cmp	w2, w0
	csel	w0, w2, w0, le
	str	w0, [x1, 620]
	b	.L1256
	.p2align 3
.L1303:
	mov	w1, 0
	b	.L1282
	.p2align 3
.L1259:
	ldr	w1, [x1, 544]
	ldr	w0, [x20, 1140]
	bl	FSP_GetLogicFs
	cbz	x0, .L1356
	ldr	x0, [x0, 24]
	ldr	w24, [x0, 36]
	b	.L1258
	.p2align 3
.L1350:
	ldr	w1, [x4, 44]
	strb	w1, [x19, 4]
	b	.L1252
	.p2align 3
.L1241:
	add	x26, x22, 20480
	mov	w4, 2208
	ldr	x0, [x22, 14968]
	mov	w6, 4000
	ldr	x2, [x22, 14960]
	ldr	w1, [x26, 1592]
	umull	x1, w1, w4
	add	x4, x0, x1
	ldr	w0, [x4, 28]
	umull	x0, w0, w6
	add	x6, x2, x0
	b	.L1242
	.p2align 3
.L1270:
	ldr	w0, [x26, 1624]
	mov	w28, 0
	cbnz	w0, .L1322
	b	.L1278
	.p2align 3
.L1357:
	cbz	x0, .L1299
	ldr	x0, [x0, 24]
	ldr	w1, [x0, 36]
.L1276:
	lsl	x0, x23, 5
	add	w28, w28, 1
	add	x0, x0, x23, lsl 2
	add	x0, x19, x0
	str	w1, [x0, 1640]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 584]
	str	w1, [x0, 1644]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 560]
	str	w1, [x0, 1632]
	ldr	x1, [x27, 28696]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 1627]
	ldr	x1, [x27, 28696]
	ldrb	w1, [x1]
	strb	w1, [x0, 1626]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 604]
	str	w1, [x0, 1648]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 652]
	str	w1, [x0, 1652]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 700]
	str	w1, [x0, 1656]
	strb	wzr, [x0, 1624]
	ldr	w0, [x26, 1624]
	cmp	w0, w28
	bls	.L1278
.L1322:
	uxtw	x23, w28
	ldr	w0, [x20, 1140]
	add	x27, x22, x23, lsl 3
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 544]
	bl	FSP_GetLogicFs
	ldr	x2, [x27, 28696]
	lsl	x1, x23, 5
	add	x1, x1, x23, lsl 2
	add	x1, x19, x1
	ldr	x2, [x2, 40]
	ldr	w2, [x2, 580]
	str	w2, [x1, 1636]
	ldr	x2, [x27, 28696]
	ldr	x2, [x2, 40]
	ldrb	w2, [x2, 1]
	strb	w2, [x1, 1625]
	ldr	x1, [x27, 28696]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1]
	cmp	w1, 1
	bne	.L1357
	mov	w1, w24
	b	.L1276
	.p2align 3
.L1299:
	mov	w1, 0
	b	.L1276
	.p2align 3
.L1278:
	ldrb	w0, [x26, 1584]
	cmp	w0, 1
	bne	.L1273
	ldr	w0, [x26, 1628]
	cbz	w0, .L1273
	mov	w27, 0
	b	.L1281
	.p2align 3
.L1358:
	cbz	x0, .L1301
	ldr	x0, [x0, 24]
	ldr	w1, [x0, 36]
.L1280:
	lsl	x0, x23, 5
	add	w27, w27, 1
	add	x0, x0, x23, lsl 2
	add	x0, x19, x0
	str	w1, [x0, 1640]
	ldr	x1, [x24, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 584]
	str	w1, [x0, 2796]
	ldr	x1, [x24, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 560]
	str	w1, [x0, 2784]
	ldr	x1, [x24, 28960]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2779]
	ldr	x1, [x24, 28960]
	ldrb	w1, [x1]
	strb	w1, [x0, 2778]
	ldr	x1, [x24, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 604]
	str	w1, [x0, 2800]
	ldr	x1, [x24, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 652]
	str	w1, [x0, 2804]
	ldr	x1, [x24, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 700]
	str	w1, [x0, 2808]
	strb	wzr, [x0, 2776]
	ldr	w0, [x26, 1628]
	cmp	w0, w27
	bls	.L1273
.L1281:
	uxtw	x23, w27
	ldr	w0, [x20, 1140]
	add	x24, x22, x23, lsl 3
	ldr	x1, [x24, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 544]
	bl	FSP_GetLogicFs
	ldr	x1, [x24, 28960]
	ldr	x1, [x1, 40]
	ldr	w2, [x1, 580]
	lsl	x1, x23, 5
	add	x1, x1, x23, lsl 2
	add	x1, x19, x1
	str	w2, [x1, 2788]
	ldr	x2, [x24, 28960]
	ldr	x2, [x2, 40]
	ldrb	w2, [x2, 1]
	strb	w2, [x1, 2777]
	ldr	x1, [x24, 28960]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1]
	cmp	w1, 1
	bne	.L1358
	mov	w1, w25
	b	.L1280
	.p2align 3
.L1265:
	ldr	w1, [x1, 544]
	ldr	w0, [x20, 1140]
	bl	FSP_GetLogicFs
	cbz	x0, .L1359
	ldr	x0, [x0, 24]
	ldr	w25, [x0, 36]
	b	.L1264
.L1355:
	ldrb	w0, [x26, 1584]
	cmp	w0, 1
	bne	.L1293
.L1292:
	ldr	w0, [x26, 1644]
	mov	w2, 0
	str	w0, [x19, 80]
	ldr	w0, [x26, 1648]
	str	w0, [x19, 84]
	.p2align 2
.L1294:
	ubfiz	x0, x2, 2, 32
	add	w2, w2, 1
	add	x1, x22, x0
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
	ldr	w0, [x26, 1636]
	cmp	w0, w2
	bcs	.L1294
	ldrb	w0, [x26, 1584]
	cmp	w0, 1
	bne	.L1293
	mov	w2, 0
	.p2align 2
.L1295:
	ubfiz	x0, x2, 2, 32
	add	w2, w2, 1
	add	x1, x22, x0
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
	ldr	w0, [x26, 1640]
	cmp	w0, w2
	bcs	.L1295
	b	.L1293
.L1301:
	mov	w1, 0
	b	.L1280
.L1354:
	ldr	w0, [x26, 1628]
	cbz	w0, .L1273
	mov	w27, 0
	b	.L1290
	.p2align 3
.L1361:
	cbz	x0, .L1305
	ldr	x0, [x0, 24]
	ldr	w1, [x0, 36]
.L1287:
	lsl	x0, x23, 5
	add	x0, x0, x23, lsl 2
	add	x0, x19, x0
	str	w1, [x0, 2792]
	ldr	x1, [x24, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 584]
	str	w1, [x0, 2796]
	ldr	x1, [x24, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 560]
	str	w1, [x0, 2784]
	ldr	x1, [x24, 28960]
	ldrb	w1, [x1]
	strb	w1, [x0, 2776]
	ldr	x1, [x24, 28960]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1, 592]
	strb	w1, [x0, 2778]
	ldr	x1, [x24, 28960]
	ldrb	w1, [x1]
	cmp	w1, 1
	beq	.L1360
	strb	w1, [x0, 2782]
	ldr	x1, [x24, 28960]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2783]
	ldr	x1, [x24, 28960]
	ldr	w1, [x1, 12]
	str	w1, [x0, 2808]
.L1289:
	ldr	w0, [x26, 1628]
	add	w27, w27, 1
	cmp	w0, w27
	bls	.L1273
.L1290:
	uxtw	x23, w27
	ldr	w0, [x20, 1140]
	add	x24, x22, x23, lsl 3
	ldr	x1, [x24, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 544]
	bl	FSP_GetLogicFs
	ldr	x1, [x24, 28960]
	ldr	x1, [x1, 40]
	ldr	w2, [x1, 580]
	lsl	x1, x23, 5
	add	x1, x1, x23, lsl 2
	add	x1, x19, x1
	str	w2, [x1, 2788]
	ldr	x2, [x24, 28960]
	ldr	x2, [x2, 40]
	ldrb	w2, [x2, 1]
	strb	w2, [x1, 2777]
	ldr	x1, [x24, 28960]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1]
	cmp	w1, 1
	bne	.L1361
	mov	w1, w25
	b	.L1287
	.p2align 3
.L1360:
	strb	w1, [x0, 2780]
	ldr	x1, [x24, 28960]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2781]
	ldr	x1, [x24, 28960]
	ldr	w1, [x1, 12]
	str	w1, [x0, 2804]
	b	.L1289
.L1305:
	mov	w1, 0
	b	.L1287
.L1359:
	mov	w3, 5928
	ldr	x2, .LC113
	mov	w1, w3
	bl	dprint_normal
	b	.L1240
.L1356:
	mov	w3, 5907
	ldr	x2, .LC113
	mov	w1, w3
	bl	dprint_normal
	b	.L1240
	.size	WriteSliceMsg, .-WriteSliceMsg
	.align	3
.LC113:
	.xword	.LC112
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
	add	x19, x19, 61440
	bl	_mcount
	mov	w0, 0
	ldr	x2, [x19, 912]
	cbz	x2, .L1363
	.p2align 2
.L1364:
	ldp	w3, w1, [x2, 8]
	ldr	x2, [x2, 4056]
	add	w1, w3, w1
	add	w1, w1, 7
	add	w0, w0, w1, lsr 3
	cbnz	x2, .L1364
.L1363:
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
	add	x20, x19, 61440
	bl	_mcount
	ldr	x1, .LC115
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1632]
	ldr	w1, [x20, 1080]
	cbnz	w1, .L1377
	mov	w1, 1048575
	cmp	w0, w1
	bhi	.L1378
	ldr	w1, [x19, 14932]
	ldr	w2, [x19, 14936]
	mul	w1, w1, w2
	sub	w1, w1, #1
	cmp	w0, w1
	bhi	.L1377
	ldr	x1, .LC119
	mov	x0, x19
	bl	ue_v
	mov	w3, w0
	ldr	x2, .LC121
	mov	w19, w0
	mov	w1, 6330
	mov	w0, 17
	bl	dprint_normal
	ldr	w0, [x20, 1080]
	cbnz	w0, .L1377
	cmp	w19, 9
	bls	.L1379
	ldr	x2, .LC124
	mov	w3, w19
	mov	w1, 6355
	mov	w0, 1
	bl	dprint_normal
.L1377:
	mov	w0, -1
.L1369:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1379:
	ldr	x0, .LC122
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx1374
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1374:
	.section	.rodata
	.align	0
	.align	2
.L1374:
	.byte	(.L1373 - .Lrtx1374) / 4
	.byte	(.L1375 - .Lrtx1374) / 4
	.byte	(.L1376 - .Lrtx1374) / 4
	.byte	(.L1373 - .Lrtx1374) / 4
	.byte	(.L1376 - .Lrtx1374) / 4
	.byte	(.L1373 - .Lrtx1374) / 4
	.byte	(.L1375 - .Lrtx1374) / 4
	.byte	(.L1376 - .Lrtx1374) / 4
	.byte	(.L1373 - .Lrtx1374) / 4
	.byte	(.L1376 - .Lrtx1374) / 4
	.text
	.p2align 3
.L1373:
	strb	wzr, [x21, 1584]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1376:
	mov	w1, 2
	strb	w1, [x21, 1584]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1375:
	mov	w1, 1
	strb	w1, [x21, 1584]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1378:
	ldr	x2, .LC117
	mov	w1, 6317
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1369
	.size	SliceCheck, .-SliceCheck
	.align	3
.LC115:
	.xword	.LC114
	.align	3
.LC117:
	.xword	.LC116
	.align	3
.LC119:
	.xword	.LC118
	.align	3
.LC121:
	.xword	.LC120
	.align	3
.LC122:
	.xword	.L1374
	.align	3
.LC124:
	.xword	.LC123
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
	ldr	x2, .LC126
	mov	w1, 6368
	ldr	w3, [x20, 1592]
	mov	w0, 17
	bl	dprint_normal
	ldr	w3, [x20, 1592]
	mov	w0, 2208
	ldr	x1, [x19, 14968]
	umull	x0, w3, w0
	add	x0, x1, x0
	ldrb	w1, [x0, 19]
	cbz	w1, .L1384
	ldr	w3, [x0, 28]
	mov	w1, 4000
	ldr	x2, [x19, 14960]
	mov	w0, 0
	umull	x1, w3, w1
	add	x1, x2, x1
	ldrb	w1, [x1, 23]
	cbz	w1, .L1385
.L1382:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1384:
	ldr	x2, .LC128
	mov	w1, 6374
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1382
	.p2align 3
.L1385:
	ldr	x2, .LC130
	mov	w1, 6383
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1382
	.size	PPSSPSCheck, .-PPSSPSCheck
	.align	3
.LC126:
	.xword	.LC125
	.align	3
.LC128:
	.xword	.LC127
	.align	3
.LC130:
	.xword	.LC129
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
	ldr	x2, .LC132
	mov	w1, 6396
	mov	w3, w20
	mov	w0, 17
	bl	dprint_normal
	mov	w0, 2208
	ldr	x1, [x19, 14968]
	umull	x0, w20, w0
	add	x0, x1, x0
	ldrb	w1, [x0, 19]
	cbz	w1, .L1391
	ldr	w1, [x19, 14944]
	ldr	w3, [x0, 28]
	sub	w0, w1, #1
	cmp	w3, w0
	bhi	.L1392
	mov	w1, 4000
	ldr	x2, [x19, 14960]
	mov	w0, 0
	umull	x1, w3, w1
	add	x1, x2, x1
	ldrb	w1, [x1, 23]
	cbz	w1, .L1393
.L1388:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1391:
	ldr	x2, .LC134
	mov	w3, w20
	mov	w1, 6402
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1388
	.p2align 3
.L1392:
	ldr	x2, .LC136
	mov	w1, 6408
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1388
	.p2align 3
.L1393:
	ldr	x2, .LC138
	mov	w1, 6417
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1388
	.size	PPSSPSCheckTmpId, .-PPSSPSCheckTmpId
	.align	3
.LC132:
	.xword	.LC131
	.align	3
.LC134:
	.xword	.LC133
	.align	3
.LC136:
	.xword	.LC135
	.align	3
.LC138:
	.xword	.LC137
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
	add	x1, x19, 20480
	ldr	w3, [x19, 15012]
	ldr	w0, [x1, 1592]
	ldr	w2, [x1, 3232]
	ldr	w6, [x1, 3228]
	cmp	w2, w0
	ldr	w5, [x1, 3240]
	ldr	w0, [x1, 1600]
	ccmp	w6, w3, 0, eq
	ldrb	w4, [x1, 1585]
	cset	w3, ne
	ldrb	w2, [x1, 3224]
	cmp	w5, w0
	ccmp	w2, w4, 0, eq
	cset	w0, ne
	cmp	w4, wzr
	ccmp	w2, wzr, 4, ne
	orr	w3, w3, w0
	beq	.L1396
	ldrb	w0, [x1, 1586]
	ldrb	w2, [x1, 3225]
	cmp	w2, w0
	cset	w0, ne
	orr	w3, w3, w0
.L1396:
	ldr	w2, [x1, 1612]
	ldr	w0, [x1, 3236]
	cmp	w0, w2
	beq	.L1401
	cmp	w2, wzr
	ccmp	w0, wzr, 4, ne
	cset	w0, eq
.L1397:
	ldrb	w4, [x1, 3226]
	ldrb	w2, [x1, 1587]
	cmp	w4, w2
	cset	w5, ne
	cmp	w4, 5
	ccmp	w2, 5, 0, eq
	orr	w3, w5, w3
	orr	w3, w3, w0
	beq	.L1405
.L1398:
	add	x19, x19, 16384
	ldr	w0, [x19, 792]
	cbnz	w0, .L1399
	ldr	w4, [x1, 704]
	ldr	w5, [x1, 3248]
	ldr	w0, [x1, 708]
	ldr	w2, [x1, 3252]
	cmp	w5, w4
	ccmp	w2, w0, 0, eq
	cset	w0, ne
	orr	w3, w3, w0
.L1400:
	ldr	w4, [x1, 1632]
	mov	w0, 17
	ldr	x2, .LC140
	mov	w1, 6460
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
.L1399:
	cmp	w0, 1
	bne	.L1400
	ldr	w4, [x1, 752]
	ldr	w5, [x1, 3256]
	ldr	w0, [x1, 756]
	ldr	w2, [x1, 3260]
	cmp	w5, w4
	ccmp	w2, w0, 0, eq
	cset	w0, ne
	orr	w3, w3, w0
	b	.L1400
	.p2align 3
.L1401:
	mov	w0, 0
	b	.L1397
	.p2align 3
.L1405:
	ldr	w0, [x1, 1620]
	ldr	w2, [x1, 3244]
	cmp	w2, w0
	cset	w0, ne
	orr	w3, w3, w0
	b	.L1398
	.size	IsNewPic, .-IsNewPic
	.align	3
.LC140:
	.xword	.LC139
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
	cbz	w3, .L1407
	add	w0, w0, 5
	add	x22, x19, 61440
	lsl	w23, w23, w0
	ldrb	w0, [x20, 1584]
	cmp	w0, 1
	bls	.L1458
.L1457:
	ldr	w4, [x22, 1080]
.L1425:
	cmp	w4, wzr
	csetm	w0, ne
.L1456:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1407:
	add	w0, w0, 4
	add	x22, x19, 61440
	lsl	w23, w23, w0
	ldrb	w0, [x20, 1584]
	cmp	w0, 1
	bhi	.L1457
.L1458:
	ldr	x1, .LC142
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 796]
	cbz	w0, .L1416
	ldr	w0, [x20, 1636]
	cmn	w0, #2
	beq	.L1439
	ldr	x24, .LC144
	mov	w27, 0
	ldr	x26, .LC152
	ldr	x25, .LC148
	b	.L1422
	.p2align 3
.L1417:
	cmp	w0, 2
	beq	.L1459
.L1420:
	ldr	w0, [x20, 1636]
	add	w0, w0, 2
	cmp	w0, w27
	bls	.L1460
.L1422:
	add	x21, x19, x27, uxtw 2
	mov	x1, x24
	add	x21, x21, 20480
	mov	x0, x19
	add	w27, w27, 1
	bl	ue_v
	cmp	w0, 3
	str	w0, [x21, 800]
	ldr	w4, [x22, 1080]
	bhi	.L1413
	cbnz	w4, .L1413
	beq	.L1416
	cmp	w0, 1
	bhi	.L1417
	mov	x1, x25
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1064]
	cmp	w23, w0
	ldr	w4, [x22, 1080]
	bls	.L1419
	cbz	w4, .L1420
.L1419:
	ldr	x2, .LC150
	mov	w3, w0
	mov	w1, 6512
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1456
	.p2align 3
.L1416:
	ldrb	w0, [x20, 1584]
.L1409:
	cmp	w0, 1
	bne	.L1457
	ldr	x1, .LC156
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 797]
	cbz	w0, .L1457
	ldr	w0, [x20, 1640]
	cmn	w0, #2
	beq	.L1457
	ldr	x24, .LC158
	mov	w27, 0
	ldr	x26, .LC166
	ldr	x25, .LC162
	b	.L1437
	.p2align 3
.L1431:
	cmp	w0, 2
	beq	.L1461
	ldr	w0, [x20, 1640]
	add	w0, w0, 2
	cmp	w27, w0
	beq	.L1438
.L1436:
	add	w27, w27, 1
	cmp	w27, w0
	bcs	.L1457
.L1437:
	add	x21, x19, x27, uxtw 2
	mov	x1, x24
	add	x21, x21, 20480
	mov	x0, x19
	bl	ue_v
	cmp	w0, 3
	str	w0, [x21, 932]
	ldr	w4, [x22, 1080]
	bhi	.L1429
	cbnz	w4, .L1429
	beq	.L1425
	cmp	w0, 1
	bhi	.L1431
	mov	x1, x25
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1196]
	cmp	w23, w0
	ldr	w4, [x22, 1080]
	bls	.L1433
	cbnz	w4, .L1433
.L1434:
	ldr	w0, [x20, 1640]
	add	w0, w0, 2
	cmp	w0, w27
	bne	.L1436
	ldr	w1, [x21, 932]
	cmp	w1, 3
	beq	.L1436
.L1438:
	ldr	x2, .LC168
	mov	w1, 6572
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1456
	.p2align 3
.L1459:
	mov	x1, x26
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1328]
	b	.L1420
	.p2align 3
.L1461:
	mov	x1, x26
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1456]
	b	.L1434
	.p2align 3
.L1413:
	ldr	x2, .LC146
	mov	w3, w0
	mov	w1, 6496
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1456
	.p2align 3
.L1429:
	ldr	x2, .LC160
	mov	w3, w0
	mov	w1, 6544
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1456
	.p2align 3
.L1460:
	bne	.L1416
.L1411:
	uxtw	x0, w27
	add	x0, x0, 4096
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 4896]
	cmp	w0, 3
	bne	.L1423
	ldrb	w0, [x20, 1584]
	add	x22, x19, 61440
	b	.L1409
.L1433:
	ldr	x2, .LC164
	mov	w3, w0
	mov	w1, 6560
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1456
.L1439:
	mov	w27, 0
	b	.L1411
.L1423:
	ldr	x2, .LC154
	mov	w1, 6525
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1456
	.size	ref_pic_list_reordering, .-ref_pic_list_reordering
	.align	3
.LC142:
	.xword	.LC141
	.align	3
.LC144:
	.xword	.LC143
	.align	3
.LC146:
	.xword	.LC145
	.align	3
.LC148:
	.xword	.LC147
	.align	3
.LC150:
	.xword	.LC149
	.align	3
.LC152:
	.xword	.LC151
	.align	3
.LC154:
	.xword	.LC153
	.align	3
.LC156:
	.xword	.LC155
	.align	3
.LC158:
	.xword	.LC157
	.align	3
.LC160:
	.xword	.LC159
	.align	3
.LC162:
	.xword	.LC161
	.align	3
.LC164:
	.xword	.LC163
	.align	3
.LC166:
	.xword	.LC165
	.align	3
.LC168:
	.xword	.LC167
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
	ldr	x3, [x26, 14968]
	mov	x0, x26
	ldr	w4, [x21, 1592]
	mov	w19, 1
	ldr	x1, .LC170
	mov	w25, 0
	ldr	x5, [x26, 14960]
	umull	x4, w4, w24
	add	x24, x3, x4
	ldr	w3, [x24, 28]
	umull	x3, w3, w20
	add	x20, x5, x3
	bl	ue_v
	str	w0, [x21, 1644]
	lsl	w23, w19, w0
	ldr	w1, [x20, 40]
	cbnz	w1, .L1487
.L1463:
	cmp	w0, 7
	bhi	.L1466
	ldr	w0, [x21, 1648]
	cmp	w0, 7
	bhi	.L1466
	add	x0, x26, 61440
	str	x0, [x29, 104]
	ldr	w3, [x0, 1080]
	cbnz	w3, .L1465
	ldr	x22, .LC176
	mov	w27, 0
	b	.L1474
	.p2align 3
.L1469:
	str	w23, [x1, 1652]
	add	x0, x26, x19, lsl 2
	str	wzr, [x1, 2420]
	add	x0, x0, 20480
	ldr	w1, [x20, 40]
	cbnz	w1, .L1488
.L1471:
	str	wzr, [x0, 1780]
	str	wzr, [x0, 1908]
	str	wzr, [x0, 2548]
	str	wzr, [x0, 2676]
.L1473:
	ldr	w0, [x21, 1636]
	add	w27, w27, 1
	cmp	w0, w27
	bcc	.L1489
.L1474:
	mov	x1, x22
	mov	x0, x26
	uxtw	x19, w27
	bl	u_1
	add	x1, x26, x19, lsl 2
	add	x1, x1, 20480
	cbz	w0, .L1469
	ldr	x1, .LC178
	mov	x0, x26
	bl	se_v
	add	x4, x26, x19, lsl 2
	ldr	x1, .LC180
	add	x28, x4, 20480
	str	w0, [x28, 1652]
	mov	x0, x26
	bl	se_v
	str	w0, [x28, 2420]
	add	x0, x26, x19, lsl 2
	ldr	w1, [x20, 40]
	add	x0, x0, 20480
	cbz	w1, .L1471
.L1488:
	ldr	x1, .LC182
	mov	x0, x26
	bl	u_1
	add	x1, x26, x19, lsl 2
	add	x1, x1, 20480
	cbnz	w0, .L1490
	str	w25, [x1, 1780]
	add	w27, w27, 1
	str	w25, [x1, 1908]
	str	wzr, [x1, 2548]
	str	wzr, [x1, 2676]
	ldr	w0, [x21, 1636]
	cmp	w0, w27
	bcs	.L1474
.L1489:
	ldr	w0, [x24, 44]
	cmp	w0, 1
	beq	.L1475
.L1476:
	ldr	x0, [x29, 104]
	ldr	w0, [x0, 1080]
	cmp	w0, wzr
	csetm	w0, ne
.L1468:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1490:
	ldr	x1, .LC184
	mov	x0, x26
	add	x19, x26, x19, lsl 2
	add	x19, x19, 20480
	bl	se_v
	ldr	x1, .LC186
	str	w0, [x19, 1780]
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 2548]
	ldr	x1, .LC184
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 1908]
	ldr	x1, .LC186
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 2676]
	b	.L1473
	.p2align 3
.L1487:
	ldr	x1, .LC172
	mov	x0, x26
	bl	ue_v
	mov	w25, w0
	ldr	w0, [x21, 1644]
	str	w25, [x21, 1648]
	lsl	w25, w19, w25
	b	.L1463
	.p2align 3
.L1475:
	ldrb	w0, [x21, 1584]
	cmp	w0, 1
	bne	.L1476
	ldr	x22, .LC188
	mov	w28, 0
	ldr	x27, .LC190
	b	.L1482
	.p2align 3
.L1477:
	add	x0, x26, x19, lsl 2
	add	x0, x0, 20480
	str	w23, [x0, 2036]
	str	wzr, [x0, 2804]
	add	x0, x26, x19, lsl 2
	add	x0, x0, 20480
	ldr	w1, [x20, 40]
	cbnz	w1, .L1491
.L1479:
	str	wzr, [x0, 2164]
	str	wzr, [x0, 2292]
	str	wzr, [x0, 2932]
	str	wzr, [x0, 3060]
.L1481:
	ldr	w0, [x21, 1640]
	add	w28, w28, 1
	cmp	w0, w28
	bcc	.L1476
.L1482:
	mov	x1, x22
	mov	x0, x26
	uxtw	x19, w28
	bl	u_1
	cbz	w0, .L1477
	mov	x1, x27
	mov	x0, x26
	bl	se_v
	add	x4, x26, x19, lsl 2
	ldr	x1, .LC192
	add	x24, x4, 20480
	str	w0, [x24, 2036]
	mov	x0, x26
	bl	se_v
	str	w0, [x24, 2804]
	add	x0, x26, x19, lsl 2
	ldr	w1, [x20, 40]
	add	x0, x0, 20480
	cbz	w1, .L1479
.L1491:
	ldr	x1, .LC194
	mov	x0, x26
	bl	u_1
	cbnz	w0, .L1492
	add	x0, x26, x19, lsl 2
	add	x0, x0, 20480
	str	w25, [x0, 2164]
	str	w25, [x0, 2292]
	str	wzr, [x0, 2932]
	str	wzr, [x0, 3060]
	b	.L1481
.L1466:
	add	x2, x26, 61440
	ldr	w3, [x2, 1080]
.L1465:
	ldr	x2, .LC174
	mov	w1, 6605
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1468
.L1492:
	ldr	x1, .LC196
	mov	x0, x26
	add	x19, x26, x19, lsl 2
	add	x19, x19, 20480
	bl	se_v
	ldr	x1, .LC198
	str	w0, [x19, 2164]
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 2932]
	ldr	x1, .LC196
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 2292]
	ldr	x1, .LC198
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 3060]
	b	.L1481
	.size	pred_weight_table, .-pred_weight_table
	.align	3
.LC170:
	.xword	.LC169
	.align	3
.LC172:
	.xword	.LC171
	.align	3
.LC174:
	.xword	.LC173
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
	cbnz	w19, .L1494
	mov	w22, 100
	ldr	x21, .LC202
	ldr	x25, .LC204
	add	x23, x20, 61440
	ldr	x27, .LC210
	ldr	x24, .LC208
	ldr	x26, .LC206
	b	.L1505
	.p2align 3
.L1506:
	cmp	w19, 2
	beq	.L1520
.L1507:
	cmp	w19, 6
	cset	w0, eq
	orr	w0, w28, w0
	cbnz	w0, .L1510
	cmp	w19, 4
	beq	.L1521
.L1511:
	cmp	w19, 6
	bhi	.L1512
	ldr	w0, [x23, 1080]
	cbnz	w0, .L1512
.L1522:
	cbz	w19, .L1514
.L1513:
	subs	w22, w22, #1
	beq	.L1515
.L1505:
	mov	x1, x21
	mov	x0, x20
	bl	ue_v
	cmp	w0, 3
	mov	w19, w0
	and	w0, w0, -3
	cset	w28, eq
	cmp	w0, 1
	bne	.L1506
	mov	x1, x25
	mov	x0, x20
	bl	ue_v
	cmp	w19, 2
	bne	.L1507
.L1520:
	mov	x1, x26
	mov	x0, x20
	bl	ue_v
	ldr	w0, [x23, 1080]
	cbz	w0, .L1522
	.p2align 2
.L1512:
	ldr	x2, .LC212
	mov	w1, 6795
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
.L1497:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1510:
	mov	x1, x24
	mov	x0, x20
	bl	ue_v
	cmp	w19, 4
	bne	.L1511
.L1521:
	mov	x1, x27
	mov	x0, x20
	bl	ue_v
	ldr	w0, [x23, 1080]
	cbz	w0, .L1513
	b	.L1512
	.p2align 3
.L1494:
	ldr	x21, .LC202
	mov	w26, 0
	ldr	x25, .LC204
	add	x22, x20, 24576
	ldr	x24, .LC208
	add	x23, x20, 61440
	b	.L1496
	.p2align 3
.L1498:
	cmp	w1, 2
	beq	.L1523
.L1499:
	cmp	w1, 3
	ccmp	w1, 6, 4, ne
	beq	.L1524
.L1500:
	cmp	w1, 4
	beq	.L1525
.L1501:
	cmp	w1, 6
	bhi	.L1502
.L1527:
	ldr	w0, [x23, 1080]
	cbnz	w0, .L1502
	add	w26, w26, 1
	cbz	w1, .L1514
	cmp	w26, 100
	beq	.L1526
.L1496:
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
	bne	.L1498
	mov	x1, x25
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3276]
	ldr	w1, [x19, 3272]
	cmp	w1, 2
	bne	.L1499
.L1523:
	ldr	x1, .LC206
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
	bne	.L1500
	.p2align 2
.L1524:
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
	bne	.L1501
.L1525:
	ldr	x1, .LC210
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
	cmp	w1, 6
	bls	.L1527
.L1502:
	ldr	x2, .LC212
	mov	w1, 6748
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
.L1514:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L1526:
	ldr	x2, .LC200
	mov	w1, 6712
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1497
.L1515:
	mov	w0, -1
	b	.L1497
	.size	DecMMCO, .-DecMMCO
	.align	3
.LC200:
	.xword	.LC199
	.align	3
.LC202:
	.xword	.LC201
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
	add	x23, x22, 61440
	add	x20, x22, 24576
	bl	_mcount
	ldr	w0, [x23, 1152]
	ldr	w24, [x20, 3180]
	cmp	w0, 1
	mov	w19, w24
	beq	.L1552
.L1529:
	add	x0, x22, 20480
	ldrb	w1, [x0, 1589]
	cbz	w1, .L1531
	cmp	w19, wzr
	cset	w19, eq
	str	w19, [x20, 3180]
.L1539:
	ldrb	w0, [x0, 1587]
	cmp	w0, 5
	beq	.L1553
	ldr	x1, .LC218
	mov	x0, x22
	bl	u_1
	uxtb	w0, w0
	lsl	x1, x19, 6
	sub	x1, x1, x19
	lsl	x1, x1, 2
	sub	x1, x1, x19
	lsl	x1, x1, 1
	sub	x19, x1, x19
	add	x19, x22, x19, lsl 2
	add	x19, x19, 20480
	strb	w0, [x19, 3271]
	cbnz	w0, .L1533
.L1537:
	mov	w21, 0
.L1549:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1531:
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
	cbz	w1, .L1539
	ldrb	w0, [x0, 1587]
	cmp	w0, 5
	beq	.L1554
	ldr	x1, .LC218
	mov	x0, x22
	ldrb	w19, [x21, 3271]
	bl	u_1
	cmp	w19, w0
	bne	.L1555
	ldrb	w0, [x21, 3271]
	cbz	w0, .L1537
	mov	w1, 0
	mov	x0, x22
	bl	DecMMCO
	mov	w21, w0
	b	.L1549
	.p2align 3
.L1533:
	mov	w1, 1
	mov	x0, x22
	bl	DecMMCO
	cmn	w0, #1
	mov	w21, w0
	beq	.L1556
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
.L1554:
	ldr	x1, .LC214
	mov	x0, x22
	ldrb	w19, [x21, 3269]
	bl	u_1
	cmp	w19, w0
	bne	.L1557
	ldr	x1, .LC216
	mov	x0, x22
	ldrb	w19, [x21, 3270]
	bl	u_1
	cmp	w19, w0
	beq	.L1537
	ldr	x2, .LC224
	mov	w1, 6866
	mov	w0, 1
	mov	w21, -1
	bl	dprint_normal
	b	.L1549
	.p2align 3
.L1553:
	ldr	x1, .LC214
	mov	x0, x22
	mov	w21, 0
	bl	u_1
	lsl	x2, x19, 6
	ldr	x1, .LC216
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
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1552:
	add	x0, x22, 12288
	add	x0, x0, 2600
	bl	BsResidBits
	cmp	w0, 15
	ble	.L1542
	ldr	w19, [x20, 3180]
	b	.L1529
.L1555:
	ldr	x2, .LC226
	mov	w1, 6875
	mov	w0, 1
	mov	w21, -1
	bl	dprint_normal
	ldr	x2, .LC228
	mov	w1, 6877
	ldr	w5, [x23, 1084]
	mov	w0, 1
	ldr	w3, [x23, 1104]
	ldr	w4, [x23, 1120]
	bl	dprint_normal
	b	.L1549
.L1557:
	ldr	x2, .LC222
	mov	w1, 6859
	mov	w0, 1
	mov	w21, -1
	bl	dprint_normal
	b	.L1549
.L1542:
	mov	w21, -1
	b	.L1549
.L1556:
	strb	wzr, [x19, 3268]
	mov	w1, 6844
	ldr	x2, .LC220
	mov	w0, 1
	str	w24, [x20, 3180]
	bl	dprint_normal
	b	.L1549
	.size	dec_ref_pic_marking, .-dec_ref_pic_marking
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
	ldr	x1, .LC230
	mov	x0, x23
	bl	ue_v
	mov	w21, w0
	ldr	w0, [x23, 14948]
	sub	w0, w0, #1
	cmp	w21, w0
	bhi	.L1559
	add	x24, x23, 61440
	ldr	w0, [x24, 1080]
	cbnz	w0, .L1559
	mov	w1, w21
	mov	x0, x23
	bl	PPSSPSCheckTmpId
	mov	w22, w0
	cbnz	w0, .L1622
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
	beq	.L1563
	ldr	w0, [x20, 3244]
	cbz	w0, .L1563
.L1564:
	ldr	w1, [x20, 2196]
	mov	x0, x23
	ldr	x2, .LC238
	add	w1, w1, 4
	bl	u_v
	str	w0, [x19, 1600]
	ldr	w1, [x24, 1080]
	cbnz	w1, .L1588
	ldrb	w1, [x19, 1587]
	cmp	w1, 5
	beq	.L1623
.L1567:
	strb	wzr, [x19, 1585]
	strb	wzr, [x19, 1586]
	ldrb	w0, [x20, 18]
	cbz	w0, .L1624
	ldr	w1, [x20, 3252]
	ldr	w2, [x20, 3248]
	add	w0, w1, 1
	madd	w0, w2, w0, w0
.L1591:
	ldrb	w1, [x20, 19]
	cbnz	w1, .L1574
	strb	wzr, [x19, 1588]
.L1576:
	ldr	w1, [x19, 1632]
	cmp	w1, w0
	bcs	.L1625
.L1577:
	ldrb	w0, [x19, 1587]
	cmp	w0, 5
	beq	.L1626
.L1579:
	str	wzr, [x19, 704]
	str	wzr, [x19, 708]
	ldr	w0, [x20, 2200]
	cbz	w0, .L1627
.L1583:
	str	wzr, [x19, 752]
	str	wzr, [x19, 756]
	ldr	w0, [x20, 2200]
	cmp	w0, 1
	beq	.L1628
.L1586:
	ldr	w0, [x24, 1080]
	cbnz	w0, .L1588
	ldrb	w0, [x21, 17]
	cbz	w0, .L1589
	ldr	x1, .LC262
	mov	x0, x23
	bl	ue_v
	cbnz	w0, .L1590
	ldr	w0, [x24, 1080]
	cbnz	w0, .L1590
.L1589:
	mov	x0, x23
	bl	IsNewPic
	uxtb	w0, w0
	strb	w0, [x19, 1589]
	cbnz	w0, .L1602
	ldr	w1, [x19, 1632]
	ldr	w0, [x19, 3264]
	cmp	w1, w0
	bls	.L1629
.L1602:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1563:
	ldrb	w0, [x19, 1584]
	cmp	w0, 2
	beq	.L1564
	ldr	x2, .LC236
	mov	w1, 6924
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	b	.L1602
	.p2align 3
.L1574:
	mov	w1, 1
	strb	w1, [x19, 1588]
.L1593:
	ldr	w1, [x19, 1632]
	cmp	w1, w0, lsr 1
	bcc	.L1577
	ldr	x2, .LC246
	mov	w1, 6967
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	b	.L1602
	.p2align 3
.L1590:
	ldr	x2, .LC264
	mov	w1, 7028
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC265
	ldr	x4, [x0]
	cbz	x4, .L1588
	ldr	w0, [x24, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	mov	w22, -1
	blr	x4
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1624:
	ldr	x1, .LC242
	mov	x0, x23
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x19, 1585]
	cbnz	w0, .L1630
	ldr	w2, [x20, 3252]
	ldr	w1, [x20, 3248]
	add	w0, w2, 1
	ldrb	w3, [x20, 18]
	madd	w1, w1, w0, w0
	lsl	w0, w1, 1
	cbz	w3, .L1591
.L1571:
	ldrb	w2, [x19, 1585]
	mov	w0, 1
	b	.L1572
	.p2align 3
.L1627:
	ldr	w1, [x20, 2204]
	mov	x0, x23
	ldr	x2, .LC254
	add	w1, w1, 4
	bl	u_v
	str	w0, [x19, 704]
	ldrb	w0, [x21, 1]
	cbz	w0, .L1583
	ldrb	w0, [x19, 1585]
	cbnz	w0, .L1583
	ldr	x1, .LC256
	mov	x0, x23
	bl	se_v
	str	w0, [x19, 708]
	b	.L1583
	.p2align 3
.L1623:
	str	w0, [x19, 1596]
	cbz	w0, .L1567
	ldr	x2, .LC240
	mov	w1, 6937
	mov	w0, 1
	bl	dprint_normal
	b	.L1567
	.p2align 3
.L1628:
	ldrb	w0, [x20, 16]
	cbnz	w0, .L1586
	ldr	x1, .LC258
	mov	x0, x23
	bl	se_v
	str	w0, [x19, 752]
	ldrb	w0, [x21, 1]
	cmp	w0, 1
	bne	.L1586
	ldrb	w0, [x19, 1585]
	cbnz	w0, .L1586
	ldr	x1, .LC260
	mov	x0, x23
	bl	se_v
	str	w0, [x19, 756]
	b	.L1586
	.p2align 3
.L1588:
	mov	w22, -1
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1630:
	ldr	x1, .LC244
	mov	x0, x23
	bl	u_1
	strb	w0, [x19, 1586]
	ldr	w0, [x20, 3252]
	ldr	w1, [x20, 3248]
	ldrb	w2, [x20, 18]
	add	w0, w0, 1
	madd	w1, w1, w0, w0
	cbnz	w2, .L1571
	ldrb	w2, [x19, 1585]
	mov	w0, 2
.L1572:
	mul	w0, w0, w1
	cbz	w2, .L1591
	strb	wzr, [x19, 1588]
	cmp	w2, 1
	bne	.L1576
	b	.L1593
	.p2align 3
.L1626:
	ldr	x1, .LC250
	mov	x0, x23
	bl	ue_v
	str	w0, [x19, 1620]
	mov	w1, 65535
	cmp	w0, w1
	bhi	.L1580
	ldr	w0, [x24, 1080]
	cbz	w0, .L1579
.L1580:
	ldr	x2, .LC252
	mov	w1, 6988
	mov	w0, 1
	bl	dprint_normal
	b	.L1579
	.p2align 3
.L1559:
	ldr	x2, .LC232
	mov	w3, w21
	mov	w1, 6906
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1622:
	ldr	x2, .LC234
	mov	w1, 6912
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	b	.L1602
.L1625:
	ldr	x2, .LC248
	mov	w1, 6976
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	b	.L1602
.L1629:
	ldr	x2, .LC267
	mov	w1, 7039
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	b	.L1602
	.size	ProcessSliceHeaderFirstPart, .-ProcessSliceHeaderFirstPart
	.align	3
.LC230:
	.xword	.LC229
	.align	3
.LC232:
	.xword	.LC231
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
	.align	3
.LC248:
	.xword	.LC247
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
.LC265:
	.xword	g_EventReportFunc
	.align	3
.LC267:
	.xword	.LC266
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
	add	x19, x20, 20480
	bl	_mcount
	ldr	w0, [x20, 14948]
	ldr	w3, [x19, 1592]
	sub	w0, w0, #1
	cmp	w0, w3
	bcc	.L1632
	add	x24, x20, 61440
	ldr	w0, [x24, 1080]
	cbnz	w0, .L1632
	mov	x0, x20
	bl	PPSSPSCheck
	cbnz	w0, .L1715
	ldr	w22, [x19, 1592]
	mov	w0, 2208
	ldrb	w1, [x19, 1584]
	ldr	x25, [x20, 14968]
	umull	x22, w22, w0
	cmp	w1, 1
	add	x21, x25, x22
	beq	.L1716
	ldr	w0, [x21, 36]
	cmp	w1, 1
	str	w0, [x19, 1636]
	ldr	w0, [x21, 40]
	str	w0, [x19, 1640]
	bls	.L1717
.L1637:
	cmp	w1, 2
	beq	.L1663
.L1647:
	mov	w0, 32
	str	w0, [x19, 1640]
.L1648:
	mov	x0, x20
	bl	ref_pic_list_reordering
	mov	w23, w0
	cbnz	w0, .L1718
	ldrb	w0, [x21, 2]
	cbz	w0, .L1650
	ldrb	w0, [x19, 1584]
	cbnz	w0, .L1650
	mov	w0, 1
	mov	w3, w0
	b	.L1651
	.p2align 3
.L1650:
	ldr	w0, [x21, 44]
	cmp	w0, 1
	beq	.L1719
.L1667:
	mov	w3, 0
	mov	w0, 0
.L1651:
	ldr	x2, .LC285
	mov	w1, 7134
	strb	w0, [x19, 1591]
	mov	w0, 17
	bl	dprint_normal
	str	wzr, [x19, 1644]
	ldrb	w0, [x19, 1591]
	str	wzr, [x19, 1648]
	cbnz	w0, .L1720
.L1652:
	ldr	w0, [x19, 1612]
	cbnz	w0, .L1721
.L1653:
	str	wzr, [x19, 3188]
	ldrb	w0, [x25, x22]
	cbz	w0, .L1654
	ldrb	w0, [x19, 1584]
	cmp	w0, 1
	bls	.L1722
.L1654:
	ldr	x1, .LC295
	mov	x0, x20
	bl	se_v
	add	x1, x19, 3072
	stp	w0, wzr, [x1, 120]
	stp	wzr, wzr, [x1, 128]
	ldrb	w0, [x21, 3]
	cbnz	w0, .L1723
.L1683:
	mov	w0, w23
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1723:
	ldr	x1, .LC297
	mov	x0, x20
	bl	ue_v
	cmp	w0, 2
	str	w0, [x19, 3196]
	bhi	.L1657
	ldr	w1, [x24, 1080]
	cbnz	w1, .L1657
	cmp	w0, 1
	beq	.L1683
	ldr	x1, .LC301
	mov	x0, x20
	bl	se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x19, 3200]
	bhi	.L1660
	ldr	w0, [x24, 1080]
	cbnz	w0, .L1660
	ldr	x1, .LC305
	mov	x0, x20
	bl	se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x19, 3204]
	bhi	.L1662
	ldr	w0, [x24, 1080]
	cbz	w0, .L1683
.L1662:
	ldr	x2, .LC307
	mov	w1, 7206
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1683
	.p2align 3
.L1720:
	mov	x0, x20
	bl	pred_weight_table
	cbz	w0, .L1652
	ldr	x2, .LC287
	mov	w1, 7142
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1683
	.p2align 3
.L1721:
	mov	x0, x20
	bl	dec_ref_pic_marking
	cbz	w0, .L1653
	ldr	x2, .LC289
	mov	w1, 7152
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1683
	.p2align 3
.L1663:
	mov	w0, 32
	str	w0, [x19, 1636]
	b	.L1647
	.p2align 3
.L1719:
	ldrb	w0, [x19, 1584]
	cmp	w0, 1
	bne	.L1667
	mov	w3, w0
	b	.L1651
	.p2align 3
.L1716:
	ldr	x1, .LC271
	mov	x0, x20
	bl	u_1
	strb	w0, [x19, 1590]
	ldrb	w1, [x19, 1584]
	ldr	w0, [x21, 36]
	str	w0, [x19, 1636]
	cmp	w1, 1
	ldr	w0, [x21, 40]
	str	w0, [x19, 1640]
	bhi	.L1637
	.p2align 2
.L1717:
	ldr	x1, .LC273
	mov	x0, x20
	bl	u_1
	cbnz	w0, .L1638
	ldr	w1, [x19, 1636]
.L1639:
	ldrb	w0, [x19, 1585]
	cbnz	w0, .L1640
	cmp	w1, 15
	bhi	.L1641
	ldr	w0, [x19, 1640]
	cmp	w0, 15
	bhi	.L1724
.L1642:
	ldr	w0, [x24, 1080]
	cbnz	w0, .L1641
.L1643:
	ldrb	w0, [x19, 1584]
	cmp	w0, 2
	beq	.L1663
	cmp	w0, 1
	beq	.L1648
	b	.L1647
	.p2align 3
.L1632:
	ldr	x2, .LC268
	mov	w1, 7053
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	ldr	x25, [sp, 64]
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1722:
	ldr	x1, .LC291
	mov	x0, x20
	bl	ue_v
	cmp	w0, 2
	str	w0, [x19, 3188]
	bhi	.L1655
	ldr	w0, [x24, 1080]
	cbz	w0, .L1654
.L1655:
	ldr	x2, .LC293
	mov	w1, 7166
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1683
	.p2align 3
.L1640:
	cmp	w1, 31
	bhi	.L1644
	ldr	w0, [x19, 1640]
	cmp	w0, 31
	bls	.L1645
	ldrb	w0, [x19, 1584]
	cmp	w0, 1
	bne	.L1645
.L1644:
	ldr	x2, .LC281
	mov	w1, 7107
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1683
	.p2align 3
.L1645:
	ldr	w0, [x24, 1080]
	cbz	w0, .L1643
	b	.L1644
	.p2align 3
.L1724:
	ldrb	w0, [x19, 1584]
	cmp	w0, 1
	bne	.L1642
.L1641:
	ldr	x2, .LC279
	mov	w1, 7096
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1683
	.p2align 3
.L1638:
	ldr	x1, .LC275
	mov	x0, x20
	bl	ue_v
	mov	w1, w0
	ldrb	w0, [x19, 1584]
	str	w1, [x19, 1636]
	cmp	w0, 1
	bne	.L1639
	ldr	x1, .LC277
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 1640]
	ldr	w1, [x19, 1636]
	b	.L1639
	.p2align 3
.L1660:
	ldr	x2, .LC303
	mov	w1, 7197
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1683
	.p2align 3
.L1657:
	ldr	x2, .LC299
	mov	w1, 7186
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1683
	.p2align 3
.L1715:
	ldr	x2, .LC269
	mov	w1, 7059
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1683
	.p2align 3
.L1718:
	ldr	x2, .LC283
	mov	w1, 7127
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L1683
	.size	ProcessSliceHeaderSecondPart, .-ProcessSliceHeaderSecondPart
	.align	3
.LC268:
	.xword	.LC231
	.align	3
.LC269:
	.xword	.LC233
	.align	3
.LC271:
	.xword	.LC270
	.align	3
.LC273:
	.xword	.LC272
	.align	3
.LC275:
	.xword	.LC274
	.align	3
.LC277:
	.xword	.LC276
	.align	3
.LC279:
	.xword	.LC278
	.align	3
.LC281:
	.xword	.LC280
	.align	3
.LC283:
	.xword	.LC282
	.align	3
.LC285:
	.xword	.LC284
	.align	3
.LC287:
	.xword	.LC286
	.align	3
.LC289:
	.xword	.LC288
	.align	3
.LC291:
	.xword	.LC290
	.align	3
.LC293:
	.xword	.LC292
	.align	3
.LC295:
	.xword	.LC294
	.align	3
.LC297:
	.xword	.LC296
	.align	3
.LC299:
	.xword	.LC298
	.align	3
.LC301:
	.xword	.LC300
	.align	3
.LC303:
	.xword	.LC302
	.align	3
.LC305:
	.xword	.LC304
	.align	3
.LC307:
	.xword	.LC306
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
	cbz	w3, .L1726
	ldrb	w2, [x0, 1586]
	strb	w2, [x0, 3225]
.L1726:
	ldrb	w2, [x0, 1587]
	ldr	w3, [x0, 1612]
	strb	w2, [x0, 3226]
	cmp	w2, 5
	str	w3, [x0, 3236]
	beq	.L1733
.L1727:
	ldr	w2, [x1, 2200]
	cbnz	w2, .L1728
	ldr	w2, [x0, 708]
	ldr	w3, [x0, 704]
	str	w3, [x0, 3248]
	str	w2, [x0, 3252]
	ldr	w2, [x1, 2200]
.L1728:
	cmp	w2, 1
	bne	.L1729
	ldr	w2, [x0, 752]
	ldr	w1, [x0, 756]
	str	w2, [x0, 3256]
	str	w1, [x0, 3260]
.L1729:
	add	x19, x19, 61440
	ldr	w0, [x19, 1096]
	add	w0, w0, 1
	str	w0, [x19, 1096]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1733:
	ldr	w2, [x0, 1620]
	str	w2, [x0, 3244]
	b	.L1727
	.size	ExitSlice, .-ExitSlice
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
	add	x1, x19, 20480
	ldrb	w0, [x1, 1584]
	cmp	w0, 1
	beq	.L1736
	cbz	w0, .L1737
	cmp	w0, 2
	bne	.L1734
	ldrb	w0, [x1, 1587]
	add	x19, x19, 57344
	cmp	w0, 5
	beq	.L1744
.L1739:
	str	wzr, [x19, 2240]
.L1734:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1737:
	add	x19, x19, 57344
	ldr	w0, [x19, 2236]
	cmp	w0, 2
	beq	.L1739
	mov	w0, 1
	str	wzr, [x19, 2240]
	str	w0, [x19, 2236]
	b	.L1734
	.p2align 3
.L1736:
	add	x19, x19, 57344
	mov	w0, 2
	str	wzr, [x19, 2240]
	str	w0, [x19, 2236]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1744:
	mov	w0, 1
	str	w0, [x19, 2240]
	b	.L1734
	.size	PicTypeStatistic, .-PicTypeStatistic
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
	add	x0, x19, 16384
	ldrb	w0, [x0, 2592]
	cbz	w0, .L1746
	ldr	x1, [x19, 632]
	ldr	w0, [x1, 8]
	add	w0, w0, 7
	and	w0, w0, -8
	str	w0, [x1, 8]
	ldr	x1, [x19, 632]
	ldr	w0, [x1, 16]
	sub	w0, w0, #1
	str	w0, [x1, 16]
.L1746:
	ldr	x4, [x19, 632]
	ldrb	w21, [x4]
	cbz	w21, .L1757
	sub	w1, w21, #1
	mov	w3, 32
	mov	x2, 80
	add	x0, x4, 48
	mov	w20, 0
	umaddl	x2, w1, w3, x2
	add	x2, x4, x2
	.p2align 2
.L1748:
	ldr	w1, [x0], 32
	cmp	x0, x2
	add	w20, w20, w1
	bne	.L1748
.L1747:
	sxtw	x5, w21
	ldr	w3, [x4, 8]
	ldr	w6, [x4, 16]
	mov	w1, 7323
	add	x5, x4, x5, lsl 5
	ldr	x2, .LC309
	mov	w4, w20
	mov	w0, 8
	ldr	w5, [x5, 48]
	bl	dprint_normal
	ldr	x2, [x19, 632]
	ubfiz	x4, x21, 5, 8
	ldrb	w0, [x2]
	ldr	w1, [x2, 8]
	add	x0, x2, x0, lsl 5
	and	w1, w1, 7
	str	w1, [x0, 60]
	ldr	x2, [x19, 632]
	ldrb	w1, [x2]
	ldr	w0, [x2, 8]
	add	x3, x2, x1, lsl 5
	ldr	w2, [x3, 52]
	add	w0, w2, w0, lsr 3
	sub	w0, w0, w20
	str	w0, [x3, 64]
	ldr	x2, [x19, 632]
	ldrb	w1, [x2]
	ldr	w0, [x2, 8]
	add	x3, x2, x1, lsl 5
	mov	x2, x3
	ldr	w1, [x3, 48]
	mov	w3, w21
	add	w20, w20, w1
	lsl	w20, w20, 3
	sub	w0, w20, w0
	str	w0, [x2, 56]
	ldr	x1, [x19, 632]
	ldrb	w0, [x1]
	add	x0, x1, x0, lsl 5
	ldp	w2, w1, [x0, 60]
	ubfiz	w1, w1, 3, 2
	add	w1, w1, w2
	str	w1, [x0, 60]
	ldr	x2, .LC311
	mov	w1, 7341
	ldr	x5, [x19, 632]
	ldrb	w0, [x5]
	add	x5, x5, x0, lsl 5
	mov	w0, 8
	ldr	w6, [x5, 64]
	and	w6, w6, -4
	str	w6, [x5, 64]
	ldr	x7, [x19, 632]
	add	x4, x7, x4
	ldrb	w6, [x7]
	ldp	w5, w4, [x4, 56]
	add	x6, x7, x6, lsl 5
	ldr	w6, [x6, 64]
	bl	dprint_normal
	ldr	x6, [x19, 632]
	ldr	w3, [x6, 12]
	sub	w0, w3, #1
	cmp	w0, 1
	bhi	.L1768
	ldrb	w21, [x6]
	add	w1, w21, 1
	cmp	w1, 1
	ccmp	w3, w1, 0, ls
	bls	.L1751
	ldr	x20, .LC315
	add	w21, w21, 2
	.p2align 2
.L1752:
	sub	w4, w21, #1
	mov	x2, x20
	lsl	x5, x4, 5
	mov	w3, w4
	add	x6, x6, x5
	add	x4, x4, 1
	lsl	x4, x4, 5
	mov	w1, 7368
	mov	w0, 8
	str	wzr, [x6, 60]
	ldr	x6, [x19, 632]
	add	x7, x6, x4
	add	x6, x6, x5
	ldr	w7, [x7, 20]
	str	w7, [x6, 64]
	ldr	x6, [x19, 632]
	add	x4, x6, x4
	add	x6, x6, x5
	ldr	w4, [x4, 16]
	lsl	w4, w4, 3
	str	w4, [x6, 56]
	ldr	x4, [x19, 632]
	add	x4, x4, x5
	ldp	w7, w6, [x4, 60]
	ubfiz	w6, w6, 3, 2
	add	w6, w6, w7
	str	w6, [x4, 60]
	ldr	x4, [x19, 632]
	add	x4, x4, x5
	ldr	w6, [x4, 64]
	and	w6, w6, -4
	str	w6, [x4, 64]
	ldr	x4, [x19, 632]
	add	x4, x4, x5
	ldp	w5, w4, [x4, 56]
	bl	dprint_normal
	ldr	x6, [x19, 632]
	cmp	w21, 1
	cset	w2, ls
	ldr	w0, [x6, 12]
	cmp	w0, w21
	add	w21, w21, 1
	cset	w1, hi
	tst	w2, w1
	bne	.L1752
	sub	w0, w0, #1
.L1751:
	ubfiz	x0, x0, 5, 32
	ldr	w1, [x6, 16]
	add	x6, x6, x0
	add	x5, x19, 57344
	ldr	w0, [x6, 56]
	sub	w0, w0, w1
	str	w0, [x6, 56]
	ldr	x3, [x19, 632]
	ldrb	w0, [x3]
	ldr	w4, [x3, 12]
	cmp	w0, w4
	bcs	.L1745
	.p2align 2
.L1762:
	ubfiz	x1, x0, 5, 32
	ldr	w2, [x5, 2264]
	add	x1, x3, x1
	add	w0, w0, 1
	ldr	w1, [x1, 64]
	cmp	w1, w2
	bcs	.L1754
	str	w1, [x5, 2264]
	ldr	w4, [x3, 12]
.L1754:
	cmp	w4, w0
	bhi	.L1762
.L1745:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1768:
	ldr	x2, .LC313
	mov	w1, 7346
	mov	w0, 0
	bl	dprint_normal
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L1757:
	mov	w20, 0
	b	.L1747
	.size	CalcStreamBits, .-CalcStreamBits
	.align	3
.LC309:
	.xword	.LC308
	.align	3
.LC311:
	.xword	.LC310
	.align	3
.LC313:
	.xword	.LC312
	.align	3
.LC315:
	.xword	.LC314
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
	str	x0, [x29, 104]
	mov	x0, x30
	mov	w27, w3
	mov	x28, x1
	mov	x25, x2
	mov	x22, x4
	bl	_mcount
	cmp	w27, wzr
	ble	.L1769
	sub	w26, w27, #1
	mov	w0, 8
	ldr	x21, .LC318
	add	x26, x26, 1
	mov	x20, 0
	mov	w24, w0
	mov	w23, 255
	.p2align 2
.L1775:
	cmp	w27, 16
	add	x1, x21, 40
	beq	.L1780
	ldrb	w19, [x20, x1]
.L1772:
	cbnz	w0, .L1773
	mov	w2, w24
.L1774:
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
	bne	.L1775
.L1769:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1773:
	ldr	x1, .LC320
	ldr	x0, [x29, 104]
	bl	se_v
	add	w0, w0, w24
	and	w0, w0, 255
	cmp	w19, wzr
	ccmp	w0, wzr, 0, eq
	cset	w1, eq
	cmp	w0, wzr
	csel	w2, w24, w0, eq
	str	w1, [x22]
	mov	w24, w2
	b	.L1774
	.p2align 3
.L1780:
	add	x1, x21, 24
	ldrb	w19, [x20, x1]
	b	.L1772
	.size	Scaling_List, .-Scaling_List
	.align	3
.LC318:
	.xword	.LANCHOR1
	.align	3
.LC320:
	.xword	.LC319
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessPPS
	.type	ProcessPPS, %function
ProcessPPS:
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
	add	x21, x19, 61440
	bl	_mcount
	ldr	x1, .LC325
	mov	x0, x19
	bl	u_1
	strb	w0, [x20]
	ldr	w0, [x21, 1080]
	cbnz	w0, .L1832
	ldr	x1, .LC327
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 1]
	ldr	w0, [x21, 1080]
	cbnz	w0, .L1832
	ldr	x1, .LC329
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 32]
	cbnz	w0, .L1785
	ldr	w0, [x21, 1080]
	cbz	w0, .L1786
.L1785:
	ldr	x2, .LC331
	mov	w1, 7712
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC332
	ldr	x4, [x0]
	cbz	x4, .L1832
	ldr	w0, [x21, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
	mov	w0, -1
.L1783:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1786:
	ldr	x1, .LC334
	mov	x0, x19
	bl	ue_v
	cmp	w0, 31
	str	w0, [x20, 36]
	bhi	.L1787
	ldr	w0, [x21, 1080]
	cbnz	w0, .L1787
	ldr	x1, .LC338
	mov	x0, x19
	bl	ue_v
	cmp	w0, 31
	str	w0, [x20, 40]
	bhi	.L1789
	ldr	w0, [x21, 1080]
	cbnz	w0, .L1789
	ldr	x1, .LC342
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 2]
	ldr	w0, [x21, 1080]
	cbnz	w0, .L1832
	ldr	x2, .LC344
	mov	w1, 2
	mov	x0, x19
	bl	u_v
	cmp	w0, 2
	str	w0, [x20, 44]
	bhi	.L1833
	ldr	x1, .LC348
	mov	x0, x19
	bl	se_v
	str	w0, [x20, 48]
	ldr	x1, .LC350
	mov	x0, x19
	bl	se_v
	ldr	x1, .LC352
	mov	x0, x19
	bl	se_v
	str	w0, [x20, 52]
	ldr	x1, .LC354
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 3]
	ldr	x1, .LC356
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 4]
	ldr	x1, .LC358
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 17]
	cbnz	w0, .L1834
.L1792:
	ldr	w1, [x20, 52]
	add	x0, x19, 12288
	stp	w1, wzr, [x20, 56]
	strb	wzr, [x20, 18]
	add	x0, x0, 2600
	bl	BsResidBits
	ldr	x1, [x19, 632]
	ldr	w1, [x1, 16]
	add	w1, w1, 3
	cmp	w0, w1
	bcc	.L1813
	ldr	x1, .LC362
	mov	x0, x19
	bl	u_1
	str	w0, [x20, 60]
	ldr	x1, .LC364
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x20, 18]
	beq	.L1794
.L1812:
	ldr	x1, .LC366
	mov	x0, x19
	bl	se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x20, 56]
	bhi	.L1795
	ldr	w0, [x21, 1080]
	cbz	w0, .L1813
.L1795:
	ldr	x2, .LC373
	mov	w1, 7850
	mov	w0, 1
	bl	dprint_normal
.L1832:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, -1
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1813:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, 0
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1834:
	ldr	x2, .LC360
	mov	w1, 7757
	mov	w0, 1
	bl	dprint_normal
	b	.L1792
	.p2align 3
.L1787:
	ldr	x2, .LC336
	mov	w1, 7721
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1783
	.p2align 3
.L1789:
	ldr	x2, .LC340
	mov	w1, 7730
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1783
	.p2align 3
.L1794:
	ldr	x28, .LC369
	add	x22, x29, 120
	ldr	x26, .LC368
	add	x24, x20, 5
	add	x23, x20, 1984
	add	x25, x20, 64
	mov	w27, 0
	b	.L1803
	.p2align 3
.L1839:
	ldr	w0, [x20, 28]
	mov	w1, 4000
	umull	x0, w0, w1
	ldr	x1, [x19, 14960]
	add	x0, x1, x0
	ldrb	w1, [x0, 25]
	cmp	w1, 1
	beq	.L1835
	ldr	x0, .LC369
	ldr	x3, [x0, 104]
	ldr	x0, .LC323
	add	x1, x0, 96
	cbz	w27, .L1836
.L1831:
	mov	x2, 16
	mov	x0, x23
	blr	x3
.L1798:
	add	w27, w27, 1
	add	x22, x22, 4
	cmp	w27, 6
	add	x24, x24, 1
	add	x23, x23, 16
	add	x25, x25, 64
	beq	.L1837
.L1803:
	mov	x1, x26
	mov	x0, x19
	bl	u_1
	cmp	w0, 1
	strb	w0, [x24]
	str	w0, [x22]
	beq	.L1838
	cmp	w27, wzr
	ccmp	w27, 3, 4, ne
	beq	.L1839
	sub	w1, w27, #1
	ldr	x3, [x28, 104]
	add	x1, x1, 124
	add	x1, x20, x1, lsl 4
	b	.L1831
	.p2align 3
.L1837:
	ldr	x22, .LC369
	add	x26, x20, 2080
	ldr	x24, .LC323
	add	x27, x20, 448
	mov	x28, 0
	add	x23, x29, 112
	mov	w25, 4000
.L1811:
	ldr	w0, [x20, 60]
	mov	w8, w28
	cmp	w0, 1
	beq	.L1840
	add	x0, x20, x28
	str	wzr, [x23, x28, lsl 2]
	strb	wzr, [x0, 11]
.L1806:
	ldr	w0, [x20, 28]
	ldr	x1, [x19, 14960]
	umull	x0, w0, w25
	add	x0, x1, x0
	ldrb	w1, [x0, 25]
	cmp	w1, 1
	beq	.L1841
	add	x1, x24, 176
	ldr	x3, [x22, 104]
	cbz	w8, .L1842
.L1810:
	mov	x2, 64
	mov	x0, x26
	blr	x3
.L1807:
	add	x28, x28, 1
	add	x26, x26, 64
	cmp	x28, 2
	add	x27, x27, 256
	bne	.L1811
	b	.L1812
	.p2align 3
.L1838:
	mov	x0, x19
	mov	x4, x22
	mov	w3, 16
	mov	x2, x23
	mov	x1, x25
	bl	Scaling_List
	ldr	w0, [x22]
	cmp	w0, 1
	bne	.L1798
	ldr	x0, .LC323
	cmp	w27, 2
	add	x1, x0, 80
	add	x0, x0, 96
	csel	x1, x0, x1, hi
.L1830:
	ldr	x0, .LC369
	mov	x2, 16
	ldr	x3, [x0, 104]
	mov	x0, x23
	blr	x3
	b	.L1798
.L1835:
	uxtw	x1, w27
	add	x1, x0, x1, lsl 4
	add	x1, x1, 1972
	b	.L1830
.L1833:
	ldr	x2, .LC346
	mov	w1, 7742
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1783
.L1840:
	ldr	x1, .LC371
	mov	x0, x19
	str	w28, [x29, 108]
	bl	u_1
	cmp	w0, 1
	add	x1, x20, x28
	str	w0, [x23, x28, lsl 2]
	ldr	w8, [x29, 108]
	strb	w0, [x1, 11]
	bne	.L1806
	mov	x0, x19
	add	x4, x23, x28, lsl 2
	mov	w3, 64
	mov	x2, x26
	mov	x1, x27
	str	w8, [x29, 108]
	bl	Scaling_List
	ldr	w0, [x23, x28, lsl 2]
	ldr	w8, [x29, 108]
	cmp	w0, 1
	bne	.L1807
	ldr	x0, .LC369
	ldr	x3, [x0, 104]
	ldr	x0, .LC323
	add	x1, x0, 176
	cbnz	w8, .L1810
	add	x1, x0, 112
	b	.L1810
	.p2align 3
.L1841:
	ubfiz	x8, x8, 6, 32
	mov	x2, 64
	add	x1, x0, x8
	ldr	x0, .LC369
	add	x1, x1, 2068
	ldr	x3, [x0, 104]
	mov	x0, x26
	blr	x3
	b	.L1807
.L1836:
	add	x1, x0, 80
	b	.L1831
.L1842:
	ldr	x1, .LC323
	add	x1, x1, 112
	b	.L1810
	.size	ProcessPPS, .-ProcessPPS
	.align	3
.LC323:
	.xword	.LANCHOR2
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
.LC332:
	.xword	g_EventReportFunc
	.align	3
.LC334:
	.xword	.LC333
	.align	3
.LC336:
	.xword	.LC335
	.align	3
.LC338:
	.xword	.LC337
	.align	3
.LC340:
	.xword	.LC339
	.align	3
.LC342:
	.xword	.LC341
	.align	3
.LC344:
	.xword	.LC343
	.align	3
.LC346:
	.xword	.LC345
	.align	3
.LC348:
	.xword	.LC347
	.align	3
.LC350:
	.xword	.LC349
	.align	3
.LC352:
	.xword	.LC351
	.align	3
.LC354:
	.xword	.LC353
	.align	3
.LC356:
	.xword	.LC355
	.align	3
.LC358:
	.xword	.LC357
	.align	3
.LC360:
	.xword	.LC359
	.align	3
.LC362:
	.xword	.LC361
	.align	3
.LC364:
	.xword	.LC363
	.align	3
.LC366:
	.xword	.LC365
	.align	3
.LC368:
	.xword	.LC367
	.align	3
.LC369:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC371:
	.xword	.LC370
	.align	3
.LC373:
	.xword	.LC372
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
	mov	w4, 7864
	cbz	x19, .L1865
	cbz	x20, .L1866
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
	cbz	w3, .L1847
	lsl	w10, w10, 1
	cmn	w10, #6
	beq	.L1847
	mov	x1, x20
	add	x7, x19, 64
	mov	w9, -6
	mov	x8, 0
	.p2align 2
.L1852:
	add	x3, x19, x8
	add	x0, x20, x8
	ldrsb	w3, [x3, 5]
	ldrsb	w0, [x0, 5]
	cmp	w0, w3
	cset	w0, eq
	and	w2, w2, w0
	cbz	w3, .L1848
	cmp	w8, 5
	bhi	.L1849
	sub	x0, x7, #64
	mov	x3, x1
	.p2align 2
.L1850:
	ldr	w5, [x0, 64]
	add	x0, x0, 4
	ldr	w4, [x3, 64]
	add	x3, x3, 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x7, x0
	and	w2, w2, w4
	bne	.L1850
.L1848:
	add	w9, w9, 1
	add	x8, x8, 1
	cmp	w9, w10
	add	x1, x1, 64
	add	x7, x7, 64
	bne	.L1852
.L1847:
	ldr	w0, [x20, 56]
	ldr	w1, [x19, 56]
	cmp	w1, w0
	cset	w0, eq
	tst	w0, w2
	csetm	w0, eq
.L1845:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1849:
	ubfiz	x0, x9, 8, 32
	add	x3, x0, 448
	add	x6, x0, 704
	add	x6, x19, x6
	add	x0, x19, x3
	add	x3, x20, x3
	.p2align 2
.L1851:
	ldr	w5, [x0], 4
	ldr	w4, [x3], 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x6, x0
	and	w2, w2, w4
	bne	.L1851
	add	w9, w9, 1
	add	x8, x8, 1
	cmp	w9, w10
	add	x1, x1, 64
	add	x7, x7, 64
	bne	.L1852
	b	.L1847
.L1866:
	mov	w4, 7865
.L1865:
	ldr	x3, .LC374
	mov	w1, w4
	ldr	x2, .LC375
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1845
	.size	PPSEqual, .-PPSEqual
	.align	3
.LC374:
	.xword	.LC54
	.align	3
.LC375:
	.xword	.LC56
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
	ldr	x1, .LC377
	mov	x0, x19
	bl	ue_v
	mov	w20, w0
	ldr	w0, [x19, 14948]
	sub	w0, w0, #1
	cmp	w20, w0
	bls	.L1868
	ldr	x2, .LC379
	mov	w1, 7630
	mov	w0, 1
	bl	dprint_normal
	ldr	w0, [x19, 14948]
	sub	w1, w0, #1
	cmp	w20, w1
	bls	.L1876
	ldr	x1, .LC380
	ldr	x4, [x1]
	cbz	x4, .L1876
	add	x19, x19, 61440
	mov	w3, 8
	stp	w20, w0, [x29, 56]
	add	x2, x29, 56
	mov	w1, 29
	ldr	w0, [x19, 1140]
	blr	x4
	mov	w0, -1
.L1869:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1868:
	ldr	x1, .LC382
	mov	x0, x19
	bl	ue_v
	mov	w2, w0
	ldr	w0, [x19, 14944]
	sub	w0, w0, #1
	cmp	w2, w0
	bhi	.L1880
	mov	w0, 4000
	ldr	x1, [x19, 14960]
	umull	x0, w2, w0
	add	x0, x1, x0
	ldrb	w0, [x0, 23]
	cbz	w0, .L1881
	mov	w21, 2208
	ldr	x0, [x19, 14968]
	umull	x21, w20, w21
	add	x0, x0, x21
	ldrb	w1, [x0, 19]
	cbz	w1, .L1872
	ldr	x22, .LC387
	mov	x0, x19
	mov	x1, x22
	stp	w20, w2, [x22, 24]
	bl	ProcessPPS
	cbnz	w0, .L1882
	ldr	x1, [x19, 14968]
	mov	x0, x22
	add	x1, x1, x21
	bl	PPSEqual
	cbz	w0, .L1869
	ldr	x3, .LC391
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
	b	.L1869
	.p2align 3
.L1872:
	str	w20, [x0, 24]
	mov	x0, x19
	ldr	x1, [x19, 14968]
	add	x1, x1, x21
	str	w2, [x1, 28]
	ldr	x1, [x19, 14968]
	add	x1, x1, x21
	bl	ProcessPPS
	cbnz	w0, .L1883
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
.L1876:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, -1
	ldp	x29, x30, [sp], 64
	ret
.L1880:
	ldr	x2, .LC384
	mov	w1, 7644
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1869
.L1882:
	ldr	x3, .LC388
	mov	w1, 7661
	ldr	x2, .LC390
	mov	w0, 1
	add	x3, x3, 104
	bl	dprint_normal
	mov	w0, -1
	b	.L1869
.L1881:
	ldr	x2, .LC386
	mov	w1, 7650
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1869
.L1883:
	ldr	x3, .LC388
	mov	w1, 7680
	ldr	x2, .LC393
	mov	w0, 1
	add	x3, x3, 104
	bl	dprint_normal
	ldr	x1, [x19, 14968]
	mov	w2, 1
	mov	w0, -1
	add	x1, x1, x21
	strb	w2, [x1, 20]
	ldr	x1, [x19, 14968]
	add	x21, x1, x21
	strb	wzr, [x21, 19]
	b	.L1869
	.size	H264_DecPPS, .-H264_DecPPS
	.align	3
.LC377:
	.xword	.LC376
	.align	3
.LC379:
	.xword	.LC378
	.align	3
.LC380:
	.xword	g_EventReportFunc
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
	.xword	.LANCHOR3
	.align	3
.LC388:
	.xword	.LANCHOR1
	.align	3
.LC390:
	.xword	.LC389
	.align	3
.LC391:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC393:
	.xword	.LC392
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
	ldr	x1, .LC395
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20]
	cbnz	w0, .L1929
	strb	wzr, [x20, 15]
.L1886:
	ldr	x1, .LC403
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 1]
	cbnz	w0, .L1930
.L1887:
	ldr	x1, .LC407
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 3]
	cbnz	w0, .L1931
	mov	w0, 5
	str	w0, [x20, 28]
.L1889:
	ldr	x1, .LC421
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 6]
	cbnz	w0, .L1932
.L1890:
	ldr	x1, .LC427
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 8]
	cbnz	w0, .L1933
.L1892:
	ldr	x1, .LC436
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 7]
	cbz	w0, .L1894
	ldr	x1, .LC438
	mov	x0, x19
	add	x24, x20, 84
	bl	ue_v
	ldr	x2, .LC440
	mov	w1, 4
	str	w0, [x24, 36]
	mov	x0, x19
	bl	u_v
	strb	w0, [x24, 32]
	ldr	x2, .LC442
	mov	w1, 4
	mov	x0, x19
	bl	u_v
	strb	w0, [x24, 33]
	ldr	w1, [x24, 36]
	cmp	w1, 31
	bhi	.L1895
	add	x28, x19, 61440
	ldr	w0, [x28, 1080]
	cbnz	w0, .L1895
	ldr	x27, .LC446
	mov	w21, 0
	ldr	x26, .LC448
	ldr	x25, .LC450
	.p2align 2
.L1898:
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
	bcs	.L1898
	ldr	x2, .LC452
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 296]
	ldr	x2, .LC454
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 300]
	ldr	x2, .LC456
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 304]
	ldr	x2, .LC458
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 308]
.L1894:
	ldr	x1, .LC460
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 10]
	cbnz	w0, .L1934
	ldrb	w0, [x20, 7]
	add	x28, x19, 61440
	cbz	w0, .L1904
.L1905:
	ldr	x1, .LC462
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 14]
.L1904:
	ldr	x1, .LC464
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 11]
	ldr	x1, .LC466
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 12]
	cbnz	w0, .L1906
	ldr	w0, [x28, 1080]
.L1907:
	cmp	w0, wzr
	csetm	w0, ne
.L1928:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1933:
	ldr	x2, .LC429
	mov	w1, 32
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 52]
	ldr	x2, .LC431
	mov	w1, 32
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 56]
	ldr	x1, .LC433
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 9]
	ldr	w1, [x20, 52]
	cbz	w1, .L1892
	ldr	w0, [x20, 56]
	mov	w3, 10000
	ldr	x2, .LC434
	add	x28, x19, 61440
	umull	x0, w0, w3
	ldr	x2, [x2, 496]
	lsr	x0, x0, 1
	blr	x2
	add	w0, w0, 5
	mov	w1, 52429
	movk	w1, 0xcccc, lsl 16
	umull	x0, w0, w1
	lsr	x0, x0, 35
	str	w0, [x28, 68]
	b	.L1892
	.p2align 3
.L1932:
	ldr	x1, .LC423
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 44]
	ldr	x1, .LC425
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 48]
	b	.L1890
	.p2align 3
.L1931:
	ldr	x2, .LC409
	mov	w1, 3
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 28]
	ldr	x1, .LC411
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 4]
	ldr	x1, .LC413
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 5]
	cbz	w0, .L1889
	ldr	x2, .LC415
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 32]
	ldr	x2, .LC417
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 36]
	ldr	x2, .LC419
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 40]
	b	.L1889
	.p2align 3
.L1930:
	ldr	x1, .LC405
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 2]
	b	.L1887
	.p2align 3
.L1929:
	ldr	x2, .LC397
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	uxtb	w0, w0
	cmp	w0, 255
	strb	w0, [x20, 15]
	bne	.L1886
	ldr	x2, .LC399
	mov	w1, 16
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 16]
	ldr	x2, .LC401
	mov	w1, 16
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 20]
	b	.L1886
	.p2align 3
.L1934:
	ldr	x1, .LC438
	mov	x0, x19
	add	x24, x20, 396
	bl	ue_v
	ldr	x2, .LC440
	mov	w1, 4
	str	w0, [x24, 36]
	mov	x0, x19
	bl	u_v
	strb	w0, [x24, 32]
	ldr	x2, .LC442
	mov	w1, 4
	mov	x0, x19
	bl	u_v
	strb	w0, [x24, 33]
	ldr	w1, [x24, 36]
	cmp	w1, 31
	bhi	.L1900
	add	x28, x19, 61440
	ldr	w0, [x28, 1080]
	cbnz	w0, .L1900
	ldr	x27, .LC446
	mov	w21, 0
	ldr	x26, .LC448
	ldr	x25, .LC450
	.p2align 2
.L1902:
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
	bcs	.L1902
	ldr	x2, .LC452
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 296]
	ldr	x2, .LC454
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 300]
	ldr	x2, .LC456
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 304]
	ldr	x2, .LC458
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 308]
	ldrb	w0, [x20, 7]
	cbnz	w0, .L1905
	ldrb	w0, [x20, 10]
	cbnz	w0, .L1905
	b	.L1904
	.p2align 3
.L1906:
	ldr	x1, .LC468
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 13]
	ldr	x1, .LC470
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 60]
	ldr	x1, .LC472
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 64]
	ldr	x1, .LC474
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 72]
	ldr	x1, .LC476
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 68]
	ldr	x1, .LC478
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 76]
	ldr	x1, .LC480
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 80]
	ldr	w0, [x28, 1080]
	cbz	w0, .L1907
	mov	w0, -1
	b	.L1928
.L1895:
	ldr	x2, .LC444
	mov	w1, 8003
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1928
.L1900:
	ldr	x2, .LC444
	mov	w1, 8033
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1928
	.size	vui_parameters, .-vui_parameters
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
.LC434:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC436:
	.xword	.LC435
	.align	3
.LC438:
	.xword	.LC437
	.align	3
.LC440:
	.xword	.LC439
	.align	3
.LC442:
	.xword	.LC441
	.align	3
.LC444:
	.xword	.LC443
	.align	3
.LC446:
	.xword	.LC445
	.align	3
.LC448:
	.xword	.LC447
	.align	3
.LC450:
	.xword	.LC449
	.align	3
.LC452:
	.xword	.LC451
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
	mov	w4, 8081
	cbz	x19, .L1967
	cbz	x20, .L1968
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
	cbz	w1, .L1939
	mov	x2, x19
	mov	x8, x20
	mov	w9, -6
	mov	x1, 0
	.p2align 2
.L1944:
	add	x4, x19, x1
	add	x3, x20, x1
	add	x6, x2, 64
	ldrsb	w3, [x3, 4]
	ldrsb	w4, [x4, 4]
	cmp	w3, w4
	cset	w3, eq
	and	w0, w0, w3
	cbz	w4, .L1940
	cmp	w1, 5
	bhi	.L1941
	mov	x3, x8
	.p2align 2
.L1942:
	ldr	w5, [x2, 52]
	add	x2, x2, 4
	ldr	w4, [x3, 52]
	add	x3, x3, 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x2, x6
	and	w0, w0, w4
	bne	.L1942
.L1940:
	add	x1, x1, 1
	add	w9, w9, 1
	cmp	x1, 8
	mov	x2, x6
	add	x8, x8, 64
	bne	.L1944
.L1939:
	ldr	w4, [x19, 2196]
	ldr	w3, [x20, 2196]
	ldr	w2, [x20, 2200]
	ldr	w1, [x19, 2200]
	cmp	w4, w3
	ccmp	w2, w1, 0, eq
	cset	w2, eq
	and	w0, w2, w0
	cbz	w1, .L1946
	cmp	w1, 1
	bne	.L1945
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
	cbz	w1, .L1945
	sub	w5, w1, #1
	add	x2, x20, 2220
	add	x5, x5, 556
	add	x1, x19, 2220
	add	x5, x19, x5, lsl 2
	.p2align 2
.L1948:
	ldr	w4, [x1], 4
	ldr	w3, [x2], 4
	cmp	w4, w3
	cset	w3, eq
	cmp	x1, x5
	and	w0, w0, w3
	bne	.L1948
.L1945:
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
	cbnz	w3, .L1949
	ldrb	w1, [x20, 19]
	ldrb	w2, [x19, 19]
	cmp	w2, w1
	cset	w1, eq
	and	w0, w0, w1
.L1949:
	ldrb	w4, [x19, 20]
	ldrb	w3, [x20, 20]
	ldrb	w2, [x20, 21]
	ldrb	w1, [x19, 21]
	cmp	w4, w3
	ccmp	w2, w1, 0, eq
	cset	w2, eq
	and	w0, w2, w0
	cbnz	w1, .L1969
.L1950:
	ldrb	w4, [x19, 22]
	ldrb	w3, [x20, 22]
	ldr	w1, [x20, 3316]
	ldr	w2, [x19, 3316]
	cmp	w4, w3
	ccmp	w2, w1, 0, eq
	cset	w1, eq
	tst	w1, w0
	csetm	w0, eq
.L1937:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1969:
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
	b	.L1950
	.p2align 3
.L1941:
	ubfiz	x3, x9, 8, 32
	add	x4, x3, 436
	add	x7, x3, 692
	add	x7, x19, x7
	add	x3, x19, x4
	add	x4, x20, x4
	.p2align 2
.L1943:
	ldr	w6, [x3], 4
	ldr	w5, [x4], 4
	cmp	w6, w5
	cset	w5, eq
	cmp	x3, x7
	and	w0, w0, w5
	bne	.L1943
	add	x1, x1, 1
	add	x6, x2, 64
	cmp	x1, 8
	add	w9, w9, 1
	mov	x2, x6
	add	x8, x8, 64
	bne	.L1944
	b	.L1939
	.p2align 3
.L1946:
	ldr	w1, [x20, 2204]
	ldr	w2, [x19, 2204]
	cmp	w2, w1
	cset	w1, eq
	and	w0, w0, w1
	b	.L1945
.L1968:
	mov	w4, 8082
.L1967:
	ldr	x3, .LC481
	mov	w1, w4
	ldr	x2, .LC482
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1937
	.size	SPSEqual, .-SPSEqual
	.align	3
.LC481:
	.xword	.LC54
	.align	3
.LC482:
	.xword	.LC56
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
	cbz	w19, .L1982
	mov	w0, 255
	cmp	w19, 16
	ccmp	w19, w0, 4, gt
	bne	.L1982
	cmp	w20, wzr
	ccmp	w22, wzr, 4, ne
	ccmp	w19, w0, 0, eq
	beq	.L1982
	cmp	w19, 1
	beq	.L1996
	cmp	w19, 255
	beq	.L1973
	ldr	x0, .LC483
	sbfiz	x19, x19, 3, 32
	add	x0, x0, 120
	add	x1, x0, x19
	ldr	w20, [x0, x19]
	ldr	w22, [x1, 4]
.L1973:
	lsl	w20, w20, 10
	lsl	w3, w21, 10
	sdiv	w2, w20, w22
	sdiv	w3, w3, w23
	mul	w3, w2, w3
	cmp	w3, wzr
	add	w0, w3, 1023
	csel	w3, w0, w3, lt
	asr	w3, w3, 10
	subs	w1, w3, #2406
	bmi	.L1997
.L1974:
	subs	w0, w3, #2263
	bmi	.L1998
	cmp	w1, w0
	mov	w19, 4
	blt	.L1971
.L1978:
	subs	w1, w3, #1820
	bmi	.L1999
	cmp	w0, w1
	mov	w19, 3
	blt	.L1971
.L1979:
	subs	w0, w3, #1365
	bmi	.L2000
.L1977:
	mov	w19, 2
	cmp	w1, w0
	csinc	w19, w19, wzr, lt
	b	.L1971
	.p2align 3
.L1982:
	mov	w19, 0
	mov	w3, 0
.L1971:
	ldr	x2, .LC485
	mov	w4, w19
	mov	w1, 8239
	mov	w0, 20
	bl	dprint_normal
	ldr	x23, [sp, 48]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1998:
	mov	w0, 2263
	mov	w19, 4
	sub	w0, w0, w3
	cmp	w1, w0
	blt	.L1971
	b	.L1978
	.p2align 3
.L1997:
	mov	w1, 2406
	sub	w1, w1, w3
	b	.L1974
	.p2align 3
.L1996:
	mov	w0, 2160
	cmp	w21, 3840
	ccmp	w23, w0, 0, eq
	bne	.L2001
.L1985:
	mov	w19, 2
	mov	w3, 0
	b	.L1971
	.p2align 3
.L2001:
	sub	w0, w23, #1080
	mov	w1, 1920
	and	w0, w0, -9
	cmp	w0, wzr
	ccmp	w21, w1, 0, eq
	beq	.L1985
	mov	w0, 720
	cmp	w21, 1280
	ccmp	w23, w0, 0, eq
	beq	.L1985
	mov	w0, 480
	cmp	w21, 640
	ccmp	w23, w0, 0, eq
	mov	w19, 5
	cset	w0, eq
	mov	w3, 0
	cmp	w0, wzr
	csinc	w19, w19, wzr, eq
	b	.L1971
	.p2align 3
.L1999:
	mov	w1, 1820
	mov	w19, 3
	sub	w1, w1, w3
	cmp	w0, w1
	blt	.L1971
	b	.L1979
.L2000:
	mov	w0, 1365
	sub	w0, w0, w3
	b	.L1977
	.size	H264GetDar, .-H264GetDar
	.align	3
.LC483:
	.xword	.LANCHOR1
	.align	3
.LC485:
	.xword	.LC484
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessSPS
	.type	ProcessSPS, %function
ProcessSPS:
	stp	x29, x30, [sp, -128]!
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
	cbz	x20, .L2122
	cbz	x19, .L2125
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
	cbnz	w0, .L2126
	mov	w0, 1
	strb	wzr, [x19, 25]
	str	w0, [x19, 40]
.L2020:
	ldr	x1, .LC512
	mov	x0, x20
	bl	ue_v
	cmp	w0, 12
	str	w0, [x19, 2196]
	bhi	.L2033
	add	x21, x20, 61440
	ldr	w0, [x21, 1080]
	cbnz	w0, .L2033
	ldr	x1, .LC516
	mov	x0, x20
	bl	ue_v
	cmp	w0, 2
	str	w0, [x19, 2200]
	bhi	.L2035
	ldr	w1, [x21, 1080]
	cbnz	w1, .L2035
	cbz	w0, .L2127
	cmp	w0, 1
	beq	.L2128
.L2039:
	ldr	x1, .LC573
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3244]
	ldr	w0, [x21, 1080]
	cbnz	w0, .L2122
	ldr	x1, .LC536
	mov	x0, x20
	bl	u_1
	strb	w0, [x19, 17]
	ldr	w0, [x21, 1080]
	cbnz	w0, .L2122
	ldr	x1, .LC538
	mov	x0, x20
	bl	ue_v
	sub	w1, w0, #1
	cmp	w1, 254
	str	w0, [x19, 3248]
	bhi	.L2044
	ldr	w1, [x21, 1080]
	cbnz	w1, .L2044
	ldr	x1, .LC542
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3252]
	ldr	w0, [x21, 1080]
	cbnz	w0, .L2122
	ldr	x1, .LC544
	mov	x0, x20
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x19, 18]
	ldr	w1, [x21, 1080]
	cbnz	w1, .L2122
	cbnz	w0, .L2129
	ldr	x1, .LC575
	mov	x0, x20
	bl	u_1
	ldr	w23, [x19, 3252]
	strb	w0, [x19, 19]
	add	w23, w23, 1
	cmp	w23, 128
	bhi	.L2080
	ldr	w3, [x19, 3248]
	cmp	w23, 1
	mov	w24, 2
	add	w3, w3, 1
	ccmp	w3, 3, 0, hi
	cset	w0, ls
	cbnz	w0, .L2080
.L2048:
	mul	w23, w24, w23
	lsl	w25, w3, 4
	mov	w1, 25165824
	lsl	w23, w23, 4
	mul	w0, w25, w23
	lsr	w0, w0, 1
	lsl	w22, w0, 2
	sub	w0, w22, w0
	cmp	w0, w1
	bhi	.L2130
	ldr	w3, [x19, 32]
	sub	w1, w3, #10
	cmp	w1, 41
	bls	.L2131
.L2050:
	ldr	x2, .LC551
	mov	w1, 8559
	mov	w0, 1
	bl	dprint_normal
	.p2align 2
.L2122:
	mov	w0, -1
.L2142:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2126:
	ldr	x1, .LC491
	mov	x0, x20
	bl	ue_v
	cmp	w0, 1
	str	w0, [x19, 40]
	bls	.L2132
.L2007:
	ldr	x2, .LC493
	mov	w3, w0
	mov	w1, 8280
	mov	w0, 1
	bl	dprint_normal
	ldr	x1, .LC495
	mov	x0, x20
	bl	ue_v
	uxth	w0, w0
	add	w3, w0, 8
	str	w3, [x19, 44]
	cmp	w3, 8
	beq	.L2133
	ldr	x2, .LC497
	mov	w1, 8286
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC498
	ldr	x4, [x0]
	cbz	x4, .L2122
.L2137:
	add	x20, x20, 61440
	ldr	w0, [x19, 44]
	stp	wzr, w0, [x29, 104]
	mov	w3, 8
	add	x2, x29, 104
	ldr	w0, [x20, 1140]
	mov	w1, 47
	blr	x4
	mov	w0, -1
.L2114:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2132:
	add	x21, x20, 61440
	ldr	w1, [x21, 1080]
	cbnz	w1, .L2007
	ldr	x1, .LC495
	mov	x0, x20
	bl	ue_v
	uxth	w0, w0
	add	w3, w0, 8
	str	w3, [x19, 44]
	cmp	w3, 8
	bne	.L2011
	ldr	w0, [x21, 1080]
	cbz	w0, .L2012
.L2011:
	ldr	x2, .LC497
	mov	w1, 8297
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC498
	ldr	x4, [x0]
	cbz	x4, .L2012
	ldr	w1, [x19, 44]
	mov	w3, 8
	ldr	w0, [x21, 1140]
	add	x2, x29, 104
	stp	wzr, w1, [x29, 104]
	mov	w1, 47
	blr	x4
.L2012:
	ldr	x1, .LC500
	mov	x0, x20
	bl	ue_v
	uxth	w0, w0
	add	w3, w0, 8
	str	w3, [x19, 48]
	cmp	w3, 8
	bne	.L2014
	ldr	w0, [x21, 1080]
	cbnz	w0, .L2014
.L2015:
	ldr	x1, .LC504
	mov	x0, x20
	bl	u_1
	cbnz	w0, .L2017
	ldr	w0, [x21, 1080]
	cbnz	w0, .L2017
	ldr	x1, .LC508
	mov	x0, x20
	bl	u_1
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 25]
	bne	.L2020
	ldr	x26, .LC487
	add	x21, x29, 104
	ldr	x25, .LC509
	add	x23, x19, 4
	add	x22, x19, 1972
	add	x24, x19, 52
	mov	w28, 0
	ldr	x27, .LC510
	b	.L2026
	.p2align 3
.L2136:
	ldr	x0, .LC487
	cmp	w28, wzr
	ldr	x3, [x27, 104]
	mov	x2, 16
	add	x1, x0, 80
	add	x0, x26, 96
	csel	x1, x0, x1, ne
	mov	x0, x22
	blr	x3
.L2022:
	add	w28, w28, 1
	add	x21, x21, 4
	cmp	w28, 6
	add	x23, x23, 1
	add	x22, x22, 16
	add	x24, x24, 64
	beq	.L2134
.L2026:
	mov	x1, x25
	mov	x0, x20
	bl	u_1
	cmp	w0, 1
	strb	w0, [x23]
	str	w0, [x21]
	beq	.L2135
	cmp	w28, wzr
	ccmp	w28, 3, 4, ne
	beq	.L2136
	ldr	x0, .LC510
	sub	w1, w28, #1
	mov	x2, 16
	add	x1, x19, x1, lsl 4
	ldr	x3, [x0, 104]
	add	x1, x1, 1972
	mov	x0, x22
	blr	x3
	b	.L2022
	.p2align 3
.L2133:
	add	x0, x20, 61440
	ldr	w0, [x0, 1080]
	cbz	w0, .L2122
	ldr	x2, .LC497
	mov	w1, 8286
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC498
	ldr	x4, [x0]
	cbnz	x4, .L2137
	b	.L2122
	.p2align 3
.L2127:
	ldr	x1, .LC520
	mov	x0, x20
	bl	ue_v
	cmp	w0, 12
	str	w0, [x19, 2204]
	bhi	.L2038
	ldr	w0, [x21, 1080]
	cbz	w0, .L2039
.L2038:
	ldr	x2, .LC522
	mov	w1, 8405
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2114
	.p2align 3
.L2014:
	ldr	x2, .LC502
	mov	w1, 8307
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC498
	ldr	x4, [x0]
	cbz	x4, .L2015
	ldr	w1, [x19, 48]
	mov	w3, 8
	ldr	w0, [x21, 1140]
	add	x2, x29, 104
	stp	wzr, w1, [x29, 104]
	mov	w1, 47
	blr	x4
	b	.L2015
	.p2align 3
.L2129:
	ldr	w23, [x19, 3252]
	strb	wzr, [x19, 19]
	sub	w0, w23, #1
	cmp	w0, 254
	bhi	.L2082
	ldr	w3, [x19, 3248]
	mov	w24, 1
	add	w23, w23, 1
	add	w3, w3, w24
	b	.L2048
	.p2align 3
.L2131:
	ldr	x2, .LC549
	ldrh	w1, [x2,w1,uxtw #1]
	adr	x2, .Lrtx2052
	add	x1, x2, w1, sxth #2
	br	x1
.Lrtx2052:
	.section	.rodata
	.align	0
	.align	2
.L2052:
	.2byte	(.L2051 - .Lrtx2052) / 4
	.2byte	(.L2088 - .Lrtx2052) / 4
	.2byte	(.L2054 - .Lrtx2052) / 4
	.2byte	(.L2054 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2054 - .Lrtx2052) / 4
	.2byte	(.L2055 - .Lrtx2052) / 4
	.2byte	(.L2057 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2057 - .Lrtx2052) / 4
	.2byte	(.L2058 - .Lrtx2052) / 4
	.2byte	(.L2059 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2061 - .Lrtx2052) / 4
	.2byte	(.L2061 - .Lrtx2052) / 4
	.2byte	(.L2062 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2050 - .Lrtx2052) / 4
	.2byte	(.L2063 - .Lrtx2052) / 4
	.2byte	(.L2064 - .Lrtx2052) / 4
	.text
	.p2align 3
.L2054:
	mov	w22, 60416
	movk	w22, 0xd, lsl 16
	.p2align 2
.L2053:
	udiv	w0, w22, w0
	mov	w22, 16
	ldr	x2, .LC553
	mov	w1, 8579
	cmp	w0, w22
	csel	w22, w0, w22, ls
	mov	w3, w22
	mov	w0, 19
	bl	dprint_normal
	ldr	w3, [x19, 3244]
	cmp	w3, w22
	bhi	.L2065
	ldr	w0, [x21, 1080]
	cbz	w0, .L2066
.L2065:
	ldr	x2, .LC555
	mov	w4, w22
	mov	w1, 8584
	mov	w0, 0
	bl	dprint_normal
	ldr	w0, [x19, 3244]
	cmp	w0, 16
	bhi	.L2119
	cmp	w22, w0
	csel	w22, w22, w0, cs
.L2119:
	str	w22, [x19, 3244]
.L2066:
	ldr	x1, .LC557
	mov	x0, x20
	bl	u_1
	strb	w0, [x19, 20]
	ldr	w0, [x21, 1080]
	cbnz	w0, .L2122
	ldr	x1, .LC559
	mov	x0, x20
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x19, 21]
	ldr	w1, [x21, 1080]
	cbnz	w1, .L2122
	cbnz	w0, .L2138
.L2068:
	add	x2, x19, 3072
	lsr	w1, w25, 1
	lsr	w0, w23, 1
	stp	w25, w23, [x2, 204]
	stp	w1, w0, [x2, 212]
.L2070:
	ldr	x1, .LC569
	mov	x0, x20
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x19, 22]
	ldr	w1, [x21, 1080]
	cbnz	w1, .L2122
	mov	w1, 2
	str	w1, [x19, 3332]
	cbnz	w0, .L2139
	mov	w0, 5
	strb	wzr, [x19, 3307]
	str	w0, [x19, 3320]
	mov	w0, 0
.L2073:
	ldr	w1, [x19, 3308]
	mov	w4, w23
	ldr	w2, [x19, 3312]
	mov	w3, w25
	bl	H264GetDar
	str	w0, [x19, 3316]
	ldr	w1, [x19, 3244]
	cbz	w1, .L2076
	ldr	w0, [x19, 3372]
	cmp	w1, w0
	bls	.L2076
.L2077:
	cmp	w22, w1
	csel	w22, w22, w1, ls
.L2078:
	mov	w0, 16
	cmp	w22, w0
	csel	w22, w22, w0, ls
	str	w22, [x20, 14952]
	add	w22, w22, 1
	str	w22, [x19, 3272]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
.L2061:
	mov	w22, 12582912
	b	.L2053
.L2057:
	mov	w22, 30208
	movk	w22, 0x2f, lsl 16
	b	.L2053
.L2088:
	mov	w22, 17920
	movk	w22, 0x5, lsl 16
	b	.L2053
.L2058:
	mov	w22, 30720
	movk	w22, 0x69, lsl 16
	b	.L2053
.L2051:
	mov	w22, 20992
	movk	w22, 0x2, lsl 16
	b	.L2053
.L2062:
	mov	w22, 13369344
	b	.L2053
.L2055:
	mov	w22, 55296
	movk	w22, 0x1b, lsl 16
	b	.L2053
.L2063:
	mov	w22, 57344
	movk	w22, 0x286, lsl 16
	b	.L2053
.L2064:
	mov	w22, 70778880
	b	.L2053
.L2059:
	mov	w22, 7864320
	b	.L2053
.L2080:
	ldr	x2, .LC546
	mov	w1, 8471
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2114
	.p2align 3
.L2076:
	ldr	x0, [x20]
	ldr	w0, [x0, 12]
	sub	w0, w0, #2
	cmp	w0, 1
	bhi	.L2078
	b	.L2077
	.p2align 3
.L2033:
	ldr	x2, .LC514
	mov	w1, 8387
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2114
	.p2align 3
.L2138:
	ldr	x1, .LC561
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3256]
	ldr	x1, .LC563
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3260]
	ldr	x1, .LC565
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3264]
	ldr	x1, .LC567
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
	ble	.L2068
	add	x4, x19, 3072
	add	w2, w2, w3, lsr 1
	add	w1, w1, w0, lsr 1
	stp	w3, w0, [x4, 204]
	stp	w2, w1, [x4, 212]
	b	.L2070
	.p2align 3
.L2139:
	add	x1, x19, 3292
	mov	x0, x20
	bl	vui_parameters
	cbnz	w0, .L2121
	ldrb	w0, [x19, 3304]
	cbz	w0, .L2121
	ldr	w3, [x19, 3372]
	cmp	w3, wzr
	ccmp	w22, w3, 0, ne
	bcc	.L2140
	ldr	w22, [x19, 3244]
	ldrb	w0, [x19, 3307]
	cmp	w22, w3
	csel	w22, w22, w3, cs
	b	.L2073
.L2140:
	ldr	x2, .LC571
	mov	w4, w22
	mov	w1, 8659
	mov	w0, 1
	bl	dprint_normal
	.p2align 2
.L2121:
	ldrb	w0, [x19, 3307]
	b	.L2073
	.p2align 3
.L2128:
	ldr	x1, .LC524
	mov	x0, x20
	bl	u_1
	strb	w0, [x19, 16]
	ldr	w0, [x21, 1080]
	cbnz	w0, .L2122
	ldr	x1, .LC526
	mov	x0, x20
	bl	se_v
	str	w0, [x19, 2208]
	ldr	w0, [x21, 1080]
	cbnz	w0, .L2122
	ldr	x1, .LC528
	mov	x0, x20
	bl	se_v
	str	w0, [x19, 2212]
	ldr	w0, [x21, 1080]
	cbnz	w0, .L2122
	ldr	x1, .LC530
	mov	x0, x20
	bl	ue_v
	cmp	w0, 255
	str	w0, [x19, 2216]
	bhi	.L2040
	ldr	w1, [x21, 1080]
	cbnz	w1, .L2040
	cbz	w0, .L2039
	ldr	x23, .LC534
	mov	w22, 0
	b	.L2043
	.p2align 3
.L2141:
	ldr	w0, [x19, 2216]
	cmp	w0, w22
	bls	.L2039
.L2043:
	mov	x1, x23
	mov	x0, x20
	bl	se_v
	add	x1, x19, x22, uxtw 2
	add	w22, w22, 1
	str	w0, [x1, 2220]
	ldr	w0, [x21, 1080]
	cbz	w0, .L2141
	mov	w0, -1
	b	.L2142
	.p2align 3
.L2134:
	ldr	x24, .LC510
	add	x21, x19, 2068
	ldr	x23, .LC487
	add	x22, x19, 436
	mov	x27, 0
	add	x26, x29, 96
	mov	x28, x24
.L2031:
	mov	x1, x25
	mov	x0, x20
	bl	u_1
	cmp	w0, 1
	add	x2, x19, x27
	str	w0, [x26, x27, lsl 2]
	add	x1, x23, 176
	strb	w0, [x2, 10]
	beq	.L2143
	ldr	x3, [x24, 104]
	cbz	w27, .L2144
.L2030:
	mov	x0, x21
	mov	x2, 64
.L2118:
	blr	x3
.L2028:
	add	x27, x27, 1
	add	x21, x21, 64
	cmp	x27, 2
	add	x22, x22, 256
	bne	.L2031
	b	.L2020
	.p2align 3
.L2135:
	mov	x0, x20
	mov	x4, x21
	mov	x2, x22
	mov	x1, x24
	mov	w3, 16
	bl	Scaling_List
	ldr	w0, [x21]
	cmp	w0, 1
	bne	.L2022
	ldr	x0, .LC487
	cmp	w28, 2
	mov	x2, 16
	add	x1, x0, 80
	add	x0, x0, 96
	csel	x1, x0, x1, hi
	ldr	x0, .LC510
	ldr	x3, [x0, 104]
	mov	x0, x22
	blr	x3
	b	.L2022
	.p2align 3
.L2044:
	ldr	x2, .LC540
	mov	w3, w0
	mov	w1, 8447
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2114
	.p2align 3
.L2035:
	ldr	x2, .LC518
	mov	w1, 8395
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2114
	.p2align 3
.L2017:
	ldr	x2, .LC506
	mov	w1, 8316
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2114
.L2143:
	mov	x0, x20
	add	x4, x26, x27, lsl 2
	mov	x2, x21
	mov	x1, x22
	mov	w3, 64
	bl	Scaling_List
	ldr	w0, [x26, x27, lsl 2]
	cmp	w0, 1
	bne	.L2028
	ldr	x1, .LC487
	mov	x2, 64
	mov	x0, x21
	ldr	x3, [x28, 104]
	add	x1, x1, 176
	cbnz	w27, .L2118
	ldr	x1, .LC487
	add	x1, x1, 112
	b	.L2118
	.p2align 3
.L2125:
	mov	w4, 8266
	ldr	x3, .LC488
	ldr	x2, .LC489
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L2114
.L2130:
	ldr	x2, .LC548
	mov	w1, 8492
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L2114
.L2082:
	ldr	x2, .LC546
	mov	w1, 8481
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2114
.L2040:
	ldr	x2, .LC532
	mov	w1, 8424
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2114
.L2144:
	ldr	x1, .LC487
	add	x1, x1, 112
	b	.L2030
	.size	ProcessSPS, .-ProcessSPS
	.align	3
.LC487:
	.xword	.LANCHOR2
	.align	3
.LC488:
	.xword	.LC54
	.align	3
.LC489:
	.xword	.LC56
	.align	3
.LC491:
	.xword	.LC490
	.align	3
.LC493:
	.xword	.LC492
	.align	3
.LC495:
	.xword	.LC494
	.align	3
.LC497:
	.xword	.LC496
	.align	3
.LC498:
	.xword	g_EventReportFunc
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
.LC509:
	.xword	.LC367
	.align	3
.LC510:
	.xword	vfmw_Osal_Func_Ptr_S
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
.LC534:
	.xword	.LC533
	.align	3
.LC536:
	.xword	.LC535
	.align	3
.LC538:
	.xword	.LC537
	.align	3
.LC540:
	.xword	.LC539
	.align	3
.LC542:
	.xword	.LC541
	.align	3
.LC544:
	.xword	.LC543
	.align	3
.LC546:
	.xword	.LC545
	.align	3
.LC548:
	.xword	.LC547
	.align	3
.LC549:
	.xword	.L2052
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
	ldr	x1, .LC577
	mov	x0, x19
	bl	u_1
	mov	w3, w0
	ldr	x2, .LC579
	mov	w1, 8713
	mov	w0, 15
	bl	dprint_normal
	ldr	x2, .LC581
	mov	w1, 2
	mov	x0, x19
	bl	u_v
	cmp	w0, 1
	beq	.L2156
	ldr	w0, [x20, 40]
	sub	w1, w0, #1
	cmp	w1, 1
	bls	.L2157
.L2148:
	cmp	w0, 1
	beq	.L2158
.L2149:
	ldr	x1, .LC593
	mov	x0, x19
	bl	u_1
	cbnz	w0, .L2159
.L2150:
	ldr	x1, .LC599
	mov	x0, x19
	mov	w19, 0
	bl	u_1
	cmp	w0, 1
	beq	.L2147
	ldr	x2, .LC601
	mov	w3, w0
	ldr	w5, [x20, 40]
	mov	w4, w21
	mov	w1, 8747
	mov	w0, 1
	bl	dprint_normal
.L2147:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2159:
	ldr	x1, .LC595
	mov	x0, x19
	bl	u_1
	mov	w3, w0
	ldr	x2, .LC597
	mov	w1, 8739
	mov	w0, 15
	bl	dprint_normal
	b	.L2150
	.p2align 3
.L2158:
	ldr	x2, .LC589
	mov	w1, 2
	mov	x0, x19
	bl	u_v
	mov	w3, w0
	ldr	x2, .LC591
	mov	w1, 8731
	mov	w0, 15
	bl	dprint_normal
	b	.L2149
	.p2align 3
.L2157:
	ldr	x1, .LC585
	mov	x0, x19
	bl	u_1
	mov	w3, w0
	ldr	x2, .LC587
	mov	w1, 8725
	mov	w0, 15
	bl	dprint_normal
	ldr	w0, [x20, 40]
	b	.L2148
.L2156:
	ldr	x2, .LC583
	mov	w1, 8718
	mov	w19, -1
	bl	dprint_normal
	b	.L2147
	.size	Sps_SvcExt, .-Sps_SvcExt
	.align	3
.LC577:
	.xword	.LC576
	.align	3
.LC579:
	.xword	.LC578
	.align	3
.LC581:
	.xword	.LC580
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
.LC593:
	.xword	.LC592
	.align	3
.LC595:
	.xword	.LC594
	.align	3
.LC597:
	.xword	.LC596
	.align	3
.LC599:
	.xword	.LC598
	.align	3
.LC601:
	.xword	.LC600
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_DecSPS
	.type	H264_DecSPS, %function
H264_DecSPS:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x28, x19, 61440
	bl	_mcount
	ldr	x2, .LC603
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	mov	w21, w0
	ldr	x1, .LC605
	mov	x0, x19
	bl	u_1
	mov	w27, w0
	ldr	x1, .LC607
	mov	x0, x19
	bl	u_1
	mov	w26, w0
	ldr	x1, .LC609
	mov	x0, x19
	bl	u_1
	mov	w25, w0
	ldr	x1, .LC611
	mov	x0, x19
	bl	u_1
	mov	w24, w0
	ldr	x2, .LC613
	mov	w1, 4
	mov	x0, x19
	bl	u_v
	ldr	x2, .LC615
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	mov	w20, w0
	ldr	x1, .LC617
	mov	x0, x19
	bl	ue_v
	mov	w23, w0
	ldr	w0, [x28, 1080]
	cbnz	w0, .L2218
	ldr	w0, [x19, 14944]
	sub	w0, w0, #1
	cmp	w23, w0
	bhi	.L2219
	cmp	w21, 88
	mov	w22, w21
	beq	.L2166
	bgt	.L2167
	cmp	w21, 77
	beq	.L2168
	bgt	.L2169
	cmp	w21, 66
	bne	.L2165
	ldr	x2, .LC621
	mov	w1, 8794
	mov	w0, 1
	bl	dprint_normal
.L2168:
	cmp	w20, 9
	mov	w3, w20
	bls	.L2220
.L2174:
	cmp	w20, 51
	bls	.L2175
	ldr	x2, .LC629
	mov	w4, 51
	mov	w1, 8834
	mov	w0, 1
	bl	dprint_normal
	mov	w3, 51
.L2175:
	mov	w20, 4000
	ldr	x0, [x19, 14960]
	umull	x20, w23, w20
	add	x0, x0, x20
	ldrb	w1, [x0, 23]
	cbz	w1, .L2176
.L2224:
	ldr	x21, .LC630
	mov	x0, x19
	add	x21, x21, 2208
	strb	w27, [x21]
	mov	x1, x21
	strb	w26, [x21, 1]
	strb	w25, [x21, 2]
	strb	w24, [x21, 3]
	stp	w22, w3, [x21, 28]
	str	w23, [x21, 36]
	bl	ProcessSPS
	cbnz	w0, .L2221
	ldr	x1, [x19, 14960]
	mov	x0, x21
	add	x1, x1, x20
	bl	SPSEqual
	cbnz	w0, .L2222
.L2178:
	mov	w0, 86
	cmp	w22, 83
	ccmp	w22, w0, 4, ne
	beq	.L2180
.L2181:
	mov	w0, 0
.L2162:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2167:
	cmp	w21, 122
	beq	.L2171
	ble	.L2223
	cmp	w21, 144
	beq	.L2171
	cmp	w21, 244
	bne	.L2165
.L2171:
	ldr	x0, .LC619
	ldr	x4, [x0]
	cbz	x4, .L2173
	ldr	w0, [x28, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
.L2173:
	ldr	x2, .LC625
	mov	w1, 8817
	mov	w0, 1
	bl	dprint_normal
	cmp	w20, 9
	mov	w3, w20
	bhi	.L2174
	.p2align 2
.L2220:
	ldr	x2, .LC629
	mov	w1, 8828
	mov	w4, 51
	mov	w0, 1
	mov	w20, 4000
	bl	dprint_normal
	umull	x20, w23, w20
	ldr	x0, [x19, 14960]
	mov	w3, 51
	add	x0, x0, x20
	ldrb	w1, [x0, 23]
	cbnz	w1, .L2224
.L2176:
	str	w22, [x0, 28]
	ldr	x0, [x19, 14960]
	strb	w27, [x0, x20]
	mov	x0, x19
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	strb	w26, [x1, 1]
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	strb	w25, [x1, 2]
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	strb	w24, [x1, 3]
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	str	w3, [x1, 32]
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	str	w23, [x1, 36]
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	bl	ProcessSPS
	cbnz	w0, .L2225
	ldr	x0, [x19, 14960]
	mov	w1, 1
	cmp	w22, 83
	add	x0, x0, x20
	strb	w1, [x0, 24]
	ldr	x0, [x19, 14960]
	add	x20, x0, x20
	mov	w0, 86
	ccmp	w22, w0, 4, ne
	strb	w1, [x20, 23]
	bne	.L2181
.L2180:
	mov	x0, x19
	bl	Sps_SvcExt
	cbz	w0, .L2181
	ldr	x2, .LC635
	mov	w1, 8889
	mov	w0, 1
	bl	dprint_normal
.L2218:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, -1
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2219:
	ldr	x2, .LC618
	mov	w1, 8781
	mov	w0, 1
	bl	dprint_normal
	ldr	w1, [x19, 14944]
	sub	w0, w1, #1
	cmp	w23, w0
	bls	.L2218
	ldr	x0, .LC619
	ldr	x4, [x0]
	cbz	x4, .L2218
	ldr	w0, [x28, 1140]
	add	x2, x29, 104
	stp	w23, w1, [x29, 104]
	mov	w3, 8
	mov	w1, 28
	blr	x4
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2223:
	cmp	w21, 100
	beq	.L2168
	cmp	w21, 110
	beq	.L2171
.L2165:
	ldr	x2, .LC627
	mov	w3, w21
	mov	w1, 8821
	mov	w0, 1
	mov	w22, 100
	bl	dprint_normal
	b	.L2168
	.p2align 3
.L2169:
	cmp	w21, 83
	beq	.L2168
	cmp	w21, 86
	beq	.L2168
	b	.L2165
	.p2align 3
.L2166:
	ldr	x2, .LC623
	mov	w1, 8798
	mov	w0, 1
	bl	dprint_normal
	b	.L2168
	.p2align 3
.L2222:
	ldr	x3, .LC633
	mov	w1, 1
	ldr	x0, [x19, 14960]
	mov	x2, 4000
	strb	w1, [x21, 24]
	ldr	x3, [x3, 112]
	add	x0, x0, x20
	strb	w1, [x21, 23]
	mov	x1, x21
	blr	x3
	b	.L2178
	.p2align 3
.L2221:
	mov	w3, 8850
	ldr	x2, .LC632
	mov	w4, w23
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2162
.L2225:
	mov	w3, 8874
	ldr	x2, .LC632
	mov	w1, w3
	mov	w4, w23
	mov	w0, 1
	bl	dprint_normal
	ldr	x1, [x19, 14960]
	mov	w2, 1
	mov	w0, -1
	add	x1, x1, x20
	strb	w2, [x1, 24]
	ldr	x1, [x19, 14960]
	add	x20, x1, x20
	strb	wzr, [x20, 23]
	b	.L2162
	.size	H264_DecSPS, .-H264_DecSPS
	.align	3
.LC603:
	.xword	.LC602
	.align	3
.LC605:
	.xword	.LC604
	.align	3
.LC607:
	.xword	.LC606
	.align	3
.LC609:
	.xword	.LC608
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
.LC618:
	.xword	.LC383
	.align	3
.LC619:
	.xword	g_EventReportFunc
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
.LC630:
	.xword	.LANCHOR3
	.align	3
.LC632:
	.xword	.LC631
	.align	3
.LC633:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC635:
	.xword	.LC634
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
	beq	.L2235
	ldrb	w1, [x0]
	mov	x2, x1
	add	x1, x0, x1, lsl 5
	ldr	x1, [x1, 40]
	cbz	x1, .L2235
	ldr	w1, [x0, 12]
	cmp	w2, 1
	ccmp	w1, 2, 2, ls
	bhi	.L2235
	cmp	w1, w2
	bls	.L2235
	uxtw	x3, w2
	add	x1, x0, x3, lsl 5
	mov	x4, x1
	ldr	w1, [x1, 60]
	ldr	w4, [x4, 48]
	add	w1, w1, w19, lsl 3
	lsl	w4, w4, 3
	cmp	w1, w4
	bhi	.L2230
	b	.L2228
	.p2align 3
.L2231:
	ldr	w5, [x7, 60]
	ldr	w6, [x6, 48]
	sub	w5, w5, w4
	add	w1, w1, w5
	lsl	w4, w6, 3
	cmp	w1, w4
	bls	.L2228
.L2230:
	add	x0, x0, x3, lsl 5
	add	w3, w2, 1
	mov	x2, x3
	str	w4, [x0, 60]
	ldr	x5, [x20, 632]
	ldrb	w0, [x5]
	add	w0, w0, 1
	strb	w0, [x5]
	ldr	x0, [x20, 632]
	add	x7, x0, x3, lsl 5
	ldr	w5, [x0, 12]
	mov	x6, x7
	cmp	w5, w3
	bhi	.L2231
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2228:
	add	x3, x0, x3, lsl 5
	mov	w0, 1
	str	w1, [x3, 60]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2235:
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
	cbz	x19, .L2251
	ldr	x1, [x21, 632]
	cmp	x1, xzr
	ccmp	w20, wzr, 4, ne
	ble	.L2251
	ldrb	w0, [x1]
	mov	x2, x0
	add	x0, x1, x0, lsl 5
	ldr	x0, [x0, 40]
	cbz	x0, .L2251
	ldr	w0, [x1, 12]
	cmp	w2, 1
	ccmp	w0, 2, 2, ls
	bhi	.L2251
	cmp	w0, w2
	bls	.L2251
	mov	w6, 0
.L2246:
	ubfiz	x7, x2, 5, 32
	add	x3, x1, x7
	ldr	w0, [x3, 60]
	ldr	x4, [x3, 40]
	ldr	w8, [x3, 48]
	add	w0, w0, 7
	ubfx	x0, x0, 3, 29
	add	x8, x4, x8
	add	x5, x4, x0
	cmp	x5, x8
	bcs	.L2241
	ldrb	w0, [x4, x0]
	add	w6, w6, 1
	strb	w0, [x19]
	cmp	w6, w20
	add	x19, x19, 1
	add	x5, x5, 1
	ldr	x0, [x21, 632]
	add	x0, x0, x7
	ldr	w3, [x0, 60]
	add	w3, w3, 8
	str	w3, [x0, 60]
	bcc	.L2244
	b	.L2243
	.p2align 3
.L2245:
	ldrb	w1, [x5], 1
	add	w6, w6, 1
	strb	w1, [x19], 1
	cmp	w6, w20
	ldr	x3, [x21, 632]
	add	x3, x3, x7
	ldr	w4, [x3, 60]
	add	w4, w4, 8
	str	w4, [x3, 60]
	bcs	.L2243
.L2244:
	cmp	x8, x5
	bne	.L2245
	ldr	x1, [x21, 632]
.L2241:
	ldrb	w0, [x1]
	add	w2, w2, 1
	add	w0, w0, 1
	strb	w0, [x1]
	ldr	x1, [x21, 632]
	ldr	w0, [x1, 12]
	cmp	w0, w2
	bhi	.L2246
	mov	w0, w6
	b	.L2240
	.p2align 3
.L2243:
	mov	w0, w20
.L2240:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2251:
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
	ble	.L2258
	ldr	w1, [x20, 14912]
	ldr	w0, [x20, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2258
	add	x21, x20, 12288
	mov	w19, 0
	add	x21, x21, 2600
	b	.L2255
	.p2align 3
.L2256:
	ldr	w1, [x20, 14912]
	ldr	w0, [x20, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2259
.L2255:
	mov	w1, 8
	mov	x0, x21
	add	w19, w19, 1
	bl	BsSkip
	cmp	w22, w19
	bne	.L2256
.L2254:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2259:
	mov	w22, w19
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L2258:
	mov	w22, 0
	b	.L2254
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
	ldr	x1, .LC638
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 24]
	ldr	x2, .LC640
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	sxtb	w0, w0
	strb	w0, [x20, 1]
	cbz	w0, .L2266
.L2261:
	ldr	x2, .LC672
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
.L2266:
	ldr	x2, .LC642
	mov	w1, 7
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 16]
	ldr	x2, .LC644
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 3]
	ldr	x2, .LC646
	mov	w1, 6
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 20]
	ldr	x2, .LC648
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 4]
	ldr	x2, .LC650
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 5]
	ldr	x2, .LC652
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 6]
	ldr	x2, .LC654
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 7]
	ldr	x2, .LC656
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 8]
	ldr	x2, .LC658
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 9]
	ldrsb	w1, [x20, 3]
	cbnz	w1, .L2262
	ldr	w0, [x20, 16]
	cmp	w0, 5
	beq	.L2262
	ldr	x2, .LC660
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 10]
	ldr	x2, .LC662
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 11]
	ldr	x2, .LC664
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 12]
	ldr	x2, .LC666
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 13]
.L2262:
	ldr	x2, .LC668
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	str	w0, [x21, 3212]
	ldr	x1, .LC670
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 3216]
	b	.L2261
	.size	H264_DecFramePackingSEI, .-H264_DecFramePackingSEI
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
	add	x0, x19, 20480
	mov	w1, 2208
	ldr	x9, [x19, 14968]
	add	x3, x19, 24576
	ldr	x8, [x19, 14960]
	ldr	w2, [x0, 1592]
	mov	w0, 4000
	ldr	w5, [x3, 3240]
	ldr	w6, [x3, 3236]
	umull	x1, w2, w1
	add	w2, w5, 1
	ldr	w5, [x3, 3224]
	add	x1, x9, x1
	add	w6, w6, 1
	cmp	w6, 1
	ccmp	w5, wzr, 0, ne
	ldr	w1, [x1, 28]
	str	w2, [x3, 3240]
	ldr	w2, [x3, 3228]
	umull	x0, w1, w0
	str	w6, [x3, 3236]
	add	x0, x8, x0
	str	w5, [x3, 3244]
	add	x0, x0, 3292
	str	w2, [x3, 3252]
	ldr	w1, [x0, 52]
	str	w1, [x3, 3288]
	ldr	w1, [x0, 56]
	str	w1, [x3, 3292]
	bne	.L2268
	ldr	w5, [x3, 3248]
	add	w5, w5, 2
	str	w5, [x3, 3244]
.L2268:
	cmp	w6, 1
	add	x4, x3, 3232
	beq	.L2275
	ldrb	w1, [x4, 80]
	cmp	w1, 1
	ldr	x1, [x4, 48]
	add	x1, x1, x5, uxtw
	str	x1, [x4, 40]
	beq	.L2276
.L2270:
	strb	wzr, [x3, 3312]
	add	x1, x1, x2, uxtw
	lsr	x1, x1, 1
	ldr	w2, [x0, 76]
	ldr	w4, [x0, 52]
	sub	x2, x1, x2
	mul	x2, x2, x4
	str	x2, [x3, 3256]
	ldr	w0, [x0, 76]
	str	w5, [x3, 3248]
	sub	x1, x1, x0
	str	x1, [x3, 3264]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2275:
	mov	x1, 0
	str	xzr, [x3, 3272]
	str	xzr, [x3, 3280]
	b	.L2270
	.p2align 3
.L2276:
	str	x1, [x4, 48]
	b	.L2270
	.size	H264_Sei_Get_Dpb_Output_Time, .-H264_Sei_Get_Dpb_Output_Time
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
	cmp	w20, 5
	beq	.L2282
.L2277:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2282:
	ldr	x0, [x19]
	ldr	x0, [x0, 32]
	cmn	x0, #1
	beq	.L2277
	ldr	x1, [x19, 27840]
	str	x0, [x19, 27872]
	str	x1, [x19, 27880]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H264_Get_Last_IDR_Frame_Info, .-H264_Get_Last_IDR_Frame_Info
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
	add	x1, x19, 24576
	ldr	x3, [x19, 27840]
	ldr	x6, [x19, 27872]
	ldr	x7, [x19, 27880]
	ldr	w4, [x1, 3288]
	ldr	w5, [x1, 3292]
	cbz	w4, .L2286
	mov	w1, w4
	mov	w2, w5
	b	.L2285
	.p2align 3
.L2287:
	mov	w1, w0
.L2285:
	udiv	w0, w2, w1
	msub	w0, w0, w1, w2
	mov	w2, w1
	cbnz	w0, .L2287
.L2284:
	udiv	w4, w4, w1
	sub	x0, x3, x7
	lsl	w2, w0, 6
	add	x19, x19, 57344
	sub	w2, w2, w0
	lsl	w2, w2, 1
	sub	w0, w2, w0
	lsl	w0, w0, 3
	udiv	w1, w5, w1
	mul	w0, w0, w4
	udiv	w1, w0, w1
	add	x1, x1, x6
	str	x1, [x19, 1864]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L2286:
	mov	w1, w5
	b	.L2284
	.size	H264_Sei_Get_Frame_Pts, .-H264_Sei_Get_Frame_Pts
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
	cbnz	w0, .L2289
	ldr	w1, [x20, 14944]
	cmp	w1, wzr
	ble	.L2290
	ldrb	w0, [x3, 23]
	cbnz	w0, .L2307
	sub	w1, w1, #1
	add	x0, x3, 4000
	add	x2, x1, 1
	lsl	x1, x2, 6
	sub	x1, x1, x2
	lsl	x1, x1, 1
	sub	x1, x1, x2
	add	x2, x3, x1, lsl 5
	b	.L2293
	.p2align 3
.L2294:
	ldrb	w1, [x1]
	cbnz	w1, .L2291
.L2293:
	cmp	x0, x2
	mov	x19, x0
	add	x0, x0, 4000
	sub	x1, x0, #3977
	bne	.L2294
.L2290:
	ldr	x2, .LC674
	mov	w1, 9210
	mov	w0, 1
	mov	w19, -1
	bl	dprint_normal
.L2295:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L2307:
	mov	x19, x3
	.p2align 2
.L2291:
	cbz	x19, .L2290
.L2289:
	ldrb	w0, [x19, 22]
	cbz	w0, .L2297
	ldrb	w0, [x19, 3299]
	cbz	w0, .L2308
	ldr	w1, [x19, 3676]
	ldr	w22, [x19, 3680]
	add	w1, w1, 1
	add	w22, w22, 1
.L2301:
	ldr	x2, .LC676
	mov	x0, x20
	add	x21, x20, 24576
	bl	u_v
	ldr	x2, .LC678
	mov	w1, w22
	str	w0, [x21, 3224]
	mov	x0, x20
	bl	u_v
	str	w0, [x21, 3228]
	add	x1, x20, 61440
	ldr	x0, .LC679
	ldrsw	x1, [x1, 1140]
	ldr	x0, [x0, x1, lsl 3]
	add	x0, x0, 217088
	ldrsb	w1, [x0, 3072]
	cmp	w1, 1
	beq	.L2309
.L2297:
	ldrb	w0, [x19, 3303]
	mov	w19, 0
	cbz	w0, .L2295
	ldr	x2, .LC681
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
.L2308:
	ldrb	w0, [x19, 3302]
	cbz	w0, .L2297
	ldr	w1, [x19, 3988]
	ldr	w22, [x19, 3992]
	add	w1, w1, 1
	add	w22, w22, 1
	b	.L2301
	.p2align 3
.L2309:
	ldr	w1, [x0, 3188]
	cmp	w1, 1
	bne	.L2297
	ldr	w0, [x0, 3192]
	cmp	w0, 2
	bne	.L2297
	mov	x0, x20
	bl	H264_Sei_Get_Dpb_Output_Time
	b	.L2297
	.size	H264_DecPicTimingSEI, .-H264_DecPicTimingSEI
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
	.xword	s_pstVfmwChan
	.align	3
.LC681:
	.xword	.LC680
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
	add	x22, x19, 61440
	bl	_mcount
	strb	wzr, [x29, 127]
	ldr	x0, .LC682
	ldrsw	x1, [x22, 1140]
	ldr	x0, [x0, x1, lsl 3]
	add	x0, x0, 217088
	ldrsb	w1, [x0, 3072]
	cmp	w1, 1
	beq	.L2439
.L2311:
	ldr	x0, [x19, 632]
	mov	w1, 32
	str	w1, [x0, 60]
.L2312:
	mov	w20, 0
	b	.L2317
	.p2align 3
.L2313:
	ldrb	w2, [x29, 127]
	mov	w1, 1
	mov	x0, x19
	add	w20, w20, w2
	bl	SkipBytes
	cmp	w0, wzr
	ble	.L2440
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2441
.L2317:
	mov	w2, 1
	add	x1, x29, 127
	mov	x0, x19
	bl	GetBytes
	cmp	w0, wzr
	bgt	.L2313
	ldr	x2, .LC684
	mov	w1, 9298
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
.L2314:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2440:
	ldr	x2, .LC684
	mov	w1, 9306
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
.L2441:
	ldr	x23, .LC692
	mov	w24, 0
	ldr	x27, .LC694
	add	x23, x23, 256
	mov	x26, x23
	mov	x25, x23
.L2407:
	mov	w21, 0
	b	.L2321
	.p2align 3
.L2318:
	ldrb	w2, [x29, 127]
	mov	w1, 1
	mov	x0, x19
	add	w21, w21, w2
	bl	SkipBytes
	cmp	w0, wzr
	ble	.L2442
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2443
.L2321:
	mov	w2, 1
	add	x1, x29, 127
	mov	x0, x19
	bl	GetBytes
	cmp	w0, wzr
	bgt	.L2318
	ldr	x2, .LC686
	mov	w1, 9328
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
.L2439:
	ldr	w1, [x0, 3188]
	cmp	w1, 1
	bne	.L2311
	ldr	w1, [x0, 3192]
	cmp	w1, 2
	bne	.L2311
	ldr	w0, [x0, 3184]
	cmp	w0, 1
	bne	.L2311
	ldr	x0, [x19, 632]
	mov	w1, 48
	str	w1, [x0, 60]
	b	.L2312
	.p2align 3
.L2442:
	ldr	x2, .LC686
	mov	w1, 9336
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
.L2443:
	cmp	w21, 409600
	bgt	.L2444
	ldr	x0, [x19, 632]
	ldr	w1, [x0, 12]
	ldr	w3, [x0, 60]
	cmp	w1, 2
	beq	.L2445
.L2324:
	cmp	w20, 45
	bls	.L2446
.L2325:
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbnz	w0, #31, .L2447
.L2401:
	mov	w1, w21
	mov	x0, x19
	bl	SkipBytes
.L2433:
	ldr	w0, [x22, 72]
.L2350:
	cmp	w0, 3
	bhi	.L2448
	mov	w20, 0
	b	.L2406
	.p2align 3
.L2403:
	ldrb	w2, [x29, 127]
	mov	w1, 1
	mov	x0, x19
	add	w20, w20, w2
	bl	SkipBytes
	cmp	w0, wzr
	ble	.L2449
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2450
.L2406:
	mov	w2, 1
	add	x1, x29, 127
	mov	x0, x19
	bl	GetBytes
	cmp	w0, wzr
	bgt	.L2403
	ldr	x2, .LC686
	mov	w1, 9875
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2314
.L2446:
	ldr	x0, .LC689
	ldrh	w0, [x0,w20,uxtw #1]
	adr	x1, .Lrtx2327
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx2327:
	.section	.rodata
	.align	0
	.align	2
.L2327:
	.2byte	(.L2326 - .Lrtx2327) / 4
	.2byte	(.L2328 - .Lrtx2327) / 4
	.2byte	(.L2329 - .Lrtx2327) / 4
	.2byte	(.L2330 - .Lrtx2327) / 4
	.2byte	(.L2331 - .Lrtx2327) / 4
	.2byte	(.L2331 - .Lrtx2327) / 4
	.2byte	(.L2332 - .Lrtx2327) / 4
	.2byte	(.L2333 - .Lrtx2327) / 4
	.2byte	(.L2334 - .Lrtx2327) / 4
	.2byte	(.L2335 - .Lrtx2327) / 4
	.2byte	(.L2336 - .Lrtx2327) / 4
	.2byte	(.L2337 - .Lrtx2327) / 4
	.2byte	(.L2338 - .Lrtx2327) / 4
	.2byte	(.L2339 - .Lrtx2327) / 4
	.2byte	(.L2340 - .Lrtx2327) / 4
	.2byte	(.L2341 - .Lrtx2327) / 4
	.2byte	(.L2342 - .Lrtx2327) / 4
	.2byte	(.L2343 - .Lrtx2327) / 4
	.2byte	(.L2344 - .Lrtx2327) / 4
	.2byte	(.L2345 - .Lrtx2327) / 4
	.2byte	(.L2346 - .Lrtx2327) / 4
	.2byte	(.L2347 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2325 - .Lrtx2327) / 4
	.2byte	(.L2348 - .Lrtx2327) / 4
	.text
.L2348:
	mov	w1, w21
	mov	x0, x19
	ldr	w20, [x19, 14920]
	bl	H264_DecFramePackingSEI
	ldr	w0, [x19, 14920]
	sub	w20, w0, w20
	lsl	w0, w21, 3
	cmp	w20, w0
	blt	.L2451
.L2398:
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2433
	mov	w4, 9842
	ldr	x2, .LC694
	mov	x3, x26
	mov	w1, w4
	mov	w0, 18
	bl	dprint_normal
	ldr	w0, [x22, 72]
	b	.L2350
.L2347:
	ldr	x2, .LC749
	mov	w1, 9808
	mov	w4, w21
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	mov	w4, 9814
	ldr	x2, .LC694
	mov	x3, x25
	mov	w1, w4
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2346:
	ldr	x2, .LC747
	mov	w1, 9794
	mov	w4, w21
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	ldr	x3, .LC692
	mov	w4, 9800
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2345:
	ldr	x2, .LC745
	mov	w1, 9780
	mov	w4, w21
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	ldr	x3, .LC692
	mov	w4, 9786
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2344:
	ldr	x2, .LC743
	mov	w1, 9766
	mov	w4, w21
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	ldr	x3, .LC692
	mov	w4, 9772
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2343:
	ldr	x2, .LC741
	mov	w1, 9752
	mov	w4, w21
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	ldr	x3, .LC692
	mov	w4, 9758
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2342:
	ldr	x2, .LC739
	mov	w1, 9738
	mov	w4, w21
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	ldr	x3, .LC692
	mov	w4, 9744
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2341:
	ldr	x2, .LC737
	mov	w1, 9724
	mov	w4, w21
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	ldr	x3, .LC692
	mov	w4, 9730
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2340:
	ldr	x2, .LC735
	mov	w1, 9710
	mov	w4, w21
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	ldr	x3, .LC692
	mov	w4, 9716
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2339:
	ldr	x2, .LC733
	mov	w1, 9696
	mov	w4, w21
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	ldr	x3, .LC692
	mov	w4, 9702
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2338:
	ldr	x2, .LC731
	mov	w1, 9682
	mov	w4, w21
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	ldr	x3, .LC692
	mov	w4, 9688
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2337:
	ldr	x2, .LC729
	mov	w1, 9668
	mov	w4, w21
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	ldr	x3, .LC692
	mov	w4, 9674
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2336:
	ldr	x2, .LC727
	mov	w1, 9654
	mov	w4, w21
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	ldr	x3, .LC692
	mov	w4, 9660
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2335:
	ldr	x2, .LC725
	mov	w1, 9640
	mov	w4, w21
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	ldr	x3, .LC692
	mov	w4, 9646
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2334:
	ldr	x2, .LC723
	mov	w1, 9626
	mov	w4, w21
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	ldr	x3, .LC692
	mov	w4, 9632
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2333:
	ldr	x2, .LC721
	mov	w1, 9612
	mov	w4, w21
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	ldr	x3, .LC692
	mov	w4, 9618
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2332:
	ldr	x2, .LC719
	mov	w4, w21
	mov	w1, 9596
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	SkipBytes
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2433
	ldr	x3, .LC692
	mov	w4, 9606
	add	x3, x3, 256
.L2434:
	ldr	x2, .LC694
	mov	w1, w4
	mov	w0, 18
	bl	dprint_normal
	ldr	w0, [x22, 72]
	b	.L2350
.L2331:
	cmp	w20, 4
	beq	.L2357
	cbnz	w24, .L2357
	ldr	x2, .LC704
	mov	w4, w21
	mov	w1, 9448
	mov	w0, 18
	bl	dprint_normal
.L2359:
	ldr	w20, [x22, 72]
	cmp	w20, 3
	bhi	.L2452
.L2360:
	ldr	w0, [x22, 1140]
	bl	GetUsd
	uxtw	x1, w20
	add	x1, x1, 4096
	add	x1, x1, 3594
	str	x0, [x19, x1, lsl 3]
	ldr	w0, [x22, 72]
	add	x0, x0, 4096
	add	x0, x0, 3594
	ldr	x7, [x19, x0, lsl 3]
	cbz	x7, .L2410
	ldr	x4, [x19, 632]
	cmp	w21, 1024
	mov	w20, 1024
	csel	w20, w21, w20, le
	ldrb	w2, [x4]
	ldr	w6, [x4, 12]
	cmp	w6, w2
	bls	.L2411
	mov	w3, 0
.L2362:
	uxtw	x0, w2
	add	w2, w2, 1
	cmp	w6, w2
	add	x5, x4, x0, lsl 5
	ldr	w0, [x5, 60]
	ldr	w1, [x5, 48]
	add	w0, w0, 7
	sub	w0, w1, w0, lsr 3
	add	w3, w3, w0
	bne	.L2362
	mov	w0, w3
.L2361:
	cmp	w20, w0
	csel	w3, w3, w20, gt
	cbnz	w24, .L2453
	mov	w4, 0
	mov	w28, 0
.L2364:
	sub	w3, w3, w4
	cmp	w3, wzr
	ble	.L2454
	ldr	w0, [x22, 72]
	mov	w2, w3
	add	x0, x0, 4096
	add	x0, x0, 3594
	ldr	x1, [x19, x0, lsl 3]
	mov	x0, x19
	bl	GetBytes
	cmp	w0, wzr
	mov	w5, w0
	ble	.L2455
	cmp	w0, 4
	bgt	.L2370
	ldr	w0, [x22, 72]
	add	x0, x0, 4096
	add	x0, x0, 3594
	ldr	x0, [x19, x0, lsl 3]
.L2371:
	sub	w1, w20, w28
	cmp	w5, w1
	blt	.L2456
	sub	w28, w21, w28
	cmp	w20, w21
	str	w28, [x0, 1052]
	bcc	.L2457
.L2377:
	mov	w1, w28
	mov	x0, x19
	bl	SkipBytes
.L2375:
	ldr	w0, [x22, 72]
	cmp	w24, 1
	ldr	x1, [x19]
	mov	w2, 8
	add	x0, x0, 4096
	add	x0, x0, 3594
	ldr	x1, [x1, 32]
	ldr	x0, [x19, x0, lsl 3]
	str	x1, [x0, 1056]
	ldr	w0, [x22, 72]
	add	x0, x0, 4096
	add	x0, x0, 3594
	ldr	x1, [x19, x0, lsl 3]
	mov	w0, 9
	csel	w0, w0, w2, ne
	str	w0, [x1, 1040]
.L2438:
	ldr	w0, [x22, 72]
	ldr	x1, .LC711
	add	x0, x0, 4096
	add	x0, x0, 3594
	ldr	x4, [x1]
	ldr	w1, [x22, 1100]
	ldr	x0, [x19, x0, lsl 3]
	str	w1, [x0, 1044]
	cbz	x4, .L2380
	ldr	w0, [x22, 72]
	mov	w3, 1064
	mov	w1, 5
	add	x0, x0, 4096
	add	x0, x0, 3594
	ldr	x2, [x19, x0, lsl 3]
	ldr	w0, [x22, 1140]
	blr	x4
.L2380:
	ldr	w0, [x22, 72]
	add	w0, w0, 1
	str	w0, [x22, 72]
	b	.L2350
.L2330:
	ldr	x2, .LC700
	mov	w1, 9422
	mov	w4, w21
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	ldr	x3, .LC692
	mov	w4, 9428
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2329:
	ldr	x2, .LC698
	mov	w1, 9408
	mov	w4, w21
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	ldr	x3, .LC692
	mov	w4, 9414
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2328:
	ldr	x2, .LC696
	mov	w4, w21
	mov	w1, 9381
	mov	w0, 18
	bl	dprint_normal
	ldr	w20, [x19, 14920]
	mov	w1, w21
	mov	x0, x19
	bl	H264_DecPicTimingSEI
	ldr	w0, [x19, 14920]
	sub	w20, w0, w20
	lsl	w0, w21, 3
	cmp	w20, w0
	blt	.L2458
.L2352:
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2433
	ldr	x3, .LC692
	mov	w4, 9402
	add	x3, x3, 256
	b	.L2434
.L2326:
	add	x0, x19, 24576
	ldr	x2, .LC691
	mov	w4, w21
	ldr	w1, [x0, 3232]
	str	wzr, [x0, 3240]
	add	w1, w1, 1
	str	w1, [x0, 3232]
	mov	w1, 1
	strb	w1, [x0, 3312]
	mov	w1, 9367
	mov	w0, 18
	bl	dprint_normal
	mov	w1, w21
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2401
	ldr	x3, .LC692
	mov	w4, 9373
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
.L2447:
	mov	w4, 9854
	mov	x3, x23
	mov	x2, x27
	mov	w1, w4
	mov	w0, 18
	bl	dprint_normal
	b	.L2401
	.p2align 3
.L2449:
	ldr	x2, .LC686
	mov	w1, 9883
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2314
.L2450:
	cmp	w0, 128
	bne	.L2407
	mov	w0, 0
	b	.L2314
	.p2align 3
.L2445:
	ldr	w0, [x0, 92]
	add	w3, w3, w0
	lsr	w3, w3, 3
	b	.L2324
.L2448:
	ldr	x2, .LC751
	mov	w1, 9864
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2314
.L2444:
	ldr	x2, .LC688
	mov	w1, 9344
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2314
.L2370:
	ldr	w1, [x22, 72]
	mov	w2, 21572
	movk	w2, 0x3147, lsl 16
	add	x1, x19, x1, lsl 3
	add	x1, x1, 61440
	ldr	x0, [x1, 80]
	ldr	w3, [x0]
	cmp	w3, w2
	bne	.L2371
	ldrb	w2, [x0, 4]
	cmp	w2, 65
	cset	w3, eq
	str	w3, [x22, 1232]
	bne	.L2373
	ldrb	w0, [x0, 5]
	and	w0, w0, 15
	str	w0, [x22, 1236]
	ldr	x0, [x1, 80]
	b	.L2371
	.p2align 3
.L2456:
	str	w5, [x0, 1052]
	mov	w1, w5
	mov	x0, x19
	bl	SkipBytes
	b	.L2375
.L2457:
	sub	w1, w21, w20
	mov	x0, x19
	bl	PassBytes
	tbz	w0, #31, .L2377
	ldr	x3, .LC692
	mov	w4, 9580
	ldr	x2, .LC694
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 18
	bl	dprint_normal
	b	.L2377
	.p2align 3
.L2458:
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
	bhi	.L2352
	add	x0, x19, 12288
	add	x0, x0, 2600
	bl	BsSkip
	b	.L2352
	.p2align 3
.L2357:
	ldr	x2, .LC702
	mov	w4, w21
	mov	w1, 9444
	mov	w0, 18
	mov	w24, 1
	bl	dprint_normal
	b	.L2359
.L2451:
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
	bhi	.L2398
	add	x0, x19, 12288
	add	x0, x0, 2600
	bl	BsSkip
	b	.L2398
	.p2align 3
.L2453:
	strb	w24, [x7, 1026]
	mov	w1, 8
	ldr	x2, .LC706
	mov	x0, x19
	ldr	w4, [x22, 72]
	str	w3, [x29, 104]
	add	x4, x4, 4096
	add	x4, x4, 3594
	ldr	x28, [x19, x4, lsl 3]
	bl	u_v
	ldr	w3, [x29, 104]
	strb	w0, [x28, 1027]
	ldr	w0, [x22, 72]
	add	x0, x0, 4096
	add	x0, x0, 3594
	ldr	x28, [x19, x0, lsl 3]
	ldrb	w0, [x28, 1027]
	cmp	w0, 255
	beq	.L2365
	mov	w4, 3
	strb	wzr, [x28, 1028]
	mov	w28, w4
.L2366:
	ldr	w0, [x22, 72]
	mov	w1, 16
	ldr	x2, .LC710
	add	x0, x0, 4096
	add	x0, x0, 3594
	stp	w4, w3, [x29, 96]
	ldr	x5, [x19, x0, lsl 3]
	mov	x0, x19
	str	x5, [x29, 104]
	bl	u_v
	ldr	x5, [x29, 104]
	ldr	w4, [x29, 96]
	str	w4, [x29, 104]
	mov	w1, w4
	strh	w0, [x5, 1030]
	mov	x0, x19
	bl	PassBytes
	ldp	w3, w4, [x29, 100]
	cmp	w3, w4
	bne	.L2364
	ldr	w0, [x22, 72]
	ldr	x1, [x19]
	add	x0, x0, 4096
	add	x0, x0, 3594
	ldr	x1, [x1, 32]
	ldr	x0, [x19, x0, lsl 3]
	str	x1, [x0, 1056]
	mov	w1, 8
	ldr	w0, [x22, 72]
	add	x0, x0, 4096
	add	x0, x0, 3594
	ldr	x0, [x19, x0, lsl 3]
	str	w1, [x0, 1040]
	b	.L2438
	.p2align 3
.L2452:
	ldr	w0, [x22, 1140]
	mov	w20, 0
	ldr	x1, [x22, 80]
	bl	FreeUsdByDec
	ldr	w0, [x22, 1140]
	ldr	x1, [x22, 88]
	bl	FreeUsdByDec
	ldr	w0, [x22, 1140]
	ldr	x1, [x22, 96]
	bl	FreeUsdByDec
	ldr	w0, [x22, 1140]
	ldr	x1, [x22, 104]
	bl	FreeUsdByDec
	str	wzr, [x22, 72]
	stp	xzr, xzr, [x22, 80]
	stp	xzr, xzr, [x22, 96]
	b	.L2360
.L2455:
	ldr	x2, .LC715
	mov	w1, 9538
	mov	w0, 1
	bl	dprint_normal
.L2435:
	ldr	w1, [x22, 72]
	ldr	w0, [x22, 1140]
	add	x1, x1, 4096
	add	x1, x1, 3594
	ldr	x1, [x19, x1, lsl 3]
	bl	FreeUsdByDec
	ldr	w1, [x22, 72]
	mov	w0, -1
	add	x1, x1, 4096
	add	x1, x1, 3594
	str	xzr, [x19, x1, lsl 3]
	b	.L2314
.L2454:
	ldr	x2, .LC713
	mov	w1, 9528
	mov	w0, 1
	bl	dprint_normal
	b	.L2435
.L2373:
	ldr	x3, .LC692
	mov	w4, 9557
	ldr	x2, .LC717
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 32
	str	w5, [x29, 104]
	bl	dprint_normal
	ldr	w0, [x22, 72]
	ldr	w5, [x29, 104]
	add	x0, x0, 4096
	add	x0, x0, 3594
	ldr	x0, [x19, x0, lsl 3]
	b	.L2371
.L2411:
	mov	w0, 0
	mov	w3, 0
	b	.L2361
.L2410:
	mov	w0, -1
	b	.L2314
.L2365:
	ldr	x2, .LC708
	mov	w1, 8
	mov	x0, x19
	str	w3, [x29, 104]
	bl	u_v
	strb	w0, [x28, 1028]
	mov	w4, 4
	ldr	w3, [x29, 104]
	mov	w28, w4
	b	.L2366
	.size	H264_DecSEI, .-H264_DecSEI
	.align	3
.LC682:
	.xword	s_pstVfmwChan
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
.LC689:
	.xword	.L2327
	.align	3
.LC691:
	.xword	.LC690
	.align	3
.LC692:
	.xword	.LANCHOR1
	.align	3
.LC694:
	.xword	.LC693
	.align	3
.LC696:
	.xword	.LC695
	.align	3
.LC698:
	.xword	.LC697
	.align	3
.LC700:
	.xword	.LC699
	.align	3
.LC702:
	.xword	.LC701
	.align	3
.LC704:
	.xword	.LC703
	.align	3
.LC706:
	.xword	.LC705
	.align	3
.LC708:
	.xword	.LC707
	.align	3
.LC710:
	.xword	.LC709
	.align	3
.LC711:
	.xword	g_EventReportFunc
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
.LC743:
	.xword	.LC742
	.align	3
.LC745:
	.xword	.LC744
	.align	3
.LC747:
	.xword	.LC746
	.align	3
.LC749:
	.xword	.LC748
	.align	3
.LC751:
	.xword	.LC750
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
	mov	w1, 1048576
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
	bls	.L2469
.L2468:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2469:
	ldr	x1, .LC753
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx2463
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx2463:
	.section	.rodata
	.align	0
	.align	2
.L2463:
	.byte	(.L2462 - .Lrtx2463) / 4
	.byte	(.L2468 - .Lrtx2463) / 4
	.byte	(.L2468 - .Lrtx2463) / 4
	.byte	(.L2468 - .Lrtx2463) / 4
	.byte	(.L2462 - .Lrtx2463) / 4
	.byte	(.L2468 - .Lrtx2463) / 4
	.byte	(.L2464 - .Lrtx2463) / 4
	.byte	(.L2464 - .Lrtx2463) / 4
	.text
	.p2align 3
.L2464:
	ldr	w0, [x19]
	mov	w1, 1
	str	w1, [x19]
	cmp	w0, wzr
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2462:
	ldr	w0, [x19]
	cbz	w0, .L2465
.L2467:
	mov	w0, -1
	str	wzr, [x19]
.L2470:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2465:
	ldr	w20, [x20, 4]
	rev	w20, w20
	mov	w0, w20
	bl	ZerosMS_32
	cmp	w0, 15
	bhi	.L2467
	mov	w1, 31
	str	wzr, [x19]
	sub	w0, w1, w0, lsl 1
	lsr	w20, w20, w0
	cmp	w20, 1
	csetm	w0, ne
	b	.L2470
	.size	H264_IsNewPicNal, .-H264_IsNewPicNal
	.align	3
.LC753:
	.xword	.L2463
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
	ble	.L2491
	and	w1, w23, 63
	add	w0, w23, 63
	cmp	w1, wzr
	cset	w26, ne
	cmp	w23, wzr
	csel	w0, w0, w23, lt
	add	w26, w26, w0, asr 6
	cmp	w26, wzr
	ble	.L2484
	ldr	x20, .LC757
	mov	w25, w23
	ldr	x27, .LC756
	mov	w19, 0
	mov	w24, 64
	add	x20, x20, 1856
	.p2align 2
.L2483:
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
	cbnz	w1, .L2475
	cmp	x0, x20
	add	w19, w19, 1
	bne	.L2478
	b	.L2476
	.p2align 3
.L2479:
	add	w19, w19, 1
	beq	.L2476
.L2478:
	ldrb	w1, [x0, -1]!
	cmp	x0, x20
	cbz	w1, .L2479
.L2475:
	lsl	w0, w19, 3
.L2474:
	cmp	w19, w23
	mov	w1, 0
	bge	.L2480
	sxtw	x2, w23
	sub	x2, x2, #1
	sub	x19, x2, x19, sxtw
	ldrb	w2, [x22, x19]
	tbnz	x2, 0, .L2480
	lsr	w2, w2, 1
	mov	w1, 1
	.p2align 2
.L2482:
	tbnz	x2, 0, .L2480
	add	w1, w1, 1
	lsr	w2, w2, 1
	cmp	w1, 8
	bne	.L2482
.L2480:
	add	w0, w1, w0
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2476:
	subs	w26, w26, #1
	sub	w25, w25, #64
	bne	.L2483
	b	.L2475
.L2491:
	ldr	x2, .LC755
	mov	w3, w23
	mov	w1, 10250
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
.L2484:
	mov	w0, 0
	mov	w19, 0
	b	.L2474
	.size	FindZeroBitsInSeg, .-FindZeroBitsInSeg
	.align	3
.LC755:
	.xword	.LC754
	.align	3
.LC756:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC757:
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
	cbz	x19, .L2498
	ldr	x2, [x19, 632]
	ldr	w0, [x2, 12]
	cmp	w0, 1
	bls	.L2497
	ldr	w1, [x2, 80]
	ldr	x0, [x2, 72]
	bl	FindZeroBitsInSeg
	ldr	x2, [x19, 632]
	ldr	w1, [x2, 80]
	cmp	w0, w1, lsl 3
	bcs	.L2501
	cmn	w0, #1
	beq	.L2497
	add	w0, w0, 1
	str	w0, [x2, 16]
	ldr	x0, [x19, 632]
	ldr	w1, [x0, 12]
	cmp	w1, 1
	bls	.L2499
.L2502:
	ldr	w2, [x0, 80]
	mov	w20, 0
	ldr	w1, [x0, 16]
	cmp	w1, w2, lsl 3
	bcc	.L2493
	add	x2, x19, 61440
	ldr	w1, [x0, 100]
	ldr	w0, [x2, 1140]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 632]
	mov	w1, 1
	str	xzr, [x0, 72]
	ldr	x0, [x19, 632]
	str	w1, [x0, 12]
	ldr	x0, [x19, 632]
	str	wzr, [x0, 16]
.L2493:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2501:
	add	x0, x19, 61440
	ldr	w1, [x2, 100]
	ldr	w0, [x0, 1140]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 632]
	mov	w1, 1
	str	xzr, [x0, 72]
	ldr	x0, [x19, 632]
	str	w1, [x0, 12]
	ldr	x2, [x19, 632]
.L2497:
	ldr	w1, [x2, 48]
	ldr	x0, [x2, 40]
	bl	FindZeroBitsInSeg
	add	w0, w0, 1
	ldr	x2, [x19, 632]
	str	w0, [x2, 16]
	ldr	x0, [x19, 632]
	ldr	w1, [x0, 12]
	cmp	w1, 1
	bhi	.L2502
.L2499:
	mov	w20, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L2498:
	mov	w20, -1
	b	.L2493
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
	ldr	x0, [x19, 632]
	ldr	w0, [x0, 48]
	cmp	w0, 4095
	bhi	.L2503
	mov	x0, x19
	bl	CombinePacket.part.12
.L2503:
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
	ldrb	w0, [x19, 641]
	cbz	w0, .L2510
	add	x0, x19, 745
	mov	x1, 1
	b	.L2508
	.p2align 3
.L2507:
	add	w1, w1, 1
	cmp	w1, 137
	beq	.L2513
.L2508:
	ldrb	w2, [x0]
	add	x0, x0, 104
	cbnz	w2, .L2507
	mov	w0, w1
.L2506:
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
.L2513:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L2510:
	mov	w0, 0
	mov	x1, 0
	b	.L2506
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
	cbnz	w1, .L2515
	add	x1, x19, 57344
	ldrb	w2, [x1, 2968]
.L2516:
	cmp	w2, 1
	bne	.L2517
	mov	w0, 5
	strb	w0, [x3, 2]
.L2517:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2515:
	add	x1, x19, 57344
	ubfx	x5, x0, 16, 6
	ubfx	x4, x0, 15, 1
	ubfx	x2, x0, 22, 1
	ubfx	x9, x0, 12, 3
	ubfx	x8, x0, 8, 4
	ubfx	x7, x0, 5, 3
	ubfx	x6, x0, 4, 1
	strb	w5, [x1, 2969]
	ubfx	x5, x0, 3, 1
	strb	w4, [x1, 2970]
	ubfx	x4, x0, 2, 1
	strb	w2, [x1, 2968]
	and	w0, w0, 3
	strb	w9, [x1, 2971]
	strb	w8, [x1, 2972]
	strb	w7, [x1, 2973]
	strb	w6, [x1, 2974]
	strb	w5, [x1, 2975]
	strb	w4, [x1, 2976]
	strb	w0, [x1, 2977]
	b	.L2516
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
	add	x22, x19, 61440
	mov	x23, x1
	mov	x21, x2
	bl	_mcount
	ldr	x2, .LC760
	mov	w1, 10567
	ldr	w3, [x22, 1084]
	mov	w0, 20
	add	x20, x19, 20480
	sub	w3, w3, #1
	bl	dprint_normal
	str	wzr, [x21]
	str	wzr, [x23]
	mov	x0, x19
	ldr	x1, [x19, 632]
	ldrb	w2, [x1, 2]
	strb	w2, [x20, 1587]
	ldr	w1, [x1, 20]
	str	w1, [x20, 1612]
	bl	SliceCheck
	mov	w24, w0
	cbnz	w0, .L2523
	mov	x0, x19
	bl	ProcessSliceHeaderFirstPart
	cbnz	w0, .L2527
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
	ldr	w2, [x22, 1152]
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
	beq	.L2528
	cmp	w5, w23
	ccmp	w4, w20, 0, eq
	bne	.L2529
.L2522:
	add	x19, x19, 24576
	ldr	w1, [x0, 3272]
	ldr	w0, [x19, 3704]
	add	w0, w0, 1
	cmp	w1, w0
	beq	.L2519
	mov	w0, 1
	str	w0, [x21]
.L2519:
	mov	w0, w24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2529:
	mov	w1, 1
	str	w1, [x21]
	b	.L2522
	.p2align 3
.L2528:
	add	x0, x19, 12288
	add	x0, x0, 2600
	bl	BsResidBits
	ldr	w1, [x22, 1064]
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
.L2523:
	mov	w24, -1
	b	.L2519
	.p2align 3
.L2527:
	ldr	x2, .LC762
	mov	w1, 10583
	mov	w0, 1
	mov	w24, -1
	bl	dprint_normal
	b	.L2519
	.size	InquireSliceProperty, .-InquireSliceProperty
	.align	3
.LC760:
	.xword	.LC759
	.align	3
.LC762:
	.xword	.LC761
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
	add	x19, x19, 61440
	bl	_mcount
	ldr	w0, [x19, 1064]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	csetm	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	HaveSliceToDec, .-HaveSliceToDec
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
	add	x21, x20, 20480
	bl	_mcount
	ldr	w0, [x21, 1624]
	cbz	w0, .L2532
	mov	w19, 0
	add	x22, x20, 61440
	b	.L2536
	.p2align 3
.L2533:
	ldr	x0, [x0, 24]
	cbz	x0, .L2535
	ldr	w0, [x21, 1624]
	cmp	w0, w19
	bls	.L2560
.L2536:
	add	x1, x20, x19, sxtw 3
	ldr	w0, [x22, 1140]
	add	w19, w19, 1
	ldr	x1, [x1, 28696]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 544]
	bl	FSP_GetLogicFs
	cbnz	x0, .L2533
.L2535:
	mov	w0, -1
.L2562:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2532:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2560:
	cbz	w0, .L2532
	ldr	w0, [x21, 1628]
	mov	w19, 0
	cbnz	w0, .L2549
	b	.L2532
	.p2align 3
.L2561:
	ldr	x0, [x0, 24]
	cbz	x0, .L2535
	ldr	w0, [x21, 1628]
	cmp	w0, w19
	bls	.L2532
.L2549:
	add	x1, x20, x19, sxtw 3
	ldr	w0, [x22, 1140]
	add	w19, w19, 1
	ldr	x1, [x1, 28960]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 544]
	bl	FSP_GetLogicFs
	cbnz	x0, .L2561
	mov	w0, -1
	b	.L2562
	.size	IsRefListWrong, .-IsRefListWrong
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_SaveMetadata
	.type	H264_SaveMetadata, %function
H264_SaveMetadata:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w21, w0
	mov	x0, x30
	mov	x22, x1
	mov	w23, w2
	bl	_mcount
	ldr	x20, .LC763
	ldr	x0, [x20, w21, sxtw 3]
	cbz	x0, .L2563
	ldr	x19, .LC764
	mov	w0, 0
	ldr	x1, [x19, 32]
	blr	x1
	ldr	x2, [x20, w21, sxtw 3]
	mov	w1, w23
	ldr	x3, [x19, 88]
	mov	x0, x22
	blr	x3
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
.L2563:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	H264_SaveMetadata, .-H264_SaveMetadata
	.align	3
.LC763:
	.xword	g_SaveMetadataFileHandler
	.align	3
.LC764:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_SaveElStream
	.type	H264_SaveElStream, %function
H264_SaveElStream:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w21, w0
	mov	x0, x30
	mov	x22, x1
	mov	w23, w2
	bl	_mcount
	ldr	x20, .LC765
	ldr	x0, [x20, w21, sxtw 3]
	cbz	x0, .L2568
	ldr	x19, .LC766
	mov	w0, 0
	ldr	x1, [x19, 32]
	blr	x1
	ldr	x2, [x20, w21, sxtw 3]
	mov	w1, w23
	ldr	x3, [x19, 88]
	mov	x0, x22
	blr	x3
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
.L2568:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	H264_SaveElStream, .-H264_SaveElStream
	.align	3
.LC765:
	.xword	g_SaveElFileHandler
	.align	3
.LC766:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_IsNeedSedOnly
	.type	H264DEC_IsNeedSedOnly, %function
H264DEC_IsNeedSedOnly:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 61440
	mov	w0, 0
	ldr	w2, [x1, 1064]
	cbz	w2, .L2574
	ldr	x3, [x19, 616]
	mov	w0, 0
	cbz	x3, .L2580
.L2574:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2580:
	ldr	w3, [x1, 1164]
	cmp	w2, w3
	beq	.L2574
	ldr	w2, [x1, 1152]
	cmp	w2, 1
	beq	.L2581
	cbnz	w2, .L2574
	ldr	w0, [x1, 1140]
	bl	VCTRL_CheckFreshSeg
	cmp	w0, wzr
	cset	w0, ne
	b	.L2574
	.p2align 3
.L2581:
	ldr	x0, [x19, 632]
	cmp	x0, xzr
	cset	w0, ne
	b	.L2574
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
	bls	.L2585
	and	w0, w19, -5
	cmp	w0, 11
	ccmp	w19, 30, 4, ne
	ldr	x19, [sp, 16]
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2585:
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
	add	x21, x21, 61440
	bl	_mcount
	ldr	x2, .LC768
	mov	w1, 11435
	mov	w0, 3
	bl	dprint_normal
	ldr	w0, [x21, 1140]
	mov	w1, w22
	bl	FSP_GetLogicFs
	cbz	x0, .L2591
	ldr	w1, [x0, 20]
	cbz	w1, .L2591
	add	x19, x0, 224
	add	x20, x0, 256
.L2589:
	ldr	x1, [x19]
	cbnz	x1, .L2596
.L2588:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L2589
	ldr	w0, [x21, 1140]
	mov	w2, 0
	mov	w1, w22
	bl	FSP_SetDisplay
	mov	w0, 0
.L2587:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2596:
	ldr	w0, [x21, 1140]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L2588
	.p2align 3
.L2591:
	mov	w0, -1
	b	.L2587
	.size	H264DEC_RecycleImage, .-H264DEC_RecycleImage
	.align	3
.LC768:
	.xword	.LC767
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
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x22, xzr, 4, ne
	beq	.L2634
	ldr	x0, [x19]
	ldr	w0, [x0, 12]
	cbz	w0, .L2600
	add	x0, x19, 61440
	ldr	w0, [x0, 1068]
	cmp	w0, 2
	beq	.L2600
	add	x19, x19, 57344
	ldr	x0, [x19, 2952]
	cbz	x0, .L2602
	strb	wzr, [x0, 1]
	mov	w0, 1
	str	xzr, [x19, 2952]
.L2599:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2600:
	mov	x1, x22
	mov	x0, x19
	bl	CheckFrameStore
	cmn	w0, #3
	beq	.L2602
	add	x20, x19, 57344
	ldr	x1, [x20, 2952]
	cbz	x1, .L2603
	mov	x0, x19
	bl	GetImagePara
	ldr	x1, [x20, 2952]
	mov	x0, x19
	bl	CheckFrameStore
	cbz	w0, .L2635
	cmn	w0, #3
	beq	.L2609
	mov	w3, 1718
	ldr	x2, .LC776
	mov	w1, w3
	mov	w4, w0
	mov	w0, 1
	bl	dprint_normal
	ldr	x1, [x20, 2952]
	mov	x0, x19
	ldr	w1, [x1, 96]
	bl	H264DEC_RecycleImage
.L2609:
	ldr	x0, [x20, 2952]
	strb	wzr, [x0, 1]
	ldr	x0, [x20, 2952]
	str	xzr, [x20, 2952]
	cmp	x22, x0
	beq	.L2636
.L2603:
	mov	x1, x22
	mov	x0, x19
	bl	GetImagePara
	mov	x1, x22
	mov	x0, x19
	bl	CheckFrameStore
	cbz	w0, .L2637
	cmn	w0, #3
	beq	.L2602
	mov	w3, 1771
	ldr	x2, .LC776
	mov	w1, w3
	mov	w4, w0
	mov	w0, 1
	bl	dprint_normal
	ldr	w1, [x22, 96]
	mov	x0, x19
	bl	H264DEC_RecycleImage
	mov	w0, 2
	b	.L2599
	.p2align 3
.L2634:
	ldr	x2, .LC770
	mov	x4, x22
	mov	x3, x19
	mov	w1, 1660
	mov	w0, 0
	bl	dprint_normal
	ldr	x23, [sp, 48]
	mov	w0, 2
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2602:
	mov	w0, 1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2637:
	add	x21, x19, 61440
	ldr	w1, [x22, 544]
	ldr	w0, [x21, 1140]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L2638
	ldr	w0, [x21, 1140]
	mov	w2, 1
	ldr	w1, [x22, 544]
	bl	FSP_SetDisplay
	ldr	w0, [x21, 1140]
	mov	x4, x20
	add	x3, x19, 8
	mov	x2, x19
	mov	w1, 0
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L2639
	ldr	x0, [x19]
	ldr	w0, [x0, 632]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L2640
	str	wzr, [x20, 16]
.L2615:
	ldr	w1, [x21, 1188]
	mov	w0, 0
	ldr	w2, [x21, 1196]
	add	w1, w1, 2
	str	w1, [x21, 1188]
	add	w2, w2, 1
	str	w2, [x21, 1196]
	b	.L2599
	.p2align 3
.L2635:
	ldr	x0, [x20, 2952]
	add	x21, x19, 61440
	ldr	w1, [x0, 544]
	ldr	w0, [x21, 1140]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	cbz	x0, .L2641
	ldr	x1, [x20, 2952]
	mov	w2, 1
	ldr	w0, [x21, 1140]
	ldr	w1, [x1, 544]
	bl	FSP_SetDisplay
	ldr	w0, [x21, 1140]
	mov	x4, x23
	add	x3, x19, 8
	mov	x2, x19
	mov	w1, 0
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L2642
	ldr	x0, [x19]
	ldr	w0, [x0, 632]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L2643
	str	wzr, [x23, 16]
.L2608:
	ldr	w0, [x21, 1188]
	ldr	w1, [x21, 1196]
	add	w0, w0, 2
	str	w0, [x21, 1188]
	add	w1, w1, 1
	str	w1, [x21, 1196]
	b	.L2609
	.p2align 3
.L2640:
	mov	x1, x20
	mov	x0, x19
	bl	SetFrmRepeatCount.part.2
	b	.L2615
	.p2align 3
.L2643:
	mov	x1, x23
	mov	x0, x19
	bl	SetFrmRepeatCount.part.2
	b	.L2608
	.p2align 3
.L2636:
	mov	w0, 0
	b	.L2599
.L2639:
	ldr	x2, .LC774
	mov	w3, w0
	mov	w1, 1755
	mov	w0, 0
	bl	dprint_normal
	ldr	w0, [x21, 1140]
	mov	w2, 0
	ldr	w1, [x22, 544]
	bl	FSP_SetDisplay
	mov	w1, 1
	mov	x0, x19
	bl	ClearAll
	mov	w0, -1
	b	.L2599
.L2642:
	ldr	x2, .LC774
	mov	w3, w0
	mov	w1, 1703
	mov	w0, 0
	bl	dprint_normal
	ldr	x0, [x20, 2952]
	mov	w2, 0
	strb	wzr, [x0, 1]
	ldr	x1, [x20, 2952]
	ldr	w0, [x21, 1140]
	ldr	w1, [x1, 544]
	bl	FSP_SetDisplay
	str	xzr, [x20, 2952]
	mov	w1, 1
	mov	x0, x19
	bl	ClearAll
	mov	w0, -1
	b	.L2599
.L2638:
	mov	w3, 1745
	ldr	x2, .LC778
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L2599
.L2641:
	mov	w3, 1693
	ldr	x2, .LC772
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L2599
	.size	OutputFrmToVO, .-OutputFrmToVO
	.align	3
.LC770:
	.xword	.LC769
	.align	3
.LC772:
	.xword	.LC771
	.align	3
.LC774:
	.xword	.LC773
	.align	3
.LC776:
	.xword	.LC775
	.align	3
.LC778:
	.xword	.LC777
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
	mov	w21, w1
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, x21, uxtw 3
	bl	_mcount
	ldr	x0, [x19, 27896]
	cbz	x0, .L2648
	strb	wzr, [x0, 4]
	mov	w2, 0
	mov	x0, x20
	ldr	x1, [x19, 27896]
	bl	OutputFrmToVO
	ldr	x1, [x19, 27896]
	mov	w19, w0
	ldrb	w0, [x1, 2]
	cbnz	w0, .L2646
	mov	w1, w21
	mov	x0, x20
	bl	RemoveFrameStoreOutDPB
.L2646:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L2648:
	ldr	x3, .LC779
	mov	w4, 1785
	ldr	x2, .LC781
	mov	w1, w4
	add	x3, x3, 272
	mov	w0, 1
	mov	w19, -1
	bl	dprint_normal
	b	.L2646
	.size	OutputFrmFromDPB, .-OutputFrmFromDPB
	.align	3
.LC779:
	.xword	.LANCHOR1
	.align	3
.LC781:
	.xword	.LC780
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
	add	x19, x20, 24576
	mov	w21, 0
	bl	_mcount
	ldr	w0, [x19, 3708]
	cbnz	w0, .L2667
	b	.L2651
	.p2align 3
.L2652:
	ldr	w0, [x19, 3708]
	cmp	w0, w21
	bls	.L2651
.L2667:
	add	x0, x20, x21, uxtw 3
	add	w21, w21, 1
	ldr	x1, [x0, 27896]
	ldrb	w0, [x1, 2]
	cbz	w0, .L2652
	mov	x0, x20
	bl	UnMarkFrameStoreRef
	ldr	w0, [x19, 3708]
	cmp	w0, w21
	bhi	.L2667
	.p2align 2
.L2651:
	mov	x0, x20
	bl	RemoveUnUsedFrameStore
	cbnz	w0, .L2651
	.p2align 2
.L2655:
	ldr	w6, [x19, 3708]
	cbz	w6, .L2672
	ldr	w0, [x19, 3704]
	cmp	w6, w0
	bls	.L2656
	str	w0, [x19, 3708]
	cbz	w0, .L2662
	mov	w6, w0
.L2656:
	add	x2, x19, 3320
	mov	w5, 2147483647
	mov	w0, 0
	mov	w1, 0
	.p2align 2
.L2659:
	ldr	x4, [x2]
	add	x2, x2, 8
	ldr	w3, [x4, 560]
	cmp	w3, w5
	bge	.L2658
	ldrb	w4, [x4, 4]
	cmp	w4, wzr
	csel	w5, w5, w3, eq
	csel	w1, w1, w0, eq
.L2658:
	add	w0, w0, 1
	cmp	w6, w0
	bhi	.L2659
	mov	x0, x20
	bl	OutputFrmFromDPB
	cmn	w0, #1
	bne	.L2655
.L2660:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L2662:
	mov	w1, 0
	mov	x0, x20
	bl	OutputFrmFromDPB
	cmn	w0, #1
	bne	.L2655
	b	.L2660
	.p2align 3
.L2672:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	FlushDPB, .-FlushDPB
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
	add	x26, x21, 57344
	add	x25, x21, 20480
	bl	_mcount
	ldr	x24, .LC782
	add	x23, x26, 1640
	mov	w27, 1
	ldr	x22, [x26, 2200]
	add	x20, x22, 8
	add	x22, x22, 2008
	.p2align 2
.L2686:
	ldr	w0, [x20, -4]
	cmp	w0, 6
	bhi	.L2674
	ldrb	w0, [x24,w0,uxtw]
	adr	x1, .Lrtx2676
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx2676:
	.section	.rodata
	.align	0
	.align	2
.L2676:
	.byte	(.L2675 - .Lrtx2676) / 4
	.byte	(.L2677 - .Lrtx2676) / 4
	.byte	(.L2678 - .Lrtx2676) / 4
	.byte	(.L2679 - .Lrtx2676) / 4
	.byte	(.L2680 - .Lrtx2676) / 4
	.byte	(.L2681 - .Lrtx2676) / 4
	.byte	(.L2682 - .Lrtx2676) / 4
	.text
	.p2align 3
.L2681:
	add	x28, x21, 24576
	mov	w19, 0
	ldr	w0, [x28, 3712]
	cbz	w0, .L2685
	.p2align 2
.L2693:
	add	x1, x21, x19, uxtw 3
	mov	x0, x21
	add	w19, w19, 1
	ldr	x1, [x1, 28024]
	bl	UnMarkFrameStoreRef
	ldr	w0, [x28, 3712]
	cmp	w19, w0
	bcc	.L2693
.L2685:
	mov	x0, x21
	bl	UpdateReflist
	mov	w1, 0
	mov	x0, x21
	bl	UpdateMaxLTFrmIdx
	mov	x0, x21
	bl	UpdateLTReflist
	str	w27, [x25, 728]
	.p2align 2
.L2674:
	add	x20, x20, 20
	cmp	x20, x22
	bne	.L2686
	.p2align 2
.L2675:
	ldr	w1, [x25, 728]
	mov	w0, 0
	cmp	w1, 1
	beq	.L2696
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2680:
	ldr	w1, [x20, 12]
	mov	x0, x21
	bl	UpdateMaxLTFrmIdx
	mov	x0, x21
	bl	UpdateLTReflist
	b	.L2674
	.p2align 3
.L2679:
	ldr	w2, [x20]
	mov	x1, x23
	ldr	w3, [x20, 8]
	mov	x0, x21
	bl	MarkSTToLTRef
	mov	x0, x21
	bl	UpdateReflist
	mov	x0, x21
	bl	UpdateLTReflist
	b	.L2674
	.p2align 3
.L2678:
	ldr	w2, [x20, 4]
	mov	x0, x21
	mov	x1, x23
	bl	UnMarkLTRef
	mov	x0, x21
	bl	UpdateLTReflist
	b	.L2674
	.p2align 3
.L2677:
	ldr	w2, [x20]
	mov	x0, x21
	mov	x1, x23
	bl	UnMarkSTRef
	mov	x0, x21
	bl	UpdateReflist
	b	.L2674
	.p2align 3
.L2682:
	ldr	w2, [x20, 8]
	mov	x1, x23
	mov	x0, x21
	bl	MarkCurrPicLT
	b	.L2674
	.p2align 3
.L2696:
	ldrb	w0, [x26, 1643]
	str	wzr, [x26, 2208]
	cmp	w0, 1
	beq	.L2689
	cbz	w0, .L2690
	cmp	w0, 2
	bne	.L2688
	str	wzr, [x26, 2220]
	str	wzr, [x26, 2232]
	str	wzr, [x25, 740]
	str	wzr, [x25, 748]
.L2688:
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
.L2690:
	ldr	w2, [x26, 2220]
	ldr	w0, [x26, 2228]
	ldr	w1, [x26, 2232]
	sub	w0, w0, w2
	str	w0, [x26, 2228]
	sub	w1, w1, w2
	str	w1, [x26, 2232]
	cmp	w0, w1
	csel	w0, w0, w1, le
	str	w0, [x26, 2220]
	str	w0, [x26, 2224]
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
	b	.L2688
.L2689:
	str	wzr, [x26, 2220]
	str	wzr, [x26, 2228]
	str	wzr, [x25, 736]
	str	wzr, [x25, 748]
	b	.L2688
	.size	AdaptiveMemMark, .-AdaptiveMemMark
	.align	3
.LC782:
	.xword	.L2676
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
	add	x25, x22, 57344
	bl	_mcount
	ldr	x0, [x25, 2200]
	ldrb	w0, [x0, 1]
	cbz	w0, .L2698
	add	x23, x22, 24576
	mov	w20, 0
	add	x21, x22, 61440
	mov	w24, 1
	ldr	w0, [x23, 3708]
	cbnz	w0, .L2713
	b	.L2705
	.p2align 3
.L2702:
	strb	wzr, [x0, 594]
	strb	wzr, [x0, 593]
	ldr	x0, [x19, 27896]
	strb	wzr, [x0, 642]
	strb	wzr, [x0, 641]
	ldr	x0, [x19, 27896]
	strb	wzr, [x0, 690]
	strb	wzr, [x0, 689]
	ldr	x0, [x19, 27896]
	strb	wzr, [x0, 2]
	ldr	x1, [x19, 27896]
	ldr	w0, [x21, 1140]
	ldr	w1, [x1, 544]
	bl	FSP_SetRef
	ldr	x0, [x19, 27896]
	strb	wzr, [x0, 1]
	ldr	x0, [x19, 27896]
	strb	wzr, [x0, 4]
	ldr	x0, [x19, 27896]
	str	w24, [x0, 564]
	ldr	x1, [x19, 27896]
	ldr	w0, [x1, 584]
	add	x0, x0, 4096
	add	x0, x0, 2980
	str	wzr, [x22, x0, lsl 2]
	ldr	w1, [x1, 544]
	ldr	w0, [x21, 1140]
	bl	FSP_GetDisplay
	cmp	w0, 3
	mov	w2, 0
	beq	.L2703
	ldr	x1, [x19, 27896]
	ldr	w0, [x21, 1140]
	ldr	w1, [x1, 544]
	bl	FSP_SetDisplay
.L2703:
	str	xzr, [x19, 27896]
	str	xzr, [x19, 28024]
	str	xzr, [x19, 28152]
	ldr	w0, [x23, 3708]
	cmp	w0, w20
	bls	.L2705
.L2713:
	add	x19, x22, x20, uxtw 3
	mov	w2, 0
	add	w20, w20, 1
	ldr	x0, [x19, 27896]
	ldr	w1, [x0, 736]
	cmp	w1, 1
	bne	.L2702
	str	w1, [x21, 60]
	b	.L2702
	.p2align 3
.L2705:
	str	wzr, [x23, 3708]
	ldr	w0, [x21, 48]
	cbz	w0, .L2701
	sub	w1, w0, #1
	add	x0, x25, 4072
	add	x1, x1, 12288
	add	x1, x1, 3067
	add	x1, x22, x1, lsl 2
	.p2align 2
.L2708:
	str	wzr, [x0], 4
	cmp	x0, x1
	bne	.L2708
.L2701:
	mov	x0, x22
	bl	UpdateReflist
	mov	x0, x22
	bl	UpdateLTReflist
	ldr	x0, [x25, 2200]
	ldrb	w0, [x0, 2]
	cbnz	w0, .L2719
	mov	w0, 1
	str	wzr, [x23, 3720]
	strb	w0, [x25, 1645]
	mov	w0, 0
	strb	wzr, [x25, 1644]
.L2709:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L2719:
	mov	w0, 1
	str	w0, [x23, 3720]
	strb	w0, [x25, 1644]
	mov	w0, 0
	strb	wzr, [x25, 1645]
	str	wzr, [x25, 2212]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L2698:
	mov	x0, x22
	bl	FlushDPB
	cbnz	w0, .L2710
	add	x23, x22, 24576
	b	.L2701
.L2710:
	mov	w0, -1
	b	.L2709
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
	add	x19, x20, 57344
	bl	_mcount
	add	x0, x20, 20480
	str	wzr, [x0, 728]
	ldrb	w1, [x19, 1643]
	cmp	w1, 2
	cset	w1, eq
	str	w1, [x0, 732]
	ldrb	w0, [x19, 1646]
	cmp	w0, 5
	beq	.L2721
	ldr	w0, [x19, 2236]
	cbnz	w0, .L2722
	ldr	x0, [x20]
	ldr	w1, [x0, 672]
	cmp	w1, 1
	beq	.L2746
.L2722:
	ldr	x0, [x19, 2200]
	ldrb	w0, [x0, 3]
	cbz	w0, .L2747
	ldr	w0, [x19, 2216]
	cbnz	w0, .L2748
.L2729:
	mov	w0, 0
.L2726:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2747:
	ldr	w0, [x19, 2216]
	cbz	w0, .L2729
.L2728:
	ldrb	w1, [x19, 1641]
	cbnz	w1, .L2733
	add	x1, x20, 24576
	add	x2, x20, 16384
	ldr	w4, [x1, 3716]
	ldr	w2, [x2, 1836]
	ldr	w3, [x1, 3712]
	sub	w1, w2, w4
	cmp	w3, w1
	beq	.L2749
	strb	wzr, [x19, 1644]
.L2731:
	cbz	w0, .L2729
.L2733:
	ldrb	w1, [x19, 1644]
	mov	w0, 0
	cmp	w1, wzr
	cset	w1, eq
	strb	w1, [x19, 1645]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2748:
	mov	x0, x20
	bl	AdaptiveMemMark
	cbnz	w0, .L2723
.L2730:
	ldrb	w0, [x19, 1646]
	cmp	w0, 5
	bne	.L2750
	ldr	w0, [x19, 2216]
	b	.L2731
	.p2align 3
.L2746:
	ldr	w1, [x0, 668]
	cbnz	w1, .L2722
	ldr	w1, [x0, 676]
	cbnz	w1, .L2722
	ldr	w0, [x0, 632]
	add	w0, w0, 1024
	cmp	w0, 2048
	bls	.L2722
	.p2align 2
.L2721:
	mov	x0, x20
	bl	IDRMemMarking
	cbz	w0, .L2730
.L2723:
	mov	w0, -1
	b	.L2726
	.p2align 3
.L2749:
	mov	x0, x20
	bl	SlidingWinMark.part.3
	strb	wzr, [x19, 1644]
	ldr	w0, [x19, 2216]
	b	.L2731
.L2750:
	ldr	w0, [x19, 2216]
	cbz	w0, .L2729
	ldr	x1, [x19, 2200]
	ldrb	w1, [x1, 3]
	cbnz	w1, .L2733
	b	.L2728
	.size	Marking, .-Marking
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
	add	x19, x20, 57344
	bl	_mcount
	ldrb	w0, [x19, 1643]
	cmp	w0, 1
	beq	.L2753
	cbz	w0, .L2754
	cmp	w0, 2
	beq	.L2755
	mov	w21, 0
.L2752:
	mov	w0, w21
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2755:
	ldr	x0, [x19, 2192]
	mov	w1, 3
	strb	w1, [x0, 592]
	ldrb	w0, [x19, 1641]
	cbz	w0, .L2837
	ldr	x0, [x19, 2952]
	cbz	x0, .L2838
.L2777:
	ldp	x27, x26, [x0, 216]
	ldp	w24, w23, [x0, 8]
	ldp	w22, w21, [x0, 16]
	ldr	x25, [x0, 232]
	mov	x2, 536
	add	x1, x19, 1656
	add	x0, x0, 8
	bl	memcpy
	cmn	x27, #1
	beq	.L2778
	ldr	x0, [x19, 2952]
	str	x27, [x0, 216]
.L2778:
	ldr	x0, [x19, 1872]
	ldr	x1, [x19, 2952]
	cmp	x0, x26
	csel	x0, x0, x26, ls
	str	x0, [x1, 224]
	ldr	x0, [x19, 1880]
	ldr	x1, [x19, 2952]
	cmp	x0, x25
	csel	x0, x0, x25, ls
	str	x0, [x1, 232]
	ldr	w0, [x19, 1656]
	ldr	x1, [x19, 2952]
	cmp	w0, w24
	csel	w0, w0, w24, ls
	str	w0, [x1, 8]
	ldr	w0, [x19, 1660]
	ldr	x1, [x19, 2952]
	cmp	w0, w23
	csel	w0, w0, w23, ls
	str	w0, [x1, 12]
	ldr	w0, [x19, 1664]
	ldr	x1, [x19, 2952]
	cmp	w0, w22
	csel	w0, w0, w22, ls
	str	w0, [x1, 16]
	ldr	w0, [x19, 1668]
	ldr	x1, [x19, 2952]
	cmp	w0, w21
	csel	w0, w0, w21, ls
	str	w0, [x1, 20]
	ldr	x1, [x19, 2952]
	ldrb	w0, [x1]
	cbz	w0, .L2779
	ldrb	w0, [x19, 1642]
.L2779:
	strb	w0, [x1]
	mov	w4, 2
	mov	w3, 3
	ldr	x1, [x19, 2952]
	ldrb	w0, [x1, 1]
	orr	w0, w0, 2
	strb	w0, [x1, 1]
	ldr	x1, [x19, 2952]
	ldr	w0, [x19, 2236]
	ldr	w2, [x1, 572]
	cmp	w0, w2
	csel	w0, w0, w2, cs
	str	w0, [x1, 572]
	ldr	x0, [x19, 2952]
	strb	w4, [x0, 688]
	ldr	x0, [x19, 2952]
	strb	w3, [x0, 592]
	ldr	x0, [x19, 2952]
	ldr	w1, [x19, 2244]
	str	w1, [x0, 704]
	ldr	x1, [x19, 2952]
	ldr	w2, [x1, 656]
	ldr	w0, [x1, 704]
	add	w0, w2, w0
	lsr	w0, w0, 1
	str	w0, [x1, 608]
	ldr	x0, [x19, 2952]
	ldr	w1, [x0, 608]
	str	w1, [x0, 576]
	ldr	x0, [x19, 2952]
	ldr	x1, [x0, 728]
	str	x1, [x0, 632]
	ldrb	w0, [x19, 1647]
	ldr	x1, [x19, 2952]
	cmp	w0, 1
	beq	.L2839
.L2780:
	ldrb	w0, [x1, 3]
.L2781:
	strb	w0, [x1, 3]
	add	x22, x20, 61440
	mov	w2, 0
	b	.L2834
	.p2align 3
.L2754:
	ldr	x0, [x19, 2192]
	strb	wzr, [x0, 592]
	ldr	x1, [x19, 2952]
	cbz	x1, .L2827
	mov	w2, 0
	mov	x0, x20
	bl	OutputFrmToVO
	cbnz	w0, .L2840
.L2757:
	ldr	x0, [x19, 2952]
	cbz	x0, .L2827
	ldr	x0, [x19, 2192]
	add	x22, x20, 61440
	ldr	w1, [x0, 544]
	ldr	w0, [x22, 1140]
	bl	FSP_ClearLogicFs
.L2756:
	ldr	x0, [x19, 2192]
	mov	w3, 3
	str	x0, [x19, 2952]
	mov	x2, 536
	add	x1, x19, 1656
	str	x0, [x0, 632]
	ldr	x0, [x19, 2952]
	ldr	x4, [x19, 2192]
	str	x4, [x0, 680]
	ldr	x0, [x19, 2952]
	ldr	x4, [x19, 2192]
	str	x4, [x0, 728]
	ldr	x0, [x19, 2952]
	ldrb	w4, [x19, 1642]
	strb	w4, [x0]
	ldr	x0, [x19, 2952]
	strb	w3, [x0, 1]
	ldr	x0, [x19, 2952]
	strb	wzr, [x0, 2]
	ldr	x0, [x19, 2952]
	strb	wzr, [x0, 4]
	ldr	x0, [x19, 2952]
	str	wzr, [x0, 564]
	ldr	x0, [x19, 2952]
	add	x0, x0, 8
	bl	memcpy
	ldr	x1, [x19, 2952]
	mov	w0, 3
	ldr	w3, [x19, 2244]
	mov	w2, 0
	str	w3, [x1, 576]
	str	w3, [x1, 608]
	ldr	x1, [x19, 2952]
	strb	wzr, [x1, 592]
	ldr	x1, [x19, 2952]
	ldr	w3, [x19, 2236]
	str	w3, [x1, 572]
	ldr	x1, [x19, 2952]
	ldrb	w3, [x19, 1649]
	str	w3, [x1, 568]
	ldrb	w3, [x19, 1647]
	ldr	x1, [x19, 2952]
	cmp	w3, 1
	csel	w0, wzr, w0, ne
	strb	w0, [x1, 3]
.L2834:
	ldr	x1, [x19, 2952]
	ldr	w0, [x22, 1140]
	ldr	w1, [x1, 544]
	bl	FSP_SetRef
	ldr	x1, [x19, 2952]
	mov	w2, 0
	mov	x0, x20
	bl	OutputFrmToVO
	mov	w21, w0
	ldr	x0, [x19, 2952]
	cbz	x0, .L2782
	ldr	x1, [x19, 2192]
	ldr	w0, [x22, 1140]
	ldr	w1, [x1, 544]
	bl	FSP_ClearLogicFs
.L2782:
	str	xzr, [x19, 2952]
.L2842:
	mov	w0, w21
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2753:
	ldr	x0, [x19, 2192]
	mov	w1, 3
	strb	w1, [x0, 592]
	ldrb	w0, [x19, 1641]
	cbnz	w0, .L2760
	ldr	x1, [x19, 2952]
	cbz	x1, .L2761
	mov	w2, 0
	mov	x0, x20
	bl	OutputFrmToVO
	mov	w21, w0
	cbnz	w0, .L2841
.L2762:
	ldr	x0, [x19, 2192]
	str	x0, [x19, 2952]
	str	x0, [x0, 680]
.L2763:
	ldr	x0, [x19, 2952]
	mov	w22, 1
	ldrb	w3, [x19, 1642]
	add	x1, x19, 1656
	mov	x2, 536
	add	x23, x20, 61440
	strb	w3, [x0]
	ldr	x0, [x19, 2952]
	strb	w22, [x0, 1]
	ldr	x0, [x19, 2952]
	strb	wzr, [x0, 4]
	ldr	x0, [x19, 2952]
	str	wzr, [x0, 564]
	ldr	x0, [x19, 2952]
	strb	wzr, [x0, 2]
	ldr	x0, [x19, 2952]
	ldr	w3, [x19, 2236]
	str	w3, [x0, 572]
	ldr	x0, [x19, 2952]
	str	wzr, [x0, 568]
	ldr	x0, [x19, 2952]
	add	x0, x0, 8
	bl	memcpy
	ldr	x0, [x19, 2952]
	ldr	w1, [x19, 2244]
	str	w1, [x0, 656]
	ldr	x0, [x19, 2952]
	ldr	w1, [x0, 656]
	str	w1, [x0, 576]
	str	w1, [x0, 608]
	ldr	x0, [x19, 2952]
	strb	w22, [x0, 640]
	ldrb	w1, [x19, 1647]
	ldr	x0, [x19, 2952]
	cmp	w1, 1
	cset	w1, eq
	strb	w1, [x0, 3]
	ldr	w0, [x23, 1072]
	cmp	w0, 1
	bne	.L2752
.L2831:
	ldr	x1, [x19, 2952]
	mov	w2, 0
	ldr	w0, [x23, 1140]
	ldr	w1, [x1, 544]
	bl	FSP_SetRef
	ldr	x1, [x19, 2952]
	mov	w2, 0
	mov	x0, x20
	bl	OutputFrmToVO
	mov	w21, w0
	ldr	x0, [x19, 2952]
	cbz	x0, .L2782
	ldr	x1, [x19, 2192]
	ldr	w0, [x23, 1140]
	ldr	w1, [x1, 544]
	bl	FSP_ClearLogicFs
	str	xzr, [x19, 2952]
	b	.L2842
	.p2align 3
.L2837:
	ldr	x1, [x19, 2952]
	cbz	x1, .L2772
	mov	w2, 0
	mov	x0, x20
	bl	OutputFrmToVO
	mov	w21, w0
	cbnz	w0, .L2843
.L2773:
	ldr	x0, [x19, 2192]
	str	x0, [x19, 2952]
	str	x0, [x0, 728]
.L2774:
	ldr	x0, [x19, 2952]
	mov	w22, 2
	ldrb	w3, [x19, 1642]
	mov	x2, 536
	add	x1, x19, 1656
	add	x23, x20, 61440
	strb	w3, [x0]
	ldr	x0, [x19, 2952]
	strb	w22, [x0, 1]
	ldr	x0, [x19, 2952]
	strb	wzr, [x0, 4]
	ldr	x0, [x19, 2952]
	str	wzr, [x0, 564]
	ldr	x0, [x19, 2952]
	strb	wzr, [x0, 2]
	ldr	x0, [x19, 2952]
	ldr	w3, [x19, 2236]
	str	w3, [x0, 572]
	ldr	x0, [x19, 2952]
	str	wzr, [x0, 568]
	ldr	x0, [x19, 2952]
	add	x0, x0, 8
	bl	memcpy
	ldr	x1, [x19, 2952]
	mov	w0, 2
	ldr	w2, [x19, 2244]
	str	w2, [x1, 704]
	ldr	x1, [x19, 2952]
	ldr	w2, [x1, 704]
	str	w2, [x1, 576]
	str	w2, [x1, 608]
	ldr	x1, [x19, 2952]
	strb	w22, [x1, 688]
	ldrb	w2, [x19, 1647]
	ldr	x1, [x19, 2952]
	cmp	w2, 1
	csel	w0, wzr, w0, ne
	strb	w0, [x1, 3]
	ldr	w0, [x23, 1072]
	cmp	w0, 1
	beq	.L2831
	mov	w0, w21
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2760:
	ldr	x0, [x19, 2952]
	cbz	x0, .L2844
.L2765:
	ldp	x27, x26, [x0, 216]
	ldp	w24, w23, [x0, 8]
	ldp	w22, w21, [x0, 16]
	ldr	x25, [x0, 232]
	mov	x2, 536
	add	x1, x19, 1656
	add	x0, x0, 8
	bl	memcpy
	ldr	x0, [x19, 1864]
	cmn	x0, #1
	ccmn	x27, #1, 4, eq
	beq	.L2766
	ldr	x0, [x19, 2952]
	str	x27, [x0, 216]
.L2766:
	ldr	x0, [x19, 1872]
	ldr	x1, [x19, 2952]
	cmp	x0, x26
	csel	x0, x0, x26, ls
	str	x0, [x1, 224]
	ldr	x0, [x19, 1880]
	ldr	x1, [x19, 2952]
	cmp	x0, x25
	csel	x0, x0, x25, ls
	str	x0, [x1, 232]
	ldr	w0, [x19, 1656]
	ldr	x1, [x19, 2952]
	cmp	w0, w24
	csel	w0, w0, w24, ls
	str	w0, [x1, 8]
	ldr	w0, [x19, 1660]
	ldr	x1, [x19, 2952]
	cmp	w0, w23
	csel	w0, w0, w23, ls
	str	w0, [x1, 12]
	ldr	w0, [x19, 1664]
	ldr	x1, [x19, 2952]
	cmp	w0, w22
	csel	w0, w0, w22, ls
	str	w0, [x1, 16]
	ldr	w0, [x19, 1668]
	ldr	x1, [x19, 2952]
	cmp	w0, w21
	csel	w0, w0, w21, ls
	str	w0, [x1, 20]
	ldr	x1, [x19, 2952]
	ldrb	w0, [x1]
	cbz	w0, .L2767
	ldrb	w0, [x19, 1642]
.L2767:
	strb	w0, [x1]
	mov	w4, 1
	mov	w3, 3
	ldr	x1, [x19, 2952]
	ldrb	w0, [x1, 1]
	orr	w0, w0, 1
	strb	w0, [x1, 1]
	ldr	x1, [x19, 2952]
	ldr	w0, [x19, 2236]
	ldr	w2, [x1, 572]
	cmp	w0, w2
	csel	w0, w0, w2, cs
	str	w0, [x1, 572]
	ldr	x0, [x19, 2952]
	strb	w4, [x0, 640]
	ldr	x0, [x19, 2952]
	strb	w3, [x0, 592]
	ldr	x0, [x19, 2952]
	ldr	w1, [x19, 2244]
	str	w1, [x0, 656]
	ldr	x1, [x19, 2952]
	ldr	w2, [x1, 656]
	ldr	w0, [x1, 704]
	add	w0, w2, w0
	lsr	w0, w0, w4
	str	w0, [x1, 608]
	ldr	x0, [x19, 2952]
	ldr	w1, [x0, 608]
	str	w1, [x0, 576]
	ldr	x0, [x19, 2952]
	ldr	x1, [x0, 680]
	str	x1, [x0, 632]
	ldrb	w0, [x19, 1647]
	ldr	x1, [x19, 2952]
	cmp	w0, 1
	bne	.L2780
	ldrb	w0, [x1, 3]
	orr	w0, w0, 1
	uxtb	w0, w0
	b	.L2781
	.p2align 3
.L2827:
	add	x22, x20, 61440
	b	.L2756
	.p2align 3
.L2840:
	ldr	x3, .LC783
	mov	w4, 2234
	ldr	x2, .LC785
	mov	w5, w0
	add	x3, x3, 296
	mov	w1, w4
	mov	w0, 20
	bl	dprint_normal
	b	.L2757
	.p2align 3
.L2839:
	ldrb	w0, [x1, 3]
	orr	w0, w0, 2
	uxtb	w0, w0
	b	.L2781
	.p2align 3
.L2772:
	ldr	x0, [x19, 2192]
	mov	w21, 0
	str	x0, [x19, 2952]
	str	x0, [x0, 728]
	b	.L2774
	.p2align 3
.L2761:
	ldr	x0, [x19, 2192]
	mov	w21, 0
	str	x0, [x19, 2952]
	str	x0, [x0, 680]
	b	.L2763
	.p2align 3
.L2843:
	ldr	x3, .LC783
	mov	w4, 2396
	ldr	x2, .LC785
	mov	w5, w0
	add	x3, x3, 296
	mov	w1, w4
	mov	w0, 20
	bl	dprint_normal
	b	.L2773
	.p2align 3
.L2841:
	ldr	x3, .LC783
	mov	w4, 2284
	ldr	x2, .LC785
	mov	w5, w0
	add	x3, x3, 296
	mov	w1, w4
	mov	w0, 20
	bl	dprint_normal
	b	.L2762
	.p2align 3
.L2838:
	ldr	x0, [x19, 2192]
	str	x0, [x19, 2952]
	str	x0, [x0, 728]
	ldr	x0, [x19, 2952]
	b	.L2777
	.p2align 3
.L2844:
	ldr	x0, [x19, 2192]
	str	x0, [x19, 2952]
	str	x0, [x0, 680]
	ldr	x0, [x19, 2952]
	b	.L2765
	.size	DirectOutput, .-DirectOutput
	.align	3
.LC783:
	.xword	.LANCHOR1
	.align	3
.LC785:
	.xword	.LC784
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_FlushRemainImg
	.type	H264DEC_FlushRemainImg, %function
H264DEC_FlushRemainImg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 24576
	mov	w19, 0
	bl	_mcount
	ldr	w0, [x20, 3708]
	cbnz	w0, .L2862
	b	.L2847
	.p2align 3
.L2848:
	ldr	w0, [x20, 3708]
	cmp	w0, w19
	bls	.L2847
.L2862:
	add	x0, x21, x19, uxtw 3
	add	w19, w19, 1
	ldr	x1, [x0, 27896]
	ldrb	w0, [x1, 2]
	cbz	w0, .L2848
	mov	x0, x21
	bl	UnMarkFrameStoreRef
	ldr	w0, [x20, 3708]
	cmp	w0, w19
	bhi	.L2862
	.p2align 2
.L2847:
	mov	x0, x21
	bl	RemoveUnUsedFrameStore
	cbnz	w0, .L2847
	.p2align 2
.L2856:
	ldr	w5, [x20, 3708]
	cbz	w5, .L2868
.L2857:
	ldr	w0, [x20, 3704]
	cmp	w5, w0
	bls	.L2852
	str	w0, [x20, 3708]
	cbz	w0, .L2858
	mov	w5, w0
.L2852:
	add	x1, x20, 3320
	mov	w4, 2147483647
	mov	w0, 0
	mov	w19, 0
	.p2align 2
.L2855:
	ldr	x3, [x1]
	add	x1, x1, 8
	ldr	w2, [x3, 560]
	cmp	w2, w4
	bge	.L2854
	ldrb	w3, [x3, 4]
	cmp	w3, wzr
	csel	w4, w4, w2, eq
	csel	w19, w19, w0, eq
.L2854:
	add	w0, w0, 1
	cmp	w5, w0
	bhi	.L2855
.L2853:
	add	x22, x21, x19, uxtw 3
	mov	x0, x21
	ldr	x1, [x22, 27896]
	strb	wzr, [x1, 4]
	ldr	w2, [x20, 3708]
	ldr	x1, [x22, 27896]
	bl	OutputFrmToVO
	ldr	x0, [x22, 27896]
	ldrb	w0, [x0, 2]
	cbnz	w0, .L2856
	mov	w1, w19
	mov	x0, x21
	bl	RemoveFrameStoreOutDPB
	ldr	w5, [x20, 3708]
	cbnz	w5, .L2857
.L2868:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L2858:
	mov	w19, 0
	b	.L2853
	.size	H264DEC_FlushRemainImg, .-H264DEC_FlushRemainImg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	InitDPB.part.17, %function
InitDPB.part.17:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	add	x23, x21, 24576
	add	x20, x21, 61440
	add	x19, x23, 3320
	add	x22, x23, 3448
	bl	_mcount
	.p2align 2
.L2873:
	ldr	x0, [x19]
	cbz	x0, .L2870
	ldr	w1, [x0, 544]
	ldr	w0, [x20, 1140]
	bl	FSP_ClearLogicFs
.L2870:
	ldr	x0, [x19, 128]
	cbz	x0, .L2871
	ldr	w1, [x0, 544]
	ldr	w0, [x20, 1140]
	bl	FSP_ClearLogicFs
.L2871:
	ldr	x0, [x19, 256]
	cbz	x0, .L2872
	ldr	w1, [x0, 544]
	ldr	w0, [x20, 1140]
	bl	FSP_ClearLogicFs
.L2872:
	str	xzr, [x19, 128]
	str	xzr, [x19, 256]
	str	xzr, [x19], 8
	cmp	x19, x22
	bne	.L2873
	add	x0, x21, 16384
	add	x1, x23, 3584
	add	x19, x21, 57344
	ldr	w0, [x0, 1864]
	stp	wzr, wzr, [x1, 128]
	sub	w0, w0, #1
	stp	w0, wzr, [x1, 120]
	str	wzr, [x23, 3720]
	ldr	x1, [x19, 2952]
	cbz	x1, .L2875
	ldr	w0, [x20, 1068]
	cmp	w0, 2
	beq	.L2903
.L2876:
	ldr	w1, [x1, 544]
	ldr	w0, [x20, 1140]
	bl	FSP_ClearLogicFs
	ldr	x1, [x19, 2192]
	ldr	x0, [x19, 2952]
	cbz	x1, .L2880
	ldr	w2, [x0, 544]
	ldr	w1, [x1, 544]
	cmp	w2, w1
	beq	.L2880
	ldr	w0, [x20, 1140]
	bl	FSP_ClearLogicFs
	ldr	x0, [x19, 2952]
.L2880:
	strb	wzr, [x0, 1]
	ldr	x0, [x19, 2952]
	strb	wzr, [x0, 4]
	str	xzr, [x19, 2952]
.L2875:
	ldr	x3, .LC788
	mov	x2, 392
	mov	w1, 0
	add	x0, x23, 3728
	add	x20, x20, 44
	ldr	x3, [x3, 96]
	blr	x3
	str	wzr, [x23, 3988]
	ldr	w0, [x23, 3704]
	str	w0, [x23, 3984]
	add	x0, x19, 4072
	.p2align 2
.L2881:
	str	wzr, [x0], 4
	cmp	x0, x20
	bne	.L2881
	add	x2, x21, 28672
	add	x1, x2, 24
	add	x0, x2, 288
	.p2align 2
.L2882:
	str	xzr, [x1], 8
	cmp	x1, x0
	bne	.L2882
	add	x21, x21, 20480
	add	x1, x2, 552
	str	wzr, [x21, 1624]
	.p2align 2
.L2883:
	str	xzr, [x0], 8
	cmp	x1, x0
	bne	.L2883
	str	wzr, [x21, 1628]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L2903:
	mov	w2, 0
	mov	x0, x21
	bl	OutputFrmToVO
	cbnz	w0, .L2904
.L2877:
	ldr	x1, [x19, 2952]
	cbz	x1, .L2875
	b	.L2876
	.p2align 3
.L2904:
	ldr	x3, .LC786
	mov	w4, 4480
	ldr	x2, .LC787
	mov	w5, w0
	add	x3, x3, 312
	mov	w1, w4
	mov	w0, 20
	bl	dprint_normal
	b	.L2877
	.size	InitDPB.part.17, .-InitDPB.part.17
	.align	3
.LC786:
	.xword	.LANCHOR1
	.align	3
.LC787:
	.xword	.LC784
	.align	3
.LC788:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InitDPB
	.type	InitDPB, %function
InitDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L2907
	mov	x0, x19
	bl	ClearAllSlice
	mov	x0, x19
	bl	InitDPB.part.17
.L2906:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2907:
	mov	w0, -1
	b	.L2906
	.size	InitDPB, .-InitDPB
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
	cbz	w0, .L2909
	mov	w3, 450
	ldr	x2, .LC790
	mov	w4, w0
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
.L2909:
	mov	x0, x19
	add	x19, x19, 61440
	bl	InitDPB
	str	wzr, [x19, 60]
	mov	w0, 0
	str	wzr, [x19, 1172]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ClearDPB, .-ClearDPB
	.align	3
.LC790:
	.xword	.LC789
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
	add	x20, x22, 57344
	bl	_mcount
	ldrb	w0, [x20, 1643]
	cbz	w0, .L2914
	ldrb	w0, [x20, 1641]
	add	x19, x22, 61440
	cmp	w0, 1
	beq	.L2914
.L2915:
	ldr	w21, [x19, 1128]
	ldr	w0, [x19, 1068]
	ubfx	x21, x21, 16, 3
	cmp	w21, w0
	beq	.L2916
	sub	w0, w0, #2
	cmp	w0, 1
	ccmp	w21, 2, 4, ls
	beq	.L2916
	cmp	w21, 1
	ccmp	w21, 4, 4, hi
	beq	.L3004
.L2916:
	cmp	w21, 2
	str	w21, [x19, 1068]
	beq	.L2919
	cmp	w21, 3
	beq	.L2920
	cmp	w21, 1
	beq	.L3005
	ldr	w0, [x19, 1064]
	cbz	w0, .L2923
	cmp	w21, 4
	ldr	w21, [x20, 2236]
	bne	.L2929
	cbnz	w21, .L2929
	ldr	w0, [x19, 64]
	cbnz	w0, .L2930
	mov	w0, 2
	str	w0, [x19, 64]
	b	.L2944
	.p2align 3
.L2914:
	add	x19, x22, 61440
	ldr	w0, [x19, 1192]
	ldr	w1, [x19, 1196]
	add	w0, w0, 1
	cmp	w0, w1
	csel	w0, w0, w1, ge
	str	w0, [x19, 1192]
	sub	w0, w0, w1
	ldr	x1, [x22]
	str	w0, [x1, 592]
	b	.L2915
	.p2align 3
.L2920:
	mov	x0, x22
	mov	w19, -1
	bl	ClearAllSlice
	add	x1, x22, 20480
	ldr	w4, [x22, 14948]
	add	x6, x1, 3072
	mov	w3, 23352
	movk	w3, 0x1, lsl 16
	mov	w2, 2
	strb	wzr, [x1, 3224]
	mov	w0, 7
	strb	w2, [x1, 3225]
	mov	w2, 1048576
	str	w0, [x1, 3236]
	mov	w0, 32
	str	w4, [x1, 3232]
	str	w3, [x1, 3240]
	stp	w21, w19, [x6, 176]
	stp	wzr, wzr, [x6, 184]
	strb	w0, [x1, 3226]
	mov	x0, x22
	str	w2, [x1, 3264]
	bl	ClearDPB
	mov	w0, w19
.L2980:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3005:
	ldr	w21, [x20, 2236]
	cmp	w21, 2
	bne	.L2925
	ldr	w0, [x20, 2216]
	cbz	w0, .L2926
.L2925:
	ldr	w0, [x19, 1064]
	cbz	w0, .L2923
.L2929:
	cmp	w21, 2
	beq	.L3006
	cmp	w21, 1
	bne	.L2944
	str	w21, [x19, 64]
.L2944:
	ldr	w3, [x19, 1104]
	mov	w1, 6217
	ldr	x2, .LC800
	mov	w0, 3
	ldrb	w4, [x20, 1643]
	sub	w3, w3, #1
	bl	dprint_normal
	ldr	w0, [x20, 2260]
	str	w0, [x19, 708]
	mov	w0, 1
	strb	w0, [x19, 114]
	ldr	w2, [x19, 1064]
	ldr	w1, [x20, 2264]
	ldr	w0, [x19, 1104]
	str	w1, [x19, 704]
	str	w2, [x19, 908]
	cbz	w0, .L2933
	ldr	w4, [x20, 2236]
	cbnz	w4, .L2934
	ldr	x0, .LC795
	ldr	x5, [x0]
	cbz	x5, .L2935
	ldr	x1, [x19, 912]
	cbz	x1, .L2936
	mov	w2, 0
	.p2align 2
.L2937:
	ldp	w3, w0, [x1, 8]
	ldr	x1, [x1, 4056]
	add	w0, w3, w0
	add	w0, w0, 7
	add	w2, w2, w0, lsr 3
	mov	w4, w2
	cbnz	x1, .L2937
.L2936:
	add	x2, x29, 64
	ldr	w0, [x19, 1140]
	mov	w3, 4
	mov	w1, 8
	str	w4, [x2, -8]!
	blr	x5
	ldr	x2, [x22]
.L2938:
	add	x1, x19, 112
	str	x1, [x22, 616]
	ldr	w0, [x2, 880]
	cmp	w0, 1
	beq	.L3007
	cmp	w0, 2
	beq	.L3008
.L2941:
	str	wzr, [x19, 1052]
.L2933:
	ldr	w3, [x20, 2276]
	ldr	x2, [x20, 2192]
	ldr	w0, [x20, 2272]
	str	w3, [x20, 2272]
	sub	w0, w0, w3
	ldr	w1, [x2, 244]
	add	w1, w1, w0
	str	w1, [x2, 244]
	ldr	w2, [x20, 1892]
	ldr	w1, [x20, 2236]
	add	w0, w2, w0
	str	w0, [x20, 1892]
	cbz	w1, .L3009
	cmp	w1, 1
	beq	.L3010
	cmp	w1, 2
	mov	w0, 0
	bne	.L2980
	ldr	x1, .LC801
	ldrsw	x2, [x19, 1140]
	ldr	x2, [x1, x2, lsl 3]
	ldr	w1, [x2, 104]
	add	w1, w1, 1
	str	w1, [x2, 104]
	b	.L2980
	.p2align 3
.L2919:
	ldr	w0, [x20, 2236]
	cbnz	w0, .L2926
	ldr	w0, [x19, 1064]
	cbz	w0, .L2923
	ldr	x0, [x19, 1056]
	ldr	w0, [x0, 48]
	cbz	w0, .L2944
	mov	w1, 1
	mov	x0, x22
	strb	w1, [x20, 1647]
	mov	w19, -1
	bl	ClearAllSlice
	add	x0, x22, 20480
	mov	w3, 23352
	movk	w3, 0x1, lsl 16
	mov	w1, 7
	ldr	w4, [x22, 14948]
	ldr	x2, .LC794
	str	w1, [x0, 3236]
	mov	w1, 3
	str	w3, [x0, 3240]
	mov	w3, 32
	str	w1, [x0, 3248]
	mov	w1, 6159
	strb	w3, [x0, 3226]
	mov	w3, 1048576
	strb	wzr, [x0, 3224]
	strb	w21, [x0, 3225]
	str	w4, [x0, 3232]
	str	w19, [x0, 3252]
	str	wzr, [x0, 3256]
	str	wzr, [x0, 3260]
	str	w3, [x0, 3264]
	mov	w0, 0
	bl	dprint_normal
	mov	w0, w19
	b	.L2980
	.p2align 3
.L2923:
	mov	x0, x22
	mov	w20, -1
	bl	ClearAllSlice
	add	x0, x22, 20480
	mov	w5, 7
	ldr	w7, [x22, 14948]
	mov	w1, 23352
	ldr	x2, .LC795
	movk	w1, 0x1, lsl 16
	str	w5, [x0, 3236]
	add	x5, x0, 3072
	str	w1, [x0, 3240]
	mov	w6, 2
	strb	wzr, [x0, 3224]
	mov	w3, 32
	strb	w6, [x0, 3225]
	mov	w1, 1048576
	strb	w3, [x0, 3226]
	str	w7, [x0, 3232]
	ldr	x4, [x2]
	mov	w2, 3
	stp	wzr, wzr, [x5, 184]
	stp	w2, w20, [x5, 176]
	str	w1, [x0, 3264]
	cbz	x4, .L3000
	ldr	w0, [x19, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 60
	blr	x4
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3006:
	ldr	w0, [x19, 64]
	cmp	w0, 2
	bne	.L2944
	ldr	x0, [x22]
	ldr	w0, [x0, 12]
	cbnz	w0, .L2944
	ldr	x0, .LC796
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L2944
	ldr	x2, .LC798
	mov	w1, 6206
	ldr	w4, [x20, 2216]
	mov	w0, 1
	ldr	w3, [x20, 2220]
	bl	dprint_normal
	mov	x0, x22
	bl	ClearAllSlice
	ldr	x3, .LC795
	add	x0, x22, 20480
	mov	w1, 23352
	ldr	w2, [x22, 14948]
	movk	w1, 0x1, lsl 16
	mov	w6, 7
	ldr	x4, [x3]
	mov	w5, 32
	mov	w3, 3
	str	w2, [x0, 3232]
	str	w1, [x0, 3240]
	mov	w2, -1
	mov	w1, 1048576
	strb	wzr, [x0, 3224]
	strb	w21, [x0, 3225]
	strb	w5, [x0, 3226]
	str	w6, [x0, 3236]
	str	w3, [x0, 3248]
	str	wzr, [x0, 3256]
	str	wzr, [x0, 3260]
	str	w2, [x0, 3252]
	str	w1, [x0, 3264]
	cbz	x4, .L2932
	ldr	w0, [x19, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 60
	blr	x4
.L2932:
	ldr	x1, [x20, 2192]
	mov	w2, 0
	ldr	w0, [x19, 1140]
	ldr	w1, [x1, 544]
	bl	FSP_SetDisplay
	.p2align 2
.L3000:
	mov	w0, -1
	b	.L2980
	.p2align 3
.L3008:
	ldr	w0, [x2, 884]
	cmp	w0, wzr
	ccmp	x1, xzr, 4, gt
	beq	.L2941
	ldr	w21, [x20, 2236]
	cmp	w21, 2
	bne	.L2941
	str	xzr, [x22, 616]
	mov	w2, 0
	ldr	x1, [x20, 2192]
	ldr	w0, [x19, 1140]
	ldr	w1, [x1, 544]
	bl	FSP_SetDisplay
	ldr	x2, [x22]
	mov	x0, x22
	ldr	w1, [x2, 884]
	sub	w1, w1, #1
	str	w1, [x2, 884]
.L3002:
	bl	ClearAllSlice
	add	x1, x22, 20480
	ldr	w7, [x22, 14948]
	mov	w6, 23352
	mov	w0, -1
	movk	w6, 0x1, lsl 16
	mov	w5, 7
	mov	w4, 32
	mov	w3, 3
	mov	w2, 1048576
	strb	wzr, [x1, 3224]
	strb	w21, [x1, 3225]
	str	w7, [x1, 3232]
	str	w6, [x1, 3240]
	.p2align 2
.L3001:
	strb	w4, [x1, 3226]
	add	x4, x1, 3072
	str	w5, [x1, 3236]
	stp	w3, w0, [x4, 176]
	stp	wzr, wzr, [x4, 184]
	str	w2, [x1, 3264]
	b	.L2980
	.p2align 3
.L3009:
	ldrsw	x2, [x19, 1140]
	mov	w0, 0
	ldr	x1, .LC801
	ldr	x2, [x1, x2, lsl 3]
	ldr	w1, [x2, 96]
	add	w1, w1, 1
	str	w1, [x2, 96]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2934:
	add	x0, x22, 24576
	ldr	w0, [x0, 3708]
	cbnz	w0, .L2935
	ldr	x2, [x22]
	ldr	w0, [x2, 12]
	cmp	w0, 2
	beq	.L2938
	ldr	x0, .LC795
	ldr	x4, [x0]
	cbz	x4, .L2939
	ldr	w0, [x19, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 60
	blr	x4
.L2939:
	mov	x0, x22
.L2999:
	bl	ClearAllSlice
	add	x1, x22, 20480
	ldr	w8, [x22, 14948]
	mov	w7, 23352
	mov	w6, 2
	movk	w7, 0x1, lsl 16
	mov	w0, -1
	mov	w5, 7
	mov	w4, 32
	mov	w3, 3
	mov	w2, 1048576
	strb	wzr, [x1, 3224]
	strb	w6, [x1, 3225]
	str	w8, [x1, 3232]
	str	w7, [x1, 3240]
	b	.L3001
	.p2align 3
.L2935:
	ldr	x2, [x22]
	b	.L2938
	.p2align 3
.L3007:
	cbz	x1, .L2941
	ldr	w21, [x20, 2236]
	cmp	w21, 2
	bne	.L2941
	str	xzr, [x22, 616]
	mov	w2, 0
	ldr	x1, [x20, 2192]
	ldr	w0, [x19, 1140]
	ldr	w1, [x1, 544]
	bl	FSP_SetDisplay
	mov	x0, x22
	b	.L3002
	.p2align 3
.L3010:
	ldr	x1, .LC801
	mov	w0, 0
	ldrsw	x2, [x19, 1140]
	ldr	x2, [x1, x2, lsl 3]
	ldr	w1, [x2, 100]
	add	w1, w1, 1
	str	w1, [x2, 100]
	b	.L2980
	.p2align 3
.L2930:
	mov	w0, 1
	str	w0, [x19, 64]
	b	.L2944
.L3004:
	ldr	x2, .LC792
	mov	w3, w21
	mov	w1, 6126
	mov	w0, 3
	mov	w20, -1
	bl	dprint_normal
	str	w21, [x19, 1068]
	mov	x0, x22
	bl	ClearAllSlice
	add	x1, x22, 20480
	ldr	w4, [x22, 14948]
	add	x7, x1, 3072
	mov	w2, 2
	mov	w3, 23352
	mov	w0, 7
	strb	w2, [x1, 3225]
	movk	w3, 0x1, lsl 16
	str	w0, [x1, 3236]
	mov	w2, 32
	strb	wzr, [x1, 3224]
	mov	w0, 3
	strb	w2, [x1, 3226]
	mov	w2, 1048576
	str	w4, [x1, 3232]
	str	w3, [x1, 3240]
	stp	w20, wzr, [x7, 180]
	stp	wzr, w2, [x7, 188]
	str	w0, [x1, 3248]
	mov	x0, x22
	bl	ClearDPB
	mov	w0, w20
	b	.L2980
.L2926:
	mov	w1, 1
	mov	x0, x22
	strb	w1, [x20, 1647]
	b	.L2999
	.size	DecVDM, .-DecVDM
	.align	3
.LC792:
	.xword	.LC791
	.align	3
.LC794:
	.xword	.LC793
	.align	3
.LC795:
	.xword	g_EventReportFunc
	.align	3
.LC796:
	.xword	g_AllowBPicBeforePPic
	.align	3
.LC798:
	.xword	.LC797
	.align	3
.LC800:
	.xword	.LC799
	.align	3
.LC801:
	.xword	s_pstVfmwChan
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
	mov	w20, 1
	bl	_mcount
	add	x1, x19, 20480
	mov	w2, 1
	mov	x0, x19
	strb	w2, [x1, 1589]
	str	wzr, [x1, 1632]
	str	w20, [x19, 624]
	bl	DecVDM
	cbz	w0, .L3011
	ldr	x2, .LC803
	mov	w1, 9924
	mov	w0, w20
	bl	dprint_normal
.L3011:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H264_FlushDecoder, .-H264_FlushDecoder
	.align	3
.LC803:
	.xword	.LC802
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
	add	x22, x21, 57344
	mov	x0, x19
	str	xzr, [x29, 72]
	bl	BsSkip
	str	wzr, [x22, 1928]
	ldr	x1, [x22, 1936]
	str	x1, [x29, 72]
	cbz	w20, .L3018
	cmp	w20, 1
	bne	.L3112
	cmp	w23, 1
	mov	w1, 16
	mov	x0, x19
	beq	.L3113
	bl	BsGet
	mov	w20, w0
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	mov	w1, 31745
	cmp	w20, w1
	beq	.L3038
	mov	w1, 24
	mov	x0, x19
	bl	BsBack
	mov	w1, 24
	mov	x0, x19
	bl	BsBack
	mov	w0, 32257
	cmp	w20, w0
	beq	.L3114
.L3095:
	mov	w0, 0
.L3116:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3112:
	ldr	x2, .LC815
	mov	w3, w20
	mov	w1, 11020
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
.L3092:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3018:
	cmp	w23, 1
	beq	.L3115
	mov	w1, 24
	mov	x0, x19
	bl	BsBack
	mov	w0, 0
	b	.L3116
	.p2align 3
.L3038:
	and	w0, w0, 31
	cmp	w0, 25
	bne	.L3095
	ldr	x19, .LC804
	ldr	x4, [x19]
	cbz	x4, .L3041
	add	x0, x21, 61440
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	ldr	w0, [x0, 1140]
	blr	x4
.L3041:
	mov	x0, x21
	bl	DecVDM
	cbz	w0, .L3042
.L3106:
	ldr	x4, [x19]
	cbz	x4, .L3099
	add	x21, x21, 61440
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	ldr	w0, [x21, 1140]
	blr	x4
	mov	w0, -1
	b	.L3092
	.p2align 3
.L3115:
	mov	w1, 16
	mov	x0, x19
	mov	w23, 31745
	bl	BsGet
	mov	w20, w0
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	cmp	w20, w23
	beq	.L3021
	mov	w1, 24
	mov	x0, x19
	and	w20, w20, -513
	bl	BsBack
	mov	w1, 24
	mov	x0, x19
	bl	BsBack
	cmp	w20, w23
	bne	.L3095
.L3037:
	ldr	x1, [x21, 632]
	cbz	x1, .L3099
	add	x0, x21, 61440
	ldr	w0, [x0, 1140]
	bl	ReleaseNAL
	str	xzr, [x21, 632]
	mov	w0, -1
	b	.L3092
	.p2align 3
.L3042:
	ldr	x0, [x21, 632]
	add	x22, x22, 1920
	add	x19, x21, 61440
	ldr	w1, [x22, 12]
	add	x2, x29, 72
	ldr	w4, [x0, 48]
	ldr	w3, [x0, 80]
	ldr	w0, [x19, 1140]
	add	w3, w4, w3
	sub	w3, w3, #1
	bl	MetadataMapToSec
	cbnz	w0, .L3117
	ldr	x20, .LC808
	mov	x2, 5
	ldr	x1, .LC809
	ldr	x0, [x29, 72]
	ldr	x3, [x20, 104]
	blr	x3
	ldr	x1, [x21, 632]
	ldr	x0, [x29, 72]
	ldr	x3, [x20, 104]
	ldr	w2, [x1, 48]
	add	x0, x0, 5
	sub	w2, w2, #6
	str	w2, [x22, 8]
	ldr	x1, [x1, 40]
	add	x1, x1, 6
	blr	x3
	ldr	w3, [x22, 8]
	add	w3, w3, 5
	str	w3, [x22, 8]
	ldr	x1, [x21, 632]
	ldr	w2, [x1, 80]
	cbnz	w2, .L3118
.L3044:
	ldr	w0, [x19, 1140]
	mov	w2, w3
	ldr	x1, [x29, 72]
	bl	H264_SaveMetadata
	ldr	w0, [x19, 1140]
	ldr	x1, [x29, 72]
	bl	MetadataUnMapToSec
	cbz	w0, .L3045
	ldr	x3, .LC805
	mov	w4, 10998
.L3100:
	ldr	x2, .LC811
.L3098:
	mov	w1, w4
	add	x3, x3, 320
	mov	w0, 0
	bl	dprint_normal
	.p2align 2
.L3099:
	mov	w0, -1
.L3122:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3113:
	bl	BsGet
	mov	w20, w0
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	mov	w1, 31745
	cmp	w20, w1
	beq	.L3032
	mov	w1, 32
	mov	x0, x19
	bl	BsBack
	ldr	x0, [x21, 632]
	mov	w2, 32257
	mov	w1, 16
	cmp	w20, w2
	str	w1, [x0, 8]
	beq	.L3119
	mov	w1, 8
	mov	x0, x19
	bl	BsSkip
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	and	w0, w0, 31
	cmp	w0, 11
	bne	.L3037
	mov	x0, x21
	bl	H264_IsEosNal
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L3037
	ldr	x1, [x21, 632]
	mov	x0, x19
	ldr	w2, [x1, 48]
	ldr	x1, [x1, 40]
	bl	BsInit
	mov	w0, 3
	b	.L3092
	.p2align 3
.L3021:
	and	w0, w0, 31
	cmp	w0, 25
	bne	.L3037
	ldr	x19, .LC804
	ldr	x4, [x19]
	cbz	x4, .L3024
	add	x0, x21, 61440
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	ldr	w0, [x0, 1140]
	blr	x4
.L3024:
	mov	x0, x21
	bl	DecVDM
	cbnz	w0, .L3106
	ldr	x0, [x21, 632]
	add	x22, x22, 1920
	add	x19, x21, 61440
	ldr	w1, [x22, 12]
	add	x2, x29, 72
	ldr	w4, [x0, 48]
	ldr	w3, [x0, 80]
	ldr	w0, [x19, 1140]
	add	w3, w4, w3
	sub	w3, w3, #1
	bl	MetadataMapToSec
	cbnz	w0, .L3120
	ldr	x20, .LC808
	mov	x2, 5
	ldr	x1, .LC809
	ldr	x0, [x29, 72]
	ldr	x3, [x20, 104]
	blr	x3
	ldr	x1, [x21, 632]
	ldr	x0, [x29, 72]
	ldr	x3, [x20, 104]
	ldr	w2, [x1, 48]
	add	x0, x0, 5
	sub	w2, w2, #6
	str	w2, [x22, 8]
	ldr	x1, [x1, 40]
	add	x1, x1, 6
	blr	x3
	ldr	w3, [x22, 8]
	add	w3, w3, 5
	str	w3, [x22, 8]
	ldr	x1, [x21, 632]
	ldr	w2, [x1, 80]
	cbnz	w2, .L3121
.L3028:
	ldr	w0, [x19, 1140]
	mov	w2, w3
	ldr	x1, [x29, 72]
	bl	H264_SaveMetadata
	ldr	w0, [x19, 1140]
	ldr	x1, [x29, 72]
	bl	MetadataUnMapToSec
	ldr	x3, .LC805
	mov	w4, 10861
	cbnz	w0, .L3100
.L3045:
	ldr	x1, [x21, 632]
	cbz	x1, .L3099
	ldr	w0, [x19, 1140]
	bl	ReleaseNAL
	str	xzr, [x21, 632]
	mov	w0, -1
	b	.L3092
	.p2align 3
.L3032:
	and	w0, w0, 31
	cmp	w0, 25
	ccmp	w24, 2, 0, eq
	bne	.L3037
	ldr	x19, .LC804
	ldr	x4, [x19]
	cbz	x4, .L3035
	add	x0, x21, 61440
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	ldr	w0, [x0, 1140]
	blr	x4
.L3035:
	mov	x0, x21
	bl	DecVDM
	cbz	w0, .L3037
	b	.L3106
	.p2align 3
.L3114:
	ldr	x3, .LC805
	mov	w4, 11008
	ldr	x2, .LC813
	mov	w1, w4
	add	x3, x3, 320
	mov	w0, 0
	bl	dprint_normal
	ldr	x1, [x21, 632]
	cbz	x1, .L3099
	add	x0, x21, 61440
	ldr	w0, [x0, 1140]
	bl	ReleaseNAL
	str	xzr, [x21, 632]
	mov	w0, -1
	b	.L3122
.L3118:
	ldr	x0, [x29, 72]
	uxtw	x2, w2
	ldr	x1, [x1, 72]
	ldr	x4, [x20, 104]
	add	x0, x0, x3, uxtw
	blr	x4
	ldr	x1, [x21, 632]
	ldr	w0, [x22, 8]
	ldr	w3, [x1, 80]
	add	w3, w3, w0
	str	w3, [x22, 8]
	b	.L3044
.L3119:
	ldr	x0, [x21, 632]
	add	x21, x21, 61440
	ldr	w2, [x0, 48]
	ldr	x1, [x0, 40]
	ldr	w0, [x21, 1140]
	bl	H264_SaveElStream
	mov	w0, 0
	b	.L3092
.L3121:
	ldr	x0, [x29, 72]
	uxtw	x2, w2
	ldr	x1, [x1, 72]
	ldr	x4, [x20, 104]
	add	x0, x0, x3, uxtw
	blr	x4
	ldr	x1, [x21, 632]
	ldr	w0, [x22, 8]
	ldr	w3, [x1, 80]
	add	w3, w3, w0
	str	w3, [x22, 8]
	b	.L3028
.L3117:
	ldr	x3, .LC805
	mov	w4, 10974
	ldr	x2, .LC807
	b	.L3098
.L3120:
	ldr	x3, .LC805
	mov	w4, 10838
	ldr	x2, .LC807
	b	.L3098
	.size	H264_VES_Splitter, .-H264_VES_Splitter
	.align	3
.LC804:
	.xword	g_EventReportFunc
	.align	3
.LC805:
	.xword	.LANCHOR1
	.align	3
.LC807:
	.xword	.LC806
	.align	3
.LC808:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC809:
	.xword	g_RpuStartCode
	.align	3
.LC811:
	.xword	.LC810
	.align	3
.LC813:
	.xword	.LC812
	.align	3
.LC815:
	.xword	.LC814
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_SetDecParam
	.type	H264DEC_SetDecParam, %function
H264DEC_SetDecParam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 61440
	bl	_mcount
	ldr	w0, [x19, 1156]
	cmp	w0, 1
	beq	.L3149
.L3124:
	mov	x0, x20
	bl	H264DEC_IsNeedSedOnly
	cmp	w0, 1
	beq	.L3150
	ldr	w0, [x19, 1152]
	cmp	w0, 1
	beq	.L3151
.L3123:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3151:
	ldr	w0, [x19, 1064]
	sub	w0, w0, #1
	str	w0, [x19, 1064]
.L3148:
	ldr	x1, [x20, 632]
	cbz	x1, .L3123
	ldr	w0, [x19, 1140]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3149:
	ldr	w0, [x19, 1064]
	cbz	w0, .L3124
	ldr	x0, [x20, 616]
	cbnz	x0, .L3124
	ldr	x0, .LC816
	ldr	x4, [x0]
	cbz	x4, .L3125
	ldr	w0, [x19, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	blr	x4
.L3125:
	mov	x0, x20
	bl	DecVDM
	cbnz	w0, .L3152
.L3126:
	ldr	x0, [x20, 616]
	cbnz	x0, .L3123
	b	.L3148
	.p2align 3
.L3150:
	ldr	w1, [x19, 1064]
	add	x2, x20, 57344
	str	w0, [x19, 1052]
	add	x0, x19, 112
	str	w1, [x19, 1164]
	ldr	w2, [x2, 2260]
	str	w2, [x19, 708]
	str	w1, [x19, 908]
	str	x0, [x20, 616]
	str	wzr, [x19, 1156]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3152:
	ldr	x2, .LC818
	mov	w1, 11063
	mov	w0, 1
	bl	dprint_normal
	b	.L3126
	.size	H264DEC_SetDecParam, .-H264DEC_SetDecParam
	.align	3
.LC816:
	.xword	g_EventReportFunc
	.align	3
.LC818:
	.xword	.LC817
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
	add	x19, x20, 61440
	bl	_mcount
	ldr	w0, [x19, 1148]
	str	wzr, [x19, 1152]
	cmp	w0, 2
	beq	.L3192
	cmp	w0, 1
	mov	w0, 0
	beq	.L3193
.L3185:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3193:
	ldr	w1, [x19, 1156]
	cmp	w1, 1
	bne	.L3185
	mov	w0, -1
	str	wzr, [x19, 1156]
	b	.L3185
	.p2align 3
.L3192:
	ldr	w0, [x19, 1144]
	cbz	w0, .L3191
	ldr	w1, [x19, 1156]
	mov	w0, 0
	cmp	w1, 1
	beq	.L3185
	ldr	w0, [x19, 1140]
	bl	VCTRL_CheckFreshSeg
	cbz	w0, .L3157
.L3160:
	ldr	x0, [x20, 632]
	ldr	w2, [x0, 48]
	ldr	x1, [x0, 40]
	cmp	w2, 3
	bls	.L3191
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
	ble	.L3191
	mov	w1, 3
	mov	x0, x21
	bl	BsSkip
	mov	w1, 5
	mov	x0, x21
	bl	BsGet
	cmp	w0, 20
	mov	w22, w0
	beq	.L3194
	and	w0, w0, -5
	cmp	w0, 1
	cset	w23, eq
	beq	.L3162
	ldr	w1, [x19, 1064]
	mov	w0, 0
	cbz	w1, .L3191
.L3170:
	and	w1, w22, -9
	cmp	w1, 7
	beq	.L3167
	cmp	w22, 8
	ccmp	w22, 30, 4, ne
	ccmp	w22, 11, 4, ne
	ccmp	w0, wzr, 0, ne
	bne	.L3167
	cbz	w23, .L3191
.L3171:
	add	x20, x20, 57344
	mov	w0, 1
	str	wzr, [x19, 1156]
	str	w0, [x19, 1152]
	mov	w0, 0
	ldrb	w1, [x20, 1640]
	str	w1, [x19, 1160]
	b	.L3185
	.p2align 3
.L3167:
	ldr	x0, .LC819
	ldr	x4, [x0]
	cbz	x4, .L3169
	ldr	w0, [x19, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	blr	x4
.L3169:
	mov	x0, x20
	bl	DecVDM
	cbnz	w0, .L3195
.L3191:
	mov	w0, -1
.L3196:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3195:
	ldr	x2, .LC820
	mov	w1, 11194
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L3196
	.p2align 3
.L3157:
	ldr	w0, [x19, 1140]
	bl	VCTRL_GetChanCrcMode
	cbnz	w0, .L3160
	ldr	x0, [x20]
	ldr	w0, [x0, 888]
	cmp	w0, 1
	beq	.L3160
	mov	w0, -1
	b	.L3196
	.p2align 3
.L3194:
	mov	x0, x21
	bl	BsResidBits
	cmp	w0, 23
	ble	.L3191
	mov	w1, 24
	mov	x0, x21
	mov	w23, 1
	bl	BsGet
	tbnz	x0, 23, .L3197
.L3162:
	mov	x0, x21
	bl	BsResidBits
	cmp	w0, wzr
	mov	w0, 0
	ble	.L3166
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
.L3166:
	ldr	w1, [x19, 1064]
	cbz	w1, .L3171
	b	.L3170
	.p2align 3
.L3197:
	ubfx	x0, x0, 22, 1
	mov	w1, 5
	cmp	w0, w23
	csel	w22, w22, w1, ne
	b	.L3162
	.size	H264DEC_CheckSedOnly, .-H264DEC_CheckSedOnly
	.align	3
.LC819:
	.xword	g_EventReportFunc
	.align	3
.LC820:
	.xword	.LC817
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
	add	x21, x20, 61440
	bl	_mcount
	ldr	x2, .LC822
	mov	w1, 10403
	ldp	w4, w5, [x19, 16]
	ldr	x3, [x19, 8]
	mov	w0, 8
	bl	dprint_normal
	str	wzr, [x21, 1200]
	ldr	x0, [x20]
	ldr	w1, [x0, 856]
	cmp	w1, 1
	beq	.L3268
.L3199:
	ldr	x0, [x20, 632]
	cbz	x0, .L3204
	ldrb	w1, [x19]
	cmp	w1, 1
	beq	.L3269
.L3202:
	ldr	x2, .LC824
	mov	w1, 10412
	mov	w0, 1
	bl	dprint_normal
	ldr	x1, [x20, 632]
	cbz	x1, .L3204
	ldr	w0, [x21, 1140]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L3204:
	ldr	w0, [x19, 20]
	cmp	w0, wzr
	ble	.L3206
	ldr	x0, [x19, 8]
	cbz	x0, .L3206
	ldr	w0, [x19, 16]
	cbz	w0, .L3206
	ldrb	w0, [x20, 641]
	cbz	w0, .L3226
	add	x1, x20, 745
	mov	x0, 1
	b	.L3209
	.p2align 3
.L3208:
	add	w0, w0, 1
	cmp	w0, 137
	beq	.L3224
.L3209:
	ldrb	w2, [x1]
	add	x1, x1, 104
	cbnz	w2, .L3208
	mov	w2, w0
.L3207:
	lsl	x1, x0, 3
	mov	w3, 1
	sub	x1, x1, x0
	cmn	w2, #1
	lsl	x1, x1, x3
	sub	x0, x1, x0
	add	x0, x20, x0, lsl 3
	strb	w3, [x0, 641]
	beq	.L3224
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
	str	x1, [x0, 680]
	ldr	w1, [x19, 20]
	str	w1, [x0, 688]
	ldr	w1, [x19, 16]
	str	w1, [x0, 692]
	ldr	x0, [x20, 632]
	str	wzr, [x0, 60]
	ldr	x0, [x20, 632]
	ldr	w1, [x19, 24]
	str	w1, [x0, 68]
	ldr	x0, [x20, 632]
	ldr	x1, [x19, 32]
	str	x1, [x0, 32]
	ldr	x0, [x20, 632]
	str	w2, [x0, 12]
	ldr	x0, [x20, 632]
	strb	wzr, [x0]
	ldr	x0, [x20, 632]
	ldrb	w1, [x19]
	strb	w1, [x0, 4]
	ldr	w0, [x19, 28]
	str	w0, [x21, 1148]
	ldr	x0, [x20]
	ldrb	w0, [x0, 904]
	cmp	w0, w2
	beq	.L3265
	add	x0, x20, 57344
	ldr	w2, [x19, 20]
	ldr	w1, [x0, 2272]
	ldr	w3, [x0, 2276]
	add	w2, w1, w2
	str	w2, [x0, 2272]
	ldr	w1, [x19, 20]
	add	w1, w3, w1
	str	w1, [x0, 2276]
	ldr	x0, [x20, 632]
	b	.L3215
	.p2align 3
.L3269:
	ldr	w2, [x0, 12]
	cmp	w2, 1
	bhi	.L3202
	ldrb	w2, [x0, 4]
	cmp	w2, 1
	bne	.L3203
	b	.L3202
	.p2align 3
.L3268:
	ldr	w0, [x0, 888]
	cbz	w0, .L3199
	ldr	x0, [x20, 632]
	cbz	x0, .L3204
	ldrb	w1, [x19]
.L3203:
	strb	w1, [x0, 4]
	ldr	x0, [x20]
	ldr	w1, [x0, 856]
	cmp	w1, 1
	beq	.L3270
.L3217:
	ldr	w0, [x19, 20]
	cmp	w0, wzr
	ble	.L3218
	ldr	x1, [x19, 8]
	cbz	x1, .L3218
	ldr	w0, [x19, 16]
	cbz	w0, .L3218
	ldr	x0, [x20, 632]
	ldr	w2, [x0, 12]
	cmp	w2, 1
	bls	.L3271
.L3219:
	mov	w1, 1
	strb	w1, [x0, 4]
	ldr	w1, [x19, 24]
	ldr	w0, [x21, 1140]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC827
	ldr	x4, [x0]
	cbz	x4, .L3265
	ldr	w0, [x21, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L3265:
	ldr	x0, [x20, 632]
.L3215:
	ldrb	w0, [x0, 4]
	ldp	x19, x20, [sp, 16]
	cmp	w0, wzr
	csetm	w0, eq
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3206:
	ldr	x2, .LC829
	mov	w1, 10459
	mov	w0, 1
	bl	dprint_normal
	ldr	w1, [x19, 24]
	ldr	w0, [x21, 1140]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC827
	ldr	x4, [x0]
	cbz	x4, .L3267
.L3266:
	ldr	w0, [x21, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L3267:
	mov	w0, -1
.L3274:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3218:
	ldr	x0, [x20, 632]
	b	.L3219
	.p2align 3
.L3270:
	ldr	w0, [x0, 888]
	cbnz	w0, .L3265
	b	.L3217
	.p2align 3
.L3271:
	uxtw	x2, w2
	add	x0, x0, x2, lsl 5
	str	x1, [x0, 40]
	ldr	x1, [x20, 632]
	ldr	w2, [x19, 20]
	ldr	w0, [x1, 12]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 48]
	ldr	x1, [x20, 632]
	ldr	w2, [x19, 16]
	ldr	w0, [x1, 12]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 52]
	ldr	x1, [x20, 632]
	ldr	w0, [x1, 12]
	add	x0, x1, x0, lsl 5
	str	wzr, [x0, 60]
	ldr	x1, [x20, 632]
	ldr	w2, [x19, 24]
	ldr	w0, [x1, 12]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 68]
	ldr	x1, [x20, 632]
	ldr	w0, [x1, 12]
	add	w0, w0, 1
	str	w0, [x1, 12]
	ldr	x0, [x20]
	ldrb	w0, [x0, 904]
	cmp	w0, 1
	beq	.L3220
	add	x0, x20, 57344
	ldr	w2, [x19, 20]
	ldr	w1, [x0, 2272]
	ldr	w3, [x0, 2276]
	add	w2, w1, w2
	str	w2, [x0, 2272]
	ldr	w1, [x19, 20]
	add	w1, w3, w1
	str	w1, [x0, 2276]
.L3220:
	ldr	x0, [x20, 632]
	ldr	w1, [x0, 48]
	cmp	w1, 4095
	bls	.L3272
.L3221:
	mov	w1, 1
	str	w1, [x21, 1200]
	b	.L3215
	.p2align 3
.L3272:
	mov	x0, x20
	bl	CombinePacket.part.12
	ldr	x0, [x20, 632]
	b	.L3221
.L3224:
	ldr	x2, .LC826
	mov	w1, 10426
	mov	w0, 0
	add	x22, x20, 12288
	add	x19, x20, 640
	add	x22, x22, 2600
	bl	dprint_normal
	b	.L3211
	.p2align 3
.L3210:
	add	x19, x19, 104
	cmp	x22, x19
	beq	.L3273
.L3211:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L3210
	ldr	w0, [x21, 1140]
	mov	x1, x19
	bl	ReleaseNAL
	b	.L3210
.L3273:
	mov	x0, x20
	mov	w19, -1
	bl	ClearAllSlice
	add	x1, x20, 20480
	mov	w0, 7
	ldr	w4, [x20, 14948]
	mov	w2, 2
	mov	w3, 23352
	str	w0, [x1, 3236]
	add	x0, x1, 3072
	strb	w2, [x1, 3225]
	movk	w3, 0x1, lsl 16
	str	w4, [x1, 3232]
	mov	w2, 32
	strb	wzr, [x1, 3224]
	strb	w2, [x1, 3226]
	mov	w2, 1048576
	str	w3, [x1, 3240]
	stp	w19, wzr, [x0, 180]
	stp	wzr, w2, [x0, 188]
	mov	w0, 3
	str	w0, [x1, 3248]
	mov	x0, x20
	bl	ClearDPB
	ldr	x0, .LC827
	ldr	x4, [x0]
	cbnz	x4, .L3266
	mov	w0, -1
	b	.L3274
.L3226:
	mov	w2, 0
	mov	x0, 0
	b	.L3207
	.size	ReceivePacket, .-ReceivePacket
	.align	3
.LC822:
	.xword	.LC821
	.align	3
.LC824:
	.xword	.LC823
	.align	3
.LC826:
	.xword	.LC825
	.align	3
.LC827:
	.xword	g_EventReportFunc
	.align	3
.LC829:
	.xword	.LC828
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
	mov	x20, x0
	mov	w22, w1
	mov	x0, x30
	add	x1, x20, 20480
	mov	x23, x1
	add	x19, x20, 640
	stp	x1, x20, [x29, 96]
	bl	_mcount
	add	x21, x20, 61440
	ldr	x2, .LC831
	mov	w1, 467
	mov	w0, 20
	bl	dprint_normal
	mov	x0, x20
	bl	ClearAllSlice
	mov	x1, x20
	mov	w2, 23352
	movk	w2, 0x1, lsl 16
	mov	w0, 7
	add	x20, x20, 12288
	ldr	w3, [x1, 14948]
	mov	w1, 2
	str	w3, [x23, 3232]
	add	x20, x20, 2600
	strb	w1, [x23, 3225]
	mov	w3, 32
	mov	w1, -1
	str	w0, [x23, 3236]
	str	w2, [x23, 3240]
	mov	w0, 1048576
	mov	w2, 3
	strb	wzr, [x23, 3224]
	str	w1, [x23, 3252]
	str	wzr, [x23, 3256]
	str	wzr, [x23, 3260]
	strb	w3, [x23, 3226]
	str	w2, [x23, 3248]
	str	w0, [x23, 3264]
	b	.L3277
	.p2align 3
.L3276:
	add	x19, x19, 104
	cmp	x19, x20
	beq	.L3305
.L3277:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L3276
	ldr	w0, [x21, 1140]
	mov	x1, x19
	add	x19, x19, 104
	bl	ReleaseNAL
	cmp	x19, x20
	bne	.L3277
.L3305:
	ldr	x19, [x29, 104]
	mov	x0, x19
	bl	InitDPB
	cbz	w22, .L3278
	ldr	w0, [x21, 1140]
	add	x1, x19, 8
	bl	FSP_ClearNotInVoQueue
.L3279:
	ldr	x0, [x29, 104]
	mov	w20, 0
	mov	w26, -1
	mov	w22, 1
	add	x2, x0, 28672
	mov	w25, 17
	mov	w24, 16
	mov	w23, 2
	add	x28, x2, 552
	.p2align 2
.L3282:
	add	x0, x28, 512
	strb	wzr, [x28]
	strb	wzr, [x28, 1]
	add	x27, x28, 176
	strb	wzr, [x28, 2]
	add	x19, x28, 208
	strb	wzr, [x28, 4]
	strb	wzr, [x28, 592]
	strb	w22, [x28, 640]
	strb	w23, [x28, 688]
	str	w20, [x28, 96]
	stp	wzr, w26, [x0, 36]
	stp	wzr, wzr, [x0, 44]
	str	w22, [x28, 564]
	str	w25, [x28, 580]
	str	w24, [x28, 584]
	str	x28, [x28, 632]
	str	x28, [x28, 680]
	str	x28, [x28, 728]
.L3281:
	ldr	x0, [x27]
	mov	x1, x0
	cbz	x0, .L3280
	ldr	w0, [x21, 1140]
	bl	FreeUsdByDec
	str	xzr, [x27]
.L3280:
	add	x27, x27, 8
	cmp	x27, x19
	bne	.L3281
	add	w20, w20, 1
	add	x28, x28, 744
	cmp	w20, 40
	bne	.L3282
	ldr	x0, [x29, 104]
	add	x22, x0, 57344
	add	x19, x22, 1824
	add	x20, x22, 1856
.L3284:
	ldr	x0, [x19]
	mov	x1, x0
	cbz	x0, .L3283
	ldr	w0, [x21, 1140]
	bl	FreeUsdByDec
	str	xzr, [x19]
.L3283:
	add	x19, x19, 8
	cmp	x20, x19
	bne	.L3284
	ldr	w0, [x21, 72]
	mov	w20, 0
	cbz	w0, .L3288
	.p2align 2
.L3295:
	ldr	x0, [x29, 104]
	add	x19, x0, x20, uxtw 3
	add	w20, w20, 1
	add	x19, x19, 61440
	ldr	x0, [x19, 80]
	mov	x1, x0
	cbz	x0, .L3286
	ldr	w0, [x21, 1140]
	bl	FreeUsdByDec
	str	xzr, [x19, 80]
.L3286:
	ldr	w0, [x21, 72]
	cmp	w0, w20
	bhi	.L3295
.L3288:
	ldp	x19, x1, [x29, 96]
	str	wzr, [x21, 52]
	mov	x2, 1640
	add	x0, x1, 24576
	str	wzr, [x21, 72]
	stp	wzr, wzr, [x21, 60]
	str	wzr, [x21, 1064]
	str	wzr, [x21, 1072]
	str	wzr, [x21, 1116]
	str	wzr, [x21, 1124]
	str	wzr, [x21, 1172]
	str	xzr, [x1, 632]
	ldr	x1, .LC832
	strb	wzr, [x0, 1176]
	str	wzr, [x0, 3180]
	strb	wzr, [x19, 3268]
	ldr	x3, [x1, 96]
	mov	w1, 0
	strb	wzr, [x0, 1177]
	add	x0, x19, 1584
	strb	wzr, [x19, 3269]
	blr	x3
	mov	w1, 2
	mov	w0, 1
	strb	w1, [x19, 1584]
	strb	w0, [x19, 1589]
	mov	w0, 256
	strb	wzr, [x22, 1640]
	str	w0, [x22, 2928]
	mov	w0, 0
	strb	wzr, [x22, 2920]
	str	wzr, [x22, 2924]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3278:
	ldr	x0, [x29, 104]
	add	x0, x0, 8
	bl	ResetVoQueue
	ldr	w0, [x21, 1140]
	bl	FSP_ResetInstance
	b	.L3279
	.size	ClearAll, .-ClearAll
	.align	3
.LC831:
	.xword	.LC830
	.align	3
.LC832:
	.xword	vfmw_Osal_Func_Ptr_S
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
	bhi	.L3401
	ldrb	w21, [x19, 3]
	cmp	w21, 1
	beq	.L3310
	cbz	w21, .L3311
	cmp	w21, 2
	bne	.L3402
	ldr	x0, [x19, 552]
	mov	w1, 3
	uxtw	x22, w20
	strb	w1, [x0, 592]
	ldrb	w0, [x19, 1]
	cbz	w0, .L3329
	add	x20, x23, x22, lsl 3
	ldr	x0, [x20, 27896]
	cbz	x0, .L3329
	strb	w21, [x0, 688]
	ldr	x0, [x20, 27896]
	ldr	x1, [x19, 552]
	str	x1, [x0, 728]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x19, 4]
	strb	w1, [x0, 689]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x19, 5]
	strb	w1, [x0, 690]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 592]
	str	w1, [x0, 700]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 596]
	str	w1, [x0, 708]
	ldr	x1, [x19, 552]
	ldr	x0, [x20, 27896]
	ldr	w1, [x1, 720]
	str	w1, [x0, 720]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 604]
	str	w1, [x0, 704]
	ldr	x0, [x20, 27896]
	ldr	w2, [x0, 656]
	ldr	w1, [x0, 704]
	add	w1, w2, w1
	str	w1, [x0, 576]
	str	w1, [x0, 608]
	ldr	x1, [x20, 27896]
	ldrb	w0, [x1]
	cbz	w0, .L3335
	ldrb	w0, [x19, 2]
.L3335:
	strb	w0, [x1]
	ldr	x1, [x20, 27896]
	ldrb	w0, [x1, 1]
	orr	w0, w0, 2
	strb	w0, [x1, 1]
	ldrb	w0, [x19, 7]
	ldr	x1, [x20, 27896]
	cmp	w0, 1
	beq	.L3403
	ldrb	w0, [x1, 3]
.L3337:
	strb	w0, [x1, 3]
	mov	x2, 536
	add	x1, x19, 16
	ldr	x3, [x20, 27896]
	add	x0, x3, 8
	ldp	x4, x28, [x3, 216]
	str	x4, [x29, 104]
	ldp	w26, w25, [x3, 8]
	ldp	w24, w21, [x3, 16]
	ldr	x27, [x3, 232]
	bl	memcpy
	ldr	x4, [x29, 104]
	cmn	x4, #1
	beq	.L3338
	ldr	x0, [x20, 27896]
	str	x4, [x0, 216]
.L3338:
	ldr	x0, [x19, 232]
	ldr	x1, [x20, 27896]
	cmp	x0, x28
	csel	x0, x0, x28, ls
	str	x0, [x1, 224]
	ldr	x0, [x19, 240]
	ldr	x1, [x20, 27896]
	cmp	x0, x27
	csel	x0, x0, x27, ls
	str	x0, [x1, 232]
	ldr	w0, [x19, 16]
	ldr	x1, [x20, 27896]
	cmp	w0, w26
	csel	w0, w0, w26, ls
	str	w0, [x1, 8]
	ldr	w0, [x19, 20]
	ldr	x1, [x20, 27896]
	cmp	w0, w25
	csel	w0, w0, w25, ls
	str	w0, [x1, 12]
	ldr	w0, [x19, 24]
	ldr	x1, [x20, 27896]
	cmp	w0, w24
	csel	w0, w0, w24, ls
	str	w0, [x1, 16]
	ldr	w0, [x19, 28]
	ldr	x1, [x20, 27896]
	cmp	w0, w21
	csel	w0, w0, w21, ls
	str	w0, [x1, 20]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3339
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3339
.L3340:
	ldr	x1, [x20, 27896]
	ldr	w0, [x1, 660]
	ldr	w2, [x1, 708]
	cmp	w0, w2
	csel	w0, w0, w2, cs
	str	w0, [x1, 572]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 580]
	str	w1, [x0, 560]
	ldr	x0, [x20, 27896]
	bl	CombineFldsToFrm
	ldr	x1, [x20, 27896]
	ldr	w0, [x1, 584]
	ldr	w1, [x1, 700]
	add	x0, x0, 4096
	add	x0, x0, 3028
	str	w1, [x23, x0, lsl 2]
	b	.L3328
	.p2align 3
.L3311:
	uxtw	x22, w20
	ldr	x1, [x19, 552]
	mov	w2, 3
	mov	w0, 3
	add	x20, x23, x22, lsl 3
	str	x1, [x20, 27896]
	ldrb	w3, [x19, 2]
	strb	w3, [x1]
	ldr	x1, [x20, 27896]
	strb	w2, [x1, 1]
	ldr	x2, [x19, 552]
	ldr	x1, [x20, 27896]
	ldrb	w2, [x2, 4]
	strb	w2, [x1, 4]
	ldr	x2, [x19, 552]
	ldr	x1, [x20, 27896]
	ldr	w2, [x2, 564]
	str	w2, [x1, 564]
	ldrb	w2, [x19, 4]
	ldr	x1, [x20, 27896]
	cbz	w2, .L3404
.L3313:
	strb	w0, [x1, 2]
	mov	x2, 536
	add	x1, x19, 16
	mov	w21, 3
	ldr	x0, [x20, 27896]
	ldr	w3, [x19, 628]
	str	w3, [x0, 580]
	ldr	x0, [x20, 27896]
	add	x0, x0, 8
	bl	memcpy
	ldr	x0, [x20, 27896]
	mov	w3, 2
	ldr	w1, [x19, 604]
	mov	w6, 1
	str	w1, [x0, 576]
	str	w1, [x0, 608]
	ldr	x0, [x20, 27896]
	ldr	x1, [x19, 552]
	str	x1, [x0, 632]
	str	x1, [x0, 680]
	str	x1, [x0, 728]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 572]
	str	w1, [x0, 556]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 568]
	str	w1, [x0, 548]
	ldr	x0, [x20, 27896]
	strb	wzr, [x0, 592]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x19, 4]
	strb	w1, [x0, 593]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x19, 5]
	strb	w1, [x0, 594]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 596]
	str	w1, [x0, 572]
	str	w1, [x0, 612]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x19, 9]
	str	w1, [x0, 568]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 580]
	str	w1, [x0, 560]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 584]
	str	w1, [x0, 604]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 588]
	str	w1, [x0, 652]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 592]
	str	w1, [x0, 700]
	ldrb	w1, [x19, 7]
	ldr	x0, [x20, 27896]
	cmp	w1, 1
	csel	w21, wzr, w21, ne
	strb	w21, [x0, 3]
	ldr	x1, [x19, 552]
	ldr	x0, [x20, 27896]
	ldr	w1, [x1, 624]
	str	w1, [x0, 624]
	ldr	x0, [x20, 27896]
	ldrb	w5, [x0, 593]
	ldrb	w4, [x0, 594]
	ldr	w2, [x0, 608]
	ldr	x1, [x0, 632]
	strb	w3, [x0, 688]
	ldr	w3, [x0, 612]
	str	w3, [x0, 660]
	strb	w5, [x0, 641]
	strb	w4, [x0, 642]
	strb	w6, [x0, 640]
	strb	w5, [x0, 689]
	strb	w4, [x0, 690]
	str	w2, [x0, 656]
	str	x1, [x0, 680]
	str	w2, [x0, 704]
	mov	w2, 0
	str	w3, [x0, 708]
	str	x1, [x0, 728]
	mov	x0, x23
	ldr	x1, [x19, 552]
	bl	GetAPC
	mov	w3, 1953
	cbnz	w0, .L3399
.L3328:
	add	x1, x23, x22, lsl 3
	add	x0, x23, 61440
	mov	w2, 1
	ldr	x1, [x1, 27896]
	ldr	w0, [x0, 1140]
	ldr	w1, [x1, 544]
	bl	FSP_SetRef
	mov	w0, 0
.L3308:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3402:
	ldr	x2, .LC838
	mov	w3, w21
	mov	w1, 2199
	mov	w0, 0
	bl	dprint_normal
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
.L3310:
	ldr	x0, [x19, 552]
	mov	w1, 3
	uxtw	x22, w20
	strb	w1, [x0, 592]
	ldrb	w0, [x19, 1]
	cbz	w0, .L3316
	add	x20, x23, x22, lsl 3
	ldr	x0, [x20, 27896]
	cbz	x0, .L3316
	strb	w21, [x0, 640]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 596]
	str	w1, [x0, 660]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x19, 4]
	strb	w1, [x0, 641]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x19, 5]
	strb	w1, [x0, 642]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 588]
	str	w1, [x0, 652]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 596]
	str	w1, [x0, 660]
	ldr	x1, [x19, 552]
	ldr	x0, [x20, 27896]
	ldr	w1, [x1, 672]
	str	w1, [x0, 672]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 604]
	str	w1, [x0, 656]
	ldr	x0, [x20, 27896]
	ldr	w2, [x0, 656]
	ldr	w1, [x0, 704]
	add	w1, w2, w1
	str	w1, [x0, 576]
	str	w1, [x0, 608]
	ldr	x1, [x20, 27896]
	ldrb	w0, [x1]
	cbz	w0, .L3321
	ldrb	w0, [x19, 2]
.L3321:
	strb	w0, [x1]
	ldr	x1, [x20, 27896]
	ldrb	w0, [x1, 1]
	orr	w0, w0, 1
	strb	w0, [x1, 1]
	ldrb	w0, [x19, 7]
	ldr	x1, [x20, 27896]
	cmp	w0, 1
	beq	.L3405
	ldrb	w0, [x1, 3]
.L3323:
	strb	w0, [x1, 3]
	mov	x2, 536
	add	x1, x19, 16
	ldr	x3, [x20, 27896]
	add	x0, x3, 8
	ldp	x4, x28, [x3, 216]
	str	x4, [x29, 104]
	ldp	w26, w25, [x3, 8]
	ldp	w24, w21, [x3, 16]
	ldr	x27, [x3, 232]
	bl	memcpy
	ldr	x0, [x19, 224]
	ldr	x4, [x29, 104]
	cmn	x0, #1
	ccmn	x4, #1, 4, eq
	beq	.L3324
	ldr	x0, [x20, 27896]
	str	x4, [x0, 216]
.L3324:
	ldr	x0, [x19, 232]
	ldr	x1, [x20, 27896]
	cmp	x0, x28
	csel	x0, x0, x28, ls
	str	x0, [x1, 224]
	ldr	x0, [x19, 240]
	ldr	x1, [x20, 27896]
	cmp	x0, x27
	csel	x0, x0, x27, ls
	str	x0, [x1, 232]
	ldr	w0, [x19, 16]
	ldr	x1, [x20, 27896]
	cmp	w0, w26
	csel	w0, w0, w26, ls
	str	w0, [x1, 8]
	ldr	w0, [x19, 20]
	ldr	x1, [x20, 27896]
	cmp	w0, w25
	csel	w0, w0, w25, ls
	str	w0, [x1, 12]
	ldr	w0, [x19, 24]
	ldr	x1, [x20, 27896]
	cmp	w0, w24
	csel	w0, w0, w24, ls
	str	w0, [x1, 16]
	ldr	w0, [x19, 28]
	ldr	x1, [x20, 27896]
	cmp	w0, w21
	csel	w0, w0, w21, ls
	str	w0, [x1, 20]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3325
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3325
.L3326:
	ldr	x1, [x20, 27896]
	ldr	w0, [x1, 660]
	ldr	w2, [x1, 708]
	cmp	w0, w2
	csel	w0, w0, w2, cs
	str	w0, [x1, 572]
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 580]
	str	w1, [x0, 560]
	ldr	x0, [x20, 27896]
	bl	CombineFldsToFrm
	ldr	x1, [x20, 27896]
	ldr	w0, [x1, 584]
	ldr	w1, [x1, 652]
	add	x0, x0, 4096
	add	x0, x0, 3012
	str	w1, [x23, x0, lsl 2]
	b	.L3328
	.p2align 3
.L3316:
	add	x20, x23, x22, lsl 3
	ldr	x0, [x19, 552]
	mov	w1, 1
	str	x0, [x20, 27896]
	strb	w1, [x0, 640]
	ldr	x0, [x20, 27896]
	ldr	x2, [x19, 552]
	str	x2, [x0, 680]
	ldr	x0, [x20, 27896]
	ldrb	w2, [x19, 4]
	strb	w2, [x0, 641]
	ldr	x0, [x20, 27896]
	ldrb	w2, [x19, 5]
	strb	w2, [x0, 642]
	ldr	x0, [x20, 27896]
	ldr	w2, [x19, 588]
	str	w2, [x0, 652]
	ldr	x0, [x20, 27896]
	ldr	w2, [x19, 596]
	str	w2, [x0, 660]
	ldr	x2, [x19, 552]
	ldr	x0, [x20, 27896]
	ldr	w2, [x2, 672]
	str	w2, [x0, 672]
	ldr	x0, [x20, 27896]
	ldr	w2, [x19, 604]
	str	w2, [x0, 656]
	ldr	x0, [x20, 27896]
	ldr	w2, [x0, 656]
	str	w2, [x0, 576]
	str	w2, [x0, 608]
	ldr	x0, [x20, 27896]
	ldrb	w2, [x19, 2]
	strb	w2, [x0]
	ldr	x0, [x20, 27896]
	strb	w1, [x0, 1]
	ldr	x1, [x19, 552]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x1, 4]
	strb	w1, [x0, 4]
	ldr	x1, [x19, 552]
	ldr	x0, [x20, 27896]
	ldr	w1, [x1, 564]
	str	w1, [x0, 564]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3318
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3318
.L3319:
	ldr	x0, [x20, 27896]
	mov	x2, 536
	add	x1, x19, 16
	str	wzr, [x0, 568]
	ldr	x0, [x20, 27896]
	add	x0, x0, 8
	bl	memcpy
	ldr	x1, [x20, 27896]
	mov	w2, 1
	ldr	w3, [x19, 628]
	mov	x0, x23
	str	w3, [x1, 580]
	ldr	x1, [x20, 27896]
	ldr	w3, [x19, 568]
	str	w3, [x1, 548]
	ldr	x1, [x20, 27896]
	ldr	w3, [x19, 580]
	str	w3, [x1, 560]
	ldr	x1, [x20, 27896]
	ldr	w3, [x19, 596]
	str	w3, [x1, 572]
	ldrb	w3, [x19, 7]
	ldr	x1, [x20, 27896]
	cmp	w3, w2
	cset	w3, eq
	strb	w3, [x1, 3]
	ldr	x1, [x19, 552]
	bl	GetAPC
	cbz	w0, .L3328
	mov	w3, 2004
.L3399:
	ldr	x2, .LC836
	mov	w4, w0
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	x0, x23
	bl	ClearDPB
	mov	w0, -1
	b	.L3308
	.p2align 3
.L3329:
	add	x20, x23, x22, lsl 3
	ldr	x0, [x19, 552]
	mov	w1, 2
	str	x0, [x20, 27896]
	strb	w1, [x0, 688]
	ldr	x0, [x20, 27896]
	ldr	x2, [x19, 552]
	str	x2, [x0, 728]
	ldr	x0, [x20, 27896]
	ldrb	w2, [x19, 4]
	strb	w2, [x0, 689]
	ldr	x0, [x20, 27896]
	ldrb	w2, [x19, 5]
	strb	w2, [x0, 690]
	ldr	x0, [x20, 27896]
	ldr	w2, [x19, 592]
	str	w2, [x0, 700]
	ldr	x0, [x20, 27896]
	ldr	w2, [x19, 596]
	str	w2, [x0, 708]
	ldr	x2, [x19, 552]
	ldr	x0, [x20, 27896]
	ldr	w2, [x2, 720]
	str	w2, [x0, 720]
	ldr	x0, [x20, 27896]
	ldr	w2, [x19, 604]
	str	w2, [x0, 704]
	ldr	x0, [x20, 27896]
	ldr	w2, [x0, 656]
	str	w2, [x0, 576]
	str	w2, [x0, 608]
	ldr	x0, [x20, 27896]
	ldrb	w2, [x19, 2]
	strb	w2, [x0]
	ldr	x0, [x20, 27896]
	strb	w1, [x0, 1]
	ldr	x1, [x19, 552]
	ldr	x0, [x20, 27896]
	ldrb	w1, [x1, 4]
	strb	w1, [x0, 4]
	ldr	x1, [x19, 552]
	ldr	x0, [x20, 27896]
	ldr	w1, [x1, 564]
	str	w1, [x0, 564]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3331
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3331
.L3332:
	ldr	x0, [x20, 27896]
	mov	x2, 536
	add	x1, x19, 16
	str	wzr, [x0, 568]
	ldr	x0, [x20, 27896]
	add	x0, x0, 8
	bl	memcpy
	ldr	x1, [x20, 27896]
	mov	w2, 2
	ldr	w3, [x19, 628]
	mov	x0, x23
	str	w3, [x1, 580]
	ldr	x1, [x20, 27896]
	ldr	w3, [x19, 568]
	str	w3, [x1, 548]
	ldr	x1, [x20, 27896]
	ldr	w3, [x19, 580]
	str	w3, [x1, 560]
	ldr	x1, [x20, 27896]
	ldr	w3, [x19, 596]
	str	w3, [x1, 572]
	str	w3, [x1, 708]
	ldrb	w3, [x19, 7]
	ldr	x1, [x20, 27896]
	cmp	w3, 1
	csel	w21, w21, wzr, eq
	strb	w21, [x1, 3]
	ldr	x1, [x19, 552]
	bl	GetAPC
	mov	w3, 2125
	cbz	w0, .L3328
	b	.L3399
	.p2align 3
.L3404:
	ldrb	w0, [x19, 5]
	mov	w2, 3
	cmp	w0, wzr
	csel	w0, w0, w2, eq
	b	.L3313
	.p2align 3
.L3318:
	ldr	x0, [x20, 27896]
	mov	w1, 1
	strb	w1, [x0, 2]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3319
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 572]
	str	w1, [x0, 556]
	b	.L3319
	.p2align 3
.L3331:
	ldr	x0, [x20, 27896]
	mov	w1, 2
	strb	w1, [x0, 2]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3332
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 572]
	str	w1, [x0, 556]
	b	.L3332
	.p2align 3
.L3325:
	ldr	x1, [x20, 27896]
	ldrb	w0, [x1, 2]
	orr	w0, w0, 1
	strb	w0, [x1, 2]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3326
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 572]
	str	w1, [x0, 556]
	b	.L3326
	.p2align 3
.L3339:
	ldr	x1, [x20, 27896]
	ldrb	w0, [x1, 2]
	orr	w0, w0, 2
	strb	w0, [x1, 2]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3340
	ldr	x0, [x20, 27896]
	ldr	w1, [x19, 572]
	str	w1, [x0, 556]
	b	.L3340
	.p2align 3
.L3403:
	ldrb	w0, [x1, 3]
	orr	w0, w0, 2
	uxtb	w0, w0
	b	.L3337
	.p2align 3
.L3405:
	ldrb	w0, [x1, 3]
	orr	w0, w0, 1
	uxtb	w0, w0
	b	.L3323
	.p2align 3
.L3401:
	mov	w3, 1914
	ldr	x2, .LC834
	mov	w4, w20
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L3308
	.size	InsertFrmInDPB, .-InsertFrmInDPB
	.align	3
.LC834:
	.xword	.LC833
	.align	3
.LC836:
	.xword	.LC835
	.align	3
.LC838:
	.xword	.LC837
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
	add	x19, x20, 20480
	add	x24, x20, 57344
	bl	_mcount
	str	wzr, [x19, 728]
	ldrb	w1, [x24, 1643]
	cmp	w1, 2
	cset	w0, eq
	str	w0, [x19, 732]
	ldrb	w0, [x24, 1640]
	cbz	w0, .L3603
	add	x21, x20, 61440
	ldr	x0, .LC843
	ldrsw	x2, [x21, 1140]
	ldr	w3, [x21, 1180]
	str	w3, [x21, 1176]
	ldr	x0, [x0, x2, lsl 3]
	add	x0, x0, 217088
	ldrsb	w2, [x0, 3072]
	cmp	w2, 1
	beq	.L3604
.L3409:
	ldr	w0, [x21, 1068]
	cmp	w0, 2
	beq	.L3605
	ldr	x22, [x20]
	ldr	w0, [x22, 12]
	cbnz	w0, .L3416
	ldr	w2, [x21, 1172]
	cmp	w2, 2
	beq	.L3418
	ldrb	w2, [x24, 1642]
	cbnz	w2, .L3418
	sub	w2, w1, #1
	ldr	x25, [x24, 2192]
	uxtb	w2, w2
	cbnz	w1, .L3606
.L3420:
	cmp	w2, 1
	bls	.L3607
.L3581:
	cbz	w1, .L3425
	ldrb	w2, [x25, 1]
	cbnz	w2, .L3425
.L3419:
	cmp	w0, 2
	beq	.L3608
.L3418:
	ldr	w7, [x24, 2216]
	cbz	w7, .L3455
	ldr	w4, [x21, 1132]
	ldr	w3, [x24, 2244]
	cmp	w4, w3
	bcs	.L3456
	ldrb	w0, [x24, 1642]
	cbnz	w0, .L3456
	ldr	w0, [x22, 656]
	cbz	w0, .L3609
.L3456:
	mov	x0, x20
	bl	Marking
	cbnz	w0, .L3610
	mov	x0, x20
	bl	UpdateReflist
	mov	x0, x20
	bl	UpdateLTReflist
	mov	x0, x20
	bl	RemoveUnUsedFrameStore
	cbnz	w0, .L3611
.L3448:
	ldrb	w0, [x24, 1641]
	cmp	w0, 1
	beq	.L3460
	add	x23, x20, 24576
.L3464:
	ldr	w7, [x24, 2216]
	cbz	w7, .L3612
	ldr	w5, [x23, 3712]
	ldr	w6, [x23, 3716]
	ldr	w4, [x23, 3704]
	add	w0, w5, w6
	cmp	w4, w0
	bhi	.L3472
	ldr	x0, [x20]
	ldr	w0, [x0, 12]
	cmp	w0, 3
	beq	.L3473
	ldr	x0, .LC860
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L3473
	mov	w3, 3161
	ldr	x2, .LC862
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x20
	bl	ClearDPB
	mov	w4, 3163
	b	.L3592
	.p2align 3
.L3416:
	ldrb	w2, [x24, 1642]
	cbnz	w2, .L3419
	sub	w2, w1, #1
	ldr	x25, [x24, 2192]
	uxtb	w2, w2
	cbz	w1, .L3420
	b	.L3606
.L3603:
	ldr	x2, .LC840
	mov	w1, 2861
	add	x21, x20, 61440
	bl	dprint_normal
	mov	w4, 2862
.L3592:
	ldr	x2, .LC842
	mov	w3, -1
	mov	w1, w4
	mov	w0, 12
	bl	dprint_normal
	ldr	x20, .LC853
.L3503:
	ldr	x1, [x24, 2192]
	mov	w19, -1
	ldr	w0, [x21, 1140]
	ldr	w1, [x1, 544]
	bl	FSP_ClearLogicFs
	mov	w3, 3257
	mov	w4, w19
	mov	x2, x20
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, [x24, 2192]
	strb	wzr, [x0, 4]
	ldr	x0, [x24, 2192]
	strb	wzr, [x0, 1]
.L3500:
	strb	wzr, [x24, 1640]
	mov	w0, w19
.L3588:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
.L3604:
	ldr	w2, [x0, 3188]
	cmp	w2, 1
	bne	.L3409
	ldr	w0, [x0, 3192]
	cmp	w0, 2
	bne	.L3409
	add	x23, x20, 24576
	ldr	x6, [x20, 27840]
	ldr	x7, [x20, 27872]
	ldr	x8, [x20, 27880]
	ldr	w5, [x23, 3288]
	ldr	w4, [x23, 3292]
	cbz	w5, .L3505
	mov	w0, w5
	mov	w3, w4
	b	.L3411
.L3506:
	mov	w0, w2
.L3411:
	udiv	w2, w3, w0
	msub	w2, w2, w0, w3
	mov	w3, w0
	cbnz	w2, .L3506
.L3410:
	udiv	w5, w5, w0
	sub	x2, x6, x8
	lsl	w3, w2, 6
	sub	w3, w3, w2
	lsl	w3, w3, 1
	sub	w2, w3, w2
	lsl	w2, w2, 3
	udiv	w0, w4, w0
	mul	w2, w2, w5
	udiv	w0, w2, w0
	add	x0, x0, x7
	str	x0, [x24, 1864]
	b	.L3409
.L3606:
	ldrb	w3, [x25, 1]
	cmp	w3, wzr
	ccmp	w2, 1, 0, eq
	bhi	.L3419
	b	.L3420
.L3610:
	ldr	x2, .LC857
	mov	w3, w0
	mov	w1, 3090
	mov	w0, 1
	bl	dprint_normal
	mov	w4, 3091
	b	.L3592
.L3607:
	ldr	w2, [x21, 1172]
	cbnz	w2, .L3422
	mov	w0, 1
	mov	x2, 640
	str	w0, [x21, 1172]
	add	x1, x24, 1640
	add	x0, x24, 2280
	bl	memcpy
	ldr	w0, [x22, 12]
	b	.L3419
.L3425:
	add	x23, x24, 1640
.L3428:
	cbz	w1, .L3429
	ldrb	w0, [x23, 1]
	cmp	w0, 1
	beq	.L3613
.L3429:
	ldr	w0, [x23, 604]
	str	w0, [x25, 576]
.L3430:
	mov	x1, x25
	mov	x0, x20
	bl	GetImagePara
	ldr	w0, [x21, 1140]
	ldr	w1, [x25, 544]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L3614
	ldrb	w0, [x23, 3]
	cbz	w0, .L3432
	ldrb	w0, [x23, 1]
	cmp	w0, 1
	beq	.L3615
.L3432:
	ldr	x0, [x23, 224]
.L3590:
	str	x0, [x22, 208]
.L3433:
	ldr	x0, [x23, 232]
	add	x1, x23, 184
	str	x0, [x22, 216]
	mov	x2, 32
	ldr	x3, .LC848
	ldr	x0, [x23, 240]
	str	x0, [x22, 224]
	add	x0, x22, 168
	ldr	w4, [x23, 16]
	str	w4, [x22]
	ldr	w4, [x23, 20]
	str	w4, [x22, 4]
	ldr	w4, [x23, 24]
	str	w4, [x22, 8]
	ldr	w4, [x23, 28]
	str	w4, [x22, 12]
	ldr	w4, [x25, 576]
	str	w4, [x22, 96]
	ldr	w4, [x23, 292]
	str	w4, [x22, 276]
	ldr	x3, [x3, 104]
	ldr	w4, [x23, 288]
	str	w4, [x22, 272]
	ldr	x4, [x23, 296]
	str	x4, [x22, 280]
	ldr	w4, [x23, 544]
	str	w4, [x22, 528]
	ldr	w4, [x23, 548]
	str	w4, [x22, 532]
	blr	x3
	ldr	w1, [x22, 96]
	cbz	w1, .L3439
	ldrb	w0, [x22, 156]
	and	w0, w0, 3
	cbz	w0, .L3616
.L3437:
	ldr	x0, [x20]
	ldr	w2, [x0, 4]
	cmp	w2, w1
	bcs	.L3439
	ldr	w0, [x0, 656]
	cmp	w0, 1
	beq	.L3439
	ldr	x0, .LC851
	ldr	x4, [x0]
	cbz	x4, .L3446
	ldr	w0, [x21, 1140]
	mov	w3, 8
	stp	w1, w2, [x29, 88]
	add	x2, x29, 88
	mov	w1, 23
	blr	x4
.L3446:
	ldr	w0, [x21, 1140]
	mov	w2, 0
	ldr	w1, [x25, 544]
	bl	FSP_SetDisplay
	mov	w4, 3023
	b	.L3592
.L3422:
	cmp	w2, 1
	bne	.L3581
	cmp	w1, 1
	add	x23, x24, 1640
	ldr	x25, [x24, 2832]
	beq	.L3617
	cmp	w1, 2
	bne	.L3428
	ldr	w0, [x24, 2232]
	str	w0, [x25, 700]
	ldrb	w1, [x23, 3]
	b	.L3428
.L3616:
	mov	w3, 2998
	ldr	x2, .LC850
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC851
	ldr	x4, [x0]
	cbz	x4, .L3438
	ldr	w0, [x21, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 40
	blr	x4
.L3438:
	ldr	w1, [x22, 96]
	cbnz	w1, .L3437
.L3439:
	ldr	w0, [x21, 1140]
	mov	w2, 1
	ldr	w1, [x25, 544]
	bl	FSP_SetDisplay
	ldr	w0, [x21, 1140]
	mov	x4, x22
	add	x3, x20, 8
	mov	x2, x20
	mov	w1, 0
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L3618
	ldr	w0, [x21, 1140]
	mov	w2, 0
	ldr	w1, [x25, 544]
	bl	FSP_SetDisplay
.L3441:
	ldr	x0, [x20]
	ldr	w0, [x0, 632]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L3619
	str	wzr, [x22, 16]
.L3443:
	ldr	w0, [x21, 1188]
	ldr	w1, [x21, 1172]
	add	w0, w0, 2
	str	w0, [x21, 1188]
	cmp	w1, 2
	beq	.L3445
	mov	w0, 1
	str	w0, [x25, 736]
.L3445:
	mov	w0, 2
	str	w0, [x21, 1172]
	ldr	x22, [x20]
	ldr	w0, [x22, 12]
	cmp	w0, 2
	bne	.L3418
.L3608:
	ldr	w0, [x24, 2216]
	cbz	w0, .L3448
	ldrb	w0, [x24, 1646]
	cmp	w0, 5
	beq	.L3449
.L3453:
	mov	x0, x20
	add	x19, x20, 24576
	bl	SimpleSlideDPB
	ldr	w1, [x19, 3708]
	add	x2, x24, 1640
	mov	x0, x20
	bl	InsertFrmInDPB
	cbz	w0, .L3620
	ldr	x20, .LC853
	mov	w3, 3058
	mov	w4, w0
	mov	w1, w3
	mov	x2, x20
	mov	w0, 0
	bl	dprint_normal
	mov	w4, 3059
.L3593:
	ldr	x2, .LC842
	mov	w3, -1
	mov	w1, w4
	mov	w0, 12
	bl	dprint_normal
	b	.L3503
.L3455:
	ldrb	w0, [x24, 1641]
	cmp	w0, 1
	beq	.L3460
	add	x23, x20, 24576
	ldr	w4, [x23, 3704]
.L3472:
	mov	w6, -1
	mov	w8, w6
	.p2align 2
.L3491:
	ldr	w1, [x23, 3708]
	cmp	w1, w4
	bcc	.L3621
	cmp	w1, w4
	mov	w19, w1
	bls	.L3479
	mov	w19, w4
	str	w4, [x23, 3708]
.L3479:
	cbz	w19, .L3512
	add	x1, x23, 3320
	mov	w5, 2147483647
	mov	w22, 0
	mov	w0, 0
	.p2align 2
.L3482:
	ldr	x3, [x1]
	add	x1, x1, 8
	ldr	w2, [x3, 560]
	cmp	w2, w5
	bge	.L3481
	ldrb	w3, [x3, 4]
	cmp	w3, wzr
	csel	w22, w22, w0, eq
	csel	w5, w5, w2, eq
.L3481:
	add	w0, w0, 1
	cmp	w0, w19
	bne	.L3482
.L3480:
	cbnz	w7, .L3483
	ldr	w0, [x24, 2220]
	cmp	w0, w5
	blt	.L3484
.L3483:
	cbz	w4, .L3484
	cmp	w8, w22
	ccmp	w6, w19, 0, eq
	beq	.L3622
	mov	w1, w22
	mov	x0, x20
	bl	OutputFrmFromDPB
	cmn	w0, #1
	mov	w25, w0
	beq	.L3490
	mov	w6, w19
	mov	w8, w22
	ldr	w4, [x23, 3704]
	ldr	w7, [x24, 2216]
	b	.L3491
.L3484:
	ldr	w0, [x21, 1068]
	cmp	w0, 2
	beq	.L3623
.L3486:
	mov	x0, x20
	bl	DirectOutput
	cmn	w0, #1
	mov	w19, w0
	beq	.L3624
	cmp	w0, 1
	beq	.L3625
.L3488:
	mov	w4, 3192
.L3591:
.L3415:
	ldr	x2, .LC842
	mov	w3, w19
	mov	w1, w4
	mov	w0, 12
	bl	dprint_normal
	cmn	w19, #1
	bne	.L3500
	ldr	x20, .LC853
	b	.L3503
	.p2align 3
.L3512:
	mov	w5, 2147483647
	mov	w22, 0
	b	.L3480
.L3460:
	ldr	x0, [x24, 2952]
	ldr	x3, [x24, 2192]
	cmp	x3, x0
	ccmp	x0, xzr, 4, eq
	beq	.L3626
	mov	x0, x20
	bl	DirectOutput
	cmn	w0, #1
	mov	w19, w0
	beq	.L3627
	cmp	w0, 1
	beq	.L3628
	mov	w4, 3122
	b	.L3591
	.p2align 3
.L3605:
	ldr	x2, .LC845
	mov	w1, 2881
	mov	w0, 3
	bl	dprint_normal
	mov	x0, x20
	bl	DirectOutput
	mov	w19, w0
	ldr	w1, [x21, 48]
	ldr	w0, [x24, 2268]
	cmp	w0, w1
	beq	.L3413
	uxtw	x0, w0
	add	x0, x0, 12288
	add	x20, x20, x0, lsl 2
	str	wzr, [x20, 12264]
	str	w1, [x24, 2268]
.L3413:
	cmp	w19, 1
	beq	.L3629
	mov	w4, 2896
	b	.L3591
.L3621:
	cbz	w7, .L3493
	ldrb	w0, [x24, 1644]
	cbnz	w0, .L3493
	ldr	w0, [x23, 3712]
	cbz	w0, .L3493
	mov	w0, 0
	b	.L3498
.L3495:
	ldr	w1, [x23, 3712]
	cmp	w1, w0
	bls	.L3630
.L3498:
	add	x1, x20, x0, uxtw 3
	ldr	w3, [x24, 2208]
	add	w0, w0, 1
	ldr	x2, [x1, 28024]
	ldr	w4, [x2, 548]
	cmp	w4, w3
	bne	.L3495
	strb	wzr, [x2, 2]
	ldr	x2, [x1, 28024]
	ldrb	w3, [x2, 4]
	cmp	w3, 1
	beq	.L3631
.L3496:
	ldr	w1, [x2, 580]
	ldr	w3, [x21, 48]
	cmp	w1, w3
	uxtw	x1, w1
	add	x1, x1, 12288
	beq	.L3495
	add	x1, x20, x1, lsl 2
	str	wzr, [x1, 12264]
	str	w3, [x2, 580]
	b	.L3495
.L3630:
	ldr	w1, [x23, 3708]
.L3493:
	add	x2, x24, 1640
	mov	x0, x20
	bl	InsertFrmInDPB
	ldr	w1, [x23, 3708]
	str	w1, [x24, 2944]
	cbz	w0, .L3499
	ldr	x20, .LC853
	mov	w3, 3243
	mov	w4, w0
	mov	w1, w3
	mov	x2, x20
	mov	w0, 1
	bl	dprint_normal
	mov	w4, 3244
	b	.L3593
.L3490:
	ldr	x20, .LC853
	mov	w3, 3210
	mov	w4, w0
	mov	w1, w3
	mov	x2, x20
	mov	w0, 1
	bl	dprint_normal
	mov	w4, 3211
	ldr	x2, .LC842
	mov	w3, w25
	mov	w1, w4
	mov	w0, 12
	bl	dprint_normal
	b	.L3503
.L3618:
	ldr	w0, [x21, 1196]
	add	w0, w0, 1
	str	w0, [x21, 1196]
	b	.L3441
.L3620:
	ldr	w1, [x19, 3708]
	mov	x0, x20
	add	w1, w1, 1
	str	w1, [x19, 3708]
	bl	UpdateReflist
	mov	x0, x20
	bl	UpdateLTReflist
	mov	w4, 3067
.L3594:
	ldr	x2, .LC842
	mov	w3, 0
	mov	w1, w4
	mov	w0, 12
	mov	w19, 0
	bl	dprint_normal
	b	.L3500
.L3499:
	add	w1, w1, 1
	mov	x0, x20
	str	w1, [x23, 3708]
	mov	w19, 0
	bl	UpdateReflist
	mov	x0, x20
	bl	UpdateLTReflist
	b	.L3500
.L3625:
	ldr	x0, [x24, 2192]
	strb	wzr, [x0, 4]
	ldr	x0, [x24, 2192]
	strb	wzr, [x0, 1]
	b	.L3488
.L3473:
	ldr	w5, [x23, 3708]
	cmp	w5, w4
	bls	.L3475
	mov	w5, w4
	str	w4, [x23, 3708]
.L3475:
	cbz	w5, .L3509
	add	x2, x23, 3320
	mov	w1, 0
	mov	w0, 0
	mov	w4, 2147483647
	.p2align 2
.L3478:
	ldr	x3, [x2]
	add	x2, x2, 8
	ldr	w3, [x3, 560]
	cmp	w3, w4
	bge	.L3477
	mov	w1, w0
	mov	w4, w3
.L3477:
	add	w0, w0, 1
	cmp	w0, w5
	bne	.L3478
.L3476:
	mov	x0, x20
	bl	RemoveFrameStoreOutDPB
	mov	x0, x20
	bl	UpdateReflist
	mov	x0, x20
	bl	UpdateLTReflist
	ldr	w4, [x23, 3704]
	ldr	w7, [x24, 2216]
	b	.L3472
.L3629:
	ldr	x0, [x24, 2192]
	mov	w4, 2896
	strb	wzr, [x0, 4]
	ldr	x0, [x24, 2192]
	strb	wzr, [x0, 1]
	b	.L3591
.L3609:
	ldr	x2, .LC855
	mov	w1, 3076
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC851
	ldr	x4, [x0]
	cbz	x4, .L3457
	ldr	w1, [x21, 1132]
	mov	w3, 8
	ldr	w2, [x24, 2244]
	ldr	w0, [x21, 1140]
	stp	w2, w1, [x29, 88]
	add	x2, x29, 88
	mov	w1, 23
	blr	x4
.L3457:
	mov	x0, x20
	mov	w22, -1
	bl	ClearAllSlice
	ldr	w0, [x20, 14948]
	mov	w1, 2
	str	w0, [x19, 3232]
	add	x0, x19, 3072
	strb	w1, [x19, 3225]
	mov	w1, 32
	strb	wzr, [x19, 3224]
	strb	w1, [x19, 3226]
	mov	w1, 1048576
	stp	w22, wzr, [x0, 180]
	stp	wzr, w1, [x0, 188]
	mov	w0, 23352
	movk	w0, 0x1, lsl 16
	str	w0, [x19, 3240]
	mov	w0, 7
	str	w0, [x19, 3236]
	mov	w0, 3
	str	w0, [x19, 3248]
	mov	x0, x20
	bl	ClearDPB
	mov	w4, 3082
	ldr	x2, .LC842
	mov	w3, w22
	mov	w1, w4
	mov	w0, 12
	bl	dprint_normal
	ldr	x20, .LC853
	b	.L3503
.L3615:
	ldr	x0, [x23, 224]
	cmn	x0, #1
	bne	.L3433
	ldr	x0, [x24, 2504]
	cmn	x0, #1
	bne	.L3590
	b	.L3433
	.p2align 3
.L3628:
	ldr	x0, [x24, 2192]
	mov	w4, 3122
	strb	wzr, [x0, 4]
	ldr	x0, [x24, 2192]
	strb	wzr, [x0, 1]
	b	.L3591
.L3622:
	ldr	x3, .LC863
	mov	w4, w22
	ldr	x2, .LC865
	mov	w1, 3197
	add	x3, x3, 344
	mov	w0, 1
	bl	dprint_normal
	mov	w4, 3198
	b	.L3592
.L3619:
	mov	x1, x22
	mov	x0, x20
	bl	SetFrmRepeatCount.part.2
	b	.L3443
.L3623:
	ldrb	w0, [x24, 1643]
	cbz	w0, .L3486
	ldr	x0, [x24, 2192]
	str	x0, [x24, 2960]
	b	.L3486
.L3612:
	ldr	w4, [x23, 3704]
	b	.L3472
.L3611:
	ldr	x2, .LC859
	mov	w1, 3099
	mov	w0, 20
	bl	dprint_normal
	b	.L3448
.L3626:
	add	x23, x20, 24576
	ldr	w4, [x23, 3708]
	cbz	w4, .L3464
	ldr	x0, [x20, 27896]
	cmp	x3, x0
	beq	.L3632
	add	x0, x23, 3328
	mov	w1, 0
	.p2align 2
.L3469:
	add	w1, w1, 1
	cmp	w1, w4
	beq	.L3464
	ldr	x2, [x0], 8
	cmp	x3, x2
	bne	.L3469
.L3465:
	add	x2, x24, 1640
	mov	x0, x20
	bl	InsertFrmInDPB
	cmn	w0, #1
	mov	w19, w0
	beq	.L3633
	mov	x0, x20
	bl	UpdateReflist
	mov	x0, x20
	bl	UpdateLTReflist
	mov	w4, 3142
	b	.L3594
.L3449:
	mov	x0, x20
	bl	IDRMemMarking
	cbz	w0, .L3453
	mov	w0, -1
	b	.L3588
	.p2align 3
.L3613:
	mov	w0, 3
	strb	w0, [x25, 1]
	ldr	w1, [x25, 576]
	ldr	w0, [x23, 604]
	add	w0, w1, w0
	str	w0, [x25, 576]
	b	.L3430
.L3631:
	str	w3, [x2, 564]
	ldr	x2, [x1, 28024]
	strb	wzr, [x2, 4]
	ldr	x2, [x1, 28024]
	b	.L3496
.L3624:
	mov	w3, 3183
	ldr	x2, .LC853
	mov	w4, w0
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	b	.L3488
.L3633:
	ldr	x20, .LC853
	mov	w3, 3135
	mov	w4, w0
	mov	w1, w3
	mov	x2, x20
	mov	w0, 1
	bl	dprint_normal
	mov	w4, 3136
	ldr	x2, .LC842
	mov	w3, w19
	mov	w1, w4
	mov	w0, 12
	bl	dprint_normal
	b	.L3503
.L3614:
	mov	w3, 2960
	ldr	x2, .LC847
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w4, 2961
	b	.L3592
.L3509:
	mov	w1, 0
	b	.L3476
.L3617:
	ldr	w0, [x24, 2228]
	str	w0, [x25, 652]
	ldrb	w1, [x23, 3]
	b	.L3428
.L3505:
	mov	w0, w4
	b	.L3410
.L3632:
	mov	w1, 0
	b	.L3465
.L3627:
	mov	w3, 3112
	ldr	x2, .LC853
	mov	w4, w0
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w4, 3122
	b	.L3591
	.size	StorePicInDPB, .-StorePicInDPB
	.align	3
.LC840:
	.xword	.LC839
	.align	3
.LC842:
	.xword	.LC841
	.align	3
.LC843:
	.xword	s_pstVfmwChan
	.align	3
.LC845:
	.xword	.LC844
	.align	3
.LC847:
	.xword	.LC846
	.align	3
.LC848:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC850:
	.xword	.LC849
	.align	3
.LC851:
	.xword	g_EventReportFunc
	.align	3
.LC853:
	.xword	.LC852
	.align	3
.LC855:
	.xword	.LC854
	.align	3
.LC857:
	.xword	.LC856
	.align	3
.LC859:
	.xword	.LC858
	.align	3
.LC860:
	.xword	g_AppleAirplayMirrorinigFlag
	.align	3
.LC862:
	.xword	.LC861
	.align	3
.LC863:
	.xword	.LANCHOR1
	.align	3
.LC865:
	.xword	.LC864
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
	mov	x27, x0
	mov	x0, x30
	add	x20, x27, 20480
	mov	w23, w1
	bl	_mcount
	ldrb	w1, [x20, 1585]
	cbz	w1, .L3635
	ldrb	w0, [x20, 1586]
	cbz	w0, .L3707
	ldr	w2, [x20, 1592]
	mov	w0, 2208
	ldr	x3, [x27, 14968]
	add	x21, x27, 61440
	ldr	x4, [x27, 14960]
	umull	x0, w2, w0
	ldr	w22, [x21, 1068]
	add	x0, x3, x0
	str	x4, [x29, 104]
	cmp	w22, 2
	ldr	w0, [x0, 28]
	str	w0, [x29, 100]
	beq	.L3702
	add	x26, x27, 57344
	mov	w22, 2
	ldrb	w0, [x26, 2920]
	strb	wzr, [x26, 1641]
	cmp	w0, 1
	bne	.L3638
	b	.L3663
	.p2align 3
.L3635:
	ldr	w1, [x20, 1592]
	mov	w0, 2208
	ldr	x2, [x27, 14968]
	add	x21, x27, 61440
	ldr	x3, [x27, 14960]
	umull	x0, w1, w0
	ldr	w1, [x21, 1068]
	add	x0, x2, x0
	str	x3, [x29, 104]
	cmp	w1, 2
	ldr	w0, [x0, 28]
	str	w0, [x29, 100]
	beq	.L3708
	add	x26, x27, 57344
	mov	w22, 0
.L3703:
	strb	wzr, [x26, 1641]
.L3638:
	strb	wzr, [x26, 1640]
	ldr	w4, [x21, 44]
	cbz	w4, .L3653
	add	x19, x27, 28672
	mov	x3, 0
	add	x19, x19, 552
	.p2align 2
.L3652:
	ldrb	w0, [x19, 1]
	cbnz	w0, .L3647
	cbz	x19, .L3648
	add	x0, x27, 24576
	ldr	w2, [x0, 3708]
	cbz	w2, .L3648
	ldr	x0, [x27, 27896]
	cmp	x0, x19
	beq	.L3647
	sub	w2, w2, #1
	mov	x0, x27
	add	x2, x27, x2, lsl 3
	b	.L3650
	.p2align 3
.L3651:
	ldr	x1, [x0, 27896]
	cmp	x1, x19
	beq	.L3647
.L3650:
	cmp	x0, x2
	add	x0, x0, 8
	bne	.L3651
.L3648:
	lsl	x0, x3, 2
	str	x19, [x26, 2192]
	sub	x3, x0, x3
	mov	w24, 1
	lsl	x0, x3, 5
	strb	w24, [x26, 1640]
	sub	x3, x0, x3
	add	x28, x26, 1656
	mov	w5, 101
	mov	x2, 536
	add	x3, x27, x3, lsl 3
	mov	x0, x28
	add	x25, x3, 28672
	add	x1, x25, 560
	str	wzr, [x25, 1128]
	str	w5, [x26, 2244]
	bl	memcpy
	str	wzr, [x26, 1752]
	strb	wzr, [x25, 555]
	str	wzr, [x19, 564]
	ldr	x0, [x26, 2192]
	strb	wzr, [x0, 2]
	ldr	x0, [x26, 2192]
	strb	w24, [x0, 4]
	ldr	x0, [x26, 2192]
	str	wzr, [x0, 736]
	ldrb	w19, [x26, 1640]
	cmp	w19, 1
	bne	.L3653
	cmp	w23, wzr
	mov	w1, 3
	ldr	w0, [x21, 1140]
	csel	w1, w1, wzr, ne
	bl	FSP_NewLogicFs
	mov	w25, w0
	mov	w1, w0
	ldr	w0, [x21, 1140]
	bl	FSP_GetLogicFs
	mov	x23, x0
	cmp	w25, wzr
	ccmp	x0, xzr, 4, ge
	beq	.L3655
	ldr	w1, [x29, 100]
	mov	w0, 4000
	ldr	x19, .LC868
	mov	x2, 536
	umull	x0, w1, w0
	ldr	x1, [x29, 104]
	ldr	x4, [x19, 104]
	add	x24, x1, x0
	add	x1, x23, 56
	ldrb	w0, [x24, 22]
	strb	w0, [x23, 344]
	ldr	w0, [x24, 3324]
	strb	w0, [x23, 345]
	ldr	w0, [x24, 3332]
	strb	w0, [x23, 346]
	ldr	w0, [x24, 3328]
	str	w0, [x23, 348]
	ldr	x0, [x26, 2192]
	add	x0, x0, 8
	blr	x4
	ldr	x1, [x26, 2192]
	mov	x2, 536
	ldr	x4, [x19, 104]
	mov	x0, x28
	add	x1, x1, 8
	blr	x4
	ldr	x0, [x26, 2192]
	str	w25, [x0, 544]
	ldr	x0, [x23, 40]
	cbz	x0, .L3669
	ldr	w0, [x0, 4]
.L3656:
	str	w0, [x26, 2268]
	mov	w3, w25
	ldr	x4, [x26, 2192]
	ldrb	w1, [x20, 1585]
.L3645:
	cmp	w1, wzr
	uxtb	w0, w22
	mov	w2, 3
	strb	w0, [x26, 1643]
	csel	w1, w1, w2, eq
	strb	w1, [x4, 592]
	ldrb	w1, [x26, 1641]
	cmp	w1, 1
	beq	.L3709
	strb	w0, [x26, 2920]
	ldr	w0, [x20, 1600]
	str	w0, [x26, 2928]
	ldr	w0, [x20, 1612]
	str	w0, [x26, 2924]
	ldr	w0, [x21, 1180]
	str	w0, [x26, 2936]
	str	w3, [x26, 2940]
	cbnz	w22, .L3710
	strb	wzr, [x26, 2921]
	mov	w0, 0
.L3696:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3707:
	ldr	w2, [x20, 1592]
	mov	w0, 2208
	ldr	x3, [x27, 14968]
	add	x21, x27, 61440
	ldr	x4, [x27, 14960]
	umull	x0, w2, w0
	ldr	w2, [x21, 1068]
	add	x0, x3, x0
	str	x4, [x29, 104]
	cmp	w2, 2
	ldr	w0, [x0, 28]
	str	w0, [x29, 100]
	beq	.L3711
	add	x26, x27, 57344
	mov	w22, 1
	ldrb	w0, [x26, 2920]
	strb	wzr, [x26, 1641]
	cmp	w0, 2
	bne	.L3638
.L3663:
	ldr	w0, [x20, 1600]
	ldr	w2, [x26, 2928]
	cmp	w2, w0
	bne	.L3638
	ldr	w0, [x20, 1612]
	cbnz	w0, .L3639
	ldr	w0, [x26, 2924]
	cbnz	w0, .L3638
.L3640:
	ldr	w2, [x21, 1176]
	ldr	w0, [x21, 1180]
	sub	w0, w0, w2
	cmp	w0, 2
	bhi	.L3638
	ldr	x4, [x26, 2192]
	mov	w0, 1
	strb	w0, [x26, 1641]
	cbz	x4, .L3703
	cmp	w22, 2
	beq	.L3712
	cmp	w22, 1
	mov	w3, 0
	bne	.L3645
	ldrb	w0, [x4, 1]
	cmp	w0, 2
	bne	.L3703
	b	.L3645
	.p2align 3
.L3647:
	add	w3, w3, 1
	add	x19, x19, 744
	cmp	w3, w4
	bne	.L3652
.L3653:
	ldr	x2, .LC867
	mov	w1, 5021
	mov	w0, 0
	bl	dprint_normal
	mov	w1, 1
	mov	x0, x27
	bl	ClearAll
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3710:
	mov	w1, 1
	strb	w1, [x26, 2921]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3708:
	mov	w22, 0
.L3702:
	add	x26, x27, 57344
	b	.L3703
.L3711:
	mov	w22, 1
	add	x26, x27, 57344
	b	.L3703
.L3709:
	strb	wzr, [x26, 2920]
	mov	w0, 0
	ldr	w1, [x20, 1600]
	str	w1, [x26, 2928]
	ldr	w1, [x20, 1612]
	str	w1, [x26, 2924]
	ldr	w1, [x21, 1180]
	str	w1, [x26, 2936]
	strb	wzr, [x26, 2921]
	str	w3, [x26, 2940]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3669:
	mov	w0, 0
	b	.L3656
.L3639:
	ldr	w0, [x26, 2924]
	cbz	w0, .L3638
	b	.L3640
.L3655:
	ldr	x3, [x26, 2192]
	mov	w1, 5047
	strb	wzr, [x26, 1640]
	mov	w0, 0
	ldr	x2, .LC870
	strb	wzr, [x3, 4]
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x27
	bl	ClearAll
	mov	w0, -1
	b	.L3696
.L3712:
	ldrb	w0, [x4, 1]
	mov	w3, 0
	cmp	w0, 1
	bne	.L3703
	b	.L3645
	.size	AllocFrameStore, .-AllocFrameStore
	.align	3
.LC867:
	.xword	.LC866
	.align	3
.LC868:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC870:
	.xword	.LC869
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
	add	x27, x19, 57344
	ldr	w1, [x25, 3180]
	ldr	w2, [x20, 1600]
	ldrb	w0, [x0, 2705]
	ldr	w6, [x20, 1596]
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
	str	x0, [x27, 2200]
	mov	w0, 2
	csel	w0, wzr, w0, ne
	str	w0, [x29, 116]
	ldr	w0, [x25, 3708]
	str	w1, [x29, 108]
	cbz	w0, .L3737
	mov	w0, 1
	add	w21, w21, 4
	add	w3, w6, 1
	lsl	w21, w0, w21
	ldr	x2, .LC874
	mov	w1, 5117
	udiv	w6, w3, w21
	mov	w0, 3
	str	wzr, [x20, 752]
	str	wzr, [x20, 756]
	msub	w26, w6, w21, w3
	bl	dprint_normal
	ldr	x2, .LC876
	mov	w1, 5118
	ldr	w3, [x29, 120]
	mov	w4, w26
	mov	w0, 3
	bl	dprint_normal
	ldr	w1, [x25, 3704]
	ldr	w0, [x25, 3708]
	cmp	w0, w1
	bhi	.L3738
.L3717:
	cbz	w0, .L3728
	sub	w3, w0, #1
	mov	w22, 0
	add	x3, x3, 3488
	add	x0, x25, 3320
	add	x3, x19, x3, lsl 3
	.p2align 2
.L3720:
	ldr	x2, [x0]
	add	x0, x0, 8
	ldr	w1, [x2, 560]
	cmp	w22, w1
	bge	.L3719
	ldrb	w2, [x2, 4]
	cmp	w2, wzr
	csel	w22, w22, w1, eq
.L3719:
	cmp	x0, x3
	bne	.L3720
.L3718:
	ldr	w0, [x29, 120]
	mov	w23, 1
	str	wzr, [x29, 124]
	mov	w24, w23
	cmp	w0, w26
	bne	.L3733
	b	.L3725
	.p2align 3
.L3723:
	mov	x1, 0
	mov	x0, x19
	strb	wzr, [x27, 1644]
	bl	StorePicInDPB
	add	w1, w26, 1
	cbnz	w0, .L3739
.L3724:
	sdiv	w0, w1, w21
	str	w26, [x20, 1596]
	msub	w26, w0, w21, w1
	ldr	w0, [x29, 120]
	cmp	w0, w26
	beq	.L3725
	ldr	w0, [x25, 3708]
	ldr	w1, [x29, 124]
	cmp	w1, w0
	bhi	.L3725
.L3733:
	mov	w1, 1
	mov	x0, x19
	bl	AllocFrameStore
	cbnz	w0, .L3740
	ldr	x2, .LC880
	mov	w1, 5136
	mov	w0, 3
	bl	dprint_normal
	strb	w24, [x27, 1646]
	ldr	x0, [x27, 2192]
	str	w26, [x0, 548]
	str	w26, [x27, 2208]
	ldr	x0, [x27, 2192]
	str	w26, [x0, 600]
	ldr	w0, [x29, 116]
	str	w0, [x27, 2216]
	ldr	x0, [x27, 2192]
	str	wzr, [x0, 596]
	ldr	x0, [x27, 2192]
	str	w23, [x0, 564]
	ldr	x0, [x27, 2192]
	strb	wzr, [x0, 4]
	ldr	x0, [x27, 2192]
	strb	w23, [x0]
	strb	w24, [x27, 1642]
	ldr	x0, [x27, 2200]
	strb	wzr, [x0, 3]
	ldr	w0, [x28, 792]
	cbz	w0, .L3723
	mov	x0, x19
	str	w26, [x20, 768]
	bl	DecPOC
	ldr	w0, [x20, 748]
	str	w0, [x27, 2220]
	ldr	w0, [x20, 744]
	str	w0, [x27, 2224]
	ldr	w0, [x20, 736]
	str	w0, [x27, 2228]
	cmp	w0, w22
	ldr	w0, [x20, 740]
	str	w0, [x27, 2232]
	bls	.L3723
	cmp	w0, w22
	ldr	w0, [x29, 124]
	mov	x1, 0
	strb	wzr, [x27, 1644]
	csinc	w0, w0, w0, ls
	str	w0, [x29, 124]
	mov	x0, x19
	bl	StorePicInDPB
	add	w1, w26, 1
	cbz	w0, .L3724
.L3739:
	ldr	w1, [x29, 112]
	mov	w3, 5177
	str	w1, [x20, 752]
	mov	w4, w0
	ldr	w1, [x29, 108]
	mov	w0, 0
	str	w1, [x20, 756]
	mov	w1, w3
	ldrb	w6, [x29, 104]
	ldr	x5, [x27, 2200]
	ldr	x2, .LC882
	strb	w6, [x5, 3]
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
.L3738:
	mov	w0, w1
	str	w1, [x25, 3708]
	b	.L3717
	.p2align 3
.L3737:
	ldr	x2, .LC872
	mov	w1, 5110
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L3725:
	ldr	w0, [x29, 112]
	str	w0, [x20, 752]
	ldr	w0, [x29, 108]
	str	w0, [x20, 756]
	mov	w0, 0
	ldrb	w2, [x29, 104]
	ldr	x1, [x27, 2200]
	strb	w2, [x1, 3]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L3740:
	ldr	w0, [x29, 112]
	mov	w1, 5132
	str	w0, [x20, 752]
	ldr	w0, [x29, 108]
	str	w0, [x20, 756]
	mov	w0, 0
	ldrb	w4, [x29, 104]
	ldr	x3, [x27, 2200]
	ldr	x2, .LC878
	strb	w4, [x3, 3]
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
.L3728:
	mov	w22, 0
	b	.L3718
	.size	DecGap, .-DecGap
	.align	3
.LC872:
	.xword	.LC871
	.align	3
.LC874:
	.xword	.LC873
	.align	3
.LC876:
	.xword	.LC875
	.align	3
.LC878:
	.xword	.LC877
	.align	3
.LC880:
	.xword	.LC879
	.align	3
.LC882:
	.xword	.LC881
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
	mov	w22, 2208
	bl	_mcount
	ldr	x23, .LC883
	mov	x2, 62680
	mov	w1, 0
	mov	x0, x20
	ldr	w19, [x20, 608]
	ldr	x3, [x23, 96]
	blr	x3
	str	w19, [x20, 608]
	add	x0, x20, 8
	add	x19, x20, 61440
	bl	ResetVoQueue
	str	x21, [x20]
	str	xzr, [x20, 616]
	str	wzr, [x20, 624]
	ldr	w0, [x21, 716]
	str	w0, [x20, 14944]
	ldr	w0, [x21, 720]
	str	w0, [x20, 14948]
	ldr	w0, [x21, 708]
	str	w0, [x20, 14940]
	ldr	w0, [x21, 600]
	bl	MEM_Phy2Vir
	ldr	x1, [x20]
	mov	w2, 4000
	ldr	w4, [x20, 14944]
	ldr	w5, [x20, 14948]
	ldrsw	x3, [x1, 596]
	smull	x2, w4, w2
	add	x3, x0, x3
	str	x3, [x20, 14960]
	add	x1, x3, x2
	str	x1, [x20, 14968]
	cmp	x1, xzr
	smaddl	x0, w5, w22, x1
	ccmp	x3, xzr, 4, ne
	str	x0, [x19, 1056]
	ccmp	x0, xzr, 4, ne
	beq	.L3749
	ldr	w6, [x21, 636]
	cmp	w6, wzr
	ccmp	x3, xzr, 4, eq
	ccmp	x1, xzr, 4, ne
	beq	.L3744
	ldr	x4, [x23, 96]
	mov	w1, 0
	mov	x0, x3
	blr	x4
	ldr	w2, [x20, 14948]
	mov	w1, 0
	ldr	x0, [x20, 14968]
	ldr	x3, [x23, 96]
	smull	x2, w2, w22
	blr	x3
	ldr	w4, [x20, 14944]
	ldr	w5, [x20, 14948]
	ldr	x0, [x19, 1056]
.L3744:
	add	x2, x20, 16384
	ldr	x6, [x23, 96]
	mov	w1, 0
	str	w5, [x2, 2616]
	str	w4, [x20, 15012]
	ldrsw	x3, [x20, 14940]
	lsl	x2, x3, 7
	sub	x2, x2, x3
	lsl	x2, x2, 5
	blr	x6
	str	wzr, [x19, 52]
	mov	w0, 17
	mov	w1, 40
	stp	w1, w0, [x19, 44]
	add	x0, x19, 1024
	add	x1, x19, 1024
	stp	wzr, wzr, [x19, 60]
	stp	wzr, wzr, [x19, 68]
	stp	xzr, xzr, [x19, 80]
	stp	xzr, xzr, [x19, 96]
	str	wzr, [x19, 1076]
	stp	wzr, wzr, [x0, 60]
	stp	wzr, wzr, [x0, 68]
	stp	wzr, wzr, [x1, 76]
	stp	wzr, wzr, [x1, 84]
	str	wzr, [x19, 1172]
	mov	x0, x20
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x19, 1140]
	beq	.L3750
	mov	w1, 0
	mov	x0, x20
	bl	ClearAll
	str	wzr, [x19, 1168]
	mov	w0, 1
	ldr	x1, [x20]
	ldr	w1, [x1, 652]
	str	w1, [x19, 1144]
.L3743:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L3749:
	ldr	x3, .LC884
	mov	w4, 10704
	ldr	x2, .LC886
	mov	w1, w4
	add	x3, x3, 360
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -20
	b	.L3743
	.p2align 3
.L3750:
	ldr	x2, .LC888
	mov	w1, 10748
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -20
	b	.L3743
	.size	H264DEC_Init, .-H264DEC_Init
	.align	3
.LC883:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC884:
	.xword	.LANCHOR1
	.align	3
.LC886:
	.xword	.LC885
	.align	3
.LC888:
	.xword	.LC887
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
	str	x27, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 20480
	add	x23, x20, 61440
	bl	_mcount
	mov	w22, 4000
	mov	w1, 2208
	ldr	x3, [x20, 14968]
	ldr	w0, [x21, 1592]
	ldr	w5, [x23, 1152]
	ldr	x2, [x20, 14960]
	umull	x0, w0, w1
	cmp	w5, 1
	add	x25, x3, x0
	ldr	w1, [x25, 28]
	umull	x1, w1, w22
	add	x22, x2, x1
	beq	.L3875
	add	x19, x20, 57344
	ldrb	w0, [x19, 1640]
	cbz	w0, .L3755
	ldr	x0, [x19, 2192]
	cbz	x0, .L3756
	ldrb	w1, [x0, 1]
	cbz	w1, .L3876
	strb	wzr, [x19, 1640]
.L3755:
	add	x1, x29, 108
	mov	x0, x20
	bl	GetReRangeFlag
	mov	w24, w0
	ldr	w1, [x20, 15012]
	ldr	w0, [x22, 36]
	cmp	w1, w0
	beq	.L3877
.L3758:
	ldr	x1, .LC892
	add	x0, x20, 12288
	strb	wzr, [x22, 24]
	mov	x2, 4000
	add	x0, x0, 2688
	ldr	x3, [x1, 112]
	mov	x1, x22
	blr	x3
.L3759:
	ldr	w0, [x29, 108]
	cbnz	w0, .L3760
	ldr	x0, [x20]
	ldr	w0, [x0, 888]
	cmp	w0, 1
	beq	.L3760
	add	x24, x20, 16384
.L3761:
	ldr	w1, [x24, 2616]
	ldr	w0, [x25, 24]
	cmp	w1, w0
	bne	.L3770
	ldrb	w0, [x25, 20]
	cbnz	w0, .L3770
.L3771:
	ldr	w0, [x21, 728]
	ldr	w3, [x24, 788]
	cbz	w0, .L3772
	str	wzr, [x21, 1596]
	str	wzr, [x19, 2928]
.L3772:
	ldr	w0, [x23, 1068]
	cmp	w0, 2
	beq	.L3773
	ldr	x2, [x20]
	ldr	w0, [x2, 12]
	sub	w0, w0, #2
	cmp	w0, 1
	bls	.L3773
	ldr	w1, [x21, 1596]
	ldr	w4, [x21, 1600]
	cmp	w4, w1
	beq	.L3774
	mov	w0, 1
	add	w3, w3, 4
	lsl	w3, w0, w3
	add	w5, w1, w0
	udiv	w0, w5, w3
	msub	w0, w0, w3, w5
	cmp	w4, w0
	beq	.L3816
	ldr	w0, [x2, 628]
	cbnz	w0, .L3775
	ldr	w0, [x2, 672]
	cmp	w0, 1
	beq	.L3878
.L3776:
	cmp	w4, w1
	bhi	.L3879
	sub	w0, w4, w1
	ldr	w1, [x24, 1864]
	add	w0, w0, w3
	cmp	w1, w0
	bcs	.L3775
	ldrb	w0, [x21, 1584]
	cmp	w0, 2
	beq	.L3785
.L3790:
	ldr	w0, [x23, 1136]
	cbnz	w0, .L3775
	mov	x0, x20
	bl	ClearAllSlice
	ldr	x0, .LC900
	mov	w1, 23352
	ldr	w2, [x20, 14948]
	movk	w1, 0x1, lsl 16
	mov	w6, 2
	mov	w5, 7
	ldrb	w0, [x0]
	mov	w4, 32
	mov	w3, 3
	str	w2, [x21, 3232]
	str	w1, [x21, 3240]
	mov	w2, -1
	mov	w1, 1048576
	strb	wzr, [x21, 3224]
	strb	w6, [x21, 3225]
	strb	w4, [x21, 3226]
	str	w5, [x21, 3236]
	str	w3, [x21, 3248]
	str	wzr, [x21, 3256]
	str	wzr, [x21, 3260]
	str	w2, [x21, 3252]
	str	w1, [x21, 3264]
	cbz	w0, .L3880
.L3791:
	ldr	w0, [x21, 1596]
	mov	w3, 5403
	ldr	w4, [x21, 1600]
.L3872:
	ldr	x2, .LC902
	sub	w4, w4, w0
	ldr	w5, [x24, 1864]
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L3851
	.p2align 3
.L3760:
	ldr	w0, [x23, 1100]
	add	w0, w0, 1
	str	w0, [x23, 1100]
	cbnz	w24, .L3762
	ldr	x0, [x20]
	ldr	w0, [x0, 888]
	cmp	w0, 1
	beq	.L3762
	mov	x0, x20
	bl	FlushDPB
	cbnz	w0, .L3881
	cbz	x20, .L3814
.L3882:
	mov	x0, x20
	bl	ClearAllSlice
	mov	x0, x20
	bl	InitDPB.part.17
	cbnz	w0, .L3765
	cbnz	w24, .L3767
	ldr	x0, [x20]
	add	x24, x20, 16384
	ldr	w0, [x0, 888]
	cmp	w0, 1
	bne	.L3761
.L3767:
	add	x24, x20, 16384
	add	x2, x20, 12288
	mov	w1, 2
	ldr	w0, [x24, 1844]
	ldrb	w26, [x2, 2706]
	add	w0, w0, 1
	ldr	w27, [x24, 1840]
	sub	w26, w1, w26
	lsl	w0, w0, 4
	add	w27, w27, 1
	mul	w26, w0, w26
	lsl	w27, w27, 4
	mov	x0, x20
	mov	w2, w26
	mov	w1, w27
	bl	H264_ArrangeVahbMem
	cmp	w0, 1
	beq	.L3769
	ldr	x1, [x20]
	mov	w0, -2
	ldr	w1, [x1, 888]
	cmp	w1, 1
	beq	.L3851
	ldr	x2, .LC899
	mov	w1, 5298
	mov	w0, 0
	str	wzr, [x20, 14932]
	str	wzr, [x20, 14936]
	bl	dprint_normal
	mov	w1, 0
	mov	x0, x20
	bl	ClearAll
	mov	w0, -1
	b	.L3851
	.p2align 3
.L3877:
	ldrb	w0, [x22, 24]
	cbz	w0, .L3759
	b	.L3758
	.p2align 3
.L3762:
	ldr	x2, .LC894
	mov	w1, 5265
	mov	w0, 20
	bl	dprint_normal
	cbnz	x20, .L3882
.L3814:
	mov	w0, -1
.L3765:
	ldr	x2, .LC897
	mov	w3, 5282
.L3871:
	mov	w4, w0
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L3851
	.p2align 3
.L3770:
	ldr	x0, .LC892
	mov	x2, 2208
	strb	wzr, [x25, 20]
	mov	x1, x25
	ldr	x3, [x0, 112]
	add	x0, x24, 2592
	blr	x3
	b	.L3771
	.p2align 3
.L3816:
	mov	w1, w4
	.p2align 2
.L3774:
	ldr	w0, [x21, 1612]
	cbz	w0, .L3793
	str	w1, [x21, 1596]
.L3793:
	mov	x0, x20
	str	w1, [x21, 768]
	bl	DecPOC
	mov	w1, 0
	mov	x0, x20
	bl	AllocFrameStore
	cbnz	w0, .L3883
	strb	wzr, [x19, 1647]
	mov	w0, 1
	strb	w0, [x19, 1640]
	mov	w1, -1
	mov	w4, 1
	ldrb	w0, [x21, 1587]
	strb	w0, [x19, 1646]
	ldr	w5, [x21, 1600]
	str	w5, [x19, 2208]
	ldr	w3, [x21, 1612]
	str	w3, [x19, 2216]
	ldr	w0, [x21, 748]
	str	w0, [x19, 2220]
	ldr	w0, [x21, 744]
	str	w0, [x19, 2224]
	ldr	w0, [x21, 736]
	str	w0, [x19, 2228]
	ldr	w0, [x21, 740]
	str	w0, [x19, 2232]
	strb	wzr, [x19, 1642]
	strb	wzr, [x19, 1645]
	strb	wzr, [x19, 1644]
	str	w1, [x19, 2264]
	ldrb	w2, [x21, 1585]
	cbz	w2, .L3795
	strb	w4, [x21, 1585]
	mov	w2, w4
	mov	w4, 2
.L3795:
	add	x25, x20, 12288
	ldr	w6, [x24, 1844]
	mov	w1, 2
	ldrb	w0, [x25, 2706]
	sub	w0, w1, w0
	madd	w0, w6, w0, w0
	str	w0, [x19, 2256]
	udiv	w0, w0, w4
	str	w0, [x19, 2252]
	ldr	w1, [x24, 1840]
	add	w1, w1, 1
	str	w1, [x19, 2248]
	mul	w0, w0, w1
	str	w0, [x19, 2260]
	ldrb	w0, [x24, 2592]
	strb	w0, [x19, 1648]
	cbnz	w2, .L3818
	ldrb	w0, [x25, 2707]
	mov	w1, 0
	cbnz	w0, .L3884
.L3796:
	strb	w0, [x19, 1649]
	str	w1, [x23, 1048]
	cbz	w3, .L3797
	str	w5, [x21, 1596]
.L3797:
	add	x26, x20, 24576
	ldr	x2, .LC908
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
	str	x0, [x19, 2200]
	ldr	x0, [x20]
	ldr	x1, [x0, 32]
	str	x1, [x19, 1864]
	ldr	x1, [x0, 48]
	str	x1, [x19, 1872]
	ldr	x1, [x0, 64]
	str	x1, [x19, 1880]
	ldr	w1, [x0, 80]
	str	w1, [x19, 1656]
	ldr	w1, [x0, 84]
	str	w1, [x19, 1660]
	ldr	w1, [x0, 88]
	str	w1, [x19, 1664]
	ldr	w1, [x0, 104]
	str	w1, [x19, 1668]
	ldrb	w1, [x0, 28]
	strb	w1, [x19, 2180]
	ldr	w1, [x22, 44]
	str	w1, [x19, 2048]
	ldr	w1, [x22, 48]
	str	w1, [x19, 2052]
	mov	x1, -1
	str	x1, [x0, 32]
	mov	w1, 5482
	mov	w0, 24
	ldr	w3, [x23, 1140]
	ldr	x4, [x19, 1864]
	bl	dprint_normal
	ldr	x2, .LC910
	mov	w1, 5483
	ldr	w3, [x23, 1140]
	mov	w0, 24
	ldr	x4, [x19, 1872]
	bl	dprint_normal
	ldr	w2, [x20, 15016]
	ldr	w0, [x24, 792]
	cmp	w2, 1
	ldr	w1, [x24, 1908]
	cset	w2, ne
	cmp	w0, 1
	and	w1, w1, 7
	beq	.L3821
	ldr	w0, [x21, 1632]
	cbz	w0, .L3885
.L3821:
	mov	w0, 0
.L3798:
	ldrb	w3, [x25, 2706]
	cmp	w3, 1
	bne	.L3886
.L3811:
	ldrb	w0, [x26, 3220]
	sub	w0, w0, #3
	uxtb	w0, w0
	cmp	w0, 1
	cset	w3, ls
.L3799:
	ldrb	w0, [x19, 1812]
	mov	w4, 2
	and	w0, w0, 252
	bfi	w0, w2, 2, 3
	strb	w0, [x19, 1812]
	ldr	w2, [x24, 1912]
	bfi	w0, w2, 5, 3
	ldrb	w2, [x19, 1813]
	strb	w0, [x19, 1812]
	bfi	w2, w3, 0, 2
	and	w0, w2, -13
	bfi	w0, w4, 4, 2
	strb	w0, [x19, 1813]
	ldr	w0, [x19, 1812]
	bfi	w0, w1, 14, 3
	str	w0, [x19, 1812]
	ldrb	w0, [x21, 1584]
	cmp	w0, w4
	beq	.L3800
	ldr	w2, [x23, 1224]
	ldr	w0, [x23, 1228]
.L3801:
	str	w2, [x19, 2184]
	str	w0, [x19, 2188]
	add	x0, x19, 1656
	str	wzr, [x23, 1232]
	str	wzr, [x23, 1236]
	bl	SetAspectRatio
	ldrb	w2, [x19, 1643]
	ldr	w1, [x23, 1100]
	cmp	w2, wzr
	ldr	x0, [x19, 2192]
	str	w1, [x19, 1756]
	cset	w1, ne
	str	w1, [x19, 1676]
	cbz	x0, .L3887
	ldr	w1, [x19, 1812]
	str	w1, [x0, 164]
	ldr	x0, [x19, 2192]
	ldr	w1, [x19, 1676]
	str	w1, [x0, 28]
	ldr	x0, [x19, 2192]
	ldr	w1, [x19, 1716]
	str	w1, [x0, 68]
	ldr	x0, [x19, 2192]
	ldr	w1, [x19, 1712]
	str	w1, [x0, 64]
	ldr	x0, [x19, 2192]
	ldr	w1, [x19, 1688]
	str	w1, [x0, 40]
	ldr	x0, [x19, 2192]
	ldr	w1, [x19, 1692]
	str	w1, [x0, 44]
	ldr	x0, [x19, 2192]
	ldr	w1, [x19, 1696]
	str	w1, [x0, 48]
	ldr	x0, [x19, 2192]
	ldr	w1, [x19, 1700]
	str	w1, [x0, 52]
	ldr	x1, [x19, 2192]
	ldr	w0, [x22, 3284]
	str	w0, [x1, 56]
	str	w0, [x19, 1704]
	ldr	x1, [x19, 2192]
	ldr	w0, [x22, 3288]
	str	w0, [x1, 60]
	str	w0, [x19, 1708]
	ldr	w2, [x19, 1676]
	ldr	x1, [x19, 2192]
	cmp	w2, wzr
	ldr	w0, [x23, 1140]
	cset	w2, ne
	ldr	w1, [x1, 544]
	bl	FSP_SetStoreType
	cbnz	w0, .L3888
.L3803:
	ldr	w1, [x23, 72]
	add	x2, x19, 1824
	add	x5, x19, 1856
.L3807:
	ldr	x0, [x2]
	cbz	x0, .L3889
.L3804:
	add	x2, x2, 8
	cmp	x5, x2
	bne	.L3807
	cbz	w1, .L3809
	cmp	w1, wzr
	ble	.L3809
	.p2align 2
.L3810:
	add	x22, x20, x1, sxtw 3
	sub	w21, w1, #1
	add	x22, x22, 61440
	ldr	w0, [x23, 1140]
	ldr	x1, [x22, 72]
	bl	FreeUsdByDec
	str	xzr, [x22, 72]
	mov	w1, w21
	cbnz	w21, .L3810
.L3809:
	str	wzr, [x23, 72]
	mov	x0, x20
	str	wzr, [x19, 2236]
	bl	CalcPicNum
	mov	w0, 0
.L3851:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3778:
	cbnz	w4, .L3780
	sub	w3, w3, #1
.L3781:
	str	w3, [x21, 1596]
	mov	x0, x20
	bl	FlushDPB
	mov	w3, 5356
	ldr	x2, .LC895
	cbnz	w0, .L3871
	ldrb	w0, [x21, 1584]
	cmp	w0, 2
	bne	.L3783
	.p2align 2
.L3775:
	mov	x0, x20
	bl	DecGap
	cbnz	w0, .L3890
.L3773:
	ldr	w1, [x21, 1600]
	b	.L3774
	.p2align 3
.L3889:
	cbz	w1, .L3804
	ldr	x0, [x23, 80]
	subs	w1, w1, #1
	str	x0, [x2]
	beq	.L3805
	add	x4, x23, 80
	mov	w3, 0
	.p2align 2
.L3806:
	add	w0, w3, 1
	mov	x3, x0
	cmp	w0, w1
	add	x0, x0, 4096
	add	x0, x0, 3594
	ldr	x0, [x20, x0, lsl 3]
	str	x0, [x4], 8
	bne	.L3806
.L3805:
	uxtw	x0, w1
	add	x0, x0, 4096
	add	x0, x0, 3594
	str	xzr, [x20, x0, lsl 3]
	str	w1, [x23, 72]
	b	.L3804
	.p2align 3
.L3875:
	ldrb	w2, [x22, 18]
	mov	w4, 2
	ldr	w7, [x22, 3252]
	add	x19, x20, 57344
	sub	w1, w4, w2
	ldrb	w6, [x21, 1585]
	madd	w1, w7, w1, w1
	add	w2, w6, 1
	udiv	w1, w1, w2
	str	w1, [x19, 2252]
	ldrb	w2, [x22, 18]
	ldr	w7, [x22, 3252]
	sub	w2, w4, w2
	madd	w2, w7, w2, w2
	str	w2, [x19, 2256]
	ldr	w2, [x22, 3248]
	add	w2, w2, 1
	str	w2, [x19, 2248]
	mul	w1, w1, w2
	str	w1, [x19, 2260]
	ldrb	w0, [x3, x0]
	strb	w0, [x19, 1648]
	cbnz	w6, .L3812
	ldrb	w0, [x22, 19]
	cbnz	w0, .L3891
	mov	w5, 0
	b	.L3753
	.p2align 3
.L3818:
	mov	w1, 0
	mov	w0, 0
	b	.L3796
	.p2align 3
.L3885:
	ldrb	w0, [x21, 1585]
	cmp	w0, 1
	beq	.L3798
	ldrb	w0, [x25, 2707]
	mov	w3, 1
	cbnz	w0, .L3799
	b	.L3811
	.p2align 3
.L3812:
	mov	w5, 0
	mov	w0, 0
.L3753:
	strb	w0, [x19, 1649]
	mov	w0, 0
	str	w5, [x23, 1048]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3884:
	mov	w1, 1
	mov	w0, w1
	b	.L3796
	.p2align 3
.L3876:
	ldr	w1, [x0, 544]
	ldr	w0, [x23, 1140]
	bl	FSP_ClearLogicFs
	ldr	x0, [x19, 2192]
	strb	wzr, [x0, 1]
	ldr	x0, [x19, 2192]
	strb	wzr, [x0, 4]
	strb	wzr, [x19, 1640]
	b	.L3755
	.p2align 3
.L3769:
	lsr	w27, w27, 4
	lsr	w26, w26, 4
	str	w27, [x20, 14932]
	str	w26, [x20, 14936]
	b	.L3761
	.p2align 3
.L3888:
	ldr	x3, .LC889
	mov	w1, 5571
	ldr	x2, .LC914
	mov	w0, 1
	add	x3, x3, 384
	bl	dprint_normal
	b	.L3803
	.p2align 3
.L3800:
	ldr	w2, [x23, 1232]
	ldr	w0, [x23, 1236]
	str	w2, [x23, 1224]
	str	w0, [x23, 1228]
	b	.L3801
	.p2align 3
.L3886:
	cmp	w0, wzr
	cset	w3, ne
	b	.L3799
	.p2align 3
.L3891:
	mov	w0, w5
	b	.L3753
	.p2align 3
.L3879:
	ldr	w0, [x24, 1864]
	sub	w1, w4, w1
	cmp	w0, w1
	bcs	.L3775
	ldrb	w0, [x21, 1584]
	cmp	w0, 2
	beq	.L3778
.L3783:
	ldr	w0, [x23, 1136]
	cbnz	w0, .L3775
	mov	x0, x20
	bl	ClearAllSlice
	ldr	x0, .LC900
	mov	w1, 23352
	ldr	w2, [x20, 14948]
	movk	w1, 0x1, lsl 16
	mov	w6, 2
	mov	w5, 7
	ldrb	w0, [x0]
	mov	w4, 32
	mov	w3, 3
	str	w2, [x21, 3232]
	str	w1, [x21, 3240]
	mov	w2, -1
	mov	w1, 1048576
	strb	wzr, [x21, 3224]
	strb	w6, [x21, 3225]
	strb	w4, [x21, 3226]
	str	w5, [x21, 3236]
	str	w3, [x21, 3248]
	str	wzr, [x21, 3256]
	str	wzr, [x21, 3260]
	str	w2, [x21, 3252]
	str	w1, [x21, 3264]
	cbz	w0, .L3892
.L3784:
	mov	w3, 5371
	ldr	w0, [x21, 1596]
	ldr	w4, [x21, 1600]
	b	.L3872
.L3881:
	mov	w3, 5273
	ldr	x2, .LC895
	b	.L3871
.L3890:
	mov	w3, 5414
	ldr	x2, .LC904
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L3851
	.p2align 3
.L3756:
	ldr	x3, .LC889
	mov	w4, 5243
	ldr	x2, .LC891
	mov	w1, w4
	add	x3, x3, 376
	mov	w0, 20
	bl	dprint_normal
	strb	wzr, [x19, 1640]
	b	.L3755
.L3878:
	ldr	w0, [x2, 668]
	cbnz	w0, .L3776
	ldr	w0, [x2, 676]
	cbnz	w0, .L3776
	ldr	w0, [x2, 632]
	add	w0, w0, 1024
	cmp	w0, 2048
	bhi	.L3775
	b	.L3776
.L3883:
	mov	w3, 5432
	ldr	x2, .LC906
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L3851
.L3785:
	cbnz	w4, .L3787
	sub	w3, w3, #1
.L3788:
	str	w3, [x21, 1596]
	mov	x0, x20
	bl	FlushDPB
	mov	w3, 5388
	ldr	x2, .LC895
	cbnz	w0, .L3871
	ldrb	w0, [x21, 1584]
	cmp	w0, 2
	beq	.L3775
	b	.L3790
	.p2align 3
.L3887:
	ldr	x3, .LC889
	mov	w4, 5550
	ldr	x2, .LC912
	mov	w1, w4
	add	x3, x3, 384
	mov	w0, 20
	bl	dprint_normal
	mov	w0, -1
	b	.L3851
.L3780:
	sub	w3, w4, #1
	b	.L3781
.L3787:
	sub	w3, w4, #1
	b	.L3788
.L3880:
	mov	x0, x20
	bl	ClearDPB
	b	.L3791
.L3892:
	mov	x0, x20
	bl	ClearDPB
	b	.L3784
	.size	InitPic, .-InitPic
	.align	3
.LC889:
	.xword	.LANCHOR1
	.align	3
.LC891:
	.xword	.LC890
	.align	3
.LC892:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC894:
	.xword	.LC893
	.align	3
.LC895:
	.xword	.LC789
	.align	3
.LC897:
	.xword	.LC896
	.align	3
.LC899:
	.xword	.LC898
	.align	3
.LC900:
	.xword	g_AppleAirplayMirrorinigFlag
	.align	3
.LC902:
	.xword	.LC901
	.align	3
.LC904:
	.xword	.LC903
	.align	3
.LC906:
	.xword	.LC905
	.align	3
.LC908:
	.xword	.LC907
	.align	3
.LC910:
	.xword	.LC909
	.align	3
.LC912:
	.xword	.LC911
	.align	3
.LC914:
	.xword	.LC913
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
	add	x20, x19, 61440
	add	x21, x19, 20480
	bl	_mcount
	ldr	x2, .LC915
	mov	w1, 7427
	ldr	w3, [x20, 1084]
	mov	w0, 20
	sub	w3, w3, #1
	bl	dprint_normal
	ldr	x0, [x19, 632]
	ldr	x2, .LC916
	ldrb	w1, [x0, 2]
	strb	w1, [x21, 1587]
	ldr	w0, [x0, 20]
	str	w0, [x21, 1612]
	ldrsw	x0, [x20, 1140]
	ldr	x0, [x2, x0, lsl 3]
	add	x0, x0, 217088
	ldrsb	w2, [x0, 3072]
	cmp	w2, 1
	beq	.L3953
.L3894:
	mov	x0, x19
	bl	ProcessSliceHeaderFirstPart
	cbnz	w0, .L3954
	mov	x0, x19
	bl	ProcessSliceHeaderSecondPart
	cbnz	w0, .L3899
	ldr	w10, [x20, 1064]
	mov	w3, 0
	add	x22, x19, 57344
	cbz	w10, .L3901
	sub	w8, w10, #1
	add	x22, x19, 57344
	add	x8, x8, 4096
	add	x2, x22, 2984
	add	x8, x8, 3446
	mov	w9, 0
	mov	w3, 0
	mov	x0, 0
	add	x8, x19, x8, lsl 3
	.p2align 2
.L3909:
	ldr	x1, [x2]
	ldr	x5, [x1, 40]
	cbz	x5, .L3925
	ldr	x4, [x1, 72]
	ldr	w6, [x1, 48]
	cbz	x4, .L3926
.L3961:
	ldr	w1, [x1, 80]
.L3904:
	cbz	x0, .L3905
	cmp	x5, x0
	mov	w7, w6
	bls	.L3906
	sub	x0, x5, x0
	sub	w0, w0, w9
	add	w7, w0, w6
.L3906:
	add	w3, w1, w3
	add	w3, w7, w3
.L3907:
	cbz	x4, .L3928
	mov	x0, x4
	mov	w9, w1
.L3908:
	add	x2, x2, 8
	cmp	x8, x2
	bne	.L3909
.L3901:
	str	w3, [x20, 1124]
	ldr	w0, [x22, 2248]
	ldr	w4, [x22, 2252]
	mul	w0, w0, w4
	cmp	w0, 1620
	bgt	.L3955
	lsl	w1, w0, 2
	mov	w2, 32769
	sub	w0, w1, w0
	mov	w4, 16384
	lsl	w0, w0, 8
	cmp	w0, w2
	asr	w0, w0, 1
	csel	w0, w0, w4, gt
.L3911:
	ldr	w4, [x19, 14940]
	cmp	w4, w10
	bls	.L3912
	cmp	w0, w3
	bcc	.L3956
	ldrb	w0, [x21, 1589]
	cbz	w0, .L3916
	ldrb	w0, [x21, 1587]
	cmp	w0, 5
	ldr	w0, [x20, 1104]
	beq	.L3957
.L3918:
	add	w0, w0, 1
	str	wzr, [x20, 1120]
	str	w0, [x20, 1104]
	ldrb	w0, [x22, 1643]
	cbnz	w0, .L3919
	ldr	w0, [x20, 1108]
	add	w0, w0, 1
	str	w0, [x20, 1108]
.L3920:
	mov	x0, x19
	bl	InitPic
	cmn	w0, #2
	beq	.L3898
	cbnz	w0, .L3958
	mov	x0, x19
	bl	WritePicMsg
.L3916:
	mov	x0, x19
	bl	PicTypeStatistic
	ldr	w0, [x20, 1152]
	cbnz	w0, .L3922
	mov	x0, x19
	bl	DecList
	cbnz	w0, .L3959
	mov	x0, x19
	bl	IsRefListWrong
	cbnz	w0, .L3960
	mov	x0, x19
	bl	ExitSlice
.L3922:
	mov	x0, x19
	bl	CalcStreamBits
	mov	x0, x19
	bl	WriteSliceMsg
	ldr	w1, [x20, 1120]
	mov	w2, 1
	mov	w0, 0
	str	w2, [x20, 52]
	add	w1, w1, w2
	str	w1, [x20, 1120]
.L3898:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3928:
	mov	x0, x5
	mov	w9, w6
	b	.L3908
	.p2align 3
.L3905:
	add	w3, w6, w3
	add	w3, w3, w1
	b	.L3907
	.p2align 3
.L3925:
	ldr	x4, [x1, 72]
	mov	w6, 0
	cbnz	x4, .L3961
	.p2align 2
.L3926:
	mov	w1, 0
	b	.L3904
	.p2align 3
.L3955:
	lsl	w0, w0, 8
	b	.L3911
	.p2align 3
.L3919:
	ldr	w0, [x20, 1112]
	add	w0, w0, 1
	str	w0, [x20, 1112]
	b	.L3920
	.p2align 3
.L3953:
	ldr	w2, [x0, 3188]
	cmp	w2, 1
	bne	.L3894
	ldr	w0, [x0, 3192]
	cmp	w0, 2
	ccmp	w1, 5, 0, eq
	bne	.L3894
	ldr	x0, [x19]
	ldr	x0, [x0, 32]
	cmn	x0, #1
	beq	.L3894
	ldr	x1, [x19, 27840]
	str	x0, [x19, 27872]
	str	x1, [x19, 27880]
	b	.L3894
	.p2align 3
.L3957:
	str	w0, [x20, 1116]
	b	.L3918
.L3954:
	ldr	x2, .LC917
	mov	w1, 7448
.L3951:
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC918
	ldr	x4, [x0]
	cbz	x4, .L3949
	add	x2, x29, 64
	ldr	w0, [x20, 1140]
	mov	w5, -1
	mov	w3, 4
	mov	w1, 9
	str	w5, [x2, -8]!
	blr	x4
.L3949:
	mov	x0, x19
	bl	ClearCurrSlice
	mov	w0, -1
	b	.L3898
.L3956:
	ldr	x2, .LC922
	mov	w4, w0
	mov	w1, 7511
	mov	w0, 1
	bl	dprint_normal
.L3915:
	mov	x0, x19
	bl	ClearAllSlice
	mov	w3, 32
	ldr	w7, [x19, 14948]
	strb	w3, [x21, 3226]
	add	x3, x21, 3072
	mov	w6, 23352
	strb	wzr, [x21, 3224]
	str	w7, [x21, 3232]
	movk	w6, 0x1, lsl 16
	mov	w5, 2
	str	w6, [x21, 3240]
	strb	w5, [x21, 3225]
	mov	w4, 7
	str	w4, [x21, 3236]
	mov	w0, -1
	mov	w2, 3
	mov	w1, 1048576
	stp	w2, w0, [x3, 176]
	stp	wzr, wzr, [x3, 184]
	str	w1, [x21, 3264]
	b	.L3898
.L3912:
	ldr	x2, .LC920
	mov	w3, w10
	mov	w1, 7506
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC918
	ldr	x4, [x0]
	cbz	x4, .L3915
	ldr	w1, [x19, 14940]
	mov	w3, 8
	ldr	w2, [x20, 1064]
	ldr	w0, [x20, 1140]
	stp	w2, w1, [x29, 56]
	add	x2, x29, 56
	mov	w1, 27
	blr	x4
	b	.L3915
.L3958:
	ldr	x2, .LC924
	mov	w1, 7544
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L3898
.L3899:
	ldr	x2, .LC917
	mov	w1, 7458
	b	.L3951
.L3959:
	ldr	x2, .LC926
	mov	w3, w0
	mov	w1, 7561
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L3898
.L3960:
	ldr	x2, .LC928
	mov	w1, 7569
	ldr	w3, [x22, 2220]
	mov	w0, 1
	bl	dprint_normal
	b	.L3949
	.size	H264_DecSlice, .-H264_DecSlice
	.align	3
.LC915:
	.xword	.LC759
	.align	3
.LC916:
	.xword	s_pstVfmwChan
	.align	3
.LC917:
	.xword	.LC761
	.align	3
.LC918:
	.xword	g_EventReportFunc
	.align	3
.LC920:
	.xword	.LC919
	.align	3
.LC922:
	.xword	.LC921
	.align	3
.LC924:
	.xword	.LC923
	.align	3
.LC926:
	.xword	.LC925
	.align	3
.LC928:
	.xword	.LC927
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
	add	x19, x20, 61440
	bl	_mcount
	ldr	x3, [x20, 632]
	ldr	w0, [x3, 12]
	cbz	w0, .L3967
	ldr	w2, [x19, 1124]
	mov	w0, 0
	.p2align 2
.L3966:
	uxtw	x1, w0
	add	w0, w0, 1
	add	x1, x3, x1, lsl 5
	ldr	w1, [x1, 48]
	add	w2, w2, w1
	str	w2, [x19, 1124]
	ldr	w1, [x3, 12]
	cmp	w1, w0
	bhi	.L3966
.L3967:
	strb	wzr, [x3]
	ldr	x0, .LC929
	ldrsw	x1, [x19, 1140]
	ldr	x0, [x0, x1, lsl 3]
	add	x0, x0, 217088
	ldrsb	w1, [x0, 3072]
	cmp	w1, 1
	beq	.L4113
.L3965:
	add	x23, x20, 12288
	mov	w1, 32
	add	x0, x23, 2600
	bl	BsGet
	mov	w22, w0
	ldr	x1, [x20, 632]
	ldr	w0, [x1, 8]
	add	w0, w0, 32
	str	w0, [x1, 8]
.L3968:
	ldr	x3, [x20, 632]
	and	w0, w22, 31
	ubfx	x1, x22, 5, 2
	ubfx	x4, x22, 7, 1
	ldr	x2, .LC931
	strb	w0, [x3, 2]
	ldr	x0, [x20, 632]
	str	w1, [x0, 20]
	mov	w1, 10013
	mov	w0, 20
	ldr	x3, [x20, 632]
	str	w4, [x3, 24]
	str	wzr, [x19, 1080]
	ldr	w3, [x19, 1084]
	ldr	x4, [x20, 632]
	ldrb	w4, [x4, 2]
	bl	dprint_normal
	ldr	w0, [x19, 1084]
	cmp	w0, 371
	beq	.L4114
	add	w0, w0, 1
	str	w0, [x19, 1084]
	ldr	x0, [x20, 632]
	ldrb	w3, [x0, 2]
	cmp	w3, 20
	beq	.L4115
.L3970:
	sub	w0, w3, #1
	cmp	w0, 29
	bls	.L4116
.L3976:
	ldr	x2, .LC974
	mov	w4, w22
	mov	w1, 10215
	mov	w0, 20
	bl	dprint_normal
	ldr	x0, [x20, 632]
	ldr	x2, .LC976
	ldrb	w3, [x0, 2]
	sub	w0, w3, #24
	uxtb	w0, w0
	cmp	w0, 7
	ccmp	w3, wzr, 4, hi
	beq	.L4117
	mov	w1, 10226
	mov	w0, 20
	bl	dprint_normal
.L4004:
	ldr	x1, [x20, 632]
	cbz	x1, .L4005
	ldr	w0, [x19, 1140]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4005:
	ldr	x0, .LC945
	ldr	x4, [x0]
	cbz	x4, .L4099
.L4102:
	ldr	w0, [x19, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L4099:
	mov	w0, 0
.L4118:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4116:
	ldr	x1, .LC940
	ldrh	w0, [x1,w0,uxtw #1]
	adr	x1, .Lrtx3978
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx3978:
	.section	.rodata
	.align	0
	.align	2
.L3978:
	.2byte	(.L3977 - .Lrtx3978) / 4
	.2byte	(.L3976 - .Lrtx3978) / 4
	.2byte	(.L3976 - .Lrtx3978) / 4
	.2byte	(.L3976 - .Lrtx3978) / 4
	.2byte	(.L3977 - .Lrtx3978) / 4
	.2byte	(.L3979 - .Lrtx3978) / 4
	.2byte	(.L3980 - .Lrtx3978) / 4
	.2byte	(.L3981 - .Lrtx3978) / 4
	.2byte	(.L3982 - .Lrtx3978) / 4
	.2byte	(.L3983 - .Lrtx3978) / 4
	.2byte	(.L3984 - .Lrtx3978) / 4
	.2byte	(.L3985 - .Lrtx3978) / 4
	.2byte	(.L3986 - .Lrtx3978) / 4
	.2byte	(.L3976 - .Lrtx3978) / 4
	.2byte	(.L3980 - .Lrtx3978) / 4
	.2byte	(.L3976 - .Lrtx3978) / 4
	.2byte	(.L3976 - .Lrtx3978) / 4
	.2byte	(.L3976 - .Lrtx3978) / 4
	.2byte	(.L3987 - .Lrtx3978) / 4
	.2byte	(.L3977 - .Lrtx3978) / 4
	.2byte	(.L3976 - .Lrtx3978) / 4
	.2byte	(.L3976 - .Lrtx3978) / 4
	.2byte	(.L3976 - .Lrtx3978) / 4
	.2byte	(.L3976 - .Lrtx3978) / 4
	.2byte	(.L3976 - .Lrtx3978) / 4
	.2byte	(.L3976 - .Lrtx3978) / 4
	.2byte	(.L3976 - .Lrtx3978) / 4
	.2byte	(.L3976 - .Lrtx3978) / 4
	.2byte	(.L3976 - .Lrtx3978) / 4
	.2byte	(.L3988 - .Lrtx3978) / 4
	.text
	.p2align 3
.L4113:
	ldr	w1, [x0, 3188]
	cmp	w1, 1
	bne	.L3965
	ldr	w1, [x0, 3192]
	cmp	w1, 2
	bne	.L3965
	ldr	w0, [x0, 3184]
	cmp	w0, 1
	ccmp	w21, wzr, 0, eq
	bne	.L3965
	add	x23, x20, 12288
	mov	w1, 40
	add	x22, x23, 2600
	mov	x0, x22
	bl	BsLongSkip
	mov	w1, 8
	mov	x0, x22
	bl	BsGet
	mov	w22, w0
	ldr	x1, [x20, 632]
	ldr	w0, [x1, 8]
	add	w0, w0, 48
	str	w0, [x1, 8]
	b	.L3968
	.p2align 3
.L3986:
	ldr	x2, .LC968
	mov	w1, 10179
	mov	w3, 13
	mov	w0, 20
	bl	dprint_normal
	ldr	x1, [x20, 632]
	cbz	x1, .L4099
	.p2align 2
.L4101:
	ldr	w0, [x19, 1140]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
	mov	w0, 0
.L3974:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L3985:
	ldr	x2, .LC964
	mov	w1, 10153
	mov	w3, 12
	mov	w0, 20
	bl	dprint_normal
	ldr	x1, [x20, 632]
	cbnz	x1, .L4101
	mov	w0, 0
	b	.L4118
.L3984:
	ldr	x2, .LC966
	mov	w1, 10158
	mov	w3, 11
	mov	w0, 20
	bl	dprint_normal
	mov	x0, x20
	bl	H264_IsEosNal
	uxtb	w1, w0
	cmp	w1, 1
	beq	.L4119
.L4108:
	ldr	x1, [x20, 632]
	cbnz	x1, .L4101
	mov	w0, 0
	b	.L4118
.L3983:
	ldr	x2, .LC962
	mov	w1, 10148
	mov	w3, 10
	mov	w0, 20
	bl	dprint_normal
	ldr	x1, [x20, 632]
	cbnz	x1, .L4101
	mov	w0, 0
	b	.L4118
.L3988:
	ldr	x2, .LC972
	mov	w3, 30
	mov	w1, 10189
	mov	w0, 20
	add	x23, x23, 2600
	bl	dprint_normal
	mov	w1, 32
	mov	x0, x23
	bl	BsGet
	mov	w24, w0
	mov	w1, 32
	mov	x0, x23
	bl	BsGet
	mov	w22, w0
	cbnz	w21, .L4001
	ldr	x1, [x20, 632]
	cbz	x1, .L4001
	ldr	w0, [x19, 1140]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4001:
	mov	w1, 20553
	mov	w0, 20036
	movk	w1, 0x4853, lsl 16
	movk	w0, 0x4345, lsl 16
	cmp	w24, w1
	ccmp	w22, w0, 0, eq
	bne	.L4099
	ldr	x21, .LC945
	ldr	x4, [x21]
	cbz	x4, .L4002
	ldr	w0, [x19, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	blr	x4
.L4002:
	mov	x0, x20
	str	wzr, [x20, 624]
	bl	DecVDM
	cbz	w0, .L4099
.L4110:
	ldr	x4, [x21]
	cbz	x4, .L4098
.L4100:
	ldr	w0, [x19, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
	mov	w0, -1
	b	.L3974
.L3987:
	ldr	x2, .LC970
	mov	w3, 19
	mov	w1, 10184
	mov	w0, 20
	bl	dprint_normal
	b	.L4108
.L3982:
	ldr	x2, .LC960
	mov	w1, 10143
	mov	w3, 9
	mov	w0, 20
	bl	dprint_normal
	ldr	x1, [x20, 632]
	cbnz	x1, .L4101
	mov	w0, 0
	b	.L4118
.L3981:
	ldr	x2, .LC947
	mov	w1, 10096
	ldr	w4, [x19, 1092]
	mov	w3, 8
	mov	w0, 20
	bl	dprint_normal
	mov	x0, x20
	bl	H264_DecPPS
	mov	w21, w0
	ldr	x1, [x20, 632]
	cbz	x1, .L3992
	ldr	w0, [x19, 1140]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L3992:
	cbnz	w21, .L4120
	ldr	w1, [x19, 1092]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 1092]
	b	.L3974
.L3980:
	ldr	x2, .LC952
	mov	w1, 10113
	ldr	w4, [x19, 1088]
	mov	w0, 20
	bl	dprint_normal
	mov	x0, x20
	bl	H264_DecSPS
	mov	w21, w0
	ldr	x1, [x20, 632]
	cbz	x1, .L3994
	ldr	w0, [x19, 1140]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L3994:
	cbnz	w21, .L4121
	ldr	w1, [x19, 1088]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 1088]
	b	.L3974
.L3979:
	ldr	x2, .LC956
	mov	w1, 10130
	mov	w3, 6
	mov	w0, 20
	bl	dprint_normal
	mov	x0, x20
	bl	H264_DecSEI
	mov	w21, w0
	ldr	x1, [x20, 632]
	cbz	x1, .L3996
	ldr	w0, [x19, 1140]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L3996:
	cbz	w21, .L4099
	ldr	x2, .LC958
	mov	w1, 10136
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC945
	ldr	x4, [x0]
	cbnz	x4, .L4102
	mov	w0, 0
	b	.L4118
.L3977:
	ldr	x2, .LC942
	mov	w1, 10066
	ldr	w4, [x19, 1096]
	mov	w0, 20
	bl	dprint_normal
	ldr	x2, [x20, 632]
	add	x1, x20, 20480
	mov	x0, x20
	ldrb	w3, [x2, 2]
	strb	w3, [x1, 1587]
	ldr	w2, [x2, 20]
	str	w2, [x1, 1612]
	bl	SliceCheck
	cbnz	w0, .L4122
	mov	x0, x20
	bl	H264_DecSlice
	cmn	w0, #2
	beq	.L3974
	cbz	w0, .L4099
	ldr	x0, .LC945
	ldr	x4, [x0]
	cbnz	x4, .L4100
.L4098:
	mov	w0, -1
.L4123:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4114:
	ldr	x2, .LC933
	mov	w1, 10017
	mov	w0, 20
	bl	dprint_normal
	ldr	w0, [x19, 1084]
	add	w0, w0, 1
	str	w0, [x19, 1084]
	ldr	x0, [x20, 632]
	ldrb	w3, [x0, 2]
	cmp	w3, 20
	bne	.L3970
	.p2align 2
.L4115:
	mov	w1, 24
	add	x0, x23, 2600
	bl	BsGet
	mov	w22, w0
	ldr	x1, [x20, 632]
	ubfx	x2, x22, 23, 1
	add	x0, x20, 57344
	strb	w2, [x1, 3]
	ldr	x2, [x20, 632]
	ldrb	w1, [x2, 3]
	cbz	w1, .L3971
	ubfx	x1, x22, 16, 6
	strb	w1, [x0, 2969]
	ubfx	x1, x22, 12, 3
	ubfx	x3, x22, 22, 1
	strb	w1, [x0, 2971]
	ubfx	x1, x22, 5, 3
	ubfx	x4, x22, 15, 1
	strb	w3, [x0, 2968]
	strb	w1, [x0, 2973]
	ubfx	x3, x22, 8, 4
	ubfx	x1, x22, 3, 1
	strb	w4, [x0, 2970]
	strb	w3, [x0, 2972]
	ubfx	x4, x22, 4, 1
	ubfx	x3, x22, 2, 1
	strb	w1, [x0, 2975]
	strb	w4, [x0, 2974]
	and	w1, w22, 3
	strb	w3, [x0, 2976]
	strb	w1, [x0, 2977]
.L3971:
	mov	x1, 16711680
	ldr	x3, [x0, 2968]
	movk	x1, 0xff, lsl 32
	and	x1, x3, x1
	cmp	x1, 65536
	beq	.L3972
	ldrb	w4, [x0, 2970]
	mov	w1, 10045
	ldrb	w3, [x0, 2972]
	mov	w0, 1
	ldr	x2, .LC935
	bl	dprint_normal
	ldr	x1, [x20, 632]
	cbz	x1, .L4098
	ldr	w0, [x19, 1140]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
	mov	w0, -1
	b	.L4123
.L3972:
	ldrb	w1, [x0, 2968]
	cmp	w1, 1
	beq	.L4124
.L3975:
	ldrb	w5, [x0, 2973]
	mov	w1, 10056
	ldrb	w4, [x0, 2971]
	ldrb	w3, [x0, 2972]
	mov	w0, 20
	ldr	x2, .LC937
	bl	dprint_normal
	ldr	x2, .LC939
	mov	w3, w22
	mov	w1, 10057
	mov	w0, 20
	bl	dprint_normal
	ldr	x1, [x20, 632]
	ldr	w0, [x1, 8]
	add	w0, w0, 24
	str	w0, [x1, 8]
	ldr	x0, [x20, 632]
	ldrb	w3, [x0, 2]
	b	.L3970
.L4122:
	ldr	x2, .LC944
	mov	w1, 10075
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x20
	bl	ClearCurrSlice
	ldr	x0, .LC945
	ldr	x4, [x0]
	cbnz	x4, .L4100
	mov	w0, -1
	b	.L4123
.L4117:
	mov	w1, 10221
	mov	w0, 20
	bl	dprint_normal
	b	.L4004
.L4121:
	ldr	x2, .LC954
	mov	w1, 10119
	mov	w0, 1
	bl	dprint_normal
	ldr	x21, .LC945
	ldr	x4, [x21]
	cbz	x4, .L4098
.L4106:
	add	x2, x29, 80
	ldr	w0, [x19, 1140]
	mov	w20, -1
	mov	w3, 4
	mov	w1, 9
	str	w20, [x2, -8]!
	blr	x4
	ldr	x4, [x21]
	cbz	x4, .L4098
	ldr	w0, [x19, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
	mov	w0, w20
	b	.L3974
.L4120:
	ldr	x3, .LC948
	mov	w1, 10102
	ldr	x2, .LC950
	mov	w0, 1
	add	x3, x3, 392
	bl	dprint_normal
	ldr	x21, .LC945
	ldr	x4, [x21]
	cbnz	x4, .L4106
	mov	w0, -1
	b	.L4123
.L4124:
	mov	w1, 5
	strb	w1, [x2, 2]
	b	.L3975
.L4119:
	ldr	x21, .LC945
	strb	w0, [x23, 2640]
	ldr	x4, [x21]
	cbz	x4, .L3999
	ldr	w0, [x19, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 46
	blr	x4
.L3999:
	mov	x0, x20
	str	wzr, [x20, 624]
	bl	DecVDM
	cbz	w0, .L4108
	ldr	x1, [x20, 632]
	cbz	x1, .L4110
	ldr	w0, [x19, 1140]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
	b	.L4110
	.size	H264_DecOneNal, .-H264_DecOneNal
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
.LC935:
	.xword	.LC934
	.align	3
.LC937:
	.xword	.LC936
	.align	3
.LC939:
	.xword	.LC938
	.align	3
.LC940:
	.xword	.L3978
	.align	3
.LC942:
	.xword	.LC941
	.align	3
.LC944:
	.xword	.LC943
	.align	3
.LC945:
	.xword	g_EventReportFunc
	.align	3
.LC947:
	.xword	.LC946
	.align	3
.LC948:
	.xword	.LANCHOR1
	.align	3
.LC950:
	.xword	.LC949
	.align	3
.LC952:
	.xword	.LC951
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
	.align	3
.LC966:
	.xword	.LC965
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_DecodePacket
	.type	H264DEC_DecodePacket, %function
H264DEC_DecodePacket:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	str	wzr, [x29, 100]
	stp	wzr, wzr, [x29, 92]
	cbz	x21, .L4184
	ldr	x0, [x20]
	add	x19, x20, 61440
	ldr	w2, [x0, 8]
	ldr	w1, [x19, 56]
	ubfiz	w2, w2, 16, 3
	str	w2, [x19, 1128]
	cmp	w1, 1
	ldr	w1, [x0]
	str	w1, [x19, 1132]
	ldr	w1, [x0, 4]
	str	w1, [x19, 1136]
	str	wzr, [x19, 1080]
	beq	.L4128
	ldr	w1, [x0, 856]
	cmp	w1, 1
	beq	.L4185
.L4129:
	mov	x1, x21
	mov	x0, x20
	bl	ReceivePacket
	ldr	x1, [x20, 632]
	str	x1, [x19, 1208]
.L4131:
	str	wzr, [x19, 56]
	cbz	w0, .L4130
.L4154:
	mov	w21, 0
.L4182:
	mov	w0, w21
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4185:
	ldr	w0, [x0, 888]
	cmp	w0, 1
	bne	.L4129
	ldr	w0, [x19, 1200]
	cmp	w0, 1
	bne	.L4129
	ldr	x0, [x19, 1208]
	str	x0, [x20, 632]
	str	wzr, [x19, 56]
	str	wzr, [x19, 1200]
	.p2align 2
.L4130:
	mov	x0, x20
	bl	H264DEC_CheckSedOnly
	mov	w21, w0
	ldr	x1, [x20, 632]
	cbz	w0, .L4132
	cbz	x1, .L4156
	ldr	w0, [x19, 1140]
	mov	w21, -1
	bl	ReleaseNAL
	str	xzr, [x20, 632]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4128:
	ldr	x0, [x20, 632]
	cmp	x0, xzr
	csetm	w0, eq
	b	.L4131
	.p2align 3
.L4156:
	mov	w21, -1
	b	.L4182
	.p2align 3
.L4132:
	str	wzr, [x1, 8]
	add	x22, x20, 12288
	add	x22, x22, 2600
	ldr	x1, [x20, 632]
	mov	x0, x22
	ldr	w2, [x1, 48]
	ldr	x1, [x1, 40]
	bl	BsInit
	ldr	x23, .LC979
	ldrsw	x0, [x19, 1140]
	ldr	x0, [x23, x0, lsl 3]
	add	x0, x0, 217088
	ldrsb	w24, [x0, 3072]
	cmp	w24, 1
	beq	.L4133
.L4135:
	mov	w24, 0
.L4134:
	mov	w1, 32
	mov	x0, x22
	bl	BsGet
	uxtb	w0, w0
	ldr	x1, [x20, 632]
	and	w2, w0, 31
	ubfx	x3, x0, 5, 2
	strb	w2, [x1, 2]
	ldr	x1, [x20, 632]
	str	w3, [x1, 20]
	mov	w1, 27
	and	w0, w0, w1
	cmp	w0, 1
	ccmp	w2, 20, 4, ne
	beq	.L4186
.L4136:
	mov	x0, x20
	bl	FindTrailZeros
	cbnz	w0, .L4187
	ldr	x1, [x20, 632]
	mov	x0, x22
	str	wzr, [x1, 8]
	ldr	x1, [x20, 632]
	ldr	w2, [x1, 48]
	ldr	x1, [x1, 40]
	bl	BsInit
	mov	w1, w24
	mov	x0, x20
	bl	H264_DecOneNal
	cmn	w0, #2
	beq	.L4160
	cbnz	w0, .L4188
	add	x0, x20, 57344
	str	wzr, [x0, 2276]
	ldr	w0, [x19, 1144]
	cmp	w0, 1
	bne	.L4154
	mov	x0, x20
	bl	H264DEC_SetDecParam
	b	.L4182
	.p2align 3
.L4186:
	cmp	w2, 20
	beq	.L4189
.L4137:
	add	x2, x29, 108
	add	x1, x29, 104
	mov	x0, x20
	bl	InquireSliceProperty
	cbnz	w0, .L4138
	ldr	w1, [x29, 104]
	ldr	w0, [x19, 1180]
	cmp	w1, 1
	csinc	w0, w0, w0, ne
	str	w0, [x19, 1180]
	beq	.L4190
.L4139:
	ldr	w1, [x29, 108]
	cmp	w1, 1
	bne	.L4136
	ldrsw	x0, [x19, 1140]
	ldr	x25, .LC981
	lsl	x2, x0, 2
	sub	x2, x2, x0
	lsl	x3, x2, 5
	add	x2, x2, x3
	add	x0, x2, x0
	add	x25, x25, x0
	ldr	w0, [x25, 64]
	cbz	w0, .L4191
.L4146:
	mov	x0, x20
	bl	FlushDPB
	cbnz	w0, .L4192
.L4147:
	ldr	w0, [x19, 1140]
	add	x3, x29, 100
	add	x2, x29, 96
	add	x1, x29, 92
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x20]
	ldr	w0, [x0, 736]
	cmp	w0, 1
	bne	.L4136
	ldr	w0, [x29, 100]
	cmp	w0, wzr
	ble	.L4193
.L4148:
	ldrsw	x0, [x19, 1140]
	mov	w1, 1
	mov	w21, -2
	ldr	x0, [x23, x0, lsl 3]
	add	x0, x0, 221184
	str	w1, [x0, 100]
	str	w1, [x19, 56]
	b	.L4182
	.p2align 3
.L4138:
	ldr	x1, [x20, 632]
	cbz	x1, .L4151
	ldr	w0, [x19, 1140]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4151:
	ldr	x0, .LC984
	ldr	x4, [x0]
	cbz	x4, .L4156
	ldr	w0, [x19, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	mov	w21, -1
	blr	x4
	b	.L4182
	.p2align 3
.L4133:
	ldr	w1, [x0, 3184]
	ldr	w2, [x0, 3188]
	ldr	w3, [x0, 3192]
	mov	x0, x20
	bl	H264_VES_Splitter
	cmp	w0, 3
	beq	.L4134
	cbz	w0, .L4135
.L4160:
	mov	w21, w0
	b	.L4182
.L4190:
	add	x25, x20, 20480
	ldrb	w0, [x25, 1585]
	cmp	w0, 1
	ldr	w0, [x19, 1184]
	beq	.L4194
	add	w0, w0, 2
	str	w0, [x19, 1184]
.L4141:
	ldr	w0, [x19, 1064]
	cbz	w0, .L4139
	ldr	x3, [x20, 632]
	mov	w2, 20
	ldr	x1, .LC980
	mov	x0, x22
	add	x1, x1, 432
	str	wzr, [x3, 8]
	bl	BsInit
	mov	w1, 1
	mov	x0, x20
	bl	H264_DecOneNal
	ldrb	w0, [x25, 1585]
	cmp	w0, 1
	ldr	w0, [x19, 1184]
	beq	.L4195
	sub	w0, w0, #2
	str	w0, [x19, 1184]
.L4143:
	mov	w0, 1
	mov	w21, -2
	str	w0, [x19, 56]
	b	.L4182
.L4189:
	mov	x0, x20
	bl	InquireSliceExtProperty
	b	.L4137
.L4184:
	mov	w4, 11240
	ldr	x3, .LC977
	ldr	x2, .LC978
	mov	w1, w4
	mov	w0, 0
	mov	w21, -1
	bl	dprint_normal
	b	.L4182
.L4194:
	add	w0, w0, 1
	str	w0, [x19, 1184]
	b	.L4141
.L4187:
	ldr	x2, .LC986
	mov	w1, 11398
	mov	w0, 20
	mov	w21, -1
	bl	dprint_normal
	b	.L4182
.L4191:
	ldr	x0, .LC982
	str	w1, [x25, 64]
	ldr	x0, [x0]
	blr	x0
	str	w0, [x25, 68]
	b	.L4146
.L4192:
	mov	w3, 11361
	ldr	x2, .LC983
	mov	w4, w0
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L4147
.L4188:
	ldr	x2, .LC988
	mov	w1, 11413
	mov	w0, 20
	mov	w21, -1
	bl	dprint_normal
	b	.L4182
.L4195:
	sub	w0, w0, #1
	str	w0, [x19, 1184]
	b	.L4143
.L4193:
	ldr	w0, [x29, 96]
	cmp	w0, 32
	bgt	.L4148
	ldr	x0, [x20, 616]
	cbnz	x0, .L4148
	ldr	w0, [x19, 1104]
	cbz	w0, .L4136
	ldr	w0, [x20, 14932]
	cbz	w0, .L4136
	ldr	w2, [x19, 1216]
	ldr	w1, [x20, 14936]
	cmp	w1, w2
	beq	.L4136
	ldr	w2, [x19, 1220]
	cmp	w0, w2
	beq	.L4136
	ldr	x2, .LC984
	str	w1, [x19, 1216]
	str	w0, [x19, 1220]
	ldr	x4, [x2]
	cbz	x4, .L4136
	ldr	w0, [x19, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 48
	blr	x4
	b	.L4136
	.size	H264DEC_DecodePacket, .-H264DEC_DecodePacket
	.align	3
.LC977:
	.xword	.LC54
	.align	3
.LC978:
	.xword	.LC56
	.align	3
.LC979:
	.xword	s_pstVfmwChan
	.align	3
.LC980:
	.xword	.LANCHOR2
	.align	3
.LC981:
	.xword	g_VfmwChanStat
	.align	3
.LC982:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC983:
	.xword	.LC789
	.align	3
.LC984:
	.xword	g_EventReportFunc
	.align	3
.LC986:
	.xword	.LC985
	.align	3
.LC988:
	.xword	.LC987
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_VDMPostProc
	.type	H264DEC_VDMPostProc, %function
H264DEC_VDMPostProc:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 61440
	mov	w25, w1
	mov	x23, x3
	mov	w24, w5
	bl	_mcount
	str	xzr, [x29, 96]
	ldr	w2, [x21, 1168]
	ldr	x0, [x19]
	stp	xzr, xzr, [x29, 80]
	cmp	w2, 1
	str	wzr, [x29, 104]
	ldr	w26, [x0, 656]
	bls	.L4197
	ldr	w1, [x0, 8]
	add	x20, x19, 57344
	cmp	w1, 2
	beq	.L4198
	ldr	w2, [x20, 2248]
	lsl	w2, w2, 4
	cmp	w2, 1920
	bhi	.L4227
.L4198:
	ldr	w0, [x0, 652]
	str	w0, [x21, 1144]
.L4212:
	ldr	w22, [x19, 624]
	mov	x0, x19
	str	w25, [x20, 2244]
	cbnz	w22, .L4199
.L4228:
	bl	ClearAllSlice
	cbz	w26, .L4200
	ldr	x25, [x20, 2192]
	str	wzr, [x29, 104]
	cbz	x25, .L4201
	ldr	x0, .LC989
	ldr	x2, [x0, 264]
	cbz	x2, .L4202
	mov	w1, w24
	add	x0, x29, 80
	blr	x2
	cbnz	w0, .L4203
	add	x0, x19, 20480
	ldrb	w1, [x0, 1585]
	cbnz	w1, .L4205
	ldr	w0, [x29, 80]
	str	w0, [x25, 624]
.L4206:
	ldp	w2, w1, [x25, 248]
	ldp	w4, w3, [x29, 88]
	add	x6, x20, 1792
	cmp	w2, w4
	csel	w2, w2, w4, cs
	cmp	w1, w3
	csel	w1, w1, w3, ls
	stp	w2, w1, [x25, 248]
	ldp	w2, w1, [x29, 96]
	str	w2, [x25, 256]
	str	w1, [x25, 260]
	stp	w4, w3, [x6, 104]
	stp	w2, w1, [x6, 112]
.L4200:
	mov	x1, x23
	mov	x0, x19
	bl	StorePicInDPB
	cmp	w0, 1
	mov	w23, w0
	bls	.L4208
	ldr	x1, [x20, 2192]
	ldr	w0, [x21, 1140]
	mov	w21, -1
	mov	w22, w21
	ldr	w1, [x1, 544]
	bl	FSP_ClearLogicFs
	ldr	x2, .LC997
	mov	w3, w23
	mov	w1, 11571
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x19
	bl	ClearAllSlice
	add	x1, x19, 20480
	ldr	w4, [x19, 14948]
	add	x5, x1, 3072
	mov	w2, 2
	mov	w3, 23352
	mov	w0, 7
	strb	w2, [x1, 3225]
	movk	w3, 0x1, lsl 16
	str	w0, [x1, 3236]
	mov	w2, 32
	strb	wzr, [x1, 3224]
	mov	w0, 3
	strb	w2, [x1, 3226]
	mov	w2, 1048576
	str	w4, [x1, 3232]
	str	w3, [x1, 3240]
	stp	w21, wzr, [x5, 180]
	stp	wzr, w2, [x5, 188]
	str	w0, [x1, 3248]
	mov	x0, x19
	bl	ClearDPB
	ldr	x0, [x20, 2192]
	strb	wzr, [x0, 1]
	ldr	x0, [x20, 2192]
	strb	wzr, [x0, 4]
	mov	w0, w22
	str	xzr, [x20, 2192]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4227:
	str	wzr, [x21, 1144]
	mov	x0, x19
	ldr	w22, [x19, 624]
	str	w25, [x20, 2244]
	cbz	w22, .L4228
.L4199:
	bl	ClearAllSlice
	mov	x1, x23
	mov	x0, x19
	bl	StorePicInDPB
	cbnz	w0, .L4229
.L4210:
	mov	x0, x19
	bl	FlushDPB
	cbnz	w0, .L4230
.L4211:
	add	x0, x19, 20480
	str	wzr, [x21, 52]
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
	mov	w1, 1048576
	stp	w3, w2, [x4, 176]
	stp	wzr, wzr, [x4, 184]
	str	w1, [x0, 3264]
	mov	w22, 0
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4197:
	ldr	w0, [x0, 652]
	add	w2, w2, 1
	add	x20, x19, 57344
	str	w0, [x21, 1144]
	str	w2, [x21, 1168]
	b	.L4212
	.p2align 3
.L4208:
	mov	w0, 1
	str	w0, [x21, 52]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4230:
	ldr	x2, .LC1001
	mov	w3, w0
	mov	w1, 11600
	mov	w0, 1
	bl	dprint_normal
	b	.L4211
	.p2align 3
.L4229:
	ldr	x2, .LC999
	mov	w3, w0
	mov	w1, 11593
	mov	w0, 1
	bl	dprint_normal
	b	.L4210
	.p2align 3
.L4205:
	ldrb	w0, [x0, 1586]
	cbnz	w0, .L4207
	ldr	w0, [x29, 80]
	str	w0, [x25, 672]
	b	.L4206
	.p2align 3
.L4202:
	mov	w3, 11526
	ldr	x2, .LC991
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
.L4203:
	ldr	x2, .LC993
	mov	w1, 11529
	mov	w0, 1
	bl	dprint_normal
	b	.L4200
	.p2align 3
.L4207:
	ldr	w0, [x29, 80]
	str	w0, [x25, 720]
	b	.L4206
	.p2align 3
.L4201:
	ldr	x2, .LC995
	mov	w1, 11562
	mov	w0, 0
	bl	dprint_normal
	b	.L4200
	.size	H264DEC_VDMPostProc, .-H264DEC_VDMPostProc
	.align	3
.LC989:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC991:
	.xword	.LC990
	.align	3
.LC993:
	.xword	.LC992
	.align	3
.LC995:
	.xword	.LC994
	.align	3
.LC997:
	.xword	.LC996
	.align	3
.LC999:
	.xword	.LC998
	.align	3
.LC1001:
	.xword	.LC1000
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
	mov	w19, w1
	add	x22, x21, 61440
	bl	_mcount
	sxtw	x1, w19
	ldr	x2, [x21, 616]
	lsl	x0, x1, 2
	ldr	x19, .LC1003
	sub	x0, x0, x1
	ldr	x4, .LC1002
	lsl	x0, x0, 3
	ldr	w3, [x2, 20]
	sub	x0, x0, x1
	ldr	w20, [x2, 12]
	ldrsw	x5, [x22, 1140]
	mov	w1, 11623
	add	x19, x19, x0, lsl 3
	ldr	x2, .LC1005
	mul	w20, w3, w20
	ldr	x23, [x4, x5, lsl 3]
	mov	w0, 20
	sub	w20, w20, #1
	ldr	w4, [x19, 20]
	mov	w3, w20
	bl	dprint_normal
	ldr	w0, [x19, 20]
	cmp	w20, w0
	ldr	w0, [x22, 1152]
	beq	.L4250
	cmp	w0, 1
	beq	.L4251
.L4248:
	str	xzr, [x21, 616]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L4251:
	ldr	w0, [x22, 1064]
	str	wzr, [x22, 1156]
	sub	w0, w0, #1
	str	w0, [x22, 1064]
	ldr	x1, [x21, 632]
	cbz	x1, .L4248
	ldr	w0, [x22, 1140]
	bl	ReleaseNAL
	str	xzr, [x21, 632]
	b	.L4248
	.p2align 3
.L4250:
	cmp	w0, 1
	beq	.L4233
	ldr	x0, .LC1006
	ldr	x4, [x0]
	cbz	x4, .L4234
	ldr	w0, [x22, 1140]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	blr	x4
.L4234:
	mov	x0, x21
	bl	DecVDM
	cbnz	w0, .L4248
	mov	w0, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L4233:
	ldr	w1, [x22, 1064]
	add	x23, x23, 217088
	str	w0, [x22, 1156]
	sub	w1, w1, #1
	str	w1, [x22, 1064]
	strb	w0, [x23, 3401]
	str	w0, [x22, 56]
	b	.L4248
	.size	H264DEC_VDMProcSedOnly, .-H264DEC_VDMProcSedOnly
	.align	3
.LC1002:
	.xword	s_pstVfmwChan
	.align	3
.LC1003:
	.xword	g_BackUp
	.align	3
.LC1005:
	.xword	.LC1004
	.align	3
.LC1006:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_GetImageBuffer
	.type	H264DEC_GetImageBuffer, %function
H264DEC_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 61440
	bl	_mcount
	ldr	w1, [x19, 44]
	cbz	w1, .L4255
	add	x0, x20, 57344
	ldrb	w0, [x0, 1640]
	cmp	w0, 1
	beq	.L4255
	add	x3, x20, 28672
	mov	w5, 0
	add	x3, x3, 552
	.p2align 2
.L4260:
	ldrb	w0, [x3, 1]
	cbnz	w0, .L4256
	cbz	x3, .L4257
	add	x0, x20, 24576
	ldr	w4, [x0, 3708]
	cbz	w4, .L4257
	ldr	x0, [x20, 27896]
	cmp	x0, x3
	beq	.L4256
	sub	w4, w4, #1
	mov	x0, x20
	add	x4, x20, x4, lsl 3
	b	.L4258
	.p2align 3
.L4259:
	ldr	x2, [x0, 27896]
	cmp	x2, x3
	beq	.L4256
.L4258:
	cmp	x4, x0
	add	x0, x0, 8
	bne	.L4259
.L4257:
	cmp	w1, w5
	bls	.L4275
	ldr	w0, [x19, 1140]
	bl	FSP_IsNewFsAvailable
	cmp	w0, 1
	beq	.L4255
	cmn	w0, #1
	beq	.L4276
.L4275:
	mov	w0, 0
.L4277:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L4255:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L4256:
	add	w5, w5, 1
	add	x3, x3, 744
	cmp	w1, w5
	bne	.L4260
	mov	w0, 0
	b	.L4277
.L4276:
	ldr	w0, [x19, 1140]
	add	x1, x20, 8
	bl	FSP_ClearNotInVoQueue
	mov	w0, 0
	b	.L4277
	.size	H264DEC_GetImageBuffer, .-H264DEC_GetImageBuffer
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
	.type	__func__.6187, %object
	.size	__func__.6187, 23
__func__.6187:
	.string	"RemoveFrameStoreOutDPB"
	.zero	1
	.type	__func__.6206, %object
	.size	__func__.6206, 16
__func__.6206:
	.string	"CheckFrameStore"
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.6439, %object
	.size	__func__.6439, 20
__func__.6439:
	.string	"H264_ArrangeVahbMem"
	.zero	4
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
	.type	__func__.7159, %object
	.size	__func__.7159, 12
__func__.7159:
	.string	"H264_DecPPS"
	.zero	4
	.type	SarTable.7237, %object
	.size	SarTable.7237, 136
SarTable.7237:
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
	.type	__func__.7427, %object
	.size	__func__.7427, 12
__func__.7427:
	.string	"H264_DecSEI"
	.zero	4
	.type	__func__.6255, %object
	.size	__func__.6255, 17
__func__.6255:
	.string	"OutputFrmFromDPB"
	.zero	7
	.type	__func__.6309, %object
	.size	__func__.6309, 13
__func__.6309:
	.string	"DirectOutput"
	.zero	3
	.type	__func__.6758, %object
	.size	__func__.6758, 8
__func__.6758:
	.string	"InitDPB"
	.type	__func__.7624, %object
	.size	__func__.7624, 18
__func__.7624:
	.string	"H264_VES_Splitter"
	.zero	6
	.type	__func__.6415, %object
	.size	__func__.6415, 14
__func__.6415:
	.string	"StorePicInDPB"
	.zero	2
	.type	__FUNCTION__.7595, %object
	.size	__FUNCTION__.7595, 13
__FUNCTION__.7595:
	.string	"H264DEC_Init"
	.zero	3
	.type	__FUNCTION__.6881, %object
	.size	__FUNCTION__.6881, 8
__FUNCTION__.6881:
	.string	"InitPic"
	.type	__func__.6882, %object
	.size	__func__.6882, 8
__func__.6882:
	.string	"InitPic"
	.type	__func__.7498, %object
	.size	__func__.7498, 15
__func__.7498:
	.string	"H264_DecOneNal"
	.data
	.align	3
.LANCHOR2 = . + 0
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
.LC31:
	ASCII(.string	"%s DPB.fs[%d] = NULL\n" )
	.zero	2
.LC34:
	ASCII(.string	"%s pstLogicFs = NULL!\n" )
	.zero	1
.LC36:
	ASCII(.string	"%s LogicFs FsState %d invalid!\n" )
.LC38:
	ASCII(.string	"not used frame: (%d,%d)\n" )
	.zero	7
.LC40:
	ASCII(.string	"frame skip: is_used=%d,skip=%d\n" )
.LC42:
	ASCII(.string	"topfield skip: is_used=%d,skip=%d\n" )
	.zero	5
.LC44:
	ASCII(.string	"bottom field skip: is_used=%d,skip=%d\n" )
	.zero	1
.LC46:
	ASCII(.string	"err(%d) > out_thr(%d)\n" )
	.zero	1
.LC49:
	ASCII(.string	"Chan:%d exg_pts: %lld <-> %lld\n" )
.LC51:
	ASCII(.string	"stream frame packing type is %d! what can we do?\n" )
	.zero	6
.LC54:
	ASCII(.string	"../../core/syntax/h264.c" )
	.zero	7
.LC56:
	ASCII(.string	"NULL pointer: %s, L%d\n" )
	.zero	1
.LC58:
	ASCII(.string	"framestore %d allocate apc %d\n" )
	.zero	1
.LC60:
	ASCII(.string	"find APC, but logic_fs_id %d abnormal(ref=%d,plfs=%p, pdfs=%p)\n" )
.LC64:
	ASCII(.string	"\n VFMW ** release streambuff=%p   bitstream_length=%d\n" )
	.zero	1
.LC66:
	ASCII(.string	"clear curr slice.\n" )
	.zero	5
.LC72:
	ASCII(.string	"%s arrange fs pool failed!\n" )
	.zero	4
.LC74:
	ASCII(.string	"slice_type %d invalid, clear current slice.\n" )
	.zero	3
.LC76:
	ASCII(.string	"pRepairPic(%p)/found(%d) = 0, clear current slice.\n" )
	.zero	4
.LC78:
	ASCII(.string	"listXsize[%d] = %d, clear current slice.\n" )
	.zero	6
.LC86:
	ASCII(.string	"for P slice size of list equal 0.\n" )
	.zero	5
.LC92:
	ASCII(.string	"for B slice size of two list all equal 0.\n" )
	.zero	5
.LC96:
	ASCII(.string	"init list error.\n" )
	.zero	6
.LC98:
	ASCII(.string	"L0: list after init.\n" )
	.zero	2
.LC101:
	ASCII(.string	"L0: list after reorder.\n" )
	.zero	7
.LC104:
	ASCII(.string	"nal_ref_idc=%d, structure=%d, image_id=%d, pmv_idc=%d\n" )
	.zero	1
.LC106:
	ASCII(.string	"logic frame id(=%d): get LogicFs error!\n" )
	.zero	7
.LC108:
	ASCII(.string	"phy fs is null: pstDecodeFs = %p, pstPmv = %p\n" )
	.zero	1
.LC112:
	ASCII(.string	"line: %d pstLogicFs is null\n" )
	.zero	3
.LC114:
	ASCII(.string	"SH: first_mb_in_slice" )
	.zero	2
.LC116:
	ASCII(.string	"slicecheck first_mb_in_slice >= MAX_MB_NUM_IN_PIC error.\n" )
	.zero	6
.LC118:
	ASCII(.string	"SH: slice_type" )
	.zero	1
.LC120:
	ASCII(.string	"slice type = %d\n" )
	.zero	7
.LC123:
	ASCII(.string	"slice type = %d, err\n" )
	.zero	2
.LC125:
	ASCII(.string	"slice  pps id = %d\n" )
	.zero	4
.LC127:
	ASCII(.string	"pps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	1
.LC129:
	ASCII(.string	"sps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	1
.LC131:
	ASCII(.string	"tmp slice  pps id = %d\n" )
.LC133:
	ASCII(.string	"PPSSPSCheckTmpId: pps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	7
.LC135:
	ASCII(.string	"PPSSPSCheckTmpId: seq_parameter_set_id out of range.\n" )
	.zero	2
.LC137:
	ASCII(.string	"PPSSPSCheckTmpId: sps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	7
.LC139:
	ASCII(.string	"new pic flag = %d\n" )
	.zero	5
.LC141:
	ASCII(.string	"SH: ref_pic_list_reordering_flag_l0" )
	.zero	4
.LC143:
	ASCII(.string	"SH: reordering_of_pic_nums_idc_l0" )
	.zero	6
.LC145:
	ASCII(.string	"reorder idc l0 = %d, g_SeErrFlag=%d\n" )
	.zero	3
.LC147:
	ASCII(.string	"SH: abs_diff_pic_num_minus1_l0" )
	.zero	1
.LC149:
	ASCII(.string	"abs_diff_pic_num_minus1_l0 = %d, g_SeErrFlag=%d\n" )
	.zero	7
.LC151:
	ASCII(.string	"SH: long_term_pic_idx_l0" )
	.zero	7
.LC153:
	ASCII(.string	"num of idc l0 exceed\n" )
	.zero	2
.LC155:
	ASCII(.string	"SH: ref_pic_list_reordering_flag_l1" )
	.zero	4
.LC157:
	ASCII(.string	"SH: reordering_of_pic_nums_idc_l1" )
	.zero	6
.LC159:
	ASCII(.string	"reorder idc l1 = %d, g_SeErrFlag=%d\n" )
	.zero	3
.LC161:
	ASCII(.string	"SH: abs_diff_pic_num_minus1_l1" )
	.zero	1
.LC163:
	ASCII(.string	"abs_diff_pic_num_minus1_l1 = %d, g_SeErrFlag=%d\n" )
	.zero	7
.LC165:
	ASCII(.string	"SH: long_term_pic_idx_l1" )
	.zero	7
.LC167:
	ASCII(.string	"num of idc l1 exceed\n" )
	.zero	2
.LC169:
	ASCII(.string	"SH: luma_log2_weight_denom" )
	.zero	5
.LC171:
	ASCII(.string	"SH: chroma_log2_weight_denom" )
	.zero	3
.LC173:
	ASCII(.string	"WP log2 exceed  and err flag = %d\n" )
	.zero	5
.LC175:
	ASCII(.string	"SH: luma_weight_flag_l0" )
.LC177:
	ASCII(.string	"SH: luma_weight_l0" )
	.zero	5
.LC179:
	ASCII(.string	"SH: luma_offset_l0" )
	.zero	5
.LC181:
	ASCII(.string	"SH: chroma_weight_flag_l0" )
	.zero	6
.LC183:
	ASCII(.string	"SH: chroma_weight_l0" )
	.zero	3
.LC185:
	ASCII(.string	"SH: chroma_offset_l0" )
	.zero	3
.LC187:
	ASCII(.string	"SH: luma_weight_flag_l1" )
.LC189:
	ASCII(.string	"SH: luma_weight_l1" )
	.zero	5
.LC191:
	ASCII(.string	"SH: luma_offset_l1" )
	.zero	5
.LC193:
	ASCII(.string	"SH: chroma_weight_flag_l1" )
	.zero	6
.LC195:
	ASCII(.string	"SH: chroma_weight_l1" )
	.zero	3
.LC197:
	ASCII(.string	"SH: chroma_offset_l1" )
	.zero	3
.LC199:
	ASCII(.string	"overflow MAX_MMCO_LEN\n" )
	.zero	1
.LC201:
	ASCII(.string	"SH: memory_management_control_operation" )
.LC203:
	ASCII(.string	"SH: difference_of_pic_nums_minus1" )
	.zero	6
.LC205:
	ASCII(.string	"SH: long_term_pic_num" )
	.zero	2
.LC207:
	ASCII(.string	"SH: long_term_frame_idx" )
.LC209:
	ASCII(.string	"SH: max_long_term_frame_idx_plus1" )
	.zero	6
.LC211:
	ASCII(.string	"mmco exceed 6\n" )
	.zero	1
.LC213:
	ASCII(.string	"SH: no_output_of_prior_pics_flag" )
	.zero	7
.LC215:
	ASCII(.string	"SH: long_term_reference_flag" )
	.zero	3
.LC217:
	ASCII(.string	"SH: adaptive_ref_pic_marking_mode_flag" )
	.zero	1
.LC219:
	ASCII(.string	"MMCO para would save dec err\n" )
	.zero	2
.LC221:
	ASCII(.string	"mulitislice diff no_out_of_prior_pics_flag, used first.\n" )
	.zero	7
.LC223:
	ASCII(.string	"mulitislice diff long_term_reference_flag, used first.\n" )
.LC225:
	ASCII(.string	"mulitislice diff adaptive_ref_pic_marking_mode_flag, used first.\n" )
	.zero	6
.LC227:
	ASCII(.string	"TotalPicNum=%d, SliceNumInPic=%d, TotalNal=%d\n" )
	.zero	1
.LC229:
	ASCII(.string	"SH: pic_parameter_set_id" )
	.zero	7
.LC231:
	ASCII(.string	"pps id:%d in sliceheader err\n" )
	.zero	2
.LC233:
	ASCII(.string	"PPS or SPS of this slice not valid\n" )
	.zero	4
.LC235:
	ASCII(.string	"recover point but isn't I_SLICE.\n" )
	.zero	6
.LC237:
	ASCII(.string	"SH: frame_num" )
	.zero	2
.LC239:
	ASCII(.string	"IDR NAL but frame_num!=0.\n" )
	.zero	5
.LC241:
	ASCII(.string	"SH: field_pic_flag" )
	.zero	5
.LC243:
	ASCII(.string	"SH: bottom_field_flag" )
	.zero	2
.LC245:
	ASCII(.string	"field first_mb_in_slice bigger than pic size\n" )
	.zero	2
.LC247:
	ASCII(.string	"frame first_mb_in_slice bigger than pic size\n" )
	.zero	2
.LC249:
	ASCII(.string	"SH: idr_pic_id" )
	.zero	1
.LC251:
	ASCII(.string	"idr_pic_id bigger than 65535\n" )
	.zero	2
.LC253:
	ASCII(.string	"SH: pic_order_cnt_lsb" )
	.zero	2
.LC255:
	ASCII(.string	"SH: delta_pic_order_cnt_bottom" )
	.zero	1
.LC257:
	ASCII(.string	"SH: delta_pic_order_cnt[0]" )
	.zero	5
.LC259:
	ASCII(.string	"SH: delta_pic_order_cnt[1]" )
	.zero	5
.LC261:
	ASCII(.string	"SH: redundant_pic_cnt" )
	.zero	2
.LC263:
	ASCII(.string	"redundant pic not support.\n" )
	.zero	4
.LC266:
	ASCII(.string	"first_mb_in_slice in currslice small than prevslice in same pic\n" )
	.zero	7
.LC270:
	ASCII(.string	"SH: direct_spatial_mv_pred_flag" )
.LC272:
	ASCII(.string	"SH: num_ref_idx_override_flag" )
	.zero	2
.LC274:
	ASCII(.string	"SH: num_ref_idx_l0_active_minus1" )
	.zero	7
.LC276:
	ASCII(.string	"SH: num_ref_idx_l1_active_minus1" )
	.zero	7
.LC278:
	ASCII(.string	"frame num_ref_idx_lx_active_minus1 exceed\n" )
	.zero	5
.LC280:
	ASCII(.string	"field num_ref_idx_lx_active_minus1 exceed\n" )
	.zero	5
.LC282:
	ASCII(.string	"reordering para dec err\n" )
	.zero	7
.LC284:
	ASCII(.string	"apply_weights_flag=%d\n" )
	.zero	1
.LC286:
	ASCII(.string	"wpt dec err\n" )
	.zero	3
.LC288:
	ASCII(.string	"mark para dec err\n" )
	.zero	5
.LC290:
	ASCII(.string	"SH: cabac_init_idc" )
	.zero	5
.LC292:
	ASCII(.string	"cabac_init_idc bigger than 3\n" )
	.zero	2
.LC294:
	ASCII(.string	"SH: slice_qp_delta" )
	.zero	5
.LC296:
	ASCII(.string	"SH: disable_deblocking_filter_idc" )
	.zero	6
.LC298:
	ASCII(.string	"disable_deblocking_filter_idc dec err\n" )
	.zero	1
.LC300:
	ASCII(.string	"SH: slice_alpha_c0_offset_div2" )
	.zero	1
.LC302:
	ASCII(.string	"slice_alpha_c0_offset_div2 dec err\n" )
	.zero	4
.LC304:
	ASCII(.string	"SH: slice_beta_offset_div2" )
	.zero	5
.LC306:
	ASCII(.string	"slice_beta_offset_div2 dec err\n" )
.LC308:
	ASCII(.string	"pH264Ctx->pCurrNal->nal_bitoffset = %d; code_len_byte = %d; bitstream_length = %d; pH264Ctx->pCurrNal->nal_trail_zero_bit_num = %d\n" )
	.zero	4
.LC310:
	ASCII(.string	"stream[%d]: bitsoffset = %d; valid_bitlen = %d; bytespos = %x\n" )
	.zero	1
.LC312:
	ASCII(.string	"nal_segment = %d is not expected value\n" )
.LC314:
	ASCII(.string	"stream[%d]: bitsoffset = %d; valid_bitlen = %d\n" )
.LC319:
	ASCII(.string	"   : delta_sl   " )
	.zero	7
.LC324:
	ASCII(.string	"PPS: entropy_coding_mode_flag" )
	.zero	2
.LC326:
	ASCII(.string	"PPS: pic_order_present_flag" )
	.zero	4
.LC328:
	ASCII(.string	"PPS: num_slice_groups_minus1" )
	.zero	3
.LC330:
	ASCII(.string	"Baseline stream with FMO, not support.\n" )
.LC333:
	ASCII(.string	"PPS: num_ref_idx_l0_active_minus1" )
	.zero	6
.LC335:
	ASCII(.string	"num_ref_idx_l0_active_minus1 out of range.\n" )
	.zero	4
.LC337:
	ASCII(.string	"PPS: num_ref_idx_l1_active_minus1" )
	.zero	6
.LC339:
	ASCII(.string	"num_ref_idx_l1_active_minus1 out of range.\n" )
	.zero	4
.LC341:
	ASCII(.string	"PPS: weighted prediction flag" )
	.zero	2
.LC343:
	ASCII(.string	"PPS: weighted_bipred_idc" )
	.zero	7
.LC345:
	ASCII(.string	"weighted_bipred_idc out of range\n" )
	.zero	6
.LC347:
	ASCII(.string	"PPS: pic_init_qp_minus26" )
	.zero	7
.LC349:
	ASCII(.string	"PPS: pic_init_qs_minus26" )
	.zero	7
.LC351:
	ASCII(.string	"PPS: chroma_qp_index_offset" )
	.zero	4
.LC353:
	ASCII(.string	"PPS: deblocking_filter_control_present_flag" )
	.zero	4
.LC355:
	ASCII(.string	"PPS: constrained_intra_pred_flag" )
	.zero	7
.LC357:
	ASCII(.string	"PPS: redundant_pic_cnt_present_flag" )
	.zero	4
.LC359:
	ASCII(.string	"redundant pic not support when find redundant slice later, exit\n" )
	.zero	7
.LC361:
	ASCII(.string	"PPS: transform_8x8_mode_flag" )
	.zero	3
.LC363:
	ASCII(.string	"PPS: pic_scaling_matrix_present_flag" )
	.zero	3
.LC365:
	ASCII(.string	"PPS: second_chroma_qp_index_offset" )
	.zero	5
.LC367:
	ASCII(.string	"SPS: seq_scaling_list_present_flag" )
	.zero	5
.LC370:
	ASCII(.string	"PPS: pic_scaling_list_present_flag" )
	.zero	5
.LC372:
	ASCII(.string	"second_chroma_qp_index_offset out of range.\n" )
	.zero	3
.LC376:
	ASCII(.string	"PPS: pic_parameter_set_id" )
	.zero	6
.LC378:
	ASCII(.string	"pic_parameter_set_id out of range.\n" )
	.zero	4
.LC381:
	ASCII(.string	"PPS: seq_parameter_set_id" )
	.zero	6
.LC383:
	ASCII(.string	"seq_parameter_set_id out of range.\n" )
	.zero	4
.LC385:
	ASCII(.string	"SPS haven't decode.\n" )
	.zero	3
.LC389:
	ASCII(.string	"%s: PPS decode error 1.\n" )
	.zero	7
.LC392:
	ASCII(.string	"%s: PPS decode error 2.\n" )
	.zero	7
.LC394:
	ASCII(.string	"VUI: aspect_ratio_info_present_flag" )
	.zero	4
.LC396:
	ASCII(.string	"VUI: aspect_ratio_idc" )
	.zero	2
.LC398:
	ASCII(.string	"VUI: sar_width" )
	.zero	1
.LC400:
	ASCII(.string	"VUI: sar_height" )
.LC402:
	ASCII(.string	"VUI: overscan_info_present_flag" )
.LC404:
	ASCII(.string	"VUI: overscan_appropriate_flag" )
	.zero	1
.LC406:
	ASCII(.string	"VUI: video_signal_type_present_flag" )
	.zero	4
.LC408:
	ASCII(.string	"VUI: video_format" )
	.zero	6
.LC410:
	ASCII(.string	"VUI: video_full_range_flag" )
	.zero	5
.LC412:
	ASCII(.string	"VUI: color_description_present_flag" )
	.zero	4
.LC414:
	ASCII(.string	"VUI: colour_primaries" )
	.zero	2
.LC416:
	ASCII(.string	"VUI: transfer_characteristics" )
	.zero	2
.LC418:
	ASCII(.string	"VUI: matrix_coefficients" )
	.zero	7
.LC420:
	ASCII(.string	"VUI: chroma_loc_info_present_flag" )
	.zero	6
.LC422:
	ASCII(.string	"VUI: chroma_sample_loc_type_top_field" )
	.zero	2
.LC424:
	ASCII(.string	"VUI: chroma_sample_loc_type_bottom_field" )
	.zero	7
.LC426:
	ASCII(.string	"VUI: timing_info_present_flag" )
	.zero	2
.LC428:
	ASCII(.string	"VUI: num_units_in_tick" )
	.zero	1
.LC430:
	ASCII(.string	"VUI: time_scale" )
.LC432:
	ASCII(.string	"VUI: fixed_frame_rate_flag" )
	.zero	5
.LC435:
	ASCII(.string	"VUI: nal_hrd_parameters_present_flag" )
	.zero	3
.LC437:
	ASCII(.string	"VUI: cpb_cnt_minus1" )
	.zero	4
.LC439:
	ASCII(.string	"VUI: bit_rate_scale" )
	.zero	4
.LC441:
	ASCII(.string	"VUI: cpb_size_scale" )
	.zero	4
.LC443:
	ASCII(.string	"hrd->cpb_cnt_minus1 out of range\n" )
	.zero	6
.LC445:
	ASCII(.string	"VUI: bit_rate_value_minus1" )
	.zero	5
.LC447:
	ASCII(.string	"VUI: cpb_size_value_minus1" )
	.zero	5
.LC449:
	ASCII(.string	"VUI: cbr_flag" )
	.zero	2
.LC451:
	ASCII(.string	"VUI: initial_cpb_removal_delay_length_minus1" )
	.zero	3
.LC453:
	ASCII(.string	"VUI: cpb_removal_delay_length_minus1" )
	.zero	3
.LC455:
	ASCII(.string	"VUI: dpb_output_delay_length_minus1" )
	.zero	4
.LC457:
	ASCII(.string	"VUI: time_offset_length" )
.LC459:
	ASCII(.string	"VUI: vcl_hrd_parameters_present_flag" )
	.zero	3
.LC461:
	ASCII(.string	"VUI: low_delay_hrd_flag" )
.LC463:
	ASCII(.string	"VUI: pic_struct_present_flag" )
	.zero	3
.LC465:
	ASCII(.string	"VUI: bitstream_restriction_flag" )
.LC467:
	ASCII(.string	"VUI: motion_vectors_over_pic_boundaries_flag" )
	.zero	3
.LC469:
	ASCII(.string	"VUI: max_bytes_per_pic_denom" )
	.zero	3
.LC471:
	ASCII(.string	"VUI: max_bits_per_mb_denom" )
	.zero	5
.LC473:
	ASCII(.string	"VUI: log2_max_mv_length_horizontal" )
	.zero	5
.LC475:
	ASCII(.string	"VUI: log2_max_mv_length_vertical" )
	.zero	7
.LC477:
	ASCII(.string	"VUI: num_reorder_frames" )
.LC479:
	ASCII(.string	"VUI: max_dec_frame_buffering" )
	.zero	3
.LC484:
	ASCII(.string	"dar=%d, final_dar=%d\n" )
	.zero	2
.LC490:
	ASCII(.string	"SPS: chroma_format_idc" )
	.zero	1
.LC492:
	ASCII(.string	"pSPS->chroma_format_idc = %d out of range.\n" )
	.zero	4
.LC494:
	ASCII(.string	"SPS: bit_depth_luma_minus8" )
	.zero	5
.LC496:
	ASCII(.string	"bit_depth_luma(%d) not equal 8.\n" )
	.zero	7
.LC499:
	ASCII(.string	"SPS: bit_depth_chroma_minus8" )
	.zero	3
.LC501:
	ASCII(.string	"bit_depth_chroma(%d) not equal 8.\n" )
	.zero	5
.LC503:
	ASCII(.string	"SPS: qpprime_y_zero_trans_bypass_flag" )
	.zero	2
.LC505:
	ASCII(.string	"qpprime_y_zero_trans_bypass_flag not equal 0.\n" )
	.zero	1
.LC507:
	ASCII(.string	"SPS: seq_scaling_matrix_present_flag" )
	.zero	3
.LC511:
	ASCII(.string	"SPS: log2_max_frame_num_minus4" )
	.zero	1
.LC513:
	ASCII(.string	"pSPS->log2_max_frame_num_minus4 out of range.\n" )
	.zero	1
.LC515:
	ASCII(.string	"SPS: pic_order_cnt_type" )
.LC517:
	ASCII(.string	"pSPS->pic_order_cnt_type out of range.\n" )
.LC519:
	ASCII(.string	"SPS: log2_max_pic_order_cnt_lsb_minus4" )
	.zero	1
.LC521:
	ASCII(.string	"pSPS->log2_max_pic_order_cnt_lsb_minus4 out of range.\n" )
	.zero	1
.LC523:
	ASCII(.string	"SPS: delta_pic_order_always_zero_flag" )
	.zero	2
.LC525:
	ASCII(.string	"SPS: offset_for_non_ref_pic" )
	.zero	4
.LC527:
	ASCII(.string	"SPS: offset_for_top_to_bottom_field" )
	.zero	4
.LC529:
	ASCII(.string	"SPS: num_ref_frames_in_pic_order_cnt_cycle" )
	.zero	5
.LC531:
	ASCII(.string	"pSPS->num_ref_frames_in_pic_order_cnt_cycle out of range.\n" )
	.zero	5
.LC533:
	ASCII(.string	"SPS: offset_for_ref_frame[i]" )
	.zero	3
.LC535:
	ASCII(.string	"SPS: gaps_in_frame_num_value_allowed_flag" )
	.zero	6
.LC537:
	ASCII(.string	"SPS: pic_width_in_mbs_minus1" )
	.zero	3
.LC539:
	ASCII(.string	"pSPS->pic_width_in_mbs_minus1 out of range(=%d).\n" )
	.zero	6
.LC541:
	ASCII(.string	"SPS: pic_height_in_map_units_minus1" )
	.zero	4
.LC543:
	ASCII(.string	"SPS: frame_mbs_only_flag" )
	.zero	7
.LC545:
	ASCII(.string	"pSPS->pic_height_in_map_units_minus1 out of range.\n" )
	.zero	4
.LC547:
	ASCII(.string	"pic size too large.\n" )
	.zero	3
.LC550:
	ASCII(.string	"level_idc %d not support.\n" )
	.zero	5
.LC552:
	ASCII(.string	"dpb size according level : %d\n" )
	.zero	1
.LC554:
	ASCII(.string	"pSPS->num_ref_frames(%d) > DPB size(%d), try to select the reasonable one.\n" )
	.zero	4
.LC556:
	ASCII(.string	"SPS: direct_8x8_inference_flag" )
	.zero	1
.LC558:
	ASCII(.string	"SPS: frame_cropping_flag" )
	.zero	7
.LC560:
	ASCII(.string	"SPS: frame_cropping_rect_left_offset" )
	.zero	3
.LC562:
	ASCII(.string	"SPS: frame_cropping_rect_right_offset" )
	.zero	2
.LC564:
	ASCII(.string	"SPS: frame_cropping_rect_top_offset" )
	.zero	4
.LC566:
	ASCII(.string	"SPS: frame_cropping_rect_bottom_offset" )
	.zero	1
.LC568:
	ASCII(.string	"SPS: vui_parameters_present_flag" )
	.zero	7
.LC570:
	ASCII(.string	"max_dec_frame_buffering(%d) > MaxDpbSize(%d)\n" )
	.zero	2
.LC572:
	ASCII(.string	"SPS: num_ref_frames" )
	.zero	4
.LC574:
	ASCII(.string	"SPS: mb_adaptive_frame_field_flag" )
	.zero	6
.LC576:
	ASCII(.string	"SPS_SVC_EXT: inter_layer_deblocking_filter_control_present_flag" )
.LC578:
	ASCII(.string	"inter_layer_present_flag:%d!\n" )
	.zero	2
.LC580:
	ASCII(.string	"SPS_SVC_EXT: extended_spatial_scalability_idc" )
	.zero	2
.LC582:
	ASCII(.string	"spatial scalability not support!!\n" )
	.zero	5
.LC584:
	ASCII(.string	"SPS_SVC_EXT: chroma_phase_x_plus1_flag" )
	.zero	1
.LC586:
	ASCII(.string	"chroma_phase_x_plus1_flag:%d!!\n" )
.LC588:
	ASCII(.string	"SPS_SVC_EXT: chroma_phase_y_plus1" )
	.zero	6
.LC590:
	ASCII(.string	"chroma_phase_y_plus1:%d!\n" )
	.zero	6
.LC592:
	ASCII(.string	"SPS_SVC_EXT: seq_tcoeff_level_prediction_flag" )
	.zero	2
.LC594:
	ASCII(.string	"SPS_SVC_EXT: adaptive_tcoeff_level_prediction_flag" )
	.zero	5
.LC596:
	ASCII(.string	"adaptive_tcoeff_level_prediction_flag:%d!\n" )
	.zero	5
.LC598:
	ASCII(.string	"SPS_SVC_EXT: slice_header_restriction_flag" )
	.zero	5
.LC600:
	ASCII(.string	"slice_header_restriction_flag error:%d,%x,%d\n" )
	.zero	2
.LC602:
	ASCII(.string	"SPS: profile_idc" )
	.zero	7
.LC604:
	ASCII(.string	"SPS: constrained_set0_flag" )
	.zero	5
.LC606:
	ASCII(.string	"SPS: constrained_set1_flag" )
	.zero	5
.LC608:
	ASCII(.string	"SPS: constrained_set2_flag" )
	.zero	5
.LC610:
	ASCII(.string	"SPS: constrained_set3_flag" )
	.zero	5
.LC612:
	ASCII(.string	"SPS: reserved_zero_4bits" )
	.zero	7
.LC614:
	ASCII(.string	"SPS: level_idc" )
	.zero	1
.LC616:
	ASCII(.string	"SPS: seq_parameter_set_id" )
	.zero	6
.LC620:
	ASCII(.string	"Baseline stream, try to decode, exit when FMO occurred.\n" )
	.zero	7
.LC622:
	ASCII(.string	"EXTENDED stream, try to decode, exit when datapartition occurred.\n" )
	.zero	5
.LC624:
	ASCII(.string	"others High profile stream, try to decode, exit when high profile not support occurred.\n" )
	.zero	7
.LC626:
	ASCII(.string	"profile_idc = %5d error, try to decode as main profile.\n" )
	.zero	7
.LC628:
	ASCII(.string	"level_idc = %5d error, try to decode as level_idc %d.\n" )
	.zero	1
.LC631:
	ASCII(.string	"Line %d: SPS[%d] decode error.\n" )
.LC634:
	ASCII(.string	"svc ext error:\n" )
.LC637:
	ASCII(.string	"SEI: frame_packing_arrangement_id" )
	.zero	6
.LC639:
	ASCII(.string	"SEI: frame_packing_arrangement_cancel_flag" )
	.zero	5
.LC641:
	ASCII(.string	"SEI: frame_packing_arrangement_type" )
	.zero	4
.LC643:
	ASCII(.string	"SEI: quincunx_sampling_flag" )
	.zero	4
.LC645:
	ASCII(.string	"SEI: content_interpretation_type" )
	.zero	7
.LC647:
	ASCII(.string	"SEI: spatial_flipping_flag" )
	.zero	5
.LC649:
	ASCII(.string	"SEI: frame0_flipped_flag" )
	.zero	7
.LC651:
	ASCII(.string	"SEI: field_views_flag" )
	.zero	2
.LC653:
	ASCII(.string	"SEI: current_frame_is_frame0_flag" )
	.zero	6
.LC655:
	ASCII(.string	"SEI: frame0_self_contained_flag" )
.LC657:
	ASCII(.string	"SEI: frame1_self_contained_flag" )
.LC659:
	ASCII(.string	"SEI: frame0_grid_position_x" )
	.zero	4
.LC661:
	ASCII(.string	"SEI: frame0_grid_position_y" )
	.zero	4
.LC663:
	ASCII(.string	"SEI: frame1_grid_position_x" )
	.zero	4
.LC665:
	ASCII(.string	"SEI: frame1_grid_position_y" )
	.zero	4
.LC667:
	ASCII(.string	"SEI: frame_packing_arrangement_reserved_byte" )
	.zero	3
.LC669:
	ASCII(.string	"SEI: frame_packing_arrangement_repetition_period" )
	.zero	7
.LC671:
	ASCII(.string	"SEI: frame_packing_arrangement_extension_flag" )
	.zero	2
.LC673:
	ASCII(.string	"DecPicTimingSEI but SPS is invalid.\n" )
	.zero	3
.LC675:
	ASCII(.string	"SEI: cpb_removal_delay" )
	.zero	1
.LC677:
	ASCII(.string	"SEI: dpb_output_delay" )
	.zero	2
.LC680:
	ASCII(.string	"pic_struct" )
	.zero	5
.LC683:
	ASCII(.string	"SEI nal parse payload type error\n" )
	.zero	6
.LC685:
	ASCII(.string	"SEI nal dec payload type err\n" )
	.zero	2
.LC687:
	ASCII(.string	"SEI nal dec payloadSize err\n" )
	.zero	3
.LC690:
	ASCII(.string	"SEI_BUFFERING_PERIOD,offset = %d,payload_size = %d \n" )
	.zero	3
.LC693:
	ASCII(.string	"PassBytes err [%s][%d]\n" )
.LC695:
	ASCII(.string	"SEI_PIC_TIMING,offset = %d,payload_size = %d \n" )
	.zero	1
.LC697:
	ASCII(.string	"SEI_PAN_SCAN_RECT,offset = %d,payload_size = %d \n" )
	.zero	6
.LC699:
	ASCII(.string	"SEI_FILLER_PAYLOAD,offset = %d,payload_size = %d \n" )
	.zero	5
.LC701:
	ASCII(.string	"SEI_USER_DATA_REGISTERED_ITU_T_T35, offset = %d, payload_size = %d \n" )
	.zero	3
.LC703:
	ASCII(.string	"SEI_USER_DATA_UNREGISTERED, offset = %d, payload_size = %d \n" )
	.zero	3
.LC705:
	ASCII(.string	"SEI: itu_t_t35_country_code" )
	.zero	4
.LC707:
	ASCII(.string	"SEI: itu_t_t35_country_code_extension_byte" )
	.zero	5
.LC709:
	ASCII(.string	"SEI: itu_t_t35_provider_code" )
	.zero	3
.LC712:
	ASCII(.string	"len_tmp = %d cann't dec usrdata\n" )
	.zero	7
.LC714:
	ASCII(.string	"cann't dec usrdata\n" )
	.zero	4
.LC716:
	ASCII(.string	"%s, %d\n" )
.LC718:
	ASCII(.string	"SEI_RECOVERY_POINT,offset = %d,payload_size = %d \n" )
	.zero	5
.LC720:
	ASCII(.string	"SEI_DEC_REF_PIC_MARKING_REPETITION,offset = %d,payload_size = %d \n" )
	.zero	5
.LC722:
	ASCII(.string	"SEI_SPARE_PIC,offset = %d,payload_size = %d \n" )
	.zero	2
.LC724:
	ASCII(.string	"SEI_SCENE_INFO,offset = %d,payload_size = %d \n" )
	.zero	1
.LC726:
	ASCII(.string	"SEI_SUB_SEQ_INFO,offset = %d,payload_size = %d \n" )
	.zero	7
.LC728:
	ASCII(.string	"SEI_SUB_SEQ_LAYER_CHARACTERISTICS,offset = %d,payload_size = %d \n" )
	.zero	6
.LC730:
	ASCII(.string	"SEI_SUB_SEQ_CHARACTERISTICS,offset = %d,payload_size = %d \n" )
	.zero	4
.LC732:
	ASCII(.string	"SEI_FULL_FRAME_FREEZE,offset = %d,payload_size = %d \n" )
	.zero	2
.LC734:
	ASCII(.string	"SEI_FULL_FRAME_FREEZE_RELEASE,offset = %d,payload_size = %d \n" )
	.zero	2
.LC736:
	ASCII(.string	"SEI_FULL_FRAME_SNAPSHOT,offset = %d,payload_size = %d \n" )
.LC738:
	ASCII(.string	"SEI_PROGRESSIVE_REFINEMENT_SEGMENT_START,offset = %d,payload_size = %d \n" )
	.zero	7
.LC740:
	ASCII(.string	"SEI_PROGRESSIVE_REFINEMENT_SEGMENT_END,offset = %d,payload_size = %d \n" )
	.zero	1
.LC742:
	ASCII(.string	"SEI_MOTION_CONSTRAINED_SLICE_GROUP_SET,offset = %d,payload_size = %d \n" )
	.zero	1
.LC744:
	ASCII(.string	"SEI_FILM_GRAIN_CHARACTERISTICS,offset = %d,payload_size = %d \n" )
	.zero	1
.LC746:
	ASCII(.string	"SEI_DEBLOCKING_FILTER_DISPLAY_PREFERENCE,offset = %d,payload_size = %d \n" )
	.zero	7
.LC748:
	ASCII(.string	"SEI_STEREO_VIDEO_INFO,offset = %d,payload_size = %d \n" )
	.zero	2
.LC750:
	ASCII(.string	"too much usrdat, cann't dec SEI\n" )
	.zero	7
.LC754:
	ASCII(.string	"\nthe stream is error,len:%d\n" )
	.zero	3
.LC759:
	ASCII(.string	"\nSlice nal or IDR nal = %d\n" )
	.zero	4
.LC761:
	ASCII(.string	"sliceheader dec err\n" )
	.zero	3
.LC767:
	ASCII(.string	"H264 recycle image\n" )
	.zero	4
.LC769:
	ASCII(.string	"pH264Ctx is %p, pFrameStore is %p\n" )
	.zero	5
.LC771:
	ASCII(.string	"line; %d pstLogicFsImage is NULL!\n" )
	.zero	5
.LC773:
	ASCII(.string	"InsertVO err:%d, ClearAll\n" )
	.zero	5
.LC775:
	ASCII(.string	"H264.c line %d: frame para err(ret=%d), recycle image self\n" )
	.zero	4
.LC777:
	ASCII(.string	"line: %d pstLogicFsImage is NULL!\n" )
	.zero	5
.LC780:
	ASCII(.string	"%s:%d fs is null, return err\n" )
	.zero	2
.LC784:
	ASCII(.string	"[%s][%d] OutputFrmToVO return %d\n" )
	.zero	6
.LC789:
	ASCII(.string	"line %d: flush dpb return %d\n" )
	.zero	2
.LC791:
	ASCII(.string	"----------------- Imode -> %d ------------------\n" )
	.zero	6
.LC793:
	ASCII(.string	"I_MODE but first_mb_in_slice != 0\n" )
	.zero	5
.LC797:
	ASCII(.string	"Discard this B(poc=%d) befor P, is_ref_idc=%d.\n" )
.LC799:
	ASCII(.string	"***** VDM start, TotalPicNum=%d, pH264Ctx->CurrPic.structure=%d.\n" )
	.zero	6
.LC802:
	ASCII(.string	"DecVDM ERR\n" )
	.zero	4
.LC806:
	ASCII(.string	"%s:%d Metadata map failed\n" )
	.zero	5
.LC810:
	ASCII(.string	"%s:%d Metadata unmap failed\n" )
	.zero	3
.LC812:
	ASCII(.string	"*****[%s][%d],EL Codec can only dec EL stream in DV_DUAL_VES_IMP stream!!*****\n" )
.LC814:
	ASCII(.string	"***** VES Splitter: UNSUPPORT, HDR_capacity=%d*****\n" )
	.zero	3
.LC817:
	ASCII(.string	"%s, %d: DecVDM failed\n" )
	.zero	1
.LC821:
	ASCII(.string	"\n receive streambuff=%p; phy_addr=0x%x; bitstream_length=%d\n" )
	.zero	3
.LC823:
	ASCII(.string	"nal_release_err\n" )
	.zero	7
.LC825:
	ASCII(.string	"cann't find slot for current nal\n" )
	.zero	6
.LC828:
	ASCII(.string	"receive a zero packet\n" )
	.zero	1
.LC830:
	ASCII(.string	"clear all dec para\n" )
	.zero	4
.LC833:
	ASCII(.string	"[%s %d], pos is %d out of range\n" )
	.zero	7
.LC835:
	ASCII(.string	"line %d, get APC error, ret %d\n" )
.LC837:
	ASCII(.string	"InserFrmInDPB: cur pic struct = %d!\n" )
	.zero	3
.LC839:
	ASCII(.string	"CurrPic.state is 'EMPTY'\n" )
	.zero	6
.LC841:
	ASCII(.string	"StorePicInDPB return(%d) from L%d\n" )
	.zero	5
.LC844:
	ASCII(.string	"directoutput mode\n" )
	.zero	5
.LC846:
	ASCII(.string	"line: %d pImg is NULL!\n" )
.LC849:
	ASCII(.string	"line %d, REPORT_IFRAME_ERR\n" )
	.zero	4
.LC852:
	ASCII(.string	"line %d, return %d\n" )
	.zero	4
.LC854:
	ASCII(.string	"err(%d) > ref_thr(%d)\n" )
	.zero	1
.LC856:
	ASCII(.string	"marking return %d\n" )
	.zero	5
.LC858:
	ASCII(.string	"return value is unexpeced!\n" )
	.zero	4
.LC861:
	ASCII(.string	"line %d: pH264Ctx->DPB.size = %d, ref %d, ltref %d\n" )
	.zero	4
.LC864:
	ASCII(.string	"%s: pos(%d) = pre_pos, force return.\n" )
	.zero	2
.LC866:
	ASCII(.string	"FS_ALLOC_ERR, ClearAll\n" )
.LC869:
	ASCII(.string	"Can not new logic fs! ClearAll\n" )
.LC871:
	ASCII(.string	"GAP found while DPB is empty!\n" )
	.zero	1
.LC873:
	ASCII(.string	"frame num gap try to fill it \n" )
	.zero	1
.LC875:
	ASCII(.string	"CurrFrameNum = %d  UnusedShortTermFrameNum = %d\n" )
	.zero	7
.LC877:
	ASCII(.string	"cann't allocate frame store when gap find\n" )
	.zero	5
.LC879:
	ASCII(.string	"allocate frame store when gap find\n" )
	.zero	4
.LC881:
	ASCII(.string	"line %d: store gap pic err, ret=%d\n" )
	.zero	4
.LC885:
	ASCII(.string	"%s %d unknow error!!\n" )
	.zero	2
.LC887:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC890:
	ASCII(.string	"%s %d frame_store is null!!\n" )
	.zero	3
.LC893:
	ASCII(.string	"get back frm\n" )
	.zero	2
.LC896:
	ASCII(.string	"line %d: init dpb return %d\n" )
	.zero	3
.LC898:
	ASCII(.string	"mem arrange err, ClearAll\n" )
	.zero	5
.LC901:
	ASCII(.string	"line %d: frame gap(=%d) > dpb size(=%d)\n" )
	.zero	7
.LC903:
	ASCII(.string	"line %d: dec gap failed\n" )
	.zero	7
.LC905:
	ASCII(.string	"line %d: alloc framestore failed\n" )
	.zero	6
.LC907:
	ASCII(.string	"Chan:%d dec_pts: %lld\n" )
	.zero	1
.LC909:
	ASCII(.string	"Chan:%d dec_usertag: %lld\n" )
	.zero	5
.LC911:
	ASCII(.string	"%s %d NULL == pH264Ctx->CurrPic.frame_store!!\n" )
	.zero	1
.LC913:
	ASCII(.string	"%s set fs store type failed.\n" )
	.zero	2
.LC919:
	ASCII(.string	"Too many slice %d > MaxSliceNum %d, discrad this pic.\n" )
	.zero	1
.LC921:
	ASCII(.string	"Too many stream %d > MaxStreamThr %d, discrad this pic.\n" )
	.zero	7
.LC923:
	ASCII(.string	"init pic err, find next recover point or next valid sps, pps, or exit\n" )
	.zero	1
.LC925:
	ASCII(.string	"DecList error, ret=%d\n" )
	.zero	1
.LC927:
	ASCII(.string	"dec list err, cur pic poc %d.\n" )
	.zero	1
.LC930:
	ASCII(.string	"pH264Ctx->TotalNal = %d, type:%d\n" )
	.zero	6
.LC932:
	ASCII(.string	"stop i want\n" )
	.zero	3
.LC934:
	ASCII(.string	"svc_extension_flag error:priority_id:%d, pred_flag%d\n" )
	.zero	2
.LC936:
	ASCII(.string	"%d,%d,%d\n" )
	.zero	6
.LC938:
	ASCII(.string	"svc stream,nal_header:%x\n" )
	.zero	6
.LC941:
	ASCII(.string	"***** NAL: IDR/Slice, nal_unit_type=%d, TotalSlice=%d\n" )
	.zero	1
.LC943:
	ASCII(.string	"SliceCheck failed, clear current slice.\n" )
	.zero	7
.LC946:
	ASCII(.string	"***** NAL: PPS, nal_unit_type=%d, TotalPPS=%d\n" )
	.zero	1
.LC949:
	ASCII(.string	"%s: PPS decode error.\n" )
	.zero	1
.LC951:
	ASCII(.string	"***** NAL: SPS, nal_unit_type=%d, TotalSPS=%d\n" )
	.zero	1
.LC953:
	ASCII(.string	"SPS decode error.\n" )
	.zero	5
.LC955:
	ASCII(.string	"***** NAL: SEI, nal_unit_type=%d\n" )
	.zero	6
.LC957:
	ASCII(.string	"SEI decode error.\n" )
	.zero	5
.LC959:
	ASCII(.string	"***** NAL: AUD, nal_unit_type=%d\n" )
	.zero	6
.LC961:
	ASCII(.string	"***** NAL: EOSEQ, nal_unit_type=%d\n" )
	.zero	4
.LC963:
	ASCII(.string	"***** NAL: FILL, nal_unit_type=%d\n" )
	.zero	5
.LC965:
	ASCII(.string	"***** NAL: EOSTREAM, nal_unit_type=%d\n" )
	.zero	1
.LC967:
	ASCII(.string	"***** NAL: SPSEXT, nal_unit_type=%d\n" )
	.zero	3
.LC969:
	ASCII(.string	"***** NAL: AUX, nal_unit_type=%d\n" )
	.zero	6
.LC971:
	ASCII(.string	"***** NAL: EOPIC, nal_unit_type=%d\n" )
	.zero	4
.LC973:
	ASCII(.string	"***** NAL: UNSUPPORT, nal_unit_type=%d,nalu header:%x\n" )
	.zero	1
.LC975:
	ASCII(.string	"***** NAL: UNSUPPORT, nal_unit_type=%d\n" )
.LC985:
	ASCII(.string	"FindTrailZeros ERR\n" )
	.zero	4
.LC987:
	ASCII(.string	"H264_DecOneNal ERR\n" )
	.zero	4
.LC990:
	ASCII(.string	"VDMHAL_NULL_FUN_PRINT,L%d\n" )
	.zero	5
.LC992:
	ASCII(.string	"VDMDRV_GetUvMOSParam failed\n" )
	.zero	3
.LC994:
	ASCII(.string	"pH264Ctx->CurrPic.frame_store is null pointer\n" )
	.zero	1
.LC996:
	ASCII(.string	"store pic err, ret = %d\n" )
	.zero	7
.LC998:
	ASCII(.string	"imode nal store pic err, ret = %d\n" )
	.zero	5
.LC1000:
	ASCII(.string	"imode nal flush dpb err, ret = %d\n" )
	.zero	5
.LC1004:
	ASCII(.string	"CtbNumOneFrame=%d, SedEnd0=%d\n" )
	.bss
	.align	3
.LANCHOR3 = . + 0
.LANCHOR4 = . + 4352
	.type	pps_tmp.7155, %object
	.size	pps_tmp.7155, 2208
pps_tmp.7155:
	.zero	2208
	.type	sps_tmp.7305, %object
	.size	sps_tmp.7305, 4000
sps_tmp.7305:
	.zero	4000
	.type	TmpBuf, %object
	.size	TmpBuf, 68
TmpBuf:
	.zero	68
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
