#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"hevc.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	HEVC_ComparePicByPocAsc, %function
HEVC_ComparePicByPocAsc:
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
	ldr	w1, [x0, 8]
	ldr	w2, [x2, 8]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	HEVC_ComparePicByPocAsc, .-HEVC_ComparePicByPocAsc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	HEVC_CheckThatAllRefPicsAreAvailable.part.8, %function
HEVC_CheckThatAllRefPicsAreAvailable.part.8:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	w0, [x19, 4708]
	mov	w4, 1888
	ldr	x2, [x19, 2360]
	add	x7, x19, 4096
	add	x15, x7, 1508
	ldr	x1, [x19, 2352]
	mov	w3, 12660
	ldr	w8, [x19, 5604]
	smaddl	x2, w0, w4, x2
	ldr	w4, [x15, 4]
	mov	w0, 1
	ldr	w16, [x15, 8]
	ldr	w2, [x2, 32]
	add	w8, w8, w4
	cmp	w8, w16
	mov	w11, w8
	smaddl	x1, w2, w3, x1
	ldr	w14, [x1, 116]
	lsl	w14, w0, w14
	bcs	.L5
	ldr	w3, [x19, 2772]
	mov	w10, 0
	sub	w14, w14, #1
	mov	w9, 0
	.p2align 2
.L6:
	sxtw	x13, w11
	cbz	w3, .L12
	add	x5, x19, x13, lsl 2
	mov	w12, 0
	mov	w0, 0
	ldr	w2, [x5, 4760]
	b	.L9
	.p2align 3
.L63:
	cbz	w4, .L8
	ldr	w6, [x1, 8]
	ldr	w4, [x5, 5704]
	cmp	w6, w4
	beq	.L60
	.p2align 2
.L8:
	add	w0, w0, 1
	cmp	w0, w3
	beq	.L62
.L9:
	add	x1, x19, x0, sxtw 3
	ldr	x1, [x1, 2792]
	ldr	w4, [x1, 60]
	cbnz	w2, .L63
	cbz	w4, .L8
	ldr	w6, [x1, 8]
	ldr	w4, [x5, 5704]
	eor	w4, w6, w4
	tst	w4, w14
	bne	.L8
.L60:
	ldrb	w4, [x1, 1]
	cbz	w4, .L8
	ldr	x4, [x19, 2432]
	ldr	w6, [x1, 16]
	ldr	w1, [x4, 4]
	cmp	w6, w1
	bls	.L24
	ldr	w1, [x4, 684]
	add	w0, w0, 1
	cmp	w1, 1
	csinc	w12, w12, wzr, eq
	cmp	w0, w3
	bne	.L9
	.p2align 2
.L62:
	cbz	w12, .L12
.L10:
	add	w11, w11, 1
	cmp	w16, w11
	bne	.L6
	cbz	w8, .L14
.L13:
	mov	w11, 0
	add	x7, x7, 1508
	.p2align 2
.L18:
	mov	w12, 0
	mov	w0, 0
	sxtw	x5, w11
	cbnz	w3, .L45
	b	.L20
	.p2align 3
.L15:
	add	w0, w0, 1
	cmp	w0, w3
	beq	.L64
.L45:
	add	x2, x19, x0, sxtw 3
	add	x1, x5, 8
	ldr	x2, [x2, 2792]
	ldr	w4, [x2, 60]
	cbnz	w4, .L15
	ldr	w4, [x7, x1, lsl 2]
	ldr	w6, [x19, 4684]
	ldr	w1, [x2, 8]
	add	w4, w6, w4
	cmp	w1, w4
	bne	.L15
	ldrb	w1, [x2, 1]
	cbz	w1, .L15
	ldr	x1, [x19, 2432]
	ldr	w4, [x2, 16]
	ldr	w2, [x1, 4]
	cmp	w4, w2
	bls	.L27
	ldr	w1, [x1, 684]
	add	w0, w0, 1
	cmp	w1, 1
	csinc	w12, w12, wzr, eq
	cmp	w0, w3
	bne	.L45
	.p2align 2
.L64:
	cbz	w12, .L20
.L17:
	add	w11, w11, 1
	cmp	w8, w11
	bhi	.L18
.L14:
	mov	w0, 1
	cbz	w9, .L44
	mov	w0, 0
	str	w10, [x20]
.L44:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L20:
	ldr	w1, [x19, 4704]
	sxtw	x2, w11
	add	x0, x2, 8
	ldr	w4, [x19, 4684]
	add	x1, x19, x1, lsl 2
	ldr	w0, [x7, x0, lsl 2]
	ldr	w1, [x1, 228]
	add	w0, w4, w0
	cmp	w0, w1
	blt	.L17
	add	x2, x7, x2
	ldrb	w1, [x2, 12]
	cmp	w1, wzr
	csel	w10, w10, w0, eq
	csinc	w9, w9, wzr, eq
	b	.L17
	.p2align 3
.L12:
	ldr	w1, [x19, 4704]
	add	x2, x13, 8
	ldr	w4, [x19, 4684]
	add	x1, x19, x1, lsl 2
	ldr	w0, [x15, x2, lsl 2]
	add	w0, w4, w0
	ldr	w1, [x1, 228]
	cmp	w0, w1
	blt	.L10
	add	x13, x15, x13
	ldrb	w1, [x13, 12]
	cmp	w1, wzr
	csel	w10, w10, w0, eq
	csinc	w9, w9, wzr, eq
	b	.L10
	.p2align 3
.L24:
	mov	w12, 1
	b	.L8
	.p2align 3
.L27:
	mov	w12, 1
	b	.L15
.L5:
	cbz	w8, .L44
	mov	w10, 0
	mov	w9, 0
	ldr	w3, [x19, 2772]
	b	.L13
	.size	HEVC_CheckThatAllRefPicsAreAvailable.part.8, .-HEVC_CheckThatAllRefPicsAreAvailable.part.8
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	HEVC_SetFrmRepeatCount.part.9, %function
HEVC_SetFrmRepeatCount.part.9:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	w3, [x19, 292]
	ldr	w2, [x19, 2768]
	ldr	w0, [x19, 288]
	add	w2, w3, w2
	add	w3, w2, 1
	cmp	w0, w3
	bcc	.L66
	sub	w0, w0, #1
	sub	w0, w0, w2
	cmp	w0, 1
	bls	.L67
	mov	w0, 2
	str	w0, [x20, 16]
	ldr	w0, [x19, 292]
	add	w0, w0, 2
	str	w0, [x19, 292]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L66:
	str	wzr, [x20, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L67:
	mov	w0, 1
	str	w0, [x20, 16]
	ldr	w0, [x19, 292]
	add	w0, w0, 1
	str	w0, [x19, 292]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_SetFrmRepeatCount.part.9, .-HEVC_SetFrmRepeatCount.part.9
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	HEVC_OutputFrame.isra.10, %function
HEVC_OutputFrame.isra.10:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x21, x1
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 252]
	ldr	w1, [x21]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L75
	ldr	w0, [x19, 252]
	mov	w2, 1
	ldr	w1, [x21]
	bl	FSP_SetDisplay
	add	x3, x19, 4096
	ldr	w0, [x19, 252]
	mov	x4, x20
	add	x3, x3, 1936
	mov	x2, x19
	mov	w1, 16
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L76
	ldr	x0, [x19, 2432]
	ldr	w0, [x0, 660]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L77
	str	wzr, [x20, 16]
.L74:
	ldr	w1, [x19, 292]
	mov	w0, 0
	ldr	w2, [x19, 300]
	add	w1, w1, 1
	str	w1, [x19, 292]
	add	w2, w2, 1
	str	w2, [x19, 300]
.L71:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L77:
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_SetFrmRepeatCount.part.9
	b	.L74
	.p2align 3
.L76:
	ldr	x2, .LC0
	mov	w0, 1
	ldr	x1, .LC4
	bl	dprint_vfmw
	ldr	w0, [x19, 252]
	mov	w2, 0
	ldr	w1, [x21]
	bl	FSP_SetDisplay
	mov	w0, -1
	b	.L71
.L75:
	ldr	x2, .LC0
	mov	w0, 0
	ldr	x1, .LC2
	bl	dprint_vfmw
	mov	w0, -1
	b	.L71
	.size	HEVC_OutputFrame.isra.10, .-HEVC_OutputFrame.isra.10
	.align	3
.LC0:
	.xword	.LANCHOR0
	.align	3
.LC2:
	.xword	.LC1
	.align	3
.LC4:
	.xword	.LC3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	HEVC_Sei_Mastering_Display_Colour_Volume.part.15, %function
HEVC_Sei_Mastering_Display_Colour_Volume.part.15:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	add	x19, x1, 4
	add	x22, x1, 16
	bl	_mcount
.L79:
	add	x19, x19, 4
	ldr	x0, [x20, 2336]
	mov	w1, 16
	bl	BsGet
	str	w0, [x19, -4]
	mov	w1, 16
	ldr	x0, [x20, 2336]
	bl	BsGet
	str	w0, [x19, 8]
	cmp	x19, x22
	bne	.L79
	ldr	x0, [x20, 2336]
	mov	w1, 16
	bl	BsGet
	str	w0, [x21, 28]
	mov	w1, 16
	ldr	x0, [x20, 2336]
	bl	BsGet
	str	w0, [x21, 32]
	mov	w1, 32
	ldr	x0, [x20, 2336]
	bl	BsGet
	str	w0, [x21, 36]
	mov	w1, 32
	ldr	x0, [x20, 2336]
	bl	BsGet
	str	w0, [x21, 40]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_Sei_Mastering_Display_Colour_Volume.part.15, .-HEVC_Sei_Mastering_Display_Colour_Volume.part.15
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_ParsePts_Init
	.type	HEVC_Sei_ParsePts_Init, %function
HEVC_Sei_ParsePts_Init:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC7
	add	x0, x19, 8192
	mov	x2, 56
	mov	w1, 0
	add	x0, x0, 3648
	ldr	x3, [x3, 96]
	blr	x3
	str	wzr, [x19, 3340]
	add	x0, x19, 3072
	stp	xzr, xzr, [x0, 288]
	stp	xzr, xzr, [x0, 304]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_Sei_ParsePts_Init, .-HEVC_Sei_ParsePts_Init
	.align	3
.LC7:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Get_Dpb_Output_Time
	.type	HEVC_Sei_Get_Dpb_Output_Time, %function
HEVC_Sei_Get_Dpb_Output_Time:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	w4, [x19, 4708]
	ldr	w5, [x19, 164]
	tbnz	w4, #31, .L84
	cmp	w4, w5
	bge	.L84
	ldr	x0, [x19, 2360]
	mov	w1, 1888
	ldr	w5, [x19, 160]
	smaddl	x4, w4, w1, x0
	ldr	w4, [x4, 32]
	tbnz	w4, #31, .L88
	cmp	w4, w5
	bge	.L88
	add	x3, x19, 8192
	ldr	x2, [x19, 2352]
	add	x1, x3, 3648
	ldr	w6, [x20, 36]
	mov	w5, 12660
	ldr	w0, [x1, 4]
	str	w6, [x1, 12]
	smaddl	x4, w4, w5, x2
	cmp	w0, 1
	ldr	w0, [x20, 40]
	str	w0, [x1, 16]
	ldr	w0, [x4, 52]
	add	x4, x4, x0, lsl 2
	ldrb	w5, [x4, 360]
	beq	.L96
	ldrb	w0, [x1, 1]
	cbz	w0, .L92
	ldrb	w0, [x19, 3336]
	add	x4, x19, 3344
	cbz	w0, .L93
	ldr	x1, [x4, 24]
	mov	x2, x1
.L94:
	ldr	w6, [x4, 8]
	add	x0, x6, x2
	str	x0, [x4, 16]
	cmp	x0, x1
	str	x0, [x4, 40]
	bge	.L91
	add	x0, x6, x1
	str	x0, [x4, 16]
	str	x0, [x4, 40]
	b	.L91
	.p2align 3
.L88:
	ldr	w3, [x19, 252]
	mov	w2, 2625
	ldr	x1, .LC11
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L84:
	ldr	w3, [x19, 252]
	mov	w2, 2615
	ldr	x1, .LC9
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L92:
	add	x4, x19, 3344
	ldr	w0, [x4, 8]
	ldr	x2, [x4, 16]
	add	x0, x0, x2
	str	x0, [x4, 40]
.L91:
	add	x2, x3, 3648
	str	x0, [x4, 32]
	ldr	x1, [x2, 32]
	strb	wzr, [x2, 1]
	str	x1, [x2, 48]
	ldrb	w1, [x20, 2]
	cbnz	w1, .L97
	ldr	w1, [x4, 12]
	add	x0, x1, x0
	sub	x0, x0, x5, uxtb
	str	x0, [x2, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L97:
	ldr	w1, [x4, 12]
	add	x1, x1, x0
	asr	x1, x1, 1
	sub	x0, x1, x5, uxtb
	str	x0, [x2, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L96:
	add	x4, x19, 3344
	ldrsw	x0, [x19, 3340]
	str	x0, [x4, 16]
	str	x0, [x4, 40]
	b	.L91
	.p2align 3
.L93:
	ldp	x2, x1, [x4, 16]
	b	.L94
	.size	HEVC_Sei_Get_Dpb_Output_Time, .-HEVC_Sei_Get_Dpb_Output_Time
	.align	3
.LC9:
	.xword	.LC8
	.align	3
.LC11:
	.xword	.LC10
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Get_Last_IDR_Frame_Info
	.type	HEVC_Get_Last_IDR_Frame_Info, %function
HEVC_Get_Last_IDR_Frame_Info:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	sub	w0, w19, #19
	cmp	w0, 1
	bls	.L105
.L99:
	sub	w19, w19, #6
	cmp	w19, 3
	bls	.L98
	ldr	x0, [x20, 3384]
	str	x0, [x20, 3368]
.L98:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L105:
	ldr	x0, [x20, 2432]
	ldr	x0, [x0, 64]
	cmn	x0, #1
	beq	.L100
	ldr	x1, [x20, 11872]
	str	x0, [x20, 11864]
	str	x1, [x20, 11880]
	str	x1, [x20, 11888]
.L100:
	add	x0, x20, 8192
	mov	w1, 1
	strb	w1, [x0, 3648]
	b	.L99
	.size	HEVC_Get_Last_IDR_Frame_Info, .-HEVC_Get_Last_IDR_Frame_Info
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Get_Frame_Pts
	.type	HEVC_Sei_Get_Frame_Pts, %function
HEVC_Sei_Get_Frame_Pts:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19, 11852]
	ldr	w5, [x19, 11856]
	ldr	x6, [x19, 11864]
	ldr	x3, [x19, 11872]
	ldr	x7, [x19, 11880]
	cbz	w4, .L109
	mov	w1, w4
	mov	w2, w5
	b	.L108
	.p2align 3
.L110:
	mov	w1, w0
.L108:
	udiv	w0, w2, w1
	msub	w0, w0, w1, w2
	mov	w2, w1
	cbnz	w0, .L110
.L107:
	udiv	w4, w4, w1
	sub	x0, x3, x7
	lsl	w2, w0, 6
	sub	w2, w2, w0
	lsl	w2, w2, 1
	sub	w0, w2, w0
	lsl	w0, w0, 3
	udiv	w1, w5, w1
	mul	w0, w0, w4
	udiv	w1, w0, w1
	add	x1, x1, x6
	str	x1, [x19, 4616]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L109:
	mov	w1, w5
	b	.L107
	.size	HEVC_Sei_Get_Frame_Pts, .-HEVC_Sei_Get_Frame_Pts
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InitSigLastScan
	.type	HEVC_InitSigLastScan, %function
HEVC_InitSigLastScan:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w21, w5
	mov	x20, x4
	bl	_mcount
	cmp	w21, 15
	bgt	.L112
	cmp	w21, 8
	mul	w10, w21, w21
	beq	.L147
	mov	x8, x20
	cbz	w10, .L112
.L118:
	mov	w7, 1
	mov	w1, 0
	mov	w9, 0
	sub	w7, w7, w21
.L122:
	cmp	w21, w9
	mov	w0, w9
	mov	w2, 0
	bgt	.L124
	.p2align 2
.L138:
	sub	w0, w0, #1
	add	w2, w2, 1
	cmp	w21, w0
	ble	.L138
.L124:
	cmp	w0, wzr
	ccmp	w21, w2, 4, ge
	ble	.L120
	madd	w3, w21, w0, w2
	sub	w2, w2, w1
	.p2align 2
.L121:
	str	w3, [x8, w1, uxtw 2]
	sub	w0, w0, #1
	add	w1, w1, 1
	cmp	w0, wzr
	add	w6, w2, w1
	add	w3, w3, w7
	ccmp	w21, w6, 4, ge
	bgt	.L121
.L120:
	cmp	w10, w1
	add	w9, w9, 1
	bhi	.L122
.L112:
	cmp	w21, 4
	ble	.L111
	asr	w14, w21, 2
	add	x0, x19, x14, uxtw
	mul	w16, w14, w14
	ldrsb	w15, [x0, 12]
	add	w15, w15, 1
	cbz	w16, .L111
.L116:
	mov	w9, 1
	ldr	x17, .LC12
	add	x13, x19, 352
	mov	w12, 0
	sbfiz	x15, x15, 14, 32
	sub	w9, w9, w21
.L133:
	add	x0, x15, x12, uxtw
	ldr	x1, [x17]
	cmp	w21, 32
	ldr	w3, [x1, x0, lsl 2]
	beq	.L148
.L126:
	udiv	w2, w3, w14
	lsl	w8, w12, 4
	mov	w10, 0
	mov	w0, 0
	mov	w7, 0
	mov	w1, 0
	madd	w3, w2, w21, w3
	msub	w2, w2, w14, w3
	lsl	w11, w2, 2
	.p2align 2
.L127:
	cmp	w1, wzr
	ccmp	w7, 3, 0, ge
	bgt	.L128
	madd	w2, w21, w1, w7
	sub	w7, w7, w0
	add	w2, w2, w11
	.p2align 2
.L129:
	add	w6, w8, w0
	sub	w1, w1, #1
	add	w0, w0, 1
	cmp	w1, wzr
	add	w3, w7, w0
	str	w2, [x20, w6, uxtw 2]
	ccmp	w3, 3, 0, ge
	add	w2, w2, w9
	ble	.L129
.L128:
	cmp	w0, 15
	add	w10, w10, 1
	bhi	.L130
	cmp	w10, 3
	ble	.L149
	sub	w7, w10, #3
	mov	w1, 3
	b	.L127
.L130:
	add	w12, w12, 1
	add	x13, x13, 4
	cmp	w12, w16
	bne	.L133
.L111:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L148:
	ldr	w3, [x13]
	b	.L126
.L147:
	add	x8, x19, 352
	cbnz	w10, .L118
	ldrsb	w15, [x19, 14]
	mov	w14, 2
	mov	w16, 4
	add	w15, w15, 1
	b	.L116
.L149:
	mov	w1, w10
	mov	w7, 0
	b	.L127
	.size	HEVC_InitSigLastScan, .-HEVC_InitSigLastScan
	.align	3
.LC12:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InitScalingOrderTable
	.type	HEVC_InitScalingOrderTable, %function
HEVC_InitScalingOrderTable:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x21, 12
	add	x2, x21, 141
	mov	w1, -1
	.p2align 2
.L151:
	strb	w1, [x0], 1
	cmp	x2, x0
	bne	.L151
	ldr	x22, .LC15
	mov	w3, 1
	mov	w2, 2
	mov	w1, 3
	mov	w0, 4
	strb	wzr, [x21, 16]
	strb	w3, [x21, 20]
	mov	w20, 2
	strb	w2, [x21, 28]
	mov	w19, 0
	strb	w1, [x21, 44]
	strb	w0, [x21, 76]
	.p2align 2
.L152:
	ldr	x4, [x22]
	sbfiz	x0, x19, 16, 32
	mov	w7, w19
	mov	w6, w20
	mov	w5, w20
	add	x4, x4, x0
	mov	x3, 0
	mov	x2, 0
	mov	x1, 0
	mov	x0, x21
	add	w19, w19, 1
	lsl	w20, w20, 1
	bl	HEVC_InitSigLastScan
	cmp	w19, 7
	bne	.L152
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_InitScalingOrderTable, .-HEVC_InitScalingOrderTable
	.align	3
.LC15:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetDar
	.type	HEVC_GetDar, %function
HEVC_GetDar:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	w24, w2
	mov	w22, w3
	mov	w23, w4
	bl	_mcount
	cmp	w19, wzr
	ble	.L165
	mov	w0, 255
	cmp	w19, 16
	ccmp	w19, w0, 4, gt
	mov	w21, 0
	cset	w1, ne
	cbnz	w1, .L156
	cmp	w20, wzr
	ccmp	w24, wzr, 4, ne
	ccmp	w19, w0, 0, eq
	beq	.L156
	cmp	w19, 1
	beq	.L182
	cmp	w19, 255
	beq	.L158
	ldr	x0, .LC16
	sbfiz	x19, x19, 3, 32
	add	x0, x0, 24
	add	x1, x0, x19
	ldr	w20, [x0, x19]
	ldr	w24, [x1, 4]
.L158:
	lsl	w4, w20, 10
	lsl	w22, w22, 10
	sdiv	w2, w4, w24
	sdiv	w4, w22, w23
	mul	w4, w2, w4
	cmp	w4, wzr
	add	w0, w4, 1023
	csel	w4, w0, w4, lt
	asr	w4, w4, 10
	subs	w1, w4, #2406
	bmi	.L183
.L159:
	subs	w0, w4, #2263
	bmi	.L184
	cmp	w1, w0
	mov	w21, 4
	bge	.L163
.L156:
	ldr	x1, .LC18
	mov	w2, w21
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L184:
	mov	w0, 2263
	mov	w21, 4
	sub	w0, w0, w4
	cmp	w1, w0
	blt	.L156
.L163:
	subs	w1, w4, #1820
	bmi	.L185
	cmp	w0, w1
	mov	w21, 3
	blt	.L156
.L164:
	subs	w0, w4, #1365
	bmi	.L186
.L162:
	mov	w21, 2
	cmp	w1, w0
	csinc	w21, w21, wzr, lt
	b	.L156
	.p2align 3
.L165:
	mov	w21, 0
	b	.L156
	.p2align 3
.L182:
	mov	w1, 7680
	mov	w0, 4320
	cmp	w22, w1
	mov	w21, 2
	ccmp	w23, w0, 0, eq
	cset	w0, eq
	cbnz	w0, .L156
	mov	w0, 2160
	cmp	w22, 3840
	ccmp	w23, w0, 0, eq
	beq	.L156
	sub	w0, w23, #1080
	mov	w1, 1920
	and	w0, w0, -9
	cmp	w0, wzr
	ccmp	w22, w1, 0, eq
	beq	.L156
	mov	w0, 720
	cmp	w22, 1280
	ccmp	w23, w0, 0, eq
	beq	.L156
	mov	w0, 480
	cmp	w22, 640
	ccmp	w23, w0, 0, eq
	mov	w21, 5
	cset	w0, eq
	cmp	w0, wzr
	csinc	w21, w21, wzr, eq
	b	.L156
	.p2align 3
.L183:
	mov	w1, 2406
	sub	w1, w1, w4
	b	.L159
	.p2align 3
.L185:
	mov	w1, 1820
	mov	w21, 3
	sub	w1, w1, w4
	cmp	w0, w1
	blt	.L156
	b	.L164
.L186:
	mov	w0, 1365
	sub	w0, w0, w4
	b	.L162
	.size	HEVC_GetDar, .-HEVC_GetDar
	.align	3
.LC16:
	.xword	.LANCHOR0
	.align	3
.LC18:
	.xword	.LC17
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_PrintNaluArraySlot
	.type	HEVC_PrintNaluArraySlot, %function
HEVC_PrintNaluArraySlot:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x24, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC21
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x23, .LC23
	ldr	w0, [x24, 168]
	cmn	w0, #1
	beq	.L191
	mov	w20, 52429
	ldr	x22, .LC27
	mov	w19, 0
	mov	w21, 104
	movk	w20, 0xcccc, lsl 16
	b	.L190
	.p2align 3
.L189:
	ldr	w0, [x24, 168]
	add	w0, w0, 1
	cmp	w0, w19
	bls	.L191
.L190:
	umull	x0, w19, w21
	ldr	x4, [x24, 2424]
	mov	w2, w19
	mov	x1, x22
	add	x4, x4, x0
	mov	w0, 1
	mov	x3, x4
	ldr	w4, [x4, 32]
	bl	dprint_vfmw
	umull	x0, w19, w20
	lsr	x0, x0, 32
	lsr	w0, w0, 3
	lsl	w1, w0, 3
	add	w0, w1, w0, lsl 1
	cmp	w19, w0
	add	w19, w19, 1
	bne	.L189
	mov	x1, x23
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x24, 168]
	add	w0, w0, 1
	cmp	w0, w19
	bhi	.L190
.L191:
	mov	x1, x23
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, .LC25
	mov	w0, 1
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	HEVC_PrintNaluArraySlot, .-HEVC_PrintNaluArraySlot
	.align	3
.LC21:
	.xword	.LC20
	.align	3
.LC23:
	.xword	.LC22
	.align	3
.LC25:
	.xword	.LC24
	.align	3
.LC27:
	.xword	.LC26
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_PrintCurrSlicelistX
	.type	HEVC_PrintCurrSlicelistX, %function
HEVC_PrintCurrSlicelistX:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC29
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, .LC31
	mov	w0, 1
	ldr	w2, [x19, 4740]
	bl	dprint_vfmw
	ldr	w0, [x19, 4740]
	cbz	w0, .L202
	ldr	x24, .LC35
	mov	w20, 0
	ldr	x22, .LC40
	ldr	x23, .LC37
	ldr	x25, .LC39
	.p2align 2
.L201:
	add	x21, x19, x20, uxtw 3
	mov	w2, w20
	mov	x1, x24
	mov	w0, 1
	add	w20, w20, w0
	ldr	x3, [x21, 2456]
	bl	dprint_vfmw
	ldr	x2, [x21, 2456]
	mov	x1, x23
	mov	w0, 1
	cbz	x2, .L199
	ldr	x2, [x2, 16]
	bl	dprint_vfmw
	ldr	x0, [x21, 2456]
	ldr	x0, [x0, 16]
	cbz	x0, .L199
	ldr	w1, [x0, 28]
	ldr	w0, [x19, 252]
	bl	FSP_GetLogicFs
	mov	x2, x0
	mov	x1, x25
	mov	w0, 1
	bl	dprint_vfmw
.L199:
	mov	x1, x22
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x19, 4740]
	cmp	w0, w20
	bhi	.L201
.L202:
	ldr	x1, .LC33
	mov	w0, 1
	ldr	w2, [x19, 4744]
	bl	dprint_vfmw
	ldr	w0, [x19, 4744]
	cbz	w0, .L197
	ldr	x22, .LC40
	mov	w20, 0
	ldr	x24, .LC44
	ldr	x23, .LC37
	ldr	x25, .LC39
	.p2align 2
.L206:
	add	x21, x19, x20, uxtw 3
	mov	w2, w20
	mov	x1, x24
	mov	w0, 1
	add	w20, w20, w0
	ldr	x3, [x21, 2592]
	bl	dprint_vfmw
	ldr	x2, [x21, 2592]
	mov	x1, x23
	mov	w0, 1
	cbz	x2, .L204
	ldr	x2, [x2, 16]
	bl	dprint_vfmw
	ldr	x0, [x21, 2592]
	ldr	x0, [x0, 16]
	cbz	x0, .L204
	ldr	w1, [x0, 28]
	ldr	w0, [x19, 252]
	bl	FSP_GetLogicFs
	mov	x2, x0
	mov	x1, x25
	mov	w0, 1
	bl	dprint_vfmw
.L204:
	mov	x1, x22
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x19, 4744]
	cmp	w0, w20
	bhi	.L206
.L197:
	ldr	x1, .LC42
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.size	HEVC_PrintCurrSlicelistX, .-HEVC_PrintCurrSlicelistX
	.align	3
.LC29:
	.xword	.LC28
	.align	3
.LC31:
	.xword	.LC30
	.align	3
.LC33:
	.xword	.LC32
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
.LC40:
	.xword	.LC22
	.align	3
.LC42:
	.xword	.LC41
	.align	3
.LC44:
	.xword	.LC43
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_PrintFrameStoreState
	.type	HEVC_PrintFrameStoreState, %function
HEVC_PrintFrameStoreState:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x22, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC48
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x22, 180]
	cbz	w0, .L220
	ldr	x27, .LC52
	mov	w21, 0
	ldr	x23, .LC54
	mov	w25, 720
	ldr	x26, .LC55
	mov	x24, 14080
	.p2align 2
.L219:
	uxtw	x3, w21
	mov	w2, w21
	lsl	x0, x3, 2
	mov	x1, x27
	sub	x4, x0, x3
	mov	w0, 1
	lsl	x3, x4, 4
	mov	w19, 0
	sub	x3, x3, x4
	lsl	x3, x3, 4
	add	x4, x22, x3
	add	x3, x3, 12288
	add	x5, x4, 12288
	add	x3, x3, 1168
	umaddl	x20, w21, w25, x24
	ldr	w4, [x4, 13504]
	add	x3, x22, x3
	ldrb	w6, [x5, 1170]
	add	x20, x22, x20
	ldrb	w5, [x5, 1169]
	bl	dprint_vfmw
.L218:
	ldr	x3, [x20], 8
	mov	w2, w19
	mov	w0, 1
	mov	x1, x23
	add	w19, w19, w0
	bl	dprint_vfmw
	cmp	w19, 4
	bne	.L218
	mov	w0, 1
	mov	x1, x26
	add	w21, w21, w0
	bl	dprint_vfmw
	ldr	w0, [x22, 180]
	cmp	w0, w21
	bhi	.L219
.L220:
	ldr	x1, .LC50
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.size	HEVC_PrintFrameStoreState, .-HEVC_PrintFrameStoreState
	.align	3
.LC48:
	.xword	.LC47
	.align	3
.LC50:
	.xword	.LC49
	.align	3
.LC52:
	.xword	.LC51
	.align	3
.LC54:
	.xword	.LC53
	.align	3
.LC55:
	.xword	.LC22
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_PrintAPCState
	.type	HEVC_PrintAPCState, %function
HEVC_PrintAPCState:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 12288
	mov	w20, 0
	bl	_mcount
	ldr	x1, .LC57
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w4, [x19, 968]
	mov	w2, 0
	ldr	w3, [x19, 972]
	mov	w0, 1
	ldr	x1, .LC59
	add	x19, x19, 976
	bl	dprint_vfmw
	ldr	x21, .LC61
	.p2align 2
.L225:
	ldr	w4, [x19, 64]
	mov	w2, w20
	ldr	w5, [x19, 128]
	mov	w0, 1
	ldr	w3, [x19], 4
	mov	x1, x21
	add	w20, w20, w0
	bl	dprint_vfmw
	cmp	w20, 16
	bne	.L225
	ldr	x1, .LC63
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_PrintAPCState, .-HEVC_PrintAPCState
	.align	3
.LC57:
	.xword	.LC56
	.align	3
.LC59:
	.xword	.LC58
	.align	3
.LC61:
	.xword	.LC60
	.align	3
.LC63:
	.xword	.LC62
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_PrintDPBState
	.type	HEVC_PrintDPBState, %function
HEVC_PrintDPBState:
	sub	sp, sp, #176
	stp	x29, x30, [sp, 64]
	add	x29, sp, 64
	stp	x19, x20, [sp, 80]
	stp	x21, x22, [sp, 96]
	stp	x23, x24, [sp, 112]
	stp	x25, x26, [sp, 128]
	stp	x27, x28, [sp, 144]
	mov	x19, x0
	mov	x0, x30
	mov	w20, 0
	bl	_mcount
	ldr	x1, .LC65
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, .LC67
	mov	w0, 1
	ldr	w2, [x19, 2768]
	ldr	w3, [x19, 2772]
	ldr	w6, [x19, 2780]
	ldr	w4, [x19, 2784]
	ldr	w5, [x19, 2788]
	bl	dprint_vfmw
	ldr	w0, [x19, 2772]
	cbz	w0, .L232
	.p2align 2
.L231:
	add	x21, x19, x20, uxtw 3
	ldr	w0, [x19, 252]
	ldr	x2, [x21, 2792]
	ldrb	w7, [x2, 1]
	ldp	w1, w28, [x2, 28]
	ldr	w6, [x2, 48]
	ldrb	w25, [x2]
	ldrb	w22, [x2, 2]
	ldr	w23, [x2, 8]
	ldr	w24, [x2, 60]
	stp	w6, w7, [x29, 104]
	bl	FSP_GetLogicFs
	mov	x26, x0
	ldr	x1, [x21, 2792]
	ldr	w0, [x19, 252]
	ldr	w1, [x1, 28]
	bl	FSP_GetRef
	mov	w27, w0
	ldr	x1, [x21, 2792]
	ldr	w0, [x19, 252]
	ldr	w1, [x1, 28]
	bl	FSP_GetDisplay
	ldr	x8, [x21, 2792]
	mov	w2, w20
	ldp	w6, w7, [x29, 104]
	mov	x3, x8
	mov	w5, w25
	ldr	w1, [x8, 228]
	mov	w4, w28
	str	w1, [sp, 56]
	add	w20, w20, 1
	ldr	x1, .LC70
	ldr	w8, [x8, 28]
	str	w8, [sp, 48]
	str	w0, [sp, 40]
	mov	w0, 1
	str	w22, [sp]
	str	w23, [sp, 8]
	str	w24, [sp, 16]
	str	x26, [sp, 24]
	str	w27, [sp, 32]
	bl	dprint_vfmw
	ldr	w0, [x19, 2772]
	cmp	w0, w20
	bhi	.L231
.L232:
	ldr	x24, .LC68
	mov	w0, 1
	mov	x1, x24
	bl	dprint_vfmw
	ldr	w0, [x19, 2772]
	cbz	w0, .L230
	ldr	x26, .LC74
	mov	w21, 0
	ldr	x28, .LC76
	ldr	x27, .LC78
	ldr	x25, .LC86
	b	.L239
	.p2align 3
.L243:
	mov	x2, x20
	mov	x1, x28
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w2, [x20, 20]
	mov	x1, x27
	mov	w0, 1
	bl	dprint_vfmw
	ldrsb	w2, [x20]
	mov	w0, 1
	ldr	x1, .LC80
	bl	dprint_vfmw
	ldrsb	w2, [x20, 1]
	mov	w0, 1
	ldr	x1, .LC82
	bl	dprint_vfmw
	mov	x2, x23
	mov	x1, x25
	mov	w0, 1
	cbz	x23, .L235
.L244:
	bl	dprint_vfmw
	ldr	w2, [x23, 76]
	mov	w0, 1
	ldr	x1, .LC88
	bl	dprint_vfmw
	mov	x2, x22
	mov	w0, 1
	cbz	x22, .L237
.L245:
	ldr	x1, .LC92
	bl	dprint_vfmw
	ldr	x1, .LC94
	mov	w0, 1
	ldr	w2, [x22, 76]
	bl	dprint_vfmw
	mov	w0, 1
	mov	x1, x24
	add	w21, w21, w0
	bl	dprint_vfmw
	ldr	w0, [x19, 2772]
	cmp	w0, w21
	bls	.L230
.L239:
	add	x22, x19, x21, uxtw 3
	ldr	w0, [x19, 252]
	ldr	x1, [x22, 2792]
	ldr	w1, [x1, 28]
	bl	FSP_GetLogicFs
	mov	x20, x0
	ldr	x1, [x22, 2792]
	ldr	w0, [x19, 252]
	ldr	w1, [x1, 28]
	bl	FSP_GetDecPhyFs
	mov	x23, x0
	ldr	x1, [x22, 2792]
	ldr	w0, [x19, 252]
	ldr	w1, [x1, 28]
	bl	FSP_GetDispPhyFs
	mov	x22, x0
	mov	w2, w21
	mov	x1, x26
	mov	w0, 1
	bl	dprint_vfmw
	cbnz	x20, .L243
	ldr	x1, .LC84
	mov	w0, 1
	bl	dprint_vfmw
	mov	x2, x23
	mov	x1, x25
	mov	w0, 1
	cbnz	x23, .L244
	.p2align 2
.L235:
	ldr	x1, .LC90
	mov	w0, 1
	bl	dprint_vfmw
	mov	x2, x22
	mov	w0, 1
	cbnz	x22, .L245
	.p2align 2
.L237:
	ldr	x1, .LC96
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 1
	mov	x1, x24
	add	w21, w21, w0
	bl	dprint_vfmw
	ldr	w0, [x19, 2772]
	cmp	w0, w21
	bhi	.L239
.L230:
	ldr	x1, .LC72
	mov	w0, 1
	bl	dprint_vfmw
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.size	HEVC_PrintDPBState, .-HEVC_PrintDPBState
	.align	3
.LC65:
	.xword	.LC64
	.align	3
.LC67:
	.xword	.LC66
	.align	3
.LC68:
	.xword	.LC22
	.align	3
.LC70:
	.xword	.LC69
	.align	3
.LC72:
	.xword	.LC71
	.align	3
.LC74:
	.xword	.LC73
	.align	3
.LC76:
	.xword	.LC75
	.align	3
.LC78:
	.xword	.LC77
	.align	3
.LC80:
	.xword	.LC79
	.align	3
.LC82:
	.xword	.LC81
	.align	3
.LC84:
	.xword	.LC83
	.align	3
.LC86:
	.xword	.LC85
	.align	3
.LC88:
	.xword	.LC87
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
.LC96:
	.xword	.LC95
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsSliceUnit
	.type	HEVC_IsSliceUnit, %function
HEVC_IsSliceUnit:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 9
	mov	w0, 1
	bls	.L247
	sub	w19, w19, #16
	cmp	w19, 5
	cset	w0, ls
.L247:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsSliceUnit, .-HEVC_IsSliceUnit
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsIUnit
	.type	HEVC_IsIUnit, %function
HEVC_IsIUnit:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	sub	w19, w19, #16
	bl	_mcount
	cmp	w19, 5
	ldr	x19, [sp, 16]
	cset	w0, ls
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsIUnit, .-HEVC_IsIUnit
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsNonRefPic
	.type	HEVC_IsNonRefPic, %function
HEVC_IsNonRefPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ands	w19, w19, -7
	mov	w0, 1
	beq	.L251
	cmp	w19, 8
	cset	w0, eq
.L251:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsNonRefPic, .-HEVC_IsNonRefPic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsFlushUnit
	.type	HEVC_IsFlushUnit, %function
HEVC_IsFlushUnit:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	sub	w19, w19, #16
	bl	_mcount
	cmp	w19, 4
	ldr	x19, [sp, 16]
	cset	w0, ls
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsFlushUnit, .-HEVC_IsFlushUnit
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsPVRFlushPic
	.type	HEVC_IsPVRFlushPic, %function
HEVC_IsPVRFlushPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	mov	w0, 0
	cbnz	w19, .L255
	ldr	x1, [x20, 2432]
	mov	x2, 4294967297
	mov	w0, 0
	ldr	x3, [x1, 696]
	cmp	x3, x2
	beq	.L259
.L255:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L259:
	ldr	w2, [x1, 704]
	cbnz	w2, .L255
	ldr	w0, [x1, 660]
	add	w0, w0, 1024
	cmp	w0, 2048
	cset	w0, hi
	b	.L255
	.size	HEVC_IsPVRFlushPic, .-HEVC_IsPVRFlushPic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsEosNal
	.type	HEVC_IsEosNal, %function
HEVC_IsEosNal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 2336]
	mov	w1, 32
	bl	BsGet
	mov	w20, w0
	ldr	x0, [x19, 2336]
	mov	w1, 32
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
	.size	HEVC_IsEosNal, .-HEVC_IsEosNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CalcTileInfo
	.type	HEVC_CalcTileInfo, %function
HEVC_CalcTileInfo:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	mov	x19, x1
	mov	x20, x2
	mov	x21, x3
	bl	_mcount
	ldr	x0, [x22, 2408]
	ldr	x1, [x22, 2400]
	ldp	w23, w26, [x0, 68]
	ldr	w25, [x1, 128]
	sub	w0, w23, #1
	cmp	w0, 9
	bhi	.L289
	sub	w0, w26, #1
	cmp	w0, 10
	bhi	.L290
	ldr	x24, .LC102
	mov	x2, 512
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x24, 96]
	blr	x3
	ldr	x3, [x24, 96]
	mov	x2, 80
	mov	w1, 0
	mov	x0, x20
	blr	x3
	ldr	x3, [x24, 96]
	mov	x2, 88
	mov	w1, 0
	mov	x0, x21
	blr	x3
	cmp	w23, wzr
	ble	.L270
	sub	w7, w25, #4
	mov	x2, x20
	mov	w1, 0
	mov	w6, 0
.L269:
	str	w1, [x2]
	lsl	w3, w1, w7
	ldr	x0, [x22, 2408]
	add	x0, x0, x6, sxtw 1
	ldrsh	w5, [x0, 172]
	add	w5, w5, w1
	lsl	w1, w5, w7
	sub	w0, w5, #1
	cmp	w3, w1
	str	w0, [x2, 4]
	bge	.L275
	cmp	w3, 255
	bhi	.L271
	uxtb	w4, w6
	b	.L273
	.p2align 3
.L274:
	cmp	w3, 255
	bhi	.L271
.L273:
	strb	w4, [x19, w3, sxtw]
	add	w3, w3, 1
	cmp	w3, w1
	blt	.L274
.L275:
	add	w6, w6, 1
	add	x2, x2, 8
	cmp	w23, w6
	mov	w1, w5
	bne	.L269
.L270:
	cmp	w26, wzr
	ble	.L267
	sub	w25, w25, #4
	mov	w0, 0
	mov	w5, 0
.L277:
	str	w0, [x21]
	lsl	w3, w0, w25
	ldr	x1, [x22, 2408]
	add	x1, x1, x5, sxtw 1
	ldrsh	w4, [x1, 212]
	add	w4, w4, w0
	lsl	w0, w4, w25
	sub	w1, w4, #1
	cmp	w3, w0
	str	w1, [x21, 4]
	bge	.L282
	cmp	w3, 255
	bhi	.L278
	uxtb	w2, w5
	add	x1, x19, 256
	b	.L280
	.p2align 3
.L281:
	cmp	w3, 255
	bhi	.L278
.L280:
	strb	w2, [x1, w3, sxtw]
	add	w3, w3, 1
	cmp	w3, w0
	blt	.L281
.L282:
	add	w5, w5, 1
	add	x21, x21, 8
	cmp	w26, w5
	mov	w0, w4
	bne	.L277
.L267:
	mov	w0, 0
	b	.L263
	.p2align 3
.L271:
	ldr	x2, .LC97
	mov	w0, 1
	ldr	x1, .LC104
	add	x2, x2, 160
	bl	dprint_vfmw
	mov	w0, -1
.L263:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L278:
	ldr	x2, .LC97
	mov	w0, 1
	ldr	x1, .LC106
	add	x2, x2, 160
	bl	dprint_vfmw
	mov	w0, -1
	b	.L263
.L290:
	ldr	x2, .LC97
	mov	w4, 11
	ldr	x1, .LC101
	mov	w3, w26
	add	x2, x2, 160
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L263
.L289:
	ldr	x2, .LC97
	mov	w4, 10
	ldr	x1, .LC99
	mov	w3, w23
	add	x2, x2, 160
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L263
	.size	HEVC_CalcTileInfo, .-HEVC_CalcTileInfo
	.align	3
.LC97:
	.xword	.LANCHOR0
	.align	3
.LC99:
	.xword	.LC98
	.align	3
.LC101:
	.xword	.LC100
	.align	3
.LC102:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC104:
	.xword	.LC103
	.align	3
.LC106:
	.xword	.LC105
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_More_Data_In_Payload
	.type	HEVC_Sei_More_Data_In_Payload, %function
HEVC_Sei_More_Data_In_Payload:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	lsl	w20, w20, 3
	ldr	x1, [x19, 2336]
	mov	x0, x1
	ldp	w2, w19, [x1, 32]
	sub	w19, w2, w19
	bl	BsIsByteAligned
	cmp	w20, w19
	ccmp	w0, wzr, 4, ne
	cset	w0, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_Sei_More_Data_In_Payload, .-HEVC_Sei_More_Data_In_Payload
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Payload_Extension_Present
	.type	HEVC_Sei_Payload_Extension_Present, %function
HEVC_Sei_Payload_Extension_Present:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	lsl	w20, w20, 3
	ldr	x3, .LC107
	mov	x2, 40
	ldr	x1, [x19, 2336]
	add	x0, x29, x2
	ldr	x3, [x3, 104]
	blr	x3
	ldp	w0, w1, [x29, 72]
	sub	w0, w0, w1
	mov	w1, 0
	cmp	w0, w20
	bcc	.L299
.L293:
	ldp	x19, x20, [sp, 16]
	mov	w0, w1
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L299:
	mov	w1, 1
	add	x0, x29, 40
	bl	BsShow
	mov	w1, 1
	cbz	w0, .L293
	add	x0, x29, 40
	bl	BsSkip
	ldp	w0, w19, [x29, 72]
	sub	w19, w0, w19
	b	.L294
	.p2align 3
.L295:
	bl	BsSkip
	ldp	w0, w19, [x29, 72]
	sub	w19, w0, w19
.L294:
	mov	w1, 1
	add	x0, x29, 40
	bl	BsShow
	cmp	w19, w20
	mov	w1, 1
	cset	w2, cc
	cmp	w0, wzr
	cset	w3, eq
	add	x0, x29, 40
	tst	w2, w3
	bne	.L295
	mov	w1, w2
	ldp	x19, x20, [sp, 16]
	mov	w0, w1
	ldp	x29, x30, [sp], 80
	ret
	.size	HEVC_Sei_Payload_Extension_Present, .-HEVC_Sei_Payload_Extension_Present
	.align	3
.LC107:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Decoded_Picture_Hash
	.type	HEVC_Sei_Decoded_Picture_Hash, %function
HEVC_Sei_Decoded_Picture_Hash:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L308
	ldr	x0, [x20, 2336]
	mov	w1, 8
	mov	w21, 3
	bl	BsGet
	mov	w22, w0
.L307:
	cbnz	w22, .L302
	mov	w19, 16
	.p2align 2
.L303:
	ldr	x0, [x20, 2336]
	mov	w1, 8
	bl	BsGet
	subs	w19, w19, #1
	bne	.L303
.L304:
	subs	w21, w21, #1
	bne	.L307
.L312:
	mov	w0, 0
.L301:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L302:
	cmp	w22, 1
	beq	.L311
	cmp	w22, 2
	bne	.L304
	ldr	x0, [x20, 2336]
	mov	w1, 32
	bl	BsGet
	subs	w21, w21, #1
	bne	.L307
	b	.L312
.L311:
	ldr	x0, [x20, 2336]
	mov	w1, 16
	bl	BsGet
	subs	w21, w21, #1
	bne	.L307
	b	.L312
.L308:
	mov	w0, -1
	b	.L301
	.size	HEVC_Sei_Decoded_Picture_Hash, .-HEVC_Sei_Decoded_Picture_Hash
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Region_Refresh_Info
	.type	HEVC_Sei_Region_Refresh_Info, %function
HEVC_Sei_Region_Refresh_Info:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L315
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	mov	w0, 0
.L314:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L315:
	mov	w0, -1
	b	.L314
	.size	HEVC_Sei_Region_Refresh_Info, .-HEVC_Sei_Region_Refresh_Info
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Mastering_Display_Colour_Volume
	.type	HEVC_Sei_Mastering_Display_Colour_Volume, %function
HEVC_Sei_Mastering_Display_Colour_Volume:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L318
	mov	w0, 1
	mov	x1, x19
	strb	w0, [x19]
	mov	x0, x20
	bl	HEVC_Sei_Mastering_Display_Colour_Volume.part.15
.L317:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L318:
	mov	w0, -1
	b	.L317
	.size	HEVC_Sei_Mastering_Display_Colour_Volume, .-HEVC_Sei_Mastering_Display_Colour_Volume
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Content_Light_Level_Information
	.type	HEVC_Sei_Content_Light_Level_Information, %function
HEVC_Sei_Content_Light_Level_Information:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L321
	mov	w0, 1
	strb	w0, [x19]
	mov	w1, 16
	ldr	x0, [x20, 2336]
	bl	BsGet
	strh	w0, [x19, 2]
	mov	w1, 16
	ldr	x0, [x20, 2336]
	bl	BsGet
	strh	w0, [x19, 4]
	mov	w1, 0
.L320:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L321:
	mov	w1, -1
	b	.L320
	.size	HEVC_Sei_Content_Light_Level_Information, .-HEVC_Sei_Content_Light_Level_Information
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_HLGHDR_Comapitibility_Info
	.type	HEVC_Sei_HLGHDR_Comapitibility_Info, %function
HEVC_Sei_HLGHDR_Comapitibility_Info:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L324
	ldr	x0, [x20, 2336]
	mov	w1, 8
	bl	BsGet
	strb	w0, [x19]
	mov	w1, 0
.L323:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L324:
	mov	w1, -1
	b	.L323
	.size	HEVC_Sei_HLGHDR_Comapitibility_Info, .-HEVC_Sei_HLGHDR_Comapitibility_Info
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Temporal_Sub_Layer_Zero_Index
	.type	HEVC_Sei_Temporal_Sub_Layer_Zero_Index, %function
HEVC_Sei_Temporal_Sub_Layer_Zero_Index:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L327
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	bl	BsToNextByte
	mov	w0, 0
.L326:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L327:
	mov	w0, -1
	b	.L326
	.size	HEVC_Sei_Temporal_Sub_Layer_Zero_Index, .-HEVC_Sei_Temporal_Sub_Layer_Zero_Index
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Display_Orientation
	.type	HEVC_Sei_Display_Orientation, %function
HEVC_Sei_Display_Orientation:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L331
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L332
.L330:
	ldr	x0, [x19, 2336]
	bl	BsToNextByte
	mov	w0, 0
.L329:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L332:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	b	.L330
	.p2align 3
.L331:
	mov	w0, -1
	b	.L329
	.size	HEVC_Sei_Display_Orientation, .-HEVC_Sei_Display_Orientation
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_TSI
	.type	HEVC_Sei_TSI, %function
HEVC_Sei_TSI:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L335
	ldr	x0, [x20, 2336]
	mov	w1, 4
	bl	BsGet
	strb	w0, [x19, 1]
	mov	w1, 4
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x19, 2]
	mov	w1, 1
	mov	w0, 0
	strb	w1, [x19]
.L334:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L335:
	mov	w0, -1
	b	.L334
	.size	HEVC_Sei_TSI, .-HEVC_Sei_TSI
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_User_Data_Unregistered
	.type	HEVC_Sei_User_Data_Unregistered, %function
HEVC_Sei_User_Data_Unregistered:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w21, w2
	mov	w19, 16
	bl	_mcount
	strh	wzr, [x29, 60]
	cmp	w21, 15
	str	wzr, [x29, 56]
	bls	.L351
	.p2align 2
.L347:
	ldr	x0, [x20, 2336]
	mov	w1, 8
	bl	BsGet
	subs	w19, w19, #1
	bne	.L347
	subs	w21, w21, #16
	mov	x19, 0
	beq	.L343
	.p2align 2
.L346:
	ldr	x0, [x20, 2336]
	mov	w1, 8
	bl	BsGet
	cmp	w19, 5
	bls	.L352
.L341:
	add	x19, x19, 1
	cmp	w21, w19
	bhi	.L346
	cmp	w21, 5
	bls	.L343
	mov	w0, 21572
	ldr	w1, [x29, 56]
	movk	w0, 0x3147, lsl 16
	cmp	w1, w0
	beq	.L353
.L343:
	mov	w0, 0
.L338:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L353:
	add	x20, x20, 24576
	ldrb	w0, [x29, 60]
	cmp	w0, 65
	ldrb	w0, [x20, 3284]
	cset	w1, eq
	bfi	w0, w1, 0, 1
	strb	w0, [x20, 3284]
	tbz	x0, 0, .L343
	ldrb	w2, [x29, 61]
	mov	w1, w0
	mov	w0, 0
	bfi	w1, w2, 1, 4
	strb	w1, [x20, 3284]
	b	.L338
.L351:
	ldr	x1, .LC109
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L338
.L352:
	add	x1, x29, 56
	strb	w0, [x19, x1]
	b	.L341
	.size	HEVC_Sei_User_Data_Unregistered, .-HEVC_Sei_User_Data_Unregistered
	.align	3
.LC109:
	.xword	.LC108
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsRefListWrong
	.type	HEVC_IsRefListWrong, %function
HEVC_IsRefListWrong:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19, 4740]
	cbnz	w3, .L395
.L355:
	mov	w0, 0
.L393:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L395:
	ldr	x0, [x19, 2456]
	cbz	x0, .L377
	ldr	x0, [x0, 16]
	mov	w20, 0
	cbnz	x0, .L361
	b	.L357
	.p2align 3
.L397:
	ldr	x1, [x0, 32]
	cbz	x1, .L362
	ldr	w3, [x19, 4740]
	add	w20, w20, 1
	cmp	w3, w20
	add	x0, x19, x20, sxtw 3
	bls	.L396
	ldr	x0, [x0, 2456]
	cbz	x0, .L356
	ldr	x0, [x0, 16]
	cbz	x0, .L357
.L361:
	ldr	w1, [x0, 28]
	ldr	w0, [x19, 252]
	bl	FSP_GetLogicFs
	cbnz	x0, .L397
.L362:
	add	x19, x19, x20, sxtw 3
	ldr	x1, .LC115
	mov	x4, x0
	mov	w2, w20
	mov	w0, 1
	ldr	x3, [x19, 2456]
	ldr	x3, [x3, 16]
	bl	dprint_vfmw
	mov	w0, -1
.L401:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L396:
	cbz	w3, .L355
	ldr	w0, [x19, 4744]
	cbz	w0, .L355
	ldr	x0, [x19, 2592]
	cbz	x0, .L379
	ldr	x0, [x0, 16]
	mov	w20, 0
	cbnz	x0, .L372
	b	.L369
	.p2align 3
.L400:
	ldr	x1, [x0, 32]
	cbz	x1, .L373
	ldr	w0, [x19, 4744]
	add	w20, w20, 1
	cmp	w0, w20
	add	x1, x19, x20, sxtw 3
	bls	.L355
	ldr	x0, [x1, 2592]
	cbz	x0, .L398
	ldr	x0, [x0, 16]
	cbz	x0, .L399
.L372:
	ldr	w1, [x0, 28]
	ldr	w0, [x19, 252]
	bl	FSP_GetLogicFs
	cbnz	x0, .L400
.L373:
	ldr	x1, .LC121
	mov	x3, x0
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L393
.L377:
	mov	w20, 0
	.p2align 2
.L356:
	ldr	x1, .LC111
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L401
	.p2align 3
.L357:
	ldr	x1, .LC113
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L401
.L399:
	ldr	w3, [x19, 4740]
.L369:
	ldr	x1, .LC119
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L393
.L398:
	ldr	w3, [x19, 4740]
.L368:
	ldr	x1, .LC117
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L393
.L379:
	mov	w20, 0
	b	.L368
	.size	HEVC_IsRefListWrong, .-HEVC_IsRefListWrong
	.align	3
.LC111:
	.xword	.LC110
	.align	3
.LC113:
	.xword	.LC112
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetUnRefPicWithMinPoc
	.type	HEVC_GetUnRefPicWithMinPoc, %function
HEVC_GetUnRefPicWithMinPoc:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	mov	w21, -1
	bl	_mcount
	str	w21, [x20]
	ldr	w3, [x19, 2772]
	cmp	w3, 16
	bhi	.L403
	mov	w4, 2147483647
	mov	w0, 0
	cbz	w3, .L408
	.p2align 2
.L411:
	add	x2, x19, x0, uxtw 3
	ldr	x2, [x2, 2792]
	ldr	w5, [x2, 8]
	cmp	w5, w4
	bge	.L406
	ldr	w2, [x2]
	tst	w2, 16776960
	bne	.L406
	str	w0, [x20]
	mov	w4, w5
	ldr	w3, [x19, 2772]
.L406:
	add	w0, w0, 1
	cmp	w3, w0
	bhi	.L411
	ldr	w3, [x20]
	cmn	w3, #1
	beq	.L408
	ldr	x2, .LC122
	mov	w0, 1
	ldr	x1, .LC128
	add	x2, x2, 184
	bl	dprint_vfmw
	mov	w0, 0
.L405:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L408:
	ldr	x2, .LC122
	mov	w0, 1
	ldr	x1, .LC124
	add	x2, x2, 184
	bl	dprint_vfmw
	mov	w0, -1
	b	.L405
.L403:
	ldr	x2, .LC122
	mov	w0, 1
	ldr	x1, .LC126
	add	x2, x2, 184
	bl	dprint_vfmw
	mov	w0, w21
	b	.L405
	.size	HEVC_GetUnRefPicWithMinPoc, .-HEVC_GetUnRefPicWithMinPoc
	.align	3
.LC122:
	.xword	.LANCHOR0
	.align	3
.LC124:
	.xword	.LC123
	.align	3
.LC126:
	.xword	.LC125
	.align	3
.LC128:
	.xword	.LC127
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IncreaseDPBSize
	.type	HEVC_IncreaseDPBSize, %function
HEVC_IncreaseDPBSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x20, 2768]
	cmp	w3, 16
	bhi	.L418
	ldr	w0, [x20, 252]
	bl	FSP_GetTotalValidFsNum
	mov	w19, w0
	ldr	w2, [x20, 252]
	ldr	w0, [x20, 3980]
	ldr	w1, [x20, 3984]
	bl	FSP_GetOccupiedNum
	subs	w0, w19, w0
	csel	w0, w0, wzr, pl
	ldr	x2, .LC129
	cmp	w0, wzr
	ble	.L417
	ldr	w3, [x20, 2768]
	add	w3, w3, 1
	cmp	w3, w0
	bhi	.L417
	ldr	x1, .LC133
	add	x2, x2, 216
	mov	w0, 13
	str	w3, [x20, 2768]
	bl	dprint_vfmw
	mov	w0, 0
.L416:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L417:
	ldr	x1, .LC135
	mov	w3, w0
	add	x2, x2, 216
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L416
	.p2align 3
.L418:
	ldr	x2, .LC129
	mov	w4, 17
	ldr	x1, .LC131
	mov	w0, 1
	add	x2, x2, 216
	bl	dprint_vfmw
	mov	w1, 17
	mov	w0, -1
	str	w1, [x20, 2768]
	b	.L416
	.size	HEVC_IncreaseDPBSize, .-HEVC_IncreaseDPBSize
	.align	3
.LC129:
	.xword	.LANCHOR0
	.align	3
.LC131:
	.xword	.LC130
	.align	3
.LC133:
	.xword	.LC132
	.align	3
.LC135:
	.xword	.LC134
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_PicType
	.type	HEVC_PicType, %function
HEVC_PicType:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 3964]
	sub	w0, w0, #16
	cmp	w0, 5
	bls	.L423
	ldr	w0, [x19, 4692]
	cbz	w0, .L421
	cmp	w0, 1
	ldr	x19, [sp, 16]
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L421:
	mov	w0, 2
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L423:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_PicType, .-HEVC_PicType
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_PicTypeStatistic
	.type	HEVC_PicTypeStatistic, %function
HEVC_PicTypeStatistic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 4700]
	sub	w1, w0, #16
	cmp	w1, 5
	bhi	.L426
	str	w0, [x19, 3964]
	str	wzr, [x19, 3976]
.L425:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L426:
	ldr	w0, [x19, 3964]
	sub	w0, w0, #16
	cmp	w0, 5
	bls	.L425
	ldr	w0, [x19, 4692]
	cmp	w0, 1
	beq	.L428
	cmp	w0, 2
	beq	.L429
	cbnz	w0, .L425
	mov	w0, 2
	str	w0, [x19, 3976]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L428:
	ldr	w1, [x19, 3976]
	cmp	w1, 2
	beq	.L425
	str	w0, [x19, 3976]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L429:
	ldr	w0, [x19, 3976]
	sub	w0, w0, #1
	cmp	w0, 1
	bls	.L425
	str	wzr, [x19, 3976]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_PicTypeStatistic, .-HEVC_PicTypeStatistic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsReferenceNalu
	.type	HEVC_IsReferenceNalu, %function
HEVC_IsReferenceNalu:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 4700]
	cmp	w1, 15
	bhi	.L435
	mov	w0, 1
	tbnz	x1, 0, .L436
.L435:
	sub	w1, w1, #16
	cmp	w1, 7
	cset	w0, ls
.L436:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsReferenceNalu, .-HEVC_IsReferenceNalu
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_WriteQmatrix_4x4
	.type	HEVC_WriteQmatrix_4x4, %function
HEVC_WriteQmatrix_4x4:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x2
	mov	x21, x1
	ubfiz	x20, x20, 6, 32
	bl	_mcount
	add	x1, x21, x20
	ldrb	w4, [x1, 612]
	ldr	w3, [x1, 620]
	ldr	w2, [x1, 616]
	ldrb	w0, [x1, 608]
	ubfiz	w2, w2, 8, 8
	orr	w2, w2, w4, lsl 16
	orr	w0, w0, w3, lsl 24
	orr	w0, w2, w0
	str	w0, [x19]
	ldrb	w4, [x1, 621]
	ldrb	w2, [x1, 613]
	ldr	w3, [x1, 616]
	ldrb	w0, [x1, 609]
	lsl	w2, w2, 16
	and	w3, w3, 65280
	orr	w2, w2, w4, lsl 24
	orr	w0, w0, w3
	orr	w0, w2, w0
	str	w0, [x19, 4]
	ldrb	w4, [x1, 622]
	ldrb	w2, [x1, 618]
	ldr	w3, [x1, 612]
	ldrb	w0, [x1, 610]
	lsl	w2, w2, 8
	and	w3, w3, 16711680
	orr	w2, w2, w4, lsl 24
	orr	w0, w0, w3
	orr	w0, w2, w0
	str	w0, [x19, 8]
	ldrb	w3, [x1, 615]
	ldrb	w2, [x1, 619]
	ldr	w0, [x1, 620]
	ldrb	w1, [x1, 611]
	lsl	w2, w2, 8
	and	w0, w0, -16777216
	orr	w2, w2, w3, lsl 16
	orr	w0, w0, w1
	orr	w0, w2, w0
	str	w0, [x19, 12]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_WriteQmatrix_4x4, .-HEVC_WriteQmatrix_4x4
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_WriteQmatrix_32x32
	.type	HEVC_WriteQmatrix_32x32, %function
HEVC_WriteQmatrix_32x32:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x2
	mov	x21, x1
	bl	_mcount
	uxtw	x0, w20
	add	x1, x0, 18
	add	x0, x21, x0, lsl 6
	add	x1, x21, x1, lsl 6
	ldrb	w5, [x0, 1776]
	ldr	w3, [x0, 1784]
	ldr	w4, [x0, 1768]
	ldrb	w2, [x1, 608]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19]
	ldrb	w5, [x0, 1808]
	ldr	w3, [x0, 1816]
	ldr	w4, [x0, 1800]
	ldrb	w2, [x0, 1792]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19, 4]
	ldrb	w5, [x0, 1785]
	ldrb	w4, [x0, 1777]
	ldr	w3, [x0, 1768]
	ldrb	w2, [x1, 609]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 8]
	ldrb	w5, [x0, 1817]
	ldrb	w4, [x0, 1809]
	ldr	w3, [x0, 1800]
	ldrb	w2, [x0, 1793]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 12]
	ldrb	w5, [x0, 1786]
	ldrb	w4, [x0, 1770]
	ldr	w3, [x0, 1776]
	ldrb	w2, [x1, 610]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 16]
	ldrb	w5, [x0, 1818]
	ldrb	w4, [x0, 1802]
	ldr	w3, [x0, 1808]
	ldrb	w2, [x0, 1794]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 20]
	ldrb	w4, [x0, 1779]
	ldrb	w3, [x0, 1771]
	ldr	w5, [x0, 1784]
	ldrb	w2, [x1, 611]
	lsl	w3, w3, 8
	and	w1, w5, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 24]
	ldrb	w4, [x0, 1811]
	ldrb	w3, [x0, 1803]
	ldr	w1, [x0, 1816]
	ldrb	w2, [x0, 1795]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 28]
	ldrb	w4, [x0, 1780]
	ldr	w2, [x0, 1788]
	ldr	w3, [x0, 1772]
	ldrb	w1, [x0, 1764]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 32]
	ldrb	w4, [x0, 1812]
	ldr	w2, [x0, 1820]
	ldr	w3, [x0, 1804]
	ldrb	w1, [x0, 1796]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 36]
	ldrb	w4, [x0, 1789]
	ldrb	w3, [x0, 1781]
	ldr	w2, [x0, 1772]
	ldrb	w1, [x0, 1765]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 40]
	ldrb	w4, [x0, 1821]
	ldrb	w3, [x0, 1813]
	ldr	w2, [x0, 1804]
	ldrb	w1, [x0, 1797]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 44]
	ldrb	w4, [x0, 1790]
	ldrb	w3, [x0, 1774]
	ldr	w2, [x0, 1780]
	ldrb	w1, [x0, 1766]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 48]
	ldrb	w4, [x0, 1822]
	ldrb	w3, [x0, 1806]
	ldr	w2, [x0, 1812]
	ldrb	w1, [x0, 1798]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 52]
	ldrb	w4, [x0, 1783]
	ldrb	w3, [x0, 1775]
	ldr	w1, [x0, 1788]
	ldrb	w2, [x0, 1767]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 56]
	ldrb	w3, [x0, 1815]
	ldrb	w2, [x0, 1807]
	ldr	w4, [x0, 1820]
	ldrb	w1, [x0, 1799]
	lsl	w2, w2, 8
	and	w0, w4, -16777216
	orr	w2, w2, w3, lsl 16
	orr	w0, w0, w1
	orr	w0, w2, w0
	str	w0, [x19, 60]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_WriteQmatrix_32x32, .-HEVC_WriteQmatrix_32x32
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_WriteQmatrix_8x8
	.type	HEVC_WriteQmatrix_8x8, %function
HEVC_WriteQmatrix_8x8:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x2
	mov	x21, x1
	bl	_mcount
	uxtw	x0, w20
	add	x1, x0, 6
	add	x0, x21, x0, lsl 6
	add	x1, x21, x1, lsl 6
	ldrb	w5, [x0, 1024]
	ldr	w3, [x0, 1040]
	ldr	w4, [x0, 1008]
	ldrb	w2, [x1, 608]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19]
	ldrb	w5, [x0, 1032]
	ldr	w3, [x0, 1048]
	ldr	w4, [x0, 1016]
	ldrb	w2, [x0, 1000]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19, 4]
	ldrb	w5, [x0, 1041]
	ldrb	w4, [x0, 1025]
	ldr	w3, [x0, 1008]
	ldrb	w2, [x1, 609]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 8]
	ldrb	w5, [x0, 1049]
	ldrb	w4, [x0, 1033]
	ldr	w3, [x0, 1016]
	ldrb	w2, [x0, 1001]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 12]
	ldrb	w5, [x0, 1042]
	ldrb	w4, [x0, 1010]
	ldr	w3, [x0, 1024]
	ldrb	w2, [x1, 610]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 16]
	ldrb	w5, [x0, 1050]
	ldrb	w4, [x0, 1018]
	ldr	w3, [x0, 1032]
	ldrb	w2, [x0, 1002]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 20]
	ldrb	w4, [x0, 1027]
	ldrb	w3, [x0, 1011]
	ldr	w5, [x0, 1040]
	ldrb	w2, [x1, 611]
	lsl	w3, w3, 8
	and	w1, w5, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 24]
	ldrb	w4, [x0, 1035]
	ldrb	w3, [x0, 1019]
	ldr	w1, [x0, 1048]
	ldrb	w2, [x0, 1003]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 28]
	ldrb	w4, [x0, 1028]
	ldr	w2, [x0, 1044]
	ldr	w3, [x0, 1012]
	ldrb	w1, [x0, 996]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 32]
	ldrb	w4, [x0, 1036]
	ldr	w2, [x0, 1052]
	ldr	w3, [x0, 1020]
	ldrb	w1, [x0, 1004]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 36]
	ldrb	w4, [x0, 1045]
	ldrb	w3, [x0, 1029]
	ldr	w2, [x0, 1012]
	ldrb	w1, [x0, 997]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 40]
	ldrb	w4, [x0, 1053]
	ldrb	w3, [x0, 1037]
	ldr	w2, [x0, 1020]
	ldrb	w1, [x0, 1005]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 44]
	ldrb	w4, [x0, 1046]
	ldrb	w3, [x0, 1014]
	ldr	w2, [x0, 1028]
	ldrb	w1, [x0, 998]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 48]
	ldrb	w4, [x0, 1054]
	ldrb	w3, [x0, 1022]
	ldr	w2, [x0, 1036]
	ldrb	w1, [x0, 1006]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 52]
	ldrb	w4, [x0, 1031]
	ldrb	w3, [x0, 1015]
	ldr	w1, [x0, 1044]
	ldrb	w2, [x0, 999]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 56]
	ldrb	w3, [x0, 1039]
	ldrb	w2, [x0, 1023]
	ldr	w4, [x0, 1052]
	ldrb	w1, [x0, 1007]
	lsl	w2, w2, 8
	and	w0, w4, -16777216
	orr	w2, w2, w3, lsl 16
	orr	w0, w0, w1
	orr	w0, w2, w0
	str	w0, [x19, 60]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_WriteQmatrix_8x8, .-HEVC_WriteQmatrix_8x8
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_WriteQmatrix_16x16
	.type	HEVC_WriteQmatrix_16x16, %function
HEVC_WriteQmatrix_16x16:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x2
	mov	x21, x1
	bl	_mcount
	uxtw	x0, w20
	add	x1, x0, 12
	add	x0, x21, x0, lsl 6
	add	x1, x21, x1, lsl 6
	ldrb	w5, [x0, 1392]
	ldr	w3, [x0, 1400]
	ldr	w4, [x0, 1384]
	ldrb	w2, [x1, 608]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19]
	ldrb	w5, [x0, 1424]
	ldr	w3, [x0, 1432]
	ldr	w4, [x0, 1416]
	ldrb	w2, [x0, 1408]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19, 4]
	ldrb	w5, [x0, 1401]
	ldrb	w4, [x0, 1393]
	ldr	w3, [x0, 1384]
	ldrb	w2, [x1, 609]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 8]
	ldrb	w5, [x0, 1433]
	ldrb	w4, [x0, 1425]
	ldr	w3, [x0, 1416]
	ldrb	w2, [x0, 1409]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 12]
	ldrb	w5, [x0, 1402]
	ldrb	w4, [x0, 1386]
	ldr	w3, [x0, 1392]
	ldrb	w2, [x1, 610]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 16]
	ldrb	w5, [x0, 1434]
	ldrb	w4, [x0, 1418]
	ldr	w3, [x0, 1424]
	ldrb	w2, [x0, 1410]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 20]
	ldrb	w4, [x0, 1395]
	ldrb	w3, [x0, 1387]
	ldr	w5, [x0, 1400]
	ldrb	w2, [x1, 611]
	lsl	w3, w3, 8
	and	w1, w5, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 24]
	ldrb	w4, [x0, 1427]
	ldrb	w3, [x0, 1419]
	ldr	w1, [x0, 1432]
	ldrb	w2, [x0, 1411]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 28]
	ldrb	w4, [x0, 1396]
	ldr	w2, [x0, 1404]
	ldr	w3, [x0, 1388]
	ldrb	w1, [x0, 1380]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 32]
	ldrb	w4, [x0, 1428]
	ldr	w2, [x0, 1436]
	ldr	w3, [x0, 1420]
	ldrb	w1, [x0, 1412]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 36]
	ldrb	w4, [x0, 1405]
	ldrb	w3, [x0, 1397]
	ldr	w2, [x0, 1388]
	ldrb	w1, [x0, 1381]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 40]
	ldrb	w4, [x0, 1437]
	ldrb	w3, [x0, 1429]
	ldr	w2, [x0, 1420]
	ldrb	w1, [x0, 1413]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 44]
	ldrb	w4, [x0, 1406]
	ldrb	w3, [x0, 1390]
	ldr	w2, [x0, 1396]
	ldrb	w1, [x0, 1382]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 48]
	ldrb	w4, [x0, 1438]
	ldrb	w3, [x0, 1422]
	ldr	w2, [x0, 1428]
	ldrb	w1, [x0, 1414]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 52]
	ldrb	w4, [x0, 1399]
	ldrb	w3, [x0, 1391]
	ldr	w1, [x0, 1404]
	ldrb	w2, [x0, 1383]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 56]
	ldrb	w3, [x0, 1431]
	ldrb	w2, [x0, 1423]
	ldr	w4, [x0, 1436]
	ldrb	w1, [x0, 1415]
	lsl	w2, w2, 8
	and	w0, w4, -16777216
	orr	w2, w2, w3, lsl 16
	orr	w0, w0, w1
	orr	w0, w2, w0
	str	w0, [x19, 60]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_WriteQmatrix_16x16, .-HEVC_WriteQmatrix_16x16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CtbRsAddrToTsAddr
	.type	HEVC_CtbRsAddrToTsAddr, %function
HEVC_CtbRsAddrToTsAddr:
	stp	x29, x30, [sp, -224]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x3, [x20, 2408]
	ldrb	w0, [x3, 13]
	cbz	w0, .L476
	ldp	w6, w11, [x3, 68]
	ldr	x0, [x20, 2400]
	mov	w1, 0
	subs	w8, w11, #1
	ldrb	w7, [x3, 15]
	sub	w12, w6, #1
	ldr	w4, [x0, 64]
	ldr	w5, [x0, 128]
	bmi	.L448
	.p2align 2
.L479:
	sxtw	x0, w1
	add	x9, x29, 224
	add	w1, w1, 1
	add	x2, x3, x0, lsl 1
	add	x0, x9, x0, lsl 2
	cmp	w11, w1
	ldrsh	w2, [x2, 212]
	sub	w2, w2, #1
	str	w2, [x0, -172]
	bne	.L479
.L448:
	mov	w1, 0
	tbnz	w12, #31, .L446
	.p2align 2
.L478:
	sxtw	x0, w1
	add	x9, x29, 224
	add	w1, w1, 1
	add	x2, x3, x0, lsl 1
	add	x0, x9, x0, lsl 2
	cmp	w6, w1
	ldrsh	w2, [x2, 172]
	sub	w2, w2, #1
	str	w2, [x0, -84]
	bne	.L478
.L446:
	mov	w1, 1
	lsl	w0, w1, w5
	sdiv	w5, w4, w0
	msub	w0, w5, w0, w4
	cmp	w0, wzr
	csinc	w5, w5, w5, eq
	sdiv	w9, w19, w5
	msub	w5, w9, w5, w19
	cbz	w7, .L491
	tbnz	w8, #31, .L488
	mov	w14, 0
	mov	w13, 0
	mov	w4, 0
	mov	w7, 0
	mov	w8, 0
	mov	w0, 0
	.p2align 2
.L460:
	tbnz	w12, #31, .L471
	add	x0, x29, 224
	mov	w7, w4
	add	x0, x0, x13, sxtw 2
	mov	w1, 0
	mov	w2, 0
	ldr	w8, [x0, -172]
	add	w8, w8, 1
	add	w10, w14, w8
	b	.L457
	.p2align 3
.L469:
	mov	w7, w4
.L457:
	add	x0, x29, 224
	add	x0, x0, x2, sxtw 2
	add	w2, w2, 1
	ldr	w0, [x0, -84]
	add	w0, w0, 1
	add	w3, w0, w1
	cmp	w5, w3
	madd	w4, w0, w8, w4
	bge	.L455
	cmp	w9, w10
	blt	.L463
.L455:
	cmp	w6, w2
	mov	w1, w3
	bne	.L469
.L461:
	add	w1, w0, w3
	cmp	w5, w1
	bge	.L470
	cmp	w9, w10
	blt	.L486
.L470:
	add	w13, w13, 1
	mov	w14, w10
	cmp	w11, w13
	bne	.L460
.L487:
	sub	w9, w9, w10
	mov	w1, w3
	mul	w0, w9, w0
	.p2align 2
.L453:
	sub	w19, w5, w1
	add	w0, w19, w0
	add	w19, w0, w7
.L476:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 224
	ret
.L491:
	tbnz	w8, #31, .L488
	mov	w14, 0
	mov	w13, 0
	mov	w4, 0
	mov	w7, 0
	mov	w8, 0
	mov	w0, 0
	tbnz	w12, #31, .L474
	.p2align 2
.L492:
	add	x0, x29, 224
	mov	w7, w4
	add	x3, x0, x13, sxtw 2
	mov	w1, 0
	mov	w2, 0
	ldr	w8, [x3, -172]
	add	w8, w8, 1
	add	w10, w14, w8
	b	.L464
	.p2align 3
.L472:
	mov	w7, w4
.L464:
	add	x0, x29, 224
	add	x0, x0, x2, sxtw 2
	add	w2, w2, 1
	ldr	w0, [x0, -84]
	add	w0, w0, 1
	add	w3, w0, w1
	cmp	w5, w3
	madd	w4, w0, w8, w4
	bge	.L462
	cmp	w9, w10
	blt	.L463
.L462:
	cmp	w6, w2
	mov	w1, w3
	bne	.L472
.L468:
	add	w1, w0, w3
	cmp	w5, w1
	bge	.L473
	cmp	w9, w10
	blt	.L486
.L473:
	add	w13, w13, 1
	mov	w14, w10
	cmp	w11, w13
	beq	.L487
	tbz	w12, #31, .L492
.L474:
	mov	w3, 0
	add	w10, w14, w8
	b	.L468
	.p2align 3
.L463:
	sub	w9, w9, w14
	mul	w0, w9, w0
	b	.L453
.L471:
	mov	w3, 0
	add	w10, w14, w8
	b	.L461
.L488:
	mov	w0, 0
	mov	w1, 0
	mov	w7, 0
	b	.L453
.L486:
	sub	w9, w9, w14
	mov	w1, w3
	mul	w0, w9, w0
	b	.L453
	.size	HEVC_CtbRsAddrToTsAddr, .-HEVC_CtbRsAddrToTsAddr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CtbTsAddrToRsAddr
	.type	HEVC_CtbTsAddrToRsAddr, %function
HEVC_CtbTsAddrToRsAddr:
	stp	x29, x30, [sp, -224]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x3, [x20, 2408]
	ldrb	w0, [x3, 13]
	cbz	w0, .L511
	ldp	w8, w4, [x3, 68]
	ldr	x0, [x20, 2400]
	subs	w13, w4, #1
	sub	w12, w8, #1
	ldr	w5, [x0, 64]
	ldr	w6, [x0, 128]
	bmi	.L495
	mov	w1, 0
	.p2align 2
.L496:
	sxtw	x0, w1
	add	x7, x29, 224
	add	w1, w1, 1
	add	x2, x3, x0, lsl 1
	add	x0, x7, x0, lsl 2
	cmp	w4, w1
	ldrsh	w2, [x2, 212]
	sub	w2, w2, #1
	str	w2, [x0, -172]
	bne	.L496
	tbnz	w12, #31, .L528
.L498:
	mov	w1, 0
	.p2align 2
.L501:
	sxtw	x0, w1
	add	x4, x29, 224
	add	w1, w1, 1
	add	x2, x3, x0, lsl 1
	add	x0, x4, x0, lsl 2
	cmp	w12, w1
	ldrsh	w2, [x2, 172]
	sub	w2, w2, #1
	str	w2, [x0, -84]
	bge	.L501
	mov	w1, 1
	lsl	w0, w1, w6
	sdiv	w1, w5, w0
	msub	w0, w1, w0, w5
	cmp	w0, wzr
	csinc	w0, w1, w1, eq
	tbnz	w13, #31, .L499
.L500:
	ldr	w11, [x29, 140]
	mov	w10, 0
	mov	w9, 0
	mov	w4, 0
	mov	w1, 0
	mov	w7, 0
	mov	w2, 0
	add	w11, w11, 1
	.p2align 2
.L507:
	tbnz	w12, #31, .L513
	add	x1, x29, 224
	add	x1, x1, x9, sxtw 2
	ldr	w7, [x1, -172]
	add	w7, w7, 1
	madd	w5, w11, w7, w4
	cmp	w19, w5
	blt	.L514
	mov	w1, w4
	mov	w2, w11
	mov	w6, 0
	mov	w3, 0
	mov	w4, w5
	b	.L504
	.p2align 3
.L505:
	ldr	w2, [x5, -84]
	mov	w1, w4
	add	w2, w2, 1
	madd	w5, w2, w7, w4
	cmp	w5, w19
	bgt	.L506
	mov	w4, w5
.L504:
	add	w3, w3, 1
	add	x5, x29, 224
	cmp	w8, w3
	add	w6, w6, w2
	add	x5, x5, x3, sxtw 2
	bne	.L505
.L508:
	cmp	w4, w19
	bgt	.L512
	add	w9, w9, 1
	add	w10, w10, w7
	cmp	w13, w9
	bge	.L507
.L512:
	mov	w4, w1
	.p2align 2
.L506:
	cbz	w2, .L499
	sub	w4, w19, w4
	sdiv	w1, w4, w2
	add	w10, w1, w10
	msub	w4, w1, w2, w4
	add	w6, w4, w6
	madd	w0, w10, w0, w6
.L523:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 224
	ret
.L511:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 224
	ret
.L513:
	mov	w6, 0
	b	.L508
.L514:
	mov	w2, w11
	mov	w6, 0
	b	.L506
.L528:
	mov	w0, 1
	lsl	w0, w0, w6
	sdiv	w1, w5, w0
	msub	w0, w1, w0, w5
	cmp	w0, wzr
	csinc	w0, w1, w1, eq
	b	.L500
.L495:
	tbz	w12, #31, .L498
.L499:
	ldr	x1, .LC137
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L523
	.size	HEVC_CtbTsAddrToRsAddr, .-HEVC_CtbTsAddrToRsAddr
	.align	3
.LC137:
	.xword	.LC136
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CalcTileMap
	.type	HEVC_CalcTileMap, %function
HEVC_CalcTileMap:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC138
	ldr	x0, [x20]
	cbz	x0, .L551
	ldr	x21, .LC142
	add	x0, x0, 471040
	mov	x2, 16384
	mov	w1, 0
	movk	x2, 0x2, lsl 16
	add	x0, x0, 372
	ldr	x3, [x21, 96]
	blr	x3
	ldr	x0, [x20]
	mov	x2, 36864
	ldr	x3, [x21, 96]
	mov	w1, 0
	add	x0, x0, 618496
	add	x0, x0, 372
	blr	x3
	add	x0, x19, 8192
	ldr	x3, [x21, 96]
	mov	x2, 880
	mov	w1, 0
	add	x0, x0, 1156
	blr	x3
	str	wzr, [x19, 9344]
	ldr	x0, [x19, 2408]
	ldr	x2, [x19, 2400]
	ldr	w1, [x0, 72]
	ldr	w11, [x2, 188]
	cbz	w1, .L533
	ldr	x7, [x20]
	mov	w16, 0
	mov	w18, 0
	mov	w4, 0
.L540:
	ldr	w1, [x0, 68]
	uxtw	x17, w16
	cbz	w1, .L541
	add	x10, x17, 104
	ldr	w1, [x19, 9344]
	mul	w15, w18, w11
	mov	w13, 0
	mov	w14, 0
	lsl	x10, x10, 1
.L539:
	uxtw	x2, w1
	add	x3, x0, x10
	uxtw	x12, w13
	add	x5, x19, x2, lsl 3
	str	w4, [x5, 9348]
	ldrsh	w3, [x3, 4]
	cbz	w3, .L535
	add	x5, x12, 80
	add	w9, w14, w15
	mov	w8, 0
	lsl	x5, x5, 1
	.p2align 2
.L537:
	add	x2, x0, x5
	mov	w1, w4
	sub	w6, w9, w4
	ldrsh	w2, [x2, 12]
	cbz	w2, .L538
	.p2align 2
.L545:
	sxtw	x0, w1
	add	w3, w6, w1
	add	x0, x0, 114688
	add	w1, w1, 1
	sub	w2, w1, w4
	add	x0, x7, x0, lsl 2
	str	w3, [x0, 12660]
	ldr	x0, [x19, 2408]
	add	x3, x0, x5
	ldrsh	w3, [x3, 12]
	cmp	w3, w2
	bhi	.L545
	mov	w4, w1
.L538:
	add	x1, x0, x10
	add	w8, w8, 1
	add	w9, w9, w11
	ldrsh	w1, [x1, 4]
	cmp	w1, w8
	bhi	.L537
	ldr	w1, [x19, 9344]
	uxtw	x2, w1
.L535:
	add	x2, x19, x2, lsl 3
	sub	w3, w4, #1
	add	w1, w1, 1
	add	x12, x0, x12, lsl 1
	add	w13, w13, 1
	str	w3, [x2, 9352]
	str	w1, [x19, 9344]
	ldr	w3, [x0, 68]
	ldrsh	w2, [x12, 172]
	cmp	w3, w13
	add	w14, w14, w2
	bhi	.L539
.L541:
	add	x17, x0, x17, lsl 1
	ldr	w1, [x0, 72]
	add	w16, w16, 1
	cmp	w1, w16
	ldrsh	w1, [x17, 212]
	add	w18, w18, w1
	bhi	.L540
.L533:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L551:
	ldr	x2, .LC139
	ldr	x1, .LC141
	add	x2, x2, 240
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_CalcTileMap, .-HEVC_CalcTileMap
	.align	3
.LC138:
	.xword	.LANCHOR1
	.align	3
.LC139:
	.xword	.LANCHOR0
	.align	3
.LC141:
	.xword	.LC140
	.align	3
.LC142:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_WritePicMsg
	.type	HEVC_WritePicMsg, %function
HEVC_WritePicMsg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 4096
	add	x24, x19, 8192
	bl	_mcount
	ldr	w3, [x19, 3996]
	mov	w0, 2
	ldr	w2, [x19, 4180]
	ldr	x1, .LC144
	bl	dprint_vfmw
	ldr	x1, .LC146
	mov	w0, 4
	bl	dprint_vfmw
	ldr	w21, [x19, 3968]
	add	x9, x19, 3840
	ldr	w5, [x19, 4144]
	ldr	x3, [x19, 2400]
	ldp	w4, w1, [x9, 236]
	ldp	w0, w2, [x9, 228]
	str	w5, [x19, 7936]
	ldr	w5, [x19, 4148]
	sub	w2, w2, w0
	str	w5, [x19, 7940]
	sub	w0, w4, w0
	ldr	w5, [x19, 4180]
	str	w5, [x19, 7928]
	ldr	w5, [x19, 3996]
	str	w5, [x19, 7932]
	ldr	w5, [x19, 4168]
	str	w5, [x19, 7948]
	ldr	w5, [x19, 4172]
	str	w0, [x19, 7960]
	str	w5, [x19, 7952]
	ldr	x0, [x19, 2440]
	ldr	w5, [x19, 4176]
	str	w21, [x19, 6672]
	uxtw	x21, w21
	str	w2, [x19, 7944]
	lsl	x22, x21, 2
	str	x0, [x19, 9136]
	sub	w0, w1, w4
	str	w5, [x19, 7956]
	sub	x22, x22, x21
	str	wzr, [x19, 204]
	mov	x2, 64
	str	w0, [x19, 7964]
	add	x22, x21, x22, lsl 3
	lsl	x22, x22, 3
	ldrb	w0, [x3, 10]
	add	x1, x22, 12288
	strb	w0, [x20, 2550]
	add	x1, x19, x1
	add	x1, x1, 1104
	ldrb	w0, [x3, 3]
	strb	w0, [x20, 2551]
	add	x0, x20, 2672
	ldrb	w4, [x3, 7]
	strb	w4, [x20, 2552]
	ldrb	w4, [x3, 6]
	strb	w4, [x20, 2553]
	ldrb	w4, [x3, 5]
	strb	w4, [x20, 2554]
	ldr	w4, [x3, 60]
	str	w4, [x19, 6652]
	ldr	w4, [x3, 104]
	strb	w4, [x20, 2560]
	ldr	w4, [x3, 192]
	sub	w4, w4, #1
	str	w4, [x19, 6660]
	ldr	w4, [x3, 188]
	sub	w4, w4, #1
	str	w4, [x19, 6664]
	ldr	w4, [x19, 3972]
	str	w4, [x19, 6668]
	ldr	x4, [x19, 2408]
	ldr	w5, [x4, 84]
	sub	w5, w5, #2
	str	w5, [x19, 6676]
	ldrb	w5, [x4, 11]
	strb	w5, [x20, 2584]
	ldrb	w4, [x4, 10]
	strb	w4, [x20, 2585]
	ldr	w4, [x3, 164]
	str	w4, [x19, 6684]
	ldr	w4, [x3, 168]
	str	w4, [x19, 6688]
	ldr	w4, [x3, 156]
	str	w4, [x19, 6692]
	ldr	w4, [x3, 160]
	str	w4, [x19, 6696]
	ldr	w4, [x3, 148]
	str	w4, [x19, 6700]
	ldr	w4, [x3, 152]
	str	w4, [x19, 6704]
	ldr	w4, [x3, 172]
	str	w4, [x19, 6708]
	ldr	x5, .LC147
	ldr	w4, [x3, 124]
	str	w4, [x19, 6712]
	ldr	w4, [x3, 128]
	str	w4, [x19, 6716]
	ldr	w4, [x3, 100]
	str	w4, [x19, 6720]
	ldr	w4, [x3, 92]
	str	w4, [x19, 6724]
	ldr	w4, [x3, 112]
	str	w4, [x19, 6728]
	ldr	w4, [x3, 108]
	str	w4, [x19, 6732]
	ldr	w4, [x3, 96]
	str	w4, [x19, 6736]
	ldr	w4, [x3, 88]
	ldr	x3, [x5, 104]
	str	w4, [x19, 6740]
	blr	x3
	ldr	x4, [x19, 2400]
	add	x3, x24, 780
	add	x2, x24, 700
	add	x1, x24, 188
	mov	x0, x19
	ldr	w5, [x4, 68]
	str	w5, [x19, 6832]
	ldr	w4, [x4, 64]
	str	w4, [x19, 6836]
	bl	HEVC_CalcTileInfo
	cbnz	w0, .L570
	ldr	x0, [x19, 2408]
	ldrb	w1, [x0, 16]
	strb	w1, [x20, 2764]
	ldrb	w1, [x0, 7]
	strb	w1, [x20, 2765]
	ldrb	w1, [x0, 3]
	strb	w1, [x20, 2766]
	ldrb	w1, [x0, 14]
	strb	w1, [x20, 2767]
	ldrb	w1, [x0, 15]
	strb	w1, [x20, 2768]
	ldrb	w1, [x0, 13]
	strb	w1, [x20, 2769]
	ldr	x1, [x19, 2400]
	ldr	w2, [x0, 56]
	ldr	w1, [x1, 128]
	sub	w1, w1, w2
	str	w1, [x19, 6868]
	ldr	w1, [x0, 52]
	str	w1, [x19, 6872]
	ldrb	w1, [x0, 8]
	strb	w1, [x20, 2780]
	ldrb	w1, [x0, 12]
	strb	w1, [x20, 2781]
	ldrb	w1, [x0, 6]
	strb	w1, [x20, 2782]
	ldr	w1, [x0, 60]
	str	w1, [x19, 6880]
	ldr	w1, [x0, 64]
	str	w1, [x19, 6884]
	ldr	w1, [x0, 72]
	sub	w1, w1, #1
	str	w1, [x19, 6888]
	ldr	w1, [x0, 68]
	sub	w1, w1, #1
	str	w1, [x19, 6892]
	ldrb	w1, [x0, 10]
	strb	w1, [x20, 2585]
	ldrb	w0, [x0, 11]
	strb	w0, [x20, 2584]
	ldr	x1, [x19, 4024]
	ldr	w0, [x19, 252]
	ldr	w1, [x1, 28]
	bl	FSP_GetLogicFs
	mov	x23, x0
	cbz	x0, .L571
	ldp	x2, x3, [x0, 32]
	cbz	x2, .L557
	cbz	x3, .L557
	ldr	w0, [x19, 252]
	add	x3, x24, 60
	add	x2, x20, 3888
	add	x1, x20, 4016
	add	x22, x19, x22
	bl	FSP_GetDecFsAddrTab
	ldr	x3, [x23, 32]
	add	x1, x24, 52
	ldr	w0, [x19, 252]
	add	x2, x20, 4020
	ldr	w3, [x3, 4]
	str	w3, [x19, 7928]
	bl	FSP_GetPmvAddrTab
	ldr	w0, [x19, 3996]
	mov	w1, 0
	str	w0, [x19, 7932]
	ldr	w0, [x23, 12]
	str	w0, [x19, 8248]
	ldr	x0, [x23, 40]
	ldr	w0, [x0, 8]
	str	w0, [x19, 9336]
	ldr	x0, [x23, 40]
	ldr	w0, [x0, 64]
	str	w0, [x19, 9340]
	ldr	w4, [x22, 13256]
	str	w4, [x19, 9124]
	cbz	w4, .L562
	lsl	x3, x21, 3
	sub	x3, x3, x21
	add	x21, x21, x3, lsl 3
	sub	x3, x21, x3
	.p2align 2
.L565:
	sxtw	x0, w1
	add	w1, w1, 1
	add	x2, x3, x0
	cmp	w1, w4
	add	x0, x19, x0, lsl 2
	add	x2, x19, x2, lsl 2
	ldr	w2, [x2, 13328]
	str	w2, [x0, 9060]
	bne	.L565
.L562:
	add	x22, x20, 2804
	mov	w21, 0
.L560:
	mov	x2, x22
	mov	w0, w21
	mov	x1, x19
	add	w21, w21, 1
	add	x22, x22, 64
	bl	HEVC_WriteQmatrix_8x8
	cmp	w21, 4
	bne	.L560
	mov	w0, w21
	add	x2, x20, 3060
	mov	x1, x19
	add	x22, x20, 3316
	mov	w21, 2
	bl	HEVC_WriteQmatrix_8x8
	add	x2, x20, 3124
	mov	x1, x19
	mov	w0, 5
	bl	HEVC_WriteQmatrix_8x8
	add	x2, x20, 3188
	mov	x1, x19
	mov	w0, 0
	bl	HEVC_WriteQmatrix_16x16
	add	x2, x20, 3252
	mov	x1, x19
	mov	w0, 1
	bl	HEVC_WriteQmatrix_16x16
.L563:
	mov	x2, x22
	mov	w0, w21
	mov	x1, x19
	add	w21, w21, 1
	add	x22, x22, 64
	bl	HEVC_WriteQmatrix_16x16
	cmp	w21, 6
	bne	.L563
	add	x2, x20, 3572
	mov	x1, x19
	mov	w0, 0
	add	x22, x20, 3700
	mov	w21, 0
	bl	HEVC_WriteQmatrix_32x32
	add	x2, x20, 3636
	mov	x1, x19
	mov	w0, 1
	bl	HEVC_WriteQmatrix_32x32
	.p2align 2
.L564:
	mov	x2, x22
	mov	w0, w21
	mov	x1, x19
	add	w21, w21, 1
	add	x22, x22, 16
	bl	HEVC_WriteQmatrix_4x4
	cmp	w21, 6
	bne	.L564
	add	x0, x19, 2048
	add	x8, x19, 2304
	ldp	w5, w6, [x0, 248]
	ldp	w3, w4, [x8, 8]
	ldp	w7, w2, [x0, 240]
	ldp	w0, w1, [x8]
	lsl	w3, w3, 16
	lsl	w5, w5, 16
	orr	w3, w3, w4, lsl 24
	orr	w5, w5, w6, lsl 24
	orr	w0, w0, w1, lsl 8
	orr	w2, w7, w2, lsl 8
	orr	w0, w3, w0
	ldr	w4, [x19, 3996]
	orr	w1, w5, w2
	str	w0, [x19, 7896]
	str	w1, [x19, 7892]
	mov	w0, 0
	str	w4, [x19, 7924]
.L554:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L570:
	ldr	x2, .LC148
	mov	w0, 1
	ldr	x1, .LC150
	add	x2, x2, 264
	bl	dprint_vfmw
	mov	w0, -1
	b	.L554
.L557:
	ldr	x1, .LC154
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L554
.L571:
	ldr	x2, [x19, 4024]
	mov	w0, 1
	ldr	x1, .LC152
	ldr	w2, [x2, 28]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L554
	.size	HEVC_WritePicMsg, .-HEVC_WritePicMsg
	.align	3
.LC144:
	.xword	.LC143
	.align	3
.LC146:
	.xword	.LC145
	.align	3
.LC147:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC148:
	.xword	.LANCHOR0
	.align	3
.LC150:
	.xword	.LC149
	.align	3
.LC152:
	.xword	.LC151
	.align	3
.LC154:
	.xword	.LC153
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CheckListX
	.type	HEVC_CheckListX, %function
HEVC_CheckListX:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 4096
	add	x0, x0, 576
	ldrb	w1, [x0, 1]
	cbz	w1, .L574
	ldrsb	w1, [x19, 11]
	add	x0, x19, 8192
	add	x0, x0, 3708
	cbz	w1, .L606
.L574:
	ldp	w4, w5, [x0, 68]
	cmp	w4, 16
	bhi	.L607
	cmp	w5, 16
	bhi	.L578
	cbz	w4, .L579
	ldr	x0, [x19, 2456]
	cbz	x0, .L592
	ldr	x0, [x0, 16]
	cbz	x0, .L608
	add	x0, x19, 2464
	mov	w2, 0
	b	.L584
	.p2align 3
.L585:
	ldr	x1, [x0]
	add	x0, x0, 8
	cbz	x1, .L580
	ldr	x1, [x1, 16]
	cbz	x1, .L581
.L584:
	add	w2, w2, 1
	cmp	w4, w2
	bne	.L585
.L579:
	cbz	w5, .L594
	ldr	x0, [x19, 2592]
	cbz	x0, .L595
	ldr	x0, [x0, 16]
	cbz	x0, .L609
	add	x0, x19, 2600
	mov	w2, 0
	b	.L590
	.p2align 3
.L591:
	ldr	x1, [x0]
	add	x0, x0, 8
	cbz	x1, .L586
	ldr	x1, [x1, 16]
	cbz	x1, .L587
.L590:
	add	w2, w2, 1
	cmp	w5, w2
	bne	.L591
.L594:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L592:
	mov	w2, 0
	.p2align 2
.L580:
	ldr	x1, .LC163
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
.L576:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L608:
	mov	w2, 0
.L581:
	ldr	x1, .LC165
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L595:
	mov	w2, 0
.L586:
	ldr	x1, .LC167
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L609:
	mov	w2, 0
.L587:
	ldr	x1, .LC169
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L606:
	ldr	x2, .LC155
	mov	w0, 0
	ldr	x1, .LC157
	add	x2, x2, 288
	bl	dprint_vfmw
	mov	w0, -1
	b	.L576
.L578:
	ldr	x1, .LC161
	mov	w3, 17
	mov	w2, w5
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L576
.L607:
	ldr	x1, .LC159
	mov	w3, 17
	mov	w2, w4
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L576
	.size	HEVC_CheckListX, .-HEVC_CheckListX
	.align	3
.LC155:
	.xword	.LANCHOR0
	.align	3
.LC157:
	.xword	.LC156
	.align	3
.LC159:
	.xword	.LC158
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_WriteSliceMsg
	.type	HEVC_WriteSliceMsg, %function
HEVC_WriteSliceMsg:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	ldr	w24, [x19, 3968]
	bl	HEVC_CheckListX
	mov	w23, w0
	cbnz	w0, .L651
	ldr	w3, [x19, 152]
	ldr	w0, [x19, 204]
	cmp	w0, w3
	bcs	.L687
	mov	w21, 1368
	ldr	x22, .LC172
	ldr	x20, [x19, 2440]
	mov	x2, 1368
	umull	x0, w0, w21
	ldr	x3, [x22, 96]
	mov	w1, 0
	add	x20, x20, x0
	mov	x0, x20
	blr	x3
	ldr	x3, [x22, 96]
	mov	w1, 0
	mov	x2, 64
	add	x0, x29, 96
	blr	x3
	ldr	w0, [x19, 204]
	ldr	w1, [x19, 152]
	add	w0, w0, 1
	str	w0, [x19, 204]
	cmp	w0, w1
	bcc	.L688
	str	xzr, [x20, 1360]
.L614:
	ldr	w21, [x19, 176]
	ldr	w0, [x19, 236]
	ldr	w1, [x19, 4708]
	add	w21, w21, 1
	ldr	x3, [x19, 2376]
	add	w0, w0, 1
	str	w21, [x19, 176]
	str	w1, [x19, 208]
	str	w0, [x19, 236]
	ldrb	w1, [x3]
	ldr	w0, [x3, 8]
	cmp	w1, 1
	ccmp	w1, w0, 2, ls
	bcs	.L615
	.p2align 2
.L616:
	uxtw	x0, w1
	lsl	x2, x0, 5
	add	x3, x3, x2
	add	x0, x20, x0, lsl 2
	ldr	w3, [x3, 60]
	str	w3, [x0, 8]
	ldr	x3, [x19, 2376]
	add	x3, x3, x2
	ldr	w3, [x3, 56]
	str	w3, [x20, w1, uxtw 2]
	add	w1, w1, 1
	ldr	x3, [x19, 2376]
	add	x2, x3, x2
	ldr	w2, [x2, 64]
	str	w2, [x0, 16]
	ldr	x3, [x19, 2376]
	ldr	w0, [x3, 8]
	cmp	w0, w1
	ccmp	w1, 1, 2, hi
	bls	.L616
.L615:
	cmp	w0, 1
	bhi	.L621
	.p2align 2
.L672:
	add	x1, x20, x0, uxtw 2
	str	wzr, [x1, 8]
	str	wzr, [x20, w0, uxtw 2]
	add	w0, w0, 1
	cmp	w0, 2
	str	wzr, [x1, 16]
	bne	.L672
.L621:
	add	x26, x19, 4096
	add	x25, x19, 8192
	ldrb	w0, [x26, 577]
	cbz	w0, .L689
.L619:
	ldr	w0, [x19, 11968]
	cbz	w0, .L622
	mov	w1, 0
	.p2align 2
.L623:
	uxtw	x0, w1
	add	x5, x29, 160
	add	w1, w1, 1
	add	x2, x19, x0, lsl 3
	add	x0, x20, x0, lsl 2
	ldr	x3, [x2, 2456]
	ldr	w3, [x3, 4]
	str	w3, [x0, 116]
	ldr	x4, [x2, 2456]
	ldr	x2, [x4, 16]
	ldp	w3, w2, [x2, 20]
	add	x3, x19, x3, lsl 2
	add	x2, x5, x2, lsl 2
	ldr	w3, [x3, 8116]
	str	w3, [x2, -64]
	ldr	x2, [x4, 16]
	ldr	w2, [x2, 24]
	str	w2, [x0, 372]
	ldr	w0, [x19, 11968]
	cmp	w0, w1
	bhi	.L623
	ldr	w3, [x19, 11972]
	cbz	w3, .L624
.L650:
	mov	w1, 0
	.p2align 2
.L625:
	uxtw	x0, w1
	add	x5, x29, 160
	add	w1, w1, 1
	add	x2, x19, x0, lsl 3
	add	x0, x20, x0, lsl 2
	ldr	x3, [x2, 2592]
	ldr	w3, [x3, 4]
	str	w3, [x0, 180]
	ldr	x4, [x2, 2592]
	ldr	x2, [x4, 16]
	ldp	w3, w2, [x2, 20]
	add	x3, x19, x3, lsl 2
	add	x2, x5, x2, lsl 2
	ldr	w3, [x3, 8116]
	str	w3, [x2, -64]
	ldr	x2, [x4, 16]
	ldr	w2, [x2, 24]
	str	w2, [x0, 436]
	ldr	w3, [x19, 11972]
	cmp	w3, w1
	bhi	.L625
	ldr	w0, [x19, 11968]
.L624:
	cbz	w0, .L626
	uxtw	x1, w24
	ldr	w2, [x20, 372]
	lsl	x4, x1, 3
	ldr	w5, [x19, 3972]
	sub	x4, x4, x1
	lsl	x6, x4, 3
	sub	x4, x6, x4
	add	x4, x4, x1
	add	x1, x4, x2
	add	x1, x19, x1, lsl 2
	ldr	w1, [x1, 13392]
	cmp	w5, w1
	blt	.L657
	sub	w0, w0, #1
	mov	x1, x20
	add	x2, x20, x0, lsl 2
	b	.L629
	.p2align 3
.L630:
	ldr	w0, [x1, 376]
	add	x1, x1, 4
	add	x0, x4, x0
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 13392]
	cmp	w0, w5
	bgt	.L657
.L629:
	cmp	x2, x1
	bne	.L630
.L626:
	ldr	w0, [x19, 11920]
	cbnz	w0, .L686
	mov	w0, 1
	cbz	w3, .L627
	uxtw	x1, w24
	ldr	w0, [x20, 436]
	lsl	x2, x1, 3
	ldr	w4, [x19, 3972]
	sub	x2, x2, x1
	lsl	x5, x2, 3
	sub	x2, x5, x2
	add	x1, x2, x1
	add	x0, x1, x0
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 13392]
	cmp	w4, w0
	blt	.L657
	sub	w3, w3, #1
	mov	x2, x20
	add	x3, x20, x3, lsl 2
	b	.L632
	.p2align 3
.L633:
	ldr	w0, [x2, 440]
	add	x2, x2, 4
	add	x0, x1, x0
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 13392]
	cmp	w0, w4
	bgt	.L657
.L632:
	cmp	x2, x3
	bne	.L633
.L686:
	mov	w0, 1
.L627:
	strb	w0, [x20, 24]
	ldrb	w0, [x26, 577]
	strb	w0, [x20, 25]
	ldr	w0, [x19, 11916]
	str	w0, [x20, 28]
	ldrb	w1, [x25, 3715]
	strb	w1, [x20, 32]
	ldr	w1, [x19, 11940]
	str	w1, [x20, 36]
	ldr	x2, [x19, 4024]
	ldr	w3, [x19, 204]
	ldr	w4, [x2, 316]
	sub	w1, w3, #1
	madd	w0, w1, w4, w0
	udiv	w0, w0, w3
	str	w0, [x2, 68]
	ldr	w0, [x19, 11920]
	cbz	w0, .L690
	cmp	w0, 1
	mov	w24, 0
	beq	.L635
.L636:
	str	w24, [x20, 40]
	ldr	w0, [x19, 11944]
	str	w0, [x20, 48]
	ldrb	w0, [x25, 3716]
	strb	w0, [x20, 52]
	ldr	w0, [x19, 11948]
	str	w0, [x20, 44]
	ldr	w0, [x19, 11976]
	cbz	w0, .L637
	sub	w0, w0, #1
	str	w0, [x20, 60]
.L638:
	ldr	w0, [x19, 11980]
	cbz	w0, .L639
	sub	w0, w0, #1
	str	w0, [x20, 56]
.L640:
	ldrb	w0, [x25, 3712]
	strb	w0, [x20, 64]
	ldrb	w0, [x25, 3714]
	strb	w0, [x20, 65]
	ldr	w0, [x19, 11968]
	str	w0, [x20, 68]
	ldr	w0, [x19, 11972]
	str	w0, [x20, 72]
	ldr	w0, [x19, 11920]
	str	w0, [x20, 76]
	ldr	w0, [x19, 4712]
	str	w0, [x20, 80]
	ldr	x0, [x19, 2400]
	ldr	w3, [x19, 4712]
	ldr	w1, [x0, 188]
	mov	x0, x19
	udiv	w2, w3, w1
	msub	w1, w2, w1, w3
	str	w1, [x20, 84]
	ldr	x1, [x19, 2400]
	ldr	w2, [x1, 188]
	ldr	w1, [x19, 4712]
	udiv	w1, w1, w2
	str	w1, [x20, 88]
	ldr	w1, [x19, 4712]
	bl	HEVC_CtbRsAddrToTsAddr
	str	w0, [x20, 92]
	ldr	w0, [x19, 11952]
	str	w0, [x20, 96]
	ldr	w0, [x19, 11956]
	str	w0, [x20, 100]
	ldr	w0, [x19, 11964]
	str	w0, [x20, 104]
	ldr	w0, [x19, 11960]
	str	w0, [x20, 108]
	ldrb	w0, [x25, 3711]
	strb	w0, [x20, 112]
	ldrb	w0, [x25, 3710]
	strb	w0, [x20, 113]
	ldrb	w0, [x25, 3717]
	strb	w0, [x20, 114]
	ldrb	w0, [x25, 3718]
	strb	w0, [x20, 115]
	ldr	x0, [x19, 2408]
	ldrb	w1, [x0, 10]
	cbz	w1, .L641
	ldr	w1, [x19, 11920]
	cmp	w1, 1
	beq	.L642
.L641:
	ldrb	w0, [x0, 11]
	cmp	w0, 1
	beq	.L691
.L644:
	ldrb	w0, [x25, 3712]
	cbz	w0, .L646
	add	x0, x29, 160
	add	x24, x0, x24, sxtw 2
	ldr	w0, [x24, -64]
	str	w0, [x20, 564]
.L647:
	ldr	x0, [x19, 2416]
	ldr	x1, [x19, 2376]
	str	x1, [x0, w21, uxtw 3]
	str	xzr, [x19, 2376]
	ldrb	w0, [x26, 2769]
	cbz	w0, .L665
	ldr	w0, [x19, 236]
	cmp	w0, 1
	beq	.L692
	sub	w1, w0, #2
	ldr	w2, [x20, 92]
	sub	w0, w0, #1
	add	x1, x19, x1, lsl 3
	sub	w2, w2, #1
	add	x3, x19, x0, lsl 3
	str	w2, [x1, 10232]
	ldr	w1, [x20, 92]
	str	w1, [x3, 10228]
.L649:
	ldr	w1, [x19, 6660]
	add	x0, x19, x0, lsl 3
	ldr	w2, [x19, 6664]
	mov	w3, 36863
	madd	w2, w1, w2, w2
	add	w1, w2, w1
	str	w1, [x0, 10232]
	ldr	w1, [x20, 92]
	sub	w1, w1, #1
	cmp	w1, w3
	bhi	.L665
	mov	x0, x19
	bl	HEVC_CtbTsAddrToRsAddr
	str	w0, [x20, 568]
.L665:
	mov	w0, w23
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L688:
	ldr	x1, [x19, 2440]
	umull	x0, w0, w21
	add	x0, x1, x0
	str	x0, [x20, 1360]
	b	.L614
	.p2align 3
.L657:
	mov	w0, 0
	b	.L627
	.p2align 3
.L639:
	str	wzr, [x20, 56]
	b	.L640
	.p2align 3
.L646:
	ldr	w0, [x19, 8116]
	str	w0, [x20, 564]
	b	.L647
	.p2align 3
.L637:
	str	wzr, [x20, 60]
	b	.L638
	.p2align 3
.L690:
	ldrb	w0, [x25, 3716]
	cbnz	w0, .L635
	ldrsw	x0, [x19, 11944]
	add	x0, x20, x0, lsl 2
	ldr	w24, [x0, 436]
	b	.L636
	.p2align 3
.L635:
	ldrsw	x0, [x19, 11944]
	add	x0, x20, x0, lsl 2
	ldr	w24, [x0, 372]
	b	.L636
	.p2align 3
.L689:
	ldr	x3, [x22, 104]
	mov	x2, 1356
	add	x1, x26, 576
	add	x0, x25, 3708
	blr	x3
	mov	w0, 1
	strb	w0, [x19, 11]
	b	.L619
	.p2align 3
.L691:
	ldr	w0, [x19, 11920]
	cbnz	w0, .L644
.L642:
	ldr	w0, [x19, 12056]
	mov	x2, 64
	str	w0, [x20, 580]
	add	x1, x25, 4000
	ldr	x3, [x22, 104]
	add	x27, x19, 12288
	ldr	w0, [x19, 12188]
	str	w0, [x20, 584]
	add	x0, x20, 588
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 64
	add	x1, x25, 3868
	add	x0, x20, 716
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 128
	add	x1, x25, 4064
	add	x0, x20, 844
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 128
	add	x1, x27, 96
	add	x0, x20, 1100
	blr	x3
	ldr	w0, [x19, 11920]
	cbnz	w0, .L644
	ldr	x3, [x22, 104]
	add	x1, x27, 224
	mov	x2, 64
	add	x0, x20, 652
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x25, 3932
	mov	x2, 64
	add	x0, x20, 780
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x27, 288
	mov	x2, 128
	add	x0, x20, 972
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 128
	add	x1, x27, 416
	add	x0, x20, 1228
	blr	x3
	b	.L644
	.p2align 3
.L692:
	ldr	w1, [x20, 92]
	mov	x0, 0
	str	w1, [x19, 10228]
	b	.L649
.L622:
	ldr	w0, [x19, 11972]
	cbnz	w0, .L650
	mov	w0, 1
	b	.L627
.L651:
	mov	w23, -1
	b	.L665
.L687:
	ldr	x1, .LC171
	mov	w2, w0
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L665
	.size	HEVC_WriteSliceMsg, .-HEVC_WriteSliceMsg
	.align	3
.LC171:
	.xword	.LC170
	.align	3
.LC172:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetVirAddr
	.type	HEVC_GetVirAddr, %function
HEVC_GetVirAddr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	add	x0, x19, x20, uxtw 2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_GetVirAddr, .-HEVC_GetVirAddr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetPhyAddr
	.type	HEVC_GetPhyAddr, %function
HEVC_GetPhyAddr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	w0, w19, w20, lsl 2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_GetPhyAddr, .-HEVC_GetPhyAddr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CfgVDMReg
	.type	HEVC_CfgVDMReg, %function
HEVC_CfgVDMReg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 3988]
	ldr	w0, [x19, 204]
	ldr	w2, [x19, 3992]
	cmp	w1, wzr
	str	w0, [x19, 9128]
	cset	w1, eq
	str	w2, [x19, 7972]
	mov	w0, 0
	str	w1, [x19, 7980]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_CfgVDMReg, .-HEVC_CfgVDMReg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsRefForCurrPic
	.type	HEVC_IsRefForCurrPic, %function
HEVC_IsRefForCurrPic:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19, 4708]
	ldr	w4, [x19, 164]
	tbnz	w3, #31, .L698
	cmp	w3, w4
	bge	.L698
	ldr	x0, [x19, 2360]
	mov	w1, 1888
	ldr	w4, [x19, 160]
	smaddl	x3, w3, w1, x0
	ldr	w3, [x3, 32]
	tbnz	w3, #31, .L702
	cmp	w3, w4
	bge	.L702
	add	x20, x19, 4096
	ldr	x2, [x19, 2352]
	mov	w4, 12660
	ldr	w5, [x19, 5604]
	ldr	w6, [x20, 1512]
	mov	w0, 1
	smaddl	x3, w3, w4, x2
	ldr	w4, [x20, 1516]
	add	w7, w5, w6
	ldr	w9, [x3, 116]
	cmp	w7, w4
	mov	w3, w7
	lsl	w9, w0, w9
	bcs	.L714
	cmp	w7, 15
	bgt	.L705
	ldr	w8, [x19, 3972]
	sub	w9, w9, #1
	and	w10, w9, w8
	b	.L707
	.p2align 3
.L725:
	cmp	w4, w3
	bls	.L714
	cmp	w3, 16
	beq	.L705
.L707:
	add	x0, x19, x3, sxtw 2
	mov	w1, w8
	add	w3, w3, 1
	ldr	w2, [x0, 4760]
	ldr	w0, [x0, 5704]
	cbnz	w2, .L708
	mov	w1, w10
	and	w0, w0, w9
.L708:
	cmp	w1, w0
	bne	.L725
	mov	w21, 1
.L704:
	cbz	w7, .L700
	ldr	w3, [x19, 4684]
	add	x1, x20, 1544
	ldr	w0, [x20, 1540]
	mov	w4, 0
	ldr	w2, [x19, 3972]
	add	w0, w3, w0
	cmp	w2, w0
	bne	.L712
	b	.L718
	.p2align 3
.L711:
	ldr	w0, [x1], 4
	add	w0, w3, w0
	cmp	w0, w2
	beq	.L718
.L712:
	add	w4, w4, 1
	cmp	w4, w7
	beq	.L700
	cmp	w4, 17
	bne	.L711
	ldr	x1, .LC180
	mov	w3, w4
	mov	w2, 9101
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, w21
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L702:
	ldr	x1, .LC176
	mov	w2, 9052
	mov	w0, 0
	mov	w21, 0
	bl	dprint_vfmw
.L700:
	mov	w0, w21
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L698:
	ldr	x1, .LC174
	mov	w2, 9040
	mov	w0, 0
	mov	w21, 0
	bl	dprint_vfmw
	mov	w0, w21
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L714:
	mov	w21, 0
	b	.L704
	.p2align 3
.L705:
	ldr	x1, .LC178
	mov	w5, w4
	mov	w2, 9072
	mov	w4, 16
	mov	w0, 0
	mov	w21, 0
	bl	dprint_vfmw
	ldr	w5, [x19, 5604]
	ldr	w6, [x20, 1512]
	add	w7, w5, w6
	b	.L704
	.p2align 3
.L718:
	mov	w21, 1
	b	.L700
	.size	HEVC_IsRefForCurrPic, .-HEVC_IsRefForCurrPic
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsPicVPSRefresh
	.type	HEVC_IsPicVPSRefresh, %function
HEVC_IsPicVPSRefresh:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x1, [x20, 2392]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	cmp	w1, w0
	beq	.L729
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L729:
	ldrb	w0, [x19, 2]
	ldp	x19, x20, [sp, 16]
	cmp	w0, wzr
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsPicVPSRefresh, .-HEVC_IsPicVPSRefresh
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_UpdatePicVPS
	.type	HEVC_UpdatePicVPS, %function
HEVC_UpdatePicVPS:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x1
	mov	x19, x0
	mov	x0, x30
	mov	w21, 132
	mov	x20, -132
	bl	_mcount
	strb	wzr, [x22, 2]
	ldr	x3, .LC181
	mov	x1, x22
	ldr	w0, [x19, 156]
	mov	x2, 132
	ldr	x4, [x19, 2344]
	ldr	x3, [x3, 104]
	smaddl	x0, w0, w21, x20
	add	x0, x4, x0
	blr	x3
	ldr	w0, [x19, 156]
	ldr	x1, [x19, 2344]
	smaddl	x0, w0, w21, x20
	add	x0, x1, x0
	str	x0, [x19, 2392]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_UpdatePicVPS, .-HEVC_UpdatePicVPS
	.align	3
.LC181:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsPicSPSRefresh
	.type	HEVC_IsPicSPSRefresh, %function
HEVC_IsPicSPSRefresh:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x1, [x20, 2400]
	ldr	w0, [x19, 56]
	ldr	w1, [x1, 56]
	cmp	w1, w0
	beq	.L734
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L734:
	ldrb	w0, [x19]
	ldp	x19, x20, [sp, 16]
	cmp	w0, wzr
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsPicSPSRefresh, .-HEVC_IsPicSPSRefresh
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_UpdatePicSPS
	.type	HEVC_UpdatePicSPS, %function
HEVC_UpdatePicSPS:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x1
	mov	x19, x0
	mov	x0, x30
	mov	w21, 12660
	mov	x20, -12660
	bl	_mcount
	strb	wzr, [x22]
	ldr	x3, .LC182
	mov	x1, x22
	ldr	w0, [x19, 160]
	mov	x2, 12660
	ldr	x4, [x19, 2352]
	ldr	x3, [x3, 104]
	smaddl	x0, w0, w21, x20
	add	x0, x4, x0
	blr	x3
	ldr	w0, [x19, 160]
	ldr	x1, [x19, 2352]
	smaddl	x0, w0, w21, x20
	add	x0, x1, x0
	str	x0, [x19, 2400]
	ldr	w1, [x0, 56]
	str	w1, [x19, 264]
	ldr	w1, [x0, 64]
	str	w1, [x19, 268]
	ldr	w1, [x0, 68]
	str	w1, [x19, 272]
	ldr	w1, [x0, 128]
	str	w1, [x19, 276]
	ldr	w1, [x0, 88]
	str	w1, [x19, 280]
	ldr	w0, [x0, 96]
	str	w0, [x19, 284]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_UpdatePicSPS, .-HEVC_UpdatePicSPS
	.align	3
.LC182:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsPicPPSRefresh
	.type	HEVC_IsPicPPSRefresh, %function
HEVC_IsPicPPSRefresh:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x1, [x20, 2408]
	ldr	w0, [x19, 28]
	ldr	w1, [x1, 28]
	cmp	w1, w0
	beq	.L739
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L739:
	ldrb	w0, [x19, 1]
	ldp	x19, x20, [sp, 16]
	cmp	w0, wzr
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsPicPPSRefresh, .-HEVC_IsPicPPSRefresh
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_UpdatePicPPS
	.type	HEVC_UpdatePicPPS, %function
HEVC_UpdatePicPPS:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x2
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	strb	wzr, [x19, 1]
	ldrb	w0, [x19, 13]
	cbz	w0, .L741
	ldrb	w0, [x19, 15]
	cbnz	w0, .L761
	ldr	w0, [x19, 68]
	ldr	w2, [x21, 188]
	sub	w3, w0, #1
	add	x1, x19, x0, sxtw 1
	cmp	w3, wzr
	strh	w2, [x1, 170]
	ble	.L753
	sub	w4, w0, #2
	add	x0, x19, 88
	add	x4, x4, 45
	add	x4, x19, x4, lsl 1
	.p2align 2
.L752:
	ldrsh	w3, [x0]
	add	x0, x0, 2
	strh	w3, [x0, 82]
	cmp	x0, x4
	ldrh	w2, [x1, 170]
	sub	w2, w2, w3
	strh	w2, [x1, 170]
	bne	.L752
.L753:
	ldr	w0, [x19, 72]
	ldr	w1, [x21, 192]
	sub	w2, w0, #1
	add	x3, x19, x0, sxtw 1
	cmp	w2, wzr
	strh	w1, [x3, 210]
	ble	.L748
	sub	w4, w0, #2
	add	x0, x19, 128
	add	x4, x4, 65
	add	x4, x19, x4, lsl 1
	.p2align 2
.L754:
	ldrsh	w2, [x0]
	add	x0, x0, 2
	strh	w2, [x0, 82]
	cmp	x4, x0
	ldrh	w1, [x3, 210]
	sub	w1, w1, w2
	strh	w1, [x3, 210]
	bne	.L754
	b	.L748
	.p2align 3
.L741:
	ldr	w0, [x21, 188]
	strh	w0, [x19, 172]
	ldr	w0, [x21, 192]
	strh	w0, [x19, 212]
.L748:
	ldr	w0, [x20, 164]
	mov	w22, 1888
	ldr	x1, .LC185
	mov	x21, -1888
	ldr	x4, [x20, 2360]
	mov	x2, 1888
	smaddl	x0, w0, w22, x21
	ldr	x3, [x1, 104]
	mov	x1, x19
	add	x0, x4, x0
	blr	x3
	ldr	w0, [x20, 164]
	ldr	x1, [x20, 2360]
	smaddl	x0, w0, w22, x21
	add	x0, x1, x0
	str	x0, [x20, 2408]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L761:
	ldr	w4, [x19, 68]
	add	x1, x19, 172
	mov	w3, 0
	cmp	w4, wzr
	ble	.L747
	.p2align 2
.L756:
	add	w3, w3, 1
	ldr	w5, [x21, 188]
	sub	w0, w3, #1
	cmp	w3, w4
	mul	w2, w3, w5
	mul	w0, w0, w5
	udiv	w2, w2, w4
	udiv	w0, w0, w4
	sub	w0, w2, w0
	strh	w0, [x1], 2
	bne	.L756
.L747:
	ldr	w4, [x19, 72]
	add	x1, x19, 212
	mov	w3, 0
	cmp	w4, wzr
	ble	.L748
	.p2align 2
.L755:
	add	w3, w3, 1
	ldr	w5, [x21, 192]
	sub	w0, w3, #1
	cmp	w3, w4
	mul	w2, w3, w5
	mul	w0, w0, w5
	udiv	w2, w2, w4
	udiv	w0, w0, w4
	sub	w0, w2, w0
	strh	w0, [x1], 2
	bne	.L755
	b	.L748
	.size	HEVC_UpdatePicPPS, .-HEVC_UpdatePicPPS
	.align	3
.LC185:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InitPicInfo
	.type	HEVC_InitPicInfo, %function
HEVC_InitPicInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 4700]
	mov	w3, 1
	ldr	x0, [x19, 2400]
	ldr	w2, [x19, 4684]
	strb	w3, [x19, 3961]
	str	w1, [x19, 3964]
	mov	w1, -1
	str	w2, [x19, 3972]
	str	w1, [x19, 3992]
	ldrsw	x3, [x19, 252]
	ldr	w4, [x0, 64]
	ldr	x1, .LC186
	str	w4, [x19, 3980]
	ldr	x1, [x1, x3, lsl 3]
	ldr	w0, [x0, 68]
	str	w0, [x19, 3984]
	str	wzr, [x19, 3988]
	ldrsb	w0, [x1, 44]
	cmp	w0, 1
	beq	.L772
.L763:
	ldr	x1, [x19, 2432]
	add	x2, x19, 4096
	mov	x3, -1
	add	x0, x19, 4032
	ldr	x4, [x1, 64]
	str	x4, [x19, 4616]
	ldr	x4, [x1, 80]
	str	x4, [x19, 4624]
	ldr	x4, [x1, 96]
	str	x4, [x19, 4632]
	ldr	w4, [x1, 112]
	str	w4, [x19, 4032]
	ldr	w4, [x1, 116]
	str	w4, [x19, 4036]
	ldr	w4, [x1, 120]
	str	w4, [x19, 4040]
	ldr	w4, [x1, 136]
	str	w4, [x19, 4044]
	ldrb	w4, [x1, 56]
	strb	w4, [x2, 568]
	str	x3, [x1, 64]
	ldr	x1, [x19, 2400]
	ldr	w3, [x1, 64]
	str	w3, [x19, 4100]
	ldr	w3, [x1, 68]
	str	w3, [x19, 4104]
	str	wzr, [x19, 4084]
	ldr	w5, [x1, 60]
	ldr	w4, [x1, 2084]
	ldrb	w3, [x2]
	cmp	w5, 1
	bfi	w3, w4, 5, 3
	cset	w4, ne
	bfi	w3, w4, 2, 3
	strb	w3, [x2]
	ldr	w1, [x1, 2068]
	and	w1, w1, 7
	bl	SetAspectRatio
	ldr	x0, [x19, 4024]
	ldr	w1, [x19, 4684]
	str	w1, [x0, 8]
	ldr	x0, [x19, 4024]
	ldr	w1, [x19, 4096]
	str	w1, [x0, 144]
	ldr	x0, [x19, 4024]
	ldr	w1, [x19, 4084]
	str	w1, [x0, 132]
	ldr	x0, [x19, 4024]
	ldr	w1, [x19, 4136]
	str	w1, [x0, 184]
	ldr	x0, [x19, 4024]
	ldr	w1, [x19, 4132]
	str	w1, [x0, 180]
	ldr	x0, [x19, 4024]
	ldr	w1, [x19, 4100]
	str	w1, [x0, 148]
	ldr	x0, [x19, 4024]
	ldr	w1, [x19, 4104]
	str	w1, [x0, 152]
	ldr	x1, [x19, 4024]
	ldr	w0, [x19, 252]
	ldr	w1, [x1, 28]
	bl	FSP_GetDispPhyFs
	cbz	x0, .L766
	ldr	w3, [x19, 4084]
	mov	w1, 0
	ldr	w2, [x0, 4]
	cmp	w3, wzr
	ldr	w0, [x19, 252]
	cset	w3, ne
	bl	FSP_SetStoreType
.L766:
	ldr	x0, [x19, 2400]
	ldr	x4, [x19, 4024]
	ldr	w1, [x0, 72]
	str	w1, [x19, 4252]
	ldr	w3, [x0, 76]
	str	w3, [x19, 4256]
	ldr	w6, [x0, 80]
	str	w6, [x19, 4260]
	ldr	w5, [x0, 84]
	str	w5, [x19, 4264]
	ldr	w2, [x0, 64]
	sub	w1, w2, w1
	sub	w1, w1, w3
	str	w1, [x19, 4108]
	ldr	w3, [x0, 68]
	sub	w2, w3, w6
	sub	w2, w2, w5
	str	w2, [x19, 4112]
	ldr	w2, [x0, 60]
	str	w2, [x19, 4196]
	ldr	w2, [x0, 88]
	str	w2, [x19, 4200]
	ldr	w0, [x0, 96]
	str	w0, [x19, 4204]
	ldr	w0, [x4, 164]
	str	w0, [x19, 4116]
	ldr	w0, [x4, 168]
	str	w0, [x19, 4120]
	str	w1, [x4, 156]
	ldr	x0, [x19, 4024]
	ldr	w1, [x19, 4112]
	str	w1, [x0, 160]
	ldr	x0, [x19, 4024]
	ldr	w1, [x19, 4116]
	str	w1, [x0, 164]
	ldr	x0, [x19, 4024]
	ldr	w1, [x19, 4120]
	str	w1, [x0, 168]
	ldr	x0, [x19, 4024]
	ldr	w1, [x19, 4200]
	str	w1, [x0, 248]
	ldr	x0, [x19, 4024]
	ldr	w1, [x19, 4204]
	str	w1, [x0, 252]
	ldr	w0, [x19, 4692]
	cmp	w0, 2
	add	x0, x19, 24576
	beq	.L767
	ldrb	w1, [x0, 3280]
	and	w1, w1, 1
.L768:
	ldr	x2, [x19, 4024]
	ldrb	w3, [x2, 716]
	bfi	w3, w1, 0, 1
	strb	w3, [x2, 716]
	ldr	x2, [x19, 4024]
	ldrb	w1, [x0, 3280]
	ldrb	w3, [x2, 716]
	ubfx	x1, x1, 1, 4
	bfi	w3, w1, 1, 4
	strb	w3, [x2, 716]
	ldrb	w1, [x0, 3284]
	and	w1, w1, -32
	strb	w1, [x0, 3284]
	str	wzr, [x19, 3976]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L767:
	ldrb	w1, [x0, 3284]
	ldrb	w2, [x0, 3280]
	ubfx	x3, x1, 1, 4
	and	w1, w1, 1
	bfi	w2, w3, 1, 4
	bfi	w2, w1, 0, 1
	strb	w2, [x0, 3280]
	b	.L768
	.p2align 3
.L772:
	mov	x0, 1
	ldr	x1, [x1, 160]
	movk	x0, 0x2, lsl 32
	cmp	x1, x0
	bne	.L763
	add	x0, x19, 8192
	ldrb	w0, [x0, 3648]
	cmp	w0, 1
	bne	.L763
	ldr	x1, [x19, 11872]
	ldr	x0, [x19, 11888]
	cmp	x1, x0
	bls	.L764
	sub	x3, x1, x0
	cmp	x3, 16
	bls	.L764
.L765:
	ldr	w1, [x19, 260]
	sub	w2, w2, w1
	add	x0, x0, x2, sxtw
	str	x0, [x19, 11872]
	b	.L763
	.p2align 3
.L764:
	cmp	x1, x0
	bcs	.L763
	sub	x1, x0, x1
	cmp	x1, 16
	bls	.L763
	b	.L765
	.size	HEVC_InitPicInfo, .-HEVC_InitPicInfo
	.align	3
.LC186:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RepairList
	.type	HEVC_RepairList, %function
HEVC_RepairList:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x26, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x26, 4692]
	cmp	w3, 1
	beq	.L775
	cmp	w3, 2
	beq	.L791
	cbz	w3, .L790
	ldr	x2, .LC187
	mov	w0, 1
	ldr	x1, .LC189
	add	x2, x2, 304
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L778:
	ldr	x0, [x26, 2432]
	ldr	w0, [x0, 24]
	cmp	w0, 2
	bne	.L786
	mov	w0, 1
	str	w0, [x28]
	ldr	x0, [x26, 4024]
	add	x0, x0, 56
	str	x0, [x23, -8]
	.p2align 2
.L786:
	add	w27, w27, 1
	add	x28, x28, 4
	cmp	w27, w22
	add	x23, x23, 136
	bcc	.L788
.L791:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, 0
	ldp	x29, x30, [sp], 112
	ret
.L790:
	mov	w22, 2
.L777:
	ldr	x21, .LC187
	add	x28, x26, 4096
	add	x28, x28, 644
	add	x23, x26, 2464
	add	x0, x21, 304
	mov	w27, 0
	str	x0, [x29, 104]
	.p2align 2
.L788:
	ldr	w1, [x28]
	cbz	w1, .L778
	ldr	x2, [x23, -8]
	cbnz	x2, .L792
	mov	x3, x23
	mov	w0, 0
	b	.L780
	.p2align 3
.L782:
	ldr	x24, [x3], 8
	cbnz	x24, .L797
.L780:
	add	w0, w0, 1
	cmp	w1, w0
	bne	.L782
	mov	w20, -1
.L781:
	ldr	x0, [x26, 2432]
	ldr	w0, [x0, 24]
	cmp	w0, 2
	bne	.L783
	ldr	x24, [x26, 4024]
	add	x24, x24, 56
.L779:
	mov	x0, x2
	uxtw	x25, w27
	mov	w19, 0
	lsl	x21, x25, 4
	cbz	x0, .L798
	.p2align 2
.L784:
	add	w19, w19, 1
	add	x0, x21, x25
	cmp	w1, w19
	add	x0, x0, x19, uxtw
	bls	.L786
	add	x0, x26, x0, lsl 3
	ldr	x0, [x0, 2456]
	cbnz	x0, .L784
.L798:
	ldr	x1, .LC193
	mov	w4, w19
	ldr	x2, [x29, 104]
	mov	w5, w20
	mov	w3, w27
	mov	w0, 1
	bl	dprint_vfmw
	add	x0, x21, x25
	add	x0, x0, x19, uxtw
	add	x0, x26, x0, lsl 3
	str	x24, [x0, 2456]
	ldr	w1, [x28]
	b	.L784
	.p2align 3
.L797:
	sxtb	w20, w0
	cmn	w20, #1
	ccmp	x24, xzr, 4, ne
	bne	.L779
	b	.L781
	.p2align 3
.L792:
	mov	x24, x2
	mov	w20, 0
	b	.L779
.L775:
	mov	w22, w3
	b	.L777
.L783:
	ldr	x2, .LC187
	mov	w3, w27
	ldr	x1, .LC191
	mov	w0, 1
	add	x2, x2, 304
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.size	HEVC_RepairList, .-HEVC_RepairList
	.align	3
.LC187:
	.xword	.LANCHOR0
	.align	3
.LC189:
	.xword	.LC188
	.align	3
.LC191:
	.xword	.LC190
	.align	3
.LC193:
	.xword	.LC192
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InitListX
	.type	HEVC_InitListX, %function
HEVC_InitListX:
	stp	x29, x30, [sp, -320]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L835
	ldr	x20, .LC195
	add	x21, x29, 48
	mov	x2, 272
	mov	w1, 0
	mov	x0, x21
	ldr	x3, [x20, 96]
	blr	x3
	ldr	w0, [x19, 2784]
	cbz	w0, .L836
	sub	w3, w0, #1
	mov	w5, 0
	add	x3, x3, 367
	add	x0, x19, 2928
	add	x3, x19, x3, lsl 3
	b	.L803
	.p2align 3
.L802:
	cmp	x0, x3
	beq	.L801
.L803:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 1]
	cmp	w2, 1
	bne	.L802
	ldr	w2, [x1, 60]
	cbnz	w2, .L802
	ldr	w2, [x1, 64]
	cmp	w2, 1
	bne	.L802
	add	x2, x29, 320
	add	x1, x1, 56
	add	x2, x2, x5, uxtw 3
	cmp	x0, x3
	sub	x2, x2, #4096
	add	w5, w5, 1
	str	x1, [x2, 3824]
	bne	.L803
	.p2align 2
.L801:
	ldr	w0, [x19, 2788]
	cbz	w0, .L837
	sub	w3, w0, #1
	mov	w4, w5
	add	x3, x3, 384
	add	x0, x19, 3064
	add	x3, x19, x3, lsl 3
	b	.L806
	.p2align 3
.L805:
	cmp	x0, x3
	beq	.L864
.L806:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 1]
	cmp	w2, 1
	bne	.L805
	ldr	w2, [x1, 60]
	cbnz	w2, .L805
	ldr	w2, [x1, 64]
	cmp	w2, 1
	bne	.L805
	add	x2, x29, 320
	add	x1, x1, 56
	add	x2, x2, x4, uxtw 3
	cmp	x0, x3
	sub	x2, x2, #4096
	add	w4, w4, 1
	str	x1, [x2, 3824]
	bne	.L806
	.p2align 2
.L864:
	sub	w6, w4, w5
.L804:
	ldr	w0, [x19, 2780]
	sub	w8, w4, #1
	cbz	w0, .L807
	sub	w2, w0, #1
	add	x0, x19, 3200
	add	x2, x2, 401
	add	x2, x19, x2, lsl 3
	b	.L809
	.p2align 3
.L808:
	cmp	x2, x0
	beq	.L865
.L809:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w3, [x1, 1]
	cmp	w3, 1
	bne	.L808
	ldr	w3, [x1, 60]
	cmp	w3, 1
	bne	.L808
	ldr	w7, [x1, 64]
	add	x3, x29, 320
	add	x3, x3, x4, uxtw 3
	add	x1, x1, 56
	sub	x3, x3, #4096
	cbnz	w7, .L808
	str	x1, [x3, 3824]
	cmp	x2, x0
	add	w4, w4, 1
	bne	.L809
	.p2align 2
.L865:
	sub	w0, w4, w5
	sub	w0, w0, w6
.L807:
	cbz	w4, .L866
	ldr	w7, [x19, 4692]
	cbnz	w7, .L867
	cbz	w6, .L815
	add	x3, x21, 136
	add	w9, w6, w5
	mov	w1, w5
	.p2align 2
.L816:
	add	x2, x29, 320
	add	x2, x2, x1, uxtw 3
	add	w1, w1, 1
	sub	x2, x2, #4096
	cmp	w9, w1
	ldr	x2, [x2, 3824]
	str	x2, [x3], 8
	bne	.L816
.L815:
	cbz	w5, .L817
	mov	x1, 0
	.p2align 2
.L818:
	add	w2, w6, w1
	add	x9, x29, 320
	ldr	x3, [x21, x1, lsl 3]
	add	x1, x1, 1
	add	x2, x9, x2, lsl 3
	cmp	w5, w1
	str	x3, [x2, -136]
	bhi	.L818
	add	w6, w6, w5
.L817:
	cbz	w0, .L819
	add	w1, w0, w6
	mov	w2, w6
	.p2align 2
.L820:
	add	w3, w2, 1
	add	x0, x29, 320
	add	x5, x0, x2, uxtw 3
	sub	w0, w3, w6
	add	w0, w0, w8
	mov	w2, w3
	cmp	w1, w3
	add	x3, x29, 320
	add	x0, x3, x0, lsl 3
	sub	x0, x0, #4096
	ldr	x0, [x0, 3824]
	str	x0, [x5, -136]
	bne	.L820
.L819:
	ldr	w5, [x19, 4748]
	ldr	w8, [x19, 4752]
	str	w5, [x19, 4740]
	str	w8, [x19, 4744]
	cbnz	w5, .L813
	.p2align 2
.L833:
	cbz	w8, .L825
	add	x0, x19, 4096
	add	x3, x19, 2592
	add	x2, x0, 1804
	mov	w1, 0
	ldrb	w6, [x0, 1673]
	.p2align 2
.L828:
	cbz	w6, .L826
	ldr	w0, [x2]
.L827:
	add	x7, x29, 320
	add	w1, w1, 1
	add	x0, x7, x0, uxtw 3
	cmp	w1, w8
	add	x2, x2, 4
	ldr	x0, [x0, -136]
	str	x0, [x3], 8
	bne	.L828
	mov	w0, w5
.L824:
	cmp	w0, 16
	bhi	.L838
	.p2align 2
.L830:
	add	x1, x19, x0, uxtw 3
	ldr	x2, [x19, 2456]
	add	w0, w0, 1
	cmp	w0, 16
	str	x2, [x1, 2456]
	bls	.L830
.L838:
	cmp	w8, 16
	mov	w0, w8
	bhi	.L831
	.p2align 2
.L832:
	add	x1, x19, x0, uxtw 3
	ldr	x2, [x19, 2592]
	add	w0, w0, 1
	cmp	w0, 17
	str	x2, [x1, 2592]
	bne	.L832
.L831:
	mov	w0, 0
.L861:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 320
	ret
	.p2align 3
.L867:
	ldr	w5, [x19, 4748]
	ldr	w8, [x19, 4752]
	str	w5, [x19, 4740]
	str	w8, [x19, 4744]
	cbz	w5, .L868
.L813:
	add	x1, x19, 4096
	add	x3, x19, 2456
	add	x2, x1, 1676
	mov	w0, 0
	ldrb	w6, [x1, 1672]
	.p2align 2
.L823:
	cbz	w6, .L821
	ldr	w1, [x2]
.L822:
	add	x9, x29, 320
	add	w0, w0, 1
	add	x1, x9, x1, uxtw 3
	cmp	w0, w5
	sub	x1, x1, #4096
	add	x2, x2, 4
	ldr	x1, [x1, 3824]
	str	x1, [x3], 8
	bne	.L823
	cbnz	w7, .L824
	b	.L833
	.p2align 3
.L821:
	udiv	w1, w0, w4
	msub	w1, w1, w4, w0
	b	.L822
	.p2align 3
.L826:
	udiv	w0, w1, w4
	msub	w0, w0, w4, w1
	b	.L827
	.p2align 3
.L866:
	ldr	x3, [x20, 96]
	mov	x2, 272
	mov	w1, 0
	add	x0, x19, 2456
	str	wzr, [x19, 4740]
	str	wzr, [x19, 4744]
	blr	x3
	ldr	x0, [x19, 2432]
	ldr	w0, [x0, 24]
	cmp	w0, 2
	bne	.L831
	ldr	x1, [x19, 4024]
	mov	w2, 1
	mov	w0, 0
	str	w2, [x19, 4740]
	add	x1, x1, 56
	str	x1, [x19, 2456]
	b	.L861
.L825:
	ldr	x3, [x20, 104]
	mov	x2, 136
	add	x1, x19, 2456
	add	x0, x19, 2592
	blr	x3
	ldr	w8, [x19, 4740]
	str	w8, [x19, 4744]
	mov	w0, w8
	b	.L824
.L836:
	mov	w5, 0
	b	.L801
.L837:
	mov	w4, w5
	mov	w6, 0
	b	.L804
.L868:
	mov	w0, 0
	b	.L830
.L835:
	mov	w0, -1
	b	.L861
	.size	HEVC_InitListX, .-HEVC_InitListX
	.align	3
.LC195:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecList
	.type	HEVC_DecList, %function
HEVC_DecList:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 4692]
	cmp	w0, 2
	beq	.L875
	mov	x0, x19
	bl	HEVC_InitListX
	cbnz	w0, .L876
	mov	x0, x19
	bl	HEVC_RepairList
	mov	w1, 0
	cbnz	w0, .L877
.L871:
	mov	w0, w1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L875:
	str	wzr, [x19, 4740]
	mov	w1, 0
	str	wzr, [x19, 4744]
	mov	w0, w1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L876:
	ldr	x1, .LC197
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, -1
	b	.L871
.L877:
	ldr	x1, .LC199
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, -1
	b	.L871
	.size	HEVC_DecList, .-HEVC_DecList
	.align	3
.LC197:
	.xword	.LC196
	.align	3
.LC199:
	.xword	.LC198
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ArrangeMem
	.type	HEVC_ArrangeMem, %function
HEVC_ArrangeMem:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 2400]
	mov	w1, 8160
	ldr	w20, [x0, 128]
	ldr	w21, [x0, 192]
	ldr	w0, [x0, 188]
	lsl	w21, w21, w20
	sub	w2, w21, #32
	lsl	w20, w0, w20
	sub	w0, w20, #32
	cmp	w2, w1
	ccmp	w0, w1, 2, ls
	bhi	.L879
	ldr	x3, .LC200
	mov	x2, 20
	mov	w1, 0
	add	x0, x29, 56
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x0, [x19, 2432]
	stp	w20, w21, [x29, 60]
	stp	w20, w21, [x29, 68]
	ldr	w0, [x0, 28]
	cmp	w0, 24
	beq	.L888
	ldrsb	w2, [x19, 2768]
	strb	w2, [x29, 57]
.L884:
	ldr	w0, [x19, 252]
	add	x1, x29, 56
	strb	w2, [x29, 59]
	bl	FSP_ConfigInstance
	cbnz	w0, .L889
	ldr	x1, [x19, 2432]
	add	x3, x29, 52
	ldr	w0, [x19, 252]
	ldr	w2, [x1, 20]
	ldr	w1, [x1, 16]
	bl	FSP_ConfigFrameBuf
.L886:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L888:
	mov	w0, 1
	mov	w2, 1
	strb	w0, [x29, 57]
	b	.L884
	.p2align 3
.L879:
	ldr	x2, .LC201
	mov	w4, w21
	ldr	x1, .LC203
	mov	w3, w20
	add	x2, x2, 320
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	mov	w0, -20
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L889:
	ldr	x2, .LC201
	mov	w0, 1
	ldr	x1, .LC205
	add	x2, x2, 320
	bl	dprint_vfmw
	mov	w0, -1
	b	.L886
	.size	HEVC_ArrangeMem, .-HEVC_ArrangeMem
	.align	3
.LC200:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC201:
	.xword	.LANCHOR0
	.align	3
.LC203:
	.xword	.LC202
	.align	3
.LC205:
	.xword	.LC204
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RemoveApcStore
	.type	HEVC_RemoveApcStore, %function
HEVC_RemoveApcStore:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	add	x0, x19, x20, uxtw 3
	ldr	x1, [x0, 2792]
	ldr	w4, [x1, 32]
	cbnz	w4, .L893
	ldr	w0, [x1, 24]
	cmp	w0, 15
	bhi	.L890
	add	x0, x19, x0, uxtw 2
	mov	w2, 16
	str	wzr, [x0, 13264]
	str	wzr, [x0, 13328]
	str	wzr, [x0, 13392]
	ldr	w0, [x1, 20]
	add	x0, x0, 536
	str	wzr, [x19, x0, lsl 2]
	str	w2, [x1, 24]
	ldr	w0, [x19, 13260]
	sub	w0, w0, #1
	str	w0, [x19, 13260]
.L890:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L893:
	ldr	x2, .LC206
	mov	w3, w20
	ldr	x1, .LC208
	mov	w0, 1
	add	x2, x2, 336
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_RemoveApcStore, .-HEVC_RemoveApcStore
	.align	3
.LC206:
	.xword	.LANCHOR0
	.align	3
.LC208:
	.xword	.LC207
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RemoveUnusedApcStore
	.type	HEVC_RemoveUnusedApcStore, %function
HEVC_RemoveUnusedApcStore:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 0
	bl	_mcount
	ldr	w1, [x20, 2772]
	cbnz	w1, .L899
	b	.L894
	.p2align 3
.L896:
	add	w19, w19, 1
	cmp	w1, w19
	bls	.L894
.L899:
	add	x0, x20, x19, sxtw 3
	ldr	x0, [x0, 2792]
	ldrb	w0, [x0, 1]
	cbnz	w0, .L896
	mov	w1, w19
	mov	x0, x20
	add	w19, w19, 1
	bl	HEVC_RemoveApcStore
	ldr	w1, [x20, 2772]
	cmp	w1, w19
	bhi	.L899
.L894:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_RemoveUnusedApcStore, .-HEVC_RemoveUnusedApcStore
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ApplyReferencePictureSet
	.type	HEVC_ApplyReferencePictureSet, %function
HEVC_ApplyReferencePictureSet:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x23, x0
	mov	x0, x30
	mov	w21, 1
	mov	w24, 0
	bl	_mcount
	ldr	w2, [x23, 4708]
	mov	w5, 1888
	ldr	x1, [x23, 2360]
	mov	w4, 12660
	ldr	x0, [x23, 2352]
	ldr	w3, [x23, 2772]
	smaddl	x1, w2, w5, x1
	ldr	w1, [x1, 32]
	smaddl	x0, w1, w4, x0
	ldr	w0, [x0, 116]
	lsl	w0, w21, w0
	cbz	w3, .L901
	add	x19, x23, 4096
	mov	w22, w21
	add	x19, x19, 1508
	sub	w26, w0, #1
	b	.L932
	.p2align 3
.L904:
	add	w24, w24, 1
	cmp	w3, w24
	bls	.L901
.L932:
	add	x25, x23, x24, sxtw 3
	ldr	w0, [x23, 4704]
	ldr	x1, [x25, 2792]
	ldr	w2, [x1, 32]
	cmp	w2, w0
	bne	.L904
	ldp	w3, w0, [x19]
	ldr	w2, [x19, 8]
	add	w0, w3, w0
	cmp	w0, w2
	mov	w20, w0
	bcs	.L942
	ldr	w2, [x1, 8]
	mov	w4, 0
	.p2align 2
.L912:
	add	x0, x23, x20, sxtw 2
	ldr	w3, [x0, 4760]
	cbz	w3, .L907
	ldr	w3, [x1, 60]
	cbz	w3, .L908
	ldr	w3, [x0, 5704]
	cmp	w3, w2
	beq	.L943
.L908:
	cbnz	w4, .L940
	ldrb	w3, [x1, 1]
	mov	w4, w2
	ldr	w0, [x0, 5704]
	cmp	w3, wzr
	ccmp	w4, w0, 0, ne
	beq	.L944
.L923:
	mov	w3, w2
	mov	w4, 0
.L911:
	ldr	w0, [x19, 8]
	add	w20, w20, 1
	mov	w2, w3
	cmp	w0, w20
	bhi	.L912
	ldp	w2, w0, [x19]
	add	w0, w2, w0
.L906:
	ldr	w5, [x23, 4684]
	cbz	w0, .L914
	mov	w20, 0
	.p2align 2
.L916:
	ldr	w0, [x1, 60]
	add	x2, x19, x20, sxtw 2
	add	w20, w20, 1
	cbnz	w0, .L915
	ldr	w0, [x2, 32]
	add	w0, w5, w0
	cmp	w0, w3
	beq	.L945
.L915:
	ldp	w2, w0, [x19]
	add	w0, w2, w0
	cmp	w0, w20
	bhi	.L916
.L914:
	cmp	w4, wzr
	ccmp	w3, w5, 4, eq
	beq	.L941
	strb	wzr, [x1, 1]
	ldr	x0, [x25, 2792]
	str	wzr, [x0, 60]
	ldr	x0, [x25, 2792]
	ldr	w1, [x0, 52]
	cmp	w1, 1
	beq	.L941
	ldr	w1, [x0, 28]
	mov	w2, 0
	ldr	w0, [x23, 252]
	bl	FSP_SetRef
.L941:
	ldr	w3, [x23, 2772]
	add	w24, w24, 1
	cmp	w3, w24
	bhi	.L932
.L901:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L943:
	strb	w22, [x1, 1]
	mov	w2, 1
	ldr	x0, [x25, 2792]
	str	w21, [x0, 48]
	ldr	x0, [x25, 2792]
	ldr	w1, [x0, 28]
	ldr	w0, [x23, 252]
	bl	FSP_SetRef
.L909:
	ldr	x1, [x25, 2792]
	mov	w4, 1
	ldr	w3, [x1, 8]
	b	.L911
	.p2align 3
.L907:
	ldr	w3, [x1, 60]
	cbz	w3, .L910
	ldr	w3, [x0, 5704]
	eor	w3, w2, w3
	tst	w3, w26
	beq	.L946
.L910:
	cbnz	w4, .L940
	ldr	w0, [x0, 5704]
	and	w4, w26, w2
	ldrb	w3, [x1, 1]
	and	w0, w26, w0
	cmp	w3, wzr
	ccmp	w4, w0, 0, ne
	bne	.L923
.L944:
	strb	w22, [x1, 1]
	mov	w2, 1
	ldr	x0, [x25, 2792]
	str	w21, [x0, 60]
	ldr	x0, [x25, 2792]
	str	w21, [x0, 48]
	ldr	x0, [x25, 2792]
	ldr	w1, [x0, 28]
	ldr	w0, [x23, 252]
	bl	FSP_SetRef
	ldr	x1, [x25, 2792]
	mov	w4, 1
	ldr	w3, [x1, 8]
	b	.L911
	.p2align 3
.L946:
	strb	w22, [x1, 1]
	mov	w2, 1
	ldr	x0, [x25, 2792]
	str	w21, [x0, 48]
	ldr	x1, [x25, 2792]
	ldr	w0, [x23, 252]
	ldr	w1, [x1, 28]
	bl	FSP_SetRef
	b	.L909
	.p2align 3
.L940:
	mov	w3, w2
	b	.L911
	.p2align 3
.L945:
	strb	w22, [x1, 1]
	mov	w2, 1
	ldr	x0, [x25, 2792]
	str	w21, [x0, 48]
	ldr	x1, [x25, 2792]
	ldr	w0, [x23, 252]
	ldr	w1, [x1, 28]
	bl	FSP_SetRef
	ldr	x1, [x25, 2792]
	mov	w4, 1
	ldr	w5, [x23, 4684]
	ldr	w3, [x1, 8]
	b	.L915
.L942:
	mov	w4, 0
	ldr	w3, [x1, 8]
	b	.L906
	.size	HEVC_ApplyReferencePictureSet, .-HEVC_ApplyReferencePictureSet
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CheckThatAllRefPicsAreAvailable
	.type	HEVC_CheckThatAllRefPicsAreAvailable, %function
HEVC_CheckThatAllRefPicsAreAvailable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	w0, [x19, 4700]
	sub	w0, w0, #19
	cmp	w0, 2
	bls	.L949
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_CheckThatAllRefPicsAreAvailable.part.8
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L949:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_CheckThatAllRefPicsAreAvailable, .-HEVC_CheckThatAllRefPicsAreAvailable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_SetFrmRepeatCount
	.type	HEVC_SetFrmRepeatCount, %function
HEVC_SetFrmRepeatCount:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, [x19, 2432]
	ldr	w0, [x0, 660]
	add	w0, w0, 2047
	cmp	w0, 4095
	bls	.L951
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_SetFrmRepeatCount.part.9
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L951:
	str	wzr, [x20, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_SetFrmRepeatCount, .-HEVC_SetFrmRepeatCount
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetFreeFrameStoreNum
	.type	HEVC_GetFreeFrameStoreNum, %function
HEVC_GetFreeFrameStoreNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x2, x19, 12288
	add	x5, x19, 24576
	add	x2, x2, 1168
	add	x5, x5, 3280
	mov	w0, 0
	.p2align 2
.L958:
	ldr	w1, [x2, 48]
	cbnz	w1, .L954
	cbz	x2, .L955
	ldr	w4, [x19, 2772]
	cbz	w4, .L955
	ldr	x1, [x19, 2792]
	cmp	x1, x2
	beq	.L954
	sub	w4, w4, #1
	mov	x1, x19
	add	x4, x19, x4, lsl 3
	b	.L956
	.p2align 3
.L957:
	ldr	x3, [x1, 2792]
	cmp	x3, x2
	beq	.L954
.L956:
	cmp	x4, x1
	add	x1, x1, 8
	bne	.L957
.L955:
	add	w0, w0, 1
.L954:
	add	x2, x2, 720
	cmp	x2, x5
	bne	.L958
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_GetFreeFrameStoreNum, .-HEVC_GetFreeFrameStoreNum
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_UpdateReflist
	.type	HEVC_UpdateReflist, %function
HEVC_UpdateReflist:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x20, 5604]
	cbz	w1, .L988
	add	x24, x20, 4096
	mov	w22, 0
	mov	w21, 0
	add	x23, x24, 1508
	mov	w26, 1
	mov	w25, 1
	.p2align 2
.L974:
	uxtw	x0, w21
	add	x1, x23, x0
	ldrb	w1, [x1, 12]
	cbz	w1, .L970
	add	x0, x0, 8
	ldr	w5, [x20, 2772]
	ldr	w4, [x20, 4684]
	ldr	w0, [x23, x0, lsl 2]
	add	w4, w4, w0
	cbz	w5, .L970
	add	x1, x20, 2792
	mov	w0, 0
	b	.L973
	.p2align 3
.L971:
	add	w0, w0, 1
	cmp	w0, w5
	beq	.L970
.L973:
	ldr	x2, [x1]
	add	x1, x1, 8
	ldr	w3, [x2, 8]
	cmp	w4, w3
	bne	.L971
	ldr	w3, [x2, 32]
	ldr	w6, [x20, 4704]
	cmp	w6, w3
	bne	.L971
	add	x19, x20, x0, uxtw 3
	strb	w26, [x2, 1]
	ldr	x0, [x19, 2792]
	ldrb	w1, [x0, 1]
	cbnz	w1, .L1016
.L972:
	str	w25, [x0, 64]
	add	x0, x20, x22, uxtw 3
	add	w22, w22, 1
	ldr	x1, [x19, 2792]
	str	wzr, [x1, 60]
	ldr	x1, [x19, 2792]
	str	x1, [x0, 2928]
	.p2align 2
.L970:
	ldr	w1, [x23]
	add	w21, w21, 1
	cmp	w1, w21
	bhi	.L974
.L969:
	ldr	w0, [x20, 2768]
	str	w22, [x20, 2784]
	cmp	w0, w22
	bls	.L979
	.p2align 2
.L1003:
	add	x2, x20, x22, uxtw 3
	add	w22, w22, 1
	cmp	w22, w0
	str	xzr, [x2, 2928]
	bne	.L1003
.L979:
	add	x23, x24, 1508
	mov	w22, 0
	mov	w26, 1
	mov	w25, 1
	ldr	w24, [x23, 4]
	add	w24, w1, w24
	cmp	w24, w21
	bls	.L977
	.p2align 2
.L1002:
	uxtw	x0, w21
	add	x1, x23, x0
	ldrb	w1, [x1, 12]
	cbz	w1, .L980
	add	x0, x0, 8
	ldr	w5, [x20, 2772]
	ldr	w4, [x20, 4684]
	ldr	w0, [x23, x0, lsl 2]
	add	w4, w4, w0
	cbz	w5, .L980
	add	x1, x20, 2792
	mov	w0, 0
	b	.L983
	.p2align 3
.L981:
	add	w0, w0, 1
	cmp	w0, w5
	beq	.L980
.L983:
	ldr	x2, [x1]
	add	x1, x1, 8
	ldr	w3, [x2, 8]
	cmp	w4, w3
	bne	.L981
	ldr	w3, [x2, 32]
	ldr	w6, [x20, 4704]
	cmp	w6, w3
	bne	.L981
	add	x19, x20, x0, uxtw 3
	strb	w26, [x2, 1]
	ldr	x0, [x19, 2792]
	ldrb	w1, [x0, 1]
	cbnz	w1, .L1017
.L982:
	str	w25, [x0, 64]
	add	x0, x20, x22, uxtw 3
	add	w22, w22, 1
	ldr	x1, [x19, 2792]
	str	wzr, [x1, 60]
	ldr	x1, [x19, 2792]
	str	x1, [x0, 3064]
	.p2align 2
.L980:
	add	w21, w21, 1
	cmp	w24, w21
	bhi	.L1002
	ldr	w0, [x20, 2768]
.L977:
	cmp	w0, w22
	str	w22, [x20, 2788]
	bls	.L968
	.p2align 2
.L1001:
	add	x1, x20, x22, uxtw 3
	add	w22, w22, 1
	cmp	w0, w22
	str	xzr, [x1, 3064]
	bne	.L1001
.L968:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L1016:
	ldr	w1, [x0, 28]
	mov	w2, 1
	ldr	w0, [x20, 252]
	bl	FSP_SetRef
	ldr	x0, [x19, 2792]
	b	.L972
.L1017:
	ldr	w1, [x0, 28]
	mov	w2, 1
	ldr	w0, [x20, 252]
	bl	FSP_SetRef
	ldr	x0, [x19, 2792]
	b	.L982
.L988:
	mov	w22, 0
	mov	w21, 0
	add	x24, x20, 4096
	b	.L969
	.size	HEVC_UpdateReflist, .-HEVC_UpdateReflist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_UpdateLTReflist
	.type	HEVC_UpdateLTReflist, %function
HEVC_UpdateLTReflist:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19, 4708]
	mov	w2, 1888
	ldr	x0, [x19, 2360]
	mov	w5, 12660
	ldr	w6, [x19, 5604]
	add	x1, x19, 4096
	ldr	w9, [x19, 5612]
	add	x1, x1, 1508
	smaddl	x2, w3, w2, x0
	ldr	w0, [x19, 5608]
	sub	w9, w9, #1
	ldr	x4, [x19, 2352]
	mov	w3, 1
	ldr	w2, [x2, 32]
	add	w0, w6, w0
	sub	w0, w0, #1
	cmp	w9, w0
	smaddl	x0, w2, w5, x4
	ldr	w0, [x0, 116]
	lsl	w0, w3, w0
	ble	.L1028
	mov	w10, 0
	mov	x11, x1
	sub	w7, w0, #1
	mov	w13, w3
	mov	w12, w3
	.p2align 2
.L1025:
	sxtw	x0, w9
	add	x1, x11, x0
	ldrb	w1, [x1, 12]
	cbz	w1, .L1020
	add	x0, x19, x0, lsl 2
	ldr	w8, [x19, 2772]
	ldr	w6, [x0, 4760]
	ldr	w5, [x0, 5704]
	uxtb	w6, w6
	and	w0, w5, w7
	cmp	w6, wzr
	csel	w5, w0, w5, eq
	cmp	w8, wzr
	ble	.L1020
	add	x2, x19, 2792
	mov	w1, 0
	b	.L1024
	.p2align 3
.L1023:
	add	w1, w1, 1
	cmp	w1, w8
	beq	.L1020
.L1024:
	ldr	x3, [x2]
	cmp	w6, wzr
	add	x2, x2, 8
	ldr	w0, [x3, 8]
	and	w4, w0, w7
	csel	w0, w4, w0, eq
	cmp	w5, w0
	bne	.L1023
	ldr	w4, [x3, 32]
	ldr	w0, [x19, 4704]
	cmp	w4, w0
	bne	.L1023
	add	x1, x19, x1, sxtw 3
	strb	w13, [x3, 1]
	add	x0, x19, x10, sxtw 3
	add	w10, w10, 1
	ldr	x2, [x1, 2792]
	str	wzr, [x2, 64]
	ldr	x2, [x1, 2792]
	str	w12, [x2, 60]
	ldr	x1, [x1, 2792]
	str	x1, [x0, 3200]
	.p2align 2
.L1020:
	ldp	w1, w0, [x11]
	sub	w9, w9, #1
	add	w0, w1, w0
	sub	w0, w0, #1
	cmp	w0, w9
	blt	.L1025
	mov	w0, w10
.L1019:
	ldr	w1, [x19, 2768]
	str	w0, [x19, 2780]
	cmp	w1, w10
	ble	.L1018
	.p2align 2
.L1031:
	add	x0, x19, x10, sxtw 3
	add	w10, w10, 1
	cmp	w10, w1
	str	xzr, [x0, 3200]
	bne	.L1031
.L1018:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1028:
	mov	w0, 0
	mov	w10, 0
	b	.L1019
	.size	HEVC_UpdateLTReflist, .-HEVC_UpdateLTReflist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetAPC
	.type	HEVC_GetAPC, %function
HEVC_GetAPC:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x23, x1
	mov	x0, x30
	bl	_mcount
	cbz	x23, .L1055
	ldr	w20, [x22, 3968]
	uxtw	x21, w20
	lsl	x0, x21, 2
	sub	x0, x0, x21
	add	x0, x21, x0, lsl 3
	add	x0, x22, x0, lsl 3
	ldr	w2, [x0, 13256]
	cbz	w2, .L1039
	ldr	w0, [x0, 13264]
	cbz	w0, .L1056
	mov	w0, 200
	mov	x1, 13268
	mov	w19, 0
	umaddl	x0, w20, w0, x1
	add	x0, x22, x0
	b	.L1042
	.p2align 3
.L1045:
	ldr	w1, [x0], 4
	cbz	w1, .L1040
.L1042:
	add	w19, w19, 1
	cmp	w19, w2
	bne	.L1045
.L1039:
	ldr	x1, .LC218
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
.L1052:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L1056:
	mov	w19, 0
	.p2align 2
.L1040:
	ldr	w0, [x22, 252]
	ldr	w1, [x23, 28]
	bl	FSP_GetLogicFs
	cbz	x0, .L1043
	ldr	x1, [x0, 32]
	cbz	x1, .L1043
	uxtw	x3, w19
	mov	w4, 50
	mov	w2, 1
	lsl	x1, x21, 2
	umaddl	x20, w20, w4, x3
	sub	x1, x1, x21
	mov	w3, w19
	add	x20, x22, x20, lsl 2
	add	x21, x21, x1, lsl 3
	ldr	x1, .LC214
	add	x22, x22, x21, lsl 3
	str	w2, [x20, 13264]
	ldr	x0, [x0, 32]
	ldr	w0, [x0, 4]
	str	w0, [x20, 13328]
	ldr	w0, [x23, 8]
	str	w0, [x20, 13392]
	mov	w0, 13
	ldr	w2, [x22, 13260]
	add	w2, w2, 1
	str	w2, [x22, 13260]
	ldr	w2, [x23, 228]
	bl	dprint_vfmw
	str	w19, [x23, 24]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L1043:
	ldrb	w4, [x23, 1]
	mov	x5, x0
	ldr	x1, .LC216
	mov	x6, 0
	ldr	w3, [x23, 8]
	mov	w0, 0
	ldr	w2, [x23, 28]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1052
.L1055:
	ldr	x2, .LC210
	mov	w3, 11694
	ldr	x1, .LC212
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1052
	.size	HEVC_GetAPC, .-HEVC_GetAPC
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CheckFrameStore
	.type	HEVC_CheckFrameStore, %function
HEVC_CheckFrameStore:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1067
	ldr	w1, [x19, 28]
	ldr	w0, [x20, 252]
	bl	FSP_GetLogicFs
	cbz	x0, .L1059
	ldrsb	w4, [x0, 1]
	cmp	w4, 3
	ccmp	w4, wzr, 4, ne
	beq	.L1079
	ldr	w0, [x19, 52]
	cmp	w0, 1
	beq	.L1064
	ldr	w4, [x19, 48]
	ldrb	w5, [x19]
	cbz	w4, .L1063
	cmp	w5, 1
	mov	w0, 0
	beq	.L1063
.L1073:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1079:
	ldr	x2, .LC219
	mov	w0, 13
	ldr	x1, .LC221
	ldr	w3, [x19, 28]
	add	x2, x2, 360
	bl	dprint_vfmw
.L1061:
	ldr	w0, [x19, 52]
	cmp	w0, 1
	bne	.L1080
.L1064:
	mov	w1, 1
	mov	w0, 2
	strb	w1, [x19, 2]
	str	w0, [x19, 52]
	mov	w0, -3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1059:
	ldr	x1, .LC223
	mov	x2, x19
	ldr	w3, [x19, 8]
	mov	w0, 1
	ldr	w5, [x19, 28]
	ldr	w4, [x19, 52]
	bl	dprint_vfmw
	b	.L1061
.L1080:
	ldr	x2, .LC219
	mov	w0, 1
	ldr	x1, .LC225
	ldr	w3, [x19, 8]
	add	x2, x2, 360
	bl	dprint_vfmw
	mov	w0, -3
	b	.L1073
	.p2align 3
.L1063:
	ldr	x2, .LC219
	mov	x3, x19
	ldr	x1, .LC227
	mov	w0, 1
	add	x2, x2, 360
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1073
	.p2align 3
.L1067:
	mov	w0, -1
	b	.L1073
	.size	HEVC_CheckFrameStore, .-HEVC_CheckFrameStore
	.align	3
.LC219:
	.xword	.LANCHOR0
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetImagePara
	.type	HEVC_GetImagePara, %function
HEVC_GetImagePara:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x21, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w23, [x21, 12]
	ldr	x0, [x21, 664]
	cmn	x0, #1
	beq	.L1083
	ldr	w1, [x20, 2772]
	cbz	w1, .L1083
	mov	w25, -1
	mov	x24, -2
	mov	w19, 0
	b	.L1086
	.p2align 3
.L1121:
	ldr	x0, [x22, 2792]
	ldr	w1, [x20, 2772]
	ldr	x0, [x0, 664]
	cmp	x0, x24
	bcs	.L1085
	mov	w25, w19
	mov	x24, x0
.L1085:
	add	w19, w19, 1
	cmp	w1, w19
	bls	.L1123
.L1086:
	add	x22, x20, x19, sxtw 3
	ldr	x0, [x22, 2792]
	cbz	x0, .L1085
	ldr	w1, [x0, 28]
	ldr	w0, [x20, 252]
	bl	FSP_GetLogicFs
	cbz	x0, .L1122
	ldrsb	w0, [x0, 1]
	cmp	w0, 3
	ccmp	w0, wzr, 4, ne
	bne	.L1121
.L1122:
	ldr	w1, [x20, 2772]
	add	w19, w19, 1
	cmp	w1, w19
	bhi	.L1086
.L1123:
	cmn	w25, #1
	beq	.L1083
	ldr	x1, [x21, 664]
	cmp	x1, x24
	bhi	.L1124
.L1083:
	ldrb	w0, [x21, 145]
	ldrb	w1, [x21, 144]
	and	w0, w0, -64
	strb	w0, [x21, 145]
	and	w1, w1, -4
	strb	w1, [x21, 144]
	ldr	w2, [x20, 144]
	str	w2, [x21, 188]
	ldr	x2, [x20, 2392]
	ldrh	w2, [x2, 124]
	cmp	w2, 1
	beq	.L1094
	cmp	w2, 257
	bne	.L1095
	ldr	w2, [x20, 3348]
	cmp	w2, 1
	cset	w4, ne
.L1087:
	ldr	x3, [x20, 2400]
	mov	w2, 3
	ldrb	w3, [x3, 2066]
	cbz	w3, .L1088
	ldr	w3, [x21, 40]
	mov	w2, 1
	cmp	w3, w2
	ccmp	w3, 11, 4, ne
	cset	w4, eq
	cbz	w4, .L1125
.L1089:
	ldr	w3, [x21, 44]
	cmp	w3, wzr
	cset	w4, eq
.L1088:
	mov	w3, 2
	ldrb	w6, [x21, 3]
	bfi	w0, w3, 4, 2
	ldrb	w3, [x21, 146]
	bfi	w0, w2, 2, 2
	ldrb	w5, [x21, 4]
	ldr	w2, [x21, 48]
	bfi	w0, w4, 0, 2
	bfi	w1, w23, 0, 2
	bfi	w3, w6, 1, 1
	strb	w0, [x21, 145]
	strb	w1, [x21, 144]
	strb	w3, [x21, 146]
	str	w5, [x21, 200]
	cbz	w2, .L1090
	ldr	w0, [x21, 16]
	str	w0, [x21, 232]
.L1090:
	ldr	x0, [x20, 2432]
	ldr	w1, [x21, 28]
	ldr	w0, [x0, 644]
	str	w0, [x21, 204]
	ldr	x0, [x20, 2432]
	ldr	w0, [x0, 648]
	str	w0, [x21, 208]
	ldr	x0, [x20, 2432]
	ldr	w0, [x0, 652]
	str	w0, [x21, 212]
	ldr	w0, [x20, 252]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L1081
	ldr	x3, .LC230
	mov	x2, 640
	add	x1, x21, 80
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 16
	str	w0, [x19, 296]
	mov	w0, 4
	mov	w1, 1
	ldr	w2, [x21, 56]
	strb	w1, [x19, 291]
	cmp	w2, wzr
	strb	w1, [x19, 289]
	csel	w0, w0, wzr, ne
	strb	w0, [x19, 284]
	ldr	w0, [x21, 68]
	str	w0, [x19, 236]
.L1081:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1124:
	ldr	w0, [x20, 252]
	mov	x2, x24
	bl	IsPtsRewind
	cbnz	w0, .L1083
	ldr	x1, .LC229
	mov	x3, x24
	ldr	x2, [x21, 664]
	mov	w0, 29
	add	x25, x20, x25, sxtw 3
	bl	dprint_vfmw
	ldr	x0, [x25, 2792]
	ldr	x1, [x21, 664]
	str	x1, [x0, 664]
	str	x24, [x21, 664]
	b	.L1083
	.p2align 3
.L1125:
	mov	w4, 2
	and	w3, w3, -9
	mov	w2, 3
	cmp	w3, w4
	csel	w2, w2, w4, ne
	b	.L1089
	.p2align 3
.L1094:
	mov	w4, 0
	b	.L1087
	.p2align 3
.L1095:
	mov	w4, 1
	b	.L1087
	.size	HEVC_GetImagePara, .-HEVC_GetImagePara
	.align	3
.LC229:
	.xword	.LC228
	.align	3
.LC230:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CheckOutputImage
	.type	HEVC_CheckOutputImage, %function
HEVC_CheckOutputImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	uxtw	x19, w1
	bl	_mcount
	cmp	w19, 19
	bhi	.L1128
	lsl	x0, x19, 2
	sub	x0, x0, x19
	lsl	x2, x0, 4
	sub	x0, x2, x0
	add	x0, x20, x0, lsl 4
	add	x0, x0, 12288
	ldrb	w0, [x0, 1169]
	cmp	w0, wzr
	cset	w0, ne
.L1127:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1128:
	mov	w0, -1
	b	.L1127
	.size	HEVC_CheckOutputImage, .-HEVC_CheckOutputImage
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DECRecycleImage
	.type	HEVC_DECRecycleImage, %function
HEVC_DECRecycleImage:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w22, w1
	bl	_mcount
	ldr	w0, [x21, 252]
	mov	w1, w22
	bl	FSP_GetLogicFs
	cbz	x0, .L1134
	ldrsb	w1, [x0, 1]
	add	x19, x0, 592
	add	x20, x0, 624
	cbz	w1, .L1140
.L1137:
	ldr	x2, [x19]
	mov	x1, x2
	cbz	x2, .L1132
	ldr	w0, [x21, 252]
	bl	FreeUsdByDec
	str	xzr, [x19]
.L1132:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L1137
	ldr	w0, [x21, 252]
	mov	w2, 0
	mov	w1, w22
	bl	FSP_SetDisplay
	mov	w0, 0
.L1130:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1140:
	ldr	x1, .LC232
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1130
.L1134:
	mov	w0, -1
	b	.L1130
	.size	HEVC_DECRecycleImage, .-HEVC_DECRecycleImage
	.align	3
.LC232:
	.xword	.LC231
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetSLHDR1MasteringDisplayInfo
	.type	HEVC_GetSLHDR1MasteringDisplayInfo, %function
HEVC_GetSLHDR1MasteringDisplayInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	add	x1, x19, 568
	mov	w2, 14999
	ldr	w0, [x1, 4]
	cmp	w0, w2
	bhi	.L1145
	sub	w2, w0, #8192
	mov	w3, 4749
	sub	w2, w2, #308
	cmp	w2, w3
	bhi	.L1144
	mov	w0, 1
	strb	w0, [x20, 3]
	b	.L1143
	.p2align 3
.L1144:
	sub	w0, w0, #12288
	sub	w0, w0, #962
	cmp	w0, 1749
	bls	.L1148
.L1145:
	strb	wzr, [x20, 3]
.L1143:
	ldr	w2, [x1, 36]
	mov	w0, 56963
	movk	w0, 0x431b, lsl 16
	mov	w3, 10000
	add	w2, w2, 249856
	mov	w5, 2063
	add	w2, w2, 144
	movk	w5, 0x5f6, lsl 16
	mov	w4, w3
	umull	x2, w2, w0
	lsr	x2, x2, 32
	lsr	w2, w2, 17
	lsl	w0, w2, 3
	sub	w0, w0, w2
	add	w2, w2, w0, lsl 3
	sub	w0, w2, w0
	cmp	w0, w3
	csel	w0, w0, w3, ls
	strh	w0, [x20, 4]
	ldr	w0, [x1, 40]
	cmp	w0, w5
	bhi	.L1146
	mov	w1, 5977
	movk	w1, 0xd1b7, lsl 16
	umull	x0, w0, w1
	ubfx	x4, x0, 45, 16
.L1146:
	strh	w4, [x20, 6]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1148:
	mov	w0, 2
	strb	w0, [x20, 3]
	b	.L1143
	.size	HEVC_GetSLHDR1MasteringDisplayInfo, .-HEVC_GetSLHDR1MasteringDisplayInfo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_PrintSLHDR1Info
	.type	HEVC_PrintSLHDR1Info, %function
HEVC_PrintSLHDR1Info:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w2, [x21]
	mov	w0, 32
	ldr	x1, .LC234
	bl	dprint_vfmw
	ldrb	w2, [x21, 1]
	mov	w0, 32
	ldr	x1, .LC236
	bl	dprint_vfmw
	ldrb	w2, [x21, 2]
	mov	w0, 32
	ldr	x1, .LC238
	bl	dprint_vfmw
	ldrb	w2, [x21, 3]
	mov	w0, 32
	ldr	x1, .LC240
	bl	dprint_vfmw
	ldrh	w2, [x21, 4]
	mov	w0, 32
	ldr	x1, .LC242
	bl	dprint_vfmw
	ldrh	w2, [x21, 6]
	mov	w0, 32
	ldr	x1, .LC244
	bl	dprint_vfmw
	ldrb	w2, [x21, 8]
	mov	w0, 32
	ldr	x1, .LC246
	bl	dprint_vfmw
	ldrb	w2, [x21, 9]
	mov	w0, 32
	ldr	x1, .LC248
	bl	dprint_vfmw
	ldrb	w0, [x21, 1]
	ldrb	w2, [x21, 10]
	cbnz	w0, .L1150
	ldr	x1, .LC250
	add	x19, x21, 10
	mov	w0, 32
	bl	dprint_vfmw
	ldrb	w2, [x19, 1]
	mov	w0, 32
	ldr	x1, .LC252
	bl	dprint_vfmw
	ldrb	w2, [x19, 2]
	mov	w0, 32
	ldr	x1, .LC254
	bl	dprint_vfmw
	ldrb	w2, [x19, 3]
	mov	w0, 32
	ldr	x1, .LC256
	bl	dprint_vfmw
	ldrb	w2, [x19, 4]
	mov	w0, 32
	ldr	x1, .LC258
	bl	dprint_vfmw
	ldrb	w2, [x19, 5]
	mov	w0, 32
	ldr	x1, .LC260
	bl	dprint_vfmw
	ldrb	w0, [x19, 5]
	cbz	w0, .L1155
	ldr	x23, .LC264
	mov	w20, 0
	ldr	x22, .LC266
	.p2align 2
.L1154:
	add	x21, x19, x20, uxtw
	mov	w3, w20
	mov	x1, x23
	mov	w0, 32
	ldrb	w2, [x21, 6]
	bl	dprint_vfmw
	ldrb	w2, [x21, 17]
	mov	w3, w20
	mov	x1, x22
	mov	w0, 32
	add	w20, w20, 1
	bl	dprint_vfmw
	ldrb	w0, [x19, 5]
	cmp	w0, w20
	bhi	.L1154
.L1155:
	ldrb	w2, [x19, 28]
	mov	w0, 32
	ldr	x1, .LC262
	bl	dprint_vfmw
	ldrb	w0, [x19, 28]
	cbz	w0, .L1156
	ldr	x23, .LC268
	mov	w20, 0
	ldr	x22, .LC270
	.p2align 2
.L1157:
	add	x21, x19, x20, uxtw
	mov	w3, w20
	mov	x1, x23
	mov	w0, 32
	ldrb	w2, [x21, 29]
	bl	dprint_vfmw
	ldrb	w2, [x21, 36]
	mov	w3, w20
	mov	x1, x22
	mov	w0, 32
	add	w20, w20, 1
	bl	dprint_vfmw
	ldrb	w0, [x19, 28]
	cmp	w0, w20
	bhi	.L1157
.L1156:
	ldr	x1, .LC288
	mov	x2, 290
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1150:
	ldr	x1, .LC272
	mov	w0, 32
	bl	dprint_vfmw
	ldrb	w0, [x21, 10]
	cbz	w0, .L1168
	ldr	x24, .LC276
	mov	w20, 0
	ldr	x23, .LC278
	add	x19, x21, 10
	.p2align 2
.L1161:
	add	x22, x21, x20, uxtw 1
	mov	w2, w20
	mov	x1, x24
	mov	w0, 32
	ldrh	w3, [x22, 12]
	bl	dprint_vfmw
	ldrh	w3, [x22, 80]
	mov	w2, w20
	mov	x1, x23
	mov	w0, 32
	add	w20, w20, 1
	bl	dprint_vfmw
	ldrb	w0, [x19]
	cmp	w0, w20
	bhi	.L1161
.L1162:
	ldrb	w2, [x19, 138]
	mov	w0, 32
	ldr	x1, .LC274
	bl	dprint_vfmw
	ldrb	w0, [x19, 138]
	cbz	w0, .L1160
	ldr	x24, .LC284
	mov	w20, 0
	ldr	x23, .LC286
	.p2align 2
.L1163:
	add	x22, x21, x20, uxtw 1
	mov	w3, w20
	mov	x1, x24
	mov	w0, 32
	ldrh	w2, [x22, 150]
	bl	dprint_vfmw
	ldrh	w2, [x22, 218]
	mov	w3, w20
	mov	x1, x23
	mov	w0, 32
	add	w20, w20, 1
	bl	dprint_vfmw
	ldrb	w0, [x19, 138]
	cmp	w0, w20
	bhi	.L1163
.L1160:
	ldrh	w2, [x19, 276]
	mov	w0, 32
	ldr	x1, .LC280
	bl	dprint_vfmw
	ldrh	w2, [x19, 278]
	mov	w0, 32
	ldr	x1, .LC282
	bl	dprint_vfmw
	b	.L1156
.L1168:
	add	x19, x21, 10
	b	.L1162
	.size	HEVC_PrintSLHDR1Info, .-HEVC_PrintSLHDR1Info
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetSLHDR1Info
	.type	HEVC_GetSLHDR1Info, %function
HEVC_GetSLHDR1Info:
	stp	x29, x30, [sp, -352]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x2
	mov	x21, x1
	bl	_mcount
	mov	x2, 290
	mov	w1, 0
	add	x0, x29, 56
	bl	memset
	ldrb	w3, [x21, 1]
	ldrb	w4, [x19, 56]
	ldrb	w5, [x19, 568]
	cbz	w3, .L1209
	cbnz	w4, .L1212
.L1209:
	ldrb	w6, [x19, 59]
	ldrb	w7, [x19, 128]
.L1171:
	ldr	x2, .LC289
	mov	w0, 22
	ldr	x1, .LC291
	add	x2, x2, 384
	bl	dprint_vfmw
	strb	wzr, [x20, 466]
.L1169:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 352
	ret
	.p2align 3
.L1212:
	cbz	w5, .L1209
	ldrb	w0, [x19, 59]
	cbnz	w0, .L1174
	ldrb	w7, [x19, 128]
	cbz	w7, .L1213
.L1174:
	mov	w0, 1
	strb	w0, [x20, 466]
	ldr	w1, [x21, 24]
	ldrb	w3, [x19, 57]
	ldrb	w2, [x19, 58]
	cmp	w1, 9
	strb	w3, [x29, 56]
	strb	w2, [x29, 57]
	beq	.L1214
.L1176:
	ldrb	w0, [x19, 60]
	cmp	w0, 1
	beq	.L1177
	ldrb	w1, [x19, 129]
	cmp	w1, 1
	beq	.L1177
	cmp	w1, 9
	ccmp	w0, 9, 4, ne
	beq	.L1215
	ldrb	w0, [x29, 64]
	strb	w0, [x29, 58]
.L1177:
	mov	x1, x19
	add	x0, x29, 56
	bl	HEVC_GetSLHDR1MasteringDisplayInfo
	ldrb	w1, [x29, 64]
	ldrb	w0, [x29, 58]
	cmp	w1, w0
	beq	.L1216
	strb	wzr, [x29, 65]
.L1180:
	ldrb	w0, [x29, 57]
	cbnz	w0, .L1181
	add	x5, x19, 59
	ldrb	w6, [x5, 2]
	ldrb	w4, [x5, 3]
	ldrb	w3, [x5, 4]
	ldrb	w2, [x5, 5]
	ldrb	w1, [x5, 6]
	ldrb	w0, [x5, 7]
	strb	w6, [x29, 66]
	strb	w4, [x29, 67]
	strb	w3, [x29, 68]
	strb	w2, [x29, 69]
	strb	w1, [x29, 70]
	strb	w0, [x29, 71]
	cbz	w0, .L1186
	sub	w4, w0, #1
	add	x2, x29, 56
	add	x4, x4, 17
	add	x0, x29, 72
	add	x1, x19, 82
	add	x4, x2, x4
	.p2align 2
.L1185:
	ldrb	w3, [x1, -15]
	add	x0, x0, 1
	ldrb	w2, [x1], 1
	strb	w3, [x0, -1]
	strb	w2, [x0, 10]
	cmp	x0, x4
	bne	.L1185
.L1186:
	ldrb	w0, [x5, 38]
	strb	w0, [x29, 94]
	cbz	w0, .L1184
	sub	w3, w0, #1
	add	x1, x29, 56
	add	x3, x3, 40
	add	x0, x29, 95
	add	x19, x19, 113
	add	x3, x1, x3
	.p2align 2
.L1189:
	ldrb	w2, [x19, -15]
	add	x0, x0, 1
	ldrb	w1, [x19], 1
	strb	w2, [x0, -1]
	strb	w1, [x0, 6]
	cmp	x0, x3
	bne	.L1189
.L1184:
	ldr	w0, [x20, 472]
	cbnz	w0, .L1217
	ldr	x2, .LC289
	mov	w0, 1
	ldr	x1, .LC293
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L1169
	.p2align 3
.L1181:
	add	x5, x19, 128
	ldrb	w0, [x5, 40]
	add	w0, w0, 1
	ldp	w2, w1, [x5, 8]
	uxtb	w0, w0
	strh	w2, [x29, 342]
	strb	w0, [x29, 66]
	strh	w1, [x29, 344]
	cbz	w0, .L1193
	sub	w2, w0, #1
	add	x1, x29, 68
	add	x2, x2, 87
	add	x0, x19, 172
	add	x2, x19, x2, lsl 1
	.p2align 2
.L1192:
	ldrh	w4, [x0]
	add	x0, x0, 2
	ldrh	w3, [x0, 196]
	cmp	x0, x2
	strh	w4, [x1]
	add	x1, x1, 2
	strh	w3, [x1, 66]
	bne	.L1192
.L1193:
	ldrb	w0, [x5, 41]
	add	w0, w0, 1
	uxtb	w0, w0
	strb	w0, [x29, 204]
	cbz	w0, .L1184
	sub	w2, w0, #1
	add	x1, x29, 206
	add	x2, x2, 120
	add	x0, x19, 238
	add	x19, x19, x2, lsl 1
	.p2align 2
.L1194:
	ldrh	w3, [x0]
	add	x0, x0, 2
	ldrh	w2, [x0, 196]
	cmp	x0, x19
	strh	w3, [x1]
	add	x1, x1, 2
	strh	w2, [x1, 66]
	bne	.L1194
	b	.L1184
	.p2align 3
.L1217:
	ldr	x3, .LC294
	mov	x2, 290
	ldr	x0, [x20, 480]
	add	x1, x29, 56
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 290
	str	w0, [x20, 468]
	b	.L1169
	.p2align 3
.L1213:
	mov	w6, 0
	b	.L1171
	.p2align 3
.L1215:
	mov	w0, 1
	strb	w0, [x29, 58]
	b	.L1177
	.p2align 3
.L1216:
	ldrb	w0, [x29, 59]
	strb	w0, [x29, 65]
	b	.L1180
	.p2align 3
.L1214:
	ldr	w1, [x21, 32]
	cmp	w1, 9
	bne	.L1176
	strb	w0, [x29, 64]
	b	.L1176
	.size	HEVC_GetSLHDR1Info, .-HEVC_GetSLHDR1Info
	.align	3
.LC289:
	.xword	.LANCHOR0
	.align	3
.LC291:
	.xword	.LC290
	.align	3
.LC293:
	.xword	.LC292
	.align	3
.LC294:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ConvertHDRInfo
	.type	HEVC_ConvertHDRInfo, %function
HEVC_ConvertHDRInfo:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	mov	x19, x2
	bl	_mcount
	add	x3, x21, 464
	add	x0, x19, 572
	ldrb	w1, [x20]
	add	x2, x21, 496
	add	x4, x19, 584
	strb	w1, [x3, 24]
	ldr	w1, [x20, 24]
	strb	w1, [x3, 25]
	ldr	w1, [x20, 32]
	strb	w1, [x3, 26]
	ldr	w1, [x20, 28]
	str	w1, [x3, 28]
	ldrb	w1, [x19, 568]
	strb	w1, [x21, 464]
.L1219:
	ldr	w1, [x0]
	add	x0, x0, 4
	strh	w1, [x2]
	add	x2, x2, 2
	cmp	x0, x4
	ldr	w1, [x0, 8]
	strh	w1, [x2, 4]
	bne	.L1219
	ldr	w0, [x19, 596]
	mov	x2, x19
	strh	w0, [x3, 44]
	mov	x1, x20
	mov	x0, x21
	ldr	w4, [x19, 600]
	strh	w4, [x3, 46]
	ldr	w4, [x19, 604]
	str	w4, [x3, 48]
	ldr	w4, [x19, 608]
	str	w4, [x3, 52]
	ldrb	w4, [x19, 612]
	strb	w4, [x3, 1]
	ldrh	w4, [x19, 614]
	str	w4, [x3, 56]
	ldrh	w4, [x19, 616]
	str	w4, [x3, 60]
	ldrb	w4, [x19, 618]
	strb	w4, [x3, 64]
	bl	HEVC_GetSLHDR1Info
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_ConvertHDRInfo, .-HEVC_ConvertHDRInfo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_AllocFrameStore
	.type	HEVC_AllocFrameStore, %function
HEVC_AllocFrameStore:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 12288
	bl	_mcount
	add	x19, x19, 1168
	ldr	w1, [x20, 4708]
	mov	w5, 1888
	ldr	x0, [x20, 2360]
	mov	w4, 12660
	ldr	x2, [x20, 2352]
	mov	x3, 0
	smaddl	x0, w1, w5, x0
	ldr	w21, [x0, 32]
	strb	wzr, [x20, 3961]
	smaddl	x21, w21, w4, x2
	.p2align 2
.L1227:
	ldr	w0, [x19, 48]
	cbnz	w0, .L1222
	cbz	x19, .L1223
	ldr	w2, [x20, 2772]
	cbz	w2, .L1223
	ldr	x0, [x20, 2792]
	cmp	x0, x19
	beq	.L1222
	sub	w2, w2, #1
	mov	x0, x20
	add	x2, x20, x2, lsl 3
	b	.L1225
	.p2align 3
.L1226:
	ldr	x1, [x0, 2792]
	cmp	x1, x19
	beq	.L1222
.L1225:
	cmp	x0, x2
	add	x0, x0, 8
	bne	.L1226
.L1223:
	lsl	x22, x3, 2
	mov	w0, 101
	sub	x3, x22, x3
	str	w0, [x20, 4000]
	lsl	x0, x3, 4
	mov	w1, 1
	sub	x22, x0, x3
	add	x23, x20, 4032
	strb	w1, [x20, 3961]
	mov	x2, 640
	add	x22, x20, x22, lsl 4
	mov	x0, x23
	add	x24, x22, 12288
	add	x1, x24, 1248
	bl	memcpy
	str	x19, [x20, 4024]
	str	wzr, [x20, 4184]
	str	wzr, [x22, 13472]
	strb	wzr, [x24, 1170]
	strb	wzr, [x19]
	ldr	x0, [x20, 4024]
	str	wzr, [x0, 60]
	ldr	x0, [x20, 4024]
	str	wzr, [x0, 64]
	ldr	x0, [x20, 4024]
	str	wzr, [x0, 52]
	ldrb	w1, [x20, 3961]
	cmp	w1, 1
	bne	.L1231
	ldr	w0, [x20, 252]
	bl	FSP_NewLogicFs
	mov	w24, w0
	mov	w1, w0
	ldr	w0, [x20, 252]
	bl	FSP_GetLogicFs
	mov	x22, x0
	cmp	w24, wzr
	ccmp	x0, xzr, 4, ge
	beq	.L1229
	add	x2, x20, 3336
	add	x1, x21, 2064
	add	x19, x0, 48
	bl	HEVC_ConvertHDRInfo
	ldr	x0, [x20, 2432]
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L1244
.L1230:
	ldr	x21, .LC297
	mov	x2, 640
	ldr	x0, [x20, 4024]
	mov	x1, x19
	ldr	x3, [x21, 104]
	add	x0, x0, 80
	blr	x3
	ldr	x1, [x20, 4024]
	mov	x2, 640
	ldr	x3, [x21, 104]
	mov	x0, x23
	add	x1, x1, 80
	blr	x3
	ldr	x1, [x20, 4024]
	mov	w0, 0
	str	w24, [x1, 28]
	ldrsb	w1, [x22, 4]
	str	w1, [x20, 3996]
.L1242:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1222:
	add	w3, w3, 1
	add	x19, x19, 720
	cmp	w3, 20
	bne	.L1227
.L1231:
	ldr	x1, .LC296
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L1244:
	ldr	x2, [x20, 2400]
	ldr	w21, [x19, 112]
	ldr	w1, [x19, 36]
	ldr	w0, [x2, 68]
	ldr	w2, [x2, 64]
	stp	w2, w0, [x19, 68]
	mul	w21, w0, w21
	stp	wzr, wzr, [x19, 240]
	add	w0, w21, w1
	str	wzr, [x19, 256]
	stp	wzr, wzr, [x19, 248]
	str	w0, [x19, 40]
	bl	MEM_Phy2Vir
	str	x0, [x19, 512]
	ldr	w1, [x19, 20]
	ldr	w2, [x19, 116]
	add	w0, w21, w1
	str	w0, [x19, 24]
	add	w0, w2, w0
	str	w0, [x19, 32]
	b	.L1230
.L1229:
	ldr	x1, .LC299
	mov	w0, 0
	strb	wzr, [x20, 3961]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1242
	.size	HEVC_AllocFrameStore, .-HEVC_AllocFrameStore
	.align	3
.LC296:
	.xword	.LC295
	.align	3
.LC297:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC299:
	.xword	.LC298
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsVoFinish
	.type	HEVC_IsVoFinish, %function
HEVC_IsVoFinish:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 0
	bl	_mcount
	ldr	w0, [x20, 252]
	bl	FSP_GetFspType
	cmn	w0, #1
	mov	w21, w0
	bne	.L1251
	b	.L1253
	.p2align 3
.L1248:
	ldrsb	w0, [x0, 1]
	cmp	w0, 3
	beq	.L1250
	cmp	w19, 32
	beq	.L1254
.L1251:
	ldr	w0, [x20, 252]
	mov	w1, w19
	add	w19, w19, 1
	bl	FSP_GetLogicFs
	cbnz	x0, .L1248
	ldr	x1, .LC303
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1253:
	ldr	x1, .LC301
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w21
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1250:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1254:
	mov	w0, 1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_IsVoFinish, .-HEVC_IsVoFinish
	.align	3
.LC301:
	.xword	.LC300
	.align	3
.LC303:
	.xword	.LC302
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetBackPicFromVOQueue
	.type	HEVC_GetBackPicFromVOQueue, %function
HEVC_GetBackPicFromVOQueue:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x20, x22, 12288
	add	x23, x22, 24576
	bl	_mcount
	add	x20, x20, 1169
	add	x0, x22, 4096
	add	x23, x23, 3281
	add	x0, x0, 1936
	bl	ResetVoQueue
	.p2align 2
.L1258:
	strb	wzr, [x20]
	add	x19, x20, 623
	add	x21, x20, 655
	str	wzr, [x20, 47]
.L1257:
	ldr	x0, [x19]
	mov	x1, x0
	cbz	x0, .L1256
	ldr	w0, [x22, 252]
	bl	FreeUsdByDec
	str	xzr, [x19]
.L1256:
	add	x19, x19, 8
	cmp	x19, x21
	bne	.L1257
	add	x20, x20, 720
	cmp	x20, x23
	bne	.L1258
	ldr	w0, [x22, 184]
	cbz	w0, .L1255
	sub	w1, w0, #1
	add	x0, x22, 2144
	add	x1, x1, 537
	add	x22, x22, x1, lsl 2
	.p2align 2
.L1260:
	str	wzr, [x0], 4
	cmp	x0, x22
	bne	.L1260
.L1255:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	HEVC_GetBackPicFromVOQueue, .-HEVC_GetBackPicFromVOQueue
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RemoveFrameStoreOutDPB
	.type	HEVC_RemoveFrameStoreOutDPB, %function
HEVC_RemoveFrameStoreOutDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	uxtw	x21, w1
	mov	x20, x0
	mov	x0, x30
	mov	x19, x21
	add	x22, x20, x21, lsl 3
	bl	_mcount
	ldr	x0, [x22, 2792]
	str	wzr, [x0, 48]
	ldr	x1, [x22, 2792]
	ldr	w0, [x20, 252]
	ldr	w1, [x1, 28]
	bl	FSP_GetLogicFs
	cbz	x0, .L1269
	ldrsb	w0, [x0, 1]
	cmp	w0, 3
	beq	.L1270
	ldr	x1, [x22, 2792]
	mov	w2, 0
	ldr	w0, [x20, 252]
	ldr	w1, [x1, 28]
	bl	FSP_SetDisplay
.L1270:
	ldr	x1, [x22, 2792]
	mov	w2, 0
	ldr	w0, [x20, 252]
	ldr	w1, [x1, 28]
	bl	FSP_SetRef
.L1269:
	ldr	w2, [x20, 2772]
	sub	w2, w2, #1
	cmp	w19, w2
	bhi	.L1273
	.p2align 2
.L1279:
	add	w0, w19, 1
	add	x1, x20, x21, lsl 3
	mov	w19, w0
	cmp	w0, w2
	mov	x21, x0
	add	x0, x20, x0, lsl 3
	ldr	x0, [x0, 2792]
	str	x0, [x1, 2792]
	bls	.L1279
.L1273:
	add	x0, x20, x2, uxtw 3
	str	xzr, [x0, 2792]
	str	w2, [x20, 2772]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_RemoveFrameStoreOutDPB, .-HEVC_RemoveFrameStoreOutDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RemoveDummyFrame
	.type	HEVC_RemoveDummyFrame, %function
HEVC_RemoveDummyFrame:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w21, 0
	mov	w19, 0
	bl	_mcount
	ldr	w2, [x20, 2772]
	cbnz	w2, .L1290
	b	.L1283
	.p2align 3
.L1285:
	add	w19, w19, 1
	cmp	w2, w19
	mov	w21, w19
	bls	.L1283
.L1290:
	add	x0, x20, x19, sxtw 3
	ldr	x0, [x0, 2792]
	ldrb	w1, [x0]
	cbz	w1, .L1285
	mov	w1, w21
	strb	wzr, [x0]
	mov	x0, x20
	sub	w19, w19, #1
	add	w19, w19, 1
	bl	HEVC_RemoveApcStore
	mov	w1, w21
	mov	x0, x20
	mov	w21, w19
	bl	HEVC_RemoveFrameStoreOutDPB
	ldr	w2, [x20, 2772]
	cmp	w2, w19
	bhi	.L1290
.L1283:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_RemoveDummyFrame, .-HEVC_RemoveDummyFrame
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RemoveUnUsedFrameStore
	.type	HEVC_RemoveUnUsedFrameStore, %function
HEVC_RemoveUnUsedFrameStore:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	mov	w25, 0
	bl	_mcount
	ldr	w22, [x21, 2772]
	cbz	w22, .L1294
	mov	w26, 0
	mov	w20, 0
	mov	w24, -1
	mov	w23, 1
	.p2align 2
.L1301:
	add	x19, x21, x26, uxtw 3
	ldr	w0, [x21, 252]
	ldr	x1, [x19, 2792]
	ldr	w1, [x1, 28]
	bl	FSP_GetLogicFs
	cbz	x0, .L1295
	ldrsb	w1, [x0]
	cbnz	w1, .L1310
	ldrsb	w0, [x0, 1]
	cmp	w0, wzr
	ccmp	w0, 3, 4, ne
	ldr	x0, [x19, 2792]
	bne	.L1297
.L1313:
	ldr	w1, [x0, 52]
	cmp	w1, 1
	beq	.L1297
	str	w24, [x0, 28]
	ldr	x0, [x19, 2792]
	strb	wzr, [x0, 1]
	ldr	x0, [x19, 2792]
	strb	w23, [x0, 2]
.L1310:
	ldr	x0, [x19, 2792]
.L1297:
	ldr	w0, [x0]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L1314
	add	w26, w26, 1
.L1300:
	add	w20, w20, 1
	cmp	w22, w20
	bne	.L1301
.L1294:
	mov	w0, w25
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1295:
	ldr	x0, [x19, 2792]
	b	.L1313
	.p2align 3
.L1314:
	mov	w1, w26
	mov	x0, x21
	mov	w25, 1
	bl	HEVC_RemoveFrameStoreOutDPB
	b	.L1300
	.size	HEVC_RemoveUnUsedFrameStore, .-HEVC_RemoveUnUsedFrameStore
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_SimpleSlideDPB
	.type	HEVC_SimpleSlideDPB, %function
HEVC_SimpleSlideDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 13256]
	ldr	w1, [x19, 13260]
	cmp	w1, w0
	bcs	.L1319
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2772]
	cmp	w1, w0
	bcc	.L1315
	cmp	w0, 15
	bls	.L1321
.L1319:
	ldr	x0, [x19, 2792]
	mov	w2, 0
	strb	wzr, [x0, 1]
	ldr	w1, [x0, 28]
	ldr	w0, [x19, 252]
	bl	FSP_SetRef
	mov	x0, x19
	mov	w1, 0
	bl	HEVC_RemoveApcStore
	mov	w1, 0
	mov	x0, x19
	bl	HEVC_RemoveFrameStoreOutDPB
.L1315:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1321:
	mov	x0, x19
	bl	HEVC_IncreaseDPBSize
	cbnz	w0, .L1319
	b	.L1315
	.size	HEVC_SimpleSlideDPB, .-HEVC_SimpleSlideDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetMinPOC
	.type	HEVC_GetMinPOC, %function
HEVC_GetMinPOC:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x2
	mov	x19, x0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	str	wzr, [x21]
	mov	w0, 2147483647
	str	w0, [x20]
	ldr	w3, [x19, 2768]
	ldr	w2, [x19, 2772]
	cmp	w2, w3
	bhi	.L1330
.L1323:
	mov	w0, 0
	cbz	w2, .L1322
	.p2align 2
.L1328:
	add	x1, x19, x0, uxtw 3
	ldr	w2, [x20]
	ldr	x1, [x1, 2792]
	ldr	w1, [x1, 8]
	cmp	w2, w1
	ble	.L1325
	str	w1, [x20]
	str	w0, [x21]
.L1325:
	ldr	w1, [x19, 2772]
	add	w0, w0, 1
	cmp	w1, w0
	bhi	.L1328
.L1322:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1330:
	ldr	x1, .LC305
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w2, [x19, 2768]
	str	w2, [x19, 2772]
	b	.L1323
	.size	HEVC_GetMinPOC, .-HEVC_GetMinPOC
	.align	3
.LC305:
	.xword	.LC304
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetReRangeFlag
	.type	HEVC_GetReRangeFlag, %function
HEVC_GetReRangeFlag:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w21, w1
	mov	w20, w4
	mov	w22, w2
	bl	_mcount
	ldr	w5, [x19, 4708]
	mov	w3, 1888
	ldr	x2, [x19, 2360]
	mov	w1, 12660
	ldr	x0, [x19, 2352]
	smaddl	x3, w5, w3, x2
	ldr	w3, [x3, 32]
	smaddl	x0, w3, w1, x0
	ldr	w1, [x0, 64]
	cmp	w1, w21
	ccmp	w20, wzr, 0, eq
	bne	.L1333
	ldr	w1, [x0, 68]
	mov	w0, 1
	cmp	w1, w22
	beq	.L1337
.L1332:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1333:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1337:
	ldr	w1, [x19, 172]
	cbz	w1, .L1332
	ldr	x0, [x19, 2432]
	ldr	w0, [x0, 1008]
	cmp	w0, wzr
	cset	w0, ne
	b	.L1332
	.size	HEVC_GetReRangeFlag, .-HEVC_GetReRangeFlag
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CalcStreamBits
	.type	HEVC_CalcStreamBits, %function
HEVC_CalcStreamBits:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x5, [x19, 2376]
	ldr	x0, [x19, 2336]
	ldrb	w4, [x5]
	ldr	w6, [x0, 32]
	cbz	w4, .L1349
	sub	w2, w4, #1
	mov	w7, 32
	mov	x3, 80
	add	x0, x5, 48
	mov	w1, 0
	umaddl	x3, w2, w7, x3
	add	x3, x5, x3
	.p2align 2
.L1340:
	ldr	w2, [x0], 32
	cmp	x0, x3
	add	w1, w1, w2
	bne	.L1340
.L1339:
	sbfiz	x4, x4, 5, 32
	and	w0, w6, 7
	add	x4, x5, x4
	str	w0, [x4, 60]
	ldr	x3, [x19, 2376]
	ldr	x0, [x19, 2336]
	ldrb	w2, [x3]
	ldr	w0, [x0, 32]
	add	x4, x3, x2, lsl 5
	ldr	w3, [x4, 52]
	add	w0, w3, w0, lsr 3
	sub	w0, w0, w1
	str	w0, [x4, 64]
	ldr	x3, [x19, 2376]
	ldr	x0, [x19, 2336]
	ldrb	w2, [x3]
	ldr	w0, [x0, 32]
	add	x4, x3, x2, lsl 5
	ldr	w2, [x4, 48]
	add	w1, w1, w2
	lsl	w1, w1, 3
	sub	w0, w1, w0
	str	w0, [x4, 56]
	ldr	x1, [x19, 2376]
	ldrb	w0, [x1]
	add	x0, x1, x0, lsl 5
	ldp	w2, w1, [x0, 60]
	ubfiz	w1, w1, 3, 2
	add	w1, w1, w2
	str	w1, [x0, 60]
	ldr	x1, [x19, 2376]
	ldrb	w0, [x1]
	add	x0, x1, x0, lsl 5
	ldr	w1, [x0, 64]
	and	w1, w1, -4
	str	w1, [x0, 64]
	ldr	x3, [x19, 2376]
	ldr	w2, [x3, 8]
	sub	w1, w2, #1
	cmp	w1, 1
	bhi	.L1357
	ldrb	w0, [x3]
	add	w4, w0, 1
	cmp	w4, 1
	ccmp	w2, w4, 0, ls
	bls	.L1343
	add	w2, w0, 2
	.p2align 2
.L1344:
	sub	w0, w2, #1
	cmp	w2, 1
	lsl	x1, x0, 5
	add	x0, x0, 1
	add	x3, x3, x1
	lsl	x0, x0, 5
	cset	w5, ls
	str	wzr, [x3, 60]
	ldr	x3, [x19, 2376]
	add	x4, x3, x0
	add	x3, x3, x1
	ldr	w4, [x4, 20]
	str	w4, [x3, 64]
	ldr	x3, [x19, 2376]
	add	x0, x3, x0
	add	x3, x3, x1
	ldr	w0, [x0, 16]
	lsl	w0, w0, 3
	str	w0, [x3, 56]
	ldr	x0, [x19, 2376]
	add	x0, x0, x1
	ldp	w4, w3, [x0, 60]
	ubfiz	w3, w3, 3, 4
	add	w3, w3, w4
	str	w3, [x0, 60]
	ldr	x0, [x19, 2376]
	add	x1, x0, x1
	ldr	w0, [x1, 64]
	and	w0, w0, -16
	str	w0, [x1, 64]
	ldr	x3, [x19, 2376]
	ldr	w0, [x3, 8]
	cmp	w0, w2
	add	w2, w2, 1
	cset	w1, hi
	tst	w5, w1
	bne	.L1344
	sub	w1, w0, #1
.L1343:
	ubfiz	x0, x1, 5, 32
	ldr	w1, [x3, 12]
	add	x3, x3, x0
	ldr	w0, [x3, 56]
	sub	w0, w0, w1
	str	w0, [x3, 56]
	ldr	x3, [x19, 2376]
	ldrb	w0, [x3]
	ldr	w4, [x3, 8]
	cmp	w0, w4
	bcs	.L1338
	.p2align 2
.L1352:
	ubfiz	x1, x0, 5, 32
	ldr	w2, [x19, 3992]
	add	x1, x3, x1
	add	w0, w0, 1
	ldr	w1, [x1, 64]
	cmp	w1, w2
	bcs	.L1346
	str	w1, [x19, 3992]
	ldr	w4, [x3, 8]
.L1346:
	cmp	w4, w0
	bhi	.L1352
.L1338:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1357:
	ldr	x1, .LC307
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1349:
	mov	w1, 0
	b	.L1339
	.size	HEVC_CalcStreamBits, .-HEVC_CalcStreamBits
	.align	3
.LC307:
	.xword	.LC306
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_VpsSpsPpsCheck
	.type	HEVC_VpsSpsPpsCheck, %function
HEVC_VpsSpsPpsCheck:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 164]
	ldr	w2, [x19, 4708]
	cmp	w2, w0
	bge	.L1366
	mov	w0, 1888
	ldr	x1, [x19, 2360]
	smull	x0, w2, w0
	add	x3, x1, x0
	ldrb	w0, [x1, x0]
	cbz	w0, .L1367
	ldr	w2, [x3, 32]
	ldr	w0, [x19, 160]
	cmp	w2, w0
	bge	.L1368
	ldr	x1, [x19, 2352]
	mov	w0, 12660
	smaddl	x0, w2, w0, x1
	ldrb	w1, [x0, 1]
	cbz	w1, .L1369
	ldr	w2, [x0, 48]
	ldr	w0, [x19, 156]
	cmp	w2, w0
	bcs	.L1370
	uxtw	x1, w2
	ldr	x3, [x19, 2344]
	lsl	x4, x1, 7
	mov	w0, 0
	add	x1, x4, x1, lsl 2
	ldrb	w1, [x3, x1]
	cbz	w1, .L1371
.L1360:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1366:
	ldr	x1, .LC309
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1360
	.p2align 3
.L1367:
	ldr	x1, .LC311
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1360
	.p2align 3
.L1368:
	ldr	x1, .LC313
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1360
	.p2align 3
.L1369:
	ldr	x1, .LC315
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1360
	.p2align 3
.L1370:
	ldr	x1, .LC317
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1360
	.p2align 3
.L1371:
	ldr	x1, .LC319
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1360
	.size	HEVC_VpsSpsPpsCheck, .-HEVC_VpsSpsPpsCheck
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
	.align	3
.LC317:
	.xword	.LC316
	.align	3
.LC319:
	.xword	.LC318
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsNewPic
	.type	HEVC_IsNewPic, %function
HEVC_IsNewPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w2, [x19, 4704]
	mov	w0, 2147483647
	ldr	x3, [x19, 2376]
	add	x8, x19, x2, lsl 2
	ldr	w5, [x8, 228]
	cmp	w5, w0
	beq	.L1407
	ldr	w1, [x3, 16]
	sub	w0, w1, #16
	cmp	w0, 2
	ccmp	w1, 21, 4, hi
	beq	.L1378
.L1388:
	cmp	w1, 1
	bls	.L1408
.L1377:
	sub	w1, w1, #19
	cmp	w1, 1
	bhi	.L1378
	mov	w5, -2147483647
	str	w5, [x8, 228]
	.p2align 2
.L1378:
	ldr	w4, [x19, 4684]
	cmp	w4, w5
	bge	.L1380
.L1413:
	ldr	w6, [x3, 16]
	sub	w0, w6, #8
	cmp	w0, 1
	bls	.L1409
.L1381:
	add	x0, x19, x2
	ldrb	w0, [x0, 10]
	cbz	w0, .L1382
	ldr	w6, [x8, 232]
	cmp	w6, w4
	bgt	.L1410
.L1382:
	add	x0, x19, 4096
	ldrb	w1, [x0, 577]
	cbnz	w1, .L1383
	ldr	w1, [x3, 16]
	sub	w3, w1, #19
	cmp	w3, 1
	bls	.L1404
	cmp	w1, 21
	beq	.L1404
	sub	w1, w1, #16
	cmp	w1, 2
	bhi	.L1383
	add	x2, x19, x2
	str	w4, [x8, 232]
	mov	w1, 1
	strb	w1, [x2, 10]
	.p2align 2
.L1383:
	ldr	w1, [x19, 236]
	ldrb	w2, [x0, 576]
	cbnz	w1, .L1386
	ldr	w1, [x19, 4708]
	mov	w0, 1
	ldr	w3, [x19, 304]
	cmp	w3, w1
	beq	.L1411
.L1399:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1407:
	ldr	w1, [x3, 16]
	mov	w4, 0
	sub	w6, w1, #16
	cmp	w6, 5
	cset	w0, ls
	cmp	w1, 1
	bls	.L1412
.L1374:
	orr	w4, w4, w0
	mov	w0, 2
	cbz	w4, .L1399
	cmp	w6, 2
	ccmp	w1, 21, 4, hi
	bne	.L1388
.L1389:
	ldr	w4, [x19, 4684]
	str	w4, [x8, 228]
	ldr	w0, [x3, 16]
	cmp	w0, 1
	bhi	.L1380
	mov	w0, 1
	str	w0, [x19, 332]
	.p2align 2
.L1380:
	add	x0, x19, x2
	ldrb	w5, [x0, 5]
	cbz	w5, .L1381
	ldr	w6, [x3, 16]
	sub	w0, w6, #8
	cmp	w0, 1
	bhi	.L1381
	ldr	x2, .LC320
	mov	w3, 13102
	ldr	x1, .LC324
	mov	w0, 1
	add	x2, x2, 408
	bl	dprint_vfmw
	mov	w0, 2
	b	.L1399
	.p2align 3
.L1386:
	ldr	w0, [x19, 208]
	ldr	w1, [x19, 4708]
	ldr	w3, [x19, 304]
	cmp	w1, w0
	mov	w0, 1
	csinc	w2, w2, wzr, eq
	cmp	w3, w1
	bne	.L1399
.L1411:
	ldr	w0, [x19, 260]
	ldr	x19, [sp, 16]
	cmp	w0, w4
	csinc	w0, w2, wzr, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1410:
	ldr	w7, [x3, 16]
	sub	w1, w7, #8
	cmp	w1, 1
	bhi	.L1382
	ldr	x2, .LC320
	mov	w5, w4
	ldr	x1, .LC326
	mov	w4, w0
	mov	w3, 13111
	add	x2, x2, 408
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 2
	b	.L1399
	.p2align 3
.L1404:
	add	x2, x19, x2
	str	w4, [x8, 232]
	strb	wzr, [x2, 10]
	b	.L1383
	.p2align 3
.L1408:
	ldr	w0, [x19, 4692]
	cmp	w0, 2
	bne	.L1377
	mov	w0, 2147483647
	cmp	w5, w0
	beq	.L1389
	ldr	w4, [x19, 4684]
	cmp	w4, w5
	blt	.L1413
	b	.L1380
	.p2align 3
.L1409:
	ldr	x2, .LC320
	mov	w3, 13095
	ldr	x1, .LC322
	mov	w0, 1
	add	x2, x2, 408
	bl	dprint_vfmw
	mov	w0, 2
	b	.L1399
	.p2align 3
.L1412:
	ldr	w4, [x19, 4692]
	cmp	w4, 2
	cset	w4, eq
	b	.L1374
	.size	HEVC_IsNewPic, .-HEVC_IsNewPic
	.align	3
.LC320:
	.xword	.LANCHOR0
	.align	3
.LC322:
	.xword	.LC321
	.align	3
.LC324:
	.xword	.LC323
	.align	3
.LC326:
	.xword	.LC325
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ReadByteAlignment
	.type	HEVC_ReadByteAlignment, %function
HEVC_ReadByteAlignment:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	cbz	w0, .L1419
	ldr	x0, [x19, 2336]
	mov	w20, 0
	bl	BsBitsToNextByte
	mov	w1, w0
	cbz	w0, .L1416
	ldr	x0, [x19, 2336]
	bl	BsGet
	mov	w2, w0
	ldr	x1, .LC330
	mov	w0, 19
	bl	dprint_vfmw
.L1416:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1419:
	ldr	x1, .LC328
	mov	w0, 1
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1416
	.size	HEVC_ReadByteAlignment, .-HEVC_ReadByteAlignment
	.align	3
.LC328:
	.xword	.LC327
	.align	3
.LC330:
	.xword	.LC329
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetRapPicFlag
	.type	HEVC_GetRapPicFlag, %function
HEVC_GetRapPicFlag:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 4700]
	ldr	x19, [sp, 16]
	sub	w0, w0, #16
	cmp	w0, 5
	cset	w0, ls
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_GetRapPicFlag, .-HEVC_GetRapPicFlag
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetIdrPicFlag
	.type	HEVC_GetIdrPicFlag, %function
HEVC_GetIdrPicFlag:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 4700]
	ldr	x19, [sp, 16]
	sub	w0, w0, #19
	cmp	w0, 1
	cset	w0, ls
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_GetIdrPicFlag, .-HEVC_GetIdrPicFlag
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecPTL
	.type	HEVC_DecPTL, %function
HEVC_DecPTL:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	w24, w2
	mov	x22, x1
	mov	w23, w3
	bl	_mcount
	ldr	x0, [x20, 2336]
	cbnz	w24, .L1460
.L1458:
	mov	w1, 8
	bl	BsGet
	str	w0, [x22, 4]
	cmp	w23, wzr
	ble	.L1428
	mov	w19, 0
	.p2align 2
.L1429:
	sub	x1, x29, #3968
	ldr	x0, [x20, 2336]
	add	x21, x1, x19, sxtw
	mov	w1, 1
	add	w19, w19, w1
	bl	BsGet
	strb	w0, [x21, 4056]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x21, 4048]
	cmp	w23, w19
	ccmp	w19, 5, 0, gt
	ble	.L1429
	cmp	w23, 7
	mov	w19, w23
	ble	.L1447
	b	.L1439
	.p2align 3
.L1432:
	cmp	w19, 8
	beq	.L1439
.L1447:
	ldr	x0, [x20, 2336]
	mov	w1, 2
	add	w19, w19, 1
	bl	BsGet
	cbz	w0, .L1432
	ldr	x1, .LC332
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, -1
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L1428:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	mov	w0, 0
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L1439:
	mov	w21, 0
	b	.L1437
	.p2align 3
.L1436:
	add	w21, w21, 1
	cmp	w23, w21
	ccmp	w21, 5, 0, gt
	bgt	.L1428
.L1437:
	sxtw	x22, w21
	cbz	w24, .L1434
	sub	x0, x29, #3968
	add	x0, x0, x22
	ldrb	w0, [x0, 4056]
	cbnz	w0, .L1461
.L1434:
	sub	x0, x29, #3968
	add	x22, x0, x22
	ldrb	w0, [x22, 4048]
	cbz	w0, .L1436
	ldr	x0, [x20, 2336]
	mov	w1, 8
	bl	BsGet
	b	.L1436
	.p2align 3
.L1461:
	ldr	x0, [x20, 2336]
	mov	w1, 2
	mov	w19, 32
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 5
	bl	BsGet
	.p2align 2
.L1435:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	subs	w19, w19, #1
	bne	.L1435
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 12
	bl	BsGet
	b	.L1434
.L1460:
	mov	w1, 2
	add	x19, x29, 96
	add	x21, x29, 128
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 5
	bl	BsGet
	mov	w25, w0
	.p2align 2
.L1424:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19], 1
	cmp	x21, x19
	bne	.L1424
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x22]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x22, 1]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	sub	w0, w25, #4
	cmp	w0, 3
	bls	.L1425
	ldrb	w0, [x29, 100]
	cbnz	w0, .L1425
	ldrb	w0, [x29, 101]
	cbnz	w0, .L1425
	ldrb	w0, [x29, 102]
	cbnz	w0, .L1425
	ldrb	w0, [x29, 103]
	cbnz	w0, .L1425
	ldr	x0, [x20, 2336]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 11
	bl	BsGet
	b	.L1427
	.p2align 3
.L1425:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 2
	bl	BsGet
.L1427:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	str	w25, [x20, 308]
	ldrb	w2, [x29, 97]
	ldrb	w1, [x29, 98]
	ldr	x0, [x20, 2336]
	str	w2, [x20, 312]
	str	w1, [x20, 316]
	b	.L1458
	.size	HEVC_DecPTL, .-HEVC_DecPTL
	.align	3
.LC332:
	.xword	.LC331
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_SetDefaultScalingList
	.type	HEVC_SetDefaultScalingList, %function
HEVC_SetDefaultScalingList:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	add	x26, x20, 2224
	mov	w25, 0
	bl	_mcount
	ldr	x21, .LC334
	ldr	x22, .LC333
	mov	w23, 16
	ldr	x24, .LC335
.L1463:
	ldr	w0, [x26]
	cbz	w0, .L1472
	uxtw	x0, w25
	mov	w27, 0
	lsl	x28, x0, 2
	sub	x28, x28, x0
	lsl	x28, x28, 1
	.p2align 2
.L1469:
	uxtw	x19, w27
	add	x1, x21, 424
	add	x0, x19, x28
	cmp	w25, 3
	mov	x2, 64
	cbz	w25, .L1476
	add	x0, x20, x0, lsl 6
	beq	.L1477
	cmp	w27, 3
	ldr	x4, [x24, 104]
	add	x0, x0, 608
	csel	x1, x22, x1, cc
	blr	x4
.L1465:
	add	x19, x28, x19
	add	w27, w27, 1
	add	x19, x19, 560
	str	w23, [x20, x19, lsl 2]
	ldr	w0, [x26]
	cmp	w0, w27
	bhi	.L1469
.L1472:
	add	w25, w25, 1
	add	x26, x26, 4
	cmp	w25, 4
	bne	.L1463
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L1476:
	add	x0, x20, x19, lsl 6
	ldr	x1, .LC336
	ldr	x4, [x24, 104]
	mov	x2, 16
	add	x0, x0, 608
	blr	x4
	b	.L1465
.L1477:
	ldr	x0, .LC334
	uxtw	x19, w27
	cmp	w27, wzr
	ldr	x4, [x24, 104]
	add	x1, x0, 424
	ldr	x0, .LC333
	mov	x2, 64
	csel	x1, x0, x1, eq
	add	x0, x20, x19, lsl 6
	add	x0, x0, 1760
	blr	x4
	b	.L1465
	.size	HEVC_SetDefaultScalingList, .-HEVC_SetDefaultScalingList
	.align	3
.LC333:
	.xword	.LANCHOR2
	.align	3
.LC334:
	.xword	.LANCHOR0
	.align	3
.LC335:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC336:
	.xword	.LANCHOR0+488
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_SetScalingList
	.type	HEVC_SetScalingList, %function
HEVC_SetScalingList:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 2400]
	ldrb	w1, [x0, 3]
	cbz	w1, .L1498
	ldr	x20, [x19, 2408]
	add	x20, x20, 256
	ldrb	w1, [x20, -235]
	cbz	w1, .L1506
.L1481:
	cbz	x20, .L1482
	ldr	x21, .LC337
	mov	x2, 1536
	mov	w1, 0
	add	x0, x19, 608
	ldr	x3, [x21, 96]
	blr	x3
	add	x16, x20, 1
	add	x15, x19, 336
	mov	w12, 0
	mov	w17, 64
	mov	w14, 6
.L1484:
	ldr	w13, [x15, 1888]
	cbz	w13, .L1493
	ldr	w8, [x15]
	mov	x9, x16
	mov	w11, 0
	cmp	w8, 64
	csel	w8, w8, w17, ls
	lsr	w10, w8, 2
.L1491:
	uxtw	x7, w11
	mov	w4, 0
	umaddl	x7, w12, w14, x7
	lsl	x7, x7, 4
	.p2align 2
.L1485:
	cmp	w10, w4
	bls	.L1488
	cbz	w8, .L1485
	add	x0, x7, x4, uxtw
	ldrb	w1, [x9, -1]
	mov	x6, x9
	mov	w3, 0
	add	x0, x19, x0, lsl 2
	ldr	w2, [x0, 608]
	orr	w1, w2, w1
	str	w1, [x0, 608]
	.p2align 2
.L1494:
	add	w3, w3, 1
	add	x0, x7, x4, uxtw
	cmp	w3, w8
	and	w5, w3, 3
	add	x0, x19, x0, lsl 2
	lsl	w1, w5, 3
	beq	.L1485
	ldrb	w2, [x6], 1
	cmp	w5, 3
	ldr	w5, [x0, 608]
	csinc	w4, w4, w4, ne
	lsl	w1, w2, w1
	orr	w1, w5, w1
	str	w1, [x0, 608]
	b	.L1494
.L1506:
	ldrb	w1, [x0, 4]
	cbnz	w1, .L1507
.L1482:
	mov	x0, x19
	bl	HEVC_SetDefaultScalingList
.L1498:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1488:
	add	w11, w11, 1
	add	x9, x9, 64
	cmp	w11, w13
	bne	.L1491
.L1493:
	add	w12, w12, 1
	add	x16, x16, 384
	cmp	w12, 4
	add	x15, x15, 4
	bne	.L1484
	ldr	x3, [x21, 104]
	add	x1, x20, 1536
	mov	x2, 96
	add	x0, x19, 2240
	blr	x3
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L1507:
	add	x20, x0, 432
	b	.L1481
	.size	HEVC_SetScalingList, .-HEVC_SetScalingList
	.align	3
.LC337:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CalScalingList
	.type	HEVC_CalScalingList, %function
HEVC_CalScalingList:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w2
	uxtw	x22, w3
	mov	x21, x1
	bl	_mcount
	add	x0, x20, x19, uxtw 2
	mov	w9, 6
	mov	w8, 64
	mov	w5, 0
	umaddl	x9, w19, w9, x22
	ldr	w0, [x0, 336]
	lsl	x9, x9, 4
	cmp	w0, w8
	csel	w8, w0, w8, ls
	lsr	w10, w8, 2
	.p2align 2
.L1509:
	cmp	w5, w10
	bcs	.L1508
	cbz	w8, .L1509
	add	x0, x9, x5, uxtw
	mov	x7, x21
	mov	w4, 0
	add	x0, x20, x0, lsl 2
	ldrb	w2, [x7], 1
	ldr	w3, [x0, 608]
	orr	w2, w3, w2
	str	w2, [x0, 608]
	.p2align 2
.L1515:
	add	w4, w4, 1
	add	x0, x9, x5, uxtw
	cmp	w8, w4
	and	w6, w4, 3
	add	x0, x20, x0, lsl 2
	lsl	w2, w6, 3
	beq	.L1509
	ldrb	w3, [x7], 1
	cmp	w6, 3
	ldr	w6, [x0, 608]
	csinc	w5, w5, w5, ne
	lsl	w2, w3, w2
	orr	w2, w6, w2
	str	w2, [x0, 608]
	b	.L1515
.L1508:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_CalScalingList, .-HEVC_CalScalingList
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetScalingListDefaultAddress
	.type	HEVC_GetScalingListDefaultAddress, %function
HEVC_GetScalingListDefaultAddress:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 3
	bls	.L1529
	ldr	x1, .LC341
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1529:
	ldr	x0, .LC339
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx1519
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1519:
	.section	.rodata
	.align	0
	.align	2
.L1519:
	.byte	(.L1523 - .Lrtx1519) / 4
	.byte	(.L1521 - .Lrtx1519) / 4
	.byte	(.L1521 - .Lrtx1519) / 4
	.byte	(.L1522 - .Lrtx1519) / 4
	.text
	.p2align 3
.L1521:
	cmp	w20, 2
	ldr	x0, .LC338
	bhi	.L1526
.L1527:
	add	x0, x0, 144
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1522:
	ldr	x0, .LC338
	cbz	w20, .L1527
.L1526:
	add	x0, x0, 80
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1523:
	ldr	x0, .LC338
	ldp	x19, x20, [sp, 16]
	add	x0, x0, 64
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_GetScalingListDefaultAddress, .-HEVC_GetScalingListDefaultAddress
	.align	3
.LC338:
	.xword	.LANCHOR2
	.align	3
.LC339:
	.xword	.L1519
	.align	3
.LC341:
	.xword	.LC340
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecRefPicListsModification
	.type	HEVC_DecRefPicListsModification, %function
HEVC_DecRefPicListsModification:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	mov	x21, x1
	mov	x23, x2
	mov	w20, w3
	bl	_mcount
	cmp	x21, xzr
	ccmp	x23, xzr, 4, ne
	ccmp	x22, xzr, 4, ne
	beq	.L1540
	sub	w0, w20, #1
	mov	w19, 1
	asr	w0, w0, 1
	cbz	w0, .L1532
	.p2align 2
.L1533:
	asr	w0, w0, 1
	add	w19, w19, 1
	cbnz	w0, .L1533
.L1532:
	ldr	x0, [x22, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cmp	w20, 1
	strb	w0, [x23]
	cset	w24, hi
	cmp	w0, wzr
	cset	w0, ne
	tst	w24, w0
	beq	.L1537
	ldr	w0, [x21, 76]
	cbz	w0, .L1537
	mov	w20, 0
	.p2align 2
.L1538:
	ldr	x0, [x22, 2336]
	mov	w1, w19
	bl	BsGet
	add	x1, x23, x20, uxtw 2
	add	w20, w20, 1
	str	w0, [x1, 4]
	ldr	w0, [x21, 76]
	cmp	w0, w20
	bhi	.L1538
.L1537:
	ldr	w0, [x21, 20]
	cbz	w0, .L1555
.L1536:
	mov	w0, 0
.L1531:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1555:
	ldr	x0, [x22, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, wzr
	strb	w0, [x23, 1]
	cset	w0, ne
	tst	w24, w0
	beq	.L1536
	ldr	w0, [x21, 80]
	cbz	w0, .L1536
	mov	w20, 0
	.p2align 2
.L1539:
	ldr	x0, [x22, 2336]
	mov	w1, w19
	bl	BsGet
	add	x1, x23, x20, uxtw 2
	add	w20, w20, 1
	str	w0, [x1, 132]
	ldr	w0, [x21, 80]
	cmp	w0, w20
	bhi	.L1539
	b	.L1536
.L1540:
	mov	w0, -1
	b	.L1531
	.size	HEVC_DecRefPicListsModification, .-HEVC_DecRefPicListsModification
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_MoreRbspData
	.type	HEVC_MoreRbspData, %function
HEVC_MoreRbspData:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 2336]
	bl	BsResidBits
	cmp	w0, wzr
	ble	.L1558
	ldr	x1, [x19, 2376]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w1, [x1, 12]
	add	w1, w1, 3
	cmp	w1, w0
	cset	w0, cc
	ret
	.p2align 3
.L1558:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_MoreRbspData, .-HEVC_MoreRbspData
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_More_Rbsp_Data
	.type	HEVC_More_Rbsp_Data, %function
HEVC_More_Rbsp_Data:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 2336]
	ldr	w2, [x0, 24]
	ldr	w3, [x0, 32]
	lsl	w2, w2, 3
	cmp	w2, w3
	bls	.L1562
	mov	w1, 8
	bl	BsShow
	cmp	w0, 128
	cset	w0, ne
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1562:
	ldr	x1, .LC343
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_More_Rbsp_Data, .-HEVC_More_Rbsp_Data
	.align	3
.LC343:
	.xword	.LC342
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_FindTrailZeros
	.type	HEVC_FindTrailZeros, %function
HEVC_FindTrailZeros:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
.L1576:
	ldr	x1, [x20, 2376]
	mov	w3, 0
	ldr	w5, [x1, 8]
	sub	w5, w5, #1
	add	x2, x1, x5, lsl 5
	ldr	w0, [x2, 48]
	ldr	x2, [x2, 40]
	sub	x0, x0, #1
	add	x0, x2, x0
	.p2align 2
.L1564:
	ldrb	w2, [x0]
	add	x19, x5, 1
	lsl	x19, x19, 5
	add	x4, x1, x19
	cbnz	w2, .L1577
	ldr	x2, [x1, 40]
	add	w3, w3, 1
	cmp	x0, x2
	beq	.L1578
	ldr	x2, [x4, 8]
	cmp	x0, x2
	sub	x0, x0, #1
	bne	.L1564
	add	x1, x1, x5, lsl 5
	ldr	w0, [x20, 252]
	ldr	w1, [x1, 68]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x20, 2376]
	add	x19, x0, x19
	str	xzr, [x19, 8]
	ldr	x1, [x20, 2376]
	ldr	w0, [x1, 8]
	sub	w0, w0, #1
	str	w0, [x1, 8]
	b	.L1576
	.p2align 3
.L1577:
	mov	w0, 1
	mov	w5, w0
	tbnz	x2, 0, .L1571
	.p2align 2
.L1574:
	lsl	w4, w5, w0
	add	w0, w0, 1
	tst	w4, w2
	bne	.L1571
	cmp	w0, 8
	bne	.L1574
	ldr	x1, .LC347
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1578:
	ldr	x1, .LC345
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1571:
	str	wzr, [x1, 4]
	add	w3, w0, w3, lsl 3
	mov	w0, 0
	ldr	x1, [x20, 2376]
	str	w3, [x1, 12]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_FindTrailZeros, .-HEVC_FindTrailZeros
	.align	3
.LC345:
	.xword	.LC344
	.align	3
.LC347:
	.xword	.LC346
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_FindNaluArraySlot
	.type	HEVC_FindNaluArraySlot, %function
HEVC_FindNaluArraySlot:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19, 168]
	ldr	w0, [x19, 148]
	add	w3, w3, 1
	cmp	w3, wzr
	ble	.L1580
	udiv	w1, w0, w3
	mov	w4, 104
	ldr	x5, [x19, 2424]
	msub	w0, w1, w3, w0
	umull	x1, w0, w4
	add	x1, x5, x1
	ldr	w1, [x1, 32]
	cbz	w1, .L1581
	mov	w1, 0
	b	.L1583
	.p2align 3
.L1584:
	udiv	w0, w2, w3
	msub	w0, w0, w3, w2
	umull	x2, w0, w4
	add	x2, x5, x2
	ldr	w2, [x2, 32]
	cbz	w2, .L1581
.L1583:
	add	w1, w1, 1
	cmp	w3, w1
	add	w2, w1, w0
	bne	.L1584
.L1580:
	str	w0, [x19, 148]
.L1595:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1581:
	cmp	w0, w3
	str	w0, [x19, 148]
	bcs	.L1595
	mov	w1, 104
	mov	w2, 1
	umull	x1, w0, w1
	add	x5, x5, x1
	str	w2, [x5, 32]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_FindNaluArraySlot, .-HEVC_FindNaluArraySlot
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ReleaseNAL
	.type	HEVC_ReleaseNAL, %function
HEVC_ReleaseNAL:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w21, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L1605
	ldr	x24, .LC350
	add	x19, x20, 40
	ldr	x23, .LC352
	add	x22, x20, 104
	stp	wzr, wzr, [x20, 32]
.L1600:
	ldr	x1, [x19]
	mov	w0, w21
	cbz	x1, .L1599
	ldr	w1, [x19, 28]
	bl	SM_ReleaseStreamSeg
	ldr	w4, [x19, 8]
	mov	x2, x24
	ldr	x3, [x19]
	mov	x1, x23
	mov	w0, 7
	bl	dprint_vfmw
	str	xzr, [x19]
	str	wzr, [x19, 8]
	str	wzr, [x19, 20]
.L1599:
	add	x19, x19, 32
	cmp	x19, x22
	bne	.L1600
	ldr	x3, .LC353
	mov	x2, 104
	mov	w1, 0
	mov	x0, x20
	ldr	x3, [x3, 96]
	blr	x3
.L1596:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1605:
	ldr	x2, .LC348
	mov	w3, 14430
	ldr	x1, .LC349
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1596
	.size	HEVC_ReleaseNAL, .-HEVC_ReleaseNAL
	.align	3
.LC348:
	.xword	.LC209
	.align	3
.LC349:
	.xword	.LC211
	.align	3
.LC350:
	.xword	.LANCHOR3
	.align	3
.LC352:
	.xword	.LC351
	.align	3
.LC353:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InitDecBuffers
	.type	HEVC_InitDecBuffers, %function
HEVC_InitDecBuffers:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x20, 2400]
	ldr	w0, [x0, 184]
	add	w0, w0, 1
	str	w0, [x20, 2768]
	cmp	w0, 17
	bhi	.L1640
.L1607:
	add	x2, x20, 2560
	add	x0, x20, 2928
	add	x1, x20, 3064
	stp	wzr, wzr, [x2, 212]
	stp	wzr, wzr, [x2, 220]
	str	wzr, [x20, 2788]
	.p2align 2
.L1608:
	str	xzr, [x0, -136]
	add	x0, x0, 8
	str	xzr, [x0, -8]
	str	xzr, [x0, 128]
	str	xzr, [x0, 264]
	cmp	x0, x1
	bne	.L1608
	add	x26, x20, 12288
	ldr	x22, .LC357
	add	x19, x26, 1168
	mov	w21, 0
	mov	w25, 20
	mov	w24, 16
	.p2align 2
.L1609:
	ldr	x3, [x22, 96]
	add	x0, x19, 80
	mov	x2, 640
	mov	w1, 0
	mov	w23, 16
	blr	x3
	str	w21, [x19, 228]
	add	w21, w21, 1
	strb	wzr, [x19]
	strb	wzr, [x19, 1]
	cmp	w21, 20
	strb	wzr, [x19, 2]
	str	wzr, [x19, 8]
	stp	w25, w24, [x19, 20]
	str	wzr, [x19, 48]
	str	wzr, [x19, 56]
	str	x19, [x19, 72]
	add	x19, x19, 720
	bne	.L1609
	ldr	x3, [x22, 96]
	mov	w1, 0
	mov	x2, 200
	add	x0, x26, 968
	blr	x3
	str	w23, [x20, 13256]
	add	x1, x20, 2456
	add	x0, x20, 2592
	str	wzr, [x20, 13260]
.L1611:
	str	xzr, [x1], 8
	cmp	x0, x1
	bne	.L1611
	add	x1, x20, 2728
	str	wzr, [x20, 4740]
	.p2align 2
.L1612:
	str	xzr, [x0], 8
	cmp	x0, x1
	bne	.L1612
	ldr	w0, [x20, 184]
	str	wzr, [x20, 4744]
	cbz	w0, .L1617
	sub	w1, w0, #1
	add	x0, x20, 2144
	add	x1, x1, 537
	add	x1, x20, x1, lsl 2
	.p2align 2
.L1616:
	str	wzr, [x0], 4
	cmp	x1, x0
	bne	.L1616
.L1617:
	ldr	w3, [x20, 168]
	mov	w19, 0
	cbz	w3, .L1606
	.p2align 2
.L1630:
	ldr	x0, [x20, 2416]
	uxtw	x21, w19
	ldr	x0, [x0, w19, uxtw 3]
	add	w19, w19, 1
	mov	x1, x0
	cbz	x0, .L1618
	ldr	x2, [x20, 2376]
	cmp	x0, x2
	beq	.L1618
	ldr	w0, [x20, 252]
	bl	HEVC_ReleaseNAL
	ldr	x0, [x20, 2416]
	mov	w2, 2
	str	xzr, [x0, x21, lsl 3]
	ldr	w1, [x20, 204]
	ldr	w0, [x20, 236]
	ldr	w4, [x20, 176]
	cmp	w1, wzr
	cset	w7, ne
	cmp	w0, wzr
	cset	w5, ne
	sub	w6, w4, #1
	cmp	w4, 3
	ldr	w3, [x20, 168]
	sub	w1, w1, w7
	csel	w2, w6, w2, cs
	sub	w0, w0, w5
	str	w2, [x20, 176]
	str	w1, [x20, 204]
	str	w0, [x20, 236]
.L1618:
	cmp	w3, w19
	bhi	.L1630
.L1606:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1640:
	ldr	x2, .LC354
	mov	w4, 17
	ldr	x1, .LC356
	mov	w3, w4
	add	x2, x2, 16
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 17
	str	w0, [x20, 2768]
	b	.L1607
	.size	HEVC_InitDecBuffers, .-HEVC_InitDecBuffers
	.align	3
.LC354:
	.xword	.LANCHOR3
	.align	3
.LC356:
	.xword	.LC355
	.align	3
.LC357:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_EmptyFrmFromDPB
	.type	HEVC_EmptyFrmFromDPB, %function
HEVC_EmptyFrmFromDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L1652
	ldr	w3, [x20, 2772]
	mov	w0, 0
	mov	w4, 1
	cbz	w3, .L1647
	.p2align 2
.L1661:
	add	x1, x20, x0, uxtw 3
	add	w0, w0, 1
	ldr	x1, [x1, 2792]
	ldrb	w2, [x1, 2]
	cbnz	w2, .L1645
	strb	w4, [x1, 2]
	ldr	w3, [x20, 2772]
.L1645:
	cmp	w3, w0
	bhi	.L1661
.L1647:
	mov	w0, -2147483647
	add	x19, x20, 2792
	add	x21, x20, 2928
	str	w0, [x20, 212]
.L1644:
	ldr	x0, [x19]
	mov	w2, 1
	cbz	x0, .L1648
	ldr	w1, [x0, 28]
	ldr	w0, [x20, 252]
	bl	FSP_ClearLogicFs
.L1648:
	ldr	x0, [x19, 136]
	mov	w2, 1
	cbz	x0, .L1649
	ldr	w1, [x0, 28]
	ldr	w0, [x20, 252]
	bl	FSP_ClearLogicFs
.L1649:
	ldr	x0, [x19, 272]
	mov	w2, 1
	cbz	x0, .L1650
	ldr	w1, [x0, 28]
	ldr	w0, [x20, 252]
	bl	FSP_ClearLogicFs
.L1650:
	ldr	x0, [x19, 408]
	mov	w2, 1
	cbz	x0, .L1651
	ldr	w1, [x0, 28]
	ldr	w0, [x20, 252]
	bl	FSP_ClearLogicFs
.L1651:
	str	xzr, [x19, 136]
	str	xzr, [x19, 272]
	str	xzr, [x19, 408]
	str	xzr, [x19], 8
	cmp	x19, x21
	bne	.L1644
	mov	x0, x20
	bl	HEVC_InitDecBuffers
	mov	w0, 0
.L1642:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1652:
	mov	w0, -1
	b	.L1642
	.size	HEVC_EmptyFrmFromDPB, .-HEVC_EmptyFrmFromDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CombinePacket
	.type	HEVC_CombinePacket, %function
HEVC_CombinePacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 2376]
	cbz	x0, .L1671
	ldr	w0, [x0, 48]
	cmp	w0, 4095
	bhi	.L1668
	ldr	x1, .LC361
	mov	w0, 7
	bl	dprint_vfmw
	ldr	x1, [x19, 2376]
	ldr	x3, .LC362
	ldr	w2, [x1, 48]
	ldr	x0, [x1, 72]
	ldr	x3, [x3, 104]
	ldr	x1, [x1, 40]
	sub	x0, x0, x2
	blr	x3
	ldr	x0, [x19, 2376]
	mov	w3, 1
	ldr	w2, [x0, 100]
	ldr	w1, [x0, 68]
	str	w2, [x0, 68]
	ldr	x0, [x19, 2376]
	str	wzr, [x0, 60]
	ldr	x0, [x19, 2376]
	ldr	w4, [x0, 48]
	ldr	x2, [x0, 72]
	sub	x2, x2, x4
	str	x2, [x0, 40]
	ldr	x0, [x19, 2376]
	ldr	w4, [x0, 48]
	ldr	w2, [x0, 84]
	sub	w2, w2, w4
	str	w2, [x0, 52]
	ldr	x0, [x19, 2376]
	ldr	w4, [x0, 48]
	ldr	w2, [x0, 80]
	add	w2, w4, w2
	str	w2, [x0, 48]
	ldr	x0, [x19, 2376]
	str	w3, [x0, 8]
	ldr	w0, [x19, 252]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 2376]
	str	xzr, [x0, 72]
	ldr	x0, [x19, 2376]
	str	wzr, [x0, 92]
	ldr	x0, [x19, 2376]
	str	wzr, [x0, 80]
.L1668:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1671:
	ldr	x1, .LC359
	bl	dprint_vfmw
	b	.L1668
	.size	HEVC_CombinePacket, .-HEVC_CombinePacket
	.align	3
.LC359:
	.xword	.LC358
	.align	3
.LC361:
	.xword	.LC360
	.align	3
.LC362:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsOutDPB
	.type	HEVC_IsOutDPB, %function
HEVC_IsOutDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L1677
	ldr	w3, [x19, 2772]
	cbz	w3, .L1677
	ldr	x0, [x19, 2792]
	cmp	x20, x0
	beq	.L1679
	sub	w3, w3, #1
	mov	x0, x19
	add	x3, x19, x3, lsl 3
	b	.L1674
	.p2align 3
.L1675:
	ldr	x2, [x0, 2792]
	cmp	x20, x2
	beq	.L1679
.L1674:
	cmp	x0, x3
	add	x0, x0, 8
	bne	.L1675
.L1677:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1679:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsOutDPB, .-HEVC_IsOutDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsNewPicNal
	.type	HEVC_IsNewPicNal, %function
HEVC_IsNewPicNal:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.size	HEVC_IsNewPicNal, .-HEVC_IsNewPicNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_u_v
	.type	HEVC_u_v, %function
HEVC_u_v:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	mov	w1, w20
	mov	x0, x19
	bl	BsGet
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_u_v, .-HEVC_u_v
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_f_v
	.type	HEVC_f_v, %function
HEVC_f_v:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	mov	w1, w20
	mov	x0, x19
	bl	BsGet
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_f_v, .-HEVC_f_v
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ue_v
	.type	HEVC_ue_v, %function
HEVC_ue_v:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 32
	mov	x0, x19
	bl	BsShow
	bl	ZerosMS_32
	cmp	w0, 31
	bls	.L1686
	mov	w0, -4370
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1686:
	mov	w1, w0
	mov	x0, x19
	add	w21, w1, 1
	bl	BsSkip
	mov	w1, w21
	mov	x0, x19
	bl	BsShow
	sub	w20, w0, #1
	mov	w1, w21
	mov	x0, x19
	bl	BsSkip
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_ue_v, .-HEVC_ue_v
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Tone_Mapping_Info
	.type	HEVC_Sei_Tone_Mapping_Info, %function
HEVC_Sei_Tone_Mapping_Info:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC364
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1707
.L1692:
	ldr	x0, [x19, 2336]
	mov	w1, 32
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 32
	bl	BsGet
	mov	w0, 0
.L1690:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1707:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 8
	bl	BsGet
	mov	w21, w0
	ldr	x0, [x19, 2336]
	mov	w1, 8
	bl	BsGet
	cmp	w0, 8
	mov	w22, w0
	bhi	.L1708
	ldr	x0, [x19, 2336]
	mov	w1, 8
	bl	BsGet
	cmp	w0, 4
	mov	w1, w0
	mov	w0, 0
	bhi	.L1690
	ldr	x0, .LC367
	ldrb	w0, [x0,w1,uxtw]
	adr	x1, .Lrtx1691
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1691:
	.section	.rodata
	.align	0
	.align	2
.L1691:
	.byte	(.L1692 - .Lrtx1691) / 4
	.byte	(.L1692 - .Lrtx1691) / 4
	.byte	(.L1693 - .Lrtx1691) / 4
	.byte	(.L1694 - .Lrtx1691) / 4
	.byte	(.L1695 - .Lrtx1691) / 4
	.text
	.p2align 3
.L1693:
	mov	w2, 1
	lsl	w22, w2, w22
	cbz	w22, .L1706
	add	w21, w21, 7
	mov	w20, 0
	and	w21, w21, -8
	.p2align 2
.L1697:
	ldr	x0, [x19, 2336]
	mov	w1, w21
	add	w20, w20, 1
	bl	BsGet
	cmp	w22, w20
	bne	.L1697
.L1706:
	mov	w0, 0
.L1709:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1694:
	ldr	x0, [x19, 2336]
	mov	w1, 16
	bl	BsGet
	cmp	w0, 256
	mov	w23, w0
	bhi	.L1699
	cbz	w0, .L1706
	add	w21, w21, 7
	add	w22, w22, 7
	and	w21, w21, -8
	and	w22, w22, -8
	mov	w20, 0
	.p2align 2
.L1701:
	ldr	x0, [x19, 2336]
	mov	w1, w21
	add	w20, w20, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, w22
	bl	BsGet
	cmp	w20, w23
	bne	.L1701
	mov	w0, 0
	b	.L1709
	.p2align 3
.L1695:
	ldr	x0, [x19, 2336]
	mov	w1, 8
	bl	BsGet
	cmp	w0, 255
	beq	.L1710
.L1702:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 32
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 32
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 16
	bl	BsGet
	mov	w0, 0
	b	.L1709
	.p2align 3
.L1710:
	ldr	x0, [x19, 2336]
	mov	w1, 32
	bl	BsGet
	b	.L1702
.L1708:
	ldr	x1, .LC366
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1690
.L1699:
	ldr	x1, .LC369
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1690
	.size	HEVC_Sei_Tone_Mapping_Info, .-HEVC_Sei_Tone_Mapping_Info
	.align	3
.LC364:
	.xword	.LC363
	.align	3
.LC366:
	.xword	.LC365
	.align	3
.LC367:
	.xword	.L1691
	.align	3
.LC369:
	.xword	.LC368
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Frame_Packing_Arrangement
	.type	HEVC_Sei_Frame_Packing_Arrangement, %function
HEVC_Sei_Frame_Packing_Arrangement:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC371
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L1712
	ldr	x0, [x19, 2336]
	mov	w1, 7
	bl	BsGet
	mov	w21, w0
	sub	w0, w0, #3
	cmp	w0, 2
	bhi	.L1719
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w20, w0
	ldr	x0, [x19, 2336]
	mov	w1, 6
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	cmp	w20, wzr
	ccmp	w21, 5, 4, eq
	bne	.L1720
.L1715:
	ldr	x0, [x19, 2336]
	mov	w1, 8
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
.L1712:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	bl	BsToNextByte
	mov	w0, 0
.L1714:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1720:
	ldr	x0, [x19, 2336]
	mov	w1, 4
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 4
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 4
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 4
	bl	BsGet
	b	.L1715
	.p2align 3
.L1719:
	ldr	x1, .LC373
	mov	w2, w21
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1714
	.size	HEVC_Sei_Frame_Packing_Arrangement, .-HEVC_Sei_Frame_Packing_Arrangement
	.align	3
.LC371:
	.xword	.LC370
	.align	3
.LC373:
	.xword	.LC372
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Dec_Unit_Info
	.type	HEVC_Sei_Dec_Unit_Info, %function
HEVC_Sei_Dec_Unit_Info:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	mov	x20, x2
	bl	_mcount
	cmp	x21, xzr
	ccmp	x20, xzr, 4, ne
	ccmp	x19, xzr, 4, ne
	beq	.L1725
	ldr	x1, .LC375
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	ldrb	w0, [x20, 3]
	cbnz	w0, .L1732
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L1733
.L1724:
	ldr	x0, [x19, 2336]
	bl	BsToNextByte
	mov	w0, 0
.L1722:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1732:
	ldr	w1, [x20, 4]
	ldr	x0, [x19, 2336]
	add	w1, w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1724
.L1733:
	ldr	w1, [x20, 8]
	ldr	x0, [x19, 2336]
	add	w1, w1, 1
	bl	BsGet
	b	.L1724
	.p2align 3
.L1725:
	mov	w0, -1
	b	.L1722
	.size	HEVC_Sei_Dec_Unit_Info, .-HEVC_Sei_Dec_Unit_Info
	.align	3
.LC375:
	.xword	.LC374
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Active_Param_sets
	.type	HEVC_Sei_Active_Param_sets, %function
HEVC_Sei_Active_Param_sets:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x20, 2336]
	mov	w1, 4
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x1, .LC377
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 15
	bgt	.L1735
	tbnz	w0, #31, .L1739
	ldr	x22, .LC381
	add	w21, w0, 1
	mov	w19, 0
	.p2align 2
.L1738:
	ldr	x0, [x20, 2336]
	mov	x1, x22
	add	w19, w19, 1
	bl	HEVC_ue_v
	cmp	w21, w19
	bne	.L1738
.L1739:
	ldr	x0, [x20, 2336]
	bl	BsToNextByte
	mov	w0, 0
.L1737:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1735:
	ldr	x1, .LC379
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1737
	.size	HEVC_Sei_Active_Param_sets, .-HEVC_Sei_Active_Param_sets
	.align	3
.LC377:
	.xword	.LC376
	.align	3
.LC379:
	.xword	.LC378
	.align	3
.LC381:
	.xword	.LC380
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Buf_Period
	.type	HEVC_Sei_Buf_Period, %function
HEVC_Sei_Buf_Period:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x23, x1
	mov	x22, x2
	bl	_mcount
	ldr	x1, .LC383
	ldr	x0, [x19, 2336]
	str	wzr, [x19, 11848]
	bl	HEVC_ue_v
	cmp	w0, 15
	bhi	.L1767
	add	x0, x19, 8192
	mov	w1, 1
	mov	w24, 0
	strb	w1, [x0, 3649]
	ldrb	w0, [x22, 2]
	cbz	w0, .L1768
.L1744:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	mov	w21, w1
	mov	w20, 0
	bl	BsGet
	strb	w0, [x23]
	ldr	w1, [x22, 16]
	ldr	x0, [x19, 2336]
	add	w1, w1, w21
	bl	BsGet
.L1745:
	cbz	w20, .L1769
	cmp	w20, 1
	beq	.L1770
.L1750:
	cmp	w21, 1
	bhi	.L1749
.L1748:
	add	w20, w20, 1
	add	w21, w21, 1
	b	.L1745
	.p2align 3
.L1749:
	ldr	x0, [x19, 2336]
	bl	BsToNextByte
	mov	w0, 0
.L1765:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1768:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w24, w0
	cbz	w24, .L1744
	ldr	w1, [x22, 16]
	ldr	x0, [x19, 2336]
	add	w1, w1, 1
	bl	BsGet
	ldr	w1, [x22, 20]
	ldr	x0, [x19, 2336]
	add	w1, w1, 1
	bl	BsGet
	b	.L1744
.L1767:
	ldr	x1, .LC385
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1765
.L1769:
	ldrb	w0, [x22]
	cbz	w0, .L1750
	ldr	w0, [x22, 24]
	mov	w23, 0
	cmn	w0, #1
	bne	.L1753
	b	.L1748
	.p2align 3
.L1752:
	ldr	w0, [x22, 24]
	add	w0, w0, 1
	cmp	w0, w23
	bls	.L1750
.L1753:
	ldr	w1, [x22, 12]
	add	w23, w23, 1
	ldr	x0, [x19, 2336]
	add	w1, w1, 1
	bl	BsGet
	ldr	w1, [x22, 12]
	ldr	x0, [x19, 2336]
	add	w1, w1, 1
	bl	BsGet
	ldrb	w0, [x22, 2]
	orr	w0, w0, w24
	cbz	w0, .L1752
	ldr	w1, [x22, 12]
	ldr	x0, [x19, 2336]
	add	w1, w1, 1
	bl	BsGet
	ldr	w1, [x22, 12]
	ldr	x0, [x19, 2336]
	add	w1, w1, 1
	bl	BsGet
	b	.L1752
.L1770:
	ldrb	w0, [x22, 1]
	cbz	w0, .L1749
	ldr	w0, [x22, 24]
	cmn	w0, #1
	beq	.L1749
	mov	w23, 0
	b	.L1753
	.size	HEVC_Sei_Buf_Period, .-HEVC_Sei_Buf_Period
	.align	3
.LC383:
	.xword	.LC382
	.align	3
.LC385:
	.xword	.LC384
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Pic_Timming
	.type	HEVC_Sei_Pic_Timming, %function
HEVC_Sei_Pic_Timming:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x2
	mov	x22, x1
	bl	_mcount
	ldr	w1, [x19, 11844]
	ldr	w0, [x19, 11848]
	add	w1, w1, 1
	str	w1, [x19, 11844]
	add	w0, w0, 1
	str	w0, [x19, 11848]
	ldrb	w0, [x20, 2]
	cbnz	w0, .L1798
.L1772:
	ldrh	w0, [x20, 44]
	add	x21, x20, 44
	cbz	w0, .L1774
	ldr	w1, [x21, 16]
	ldr	x0, [x19, 2336]
	add	w1, w1, 1
	bl	BsGet
	add	w0, w0, 1
	str	w0, [x22, 8]
	ldr	w1, [x21, 20]
	ldr	x0, [x19, 2336]
	add	w1, w1, 1
	bl	BsGet
	str	w0, [x22, 12]
	ldrb	w0, [x21, 2]
	cbnz	w0, .L1775
.L1778:
	ldrsw	x1, [x19, 252]
	ldr	x0, .LC386
	ldr	x0, [x0, x1, lsl 3]
	ldrsb	w1, [x0, 44]
	cmp	w1, 1
	beq	.L1799
.L1774:
	ldr	x0, [x19, 2336]
	bl	BsToNextByte
	mov	w0, 0
.L1781:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1798:
	ldr	x0, [x19, 2336]
	mov	w1, 4
	bl	BsGet
	str	w0, [x22]
	mov	w1, 2
	ldr	x0, [x19, 2336]
	bl	BsGet
	str	w0, [x22, 4]
	mov	w1, 1
	ldr	x0, [x19, 2336]
	bl	BsGet
	b	.L1772
	.p2align 3
.L1799:
	ldr	x1, [x0, 160]
	mov	x0, 1
	movk	x0, 0x2, lsl 32
	cmp	x1, x0
	bne	.L1774
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_Sei_Get_Dpb_Output_Time
	b	.L1774
	.p2align 3
.L1775:
	ldr	w1, [x21, 8]
	ldr	x0, [x19, 2336]
	add	w1, w1, 1
	bl	BsGet
	ldrb	w0, [x21, 2]
	cbz	w0, .L1778
	ldrb	w0, [x21, 3]
	cbz	w0, .L1778
	ldr	x1, .LC388
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	mov	w23, w0
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w24, w0
	cbnz	w24, .L1800
.L1779:
	cmp	w23, 255
	bhi	.L1801
	ldr	x25, .LC392
	add	w23, w23, 1
	mov	w22, 0
	b	.L1783
	.p2align 3
.L1782:
	cmp	w22, w23
	beq	.L1778
.L1783:
	ldr	x0, [x19, 2336]
	mov	x1, x25
	add	w22, w22, 1
	bl	HEVC_ue_v
	cbnz	w24, .L1782
	ldr	w1, [x21, 4]
	ldr	x0, [x19, 2336]
	add	w1, w1, 1
	bl	BsGet
	b	.L1782
	.p2align 3
.L1800:
	ldr	w1, [x21, 4]
	ldr	x0, [x19, 2336]
	add	w1, w1, 1
	bl	BsGet
	b	.L1779
.L1801:
	ldr	x1, .LC390
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1781
	.size	HEVC_Sei_Pic_Timming, .-HEVC_Sei_Pic_Timming
	.align	3
.LC386:
	.xword	s_pstVfmwChan
	.align	3
.LC388:
	.xword	.LC387
	.align	3
.LC390:
	.xword	.LC389
	.align	3
.LC392:
	.xword	.LC391
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Color_Volume_Reconstruction_Info
	.type	HEVC_Sei_Color_Volume_Reconstruction_Info, %function
HEVC_Sei_Color_Volume_Reconstruction_Info:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L1812
	ldr	x1, .LC394
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1804
.L1808:
	mov	w1, 1
	mov	w0, 0
	strb	w1, [x20]
.L1803:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1804:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	beq	.L1817
.L1805:
	ldr	x0, [x19, 2336]
	mov	w1, 8
	mov	w21, 0
	bl	BsGet
	strb	w0, [x20, 2]
	mov	w1, 8
	ldr	x0, [x19, 2336]
	bl	BsGet
	strb	w0, [x20, 3]
	mov	w1, 8
	ldr	x0, [x19, 2336]
	bl	BsGet
	strb	w0, [x20, 4]
	mov	w1, 8
	ldr	x0, [x19, 2336]
	bl	BsGet
	strb	w0, [x20, 5]
	mov	w1, 8
	ldr	x0, [x19, 2336]
	bl	BsGet
	strb	w0, [x20, 6]
	mov	w1, 4
	ldr	x0, [x19, 2336]
	bl	BsGet
	and	w1, w0, 255
	strb	w0, [x20, 7]
	cbz	w1, .L1810
	.p2align 2
.L1814:
	add	x22, x20, x21, uxtw
	ldr	x0, [x19, 2336]
	mov	w1, 8
	add	w21, w21, 1
	bl	BsGet
	strb	w0, [x22, 8]
	mov	w1, 8
	ldr	x0, [x19, 2336]
	bl	BsGet
	strb	w0, [x22, 23]
	ldrb	w0, [x20, 7]
	cmp	w0, w21
	bhi	.L1814
.L1810:
	ldr	x0, [x19, 2336]
	mov	w1, 4
	mov	w21, 0
	bl	BsGet
	and	w1, w0, 255
	strb	w0, [x20, 38]
	cbz	w1, .L1808
	.p2align 2
.L1813:
	add	x22, x20, x21, uxtw
	ldr	x0, [x19, 2336]
	mov	w1, 8
	add	w21, w21, 1
	bl	BsGet
	strb	w0, [x22, 39]
	mov	w1, 8
	ldr	x0, [x19, 2336]
	bl	BsGet
	strb	w0, [x22, 54]
	ldrb	w0, [x20, 38]
	cmp	w0, w21
	bhi	.L1813
	b	.L1808
	.p2align 3
.L1812:
	mov	w0, -1
	b	.L1803
	.p2align 3
.L1817:
	ldr	x0, [x19, 2336]
	mov	w1, 8
	bl	BsGet
	strb	w0, [x20, 1]
	mov	w1, 8
	ldr	x0, [x19, 2336]
	bl	BsGet
	b	.L1805
	.size	HEVC_Sei_Color_Volume_Reconstruction_Info, .-HEVC_Sei_Color_Volume_Reconstruction_Info
	.align	3
.LC394:
	.xword	.LC393
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_User_Data_Registered_Itu_T_T35
	.type	HEVC_Sei_User_Data_Registered_Itu_T_T35, %function
HEVC_Sei_User_Data_Registered_Itu_T_T35:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	mov	w21, w2
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L1825
	cmp	w21, 3
	bls	.L1829
	ldr	x0, [x20, 2336]
	mov	w1, 8
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 8
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 2
	beq	.L1830
	cmp	w0, 4
	beq	.L1831
	subs	w21, w21, #4
	mov	w19, 0
	beq	.L1824
	.p2align 2
.L1827:
	ldr	x0, [x20, 2336]
	mov	w1, 8
	add	w19, w19, 1
	bl	BsGet
	cmp	w21, w19
	bne	.L1827
.L1824:
	mov	w0, 0
.L1819:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1830:
	add	x1, x20, 3392
	mov	x0, x20
	bl	HEVC_Sei_TSI
	cmn	w0, #1
	csetm	w0, eq
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1831:
	add	x1, x20, 3395
	mov	x0, x20
	bl	HEVC_Sei_Color_Volume_Reconstruction_Info
	cmn	w0, #1
	csetm	w0, eq
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L1825:
	mov	w0, -1
	b	.L1819
.L1829:
	ldr	x1, .LC396
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1819
	.size	HEVC_Sei_User_Data_Registered_Itu_T_T35, .-HEVC_Sei_User_Data_Registered_Itu_T_T35
	.align	3
.LC396:
	.xword	.LC395
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecShortTermRefPicSet
	.type	HEVC_DecShortTermRefPicSet, %function
HEVC_DecShortTermRefPicSet:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x22, x0
	mov	w20, w3
	mov	x0, x30
	mov	x27, x1
	mov	x19, x2
	bl	_mcount
	cbnz	w20, .L1879
.L1833:
	ldr	x1, .LC410
	ldr	x0, [x22, 2336]
	bl	HEVC_ue_v
	cmp	w0, 16
	str	w0, [x19]
	bhi	.L1880
	ldr	x1, .LC414
	ldr	x0, [x22, 2336]
	bl	HEVC_ue_v
	cmp	w0, 16
	str	w0, [x19, 4]
	bhi	.L1881
	ldr	w1, [x19]
	add	w2, w0, w1
	str	w2, [x19, 8]
	cmp	w2, 16
	bhi	.L1858
	mov	w20, 0
	cbz	w1, .L1860
	ldr	x25, .LC420
	mov	w21, 0
	mov	w23, 0
	mov	w24, 32767
	b	.L1862
	.p2align 3
.L1861:
	str	w23, [x19, x2, lsl 2]
	add	x20, x19, x20
	ldr	x0, [x22, 2336]
	bl	BsGet
	strb	w0, [x20, 12]
	ldr	w20, [x19]
	cmp	w20, w21
	bls	.L1882
.L1862:
	ldr	x0, [x22, 2336]
	mov	x1, x25
	uxtw	x20, w21
	add	w21, w21, 1
	bl	HEVC_ue_v
	cmp	w0, w24
	mvn	w1, w0
	add	x2, x20, 8
	add	w23, w23, w1
	mov	w1, 1
	bls	.L1861
	ldr	x1, .LC422
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L1879:
	ldr	x0, [x22, 2336]
	mov	w1, 1
	bl	BsGet
	cbz	w0, .L1833
	ldr	w0, [x27, 176]
	cmp	w20, w0
	beq	.L1883
	sub	w20, w20, #1
.L1837:
	ldr	x0, [x22, 2336]
	mov	w1, 1
	bl	BsGet
	mov	w25, w0
	ldr	x1, .LC404
	ldr	x0, [x22, 2336]
	bl	HEVC_ue_v
	uxtw	x1, w20
	mov	w4, 1
	lsl	x2, x1, 2
	sub	w25, w4, w25, lsl 1
	sub	x3, x2, x1
	lsl	x2, x3, 3
	sub	x2, x2, x3
	lsl	x24, x2, 1
	sub	x24, x24, x1
	madd	w25, w0, w25, w25
	add	x28, x27, x24, lsl 2
	ldr	w2, [x28, 2172]
	cmp	w2, 16
	bhi	.L1884
	mov	w21, 0
	mov	w26, 0
	mov	w20, 0
	mov	w23, 0
	b	.L1844
	.p2align 3
.L1839:
	sub	w1, w0, #1
	cmp	w1, 1
	bls	.L1885
.L1840:
	ldr	w0, [x28, 2172]
	add	w21, w21, 1
	cmp	w0, w21
	bcc	.L1886
.L1844:
	ldr	x0, [x22, 2336]
	mov	w1, 1
	bl	BsGet
	cbnz	w0, .L1839
	ldr	x0, [x22, 2336]
	mov	w1, 1
	bl	BsGet
	lsl	w0, w0, 1
	sub	w1, w0, #1
	cmp	w1, 1
	bhi	.L1840
.L1885:
	ldr	w5, [x28, 2172]
	add	x1, x24, x21, uxtw
	uxtw	x2, w23
	cmp	w5, w21
	add	x4, x2, 8
	add	x3, x19, x2
	add	x2, x27, x1, lsl 2
	mov	w1, 0
	bls	.L1841
	ldr	w1, [x2, 2196]
.L1841:
	cmp	w0, 1
	add	w0, w1, w25
	str	w0, [x19, x4, lsl 2]
	cset	w1, eq
	strb	w1, [x3, 12]
	tbnz	w0, #31, .L1887
	add	w26, w26, 1
	add	w23, w23, 1
.L1888:
	ldr	w0, [x28, 2172]
	add	w21, w21, 1
	cmp	w0, w21
	bcs	.L1844
.L1886:
	cmp	w23, 16
	str	w23, [x19, 8]
	ccmp	w20, 16, 2, ls
	ccmp	w26, 16, 2, ls
	stp	w20, w26, [x19]
	bhi	.L1845
	cmp	w23, 1
	bls	.L1851
	sub	w10, w23, #2
	add	x9, x19, 36
	add	x10, x10, 1
	mov	x7, 0
	.p2align 2
.L1850:
	add	x0, x19, x7
	mov	w3, w7
	ldr	w5, [x9]
	ldrb	w8, [x0, 13]
	tbnz	w7, #31, .L1854
	.p2align 2
.L1869:
	sxtw	x1, w3
	add	w0, w3, 1
	add	x4, x19, x1
	add	x1, x19, x1, lsl 2
	sxtw	x0, w0
	add	x6, x0, 8
	add	x0, x19, x0
	ldr	w2, [x1, 32]
	cmp	w5, w2
	bge	.L1852
	str	w2, [x19, x6, lsl 2]
	ldrb	w2, [x4, 12]
	strb	w2, [x0, 12]
	str	w5, [x1, 32]
	strb	w8, [x4, 12]
.L1852:
	subs	w3, w3, #1
	bpl	.L1869
.L1854:
	add	x7, x7, 1
	add	x9, x9, 4
	cmp	x10, x7
	bne	.L1850
.L1851:
	lsr	w7, w20, 1
	sub	w20, w20, #1
	cbz	w7, .L1848
	add	x2, x19, 32
	add	x1, x19, 12
	sub	w7, w20, w7
	.p2align 2
.L1855:
	sxtw	x0, w20
	ldrb	w4, [x1]
	add	x3, x19, x0
	ldr	w5, [x2]
	add	x0, x19, x0, lsl 2
	sub	w20, w20, #1
	cmp	w20, w7
	ldr	w6, [x0, 32]
	str	w6, [x2], 4
	ldrb	w6, [x3, 12]
	strb	w6, [x1], 1
	str	w5, [x0, 32]
	strb	w4, [x3, 12]
	bne	.L1855
.L1848:
	mov	w0, 0
.L1878:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L1887:
	add	w20, w20, 1
	add	w23, w23, 1
	b	.L1888
.L1882:
	ldr	w2, [x19, 8]
.L1860:
	cmp	w2, w20
	bls	.L1848
	ldr	x24, .LC424
	mov	w23, 0
	.p2align 2
.L1863:
	ldr	x0, [x22, 2336]
	mov	x1, x24
	uxtw	x21, w20
	add	w20, w20, 1
	bl	HEVC_ue_v
	add	w0, w0, 1
	add	x2, x21, 8
	add	w23, w23, w0
	add	x21, x19, x21
	mov	w1, 1
	str	w23, [x19, x2, lsl 2]
	ldr	x0, [x22, 2336]
	bl	BsGet
	strb	w0, [x21, 12]
	ldr	w0, [x19, 8]
	cmp	w0, w20
	bhi	.L1863
	b	.L1848
.L1883:
	ldr	x1, .LC398
	ldr	x0, [x22, 2336]
	bl	HEVC_ue_v
	add	w2, w0, 1
	cmp	w20, w2
	bcc	.L1889
	sub	w3, w20, #1
	sub	w20, w3, w0
	cmp	w20, w3
	bls	.L1837
	ldr	x1, .LC402
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1878
.L1845:
	ldr	x1, .LC408
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1878
.L1881:
	ldr	x1, .LC416
	mov	w0, 1
	ldr	w2, [x19]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1878
.L1889:
	ldr	x1, .LC400
	mov	w3, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1878
.L1884:
	ldr	x1, .LC406
	mov	w0, w4
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1878
.L1880:
	ldr	x1, .LC412
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1878
.L1858:
	ldr	x1, .LC418
	mov	w3, 16
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1878
	.size	HEVC_DecShortTermRefPicSet, .-HEVC_DecShortTermRefPicSet
	.align	3
.LC398:
	.xword	.LC397
	.align	3
.LC400:
	.xword	.LC399
	.align	3
.LC402:
	.xword	.LC401
	.align	3
.LC404:
	.xword	.LC403
	.align	3
.LC406:
	.xword	.LC405
	.align	3
.LC408:
	.xword	.LC407
	.align	3
.LC410:
	.xword	.LC409
	.align	3
.LC412:
	.xword	.LC411
	.align	3
.LC414:
	.xword	.LC413
	.align	3
.LC416:
	.xword	.LC415
	.align	3
.LC418:
	.xword	.LC417
	.align	3
.LC420:
	.xword	.LC419
	.align	3
.LC422:
	.xword	.LC421
	.align	3
.LC424:
	.xword	.LC423
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecHrdParam
	.type	HEVC_DecHrdParam, %function
HEVC_DecHrdParam:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	x22, x1
	uxtb	w19, w2
	mov	w23, w3
	bl	_mcount
	cmp	x20, xzr
	ccmp	x22, xzr, 4, ne
	beq	.L1913
	strb	wzr, [x22, 2]
	cbnz	w19, .L1937
.L1893:
	ldr	x27, .LC428
	mov	w19, 0
	ldr	x25, .LC426
	ldr	x26, .LC430
	ldr	x28, .LC432
	.p2align 2
.L1909:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	uxtw	x21, w19
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1938
	add	x0, x22, x21, lsl 2
	str	wzr, [x0, 24]
.L1912:
	ldr	x0, [x20, 2336]
	mov	x1, x25
	bl	HEVC_ue_v
.L1899:
	ldr	x0, [x20, 2336]
	mov	x1, x27
	bl	HEVC_ue_v
	add	x1, x22, x21, lsl 2
	str	w0, [x1, 24]
.L1900:
	cmp	w0, 31
	bhi	.L1939
	mov	w24, 0
.L1902:
	cbz	w24, .L1940
	cmp	w24, 1
	beq	.L1935
.L1908:
	add	w24, w24, 1
	cmp	w24, 2
	bne	.L1902
.L1907:
	add	w19, w19, 1
	cmp	w23, w19
	bcs	.L1909
	mov	w0, 0
.L1934:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1939:
	mov	w2, w0
	mov	x1, x26
	mov	w0, 1
	mov	w24, 0
	bl	dprint_vfmw
	add	x0, x22, x21, lsl 2
	str	wzr, [x0, 24]
	b	.L1902
	.p2align 3
.L1938:
	add	x24, x22, x21, lsl 2
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	str	wzr, [x24, 24]
	uxtb	w0, w0
	cbnz	w0, .L1912
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1899
	ldr	w0, [x24, 24]
	b	.L1900
	.p2align 3
.L1937:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x22]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x22, 1]
	ldrh	w0, [x22]
	cbz	w0, .L1893
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x22, 2]
	cbnz	w0, .L1941
.L1895:
	ldr	x0, [x20, 2336]
	mov	w1, 4
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 4
	bl	BsGet
	ldrb	w0, [x22, 2]
	cbnz	w0, .L1942
.L1896:
	ldr	x0, [x20, 2336]
	mov	w1, 5
	bl	BsGet
	str	w0, [x22, 12]
	mov	w1, 5
	ldr	x0, [x20, 2336]
	bl	BsGet
	str	w0, [x22, 16]
	mov	w1, 5
	ldr	x0, [x20, 2336]
	bl	BsGet
	str	w0, [x22, 20]
	b	.L1893
.L1913:
	mov	w0, -1
	b	.L1934
.L1942:
	ldr	x0, [x20, 2336]
	mov	w1, 4
	bl	BsGet
	b	.L1896
.L1941:
	ldr	x0, [x20, 2336]
	mov	w1, 8
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 5
	bl	BsGet
	str	w0, [x22, 4]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x22, 3]
	mov	w1, 5
	ldr	x0, [x20, 2336]
	bl	BsGet
	str	w0, [x22, 8]
	b	.L1895
.L1940:
	ldrb	w0, [x22]
	cbnz	w0, .L1915
	mov	w24, 1
.L1935:
	ldrb	w0, [x22, 1]
	cbz	w0, .L1907
.L1915:
	add	x0, x21, 4
	str	wzr, [x29, 108]
	lsl	x0, x0, 2
	str	x0, [x29, 96]
	b	.L1911
.L1910:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x29, 96]
	ldr	w1, [x29, 108]
	add	x0, x22, x0
	ldr	w0, [x0, 8]
	cmp	w0, w1
	bcc	.L1908
.L1911:
	ldr	w2, [x29, 108]
	mov	x1, x28
	ldr	x0, [x20, 2336]
	add	w2, w2, 1
	str	w2, [x29, 108]
	bl	HEVC_ue_v
	ldr	x1, .LC434
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	ldrb	w0, [x22, 2]
	cbz	w0, .L1910
	ldr	x1, .LC436
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	ldr	x1, .LC438
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	b	.L1910
	.size	HEVC_DecHrdParam, .-HEVC_DecHrdParam
	.align	3
.LC426:
	.xword	.LC425
	.align	3
.LC428:
	.xword	.LC427
	.align	3
.LC430:
	.xword	.LC429
	.align	3
.LC432:
	.xword	.LC431
	.align	3
.LC434:
	.xword	.LC433
	.align	3
.LC436:
	.xword	.LC435
	.align	3
.LC438:
	.xword	.LC437
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ProcessVPS
	.type	HEVC_ProcessVPS, %function
HEVC_ProcessVPS:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x21, 3]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	uxtb	w1, w0
	cmp	w1, 1
	beq	.L1944
	ldr	x1, .LC440
	uxtb	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
.L1944:
	ldr	x0, [x20, 2336]
	mov	w1, 6
	bl	BsGet
	cmp	w0, 63
	str	w0, [x21, 8]
	bhi	.L1992
	ldr	x0, [x20, 2336]
	mov	w1, 3
	bl	BsGet
	cmp	w0, 7
	mov	w24, w0
	bhi	.L1993
	str	w0, [x21, 12]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x21, 1]
	mov	w1, 16
	ldr	x0, [x20, 2336]
	bl	BsGet
	mov	w1, 65535
	cmp	w0, w1
	bne	.L1994
	mov	w3, w24
	mov	w2, 1
	add	x1, x21, 124
	mov	x0, x20
	bl	HEVC_DecPTL
	cbnz	w0, .L1995
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w25, w0
	tbnz	w24, #31, .L1954
	ldr	x28, .LC452
	add	w23, w24, 1
	ldr	x27, .LC454
	mov	w19, 0
	ldr	x26, .LC456
	b	.L1956
	.p2align 3
.L1953:
	cmp	w23, w19
	beq	.L1954
.L1956:
	add	x22, x21, x19, sxtw 2
	ldr	x0, [x20, 2336]
	mov	x1, x28
	add	w19, w19, 1
	bl	HEVC_ue_v
	add	w0, w0, 1
	str	w0, [x22, 28]
	mov	x1, x27
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	str	w0, [x22, 60]
	mov	x1, x26
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	str	w0, [x22, 92]
	cbnz	w25, .L1953
	cmp	w24, w19
	blt	.L1954
	.p2align 2
.L1979:
	add	x0, x21, x19, sxtw 2
	ldr	w1, [x21, 28]
	add	w19, w19, 1
	cmp	w23, w19
	str	w1, [x0, 28]
	ldr	w1, [x21, 60]
	str	w1, [x0, 60]
	ldr	w1, [x21, 92]
	str	w1, [x0, 92]
	bne	.L1979
.L1954:
	ldr	x0, [x20, 2336]
	mov	w1, 6
	bl	BsGet
	str	w0, [x21, 16]
	ldr	x1, .LC450
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 1023
	str	w0, [x21, 20]
	bhi	.L1996
	cmp	w0, wzr
	mov	w22, 1
	ble	.L1958
	.p2align 2
.L1978:
	mov	w19, 0
	.p2align 2
.L1959:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	add	w19, w19, w1
	bl	BsGet
	ldr	w0, [x21, 16]
	cmp	w0, w19
	bcs	.L1959
	ldr	w0, [x21, 20]
	add	w22, w22, 1
	cmp	w0, w22
	bge	.L1978
.L1958:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1967
	ldr	x0, [x20, 2336]
	mov	w1, 32
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 32
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L1997
.L1964:
	ldr	x1, .LC462
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 1024
	str	w0, [x21, 24]
	bhi	.L1965
	cmp	w0, wzr
	ble	.L1967
	ldr	x22, .LC466
	mov	w19, 0
	ldr	x0, [x20, 2336]
	mov	x1, x22
	bl	HEVC_ue_v
	mov	w2, 1
	.p2align 2
.L1972:
	mov	w3, w24
	add	x1, x29, 104
	mov	x0, x20
	add	w19, w19, 1
	bl	HEVC_DecHrdParam
	cbnz	w0, .L1998
.L1969:
	ldr	w0, [x21, 24]
	mov	x1, x22
	cmp	w0, w19
	ble	.L1967
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	mov	w2, 1
	cbz	w19, .L1972
	ldr	x0, [x20, 2336]
	mov	w1, w2
	add	w19, w19, 1
	bl	BsGet
	mov	w2, w0
	mov	w3, w24
	add	x1, x29, 104
	mov	x0, x20
	bl	HEVC_DecHrdParam
	cbz	w0, .L1969
.L1998:
	ldr	x1, .LC468
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	ret
.L1967:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1963
	.p2align 2
.L1987:
	ldr	x0, [x20, 2336]
	bl	BsResidBits
	cmp	w0, wzr
	ble	.L1963
	ldr	x2, [x20, 2376]
	mov	w1, 1
	ldr	w2, [x2, 12]
	add	w2, w2, 3
	cmp	w2, w0
	bcc	.L1999
.L1963:
	mov	w0, 0
.L1988:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L1999:
	ldr	x0, [x20, 2336]
	bl	BsGet
	b	.L1987
.L1997:
	ldr	x1, .LC460
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	b	.L1964
.L1994:
	ldr	x1, .LC446
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1988
.L1992:
	ldr	x1, .LC442
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1988
.L1995:
	ldr	x1, .LC448
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1988
.L1993:
	ldr	x1, .LC444
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1988
.L1996:
	ldr	x1, .LC458
.L1990:
	mov	w2, w0
	mov	w3, 1024
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1988
.L1965:
	ldr	x1, .LC464
	b	.L1990
	.size	HEVC_ProcessVPS, .-HEVC_ProcessVPS
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecVPS
	.type	HEVC_DecVPS, %function
HEVC_DecVPS:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC469
	ldr	x0, [x21]
	cbz	x0, .L2007
	ldr	x0, [x20, 2336]
	mov	w1, 4
	bl	BsGet
	cmp	w0, 15
	mov	w22, w0
	bhi	.L2008
	uxtw	x19, w0
	ldr	x0, [x20, 2344]
	lsl	x1, x19, 7
	add	x19, x1, x19, lsl 2
	add	x1, x0, x19
	ldrb	w0, [x0, x19]
	cbnz	w0, .L2009
	str	w22, [x1, 4]
	mov	x0, x20
	ldr	x1, [x20, 2344]
	add	x1, x1, x19
	bl	HEVC_ProcessVPS
	mov	w23, w0
	cbnz	w0, .L2010
	ldr	x0, [x20, 2344]
	mov	w1, 1
	add	x0, x0, x19
	strb	w1, [x0, 2]
	ldr	x0, [x20, 2344]
	strb	w1, [x0, x19]
.L2002:
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2009:
	ldr	x24, .LC474
	mov	x2, 132
	ldr	x21, [x21]
	mov	w1, 0
	add	x21, x21, 458752
	ldr	x3, [x24, 96]
	mov	x0, x21
	blr	x3
	str	w22, [x21, 4]
	mov	x1, x21
	mov	x0, x20
	bl	HEVC_ProcessVPS
	mov	w23, w0
	cbnz	w0, .L2011
	mov	w0, 1
	strb	w0, [x21, 2]
	strb	w0, [x21]
	mov	x1, x21
	ldr	x3, [x24, 112]
	mov	x2, 132
	ldr	x0, [x20, 2344]
	add	x0, x0, x19
	blr	x3
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2011:
	ldr	x1, .LC476
	mov	w2, w22
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2002
	.p2align 3
.L2008:
	ldr	x1, .LC473
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2002
.L2010:
	ldr	x1, .LC478
	mov	w2, w22
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	ldr	x0, [x20, 2344]
	mov	w1, 1
	add	x0, x0, x19
	strb	w1, [x0, 2]
	ldr	x0, [x20, 2344]
	strb	wzr, [x0, x19]
	b	.L2002
.L2007:
	ldr	x2, .LC470
	mov	w23, -1
	ldr	x1, .LC471
	add	x2, x2, 40
	bl	dprint_vfmw
	b	.L2002
	.size	HEVC_DecVPS, .-HEVC_DecVPS
	.align	3
.LC469:
	.xword	.LANCHOR1
	.align	3
.LC470:
	.xword	.LANCHOR3
	.align	3
.LC471:
	.xword	.LC140
	.align	3
.LC473:
	.xword	.LC472
	.align	3
.LC474:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC476:
	.xword	.LC475
	.align	3
.LC478:
	.xword	.LC477
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecVuiParam
	.type	HEVC_DecVuiParam, %function
HEVC_DecVuiParam:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	x21, x2
	bl	_mcount
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L2057
.L2014:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L2058
.L2016:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L2059
.L2018:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L2060
.L2020:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x20, 3]
	mov	w1, 1
	ldr	x0, [x19, 2336]
	bl	BsGet
	strb	w0, [x20, 2]
	mov	w1, 1
	ldr	x0, [x19, 2336]
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L2021
	ldr	x1, .LC484
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	ldr	w0, [x21, 60]
	cmp	w0, 3
	bhi	.L2061
	ldr	x1, .LC488
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	ldr	x1, .LC490
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	ldr	x1, .LC492
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
.L2021:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L2024
	ldr	x0, [x19, 2336]
	mov	w1, 32
	bl	BsGet
	str	w0, [x20, 36]
	mov	w1, 32
	ldr	x0, [x19, 2336]
	bl	BsGet
	str	w0, [x20, 40]
	ldr	w1, [x20, 36]
	cbnz	w1, .L2062
.L2025:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L2063
.L2026:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L2064
.L2024:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w1, w0
	mov	w0, 0
	cbnz	w1, .L2065
.L2023:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2065:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x1, .LC499
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	cmp	w0, 4095
	bhi	.L2066
.L2027:
	ldr	x1, .LC503
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	ldr	x1, .LC505
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	ldr	x1, .LC507
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	ldr	x1, .LC509
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2060:
	ldr	x1, .LC480
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	ldr	x1, .LC482
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	b	.L2020
	.p2align 3
.L2057:
	ldr	x0, [x19, 2336]
	mov	w1, 8
	bl	BsGet
	cmp	w0, 255
	str	w0, [x20, 8]
	bne	.L2014
	ldr	x0, [x19, 2336]
	mov	w1, 16
	bl	BsGet
	str	w0, [x20, 12]
	mov	w1, 16
	ldr	x0, [x19, 2336]
	bl	BsGet
	str	w0, [x20, 16]
	b	.L2014
	.p2align 3
.L2059:
	ldr	x0, [x19, 2336]
	mov	w1, 3
	bl	BsGet
	str	w0, [x20, 20]
	mov	w1, 1
	ldr	x0, [x19, 2336]
	bl	BsGet
	strb	w0, [x20]
	mov	w1, 1
	ldr	x0, [x19, 2336]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x20, 1]
	cbz	w0, .L2018
	ldr	x0, [x19, 2336]
	mov	w1, 8
	bl	BsGet
	str	w0, [x20, 24]
	mov	w1, 8
	ldr	x0, [x19, 2336]
	bl	BsGet
	str	w0, [x20, 28]
	mov	w1, 8
	ldr	x0, [x19, 2336]
	bl	BsGet
	str	w0, [x20, 32]
	b	.L2018
	.p2align 3
.L2058:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	b	.L2016
	.p2align 3
.L2064:
	ldr	w3, [x21, 52]
	mov	w2, 1
	add	x1, x20, 44
	mov	x0, x19
	bl	HEVC_DecHrdParam
	cbz	w0, .L2024
	ldr	x1, .LC497
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2023
	.p2align 3
.L2063:
	ldr	x1, .LC495
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	b	.L2026
	.p2align 3
.L2062:
	ldr	x2, .LC493
	mov	w3, 10000
	umull	x0, w0, w3
	ldr	x2, [x2, 488]
	blr	x2
	add	w0, w0, 5
	mov	w1, 52429
	movk	w1, 0xcccc, lsl 16
	umull	x0, w0, w1
	lsr	x0, x0, 35
	str	w0, [x19, 144]
	b	.L2025
	.p2align 3
.L2066:
	ldr	x1, .LC501
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2027
	.p2align 3
.L2061:
	ldr	x1, .LC486
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2023
	.size	HEVC_DecVuiParam, .-HEVC_DecVuiParam
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_se_v
	.type	HEVC_se_v, %function
HEVC_se_v:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 32
	mov	x0, x20
	bl	BsShow
	bl	ZerosMS_32
	cmp	w0, 31
	bls	.L2072
	mov	w0, 2147483647
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2072:
	mov	w1, w0
	mov	x0, x20
	add	w21, w1, 1
	bl	BsSkip
	mov	w1, w21
	mov	x0, x20
	bl	BsShow
	sub	w0, w0, #1
	asr	w2, w0, 1
	and	w0, w0, 1
	cmp	w0, wzr
	mov	w1, w21
	mov	x0, x20
	neg	w19, w2
	csinc	w19, w19, w2, eq
	bl	BsSkip
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_se_v, .-HEVC_se_v
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Structure_Of_Pictures_Info
	.type	HEVC_Sei_Structure_Of_Pictures_Info, %function
HEVC_Sei_Structure_Of_Pictures_Info:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC511
	ldr	x0, [x21, 2336]
	bl	HEVC_ue_v
	ldr	x1, .LC513
	ldr	x0, [x21, 2336]
	bl	HEVC_ue_v
	cmp	w0, 1024
	mov	w22, w0
	bhi	.L2074
	mov	w19, 0
	cbz	w0, .L2080
	ldr	x24, .LC517
	ldr	x23, .LC519
	.p2align 2
.L2083:
	ldr	x0, [x21, 2336]
	mov	w1, 6
	bl	BsGet
	sub	w20, w0, #19
	ldr	x0, [x21, 2336]
	mov	w1, 3
	bl	BsGet
	cmp	w20, 1
	mov	x1, x24
	bls	.L2077
	ldr	x0, [x21, 2336]
	bl	HEVC_ue_v
.L2077:
	mov	x1, x23
	cbz	w19, .L2078
	ldr	x0, [x21, 2336]
	bl	HEVC_se_v
.L2078:
	add	w19, w19, 1
	cmp	w22, w19
	bne	.L2083
.L2080:
	ldr	x0, [x21, 2336]
	bl	BsToNextByte
	mov	w0, 0
.L2076:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L2074:
	ldr	x1, .LC515
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2076
	.size	HEVC_Sei_Structure_Of_Pictures_Info, .-HEVC_Sei_Structure_Of_Pictures_Info
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Recovery_Point
	.type	HEVC_Sei_Recovery_Point, %function
HEVC_Sei_Recovery_Point:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L2088
	ldr	x1, .LC521
	ldr	x0, [x19, 2336]
	bl	HEVC_se_v
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	bl	BsToNextByte
	mov	w0, 0
.L2087:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2088:
	mov	w0, -1
	b	.L2087
	.size	HEVC_Sei_Recovery_Point, .-HEVC_Sei_Recovery_Point
	.align	3
.LC521:
	.xword	.LC520
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Color_Remapping_Info
	.type	HEVC_Sei_Color_Remapping_Info, %function
HEVC_Sei_Color_Remapping_Info:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x22, xzr, 4, ne
	beq	.L2108
	ldr	x1, .LC523
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L2091
.L2105:
	mov	w1, 1
	mov	w0, 0
	strb	w1, [x22]
.L2090:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L2091:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w1, w0
	cmp	w1, 1
	beq	.L2116
.L2092:
	ldr	x0, [x20, 2336]
	mov	w1, 8
	mov	w23, 3
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 8
	bl	BsGet
.L2094:
	ldr	x0, [x20, 2336]
	mov	w1, 8
	bl	BsGet
	uxtb	w1, w0
	cbz	w1, .L2097
	and	w0, w0, 255
	mov	w19, 0
	add	w21, w0, 1
	.p2align 2
.L2096:
	ldr	x0, [x20, 2336]
	mov	w1, 16
	add	w19, w19, 1
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 16
	bl	BsGet
	cmp	w21, w19
	bne	.L2096
.L2097:
	subs	w23, w23, #1
	bne	.L2094
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	beq	.L2098
.L2102:
	add	x26, x22, 3
	mov	x23, x22
	mov	w25, 33
.L2099:
	ldr	x0, [x20, 2336]
	mov	w1, 8
	sub	w24, w23, w22
	bl	BsGet
	uxtb	w1, w0
	cmp	w1, 32
	strb	w1, [x23, 40]
	bhi	.L2117
	cbz	w1, .L2107
	mov	w21, 0
	.p2align 2
.L2106:
	uxtw	x19, w21
	ldr	x0, [x20, 2336]
	mov	w1, 16
	add	w21, w21, 1
	umaddl	x19, w24, w25, x19
	bl	BsGet
	mov	w1, 16
	add	x19, x22, x19, lsl 1
	strh	w0, [x19, 44]
	ldr	x0, [x20, 2336]
	bl	BsGet
	strh	w0, [x19, 242]
	ldrb	w0, [x23, 40]
	add	w0, w0, 1
	cmp	w0, w21
	bhi	.L2106
.L2107:
	add	x23, x23, 1
	cmp	x23, x26
	bne	.L2099
	b	.L2105
	.p2align 3
.L2108:
	mov	w0, -1
	b	.L2090
.L2098:
	ldr	x0, [x20, 2336]
	mov	w1, 4
	add	x19, x22, 4
	add	x24, x22, 40
	bl	BsGet
	ldr	x23, .LC525
.L2100:
	add	x21, x19, 12
.L2101:
	ldr	x0, [x20, 2336]
	mov	x1, x23
	bl	HEVC_se_v
	str	w0, [x19], 4
	cmp	x19, x21
	bne	.L2101
	cmp	x19, x24
	bne	.L2100
	b	.L2102
.L2116:
	ldr	x0, [x20, 2336]
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 8
	bl	BsGet
	strb	w0, [x22, 1]
	mov	w1, 8
	ldr	x0, [x20, 2336]
	bl	BsGet
	ldr	x0, [x20, 2336]
	mov	w1, 8
	bl	BsGet
	b	.L2092
.L2117:
	ldr	x1, .LC527
	uxtb	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2090
	.size	HEVC_Sei_Color_Remapping_Info, .-HEVC_Sei_Color_Remapping_Info
	.align	3
.LC523:
	.xword	.LC522
	.align	3
.LC525:
	.xword	.LC524
	.align	3
.LC527:
	.xword	.LC526
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Payload
	.type	HEVC_Sei_Payload, %function
HEVC_Sei_Payload:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	x23, x2
	mov	w22, w3
	mov	w21, w4
	bl	_mcount
	cmp	x19, xzr
	cset	w2, eq
	cmp	x20, xzr
	cset	w0, eq
	orr	w0, w2, w0
	cbnz	w0, .L2144
	ldr	x0, [x19, 2376]
	ldr	w0, [x0, 16]
	cmp	w0, 39
	beq	.L2165
	cmp	w22, 5
	beq	.L2148
	cmp	w22, 132
	beq	.L2149
	mov	w20, 0
	cbz	w21, .L2143
	.p2align 2
.L2160:
	ldr	x0, [x19, 2336]
	mov	w1, 8
	add	w20, w20, 1
	bl	BsGet
	cmp	w21, w20
	bne	.L2160
	mov	w1, w21
	mov	x0, x19
	bl	HEVC_Sei_More_Data_In_Payload
	cbnz	w0, .L2152
	.p2align 2
.L2156:
	mov	w0, 0
.L2120:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2148:
	mov	w2, w21
	add	x1, x20, 568
	mov	x0, x19
	bl	HEVC_Sei_User_Data_Unregistered
	cbnz	w0, .L2144
.L2143:
	mov	w1, w21
	mov	x0, x19
	bl	HEVC_Sei_More_Data_In_Payload
	cbz	w0, .L2156
.L2152:
	mov	w1, w21
	mov	x0, x19
	bl	HEVC_Sei_Payload_Extension_Present
	cbnz	w0, .L2166
	.p2align 2
.L2155:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	bl	BsIsByteAligned
	cbz	w0, .L2155
	b	.L2156
	.p2align 3
.L2165:
	cmp	w22, 147
	bls	.L2167
.L2122:
	mov	w20, 0
	cbz	w21, .L2143
	.p2align 2
.L2159:
	ldr	x0, [x19, 2336]
	mov	w1, 8
	add	w20, w20, 1
	bl	BsGet
	cmp	w21, w20
	bne	.L2159
	b	.L2143
	.p2align 3
.L2149:
	add	x1, x20, 619
	mov	x0, x19
	bl	HEVC_Sei_Decoded_Picture_Hash
	cbz	w0, .L2143
	.p2align 2
.L2144:
	mov	w0, -1
	b	.L2120
	.p2align 3
.L2167:
	ldr	x0, .LC528
	ldrb	w0, [x0,w22,uxtw]
	adr	x1, .Lrtx2124
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx2124:
	.section	.rodata
	.align	0
	.align	2
.L2124:
	.byte	(.L2123 - .Lrtx2124) / 4
	.byte	(.L2125 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2126 - .Lrtx2124) / 4
	.byte	(.L2148 - .Lrtx2124) / 4
	.byte	(.L2128 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2129 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2130 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2131 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2132 - .Lrtx2124) / 4
	.byte	(.L2133 - .Lrtx2124) / 4
	.byte	(.L2134 - .Lrtx2124) / 4
	.byte	(.L2135 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2136 - .Lrtx2124) / 4
	.byte	(.L2137 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2138 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2139 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2140 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2122 - .Lrtx2124) / 4
	.byte	(.L2141 - .Lrtx2124) / 4
	.text
	.p2align 3
.L2166:
	ldr	x1, .LC530
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	b	.L2155
.L2141:
	cmn	x20, #618
	cset	w0, eq
	orr	w2, w2, w0
	cbnz	w2, .L2144
	ldr	x0, [x19, 2336]
	mov	w1, 8
	bl	BsGet
	strb	w0, [x20, 618]
	b	.L2143
.L2140:
	add	x1, x20, 612
	mov	x0, x19
	bl	HEVC_Sei_Content_Light_Level_Information
	cbz	w0, .L2143
	mov	w0, -1
	b	.L2120
	.p2align 3
.L2139:
	add	x1, x20, 128
	mov	x0, x19
	bl	HEVC_Sei_Color_Remapping_Info
	cbz	w0, .L2143
	mov	w0, -1
	b	.L2120
	.p2align 3
.L2138:
	adds	x1, x20, 568
	cset	w0, eq
	orr	w2, w2, w0
	cbnz	w2, .L2144
	mov	w0, 1
	strb	w0, [x20, 568]
	mov	x0, x19
	bl	HEVC_Sei_Mastering_Display_Colour_Volume.part.15
	cbz	w0, .L2143
	mov	w0, -1
	b	.L2120
	.p2align 3
.L2137:
	cmn	x20, #568
	cset	w0, eq
	orr	w2, w2, w0
	cbnz	w2, .L2144
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	b	.L2143
.L2136:
	mov	w3, w21
	mov	x2, x23
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_Sei_Scalable_Nesting
	cbz	w0, .L2143
	mov	w0, -1
	b	.L2120
	.p2align 3
.L2135:
	add	x1, x20, 568
	mov	x0, x19
	bl	HEVC_Sei_Temporal_Sub_Layer_Zero_Index
	cbz	w0, .L2143
	mov	w0, -1
	b	.L2120
	.p2align 3
.L2134:
	add	x2, x23, 2108
	add	x1, x20, 568
	mov	x0, x19
	bl	HEVC_Sei_Dec_Unit_Info
	cbz	w0, .L2143
	mov	w0, -1
	b	.L2120
	.p2align 3
.L2133:
	add	x1, x20, 568
	mov	x0, x19
	bl	HEVC_Sei_Active_Param_sets
	cbz	w0, .L2143
	mov	w0, -1
	b	.L2120
	.p2align 3
.L2132:
	mov	w2, w21
	add	x1, x20, 619
	mov	x0, x19
	bl	HEVC_Sei_Structure_Of_Pictures_Info
	cbz	w0, .L2143
	mov	w0, -1
	b	.L2120
	.p2align 3
.L2131:
	add	x1, x20, 568
	mov	x0, x19
	bl	HEVC_Sei_Display_Orientation
	cbz	w0, .L2143
	mov	w0, -1
	b	.L2120
	.p2align 3
.L2130:
	add	x1, x20, 568
	mov	x0, x19
	bl	HEVC_Sei_Frame_Packing_Arrangement
	cbz	w0, .L2143
	mov	w0, -1
	b	.L2120
	.p2align 3
.L2129:
	add	x1, x20, 619
	mov	x0, x19
	bl	HEVC_Sei_Tone_Mapping_Info
	cbz	w0, .L2143
	mov	w0, -1
	b	.L2120
	.p2align 3
.L2128:
	add	x1, x20, 568
	mov	x0, x19
	bl	HEVC_Sei_Recovery_Point
	cbz	w0, .L2143
	mov	w0, -1
	b	.L2120
	.p2align 3
.L2126:
	mov	w2, w21
	add	x1, x20, 56
	mov	x0, x19
	bl	HEVC_Sei_User_Data_Registered_Itu_T_T35
	cbz	w0, .L2143
	mov	w0, -1
	b	.L2120
	.p2align 3
.L2125:
	add	x2, x23, 2064
	add	x1, x20, 8
	mov	x0, x19
	bl	HEVC_Sei_Pic_Timming
	cbz	w0, .L2143
	mov	w0, -1
	b	.L2120
	.p2align 3
.L2123:
	add	x2, x23, 2108
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_Sei_Buf_Period
	cbz	w0, .L2143
	mov	w0, -1
	b	.L2120
	.size	HEVC_Sei_Payload, .-HEVC_Sei_Payload
	.align	3
.LC528:
	.xword	.L2124
	.align	3
.LC530:
	.xword	.LC529
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_SeiMessage
	.type	HEVC_SeiMessage, %function
HEVC_SeiMessage:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x22, x1
	mov	x23, x2
	bl	_mcount
	mov	w20, 0
	ldr	x0, [x19, 2336]
	b	.L2169
	.p2align 3
.L2171:
	bl	BsSkip
	add	w20, w20, 255
	ldr	x0, [x19, 2336]
	ldr	w4, [x0, 24]
	ldr	w3, [x0, 32]
	add	w1, w3, 8
	cmp	w1, w4, lsl 3
	bhi	.L2178
.L2169:
	mov	w1, 8
	bl	BsShow
	cmp	w0, 255
	mov	w1, 8
	ldr	x0, [x19, 2336]
	beq	.L2171
	bl	BsGet
	mov	w21, 0
	mov	w24, w0
	ldr	x0, [x19, 2336]
	b	.L2172
	.p2align 3
.L2173:
	bl	BsSkip
	add	w21, w21, 255
	ldr	x0, [x19, 2336]
	ldr	w4, [x0, 24]
	ldr	w3, [x0, 32]
	add	w1, w3, 8
	cmp	w1, w4, lsl 3
	bhi	.L2179
.L2172:
	mov	w1, 8
	bl	BsShow
	cmp	w0, 255
	mov	w1, 8
	ldr	x0, [x19, 2336]
	beq	.L2173
	bl	BsGet
	add	w4, w0, w21
	mov	x1, x22
	add	w3, w24, w20
	mov	x2, x23
	mov	x0, x19
	bl	HEVC_Sei_Payload
	mov	w1, 0
	cbnz	w0, .L2180
.L2170:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2178:
	ldr	x1, .LC532
	mov	w2, 5069
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, -1
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2179:
	ldr	x1, .LC532
	mov	w2, 5090
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, -1
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L2180:
	ldr	x1, .LC534
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, -1
	b	.L2170
	.size	HEVC_SeiMessage, .-HEVC_SeiMessage
	.align	3
.LC532:
	.xword	.LC531
	.align	3
.LC534:
	.xword	.LC533
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecSEI
	.type	HEVC_DecSEI, %function
HEVC_DecSEI:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	beq	.L2187
	ldr	x20, [x19, 2368]
	add	x21, x19, 3336
	cbnz	x20, .L2190
	b	.L2193
	.p2align 3
.L2185:
	ldr	x0, [x19, 2336]
	bl	BsIsByteAligned
	cbz	w0, .L2194
	mov	x0, x19
	bl	HEVC_More_Rbsp_Data
	cbz	w0, .L2195
.L2190:
	mov	x2, x20
	mov	x1, x21
	mov	x0, x19
	bl	HEVC_SeiMessage
	cbz	w0, .L2185
	ldr	x1, .LC538
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
.L2183:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2195:
	ldr	x0, [x19, 2336]
	mov	w1, 8
	bl	BsGet
	cmp	w0, 128
	bne	.L2196
.L2187:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2194:
	ldr	x1, .LC540
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L2196:
	ldr	x1, .LC542
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2183
.L2193:
	ldr	x1, .LC536
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2183
	.size	HEVC_DecSEI, .-HEVC_DecSEI
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Scalable_Nesting
	.type	HEVC_Sei_Scalable_Nesting, %function
HEVC_Sei_Scalable_Nesting:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x22, x2
	mov	x21, x1
	bl	_mcount
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L2198
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	mov	w20, w0
	ldr	x1, .LC544
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	cmp	w0, 63
	mov	w23, w0
	bhi	.L2213
	and	w20, w20, 255
	cmp	w0, w20
	bcc	.L2204
	ldr	x24, .LC548
	.p2align 2
.L2203:
	ldr	x0, [x19, 2336]
	mov	w1, 3
	add	w20, w20, 1
	bl	BsGet
	ldr	x0, [x19, 2336]
	mov	x1, x24
	bl	HEVC_ue_v
	cmp	w23, w20
	bcs	.L2203
.L2204:
	ldr	x0, [x19, 2336]
	bl	BsToNextByte
.L2202:
	mov	x2, x22
	mov	x1, x21
	mov	x0, x19
	bl	HEVC_SeiMessage
	cbnz	w0, .L2214
	ldr	x0, [x19, 2336]
	bl	BsResidBits
	cmp	w0, wzr
	ble	.L2208
	ldr	x1, [x19, 2376]
	ldr	w1, [x1, 12]
	add	w1, w1, 3
	cmp	w1, w0
	bcc	.L2202
.L2208:
	mov	w0, 0
.L2200:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2198:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L2204
	ldr	x0, [x19, 2336]
	mov	w1, 3
	mov	w20, 0
	bl	BsGet
	ldr	x1, .LC550
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	cmp	w0, 63
	add	w23, w0, 1
	bhi	.L2215
	.p2align 2
.L2209:
	ldr	x0, [x19, 2336]
	mov	w1, 6
	add	w20, w20, 1
	bl	BsGet
	cmp	w20, w23
	bne	.L2209
	b	.L2204
	.p2align 3
.L2214:
	ldr	x1, .LC553
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L2213:
	ldr	x1, .LC546
	mov	w2, 64
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2200
.L2215:
	ldr	x1, .LC552
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2200
	.size	HEVC_Sei_Scalable_Nesting, .-HEVC_Sei_Scalable_Nesting
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
.LC550:
	.xword	.LC549
	.align	3
.LC552:
	.xword	.LC551
	.align	3
.LC553:
	.xword	.LC537
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecScalingListData
	.type	HEVC_DecScalingListData, %function
HEVC_DecScalingListData:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	str	x1, [x29, 112]
	bl	_mcount
	ldr	x0, .LC554
	ldr	x0, [x0]
	cbz	x0, .L2251
	ldr	x19, [x29, 112]
	mov	x2, 64
	str	x19, [x29, 128]
	add	x27, x20, 336
	add	x3, x19, 1536
	str	x3, [x29, 120]
	ldr	x3, .LC557
	add	x1, x19, 1216
	add	x0, x19, 1344
	mov	w25, 0
	ldr	x3, [x3, 104]
	blr	x3
	ldr	x23, .LC569
	add	x0, x19, 1632
	str	x0, [x29, 96]
.L2219:
	ldr	w0, [x27, 1888]
	cbz	w0, .L2239
	uxtw	x0, w25
	mov	w24, 0
	ldp	x1, x21, [x29, 120]
	str	x1, [x29, 136]
	lsl	x1, x0, 2
	sub	x0, x1, x0
	lsl	x0, x0, 1
	str	x0, [x29, 104]
.L2238:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	mov	w19, 64
	bl	BsGet
	uxtb	w0, w0
	ldr	w1, [x27]
	cmp	w1, w19
	csel	w19, w1, w19, le
	cbz	w25, .L2252
	add	x22, x20, 352
	cbz	w0, .L2253
	cmp	w25, 1
	bls	.L2244
	ldr	x1, .LC565
	ldr	x0, [x20, 2336]
	bl	HEVC_se_v
	add	w1, w0, 7
	cmp	w1, 254
	bhi	.L2254
	add	w26, w0, 8
	ldr	x0, [x29, 136]
	str	w26, [x0]
.L2222:
	cmp	w19, wzr
	mov	x28, 0
	bgt	.L2235
	b	.L2231
	.p2align 3
.L2234:
	ldr	w0, [x22, x28, lsl 2]
	add	w1, w1, w2
	and	w1, w1, 255
	add	x28, x28, 1
	sub	w26, w1, w2
	cmp	w19, w28
	strb	w26, [x21, x0]
	ble	.L2231
.L2235:
	ldr	x0, [x20, 2336]
	mov	x1, x23
	bl	HEVC_se_v
	add	w2, w0, w26
	add	w0, w0, 128
	add	w1, w2, 256
	cmp	w0, 255
	asr	w2, w1, 31
	lsr	w2, w2, 24
	bls	.L2234
	ldr	x1, .LC571
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
.L2249:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2253:
	ldr	x1, .LC559
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, w24
	bhi	.L2241
	sub	w0, w24, w0
	cmp	w25, 1
	uxtb	w0, w0
	bls	.L2226
	cmp	w0, w24
	beq	.L2243
	ldp	x1, x2, [x29, 104]
	add	x1, x1, x0, uxtb
	add	x1, x1, 384
	ldr	w1, [x2, x1, lsl 2]
.L2227:
	ldr	x2, [x29, 136]
	str	w1, [x2]
.L2226:
	cmp	w0, w24
	beq	.L2255
	ldr	x1, [x29, 104]
	add	x0, x1, x0, uxtb
	ldr	x1, [x29, 112]
	add	x1, x1, x0, lsl 6
.L2229:
	cbz	x1, .L2256
	ldr	x0, .LC557
	sxtw	x2, w19
	ldr	x3, [x0, 104]
	mov	x0, x21
	blr	x3
.L2231:
	add	w24, w24, 1
	cmp	w24, 6
	beq	.L2239
	ldr	x0, [x29, 136]
	add	x21, x21, 64
	add	x0, x0, 4
	str	x0, [x29, 136]
	ldr	w0, [x27, 1888]
	cmp	w24, w0
	bcc	.L2238
	.p2align 2
.L2239:
	ldr	x0, [x29, 120]
	add	w25, w25, 1
	ldr	x1, [x29, 96]
	add	x27, x27, 4
	add	x0, x0, 24
	str	x0, [x29, 120]
	cmp	x0, x1
	ldr	x0, [x29, 128]
	add	x0, x0, 384
	str	x0, [x29, 128]
	bne	.L2219
	mov	w0, 0
	b	.L2249
	.p2align 3
.L2244:
	mov	w26, 8
	b	.L2222
.L2255:
	mov	w1, w24
	mov	w0, w25
	bl	HEVC_GetScalingListDefaultAddress
	mov	x1, x0
	b	.L2229
.L2243:
	mov	w1, 16
	b	.L2227
.L2254:
	ldr	x1, .LC567
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2249
.L2241:
	ldr	x1, .LC561
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2249
.L2256:
	ldr	x1, .LC563
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2249
.L2251:
	ldr	x2, .LC555
	ldr	x1, .LC556
	add	x2, x2, 56
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2249
.L2252:
	ldr	x1, .LC554
	ldr	x22, [x1]
	add	x22, x22, 65536
	cbnz	w0, .L2244
	ldr	x1, .LC559
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, w24
	bhi	.L2241
	sub	w0, w24, w0
	uxtb	w0, w0
	b	.L2226
	.size	HEVC_DecScalingListData, .-HEVC_DecScalingListData
	.align	3
.LC554:
	.xword	.LANCHOR1
	.align	3
.LC555:
	.xword	.LANCHOR3
	.align	3
.LC556:
	.xword	.LC140
	.align	3
.LC557:
	.xword	vfmw_Osal_Func_Ptr_S
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ProcessSPS
	.type	HEVC_ProcessSPS, %function
HEVC_ProcessSPS:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x1, .LC573
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 1
	str	w0, [x19, 60]
	mov	w21, w0
	beq	.L2258
	cmp	w0, 3
	bhi	.L2408
	ldr	x1, .LC577
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
.L2399:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2408:
	ldr	x1, .LC575
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	mov	w0, -1
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2258:
	ldr	x1, .LC579
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 8192
	str	w0, [x19, 64]
	bhi	.L2409
	ldr	x1, .LC584
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 4096
	str	w0, [x19, 68]
	bhi	.L2410
	ldr	w2, [x19, 428]
	ldr	w1, [x19, 64]
	cmp	w2, 120
	mul	w0, w0, w1
	beq	.L2266
	bgt	.L2267
	cmp	w2, 60
	beq	.L2331
	ble	.L2411
	cmp	w2, 90
	beq	.L2271
	cmp	w2, 93
	beq	.L2272
	cmp	w2, 63
	beq	.L2412
.L2265:
	ldr	x1, .LC588
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
	.p2align 3
.L2409:
	ldr	x1, .LC581
.L2404:
	mov	w0, w21
	bl	dprint_vfmw
	ldr	x0, .LC582
	ldr	x4, [x0]
	cbz	x4, .L2401
.L2403:
	ldr	w0, [x20, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	mov	w0, -1
	ldp	x29, x30, [sp], 112
	ret
.L2429:
	ldr	x1, .LC675
	mov	w0, 1
	bl	dprint_vfmw
	.p2align 2
.L2401:
	mov	w0, -1
	b	.L2399
	.p2align 3
.L2331:
	mov	w2, 30720
	mov	w1, 122880
	.p2align 2
.L2268:
	cmp	w0, w2
	bhi	.L2277
	mov	w0, 16
	str	w0, [x19, 184]
.L2278:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	cbz	w0, .L2281
	ldr	x1, .LC590
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	ldr	x21, .LC591
	ldr	w2, [x19, 60]
	ldr	x1, .LC593
	add	x2, x21, x2, lsl 2
	ldr	w2, [x2, 80]
	mul	w0, w2, w0
	str	w0, [x19, 72]
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	ldp	w2, w1, [x19, 60]
	ldr	w3, [x19, 72]
	add	x2, x21, x2, lsl 2
	sub	w1, w1, w3
	ldr	w2, [x2, 80]
	mul	w0, w0, w2
	str	w0, [x19, 76]
	sub	w1, w1, w0
	tbnz	w1, #31, .L2413
	ldr	x1, .LC597
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	ldr	w2, [x19, 60]
	ldr	x1, .LC599
	add	x2, x21, x2, lsl 2
	ldr	w2, [x2, 96]
	mul	w0, w2, w0
	str	w0, [x19, 80]
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	ldr	w2, [x19, 60]
	ldr	w1, [x19, 68]
	ldr	w3, [x19, 80]
	add	x21, x21, x2, lsl 2
	sub	w1, w1, w3
	ldr	w2, [x21, 96]
	mul	w0, w0, w2
	str	w0, [x19, 84]
	sub	w1, w1, w0
	tbnz	w1, #31, .L2414
.L2281:
	ldr	x1, .LC603
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	add	w2, w0, 8
	cmp	w0, 2
	str	w2, [x19, 88]
	bhi	.L2415
	ldr	x1, .LC607
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	add	w2, w0, 8
	cmp	w0, 6
	str	w2, [x19, 96]
	bhi	.L2416
	ldr	w0, [x19, 88]
	str	w0, [x20, 196]
	ldr	x1, .LC611
	ldr	w0, [x19, 96]
	str	w0, [x20, 200]
	ldr	w4, [x19, 88]
	ldr	w3, [x19, 96]
	lsl	w2, w4, 2
	lsl	w0, w3, 2
	sub	w2, w2, w4
	sub	w0, w0, w3
	lsl	w2, w2, 1
	lsl	w0, w0, 1
	sub	w2, w2, #48
	sub	w0, w0, #48
	str	w2, [x19, 92]
	str	w0, [x19, 100]
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 12
	bhi	.L2417
	add	w0, w0, 4
	mov	w1, 1
	stp	w0, w0, [x19, 116]
	mov	w23, 0
	mov	w21, 0
	ldr	x0, [x20, 2336]
	bl	BsGet
	ldr	x26, .LC615
	mov	w27, w0
	ldr	x25, .LC617
	ldr	x24, .LC619
	b	.L2292
	.p2align 3
.L2286:
	ldr	w0, [x19, 52]
	add	w21, w21, 1
	cmp	w21, w0
	bhi	.L2291
.L2292:
	add	x22, x19, x21, uxtw 2
	ldr	x0, [x20, 2336]
	mov	x1, x26
	bl	HEVC_ue_v
	add	w0, w0, 1
	str	w0, [x22, 328]
	mov	x1, x25
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	str	w0, [x22, 360]
	mov	x1, x24
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	str	w0, [x22, 392]
	ldr	w0, [x22, 328]
	cmp	w23, w0
	csel	w23, w23, w0, cs
	cbnz	w27, .L2286
	ldr	w2, [x19, 52]
	add	w21, w21, 1
	cmp	w21, w2
	bhi	.L2291
	.p2align 2
.L2373:
	add	x0, x19, x21, uxtw 2
	ldr	w1, [x19, 328]
	add	w21, w21, 1
	cmp	w21, w2
	str	w1, [x0, 328]
	ldr	w1, [x19, 360]
	str	w1, [x0, 360]
	ldr	w1, [x19, 392]
	str	w1, [x0, 392]
	bls	.L2373
.L2291:
	ldr	w0, [x19, 184]
	ldr	x1, .LC621
	cmp	w0, w23
	csel	w23, w0, w23, ls
	str	w23, [x19, 184]
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 3
	mov	w22, w0
	bhi	.L2418
	ldr	x1, .LC625
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 3
	mov	w21, w0
	bhi	.L2419
	add	w2, w22, 3
	add	w1, w0, w2
	sub	w0, w1, #4
	cmp	w0, 2
	stp	w2, w1, [x19, 124]
	bhi	.L2420
	ldp	w4, w0, [x19, 64]
	mov	w23, 1
	lsl	w1, w23, w1
	lsl	w2, w23, w2
	stp	w2, w1, [x19, 132]
	udiv	w3, w4, w1
	stp	w1, w1, [x19, 140]
	udiv	w2, w0, w1
	msub	w4, w3, w1, w4
	cmp	w4, wzr
	csinc	w3, w3, w3, eq
	str	w3, [x19, 188]
	msub	w0, w2, w1, w0
	ldr	x1, .LC631
	cmp	w0, wzr
	csinc	w2, w2, w2, eq
	str	w2, [x19, 192]
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 3
	mov	w22, w0
	bhi	.L2421
	ldr	x1, .LC635
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 3
	bhi	.L2422
	ldr	w2, [x19, 124]
	add	w1, w22, 2
	str	w1, [x19, 148]
	cmp	w1, w2
	bcs	.L2423
	add	w1, w0, w1
	str	w1, [x19, 152]
	cmp	w1, 5
	bhi	.L2302
	ldr	w0, [x19, 128]
	cmp	w1, w0
	bhi	.L2302
	ldr	x1, .LC643
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	str	w0, [x19, 164]
	ldr	w1, [x19, 128]
	ldr	w2, [x19, 148]
	sub	w1, w1, w2
	cmp	w0, w1
	bhi	.L2424
	ldr	x1, .LC647
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	str	w0, [x19, 168]
	ldr	w1, [x19, 128]
	ldr	w4, [x19, 148]
	sub	w1, w1, w4
	cmp	w0, w1
	bhi	.L2305
	ldr	w2, [x19, 140]
	mov	w3, 1
	lsl	w0, w3, w4
	mov	w1, 0
	lsr	w2, w2, w21
	cmp	w2, w0
	bls	.L2307
	.p2align 2
.L2372:
	add	w1, w1, 1
	add	w0, w4, w1
	lsl	w0, w3, w0
	cmp	w0, w2
	bcc	.L2372
.L2307:
	add	w1, w21, w1
	str	w1, [x19, 172]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3]
	cbz	w0, .L2309
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 4]
	cbnz	w0, .L2425
.L2309:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 5]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 6]
	cbnz	w0, .L2310
	ldr	w2, [x19, 68]
	cmp	w2, 64
	bls	.L2426
.L2310:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	str	w0, [x19, 104]
	cbz	w0, .L2311
	ldr	x0, [x20, 2336]
	mov	w1, 4
	bl	BsGet
	add	w0, w0, 1
	str	w0, [x19, 108]
	mov	w1, 4
	ldr	x0, [x20, 2336]
	bl	BsGet
	add	w0, w0, 1
	str	w0, [x19, 112]
	ldr	x1, .LC655
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 2
	mov	w21, w0
	bhi	.L2427
.L2312:
	ldr	x1, .LC659
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 2
	mov	w22, w0
	bhi	.L2428
.L2313:
	add	w0, w21, 3
	str	w0, [x19, 156]
	add	w0, w22, w0
	str	w0, [x19, 160]
	cmp	w0, 5
	bhi	.L2314
	ldr	w1, [x19, 128]
	cmp	w0, w1
	bhi	.L2314
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 7]
.L2311:
	ldr	x1, .LC665
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 64
	str	w0, [x19, 176]
	bhi	.L2316
	mov	w21, 0
	cbnz	w0, .L2371
	b	.L2322
	.p2align 3
.L2320:
	ldr	w0, [x19, 176]
	cmp	w21, w0
	bcs	.L2322
.L2371:
	uxtw	x5, w21
	mov	w3, w21
	lsl	x2, x5, 2
	mov	x1, x19
	sub	x2, x2, x5
	mov	x0, x20
	lsl	x4, x2, 3
	add	w21, w21, 1
	sub	x2, x4, x2
	lsl	x2, x2, 1
	sub	x2, x2, x5
	add	x2, x19, x2, lsl 2
	add	x2, x2, 2164
	bl	HEVC_DecShortTermRefPicSet
	cbz	w0, .L2320
	ldr	x1, .LC669
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
	.p2align 3
.L2277:
	cmp	w0, w1, lsr 1
	bhi	.L2279
	mov	w0, 12
	str	w0, [x19, 184]
	b	.L2278
	.p2align 3
.L2410:
	ldr	x1, .LC586
	b	.L2404
	.p2align 3
.L2267:
	cmp	w2, 156
	beq	.L2274
	bgt	.L2275
	cmp	w2, 150
	beq	.L2274
	cmp	w2, 153
	beq	.L2274
	cmp	w2, 123
	bne	.L2265
.L2266:
	mov	w2, 32768
	mov	w1, 2228224
	movk	w2, 0x8, lsl 16
	b	.L2268
	.p2align 3
.L2279:
	lsl	w2, w1, 2
	sub	w1, w2, w1
	cmp	w0, w1, lsr 2
	bhi	.L2280
	mov	w0, 8
	str	w0, [x19, 184]
	b	.L2278
	.p2align 3
.L2415:
	ldr	x1, .LC605
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC582
	ldr	x4, [x0]
	cbz	x4, .L2401
	ldr	w1, [x19, 88]
	mov	w3, 8
	ldr	w0, [x20, 252]
	add	x2, x29, 104
	stp	wzr, w1, [x29, 104]
	mov	w1, 119
	blr	x4
	mov	w0, -1
	b	.L2399
	.p2align 3
.L2322:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 8]
	cbz	w0, .L2319
	ldr	x1, .LC671
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 32
	str	w0, [x19, 180]
	bhi	.L2325
	mov	w22, 0
	cbz	w0, .L2319
	.p2align 2
.L2370:
	ldr	w1, [x19, 116]
	uxtw	x21, w22
	ldr	x0, [x20, 2336]
	add	w22, w22, 1
	bl	BsGet
	add	x2, x19, x21, lsl 2
	add	x21, x19, x21
	mov	w1, 1
	str	w0, [x2, 196]
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x21, 13]
	ldr	w0, [x19, 180]
	cmp	w22, w0
	bcc	.L2370
.L2319:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 9]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x19, 10]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	uxtb	w0, w0
	mov	w1, 2
	strb	w0, [x19, 11]
	str	w1, [x19, 2096]
	cbz	w0, .L2324
	mov	x2, x19
	add	x1, x19, 2064
	mov	x0, x20
	bl	HEVC_DecVuiParam
	cbnz	w0, .L2429
.L2324:
	ldrb	w5, [x19, 2067]
	ldp	w3, w4, [x19, 64]
	ldr	w1, [x19, 2076]
	ldr	w2, [x19, 2080]
	madd	w4, w5, w4, w4
	ldr	w0, [x19, 2072]
	bl	HEVC_GetDar
	str	w0, [x19, 2068]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 12]
	cbnz	w0, .L2398
	.p2align 2
.L2329:
	mov	w1, 1
	mov	w0, 0
	strb	w1, [x19]
	b	.L2399
	.p2align 3
.L2430:
	ldr	x0, [x20, 2336]
	bl	BsGet
.L2398:
	ldr	x0, [x20, 2336]
	bl	BsResidBits
	cmp	w0, wzr
	ble	.L2329
	ldr	x2, [x20, 2376]
	mov	w1, 1
	ldr	w2, [x2, 12]
	add	w2, w2, 3
	cmp	w2, w0
	bcs	.L2329
	b	.L2430
	.p2align 3
.L2275:
	cmp	w2, 183
	beq	.L2276
	cmp	w2, 186
	beq	.L2276
	cmp	w2, 180
	bne	.L2265
.L2276:
	mov	w2, 8912896
	mov	w1, 35651584
	b	.L2268
	.p2align 3
.L2411:
	cbz	w2, .L2270
	cmp	w2, 30
	bne	.L2265
.L2270:
	mov	w2, 9216
	mov	w1, 36864
	b	.L2268
	.p2align 3
.L2274:
	mov	w2, 2228224
	mov	w1, 8912896
	b	.L2268
	.p2align 3
.L2271:
	mov	w2, 7168
	mov	w1, 28672
	movk	w2, 0x2, lsl 16
	movk	w1, 0x8, lsl 16
	b	.L2268
.L2412:
	mov	w2, 61440
	mov	w1, 245760
	b	.L2268
	.p2align 3
.L2272:
	mov	w2, 245760
	mov	w1, 983040
	b	.L2268
	.p2align 3
.L2280:
	mov	w0, 6
	str	w0, [x19, 184]
	b	.L2278
.L2426:
	ldr	x1, .LC653
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC582
	ldr	x4, [x0]
	cbnz	x4, .L2403
	mov	w0, -1
	b	.L2399
.L2425:
	add	x1, x19, 432
	mov	x0, x20
	bl	HEVC_DecScalingListData
	cbz	w0, .L2309
	ldr	x1, .LC651
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
	.p2align 3
.L2302:
	ldr	x1, .LC641
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
.L2428:
	ldr	x1, .LC661
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2313
.L2427:
	ldr	x1, .LC657
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2312
.L2417:
	ldr	x1, .LC613
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
.L2418:
	ldr	x1, .LC623
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
.L2421:
	ldr	x1, .LC633
	mov	w0, w23
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
.L2424:
	ldr	x1, .LC645
	mov	w0, w23
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
.L2314:
	ldr	x1, .LC663
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
.L2420:
	ldr	x1, .LC629
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
.L2419:
	ldr	x1, .LC627
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
.L2422:
	ldr	x1, .LC637
	mov	w0, w23
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
.L2416:
	ldr	x1, .LC609
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
.L2423:
	ldr	x1, .LC639
	mov	w0, w23
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
.L2305:
	ldr	x1, .LC649
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
.L2413:
	ldr	x1, .LC595
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
.L2316:
	ldr	x1, .LC667
	mov	w2, 64
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
.L2414:
	ldr	x1, .LC601
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
.L2325:
	ldr	x1, .LC673
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2399
	.size	HEVC_ProcessSPS, .-HEVC_ProcessSPS
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
.LC581:
	.xword	.LC580
	.align	3
.LC582:
	.xword	g_event_report
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
.LC591:
	.xword	.LANCHOR3
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
	.align	3
.LC663:
	.xword	.LC662
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecSPS
	.type	HEVC_DecSPS, %function
HEVC_DecSPS:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC676
	ldr	x0, [x21]
	cbz	x0, .L2445
	ldr	x22, .LC679
	mov	x2, 8
	mov	w1, 0
	add	x0, x29, 80
	ldr	x3, [x22, 96]
	blr	x3
	ldr	x0, [x19, 2336]
	mov	w1, 4
	bl	BsGet
	mov	w24, w0
	ldr	w2, [x19, 156]
	cmp	w2, w0
	bls	.L2446
	ldr	x0, [x19, 2376]
	ldr	w0, [x0, 24]
	cbz	w0, .L2447
	mov	w20, 0
	mov	w25, 0
.L2435:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	mov	w23, w0
	mov	w3, w20
	mov	w2, 1
	add	x1, x29, 80
	mov	x0, x19
	bl	HEVC_DecPTL
	cbnz	w0, .L2448
	ldr	x1, .LC687
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	mov	w26, w0
	ldr	w2, [x19, 160]
	cmp	w0, w2
	bcs	.L2449
	mov	w20, 12660
	ldr	x1, [x19, 2352]
	uxtb	w23, w23
	umull	x20, w0, w20
	add	x1, x1, x20
	ldrb	w0, [x1, 1]
	cbz	w0, .L2439
	ldr	x21, [x21]
	mov	x2, 12660
	ldr	x3, [x22, 96]
	mov	w1, 0
	add	x21, x21, 458752
	mov	x0, x21
	blr	x3
	strb	w23, [x21, 2]
	ldr	x3, [x22, 104]
	add	x1, x29, 80
	mov	x2, 8
	strb	wzr, [x21, 46]
	add	x0, x21, 424
	stp	w24, w25, [x21, 48]
	blr	x3
	str	w26, [x21, 56]
	mov	x1, x21
	mov	x0, x19
	bl	HEVC_ProcessSPS
	mov	w23, w0
	cbnz	w0, .L2450
	mov	w0, 1
	strb	w0, [x21]
	strb	w0, [x21, 1]
	mov	x2, 12660
	ldr	x3, [x22, 112]
	mov	x1, x21
	ldr	x0, [x19, 2352]
	add	x0, x0, x20
	blr	x3
	ldr	x0, [x19, 2352]
	add	x20, x0, x20
	str	x20, [x19, 2368]
.L2433:
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2447:
	ldr	x0, [x19, 2336]
	mov	w1, 3
	bl	BsGet
	cmp	w0, 8
	mov	w20, w0
	mov	w25, w0
	bls	.L2435
	ldr	x1, .LC683
	mov	w2, 8
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2433
	.p2align 3
.L2439:
	str	w24, [x1, 48]
	mov	x2, 8
	add	x1, x29, 80
	ldr	x0, [x19, 2352]
	add	x0, x0, x20
	str	w25, [x0, 52]
	ldr	x0, [x19, 2352]
	add	x0, x0, x20
	strb	w23, [x0, 2]
	ldr	x0, [x19, 2352]
	add	x0, x0, x20
	strb	wzr, [x0, 46]
	ldr	x0, [x19, 2352]
	ldr	x3, [x22, 104]
	add	x0, x0, x20
	add	x0, x0, 424
	blr	x3
	ldr	x1, [x19, 2352]
	mov	x0, x19
	add	x1, x1, x20
	str	w26, [x1, 56]
	ldr	x1, [x19, 2352]
	add	x1, x1, x20
	bl	HEVC_ProcessSPS
	mov	w23, w0
	cbnz	w0, .L2451
	ldr	x0, [x19, 2352]
	mov	w1, 1
	strb	w1, [x0, x20]
	ldr	x0, [x19, 2352]
	add	x0, x0, x20
	strb	w1, [x0, 1]
	ldr	x0, [x19, 2352]
	add	x20, x0, x20
	str	x20, [x19, 2368]
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2449:
	ldr	x1, .LC689
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x19, 160]
	cmp	w26, w1
	bcc	.L2444
	ldr	x0, .LC690
	ldr	x4, [x0]
	cbz	x4, .L2444
	ldr	w0, [x19, 252]
	add	x2, x29, 88
	stp	w26, w1, [x29, 88]
	mov	w3, 8
	mov	w1, 109
	mov	w23, -1
	blr	x4
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2444:
	mov	w23, -1
	b	.L2433
	.p2align 3
.L2448:
	ldr	x1, .LC685
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2433
	.p2align 3
.L2446:
	ldr	x1, .LC681
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2433
	.p2align 3
.L2450:
	ldr	x3, [x19, 2352]
	mov	w2, w26
	ldr	x1, .LC692
	mov	w0, 1
	add	x20, x3, x20
	str	x20, [x19, 2368]
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2433
.L2445:
	ldr	x2, .LC677
	mov	w23, -1
	ldr	x1, .LC678
	add	x2, x2, 112
	bl	dprint_vfmw
	b	.L2433
.L2451:
	ldr	x1, .LC694
	mov	w2, w26
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	ldr	x0, [x19, 2352]
	mov	w1, 1
	strb	w1, [x0, x20]
	ldr	x0, [x19, 2352]
	add	x20, x0, x20
	strb	wzr, [x20, 1]
	b	.L2433
	.size	HEVC_DecSPS, .-HEVC_DecSPS
	.align	3
.LC676:
	.xword	.LANCHOR1
	.align	3
.LC677:
	.xword	.LANCHOR3
	.align	3
.LC678:
	.xword	.LC140
	.align	3
.LC679:
	.xword	vfmw_Osal_Func_Ptr_S
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
.LC690:
	.xword	g_event_report
	.align	3
.LC692:
	.xword	.LC691
	.align	3
.LC694:
	.xword	.LC693
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ProcessPPS
	.type	HEVC_ProcessPPS, %function
HEVC_ProcessPPS:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	mov	w22, 1
	bl	_mcount
	mov	w0, 1
	strb	w0, [x19, 16]
	stp	w22, w22, [x19, 68]
	ldr	x1, .LC696
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	str	w0, [x19, 32]
	tbnz	w0, #31, .L2453
	ldr	w1, [x20, 160]
	cmp	w0, w1
	bge	.L2453
	ldr	x1, [x20, 2352]
	mov	w21, 12660
	smaddl	x21, w0, w21, x1
	ldrb	w1, [x21, 1]
	cbz	w1, .L2563
	ldr	x0, [x20, 2336]
	mov	w1, w22
	bl	BsGet
	strb	w0, [x19, 2]
	mov	w1, w22
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x19, 4]
	mov	w1, 3
	ldr	x0, [x20, 2336]
	bl	BsGet
	str	w0, [x19, 36]
	mov	w1, w22
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x19, 3]
	mov	w1, w22
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x19, 5]
	ldr	x1, .LC702
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	add	w0, w0, 1
	cmp	w0, 15
	str	w0, [x19, 40]
	bhi	.L2564
	ldr	x1, .LC706
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	add	w0, w0, 1
	cmp	w0, 15
	str	w0, [x19, 44]
	bhi	.L2565
	ldr	x1, .LC710
	ldr	x0, [x20, 2336]
	bl	HEVC_se_v
	ldr	w3, [x21, 92]
	mov	w1, -26
	sub	w1, w1, w3
	cmp	w0, w1
	ccmp	w0, 25, 0, ge
	bgt	.L2566
	add	w0, w0, 26
	str	w0, [x19, 48]
	mov	w1, w22
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x19, 6]
	mov	w1, w22
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x19, 7]
	mov	w1, w22
	ldr	x0, [x20, 2336]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 8]
	cbnz	w0, .L2567
	mov	w0, 0
	str	wzr, [x19, 52]
.L2462:
	str	w0, [x19, 56]
	ldr	x1, .LC718
	ldr	x0, [x20, 2336]
	bl	HEVC_se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x19, 60]
	bhi	.L2568
	ldr	x1, .LC722
	ldr	x0, [x20, 2336]
	bl	HEVC_se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x19, 64]
	bhi	.L2569
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 9]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x19, 10]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x19, 11]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x19, 12]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x19, 13]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x19, 14]
	ldrb	w1, [x19, 13]
	cbnz	w1, .L2570
	ldr	w0, [x21, 188]
	strh	w0, [x19, 172]
	ldr	w0, [x21, 192]
	strh	w0, [x19, 212]
.L2501:
	ldr	w3, [x19, 68]
	cmp	w3, wzr
	ble	.L2506
.L2500:
	ldr	w4, [x21, 140]
	add	x0, x19, 172
	mov	w1, 0
	.p2align 2
.L2505:
	ldrsh	w2, [x0]
	add	w1, w1, 1
	add	x0, x0, 2
	mul	w2, w2, w4
	cmp	w2, 64
	bhi	.L2504
	ldr	w5, [x21, 64]
	cmp	w5, 64
	bhi	.L2571
.L2504:
	cmp	w1, w3
	blt	.L2505
.L2506:
	ldr	w1, [x19, 72]
	cmp	w1, wzr
	ble	.L2503
	ldrsh	w2, [x19, 212]
	ldr	w3, [x21, 140]
	mul	w2, w2, w3
	cmp	w2, 63
	bls	.L2507
	sub	w1, w1, #1
	mov	x0, x19
	add	x1, x19, x1, lsl 1
	b	.L2509
	.p2align 3
.L2510:
	ldrsh	w2, [x0, 214]
	add	x0, x0, 2
	mul	w2, w2, w3
	cmp	w2, 63
	bls	.L2507
.L2509:
	cmp	x1, x0
	bne	.L2510
.L2503:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 17]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 18]
	cbnz	w0, .L2572
.L2512:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 21]
	cbz	w0, .L2515
	add	x1, x19, 256
	mov	x0, x20
	bl	HEVC_DecScalingListData
	cbnz	w0, .L2573
.L2515:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 22]
	ldr	x1, .LC768
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	add	w2, w0, 2
	cmp	w2, 1
	str	w2, [x19, 84]
	ble	.L2516
	ldr	w0, [x21, 128]
	cmp	w2, w0
	bhi	.L2516
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 23]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 24]
	cbz	w0, .L2519
	ldr	x0, [x20, 2336]
	bl	BsResidBits
	cmp	w0, wzr
	ble	.L2519
	.p2align 2
.L2574:
	ldr	x2, [x20, 2376]
	mov	w1, 1
	ldr	w2, [x2, 12]
	add	w2, w2, 3
	cmp	w2, w0
	bcs	.L2519
	ldr	x0, [x20, 2336]
	bl	BsGet
	strb	w0, [x19, 25]
	ldr	x0, [x20, 2336]
	bl	BsResidBits
	cmp	w0, wzr
	bgt	.L2574
.L2519:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2567:
	ldr	x1, .LC714
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 3
	str	w0, [x19, 52]
	bls	.L2462
	ldr	x1, .LC716
	mov	w0, w22
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2551
	.p2align 3
.L2570:
	ldr	x1, .LC726
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 19
	bhi	.L2575
	add	w0, w0, 1
	str	w0, [x19, 68]
	ldr	x1, .LC730
	ldr	x0, [x20, 2336]
	bl	HEVC_ue_v
	cmp	w0, 21
	bhi	.L2576
	ldr	w2, [x19, 68]
	add	w3, w0, 1
	str	w3, [x19, 72]
	cmp	w2, 10
	bgt	.L2577
	cmp	w3, 11
	ble	.L2470
	ldr	x1, .LC737
	mov	w2, 11
.L2560:
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC735
	ldr	x4, [x0]
	cbz	x4, .L2555
.L2557:
	ldr	w0, [x20, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
	mov	w0, -1
.L2551:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2507:
	ldr	x1, .LC756
.L2559:
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC735
	ldr	x4, [x0]
	cbnz	x4, .L2557
.L2555:
	mov	w0, -1
.L2581:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2571:
	ldr	x1, .LC754
	b	.L2559
	.p2align 3
.L2566:
	ldr	x1, .LC712
	mov	w2, w0
	add	w3, w3, 26
	mov	w0, w22
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2551
.L2470:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 15]
	cbnz	w0, .L2578
	ldr	w0, [x19, 68]
	sub	w1, w0, #1
	cmp	w1, wzr
	ble	.L2475
	ldr	x24, .LC739
	mov	w23, 0
	b	.L2480
	.p2align 3
.L2476:
	strh	w3, [x0, 88]
	ldr	w4, [x21, 188]
	tbnz	w3, #31, .L2478
	cmp	w3, w4
	bhi	.L2478
	ldr	w0, [x19, 68]
	add	w23, w23, 1
	sub	w1, w0, #1
	cmp	w1, w23
	ble	.L2579
.L2480:
	ldr	x0, [x20, 2336]
	mov	x1, x24
	bl	HEVC_ue_v
	mov	w22, w0
	add	w3, w22, 1
	cmn	w22, #1
	add	x0, x19, x23, sxtw 1
	sxth	w3, w3
	bne	.L2476
	ldr	x2, .LC740
	mov	w3, 4749
	ldr	x1, .LC742
	mov	w0, 1
	add	x2, x2, 128
	bl	dprint_vfmw
	mov	w0, w22
	b	.L2551
.L2577:
	mov	w3, w2
	ldr	x1, .LC734
	mov	w2, 10
	b	.L2560
.L2572:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 19]
	mov	w1, 1
	ldr	x0, [x20, 2336]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 20]
	cbnz	w0, .L2512
	ldr	x1, .LC758
	ldr	x0, [x20, 2336]
	bl	HEVC_se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x19, 76]
	bhi	.L2580
.L2514:
	ldr	x1, .LC762
	ldr	x0, [x20, 2336]
	bl	HEVC_se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x19, 80]
	bls	.L2512
	ldr	x1, .LC764
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x19, 80]
	b	.L2512
.L2578:
	ldr	w0, [x19, 68]
.L2482:
	cmp	w0, wzr
	add	x5, x19, 172
	mov	w3, 0
	ble	.L2474
	.p2align 2
.L2535:
	add	w3, w3, 1
	ldr	w4, [x21, 188]
	sub	w2, w3, #1
	cmp	w3, w0
	mul	w1, w3, w4
	mul	w2, w2, w4
	udiv	w1, w1, w0
	udiv	w2, w2, w0
	sub	w1, w1, w2
	strh	w1, [x5], 2
	bne	.L2535
.L2474:
	ldr	w4, [x19, 72]
	add	x6, x19, 212
	mov	w3, 0
	cmp	w4, wzr
	ble	.L2491
	.p2align 2
.L2534:
	add	w3, w3, 1
	ldr	w5, [x21, 192]
	sub	w2, w3, #1
	cmp	w3, w4
	mul	w1, w3, w5
	mul	w2, w2, w5
	udiv	w1, w1, w4
	udiv	w2, w2, w4
	sub	w1, w1, w2
	strh	w1, [x6], 2
	bne	.L2534
.L2491:
	cmp	w0, 1
	bne	.L2499
	ldr	w3, [x19, 72]
	cmp	w3, 1
	beq	.L2500
.L2499:
	ldr	x0, [x20, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 16]
	b	.L2501
.L2453:
	ldr	x1, .LC698
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2551
.L2563:
	ldr	x1, .LC700
	mov	w2, w0
	mov	w0, w22
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2551
.L2564:
	ldr	x1, .LC704
	mov	w0, w22
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2551
.L2565:
	ldr	x1, .LC708
	mov	w0, w22
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2551
.L2568:
	ldr	x1, .LC720
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2551
.L2569:
	ldr	x1, .LC724
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2551
.L2516:
	ldr	x1, .LC770
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2581
.L2478:
	ldr	x1, .LC744
	mov	w2, w23
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2551
.L2575:
	ldr	x1, .LC728
	mov	w2, w0
	mov	w3, 20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2551
.L2579:
	ldr	w1, [x19, 72]
	sub	w1, w1, #1
	cmp	w1, wzr
	ble	.L2489
.L2481:
	ldr	x24, .LC746
	mov	w23, 0
	b	.L2488
	.p2align 3
.L2484:
	strh	w3, [x0, 128]
	ldr	w4, [x21, 192]
	tbnz	w3, #31, .L2486
	cmp	w3, w4
	bhi	.L2486
	ldr	w0, [x19, 72]
	add	w23, w23, 1
	sub	w0, w0, #1
	cmp	w0, w23
	ble	.L2582
.L2488:
	ldr	x0, [x20, 2336]
	mov	x1, x24
	bl	HEVC_ue_v
	mov	w22, w0
	add	w3, w22, 1
	cmn	w22, #1
	add	x0, x19, x23, sxtw 1
	sxth	w3, w3
	bne	.L2484
	ldr	x2, .LC740
	mov	w3, 4768
	ldr	x1, .LC742
	mov	w0, 1
	add	x2, x2, 128
	bl	dprint_vfmw
	mov	w0, w22
	b	.L2551
.L2580:
	ldr	x1, .LC760
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x19, 76]
	b	.L2514
.L2486:
	ldr	x1, .LC748
	mov	w2, w23
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2551
.L2576:
	ldr	x1, .LC732
	mov	w2, w0
	mov	w3, 22
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2551
.L2582:
	ldr	w0, [x19, 68]
.L2489:
	ldrb	w1, [x19, 15]
	cbnz	w1, .L2482
	add	x5, x19, x0, sxtw 1
	sub	w2, w0, #1
	ldrsh	w3, [x21, 188]
	cmp	w2, wzr
	strh	w3, [x5, 170]
	ble	.L2494
	sub	w6, w0, #2
	add	x4, x19, 88
	add	x6, x6, 45
	add	x6, x19, x6, lsl 1
	.p2align 2
.L2495:
	ldrsh	w3, [x4]
	add	x4, x4, 2
	strh	w3, [x4, 82]
	cmp	x4, x6
	ldrh	w1, [x5, 170]
	sub	w3, w1, w3
	sxth	w3, w3
	strh	w3, [x5, 170]
	bne	.L2495
.L2494:
	cmp	w3, wzr
	ble	.L2583
	ldr	w1, [x19, 72]
	ldrsh	w3, [x21, 192]
	sub	w2, w1, #1
	add	x5, x19, x1, sxtw 1
	cmp	w2, wzr
	strh	w3, [x5, 210]
	ble	.L2497
	sub	w6, w1, #2
	add	x4, x19, 128
	add	x6, x6, 65
	add	x6, x19, x6, lsl 1
	.p2align 2
.L2498:
	ldrsh	w3, [x4]
	add	x4, x4, 2
	strh	w3, [x4, 82]
	cmp	x6, x4
	ldrh	w1, [x5, 210]
	sub	w3, w1, w3
	sxth	w3, w3
	strh	w3, [x5, 210]
	bne	.L2498
.L2497:
	cmp	w3, wzr
	bgt	.L2491
	ldr	x1, .LC752
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2551
	.p2align 3
.L2573:
	ldr	x1, .LC766
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2551
.L2475:
	ldr	w1, [x19, 72]
	sub	w1, w1, #1
	cmp	w1, wzr
	bgt	.L2481
	add	x1, x19, x0, sxtw 1
	ldrsh	w3, [x21, 188]
	sub	w2, w0, #1
	strh	w3, [x1, 170]
	b	.L2494
.L2583:
	ldr	x1, .LC750
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2551
	.size	HEVC_ProcessPPS, .-HEVC_ProcessPPS
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
.LC712:
	.xword	.LC711
	.align	3
.LC714:
	.xword	.LC713
	.align	3
.LC716:
	.xword	.LC715
	.align	3
.LC718:
	.xword	.LC717
	.align	3
.LC720:
	.xword	.LC719
	.align	3
.LC722:
	.xword	.LC721
	.align	3
.LC724:
	.xword	.LC723
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
.LC735:
	.xword	g_event_report
	.align	3
.LC737:
	.xword	.LC736
	.align	3
.LC739:
	.xword	.LC738
	.align	3
.LC740:
	.xword	.LANCHOR3
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecPPS
	.type	HEVC_DecPPS, %function
HEVC_DecPPS:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC771
	ldr	x0, [x21]
	cbz	x0, .L2591
	ldr	x1, .LC775
	ldr	x0, [x19, 2336]
	bl	HEVC_ue_v
	mov	w22, w0
	ldr	w3, [x19, 164]
	cmp	w0, w3
	bcs	.L2592
	mov	w20, 1888
	umull	x20, w0, w20
	ldr	x0, [x19, 2360]
	add	x1, x0, x20
	ldrb	w0, [x0, x20]
	cbnz	w0, .L2593
	str	w22, [x1, 28]
	mov	x0, x19
	ldr	x1, [x19, 2360]
	add	x1, x1, x20
	bl	HEVC_ProcessPPS
	mov	w23, w0
	cbnz	w0, .L2594
	ldr	x0, [x19, 2360]
	mov	w1, 1
	add	x0, x0, x20
	strb	w1, [x0, 1]
	ldr	x0, [x19, 2360]
	strb	w1, [x0, x20]
.L2586:
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2593:
	ldr	x24, .LC778
	mov	x2, 1888
	ldr	x21, [x21]
	mov	w1, 0
	add	x21, x21, 458752
	ldr	x3, [x24, 96]
	mov	x0, x21
	blr	x3
	str	w22, [x21, 28]
	mov	x1, x21
	mov	x0, x19
	bl	HEVC_ProcessPPS
	mov	w23, w0
	cbnz	w0, .L2595
	mov	w0, 1
	strb	w0, [x21, 1]
	strb	w0, [x21]
	mov	x1, x21
	ldr	x3, [x24, 112]
	mov	x2, 1888
	ldr	x0, [x19, 2360]
	add	x0, x0, x20
	blr	x3
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2595:
	ldr	x1, .LC780
	mov	w2, w22
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2586
	.p2align 3
.L2592:
	ldr	x1, .LC777
	mov	w2, w0
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2586
.L2594:
	ldr	x1, .LC780
	mov	w2, w22
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	ldr	x0, [x19, 2360]
	mov	w1, 1
	add	x0, x0, x20
	strb	w1, [x0, 1]
	ldr	x0, [x19, 2360]
	strb	wzr, [x0, x20]
	b	.L2586
.L2591:
	ldr	x2, .LC772
	mov	w23, -1
	ldr	x1, .LC773
	add	x2, x2, 144
	bl	dprint_vfmw
	b	.L2586
	.size	HEVC_DecPPS, .-HEVC_DecPPS
	.align	3
.LC771:
	.xword	.LANCHOR1
	.align	3
.LC772:
	.xword	.LANCHOR3
	.align	3
.LC773:
	.xword	.LC140
	.align	3
.LC775:
	.xword	.LC774
	.align	3
.LC777:
	.xword	.LC776
	.align	3
.LC778:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC780:
	.xword	.LC779
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecPredWeightTable
	.type	HEVC_DecPredWeightTable, %function
HEVC_DecPredWeightTable:
	stp	x29, x30, [sp, -240]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x28, x0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x28, 4692]
	mov	w4, 1888
	ldr	w0, [x28, 4708]
	ldr	x2, [x28, 2360]
	cmp	w1, 1
	stp	xzr, xzr, [x29, 176]
	stp	xzr, xzr, [x29, 192]
	stp	xzr, xzr, [x29, 208]
	stp	xzr, xzr, [x29, 224]
	smaddl	x2, w0, w4, x2
	beq	.L2670
	cbnz	w1, .L2600
	ldrb	w0, [x2, 11]
	cbz	w0, .L2600
.L2598:
	ldr	x1, .LC782
	ldr	x0, [x28, 2336]
	ldr	w19, [x2, 32]
	add	x2, x28, 4096
	mov	x21, x2
	ldr	x20, [x28, 2352]
	str	x2, [x29, 104]
	bl	HEVC_ue_v
	cmp	w0, 7
	str	w0, [x28, 4828]
	add	x22, x21, 732
	bhi	.L2671
	mov	w1, 12660
	smaddl	x19, w19, w1, x20
	ldr	w1, [x19, 60]
	cbnz	w1, .L2672
	str	w0, [x22, 132]
.L2642:
	ldr	w0, [x28, 4748]
	mov	w20, 0
	cbz	w0, .L2612
	.p2align 2
.L2655:
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	add	x1, x29, 240
	add	x2, x1, x20, uxtw 2
	ldr	w1, [x28, 4748]
	add	w20, w20, 1
	cmp	w1, w20
	str	w0, [x2, -128]
	bhi	.L2655
	ldr	w0, [x19, 60]
	cbz	w0, .L2608
	mov	w20, 0
	cbz	w1, .L2612
	.p2align 2
.L2654:
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	add	x1, x29, 240
	add	x2, x1, x20, uxtw 2
	ldr	w1, [x28, 4748]
	add	w20, w20, 1
	cmp	w1, w20
	str	w0, [x2, -64]
	bhi	.L2654
.L2608:
	mov	w27, 0
	cbz	w1, .L2612
	ldr	x0, [x29, 104]
	ldr	x26, .LC800
	add	x21, x0, 732
	b	.L2653
	.p2align 3
.L2614:
	add	x20, x28, x20
	ldr	w1, [x21]
	mov	w0, 1
	lsl	w0, w0, w1
	str	wzr, [x20, 4832]
	str	w0, [x20, 4964]
.L2616:
	ldr	w0, [x19, 60]
	cbz	w0, .L2618
	add	x0, x29, 240
	add	x0, x0, x22, lsl 2
	ldr	w0, [x0, -64]
	cbnz	w0, .L2619
	lsl	x22, x22, 3
	ldr	w2, [x21, 132]
	add	x1, x28, x22
	add	x22, x21, x22
	mov	w0, 1
	lsl	w0, w0, w2
	str	wzr, [x1, 5156]
	str	w0, [x1, 5028]
	str	w0, [x22, 204]
	str	wzr, [x22, 332]
.L2618:
	ldr	w0, [x28, 4748]
	add	w27, w27, 1
	cmp	w0, w27
	bls	.L2612
.L2653:
	uxtw	x22, w27
	add	x0, x29, 240
	lsl	x20, x22, 2
	add	x0, x0, x20
	ldr	w0, [x0, -128]
	cbz	w0, .L2614
	ldr	x1, .LC792
	ldr	x0, [x28, 2336]
	bl	HEVC_se_v
	add	w1, w0, 128
	cmp	w1, 255
	bhi	.L2673
	ldr	w2, [x21]
	add	x20, x28, x20
	mov	w23, 1
	ldr	x1, .LC796
	lsl	w2, w23, w2
	add	w0, w2, w0
	str	w0, [x20, 4964]
	ldr	x0, [x28, 2336]
	bl	HEVC_se_v
	add	w1, w0, 128
	cmp	w1, 255
	str	w0, [x20, 4832]
	bls	.L2616
	ldr	x1, .LC798
	mov	w2, w0
	mov	w0, w23
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2668
	.p2align 3
.L2670:
	ldrb	w0, [x2, 10]
	cbnz	w0, .L2598
.L2600:
	mov	w0, 0
.L2668:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 240
	ret
	.p2align 3
.L2619:
	ldr	x0, [x28, 2336]
	mov	x1, x26
	add	x20, x22, 1
	add	x25, x28, x22, lsl 3
	mov	w24, 128
	mov	w22, 1
	bl	HEVC_se_v
	add	w6, w0, 128
	cmp	w6, 255
	add	x20, x28, x20, lsl 3
	mov	w23, 127
	ldr	x1, .LC804
	bhi	.L2674
.L2620:
	ldr	w6, [x21, 132]
	lsl	w6, w22, w6
	add	w0, w6, w0
	str	w0, [x25, 5028]
	ldr	x0, [x28, 2336]
	bl	HEVC_se_v
	add	w1, w0, 512
	cmp	w1, 1023
	mov	w6, -128
	bhi	.L2675
	ldr	w1, [x25, 5028]
	add	x25, x25, 4
	ldr	w7, [x21, 132]
	lsl	w1, w1, 7
	asr	w1, w1, w7
	sub	w1, w24, w1
	add	w0, w1, w0
	cmp	w0, 127
	csel	w0, w0, w23, le
	cmn	w0, #128
	csel	w0, w0, w6, ge
	cmp	x20, x25
	str	w0, [x25, 5152]
	beq	.L2618
	ldr	x0, [x28, 2336]
	mov	x1, x26
	bl	HEVC_se_v
	add	w6, w0, 128
	cmp	w6, 255
	ldr	x1, .LC804
	bls	.L2620
.L2674:
	ldr	x1, .LC802
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 240
	ret
	.p2align 3
.L2612:
	ldr	w0, [x28, 4692]
	cbnz	w0, .L2600
	ldr	w0, [x28, 4752]
	cbz	w0, .L2600
	mov	w20, 0
	.p2align 2
.L2626:
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	add	x1, x29, 240
	add	x2, x1, x20, uxtw 2
	ldr	w1, [x28, 4752]
	add	w20, w20, 1
	cmp	w1, w20
	str	w0, [x2, -128]
	bhi	.L2626
	ldr	w0, [x19, 60]
	cbnz	w0, .L2676
.L2627:
	mov	w25, 0
	cbz	w1, .L2600
	ldr	x0, [x29, 104]
	ldr	x23, .LC816
	add	x21, x0, 732
	b	.L2651
	.p2align 3
.L2631:
	add	x20, x28, x20
	ldr	w1, [x21]
	mov	w0, 1
	lsl	w0, w0, w1
	str	wzr, [x20, 4896]
	str	w0, [x20, 5284]
.L2633:
	ldr	w0, [x19, 60]
	cbz	w0, .L2635
	add	x0, x29, 240
	add	x0, x0, x26, lsl 2
	ldr	w0, [x0, -64]
	cbnz	w0, .L2636
	lsl	x26, x26, 3
	ldr	w4, [x21, 132]
	add	x1, x28, x26
	add	x26, x21, x26
	mov	w0, 1
	lsl	w0, w0, w4
	str	wzr, [x1, 5476]
	str	w0, [x1, 5348]
	str	w0, [x26, 524]
	str	wzr, [x26, 652]
.L2635:
	ldr	w0, [x28, 4752]
	add	w25, w25, 1
	cmp	w0, w25
	bls	.L2600
.L2651:
	uxtw	x26, w25
	add	x0, x29, 240
	lsl	x20, x26, 2
	add	x0, x0, x20
	ldr	w0, [x0, -128]
	cbz	w0, .L2631
	ldr	x1, .LC808
	ldr	x0, [x28, 2336]
	bl	HEVC_se_v
	add	w1, w0, 128
	cmp	w1, 255
	bhi	.L2677
	ldr	w1, [x21]
	add	x20, x28, x20
	mov	w27, 1
	lsl	w1, w27, w1
	add	w0, w1, w0
	str	w0, [x20, 5284]
	ldr	x1, .LC812
	ldr	x0, [x28, 2336]
	bl	HEVC_se_v
	str	w0, [x20, 4896]
	add	w0, w0, 128
	cmp	w0, 255
	bls	.L2633
	ldr	x1, .LC814
	mov	w0, w27
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2668
	.p2align 3
.L2636:
	add	x22, x28, x26, lsl 3
	add	x26, x26, 1
	mov	w20, 1
	mov	w24, 128
	add	x26, x28, x26, lsl 3
	mov	w27, 127
.L2639:
	ldr	x0, [x28, 2336]
	mov	x1, x23
	bl	HEVC_se_v
	add	w5, w0, 128
	cmp	w5, 255
	ldr	x1, .LC820
	bhi	.L2678
	ldr	w5, [x21, 132]
	lsl	w5, w20, w5
	add	w0, w5, w0
	str	w0, [x22, 5348]
	ldr	x0, [x28, 2336]
	bl	HEVC_se_v
	add	w1, w0, 512
	cmp	w1, 1023
	mov	w5, -128
	bhi	.L2679
	ldr	w1, [x22, 5348]
	add	x22, x22, 4
	ldr	w6, [x21, 132]
	lsl	w1, w1, 7
	asr	w1, w1, w6
	sub	w1, w24, w1
	add	w0, w1, w0
	cmp	w0, 127
	csel	w0, w0, w27, le
	cmn	w0, #128
	csel	w0, w0, w5, ge
	str	w0, [x22, 5472]
	cmp	x22, x26
	bne	.L2639
	b	.L2635
	.p2align 3
.L2672:
	ldr	x1, .LC786
	ldr	x0, [x28, 2336]
	bl	HEVC_se_v
	add	w1, w0, 7
	cmp	w1, 14
	bhi	.L2680
	ldr	w1, [x28, 4828]
	add	w0, w0, w1
	str	w0, [x22, 132]
	cmp	w0, 7
	bls	.L2642
	ldr	x1, .LC790
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2668
	.p2align 3
.L2675:
	ldr	x1, .LC806
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2668
.L2676:
	mov	w20, 0
	cbz	w1, .L2600
	.p2align 2
.L2652:
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	add	x1, x29, 240
	add	x2, x1, x20, uxtw 2
	ldr	w1, [x28, 4752]
	add	w20, w20, 1
	cmp	w1, w20
	str	w0, [x2, -64]
	bhi	.L2652
	b	.L2627
.L2673:
	ldr	x1, .LC794
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2668
.L2678:
	ldr	x1, .LC818
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2668
.L2679:
	ldr	x1, .LC822
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2668
.L2677:
	ldr	x1, .LC810
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2668
.L2671:
	ldr	x1, .LC784
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2668
.L2680:
	ldr	x1, .LC788
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2668
	.size	HEVC_DecPredWeightTable, .-HEVC_DecPredWeightTable
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
	.align	3
.LC814:
	.xword	.LC813
	.align	3
.LC816:
	.xword	.LC815
	.align	3
.LC818:
	.xword	.LC817
	.align	3
.LC820:
	.xword	.LC819
	.align	3
.LC822:
	.xword	.LC821
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecSliceSegmentHeader
	.type	HEVC_DecSliceSegmentHeader, %function
HEVC_DecSliceSegmentHeader:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x28, x0
	mov	x0, x30
	add	x24, x28, 4096
	bl	_mcount
	ldr	x2, [x28, 2376]
	mov	w1, 1
	ldr	x0, [x28, 2336]
	ldr	w20, [x2, 24]
	bl	BsGet
	strb	w0, [x24, 576]
	ldr	w22, [x28, 4700]
	sub	w0, w22, #16
	str	w0, [x29, 120]
	cmp	w0, 5
	bls	.L2937
.L2682:
	ldr	x1, .LC824
	ldr	x0, [x28, 2336]
	bl	HEVC_ue_v
	str	w0, [x28, 4708]
	ldr	w4, [x28, 164]
	tbnz	w0, #31, .L2684
	cmp	w0, w4
	bge	.L2684
	mov	x0, x28
	bl	HEVC_VpsSpsPpsCheck
	cbnz	w0, .L2938
	ldr	x0, [x28, 2360]
	mov	w3, 1888
	ldr	w21, [x28, 4708]
	mov	w2, 12660
	ldr	x1, [x28, 2352]
	smaddl	x21, w21, w3, x0
	ldr	w19, [x21, 32]
	ldrb	w0, [x21, 2]
	smaddl	x19, w19, w2, x1
	cbnz	w0, .L2939
.L2690:
	strb	wzr, [x24, 577]
.L2691:
	ldp	w2, w3, [x19, 140]
	cbz	w2, .L2693
	cbz	w3, .L2693
	ldp	w0, w1, [x19, 64]
	add	w0, w2, w0
	add	w1, w3, w1
	sub	w1, w1, #1
	sub	w0, w0, #1
	udiv	w0, w0, w2
	udiv	w2, w1, w3
	ldr	w1, [x19, 172]
	mov	w3, 1
	lsl	w1, w1, 1
	lsl	w23, w3, w1
	mov	w1, 0
	mul	w2, w0, w2
	cmp	w2, 1
	ble	.L2695
	.p2align 2
.L2696:
	add	w1, w1, 1
	lsl	w0, w3, w1
	cmp	w2, w0
	bgt	.L2696
.L2695:
	ldrb	w0, [x24, 576]
	str	wzr, [x29, 124]
	cbz	w0, .L2940
.L2697:
	ldr	w0, [x28, 192]
	str	w0, [x28, 4684]
	ldrb	w0, [x24, 577]
	cbz	w0, .L2941
.L2700:
	ldr	w0, [x21, 12]
	tst	w0, 16776960
	bne	.L2790
.L2797:
	ldrb	w0, [x21, 23]
	cbnz	w0, .L2942
.L2792:
	ldr	w0, [x29, 124]
	cbnz	w0, .L2943
	ldrb	w0, [x28, 3]
	cbz	w0, .L2806
	ldr	w0, [x29, 120]
	cmp	w0, 5
	bhi	.L2807
	ldr	w0, [x28, 4704]
	mov	w2, 1
	add	x1, x28, x0
	strb	w2, [x1, 5]
.L2808:
	ldr	w1, [x28, 4684]
	cmp	w1, wzr
	ldr	w1, [x29, 120]
	ccmp	w1, 5, 2, ne
	bhi	.L2809
	ldr	w1, [x28, 4700]
	add	x0, x28, x0
	cmp	w1, 21
	beq	.L2944
	.p2align 2
.L2928:
	strb	wzr, [x0, 4]
.L2811:
	mov	x0, x28
	bl	HEVC_IsNewPic
	str	w0, [x28, 4824]
	mov	x0, x28
	bl	HEVC_ReadByteAlignment
	cmp	w0, wzr
	csetm	w0, ne
.L2921:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2939:
	ldrb	w0, [x24, 576]
	cbnz	w0, .L2690
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x24, 577]
	b	.L2691
	.p2align 3
.L2941:
	ldr	w0, [x21, 36]
	mov	w23, 0
	cbz	w0, .L2705
	.p2align 2
.L2886:
	ldr	x0, [x28, 2336]
	mov	w1, 1
	add	w23, w23, w1
	bl	BsGet
	ldr	w0, [x21, 36]
	cmp	w0, w23
	bhi	.L2886
.L2705:
	ldr	x1, .LC835
	ldr	x0, [x28, 2336]
	bl	HEVC_ue_v
	cmp	w0, 2
	str	w0, [x28, 4692]
	bhi	.L2945
	ldrb	w0, [x21, 4]
	cbnz	w0, .L2946
	sub	w22, w22, #19
	cmp	w22, 1
	bls	.L2707
.L2976:
	ldrb	w0, [x28, 1]
	cbz	w0, .L2947
	ldr	w1, [x19, 116]
	mov	w2, 1
	ldr	w0, [x28, 188]
	lsl	w1, w2, w1
	mov	w2, w1
	str	w2, [x29, 112]
	udiv	w1, w0, w1
	msub	w1, w1, w2, w0
	sub	w0, w0, w1
	cbnz	w1, .L2812
	str	wzr, [x29, 116]
.L2710:
	ldr	w1, [x28, 4700]
	add	x20, x28, x20, uxtw 2
	sub	w1, w1, #16
	cmp	w1, 2
	ldr	w1, [x29, 116]
	csel	w0, w0, wzr, hi
	add	w3, w0, w1
	str	w3, [x28, 4684]
	ldr	w2, [x20, 212]
	cmp	w3, w2
	bge	.L2712
	ldrb	w0, [x24, 576]
	cmp	w0, 1
	beq	.L2948
.L2712:
	ldr	w0, [x28, 4696]
	str	w3, [x28, 192]
	cbnz	w0, .L2713
	ldr	w0, [x28, 4700]
	cmp	w0, 15
	bhi	.L2714
	mov	w1, 1
	tbz	x0, 0, .L2714
.L2715:
	sub	w0, w0, #7
	tst	w0, -3
	cset	w0, ne
	tst	w1, w0
	beq	.L2713
	str	w3, [x28, 188]
	.p2align 2
.L2713:
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L2716
	ldr	w3, [x19, 176]
	mov	w1, 0
	mov	w2, 1
	mov	w0, 0
	cmp	w3, 1
	bls	.L2718
	.p2align 2
.L2885:
	add	w1, w1, 1
	lsl	w0, w2, w1
	cmp	w0, w3
	bcc	.L2885
	mov	w0, 0
	cbnz	w1, .L2949
.L2721:
	sxtw	x4, w0
	mov	x2, 164
	lsl	x1, x4, 2
	add	x0, x24, 1508
	sub	x1, x1, x4
	lsl	x3, x1, 3
	sub	x1, x3, x1
	lsl	x1, x1, 1
	sub	x1, x1, x4
	add	x1, x19, x1, lsl 2
	add	x1, x1, 2164
	bl	memcpy
	str	x0, [x29, 104]
.L2719:
	ldrb	w0, [x19, 8]
	cbz	w0, .L2723
	ldr	w0, [x19, 180]
	ldr	w1, [x24, 1512]
	ldr	w20, [x28, 5604]
	add	w20, w20, w1
	cbnz	w0, .L2950
	mov	w25, 0
	str	wzr, [x29, 140]
.L2724:
	ldr	x1, .LC849
	ldr	x0, [x28, 2336]
	bl	HEVC_ue_v
	ldr	w3, [x24, 1512]
	add	x1, x24, 1508
	ldr	w2, [x28, 5604]
	add	w0, w0, w25
	mov	w4, w0
	add	w0, w2, w3
	add	w0, w0, w4
	str	w4, [x29, 136]
	cmp	w0, 16
	bhi	.L2951
	ldr	w2, [x29, 136]
	mov	w23, 0
	mov	w27, 0
	add	w0, w20, w2
	str	w0, [x29, 100]
	sub	w22, w0, #1
	cbz	w2, .L2740
	str	x1, [x29, 128]
	b	.L2884
	.p2align 3
.L2954:
	ldr	w1, [x29, 140]
	cbnz	w1, .L2952
.L2731:
	sxtw	x0, w0
	ldr	x1, [x29, 128]
	add	x4, x19, x0
	add	x1, x1, x26
	add	x0, x19, x0, lsl 2
	ldrb	w4, [x4, 13]
	ldr	w20, [x0, 196]
	strb	w4, [x1, 12]
	mov	w1, 1
	ldr	x0, [x28, 2336]
	bl	BsGet
	uxtb	w0, w0
	cmp	w27, wzr
	add	x1, x28, x26, lsl 2
	ccmp	w27, w25, 4, ne
	cbnz	w0, .L2953
.L2735:
	str	w20, [x1, 5704]
	csel	w23, w23, wzr, ne
	str	wzr, [x1, 4760]
	ldr	w0, [x28, 4684]
	sub	w20, w20, w0
	str	w20, [x1, 5636]
.L2737:
	ldr	w0, [x29, 136]
	add	w27, w27, 1
	sub	w22, w22, #1
	cmp	w0, w27
	beq	.L2740
.L2884:
	cmp	w27, w25
	uxtw	x26, w22
	mov	w0, 0
	bcc	.L2954
	ldr	w1, [x19, 120]
	uxtw	x26, w22
	ldr	x0, [x28, 2336]
	bl	BsGet
	mov	w20, w0
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x1, [x29, 128]
	add	x1, x1, x26
	strb	w0, [x1, 12]
	mov	w1, 1
	ldr	x0, [x28, 2336]
	bl	BsGet
	uxtb	w0, w0
	cmp	w27, wzr
	add	x1, x28, x26, lsl 2
	ccmp	w27, w25, 4, ne
	cbz	w0, .L2735
.L2953:
	ldr	x1, .LC855
	ldr	x0, [x28, 2336]
	bl	HEVC_ue_v
	add	w23, w23, w0
	add	x3, x28, x26, lsl 2
	cmp	w27, wzr
	ccmp	w27, w25, 4, ne
	mov	w1, 1
	str	w1, [x3, 4760]
	cset	w1, eq
	cmp	w1, wzr
	csel	w23, w23, w0, eq
	ldr	w0, [x29, 112]
	ldr	w1, [x28, 4684]
	msub	w20, w23, w0, w20
	ldr	w0, [x29, 116]
	sub	w0, w1, w0
	add	w20, w20, w0
	str	w20, [x3, 5704]
	sub	w20, w20, w1
	str	w20, [x3, 5636]
	b	.L2737
	.p2align 3
.L2943:
	ldr	w0, [x28, 4704]
	add	x1, x28, x0
	ldrb	w1, [x1, 5]
	cbnz	w1, .L2808
.L2809:
	add	x0, x28, x0
	b	.L2928
	.p2align 3
.L2937:
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	b	.L2682
	.p2align 3
.L2940:
	ldr	x0, [x28, 2336]
	bl	BsGet
	str	w0, [x28, 4712]
	ldp	w1, w3, [x19, 188]
	mul	w3, w1, w3
	tbnz	w0, #31, .L2699
	cmp	w3, w0
	bls	.L2699
	mul	w0, w23, w0
	str	w0, [x29, 124]
	b	.L2697
	.p2align 3
.L2790:
	ldr	x1, .LC907
	ldr	x0, [x28, 2336]
	bl	HEVC_ue_v
	mov	w20, w0
	ldr	w0, [x21, 12]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L2955
	cmp	w0, 256
	ldr	w0, [x21, 68]
	beq	.L2956
	ldr	w1, [x19, 192]
	mul	w0, w0, w1
	sub	w0, w0, #1
.L2794:
	cmp	w0, 255
	mov	w1, 255
	csel	w3, w0, w1, ls
	cmp	w20, w3
	bhi	.L2957
	cbz	w20, .L2797
	ldr	x1, .LC911
	mov	w19, 0
	ldr	x0, [x28, 2336]
	bl	HEVC_ue_v
	cmp	w0, 31
	add	w22, w0, 1
	bhi	.L2958
	.p2align 2
.L2883:
	ldr	x0, [x28, 2336]
	mov	w1, w22
	add	w19, w19, 1
	bl	BsGet
	cmp	w20, w19
	bne	.L2883
	ldrb	w0, [x21, 23]
	cbz	w0, .L2792
.L2942:
	ldr	x1, .LC915
	ldr	x0, [x28, 2336]
	bl	HEVC_ue_v
	cmp	w0, 256
	mov	w20, w0
	bhi	.L2959
	ldr	x0, [x28, 2336]
	bl	BsResidBits
	cmp	w20, w0
	bhi	.L2803
	mov	w19, 0
	cbz	w20, .L2792
	.p2align 2
.L2882:
	ldr	x0, [x28, 2336]
	mov	w1, 8
	add	w19, w19, 1
	bl	BsGet
	cmp	w20, w19
	bne	.L2882
	b	.L2792
	.p2align 3
.L2806:
	ldr	w0, [x29, 120]
	cmp	w0, 5
	bhi	.L2807
	ldr	w0, [x28, 4704]
	add	x1, x28, x0
	add	x0, x28, x0
	strb	wzr, [x1, 5]
	b	.L2928
	.p2align 3
.L2812:
	ldr	w2, [x29, 112]
	str	wzr, [x29, 116]
	cmp	w1, w2, lsr 1
	bcc	.L2710
.L2820:
	ldr	w1, [x29, 112]
	add	w0, w0, w1
	b	.L2710
.L2955:
	ldr	w0, [x19, 192]
	sub	w0, w0, #1
	b	.L2794
	.p2align 3
.L2714:
	sub	w1, w0, #16
	cmp	w1, 7
	cset	w1, ls
	b	.L2715
	.p2align 3
.L2952:
	ldr	x0, [x28, 2336]
	bl	BsGet
	ldr	w4, [x19, 180]
	sub	w4, w4, #1
	tbnz	w0, #31, .L2733
	cmp	w4, w0
	bcs	.L2731
.L2733:
	ldr	x1, .LC853
	mov	w3, w0
	mov	w2, w27
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
	.p2align 3
.L2740:
	ldr	w0, [x29, 100]
	str	w0, [x24, 1516]
	cmp	w0, 16
	bhi	.L2960
.L2723:
	ldrb	w0, [x19, 9]
	cbnz	w0, .L2961
	strb	wzr, [x24, 580]
.L2742:
	ldrb	w0, [x19, 6]
	cbz	w0, .L2814
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x24, 578]
	mov	w1, 1
	ldr	x0, [x28, 2336]
	bl	BsGet
	strb	w0, [x24, 579]
.L2814:
	ldr	w0, [x28, 4692]
	cmp	w0, 2
	bne	.L2962
.L2744:
	ldrb	w0, [x24, 580]
	cbnz	w0, .L2963
.L2766:
	mov	w4, 2
.L2773:
	ldrb	w0, [x21, 11]
	cbz	w0, .L2764
	cbnz	w4, .L2764
.L2776:
	mov	x0, x28
	bl	HEVC_DecPredWeightTable
	cbnz	w0, .L2964
	ldr	w4, [x28, 4692]
.L2764:
	cmp	w4, 2
	beq	.L2777
	ldr	x1, .LC879
	ldr	x0, [x28, 2336]
	bl	HEVC_ue_v
	mov	w3, 4
	mov	w1, 5
	sub	w3, w3, w0
	sub	w2, w1, w0
	cmp	w3, 4
	str	w2, [x28, 4720]
	bhi	.L2965
.L2777:
	ldr	x1, .LC883
	ldr	x0, [x28, 2336]
	bl	HEVC_se_v
	ldr	w2, [x21, 48]
	mov	w1, 51
	add	w0, w0, w2
	str	w0, [x28, 4688]
	ldr	w3, [x19, 92]
	neg	w2, w3
	cmp	w0, w2
	ccmp	w0, w1, 0, ge
	bgt	.L2966
	ldrb	w0, [x21, 9]
	cbnz	w0, .L2967
.L2779:
	ldrb	w0, [x21, 18]
	cbz	w0, .L2927
	ldrb	w0, [x21, 19]
	cbnz	w0, .L2968
.L2785:
	ldrb	w0, [x21, 20]
	strb	w0, [x24, 585]
	ldr	w1, [x21, 76]
	str	w1, [x28, 4732]
	ldr	w1, [x21, 80]
	str	w1, [x28, 4736]
.L2784:
	ldrb	w2, [x19, 6]
	mov	w1, 0
	cbz	w2, .L2788
	ldrh	w1, [x28, 4674]
	cmp	w1, wzr
	cset	w1, ne
.L2788:
	ldrb	w2, [x21, 17]
	cbz	w2, .L2789
	cmp	w0, wzr
	cset	w0, eq
	orr	w1, w0, w1
	cbnz	w1, .L2969
.L2789:
	strb	w2, [x24, 586]
	b	.L2700
	.p2align 3
.L2962:
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x24, 581]
	cbnz	w0, .L2970
	ldr	w0, [x21, 40]
	ldr	w4, [x28, 4692]
	str	w0, [x28, 4748]
	cbnz	w4, .L2752
	ldr	w0, [x21, 44]
	mov	w20, 0
	mov	w22, 0
	str	w0, [x28, 4752]
.L2750:
	ldr	x0, [x29, 104]
	cbz	x0, .L2971
	ldr	x0, [x29, 104]
	ldr	w2, [x0, 8]
	cmp	w2, 16
	bhi	.L2754
	cbz	w2, .L2756
	ldr	x0, [x29, 104]
	sub	w2, w2, #1
	add	x2, x2, 13
	mov	w3, 0
	add	x2, x0, x2
	add	x0, x0, 12
	.p2align 2
.L2758:
	ldrb	w1, [x0], 1
	cmp	w1, wzr
	csinc	w3, w3, w3, eq
	cmp	x2, x0
	bne	.L2758
	ldrb	w0, [x21, 22]
	cmp	w0, wzr
	ccmp	w3, 1, 4, ne
	ble	.L2756
	add	x2, x24, 1672
	add	x1, x24, 576
	mov	x0, x28
	bl	HEVC_DecRefPicListsModification
	cbnz	w0, .L2923
	ldr	w4, [x28, 4692]
	cbnz	w4, .L2759
.L2817:
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x24, 582]
	ldr	w4, [x28, 4692]
.L2759:
	cmp	w4, 2
	beq	.L2744
.L2818:
	ldrb	w0, [x21, 5]
	cbnz	w0, .L2972
.L2760:
	ldrb	w0, [x24, 580]
	cbz	w0, .L2769
	cbz	w4, .L2973
	mov	w0, 1
	cmp	w4, 2
	strb	w0, [x24, 584]
	beq	.L2766
.L2765:
	ldr	w0, [x28, 4748]
	cmp	w0, 1
	bls	.L2926
.L2768:
	ldr	x1, .LC873
	ldr	x0, [x28, 2336]
	bl	HEVC_ue_v
	str	w0, [x28, 4716]
	ldrb	w2, [x24, 584]
	cbnz	w2, .L2974
	sub	w4, w20, #1
.L2771:
	cmp	w4, w0
	ccmp	w0, wzr, 1, cs
	bge	.L2926
	ldr	x1, .LC875
	mov	w3, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
	.p2align 3
.L2926:
	ldr	w4, [x28, 4692]
.L2769:
	ldrb	w0, [x21, 10]
	cbz	w0, .L2773
	cmp	w4, 1
	bne	.L2773
	b	.L2776
	.p2align 3
.L2807:
	ldr	w0, [x28, 4704]
	add	x0, x28, x0
	b	.L2928
.L2968:
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L2785
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x24, 585]
	cbnz	w0, .L2784
	ldr	x1, .LC899
	ldr	x0, [x28, 2336]
	bl	HEVC_se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x28, 4732]
	bhi	.L2975
.L2786:
	ldr	x1, .LC903
	ldr	x0, [x28, 2336]
	bl	HEVC_se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x28, 4736]
	bls	.L2927
	ldr	x1, .LC905
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x21, 80]
	str	w0, [x28, 4736]
	.p2align 2
.L2927:
	ldrb	w0, [x24, 585]
	b	.L2784
	.p2align 3
.L2756:
	cbnz	w4, .L2818
	b	.L2817
	.p2align 3
.L2946:
	ldr	x0, [x28, 2336]
	mov	w1, 1
	sub	w22, w22, #19
	bl	BsGet
	cmp	w22, 1
	bhi	.L2976
.L2707:
	ldr	w0, [x28, 4696]
	str	wzr, [x28, 192]
	str	wzr, [x28, 4684]
	cbnz	w0, .L2743
	str	wzr, [x28, 188]
.L2743:
	ldrb	w0, [x19, 6]
	cbnz	w0, .L2977
.L2816:
	strb	wzr, [x24, 580]
	str	xzr, [x29, 104]
	b	.L2814
	.p2align 3
.L2684:
	ldr	x2, .LC825
	mov	w3, w0
	ldr	x1, .LC827
	mov	w0, 1
	add	x2, x2, 160
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
	.p2align 3
.L2967:
	ldr	x1, .LC887
	ldr	x0, [x28, 2336]
	bl	HEVC_se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x28, 4724]
	bhi	.L2978
	ldr	w3, [x21, 60]
	add	w1, w0, w3
	add	w1, w1, 12
	cmp	w1, 24
	bhi	.L2979
	ldr	x1, .LC893
	ldr	x0, [x28, 2336]
	bl	HEVC_se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x28, 4728]
	bhi	.L2980
	ldr	w1, [x21, 64]
	add	w2, w0, w1
	add	w0, w2, 12
	cmp	w0, 24
	bls	.L2779
	ldr	x1, .LC897
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
	.p2align 3
.L2947:
	ldr	w1, [x19, 120]
	ldr	x0, [x28, 2336]
	bl	BsGet
	mov	w4, w0
	ldr	w0, [x19, 116]
	mov	w1, 1
	lsl	w1, w1, w0
	ldr	w0, [x28, 188]
	mov	w3, w1
	stp	w3, w4, [x29, 112]
	udiv	w1, w0, w1
	msub	w1, w1, w3, w0
	cmp	w4, w1
	sub	w0, w0, w1
	bcc	.L2981
.L2709:
	ldr	w2, [x29, 116]
	cmp	w2, w1
	bls	.L2710
	sub	w1, w2, w1
	ldr	w2, [x29, 112]
	cmp	w1, w2, lsr 1
	sub	w1, w0, w2
	csel	w0, w1, w0, hi
	b	.L2710
	.p2align 3
.L2716:
	ldr	w3, [x19, 176]
	add	x2, x24, 1508
	mov	x1, x19
	mov	x0, x28
	str	x2, [x29, 104]
	bl	HEVC_DecShortTermRefPicSet
	cbz	w0, .L2719
	ldr	x1, .LC841
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
	.p2align 3
.L2949:
	ldr	x0, [x28, 2336]
	bl	BsGet
	ldr	w3, [x19, 176]
	tbnz	w0, #31, .L2982
.L2718:
	sub	w3, w3, #1
	cmp	w3, w0
	bcs	.L2721
.L2722:
	ldr	x1, .LC843
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2972:
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x24, 583]
	ldr	w4, [x28, 4692]
	b	.L2760
.L2961:
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x24, 580]
	b	.L2742
.L2752:
	mov	w22, 0
	str	wzr, [x28, 4752]
.L2751:
	cmp	w4, 2
	beq	.L2744
	mov	w20, 0
	b	.L2750
.L2970:
	ldr	x1, .LC859
	ldr	x0, [x28, 2336]
	bl	HEVC_ue_v
	add	w22, w0, 1
	cmp	w22, 16
	bhi	.L2983
	ldr	w4, [x28, 4692]
	str	w22, [x28, 4748]
	cbz	w4, .L2984
	str	wzr, [x28, 4752]
	b	.L2751
.L2963:
	mov	w0, 1
	mov	w4, 2
	strb	w0, [x24, 584]
	b	.L2769
.L2969:
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x24, 586]
	b	.L2700
.L2981:
	sub	w2, w1, w4
	cmp	w2, w3, lsr 1
	bcc	.L2709
	b	.L2820
	.p2align 3
.L2974:
	sub	w4, w22, #1
	b	.L2771
.L2944:
	mov	w1, 1
	strb	w1, [x0, 4]
	b	.L2811
.L2984:
	ldr	x1, .LC863
	ldr	x0, [x28, 2336]
	bl	HEVC_ue_v
	add	w20, w0, 1
	cmp	w20, 16
	bhi	.L2985
	ldr	w4, [x28, 4692]
	str	w20, [x28, 4752]
	cmp	w4, 2
	bne	.L2750
	b	.L2744
	.p2align 3
.L2959:
	ldr	x1, .LC917
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2960:
	ldr	x1, .LC857
	mov	w3, 16
	ldr	w2, [x29, 100]
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2982:
	sub	w3, w3, #1
	b	.L2722
	.p2align 3
.L2973:
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x24, 584]
	ldr	w4, [x28, 4692]
	cmp	w4, 2
	beq	.L2777
	cbnz	w0, .L2765
	ldr	w0, [x28, 4752]
	cmp	w0, 1
	bhi	.L2768
	b	.L2769
.L2693:
	ldr	x1, .LC831
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2956:
	ldr	w1, [x21, 72]
	mul	w0, w0, w1
	sub	w0, w0, #1
	b	.L2794
.L2950:
	ldr	x1, .LC845
	ldr	x0, [x28, 2336]
	bl	HEVC_ue_v
	mov	w25, w0
	ldr	w3, [x19, 180]
	cmp	w0, w3
	bhi	.L2986
	cmp	w3, 1
	str	wzr, [x29, 140]
	bls	.L2724
	mov	w1, 1
	.p2align 2
.L2726:
	ldr	w0, [x29, 140]
	add	w0, w0, 1
	str	w0, [x29, 140]
	lsl	w0, w1, w0
	cmp	w3, w0
	bhi	.L2726
	b	.L2724
.L2938:
	ldr	w0, [x28, 236]
	cbz	w0, .L2688
	ldr	w0, [x28, 192]
	str	w0, [x28, 4684]
.L2689:
	mov	x0, x28
	bl	HEVC_IsNewPic
	str	w0, [x28, 4824]
	ldr	x1, .LC829
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2948:
	ldr	x1, .LC839
	bl	dprint_vfmw
	ldr	w3, [x28, 4684]
	b	.L2712
.L2966:
	ldr	x1, .LC885
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2688:
	str	wzr, [x28, 4684]
	b	.L2689
.L2977:
	ldr	x0, [x28, 2336]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x24, 578]
	mov	w1, 1
	ldr	x0, [x28, 2336]
	bl	BsGet
	strb	w0, [x24, 579]
	b	.L2816
.L2699:
	ldr	x1, .LC833
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2945:
	ldr	x1, .LC837
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2754:
	ldr	x1, .LC869
	mov	w3, 16
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2957:
	ldr	x1, .LC909
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2975:
	ldr	x1, .LC901
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x21, 76]
	str	w0, [x28, 4732]
	b	.L2786
.L2803:
	ldr	x1, .LC919
	mov	w2, w0
	mov	w3, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2979:
	ldr	x1, .LC891
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2965:
	ldr	x1, .LC881
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2951:
	ldr	x1, .LC851
	mov	w5, 16
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2978:
	ldr	x1, .LC889
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2980:
	ldr	x1, .LC895
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2964:
	ldr	x1, .LC877
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2986:
	ldr	x1, .LC847
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2923:
	ldr	x1, .LC871
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2958:
	ldr	x1, .LC913
	mov	w2, w22
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2983:
	ldr	x1, .LC861
	mov	w3, 16
	mov	w2, w22
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2971:
	ldr	x1, .LC867
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
.L2985:
	ldr	x1, .LC865
	mov	w3, 16
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2921
	.size	HEVC_DecSliceSegmentHeader, .-HEVC_DecSliceSegmentHeader
	.align	3
.LC824:
	.xword	.LC823
	.align	3
.LC825:
	.xword	.LANCHOR3
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
.LC847:
	.xword	.LC846
	.align	3
.LC849:
	.xword	.LC848
	.align	3
.LC851:
	.xword	.LC850
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
.LC861:
	.xword	.LC860
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
	.align	3
.LC871:
	.xword	.LC870
	.align	3
.LC873:
	.xword	.LC872
	.align	3
.LC875:
	.xword	.LC874
	.align	3
.LC877:
	.xword	.LC876
	.align	3
.LC879:
	.xword	.LC878
	.align	3
.LC881:
	.xword	.LC880
	.align	3
.LC883:
	.xword	.LC882
	.align	3
.LC885:
	.xword	.LC884
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
.LC893:
	.xword	.LC892
	.align	3
.LC895:
	.xword	.LC894
	.align	3
.LC897:
	.xword	.LC896
	.align	3
.LC899:
	.xword	.LC898
	.align	3
.LC901:
	.xword	.LC900
	.align	3
.LC903:
	.xword	.LC902
	.align	3
.LC905:
	.xword	.LC904
	.align	3
.LC907:
	.xword	.LC906
	.align	3
.LC909:
	.xword	.LC908
	.align	3
.LC911:
	.xword	.LC910
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
.LC919:
	.xword	.LC918
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_FrameStoreRefFlg
	.type	HEVC_FrameStoreRefFlg, %function
HEVC_FrameStoreRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 1]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_FrameStoreRefFlg, .-HEVC_FrameStoreRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ClearCurrSlice
	.type	HEVC_ClearCurrSlice, %function
HEVC_ClearCurrSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19, 2376]
	cbz	x1, .L2989
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
.L2989:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_ClearCurrSlice, .-HEVC_ClearCurrSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ClearCurrNal
	.type	HEVC_ClearCurrNal, %function
HEVC_ClearCurrNal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	HEVC_ClearCurrSlice
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_ClearCurrNal, .-HEVC_ClearCurrNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ClearAllSlice
	.type	HEVC_ClearAllSlice, %function
HEVC_ClearAllSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 0
	bl	_mcount
	ldr	w2, [x20, 168]
	cbz	w2, .L2998
	.p2align 2
.L3001:
	ldr	x0, [x20, 2416]
	ldr	x0, [x0, w19, uxtw 3]
	mov	x1, x0
	cbz	x0, .L2996
	ldr	w0, [x20, 252]
	bl	HEVC_ReleaseNAL
	ldr	x0, [x20, 2416]
	str	xzr, [x0, w19, uxtw 3]
	ldr	w2, [x20, 168]
.L2996:
	add	w19, w19, 1
	cmp	w2, w19
	bhi	.L3001
.L2998:
	strb	wzr, [x20, 11]
	mov	w0, 2
	str	wzr, [x20, 204]
	str	w0, [x20, 176]
	mov	w0, 0
	str	wzr, [x20, 236]
	str	wzr, [x20, 244]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_ClearAllSlice, .-HEVC_ClearAllSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InitDPB
	.type	HEVC_InitDPB, %function
HEVC_InitDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w22, w1
	add	x19, x20, 2792
	bl	_mcount
	add	x21, x20, 2928
	mov	x0, x20
	bl	HEVC_ClearAllSlice
	.p2align 2
.L3010:
	ldr	x0, [x19]
	mov	w2, 1
	cbz	x0, .L3006
	ldr	w1, [x0, 28]
	ldr	w0, [x20, 252]
	bl	FSP_ClearLogicFs
.L3006:
	ldr	x0, [x19, 136]
	mov	w2, 1
	cbz	x0, .L3007
	ldr	w1, [x0, 28]
	ldr	w0, [x20, 252]
	bl	FSP_ClearLogicFs
.L3007:
	ldr	x0, [x19, 272]
	mov	w2, 1
	cbz	x0, .L3008
	ldr	w1, [x0, 28]
	ldr	w0, [x20, 252]
	bl	FSP_ClearLogicFs
.L3008:
	ldr	x0, [x19, 408]
	mov	w2, 1
	cbz	x0, .L3009
	ldr	w1, [x0, 28]
	ldr	w0, [x20, 252]
	bl	FSP_ClearLogicFs
.L3009:
	str	xzr, [x19, 136]
	str	xzr, [x19, 272]
	str	xzr, [x19, 408]
	str	xzr, [x19], 8
	cmp	x19, x21
	bne	.L3010
	ldr	x0, [x20, 2400]
	ldr	w0, [x0, 184]
	add	w0, w0, 1
	str	w0, [x20, 2768]
	cmp	w0, 17
	bhi	.L3049
.L3011:
	ldr	x1, .LC922
	add	x4, x20, 2560
	add	x0, x20, 12288
	mov	x2, 200
	add	x0, x0, 968
	ldr	x3, [x1, 96]
	mov	w1, 0
	stp	wzr, wzr, [x4, 212]
	stp	wzr, wzr, [x4, 220]
	str	wzr, [x20, 2788]
	blr	x3
	str	wzr, [x20, 13260]
	mov	w0, 16
	add	x1, x20, 2456
	str	w0, [x20, 13256]
	add	x0, x20, 2592
	.p2align 2
.L3012:
	str	xzr, [x1], 8
	cmp	x0, x1
	bne	.L3012
	add	x1, x20, 2728
	str	wzr, [x20, 4740]
	.p2align 2
.L3013:
	str	xzr, [x0], 8
	cmp	x0, x1
	bne	.L3013
	str	wzr, [x20, 4744]
	cbnz	w22, .L3014
	ldr	x0, [x20, 2432]
	ldr	w0, [x0, 992]
	cmp	w0, 1
	beq	.L3014
.L3015:
	ldr	w0, [x20, 184]
	cbz	w0, .L3024
	sub	w1, w0, #1
	add	x0, x20, 2144
	add	x1, x1, 537
	add	x1, x20, x1, lsl 2
	.p2align 2
.L3023:
	str	wzr, [x0], 4
	cmp	x1, x0
	bne	.L3023
.L3024:
	ldr	w2, [x20, 168]
	mov	w19, 0
	cbz	w2, .L3022
	.p2align 2
.L3038:
	ldr	x0, [x20, 2416]
	uxtw	x21, w19
	ldr	x0, [x0, w19, uxtw 3]
	add	w19, w19, 1
	mov	x1, x0
	cbz	x0, .L3025
	ldr	x3, [x20, 2376]
	cmp	x0, x3
	beq	.L3025
	ldr	w0, [x20, 252]
	bl	HEVC_ReleaseNAL
	ldr	x0, [x20, 2416]
	str	xzr, [x0, x21, lsl 3]
	ldr	w2, [x20, 168]
.L3025:
	cmp	w2, w19
	bhi	.L3038
.L3022:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3014:
	mov	w19, 20
	mov	x0, x20
	stp	w19, w19, [x20, 180]
	bl	HEVC_ArrangeMem
	cbz	w0, .L3016
	cmp	w0, 2
	beq	.L3050
	ldr	x2, .LC920
	mov	w0, 0
	ldr	x1, .LC924
	add	x2, x2, 192
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3049:
	ldr	x2, .LC920
	mov	w4, 17
	ldr	x1, .LC921
	mov	w3, w4
	add	x2, x2, 192
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 17
	str	w0, [x20, 2768]
	b	.L3011
.L3016:
	ldr	w0, [x20, 252]
	bl	FSP_GetTotalValidFsNum
	cmp	w0, 20
	mov	w0, w19
	ble	.L3051
	str	w0, [x20, 180]
	b	.L3015
.L3050:
	add	x0, x20, 4096
	add	x0, x0, 1936
	bl	ResetVoQueue
	mov	w0, -2
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L3051:
	ldr	w0, [x20, 252]
	bl	FSP_GetTotalValidFsNum
	str	w0, [x20, 180]
	b	.L3015
	.size	HEVC_InitDPB, .-HEVC_InitDPB
	.align	3
.LC920:
	.xword	.LANCHOR3
	.align	3
.LC921:
	.xword	.LC355
	.align	3
.LC922:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC924:
	.xword	.LC923
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ClearAllNal
	.type	HEVC_ClearAllNal, %function
HEVC_ClearAllNal:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 0
	mov	w21, 104
	bl	_mcount
	ldr	w2, [x20, 168]
	cmn	w2, #1
	bne	.L3057
	b	.L3056
	.p2align 3
.L3054:
	add	w0, w2, 1
	cmp	w0, w19
	bls	.L3056
.L3057:
	umull	x1, w19, w21
	ldr	x0, [x20, 2424]
	add	w19, w19, 1
	add	x1, x0, x1
	ldr	w0, [x1, 32]
	cmp	w0, 1
	bne	.L3054
	ldr	w0, [x20, 252]
	bl	HEVC_ReleaseNAL
	ldr	w2, [x20, 168]
	add	w0, w2, 1
	cmp	w0, w19
	bhi	.L3057
.L3056:
	strb	wzr, [x20, 7]
	mov	w0, 0
	str	wzr, [x20, 148]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_ClearAllNal, .-HEVC_ClearAllNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InitDecPara
	.type	HEVC_InitDecPara, %function
HEVC_InitDecPara:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x23, x20, 4096
	add	x25, x20, 12288
	bl	_mcount
	add	x19, x25, 1168
	ldr	x1, .LC926
	mov	w0, 22
	mov	w21, 0
	mov	w26, 20
	mov	w24, 16
	bl	dprint_vfmw
	strb	wzr, [x20, 4]
	mov	w0, -2147483647
	mov	w2, 1
	mov	w1, 2147483647
	strb	w2, [x20, 5]
	stp	w1, w0, [x20, 228]
	str	w0, [x20, 212]
	mov	x0, x20
	strb	wzr, [x20, 10]
	bl	HEVC_ClearAllNal
	add	x0, x23, 1936
	bl	ResetVoQueue
	ldr	x22, .LC927
	.p2align 2
.L3061:
	strb	wzr, [x19]
	add	x0, x19, 80
	strb	wzr, [x19, 1]
	mov	x2, 640
	strb	wzr, [x19, 2]
	mov	w1, 0
	str	wzr, [x19, 8]
	stp	w26, w24, [x19, 20]
	str	wzr, [x19, 48]
	ldr	x3, [x22, 96]
	blr	x3
	str	w21, [x19, 228]
	add	w21, w21, 1
	str	wzr, [x19, 56]
	str	x19, [x19, 72]
	cmp	w21, 20
	add	x19, x19, 720
	bne	.L3061
	add	x0, x20, 2144
	add	x1, x20, 2224
	.p2align 2
.L3062:
	str	wzr, [x0], 4
	cmp	x1, x0
	bne	.L3062
	ldr	w1, [x20, 168]
	mov	w0, 0
	cbz	w1, .L3066
	.p2align 2
.L3068:
	ldr	x1, [x20, 2416]
	str	xzr, [x1, w0, uxtw 3]
	add	w0, w0, 1
	ldr	w1, [x20, 168]
	cmp	w1, w0
	bhi	.L3068
.L3066:
	ldr	x3, [x22, 96]
	mov	w1, 0
	mov	x2, 200
	add	x0, x25, 968
	blr	x3
	mov	w1, 16
	add	x0, x20, 2928
	str	w1, [x20, 13256]
	add	x1, x20, 3064
.L3064:
	str	xzr, [x0, -136]
	add	x0, x0, 8
	str	xzr, [x0, -8]
	str	xzr, [x0, 128]
	str	xzr, [x0, 264]
	cmp	x1, x0
	bne	.L3064
	add	x2, x20, 2560
	mov	w0, 17
	add	x19, x20, 2592
	stp	w0, wzr, [x2, 208]
	stp	wzr, wzr, [x2, 216]
	str	wzr, [x20, 2784]
	add	x0, x20, 2728
	str	wzr, [x20, 2788]
	.p2align 2
.L3067:
	str	xzr, [x19, -136]
	add	x19, x19, 8
	str	xzr, [x19, -8]
	cmp	x19, x0
	bne	.L3067
	ldr	x3, [x22, 96]
	mov	w21, 2
	mov	x2, 1356
	str	w21, [x20, 176]
	mov	w1, 0
	add	x0, x23, 576
	str	wzr, [x20, 204]
	str	wzr, [x20, 236]
	str	wzr, [x20, 244]
	str	xzr, [x20, 2376]
	blr	x3
	strb	wzr, [x20, 6]
	mov	w1, 8
	mov	w3, 1
	stp	w1, w1, [x20, 196]
	add	x1, x20, 2048
	strb	w3, [x20, 3]
	str	wzr, [x20, 172]
	mov	w2, 20
	stp	w2, w2, [x20, 180]
	ldr	x4, [x22, 96]
	mov	w0, 6
	mov	w2, 16
	stp	w0, w21, [x1, 184]
	stp	w0, w0, [x1, 176]
	mov	w1, 64
	str	w2, [x20, 336]
	str	w1, [x20, 340]
	mov	w2, 256
	mov	w1, 1025
	str	w21, [x20, 4692]
	str	w3, [x20, 4824]
	mov	x0, x19
	str	w2, [x20, 344]
	mov	x2, 40
	str	w1, [x20, 348]
	mov	w1, 0
	blr	x4
	str	x19, [x20, 2336]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	HEVC_InitDecPara, .-HEVC_InitDecPara
	.align	3
.LC926:
	.xword	.LC925
	.align	3
.LC927:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ClearCurrPic
	.type	HEVC_ClearCurrPic, %function
HEVC_ClearCurrPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	HEVC_ClearAllSlice
	ldr	x0, [x19, 4024]
	cbz	x0, .L3075
	ldr	w1, [x0, 28]
	mov	w2, 1
	ldr	w0, [x19, 252]
	bl	FSP_ClearLogicFs
	ldr	x0, [x19, 4024]
	str	wzr, [x0, 48]
	str	xzr, [x19, 4024]
.L3075:
	strb	wzr, [x19, 3961]
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_ClearCurrPic, .-HEVC_ClearCurrPic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ClearAll
	.type	HEVC_ClearAll, %function
HEVC_ClearAll:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	mov	w1, 0
	mov	x0, x19
	bl	HEVC_InitDPB
	cbnz	w20, .L3082
	add	x0, x19, 4096
	add	x0, x0, 1936
	bl	ResetVoQueue
	ldr	w0, [x19, 252]
	bl	FSP_EmptyInstance
	mov	x0, x19
	bl	HEVC_InitDecPara
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3082:
	add	x1, x19, 4096
	ldr	w0, [x19, 252]
	add	x1, x1, 1936
	bl	FSP_ClearNotInVoQueue
	mov	x0, x19
	bl	HEVC_InitDecPara
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_ClearAll, .-HEVC_ClearAll
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InitPic
	.type	HEVC_InitPic, %function
HEVC_InitPic:
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
	ldr	w3, [x19, 4708]
	tbnz	w3, #31, .L3100
	ldr	w1, [x19, 164]
	mov	w0, 0
	cmp	w3, w1
	bge	.L3112
	ldr	x1, [x19, 2360]
	mov	w5, 1888
	mov	w0, 12660
	ldr	w2, [x19, 4704]
	ldr	x6, [x19, 2352]
	mov	w21, 1
	smaddl	x27, w3, w5, x1
	add	x2, x19, x2, lsl 2
	ldr	w1, [x19, 272]
	ldr	w22, [x19, 268]
	ldr	w4, [x27, 32]
	ldr	w23, [x19, 276]
	ldr	x7, [x19, 2344]
	smull	x4, w4, w0
	ldr	w0, [x19, 284]
	add	x20, x6, x4
	ldr	w25, [x19, 264]
	ldr	w26, [x19, 280]
	str	w0, [x29, 108]
	ldr	w0, [x20, 48]
	str	w3, [x2, 224]
	str	w1, [x29, 140]
	ldr	w1, [x27, 32]
	str	w1, [x2, 220]
	lsl	x1, x0, 7
	add	x0, x1, x0, lsl 2
	add	x1, x7, x0
	ldr	w0, [x20, 48]
	str	w0, [x2, 216]
	ldr	w0, [x19, 172]
	ldr	w2, [x20, 128]
	cmp	w0, wzr
	ldr	w0, [x20, 64]
	cset	w24, eq
	cmp	w2, w23
	cset	w3, ne
	cmp	w22, w0
	beq	.L3120
.L3085:
	ldr	x0, [x19, 2392]
	orr	w3, w24, w3
	ldr	w2, [x1, 4]
	orr	w28, w3, w21
	ldr	w0, [x0, 4]
	cmp	w2, w0
	beq	.L3121
.L3086:
	ldr	x0, .LC928
	mov	w8, 132
	strb	wzr, [x1, 2]
	mov	x7, -132
	stp	x6, x4, [x29, 112]
	ldr	x9, [x0, 104]
	ldr	w0, [x19, 156]
	ldr	x2, [x19, 2344]
	str	x7, [x29, 128]
	smaddl	x0, w0, w8, x7
	str	w8, [x29, 136]
	add	x0, x2, x0
	mov	x2, 132
	blr	x9
	ldr	x7, [x29, 128]
	ldr	w0, [x19, 156]
	ldr	w8, [x29, 136]
	ldr	x1, [x19, 2344]
	ldp	x6, x4, [x29, 112]
	smaddl	x0, w0, w8, x7
	mov	w7, w28
	add	x0, x1, x0
	str	x0, [x19, 2392]
	ldr	x0, [x19, 2400]
	ldr	w1, [x20, 56]
	ldr	w2, [x0, 56]
	cmp	w2, w1
	beq	.L3122
.L3099:
	ldr	w0, [x0, 184]
	ldr	w1, [x20, 184]
	str	w7, [x29, 136]
	cmp	w1, w0
	mov	x1, x20
	mov	x0, x19
	cset	w28, ne
	bl	HEVC_UpdatePicSPS
	ldr	x0, [x19, 2408]
	ldr	w7, [x29, 136]
	ldr	w1, [x0, 28]
	ldr	w0, [x27, 28]
	cmp	w1, w0
	beq	.L3123
.L3090:
	mov	x0, x19
	mov	x2, x27
	mov	x1, x20
	bl	HEVC_UpdatePicPPS
	ldr	w0, [x19, 280]
	cmp	w26, w0
	mov	w0, 1
	beq	.L3124
.L3092:
	orr	w1, w28, w0
	ldr	x0, [x19, 2400]
	ldr	x3, [x19, 2432]
	ldr	w2, [x0, 96]
	ldr	w0, [x0, 88]
	cmp	w0, w2
	csel	w0, w0, w2, cs
	str	w0, [x3, 1004]
	ldr	w0, [x20, 56]
	cmp	w0, w25
	beq	.L3125
.L3093:
	ldr	w2, [x29, 140]
	mov	w4, w28
	mov	w3, w23
	mov	w1, w22
	mov	x0, x19
	bl	HEVC_GetReRangeFlag
	cbnz	w0, .L3094
	ldr	x0, [x19, 2432]
	ldr	w1, [x0, 992]
	cmp	w1, 1
	beq	.L3094
.L3096:
	str	wzr, [x0, 1008]
.L3095:
	mov	x0, x19
	bl	HEVC_AllocFrameStore
	mov	w20, w0
	cbnz	w0, .L3126
	mov	x0, x19
	bl	HEVC_InitPicInfo
	mov	w0, 0
.L3112:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L3125:
	orr	w0, w24, w21
	orr	w0, w0, w1
	cbnz	w0, .L3093
	ldr	x0, [x19, 2432]
	ldr	w0, [x0, 992]
	cmp	w0, 1
	bne	.L3095
	.p2align 2
.L3094:
	mov	w1, 1
	mov	x0, x19
	bl	HEVC_InitDPB
	cmn	w0, #2
	beq	.L3112
	cbnz	w0, .L3097
	ldr	x0, [x19, 2432]
	b	.L3096
	.p2align 3
.L3100:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, 0
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L3126:
	ldr	x1, .LC932
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L3121:
	ldrb	w0, [x1, 2]
	cmp	w0, wzr
	cset	w0, ne
	orr	w0, w24, w0
	cbnz	w0, .L3086
	ldr	x0, [x19, 2400]
	mov	w7, w28
	ldr	w1, [x20, 56]
	ldr	w2, [x0, 56]
	cmp	w2, w1
	bne	.L3099
.L3122:
	ldrb	w1, [x6, x4]
	cmp	w1, wzr
	cset	w1, ne
	orr	w1, w28, w1
	mov	w28, 0
	cbnz	w1, .L3099
	ldr	x0, [x19, 2408]
	ldr	w1, [x0, 28]
	ldr	w0, [x27, 28]
	cmp	w1, w0
	bne	.L3090
.L3123:
	ldrb	w0, [x27, 1]
	cmp	w0, wzr
	cset	w0, ne
	orr	w7, w7, w0
	cbnz	w7, .L3090
	ldr	w0, [x19, 280]
	cmp	w26, w0
	mov	w0, 1
	bne	.L3092
.L3124:
	ldr	w0, [x19, 284]
	ldr	w1, [x29, 108]
	cmp	w0, w1
	cset	w0, ne
	b	.L3092
	.p2align 3
.L3120:
	ldr	w0, [x20, 68]
	ldr	w2, [x29, 140]
	cmp	w0, w2
	cset	w21, ne
	b	.L3085
.L3097:
	ldr	x1, .LC930
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, 0
	mov	x0, x19
	bl	HEVC_ClearAll
	mov	w0, -1
	b	.L3112
	.size	HEVC_InitPic, .-HEVC_InitPic
	.align	3
.LC928:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC930:
	.xword	.LC929
	.align	3
.LC932:
	.xword	.LC931
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_OutputCurrPic
	.type	HEVC_OutputCurrPic, %function
HEVC_OutputCurrPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x20, [x19, 4024]
	ldr	w0, [x20, 48]
	cmp	w0, 1
	beq	.L3128
	mov	w0, 2
	str	w0, [x20, 48]
.L3128:
	ldr	w0, [x19, 4000]
	mov	x2, 640
	add	x1, x19, 4032
	str	w0, [x20, 16]
	add	x0, x20, 80
	bl	memcpy
	mov	x0, x19
	mov	x1, x20
	bl	HEVC_GetImagePara
	ldrb	w0, [x19, 3960]
	cbnz	w0, .L3139
.L3129:
	add	x1, x20, 28
	mov	x0, x19
	bl	HEVC_OutputFrame.isra.10
	mov	w1, 0
	cbnz	w0, .L3140
.L3130:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3139:
	ldr	w0, [x19, 252]
	mov	w2, 1
	ldr	w1, [x20, 28]
	bl	FSP_SetRef
	b	.L3129
	.p2align 3
.L3140:
	ldr	x2, .LC933
	mov	w0, 0
	ldr	x1, .LC935
	add	x2, x2, 208
	bl	dprint_vfmw
	mov	w1, 1
	mov	x0, x19
	bl	HEVC_ClearAll
	mov	w1, -1
	b	.L3130
	.size	HEVC_OutputCurrPic, .-HEVC_OutputCurrPic
	.align	3
.LC933:
	.xword	.LANCHOR3
	.align	3
.LC935:
	.xword	.LC934
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_FirstFrameFastOut
	.type	HEVC_FirstFrameFastOut, %function
HEVC_FirstFrameFastOut:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	HEVC_OutputCurrPic
	mov	w20, w0
	cbnz	w0, .L3144
	ldr	x0, [x19, 4024]
	mov	w2, 2
	mov	w1, 1
	str	w2, [x0, 52]
	str	w1, [x19, 11896]
	ldr	w0, [x19, 3968]
	ldr	w2, [x19, 3972]
	add	x0, x19, x0, lsl 2
	str	w2, [x0, 212]
	ldr	x0, [x19, 4024]
	strb	w1, [x0, 2]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3144:
	ldr	x2, .LC936
	mov	w0, 1
	ldr	x1, .LC938
	add	x2, x2, 232
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_FirstFrameFastOut, .-HEVC_FirstFrameFastOut
	.align	3
.LC936:
	.xword	.LANCHOR3
	.align	3
.LC938:
	.xword	.LC937
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_OutputFrmToVO
	.type	HEVC_OutputFrmToVO, %function
HEVC_OutputFrmToVO:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L3150
	mov	x1, x19
	mov	x0, x20
	bl	HEVC_GetImagePara
	mov	x1, x19
	mov	x0, x20
	bl	HEVC_CheckFrameStore
	cbz	w0, .L3154
	cmn	w0, #3
	bne	.L3155
.L3149:
	mov	w0, 0
.L3146:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3154:
	add	x1, x19, 28
	mov	x0, x20
	bl	HEVC_OutputFrame.isra.10
	cbz	w0, .L3149
	ldr	x2, .LC939
	mov	w0, 0
	ldr	x1, .LC940
	add	x2, x2, 256
	bl	dprint_vfmw
	mov	w1, 1
	mov	x0, x20
	bl	HEVC_ClearAll
	mov	w0, -1
	b	.L3146
	.p2align 3
.L3155:
	ldr	x1, .LC942
	mov	w3, w0
	mov	w2, 12005
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x19, 228]
	mov	x0, x20
	bl	HEVC_DECRecycleImage
	mov	w0, -1
	b	.L3146
	.p2align 3
.L3150:
	mov	w0, -1
	b	.L3146
	.size	HEVC_OutputFrmToVO, .-HEVC_OutputFrmToVO
	.align	3
.LC939:
	.xword	.LANCHOR3
	.align	3
.LC940:
	.xword	.LC934
	.align	3
.LC942:
	.xword	.LC941
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DirectOutput
	.type	HEVC_DirectOutput, %function
HEVC_DirectOutput:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x19, [x20, 4024]
	mov	w4, 2
	mov	w3, 1
	add	x1, x20, 4032
	mov	x2, 640
	add	x0, x19, 80
	str	w4, [x19, 48]
	strb	wzr, [x19, 1]
	strb	w3, [x19, 2]
	ldr	w3, [x20, 3976]
	str	w3, [x19, 12]
	ldr	w3, [x20, 4000]
	str	w3, [x19, 16]
	bl	memcpy
	str	wzr, [x19, 56]
	ldr	w1, [x19, 28]
	mov	w2, 0
	ldr	w0, [x20, 252]
	bl	FSP_SetRef
	mov	x1, x19
	mov	x0, x20
	bl	HEVC_OutputFrmToVO
	str	wzr, [x19, 48]
	ldr	x3, .LC943
	mov	w21, w0
	mov	x2, 712
	mov	w1, 0
	add	x0, x20, 3960
	ldr	x3, [x3, 96]
	blr	x3
	mov	w0, w21
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_DirectOutput, .-HEVC_DirectOutput
	.align	3
.LC943:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IModeProcess
	.type	HEVC_IModeProcess, %function
HEVC_IModeProcess:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	HEVC_DirectOutput
	ldr	w2, [x19, 184]
	ldr	w1, [x19, 3996]
	cmp	w1, w2
	beq	.L3158
	add	x1, x19, x1, uxtw 2
	str	wzr, [x1, 2144]
	str	w2, [x19, 3996]
.L3158:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IModeProcess, .-HEVC_IModeProcess
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RemoveFrmFullDPB
	.type	HEVC_RemoveFrmFullDPB, %function
HEVC_RemoveFrmFullDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19, 2772]
	cbz	w4, .L3159
	mov	w3, 2147483647
	mov	w20, -1
	mov	w0, 0
	.p2align 2
.L3162:
	add	x1, x19, x0, sxtw 3
	ldr	x1, [x1, 2792]
	ldr	w2, [x1, 8]
	cmp	w2, w3
	bge	.L3161
	ldr	w1, [x1]
	ands	w1, w1, 16776960
	csel	w3, w3, w2, ne
	cmp	w1, wzr
	csel	w20, w20, w0, ne
.L3161:
	add	w0, w0, 1
	cmp	w0, w4
	bne	.L3162
	cmn	w20, #1
	beq	.L3159
	add	x1, x19, x20, sxtw 3
	mov	w3, 1
	mov	x0, x19
	ldr	x2, [x1, 2792]
	strb	w3, [x2, 2]
	ldr	x1, [x1, 2792]
	bl	HEVC_OutputFrmToVO
	mov	w1, w20
	mov	x0, x19
	bl	HEVC_RemoveFrameStoreOutDPB
.L3159:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_RemoveFrmFullDPB, .-HEVC_RemoveFrmFullDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_OutputFrmFromDPB
	.type	HEVC_OutputFrmFromDPB, %function
HEVC_OutputFrmFromDPB:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	mov	w21, 0
	mov	w20, 0
	bl	_mcount
	ldr	w2, [x19, 2772]
	ldr	w26, [x19, 3968]
	cbz	w2, .L3176
	ldr	x0, .LC944
	uxtw	x23, w26
	ldr	x25, .LC946
	add	x23, x23, 52
	add	x24, x0, 280
	b	.L3195
	.p2align 3
.L3173:
	add	w20, w20, 1
	cmp	w2, w20
	bls	.L3202
.L3195:
	add	x22, x19, x20, uxtw 3
	ldr	x0, [x22, 2792]
	ldrb	w1, [x0, 2]
	cbnz	w1, .L3173
	ldr	w1, [x0, 32]
	cmp	w26, w1
	bne	.L3173
	add	x1, x19, x23, lsl 2
	ldr	w3, [x0, 8]
	ldr	w4, [x1, 4]
	cmp	w3, w4
	blt	.L3174
	add	w20, w20, 1
	add	w21, w21, 1
	cmp	w2, w20
	bhi	.L3195
	.p2align 2
.L3202:
	add	x25, x19, 4096
	ldr	w0, [x25, 600]
	ldr	x1, [x19, 2400]
	add	x0, x1, x0, lsl 2
	ldr	w0, [x0, 360]
	str	w0, [x29, 120]
	cbz	w2, .L3176
	ldr	x24, .LC944
	uxtw	x20, w26
	add	x8, x20, 52
	ldr	x23, .LC948
	add	x0, x24, 280
	mov	w27, 0
	lsl	x28, x8, 2
	mov	x22, x0
	str	x0, [x29, 112]
	str	wzr, [x29, 124]
	.p2align 2
.L3186:
	add	x24, x19, x27, uxtw 3
	ldr	x0, [x24, 2792]
	ldrb	w1, [x0, 2]
	cbnz	w1, .L3177
	ldr	w3, [x0, 32]
	cmp	w26, w3
	beq	.L3203
.L3177:
	add	x3, x19, x28
	ldr	w3, [x3, 4]
.L3179:
	cbz	w3, .L3182
	ldr	w4, [x19, 332]
	cmp	w4, 1
	beq	.L3182
.L3183:
	cbnz	w1, .L3181
	ldr	w1, [x19, 4684]
	ldr	w3, [x0, 8]
	add	w1, w1, 100
	cmp	w3, w1
	ble	.L3181
	add	x3, x19, x20, lsl 2
	mov	w1, -2147483647
	ldr	w4, [x3, 228]
	cmp	w4, w1
	beq	.L3181
	ldr	w1, [x19, 332]
	cmp	w1, 1
	beq	.L3204
	.p2align 2
.L3181:
	add	w27, w27, 1
	cmp	w2, w27
	bhi	.L3186
.L3172:
	ldr	w0, [x29, 124]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L3182:
	ldr	w4, [x0, 8]
	cmp	w3, w4
	ble	.L3183
	cbz	w1, .L3205
.L3184:
	mov	x2, x22
	mov	x1, x23
	mov	w0, 31
	bl	dprint_vfmw
	ldr	w2, [x19, 2772]
	b	.L3181
	.p2align 3
.L3203:
	add	x9, x19, x20, lsl 2
	ldr	w4, [x0, 8]
	ldr	w3, [x9, 212]
	cmp	w4, w3
	ble	.L3179
	ldr	w11, [x25, 600]
	ldr	w5, [x29, 120]
	cmp	w11, 7
	ccmp	w5, w21, 2, ls
	bcs	.L3179
	ldr	w10, [x25, 588]
	cmp	w4, w10
	blt	.L3180
	add	x4, x19, x20
	ldrb	w4, [x4, 4]
	cbz	w4, .L3179
.L3180:
	mov	w1, 1
	strb	w1, [x0, 2]
	mov	x0, x19
	str	x9, [x29, 104]
	ldr	x1, [x24, 2792]
	sub	w21, w21, #1
	bl	HEVC_OutputFrmToVO
	str	w0, [x29, 124]
	ldr	x0, [x24, 2792]
	ldr	x9, [x29, 104]
	ldr	w0, [x0, 8]
	str	w0, [x9, 212]
	ldr	w2, [x19, 2772]
	b	.L3181
	.p2align 3
.L3205:
	ldr	w1, [x0, 28]
	mov	w2, 0
	ldr	w0, [x19, 252]
	bl	FSP_SetDisplay
	ldr	x0, [x24, 2792]
	ldr	w4, [x0, 8]
	add	x0, x19, x28
	ldr	w3, [x0, 4]
	b	.L3184
	.p2align 3
.L3174:
	mov	x2, x24
	mov	x1, x25
	mov	w0, 31
	bl	dprint_vfmw
	ldr	x0, [x22, 2792]
	mov	w2, 0
	ldr	w1, [x0, 28]
	ldr	w0, [x19, 252]
	bl	FSP_SetDisplay
	ldr	w2, [x19, 2772]
	b	.L3173
	.p2align 3
.L3204:
	strb	w1, [x0, 2]
	mov	x0, x19
	str	x3, [x29, 104]
	sub	w21, w21, #1
	ldr	x1, [x24, 2792]
	bl	HEVC_OutputFrmToVO
	str	w0, [x29, 124]
	ldr	x3, [x29, 104]
	ldr	w4, [x19, 4684]
	ldr	w0, [x3, 212]
	cmp	w4, w0
	bge	.L3185
	sub	w0, w4, #1
	str	w0, [x3, 212]
.L3185:
	ldr	x0, [x24, 2792]
	ldr	x2, [x29, 112]
	ldr	x1, .LC950
	ldr	w3, [x0, 8]
	mov	w0, 31
	bl	dprint_vfmw
	ldr	w2, [x19, 2772]
	b	.L3181
.L3176:
	str	wzr, [x29, 124]
	b	.L3172
	.size	HEVC_OutputFrmFromDPB, .-HEVC_OutputFrmFromDPB
	.align	3
.LC944:
	.xword	.LANCHOR3
	.align	3
.LC946:
	.xword	.LC945
	.align	3
.LC948:
	.xword	.LC947
	.align	3
.LC950:
	.xword	.LC949
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_OutputOneFrmFromDPB
	.type	HEVC_OutputOneFrmFromDPB, %function
HEVC_OutputOneFrmFromDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w1
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, x21, uxtw 3
	bl	_mcount
	mov	w2, 1
	mov	x0, x19
	ldr	x1, [x20, 2792]
	strb	w2, [x1, 2]
	ldr	x1, [x20, 2792]
	bl	HEVC_OutputFrmToVO
	mov	w22, w0
	ldr	x0, [x20, 2792]
	ldr	w1, [x0, 32]
	ldr	w2, [x0, 8]
	add	x1, x19, x1, lsl 2
	str	w2, [x1, 212]
	ldrb	w0, [x0, 1]
	cbnz	w0, .L3207
	mov	w1, w21
	mov	x0, x19
	bl	HEVC_RemoveApcStore
	mov	w1, w21
	mov	x0, x19
	bl	HEVC_RemoveFrameStoreOutDPB
.L3207:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_OutputOneFrmFromDPB, .-HEVC_OutputOneFrmFromDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_OutputUnRefPicWithMinPoc
	.type	HEVC_OutputUnRefPicWithMinPoc, %function
HEVC_OutputUnRefPicWithMinPoc:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x29, 44
	mov	x0, x19
	bl	HEVC_GetUnRefPicWithMinPoc
	cbnz	w0, .L3213
	ldr	w1, [x29, 44]
	mov	x0, x19
	bl	HEVC_OutputOneFrmFromDPB
	mov	w1, 0
	cbnz	w0, .L3214
.L3210:
	ldr	x19, [sp, 16]
	mov	w0, w1
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3213:
	ldr	x2, .LC952
	mov	w0, 1
	ldr	x1, .LC954
	add	x2, x2, 304
	bl	dprint_vfmw
	mov	w1, -1
	b	.L3210
	.p2align 3
.L3214:
	ldr	x2, .LC952
	mov	w0, 1
	ldr	x1, .LC956
	add	x2, x2, 304
	bl	dprint_vfmw
	mov	w1, -1
	b	.L3210
	.size	HEVC_OutputUnRefPicWithMinPoc, .-HEVC_OutputUnRefPicWithMinPoc
	.align	3
.LC952:
	.xword	.LANCHOR3
	.align	3
.LC954:
	.xword	.LC953
	.align	3
.LC956:
	.xword	.LC955
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_FlushOutputFrmFromDPB
	.type	HEVC_FlushOutputFrmFromDPB, %function
HEVC_FlushOutputFrmFromDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L3224
	ldr	w0, [x19, 2772]
	mov	w20, 0
	mov	w22, 1
	cbnz	w0, .L3227
	b	.L3223
	.p2align 3
.L3231:
	strb	w22, [x1, 2]
	ldr	x1, [x21, 2792]
	bl	HEVC_OutputFrmToVO
	cmn	w0, #1
	mov	w21, w0
	beq	.L3230
.L3220:
	ldr	w0, [x19, 2772]
	cmp	w0, w20
	bls	.L3223
.L3227:
	add	x21, x19, x20, uxtw 3
	ldr	w0, [x19, 252]
	mov	w2, 0
	add	w20, w20, 1
	ldr	x1, [x21, 2792]
	ldr	w1, [x1, 28]
	bl	FSP_SetRef
	ldr	x1, [x21, 2792]
	mov	x0, x19
	ldrb	w2, [x1, 2]
	cbz	w2, .L3231
	ldr	w1, [x1, 28]
	ldr	w0, [x19, 252]
	bl	FSP_GetDisplay
	cmp	w0, 3
	mov	w2, 0
	beq	.L3220
	ldr	x1, [x21, 2792]
	ldr	w0, [x19, 252]
	ldr	w1, [x1, 28]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 2772]
	cmp	w0, w20
	bhi	.L3227
.L3223:
	mov	w1, -2147483647
	mov	x0, x19
	str	w1, [x19, 212]
	mov	w21, 0
	bl	HEVC_InitDecBuffers
.L3216:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3230:
	ldr	x2, .LC957
	mov	w0, 0
	ldr	x1, .LC959
	add	x2, x2, 336
	bl	dprint_vfmw
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L3224:
	mov	w21, -1
	b	.L3216
	.size	HEVC_FlushOutputFrmFromDPB, .-HEVC_FlushOutputFrmFromDPB
	.align	3
.LC957:
	.xword	.LANCHOR3
	.align	3
.LC959:
	.xword	.LC958
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ReceivePacket
	.type	HEVC_ReceivePacket, %function
HEVC_ReceivePacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, [x19, 2376]
	str	wzr, [x19, 328]
	cbz	x0, .L3260
	ldrb	w1, [x20]
	str	w1, [x0, 36]
	ldr	x0, [x19, 2432]
	ldr	w1, [x0, 936]
	cmp	w1, 1
	beq	.L3261
.L3239:
	ldrb	w0, [x20]
	cmp	w0, 1
	bne	.L3241
	ldr	x1, [x19, 2376]
	ldr	w0, [x1, 8]
	cmp	w0, 1
	bls	.L3242
	ldr	w2, [x1, 36]
	cmp	w2, 1
	beq	.L3241
.L3242:
	ldr	w2, [x20, 24]
	cmp	w2, wzr
	ble	.L3243
	ldr	x2, [x20, 8]
	cbz	x2, .L3243
	ldr	w3, [x20, 16]
	cbnz	w3, .L3262
.L3243:
	mov	w0, 1
	str	w0, [x1, 36]
	ldr	w0, [x19, 252]
	ldr	w1, [x20, 28]
	bl	SM_ReleaseStreamSeg
.L3238:
	ldr	x0, [x19, 2376]
	ldr	w0, [x0, 36]
	cmp	w0, wzr
	csetm	w0, eq
.L3236:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3262:
	uxtw	x0, w0
	add	x0, x1, x0, lsl 5
	str	x2, [x0, 40]
	ldr	x1, [x19, 2376]
	ldr	w2, [x20, 24]
	ldr	w0, [x1, 8]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 48]
	ldr	x1, [x19, 2376]
	ldr	w2, [x20, 16]
	ldr	w0, [x1, 8]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 52]
	ldr	x1, [x19, 2376]
	ldr	w2, [x20, 28]
	ldr	w0, [x1, 8]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 68]
	ldr	x1, [x19, 2376]
	ldr	w0, [x1, 8]
	add	x0, x1, x0, lsl 5
	str	wzr, [x0, 60]
	ldr	x1, [x19, 2376]
	ldr	w0, [x1, 8]
	add	w0, w0, 1
	str	w0, [x1, 8]
	ldr	x0, [x19, 2432]
	ldrb	w0, [x0, 1016]
	cmp	w0, 1
	beq	.L3244
	ldr	w0, [x19, 4012]
	ldr	w1, [x20, 24]
	ldr	w2, [x19, 4016]
	add	w1, w0, w1
	str	w1, [x19, 4012]
	ldr	w0, [x20, 24]
	add	w0, w2, w0
	str	w0, [x19, 4016]
.L3244:
	mov	x0, x19
	bl	HEVC_CombinePacket
	mov	w0, 1
	str	w0, [x19, 328]
	b	.L3238
	.p2align 3
.L3261:
	ldr	w0, [x0, 992]
	cbnz	w0, .L3238
	b	.L3239
	.p2align 3
.L3260:
	ldr	w0, [x20, 24]
	cmp	w0, wzr
	ble	.L3234
	ldr	x0, [x20, 8]
	cbz	x0, .L3234
	ldr	w0, [x20, 16]
	cbz	w0, .L3234
	mov	x0, x19
	bl	HEVC_FindNaluArraySlot
	cmn	w0, #1
	mov	w21, w0
	beq	.L3263
	ldr	x0, [x19, 2424]
	mov	w2, 104
	mov	w1, 1
	smaddl	x0, w21, w2, x0
	str	x0, [x19, 2376]
	ldr	x2, [x20, 8]
	str	x2, [x0, 40]
	ldr	x0, [x19, 2376]
	ldr	w2, [x20, 24]
	str	w2, [x0, 48]
	ldr	x0, [x19, 2376]
	ldr	w2, [x20, 28]
	str	w2, [x0, 68]
	ldr	x0, [x19, 2376]
	ldr	w2, [x20, 16]
	str	w2, [x0, 52]
	ldr	x0, [x19, 2376]
	str	wzr, [x0, 60]
	ldr	x0, [x19, 2376]
	str	w1, [x0, 8]
	ldr	x0, [x19, 2376]
	strb	wzr, [x0]
	ldr	x0, [x19, 2376]
	ldrb	w1, [x20]
	str	w1, [x0, 36]
	ldr	x0, [x19, 2432]
	ldrb	w0, [x0, 1016]
	cmp	w0, 1
	beq	.L3238
	ldr	w0, [x19, 4012]
	ldr	w1, [x20, 24]
	ldr	w2, [x19, 4016]
	add	w1, w0, w1
	str	w1, [x19, 4012]
	ldr	w0, [x20, 24]
	add	w0, w2, w0
	str	w0, [x19, 4016]
	b	.L3238
	.p2align 3
.L3241:
	ldr	x1, .LC965
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3236
	.p2align 3
.L3234:
	ldr	x1, .LC963
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3236
.L3263:
	ldr	x1, .LC961
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, 0
	mov	x0, x19
	bl	HEVC_ClearAll
	mov	w0, w21
	b	.L3236
	.size	HEVC_ReceivePacket, .-HEVC_ReceivePacket
	.align	3
.LC961:
	.xword	.LC960
	.align	3
.LC963:
	.xword	.LC962
	.align	3
.LC965:
	.xword	.LC964
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_FlushDPB
	.type	HEVC_FlushDPB, %function
HEVC_FlushDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, 0
	bl	_mcount
	ldr	w2, [x19, 2772]
	cbnz	w2, .L3276
	b	.L3266
	.p2align 3
.L3267:
	cmp	w2, w20
	bls	.L3266
.L3276:
	add	x0, x19, x20, uxtw 3
	add	w20, w20, 1
	ldr	x0, [x0, 2792]
	ldrb	w1, [x0, 1]
	cbz	w1, .L3267
	strb	wzr, [x0, 1]
	mov	w2, 0
	ldr	w1, [x0, 28]
	ldr	w0, [x19, 252]
	bl	FSP_SetRef
	ldr	w2, [x19, 2772]
	cmp	w2, w20
	bhi	.L3276
	.p2align 2
.L3266:
	mov	x0, x19
	bl	HEVC_RemoveUnUsedFrameStore
	cbz	w0, .L3270
	mov	x0, x19
	bl	HEVC_RemoveUnUsedFrameStore
	cbnz	w0, .L3266
	b	.L3270
	.p2align 3
.L3272:
	bl	HEVC_GetMinPOC
	ldr	w1, [x29, 40]
	mov	x0, x19
	bl	HEVC_OutputOneFrmFromDPB
	cmn	w0, #1
	beq	.L3271
.L3270:
	ldr	w3, [x19, 2772]
	add	x2, x29, 40
	add	x1, x29, 44
	mov	x0, x19
	cbnz	w3, .L3272
	mov	w0, 0
.L3271:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_FlushDPB, .-HEVC_FlushDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ClearDPB
	.type	HEVC_ClearDPB, %function
HEVC_ClearDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	HEVC_FlushDPB
	cbz	w0, .L3282
	ldr	x2, .LC966
	mov	w3, w0
	ldr	x1, .LC968
	mov	w0, 0
	add	x2, x2, 368
	bl	dprint_vfmw
.L3282:
	mov	w1, 0
	mov	x0, x19
	bl	HEVC_InitDPB
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_ClearDPB, .-HEVC_ClearDPB
	.align	3
.LC966:
	.xword	.LANCHOR3
	.align	3
.LC968:
	.xword	.LC967
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RecoverDPBProcess
	.type	HEVC_RecoverDPBProcess, %function
HEVC_RecoverDPBProcess:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC969
	ldr	x22, .LC971
	add	x21, x20, 384
	b	.L3287
	.p2align 3
.L3289:
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_IncreaseDPBSize
	cbnz	w0, .L3297
.L3287:
	ldr	w5, [x19, 2768]
	mov	x2, x21
	ldr	w6, [x19, 2772]
	mov	x1, x22
	mov	w0, 13
	mov	w4, w5
	cmp	w6, w5
	mov	w3, w6
	bcs	.L3289
.L3286:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3297:
	ldr	x1, .LC973
	mov	x2, x21
	mov	w0, 1
	add	x20, x20, 384
	bl	dprint_vfmw
	ldr	x21, .LC975
	.p2align 2
.L3288:
	ldr	w5, [x19, 2768]
	mov	x2, x20
	ldr	w6, [x19, 2772]
	mov	x1, x21
	mov	w0, 1
	mov	w4, w5
	cmp	w6, w5
	mov	w3, w6
	bcc	.L3286
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_OutputUnRefPicWithMinPoc
	cbz	w0, .L3288
	ldr	x1, .LC976
	mov	x2, x20
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_PrintDPBState
	mov	x0, x19
	bl	HEVC_ClearDPB
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_RecoverDPBProcess, .-HEVC_RecoverDPBProcess
	.align	3
.LC969:
	.xword	.LANCHOR3
	.align	3
.LC971:
	.xword	.LC970
	.align	3
.LC973:
	.xword	.LC972
	.align	3
.LC975:
	.xword	.LC974
	.align	3
.LC976:
	.xword	.LC955
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InsertFrmInDPB
	.type	HEVC_InsertFrmInDPB, %function
HEVC_InsertFrmInDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w22, w1
	mov	x19, x2
	bl	_mcount
	cmp	w22, 16
	bhi	.L3302
	add	x20, x21, x22, uxtw 3
	ldr	x0, [x19, 64]
	mov	w1, 1
	mov	w2, w1
	str	x0, [x20, 2792]
	str	w1, [x0, 48]
	ldr	x1, [x20, 2792]
	ldr	w0, [x21, 252]
	ldr	w1, [x1, 28]
	bl	FSP_SetRef
	ldrb	w1, [x19]
	mov	x2, 640
	ldr	x0, [x20, 2792]
	cmp	w1, wzr
	add	x1, x19, 72
	cset	w3, ne
	strb	w3, [x0, 1]
	ldr	x0, [x20, 2792]
	ldr	w3, [x19, 36]
	str	w3, [x0, 20]
	ldr	x0, [x20, 2792]
	add	x0, x0, 80
	bl	memcpy
	ldr	x0, [x20, 2792]
	add	w1, w22, 1
	ldr	w4, [x19, 40]
	mov	w2, 8
	ldr	x3, .LC981
	str	w4, [x0, 16]
	add	x0, x21, 2792
	ldr	x4, [x20, 2792]
	ldr	x5, [x19, 64]
	str	x5, [x4, 72]
	ldr	x4, [x20, 2792]
	ldr	w5, [x19, 16]
	str	w5, [x4, 12]
	ldr	x4, [x20, 2792]
	ldr	w5, [x19, 12]
	str	w5, [x4, 8]
	ldr	x4, [x20, 2792]
	ldr	w5, [x19, 8]
	str	w5, [x4, 32]
	bl	qsort
	ldr	w1, [x21, 2772]
	mov	x0, x21
	add	w1, w1, 1
	str	w1, [x21, 2772]
	ldr	x1, [x19, 64]
	bl	HEVC_GetAPC
	cbnz	w0, .L3303
	strb	wzr, [x19, 1]
	mov	w0, 0
.L3300:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3302:
	ldr	x2, .LC978
	mov	w3, w22
	ldr	x1, .LC980
	mov	w0, 0
	add	x2, x2, 408
	bl	dprint_vfmw
	mov	x0, x21
	bl	HEVC_ClearDPB
	mov	w0, -1
	b	.L3300
	.p2align 3
.L3303:
	ldr	x2, .LC978
	mov	w3, w0
	ldr	x1, .LC983
	mov	w0, 0
	add	x2, x2, 408
	bl	dprint_vfmw
	mov	x0, x21
	bl	HEVC_PrintDPBState
	mov	x0, x21
	bl	HEVC_ClearDPB
	mov	w0, -1
	b	.L3300
	.size	HEVC_InsertFrmInDPB, .-HEVC_InsertFrmInDPB
	.align	3
.LC978:
	.xword	.LANCHOR3
	.align	3
.LC980:
	.xword	.LC979
	.align	3
.LC981:
	.xword	HEVC_ComparePicByPocAsc
	.align	3
.LC983:
	.xword	.LC982
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_SimpleDPBProcess
	.type	HEVC_SimpleDPBProcess, %function
HEVC_SimpleDPBProcess:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 3960]
	cbnz	w0, .L3317
	ldr	x0, [x19, 4024]
	mov	w1, 2
	str	w1, [x0, 48]
.L3306:
	ldr	x1, [x19, 4024]
	mov	w2, 1
	mov	x0, x19
	strb	w2, [x1, 2]
	ldr	x1, [x19, 4024]
	bl	HEVC_CheckFrameStore
	cmn	w0, #1
	mov	w20, w0
	beq	.L3318
	cmn	w0, #3
	beq	.L3310
	mov	x0, x19
	bl	HEVC_OutputCurrPic
	cbnz	w0, .L3319
.L3310:
	mov	w0, 0
.L3307:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3317:
	mov	x0, x19
	bl	HEVC_SimpleSlideDPB
	ldr	w1, [x19, 2772]
	add	x2, x19, 3960
	mov	x0, x19
	bl	HEVC_InsertFrmInDPB
	cbz	w0, .L3306
	ldr	x2, .LC984
	mov	w4, w0
	ldr	x1, .LC986
	mov	w3, 11097
	add	x2, x2, 432
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3307
	.p2align 3
.L3319:
	ldr	x2, .LC984
	mov	w0, 0
	ldr	x1, .LC989
	add	x2, x2, 432
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3307
.L3318:
	ldr	x2, .LC984
	mov	w0, 0
	ldr	x1, .LC988
	add	x2, x2, 432
	bl	dprint_vfmw
	mov	w0, w20
	b	.L3307
	.size	HEVC_SimpleDPBProcess, .-HEVC_SimpleDPBProcess
	.align	3
.LC984:
	.xword	.LANCHOR3
	.align	3
.LC986:
	.xword	.LC985
	.align	3
.LC988:
	.xword	.LC987
	.align	3
.LC989:
	.xword	.LC937
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecOrderProcess
	.type	HEVC_DecOrderProcess, %function
HEVC_DecOrderProcess:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2772]
	cmp	w1, w0
	bcs	.L3332
.L3321:
	add	x2, x19, 3960
	mov	x0, x19
	bl	HEVC_InsertFrmInDPB
	cbnz	w0, .L3333
	ldr	x1, [x19, 4024]
	mov	x0, x19
	bl	HEVC_CheckFrameStore
	cmn	w0, #1
	mov	w20, w0
	beq	.L3334
	cmn	w0, #3
	beq	.L3327
	mov	x0, x19
	bl	HEVC_OutputCurrPic
	cbnz	w0, .L3335
.L3327:
	mov	w0, 0
.L3324:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3332:
	mov	x0, x19
	bl	HEVC_RemoveUnusedApcStore
	mov	x0, x19
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	w0, 1
	beq	.L3331
	ldr	x2, .LC990
	mov	w0, 0
	ldr	x1, .LC992
	add	x2, x2, 456
	bl	dprint_vfmw
.L3331:
	ldr	w1, [x19, 2772]
	b	.L3321
.L3335:
	ldr	x2, .LC990
	mov	w0, 0
	ldr	x1, .LC996
	add	x2, x2, 456
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3324
	.p2align 3
.L3333:
	ldr	x2, .LC990
	mov	w0, 0
	ldr	x1, .LC994
	add	x2, x2, 456
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3324
.L3334:
	ldr	x2, .LC990
	mov	w0, 0
	ldr	x1, .LC995
	add	x2, x2, 456
	bl	dprint_vfmw
	mov	w0, w20
	b	.L3324
	.size	HEVC_DecOrderProcess, .-HEVC_DecOrderProcess
	.align	3
.LC990:
	.xword	.LANCHOR3
	.align	3
.LC992:
	.xword	.LC991
	.align	3
.LC994:
	.xword	.LC993
	.align	3
.LC995:
	.xword	.LC987
	.align	3
.LC996:
	.xword	.LC937
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DispOrderProcess
	.type	HEVC_DispOrderProcess, %function
HEVC_DispOrderProcess:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 11896]
	cmp	w0, 1
	beq	.L3337
	mov	x0, x19
	bl	HEVC_FirstFrameFastOut
	cbnz	w0, .L3360
.L3337:
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2772]
	cmp	w1, w0
	bcs	.L3361
.L3339:
	add	x2, x19, 3960
	mov	x0, x19
	bl	HEVC_InsertFrmInDPB
	cbnz	w0, .L3362
	ldr	w0, [x19, 2772]
	cbnz	w0, .L3363
.L3342:
	ldr	w1, [x19, 2768]
	cmp	w1, w0
	bls	.L3364
.L3359:
	mov	w0, 0
.L3338:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3364:
	add	x1, x19, 4096
	ldr	w0, [x19, 252]
	add	x1, x1, 1936
	bl	FSP_IfCanGetDecFs
	cbz	w0, .L3359
	mov	x0, x19
	bl	HEVC_RemoveFrmFullDPB
	b	.L3359
	.p2align 3
.L3361:
	mov	x0, x19
	bl	HEVC_RemoveUnusedApcStore
	mov	x0, x19
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	w0, 1
	beq	.L3358
	ldr	x1, .LC1001
	mov	w0, 0
	bl	dprint_vfmw
.L3358:
	ldr	w1, [x19, 2772]
	b	.L3339
	.p2align 3
.L3363:
	mov	x0, x19
	bl	HEVC_OutputFrmFromDPB
	cbnz	w0, .L3343
	ldr	w0, [x19, 2772]
	b	.L3342
	.p2align 3
.L3362:
	ldr	x1, .LC1003
	mov	w2, w0
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3338
.L3360:
	ldr	x2, .LC997
	mov	w0, 0
	ldr	x1, .LC999
	add	x2, x2, 480
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3338
.L3343:
	ldr	x2, .LC997
	mov	w0, 1
	ldr	x1, .LC1005
	add	x2, x2, 480
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3338
	.size	HEVC_DispOrderProcess, .-HEVC_DispOrderProcess
	.align	3
.LC997:
	.xword	.LANCHOR3
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_StorePicInDPB
	.type	HEVC_StorePicInDPB, %function
HEVC_StorePicInDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 4024]
	cbz	x0, .L3405
	ldrsw	x1, [x19, 252]
	ldr	x0, .LC1010
	ldr	x0, [x0, x1, lsl 3]
	ldrsb	w1, [x0, 44]
	cmp	w1, 1
	beq	.L3406
.L3368:
	mov	x0, x19
	bl	HEVC_RemoveDummyFrame
	ldrb	w0, [x19, 3961]
	cbz	w0, .L3407
	ldr	w0, [x19, 4000]
	cbz	w0, .L3373
	ldr	w1, [x19, 3976]
	cbz	w1, .L3408
.L3374:
	ldr	x1, [x19, 2432]
	ldr	w2, [x1, 4]
	cmp	w2, w0
	bcs	.L3373
	ldr	w20, [x1, 684]
	cbz	w20, .L3409
.L3373:
	ldr	x1, [x19, 2448]
	ldr	x0, [x19, 4024]
	ldr	w1, [x1, 5188]
	str	w1, [x0, 40]
	ldr	x1, [x19, 2448]
	ldr	x0, [x19, 4024]
	ldr	w1, [x1, 5192]
	str	w1, [x0, 44]
	ldr	w0, [x19, 256]
	cmp	w0, 2
	beq	.L3410
	ldr	x0, [x19, 2432]
	ldr	w0, [x0, 24]
	cmp	w0, 2
	beq	.L3411
	cmp	w0, 1
	beq	.L3412
	sub	w1, w0, #4
	cmp	w1, 2
	ccmp	w0, wzr, 4, hi
	bne	.L3367
.L3384:
	mov	x0, x19
	bl	HEVC_DispOrderProcess
	mov	w20, w0
	cbnz	w0, .L3413
	.p2align 2
.L3385:
	strb	wzr, [x19, 3961]
.L3403:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3406:
	ldr	x1, [x0, 160]
	mov	x0, 1
	movk	x0, 0x2, lsl 32
	cmp	x1, x0
	bne	.L3368
	add	x0, x19, 8192
	ldrb	w0, [x0, 3648]
	cmp	w0, 1
	bne	.L3368
	ldr	w4, [x19, 11852]
	ldr	w5, [x19, 11856]
	ldr	x6, [x19, 11864]
	ldr	x3, [x19, 11872]
	ldr	x7, [x19, 11880]
	cbz	w4, .L3386
	mov	w1, w4
	mov	w2, w5
	b	.L3370
	.p2align 3
.L3387:
	mov	w1, w0
.L3370:
	udiv	w0, w2, w1
	msub	w0, w0, w1, w2
	mov	w2, w1
	cbnz	w0, .L3387
.L3369:
	udiv	w0, w4, w1
	sub	x3, x3, x7
	lsl	w2, w3, 6
	sub	w2, w2, w3
	lsl	w2, w2, 1
	sub	w2, w2, w3
	lsl	w2, w2, 3
	udiv	w1, w5, w1
	mul	w0, w2, w0
	udiv	w0, w0, w1
	add	x0, x0, x6
	str	x0, [x19, 4616]
	b	.L3368
	.p2align 3
.L3411:
	mov	x0, x19
	bl	HEVC_SimpleDPBProcess
	mov	w20, w0
	cbnz	w0, .L3414
.L3381:
	ldr	x1, .LC1009
	mov	w3, 11418
	mov	w2, w20
	mov	w0, 14
	bl	dprint_vfmw
.L3379:
	cmn	w20, #1
	bne	.L3385
	.p2align 2
.L3367:
	mov	x0, x19
	mov	w20, -1
	bl	HEVC_ClearCurrPic
	ldr	x2, .LC1011
	mov	w0, 1
	ldr	x1, .LC1028
	add	x2, x2, 504
	bl	dprint_vfmw
	b	.L3385
	.p2align 3
.L3409:
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	ldr	x3, [x19, 2432]
	mov	w0, 1
	ldr	x1, .LC1018
	ldr	w2, [x19, 4000]
	ldr	w3, [x3, 4]
	bl	dprint_vfmw
	b	.L3403
	.p2align 3
.L3407:
	ldr	x2, .LC1011
	mov	w0, 1
	ldr	x1, .LC1013
	mov	w20, 0
	add	x2, x2, 504
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3408:
	ldr	x2, .LC1011
	mov	w0, 1
	ldr	x1, .LC1015
	add	x2, x2, 504
	bl	dprint_vfmw
	ldr	x0, .LC1016
	ldr	x4, [x0]
	cbz	x4, .L3404
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 111
	blr	x4
.L3404:
	ldr	w0, [x19, 4000]
	b	.L3374
	.p2align 3
.L3410:
	mov	x0, x19
	bl	HEVC_DirectOutput
	mov	w20, w0
	ldr	w1, [x19, 184]
	ldr	w0, [x19, 3996]
	cmp	w0, w1
	beq	.L3377
	add	x0, x19, x0, uxtw 2
	str	wzr, [x0, 2144]
	str	w1, [x19, 3996]
.L3377:
	cbnz	w20, .L3415
.L3378:
	ldr	x1, .LC1009
	mov	w3, 11403
	mov	w2, w20
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3379
	.p2align 3
.L3412:
	mov	x0, x19
	bl	HEVC_DecOrderProcess
	mov	w20, w0
	cbnz	w0, .L3383
	ldr	x0, [x19, 2432]
	ldr	w0, [x0, 24]
	sub	w1, w0, #4
	cmp	w1, 2
	ccmp	w0, wzr, 4, hi
	bne	.L3385
	b	.L3384
	.p2align 3
.L3405:
	ldr	x1, .LC1007
	bl	dprint_vfmw
	ldr	x1, .LC1009
	mov	w3, 11337
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3367
	.p2align 3
.L3413:
	ldr	x2, .LC1011
	mov	w0, 0
	ldr	x1, .LC1026
	add	x2, x2, 504
	bl	dprint_vfmw
	b	.L3379
	.p2align 3
.L3383:
	ldr	x2, .LC1011
	mov	w0, 0
	ldr	x1, .LC1024
	add	x2, x2, 504
	bl	dprint_vfmw
	ldr	x0, [x19, 2432]
	ldr	w0, [x0, 24]
	sub	w1, w0, #4
	cmp	w1, 2
	ccmp	w0, wzr, 4, hi
	bne	.L3379
	b	.L3384
	.p2align 3
.L3415:
	ldr	x2, .LC1011
	mov	w0, 0
	ldr	x1, .LC1020
	add	x2, x2, 504
	bl	dprint_vfmw
	b	.L3378
	.p2align 3
.L3414:
	ldr	x2, .LC1011
	mov	w0, 0
	ldr	x1, .LC1022
	add	x2, x2, 504
	bl	dprint_vfmw
	b	.L3381
.L3386:
	mov	w1, w5
	b	.L3369
	.size	HEVC_StorePicInDPB, .-HEVC_StorePicInDPB
	.align	3
.LC1007:
	.xword	.LC1006
	.align	3
.LC1009:
	.xword	.LC1008
	.align	3
.LC1010:
	.xword	s_pstVfmwChan
	.align	3
.LC1011:
	.xword	.LANCHOR3
	.align	3
.LC1013:
	.xword	.LC1012
	.align	3
.LC1015:
	.xword	.LC1014
	.align	3
.LC1016:
	.xword	g_event_report
	.align	3
.LC1018:
	.xword	.LC1017
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CreateLostPicture
	.type	HEVC_CreateLostPicture, %function
HEVC_CreateLostPicture:
	sub	sp, sp, #720
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	w22, w1
	add	x19, x20, 12288
	bl	_mcount
	mov	w21, 0
	ldr	x3, .LC1029
	mov	x2, 712
	mov	w1, 0
	add	x0, x29, 88
	add	x19, x19, 1168
	ldr	x3, [x3, 96]
	blr	x3
	.p2align 2
.L3422:
	ldr	w0, [x19, 48]
	cbnz	w0, .L3417
	cbz	x19, .L3418
	ldr	w2, [x20, 2772]
	cbz	w2, .L3418
	ldr	x0, [x20, 2792]
	cmp	x19, x0
	beq	.L3417
	sub	w2, w2, #1
	mov	x0, x20
	add	x2, x20, x2, lsl 3
	b	.L3420
	.p2align 3
.L3421:
	ldr	x1, [x0, 2792]
	cmp	x19, x1
	beq	.L3417
.L3420:
	cmp	x2, x0
	add	x0, x0, 8
	bne	.L3421
.L3418:
	sxtw	x23, w21
	mov	w3, 101
	lsl	x1, x23, 2
	mov	x2, 640
	sub	x23, x1, x23
	add	x0, x29, 160
	lsl	x1, x23, 4
	mov	w24, 1
	sub	x23, x1, x23
	strb	w24, [x29, 89]
	strb	w24, [x29, 88]
	add	x23, x20, x23, lsl 4
	str	w22, [x29, 100]
	add	x25, x23, 12288
	str	w3, [x29, 128]
	add	x1, x25, 1248
	bl	memcpy
	strb	w24, [x25, 1170]
	str	wzr, [x23, 13508]
	cmp	w21, 19
	strb	w24, [x25, 1168]
	str	x19, [x29, 152]
	str	wzr, [x29, 312]
	bgt	.L3423
	ldr	w5, [x20, 2772]
	cbz	w5, .L3425
	mov	w6, 0
	mov	w3, 2147483647
	mov	w1, 0
	.p2align 2
.L3428:
	add	x0, x20, x1, sxtw 3
	add	w1, w1, 1
	ldr	x4, [x0, 2792]
	ldr	w0, [x4, 8]
	sub	w0, w0, w22
	sxtw	x0, w0
	eor	x2, x0, x0, asr 63
	sub	x2, x2, x0, asr 63
	cmp	w2, w3
	bge	.L3427
	ldrb	w0, [x4, 1]
	cmp	w0, wzr
	csel	w3, w3, w2, eq
	csinc	w6, w6, wzr, eq
.L3427:
	cmp	w1, w5
	bne	.L3428
	cbz	w6, .L3425
	mov	w1, 0
	b	.L3429
	.p2align 3
.L3430:
	cmp	w5, w1
	beq	.L3431
.L3429:
	sxtw	x19, w1
	add	w1, w1, 1
	add	x19, x19, 348
	add	x19, x20, x19, lsl 3
	ldr	x2, [x19, 8]
	ldr	w0, [x2, 8]
	sub	w0, w0, w22
	sxtw	x0, w0
	eor	x4, x0, x0, asr 63
	sub	x4, x4, x0, asr 63
	cmp	w3, w4
	bne	.L3430
	ldrb	w0, [x2, 1]
	cbz	w0, .L3430
	ldp	w1, w23, [x2, 28]
	ldr	w0, [x20, 252]
	bl	FSP_GetLogicFs
	mov	x21, x0
	ldr	x2, [x19, 8]
	mov	w3, w22
	ldr	x1, .LC1037
	mov	w0, 1
	ldr	w2, [x2, 8]
	bl	dprint_vfmw
	cbz	x21, .L3431
	ldr	x0, [x21, 32]
	cbz	x0, .L3464
	ldr	w0, [x20, 252]
	mov	w1, 0
	bl	FSP_NewLogicFs
	mov	w1, w0
	mov	w19, w0
	ldr	w0, [x20, 252]
	bl	FSP_GetLogicFs
	mov	x1, x0
	cmp	w19, wzr
	ccmp	x0, xzr, 4, ge
	beq	.L3434
	ldr	x3, [x29, 152]
	add	x2, x29, 88
	mov	x0, x20
	str	w19, [x3, 28]
	ldr	x3, [x21, 32]
	str	x3, [x1, 32]
	ldr	x3, [x21, 40]
	str	x3, [x1, 40]
	ldrsb	w3, [x21, 4]
	ldr	w1, [x20, 2772]
	str	w23, [x29, 96]
	str	w3, [x29, 124]
	bl	HEVC_InsertFrmInDPB
	cbnz	w0, .L3465
	ldr	w0, [x20, 252]
	mov	w2, 0
	mov	w1, w19
	bl	FSP_SetDisplay
	ldr	w1, [x20, 4704]
	mov	w2, 2147483647
	mov	w0, 0
	add	x20, x20, x1, lsl 2
	ldr	w1, [x20, 228]
	cmp	w1, w2
	bne	.L3450
	str	w22, [x20, 228]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	add	sp, sp, 720
	ret
	.p2align 3
.L3417:
	add	w21, w21, 1
	add	x19, x19, 720
	cmp	w21, 20
	bne	.L3422
.L3423:
	ldr	x1, .LC1031
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
.L3450:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	add	sp, sp, 720
	ret
	.p2align 3
.L3431:
	ldr	x1, .LC1033
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	mov	w0, -1
	add	sp, sp, 720
	ret
.L3434:
	ldr	x2, [x29, 152]
	mov	w0, 0
	ldr	x1, .LC1041
	strb	wzr, [x2]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3450
.L3465:
	ldr	x0, [x29, 152]
	mov	w2, 1
	mov	w1, w19
	strb	wzr, [x0]
	ldr	w0, [x20, 252]
	bl	FSP_ClearLogicFs
	ldr	x1, .LC1043
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3450
.L3425:
	ldr	x1, .LC1035
	mov	w0, 0
	strb	wzr, [x19]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3450
.L3464:
	ldr	x1, .LC1039
	bl	dprint_vfmw
	mov	x0, x20
	bl	HEVC_ClearDPB
	mov	w0, -1
	b	.L3450
	.size	HEVC_CreateLostPicture, .-HEVC_CreateLostPicture
	.align	3
.LC1029:
	.xword	vfmw_Osal_Func_Ptr_S
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RefPicProcess
	.type	HEVC_RefPicProcess, %function
HEVC_RefPicProcess:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	HEVC_RemoveDummyFrame
	mov	x0, x19
	bl	HEVC_ApplyReferencePictureSet
	mov	x0, x19
	bl	HEVC_RemoveUnusedApcStore
	mov	x0, x19
	bl	HEVC_RemoveUnUsedFrameStore
	ldr	x20, .LC1045
	b	.L3467
	.p2align 3
.L3470:
	bl	HEVC_CheckThatAllRefPicsAreAvailable.part.8
	cbnz	w0, .L3472
	ldr	w2, [x29, 44]
	mov	x1, x20
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 2432]
	mov	x0, x19
	ldr	w1, [x1, 4]
	cbz	w1, .L3468
	ldr	w1, [x29, 44]
	bl	HEVC_CreateLostPicture
	cbnz	w0, .L3475
.L3467:
	ldr	w2, [x19, 4700]
	add	x1, x29, 44
	mov	x0, x19
	sub	w2, w2, #19
	cmp	w2, 2
	bhi	.L3470
.L3472:
	mov	x0, x19
	bl	HEVC_UpdateReflist
	mov	x0, x19
	bl	HEVC_UpdateLTReflist
	mov	x0, x19
	bl	HEVC_RecoverDPBProcess
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3468:
	ldr	w3, [x19, 4684]
	mov	w2, 0
	ldr	w4, [x29, 44]
	mov	w0, 1
	ldr	x1, .LC1047
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3475:
	mov	x0, x19
	bl	HEVC_RemoveDummyFrame
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_RefPicProcess, .-HEVC_RefPicProcess
	.align	3
.LC1045:
	.xword	.LC1044
	.align	3
.LC1047:
	.xword	.LC1046
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecVDM
	.type	HEVC_DecVDM, %function
HEVC_DecVDM:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 176]
	cmp	w0, 2
	bls	.L3535
	ldr	w0, [x19, 296]
	mov	w2, 1
	ldr	w1, [x19, 300]
	add	w0, w0, 1
	ldr	x3, [x19, 2432]
	cmp	w0, w1
	csel	w0, w0, w1, ge
	str	w0, [x19, 296]
	sub	w0, w0, w1
	str	w0, [x3, 624]
	strb	w2, [x19, 3960]
	ldr	w20, [x19, 248]
	ldr	w2, [x19, 256]
	ubfx	x20, x20, 16, 3
	cmp	w20, w2
	beq	.L3481
	sub	w0, w2, #2
	cmp	w0, 1
	ccmp	w20, 2, 4, ls
	beq	.L3481
	cmp	w20, 1
	ccmp	w20, 4, 4, hi
	beq	.L3536
.L3481:
	cmp	w20, 2
	str	w20, [x19, 256]
	beq	.L3483
	cmp	w20, 3
	bne	.L3532
.L3534:
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	mov	x0, x19
	bl	HEVC_ClearDPB
	mov	w0, -1
.L3531:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3532:
	ldr	w0, [x19, 236]
	cbz	w0, .L3502
	cmp	w20, 4
	ldr	w0, [x19, 3976]
	bne	.L3489
	cbnz	w0, .L3489
	mov	w0, 2
	strb	w0, [x19, 6]
	.p2align 2
.L3493:
	ldr	w2, [x19, 240]
	mov	w0, 2
	ldr	x1, .LC1057
	sub	w2, w2, #1
	bl	dprint_vfmw
	ldr	w0, [x19, 204]
	cbz	w0, .L3537
	ldr	w2, [x19, 3988]
	ldr	x1, [x19, 2432]
	ldr	w3, [x19, 3992]
	cmp	w2, wzr
	str	w3, [x19, 7972]
	cset	w3, eq
	str	w0, [x19, 9128]
	add	x0, x19, 4096
	str	w3, [x19, 7980]
	ldr	w3, [x1, 640]
	strb	w3, [x0, 2544]
	ldr	w3, [x1, 644]
	strb	w3, [x0, 2545]
	ldr	w3, [x1, 648]
	strb	w3, [x0, 2547]
	ldr	w3, [x1, 652]
	strb	w3, [x0, 2548]
	ldr	w3, [x1, 692]
	ldr	w1, [x19, 240]
	str	w3, [x19, 7968]
	cbz	w1, .L3498
	add	x0, x0, 2544
	ldr	w1, [x19, 4004]
	str	x0, [x19, 2448]
	add	w2, w2, 1
	str	w1, [x0, 5188]
	ldr	w1, [x19, 4008]
	str	w1, [x0, 5192]
	str	w2, [x19, 3988]
	ldr	w0, [x19, 3976]
	cbnz	w0, .L3498
	ldr	x1, [x19, 9136]
	mov	w4, 0
	cbz	x1, .L3500
	.p2align 2
.L3501:
	ldp	w2, w0, [x1]
	ldr	x1, [x1, 1360]
	add	w0, w2, w0
	add	w0, w0, 7
	add	w4, w4, w0, lsr 3
	cbnz	x1, .L3501
.L3500:
	ldr	x0, .LC1048
	ldr	x5, [x0]
	cbz	x5, .L3498
	add	x2, x29, 48
	ldr	w0, [x19, 252]
	mov	w3, 4
	mov	w1, 20
	str	w4, [x2, -8]!
	blr	x5
.L3498:
	ldr	w4, [x19, 4016]
	mov	w0, 0
	ldr	x3, [x19, 4024]
	ldr	w1, [x19, 4012]
	str	w4, [x19, 4012]
	sub	w1, w1, w4
	ldr	w2, [x3, 320]
	add	w2, w2, w1
	str	w2, [x3, 320]
	ldr	w2, [x19, 4272]
	add	w1, w2, w1
	str	w1, [x19, 4272]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3483:
	ldr	w0, [x19, 3976]
	cbnz	w0, .L3487
	ldr	w1, [x19, 236]
	cbz	w1, .L3502
.L3489:
	cmp	w0, 2
	beq	.L3538
	cmp	w0, 1
	bne	.L3493
	strb	w0, [x19, 6]
	b	.L3493
	.p2align 3
.L3538:
	ldrb	w0, [x19, 6]
	cmp	w0, 2
	bne	.L3493
	ldr	x0, .LC1055
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L3493
	ldr	x0, [x19, 2432]
	ldr	w0, [x0, 24]
	sub	w1, w0, #4
	cmp	w1, 2
	ccmp	w0, wzr, 4, hi
	bne	.L3493
	mov	w3, 1
	ldr	x1, .LC1062
	ldr	w2, [x19, 3972]
	mov	w0, w3
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	ldr	x0, .LC1048
	ldr	x4, [x0]
	cbz	x4, .L3539
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
	mov	w0, -1
	b	.L3531
	.p2align 3
.L3502:
	ldr	x0, .LC1048
	ldr	x4, [x0]
	cbz	x4, .L3487
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
.L3487:
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	mov	w0, -1
	b	.L3531
.L3536:
	ldr	x1, .LC1054
	mov	w3, w20
	mov	w0, 1
	bl	dprint_vfmw
	str	w20, [x19, 256]
	b	.L3534
	.p2align 3
.L3539:
	mov	w0, -1
	b	.L3531
	.p2align 3
.L3537:
	ldr	x0, .LC1048
	ldr	x4, [x0]
	cbz	x4, .L3496
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
.L3496:
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	ldr	x2, .LC1058
	mov	w0, 0
	ldr	x1, .LC1060
	add	x2, x2, 528
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3531
	.p2align 3
.L3535:
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	ldr	x0, .LC1048
	ldr	x4, [x0]
	cbz	x4, .L3478
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
.L3478:
	ldr	w0, [x19, 244]
	cmp	w0, 524288
	bls	.L3479
	ldr	x1, .LC1050
	mov	w0, 0
	bl	dprint_vfmw
.L3479:
	ldr	x1, .LC1052
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3531
	.size	HEVC_DecVDM, .-HEVC_DecVDM
	.align	3
.LC1048:
	.xword	g_event_report
	.align	3
.LC1050:
	.xword	.LC1049
	.align	3
.LC1052:
	.xword	.LC1051
	.align	3
.LC1054:
	.xword	.LC1053
	.align	3
.LC1055:
	.xword	g_allow_B_before_P
	.align	3
.LC1057:
	.xword	.LC1056
	.align	3
.LC1058:
	.xword	.LANCHOR3
	.align	3
.LC1060:
	.xword	.LC1059
	.align	3
.LC1062:
	.xword	.LC1061
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_VES_Splitter
	.type	HEVC_VES_Splitter, %function
HEVC_VES_Splitter:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	mov	w23, w2
	mov	w25, w3
	mov	w20, w1
	bl	_mcount
	ldr	x0, [x19, 2336]
	mov	w1, 16
	str	xzr, [x29, 88]
	add	x22, x19, 4096
	bl	BsGet
	mov	w21, w0
	ldr	x0, [x19, 2336]
	mov	w1, 8
	bl	BsGet
	and	w24, w0, 31
	ldr	x0, [x19, 2336]
	mov	w1, 24
	bl	BsBack
	str	wzr, [x22, 356]
	ldr	x1, [x22, 368]
	str	x1, [x29, 88]
	cbz	w20, .L3542
	cmp	w20, 1
	bne	.L3700
	cmp	w23, 1
	mov	w0, 31745
	beq	.L3701
	cmp	w21, w0
	ccmp	w24, 25, 0, eq
	bne	.L3571
	ldr	x20, .LC1063
	ldr	x4, [x20]
	cbz	x4, .L3572
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L3572:
	mov	x0, x19
	bl	HEVC_DecVDM
	ldr	x1, [x19, 2376]
	cbnz	w0, .L3695
	ldr	w0, [x1, 48]
	add	x21, x22, 352
	sub	w0, w0, #6
	add	x2, x0, 5
	str	w0, [x21, 4]
	cmp	x2, 4096
	bhi	.L3702
	ldr	w2, [x1, 80]
	ldr	w3, [x1, 48]
	ldr	w0, [x19, 252]
	add	w3, w3, w2
	ldr	w1, [x21, 8]
	add	x2, x29, 88
	sub	w3, w3, #1
	bl	MetadataMapToSec
	cbnz	w0, .L3703
	ldr	x23, .LC1069
	mov	x2, 5
	ldr	x1, .LC1070
	ldr	x0, [x29, 88]
	ldr	x3, [x23, 104]
	add	x1, x1, 208
	blr	x3
	ldr	x1, [x19, 2376]
	ldr	x0, [x29, 88]
	ldr	w2, [x21, 4]
	ldr	x1, [x1, 40]
	add	x0, x0, 5
	ldr	x3, [x23, 104]
	add	x1, x1, 6
	blr	x3
	ldr	w0, [x21, 4]
	add	w0, w0, 5
	str	w0, [x21, 4]
	ldr	x1, [x19, 2376]
	ldr	w2, [x1, 80]
	cbz	w2, .L3578
	add	w3, w0, w2
	cmp	w3, 4096
	bls	.L3579
	uxtw	x2, w0
	ldr	x1, .LC1065
	mov	w3, 2511
	add	x2, x2, 5
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 2376]
	cbz	x1, .L3580
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
.L3580:
	ldr	x4, [x20]
	cbz	x4, .L3581
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L3581:
	ldr	w0, [x19, 252]
	ldr	x1, [x29, 88]
	bl	MetadataUnMapToSec
	cbz	w0, .L3675
	ldr	x2, .LC1066
	mov	w3, 2518
	ldr	x1, .LC1072
	mov	w0, 0
	add	x2, x2, 544
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3550
	.p2align 3
.L3700:
	ldr	x1, .LC1079
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 1
.L3550:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3542:
	cmp	w23, 1
	beq	.L3704
	mov	w0, 31745
	and	w21, w21, -513
	cmp	w21, w0
	mov	w0, 1
	bne	.L3550
	ldr	x2, .LC1066
	mov	w3, 2408
	ldr	x1, .LC1075
.L3679:
	mov	w0, 0
	add	x2, x2, 544
	bl	dprint_vfmw
	ldr	x1, [x19, 2376]
	cbz	x1, .L3675
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
	mov	w0, -1
	b	.L3550
	.p2align 3
.L3571:
	mov	w1, 32257
	mov	w0, w20
	cmp	w21, w1
	bne	.L3550
	ldr	x2, .LC1066
	mov	w3, 2553
	ldr	x1, .LC1077
	b	.L3679
	.p2align 3
.L3704:
	mov	w0, 31745
	cmp	w21, w0
	ccmp	w24, 25, 0, eq
	bne	.L3545
	ldr	x20, .LC1063
	ldr	x4, [x20]
	cbz	x4, .L3546
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L3546:
	mov	x0, x19
	bl	HEVC_DecVDM
	ldr	x1, [x19, 2376]
	cbnz	w0, .L3695
	ldr	w0, [x1, 48]
	add	x21, x22, 352
	sub	w0, w0, #6
	add	x2, x0, 5
	str	w0, [x21, 4]
	cmp	x2, 4096
	bls	.L3551
	ldr	x1, .LC1065
	mov	w3, 2322
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 2376]
	.p2align 2
.L3695:
	cbz	x1, .L3576
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
.L3576:
	ldr	x4, [x20]
	cbz	x4, .L3675
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L3675:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	mov	w0, -1
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3701:
	cmp	w21, w0
	ccmp	w25, 2, 0, eq
	ccmp	w24, 25, 0, eq
	beq	.L3705
	mov	w1, 32257
	cmp	w21, w1
	beq	.L3706
	cmp	w21, w0
	bne	.L3707
.L3583:
	ldr	x1, [x19, 2376]
.L3686:
	cbz	x1, .L3676
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
.L3676:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	mov	w0, 0
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3545:
	mov	w1, 32257
	mov	w0, w23
	cmp	w21, w1
	bne	.L3550
	b	.L3583
	.p2align 3
.L3702:
	ldr	x1, .LC1065
	mov	w3, 2487
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 2376]
	b	.L3695
	.p2align 3
.L3707:
	ldr	x0, [x19, 2336]
	mov	w1, 8
	bl	BsGet
	mov	w20, w0
	ldr	x0, [x19, 2336]
	mov	w1, 8
	ubfx	x20, x20, 1, 6
	bl	BsSkip
	cmp	w20, 49
	bne	.L3583
	mov	x0, x19
	bl	HEVC_IsEosNal
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L3583
	ldr	x1, [x19, 2376]
	ldr	x0, [x19, 2336]
	ldr	w2, [x1, 48]
	ldr	x1, [x1, 40]
	bl	BsInit
	ldr	x0, [x19, 2336]
	mov	w1, 24
	bl	BsSkip
	mov	w0, 2
	b	.L3550
	.p2align 3
.L3579:
	ldr	x4, [x29, 88]
	uxtw	x2, w2
	ldr	x1, [x1, 72]
	ldr	x3, [x23, 104]
	add	x0, x4, x0, uxtw
	blr	x3
	ldr	x1, [x19, 2376]
	ldr	w0, [x21, 4]
	ldr	w1, [x1, 80]
	add	w0, w1, w0
	str	w0, [x21, 4]
.L3578:
	ldr	x20, .LC1073
	ldr	w0, [x19, 252]
	ldr	x1, [x20, w0, sxtw 3]
	cbz	x1, .L3582
	ldr	x1, [x23, 32]
	mov	w0, 0
	blr	x1
	ldrsw	x2, [x19, 252]
	ldr	w1, [x22, 356]
	ldr	x3, [x23, 88]
	ldr	x2, [x20, x2, lsl 3]
	ldr	x0, [x29, 88]
	blr	x3
	ldr	x1, [x23, 24]
	mov	w0, 0
	blr	x1
	ldr	w0, [x19, 252]
.L3582:
	ldr	x1, [x29, 88]
	bl	MetadataUnMapToSec
	cbz	w0, .L3583
	ldr	x2, .LC1066
	mov	w3, 2541
	ldr	x1, .LC1072
	mov	w0, 0
	add	x2, x2, 544
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3550
	.p2align 3
.L3705:
	ldr	x20, .LC1063
	ldr	x4, [x20]
	cbz	x4, .L3565
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L3565:
	mov	x0, x19
	bl	HEVC_DecVDM
	ldr	x1, [x19, 2376]
	cbz	w0, .L3686
	b	.L3695
	.p2align 3
.L3551:
	ldr	w2, [x1, 80]
	ldr	w3, [x1, 48]
	ldr	w0, [x19, 252]
	add	w3, w3, w2
	ldr	w1, [x21, 8]
	add	x2, x29, 88
	sub	w3, w3, #1
	bl	MetadataMapToSec
	cbnz	w0, .L3708
	ldr	x23, .LC1069
	mov	x2, 5
	ldr	x1, .LC1070
	ldr	x0, [x29, 88]
	ldr	x3, [x23, 104]
	add	x1, x1, 208
	blr	x3
	ldr	x1, [x19, 2376]
	ldr	x0, [x29, 88]
	ldr	w2, [x21, 4]
	ldr	x1, [x1, 40]
	add	x0, x0, 5
	ldr	x3, [x23, 104]
	add	x1, x1, 6
	blr	x3
	ldr	w0, [x21, 4]
	add	w0, w0, 5
	str	w0, [x21, 4]
	ldr	x1, [x19, 2376]
	ldr	w2, [x1, 80]
	cbz	w2, .L3555
	add	w3, w0, w2
	cmp	w3, 4096
	bls	.L3556
	uxtw	x2, w0
	ldr	x1, .LC1065
	mov	w3, 2346
	add	x2, x2, 5
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 2376]
	cbz	x1, .L3557
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
.L3557:
	ldr	x4, [x20]
	cbz	x4, .L3558
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L3558:
	ldr	w0, [x19, 252]
	ldr	x1, [x29, 88]
	bl	MetadataUnMapToSec
	cbz	w0, .L3675
	ldr	x2, .LC1066
	mov	w3, 2353
	ldr	x1, .LC1072
	mov	w0, 0
	add	x2, x2, 544
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3550
.L3556:
	ldr	x4, [x29, 88]
	uxtw	x2, w2
	ldr	x1, [x1, 72]
	ldr	x3, [x23, 104]
	add	x0, x4, x0, uxtw
	blr	x3
	ldr	x1, [x19, 2376]
	ldr	w0, [x21, 4]
	ldr	w1, [x1, 80]
	add	w0, w1, w0
	str	w0, [x21, 4]
.L3555:
	ldr	x20, .LC1073
	ldr	w0, [x19, 252]
	ldr	x1, [x20, w0, sxtw 3]
	cbz	x1, .L3559
	ldr	x1, [x23, 32]
	mov	w0, 0
	blr	x1
	ldrsw	x2, [x19, 252]
	ldr	w1, [x22, 356]
	ldr	x3, [x23, 88]
	ldr	x2, [x20, x2, lsl 3]
	ldr	x0, [x29, 88]
	blr	x3
	ldr	x1, [x23, 24]
	mov	w0, 0
	blr	x1
	ldr	w0, [x19, 252]
.L3559:
	ldr	x1, [x29, 88]
	bl	MetadataUnMapToSec
	cbz	w0, .L3583
	ldr	x2, .LC1066
	mov	w3, 2381
	ldr	x1, .LC1072
	mov	w0, 0
	add	x2, x2, 544
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3550
	.p2align 3
.L3706:
	ldr	x0, [x19, 2336]
	mov	w1, 16
	bl	BsSkip
	mov	w0, w23
	b	.L3550
.L3703:
	ldr	x2, .LC1066
	mov	w3, 2499
	ldr	x1, .LC1068
	mov	w0, 0
	add	x2, x2, 544
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3550
.L3708:
	ldr	x2, .LC1066
	mov	w3, 2334
	ldr	x1, .LC1068
	mov	w0, 0
	add	x2, x2, 544
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3550
	.size	HEVC_VES_Splitter, .-HEVC_VES_Splitter
	.align	3
.LC1063:
	.xword	g_event_report
	.align	3
.LC1065:
	.xword	.LC1064
	.align	3
.LC1066:
	.xword	.LANCHOR3
	.align	3
.LC1068:
	.xword	.LC1067
	.align	3
.LC1069:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1070:
	.xword	.LANCHOR2
	.align	3
.LC1072:
	.xword	.LC1071
	.align	3
.LC1073:
	.xword	vfmw_save_metadata_file
	.align	3
.LC1075:
	.xword	.LC1074
	.align	3
.LC1077:
	.xword	.LC1076
	.align	3
.LC1079:
	.xword	.LC1078
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CRAOutputFrame
	.type	HEVC_CRAOutputFrame, %function
HEVC_CRAOutputFrame:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 2772]
	cbz	w0, .L3721
	sub	w2, w0, #1
	mov	w20, 0
	add	x2, x2, 350
	add	x0, x19, 2792
	add	x2, x19, x2, lsl 3
	.p2align 2
.L3712:
	ldr	x1, [x0], 8
	ldrb	w1, [x1, 2]
	cmp	w1, wzr
	csinc	w20, w20, w20, ne
	cmp	x0, x2
	bne	.L3712
	.p2align 2
.L3713:
	mov	x0, x19
	bl	HEVC_RemoveUnUsedFrameStore
	cbnz	w0, .L3713
	cmp	w20, wzr
	ble	.L3715
	.p2align 2
.L3728:
	ldr	w1, [x19, 2772]
	cbz	w1, .L3716
	ldr	x0, [x19, 2792]
	ldrb	w0, [x0, 2]
	cbz	w0, .L3723
	add	x2, x19, 2800
	mov	w0, 0
	b	.L3720
	.p2align 3
.L3717:
	ldr	x3, [x2], 8
	ldrb	w3, [x3, 2]
	cbz	w3, .L3722
.L3720:
	add	w0, w0, 1
	cmp	w0, w1
	bne	.L3717
.L3716:
	mov	x0, x19
	bl	HEVC_OutputOneFrmFromDPB
	cmn	w0, #1
	beq	.L3718
	subs	w20, w20, #1
	bne	.L3728
.L3715:
	mov	w0, 0
.L3718:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3722:
	mov	w1, w0
	b	.L3716
.L3723:
	mov	w1, 0
	b	.L3716
.L3721:
	mov	w20, 0
	b	.L3713
	.size	HEVC_CRAOutputFrame, .-HEVC_CRAOutputFrame
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecSlice
	.type	HEVC_DecSlice, %function
HEVC_DecSlice:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 2376]
	ldrsw	x3, [x19, 252]
	ldr	x2, .LC1080
	ldr	w1, [x0, 16]
	str	w1, [x19, 4700]
	ldr	w4, [x0, 28]
	str	w4, [x19, 4696]
	ldr	w20, [x0, 24]
	strb	wzr, [x19, 3]
	str	w20, [x19, 4704]
	ldr	x2, [x2, x3, lsl 3]
	ldrsb	w3, [x2, 44]
	cmp	w3, 1
	beq	.L3799
.L3736:
	ldr	w0, [x19, 4824]
	cmp	w0, 1
	beq	.L3800
.L3740:
	ldr	w0, [x19, 152]
	ldr	w2, [x19, 204]
	cmp	w2, w0
	bcs	.L3801
	ldrb	w0, [x19, 3961]
	cbz	w0, .L3802
	mov	x0, x19
	bl	HEVC_PicTypeStatistic
	mov	x0, x19
	bl	HEVC_CalcStreamBits
	ldr	w0, [x19, 4824]
	cmp	w0, 2
	beq	.L3759
	add	x0, x19, 4096
	ldrb	w0, [x0, 577]
	cbz	w0, .L3803
.L3760:
	mov	x0, x19
	bl	HEVC_WriteSliceMsg
	cbnz	w0, .L3804
.L3763:
	ldr	w0, [x19, 3348]
	mov	w2, 1
	ldr	w1, [x19, 3344]
	ldr	w3, [x19, 4684]
	ldr	w4, [x19, 4708]
	str	w0, [x19, 4008]
	mov	w0, 0
	str	w2, [x19, 172]
	str	w3, [x19, 260]
	str	w4, [x19, 304]
	str	w1, [x19, 4004]
.L3795:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3803:
	mov	x0, x19
	bl	HEVC_DecList
	cbnz	w0, .L3805
	mov	x0, x19
	bl	HEVC_IsRefListWrong
	cbz	w0, .L3760
	mov	x0, x19
	bl	HEVC_PrintDPBState
	ldr	x1, .LC1102
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3795
	.p2align 3
.L3800:
	ldr	w0, [x19, 3964]
	sub	w0, w0, #16
	cmp	w0, 5
	bhi	.L3806
	cmp	w20, wzr
	sub	w1, w1, #16
	cset	w21, eq
.L3796:
	cmp	w1, 4
	cset	w0, ls
	tst	w21, w0
	beq	.L3807
.L3744:
	mov	x0, x19
	bl	HEVC_FlushOutputFrmFromDPB
	cbnz	w0, .L3808
.L3746:
	cbz	w21, .L3797
	uxtw	x20, w20
	add	x0, x19, x20
	ldrb	w21, [x0, 4]
	cmp	w21, 1
	beq	.L3809
.L3749:
	ldr	x0, [x19, 2432]
	ldr	w1, [x0, 12]
	cbnz	w1, .L3750
	add	x20, x19, x20, lsl 2
	mov	w21, -2147483647
	ldr	w3, [x20, 212]
	cmp	w3, w21
	beq	.L3750
	ldr	w1, [x19, 4696]
	ldr	x4, [x19, 2400]
	ldr	w2, [x19, 4684]
	add	x1, x4, x1, lsl 2
	ldr	w1, [x1, 360]
	add	w1, w3, w1
	cmp	w2, w1
	bge	.L3750
	ldr	w1, [x19, 4700]
	cmp	w1, 21
	bne	.L3750
	ldr	x1, .LC1087
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_CRAOutputFrame
	str	w21, [x20, 212]
	.p2align 2
.L3797:
	ldr	x0, [x19, 2432]
.L3750:
	ldr	w1, [x0, 8]
	cmp	w1, 2
	beq	.L3752
	ldr	w0, [x0, 24]
	cmp	w0, 2
	mov	x0, x19
	beq	.L3810
	bl	HEVC_RefPicProcess
	cbnz	w0, .L3768
.L3752:
	mov	x0, x19
	bl	HEVC_InitPic
	cmn	w0, #2
	beq	.L3795
	cbnz	w0, .L3811
	ldr	w1, [x19, 240]
	mov	x0, x19
	add	w1, w1, 1
	str	w1, [x19, 240]
	bl	HEVC_SetScalingList
	mov	x0, x19
	bl	HEVC_WritePicMsg
	cbz	w0, .L3740
	ldr	x1, .LC1091
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3795
	.p2align 3
.L3799:
	ldr	x3, [x2, 160]
	mov	x2, 1
	movk	x2, 0x2, lsl 32
	cmp	x3, x2
	bne	.L3736
	ldr	w0, [x0, 16]
	sub	w2, w0, #19
	cmp	w2, 1
	bls	.L3812
.L3738:
	sub	w0, w0, #6
	cmp	w0, 3
	bls	.L3736
	ldr	x2, [x19, 3384]
	str	x2, [x19, 3368]
	b	.L3736
	.p2align 3
.L3759:
	ldr	x1, [x19, 2376]
	cbz	x1, .L3763
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
	b	.L3763
	.p2align 3
.L3806:
	ldr	w0, [x19, 4692]
	cmp	w20, wzr
	cset	w21, eq
	sub	w1, w1, #16
	cmp	w0, 1
	bhi	.L3796
	cmp	w1, 4
	cset	w0, ls
	tst	w21, w0
	beq	.L3746
	b	.L3744
	.p2align 3
.L3807:
	ldr	x0, [x19, 2432]
	mov	x1, 4294967297
	ldr	x2, [x0, 696]
	cmp	x2, x1
	bne	.L3746
	ldr	w1, [x0, 704]
	cbnz	w1, .L3746
	ldr	w0, [x0, 660]
	add	w0, w0, 1024
	cmp	w0, 2048
	bls	.L3746
	b	.L3744
	.p2align 3
.L3810:
	bl	HEVC_UpdateReflist
	mov	x0, x19
	bl	HEVC_UpdateLTReflist
	b	.L3752
.L3808:
	ldr	x2, .LC1081
	mov	w0, 1
	ldr	x1, .LC1083
	add	x2, x2, 568
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3795
	.p2align 3
.L3809:
	ldr	w0, [x19, 2772]
	cbz	w0, .L3749
	mov	x0, x19
	bl	HEVC_EmptyFrmFromDPB
	cbz	w0, .L3749
	ldr	x2, .LC1081
	mov	w0, w21
	ldr	x1, .LC1085
	add	x2, x2, 568
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3795
	.p2align 3
.L3802:
	ldr	x1, .LC1098
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3795
	.p2align 3
.L3812:
	ldr	x2, [x19, 2432]
	ldr	x2, [x2, 64]
	cmn	x2, #1
	beq	.L3739
	ldr	x3, [x19, 11872]
	str	x2, [x19, 11864]
	str	x3, [x19, 11880]
	str	x3, [x19, 11888]
.L3739:
	add	x2, x19, 8192
	mov	w3, 1
	strb	w3, [x2, 3648]
	b	.L3738
	.p2align 3
.L3801:
	ldr	x1, .LC1093
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w1, [x19, 152]
	ldr	w2, [x19, 204]
	cmp	w2, w1
	bcc	.L3757
	ldr	x0, .LC1094
	ldr	x4, [x0]
	cbz	x4, .L3757
	ldr	w0, [x19, 252]
	mov	w3, 8
	stp	w2, w1, [x29, 56]
	add	x2, x29, 56
	mov	w1, 108
	blr	x4
.L3757:
	ldr	x1, .LC1096
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	mov	w0, -1
	b	.L3795
	.p2align 3
.L3805:
	ldr	x1, .LC1100
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3795
	.p2align 3
.L3804:
	ldr	x1, .LC1104
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3795
	.p2align 3
.L3811:
	ldr	x1, .LC1089
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3795
.L3768:
	mov	w0, -1
	b	.L3795
	.size	HEVC_DecSlice, .-HEVC_DecSlice
	.align	3
.LC1080:
	.xword	s_pstVfmwChan
	.align	3
.LC1081:
	.xword	.LANCHOR3
	.align	3
.LC1083:
	.xword	.LC1082
	.align	3
.LC1085:
	.xword	.LC1084
	.align	3
.LC1087:
	.xword	.LC1086
	.align	3
.LC1089:
	.xword	.LC1088
	.align	3
.LC1091:
	.xword	.LC1090
	.align	3
.LC1093:
	.xword	.LC1092
	.align	3
.LC1094:
	.xword	g_event_report
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
	.align	3
.LC1104:
	.xword	.LC1103
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecOneNal
	.type	HEVC_DecOneNal, %function
HEVC_DecOneNal:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x3, [x19, 2376]
	ldr	w0, [x3, 8]
	cbz	w0, .L3818
	ldr	w2, [x19, 244]
	mov	w0, 0
	.p2align 2
.L3817:
	uxtw	x1, w0
	add	w0, w0, 1
	add	x1, x3, x1, lsl 5
	ldr	w1, [x1, 48]
	add	w2, w2, w1
	str	w2, [x19, 244]
	ldr	w1, [x3, 8]
	cmp	w1, w0
	bhi	.L3817
.L3818:
	strb	wzr, [x3]
	ldr	x0, [x19, 2376]
	ldr	w1, [x0, 16]
	sub	w1, w1, #36
	cmp	w1, 1
	bls	.L3961
.L3816:
	ldr	w1, [x0, 4]
	add	w1, w1, 16
	str	w1, [x0, 4]
	ldr	x0, [x19, 2376]
	ldr	w2, [x0, 16]
	cmp	w2, 49
	bls	.L3962
.L3819:
	ldr	x1, .LC1116
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x19, 2376]
	ldr	w0, [x1, 16]
	cmp	w0, 63
	bhi	.L3846
	cbnz	x1, .L3948
	.p2align 2
.L3946:
	mov	w0, 0
.L3965:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3962:
	ldr	x0, .LC1105
	ldrb	w0, [x0,w2,uxtw]
	adr	x1, .Lrtx3821
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx3821:
	.section	.rodata
	.align	0
	.align	2
.L3821:
	.byte	(.L3820 - .Lrtx3821) / 4
	.byte	(.L3820 - .Lrtx3821) / 4
	.byte	(.L3820 - .Lrtx3821) / 4
	.byte	(.L3820 - .Lrtx3821) / 4
	.byte	(.L3820 - .Lrtx3821) / 4
	.byte	(.L3820 - .Lrtx3821) / 4
	.byte	(.L3820 - .Lrtx3821) / 4
	.byte	(.L3820 - .Lrtx3821) / 4
	.byte	(.L3820 - .Lrtx3821) / 4
	.byte	(.L3820 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3820 - .Lrtx3821) / 4
	.byte	(.L3820 - .Lrtx3821) / 4
	.byte	(.L3820 - .Lrtx3821) / 4
	.byte	(.L3820 - .Lrtx3821) / 4
	.byte	(.L3820 - .Lrtx3821) / 4
	.byte	(.L3820 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3822 - .Lrtx3821) / 4
	.byte	(.L3823 - .Lrtx3821) / 4
	.byte	(.L3824 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3825 - .Lrtx3821) / 4
	.byte	(.L3825 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3819 - .Lrtx3821) / 4
	.byte	(.L3826 - .Lrtx3821) / 4
	.byte	(.L3827 - .Lrtx3821) / 4
	.text
	.p2align 3
.L3961:
	mov	w1, 1
	strb	w1, [x19, 3]
	b	.L3816
.L3827:
	mov	x0, x19
	bl	HEVC_IsEosNal
	uxtb	w1, w0
	cmp	w1, 1
	beq	.L3963
.L3843:
	ldr	x1, [x19, 2376]
	cbz	x1, .L3946
.L3948:
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
	mov	w0, 0
.L3945:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L3820:
	mov	x0, x19
	bl	HEVC_DecSlice
	cmn	w0, #2
	beq	.L3945
	cbz	w0, .L3946
	ldr	x1, [x19, 2376]
	cbz	x1, .L3959
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
.L3959:
	ldr	x0, .LC1108
	ldr	x4, [x0]
	cbz	x4, .L3947
.L3949:
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L3947:
	mov	w0, -1
.L3964:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L3823:
	mov	x0, x19
	bl	HEVC_DecSPS
	mov	w20, w0
	ldr	x1, [x19, 2376]
	cbz	x1, .L3833
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
.L3833:
	cbz	w20, .L3946
	ldr	x1, .LC1110
	b	.L3956
.L3824:
	mov	x0, x19
	bl	HEVC_DecPPS
	mov	w20, w0
	ldr	x1, [x19, 2376]
	cbz	x1, .L3835
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
.L3835:
	cbz	w20, .L3946
	ldr	x1, .LC1112
	b	.L3956
.L3822:
	mov	x0, x19
	bl	HEVC_DecVPS
	mov	w20, w0
	ldr	x1, [x19, 2376]
	cbz	x1, .L3828
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
.L3828:
	cbz	w20, .L3946
	ldr	x1, .LC1107
.L3956:
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x21, .LC1108
	ldr	x4, [x21]
	cbz	x4, .L3947
	add	x2, x29, 64
	ldr	w0, [x19, 252]
	mov	w20, -1
	mov	w3, 4
	mov	w1, 100
	str	w20, [x2, -8]!
	blr	x4
	ldr	x4, [x21]
	cbz	x4, .L3947
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
.L3825:
	mov	x0, x19
	bl	HEVC_DecSEI
	mov	w20, w0
	ldr	x1, [x19, 2376]
	cbz	x1, .L3836
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
.L3836:
	cbz	w20, .L3946
	ldr	x1, .LC1114
	mov	w0, 1
	bl	dprint_vfmw
	b	.L3959
.L3826:
	add	x20, x19, 2728
	mov	w1, 32
	mov	x0, x20
	bl	BsGet
	mov	w21, w0
	mov	w1, 32
	mov	x0, x20
	bl	BsGet
	mov	w20, w0
	ldrb	w0, [x19, 8]
	cmp	w0, 1
	beq	.L3841
	ldr	x1, [x19, 2376]
	cbz	x1, .L3840
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
.L3840:
	ldrb	w0, [x19, 3961]
	cbz	w0, .L3946
.L3841:
	mov	w1, 20553
	mov	w0, 20036
	movk	w1, 0x4853, lsl 16
	movk	w0, 0x4345, lsl 16
	cmp	w21, w1
	strb	wzr, [x19, 8]
	ccmp	w20, w0, 0, eq
	bne	.L3946
	ldr	x20, .LC1108
	ldr	x4, [x20]
	cbz	x4, .L3842
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L3842:
	ldrb	w0, [x19, 3961]
	cbz	w0, .L3946
	mov	x0, x19
	bl	HEVC_DecVDM
	cbz	w0, .L3946
.L3845:
	ldr	x4, [x20]
	cbnz	x4, .L3949
	mov	w0, -1
	b	.L3964
	.p2align 3
.L3846:
	ldr	x20, .LC1108
	ldr	x4, [x20]
	cbz	x4, .L3847
	ldr	w0, [x19, 252]
	mov	w1, 102
	mov	w3, 0
	mov	x2, 0
	blr	x4
	ldr	x1, [x19, 2376]
	cbz	x1, .L3848
.L3849:
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
.L3848:
	ldr	x4, [x20]
	cbz	x4, .L3946
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	mov	w0, 0
	b	.L3965
.L3847:
	cbnz	x1, .L3849
	mov	w0, 0
	b	.L3965
.L3963:
	ldr	x20, .LC1108
	strb	w0, [x19, 9]
	ldr	x4, [x20]
	cbz	x4, .L3844
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L3844:
	ldrb	w0, [x19, 3961]
	cbz	w0, .L3843
	mov	x0, x19
	bl	HEVC_DecVDM
	cbz	w0, .L3843
	ldr	x1, [x19, 2376]
	cbz	x1, .L3845
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
	b	.L3845
	.size	HEVC_DecOneNal, .-HEVC_DecOneNal
	.align	3
.LC1105:
	.xword	.L3821
	.align	3
.LC1107:
	.xword	.LC1106
	.align	3
.LC1108:
	.xword	g_event_report
	.align	3
.LC1110:
	.xword	.LC1109
	.align	3
.LC1112:
	.xword	.LC1111
	.align	3
.LC1114:
	.xword	.LC1113
	.align	3
.LC1116:
	.xword	.LC1115
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_UnMarkFrameStoreRef
	.type	HEVC_UnMarkFrameStoreRef, %function
HEVC_UnMarkFrameStoreRef:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	strb	wzr, [x19, 1]
	ldr	w1, [x19, 28]
	mov	w2, 0
	ldr	w0, [x20, 252]
	bl	FSP_SetRef
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_UnMarkFrameStoreRef, .-HEVC_UnMarkFrameStoreRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InquireSliceProperty
	.type	HEVC_InquireSliceProperty, %function
HEVC_InquireSliceProperty:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x20, x2
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	str	wzr, [x20]
	ldr	x3, .LC1117
	add	x0, x19, 4096
	str	wzr, [x21]
	mov	x2, 1356
	mov	w1, 0
	add	x0, x0, 576
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x1, [x19, 2376]
	mov	x0, x19
	ldr	w2, [x1, 16]
	str	w2, [x19, 4700]
	ldr	w2, [x1, 28]
	str	w2, [x19, 4696]
	ldr	w1, [x1, 24]
	str	w1, [x19, 4704]
	bl	HEVC_DecSliceSegmentHeader
	cbnz	w0, .L3979
	ldr	w2, [x19, 4708]
	mov	w5, 1888
	ldr	x1, [x19, 2360]
	mov	w3, 12660
	ldr	w4, [x19, 4824]
	ldr	x0, [x19, 2352]
	smaddl	x1, w2, w5, x1
	cmp	w4, 1
	cset	w2, eq
	ldr	w1, [x1, 32]
	str	w2, [x21]
	smaddl	x0, w1, w3, x0
	ldr	x2, [x19, 2400]
	ldr	x1, [x19, 2432]
	ldr	w4, [x0, 184]
	ldr	w3, [x2, 184]
	ldr	w5, [x1, 936]
	cmp	w4, w3
	ldr	w6, [x0, 64]
	cset	w3, ne
	cmp	w5, 1
	ldr	w4, [x0, 68]
	ldp	w5, w2, [x2, 64]
	beq	.L3980
.L3971:
	cmp	w6, w5
	cset	w0, ne
	cmp	w4, w2
	orr	w0, w3, w0
	cset	w1, ne
	orr	w0, w1, w0
	cbz	w0, .L3975
	mov	w1, 1
	mov	w0, 0
	str	w1, [x20]
.L3969:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3979:
	ldr	x1, .LC1119
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC1120
	ldr	x4, [x0]
	cbz	x4, .L3974
	add	x2, x29, 64
	ldr	w0, [x19, 252]
	mov	w20, -1
	mov	w3, 4
	mov	w1, 100
	str	w20, [x2, -8]!
	blr	x4
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3980:
	ldr	w7, [x0, 96]
	ldr	w0, [x0, 88]
	cmp	w0, w7
	csel	w0, w0, w7, cs
	str	w0, [x1, 1004]
	ldr	x0, [x19, 2400]
	ldr	x7, [x19, 2432]
	ldr	w1, [x0, 96]
	ldr	w0, [x0, 88]
	cmp	w0, w1
	csel	w0, w0, w1, cs
	ldr	w1, [x7, 1004]
	cmp	w0, 8
	ccmp	w1, 8, 0, hi
	bne	.L3981
.L3972:
	mov	w0, 1
	str	w0, [x7, 1008]
	str	w0, [x20]
	b	.L3971
	.p2align 3
.L3975:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3974:
	mov	w0, -1
	b	.L3969
	.p2align 3
.L3981:
	cmp	w0, 8
	ccmp	w1, 8, 4, eq
	ble	.L3971
	b	.L3972
	.size	HEVC_InquireSliceProperty, .-HEVC_InquireSliceProperty
	.align	3
.LC1117:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1119:
	.xword	.LC1118
	.align	3
.LC1120:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_HaveSliceToDec
	.type	HEVC_HaveSliceToDec, %function
HEVC_HaveSliceToDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, 0
	bl	_mcount
	ldr	w0, [x19, 204]
	cbnz	w0, .L3983
	ldrb	w0, [x19, 3961]
	mov	w20, -1
	cbnz	w0, .L3987
.L3983:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3987:
	ldr	x2, .LC1121
	mov	w0, 0
	ldr	x1, .LC1123
	add	x2, x2, 584
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_HaveSliceToDec, .-HEVC_HaveSliceToDec
	.align	3
.LC1121:
	.xword	.LANCHOR3
	.align	3
.LC1123:
	.xword	.LC1122
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetPicStreamSize
	.type	HEVC_GetPicStreamSize, %function
HEVC_GetPicStreamSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, [x19, 9136]
	mov	w0, 0
	cbz	x2, .L3989
	.p2align 2
.L3990:
	ldp	w3, w1, [x2]
	ldr	x2, [x2, 1360]
	add	w1, w3, w1
	add	w1, w1, 7
	add	w0, w0, w1, lsr 3
	cbnz	x2, .L3990
.L3989:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_GetPicStreamSize, .-HEVC_GetPicStreamSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_AllocHevcGlbMem
	.type	HEVCDEC_AllocHevcGlbMem, %function
HEVCDEC_AllocHevcGlbMem:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	mov	w20, 0
	bl	_mcount
	ldr	x19, .LC1124
	ldr	x0, [x19]
	cbz	x0, .L3997
.L3994:
	mov	w0, w20
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3997:
	ldr	x21, .LC1125
	mov	w0, 372
	movk	w0, 0xa, lsl 16
	ldr	x1, [x21, 432]
	blr	x1
	str	x0, [x19]
	cbz	x0, .L3998
	ldr	x3, [x21, 96]
	mov	x2, 372
	movk	x2, 0xa, lsl 16
	mov	w1, 0
	blr	x3
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L3998:
	ldr	x1, .LC1127
	mov	w2, 15336
	mov	w0, 1
	mov	w20, -1
	bl	dprint_vfmw
	b	.L3994
	.size	HEVCDEC_AllocHevcGlbMem, .-HEVCDEC_AllocHevcGlbMem
	.align	3
.LC1124:
	.xword	.LANCHOR1
	.align	3
.LC1125:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1127:
	.xword	.LC1126
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_ReleaseHevcGlbMem
	.type	HEVCDEC_ReleaseHevcGlbMem, %function
HEVCDEC_ReleaseHevcGlbMem:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC1128
	ldr	x0, [x19]
	cbz	x0, .L3999
	ldr	x1, .LC1129
	ldr	x1, [x1, 440]
	blr	x1
	str	xzr, [x19]
.L3999:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVCDEC_ReleaseHevcGlbMem, .-HEVCDEC_ReleaseHevcGlbMem
	.align	3
.LC1128:
	.xword	.LANCHOR1
	.align	3
.LC1129:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_Init
	.type	HEVCDEC_Init, %function
HEVCDEC_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x0, .LC1130
	ldr	x0, [x0]
	cbz	x0, .L4014
	ldr	x20, .LC1133
	mov	x2, 27864
	mov	w1, 0
	mov	x0, x19
	ldr	w22, [x19, 6632]
	ldr	x3, [x20, 96]
	blr	x3
	str	x21, [x19, 2432]
	str	xzr, [x19, 2448]
	str	w22, [x19, 6632]
	ldr	w0, [x21, 28]
	cmp	w0, 25
	beq	.L4015
	mov	w0, 17
	mov	w3, 65
	mov	w2, 200
	mov	w1, 210
	stp	w2, w0, [x19, 152]
	stp	w0, w3, [x19, 160]
	str	w1, [x19, 168]
.L4008:
	ldr	w0, [x21, 632]
	bl	MEM_Phy2Vir
	cbz	x0, .L4016
	ldr	x8, [x19, 2432]
	mov	w22, 12660
	ldr	w2, [x19, 156]
	ldpsw	x6, x5, [x19, 160]
	ldr	w7, [x8, 628]
	lsl	w4, w2, 7
	add	w4, w4, w2, lsl 2
	lsl	w1, w5, 4
	add	w4, w4, w7
	sub	w1, w1, w5
	ldr	w3, [x19, 168]
	lsl	w1, w1, 2
	madd	w6, w22, w6, w4
	sub	w5, w1, w5
	add	x4, x0, x4, uxtw
	add	w1, w3, 1
	str	x4, [x19, 2352]
	lsl	w4, w1, 3
	add	w5, w6, w5, lsl 5
	sub	w4, w4, w1
	add	x6, x0, x6, uxtw
	lsl	w4, w4, 1
	str	x6, [x19, 2360]
	ldrsw	x6, [x19, 152]
	sub	w1, w4, w1
	mov	w4, 1368
	add	x7, x0, x7, uxtw
	str	x7, [x19, 2344]
	sxtw	x2, w2
	madd	w4, w4, w6, w5
	add	x5, x0, x5, uxtw
	str	x5, [x19, 2440]
	add	w1, w4, w1, lsl 3
	add	x4, x0, x4, uxtw
	str	x4, [x19, 2424]
	add	x4, x0, x1, uxtw
	str	x4, [x19, 2416]
	add	w3, w1, w3, lsl 3
	ldr	w4, [x8, 636]
	cmp	w3, w4
	bhi	.L4017
	ldr	w0, [x21, 664]
	cbz	w0, .L4018
.L4011:
	lsl	x2, x6, 2
	ldr	x3, [x20, 96]
	sub	x2, x2, x6
	mov	x0, x5
	lsl	x2, x2, 2
	mov	w1, 0
	sub	x2, x2, x6
	lsl	x2, x2, 2
	sub	x2, x2, x6
	lsl	x2, x2, 2
	sub	x2, x2, x6
	lsl	x2, x2, 3
	blr	x3
	ldr	w2, [x19, 168]
	mov	w4, 104
	ldr	x3, [x20, 96]
	mov	w1, 0
	add	w2, w2, 1
	ldr	x0, [x19, 2424]
	smull	x2, w2, w4
	blr	x3
	ldrsw	x2, [x19, 168]
	mov	w1, 0
	ldr	x3, [x20, 96]
	ldr	x0, [x19, 2416]
	lsl	x2, x2, 3
	blr	x3
	ldp	w5, w4, [x19, 156]
	mov	x1, -132
	mov	w0, 132
	ldr	w2, [x19, 164]
	mov	w8, 1888
	ldr	x9, [x19, 2344]
	mov	x7, -1888
	smaddl	x0, w5, w0, x1
	mov	w3, 12660
	mov	x1, -12660
	ldr	x6, [x19, 2360]
	smaddl	x3, w4, w3, x1
	ldr	x4, [x19, 2352]
	add	x1, x9, x0
	smaddl	x0, w2, w8, x7
	str	x1, [x19, 2392]
	add	x2, x4, x3
	add	x0, x6, x0
	str	x2, [x19, 2400]
	str	x0, [x19, 2408]
	mov	x0, x19
	str	w5, [x1, 4]
	ldr	x1, [x19, 2408]
	ldr	w2, [x19, 160]
	str	w2, [x1, 28]
	ldr	x1, [x19, 2400]
	ldr	w2, [x19, 164]
	str	w2, [x1, 56]
	bl	HEVC_InitScalingOrderTable
	mov	x0, x19
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x19, 252]
	beq	.L4019
	mov	w1, -2147483647
	mov	x0, x19
	str	w1, [x19, 212]
	bl	HEVC_InitDecPara
	str	wzr, [x19, 11896]
	mov	w0, 1
	ldr	w2, [x19, 164]
	mov	w1, 9999
	strb	w0, [x19]
	str	w1, [x19, 260]
	mov	w0, 0
	str	w2, [x19, 304]
.L4013:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L4018:
	lsl	x0, x2, 7
	ldr	x3, [x20, 96]
	add	x2, x0, x2, lsl 2
	mov	w1, 0
	mov	x0, x7
	blr	x3
	ldr	w2, [x19, 160]
	mov	w1, 0
	ldr	x3, [x20, 96]
	ldr	x0, [x19, 2352]
	smull	x2, w2, w22
	blr	x3
	ldr	w4, [x19, 164]
	mov	w2, 1888
	ldr	x0, [x19, 2360]
	mov	w1, 0
	ldr	x3, [x20, 96]
	smull	x2, w4, w2
	blr	x3
	ldrsw	x6, [x19, 152]
	ldr	x5, [x19, 2440]
	b	.L4011
	.p2align 3
.L4015:
	ldr	w0, [x21, 744]
	str	w0, [x19, 156]
	ldr	w0, [x21, 748]
	str	w0, [x19, 160]
	ldr	w0, [x21, 752]
	str	w0, [x19, 164]
	ldr	w0, [x21, 740]
	str	w0, [x19, 152]
	add	w0, w0, 5
	str	w0, [x19, 168]
	b	.L4008
.L4017:
	ldr	x2, .LC1131
	mov	w0, 0
	ldr	x1, .LC1137
	add	x2, x2, 608
	bl	dprint_vfmw
	mov	w0, -20
	b	.L4013
.L4014:
	ldr	x2, .LC1131
	ldr	x1, .LC1132
	add	x2, x2, 608
	bl	dprint_vfmw
	mov	w0, -20
	b	.L4013
.L4019:
	ldr	x2, .LC1131
	mov	w0, 0
	ldr	x1, .LC1139
	add	x2, x2, 608
	bl	dprint_vfmw
	mov	w0, -20
	b	.L4013
.L4016:
	ldr	x2, .LC1131
	ldr	x1, .LC1135
	add	x2, x2, 608
	bl	dprint_vfmw
	mov	w0, -20
	b	.L4013
	.size	HEVCDEC_Init, .-HEVCDEC_Init
	.align	3
.LC1130:
	.xword	.LANCHOR1
	.align	3
.LC1131:
	.xword	.LANCHOR3
	.align	3
.LC1132:
	.xword	.LC140
	.align	3
.LC1133:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1135:
	.xword	.LC1134
	.align	3
.LC1137:
	.xword	.LC1136
	.align	3
.LC1139:
	.xword	.LC1138
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_GetImageBuffer
	.type	HEVCDEC_GetImageBuffer, %function
HEVCDEC_GetImageBuffer:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 180]
	cbz	w0, .L4023
	ldrb	w0, [x19, 3961]
	cmp	w0, 1
	beq	.L4023
	add	x1, x19, 12288
	add	x4, x19, 24576
	add	x1, x1, 1168
	add	x4, x4, 3280
	.p2align 2
.L4029:
	ldr	w0, [x1, 48]
	cbnz	w0, .L4024
	cbz	x1, .L4025
	ldr	w3, [x19, 2772]
	cbz	w3, .L4025
	ldr	x0, [x19, 2792]
	cmp	x0, x1
	beq	.L4024
	sub	w3, w3, #1
	mov	x0, x19
	add	x3, x19, x3, lsl 3
	b	.L4026
	.p2align 3
.L4027:
	ldr	x2, [x0, 2792]
	cmp	x2, x1
	beq	.L4024
.L4026:
	cmp	x3, x0
	add	x0, x0, 8
	bne	.L4027
.L4025:
	ldr	w0, [x19, 252]
	bl	FSP_IsNewFsAvalible
	cmp	w0, 1
	beq	.L4023
	cmn	w0, #1
	beq	.L4048
.L4047:
	mov	w0, 0
.L4049:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L4023:
	ldr	x19, [sp, 16]
	mov	w0, 1
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L4024:
	add	x1, x1, 720
	cmp	x1, x4
	bne	.L4029
	add	x0, x19, 4096
	add	x2, x29, 44
	add	x1, x29, 40
	add	x0, x0, 1936
	bl	GetQueueImgNum
	mov	x0, x19
	bl	HEVC_PrintFrameStoreState
	ldr	x1, .LC1143
	mov	w0, 0
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_PrintDPBState
	ldr	w0, [x19, 180]
	ldr	w2, [x19, 2772]
	ldp	w3, w4, [x29, 40]
	sub	w0, w0, #2
	sub	w0, w0, w2
	add	w1, w3, w4
	cmp	w1, w0
	bge	.L4047
	ldr	x2, .LC1144
	mov	w0, 0
	ldr	x1, .LC1146
	add	x2, x2, 624
	bl	dprint_vfmw
	mov	w1, 1
	mov	x0, x19
	bl	HEVC_ClearAll
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 48
	ret
.L4048:
	ldr	x1, .LC1141
	mov	w0, 1
	bl	dprint_vfmw
	add	x1, x19, 4096
	ldr	w0, [x19, 252]
	add	x1, x1, 1936
	bl	FSP_ClearNotInVoQueue
	mov	w0, 0
	b	.L4049
	.size	HEVCDEC_GetImageBuffer, .-HEVCDEC_GetImageBuffer
	.align	3
.LC1141:
	.xword	.LC1140
	.align	3
.LC1143:
	.xword	.LC1142
	.align	3
.LC1144:
	.xword	.LANCHOR3
	.align	3
.LC1146:
	.xword	.LC1145
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_DecodePacket
	.type	HEVCDEC_DecodePacket, %function
HEVCDEC_DecodePacket:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	str	wzr, [x29, 100]
	stp	wzr, wzr, [x29, 92]
	cbz	x20, .L4121
	ldrb	w0, [x19]
	cmp	w0, 1
	bne	.L4122
	ldr	x2, [x19, 2432]
	ldrb	w0, [x19, 7]
	cmp	w0, 1
	ldr	w0, [x2, 8]
	ubfiz	w0, w0, 16, 3
	str	w0, [x19, 248]
	beq	.L4054
	ldr	w0, [x2, 936]
	cmp	w0, 1
	beq	.L4123
.L4055:
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_ReceivePacket
	mov	w20, w0
	ldr	x1, [x19, 2376]
	str	x1, [x19, 2384]
.L4056:
	strb	wzr, [x19, 7]
	mov	w0, 0
	cbz	w20, .L4124
.L4106:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4123:
	ldr	w0, [x2, 992]
	cmp	w0, 1
	bne	.L4055
	ldr	w0, [x19, 328]
	cmp	w0, 1
	bne	.L4055
	ldr	x0, [x19, 2384]
	str	x0, [x19, 2376]
	mov	w0, 0
	strb	wzr, [x19, 7]
	str	wzr, [x19, 328]
	b	.L4106
	.p2align 3
.L4124:
	str	wzr, [x1, 4]
	ldr	x1, [x19, 2376]
	ldr	x0, [x19, 2336]
	ldr	w2, [x1, 48]
	ldr	x1, [x1, 40]
	bl	BsInit
	ldr	x0, [x19, 2336]
	mov	w1, 24
	bl	BsSkip
	ldr	x21, .LC1153
	ldrsw	x0, [x19, 252]
	ldr	x0, [x21, x0, lsl 3]
	ldrsb	w20, [x0, 44]
	cmp	w20, 1
	beq	.L4125
	mov	w22, 3
	mov	w23, 2
.L4118:
	mov	w24, 0
.L4057:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x20, [x19, 2376]
	ldr	x0, [x19, 2336]
	mov	w1, 6
	bl	BsGet
	str	w0, [x20, 16]
	mov	w1, 6
	ldr	x20, [x19, 2376]
	ldr	x0, [x19, 2336]
	bl	BsGet
	str	w0, [x20, 24]
	ldr	x20, [x19, 2376]
	ldr	w2, [x20, 24]
	cbnz	w2, .L4126
	ldr	x0, [x19, 2336]
	mov	w1, 3
	bl	BsGet
	str	w0, [x20, 28]
	ldr	x20, [x19, 2376]
	ldr	w0, [x20, 28]
	cbnz	w0, .L4127
.L4060:
	ldr	w0, [x20, 16]
	bl	HEVC_IsSliceUnit
	sxtb	w25, w0
	cmp	w25, 1
	beq	.L4128
	str	wzr, [x20, 4]
	add	x0, x19, 2728
	ldr	x1, [x19, 2376]
	ldr	w2, [x1, 48]
	ldr	x1, [x1, 40]
	bl	BsInit
	ldr	x0, [x19, 2336]
	mov	w1, 24
	bl	BsSkip
	cmp	w23, 1
	ccmp	w22, 1, 0, eq
	ccmp	w24, 1, 4, eq
	beq	.L4076
	ldr	x0, [x19, 2336]
	mov	w1, 16
	bl	BsSkip
.L4076:
	ldr	x0, [x19, 2336]
	mov	w1, 1
	bl	BsGet
	ldr	x20, [x19, 2376]
	ldr	x0, [x19, 2336]
	mov	w1, 6
	bl	BsGet
	str	w0, [x20, 16]
	mov	w1, 6
	ldr	x20, [x19, 2376]
	ldr	x0, [x19, 2336]
	bl	BsGet
	str	w0, [x20, 24]
	mov	w1, 3
	ldr	x20, [x19, 2376]
	ldr	x0, [x19, 2336]
	bl	BsGet
	str	w0, [x20, 28]
	ldr	x1, [x19, 2376]
	ldr	w0, [x1, 28]
	cbz	w0, .L4065
	sub	w0, w0, #1
	str	w0, [x1, 28]
.L4065:
	mov	x0, x19
	bl	HEVC_DecOneNal
	cmn	w0, #2
	beq	.L4106
	cbnz	w0, .L4129
	str	wzr, [x19, 4016]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4054:
	ldr	x1, [x19, 2376]
	cmp	x1, xzr
	csetm	w20, eq
	cbz	w20, .L4056
	ldr	x1, .LC1152
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, w20
	b	.L4106
	.p2align 3
.L4127:
	sub	w0, w0, #1
	str	w0, [x20, 28]
	ldr	x20, [x19, 2376]
	b	.L4060
	.p2align 3
.L4125:
	ldp	w23, w22, [x0, 156]
	ldr	w3, [x0, 164]
	mov	x0, x19
	mov	w2, w22
	mov	w1, w23
	bl	HEVC_VES_Splitter
	cmp	w0, 2
	beq	.L4081
	cmp	w0, 1
	bne	.L4106
	b	.L4118
	.p2align 3
.L4126:
	ldr	x1, .LC1155
	mov	w3, 0
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 2376]
	cbz	x1, .L4119
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
.L4119:
	mov	w0, -1
	b	.L4106
	.p2align 3
.L4128:
	add	x2, x29, 108
	add	x1, x29, 104
	mov	x0, x19
	bl	HEVC_InquireSliceProperty
	cbnz	w0, .L4062
	ldr	w20, [x29, 104]
	cmp	w20, 1
	beq	.L4130
.L4063:
	ldr	w20, [x29, 108]
	cmp	w20, 1
	bne	.L4065
	ldr	x0, [x19, 2376]
	ldr	w0, [x0, 24]
	add	x0, x19, x0
	ldrb	w22, [x0, 4]
	mov	x0, x19
	cmp	w22, 1
	beq	.L4131
	bl	HEVC_FlushOutputFrmFromDPB
	cbnz	w0, .L4132
.L4068:
	ldr	w0, [x19, 252]
	bl	FSP_GetFspType
	cbnz	w0, .L4065
	ldr	w0, [x19, 252]
	add	x3, x29, 100
	add	x2, x29, 96
	add	x1, x29, 92
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x19, 2432]
	ldr	w0, [x0, 772]
	cmp	w0, 1
	bne	.L4065
	ldr	w1, [x29, 100]
	cmp	w1, wzr
	bgt	.L4071
	ldr	w2, [x29, 96]
	cmp	w2, 32
	bgt	.L4071
	ldr	x2, [x19, 2448]
	cbnz	x2, .L4071
	ldr	w2, [x29, 108]
	cbz	w2, .L4065
	ldr	w3, [x19, 240]
	cbz	w3, .L4065
	ldr	x3, [x19, 2400]
	ldr	w4, [x19, 320]
	ldr	w6, [x3, 68]
	cmp	w6, w4
	beq	.L4065
	ldr	w5, [x3, 64]
	cmp	w1, wzr
	ldr	w3, [x19, 324]
	ccmp	w5, w3, 4, eq
	beq	.L4065
	ldr	x1, .LC1161
	bl	dprint_vfmw
	ldr	x0, [x19, 2400]
	ldr	x1, .LC1162
	ldr	w2, [x0, 68]
	str	w2, [x19, 320]
	ldr	x4, [x1]
	ldr	w0, [x0, 64]
	str	w0, [x19, 324]
	cbz	x4, .L4065
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 120
	blr	x4
	b	.L4065
	.p2align 3
.L4122:
	ldr	x1, .LC1150
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4106
	.p2align 3
.L4081:
	mov	w24, w20
	b	.L4057
	.p2align 3
.L4062:
	ldr	x1, .LC1164
	mov	w0, w25
	bl	dprint_vfmw
	ldr	x1, [x19, 2376]
	cbz	x1, .L4073
	ldr	w0, [x19, 252]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2376]
.L4073:
	ldr	x0, .LC1162
	ldr	x4, [x0]
	cbz	x4, .L4074
	ldr	w0, [x19, 252]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L4074:
	ldrsw	x0, [x19, 252]
	ldr	x0, [x21, x0, lsl 3]
	ldrsb	w1, [x0, 44]
	cmp	w1, 1
	bne	.L4119
	ldr	x1, [x0, 160]
	mov	x0, 1
	movk	x0, 0x2, lsl 32
	cmp	x1, x0
	bne	.L4119
	add	x0, x19, 8192
	ldrb	w1, [x0, 3648]
	cbnz	w1, .L4119
	ldr	x3, .LC1165
	mov	x2, 56
	add	x0, x0, 3648
	ldr	x3, [x3, 96]
	blr	x3
	str	wzr, [x19, 3340]
	add	x1, x19, 3072
	mov	w0, -1
	stp	xzr, xzr, [x1, 288]
	stp	xzr, xzr, [x1, 304]
	b	.L4106
.L4130:
	ldr	w1, [x19, 204]
	cbnz	w1, .L4064
	ldrb	w1, [x19, 3961]
	cbz	w1, .L4063
	ldr	x2, .LC1156
	ldr	x1, .LC1157
	add	x2, x2, 584
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	b	.L4063
.L4064:
	ldr	x3, [x19, 2376]
	mov	w2, 21
	ldr	x1, .LC1156
	add	x0, x19, 2728
	str	wzr, [x3, 4]
	add	x1, x1, 672
	bl	BsInit
	ldr	x0, [x19, 2336]
	mov	w1, 40
	bl	BsSkip
	ldr	x1, [x19, 2376]
	mov	w2, 48
	mov	x0, x19
	str	w2, [x1, 16]
	strb	w20, [x19, 8]
	bl	HEVC_DecOneNal
	strb	w20, [x19, 7]
	ldr	w1, [x19, 288]
	mov	w0, -2
	add	w1, w1, 1
	str	w1, [x19, 288]
	b	.L4106
.L4121:
	ldr	x1, .LC1148
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4106
.L4131:
	bl	HEVC_EmptyFrmFromDPB
	cbz	w0, .L4068
	ldr	x2, .LC1156
	mov	w0, w22
	ldr	x1, .LC1158
	add	x2, x2, 648
	bl	dprint_vfmw
	b	.L4068
.L4129:
	ldr	x1, .LC1167
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4106
.L4132:
	ldr	x2, .LC1156
	mov	w0, w20
	ldr	x1, .LC1159
	add	x2, x2, 648
	bl	dprint_vfmw
	b	.L4068
.L4071:
	ldrsw	x2, [x19, 252]
	mov	w1, 1
	mov	w0, -2
	ldr	x2, [x21, x2, lsl 3]
	str	w1, [x2, 1704]
	strb	w1, [x19, 7]
	b	.L4106
	.size	HEVCDEC_DecodePacket, .-HEVCDEC_DecodePacket
	.align	3
.LC1148:
	.xword	.LC1147
	.align	3
.LC1150:
	.xword	.LC1149
	.align	3
.LC1152:
	.xword	.LC1151
	.align	3
.LC1153:
	.xword	s_pstVfmwChan
	.align	3
.LC1155:
	.xword	.LC1154
	.align	3
.LC1156:
	.xword	.LANCHOR3
	.align	3
.LC1157:
	.xword	.LC1122
	.align	3
.LC1158:
	.xword	.LC1084
	.align	3
.LC1159:
	.xword	.LC1082
	.align	3
.LC1161:
	.xword	.LC1160
	.align	3
.LC1162:
	.xword	g_event_report
	.align	3
.LC1164:
	.xword	.LC1163
	.align	3
.LC1165:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1167:
	.xword	.LC1166
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_VDMPostProc
	.type	HEVCDEC_VDMPostProc, %function
HEVCDEC_VDMPostProc:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	w23, w1
	mov	x21, x3
	mov	w22, w4
	mov	w20, w5
	bl	_mcount
	ldr	x1, [x19, 2432]
	ldr	x0, [x19, 4024]
	ldr	w24, [x1, 684]
	str	w23, [x19, 4000]
	cbz	x0, .L4134
	add	x1, x19, 4096
	ldrb	w2, [x1, 2549]
	strb	w2, [x0, 3]
	ldrb	w1, [x1, 2544]
	strb	w1, [x0, 4]
.L4134:
	cbz	w22, .L4135
	ldr	x5, .LC1168
	sbfiz	x20, x20, 6, 32
	add	x20, x5, x20
	ldr	w0, [x20, 44]
	cmp	w0, 3
	beq	.L4159
	cmp	w0, 1
	beq	.L4135
	cmp	w24, 1
	beq	.L4160
.L4139:
	mov	x1, x21
	mov	x0, x19
	bl	HEVC_StorePicInDPB
	cbnz	w0, .L4161
	mov	w1, 1
	mov	w0, 0
	str	w1, [x19, 172]
.L4137:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L4161:
	ldr	x1, .LC1172
	mov	w2, w0
	mov	w0, 0
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	mov	x0, x19
	bl	HEVC_ClearDPB
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L4135:
	mov	x0, x19
	bl	HEVC_ClearAllSlice
	cmp	w24, 1
	bne	.L4139
.L4160:
	ldr	x20, [x19, 2448]
	ldr	w0, [x20, 1292]
	add	x0, x20, x0, lsl 2
	ldr	w23, [x0, 1476]
	mov	w0, w23
	bl	MEM_Phy2Vir
	mov	x22, x0
	ldp	w7, w2, [x20, 192]
	ldr	x3, .LC1169
	mov	w1, w23
	add	w2, w2, 15
	add	w7, w7, 15
	and	w2, w2, -16
	and	w7, w7, -16
	ldr	x3, [x3, 280]
	mul	w7, w2, w7
	lsr	w20, w7, 8
	lsl	w2, w20, 4
	blr	x3
	cbz	w20, .L4150
	mov	w7, 0
	mov	w6, 0
	mov	w4, 2147483647
	mov	w5, 0
	mov	w2, 0
	.p2align 2
.L4146:
	ubfiz	x1, x2, 4, 28
	add	x1, x22, x1
	ldrsh	w3, [x1, 4]
	neg	w0, w3
	and	w8, w3, 32767
	tbz	x3, 15, .L4142
	and	w8, w0, 32767
.L4142:
	ldrsh	w1, [x1, 6]
	neg	w3, w1
	and	w0, w1, 32767
	tbz	x1, 15, .L4144
	and	w0, w3, 32767
.L4144:
	add	w0, w8, w0
	add	w2, w2, 1
	cmp	w4, w0
	add	w7, w7, w0
	csel	w4, w4, w0, le
	cmp	w5, w0
	csel	w5, w5, w0, ge
	cmp	w0, wzr
	csinc	w6, w6, w6, ne
	cmp	w20, w2
	bne	.L4146
	lsl	w0, w6, 2
	sub	w0, w0, w6
	lsl	w1, w0, 5
	add	w0, w0, w1
	add	w6, w0, w6
.L4140:
	udiv	w6, w6, w20
	ldr	x0, [x19, 4024]
	cmp	w6, 100
	csel	w4, w4, wzr, ne
	udiv	w7, w7, w20
	cbz	x0, .L4148
	str	w5, [x0, 324]
	ldr	x0, [x19, 4024]
	str	w4, [x0, 328]
	ldr	x0, [x19, 4024]
	str	w7, [x0, 332]
	ldr	x0, [x19, 4024]
	str	w6, [x0, 336]
	str	w5, [x19, 4276]
	str	w4, [x19, 4280]
	str	w7, [x19, 4284]
	str	w6, [x19, 4288]
	b	.L4139
	.p2align 3
.L4159:
	mov	x0, x19
	bl	HEVC_ClearAllSlice
	mov	w0, 0
	b	.L4137
.L4150:
	mov	w6, 0
	mov	w7, 0
	mov	w4, 2147483647
	mov	w5, 0
	b	.L4140
.L4148:
	ldr	x1, .LC1170
	mov	w0, 0
	bl	dprint_vfmw
	b	.L4139
	.size	HEVCDEC_VDMPostProc, .-HEVCDEC_VDMPostProc
	.align	3
.LC1168:
	.xword	g_VdmDrvParam
	.align	3
.LC1169:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1170:
	.xword	.LC1006
	.align	3
.LC1172:
	.xword	.LC1171
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_GetImageWidth
	.type	HEVCDEC_GetImageWidth, %function
HEVCDEC_GetImageWidth:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L4164
	ldr	x0, [x19, 2400]
	ldr	w1, [x0, 132]
	ldr	w0, [x0, 64]
	add	w0, w1, w0
	neg	w1, w1
	sub	w0, w0, #1
	and	w0, w0, w1
.L4163:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L4164:
	mov	w0, -1
	b	.L4163
	.size	HEVCDEC_GetImageWidth, .-HEVCDEC_GetImageWidth
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_GetImageHeight
	.type	HEVCDEC_GetImageHeight, %function
HEVCDEC_GetImageHeight:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L4167
	ldr	x0, [x19, 2400]
	ldr	w1, [x0, 132]
	ldr	w0, [x0, 68]
	add	w0, w1, w0
	neg	w1, w1
	sub	w0, w0, #1
	and	w0, w0, w1
.L4166:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L4167:
	mov	w0, -1
	b	.L4166
	.size	HEVCDEC_GetImageHeight, .-HEVCDEC_GetImageHeight
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_GetRemainImg
	.type	HEVCDEC_GetRemainImg, %function
HEVCDEC_GetRemainImg:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 2772]
	cbz	w0, .L4173
	ldr	x0, .LC1173
	mov	w21, 1
	ldr	x23, .LC1174
	add	x22, x0, 696
	.p2align 2
.L4169:
	add	x2, x29, 72
	add	x1, x29, 76
	mov	x0, x19
	bl	HEVC_GetMinPOC
	ldr	w2, [x29, 72]
	mov	x0, x19
	add	x1, x19, x2, uxtw 3
	ldr	x20, [x1, 2792]
	mov	x1, x20
	cbz	x20, .L4170
	ldrb	w3, [x20, 2]
	cmp	w3, 1
	beq	.L4170
	strb	w21, [x20, 2]
	bl	HEVC_GetImagePara
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_CheckFrameStore
	cbz	w0, .L4184
.L4183:
	ldr	w2, [x29, 72]
.L4170:
	mov	w1, w2
	mov	x0, x19
	bl	HEVC_RemoveApcStore
	ldr	w1, [x29, 72]
	mov	x0, x19
	bl	HEVC_RemoveFrameStoreOutDPB
	ldr	w0, [x19, 2772]
	cbnz	w0, .L4169
.L4173:
	add	x0, x19, 4096
	add	x0, x0, 1936
	bl	GetVoLastImageID
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4184:
	add	x1, x20, 28
	mov	x0, x19
	bl	HEVC_OutputFrame.isra.10
	cbz	w0, .L4183
	mov	x1, x23
	mov	x2, x22
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, 1
	mov	x0, x19
	bl	HEVC_ClearAll
	b	.L4183
	.size	HEVCDEC_GetRemainImg, .-HEVCDEC_GetRemainImg
	.align	3
.LC1173:
	.xword	.LANCHOR3
	.align	3
.LC1174:
	.xword	.LC934
	.global	g_pGlbVar
	.global	g_RpuStartCode
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.12484, %object
	.size	__func__.12484, 17
__func__.12484:
	.string	"HEVC_OutputFrame"
	.zero	7
	.type	SarTable.11128, %object
	.size	SarTable.11128, 136
SarTable.11128:
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
	.type	__func__.11287, %object
	.size	__func__.11287, 18
__func__.11287:
	.string	"HEVC_CalcTileInfo"
	.zero	6
	.type	__func__.11781, %object
	.size	__func__.11781, 27
__func__.11781:
	.string	"HEVC_GetUnRefPicWithMinPoc"
	.zero	5
	.type	__func__.11790, %object
	.size	__func__.11790, 21
__func__.11790:
	.string	"HEVC_IncreaseDPBSize"
	.zero	3
	.type	__func__.12029, %object
	.size	__func__.12029, 17
__func__.12029:
	.string	"HEVC_CalcTileMap"
	.zero	7
	.type	__func__.12049, %object
	.size	__func__.12049, 17
__func__.12049:
	.string	"HEVC_WritePicMsg"
	.zero	7
	.type	__func__.12078, %object
	.size	__func__.12078, 16
__func__.12078:
	.string	"HEVC_CheckListX"
	.type	__func__.12245, %object
	.size	__func__.12245, 16
__func__.12245:
	.string	"HEVC_RepairList"
	.type	__func__.12312, %object
	.size	__func__.12312, 16
__func__.12312:
	.string	"HEVC_ArrangeMem"
	.type	__func__.12385, %object
	.size	__func__.12385, 20
__func__.12385:
	.string	"HEVC_RemoveApcStore"
	.zero	4
	.type	__func__.12660, %object
	.size	__func__.12660, 21
__func__.12660:
	.string	"HEVC_CheckFrameStore"
	.zero	3
	.type	__func__.12728, %object
	.size	__func__.12728, 19
__func__.12728:
	.string	"HEVC_GetSLHDR1Info"
	.zero	5
	.type	__func__.12855, %object
	.size	__func__.12855, 14
__func__.12855:
	.string	"HEVC_IsNewPic"
	.zero	2
	.type	g_Quant8InterDefault, %object
	.size	g_Quant8InterDefault, 64
g_Quant8InterDefault:
	.word	269488144
	.word	403968529
	.word	286265360
	.word	421008402
	.word	303108112
	.word	471406612
	.word	336728336
	.word	555489560
	.word	403968529
	.word	690035737
	.word	421008402
	.word	908665116
	.word	471406612
	.word	1194731809
	.word	555489560
	.word	1531393577
	.type	g_QuantTsDefault, %object
	.size	g_QuantTsDefault, 16
g_QuantTsDefault:
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.align	3
.LANCHOR3 = . + 0
	.type	__func__.13171, %object
	.size	__func__.13171, 16
__func__.13171:
	.string	"HEVC_ReleaseNAL"
	.type	__func__.12344, %object
	.size	__func__.12344, 20
__func__.12344:
	.string	"HEVC_InitDecBuffers"
	.zero	4
	.type	__func__.11338, %object
	.size	__func__.11338, 12
__func__.11338:
	.string	"HEVC_DecVPS"
	.zero	4
	.type	__func__.12913, %object
	.size	__func__.12913, 24
__func__.12913:
	.string	"HEVC_DecScalingListData"
	.type	g_CropUnitX, %object
	.size	g_CropUnitX, 16
g_CropUnitX:
	.word	1
	.word	2
	.word	2
	.word	1
	.type	g_CropUnitY, %object
	.size	g_CropUnitY, 16
g_CropUnitY:
	.word	1
	.word	2
	.word	1
	.word	1
	.type	__func__.11407, %object
	.size	__func__.11407, 12
__func__.11407:
	.string	"HEVC_DecSPS"
	.zero	4
	.type	__func__.11421, %object
	.size	__func__.11421, 16
__func__.11421:
	.string	"HEVC_ProcessPPS"
	.type	__func__.11454, %object
	.size	__func__.11454, 12
__func__.11454:
	.string	"HEVC_DecPPS"
	.zero	4
	.type	__func__.11901, %object
	.size	__func__.11901, 27
__func__.11901:
	.string	"HEVC_DecSliceSegmentHeader"
	.zero	5
	.type	__func__.12323, %object
	.size	__func__.12323, 13
__func__.12323:
	.string	"HEVC_InitDPB"
	.zero	3
	.type	__func__.12491, %object
	.size	__func__.12491, 19
__func__.12491:
	.string	"HEVC_OutputCurrPic"
	.zero	5
	.type	__func__.12496, %object
	.size	__func__.12496, 23
__func__.12496:
	.string	"HEVC_FirstFrameFastOut"
	.zero	1
	.type	__func__.12652, %object
	.size	__func__.12652, 19
__func__.12652:
	.string	"HEVC_OutputFrmToVO"
	.zero	5
	.type	__func__.12611, %object
	.size	__func__.12611, 22
__func__.12611:
	.string	"HEVC_OutputFrmFromDPB"
	.zero	2
	.type	__func__.11796, %object
	.size	__func__.11796, 30
__func__.11796:
	.string	"HEVC_OutputUnRefPicWithMinPoc"
	.zero	2
	.type	__func__.12627, %object
	.size	__func__.12627, 27
__func__.12627:
	.string	"HEVC_FlushOutputFrmFromDPB"
	.zero	5
	.type	__func__.13234, %object
	.size	__func__.13234, 14
__func__.13234:
	.string	"HEVC_ClearDPB"
	.zero	2
	.type	__func__.11801, %object
	.size	__func__.11801, 23
__func__.11801:
	.string	"HEVC_RecoverDPBProcess"
	.zero	1
	.type	__func__.12591, %object
	.size	__func__.12591, 20
__func__.12591:
	.string	"HEVC_InsertFrmInDPB"
	.zero	4
	.type	__func__.12501, %object
	.size	__func__.12501, 22
__func__.12501:
	.string	"HEVC_SimpleDPBProcess"
	.zero	2
	.type	__func__.12506, %object
	.size	__func__.12506, 21
__func__.12506:
	.string	"HEVC_DecOrderProcess"
	.zero	3
	.type	__func__.12520, %object
	.size	__func__.12520, 22
__func__.12520:
	.string	"HEVC_DispOrderProcess"
	.zero	2
	.type	__func__.12535, %object
	.size	__func__.12535, 19
__func__.12535:
	.string	"HEVC_StorePicInDPB"
	.zero	5
	.type	__func__.12164, %object
	.size	__func__.12164, 12
__func__.12164:
	.string	"HEVC_DecVDM"
	.zero	4
	.type	__func__.11017, %object
	.size	__func__.11017, 18
__func__.11017:
	.string	"HEVC_VES_Splitter"
	.zero	6
	.type	__func__.11841, %object
	.size	__func__.11841, 14
__func__.11841:
	.string	"HEVC_DecSlice"
	.zero	2
	.type	__func__.13314, %object
	.size	__func__.13314, 20
__func__.13314:
	.string	"HEVC_HaveSliceToDec"
	.zero	4
	.type	__func__.13342, %object
	.size	__func__.13342, 13
__func__.13342:
	.string	"HEVCDEC_Init"
	.zero	3
	.type	__func__.13356, %object
	.size	__func__.13356, 23
__func__.13356:
	.string	"HEVCDEC_GetImageBuffer"
	.zero	1
	.type	__func__.13371, %object
	.size	__func__.13371, 21
__func__.13371:
	.string	"HEVCDEC_DecodePacket"
	.zero	3
	.type	g_HevcNalTypeEOP, %object
	.size	g_HevcNalTypeEOP, 21
g_HevcNalTypeEOP:
	.byte	0
	.byte	0
	.byte	1
	.byte	96
	.byte	0
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
	.zero	3
	.type	__func__.13420, %object
	.size	__func__.13420, 21
__func__.13420:
	.string	"HEVCDEC_GetRemainImg"
	.data
	.align	3
.LANCHOR2 = . + 0
	.type	g_Quant8IntraDefault, %object
	.size	g_Quant8IntraDefault, 64
g_Quant8IntraDefault:
	.word	269488144
	.word	404034065
	.word	269488144
	.word	420877073
	.word	303108112
	.word	488183316
	.word	353505296
	.word	606018328
	.word	403968273
	.word	791225118
	.word	454431506
	.word	1094069283
	.word	521737749
	.word	1480996393
	.word	605886744
	.word	1935163695
	.type	g_QuantTSDefault4x4, %object
	.size	g_QuantTSDefault4x4, 16
g_QuantTSDefault4x4:
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.type	g_QuantInterDefault8x8, %object
	.size	g_QuantInterDefault8x8, 64
g_QuantInterDefault8x8:
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	41
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	41
	.byte	54
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	41
	.byte	54
	.byte	71
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	41
	.byte	54
	.byte	71
	.byte	91
	.type	g_QuantIntraDefault8x8, %object
	.size	g_QuantIntraDefault8x8, 64
g_QuantIntraDefault8x8:
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	21
	.byte	24
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	19
	.byte	22
	.byte	25
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	22
	.byte	25
	.byte	29
	.byte	16
	.byte	16
	.byte	18
	.byte	21
	.byte	24
	.byte	27
	.byte	31
	.byte	36
	.byte	17
	.byte	17
	.byte	20
	.byte	24
	.byte	30
	.byte	35
	.byte	41
	.byte	47
	.byte	18
	.byte	19
	.byte	22
	.byte	27
	.byte	35
	.byte	44
	.byte	54
	.byte	65
	.byte	21
	.byte	22
	.byte	25
	.byte	31
	.byte	41
	.byte	54
	.byte	70
	.byte	88
	.byte	24
	.byte	25
	.byte	29
	.byte	36
	.byte	47
	.byte	65
	.byte	88
	.byte	115
	.type	g_RpuStartCode, %object
	.size	g_RpuStartCode, 5
g_RpuStartCode:
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	25
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC1:
	ASCII(.string	"%s: pImg is NULL!\n" )
	.zero	5
.LC3:
	ASCII(.string	"%s: InsertImgToVoQueue failed!\n" )
.LC8:
	ASCII(.string	"line:%d ChanID(%d), pic_parameter_set_id(%d) out of range(0,%d).\n" )
	.zero	6
.LC10:
	ASCII(.string	"line:%d ChanID(%d), seq_parameter_set_id(%d) out of range[0,%d].\n" )
	.zero	6
.LC17:
	ASCII(.string	"dar=%d\n" )
.LC20:
	ASCII(.string	"--------------- PrintNaluArraySlot START ---------------\n" )
	.zero	6
.LC22:
	ASCII(.string	"\n" )
	.zero	6
.LC24:
	ASCII(.string	"--------------- PrintNaluArraySlot END ---------------\n" )
.LC26:
	ASCII(.string	"NalArray[%d]=%p,is_valid=%d   " )
	.zero	1
.LC28:
	ASCII(.string	"--------------- PrintCurrSlicelistX START ---------------\n" )
	.zero	5
.LC30:
	ASCII(.string	"List0, size: %d\n" )
	.zero	7
.LC32:
	ASCII(.string	"List1, size: %d\n" )
	.zero	7
.LC34:
	ASCII(.string	"pListX[0][%d]:%p " )
	.zero	6
.LC36:
	ASCII(.string	"pFrameStore:%p " )
.LC38:
	ASCII(.string	"pLogicFs:%p " )
	.zero	3
.LC41:
	ASCII(.string	"--------------- PrintCurrSlicelistX END ---------------\n" )
	.zero	7
.LC43:
	ASCII(.string	"pListX[1][%d]: %p" )
	.zero	6
.LC47:
	ASCII(.string	"--------------- PrintFrameStoreState START ---------------\n" )
	.zero	4
.LC49:
	ASCII(.string	"--------------- PrintFrameStoreState END ---------------\n" )
	.zero	6
.LC51:
	ASCII(.string	"Fs=%d, pFs=%p, state=%d, is_reference=%d, is_displayed=%d " )
	.zero	5
.LC53:
	ASCII(.string	"p_usrdat[%d]=%p " )
	.zero	7
.LC56:
	ASCII(.string	"--------------- PrintAPCState START ---------------\n" )
	.zero	3
.LC58:
	ASCII(.string	"Layer %d: APC.used_size:%d, APC.size:%d\n" )
	.zero	7
.LC60:
	ASCII(.string	"%d: is_used=%d, idc=%d, poc=%d\n" )
.LC62:
	ASCII(.string	"--------------- PrintAPCState END ---------------\n" )
	.zero	5
.LC64:
	ASCII(.string	"--------------- PrintDPBState START ---------------\n" )
	.zero	3
.LC66:
	ASCII(.string	"DPB: size:%d, used_size:%d, negative:%d, positive:%d, longterm:%d\n" )
	.zero	5
.LC69:
	ASCII(.string	"fs[%d]:%p view %d non_existing:%d state:%d is_ref:%d displayed:%d poc:%d long_term:%d LogicFs:%p, fsp_ref:%d fsp_disp:%d logic_id:%d img_id:%d\n" )
.LC71:
	ASCII(.string	"--------------- PrintDPBState END ---------------\n" )
	.zero	5
.LC73:
	ASCII(.string	"fs[%d]\t" )
.LC75:
	ASCII(.string	"LogicFs:%p\t" )
	.zero	4
.LC77:
	ASCII(.string	"LogicTick:%d\t" )
	.zero	2
.LC79:
	ASCII(.string	"IsRef:%d\t" )
	.zero	6
.LC81:
	ASCII(.string	"DispState:%d\t" )
	.zero	2
.LC83:
	ASCII(.string	"LogicFs:Null\t" )
	.zero	2
.LC85:
	ASCII(.string	"DecFs:%p\t" )
	.zero	6
.LC87:
	ASCII(.string	"DecTick:%d\t" )
	.zero	4
.LC89:
	ASCII(.string	"DecFs:Null\t" )
	.zero	4
.LC91:
	ASCII(.string	"DispFs:%p\t" )
	.zero	5
.LC93:
	ASCII(.string	"DispTick:%d\t" )
	.zero	3
.LC95:
	ASCII(.string	"DispFs:Null\t" )
	.zero	3
.LC98:
	ASCII(.string	"%s num_tile_columns(%d) out of range(0, %d].\n" )
	.zero	2
.LC100:
	ASCII(.string	"%s num_tile_rows(%d) out of range(0, %d].\n" )
	.zero	5
.LC103:
	ASCII(.string	"%s 0 idx(%d) out of range(0, 512).\n" )
	.zero	4
.LC105:
	ASCII(.string	"%s 1 idx(%d) out of range(0, 512).\n" )
	.zero	4
.LC108:
	ASCII(.string	"HEVC_Sei_User_Data_Unregistered payloadSize < 16\n" )
	.zero	6
.LC110:
	ASCII(.string	"pListX[0][%d] = NULL, listXsize[0] = %d\n" )
	.zero	7
.LC112:
	ASCII(.string	"pListX[0][%d]->frame_store = NULL, listXsize[0] = %d\n" )
	.zero	2
.LC114:
	ASCII(.string	"pListX[0][%d] frame_store(%p), pstLogicFs(%p) invalid\n" )
	.zero	1
.LC116:
	ASCII(.string	"pListX[1][%d] = NULL, listXsize[1] = %d\n" )
	.zero	7
.LC118:
	ASCII(.string	"pListX[1][%d]->frame_store = NULL, listXsize[1] = %d\n" )
	.zero	2
.LC120:
	ASCII(.string	"pListX[i][%d] pstLogicFs(%p) invalid\n" )
	.zero	2
.LC123:
	ASCII(.string	"%s can't find such pic.\n" )
	.zero	7
.LC125:
	ASCII(.string	"%s DPB.used_size(%d) >= 17.\n" )
	.zero	3
.LC127:
	ASCII(.string	"%s find pos=%d, poc=%d.\n" )
	.zero	7
.LC130:
	ASCII(.string	"%s DPB.size(%d) already reached max(%d).\n" )
	.zero	6
.LC132:
	ASCII(.string	"%s increase DPB size to %d\n" )
	.zero	4
.LC134:
	ASCII(.string	"%s no enough fs(total_fs_num=%d) to increase DPB size.\n" )
.LC136:
	ASCII(.string	"TileWidthInCtb is 0\n" )
	.zero	3
.LC140:
	ASCII(.string	"%s: g_pGlbVar is NULL!\n" )
.LC143:
	ASCII(.string	"image_id=%d, pmv_idc=%d\n" )
	.zero	7
.LC145:
	ASCII(.string	"pic msg burst0:\n" )
	.zero	7
.LC149:
	ASCII(.string	"%s call HEVC_CalcTileInfo failed.\n" )
	.zero	5
.LC151:
	ASCII(.string	"logic frame id(=%d): get LogicFs error!\n" )
	.zero	7
.LC153:
	ASCII(.string	"phy fs is null: pstDecodeFs = %p, pstDispOutFs = %p\n" )
	.zero	3
.LC156:
	ASCII(.string	"%s ERROR: bHaveIndependentSlice = 0\n\n" )
	.zero	2
.LC158:
	ASCII(.string	"ListX ERROR: list0size >= %d\n" )
	.zero	2
.LC160:
	ASCII(.string	"ListX ERROR: list1size >= %d\n" )
	.zero	2
.LC162:
	ASCII(.string	"pListX[0][%d] = NULL\n" )
	.zero	2
.LC164:
	ASCII(.string	"pListX[0][%d]->frame_store = NULL\n" )
	.zero	5
.LC166:
	ASCII(.string	"pListX[1][%d] = NULL\n" )
	.zero	2
.LC168:
	ASCII(.string	"pListX[1][%d]->frame_store = NULL\n" )
	.zero	5
.LC170:
	ASCII(.string	"NumSlicePara(%d) >= MaxSliceNum(%d)\n" )
	.zero	3
.LC173:
	ASCII(.string	"line:%d pic_parameter_set_id(%d) out of range(0,%d).\n" )
	.zero	2
.LC175:
	ASCII(.string	"line:%d seq_parameter_set_id(%d) out of range[0,%d].\n" )
	.zero	2
.LC177:
	ASCII(.string	"line:%d, i(%d) > Max(%d) num_of_pics %d\n" )
	.zero	7
.LC179:
	ASCII(.string	"line:%d, i(%d) > Max(%d)(neg%d + pos%d)\n" )
	.zero	7
.LC188:
	ASCII(.string	"%s unkown slice type(%d).\n" )
	.zero	5
.LC190:
	ASCII(.string	"%s pListX[%d] no available pic to repair.\n" )
	.zero	5
.LC192:
	ASCII(.string	"%s: pListX[%d][%d] = NULL, repair it with pos(%d).\n" )
	.zero	4
.LC196:
	ASCII(.string	"HEVC_InitListX error.\n" )
	.zero	1
.LC198:
	ASCII(.string	"HEVC_RepairList error.\n" )
.LC202:
	ASCII(.string	"%s image size abnormal(%dx%d)\n" )
	.zero	1
.LC204:
	ASCII(.string	"%s HEVC FSP_ConfigInstance failed!\n" )
	.zero	4
.LC207:
	ASCII(.string	"%s fs[%d]->view_id = %d invalid.\n" )
	.zero	6
.LC209:
	ASCII(.string	"../../core/syntax/hevc.c" )
	.zero	7
.LC211:
	ASCII(.string	"NULL pointer: %s, L%d\n" )
	.zero	1
.LC213:
	ASCII(.string	"framestore %d allocate apc %d\n" )
	.zero	1
.LC215:
	ASCII(.string	"find APC, but logic_fs_id %d abnormal(poc=%d, ref=%d, logic_fs=%p, dec_fs=%p)\n" )
	.zero	1
.LC217:
	ASCII(.string	"Cant find free apc slot.\n" )
	.zero	6
.LC220:
	ASCII(.string	"%s frame logic_fs_id=%d, state=%d\n" )
	.zero	5
.LC222:
	ASCII(.string	"LogicFs(fs=%p, poc=%d, FirstFrameState=%d) is null, logic_fs_id = %d\n" )
	.zero	2
.LC224:
	ASCII(.string	"%s frame poc=%d, is already output\n" )
	.zero	4
.LC226:
	ASCII(.string	"%s frame(%p) invalid, state:%d, non_existing:%d\n" )
	.zero	7
.LC228:
	ASCII(.string	"exg_pts: %lld <-> %lld\n" )
.LC231:
	ASCII(.string	"HEVC_DECRecycleImage ERROR, DispState = FS_DISP_STATE_NOT_USED\n" )
.LC233:
	ASCII(.string	"%-5d   specVersion\n" )
	.zero	4
.LC235:
	ASCII(.string	"%-5d   payloadMode\n" )
	.zero	4
.LC237:
	ASCII(.string	"%-5d   hdrPicColourSpace\n" )
	.zero	6
.LC239:
	ASCII(.string	"%-5d   hdrMasterDisplayColourSpace\n" )
	.zero	4
.LC241:
	ASCII(.string	"%-5d   hdrMasterDisplayMaxLuminance\n" )
	.zero	3
.LC243:
	ASCII(.string	"%-5d   hdrMasterDisplayMinLuminance\n" )
	.zero	3
.LC245:
	ASCII(.string	"%-5d   sdrPicColourSpace\n" )
	.zero	6
.LC247:
	ASCII(.string	"%-5d   sdrMasterDisplayColourSpace\n" )
	.zero	4
.LC249:
	ASCII(.string	"%-5d   tmInputSignalBlackLevelOffset\n" )
	.zero	2
.LC251:
	ASCII(.string	"%-5d   tmInputSignalWhiteLevelOffset\n" )
	.zero	2
.LC253:
	ASCII(.string	"%-5d   shadowGain\n" )
	.zero	5
.LC255:
	ASCII(.string	"%-5d   highlightGain\n" )
	.zero	2
.LC257:
	ASCII(.string	"%-5d   midToneWidthAdjFactor\n" )
	.zero	2
.LC259:
	ASCII(.string	"%-5d   tmOutputFineTuningNumVal\n" )
	.zero	7
.LC261:
	ASCII(.string	"%-5d   saturationGainNumVal\n" )
	.zero	3
.LC263:
	ASCII(.string	"%-5d   tmOutputFineTuningX[%d]\n" )
.LC265:
	ASCII(.string	"%-5d   tmOutputFineTuningY[%d]\n" )
.LC267:
	ASCII(.string	"%-5d   saturationGainX[%d]\n" )
	.zero	4
.LC269:
	ASCII(.string	"%-5d   saturationGainY[%d]\n" )
	.zero	4
.LC271:
	ASCII(.string	"%-5d   luminanceMappingNumVal\n" )
	.zero	1
.LC273:
	ASCII(.string	"%-5d   colourCorrectionNumVal\n" )
	.zero	1
.LC275:
	ASCII(.string	"%-5d   luminanceMappingX[%d]\n" )
	.zero	2
.LC277:
	ASCII(.string	"%-5d   luminanceMappingY[%d]\n" )
	.zero	2
.LC279:
	ASCII(.string	"%-5d   chromaToLumaInjectionMuA\n" )
	.zero	7
.LC281:
	ASCII(.string	"%-5d   chromaToLumaInjectionMuB\n" )
	.zero	7
.LC283:
	ASCII(.string	"%-5d   colourCorrectionX[%d]\n" )
	.zero	2
.LC285:
	ASCII(.string	"%-5d   colourCorrectionY[%d]\n" )
	.zero	2
.LC287:
	ASCII(.string	"======SL_HDR1_METADATA= %d=======\n" )
	.zero	5
.LC290:
	ASCII(.string	"%s, [%d %d %d %d %d]\n" )
	.zero	2
.LC292:
	ASCII(.string	"%s HDR_Metadata_phy_addr is invalid!!\n" )
	.zero	1
.LC295:
	ASCII(.string	"FS_ALLOC_ERR, ClearAll\n" )
.LC298:
	ASCII(.string	"Can not new logic fs! ClearAll\n" )
.LC300:
	ASCII(.string	"FSP_GetFspType -1\n" )
	.zero	5
.LC302:
	ASCII(.string	"FSP_GetLogicFs return NULL\n" )
	.zero	4
.LC304:
	ASCII(.string	"%s: pHevcCtx->DPB.used_size(%d) > DPB.size(%d), error resilence.\n" )
	.zero	6
.LC306:
	ASCII(.string	"nal_segment = %d is not expected value\n" )
.LC308:
	ASCII(.string	"HEVC_VpsSpsPpsCheck pic_parameter_set_id(%d) out of range\n" )
	.zero	5
.LC310:
	ASCII(.string	"pps with this pic_parameter_set_id = %d havn't be decoded\n" )
	.zero	5
.LC312:
	ASCII(.string	"HEVC_VpsSpsPpsCheck seq_parameter_set_id(%d) out of range\n" )
	.zero	5
.LC314:
	ASCII(.string	"sps with this seq_parameter_set_id = %d havn't be decoded\n" )
	.zero	5
.LC316:
	ASCII(.string	"HEVC_VpsSpsPpsCheck video_parameter_set_id out of range\n" )
	.zero	7
.LC318:
	ASCII(.string	"vps with this video_parameter_set_id = %d havn't be decoded\n" )
	.zero	3
.LC321:
	ASCII(.string	"%s, %d, CurrSlice.poc = %d, PocRandomAccess = %d, nal_unit_type = %d, should skip this frame\n" )
	.zero	2
.LC323:
	ASCII(.string	"%s, %d, CurrSlice.poc = %d, bNoRaslOutputFlag = %d, nal_unit_type = %d, should skip this frame\n" )
.LC325:
	ASCII(.string	"%s, %d, PrevRAPIsBLA = %d, CurrSlice.poc = %d, PocCRA = %d, nal_unit_type = %d, should skip this frame\n" )
.LC327:
	ASCII(.string	"HEVC_ReadByteAlignment: code should not be zero.\n" )
	.zero	6
.LC329:
	ASCII(.string	"HEVC_ReadByteAlignment: code:%d\n" )
	.zero	7
.LC331:
	ASCII(.string	"reserved_zero_2bits not equal 0.\n" )
	.zero	6
.LC340:
	ASCII(.string	"HEVC_GetScalingListDefaultAddress NULL.\n" )
	.zero	7
.LC342:
	ASCII(.string	"Error, BsLen: 0x%x, TotalPos: 0x%x\n" )
	.zero	4
.LC344:
	ASCII(.string	"Panic: All zero data sequence in RBSP \n" )
.LC346:
	ASCII(.string	"nal_trail_zero_bit_num err\n" )
	.zero	4
.LC351:
	ASCII(.string	"%s release streambuff=%p, bitstream_length=%d\n" )
	.zero	1
.LC355:
	ASCII(.string	"%s DPB size exceed %d, force to %d\n" )
	.zero	4
.LC358:
	ASCII(.string	"HEVC_CombinePacket FATAL: pCurrNal=NULL!\n" )
	.zero	6
.LC360:
	ASCII(.string	"END of the bit buffer, copy the first packet!\n" )
	.zero	1
.LC363:
	ASCII(.string	"tone_map_id" )
	.zero	4
.LC365:
	ASCII(.string	"Unsupport: target_bit_depth(%d) > 8\n" )
	.zero	3
.LC368:
	ASCII(.string	"pTon->num_pivots > 256\n" )
.LC370:
	ASCII(.string	"frame_packing_arrangement_id" )
	.zero	3
.LC372:
	ASCII(.string	"frame_packing_arrangement_type(%d) out of range\n" )
	.zero	7
.LC374:
	ASCII(.string	"decoding_unit_idx" )
	.zero	6
.LC376:
	ASCII(.string	"num_sps_ids_minus1" )
	.zero	5
.LC378:
	ASCII(.string	"pAct->num_sps_ids_minus1 > 15\n" )
	.zero	1
.LC380:
	ASCII(.string	"active_seq_parameter_set_id" )
	.zero	4
.LC382:
	ASCII(.string	"bp_seq_parameter_set_id" )
.LC384:
	ASCII(.string	"Wrong bp_seq_parameter_set_id = %d, should be 0 to 15!\n" )
.LC387:
	ASCII(.string	"num_decoding_units_minus1" )
	.zero	6
.LC389:
	ASCII(.string	"pPic->num_decoding_units_minus1 > 255\n" )
	.zero	1
.LC391:
	ASCII(.string	"num_nalus_in_du_minus1" )
	.zero	1
.LC393:
	ASCII(.string	"cv_rec_id" )
	.zero	6
.LC395:
	ASCII(.string	"HEVC_Sei_User_Data_Registered_Itu_T_T35 payloadSize < 4!!\n" )
	.zero	5
.LC397:
	ASCII(.string	"delta_idx_minus1" )
	.zero	7
.LC399:
	ASCII(.string	"delta_idx(%d) > idx(%d).\n" )
	.zero	6
.LC401:
	ASCII(.string	"rIdx(%d) > (idx-1)(%d) or < 0).\n" )
	.zero	7
.LC403:
	ASCII(.string	"abs_delta_rps_minus1" )
	.zero	3
.LC405:
	ASCII(.string	"pTempRPset->num_of_pics(%d) out of range(0,15).\n" )
	.zero	7
.LC407:
	ASCII(.string	"num_of_pics out of range(0,15).\n" )
	.zero	7
.LC409:
	ASCII(.string	"num_negative_pics" )
	.zero	6
.LC411:
	ASCII(.string	"pTempRPset->num_negative_pics(%d) out of range(0,15).\n" )
	.zero	1
.LC413:
	ASCII(.string	"num_positive_pics" )
	.zero	6
.LC415:
	ASCII(.string	"pTempRPset->num_positive_pics(%d) out of range(0,15).\n" )
	.zero	1
.LC417:
	ASCII(.string	"pShortTermRpset->num_of_pics(%d) out of range[0,%d].\n" )
	.zero	2
.LC419:
	ASCII(.string	"delta_poc_s0_minus1" )
	.zero	4
.LC421:
	ASCII(.string	"delta_poc_s0_minus1(%d) out of range.\n" )
	.zero	1
.LC423:
	ASCII(.string	"delta_poc_s1_minus1" )
	.zero	4
.LC425:
	ASCII(.string	"elemental_duration_in_tc_minus1" )
.LC427:
	ASCII(.string	"cpb_cnt_minus1" )
	.zero	1
.LC429:
	ASCII(.string	"cpb_cnt_minus1(%d) out of range(0,31).\n" )
.LC431:
	ASCII(.string	"bit_rate_value_minus1" )
	.zero	2
.LC433:
	ASCII(.string	"cpb_size_value_minus1" )
	.zero	2
.LC435:
	ASCII(.string	"cpb_size_du_value_minus1" )
	.zero	7
.LC437:
	ASCII(.string	"bit_rate_du_value_minus1" )
	.zero	7
.LC439:
	ASCII(.string	"vps_base_layer_available_flag(%d) not equal 0x1.\n" )
	.zero	6
.LC441:
	ASCII(.string	"vps_max_layers_minus1 %d out of range[0,63].\n" )
	.zero	2
.LC443:
	ASCII(.string	"vps_max_sub_layers_minus1=%d\n" )
	.zero	2
.LC445:
	ASCII(.string	"vps_reserved_0xffff_16bits not equal 0xffff.\n" )
	.zero	2
.LC447:
	ASCII(.string	"VPS HEVC_DecPTL error.\n" )
.LC449:
	ASCII(.string	"vps_num_layer_sets_minus1" )
	.zero	6
.LC451:
	ASCII(.string	"vps_max_dec_pic_buffering_minus1[i]" )
	.zero	4
.LC453:
	ASCII(.string	"vps_num_reorder_pics[i]" )
.LC455:
	ASCII(.string	"vps_max_latency_increase_plus1[i]" )
	.zero	6
.LC457:
	ASCII(.string	"vps_num_layer_sets_minus1(%d) out of range(0,%d).\n" )
	.zero	5
.LC459:
	ASCII(.string	"vps_num_ticks_poc_diff_one_minus1" )
	.zero	6
.LC461:
	ASCII(.string	"vps_num_hrd_parameters" )
	.zero	1
.LC463:
	ASCII(.string	"vps_num_hrd_parameters(%d) out of range[0,%d].\n" )
.LC465:
	ASCII(.string	"hrd_layer_set_idx" )
	.zero	6
.LC467:
	ASCII(.string	"VPS HEVC_DecHrdParam error.\n" )
	.zero	3
.LC472:
	ASCII(.string	"pVPS->vps_video_parameter_set_id out of range(0,15).\n" )
	.zero	2
.LC475:
	ASCII(.string	"VPS[%d] decode error0.\n" )
.LC477:
	ASCII(.string	"VPS[%d] decode error1.\n" )
.LC479:
	ASCII(.string	"chroma_sample_loc_type_top_field" )
	.zero	7
.LC481:
	ASCII(.string	"chroma_sample_loc_type_bottom_field" )
	.zero	4
.LC483:
	ASCII(.string	"def_disp_win_left_offset" )
	.zero	7
.LC485:
	ASCII(.string	"VUI pSps->chroma_format_idc out of range(0,3).\n" )
.LC487:
	ASCII(.string	"def_disp_win_right_offset" )
	.zero	6
.LC489:
	ASCII(.string	"def_disp_win_top_offset" )
.LC491:
	ASCII(.string	"def_disp_win_bottom_offset" )
	.zero	5
.LC494:
	ASCII(.string	"vui_num_ticks_poc_diff_one_minus1" )
	.zero	6
.LC496:
	ASCII(.string	"VUI HEVC_DecHrdParam error.\n" )
	.zero	3
.LC498:
	ASCII(.string	"min_spatial_segmentation_idc" )
	.zero	3
.LC500:
	ASCII(.string	"VUI min_spatial_segmentation_idc out of range(0,4095).\n" )
.LC502:
	ASCII(.string	"max_bytes_per_pic_denom" )
.LC504:
	ASCII(.string	"max_bits_per_min_cu_denom" )
	.zero	6
.LC506:
	ASCII(.string	"log2_max_mv_length_horizontal" )
	.zero	2
.LC508:
	ASCII(.string	"log2_max_mv_length_vertical" )
	.zero	4
.LC510:
	ASCII(.string	"sop_seq_parameter_set_id" )
	.zero	7
.LC512:
	ASCII(.string	"num_entries_in_sop_minus1" )
	.zero	6
.LC514:
	ASCII(.string	"num_entries_in_sop_minus1 out of range(0,1024)\n" )
.LC516:
	ASCII(.string	"sop_short_term_rps_idx" )
	.zero	1
.LC518:
	ASCII(.string	"sop_poc_delta" )
	.zero	2
.LC520:
	ASCII(.string	"recovery_poc_cnt" )
	.zero	7
.LC522:
	ASCII(.string	"colour_remap_id" )
.LC524:
	ASCII(.string	"colour_remap_coeffs" )
	.zero	4
.LC526:
	ASCII(.string	"ERROR: post_lut_num_val_minus1 %d out of range[0, 32]\n" )
	.zero	1
.LC529:
	ASCII(.string	"reserved_payload_extension_data" )
.LC531:
	ASCII(.string	"line:%d Cosume TotalPos(%d > %d)!!!\n" )
	.zero	3
.LC533:
	ASCII(.string	"HEVC_SeiMessage HEVC_Sei_Payload error.\n" )
	.zero	7
.LC535:
	ASCII(.string	"SEI pSEISPS = NULL.\n" )
	.zero	3
.LC537:
	ASCII(.string	"SEI HEVC_SeiMessage error.\n" )
	.zero	4
.LC539:
	ASCII(.string	"SEI BsIsByteAligned error.\n" )
	.zero	4
.LC541:
	ASCII(.string	"SEI rbsp_trailing_bits(%d) not equal 0x80.\n" )
	.zero	4
.LC543:
	ASCII(.string	"nesting_num_ops_minus1" )
	.zero	1
.LC545:
	ASCII(.string	"nesting_num_ops_minus1 out of range(0,%d)\n" )
	.zero	5
.LC547:
	ASCII(.string	"nesting_op_idx" )
	.zero	1
.LC549:
	ASCII(.string	"nesting_num_layers_minus1" )
	.zero	6
.LC551:
	ASCII(.string	"nesting_num_layers_minus1 out of range(0,63)\n" )
	.zero	2
.LC558:
	ASCII(.string	"scaling_list_pred_matrix_id_delta" )
	.zero	6
.LC560:
	ASCII(.string	"scaling_list_pred_matrix_id_delta out of range(0,matrixId).\n" )
	.zero	3
.LC562:
	ASCII(.string	"HEVC_DecScalingListData pMatrixAddress NULL.\n" )
	.zero	2
.LC564:
	ASCII(.string	"scaling_list_dc_coef_minus8" )
	.zero	4
.LC566:
	ASCII(.string	"scaling_list_dc_coef_minus8 out of range(-7,247).\n" )
	.zero	5
.LC568:
	ASCII(.string	"scaling_list_delta_coef" )
.LC570:
	ASCII(.string	"scaling_list_dc_coef_minus8 out of range(-128,127).\n" )
	.zero	3
.LC572:
	ASCII(.string	"chroma_format_idc" )
	.zero	6
.LC574:
	ASCII(.string	"pSPS->chroma_format_idc out of range(0,3).\n" )
	.zero	4
.LC576:
	ASCII(.string	"pSPS->chroma_format_idc not equal(%d) 1.\n" )
	.zero	6
.LC578:
	ASCII(.string	"pic_width_in_luma_samples" )
	.zero	6
.LC580:
	ASCII(.string	"pic_width_in_luma_samples out of range(0,8192).\n" )
	.zero	7
.LC583:
	ASCII(.string	"pic_height_in_luma_samples" )
	.zero	5
.LC585:
	ASCII(.string	"pic_height_in_luma_samples out of range(0,4096).\n" )
	.zero	6
.LC587:
	ASCII(.string	"ERROR Unkown level: %d\n" )
.LC589:
	ASCII(.string	"conf_win_left_offset" )
	.zero	3
.LC592:
	ASCII(.string	"conf_win_right_offset" )
	.zero	2
.LC594:
	ASCII(.string	"conf_win_left_offset+conf_win_right_offset out of range.\n" )
	.zero	6
.LC596:
	ASCII(.string	"conf_win_top_offset" )
	.zero	4
.LC598:
	ASCII(.string	"conf_win_bottom_offset" )
	.zero	1
.LC600:
	ASCII(.string	"conf_win_top_offset+conf_win_bottom_offset out of range.\n" )
	.zero	6
.LC602:
	ASCII(.string	"bit_depth_luma_minus8" )
	.zero	2
.LC604:
	ASCII(.string	"bit_depth_luma(%d) out of range(8,10).\n" )
.LC606:
	ASCII(.string	"bit_depth_chroma_minus8" )
.LC608:
	ASCII(.string	"bit_depth_chroma(%d) out of range[8,14].\n" )
	.zero	6
.LC610:
	ASCII(.string	"log2_max_pic_order_cnt_lsb_minus4" )
	.zero	6
.LC612:
	ASCII(.string	"log2_max_pic_order_cnt_lsb_minus4 out of range[0,12].\n" )
	.zero	1
.LC614:
	ASCII(.string	"sps_max_dec_pic_buffering_minus1" )
	.zero	7
.LC616:
	ASCII(.string	"sps_num_reorder_pics" )
	.zero	3
.LC618:
	ASCII(.string	"sps_max_latency_increase_plus1" )
	.zero	1
.LC620:
	ASCII(.string	"log2_min_coding_block_size_minus3" )
	.zero	6
.LC622:
	ASCII(.string	"log2_min_luma_coding_block_size_minus3 out of range(0,3).\n" )
	.zero	5
.LC624:
	ASCII(.string	"log2_diff_max_min_coding_block_size" )
	.zero	4
.LC626:
	ASCII(.string	"log2_diff_max_min_luma_coding_block_size out of range(0,3).\n" )
	.zero	3
.LC628:
	ASCII(.string	"log2_ctb_sizeY out of range(4,6).\n" )
	.zero	5
.LC630:
	ASCII(.string	"log2_min_transform_block_size_minus2" )
	.zero	3
.LC632:
	ASCII(.string	"log2_min_transform_block_size_minus2 out of range(0,3).\n" )
	.zero	7
.LC634:
	ASCII(.string	"log2_diff_max_min_transform_block_size" )
	.zero	1
.LC636:
	ASCII(.string	"log2_diff_max_min_transform_block_size out of range(0,3).\n" )
	.zero	5
.LC638:
	ASCII(.string	"quadtree_tu_log2_min_size not less than log2_min_cb_sizeY.\n" )
	.zero	4
.LC640:
	ASCII(.string	"quadtree_tu_log2_max_size greater than Min( CtbLog2SizeY, 5 ).\n" )
.LC642:
	ASCII(.string	"max_transform_hierarchy_depth_inter" )
	.zero	4
.LC644:
	ASCII(.string	"max_transform_hierarchy_depth_inter out of range(0,CtbLog2SizeY-Log2MinTrafoSize).\n" )
	.zero	4
.LC646:
	ASCII(.string	"max_transform_hierarchy_depth_intra" )
	.zero	4
.LC648:
	ASCII(.string	"max_transform_hierarchy_depth_intra out of range(0,CtbLog2SizeY-Log2MinTrafoSize).\n" )
	.zero	4
.LC650:
	ASCII(.string	"SPS HEVC_DecScalingListData error.\n" )
	.zero	4
.LC652:
	ASCII(.string	"SPS sao is off and pic height(%d) is too small.(Logic Unsupported).\n" )
	.zero	3
.LC654:
	ASCII(.string	"log2_min_pcm_luma_coding_block_size_minus3" )
	.zero	5
.LC656:
	ASCII(.string	"log2_min_pcm_coding_block_size_minus3(%d) out of range[0,2].\n" )
	.zero	2
.LC658:
	ASCII(.string	"log2_diff_max_min_pcm_luma_coding_block_size" )
	.zero	3
.LC660:
	ASCII(.string	"log2_diff_max_min_pcm_coding_block_size(%d) out of range[0,2].\n" )
.LC662:
	ASCII(.string	"pcm_log2_max_size greater than Min( CtbLog2SizeY, 5 ).\n" )
.LC664:
	ASCII(.string	"num_short_term_ref_pic_sets" )
	.zero	4
.LC666:
	ASCII(.string	"num_short_term_ref_pic_sets out of range[0,%d].\n" )
	.zero	7
.LC668:
	ASCII(.string	"SPS HEVC_DecShortTermRefPicSet error.\n" )
	.zero	1
.LC670:
	ASCII(.string	"num_long_term_ref_pic_sps" )
	.zero	6
.LC672:
	ASCII(.string	"num_long_term_ref_pic_sps out of range[0,32].\n" )
	.zero	1
.LC674:
	ASCII(.string	"SPS HEVC_DecVuiParam error.\n" )
	.zero	3
.LC680:
	ASCII(.string	"sps_video_parameter_set_id out of range(0,%d).\n" )
.LC682:
	ASCII(.string	"sps_max_sub_layers_minus1 out of range(0,%d).\n" )
	.zero	1
.LC684:
	ASCII(.string	"SPS HEVC_DecPTL error.\n" )
.LC686:
	ASCII(.string	"sps_seq_parameter_set_id" )
	.zero	7
.LC688:
	ASCII(.string	"sps_seq_parameter_set_id out of range(0,%d).\n" )
	.zero	2
.LC691:
	ASCII(.string	"SPS[%d] decode error0.\n" )
.LC693:
	ASCII(.string	"SPS[%d] decode error.\n" )
	.zero	1
.LC695:
	ASCII(.string	"pps_seq_parameter_set_id" )
	.zero	7
.LC697:
	ASCII(.string	"pic_parameter_set_id(%d) out of range[0,15].\n" )
	.zero	2
.LC699:
	ASCII(.string	"SPS(%d) haven't decode.\n" )
	.zero	7
.LC701:
	ASCII(.string	"num_ref_idx_l0_default_active_minus1" )
	.zero	3
.LC703:
	ASCII(.string	"num_ref_idx_l0_default_active out of range[0,15].\n" )
	.zero	5
.LC705:
	ASCII(.string	"num_ref_idx_l1_default_active_minus1" )
	.zero	3
.LC707:
	ASCII(.string	"num_ref_idx_l1_default_active out of range[0,15].\n" )
	.zero	5
.LC709:
	ASCII(.string	"init_qp_minus26" )
.LC711:
	ASCII(.string	"init_qp_minus26(%d) out of range[-%d,51].\n" )
	.zero	5
.LC713:
	ASCII(.string	"diff_cu_qp_delta_depth" )
	.zero	1
.LC715:
	ASCII(.string	"diff_cu_qp_delta_depth out of range[0,3].\n" )
	.zero	5
.LC717:
	ASCII(.string	"pps_cb_qp_offset" )
	.zero	7
.LC719:
	ASCII(.string	"pic_cb_qp_offset out of range[-12,12].\n" )
.LC721:
	ASCII(.string	"pps_cr_qp_offset" )
	.zero	7
.LC723:
	ASCII(.string	"pic_cr_qp_offset out of range[-12,12].\n" )
.LC725:
	ASCII(.string	"num_tile_columns_minus1" )
.LC727:
	ASCII(.string	"num_tile_columns_minus1(%d) out of range(0, %d).\n" )
	.zero	6
.LC729:
	ASCII(.string	"num_tile_rows_minus1" )
	.zero	3
.LC731:
	ASCII(.string	"num_tile_rows_minus1 out(%d) of range(0, %d).\n" )
	.zero	1
.LC733:
	ASCII(.string	"Logic limit(%d), num_tile_columns(%d) exceed.\n" )
	.zero	1
.LC736:
	ASCII(.string	"Logic limit(%d), num_tile_rows(%d) exceed.\n" )
	.zero	4
.LC738:
	ASCII(.string	"column_width_minus1" )
	.zero	4
.LC741:
	ASCII(.string	"%s, %d: unsigned interger overflow\n" )
	.zero	4
.LC743:
	ASCII(.string	"column_width[%d](%d) out of range (0 %d)\n" )
	.zero	6
.LC745:
	ASCII(.string	"row_height_minus1" )
	.zero	6
.LC747:
	ASCII(.string	"row_height[%d](%d) out of range (0 %d)\n" )
.LC749:
	ASCII(.string	"column_bd[%d](%d) <= 0, invalid!\n" )
	.zero	6
.LC751:
	ASCII(.string	"row_bd[%d](%d) <= 0, invalid!\n" )
	.zero	1
.LC753:
	ASCII(.string	"PPS tile width(%d) is too small.(Logic Unsupport)\n" )
	.zero	5
.LC755:
	ASCII(.string	"PPS tile height(%d) is too small.(Logic Unsupport)\n" )
	.zero	4
.LC757:
	ASCII(.string	"pps_beta_offset_div2" )
	.zero	3
.LC759:
	ASCII(.string	"pps_beta_offset_div2(%d) out of range(-6,6).\n" )
	.zero	2
.LC761:
	ASCII(.string	"pps_tc_offset_div2" )
	.zero	5
.LC763:
	ASCII(.string	"pps_tc_offset_div2(%d) out of range(-6,6).\n" )
	.zero	4
.LC765:
	ASCII(.string	"PPS HEVC_DecScalingListData error.\n" )
	.zero	4
.LC767:
	ASCII(.string	"log2_parallel_merge_level_minus2" )
	.zero	7
.LC769:
	ASCII(.string	"log2_parallel_merge_level(%d) out of range(2,log2_ctb_sizeY).\n" )
	.zero	1
.LC774:
	ASCII(.string	"pps_pic_parameter_set_id" )
	.zero	7
.LC776:
	ASCII(.string	"pic_parameter_set_id(%d) out of range(0,%d).\n" )
	.zero	2
.LC779:
	ASCII(.string	"PPS[%d] decode error.\n" )
	.zero	1
.LC781:
	ASCII(.string	"luma_log2_weight_denom" )
	.zero	1
.LC783:
	ASCII(.string	"luma_log2_weight_denom out of range(0,7).\n" )
	.zero	5
.LC785:
	ASCII(.string	"delta_chroma_log2_weight_denom" )
	.zero	1
.LC787:
	ASCII(.string	"delta_chroma_log2_weight_denom out of range(-7,7).\n" )
	.zero	4
.LC789:
	ASCII(.string	"chroma_log2_weight_denom out of range(0,7).\n" )
	.zero	3
.LC791:
	ASCII(.string	"delta_luma_weight_l0" )
	.zero	3
.LC793:
	ASCII(.string	"delta_luma_weight_l0(%d) out of range(-128,127).\n" )
	.zero	6
.LC795:
	ASCII(.string	"luma_offset_l0" )
	.zero	1
.LC797:
	ASCII(.string	"luma_offset_l0(%d) out of range(-128,127).\n" )
	.zero	4
.LC799:
	ASCII(.string	"delta_chroma_weight_l0" )
	.zero	1
.LC801:
	ASCII(.string	"delta_chroma_weight_l0 out of range(-128,127).\n" )
.LC803:
	ASCII(.string	"delta_chroma_offset_l0" )
	.zero	1
.LC805:
	ASCII(.string	"delta_chroma_offset_l0 out of range(-512,511).\n" )
.LC807:
	ASCII(.string	"delta_luma_weight_l1" )
	.zero	3
.LC809:
	ASCII(.string	"delta_luma_weight_l1 out of range(-128,127).\n" )
	.zero	2
.LC811:
	ASCII(.string	"luma_offset_l1" )
	.zero	1
.LC813:
	ASCII(.string	"luma_offset_l1 out of range(-128,127).\n" )
.LC815:
	ASCII(.string	"delta_chroma_weight_l1" )
	.zero	1
.LC817:
	ASCII(.string	"delta_chroma_weight_l1 out of range(-128,127).\n" )
.LC819:
	ASCII(.string	"delta_chroma_offset_l1" )
	.zero	1
.LC821:
	ASCII(.string	"delta_chroma_offset_l1 out of range(-512,511).\n" )
.LC823:
	ASCII(.string	"slice_pic_parameter_set_id" )
	.zero	5
.LC826:
	ASCII(.string	"%s: pic_parameter_set_id(%d) out of range(0 %d)!\n" )
	.zero	6
.LC828:
	ASCII(.string	"HEVC_VpsSpsPpsCheck != HEVC_DEC_NORMAL\n" )
.LC830:
	ASCII(.string	"max_cu_width(%d)/max_cu_height(%d) = 0\n" )
.LC832:
	ASCII(.string	"slice_segment_address(%d) out of range(0, %d).\n" )
.LC834:
	ASCII(.string	"slice_type" )
	.zero	5
.LC836:
	ASCII(.string	"slice_type(%d) out of range(0,2].\n" )
	.zero	5
.LC838:
	ASCII(.string	"HEVC_ClearDPB,LastDisplayPoc:%d poc:%d \n" )
	.zero	7
.LC840:
	ASCII(.string	"SH HEVC_DecShortTermRefPicSet error.\n" )
	.zero	2
.LC842:
	ASCII(.string	"short_term_ref_pic_set_idx(%d) out of range[0,%d].\n" )
	.zero	4
.LC844:
	ASCII(.string	"num_long_term_sps" )
	.zero	6
.LC846:
	ASCII(.string	"num_long_term_sps(%d) out of range[0,%d].\n" )
	.zero	5
.LC848:
	ASCII(.string	"num_long_term_pics" )
	.zero	5
.LC850:
	ASCII(.string	"SH ERROR: (num_negative_pics(%d) + num_positive_pics(%d) + num_of_longterm_pics(%d)) > %d\n" )
	.zero	5
.LC852:
	ASCII(.string	"lt_idx_sps[%d] = %d, but out of range[0,%d].\n" )
	.zero	2
.LC854:
	ASCII(.string	"delta_poc_msb_cycle_lt" )
	.zero	1
.LC856:
	ASCII(.string	"ERROR: pRPS->num_of_pics(%d) > %d.\n" )
	.zero	4
.LC858:
	ASCII(.string	"num_ref_idx_l0_active_minus1" )
	.zero	3
.LC860:
	ASCII(.string	"num_ref_idx_l0_active(%d) out of range(0,%d).\n" )
	.zero	1
.LC862:
	ASCII(.string	"num_ref_idx_l1_active_minus1" )
	.zero	3
.LC864:
	ASCII(.string	"num_ref_idx_l1_active(%d) out of range(0,%d).\n" )
	.zero	1
.LC866:
	ASCII(.string	"pRPS is null.\n" )
	.zero	1
.LC868:
	ASCII(.string	"pRPS->num_of_pics out(%d) of range(0,%d).\n" )
	.zero	5
.LC870:
	ASCII(.string	"SH HEVC_DecRefPicListsModification error.\n" )
	.zero	5
.LC872:
	ASCII(.string	"collocated_ref_idx" )
	.zero	5
.LC874:
	ASCII(.string	"collocated_from_l0_flag=%d, collocated_ref_idx(%d) out of range(0,%d).\n" )
.LC876:
	ASCII(.string	"SH HEVC_DecPredWeightTable error.\n" )
	.zero	5
.LC878:
	ASCII(.string	"five_minus_max_num_merge_cand" )
	.zero	2
.LC880:
	ASCII(.string	"SH max_num_merge_cand(%d) out of range(1,5).\n" )
	.zero	2
.LC882:
	ASCII(.string	"slice_qp_delta" )
	.zero	1
.LC884:
	ASCII(.string	"SH slice_qp(%d) out of range [-%d,51].\n" )
.LC886:
	ASCII(.string	"slice_cb_qp_offset" )
	.zero	5
.LC888:
	ASCII(.string	"SH slice_cb_qp_offset(%d) out of range[-12,12].\n" )
	.zero	7
.LC890:
	ASCII(.string	"SH slice_cb_qp_offset(%d)+pic_cb_qp_offset(%d) out of range[-12,12].\n" )
	.zero	2
.LC892:
	ASCII(.string	"slice_cr_qp_offset" )
	.zero	5
.LC894:
	ASCII(.string	"SH slice_cr_qp_offset(%d) out of range[-12,12].\n" )
	.zero	7
.LC896:
	ASCII(.string	"SH slice_cr_qp_offset+pPPS->pic_cr_qp_offset(%d) out of range[-12,12].\n" )
.LC898:
	ASCII(.string	"slice_beta_offset_div2" )
	.zero	1
.LC900:
	ASCII(.string	"SH slice_beta_offset_div2(%d) out of range(-6,6).\n" )
	.zero	5
.LC902:
	ASCII(.string	"slice_tc_offset_div2" )
	.zero	3
.LC904:
	ASCII(.string	"SH slice_tc_offset_div2(%d) out of range(-6,6).\n" )
	.zero	7
.LC906:
	ASCII(.string	"num_entry_point_offsets" )
.LC908:
	ASCII(.string	"CurrSlice.num_entry_point_offsets(%d) out of range[0,%d].\n" )
	.zero	5
.LC910:
	ASCII(.string	"offset_len_minus1" )
	.zero	6
.LC912:
	ASCII(.string	"CurrSlice.offset_len(%d) out of range[1,32].\n" )
	.zero	2
.LC914:
	ASCII(.string	"slice_segment_header_extension_length" )
	.zero	2
.LC916:
	ASCII(.string	"slice_segment_header_extension_length(%d) out of range [0,256]\n" )
.LC918:
	ASCII(.string	"bitsLeft(%d) < slice_segment_header_extension_length(%d)\n" )
	.zero	6
.LC923:
	ASCII(.string	"%s arrange mem failed.\n" )
.LC925:
	ASCII(.string	"Init dec para\n" )
	.zero	1
.LC929:
	ASCII(.string	"HEVC_InitDPB error, return %d\n" )
	.zero	1
.LC931:
	ASCII(.string	"HEVC_AllocFrameStore error\n" )
	.zero	4
.LC934:
	ASCII(.string	"%s: HEVC_OutputFrame failed!\n" )
	.zero	2
.LC937:
	ASCII(.string	"%s output current picture failed\n" )
	.zero	6
.LC941:
	ASCII(.string	"HEVC.c line %d: frame para err(ret=%d), recycle image self\n" )
	.zero	4
.LC945:
	ASCII(.string	"%s: BlockFsPoc:%d, LastPoc:%d!\n" )
.LC947:
	ASCII(.string	"%s: FirstFrameFastOut LastPoc: %d, CurPos: %d!\n" )
.LC949:
	ASCII(.string	"%s: poc:%d, CurPos: %d !\n" )
	.zero	6
.LC953:
	ASCII(.string	"%s call HEVC_GetUnRefPicWithMinPoc failed\n" )
	.zero	5
.LC955:
	ASCII(.string	"%s call HEVC_OutputOneFrmFromDPB failed\n" )
	.zero	7
.LC958:
	ASCII(.string	"%s: HEVC_OutputFrmToVO err!\n" )
	.zero	3
.LC960:
	ASCII(.string	"cann't find slot for current nal\n" )
	.zero	6
.LC962:
	ASCII(.string	"receive a zero packet\n" )
	.zero	1
.LC964:
	ASCII(.string	"nal_release_err\n" )
	.zero	7
.LC967:
	ASCII(.string	"%s: flush dpb failed, return %d\n" )
	.zero	7
.LC970:
	ASCII(.string	"%s: DPB.used_size(%d) >= DPB.size(%d), need to increase DPB size.\n" )
	.zero	5
.LC972:
	ASCII(.string	"%s call HEVC_IncreaseDPBSize failed\n" )
	.zero	3
.LC974:
	ASCII(.string	"%s: DPB.used_size(%d) >= DPB.size(%d), output minpoc frame.\n" )
	.zero	3
.LC979:
	ASCII(.string	"%s with invalid pos(%d)\n" )
	.zero	7
.LC982:
	ASCII(.string	"%s get APC error, ret %d\n" )
	.zero	6
.LC985:
	ASCII(.string	"%s %d: InsertFrmInDPB failed, return %d\n" )
	.zero	7
.LC987:
	ASCII(.string	"%s call HEVC_CheckFrameStore failed!\n" )
	.zero	2
.LC991:
	ASCII(.string	"%s call HEVC_RemoveUnUsedFrameStore Failed.\n" )
	.zero	3
.LC993:
	ASCII(.string	"%s call HEVC_InsertFrmInDPB Failed.\n" )
	.zero	3
.LC998:
	ASCII(.string	"%s call HEVC_FirstFrameFastOut Failed\n" )
	.zero	1
.LC1000:
	ASCII(.string	"DPB.used_size may bigger than DPB.size\n" )
.LC1002:
	ASCII(.string	"HEVC_InsertFrmInDPB Failed, ret = %d\n" )
	.zero	2
.LC1004:
	ASCII(.string	"%s call HEVC_OutputFrmFromDPB failed\n" )
	.zero	2
.LC1006:
	ASCII(.string	"pHevcCtx->CurrPic.frame_store is null pointer\n" )
	.zero	1
.LC1008:
	ASCII(.string	"HEVC_StorePicInDpb return(%d) from L%d\n" )
.LC1012:
	ASCII(.string	"%s CurrPic.state = HEVC_PIC_EMPTY, return HEVC_DEC_NORMAL\n" )
	.zero	5
.LC1014:
	ASCII(.string	"%s, REPORT_IFRAME_ERR\n" )
	.zero	1
.LC1017:
	ASCII(.string	"Discard cur pic, ErrLevel(%d) > OutErrThr(%d)\n" )
	.zero	1
.LC1019:
	ASCII(.string	"%s call HEVC_IModeProcess Failed\n" )
	.zero	6
.LC1021:
	ASCII(.string	"%s call HEVC_SimpleDPBProcess Failed\n" )
	.zero	2
.LC1023:
	ASCII(.string	"%s call HEVC_DecOrderProcess Failed\n" )
	.zero	3
.LC1025:
	ASCII(.string	"%s call HEVC_DispOrderProcess Failed\n" )
	.zero	2
.LC1027:
	ASCII(.string	"%s return HEVC_DEC_ERR\n" )
.LC1030:
	ASCII(.string	"No frame store for lost pic.\n" )
	.zero	2
.LC1032:
	ASCII(.string	"DPB ERROR: Can not get ref_fs!\n" )
.LC1034:
	ASCII(.string	"DPB no suited fs for lost pic.\n" )
.LC1036:
	ASCII(.string	"Take poc(%d) to creat lost poc(%d).\n" )
	.zero	3
.LC1038:
	ASCII(.string	"DPB ERROR: Ref DecodeFs = NULL, ClearDPB!\n" )
	.zero	5
.LC1040:
	ASCII(.string	"ERROR: Can not new logic fs!\n" )
	.zero	2
.LC1042:
	ASCII(.string	"Lost pic insert in DPB Failed!\n" )
.LC1044:
	ASCII(.string	"Ref frame(poc %d) lost.\n" )
	.zero	7
.LC1046:
	ASCII(.string	"s32OutErrThr = %d,drop poc %d because lost ref frame(pod %d)\n" )
	.zero	2
.LC1049:
	ASCII(.string	"DecVDM MaxBytesReceived exceed threshold!\n" )
	.zero	5
.LC1051:
	ASCII(.string	"DecVDM no slice and needn't start VDM\n" )
	.zero	1
.LC1053:
	ASCII(.string	"IPBDecMode Changed (%d -> %d)\n" )
	.zero	1
.LC1056:
	ASCII(.string	"VDM start, TotalPicNum=%d.\n" )
	.zero	4
.LC1059:
	ASCII(.string	"%s no correct slice in the pic\n" )
.LC1061:
	ASCII(.string	"Discard this B(poc=%d) before P, is_ref_idc=%d.\n" )
	.zero	7
.LC1064:
	ASCII(.string	"metadatasize is too large:%d at line:%d\n" )
	.zero	7
.LC1067:
	ASCII(.string	"%s:%d Metadata map failed\n" )
	.zero	5
.LC1071:
	ASCII(.string	"%s:%d Metadata unmap failed\n" )
	.zero	3
.LC1074:
	ASCII(.string	"*****[%s][%d],BL Codec can only dec BL stream!!*****\n" )
	.zero	2
.LC1076:
	ASCII(.string	"*****[%s][%d],EL Codec can only dec EL stream in DV_DUAL_VES_IMP stream!!*****\n" )
.LC1078:
	ASCII(.string	"***** VES Splitter: UNSUPPORT, HDR_capacity=%d*****\n" )
	.zero	3
.LC1082:
	ASCII(.string	"%s call HEVC_FlushOutputFrmFromDPB failed\n" )
	.zero	5
.LC1084:
	ASCII(.string	"%s call HEVC_EmptyFrmFromDPB failed\n" )
	.zero	3
.LC1086:
	ASCII(.string	"Meet CRA frame, force output remain frame, CurPoc %d, LastPoc %d\n" )
	.zero	6
.LC1088:
	ASCII(.string	"Init pic err, exit\n" )
	.zero	4
.LC1090:
	ASCII(.string	"HEVC_WritePicMsg failed!\n" )
	.zero	6
.LC1092:
	ASCII(.string	"Start Reason: SliceParaNum= %d\n" )
.LC1095:
	ASCII(.string	"Too many slice , err!\n" )
	.zero	1
.LC1097:
	ASCII(.string	"Cur pic not init yet, discard this slice!\n" )
	.zero	5
.LC1099:
	ASCII(.string	"Dec List error, ret=%d\n" )
.LC1101:
	ASCII(.string	"Ref List is Wrong!\n" )
	.zero	4
.LC1103:
	ASCII(.string	"HEVC_WriteSliceMsg err.\n" )
	.zero	7
.LC1106:
	ASCII(.string	"VPS decode error.\n" )
	.zero	5
.LC1109:
	ASCII(.string	"SPS decode error.\n" )
	.zero	5
.LC1111:
	ASCII(.string	"PPS decode error.\n" )
	.zero	5
.LC1113:
	ASCII(.string	"SEI decode error.\n" )
	.zero	5
.LC1115:
	ASCII(.string	"***** NAL: UNSUPPORT, nal_unit_type=%d\n" )
.LC1118:
	ASCII(.string	"HEVC_DecSliceSegmentHeader dec err\n" )
	.zero	4
.LC1122:
	ASCII(.string	"%s last frame fs unrelease, fix it!\n" )
	.zero	3
.LC1126:
	ASCII(.string	"OSAL_FP_alloc_virmem g_pGlbVar fail %d\n" )
.LC1134:
	ASCII(.string	"%s: Get context addr failed!\n" )
	.zero	2
.LC1136:
	ASCII(.string	"%s FATAL: MemOffset %d > ContextMemSize %d.\n" )
	.zero	3
.LC1138:
	ASCII(.string	"%s: VCTRL_GetChanIDByCtx() return -1!\n" )
	.zero	1
.LC1140:
	ASCII(.string	"Fs leak, clear dpb fs not in vo queue.\n" )
.LC1142:
	ASCII(.string	"No frame store available!\n" )
	.zero	5
.LC1145:
	ASCII(.string	"%s ReadImgNum = %d, NewImgNum = %d, FrameStore leak, ClearAll!\n" )
.LC1147:
	ASCII(.string	"HEVCDEC_DecodePacket NULL == pPacket!\n" )
	.zero	1
.LC1149:
	ASCII(.string	"HevcCtx not init!\n" )
	.zero	5
.LC1151:
	ASCII(.string	"HEVCDEC_DecodePacket NULL == pHevcCtx->pCurrNal!\n" )
	.zero	6
.LC1154:
	ASCII(.string	"nal_layer_id out %d of range[0,1].\n" )
	.zero	4
.LC1160:
	ASCII(.string	"IsSizeChanged = %d,old w/h = %d/%d,new w/h = %d/%d\n" )
	.zero	4
.LC1163:
	ASCII(.string	"HEVC_InquireSliceProperty error.\n" )
	.zero	6
.LC1166:
	ASCII(.string	"HEVC_DecOneNal ERR\n" )
	.zero	4
.LC1171:
	ASCII(.string	"HEVC_StorePicInDPB failed, ret = %d\n" )
	.bss
	.align	3
.LANCHOR1 = . + 0
	.type	g_pGlbVar, %object
	.size	g_pGlbVar, 8
g_pGlbVar:
	.zero	8
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
