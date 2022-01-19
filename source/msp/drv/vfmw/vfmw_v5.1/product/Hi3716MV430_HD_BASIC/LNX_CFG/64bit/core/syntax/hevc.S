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
	ldr	w1, [x0, 4]
	ldr	w2, [x2, 4]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	HEVC_ComparePicByPocAsc, .-HEVC_ComparePicByPocAsc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	HEVC_CheckThatAllRefPicsAreAvailable.part.7, %function
HEVC_CheckThatAllRefPicsAreAvailable.part.7:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	w0, [x19, 7044]
	mov	w4, 1888
	ldr	x2, [x19, 2392]
	add	x6, x19, 8192
	ldr	x1, [x19, 2384]
	mov	w3, 12644
	ldr	w8, [x6, -252]
	smaddl	x2, w0, w4, x2
	ldr	w4, [x6, -248]
	mov	w0, 1
	ldr	w15, [x6, -244]
	ldr	w2, [x2, 32]
	add	w8, w8, w4
	cmp	w8, w15
	mov	w12, w8
	smaddl	x1, w2, w3, x1
	ldr	w14, [x1, 116]
	lsl	w14, w0, w14
	bcs	.L5
	ldr	w3, [x19, 2804]
	mov	w10, 0
	mov	w9, 0
	sub	w14, w14, #1
	sub	x16, x6, #252
	.p2align 2
.L6:
	sxtw	x13, w12
	cbz	w3, .L12
	add	x5, x19, x13, lsl 2
	mov	w7, 0
	mov	w0, 0
	ldr	w4, [x5, 7096]
	b	.L9
	.p2align 3
.L47:
	ldr	x1, [x2, 2824]
	ldr	w2, [x1, 60]
	cbz	w2, .L8
	ldr	w11, [x1, 4]
	ldr	w2, [x5, 8040]
	cmp	w11, w2
	beq	.L44
.L8:
	add	w0, w0, 1
	cmp	w0, w3
	beq	.L46
.L9:
	add	x2, x19, x0, sxtw 3
	cbnz	w4, .L47
	ldr	x1, [x2, 2824]
	ldr	w2, [x1, 60]
	cbz	w2, .L8
	ldr	w11, [x1, 4]
	ldr	w2, [x5, 8040]
	eor	w2, w11, w2
	tst	w2, w14
	bne	.L8
.L44:
	ldrb	w1, [x1, 1]
	add	w0, w0, 1
	cmp	w1, wzr
	csinc	w7, w7, wzr, eq
	cmp	w0, w3
	bne	.L9
	.p2align 2
.L46:
	cbz	w7, .L12
.L10:
	add	w12, w12, 1
	cmp	w15, w12
	bne	.L6
	cbz	w8, .L14
.L13:
	mov	w12, 0
	.p2align 2
.L18:
	mov	w11, 0
	mov	w0, 0
	sxtw	x5, w12
	cbnz	w3, .L36
	b	.L20
	.p2align 3
.L15:
	cmp	w0, w3
	beq	.L48
.L36:
	add	x2, x19, x0, sxtw 3
	add	x1, x6, x5, lsl 2
	add	w0, w0, 1
	ldr	x2, [x2, 2824]
	ldr	w4, [x2, 60]
	cbnz	w4, .L15
	ldr	w4, [x1, -220]
	ldr	w7, [x19, 7020]
	ldr	w1, [x2, 4]
	add	w4, w7, w4
	cmp	w1, w4
	bne	.L15
	ldrb	w1, [x2, 1]
	cmp	w1, wzr
	csinc	w11, w11, wzr, eq
	cmp	w0, w3
	bne	.L36
	.p2align 2
.L48:
	cbz	w11, .L20
.L17:
	add	w12, w12, 1
	cmp	w8, w12
	bhi	.L18
.L14:
	mov	w0, 1
	cbz	w9, .L35
	mov	w0, 0
	str	w10, [x20]
.L35:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L12:
	ldr	w1, [x19, 7040]
	add	x2, x13, 8
	ldr	w4, [x19, 7020]
	add	x1, x1, 56
	ldr	w0, [x16, x2, lsl 2]
	ldr	w1, [x19, x1, lsl 2]
	add	w0, w4, w0
	cmp	w0, w1
	blt	.L10
	add	x13, x16, x13
	ldrb	w1, [x13, 12]
	cmp	w1, wzr
	csel	w10, w10, w0, eq
	csinc	w9, w9, wzr, eq
	b	.L10
	.p2align 3
.L20:
	sxtw	x2, w12
	ldr	w1, [x19, 7040]
	sub	x4, x6, #252
	add	x0, x2, 8
	add	x1, x1, 56
	ldr	w5, [x19, 7020]
	ldr	w0, [x4, x0, lsl 2]
	ldr	w1, [x19, x1, lsl 2]
	add	w0, w5, w0
	cmp	w0, w1
	blt	.L17
	add	x2, x4, x2
	ldrb	w1, [x2, 12]
	cmp	w1, wzr
	csel	w10, w10, w0, eq
	csinc	w9, w9, wzr, eq
	b	.L17
.L5:
	cbz	w8, .L35
	mov	w10, 0
	mov	w9, 0
	ldr	w3, [x19, 2804]
	b	.L13
	.size	HEVC_CheckThatAllRefPicsAreAvailable.part.7, .-HEVC_CheckThatAllRefPicsAreAvailable.part.7
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	HEVC_SetFrmRepeatCount.part.8, %function
HEVC_SetFrmRepeatCount.part.8:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	w3, [x19, 288]
	ldr	w2, [x19, 2800]
	ldr	w0, [x19, 284]
	add	w2, w3, w2
	add	w3, w2, 1
	cmp	w0, w3
	bcc	.L50
	sub	w0, w0, #1
	sub	w0, w0, w2
	cmp	w0, 1
	bls	.L51
	mov	w0, 2
	str	w0, [x20, 16]
	ldr	w0, [x19, 288]
	add	w0, w0, 2
	str	w0, [x19, 288]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L50:
	str	wzr, [x20, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L51:
	mov	w0, 1
	str	w0, [x20, 16]
	ldr	w0, [x19, 288]
	add	w0, w0, 1
	str	w0, [x19, 288]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_SetFrmRepeatCount.part.8, .-HEVC_SetFrmRepeatCount.part.8
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	HEVC_OutputFrame.isra.9, %function
HEVC_OutputFrame.isra.9:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x21, x1
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 248]
	ldr	w1, [x21]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L59
	ldr	w0, [x19, 248]
	mov	w2, 1
	ldr	w1, [x21]
	bl	FSP_SetDisplay
	add	x3, x19, 8192
	ldr	w0, [x19, 248]
	mov	x4, x20
	add	x3, x3, 176
	mov	x2, x19
	mov	w1, 16
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L60
	ldr	x0, [x19, 2464]
	ldr	w0, [x0, 632]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L61
	str	wzr, [x20, 16]
.L58:
	ldr	w1, [x19, 288]
	mov	w0, 0
	ldr	w2, [x19, 296]
	add	w1, w1, 1
	str	w1, [x19, 288]
	add	w2, w2, 1
	str	w2, [x19, 296]
.L55:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L61:
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_SetFrmRepeatCount.part.8
	b	.L58
	.p2align 3
.L60:
	ldr	x3, .LC0
	mov	w1, 10617
	ldr	x2, .LC4
	mov	w0, 1
	bl	dprint_normal
	ldr	w0, [x19, 248]
	mov	w2, 0
	ldr	w1, [x21]
	bl	FSP_SetDisplay
	mov	w0, -1
	b	.L55
.L59:
	ldr	x3, .LC0
	mov	w1, 10589
	ldr	x2, .LC2
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L55
	.size	HEVC_OutputFrame.isra.9, .-HEVC_OutputFrame.isra.9
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
.L63:
	add	x19, x19, 4
	ldr	x0, [x20, 2368]
	mov	w1, 16
	bl	BsGet
	str	w0, [x19, -4]
	mov	w1, 16
	ldr	x0, [x20, 2368]
	bl	BsGet
	str	w0, [x19, 8]
	cmp	x19, x22
	bne	.L63
	ldr	x0, [x20, 2368]
	mov	w1, 16
	bl	BsGet
	str	w0, [x21, 28]
	mov	w1, 16
	ldr	x0, [x20, 2368]
	bl	BsGet
	str	w0, [x21, 32]
	mov	w1, 32
	ldr	x0, [x20, 2368]
	bl	BsGet
	str	w0, [x21, 36]
	mov	w1, 32
	ldr	x0, [x20, 2368]
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
	.global	HEVC_SaveMetadata
	.type	HEVC_SaveMetadata, %function
HEVC_SaveMetadata:
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
	ldr	x20, .LC7
	ldr	x0, [x20, w21, sxtw 3]
	cbz	x0, .L65
	ldr	x19, .LC8
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
.L65:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	HEVC_SaveMetadata, .-HEVC_SaveMetadata
	.align	3
.LC7:
	.xword	g_SaveMetadataFileHandler
	.align	3
.LC8:
	.xword	vfmw_Osal_Func_Ptr_S
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
	ldr	x3, .LC9
	add	x0, x19, 12288
	mov	x2, 56
	mov	w1, 0
	add	x0, x0, 1632
	ldr	x3, [x3, 96]
	blr	x3
	str	wzr, [x19, 3372]
	add	x0, x19, 3072
	stp	xzr, xzr, [x0, 320]
	stp	xzr, xzr, [x0, 336]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_Sei_ParsePts_Init, .-HEVC_Sei_ParsePts_Init
	.align	3
.LC9:
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
	mov	x20, x2
	bl	_mcount
	ldr	w5, [x19, 7044]
	ldr	w6, [x19, 168]
	tbnz	w5, #31, .L73
	cmp	w5, w6
	bge	.L73
	ldr	x0, [x19, 2392]
	mov	w1, 1888
	ldr	w6, [x19, 164]
	smaddl	x5, w5, w1, x0
	ldr	w5, [x5, 32]
	tbnz	w5, #31, .L77
	cmp	w5, w6
	bge	.L77
	add	x3, x19, 12288
	ldr	x2, [x19, 2384]
	add	x1, x3, 1632
	ldr	w6, [x20, 36]
	mov	w4, 12644
	ldr	w0, [x1, 4]
	str	w6, [x1, 12]
	smaddl	x5, w5, w4, x2
	cmp	w0, 1
	ldr	w0, [x20, 40]
	str	w0, [x1, 16]
	ldr	w0, [x5, 52]
	add	x5, x5, x0, lsl 2
	ldrb	w2, [x5, 356]
	beq	.L85
	ldrb	w0, [x1, 1]
	cbz	w0, .L81
	ldrb	w0, [x19, 3368]
	add	x4, x19, 3376
	cbz	w0, .L82
	ldr	x5, [x4, 24]
	mov	x1, x5
.L83:
	ldr	w6, [x4, 8]
	add	x0, x6, x1
	str	x0, [x4, 16]
	cmp	x0, x5
	str	x0, [x4, 40]
	bge	.L80
	add	x0, x6, x5
	str	x0, [x4, 16]
	str	x0, [x4, 40]
	b	.L80
	.p2align 3
.L77:
	mov	w3, 2834
	ldr	w4, [x19, 248]
	ldr	x2, .LC13
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L73:
	mov	w3, 2824
	ldr	w4, [x19, 248]
	ldr	x2, .LC11
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L81:
	add	x4, x19, 3376
	ldr	w0, [x4, 8]
	ldr	x1, [x4, 16]
	add	x0, x0, x1
	str	x0, [x4, 40]
.L80:
	add	x3, x3, 1632
	str	x0, [x4, 32]
	ldr	x1, [x3, 32]
	strb	wzr, [x3, 1]
	str	x1, [x3, 48]
	ldrb	w1, [x20, 2]
	cbnz	w1, .L86
	ldr	w1, [x4, 12]
	add	x0, x1, x0
	sub	x0, x0, x2, uxtb
	str	x0, [x3, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L86:
	ldr	w1, [x4, 12]
	add	x1, x1, x0
	asr	x1, x1, 1
	sub	x0, x1, x2, uxtb
	str	x0, [x3, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L85:
	add	x4, x19, 3376
	ldrsw	x0, [x19, 3372]
	str	x0, [x4, 16]
	str	x0, [x4, 40]
	b	.L80
	.p2align 3
.L82:
	ldp	x1, x5, [x4, 16]
	b	.L83
	.size	HEVC_Sei_Get_Dpb_Output_Time, .-HEVC_Sei_Get_Dpb_Output_Time
	.align	3
.LC11:
	.xword	.LC10
	.align	3
.LC13:
	.xword	.LC12
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
	bls	.L94
.L88:
	sub	w19, w19, #6
	cmp	w19, 3
	bls	.L87
	ldr	x0, [x20, 3416]
	str	x0, [x20, 3400]
.L87:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L94:
	ldr	x0, [x20, 2464]
	ldr	x0, [x0, 32]
	cmn	x0, #1
	beq	.L89
	ldr	x1, [x20, 13952]
	str	x0, [x20, 13944]
	str	x1, [x20, 13960]
	str	x1, [x20, 13968]
.L89:
	add	x0, x20, 12288
	mov	w1, 1
	strb	w1, [x0, 1632]
	b	.L88
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
	ldr	w4, [x19, 13932]
	ldr	w5, [x19, 13936]
	ldr	x6, [x19, 13944]
	ldr	x3, [x19, 13952]
	ldr	x7, [x19, 13960]
	cbz	w4, .L98
	mov	w1, w4
	mov	w2, w5
	b	.L97
	.p2align 3
.L99:
	mov	w1, w0
.L97:
	udiv	w0, w2, w1
	msub	w0, w0, w1, w2
	mov	w2, w1
	cbnz	w0, .L99
.L96:
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
	str	x1, [x19, 6680]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L98:
	mov	w1, w5
	b	.L96
	.size	HEVC_Sei_Get_Frame_Pts, .-HEVC_Sei_Get_Frame_Pts
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
	mov	w23, w2
	mov	w22, w3
	mov	w24, w4
	mov	w21, 0
	bl	_mcount
	cbz	w19, .L101
	mov	w0, 255
	cmp	w19, 16
	ccmp	w19, w0, 4, gt
	bne	.L101
	cmp	w20, wzr
	ccmp	w23, wzr, 4, ne
	ccmp	w19, w0, 0, eq
	beq	.L101
	cmp	w19, 1
	beq	.L128
	cmp	w19, 255
	beq	.L103
	ldr	x0, .LC14
	sbfiz	x19, x19, 3, 32
	add	x0, x0, 24
	add	x1, x0, x19
	ldr	w20, [x0, x19]
	ldr	w23, [x1, 4]
.L103:
	lsl	w4, w20, 10
	lsl	w22, w22, 10
	sdiv	w2, w4, w23
	sdiv	w4, w22, w24
	mul	w4, w2, w4
	cmp	w4, wzr
	add	w0, w4, 1023
	csel	w4, w0, w4, lt
	asr	w4, w4, 10
	subs	w1, w4, #2406
	bmi	.L129
.L104:
	subs	w0, w4, #2263
	bmi	.L130
	cmp	w1, w0
	mov	w21, 4
	blt	.L101
.L108:
	subs	w1, w4, #1820
	bmi	.L131
	cmp	w0, w1
	mov	w21, 3
	bge	.L109
.L101:
	ldr	x2, .LC16
	mov	w3, w21
	mov	w1, 3037
	mov	w0, 20
	bl	dprint_normal
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L130:
	mov	w0, 2263
	mov	w21, 4
	sub	w0, w0, w4
	cmp	w1, w0
	blt	.L101
	b	.L108
	.p2align 3
.L129:
	mov	w1, 2406
	sub	w1, w1, w4
	b	.L104
	.p2align 3
.L128:
	mov	w1, 7680
	mov	w0, 4320
	cmp	w22, w1
	mov	w21, 2
	ccmp	w24, w0, 0, eq
	cset	w0, eq
	cbnz	w0, .L101
	mov	w0, 2160
	cmp	w22, 3840
	ccmp	w24, w0, 0, eq
	beq	.L101
	sub	w0, w24, #1080
	mov	w1, 1920
	and	w0, w0, -9
	cmp	w0, wzr
	ccmp	w22, w1, 0, eq
	beq	.L101
	mov	w0, 720
	cmp	w22, 1280
	ccmp	w24, w0, 0, eq
	beq	.L101
	mov	w0, 480
	cmp	w22, 640
	ccmp	w24, w0, 0, eq
	mov	w21, 5
	cset	w0, eq
	cmp	w0, wzr
	csinc	w21, w21, wzr, eq
	b	.L101
	.p2align 3
.L131:
	mov	w1, 1820
	mov	w21, 3
	sub	w1, w1, w4
	cmp	w0, w1
	blt	.L101
.L109:
	subs	w0, w4, #1365
	bmi	.L132
.L107:
	mov	w21, 2
	cmp	w1, w0
	csinc	w21, w21, wzr, lt
	b	.L101
.L132:
	mov	w0, 1365
	sub	w0, w0, w4
	b	.L107
	.size	HEVC_GetDar, .-HEVC_GetDar
	.align	3
.LC14:
	.xword	.LANCHOR0
	.align	3
.LC16:
	.xword	.LC15
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_PrintDPBState
	.type	HEVC_PrintDPBState, %function
HEVC_PrintDPBState:
	sub	sp, sp, #192
	stp	x29, x30, [sp, 80]
	add	x29, sp, 80
	stp	x19, x20, [sp, 96]
	stp	x21, x22, [sp, 112]
	stp	x23, x24, [sp, 128]
	stp	x25, x26, [sp, 144]
	stp	x27, x28, [sp, 160]
	mov	x19, x0
	mov	x0, x30
	mov	w20, 0
	bl	_mcount
	ldr	x2, .LC19
	mov	w1, 3048
	mov	w0, 1
	bl	dprint_normal
	ldr	x2, .LC21
	mov	w1, 3050
	ldr	w3, [x19, 2800]
	mov	w0, 1
	ldr	w4, [x19, 2804]
	ldr	w7, [x19, 2812]
	ldr	w5, [x19, 2816]
	ldr	w6, [x19, 2820]
	bl	dprint_normal
	ldr	w0, [x19, 2804]
	cbz	w0, .L138
	.p2align 2
.L137:
	add	x21, x19, x20, uxtw 3
	ldr	w0, [x19, 248]
	ldr	x2, [x21, 2824]
	ldrb	w6, [x2]
	ldp	w1, w25, [x2, 24]
	ldr	w7, [x2, 44]
	ldrb	w22, [x2, 1]
	ldrb	w23, [x2, 2]
	ldr	w24, [x2, 4]
	ldr	w26, [x2, 60]
	stp	w6, w7, [x29, 104]
	bl	FSP_GetLogicFs
	mov	x27, x0
	ldr	x1, [x21, 2824]
	ldr	w0, [x19, 248]
	ldr	w1, [x1, 24]
	bl	FSP_GetRef
	mov	w28, w0
	ldr	x1, [x21, 2824]
	ldr	w0, [x19, 248]
	ldr	w1, [x1, 24]
	bl	FSP_GetDisplay
	ldr	x8, [x21, 2824]
	mov	w3, w20
	ldr	x2, .LC25
	mov	w5, w25
	mov	x4, x8
	add	w20, w20, 1
	ldr	w1, [x8, 168]
	str	w1, [sp, 64]
	mov	w1, 3061
	ldp	w6, w7, [x29, 104]
	ldr	w8, [x8, 24]
	str	w8, [sp, 56]
	str	w0, [sp, 48]
	mov	w0, 1
	str	w22, [sp]
	str	w23, [sp, 8]
	str	w24, [sp, 16]
	str	w26, [sp, 24]
	str	x27, [sp, 32]
	str	w28, [sp, 40]
	bl	dprint_normal
	ldr	w0, [x19, 2804]
	cmp	w0, w20
	bhi	.L137
.L138:
	ldr	x22, .LC23
	mov	w1, 3064
	mov	w0, 1
	mov	w21, 0
	mov	x2, x22
	bl	dprint_normal
	ldr	w0, [x19, 2804]
	cbz	w0, .L136
	ldr	x23, .LC32
	ldr	x27, .LC34
	ldr	x26, .LC36
	ldr	x25, .LC38
	ldr	x24, .LC40
	b	.L144
	.p2align 3
.L148:
	ldr	x2, .LC42
	mov	x3, x28
	mov	w1, 3094
	mov	w0, 1
	bl	dprint_normal
	ldr	x2, .LC44
	mov	w1, 3095
	ldr	w3, [x28, 76]
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 1
	mov	x2, x22
	mov	w1, 3102
	add	w21, w21, w0
	bl	dprint_normal
	ldr	w0, [x19, 2804]
	cmp	w0, w21
	bls	.L136
.L144:
	add	x1, x19, x21, uxtw 3
	ldr	w0, [x19, 248]
	ldr	x1, [x1, 2824]
	ldr	w1, [x1, 24]
	bl	FSP_GetLogicFs
	mov	x20, x0
	mov	w3, w21
	mov	x2, x23
	mov	w1, 3078
	mov	w0, 1
	cbz	x20, .L147
	ldr	x28, [x20, 24]
	bl	dprint_normal
	mov	x3, x20
	mov	x2, x27
	mov	w1, 3082
	mov	w0, 1
	bl	dprint_normal
	ldr	w3, [x20, 12]
	mov	x2, x26
	mov	w1, 3083
	mov	w0, 1
	bl	dprint_normal
	ldrsb	w3, [x20]
	mov	x2, x25
	mov	w1, 3084
	mov	w0, 1
	bl	dprint_normal
	ldr	w3, [x20, 20]
	mov	x2, x24
	mov	w1, 3085
	mov	w0, 1
	bl	dprint_normal
	cbnz	x28, .L148
	ldr	x2, .LC46
	mov	w1, 3099
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 1
	mov	x2, x22
	mov	w1, 3102
	add	w21, w21, w0
	bl	dprint_normal
	ldr	w0, [x19, 2804]
	cmp	w0, w21
	bhi	.L144
.L136:
	ldr	x2, .LC27
	mov	w1, 3105
	mov	w0, 1
	bl	dprint_normal
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L147:
	ldr	x3, .LC28
	mov	w4, 3072
	ldr	x2, .LC30
	mov	w1, w4
	add	x3, x3, 160
	bl	dprint_normal
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
.LC19:
	.xword	.LC18
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
	.align	3
.LC28:
	.xword	.LANCHOR0
	.align	3
.LC30:
	.xword	.LC29
	.align	3
.LC32:
	.xword	.LC31
	.align	3
.LC34:
	.xword	.LC33
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
	.align	3
.LC46:
	.xword	.LC45
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
	bls	.L150
	sub	w19, w19, #16
	cmp	w19, 5
	cset	w0, ls
.L150:
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
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 6416]
	cbnz	w0, .L156
	ldr	x1, [x19, 2464]
	ldr	w2, [x1, 672]
	cmp	w2, 1
	beq	.L160
.L155:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L156:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L160:
	ldr	w2, [x1, 668]
	cbnz	w2, .L155
	ldr	w2, [x1, 676]
	cbnz	w2, .L155
	ldr	w0, [x1, 632]
	add	w0, w0, 1024
	cmp	w0, 2048
	cset	w0, hi
	b	.L155
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
	ldr	x0, [x19, 2368]
	mov	w1, 32
	bl	BsGet
	mov	w20, w0
	ldr	x0, [x19, 2368]
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
	ldr	x0, [x22, 2440]
	ldr	x1, [x22, 2432]
	ldp	w23, w26, [x0, 68]
	ldr	w25, [x1, 128]
	sub	w0, w23, #1
	cmp	w0, 9
	bhi	.L190
	sub	w0, w26, #1
	cmp	w0, 10
	bhi	.L191
	ldr	x24, .LC52
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
	ble	.L171
	sub	w7, w25, #4
	mov	x2, x20
	mov	w1, 0
	mov	w6, 0
.L170:
	str	w1, [x2]
	lsl	w4, w1, w7
	ldr	x0, [x22, 2440]
	add	x0, x0, x6, sxtw 1
	ldrsh	w5, [x0, 172]
	add	w5, w5, w1
	lsl	w1, w5, w7
	sub	w0, w5, #1
	cmp	w4, w1
	str	w0, [x2, 4]
	bge	.L176
	cmp	w4, 255
	bhi	.L172
	uxtb	w3, w6
	b	.L174
	.p2align 3
.L175:
	cmp	w4, 255
	bhi	.L172
.L174:
	strb	w3, [x19, w4, sxtw]
	add	w4, w4, 1
	cmp	w4, w1
	blt	.L175
.L176:
	add	w6, w6, 1
	add	x2, x2, 8
	cmp	w23, w6
	mov	w1, w5
	bne	.L170
.L171:
	cmp	w26, wzr
	ble	.L168
	sub	w25, w25, #4
	mov	w0, 0
	mov	w5, 0
.L178:
	str	w0, [x21]
	lsl	w4, w0, w25
	ldr	x1, [x22, 2440]
	add	x1, x1, x5, sxtw 1
	ldrsh	w3, [x1, 212]
	add	w3, w3, w0
	lsl	w0, w3, w25
	sub	w1, w3, #1
	cmp	w4, w0
	str	w1, [x21, 4]
	bge	.L183
	cmp	w4, 255
	bhi	.L179
	uxtb	w2, w5
	add	x1, x19, 256
	b	.L181
	.p2align 3
.L182:
	cmp	w4, 255
	bhi	.L179
.L181:
	strb	w2, [x1, w4, sxtw]
	add	w4, w4, 1
	cmp	w4, w0
	blt	.L182
.L183:
	add	w5, w5, 1
	add	x21, x21, 8
	cmp	w26, w5
	mov	w0, w3
	bne	.L178
.L168:
	mov	w0, 0
	b	.L164
	.p2align 3
.L172:
	ldr	x3, .LC47
	mov	w1, 3545
	ldr	x2, .LC54
	mov	w0, 1
	add	x3, x3, 184
	bl	dprint_normal
	mov	w0, -1
.L164:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L179:
	ldr	x3, .LC47
	mov	w1, 3569
	ldr	x2, .LC56
	mov	w0, 1
	add	x3, x3, 184
	bl	dprint_normal
	mov	w0, -1
	b	.L164
.L191:
	ldr	x3, .LC47
	mov	w5, 11
	ldr	x2, .LC51
	mov	w4, w26
	add	x3, x3, 184
	mov	w1, 3524
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L164
.L190:
	ldr	x3, .LC47
	mov	w5, 10
	ldr	x2, .LC49
	mov	w4, w23
	add	x3, x3, 184
	mov	w1, 3518
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L164
	.size	HEVC_CalcTileInfo, .-HEVC_CalcTileInfo
	.align	3
.LC47:
	.xword	.LANCHOR0
	.align	3
.LC49:
	.xword	.LC48
	.align	3
.LC51:
	.xword	.LC50
	.align	3
.LC52:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC54:
	.xword	.LC53
	.align	3
.LC56:
	.xword	.LC55
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
	ldr	x1, [x19, 2368]
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
	ldr	x3, .LC57
	mov	x2, 40
	ldr	x1, [x19, 2368]
	add	x0, x29, x2
	ldr	x3, [x3, 104]
	blr	x3
	ldp	w0, w1, [x29, 72]
	sub	w0, w0, w1
	mov	w1, 0
	cmp	w0, w20
	bcc	.L200
.L194:
	ldp	x19, x20, [sp, 16]
	mov	w0, w1
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L200:
	mov	w1, 1
	add	x0, x29, 40
	bl	BsShow
	mov	w1, 1
	cbz	w0, .L194
	add	x0, x29, 40
	bl	BsSkip
	ldp	w0, w19, [x29, 72]
	sub	w19, w0, w19
	b	.L195
	.p2align 3
.L196:
	bl	BsSkip
	ldp	w0, w19, [x29, 72]
	sub	w19, w0, w19
.L195:
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
	bne	.L196
	mov	w1, w2
	ldp	x19, x20, [sp, 16]
	mov	w0, w1
	ldp	x29, x30, [sp], 80
	ret
	.size	HEVC_Sei_Payload_Extension_Present, .-HEVC_Sei_Payload_Extension_Present
	.align	3
.LC57:
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
	beq	.L209
	ldr	x0, [x20, 2368]
	mov	w1, 8
	mov	w21, 3
	bl	BsGet
	mov	w22, w0
.L208:
	cbnz	w22, .L203
	mov	w19, 16
	.p2align 2
.L204:
	ldr	x0, [x20, 2368]
	mov	w1, 8
	bl	BsGet
	subs	w19, w19, #1
	bne	.L204
.L205:
	subs	w21, w21, #1
	bne	.L208
.L213:
	mov	w0, 0
.L202:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L203:
	cmp	w22, 1
	beq	.L212
	cmp	w22, 2
	bne	.L205
	ldr	x0, [x20, 2368]
	mov	w1, 32
	bl	BsGet
	subs	w21, w21, #1
	bne	.L208
	b	.L213
.L212:
	ldr	x0, [x20, 2368]
	mov	w1, 16
	bl	BsGet
	subs	w21, w21, #1
	bne	.L208
	b	.L213
.L209:
	mov	w0, -1
	b	.L202
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
	beq	.L216
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	mov	w0, 0
.L215:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L216:
	mov	w0, -1
	b	.L215
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
	beq	.L219
	mov	w0, 1
	mov	x1, x19
	strb	w0, [x19]
	mov	x0, x20
	bl	HEVC_Sei_Mastering_Display_Colour_Volume.part.15
.L218:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L219:
	mov	w0, -1
	b	.L218
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
	beq	.L222
	mov	w0, 1
	strb	w0, [x19]
	mov	w1, 16
	ldr	x0, [x20, 2368]
	bl	BsGet
	strh	w0, [x19, 2]
	mov	w1, 16
	ldr	x0, [x20, 2368]
	bl	BsGet
	strh	w0, [x19, 4]
	mov	w1, 0
.L221:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L222:
	mov	w1, -1
	b	.L221
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
	beq	.L225
	ldr	x0, [x20, 2368]
	mov	w1, 8
	bl	BsGet
	strb	w0, [x19]
	mov	w1, 0
.L224:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L225:
	mov	w1, -1
	b	.L224
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
	beq	.L228
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	bl	BsToNextByte
	mov	w0, 0
.L227:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L228:
	mov	w0, -1
	b	.L227
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
	beq	.L232
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L233
.L231:
	ldr	x0, [x19, 2368]
	bl	BsToNextByte
	mov	w0, 0
.L230:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L233:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	b	.L231
	.p2align 3
.L232:
	mov	w0, -1
	b	.L230
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
	beq	.L236
	ldr	x0, [x20, 2368]
	mov	w1, 4
	bl	BsGet
	strb	w0, [x19, 1]
	mov	w1, 4
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x19, 2]
	mov	w1, 1
	mov	w0, 0
	strb	w1, [x19]
.L235:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L236:
	mov	w0, -1
	b	.L235
	.size	HEVC_Sei_TSI, .-HEVC_Sei_TSI
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_HDR10PLUS
	.type	HEVC_Sei_HDR10PLUS, %function
HEVC_Sei_HDR10PLUS:
	stp	x29, x30, [sp, -96]!
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
	cmp	x20, xzr
	ccmp	x21, xzr, 4, ne
	beq	.L266
	ldr	x0, [x20, 2368]
	mov	w1, 8
	mov	w22, 1
	bl	BsGet
	strb	w0, [x21, 6]
	mov	w1, 8
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x21, 7]
	mov	w1, 2
	ldr	x0, [x20, 2368]
	bl	BsGet
	uxtb	w25, w0
	cmp	w25, w22
	strb	w25, [x21, 8]
	bls	.L243
	.p2align 2
.L285:
	add	x19, x21, x22, uxtb 1
	ldr	x0, [x20, 2368]
	mov	w1, 16
	add	x23, x21, x22, sxtw
	add	w22, w22, 1
	bl	BsGet
	strh	w0, [x19, 10]
	mov	w1, 16
	uxtb	w22, w22
	ldr	x0, [x20, 2368]
	bl	BsGet
	strh	w0, [x19, 16]
	mov	w1, 16
	ldr	x0, [x20, 2368]
	bl	BsGet
	strh	w0, [x19, 22]
	mov	w1, 16
	ldr	x0, [x20, 2368]
	bl	BsGet
	strh	w0, [x19, 28]
	mov	w1, 16
	ldr	x0, [x20, 2368]
	bl	BsGet
	strh	w0, [x19, 34]
	mov	w1, 16
	ldr	x0, [x20, 2368]
	bl	BsGet
	strh	w0, [x19, 40]
	mov	w1, 8
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x23, 46]
	mov	w1, 16
	ldr	x0, [x20, 2368]
	bl	BsGet
	strh	w0, [x19, 50]
	mov	w1, 16
	ldr	x0, [x20, 2368]
	bl	BsGet
	strh	w0, [x19, 56]
	mov	w1, 16
	ldr	x0, [x20, 2368]
	bl	BsGet
	strh	w0, [x19, 62]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x23, 68]
	cmp	w25, w22
	ccmp	w22, 2, 2, hi
	bls	.L285
.L243:
	ldr	x0, [x20, 2368]
	mov	w1, 27
	bl	BsGet
	str	w0, [x21, 72]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	str	w0, [x21, 76]
	cbnz	w0, .L302
.L241:
	mov	w24, 0
	mov	w27, 60
	mov	x26, 1140
	cbz	w25, .L248
	.p2align 2
.L283:
	uxtw	x22, w24
	lsl	x19, x22, 2
	sub	x19, x19, x22
	lsl	x19, x19, 2
	add	x23, x19, 1044
	add	x19, x19, 1056
	add	x23, x21, x23
	add	x19, x21, x19
.L249:
	ldr	x0, [x20, 2368]
	mov	w1, 17
	bl	BsGet
	str	w0, [x23], 4
	cmp	x19, x23
	bne	.L249
	ldr	x0, [x20, 2368]
	mov	w1, 17
	sxtw	x23, w24
	bl	BsGet
	add	x2, x21, x23, lsl 2
	mov	w1, 4
	str	w0, [x2, 1080]
	ldr	x0, [x20, 2368]
	bl	BsGet
	uxtb	w0, w0
	add	x1, x21, x23
	strb	w0, [x1, 1092]
	cbz	w0, .L253
	umaddl	x28, w27, w24, x26
	add	x0, x21, x22, lsl 4
	mov	w19, 0
	sub	x22, x0, x22
	add	x28, x21, x28
	.p2align 2
.L252:
	add	x22, x22, 1
	ldr	x0, [x20, 2368]
	mov	w1, 7
	add	w19, w19, 1
	bl	BsGet
	strb	w0, [x22, 1094]
	mov	w1, 17
	uxtb	w19, w19
	ldr	x0, [x20, 2368]
	bl	BsGet
	str	w0, [x28], 4
	add	x1, x21, x23
	ldrb	w0, [x1, 1092]
	cmp	w0, w19
	ccmp	w19, 14, 2, hi
	bls	.L252
.L253:
	ldr	x0, [x20, 2368]
	mov	w1, 10
	add	w24, w24, 1
	add	x23, x21, x23, lsl 1
	uxtb	w24, w24
	bl	BsGet
	cmp	w25, w24
	strh	w0, [x23, 1320]
	ccmp	w24, 2, 2, hi
	bls	.L283
.L248:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	str	w0, [x21, 1328]
	cbnz	w0, .L303
.L254:
	mov	w22, 0
	mov	w27, 30
	mov	x26, 2324
	cbnz	w25, .L281
	b	.L265
	.p2align 3
.L262:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	str	w0, [x24, 2416]
	cbnz	w0, .L304
.L261:
	add	w22, w22, 1
	uxtb	w22, w22
	cmp	w25, w22
	ccmp	w22, 2, 2, hi
	bhi	.L265
.L281:
	uxtw	x19, w22
	ldr	x0, [x20, 2368]
	mov	w1, 1
	add	x24, x21, x19, lsl 2
	bl	BsGet
	str	w0, [x24, 2296]
	cbz	w0, .L262
	add	x19, x21, x19, lsl 1
	ldr	x0, [x20, 2368]
	mov	w1, 12
	sxtw	x23, w22
	bl	BsGet
	strh	w0, [x19, 2308]
	mov	w1, 12
	ldr	x0, [x20, 2368]
	bl	BsGet
	strh	w0, [x19, 2314]
	mov	w1, 4
	ldr	x0, [x20, 2368]
	bl	BsGet
	uxtb	w0, w0
	add	x1, x21, x23
	strb	w0, [x1, 2320]
	cbz	w0, .L262
	umaddl	x28, w27, w22, x26
	mov	w19, 0
	add	x28, x21, x28
	.p2align 2
.L263:
	ldr	x0, [x20, 2368]
	mov	w1, 10
	add	w19, w19, 1
	bl	BsGet
	strh	w0, [x28], 2
	add	x1, x21, x23
	uxtb	w19, w19
	ldrb	w0, [x1, 2320]
	cmp	w0, w19
	ccmp	w19, 14, 2, hi
	bls	.L263
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	str	w0, [x24, 2416]
	cbz	w0, .L261
	.p2align 2
.L304:
	ldr	x0, [x20, 2368]
	mov	w1, 6
	bl	BsGet
	add	x1, x21, x22, sxtw
	add	w22, w22, 1
	uxtb	w22, w22
	cmp	w25, w22
	strb	w0, [x1, 2428]
	ccmp	w22, 2, 2, hi
	bls	.L281
.L265:
	mov	w1, 1
	str	w1, [x21, 2432]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L302:
	ldr	x0, [x20, 2368]
	mov	w1, 5
	bl	BsGet
	strb	w0, [x21, 80]
	mov	w1, 5
	ldr	x0, [x20, 2368]
	bl	BsGet
	uxtb	w0, w0
	ldrb	w1, [x21, 80]
	strb	w0, [x21, 81]
	cbz	w1, .L241
	mov	x24, x21
	mov	w23, 0
	.p2align 2
.L244:
	mov	x22, x24
	mov	w19, 0
	cbz	w0, .L246
	.p2align 2
.L284:
	add	x22, x22, 1
	ldr	x0, [x20, 2368]
	mov	w1, 4
	add	w19, w19, 1
	bl	BsGet
	strb	w0, [x22, 81]
	uxtb	w19, w19
	ldrb	w0, [x21, 81]
	cmp	w0, w19
	ccmp	w19, 30, 2, hi
	bls	.L284
	ldrb	w1, [x21, 80]
.L246:
	add	w23, w23, 1
	add	x24, x24, 31
	uxtb	w23, w23
	cmp	w1, w23
	ccmp	w23, 30, 2, hi
	bhi	.L241
	ldrb	w0, [x21, 81]
	b	.L244
.L303:
	ldr	x0, [x20, 2368]
	mov	w1, 5
	bl	BsGet
	strb	w0, [x21, 1332]
	mov	w1, 5
	ldr	x0, [x20, 2368]
	bl	BsGet
	uxtb	w0, w0
	ldrb	w1, [x21, 1332]
	strb	w0, [x21, 1333]
	cbz	w1, .L254
	mov	x24, x21
	mov	w23, 0
	.p2align 2
.L255:
	mov	x22, x24
	mov	w19, 0
	cbz	w0, .L257
	.p2align 2
.L282:
	add	x22, x22, 1
	ldr	x0, [x20, 2368]
	mov	w1, 4
	add	w19, w19, 1
	bl	BsGet
	strb	w0, [x22, 1333]
	uxtb	w19, w19
	ldrb	w0, [x21, 1333]
	cmp	w0, w19
	ccmp	w19, 30, 2, hi
	bls	.L282
	ldrb	w1, [x21, 1332]
.L257:
	add	w23, w23, 1
	add	x24, x24, 31
	uxtb	w23, w23
	cmp	w1, w23
	ccmp	w23, 30, 2, hi
	bhi	.L254
	ldrb	w0, [x21, 1333]
	b	.L255
.L266:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.size	HEVC_Sei_HDR10PLUS, .-HEVC_Sei_HDR10PLUS
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
	bls	.L317
	.p2align 2
.L314:
	ldr	x0, [x20, 2368]
	mov	w1, 8
	bl	BsGet
	subs	w19, w19, #1
	bne	.L314
	subs	w21, w21, #16
	mov	x19, 0
	beq	.L312
	.p2align 2
.L313:
	ldr	x0, [x20, 2368]
	mov	w1, 8
	bl	BsGet
	cmp	w19, 5
	bls	.L318
.L310:
	add	x19, x19, 1
	cmp	w21, w19
	bhi	.L313
	cmp	w21, 5
	bls	.L312
	mov	w0, 21572
	ldr	w1, [x29, 56]
	movk	w0, 0x3147, lsl 16
	cmp	w1, w0
	beq	.L319
.L312:
	mov	w0, 0
.L307:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L319:
	ldrb	w0, [x29, 60]
	add	x20, x20, 24576
	cmp	w0, 65
	cset	w1, eq
	str	w1, [x20, 3288]
	bne	.L312
	ldrb	w1, [x29, 61]
	mov	w0, 0
	and	w1, w1, 15
	str	w1, [x20, 3292]
	b	.L307
.L317:
	ldr	x2, .LC62
	mov	w1, 6281
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L307
.L318:
	add	x1, x29, 56
	strb	w0, [x19, x1]
	b	.L310
	.size	HEVC_Sei_User_Data_Unregistered, .-HEVC_Sei_User_Data_Unregistered
	.align	3
.LC62:
	.xword	.LC61
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
	ldr	w4, [x19, 7076]
	cbnz	w4, .L361
.L321:
	mov	w0, 0
.L359:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L361:
	ldr	x0, [x19, 2488]
	cbz	x0, .L343
	ldr	x0, [x0, 16]
	mov	w20, 0
	cbnz	x0, .L327
	b	.L323
	.p2align 3
.L363:
	ldr	x1, [x0, 24]
	cbz	x1, .L328
	ldr	w4, [x19, 7076]
	add	w20, w20, 1
	cmp	w4, w20
	add	x0, x19, x20, sxtw 3
	bls	.L362
	ldr	x0, [x0, 2488]
	cbz	x0, .L322
	ldr	x0, [x0, 16]
	cbz	x0, .L323
.L327:
	ldr	w1, [x0, 24]
	ldr	w0, [x19, 248]
	bl	FSP_GetLogicFs
	cbnz	x0, .L363
.L328:
	add	x19, x19, x20, sxtw 3
	ldr	x2, .LC68
	mov	x5, x0
	mov	w3, w20
	mov	w1, 6353
	mov	w0, 1
	ldr	x4, [x19, 2488]
	ldr	x4, [x4, 16]
	bl	dprint_normal
	mov	w0, -1
.L367:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L362:
	cbz	w4, .L321
	ldr	w0, [x19, 7080]
	cbz	w0, .L321
	ldr	x0, [x19, 2624]
	cbz	x0, .L345
	ldr	x0, [x0, 16]
	mov	w20, 0
	cbnz	x0, .L338
	b	.L335
	.p2align 3
.L366:
	ldr	x1, [x0, 24]
	cbz	x1, .L339
	ldr	w0, [x19, 7080]
	add	w20, w20, 1
	cmp	w0, w20
	add	x1, x19, x20, sxtw 3
	bls	.L321
	ldr	x0, [x1, 2624]
	cbz	x0, .L364
	ldr	x0, [x0, 16]
	cbz	x0, .L365
.L338:
	ldr	w1, [x0, 24]
	ldr	w0, [x19, 248]
	bl	FSP_GetLogicFs
	cbnz	x0, .L366
.L339:
	ldr	x2, .LC74
	mov	x4, x0
	mov	w3, w20
	mov	w1, 6389
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L359
.L343:
	mov	w20, 0
	.p2align 2
.L322:
	ldr	x2, .LC64
	mov	w3, w20
	mov	w1, 6337
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L367
	.p2align 3
.L323:
	ldr	x2, .LC66
	mov	w3, w20
	mov	w1, 6344
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L367
.L365:
	ldr	w4, [x19, 7076]
.L335:
	ldr	x2, .LC72
	mov	w3, w20
	mov	w1, 6380
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L359
.L364:
	ldr	w4, [x19, 7076]
.L334:
	ldr	x2, .LC70
	mov	w3, w20
	mov	w1, 6373
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L359
.L345:
	mov	w20, 0
	b	.L334
	.size	HEVC_IsRefListWrong, .-HEVC_IsRefListWrong
	.align	3
.LC64:
	.xword	.LC63
	.align	3
.LC66:
	.xword	.LC65
	.align	3
.LC68:
	.xword	.LC67
	.align	3
.LC70:
	.xword	.LC69
	.align	3
.LC72:
	.xword	.LC71
	.align	3
.LC74:
	.xword	.LC73
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
	ldr	w4, [x19, 2804]
	cmp	w4, 16
	bhi	.L369
	mov	w5, 2147483647
	mov	w0, 0
	cbz	w4, .L374
	.p2align 2
.L377:
	add	x2, x19, x0, uxtw 3
	ldr	x2, [x2, 2824]
	ldr	w3, [x2, 4]
	cmp	w3, w5
	bge	.L372
	ldr	w2, [x2]
	tst	w2, 16776960
	bne	.L372
	str	w0, [x20]
	mov	w5, w3
	ldr	w4, [x19, 2804]
.L372:
	add	w0, w0, 1
	cmp	w4, w0
	bhi	.L377
	ldr	w4, [x20]
	cmn	w4, #1
	beq	.L374
	ldr	x3, .LC75
	mov	w1, 6441
	ldr	x2, .LC81
	mov	w0, 1
	add	x3, x3, 208
	bl	dprint_normal
	mov	w0, 0
.L371:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L374:
	ldr	x3, .LC75
	mov	w1, 6436
	ldr	x2, .LC77
	mov	w0, 1
	add	x3, x3, 208
	bl	dprint_normal
	mov	w0, -1
	b	.L371
.L369:
	ldr	x3, .LC75
	mov	w1, 6419
	ldr	x2, .LC79
	mov	w0, 1
	add	x3, x3, 208
	bl	dprint_normal
	mov	w0, w21
	b	.L371
	.size	HEVC_GetUnRefPicWithMinPoc, .-HEVC_GetUnRefPicWithMinPoc
	.align	3
.LC75:
	.xword	.LANCHOR0
	.align	3
.LC77:
	.xword	.LC76
	.align	3
.LC79:
	.xword	.LC78
	.align	3
.LC81:
	.xword	.LC80
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IncreaseDPBSize
	.type	HEVC_IncreaseDPBSize, %function
HEVC_IncreaseDPBSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19, 2800]
	cmp	w4, 16
	bhi	.L384
	ldr	w0, [x19, 248]
	bl	FSP_GetMinAvailableDecFsNum
	cmp	w0, wzr
	ldr	x3, .LC82
	ble	.L383
	ldr	w1, [x19, 2800]
	add	w4, w1, 1
	cmp	w0, w4
	bcc	.L383
	ldr	x2, .LC86
	add	x3, x3, 240
	mov	w1, 6462
	mov	w0, 11
	str	w4, [x19, 2800]
	bl	dprint_normal
	mov	w0, 0
.L382:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L383:
	ldr	x2, .LC88
	mov	w4, w0
	mov	w1, 6467
	add	x3, x3, 240
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L382
	.p2align 3
.L384:
	ldr	x3, .LC82
	mov	w1, 6452
	ldr	x2, .LC84
	mov	w5, 17
	add	x3, x3, 240
	mov	w0, 1
	bl	dprint_normal
	mov	w1, 17
	mov	w0, -1
	str	w1, [x19, 2800]
	b	.L382
	.size	HEVC_IncreaseDPBSize, .-HEVC_IncreaseDPBSize
	.align	3
.LC82:
	.xword	.LANCHOR0
	.align	3
.LC84:
	.xword	.LC83
	.align	3
.LC86:
	.xword	.LC85
	.align	3
.LC88:
	.xword	.LC87
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
	ldr	w0, [x19, 7036]
	sub	w1, w0, #16
	cmp	w1, 5
	bhi	.L386
	str	w0, [x19, 6404]
	str	wzr, [x19, 6416]
.L385:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L386:
	ldr	w0, [x19, 6404]
	sub	w0, w0, #16
	cmp	w0, 5
	bls	.L385
	ldr	w0, [x19, 7028]
	cmp	w0, 1
	beq	.L388
	cmp	w0, 2
	beq	.L389
	cbnz	w0, .L385
	mov	w0, 2
	str	w0, [x19, 6416]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L388:
	ldr	w1, [x19, 6416]
	cmp	w1, 2
	beq	.L385
	str	w0, [x19, 6416]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L389:
	ldr	w0, [x19, 6416]
	sub	w0, w0, #1
	cmp	w0, 1
	bls	.L385
	str	wzr, [x19, 6416]
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
	ldr	w1, [x19, 7036]
	cmp	w1, 15
	bhi	.L395
	mov	w0, 1
	tbnz	x1, 0, .L396
.L395:
	sub	w1, w1, #16
	cmp	w1, 7
	cset	w0, ls
.L396:
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
	ldrb	w4, [x1, 608]
	ldr	w3, [x1, 616]
	ldr	w2, [x1, 612]
	ldrb	w0, [x1, 604]
	ubfiz	w2, w2, 8, 8
	orr	w2, w2, w4, lsl 16
	orr	w0, w0, w3, lsl 24
	orr	w0, w2, w0
	str	w0, [x19]
	ldrb	w4, [x1, 617]
	ldrb	w2, [x1, 609]
	ldr	w3, [x1, 612]
	ldrb	w0, [x1, 605]
	lsl	w2, w2, 16
	and	w3, w3, 65280
	orr	w2, w2, w4, lsl 24
	orr	w0, w0, w3
	orr	w0, w2, w0
	str	w0, [x19, 4]
	ldrb	w4, [x1, 618]
	ldrb	w2, [x1, 614]
	ldr	w3, [x1, 608]
	ldrb	w0, [x1, 606]
	lsl	w2, w2, 8
	and	w3, w3, 16711680
	orr	w2, w2, w4, lsl 24
	orr	w0, w0, w3
	orr	w0, w2, w0
	str	w0, [x19, 8]
	ldrb	w3, [x1, 611]
	ldrb	w2, [x1, 615]
	ldr	w0, [x1, 616]
	ldrb	w1, [x1, 607]
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
	ldrb	w5, [x0, 1772]
	ldr	w3, [x0, 1780]
	ldr	w4, [x0, 1764]
	ldrb	w2, [x1, 604]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19]
	ldrb	w5, [x0, 1804]
	ldr	w3, [x0, 1812]
	ldr	w4, [x0, 1796]
	ldrb	w2, [x0, 1788]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19, 4]
	ldrb	w5, [x0, 1781]
	ldrb	w4, [x0, 1773]
	ldr	w3, [x0, 1764]
	ldrb	w2, [x1, 605]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 8]
	ldrb	w5, [x0, 1813]
	ldrb	w4, [x0, 1805]
	ldr	w3, [x0, 1796]
	ldrb	w2, [x0, 1789]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 12]
	ldrb	w5, [x0, 1782]
	ldrb	w4, [x0, 1766]
	ldr	w3, [x0, 1772]
	ldrb	w2, [x1, 606]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 16]
	ldrb	w5, [x0, 1814]
	ldrb	w4, [x0, 1798]
	ldr	w3, [x0, 1804]
	ldrb	w2, [x0, 1790]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 20]
	ldrb	w4, [x0, 1775]
	ldrb	w3, [x0, 1767]
	ldr	w5, [x0, 1780]
	ldrb	w2, [x1, 607]
	lsl	w3, w3, 8
	and	w1, w5, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 24]
	ldrb	w4, [x0, 1807]
	ldrb	w3, [x0, 1799]
	ldr	w1, [x0, 1812]
	ldrb	w2, [x0, 1791]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 28]
	ldrb	w4, [x0, 1776]
	ldr	w2, [x0, 1784]
	ldr	w3, [x0, 1768]
	ldrb	w1, [x0, 1760]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 32]
	ldrb	w4, [x0, 1808]
	ldr	w2, [x0, 1816]
	ldr	w3, [x0, 1800]
	ldrb	w1, [x0, 1792]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 36]
	ldrb	w4, [x0, 1785]
	ldrb	w3, [x0, 1777]
	ldr	w2, [x0, 1768]
	ldrb	w1, [x0, 1761]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 40]
	ldrb	w4, [x0, 1817]
	ldrb	w3, [x0, 1809]
	ldr	w2, [x0, 1800]
	ldrb	w1, [x0, 1793]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 44]
	ldrb	w4, [x0, 1786]
	ldrb	w3, [x0, 1770]
	ldr	w2, [x0, 1776]
	ldrb	w1, [x0, 1762]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 48]
	ldrb	w4, [x0, 1818]
	ldrb	w3, [x0, 1802]
	ldr	w2, [x0, 1808]
	ldrb	w1, [x0, 1794]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 52]
	ldrb	w4, [x0, 1779]
	ldrb	w3, [x0, 1771]
	ldr	w1, [x0, 1784]
	ldrb	w2, [x0, 1763]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 56]
	ldrb	w3, [x0, 1811]
	ldrb	w2, [x0, 1803]
	ldr	w4, [x0, 1816]
	ldrb	w1, [x0, 1795]
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
	ldrb	w5, [x0, 1020]
	ldr	w3, [x0, 1036]
	ldr	w4, [x0, 1004]
	ldrb	w2, [x1, 604]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19]
	ldrb	w5, [x0, 1028]
	ldr	w3, [x0, 1044]
	ldr	w4, [x0, 1012]
	ldrb	w2, [x0, 996]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19, 4]
	ldrb	w5, [x0, 1037]
	ldrb	w4, [x0, 1021]
	ldr	w3, [x0, 1004]
	ldrb	w2, [x1, 605]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 8]
	ldrb	w5, [x0, 1045]
	ldrb	w4, [x0, 1029]
	ldr	w3, [x0, 1012]
	ldrb	w2, [x0, 997]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 12]
	ldrb	w5, [x0, 1038]
	ldrb	w4, [x0, 1006]
	ldr	w3, [x0, 1020]
	ldrb	w2, [x1, 606]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 16]
	ldrb	w5, [x0, 1046]
	ldrb	w4, [x0, 1014]
	ldr	w3, [x0, 1028]
	ldrb	w2, [x0, 998]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 20]
	ldrb	w4, [x0, 1023]
	ldrb	w3, [x0, 1007]
	ldr	w5, [x0, 1036]
	ldrb	w2, [x1, 607]
	lsl	w3, w3, 8
	and	w1, w5, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 24]
	ldrb	w4, [x0, 1031]
	ldrb	w3, [x0, 1015]
	ldr	w1, [x0, 1044]
	ldrb	w2, [x0, 999]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 28]
	ldrb	w4, [x0, 1024]
	ldr	w2, [x0, 1040]
	ldr	w3, [x0, 1008]
	ldrb	w1, [x0, 992]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 32]
	ldrb	w4, [x0, 1032]
	ldr	w2, [x0, 1048]
	ldr	w3, [x0, 1016]
	ldrb	w1, [x0, 1000]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 36]
	ldrb	w4, [x0, 1041]
	ldrb	w3, [x0, 1025]
	ldr	w2, [x0, 1008]
	ldrb	w1, [x0, 993]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 40]
	ldrb	w4, [x0, 1049]
	ldrb	w3, [x0, 1033]
	ldr	w2, [x0, 1016]
	ldrb	w1, [x0, 1001]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 44]
	ldrb	w4, [x0, 1042]
	ldrb	w3, [x0, 1010]
	ldr	w2, [x0, 1024]
	ldrb	w1, [x0, 994]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 48]
	ldrb	w4, [x0, 1050]
	ldrb	w3, [x0, 1018]
	ldr	w2, [x0, 1032]
	ldrb	w1, [x0, 1002]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 52]
	ldrb	w4, [x0, 1027]
	ldrb	w3, [x0, 1011]
	ldr	w1, [x0, 1040]
	ldrb	w2, [x0, 995]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 56]
	ldrb	w3, [x0, 1035]
	ldrb	w2, [x0, 1019]
	ldr	w4, [x0, 1048]
	ldrb	w1, [x0, 1003]
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
	ldrb	w5, [x0, 1388]
	ldr	w3, [x0, 1396]
	ldr	w4, [x0, 1380]
	ldrb	w2, [x1, 604]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19]
	ldrb	w5, [x0, 1420]
	ldr	w3, [x0, 1428]
	ldr	w4, [x0, 1412]
	ldrb	w2, [x0, 1404]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19, 4]
	ldrb	w5, [x0, 1397]
	ldrb	w4, [x0, 1389]
	ldr	w3, [x0, 1380]
	ldrb	w2, [x1, 605]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 8]
	ldrb	w5, [x0, 1429]
	ldrb	w4, [x0, 1421]
	ldr	w3, [x0, 1412]
	ldrb	w2, [x0, 1405]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 12]
	ldrb	w5, [x0, 1398]
	ldrb	w4, [x0, 1382]
	ldr	w3, [x0, 1388]
	ldrb	w2, [x1, 606]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 16]
	ldrb	w5, [x0, 1430]
	ldrb	w4, [x0, 1414]
	ldr	w3, [x0, 1420]
	ldrb	w2, [x0, 1406]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 20]
	ldrb	w4, [x0, 1391]
	ldrb	w3, [x0, 1383]
	ldr	w5, [x0, 1396]
	ldrb	w2, [x1, 607]
	lsl	w3, w3, 8
	and	w1, w5, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 24]
	ldrb	w4, [x0, 1423]
	ldrb	w3, [x0, 1415]
	ldr	w1, [x0, 1428]
	ldrb	w2, [x0, 1407]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 28]
	ldrb	w4, [x0, 1392]
	ldr	w2, [x0, 1400]
	ldr	w3, [x0, 1384]
	ldrb	w1, [x0, 1376]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 32]
	ldrb	w4, [x0, 1424]
	ldr	w2, [x0, 1432]
	ldr	w3, [x0, 1416]
	ldrb	w1, [x0, 1408]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 36]
	ldrb	w4, [x0, 1401]
	ldrb	w3, [x0, 1393]
	ldr	w2, [x0, 1384]
	ldrb	w1, [x0, 1377]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 40]
	ldrb	w4, [x0, 1433]
	ldrb	w3, [x0, 1425]
	ldr	w2, [x0, 1416]
	ldrb	w1, [x0, 1409]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 44]
	ldrb	w4, [x0, 1402]
	ldrb	w3, [x0, 1386]
	ldr	w2, [x0, 1392]
	ldrb	w1, [x0, 1378]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 48]
	ldrb	w4, [x0, 1434]
	ldrb	w3, [x0, 1418]
	ldr	w2, [x0, 1424]
	ldrb	w1, [x0, 1410]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 52]
	ldrb	w4, [x0, 1395]
	ldrb	w3, [x0, 1387]
	ldr	w1, [x0, 1400]
	ldrb	w2, [x0, 1379]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 56]
	ldrb	w3, [x0, 1427]
	ldrb	w2, [x0, 1419]
	ldr	w4, [x0, 1432]
	ldrb	w1, [x0, 1411]
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
	ldr	x3, [x20, 2440]
	ldrb	w0, [x3, 13]
	cbz	w0, .L436
	ldp	w6, w11, [x3, 68]
	ldr	x0, [x20, 2432]
	mov	w1, 0
	subs	w8, w11, #1
	ldrb	w7, [x3, 15]
	sub	w12, w6, #1
	ldr	w4, [x0, 64]
	ldr	w5, [x0, 128]
	bmi	.L408
	.p2align 2
.L439:
	sxtw	x0, w1
	add	x9, x29, 224
	add	w1, w1, 1
	add	x2, x3, x0, lsl 1
	add	x0, x9, x0, lsl 2
	cmp	w11, w1
	ldrsh	w2, [x2, 212]
	sub	w2, w2, #1
	str	w2, [x0, -172]
	bne	.L439
.L408:
	mov	w1, 0
	tbnz	w12, #31, .L406
	.p2align 2
.L438:
	sxtw	x0, w1
	add	x9, x29, 224
	add	w1, w1, 1
	add	x2, x3, x0, lsl 1
	add	x0, x9, x0, lsl 2
	cmp	w6, w1
	ldrsh	w2, [x2, 172]
	sub	w2, w2, #1
	str	w2, [x0, -84]
	bne	.L438
.L406:
	mov	w1, 1
	lsl	w0, w1, w5
	sdiv	w5, w4, w0
	msub	w0, w5, w0, w4
	cmp	w0, wzr
	csinc	w5, w5, w5, eq
	sdiv	w9, w19, w5
	msub	w5, w9, w5, w19
	cbz	w7, .L451
	tbnz	w8, #31, .L448
	mov	w14, 0
	mov	w13, 0
	mov	w4, 0
	mov	w7, 0
	mov	w8, 0
	mov	w0, 0
	.p2align 2
.L420:
	tbnz	w12, #31, .L431
	add	x0, x29, 224
	mov	w7, w4
	add	x0, x0, x13, sxtw 2
	mov	w1, 0
	mov	w2, 0
	ldr	w8, [x0, -172]
	add	w8, w8, 1
	add	w10, w14, w8
	b	.L417
	.p2align 3
.L429:
	mov	w7, w4
.L417:
	add	x0, x29, 224
	add	x0, x0, x2, sxtw 2
	add	w2, w2, 1
	ldr	w0, [x0, -84]
	add	w0, w0, 1
	add	w3, w0, w1
	cmp	w5, w3
	madd	w4, w0, w8, w4
	bge	.L415
	cmp	w9, w10
	blt	.L423
.L415:
	cmp	w6, w2
	mov	w1, w3
	bne	.L429
.L421:
	add	w1, w0, w3
	cmp	w5, w1
	bge	.L430
	cmp	w9, w10
	blt	.L446
.L430:
	add	w13, w13, 1
	mov	w14, w10
	cmp	w11, w13
	bne	.L420
.L447:
	sub	w9, w9, w10
	mov	w1, w3
	mul	w0, w9, w0
	.p2align 2
.L413:
	sub	w19, w5, w1
	add	w0, w19, w0
	add	w19, w0, w7
.L436:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 224
	ret
.L451:
	tbnz	w8, #31, .L448
	mov	w14, 0
	mov	w13, 0
	mov	w4, 0
	mov	w7, 0
	mov	w8, 0
	mov	w0, 0
	tbnz	w12, #31, .L434
	.p2align 2
.L452:
	add	x0, x29, 224
	mov	w7, w4
	add	x3, x0, x13, sxtw 2
	mov	w1, 0
	mov	w2, 0
	ldr	w8, [x3, -172]
	add	w8, w8, 1
	add	w10, w14, w8
	b	.L424
	.p2align 3
.L432:
	mov	w7, w4
.L424:
	add	x0, x29, 224
	add	x0, x0, x2, sxtw 2
	add	w2, w2, 1
	ldr	w0, [x0, -84]
	add	w0, w0, 1
	add	w3, w0, w1
	cmp	w5, w3
	madd	w4, w0, w8, w4
	bge	.L422
	cmp	w9, w10
	blt	.L423
.L422:
	cmp	w6, w2
	mov	w1, w3
	bne	.L432
.L428:
	add	w1, w0, w3
	cmp	w5, w1
	bge	.L433
	cmp	w9, w10
	blt	.L446
.L433:
	add	w13, w13, 1
	mov	w14, w10
	cmp	w11, w13
	beq	.L447
	tbz	w12, #31, .L452
.L434:
	mov	w3, 0
	add	w10, w14, w8
	b	.L428
	.p2align 3
.L423:
	sub	w9, w9, w14
	mul	w0, w9, w0
	b	.L413
.L431:
	mov	w3, 0
	add	w10, w14, w8
	b	.L421
.L448:
	mov	w0, 0
	mov	w1, 0
	mov	w7, 0
	b	.L413
.L446:
	sub	w9, w9, w14
	mov	w1, w3
	mul	w0, w9, w0
	b	.L413
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
	ldr	x3, [x20, 2440]
	ldrb	w0, [x3, 13]
	cbz	w0, .L471
	ldp	w8, w4, [x3, 68]
	ldr	x0, [x20, 2432]
	subs	w13, w4, #1
	sub	w12, w8, #1
	ldr	w5, [x0, 64]
	ldr	w6, [x0, 128]
	bmi	.L455
	mov	w1, 0
	.p2align 2
.L456:
	sxtw	x0, w1
	add	x7, x29, 224
	add	w1, w1, 1
	add	x2, x3, x0, lsl 1
	add	x0, x7, x0, lsl 2
	cmp	w4, w1
	ldrsh	w2, [x2, 212]
	sub	w2, w2, #1
	str	w2, [x0, -172]
	bne	.L456
	tbnz	w12, #31, .L488
.L458:
	mov	w1, 0
	.p2align 2
.L461:
	sxtw	x0, w1
	add	x4, x29, 224
	add	w1, w1, 1
	add	x2, x3, x0, lsl 1
	add	x0, x4, x0, lsl 2
	cmp	w12, w1
	ldrsh	w2, [x2, 172]
	sub	w2, w2, #1
	str	w2, [x0, -84]
	bge	.L461
	mov	w1, 1
	lsl	w0, w1, w6
	sdiv	w1, w5, w0
	msub	w0, w1, w0, w5
	cmp	w0, wzr
	csinc	w0, w1, w1, eq
	tbnz	w13, #31, .L459
.L460:
	ldr	w11, [x29, 140]
	mov	w10, 0
	mov	w9, 0
	mov	w4, 0
	mov	w1, 0
	mov	w7, 0
	mov	w2, 0
	add	w11, w11, 1
	.p2align 2
.L467:
	tbnz	w12, #31, .L473
	add	x1, x29, 224
	add	x1, x1, x9, sxtw 2
	ldr	w7, [x1, -172]
	add	w7, w7, 1
	madd	w5, w11, w7, w4
	cmp	w19, w5
	blt	.L474
	mov	w1, w4
	mov	w2, w11
	mov	w6, 0
	mov	w3, 0
	mov	w4, w5
	b	.L464
	.p2align 3
.L465:
	ldr	w2, [x5, -84]
	mov	w1, w4
	add	w2, w2, 1
	madd	w5, w2, w7, w4
	cmp	w5, w19
	bgt	.L466
	mov	w4, w5
.L464:
	add	w3, w3, 1
	add	x5, x29, 224
	cmp	w8, w3
	add	w6, w6, w2
	add	x5, x5, x3, sxtw 2
	bne	.L465
.L468:
	cmp	w4, w19
	bgt	.L472
	add	w9, w9, 1
	add	w10, w10, w7
	cmp	w13, w9
	bge	.L467
.L472:
	mov	w4, w1
	.p2align 2
.L466:
	cbz	w2, .L459
	sub	w4, w19, w4
	sdiv	w1, w4, w2
	add	w10, w1, w10
	msub	w4, w1, w2, w4
	add	w6, w4, w6
	madd	w0, w10, w0, w6
.L483:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 224
	ret
.L471:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 224
	ret
.L473:
	mov	w6, 0
	b	.L468
.L474:
	mov	w2, w11
	mov	w6, 0
	b	.L466
.L488:
	mov	w0, 1
	lsl	w0, w0, w6
	sdiv	w1, w5, w0
	msub	w0, w1, w0, w5
	cmp	w0, wzr
	csinc	w0, w1, w1, eq
	b	.L460
.L455:
	tbz	w12, #31, .L458
.L459:
	ldr	x2, .LC90
	mov	w1, 8240
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L483
	.size	HEVC_CtbTsAddrToRsAddr, .-HEVC_CtbTsAddrToRsAddr
	.align	3
.LC90:
	.xword	.LC89
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
	ldr	x21, .LC91
	ldr	x20, .LC92
	mov	x2, 262144
	mov	w1, 0
	ldr	x3, [x21, 96]
	mov	x0, x20
	blr	x3
	ldr	x0, .LC93
	mov	x2, 65536
	ldr	x3, [x21, 96]
	mov	w1, 0
	add	x0, x0, 1024
	blr	x3
	add	x0, x19, 8192
	ldr	x3, [x21, 96]
	mov	x2, 880
	mov	w1, 0
	add	x0, x0, 3236
	blr	x3
	str	wzr, [x19, 11424]
	ldr	x1, [x19, 2440]
	ldr	x2, [x19, 2432]
	ldr	w0, [x1, 72]
	ldr	w10, [x2, 188]
	cbz	w0, .L489
	mov	w15, 0
	mov	w17, 0
	mov	w4, 0
.L498:
	ldr	w0, [x1, 68]
	uxtw	x16, w15
	cbz	w0, .L499
	add	x9, x16, 104
	ldr	w0, [x19, 11424]
	mul	w14, w17, w10
	mov	w12, 0
	mov	w13, 0
	lsl	x9, x9, 1
.L497:
	uxtw	x2, w0
	add	x3, x1, x9
	uxtw	x11, w12
	add	x5, x19, x2, lsl 3
	str	w4, [x5, 11428]
	ldrsh	w3, [x3, 4]
	cbz	w3, .L493
	add	x5, x11, 80
	add	w8, w13, w14
	mov	w7, 0
	lsl	x5, x5, 1
	.p2align 2
.L495:
	add	x2, x1, x5
	mov	w0, w4
	sub	w6, w8, w4
	ldrsh	w2, [x2, 12]
	cbz	w2, .L496
	.p2align 2
.L503:
	add	w1, w6, w0
	str	w1, [x20, w0, sxtw 2]
	add	w0, w0, 1
	ldr	x1, [x19, 2440]
	sub	w2, w0, w4
	add	x3, x1, x5
	ldrsh	w3, [x3, 12]
	cmp	w3, w2
	bhi	.L503
	mov	w4, w0
.L496:
	add	x0, x1, x9
	add	w7, w7, 1
	add	w8, w8, w10
	ldrsh	w0, [x0, 4]
	cmp	w0, w7
	bhi	.L495
	ldr	w0, [x19, 11424]
	uxtw	x2, w0
.L493:
	add	x2, x19, x2, lsl 3
	sub	w3, w4, #1
	add	w0, w0, 1
	add	x11, x1, x11, lsl 1
	add	w12, w12, 1
	str	w3, [x2, 11432]
	str	w0, [x19, 11424]
	ldr	w3, [x1, 68]
	ldrsh	w2, [x11, 172]
	cmp	w3, w12
	add	w13, w13, w2
	bhi	.L497
.L499:
	add	x16, x1, x16, lsl 1
	ldr	w0, [x1, 72]
	add	w15, w15, 1
	cmp	w0, w15
	ldrsh	w0, [x16, 212]
	add	w17, w17, w0
	bhi	.L498
.L489:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_CalcTileMap, .-HEVC_CalcTileMap
	.align	3
.LC91:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC92:
	.xword	.LANCHOR1
	.align	3
.LC93:
	.xword	.LANCHOR2
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
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 8192
	bl	_mcount
	ldr	w4, [x19, 6436]
	mov	w1, 8308
	ldr	w3, [x19, 6560]
	mov	w0, 3
	ldr	x2, .LC95
	bl	dprint_normal
	ldr	x2, .LC97
	mov	w1, 8309
	mov	w0, 5
	bl	dprint_normal
	ldr	w21, [x19, 6408]
	ldr	w6, [x19, 6844]
	ldr	w5, [x19, 6848]
	str	w6, [x19, 10268]
	str	w5, [x19, 10272]
	ldr	w4, [x19, 6884]
	ldr	w0, [x19, 6872]
	ldr	w5, [x19, 6436]
	ldr	w6, [x19, 6560]
	ldr	w2, [x19, 6880]
	str	w6, [x19, 10260]
	str	w5, [x19, 10264]
	sub	w2, w2, w0
	ldr	w1, [x19, 6888]
	sub	w0, w4, w0
	ldr	w6, [x19, 6852]
	ldr	w5, [x19, 6856]
	ldr	x3, [x19, 2432]
	str	w6, [x19, 10280]
	str	w5, [x19, 10284]
	ldr	w6, [x19, 6860]
	ldr	x5, [x19, 2472]
	str	w21, [x19, 9004]
	uxtw	x21, w21
	str	w2, [x19, 10276]
	lsl	x22, x21, 2
	str	w0, [x19, 10292]
	sub	w0, w1, w4
	str	w6, [x19, 10288]
	sub	x22, x22, x21
	str	x5, [x19, 11344]
	mov	x2, 64
	str	wzr, [x19, 200]
	add	x22, x21, x22, lsl 3
	str	w0, [x19, 10296]
	lsl	x22, x22, 3
	ldrb	w0, [x3, 10]
	strb	w0, [x20, 785]
	add	x0, x20, 908
	ldrb	w1, [x3, 3]
	strb	w1, [x20, 786]
	ldrb	w1, [x3, 7]
	strb	w1, [x20, 787]
	ldrb	w1, [x3, 6]
	strb	w1, [x20, 788]
	ldrb	w1, [x3, 5]
	strb	w1, [x20, 789]
	ldr	w1, [x3, 60]
	str	w1, [x19, 8984]
	ldr	w1, [x3, 104]
	strb	w1, [x20, 796]
	ldr	w1, [x3, 192]
	ldr	x4, [x19, 2440]
	sub	w1, w1, #1
	str	w1, [x19, 8992]
	ldr	w5, [x19, 6412]
	ldr	w1, [x3, 188]
	str	w5, [x19, 9000]
	sub	w1, w1, #1
	str	w1, [x19, 8996]
	ldr	w1, [x4, 84]
	sub	w1, w1, #2
	str	w1, [x19, 9008]
	ldrb	w1, [x4, 11]
	strb	w1, [x20, 820]
	add	x1, x22, 12288
	add	x1, x19, x1
	ldrb	w4, [x4, 10]
	add	x1, x1, 3184
	strb	w4, [x20, 821]
	ldr	w4, [x3, 164]
	str	w4, [x19, 9016]
	ldr	w4, [x3, 168]
	str	w4, [x19, 9020]
	ldr	w4, [x3, 156]
	str	w4, [x19, 9024]
	ldr	w4, [x3, 160]
	str	w4, [x19, 9028]
	ldr	w4, [x3, 148]
	str	w4, [x19, 9032]
	ldr	w4, [x3, 152]
	str	w4, [x19, 9036]
	ldr	w4, [x3, 172]
	str	w4, [x19, 9040]
	ldr	x4, .LC98
	ldr	w5, [x3, 124]
	str	w5, [x19, 9044]
	ldr	x4, [x4, 104]
	ldr	w5, [x3, 128]
	str	w5, [x19, 9048]
	ldr	w5, [x3, 100]
	str	w5, [x19, 9052]
	ldr	w5, [x3, 92]
	str	w5, [x19, 9056]
	ldr	w5, [x3, 112]
	str	w5, [x19, 9060]
	ldr	w5, [x3, 108]
	str	w5, [x19, 9064]
	ldr	w5, [x3, 96]
	str	w5, [x19, 9068]
	ldr	w3, [x3, 88]
	str	w3, [x19, 9072]
	blr	x4
	ldr	x4, [x19, 2432]
	add	x3, x20, 2988
	add	x2, x20, 2908
	add	x1, x20, 2396
	mov	x0, x19
	ldr	w5, [x4, 68]
	str	w5, [x19, 9164]
	ldr	w4, [x4, 64]
	str	w4, [x19, 9168]
	bl	HEVC_CalcTileInfo
	cbnz	w0, .L529
	ldr	x1, [x19, 2440]
	mov	w0, 0
	ldrb	w2, [x1, 16]
	strb	w2, [x20, 1000]
	ldrb	w2, [x1, 7]
	strb	w2, [x20, 1001]
	ldrb	w2, [x1, 3]
	strb	w2, [x20, 1002]
	ldrb	w2, [x1, 14]
	strb	w2, [x20, 1003]
	ldrb	w2, [x1, 15]
	strb	w2, [x20, 1004]
	ldrb	w2, [x1, 13]
	strb	w2, [x20, 1005]
	ldr	x2, [x19, 2432]
	ldr	w3, [x1, 56]
	ldr	w2, [x2, 128]
	sub	w2, w2, w3
	str	w2, [x19, 9200]
	ldr	w2, [x1, 52]
	str	w2, [x19, 9204]
	ldrb	w2, [x1, 8]
	strb	w2, [x20, 1016]
	ldrb	w2, [x1, 12]
	strb	w2, [x20, 1017]
	ldrb	w2, [x1, 6]
	strb	w2, [x20, 1018]
	ldr	w2, [x1, 60]
	str	w2, [x19, 9212]
	ldr	w2, [x1, 64]
	str	w2, [x19, 9216]
	ldr	w2, [x1, 72]
	sub	w2, w2, #1
	str	w2, [x19, 9220]
	ldr	w2, [x1, 68]
	sub	w2, w2, #1
	str	w2, [x19, 9224]
	ldrb	w2, [x1, 10]
	strb	w2, [x20, 821]
	ldrb	w1, [x1, 11]
	strb	w1, [x20, 820]
	str	wzr, [x19, 2356]
	ldr	w1, [x19, 2340]
	cmp	w1, 1
	beq	.L511
	ldr	x1, [x19, 6464]
	ldr	w0, [x19, 248]
	ldr	w1, [x1, 24]
	bl	FSP_GetLogicFs
	mov	x23, x0
	cbz	x0, .L530
	ldr	x3, [x0, 24]
	ldr	x4, [x0, 40]
	cbz	x3, .L514
	cbz	x4, .L514
	ldr	w0, [x19, 248]
	add	x2, x20, 2120
	add	x1, x20, 2248
	add	x22, x19, x22
	bl	FSP_GetDecFsAddrTab
	ldr	w0, [x23, 200]
	add	x1, x20, 2380
	str	w0, [x19, 10580]
	add	x2, x20, 2252
	ldr	w0, [x19, 248]
	ldr	x3, [x23, 24]
	ldr	w3, [x3, 16]
	str	w3, [x19, 10584]
	ldr	x3, [x23, 24]
	ldr	w3, [x3, 36]
	str	w3, [x19, 10260]
	bl	FSP_GetPmvAddrTab
	ldr	w0, [x19, 6436]
	mov	w1, 0
	str	w0, [x19, 10264]
	ldr	x0, [x23, 40]
	ldr	w0, [x0, 16]
	str	w0, [x19, 10576]
	ldr	x0, [x23, 24]
	ldr	w0, [x0, 4]
	str	w0, [x19, 11416]
	ldr	x0, [x23, 24]
	ldr	w0, [x0, 72]
	str	w0, [x19, 11420]
	ldrb	w0, [x23, 424]
	strb	w0, [x20, 784]
	ldr	w4, [x22, 15336]
	str	w4, [x19, 11332]
	cbz	w4, .L519
	lsl	x3, x21, 3
	sub	x3, x3, x21
	add	x21, x21, x3, lsl 3
	sub	x3, x21, x3
	.p2align 2
.L523:
	sxtw	x0, w1
	add	w1, w1, 1
	add	x2, x3, x0
	cmp	w1, w4
	add	x0, x19, x0, lsl 2
	add	x2, x19, x2, lsl 2
	ldr	w2, [x2, 15408]
	str	w2, [x0, 11268]
	bne	.L523
.L519:
	add	x22, x20, 1040
	mov	w21, 0
.L517:
	mov	x2, x22
	mov	w0, w21
	mov	x1, x19
	add	w21, w21, 1
	add	x22, x22, 64
	bl	HEVC_WriteQmatrix_8x8
	cmp	w21, 4
	bne	.L517
	mov	w0, w21
	add	x2, x20, 1296
	mov	x1, x19
	add	x22, x20, 1552
	mov	w21, 2
	bl	HEVC_WriteQmatrix_8x8
	add	x2, x20, 1360
	mov	x1, x19
	mov	w0, 5
	bl	HEVC_WriteQmatrix_8x8
	add	x2, x20, 1424
	mov	x1, x19
	mov	w0, 0
	bl	HEVC_WriteQmatrix_16x16
	add	x2, x20, 1488
	mov	x1, x19
	mov	w0, 1
	bl	HEVC_WriteQmatrix_16x16
.L520:
	mov	x2, x22
	mov	w0, w21
	mov	x1, x19
	add	w21, w21, 1
	add	x22, x22, 64
	bl	HEVC_WriteQmatrix_16x16
	cmp	w21, 6
	bne	.L520
	add	x2, x20, 1808
	mov	x1, x19
	mov	w0, 0
	add	x22, x20, 1936
	mov	w21, 0
	bl	HEVC_WriteQmatrix_32x32
	add	x2, x20, 1872
	mov	x1, x19
	mov	w0, 1
	bl	HEVC_WriteQmatrix_32x32
	.p2align 2
.L521:
	mov	x2, x22
	mov	w0, w21
	mov	x1, x19
	add	w21, w21, 1
	add	x22, x22, 16
	bl	HEVC_WriteQmatrix_4x4
	cmp	w21, 6
	bne	.L521
	add	x0, x19, 2048
	add	x8, x19, 2304
	ldp	w5, w6, [x0, 244]
	ldp	w3, w4, [x8, 4]
	ldp	w7, w2, [x0, 236]
	ldp	w0, w1, [x8, -4]
	lsl	w3, w3, 16
	lsl	w5, w5, 16
	orr	w3, w3, w4, lsl 24
	orr	w5, w5, w6, lsl 24
	orr	w0, w0, w1, lsl 8
	orr	w2, w7, w2, lsl 8
	orr	w0, w3, w0
	ldr	w4, [x19, 6436]
	orr	w1, w5, w2
	str	w0, [x19, 10228]
	str	w1, [x19, 10224]
	mov	w0, 0
	str	w4, [x19, 10256]
.L511:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L529:
	ldr	x3, .LC99
	mov	w1, 8367
	ldr	x2, .LC101
	mov	w0, 1
	add	x3, x3, 264
	bl	dprint_normal
	mov	w0, -1
	b	.L511
.L514:
	ldr	x2, .LC105
	mov	w1, 8411
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L511
.L530:
	ldr	x3, [x19, 6464]
	mov	w1, 8405
	ldr	x2, .LC103
	mov	w0, 1
	ldr	w3, [x3, 24]
	bl	dprint_normal
	mov	w0, -1
	b	.L511
	.size	HEVC_WritePicMsg, .-HEVC_WritePicMsg
	.align	3
.LC95:
	.xword	.LC94
	.align	3
.LC97:
	.xword	.LC96
	.align	3
.LC98:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC99:
	.xword	.LANCHOR0
	.align	3
.LC101:
	.xword	.LC100
	.align	3
.LC103:
	.xword	.LC102
	.align	3
.LC105:
	.xword	.LC104
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
	add	x0, x0, 2912
	ldrb	w1, [x0, 1]
	cbz	w1, .L533
	ldrsb	w1, [x19, 11]
	add	x0, x19, 12288
	add	x0, x0, 1692
	cbz	w1, .L565
.L533:
	ldp	w5, w6, [x0, 68]
	cmp	w5, 16
	bhi	.L566
	cmp	w6, 16
	bhi	.L537
	cbz	w5, .L538
	ldr	x0, [x19, 2488]
	cbz	x0, .L551
	ldr	x0, [x0, 16]
	cbz	x0, .L567
	add	x0, x19, 2496
	mov	w3, 0
	b	.L543
	.p2align 3
.L544:
	ldr	x1, [x0]
	add	x0, x0, 8
	cbz	x1, .L539
	ldr	x1, [x1, 16]
	cbz	x1, .L540
.L543:
	add	w3, w3, 1
	cmp	w5, w3
	bne	.L544
.L538:
	cbz	w6, .L553
	ldr	x0, [x19, 2624]
	cbz	x0, .L554
	ldr	x0, [x0, 16]
	cbz	x0, .L568
	add	x0, x19, 2632
	mov	w3, 0
	b	.L549
	.p2align 3
.L550:
	ldr	x1, [x0]
	add	x0, x0, 8
	cbz	x1, .L545
	ldr	x1, [x1, 16]
	cbz	x1, .L546
.L549:
	add	w3, w3, 1
	cmp	w6, w3
	bne	.L550
.L553:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L551:
	mov	w3, 0
	.p2align 2
.L539:
	ldr	x2, .LC116
	mov	w1, 8544
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
.L535:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L567:
	mov	w3, 0
.L540:
	ldr	x2, .LC118
	mov	w1, 8550
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L554:
	mov	w3, 0
.L545:
	ldr	x2, .LC120
	mov	w1, 8559
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L568:
	mov	w3, 0
.L546:
	ldr	x2, .LC122
	mov	w1, 8565
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L565:
	ldr	x3, .LC108
	mov	w1, 8518
	ldr	x2, .LC110
	mov	w0, 0
	add	x3, x3, 288
	bl	dprint_normal
	mov	w0, -1
	b	.L535
.L537:
	ldr	x2, .LC114
	mov	w4, 17
	mov	w3, w6
	mov	w1, 8536
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L535
.L566:
	ldr	x2, .LC112
	mov	w4, 17
	mov	w3, w5
	mov	w1, 8530
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L535
	.size	HEVC_CheckListX, .-HEVC_CheckListX
	.align	3
.LC108:
	.xword	.LANCHOR0
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
	.align	3
.LC120:
	.xword	.LC119
	.align	3
.LC122:
	.xword	.LC121
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_WriteSliceMsg
	.type	HEVC_WriteSliceMsg, %function
HEVC_WriteSliceMsg:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	ldr	w24, [x19, 6408]
	bl	HEVC_CheckListX
	mov	w23, w0
	cbnz	w0, .L611
	ldr	w4, [x19, 156]
	ldr	w3, [x19, 200]
	cmp	w3, w4
	bcs	.L647
	mov	w22, 1368
	ldr	x21, .LC125
	ldr	x20, [x19, 2472]
	mov	x2, 1368
	umull	x3, w3, w22
	ldr	x4, [x21, 96]
	mov	w1, 0
	add	x20, x20, x3
	mov	x0, x20
	blr	x4
	ldr	x3, [x21, 96]
	mov	w1, 0
	mov	x2, 64
	add	x0, x29, 80
	blr	x3
	ldr	w0, [x19, 200]
	ldr	w1, [x19, 156]
	add	w0, w0, 1
	str	w0, [x19, 200]
	cmp	w0, w1
	bcc	.L648
	str	xzr, [x20, 1360]
.L573:
	ldr	w22, [x19, 180]
	ldr	w0, [x19, 232]
	ldr	w1, [x19, 7044]
	add	w22, w22, 1
	ldr	x3, [x19, 2408]
	add	w0, w0, 1
	str	w22, [x19, 180]
	str	w1, [x19, 204]
	str	w0, [x19, 232]
	ldrb	w1, [x3]
	ldr	w0, [x3, 8]
	cmp	w1, 1
	ccmp	w1, w0, 2, ls
	bcs	.L574
	.p2align 2
.L575:
	uxtw	x0, w1
	lsl	x2, x0, 5
	add	x3, x3, x2
	add	x0, x20, x0, lsl 2
	ldr	w3, [x3, 60]
	str	w3, [x0, 8]
	ldr	x3, [x19, 2408]
	add	x3, x3, x2
	ldr	w3, [x3, 56]
	str	w3, [x20, w1, uxtw 2]
	add	w1, w1, 1
	ldr	x3, [x19, 2408]
	add	x2, x3, x2
	ldr	w2, [x2, 64]
	str	w2, [x0, 16]
	ldr	x3, [x19, 2408]
	ldr	w0, [x3, 8]
	cmp	w0, w1
	ccmp	w1, 1, 2, hi
	bls	.L575
.L574:
	cmp	w0, 1
	bhi	.L580
	.p2align 2
.L632:
	add	x1, x20, x0, uxtw 2
	str	wzr, [x1, 8]
	str	wzr, [x20, w0, uxtw 2]
	add	w0, w0, 1
	cmp	w0, 2
	str	wzr, [x1, 16]
	bne	.L632
.L580:
	add	x26, x19, 4096
	add	x25, x19, 12288
	ldrb	w0, [x26, 2913]
	cbz	w0, .L649
.L578:
	ldr	w0, [x19, 14048]
	cbz	w0, .L581
	mov	w1, 0
	.p2align 2
.L582:
	uxtw	x0, w1
	add	x5, x29, 144
	add	w1, w1, 1
	add	x2, x19, x0, lsl 3
	add	x0, x20, x0, lsl 2
	ldr	x3, [x2, 2488]
	ldr	w3, [x3, 4]
	str	w3, [x0, 116]
	ldr	x4, [x2, 2488]
	ldr	x2, [x4, 16]
	ldp	w3, w2, [x2, 16]
	add	x3, x19, x3, lsl 2
	add	x2, x5, x2, lsl 2
	ldr	w3, [x3, 10444]
	str	w3, [x2, -64]
	ldr	x2, [x4, 16]
	ldr	w2, [x2, 20]
	str	w2, [x0, 372]
	ldr	w0, [x19, 14048]
	cmp	w0, w1
	bhi	.L582
	ldr	w3, [x19, 14052]
	cbz	w3, .L583
.L610:
	mov	w1, 0
	.p2align 2
.L584:
	uxtw	x0, w1
	add	x5, x29, 144
	add	w1, w1, 1
	add	x2, x19, x0, lsl 3
	add	x0, x20, x0, lsl 2
	ldr	x3, [x2, 2624]
	ldr	w3, [x3, 4]
	str	w3, [x0, 180]
	ldr	x4, [x2, 2624]
	ldr	x2, [x4, 16]
	ldp	w3, w2, [x2, 16]
	add	x3, x19, x3, lsl 2
	add	x2, x5, x2, lsl 2
	ldr	w3, [x3, 10444]
	str	w3, [x2, -64]
	ldr	x2, [x4, 16]
	ldr	w2, [x2, 20]
	str	w2, [x0, 436]
	ldr	w3, [x19, 14052]
	cmp	w3, w1
	bhi	.L584
	ldr	w0, [x19, 14048]
.L583:
	cbz	w0, .L585
	uxtw	x1, w24
	ldr	w2, [x20, 372]
	lsl	x4, x1, 3
	ldr	w5, [x19, 6412]
	sub	x4, x4, x1
	lsl	x6, x4, 3
	sub	x4, x6, x4
	add	x4, x4, x1
	add	x1, x4, x2
	add	x1, x19, x1, lsl 2
	ldr	w1, [x1, 15472]
	cmp	w5, w1
	blt	.L617
	sub	w0, w0, #1
	mov	x1, x20
	add	x2, x20, x0, lsl 2
	b	.L588
	.p2align 3
.L589:
	ldr	w0, [x1, 376]
	add	x1, x1, 4
	add	x0, x4, x0
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 15472]
	cmp	w0, w5
	bgt	.L617
.L588:
	cmp	x2, x1
	bne	.L589
.L585:
	ldr	w0, [x19, 14000]
	cbnz	w0, .L646
	mov	w0, 1
	cbz	w3, .L586
	uxtw	x1, w24
	ldr	w0, [x20, 436]
	lsl	x2, x1, 3
	ldr	w4, [x19, 6412]
	sub	x2, x2, x1
	lsl	x5, x2, 3
	sub	x2, x5, x2
	add	x1, x2, x1
	add	x0, x1, x0
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 15472]
	cmp	w4, w0
	blt	.L617
	sub	w3, w3, #1
	mov	x2, x20
	add	x3, x20, x3, lsl 2
	b	.L591
	.p2align 3
.L592:
	ldr	w0, [x2, 440]
	add	x2, x2, 4
	add	x0, x1, x0
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 15472]
	cmp	w0, w4
	bgt	.L617
.L591:
	cmp	x2, x3
	bne	.L592
.L646:
	mov	w0, 1
.L586:
	strb	w0, [x20, 24]
	ldrb	w0, [x26, 2913]
	strb	w0, [x20, 25]
	ldr	w0, [x19, 13996]
	str	w0, [x20, 28]
	ldrb	w0, [x25, 1699]
	strb	w0, [x20, 32]
	ldr	w0, [x19, 14020]
	str	w0, [x20, 36]
	ldr	w0, [x19, 14000]
	cbz	w0, .L650
	cmp	w0, 1
	mov	w24, 0
	beq	.L594
.L595:
	str	w24, [x20, 40]
	ldr	w0, [x19, 14024]
	str	w0, [x20, 48]
	ldrb	w0, [x25, 1700]
	strb	w0, [x20, 52]
	ldr	w0, [x19, 14028]
	str	w0, [x20, 44]
	ldr	w0, [x19, 14056]
	cbz	w0, .L596
	sub	w0, w0, #1
	str	w0, [x20, 60]
.L597:
	ldr	w0, [x19, 14060]
	cbz	w0, .L598
	sub	w0, w0, #1
	str	w0, [x20, 56]
.L599:
	ldrb	w0, [x25, 1696]
	strb	w0, [x20, 64]
	ldrb	w0, [x25, 1698]
	strb	w0, [x20, 65]
	ldr	w0, [x19, 14048]
	str	w0, [x20, 68]
	ldr	w0, [x19, 14052]
	str	w0, [x20, 72]
	ldr	w0, [x19, 14000]
	str	w0, [x20, 76]
	ldr	w0, [x19, 7048]
	str	w0, [x20, 80]
	ldr	x0, [x19, 2432]
	ldr	w3, [x19, 7048]
	ldr	w1, [x0, 188]
	mov	x0, x19
	udiv	w2, w3, w1
	msub	w1, w2, w1, w3
	str	w1, [x20, 84]
	ldr	x2, [x19, 2432]
	ldr	w1, [x19, 7048]
	ldr	w2, [x2, 188]
	udiv	w1, w1, w2
	str	w1, [x20, 88]
	ldr	w1, [x19, 7048]
	bl	HEVC_CtbRsAddrToTsAddr
	str	w0, [x20, 92]
	ldr	w0, [x19, 14032]
	str	w0, [x20, 96]
	ldr	w0, [x19, 14036]
	str	w0, [x20, 100]
	ldr	w0, [x19, 14044]
	str	w0, [x20, 104]
	ldr	w0, [x19, 14040]
	str	w0, [x20, 108]
	ldrb	w0, [x25, 1695]
	strb	w0, [x20, 112]
	ldrb	w0, [x25, 1694]
	strb	w0, [x20, 113]
	ldrb	w0, [x25, 1701]
	strb	w0, [x20, 114]
	ldrb	w0, [x25, 1702]
	strb	w0, [x20, 115]
	ldr	x0, [x19, 2440]
	ldrb	w1, [x0, 10]
	cbz	w1, .L600
	ldr	w1, [x19, 14000]
	cmp	w1, 1
	beq	.L601
.L600:
	ldrb	w0, [x0, 11]
	cmp	w0, 1
	beq	.L651
.L603:
	ldrb	w0, [x25, 1696]
	cbz	w0, .L605
	add	x0, x29, 144
	add	x24, x0, x24, sxtw 2
	ldr	w0, [x24, -64]
	str	w0, [x20, 564]
.L606:
	ldr	w0, [x19, 2340]
	cbnz	w0, .L607
	ldr	x0, [x19, 2448]
	ldr	x1, [x19, 2408]
	str	x1, [x0, w22, uxtw 3]
	str	xzr, [x19, 2408]
.L607:
	add	x0, x19, 8192
	ldrb	w0, [x0, 1005]
	cbz	w0, .L625
	ldr	w0, [x19, 232]
	cmp	w0, 1
	beq	.L652
	sub	w1, w0, #2
	ldr	w2, [x20, 92]
	sub	w0, w0, #1
	add	x1, x19, x1, lsl 3
	sub	w2, w2, #1
	add	x3, x19, x0, lsl 3
	str	w2, [x1, 12312]
	ldr	w1, [x20, 92]
	str	w1, [x3, 12308]
.L609:
	ldr	w1, [x19, 8992]
	add	x0, x19, x0, lsl 3
	ldr	w2, [x19, 8996]
	mov	w3, 65535
	madd	w2, w1, w2, w2
	add	w1, w2, w1
	str	w1, [x0, 12312]
	ldr	w1, [x20, 92]
	sub	w1, w1, #1
	cmp	w1, w3
	bhi	.L625
	mov	x0, x19
	bl	HEVC_CtbTsAddrToRsAddr
	str	w0, [x20, 568]
.L625:
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L648:
	ldr	x1, [x19, 2472]
	umull	x0, w0, w22
	add	x0, x1, x0
	str	x0, [x20, 1360]
	b	.L573
	.p2align 3
.L617:
	mov	w0, 0
	b	.L586
	.p2align 3
.L598:
	str	wzr, [x20, 56]
	b	.L599
	.p2align 3
.L605:
	ldr	w0, [x19, 11416]
	str	w0, [x20, 564]
	b	.L606
	.p2align 3
.L596:
	str	wzr, [x20, 60]
	b	.L597
	.p2align 3
.L650:
	ldrb	w0, [x25, 1700]
	cbnz	w0, .L594
	ldrsw	x0, [x19, 14024]
	add	x0, x20, x0, lsl 2
	ldr	w24, [x0, 436]
	b	.L595
	.p2align 3
.L594:
	ldrsw	x0, [x19, 14024]
	add	x0, x20, x0, lsl 2
	ldr	w24, [x0, 372]
	b	.L595
	.p2align 3
.L649:
	ldr	x3, [x21, 104]
	mov	x2, 1356
	add	x1, x26, 2912
	add	x0, x25, 1692
	blr	x3
	mov	w0, 1
	strb	w0, [x19, 11]
	b	.L578
	.p2align 3
.L651:
	ldr	w0, [x19, 14000]
	cbnz	w0, .L603
.L601:
	ldr	w0, [x19, 14136]
	mov	x2, 64
	str	w0, [x20, 580]
	add	x1, x25, 1984
	ldr	x3, [x21, 104]
	ldr	w0, [x19, 14268]
	str	w0, [x20, 584]
	add	x0, x20, 588
	blr	x3
	ldr	x3, [x21, 104]
	mov	x2, 64
	add	x1, x25, 1852
	add	x0, x20, 716
	blr	x3
	ldr	x3, [x21, 104]
	mov	x2, 128
	add	x1, x25, 2048
	add	x0, x20, 844
	blr	x3
	ldr	x3, [x21, 104]
	mov	x2, 128
	add	x1, x25, 2176
	add	x0, x20, 1100
	blr	x3
	ldr	w0, [x19, 14000]
	cbnz	w0, .L603
	ldr	x3, [x21, 104]
	add	x1, x25, 2304
	mov	x2, 64
	add	x0, x20, 652
	blr	x3
	ldr	x3, [x21, 104]
	add	x1, x25, 1916
	mov	x2, 64
	add	x0, x20, 780
	blr	x3
	ldr	x3, [x21, 104]
	add	x1, x25, 2368
	mov	x2, 128
	add	x0, x20, 972
	blr	x3
	ldr	x3, [x21, 104]
	mov	x2, 128
	add	x1, x25, 2496
	add	x0, x20, 1228
	blr	x3
	b	.L603
	.p2align 3
.L652:
	ldr	w1, [x20, 92]
	mov	x0, 0
	str	w1, [x19, 12308]
	b	.L609
.L581:
	ldr	w0, [x19, 14052]
	cbnz	w0, .L610
	mov	w0, 1
	b	.L586
.L611:
	mov	w23, -1
	b	.L625
.L647:
	ldr	x2, .LC124
	mov	w1, 8594
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L625
	.size	HEVC_WriteSliceMsg, .-HEVC_WriteSliceMsg
	.align	3
.LC124:
	.xword	.LC123
	.align	3
.LC125:
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
	ldr	w1, [x19, 6428]
	ldr	w0, [x19, 200]
	ldr	w2, [x19, 6432]
	cmp	w1, wzr
	str	w0, [x19, 11336]
	cset	w1, eq
	str	w2, [x19, 10300]
	mov	w0, 0
	str	w1, [x19, 10308]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_CfgVDMReg, .-HEVC_CfgVDMReg
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
	ldr	x1, [x20, 2424]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	cmp	w1, w0
	beq	.L659
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L659:
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
	mov	w21, 120
	mov	x20, -120
	bl	_mcount
	strb	wzr, [x22, 2]
	ldr	x3, .LC126
	mov	x1, x22
	ldr	w0, [x19, 160]
	mov	x2, 120
	ldr	x4, [x19, 2376]
	ldr	x3, [x3, 104]
	smaddl	x0, w0, w21, x20
	add	x0, x4, x0
	blr	x3
	ldr	w0, [x19, 160]
	ldr	x1, [x19, 2376]
	smaddl	x0, w0, w21, x20
	add	x0, x1, x0
	str	x0, [x19, 2424]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_UpdatePicVPS, .-HEVC_UpdatePicVPS
	.align	3
.LC126:
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
	ldr	x1, [x20, 2432]
	ldr	w0, [x19, 56]
	ldr	w1, [x1, 56]
	cmp	w1, w0
	beq	.L664
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L664:
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
	mov	w21, 12644
	mov	x20, -12644
	bl	_mcount
	strb	wzr, [x22]
	ldr	x3, .LC127
	mov	x1, x22
	ldr	w0, [x19, 164]
	mov	x2, 12644
	ldr	x4, [x19, 2384]
	ldr	x3, [x3, 104]
	smaddl	x0, w0, w21, x20
	add	x0, x4, x0
	blr	x3
	ldr	w0, [x19, 164]
	ldr	x1, [x19, 2384]
	smaddl	x0, w0, w21, x20
	add	x0, x1, x0
	str	x0, [x19, 2432]
	ldr	w1, [x0, 56]
	str	w1, [x19, 260]
	ldr	w1, [x0, 64]
	str	w1, [x19, 264]
	ldr	w1, [x0, 68]
	str	w1, [x19, 268]
	ldr	w1, [x0, 128]
	str	w1, [x19, 272]
	ldr	w1, [x0, 88]
	str	w1, [x19, 276]
	ldr	w0, [x0, 96]
	str	w0, [x19, 280]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_UpdatePicSPS, .-HEVC_UpdatePicSPS
	.align	3
.LC127:
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
	ldr	x1, [x20, 2440]
	ldr	w0, [x19, 28]
	ldr	w1, [x1, 28]
	cmp	w1, w0
	beq	.L669
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L669:
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
	cbz	w0, .L671
	ldrb	w0, [x19, 15]
	cbnz	w0, .L691
	ldr	w0, [x19, 68]
	ldr	w2, [x21, 188]
	sub	w3, w0, #1
	add	x1, x19, x0, sxtw 1
	cmp	w3, wzr
	strh	w2, [x1, 170]
	ble	.L683
	sub	w4, w0, #2
	add	x0, x19, 88
	add	x4, x4, 45
	add	x4, x19, x4, lsl 1
	.p2align 2
.L682:
	ldrsh	w3, [x0]
	add	x0, x0, 2
	strh	w3, [x0, 82]
	cmp	x0, x4
	ldrh	w2, [x1, 170]
	sub	w2, w2, w3
	strh	w2, [x1, 170]
	bne	.L682
.L683:
	ldr	w0, [x19, 72]
	ldr	w1, [x21, 192]
	sub	w2, w0, #1
	add	x3, x19, x0, sxtw 1
	cmp	w2, wzr
	strh	w1, [x3, 210]
	ble	.L678
	sub	w4, w0, #2
	add	x0, x19, 128
	add	x4, x4, 65
	add	x4, x19, x4, lsl 1
	.p2align 2
.L684:
	ldrsh	w2, [x0]
	add	x0, x0, 2
	strh	w2, [x0, 82]
	cmp	x4, x0
	ldrh	w1, [x3, 210]
	sub	w1, w1, w2
	strh	w1, [x3, 210]
	bne	.L684
	b	.L678
	.p2align 3
.L671:
	ldr	w0, [x21, 188]
	strh	w0, [x19, 172]
	ldr	w0, [x21, 192]
	strh	w0, [x19, 212]
.L678:
	ldr	w0, [x20, 168]
	mov	w22, 1888
	ldr	x1, .LC128
	mov	x21, -1888
	ldr	x4, [x20, 2392]
	mov	x2, 1888
	smaddl	x0, w0, w22, x21
	ldr	x3, [x1, 104]
	mov	x1, x19
	add	x0, x4, x0
	blr	x3
	ldr	w0, [x20, 168]
	ldr	x1, [x20, 2392]
	smaddl	x0, w0, w22, x21
	add	x0, x1, x0
	str	x0, [x20, 2440]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L691:
	ldr	w4, [x19, 68]
	add	x1, x19, 172
	mov	w3, 0
	cmp	w4, wzr
	ble	.L677
	.p2align 2
.L686:
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
	bne	.L686
.L677:
	ldr	w4, [x19, 72]
	add	x1, x19, 212
	mov	w3, 0
	cmp	w4, wzr
	ble	.L678
	.p2align 2
.L685:
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
	bne	.L685
	b	.L678
	.size	HEVC_UpdatePicPPS, .-HEVC_UpdatePicPPS
	.align	3
.LC128:
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
	add	x3, x19, 4096
	mov	w2, 1
	mov	w1, -1
	ldr	x0, .LC129
	strb	w2, [x3, 2305]
	str	w1, [x19, 6432]
	ldr	w4, [x19, 7036]
	ldr	x1, [x19, 2432]
	ldr	w2, [x19, 7020]
	str	w4, [x19, 6404]
	str	w2, [x19, 6412]
	ldrsw	x4, [x19, 248]
	ldr	w5, [x1, 64]
	str	w5, [x19, 6420]
	ldr	x0, [x0, x4, lsl 3]
	ldr	w4, [x1, 68]
	add	x0, x0, 217088
	str	w4, [x19, 6424]
	str	wzr, [x19, 6428]
	ldrsb	w4, [x0, 3072]
	cmp	w4, 1
	beq	.L703
.L693:
	ldr	w0, [x19, 2340]
	cbnz	w0, .L696
	ldr	x0, [x19, 2464]
	mov	x1, -1
	ldr	x2, [x0, 32]
	str	x2, [x19, 6680]
	ldr	x2, [x0, 48]
	str	x2, [x19, 6688]
	ldr	x2, [x0, 64]
	str	x2, [x19, 6696]
	ldr	w2, [x0, 80]
	str	w2, [x19, 6472]
	ldr	w2, [x0, 84]
	str	w2, [x19, 6476]
	ldr	w2, [x0, 88]
	str	w2, [x19, 6480]
	ldr	w2, [x0, 104]
	str	w2, [x19, 6484]
	ldrb	w2, [x0, 28]
	strb	w2, [x3, 2900]
	str	x1, [x0, 32]
	ldr	x1, [x19, 2432]
.L696:
	ldr	w2, [x1, 64]
	add	x0, x3, 2376
	str	w2, [x19, 6504]
	ldr	w2, [x1, 68]
	str	w2, [x19, 6508]
	str	wzr, [x19, 6492]
	ldr	w5, [x1, 60]
	ldr	w4, [x1, 2072]
	ldrb	w2, [x3, 2532]
	cmp	w5, 1
	bfi	w2, w4, 5, 3
	cset	w4, ne
	bfi	w2, w4, 2, 3
	strb	w2, [x3, 2532]
	ldr	w1, [x1, 2056]
	and	w1, w1, 7
	bl	SetAspectRatio
	ldr	w0, [x19, 2340]
	cmp	w0, 1
	beq	.L692
	ldr	x0, [x19, 6464]
	ldr	w1, [x19, 7020]
	str	w1, [x0, 4]
	ldr	x0, [x19, 6464]
	ldr	w1, [x19, 6628]
	str	w1, [x0, 236]
	ldr	x0, [x19, 6464]
	ldr	w1, [x19, 6492]
	str	w1, [x0, 100]
	ldr	x0, [x19, 6464]
	ldr	w1, [x19, 6532]
	str	w1, [x0, 140]
	ldr	x0, [x19, 6464]
	ldr	w1, [x19, 6528]
	str	w1, [x0, 136]
	ldr	x0, [x19, 6464]
	ldr	w1, [x19, 6504]
	str	w1, [x0, 112]
	ldr	x0, [x19, 6464]
	ldr	w1, [x19, 6508]
	str	w1, [x0, 116]
	ldr	x0, [x19, 2432]
	ldr	w1, [x0, 72]
	str	w1, [x19, 6592]
	ldr	w3, [x0, 76]
	str	w3, [x19, 6596]
	ldr	w6, [x0, 80]
	str	w6, [x19, 6600]
	ldr	w5, [x0, 84]
	str	w5, [x19, 6604]
	ldr	w2, [x0, 64]
	sub	w1, w2, w1
	sub	w1, w1, w3
	str	w1, [x19, 6512]
	ldr	w3, [x0, 68]
	ldr	x4, [x19, 6464]
	sub	w2, w3, w6
	sub	w2, w2, w5
	str	w2, [x19, 6516]
	ldr	w2, [x0, 88]
	str	w2, [x19, 6864]
	ldr	w0, [x0, 96]
	str	w0, [x19, 6868]
	ldr	w0, [x4, 128]
	str	w0, [x19, 6520]
	ldr	w0, [x4, 132]
	str	w0, [x19, 6524]
	str	w1, [x4, 120]
	ldr	x0, [x19, 6464]
	ldr	w1, [x19, 6516]
	str	w1, [x0, 124]
	ldr	x0, [x19, 6464]
	ldr	w1, [x19, 6520]
	str	w1, [x0, 128]
	ldr	x0, [x19, 6464]
	ldr	w1, [x19, 6524]
	str	w1, [x0, 132]
	ldr	x0, [x19, 6464]
	ldr	w1, [x19, 6864]
	str	w1, [x0, 472]
	ldr	x0, [x19, 6464]
	ldr	w1, [x19, 6868]
	str	w1, [x0, 476]
	ldr	w0, [x19, 7028]
	cmp	w0, 2
	add	x0, x19, 24576
	beq	.L698
	ldr	w1, [x0, 3280]
.L699:
	ldr	x2, [x19, 6464]
	str	w1, [x2, 608]
	ldr	x1, [x19, 6464]
	ldr	w2, [x0, 3284]
	str	w2, [x1, 612]
	str	wzr, [x0, 3288]
	str	wzr, [x0, 3292]
	str	wzr, [x19, 6416]
.L692:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L703:
	ldr	w4, [x0, 3188]
	cmp	w4, 1
	bne	.L693
	ldr	w0, [x0, 3192]
	cmp	w0, 2
	bne	.L693
	add	x0, x19, 12288
	ldrb	w0, [x0, 1632]
	cmp	w0, 1
	bne	.L693
	ldr	x4, [x19, 13952]
	ldr	x0, [x19, 13968]
	cmp	x4, x0
	bls	.L694
	sub	x5, x4, x0
	cmp	x5, 16
	bls	.L694
.L695:
	ldr	w4, [x19, 256]
	sub	w2, w2, w4
	add	x0, x0, x2, sxtw
	str	x0, [x19, 13952]
	b	.L693
	.p2align 3
.L698:
	ldr	w1, [x0, 3288]
	ldr	w2, [x0, 3292]
	str	w1, [x0, 3280]
	str	w2, [x0, 3284]
	b	.L699
.L694:
	cmp	x4, x0
	bcs	.L693
	sub	x4, x0, x4
	cmp	x4, 16
	bls	.L693
	b	.L695
	.size	HEVC_InitPicInfo, .-HEVC_InitPicInfo
	.align	3
.LC129:
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
	mov	x25, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x25, 7028]
	cmp	w4, 1
	beq	.L706
	cmp	w4, 2
	beq	.L722
	cbz	w4, .L721
	ldr	x3, .LC130
	mov	w1, 9440
	ldr	x2, .LC132
	mov	w0, 1
	add	x3, x3, 304
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
.L709:
	ldr	x0, [x25, 2464]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L717
	mov	w0, 1
	str	w0, [x27]
	ldr	x0, [x25, 6464]
	add	x0, x0, 56
	str	x0, [x28, -8]
	.p2align 2
.L717:
	add	w26, w26, 1
	add	x27, x27, 4
	cmp	w26, w23
	add	x28, x28, 136
	bcc	.L719
.L722:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, 0
	ldp	x29, x30, [sp], 112
	ret
.L721:
	mov	w23, 2
.L708:
	ldr	x21, .LC130
	add	x27, x25, 4096
	add	x27, x27, 2980
	add	x28, x25, 2496
	add	x0, x21, 304
	mov	w26, 0
	str	x0, [x29, 104]
	.p2align 2
.L719:
	ldr	w1, [x27]
	cbz	w1, .L709
	ldr	x2, [x28, -8]
	cbnz	x2, .L723
	mov	x3, x28
	mov	w0, 0
	b	.L711
	.p2align 3
.L713:
	ldr	x24, [x3], 8
	cbnz	x24, .L728
.L711:
	add	w0, w0, 1
	cmp	w1, w0
	bne	.L713
	mov	w20, -1
.L712:
	ldr	x0, [x25, 2464]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L714
	ldr	x24, [x25, 6464]
	add	x24, x24, 56
.L710:
	mov	x0, x2
	uxtw	x22, w26
	mov	w19, 0
	lsl	x21, x22, 4
	cbz	x0, .L729
	.p2align 2
.L715:
	add	w19, w19, 1
	add	x0, x21, x22
	cmp	w1, w19
	add	x0, x0, x19, uxtw
	bls	.L717
	add	x0, x25, x0, lsl 3
	ldr	x0, [x0, 2488]
	cbnz	x0, .L715
.L729:
	ldr	x2, .LC136
	mov	w1, 9477
	ldr	x3, [x29, 104]
	mov	w5, w19
	mov	w6, w20
	mov	w4, w26
	mov	w0, 1
	bl	dprint_normal
	add	x0, x21, x22
	add	x0, x0, x19, uxtw
	add	x0, x25, x0, lsl 3
	str	x24, [x0, 2488]
	ldr	w1, [x27]
	b	.L715
	.p2align 3
.L728:
	sxtb	w20, w0
	cmn	w20, #1
	ccmp	x24, xzr, 4, ne
	bne	.L710
	b	.L712
	.p2align 3
.L723:
	mov	x24, x2
	mov	w20, 0
	b	.L710
.L706:
	mov	w23, w4
	b	.L708
.L714:
	ldr	x3, .LC130
	mov	w4, w26
	ldr	x2, .LC134
	mov	w1, 9468
	add	x3, x3, 304
	mov	w0, 1
	bl	dprint_normal
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
.LC130:
	.xword	.LANCHOR0
	.align	3
.LC132:
	.xword	.LC131
	.align	3
.LC134:
	.xword	.LC133
	.align	3
.LC136:
	.xword	.LC135
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
	cbz	x19, .L766
	ldr	x20, .LC138
	add	x21, x29, 48
	mov	x2, 272
	mov	w1, 0
	mov	x0, x21
	ldr	x3, [x20, 96]
	blr	x3
	ldr	w0, [x19, 2816]
	cbz	w0, .L767
	sub	w3, w0, #1
	mov	w5, 0
	add	x3, x3, 371
	add	x0, x19, 2960
	add	x3, x19, x3, lsl 3
	b	.L734
	.p2align 3
.L733:
	cmp	x0, x3
	beq	.L732
.L734:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 1]
	cmp	w2, 1
	bne	.L733
	ldr	w2, [x1, 60]
	cbnz	w2, .L733
	ldr	w2, [x1, 64]
	cmp	w2, 1
	bne	.L733
	add	x2, x29, 320
	add	x1, x1, 56
	add	x2, x2, x5, uxtw 3
	cmp	x0, x3
	sub	x2, x2, #4096
	add	w5, w5, 1
	str	x1, [x2, 3824]
	bne	.L734
	.p2align 2
.L732:
	ldr	w0, [x19, 2820]
	cbz	w0, .L768
	sub	w3, w0, #1
	mov	w4, w5
	add	x3, x3, 388
	add	x0, x19, 3096
	add	x3, x19, x3, lsl 3
	b	.L737
	.p2align 3
.L736:
	cmp	x0, x3
	beq	.L795
.L737:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 1]
	cmp	w2, 1
	bne	.L736
	ldr	w2, [x1, 60]
	cbnz	w2, .L736
	ldr	w2, [x1, 64]
	cmp	w2, 1
	bne	.L736
	add	x2, x29, 320
	add	x1, x1, 56
	add	x2, x2, x4, uxtw 3
	cmp	x0, x3
	sub	x2, x2, #4096
	add	w4, w4, 1
	str	x1, [x2, 3824]
	bne	.L737
	.p2align 2
.L795:
	sub	w6, w4, w5
.L735:
	ldr	w0, [x19, 2812]
	sub	w8, w4, #1
	cbz	w0, .L738
	sub	w2, w0, #1
	add	x0, x19, 3232
	add	x2, x2, 405
	add	x2, x19, x2, lsl 3
	b	.L740
	.p2align 3
.L739:
	cmp	x2, x0
	beq	.L796
.L740:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w3, [x1, 1]
	cmp	w3, 1
	bne	.L739
	ldr	w3, [x1, 60]
	cmp	w3, 1
	bne	.L739
	ldr	w7, [x1, 64]
	add	x3, x29, 320
	add	x3, x3, x4, uxtw 3
	add	x1, x1, 56
	sub	x3, x3, #4096
	cbnz	w7, .L739
	str	x1, [x3, 3824]
	cmp	x2, x0
	add	w4, w4, 1
	bne	.L740
	.p2align 2
.L796:
	sub	w0, w4, w5
	sub	w0, w0, w6
.L738:
	cbz	w4, .L797
	ldr	w7, [x19, 7028]
	cbnz	w7, .L798
	cbz	w6, .L746
	add	x3, x21, 136
	add	w9, w6, w5
	mov	w1, w5
	.p2align 2
.L747:
	add	x2, x29, 320
	add	x2, x2, x1, uxtw 3
	add	w1, w1, 1
	sub	x2, x2, #4096
	cmp	w9, w1
	ldr	x2, [x2, 3824]
	str	x2, [x3], 8
	bne	.L747
.L746:
	cbz	w5, .L748
	mov	x1, 0
	.p2align 2
.L749:
	add	w2, w6, w1
	add	x9, x29, 320
	ldr	x3, [x21, x1, lsl 3]
	add	x1, x1, 1
	add	x2, x9, x2, lsl 3
	cmp	w5, w1
	str	x3, [x2, -136]
	bhi	.L749
	add	w6, w6, w5
.L748:
	cbz	w0, .L750
	add	w1, w0, w6
	mov	w2, w6
	.p2align 2
.L751:
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
	bne	.L751
.L750:
	ldr	w5, [x19, 7084]
	ldr	w8, [x19, 7088]
	str	w5, [x19, 7076]
	str	w8, [x19, 7080]
	cbnz	w5, .L744
	.p2align 2
.L764:
	cbz	w8, .L756
	add	x0, x19, 8192
	add	x3, x19, 2624
	add	x2, x0, 44
	mov	w1, 0
	ldrb	w6, [x0, -87]
	.p2align 2
.L759:
	cbz	w6, .L757
	ldr	w0, [x2]
.L758:
	add	x7, x29, 320
	add	w1, w1, 1
	add	x0, x7, x0, uxtw 3
	cmp	w1, w8
	add	x2, x2, 4
	ldr	x0, [x0, -136]
	str	x0, [x3], 8
	bne	.L759
	mov	w0, w5
.L755:
	cmp	w0, 16
	bhi	.L769
	.p2align 2
.L761:
	add	x1, x19, x0, uxtw 3
	ldr	x2, [x19, 2488]
	add	w0, w0, 1
	cmp	w0, 16
	str	x2, [x1, 2488]
	bls	.L761
.L769:
	cmp	w8, 16
	mov	w0, w8
	bhi	.L762
	.p2align 2
.L763:
	add	x1, x19, x0, uxtw 3
	ldr	x2, [x19, 2624]
	add	w0, w0, 1
	cmp	w0, 17
	str	x2, [x1, 2624]
	bne	.L763
.L762:
	mov	w0, 0
.L792:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 320
	ret
	.p2align 3
.L798:
	ldr	w5, [x19, 7084]
	ldr	w8, [x19, 7088]
	str	w5, [x19, 7076]
	str	w8, [x19, 7080]
	cbz	w5, .L799
.L744:
	add	x1, x19, 8192
	add	x2, x19, 4096
	add	x3, x19, 2488
	add	x2, x2, 4012
	mov	w0, 0
	ldrb	w6, [x1, -88]
	.p2align 2
.L754:
	cbz	w6, .L752
	ldr	w1, [x2]
.L753:
	add	x9, x29, 320
	add	w0, w0, 1
	add	x1, x9, x1, uxtw 3
	cmp	w0, w5
	sub	x1, x1, #4096
	add	x2, x2, 4
	ldr	x1, [x1, 3824]
	str	x1, [x3], 8
	bne	.L754
	cbnz	w7, .L755
	b	.L764
	.p2align 3
.L752:
	udiv	w1, w0, w4
	msub	w1, w1, w4, w0
	b	.L753
	.p2align 3
.L757:
	udiv	w0, w1, w4
	msub	w0, w0, w4, w1
	b	.L758
	.p2align 3
.L797:
	ldr	x3, [x20, 96]
	mov	x2, 272
	mov	w1, 0
	add	x0, x19, 2488
	str	wzr, [x19, 7076]
	str	wzr, [x19, 7080]
	blr	x3
	ldr	x0, [x19, 2464]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L762
	ldr	x1, [x19, 6464]
	mov	w2, 1
	mov	w0, 0
	str	w2, [x19, 7076]
	add	x1, x1, 56
	str	x1, [x19, 2488]
	b	.L792
.L756:
	ldr	x3, [x20, 104]
	mov	x2, 136
	add	x1, x19, 2488
	add	x0, x19, 2624
	blr	x3
	ldr	w8, [x19, 7076]
	str	w8, [x19, 7080]
	mov	w0, w8
	b	.L755
.L767:
	mov	w5, 0
	b	.L732
.L768:
	mov	w4, w5
	mov	w6, 0
	b	.L735
.L799:
	mov	w0, 0
	b	.L761
.L766:
	mov	w0, -1
	b	.L792
	.size	HEVC_InitListX, .-HEVC_InitListX
	.align	3
.LC138:
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
	ldr	w0, [x19, 7028]
	cmp	w0, 2
	beq	.L806
	mov	x0, x19
	bl	HEVC_InitListX
	cbnz	w0, .L807
	mov	x0, x19
	bl	HEVC_RepairList
	mov	w1, 0
	cbnz	w0, .L808
.L802:
	mov	w0, w1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L806:
	str	wzr, [x19, 7076]
	mov	w1, 0
	str	wzr, [x19, 7080]
	mov	w0, w1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L807:
	ldr	x2, .LC140
	mov	w1, 9510
	mov	w0, 1
	bl	dprint_normal
	mov	w1, -1
	b	.L802
.L808:
	ldr	x2, .LC142
	mov	w1, 9518
	mov	w0, 1
	bl	dprint_normal
	mov	w1, -1
	b	.L802
	.size	HEVC_DecList, .-HEVC_DecList
	.align	3
.LC140:
	.xword	.LC139
	.align	3
.LC142:
	.xword	.LC141
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ArrangeMem
	.type	HEVC_ArrangeMem, %function
HEVC_ArrangeMem:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x22, 2432]
	mov	x2, 36
	ldr	x1, .LC143
	ldr	w21, [x22, 2800]
	ldp	w4, w3, [x0, 64]
	ldr	w20, [x0, 72]
	ldr	w19, [x0, 80]
	ldp	w24, w5, [x0, 188]
	ldr	x6, [x1, 96]
	sub	w4, w4, w20
	ldr	w23, [x0, 128]
	sub	w3, w3, w19
	ldr	w20, [x0, 76]
	mov	w1, 0
	ldr	w19, [x0, 84]
	add	x0, x29, 72
	sub	w20, w4, w20
	lsl	w24, w24, w23
	sub	w19, w3, w19
	lsl	w23, w5, w23
	blr	x6
	ldr	x4, [x22, 2464]
	mov	w5, 1
	stp	w20, w19, [x29, 88]
	ldr	w0, [x22, 248]
	add	x1, x29, 72
	ldr	w3, [x4, 16]
	mov	w2, 0
	ldr	w6, [x4, 892]
	cmp	w3, 24
	mov	w3, 16
	str	w3, [x29, 72]
	add	w3, w21, w5
	csel	w21, w21, w5, ne
	str	w21, [x29, 96]
	strb	w6, [x29, 77]
	ldr	w4, [x4, 16]
	stp	w24, w23, [x29, 80]
	cmp	w4, 24
	csel	w3, w3, w5, ne
	str	w3, [x29, 100]
	bl	FSP_ArrangeFsPool
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.size	HEVC_ArrangeMem, .-HEVC_ArrangeMem
	.align	3
.LC143:
	.xword	vfmw_Osal_Func_Ptr_S
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
	ldr	x2, [x0, 2824]
	ldr	w5, [x2, 28]
	cbnz	w5, .L817
	ldr	w0, [x2, 20]
	cmp	w0, 15
	bhi	.L814
	add	x0, x19, x0, uxtw 2
	mov	w1, 16
	str	wzr, [x0, 15344]
	str	wzr, [x0, 15408]
	str	wzr, [x0, 15472]
	ldr	w0, [x2, 16]
	add	x0, x19, x0, lsl 2
	str	wzr, [x0, 2140]
	str	w1, [x2, 20]
	ldr	w0, [x19, 15340]
	sub	w0, w0, #1
	str	w0, [x19, 15340]
.L814:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L817:
	ldr	x3, .LC144
	mov	w4, w20
	ldr	x2, .LC146
	mov	w1, 10119
	add	x3, x3, 320
	mov	w0, 1
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_RemoveApcStore, .-HEVC_RemoveApcStore
	.align	3
.LC144:
	.xword	.LANCHOR0
	.align	3
.LC146:
	.xword	.LC145
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
	ldr	w1, [x20, 2804]
	cbnz	w1, .L823
	b	.L818
	.p2align 3
.L820:
	add	w19, w19, 1
	cmp	w1, w19
	bls	.L818
.L823:
	add	x0, x20, x19, sxtw 3
	ldr	x0, [x0, 2824]
	ldrb	w0, [x0, 1]
	cbnz	w0, .L820
	mov	w1, w19
	mov	x0, x20
	add	w19, w19, 1
	bl	HEVC_RemoveApcStore
	ldr	w1, [x20, 2804]
	cmp	w1, w19
	bhi	.L823
.L818:
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
	ldr	w2, [x23, 7044]
	mov	w5, 1888
	ldr	x1, [x23, 2392]
	mov	w4, 12644
	ldr	x0, [x23, 2384]
	ldr	w3, [x23, 2804]
	smaddl	x1, w2, w5, x1
	ldr	w1, [x1, 32]
	smaddl	x0, w1, w4, x0
	ldr	w0, [x0, 116]
	lsl	w0, w21, w0
	cbz	w3, .L825
	add	x19, x23, 8192
	mov	w22, w21
	sub	w26, w0, #1
	b	.L856
	.p2align 3
.L828:
	add	w24, w24, 1
	cmp	w3, w24
	bls	.L825
.L856:
	add	x25, x23, x24, sxtw 3
	ldr	w0, [x23, 7040]
	ldr	x1, [x25, 2824]
	ldr	w2, [x1, 28]
	cmp	w2, w0
	bne	.L828
	ldp	w3, w0, [x19, -252]
	ldr	w2, [x19, -244]
	add	w0, w3, w0
	cmp	w0, w2
	mov	w20, w0
	bcs	.L866
	ldr	w2, [x1, 4]
	mov	w4, 0
	.p2align 2
.L836:
	add	x0, x23, x20, sxtw 2
	ldr	w3, [x0, 7096]
	cbz	w3, .L831
	ldr	w3, [x1, 60]
	cbz	w3, .L832
	ldr	w3, [x0, 8040]
	cmp	w3, w2
	beq	.L867
.L832:
	cbnz	w4, .L864
	ldrb	w3, [x1, 1]
	mov	w4, w2
	ldr	w0, [x0, 8040]
	cmp	w3, wzr
	ccmp	w4, w0, 0, ne
	beq	.L868
.L847:
	mov	w3, w2
	mov	w4, 0
.L835:
	ldr	w0, [x19, -244]
	add	w20, w20, 1
	mov	w2, w3
	cmp	w0, w20
	bhi	.L836
	ldp	w2, w0, [x19, -252]
	add	w0, w2, w0
.L830:
	ldr	w5, [x23, 7020]
	cbz	w0, .L838
	mov	w20, 0
	.p2align 2
.L840:
	ldr	w0, [x1, 60]
	add	x2, x19, x20, sxtw 2
	add	w20, w20, 1
	cbnz	w0, .L839
	ldr	w0, [x2, -220]
	add	w0, w5, w0
	cmp	w0, w3
	beq	.L869
.L839:
	ldp	w2, w0, [x19, -252]
	add	w0, w2, w0
	cmp	w0, w20
	bhi	.L840
.L838:
	cmp	w4, wzr
	ccmp	w3, w5, 4, eq
	beq	.L865
	strb	wzr, [x1, 1]
	ldr	x0, [x25, 2824]
	str	wzr, [x0, 60]
	ldr	x0, [x25, 2824]
	ldr	w1, [x0, 48]
	cmp	w1, 1
	beq	.L865
	ldr	w1, [x0, 24]
	mov	w2, 0
	ldr	w0, [x23, 248]
	bl	FSP_SetRef
.L865:
	ldr	w3, [x23, 2804]
	add	w24, w24, 1
	cmp	w3, w24
	bhi	.L856
.L825:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L867:
	strb	w22, [x1, 1]
	mov	w2, 1
	ldr	x0, [x25, 2824]
	str	w21, [x0, 44]
	ldr	x0, [x25, 2824]
	ldr	w1, [x0, 24]
	ldr	w0, [x23, 248]
	bl	FSP_SetRef
.L833:
	ldr	x1, [x25, 2824]
	mov	w4, 1
	ldr	w3, [x1, 4]
	b	.L835
	.p2align 3
.L831:
	ldr	w3, [x1, 60]
	cbz	w3, .L834
	ldr	w3, [x0, 8040]
	eor	w3, w2, w3
	tst	w3, w26
	beq	.L870
.L834:
	cbnz	w4, .L864
	ldr	w0, [x0, 8040]
	and	w4, w26, w2
	ldrb	w3, [x1, 1]
	and	w0, w26, w0
	cmp	w3, wzr
	ccmp	w4, w0, 0, ne
	bne	.L847
.L868:
	strb	w22, [x1, 1]
	mov	w2, 1
	ldr	x0, [x25, 2824]
	str	w21, [x0, 60]
	ldr	x0, [x25, 2824]
	str	w21, [x0, 44]
	ldr	x0, [x25, 2824]
	ldr	w1, [x0, 24]
	ldr	w0, [x23, 248]
	bl	FSP_SetRef
	ldr	x1, [x25, 2824]
	mov	w4, 1
	ldr	w3, [x1, 4]
	b	.L835
	.p2align 3
.L870:
	strb	w22, [x1, 1]
	mov	w2, 1
	ldr	x0, [x25, 2824]
	str	w21, [x0, 44]
	ldr	x1, [x25, 2824]
	ldr	w0, [x23, 248]
	ldr	w1, [x1, 24]
	bl	FSP_SetRef
	b	.L833
	.p2align 3
.L864:
	mov	w3, w2
	b	.L835
	.p2align 3
.L869:
	strb	w22, [x1, 1]
	mov	w2, 1
	ldr	x0, [x25, 2824]
	str	w21, [x0, 44]
	ldr	x1, [x25, 2824]
	ldr	w0, [x23, 248]
	ldr	w1, [x1, 24]
	bl	FSP_SetRef
	ldr	x1, [x25, 2824]
	mov	w4, 1
	ldr	w5, [x23, 7020]
	ldr	w3, [x1, 4]
	b	.L839
.L866:
	mov	w4, 0
	ldr	w3, [x1, 4]
	b	.L830
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
	ldr	w0, [x19, 7036]
	sub	w0, w0, #19
	cmp	w0, 2
	bls	.L873
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_CheckThatAllRefPicsAreAvailable.part.7
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L873:
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
	ldr	x0, [x19, 2464]
	ldr	w0, [x0, 632]
	add	w0, w0, 2047
	cmp	w0, 4095
	bls	.L875
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_SetFrmRepeatCount.part.8
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L875:
	str	wzr, [x20, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_SetFrmRepeatCount, .-HEVC_SetFrmRepeatCount
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
	add	x24, x20, 8192
	mov	w22, 0
	bl	_mcount
	mov	w21, 0
	ldr	w1, [x24, -252]
	cbz	w1, .L878
	sub	x23, x24, #252
	mov	w26, 1
	mov	w25, 1
	.p2align 2
.L883:
	uxtw	x0, w21
	add	x1, x23, x0
	ldrb	w1, [x1, 12]
	cbz	w1, .L879
	add	x0, x0, 8
	ldr	w5, [x20, 2804]
	ldr	w4, [x20, 7020]
	ldr	w0, [x23, x0, lsl 2]
	add	w4, w4, w0
	cbz	w5, .L879
	add	x1, x20, 2824
	mov	w0, 0
	b	.L882
	.p2align 3
.L880:
	add	w0, w0, 1
	cmp	w0, w5
	beq	.L879
.L882:
	ldr	x2, [x1]
	add	x1, x1, 8
	ldr	w3, [x2, 4]
	cmp	w4, w3
	bne	.L880
	ldr	w3, [x2, 28]
	ldr	w6, [x20, 7040]
	cmp	w6, w3
	bne	.L880
	add	x19, x20, x0, uxtw 3
	strb	w26, [x2, 1]
	ldr	x0, [x19, 2824]
	ldrb	w1, [x0, 1]
	cbnz	w1, .L925
.L881:
	str	w25, [x0, 64]
	add	x0, x20, x22, uxtw 3
	add	w22, w22, 1
	ldr	x1, [x19, 2824]
	str	wzr, [x1, 60]
	ldr	x1, [x19, 2824]
	str	x1, [x0, 2960]
	.p2align 2
.L879:
	ldr	w1, [x23]
	add	w21, w21, 1
	cmp	w1, w21
	bhi	.L883
.L878:
	ldr	w0, [x20, 2800]
	str	w22, [x20, 2816]
	cmp	w0, w22
	bls	.L888
	.p2align 2
.L912:
	add	x2, x20, x22, uxtw 3
	add	w22, w22, 1
	cmp	w22, w0
	str	xzr, [x2, 2960]
	bne	.L912
.L888:
	ldr	w25, [x24, -248]
	mov	w22, 0
	add	w25, w1, w25
	cmp	w25, w21
	bls	.L886
	sub	x23, x24, #252
	mov	w26, 1
	mov	w24, 1
	.p2align 2
.L911:
	uxtw	x0, w21
	add	x1, x23, x0
	ldrb	w1, [x1, 12]
	cbz	w1, .L889
	add	x0, x0, 8
	ldr	w5, [x20, 2804]
	ldr	w4, [x20, 7020]
	ldr	w0, [x23, x0, lsl 2]
	add	w4, w4, w0
	cbz	w5, .L889
	add	x1, x20, 2824
	mov	w0, 0
	b	.L892
	.p2align 3
.L890:
	add	w0, w0, 1
	cmp	w0, w5
	beq	.L889
.L892:
	ldr	x2, [x1]
	add	x1, x1, 8
	ldr	w3, [x2, 4]
	cmp	w4, w3
	bne	.L890
	ldr	w3, [x2, 28]
	ldr	w6, [x20, 7040]
	cmp	w6, w3
	bne	.L890
	add	x19, x20, x0, uxtw 3
	strb	w26, [x2, 1]
	ldr	x0, [x19, 2824]
	ldrb	w1, [x0, 1]
	cbnz	w1, .L926
.L891:
	str	w24, [x0, 64]
	add	x0, x20, x22, uxtw 3
	add	w22, w22, 1
	ldr	x1, [x19, 2824]
	str	wzr, [x1, 60]
	ldr	x1, [x19, 2824]
	str	x1, [x0, 3096]
	.p2align 2
.L889:
	add	w21, w21, 1
	cmp	w25, w21
	bhi	.L911
	ldr	w0, [x20, 2800]
.L886:
	cmp	w0, w22
	str	w22, [x20, 2820]
	bls	.L877
	.p2align 2
.L910:
	add	x1, x20, x22, uxtw 3
	add	w22, w22, 1
	cmp	w0, w22
	str	xzr, [x1, 3096]
	bne	.L910
.L877:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L925:
	ldr	w1, [x0, 24]
	mov	w2, 1
	ldr	w0, [x20, 248]
	bl	FSP_SetRef
	ldr	x0, [x19, 2824]
	b	.L881
.L926:
	ldr	w1, [x0, 24]
	mov	w2, 1
	ldr	w0, [x20, 248]
	bl	FSP_SetRef
	ldr	x0, [x19, 2824]
	b	.L891
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
	ldr	w3, [x19, 7044]
	mov	w2, 1888
	ldr	x0, [x19, 2392]
	mov	w5, 12644
	ldr	w6, [x19, 7940]
	add	x1, x19, 8192
	ldr	w9, [x19, 7948]
	smaddl	x2, w3, w2, x0
	ldr	w0, [x19, 7944]
	sub	w9, w9, #1
	ldr	x4, [x19, 2384]
	mov	w3, 1
	ldr	w2, [x2, 32]
	add	w0, w6, w0
	sub	w0, w0, #1
	cmp	w9, w0
	smaddl	x0, w2, w5, x4
	ldr	w0, [x0, 116]
	lsl	w0, w3, w0
	ble	.L937
	mov	w10, 0
	sub	x11, x1, #252
	sub	w7, w0, #1
	mov	w13, w3
	mov	w12, w3
	.p2align 2
.L934:
	sxtw	x0, w9
	add	x1, x11, x0
	ldrb	w1, [x1, 12]
	cbz	w1, .L929
	add	x0, x19, x0, lsl 2
	ldr	w8, [x19, 2804]
	ldr	w6, [x0, 7096]
	ldr	w5, [x0, 8040]
	uxtb	w6, w6
	and	w0, w5, w7
	cmp	w6, wzr
	csel	w5, w0, w5, eq
	cmp	w8, wzr
	ble	.L929
	add	x2, x19, 2824
	mov	w1, 0
	b	.L933
	.p2align 3
.L932:
	add	w1, w1, 1
	cmp	w1, w8
	beq	.L929
.L933:
	ldr	x3, [x2]
	cmp	w6, wzr
	add	x2, x2, 8
	ldr	w0, [x3, 4]
	and	w4, w0, w7
	csel	w0, w4, w0, eq
	cmp	w5, w0
	bne	.L932
	ldr	w4, [x3, 28]
	ldr	w0, [x19, 7040]
	cmp	w4, w0
	bne	.L932
	add	x1, x19, x1, sxtw 3
	strb	w13, [x3, 1]
	add	x0, x19, x10, sxtw 3
	add	w10, w10, 1
	ldr	x2, [x1, 2824]
	str	wzr, [x2, 64]
	ldr	x2, [x1, 2824]
	str	w12, [x2, 60]
	ldr	x1, [x1, 2824]
	str	x1, [x0, 3232]
	.p2align 2
.L929:
	ldp	w1, w0, [x11]
	sub	w9, w9, #1
	add	w0, w1, w0
	sub	w0, w0, #1
	cmp	w0, w9
	blt	.L934
	mov	w0, w10
.L928:
	ldr	w1, [x19, 2800]
	str	w0, [x19, 2812]
	cmp	w1, w10
	ble	.L927
	.p2align 2
.L940:
	add	x0, x19, x10, sxtw 3
	add	w10, w10, 1
	cmp	w10, w1
	str	xzr, [x0, 3232]
	bne	.L940
.L927:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L937:
	mov	w0, 0
	mov	w10, 0
	b	.L928
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
	cbz	x23, .L964
	ldr	w20, [x22, 6408]
	uxtw	x21, w20
	lsl	x0, x21, 2
	sub	x0, x0, x21
	add	x0, x21, x0, lsl 3
	add	x0, x22, x0, lsl 3
	ldr	w2, [x0, 15336]
	cbz	w2, .L948
	ldr	w0, [x0, 15344]
	cbz	w0, .L965
	mov	w0, 200
	mov	x1, 15348
	mov	w19, 0
	umaddl	x0, w20, w0, x1
	add	x0, x22, x0
	b	.L951
	.p2align 3
.L954:
	ldr	w1, [x0], 4
	cbz	w1, .L949
.L951:
	add	w19, w19, 1
	cmp	w19, w2
	bne	.L954
.L948:
	ldr	x2, .LC156
	mov	w1, 11248
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
.L961:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L965:
	mov	w19, 0
	.p2align 2
.L949:
	ldr	w0, [x22, 248]
	ldr	w1, [x23, 24]
	bl	FSP_GetLogicFs
	cbz	x0, .L952
	ldr	x1, [x0, 24]
	cbz	x1, .L952
	uxtw	x2, w19
	mov	w4, 50
	mov	w3, 1
	lsl	x1, x21, 2
	umaddl	x20, w20, w4, x2
	sub	x1, x1, x21
	ldr	x2, .LC152
	mov	w4, w19
	add	x20, x22, x20, lsl 2
	add	x21, x21, x1, lsl 3
	mov	w1, 11230
	add	x22, x22, x21, lsl 3
	str	w3, [x20, 15344]
	ldr	x0, [x0, 24]
	ldr	w0, [x0, 36]
	str	w0, [x20, 15408]
	ldr	w0, [x23, 4]
	str	w0, [x20, 15472]
	mov	w0, 11
	ldr	w3, [x22, 15340]
	add	w3, w3, 1
	str	w3, [x22, 15340]
	ldr	w3, [x23, 168]
	bl	dprint_normal
	str	w19, [x23, 20]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L952:
	ldrb	w5, [x23, 1]
	mov	x6, x0
	ldr	x2, .LC154
	mov	x7, 0
	ldr	w4, [x23, 4]
	mov	w1, 11242
	ldr	w3, [x23, 24]
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L961
.L964:
	mov	w4, 11213
	ldr	x3, .LC148
	ldr	x2, .LC150
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L961
	.size	HEVC_GetAPC, .-HEVC_GetAPC
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
	cbz	x19, .L976
	ldr	w1, [x19, 24]
	ldr	w0, [x20, 248]
	bl	FSP_GetLogicFs
	cbz	x0, .L968
	ldr	w5, [x0, 20]
	cmp	w5, 3
	ccmp	w5, wzr, 4, ne
	beq	.L988
	ldr	w0, [x19, 48]
	cmp	w0, 1
	beq	.L973
	ldr	w5, [x19, 44]
	ldrb	w6, [x19]
	cbz	w5, .L972
	cmp	w6, 1
	mov	w0, 0
	beq	.L972
.L982:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L988:
	ldr	x3, .LC157
	mov	w1, 11546
	ldr	x2, .LC159
	mov	w0, 11
	ldr	w4, [x19, 24]
	add	x3, x3, 344
	bl	dprint_normal
.L970:
	ldr	w0, [x19, 48]
	cmp	w0, 1
	bne	.L989
.L973:
	mov	w1, 1
	mov	w0, 2
	strb	w1, [x19, 2]
	str	w0, [x19, 48]
	mov	w0, -3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L968:
	ldr	x2, .LC161
	mov	x3, x19
	ldr	w4, [x19, 4]
	mov	w1, 11552
	ldr	w6, [x19, 24]
	mov	w0, 1
	ldr	w5, [x19, 48]
	bl	dprint_normal
	b	.L970
.L989:
	ldr	x3, .LC157
	mov	w1, 11565
	ldr	x2, .LC163
	mov	w0, 1
	ldr	w4, [x19, 4]
	add	x3, x3, 344
	bl	dprint_normal
	mov	w0, -3
	b	.L982
	.p2align 3
.L972:
	ldr	x3, .LC157
	mov	x4, x19
	ldr	x2, .LC165
	mov	w1, 11572
	add	x3, x3, 344
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L982
	.p2align 3
.L976:
	mov	w0, -1
	b	.L982
	.size	HEVC_CheckFrameStore, .-HEVC_CheckFrameStore
	.align	3
.LC157:
	.xword	.LANCHOR0
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
	mov	x23, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w22, [x23, 8]
	ldr	x0, [x23, 288]
	cmn	x0, #1
	beq	.L992
	ldr	w1, [x20, 2804]
	cbz	w1, .L992
	mov	w25, -1
	mov	x24, -2
	mov	w19, 0
	b	.L995
	.p2align 3
.L1028:
	ldr	x0, [x21, 2824]
	ldr	w1, [x20, 2804]
	ldr	x0, [x0, 288]
	cmp	x0, x24
	bcs	.L994
	mov	w25, w19
	mov	x24, x0
.L994:
	add	w19, w19, 1
	cmp	w1, w19
	bls	.L1030
.L995:
	add	x21, x20, x19, sxtw 3
	ldr	x0, [x21, 2824]
	cbz	x0, .L994
	ldr	w1, [x0, 24]
	ldr	w0, [x20, 248]
	bl	FSP_GetLogicFs
	cbz	x0, .L1029
	ldr	w0, [x0, 20]
	cmp	w0, 3
	ccmp	w0, wzr, 4, ne
	bne	.L1028
.L1029:
	ldr	w1, [x20, 2804]
	add	w19, w19, 1
	cmp	w1, w19
	bhi	.L995
.L1030:
	cmn	w25, #1
	beq	.L992
	ldr	x1, [x23, 288]
	cmp	x1, x24
	bhi	.L1031
.L992:
	ldrb	w0, [x23, 237]
	ldrb	w1, [x23, 236]
	and	w0, w0, -64
	strb	w0, [x23, 237]
	and	w1, w1, -4
	strb	w1, [x23, 236]
	ldr	w2, [x20, 148]
	str	w2, [x23, 144]
	ldr	x2, [x20, 2424]
	ldrh	w2, [x2, 112]
	cmp	w2, 1
	beq	.L1002
	cmp	w2, 257
	bne	.L1003
	ldr	w2, [x20, 3380]
	cmp	w2, 1
	cset	w3, ne
.L996:
	ldr	x4, [x20, 2432]
	mov	w2, 3
	ldrb	w4, [x4, 2054]
	cbz	w4, .L997
	ldr	w3, [x23, 36]
	mov	w2, 1
	cmp	w3, w2
	ccmp	w3, 11, 4, ne
	cset	w4, eq
	cbz	w4, .L1032
.L998:
	ldr	w3, [x23, 40]
	cmp	w3, wzr
	cset	w3, eq
.L997:
	mov	w4, 2
	bfi	w1, w22, 0, 2
	bfi	w0, w4, 4, 2
	ldr	w4, [x23, 44]
	bfi	w0, w2, 2, 2
	strb	w1, [x23, 236]
	bfi	w0, w3, 0, 2
	strb	w0, [x23, 237]
	cbz	w4, .L999
	ldr	w0, [x23, 12]
	str	w0, [x23, 176]
.L999:
	ldr	w0, [x20, 248]
	ldr	w1, [x23, 24]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L990
	ldr	x3, .LC168
	mov	x2, 536
	add	x1, x23, 80
	ldr	x3, [x3, 104]
	blr	x3
.L990:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1031:
	ldr	w0, [x20, 248]
	mov	x2, x24
	bl	IsPtsRewind
	cbnz	w0, .L992
	ldr	x2, .LC167
	mov	w1, 11624
	ldr	w3, [x20, 248]
	mov	x5, x24
	ldr	x4, [x23, 288]
	mov	w0, 24
	add	x25, x20, x25, sxtw 3
	bl	dprint_normal
	ldr	x0, [x25, 2824]
	ldr	x1, [x23, 288]
	str	x1, [x0, 288]
	str	x24, [x23, 288]
	b	.L992
	.p2align 3
.L1032:
	mov	w4, 2
	and	w3, w3, -9
	mov	w2, 3
	cmp	w3, w4
	csel	w2, w2, w4, ne
	b	.L998
	.p2align 3
.L1002:
	mov	w3, 0
	b	.L996
	.p2align 3
.L1003:
	mov	w3, 1
	b	.L996
	.size	HEVC_GetImagePara, .-HEVC_GetImagePara
	.align	3
.LC167:
	.xword	.LC166
	.align	3
.LC168:
	.xword	vfmw_Osal_Func_Ptr_S
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
	ldr	w0, [x21, 248]
	mov	w1, w22
	bl	FSP_GetLogicFs
	cbz	x0, .L1038
	ldr	w1, [x0, 20]
	add	x19, x0, 224
	add	x20, x0, 256
	cbz	w1, .L1044
.L1041:
	ldr	x2, [x19]
	mov	x1, x2
	cbz	x2, .L1036
	ldr	w0, [x21, 248]
	bl	FreeUsdByDec
	str	xzr, [x19]
.L1036:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L1041
	ldr	w0, [x21, 248]
	mov	w2, 0
	mov	w1, w22
	bl	FSP_SetDisplay
	mov	w0, 0
.L1034:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1044:
	ldr	x2, .LC170
	mov	w1, 11727
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1034
.L1038:
	mov	w0, -1
	b	.L1034
	.size	HEVC_DECRecycleImage, .-HEVC_DECRecycleImage
	.align	3
.LC170:
	.xword	.LC169
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
	add	x1, x19, 540
	mov	w2, 14999
	ldr	w0, [x1, 4]
	cmp	w0, w2
	bhi	.L1049
	sub	w2, w0, #8192
	mov	w3, 4749
	sub	w2, w2, #308
	cmp	w2, w3
	bhi	.L1048
	mov	w0, 1
	strb	w0, [x20, 3]
	b	.L1047
	.p2align 3
.L1048:
	sub	w0, w0, #12288
	sub	w0, w0, #962
	cmp	w0, 1749
	bls	.L1052
.L1049:
	strb	wzr, [x20, 3]
.L1047:
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
	bhi	.L1050
	mov	w1, 5977
	movk	w1, 0xd1b7, lsl 16
	umull	x0, w0, w1
	ubfx	x4, x0, 45, 16
.L1050:
	strh	w4, [x20, 6]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1052:
	mov	w0, 2
	strb	w0, [x20, 3]
	b	.L1047
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
	ldrb	w3, [x21]
	mov	w1, 11785
	ldr	x2, .LC172
	mov	w0, 32
	bl	dprint_normal
	ldrb	w3, [x21, 1]
	mov	w1, 11786
	ldr	x2, .LC174
	mov	w0, 32
	bl	dprint_normal
	ldrb	w3, [x21, 2]
	mov	w1, 11787
	ldr	x2, .LC176
	mov	w0, 32
	bl	dprint_normal
	ldrb	w3, [x21, 3]
	mov	w1, 11788
	ldr	x2, .LC178
	mov	w0, 32
	bl	dprint_normal
	ldrh	w3, [x21, 4]
	mov	w1, 11789
	ldr	x2, .LC180
	mov	w0, 32
	bl	dprint_normal
	ldrh	w3, [x21, 6]
	mov	w1, 11790
	ldr	x2, .LC182
	mov	w0, 32
	bl	dprint_normal
	ldrb	w3, [x21, 8]
	mov	w1, 11791
	ldr	x2, .LC184
	mov	w0, 32
	bl	dprint_normal
	ldrb	w3, [x21, 9]
	mov	w1, 11792
	ldr	x2, .LC186
	mov	w0, 32
	bl	dprint_normal
	ldrb	w0, [x21, 1]
	ldrb	w3, [x21, 10]
	cbnz	w0, .L1054
	ldr	x2, .LC188
	add	x19, x21, 10
	mov	w1, 11796
	mov	w0, 32
	bl	dprint_normal
	ldrb	w3, [x19, 1]
	mov	w1, 11797
	ldr	x2, .LC190
	mov	w0, 32
	bl	dprint_normal
	ldrb	w3, [x19, 2]
	mov	w1, 11798
	ldr	x2, .LC192
	mov	w0, 32
	bl	dprint_normal
	ldrb	w3, [x19, 3]
	mov	w1, 11799
	ldr	x2, .LC194
	mov	w0, 32
	bl	dprint_normal
	ldrb	w3, [x19, 4]
	mov	w1, 11800
	ldr	x2, .LC196
	mov	w0, 32
	bl	dprint_normal
	ldrb	w3, [x19, 5]
	mov	w1, 11802
	ldr	x2, .LC198
	mov	w0, 32
	bl	dprint_normal
	ldrb	w0, [x19, 5]
	cbz	w0, .L1059
	ldr	x23, .LC202
	mov	w20, 0
	ldr	x22, .LC204
	.p2align 2
.L1058:
	add	x21, x19, x20, uxtw
	mov	w4, w20
	mov	x2, x23
	mov	w1, 11806
	mov	w0, 32
	ldrb	w3, [x21, 6]
	bl	dprint_normal
	ldrb	w3, [x21, 16]
	mov	w4, w20
	mov	x2, x22
	mov	w1, 11807
	mov	w0, 32
	add	w20, w20, 1
	bl	dprint_normal
	ldrb	w0, [x19, 5]
	cmp	w0, w20
	bhi	.L1058
.L1059:
	ldrb	w3, [x19, 26]
	mov	w1, 11810
	ldr	x2, .LC200
	mov	w0, 32
	bl	dprint_normal
	ldrb	w0, [x19, 26]
	cbz	w0, .L1060
	ldr	x23, .LC206
	mov	w20, 0
	ldr	x22, .LC208
	.p2align 2
.L1061:
	add	x21, x19, x20, uxtw
	mov	w4, w20
	mov	x2, x23
	mov	w1, 11814
	mov	w0, 32
	ldrb	w3, [x21, 27]
	bl	dprint_normal
	ldrb	w3, [x21, 33]
	mov	w4, w20
	mov	x2, x22
	mov	w1, 11815
	mov	w0, 32
	add	w20, w20, 1
	bl	dprint_normal
	ldrb	w0, [x19, 26]
	cmp	w0, w20
	bhi	.L1061
.L1060:
	ldr	x2, .LC226
	mov	x3, 290
	mov	w1, 11840
	mov	w0, 32
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1054:
	ldr	x2, .LC210
	mov	w1, 11820
	mov	w0, 32
	bl	dprint_normal
	ldrb	w0, [x21, 10]
	cbz	w0, .L1072
	ldr	x24, .LC214
	mov	w20, 0
	ldr	x23, .LC216
	add	x19, x21, 10
	.p2align 2
.L1065:
	add	x22, x21, x20, uxtw 1
	mov	w3, w20
	mov	x2, x24
	mov	w1, 11824
	mov	w0, 32
	ldrh	w4, [x22, 12]
	bl	dprint_normal
	ldrh	w4, [x22, 80]
	mov	w3, w20
	mov	x2, x23
	mov	w1, 11825
	mov	w0, 32
	add	w20, w20, 1
	bl	dprint_normal
	ldrb	w0, [x19]
	cmp	w0, w20
	bhi	.L1065
.L1066:
	ldrb	w3, [x19, 138]
	mov	w1, 11828
	ldr	x2, .LC212
	mov	w0, 32
	bl	dprint_normal
	ldrb	w0, [x19, 138]
	cbz	w0, .L1064
	ldr	x24, .LC222
	mov	w20, 0
	ldr	x23, .LC224
	.p2align 2
.L1067:
	add	x22, x21, x20, uxtw 1
	mov	w4, w20
	mov	x2, x24
	mov	w1, 11832
	mov	w0, 32
	ldrh	w3, [x22, 150]
	bl	dprint_normal
	ldrh	w3, [x22, 218]
	mov	w4, w20
	mov	x2, x23
	mov	w1, 11833
	mov	w0, 32
	add	w20, w20, 1
	bl	dprint_normal
	ldrb	w0, [x19, 138]
	cmp	w0, w20
	bhi	.L1067
.L1064:
	ldrh	w3, [x19, 276]
	mov	w1, 11836
	ldr	x2, .LC218
	mov	w0, 32
	bl	dprint_normal
	ldrh	w3, [x19, 278]
	mov	w1, 11837
	ldr	x2, .LC220
	mov	w0, 32
	bl	dprint_normal
	b	.L1060
.L1072:
	add	x19, x21, 10
	b	.L1066
	.size	HEVC_PrintSLHDR1Info, .-HEVC_PrintSLHDR1Info
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetSLHDR1Info
	.type	HEVC_GetSLHDR1Info, %function
HEVC_GetSLHDR1Info:
	sub	sp, sp, #368
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	str	x21, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x2
	mov	x21, x1
	bl	_mcount
	mov	x2, 290
	mov	w1, 0
	add	x0, x29, 56
	bl	memset
	ldrb	w4, [x21, 1]
	ldrb	w5, [x19, 56]
	ldrb	w6, [x19, 540]
	cbz	w4, .L1113
	cbnz	w5, .L1116
.L1113:
	ldrb	w7, [x19, 59]
	ldrb	w0, [x19, 100]
.L1075:
	ldr	x3, .LC227
	mov	w1, 11861
	ldr	x2, .LC229
	str	w0, [sp]
	add	x3, x3, 368
	mov	w0, 20
	bl	dprint_normal
	strb	wzr, [x20, 322]
.L1073:
	add	sp, x29, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 352
	ret
	.p2align 3
.L1116:
	cbz	w6, .L1113
	ldrb	w0, [x19, 59]
	cbnz	w0, .L1078
	ldrb	w7, [x19, 100]
	cbz	w7, .L1075
.L1078:
	mov	w0, 1
	strb	w0, [x20, 322]
	ldr	w1, [x21, 24]
	ldrb	w3, [x19, 57]
	ldrb	w2, [x19, 58]
	cmp	w1, 9
	strb	w3, [x29, 56]
	strb	w2, [x29, 57]
	beq	.L1117
.L1080:
	ldrb	w0, [x19, 60]
	cmp	w0, 1
	beq	.L1081
	ldrb	w1, [x19, 101]
	cmp	w1, 1
	beq	.L1081
	cmp	w1, 9
	ccmp	w0, 9, 4, ne
	beq	.L1118
	ldrb	w0, [x29, 64]
	strb	w0, [x29, 58]
.L1081:
	mov	x1, x19
	add	x0, x29, 56
	bl	HEVC_GetSLHDR1MasteringDisplayInfo
	ldrb	w1, [x29, 64]
	ldrb	w0, [x29, 58]
	cmp	w1, w0
	beq	.L1119
	strb	wzr, [x29, 65]
.L1084:
	ldrb	w0, [x29, 57]
	cbnz	w0, .L1085
	add	x6, x19, 59
	ldrb	w4, [x6, 2]
	ldrb	w3, [x6, 3]
	ldrb	w2, [x6, 4]
	ldrb	w1, [x6, 5]
	ldrb	w0, [x6, 6]
	ldrb	w5, [x6, 7]
	strb	w4, [x29, 66]
	strb	w3, [x29, 67]
	strb	w2, [x29, 68]
	strb	w1, [x29, 69]
	strb	w0, [x29, 70]
	strb	w5, [x29, 71]
	cbz	w5, .L1090
	add	x2, x19, 67
	add	x1, x29, 72
	mov	w0, 0
	.p2align 2
.L1089:
	add	w0, w0, 1
	ldrb	w4, [x2]
	ldrb	w3, [x2, 10]
	cmp	w0, 9
	strb	w4, [x1]
	ccmp	w0, w5, 2, ls
	strb	w3, [x1, 10]
	add	x2, x2, 1
	add	x1, x1, 1
	bcc	.L1089
.L1090:
	ldrb	w4, [x6, 28]
	strb	w4, [x29, 92]
	cbz	w4, .L1088
	add	x19, x19, 88
	add	x1, x29, 93
	mov	w0, 0
	.p2align 2
.L1093:
	add	w0, w0, 1
	ldrb	w3, [x19]
	ldrb	w2, [x19, 6]
	cmp	w0, 5
	strb	w3, [x1]
	ccmp	w0, w4, 2, ls
	strb	w2, [x1, 6]
	add	x19, x19, 1
	add	x1, x1, 1
	bcc	.L1093
.L1088:
	ldr	w0, [x20, 332]
	cbnz	w0, .L1120
	ldr	x3, .LC227
	mov	w1, 11958
	ldr	x2, .LC231
	mov	w0, 1
	add	x3, x3, 368
	bl	dprint_normal
	b	.L1073
	.p2align 3
.L1085:
	add	x6, x19, 100
	ldrb	w5, [x6, 40]
	add	w5, w5, 1
	ldp	w1, w0, [x6, 8]
	uxtb	w5, w5
	strh	w1, [x29, 342]
	strb	w5, [x29, 66]
	strh	w0, [x29, 344]
	cbz	w5, .L1097
	add	x2, x19, 144
	add	x1, x29, 68
	mov	w0, 0
	.p2align 2
.L1096:
	add	w0, w0, 1
	ldrh	w4, [x2]
	ldrh	w3, [x2, 198]
	cmp	w0, 32
	strh	w4, [x1]
	ccmp	w0, w5, 2, ls
	strh	w3, [x1, 68]
	add	x2, x2, 2
	add	x1, x1, 2
	bcc	.L1096
.L1097:
	ldrb	w4, [x6, 41]
	add	w4, w4, 1
	uxtb	w4, w4
	strb	w4, [x29, 204]
	cbz	w4, .L1088
	add	x19, x19, 210
	add	x1, x29, 206
	mov	w0, 0
	.p2align 2
.L1098:
	add	w0, w0, 1
	ldrh	w3, [x19]
	ldrh	w2, [x19, 198]
	cmp	w0, 32
	strh	w3, [x1]
	ccmp	w0, w4, 2, ls
	strh	w2, [x1, 68]
	add	x19, x19, 2
	add	x1, x1, 2
	bcc	.L1098
	b	.L1088
	.p2align 3
.L1120:
	ldr	x3, .LC232
	mov	x2, 290
	ldr	x0, [x20, 336]
	add	x1, x29, 56
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 290
	str	w0, [x20, 328]
	b	.L1073
	.p2align 3
.L1118:
	mov	w0, 1
	strb	w0, [x29, 58]
	b	.L1081
	.p2align 3
.L1119:
	ldrb	w0, [x29, 59]
	strb	w0, [x29, 65]
	b	.L1084
	.p2align 3
.L1117:
	ldr	w1, [x21, 32]
	cmp	w1, 9
	bne	.L1080
	strb	w0, [x29, 64]
	b	.L1080
	.size	HEVC_GetSLHDR1Info, .-HEVC_GetSLHDR1Info
	.align	3
.LC227:
	.xword	.LANCHOR0
	.align	3
.LC229:
	.xword	.LC228
	.align	3
.LC231:
	.xword	.LC230
	.align	3
.LC232:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetHDR10PlusInfo
	.type	HEVC_GetHDR10PlusInfo, %function
HEVC_GetHDR10PlusInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w6, [x20, 3024]
	cmp	w6, 1
	bne	.L1126
	add	x1, x19, 320
	str	w6, [x19, 324]
	ldr	x0, [x1, 16]
	cbz	x0, .L1127
	ldr	w4, [x1, 8]
	cmp	w4, 2435
	bls	.L1128
	ldr	x3, .LC240
	mov	x2, 2436
	add	x1, x20, 592
	ldr	x3, [x3, 104]
	blr	x3
.L1121:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1128:
	ldr	x3, .LC233
	mov	x5, 2436
	ldr	x2, .LC239
	mov	w1, 11993
	add	x3, x3, 392
	mov	w0, w6
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1126:
	ldr	x3, .LC233
	mov	w4, w6
	ldr	x2, .LC235
	mov	w1, 11974
	add	x3, x3, 392
	mov	w0, 20
	bl	dprint_normal
	str	wzr, [x19, 324]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1127:
	ldr	x3, .LC233
	mov	w1, 11986
	ldr	x2, .LC237
	mov	w0, w6
	add	x3, x3, 392
	bl	dprint_normal
	b	.L1121
	.size	HEVC_GetHDR10PlusInfo, .-HEVC_GetHDR10PlusInfo
	.align	3
.LC233:
	.xword	.LANCHOR0
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
.LC240:
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
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	mov	x19, x2
	bl	_mcount
	add	x3, x20, 320
	add	x0, x19, 544
	ldrb	w1, [x21]
	add	x2, x20, 352
	add	x4, x19, 556
	strb	w1, [x3, 24]
	ldr	w1, [x21, 24]
	strb	w1, [x3, 25]
	ldr	w1, [x21, 32]
	strb	w1, [x3, 26]
	ldr	w1, [x21, 28]
	str	w1, [x3, 28]
	ldrb	w1, [x19, 540]
	strb	w1, [x20, 320]
.L1130:
	ldr	w1, [x0]
	add	x0, x0, 4
	strh	w1, [x2]
	add	x2, x2, 2
	cmp	x0, x4
	ldr	w1, [x0, 8]
	strh	w1, [x2, 4]
	bne	.L1130
	ldr	w0, [x19, 568]
	mov	x2, x19
	strh	w0, [x3, 44]
	mov	x1, x21
	mov	x0, x20
	ldr	w4, [x19, 572]
	strh	w4, [x3, 46]
	ldr	w4, [x19, 576]
	str	w4, [x3, 48]
	ldr	w4, [x19, 580]
	str	w4, [x3, 52]
	ldrb	w4, [x19, 584]
	strb	w4, [x3, 1]
	ldrh	w4, [x19, 586]
	str	w4, [x3, 56]
	ldrh	w4, [x19, 588]
	str	w4, [x3, 60]
	ldrb	w4, [x19, 590]
	strb	w4, [x3, 64]
	bl	HEVC_GetSLHDR1Info
	mov	x1, x19
	mov	x0, x20
	bl	HEVC_GetHDR10PlusInfo
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
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x24, x20, 4096
	add	x19, x20, 12288
	bl	_mcount
	add	x19, x19, 3248
	ldr	w1, [x20, 7044]
	mov	w5, 1888
	ldr	x0, [x20, 2392]
	mov	w4, 12644
	ldr	x2, [x20, 2384]
	mov	x3, 0
	smaddl	x0, w1, w5, x0
	ldr	w21, [x0, 32]
	strb	wzr, [x24, 2305]
	smaddl	x21, w21, w4, x2
	.p2align 2
.L1138:
	ldr	w0, [x19, 44]
	cbnz	w0, .L1133
	cbz	x19, .L1134
	ldr	w2, [x20, 2804]
	cbz	w2, .L1134
	ldr	x0, [x20, 2824]
	cmp	x0, x19
	beq	.L1133
	sub	w2, w2, #1
	mov	x0, x20
	add	x2, x20, x2, lsl 3
	b	.L1136
	.p2align 3
.L1137:
	ldr	x1, [x0, 2824]
	cmp	x1, x19
	beq	.L1133
.L1136:
	cmp	x0, x2
	add	x0, x0, 8
	bne	.L1137
.L1134:
	lsl	x0, x3, 2
	mov	w1, 101
	sub	x0, x0, x3
	str	w1, [x20, 6440]
	lsl	x0, x0, 2
	mov	w1, 1
	sub	x3, x0, x3
	add	x23, x24, 2376
	lsl	x22, x3, 3
	strb	w1, [x24, 2305]
	sub	x3, x22, x3
	mov	x2, 536
	mov	x0, x23
	add	x22, x20, x3, lsl 3
	add	x25, x22, 12288
	add	x1, x25, 3328
	bl	memcpy
	str	x19, [x20, 6464]
	str	wzr, [x20, 6568]
	str	wzr, [x22, 15548]
	strb	wzr, [x25, 3250]
	strb	wzr, [x19]
	ldr	x0, [x20, 6464]
	str	wzr, [x0, 60]
	ldr	x0, [x20, 6464]
	str	wzr, [x0, 64]
	ldr	x0, [x20, 6464]
	str	wzr, [x0, 48]
	ldrb	w0, [x24, 2305]
	cmp	w0, 1
	bne	.L1141
	ldr	w0, [x20, 248]
	mov	w1, 0
	bl	FSP_NewLogicFs
	mov	w22, w0
	mov	w1, w0
	ldr	w0, [x20, 248]
	bl	FSP_GetLogicFs
	mov	x19, x0
	cmp	w22, wzr
	ccmp	x0, xzr, 4, ge
	beq	.L1140
	add	x1, x21, 2052
	add	x2, x20, 3368
	bl	HEVC_ConvertHDRInfo
	ldr	x21, .LC243
	ldr	x0, [x20, 6464]
	mov	x2, 536
	add	x1, x19, 56
	ldr	x3, [x21, 104]
	add	x0, x0, 80
	blr	x3
	ldr	x1, [x20, 6464]
	mov	x2, 536
	ldr	x3, [x21, 104]
	mov	x0, x23
	add	x1, x1, 80
	blr	x3
	ldr	x1, [x20, 6464]
	mov	w0, 0
	str	w22, [x1, 24]
	ldr	x1, [x19, 40]
	ldr	w1, [x1, 4]
	str	w1, [x20, 6436]
.L1151:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1133:
	add	w3, w3, 1
	add	x19, x19, 616
	cmp	w3, 20
	bne	.L1138
.L1141:
	ldr	x2, .LC242
	mov	w1, 12077
	mov	w0, 0
	bl	dprint_normal
	ldr	x25, [sp, 64]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L1140:
	ldr	x2, .LC245
	mov	w1, 12097
	strb	wzr, [x24, 2305]
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1151
	.size	HEVC_AllocFrameStore, .-HEVC_AllocFrameStore
	.align	3
.LC242:
	.xword	.LC241
	.align	3
.LC243:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC245:
	.xword	.LC244
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
	ldr	x0, [x22, 2824]
	str	wzr, [x0, 44]
	ldr	x1, [x22, 2824]
	ldr	w0, [x20, 248]
	ldr	w1, [x1, 24]
	bl	FSP_GetLogicFs
	cbz	x0, .L1154
	ldr	w0, [x0, 20]
	cmp	w0, 3
	beq	.L1155
	ldr	x1, [x22, 2824]
	mov	w2, 0
	ldr	w0, [x20, 248]
	ldr	w1, [x1, 24]
	bl	FSP_SetDisplay
.L1155:
	ldr	x1, [x22, 2824]
	mov	w2, 0
	ldr	w0, [x20, 248]
	ldr	w1, [x1, 24]
	bl	FSP_SetRef
.L1154:
	ldr	w2, [x20, 2804]
	sub	w2, w2, #1
	cmp	w19, w2
	bhi	.L1158
	.p2align 2
.L1164:
	add	w0, w19, 1
	add	x1, x20, x21, lsl 3
	mov	w19, w0
	cmp	w0, w2
	mov	x21, x0
	add	x0, x20, x0, lsl 3
	ldr	x0, [x0, 2824]
	str	x0, [x1, 2824]
	bls	.L1164
.L1158:
	add	x0, x20, x2, uxtw 3
	str	xzr, [x0, 2824]
	str	w2, [x20, 2804]
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
	ldr	w2, [x20, 2804]
	cbnz	w2, .L1175
	b	.L1168
	.p2align 3
.L1170:
	add	w19, w19, 1
	cmp	w2, w19
	mov	w21, w19
	bls	.L1168
.L1175:
	add	x0, x20, x19, sxtw 3
	ldr	x0, [x0, 2824]
	ldrb	w1, [x0]
	cbz	w1, .L1170
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
	ldr	w2, [x20, 2804]
	cmp	w2, w19
	bhi	.L1175
.L1168:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_RemoveDummyFrame, .-HEVC_RemoveDummyFrame
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RemoveSamePocOutDPB
	.type	HEVC_RemoveSamePocOutDPB, %function
HEVC_RemoveSamePocOutDPB:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	mov	x23, x1
	bl	_mcount
	mov	w19, 0
	ldr	w2, [x20, 2804]
	cbz	w2, .L1178
	ldr	x22, .LC247
	b	.L1185
	.p2align 3
.L1181:
	ldr	w4, [x0, 4]
	ldr	w1, [x21, 12]
	cmp	w4, w1
	beq	.L1187
	add	w19, w19, 1
	cmp	w2, w19
	bls	.L1178
.L1185:
	add	x0, x20, x19, sxtw 3
	ldr	x0, [x0, 2824]
	cbnz	x0, .L1181
	mov	w3, w19
	mov	x2, x22
	mov	x4, 0
	mov	w1, 11141
	add	w19, w19, 1
	bl	dprint_normal
	ldr	w2, [x20, 2804]
	cmp	w2, w19
	bhi	.L1185
.L1178:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1187:
	ldr	x3, .LC248
	mov	w1, 11147
	ldr	x2, .LC250
	mov	w0, 0
	add	x3, x3, 416
	bl	dprint_normal
	mov	w1, w19
	mov	x0, x20
	bl	HEVC_RemoveApcStore
	mov	w1, w19
	mov	x0, x20
	bl	HEVC_RemoveFrameStoreOutDPB
	ldr	w0, [x20, 2804]
	str	w0, [x23]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	HEVC_RemoveSamePocOutDPB, .-HEVC_RemoveSamePocOutDPB
	.align	3
.LC247:
	.xword	.LC246
	.align	3
.LC248:
	.xword	.LANCHOR0
	.align	3
.LC250:
	.xword	.LC249
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
	ldr	w22, [x21, 2804]
	cbz	w22, .L1189
	mov	w26, 0
	mov	w20, 0
	mov	w24, -1
	mov	w23, 1
	.p2align 2
.L1196:
	add	x19, x21, x26, uxtw 3
	ldr	w0, [x21, 248]
	ldr	x1, [x19, 2824]
	ldr	w1, [x1, 24]
	bl	FSP_GetLogicFs
	cbz	x0, .L1190
	ldrsb	w1, [x0]
	cbnz	w1, .L1205
	ldr	w0, [x0, 20]
	cmp	w0, wzr
	ccmp	w0, 3, 4, ne
	ldr	x0, [x19, 2824]
	bne	.L1192
.L1208:
	ldr	w1, [x0, 48]
	cmp	w1, 1
	beq	.L1192
	str	w24, [x0, 24]
	ldr	x0, [x19, 2824]
	strb	wzr, [x0, 1]
	ldr	x0, [x19, 2824]
	strb	w23, [x0, 2]
.L1205:
	ldr	x0, [x19, 2824]
.L1192:
	ldr	w0, [x0]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L1209
	add	w26, w26, 1
.L1195:
	add	w20, w20, 1
	cmp	w22, w20
	bne	.L1196
.L1189:
	mov	w0, w25
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1190:
	ldr	x0, [x19, 2824]
	b	.L1208
	.p2align 3
.L1209:
	mov	w1, w26
	mov	x0, x21
	mov	w25, 1
	bl	HEVC_RemoveFrameStoreOutDPB
	b	.L1195
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
	ldr	w0, [x19, 15336]
	ldr	w1, [x19, 15340]
	cmp	w1, w0
	bcs	.L1214
	ldr	w0, [x19, 2800]
	ldr	w1, [x19, 2804]
	cmp	w1, w0
	bcc	.L1210
	cmp	w0, 15
	bls	.L1216
.L1214:
	ldr	x0, [x19, 2824]
	mov	w2, 0
	strb	wzr, [x0, 1]
	ldr	w1, [x0, 24]
	ldr	w0, [x19, 248]
	bl	FSP_SetRef
	mov	x0, x19
	mov	w1, 0
	bl	HEVC_RemoveApcStore
	mov	w1, 0
	mov	x0, x19
	bl	HEVC_RemoveFrameStoreOutDPB
.L1210:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1216:
	mov	x0, x19
	bl	HEVC_IncreaseDPBSize
	cbnz	w0, .L1214
	b	.L1210
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
	ldr	w4, [x19, 2800]
	ldr	w3, [x19, 2804]
	cmp	w3, w4
	bhi	.L1225
.L1218:
	mov	w0, 0
	cbz	w3, .L1217
	.p2align 2
.L1223:
	add	x1, x19, x0, uxtw 3
	ldr	w2, [x20]
	ldr	x1, [x1, 2824]
	ldr	w1, [x1, 4]
	cmp	w2, w1
	ble	.L1220
	str	w1, [x20]
	str	w0, [x21]
.L1220:
	ldr	w1, [x19, 2804]
	add	w0, w0, 1
	cmp	w1, w0
	bhi	.L1223
.L1217:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1225:
	ldr	x2, .LC252
	mov	w1, 12192
	mov	w0, 1
	bl	dprint_normal
	ldr	w3, [x19, 2800]
	str	w3, [x19, 2804]
	b	.L1218
	.size	HEVC_GetMinPOC, .-HEVC_GetMinPOC
	.align	3
.LC252:
	.xword	.LC251
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
	ldr	w5, [x19, 7044]
	mov	w3, 1888
	ldr	x2, [x19, 2392]
	mov	w1, 12644
	ldr	x0, [x19, 2384]
	smaddl	x3, w5, w3, x2
	ldr	w3, [x3, 32]
	smaddl	x0, w3, w1, x0
	ldr	w1, [x0, 64]
	cmp	w1, w21
	ccmp	w20, wzr, 0, eq
	bne	.L1228
	ldr	w1, [x0, 68]
	mov	w0, 1
	cmp	w1, w22
	beq	.L1232
.L1227:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1228:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1232:
	ldr	w1, [x19, 176]
	cbz	w1, .L1227
	ldr	x0, [x19, 2464]
	ldr	w0, [x0, 896]
	cmp	w0, wzr
	cset	w0, ne
	b	.L1227
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
	ldr	x5, [x19, 2408]
	ldr	x0, [x19, 2368]
	ldrb	w4, [x5]
	ldr	w6, [x0, 32]
	cbz	w4, .L1244
	sub	w2, w4, #1
	mov	w7, 32
	mov	x3, 80
	add	x0, x5, 48
	mov	w1, 0
	umaddl	x3, w2, w7, x3
	add	x3, x5, x3
	.p2align 2
.L1235:
	ldr	w2, [x0], 32
	cmp	x0, x3
	add	w1, w1, w2
	bne	.L1235
.L1234:
	sbfiz	x4, x4, 5, 32
	and	w0, w6, 7
	add	x4, x5, x4
	str	w0, [x4, 60]
	ldr	x3, [x19, 2408]
	ldr	x0, [x19, 2368]
	ldrb	w2, [x3]
	ldr	w0, [x0, 32]
	add	x4, x3, x2, lsl 5
	ldr	w3, [x4, 52]
	add	w0, w3, w0, lsr 3
	sub	w0, w0, w1
	str	w0, [x4, 64]
	ldr	x3, [x19, 2408]
	ldr	x0, [x19, 2368]
	ldrb	w2, [x3]
	ldr	w0, [x0, 32]
	add	x4, x3, x2, lsl 5
	ldr	w2, [x4, 48]
	add	w1, w1, w2
	lsl	w1, w1, 3
	sub	w0, w1, w0
	str	w0, [x4, 56]
	ldr	x1, [x19, 2408]
	ldrb	w0, [x1]
	add	x0, x1, x0, lsl 5
	ldp	w2, w1, [x0, 60]
	ubfiz	w1, w1, 3, 2
	add	w1, w1, w2
	str	w1, [x0, 60]
	ldr	x1, [x19, 2408]
	ldrb	w0, [x1]
	add	x0, x1, x0, lsl 5
	ldr	w1, [x0, 64]
	and	w1, w1, -4
	str	w1, [x0, 64]
	ldr	x2, [x19, 2408]
	ldr	w3, [x2, 8]
	sub	w1, w3, #1
	cmp	w1, 1
	bhi	.L1252
	ldrb	w0, [x2]
	add	w4, w0, 1
	cmp	w4, 1
	ccmp	w3, w4, 0, ls
	bls	.L1238
	add	w3, w0, 2
	.p2align 2
.L1239:
	sub	w0, w3, #1
	cmp	w3, 1
	lsl	x1, x0, 5
	add	x0, x0, 1
	add	x2, x2, x1
	lsl	x0, x0, 5
	cset	w5, ls
	str	wzr, [x2, 60]
	ldr	x2, [x19, 2408]
	add	x4, x2, x0
	add	x2, x2, x1
	ldr	w4, [x4, 20]
	str	w4, [x2, 64]
	ldr	x2, [x19, 2408]
	add	x0, x2, x0
	add	x2, x2, x1
	ldr	w0, [x0, 16]
	lsl	w0, w0, 3
	str	w0, [x2, 56]
	ldr	x0, [x19, 2408]
	add	x0, x0, x1
	ldp	w4, w2, [x0, 60]
	ubfiz	w2, w2, 3, 4
	add	w2, w2, w4
	str	w2, [x0, 60]
	ldr	x0, [x19, 2408]
	add	x1, x0, x1
	ldr	w0, [x1, 64]
	and	w0, w0, -16
	str	w0, [x1, 64]
	ldr	x2, [x19, 2408]
	ldr	w0, [x2, 8]
	cmp	w0, w3
	add	w3, w3, 1
	cset	w1, hi
	tst	w5, w1
	bne	.L1239
	sub	w1, w0, #1
.L1238:
	ubfiz	x0, x1, 5, 32
	ldr	w1, [x2, 12]
	add	x2, x2, x0
	ldr	w0, [x2, 56]
	sub	w0, w0, w1
	str	w0, [x2, 56]
	ldr	x3, [x19, 2408]
	ldrb	w0, [x3]
	ldr	w4, [x3, 8]
	cmp	w0, w4
	bcs	.L1233
	.p2align 2
.L1247:
	ubfiz	x1, x0, 5, 32
	ldr	w2, [x19, 6432]
	add	x1, x3, x1
	add	w0, w0, 1
	ldr	w1, [x1, 64]
	cmp	w1, w2
	bcs	.L1241
	str	w1, [x19, 6432]
	ldr	w4, [x3, 8]
.L1241:
	cmp	w4, w0
	bhi	.L1247
.L1233:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1252:
	ldr	x2, .LC254
	mov	w1, 12279
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1244:
	mov	w1, 0
	b	.L1234
	.size	HEVC_CalcStreamBits, .-HEVC_CalcStreamBits
	.align	3
.LC254:
	.xword	.LC253
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
	ldr	w0, [x19, 168]
	ldr	w3, [x19, 7044]
	cmp	w3, w0
	bge	.L1261
	mov	w0, 1888
	ldr	x1, [x19, 2392]
	smull	x0, w3, w0
	add	x2, x1, x0
	ldrb	w0, [x1, x0]
	cbz	w0, .L1262
	ldr	w3, [x2, 32]
	ldr	w0, [x19, 164]
	cmp	w3, w0
	bge	.L1263
	ldr	x1, [x19, 2384]
	mov	w0, 12644
	smaddl	x0, w3, w0, x1
	ldrb	w1, [x0, 1]
	cbz	w1, .L1264
	ldr	w3, [x0, 48]
	ldr	w0, [x19, 160]
	cmp	w3, w0
	bcs	.L1265
	uxtw	x2, w3
	ldr	x4, [x19, 2376]
	lsl	x1, x2, 4
	mov	w0, 0
	sub	x1, x1, x2
	lsl	x1, x1, 3
	ldrb	w1, [x4, x1]
	cbz	w1, .L1266
.L1255:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1261:
	ldr	x2, .LC256
	mov	w1, 12328
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1255
	.p2align 3
.L1262:
	ldr	x2, .LC258
	mov	w1, 12336
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1255
	.p2align 3
.L1263:
	ldr	x2, .LC260
	mov	w1, 12343
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1255
	.p2align 3
.L1264:
	ldr	x2, .LC262
	mov	w1, 12351
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1255
	.p2align 3
.L1265:
	ldr	x2, .LC264
	mov	w1, 12358
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1255
	.p2align 3
.L1266:
	ldr	x2, .LC266
	mov	w1, 12366
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1255
	.size	HEVC_VpsSpsPpsCheck, .-HEVC_VpsSpsPpsCheck
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsNewPic
	.type	HEVC_IsNewPic, %function
HEVC_IsNewPic:
	sub	sp, sp, #48
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	str	x19, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w2, [x19, 7040]
	mov	w0, 2147483647
	ldr	x3, [x19, 2408]
	add	x4, x19, x2, lsl 2
	ldr	w6, [x4, 224]
	cmp	w6, w0
	beq	.L1303
	ldr	w1, [x3, 16]
	sub	w0, w1, #16
	cmp	w0, 2
	ccmp	w1, 21, 4, hi
	beq	.L1273
.L1283:
	cmp	w1, 1
	bls	.L1304
.L1272:
	sub	w1, w1, #19
	cmp	w1, 1
	bhi	.L1273
	mov	w6, -2147483647
	str	w6, [x4, 224]
	.p2align 2
.L1273:
	ldr	w5, [x19, 7020]
	cmp	w5, w6
	bge	.L1275
.L1309:
	ldr	w7, [x3, 16]
	sub	w0, w7, #8
	cmp	w0, 1
	bls	.L1305
.L1276:
	add	x0, x19, x2
	ldrb	w0, [x0, 10]
	cbz	w0, .L1277
	ldr	w7, [x4, 228]
	cmp	w7, w5
	bgt	.L1306
.L1277:
	add	x0, x19, 4096
	ldrb	w1, [x0, 2913]
	cbnz	w1, .L1278
	ldr	w1, [x3, 16]
	sub	w3, w1, #19
	cmp	w3, 1
	bls	.L1299
	cmp	w1, 21
	beq	.L1299
	sub	w1, w1, #16
	cmp	w1, 2
	bhi	.L1278
	add	x2, x19, x2
	str	w5, [x4, 228]
	mov	w1, 1
	strb	w1, [x2, 10]
	.p2align 2
.L1278:
	ldr	w1, [x19, 232]
	ldrb	w2, [x0, 2912]
	cbnz	w1, .L1281
	ldr	w1, [x19, 7044]
	mov	w0, 1
	ldr	w3, [x19, 300]
	cmp	w3, w1
	beq	.L1307
.L1294:
	add	sp, x29, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1303:
	ldr	w1, [x3, 16]
	mov	w5, 0
	sub	w7, w1, #16
	cmp	w7, 5
	cset	w0, ls
	cmp	w1, 1
	bls	.L1308
.L1269:
	orr	w5, w5, w0
	mov	w0, 2
	cbz	w5, .L1294
	cmp	w7, 2
	ccmp	w1, 21, 4, hi
	bne	.L1283
.L1284:
	ldr	w5, [x19, 7020]
	str	w5, [x4, 224]
	ldr	w0, [x3, 16]
	cmp	w0, 1
	bhi	.L1275
	mov	w0, 1
	str	w0, [x19, 328]
	.p2align 2
.L1275:
	add	x0, x19, x2
	ldrb	w6, [x0, 5]
	cbz	w6, .L1276
	ldr	w7, [x3, 16]
	sub	w0, w7, #8
	cmp	w0, 1
	bhi	.L1276
	ldr	x3, .LC267
	mov	w4, 12434
	ldr	x2, .LC271
.L1300:
	add	x3, x3, 448
	mov	w1, w4
	mov	w0, 1
	bl	dprint_normal
	add	sp, x29, 0
	mov	w0, 2
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1281:
	ldr	w0, [x19, 204]
	ldr	w1, [x19, 7044]
	ldr	w3, [x19, 300]
	cmp	w1, w0
	mov	w0, 1
	csinc	w2, w2, wzr, eq
	cmp	w3, w1
	bne	.L1294
.L1307:
	ldr	w0, [x19, 256]
	add	sp, x29, 0
	ldr	x19, [sp, 16]
	cmp	w0, w5
	csinc	w0, w2, wzr, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1306:
	ldr	w1, [x3, 16]
	sub	w6, w1, #8
	cmp	w6, 1
	bhi	.L1277
	ldr	x3, .LC267
	mov	w4, 12443
	ldr	x2, .LC273
	mov	w6, w5
	str	w1, [sp]
	mov	w5, w0
	add	x3, x3, 448
	mov	w0, 1
	mov	w1, w4
	bl	dprint_normal
	mov	w0, 2
	b	.L1294
	.p2align 3
.L1299:
	add	x2, x19, x2
	str	w5, [x4, 228]
	strb	wzr, [x2, 10]
	b	.L1278
	.p2align 3
.L1304:
	ldr	w0, [x19, 7028]
	cmp	w0, 2
	bne	.L1272
	mov	w0, 2147483647
	cmp	w6, w0
	beq	.L1284
	ldr	w5, [x19, 7020]
	cmp	w5, w6
	blt	.L1309
	b	.L1275
	.p2align 3
.L1305:
	ldr	x3, .LC267
	mov	w4, 12427
	ldr	x2, .LC269
	b	.L1300
	.p2align 3
.L1308:
	ldr	w5, [x19, 7028]
	cmp	w5, 2
	cset	w5, eq
	b	.L1269
	.size	HEVC_IsNewPic, .-HEVC_IsNewPic
	.align	3
.LC267:
	.xword	.LANCHOR0
	.align	3
.LC269:
	.xword	.LC268
	.align	3
.LC271:
	.xword	.LC270
	.align	3
.LC273:
	.xword	.LC272
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
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	cbz	w0, .L1315
	ldr	x0, [x19, 2368]
	mov	w20, 0
	bl	BsBitsToNextByte
	mov	w1, w0
	cbz	w0, .L1312
	ldr	x0, [x19, 2368]
	bl	BsGet
	mov	w3, w0
	ldr	x2, .LC277
	mov	w1, 12508
	mov	w0, 17
	bl	dprint_normal
.L1312:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1315:
	ldr	x2, .LC275
	mov	w1, 12495
	mov	w0, 1
	mov	w20, -1
	bl	dprint_normal
	b	.L1312
	.size	HEVC_ReadByteAlignment, .-HEVC_ReadByteAlignment
	.align	3
.LC275:
	.xword	.LC274
	.align	3
.LC277:
	.xword	.LC276
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
	ldr	w0, [x19, 7036]
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
	ldr	w0, [x19, 7036]
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
	ldr	x0, [x20, 2368]
	cbnz	w24, .L1356
.L1354:
	mov	w1, 8
	bl	BsGet
	str	w0, [x22, 4]
	cmp	w23, wzr
	ble	.L1324
	sub	w21, w23, #1
	mov	x19, 0
	add	x21, x21, 1
	add	x25, x29, 88
	add	x22, x29, 80
	.p2align 2
.L1325:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x25, x19]
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x22, x19]
	add	x19, x19, 1
	cmp	x19, x21
	bne	.L1325
	cmp	w23, 7
	mov	w19, w23
	ble	.L1343
	b	.L1335
	.p2align 3
.L1328:
	cmp	w19, 8
	beq	.L1335
.L1343:
	ldr	x0, [x20, 2368]
	mov	w1, 2
	add	w19, w19, 1
	bl	BsGet
	cbz	w0, .L1328
	ldr	x2, .LC279
	mov	w1, 12602
	mov	w0, 1
	bl	dprint_normal
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, -1
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L1324:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	mov	w0, 0
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L1335:
	mov	w21, 0
	b	.L1333
	.p2align 3
.L1332:
	add	w21, w21, 1
	cmp	w23, w21
	ccmp	w21, 5, 0, gt
	bgt	.L1324
.L1333:
	sxtw	x22, w21
	cbz	w24, .L1330
	sub	x0, x29, #3968
	add	x0, x0, x22
	ldrb	w0, [x0, 4056]
	cbnz	w0, .L1357
.L1330:
	sub	x0, x29, #3968
	add	x22, x0, x22
	ldrb	w0, [x22, 4048]
	cbz	w0, .L1332
	ldr	x0, [x20, 2368]
	mov	w1, 8
	bl	BsGet
	b	.L1332
	.p2align 3
.L1357:
	ldr	x0, [x20, 2368]
	mov	w1, 2
	mov	w19, 32
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 5
	bl	BsGet
	.p2align 2
.L1331:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	subs	w19, w19, #1
	bne	.L1331
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 12
	bl	BsGet
	b	.L1330
.L1356:
	mov	w1, 2
	add	x19, x29, 96
	add	x21, x29, 128
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 5
	bl	BsGet
	mov	w25, w0
	.p2align 2
.L1320:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19], 1
	cmp	x19, x21
	bne	.L1320
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x22]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x22, 1]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	sub	w0, w25, #4
	cmp	w0, 3
	bls	.L1321
	ldrb	w0, [x29, 100]
	cbnz	w0, .L1321
	ldrb	w0, [x29, 101]
	cbnz	w0, .L1321
	ldrb	w0, [x29, 102]
	cbnz	w0, .L1321
	ldrb	w0, [x29, 103]
	cbnz	w0, .L1321
	ldr	x0, [x20, 2368]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 11
	bl	BsGet
	b	.L1323
	.p2align 3
.L1321:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 2
	bl	BsGet
.L1323:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	str	w25, [x20, 304]
	ldrb	w2, [x29, 97]
	ldrb	w1, [x29, 98]
	ldr	x0, [x20, 2368]
	str	w2, [x20, 308]
	str	w1, [x20, 312]
	b	.L1354
	.size	HEVC_DecPTL, .-HEVC_DecPTL
	.align	3
.LC279:
	.xword	.LC278
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
	add	x26, x20, 2220
	mov	w25, 0
	bl	_mcount
	ldr	x21, .LC281
	ldr	x22, .LC280
	mov	w23, 16
	ldr	x24, .LC282
.L1359:
	ldr	w0, [x26]
	cbz	w0, .L1368
	uxtw	x0, w25
	mov	w27, 0
	lsl	x28, x0, 2
	sub	x28, x28, x0
	lsl	x28, x28, 1
	.p2align 2
.L1365:
	uxtw	x19, w27
	add	x1, x21, 464
	add	x0, x19, x28
	cmp	w25, 3
	mov	x2, 64
	cbz	w25, .L1372
	add	x0, x20, x0, lsl 6
	beq	.L1373
	cmp	w27, 3
	ldr	x4, [x24, 104]
	add	x0, x0, 604
	csel	x1, x22, x1, cc
	blr	x4
.L1361:
	add	x19, x28, x19
	add	w27, w27, 1
	add	x19, x20, x19, lsl 2
	str	w23, [x19, 2236]
	ldr	w0, [x26]
	cmp	w0, w27
	bhi	.L1365
.L1368:
	add	w25, w25, 1
	add	x26, x26, 4
	cmp	w25, 4
	bne	.L1359
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L1372:
	add	x0, x20, x19, lsl 6
	ldr	x1, .LC283
	ldr	x4, [x24, 104]
	mov	x2, 16
	add	x0, x0, 604
	blr	x4
	b	.L1361
.L1373:
	ldr	x0, .LC281
	uxtw	x19, w27
	cmp	w27, wzr
	ldr	x4, [x24, 104]
	add	x1, x0, 464
	ldr	x0, .LC280
	mov	x2, 64
	csel	x1, x0, x1, eq
	add	x0, x20, x19, lsl 6
	add	x0, x0, 1756
	blr	x4
	b	.L1361
	.size	HEVC_SetDefaultScalingList, .-HEVC_SetDefaultScalingList
	.align	3
.LC280:
	.xword	.LANCHOR3
	.align	3
.LC281:
	.xword	.LANCHOR0
	.align	3
.LC282:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC283:
	.xword	.LANCHOR0+528
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
	ldr	x0, [x19, 2432]
	ldrb	w1, [x0, 3]
	cbz	w1, .L1394
	ldr	x20, [x19, 2440]
	add	x20, x20, 256
	ldrb	w1, [x20, -235]
	cbz	w1, .L1402
.L1377:
	cbz	x20, .L1378
	ldr	x21, .LC284
	mov	x2, 1536
	mov	w1, 0
	add	x0, x19, 604
	ldr	x3, [x21, 96]
	blr	x3
	add	x16, x20, 1
	add	x15, x19, 332
	mov	w12, 0
	mov	w17, 64
	mov	w14, 6
.L1380:
	ldr	w13, [x15, 1888]
	cbz	w13, .L1389
	ldr	w8, [x15]
	mov	x9, x16
	mov	w11, 0
	cmp	w8, 64
	csel	w8, w8, w17, ls
	lsr	w10, w8, 2
.L1387:
	uxtw	x7, w11
	mov	w4, 0
	umaddl	x7, w12, w14, x7
	lsl	x7, x7, 4
	.p2align 2
.L1381:
	cmp	w10, w4
	bls	.L1384
	cbz	w8, .L1381
	add	x0, x7, x4, uxtw
	ldrb	w1, [x9, -1]
	mov	x6, x9
	mov	w3, 0
	add	x0, x19, x0, lsl 2
	ldr	w2, [x0, 604]
	orr	w1, w2, w1
	str	w1, [x0, 604]
	.p2align 2
.L1390:
	add	w3, w3, 1
	add	x0, x7, x4, uxtw
	cmp	w3, w8
	and	w5, w3, 3
	add	x0, x19, x0, lsl 2
	lsl	w1, w5, 3
	beq	.L1381
	ldrb	w2, [x6], 1
	cmp	w5, 3
	ldr	w5, [x0, 604]
	csinc	w4, w4, w4, ne
	lsl	w1, w2, w1
	orr	w1, w5, w1
	str	w1, [x0, 604]
	b	.L1390
.L1402:
	ldrb	w1, [x0, 4]
	cbnz	w1, .L1403
.L1378:
	mov	x0, x19
	bl	HEVC_SetDefaultScalingList
.L1394:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1384:
	add	w11, w11, 1
	add	x9, x9, 64
	cmp	w11, w13
	bne	.L1387
.L1389:
	add	w12, w12, 1
	add	x16, x16, 384
	cmp	w12, 4
	add	x15, x15, 4
	bne	.L1380
	ldr	x3, [x21, 104]
	add	x1, x20, 1536
	mov	x2, 96
	add	x0, x19, 2236
	blr	x3
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L1403:
	add	x20, x0, 420
	b	.L1377
	.size	HEVC_SetScalingList, .-HEVC_SetScalingList
	.align	3
.LC284:
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
	ldr	w0, [x0, 332]
	lsl	x9, x9, 4
	cmp	w0, w8
	csel	w8, w0, w8, ls
	lsr	w10, w8, 2
	.p2align 2
.L1405:
	cmp	w5, w10
	bcs	.L1404
	cbz	w8, .L1405
	add	x0, x9, x5, uxtw
	mov	x7, x21
	mov	w4, 0
	add	x0, x20, x0, lsl 2
	ldrb	w2, [x7], 1
	ldr	w3, [x0, 604]
	orr	w2, w3, w2
	str	w2, [x0, 604]
	.p2align 2
.L1411:
	add	w4, w4, 1
	add	x0, x9, x5, uxtw
	cmp	w8, w4
	and	w6, w4, 3
	add	x0, x20, x0, lsl 2
	lsl	w2, w6, 3
	beq	.L1405
	ldrb	w3, [x7], 1
	cmp	w6, 3
	ldr	w6, [x0, 604]
	csinc	w5, w5, w5, ne
	lsl	w2, w3, w2
	orr	w2, w6, w2
	str	w2, [x0, 604]
	b	.L1411
.L1404:
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
	bls	.L1425
	ldr	x2, .LC288
	mov	w1, 12894
	mov	w0, 1
	bl	dprint_normal
	mov	x0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1425:
	ldr	x0, .LC286
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx1415
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1415:
	.section	.rodata
	.align	0
	.align	2
.L1415:
	.byte	(.L1419 - .Lrtx1415) / 4
	.byte	(.L1417 - .Lrtx1415) / 4
	.byte	(.L1417 - .Lrtx1415) / 4
	.byte	(.L1418 - .Lrtx1415) / 4
	.text
	.p2align 3
.L1417:
	cmp	w20, 2
	ldr	x0, .LC285
	bhi	.L1422
.L1423:
	add	x0, x0, 144
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1418:
	ldr	x0, .LC285
	cbz	w20, .L1423
.L1422:
	add	x0, x0, 80
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1419:
	ldr	x0, .LC285
	ldp	x19, x20, [sp, 16]
	add	x0, x0, 64
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_GetScalingListDefaultAddress, .-HEVC_GetScalingListDefaultAddress
	.align	3
.LC285:
	.xword	.LANCHOR3
	.align	3
.LC286:
	.xword	.L1415
	.align	3
.LC288:
	.xword	.LC287
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
	beq	.L1436
	sub	w0, w20, #1
	mov	w19, 1
	asr	w0, w0, 1
	cbz	w0, .L1428
	.p2align 2
.L1429:
	asr	w0, w0, 1
	add	w19, w19, 1
	cbnz	w0, .L1429
.L1428:
	ldr	x0, [x22, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cmp	w20, 1
	strb	w0, [x23]
	cset	w24, hi
	cmp	w0, wzr
	cset	w0, ne
	tst	w24, w0
	beq	.L1433
	ldr	w0, [x21, 76]
	cbz	w0, .L1433
	mov	w20, 0
	.p2align 2
.L1434:
	ldr	x0, [x22, 2368]
	mov	w1, w19
	bl	BsGet
	add	x1, x23, x20, uxtw 2
	add	w20, w20, 1
	str	w0, [x1, 4]
	ldr	w0, [x21, 76]
	cmp	w0, w20
	bhi	.L1434
.L1433:
	ldr	w0, [x21, 20]
	cbz	w0, .L1451
.L1432:
	mov	w0, 0
.L1427:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1451:
	ldr	x0, [x22, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, wzr
	strb	w0, [x23, 1]
	cset	w0, ne
	tst	w24, w0
	beq	.L1432
	ldr	w0, [x21, 80]
	cbz	w0, .L1432
	mov	w20, 0
	.p2align 2
.L1435:
	ldr	x0, [x22, 2368]
	mov	w1, w19
	bl	BsGet
	add	x1, x23, x20, uxtw 2
	add	w20, w20, 1
	str	w0, [x1, 132]
	ldr	w0, [x21, 80]
	cmp	w0, w20
	bhi	.L1435
	b	.L1432
.L1436:
	mov	w0, -1
	b	.L1427
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
	ldr	x0, [x19, 2368]
	bl	BsResidBits
	cmp	w0, wzr
	ble	.L1454
	ldr	x1, [x19, 2408]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w1, [x1, 12]
	add	w1, w1, 3
	cmp	w1, w0
	cset	w0, cc
	ret
	.p2align 3
.L1454:
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
	ldr	x0, [x19, 2368]
	ldr	w3, [x0, 24]
	ldr	w4, [x0, 32]
	lsl	w3, w3, 3
	cmp	w3, w4
	bls	.L1458
	mov	w1, 8
	bl	BsShow
	cmp	w0, 128
	cset	w0, ne
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1458:
	ldr	x2, .LC290
	mov	w1, 13669
	mov	w0, 1
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_More_Rbsp_Data, .-HEVC_More_Rbsp_Data
	.align	3
.LC290:
	.xword	.LC289
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
	ldr	w3, [x19, 172]
	ldr	w0, [x19, 152]
	add	w3, w3, 1
	cmp	w3, wzr
	ble	.L1460
	udiv	w1, w0, w3
	mov	w4, 104
	ldr	x5, [x19, 2456]
	msub	w0, w1, w3, w0
	umull	x1, w0, w4
	add	x1, x5, x1
	ldr	w1, [x1, 32]
	cbz	w1, .L1461
	mov	w1, 0
	b	.L1463
	.p2align 3
.L1464:
	udiv	w0, w2, w3
	msub	w0, w0, w3, w2
	umull	x2, w0, w4
	add	x2, x5, x2
	ldr	w2, [x2, 32]
	cbz	w2, .L1461
.L1463:
	add	w1, w1, 1
	cmp	w3, w1
	add	w2, w1, w0
	bne	.L1464
.L1460:
	str	w0, [x19, 152]
.L1475:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1461:
	cmp	w0, w3
	str	w0, [x19, 152]
	bcs	.L1475
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
	cbz	x20, .L1485
	ldr	x24, .LC293
	add	x19, x20, 40
	ldr	x23, .LC295
	add	x22, x20, 104
	stp	wzr, wzr, [x20, 32]
.L1480:
	ldr	x1, [x19]
	mov	w0, w21
	cbz	x1, .L1479
	ldr	w1, [x19, 28]
	bl	SM_ReleaseStreamSeg
	ldr	w5, [x19, 8]
	mov	x3, x24
	ldr	x4, [x19]
	mov	x2, x23
	mov	w1, 13732
	mov	w0, 8
	bl	dprint_normal
	str	xzr, [x19]
	str	wzr, [x19, 8]
	str	wzr, [x19, 20]
.L1479:
	add	x19, x19, 32
	cmp	x19, x22
	bne	.L1480
	ldr	x3, .LC296
	mov	x2, 104
	mov	w1, 0
	mov	x0, x20
	ldr	x3, [x3, 96]
	blr	x3
.L1476:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1485:
	mov	w4, 13722
	ldr	x3, .LC291
	ldr	x2, .LC292
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	b	.L1476
	.size	HEVC_ReleaseNAL, .-HEVC_ReleaseNAL
	.align	3
.LC291:
	.xword	.LC147
	.align	3
.LC292:
	.xword	.LC149
	.align	3
.LC293:
	.xword	.LANCHOR4
	.align	3
.LC295:
	.xword	.LC294
	.align	3
.LC296:
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
	ldr	x0, [x20, 2432]
	mov	w1, -2147483647
	str	w1, [x20, 208]
	ldr	w0, [x0, 184]
	add	w0, w0, 1
	str	w0, [x20, 2800]
	cmp	w0, 17
	bhi	.L1518
.L1487:
	add	x2, x20, 2560
	add	x0, x20, 2960
	add	x1, x20, 3096
	stp	wzr, wzr, [x2, 244]
	stp	wzr, wzr, [x2, 252]
	str	wzr, [x20, 2820]
	.p2align 2
.L1488:
	str	xzr, [x0, -136]
	add	x0, x0, 8
	str	xzr, [x0, -8]
	str	xzr, [x0, 128]
	str	xzr, [x0, 264]
	cmp	x0, x1
	bne	.L1488
	add	x26, x20, 12288
	ldr	x22, .LC300
	add	x19, x26, 3248
	mov	w21, 0
	mov	w25, 20
	mov	w24, 16
	.p2align 2
.L1489:
	ldr	x3, [x22, 96]
	add	x0, x19, 80
	mov	x2, 536
	mov	w1, 0
	mov	w23, 16
	blr	x3
	str	w21, [x19, 168]
	add	w21, w21, 1
	strb	wzr, [x19]
	strb	wzr, [x19, 1]
	cmp	w21, 20
	strb	wzr, [x19, 2]
	str	wzr, [x19, 4]
	stp	w25, w24, [x19, 16]
	str	wzr, [x19, 44]
	str	wzr, [x19, 56]
	str	x19, [x19, 72]
	add	x19, x19, 616
	bne	.L1489
	ldr	x3, [x22, 96]
	mov	w1, 0
	mov	x2, 200
	add	x0, x26, 3048
	blr	x3
	str	w23, [x20, 15336]
	add	x1, x20, 2488
	add	x0, x20, 2624
	str	wzr, [x20, 15340]
.L1491:
	str	xzr, [x1], 8
	cmp	x0, x1
	bne	.L1491
	add	x1, x20, 2760
	str	wzr, [x20, 7076]
	.p2align 2
.L1492:
	str	xzr, [x0], 8
	cmp	x1, x0
	bne	.L1492
	add	x0, x20, 2140
	add	x1, x20, 2220
	str	wzr, [x20, 7080]
	.p2align 2
.L1493:
	str	wzr, [x0], 4
	cmp	x1, x0
	bne	.L1493
	ldr	w3, [x20, 172]
	mov	w19, 0
	cbz	w3, .L1486
	.p2align 2
.L1508:
	ldr	x0, [x20, 2448]
	uxtw	x21, w19
	ldr	x0, [x0, w19, uxtw 3]
	add	w19, w19, 1
	mov	x1, x0
	cbz	x0, .L1495
	ldr	x2, [x20, 2408]
	cmp	x0, x2
	beq	.L1495
	ldr	w0, [x20, 248]
	bl	HEVC_ReleaseNAL
	ldr	x0, [x20, 2448]
	mov	w2, 2
	str	xzr, [x0, x21, lsl 3]
	ldr	w1, [x20, 200]
	ldr	w0, [x20, 232]
	ldr	w4, [x20, 180]
	cmp	w1, wzr
	cset	w7, ne
	cmp	w0, wzr
	cset	w5, ne
	sub	w6, w4, #1
	cmp	w4, 3
	ldr	w3, [x20, 172]
	sub	w1, w1, w7
	csel	w2, w6, w2, cs
	sub	w0, w0, w5
	str	w2, [x20, 180]
	str	w1, [x20, 200]
	str	w0, [x20, 232]
.L1495:
	cmp	w3, w19
	bhi	.L1508
.L1486:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1518:
	ldr	x3, .LC297
	mov	w5, 17
	ldr	x2, .LC299
	mov	w4, w5
	add	x3, x3, 16
	mov	w1, 9966
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 17
	str	w0, [x20, 2800]
	b	.L1487
	.size	HEVC_InitDecBuffers, .-HEVC_InitDecBuffers
	.align	3
.LC297:
	.xword	.LANCHOR4
	.align	3
.LC299:
	.xword	.LC298
	.align	3
.LC300:
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
	cbz	x20, .L1530
	ldr	w3, [x20, 2804]
	mov	w0, 0
	mov	w4, 1
	cbz	w3, .L1525
	.p2align 2
.L1539:
	add	x1, x20, x0, uxtw 3
	add	w0, w0, 1
	ldr	x1, [x1, 2824]
	ldrb	w2, [x1, 2]
	cbnz	w2, .L1523
	strb	w4, [x1, 2]
	ldr	w3, [x20, 2804]
.L1523:
	cmp	w3, w0
	bhi	.L1539
.L1525:
	add	x19, x20, 2824
	add	x21, x20, 2960
	.p2align 2
.L1522:
	ldr	x0, [x19]
	cbz	x0, .L1526
	ldr	w1, [x0, 24]
	ldr	w0, [x20, 248]
	bl	FSP_ClearLogicFs
.L1526:
	ldr	x0, [x19, 136]
	cbz	x0, .L1527
	ldr	w1, [x0, 24]
	ldr	w0, [x20, 248]
	bl	FSP_ClearLogicFs
.L1527:
	ldr	x0, [x19, 272]
	cbz	x0, .L1528
	ldr	w1, [x0, 24]
	ldr	w0, [x20, 248]
	bl	FSP_ClearLogicFs
.L1528:
	ldr	x0, [x19, 408]
	cbz	x0, .L1529
	ldr	w1, [x0, 24]
	ldr	w0, [x20, 248]
	bl	FSP_ClearLogicFs
.L1529:
	str	xzr, [x19, 136]
	str	xzr, [x19, 272]
	str	xzr, [x19, 408]
	str	xzr, [x19], 8
	cmp	x19, x21
	bne	.L1522
	mov	x0, x20
	bl	HEVC_InitDecBuffers
	mov	w0, 0
.L1520:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1530:
	mov	w0, -1
	b	.L1520
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
	ldr	x0, [x19, 2408]
	cbz	x0, .L1549
	ldr	w0, [x0, 48]
	cmp	w0, 4095
	bhi	.L1546
	ldr	x2, .LC304
	mov	w1, 13756
	mov	w0, 8
	bl	dprint_normal
	ldr	x1, [x19, 2408]
	ldr	x3, .LC305
	ldr	w2, [x1, 48]
	ldr	x0, [x1, 72]
	ldr	x3, [x3, 104]
	ldr	x1, [x1, 40]
	sub	x0, x0, x2
	blr	x3
	ldr	x0, [x19, 2408]
	mov	w3, 1
	ldr	w2, [x0, 100]
	ldr	w1, [x0, 68]
	str	w2, [x0, 68]
	ldr	x0, [x19, 2408]
	str	wzr, [x0, 60]
	ldr	x0, [x19, 2408]
	ldr	w4, [x0, 48]
	ldr	x2, [x0, 72]
	sub	x2, x2, x4
	str	x2, [x0, 40]
	ldr	x0, [x19, 2408]
	ldr	w4, [x0, 48]
	ldr	w2, [x0, 84]
	sub	w2, w2, w4
	str	w2, [x0, 52]
	ldr	x0, [x19, 2408]
	ldr	w4, [x0, 48]
	ldr	w2, [x0, 80]
	add	w2, w4, w2
	str	w2, [x0, 48]
	ldr	x0, [x19, 2408]
	str	w3, [x0, 8]
	ldr	w0, [x19, 248]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 2408]
	str	xzr, [x0, 72]
	ldr	x0, [x19, 2408]
	str	wzr, [x0, 92]
	ldr	x0, [x19, 2408]
	str	wzr, [x0, 80]
.L1546:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1549:
	ldr	x2, .LC302
	mov	w1, 13750
	bl	dprint_normal
	b	.L1546
	.size	HEVC_CombinePacket, .-HEVC_CombinePacket
	.align	3
.LC302:
	.xword	.LC301
	.align	3
.LC304:
	.xword	.LC303
	.align	3
.LC305:
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
	cbz	x20, .L1555
	ldr	w3, [x19, 2804]
	cbz	w3, .L1555
	ldr	x0, [x19, 2824]
	cmp	x20, x0
	beq	.L1557
	sub	w3, w3, #1
	mov	x0, x19
	add	x3, x19, x3, lsl 3
	b	.L1552
	.p2align 3
.L1553:
	ldr	x2, [x0, 2824]
	cmp	x20, x2
	beq	.L1557
.L1552:
	cmp	x0, x3
	add	x0, x0, 8
	bne	.L1553
.L1555:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1557:
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
	bls	.L1563
	mov	w0, -4370
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1563:
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
	ldr	x1, .LC307
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1584
.L1569:
	ldr	x0, [x19, 2368]
	mov	w1, 32
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 32
	bl	BsGet
	mov	w0, 0
.L1567:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1584:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 8
	bl	BsGet
	mov	w21, w0
	ldr	x0, [x19, 2368]
	mov	w1, 8
	bl	BsGet
	cmp	w0, 8
	mov	w22, w0
	bhi	.L1585
	ldr	x0, [x19, 2368]
	mov	w1, 8
	bl	BsGet
	cmp	w0, 4
	mov	w1, w0
	mov	w0, 0
	bhi	.L1567
	ldr	x0, .LC310
	ldrb	w0, [x0,w1,uxtw]
	adr	x1, .Lrtx1568
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1568:
	.section	.rodata
	.align	0
	.align	2
.L1568:
	.byte	(.L1569 - .Lrtx1568) / 4
	.byte	(.L1569 - .Lrtx1568) / 4
	.byte	(.L1570 - .Lrtx1568) / 4
	.byte	(.L1571 - .Lrtx1568) / 4
	.byte	(.L1572 - .Lrtx1568) / 4
	.text
	.p2align 3
.L1570:
	mov	w3, 1
	lsl	w22, w3, w22
	cbz	w22, .L1583
	add	w21, w21, 7
	mov	w20, 0
	and	w21, w21, -8
	.p2align 2
.L1574:
	ldr	x0, [x19, 2368]
	mov	w1, w21
	add	w20, w20, 1
	bl	BsGet
	cmp	w22, w20
	bne	.L1574
.L1583:
	mov	w0, 0
.L1586:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1571:
	ldr	x0, [x19, 2368]
	mov	w1, 16
	bl	BsGet
	cmp	w0, 256
	mov	w23, w0
	bhi	.L1576
	cbz	w0, .L1583
	add	w21, w21, 7
	add	w22, w22, 7
	and	w21, w21, -8
	and	w22, w22, -8
	mov	w20, 0
	.p2align 2
.L1578:
	ldr	x0, [x19, 2368]
	mov	w1, w21
	add	w20, w20, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, w22
	bl	BsGet
	cmp	w20, w23
	bne	.L1578
	mov	w0, 0
	b	.L1586
	.p2align 3
.L1572:
	ldr	x0, [x19, 2368]
	mov	w1, 8
	bl	BsGet
	cmp	w0, 255
	beq	.L1587
.L1579:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 32
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 32
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 16
	bl	BsGet
	mov	w0, 0
	b	.L1586
	.p2align 3
.L1587:
	ldr	x0, [x19, 2368]
	mov	w1, 32
	bl	BsGet
	b	.L1579
.L1585:
	ldr	x2, .LC309
	mov	w3, w0
	mov	w1, 5497
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1567
.L1576:
	ldr	x2, .LC312
	mov	w1, 5531
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1567
	.size	HEVC_Sei_Tone_Mapping_Info, .-HEVC_Sei_Tone_Mapping_Info
	.align	3
.LC307:
	.xword	.LC306
	.align	3
.LC309:
	.xword	.LC308
	.align	3
.LC310:
	.xword	.L1568
	.align	3
.LC312:
	.xword	.LC311
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
	ldr	x1, .LC314
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L1589
	ldr	x0, [x19, 2368]
	mov	w1, 7
	bl	BsGet
	mov	w21, w0
	sub	w0, w0, #3
	cmp	w0, 2
	bhi	.L1596
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w20, w0
	ldr	x0, [x19, 2368]
	mov	w1, 6
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	cmp	w20, wzr
	ccmp	w21, 5, 4, eq
	bne	.L1597
.L1592:
	ldr	x0, [x19, 2368]
	mov	w1, 8
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
.L1589:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	bl	BsToNextByte
	mov	w0, 0
.L1591:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1597:
	ldr	x0, [x19, 2368]
	mov	w1, 4
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 4
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 4
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 4
	bl	BsGet
	b	.L1592
	.p2align 3
.L1596:
	ldr	x2, .LC316
	mov	w3, w21
	mov	w1, 5687
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1591
	.size	HEVC_Sei_Frame_Packing_Arrangement, .-HEVC_Sei_Frame_Packing_Arrangement
	.align	3
.LC314:
	.xword	.LC313
	.align	3
.LC316:
	.xword	.LC315
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
	beq	.L1602
	ldr	x1, .LC318
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	ldrb	w0, [x20, 3]
	cbnz	w0, .L1609
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L1610
.L1601:
	ldr	x0, [x19, 2368]
	bl	BsToNextByte
	mov	w0, 0
.L1599:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1609:
	ldr	w1, [x20, 4]
	ldr	x0, [x19, 2368]
	add	w1, w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1601
.L1610:
	ldr	w1, [x20, 8]
	ldr	x0, [x19, 2368]
	add	w1, w1, 1
	bl	BsGet
	b	.L1601
	.p2align 3
.L1602:
	mov	w0, -1
	b	.L1599
	.size	HEVC_Sei_Dec_Unit_Info, .-HEVC_Sei_Dec_Unit_Info
	.align	3
.LC318:
	.xword	.LC317
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
	ldr	x0, [x20, 2368]
	mov	w1, 4
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x1, .LC320
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 15
	bgt	.L1612
	tbnz	w0, #31, .L1616
	ldr	x22, .LC324
	add	w21, w0, 1
	mov	w19, 0
	.p2align 2
.L1615:
	ldr	x0, [x20, 2368]
	mov	x1, x22
	add	w19, w19, 1
	bl	HEVC_ue_v
	cmp	w21, w19
	bne	.L1615
.L1616:
	ldr	x0, [x20, 2368]
	bl	BsToNextByte
	mov	w0, 0
.L1614:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1612:
	ldr	x2, .LC322
	mov	w1, 5777
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1614
	.size	HEVC_Sei_Active_Param_sets, .-HEVC_Sei_Active_Param_sets
	.align	3
.LC320:
	.xword	.LC319
	.align	3
.LC322:
	.xword	.LC321
	.align	3
.LC324:
	.xword	.LC323
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
	ldr	x1, .LC326
	ldr	x0, [x19, 2368]
	str	wzr, [x19, 13928]
	bl	HEVC_ue_v
	cmp	w0, 15
	bhi	.L1644
	add	x0, x19, 12288
	mov	w1, 1
	mov	w24, 0
	strb	w1, [x0, 1633]
	ldrb	w0, [x22, 2]
	cbz	w0, .L1645
.L1621:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	mov	w21, w1
	mov	w20, 0
	bl	BsGet
	strb	w0, [x23]
	ldr	w1, [x22, 16]
	ldr	x0, [x19, 2368]
	add	w1, w1, w21
	bl	BsGet
.L1622:
	cbz	w20, .L1646
	cmp	w20, 1
	beq	.L1647
.L1627:
	cmp	w21, 1
	bhi	.L1626
.L1625:
	add	w20, w20, 1
	add	w21, w21, 1
	b	.L1622
	.p2align 3
.L1626:
	ldr	x0, [x19, 2368]
	bl	BsToNextByte
	mov	w0, 0
.L1642:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1645:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w24, w0
	cbz	w24, .L1621
	ldr	w1, [x22, 16]
	ldr	x0, [x19, 2368]
	add	w1, w1, 1
	bl	BsGet
	ldr	w1, [x22, 20]
	ldr	x0, [x19, 2368]
	add	w1, w1, 1
	bl	BsGet
	b	.L1621
.L1644:
	ldr	x2, .LC328
	mov	w3, w0
	mov	w1, 5805
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1642
.L1646:
	ldrb	w0, [x22]
	cbz	w0, .L1627
	ldr	w0, [x22, 24]
	mov	w23, 0
	cmn	w0, #1
	bne	.L1630
	b	.L1625
	.p2align 3
.L1629:
	ldr	w0, [x22, 24]
	add	w0, w0, 1
	cmp	w0, w23
	bls	.L1627
.L1630:
	ldr	w1, [x22, 12]
	add	w23, w23, 1
	ldr	x0, [x19, 2368]
	add	w1, w1, 1
	bl	BsGet
	ldr	w1, [x22, 12]
	ldr	x0, [x19, 2368]
	add	w1, w1, 1
	bl	BsGet
	ldrb	w0, [x22, 2]
	orr	w0, w0, w24
	cbz	w0, .L1629
	ldr	w1, [x22, 12]
	ldr	x0, [x19, 2368]
	add	w1, w1, 1
	bl	BsGet
	ldr	w1, [x22, 12]
	ldr	x0, [x19, 2368]
	add	w1, w1, 1
	bl	BsGet
	b	.L1629
.L1647:
	ldrb	w0, [x22, 1]
	cbz	w0, .L1626
	ldr	w0, [x22, 24]
	cmn	w0, #1
	beq	.L1626
	mov	w23, 0
	b	.L1630
	.size	HEVC_Sei_Buf_Period, .-HEVC_Sei_Buf_Period
	.align	3
.LC326:
	.xword	.LC325
	.align	3
.LC328:
	.xword	.LC327
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
	stp	x25, x26, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x2
	mov	x22, x1
	bl	_mcount
	ldr	w1, [x19, 13924]
	ldr	w0, [x19, 13928]
	add	w1, w1, 1
	str	w1, [x19, 13924]
	add	w0, w0, 1
	str	w0, [x19, 13928]
	ldrb	w0, [x20, 2]
	cbnz	w0, .L1675
.L1649:
	ldrh	w0, [x20, 44]
	add	x21, x20, 44
	cbz	w0, .L1651
	ldr	w1, [x21, 16]
	ldr	x0, [x19, 2368]
	add	w1, w1, 1
	bl	BsGet
	add	w0, w0, 1
	str	w0, [x22, 8]
	ldr	w1, [x21, 20]
	ldr	x0, [x19, 2368]
	add	w1, w1, 1
	bl	BsGet
	str	w0, [x22, 12]
	ldrb	w0, [x21, 2]
	cbnz	w0, .L1652
.L1655:
	ldrsw	x1, [x19, 248]
	ldr	x0, .LC329
	ldr	x0, [x0, x1, lsl 3]
	add	x0, x0, 217088
	ldrsb	w1, [x0, 3072]
	cmp	w1, 1
	beq	.L1676
.L1651:
	ldr	x0, [x19, 2368]
	bl	BsToNextByte
	mov	w0, 0
.L1658:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1675:
	ldr	x0, [x19, 2368]
	mov	w1, 4
	bl	BsGet
	str	w0, [x22]
	mov	w1, 2
	ldr	x0, [x19, 2368]
	bl	BsGet
	str	w0, [x22, 4]
	mov	w1, 1
	ldr	x0, [x19, 2368]
	bl	BsGet
	b	.L1649
	.p2align 3
.L1676:
	ldr	w1, [x0, 3188]
	cmp	w1, 1
	bne	.L1651
	ldr	w0, [x0, 3192]
	cmp	w0, 2
	bne	.L1651
	mov	x2, x20
	mov	x1, x22
	mov	x0, x19
	bl	HEVC_Sei_Get_Dpb_Output_Time
	b	.L1651
	.p2align 3
.L1652:
	ldr	w1, [x21, 8]
	ldr	x0, [x19, 2368]
	add	w1, w1, 1
	bl	BsGet
	ldrb	w0, [x21, 2]
	cbz	w0, .L1655
	ldrb	w0, [x21, 3]
	cbz	w0, .L1655
	ldr	x1, .LC331
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	mov	w24, w0
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w25, w0
	cbnz	w25, .L1677
.L1656:
	cmp	w24, 255
	bhi	.L1678
	ldr	x26, .LC335
	add	w24, w24, 1
	mov	w23, 0
	b	.L1660
	.p2align 3
.L1659:
	cmp	w23, w24
	beq	.L1655
.L1660:
	ldr	x0, [x19, 2368]
	mov	x1, x26
	add	w23, w23, 1
	bl	HEVC_ue_v
	cbnz	w25, .L1659
	ldr	w1, [x21, 4]
	ldr	x0, [x19, 2368]
	add	w1, w1, 1
	bl	BsGet
	b	.L1659
	.p2align 3
.L1677:
	ldr	w1, [x21, 4]
	ldr	x0, [x19, 2368]
	add	w1, w1, 1
	bl	BsGet
	b	.L1656
.L1678:
	ldr	x2, .LC333
	mov	w1, 5894
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1658
	.size	HEVC_Sei_Pic_Timming, .-HEVC_Sei_Pic_Timming
	.align	3
.LC329:
	.xword	s_pstVfmwChan
	.align	3
.LC331:
	.xword	.LC330
	.align	3
.LC333:
	.xword	.LC332
	.align	3
.LC335:
	.xword	.LC334
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
	beq	.L1692
	ldr	x1, .LC337
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1681
.L1690:
	mov	w1, 1
	mov	w0, 0
	strb	w1, [x20]
.L1680:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1681:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	beq	.L1699
.L1682:
	ldr	x0, [x19, 2368]
	mov	w1, 8
	bl	BsGet
	strb	w0, [x20, 2]
	mov	w1, 8
	ldr	x0, [x19, 2368]
	bl	BsGet
	strb	w0, [x20, 3]
	mov	w1, 8
	ldr	x0, [x19, 2368]
	bl	BsGet
	strb	w0, [x20, 4]
	mov	w1, 8
	ldr	x0, [x19, 2368]
	bl	BsGet
	strb	w0, [x20, 5]
	mov	w1, 8
	ldr	x0, [x19, 2368]
	bl	BsGet
	strb	w0, [x20, 6]
	mov	w1, 4
	ldr	x0, [x19, 2368]
	bl	BsGet
	uxtb	w1, w0
	cmp	w1, 10
	strb	w1, [x20, 7]
	bhi	.L1683
	and	w0, w0, 255
	mov	w21, 0
	cbz	w0, .L1688
	.p2align 2
.L1694:
	add	x22, x20, x21, uxtw
	ldr	x0, [x19, 2368]
	mov	w1, 8
	add	w21, w21, 1
	bl	BsGet
	strb	w0, [x22, 8]
	mov	w1, 8
	ldr	x0, [x19, 2368]
	bl	BsGet
	strb	w0, [x22, 18]
	ldrb	w0, [x20, 7]
	cmp	w0, w21
	bhi	.L1694
.L1688:
	ldr	x0, [x19, 2368]
	mov	w1, 4
	bl	BsGet
	uxtb	w1, w0
	cmp	w1, 6
	strb	w1, [x20, 28]
	bhi	.L1700
	and	w0, w0, 255
	mov	w21, 0
	cbz	w0, .L1690
	.p2align 2
.L1693:
	add	x22, x20, x21, uxtw
	ldr	x0, [x19, 2368]
	mov	w1, 8
	add	w21, w21, 1
	bl	BsGet
	strb	w0, [x22, 29]
	mov	w1, 8
	ldr	x0, [x19, 2368]
	bl	BsGet
	strb	w0, [x22, 35]
	ldrb	w0, [x20, 28]
	cmp	w0, w21
	bhi	.L1693
	b	.L1690
	.p2align 3
.L1692:
	mov	w0, -1
	b	.L1680
	.p2align 3
.L1699:
	ldr	x0, [x19, 2368]
	mov	w1, 8
	bl	BsGet
	strb	w0, [x20, 1]
	mov	w1, 8
	ldr	x0, [x19, 2368]
	bl	BsGet
	b	.L1682
.L1683:
	ldr	x2, .LC339
	uxtb	w3, w0
	mov	w1, 5976
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1680
.L1700:
	ldr	x2, .LC341
	uxtb	w3, w0
	mov	w1, 5990
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1680
	.size	HEVC_Sei_Color_Volume_Reconstruction_Info, .-HEVC_Sei_Color_Volume_Reconstruction_Info
	.align	3
.LC337:
	.xword	.LC336
	.align	3
.LC339:
	.xword	.LC338
	.align	3
.LC341:
	.xword	.LC340
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
	beq	.L1710
	cmp	w21, 3
	bls	.L1715
	ldr	x0, [x20, 2368]
	mov	w1, 8
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 8
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1716
	cmp	w0, 2
	beq	.L1717
	cmp	w0, 4
	beq	.L1718
	subs	w21, w21, #4
	beq	.L1708
	mov	w19, 0
	.p2align 2
.L1709:
	ldr	x0, [x20, 2368]
	mov	w1, 8
	add	w19, w19, 1
	bl	BsGet
	cmp	w21, w19
	bne	.L1709
.L1708:
	mov	w0, 0
.L1702:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1716:
	ldr	x0, [x20, 2368]
	mov	w1, 8
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L1708
	add	x1, x20, 3960
	mov	x0, x20
	bl	HEVC_Sei_HDR10PLUS
	cmn	w0, #1
	csetm	w0, eq
	b	.L1702
	.p2align 3
.L1718:
	add	x1, x20, 3427
	mov	x0, x20
	bl	HEVC_Sei_Color_Volume_Reconstruction_Info
	cmn	w0, #1
	csetm	w0, eq
	b	.L1702
	.p2align 3
.L1717:
	add	x1, x20, 3424
	mov	x0, x20
	bl	HEVC_Sei_TSI
	cmn	w0, #1
	csetm	w0, eq
	b	.L1702
.L1710:
	mov	w0, -1
	b	.L1702
.L1715:
	ldr	x2, .LC343
	mov	w1, 6133
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1702
	.size	HEVC_Sei_User_Data_Registered_Itu_T_T35, .-HEVC_Sei_User_Data_Registered_Itu_T_T35
	.align	3
.LC343:
	.xword	.LC342
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
	cbnz	w20, .L1770
.L1720:
	ldr	x1, .LC357
	ldr	x0, [x22, 2368]
	bl	HEVC_ue_v
	cmp	w0, 16
	str	w0, [x19]
	bhi	.L1771
	ldr	x1, .LC361
	ldr	x0, [x22, 2368]
	bl	HEVC_ue_v
	cmp	w0, 16
	str	w0, [x19, 4]
	bhi	.L1772
	ldr	w1, [x19]
	add	w3, w0, w1
	str	w3, [x19, 8]
	cmp	w3, 16
	bhi	.L1745
	mov	w20, 0
	cbz	w1, .L1747
	ldr	x25, .LC367
	mov	w21, 0
	mov	w23, 0
	mov	w24, 32767
	b	.L1749
	.p2align 3
.L1748:
	str	w23, [x19, x2, lsl 2]
	add	x20, x19, x20
	ldr	x0, [x22, 2368]
	bl	BsGet
	strb	w0, [x20, 12]
	ldr	w20, [x19]
	cmp	w20, w21
	bls	.L1773
.L1749:
	ldr	x0, [x22, 2368]
	mov	x1, x25
	uxtw	x20, w21
	add	w21, w21, 1
	bl	HEVC_ue_v
	cmp	w0, w24
	mvn	w1, w0
	add	x2, x20, 8
	add	w23, w23, w1
	mov	w1, 1
	bls	.L1748
	ldr	x2, .LC369
	mov	w3, w0
	mov	w1, 13074
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
.L1770:
	ldr	x0, [x22, 2368]
	mov	w1, 1
	bl	BsGet
	cbz	w0, .L1720
	ldr	w0, [x27, 176]
	cmp	w20, w0
	beq	.L1774
	sub	w20, w20, #1
.L1724:
	ldr	x0, [x22, 2368]
	mov	w1, 1
	bl	BsGet
	mov	w25, w0
	ldr	x1, .LC351
	ldr	x0, [x22, 2368]
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
	ldr	w3, [x28, 2156]
	cmp	w3, 16
	bhi	.L1775
	mov	w21, 0
	mov	w26, 0
	mov	w20, 0
	mov	w23, 0
	b	.L1731
	.p2align 3
.L1726:
	sub	w1, w0, #1
	cmp	w1, 1
	bls	.L1776
.L1727:
	ldr	w0, [x28, 2156]
	add	w21, w21, 1
	cmp	w0, w21
	bcc	.L1777
.L1731:
	ldr	x0, [x22, 2368]
	mov	w1, 1
	bl	BsGet
	cbnz	w0, .L1726
	ldr	x0, [x22, 2368]
	mov	w1, 1
	bl	BsGet
	lsl	w0, w0, 1
	sub	w1, w0, #1
	cmp	w1, 1
	bhi	.L1727
.L1776:
	ldr	w5, [x28, 2156]
	add	x1, x24, x21, uxtw
	uxtw	x2, w23
	cmp	w5, w21
	add	x4, x2, 8
	add	x3, x19, x2
	add	x2, x27, x1, lsl 2
	mov	w1, 0
	bls	.L1728
	ldr	w1, [x2, 2180]
.L1728:
	cmp	w0, 1
	add	w0, w1, w25
	str	w0, [x19, x4, lsl 2]
	cset	w1, eq
	strb	w1, [x3, 12]
	tbnz	w0, #31, .L1778
	add	w26, w26, 1
	add	w23, w23, 1
.L1779:
	ldr	w0, [x28, 2156]
	add	w21, w21, 1
	cmp	w0, w21
	bcs	.L1731
.L1777:
	cmp	w23, 16
	str	w23, [x19, 8]
	ccmp	w20, 16, 2, ls
	ccmp	w26, 16, 2, ls
	stp	w20, w26, [x19]
	bhi	.L1732
	cmp	w23, 1
	bls	.L1738
	sub	w10, w23, #2
	add	x9, x19, 36
	add	x10, x10, 1
	mov	x7, 0
	.p2align 2
.L1737:
	add	x0, x19, x7
	mov	w3, w7
	ldr	w5, [x9]
	ldrb	w8, [x0, 13]
	tbnz	w7, #31, .L1741
	.p2align 2
.L1760:
	sxtw	x1, w3
	add	w0, w3, 1
	add	x4, x19, x1
	add	x1, x19, x1, lsl 2
	sxtw	x0, w0
	add	x6, x0, 8
	add	x0, x19, x0
	ldr	w2, [x1, 32]
	cmp	w5, w2
	bge	.L1739
	str	w2, [x19, x6, lsl 2]
	ldrb	w2, [x4, 12]
	strb	w2, [x0, 12]
	str	w5, [x1, 32]
	strb	w8, [x4, 12]
.L1739:
	subs	w3, w3, #1
	bpl	.L1760
.L1741:
	add	x7, x7, 1
	add	x9, x9, 4
	cmp	x10, x7
	bne	.L1737
.L1738:
	sub	w1, w20, #1
	lsr	w20, w20, 1
	cmp	w1, wzr
	ccmp	w20, wzr, 4, ge
	beq	.L1735
	add	x4, x19, 32
	add	x3, x19, 12
	mov	w2, 0
	.p2align 2
.L1742:
	sxtw	x0, w1
	ldrb	w6, [x3]
	add	x5, x19, x0
	ldr	w7, [x4]
	add	x0, x19, x0, lsl 2
	add	w2, w2, 1
	sub	w1, w1, #1
	cmp	w2, w20
	ccmp	w1, wzr, 1, cc
	ldr	w8, [x0, 32]
	str	w8, [x4], 4
	ldrb	w8, [x5, 12]
	strb	w8, [x3], 1
	str	w7, [x0, 32]
	strb	w6, [x5, 12]
	bge	.L1742
.L1735:
	mov	w0, 0
.L1768:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L1778:
	add	w20, w20, 1
	add	w23, w23, 1
	b	.L1779
.L1773:
	ldr	w3, [x19, 8]
.L1747:
	cmp	w3, w20
	bls	.L1735
	mov	w24, 0
	ldr	x25, .LC371
	b	.L1753
	.p2align 3
.L1750:
	cmp	w6, w0
	bhi	.L1780
	adds	w0, w6, w24
	bmi	.L1781
	str	w0, [x19, x2, lsl 2]
	mov	w24, w0
	add	x21, x19, x21
	ldr	x0, [x22, 2368]
	bl	BsGet
	strb	w0, [x21, 12]
	ldr	w0, [x19, 8]
	cmp	w0, w20
	bls	.L1735
.L1753:
	ldr	x0, [x22, 2368]
	mov	x1, x25
	uxtw	x21, w20
	add	w20, w20, 1
	bl	HEVC_ue_v
	mov	w23, w0
	cmn	w23, #1
	mov	w1, 1
	add	w6, w0, w1
	add	x2, x21, 8
	mvn	w0, w24
	bne	.L1750
	ldr	x3, .LC372
	mov	w4, 13094
	ldr	x2, .LC374
	mov	w1, w4
	add	x3, x3, 40
	mov	w0, 1
	bl	dprint_normal
	mov	w0, w23
	b	.L1768
.L1774:
	ldr	x1, .LC345
	ldr	x0, [x22, 2368]
	bl	HEVC_ue_v
	add	w3, w0, 1
	cmp	w20, w3
	bcc	.L1782
	sub	w4, w20, #1
	sub	w20, w4, w0
	cmp	w20, w4
	bls	.L1724
	ldr	x2, .LC349
	mov	w3, w20
	mov	w1, 12952
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1768
.L1732:
	ldr	x2, .LC355
	mov	w1, 13004
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1768
.L1772:
	ldr	x2, .LC363
	mov	w1, 13056
	ldr	w3, [x19]
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1768
.L1781:
	ldr	x3, .LC372
	mov	w4, 13109
	ldr	x2, .LC378
.L1769:
	mov	w5, w24
	add	x3, x3, 40
	mov	w1, w4
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1768
.L1780:
	ldr	x3, .LC372
	mov	w4, 13102
	ldr	x2, .LC376
	b	.L1769
.L1782:
	ldr	x2, .LC347
	mov	w4, w20
	mov	w1, 12944
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1768
.L1775:
	ldr	x2, .LC353
	mov	w1, 12964
	mov	w0, w4
	bl	dprint_normal
	mov	w0, -1
	b	.L1768
.L1771:
	ldr	x2, .LC359
	mov	w3, w0
	mov	w1, 13048
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1768
.L1745:
	ldr	x2, .LC365
	mov	w4, 16
	mov	w1, 13064
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1768
	.size	HEVC_DecShortTermRefPicSet, .-HEVC_DecShortTermRefPicSet
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
.LC361:
	.xword	.LC360
	.align	3
.LC363:
	.xword	.LC362
	.align	3
.LC365:
	.xword	.LC364
	.align	3
.LC367:
	.xword	.LC366
	.align	3
.LC369:
	.xword	.LC368
	.align	3
.LC371:
	.xword	.LC370
	.align	3
.LC372:
	.xword	.LANCHOR4
	.align	3
.LC374:
	.xword	.LC373
	.align	3
.LC376:
	.xword	.LC375
	.align	3
.LC378:
	.xword	.LC377
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
	beq	.L1806
	cbnz	w19, .L1830
.L1786:
	ldr	x27, .LC382
	mov	w19, 0
	ldr	x25, .LC380
	ldr	x26, .LC384
	ldr	x28, .LC386
	.p2align 2
.L1802:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	uxtw	x21, w19
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1831
	add	x0, x22, x21, lsl 2
	str	wzr, [x0, 24]
.L1805:
	ldr	x0, [x20, 2368]
	mov	x1, x25
	bl	HEVC_ue_v
.L1792:
	ldr	x0, [x20, 2368]
	mov	x1, x27
	bl	HEVC_ue_v
	add	x1, x22, x21, lsl 2
	str	w0, [x1, 24]
.L1793:
	cmp	w0, 31
	bhi	.L1832
	mov	w24, 0
.L1795:
	cbz	w24, .L1833
	cmp	w24, 1
	beq	.L1828
.L1801:
	add	w24, w24, 1
	cmp	w24, 2
	bne	.L1795
.L1800:
	add	w19, w19, 1
	cmp	w23, w19
	bcs	.L1802
	mov	w0, 0
.L1827:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1832:
	mov	w3, w0
	mov	x2, x26
	mov	w1, 13616
	mov	w0, 1
	mov	w24, 0
	bl	dprint_normal
	add	x0, x22, x21, lsl 2
	str	wzr, [x0, 24]
	b	.L1795
	.p2align 3
.L1831:
	add	x24, x22, x21, lsl 2
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	str	wzr, [x24, 24]
	uxtb	w0, w0
	cbnz	w0, .L1805
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1792
	ldr	w0, [x24, 24]
	b	.L1793
	.p2align 3
.L1830:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x22]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x22, 1]
	ldrh	w0, [x22]
	cbz	w0, .L1786
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x22, 2]
	cbnz	w0, .L1834
.L1788:
	ldr	x0, [x20, 2368]
	mov	w1, 4
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 4
	bl	BsGet
	ldrb	w0, [x22, 2]
	cbnz	w0, .L1835
.L1789:
	ldr	x0, [x20, 2368]
	mov	w1, 5
	bl	BsGet
	str	w0, [x22, 12]
	mov	w1, 5
	ldr	x0, [x20, 2368]
	bl	BsGet
	str	w0, [x22, 16]
	mov	w1, 5
	ldr	x0, [x20, 2368]
	bl	BsGet
	str	w0, [x22, 20]
	b	.L1786
.L1806:
	mov	w0, -1
	b	.L1827
.L1835:
	ldr	x0, [x20, 2368]
	mov	w1, 4
	bl	BsGet
	b	.L1789
.L1834:
	ldr	x0, [x20, 2368]
	mov	w1, 8
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 5
	bl	BsGet
	str	w0, [x22, 4]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x22, 3]
	mov	w1, 5
	ldr	x0, [x20, 2368]
	bl	BsGet
	str	w0, [x22, 8]
	b	.L1788
.L1833:
	ldrb	w0, [x22]
	cbnz	w0, .L1808
	mov	w24, 1
.L1828:
	ldrb	w0, [x22, 1]
	cbz	w0, .L1800
.L1808:
	add	x0, x21, 4
	str	wzr, [x29, 108]
	lsl	x0, x0, 2
	str	x0, [x29, 96]
	b	.L1804
.L1803:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x29, 96]
	ldr	w1, [x29, 108]
	add	x0, x22, x0
	ldr	w0, [x0, 8]
	cmp	w0, w1
	bcc	.L1801
.L1804:
	ldr	w2, [x29, 108]
	mov	x1, x28
	ldr	x0, [x20, 2368]
	add	w2, w2, 1
	str	w2, [x29, 108]
	bl	HEVC_ue_v
	ldr	x1, .LC388
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	ldrb	w0, [x22, 2]
	cbz	w0, .L1803
	ldr	x1, .LC390
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	ldr	x1, .LC392
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	b	.L1803
	.size	HEVC_DecHrdParam, .-HEVC_DecHrdParam
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
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x21, 3]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	uxtb	w1, w0
	cmp	w1, 1
	beq	.L1837
	ldr	x2, .LC394
	mov	w3, w1
	mov	w0, 1
	mov	w1, 3601
	bl	dprint_normal
.L1837:
	ldr	x0, [x20, 2368]
	mov	w1, 6
	bl	BsGet
	cmp	w0, 63
	str	w0, [x21, 8]
	bhi	.L1884
	ldr	x0, [x20, 2368]
	mov	w1, 3
	bl	BsGet
	cmp	w0, 6
	mov	w24, w0
	bhi	.L1885
	str	w0, [x21, 12]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x21, 1]
	mov	w1, 16
	ldr	x0, [x20, 2368]
	bl	BsGet
	mov	w1, 65535
	cmp	w0, w1
	bne	.L1886
	mov	w3, w24
	mov	w2, 1
	add	x1, x21, 112
	mov	x0, x20
	bl	HEVC_DecPTL
	cbnz	w0, .L1887
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w25, w0
	tbnz	w24, #31, .L1847
	ldr	x28, .LC406
	add	w23, w24, 1
	ldr	x27, .LC408
	mov	w19, 0
	ldr	x26, .LC410
	b	.L1849
	.p2align 3
.L1846:
	cmp	w23, w19
	beq	.L1847
.L1849:
	add	x22, x21, x19, sxtw 2
	ldr	x0, [x20, 2368]
	mov	x1, x28
	add	w19, w19, 1
	bl	HEVC_ue_v
	add	w0, w0, 1
	str	w0, [x22, 28]
	mov	x1, x27
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	str	w0, [x22, 56]
	mov	x1, x26
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	str	w0, [x22, 84]
	cbnz	w25, .L1846
	cmp	w24, w19
	blt	.L1847
	.p2align 2
.L1872:
	add	x0, x21, x19, sxtw 2
	ldr	w1, [x21, 28]
	add	w19, w19, 1
	cmp	w23, w19
	str	w1, [x0, 28]
	ldr	w1, [x21, 56]
	str	w1, [x0, 56]
	ldr	w1, [x21, 84]
	str	w1, [x0, 84]
	bne	.L1872
.L1847:
	ldr	x0, [x20, 2368]
	mov	w1, 6
	bl	BsGet
	str	w0, [x21, 16]
	ldr	x1, .LC404
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 1023
	str	w0, [x21, 20]
	bhi	.L1888
	cmp	w0, wzr
	mov	w22, 1
	ble	.L1851
	.p2align 2
.L1871:
	mov	w19, 0
	.p2align 2
.L1852:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	add	w19, w19, w1
	bl	BsGet
	ldr	w0, [x21, 16]
	cmp	w0, w19
	bcs	.L1852
	ldr	w0, [x21, 20]
	add	w22, w22, 1
	cmp	w0, w22
	bge	.L1871
.L1851:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1860
	ldr	x0, [x20, 2368]
	mov	w1, 32
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 32
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L1889
.L1857:
	ldr	x1, .LC416
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 1024
	str	w0, [x21, 24]
	bhi	.L1858
	cmp	w0, wzr
	ble	.L1860
	ldr	x22, .LC420
	mov	w19, 0
	ldr	x0, [x20, 2368]
	mov	x1, x22
	bl	HEVC_ue_v
	mov	w2, 1
	.p2align 2
.L1865:
	mov	w3, w24
	add	x1, x29, 104
	mov	x0, x20
	add	w19, w19, 1
	bl	HEVC_DecHrdParam
	cbnz	w0, .L1890
.L1862:
	ldr	w0, [x21, 24]
	mov	x1, x22
	cmp	w0, w19
	ble	.L1860
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	mov	w2, 1
	cbz	w19, .L1865
	ldr	x0, [x20, 2368]
	mov	w1, w2
	add	w19, w19, 1
	bl	BsGet
	mov	w2, w0
	mov	w3, w24
	add	x1, x29, 104
	mov	x0, x20
	bl	HEVC_DecHrdParam
	cbz	w0, .L1862
.L1890:
	ldr	x2, .LC422
	mov	w1, 3733
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
.L1860:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1856
	.p2align 2
.L1880:
	ldr	x0, [x20, 2368]
	bl	BsResidBits
	cmp	w0, wzr
	ble	.L1856
	ldr	x2, [x20, 2408]
	mov	w1, 1
	ldr	w2, [x2, 12]
	add	w2, w2, 3
	cmp	w2, w0
	bcc	.L1891
.L1856:
	mov	w0, 0
.L1881:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L1891:
	ldr	x0, [x20, 2368]
	bl	BsGet
	b	.L1880
.L1889:
	ldr	x1, .LC414
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	b	.L1857
.L1886:
	ldr	x2, .LC400
	mov	w1, 3628
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1881
.L1884:
	ldr	x2, .LC396
	mov	w3, w0
	mov	w1, 3608
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1881
.L1887:
	ldr	x2, .LC402
	mov	w1, 3636
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1881
.L1885:
	ldr	x2, .LC398
	mov	w3, w0
	mov	w4, 6
	mov	w1, 3616
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1881
.L1888:
	ldr	x2, .LC412
	mov	w3, w0
	mov	w4, 1024
	mov	w1, 3677
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1881
.L1858:
	ldr	x2, .LC418
	mov	w3, w0
	mov	w4, 1024
	mov	w1, 3712
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1881
	.size	HEVC_ProcessVPS, .-HEVC_ProcessVPS
	.align	3
.LC394:
	.xword	.LC393
	.align	3
.LC396:
	.xword	.LC395
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecVPS
	.type	HEVC_DecVPS, %function
HEVC_DecVPS:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x20, 2368]
	mov	w1, 4
	bl	BsGet
	cmp	w0, 15
	mov	w21, w0
	bhi	.L1898
	uxtw	x19, w0
	ldr	x1, [x20, 2376]
	lsl	x0, x19, 4
	sub	x19, x0, x19
	lsl	x19, x19, 3
	add	x2, x1, x19
	ldrb	w0, [x1, x19]
	cbnz	w0, .L1899
	str	w21, [x2, 4]
	mov	x0, x20
	ldr	x1, [x20, 2376]
	add	x1, x1, x19
	bl	HEVC_ProcessVPS
	mov	w22, w0
	cbnz	w0, .L1900
	ldr	x0, [x20, 2376]
	mov	w1, 1
	add	x0, x0, x19
	strb	w1, [x0, 2]
	ldr	x0, [x20, 2376]
	strb	w1, [x0, x19]
.L1894:
	mov	w0, w22
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1899:
	ldr	x25, .LC425
	mov	x2, 120
	ldr	x24, .LC426
	mov	w1, 0
	add	x23, x24, 1280
	ldr	x3, [x25, 96]
	mov	x0, x23
	blr	x3
	str	w21, [x23, 4]
	mov	x1, x23
	mov	x0, x20
	bl	HEVC_ProcessVPS
	mov	w22, w0
	cbnz	w0, .L1901
	ldr	x0, [x20, 2376]
	mov	w1, 1
	ldr	x3, [x25, 112]
	mov	x2, 120
	strb	w1, [x23, 2]
	add	x0, x0, x19
	strb	w1, [x24, 1280]
	mov	x1, x23
	blr	x3
	ldr	x25, [sp, 64]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1901:
	ldr	x2, .LC428
	mov	w3, w21
	mov	w1, 3794
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	b	.L1894
	.p2align 3
.L1898:
	ldr	x2, .LC424
	mov	w1, 3780
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	b	.L1894
.L1900:
	ldr	x2, .LC430
	mov	w1, 3809
	mov	w3, w21
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	ldr	x0, [x20, 2376]
	mov	w1, 1
	add	x0, x0, x19
	strb	w1, [x0, 2]
	ldr	x0, [x20, 2376]
	strb	wzr, [x0, x19]
	b	.L1894
	.size	HEVC_DecVPS, .-HEVC_DecVPS
	.align	3
.LC424:
	.xword	.LC423
	.align	3
.LC425:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC426:
	.xword	.LANCHOR5
	.align	3
.LC428:
	.xword	.LC427
	.align	3
.LC430:
	.xword	.LC429
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
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L1948
.L1904:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L1949
.L1907:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L1950
.L1909:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L1951
.L1911:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x20, 3]
	mov	w1, 1
	ldr	x0, [x19, 2368]
	bl	BsGet
	strb	w0, [x20, 2]
	mov	w1, 1
	ldr	x0, [x19, 2368]
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1912
	ldr	x1, .LC439
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	ldr	w0, [x21, 60]
	cmp	w0, 3
	bhi	.L1952
	ldr	x1, .LC443
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	ldr	x1, .LC445
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	ldr	x1, .LC447
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
.L1912:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1915
	ldr	x0, [x19, 2368]
	mov	w1, 32
	bl	BsGet
	str	w0, [x20, 36]
	mov	w1, 32
	ldr	x0, [x19, 2368]
	bl	BsGet
	str	w0, [x20, 40]
	ldr	w1, [x20, 36]
	cbnz	w1, .L1953
.L1916:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L1954
.L1917:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L1955
.L1915:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w1, w0
	mov	w0, 0
	cbnz	w1, .L1956
.L1914:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1956:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x1, .LC454
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	cmp	w0, 4095
	bhi	.L1957
.L1918:
	ldr	x1, .LC458
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	ldr	x1, .LC460
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	ldr	x1, .LC462
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	ldr	x1, .LC464
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1951:
	ldr	x1, .LC435
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	ldr	x1, .LC437
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	b	.L1911
	.p2align 3
.L1948:
	ldr	x0, [x19, 2368]
	mov	w1, 8
	bl	BsGet
	cmp	w0, 255
	str	w0, [x20, 8]
	bhi	.L1958
	bne	.L1904
	ldr	x0, [x19, 2368]
	mov	w1, 16
	bl	BsGet
	str	w0, [x20, 12]
	mov	w1, 16
	ldr	x0, [x19, 2368]
	bl	BsGet
	str	w0, [x20, 16]
	b	.L1904
	.p2align 3
.L1950:
	ldr	x0, [x19, 2368]
	mov	w1, 3
	bl	BsGet
	str	w0, [x20, 20]
	mov	w1, 1
	ldr	x0, [x19, 2368]
	bl	BsGet
	strb	w0, [x20]
	mov	w1, 1
	ldr	x0, [x19, 2368]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x20, 1]
	cbz	w0, .L1909
	ldr	x0, [x19, 2368]
	mov	w1, 8
	bl	BsGet
	str	w0, [x20, 24]
	mov	w1, 8
	ldr	x0, [x19, 2368]
	bl	BsGet
	str	w0, [x20, 28]
	mov	w1, 8
	ldr	x0, [x19, 2368]
	bl	BsGet
	str	w0, [x20, 32]
	b	.L1909
	.p2align 3
.L1949:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	b	.L1907
	.p2align 3
.L1955:
	ldr	w3, [x21, 52]
	mov	w2, 1
	add	x1, x20, 44
	mov	x0, x19
	bl	HEVC_DecHrdParam
	cbz	w0, .L1915
	ldr	x2, .LC452
	mov	w1, 13511
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1914
	.p2align 3
.L1954:
	ldr	x1, .LC450
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	b	.L1917
	.p2align 3
.L1953:
	ldr	x2, .LC448
	mov	w3, 10000
	umull	x0, w0, w3
	ldr	x2, [x2, 496]
	blr	x2
	add	w0, w0, 5
	mov	w1, 52429
	movk	w1, 0xcccc, lsl 16
	umull	x0, w0, w1
	lsr	x0, x0, 35
	str	w0, [x19, 148]
	b	.L1916
	.p2align 3
.L1957:
	ldr	x2, .LC456
	mov	w1, 13529
	mov	w0, 1
	bl	dprint_normal
	b	.L1918
	.p2align 3
.L1958:
	ldr	x2, .LC433
	mov	w1, 13414
	mov	w0, 1
	bl	dprint_normal
	str	wzr, [x20, 8]
	b	.L1904
	.p2align 3
.L1952:
	ldr	x2, .LC441
	mov	w1, 13469
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1914
	.size	HEVC_DecVuiParam, .-HEVC_DecVuiParam
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
.LC448:
	.xword	vfmw_Osal_Func_Ptr_S
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
	bls	.L1964
	mov	w0, 2147483647
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1964:
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
	ldr	x1, .LC466
	ldr	x0, [x21, 2368]
	bl	HEVC_ue_v
	ldr	x1, .LC468
	ldr	x0, [x21, 2368]
	bl	HEVC_ue_v
	cmp	w0, 1024
	mov	w22, w0
	bhi	.L1966
	mov	w19, 0
	cbz	w0, .L1972
	ldr	x24, .LC472
	ldr	x23, .LC474
	.p2align 2
.L1975:
	ldr	x0, [x21, 2368]
	mov	w1, 6
	bl	BsGet
	sub	w20, w0, #19
	ldr	x0, [x21, 2368]
	mov	w1, 3
	bl	BsGet
	cmp	w20, 1
	mov	x1, x24
	bls	.L1969
	ldr	x0, [x21, 2368]
	bl	HEVC_ue_v
.L1969:
	mov	x1, x23
	cbz	w19, .L1970
	ldr	x0, [x21, 2368]
	bl	HEVC_se_v
.L1970:
	add	w19, w19, 1
	cmp	w22, w19
	bne	.L1975
.L1972:
	ldr	x0, [x21, 2368]
	bl	BsToNextByte
	mov	w0, 0
.L1968:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L1966:
	ldr	x2, .LC470
	mov	w1, 5449
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1968
	.size	HEVC_Sei_Structure_Of_Pictures_Info, .-HEVC_Sei_Structure_Of_Pictures_Info
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
	beq	.L1980
	ldr	x1, .LC476
	ldr	x0, [x19, 2368]
	bl	HEVC_se_v
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	bl	BsToNextByte
	mov	w0, 0
.L1979:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1980:
	mov	w0, -1
	b	.L1979
	.size	HEVC_Sei_Recovery_Point, .-HEVC_Sei_Recovery_Point
	.align	3
.LC476:
	.xword	.LC475
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
	beq	.L2000
	ldr	x1, .LC478
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L1983
.L1997:
	mov	w1, 1
	mov	w0, 0
	strb	w1, [x22]
.L1982:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1983:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w1, w0
	cmp	w1, 1
	beq	.L2008
.L1984:
	ldr	x0, [x20, 2368]
	mov	w1, 8
	mov	w23, 3
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 8
	bl	BsGet
.L1986:
	ldr	x0, [x20, 2368]
	mov	w1, 8
	bl	BsGet
	uxtb	w1, w0
	cbz	w1, .L1989
	and	w0, w0, 255
	mov	w19, 0
	add	w21, w0, 1
	.p2align 2
.L1988:
	ldr	x0, [x20, 2368]
	mov	w1, 16
	add	w19, w19, 1
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 16
	bl	BsGet
	cmp	w21, w19
	bne	.L1988
.L1989:
	subs	w23, w23, #1
	bne	.L1986
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	beq	.L1990
.L1994:
	add	x26, x22, 3
	mov	x23, x22
	mov	w25, 33
.L1991:
	ldr	x0, [x20, 2368]
	mov	w1, 8
	sub	w24, w23, w22
	bl	BsGet
	uxtb	w1, w0
	cmp	w1, 32
	strb	w1, [x23, 40]
	bhi	.L2009
	cbz	w1, .L1999
	mov	w21, 0
	.p2align 2
.L1998:
	uxtw	x19, w21
	ldr	x0, [x20, 2368]
	mov	w1, 16
	add	w21, w21, 1
	umaddl	x19, w24, w25, x19
	bl	BsGet
	mov	w1, 16
	add	x19, x22, x19, lsl 1
	strh	w0, [x19, 44]
	ldr	x0, [x20, 2368]
	bl	BsGet
	strh	w0, [x19, 242]
	ldrb	w0, [x23, 40]
	add	w0, w0, 1
	cmp	w0, w21
	bhi	.L1998
.L1999:
	add	x23, x23, 1
	cmp	x23, x26
	bne	.L1991
	b	.L1997
	.p2align 3
.L2000:
	mov	w0, -1
	b	.L1982
.L1990:
	ldr	x0, [x20, 2368]
	mov	w1, 4
	add	x19, x22, 4
	add	x24, x22, 40
	bl	BsGet
	ldr	x23, .LC480
.L1992:
	add	x21, x19, 12
.L1993:
	ldr	x0, [x20, 2368]
	mov	x1, x23
	bl	HEVC_se_v
	str	w0, [x19], 4
	cmp	x19, x21
	bne	.L1993
	cmp	x19, x24
	bne	.L1992
	b	.L1994
.L2008:
	ldr	x0, [x20, 2368]
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 8
	bl	BsGet
	strb	w0, [x22, 1]
	mov	w1, 8
	ldr	x0, [x20, 2368]
	bl	BsGet
	ldr	x0, [x20, 2368]
	mov	w1, 8
	bl	BsGet
	b	.L1984
.L2009:
	ldr	x2, .LC482
	mov	w3, w1
	mov	w0, 1
	mov	w1, 6251
	bl	dprint_normal
	mov	w0, -1
	b	.L1982
	.size	HEVC_Sei_Color_Remapping_Info, .-HEVC_Sei_Color_Remapping_Info
	.align	3
.LC478:
	.xword	.LC477
	.align	3
.LC480:
	.xword	.LC479
	.align	3
.LC482:
	.xword	.LC481
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
	cbnz	w0, .L2036
	ldr	x0, [x19, 2408]
	ldr	w0, [x0, 16]
	cmp	w0, 39
	beq	.L2057
	cmp	w22, 5
	beq	.L2040
	cmp	w22, 132
	beq	.L2041
	mov	w20, 0
	cbz	w21, .L2035
	.p2align 2
.L2052:
	ldr	x0, [x19, 2368]
	mov	w1, 8
	add	w20, w20, 1
	bl	BsGet
	cmp	w21, w20
	bne	.L2052
	mov	w1, w21
	mov	x0, x19
	bl	HEVC_Sei_More_Data_In_Payload
	cbnz	w0, .L2044
	.p2align 2
.L2048:
	mov	w0, 0
.L2012:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2040:
	mov	w2, w21
	add	x1, x20, 540
	mov	x0, x19
	bl	HEVC_Sei_User_Data_Unregistered
	cbnz	w0, .L2036
.L2035:
	mov	w1, w21
	mov	x0, x19
	bl	HEVC_Sei_More_Data_In_Payload
	cbz	w0, .L2048
.L2044:
	mov	w1, w21
	mov	x0, x19
	bl	HEVC_Sei_Payload_Extension_Present
	cbnz	w0, .L2058
	.p2align 2
.L2047:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	bl	BsIsByteAligned
	cbz	w0, .L2047
	b	.L2048
	.p2align 3
.L2057:
	cmp	w22, 147
	bls	.L2059
.L2014:
	mov	w20, 0
	cbz	w21, .L2035
	.p2align 2
.L2051:
	ldr	x0, [x19, 2368]
	mov	w1, 8
	add	w20, w20, 1
	bl	BsGet
	cmp	w21, w20
	bne	.L2051
	b	.L2035
	.p2align 3
.L2041:
	add	x1, x20, 591
	mov	x0, x19
	bl	HEVC_Sei_Decoded_Picture_Hash
	cbz	w0, .L2035
	.p2align 2
.L2036:
	mov	w0, -1
	b	.L2012
	.p2align 3
.L2059:
	ldr	x0, .LC483
	ldrb	w0, [x0,w22,uxtw]
	adr	x1, .Lrtx2016
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx2016:
	.section	.rodata
	.align	0
	.align	2
.L2016:
	.byte	(.L2015 - .Lrtx2016) / 4
	.byte	(.L2017 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2018 - .Lrtx2016) / 4
	.byte	(.L2040 - .Lrtx2016) / 4
	.byte	(.L2020 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2021 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2022 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2023 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2024 - .Lrtx2016) / 4
	.byte	(.L2025 - .Lrtx2016) / 4
	.byte	(.L2026 - .Lrtx2016) / 4
	.byte	(.L2027 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2028 - .Lrtx2016) / 4
	.byte	(.L2029 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2030 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2031 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2032 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2014 - .Lrtx2016) / 4
	.byte	(.L2033 - .Lrtx2016) / 4
	.text
	.p2align 3
.L2058:
	ldr	x1, .LC485
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	b	.L2047
.L2033:
	cmn	x20, #590
	cset	w0, eq
	orr	w2, w2, w0
	cbnz	w2, .L2036
	ldr	x0, [x19, 2368]
	mov	w1, 8
	bl	BsGet
	strb	w0, [x20, 590]
	b	.L2035
.L2032:
	add	x1, x20, 584
	mov	x0, x19
	bl	HEVC_Sei_Content_Light_Level_Information
	cbz	w0, .L2035
	mov	w0, -1
	b	.L2012
	.p2align 3
.L2031:
	add	x1, x20, 100
	mov	x0, x19
	bl	HEVC_Sei_Color_Remapping_Info
	cbz	w0, .L2035
	mov	w0, -1
	b	.L2012
	.p2align 3
.L2030:
	adds	x1, x20, 540
	cset	w0, eq
	orr	w2, w2, w0
	cbnz	w2, .L2036
	mov	w0, 1
	strb	w0, [x20, 540]
	mov	x0, x19
	bl	HEVC_Sei_Mastering_Display_Colour_Volume.part.15
	cbz	w0, .L2035
	mov	w0, -1
	b	.L2012
	.p2align 3
.L2029:
	cmn	x20, #540
	cset	w0, eq
	orr	w2, w2, w0
	cbnz	w2, .L2036
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	b	.L2035
.L2028:
	mov	w3, w21
	mov	x2, x23
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_Sei_Scalable_Nesting
	cbz	w0, .L2035
	mov	w0, -1
	b	.L2012
	.p2align 3
.L2027:
	add	x1, x20, 540
	mov	x0, x19
	bl	HEVC_Sei_Temporal_Sub_Layer_Zero_Index
	cbz	w0, .L2035
	mov	w0, -1
	b	.L2012
	.p2align 3
.L2026:
	add	x2, x23, 2096
	add	x1, x20, 540
	mov	x0, x19
	bl	HEVC_Sei_Dec_Unit_Info
	cbz	w0, .L2035
	mov	w0, -1
	b	.L2012
	.p2align 3
.L2025:
	add	x1, x20, 540
	mov	x0, x19
	bl	HEVC_Sei_Active_Param_sets
	cbz	w0, .L2035
	mov	w0, -1
	b	.L2012
	.p2align 3
.L2024:
	mov	w2, w21
	add	x1, x20, 591
	mov	x0, x19
	bl	HEVC_Sei_Structure_Of_Pictures_Info
	cbz	w0, .L2035
	mov	w0, -1
	b	.L2012
	.p2align 3
.L2023:
	add	x1, x20, 540
	mov	x0, x19
	bl	HEVC_Sei_Display_Orientation
	cbz	w0, .L2035
	mov	w0, -1
	b	.L2012
	.p2align 3
.L2022:
	add	x1, x20, 540
	mov	x0, x19
	bl	HEVC_Sei_Frame_Packing_Arrangement
	cbz	w0, .L2035
	mov	w0, -1
	b	.L2012
	.p2align 3
.L2021:
	add	x1, x20, 591
	mov	x0, x19
	bl	HEVC_Sei_Tone_Mapping_Info
	cbz	w0, .L2035
	mov	w0, -1
	b	.L2012
	.p2align 3
.L2020:
	add	x1, x20, 540
	mov	x0, x19
	bl	HEVC_Sei_Recovery_Point
	cbz	w0, .L2035
	mov	w0, -1
	b	.L2012
	.p2align 3
.L2018:
	mov	w2, w21
	add	x1, x20, 56
	mov	x0, x19
	bl	HEVC_Sei_User_Data_Registered_Itu_T_T35
	cbz	w0, .L2035
	mov	w0, -1
	b	.L2012
	.p2align 3
.L2017:
	add	x2, x23, 2052
	add	x1, x20, 8
	mov	x0, x19
	bl	HEVC_Sei_Pic_Timming
	cbz	w0, .L2035
	mov	w0, -1
	b	.L2012
	.p2align 3
.L2015:
	add	x2, x23, 2096
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_Sei_Buf_Period
	cbz	w0, .L2035
	mov	w0, -1
	b	.L2012
	.size	HEVC_Sei_Payload, .-HEVC_Sei_Payload
	.align	3
.LC483:
	.xword	.L2016
	.align	3
.LC485:
	.xword	.LC484
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
	ldr	x0, [x19, 2368]
	b	.L2061
	.p2align 3
.L2063:
	bl	BsSkip
	add	w20, w20, 255
	ldr	x0, [x19, 2368]
	ldr	w4, [x0, 32]
	ldr	w5, [x0, 24]
	add	w1, w4, 8
	cmp	w1, w5
	bhi	.L2071
.L2061:
	mov	w1, 8
	bl	BsShow
	cmp	w0, 255
	mov	w1, 8
	ldr	x0, [x19, 2368]
	beq	.L2063
	bl	BsGet
	mov	w21, 0
	mov	w24, w0
	ldr	x0, [x19, 2368]
	b	.L2064
	.p2align 3
.L2065:
	bl	BsSkip
	add	w21, w21, 255
	ldr	x0, [x19, 2368]
	ldr	w4, [x0, 32]
	ldr	w5, [x0, 24]
	add	w1, w4, 8
	cmp	w1, w5
	bhi	.L2072
.L2064:
	mov	w1, 8
	bl	BsShow
	cmp	w0, 255
	mov	w1, 8
	ldr	x0, [x19, 2368]
	beq	.L2065
	bl	BsGet
	add	w4, w0, w21
	mov	x1, x22
	add	w3, w24, w20
	mov	x2, x23
	mov	x0, x19
	bl	HEVC_Sei_Payload
	mov	w1, 0
	cbnz	w0, .L2073
.L2062:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2071:
	mov	w3, 4965
.L2070:
	ldr	x2, .LC487
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w1, -1
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2072:
	mov	w3, 4981
	b	.L2070
.L2073:
	ldr	x2, .LC489
	mov	w1, 4992
	mov	w0, 1
	bl	dprint_normal
	mov	w1, -1
	b	.L2062
	.size	HEVC_SeiMessage, .-HEVC_SeiMessage
	.align	3
.LC487:
	.xword	.LC486
	.align	3
.LC489:
	.xword	.LC488
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
	beq	.L2080
	ldr	x20, [x19, 2400]
	add	x21, x19, 3368
	cbnz	x20, .L2083
	b	.L2086
	.p2align 3
.L2078:
	ldr	x0, [x19, 2368]
	bl	BsIsByteAligned
	cbz	w0, .L2087
	mov	x0, x19
	bl	HEVC_More_Rbsp_Data
	cbz	w0, .L2088
.L2083:
	mov	x2, x20
	mov	x1, x21
	mov	x0, x19
	bl	HEVC_SeiMessage
	cbz	w0, .L2078
	ldr	x2, .LC493
	mov	w1, 4925
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
.L2076:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2088:
	ldr	x0, [x19, 2368]
	mov	w1, 8
	bl	BsGet
	cmp	w0, 128
	bne	.L2089
.L2080:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2087:
	ldr	x2, .LC495
	mov	w1, 4931
	mov	w0, 1
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L2089:
	ldr	x2, .LC497
	mov	w3, w0
	mov	w1, 4941
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2076
.L2086:
	ldr	x2, .LC491
	mov	w1, 4915
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2076
	.size	HEVC_DecSEI, .-HEVC_DecSEI
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
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L2091
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	mov	w20, w0
	ldr	x1, .LC499
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	cmp	w0, 63
	mov	w23, w0
	bhi	.L2106
	and	w20, w20, 255
	cmp	w0, w20
	bcc	.L2097
	ldr	x24, .LC503
	.p2align 2
.L2096:
	ldr	x0, [x19, 2368]
	mov	w1, 3
	add	w20, w20, 1
	bl	BsGet
	ldr	x0, [x19, 2368]
	mov	x1, x24
	bl	HEVC_ue_v
	cmp	w23, w20
	bcs	.L2096
.L2097:
	ldr	x0, [x19, 2368]
	bl	BsToNextByte
.L2095:
	mov	x2, x22
	mov	x1, x21
	mov	x0, x19
	bl	HEVC_SeiMessage
	cbnz	w0, .L2107
	ldr	x0, [x19, 2368]
	bl	BsResidBits
	cmp	w0, wzr
	ble	.L2101
	ldr	x1, [x19, 2408]
	ldr	w1, [x1, 12]
	add	w1, w1, 3
	cmp	w1, w0
	bcc	.L2095
.L2101:
	mov	w0, 0
.L2093:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2091:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L2097
	ldr	x0, [x19, 2368]
	mov	w1, 3
	mov	w20, 0
	bl	BsGet
	ldr	x1, .LC505
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	cmp	w0, 63
	add	w23, w0, 1
	bhi	.L2108
	.p2align 2
.L2102:
	ldr	x0, [x19, 2368]
	mov	w1, 6
	add	w20, w20, 1
	bl	BsGet
	cmp	w20, w23
	bne	.L2102
	b	.L2097
	.p2align 3
.L2107:
	ldr	x2, .LC508
	mov	w1, 5428
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L2106:
	ldr	x2, .LC501
	mov	w3, 64
	mov	w1, 5388
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2093
.L2108:
	ldr	x2, .LC507
	mov	w1, 5409
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2093
	.size	HEVC_Sei_Scalable_Nesting, .-HEVC_Sei_Scalable_Nesting
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
.LC508:
	.xword	.LC492
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
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	str	x1, [x29, 112]
	bl	_mcount
	add	x27, x21, 332
	ldr	x3, .LC513
	add	x4, x20, 1536
	mov	x2, 64
	add	x1, x20, 1216
	add	x0, x20, 1344
	mov	w22, 0
	ldr	x3, [x3, 104]
	stp	x4, x20, [x29, 120]
	blr	x3
	ldr	x19, .LC528
	ldr	x24, .LC525
	add	x0, x20, 1632
	str	x0, [x29, 104]
.L2110:
	ldr	w0, [x27, 1888]
	cbz	w0, .L2131
	ldp	x0, x23, [x29, 120]
	mov	w25, 0
	str	x0, [x29, 136]
.L2130:
	ldr	x0, [x21, 2368]
	mov	w1, 1
	mov	w20, 64
	bl	BsGet
	uxtb	w0, w0
	ldr	w1, [x27]
	cmp	w1, w20
	csel	w20, w1, w20, le
	cbz	w0, .L2138
	cmp	w22, 1
	bls	.L2133
	ldr	x1, .LC521
	ldr	x0, [x21, 2368]
	bl	HEVC_se_v
	add	w1, w0, 7
	cmp	w1, 254
	bhi	.L2139
	add	w26, w0, 8
	ldr	x0, [x29, 136]
	str	w26, [x0]
.L2121:
	cmp	w20, wzr
	mov	x28, 0
	bgt	.L2127
	b	.L2120
	.p2align 3
.L2124:
	add	w1, w1, w2
	and	w1, w1, 255
	sub	w26, w1, w2
	cbz	w22, .L2140
	ldrb	w0, [x28, x5]
	ldrb	w1, [x28, x4]
	add	w0, w1, w0, lsl 3
.L2126:
	add	x28, x28, 1
	strb	w26, [x23, w0, sxtw]
	cmp	w20, w28
	ble	.L2120
.L2127:
	ldr	x0, [x21, 2368]
	mov	x1, x24
	bl	HEVC_se_v
	add	w2, w0, w26
	add	w0, w0, 128
	add	w1, w2, 256
	cmp	w0, 255
	asr	w2, w1, 31
	add	x5, x19, 104
	add	x4, x19, 168
	lsr	w2, w2, 24
	bls	.L2124
	ldr	x2, .LC527
	mov	w1, 12721
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
.L2113:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2138:
	ldr	x1, .LC515
	ldr	x0, [x21, 2368]
	bl	HEVC_ue_v
	cmp	w0, w25
	bhi	.L2141
	sub	w0, w25, w0
	cmp	w22, 1
	uxtb	w0, w0
	bls	.L2115
	cmp	w0, w25
	beq	.L2132
	uxtw	x2, w22
	lsl	x1, x2, 2
	sub	x1, x1, x2
	ldr	x2, [x29, 112]
	lsl	x1, x1, 1
	add	x1, x1, x0, uxtb
	add	x1, x1, 384
	ldr	w1, [x2, x1, lsl 2]
.L2116:
	ldr	x2, [x29, 136]
	str	w1, [x2]
.L2115:
	cmp	w0, w25
	beq	.L2142
	uxtw	x2, w22
	lsl	x1, x2, 2
	sub	x1, x1, x2
	lsl	x1, x1, 1
	add	x0, x1, x0, uxtb
	ldr	x1, [x29, 112]
	add	x1, x1, x0, lsl 6
.L2118:
	cbz	x1, .L2143
	ldr	x0, .LC513
	sxtw	x2, w20
	ldr	x3, [x0, 104]
	mov	x0, x23
	blr	x3
.L2120:
	add	w25, w25, 1
	cmp	w25, 6
	beq	.L2131
	ldr	x0, [x29, 136]
	add	x23, x23, 64
	add	x0, x0, 4
	str	x0, [x29, 136]
	ldr	w0, [x27, 1888]
	cmp	w0, w25
	bhi	.L2130
	.p2align 2
.L2131:
	ldr	x0, [x29, 120]
	add	w22, w22, 1
	ldr	x1, [x29, 104]
	add	x27, x27, 4
	add	x0, x0, 24
	str	x0, [x29, 120]
	cmp	x0, x1
	ldr	x0, [x29, 128]
	add	x0, x0, 384
	str	x0, [x29, 128]
	bne	.L2110
	mov	w0, 0
	b	.L2113
	.p2align 3
.L2133:
	mov	w26, 8
	b	.L2121
.L2142:
	mov	w1, w25
	mov	w0, w22
	bl	HEVC_GetScalingListDefaultAddress
	mov	x1, x0
	b	.L2118
.L2132:
	mov	w1, 16
	b	.L2116
.L2139:
	ldr	x2, .LC523
	mov	w1, 12707
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2113
.L2141:
	ldr	x2, .LC517
	mov	w1, 12672
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2113
.L2143:
	ldr	x2, .LC519
	mov	w1, 12691
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2113
.L2140:
	ldr	x0, .LC528
	ldr	x1, .LC528
	add	x0, x0, 72
	add	x1, x1, 88
	ldrb	w0, [x28, x0]
	ldrb	w1, [x28, x1]
	add	w0, w1, w0, lsl 2
	b	.L2126
	.size	HEVC_DecScalingListData, .-HEVC_DecScalingListData
	.align	3
.LC513:
	.xword	vfmw_Osal_Func_Ptr_S
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
.LC528:
	.xword	.LANCHOR4
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
	ldr	x1, .LC534
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 1
	str	w0, [x19, 60]
	mov	w21, w0
	beq	.L2145
	cmp	w0, 3
	bhi	.L2295
	ldr	x2, .LC538
	mov	w3, w0
	mov	w1, 3868
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
.L2286:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2295:
	ldr	x2, .LC536
	mov	w1, 3863
	mov	w0, 1
	bl	dprint_normal
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	mov	w0, -1
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2145:
	ldr	x1, .LC540
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 4096
	str	w0, [x19, 64]
	bhi	.L2296
	ldr	x1, .LC545
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 4096
	str	w0, [x19, 68]
	bhi	.L2297
	ldr	w3, [x19, 416]
	ldr	w1, [x19, 64]
	cmp	w3, 120
	mul	w0, w0, w1
	beq	.L2153
	bgt	.L2154
	cmp	w3, 60
	beq	.L2218
	ble	.L2298
	cmp	w3, 90
	beq	.L2158
	cmp	w3, 93
	beq	.L2159
	cmp	w3, 63
	beq	.L2299
.L2152:
	ldr	x2, .LC549
	mov	w1, 3946
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
	.p2align 3
.L2296:
	ldr	x2, .LC542
	mov	w3, 4096
	mov	w1, 3887
.L2291:
	mov	w0, w21
	bl	dprint_normal
	ldr	x0, .LC543
	ldr	x4, [x0]
	cbz	x4, .L2288
.L2290:
	ldr	w0, [x20, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	mov	w0, -1
	ldp	x29, x30, [sp], 112
	ret
.L2316:
	ldr	x2, .LC636
	mov	w1, 4319
	mov	w0, 1
	bl	dprint_normal
	.p2align 2
.L2288:
	mov	w0, -1
	b	.L2286
	.p2align 3
.L2218:
	mov	w2, 30720
	mov	w1, 122880
	.p2align 2
.L2155:
	cmp	w0, w2
	bhi	.L2164
	mov	w0, 16
	str	w0, [x19, 184]
.L2165:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	cbz	w0, .L2168
	ldr	x1, .LC551
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	ldr	x21, .LC552
	ldr	w2, [x19, 60]
	add	x22, x21, 232
	ldr	x1, .LC554
	ldr	w2, [x22, x2, lsl 2]
	mul	w0, w2, w0
	str	w0, [x19, 72]
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	ldp	w2, w1, [x19, 60]
	ldr	w3, [x19, 72]
	ldr	w2, [x22, x2, lsl 2]
	sub	w1, w1, w3
	mul	w0, w0, w2
	str	w0, [x19, 76]
	sub	w1, w1, w0
	tbnz	w1, #31, .L2300
	ldr	x1, .LC558
	add	x21, x21, 248
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	ldr	w2, [x19, 60]
	ldr	x1, .LC560
	ldr	w2, [x21, x2, lsl 2]
	mul	w0, w2, w0
	str	w0, [x19, 80]
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	ldr	w2, [x19, 60]
	ldr	w1, [x19, 68]
	ldr	w3, [x19, 80]
	ldr	w2, [x21, x2, lsl 2]
	sub	w1, w1, w3
	mul	w0, w0, w2
	str	w0, [x19, 84]
	sub	w1, w1, w0
	tbnz	w1, #31, .L2301
.L2168:
	ldr	x1, .LC564
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	add	w3, w0, 8
	cmp	w0, 2
	str	w3, [x19, 88]
	bhi	.L2302
	ldr	x1, .LC568
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	add	w3, w0, 8
	cmp	w0, 6
	str	w3, [x19, 96]
	bhi	.L2303
	ldr	w0, [x19, 88]
	str	w0, [x20, 192]
	ldr	x1, .LC572
	ldr	w0, [x19, 96]
	str	w0, [x20, 196]
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
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 12
	bhi	.L2304
	add	w0, w0, 4
	mov	w1, 1
	stp	w0, w0, [x19, 116]
	mov	w23, 0
	mov	w21, 0
	ldr	x0, [x20, 2368]
	bl	BsGet
	ldr	x26, .LC576
	mov	w27, w0
	ldr	x25, .LC578
	ldr	x24, .LC580
	b	.L2179
	.p2align 3
.L2173:
	ldr	w0, [x19, 52]
	add	w21, w21, 1
	cmp	w21, w0
	bhi	.L2178
.L2179:
	add	x22, x19, x21, uxtw 2
	ldr	x0, [x20, 2368]
	mov	x1, x26
	bl	HEVC_ue_v
	add	w0, w0, 1
	str	w0, [x22, 328]
	mov	x1, x25
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	str	w0, [x22, 356]
	mov	x1, x24
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	str	w0, [x22, 384]
	ldr	w0, [x22, 328]
	cmp	w23, w0
	csel	w23, w23, w0, cs
	cbnz	w27, .L2173
	ldr	w2, [x19, 52]
	add	w21, w21, 1
	cmp	w21, w2
	bhi	.L2178
	.p2align 2
.L2260:
	add	x0, x19, x21, uxtw 2
	ldr	w1, [x19, 328]
	add	w21, w21, 1
	cmp	w21, w2
	str	w1, [x0, 328]
	ldr	w1, [x19, 356]
	str	w1, [x0, 356]
	ldr	w1, [x19, 384]
	str	w1, [x0, 384]
	bls	.L2260
.L2178:
	ldr	w0, [x19, 184]
	mov	w2, 16
	ldr	x1, .LC582
	cmp	w0, w2
	csel	w0, w0, w2, ls
	cmp	w0, w23
	csel	w23, w0, w23, ls
	str	w23, [x19, 184]
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 3
	mov	w22, w0
	bhi	.L2305
	ldr	x1, .LC586
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 3
	mov	w21, w0
	bhi	.L2306
	add	w2, w22, 3
	add	w1, w0, w2
	sub	w0, w1, #4
	cmp	w0, 2
	stp	w2, w1, [x19, 124]
	bhi	.L2307
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
	ldr	x1, .LC592
	cmp	w0, wzr
	csinc	w2, w2, w2, eq
	str	w2, [x19, 192]
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 3
	mov	w22, w0
	bhi	.L2308
	ldr	x1, .LC596
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 3
	bhi	.L2309
	ldr	w2, [x19, 124]
	add	w1, w22, 2
	str	w1, [x19, 148]
	cmp	w1, w2
	bcs	.L2310
	add	w1, w0, w1
	str	w1, [x19, 152]
	cmp	w1, 5
	bhi	.L2189
	ldr	w0, [x19, 128]
	cmp	w1, w0
	bhi	.L2189
	ldr	x1, .LC604
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	str	w0, [x19, 164]
	ldr	w1, [x19, 128]
	ldr	w2, [x19, 148]
	sub	w1, w1, w2
	cmp	w0, w1
	bhi	.L2311
	ldr	x1, .LC608
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	str	w0, [x19, 168]
	ldr	w1, [x19, 128]
	ldr	w4, [x19, 148]
	sub	w1, w1, w4
	cmp	w0, w1
	bhi	.L2192
	ldr	w2, [x19, 140]
	mov	w3, 1
	lsl	w0, w3, w4
	mov	w1, 0
	lsr	w2, w2, w21
	cmp	w2, w0
	bls	.L2194
	.p2align 2
.L2259:
	add	w1, w1, 1
	add	w0, w4, w1
	lsl	w0, w3, w0
	cmp	w0, w2
	bcc	.L2259
.L2194:
	add	w1, w21, w1
	str	w1, [x19, 172]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3]
	cbz	w0, .L2196
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 4]
	cbnz	w0, .L2312
.L2196:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 5]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 6]
	cbnz	w0, .L2197
	ldr	w3, [x19, 68]
	cmp	w3, 64
	bls	.L2313
.L2197:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	str	w0, [x19, 104]
	cbz	w0, .L2198
	ldr	x0, [x20, 2368]
	mov	w1, 4
	bl	BsGet
	add	w0, w0, 1
	str	w0, [x19, 108]
	mov	w1, 4
	ldr	x0, [x20, 2368]
	bl	BsGet
	add	w0, w0, 1
	str	w0, [x19, 112]
	ldr	x1, .LC616
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 2
	mov	w21, w0
	bhi	.L2314
.L2199:
	ldr	x1, .LC620
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 2
	mov	w22, w0
	bhi	.L2315
.L2200:
	add	w0, w21, 3
	str	w0, [x19, 156]
	add	w0, w22, w0
	str	w0, [x19, 160]
	cmp	w0, 5
	bhi	.L2201
	ldr	w1, [x19, 128]
	cmp	w0, w1
	bhi	.L2201
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 7]
.L2198:
	ldr	x1, .LC626
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 64
	str	w0, [x19, 176]
	bhi	.L2203
	mov	w21, 0
	cbnz	w0, .L2258
	b	.L2209
	.p2align 3
.L2207:
	ldr	w0, [x19, 176]
	cmp	w21, w0
	bcs	.L2209
.L2258:
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
	add	x2, x2, 2148
	bl	HEVC_DecShortTermRefPicSet
	cbz	w0, .L2207
	ldr	x2, .LC630
	mov	w1, 4285
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
	.p2align 3
.L2164:
	cmp	w0, w1, lsr 1
	bhi	.L2166
	mov	w0, 12
	str	w0, [x19, 184]
	b	.L2165
	.p2align 3
.L2297:
	ldr	x2, .LC547
	mov	w3, 4096
	mov	w1, 3897
	b	.L2291
	.p2align 3
.L2154:
	cmp	w3, 156
	beq	.L2161
	bgt	.L2162
	cmp	w3, 150
	beq	.L2161
	cmp	w3, 153
	beq	.L2161
	cmp	w3, 123
	bne	.L2152
.L2153:
	mov	w2, 32768
	mov	w1, 2228224
	movk	w2, 0x8, lsl 16
	b	.L2155
	.p2align 3
.L2166:
	lsl	w2, w1, 2
	sub	w1, w2, w1
	cmp	w0, w1, lsr 2
	bhi	.L2167
	mov	w0, 8
	str	w0, [x19, 184]
	b	.L2165
	.p2align 3
.L2302:
	ldr	x2, .LC566
	mov	w1, 4004
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC543
	ldr	x4, [x0]
	cbz	x4, .L2288
	ldr	w1, [x19, 88]
	mov	w3, 8
	ldr	w0, [x20, 248]
	add	x2, x29, 104
	stp	wzr, w1, [x29, 104]
	mov	w1, 47
	blr	x4
	mov	w0, -1
	b	.L2286
	.p2align 3
.L2209:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 8]
	cbz	w0, .L2206
	ldr	x1, .LC632
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 32
	str	w0, [x19, 180]
	bhi	.L2212
	mov	w22, 0
	cbz	w0, .L2206
	.p2align 2
.L2257:
	ldr	w1, [x19, 116]
	uxtw	x21, w22
	ldr	x0, [x20, 2368]
	add	w22, w22, 1
	bl	BsGet
	add	x2, x19, x21, lsl 2
	add	x21, x19, x21
	mov	w1, 1
	str	w0, [x2, 196]
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x21, 13]
	ldr	w0, [x19, 180]
	cmp	w22, w0
	bcc	.L2257
.L2206:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 9]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x19, 10]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 11]
	cbz	w0, .L2211
	mov	x2, x19
	add	x1, x19, 2052
	mov	x0, x20
	bl	HEVC_DecVuiParam
	cbnz	w0, .L2316
.L2211:
	ldp	w3, w4, [x19, 64]
	ldr	w1, [x19, 2064]
	ldr	w2, [x19, 2068]
	ldr	w0, [x19, 2060]
	bl	HEVC_GetDar
	str	w0, [x19, 2056]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 12]
	cbnz	w0, .L2285
	.p2align 2
.L2216:
	mov	w1, 1
	mov	w0, 0
	strb	w1, [x19]
	b	.L2286
	.p2align 3
.L2317:
	ldr	x0, [x20, 2368]
	bl	BsGet
.L2285:
	ldr	x0, [x20, 2368]
	bl	BsResidBits
	cmp	w0, wzr
	ble	.L2216
	ldr	x2, [x20, 2408]
	mov	w1, 1
	ldr	w2, [x2, 12]
	add	w2, w2, 3
	cmp	w2, w0
	bcs	.L2216
	b	.L2317
	.p2align 3
.L2162:
	cmp	w3, 183
	beq	.L2163
	cmp	w3, 186
	beq	.L2163
	cmp	w3, 180
	bne	.L2152
.L2163:
	mov	w2, 8912896
	mov	w1, 35651584
	b	.L2155
	.p2align 3
.L2298:
	cbz	w3, .L2157
	cmp	w3, 30
	bne	.L2152
.L2157:
	mov	w2, 9216
	mov	w1, 36864
	b	.L2155
	.p2align 3
.L2161:
	mov	w2, 2228224
	mov	w1, 8912896
	b	.L2155
	.p2align 3
.L2158:
	mov	w2, 7168
	mov	w1, 28672
	movk	w2, 0x2, lsl 16
	movk	w1, 0x8, lsl 16
	b	.L2155
.L2299:
	mov	w2, 61440
	mov	w1, 245760
	b	.L2155
	.p2align 3
.L2159:
	mov	w2, 245760
	mov	w1, 983040
	b	.L2155
	.p2align 3
.L2167:
	mov	w0, 6
	str	w0, [x19, 184]
	b	.L2165
.L2313:
	ldr	x2, .LC614
	mov	w1, 4230
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC543
	ldr	x4, [x0]
	cbnz	x4, .L2290
	mov	w0, -1
	b	.L2286
.L2312:
	add	x1, x19, 420
	mov	x0, x20
	bl	HEVC_DecScalingListData
	cbz	w0, .L2196
	ldr	x2, .LC612
	mov	w1, 4218
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
	.p2align 3
.L2189:
	ldr	x2, .LC602
	mov	w1, 4157
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
.L2315:
	ldr	x2, .LC622
	mov	w3, w0
	mov	w1, 4254
	mov	w0, 1
	bl	dprint_normal
	b	.L2200
.L2314:
	ldr	x2, .LC618
	mov	w3, w0
	mov	w1, 4246
	mov	w0, 1
	bl	dprint_normal
	b	.L2199
.L2304:
	ldr	x2, .LC574
	mov	w1, 4048
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
.L2305:
	ldr	x2, .LC584
	mov	w1, 4096
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
.L2308:
	ldr	x2, .LC594
	mov	w1, 4133
	mov	w0, w23
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
.L2311:
	ldr	x2, .LC606
	mov	w1, 4165
	mov	w0, w23
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
.L2201:
	ldr	x2, .LC624
	mov	w1, 4263
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
.L2307:
	ldr	x2, .LC590
	mov	w1, 4114
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
.L2306:
	ldr	x2, .LC588
	mov	w1, 4104
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
.L2309:
	ldr	x2, .LC598
	mov	w1, 4141
	mov	w0, w23
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
.L2303:
	ldr	x2, .LC570
	mov	w1, 4024
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
.L2310:
	ldr	x2, .LC600
	mov	w1, 4149
	mov	w0, w23
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
.L2192:
	ldr	x2, .LC610
	mov	w1, 4173
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
.L2300:
	ldr	x2, .LC556
	mov	w1, 3980
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
.L2203:
	ldr	x2, .LC628
	mov	w3, 64
	mov	w1, 4274
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
.L2301:
	ldr	x2, .LC562
	mov	w1, 3993
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
.L2212:
	ldr	x2, .LC634
	mov	w1, 4298
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2286
	.size	HEVC_ProcessSPS, .-HEVC_ProcessSPS
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
.LC543:
	.xword	g_EventReportFunc
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
.LC552:
	.xword	.LANCHOR4
	.align	3
.LC554:
	.xword	.LC553
	.align	3
.LC556:
	.xword	.LC555
	.align	3
.LC558:
	.xword	.LC557
	.align	3
.LC560:
	.xword	.LC559
	.align	3
.LC562:
	.xword	.LC561
	.align	3
.LC564:
	.xword	.LC563
	.align	3
.LC566:
	.xword	.LC565
	.align	3
.LC568:
	.xword	.LC567
	.align	3
.LC570:
	.xword	.LC569
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecSPS
	.type	HEVC_DecSPS, %function
HEVC_DecSPS:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x22, .LC639
	mov	x2, 8
	mov	w1, 0
	add	x0, x29, 96
	ldr	x3, [x22, 96]
	blr	x3
	ldr	x0, [x19, 2368]
	mov	w1, 4
	bl	BsGet
	mov	w24, w0
	ldr	w3, [x19, 160]
	cmp	w3, w0
	bls	.L2331
	ldr	x0, [x19, 2408]
	ldr	w0, [x0, 24]
	cbz	w0, .L2332
	mov	w20, 0
	mov	w25, 0
.L2321:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	mov	w23, w0
	mov	w3, w20
	mov	w2, 1
	add	x1, x29, 96
	mov	x0, x19
	bl	HEVC_DecPTL
	cbnz	w0, .L2333
	ldr	x1, .LC647
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	mov	w21, w0
	ldr	w3, [x19, 164]
	cmp	w0, w3
	bcs	.L2334
	mov	w20, 12644
	ldr	x1, [x19, 2384]
	uxtb	w26, w23
	umull	x20, w0, w20
	add	x1, x1, x20
	ldrb	w0, [x1, 1]
	cbz	w0, .L2325
	ldr	x27, .LC651
	mov	x2, 12644
	ldr	x3, [x22, 96]
	mov	w1, 0
	add	x23, x27, 1280
	mov	x0, x23
	blr	x3
	strb	w26, [x23, 2]
	ldr	x3, [x22, 104]
	add	x1, x29, 96
	mov	x2, 8
	strb	wzr, [x23, 46]
	stp	w24, w25, [x23, 48]
	add	x0, x27, 1692
	blr	x3
	str	w21, [x23, 56]
	mov	x1, x23
	mov	x0, x19
	bl	HEVC_ProcessSPS
	mov	w24, w0
	ldr	x0, [x19, 2384]
	cbnz	w24, .L2335
	mov	w1, 1
	ldr	x3, [x22, 112]
	strb	w1, [x27, 1280]
	add	x0, x0, x20
	strb	w1, [x23, 1]
	mov	x2, 12644
	mov	x1, x23
	blr	x3
	ldr	x0, [x19, 2384]
	add	x20, x0, x20
	str	x20, [x19, 2400]
.L2320:
	mov	w0, w24
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2332:
	ldr	x0, [x19, 2368]
	mov	w1, 3
	bl	BsGet
	cmp	w0, 6
	mov	w20, w0
	mov	w25, w0
	bls	.L2321
	ldr	x2, .LC643
	mov	w3, 6
	mov	w1, 4380
	mov	w0, 1
	mov	w24, -1
	bl	dprint_normal
	b	.L2320
	.p2align 3
.L2325:
	str	w24, [x1, 48]
	mov	x2, 8
	add	x1, x29, 96
	ldr	x0, [x19, 2384]
	add	x0, x0, x20
	str	w25, [x0, 52]
	ldr	x0, [x19, 2384]
	add	x0, x0, x20
	strb	w26, [x0, 2]
	ldr	x0, [x19, 2384]
	add	x0, x0, x20
	strb	wzr, [x0, 46]
	ldr	x0, [x19, 2384]
	ldr	x3, [x22, 104]
	add	x0, x0, x20
	add	x0, x0, 412
	blr	x3
	ldr	x1, [x19, 2384]
	mov	x0, x19
	add	x1, x1, x20
	str	w21, [x1, 56]
	ldr	x1, [x19, 2384]
	add	x1, x1, x20
	bl	HEVC_ProcessSPS
	mov	w24, w0
	cbnz	w0, .L2336
	ldr	x0, [x19, 2384]
	mov	w1, 1
	strb	w1, [x0, x20]
	ldr	x0, [x19, 2384]
	add	x0, x0, x20
	strb	w1, [x0, 1]
	ldr	x0, [x19, 2384]
	add	x20, x0, x20
	str	x20, [x19, 2400]
	mov	w0, w24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2334:
	ldr	x2, .LC649
	mov	w1, 4428
	mov	w0, 1
	bl	dprint_normal
	ldr	w1, [x19, 164]
	cmp	w21, w1
	bcc	.L2330
	ldr	x0, .LC650
	ldr	x4, [x0]
	cbz	x4, .L2330
	ldr	w0, [x19, 248]
	add	x2, x29, 104
	stp	w21, w1, [x29, 104]
	mov	w3, 8
	mov	w1, 28
	mov	w24, -1
	blr	x4
	ldr	x27, [sp, 80]
	mov	w0, w24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2330:
	mov	w24, -1
	b	.L2320
	.p2align 3
.L2333:
	ldr	x2, .LC645
	mov	w1, 4419
	mov	w0, 1
	mov	w24, -1
	bl	dprint_normal
	b	.L2320
	.p2align 3
.L2331:
	ldr	x2, .LC641
	mov	w1, 4370
	mov	w0, 1
	mov	w24, -1
	bl	dprint_normal
	b	.L2320
	.p2align 3
.L2335:
	ldr	x2, .LC653
	add	x20, x0, x20
	mov	w3, w21
	mov	w1, 4457
	str	x20, [x19, 2400]
	mov	w0, 1
	mov	w24, -1
	bl	dprint_normal
	b	.L2320
.L2336:
	ldr	x2, .LC655
	mov	w1, 4483
	mov	w3, w21
	mov	w0, 1
	mov	w24, -1
	bl	dprint_normal
	ldr	x0, [x19, 2384]
	mov	w1, 1
	strb	w1, [x0, x20]
	ldr	x0, [x19, 2384]
	add	x20, x0, x20
	strb	wzr, [x20, 1]
	b	.L2320
	.size	HEVC_DecSPS, .-HEVC_DecSPS
	.align	3
.LC639:
	.xword	vfmw_Osal_Func_Ptr_S
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
.LC650:
	.xword	g_EventReportFunc
	.align	3
.LC651:
	.xword	.LANCHOR5
	.align	3
.LC653:
	.xword	.LC652
	.align	3
.LC655:
	.xword	.LC654
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
	ldr	x1, .LC658
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	str	w0, [x19, 32]
	tbnz	w0, #31, .L2338
	ldr	w1, [x20, 164]
	cmp	w0, w1
	bge	.L2338
	ldr	x1, [x20, 2384]
	mov	w21, 12644
	smaddl	x21, w0, w21, x1
	ldrb	w1, [x21, 1]
	cbz	w1, .L2450
	ldr	x0, [x20, 2368]
	mov	w1, w22
	bl	BsGet
	strb	w0, [x19, 2]
	mov	w1, w22
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x19, 4]
	mov	w1, 3
	ldr	x0, [x20, 2368]
	bl	BsGet
	str	w0, [x19, 36]
	mov	w1, w22
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x19, 3]
	mov	w1, w22
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x19, 5]
	ldr	x1, .LC664
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	add	w0, w0, 1
	cmp	w0, 15
	str	w0, [x19, 40]
	bhi	.L2451
	ldr	x1, .LC668
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	add	w0, w0, 1
	cmp	w0, 15
	str	w0, [x19, 44]
	bhi	.L2452
	ldr	x1, .LC672
	ldr	x0, [x20, 2368]
	bl	HEVC_se_v
	mov	w1, 2147483647
	cmp	w0, w1
	beq	.L2453
	add	w3, w0, 26
	str	w3, [x19, 48]
	mov	w0, 51
	ldr	w4, [x21, 92]
	neg	w1, w4
	cmp	w3, w1
	ccmp	w3, w0, 0, ge
	bgt	.L2454
	ldr	x0, [x20, 2368]
	mov	w1, w22
	bl	BsGet
	strb	w0, [x19, 6]
	mov	w1, w22
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x19, 7]
	mov	w1, w22
	ldr	x0, [x20, 2368]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 8]
	cbnz	w0, .L2455
	mov	w0, 0
	str	wzr, [x19, 52]
.L2348:
	str	w0, [x19, 56]
	ldr	x1, .LC683
	ldr	x0, [x20, 2368]
	bl	HEVC_se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x19, 60]
	bhi	.L2456
	ldr	x1, .LC687
	ldr	x0, [x20, 2368]
	bl	HEVC_se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x19, 64]
	bhi	.L2457
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 9]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x19, 10]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x19, 11]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x19, 12]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x19, 13]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x19, 14]
	ldrb	w1, [x19, 13]
	cbnz	w1, .L2458
	ldr	w0, [x21, 188]
	strh	w0, [x19, 172]
	ldr	w0, [x21, 192]
	strh	w0, [x19, 212]
.L2387:
	ldr	w2, [x19, 68]
	cmp	w2, wzr
	ble	.L2392
.L2386:
	ldr	w4, [x21, 140]
	add	x0, x19, 172
	mov	w1, 0
	.p2align 2
.L2391:
	ldrsh	w3, [x0]
	add	w1, w1, 1
	add	x0, x0, 2
	mul	w3, w3, w4
	cmp	w3, 64
	bhi	.L2390
	ldr	w5, [x21, 64]
	cmp	w5, 64
	bhi	.L2459
.L2390:
	cmp	w1, w2
	blt	.L2391
.L2392:
	ldr	w1, [x19, 72]
	cmp	w1, wzr
	ble	.L2389
	ldrsh	w3, [x19, 212]
	ldr	w2, [x21, 140]
	mul	w3, w3, w2
	cmp	w3, 63
	bls	.L2393
	sub	w1, w1, #1
	mov	x0, x19
	add	x1, x19, x1, lsl 1
	b	.L2395
	.p2align 3
.L2396:
	ldrsh	w3, [x0, 214]
	add	x0, x0, 2
	mul	w3, w3, w2
	cmp	w3, 63
	bls	.L2393
.L2395:
	cmp	x1, x0
	bne	.L2396
.L2389:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 17]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 18]
	cbnz	w0, .L2460
.L2398:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 21]
	cbz	w0, .L2401
	add	x1, x19, 256
	mov	x0, x20
	bl	HEVC_DecScalingListData
	cbnz	w0, .L2461
.L2401:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 22]
	ldr	x1, .LC731
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	add	w3, w0, 2
	cmp	w3, 1
	str	w3, [x19, 84]
	ble	.L2402
	ldr	w0, [x21, 128]
	cmp	w3, w0
	bhi	.L2402
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 23]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 24]
	cbz	w0, .L2405
	ldr	x0, [x20, 2368]
	bl	BsResidBits
	cmp	w0, wzr
	ble	.L2405
	.p2align 2
.L2462:
	ldr	x2, [x20, 2408]
	mov	w1, 1
	ldr	w2, [x2, 12]
	add	w2, w2, 3
	cmp	w2, w0
	bcs	.L2405
	ldr	x0, [x20, 2368]
	bl	BsGet
	strb	w0, [x19, 25]
	ldr	x0, [x20, 2368]
	bl	BsResidBits
	cmp	w0, wzr
	bgt	.L2462
.L2405:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2455:
	ldr	x1, .LC679
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 3
	str	w0, [x19, 52]
	bls	.L2348
	ldr	x2, .LC681
	mov	w1, 4576
	mov	w0, w22
	bl	dprint_normal
	mov	w0, -1
	b	.L2437
	.p2align 3
.L2458:
	ldr	x1, .LC691
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 19
	bhi	.L2463
	add	w0, w0, 1
	str	w0, [x19, 68]
	ldr	x1, .LC695
	ldr	x0, [x20, 2368]
	bl	HEVC_ue_v
	cmp	w0, 21
	bhi	.L2464
	ldr	w1, [x19, 68]
	add	w4, w0, 1
	str	w4, [x19, 72]
	cmp	w1, 10
	bgt	.L2465
	cmp	w4, 11
	ble	.L2356
	ldr	x2, .LC702
	mov	w3, 11
	mov	w1, 4638
.L2447:
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC700
	ldr	x4, [x0]
	cbz	x4, .L2441
.L2443:
	ldr	w0, [x20, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
	mov	w0, -1
.L2437:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2393:
	ldr	x2, .LC719
	mov	w1, 4757
.L2446:
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC700
	ldr	x4, [x0]
	cbnz	x4, .L2443
.L2441:
	mov	w0, -1
.L2469:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2459:
	ldr	x2, .LC717
	mov	w1, 4747
	b	.L2446
	.p2align 3
.L2454:
	ldr	x2, .LC677
	mov	w1, 4557
	mov	w0, w22
	bl	dprint_normal
	mov	w0, -1
	b	.L2437
.L2356:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 15]
	cbnz	w0, .L2466
	ldr	w0, [x19, 68]
	sub	w1, w0, #1
	cmp	w1, wzr
	ble	.L2361
	ldr	x24, .LC704
	mov	w23, 0
	b	.L2366
	.p2align 3
.L2362:
	strh	w4, [x0, 88]
	ldr	w5, [x21, 188]
	tbnz	w4, #31, .L2364
	cmp	w4, w5
	bhi	.L2364
	ldr	w0, [x19, 68]
	add	w23, w23, 1
	sub	w1, w0, #1
	cmp	w1, w23
	ble	.L2467
.L2366:
	ldr	x0, [x20, 2368]
	mov	x1, x24
	bl	HEVC_ue_v
	mov	w22, w0
	add	w4, w22, 1
	cmn	w22, #1
	add	x0, x19, x23, sxtw 1
	sxth	w4, w4
	bne	.L2362
	ldr	x3, .LC673
	mov	w4, 4654
.L2444:
	ldr	x2, .LC705
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, 1
	bl	dprint_normal
	mov	w0, w22
	b	.L2437
.L2465:
	mov	w4, w1
	ldr	x2, .LC699
	mov	w3, 10
	mov	w1, 4631
	b	.L2447
.L2460:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 19]
	mov	w1, 1
	ldr	x0, [x20, 2368]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 20]
	cbnz	w0, .L2398
	ldr	x1, .LC721
	ldr	x0, [x20, 2368]
	bl	HEVC_se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x19, 76]
	bhi	.L2468
.L2400:
	ldr	x1, .LC725
	ldr	x0, [x20, 2368]
	bl	HEVC_se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x19, 80]
	bls	.L2398
	ldr	x2, .LC727
	mov	w3, w0
	mov	w1, 4787
	mov	w0, 1
	bl	dprint_normal
	str	wzr, [x19, 80]
	b	.L2398
.L2466:
	ldr	w0, [x19, 68]
.L2368:
	cmp	w0, wzr
	add	x5, x19, 172
	mov	w3, 0
	ble	.L2360
	.p2align 2
.L2421:
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
	bne	.L2421
.L2360:
	ldr	w4, [x19, 72]
	add	x6, x19, 212
	mov	w3, 0
	cmp	w4, wzr
	ble	.L2377
	.p2align 2
.L2420:
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
	bne	.L2420
.L2377:
	cmp	w0, 1
	bne	.L2385
	ldr	w2, [x19, 72]
	cmp	w2, 1
	beq	.L2386
.L2385:
	ldr	x0, [x20, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 16]
	b	.L2387
.L2338:
	ldr	x2, .LC660
	mov	w3, w0
	mov	w1, 4512
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2437
.L2450:
	ldr	x2, .LC662
	mov	w3, w0
	mov	w1, 4517
	mov	w0, w22
	bl	dprint_normal
	mov	w0, -1
	b	.L2437
.L2451:
	ldr	x2, .LC666
	mov	w1, 4533
	mov	w0, w22
	bl	dprint_normal
	mov	w0, -1
	b	.L2437
.L2452:
	ldr	x2, .LC670
	mov	w1, 4541
	mov	w0, w22
	bl	dprint_normal
	mov	w0, -1
	b	.L2437
.L2456:
	ldr	x2, .LC685
	mov	w1, 4586
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2437
.L2457:
	ldr	x2, .LC689
	mov	w1, 4594
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2437
.L2402:
	ldr	x2, .LC733
	mov	w1, 4813
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2469
.L2364:
	ldr	x2, .LC707
	mov	w3, w23
	mov	w1, 4662
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2437
.L2467:
	ldr	w1, [x19, 72]
	sub	w1, w1, #1
	cmp	w1, wzr
	ble	.L2375
.L2367:
	ldr	x24, .LC709
	mov	w23, 0
	b	.L2374
	.p2align 3
.L2370:
	strh	w4, [x0, 128]
	ldr	w5, [x21, 192]
	tbnz	w4, #31, .L2372
	cmp	w4, w5
	bhi	.L2372
	ldr	w0, [x19, 72]
	add	w23, w23, 1
	sub	w0, w0, #1
	cmp	w0, w23
	ble	.L2470
.L2374:
	ldr	x0, [x20, 2368]
	mov	x1, x24
	bl	HEVC_ue_v
	mov	w22, w0
	add	w4, w22, 1
	cmn	w22, #1
	add	x0, x19, x23, sxtw 1
	sxth	w4, w4
	bne	.L2370
	ldr	x3, .LC673
	mov	w4, 4674
	b	.L2444
.L2463:
	ldr	x2, .LC693
	mov	w3, w0
	mov	w4, 20
	mov	w1, 4613
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2437
.L2453:
	ldr	x3, .LC673
	mov	w4, 4549
	ldr	x2, .LC675
	mov	w1, w4
	add	x3, x3, 264
	mov	w0, w22
	bl	dprint_normal
	mov	w0, -1
	b	.L2437
.L2468:
	ldr	x2, .LC723
	mov	w3, w0
	mov	w1, 4777
	mov	w0, 1
	bl	dprint_normal
	str	wzr, [x19, 76]
	b	.L2400
.L2372:
	ldr	x2, .LC711
	mov	w3, w23
	mov	w1, 4682
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2437
.L2464:
	ldr	x2, .LC697
	mov	w3, w0
	mov	w4, 22
	mov	w1, 4623
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2437
.L2470:
	ldr	w0, [x19, 68]
.L2375:
	ldrb	w1, [x19, 15]
	cbnz	w1, .L2368
	add	x5, x19, x0, sxtw 1
	sub	w3, w0, #1
	ldrsh	w4, [x21, 188]
	cmp	w3, wzr
	strh	w4, [x5, 170]
	ble	.L2380
	sub	w6, w0, #2
	add	x2, x19, 88
	add	x6, x6, 45
	add	x6, x19, x6, lsl 1
	.p2align 2
.L2381:
	ldrsh	w4, [x2]
	add	x2, x2, 2
	strh	w4, [x2, 82]
	cmp	x2, x6
	ldrh	w1, [x5, 170]
	sub	w4, w1, w4
	sxth	w4, w4
	strh	w4, [x5, 170]
	bne	.L2381
.L2380:
	cmp	w4, wzr
	ble	.L2471
	ldr	w1, [x19, 72]
	ldrsh	w4, [x21, 192]
	sub	w3, w1, #1
	add	x5, x19, x1, sxtw 1
	cmp	w3, wzr
	strh	w4, [x5, 210]
	ble	.L2383
	sub	w6, w1, #2
	add	x2, x19, 128
	add	x6, x6, 65
	add	x6, x19, x6, lsl 1
	.p2align 2
.L2384:
	ldrsh	w4, [x2]
	add	x2, x2, 2
	strh	w4, [x2, 82]
	cmp	x6, x2
	ldrh	w1, [x5, 210]
	sub	w4, w1, w4
	sxth	w4, w4
	strh	w4, [x5, 210]
	bne	.L2384
.L2383:
	cmp	w4, wzr
	bgt	.L2377
	ldr	x2, .LC715
	mov	w1, 4726
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2437
	.p2align 3
.L2461:
	ldr	x2, .LC729
	mov	w1, 4803
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2437
.L2361:
	ldr	w1, [x19, 72]
	sub	w1, w1, #1
	cmp	w1, wzr
	bgt	.L2367
	add	x1, x19, x0, sxtw 1
	ldrsh	w4, [x21, 188]
	sub	w3, w0, #1
	strh	w4, [x1, 170]
	b	.L2380
.L2471:
	ldr	x2, .LC713
	mov	w1, 4712
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2437
	.size	HEVC_ProcessPPS, .-HEVC_ProcessPPS
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
.LC673:
	.xword	.LANCHOR4
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
	.align	3
.LC700:
	.xword	g_EventReportFunc
	.align	3
.LC702:
	.xword	.LC701
	.align	3
.LC704:
	.xword	.LC703
	.align	3
.LC705:
	.xword	.LC373
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecPPS
	.type	HEVC_DecPPS, %function
HEVC_DecPPS:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC735
	ldr	x0, [x19, 2368]
	bl	HEVC_ue_v
	mov	w21, w0
	ldr	w4, [x19, 168]
	cmp	w0, w4
	bcs	.L2478
	mov	w20, 1888
	umull	x20, w0, w20
	ldr	x0, [x19, 2392]
	add	x1, x0, x20
	ldrb	w0, [x0, x20]
	cbnz	w0, .L2479
	str	w21, [x1, 28]
	mov	x0, x19
	ldr	x1, [x19, 2392]
	add	x1, x1, x20
	bl	HEVC_ProcessPPS
	mov	w22, w0
	cbnz	w0, .L2480
	ldr	x0, [x19, 2392]
	mov	w1, 1
	add	x0, x0, x20
	strb	w1, [x0, 1]
	ldr	x0, [x19, 2392]
	strb	w1, [x0, x20]
.L2474:
	mov	w0, w22
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L2479:
	ldr	x25, .LC738
	mov	x2, 1888
	ldr	x24, .LC739
	mov	w1, 0
	add	x23, x24, 1280
	ldr	x3, [x25, 96]
	mov	x0, x23
	blr	x3
	str	w21, [x23, 28]
	mov	x1, x23
	mov	x0, x19
	bl	HEVC_ProcessPPS
	mov	w22, w0
	cbnz	w0, .L2481
	ldr	x0, [x19, 2392]
	mov	w1, 1
	ldr	x3, [x25, 112]
	mov	x2, 1888
	strb	w1, [x23, 1]
	add	x0, x0, x20
	strb	w1, [x24, 1280]
	mov	x1, x23
	blr	x3
	ldr	x25, [sp, 64]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L2481:
	ldr	x2, .LC741
	mov	w3, w21
	mov	w1, 4866
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	b	.L2474
	.p2align 3
.L2478:
	ldr	x2, .LC737
	mov	w3, w0
	mov	w1, 4852
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	b	.L2474
.L2480:
	ldr	x2, .LC741
	mov	w1, 4884
	mov	w3, w21
	mov	w0, 1
	mov	w22, -1
	bl	dprint_normal
	ldr	x0, [x19, 2392]
	mov	w1, 1
	add	x0, x0, x20
	strb	w1, [x0, 1]
	ldr	x0, [x19, 2392]
	strb	wzr, [x0, x20]
	b	.L2474
	.size	HEVC_DecPPS, .-HEVC_DecPPS
	.align	3
.LC735:
	.xword	.LC734
	.align	3
.LC737:
	.xword	.LC736
	.align	3
.LC738:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC739:
	.xword	.LANCHOR5
	.align	3
.LC741:
	.xword	.LC740
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
	ldr	w1, [x28, 7028]
	mov	w4, 1888
	ldr	w0, [x28, 7044]
	ldr	x3, [x28, 2392]
	cmp	w1, 1
	stp	xzr, xzr, [x29, 112]
	stp	xzr, xzr, [x29, 128]
	stp	xzr, xzr, [x29, 144]
	stp	xzr, xzr, [x29, 160]
	stp	xzr, xzr, [x29, 176]
	stp	xzr, xzr, [x29, 192]
	stp	xzr, xzr, [x29, 208]
	stp	xzr, xzr, [x29, 224]
	smaddl	x3, w0, w4, x3
	beq	.L2556
	cbnz	w1, .L2486
	ldrb	w0, [x3, 11]
	cbz	w0, .L2486
.L2484:
	ldr	x1, .LC744
	add	x2, x28, 4096
	ldr	x0, [x28, 2368]
	mov	x21, x2
	ldr	w19, [x3, 32]
	add	x22, x21, 3068
	ldr	x20, [x28, 2384]
	str	x2, [x29, 104]
	bl	HEVC_ue_v
	cmp	w0, 7
	str	w0, [x28, 7164]
	bhi	.L2557
	mov	w1, 12644
	smaddl	x19, w19, w1, x20
	ldr	w1, [x19, 60]
	cbnz	w1, .L2558
	str	w0, [x22, 132]
.L2528:
	ldr	w0, [x28, 7084]
	mov	w20, 0
	cbz	w0, .L2498
	.p2align 2
.L2541:
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	add	x1, x29, 240
	add	x3, x1, x20, uxtw 2
	ldr	w1, [x28, 7084]
	add	w20, w20, 1
	cmp	w1, w20
	str	w0, [x3, -128]
	bhi	.L2541
	ldr	w0, [x19, 60]
	cbz	w0, .L2494
	mov	w20, 0
	cbz	w1, .L2498
	.p2align 2
.L2540:
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	add	x1, x29, 240
	add	x3, x1, x20, uxtw 2
	ldr	w1, [x28, 7084]
	add	w20, w20, 1
	cmp	w1, w20
	str	w0, [x3, -64]
	bhi	.L2540
.L2494:
	mov	w27, 0
	cbz	w1, .L2498
	ldr	x0, [x29, 104]
	ldr	x26, .LC762
	add	x21, x0, 3068
	b	.L2539
	.p2align 3
.L2500:
	add	x20, x28, x20
	ldr	w1, [x21]
	mov	w0, 1
	lsl	w0, w0, w1
	str	wzr, [x20, 7168]
	str	w0, [x20, 7300]
.L2502:
	ldr	w0, [x19, 60]
	cbz	w0, .L2504
	add	x0, x29, 240
	add	x0, x0, x22, lsl 2
	ldr	w0, [x0, -64]
	cbnz	w0, .L2505
	lsl	x22, x22, 3
	ldr	w3, [x21, 132]
	add	x1, x28, x22
	add	x22, x21, x22
	mov	w0, 1
	lsl	w0, w0, w3
	str	wzr, [x1, 7492]
	str	w0, [x1, 7364]
	str	w0, [x22, 204]
	str	wzr, [x22, 332]
.L2504:
	ldr	w0, [x28, 7084]
	add	w27, w27, 1
	cmp	w0, w27
	bls	.L2498
.L2539:
	uxtw	x22, w27
	add	x0, x29, 240
	lsl	x20, x22, 2
	add	x0, x0, x20
	ldr	w0, [x0, -128]
	cbz	w0, .L2500
	ldr	x1, .LC754
	ldr	x0, [x28, 2368]
	bl	HEVC_se_v
	add	w1, w0, 128
	cmp	w1, 255
	bhi	.L2559
	ldr	w3, [x21]
	add	x20, x28, x20
	mov	w23, 1
	ldr	x1, .LC758
	lsl	w3, w23, w3
	add	w0, w3, w0
	str	w0, [x20, 7300]
	ldr	x0, [x28, 2368]
	bl	HEVC_se_v
	add	w1, w0, 128
	cmp	w1, 255
	str	w0, [x20, 7168]
	bls	.L2502
	ldr	x2, .LC760
	mov	w3, w0
	mov	w1, 13246
	mov	w0, w23
	bl	dprint_normal
	mov	w0, -1
	b	.L2554
	.p2align 3
.L2556:
	ldrb	w0, [x3, 10]
	cbnz	w0, .L2484
.L2486:
	mov	w0, 0
.L2554:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 240
	ret
	.p2align 3
.L2505:
	ldr	x0, [x28, 2368]
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
	ldr	x1, .LC766
	bhi	.L2560
.L2506:
	ldr	w6, [x21, 132]
	lsl	w6, w22, w6
	add	w0, w6, w0
	str	w0, [x25, 7364]
	ldr	x0, [x28, 2368]
	bl	HEVC_se_v
	add	w1, w0, 512
	cmp	w1, 1023
	mov	w6, -128
	bhi	.L2561
	ldr	w1, [x25, 7364]
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
	str	w0, [x25, 7488]
	beq	.L2504
	ldr	x0, [x28, 2368]
	mov	x1, x26
	bl	HEVC_se_v
	add	w6, w0, 128
	cmp	w6, 255
	ldr	x1, .LC766
	bls	.L2506
.L2560:
	ldr	x2, .LC764
	mov	w1, 13266
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 240
	ret
	.p2align 3
.L2498:
	ldr	w0, [x28, 7028]
	cbnz	w0, .L2486
	ldr	w0, [x28, 7088]
	cbz	w0, .L2486
	mov	w20, 0
	.p2align 2
.L2512:
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	add	x1, x29, 240
	add	x3, x1, x20, uxtw 2
	ldr	w1, [x28, 7088]
	add	w20, w20, 1
	cmp	w1, w20
	str	w0, [x3, -128]
	bhi	.L2512
	ldr	w0, [x19, 60]
	cbnz	w0, .L2562
.L2513:
	mov	w25, 0
	cbz	w1, .L2486
	ldr	x0, [x29, 104]
	ldr	x23, .LC778
	add	x21, x0, 3068
	b	.L2537
	.p2align 3
.L2517:
	add	x20, x28, x20
	ldr	w1, [x21]
	mov	w0, 1
	lsl	w0, w0, w1
	str	wzr, [x20, 7232]
	str	w0, [x20, 7620]
.L2519:
	ldr	w0, [x19, 60]
	cbz	w0, .L2521
	add	x0, x29, 240
	add	x0, x0, x26, lsl 2
	ldr	w0, [x0, -64]
	cbnz	w0, .L2522
	lsl	x26, x26, 3
	ldr	w4, [x21, 132]
	add	x1, x28, x26
	add	x26, x21, x26
	mov	w0, 1
	lsl	w0, w0, w4
	str	wzr, [x1, 7812]
	str	w0, [x1, 7684]
	str	w0, [x26, 524]
	str	wzr, [x26, 652]
.L2521:
	ldr	w0, [x28, 7088]
	add	w25, w25, 1
	cmp	w0, w25
	bls	.L2486
.L2537:
	uxtw	x26, w25
	add	x0, x29, 240
	lsl	x20, x26, 2
	add	x0, x0, x20
	ldr	w0, [x0, -128]
	cbz	w0, .L2517
	ldr	x1, .LC770
	ldr	x0, [x28, 2368]
	bl	HEVC_se_v
	add	w1, w0, 128
	cmp	w1, 255
	bhi	.L2563
	ldr	w1, [x21]
	add	x20, x28, x20
	mov	w27, 1
	lsl	w1, w27, w1
	add	w0, w1, w0
	str	w0, [x20, 7620]
	ldr	x1, .LC774
	ldr	x0, [x28, 2368]
	bl	HEVC_se_v
	str	w0, [x20, 7232]
	add	w0, w0, 128
	cmp	w0, 255
	bls	.L2519
	ldr	x2, .LC776
	mov	w1, 13329
	mov	w0, w27
	bl	dprint_normal
	mov	w0, -1
	b	.L2554
	.p2align 3
.L2522:
	add	x22, x28, x26, lsl 3
	add	x26, x26, 1
	mov	w20, 1
	mov	w24, 128
	add	x26, x28, x26, lsl 3
	mov	w27, 127
.L2525:
	ldr	x0, [x28, 2368]
	mov	x1, x23
	bl	HEVC_se_v
	add	w5, w0, 128
	cmp	w5, 255
	ldr	x1, .LC782
	bhi	.L2564
	ldr	w5, [x21, 132]
	lsl	w5, w20, w5
	add	w0, w5, w0
	str	w0, [x22, 7684]
	ldr	x0, [x28, 2368]
	bl	HEVC_se_v
	add	w1, w0, 512
	cmp	w1, 1023
	mov	w5, -128
	bhi	.L2565
	ldr	w1, [x22, 7684]
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
	str	w0, [x22, 7808]
	cmp	x22, x26
	bne	.L2525
	b	.L2521
	.p2align 3
.L2558:
	ldr	x1, .LC748
	ldr	x0, [x28, 2368]
	bl	HEVC_se_v
	add	w1, w0, 7
	cmp	w1, 14
	bhi	.L2566
	ldr	w1, [x28, 7164]
	add	w0, w0, w1
	str	w0, [x22, 132]
	cmp	w0, 7
	bls	.L2528
	ldr	x2, .LC752
	mov	w1, 13212
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2554
	.p2align 3
.L2561:
	ldr	x2, .LC768
	mov	w1, 13276
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2554
.L2562:
	mov	w20, 0
	cbz	w1, .L2486
	.p2align 2
.L2538:
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	add	x1, x29, 240
	add	x3, x1, x20, uxtw 2
	ldr	w1, [x28, 7088]
	add	w20, w20, 1
	cmp	w1, w20
	str	w0, [x3, -64]
	bhi	.L2538
	b	.L2513
.L2559:
	ldr	x2, .LC756
	mov	w3, w0
	mov	w1, 13237
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2554
.L2564:
	ldr	x2, .LC780
	mov	w1, 13349
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2554
.L2565:
	ldr	x2, .LC784
	mov	w1, 13359
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2554
.L2563:
	ldr	x2, .LC772
	mov	w1, 13320
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2554
.L2557:
	ldr	x2, .LC746
	mov	w1, 13193
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2554
.L2566:
	ldr	x2, .LC750
	mov	w1, 13203
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2554
	.size	HEVC_DecPredWeightTable, .-HEVC_DecPredWeightTable
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecSliceSegmentHeader
	.type	HEVC_DecSliceSegmentHeader, %function
HEVC_DecSliceSegmentHeader:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x28, x0
	mov	x0, x30
	add	x25, x28, 4096
	bl	_mcount
	ldr	x2, [x28, 2408]
	mov	w1, 1
	ldr	x0, [x28, 2368]
	ldr	w20, [x2, 24]
	bl	BsGet
	strb	w0, [x25, 2912]
	ldr	w22, [x28, 7036]
	sub	w0, w22, #16
	str	w0, [x29, 136]
	cmp	w0, 5
	bls	.L2824
.L2568:
	ldr	x1, .LC786
	ldr	x0, [x28, 2368]
	bl	HEVC_ue_v
	str	w0, [x28, 7044]
	ldr	w5, [x28, 168]
	tbnz	w0, #31, .L2570
	cmp	w0, w5
	bge	.L2570
	mov	x0, x28
	bl	HEVC_VpsSpsPpsCheck
	cbnz	w0, .L2825
	ldr	x0, [x28, 2392]
	mov	w3, 1888
	ldr	w21, [x28, 7044]
	mov	w2, 12644
	ldr	x1, [x28, 2384]
	smaddl	x21, w21, w3, x0
	ldr	w19, [x21, 32]
	ldrb	w0, [x21, 2]
	smaddl	x19, w19, w2, x1
	cbnz	w0, .L2826
.L2576:
	strb	wzr, [x25, 2913]
.L2577:
	ldp	w3, w4, [x19, 140]
	cbz	w3, .L2579
	cbz	w4, .L2579
	ldr	w2, [x19, 64]
	mov	w1, 0
	ldr	w0, [x19, 172]
	add	w2, w3, w2
	sub	w2, w2, #1
	lsl	w0, w0, 1
	udiv	w3, w2, w3
	ldr	w2, [x19, 68]
	add	w2, w4, w2
	sub	w2, w2, #1
	udiv	w2, w2, w4
	mul	w2, w3, w2
	mov	w3, 1
	cmp	w2, 1
	lsl	w23, w3, w0
	ble	.L2581
	.p2align 2
.L2582:
	add	w1, w1, 1
	lsl	w0, w3, w1
	cmp	w2, w0
	bgt	.L2582
.L2581:
	ldrb	w0, [x25, 2912]
	str	wzr, [x29, 140]
	cbz	w0, .L2827
.L2583:
	ldr	w0, [x28, 188]
	str	w0, [x28, 7020]
	ldrb	w0, [x25, 2913]
	cbz	w0, .L2828
.L2586:
	ldr	w0, [x21, 12]
	tst	w0, 16776960
	bne	.L2678
.L2685:
	ldrb	w0, [x21, 23]
	cbnz	w0, .L2829
.L2680:
	ldr	w0, [x29, 140]
	cbnz	w0, .L2830
	ldrb	w0, [x28, 3]
	cbz	w0, .L2694
	ldr	w0, [x29, 136]
	cmp	w0, 5
	bhi	.L2695
	ldr	w0, [x28, 7040]
	mov	w2, 1
	add	x1, x28, x0
	strb	w2, [x1, 5]
.L2696:
	ldr	w1, [x28, 7020]
	cmp	w1, wzr
	ldr	w1, [x29, 136]
	ccmp	w1, 5, 2, ne
	bhi	.L2697
	ldr	w1, [x28, 7036]
	add	x0, x28, x0
	cmp	w1, 21
	beq	.L2831
	.p2align 2
.L2816:
	strb	wzr, [x0, 4]
.L2699:
	mov	x0, x28
	bl	HEVC_IsNewPic
	str	w0, [x28, 7160]
	mov	x0, x28
	bl	HEVC_ReadByteAlignment
	cmp	w0, wzr
	csetm	w0, ne
.L2809:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L2826:
	ldrb	w0, [x25, 2912]
	cbnz	w0, .L2576
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x25, 2913]
	b	.L2577
	.p2align 3
.L2828:
	ldr	w0, [x21, 36]
	mov	w23, 0
	cbz	w0, .L2591
	.p2align 2
.L2774:
	ldr	x0, [x28, 2368]
	mov	w1, 1
	add	w23, w23, w1
	bl	BsGet
	ldr	w0, [x21, 36]
	cmp	w0, w23
	bhi	.L2774
.L2591:
	ldr	x1, .LC797
	ldr	x0, [x28, 2368]
	bl	HEVC_ue_v
	cmp	w0, 2
	str	w0, [x28, 7028]
	bhi	.L2832
	ldrb	w0, [x21, 4]
	cbnz	w0, .L2833
	sub	w22, w22, #19
	cmp	w22, 1
	bls	.L2593
.L2864:
	ldrb	w0, [x28, 1]
	cbz	w0, .L2834
	ldr	w1, [x19, 116]
	mov	w2, 1
	ldr	w0, [x28, 184]
	lsl	w1, w2, w1
	mov	w2, w1
	str	w2, [x29, 128]
	udiv	w1, w0, w1
	msub	w1, w1, w2, w0
	sub	w0, w0, w1
	cbnz	w1, .L2700
	str	wzr, [x29, 132]
.L2596:
	ldr	w1, [x28, 7036]
	add	x20, x28, x20, uxtw 2
	sub	w1, w1, #16
	cmp	w1, 2
	ldr	w1, [x29, 132]
	csel	w0, w0, wzr, hi
	add	w4, w0, w1
	str	w4, [x28, 7020]
	ldr	w3, [x20, 208]
	cmp	w4, w3
	bgt	.L2598
	ldrb	w0, [x25, 2912]
	cmp	w0, 1
	beq	.L2835
.L2598:
	ldr	w0, [x28, 2340]
	cbnz	w0, .L2599
	ldr	w0, [x28, 7020]
	str	w0, [x28, 188]
.L2599:
	ldr	w0, [x28, 7032]
	cbnz	w0, .L2600
	ldr	w0, [x28, 7036]
	cmp	w0, 15
	bhi	.L2601
	mov	w1, 1
	tbz	x0, 0, .L2601
.L2602:
	sub	w0, w0, #7
	tst	w0, -3
	cset	w0, ne
	tst	w1, w0
	beq	.L2600
	ldr	w0, [x28, 7020]
	str	w0, [x28, 184]
	.p2align 2
.L2600:
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L2603
	ldr	w2, [x19, 176]
	mov	w1, 0
	mov	w3, 1
	mov	w0, 0
	cmp	w2, 1
	bls	.L2605
	.p2align 2
.L2773:
	add	w1, w1, 1
	lsl	w0, w3, w1
	cmp	w0, w2
	bcc	.L2773
	mov	w0, 0
	cbnz	w1, .L2836
.L2608:
	sxtw	x4, w0
	add	x0, x28, 8192
	lsl	x1, x4, 2
	sub	x0, x0, #252
	sub	x1, x1, x4
	mov	x2, 164
	lsl	x3, x1, 3
	sub	x1, x3, x1
	lsl	x1, x1, 1
	sub	x1, x1, x4
	add	x1, x19, x1, lsl 2
	add	x1, x1, 2148
	bl	memcpy
	add	x0, x25, 3844
	str	x0, [x29, 120]
.L2606:
	ldrb	w0, [x19, 8]
	cbz	w0, .L2610
	add	x0, x28, 8192
	ldr	w20, [x0, -252]
	mov	x1, x0
	ldr	w0, [x19, 180]
	str	x1, [x29, 112]
	ldr	w1, [x1, -248]
	add	w20, w20, w1
	cbnz	w0, .L2837
	mov	w24, 0
	str	wzr, [x29, 156]
.L2611:
	ldr	x1, .LC811
	ldr	x0, [x28, 2368]
	bl	HEVC_ue_v
	add	w0, w0, w24
	mov	w1, w0
	ldr	x0, [x29, 112]
	str	w1, [x29, 152]
	ldp	w3, w4, [x0, -252]
	add	w0, w3, w4
	add	w0, w0, w1
	cmp	w0, 16
	bhi	.L2838
	ldr	w1, [x29, 152]
	mov	w23, 0
	mov	w27, 0
	add	w0, w20, w1
	str	w0, [x29, 108]
	sub	w22, w0, #1
	cbz	w1, .L2627
	ldr	x0, [x29, 112]
	sub	x0, x0, #252
	str	x0, [x29, 144]
	b	.L2772
	.p2align 3
.L2841:
	ldr	w1, [x29, 156]
	cbnz	w1, .L2839
.L2618:
	sxtw	x0, w0
	ldr	x1, [x29, 144]
	add	x4, x19, x0
	add	x1, x1, x26
	add	x0, x19, x0, lsl 2
	ldrb	w4, [x4, 13]
	ldr	w20, [x0, 196]
	strb	w4, [x1, 12]
	mov	w1, 1
	ldr	x0, [x28, 2368]
	bl	BsGet
	uxtb	w0, w0
	cmp	w27, wzr
	add	x1, x28, x26, lsl 2
	ccmp	w27, w24, 4, ne
	cbnz	w0, .L2840
.L2622:
	str	w20, [x1, 8040]
	csel	w23, w23, wzr, ne
	str	wzr, [x1, 7096]
	ldr	w0, [x28, 7020]
	sub	w20, w20, w0
	str	w20, [x1, 7972]
.L2624:
	ldr	w0, [x29, 152]
	add	w27, w27, 1
	sub	w22, w22, #1
	cmp	w0, w27
	beq	.L2627
.L2772:
	cmp	w27, w24
	uxtw	x26, w22
	mov	w0, 0
	bcc	.L2841
	ldr	w1, [x19, 120]
	uxtw	x26, w22
	ldr	x0, [x28, 2368]
	bl	BsGet
	mov	w20, w0
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x1, [x29, 144]
	add	x1, x1, x26
	strb	w0, [x1, 12]
	mov	w1, 1
	ldr	x0, [x28, 2368]
	bl	BsGet
	uxtb	w0, w0
	cmp	w27, wzr
	add	x1, x28, x26, lsl 2
	ccmp	w27, w24, 4, ne
	cbz	w0, .L2622
.L2840:
	ldr	x1, .LC817
	ldr	x0, [x28, 2368]
	bl	HEVC_ue_v
	add	w23, w23, w0
	add	x2, x28, x26, lsl 2
	cmp	w27, wzr
	ccmp	w27, w24, 4, ne
	mov	w1, 1
	str	w1, [x2, 7096]
	cset	w1, eq
	cmp	w1, wzr
	csel	w23, w23, w0, eq
	ldr	w0, [x29, 128]
	ldr	w1, [x28, 7020]
	msub	w20, w23, w0, w20
	ldr	w0, [x29, 132]
	sub	w0, w1, w0
	add	w20, w20, w0
	str	w20, [x2, 8040]
	sub	w20, w20, w1
	str	w20, [x2, 7972]
	b	.L2624
	.p2align 3
.L2830:
	ldr	w0, [x28, 7040]
	add	x1, x28, x0
	ldrb	w1, [x1, 5]
	cbnz	w1, .L2696
.L2697:
	add	x0, x28, x0
	b	.L2816
	.p2align 3
.L2824:
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	b	.L2568
	.p2align 3
.L2827:
	ldr	x0, [x28, 2368]
	bl	BsGet
	str	w0, [x28, 7048]
	ldp	w1, w4, [x19, 188]
	mul	w4, w1, w4
	tbnz	w0, #31, .L2585
	cmp	w4, w0
	bls	.L2585
	mul	w0, w23, w0
	str	w0, [x29, 140]
	b	.L2583
	.p2align 3
.L2678:
	ldr	x1, .LC869
	ldr	x0, [x28, 2368]
	bl	HEVC_ue_v
	mov	w20, w0
	ldr	w0, [x21, 12]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L2842
	cmp	w0, 256
	ldr	w0, [x21, 68]
	beq	.L2843
	ldr	w1, [x19, 192]
	mul	w0, w0, w1
	sub	w0, w0, #1
.L2682:
	cmp	w0, 439
	mov	w1, 439
	csel	w4, w0, w1, ls
	cmp	w20, w4
	bhi	.L2844
	cbz	w20, .L2685
	ldr	x1, .LC873
	mov	w19, 0
	ldr	x0, [x28, 2368]
	bl	HEVC_ue_v
	cmp	w0, 31
	add	w22, w0, 1
	bhi	.L2845
	.p2align 2
.L2771:
	ldr	x0, [x28, 2368]
	mov	w1, w22
	add	w19, w19, 1
	bl	BsGet
	cmp	w20, w19
	bne	.L2771
	ldrb	w0, [x21, 23]
	cbz	w0, .L2680
.L2829:
	ldr	x1, .LC877
	ldr	x0, [x28, 2368]
	bl	HEVC_ue_v
	cmp	w0, 256
	mov	w20, w0
	bhi	.L2846
	ldr	x0, [x28, 2368]
	bl	BsResidBits
	cmp	w20, w0
	bhi	.L2691
	mov	w19, 0
	cbz	w20, .L2680
	.p2align 2
.L2770:
	ldr	x0, [x28, 2368]
	mov	w1, 8
	add	w19, w19, 1
	bl	BsGet
	cmp	w20, w19
	bne	.L2770
	b	.L2680
	.p2align 3
.L2694:
	ldr	w0, [x29, 136]
	cmp	w0, 5
	bhi	.L2695
	ldr	w0, [x28, 7040]
	add	x1, x28, x0
	add	x0, x28, x0
	strb	wzr, [x1, 5]
	b	.L2816
	.p2align 3
.L2700:
	ldr	w2, [x29, 128]
	str	wzr, [x29, 132]
	cmp	w1, w2, lsr 1
	bcc	.L2596
.L2708:
	ldr	w1, [x29, 128]
	add	w0, w0, w1
	b	.L2596
.L2842:
	ldr	w0, [x19, 192]
	sub	w0, w0, #1
	b	.L2682
	.p2align 3
.L2601:
	sub	w1, w0, #16
	cmp	w1, 7
	cset	w1, ls
	b	.L2602
	.p2align 3
.L2839:
	ldr	x0, [x28, 2368]
	bl	BsGet
	ldr	w5, [x19, 180]
	sub	w5, w5, #1
	tbnz	w0, #31, .L2620
	cmp	w5, w0
	bcs	.L2618
.L2620:
	ldr	x2, .LC815
	mov	w4, w0
	mov	w3, w27
	mov	w1, 7175
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
	.p2align 3
.L2627:
	ldr	x1, [x29, 112]
	ldr	w0, [x29, 108]
	str	w0, [x1, -244]
	cmp	w0, 16
	bhi	.L2847
.L2610:
	ldrb	w0, [x19, 9]
	cbnz	w0, .L2848
	strb	wzr, [x25, 2916]
.L2629:
	ldrb	w0, [x19, 6]
	cbnz	w0, .L2849
.L2704:
	ldr	w0, [x28, 7028]
	cmp	w0, 2
	bne	.L2850
.L2632:
	ldrb	w0, [x25, 2916]
	cbnz	w0, .L2851
.L2654:
	mov	w4, 2
.L2661:
	ldrb	w0, [x21, 11]
	cbz	w0, .L2652
	cbnz	w4, .L2652
.L2664:
	mov	x0, x28
	bl	HEVC_DecPredWeightTable
	cbnz	w0, .L2852
	ldr	w4, [x28, 7028]
.L2652:
	cmp	w4, 2
	beq	.L2665
	ldr	x1, .LC841
	ldr	x0, [x28, 2368]
	bl	HEVC_ue_v
	mov	w2, 4
	mov	w1, 5
	sub	w2, w2, w0
	sub	w3, w1, w0
	cmp	w2, 4
	str	w3, [x28, 7056]
	bhi	.L2853
.L2665:
	ldr	x1, .LC845
	ldr	x0, [x28, 2368]
	bl	HEVC_se_v
	ldr	w3, [x21, 48]
	mov	w1, 51
	add	w0, w0, w3
	str	w0, [x28, 7024]
	ldr	w4, [x19, 92]
	neg	w2, w4
	cmp	w0, w2
	ccmp	w0, w1, 0, ge
	bgt	.L2854
	ldrb	w0, [x21, 9]
	cbnz	w0, .L2855
.L2667:
	ldrb	w0, [x21, 18]
	cbz	w0, .L2815
	ldrb	w0, [x21, 19]
	cbnz	w0, .L2856
.L2673:
	ldrb	w0, [x21, 20]
	strb	w0, [x25, 2921]
	ldr	w1, [x21, 76]
	str	w1, [x28, 7068]
	ldr	w1, [x21, 80]
	str	w1, [x28, 7072]
.L2672:
	ldrb	w2, [x19, 6]
	mov	w1, 0
	cbz	w2, .L2676
	ldrh	w1, [x28, 7010]
	cmp	w1, wzr
	cset	w1, ne
.L2676:
	ldrb	w2, [x21, 17]
	cbz	w2, .L2677
	cmp	w0, wzr
	cset	w0, eq
	orr	w1, w0, w1
	cbnz	w1, .L2857
.L2677:
	strb	w2, [x25, 2922]
	b	.L2586
	.p2align 3
.L2850:
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x25, 2917]
	cbnz	w0, .L2858
	ldr	w0, [x21, 40]
	ldr	w4, [x28, 7028]
	str	w0, [x28, 7084]
	cbnz	w4, .L2640
	ldr	w0, [x21, 44]
	mov	w20, 0
	mov	w22, 0
	str	w0, [x28, 7088]
.L2638:
	ldr	x0, [x29, 120]
	cbz	x0, .L2859
	ldr	x0, [x29, 120]
	ldr	w3, [x0, 8]
	cmp	w3, 16
	bhi	.L2642
	cbz	w3, .L2644
	sub	w2, w3, #1
	ldr	x0, [x29, 120]
	add	x2, x2, 13
	mov	w3, 0
	add	x2, x0, x2
	add	x0, x0, 12
	.p2align 2
.L2646:
	ldrb	w1, [x0], 1
	cmp	w1, wzr
	csinc	w3, w3, w3, eq
	cmp	x2, x0
	bne	.L2646
	ldrb	w0, [x21, 22]
	cmp	w0, wzr
	ccmp	w3, 1, 4, ne
	ble	.L2644
	add	x2, x25, 4008
	add	x1, x25, 2912
	mov	x0, x28
	bl	HEVC_DecRefPicListsModification
	cbnz	w0, .L2811
	ldr	w4, [x28, 7028]
	cbnz	w4, .L2647
.L2705:
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x25, 2918]
	ldr	w4, [x28, 7028]
.L2647:
	cmp	w4, 2
	beq	.L2632
.L2706:
	ldrb	w0, [x21, 5]
	cbnz	w0, .L2860
.L2648:
	ldrb	w0, [x25, 2916]
	cbz	w0, .L2657
	cbz	w4, .L2861
	mov	w0, 1
	cmp	w4, 2
	strb	w0, [x25, 2920]
	beq	.L2654
.L2653:
	ldr	w0, [x28, 7084]
	cmp	w0, 1
	bls	.L2814
.L2656:
	ldr	x1, .LC835
	ldr	x0, [x28, 2368]
	bl	HEVC_ue_v
	str	w0, [x28, 7052]
	ldrb	w3, [x25, 2920]
	cbnz	w3, .L2862
	sub	w5, w20, #1
.L2659:
	cmp	w5, w0
	ccmp	w0, wzr, 1, cs
	bge	.L2814
	ldr	x2, .LC837
	mov	w4, w0
	mov	w1, 7418
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
	.p2align 3
.L2814:
	ldr	w4, [x28, 7028]
.L2657:
	ldrb	w0, [x21, 10]
	cbz	w0, .L2661
	cmp	w4, 1
	bne	.L2661
	b	.L2664
	.p2align 3
.L2695:
	ldr	w0, [x28, 7040]
	add	x0, x28, x0
	b	.L2816
.L2856:
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cbz	w0, .L2673
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x25, 2921]
	cbnz	w0, .L2672
	ldr	x1, .LC861
	ldr	x0, [x28, 2368]
	bl	HEVC_se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x28, 7068]
	bhi	.L2863
.L2674:
	ldr	x1, .LC865
	ldr	x0, [x28, 2368]
	bl	HEVC_se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x28, 7072]
	bls	.L2815
	ldr	x2, .LC867
	mov	w3, w0
	mov	w1, 7520
	mov	w0, 1
	bl	dprint_normal
	ldr	w0, [x21, 80]
	str	w0, [x28, 7072]
	.p2align 2
.L2815:
	ldrb	w0, [x25, 2921]
	b	.L2672
	.p2align 3
.L2644:
	cbnz	w4, .L2706
	b	.L2705
	.p2align 3
.L2833:
	ldr	x0, [x28, 2368]
	mov	w1, 1
	sub	w22, w22, #19
	bl	BsGet
	cmp	w22, 1
	bhi	.L2864
.L2593:
	ldr	w0, [x28, 2340]
	str	wzr, [x28, 7020]
	cbnz	w0, .L2630
	str	wzr, [x28, 188]
.L2630:
	ldr	w0, [x28, 7032]
	cbnz	w0, .L2631
	str	wzr, [x28, 184]
.L2631:
	ldrb	w0, [x19, 6]
	cbz	w0, .L2702
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x25, 2914]
	mov	w1, 1
	ldr	x0, [x28, 2368]
	bl	BsGet
	strb	w0, [x25, 2915]
.L2702:
	strb	wzr, [x25, 2916]
	str	xzr, [x29, 120]
	b	.L2704
	.p2align 3
.L2570:
	ldr	x3, .LC787
	mov	w4, w0
	ldr	x2, .LC789
	mov	w1, 6923
	add	x3, x3, 280
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
	.p2align 3
.L2855:
	ldr	x1, .LC849
	ldr	x0, [x28, 2368]
	bl	HEVC_se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x28, 7060]
	bhi	.L2865
	ldr	w4, [x21, 60]
	add	w1, w0, w4
	add	w1, w1, 12
	cmp	w1, 24
	bhi	.L2866
	ldr	x1, .LC855
	ldr	x0, [x28, 2368]
	bl	HEVC_se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x28, 7064]
	bhi	.L2867
	ldr	w1, [x21, 64]
	add	w3, w0, w1
	add	w0, w3, 12
	cmp	w0, 24
	bls	.L2667
	ldr	x2, .LC859
	mov	w1, 7485
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
	.p2align 3
.L2834:
	ldr	w1, [x19, 120]
	ldr	x0, [x28, 2368]
	bl	BsGet
	mov	w4, w0
	ldr	w0, [x19, 116]
	mov	w1, 1
	lsl	w1, w1, w0
	ldr	w0, [x28, 184]
	mov	w3, w1
	stp	w3, w4, [x29, 128]
	udiv	w1, w0, w1
	msub	w1, w1, w3, w0
	cmp	w4, w1
	sub	w0, w0, w1
	bcc	.L2868
.L2595:
	ldr	w2, [x29, 132]
	cmp	w2, w1
	bls	.L2596
	sub	w1, w2, w1
	ldr	w2, [x29, 128]
	cmp	w1, w2, lsr 1
	sub	w1, w0, w2
	csel	w0, w1, w0, hi
	b	.L2596
	.p2align 3
.L2603:
	ldr	w3, [x19, 176]
	add	x2, x25, 3844
	mov	x1, x19
	mov	x0, x28
	str	x2, [x29, 120]
	bl	HEVC_DecShortTermRefPicSet
	cbz	w0, .L2606
	ldr	x2, .LC803
	mov	w1, 7101
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
	.p2align 3
.L2836:
	ldr	x0, [x28, 2368]
	bl	BsGet
	ldr	w2, [x19, 176]
	sub	w4, w2, #1
	tbnz	w0, #31, .L2609
.L2605:
	sub	w4, w2, #1
	cmp	w4, w0
	bcs	.L2608
.L2609:
	ldr	x2, .LC805
	mov	w3, w0
	mov	w1, 7123
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2860:
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x25, 2919]
	ldr	w4, [x28, 7028]
	b	.L2648
.L2848:
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x25, 2916]
	b	.L2629
.L2640:
	mov	w22, 0
	str	wzr, [x28, 7088]
.L2639:
	cmp	w4, 2
	beq	.L2632
	mov	w20, 0
	b	.L2638
.L2858:
	ldr	x1, .LC821
	ldr	x0, [x28, 2368]
	bl	HEVC_ue_v
	add	w22, w0, 1
	cmp	w22, 16
	bhi	.L2869
	ldr	w4, [x28, 7028]
	str	w22, [x28, 7084]
	cbz	w4, .L2870
	str	wzr, [x28, 7088]
	b	.L2639
.L2851:
	mov	w0, 1
	mov	w4, 2
	strb	w0, [x25, 2920]
	b	.L2657
.L2857:
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x25, 2922]
	b	.L2586
.L2868:
	sub	w2, w1, w4
	cmp	w2, w3, lsr 1
	bcc	.L2595
	b	.L2708
	.p2align 3
.L2862:
	sub	w5, w22, #1
	b	.L2659
.L2831:
	mov	w1, 1
	strb	w1, [x0, 4]
	b	.L2699
.L2870:
	ldr	x1, .LC825
	ldr	x0, [x28, 2368]
	bl	HEVC_ue_v
	add	w20, w0, 1
	cmp	w20, 16
	bhi	.L2871
	ldr	w4, [x28, 7028]
	str	w20, [x28, 7088]
	cmp	w4, 2
	bne	.L2638
	b	.L2632
	.p2align 3
.L2846:
	ldr	x2, .LC879
	mov	w3, w0
	mov	w1, 7593
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2847:
	ldr	x2, .LC819
	mov	w4, 16
	ldr	w3, [x29, 108]
	mov	w1, 7226
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
	.p2align 3
.L2861:
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x25, 2920]
	ldr	w4, [x28, 7028]
	cmp	w4, 2
	beq	.L2665
	cbnz	w0, .L2653
	ldr	w0, [x28, 7088]
	cmp	w0, 1
	bhi	.L2656
	b	.L2657
.L2579:
	ldr	x2, .LC793
	mov	w1, 6958
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2843:
	ldr	w1, [x21, 72]
	mul	w0, w0, w1
	sub	w0, w0, #1
	b	.L2682
.L2837:
	ldr	x1, .LC807
	ldr	x0, [x28, 2368]
	bl	HEVC_ue_v
	mov	w24, w0
	ldr	w4, [x19, 180]
	cmp	w0, w4
	bhi	.L2872
	cmp	w4, 1
	str	wzr, [x29, 156]
	bls	.L2611
	mov	w1, 1
	.p2align 2
.L2613:
	ldr	w0, [x29, 156]
	add	w0, w0, 1
	str	w0, [x29, 156]
	lsl	w0, w1, w0
	cmp	w4, w0
	bhi	.L2613
	b	.L2611
.L2825:
	ldr	w0, [x28, 232]
	cbz	w0, .L2574
	ldr	w0, [x28, 188]
	str	w0, [x28, 7020]
.L2575:
	mov	x0, x28
	bl	HEVC_IsNewPic
	str	w0, [x28, 7160]
	ldr	x2, .LC791
	mov	w1, 6939
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2835:
	ldr	x2, .LC801
	mov	w1, 7077
	bl	dprint_normal
	b	.L2598
.L2854:
	ldr	x2, .LC847
	mov	w3, w0
	mov	w1, 7453
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2574:
	str	wzr, [x28, 7020]
	b	.L2575
.L2585:
	ldr	x2, .LC795
	mov	w3, w0
	mov	w1, 6977
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2832:
	ldr	x2, .LC799
	mov	w3, w0
	mov	w1, 7011
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2642:
	ldr	x2, .LC831
	mov	w4, 16
	mov	w1, 7344
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2853:
	ldr	x2, .LC843
	mov	w1, 7443
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2844:
	ldr	x2, .LC871
	mov	w3, w20
	mov	w1, 7566
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2863:
	ldr	x2, .LC863
	mov	w3, w0
	mov	w1, 7511
	mov	w0, 1
	bl	dprint_normal
	ldr	w0, [x21, 76]
	str	w0, [x28, 7068]
	b	.L2674
.L2691:
	ldr	x2, .LC881
	mov	w3, w0
	mov	w4, w20
	mov	w1, 7601
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2866:
	ldr	x2, .LC853
	mov	w3, w0
	mov	w1, 7470
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2838:
	ldr	x2, .LC813
	uxtw	x5, w1
	mov	w6, 16
	mov	w1, 7159
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2865:
	ldr	x2, .LC851
	mov	w3, w0
	mov	w1, 7463
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2852:
	ldr	x2, .LC839
	mov	w1, 7432
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2867:
	ldr	x2, .LC857
	mov	w3, w0
	mov	w1, 7478
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2872:
	ldr	x2, .LC809
	mov	w3, w0
	mov	w1, 7142
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2869:
	ldr	x2, .LC823
	mov	w4, 16
	mov	w3, w22
	mov	w1, 7291
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2845:
	ldr	x2, .LC875
	mov	w3, w22
	mov	w1, 7576
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2811:
	ldr	x2, .LC833
	mov	w1, 7374
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2859:
	ldr	x2, .LC829
	mov	w1, 7338
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2871:
	ldr	x2, .LC827
	mov	w4, 16
	mov	w3, w20
	mov	w1, 7303
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L2809
.L2849:
	ldr	x0, [x28, 2368]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x25, 2914]
	mov	w1, 1
	ldr	x0, [x28, 2368]
	bl	BsGet
	strb	w0, [x25, 2915]
	b	.L2704
	.size	HEVC_DecSliceSegmentHeader, .-HEVC_DecSliceSegmentHeader
	.align	3
.LC786:
	.xword	.LC785
	.align	3
.LC787:
	.xword	.LANCHOR4
	.align	3
.LC789:
	.xword	.LC788
	.align	3
.LC791:
	.xword	.LC790
	.align	3
.LC793:
	.xword	.LC792
	.align	3
.LC795:
	.xword	.LC794
	.align	3
.LC797:
	.xword	.LC796
	.align	3
.LC799:
	.xword	.LC798
	.align	3
.LC801:
	.xword	.LC800
	.align	3
.LC803:
	.xword	.LC802
	.align	3
.LC805:
	.xword	.LC804
	.align	3
.LC807:
	.xword	.LC806
	.align	3
.LC809:
	.xword	.LC808
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
	ldr	x1, [x19, 2408]
	cbz	x1, .L2875
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
.L2875:
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
	ldr	w2, [x20, 172]
	cbz	w2, .L2884
	.p2align 2
.L2887:
	ldr	x0, [x20, 2448]
	ldr	x0, [x0, w19, uxtw 3]
	mov	x1, x0
	cbz	x0, .L2882
	ldr	w0, [x20, 248]
	bl	HEVC_ReleaseNAL
	ldr	x0, [x20, 2448]
	str	xzr, [x0, w19, uxtw 3]
	ldr	w2, [x20, 172]
.L2882:
	add	w19, w19, 1
	cmp	w2, w19
	bhi	.L2887
.L2884:
	strb	wzr, [x20, 11]
	mov	w0, 2
	str	wzr, [x20, 200]
	str	w0, [x20, 180]
	mov	w0, 0
	str	wzr, [x20, 232]
	str	wzr, [x20, 240]
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
	add	x19, x20, 2824
	bl	_mcount
	add	x21, x20, 2960
	mov	x0, x20
	bl	HEVC_ClearAllSlice
	.p2align 2
.L2896:
	ldr	x0, [x19]
	cbz	x0, .L2892
	ldr	w1, [x0, 24]
	ldr	w0, [x20, 248]
	bl	FSP_ClearLogicFs
.L2892:
	ldr	x0, [x19, 136]
	cbz	x0, .L2893
	ldr	w1, [x0, 24]
	ldr	w0, [x20, 248]
	bl	FSP_ClearLogicFs
.L2893:
	ldr	x0, [x19, 272]
	cbz	x0, .L2894
	ldr	w1, [x0, 24]
	ldr	w0, [x20, 248]
	bl	FSP_ClearLogicFs
.L2894:
	ldr	x0, [x19, 408]
	cbz	x0, .L2895
	ldr	w1, [x0, 24]
	ldr	w0, [x20, 248]
	bl	FSP_ClearLogicFs
.L2895:
	str	xzr, [x19, 136]
	str	xzr, [x19, 272]
	str	xzr, [x19, 408]
	str	xzr, [x19], 8
	cmp	x19, x21
	bne	.L2896
	ldr	x0, [x20, 2432]
	ldr	w0, [x0, 184]
	add	w0, w0, 1
	str	w0, [x20, 2800]
	cmp	w0, 17
	bhi	.L2936
.L2897:
	ldr	x1, .LC884
	add	x4, x20, 2560
	add	x0, x20, 12288
	mov	x2, 200
	add	x0, x0, 3048
	ldr	x3, [x1, 96]
	mov	w1, 0
	stp	wzr, wzr, [x4, 244]
	stp	wzr, wzr, [x4, 252]
	str	wzr, [x20, 2820]
	blr	x3
	str	wzr, [x20, 15340]
	mov	w0, 16
	add	x1, x20, 2488
	str	w0, [x20, 15336]
	add	x0, x20, 2624
	.p2align 2
.L2898:
	str	xzr, [x1], 8
	cmp	x0, x1
	bne	.L2898
	add	x1, x20, 2760
	str	wzr, [x20, 7076]
	.p2align 2
.L2899:
	str	xzr, [x0], 8
	cmp	x0, x1
	bne	.L2899
	str	wzr, [x20, 7080]
	cbnz	w22, .L2900
	ldr	x0, [x20, 2464]
	ldr	w0, [x0, 888]
	cmp	w0, 1
	beq	.L2900
.L2902:
	add	x0, x20, 2140
	add	x1, x20, 2220
	.p2align 2
.L2901:
	str	wzr, [x0], 4
	cmp	x1, x0
	bne	.L2901
	ldr	w2, [x20, 172]
	mov	w19, 0
	cbz	w2, .L2908
	.p2align 2
.L2923:
	ldr	x0, [x20, 2448]
	uxtw	x21, w19
	ldr	x0, [x0, w19, uxtw 3]
	add	w19, w19, 1
	mov	x1, x0
	cbz	x0, .L2906
	ldr	x3, [x20, 2408]
	cmp	x0, x3
	beq	.L2906
	ldr	w0, [x20, 248]
	bl	HEVC_ReleaseNAL
	ldr	x0, [x20, 2448]
	str	xzr, [x0, x21, lsl 3]
	ldr	w2, [x20, 172]
.L2906:
	cmp	w2, w19
	bhi	.L2923
.L2908:
	mov	w0, 0
.L2904:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2900:
	mov	w1, 1
	mov	x0, x20
	str	w1, [x20, 144]
	bl	HEVC_ArrangeMem
	cbz	w0, .L2902
	cmp	w0, 2
	beq	.L2937
	ldr	x3, .LC882
	mov	w1, 9918
	ldr	x2, .LC886
	mov	w0, 0
	add	x3, x3, 312
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2936:
	ldr	x3, .LC882
	mov	w5, 17
	ldr	x2, .LC883
	mov	w4, w5
	add	x3, x3, 312
	mov	w1, 9861
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 17
	str	w0, [x20, 2800]
	b	.L2897
.L2937:
	add	x0, x20, 8192
	add	x0, x0, 176
	bl	ResetVoQueue
	mov	w0, -2
	b	.L2904
	.size	HEVC_InitDPB, .-HEVC_InitDPB
	.align	3
.LC882:
	.xword	.LANCHOR4
	.align	3
.LC883:
	.xword	.LC298
	.align	3
.LC884:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC886:
	.xword	.LC885
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
	ldr	w2, [x20, 172]
	cmn	w2, #1
	bne	.L2943
	b	.L2942
	.p2align 3
.L2940:
	add	w0, w2, 1
	cmp	w0, w19
	bls	.L2942
.L2943:
	umull	x1, w19, w21
	ldr	x0, [x20, 2456]
	add	w19, w19, 1
	add	x1, x0, x1
	ldr	w0, [x1, 32]
	cmp	w0, 1
	bne	.L2940
	ldr	w0, [x20, 248]
	bl	HEVC_ReleaseNAL
	ldr	w2, [x20, 172]
	add	w0, w2, 1
	cmp	w0, w19
	bhi	.L2943
.L2942:
	strb	wzr, [x20, 7]
	mov	w0, 0
	str	wzr, [x20, 152]
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
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x25, x20, 12288
	mov	w21, 0
	bl	_mcount
	add	x19, x25, 3248
	ldr	x2, .LC888
	mov	w1, 3184
	mov	w0, 20
	mov	w23, 16
	mov	w24, w0
	bl	dprint_normal
	strb	wzr, [x20, 4]
	mov	w0, -2147483647
	mov	w2, 1
	mov	w1, 2147483647
	strb	w2, [x20, 5]
	stp	w1, w0, [x20, 224]
	str	w0, [x20, 208]
	mov	x0, x20
	strb	wzr, [x20, 10]
	bl	HEVC_ClearAllNal
	add	x0, x20, 8192
	add	x0, x0, 176
	bl	ResetVoQueue
	ldr	x22, .LC889
	.p2align 2
.L2947:
	strb	wzr, [x19]
	add	x0, x19, 80
	strb	wzr, [x19, 1]
	mov	x2, 536
	strb	wzr, [x19, 2]
	mov	w1, 0
	str	wzr, [x19, 4]
	stp	w24, w23, [x19, 16]
	str	wzr, [x19, 44]
	ldr	x3, [x22, 96]
	blr	x3
	str	w21, [x19, 168]
	add	w21, w21, 1
	str	wzr, [x19, 56]
	str	x19, [x19, 72]
	cmp	w21, 20
	add	x19, x19, 616
	bne	.L2947
	add	x0, x20, 2140
	add	x1, x20, 2220
	.p2align 2
.L2948:
	str	wzr, [x0], 4
	cmp	x1, x0
	bne	.L2948
	ldr	w1, [x20, 172]
	mov	w0, 0
	cbz	w1, .L2952
	.p2align 2
.L2954:
	ldr	x1, [x20, 2448]
	str	xzr, [x1, w0, uxtw 3]
	add	w0, w0, 1
	ldr	w1, [x20, 172]
	cmp	w1, w0
	bhi	.L2954
.L2952:
	ldr	x3, [x22, 96]
	mov	w1, 0
	mov	x2, 200
	add	x0, x25, 3048
	blr	x3
	mov	w1, 16
	add	x0, x20, 2960
	str	w1, [x20, 15336]
	add	x1, x20, 3096
.L2950:
	str	xzr, [x0, -136]
	add	x0, x0, 8
	str	xzr, [x0, -8]
	str	xzr, [x0, 128]
	str	xzr, [x0, 264]
	cmp	x1, x0
	bne	.L2950
	add	x2, x20, 2560
	mov	w0, 17
	add	x19, x20, 2624
	stp	w0, wzr, [x2, 240]
	stp	wzr, wzr, [x2, 248]
	str	wzr, [x20, 2816]
	add	x0, x20, 2760
	str	wzr, [x20, 2820]
	.p2align 2
.L2953:
	str	xzr, [x19, -136]
	add	x19, x19, 8
	str	xzr, [x19, -8]
	cmp	x19, x0
	bne	.L2953
	ldr	x3, [x22, 96]
	add	x0, x20, 4096
	mov	w21, 2
	mov	x2, 1356
	str	w21, [x20, 180]
	mov	w1, 0
	str	wzr, [x20, 200]
	add	x0, x0, 2912
	str	wzr, [x20, 232]
	str	wzr, [x20, 240]
	str	xzr, [x20, 2408]
	blr	x3
	strb	wzr, [x20, 6]
	mov	w1, 8
	mov	w2, 1
	stp	w1, w1, [x20, 192]
	add	x1, x20, 2048
	strb	w2, [x20, 3]
	str	wzr, [x20, 176]
	mov	w0, 6
	ldr	x3, [x22, 96]
	stp	w0, w21, [x1, 180]
	stp	w0, w0, [x1, 172]
	str	w2, [x20, 7160]
	mov	w1, 64
	mov	w2, 16
	str	w1, [x20, 336]
	str	w2, [x20, 332]
	mov	w1, 1025
	mov	w2, 256
	str	w21, [x20, 7028]
	str	w2, [x20, 340]
	mov	x0, x19
	str	w1, [x20, 344]
	mov	x2, 40
	mov	w1, 0
	blr	x3
	str	x19, [x20, 2368]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	HEVC_InitDecPara, .-HEVC_InitDecPara
	.align	3
.LC888:
	.xword	.LC887
	.align	3
.LC889:
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
	ldr	x0, [x19, 6464]
	cbz	x0, .L2961
	ldr	w1, [x0, 24]
	ldr	w0, [x19, 248]
	bl	FSP_ClearLogicFs
	ldr	x0, [x19, 6464]
	str	wzr, [x0, 44]
	str	xzr, [x19, 6464]
.L2961:
	add	x19, x19, 4096
	mov	w0, 0
	strb	wzr, [x19, 2305]
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
	cbnz	w20, .L2968
	add	x0, x19, 8192
	add	x0, x0, 176
	bl	ResetVoQueue
	ldr	w0, [x19, 248]
	bl	FSP_ResetInstance
	mov	x0, x19
	bl	HEVC_InitDecPara
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2968:
	add	x1, x19, 8192
	ldr	w0, [x19, 248]
	add	x1, x1, 176
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
	ldr	w4, [x19, 7044]
	tbnz	w4, #31, .L2986
	ldr	w1, [x19, 168]
	mov	w0, 0
	cmp	w4, w1
	bge	.L3000
	ldr	x1, [x19, 2392]
	mov	w5, 1888
	mov	w0, 12644
	ldr	w2, [x19, 7040]
	ldr	x7, [x19, 2384]
	mov	w20, 1
	smaddl	x27, w4, w5, x1
	add	x2, x19, x2, lsl 2
	ldr	w1, [x19, 268]
	ldr	w23, [x19, 264]
	ldr	w6, [x27, 32]
	ldr	w24, [x19, 272]
	ldr	x8, [x19, 2376]
	smull	x6, w6, w0
	ldr	w25, [x19, 260]
	add	x28, x7, x6
	ldr	w0, [x19, 280]
	ldr	w26, [x19, 276]
	str	w1, [x29, 140]
	ldr	w1, [x28, 48]
	str	w4, [x2, 220]
	str	w0, [x29, 108]
	ldr	w0, [x27, 32]
	str	w0, [x2, 216]
	lsl	x0, x1, 4
	sub	x0, x0, x1
	add	x1, x8, x0, lsl 3
	ldr	w0, [x28, 48]
	str	w0, [x2, 212]
	ldr	w0, [x19, 176]
	ldr	w2, [x28, 128]
	cmp	w0, wzr
	ldr	w0, [x28, 64]
	cset	w21, eq
	cmp	w2, w24
	cset	w22, ne
	cmp	w23, w0
	beq	.L3008
.L2971:
	ldr	x0, [x19, 2424]
	orr	w22, w21, w22
	ldr	w2, [x1, 4]
	orr	w22, w22, w20
	ldr	w0, [x0, 4]
	cmp	w2, w0
	beq	.L3009
.L2972:
	ldr	x0, .LC890
	mov	w8, 120
	strb	wzr, [x1, 2]
	mov	x4, -120
	stp	x7, x6, [x29, 112]
	ldr	x9, [x0, 104]
	ldr	w0, [x19, 160]
	ldr	x2, [x19, 2376]
	str	x4, [x29, 128]
	smaddl	x0, w0, w8, x4
	str	w8, [x29, 136]
	add	x0, x2, x0
	mov	x2, 120
	blr	x9
	ldr	w0, [x19, 160]
	ldr	w8, [x29, 136]
	ldr	x4, [x29, 128]
	ldr	x1, [x19, 2376]
	ldp	x7, x6, [x29, 112]
	smaddl	x0, w0, w8, x4
	add	x0, x1, x0
	str	x0, [x19, 2424]
.L2973:
	ldr	x0, [x19, 2432]
	mov	w4, w22
	ldr	w1, [x28, 56]
	ldr	w2, [x0, 56]
	cmp	w2, w1
	beq	.L3010
.L2985:
	ldr	w0, [x0, 184]
	ldr	w1, [x28, 184]
	str	w4, [x29, 136]
	cmp	w1, w0
	mov	x1, x28
	mov	x0, x19
	cset	w22, ne
	bl	HEVC_UpdatePicSPS
	ldr	x0, [x19, 2440]
	ldr	w4, [x29, 136]
	ldr	w1, [x0, 28]
	ldr	w0, [x27, 28]
	cmp	w1, w0
	beq	.L3011
.L2976:
	mov	x0, x19
	mov	x2, x27
	mov	x1, x28
	bl	HEVC_UpdatePicPPS
	ldr	w0, [x19, 276]
	cmp	w26, w0
	mov	w0, 1
	beq	.L3012
.L2978:
	orr	w1, w22, w0
	ldr	x0, [x19, 2432]
	ldr	x4, [x19, 2464]
	ldr	w2, [x0, 96]
	ldr	w0, [x0, 88]
	cmp	w0, w2
	csel	w0, w0, w2, cs
	str	w0, [x4, 892]
	ldr	w0, [x28, 56]
	cmp	w0, w25
	beq	.L3013
.L2979:
	ldr	w2, [x29, 140]
	mov	w4, w22
	mov	w3, w24
	mov	w1, w23
	mov	x0, x19
	bl	HEVC_GetReRangeFlag
	cbnz	w0, .L2980
	ldr	x0, [x19, 2464]
	ldr	w1, [x0, 888]
	cmp	w1, 1
	beq	.L2980
.L2982:
	str	wzr, [x0, 896]
.L2981:
	ldr	w0, [x19, 2340]
	cbnz	w0, .L2984
	mov	x0, x19
	bl	HEVC_AllocFrameStore
	mov	w20, w0
	cbnz	w0, .L3014
.L2984:
	mov	x0, x19
	bl	HEVC_InitPicInfo
	mov	w0, 0
.L3000:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L3013:
	orr	w0, w21, w20
	orr	w0, w0, w1
	cbnz	w0, .L2979
	ldr	x0, [x19, 2464]
	ldr	w0, [x0, 888]
	cmp	w0, 1
	bne	.L2981
	.p2align 2
.L2980:
	mov	w1, 1
	mov	x0, x19
	bl	HEVC_InitDPB
	cmn	w0, #2
	beq	.L3000
	cbnz	w0, .L2983
	ldr	x0, [x19, 2464]
	b	.L2982
	.p2align 3
.L2986:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, 0
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L3010:
	ldrb	w1, [x7, x6]
	cmp	w1, wzr
	cset	w1, ne
	orr	w1, w22, w1
	mov	w22, 0
	cbnz	w1, .L2985
	ldr	x0, [x19, 2440]
	ldr	w1, [x0, 28]
	ldr	w0, [x27, 28]
	cmp	w1, w0
	bne	.L2976
.L3011:
	ldrb	w0, [x27, 1]
	cmp	w0, wzr
	cset	w0, ne
	orr	w4, w4, w0
	cbnz	w4, .L2976
	ldr	w0, [x19, 276]
	cmp	w26, w0
	mov	w0, 1
	bne	.L2978
.L3012:
	ldr	w0, [x19, 280]
	ldr	w1, [x29, 108]
	cmp	w0, w1
	cset	w0, ne
	b	.L2978
	.p2align 3
.L3009:
	ldrb	w0, [x1, 2]
	cmp	w0, wzr
	cset	w0, ne
	orr	w0, w21, w0
	cbz	w0, .L2973
	b	.L2972
	.p2align 3
.L3008:
	ldr	w0, [x28, 68]
	ldr	w2, [x29, 140]
	cmp	w0, w2
	cset	w20, ne
	b	.L2971
	.p2align 3
.L3014:
	ldr	x2, .LC894
	mov	w1, 9407
	mov	w0, 1
	bl	dprint_normal
	mov	w0, w20
	b	.L3000
.L2983:
	ldr	x2, .LC892
	mov	w3, w0
	mov	w1, 9389
	mov	w0, 1
	bl	dprint_normal
	mov	w1, 0
	mov	x0, x19
	bl	HEVC_ClearAll
	mov	w0, -1
	b	.L3000
	.size	HEVC_InitPic, .-HEVC_InitPic
	.align	3
.LC890:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC892:
	.xword	.LC891
	.align	3
.LC894:
	.xword	.LC893
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_OutputCurrPic
	.type	HEVC_OutputCurrPic, %function
HEVC_OutputCurrPic:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x19, [x20, 6464]
	ldr	w0, [x19, 44]
	cmp	w0, 1
	beq	.L3016
	mov	w0, 2
	str	w0, [x19, 44]
.L3016:
	ldr	w0, [x20, 6440]
	add	x21, x20, 4096
	mov	x2, 536
	add	x1, x21, 2376
	str	w0, [x19, 12]
	add	x0, x19, 80
	bl	memcpy
	mov	x0, x20
	mov	x1, x19
	bl	HEVC_GetImagePara
	ldrb	w0, [x21, 2304]
	cbnz	w0, .L3027
.L3017:
	add	x1, x19, 24
	mov	x0, x20
	bl	HEVC_OutputFrame.isra.9
	mov	w1, 0
	cbnz	w0, .L3028
.L3018:
	mov	w0, w1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3027:
	ldr	w1, [x19, 24]
	mov	w2, 1
	ldr	w0, [x20, 248]
	bl	FSP_SetRef
	b	.L3017
	.p2align 3
.L3028:
	ldr	x3, .LC895
	mov	w1, 10659
	ldr	x2, .LC897
	mov	w0, 0
	add	x3, x3, 328
	bl	dprint_normal
	mov	w1, 1
	mov	x0, x20
	bl	HEVC_ClearAll
	mov	w1, -1
	b	.L3018
	.size	HEVC_OutputCurrPic, .-HEVC_OutputCurrPic
	.align	3
.LC895:
	.xword	.LANCHOR4
	.align	3
.LC897:
	.xword	.LC896
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
	cbnz	w0, .L3032
	ldr	x0, [x19, 6464]
	mov	w2, 2
	mov	w1, 1
	str	w2, [x0, 48]
	str	w1, [x19, 13976]
	ldr	w0, [x19, 6408]
	ldr	w2, [x19, 6412]
	add	x0, x0, 52
	str	w2, [x19, x0, lsl 2]
	ldr	x0, [x19, 6464]
	strb	w1, [x0, 2]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3032:
	ldr	x3, .LC898
	mov	w1, 10676
	ldr	x2, .LC900
	mov	w0, 1
	add	x3, x3, 352
	bl	dprint_normal
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_FirstFrameFastOut, .-HEVC_FirstFrameFastOut
	.align	3
.LC898:
	.xword	.LANCHOR4
	.align	3
.LC900:
	.xword	.LC899
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
	cbz	x19, .L3038
	mov	x1, x19
	mov	x0, x20
	bl	HEVC_GetImagePara
	mov	x1, x19
	mov	x0, x20
	bl	HEVC_CheckFrameStore
	cbz	w0, .L3042
	cmn	w0, #3
	bne	.L3043
.L3037:
	mov	w0, 0
.L3034:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3042:
	add	x1, x19, 24
	mov	x0, x20
	bl	HEVC_OutputFrame.isra.9
	cbz	w0, .L3037
	ldr	x3, .LC901
	mov	w1, 11508
	ldr	x2, .LC902
	mov	w0, 0
	add	x3, x3, 376
	bl	dprint_normal
	mov	w1, 1
	mov	x0, x20
	bl	HEVC_ClearAll
	mov	w0, -1
	b	.L3034
	.p2align 3
.L3043:
	mov	w3, 11520
	ldr	x2, .LC904
	mov	w1, w3
	mov	w4, w0
	mov	w0, 1
	bl	dprint_normal
	ldr	w1, [x19, 168]
	mov	x0, x20
	bl	HEVC_DECRecycleImage
	mov	w0, -1
	b	.L3034
	.p2align 3
.L3038:
	mov	w0, -1
	b	.L3034
	.size	HEVC_OutputFrmToVO, .-HEVC_OutputFrmToVO
	.align	3
.LC901:
	.xword	.LANCHOR4
	.align	3
.LC902:
	.xword	.LC896
	.align	3
.LC904:
	.xword	.LC903
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DirectOutput
	.type	HEVC_DirectOutput, %function
HEVC_DirectOutput:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 4096
	bl	_mcount
	ldr	x19, [x20, 6464]
	mov	w4, 2
	mov	w3, 1
	mov	x2, 536
	add	x1, x21, 2376
	add	x0, x19, 80
	str	w4, [x19, 44]
	strb	wzr, [x19, 1]
	strb	w3, [x19, 2]
	ldr	w3, [x20, 6416]
	str	w3, [x19, 8]
	ldr	w3, [x20, 6440]
	str	w3, [x19, 12]
	bl	memcpy
	str	wzr, [x19, 56]
	ldr	w1, [x19, 24]
	mov	w2, 0
	ldr	w0, [x20, 248]
	bl	FSP_SetRef
	mov	x1, x19
	mov	x0, x20
	bl	HEVC_OutputFrmToVO
	str	wzr, [x19, 44]
	ldr	x3, .LC905
	mov	w22, w0
	mov	x2, 608
	mov	w1, 0
	add	x0, x21, 2304
	ldr	x3, [x3, 96]
	blr	x3
	ldr	w0, [x20, 6436]
	cmp	w0, 20
	beq	.L3045
	add	x0, x20, x0, uxtw 2
	mov	w1, 20
	str	wzr, [x0, 2140]
	str	w1, [x20, 6436]
.L3045:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_DirectOutput, .-HEVC_DirectOutput
	.align	3
.LC905:
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
	ldr	w4, [x19, 2804]
	cbz	w4, .L3050
	mov	w3, 2147483647
	mov	w20, -1
	mov	w0, 0
	.p2align 2
.L3053:
	add	x1, x19, x0, sxtw 3
	ldr	x1, [x1, 2824]
	ldr	w2, [x1, 4]
	cmp	w2, w3
	bge	.L3052
	ldr	w1, [x1]
	ands	w1, w1, 16776960
	csel	w3, w3, w2, ne
	cmp	w1, wzr
	csel	w20, w20, w0, ne
.L3052:
	add	w0, w0, 1
	cmp	w0, w4
	bne	.L3053
	cmn	w20, #1
	beq	.L3050
	add	x1, x19, x20, sxtw 3
	mov	w3, 1
	mov	x0, x19
	ldr	x2, [x1, 2824]
	strb	w3, [x2, 2]
	ldr	x1, [x1, 2824]
	bl	HEVC_OutputFrmToVO
	mov	w1, w20
	mov	x0, x19
	bl	HEVC_RemoveFrameStoreOutDPB
.L3050:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_RemoveFrmFullDPB, .-HEVC_RemoveFrmFullDPB
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
	ldr	x1, [x20, 2824]
	strb	w2, [x1, 2]
	ldr	x1, [x20, 2824]
	bl	HEVC_OutputFrmToVO
	mov	w22, w0
	ldr	x0, [x20, 2824]
	ldr	w1, [x0, 28]
	ldr	w2, [x0, 4]
	add	x1, x1, 52
	str	w2, [x19, x1, lsl 2]
	ldrb	w0, [x0, 1]
	cbnz	w0, .L3062
	mov	w1, w21
	mov	x0, x19
	bl	HEVC_RemoveApcStore
	mov	w1, w21
	mov	x0, x19
	bl	HEVC_RemoveFrameStoreOutDPB
.L3062:
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
	cbnz	w0, .L3068
	ldr	w1, [x29, 44]
	mov	x0, x19
	bl	HEVC_OutputOneFrmFromDPB
	mov	w1, 0
	cbnz	w0, .L3069
.L3065:
	ldr	x19, [sp, 16]
	mov	w0, w1
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3068:
	ldr	x3, .LC906
	mov	w1, 6481
	ldr	x2, .LC908
	mov	w0, 1
	add	x3, x3, 400
	bl	dprint_normal
	mov	w1, -1
	b	.L3065
	.p2align 3
.L3069:
	ldr	x3, .LC906
	mov	w1, 6489
	ldr	x2, .LC910
	mov	w0, 1
	add	x3, x3, 400
	bl	dprint_normal
	mov	w1, -1
	b	.L3065
	.size	HEVC_OutputUnRefPicWithMinPoc, .-HEVC_OutputUnRefPicWithMinPoc
	.align	3
.LC906:
	.xword	.LANCHOR4
	.align	3
.LC908:
	.xword	.LC907
	.align	3
.LC910:
	.xword	.LC909
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
	ldr	w2, [x19, 2804]
	cbnz	w2, .L3082
	b	.L3072
	.p2align 3
.L3073:
	cmp	w2, w20
	bls	.L3072
.L3082:
	add	x0, x19, x20, uxtw 3
	add	w20, w20, 1
	ldr	x0, [x0, 2824]
	ldrb	w1, [x0, 1]
	cbz	w1, .L3073
	strb	wzr, [x0, 1]
	mov	w2, 0
	ldr	w1, [x0, 24]
	ldr	w0, [x19, 248]
	bl	FSP_SetRef
	ldr	w2, [x19, 2804]
	cmp	w2, w20
	bhi	.L3082
	.p2align 2
.L3072:
	mov	x0, x19
	bl	HEVC_RemoveUnUsedFrameStore
	cbz	w0, .L3076
	mov	x0, x19
	bl	HEVC_RemoveUnUsedFrameStore
	cbnz	w0, .L3072
	b	.L3076
	.p2align 3
.L3078:
	bl	HEVC_GetMinPOC
	ldr	w1, [x29, 40]
	mov	x0, x19
	bl	HEVC_OutputOneFrmFromDPB
	cmn	w0, #1
	beq	.L3077
.L3076:
	ldr	w3, [x19, 2804]
	add	x2, x29, 40
	add	x1, x29, 44
	mov	x0, x19
	cbnz	w3, .L3078
	mov	w0, 0
.L3077:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_FlushDPB, .-HEVC_FlushDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_FlushOutputFrmFromDPB
	.type	HEVC_FlushOutputFrmFromDPB, %function
HEVC_FlushOutputFrmFromDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	HEVC_FlushDPB
	cbnz	w0, .L3090
	mov	x0, x19
	bl	HEVC_InitDecBuffers
	mov	w0, 0
.L3089:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3090:
	ldr	x3, .LC911
	mov	w1, 11433
	ldr	x2, .LC913
	mov	w0, 1
	add	x3, x3, 432
	bl	dprint_normal
	mov	w0, -1
	b	.L3089
	.size	HEVC_FlushOutputFrmFromDPB, .-HEVC_FlushOutputFrmFromDPB
	.align	3
.LC911:
	.xword	.LANCHOR4
	.align	3
.LC913:
	.xword	.LC912
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
	cbz	w0, .L3092
	ldr	x3, .LC914
	mov	w4, w0
	ldr	x2, .LC916
	mov	w1, 14003
	add	x3, x3, 464
	mov	w0, 0
	bl	dprint_normal
.L3092:
	mov	w1, 0
	mov	x0, x19
	bl	HEVC_InitDPB
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_ClearDPB, .-HEVC_ClearDPB
	.align	3
.LC914:
	.xword	.LANCHOR4
	.align	3
.LC916:
	.xword	.LC915
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
	ldr	x20, .LC917
	ldr	x22, .LC919
	add	x21, x20, 480
	b	.L3097
	.p2align 3
.L3099:
	bl	dprint_normal
	mov	x0, x19
	bl	HEVC_IncreaseDPBSize
	cbnz	w0, .L3107
.L3097:
	ldr	w6, [x19, 2800]
	mov	x3, x21
	ldr	w7, [x19, 2804]
	mov	x2, x22
	mov	w1, 6503
	mov	w0, 11
	cmp	w7, w6
	mov	w5, w6
	mov	w4, w7
	bcs	.L3099
.L3096:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3107:
	ldr	x2, .LC921
	mov	x3, x21
	mov	w1, 6508
	mov	w0, 1
	add	x20, x20, 480
	bl	dprint_normal
	ldr	x21, .LC923
	.p2align 2
.L3098:
	ldr	w6, [x19, 2800]
	mov	x3, x20
	ldr	w7, [x19, 2804]
	mov	x2, x21
	mov	w1, 6515
	mov	w0, 1
	cmp	w7, w6
	mov	w5, w6
	mov	w4, w7
	bcc	.L3096
	bl	dprint_normal
	mov	x0, x19
	bl	HEVC_OutputUnRefPicWithMinPoc
	cbz	w0, .L3098
	ldr	x2, .LC924
	mov	x3, x20
	mov	w1, 6521
	mov	w0, 1
	bl	dprint_normal
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
.LC917:
	.xword	.LANCHOR4
	.align	3
.LC919:
	.xword	.LC918
	.align	3
.LC921:
	.xword	.LC920
	.align	3
.LC923:
	.xword	.LC922
	.align	3
.LC924:
	.xword	.LC909
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InsertFrmInDPB
	.type	HEVC_InsertFrmInDPB, %function
HEVC_InsertFrmInDPB:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x2
	str	w1, [x29, 60]
	bl	_mcount
	ldr	w4, [x29, 60]
	cmp	w4, 16
	bhi	.L3112
	mov	x2, x19
	add	x1, x29, 60
	mov	x0, x20
	bl	HEVC_RemoveSamePocOutDPB
	ldr	w0, [x29, 60]
	mov	w3, 1
	ldr	x1, [x19, 64]
	mov	w2, w3
	add	x0, x20, x0, lsl 3
	str	x1, [x0, 2824]
	str	w3, [x1, 44]
	ldr	x1, [x0, 2824]
	ldr	w0, [x20, 248]
	ldr	w1, [x1, 24]
	bl	FSP_SetRef
	ldr	w0, [x29, 60]
	mov	x2, 536
	ldrb	w3, [x19]
	add	x1, x19, 72
	add	x0, x20, x0, lsl 3
	cmp	w3, wzr
	cset	w3, ne
	ldr	x0, [x0, 2824]
	strb	w3, [x0, 1]
	ldr	w22, [x29, 60]
	ldr	w3, [x19, 36]
	add	x21, x20, x22, uxtw 3
	ldr	x0, [x21, 2824]
	str	w3, [x0, 16]
	ldr	x0, [x21, 2824]
	add	x0, x0, 80
	bl	memcpy
	ldr	x0, [x21, 2824]
	add	w1, w22, 1
	ldr	w4, [x19, 40]
	mov	w2, 8
	ldr	x3, .LC929
	str	w4, [x0, 12]
	add	x0, x20, 2824
	ldr	x4, [x21, 2824]
	ldr	x5, [x19, 64]
	str	x5, [x4, 72]
	ldr	x4, [x21, 2824]
	ldr	w5, [x19, 16]
	str	w5, [x4, 8]
	ldr	x4, [x21, 2824]
	ldr	w5, [x19, 12]
	str	w5, [x4, 4]
	ldr	x4, [x21, 2824]
	ldr	w5, [x19, 8]
	str	w5, [x4, 28]
	bl	qsort
	ldr	w1, [x20, 2804]
	mov	x0, x20
	add	w1, w1, 1
	str	w1, [x20, 2804]
	ldr	x1, [x19, 64]
	bl	HEVC_GetAPC
	cbnz	w0, .L3113
	strb	wzr, [x19, 1]
	mov	w0, 0
.L3110:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3112:
	ldr	x3, .LC926
	mov	w1, 11164
	ldr	x2, .LC928
	mov	w0, 0
	add	x3, x3, 504
	bl	dprint_normal
	mov	x0, x20
	bl	HEVC_ClearDPB
	mov	w0, -1
	b	.L3110
	.p2align 3
.L3113:
	ldr	x3, .LC926
	mov	w4, w0
	ldr	x2, .LC931
	mov	w1, 11196
	add	x3, x3, 504
	mov	w0, 0
	bl	dprint_normal
	mov	x0, x20
	bl	HEVC_PrintDPBState
	mov	x0, x20
	bl	HEVC_ClearDPB
	mov	w0, -1
	b	.L3110
	.size	HEVC_InsertFrmInDPB, .-HEVC_InsertFrmInDPB
	.align	3
.LC926:
	.xword	.LANCHOR4
	.align	3
.LC928:
	.xword	.LC927
	.align	3
.LC929:
	.xword	HEVC_ComparePicByPocAsc
	.align	3
.LC931:
	.xword	.LC930
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
	add	x20, x19, 4096
	bl	_mcount
	ldrb	w0, [x20, 2304]
	cbnz	w0, .L3127
	ldr	x0, [x19, 6464]
	mov	w1, 2
	str	w1, [x0, 44]
.L3116:
	ldr	x1, [x19, 6464]
	mov	w2, 1
	mov	x0, x19
	strb	w2, [x1, 2]
	ldr	x1, [x19, 6464]
	bl	HEVC_CheckFrameStore
	cmn	w0, #1
	mov	w20, w0
	beq	.L3128
	cmn	w0, #3
	beq	.L3120
	mov	x0, x19
	bl	HEVC_OutputCurrPic
	cbnz	w0, .L3129
.L3120:
	mov	w0, 0
.L3117:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3127:
	mov	x0, x19
	bl	HEVC_SimpleSlideDPB
	ldr	w1, [x19, 2804]
	add	x2, x20, 2304
	mov	x0, x19
	bl	HEVC_InsertFrmInDPB
	cbz	w0, .L3116
	ldr	x3, .LC932
	mov	w4, 10701
	ldr	x2, .LC934
	mov	w5, w0
	add	x3, x3, 528
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L3117
	.p2align 3
.L3129:
	ldr	x3, .LC932
	mov	w1, 10728
	ldr	x2, .LC937
	mov	w0, 0
	add	x3, x3, 528
	bl	dprint_normal
	mov	w0, -1
	b	.L3117
.L3128:
	ldr	x3, .LC932
	mov	w1, 10715
	ldr	x2, .LC936
	mov	w0, 0
	add	x3, x3, 528
	bl	dprint_normal
	mov	w0, w20
	b	.L3117
	.size	HEVC_SimpleDPBProcess, .-HEVC_SimpleDPBProcess
	.align	3
.LC932:
	.xword	.LANCHOR4
	.align	3
.LC934:
	.xword	.LC933
	.align	3
.LC936:
	.xword	.LC935
	.align	3
.LC937:
	.xword	.LC899
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
	ldr	w0, [x19, 2800]
	ldr	w1, [x19, 2804]
	cmp	w1, w0
	bcs	.L3142
.L3131:
	add	x2, x19, 4096
	mov	x0, x19
	add	x2, x2, 2304
	bl	HEVC_InsertFrmInDPB
	cbnz	w0, .L3143
	ldr	x1, [x19, 6464]
	mov	x0, x19
	bl	HEVC_CheckFrameStore
	cmn	w0, #1
	mov	w20, w0
	beq	.L3144
	cmn	w0, #3
	beq	.L3137
	mov	x0, x19
	bl	HEVC_OutputCurrPic
	cbnz	w0, .L3145
.L3137:
	mov	w0, 0
.L3134:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3142:
	mov	x0, x19
	bl	HEVC_RemoveUnusedApcStore
	mov	x0, x19
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	w0, 1
	beq	.L3141
	ldr	x3, .LC938
	mov	w1, 10747
	ldr	x2, .LC940
	mov	w0, 0
	add	x3, x3, 552
	bl	dprint_normal
.L3141:
	ldr	w1, [x19, 2804]
	b	.L3131
.L3145:
	ldr	x3, .LC938
	mov	w1, 10776
	ldr	x2, .LC944
	mov	w0, 0
	add	x3, x3, 552
	bl	dprint_normal
	mov	w0, -1
	b	.L3134
	.p2align 3
.L3143:
	ldr	x3, .LC938
	mov	w1, 10755
	ldr	x2, .LC942
	mov	w0, 0
	add	x3, x3, 552
	bl	dprint_normal
	mov	w0, -1
	b	.L3134
.L3144:
	ldr	x3, .LC938
	mov	w1, 10763
	ldr	x2, .LC943
	mov	w0, 0
	add	x3, x3, 552
	bl	dprint_normal
	mov	w0, w20
	b	.L3134
	.size	HEVC_DecOrderProcess, .-HEVC_DecOrderProcess
	.align	3
.LC938:
	.xword	.LANCHOR4
	.align	3
.LC940:
	.xword	.LC939
	.align	3
.LC942:
	.xword	.LC941
	.align	3
.LC943:
	.xword	.LC935
	.align	3
.LC944:
	.xword	.LC899
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CreateLostPicture
	.type	HEVC_CreateLostPicture, %function
HEVC_CreateLostPicture:
	sub	sp, sp, #608
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
	ldr	x3, .LC945
	mov	x2, 608
	mov	w1, 0
	add	x0, x29, 80
	add	x19, x19, 3248
	ldr	x3, [x3, 96]
	blr	x3
	.p2align 2
.L3152:
	ldr	w0, [x19, 44]
	cbnz	w0, .L3147
	cbz	x19, .L3148
	ldr	w2, [x20, 2804]
	cbz	w2, .L3148
	ldr	x0, [x20, 2824]
	cmp	x19, x0
	beq	.L3147
	sub	w2, w2, #1
	mov	x0, x20
	add	x2, x20, x2, lsl 3
	b	.L3150
	.p2align 3
.L3151:
	ldr	x1, [x0, 2824]
	cmp	x19, x1
	beq	.L3147
.L3150:
	cmp	x2, x0
	add	x0, x0, 8
	bne	.L3151
.L3148:
	sxtw	x3, w21
	mov	w4, 101
	lsl	x1, x3, 2
	mov	x2, 536
	sub	x1, x1, x3
	add	x0, x29, 152
	lsl	x1, x1, 2
	mov	w24, 1
	sub	x1, x1, x3
	strb	w24, [x29, 81]
	lsl	x23, x1, 3
	strb	w24, [x29, 80]
	sub	x1, x23, x1
	str	w22, [x29, 92]
	str	w4, [x29, 120]
	add	x23, x20, x1, lsl 3
	add	x25, x23, 12288
	add	x1, x25, 3328
	bl	memcpy
	strb	w24, [x25, 3250]
	str	wzr, [x23, 15584]
	cmp	w21, 19
	strb	w24, [x25, 3248]
	str	x19, [x29, 144]
	str	wzr, [x29, 248]
	bgt	.L3153
	ldr	w5, [x20, 2804]
	cbz	w5, .L3155
	mov	w6, 0
	mov	w3, 2147483647
	mov	w1, 0
	.p2align 2
.L3158:
	add	x0, x20, x1, sxtw 3
	add	w1, w1, 1
	ldr	x4, [x0, 2824]
	ldr	w0, [x4, 4]
	sub	w0, w0, w22
	sxtw	x0, w0
	eor	x2, x0, x0, asr 63
	sub	x2, x2, x0, asr 63
	cmp	w2, w3
	bge	.L3157
	ldrb	w0, [x4, 1]
	cmp	w0, wzr
	csel	w3, w3, w2, eq
	csinc	w6, w6, wzr, eq
.L3157:
	cmp	w1, w5
	bne	.L3158
	cbz	w6, .L3155
	mov	w1, 0
	b	.L3159
	.p2align 3
.L3160:
	cmp	w5, w1
	beq	.L3161
.L3159:
	sxtw	x19, w1
	add	w1, w1, 1
	add	x19, x19, 352
	add	x19, x20, x19, lsl 3
	ldr	x2, [x19, 8]
	ldr	w0, [x2, 4]
	sub	w0, w0, w22
	sxtw	x0, w0
	eor	x4, x0, x0, asr 63
	sub	x4, x4, x0, asr 63
	cmp	w3, w4
	bne	.L3160
	ldrb	w0, [x2, 1]
	cbz	w0, .L3160
	ldp	w1, w23, [x2, 24]
	ldr	w0, [x20, 248]
	bl	FSP_GetLogicFs
	mov	x21, x0
	ldr	x3, [x19, 8]
	mov	w4, w22
	ldr	x2, .LC953
	mov	w1, 10477
	mov	w0, 1
	ldr	w3, [x3, 4]
	bl	dprint_normal
	cbz	x21, .L3161
	ldr	x0, [x21, 24]
	cbz	x0, .L3195
	ldr	x0, [x21, 40]
	cbz	x0, .L3196
	ldr	w0, [x20, 248]
	mov	w1, 3
	bl	FSP_NewLogicFs
	mov	w1, w0
	mov	w19, w0
	ldr	w0, [x20, 248]
	bl	FSP_GetLogicFs
	mov	x1, x0
	cmp	w19, wzr
	ldr	x3, [x29, 144]
	ccmp	x0, xzr, 4, ge
	beq	.L3165
	str	w19, [x3, 24]
	add	x2, x29, 80
	mov	x0, x20
	ldr	x3, [x21, 24]
	str	x3, [x1, 24]
	ldr	x3, [x21, 32]
	str	x3, [x1, 32]
	ldr	x3, [x21, 40]
	str	x3, [x1, 40]
	ldr	x3, [x21, 40]
	ldr	w1, [x20, 2804]
	ldr	w3, [x3, 4]
	str	w3, [x29, 116]
	str	w23, [x29, 88]
	bl	HEVC_InsertFrmInDPB
	cbnz	w0, .L3197
	ldr	w0, [x20, 248]
	mov	w2, 0
	mov	w1, w19
	bl	FSP_SetDisplay
	ldr	w1, [x20, 7040]
	mov	w2, 2147483647
	mov	w0, 0
	add	x20, x20, x1, lsl 2
	ldr	w1, [x20, 224]
	cmp	w1, w2
	bne	.L3181
	str	w22, [x20, 224]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	add	sp, sp, 608
	ret
	.p2align 3
.L3147:
	add	w21, w21, 1
	add	x19, x19, 616
	cmp	w21, 20
	bne	.L3152
.L3153:
	ldr	x2, .LC947
	mov	w1, 10451
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
.L3181:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	add	sp, sp, 608
	ret
	.p2align 3
.L3161:
	ldr	x2, .LC949
	mov	w1, 10484
	mov	w0, 0
	bl	dprint_normal
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	mov	w0, -1
	add	sp, sp, 608
	ret
.L3165:
	ldr	x2, .LC959
	mov	w1, 10510
	mov	w0, 0
	strb	wzr, [x3]
	bl	dprint_normal
	mov	w0, -1
	b	.L3181
.L3197:
	ldr	x0, [x29, 144]
	mov	w1, w19
	strb	wzr, [x0]
	ldr	w0, [x20, 248]
	bl	FSP_ClearLogicFs
	ldr	x2, .LC961
	mov	w1, 10526
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L3181
.L3155:
	ldr	x2, .LC951
	mov	w1, 10467
	strb	wzr, [x19]
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L3181
.L3196:
	ldr	x2, .LC957
	mov	w1, 10495
	bl	dprint_normal
	mov	x0, x20
	bl	HEVC_ClearDPB
	mov	w0, -1
	b	.L3181
.L3195:
	ldr	x2, .LC955
	mov	w1, 10489
	bl	dprint_normal
	mov	x0, x20
	bl	HEVC_ClearDPB
	mov	w0, -1
	b	.L3181
	.size	HEVC_CreateLostPicture, .-HEVC_CreateLostPicture
	.align	3
.LC945:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC947:
	.xword	.LC946
	.align	3
.LC949:
	.xword	.LC948
	.align	3
.LC951:
	.xword	.LC950
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
	ldr	x20, .LC963
	b	.L3199
	.p2align 3
.L3202:
	bl	HEVC_CheckThatAllRefPicsAreAvailable.part.7
	cbnz	w0, .L3204
	ldr	w3, [x29, 44]
	mov	w1, 6560
	mov	x2, x20
	mov	w0, 1
	bl	dprint_normal
	ldr	x1, [x19, 2464]
	mov	x0, x19
	ldr	w1, [x1, 4]
	cbz	w1, .L3200
	ldr	w1, [x29, 44]
	bl	HEVC_CreateLostPicture
	cbnz	w0, .L3207
.L3199:
	ldr	w2, [x19, 7036]
	add	x1, x29, 44
	mov	x0, x19
	sub	w2, w2, #19
	cmp	w2, 2
	bhi	.L3202
.L3204:
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
.L3200:
	ldr	w4, [x19, 7020]
	mov	w3, 0
	ldr	w5, [x29, 44]
	mov	w1, 6575
	ldr	x2, .LC965
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3207:
	mov	x0, x19
	bl	HEVC_RemoveDummyFrame
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_RefPicProcess, .-HEVC_RefPicProcess
	.align	3
.LC963:
	.xword	.LC962
	.align	3
.LC965:
	.xword	.LC964
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_OutputFrmFromDPB
	.type	HEVC_OutputFrmFromDPB, %function
HEVC_OutputFrmFromDPB:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 2804]
	ldr	w24, [x19, 6408]
	cbz	w1, .L3209
	mov	w27, 0
	mov	w20, 0
	uxtw	x21, w24
	b	.L3212
	.p2align 3
.L3210:
	add	w20, w20, 1
	cmp	w1, w20
	bls	.L3272
.L3212:
	add	x0, x19, x20, uxtw 3
	ldr	x0, [x0, 2824]
	ldrb	w2, [x0, 2]
	cbnz	w2, .L3210
	ldr	w2, [x0, 28]
	cmp	w24, w2
	bne	.L3210
	add	x2, x21, 52
	ldr	w3, [x0, 4]
	ldr	w2, [x19, x2, lsl 2]
	cmp	w3, w2
	blt	.L3211
	add	w20, w20, 1
	add	w27, w27, 1
	cmp	w1, w20
	bhi	.L3212
	.p2align 2
.L3272:
	ldr	w0, [x19, 2348]
	cmp	w0, 1
	beq	.L3236
.L3213:
	ldr	w0, [x19, 7032]
	ldr	x2, [x19, 2432]
	add	x0, x2, x0, lsl 2
	ldr	w26, [x0, 356]
.L3215:
	cbz	w1, .L3238
	uxtw	x25, w24
	add	x0, x19, 4096
	mov	w20, 0
	mov	w28, 0
	lsl	x22, x25, 2
	mov	w23, -2147483647
	str	x0, [x29, 104]
	.p2align 2
.L3225:
	add	x21, x19, x20, uxtw 3
	ldr	x0, [x21, 2824]
	ldrb	w2, [x0, 2]
	cbnz	w2, .L3217
	ldr	w3, [x0, 28]
	cmp	w24, w3
	beq	.L3273
.L3217:
	add	x3, x25, 52
	ldr	w3, [x19, x3, lsl 2]
.L3219:
	cbz	w3, .L3223
	ldr	w4, [x19, 328]
	cmp	w4, 1
	beq	.L3223
.L3224:
	cbnz	w2, .L3222
	ldr	w4, [x0, 4]
.L3269:
	ldr	w2, [x19, 7020]
	add	w2, w2, 100
	cmp	w4, w2
	ble	.L3222
	add	x2, x19, x22
	ldr	w3, [x2, 224]
	cmp	w3, w23
	beq	.L3222
	ldr	w3, [x19, 328]
	cmp	w3, 1
	beq	.L3274
	.p2align 2
.L3222:
	add	w20, w20, 1
	cmp	w1, w20
	bhi	.L3225
.L3216:
	ldr	w2, [x19, 2800]
	mov	w0, w28
	cmp	w2, w1
	beq	.L3275
.L3256:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3223:
	ldr	w4, [x0, 4]
	cmp	w4, w3
	bgt	.L3224
	cbnz	w2, .L3222
.L3237:
	ldr	w1, [x0, 24]
	mov	w2, 0
	ldr	w0, [x19, 248]
	bl	FSP_SetDisplay
	ldr	w1, [x19, 2804]
	b	.L3222
	.p2align 3
.L3273:
	add	x7, x19, x22
	ldr	w4, [x0, 4]
	ldr	w3, [x7, 208]
	cmp	w4, w3
	blt	.L3220
	ldr	x5, [x29, 104]
	ldr	w9, [x5, 2936]
	cmp	w9, 6
	ccmp	w26, w27, 2, ls
	bcs	.L3219
	ldr	w8, [x5, 2924]
	cmp	w4, w8
	blt	.L3221
	add	x4, x19, x25
	ldrb	w4, [x4, 4]
	cbz	w4, .L3219
.L3221:
	mov	w1, 1
	strb	w1, [x0, 2]
	mov	x0, x19
	str	x7, [x29, 96]
	ldr	x1, [x21, 2824]
	sub	w27, w27, #1
	bl	HEVC_OutputFrmToVO
	mov	w28, w0
	ldr	x0, [x21, 2824]
	ldr	x7, [x29, 96]
	ldr	w0, [x0, 4]
	str	w0, [x7, 208]
	ldr	w1, [x19, 2804]
	b	.L3222
	.p2align 3
.L3220:
	cbz	w3, .L3237
	ldr	w2, [x19, 328]
	cmp	w2, 1
	bne	.L3269
	b	.L3237
	.p2align 3
.L3211:
	ldr	w1, [x0, 24]
	mov	w2, 0
	ldr	w0, [x19, 248]
	bl	FSP_SetDisplay
	ldr	w1, [x19, 2804]
	b	.L3210
	.p2align 3
.L3275:
	cbz	w1, .L3240
	ldr	x4, [x19, 2824]
	ldrb	w3, [x4, 1]
	cbz	w3, .L3256
	sub	w1, w1, #1
	mov	x0, x19
	add	x3, x19, x1, lsl 3
	b	.L3228
	.p2align 3
.L3229:
	ldr	x1, [x0, 2832]
	add	x0, x0, 8
	ldrb	w1, [x1, 1]
	cbz	w1, .L3276
.L3228:
	cmp	x0, x3
	bne	.L3229
	ldr	w0, [x4, 64]
	mov	x1, x4
	cbnz	w0, .L3231
	ldr	w0, [x4, 60]
	cbnz	w0, .L3231
	sub	w2, w2, #1
	mov	x0, x19
	add	x2, x19, x2, lsl 3
	b	.L3234
	.p2align 3
.L3235:
	ldr	x1, [x0, 2832]
	add	x0, x0, 8
	ldr	w3, [x1, 64]
	cbnz	w3, .L3231
	ldr	w3, [x1, 60]
	cbnz	w3, .L3231
.L3234:
	cmp	x2, x0
	bne	.L3235
.L3240:
	mov	w0, -1
	b	.L3256
.L3209:
	ldr	w0, [x19, 2348]
	mov	w27, 0
	cmp	w0, 1
	bne	.L3213
	.p2align 2
.L3236:
	ldr	x3, [x19, 2432]
	mov	w26, 0
	add	x0, x3, 356
	add	x3, x3, 384
	.p2align 2
.L3214:
	ldr	w2, [x0], 4
	cmp	w26, w2
	csel	w26, w26, w2, cs
	cmp	x0, x3
	bne	.L3214
	b	.L3215
	.p2align 3
.L3276:
	mov	w0, w28
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3274:
	strb	w3, [x0, 2]
	mov	x0, x19
	str	x2, [x29, 96]
	sub	w27, w27, #1
	ldr	x1, [x21, 2824]
	bl	HEVC_OutputFrmToVO
	mov	w28, w0
	ldr	x2, [x29, 96]
	ldr	w0, [x19, 7020]
	ldr	w1, [x2, 208]
	cmp	w0, w1
	bge	.L3270
	sub	w0, w0, #1
	str	w0, [x2, 208]
.L3270:
	ldr	w1, [x19, 2804]
	b	.L3222
	.p2align 3
.L3231:
	strb	wzr, [x1, 1]
	mov	w2, 0
	ldr	w1, [x1, 24]
	ldr	w0, [x19, 248]
	bl	FSP_SetRef
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3238:
	mov	w28, 0
	b	.L3216
	.size	HEVC_OutputFrmFromDPB, .-HEVC_OutputFrmFromDPB
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
	ldr	w0, [x19, 13976]
	cmp	w0, 1
	beq	.L3278
	mov	x0, x19
	bl	HEVC_FirstFrameFastOut
	cbnz	w0, .L3301
.L3278:
	ldr	w0, [x19, 2800]
	ldr	w1, [x19, 2804]
	cmp	w1, w0
	bcs	.L3302
.L3280:
	add	x2, x19, 4096
	mov	x0, x19
	add	x2, x2, 2304
	bl	HEVC_InsertFrmInDPB
	cbnz	w0, .L3303
	ldr	w0, [x19, 2804]
	cbnz	w0, .L3304
.L3283:
	ldr	w1, [x19, 2800]
	cmp	w1, w0
	bls	.L3305
.L3300:
	mov	w0, 0
.L3279:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3305:
	add	x1, x19, 8192
	ldr	w0, [x19, 248]
	add	x1, x1, 176
	bl	FSP_IfCanGetDecFs
	cbz	w0, .L3300
	mov	x0, x19
	bl	HEVC_RemoveFrmFullDPB
	b	.L3300
	.p2align 3
.L3302:
	mov	x0, x19
	bl	HEVC_RemoveUnusedApcStore
	mov	x0, x19
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	w0, 1
	beq	.L3299
	ldr	x2, .LC970
	mov	w1, 10830
	mov	w0, 0
	bl	dprint_normal
.L3299:
	ldr	w1, [x19, 2804]
	b	.L3280
	.p2align 3
.L3304:
	mov	x0, x19
	bl	HEVC_OutputFrmFromDPB
	cbnz	w0, .L3284
	ldr	w0, [x19, 2804]
	b	.L3283
	.p2align 3
.L3303:
	ldr	x2, .LC972
	mov	w3, w0
	mov	w1, 10838
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L3279
.L3301:
	ldr	x3, .LC966
	mov	w1, 10818
	ldr	x2, .LC968
	mov	w0, 0
	add	x3, x3, 576
	bl	dprint_normal
	mov	w0, -1
	b	.L3279
.L3284:
	ldr	x3, .LC966
	mov	w1, 10848
	ldr	x2, .LC974
	mov	w0, 1
	add	x3, x3, 576
	bl	dprint_normal
	mov	w0, -1
	b	.L3279
	.size	HEVC_DispOrderProcess, .-HEVC_DispOrderProcess
	.align	3
.LC966:
	.xword	.LANCHOR4
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
	ldr	x0, [x19, 2408]
	str	wzr, [x19, 324]
	cbz	x0, .L3336
	ldrb	w1, [x20]
	str	w1, [x0, 36]
	ldr	x0, [x19, 2464]
	ldr	w1, [x0, 856]
	cmp	w1, 1
	beq	.L3337
.L3313:
	ldrb	w0, [x20]
	cmp	w0, 1
	bne	.L3314
	ldr	x1, [x19, 2408]
	ldr	w0, [x1, 8]
	cmp	w0, 1
	bls	.L3315
	ldr	w2, [x1, 36]
	cmp	w2, 1
	beq	.L3314
.L3315:
	ldr	w2, [x20, 24]
	cmp	w2, wzr
	ble	.L3316
	ldr	x2, [x20, 8]
	cbz	x2, .L3316
	ldr	w3, [x20, 16]
	cbnz	w3, .L3338
.L3316:
	mov	w0, 1
	str	w0, [x1, 36]
	ldr	w0, [x19, 248]
	ldr	w1, [x20, 28]
	bl	SM_ReleaseStreamSeg
.L3312:
	ldr	x0, [x19, 2408]
	ldr	w0, [x0, 36]
	cmp	w0, wzr
	csetm	w0, eq
.L3310:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3338:
	uxtw	x0, w0
	add	x0, x1, x0, lsl 5
	str	x2, [x0, 40]
	ldr	x1, [x19, 2408]
	ldr	w2, [x20, 24]
	ldr	w0, [x1, 8]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 48]
	ldr	x1, [x19, 2408]
	ldr	w2, [x20, 16]
	ldr	w0, [x1, 8]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 52]
	ldr	x1, [x19, 2408]
	ldr	w2, [x20, 28]
	ldr	w0, [x1, 8]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 68]
	ldr	x1, [x19, 2408]
	ldr	w0, [x1, 8]
	add	x0, x1, x0, lsl 5
	str	wzr, [x0, 60]
	ldr	x1, [x19, 2408]
	ldr	w0, [x1, 8]
	add	w0, w0, 1
	str	w0, [x1, 8]
	ldr	x0, [x19, 2464]
	ldrb	w0, [x0, 904]
	cmp	w0, 1
	beq	.L3317
	ldr	w0, [x19, 6452]
	ldr	w1, [x20, 24]
	ldr	w2, [x19, 6456]
	add	w1, w0, w1
	str	w1, [x19, 6452]
	ldr	w0, [x20, 24]
	add	w0, w2, w0
	str	w0, [x19, 6456]
.L3317:
	mov	x0, x19
	bl	HEVC_CombinePacket
	mov	w0, 1
	str	w0, [x19, 324]
	b	.L3312
	.p2align 3
.L3337:
	ldr	w0, [x0, 888]
	cbnz	w0, .L3312
	b	.L3313
	.p2align 3
.L3336:
	ldr	w0, [x20, 24]
	cmp	w0, wzr
	ble	.L3308
	ldr	x0, [x20, 8]
	cbz	x0, .L3308
	ldr	w0, [x20, 16]
	cbz	w0, .L3308
	mov	x0, x19
	bl	HEVC_FindNaluArraySlot
	cmn	w0, #1
	mov	w21, w0
	beq	.L3339
	ldr	x0, [x19, 2456]
	mov	w2, 104
	mov	w1, 1
	smaddl	x0, w21, w2, x0
	str	x0, [x19, 2408]
	ldr	x2, [x20, 8]
	str	x2, [x0, 40]
	ldr	x0, [x19, 2408]
	ldr	w2, [x20, 24]
	str	w2, [x0, 48]
	ldr	x0, [x19, 2408]
	ldr	w2, [x20, 28]
	str	w2, [x0, 68]
	ldr	x0, [x19, 2408]
	ldr	w2, [x20, 16]
	str	w2, [x0, 52]
	ldr	x0, [x19, 2408]
	str	wzr, [x0, 60]
	ldr	x0, [x19, 2408]
	str	w1, [x0, 8]
	ldr	x0, [x19, 2408]
	strb	wzr, [x0]
	ldr	x0, [x19, 2408]
	ldrb	w1, [x20]
	str	w1, [x0, 36]
	ldr	x0, [x19, 2464]
	ldrb	w0, [x0, 904]
	cmp	w0, 1
	beq	.L3311
	ldr	w0, [x19, 6452]
	ldr	w1, [x20, 24]
	ldr	w2, [x19, 6456]
	add	w1, w0, w1
	str	w1, [x19, 6452]
	ldr	w0, [x20, 24]
	add	w0, w2, w0
	str	w0, [x19, 6456]
.L3311:
	ldr	w0, [x20, 20]
	str	w0, [x19, 2336]
	b	.L3312
	.p2align 3
.L3314:
	ldr	x2, .LC980
	mov	w1, 13833
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L3310
	.p2align 3
.L3308:
	ldr	x2, .LC978
	mov	w1, 13820
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L3310
.L3339:
	ldr	x2, .LC976
	mov	w1, 13792
	mov	w0, 0
	bl	dprint_normal
	mov	w1, 0
	mov	x0, x19
	bl	HEVC_ClearAll
	mov	w0, w21
	b	.L3310
	.size	HEVC_ReceivePacket, .-HEVC_ReceivePacket
	.align	3
.LC976:
	.xword	.LC975
	.align	3
.LC978:
	.xword	.LC977
	.align	3
.LC980:
	.xword	.LC979
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_StorePicInDPB
	.type	HEVC_StorePicInDPB, %function
HEVC_StorePicInDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 6464]
	cbz	x0, .L3385
	ldrsw	x1, [x19, 248]
	ldr	x0, .LC985
	ldr	x0, [x0, x1, lsl 3]
	add	x0, x0, 217088
	ldrsb	w1, [x0, 3072]
	cmp	w1, 1
	beq	.L3386
.L3343:
	mov	x0, x19
	add	x21, x19, 4096
	bl	HEVC_RemoveDummyFrame
	ldrb	w0, [x21, 2305]
	cbz	w0, .L3387
	ldr	w0, [x19, 6440]
	cbnz	w0, .L3388
.L3348:
	ldr	x1, [x19, 2480]
	ldr	x0, [x19, 6464]
	ldr	w1, [x1, 4936]
	str	w1, [x0, 36]
	ldr	x1, [x19, 2480]
	ldr	x0, [x19, 6464]
	ldr	w1, [x1, 4940]
	str	w1, [x0, 40]
	ldr	w0, [x19, 252]
	cmp	w0, 2
	beq	.L3389
	ldr	x0, [x19, 2464]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	beq	.L3390
	cmp	w0, 1
	beq	.L3391
	sub	w1, w0, #4
	cmp	w1, 2
	ccmp	w0, wzr, 4, hi
	bne	.L3342
.L3360:
	mov	x0, x19
	bl	HEVC_DispOrderProcess
	mov	w20, w0
	cbnz	w0, .L3392
.L3361:
	strb	wzr, [x21, 2305]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3388:
	ldr	w1, [x19, 6416]
	cbz	w1, .L3393
.L3349:
	ldr	x1, [x19, 2464]
	ldr	w2, [x1, 4]
	cmp	w2, w0
	bcs	.L3348
	ldr	w20, [x1, 656]
	mov	x0, x19
	cbz	w20, .L3394
	bl	HEVC_DirectOutput
	mov	w20, w0
	cbnz	w0, .L3395
.L3352:
	mov	w4, 10935
.L3384:
	ldr	x2, .LC984
	mov	w3, w20
	mov	w1, w4
	mov	w0, 12
	bl	dprint_normal
.L3353:
	cmn	w20, #1
	bne	.L3361
	.p2align 2
.L3342:
	mov	x0, x19
	mov	w20, -1
	bl	HEVC_ClearCurrPic
	ldr	x3, .LC986
	mov	w1, 10991
	ldr	x2, .LC1005
	mov	w0, 1
	add	x3, x3, 600
	bl	dprint_normal
	b	.L3361
	.p2align 3
.L3386:
	ldr	w1, [x0, 3188]
	cmp	w1, 1
	bne	.L3343
	ldr	w0, [x0, 3192]
	cmp	w0, 2
	bne	.L3343
	add	x0, x19, 12288
	ldrb	w0, [x0, 1632]
	cmp	w0, 1
	bne	.L3343
	ldr	w3, [x19, 13932]
	ldr	w5, [x19, 13936]
	ldr	x6, [x19, 13944]
	ldr	x4, [x19, 13952]
	ldr	x7, [x19, 13960]
	cbz	w3, .L3362
	mov	w1, w3
	mov	w2, w5
	b	.L3345
	.p2align 3
.L3363:
	mov	w1, w0
.L3345:
	udiv	w0, w2, w1
	msub	w0, w0, w1, w2
	mov	w2, w1
	cbnz	w0, .L3363
.L3344:
	udiv	w0, w3, w1
	sub	x3, x4, x7
	lsl	w2, w3, 6
	sub	w2, w2, w3
	lsl	w2, w2, 1
	sub	w2, w2, w3
	lsl	w2, w2, 3
	udiv	w1, w5, w1
	mul	w0, w2, w0
	udiv	w0, w0, w1
	add	x0, x0, x6
	str	x0, [x19, 6680]
	b	.L3343
	.p2align 3
.L3395:
	ldr	x3, .LC986
	mov	w1, 10932
	ldr	x2, .LC995
	mov	w0, 0
	add	x3, x3, 600
	bl	dprint_normal
	b	.L3352
	.p2align 3
.L3387:
	ldr	x3, .LC986
	mov	w1, 10909
	ldr	x2, .LC988
	mov	w0, 1
	add	x3, x3, 600
	mov	w20, 0
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3394:
	bl	HEVC_ClearCurrPic
	ldr	x4, [x19, 2464]
	mov	w1, 10924
	ldr	w3, [x19, 6440]
	mov	w0, 1
	ldr	x2, .LC993
	ldr	w4, [x4, 4]
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3393:
	ldr	x3, .LC986
	mov	w1, 10915
	ldr	x2, .LC990
	mov	w0, 1
	add	x3, x3, 600
	bl	dprint_normal
	ldr	x0, .LC991
	ldr	x4, [x0]
	cbz	x4, .L3383
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 40
	blr	x4
.L3383:
	ldr	w0, [x19, 6440]
	b	.L3349
	.p2align 3
.L3385:
	ldr	x2, .LC982
	mov	w1, 10878
	add	x21, x19, 4096
	bl	dprint_normal
	mov	w4, 10879
	ldr	x2, .LC984
	mov	w3, -1
	mov	w1, w4
	mov	w0, 12
	bl	dprint_normal
	b	.L3342
	.p2align 3
.L3389:
	mov	x0, x19
	bl	HEVC_DirectOutput
	mov	w20, w0
	cbnz	w0, .L3396
	mov	w4, 10951
	b	.L3384
	.p2align 3
.L3392:
	ldr	x3, .LC986
	mov	w1, 10982
	ldr	x2, .LC1003
	mov	w0, 0
	add	x3, x3, 600
	bl	dprint_normal
	b	.L3353
	.p2align 3
.L3396:
	ldr	x3, .LC986
	mov	w1, 10948
	ldr	x2, .LC997
	mov	w0, 0
	add	x3, x3, 600
	bl	dprint_normal
	mov	w4, 10951
	b	.L3384
	.p2align 3
.L3390:
	mov	x0, x19
	bl	HEVC_SimpleDPBProcess
	mov	w20, w0
	cbnz	w0, .L3397
	mov	w4, 10963
	b	.L3384
	.p2align 3
.L3397:
	ldr	x3, .LC986
	mov	w1, 10960
	ldr	x2, .LC999
	mov	w0, 0
	add	x3, x3, 600
	bl	dprint_normal
	mov	w4, 10963
	b	.L3384
	.p2align 3
.L3391:
	mov	x0, x19
	bl	HEVC_DecOrderProcess
	mov	w20, w0
	cbnz	w0, .L3359
	ldr	x0, [x19, 2464]
	ldr	w0, [x0, 12]
	sub	w1, w0, #4
	cmp	w1, 2
	ccmp	w0, wzr, 4, hi
	bne	.L3361
	b	.L3360
	.p2align 3
.L3359:
	ldr	x3, .LC986
	mov	w1, 10972
	ldr	x2, .LC1001
	mov	w0, 0
	add	x3, x3, 600
	bl	dprint_normal
	ldr	x0, [x19, 2464]
	ldr	w0, [x0, 12]
	sub	w1, w0, #4
	cmp	w1, 2
	ccmp	w0, wzr, 4, hi
	bne	.L3353
	b	.L3360
.L3362:
	mov	w1, w5
	b	.L3344
	.size	HEVC_StorePicInDPB, .-HEVC_StorePicInDPB
	.align	3
.LC982:
	.xword	.LC981
	.align	3
.LC984:
	.xword	.LC983
	.align	3
.LC985:
	.xword	s_pstVfmwChan
	.align	3
.LC986:
	.xword	.LANCHOR4
	.align	3
.LC988:
	.xword	.LC987
	.align	3
.LC990:
	.xword	.LC989
	.align	3
.LC991:
	.xword	g_EventReportFunc
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
	.align	3
.LC1003:
	.xword	.LC1002
	.align	3
.LC1005:
	.xword	.LC1004
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
	ldr	w0, [x19, 180]
	cmp	w0, 2
	bls	.L3460
	ldr	w0, [x19, 292]
	add	x1, x19, 4096
	ldr	w2, [x19, 296]
	mov	w3, 1
	add	w0, w0, 1
	ldr	x4, [x19, 2464]
	cmp	w0, w2
	csel	w0, w0, w2, ge
	str	w0, [x19, 292]
	sub	w0, w0, w2
	str	w0, [x4, 592]
	strb	w3, [x1, 2304]
	ldr	w20, [x19, 244]
	ldr	w3, [x19, 252]
	ubfx	x20, x20, 16, 3
	cmp	w20, w3
	beq	.L3403
	sub	w0, w3, #2
	cmp	w0, 1
	ccmp	w20, 2, 4, ls
	beq	.L3403
	cmp	w20, 1
	ccmp	w20, 4, 4, hi
	beq	.L3461
.L3403:
	cmp	w20, 2
	str	w20, [x19, 252]
	beq	.L3405
	cmp	w20, 3
	bne	.L3457
.L3459:
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	mov	x0, x19
	bl	HEVC_ClearDPB
	mov	w0, -1
.L3447:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3457:
	ldr	w0, [x19, 232]
	cbz	w0, .L3426
	cmp	w20, 4
	ldr	w0, [x19, 6416]
	bne	.L3411
	cbnz	w0, .L3411
	mov	w0, 2
	strb	w0, [x19, 6]
	.p2align 2
.L3415:
	ldr	w3, [x19, 236]
	mov	w1, 9005
	ldr	x2, .LC1015
	mov	w0, 3
	sub	w3, w3, #1
	bl	dprint_normal
	ldr	w0, [x19, 200]
	cbz	w0, .L3462
	ldr	w1, [x19, 6428]
	ldr	w3, [x19, 6432]
	cmp	w1, wzr
	ldr	w2, [x19, 236]
	str	w0, [x19, 11336]
	cset	w0, eq
	str	w3, [x19, 10300]
	str	w0, [x19, 10308]
	cbz	w2, .L3420
	add	x0, x19, 8192
	ldr	w2, [x19, 6444]
	add	x0, x0, 784
	str	x0, [x19, 2480]
	add	w1, w1, 1
	str	w2, [x0, 4936]
	ldr	w2, [x19, 6448]
	str	w2, [x0, 4940]
	str	w1, [x19, 6428]
	str	wzr, [x0, 4932]
	ldr	w0, [x19, 6416]
	cbz	w0, .L3463
.L3420:
	ldr	w3, [x19, 6456]
	ldr	x2, [x19, 6464]
	ldr	w0, [x19, 6452]
	str	w3, [x19, 6452]
	sub	w0, w0, w3
	ldr	w1, [x2, 316]
	add	w1, w1, w0
	str	w1, [x2, 316]
	ldr	w2, [x19, 6708]
	ldr	w1, [x19, 6416]
	add	w0, w2, w0
	str	w0, [x19, 6708]
	cbz	w1, .L3464
	cmp	w1, 1
	beq	.L3465
	cmp	w1, 2
	mov	w0, 0
	bne	.L3447
	ldr	x1, .LC1019
	ldrsw	x2, [x19, 248]
	ldr	x2, [x1, x2, lsl 3]
	ldr	w1, [x2, 104]
	add	w1, w1, 1
	str	w1, [x2, 104]
	b	.L3447
	.p2align 3
.L3405:
	ldr	w0, [x19, 6416]
	cbnz	w0, .L3409
	ldr	w1, [x19, 232]
	cbz	w1, .L3426
.L3411:
	cmp	w0, 2
	beq	.L3466
	cmp	w0, 1
	bne	.L3415
	strb	w0, [x19, 6]
	b	.L3415
	.p2align 3
.L3466:
	ldrb	w0, [x19, 6]
	cmp	w0, 2
	bne	.L3415
	ldr	x0, .LC1013
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L3415
	ldr	x0, [x19, 2464]
	ldr	w0, [x0, 12]
	sub	w1, w0, #4
	cmp	w1, 2
	ccmp	w0, wzr, 4, hi
	bne	.L3415
	mov	w4, 1
	ldr	x2, .LC1021
	ldr	w3, [x19, 6412]
	mov	w0, w4
	mov	w1, 8995
	bl	dprint_normal
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	ldr	x0, .LC1006
	ldr	x4, [x0]
	cbz	x4, .L3467
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 60
	blr	x4
	mov	w0, -1
	b	.L3447
	.p2align 3
.L3464:
	ldrsw	x2, [x19, 248]
	mov	w0, 0
	ldr	x1, .LC1019
	ldr	x2, [x1, x2, lsl 3]
	ldr	w1, [x2, 96]
	add	w1, w1, 1
	str	w1, [x2, 96]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3463:
	ldr	x1, [x19, 11344]
	mov	w4, 0
	cbz	x1, .L3422
	.p2align 2
.L3423:
	ldp	w2, w0, [x1]
	ldr	x1, [x1, 1360]
	add	w0, w2, w0
	add	w0, w0, 7
	add	w4, w4, w0, lsr 3
	cbnz	x1, .L3423
.L3422:
	ldr	x0, .LC1006
	ldr	x5, [x0]
	cbz	x5, .L3420
	add	x2, x29, 48
	ldr	w0, [x19, 248]
	mov	w3, 4
	mov	w1, 8
	str	w4, [x2, -8]!
	blr	x5
	b	.L3420
	.p2align 3
.L3465:
	ldr	x1, .LC1019
	mov	w0, 0
	ldrsw	x2, [x19, 248]
	ldr	x2, [x1, x2, lsl 3]
	ldr	w1, [x2, 100]
	add	w1, w1, 1
	str	w1, [x2, 100]
	b	.L3447
	.p2align 3
.L3426:
	ldr	x0, .LC1006
	ldr	x4, [x0]
	cbz	x4, .L3409
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 60
	blr	x4
.L3409:
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	mov	w0, -1
	b	.L3447
.L3461:
	ldr	x2, .LC1012
	mov	w4, w20
	mov	w1, 8940
	mov	w0, 1
	bl	dprint_normal
	str	w20, [x19, 252]
	b	.L3459
	.p2align 3
.L3467:
	mov	w0, -1
	b	.L3447
	.p2align 3
.L3462:
	ldr	x0, .LC1006
	ldr	x4, [x0]
	cbz	x4, .L3418
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 60
	blr	x4
.L3418:
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	ldr	x3, .LC1016
	mov	w1, 9011
	ldr	x2, .LC1018
	mov	w0, 0
	add	x3, x3, 624
	bl	dprint_normal
	mov	w0, -1
	b	.L3447
	.p2align 3
.L3460:
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	ldr	x0, .LC1006
	ldr	x4, [x0]
	cbz	x4, .L3400
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 60
	blr	x4
.L3400:
	ldr	w0, [x19, 240]
	cmp	w0, 524288
	bls	.L3401
	ldr	x2, .LC1008
	mov	w1, 8918
	mov	w0, 0
	bl	dprint_normal
.L3401:
	ldr	x2, .LC1010
	mov	w1, 8921
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L3447
	.size	HEVC_DecVDM, .-HEVC_DecVDM
	.align	3
.LC1006:
	.xword	g_EventReportFunc
	.align	3
.LC1008:
	.xword	.LC1007
	.align	3
.LC1010:
	.xword	.LC1009
	.align	3
.LC1012:
	.xword	.LC1011
	.align	3
.LC1013:
	.xword	g_AllowBPicBeforePPic
	.align	3
.LC1015:
	.xword	.LC1014
	.align	3
.LC1016:
	.xword	.LANCHOR4
	.align	3
.LC1018:
	.xword	.LC1017
	.align	3
.LC1019:
	.xword	s_pstVfmwChan
	.align	3
.LC1021:
	.xword	.LC1020
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
	ldr	x0, [x19, 2368]
	mov	w1, 16
	str	xzr, [x29, 88]
	add	x22, x19, 4096
	bl	BsGet
	mov	w21, w0
	ldr	x0, [x19, 2368]
	mov	w1, 8
	bl	BsGet
	and	w24, w0, 31
	ldr	x0, [x19, 2368]
	mov	w1, 24
	bl	BsBack
	str	wzr, [x22, 2648]
	ldr	x1, [x22, 2656]
	str	x1, [x29, 88]
	cbz	w20, .L3470
	cmp	w20, 1
	bne	.L3629
	cmp	w23, 1
	mov	w0, 31745
	beq	.L3630
	cmp	w21, w0
	ccmp	w24, 25, 0, eq
	bne	.L3501
	ldr	x20, .LC1022
	ldr	x4, [x20]
	cbz	x4, .L3502
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	blr	x4
.L3502:
	mov	x0, x19
	bl	HEVC_DecVDM
	ldr	x1, [x19, 2408]
	cbnz	w0, .L3623
	ldr	w0, [x1, 48]
	add	x21, x22, 2640
	sub	w0, w0, #6
	add	x3, x0, 5
	str	w0, [x21, 8]
	cmp	x3, 4096
	bhi	.L3631
	ldr	w2, [x1, 80]
	ldr	w3, [x1, 48]
	ldr	w0, [x19, 248]
	add	w3, w3, w2
	ldr	w1, [x21, 12]
	add	x2, x29, 88
	sub	w3, w3, #1
	bl	MetadataMapToSec
	cbnz	w0, .L3632
	ldr	x3, [x29, 88]
	cbz	x3, .L3633
	ldr	x23, .LC1030
	mov	x0, x3
	ldr	x1, .LC1031
	mov	x2, 5
	ldr	x3, [x23, 104]
	blr	x3
	ldr	x1, [x19, 2408]
	ldr	x0, [x29, 88]
	ldr	w2, [x21, 8]
	ldr	x1, [x1, 40]
	add	x0, x0, 5
	ldr	x3, [x23, 104]
	add	x1, x1, 6
	blr	x3
	ldr	w0, [x21, 8]
	add	w0, w0, 5
	str	w0, [x21, 8]
	ldr	x1, [x19, 2408]
	ldr	w2, [x1, 80]
	cbz	w2, .L3509
	add	w3, w0, w2
	cmp	w3, 4096
	bhi	.L3634
	ldr	x3, [x29, 88]
	cbz	x3, .L3635
	ldr	x1, [x1, 72]
	uxtw	x2, w2
	ldr	x4, [x23, 104]
	add	x0, x3, x0, uxtw
	blr	x4
	ldr	x1, [x19, 2408]
	ldr	w0, [x21, 8]
	ldr	w1, [x1, 80]
	add	w0, w1, w0
	str	w0, [x21, 8]
.L3509:
	ldr	x1, [x29, 88]
	cbz	x1, .L3636
	ldr	w0, [x19, 248]
	ldr	w2, [x22, 2648]
	bl	HEVC_SaveMetadata
	ldr	w0, [x19, 248]
	ldr	x1, [x29, 88]
	bl	MetadataUnMapToSec
	ldr	x3, .LC1025
	mov	w4, 2756
	cbnz	w0, .L3606
.L3515:
	ldr	x1, [x19, 2408]
.L3616:
	cbz	x1, .L3607
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
.L3607:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	mov	w0, 0
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3629:
	ldr	x2, .LC1039
	mov	w3, w20
	mov	w1, 2778
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 1
.L3478:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3470:
	cmp	w23, 1
	beq	.L3637
	mov	w0, 31745
	and	w21, w21, -513
	cmp	w21, w0
	mov	w0, 1
	bne	.L3478
	ldr	x3, .LC1025
	mov	w4, 2612
	ldr	x2, .LC1035
.L3619:
	mov	w1, w4
	add	x3, x3, 640
	mov	w0, 0
	bl	dprint_normal
	ldr	x1, [x19, 2408]
	cbz	x1, .L3603
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
	mov	w0, -1
	b	.L3478
	.p2align 3
.L3501:
	mov	w1, 32257
	mov	w0, w20
	cmp	w21, w1
	bne	.L3478
	ldr	x3, .LC1025
	mov	w4, 2766
	ldr	x2, .LC1037
	b	.L3619
	.p2align 3
.L3637:
	mov	w0, 31745
	cmp	w21, w0
	ccmp	w24, 25, 0, eq
	bne	.L3473
	ldr	x20, .LC1022
	ldr	x4, [x20]
	cbz	x4, .L3474
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	blr	x4
.L3474:
	mov	x0, x19
	bl	HEVC_DecVDM
	ldr	x1, [x19, 2408]
	cbnz	w0, .L3626
	ldr	w0, [x1, 48]
	add	x21, x22, 2640
	sub	w0, w0, #6
	add	x3, x0, 5
	str	w0, [x21, 8]
	cmp	x3, 4096
	bls	.L3479
	mov	w4, 2520
	ldr	x2, .LC1024
	mov	w1, w4
	mov	w0, 1
	bl	dprint_normal
	ldr	x1, [x19, 2408]
.L3626:
	cbz	x1, .L3480
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
.L3480:
	ldr	x4, [x20]
	cbz	x4, .L3603
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L3603:
	mov	w0, -1
.L3640:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3631:
	mov	w4, 2685
	ldr	x2, .LC1024
	mov	w1, w4
	mov	w0, 1
	bl	dprint_normal
	ldr	x1, [x19, 2408]
.L3623:
	cbz	x1, .L3506
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
.L3506:
	ldr	x4, [x20]
	cbz	x4, .L3603
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
	mov	w0, -1
	b	.L3478
	.p2align 3
.L3630:
	cmp	w21, w0
	ccmp	w25, 2, 0, eq
	ccmp	w24, 25, 0, eq
	beq	.L3638
	mov	w1, 32257
	cmp	w21, w1
	beq	.L3639
	cmp	w21, w0
	beq	.L3515
	ldr	x0, [x19, 2368]
	mov	w1, 8
	bl	BsGet
	mov	w20, w0
	ldr	x0, [x19, 2368]
	mov	w1, 8
	ubfx	x20, x20, 1, 6
	bl	BsSkip
	cmp	w20, 49
	bne	.L3515
	mov	x0, x19
	bl	HEVC_IsEosNal
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L3515
	ldr	x1, [x19, 2408]
	ldr	x0, [x19, 2368]
	ldr	w2, [x1, 48]
	ldr	x1, [x1, 40]
	bl	BsInit
	ldr	x0, [x19, 2368]
	mov	w1, 24
	bl	BsSkip
	mov	w0, 2
	b	.L3478
	.p2align 3
.L3473:
	mov	w1, 32257
	mov	w0, w23
	cmp	w21, w1
	bne	.L3478
	b	.L3515
.L3643:
	uxtw	x3, w0
	mov	w4, 2551
	ldr	x2, .LC1024
	mov	w1, w4
	add	x3, x3, 5
	mov	w0, 1
	bl	dprint_normal
	ldr	x1, [x19, 2408]
	cbz	x1, .L3486
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
.L3486:
	ldr	x4, [x20]
	cbz	x4, .L3487
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L3487:
	ldr	w0, [x19, 248]
	ldr	x1, [x29, 88]
	bl	MetadataUnMapToSec
	cbz	w0, .L3603
	ldr	x3, .LC1025
	mov	w4, 2559
.L3606:
	ldr	x2, .LC1033
.L3602:
	mov	w1, w4
	add	x3, x3, 640
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L3640
	.p2align 3
.L3638:
	ldr	x20, .LC1022
	ldr	x4, [x20]
	cbz	x4, .L3495
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	blr	x4
.L3495:
	mov	x0, x19
	bl	HEVC_DecVDM
	ldr	x1, [x19, 2408]
	cbz	w0, .L3616
	b	.L3623
	.p2align 3
.L3479:
	ldr	w2, [x1, 80]
	ldr	w3, [x1, 48]
	ldr	w0, [x19, 248]
	add	w3, w3, w2
	ldr	w1, [x21, 12]
	add	x2, x29, 88
	sub	w3, w3, #1
	bl	MetadataMapToSec
	cbnz	w0, .L3641
	ldr	x3, [x29, 88]
	cbz	x3, .L3642
	ldr	x23, .LC1030
	mov	x0, x3
	ldr	x1, .LC1031
	mov	x2, 5
	ldr	x3, [x23, 104]
	blr	x3
	ldr	x1, [x19, 2408]
	ldr	x0, [x29, 88]
	ldr	w2, [x21, 8]
	ldr	x1, [x1, 40]
	add	x0, x0, 5
	ldr	x3, [x23, 104]
	add	x1, x1, 6
	blr	x3
	ldr	w0, [x21, 8]
	add	w0, w0, 5
	str	w0, [x21, 8]
	ldr	x1, [x19, 2408]
	ldr	w2, [x1, 80]
	cbz	w2, .L3484
	add	w3, w0, w2
	cmp	w3, 4096
	bhi	.L3643
	ldr	x3, [x29, 88]
	cbz	x3, .L3644
	ldr	x1, [x1, 72]
	uxtw	x2, w2
	ldr	x4, [x23, 104]
	add	x0, x3, x0, uxtw
	blr	x4
	ldr	x1, [x19, 2408]
	ldr	w0, [x21, 8]
	ldr	w1, [x1, 80]
	add	w0, w1, w0
	str	w0, [x21, 8]
.L3484:
	ldr	x1, [x29, 88]
	cbz	x1, .L3645
	ldr	w0, [x19, 248]
	ldr	w2, [x22, 2648]
	bl	HEVC_SaveMetadata
	ldr	w0, [x19, 248]
	ldr	x1, [x29, 88]
	bl	MetadataUnMapToSec
	ldr	x3, .LC1025
	mov	w4, 2591
	cbnz	w0, .L3606
	ldr	x1, [x19, 2408]
	b	.L3616
.L3639:
	ldr	x0, [x19, 2368]
	mov	w1, 16
	bl	BsSkip
	mov	w0, w23
	b	.L3478
.L3634:
	uxtw	x3, w0
	mov	w4, 2716
	ldr	x2, .LC1024
	mov	w1, w4
	add	x3, x3, 5
	mov	w0, 1
	bl	dprint_normal
	ldr	x1, [x19, 2408]
	cbz	x1, .L3511
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
.L3511:
	ldr	x4, [x20]
	cbz	x4, .L3512
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L3512:
	ldr	w0, [x19, 248]
	ldr	x1, [x29, 88]
	bl	MetadataUnMapToSec
	cbz	w0, .L3603
	ldr	x3, .LC1025
	mov	w4, 2724
	b	.L3606
.L3632:
	ldr	x3, .LC1025
	mov	w4, 2697
	ldr	x2, .LC1027
	b	.L3602
.L3636:
	ldr	x3, .LC1025
	mov	w4, 2744
	ldr	x2, .LC1029
	b	.L3602
.L3641:
	ldr	x3, .LC1025
	mov	w4, 2532
	ldr	x2, .LC1027
	b	.L3602
.L3633:
	ldr	x3, .LC1025
	mov	w4, 2704
.L3605:
	ldr	x2, .LC1029
	mov	w1, w4
	add	x3, x3, 640
	bl	dprint_normal
	mov	w0, -1
	b	.L3478
.L3642:
	ldr	x3, .LC1025
	mov	w4, 2539
	b	.L3605
.L3645:
	ldr	x3, .LC1025
	mov	w4, 2579
	ldr	x2, .LC1029
	b	.L3602
.L3635:
	ldr	x3, .LC1025
	mov	w4, 2734
	ldr	x2, .LC1029
	b	.L3602
.L3644:
	ldr	x3, .LC1025
	mov	w4, 2569
	ldr	x2, .LC1029
	b	.L3602
	.size	HEVC_VES_Splitter, .-HEVC_VES_Splitter
	.align	3
.LC1022:
	.xword	g_EventReportFunc
	.align	3
.LC1024:
	.xword	.LC1023
	.align	3
.LC1025:
	.xword	.LANCHOR4
	.align	3
.LC1027:
	.xword	.LC1026
	.align	3
.LC1029:
	.xword	.LC1028
	.align	3
.LC1030:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1031:
	.xword	g_RpuStartCode
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
	ldr	w0, [x19, 2804]
	cbz	w0, .L3658
	sub	w2, w0, #1
	mov	w20, 0
	add	x2, x2, 354
	add	x0, x19, 2824
	add	x2, x19, x2, lsl 3
	.p2align 2
.L3649:
	ldr	x1, [x0], 8
	ldrb	w1, [x1, 2]
	cmp	w1, wzr
	csinc	w20, w20, w20, ne
	cmp	x0, x2
	bne	.L3649
	.p2align 2
.L3650:
	mov	x0, x19
	bl	HEVC_RemoveUnUsedFrameStore
	cbnz	w0, .L3650
	cmp	w20, wzr
	ble	.L3652
	.p2align 2
.L3665:
	ldr	w1, [x19, 2804]
	cbz	w1, .L3653
	ldr	x0, [x19, 2824]
	ldrb	w0, [x0, 2]
	cbz	w0, .L3660
	add	x2, x19, 2832
	mov	w0, 0
	b	.L3657
	.p2align 3
.L3654:
	ldr	x3, [x2], 8
	ldrb	w3, [x3, 2]
	cbz	w3, .L3659
.L3657:
	add	w0, w0, 1
	cmp	w0, w1
	bne	.L3654
.L3653:
	mov	x0, x19
	bl	HEVC_OutputOneFrmFromDPB
	cmn	w0, #1
	beq	.L3655
	subs	w20, w20, #1
	bne	.L3665
.L3652:
	mov	w0, 0
.L3655:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3659:
	mov	w1, w0
	b	.L3653
.L3660:
	mov	w1, 0
	b	.L3653
.L3658:
	mov	w20, 0
	b	.L3650
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
	ldr	x1, [x19, 2408]
	ldrsw	x3, [x19, 248]
	ldr	x0, .LC1040
	ldr	w2, [x1, 16]
	str	w2, [x19, 7036]
	ldr	w4, [x1, 28]
	str	w4, [x19, 7032]
	ldr	w20, [x1, 24]
	strb	wzr, [x19, 3]
	str	w20, [x19, 7040]
	ldr	x0, [x0, x3, lsl 3]
	add	x0, x0, 217088
	ldrsb	w3, [x0, 3072]
	cmp	w3, 1
	beq	.L3731
.L3673:
	ldr	w0, [x19, 7160]
	cmp	w0, 1
	beq	.L3732
.L3677:
	ldr	w0, [x19, 156]
	ldr	w3, [x19, 200]
	cmp	w3, w0
	bcs	.L3733
	add	x20, x19, 4096
	ldrb	w0, [x20, 2305]
	cbz	w0, .L3734
	mov	x0, x19
	bl	HEVC_PicTypeStatistic
	mov	x0, x19
	bl	HEVC_CalcStreamBits
	ldr	w0, [x19, 7160]
	cmp	w0, 2
	beq	.L3694
	ldr	w0, [x19, 2340]
	cbnz	w0, .L3695
	ldrb	w0, [x20, 2913]
	cbz	w0, .L3735
.L3695:
	mov	x0, x19
	bl	HEVC_WriteSliceMsg
	cbnz	w0, .L3736
.L3698:
	ldr	w0, [x19, 2340]
	cbz	w0, .L3737
.L3700:
	ldr	w0, [x19, 3380]
	ldr	w1, [x19, 3376]
	str	w0, [x19, 6448]
	mov	w0, 0
	str	w1, [x19, 6444]
.L3682:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3737:
	ldr	w1, [x19, 7020]
	mov	w0, 1
	ldr	w2, [x19, 7044]
	str	w0, [x19, 176]
	str	w1, [x19, 256]
	str	w2, [x19, 300]
	b	.L3700
	.p2align 3
.L3732:
	ldr	w0, [x19, 2340]
	cbnz	w0, .L3679
	sub	w2, w2, #16
	cmp	w2, 4
	ccmp	w20, wzr, 0, ls
	bne	.L3738
.L3680:
	mov	x0, x19
	bl	HEVC_FlushOutputFrmFromDPB
	cbnz	w0, .L3739
.L3681:
	cbnz	w20, .L3683
	ldrb	w21, [x19, 4]
	cmp	w21, 1
	beq	.L3740
.L3683:
	ldr	w0, [x19, 248]
	bl	VCTRL_GetChanCrcMode
	cbnz	w0, .L3684
	ldr	w0, [x19, 2348]
	cmp	w0, 1
	beq	.L3741
	ldr	w0, [x19, 7032]
	ldr	x1, [x19, 2432]
	add	x0, x1, x0, lsl 2
	ldr	w0, [x0, 356]
	cbnz	w20, .L3684
.L3746:
	ldr	w4, [x19, 208]
	mov	w20, -2147483647
	cmp	w4, w20
	beq	.L3684
	ldr	w3, [x19, 7020]
	add	w0, w4, w0
	cmp	w3, w0
	bge	.L3684
	ldr	w0, [x19, 7036]
	cmp	w0, 21
	bne	.L3684
	ldr	x2, .LC1047
	mov	w1, 6725
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x19
	bl	HEVC_CRAOutputFrame
	str	w20, [x19, 208]
	.p2align 2
.L3684:
	ldr	x0, [x19, 2464]
	ldr	w1, [x0, 8]
	cmp	w1, 2
	beq	.L3679
	ldr	w0, [x0, 12]
	cmp	w0, 2
	mov	x0, x19
	beq	.L3742
	bl	HEVC_RefPicProcess
	cbnz	w0, .L3701
.L3679:
	mov	x0, x19
	bl	HEVC_InitPic
	cmn	w0, #2
	beq	.L3682
	cbnz	w0, .L3743
	ldr	w1, [x19, 236]
	mov	x0, x19
	add	w1, w1, 1
	str	w1, [x19, 236]
	bl	HEVC_SetScalingList
	mov	x0, x19
	bl	HEVC_WritePicMsg
	cbz	w0, .L3677
	ldr	x2, .LC1051
	mov	w1, 6775
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L3682
	.p2align 3
.L3731:
	ldr	w3, [x0, 3188]
	cmp	w3, 1
	bne	.L3673
	ldr	w0, [x0, 3192]
	cmp	w0, 2
	bne	.L3673
	ldr	w0, [x1, 16]
	sub	w1, w0, #19
	cmp	w1, 1
	bls	.L3744
.L3675:
	sub	w0, w0, #6
	cmp	w0, 3
	bls	.L3673
	ldr	x1, [x19, 3416]
	str	x1, [x19, 3400]
	b	.L3673
	.p2align 3
.L3694:
	ldr	x1, [x19, 2408]
	cbz	x1, .L3698
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
	b	.L3698
	.p2align 3
.L3735:
	mov	x0, x19
	bl	HEVC_DecList
	cbnz	w0, .L3745
	mov	x0, x19
	bl	HEVC_IsRefListWrong
	cbz	w0, .L3695
	mov	x0, x19
	bl	HEVC_PrintDPBState
	ldr	x2, .LC1062
	mov	w1, 6826
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L3682
	.p2align 3
.L3738:
	ldr	w0, [x19, 6416]
	cbnz	w0, .L3681
	ldr	x0, [x19, 2464]
	ldr	w1, [x0, 672]
	cmp	w1, 1
	bne	.L3681
	ldr	w1, [x0, 668]
	cbnz	w1, .L3681
	ldr	w1, [x0, 676]
	cbnz	w1, .L3681
	ldr	w0, [x0, 632]
	add	w0, w0, 1024
	cmp	w0, 2048
	bls	.L3681
	b	.L3680
.L3701:
	mov	w0, -1
	b	.L3682
.L3739:
	ldr	x3, .LC1041
	mov	w1, 6681
	ldr	x2, .LC1043
	mov	w0, 1
	add	x3, x3, 664
	bl	dprint_normal
	mov	w0, -1
	b	.L3682
	.p2align 3
.L3742:
	bl	HEVC_UpdateReflist
	mov	x0, x19
	bl	HEVC_UpdateLTReflist
	b	.L3679
	.p2align 3
.L3740:
	ldr	w0, [x19, 2804]
	cbz	w0, .L3683
	mov	x0, x19
	bl	HEVC_EmptyFrmFromDPB
	cbz	w0, .L3683
	ldr	x3, .LC1041
	mov	w1, 6694
	ldr	x2, .LC1045
	mov	w0, w21
	add	x3, x3, 664
	bl	dprint_normal
	mov	w0, -1
	b	.L3682
	.p2align 3
.L3734:
	ldr	x2, .LC1058
	mov	w1, 6796
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L3682
	.p2align 3
.L3741:
	ldr	x3, [x19, 2432]
	mov	w0, 0
	add	x1, x3, 356
	add	x3, x3, 384
	.p2align 2
.L3686:
	ldr	w2, [x1], 4
	cmp	w0, w2
	csel	w0, w0, w2, cs
	cmp	x1, x3
	bne	.L3686
	cbnz	w20, .L3684
	b	.L3746
	.p2align 3
.L3733:
	ldr	x2, .LC1053
	mov	w1, 6782
	mov	w0, 0
	bl	dprint_normal
	ldr	w1, [x19, 156]
	ldr	w2, [x19, 200]
	cmp	w2, w1
	bcc	.L3692
	ldr	x0, .LC1054
	ldr	x4, [x0]
	cbz	x4, .L3692
	ldr	w0, [x19, 248]
	mov	w3, 8
	stp	w2, w1, [x29, 56]
	add	x2, x29, 56
	mov	w1, 27
	blr	x4
.L3692:
	ldr	x2, .LC1056
	mov	w1, 6789
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	mov	w0, -1
	b	.L3682
	.p2align 3
.L3736:
	ldr	x2, .LC1064
	mov	w1, 6836
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L3682
	.p2align 3
.L3743:
	ldr	x2, .LC1049
	mov	w1, 6764
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L3682
.L3744:
	ldr	x1, [x19, 2464]
	ldr	x1, [x1, 32]
	cmn	x1, #1
	beq	.L3676
	ldr	x3, [x19, 13952]
	str	x1, [x19, 13944]
	str	x3, [x19, 13960]
	str	x3, [x19, 13968]
.L3676:
	add	x1, x19, 12288
	mov	w3, 1
	strb	w3, [x1, 1632]
	b	.L3675
.L3745:
	ldr	x2, .LC1060
	mov	w3, w0
	mov	w1, 6817
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L3682
	.size	HEVC_DecSlice, .-HEVC_DecSlice
	.align	3
.LC1040:
	.xword	s_pstVfmwChan
	.align	3
.LC1041:
	.xword	.LANCHOR4
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
.LC1054:
	.xword	g_EventReportFunc
	.align	3
.LC1056:
	.xword	.LC1055
	.align	3
.LC1058:
	.xword	.LC1057
	.align	3
.LC1060:
	.xword	.LC1059
	.align	3
.LC1062:
	.xword	.LC1061
	.align	3
.LC1064:
	.xword	.LC1063
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
	ldr	x3, [x19, 2408]
	ldr	w0, [x3, 8]
	cbz	w0, .L3752
	ldr	w2, [x19, 240]
	mov	w0, 0
	.p2align 2
.L3751:
	uxtw	x1, w0
	add	w0, w0, 1
	add	x1, x3, x1, lsl 5
	ldr	w1, [x1, 48]
	add	w2, w2, w1
	str	w2, [x19, 240]
	ldr	w1, [x3, 8]
	cmp	w1, w0
	bhi	.L3751
.L3752:
	strb	wzr, [x3]
	ldr	x0, [x19, 2408]
	ldr	w1, [x0, 16]
	sub	w1, w1, #36
	cmp	w1, 1
	bls	.L3892
.L3750:
	ldr	w1, [x0, 4]
	add	w1, w1, 16
	str	w1, [x0, 4]
	ldr	x0, [x19, 2408]
	ldr	w3, [x0, 16]
	cmp	w3, 49
	bls	.L3893
.L3753:
	ldr	x2, .LC1076
	mov	w1, 3489
	mov	w0, 20
	bl	dprint_normal
	ldr	x1, [x19, 2408]
	ldr	w0, [x1, 16]
	cmp	w0, 63
	bhi	.L3780
	cbnz	x1, .L3879
	.p2align 2
.L3880:
	mov	w0, 0
.L3896:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3893:
	ldr	x0, .LC1065
	ldrb	w0, [x0,w3,uxtw]
	adr	x1, .Lrtx3755
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx3755:
	.section	.rodata
	.align	0
	.align	2
.L3755:
	.byte	(.L3754 - .Lrtx3755) / 4
	.byte	(.L3754 - .Lrtx3755) / 4
	.byte	(.L3754 - .Lrtx3755) / 4
	.byte	(.L3754 - .Lrtx3755) / 4
	.byte	(.L3754 - .Lrtx3755) / 4
	.byte	(.L3754 - .Lrtx3755) / 4
	.byte	(.L3754 - .Lrtx3755) / 4
	.byte	(.L3754 - .Lrtx3755) / 4
	.byte	(.L3754 - .Lrtx3755) / 4
	.byte	(.L3754 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3754 - .Lrtx3755) / 4
	.byte	(.L3754 - .Lrtx3755) / 4
	.byte	(.L3754 - .Lrtx3755) / 4
	.byte	(.L3754 - .Lrtx3755) / 4
	.byte	(.L3754 - .Lrtx3755) / 4
	.byte	(.L3754 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3756 - .Lrtx3755) / 4
	.byte	(.L3757 - .Lrtx3755) / 4
	.byte	(.L3758 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3759 - .Lrtx3755) / 4
	.byte	(.L3759 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3753 - .Lrtx3755) / 4
	.byte	(.L3760 - .Lrtx3755) / 4
	.byte	(.L3761 - .Lrtx3755) / 4
	.text
	.p2align 3
.L3892:
	mov	w1, 1
	strb	w1, [x19, 3]
	b	.L3750
.L3761:
	mov	x0, x19
	bl	HEVC_IsEosNal
	uxtb	w1, w0
	cmp	w1, 1
	beq	.L3894
.L3777:
	ldr	x1, [x19, 2408]
	cbz	x1, .L3880
.L3879:
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
	mov	w0, 0
.L3764:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L3754:
	mov	x0, x19
	bl	HEVC_DecSlice
	cmn	w0, #2
	beq	.L3764
	cbz	w0, .L3880
	ldr	x1, [x19, 2408]
	cbz	x1, .L3890
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
.L3890:
	ldr	x0, .LC1068
	ldr	x4, [x0]
	cbz	x4, .L3877
.L3882:
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L3877:
	mov	w0, -1
.L3895:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L3757:
	mov	x0, x19
	bl	HEVC_DecSPS
	mov	w20, w0
	ldr	x1, [x19, 2408]
	cbz	x1, .L3767
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
.L3767:
	cbz	w20, .L3880
	ldr	x2, .LC1070
	mov	w1, 3363
	b	.L3887
.L3758:
	mov	x0, x19
	bl	HEVC_DecPPS
	mov	w20, w0
	ldr	x1, [x19, 2408]
	cbz	x1, .L3769
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
.L3769:
	cbz	w20, .L3880
	ldr	x2, .LC1072
	mov	w1, 3377
	b	.L3887
.L3756:
	mov	x0, x19
	bl	HEVC_DecVPS
	mov	w20, w0
	ldr	x1, [x19, 2408]
	cbz	x1, .L3762
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
.L3762:
	cbz	w20, .L3880
	ldr	x2, .LC1067
	mov	w1, 3349
.L3887:
	mov	w0, 1
	bl	dprint_normal
	ldr	x21, .LC1068
	ldr	x4, [x21]
	cbz	x4, .L3877
	add	x2, x29, 64
	ldr	w0, [x19, 248]
	mov	w20, -1
	mov	w3, 4
	mov	w1, 9
	str	w20, [x2, -8]!
	blr	x4
	ldr	x4, [x21]
	cbz	x4, .L3877
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
.L3759:
	mov	x0, x19
	bl	HEVC_DecSEI
	mov	w20, w0
	ldr	x1, [x19, 2408]
	cbz	x1, .L3770
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
.L3770:
	cbz	w20, .L3880
	ldr	x2, .LC1074
	mov	w1, 3392
	mov	w0, 1
	bl	dprint_normal
	b	.L3890
.L3760:
	add	x20, x19, 2760
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
	beq	.L3775
	ldr	x1, [x19, 2408]
	cbz	x1, .L3774
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
.L3774:
	add	x0, x19, 4096
	ldrb	w0, [x0, 2305]
	cbz	w0, .L3880
.L3775:
	mov	w1, 20553
	mov	w0, 20036
	movk	w1, 0x4853, lsl 16
	movk	w0, 0x4345, lsl 16
	cmp	w21, w1
	strb	wzr, [x19, 8]
	ccmp	w20, w0, 0, eq
	bne	.L3880
	ldr	x20, .LC1068
	ldr	x4, [x20]
	cbz	x4, .L3776
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	blr	x4
.L3776:
	add	x0, x19, 4096
	ldrb	w0, [x0, 2305]
	cbz	w0, .L3880
	mov	x0, x19
	bl	HEVC_DecVDM
	cbz	w0, .L3880
.L3779:
	ldr	x4, [x20]
	cbnz	x4, .L3882
	mov	w0, -1
	b	.L3895
	.p2align 3
.L3780:
	cbz	x1, .L3781
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
.L3781:
	ldr	x0, .LC1068
	ldr	x4, [x0]
	cbz	x4, .L3880
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
	mov	w0, 0
	b	.L3896
.L3894:
	ldr	x20, .LC1068
	strb	w0, [x19, 9]
	ldr	x4, [x20]
	cbz	x4, .L3778
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	blr	x4
.L3778:
	add	x0, x19, 4096
	ldrb	w0, [x0, 2305]
	cbz	w0, .L3777
	mov	x0, x19
	bl	HEVC_DecVDM
	cbz	w0, .L3777
	ldr	x1, [x19, 2408]
	cbz	x1, .L3779
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
	b	.L3779
	.size	HEVC_DecOneNal, .-HEVC_DecOneNal
	.align	3
.LC1065:
	.xword	.L3755
	.align	3
.LC1067:
	.xword	.LC1066
	.align	3
.LC1068:
	.xword	g_EventReportFunc
	.align	3
.LC1070:
	.xword	.LC1069
	.align	3
.LC1072:
	.xword	.LC1071
	.align	3
.LC1074:
	.xword	.LC1073
	.align	3
.LC1076:
	.xword	.LC1075
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
	ldr	w1, [x19, 24]
	mov	w2, 0
	ldr	w0, [x20, 248]
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
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x21, x2
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	str	wzr, [x21]
	ldr	x3, .LC1077
	add	x0, x19, 4096
	str	wzr, [x22]
	mov	x2, 1356
	mov	w1, 0
	add	x0, x0, 2912
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x1, [x19, 2408]
	mov	x0, x19
	ldr	w2, [x1, 16]
	str	w2, [x19, 7036]
	ldr	w2, [x1, 28]
	str	w2, [x19, 7032]
	ldr	w1, [x1, 24]
	str	w1, [x19, 7040]
	bl	HEVC_DecSliceSegmentHeader
	cbnz	w0, .L3915
	ldr	w1, [x19, 7044]
	mov	w3, 1888
	ldr	x0, [x19, 2392]
	mov	w20, 12644
	ldr	w23, [x19, 2340]
	ldr	x2, [x19, 2384]
	smaddl	x0, w1, w3, x0
	cmp	w23, 1
	ldr	w0, [x0, 32]
	smaddl	x20, w0, w20, x2
	beq	.L3916
	ldr	w0, [x19, 7160]
	cmp	w0, 1
	cset	w0, eq
	str	w0, [x22]
	ldr	x0, [x19, 2432]
	ldr	x1, [x19, 2464]
	ldr	w2, [x20, 184]
	ldp	w5, w3, [x0, 64]
	ldr	w0, [x0, 184]
	ldp	w6, w4, [x20, 64]
	cmp	w2, w0
	ldr	w0, [x1, 856]
	cset	w2, ne
	cmp	w0, 1
	beq	.L3917
.L3904:
	cmp	w6, w5
	cset	w0, ne
	cmp	w4, w3
	orr	w0, w2, w0
	cset	w1, ne
	orr	w0, w1, w0
	cbz	w0, .L3907
	mov	w1, 1
	mov	w0, 0
	str	w1, [x21]
.L3900:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3916:
	ldr	x0, [x19, 2368]
	bl	BsResidBits
	cmp	w0, wzr
	ldp	w2, w1, [x20, 188]
	ldr	w4, [x19, 200]
	mul	w1, w1, w2
	add	w4, w4, 1
	udiv	w4, w1, w4
	ccmp	w0, w4, 1, ge
	blt	.L3902
.L3907:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3915:
	ldr	x2, .LC1079
	mov	w1, 14151
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC1080
	ldr	x4, [x0]
	cbz	x4, .L3908
	add	x2, x29, 80
	ldr	w0, [x19, 248]
	mov	w20, -1
	mov	w3, 4
	mov	w1, 9
	str	w20, [x2, -8]!
	blr	x4
	ldr	x23, [sp, 48]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3917:
	ldr	w7, [x20, 96]
	ldr	w0, [x20, 88]
	cmp	w0, w7
	csel	w0, w0, w7, cs
	str	w0, [x1, 892]
	ldr	x0, [x19, 2432]
	ldr	x7, [x19, 2464]
	ldr	w1, [x0, 96]
	ldr	w0, [x0, 88]
	cmp	w0, w1
	csel	w0, w0, w1, cs
	ldr	w1, [x7, 892]
	cmp	w0, 8
	ccmp	w1, 8, 0, hi
	bne	.L3918
.L3905:
	mov	w0, 1
	str	w0, [x7, 896]
	str	w0, [x21]
	b	.L3904
	.p2align 3
.L3908:
	mov	w0, -1
	b	.L3900
	.p2align 3
.L3918:
	cmp	w0, 8
	ccmp	w1, 8, 4, eq
	ble	.L3904
	b	.L3905
.L3902:
	ldr	x2, .LC1082
	mov	w3, w0
	mov	w1, 14167
	mov	w0, w23
	bl	dprint_normal
	mov	w0, -1
	b	.L3900
	.size	HEVC_InquireSliceProperty, .-HEVC_InquireSliceProperty
	.align	3
.LC1077:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1079:
	.xword	.LC1078
	.align	3
.LC1080:
	.xword	g_EventReportFunc
	.align	3
.LC1082:
	.xword	.LC1081
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
	ldr	w0, [x19, 200]
	cbnz	w0, .L3920
	add	x0, x19, 4096
	mov	w20, -1
	ldrb	w0, [x0, 2305]
	cbnz	w0, .L3924
.L3920:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3924:
	ldr	x3, .LC1083
	mov	w1, 14226
	ldr	x2, .LC1085
	mov	w0, 0
	add	x3, x3, 680
	bl	dprint_normal
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_HaveSliceToDec, .-HEVC_HaveSliceToDec
	.align	3
.LC1083:
	.xword	.LANCHOR4
	.align	3
.LC1085:
	.xword	.LC1084
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
	ldr	x2, [x19, 11344]
	mov	w0, 0
	cbz	x2, .L3926
	.p2align 2
.L3927:
	ldp	w3, w1, [x2]
	ldr	x2, [x2, 1360]
	add	w1, w3, w1
	add	w1, w1, 7
	add	w0, w0, w1, lsr 3
	cbnz	x2, .L3927
.L3926:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_GetPicStreamSize, .-HEVC_GetPicStreamSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsFrameEndNal
	.type	HEVC_IsFrameEndNal, %function
HEVC_IsFrameEndNal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	and	w19, w19, -17
	bl	_mcount
	sub	w19, w19, #32
	cmp	w19, 1
	ldr	x19, [sp, 16]
	cset	w0, ls
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsFrameEndNal, .-HEVC_IsFrameEndNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_CheckSedOnly
	.type	HEVCDEC_CheckSedOnly, %function
HEVCDEC_CheckSedOnly:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 2332]
	str	wzr, [x19, 2340]
	str	wzr, [x19, 2348]
	cbnz	w0, .L3932
	ldr	w0, [x19, 2336]
	cmp	w0, 2
	csetm	w0, eq
.L3956:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3932:
	ldr	w0, [x19, 2336]
	cmp	w0, 2
	beq	.L3963
	cmp	w0, 1
	mov	w0, 0
	bne	.L3956
	ldr	w1, [x19, 2344]
	cmp	w1, 1
	bne	.L3956
	str	wzr, [x19, 2344]
	.p2align 2
.L3961:
	mov	w0, -1
	b	.L3956
	.p2align 3
.L3963:
	ldr	w1, [x19, 2344]
	mov	w0, 0
	cmp	w1, 1
	beq	.L3956
	ldr	w0, [x19, 248]
	bl	VCTRL_CheckFreshSeg
	cbz	w0, .L3935
.L3938:
	ldr	x1, [x19, 2408]
	ldr	x0, [x19, 2368]
	ldr	w2, [x1, 48]
	ldr	x1, [x1, 40]
	bl	BsInit
	ldr	x0, [x19, 2368]
	mov	w1, 24
	bl	BsSkip
	ldr	x0, [x19, 2368]
	bl	BsResidBits
	cmp	w0, 15
	ble	.L3961
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsSkip
	ldr	x0, [x19, 2368]
	mov	w1, 6
	bl	BsGet
	mov	w20, w0
	ldr	x0, [x19, 2368]
	mov	w1, 9
	bl	BsSkip
	mov	w0, w20
	bl	HEVC_IsSliceUnit
	sxtb	w21, w0
	cmp	w21, 1
	beq	.L3964
	ldr	w1, [x19, 200]
	mov	w2, 0
	cbz	w1, .L3961
.L3946:
	and	w20, w20, -17
	sub	w20, w20, #32
	cmp	w20, 1
	cset	w0, ls
	orr	w0, w2, w0
	cbz	w0, .L3965
.L3941:
	ldr	x0, .LC1086
	ldr	x4, [x0]
	cbz	x4, .L3943
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	blr	x4
.L3943:
	mov	x0, x19
	bl	HEVC_DecVDM
	cbnz	w0, .L3961
	add	x2, x19, 4096
	mov	w1, 1
	str	w1, [x19, 2348]
	mov	w0, -1
	strb	w1, [x2, 2304]
	b	.L3956
	.p2align 3
.L3935:
	ldr	w0, [x19, 248]
	bl	VCTRL_GetChanCrcMode
	cbnz	w0, .L3938
	ldr	x0, [x19, 2464]
	ldr	w0, [x0, 888]
	cmp	w0, 1
	beq	.L3938
	mov	w0, -1
	b	.L3956
	.p2align 3
.L3965:
	ldr	w0, [x19, 7160]
	cmp	w0, 2
	beq	.L3941
	cmp	w21, 1
	bne	.L3961
.L3945:
	add	x1, x19, 4096
	mov	w0, 1
	str	wzr, [x19, 2344]
	str	w0, [x19, 2340]
	mov	w0, 0
	ldrb	w1, [x1, 2305]
	str	w1, [x19, 2352]
	b	.L3956
	.p2align 3
.L3964:
	ldr	x0, [x19, 2368]
	bl	BsResidBits
	cmp	w0, wzr
	mov	w0, 0
	ble	.L3940
	ldr	x0, [x19, 2368]
	mov	w1, w21
	bl	BsGet
.L3940:
	ldr	w1, [x19, 200]
	cbz	w1, .L3945
	cmp	w0, wzr
	cset	w2, ne
	b	.L3946
	.size	HEVCDEC_CheckSedOnly, .-HEVCDEC_CheckSedOnly
	.align	3
.LC1086:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_IsNeedSedOnly
	.type	HEVCDEC_IsNeedSedOnly, %function
HEVCDEC_IsNeedSedOnly:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 200]
	cbz	w0, .L3969
	ldr	x1, [x19, 2480]
	cbz	x1, .L3975
.L3969:
	mov	w0, 0
.L3968:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3975:
	ldr	w1, [x19, 8996]
	cmp	w1, 1
	bls	.L3969
	ldr	w1, [x19, 2356]
	cmp	w0, w1
	beq	.L3969
	ldr	w0, [x19, 2340]
	cmp	w0, 1
	beq	.L3976
	cbnz	w0, .L3973
	ldr	w0, [x19, 248]
	bl	VCTRL_CheckFreshSeg
	cbnz	w0, .L3971
.L3973:
	ldr	w0, [x19, 248]
	bl	VCTRL_GetChanCrcMode
	cbz	w0, .L3969
	ldr	x0, .LC1087
	ldr	x0, [x0]
	blr	x0
	mov	w1, 52429
	movk	w1, 0xcccc, lsl 16
	umull	x1, w0, w1
	lsr	x1, x1, 32
	lsr	w1, w1, 3
	lsl	w2, w1, 3
	add	w1, w2, w1, lsl 1
	sub	w1, w0, w1
	cmp	w1, 2
	cset	w0, ls
	b	.L3968
	.p2align 3
.L3976:
	ldr	x0, [x19, 2408]
	cbz	x0, .L3973
.L3971:
	mov	w0, 1
	b	.L3968
	.size	HEVCDEC_IsNeedSedOnly, .-HEVCDEC_IsNeedSedOnly
	.align	3
.LC1087:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	HEVCDEC_SetDecParam.part.29, %function
HEVCDEC_SetDecParam.part.29:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 2344]
	cmp	w0, 1
	beq	.L3997
.L3978:
	mov	x0, x19
	bl	HEVCDEC_IsNeedSedOnly
	cmp	w0, 1
	beq	.L3998
	ldr	w0, [x19, 2340]
	cmp	w0, 1
	beq	.L3999
.L3977:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3999:
	ldr	w2, [x19, 180]
	add	x0, x19, 4096
	ldr	w3, [x19, 200]
	ldr	w1, [x19, 232]
	sub	w2, w2, #1
	sub	w3, w3, #1
	str	w2, [x19, 180]
	sub	w1, w1, #1
	str	w3, [x19, 200]
	str	w1, [x19, 232]
	ldr	w2, [x19, 2352]
	strb	w2, [x0, 2305]
.L3996:
	ldr	x1, [x19, 2408]
	cbz	x1, .L3977
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3997:
	ldr	w0, [x19, 200]
	cbz	w0, .L3978
	ldr	x0, [x19, 2480]
	cbnz	x0, .L3978
	ldr	x0, .LC1088
	ldr	x4, [x0]
	cbz	x4, .L3979
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	blr	x4
.L3979:
	mov	x0, x19
	bl	HEVC_DecVDM
	cbnz	w0, .L3996
	add	x1, x19, 4096
	mov	w0, 1
	str	w0, [x19, 2348]
	strb	w0, [x1, 2304]
	b	.L3977
	.p2align 3
.L3998:
	ldr	w2, [x19, 200]
	add	x1, x19, 8192
	str	wzr, [x19, 2344]
	add	x1, x1, 784
	str	w2, [x19, 2356]
	str	x1, [x19, 2480]
	str	w2, [x19, 11336]
	str	w0, [x19, 13908]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVCDEC_SetDecParam.part.29, .-HEVCDEC_SetDecParam.part.29
	.align	3
.LC1088:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_SetDecParam
	.type	HEVCDEC_SetDecParam, %function
HEVCDEC_SetDecParam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 2332]
	cbz	w0, .L4000
	mov	x0, x19
	bl	HEVCDEC_SetDecParam.part.29
.L4000:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVCDEC_SetDecParam, .-HEVCDEC_SetDecParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_VDMProcSedOnly
	.type	HEVCDEC_VDMProcSedOnly, %function
HEVCDEC_VDMProcSedOnly:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	sxtw	x1, w19
	ldr	x2, [x20, 2480]
	lsl	x0, x1, 2
	ldr	x19, .LC1090
	sub	x0, x0, x1
	ldr	x4, .LC1089
	lsl	x0, x0, 3
	ldrsw	x5, [x20, 248]
	ldp	w3, w21, [x2, 16]
	sub	x0, x0, x1
	ldr	x2, .LC1092
	ldr	x22, [x4, x5, lsl 3]
	mov	w1, 14445
	add	x19, x19, x0, lsl 3
	mov	w0, 20
	madd	w21, w3, w21, w21
	ldr	w4, [x19, 20]
	add	w21, w21, w3
	mov	w3, w21
	bl	dprint_normal
	str	xzr, [x20, 2480]
	ldr	w0, [x19, 20]
	cmp	w21, w0
	ldr	w0, [x20, 2340]
	beq	.L4018
	cmp	w0, 1
	beq	.L4019
.L4010:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L4019:
	ldr	w2, [x20, 180]
	add	x0, x20, 4096
	ldr	w3, [x20, 200]
	ldr	w1, [x20, 232]
	sub	w2, w2, #1
	sub	w3, w3, #1
	str	w2, [x20, 180]
	sub	w1, w1, #1
	str	w3, [x20, 200]
	str	w1, [x20, 232]
	str	wzr, [x20, 2344]
	ldr	w2, [x20, 2352]
	strb	w2, [x0, 2305]
	ldr	x1, [x20, 2408]
	cbz	x1, .L4010
	ldr	w0, [x20, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x20, 2408]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L4018:
	cmp	w0, 1
	beq	.L4007
	ldr	x0, .LC1093
	ldr	x4, [x0]
	cbz	x4, .L4008
	ldr	w0, [x20, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	blr	x4
.L4008:
	mov	x0, x20
	bl	HEVC_DecVDM
	cbnz	w0, .L4010
	add	x1, x20, 4096
	mov	w0, 1
	str	w0, [x20, 2348]
	strb	w0, [x1, 2304]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L4007:
	ldr	w2, [x20, 180]
	add	x4, x20, 4096
	ldr	w3, [x20, 200]
	add	x22, x22, 217088
	ldr	w1, [x20, 232]
	sub	w2, w2, #1
	ldr	w5, [x20, 2352]
	sub	w3, w3, #1
	str	w2, [x20, 180]
	sub	w1, w1, #1
	str	w3, [x20, 200]
	str	w1, [x20, 232]
	str	w0, [x20, 2344]
	strb	w5, [x4, 2305]
	strb	w0, [x22, 3401]
	strb	w0, [x20, 7]
	b	.L4010
	.size	HEVCDEC_VDMProcSedOnly, .-HEVCDEC_VDMProcSedOnly
	.align	3
.LC1089:
	.xword	s_pstVfmwChan
	.align	3
.LC1090:
	.xword	g_BackUp
	.align	3
.LC1092:
	.xword	.LC1091
	.align	3
.LC1093:
	.xword	g_EventReportFunc
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
	mov	x20, x1
	bl	_mcount
	ldr	x21, .LC1094
	mov	w1, 0
	mov	x2, 27872
	mov	x0, x19
	ldr	w22, [x19, 8968]
	ldr	x3, [x21, 96]
	blr	x3
	str	x20, [x19, 2464]
	mov	w0, 17
	mov	w1, 65
	stp	w0, w0, [x19, 160]
	str	w1, [x19, 168]
	mov	w0, 206
	str	xzr, [x19, 2480]
	mov	w1, 200
	str	w22, [x19, 8968]
	str	w1, [x19, 156]
	str	w0, [x19, 172]
	ldr	w0, [x20, 600]
	bl	MEM_Phy2Vir
	cbz	x0, .L4027
	ldr	w9, [x19, 160]
	mov	w22, 12644
	ldr	x8, [x19, 2464]
	lsl	w2, w9, 4
	ldr	w4, [x19, 172]
	ldpsw	x5, x3, [x19, 164]
	ldr	w7, [x8, 596]
	sub	w2, w2, w9
	lsl	w1, w3, 4
	ldrsw	x6, [x19, 156]
	add	w2, w7, w2, lsl 3
	sub	w1, w1, w3
	lsl	w1, w1, 2
	add	x7, x0, x7, uxtw
	madd	w5, w22, w5, w2
	sub	w3, w1, w3
	add	w1, w4, 1
	add	x2, x0, x2, uxtw
	str	x2, [x19, 2384]
	add	w3, w5, w3, lsl 5
	add	x5, x0, x5, uxtw
	str	x5, [x19, 2392]
	lsl	w5, w1, 3
	sub	w5, w5, w1
	mov	w2, 1368
	lsl	w5, w5, 1
	str	x7, [x19, 2376]
	madd	w2, w2, w6, w3
	sub	w1, w5, w1
	add	x3, x0, x3, uxtw
	str	x3, [x19, 2472]
	sxtw	x9, w9
	add	w1, w2, w1, lsl 3
	add	x2, x0, x2, uxtw
	str	x2, [x19, 2456]
	add	w4, w1, w4, lsl 3
	add	x5, x0, x1, uxtw
	str	x5, [x19, 2448]
	ldr	w5, [x8, 604]
	cmp	w4, w5
	bhi	.L4028
	ldr	w0, [x20, 636]
	cbz	w0, .L4029
.L4024:
	lsl	x2, x6, 2
	ldr	x4, [x21, 96]
	sub	x2, x2, x6
	mov	w1, 0
	lsl	x2, x2, 2
	mov	x0, x3
	sub	x2, x2, x6
	lsl	x2, x2, 2
	sub	x2, x2, x6
	lsl	x2, x2, 2
	sub	x2, x2, x6
	lsl	x2, x2, 3
	blr	x4
	ldr	w2, [x19, 172]
	mov	w4, 104
	ldr	x3, [x21, 96]
	mov	w1, 0
	add	w2, w2, 1
	ldr	x0, [x19, 2456]
	smull	x2, w2, w4
	blr	x3
	ldrsw	x2, [x19, 172]
	mov	w1, 0
	ldr	x3, [x21, 96]
	ldr	x0, [x19, 2448]
	lsl	x2, x2, 3
	blr	x3
	ldp	w5, w4, [x19, 160]
	mov	x1, -120
	mov	w0, 120
	ldr	w2, [x19, 168]
	mov	w8, 1888
	ldr	x9, [x19, 2376]
	mov	x7, -1888
	smaddl	x0, w5, w0, x1
	mov	w3, 12644
	mov	x1, -12644
	ldr	x6, [x19, 2392]
	smaddl	x3, w4, w3, x1
	ldr	x4, [x19, 2384]
	add	x1, x9, x0
	smaddl	x0, w2, w8, x7
	str	x1, [x19, 2424]
	add	x2, x4, x3
	add	x0, x6, x0
	str	x2, [x19, 2432]
	str	x0, [x19, 2440]
	mov	x0, x19
	str	w5, [x1, 4]
	ldr	x1, [x19, 2440]
	ldr	w2, [x19, 164]
	str	w2, [x1, 28]
	ldr	x1, [x19, 2432]
	ldr	w2, [x19, 168]
	str	w2, [x1, 56]
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x19, 248]
	beq	.L4030
	mov	w1, -2147483647
	mov	x0, x19
	str	w1, [x19, 208]
	bl	HEVC_InitDecPara
	str	wzr, [x19, 2360]
	ldr	w0, [x19, 168]
	mov	w2, 9999
	ldr	x1, [x19, 2464]
	str	w0, [x19, 300]
	mov	w0, 1
	str	w2, [x19, 256]
	strb	w0, [x19]
	mov	w0, 0
	str	wzr, [x19, 13976]
	ldr	w1, [x1, 652]
	str	w1, [x19, 2332]
.L4026:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L4029:
	lsl	x2, x9, 4
	ldr	x3, [x21, 96]
	sub	x2, x2, x9
	mov	x0, x7
	mov	w1, 0
	lsl	x2, x2, 3
	blr	x3
	ldr	w2, [x19, 164]
	mov	w1, 0
	ldr	x3, [x21, 96]
	ldr	x0, [x19, 2384]
	smull	x2, w2, w22
	blr	x3
	ldr	w4, [x19, 168]
	mov	w2, 1888
	ldr	x3, [x21, 96]
	mov	w1, 0
	ldr	x0, [x19, 2392]
	smull	x2, w4, w2
	blr	x3
	ldrsw	x6, [x19, 156]
	ldr	x3, [x19, 2472]
	b	.L4024
.L4028:
	ldr	x3, .LC1095
	mov	w1, 14542
	ldr	x2, .LC1099
	mov	w0, 0
	add	x3, x3, 704
	bl	dprint_normal
	mov	w0, -20
	b	.L4026
.L4030:
	ldr	x3, .LC1095
	mov	w1, 14568
	ldr	x2, .LC1101
	mov	w0, 0
	add	x3, x3, 704
	bl	dprint_normal
	mov	w0, -20
	b	.L4026
.L4027:
	ldr	x3, .LC1095
	mov	w1, 14516
	ldr	x2, .LC1097
	add	x3, x3, 704
	bl	dprint_normal
	mov	w0, -20
	b	.L4026
	.size	HEVCDEC_Init, .-HEVCDEC_Init
	.align	3
.LC1094:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1095:
	.xword	.LANCHOR4
	.align	3
.LC1097:
	.xword	.LC1096
	.align	3
.LC1099:
	.xword	.LC1098
	.align	3
.LC1101:
	.xword	.LC1100
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_GetImageBuffer
	.type	HEVCDEC_GetImageBuffer, %function
HEVCDEC_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 144]
	cbz	w0, .L4034
	add	x0, x19, 4096
	ldrb	w0, [x0, 2305]
	cmp	w0, 1
	beq	.L4034
	add	x2, x19, 12288
	mov	w4, 0
	add	x2, x2, 3248
	.p2align 2
.L4039:
	ldr	w0, [x2, 44]
	cbnz	w0, .L4035
	cbz	x2, .L4036
	ldr	w3, [x19, 2804]
	cbz	w3, .L4036
	ldr	x0, [x19, 2824]
	cmp	x0, x2
	beq	.L4035
	sub	w3, w3, #1
	mov	x0, x19
	add	x3, x19, x3, lsl 3
	b	.L4037
	.p2align 3
.L4038:
	ldr	x1, [x0, 2824]
	cmp	x1, x2
	beq	.L4035
.L4037:
	cmp	x0, x3
	add	x0, x0, 8
	bne	.L4038
.L4036:
	cmp	w4, 19
	bhi	.L4054
	ldr	w0, [x19, 248]
	bl	FSP_IsNewFsAvailable
	cmp	w0, 1
	beq	.L4034
	cmn	w0, #1
	beq	.L4055
.L4054:
	mov	w0, 0
.L4056:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L4034:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L4035:
	add	w4, w4, 1
	add	x2, x2, 616
	cmp	w4, 20
	bne	.L4039
	mov	w0, 0
	b	.L4056
.L4055:
	ldr	x2, .LC1103
	mov	w1, 14633
	mov	w0, 1
	bl	dprint_normal
	add	x1, x19, 8192
	ldr	w0, [x19, 248]
	add	x1, x1, 176
	bl	FSP_ClearNotInVoQueue
	mov	w0, 0
	b	.L4056
	.size	HEVCDEC_GetImageBuffer, .-HEVCDEC_GetImageBuffer
	.align	3
.LC1103:
	.xword	.LC1102
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
	str	wzr, [x29, 108]
	stp	wzr, wzr, [x29, 92]
	stp	wzr, wzr, [x29, 100]
	cbz	x20, .L4145
	ldrb	w0, [x19]
	cmp	w0, 1
	bne	.L4146
	ldr	x2, [x19, 2464]
	ldrb	w0, [x19, 7]
	cmp	w0, 1
	ldr	w0, [x2, 8]
	ubfiz	w0, w0, 16, 3
	str	w0, [x19, 244]
	beq	.L4061
	ldr	w0, [x2, 856]
	cmp	w0, 1
	beq	.L4147
.L4062:
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_ReceivePacket
	mov	w20, w0
	ldr	x0, [x19, 2408]
	str	x0, [x19, 2416]
.L4063:
	strb	wzr, [x19, 7]
	cbz	w20, .L4148
.L4142:
	mov	w0, 0
.L4125:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4148:
	mov	x0, x19
	bl	HEVCDEC_CheckSedOnly
	cbz	w0, .L4065
	ldr	x0, [x19, 2464]
	ldr	w0, [x0, 888]
	cmp	w0, 1
	beq	.L4065
	ldr	x1, [x19, 2408]
	cbz	x1, .L4066
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
.L4066:
	ldr	w0, [x19, 2332]
	cbnz	w0, .L4149
.L4143:
	mov	w0, -1
.L4155:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4147:
	ldr	w0, [x2, 888]
	cmp	w0, 1
	bne	.L4062
	ldr	w0, [x19, 324]
	cmp	w0, 1
	bne	.L4062
	ldr	x0, [x19, 2416]
	str	x0, [x19, 2408]
	mov	w0, 0
	strb	wzr, [x19, 7]
	str	wzr, [x19, 324]
	b	.L4125
	.p2align 3
.L4061:
	ldr	x0, [x19, 2408]
	cmp	x0, xzr
	csetm	w20, eq
	cbz	w20, .L4063
	ldr	x2, .LC1109
	mov	w1, 14713
	mov	w0, 0
	bl	dprint_normal
	mov	w0, w20
	b	.L4125
	.p2align 3
.L4065:
	ldr	x0, [x19, 2408]
	str	wzr, [x0, 4]
	ldr	x1, [x19, 2408]
	ldr	x0, [x19, 2368]
	ldr	w2, [x1, 48]
	ldr	x1, [x1, 40]
	bl	BsInit
	ldr	x0, [x19, 2368]
	mov	w1, 24
	bl	BsSkip
	ldr	x21, .LC1110
	ldrsw	x0, [x19, 248]
	ldr	x0, [x21, x0, lsl 3]
	add	x0, x0, 217088
	ldrsb	w20, [x0, 3072]
	cmp	w20, 1
	beq	.L4150
	mov	w22, 3
	mov	w23, 2
.L4141:
	mov	w24, 0
.L4068:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x20, [x19, 2408]
	ldr	x0, [x19, 2368]
	mov	w1, 6
	bl	BsGet
	str	w0, [x20, 16]
	mov	w1, 6
	ldr	x20, [x19, 2408]
	ldr	x0, [x19, 2368]
	bl	BsGet
	str	w0, [x20, 24]
	ldr	x20, [x19, 2408]
	ldr	w3, [x20, 24]
	cbnz	w3, .L4151
	ldr	x0, [x19, 2368]
	mov	w1, 3
	bl	BsGet
	str	w0, [x20, 28]
	ldr	x20, [x19, 2408]
	ldr	w0, [x20, 28]
	cbz	w0, .L4071
	sub	w0, w0, #1
	str	w0, [x20, 28]
	ldr	x20, [x19, 2408]
.L4071:
	ldr	w0, [x20, 16]
	bl	HEVC_IsSliceUnit
	sxtb	w25, w0
	cmp	w25, 1
	beq	.L4152
	str	wzr, [x20, 4]
	add	x0, x19, 2760
	ldr	x1, [x19, 2408]
	ldr	w2, [x1, 48]
	ldr	x1, [x1, 40]
	bl	BsInit
	ldr	x0, [x19, 2368]
	mov	w1, 24
	bl	BsSkip
	cmp	w23, 1
	ccmp	w22, 1, 0, eq
	ccmp	w24, 1, 4, eq
	beq	.L4087
	ldr	x0, [x19, 2368]
	mov	w1, 16
	bl	BsSkip
.L4087:
	ldr	x0, [x19, 2368]
	mov	w1, 1
	bl	BsGet
	ldr	x20, [x19, 2408]
	ldr	x0, [x19, 2368]
	mov	w1, 6
	bl	BsGet
	str	w0, [x20, 16]
	mov	w1, 6
	ldr	x20, [x19, 2408]
	ldr	x0, [x19, 2368]
	bl	BsGet
	str	w0, [x20, 24]
	mov	w1, 3
	ldr	x20, [x19, 2408]
	ldr	x0, [x19, 2368]
	bl	BsGet
	str	w0, [x20, 28]
	ldr	x1, [x19, 2408]
	ldr	w0, [x1, 28]
	cbnz	w0, .L4153
.L4076:
	mov	x0, x19
	bl	HEVC_DecOneNal
	cmn	w0, #2
	beq	.L4125
	cbnz	w0, .L4154
	ldr	w0, [x19, 2332]
	str	wzr, [x19, 6456]
	cmp	w0, 1
	bne	.L4142
	mov	x0, x19
	bl	HEVCDEC_SetDecParam.part.29
	b	.L4142
	.p2align 3
.L4149:
	mov	x0, x19
	bl	HEVCDEC_SetDecParam.part.29
	mov	w0, -1
	b	.L4155
	.p2align 3
.L4150:
	ldr	w23, [x0, 3184]
	ldr	w22, [x0, 3188]
	ldr	w3, [x0, 3192]
	mov	w1, w23
	mov	x0, x19
	mov	w2, w22
	bl	HEVC_VES_Splitter
	cmp	w0, 2
	beq	.L4092
	cmp	w0, 1
	bne	.L4125
	b	.L4141
	.p2align 3
.L4153:
	sub	w0, w0, #1
	str	w0, [x1, 28]
	b	.L4076
	.p2align 3
.L4092:
	mov	w24, w20
	b	.L4068
	.p2align 3
.L4151:
	ldr	x2, .LC1112
	mov	w1, 14771
	mov	w4, 0
	mov	w0, 1
	bl	dprint_normal
	ldr	x1, [x19, 2408]
	cbz	x1, .L4143
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
	mov	w0, -1
	b	.L4125
	.p2align 3
.L4146:
	ldr	x2, .LC1107
	mov	w1, 14686
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L4125
	.p2align 3
.L4152:
	add	x2, x29, 108
	add	x1, x29, 104
	mov	x0, x19
	bl	HEVC_InquireSliceProperty
	cbnz	w0, .L4073
	ldr	w20, [x29, 104]
	cmp	w20, 1
	beq	.L4156
.L4074:
	ldr	w0, [x29, 108]
	cmp	w0, 1
	bne	.L4076
	ldrsw	x1, [x19, 248]
	ldr	x22, .LC1115
	lsl	x2, x1, 2
	sub	x2, x2, x1
	lsl	x3, x2, 5
	add	x2, x2, x3
	add	x1, x2, x1
	add	x1, x22, x1
	ldr	w2, [x1, 64]
	cbz	w2, .L4157
.L4077:
	ldr	x0, [x19, 2408]
	ldr	w0, [x0, 24]
	add	x0, x19, x0
	ldrb	w20, [x0, 4]
	mov	x0, x19
	cmp	w20, 1
	beq	.L4158
	bl	HEVC_FlushOutputFrmFromDPB
	cbnz	w0, .L4159
.L4080:
	ldr	w0, [x19, 248]
	add	x3, x29, 100
	add	x2, x29, 96
	add	x1, x29, 92
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x19, 2464]
	ldr	w0, [x0, 736]
	cmp	w0, 1
	bne	.L4076
	ldr	w2, [x29, 100]
	cmp	w2, wzr
	bgt	.L4083
	ldr	w1, [x29, 96]
	cmp	w1, 32
	bgt	.L4083
	ldr	x1, [x19, 2480]
	cbnz	x1, .L4083
	ldr	w3, [x29, 108]
	cbz	w3, .L4076
	ldr	w1, [x19, 236]
	cbz	w1, .L4076
	ldr	x1, [x19, 2432]
	ldr	w4, [x19, 316]
	ldr	w5, [x1, 68]
	cmp	w5, w4
	beq	.L4076
	ldr	w6, [x1, 64]
	ldr	w4, [x19, 320]
	cmp	w6, w4
	ccmp	w2, wzr, 0, ne
	bne	.L4076
	str	w5, [x19, 316]
	ldr	x2, .LC1120
	ldr	w4, [x1, 64]
	mov	w1, 14853
	str	w4, [x19, 320]
	bl	dprint_normal
	ldr	x0, .LC1121
	ldr	x4, [x0]
	cbz	x4, .L4076
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 48
	blr	x4
	b	.L4076
	.p2align 3
.L4073:
	ldr	x2, .LC1123
	mov	w1, 14861
	mov	w0, w25
	bl	dprint_normal
	ldr	x1, [x19, 2408]
	cbz	x1, .L4085
	ldr	w0, [x19, 248]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2408]
.L4085:
	ldr	x0, .LC1121
	ldr	x4, [x0]
	cbz	x4, .L4086
	ldr	w0, [x19, 248]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L4086:
	ldrsw	x0, [x19, 248]
	ldr	x0, [x21, x0, lsl 3]
	add	x0, x0, 217088
	ldrsb	w1, [x0, 3072]
	cmp	w1, 1
	bne	.L4143
	ldr	w1, [x0, 3188]
	cmp	w1, 1
	bne	.L4143
	ldr	w0, [x0, 3192]
	cmp	w0, 2
	bne	.L4143
	add	x0, x19, 12288
	ldrb	w1, [x0, 1632]
	cbnz	w1, .L4143
	ldr	x3, .LC1116
	mov	x2, 56
	add	x0, x0, 1632
	ldr	x3, [x3, 96]
	blr	x3
	str	wzr, [x19, 3372]
	add	x1, x19, 3072
	mov	w0, -1
	stp	xzr, xzr, [x1, 320]
	stp	xzr, xzr, [x1, 336]
	b	.L4125
.L4156:
	ldr	w1, [x19, 200]
	cbnz	w1, .L4075
	add	x1, x19, 4096
	ldrb	w1, [x1, 2305]
	cbz	w1, .L4074
	ldr	x3, .LC1113
	mov	w1, 14226
	ldr	x2, .LC1114
	add	x3, x3, 680
	bl	dprint_normal
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	b	.L4074
.L4145:
	ldr	x2, .LC1105
	mov	w1, 14680
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L4125
.L4075:
	ldr	x3, [x19, 2408]
	mov	w2, 21
	ldr	x1, .LC1113
	add	x0, x19, 2760
	str	wzr, [x3, 4]
	add	x1, x1, 744
	bl	BsInit
	ldr	x0, [x19, 2368]
	mov	w1, 40
	bl	BsLongSkip
	ldr	x1, [x19, 2408]
	mov	w2, 48
	mov	x0, x19
	str	w2, [x1, 16]
	strb	w20, [x19, 8]
	bl	HEVC_DecOneNal
	strb	w20, [x19, 7]
	ldr	w1, [x19, 284]
	mov	w0, -2
	add	w1, w1, 1
	str	w1, [x19, 284]
	b	.L4125
.L4157:
	ldr	x2, .LC1116
	str	w0, [x1, 64]
	ldr	x0, [x2]
	ldr	w20, [x19, 248]
	blr	x0
	sxtw	x1, w20
	lsl	x2, x1, 2
	sub	x2, x2, x1
	lsl	x3, x2, 5
	add	x2, x2, x3
	add	x1, x2, x1
	add	x1, x22, x1
	str	w0, [x1, 68]
	b	.L4077
.L4154:
	ldr	x2, .LC1125
	mov	w1, 14917
	mov	w0, 20
	bl	dprint_normal
	mov	w0, -1
	b	.L4125
.L4158:
	bl	HEVC_EmptyFrmFromDPB
	cbz	w0, .L4080
	ldr	x3, .LC1113
	mov	w1, 14819
	ldr	x2, .LC1117
	mov	w0, w20
	add	x3, x3, 720
	bl	dprint_normal
	b	.L4080
.L4159:
	ldr	x3, .LC1113
	mov	w1, 14828
	ldr	x2, .LC1118
	mov	w0, 1
	add	x3, x3, 720
	bl	dprint_normal
	b	.L4080
.L4083:
	ldrsw	x1, [x19, 248]
	mov	w0, 1
	strb	w0, [x19, 7]
	mov	w2, 1
	mov	w0, -2
	ldr	x1, [x21, x1, lsl 3]
	add	x1, x1, 221184
	str	w2, [x1, 100]
	b	.L4125
	.size	HEVCDEC_DecodePacket, .-HEVCDEC_DecodePacket
	.align	3
.LC1105:
	.xword	.LC1104
	.align	3
.LC1107:
	.xword	.LC1106
	.align	3
.LC1109:
	.xword	.LC1108
	.align	3
.LC1110:
	.xword	s_pstVfmwChan
	.align	3
.LC1112:
	.xword	.LC1111
	.align	3
.LC1113:
	.xword	.LANCHOR4
	.align	3
.LC1114:
	.xword	.LC1084
	.align	3
.LC1115:
	.xword	g_VfmwChanStat
	.align	3
.LC1116:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1117:
	.xword	.LC1044
	.align	3
.LC1118:
	.xword	.LC1042
	.align	3
.LC1120:
	.xword	.LC1119
	.align	3
.LC1121:
	.xword	g_EventReportFunc
	.align	3
.LC1123:
	.xword	.LC1122
	.align	3
.LC1125:
	.xword	.LC1124
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_VDMPostProc
	.type	HEVCDEC_VDMPostProc, %function
HEVCDEC_VDMPostProc:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	w22, w1
	mov	x21, x3
	mov	w23, w5
	bl	_mcount
	ldr	x1, [x19, 2464]
	ldr	w0, [x19, 248]
	stp	xzr, xzr, [x29, 64]
	ldr	w20, [x1, 656]
	str	w22, [x19, 6440]
	str	xzr, [x29, 80]
	str	wzr, [x29, 88]
	bl	VCTRL_GetChanCrcMode
	cbnz	w0, .L4162
	ldr	w0, [x19, 2360]
	cmp	w0, 1
	bls	.L4166
	ldr	w1, [x19, 6420]
	cmp	w1, 1920
	bls	.L4166
	ldr	x0, [x19, 2464]
	ldr	w1, [x0, 8]
	cmp	w1, 2
	beq	.L4167
	str	wzr, [x19, 2332]
	.p2align 2
.L4162:
	mov	x0, x19
	bl	HEVC_ClearAllSlice
	cbz	w20, .L4168
	ldr	x0, [x19, 6464]
	mov	w1, 16
	str	w1, [x29, 88]
	cbz	x0, .L4169
	ldr	x0, .LC1126
	ldr	x2, [x0, 264]
	cbz	x2, .L4170
	mov	w1, w23
	add	x0, x29, 64
	blr	x2
	cbnz	w0, .L4171
	ldr	x2, [x19, 6464]
	ldr	w6, [x29, 64]
	add	x1, x2, 312
	ldr	w3, [x29, 80]
	str	w6, [x2, 312]
	ldp	w5, w4, [x29, 72]
	ldr	w2, [x29, 84]
	stp	w5, w4, [x1, 8]
	stp	w3, w2, [x1, 16]
	str	w6, [x19, 6704]
	str	w5, [x19, 6712]
	str	w4, [x19, 6716]
	str	w3, [x19, 6720]
	str	w2, [x19, 6724]
.L4168:
	mov	x1, x21
	mov	x0, x19
	bl	HEVC_StorePicInDPB
	cbnz	w0, .L4181
	mov	w1, 1
	str	w1, [x19, 176]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L4166:
	ldr	x1, [x19, 2464]
	cmp	w0, 1
	ldr	w1, [x1, 652]
	str	w1, [x19, 2332]
	bhi	.L4162
	add	w0, w0, 1
	str	w0, [x19, 2360]
	b	.L4162
	.p2align 3
.L4181:
	ldr	x2, .LC1133
	mov	w3, w0
	mov	w1, 15028
	mov	w0, 0
	bl	dprint_normal
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	mov	x0, x19
	bl	HEVC_ClearDPB
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, -1
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L4170:
	mov	w3, 14994
	ldr	x2, .LC1128
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
.L4171:
	ldr	x2, .LC1130
	mov	w1, 14997
	mov	w0, 1
	bl	dprint_normal
	b	.L4168
	.p2align 3
.L4167:
	ldr	w0, [x0, 652]
	str	w0, [x19, 2332]
	b	.L4162
	.p2align 3
.L4169:
	ldr	x2, .LC1131
	mov	w1, 15018
	mov	w0, 0
	bl	dprint_normal
	b	.L4168
	.size	HEVCDEC_VDMPostProc, .-HEVCDEC_VDMPostProc
	.align	3
.LC1126:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC1128:
	.xword	.LC1127
	.align	3
.LC1130:
	.xword	.LC1129
	.align	3
.LC1131:
	.xword	.LC981
	.align	3
.LC1133:
	.xword	.LC1132
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_FlushRemainImg
	.type	HEVCDEC_FlushRemainImg, %function
HEVCDEC_FlushRemainImg:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 2804]
	cbz	w0, .L4182
	ldr	x0, .LC1134
	mov	w21, 1
	ldr	x23, .LC1135
	add	x22, x0, 768
	.p2align 2
.L4183:
	add	x2, x29, 72
	add	x1, x29, 76
	mov	x0, x19
	bl	HEVC_GetMinPOC
	ldr	w2, [x29, 72]
	mov	x0, x19
	add	x1, x19, x2, uxtw 3
	ldr	x20, [x1, 2824]
	mov	x1, x20
	cbz	x20, .L4184
	ldrb	w3, [x20, 2]
	cmp	w3, 1
	beq	.L4184
	strb	w21, [x20, 2]
	bl	HEVC_GetImagePara
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_CheckFrameStore
	cbz	w0, .L4197
.L4196:
	ldr	w2, [x29, 72]
.L4184:
	mov	w1, w2
	mov	x0, x19
	bl	HEVC_RemoveApcStore
	ldr	w1, [x29, 72]
	mov	x0, x19
	bl	HEVC_RemoveFrameStoreOutDPB
	ldr	w0, [x19, 2804]
	cbnz	w0, .L4183
.L4182:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4197:
	add	x1, x20, 24
	mov	x0, x19
	bl	HEVC_OutputFrame.isra.9
	cbz	w0, .L4196
	mov	x3, x22
	mov	x2, x23
	mov	w1, 15073
	mov	w0, 0
	bl	dprint_normal
	mov	w1, 1
	mov	x0, x19
	bl	HEVC_ClearAll
	b	.L4196
	.size	HEVCDEC_FlushRemainImg, .-HEVCDEC_FlushRemainImg
	.align	3
.LC1134:
	.xword	.LANCHOR4
	.align	3
.LC1135:
	.xword	.LC896
	.global	g_IsDeced
	.global	g_TsToRsMap
	.global	s_TmpParam
	.global	s_hevc_diag_scan8x8_y
	.global	s_hevc_diag_scan8x8_x
	.global	s_hevc_diag_scan4x4_y
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.8620, %object
	.size	__func__.8620, 17
__func__.8620:
	.string	"HEVC_OutputFrame"
	.zero	7
	.type	SarTable.7296, %object
	.size	SarTable.7296, 136
SarTable.7296:
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
	.type	__func__.7308, %object
	.size	__func__.7308, 19
__func__.7308:
	.string	"HEVC_PrintDPBState"
	.zero	5
	.type	__func__.7412, %object
	.size	__func__.7412, 18
__func__.7412:
	.string	"HEVC_CalcTileInfo"
	.zero	6
	.type	__func__.7938, %object
	.size	__func__.7938, 27
__func__.7938:
	.string	"HEVC_GetUnRefPicWithMinPoc"
	.zero	5
	.type	__func__.7946, %object
	.size	__func__.7946, 21
__func__.7946:
	.string	"HEVC_IncreaseDPBSize"
	.zero	3
	.type	__func__.8199, %object
	.size	__func__.8199, 17
__func__.8199:
	.string	"HEVC_WritePicMsg"
	.zero	7
	.type	__func__.8228, %object
	.size	__func__.8228, 16
__func__.8228:
	.string	"HEVC_CheckListX"
	.type	__func__.8376, %object
	.size	__func__.8376, 16
__func__.8376:
	.string	"HEVC_RepairList"
	.type	__func__.8521, %object
	.size	__func__.8521, 20
__func__.8521:
	.string	"HEVC_RemoveApcStore"
	.zero	4
	.type	__func__.8815, %object
	.size	__func__.8815, 21
__func__.8815:
	.string	"HEVC_CheckFrameStore"
	.zero	3
	.type	__func__.8879, %object
	.size	__func__.8879, 19
__func__.8879:
	.string	"HEVC_GetSLHDR1Info"
	.zero	5
	.type	__func__.8898, %object
	.size	__func__.8898, 22
__func__.8898:
	.string	"HEVC_GetHDR10PlusInfo"
	.zero	2
	.type	__func__.8720, %object
	.size	__func__.8720, 25
__func__.8720:
	.string	"HEVC_RemoveSamePocOutDPB"
	.zero	7
	.type	__func__.8988, %object
	.size	__func__.8988, 14
__func__.8988:
	.string	"HEVC_IsNewPic"
	.zero	2
	.type	s_quant8_inter_default, %object
	.size	s_quant8_inter_default, 64
s_quant8_inter_default:
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
.LANCHOR4 = . + 0
	.type	__func__.9292, %object
	.size	__func__.9292, 16
__func__.9292:
	.string	"HEVC_ReleaseNAL"
	.type	__func__.8480, %object
	.size	__func__.8480, 20
__func__.8480:
	.string	"HEVC_InitDecBuffers"
	.zero	4
	.type	__func__.9159, %object
	.size	__func__.9159, 27
__func__.9159:
	.string	"HEVC_DecShortTermRefPicSet"
	.zero	5
	.type	s_hevc_diag_scan4x4_y, %object
	.size	s_hevc_diag_scan4x4_y, 16
s_hevc_diag_scan4x4_y:
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	1
	.byte	0
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	3
	.byte	2
	.byte	1
	.byte	3
	.byte	2
	.byte	3
	.type	s_hevc_diag_scan4x4_x, %object
	.size	s_hevc_diag_scan4x4_x, 16
s_hevc_diag_scan4x4_x:
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	2
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	1
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	3
	.type	s_hevc_diag_scan8x8_y, %object
	.size	s_hevc_diag_scan8x8_y, 64
s_hevc_diag_scan8x8_y:
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	1
	.byte	0
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	6
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	3
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	7
	.byte	6
	.byte	5
	.byte	7
	.byte	6
	.byte	7
	.type	s_hevc_diag_scan8x8_x, %object
	.size	s_hevc_diag_scan8x8_x, 64
s_hevc_diag_scan8x8_x:
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	2
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	5
	.byte	6
	.byte	7
	.byte	6
	.byte	7
	.byte	7
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
	.type	__func__.7538, %object
	.size	__func__.7538, 16
__func__.7538:
	.string	"HEVC_ProcessPPS"
	.type	__func__.8052, %object
	.size	__func__.8052, 27
__func__.8052:
	.string	"HEVC_DecSliceSegmentHeader"
	.zero	5
	.type	__func__.8456, %object
	.size	__func__.8456, 13
__func__.8456:
	.string	"HEVC_InitDPB"
	.zero	3
	.type	__func__.8627, %object
	.size	__func__.8627, 19
__func__.8627:
	.string	"HEVC_OutputCurrPic"
	.zero	5
	.type	__func__.8632, %object
	.size	__func__.8632, 23
__func__.8632:
	.string	"HEVC_FirstFrameFastOut"
	.zero	1
	.type	__func__.8807, %object
	.size	__func__.8807, 19
__func__.8807:
	.string	"HEVC_OutputFrmToVO"
	.zero	5
	.type	__func__.7952, %object
	.size	__func__.7952, 30
__func__.7952:
	.string	"HEVC_OutputUnRefPicWithMinPoc"
	.zero	2
	.type	__func__.8791, %object
	.size	__func__.8791, 27
__func__.8791:
	.string	"HEVC_FlushOutputFrmFromDPB"
	.zero	5
	.type	__func__.9349, %object
	.size	__func__.9349, 14
__func__.9349:
	.string	"HEVC_ClearDPB"
	.zero	2
	.type	__func__.7957, %object
	.size	__func__.7957, 23
__func__.7957:
	.string	"HEVC_RecoverDPBProcess"
	.zero	1
	.type	__func__.8730, %object
	.size	__func__.8730, 20
__func__.8730:
	.string	"HEVC_InsertFrmInDPB"
	.zero	4
	.type	__func__.8637, %object
	.size	__func__.8637, 22
__func__.8637:
	.string	"HEVC_SimpleDPBProcess"
	.zero	2
	.type	__func__.8642, %object
	.size	__func__.8642, 21
__func__.8642:
	.string	"HEVC_DecOrderProcess"
	.zero	3
	.type	__func__.8656, %object
	.size	__func__.8656, 22
__func__.8656:
	.string	"HEVC_DispOrderProcess"
	.zero	2
	.type	__func__.8663, %object
	.size	__func__.8663, 19
__func__.8663:
	.string	"HEVC_StorePicInDPB"
	.zero	5
	.type	__func__.8297, %object
	.size	__func__.8297, 12
__func__.8297:
	.string	"HEVC_DecVDM"
	.zero	4
	.type	__func__.7244, %object
	.size	__func__.7244, 18
__func__.7244:
	.string	"HEVC_VES_Splitter"
	.zero	6
	.type	__func__.7988, %object
	.size	__func__.7988, 14
__func__.7988:
	.string	"HEVC_DecSlice"
	.zero	2
	.type	__func__.9415, %object
	.size	__func__.9415, 20
__func__.9415:
	.string	"HEVC_HaveSliceToDec"
	.zero	4
	.type	__func__.9456, %object
	.size	__func__.9456, 13
__func__.9456:
	.string	"HEVCDEC_Init"
	.zero	3
	.type	__func__.9482, %object
	.size	__func__.9482, 21
__func__.9482:
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
	.type	__func__.9503, %object
	.size	__func__.9503, 23
__func__.9503:
	.string	"HEVCDEC_FlushRemainImg"
	.data
	.align	3
.LANCHOR3 = . + 0
	.type	s_quant8_intra_default, %object
	.size	s_quant8_intra_default, 64
s_quant8_intra_default:
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
	.type	s_quant_tsdefault4x4, %object
	.size	s_quant_tsdefault4x4, 16
s_quant_tsdefault4x4:
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
	.type	s_quant_inter_default8x8, %object
	.size	s_quant_inter_default8x8, 64
s_quant_inter_default8x8:
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
	.type	s_quant_intra_default8x8, %object
	.size	s_quant_intra_default8x8, 64
s_quant_intra_default8x8:
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
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC1:
	ASCII(.string	"%s: pImg is NULL!\n" )
	.zero	5
.LC3:
	ASCII(.string	"%s: insert image failed!\n" )
	.zero	6
.LC10:
	ASCII(.string	"line:%d ChanID(%d), pic_parameter_set_id(%d) out of range(0,%d).\n" )
	.zero	6
.LC12:
	ASCII(.string	"line:%d ChanID(%d), seq_parameter_set_id(%d) out of range[0,%d].\n" )
	.zero	6
.LC15:
	ASCII(.string	"dar=%d\n" )
.LC18:
	ASCII(.string	"--------------- PrintDPBState START ---------------\n" )
	.zero	3
.LC20:
	ASCII(.string	"DPB: size:%d, used_size:%d, negative:%d, positive:%d, longterm:%d\n" )
	.zero	5
.LC22:
	ASCII(.string	"\n" )
	.zero	6
.LC24:
	ASCII(.string	"fs[%d]:%p view %d non_existing:%d state:%d is_ref:%d displayed:%d poc:%d long_term:%d LogicFs:%p, fsp_ref:%d fsp_disp:%d logic_id:%d img_id:%d\n" )
.LC26:
	ASCII(.string	"--------------- PrintDPBState END ---------------\n" )
	.zero	5
.LC29:
	ASCII(.string	"%s %d LogicFs:Null\n" )
	.zero	4
.LC31:
	ASCII(.string	"fs[%d]\t" )
.LC33:
	ASCII(.string	"LogicFs:%p\t" )
	.zero	4
.LC35:
	ASCII(.string	"LogicTick:%d\t" )
	.zero	2
.LC37:
	ASCII(.string	"IsRef:%d\t" )
	.zero	6
.LC39:
	ASCII(.string	"DispState:%d\t" )
	.zero	2
.LC41:
	ASCII(.string	"DecFs:%p\t" )
	.zero	6
.LC43:
	ASCII(.string	"DecTick:%d\t" )
	.zero	4
.LC45:
	ASCII(.string	"DecFs:Null\t" )
	.zero	4
.LC48:
	ASCII(.string	"%s num_tile_columns(%d) out of range(0, %d].\n" )
	.zero	2
.LC50:
	ASCII(.string	"%s num_tile_rows(%d) out of range(0, %d].\n" )
	.zero	5
.LC53:
	ASCII(.string	"%s 0 idx(%d) out of range(0, 512).\n" )
	.zero	4
.LC55:
	ASCII(.string	"%s 1 idx(%d) out of range(0, 512).\n" )
	.zero	4
.LC61:
	ASCII(.string	"HEVC_Sei_User_Data_Unregistered payloadSize < 16\n" )
	.zero	6
.LC63:
	ASCII(.string	"pListX[0][%d] = NULL, listXsize[0] = %d\n" )
	.zero	7
.LC65:
	ASCII(.string	"pListX[0][%d]->frame_store = NULL, listXsize[0] = %d\n" )
	.zero	2
.LC67:
	ASCII(.string	"pListX[0][%d] frame_store(%p), pstLogicFs(%p) invalid\n" )
	.zero	1
.LC69:
	ASCII(.string	"pListX[1][%d] = NULL, listXsize[1] = %d\n" )
	.zero	7
.LC71:
	ASCII(.string	"pListX[1][%d]->frame_store = NULL, listXsize[1] = %d\n" )
	.zero	2
.LC73:
	ASCII(.string	"pListX[i][%d] pstLogicFs(%p) invalid\n" )
	.zero	2
.LC76:
	ASCII(.string	"%s can't find such pic.\n" )
	.zero	7
.LC78:
	ASCII(.string	"%s DPB.used_size(%d) >= 17.\n" )
	.zero	3
.LC80:
	ASCII(.string	"%s find pos=%d, poc=%d.\n" )
	.zero	7
.LC83:
	ASCII(.string	"%s DPB.size(%d) already reached max(%d).\n" )
	.zero	6
.LC85:
	ASCII(.string	"%s increase DPB size to %d\n" )
	.zero	4
.LC87:
	ASCII(.string	"%s no enough fs(MinAvailFsNum = %d) to increase DPB size.\n" )
	.zero	5
.LC89:
	ASCII(.string	"TileWidthInCtb is 0\n" )
	.zero	3
.LC94:
	ASCII(.string	"image_id=%d, pmv_idc=%d\n" )
	.zero	7
.LC96:
	ASCII(.string	"pic msg burst0:\n" )
	.zero	7
.LC100:
	ASCII(.string	"%s call HEVC_CalcTileInfo failed.\n" )
	.zero	5
.LC102:
	ASCII(.string	"logic frame id(=%d): get LogicFs error!\n" )
	.zero	7
.LC104:
	ASCII(.string	"phy fs is null: pstDecodeFs = %p, pstPmv = %p\n" )
	.zero	1
.LC109:
	ASCII(.string	"%s ERROR: bHaveIndependentSlice = 0\n\n" )
	.zero	2
.LC111:
	ASCII(.string	"ListX ERROR: list0size >= %d\n" )
	.zero	2
.LC113:
	ASCII(.string	"ListX ERROR: list1size >= %d\n" )
	.zero	2
.LC115:
	ASCII(.string	"pListX[0][%d] = NULL\n" )
	.zero	2
.LC117:
	ASCII(.string	"pListX[0][%d]->frame_store = NULL\n" )
	.zero	5
.LC119:
	ASCII(.string	"pListX[1][%d] = NULL\n" )
	.zero	2
.LC121:
	ASCII(.string	"pListX[1][%d]->frame_store = NULL\n" )
	.zero	5
.LC123:
	ASCII(.string	"NumSlicePara(%d) >= MaxSliceNum(%d)\n" )
	.zero	3
.LC131:
	ASCII(.string	"%s unkown slice type(%d).\n" )
	.zero	5
.LC133:
	ASCII(.string	"%s pListX[%d] no available pic to repair.\n" )
	.zero	5
.LC135:
	ASCII(.string	"%s: pListX[%d][%d] = NULL, repair it with pos(%d).\n" )
	.zero	4
.LC139:
	ASCII(.string	"HEVC_InitListX error.\n" )
	.zero	1
.LC141:
	ASCII(.string	"HEVC_RepairList error.\n" )
.LC145:
	ASCII(.string	"%s fs[%d]->view_id = %d invalid.\n" )
	.zero	6
.LC147:
	ASCII(.string	"../../core/syntax/hevc.c" )
	.zero	7
.LC149:
	ASCII(.string	"NULL pointer: %s, L%d\n" )
	.zero	1
.LC151:
	ASCII(.string	"framestore %d allocate apc %d\n" )
	.zero	1
.LC153:
	ASCII(.string	"find APC, but logic_fs_id %d abnormal(poc=%d, ref=%d, logic_fs=%p, dec_fs=%p)\n" )
	.zero	1
.LC155:
	ASCII(.string	"Cant find free apc slot.\n" )
	.zero	6
.LC158:
	ASCII(.string	"%s frame logic_fs_id=%d, state=%d\n" )
	.zero	5
.LC160:
	ASCII(.string	"LogicFs(fs=%p, poc=%d, FirstFrameState=%d) is null, logic_fs_id = %d\n" )
	.zero	2
.LC162:
	ASCII(.string	"%s frame poc=%d, is already output\n" )
	.zero	4
.LC164:
	ASCII(.string	"%s frame(%p) invalid, state:%d, non_existing:%d\n" )
	.zero	7
.LC166:
	ASCII(.string	"Chan:%d exg_pts: %lld <-> %lld\n" )
.LC169:
	ASCII(.string	"HEVC_DECRecycleImage ERROR, DispState = FS_STATE_NOT_USE\n" )
	.zero	6
.LC171:
	ASCII(.string	"%-5d   specVersion\n" )
	.zero	4
.LC173:
	ASCII(.string	"%-5d   payloadMode\n" )
	.zero	4
.LC175:
	ASCII(.string	"%-5d   hdrPicColourSpace\n" )
	.zero	6
.LC177:
	ASCII(.string	"%-5d   hdrMasterDisplayColourSpace\n" )
	.zero	4
.LC179:
	ASCII(.string	"%-5d   hdrMasterDisplayMaxLuminance\n" )
	.zero	3
.LC181:
	ASCII(.string	"%-5d   hdrMasterDisplayMinLuminance\n" )
	.zero	3
.LC183:
	ASCII(.string	"%-5d   sdrPicColourSpace\n" )
	.zero	6
.LC185:
	ASCII(.string	"%-5d   sdrMasterDisplayColourSpace\n" )
	.zero	4
.LC187:
	ASCII(.string	"%-5d   tmInputSignalBlackLevelOffset\n" )
	.zero	2
.LC189:
	ASCII(.string	"%-5d   tmInputSignalWhiteLevelOffset\n" )
	.zero	2
.LC191:
	ASCII(.string	"%-5d   shadowGain\n" )
	.zero	5
.LC193:
	ASCII(.string	"%-5d   highlightGain\n" )
	.zero	2
.LC195:
	ASCII(.string	"%-5d   midToneWidthAdjFactor\n" )
	.zero	2
.LC197:
	ASCII(.string	"%-5d   tmOutputFineTuningNumVal\n" )
	.zero	7
.LC199:
	ASCII(.string	"%-5d   saturationGainNumVal\n" )
	.zero	3
.LC201:
	ASCII(.string	"%-5d   tmOutputFineTuningX[%d]\n" )
.LC203:
	ASCII(.string	"%-5d   tmOutputFineTuningY[%d]\n" )
.LC205:
	ASCII(.string	"%-5d   saturationGainX[%d]\n" )
	.zero	4
.LC207:
	ASCII(.string	"%-5d   saturationGainY[%d]\n" )
	.zero	4
.LC209:
	ASCII(.string	"%-5d   luminanceMappingNumVal\n" )
	.zero	1
.LC211:
	ASCII(.string	"%-5d   colourCorrectionNumVal\n" )
	.zero	1
.LC213:
	ASCII(.string	"%-5d   luminanceMappingX[%d]\n" )
	.zero	2
.LC215:
	ASCII(.string	"%-5d   luminanceMappingY[%d]\n" )
	.zero	2
.LC217:
	ASCII(.string	"%-5d   chromaToLumaInjectionMuA\n" )
	.zero	7
.LC219:
	ASCII(.string	"%-5d   chromaToLumaInjectionMuB\n" )
	.zero	7
.LC221:
	ASCII(.string	"%-5d   colourCorrectionX[%d]\n" )
	.zero	2
.LC223:
	ASCII(.string	"%-5d   colourCorrectionY[%d]\n" )
	.zero	2
.LC225:
	ASCII(.string	"======SL_HDR1_METADATA= %d=======\n" )
	.zero	5
.LC228:
	ASCII(.string	"%s, [%d %d %d %d %d]\n" )
	.zero	2
.LC230:
	ASCII(.string	"%s HDR_Metadata_phy_addr is invalid!!\n" )
	.zero	1
.LC234:
	ASCII(.string	"%s, bAvalible:%d\n" )
	.zero	6
.LC236:
	ASCII(.string	"%s pMetaData is null\n" )
	.zero	2
.LC238:
	ASCII(.string	"%s error: metadata size(%d) < structure size(%d)\n" )
	.zero	6
.LC241:
	ASCII(.string	"FS_ALLOC_ERR, ClearAll\n" )
.LC244:
	ASCII(.string	"Can not new logic fs! ClearAll\n" )
.LC246:
	ASCII(.string	"pos: %d, pHevcCtx->DPB.fs[i]: %p is null\n" )
	.zero	6
.LC249:
	ASCII(.string	"%s have same poc(%d) in DPB, Remove the old\n" )
	.zero	3
.LC251:
	ASCII(.string	"%s: pHevcCtx->DPB.used_size(%d) > DPB.size(%d), error resilence.\n" )
	.zero	6
.LC253:
	ASCII(.string	"nal_segment = %d is not expected value\n" )
.LC255:
	ASCII(.string	"HEVC_VpsSpsPpsCheck pic_parameter_set_id(%d) out of range\n" )
	.zero	5
.LC257:
	ASCII(.string	"pps with this pic_parameter_set_id = %d havn't be decoded\n" )
	.zero	5
.LC259:
	ASCII(.string	"HEVC_VpsSpsPpsCheck seq_parameter_set_id(%d) out of range\n" )
	.zero	5
.LC261:
	ASCII(.string	"sps with this seq_parameter_set_id = %d havn't be decoded\n" )
	.zero	5
.LC263:
	ASCII(.string	"HEVC_VpsSpsPpsCheck video_parameter_set_id out of range\n" )
	.zero	7
.LC265:
	ASCII(.string	"vps with this video_parameter_set_id = %d havn't be decoded\n" )
	.zero	3
.LC268:
	ASCII(.string	"%s, %d, CurrSlice.poc = %d, PocRandomAccess = %d, nal_unit_type = %d, should skip this frame\n" )
	.zero	2
.LC270:
	ASCII(.string	"%s, %d, CurrSlice.poc = %d, bNoRaslOutputFlag = %d, nal_unit_type = %d, should skip this frame\n" )
.LC272:
	ASCII(.string	"%s, %d, PrevRAPIsBLA = %d, CurrSlice.poc = %d, PocCRA = %d, nal_unit_type = %d, should skip this frame\n" )
.LC274:
	ASCII(.string	"HEVC_ReadByteAlignment: code should not be zero.\n" )
	.zero	6
.LC276:
	ASCII(.string	"HEVC_ReadByteAlignment: code:%d\n" )
	.zero	7
.LC278:
	ASCII(.string	"reserved_zero_2bits not equal 0.\n" )
	.zero	6
.LC287:
	ASCII(.string	"HEVC_GetScalingListDefaultAddress NULL.\n" )
	.zero	7
.LC289:
	ASCII(.string	"Error, BsLen: 0x%x, TotalPos: 0x%x\n" )
	.zero	4
.LC294:
	ASCII(.string	"%s release streambuff=%p, bitstream_length=%d\n" )
	.zero	1
.LC298:
	ASCII(.string	"%s DPB size exceed %d, force to %d\n" )
	.zero	4
.LC301:
	ASCII(.string	"HEVC_CombinePacket FATAL: pCurrNal=NULL!\n" )
	.zero	6
.LC303:
	ASCII(.string	"END of the bit buffer, copy the first packet!\n" )
	.zero	1
.LC306:
	ASCII(.string	"tone_map_id" )
	.zero	4
.LC308:
	ASCII(.string	"Unsupport: target_bit_depth(%d) > 8\n" )
	.zero	3
.LC311:
	ASCII(.string	"pTon->num_pivots > 256\n" )
.LC313:
	ASCII(.string	"frame_packing_arrangement_id" )
	.zero	3
.LC315:
	ASCII(.string	"frame_packing_arrangement_type(%d) out of range\n" )
	.zero	7
.LC317:
	ASCII(.string	"decoding_unit_idx" )
	.zero	6
.LC319:
	ASCII(.string	"num_sps_ids_minus1" )
	.zero	5
.LC321:
	ASCII(.string	"pAct->num_sps_ids_minus1 > 15\n" )
	.zero	1
.LC323:
	ASCII(.string	"active_seq_parameter_set_id" )
	.zero	4
.LC325:
	ASCII(.string	"bp_seq_parameter_set_id" )
.LC327:
	ASCII(.string	"Wrong bp_seq_parameter_set_id = %d, should be 0 to 15!\n" )
.LC330:
	ASCII(.string	"num_decoding_units_minus1" )
	.zero	6
.LC332:
	ASCII(.string	"pPic->num_decoding_units_minus1 > 255\n" )
	.zero	1
.LC334:
	ASCII(.string	"num_nalus_in_du_minus1" )
	.zero	1
.LC336:
	ASCII(.string	"cv_rec_id" )
	.zero	6
.LC338:
	ASCII(.string	"ERROR: tone_mapping_output_fine_tuning_num_val %d out of range[0, 10]\n" )
	.zero	1
.LC340:
	ASCII(.string	"ERROR: saturation_gain_num_val %d out of range[0, 6]\n" )
	.zero	2
.LC342:
	ASCII(.string	"HEVC_Sei_User_Data_Registered_Itu_T_T35 payloadSize < 4!!\n" )
	.zero	5
.LC344:
	ASCII(.string	"delta_idx_minus1" )
	.zero	7
.LC346:
	ASCII(.string	"delta_idx(%d) > idx(%d).\n" )
	.zero	6
.LC348:
	ASCII(.string	"rIdx(%d) > (idx-1)(%d) or < 0).\n" )
	.zero	7
.LC350:
	ASCII(.string	"abs_delta_rps_minus1" )
	.zero	3
.LC352:
	ASCII(.string	"pTempRPset->num_of_pics(%d) out of range(0,15).\n" )
	.zero	7
.LC354:
	ASCII(.string	"num_of_pics out of range(0,15).\n" )
	.zero	7
.LC356:
	ASCII(.string	"num_negative_pics" )
	.zero	6
.LC358:
	ASCII(.string	"pTempRPset->num_negative_pics(%d) out of range(0,15).\n" )
	.zero	1
.LC360:
	ASCII(.string	"num_positive_pics" )
	.zero	6
.LC362:
	ASCII(.string	"pTempRPset->num_positive_pics(%d) out of range(0,15).\n" )
	.zero	1
.LC364:
	ASCII(.string	"pShortTermRpset->num_of_pics(%d) out of range[0,%d].\n" )
	.zero	2
.LC366:
	ASCII(.string	"delta_poc_s0_minus1" )
	.zero	4
.LC368:
	ASCII(.string	"delta_poc_s0_minus1(%d) out of range.\n" )
	.zero	1
.LC370:
	ASCII(.string	"delta_poc_s1_minus1" )
	.zero	4
.LC373:
	ASCII(.string	"%s, %d: unsigned interger overflow\n" )
	.zero	4
.LC375:
	ASCII(.string	"%s, %d: unsigned integer overflow, prev = %u, delta_poc_s1 = %u\n" )
	.zero	7
.LC377:
	ASCII(.string	"%s, %d: unsigned integer convert to signed integer overflow\n" )
	.zero	3
.LC379:
	ASCII(.string	"elemental_duration_in_tc_minus1" )
.LC381:
	ASCII(.string	"cpb_cnt_minus1" )
	.zero	1
.LC383:
	ASCII(.string	"cpb_cnt_minus1(%d) out of range(0,31).\n" )
.LC385:
	ASCII(.string	"bit_rate_value_minus1" )
	.zero	2
.LC387:
	ASCII(.string	"cpb_size_value_minus1" )
	.zero	2
.LC389:
	ASCII(.string	"cpb_size_du_value_minus1" )
	.zero	7
.LC391:
	ASCII(.string	"bit_rate_du_value_minus1" )
	.zero	7
.LC393:
	ASCII(.string	"vps_base_layer_available_flag(%d) not equal 0x1.\n" )
	.zero	6
.LC395:
	ASCII(.string	"vps_max_layers_minus1 %d out of range[0,63].\n" )
	.zero	2
.LC397:
	ASCII(.string	"vps_max_sub_layers_minus1 %d out of range[0, %d].\n" )
	.zero	5
.LC399:
	ASCII(.string	"vps_reserved_0xffff_16bits not equal 0xffff.\n" )
	.zero	2
.LC401:
	ASCII(.string	"VPS HEVC_DecPTL error.\n" )
.LC403:
	ASCII(.string	"vps_num_layer_sets_minus1" )
	.zero	6
.LC405:
	ASCII(.string	"vps_max_dec_pic_buffering_minus1[i]" )
	.zero	4
.LC407:
	ASCII(.string	"vps_num_reorder_pics[i]" )
.LC409:
	ASCII(.string	"vps_max_latency_increase_plus1[i]" )
	.zero	6
.LC411:
	ASCII(.string	"vps_num_layer_sets_minus1(%d) out of range(0,%d).\n" )
	.zero	5
.LC413:
	ASCII(.string	"vps_num_ticks_poc_diff_one_minus1" )
	.zero	6
.LC415:
	ASCII(.string	"vps_num_hrd_parameters" )
	.zero	1
.LC417:
	ASCII(.string	"vps_num_hrd_parameters(%d) out of range[0,%d].\n" )
.LC419:
	ASCII(.string	"hrd_layer_set_idx" )
	.zero	6
.LC421:
	ASCII(.string	"VPS HEVC_DecHrdParam error.\n" )
	.zero	3
.LC423:
	ASCII(.string	"pVPS->vps_video_parameter_set_id out of range(0,15).\n" )
	.zero	2
.LC427:
	ASCII(.string	"VPS[%d] decode error0.\n" )
.LC429:
	ASCII(.string	"VPS[%d] decode error1.\n" )
.LC432:
	ASCII(.string	"VUI aspect_ratio_idc out of range[0, 255]\n" )
	.zero	5
.LC434:
	ASCII(.string	"chroma_sample_loc_type_top_field" )
	.zero	7
.LC436:
	ASCII(.string	"chroma_sample_loc_type_bottom_field" )
	.zero	4
.LC438:
	ASCII(.string	"def_disp_win_left_offset" )
	.zero	7
.LC440:
	ASCII(.string	"VUI pSps->chroma_format_idc out of range(0,3).\n" )
.LC442:
	ASCII(.string	"def_disp_win_right_offset" )
	.zero	6
.LC444:
	ASCII(.string	"def_disp_win_top_offset" )
.LC446:
	ASCII(.string	"def_disp_win_bottom_offset" )
	.zero	5
.LC449:
	ASCII(.string	"vui_num_ticks_poc_diff_one_minus1" )
	.zero	6
.LC451:
	ASCII(.string	"VUI HEVC_DecHrdParam error.\n" )
	.zero	3
.LC453:
	ASCII(.string	"min_spatial_segmentation_idc" )
	.zero	3
.LC455:
	ASCII(.string	"VUI min_spatial_segmentation_idc out of range(0,4095).\n" )
.LC457:
	ASCII(.string	"max_bytes_per_pic_denom" )
.LC459:
	ASCII(.string	"max_bits_per_min_cu_denom" )
	.zero	6
.LC461:
	ASCII(.string	"log2_max_mv_length_horizontal" )
	.zero	2
.LC463:
	ASCII(.string	"log2_max_mv_length_vertical" )
	.zero	4
.LC465:
	ASCII(.string	"sop_seq_parameter_set_id" )
	.zero	7
.LC467:
	ASCII(.string	"num_entries_in_sop_minus1" )
	.zero	6
.LC469:
	ASCII(.string	"num_entries_in_sop_minus1 out of range(0,1024)\n" )
.LC471:
	ASCII(.string	"sop_short_term_rps_idx" )
	.zero	1
.LC473:
	ASCII(.string	"sop_poc_delta" )
	.zero	2
.LC475:
	ASCII(.string	"recovery_poc_cnt" )
	.zero	7
.LC477:
	ASCII(.string	"colour_remap_id" )
.LC479:
	ASCII(.string	"colour_remap_coeffs" )
	.zero	4
.LC481:
	ASCII(.string	"ERROR: post_lut_num_val_minus1 %d out of range[0, 32]\n" )
	.zero	1
.LC484:
	ASCII(.string	"reserved_payload_extension_data" )
.LC486:
	ASCII(.string	"line:%d Cosume TotalPos(%d > %d)!!!\n" )
	.zero	3
.LC488:
	ASCII(.string	"HEVC_SeiMessage HEVC_Sei_Payload error.\n" )
	.zero	7
.LC490:
	ASCII(.string	"SEI pSEISPS = NULL.\n" )
	.zero	3
.LC492:
	ASCII(.string	"SEI HEVC_SeiMessage error.\n" )
	.zero	4
.LC494:
	ASCII(.string	"SEI BsIsByteAligned error.\n" )
	.zero	4
.LC496:
	ASCII(.string	"SEI rbsp_trailing_bits(%d) not equal 0x80.\n" )
	.zero	4
.LC498:
	ASCII(.string	"nesting_num_ops_minus1" )
	.zero	1
.LC500:
	ASCII(.string	"nesting_num_ops_minus1 out of range(0,%d)\n" )
	.zero	5
.LC502:
	ASCII(.string	"nesting_op_idx" )
	.zero	1
.LC504:
	ASCII(.string	"nesting_num_layers_minus1" )
	.zero	6
.LC506:
	ASCII(.string	"nesting_num_layers_minus1 out of range(0,63)\n" )
	.zero	2
.LC514:
	ASCII(.string	"scaling_list_pred_matrix_id_delta" )
	.zero	6
.LC516:
	ASCII(.string	"scaling_list_pred_matrix_id_delta out of range(0,matrixId).\n" )
	.zero	3
.LC518:
	ASCII(.string	"HEVC_DecScalingListData pMatrixAddress NULL.\n" )
	.zero	2
.LC520:
	ASCII(.string	"scaling_list_dc_coef_minus8" )
	.zero	4
.LC522:
	ASCII(.string	"scaling_list_dc_coef_minus8 out of range(-7,247).\n" )
	.zero	5
.LC524:
	ASCII(.string	"scaling_list_delta_coef" )
.LC526:
	ASCII(.string	"scaling_list_dc_coef_minus8 out of range(-128,127).\n" )
	.zero	3
.LC533:
	ASCII(.string	"chroma_format_idc" )
	.zero	6
.LC535:
	ASCII(.string	"pSPS->chroma_format_idc out of range(0,3).\n" )
	.zero	4
.LC537:
	ASCII(.string	"pSPS->chroma_format_idc not equal(%d) 1.\n" )
	.zero	6
.LC539:
	ASCII(.string	"pic_width_in_luma_samples" )
	.zero	6
.LC541:
	ASCII(.string	"pic_width_in_luma_samples out of range(0,%d).\n" )
	.zero	1
.LC544:
	ASCII(.string	"pic_height_in_luma_samples" )
	.zero	5
.LC546:
	ASCII(.string	"pic_height_in_luma_samples out of range(0,%d).\n" )
.LC548:
	ASCII(.string	"ERROR Unkown level: %d\n" )
.LC550:
	ASCII(.string	"conf_win_left_offset" )
	.zero	3
.LC553:
	ASCII(.string	"conf_win_right_offset" )
	.zero	2
.LC555:
	ASCII(.string	"conf_win_left_offset+conf_win_right_offset out of range.\n" )
	.zero	6
.LC557:
	ASCII(.string	"conf_win_top_offset" )
	.zero	4
.LC559:
	ASCII(.string	"conf_win_bottom_offset" )
	.zero	1
.LC561:
	ASCII(.string	"conf_win_top_offset+conf_win_bottom_offset out of range.\n" )
	.zero	6
.LC563:
	ASCII(.string	"bit_depth_luma_minus8" )
	.zero	2
.LC565:
	ASCII(.string	"bit_depth_luma(%d) out of range(8,10).\n" )
.LC567:
	ASCII(.string	"bit_depth_chroma_minus8" )
.LC569:
	ASCII(.string	"bit_depth_chroma(%d) out of range[8,14].\n" )
	.zero	6
.LC571:
	ASCII(.string	"log2_max_pic_order_cnt_lsb_minus4" )
	.zero	6
.LC573:
	ASCII(.string	"log2_max_pic_order_cnt_lsb_minus4 out of range[0,12].\n" )
	.zero	1
.LC575:
	ASCII(.string	"sps_max_dec_pic_buffering_minus1" )
	.zero	7
.LC577:
	ASCII(.string	"sps_num_reorder_pics" )
	.zero	3
.LC579:
	ASCII(.string	"sps_max_latency_increase_plus1" )
	.zero	1
.LC581:
	ASCII(.string	"log2_min_coding_block_size_minus3" )
	.zero	6
.LC583:
	ASCII(.string	"log2_min_luma_coding_block_size_minus3 out of range(0,3).\n" )
	.zero	5
.LC585:
	ASCII(.string	"log2_diff_max_min_coding_block_size" )
	.zero	4
.LC587:
	ASCII(.string	"log2_diff_max_min_luma_coding_block_size out of range(0,3).\n" )
	.zero	3
.LC589:
	ASCII(.string	"log2_ctb_sizeY out of range(4,6).\n" )
	.zero	5
.LC591:
	ASCII(.string	"log2_min_transform_block_size_minus2" )
	.zero	3
.LC593:
	ASCII(.string	"log2_min_transform_block_size_minus2 out of range(0,3).\n" )
	.zero	7
.LC595:
	ASCII(.string	"log2_diff_max_min_transform_block_size" )
	.zero	1
.LC597:
	ASCII(.string	"log2_diff_max_min_transform_block_size out of range(0,3).\n" )
	.zero	5
.LC599:
	ASCII(.string	"quadtree_tu_log2_min_size not less than log2_min_cb_sizeY.\n" )
	.zero	4
.LC601:
	ASCII(.string	"quadtree_tu_log2_max_size greater than Min( CtbLog2SizeY, 5 ).\n" )
.LC603:
	ASCII(.string	"max_transform_hierarchy_depth_inter" )
	.zero	4
.LC605:
	ASCII(.string	"max_transform_hierarchy_depth_inter out of range(0,CtbLog2SizeY-Log2MinTrafoSize).\n" )
	.zero	4
.LC607:
	ASCII(.string	"max_transform_hierarchy_depth_intra" )
	.zero	4
.LC609:
	ASCII(.string	"max_transform_hierarchy_depth_intra out of range(0,CtbLog2SizeY-Log2MinTrafoSize).\n" )
	.zero	4
.LC611:
	ASCII(.string	"SPS HEVC_DecScalingListData error.\n" )
	.zero	4
.LC613:
	ASCII(.string	"SPS sao is off and pic height(%d) is too small.(Logic Unsupported).\n" )
	.zero	3
.LC615:
	ASCII(.string	"log2_min_pcm_luma_coding_block_size_minus3" )
	.zero	5
.LC617:
	ASCII(.string	"log2_min_pcm_coding_block_size_minus3(%d) out of range[0,2].\n" )
	.zero	2
.LC619:
	ASCII(.string	"log2_diff_max_min_pcm_luma_coding_block_size" )
	.zero	3
.LC621:
	ASCII(.string	"log2_diff_max_min_pcm_coding_block_size(%d) out of range[0,2].\n" )
.LC623:
	ASCII(.string	"pcm_log2_max_size greater than Min( CtbLog2SizeY, 5 ).\n" )
.LC625:
	ASCII(.string	"num_short_term_ref_pic_sets" )
	.zero	4
.LC627:
	ASCII(.string	"num_short_term_ref_pic_sets out of range[0,%d].\n" )
	.zero	7
.LC629:
	ASCII(.string	"SPS HEVC_DecShortTermRefPicSet error.\n" )
	.zero	1
.LC631:
	ASCII(.string	"num_long_term_ref_pic_sps" )
	.zero	6
.LC633:
	ASCII(.string	"num_long_term_ref_pic_sps out of range[0,32].\n" )
	.zero	1
.LC635:
	ASCII(.string	"SPS HEVC_DecVuiParam error.\n" )
	.zero	3
.LC640:
	ASCII(.string	"sps_video_parameter_set_id out of range(0,%d).\n" )
.LC642:
	ASCII(.string	"sps_max_sub_layers_minus1 out of range(0,%d).\n" )
	.zero	1
.LC644:
	ASCII(.string	"SPS HEVC_DecPTL error.\n" )
.LC646:
	ASCII(.string	"sps_seq_parameter_set_id" )
	.zero	7
.LC648:
	ASCII(.string	"sps_seq_parameter_set_id out of range(0,%d).\n" )
	.zero	2
.LC652:
	ASCII(.string	"SPS[%d] decode error0.\n" )
.LC654:
	ASCII(.string	"SPS[%d] decode error.\n" )
	.zero	1
.LC657:
	ASCII(.string	"pps_seq_parameter_set_id" )
	.zero	7
.LC659:
	ASCII(.string	"pic_parameter_set_id(%d) out of range[0,15].\n" )
	.zero	2
.LC661:
	ASCII(.string	"SPS(%d) haven't decode.\n" )
	.zero	7
.LC663:
	ASCII(.string	"num_ref_idx_l0_default_active_minus1" )
	.zero	3
.LC665:
	ASCII(.string	"num_ref_idx_l0_default_active out of range[0,15].\n" )
	.zero	5
.LC667:
	ASCII(.string	"num_ref_idx_l1_default_active_minus1" )
	.zero	3
.LC669:
	ASCII(.string	"num_ref_idx_l1_default_active out of range[0,15].\n" )
	.zero	5
.LC671:
	ASCII(.string	"init_qp_minus26" )
.LC674:
	ASCII(.string	"function %s\t line %d\t HEVC_se_v error\n" )
	.zero	1
.LC676:
	ASCII(.string	"pic_init_qp(%d) out of range[-%d,51].\n" )
	.zero	1
.LC678:
	ASCII(.string	"diff_cu_qp_delta_depth" )
	.zero	1
.LC680:
	ASCII(.string	"diff_cu_qp_delta_depth out of range[0,3].\n" )
	.zero	5
.LC682:
	ASCII(.string	"pps_cb_qp_offset" )
	.zero	7
.LC684:
	ASCII(.string	"pic_cb_qp_offset out of range[-12,12].\n" )
.LC686:
	ASCII(.string	"pps_cr_qp_offset" )
	.zero	7
.LC688:
	ASCII(.string	"pic_cr_qp_offset out of range[-12,12].\n" )
.LC690:
	ASCII(.string	"num_tile_columns_minus1" )
.LC692:
	ASCII(.string	"num_tile_columns_minus1(%d) out of range(0, %d).\n" )
	.zero	6
.LC694:
	ASCII(.string	"num_tile_rows_minus1" )
	.zero	3
.LC696:
	ASCII(.string	"num_tile_rows_minus1 out(%d) of range(0, %d).\n" )
	.zero	1
.LC698:
	ASCII(.string	"Logic limit(%d), num_tile_columns(%d) exceed.\n" )
	.zero	1
.LC701:
	ASCII(.string	"Logic limit(%d), num_tile_rows(%d) exceed.\n" )
	.zero	4
.LC703:
	ASCII(.string	"column_width_minus1" )
	.zero	4
.LC706:
	ASCII(.string	"column_width[%d](%d) out of range (0 %d)\n" )
	.zero	6
.LC708:
	ASCII(.string	"row_height_minus1" )
	.zero	6
.LC710:
	ASCII(.string	"row_height[%d](%d) out of range (0 %d)\n" )
.LC712:
	ASCII(.string	"column_bd[%d](%d) <= 0, invalid!\n" )
	.zero	6
.LC714:
	ASCII(.string	"row_bd[%d](%d) <= 0, invalid!\n" )
	.zero	1
.LC716:
	ASCII(.string	"PPS tile width(%d) is too small.(Logic Unsupport)\n" )
	.zero	5
.LC718:
	ASCII(.string	"PPS tile height(%d) is too small.(Logic Unsupport)\n" )
	.zero	4
.LC720:
	ASCII(.string	"pps_beta_offset_div2" )
	.zero	3
.LC722:
	ASCII(.string	"pps_beta_offset_div2(%d) out of range(-6,6).\n" )
	.zero	2
.LC724:
	ASCII(.string	"pps_tc_offset_div2" )
	.zero	5
.LC726:
	ASCII(.string	"pps_tc_offset_div2(%d) out of range(-6,6).\n" )
	.zero	4
.LC728:
	ASCII(.string	"PPS HEVC_DecScalingListData error.\n" )
	.zero	4
.LC730:
	ASCII(.string	"log2_parallel_merge_level_minus2" )
	.zero	7
.LC732:
	ASCII(.string	"log2_parallel_merge_level(%d) out of range(2,log2_ctb_sizeY).\n" )
	.zero	1
.LC734:
	ASCII(.string	"pps_pic_parameter_set_id" )
	.zero	7
.LC736:
	ASCII(.string	"pic_parameter_set_id(%d) out of range(0,%d).\n" )
	.zero	2
.LC740:
	ASCII(.string	"PPS[%d] decode error.\n" )
	.zero	1
.LC743:
	ASCII(.string	"luma_log2_weight_denom" )
	.zero	1
.LC745:
	ASCII(.string	"luma_log2_weight_denom out of range(0,7).\n" )
	.zero	5
.LC747:
	ASCII(.string	"delta_chroma_log2_weight_denom" )
	.zero	1
.LC749:
	ASCII(.string	"delta_chroma_log2_weight_denom out of range(-7,7).\n" )
	.zero	4
.LC751:
	ASCII(.string	"chroma_log2_weight_denom out of range(0,7).\n" )
	.zero	3
.LC753:
	ASCII(.string	"delta_luma_weight_l0" )
	.zero	3
.LC755:
	ASCII(.string	"delta_luma_weight_l0(%d) out of range(-128,127).\n" )
	.zero	6
.LC757:
	ASCII(.string	"luma_offset_l0" )
	.zero	1
.LC759:
	ASCII(.string	"luma_offset_l0(%d) out of range(-128,127).\n" )
	.zero	4
.LC761:
	ASCII(.string	"delta_chroma_weight_l0" )
	.zero	1
.LC763:
	ASCII(.string	"delta_chroma_weight_l0 out of range(-128,127).\n" )
.LC765:
	ASCII(.string	"delta_chroma_offset_l0" )
	.zero	1
.LC767:
	ASCII(.string	"delta_chroma_offset_l0 out of range(-512,511).\n" )
.LC769:
	ASCII(.string	"delta_luma_weight_l1" )
	.zero	3
.LC771:
	ASCII(.string	"delta_luma_weight_l1 out of range(-128,127).\n" )
	.zero	2
.LC773:
	ASCII(.string	"luma_offset_l1" )
	.zero	1
.LC775:
	ASCII(.string	"luma_offset_l1 out of range(-128,127).\n" )
.LC777:
	ASCII(.string	"delta_chroma_weight_l1" )
	.zero	1
.LC779:
	ASCII(.string	"delta_chroma_weight_l1 out of range(-128,127).\n" )
.LC781:
	ASCII(.string	"delta_chroma_offset_l1" )
	.zero	1
.LC783:
	ASCII(.string	"delta_chroma_offset_l1 out of range(-512,511).\n" )
.LC785:
	ASCII(.string	"slice_pic_parameter_set_id" )
	.zero	5
.LC788:
	ASCII(.string	"%s: pic_parameter_set_id(%d) out of range(0 %d)!\n" )
	.zero	6
.LC790:
	ASCII(.string	"HEVC_VpsSpsPpsCheck != HEVC_DEC_NORMAL\n" )
.LC792:
	ASCII(.string	"max_cu_width(%d)/max_cu_height(%d) = 0\n" )
.LC794:
	ASCII(.string	"slice_segment_address(%d) out of range(0,%d).\n" )
	.zero	1
.LC796:
	ASCII(.string	"slice_type" )
	.zero	5
.LC798:
	ASCII(.string	"slice_type(%d) out of range(0,2].\n" )
	.zero	5
.LC800:
	ASCII(.string	"WARNING: LastDisplayPoc:%d poc:%d \n" )
	.zero	4
.LC802:
	ASCII(.string	"SH HEVC_DecShortTermRefPicSet error.\n" )
	.zero	2
.LC804:
	ASCII(.string	"short_term_ref_pic_set_idx(%d) out of range[0,%d].\n" )
	.zero	4
.LC806:
	ASCII(.string	"num_long_term_sps" )
	.zero	6
.LC808:
	ASCII(.string	"num_long_term_sps(%d) out of range[0,%d].\n" )
	.zero	5
.LC810:
	ASCII(.string	"num_long_term_pics" )
	.zero	5
.LC812:
	ASCII(.string	"SH ERROR: (num_negative_pics(%d) + num_positive_pics(%d) + num_of_longterm_pics(%d)) > %d\n" )
	.zero	5
.LC814:
	ASCII(.string	"lt_idx_sps[%d] = %d, but out of range[0,%d].\n" )
	.zero	2
.LC816:
	ASCII(.string	"delta_poc_msb_cycle_lt" )
	.zero	1
.LC818:
	ASCII(.string	"ERROR: pRPS->num_of_pics(%d) > %d.\n" )
	.zero	4
.LC820:
	ASCII(.string	"num_ref_idx_l0_active_minus1" )
	.zero	3
.LC822:
	ASCII(.string	"num_ref_idx_l0_active(%d) out of range(0,%d).\n" )
	.zero	1
.LC824:
	ASCII(.string	"num_ref_idx_l1_active_minus1" )
	.zero	3
.LC826:
	ASCII(.string	"num_ref_idx_l1_active(%d) out of range(0,%d).\n" )
	.zero	1
.LC828:
	ASCII(.string	"pRPS is null.\n" )
	.zero	1
.LC830:
	ASCII(.string	"pRPS->num_of_pics out(%d) of range(0,%d).\n" )
	.zero	5
.LC832:
	ASCII(.string	"SH HEVC_DecRefPicListsModification error.\n" )
	.zero	5
.LC834:
	ASCII(.string	"collocated_ref_idx" )
	.zero	5
.LC836:
	ASCII(.string	"collocated_from_l0_flag=%d, collocated_ref_idx(%d) out of range(0,%d).\n" )
.LC838:
	ASCII(.string	"SH HEVC_DecPredWeightTable error.\n" )
	.zero	5
.LC840:
	ASCII(.string	"five_minus_max_num_merge_cand" )
	.zero	2
.LC842:
	ASCII(.string	"SH max_num_merge_cand(%d) out of range(1,5).\n" )
	.zero	2
.LC844:
	ASCII(.string	"slice_qp_delta" )
	.zero	1
.LC846:
	ASCII(.string	"SH slice_qp(%d) out of range [-%d,51].\n" )
.LC848:
	ASCII(.string	"slice_cb_qp_offset" )
	.zero	5
.LC850:
	ASCII(.string	"SH slice_cb_qp_offset(%d) out of range[-12,12].\n" )
	.zero	7
.LC852:
	ASCII(.string	"SH slice_cb_qp_offset(%d)+pic_cb_qp_offset(%d) out of range[-12,12].\n" )
	.zero	2
.LC854:
	ASCII(.string	"slice_cr_qp_offset" )
	.zero	5
.LC856:
	ASCII(.string	"SH slice_cr_qp_offset(%d) out of range[-12,12].\n" )
	.zero	7
.LC858:
	ASCII(.string	"SH slice_cr_qp_offset+pPPS->pic_cr_qp_offset(%d) out of range[-12,12].\n" )
.LC860:
	ASCII(.string	"slice_beta_offset_div2" )
	.zero	1
.LC862:
	ASCII(.string	"SH slice_beta_offset_div2(%d) out of range(-6,6).\n" )
	.zero	5
.LC864:
	ASCII(.string	"slice_tc_offset_div2" )
	.zero	3
.LC866:
	ASCII(.string	"SH slice_tc_offset_div2(%d) out of range(-6,6).\n" )
	.zero	7
.LC868:
	ASCII(.string	"num_entry_point_offsets" )
.LC870:
	ASCII(.string	"CurrSlice.num_entry_point_offsets(%d) out of range[0,%d].\n" )
	.zero	5
.LC872:
	ASCII(.string	"offset_len_minus1" )
	.zero	6
.LC874:
	ASCII(.string	"CurrSlice.offset_len(%d) out of range[1,32].\n" )
	.zero	2
.LC876:
	ASCII(.string	"slice_segment_header_extension_length" )
	.zero	2
.LC878:
	ASCII(.string	"slice_segment_header_extension_length(%d) out of range [0,256]\n" )
.LC880:
	ASCII(.string	"bitsLeft(%d) < slice_segment_header_extension_length(%d)\n" )
	.zero	6
.LC885:
	ASCII(.string	"%s arrange mem failed.\n" )
.LC887:
	ASCII(.string	"Init dec para\n" )
	.zero	1
.LC891:
	ASCII(.string	"HEVC_InitDPB error, return %d\n" )
	.zero	1
.LC893:
	ASCII(.string	"HEVC_AllocFrameStore error\n" )
	.zero	4
.LC896:
	ASCII(.string	"%s: HEVC_OutputFrame failed!\n" )
	.zero	2
.LC899:
	ASCII(.string	"%s output current picture failed\n" )
	.zero	6
.LC903:
	ASCII(.string	"HEVC.c line %d: frame para err(ret=%d), recycle image self\n" )
	.zero	4
.LC907:
	ASCII(.string	"%s call HEVC_GetUnRefPicWithMinPoc failed\n" )
	.zero	5
.LC909:
	ASCII(.string	"%s call HEVC_OutputOneFrmFromDPB failed\n" )
	.zero	7
.LC912:
	ASCII(.string	"%s flush dpb in poc order failed.\n" )
	.zero	5
.LC915:
	ASCII(.string	"%s: flush dpb failed, return %d\n" )
	.zero	7
.LC918:
	ASCII(.string	"%s: DPB.used_size(%d) >= DPB.size(%d), need to increase DPB size.\n" )
	.zero	5
.LC920:
	ASCII(.string	"%s call HEVC_IncreaseDPBSize failed\n" )
	.zero	3
.LC922:
	ASCII(.string	"%s: DPB.used_size(%d) >= DPB.size(%d), output minpoc frame.\n" )
	.zero	3
.LC927:
	ASCII(.string	"%s with invalid pos(%d)\n" )
	.zero	7
.LC930:
	ASCII(.string	"%s get APC error, ret %d\n" )
	.zero	6
.LC933:
	ASCII(.string	"%s %d: InsertFrmInDPB failed, return %d\n" )
	.zero	7
.LC935:
	ASCII(.string	"%s call HEVC_CheckFrameStore failed!\n" )
	.zero	2
.LC939:
	ASCII(.string	"%s call HEVC_RemoveUnUsedFrameStore Failed.\n" )
	.zero	3
.LC941:
	ASCII(.string	"%s call HEVC_InsertFrmInDPB Failed.\n" )
	.zero	3
.LC946:
	ASCII(.string	"No frame store for lost pic.\n" )
	.zero	2
.LC948:
	ASCII(.string	"DPB ERROR: Can not get ref_fs!\n" )
.LC950:
	ASCII(.string	"DPB no suited fs for lost pic.\n" )
.LC952:
	ASCII(.string	"Take poc(%d) to creat lost poc(%d).\n" )
	.zero	3
.LC954:
	ASCII(.string	"DPB ERROR: Ref DecodeFs = NULL, ClearDPB!\n" )
	.zero	5
.LC956:
	ASCII(.string	"DPB ERROR: PMV = NULL, ClearDPB!\n" )
	.zero	6
.LC958:
	ASCII(.string	"ERROR: Can not new logic fs!\n" )
	.zero	2
.LC960:
	ASCII(.string	"Lost pic insert in DPB Failed!\n" )
.LC962:
	ASCII(.string	"Ref frame(poc %d) lost.\n" )
	.zero	7
.LC964:
	ASCII(.string	"s32OutErrThr = %d,drop poc %d because lost ref frame(pod %d)\n" )
	.zero	2
.LC967:
	ASCII(.string	"%s call HEVC_FirstFrameFastOut Failed\n" )
	.zero	1
.LC969:
	ASCII(.string	"DPB.used_size may bigger than DPB.size\n" )
.LC971:
	ASCII(.string	"HEVC_InsertFrmInDPB Failed, ret = %d\n" )
	.zero	2
.LC973:
	ASCII(.string	"%s call HEVC_OutputFrmFromDPB failed\n" )
	.zero	2
.LC975:
	ASCII(.string	"cann't find slot for current nal\n" )
	.zero	6
.LC977:
	ASCII(.string	"receive a zero packet\n" )
	.zero	1
.LC979:
	ASCII(.string	"nal_release_err\n" )
	.zero	7
.LC981:
	ASCII(.string	"pHevcCtx->CurrPic.frame_store is null pointer\n" )
	.zero	1
.LC983:
	ASCII(.string	"HEVC_StorePicInDpb return(%d) from L%d\n" )
.LC987:
	ASCII(.string	"%s CurrPic.state = HEVC_PIC_EMPTY, return HEVC_DEC_NORMAL\n" )
	.zero	5
.LC989:
	ASCII(.string	"%s, REPORT_IFRAME_ERR\n" )
	.zero	1
.LC992:
	ASCII(.string	"Discard cur pic, ErrLevel(%d) > OutErrThr(%d)\n" )
	.zero	1
.LC994:
	ASCII(.string	"%s call HEVC_DirectOutput Failed\n" )
	.zero	6
.LC996:
	ASCII(.string	"%s call HEVC_IModeProcess Failed\n" )
	.zero	6
.LC998:
	ASCII(.string	"%s call HEVC_SimpleDPBProcess Failed\n" )
	.zero	2
.LC1000:
	ASCII(.string	"%s call HEVC_DecOrderProcess Failed\n" )
	.zero	3
.LC1002:
	ASCII(.string	"%s call HEVC_DispOrderProcess Failed\n" )
	.zero	2
.LC1004:
	ASCII(.string	"%s return HEVC_DEC_ERR\n" )
.LC1007:
	ASCII(.string	"HEVC_DecVDM MaxBytesReceived exceed threshold!\n" )
.LC1009:
	ASCII(.string	"HEVC_DecVDM no slice and needn't start VDM\n" )
	.zero	4
.LC1011:
	ASCII(.string	"IPBDecMode Changed (%d -> %d)\n" )
	.zero	1
.LC1014:
	ASCII(.string	"VDM start, TotalPicNum=%d.\n" )
	.zero	4
.LC1017:
	ASCII(.string	"%s no correct slice in the pic\n" )
.LC1020:
	ASCII(.string	"Discard this B(poc=%d) before P, is_ref_idc=%d.\n" )
	.zero	7
.LC1023:
	ASCII(.string	"metadatasize is too large:%d at line:%d\n" )
	.zero	7
.LC1026:
	ASCII(.string	"%s:%d Metadata map failed\n" )
	.zero	5
.LC1028:
	ASCII(.string	"%s:%d Metadata is NULL\n" )
.LC1032:
	ASCII(.string	"%s:%d Metadata unmap failed\n" )
	.zero	3
.LC1034:
	ASCII(.string	"*****[%s][%d],BL Codec can only dec BL stream!!*****\n" )
	.zero	2
.LC1036:
	ASCII(.string	"*****[%s][%d],EL Codec can only dec EL stream in DV_DUAL_VES_IMP stream!!*****\n" )
.LC1038:
	ASCII(.string	"***** VES Splitter: UNSUPPORT, HDR_capacity=%d*****\n" )
	.zero	3
.LC1042:
	ASCII(.string	"%s call HEVC_FlushOutputFrmFromDPB failed\n" )
	.zero	5
.LC1044:
	ASCII(.string	"%s call HEVC_EmptyFrmFromDPB failed\n" )
	.zero	3
.LC1046:
	ASCII(.string	"Meet CRA frame, force output remain frame, CurPoc %d, LastPoc %d\n" )
	.zero	6
.LC1048:
	ASCII(.string	"Init pic err, exit\n" )
	.zero	4
.LC1050:
	ASCII(.string	"HEVC_WritePicMsg failed!\n" )
	.zero	6
.LC1052:
	ASCII(.string	"Start Reason: SliceParaNum= %d\n" )
.LC1055:
	ASCII(.string	"Too many slice , err!\n" )
	.zero	1
.LC1057:
	ASCII(.string	"Cur pic not init yet, discard this slice!\n" )
	.zero	5
.LC1059:
	ASCII(.string	"Dec List error, ret=%d\n" )
.LC1061:
	ASCII(.string	"Ref List is Wrong!\n" )
	.zero	4
.LC1063:
	ASCII(.string	"HEVC_WriteSliceMsg err.\n" )
	.zero	7
.LC1066:
	ASCII(.string	"VPS decode error.\n" )
	.zero	5
.LC1069:
	ASCII(.string	"SPS decode error.\n" )
	.zero	5
.LC1071:
	ASCII(.string	"PPS decode error.\n" )
	.zero	5
.LC1073:
	ASCII(.string	"SEI decode error.\n" )
	.zero	5
.LC1075:
	ASCII(.string	"***** NAL: UNSUPPORT, nal_unit_type=%d\n" )
.LC1078:
	ASCII(.string	"HEVC_DecSliceSegmentHeader dec err\n" )
	.zero	4
.LC1081:
	ASCII(.string	"CurBitsLen = %d, MinBitsLen = %d\n" )
	.zero	6
.LC1084:
	ASCII(.string	"%s last frame fs unrelease, fix it!\n" )
	.zero	3
.LC1091:
	ASCII(.string	"CtbNumOneFrame = %d, SedEnd0 = %d\n" )
	.zero	5
.LC1096:
	ASCII(.string	"%s: Get context addr failed!\n" )
	.zero	2
.LC1098:
	ASCII(.string	"%s FATAL: MemOffset %d > ContextMemSize %d.\n" )
	.zero	3
.LC1100:
	ASCII(.string	"%s: VCTRL_GetChanIDByCtx() return -1!\n" )
	.zero	1
.LC1102:
	ASCII(.string	"Fs leak, clear dpb fs not in vo queue.\n" )
.LC1104:
	ASCII(.string	"HEVCDEC_DecodePacket NULL == pPacket!\n" )
	.zero	1
.LC1106:
	ASCII(.string	"HevcCtx not init!\n" )
	.zero	5
.LC1108:
	ASCII(.string	"HEVCDEC_DecodePacket NULL == pHevcCtx->pCurrNal!\n" )
	.zero	6
.LC1111:
	ASCII(.string	"nal_layer_id out %d of range[0,1].\n" )
	.zero	4
.LC1119:
	ASCII(.string	"IsSizeChanged = %d, report fake frame w/h = %d/%d\n" )
	.zero	5
.LC1122:
	ASCII(.string	"HEVC_InquireSliceProperty error.\n" )
	.zero	6
.LC1124:
	ASCII(.string	"HEVC_DecOneNal ERR\n" )
	.zero	4
.LC1127:
	ASCII(.string	"VDMHAL_NULL_FUN_PRINT,L%d\n" )
	.zero	5
.LC1129:
	ASCII(.string	"VDMDRV_GetUvMOSParam failed\n" )
	.zero	3
.LC1132:
	ASCII(.string	"HEVC_StorePicInDPB failed, ret = %d\n" )
	.bss
	.align	3
.LANCHOR1 = . + 0
.LANCHOR2 = . + 261120
.LANCHOR5 = . + 326400
	.type	g_TsToRsMap, %object
	.size	g_TsToRsMap, 262144
g_TsToRsMap:
	.zero	262144
	.type	g_IsDeced, %object
	.size	g_IsDeced, 65536
g_IsDeced:
	.zero	65536
	.type	s_TmpParam, %object
	.size	s_TmpParam, 12644
s_TmpParam:
	.zero	12644
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
