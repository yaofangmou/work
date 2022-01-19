#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vp6.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	Vp6_Vfmw_DecodeBool
	.type	Vp6_Vfmw_DecodeBool, %function
Vp6_Vfmw_DecodeBool:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x1
	mov	x22, x0
	mov	x0, x30
	uxtb	w19, w2
	mov	w23, 0
	bl	_mcount
	ldp	w1, w20, [x21, 4]
	sub	w0, w1, #1
	mul	w19, w0, w19
	lsr	w19, w19, 8
	add	w19, w19, 1
	lsl	w0, w19, 16
	cmp	w20, w0
	bcc	.L2
	sub	w19, w1, w19
	sub	w20, w20, w0
	mov	w23, 1
.L2:
	cmp	w19, 127
	bhi	.L9
	ldr	w1, [x21, 12]
	b	.L6
	.p2align 3
.L5:
	cmp	w19, 127
	bhi	.L11
.L6:
	subs	w1, w1, #1
	lsl	w19, w19, 1
	lsl	w20, w20, 1
	bne	.L5
	mov	w1, 8
	mov	x0, x22
	bl	BsGet
	orr	w20, w20, w0
	cmp	w19, 127
	mov	w1, 8
	bls	.L6
.L11:
	str	w1, [x21, 12]
.L9:
	stp	w19, w20, [x21, 4]
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	Vp6_Vfmw_DecodeBool, .-Vp6_Vfmw_DecodeBool
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Vp6_Vfmw_DecodeBool128
	.type	Vp6_Vfmw_DecodeBool128, %function
Vp6_Vfmw_DecodeBool128:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x1
	mov	x22, x0
	mov	x0, x30
	bl	_mcount
	ldp	w20, w1, [x19, 4]
	ldr	w2, [x19, 12]
	add	w0, w20, 1
	lsr	w0, w0, 1
	lsl	w21, w0, 16
	cmp	w1, w21
	bcc	.L13
	sub	w0, w20, w0
	sub	w1, w1, w21
	lsl	w20, w0, 1
	lsl	w21, w1, 1
	mov	w23, 1
.L14:
	subs	w2, w2, #1
	bne	.L15
	mov	w1, 8
	mov	x0, x22
	bl	BsGet
	orr	w21, w21, w0
	mov	w2, 8
.L15:
	stp	w20, w21, [x19, 4]
	str	w2, [x19, 12]
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L13:
	lsl	w20, w0, 1
	lsl	w21, w1, 1
	mov	w23, 0
	b	.L14
	.size	Vp6_Vfmw_DecodeBool128, .-Vp6_Vfmw_DecodeBool128
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Vp6_Vfmw_BoolRead
	.type	Vp6_Vfmw_BoolRead, %function
Vp6_Vfmw_BoolRead:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w19, w2
	mov	x22, x1
	bl	_mcount
	mov	w20, 0
	subs	w19, w19, #1
	bmi	.L17
	.p2align 2
.L18:
	mov	x1, x22
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w19
	sub	w19, w19, #1
	orr	w20, w0, w20
	cmn	w19, #1
	bne	.L18
.L17:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	Vp6_Vfmw_BoolRead, .-Vp6_Vfmw_BoolRead
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Vp6_Vfmw_StartDecode
	.type	Vp6_Vfmw_StartDecode, %function
Vp6_Vfmw_StartDecode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	mov	w1, 255
	mov	w0, 8
	stp	wzr, w1, [x19]
	str	w0, [x19, 12]
	mov	w1, 24
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 8]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	Vp6_Vfmw_StartDecode, .-Vp6_Vfmw_StartDecode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_ArrangeVHBMem
	.type	VP6_ArrangeVHBMem, %function
VP6_ArrangeVHBMem:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 12288
	bl	_mcount
	ldr	x3, .LC0
	mov	x2, 36
	mov	w1, 0
	add	x0, x29, 40
	ldr	x3, [x3, 96]
	blr	x3
	ldr	w4, [x19, 12576]
	mov	w3, 3
	ldr	w5, [x19, 12580]
	mov	w7, 10
	ldr	x6, [x19]
	lsl	w4, w4, 4
	lsl	w5, w5, 4
	ldr	w0, [x19, 13344]
	stp	w5, w4, [x29, 56]
	stp	w5, w4, [x29, 48]
	ldr	w8, [x6, 16]
	mov	w2, 0
	add	x1, x29, 40
	str	w7, [x29, 40]
	cmp	w8, 24
	csinc	w5, w3, wzr, ne
	str	w5, [x29, 64]
	mov	w5, 8
	strb	w5, [x29, 45]
	ldr	w4, [x6, 16]
	cmp	w4, 24
	csinc	w3, w3, wzr, ne
	str	w3, [x29, 68]
	bl	FSP_ArrangeFsPool
	cmp	w0, 2
	beq	.L30
	cbnz	w0, .L31
	mov	w0, 1
	str	w0, [x19, 320]
.L26:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L31:
	ldr	x3, .LC1
	mov	w1, 429
	ldr	x2, .LC3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L30:
	add	x0, x20, 448
	bl	ResetVoQueue
	mov	w0, 0
	b	.L26
	.size	VP6_ArrangeVHBMem, .-VP6_ArrangeVHBMem
	.align	3
.LC0:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1:
	.xword	.LANCHOR0
	.align	3
.LC3:
	.xword	.LC2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_GetImageBuffer
	.type	VP6_GetImageBuffer, %function
VP6_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 304
	bl	_mcount
	mov	w1, -1
	ldrb	w0, [x19, 20]
	str	w1, [x19, 28]
	cmp	w0, 3
	beq	.L38
	ldr	w0, [x20, 13344]
	mov	w1, 1
	bl	FSP_NewLogicFs
	mov	w3, w0
	str	w0, [x19, 28]
.L35:
	tbnz	w3, #31, .L39
.L36:
	ldr	x2, .LC7
	mov	w1, 473
	mov	w0, 16
	bl	dprint_normal
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L38:
	ldr	w1, [x19, 36]
	ldr	w0, [x20, 13344]
	bl	FSP_LinkLogicFs
	cbz	x0, .L40
	ldr	w3, [x0, 4]
	str	w3, [x19, 28]
	tbz	w3, #31, .L36
.L39:
	ldr	x2, .LC5
	mov	w1, 465
	mov	w0, 0
	bl	dprint_normal
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 13344]
	bl	FSP_ClearLogicFs
	ldr	w1, [x19, 36]
	ldr	w0, [x20, 13344]
	bl	FSP_ClearLogicFs
	ldr	w0, [x20, 13344]
	bl	FSP_GetNullLogicFs
	str	wzr, [x19, 12]
	stp	w0, w0, [x19, 32]
	add	x1, x20, 12288
	ldr	w0, [x20, 13344]
	add	x1, x1, 448
	bl	FSP_ClearNotInVoQueue
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L40:
	ldr	w3, [x19, 28]
	b	.L35
	.size	VP6_GetImageBuffer, .-VP6_GetImageBuffer
	.align	3
.LC5:
	.xword	.LC4
	.align	3
.LC7:
	.xword	.LC6
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_InitFrameInfo
	.type	VP6_InitFrameInfo, %function
VP6_InitFrameInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 332]
	mov	w2, 1
	ldr	w0, [x19, 13344]
	bl	FSP_SetRef
	ldr	w1, [x19, 332]
	ldr	w0, [x19, 13344]
	bl	FSP_GetFsImagePtr
	mov	x3, x0
	cbz	x0, .L44
	ldr	x4, [x19]
	mov	x5, -1
	ldr	x2, .LC11
	mov	w1, 504
	mov	w0, 24
	ldr	x4, [x4, 32]
	str	x4, [x3, 208]
	ldr	x4, [x19]
	ldr	x4, [x4, 48]
	str	x4, [x3, 216]
	ldr	x4, [x19]
	ldr	x4, [x4, 64]
	str	x4, [x3, 224]
	ldr	x4, [x19]
	ldr	w4, [x4, 80]
	str	w4, [x3]
	ldr	x4, [x19]
	ldr	w4, [x4, 84]
	str	w4, [x3, 4]
	ldr	x4, [x19]
	ldr	w4, [x4, 88]
	str	w4, [x3, 8]
	ldr	x4, [x19]
	ldr	w4, [x4, 104]
	str	w4, [x3, 12]
	str	wzr, [x3, 20]
	ldr	x4, [x19]
	str	x5, [x4, 32]
	ldr	x4, [x3, 216]
	ldr	x3, [x3, 208]
	bl	dprint_normal
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L44:
	ldr	x2, .LC9
	mov	w1, 490
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VP6_InitFrameInfo, .-VP6_InitFrameInfo
	.align	3
.LC9:
	.xword	.LC8
	.align	3
.LC11:
	.xword	.LC10
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6DEC_GetImageBuffer
	.type	VP6DEC_GetImageBuffer, %function
VP6DEC_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x20, 13344]
	bl	FSP_IsNewFsAvailable
	cmp	w0, 1
	beq	.L47
	cmn	w0, #1
	mov	w19, 0
	beq	.L49
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L47:
	mov	w19, w0
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L49:
	add	x1, x20, 12288
	ldr	w0, [x20, 13344]
	add	x1, x1, 448
	bl	FSP_ClearNotInVoQueue
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VP6DEC_GetImageBuffer, .-VP6DEC_GetImageBuffer
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_BuildScanOrder
	.type	VP6_BuildScanOrder, %function
VP6_BuildScanOrder:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	mov	w5, 1
	strb	wzr, [x19, 1004]
	mov	w4, 0
	add	x6, x19, 1133
	.p2align 2
.L51:
	mov	x2, x6
	mov	w0, 1
	b	.L53
	.p2align 3
.L52:
	add	w0, w0, 1
	cmp	w0, 64
	beq	.L61
.L53:
	ldrb	w3, [x2]
	add	x2, x2, 1
	cmp	w3, w4
	bne	.L52
	add	x3, x19, x5, uxtw
	add	w5, w5, 1
	strb	w0, [x3, 1004]
	add	w0, w0, 1
	cmp	w0, 64
	bne	.L53
.L61:
	add	w4, w4, 1
	cmp	w4, 16
	bne	.L51
	add	x8, x19, 64
	mov	x7, x19
	.p2align 2
.L54:
	mov	w6, w19
	sub	w5, w7, w19
	mov	x0, x19
	mov	w2, 0
	.p2align 2
.L55:
	ldrb	w3, [x0, 1004]
	add	x0, x0, 1
	sub	w4, w0, w6
	cmp	w2, w3
	csel	w2, w2, w3, cs
	cmp	w4, w5
	bls	.L55
	uxtb	w2, w2
	strb	w2, [x7, 1068]
	ldr	w0, [x20, 12]
	cmp	w0, 6
	bls	.L56
	add	w2, w2, 1
	strb	w2, [x7, 1068]
.L56:
	add	x7, x7, 1
	cmp	x8, x7
	bne	.L54
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VP6_BuildScanOrder, .-VP6_BuildScanOrder
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_BuildModeTree
	.type	VP6_BuildModeTree, %function
VP6_BuildModeTree:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x15, x19, 88
	add	x16, x19, 10
	mov	x13, x19
	add	x8, x29, 104
	add	x14, x19, 60
	.p2align 2
.L63:
	sub	w7, w13, w19
	mov	x5, x19
	mov	x6, x15
	mov	x12, x13
	mov	x11, x13
.L69:
	mov	x1, 0
	mov	w4, 0
	.p2align 2
.L66:
	cmp	w7, w1
	add	x0, x5, x1
	beq	.L71
	ldrb	w0, [x0, 448]
	lsl	w2, w0, 2
	sub	w2, w2, w0
	lsl	w3, w2, 5
	add	w2, w2, w3
	add	w0, w2, w0
	str	w0, [x8, x1, lsl 2]
.L65:
	add	x1, x1, 1
	add	w4, w4, w0
	cmp	x1, 10
	bne	.L66
	ldrb	w23, [x11, 458]
	add	w4, w4, 1
	ldp	w22, w2, [x29, 104]
	ldp	w1, w21, [x29, 112]
	ldp	w10, w20, [x29, 120]
	ldrb	w24, [x11, 448]
	add	w1, w22, w1
	add	w10, w21, w10
	lsl	w26, w23, 8
	add	w3, w23, 1
	add	w0, w1, w10
	sub	w26, w26, w23
	add	w3, w3, w24
	ldp	w17, w18, [x29, 128]
	lsl	w23, w0, 8
	lsl	w27, w1, 8
	ldp	w30, w9, [x29, 136]
	sub	w23, w23, w0
	sub	w27, w27, w1
	sdiv	w3, w26, w3
	add	w0, w0, 1
	lsl	w26, w22, 8
	add	w17, w20, w17
	add	w18, w2, w18
	sub	w22, w26, w22
	lsl	w26, w2, 8
	add	w9, w30, w9
	lsl	w28, w18, 8
	sub	w26, w26, w2
	lsl	w2, w17, 8
	add	w25, w18, 1
	add	w24, w17, 1
	sub	w18, w28, w18
	lsl	w28, w21, 8
	add	w1, w1, 1
	sub	w21, w28, w21
	add	w10, w10, 1
	udiv	w27, w27, w0
	lsl	w0, w20, 8
	sub	w20, w0, w20
	add	w28, w9, w24
	mvn	w3, w3
	add	x5, x5, 20
	strb	w3, [x12, 48]
	add	w27, w27, 1
	cmp	x14, x5
	strb	w27, [x6, 1]
	add	x11, x11, 20
	add	x12, x12, 10
	add	x6, x6, 90
	udiv	w4, w23, w4
	add	w23, w9, w17
	sub	w17, w2, w17
	lsl	w2, w30, 8
	add	w23, w23, w25
	add	w9, w9, 1
	sub	w2, w2, w30
	add	w4, w4, 1
	strb	w4, [x6, -90]
	udiv	w24, w20, w24
	add	w0, w24, 1
	strb	w0, [x6, -83]
	udiv	w18, w18, w23
	add	w18, w18, 1
	strb	w18, [x6, -88]
	udiv	w1, w22, w1
	add	w1, w1, 1
	strb	w1, [x6, -87]
	udiv	w10, w21, w10
	add	w10, w10, 1
	strb	w10, [x6, -86]
	udiv	w25, w26, w25
	add	w25, w25, 1
	strb	w25, [x6, -85]
	udiv	w17, w17, w28
	add	w17, w17, 1
	strb	w17, [x6, -84]
	udiv	w2, w2, w9
	add	w0, w2, 1
	strb	w0, [x6, -82]
	bne	.L69
	add	x13, x13, 1
	add	x15, x15, 9
	cmp	x16, x13
	bne	.L63
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
.L71:
	str	wzr, [x8, x1, lsl 2]
	mov	w0, 0
	b	.L65
	.size	VP6_BuildModeTree, .-VP6_BuildModeTree
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_ConfigureContexts
	.type	VP6_ConfigureContexts, %function
VP6_ConfigureContexts:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x16, .LC16
	add	x4, x19, 1196
	mov	w11, 0
	mov	w9, 255
.L73:
	lsl	w12, w11, 2
	add	x10, x16, 24
	sub	w12, w12, w11
	lsl	w13, w11, 1
	add	w14, w12, 5
	neg	w15, w11, lsl 1
	mov	w7, 0
	mov	w5, 133
	mov	w0, 122
	add	w12, w12, 11
	add	w8, w11, 5
.L79:
	add	x3, x10, 28
	add	w17, w7, w13
	mov	w2, w11
	b	.L77
	.p2align 3
.L74:
	ldr	w0, [x3, -4]
	ldr	w5, [x3], 24
.L77:
	add	x1, x19, x2, uxtw
	add	w6, w17, w2
	add	w2, w2, 1
	ldrb	w1, [x1, 558]
	mul	w0, w1, w0
	add	w0, w0, 128
	add	w0, w5, w0, asr 8
	cmp	w0, 255
	csel	w0, w0, w9, le
	cmp	w0, wzr
	csinc	w0, w0, wzr, gt
	cmp	w8, w2
	strb	w0, [x4, x6]
	bne	.L74
	add	w0, w14, w7
	add	w3, w12, w7
	sub	w2, w15, w7
	.p2align 2
.L75:
	add	w1, w2, w0
	add	x1, x19, x1
	ldrb	w1, [x1, 558]
	strb	w1, [x4, w0, uxtw]
	add	w0, w0, 1
	cmp	w3, w0
	bne	.L75
	add	w7, w7, 11
	add	x10, x10, 8
	cmp	w7, 33
	beq	.L76
	ldp	w0, w5, [x10]
	b	.L79
	.p2align 3
.L76:
	add	w11, w11, 11
	cmp	w11, 22
	bne	.L73
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VP6_ConfigureContexts, .-VP6_ConfigureContexts
	.align	3
.LC16:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_ConfigureEntropyDecoder
	.type	VP6_ConfigureEntropyDecoder, %function
VP6_ConfigureEntropyDecoder:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x23, x0
	mov	x0, x30
	mov	x19, x2
	mov	x21, x1
	mov	w26, w3
	str	x2, [x29, 96]
	bl	_mcount
	add	x25, x29, 144
	ldr	x3, .LC23
	mov	x2, 11
	mov	w1, 128
	mov	x0, x25
	mov	x22, 0
	add	x20, x19, 72
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x0, .LC24
	mov	w2, 146
	add	x24, x0, 144
.L82:
	mov	x1, x20
	mov	x0, x21
	mov	x19, 0
	str	w22, [x29, 136]
	bl	Vp6_Vfmw_DecodeBool
	cbz	w0, .L83
.L126:
	mov	w28, 0
	mov	w27, 6
	.p2align 2
.L84:
	mov	x1, x20
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w27
	sub	w27, w27, #1
	orr	w28, w0, w28
	cmn	w27, #1
	bne	.L84
	ldr	w0, [x29, 136]
	ubfiz	w3, w28, 1, 7
	cmp	w3, wzr
	add	w1, w0, w19
	csinc	w3, w3, w3, ne
	add	x1, x23, x1
	uxtb	w0, w3
	strb	w0, [x25, x19]
	strb	w0, [x1, 558]
.L85:
	add	x19, x19, 1
	cmp	x19, 11
	beq	.L125
.L86:
	add	x0, x24, x22
	mov	x1, x20
	ldrb	w2, [x0, x19]
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool
	cbnz	w0, .L126
.L83:
	cbnz	w26, .L85
	ldr	w0, [x29, 136]
	ldrb	w1, [x25, x19]
	add	w0, w0, w19
	add	x19, x19, 1
	add	x0, x23, x0
	cmp	x19, 11
	strb	w1, [x0, 558]
	bne	.L86
.L125:
	add	x22, x22, 11
	cmp	x22, 22
	beq	.L87
	ldrb	w2, [x22, x24]
	b	.L82
.L87:
	cbnz	w26, .L89
	ldr	x0, .LC23
	mov	x2, 28
	ldr	x3, [x0, 104]
	ldr	x0, .LC24
	add	x1, x0, 168
	add	x0, x23, 580
	blr	x3
.L89:
	mov	x1, x20
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool128
	cbz	w0, .L90
	ldr	x0, .LC24
	add	x22, x23, 1133
	mov	w2, 132
	add	x19, x0, 202
	add	x24, x0, 264
	.p2align 2
.L94:
	mov	x1, x20
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool
	cbz	w0, .L91
	mov	w28, 0
	mov	w27, 3
.L92:
	mov	x1, x20
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w27
	sub	w27, w27, #1
	orr	w28, w0, w28
	cmn	w27, #1
	bne	.L92
	strb	w28, [x22]
.L91:
	cmp	x24, x19
	add	x22, x22, 1
	beq	.L93
	ldrb	w2, [x19], 1
	b	.L94
.L93:
	ldr	x1, [x29, 96]
	mov	x0, x23
	bl	VP6_BuildScanOrder
.L90:
	ldr	x0, .LC24
	mov	x22, 0
	mov	w2, 219
	add	x24, x0, 264
.L95:
	mov	x19, 0
	.p2align 2
.L101:
	mov	x1, x20
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool
	cbz	w0, .L96
	mov	w28, 0
	mov	w27, 6
	.p2align 2
.L97:
	mov	x1, x20
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w27
	sub	w27, w27, #1
	orr	w28, w0, w28
	cmn	w27, #1
	bne	.L97
	add	x0, x19, x22
	ubfiz	w2, w28, 1, 7
	add	x0, x23, x0
	cmp	w2, wzr
	csinc	w2, w2, w2, ne
	strb	w2, [x0, 580]
.L96:
	add	x19, x19, 1
	cmp	x19, 14
	beq	.L127
	add	x0, x24, x22
	ldrb	w2, [x0, x19]
	b	.L101
.L127:
	add	x22, x22, 14
	cmp	x22, 28
	beq	.L128
	ldrb	w2, [x22, x24]
	b	.L95
.L128:
	ldr	x0, .LC24
	mov	w2, 227
	str	wzr, [x29, 128]
	add	x0, x0, 296
	str	x0, [x29, 112]
.L100:
	ldr	w0, [x29, 128]
	str	w0, [x29, 132]
	add	w1, w0, 198
	ldr	x0, [x29, 112]
	str	w1, [x29, 108]
	str	x0, [x29, 120]
.L111:
	ldr	x22, [x29, 120]
	str	xzr, [x29, 136]
	.p2align 2
.L109:
	ldp	w0, w1, [x29, 132]
	mov	x19, 0
	add	w24, w0, w1
	mov	x1, x20
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool
	cbz	w0, .L102
	.p2align 2
.L130:
	mov	w28, 0
	mov	w27, 6
	.p2align 2
.L103:
	mov	x1, x20
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w27
	sub	w27, w27, #1
	orr	w28, w0, w28
	cmn	w27, #1
	bne	.L103
	ubfiz	w3, w28, 1, 7
	add	w1, w24, w19
	cmp	w3, wzr
	add	x1, x23, x1
	csinc	w3, w3, w3, ne
	uxtb	w0, w3
	strb	w0, [x25, x19]
	strb	w0, [x1, 608]
.L104:
	add	x19, x19, 1
	cmp	x19, 11
	beq	.L129
.L105:
	ldrb	w2, [x22, x19]
	mov	x1, x20
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool
	cbnz	w0, .L130
.L102:
	cbnz	w26, .L104
	add	w0, w24, w19
	ldrb	w1, [x25, x19]
	add	x0, x23, x0
	add	x19, x19, 1
	cmp	x19, 11
	strb	w1, [x0, 608]
	bne	.L105
.L129:
	ldr	x0, [x29, 136]
	add	x22, x22, 11
	add	x0, x0, 11
	str	x0, [x29, 136]
	cmp	x0, 66
	beq	.L106
	ldrb	w2, [x22]
	b	.L109
.L106:
	ldr	x0, [x29, 120]
	ldr	w2, [x29, 108]
	ldr	w1, [x29, 132]
	add	x0, x0, 66
	str	x0, [x29, 120]
	cmp	w1, w2
	beq	.L108
	ldrb	w2, [x0]
	add	w0, w1, 198
	str	w0, [x29, 132]
	b	.L111
.L108:
	ldr	w0, [x29, 128]
	ldr	x1, [x29, 112]
	add	w0, w0, 66
	str	w0, [x29, 128]
	add	x1, x1, 132
	cmp	w0, 198
	str	x1, [x29, 112]
	beq	.L110
	ldrb	w2, [x1]
	b	.L100
.L110:
	ldr	x1, [x29, 96]
	mov	x0, x23
	bl	VP6_ConfigureContexts
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	ret
	.size	VP6_ConfigureEntropyDecoder, .-VP6_ConfigureEntropyDecoder
	.align	3
.LC23:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC24:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_decodeModeDiff
	.type	VP6_decodeModeDiff, %function
VP6_decodeModeDiff:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	add	x19, x1, 72
	bl	_mcount
	mov	w2, -51
	mov	x1, x19
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool
	cbnz	w0, .L141
	mov	w0, 0
.L132:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L141:
	mov	x1, x19
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool128
	neg	w22, w0, lsl 1
	mov	w2, -85
	mov	x1, x19
	mov	x0, x21
	add	w22, w22, 1
	bl	Vp6_Vfmw_DecodeBool
	cbz	w0, .L142
	mov	w2, -57
	mov	x1, x19
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool
	cbz	w0, .L143
	mov	w23, 0
	mov	w20, 6
	.p2align 2
.L138:
	mov	x1, x19
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w20
	sub	w20, w20, #1
	orr	w23, w0, w23
	cmn	w20, #1
	bne	.L138
	mul	w0, w22, w23
	ldp	x19, x20, [sp, 16]
	lsl	w0, w0, 2
	ldr	x23, [sp, 48]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L143:
	mov	w2, -116
	mov	x1, x19
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool
	cbz	w0, .L135
	lsl	w0, w22, 2
	sub	w0, w0, w22
	lsl	w0, w0, 2
	b	.L132
	.p2align 3
.L142:
	mov	x1, x19
	mov	w2, 83
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool
	ldr	x23, [sp, 48]
	mov	w1, 3
	sub	w0, w1, w0
	lsl	w0, w22, w0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L135:
	mov	w2, 125
	mov	x1, x19
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool
	cbz	w0, .L136
	lsl	w0, w22, 4
	b	.L132
.L136:
	mov	w2, 104
	mov	x1, x19
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool
	cbz	w0, .L137
	lsl	w0, w22, 4
	add	w0, w0, w22, lsl 2
	b	.L132
.L137:
	lsl	w0, w22, 2
	sub	w0, w0, w22
	lsl	w0, w0, 3
	b	.L132
	.size	VP6_decodeModeDiff, .-VP6_decodeModeDiff
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_DecodeModeProbs
	.type	VP6_DecodeModeProbs, %function
VP6_DecodeModeProbs:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x27, x0
	mov	x0, x30
	mov	x21, x2
	mov	x19, x1
	bl	_mcount
	ldr	x26, .LC27
	add	x23, x21, 72
	add	x20, x27, 468
	add	x0, x26, 696
	add	x25, x27, 458
	mov	x24, 0
	mov	w28, 20
	str	x0, [x29, 104]
.L151:
	mov	w2, -82
	mov	x1, x23
	mov	x0, x19
	bl	Vp6_Vfmw_DecodeBool
	cbz	w0, .L150
	mov	w22, 0
	mov	w26, 3
.L148:
	mov	x1, x23
	mov	x0, x19
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w26
	sub	w26, w26, #1
	orr	w22, w0, w22
	cmn	w26, #1
	bne	.L148
	smaddl	x0, w22, w28, x24
	ldr	x2, [x29, 104]
	mov	x1, x25
	add	x0, x2, x0
	.p2align 2
.L149:
	add	x1, x1, 1
	ldrb	w2, [x0]
	add	x0, x0, 2
	cmp	x20, x1
	strb	w2, [x1, -1]
	ldrb	w2, [x0, -1]
	strb	w2, [x1, -11]
	bne	.L149
.L150:
	mov	w2, -2
	mov	x1, x23
	mov	x0, x19
	bl	Vp6_Vfmw_DecodeBool
	cbz	w0, .L147
	mov	x26, x25
	mov	w22, 255
	b	.L146
	.p2align 3
.L164:
	cmp	w0, 255
	mov	x1, x21
	csel	w0, w0, w22, le
	uxtb	w0, w0
	strb	w0, [x26]
	mov	x0, x19
	bl	VP6_decodeModeDiff
	ldrb	w1, [x26, -10]
	adds	w0, w1, w0
	bmi	.L157
.L165:
	cmp	w0, 255
	add	x26, x26, 1
	csel	w0, w0, w22, le
	uxtb	w0, w0
	strb	w0, [x26, -11]
	cmp	x26, x20
	beq	.L147
.L146:
	mov	x1, x21
	mov	x0, x19
	bl	VP6_decodeModeDiff
	ldrb	w1, [x26]
	adds	w0, w1, w0
	bpl	.L164
	mov	w0, 0
	mov	x1, x21
	strb	w0, [x26]
	mov	x0, x19
	bl	VP6_decodeModeDiff
	ldrb	w1, [x26, -10]
	adds	w0, w1, w0
	bpl	.L165
.L157:
	mov	w0, 0
	add	x26, x26, 1
	strb	w0, [x26, -11]
	cmp	x26, x20
	bne	.L146
	.p2align 2
.L147:
	add	x24, x24, 320
	add	x20, x20, 20
	cmp	x24, 960
	add	x25, x25, 20
	bne	.L151
	mov	x1, x21
	mov	x0, x27
	bl	VP6_BuildModeTree
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.size	VP6_DecodeModeProbs, .-VP6_DecodeModeProbs
	.align	3
.LC27:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_ConfigureMvEntropyDecoder
	.type	VP6_ConfigureMvEntropyDecoder, %function
VP6_ConfigureMvEntropyDecoder:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x25, x0
	mov	x0, x30
	mov	x20, x2
	mov	x21, x1
	bl	_mcount
	add	x20, x20, 72
	ldr	x0, .LC30
	add	x22, x25, 44
	add	x26, x25, 46
	mov	w28, 246
	add	x23, x0, 1673
	mov	w2, 237
	mov	w27, 1
.L179:
	mov	x1, x20
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool
	cbz	w0, .L168
	mov	w24, 0
	mov	w19, 6
	.p2align 2
.L169:
	mov	x1, x20
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w19
	sub	w19, w19, #1
	orr	w24, w0, w24
	cmn	w19, #1
	bne	.L169
	ubfiz	w2, w24, 1, 7
	tst	w2, 254
	beq	.L170
	strb	w2, [x22, 2]
.L168:
	mov	w2, w28
	mov	x1, x20
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool
	cbz	w0, .L173
	mov	w28, 0
	mov	w19, 6
	.p2align 2
.L174:
	mov	x1, x20
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w19
	sub	w19, w19, #1
	orr	w28, w0, w28
	cmn	w19, #1
	bne	.L174
	ubfiz	w28, w28, 1, 7
	tst	w28, 254
	beq	.L175
	strb	w28, [x22]
.L173:
	add	x22, x22, 1
	cmp	x22, x26
	beq	.L201
	ldrb	w2, [x23]
	add	x23, x23, 17
	ldrb	w28, [x23, -16]
	b	.L179
	.p2align 3
.L201:
	ldr	x0, .LC30
	add	x23, x25, 7
	mov	w2, 253
	mov	w27, 1
	add	x26, x0, 1659
	add	x0, x25, 21
	str	x0, [x29, 104]
.L178:
	sub	x19, x23, #7
	mov	x22, x26
	.p2align 2
.L188:
	mov	x1, x20
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool
	cbz	w0, .L181
	mov	w28, 0
	mov	w24, 6
	.p2align 2
.L182:
	mov	x1, x20
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w24
	sub	w24, w24, #1
	orr	w28, w0, w28
	cmn	w24, #1
	bne	.L182
	ubfiz	w3, w28, 1, 7
	tst	w3, 254
	beq	.L183
	strb	w3, [x19, 528]
.L181:
	add	x19, x19, 1
	cmp	x19, x23
	beq	.L202
.L185:
	ldrb	w2, [x22], 1
	b	.L188
	.p2align 3
.L183:
	strb	w27, [x19, 528]
	add	x19, x19, 1
	cmp	x19, x23
	bne	.L185
.L202:
	ldr	x0, [x29, 104]
	add	x23, x19, 7
	add	x26, x26, 17
	cmp	x23, x0
	beq	.L203
	ldrb	w2, [x26, -1]
	b	.L178
	.p2align 3
.L203:
	ldr	x0, .LC30
	add	x27, x25, 8
	mov	w2, 254
	add	x25, x25, 24
	add	x24, x0, 1666
	mov	w28, 1
.L187:
	sub	x23, x27, #8
	mov	x26, x24
	.p2align 2
.L196:
	mov	x1, x20
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool
	cbz	w0, .L190
	mov	w22, 0
	mov	w19, 6
	.p2align 2
.L191:
	mov	x1, x20
	mov	x0, x21
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w19
	sub	w19, w19, #1
	orr	w22, w0, w22
	cmn	w19, #1
	bne	.L191
	ubfiz	w22, w22, 1, 7
	tst	w22, 254
	beq	.L192
	strb	w22, [x23, 542]
.L190:
	add	x23, x23, 1
	cmp	x23, x27
	beq	.L204
.L194:
	ldrb	w2, [x26], 1
	b	.L196
	.p2align 3
.L192:
	strb	w28, [x23, 542]
	add	x23, x23, 1
	cmp	x23, x27
	bne	.L194
.L204:
	add	x27, x27, 8
	add	x24, x24, 17
	cmp	x25, x27
	beq	.L166
	ldrb	w2, [x24, -1]
	b	.L187
	.p2align 3
.L166:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L170:
	strb	w27, [x22, 2]
	b	.L168
.L175:
	strb	w27, [x22]
	b	.L173
	.size	VP6_ConfigureMvEntropyDecoder, .-VP6_ConfigureMvEntropyDecoder
	.align	3
.LC30:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_BoolTreeToHuffCodes
	.type	VP6_BoolTreeToHuffCodes, %function
VP6_BoolTreeToHuffCodes:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldrb	w2, [x19, 1]
	mov	w0, 255
	ldrb	w1, [x19]
	mul	w1, w1, w2
	lsr	w1, w1, 8
	str	w1, [x20, 44]
	ldrb	w1, [x19, 1]
	ldrb	w2, [x19]
	sub	w1, w0, w1
	mul	w1, w1, w2
	lsr	w1, w1, 8
	str	w1, [x20]
	ldrb	w2, [x19]
	ldrb	w3, [x19, 2]
	sub	w2, w0, w2
	mul	w3, w3, w2
	lsr	w3, w3, 8
	str	w3, [x20, 4]
	ldrb	w1, [x19, 2]
	ldrb	w3, [x19, 3]
	sub	w1, w0, w1
	ldrb	w4, [x19, 4]
	mul	w2, w1, w2
	lsr	w2, w2, 8
	mul	w1, w3, w2
	lsr	w3, w1, 8
	mul	w1, w4, w3
	lsr	w1, w1, 8
	str	w1, [x20, 8]
	ldrb	w1, [x19, 4]
	ldrb	w4, [x19, 5]
	sub	w1, w0, w1
	mul	w1, w1, w3
	lsr	w1, w1, 8
	mul	w3, w4, w1
	lsr	w3, w3, 8
	str	w3, [x20, 12]
	ldrb	w3, [x19, 5]
	sub	w3, w0, w3
	mul	w1, w3, w1
	lsr	w1, w1, 8
	str	w1, [x20, 16]
	ldrb	w1, [x19, 3]
	ldrb	w3, [x19, 6]
	sub	w1, w0, w1
	ldrb	w4, [x19, 7]
	mul	w2, w1, w2
	lsr	w2, w2, 8
	mul	w1, w3, w2
	lsr	w3, w1, 8
	mul	w1, w4, w3
	lsr	w1, w1, 8
	str	w1, [x20, 20]
	ldrb	w1, [x19, 7]
	sub	w1, w0, w1
	mul	w1, w1, w3
	lsr	w1, w1, 8
	str	w1, [x20, 24]
	ldrb	w1, [x19, 6]
	ldrb	w3, [x19, 8]
	sub	w1, w0, w1
	ldrb	w4, [x19, 9]
	mul	w1, w1, w2
	lsr	w2, w1, 8
	mul	w1, w3, w2
	lsr	w3, w1, 8
	mul	w1, w4, w3
	lsr	w1, w1, 8
	str	w1, [x20, 28]
	ldrb	w1, [x19, 9]
	sub	w1, w0, w1
	mul	w1, w1, w3
	lsr	w1, w1, 8
	str	w1, [x20, 32]
	ldrb	w1, [x19, 8]
	ldrb	w3, [x19, 10]
	sub	w1, w0, w1
	mul	w1, w1, w2
	lsr	w1, w1, 8
	mul	w2, w3, w1
	lsr	w2, w2, 8
	str	w2, [x20, 36]
	ldrb	w2, [x19, 10]
	sub	w0, w0, w2
	mul	w0, w0, w1
	lsr	w0, w0, 8
	str	w0, [x20, 40]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VP6_BoolTreeToHuffCodes, .-VP6_BoolTreeToHuffCodes
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_ZerosBoolTreeToHuffCodes
	.type	VP6_ZerosBoolTreeToHuffCodes, %function
VP6_ZerosBoolTreeToHuffCodes:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldrb	w2, [x19, 1]
	mov	w0, 255
	ldrb	w1, [x19]
	ldrb	w3, [x19, 2]
	mul	w1, w1, w2
	lsr	w2, w1, 8
	mul	w1, w3, w2
	lsr	w1, w1, 8
	str	w1, [x20]
	ldrb	w1, [x19, 2]
	sub	w1, w0, w1
	mul	w1, w1, w2
	lsr	w1, w1, 8
	str	w1, [x20, 4]
	ldrb	w1, [x19, 1]
	ldrb	w3, [x19]
	sub	w1, w0, w1
	ldrb	w2, [x19, 3]
	mul	w1, w1, w3
	lsr	w1, w1, 8
	mul	w2, w2, w1
	lsr	w2, w2, 8
	str	w2, [x20, 8]
	ldrb	w2, [x19, 3]
	sub	w2, w0, w2
	mul	w1, w2, w1
	lsr	w1, w1, 8
	str	w1, [x20, 12]
	ldrb	w3, [x19]
	ldrb	w2, [x19, 4]
	sub	w3, w0, w3
	ldrb	w4, [x19, 5]
	ldrb	w1, [x19, 6]
	mul	w2, w3, w2
	lsr	w2, w2, 8
	mul	w2, w2, w4
	lsr	w2, w2, 8
	mul	w1, w1, w2
	lsr	w1, w1, 8
	str	w1, [x20, 16]
	ldrb	w1, [x19, 6]
	sub	w1, w0, w1
	mul	w2, w1, w2
	lsr	w2, w2, 8
	str	w2, [x20, 20]
	ldrb	w3, [x19]
	ldrb	w2, [x19, 4]
	sub	w3, w0, w3
	ldrb	w4, [x19, 5]
	ldrb	w1, [x19, 7]
	mul	w2, w3, w2
	sub	w4, w0, w4
	lsr	w2, w2, 8
	mul	w2, w2, w4
	lsr	w2, w2, 8
	mul	w1, w1, w2
	lsr	w1, w1, 8
	str	w1, [x20, 24]
	ldrb	w1, [x19, 7]
	sub	w1, w0, w1
	mul	w2, w1, w2
	lsr	w2, w2, 8
	str	w2, [x20, 28]
	ldrb	w2, [x19, 4]
	ldrb	w1, [x19]
	sub	w1, w0, w1
	sub	w0, w0, w2
	mul	w0, w1, w0
	lsr	w0, w0, 8
	str	w0, [x20, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VP6_ZerosBoolTreeToHuffCodes, .-VP6_ZerosBoolTreeToHuffCodes
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_InsertSorted
	.type	VP6_InsertSorted, %function
VP6_InsertSorted:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x2
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	w8, [x21]
	uxtw	x7, w20
	cmn	w8, #1
	beq	.L208
	uxtw	x1, w8
	lsl	x3, x7, 2
	lsl	x0, x1, 2
	sub	x7, x3, x7
	sub	x0, x0, x1
	add	x7, x19, x7, lsl 2
	add	x0, x19, x0, lsl 2
	ldr	w6, [x7, 8]
	ldr	w1, [x0, 8]
	cmp	w6, w1
	bls	.L209
	uxtw	x5, w8
	b	.L211
	.p2align 3
.L219:
	sub	x0, x0, x4
	add	x0, x19, x0, lsl 2
	ldr	w4, [x0, 8]
	cmp	w4, w6
	bcs	.L218
	uxtw	x5, w3
.L211:
	ldr	w3, [x0, 4]
	cmn	w3, #1
	uxtw	x4, w3
	lsl	x0, x4, 2
	bne	.L219
.L210:
	lsl	x0, x5, 2
	sub	x5, x0, x5
	add	x19, x19, x5, lsl 2
	str	w20, [x19, 4]
	str	w3, [x7, 4]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L218:
	cmp	w8, w3
	bne	.L210
.L213:
	str	w20, [x21]
	str	w3, [x7, 4]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L208:
	lsl	x0, x7, 2
	sub	x7, x0, x7
	add	x7, x19, x7, lsl 2
.L209:
	mov	w3, w8
	b	.L213
	.size	VP6_InsertSorted, .-VP6_InsertSorted
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_BuildHuffTree
	.type	VP6_BuildHuffTree, %function
VP6_BuildHuffTree:
	stp	x29, x30, [sp, -448]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	mov	w24, w2
	mov	x21, x1
	bl	_mcount
	str	wzr, [x29, 84]
	sub	w19, w24, #1
	cbz	w24, .L225
	add	x20, x29, 88
	mov	x3, 0
	add	x4, x20, 8
	mov	w6, 1
	mov	w1, -1
	.p2align 2
.L224:
	uxtw	x2, w3
	ldr	w5, [x21, x3, lsl 2]
	lsl	x0, x2, 2
	sub	x0, x0, x2
	add	x2, x29, 448
	add	x0, x2, x0, lsl 2
	sub	x0, x0, #512
	ldrb	w2, [x0, 152]
	orr	w2, w2, 1
	bfi	w2, w3, 1, 4
	and	w2, w2, 31
	strb	w2, [x0, 152]
	cbnz	w5, .L223
	str	w6, [x21, x3, lsl 2]
	mov	w5, 1
.L223:
	add	x3, x3, 1
	stp	w1, w5, [x4, -4]
	cmp	w24, w3
	add	x4, x4, 12
	bhi	.L224
	cmp	w24, 1
	bls	.L225
	mov	w23, 1
	add	x21, x29, 84
	.p2align 2
.L226:
	mov	w1, w23
	mov	x2, x21
	mov	x0, x20
	add	w23, w23, 1
	bl	VP6_InsertSorted
	cmp	w24, w23
	bne	.L226
	ldr	w2, [x29, 84]
.L222:
	uxtw	x2, w2
	add	x1, x29, 448
	lsl	x0, x2, 2
	sub	x0, x0, x2
	add	x0, x1, x0, lsl 2
	sub	x0, x0, #4096
	ldr	w4, [x0, 3740]
	cmn	w4, #1
	beq	.L220
	sub	w25, w24, #2
	add	x20, x29, 88
	and	w25, w25, 15
	add	x21, x29, 84
	mov	w23, -1
	.p2align 2
.L228:
	uxtw	x3, w24
	lsl	x0, x2, 2
	sub	x2, x0, x2
	uxtw	x4, w4
	lsl	x0, x3, 2
	lsl	x1, x4, 2
	sub	x3, x0, x3
	sub	x4, x1, x4
	add	x0, x29, 448
	add	x1, x29, 448
	add	x3, x1, x3, lsl 2
	add	x0, x0, x2, lsl 2
	sub	x7, x3, #512
	sub	x0, x0, #4096
	sub	x3, x3, #4096
	add	x4, x1, x4, lsl 2
	sub	w19, w19, #1
	sub	x4, x4, #4096
	ubfiz	x1, x19, 1, 32
	ldrb	w6, [x0, 3736]
	add	x2, x22, x1
	ldrb	w5, [x7, 152]
	str	w23, [x3, 3740]
	ldrb	w8, [x4, 3736]
	and	w5, w5, 254
	strb	w6, [x22, x1]
	bfi	w5, w25, 1, 4
	ldr	w9, [x0, 3744]
	mov	w1, w24
	ldr	w6, [x4, 3744]
	mov	x0, x20
	strb	w8, [x2, 1]
	mov	x2, x21
	ldr	w8, [x4, 3740]
	add	w4, w9, w6
	strb	w5, [x7, 152]
	add	w25, w25, 15
	str	w4, [x3, 3744]
	add	w24, w24, 1
	str	w8, [x29, 84]
	and	w25, w25, 15
	bl	VP6_InsertSorted
	ldr	w2, [x29, 84]
	add	x0, x29, 448
	lsl	x1, x2, 2
	sub	x1, x1, x2
	add	x1, x0, x1, lsl 2
	sub	x1, x1, #4096
	ldr	w4, [x1, 3740]
	cmn	w4, #1
	bne	.L228
.L220:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 448
	ret
.L225:
	mov	w2, 0
	b	.L222
	.size	VP6_BuildHuffTree, .-VP6_BuildHuffTree
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_BuildHuffLookupTable
	.type	VP6_BuildHuffLookupTable, %function
VP6_BuildHuffLookupTable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	mov	x5, 0
	mov	w7, 6
	.p2align 2
.L237:
	mov	w6, w5
	mov	w0, 0
	mov	w2, 0
	b	.L236
	.p2align 3
.L241:
	ldrb	w3, [x0, 1]
	and	w4, w3, 1
	ubfx	x0, x3, 1, 4
	cmp	w4, wzr
	ccmp	w2, 5, 2, eq
	bhi	.L240
.L236:
	add	w2, w2, 1
	ubfiz	x4, x0, 1, 4
	sub	w3, w7, w2
	add	x0, x19, x4
	asr	w3, w6, w3
	tbnz	x3, 0, .L241
	ldrb	w3, [x19, x4]
	and	w4, w3, 1
	ubfx	x0, x3, 1, 4
	cmp	w4, wzr
	ccmp	w2, 5, 2, eq
	bls	.L236
.L240:
	ldrb	w3, [x20, x5]
	bfi	w3, w0, 4, 4
	mov	w0, w3
	bfi	w0, w2, 1, 3
	bfi	w0, w4, 0, 1
	strb	w0, [x20, x5]
	add	x5, x5, 1
	cmp	x5, 64
	bne	.L237
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VP6_BuildHuffLookupTable, .-VP6_BuildHuffLookupTable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_BuildTreeTab
	.type	VP6_BuildTreeTab, %function
VP6_BuildTreeTab:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x8, x19, 8192
	mov	w0, 0
	add	x10, x8, 970
	add	x11, x8, 1834
.L243:
	sub	x9, x10, #432
.L252:
	sub	x7, x9, #96
.L250:
	add	x1, x19, x0, uxtw
	add	w2, w0, 1
	ldrb	w4, [x7, -2]
	mov	x3, x7
	add	x2, x19, x2, uxtw
	add	w0, w0, 2
	strb	w4, [x1, 1262]
	mov	w1, 0
	ldrb	w4, [x7, -1]
	strb	w4, [x2, 1262]
	b	.L248
	.p2align 3
.L246:
	ldrb	w0, [x3]
	cmp	w1, 5
	add	x3, x3, 2
	strb	w0, [x6, 1262]
	ccmp	w1, 11, 4, ne
	cset	w6, eq
	ldrb	w0, [x3, -1]
	cmp	w6, wzr
	strb	w0, [x2, 1262]
	csel	w0, w4, w5, ne
.L248:
	add	w1, w1, 1
	add	w2, w0, 1
	cmp	w1, 12
	add	x6, x19, x0, uxtw
	add	x2, x19, x2
	add	w5, w0, 2
	add	w4, w0, 6
	bne	.L246
	add	x7, x7, 24
	cmp	x7, x9
	bne	.L250
	add	x9, x7, 144
	cmp	x10, x9
	bne	.L252
	add	x10, x7, 576
	cmp	x10, x11
	bne	.L243
	add	x7, x8, 1306
	add	x9, x8, 1354
	mov	w0, 768
.L251:
	add	x1, x19, x0, uxtw
	add	w2, w0, 1
	ldrb	w4, [x7, -2]
	mov	x3, x7
	add	x2, x19, x2, uxtw
	add	w0, w0, 2
	strb	w4, [x1, 1262]
	mov	w1, 0
	ldrb	w4, [x7, -1]
	strb	w4, [x2, 1262]
	b	.L257
	.p2align 3
.L255:
	ldrb	w0, [x3]
	cmp	w1, 5
	add	x3, x3, 2
	strb	w0, [x6, 1262]
	ccmp	w1, 11, 4, ne
	cset	w6, eq
	ldrb	w0, [x3, -1]
	cmp	w6, wzr
	strb	w0, [x2, 1262]
	csel	w0, w4, w5, ne
.L257:
	add	w1, w1, 1
	add	w2, w0, 1
	cmp	w1, 12
	add	x6, x19, x0, uxtw
	add	x2, x19, x2
	add	w5, w0, 2
	add	w4, w0, 6
	bne	.L255
	add	x7, x7, 24
	cmp	x9, x7
	bne	.L251
	add	x6, x8, 384
	mov	w3, 832
	add	x8, x8, 440
.L256:
	mov	x2, x6
	mov	w1, 0
	b	.L262
	.p2align 3
.L267:
	add	w1, w1, 1
	add	w3, w3, 6
	cmp	w1, 14
	add	x2, x2, 2
	beq	.L261
.L262:
	add	x4, x19, x3, uxtw
	ldrb	w5, [x2]
	add	w0, w3, 1
	cmp	w1, 5
	add	x0, x19, x0
	ccmp	w1, 11, 4, ne
	strb	w5, [x4, 1262]
	ldrb	w4, [x2, 1]
	strb	w4, [x0, 1262]
	beq	.L267
	cmp	w1, 13
	beq	.L268
	add	w1, w1, 1
	add	w3, w3, 2
	cmp	w1, 14
	add	x2, x2, 2
	bne	.L262
.L261:
	add	x6, x6, 28
	cmp	x8, x6
	bne	.L256
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L268:
	add	w3, w3, 30
	b	.L261
	.size	VP6_BuildTreeTab, .-VP6_BuildTreeTab
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_ConvertBoolToHuff
	.type	VP6_ConvertBoolToHuff, %function
VP6_ConvertBoolToHuff:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	add	x27, x21, 4096
	add	x19, x21, 8192
	bl	_mcount
	add	x23, x27, 2544
	ldr	x2, .LC32
	mov	w1, 1308
	mov	w0, 20
	add	x22, x19, 1304
	add	x20, x27, 2592
	add	x25, x19, 1328
	bl	dprint_normal
	add	x24, x27, 2640
	mov	x1, x23
	add	x0, x21, 558
	mov	w26, 198
	bl	VP6_BoolTreeToHuffCodes
	mov	w2, 12
	mov	x1, x23
	mov	x0, x22
	add	x23, x19, 384
	bl	VP6_BuildHuffTree
	mov	x0, x22
	add	x1, x19, 1352
	add	x22, x27, 2696
	bl	VP6_BuildHuffLookupTable
	mov	x1, x20
	add	x0, x21, 569
	bl	VP6_BoolTreeToHuffCodes
	add	x3, x27, 2752
	mov	w2, 12
	mov	x1, x20
	mov	x0, x25
	str	x3, [x29, 104]
	add	x20, x19, 412
	bl	VP6_BuildHuffTree
	add	x1, x19, 1416
	mov	x0, x25
	bl	VP6_BuildHuffLookupTable
	mov	x1, x24
	add	x0, x21, 580
	bl	VP6_ZerosBoolTreeToHuffCodes
	add	x0, x19, 440
	mov	w2, 9
	mov	x1, x24
	str	x0, [x29, 120]
	mov	x0, x23
	bl	VP6_BuildHuffTree
	add	x0, x19, 1480
	add	x1, x19, 3784
	str	x0, [x29, 112]
	mov	x0, x23
	bl	VP6_BuildHuffLookupTable
	mov	x1, x22
	add	x0, x21, 594
	bl	VP6_ZerosBoolTreeToHuffCodes
	mov	x1, x22
	mov	x0, x20
	mov	w2, 9
	bl	VP6_BuildHuffTree
	add	x1, x19, 3848
	mov	x0, x20
	bl	VP6_BuildHuffLookupTable
.L270:
	ldp	x23, x25, [x29, 104]
	ldr	x24, [x29, 120]
	sub	w27, w26, #198
.L274:
	add	w22, w27, 66
	mov	x20, x25
	mov	x19, x24
	mov	x28, x23
	.p2align 2
.L271:
	uxtw	x0, w27
	mov	x1, x28
	add	x0, x0, 608
	add	w27, w27, 11
	add	x0, x21, x0
	bl	VP6_BoolTreeToHuffCodes
	mov	x1, x28
	mov	x0, x19
	mov	w2, 12
	add	x28, x28, 48
	bl	VP6_BuildHuffTree
	mov	x1, x20
	mov	x0, x19
	add	x20, x20, 64
	add	x19, x19, 24
	bl	VP6_BuildHuffLookupTable
	cmp	w27, w22
	bne	.L271
	cmp	w26, w27
	add	x23, x23, 288
	add	x24, x24, 144
	add	x25, x25, 384
	bne	.L274
	ldr	x0, [x29, 104]
	add	w26, w26, 198
	cmp	w26, 594
	add	x0, x0, 864
	str	x0, [x29, 104]
	ldr	x0, [x29, 120]
	add	x0, x0, 432
	str	x0, [x29, 120]
	ldr	x0, [x29, 112]
	add	x0, x0, 1152
	str	x0, [x29, 112]
	bne	.L270
	mov	x0, x21
	bl	VP6_BuildTreeTab
	ldr	x2, .LC34
	mov	w1, 1338
	mov	w0, 20
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.size	VP6_ConvertBoolToHuff, .-VP6_ConvertBoolToHuff
	.align	3
.LC32:
	.xword	.LC31
	.align	3
.LC34:
	.xword	.LC33
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_IntraFrmHeader
	.type	VP6_IntraFrmHeader, %function
VP6_IntraFrmHeader:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x24, x0
	mov	x0, x30
	mov	x19, x1
	add	x22, x24, 12288
	bl	_mcount
	sub	x20, x22, #40
	ldr	x2, .LC36
	mov	w1, 1347
	mov	w0, 20
	bl	dprint_normal
	mov	w1, 5
	mov	x0, x19
	bl	BsGet
	uxtb	w0, w0
	mov	w1, 2
	str	w0, [x22, -28]
	mov	x0, x19
	bl	BsGet
	uxtb	w0, w0
	ldr	w3, [x22, -28]
	str	w0, [x22, -24]
	cmp	w3, 8
	bhi	.L307
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L308
	ldrb	w0, [x22, -38]
	cbz	w0, .L280
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	str	w0, [x20, 52]
.L280:
	mov	w1, 255
	mov	w0, 8
	str	w1, [x24, 12324]
	mov	w1, 24
	str	w0, [x24, 12332]
	mov	x0, x19
	str	wzr, [x24, 12320]
	mov	x20, 12320
	mov	w23, 0
	add	x20, x24, x20
	bl	BsGet
	mov	w21, 7
	str	w0, [x24, 12328]
	.p2align 2
.L282:
	mov	x1, x20
	mov	x0, x19
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w21
	sub	w21, w21, #1
	orr	w23, w0, w23
	cmn	w21, #1
	bne	.L282
	and	w0, w23, 255
	mov	w21, 7
	mov	w23, 0
	str	w0, [x22, -16]
	.p2align 2
.L283:
	mov	x1, x20
	mov	x0, x19
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w21
	sub	w21, w21, #1
	orr	w23, w0, w23
	cmn	w21, #1
	bne	.L283
	ldr	w26, [x22, -16]
	and	w23, w23, 255
	lsl	w25, w23, 1
	mov	w21, 7
	lsl	w26, w26, 1
	str	w25, [x22, -4]
	stp	w23, w26, [x22, -12]
	mov	w23, 0
	.p2align 2
.L284:
	mov	x1, x20
	mov	x0, x19
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w21
	sub	w21, w21, #1
	orr	w23, w0, w23
	cmn	w21, #1
	bne	.L284
	ubfiz	w0, w23, 1, 8
	mov	w21, 7
	mov	w23, 0
	str	w0, [x22]
	.p2align 2
.L285:
	mov	x1, x20
	mov	x0, x19
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w21
	sub	w21, w21, #1
	orr	w23, w0, w23
	cmn	w21, #1
	bne	.L285
	mov	x1, x20
	ubfiz	w23, w23, 1, 8
	mov	x0, x19
	str	w23, [x22, 4]
	bl	Vp6_Vfmw_DecodeBool128
	mov	w21, w0
	mov	x1, x20
	mov	x0, x19
	bl	Vp6_Vfmw_DecodeBool128
	orr	w0, w0, w21, lsl 1
	strb	w0, [x22, -37]
	ldp	w3, w4, [x24]
	cmp	w26, w4
	bne	.L287
	cmp	w25, w3
	beq	.L288
.L287:
	ldr	x2, .LC42
	mov	w6, w26
	mov	w5, w25
	mov	w1, 1397
	mov	w0, 20
	bl	dprint_normal
.L288:
	stp	w25, w26, [x24]
	sub	x21, x22, #40
	ldr	w0, [x22, -24]
	cbnz	w0, .L309
	mov	w0, 14
	strb	w0, [x22, -34]
	str	wzr, [x21, 56]
.L298:
	ldr	x2, .LC44
	mov	w1, 1444
	mov	w0, 20
	bl	dprint_normal
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L307:
	ldr	x2, .LC38
	mov	w1, 1355
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L308:
	ldr	x2, .LC40
	mov	w1, 1362
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L309:
	mov	x1, x20
	mov	x0, x19
	bl	Vp6_Vfmw_DecodeBool128
	cbz	w0, .L290
	mov	w0, 2
	mov	w23, 0
	str	w0, [x21, 56]
	mov	w21, 4
	.p2align 2
.L291:
	mov	x1, x20
	mov	x0, x19
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w21
	sub	w21, w21, #1
	orr	w23, w0, w23
	cmn	w21, #1
	bne	.L291
	ldr	w1, [x22, -28]
	mov	w0, 5
	and	w23, w23, 255
	mov	w24, 0
	cmp	w1, 7
	mov	w21, 2
	csel	w0, wzr, w0, hi
	lsl	w0, w23, w0
	strb	w0, [x22, -36]
.L293:
	mov	x1, x20
	mov	x0, x19
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w21
	sub	w21, w21, #1
	orr	w24, w0, w24
	cmn	w21, #1
	bne	.L293
	strb	w24, [x22, -35]
.L294:
	ldr	w0, [x22, -28]
	cmp	w0, 7
	bls	.L296
	mov	w23, 0
	mov	w21, 3
.L297:
	mov	x1, x20
	mov	x0, x19
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w21
	sub	w21, w21, #1
	orr	w23, w0, w23
	cmn	w21, #1
	bne	.L297
	strb	w23, [x22, -34]
	b	.L298
	.p2align 3
.L296:
	mov	w0, 16
	strb	w0, [x22, -34]
	b	.L298
	.p2align 3
.L290:
	mov	x1, x20
	mov	x0, x19
	bl	Vp6_Vfmw_DecodeBool128
	cbz	w0, .L295
	mov	w0, 1
	str	w0, [x21, 56]
	b	.L294
.L295:
	str	wzr, [x21, 56]
	b	.L294
	.size	VP6_IntraFrmHeader, .-VP6_IntraFrmHeader
	.align	3
.LC36:
	.xword	.LC35
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
	.global	VP6_InterFrmHeader
	.type	VP6_InterFrmHeader, %function
VP6_InterFrmHeader:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	ldr	w0, [x19, 12116]
	cbz	w0, .L332
	add	x20, x19, 12288
	str	w0, [x20, -28]
	ldr	w1, [x19, 12120]
	ldrb	w0, [x20, -38]
	str	w1, [x20, -24]
	cbnz	w0, .L333
.L313:
	mov	w1, 255
	mov	w0, 8
	str	w1, [x19, 12324]
	mov	w1, 24
	str	w0, [x19, 12332]
	mov	x0, x22
	str	wzr, [x19, 12320]
	mov	x21, 12320
	sub	x23, x20, #40
	add	x21, x19, x21
	bl	BsGet
	str	w0, [x19, 12328]
	mov	x1, x21
	mov	x0, x22
	bl	Vp6_Vfmw_DecodeBool128
	str	w0, [x23, 60]
	str	w0, [x19, 24]
	ldr	w0, [x19, 12120]
	cbnz	w0, .L334
	mov	w0, 14
	strb	w0, [x20, -34]
	mov	w19, 1
	str	wzr, [x23, 56]
.L312:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L333:
	mov	w1, 16
	mov	x0, x22
	bl	BsGet
	str	w0, [x20, 12]
	b	.L313
	.p2align 3
.L334:
	mov	x1, x21
	mov	x0, x22
	bl	Vp6_Vfmw_DecodeBool128
	str	w0, [x23, 64]
	mov	w24, w0
	cbnz	w0, .L335
.L316:
	ldr	w0, [x19, 12116]
	cmp	w0, 7
	bhi	.L336
	mov	w0, 16
	strb	w0, [x20, -34]
	mov	w19, 1
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L336:
	mov	x1, x21
	mov	x0, x22
	mov	w19, 1
	bl	Vp6_Vfmw_DecodeBool128
	cbz	w0, .L312
	mov	x1, x21
	mov	x0, x22
	bl	Vp6_Vfmw_DecodeBool128
	cbz	w0, .L318
	mov	w0, 2
	mov	w23, 0
	mov	w19, 4
	str	w0, [x20, 16]
	.p2align 2
.L319:
	mov	x1, x21
	mov	x0, x22
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w19
	sub	w19, w19, #1
	orr	w23, w0, w23
	cmn	w19, #1
	bne	.L319
	strb	w23, [x20, -36]
	mov	w19, 2
	mov	w23, 0
.L320:
	mov	x1, x21
	mov	x0, x22
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w19
	sub	w19, w19, #1
	orr	w23, w0, w23
	cmn	w19, #1
	bne	.L320
	strb	w23, [x20, -35]
.L323:
	mov	w23, 0
	mov	w19, 3
.L321:
	mov	x1, x21
	mov	x0, x22
	bl	Vp6_Vfmw_DecodeBool128
	lsl	w0, w0, w19
	sub	w19, w19, #1
	orr	w23, w0, w23
	cmn	w19, #1
	bne	.L321
	strb	w23, [x20, -34]
	mov	w19, 1
	b	.L312
	.p2align 3
.L335:
	mov	x1, x21
	mov	x0, x22
	bl	Vp6_Vfmw_DecodeBool128
	orr	w0, w0, w24, lsl 1
	str	w0, [x23, 64]
	b	.L316
	.p2align 3
.L332:
	ldr	w4, [x19, 12260]
	mov	w3, 0
	ldr	x2, .LC46
	mov	w1, 1458
	mov	w0, 1
	mov	w19, -88
	bl	dprint_normal
	b	.L312
	.p2align 3
.L318:
	mov	x1, x21
	mov	x0, x22
	bl	Vp6_Vfmw_DecodeBool128
	cmp	w0, wzr
	mov	w1, 0
	csel	w19, w19, w1, ne
	str	w19, [x20, 16]
	b	.L323
	.size	VP6_InterFrmHeader, .-VP6_InterFrmHeader
	.align	3
.LC46:
	.xword	.LC45
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_GetPictureHeader
	.type	VP6_GetPictureHeader, %function
VP6_GetPictureHeader:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x21, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L343
	ldr	x2, .LC50
	mov	w1, 1546
	mov	w0, 20
	add	x19, x21, 12288
	bl	dprint_normal
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	and	w1, w0, 255
	str	w1, [x19, -20]
	mov	w1, 6
	strb	w0, [x21, 20]
	mov	x0, x20
	bl	BsGet
	and	w3, w0, 255
	ldr	x2, .LC51
	mov	w1, 1
	strb	w0, [x19, -40]
	mov	x0, x20
	add	x5, x2, 1696
	add	x4, x2, 1760
	add	x2, x2, 1888
	ldrb	w5, [x5, w3, sxtw]
	ldrh	w4, [x4, w3, sxtw 1]
	ldrh	w2, [x2, w3, sxtw 1]
	strb	w5, [x19, -39]
	strh	w4, [x19, -32]
	strh	w2, [x19, -30]
	bl	BsGet
	strb	w0, [x19, -38]
	ldr	w1, [x19, -20]
	cbz	w1, .L344
	mov	x1, x20
	mov	x0, x21
	bl	VP6_InterFrmHeader
	cmp	w0, 1
	mov	w22, w0
	beq	.L345
.L339:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L344:
	mov	x1, x20
	mov	x0, x21
	bl	VP6_IntraFrmHeader
	cmp	w0, 1
	mov	w22, w0
	bne	.L339
.L345:
	mov	x1, 12320
	mov	x0, x20
	add	x1, x21, x1
	bl	Vp6_Vfmw_DecodeBool128
	str	w0, [x19, 28]
	ldrb	w4, [x19, -40]
	mov	w1, 1583
	ldr	x2, .LC53
	mov	w0, 20
	str	w4, [x19, 8]
	bl	dprint_normal
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L343:
	ldr	x2, .LC48
	mov	w1, 1542
	mov	w0, 20
	mov	w22, 0
	bl	dprint_normal
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VP6_GetPictureHeader, .-VP6_GetPictureHeader
	.align	3
.LC48:
	.xword	.LC47
	.align	3
.LC50:
	.xword	.LC49
	.align	3
.LC51:
	.xword	.LANCHOR0
	.align	3
.LC53:
	.xword	.LC52
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6DEC_Init
	.type	VP6DEC_Init, %function
VP6DEC_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x21, .LC57
	mov	x2, 13360
	mov	w1, 0
	mov	x0, x19
	ldr	w22, [x19, 13336]
	ldr	x3, [x21, 96]
	blr	x3
	str	w22, [x19, 13336]
	add	x0, x19, 12288
	add	x0, x0, 448
	bl	ResetVoQueue
	str	x20, [x19]
	mov	x0, x19
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x19, 13344]
	beq	.L349
	ldr	x3, [x21, 96]
	add	x20, x19, 304
	mov	x2, 12392
	mov	w1, 0
	mov	x0, x20
	blr	x3
	str	wzr, [x19, 320]
	ldr	x3, [x19]
	mov	w1, 1619
	ldr	x2, .LC61
	mov	w0, 20
	ldr	w3, [x3, 8]
	str	w3, [x19, 312]
	bl	dprint_normal
	mov	w0, 1
.L348:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L349:
	ldr	x2, .LC59
	mov	w1, 1607
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -20
	b	.L348
	.size	VP6DEC_Init, .-VP6DEC_Init
	.align	3
.LC57:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC59:
	.xword	.LC58
	.align	3
.LC61:
	.xword	.LC60
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_DecodeDecide
	.type	VP6_DecodeDecide, %function
VP6_DecodeDecide:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 304
	bl	_mcount
	ldr	w0, [x19, 16]
	cbz	w0, .L378
	ldr	w0, [x19, 8]
	sub	w0, w0, #2
	cmp	w0, 1
	ldr	x0, [x20]
	ldr	w3, [x0, 8]
	bls	.L379
.L354:
	cmp	w3, 4
	str	w3, [x19, 8]
	bls	.L380
	ldr	x2, .LC73
	mov	w1, 1679
	mov	w0, 1
	bl	dprint_normal
.L357:
	mov	w0, 0
.L371:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L380:
	ldr	x0, .LC79
	ldrb	w0, [x0,w3,uxtw]
	adr	x1, .Lrtx360
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx360:
	.section	.rodata
	.align	0
	.align	2
.L360:
	.byte	(.L358 - .Lrtx360) / 4
	.byte	(.L358 - .Lrtx360) / 4
	.byte	(.L355 - .Lrtx360) / 4
	.byte	(.L357 - .Lrtx360) / 4
	.byte	(.L358 - .Lrtx360) / 4
	.text
	.p2align 3
.L379:
	cmp	w3, 1
	ccmp	w3, 4, 4, hi
	bne	.L354
	ldr	x2, .LC65
	mov	w1, 1642
	mov	w0, 3
	bl	dprint_normal
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 13344]
	bl	FSP_ClearLogicFs
	ldr	w1, [x19, 36]
	ldr	w0, [x20, 13344]
	bl	FSP_ClearLogicFs
	ldr	w0, [x20, 13344]
	bl	FSP_GetNullLogicFs
	str	wzr, [x19, 12]
	stp	w0, w0, [x19, 32]
	ldr	x0, [x20]
	ldr	w3, [x0, 8]
	b	.L354
	.p2align 3
.L378:
	ldr	x2, .LC63
	mov	w1, 1634
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L355:
	ldrb	w3, [x19, 20]
	cbnz	w3, .L381
.L356:
	ldr	w1, [x19, 36]
	ldr	w0, [x20, 13344]
	bl	FSP_GetFsImagePtr
	mov	x1, x0
	cbz	x0, .L382
	ldrb	w2, [x19, 20]
	mov	w0, 1
	cbz	w2, .L371
	ldr	x2, [x20]
	ldr	w3, [x1, 96]
	ldr	w4, [x2]
	cmp	w3, w4
	bls	.L371
	ldr	x2, .LC78
	mov	w1, 1697
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L358:
	ldrb	w0, [x19, 20]
	cbz	w0, .L356
	ldr	w0, [x19, 12]
	cbnz	w0, .L356
	ldr	x3, .LC69
	mov	w4, 0
	ldr	x2, .LC71
	mov	w1, 1671
	mov	w0, 16
	bl	dprint_normal
	b	.L357
	.p2align 3
.L381:
	ldr	x2, .LC67
	mov	w1, 1659
	mov	w0, 16
	bl	dprint_normal
	b	.L357
	.p2align 3
.L382:
	ldr	x3, .LC74
	mov	w4, 1689
	ldr	x2, .LC76
	mov	w1, w4
	add	x3, x3, 2016
	mov	w0, 20
	bl	dprint_normal
	mov	w0, 0
	b	.L371
	.size	VP6_DecodeDecide, .-VP6_DecodeDecide
	.align	3
.LC63:
	.xword	.LC62
	.align	3
.LC65:
	.xword	.LC64
	.align	3
.LC67:
	.xword	.LC66
	.align	3
.LC69:
	.xword	.LC68
	.align	3
.LC71:
	.xword	.LC70
	.align	3
.LC73:
	.xword	.LC72
	.align	3
.LC74:
	.xword	.LANCHOR0
	.align	3
.LC76:
	.xword	.LC75
	.align	3
.LC78:
	.xword	.LC77
	.align	3
.LC79:
	.xword	.L360
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_Set_DecParam
	.type	VP6_Set_DecParam, %function
VP6_Set_DecParam:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 16
	add	x24, x20, 12288
	bl	_mcount
	add	x21, x20, 304
	ldr	x3, .LC80
	mov	x2, 264
	mov	w1, 0
	mov	x0, x19
	ldr	x25, [x20, 280]
	ldr	x3, [x3, 96]
	blr	x3
	ldr	w1, [x24, 284]
	str	w1, [x19, 116]
	ldr	w1, [x24, 292]
	strh	w1, [x19, 106]
	ldr	w0, [x24, 288]
	strh	w0, [x19, 108]
	ldr	w1, [x21, 28]
	ldr	w0, [x20, 13344]
	bl	FSP_GetLogicFs
	mov	x23, x0
	ldr	w1, [x21, 36]
	ldr	w0, [x20, 13344]
	bl	FSP_GetLogicFs
	mov	x22, x0
	ldr	w1, [x21, 32]
	ldr	w0, [x20, 13344]
	bl	FSP_GetLogicFs
	cmp	x23, xzr
	ccmp	x22, xzr, 4, ne
	ccmp	x0, xzr, 4, ne
	beq	.L401
	ldrb	w1, [x23, 424]
	strb	w1, [x19, 104]
	ldrb	w1, [x21, 20]
	cmp	w1, 3
	beq	.L402
	ldr	x1, [x23, 24]
	cbz	x1, .L403
	ldr	w1, [x1, 4]
	stp	w1, wzr, [x19, 228]
	ldr	x0, [x0, 24]
	cbz	x0, .L404
.L399:
	ldr	w0, [x0, 4]
	str	w0, [x19, 236]
	ldr	x0, [x22, 24]
	cbz	x0, .L405
.L400:
	ldr	w0, [x0, 4]
	add	x22, x24, 264
	str	w0, [x19, 240]
	add	x26, x24, 408
	mov	x0, x26
	ldr	x1, [x23, 24]
	ldr	w1, [x1, 44]
	str	w1, [x19, 244]
	ldr	x1, [x23, 24]
	ldr	w1, [x1, 48]
	str	w1, [x19, 248]
	ldr	x1, [x23, 24]
	ldr	w1, [x1, 72]
	str	w1, [x19, 252]
	ldr	x1, [x23, 24]
	ldr	w1, [x1, 64]
	str	w1, [x19, 256]
	ldr	x1, [x23, 24]
	ldr	w1, [x1, 68]
	str	w1, [x19, 260]
	ldr	w1, [x22, 80]
	str	w1, [x19, 216]
	ldr	w1, [x22, 76]
	str	w1, [x19, 220]
	ldr	w1, [x22, 84]
	str	w1, [x19, 224]
	ldrb	w1, [x24, 264]
	str	w1, [x19, 120]
	ldrb	w1, [x22, 2]
	str	w1, [x19, 124]
	ldr	w1, [x22, 68]
	str	w1, [x19, 128]
	ldr	w1, [x22, 56]
	str	w1, [x19, 140]
	ldrb	w1, [x22, 4]
	str	w1, [x19, 144]
	ldrb	w1, [x22, 5]
	str	w1, [x19, 148]
	ldrb	w1, [x22, 6]
	str	w1, [x19, 152]
	ldr	w1, [x22, 64]
	str	w1, [x19, 164]
	ldrb	w1, [x22, 1]
	strb	w1, [x20, 16]
	ldrh	w1, [x22, 8]
	str	w1, [x19, 132]
	ldrh	w1, [x22, 10]
	str	w1, [x19, 136]
	ldr	w1, [x22, 16]
	str	w1, [x19, 160]
	ldr	w1, [x22, 12]
	str	w1, [x19, 156]
	ldr	x23, [x25]
	bl	BsPos
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w0, w1, w0, lt
	asr	w0, w0, 3
	add	x23, x23, x0, sxtw
	mov	x0, x23
	bl	MEM_Vir2Phy
	and	w0, w0, -16
	sub	w1, w0, #16
	mov	x0, x23
	str	w1, [x19, 112]
	bl	MEM_Vir2Phy
	and	w0, w0, 15
	ldrb	w1, [x22, 2]
	lsl	w0, w0, 3
	cbnz	w1, .L395
	ldr	w1, [x22, 16]
	cbnz	w1, .L396
.L395:
	mov	w1, 16
	stp	w0, w1, [x19, 172]
	mov	x0, x26
	ldr	w22, [x24, 316]
	bl	BsPos
	str	wzr, [x19, 188]
	lsl	w22, w22, 3
	sub	w0, w22, w0
	str	w0, [x19, 168]
	stp	wzr, wzr, [x19, 180]
	ldr	w0, [x24, 316]
	ldr	x22, [x25]
	add	x22, x22, x0
	mov	x0, x22
	bl	MEM_Vir2Phy
	mov	w23, w0
	mov	x0, x22
	ubfiz	w23, w23, 3, 4
	bl	MEM_Vir2Phy
	and	w0, w0, -16
	ldr	w1, [x19, 112]
	sub	w0, w0, w1
	stp	w23, w0, [x19, 196]
	ldr	w1, [x24, 316]
	ldr	w0, [x25, 12]
	stp	wzr, wzr, [x19, 204]
	lsl	w0, w0, 3
	str	wzr, [x19, 212]
	sub	w0, w0, w1, lsl 3
	str	w0, [x19, 192]
.L397:
	add	x21, x21, 4096
	add	x0, x20, 3422
	add	x1, x21, 142
	str	x1, [x19, 64]
	add	x1, x21, 46
	str	x0, [x19, 40]
	str	x1, [x19, 56]
	add	x0, x20, 3358
	add	x1, x20, 3486
	add	x2, x21, 878
	str	x0, [x19, 32]
	add	x0, x20, 2590
	str	x1, [x19, 48]
	add	x1, x20, 2654
	str	x2, [x19, 88]
	add	x2, x21, 750
	str	x0, [x19, 8]
	add	x0, x21, 2414
	str	x1, [x19, 16]
	add	x21, x21, 718
	str	x0, [x19, 96]
	add	x1, x20, 3294
	strb	wzr, [x19, 1]
	mov	w0, 1
	str	x2, [x19, 80]
	str	x21, [x19, 72]
	str	x1, [x19, 24]
	str	x19, [x20, 8]
.L385:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L401:
	ldr	x3, .LC81
	mov	w1, 1740
	ldr	x2, .LC83
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L402:
	ldr	x0, [x23, 32]
	cbz	x0, .L406
	ldr	w0, [x0, 4]
	stp	w0, wzr, [x19, 228]
	ldr	x0, [x22, 32]
	cbz	x0, .L407
.L398:
	ldr	w0, [x0, 4]
	mov	w2, 1
	str	w0, [x19, 240]
	mov	w0, 1
	ldr	x1, [x23, 32]
	ldr	w1, [x1, 44]
	str	w1, [x19, 244]
	ldr	x1, [x23, 32]
	ldr	w1, [x1, 48]
	str	w1, [x19, 248]
	ldr	x1, [x23, 32]
	ldr	w1, [x1, 72]
	str	w1, [x19, 252]
	ldr	x1, [x23, 32]
	ldr	w1, [x1, 64]
	str	w1, [x19, 256]
	ldr	x1, [x23, 32]
	ldr	w1, [x1, 68]
	str	w1, [x19, 260]
	strb	w2, [x19, 1]
	str	x19, [x20, 8]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L396:
	mov	w1, 16
	stp	w0, w1, [x19, 172]
	mov	x0, x26
	ldr	w22, [x25, 12]
	bl	BsPos
	str	wzr, [x19, 212]
	lsl	w22, w22, 3
	sub	w0, w22, w0
	str	w0, [x19, 168]
	stp	wzr, wzr, [x19, 180]
	stp	wzr, wzr, [x19, 188]
	stp	wzr, wzr, [x19, 196]
	stp	wzr, wzr, [x19, 204]
	b	.L397
	.p2align 3
.L404:
	ldr	x0, [x23, 24]
	b	.L399
	.p2align 3
.L405:
	ldr	x0, [x23, 24]
	b	.L400
	.p2align 3
.L403:
	ldr	x3, .LC81
	mov	w1, 1771
	ldr	x2, .LC85
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	b	.L385
	.p2align 3
.L407:
	ldr	x0, [x23, 32]
	b	.L398
.L406:
	ldr	x3, .LC81
	mov	w1, 1750
	ldr	x2, .LC85
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	b	.L385
	.size	VP6_Set_DecParam, .-VP6_Set_DecParam
	.align	3
.LC80:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC81:
	.xword	.LANCHOR1
	.align	3
.LC83:
	.xword	.LC82
	.align	3
.LC85:
	.xword	.LC84
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_CfgTable
	.type	VP6_CfgTable, %function
VP6_CfgTable:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x22, x0
	mov	x0, x30
	mov	x25, x1
	add	x20, x22, 2286
	bl	_mcount
	ldr	x21, .LC86
	stp	xzr, xzr, [x29, 96]
	add	x19, x22, 48
	add	x23, x22, 78
.L409:
	ldr	x3, [x21, 104]
	mov	x1, x19
	mov	x0, x20
	mov	x2, 10
	add	x19, x19, x2
	add	x20, x20, 16
	blr	x3
	cmp	x19, x23
	bne	.L409
	add	x24, x22, 2350
	add	x19, x22, 88
	add	x26, x22, 448
	.p2align 2
.L410:
	add	x23, x19, 90
	mov	x20, x24
	.p2align 2
.L411:
	ldr	x3, [x21, 104]
	mov	x1, x19
	mov	x0, x20
	mov	x2, 9
	add	x19, x19, x2
	add	x20, x20, 16
	blr	x3
	cmp	x23, x19
	bne	.L411
	cmp	x23, x26
	add	x24, x24, 160
	mov	x19, x23
	bne	.L410
	ldr	x3, [x21, 96]
	mov	x2, 16
	mov	w1, 0
	add	x0, x29, 96
	blr	x3
	ldrb	w5, [x22, 44]
	ldrb	w4, [x22, 46]
	ldrb	w3, [x22, 528]
	ldrb	w0, [x22, 529]
	ldrb	w2, [x22, 530]
	ldrb	w1, [x22, 531]
	strb	w5, [x29, 96]
	strb	w4, [x29, 97]
	ldrb	w5, [x22, 532]
	ldrb	w4, [x22, 533]
	strb	w3, [x29, 98]
	strb	w0, [x29, 99]
	ldr	x3, [x21, 104]
	ldrb	w0, [x22, 534]
	strb	w5, [x29, 102]
	strb	w4, [x29, 103]
	strb	w2, [x29, 100]
	mov	x2, 16
	strb	w1, [x29, 101]
	add	x1, x29, 96
	strb	w0, [x29, 104]
	add	x0, x22, 2990
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 16
	mov	w1, 0
	add	x0, x29, 96
	blr	x3
	strb	wzr, [x29, 105]
	ldrb	w5, [x22, 44]
	ldrb	w4, [x22, 542]
	ldrb	w3, [x22, 543]
	ldrb	w0, [x22, 544]
	ldrb	w2, [x22, 545]
	ldrb	w1, [x22, 546]
	strb	w5, [x29, 96]
	strb	w4, [x29, 97]
	ldrb	w5, [x22, 547]
	ldrb	w4, [x22, 548]
	strb	w3, [x29, 98]
	strb	w0, [x29, 99]
	ldr	x3, [x21, 104]
	ldrb	w0, [x22, 549]
	strb	w5, [x29, 102]
	strb	w4, [x29, 103]
	strb	w2, [x29, 100]
	mov	x2, 16
	strb	w1, [x29, 101]
	add	x1, x29, 96
	strb	w0, [x29, 104]
	add	x0, x22, 3006
	strb	wzr, [x29, 106]
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 16
	mov	w1, 0
	add	x0, x29, 96
	blr	x3
	ldrb	w5, [x22, 45]
	ldrb	w4, [x22, 47]
	ldrb	w3, [x22, 535]
	ldrb	w0, [x22, 536]
	ldrb	w2, [x22, 537]
	ldrb	w1, [x22, 538]
	strb	w5, [x29, 96]
	strb	w4, [x29, 97]
	ldrb	w5, [x22, 539]
	ldrb	w4, [x22, 540]
	strb	w3, [x29, 98]
	strb	w0, [x29, 99]
	ldr	x3, [x21, 104]
	ldrb	w0, [x22, 541]
	strb	w5, [x29, 102]
	strb	w4, [x29, 103]
	strb	w2, [x29, 100]
	mov	x2, 16
	strb	w1, [x29, 101]
	add	x1, x29, 96
	strb	w0, [x29, 104]
	add	x0, x22, 3022
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 16
	mov	w1, 0
	add	x0, x29, 96
	blr	x3
	strb	wzr, [x29, 105]
	ldrb	w2, [x22, 45]
	ldrb	w1, [x22, 550]
	ldrb	w3, [x22, 551]
	ldrb	w0, [x22, 552]
	ldrb	w5, [x22, 553]
	ldrb	w4, [x22, 554]
	strb	w2, [x29, 96]
	strb	w1, [x29, 97]
	ldrb	w2, [x22, 555]
	ldrb	w1, [x22, 556]
	strb	w3, [x29, 98]
	strb	w0, [x29, 99]
	ldr	x3, [x21, 104]
	ldrb	w0, [x22, 557]
	strb	w2, [x29, 102]
	mov	x2, 16
	strb	w1, [x29, 103]
	add	x1, x29, 96
	strb	w0, [x29, 104]
	add	x0, x22, 3038
	strb	w5, [x29, 100]
	strb	w4, [x29, 101]
	strb	wzr, [x29, 106]
	blr	x3
	ldr	w0, [x25, 68]
	cbnz	w0, .L413
	add	x20, x22, 4096
	mov	w24, 0
	add	x19, x20, 46
.L414:
	add	x1, x22, x24, sxtw
	ldr	x3, [x21, 104]
	mov	x0, x19
	mov	x2, 11
	add	x1, x1, 1196
	add	w24, w24, 11
	add	x19, x19, 16
	blr	x3
	cmp	w24, 33
	bne	.L414
	add	x19, x20, 94
.L415:
	add	x1, x22, x24, sxtw
	ldr	x3, [x21, 104]
	mov	x0, x19
	mov	x2, 11
	add	x1, x1, 1196
	add	w24, w24, 11
	add	x19, x19, 16
	blr	x3
	cmp	w24, 66
	bne	.L415
	ldr	x3, [x21, 104]
	mov	x2, 14
	add	x1, x22, 580
	add	x0, x20, 718
	add	x26, x20, 142
	blr	x3
	ldr	x3, [x21, 104]
	mov	x2, 14
	add	x1, x22, 594
	add	x0, x20, 734
	blr	x3
.L422:
	sub	w20, w24, #66
	mov	x25, x26
	.p2align 2
.L425:
	add	w23, w20, 198
	mov	x27, x25
	mov	w19, w20
.L423:
	sxtw	x1, w19
	ldr	x3, [x21, 104]
	add	x1, x1, 608
	mov	x0, x27
	mov	x2, 11
	add	x1, x22, x1
	add	w19, w19, 66
	add	x27, x27, 16
	blr	x3
	cmp	w23, w19
	bne	.L423
	add	w20, w20, 11
	add	x25, x25, 48
	cmp	w24, w20
	bne	.L425
	add	w24, w24, 198
	add	x26, x26, 288
	cmp	w24, 462
	bne	.L422
.L421:
	ldr	x3, [x21, 104]
	add	x1, x22, 1004
	mov	x2, 64
	add	x0, x22, 3054
	blr	x3
	ldr	x3, [x21, 104]
	add	x1, x22, 1068
	mov	x2, 64
	add	x0, x22, 3118
	blr	x3
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	mov	w0, 0
	ldp	x29, x30, [sp], 112
	ret
.L413:
	add	x19, x22, 4096
	add	x20, x22, 8192
	ldr	x3, [x21, 104]
	mov	x2, 128
	add	x1, x20, 1352
	add	x0, x19, 750
	add	x25, x19, 1646
	add	x26, x20, 1480
	blr	x3
	add	x27, x19, 3182
	ldr	x3, [x21, 104]
	mov	x2, 128
	add	x1, x20, 3784
	add	x0, x19, 2414
	blr	x3
.L416:
	sub	x19, x25, #768
	mov	x24, x26
.L420:
	add	x23, x19, 256
	mov	x20, x24
.L417:
	ldr	x3, [x21, 104]
	mov	x2, 64
	mov	x1, x20
	mov	x0, x19
	add	x20, x20, x2
	add	x19, x19, x2
	blr	x3
	cmp	x19, x23
	bne	.L417
	cmp	x25, x19
	add	x24, x24, 384
	bne	.L420
	add	x25, x25, 768
	add	x26, x26, 1152
	cmp	x27, x25
	bne	.L416
	ldr	x3, [x21, 104]
	mov	x2, 960
	add	x1, x22, 1262
	add	x0, x22, 3182
	blr	x3
	b	.L421
	.size	VP6_CfgTable, .-VP6_CfgTable
	.align	3
.LC86:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VP6_BuildTables.part.3, %function
VP6_BuildTables.part.3:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	mov	x23, x2
	bl	_mcount
	ldr	w0, [x20, 20]
	cbz	w0, .L436
	mov	x2, x20
	mov	x1, x23
	mov	x0, x19
	bl	VP6_DecodeModeProbs
	mov	x2, x20
	mov	x1, x23
	mov	x0, x19
	bl	VP6_ConfigureMvEntropyDecoder
	ldr	w3, [x20, 20]
	mov	x0, x19
	mov	x2, x20
	mov	x1, x23
	bl	VP6_ConfigureEntropyDecoder
	ldr	w0, [x20, 68]
	cbnz	w0, .L442
.L438:
	mov	x1, x20
	mov	x0, x19
	bl	VP6_CfgTable
	ldr	x23, [sp, 48]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L436:
	ldr	x22, .LC87
	mov	x2, 80
	ldr	x21, .LC88
	add	x0, x19, 448
	ldr	x3, [x22, 104]
	add	x1, x21, 24
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 2
	add	x1, x21, 104
	add	x0, x19, 46
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 14
	add	x1, x21, 112
	add	x0, x19, 528
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 2
	add	x1, x21, 128
	add	x0, x19, 44
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 16
	add	x1, x21, 136
	add	x0, x19, 542
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 64
	add	x1, x21, 152
	add	x0, x19, 1132
	blr	x3
	mov	x1, x20
	mov	x0, x19
	bl	VP6_BuildScanOrder
	ldr	w3, [x20, 20]
	mov	x0, x19
	mov	x2, x20
	mov	x1, x23
	bl	VP6_ConfigureEntropyDecoder
	ldr	w0, [x20, 68]
	cbz	w0, .L438
.L442:
	mov	x0, x19
	bl	VP6_ConvertBoolToHuff
	b	.L438
	.size	VP6_BuildTables.part.3, .-VP6_BuildTables.part.3
	.align	3
.LC87:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC88:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_BuildTables
	.type	VP6_BuildTables, %function
VP6_BuildTables:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	x21, x2
	bl	_mcount
	cmp	x20, xzr
	ccmp	x21, xzr, 4, ne
	ccmp	x19, xzr, 4, ne
	beq	.L445
	mov	x2, x21
	mov	x1, x20
	mov	x0, x19
	bl	VP6_BuildTables.part.3
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L445:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	VP6_BuildTables, .-VP6_BuildTables
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsFrameSizeChanged
	.type	IsFrameSizeChanged, %function
IsFrameSizeChanged:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 12128]
	ldr	w0, [x19, 12272]
	cmp	w1, w0
	beq	.L449
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L449:
	ldr	w0, [x19, 12276]
	ldr	w1, [x19, 12132]
	ldr	x19, [sp, 16]
	cmp	w1, w0
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	IsFrameSizeChanged, .-IsFrameSizeChanged
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6DEC_Decode
	.type	VP6DEC_Decode, %function
VP6DEC_Decode:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x20, x1
	mov	x0, x30
	add	x21, x19, 288
	bl	_mcount
	ldr	x1, [x20]
	str	x1, [x19, 288]
	ldr	w0, [x20, 16]
	str	w0, [x21, 8]
	ldr	w2, [x20, 20]
	str	w2, [x21, 12]
	cbnz	w2, .L451
	add	x20, x19, 304
	mov	w0, 3
	strb	w0, [x20, 20]
.L452:
	mov	x0, x19
	bl	VP6_DecodeDecide
	cmp	w0, 1
	mov	w21, w0
	beq	.L466
	ldr	x2, .LC101
	mov	w1, 2139
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
.L454:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L451:
	cmp	w2, 2
	ble	.L486
	add	x23, x19, 12288
	add	x20, x19, 304
	add	x22, x23, 408
	mov	x0, x22
	bl	BsInit
	str	x21, [x19, 280]
	mov	x1, x22
	mov	x0, x20
	bl	VP6_GetPictureHeader
	cmp	w0, 1
	bne	.L487
	add	x1, x20, 8192
	cmp	x20, xzr
	add	x1, x1, 4056
	ccmp	x1, xzr, 4, ne
	ccmp	x22, xzr, 4, ne
	beq	.L457
	mov	x2, x22
	mov	x0, x20
	bl	VP6_BuildTables.part.3
	cmp	w0, 1
	bne	.L457
	ldr	w0, [x20, 16]
	cbz	w0, .L458
	ldr	w1, [x20, 12128]
	ldr	w0, [x20, 12272]
	cmp	w1, w0
	beq	.L488
.L458:
	ldr	x22, .LC95
	add	x21, x29, 72
	ldr	x4, [x22]
	cbz	x4, .L460
	ldr	w0, [x20, 12128]
	add	x21, x29, 72
	ldr	w3, [x20, 12132]
	ldr	w1, [x20, 12272]
	ldr	w2, [x20, 12276]
	strh	w0, [x29, 74]
	ldr	w0, [x19, 13344]
	strh	w3, [x29, 72]
	mov	w3, 8
	strh	w2, [x29, 76]
	mov	x2, x21
	strh	w1, [x29, 78]
	mov	w1, 1
	blr	x4
.L460:
	ldr	w0, [x19, 13344]
	mov	x3, x21
	add	x2, x29, 68
	add	x1, x29, 64
	stp	wzr, wzr, [x29, 64]
	str	wzr, [x29, 72]
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x19]
	ldr	w3, [x0, 736]
	cmp	w3, 1
	beq	.L489
.L462:
	ldr	w0, [x19, 13344]
	ldr	w1, [x20, 32]
	bl	FSP_ClearLogicFs
	ldr	w1, [x20, 36]
	ldr	w0, [x19, 13344]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 13344]
	bl	FSP_GetNullLogicFs
	str	wzr, [x20, 12]
	stp	w0, w0, [x20, 32]
	add	x1, x23, 448
	ldr	w0, [x19, 13344]
	bl	FSP_ClearNotInVoQueue
	mov	x0, x19
	bl	VP6_ArrangeVHBMem
	cmp	w0, 1
	beq	.L452
	ldr	x2, .LC99
	mov	w1, 2129
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	b	.L454
	.p2align 3
.L466:
	mov	x0, x19
	bl	VP6_GetImageBuffer
	cmp	w0, 1
	mov	w22, w0
	beq	.L467
	ldr	x2, .LC103
	mov	w1, 2147
	mov	w0, w21
	bl	dprint_normal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, 0
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L486:
	ldr	x2, .LC90
	mov	w1, 2071
	mov	w0, 1
	bl	dprint_normal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, 0
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L487:
	ldr	x2, .LC92
	mov	w1, 2080
	mov	w0, 1
	bl	dprint_normal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, 0
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L467:
	mov	x0, x19
	bl	VP6_InitFrameInfo
	cmp	w0, 1
	mov	w21, w0
	beq	.L468
	ldr	x2, .LC105
	mov	w1, 2155
	mov	w0, w22
	bl	dprint_normal
	mov	w0, 0
	b	.L454
	.p2align 3
.L457:
	ldr	x2, .LC94
	mov	w1, 2088
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	b	.L454
	.p2align 3
.L489:
	ldr	w0, [x29, 72]
	cmp	w0, wzr
	bgt	.L463
	ldr	w0, [x29, 68]
	cmp	w0, 32
	bgt	.L463
	ldr	x0, [x19, 8]
	cbnz	x0, .L463
	ldr	w4, [x20, 12132]
	cbz	w4, .L462
	ldr	w0, [x19, 13348]
	ldr	w7, [x20, 12272]
	cmp	w7, w0
	beq	.L462
	ldr	w0, [x19, 13352]
	ldr	w6, [x20, 12276]
	cmp	w6, w0
	beq	.L462
	ldr	x2, .LC97
	mov	w0, w3
	ldr	w5, [x20, 12128]
	mov	w1, 2113
	bl	dprint_normal
	ldr	w0, [x20, 12272]
	str	w0, [x19, 13348]
	ldr	x4, [x22]
	ldr	w0, [x20, 12276]
	str	w0, [x19, 13352]
	cbz	x4, .L462
	ldr	w0, [x19, 13344]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 48
	blr	x4
	b	.L462
	.p2align 3
.L488:
	ldr	w1, [x20, 12132]
	ldr	w0, [x20, 12276]
	cmp	w1, w0
	beq	.L452
	b	.L458
	.p2align 3
.L468:
	mov	x0, x19
	bl	VP6_Set_DecParam
	cmp	w0, 1
	mov	w19, w0
	beq	.L469
	ldr	x2, .LC107
	mov	w1, 2172
	mov	w0, w21
	bl	dprint_normal
	mov	w0, 0
	b	.L454
	.p2align 3
.L463:
	mov	w0, -2
	b	.L454
	.p2align 3
.L469:
	ldrb	w0, [x20, 20]
	ldr	x3, .LC108
	cbz	w0, .L490
	add	x0, x20, 8192
	ldr	x3, [x3, 104]
	add	x1, x0, 4056
	mov	x2, 144
	add	x0, x0, 3912
	ldr	w22, [x20, 12116]
	ldr	w21, [x20, 12120]
	blr	x3
	str	w22, [x20, 12116]
	mov	w0, w19
	str	w21, [x20, 12120]
	b	.L454
.L490:
	add	x0, x20, 8192
	ldr	x3, [x3, 104]
	add	x1, x0, 4056
	mov	x2, 144
	add	x0, x0, 3912
	blr	x3
	mov	w0, w19
	b	.L454
	.size	VP6DEC_Decode, .-VP6DEC_Decode
	.align	3
.LC90:
	.xword	.LC89
	.align	3
.LC92:
	.xword	.LC91
	.align	3
.LC94:
	.xword	.LC93
	.align	3
.LC95:
	.xword	g_EventReportFunc
	.align	3
.LC97:
	.xword	.LC96
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
.LC107:
	.xword	.LC106
	.align	3
.LC108:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6_SetImgFormat
	.type	VP6_SetImgFormat, %function
VP6_SetImgFormat:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 304
	bl	_mcount
	ldr	w1, [x19, 332]
	ldr	w0, [x19, 13344]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L491
	ldrb	w2, [x20, 20]
	mov	w5, 5
	ldrb	w3, [x0, 156]
	mov	w4, 1
	ldrb	w1, [x0, 157]
	bfi	w3, w2, 0, 2
	and	w2, w2, 3
	and	w1, w1, -4
	and	w3, w3, -29
	orr	w1, w1, 12
	bfi	w3, w5, 5, 3
	bfi	w1, w4, 4, 2
	strb	w3, [x0, 156]
	strb	w1, [x0, 157]
	mov	w1, 0
	stp	w2, w2, [x0, 24]
	ldr	w3, [x0, 156]
	and	w2, w3, -114689
	str	w2, [x0, 156]
	bl	SetAspectRatio
	ldp	w1, w0, [x19, 32]
	lsr	w1, w1, 1
	lsr	w0, w0, 1
	stp	w1, w0, [x19, 48]
.L491:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VP6_SetImgFormat, .-VP6_SetImgFormat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6DEC_VDMPostProc
	.type	VP6DEC_VDMPostProc, %function
VP6DEC_VDMPostProc:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w21, w1
	add	x19, x20, 304
	bl	_mcount
	ldr	x2, .LC110
	mov	w3, w21
	mov	w1, 2228
	mov	w0, 20
	bl	dprint_normal
	mov	x1, x20
	mov	w0, 10
	bl	ReleasePacket
	ldr	w1, [x19, 28]
	ldr	w0, [x20, 13344]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L529
	tbnz	w21, #31, .L499
	cmp	w21, 100
	mov	w3, 100
	csel	w3, w21, w3, le
	str	w3, [x0, 96]
	ldr	x0, [x20]
	ldr	w4, [x0]
	cmp	w3, w4
	bhi	.L530
	mov	x0, x20
	bl	VP6_SetImgFormat
	ldr	w0, [x19, 8]
	mov	w1, 1
	str	w1, [x19, 12]
	cmp	w0, 2
	beq	.L531
.L501:
	ldr	w1, [x19, 28]
	str	w1, [x19, 40]
.L502:
	cmn	w1, #1
	beq	.L503
	ldr	w0, [x20, 13344]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L532
	ldr	w1, [x19, 40]
	mov	w2, 1
	ldr	w0, [x20, 13344]
	bl	FSP_SetDisplay
	add	x3, x20, 12288
	ldr	w0, [x20, 13344]
	mov	x4, x22
	add	x3, x3, 448
	mov	x2, x20
	mov	w1, 10
	bl	InsertImgToVoQueue
	cmp	w0, 1
	mov	w21, w0
	bne	.L533
.L503:
	ldp	w0, w3, [x19, 32]
	cmp	w3, w0
	beq	.L534
.L528:
	ldr	w1, [x19, 28]
	cmp	w3, w1
	beq	.L506
	ldr	w0, [x20, 13344]
	mov	w2, 0
	mov	w1, w3
	bl	FSP_SetRef
.L526:
	ldr	w1, [x19, 28]
.L506:
	str	w1, [x19, 36]
	mov	w2, 1
	ldr	w0, [x20, 13344]
	bl	FSP_SetRef
	ldrb	w0, [x19, 20]
	cbnz	w0, .L535
	ldp	w1, w3, [x19, 28]
	cmp	w3, w1
	beq	.L509
.L536:
	ldr	w0, [x20, 13344]
	mov	w1, w3
	mov	w2, 0
	bl	FSP_SetRef
	ldr	w1, [x19, 28]
.L509:
	str	w1, [x19, 32]
	mov	w2, 1
	ldr	w0, [x20, 13344]
	bl	FSP_SetRef
	mov	w0, 1
.L519:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L535:
	ldr	w1, [x19, 24]
	mov	w0, 1
	cbz	w1, .L519
	ldp	w1, w3, [x19, 28]
	cmp	w3, w1
	bne	.L536
	b	.L509
	.p2align 3
.L499:
	str	wzr, [x0, 96]
	mov	x0, x20
	bl	VP6_SetImgFormat
	ldr	w0, [x19, 8]
	mov	w1, 1
	str	w1, [x19, 12]
	cmp	w0, 2
	bne	.L501
.L531:
	ldrb	w0, [x19, 20]
	cbz	w0, .L501
	mov	w0, -1
	str	w0, [x19, 40]
	ldr	w1, [x19, 28]
	mov	w2, 0
	ldr	w0, [x20, 13344]
	bl	FSP_SetDisplay
	ldr	w1, [x19, 40]
	b	.L502
	.p2align 3
.L533:
	ldr	w1, [x19, 28]
	mov	w2, 0
	ldr	w0, [x20, 13344]
	bl	FSP_SetRef
	ldr	w0, [x20, 13344]
	ldr	x1, [x22, 168]
	bl	FreeUsdByDec
	str	xzr, [x22, 168]
	ldr	x1, [x22, 176]
	ldr	w0, [x20, 13344]
	bl	FreeUsdByDec
	str	xzr, [x22, 176]
	mov	w2, 0
	ldr	w1, [x19, 40]
	ldr	w0, [x20, 13344]
	bl	FSP_SetDisplay
	ldr	x2, .LC118
	mov	w1, 2295
	mov	w0, 0
	bl	dprint_normal
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L534:
	ldr	w0, [x20, 13344]
	mov	w1, w3
	bl	FSP_GetRef
	cbnz	w0, .L526
	ldr	w3, [x19, 36]
	b	.L528
	.p2align 3
.L530:
	ldr	x2, .LC114
	mov	w1, 2244
	mov	w0, 1
	bl	dprint_normal
	ldr	w1, [x19, 28]
	mov	w2, 0
	ldr	w0, [x20, 13344]
	bl	FSP_SetRef
	ldr	w0, [x20, 13344]
	ldr	x1, [x22, 168]
	bl	FreeUsdByDec
	str	xzr, [x22, 168]
	ldr	x1, [x22, 176]
	ldr	w0, [x20, 13344]
	bl	FreeUsdByDec
	str	xzr, [x22, 176]
	mov	w2, 0
	ldr	w1, [x19, 28]
	ldr	w0, [x20, 13344]
	bl	FSP_SetDisplay
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 13344]
	bl	FSP_ClearLogicFs
	ldr	w1, [x19, 36]
	ldr	w0, [x20, 13344]
	bl	FSP_ClearLogicFs
	ldr	w0, [x20, 13344]
	bl	FSP_GetNullLogicFs
	str	wzr, [x19, 12]
	stp	w0, w0, [x19, 32]
	mov	w0, -1
	b	.L519
.L532:
	ldr	x2, .LC116
	mov	x3, 0
	mov	w1, 2279
	mov	w0, 20
	bl	dprint_normal
	mov	w0, -1
	b	.L519
.L529:
	ldr	x2, .LC112
	mov	w1, 2236
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L519
	.size	VP6DEC_VDMPostProc, .-VP6DEC_VDMPostProc
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
.LC118:
	.xword	.LC117
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6DEC_RecycleImage
	.type	VP6DEC_RecycleImage, %function
VP6DEC_RecycleImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L539
	ldr	w0, [x19, 13344]
	mov	w1, w20
	mov	w2, 0
	bl	FSP_SetDisplay
	ldr	w0, [x19, 13344]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L540
	ldr	w0, [x19, 13344]
	ldr	x1, [x20, 168]
	bl	FreeUsdByDec
	str	xzr, [x20, 168]
	ldr	x1, [x20, 176]
	ldr	w0, [x19, 13344]
	bl	FreeUsdByDec
	str	xzr, [x20, 176]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L539:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L540:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VP6DEC_RecycleImage, .-VP6DEC_RecycleImage
	.global	DefaultScanBands
	.global	ZrlUpdateProbs
	.global	ScanBandUpdateProbs
	.global	ZeroRunProbDefaults
	.global	VP6_AcUpdateProbs
	.global	VP6_DcUpdateProbs
	.global	DefaultSignProbs
	.global	DefaultIsShortProbs
	.global	DefaultMvLongProbs
	.global	DefaultMvShortProbs
	.global	VP6_MvUpdateProbs
	.global	VP6_BaselineXmittedProbs
	.global	VP6_ModeVq
	.global	VP6_DcNodeEqs
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.9873, %object
	.size	__func__.9873, 18
__func__.9873:
	.string	"VP6_ArrangeVHBMem"
	.zero	6
	.type	VP6_DcNodeEqs, %object
	.size	VP6_DcNodeEqs, 120
VP6_DcNodeEqs:
	.word	122
	.word	133
	.word	133
	.word	51
	.word	142
	.word	-16
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	78
	.word	171
	.word	169
	.word	71
	.word	221
	.word	-30
	.word	139
	.word	117
	.word	214
	.word	44
	.word	246
	.word	-3
	.word	168
	.word	79
	.word	210
	.word	38
	.word	203
	.word	17
	.type	VP6_DcUpdateProbs, %object
	.size	VP6_DcUpdateProbs, 22
VP6_DcUpdateProbs:
	.byte	-110
	.byte	-1
	.byte	-75
	.byte	-49
	.byte	-24
	.byte	-13
	.byte	-18
	.byte	-5
	.byte	-12
	.byte	-6
	.byte	-7
	.byte	-77
	.byte	-1
	.byte	-42
	.byte	-16
	.byte	-6
	.byte	-1
	.byte	-12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.zero	2
	.type	ZeroRunProbDefaults, %object
	.size	ZeroRunProbDefaults, 28
ZeroRunProbDefaults:
	.byte	-58
	.byte	-59
	.byte	-60
	.byte	-110
	.byte	-58
	.byte	-52
	.byte	-87
	.byte	-114
	.byte	-126
	.byte	-120
	.byte	-107
	.byte	-107
	.byte	-65
	.byte	-7
	.byte	-121
	.byte	-55
	.byte	-75
	.byte	-102
	.byte	98
	.byte	117
	.byte	-124
	.byte	126
	.byte	-110
	.byte	-87
	.byte	-72
	.byte	-16
	.byte	-10
	.byte	-2
	.zero	4
	.type	ScanBandUpdateProbs, %object
	.size	ScanBandUpdateProbs, 64
ScanBandUpdateProbs:
	.byte	-1
	.byte	-124
	.byte	-124
	.byte	-97
	.byte	-103
	.byte	-105
	.byte	-95
	.byte	-86
	.byte	-92
	.byte	-94
	.byte	-120
	.byte	110
	.byte	103
	.byte	114
	.byte	-127
	.byte	118
	.byte	124
	.byte	125
	.byte	-124
	.byte	-120
	.byte	114
	.byte	110
	.byte	-114
	.byte	-121
	.byte	-122
	.byte	123
	.byte	-113
	.byte	126
	.byte	-103
	.byte	-73
	.byte	-90
	.byte	-95
	.byte	-85
	.byte	-76
	.byte	-77
	.byte	-92
	.byte	-53
	.byte	-38
	.byte	-31
	.byte	-39
	.byte	-41
	.byte	-50
	.byte	-53
	.byte	-39
	.byte	-27
	.byte	-15
	.byte	-8
	.byte	-13
	.byte	-3
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.type	ZrlUpdateProbs, %object
	.size	ZrlUpdateProbs, 28
ZrlUpdateProbs:
	.byte	-37
	.byte	-10
	.byte	-18
	.byte	-7
	.byte	-24
	.byte	-17
	.byte	-7
	.byte	-1
	.byte	-8
	.byte	-3
	.byte	-17
	.byte	-12
	.byte	-15
	.byte	-8
	.byte	-58
	.byte	-24
	.byte	-5
	.byte	-3
	.byte	-37
	.byte	-15
	.byte	-3
	.byte	-1
	.byte	-8
	.byte	-7
	.byte	-12
	.byte	-18
	.byte	-5
	.byte	-1
	.zero	4
	.type	VP6_AcUpdateProbs, %object
	.size	VP6_AcUpdateProbs, 396
VP6_AcUpdateProbs:
	.byte	-29
	.byte	-10
	.byte	-26
	.byte	-9
	.byte	-12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-47
	.byte	-25
	.byte	-25
	.byte	-7
	.byte	-7
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-31
	.byte	-14
	.byte	-15
	.byte	-5
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-15
	.byte	-3
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-16
	.byte	-1
	.byte	-8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-16
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-50
	.byte	-53
	.byte	-29
	.byte	-17
	.byte	-9
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-49
	.byte	-57
	.byte	-36
	.byte	-20
	.byte	-13
	.byte	-4
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-44
	.byte	-37
	.byte	-26
	.byte	-13
	.byte	-12
	.byte	-3
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-20
	.byte	-19
	.byte	-9
	.byte	-4
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-16
	.byte	-16
	.byte	-8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-26
	.byte	-23
	.byte	-7
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-18
	.byte	-18
	.byte	-6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-8
	.byte	-5
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-31
	.byte	-17
	.byte	-29
	.byte	-25
	.byte	-12
	.byte	-3
	.byte	-13
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-24
	.byte	-22
	.byte	-32
	.byte	-28
	.byte	-14
	.byte	-7
	.byte	-14
	.byte	-4
	.byte	-5
	.byte	-5
	.byte	-1
	.byte	-21
	.byte	-7
	.byte	-18
	.byte	-16
	.byte	-5
	.byte	-1
	.byte	-7
	.byte	-1
	.byte	-3
	.byte	-3
	.byte	-1
	.byte	-7
	.byte	-3
	.byte	-5
	.byte	-6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-5
	.byte	-6
	.byte	-7
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-13
	.byte	-12
	.byte	-6
	.byte	-6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-7
	.byte	-8
	.byte	-6
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.zero	4
	.type	VP6_ModeVq, %object
	.size	VP6_ModeVq, 960
VP6_ModeVq:
	.byte	9
	.byte	15
	.byte	32
	.byte	25
	.byte	7
	.byte	19
	.byte	9
	.byte	21
	.byte	1
	.byte	12
	.byte	14
	.byte	12
	.byte	3
	.byte	18
	.byte	14
	.byte	23
	.byte	3
	.byte	10
	.byte	0
	.byte	4
	.byte	48
	.byte	39
	.byte	1
	.byte	2
	.byte	11
	.byte	27
	.byte	29
	.byte	44
	.byte	7
	.byte	27
	.byte	1
	.byte	4
	.byte	0
	.byte	3
	.byte	1
	.byte	6
	.byte	1
	.byte	2
	.byte	0
	.byte	0
	.byte	21
	.byte	32
	.byte	1
	.byte	2
	.byte	4
	.byte	10
	.byte	32
	.byte	43
	.byte	6
	.byte	23
	.byte	2
	.byte	3
	.byte	1
	.byte	19
	.byte	1
	.byte	6
	.byte	12
	.byte	21
	.byte	0
	.byte	7
	.byte	69
	.byte	83
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	10
	.byte	29
	.byte	3
	.byte	12
	.byte	0
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	3
	.byte	2
	.byte	2
	.byte	0
	.byte	0
	.byte	11
	.byte	20
	.byte	1
	.byte	4
	.byte	18
	.byte	36
	.byte	43
	.byte	48
	.byte	13
	.byte	35
	.byte	0
	.byte	2
	.byte	0
	.byte	5
	.byte	3
	.byte	12
	.byte	1
	.byte	2
	.byte	0
	.byte	0
	.byte	70
	.byte	44
	.byte	0
	.byte	1
	.byte	2
	.byte	10
	.byte	37
	.byte	46
	.byte	8
	.byte	26
	.byte	0
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	8
	.byte	15
	.byte	0
	.byte	1
	.byte	8
	.byte	21
	.byte	74
	.byte	53
	.byte	22
	.byte	42
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	3
	.byte	1
	.byte	2
	.byte	0
	.byte	0
	.byte	-115
	.byte	42
	.byte	0
	.byte	0
	.byte	1
	.byte	4
	.byte	11
	.byte	24
	.byte	1
	.byte	11
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	8
	.byte	19
	.byte	4
	.byte	10
	.byte	24
	.byte	45
	.byte	21
	.byte	37
	.byte	9
	.byte	29
	.byte	0
	.byte	3
	.byte	1
	.byte	7
	.byte	11
	.byte	25
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	46
	.byte	42
	.byte	0
	.byte	1
	.byte	2
	.byte	10
	.byte	54
	.byte	51
	.byte	10
	.byte	30
	.byte	0
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	28
	.byte	32
	.byte	0
	.byte	0
	.byte	3
	.byte	10
	.byte	75
	.byte	51
	.byte	14
	.byte	33
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	0
	.byte	0
	.byte	100
	.byte	46
	.byte	0
	.byte	1
	.byte	3
	.byte	9
	.byte	21
	.byte	37
	.byte	5
	.byte	20
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	1
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	27
	.byte	29
	.byte	0
	.byte	1
	.byte	9
	.byte	25
	.byte	53
	.byte	51
	.byte	12
	.byte	34
	.byte	0
	.byte	1
	.byte	0
	.byte	3
	.byte	1
	.byte	5
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	80
	.byte	38
	.byte	0
	.byte	0
	.byte	1
	.byte	4
	.byte	69
	.byte	33
	.byte	5
	.byte	16
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	16
	.byte	20
	.byte	0
	.byte	0
	.byte	2
	.byte	8
	.byte	104
	.byte	49
	.byte	15
	.byte	33
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	-62
	.byte	16
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	9
	.byte	1
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	41
	.byte	22
	.byte	1
	.byte	0
	.byte	1
	.byte	31
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	7
	.byte	0
	.byte	1
	.byte	98
	.byte	25
	.byte	4
	.byte	10
	.byte	123
	.byte	37
	.byte	6
	.byte	4
	.byte	1
	.byte	27
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	5
	.byte	8
	.byte	1
	.byte	7
	.byte	0
	.byte	1
	.byte	12
	.byte	10
	.byte	0
	.byte	2
	.byte	26
	.byte	14
	.byte	14
	.byte	12
	.byte	0
	.byte	24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	17
	.byte	1
	.byte	9
	.byte	0
	.byte	36
	.byte	5
	.byte	7
	.byte	1
	.byte	3
	.byte	-47
	.byte	5
	.byte	0
	.byte	0
	.byte	0
	.byte	27
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	5
	.byte	4
	.byte	5
	.byte	0
	.byte	121
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	2
	.byte	4
	.byte	1
	.byte	4
	.byte	2
	.byte	2
	.byte	0
	.byte	1
	.byte	-81
	.byte	5
	.byte	0
	.byte	1
	.byte	0
	.byte	48
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	83
	.byte	5
	.byte	2
	.byte	3
	.byte	0
	.byte	102
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	3
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-23
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	8
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	34
	.byte	16
	.byte	112
	.byte	21
	.byte	1
	.byte	28
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	8
	.byte	1
	.byte	7
	.byte	0
	.byte	3
	.byte	2
	.byte	5
	.byte	0
	.byte	2
	.byte	-97
	.byte	35
	.byte	2
	.byte	2
	.byte	0
	.byte	25
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	6
	.byte	0
	.byte	5
	.byte	0
	.byte	1
	.byte	4
	.byte	4
	.byte	0
	.byte	1
	.byte	75
	.byte	39
	.byte	5
	.byte	7
	.byte	2
	.byte	48
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	11
	.byte	2
	.byte	16
	.byte	1
	.byte	4
	.byte	7
	.byte	10
	.byte	0
	.byte	2
	.byte	-44
	.byte	21
	.byte	0
	.byte	1
	.byte	0
	.byte	9
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	2
	.byte	2
	.byte	0
	.byte	0
	.byte	4
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	-84
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	-69
	.byte	22
	.byte	1
	.byte	1
	.byte	0
	.byte	17
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	6
	.byte	0
	.byte	4
	.byte	0
	.byte	1
	.byte	4
	.byte	4
	.byte	0
	.byte	1
	.byte	-123
	.byte	6
	.byte	1
	.byte	2
	.byte	1
	.byte	70
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	4
	.byte	0
	.byte	3
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	-5
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	0
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	11
	.byte	4
	.byte	1
	.byte	4
	.byte	0
	.byte	2
	.byte	3
	.byte	2
	.byte	0
	.byte	4
	.byte	49
	.byte	46
	.byte	3
	.byte	4
	.byte	7
	.byte	31
	.byte	42
	.byte	41
	.byte	0
	.byte	0
	.byte	2
	.byte	6
	.byte	1
	.byte	7
	.byte	1
	.byte	4
	.byte	2
	.byte	4
	.byte	0
	.byte	1
	.byte	26
	.byte	25
	.byte	1
	.byte	1
	.byte	2
	.byte	10
	.byte	67
	.byte	39
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	14
	.byte	0
	.byte	2
	.byte	31
	.byte	26
	.byte	1
	.byte	6
	.byte	103
	.byte	46
	.byte	1
	.byte	2
	.byte	2
	.byte	10
	.byte	33
	.byte	42
	.byte	0
	.byte	0
	.byte	1
	.byte	4
	.byte	0
	.byte	3
	.byte	0
	.byte	1
	.byte	1
	.byte	3
	.byte	0
	.byte	0
	.byte	14
	.byte	31
	.byte	9
	.byte	13
	.byte	14
	.byte	54
	.byte	22
	.byte	29
	.byte	0
	.byte	0
	.byte	2
	.byte	6
	.byte	4
	.byte	18
	.byte	6
	.byte	13
	.byte	1
	.byte	5
	.byte	0
	.byte	1
	.byte	85
	.byte	39
	.byte	0
	.byte	0
	.byte	1
	.byte	9
	.byte	69
	.byte	40
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	0
	.byte	0
	.byte	31
	.byte	28
	.byte	0
	.byte	0
	.byte	3
	.byte	14
	.byte	-126
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	1
	.byte	3
	.byte	3
	.byte	0
	.byte	1
	.byte	-85
	.byte	25
	.byte	0
	.byte	0
	.byte	1
	.byte	5
	.byte	25
	.byte	21
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	17
	.byte	21
	.byte	68
	.byte	29
	.byte	6
	.byte	15
	.byte	13
	.byte	22
	.byte	0
	.byte	0
	.byte	6
	.byte	12
	.byte	3
	.byte	14
	.byte	4
	.byte	10
	.byte	1
	.byte	7
	.byte	0
	.byte	3
	.byte	51
	.byte	39
	.byte	0
	.byte	1
	.byte	2
	.byte	12
	.byte	91
	.byte	44
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	3
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	0
	.byte	1
	.byte	81
	.byte	25
	.byte	0
	.byte	0
	.byte	2
	.byte	9
	.byte	106
	.byte	26
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	-116
	.byte	37
	.byte	0
	.byte	1
	.byte	1
	.byte	8
	.byte	24
	.byte	33
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	0
	.byte	0
	.byte	14
	.byte	23
	.byte	1
	.byte	3
	.byte	11
	.byte	53
	.byte	90
	.byte	31
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	1
	.byte	5
	.byte	2
	.byte	6
	.byte	1
	.byte	2
	.byte	0
	.byte	0
	.byte	123
	.byte	29
	.byte	0
	.byte	0
	.byte	1
	.byte	7
	.byte	57
	.byte	30
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	13
	.byte	14
	.byte	0
	.byte	0
	.byte	4
	.byte	20
	.byte	-81
	.byte	20
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	-54
	.byte	23
	.byte	0
	.byte	0
	.byte	1
	.byte	3
	.byte	2
	.byte	9
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	VP6_MvUpdateProbs, %object
	.size	VP6_MvUpdateProbs, 34
VP6_MvUpdateProbs:
	.byte	-19
	.byte	-10
	.byte	-3
	.byte	-3
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-6
	.byte	-6
	.byte	-4
	.byte	-25
	.byte	-13
	.byte	-11
	.byte	-3
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-5
	.byte	-5
	.byte	-2
	.zero	6
	.type	VP6_LoopFilterLimitValues, %object
	.size	VP6_LoopFilterLimitValues, 64
VP6_LoopFilterLimitValues:
	.byte	14
	.byte	14
	.byte	13
	.byte	13
	.byte	12
	.byte	12
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	6
	.byte	6
	.byte	6
	.byte	6
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
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.type	DcQuantTab, %object
	.size	DcQuantTab, 128
DcQuantTab:
	.hword	188
	.hword	188
	.hword	188
	.hword	188
	.hword	180
	.hword	172
	.hword	172
	.hword	172
	.hword	172
	.hword	172
	.hword	168
	.hword	164
	.hword	164
	.hword	160
	.hword	160
	.hword	160
	.hword	160
	.hword	140
	.hword	140
	.hword	140
	.hword	140
	.hword	132
	.hword	132
	.hword	132
	.hword	132
	.hword	128
	.hword	128
	.hword	128
	.hword	108
	.hword	108
	.hword	104
	.hword	104
	.hword	100
	.hword	100
	.hword	96
	.hword	96
	.hword	92
	.hword	92
	.hword	76
	.hword	76
	.hword	76
	.hword	76
	.hword	72
	.hword	72
	.hword	68
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	60
	.hword	44
	.hword	44
	.hword	44
	.hword	40
	.hword	40
	.hword	36
	.hword	32
	.hword	28
	.hword	20
	.hword	12
	.hword	12
	.hword	8
	.hword	8
	.type	AcQuantTab, %object
	.size	AcQuantTab, 128
AcQuantTab:
	.hword	376
	.hword	368
	.hword	360
	.hword	352
	.hword	344
	.hword	328
	.hword	312
	.hword	296
	.hword	280
	.hword	264
	.hword	248
	.hword	232
	.hword	216
	.hword	212
	.hword	208
	.hword	204
	.hword	200
	.hword	196
	.hword	192
	.hword	188
	.hword	184
	.hword	180
	.hword	176
	.hword	172
	.hword	168
	.hword	160
	.hword	156
	.hword	148
	.hword	144
	.hword	140
	.hword	136
	.hword	132
	.hword	128
	.hword	124
	.hword	120
	.hword	116
	.hword	112
	.hword	108
	.hword	104
	.hword	100
	.hword	96
	.hword	92
	.hword	88
	.hword	84
	.hword	80
	.hword	76
	.hword	72
	.hword	68
	.hword	64
	.hword	60
	.hword	56
	.hword	52
	.hword	48
	.hword	44
	.hword	40
	.hword	36
	.hword	32
	.hword	28
	.hword	24
	.hword	20
	.hword	16
	.hword	12
	.hword	8
	.hword	4
	.type	__FUNCTION__.10182, %object
	.size	__FUNCTION__.10182, 17
__FUNCTION__.10182:
	.string	"VP6_DecodeDecide"
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.10196, %object
	.size	__func__.10196, 17
__func__.10196:
	.string	"VP6_Set_DecParam"
	.zero	7
	.type	VP6_BaselineXmittedProbs, %object
	.size	VP6_BaselineXmittedProbs, 80
VP6_BaselineXmittedProbs:
	.byte	42
	.byte	2
	.byte	7
	.byte	42
	.byte	22
	.byte	3
	.byte	2
	.byte	5
	.byte	1
	.byte	0
	.byte	69
	.byte	1
	.byte	1
	.byte	44
	.byte	6
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	8
	.byte	1
	.byte	8
	.byte	0
	.byte	0
	.byte	2
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	-27
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	35
	.byte	1
	.byte	6
	.byte	34
	.byte	0
	.byte	2
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	122
	.byte	1
	.byte	1
	.byte	46
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	64
	.byte	0
	.byte	64
	.byte	64
	.byte	64
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	64
	.byte	0
	.byte	64
	.byte	64
	.byte	64
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	DefaultIsShortProbs, %object
	.size	DefaultIsShortProbs, 2
DefaultIsShortProbs:
	.byte	-94
	.byte	-92
	.zero	6
	.type	DefaultMvShortProbs, %object
	.size	DefaultMvShortProbs, 14
DefaultMvShortProbs:
	.byte	-31
	.byte	-110
	.byte	-84
	.byte	-109
	.byte	-42
	.byte	39
	.byte	-100
	.byte	-52
	.byte	-86
	.byte	119
	.byte	-21
	.byte	-116
	.byte	-26
	.byte	-28
	.zero	2
	.type	DefaultSignProbs, %object
	.size	DefaultSignProbs, 2
DefaultSignProbs:
	.byte	-128
	.byte	-128
	.zero	6
	.type	DefaultMvLongProbs, %object
	.size	DefaultMvLongProbs, 16
DefaultMvLongProbs:
	.byte	-9
	.byte	-46
	.byte	-121
	.byte	68
	.byte	-118
	.byte	-36
	.byte	-17
	.byte	-10
	.byte	-12
	.byte	-72
	.byte	-55
	.byte	44
	.byte	-83
	.byte	-35
	.byte	-17
	.byte	-3
	.type	DefaultScanBands, %object
	.size	DefaultScanBands, 64
DefaultScanBands:
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	6
	.byte	6
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	8
	.byte	8
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	10
	.byte	10
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC2:
	ASCII(.string	"%s arrange fs pool failed!\n" )
	.zero	4
.LC4:
	ASCII(.string	"get frame store fail!\n" )
	.zero	1
.LC6:
	ASCII(.string	"get image buffer ok: LogicFsID = %d\n" )
	.zero	3
.LC8:
	ASCII(.string	"VP6 FSP_GetFsImagePtr Error!\n" )
	.zero	2
.LC10:
	ASCII(.string	"dec_pts: %lld Usertag = %lld\n" )
	.zero	2
.LC31:
	ASCII(.string	"enter VP6_ConvertBoolToHuff\n" )
	.zero	3
.LC33:
	ASCII(.string	"leave VP6_ConvertBoolToHuff\n" )
	.zero	3
.LC35:
	ASCII(.string	"enter VP6_IntraFrmHeader\n" )
	.zero	6
.LC37:
	ASCII(.string	"error: Vp3VersionNo %d > CURRENT_DECODE_VERSION(8)\n" )
	.zero	4
.LC39:
	ASCII(.string	"error: bitstream error!\n" )
	.zero	7
.LC41:
	ASCII(.string	"We have a new size image!\n The old size is %d x %d, and the new is %d x %d\n" )
	.zero	4
.LC43:
	ASCII(.string	"leave VP6_IntraFrmHeader\n" )
	.zero	6
.LC45:
	ASCII(.string	"VP6_InterFrmHeader VersionNo fault,old:%d,new:%d\n" )
	.zero	6
.LC47:
	ASCII(.string	"[ERR]VP6_GetPictureHeader invalid param!\n" )
	.zero	6
.LC49:
	ASCII(.string	"VP6_GetPictureHeader enter!\n" )
	.zero	3
.LC52:
	ASCII(.string	"VP6_GetPictureHeader leave!\n" )
	.zero	3
.LC58:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC60:
	ASCII(.string	"VP6DEC_Init leave\n" )
	.zero	5
.LC62:
	ASCII(.string	"ERROR: No Img buffer is allocated\n" )
	.zero	5
.LC64:
	ASCII(.string	"----------------- vp6 Imode -> %d ------------------\n" )
	.zero	2
.LC66:
	ASCII(.string	"-----I_MODE, but FrameType is %d-----\n" )
	.zero	1
.LC68:
	ASCII(.string	"P-frm" )
	.zero	2
.LC70:
	ASCII(.string	"-----cur framtype is %s, but refnum=%d-----\n" )
	.zero	3
.LC72:
	ASCII(.string	"error: DecMode illegal\n" )
.LC75:
	ASCII(.string	"%s %d NULL == pFwdImg!!\n" )
	.zero	7
.LC77:
	ASCII(.string	"dec P frame, fwd ref err(%d) > ref_thr(%d)\n" )
	.zero	4
.LC82:
	ASCII(.string	"%s ERROR: logic fs is null!\n" )
	.zero	3
.LC84:
	ASCII(.string	"%s ERROR: cur fs pstDecodeFs is null!\n" )
	.zero	1
.LC89:
	ASCII(.string	"Error! Truncated packet\n" )
	.zero	7
.LC91:
	ASCII(.string	"[ERR]VP6_GetPictureHeader Error!\n" )
	.zero	6
.LC93:
	ASCII(.string	"[ERR] VP6_DecodeDecide Error!\n" )
	.zero	1
.LC96:
	ASCII(.string	"IsSizeChanged = %d,old w/h = %d/%d,new w/h = %d/%d\n" )
	.zero	4
.LC98:
	ASCII(.string	"VP6_ArrangeVHBMem err\n" )
	.zero	1
.LC100:
	ASCII(.string	"VP6_DecodeDecide err\n" )
	.zero	2
.LC102:
	ASCII(.string	"VP6DEC_GetImageBuffer err\n" )
	.zero	5
.LC104:
	ASCII(.string	"VP6_InitFrameInfo err\n" )
	.zero	1
.LC106:
	ASCII(.string	"VP6_Set_DecParam Error!\n" )
	.zero	7
.LC109:
	ASCII(.string	"ErrRatio = %d\n" )
	.zero	1
.LC111:
	ASCII(.string	"pCurImg is null\n" )
	.zero	7
.LC113:
	ASCII(.string	"err_level(%d) over ref_thr(%d)\n" )
.LC115:
	ASCII(.string	"line: %d pToQueImg is null!\n" )
	.zero	3
.LC117:
	ASCII(.string	"insert img to Voqueue failed!\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
