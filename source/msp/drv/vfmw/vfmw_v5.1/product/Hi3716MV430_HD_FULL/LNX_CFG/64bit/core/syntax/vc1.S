#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vc1.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	VC1_Vfmw_GenerateIntensityMap, %function
VC1_Vfmw_GenerateIntensityMap:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w2
	mov	w21, w1
	uxtb	w22, w3
	bl	_mcount
	cmp	w20, 32
	sub	w0, w20, #64
	csel	w20, w0, w20, ge
	cbnz	w21, .L3
	lsl	w2, w20, 25
	mov	w4, -64
	sub	w2, w2, w20
	lsl	w2, w2, 7
	add	w2, w2, 12288
	add	w2, w2, 4032
.L4:
	cbnz	w22, .L5
	mov	x0, x19
	add	w2, w2, 32
	add	x5, x19, 256
	mov	w3, 255
	.p2align 2
.L6:
	asr	w1, w2, 6
	add	w2, w2, w4
	cmp	w1, wzr
	csel	w1, w1, wzr, ge
	cmp	w1, 255
	csel	w1, w1, w3, le
	strb	w1, [x0], 1
	cmp	x5, x0
	bne	.L6
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L5:
	lsl	w2, w4, 25
	mov	x0, x19
	sub	w2, w2, w4
	add	x5, x19, 256
	lsl	w2, w2, 7
	mov	w3, 255
	add	w2, w2, 8192
	add	w2, w2, 32
	.p2align 2
.L7:
	asr	w1, w2, 6
	add	w2, w2, w4
	cmp	w1, wzr
	csel	w1, w1, wzr, ge
	cmp	w1, 255
	csel	w1, w1, w3, le
	strb	w1, [x0], 1
	cmp	x5, x0
	bne	.L7
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3:
	add	w4, w21, 32
	lsl	w2, w20, 6
	b	.L4
	.size	VC1_Vfmw_GenerateIntensityMap, .-VC1_Vfmw_GenerateIntensityMap
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VC1_Vfmw_UpdataLastPicRNDCTRL.part.3, %function
VC1_Vfmw_UpdataLastPicRNDCTRL.part.3:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 24576
	ldrb	w0, [x1, 603]
	and	w2, w0, -5
	cbz	w2, .L15
	cmp	w0, 1
	ldrsb	w0, [x19, 11]
	uxtb	w2, w0
	beq	.L16
	strb	w0, [x19, 11]
	strb	w2, [x1, 622]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L15:
	mov	w2, 1
	mov	w0, w2
	strb	w0, [x19, 11]
	strb	w2, [x1, 622]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L16:
	cmp	w0, wzr
	cset	w0, eq
	mov	w2, w0
	sxtb	w0, w0
	strb	w0, [x19, 11]
	strb	w2, [x1, 622]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1_Vfmw_UpdataLastPicRNDCTRL.part.3, .-VC1_Vfmw_UpdataLastPicRNDCTRL.part.3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	emp_print
	.type	emp_print, %function
emp_print:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	mov	x0, x30
	stp	x2, x3, [x29, 16]
	stp	x4, x5, [x29, 32]
	stp	x6, x7, [x29, 48]
	bl	_mcount
	mov	w0, 0
	ldp	x29, x30, [sp], 64
	ret
	.size	emp_print, .-emp_print
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1DEC_Init
	.type	VC1DEC_Init, %function
VC1DEC_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	add	x20, x19, 53248
	bl	_mcount
	ldr	x3, .LC12
	mov	x2, 53448
	mov	w1, 0
	mov	x0, x19
	ldr	w22, [x20, 184]
	ldr	x3, [x3, 96]
	blr	x3
	str	w22, [x20, 184]
	add	x0, x19, 49152
	add	x0, x0, 3680
	bl	ResetVoQueue
	ldr	w1, [x21, 20]
	add	x2, x19, 16384
	add	x4, x19, 12288
	mov	w5, 1
	add	w1, w1, 1023
	mov	x0, x19
	and	w1, w1, -1024
	str	w1, [x2, 1544]
	add	w3, w1, 4096
	str	w3, [x2, 1552]
	add	w3, w3, 2048
	add	w6, w1, 2048
	str	w3, [x2, 1556]
	add	w3, w1, 8192
	str	w6, [x2, 1548]
	add	w1, w1, 12288
	str	w3, [x2, 1560]
	add	w6, w3, 2048
	str	w1, [x2, 1568]
	str	w6, [x2, 1564]
	str	x21, [x19]
	strb	w5, [x4, 2442]
	strb	w5, [x4, 2443]
	str	wzr, [x2, 1504]
	str	wzr, [x2, 1508]
	ldr	w1, [x21, 8]
	str	w1, [x2, 1572]
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x20, 192]
	beq	.L21
	mov	w0, 1
.L19:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L21:
	ldr	x3, .LC13
	mov	w1, 121
	ldr	x2, .LC15
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -20
	b	.L19
	.size	VC1DEC_Init, .-VC1DEC_Init
	.align	3
.LC12:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC13:
	.xword	.LANCHOR0
	.align	3
.LC15:
	.xword	.LC14
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Vc1SMPSeqHdr
	.type	Vc1SMPSeqHdr, %function
Vc1SMPSeqHdr:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x2
	mov	w21, w1
	bl	_mcount
	lsl	w2, w21, 3
	mov	x1, x20
	add	x0, x29, 56
	bl	BsInit
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	mov	w20, w0
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	add	w20, w20, w0, lsl 8
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	add	w20, w20, w0, lsl 16
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	add	w0, w20, w0, lsl 24
	mov	w1, 8
	str	w0, [x19, 8]
	add	x0, x29, 56
	bl	BsGet
	mov	w20, w0
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	add	w20, w20, w0, lsl 8
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	add	w20, w20, w0, lsl 16
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	add	w0, w20, w0, lsl 24
	mov	w1, 2
	str	w0, [x19, 12]
	add	x0, x29, 56
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 16]
	bhi	.L32
	mov	w1, 2
	add	x0, x29, 56
	bl	BsGet
	cbnz	w0, .L33
	mov	w1, 3
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 17]
	mov	w1, 5
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 18]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 19]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	cbnz	w0, .L34
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 20]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 21]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 22]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 23]
	mov	w1, 2
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 24]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 25]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	mov	w20, w0
	cbnz	w0, .L35
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 26]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 27]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 28]
	ldrb	w1, [x19, 16]
	cbnz	w1, .L28
	strb	wzr, [x19, 28]
.L28:
	mov	w1, 3
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 29]
	mov	w1, 2
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 30]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 31]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	mov	w1, 32
	add	x0, x29, 56
	bl	BsGet
	cbnz	w0, .L36
.L24:
	mov	w0, w20
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L36:
	ldr	x2, .LC22
	mov	w1, 193
	mov	w0, 0
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L32:
	ldr	x3, .LC18
	mov	w1, 148
	ldr	x4, .LC17
	mov	w0, 0
	ldr	x2, .LC20
	add	x3, x3, 16
	mov	w20, -1
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L33:
	ldr	x3, .LC18
	mov	w1, 151
	ldr	x4, .LC17
	mov	w0, 0
	ldr	x2, .LC20
	add	x3, x3, 16
	mov	w20, -1
	bl	dprint_normal
	b	.L24
	.p2align 3
.L34:
	ldr	x3, .LC18
	mov	w1, 158
	ldr	x4, .LC17
	mov	w0, 0
	ldr	x2, .LC20
	add	x3, x3, 16
	mov	w20, -1
	bl	dprint_normal
	b	.L24
	.p2align 3
.L35:
	ldr	x3, .LC18
	mov	w1, 169
	ldr	x4, .LC17
	mov	w0, 0
	ldr	x2, .LC20
	add	x3, x3, 16
	mov	w20, -1
	bl	dprint_normal
	b	.L24
	.size	Vc1SMPSeqHdr, .-Vc1SMPSeqHdr
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC18:
	.xword	.LANCHOR0
	.align	3
.LC20:
	.xword	.LC19
	.align	3
.LC22:
	.xword	.LC21
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_SetImgFormat
	.type	VC1_SetImgFormat, %function
VC1_SetImgFormat:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x19, x21, 12288
	bl	_mcount
	add	x0, x21, 53248
	ldr	w1, [x19, 5576]
	ldr	w0, [x0, 192]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L37
	ldrsb	w0, [x19, 2435]
	cmp	w0, 3
	beq	.L48
	ldrb	w0, [x20, 157]
	mov	w1, 1
	orr	w0, w0, 12
	bfi	w0, w1, 4, 2
	strb	w0, [x20, 157]
.L41:
	ldr	w0, [x19, 5552]
	add	x21, x19, 2432
	str	w0, [x20, 32]
	mov	w1, 0
	mov	x0, x20
	ldr	w2, [x19, 5556]
	str	w2, [x20, 36]
	ldr	w2, [x19, 5552]
	str	w2, [x20, 40]
	lsr	w3, w2, 1
	ldr	w2, [x19, 5556]
	stp	w2, w3, [x20, 44]
	lsr	w2, w2, 1
	str	w2, [x20, 52]
	bl	SetAspectRatio
	ldrb	w0, [x21, 2]
	add	x21, x21, 36864
	cbz	w0, .L42
	ldr	w0, [x21, 1192]
.L43:
	add	x19, x19, 2432
	str	w0, [x20, 528]
	add	x19, x19, 36864
	ldr	w0, [x19, 1196]
	str	w0, [x20, 532]
	str	wzr, [x19, 1200]
	str	wzr, [x19, 1204]
.L37:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L42:
	ldr	w0, [x21, 1200]
	ldr	w1, [x21, 1204]
	str	w0, [x21, 1192]
	str	w1, [x21, 1196]
	b	.L43
	.p2align 3
.L48:
	ldrb	w1, [x20, 157]
	mov	w4, 0
	ldrb	w3, [x21, 24]
	ubfx	x2, x1, 2, 2
	mov	x0, x1
	add	w1, w3, 1
	mov	w3, 1
	orr	w1, w1, w2
	and	w2, w1, 3
	cmp	w1, 3
	csel	w1, w2, w4, ls
	bfi	w0, w1, 2, 2
	bfi	w0, w3, 0, 2
	bfi	w0, w3, 4, 2
	strb	w0, [x20, 157]
	b	.L41
	.size	VC1_SetImgFormat, .-VC1_SetImgFormat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1DEC_RecycleImage
	.type	VC1DEC_RecycleImage, %function
VC1DEC_RecycleImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L51
	add	x19, x19, 53248
	mov	w1, w20
	mov	w2, 0
	ldr	w0, [x19, 192]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 192]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L52
	ldr	w0, [x19, 192]
	ldr	x1, [x20, 168]
	bl	FreeUsdByDec
	str	xzr, [x20, 168]
	ldr	x1, [x20, 176]
	ldr	w0, [x19, 192]
	bl	FreeUsdByDec
	str	xzr, [x20, 176]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L51:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L52:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1DEC_RecycleImage, .-VC1DEC_RecycleImage
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1DEC_FlushRemainImg
	.type	VC1DEC_FlushRemainImg, %function
VC1DEC_FlushRemainImg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 12288
	add	x22, x20, 2432
	bl	_mcount
	add	x21, x22, 36864
	ldr	x0, [x21, 1136]
	cbz	x0, .L53
	ldr	x0, [x19]
	ldr	w0, [x0, 12]
	cmp	w0, 1
	beq	.L53
	add	x23, x19, 53248
	ldr	w1, [x20, 5572]
	ldr	w0, [x23, 192]
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	cbz	x0, .L53
	ldr	w1, [x20, 5572]
	ldr	w0, [x23, 192]
	bl	FSP_GetDisplay
	cmp	w0, 2
	beq	.L67
.L53:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L67:
	mov	x0, x19
	bl	VC1_SetImgFormat
	stp	xzr, xzr, [x24, 168]
	ldr	x0, [x21, 1136]
	ldrb	w1, [x0]
	cmp	w1, 1
	beq	.L68
.L57:
	ldr	w0, [x23, 192]
	mov	w2, 1
	ldr	w1, [x24, 88]
	bl	FSP_SetDisplay
	add	x3, x19, 49152
	ldr	w0, [x23, 192]
	mov	x4, x24
	add	x3, x3, 3680
	mov	x2, x19
	mov	w1, 1
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L53
	ldr	w1, [x24, 88]
	mov	x0, x19
	bl	VC1DEC_RecycleImage
	ldr	w0, [x23, 192]
	ldr	x1, [x24, 168]
	bl	FreeUsdByDec
	str	xzr, [x24, 168]
	ldr	x1, [x24, 176]
	ldr	w0, [x23, 192]
	bl	FreeUsdByDec
	str	xzr, [x24, 176]
	b	.L53
	.p2align 3
.L68:
	strb	w1, [x0, 1]
	mov	w0, 3
	ldr	x1, [x21, 1136]
	strb	wzr, [x1]
	strb	w0, [x20, 2433]
	b	.L57
	.size	VC1DEC_FlushRemainImg, .-VC1DEC_FlushRemainImg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_ArrangeVahbMem
	.type	VC1_ArrangeVahbMem, %function
VC1_ArrangeVahbMem:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	w23, w1
	mov	w22, w2
	bl	_mcount
	add	x19, x21, 12288
	mov	x0, 30968
	mov	w1, 0
	add	x0, x19, x0
	.p2align 2
.L70:
	str	w1, [x0, 1128]
	add	w1, w1, 1
	strb	wzr, [x0, 1]
	cmp	w1, 5
	strb	wzr, [x0]
	add	x0, x0, 1576
	bne	.L70
	ldr	x3, .LC25
	mov	x2, 36
	mov	w1, 0
	add	x0, x29, 72
	mov	w20, 1
	ldr	x3, [x3, 96]
	blr	x3
	str	w20, [x29, 72]
	ldr	x3, [x21]
	mov	w2, 3
	ldr	w1, [x19, 5552]
	mov	w4, 8
	ldr	w0, [x19, 5556]
	stp	w1, w0, [x29, 88]
	add	x0, x21, 53248
	strb	w4, [x29, 77]
	ldr	w5, [x3, 16]
	add	x1, x29, 72
	stp	w23, w22, [x29, 80]
	cmp	w5, 24
	ldr	w0, [x0, 192]
	csel	w2, w2, w20, ne
	str	w2, [x29, 96]
	mov	w2, 0
	ldr	w4, [x3, 16]
	mov	w3, 2
	cmp	w4, 24
	csel	w3, w3, w20, ne
	str	w3, [x29, 100]
	bl	FSP_ArrangeFsPool
	cmp	w0, 2
	beq	.L79
	strb	wzr, [x19, 2439]
	cbnz	w0, .L80
	ldrb	w1, [x19, 2432]
	mov	w0, w20
	orr	w1, w1, 8
	strb	w1, [x19, 2432]
.L74:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L80:
	ldr	x3, .LC26
	mov	w1, 547
	ldr	x2, .LC28
	mov	w0, 0
	add	x3, x3, 32
	bl	dprint_normal
	ldrb	w1, [x19, 2432]
	mov	w0, 0
	and	w1, w1, -9
	strb	w1, [x19, 2432]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L79:
	add	x0, x21, 49152
	add	x0, x0, 3680
	bl	ResetVoQueue
	strb	w20, [x19, 2439]
	mov	w0, 0
	b	.L74
	.size	VC1_ArrangeVahbMem, .-VC1_ArrangeVahbMem
	.align	3
.LC25:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC26:
	.xword	.LANCHOR0
	.align	3
.LC28:
	.xword	.LC27
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_WritePicMsg
	.type	VC1_WritePicMsg, %function
VC1_WritePicMsg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x19, x1
	add	x20, x21, 12288
	bl	_mcount
	add	x0, x21, 53248
	add	x21, x20, 2432
	ldr	w1, [x20, 5576]
	ldr	w0, [x0, 192]
	bl	FSP_GetLogicFs
	cbz	x0, .L103
	add	x0, x21, 16384
	ldrsb	w0, [x0, 1296]
	cbnz	w0, .L104
	add	x0, x21, 24576
	strb	wzr, [x19, 5]
	mov	w2, 3
	ldrb	w1, [x0, 352]
	strb	w1, [x19, 4]
	ldrb	w1, [x0, 603]
	cmp	w1, 4
	csel	w1, w1, w2, ne
	strb	w1, [x19, 3]
	ldr	w1, [x20, 5620]
	sub	w1, w1, #1
	strh	w1, [x19, 84]
	ldr	w1, [x20, 5616]
	strb	wzr, [x19, 8]
	sub	w1, w1, #1
	strh	w1, [x19, 82]
	ldrb	w1, [x0, 355]
	strb	w1, [x19, 6]
	strb	wzr, [x19, 9]
	ldrb	w1, [x21, 9]
	strb	w1, [x19, 7]
	strb	wzr, [x19, 10]
	strb	wzr, [x19, 11]
	ldrb	w1, [x0, 358]
	strb	w1, [x19, 13]
	ldrb	w1, [x0, 362]
	strb	w1, [x19, 14]
	ldrb	w1, [x0, 622]
	strb	w1, [x19, 12]
	ldrb	w1, [x0, 632]
	strb	w1, [x19, 18]
	ldrb	w1, [x0, 607]
	strb	w1, [x19, 19]
	ldrb	w1, [x0, 606]
	strb	w1, [x19, 17]
	ldr	w1, [x0, 704]
	strb	w1, [x19, 16]
	ldrb	w1, [x0, 366]
	cbnz	w1, .L94
	ldrb	w0, [x0, 606]
	cmp	w0, 8
	cset	w0, ls
	strb	w0, [x19, 20]
.L95:
	add	x1, x20, 2432
	add	x0, x1, 24576
	add	x2, x1, 36864
	ldrb	w3, [x0, 626]
	strb	w3, [x19, 24]
	ldrb	w3, [x0, 625]
	strb	w3, [x19, 23]
	ldrb	w3, [x0, 360]
	strb	w3, [x19, 22]
	ldrb	w3, [x0, 624]
	strb	w3, [x19, 25]
	ldr	w3, [x0, 636]
	strb	w3, [x19, 26]
	ldrb	w3, [x0, 627]
	strb	w3, [x19, 21]
	ldrb	w3, [x0, 611]
	strb	w3, [x19, 27]
	ldrb	w3, [x0, 612]
	strb	w3, [x19, 28]
	ldr	x3, [x2, 1136]
	ldrb	w3, [x3, 1029]
	strb	w3, [x19, 30]
	ldr	x3, [x2, 1128]
	ldrb	w3, [x3, 1029]
	strb	w3, [x19, 29]
	ldrb	w3, [x0, 609]
	strb	w3, [x19, 31]
	ldrb	w3, [x0, 743]
	strb	w3, [x19, 32]
	ldrb	w3, [x0, 621]
	strb	w3, [x19, 35]
	ldrb	w3, [x0, 361]
	strb	w3, [x19, 36]
	ldrb	w3, [x0, 617]
	strb	w3, [x19, 37]
	ldrb	w3, [x0, 619]
	strb	w3, [x19, 38]
	ldrb	w3, [x0, 620]
	strb	w3, [x19, 39]
	ldrb	w3, [x0, 618]
	strb	w3, [x19, 40]
	ldr	w3, [x0, 696]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 42]
	ldr	w3, [x0, 692]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 43]
	ldr	w3, [x0, 700]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 45]
	ldrb	w3, [x0, 604]
	strb	w3, [x19, 50]
	ldrb	w3, [x0, 616]
	strb	w3, [x19, 49]
	ldrb	w3, [x0, 615]
	strb	w3, [x19, 48]
	ldr	w3, [x0, 708]
	str	w3, [x19, 88]
	ldrb	w3, [x0, 364]
	cmp	w3, 1
	beq	.L105
	mov	w1, 0
	mov	w2, 0
	mov	w0, 0
.L98:
	strb	w0, [x19, 59]
	strb	w2, [x19, 60]
	strb	w1, [x19, 61]
.L92:
	ldr	w1, [x20, 5584]
	add	x2, x20, 2447
	strh	w1, [x19, 76]
	ldr	w1, [x20, 5552]
	strh	w1, [x19, 78]
	ldr	w1, [x20, 5556]
	strh	w1, [x19, 80]
	ldrb	w1, [x20, 2445]
	strb	w1, [x19, 63]
	ldrb	w0, [x20, 2446]
	strb	w0, [x19, 62]
	ldr	w0, [x20, 5536]
	add	w1, w0, 254
	adds	w0, w0, 127
	csel	w0, w1, w0, mi
	asr	w0, w0, 7
	lsl	w0, w0, 4
	str	w0, [x19, 120]
	ldr	w0, [x20, 5640]
	str	w0, [x19, 124]
	ldr	w0, [x20, 5644]
	str	w0, [x19, 128]
	ldr	w0, [x20, 5648]
	str	w0, [x19, 132]
	ldr	w0, [x20, 5652]
	str	w0, [x19, 136]
	ldr	w0, [x20, 5656]
	str	w0, [x19, 140]
	ldr	w0, [x20, 5660]
	str	w0, [x19, 144]
	ldr	w0, [x20, 5664]
	str	w0, [x19, 148]
	str	x2, [x19, 64]
.L81:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L104:
	add	x21, x21, 24576
	mov	w1, 3
	ldr	w0, [x21, 756]
	strb	w0, [x19, 5]
	ldrb	w0, [x21, 368]
	strb	w0, [x19, 4]
	ldrb	w0, [x21, 713]
	cmp	w0, 4
	csel	w0, w0, w1, ne
	strb	w0, [x19, 3]
	ldr	w0, [x21, 756]
	cmp	w0, w1
	ldr	w0, [x20, 5620]
	beq	.L106
	sub	w0, w0, #1
	strh	w0, [x19, 84]
.L87:
	ldr	w1, [x20, 5616]
	add	x4, x20, 2432
	add	x0, x4, 24576
	add	x5, x4, 36864
	sub	w1, w1, #1
	strh	w1, [x19, 82]
	ldrb	w1, [x0, 753]
	strb	w1, [x19, 8]
	ldrb	w1, [x0, 544]
	strb	w1, [x19, 6]
	ldrb	w1, [x0, 744]
	strb	w1, [x19, 9]
	ldrb	w1, [x20, 2441]
	strb	w1, [x19, 7]
	ldrsw	x1, [x5, 1168]
	lsl	x2, x1, 2
	sub	x2, x2, x1
	lsl	x3, x2, 5
	add	x2, x2, x3
	lsl	x2, x2, 1
	sub	x2, x2, x1
	add	x2, x4, x2, lsl 3
	add	x2, x2, 28672
	ldrb	w1, [x2, 891]
	strb	w1, [x19, 10]
	ldrsw	x1, [x5, 1184]
	lsl	x2, x1, 2
	sub	x3, x2, x1
	lsl	x2, x3, 5
	add	x2, x3, x2
	lsl	x2, x2, 1
	sub	x1, x2, x1
	add	x1, x4, x1, lsl 3
	add	x1, x1, 28672
	ldrb	w1, [x1, 891]
	strb	w1, [x19, 11]
	ldrb	w1, [x0, 742]
	strb	w1, [x19, 15]
	ldrb	w1, [x0, 545]
	strb	w1, [x19, 13]
	ldrb	w1, [x0, 549]
	strb	w1, [x19, 14]
	ldrb	w1, [x0, 712]
	strb	w1, [x19, 12]
	ldrb	w1, [x0, 880]
	strb	w1, [x19, 18]
	ldrb	w1, [x0, 715]
	strb	w1, [x19, 19]
	ldrb	w1, [x0, 722]
	strb	w1, [x19, 17]
	ldr	w1, [x0, 828]
	strb	w1, [x19, 16]
	ldrb	w1, [x0, 550]
	cbnz	w1, .L88
	ldrb	w0, [x0, 722]
	cmp	w0, 8
	cset	w0, ls
	strb	w0, [x19, 20]
.L89:
	add	x1, x20, 2432
	add	x0, x1, 24576
	add	x3, x1, 36864
	ldrb	w2, [x0, 874]
	strb	w2, [x19, 24]
	ldrb	w2, [x0, 873]
	strb	w2, [x19, 23]
	ldrb	w2, [x0, 547]
	strb	w2, [x19, 22]
	ldrb	w2, [x0, 872]
	strb	w2, [x19, 25]
	ldr	w2, [x0, 884]
	strb	w2, [x19, 26]
	ldrb	w2, [x0, 875]
	strb	w2, [x19, 21]
	ldrb	w2, [x0, 726]
	strb	w2, [x19, 27]
	ldrb	w2, [x0, 727]
	strb	w2, [x19, 28]
	ldrb	w2, [x0, 745]
	strb	w2, [x19, 34]
	ldrb	w2, [x0, 737]
	strb	w2, [x19, 33]
	ldrb	w2, [x0, 753]
	ldr	x4, [x3, 1136]
	add	x2, x4, x2
	ldrb	w2, [x2, 1029]
	strb	w2, [x19, 30]
	ldrb	w2, [x0, 753]
	ldr	x3, [x3, 1128]
	add	x2, x3, x2
	ldrb	w2, [x2, 1029]
	strb	w2, [x19, 29]
	ldrb	w2, [x0, 725]
	strb	w2, [x19, 31]
	ldrb	w2, [x0, 743]
	strb	w2, [x19, 32]
	ldrb	w2, [x0, 736]
	strb	w2, [x19, 35]
	ldrb	w2, [x0, 548]
	strb	w2, [x19, 36]
	ldrb	w2, [x0, 732]
	strb	w2, [x19, 37]
	ldrb	w2, [x0, 734]
	strb	w2, [x19, 38]
	ldrb	w2, [x0, 735]
	strb	w2, [x19, 39]
	ldrb	w2, [x0, 733]
	strb	w2, [x19, 40]
	ldrb	w2, [x0, 749]
	cmp	w2, wzr
	cset	w2, eq
	strb	w2, [x19, 46]
	ldrb	w2, [x0, 747]
	cmp	w2, wzr
	cset	w2, eq
	strb	w2, [x19, 42]
	ldrb	w2, [x0, 751]
	cmp	w2, wzr
	cset	w2, eq
	strb	w2, [x19, 44]
	ldrb	w2, [x0, 752]
	cmp	w2, wzr
	cset	w2, eq
	strb	w2, [x19, 41]
	ldrb	w2, [x0, 746]
	cmp	w2, wzr
	cset	w2, eq
	strb	w2, [x19, 43]
	ldrb	w2, [x0, 750]
	cmp	w2, wzr
	cset	w2, eq
	strb	w2, [x19, 47]
	ldrb	w2, [x0, 748]
	cmp	w2, wzr
	cset	w2, eq
	strb	w2, [x19, 45]
	ldrb	w2, [x0, 714]
	strb	w2, [x19, 50]
	ldrb	w2, [x0, 731]
	strb	w2, [x19, 49]
	ldrb	w2, [x0, 730]
	strb	w2, [x19, 48]
	ldrb	w2, [x0, 741]
	strb	w2, [x19, 53]
	ldrb	w2, [x0, 738]
	strb	w2, [x19, 54]
	ldrb	w2, [x0, 739]
	strb	w2, [x19, 51]
	ldrb	w2, [x0, 740]
	strb	w2, [x19, 52]
	ldr	w2, [x0, 860]
	str	w2, [x19, 88]
	ldr	w2, [x20, 5592]
	str	w2, [x19, 92]
	ldr	w2, [x20, 5596]
	str	w2, [x19, 96]
	ldrb	w2, [x0, 553]
	strb	w2, [x19, 55]
	ldrb	w2, [x0, 554]
	strb	w2, [x19, 56]
	ldrb	w2, [x0, 555]
	strb	w2, [x19, 57]
	ldrb	w0, [x0, 556]
	strb	w0, [x19, 58]
	ldrb	w0, [x20, 2445]
	strb	w0, [x19, 63]
	b	.L92
	.p2align 3
.L94:
	cmp	w1, 1
	beq	.L107
	cmp	w1, 2
	beq	.L108
	mov	w0, 1
	strb	w0, [x19, 20]
	b	.L95
	.p2align 3
.L88:
	cmp	w1, 1
	beq	.L109
	cmp	w1, 2
	beq	.L110
	mov	w0, 1
	strb	w0, [x19, 20]
	b	.L89
	.p2align 3
.L109:
	ldrb	w0, [x0, 723]
	cmp	w0, wzr
	cset	w0, ne
	strb	w0, [x19, 20]
	b	.L89
	.p2align 3
.L107:
	ldrb	w0, [x0, 608]
	cmp	w0, wzr
	cset	w0, ne
	strb	w0, [x19, 20]
	b	.L95
	.p2align 3
.L106:
	add	w0, w0, 1
	add	w0, w0, w0, lsr 31
	asr	w0, w0, 1
	sub	w0, w0, #1
	strh	w0, [x19, 84]
	b	.L87
	.p2align 3
.L105:
	ldr	w7, [x2, 1168]
	ldr	w6, [x2, 1184]
	lsl	x4, x7, 2
	lsl	x2, x6, 2
	sub	x5, x4, x7
	sub	x2, x2, x6
	lsl	x4, x5, 5
	lsl	x3, x2, 5
	add	x4, x5, x4
	add	x2, x2, x3
	lsl	x3, x4, 1
	lsl	x2, x2, 1
	ldrb	w4, [x0, 603]
	sub	x2, x2, x6
	sub	x3, x3, x7
	sub	w4, w4, #2
	add	x3, x1, x3, lsl 3
	and	w4, w4, -3
	add	x1, x1, x2, lsl 3
	add	x2, x3, 24576
	add	x1, x1, 24576
	uxtb	w3, w4
	ldrb	w2, [x2, 3962]
	ldrb	w1, [x1, 3962]
	cbnz	w3, .L99
	mov	w0, w1
	b	.L98
	.p2align 3
.L99:
	ldrb	w0, [x0, 602]
	b	.L98
	.p2align 3
.L110:
	strb	wzr, [x19, 20]
	b	.L89
	.p2align 3
.L108:
	strb	wzr, [x19, 20]
	b	.L95
	.p2align 3
.L103:
	mov	w3, 646
	ldr	x2, .LC30
	mov	w1, w3
	mov	w0, 20
	bl	dprint_normal
	b	.L81
	.size	VC1_WritePicMsg, .-VC1_WritePicMsg
	.align	3
.LC30:
	.xword	.LC29
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_WriteSliceMsg
	.type	VC1_WriteSliceMsg, %function
VC1_WriteSliceMsg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	w0, [x19, 3152]
	add	x1, x19, 3344
	strb	w0, [x20, 74]
	add	x0, x20, 192
	ldr	x2, .LC31
	ldr	w3, [x19, 3152]
	ldr	x4, [x2, 104]
	lsl	x2, x3, 3
	sub	x2, x2, x3
	lsl	x2, x2, 3
	blr	x4
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1_WriteSliceMsg, .-VC1_WriteSliceMsg
	.align	3
.LC31:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_CfgVDH
	.type	VC1_CfgVDH, %function
VC1_CfgVDH:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	add	x0, x19, 16384
	ldrsb	w0, [x0, 1296]
	cbz	w0, .L113
	add	x0, x19, 24576
	ldr	w0, [x0, 756]
	cmp	w0, 3
	beq	.L118
.L113:
	ldr	w0, [x19, 3192]
	str	w0, [x20, 152]
.L114:
	add	x0, x19, 36864
	ldrsw	x5, [x0, 1184]
	ldrsw	x1, [x0, 1168]
	lsl	x3, x5, 2
	ldr	x6, [x0, 1128]
	sub	x4, x3, x5
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x3, x4, 5
	add	x3, x4, x3
	lsl	x2, x0, 5
	add	x0, x0, x2
	lsl	x2, x3, 1
	sub	x2, x2, x5
	lsl	x0, x0, 1
	sub	x0, x0, x1
	ldr	w4, [x6, 1060]
	add	x2, x19, x2, lsl 3
	add	x2, x2, 28672
	add	x0, x19, x0, lsl 3
	add	x0, x0, 28672
	and	w4, w4, 3
	ubfiz	w4, w4, 4, 4
	ldr	w3, [x2, 924]
	ldr	w2, [x0, 924]
	and	w0, w3, 3
	strb	wzr, [x20, 73]
	and	w2, w2, 3
	orr	w0, w4, w0, lsl 2
	orr	w0, w0, w2
	strb	w0, [x20, 72]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L118:
	ldr	w0, [x19, 3188]
	ldr	w1, [x19, 3184]
	add	w0, w0, 1
	add	w0, w0, w0, lsr 31
	asr	w0, w0, 1
	mul	w0, w0, w1
	str	w0, [x20, 152]
	b	.L114
	.size	VC1_CfgVDH, .-VC1_CfgVDH
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1DEC_GetImageBuffer
	.type	VC1DEC_GetImageBuffer, %function
VC1DEC_GetImageBuffer:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 12288
	add	x0, x0, 2432
	ldrsb	w1, [x0, 3]
	cmp	w1, 3
	beq	.L130
.L120:
	add	x21, x19, 53248
	ldr	w0, [x21, 192]
	bl	FSP_IsNewFsAvailable
	cmp	w0, 1
	beq	.L122
	cmn	w0, #1
	mov	w20, 0
	beq	.L131
	mov	w0, w20
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L130:
	ldrb	w0, [x0, 10]
	cmp	w0, 1
	beq	.L120
.L122:
	mov	w20, 1
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L131:
	add	x1, x19, 49152
	ldr	w0, [x21, 192]
	add	x1, x1, 3680
	bl	FSP_ClearNotInVoQueue
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	VC1DEC_GetImageBuffer, .-VC1DEC_GetImageBuffer
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_GetImageBuffer
	.type	VC1_Vfmw_GetImageBuffer, %function
VC1_Vfmw_GetImageBuffer:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 12288
	add	x22, x20, 53248
	bl	_mcount
	ldrb	w0, [x21, 2434]
	cmp	w0, 5
	beq	.L155
	ldr	w0, [x22, 192]
	mov	w1, 1
	bl	FSP_NewLogicFs
	mov	w1, w0
	str	w0, [x21, 5576]
.L135:
	tbnz	w1, #31, .L156
.L136:
	add	x19, x20, 40960
	mov	x2, 30968
	add	x2, x21, x2
	ldrh	w0, [x19, 2296]
	cbz	w0, .L139
	add	x20, x20, 49152
	add	x0, x19, 3872
	add	x4, x20, 1984
.L142:
	ldrh	w3, [x0]
	mov	x2, x0
	add	x0, x0, 1576
	cmp	x0, x4
	cbz	w3, .L139
	bne	.L142
	ldr	w0, [x22, 192]
	add	x20, x20, 1985
	bl	FSP_ClearLogicFs
	ldr	x2, .LC37
	mov	w1, 1048
	mov	w0, 1
	bl	dprint_normal
	add	x0, x19, 2297
.L144:
	strb	wzr, [x0]
	strb	wzr, [x0, -1]
	add	x0, x0, 1576
	cmp	x0, x20
	bne	.L144
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L155:
	ldr	w1, [x21, 5572]
	ldr	w0, [x22, 192]
	bl	FSP_LinkLogicFs
	cbz	x0, .L157
	ldr	w1, [x0, 4]
	str	w1, [x21, 5576]
	tbz	w1, #31, .L136
.L156:
	ldr	x2, .LC33
	mov	w1, 1009
	mov	w0, 0
	bl	dprint_normal
	ldr	w1, [x21, 5572]
	ldr	w0, [x22, 192]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L137
	ldr	w0, [x22, 192]
	ldr	x1, [x19, 168]
	bl	FreeUsdByDec
	ldr	w0, [x22, 192]
	ldr	x1, [x19, 176]
	bl	FreeUsdByDec
	ldr	w0, [x22, 192]
	ldr	x1, [x19, 184]
	bl	FreeUsdByDec
	ldr	w0, [x22, 192]
	ldr	x1, [x19, 192]
	bl	FreeUsdByDec
	stp	xzr, xzr, [x19, 168]
	stp	xzr, xzr, [x19, 184]
	ldr	w1, [x21, 5572]
	ldr	w0, [x22, 192]
	bl	FSP_ClearLogicFs
	ldr	w1, [x21, 5568]
	ldr	w0, [x22, 192]
	bl	FSP_ClearLogicFs
	ldr	w0, [x22, 192]
	bl	FSP_GetNullLogicFs
	str	w0, [x21, 5568]
	str	w0, [x21, 5572]
.L137:
	str	wzr, [x21, 5564]
	add	x1, x20, 49152
	add	x1, x1, 3680
	ldr	w0, [x22, 192]
	bl	FSP_ClearNotInVoQueue
	ldr	x2, .LC35
	mov	w1, 1015
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L139:
	add	x0, x21, 2432
	mov	w4, 1
	add	x0, x0, 36864
	mov	w1, 0
	mov	x3, x0
	str	x2, [x0, 1128]
	strb	w4, [x2, 1]
	.p2align 2
.L141:
	ldr	x4, [x3, 1128]
	sxtw	x0, w1
	uxtb	w2, w1
	add	w1, w1, 1
	add	x4, x4, x0
	cmp	w1, 256
	strb	w2, [x4, 3]
	ldr	x4, [x3, 1128]
	add	x4, x4, x0
	strb	w2, [x4, 259]
	ldr	x4, [x3, 1128]
	add	x4, x4, x0
	strb	w2, [x4, 515]
	ldr	x4, [x3, 1128]
	add	x0, x4, x0
	strb	w2, [x0, 771]
	bne	.L141
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L157:
	ldr	w1, [x21, 5576]
	b	.L135
	.size	VC1_Vfmw_GetImageBuffer, .-VC1_Vfmw_GetImageBuffer
	.align	3
.LC33:
	.xword	.LC32
	.align	3
.LC35:
	.xword	.LC34
	.align	3
.LC37:
	.xword	.LC36
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_BuildRefList
	.type	VC1_Vfmw_BuildRefList, %function
VC1_Vfmw_BuildRefList:
	sub	sp, sp, #512
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	mov	w25, w3
	mov	w19, w1
	mov	w24, w2
	bl	_mcount
	mov	x2, 256
	mov	w1, 0
	add	x0, x29, 80
	add	x20, x21, 36864
	bl	memset
	mov	x2, 256
	mov	w1, 0
	add	x0, x29, 336
	bl	memset
	ldr	x22, .LC38
	mov	x2, 16
	mov	w1, 0
	add	x0, x20, 1160
	ldr	x3, [x22, 96]
	blr	x3
	ldr	x3, [x22, 96]
	mov	x2, 16
	mov	w1, 0
	add	x0, x20, 1176
	blr	x3
	ldrsb	w0, [x21, 4]
	tst	w0, -3
	bne	.L159
	cmp	w19, 1
	beq	.L224
	cmp	w19, 2
	beq	.L225
.L168:
	str	wzr, [x20, 1164]
	str	wzr, [x20, 1180]
.L222:
	mov	w0, 1
.L205:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	add	sp, sp, 512
	ret
	.p2align 3
.L159:
	add	x23, x21, 24576
	ldrb	w0, [x23, 716]
	cmp	w0, 1
	ldrb	w0, [x23, 753]
	beq	.L226
	cbz	w0, .L227
.L179:
	ldr	x0, [x20, 1144]
	ldr	w26, [x0, 1128]
	mov	w22, w26
.L178:
	cmp	w19, 1
	beq	.L228
.L180:
	cmp	w19, 2
	bne	.L168
	mov	w0, 1
	strb	wzr, [x20, 1160]
	strb	w0, [x20, 1161]
	str	w19, [x20, 1164]
	str	w19, [x20, 1180]
	cbz	w24, .L194
	cbz	w25, .L229
.L194:
	ldr	x0, [x20, 1144]
	ldr	x2, [x20, 1128]
	ldr	w9, [x0, 1128]
.L221:
	ldr	x0, [x20, 1136]
	mov	w1, 1
	strb	wzr, [x20, 1176]
	strb	w1, [x20, 1177]
	str	w9, [x20, 1168]
	ldr	w8, [x0, 1128]
	str	w8, [x20, 1184]
	ldr	w0, [x0, 1128]
	str	w0, [x20, 1188]
	ldr	w0, [x23, 840]
	ldr	w1, [x2, 1128]
	cmp	w0, 1
	bls	.L230
	ands	w0, w0, -3
	beq	.L231
.L199:
	mov	w10, 1576
	mov	x0, x21
	mov	x4, 0
	smull	x9, w9, w10
	smull	x8, w8, w10
	smull	x10, w1, w10
	.p2align 2
.L200:
	add	x3, x4, x9
	add	x0, x0, 1
	add	x3, x21, x3
	add	x2, x4, x8
	add	x5, x3, 24576
	add	x3, x3, 28672
	add	x2, x21, x2
	add	x1, x4, x10
	add	x6, x2, 24576
	add	x2, x2, 28672
	ldrb	w5, [x5, 3963]
	add	x1, x21, x1
	strb	w5, [x0, 14]
	add	x5, x1, 24576
	add	x1, x1, 28672
	add	x4, x4, 1
	ldrb	w7, [x3, 123]
	cmp	x4, 256
	strb	w7, [x0, 270]
	ldrb	w7, [x3, 379]
	strb	w7, [x0, 526]
	ldrb	w3, [x3, 635]
	strb	w3, [x0, 782]
	ldrb	w3, [x6, 3963]
	strb	w3, [x0, 1038]
	ldrb	w3, [x2, 123]
	strb	w3, [x0, 1294]
	ldrb	w3, [x2, 379]
	strb	w3, [x0, 1550]
	ldrb	w2, [x2, 635]
	strb	w2, [x0, 1806]
	ldrb	w2, [x5, 3963]
	strb	w2, [x0, 2062]
	ldrb	w2, [x1, 123]
	strb	w2, [x0, 2318]
	ldrb	w2, [x1, 379]
	strb	w2, [x0, 2574]
	ldrb	w1, [x1, 635]
	strb	w1, [x0, 2830]
	bne	.L200
	b	.L222
	.p2align 3
.L227:
	ldr	x0, [x20, 1136]
	cmp	w19, 1
	ldr	x1, [x20, 1144]
	ldr	w22, [x0, 1128]
	ldr	w26, [x1, 1128]
	bne	.L180
.L228:
	ldrb	w0, [x23, 744]
	strb	w19, [x20, 1161]
	add	w0, w0, 1
	strb	wzr, [x20, 1160]
	str	w0, [x20, 1164]
	str	wzr, [x20, 1180]
	cbz	w24, .L181
	cbz	w25, .L232
.L181:
	ldr	x0, [x20, 1144]
	ldr	x1, [x20, 1128]
	ldr	w19, [x0, 1128]
.L220:
	str	w19, [x20, 1168]
	ldr	w0, [x0, 1128]
	str	w0, [x20, 1172]
	ldr	w0, [x23, 840]
	ldr	w20, [x1, 1128]
	cmp	w0, 1
	bls	.L233
.L185:
	tst	w0, -3
	bne	.L186
	ldrb	w1, [x23, 726]
	cmp	w1, 4
	beq	.L234
.L186:
	mov	w3, 1576
	mov	x2, 28539
	add	x0, x21, 15
	add	x4, x21, 271
	smaddl	x1, w19, w3, x2
	smaddl	x2, w20, w3, x2
	add	x1, x21, x1
	add	x2, x21, x2
	.p2align 2
.L193:
	add	x0, x0, 1
	ldrb	w3, [x1]
	add	x1, x1, 1
	add	x2, x2, 1
	cmp	x0, x4
	strb	w3, [x0, -1]
	ldrb	w3, [x1, 255]
	strb	w3, [x0, 255]
	ldrb	w3, [x1, 511]
	strb	w3, [x0, 511]
	ldrb	w3, [x1, 767]
	strb	w3, [x0, 767]
	ldrb	w3, [x2, -1]
	strb	w3, [x0, 2047]
	ldrb	w3, [x2, 255]
	strb	w3, [x0, 2303]
	ldrb	w3, [x2, 511]
	strb	w3, [x0, 2559]
	ldrb	w3, [x2, 767]
	strb	w3, [x0, 2815]
	bne	.L193
	b	.L222
	.p2align 3
.L224:
	ldr	x1, [x20, 1144]
	add	x0, x21, 16384
	strb	wzr, [x20, 1160]
	str	w19, [x20, 1164]
	str	wzr, [x20, 1180]
	ldr	w19, [x1, 1128]
	str	w19, [x20, 1168]
	ldrsb	w0, [x0, 1296]
	cbz	w0, .L161
	add	x0, x21, 24576
	ldr	w2, [x0, 756]
	ldrb	w20, [x0, 728]
	cmp	w2, 2
	ldrb	w22, [x0, 729]
	ldrb	w1, [x0, 726]
	beq	.L235
.L162:
	cmp	w1, 4
	beq	.L163
.L166:
	mov	w2, 1576
	add	x1, x21, 15
	smull	x2, w19, w2
	add	x0, x2, 24576
	add	x2, x2, 28672
	add	x0, x0, 3963
	add	x2, x2, 123
	add	x0, x21, x0
	add	x2, x21, x2
	.p2align 2
.L164:
	ldrb	w3, [x0]
	add	x0, x0, 1
	strb	w3, [x1]
	add	x1, x1, 1
	cmp	x0, x2
	ldrb	w3, [x0, 255]
	strb	w3, [x1, 255]
	ldrb	w3, [x0, 511]
	strb	w3, [x1, 511]
	ldrb	w3, [x0, 767]
	strb	w3, [x1, 767]
	bne	.L164
	b	.L222
	.p2align 3
.L226:
	cbz	w0, .L179
	ldr	x1, [x20, 1136]
	ldr	x0, [x20, 1144]
	ldr	w26, [x1, 1128]
	ldr	w22, [x0, 1128]
	b	.L178
.L225:
	ldr	x2, [x20, 1144]
	mov	w0, 1
	strb	wzr, [x20, 1160]
	str	w0, [x20, 1164]
	str	w0, [x20, 1180]
	add	x0, x21, 16384
	ldr	x1, [x20, 1136]
	ldr	w19, [x2, 1128]
	str	w19, [x20, 1168]
	strb	wzr, [x20, 1176]
	ldr	w22, [x1, 1128]
	str	w22, [x20, 1184]
	ldrsb	w0, [x0, 1296]
	cbz	w0, .L169
	add	x0, x21, 24576
	ldrb	w20, [x0, 728]
	ldrb	w23, [x0, 729]
	ldrb	w0, [x0, 726]
.L170:
	cmp	w0, 4
	beq	.L171
.L174:
	mov	w1, 1576
	mov	x3, 28539
	add	x0, x21, 15
	add	x4, x21, 271
	smaddl	x2, w19, w1, x3
	smaddl	x1, w22, w1, x3
	add	x2, x21, x2
	add	x1, x21, x1
	.p2align 2
.L172:
	add	x0, x0, 1
	ldrb	w3, [x2]
	add	x2, x2, 1
	add	x1, x1, 1
	cmp	x0, x4
	strb	w3, [x0, -1]
	ldrb	w3, [x2, 255]
	strb	w3, [x0, 255]
	ldrb	w3, [x2, 511]
	strb	w3, [x0, 511]
	ldrb	w3, [x2, 767]
	strb	w3, [x0, 767]
	ldrb	w3, [x1, -1]
	strb	w3, [x0, 1023]
	ldrb	w3, [x1, 255]
	strb	w3, [x0, 1279]
	ldrb	w3, [x1, 511]
	strb	w3, [x0, 1535]
	ldrb	w3, [x1, 767]
	strb	w3, [x0, 1791]
	bne	.L172
	b	.L222
.L161:
	add	x0, x21, 24576
	ldrb	w20, [x0, 613]
	ldrb	w22, [x0, 614]
	ldrb	w1, [x0, 611]
	b	.L162
.L169:
	add	x0, x21, 24576
	ldrb	w20, [x0, 613]
	ldrb	w23, [x0, 614]
	ldrb	w0, [x0, 611]
	b	.L170
.L231:
	ldrb	w2, [x23, 726]
	cmp	w2, 4
	bne	.L199
	b	.L205
.L232:
	ldr	x1, [x20, 1128]
	ldr	x0, [x20, 1144]
	ldr	w19, [x1, 1128]
	b	.L220
.L229:
	ldr	x2, [x20, 1128]
	ldr	w9, [x2, 1128]
	b	.L221
.L234:
	cbnz	w0, .L190
	ldrb	w24, [x23, 844]
	ldrb	w23, [x23, 848]
.L191:
	mov	w3, 0
	mov	w2, w23
	add	x0, x29, 80
	mov	w1, w24
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w2, w23
	mov	w1, w24
	add	x0, x29, 336
	mov	w3, 1
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w2, 1576
	sub	x0, x29, #3504
	smull	x2, w22, w2
	add	x2, x2, 28672
	add	x1, x2, 379
	add	x2, x2, 635
	add	x1, x21, x1
	add	x4, x21, x2
	.p2align 2
.L192:
	ldrb	w3, [x1]
	add	x1, x1, 1
	ldrb	w2, [x1, 255]
	cmp	x1, x4
	add	x3, x0, x3
	add	x2, x0, x2
	ldrb	w3, [x3, 3584]
	ldrb	w2, [x2, 3840]
	strb	w3, [x1, -1]
	strb	w2, [x1, 255]
	bne	.L192
	b	.L186
.L233:
	ldrb	w0, [x23, 726]
	cmp	w0, 4
	bne	.L186
	ldrb	w24, [x23, 728]
	mov	w3, 0
	ldrb	w25, [x23, 729]
	add	x0, x29, 80
	mov	w1, w24
	mov	w2, w25
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w1, w24
	mov	w3, 1
	add	x0, x29, 336
	mov	w2, w25
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w0, 1576
	smull	x26, w26, w0
	sub	x0, x29, #3504
	add	x1, x26, 24576
	add	x3, x26, 28672
	add	x1, x1, 3963
	add	x3, x3, 123
	add	x1, x21, x1
	add	x3, x21, x3
	.p2align 2
.L187:
	ldrb	w2, [x1]
	add	x1, x1, 1
	add	x2, x0, x2
	ldrb	w2, [x2, 3584]
	strb	w2, [x1, -1]
	ldrb	w2, [x1, 255]
	add	x2, x0, x2
	ldrb	w2, [x2, 3840]
	strb	w2, [x1, 255]
	cmp	x1, x3
	bne	.L187
	ldr	w0, [x23, 840]
	b	.L185
.L230:
	ldrb	w0, [x23, 726]
	cmp	w0, 4
	bne	.L199
	mov	w0, 0
	b	.L205
.L235:
	ldr	w0, [x0, 832]
	cmp	w0, 1
	bne	.L162
.L163:
	mov	w3, 0
	mov	w2, w22
	mov	w1, w20
	add	x0, x29, 80
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w2, w22
	mov	w1, w20
	add	x0, x29, 336
	mov	w3, 1
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w2, 1576
	sub	x0, x29, #3504
	smull	x2, w19, w2
	add	x1, x2, 24576
	add	x6, x2, 28672
	add	x1, x1, 3963
	add	x6, x6, 123
	add	x1, x21, x1
	add	x6, x21, x6
	.p2align 2
.L165:
	ldrb	w5, [x1]
	add	x1, x1, 1
	ldrb	w4, [x1, 255]
	ldrb	w3, [x1, 511]
	add	x5, x0, x5
	ldrb	w2, [x1, 767]
	add	x4, x0, x4
	add	x3, x0, x3
	cmp	x1, x6
	add	x2, x0, x2
	ldrb	w5, [x5, 3584]
	ldrb	w4, [x4, 3840]
	ldrb	w3, [x3, 3584]
	ldrb	w2, [x2, 3840]
	strb	w5, [x1, -1]
	strb	w4, [x1, 255]
	strb	w3, [x1, 511]
	strb	w2, [x1, 767]
	bne	.L165
	b	.L166
.L171:
	mov	w3, 0
	mov	w2, w23
	mov	w1, w20
	add	x0, x29, 80
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w3, 1
	mov	w2, w23
	mov	w1, w20
	add	x0, x29, 336
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w2, 1576
	mov	x3, 28539
	sub	x0, x29, #3504
	smull	x1, w19, w2
	smaddl	x2, w22, w2, x3
	add	x7, x1, 28672
	add	x3, x1, 24576
	add	x1, x3, 3963
	add	x7, x7, 123
	add	x1, x21, x1
	add	x2, x21, x2
	add	x7, x21, x7
	.p2align 2
.L173:
	ldrb	w6, [x1]
	add	x1, x1, 1
	ldrb	w5, [x1, 255]
	add	x2, x2, 1
	ldrb	w4, [x1, 511]
	add	x6, x0, x6
	ldrb	w3, [x1, 767]
	add	x5, x0, x5
	add	x4, x0, x4
	cmp	x1, x7
	add	x3, x0, x3
	ldrb	w6, [x6, 3584]
	ldrb	w5, [x5, 3840]
	ldrb	w4, [x4, 3584]
	ldrb	w3, [x3, 3840]
	strb	w6, [x1, -1]
	strb	w5, [x1, 255]
	strb	w4, [x1, 511]
	strb	w3, [x1, 767]
	ldrb	w6, [x2, -1]
	ldrb	w5, [x2, 255]
	ldrb	w4, [x2, 511]
	add	x6, x0, x6
	ldrb	w3, [x2, 767]
	add	x5, x0, x5
	add	x4, x0, x4
	add	x3, x0, x3
	ldrb	w6, [x6, 3584]
	ldrb	w5, [x5, 3840]
	ldrb	w4, [x4, 3584]
	ldrb	w3, [x3, 3840]
	strb	w6, [x2, -1]
	strb	w5, [x2, 255]
	strb	w4, [x2, 511]
	strb	w3, [x2, 767]
	bne	.L173
	b	.L174
.L190:
	ldrb	w24, [x23, 728]
	ldrb	w23, [x23, 729]
	b	.L191
	.size	VC1_Vfmw_BuildRefList, .-VC1_Vfmw_BuildRefList
	.align	3
.LC38:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_PrepareDecode
	.type	VC1_Vfmw_PrepareDecode, %function
VC1_Vfmw_PrepareDecode:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 12288
	bl	_mcount
	add	x0, x19, 2432
	add	x1, x0, 16384
	ldr	w22, [x19, 5536]
	ldrsb	w1, [x1, 1296]
	cbz	w1, .L237
	add	x0, x0, 24576
	ldr	w23, [x19, 5540]
	ldr	w0, [x0, 756]
	cmp	w0, 3
	beq	.L331
.L325:
	add	x0, x19, 2432
	add	x1, x19, 2432
	add	x0, x0, 16384
	mul	w23, w23, w22
	ldrh	w21, [x0, 1502]
	ldrh	w24, [x0, 1500]
	add	w21, w21, 15
	ldr	w0, [x19, 5548]
	asr	w21, w21, 4
	add	w24, w24, 15
	cmp	w21, w0
	asr	w24, w24, 4
	beq	.L332
.L239:
	add	x0, x20, 53248
	add	x3, x29, 108
	add	x2, x29, 104
	add	x1, x29, 100
	ldr	w0, [x0, 192]
	bl	VCTRL_GetChanImgNum
	ldr	w0, [x29, 108]
	cmp	w0, wzr
	ble	.L241
	mov	w0, 2
	mov	w25, 0
	strb	w0, [x19, 2439]
.L313:
	mov	w0, w25
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L237:
	ldr	w21, [x19, 5540]
	mov	w24, w22
	ldr	w0, [x19, 5548]
	add	x1, x19, 2432
	cmp	w21, w0
	mul	w23, w22, w21
	bne	.L239
.L332:
	ldr	w0, [x19, 5544]
	cmp	w24, w0
	bne	.L239
	lsl	w2, w22, 4
	mov	w0, 0
	add	w2, w2, 63
	and	w2, w2, -64
	str	w2, [x19, 5560]
	ldrb	w1, [x1, 9]
	cbnz	w1, .L288
.L244:
	ldrb	w1, [x19, 2432]
	eor	x1, x1, 8
	ubfx	x1, x1, 3, 1
	orr	w0, w0, w1
	cbnz	w0, .L287
.L247:
	mov	x0, x20
	bl	VC1_Vfmw_GetImageBuffer
	cbz	w0, .L333
	add	x24, x20, 53248
	ldr	w1, [x19, 5576]
	ldr	w0, [x24, 192]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L254
	ldr	x3, [x20]
	mov	x4, -1
	ldr	x2, .LC44
	mov	w1, 1169
	ldr	x3, [x3, 32]
	str	x3, [x0, 208]
	ldr	x3, [x20]
	ldr	x3, [x3, 48]
	str	x3, [x0, 216]
	ldr	x3, [x20]
	ldr	x3, [x3, 64]
	str	x3, [x0, 224]
	ldr	x3, [x20]
	ldr	w3, [x3, 80]
	str	w3, [x0]
	ldr	x3, [x20]
	ldr	w3, [x3, 84]
	str	w3, [x0, 4]
	ldr	x3, [x20]
	ldr	w3, [x3, 88]
	str	w3, [x0, 8]
	ldr	x3, [x20]
	ldr	w3, [x3, 104]
	str	w3, [x0, 12]
	ldr	x3, [x20]
	str	x4, [x3, 32]
	ldp	x3, x4, [x0, 208]
	mov	w0, 24
	bl	dprint_normal
.L254:
	add	x0, x19, 2432
	add	x1, x0, 16384
	ldrsb	w1, [x1, 1296]
	cbz	w1, .L255
	add	x1, x0, 24576
	ldr	w1, [x1, 756]
	cmp	w1, 3
	beq	.L334
.L255:
	add	x0, x19, 2432
	add	x0, x0, 36864
	ldr	x0, [x0, 1128]
	str	wzr, [x0, 1060]
.L256:
	add	x0, x19, 2432
	add	x1, x0, 36864
	add	x2, x0, 16384
	ldr	x3, [x1, 1128]
	strb	wzr, [x3, 2]
	ldrsb	w2, [x2, 1296]
	cbnz	w2, .L257
	add	x0, x0, 24576
	ldrb	w2, [x0, 364]
	cmp	w2, 1
	beq	.L335
.L257:
	add	x21, x19, 2432
	ldrb	w0, [x21, 2]
	cmp	w0, 1
	ccmp	w0, 5, 4, hi
	bne	.L258
	ldr	w1, [x19, 5564]
	mov	w0, 2
	ldr	w3, [x19, 5568]
	ldr	w2, [x19, 5572]
	cmp	w1, wzr
	csinc	w0, w0, wzr, ne
	str	w0, [x19, 5564]
	cmp	w3, w2
	beq	.L260
	ldr	x2, .LC47
	mov	w1, 1197
	mov	w0, 11
	bl	dprint_normal
	ldr	w1, [x19, 5568]
	mov	w2, 0
	ldr	w0, [x24, 192]
	bl	FSP_SetRef
	ldr	w2, [x19, 5572]
.L260:
	ldr	w1, [x19, 5576]
	add	x21, x19, 2432
	str	w2, [x19, 5568]
	mov	w2, 1
	str	w1, [x19, 5572]
	ldr	w0, [x24, 192]
	bl	FSP_SetRef
	ldr	w0, [x24, 192]
	ldr	w1, [x19, 5568]
	bl	FSP_ReleasePmv
	ldrb	w0, [x21, 2]
	cmp	w0, 1
	ccmp	w0, 5, 4, hi
	bne	.L262
	add	x0, x21, 36864
	mov	w2, 1
	ldr	x1, [x0, 1144]
	strb	wzr, [x1]
	ldr	x1, [x0, 1128]
	strb	w2, [x1]
	ldr	x2, [x0, 1136]
	ldr	x1, [x0, 1128]
	str	x1, [x0, 1136]
	str	x2, [x0, 1144]
.L262:
	ldr	w1, [x19, 5576]
	add	x27, x19, 2432
	ldr	w0, [x24, 192]
	bl	FSP_GetLogicFs
	mov	x21, x0
	ldr	w1, [x19, 5568]
	ldr	w0, [x24, 192]
	bl	FSP_GetLogicFs
	mov	x26, x0
	ldr	w1, [x19, 5572]
	ldr	w0, [x24, 192]
	bl	FSP_GetLogicFs
	mov	x25, x0
	cmp	x21, xzr
	ccmp	x26, xzr, 4, ne
	ccmp	x0, xzr, 4, ne
	beq	.L336
	ldr	x1, [x21, 24]
	cbz	x1, .L266
	ldr	x0, [x21, 32]
	cbz	x0, .L266
	add	x0, x27, 16384
	ldrsb	w0, [x0, 1296]
	cbz	w0, .L269
	add	x27, x27, 24576
	ldr	w0, [x27, 756]
	cmp	w0, 3
	bne	.L269
	ldr	x0, .LC45
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L269
	str	w0, [x21, 76]
	b	.L270
	.p2align 3
.L241:
	ldrsb	w1, [x19, 2439]
	cmp	w1, 2
	beq	.L337
.L243:
	ldr	w0, [x19, 5536]
	ldrb	w1, [x19, 2441]
	lsl	w0, w0, 4
	add	w0, w0, 63
	and	w0, w0, -64
	str	w0, [x19, 5560]
	cbz	w1, .L287
	mov	w0, 1
.L288:
	add	x1, x19, 2432
	ldrsb	w2, [x1, 3]
	cmp	w2, 3
	bne	.L244
	ldrb	w1, [x1, 10]
	cmp	w1, 1
	beq	.L244
.L246:
	add	x0, x19, 2432
	add	x1, x0, 16384
	ldrsb	w1, [x1, 1296]
	cbnz	w1, .L278
	add	x1, x0, 36864
	add	x0, x0, 24576
	ldr	x2, [x1, 1128]
	strb	wzr, [x2, 1027]
	ldr	x2, [x1, 1128]
	ldrb	w3, [x0, 603]
	strb	w3, [x2, 1028]
	ldrb	w3, [x0, 611]
	ldr	x2, [x1, 1128]
	sub	w1, w3, #2
	uxtb	w1, w1
	cmp	w1, 1
	bls	.L294
	cmp	w3, 4
	mov	w1, 0
	beq	.L338
.L279:
	add	x22, x19, 2432
	strb	w1, [x2, 1030]
	strb	w1, [x2, 1029]
	mov	w0, 1
	str	w0, [x19, 5584]
	strb	wzr, [x22, 3360]
	ldr	x0, [x19, 5680]
	ldr	x23, [x19, 5728]
	bl	BsPos
	cmp	w0, wzr
	add	w2, w0, 7
	ldr	w21, [x19, 5748]
	csel	w1, w2, w0, lt
	ldr	x0, [x19, 5680]
	asr	w1, w1, 3
	add	x1, x23, x1, sxtw
	str	x1, [x19, 5776]
	bl	BsPos
	add	w2, w0, 7
	cmp	w0, wzr
	csel	w1, w2, w0, lt
	ldr	x0, [x19, 5680]
	add	w1, w21, w1, asr 3
	str	w1, [x19, 5796]
	bl	BsPos
	and	w1, w0, 7
	ldr	x0, [x19, 5680]
	str	w1, [x19, 5800]
	ldr	w21, [x19, 5756]
	bl	BsPos
	ldr	w1, [x19, 5616]
	lsl	w21, w21, 3
	ldr	w2, [x19, 5620]
	sub	w0, w21, w0
	str	w0, [x19, 5804]
	mul	w1, w1, w2
	sub	w1, w1, #1
	str	w1, [x19, 5808]
	ldrb	w1, [x19, 2434]
.L280:
	add	x21, x19, 2432
	mov	w3, 1
	mov	w2, 0
	mov	x0, x21
	bl	VC1_Vfmw_BuildRefList
	mov	w25, w0
	cbz	w0, .L339
	mov	w25, 1
	b	.L313
	.p2align 3
.L287:
	add	x2, x19, 2432
	add	x1, x2, 36864
	add	x0, x2, 32768
	add	x2, x1, 1024
	add	x0, x0, 3648
	stp	x0, x0, [x2, 104]
	stp	x0, x0, [x2, 120]
	ldrsb	w0, [x19, 2439]
	cbz	w0, .L248
.L252:
	add	w2, w21, 1
	lsl	w26, w24, 4
	mov	w1, w26
	mov	x0, x20
	add	w2, w2, w2, lsr 31
	mov	w25, 0
	asr	w2, w2, 1
	lsl	w2, w2, 5
	bl	VC1_ArrangeVahbMem
	cmp	w0, 1
	bne	.L313
	add	x1, x19, 2432
	ldr	w6, [x19, 5544]
	add	x1, x1, 16384
	ldr	w7, [x19, 5548]
	ldr	x2, .LC40
	mov	w4, w26
	lsl	w5, w21, 4
	lsl	w7, w7, 4
	ldrsb	w3, [x1, 1296]
	lsl	w6, w6, 4
	mov	w1, 1142
	bl	dprint_normal
	str	w24, [x19, 5544]
	str	w21, [x19, 5548]
	b	.L247
	.p2align 3
.L331:
	add	w23, w23, 1
	add	w23, w23, w23, lsr 31
	asr	w23, w23, 1
	b	.L325
	.p2align 3
.L333:
	ldr	x2, .LC42
	mov	w1, 1152
	mov	w0, 1
	mov	w25, 0
	bl	dprint_normal
	b	.L313
	.p2align 3
.L248:
	add	x26, x20, 53248
	add	x25, x20, 49152
	add	x1, x25, 3680
	ldr	w0, [x26, 192]
	bl	FSP_ClearNotInVoQueue
	ldr	w1, [x19, 5572]
	ldr	w0, [x26, 192]
	bl	FSP_GetFsImagePtr
	mov	x27, x0
	cbz	x0, .L250
	ldr	w0, [x26, 192]
	ldr	x1, [x27, 168]
	bl	FreeUsdByDec
	ldr	w0, [x26, 192]
	ldr	x1, [x27, 176]
	bl	FreeUsdByDec
	ldr	w0, [x26, 192]
	ldr	x1, [x27, 184]
	bl	FreeUsdByDec
	ldr	w0, [x26, 192]
	ldr	x1, [x27, 192]
	bl	FreeUsdByDec
	stp	xzr, xzr, [x27, 168]
	stp	xzr, xzr, [x27, 184]
	ldr	w1, [x19, 5572]
	ldr	w0, [x26, 192]
	bl	FSP_ClearLogicFs
	ldr	w1, [x19, 5568]
	ldr	w0, [x26, 192]
	bl	FSP_ClearLogicFs
	ldr	w0, [x26, 192]
	bl	FSP_GetNullLogicFs
	str	w0, [x19, 5568]
	str	w0, [x19, 5572]
.L250:
	add	x0, x20, 40960
	add	x1, x25, 1985
	add	x0, x0, 2297
	str	wzr, [x19, 5564]
	.p2align 2
.L251:
	strb	wzr, [x0]
	strb	wzr, [x0, -1]
	add	x0, x0, 1576
	cmp	x0, x1
	bne	.L251
	b	.L252
	.p2align 3
.L269:
	str	wzr, [x21, 76]
.L270:
	ldr	x0, [x25, 24]
	cbz	x0, .L271
	ldr	w0, [x0, 4]
.L272:
	str	w0, [x20, 124]
	add	x0, x19, 2432
	ldr	x1, [x21, 40]
	ldr	w1, [x1, 8]
	str	w1, [x20, 128]
	ldr	x1, [x25, 40]
	ldr	w1, [x1, 8]
	str	w1, [x20, 132]
	ldr	x1, [x21, 24]
	ldr	w1, [x1, 4]
	str	w1, [x20, 116]
	ldr	x1, [x21, 24]
	ldr	w1, [x1, 44]
	str	w1, [x20, 176]
	ldr	x1, [x21, 24]
	ldr	w1, [x1, 48]
	str	w1, [x20, 180]
	ldr	x1, [x21, 24]
	ldr	w1, [x1, 72]
	str	w1, [x20, 184]
	ldr	x1, [x21, 24]
	ldr	w1, [x1, 64]
	str	w1, [x20, 188]
	ldr	x1, [x21, 24]
	ldr	w1, [x1, 68]
	str	w1, [x20, 192]
	ldrb	w1, [x21, 424]
	strb	w1, [x20, 91]
	ldrb	w1, [x19, 2434]
	cmp	w1, 5
	beq	.L340
	ldr	x0, [x21, 24]
	ldr	w0, [x0, 4]
	stp	w0, wzr, [x20, 196]
	ldr	x0, [x26, 24]
	cbz	x0, .L341
.L327:
	ldr	w0, [x0, 4]
	str	w0, [x20, 120]
	b	.L246
	.p2align 3
.L337:
	strb	wzr, [x19, 2439]
	b	.L243
	.p2align 3
.L258:
	ldr	w0, [x19, 5564]
	cmp	w0, 1
	bhi	.L262
	ldr	w1, [x19, 5576]
	mov	w25, 0
	ldr	w0, [x24, 192]
	add	x21, x21, 36864
	bl	FSP_ClearLogicFs
	ldr	x2, .LC49
	mov	w1, 1214
	.p2align 2
.L329:
	ldr	x3, [x21, 1128]
	mov	w0, 1
	strb	wzr, [x3]
	ldr	x3, [x21, 1128]
	strb	wzr, [x3, 1]
	bl	dprint_normal
	b	.L313
	.p2align 3
.L278:
	add	x1, x0, 36864
	add	x0, x0, 24576
	ldr	x2, [x1, 1128]
	ldr	w3, [x0, 756]
	strb	w3, [x2, 1027]
	ldr	x2, [x1, 1128]
	ldrb	w3, [x0, 713]
	strb	w3, [x2, 1028]
	ldrb	w3, [x0, 726]
	ldr	x4, [x1, 1128]
	sub	w2, w3, #2
	ldrb	w1, [x0, 753]
	uxtb	w2, w2
	cmp	w2, 1
	bls	.L296
	cmp	w3, 4
	mov	w2, 0
	beq	.L342
.L281:
	add	x0, x4, x1, sxtw
	strb	w2, [x0, 1029]
	ldr	w3, [x19, 5584]
	cbz	w3, .L282
	subs	w3, w3, #1
	beq	.L343
	add	x1, x20, 16384
	mov	w2, 0
	add	x1, x1, 1696
	.p2align 2
.L285:
	ldr	w0, [x1, 72]
	add	x1, x1, 56
	strb	w2, [x1, -56]
	add	w2, w2, 1
	cmp	w2, 254
	mul	w0, w22, w0
	ccmp	w3, w2, 0, le
	sub	w0, w0, #1
	str	w0, [x1, -40]
	bhi	.L285
	uxtb	w1, w3
.L284:
	uxtw	x3, w3
	add	x2, x19, 2432
	lsl	x0, x3, 3
	sub	w23, w23, #1
	sub	x3, x0, x3
	add	x3, x2, x3, lsl 3
	strb	w1, [x3, 3360]
	str	w23, [x3, 3376]
	ldrb	w1, [x19, 2434]
	cmp	w1, 2
	bne	.L280
	add	x2, x2, 24576
	ldrb	w0, [x2, 743]
	ldr	w2, [x2, 860]
	mul	w2, w0, w2
	asr	w2, w2, 8
	str	w2, [x19, 5592]
	sub	w0, w0, w2
	subs	w0, w0, #1
	csel	w0, w0, wzr, pl
	str	w0, [x19, 5596]
	b	.L280
	.p2align 3
.L335:
	ldr	x1, [x1, 1128]
	ldrb	w0, [x0, 602]
	strb	w0, [x1, 2]
	b	.L257
	.p2align 3
.L334:
	ldr	x1, .LC45
	ldr	w1, [x1]
	cmp	w1, 1
	bne	.L255
	add	x0, x0, 36864
	ldr	x0, [x0, 1128]
	str	w1, [x0, 1060]
	b	.L256
	.p2align 3
.L296:
	mov	w2, 1
	b	.L281
	.p2align 3
.L294:
	mov	w1, 1
	b	.L279
.L271:
	ldr	w0, [x1, 4]
	b	.L272
	.p2align 3
.L336:
	ldr	w1, [x19, 5576]
	ldr	w0, [x24, 192]
	bl	FSP_ClearLogicFs
	add	x0, x27, 36864
	mov	w3, 1236
	ldr	x2, .LC51
	mov	x6, x25
	mov	x5, x26
	mov	x4, x21
	ldr	x7, [x0, 1128]
	mov	w1, w3
	strb	wzr, [x7]
	ldr	x0, [x0, 1128]
	strb	wzr, [x0, 1]
	mov	w0, 0
	bl	dprint_normal
	ldrb	w0, [x27, 2]
	cmp	w0, 5
	beq	.L344
.L265:
	ldr	x2, .LC53
	mov	w1, 1243
	mov	w0, 1
	mov	w25, 0
	bl	dprint_normal
	b	.L313
	.p2align 3
.L339:
	add	x20, x20, 53248
	ldr	w1, [x19, 5576]
	add	x21, x21, 36864
	ldr	w0, [x20, 192]
	bl	FSP_ClearLogicFs
	ldr	x2, .LC57
	mov	w1, 1373
	b	.L329
	.p2align 3
.L282:
	mov	w0, 1
	mov	w1, 0
	str	w0, [x19, 5584]
	b	.L284
	.p2align 3
.L344:
	ldr	w0, [x19, 5636]
	cmp	w0, wzr
	ble	.L265
	sub	w0, w0, #1
	str	w0, [x19, 5636]
	b	.L265
	.p2align 3
.L340:
	ldr	w1, [x26, 76]
	add	x0, x0, 36864
	str	w1, [x21, 76]
	ldr	x1, [x0, 1144]
	ldr	x0, [x0, 1128]
	ldr	w1, [x1, 1060]
	str	w1, [x0, 1060]
	ldr	w0, [x19, 5636]
	add	w0, w0, 1
	str	w0, [x19, 5636]
	ldr	x0, [x21, 32]
	ldr	w0, [x0, 4]
	stp	w0, wzr, [x20, 196]
	ldr	x0, [x26, 32]
	cbnz	x0, .L327
	ldr	x0, [x21, 32]
	b	.L327
	.p2align 3
.L266:
	ldr	w1, [x19, 5576]
	add	x20, x19, 2432
	ldr	w0, [x24, 192]
	bl	FSP_ClearLogicFs
	add	x3, x20, 36864
	ldr	x2, .LC55
	mov	w1, 1253
	mov	w0, 0
	ldr	x4, [x3, 1128]
	strb	wzr, [x4]
	ldr	x3, [x3, 1128]
	strb	wzr, [x3, 1]
	ldr	w3, [x19, 5568]
	ldr	w5, [x19, 5572]
	ldr	w4, [x19, 5576]
	ldp	x6, x7, [x21, 24]
	bl	dprint_normal
	ldrb	w0, [x19, 2434]
	cmp	w0, 5
	beq	.L345
.L268:
	ldr	x2, .LC53
	mov	w1, 1260
	mov	w0, 1
	mov	w25, 0
	bl	dprint_normal
	b	.L313
	.p2align 3
.L342:
	ldrb	w0, [x0, 727]
	sub	w0, w0, #2
	uxtb	w0, w0
	cmp	w0, 1
	cset	w2, ls
	b	.L281
	.p2align 3
.L338:
	ldrb	w0, [x0, 612]
	sub	w0, w0, #2
	uxtb	w0, w0
	cmp	w0, 1
	cset	w1, ls
	b	.L279
.L341:
	ldr	x0, [x21, 24]
	b	.L327
.L345:
	ldr	w0, [x19, 5636]
	cmp	w0, wzr
	ble	.L268
	sub	w0, w0, #1
	str	w0, [x19, 5636]
	b	.L268
.L343:
	mov	w1, 0
	mov	w3, 0
	b	.L284
	.size	VC1_Vfmw_PrepareDecode, .-VC1_Vfmw_PrepareDecode
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
.LC45:
	.xword	g_Use_FFAPT_Enable
	.align	3
.LC47:
	.xword	.LC46
	.align	3
.LC49:
	.xword	.LC48
	.align	3
.LC51:
	.xword	.LC50
	.align	3
.LC53:
	.xword	.LC52
	.align	3
.LC55:
	.xword	.LC54
	.align	3
.LC57:
	.xword	.LC56
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecMvrange
	.type	VC1_DecMvrange, %function
VC1_DecMvrange:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC58
	mov	w1, 3
	mov	x0, x19
	add	x2, x2, 56
	ldp	x8, x9, [x2]
	ldp	x6, x7, [x2, 16]
	ldp	x4, x5, [x2, 32]
	ldp	x2, x3, [x2, 48]
	stp	x8, x9, [x29, 32]
	stp	x6, x7, [x29, 48]
	stp	x4, x5, [x29, 64]
	stp	x2, x3, [x29, 80]
	bl	BsShow
	add	x1, x29, 96
	add	x1, x1, x0, sxtw 3
	mov	x0, x19
	ldp	w19, w1, [x1, -64]
	bl	BsSkip
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.size	VC1_DecMvrange, .-VC1_DecMvrange
	.align	3
.LC58:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecTransacfrm
	.type	VC1_DecTransacfrm, %function
VC1_DecTransacfrm:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	w2, 2
	mov	w3, 1
	mov	w1, w2
	mov	x0, x19
	stp	xzr, xzr, [x29, 32]
	str	w3, [x29, 36]
	stp	w3, w3, [x29, 44]
	stp	w2, w2, [x29, 52]
	str	w2, [x29, 60]
	stp	xzr, xzr, [x29, 64]
	stp	xzr, xzr, [x29, 80]
	bl	BsShow
	add	x1, x29, 96
	add	x1, x1, x0, sxtw 3
	mov	x0, x19
	ldp	w19, w1, [x1, -64]
	bl	BsSkip
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.size	VC1_DecTransacfrm, .-VC1_DecTransacfrm
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_SetCurPicResolutionInfo
	.type	VC1_SetCurPicResolutionInfo, %function
VC1_SetCurPicResolutionInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, 1
	beq	.L350
	cmp	w20, 2
	beq	.L351
	ldr	w1, [x19, 3104]
	ldr	w0, [x19, 3108]
	cbz	w20, .L355
	add	w1, w1, 1
	add	w0, w0, 1
	add	w1, w1, w1, lsr 31
	add	w0, w0, w0, lsr 31
	asr	w1, w1, 1
	asr	w0, w0, 1
.L355:
	str	w1, [x19, 3184]
	str	w0, [x19, 3188]
.L353:
	mul	w2, w1, w0
	str	w2, [x19, 3192]
	lsl	w1, w1, 4
	lsl	w0, w0, 4
	str	w1, [x19, 3176]
	str	w0, [x19, 3180]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L351:
	ldr	w0, [x19, 3108]
	ldr	w1, [x19, 3104]
	add	w0, w0, 1
	str	w1, [x19, 3184]
	add	w0, w0, w0, lsr 31
	asr	w0, w0, 1
	str	w0, [x19, 3188]
	b	.L353
	.p2align 3
.L350:
	ldr	w1, [x19, 3104]
	ldr	w0, [x19, 3108]
	add	w1, w1, 1
	str	w0, [x19, 3188]
	add	w1, w1, w1, lsr 31
	asr	w1, w1, 1
	str	w1, [x19, 3184]
	b	.L353
	.size	VC1_SetCurPicResolutionInfo, .-VC1_SetCurPicResolutionInfo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecMvmodeProgrP
	.type	VC1_DecMvmodeProgrP, %function
VC1_DecMvmodeProgrP:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	uxtb	w21, w1
	bl	_mcount
	mov	w1, 4
	mov	x0, x20
	bl	BsShow
	cmp	w0, 1
	ldr	x1, .LC60
	add	x2, x1, 120
	ldp	x4, x5, [x1, 144]
	ldr	w6, [x1, 136]
	ldp	x2, x3, [x2]
	stp	x2, x3, [x29, 48]
	add	x2, x29, 72
	ldr	w1, [x1, 160]
	str	w6, [x29, 64]
	str	w1, [x29, 88]
	stp	x4, x5, [x2]
	ble	.L364
	cmp	w0, 3
	ble	.L362
	cmp	w0, 8
	mov	w1, 2
	csinc	w1, w1, wzr, lt
	cset	w19, lt
.L358:
	mov	x0, x20
	sbfiz	x19, x19, 2, 32
	bl	BsSkip
	cmp	w21, 12
	add	x0, x29, 96
	add	x19, x0, x19
	bhi	.L365
.L359:
	ldr	w0, [x19, -24]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L362:
	mov	w1, 3
	mov	x0, x20
	mov	w19, 2
	bl	BsSkip
	sbfiz	x19, x19, 2, 32
	cmp	w21, 12
	add	x0, x29, 96
	add	x19, x0, x19
	bls	.L359
.L365:
	ldr	w0, [x19, -48]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L364:
	mov	w1, 4
	mov	w19, 3
	cbz	w0, .L358
	mov	w19, w1
	b	.L358
	.size	VC1_DecMvmodeProgrP, .-VC1_DecMvmodeProgrP
	.align	3
.LC60:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecMvmodeInterB
	.type	VC1_DecMvmodeInterB, %function
VC1_DecMvmodeInterB:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	uxtb	w21, w1
	bl	_mcount
	mov	w1, 3
	mov	x0, x20
	bl	BsShow
	str	wzr, [x29, 88]
	add	x1, x29, 72
	mov	w3, 1
	mov	w2, 2
	cmp	w0, w3
	stp	w2, wzr, [x29, 64]
	stp	xzr, xzr, [x1]
	str	w3, [x29, 72]
	mov	w1, 3
	stp	w1, w3, [x29, 56]
	stp	w2, w1, [x29, 80]
	ble	.L373
	cmp	w0, 4
	csinc	w1, w2, wzr, lt
	cset	w19, lt
.L368:
	mov	x0, x20
	bl	BsSkip
	cmp	w21, 12
	sbfiz	x2, x19, 2, 32
	add	x0, x29, 96
	add	x2, x0, x2
	bhi	.L374
	ldr	w0, [x2, -24]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L374:
	ldr	w0, [x2, -40]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L373:
	mov	w19, w1
	cbz	w0, .L368
	mov	w19, w2
	b	.L368
	.size	VC1_DecMvmodeInterB, .-VC1_DecMvmodeInterB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecMvmode2
	.type	VC1_DecMvmode2, %function
VC1_DecMvmode2:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	uxtb	w21, w1
	bl	_mcount
	mov	w1, 3
	mov	x0, x20
	bl	BsShow
	mov	w3, 1
	mov	w1, 3
	mov	w2, 2
	cmp	w0, w3
	stp	w1, w3, [x29, 48]
	stp	w2, wzr, [x29, 56]
	stp	w3, wzr, [x29, 64]
	stp	w2, w1, [x29, 72]
	ble	.L382
	cmp	w0, 4
	csinc	w1, w2, wzr, lt
	cset	w19, lt
.L377:
	mov	x0, x20
	bl	BsSkip
	cmp	w21, 12
	sbfiz	x2, x19, 2, 32
	add	x0, x29, 80
	add	x2, x0, x2
	bhi	.L383
	ldr	w0, [x2, -16]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L383:
	ldr	w0, [x2, -32]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L382:
	mov	w19, w1
	cbz	w0, .L377
	mov	w19, w2
	b	.L377
	.size	VC1_DecMvmode2, .-VC1_DecMvmode2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecBfractionSMP
	.type	VC1_DecBfractionSMP, %function
VC1_DecBfractionSMP:
	stp	x29, x30, [sp, -272]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	mov	x21, x3
	mov	x22, x2
	bl	_mcount
	ldr	x0, .LC62
	add	x2, x0, 168
	add	x1, x0, 200
	add	x3, x0, 232
	add	x4, x0, 288
	ldr	w5, [x0, 192]
	ldp	x6, x7, [x2]
	stp	x6, x7, [x29, 64]
	add	x2, x0, 344
	ldr	x6, [x0, 184]
	str	x6, [x29, 80]
	ldr	x0, [x0, 216]
	ldp	x6, x7, [x1]
	stp	x6, x7, [x29, 96]
	str	w5, [x29, 88]
	ldr	x7, [x3, 48]
	ldr	w5, [x1, 24]
	ldr	x6, [x4, 48]
	str	x0, [x29, 112]
	ldp	x0, x1, [x3]
	stp	x0, x1, [x29, 160]
	str	x7, [x29, 208]
	ldp	x0, x1, [x2]
	str	x6, [x29, 264]
	ldp	x6, x7, [x2, 16]
	add	x2, x29, 216
	str	w5, [x29, 120]
	ldp	x8, x9, [x4]
	stp	x0, x1, [x29, 128]
	stp	x8, x9, [x2]
	add	x2, x29, 232
	mov	w1, 3
	ldp	x8, x9, [x4, 16]
	ldp	x4, x5, [x4, 32]
	stp	x8, x9, [x2]
	add	x2, x29, 248
	mov	x0, x20
	stp	x4, x5, [x2]
	ldp	x4, x5, [x3, 16]
	ldp	x2, x3, [x3, 32]
	stp	x4, x5, [x29, 176]
	stp	x2, x3, [x29, 192]
	stp	x6, x7, [x29, 144]
	bl	BsShow
	cmp	w0, 6
	mov	w23, w0
	bgt	.L385
	mov	w1, 3
	mov	x0, x20
	bl	BsSkip
	strb	w23, [x21]
	add	x0, x29, 272
	add	x0, x0, x23, sxtw 2
	ldr	w2, [x0, -208]
	ldr	w1, [x0, -176]
.L386:
	sub	w1, w1, #1
	add	x3, x29, 272
	mov	w0, 0
	add	x1, x3, x1, sxtw 2
	ldr	w1, [x1, -144]
	mul	w1, w1, w2
	str	w1, [x19]
.L388:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 272
	ret
	.p2align 3
.L385:
	mov	w1, 7
	mov	x0, x20
	bl	BsGet
	and	w1, w0, 15
	cmp	w1, 15
	beq	.L390
	sub	w0, w0, #112
	cmp	w0, 13
	bhi	.L389
	add	x2, x29, 272
	add	w1, w1, 7
	add	x0, x2, x0, sxtw 2
	strb	w1, [x21]
	ldr	w2, [x0, -112]
	ldr	w1, [x0, -56]
	b	.L386
	.p2align 3
.L390:
	mov	w1, 4
	strb	w1, [x22]
	mov	w0, 22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 272
	ret
	.p2align 3
.L389:
	mov	w0, -1
	b	.L388
	.size	VC1_DecBfractionSMP, .-VC1_DecBfractionSMP
	.align	3
.LC62:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecBfraction
	.type	VC1_DecBfraction, %function
VC1_DecBfraction:
	stp	x29, x30, [sp, -256]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x19, .LC68
	add	x9, x29, 200
	add	x3, x19, 168
	add	x2, x19, 200
	add	x0, x19, 232
	add	x1, x19, 288
	ldr	w6, [x19, 192]
	ldp	x4, x5, [x3]
	ldp	x2, x3, [x2]
	stp	x2, x3, [x29, 80]
	ldp	x2, x3, [x0]
	stp	x4, x5, [x29, 48]
	stp	x2, x3, [x29, 144]
	ldp	x4, x5, [x1]
	ldp	x2, x3, [x0, 16]
	stp	x4, x5, [x9]
	stp	x2, x3, [x29, 160]
	ldp	x4, x5, [x1, 32]
	ldp	x2, x3, [x1, 16]
	ldp	x0, x1, [x0, 32]
	stp	x0, x1, [x29, 176]
	add	x0, x29, 216
	ldr	x7, [x19, 184]
	ldr	x8, [x19, 216]
	mov	w1, 3
	str	x7, [x29, 64]
	stp	x2, x3, [x0]
	add	x2, x19, 344
	add	x3, x29, 232
	ldr	w7, [x19, 224]
	mov	x0, x22
	str	w6, [x29, 72]
	ldr	x6, [x19, 280]
	stp	x4, x5, [x3]
	str	x8, [x29, 96]
	str	w7, [x29, 104]
	ldr	x8, [x19, 336]
	str	x6, [x29, 192]
	ldp	x6, x7, [x2]
	ldp	x2, x3, [x2, 16]
	str	x8, [x29, 248]
	stp	x6, x7, [x29, 112]
	stp	x2, x3, [x29, 128]
	bl	BsShow
	cmp	w0, 6
	mov	w20, w0
	bgt	.L392
	mov	w1, 3
	mov	x0, x22
	bl	BsSkip
	add	x0, x29, 256
	add	x0, x0, x20, sxtw 2
	ldr	w5, [x0, -176]
	ldr	w1, [x0, -208]
	sub	w0, w5, #1
	cmp	w0, 7
	bhi	.L396
.L398:
	add	x2, x29, 256
	add	x0, x2, x0, sxtw 2
	ldr	w0, [x0, -144]
	mul	w0, w1, w0
.L397:
	str	w0, [x21]
.L394:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 256
	ret
	.p2align 3
.L392:
	mov	w1, 7
	mov	x0, x22
	bl	BsGet
	and	w20, w0, 15
	sub	w1, w20, #14
	add	w20, w20, 7
	cmp	w1, 1
	bls	.L394
	sub	w1, w0, #112
	cmp	w1, 13
	bhi	.L395
	add	x0, x29, 256
	add	x0, x0, x1, sxtw 2
	ldr	w5, [x0, -56]
	ldr	w1, [x0, -112]
	sub	w0, w5, #1
	cmp	w0, 7
	bls	.L398
.L396:
	mov	w4, 2292
	ldr	x2, .LC72
	add	x3, x19, 376
	mov	w1, w4
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	b	.L397
	.p2align 3
.L395:
	mov	w4, 2282
	ldr	x2, .LC70
	mov	w5, w0
	mov	w1, w4
	add	x3, x19, 376
	mov	w0, 1
	bl	dprint_normal
	mov	w4, 2292
	ldr	x2, .LC72
	mov	w5, 0
	add	x3, x19, 376
	mov	w1, w4
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	b	.L397
	.size	VC1_DecBfraction, .-VC1_DecBfraction
	.align	3
.LC68:
	.xword	.LANCHOR0
	.align	3
.LC70:
	.xword	.LC69
	.align	3
.LC72:
	.xword	.LC71
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_VopDQuant
	.type	VC1_VopDQuant, %function
VC1_VopDQuant:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	uxtb	w21, w1
	uxtb	w20, w2
	mov	x19, x3
	bl	_mcount
	cmp	w21, 2
	beq	.L417
	mov	w1, 1
	mov	x0, x22
	bl	BsGet
	uxtb	w21, w0
	cmp	w21, 1
	strb	w21, [x19]
	beq	.L418
.L403:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L417:
	mov	w0, 1
	mov	w1, 3
	strb	w0, [x19, 3]
	strb	w0, [x19]
	mov	x0, x22
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 7
	strb	w0, [x19, 4]
	beq	.L419
	add	w20, w20, 1
	add	w0, w0, w20
	strb	w0, [x19, 8]
.L402:
	mov	w0, 1
	str	w0, [x19, 12]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L418:
	mov	w1, 2
	mov	x0, x22
	bl	BsGet
	uxtb	w1, w0
	strb	w1, [x19, 1]
	cbnz	w1, .L405
	str	w21, [x19, 12]
.L406:
	ldr	w0, [x19]
	and	w0, w0, 16776960
	cmp	w0, 768
	beq	.L403
	mov	w0, 1
	mov	w1, 3
	strb	w0, [x19, 3]
	mov	x0, x22
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 7
	strb	w0, [x19, 4]
	beq	.L420
	add	w20, w20, 1
	add	w0, w0, w20
	strb	w0, [x19, 8]
	b	.L403
	.p2align 3
.L405:
	cmp	w1, 2
	beq	.L421
	cmp	w1, 1
	beq	.L422
	cmp	w1, 3
	beq	.L423
	str	wzr, [x19, 12]
	b	.L406
.L423:
	mov	w1, w21
	mov	x0, x22
	bl	BsGet
	uxtb	w0, w0
	mov	w1, 10
	mov	w2, 11
	cmp	w0, wzr
	strb	w0, [x19, 2]
	csel	w0, w1, w2, ne
	str	w0, [x19, 12]
	b	.L406
	.p2align 3
.L419:
	mov	w1, 5
	mov	x0, x22
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 5]
	strb	w0, [x19, 8]
	b	.L402
.L421:
	mov	x0, x22
	bl	BsGet
	and	w1, w0, 255
	strb	w0, [x19, 6]
	add	w0, w1, 6
	str	w0, [x19, 12]
	b	.L406
.L422:
	mov	w1, 2
	mov	x0, x22
	bl	BsGet
	and	w1, w0, 255
	strb	w0, [x19, 7]
	add	w0, w1, 2
	str	w0, [x19, 12]
	b	.L406
.L420:
	mov	w1, 5
	mov	x0, x22
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 5]
	strb	w0, [x19, 8]
	b	.L403
	.size	VC1_VopDQuant, .-VC1_VopDQuant
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecNormDiff6Tile
	.type	VC1_DecNormDiff6Tile, %function
VC1_DecNormDiff6Tile:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x23, x1
	mov	x20, x0
	mov	x0, x30
	mov	w22, 0
	bl	_mcount
	ldr	w24, [x23]
	b	.L425
	.p2align 3
.L435:
	mov	w22, w19
.L425:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	mov	w21, w0
	mov	w1, 3
	mov	x0, x20
	cbnz	w21, .L434
	bl	BsGet
	cmp	w0, 1
	mov	w19, w0
	mov	w1, w0
	mov	x0, x20
	bgt	.L444
	bne	.L428
	bl	BsGet
	cbz	w0, .L429
	cbz	w22, .L435
.L441:
	str	w24, [x23]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L434:
	mov	w0, 0
.L426:
	eor	w1, w0, 63
	cmp	w22, wzr
	csel	w0, w1, w0, ne
	mov	w21, 1
	str	w0, [x23]
.L446:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L444:
	sub	w19, w19, #2
	mov	w0, 1
	lsl	w0, w0, w19
	b	.L426
	.p2align 3
.L428:
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	cmp	w0, 255
	beq	.L441
	ldr	x1, .LC78
	add	x1, x1, 528
	ldr	w0, [x1, w0, sxtw 2]
	b	.L426
	.p2align 3
.L429:
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	ldr	x1, .LC78
	add	x1, x1, 400
	ldr	w1, [x1, w0, sxtw 2]
	cmp	w1, 2
	beq	.L445
	cmp	w1, 3
	beq	.L426
	str	w0, [x23]
	b	.L446
.L445:
	orr	w0, w0, 32
	b	.L426
	.size	VC1_DecNormDiff6Tile, .-VC1_DecNormDiff6Tile
	.align	3
.LC78:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvSeqHdr
	.type	VC1_Vfmw_ParseAdvSeqHdr, %function
VC1_Vfmw_ParseAdvSeqHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x22, x2
	bl	_mcount
	add	x19, x22, 16
	ldr	x3, .LC81
	mov	x2, 172
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	mov	x0, x20
	bl	BsPos
	str	w0, [x19, 168]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	mov	w0, 2
	mov	w1, 3
	strb	w0, [x22, 16]
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 1]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 2]
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 4]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 5]
	mov	w1, 12
	mov	x0, x20
	bl	BsGet
	uxth	w0, w0
	add	w2, w0, 1
	mov	w1, 12
	ubfiz	w2, w2, 1, 15
	mov	x0, x20
	strh	w2, [x19, 156]
	bl	BsGet
	uxth	w0, w0
	add	w2, w0, 1
	mov	w1, 1
	ubfiz	w2, w2, 1, 15
	mov	x0, x20
	strh	w2, [x19, 158]
	bl	BsGet
	strb	w0, [x19, 6]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 7]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 9]
	mov	w1, 2
	mov	x0, x20
	bl	BsSkip
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w21, w0
	cmp	w21, 1
	strb	w21, [x19, 10]
	beq	.L461
	ldrh	w1, [x19, 156]
	ldrh	w0, [x19, 158]
	strh	w1, [x19, 160]
	strh	w0, [x19, 162]
.L454:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 23]
	beq	.L455
.L457:
	mov	x0, x20
	bl	BsPos
	ldr	w1, [x19, 168]
	mov	w2, 1
	sub	w0, w0, w1
	str	w0, [x19, 168]
.L456:
	mov	w0, w2
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L455:
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 31
	strb	w0, [x19, 24]
	mov	w2, 0
	bhi	.L456
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 25]
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 26]
	ldrb	w1, [x19, 24]
	cbz	w1, .L457
	mov	w21, 0
	.p2align 2
.L458:
	add	x23, x22, x21, sxtw 1
	mov	w1, 16
	mov	x0, x20
	add	w21, w21, 1
	bl	BsGet
	strh	w0, [x23, 44]
	mov	w1, 16
	mov	x0, x20
	bl	BsGet
	strh	w0, [x23, 108]
	ldrb	w0, [x19, 24]
	cmp	w0, w21
	bgt	.L458
	b	.L457
	.p2align 3
.L461:
	mov	w1, 14
	mov	x0, x20
	bl	BsGet
	add	w0, w0, 1
	mov	w1, 14
	strh	w0, [x19, 160]
	mov	x0, x20
	bl	BsGet
	add	w0, w0, 1
	mov	w1, w21
	strh	w0, [x19, 162]
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 11]
	beq	.L462
.L450:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w1, w0
	cmp	w1, 1
	strb	w1, [x19, 15]
	beq	.L463
.L452:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 19]
	bne	.L454
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 20]
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 22]
	b	.L454
	.p2align 3
.L463:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 16]
	cbnz	w0, .L453
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 17]
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 18]
	b	.L452
	.p2align 3
.L462:
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 15
	strb	w0, [x19, 12]
	bne	.L450
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 13]
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 14]
	b	.L450
.L453:
	mov	w1, 16
	mov	x0, x20
	bl	BsGet
	strh	w0, [x19, 164]
	b	.L452
	.size	VC1_Vfmw_ParseAdvSeqHdr, .-VC1_Vfmw_ParseAdvSeqHdr
	.align	3
.LC81:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvEntptHdr
	.type	VC1_Vfmw_ParseAdvEntptHdr, %function
VC1_Vfmw_ParseAdvEntptHdr:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	bl	_mcount
	add	x19, x21, 188
	ldr	x3, .LC82
	mov	x2, 60
	mov	w1, 0
	mov	x0, x19
	add	x22, x21, 16
	ldr	x3, [x3, 96]
	blr	x3
	mov	x0, x20
	bl	BsPos
	str	w0, [x19, 56]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 188]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 1]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 2]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 4]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 5]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 6]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 7]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 9]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 10]
	ldrb	w0, [x22, 23]
	cmp	w0, 1
	beq	.L465
.L468:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 11]
	beq	.L485
.L483:
	ldrh	w0, [x19, 52]
.L470:
	ldrh	w1, [x19, 50]
	ldrh	w2, [x22, 156]
	cmp	w1, 15
	ccmp	w1, w2, 2, hi
	bls	.L471
	strh	w2, [x19, 50]
.L471:
	ldrh	w1, [x22, 158]
	cmp	w0, 15
	ccmp	w1, w0, 0, hi
	bcs	.L472
	strh	w1, [x19, 52]
.L472:
	ldrb	w1, [x19, 6]
	cmp	w1, 1
	beq	.L486
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 13]
	beq	.L487
.L474:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 15]
	beq	.L488
.L475:
	mov	x0, x20
	bl	BsPos
	ldr	w1, [x19, 56]
	sub	w1, w0, w1
	str	w1, [x19, 56]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L465:
	ldrb	w0, [x22, 24]
	cbz	w0, .L468
	mov	w21, 0
	.p2align 2
.L469:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	add	x1, x19, x21, sxtw
	add	w21, w21, 1
	strb	w0, [x1, 17]
	ldrb	w0, [x22, 24]
	cmp	w0, w21
	bgt	.L469
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 11]
	bne	.L483
.L485:
	mov	w1, 12
	mov	x0, x20
	bl	BsGet
	add	w0, w0, 1
	ubfiz	w0, w0, 1, 15
	mov	w1, 12
	strh	w0, [x19, 50]
	mov	x0, x20
	bl	BsGet
	add	w0, w0, 1
	ubfiz	w0, w0, 1, 15
	strh	w0, [x19, 52]
	b	.L470
	.p2align 3
.L488:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 16]
	b	.L475
	.p2align 3
.L486:
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 13]
	bne	.L474
	.p2align 2
.L487:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 14]
	b	.L474
	.size	VC1_Vfmw_ParseAdvEntptHdr, .-VC1_Vfmw_ParseAdvEntptHdr
	.align	3
.LC82:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecFcm
	.type	VC1_DecFcm, %function
VC1_DecFcm:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 2
	mov	x0, x20
	bl	BsShow
	cmp	w0, 1
	mov	w19, w0
	ble	.L492
	mov	w1, 2
	mov	x0, x20
	bl	BsSkip
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L492:
	mov	w1, 1
	mov	x0, x20
	mov	w19, 0
	bl	BsSkip
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1_DecFcm, .-VC1_DecFcm
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecAdvPtype
	.type	VC1_DecAdvPtype, %function
VC1_DecAdvPtype:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 4
	mov	x0, x19
	bl	BsShow
	cmp	w0, 7
	ble	.L495
	cmp	w0, 11
	bgt	.L499
	mov	w1, 2
	mov	w20, w1
.L494:
	mov	x0, x19
	bl	BsSkip
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L499:
	cmp	w0, 13
	ble	.L497
	cmp	w0, 14
	mov	w1, 4
	beq	.L498
	mov	w20, 5
	b	.L494
	.p2align 3
.L495:
	mov	w1, 1
	mov	x0, x19
	mov	w20, w1
	bl	BsSkip
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L497:
	mov	w1, 3
	mov	w20, 0
	b	.L494
	.p2align 3
.L498:
	mov	w20, w1
	b	.L494
	.size	VC1_DecAdvPtype, .-VC1_DecAdvPtype
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecRefdist
	.type	VC1_DecRefdist, %function
VC1_DecRefdist:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 5
	mov	x0, x20
	bl	BsShow
	cmp	w0, 23
	mov	w2, w0
	bgt	.L501
	mov	w1, 2
	mov	x0, x20
	asr	w19, w2, 3
	bl	BsSkip
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L501:
	cmp	w0, 27
	mov	w19, 3
	bgt	.L507
	mov	w1, w19
	mov	x0, x20
	bl	BsSkip
	mov	w0, w19
.L508:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L507:
	mov	w0, 5
	cmp	w2, 29
	mov	w19, 4
	csel	w19, w0, w19, gt
	mov	x0, x20
	mov	w1, w19
	bl	BsSkip
	mov	w0, w19
	b	.L508
	.size	VC1_DecRefdist, .-VC1_DecRefdist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecIntCompField
	.type	VC1_DecIntCompField, %function
VC1_DecIntCompField:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC83
	mov	w1, 2
	mov	x0, x19
	add	x2, x2, 592
	ldp	x4, x5, [x2]
	ldp	x2, x3, [x2, 16]
	stp	x4, x5, [x29, 32]
	stp	x2, x3, [x29, 48]
	bl	BsShow
	add	x1, x29, 64
	add	x1, x1, x0, sxtw 3
	mov	x0, x19
	ldp	w19, w1, [x1, -32]
	bl	BsSkip
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.size	VC1_DecIntCompField, .-VC1_DecIntCompField
	.align	3
.LC83:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_RecordSlcStream
	.type	VC1_RecordSlcStream, %function
VC1_RecordSlcStream:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	mov	x22, x2
	bl	_mcount
	add	x21, x21, 536
	ldr	w6, [x20, 3152]
	add	x5, x20, 3344
	ldr	x4, [x20, 3248]
	uxtw	x0, w6
	lsl	x3, x0, 3
	lsl	x1, x0, 2
	sub	x3, x3, x0
	sub	x0, x1, x0
	lsl	x3, x3, 3
	add	x19, x5, x3
	add	x21, x21, x0, lsl 2
	strb	w6, [x19, 16]
	ldr	w0, [x4, 32]
	ubfx	x0, x0, 3, 29
	add	x0, x22, x0
	str	x0, [x5, x3]
	ldr	w1, [x4, 32]
	and	w1, w1, 7
	str	w1, [x19, 24]
	ldr	w1, [x4, 24]
	ldr	w2, [x4, 32]
	lsl	w1, w1, 3
	sub	w1, w1, w2
	str	w1, [x19, 28]
	bl	MEM_Vir2Phy
	str	w0, [x19, 20]
	ldr	w0, [x20, 3332]
	str	w0, [x19, 48]
	ldr	x2, [x20, 3304]
	cbz	x2, .L511
	ldr	w0, [x20, 3320]
	cbnz	w0, .L530
.L511:
	mov	x2, 0
	str	xzr, [x19, 8]
	stp	wzr, wzr, [x19, 36]
	str	wzr, [x19, 44]
	str	wzr, [x19, 52]
.L512:
	ldr	w5, [x20, 3104]
	ldr	w0, [x20, 3108]
	ldrb	w1, [x20, 9]
	mul	w5, w0, w5
	sub	w5, w5, #1
	cbz	w1, .L513
	add	w0, w0, 1
	ldr	w4, [x21, 4]
	add	w0, w0, w0, lsr 31
	sub	w4, w4, w0, asr 1
	str	w4, [x19, 32]
	cmp	w5, w4
	ccmp	w4, wzr, 4, cc
	bgt	.L531
.L514:
	ldr	w0, [x19, 28]
	cmp	w0, wzr
	ble	.L516
	cbz	x2, .L517
	ldr	w0, [x19, 44]
	cmp	w0, wzr
	ble	.L516
.L517:
	ldr	w1, [x20, 3152]
	mov	w0, 1
	add	w1, w1, w0
	str	w1, [x20, 3152]
.L515:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L513:
	ldr	w4, [x21, 4]
	str	w4, [x19, 32]
	cmp	w5, w4
	bcs	.L514
	ldr	w3, [x21, 4]
	mov	w1, 4048
	ldr	x2, .LC88
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L530:
	str	x2, [x19, 8]
	str	wzr, [x19, 40]
	ldr	w0, [x20, 3328]
	lsl	w0, w0, 3
	str	w0, [x19, 44]
	ldr	w0, [x20, 3320]
	str	w0, [x19, 36]
	ldr	w0, [x20, 3336]
	str	w0, [x19, 52]
	b	.L512
	.p2align 3
.L531:
	ldr	x2, .LC86
	mov	w1, 4036
	ldr	w5, [x20, 3108]
	mov	w0, 1
	ldr	w3, [x21, 4]
	bl	dprint_normal
	mov	w0, 0
	b	.L515
	.p2align 3
.L516:
	ldr	x2, .LC90
	mov	w1, 4055
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VC1_RecordSlcStream, .-VC1_RecordSlcStream
	.align	3
.LC86:
	.xword	.LC85
	.align	3
.LC88:
	.xword	.LC87
	.align	3
.LC90:
	.xword	.LC89
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_UpdateAdvSPS
	.type	VC1_Vfmw_UpdateAdvSPS, %function
VC1_Vfmw_UpdateAdvSPS:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x1
	add	x20, x0, 24576
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	ldrh	w0, [x19, 238]
	ldrh	w1, [x20, 590]
	cmp	w1, w0
	beq	.L533
	add	w0, w0, 15
	asr	w0, w0, 4
	str	w0, [x21, 3104]
	ldrh	w0, [x19, 238]
	str	w0, [x21, 3120]
	ldrh	w0, [x19, 240]
	ldrh	w1, [x20, 592]
	cmp	w1, w0
	beq	.L534
.L535:
	add	w0, w0, 15
	asr	w0, w0, 4
	str	w0, [x21, 3108]
	ldrh	w0, [x19, 240]
	str	w0, [x21, 3124]
.L534:
	add	x1, x19, 16
	add	x0, x20, 368
	add	x19, x19, 188
	mov	x2, 172
	add	x20, x20, 540
	bl	memcpy
	ldp	x0, x1, [x19]
	stp	x0, x1, [x20]
	mov	w0, 1
	ldp	x2, x3, [x19, 16]
	stp	x2, x3, [x20, 16]
	ldp	x2, x3, [x19, 32]
	stp	x2, x3, [x20, 32]
	ldr	x1, [x19, 48]
	str	x1, [x20, 48]
	ldr	w1, [x19, 56]
	str	w1, [x20, 56]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L533:
	ldrh	w0, [x19, 240]
	ldrh	w1, [x20, 592]
	cmp	w1, w0
	bne	.L535
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	VC1_Vfmw_UpdateAdvSPS, .-VC1_Vfmw_UpdateAdvSPS
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_UpdataLastPicRNDCTRL
	.type	VC1_Vfmw_UpdataLastPicRNDCTRL, %function
VC1_Vfmw_UpdataLastPicRNDCTRL:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 16384
	ldrsb	w0, [x0, 1296]
	cbnz	w0, .L539
	mov	x0, x19
	bl	VC1_Vfmw_UpdataLastPicRNDCTRL.part.3
.L539:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1_Vfmw_UpdataLastPicRNDCTRL, .-VC1_Vfmw_UpdataLastPicRNDCTRL
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_DecPQUANT
	.type	VC1_Vfmw_DecPQUANT, %function
VC1_Vfmw_DecPQUANT:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x1, .LC91
	mov	x2, 128
	add	x0, x29, 32
	add	x1, x1, 624
	bl	memcpy
	mov	w0, w19
	cbnz	w20, .L541
	add	x0, x29, 160
	add	x19, x0, x19, sxtw 2
	ldr	w0, [x19, -128]
.L541:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 160
	ret
	.size	VC1_Vfmw_DecPQUANT, .-VC1_Vfmw_DecPQUANT
	.align	3
.LC91:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseSMPIPicHdr
	.type	VC1_Vfmw_ParseSMPIPicHdr, %function
VC1_Vfmw_ParseSMPIPicHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	mov	x23, x1
	bl	_mcount
	add	x19, x21, 248
	mov	w1, 7
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 5]
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w22, w0
	strb	w22, [x19, 6]
	mov	w1, 0
	cbz	w22, .L544
	ldrb	w24, [x21, 14]
	mov	w1, w22
	mov	w0, w24
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 104]
	cmp	w22, 8
	bls	.L555
	strb	wzr, [x19, 7]
.L546:
	cmp	w24, 1
	beq	.L556
	strb	wzr, [x19, 8]
.L548:
	ldrb	w0, [x21, 7]
	cmp	w0, 1
	beq	.L557
	strb	wzr, [x19, 9]
.L550:
	ldrb	w0, [x19, 3]
	sub	w0, w0, #2
	and	w0, w0, -3
	uxtb	w0, w0
	cbz	w0, .L553
	ldrb	w0, [x21, 4]
	cmp	w0, 1
	beq	.L558
.L553:
	ldrb	w1, [x19, 10]
.L552:
	mov	x0, x23
	bl	VC1_SetCurPicResolutionInfo
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 19]
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 20]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	mov	w1, 1
.L544:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L555:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 7]
	ldrb	w24, [x21, 14]
	b	.L546
	.p2align 3
.L557:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 9]
	b	.L550
	.p2align 3
.L556:
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	b	.L548
	.p2align 3
.L558:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	uxtb	w1, w0
	strb	w1, [x19, 10]
	b	.L552
	.size	VC1_Vfmw_ParseSMPIPicHdr, .-VC1_Vfmw_ParseSMPIPicHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseSMPPPicHdr
	.type	VC1_Vfmw_ParseSMPPPicHdr, %function
VC1_Vfmw_ParseSMPPPicHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	mov	x23, x1
	add	x19, x21, 248
	bl	_mcount
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w22, w0
	strb	w22, [x19, 6]
	cbz	w22, .L571
	ldrb	w24, [x21, 14]
	uxtb	w1, w0
	mov	w0, w24
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 104]
	cmp	w22, 8
	bls	.L582
	strb	wzr, [x19, 7]
.L563:
	cmp	w24, 1
	beq	.L583
	strb	wzr, [x19, 8]
.L565:
	ldrb	w0, [x21, 7]
	cmp	w0, 1
	beq	.L584
	strb	wzr, [x19, 9]
.L567:
	ldrb	w0, [x21, 4]
	cmp	w0, 1
	beq	.L568
	ldrb	w1, [x19, 10]
.L569:
	mov	x0, x23
	bl	VC1_SetCurPicResolutionInfo
	mov	x0, x20
	bl	BsPos
	mov	w3, w0
	ldr	x2, .LC93
	mov	w1, 2574
	mov	w0, 16
	bl	dprint_normal
	ldrb	w1, [x19, 104]
	mov	x0, x20
	bl	VC1_DecMvmodeProgrP
	uxtb	w0, w0
	cmp	w0, 4
	strb	w0, [x19, 11]
	beq	.L585
.L570:
	mov	w3, 0
	mov	x2, x21
	mov	x1, x23
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L571
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 15]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 16]
	ldrb	w1, [x21, 8]
	cbnz	w1, .L586
.L572:
	mov	x0, x20
	bl	BsPos
	mov	w3, w0
	ldr	x2, .LC95
	mov	w1, 2599
	mov	w0, 16
	bl	dprint_normal
	ldrb	w1, [x21, 9]
	cmp	w1, 1
	beq	.L587
.L574:
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 19]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	mov	w1, 1
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L571:
	mov	w1, 0
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L582:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 7]
	ldrb	w24, [x21, 14]
	b	.L563
	.p2align 3
.L586:
	ldrb	w2, [x19, 104]
	add	x3, x21, 272
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L572
	.p2align 3
.L585:
	ldrb	w1, [x19, 104]
	mov	x0, x20
	bl	VC1_DecMvmode2
	strb	w0, [x19, 12]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 13]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 14]
	b	.L570
	.p2align 3
.L568:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	uxtb	w1, w0
	strb	w1, [x19, 10]
	b	.L569
	.p2align 3
.L584:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 9]
	b	.L567
	.p2align 3
.L583:
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	b	.L565
	.p2align 3
.L587:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 17]
	bne	.L574
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 18]
	b	.L574
	.size	VC1_Vfmw_ParseSMPPPicHdr, .-VC1_Vfmw_ParseSMPPPicHdr
	.align	3
.LC93:
	.xword	.LC92
	.align	3
.LC95:
	.xword	.LC94
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseMPBPicHdr
	.type	VC1_Vfmw_ParseMPBPicHdr, %function
VC1_Vfmw_ParseMPBPicHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	mov	x24, x1
	add	x19, x21, 248
	bl	_mcount
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w22, w0
	strb	w22, [x19, 6]
	cbz	w22, .L598
	ldrb	w23, [x21, 14]
	uxtb	w1, w0
	mov	w0, w23
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 104]
	cmp	w22, 8
	bls	.L610
	strb	wzr, [x19, 7]
.L592:
	cmp	w23, 1
	beq	.L611
	strb	wzr, [x19, 8]
.L594:
	ldrb	w0, [x21, 7]
	cmp	w0, 1
	beq	.L612
	strb	wzr, [x19, 9]
.L596:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, wzr
	mov	w1, 3
	mov	w3, 0
	csinc	w0, w1, wzr, eq
	mov	x2, x21
	strb	w0, [x19, 11]
	mov	x1, x24
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L598
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 15]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 16]
	ldrb	w1, [x21, 8]
	cbnz	w1, .L613
.L599:
	ldrb	w1, [x21, 9]
	cmp	w1, 1
	beq	.L614
.L601:
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 19]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	mov	w1, 1
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L598:
	mov	w1, 0
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L610:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 7]
	ldrb	w23, [x21, 14]
	b	.L592
	.p2align 3
.L613:
	ldrb	w2, [x19, 104]
	add	x3, x21, 272
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L599
	.p2align 3
.L612:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 9]
	b	.L596
	.p2align 3
.L611:
	mov	w1, w23
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	b	.L594
	.p2align 3
.L614:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 17]
	bne	.L601
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 18]
	b	.L601
	.size	VC1_Vfmw_ParseMPBPicHdr, .-VC1_Vfmw_ParseMPBPicHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseSMPPicHdr
	.type	VC1_Vfmw_ParseSMPPicHdr, %function
VC1_Vfmw_ParseSMPPicHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	add	x19, x2, 248
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	mov	x22, x2
	bl	_mcount
	ldrb	w23, [x19, 10]
	mov	x0, x21
	mov	w1, w23
	bl	VC1_SetCurPicResolutionInfo
	ldr	w0, [x20, 24]
	cmp	w0, 1
	ble	.L655
	ldr	x24, .LC96
	mov	x2, 112
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x24, 96]
	blr	x3
	strb	w23, [x19, 10]
	ldr	x3, [x24, 96]
	mov	x2, 14336
	mov	w1, 0
	add	x0, x21, 3344
	blr	x3
	mov	x0, x20
	bl	BsPos
	str	w0, [x19, 88]
	ldrb	w0, [x22, 15]
	cbnz	w0, .L656
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 1]
	ldrb	w0, [x22, 12]
	cbnz	w0, .L657
.L619:
	ldrb	w0, [x22, 13]
	mov	w1, 1
	cbnz	w0, .L620
.L660:
	mov	x0, x20
	bl	BsGet
	cmp	w0, wzr
	cset	w0, ne
	strb	w0, [x19, 3]
.L621:
	strb	w0, [x21, 2]
	strb	wzr, [x21, 4]
	ldrb	w0, [x19, 3]
	cmp	w0, 4
	bhi	.L653
	ldr	x1, .LC97
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx627
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx627:
	.section	.rodata
	.align	0
	.align	2
.L627:
	.byte	(.L626 - .Lrtx627) / 4
	.byte	(.L628 - .Lrtx627) / 4
	.byte	(.L629 - .Lrtx627) / 4
	.byte	(.L653 - .Lrtx627) / 4
	.byte	(.L630 - .Lrtx627) / 4
	.text
	.p2align 3
.L620:
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	beq	.L658
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	beq	.L659
	mov	w0, 2
	add	x3, x22, 252
	strb	w0, [x19, 3]
	add	x2, x22, 251
	add	x1, x22, 356
	mov	x0, x20
	bl	VC1_DecBfractionSMP
	cbnz	w0, .L653
	ldrb	w0, [x19, 4]
	cmp	w0, 21
	beq	.L653
	ldrb	w0, [x19, 3]
	b	.L621
	.p2align 3
.L626:
	mov	x2, x22
	mov	x1, x21
	mov	x0, x20
	bl	VC1_Vfmw_ParseSMPIPicHdr
	mov	w22, w0
.L631:
	mov	x0, x20
	bl	BsPos
	ldr	w1, [x19, 88]
	sub	w0, w0, w1
	str	w0, [x19, 88]
	mov	x0, x20
	ldr	w19, [x21, 3324]
	bl	BsPos
	lsl	w19, w19, 3
	sub	w19, w19, w0
	mov	w0, w22
	cmp	w19, wzr
	bgt	.L645
	ldr	x2, .LC103
	mov	w1, 2818
	mov	w0, 1
	bl	dprint_normal
	.p2align 2
.L653:
	mov	w0, 0
.L645:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L655:
	mov	w0, 5
	strb	w0, [x19, 3]
	strb	w0, [x21, 2]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L657:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 2]
	mov	w1, 1
	ldrb	w0, [x22, 13]
	cbnz	w0, .L620
	b	.L660
	.p2align 3
.L656:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x22, 248]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 1]
	ldrb	w0, [x22, 12]
	cbz	w0, .L619
	b	.L657
	.p2align 3
.L658:
	strb	w0, [x19, 3]
	b	.L621
	.p2align 3
.L630:
	add	x0, x21, 16384
	ldrb	w23, [x0, 1312]
	cmp	w23, 1
	bne	.L653
	mov	x2, x22
	mov	x1, x21
	mov	x0, x20
	bl	VC1_Vfmw_ParseSMPIPicHdr
	cmp	w0, 1
	mov	w22, w0
	beq	.L631
	ldr	x2, .LC101
	mov	w1, 2798
	mov	w0, w23
	bl	dprint_normal
	b	.L631
	.p2align 3
.L629:
	add	x0, x21, 16384
	ldrb	w23, [x0, 1312]
	cmp	w23, 1
	bne	.L653
	mov	x2, x22
	mov	x1, x21
	mov	x0, x20
	bl	VC1_Vfmw_ParseMPBPicHdr
	cmp	w0, 1
	mov	w22, w0
	beq	.L631
	ldr	x2, .LC99
	mov	w1, 2781
	mov	w0, w23
	bl	dprint_normal
	b	.L631
	.p2align 3
.L628:
	mov	x2, x22
	mov	x1, x21
	mov	x0, x20
	bl	VC1_Vfmw_ParseSMPPPicHdr
	mov	w22, w0
	b	.L631
	.p2align 3
.L659:
	strb	wzr, [x19, 3]
	mov	w0, 0
	b	.L621
	.size	VC1_Vfmw_ParseSMPPicHdr, .-VC1_Vfmw_ParseSMPPicHdr
	.align	3
.LC96:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC97:
	.xword	.L627
	.align	3
.LC99:
	.xword	.LC98
	.align	3
.LC101:
	.xword	.LC100
	.align	3
.LC103:
	.xword	.LC102
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvIPicHdr
	.type	VC1_Vfmw_ParseAdvIPicHdr, %function
VC1_Vfmw_ParseAdvIPicHdr:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	mov	x25, x1
	bl	_mcount
	add	x23, x21, 16
	mov	w1, 1
	mov	x0, x20
	add	x19, x21, 360
	bl	BsGet
	strb	w0, [x21, 360]
	ldrb	w1, [x23, 7]
	cmp	w1, 1
	beq	.L677
.L662:
	ldr	w0, [x19, 44]
	cbnz	w0, .L663
	ldrb	w1, [x23, 9]
	cmp	w1, 1
	beq	.L678
.L663:
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w22, w0
	strb	w22, [x19, 10]
	cbz	w22, .L671
	add	x26, x21, 188
	ldrb	w24, [x26, 10]
	uxtb	w1, w0
	mov	w0, w24
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w22, 8
	bls	.L679
	strb	wzr, [x19, 3]
.L667:
	cmp	w24, 1
	beq	.L680
	strb	wzr, [x19, 11]
.L669:
	ldrb	w0, [x23, 5]
	cmp	w0, 1
	beq	.L681
.L670:
	mov	w3, 0
	mov	x2, x21
	mov	x1, x25
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L671
	mov	x0, x20
	mov	w22, 1
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 22]
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 23]
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 24]
	ldrb	w1, [x26, 7]
	cbz	w1, .L665
	ldrb	w2, [x19, 116]
	add	x3, x21, 520
	mov	x0, x20
	bl	VC1_VopDQuant
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L671:
	mov	w22, 0
.L665:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L679:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w24, [x26, 10]
	b	.L667
	.p2align 3
.L678:
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 9]
	b	.L663
	.p2align 3
.L677:
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	b	.L662
	.p2align 3
.L681:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L670
	.p2align 3
.L680:
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L669
	.size	VC1_Vfmw_ParseAdvIPicHdr, .-VC1_Vfmw_ParseAdvIPicHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvPPicHdr
	.type	VC1_Vfmw_ParseAdvPPicHdr, %function
VC1_Vfmw_ParseAdvPPicHdr:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	mov	x26, x1
	bl	_mcount
	add	x22, x21, 16
	mov	w1, 1
	mov	x0, x20
	add	x19, x21, 360
	bl	BsGet
	strb	w0, [x21, 360]
	ldrb	w0, [x22, 7]
	cmp	w0, 1
	beq	.L683
	ldr	w0, [x19, 44]
	cmp	w0, 2
	beq	.L683
	ldrb	w1, [x22, 9]
	cmp	w1, 1
	beq	.L719
.L685:
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w23, w0
	strb	w23, [x19, 10]
	cbz	w23, .L699
	add	x24, x21, 188
	ldrb	w25, [x24, 10]
	uxtb	w1, w0
	mov	w0, w25
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w23, 8
	bls	.L720
	strb	wzr, [x19, 3]
.L689:
	cmp	w25, 1
	beq	.L721
	strb	wzr, [x19, 11]
.L691:
	ldrb	w0, [x22, 5]
	cmp	w0, 1
	beq	.L722
.L692:
	ldrb	w0, [x24, 6]
	cmp	w0, 1
	beq	.L723
.L693:
	ldr	w0, [x19, 44]
	cbz	w0, .L724
	ldrb	w0, [x24, 12]
	cmp	w0, 1
	beq	.L725
	strb	wzr, [x19, 25]
.L697:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 26]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x19, 120]
	beq	.L726
.L698:
	strb	wzr, [x19, 34]
.L695:
	mov	w3, 0
	mov	x2, x21
	mov	x1, x26
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L699
	ldr	w1, [x19, 44]
	cmp	w1, 2
	beq	.L727
.L700:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 18]
	ldr	w1, [x19, 44]
	cbnz	w1, .L701
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
.L702:
	ldr	w22, [x19, 44]
	strb	w0, [x19, 19]
	cmp	w22, 2
	beq	.L728
.L703:
	ldrb	w1, [x24, 7]
	cbnz	w1, .L729
.L705:
	ldrb	w1, [x24, 8]
	cmp	w1, 1
	beq	.L730
.L707:
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 22]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 24]
	mov	w1, 1
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L699:
	mov	w1, 0
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L683:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	ldrb	w1, [x22, 9]
	cmp	w1, 1
	bne	.L685
.L719:
	ldr	w0, [x19, 44]
	cbnz	w0, .L685
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 9]
	b	.L685
	.p2align 3
.L701:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	b	.L702
	.p2align 3
.L720:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w25, [x24, 10]
	b	.L689
	.p2align 3
.L726:
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 16]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 17]
	b	.L698
	.p2align 3
.L724:
	ldrb	w1, [x19, 116]
	mov	x0, x20
	bl	VC1_DecMvmodeProgrP
	uxtb	w0, w0
	cmp	w0, 4
	strb	w0, [x19, 14]
	bne	.L695
	ldrb	w1, [x19, 116]
	mov	x0, x20
	bl	VC1_DecMvmode2
	strb	w0, [x19, 15]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 16]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 17]
	b	.L695
	.p2align 3
.L729:
	ldrb	w2, [x19, 116]
	add	x3, x21, 520
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L705
	.p2align 3
.L721:
	mov	w1, w25
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L691
	.p2align 3
.L723:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 13]
	b	.L693
	.p2align 3
.L722:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L692
	.p2align 3
.L727:
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 27]
	b	.L700
	.p2align 3
.L728:
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 28]
	ldrb	w1, [x19, 26]
	mov	w0, 0
	cmp	w1, 1
	beq	.L731
	strb	w0, [x19, 29]
	b	.L703
	.p2align 3
.L730:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 20]
	bne	.L707
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	b	.L707
	.p2align 3
.L725:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 25]
	b	.L697
.L731:
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 29]
	b	.L703
	.size	VC1_Vfmw_ParseAdvPPicHdr, .-VC1_Vfmw_ParseAdvPPicHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvBPicHdr
	.type	VC1_Vfmw_ParseAdvBPicHdr, %function
VC1_Vfmw_ParseAdvBPicHdr:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	mov	x25, x1
	bl	_mcount
	add	x22, x21, 16
	mov	w1, 1
	mov	x0, x20
	add	x19, x21, 360
	bl	BsGet
	strb	w0, [x21, 360]
	ldrb	w0, [x22, 7]
	cmp	w0, 1
	beq	.L733
	ldr	w2, [x19, 44]
	cmp	w2, 2
	beq	.L733
.L734:
	ldrb	w1, [x22, 9]
	cmp	w1, 1
	beq	.L774
.L735:
	cbnz	w2, .L739
	add	x1, x21, 508
	mov	x0, x20
	bl	VC1_DecBfraction
	uxtb	w0, w0
	cmp	w0, 21
	strb	w0, [x19, 2]
	beq	.L737
.L739:
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w23, w0
	strb	w23, [x19, 10]
	cbz	w23, .L737
	add	x24, x21, 188
	ldrb	w26, [x24, 10]
	uxtb	w1, w0
	mov	w0, w26
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w23, 8
	bls	.L775
	strb	wzr, [x19, 3]
.L742:
	cmp	w26, 1
	beq	.L776
	strb	wzr, [x19, 11]
.L744:
	ldrb	w0, [x22, 5]
	cmp	w0, 1
	beq	.L777
.L745:
	ldr	w0, [x19, 44]
	cmp	w0, 2
	beq	.L778
.L746:
	ldrb	w0, [x24, 6]
	cmp	w0, 1
	beq	.L779
.L747:
	ldr	w0, [x19, 44]
	cbz	w0, .L780
	ldrb	w0, [x24, 12]
	cmp	w0, 1
	beq	.L781
.L751:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 120]
.L750:
	mov	w3, 0
	mov	x2, x21
	mov	x1, x25
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L737
	ldr	w1, [x19, 44]
	cmp	w1, 2
	beq	.L782
.L752:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 18]
	ldr	w1, [x19, 44]
	cbnz	w1, .L753
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
.L754:
	ldr	w22, [x19, 44]
	strb	w0, [x19, 19]
	cmp	w22, 2
	beq	.L783
.L755:
	ldrb	w1, [x24, 7]
	cbnz	w1, .L784
.L756:
	ldrb	w1, [x24, 8]
	cmp	w1, 1
	beq	.L785
.L758:
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 22]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 24]
	mov	w1, 1
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L737:
	mov	w1, 0
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L774:
	cbnz	w2, .L739
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 9]
	ldr	w2, [x19, 44]
	b	.L735
	.p2align 3
.L733:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	ldr	w2, [x19, 44]
	b	.L734
	.p2align 3
.L753:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	b	.L754
	.p2align 3
.L775:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w26, [x24, 10]
	b	.L742
	.p2align 3
.L780:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, wzr
	mov	w1, 3
	csinc	w1, w1, wzr, eq
	strb	w1, [x19, 14]
	b	.L750
	.p2align 3
.L784:
	ldrb	w2, [x19, 116]
	add	x3, x21, 520
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L756
	.p2align 3
.L779:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 13]
	b	.L747
	.p2align 3
.L778:
	add	x1, x21, 508
	mov	x0, x20
	bl	VC1_DecBfraction
	strb	w0, [x19, 2]
	b	.L746
	.p2align 3
.L777:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L745
	.p2align 3
.L776:
	mov	w1, w26
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L744
	.p2align 3
.L785:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 20]
	bne	.L758
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	b	.L758
	.p2align 3
.L783:
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 28]
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 29]
	b	.L755
	.p2align 3
.L782:
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 27]
	b	.L752
	.p2align 3
.L781:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 25]
	b	.L751
	.size	VC1_Vfmw_ParseAdvBPicHdr, .-VC1_Vfmw_ParseAdvBPicHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvFramePicHdr
	.type	VC1_Vfmw_ParseAdvFramePicHdr, %function
VC1_Vfmw_ParseAdvFramePicHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x23, x1
	mov	x21, x2
	bl	_mcount
	mov	w1, 4
	mov	x0, x19
	bl	BsShow
	cmp	w0, 7
	ble	.L807
	cmp	w0, 11
	bgt	.L819
	mov	w24, 2
	mov	w1, w24
.L787:
	mov	x0, x19
	add	x20, x21, 360
	add	x22, x21, 16
	bl	BsSkip
	add	x0, x23, 16384
	strb	w24, [x20, 1]
	ldrb	w0, [x0, 1689]
	strb	w0, [x23, 2]
	ldrb	w0, [x22, 8]
	cbnz	w0, .L820
.L788:
	ldrb	w0, [x22, 6]
	cbz	w0, .L789
	ldrb	w0, [x22, 7]
	cbnz	w0, .L790
	mov	w1, 2
	mov	x0, x19
	bl	BsGet
	strb	w0, [x20, 6]
	ldrb	w0, [x22, 7]
	cmp	w0, 1
	ldrb	w0, [x22, 6]
	beq	.L794
.L823:
	cmp	w0, 1
	bne	.L793
	ldrb	w0, [x20, 6]
	add	w0, w0, 1
	str	w0, [x20, 144]
.L796:
	ldrb	w1, [x21, 190]
	cmp	w1, 1
	beq	.L797
.L805:
	ldrb	w0, [x20, 1]
	cmp	w0, 5
	bls	.L821
.L811:
	mov	w0, 0
	b	.L798
	.p2align 3
.L821:
	ldr	x1, .LC104
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx800
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx800:
	.section	.rodata
	.align	0
	.align	2
.L800:
	.byte	(.L803 - .Lrtx800) / 4
	.byte	(.L801 - .Lrtx800) / 4
	.byte	(.L802 - .Lrtx800) / 4
	.byte	(.L811 - .Lrtx800) / 4
	.byte	(.L803 - .Lrtx800) / 4
	.byte	(.L804 - .Lrtx800) / 4
	.text
	.p2align 3
.L819:
	cmp	w0, 13
	ble	.L809
	cmp	w0, 14
	beq	.L822
	mov	w24, 5
	mov	w1, 4
	b	.L787
	.p2align 3
.L803:
	mov	x2, x21
	mov	x1, x23
	mov	x0, x19
	bl	VC1_Vfmw_ParseAdvIPicHdr
.L798:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L789:
	mov	w0, 1
	strb	w0, [x20, 4]
	ldrb	w0, [x22, 7]
	cmp	w0, 1
	beq	.L792
.L793:
	mov	w0, 1
	str	w0, [x20, 144]
	ldrb	w1, [x21, 190]
	cmp	w1, 1
	bne	.L805
.L797:
	mov	x0, x19
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x20, 7]
	bne	.L805
	ldr	w0, [x20, 144]
	cmp	w0, wzr
	ble	.L805
	mov	w24, 0
	.p2align 2
.L806:
	add	x22, x21, x24, sxtw 2
	mov	w1, 18
	mov	x0, x19
	add	w24, w24, 1
	bl	BsGet
	str	w0, [x22, 412]
	mov	w1, 18
	mov	x0, x19
	bl	BsGet
	str	w0, [x22, 428]
	mov	w1, 14
	mov	x0, x19
	bl	BsGet
	str	w0, [x22, 444]
	mov	w1, 14
	mov	x0, x19
	bl	BsGet
	str	w0, [x22, 460]
	ldr	w0, [x20, 144]
	cmp	w0, w24
	bgt	.L806
	b	.L805
	.p2align 3
.L792:
	mov	w0, 2
	str	w0, [x20, 144]
	b	.L796
	.p2align 3
.L807:
	mov	w24, 1
	mov	w1, w24
	b	.L787
	.p2align 3
.L820:
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	str	w0, [x20, 48]
	b	.L788
	.p2align 3
.L790:
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	strb	w0, [x20, 4]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	strb	w0, [x20, 5]
	ldrb	w0, [x22, 7]
	cmp	w0, 1
	ldrb	w0, [x22, 6]
	bne	.L823
.L794:
	cmp	w0, 1
	bne	.L792
	ldrb	w0, [x20, 5]
	add	w0, w0, 2
	str	w0, [x20, 144]
	b	.L796
	.p2align 3
.L801:
	mov	x2, x21
	mov	x1, x23
	mov	x0, x19
	bl	VC1_Vfmw_ParseAdvPPicHdr
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L804:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L802:
	mov	x2, x21
	mov	x1, x23
	mov	x0, x19
	bl	VC1_Vfmw_ParseAdvBPicHdr
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L809:
	mov	w24, 0
	mov	w1, 3
	b	.L787
	.p2align 3
.L822:
	mov	w24, 4
	mov	w1, w24
	b	.L787
	.size	VC1_Vfmw_ParseAdvFramePicHdr, .-VC1_Vfmw_ParseAdvFramePicHdr
	.align	3
.LC104:
	.xword	.L800
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvIFieldHdr
	.type	VC1_Vfmw_ParseAdvIFieldHdr, %function
VC1_Vfmw_ParseAdvIFieldHdr:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	mov	x25, x1
	add	x19, x21, 360
	bl	_mcount
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w22, w0
	strb	w22, [x19, 10]
	cbz	w22, .L832
	add	x24, x21, 188
	ldrb	w23, [x24, 10]
	uxtb	w1, w0
	mov	w0, w23
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w22, 8
	bls	.L838
	strb	wzr, [x19, 3]
.L828:
	cmp	w23, 1
	beq	.L839
	strb	wzr, [x19, 11]
.L830:
	ldrb	w0, [x21, 21]
	cmp	w0, 1
	beq	.L840
.L831:
	mov	w3, 0
	mov	x2, x21
	mov	x1, x25
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L832
	mov	x0, x20
	mov	w22, 1
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 22]
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 23]
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 24]
	ldrb	w1, [x24, 7]
	cbz	w1, .L826
	ldrb	w2, [x19, 116]
	add	x3, x21, 520
	mov	x0, x20
	bl	VC1_VopDQuant
	ldr	x25, [sp, 64]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L832:
	mov	w22, 0
.L826:
	mov	w0, w22
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L838:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w23, [x24, 10]
	b	.L828
	.p2align 3
.L840:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L831
	.p2align 3
.L839:
	mov	w1, w23
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L830
	.size	VC1_Vfmw_ParseAdvIFieldHdr, .-VC1_Vfmw_ParseAdvIFieldHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvPFieldHdr
	.type	VC1_Vfmw_ParseAdvPFieldHdr, %function
VC1_Vfmw_ParseAdvPFieldHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x23, x2
	add	x19, x23, 360
	bl	_mcount
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w22, w0
	strb	w22, [x19, 10]
	mov	w1, 0
	cbz	w22, .L842
	add	x21, x23, 188
	ldrb	w24, [x21, 10]
	mov	w1, w22
	mov	w0, w24
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w22, 8
	bls	.L869
	strb	wzr, [x19, 3]
.L844:
	cmp	w24, 1
	beq	.L870
	strb	wzr, [x19, 11]
.L846:
	ldrb	w0, [x23, 21]
	cmp	w0, 1
	beq	.L871
.L847:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 32]
	cbz	w0, .L872
.L848:
	ldrb	w0, [x21, 6]
	cmp	w0, 1
	beq	.L873
.L849:
	ldrb	w0, [x21, 12]
	cmp	w0, 1
	beq	.L874
.L850:
	ldrb	w1, [x19, 116]
	mov	x0, x20
	bl	VC1_DecMvmodeProgrP
	uxtb	w0, w0
	cmp	w0, 4
	strb	w0, [x19, 14]
	beq	.L875
.L852:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 27]
	ldrb	w1, [x19, 32]
	cbnz	w1, .L854
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	mov	w1, 3
	strb	w0, [x19, 18]
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 19]
	ldrb	w1, [x19, 14]
	cbz	w1, .L856
.L878:
	ldrh	w0, [x19, 14]
	cmp	w0, 4
	beq	.L856
	ldrb	w1, [x21, 7]
	cbnz	w1, .L876
.L858:
	ldrb	w1, [x21, 8]
	cmp	w1, 1
	beq	.L877
.L860:
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 22]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 24]
	mov	w1, 1
.L842:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L854:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	mov	w1, 3
	strb	w0, [x19, 18]
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 19]
	ldrb	w1, [x19, 14]
	cbnz	w1, .L878
.L856:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 29]
	ldrb	w1, [x21, 7]
	cbz	w1, .L858
.L876:
	ldrb	w2, [x19, 116]
	add	x3, x23, 520
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L858
	.p2align 3
.L869:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w24, [x21, 10]
	b	.L844
	.p2align 3
.L872:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, wzr
	cset	w0, eq
	strb	w0, [x19, 33]
	b	.L848
	.p2align 3
.L875:
	ldrb	w1, [x19, 116]
	mov	x0, x20
	bl	VC1_DecMvmode2
	strb	w0, [x19, 15]
	mov	x0, x20
	bl	VC1_DecIntCompField
	str	w0, [x19, 128]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 16]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 17]
	ldr	w1, [x19, 128]
	cbnz	w1, .L852
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 132]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 136]
	b	.L852
	.p2align 3
.L874:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 25]
	b	.L850
	.p2align 3
.L877:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 20]
	bne	.L860
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	b	.L860
	.p2align 3
.L873:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 13]
	b	.L849
	.p2align 3
.L871:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L847
	.p2align 3
.L870:
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L846
	.size	VC1_Vfmw_ParseAdvPFieldHdr, .-VC1_Vfmw_ParseAdvPFieldHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvBFieldHdr
	.type	VC1_Vfmw_ParseAdvBFieldHdr, %function
VC1_Vfmw_ParseAdvBFieldHdr:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x19, x2, 360
	mov	x21, x2
	mov	x25, x1
	bl	_mcount
	mov	w0, 1
	mov	w1, 5
	strb	w0, [x19, 32]
	mov	x0, x20
	bl	BsGet
	uxtb	w22, w0
	strb	w22, [x19, 10]
	cbz	w22, .L889
	add	x23, x21, 188
	ldrb	w24, [x23, 10]
	uxtb	w1, w0
	mov	w0, w24
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w22, 8
	bls	.L901
	strb	wzr, [x19, 3]
.L883:
	cmp	w24, 1
	beq	.L902
	strb	wzr, [x19, 11]
.L885:
	ldrb	w0, [x21, 21]
	cmp	w0, 1
	beq	.L903
.L886:
	ldrb	w0, [x23, 6]
	cmp	w0, 1
	beq	.L904
.L887:
	ldrb	w0, [x23, 12]
	cmp	w0, 1
	beq	.L905
.L888:
	ldrb	w1, [x19, 116]
	mov	x0, x20
	bl	VC1_DecMvmodeInterB
	strb	w0, [x19, 14]
	mov	w3, 0
	mov	x2, x21
	mov	x1, x25
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L889
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 27]
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 18]
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 19]
	ldrb	w1, [x19, 14]
	cbz	w1, .L906
.L890:
	ldrb	w1, [x23, 7]
	cbnz	w1, .L907
.L891:
	ldrb	w1, [x23, 8]
	cmp	w1, 1
	beq	.L908
.L893:
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 22]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 24]
	mov	w1, 1
	mov	w0, w1
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L889:
	mov	w1, 0
	ldr	x25, [sp, 64]
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L901:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w24, [x23, 10]
	b	.L883
	.p2align 3
.L907:
	ldrb	w2, [x19, 116]
	add	x3, x21, 520
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L891
	.p2align 3
.L906:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 29]
	b	.L890
	.p2align 3
.L905:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 25]
	b	.L888
	.p2align 3
.L904:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 13]
	b	.L887
	.p2align 3
.L903:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L886
	.p2align 3
.L902:
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L885
	.p2align 3
.L908:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 20]
	bne	.L893
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	b	.L893
	.size	VC1_Vfmw_ParseAdvBFieldHdr, .-VC1_Vfmw_ParseAdvBFieldHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvFieldPicHdr
	.type	VC1_Vfmw_ParseAdvFieldPicHdr, %function
VC1_Vfmw_ParseAdvFieldPicHdr:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x1
	mov	x21, x0
	mov	x0, x30
	mov	x22, x2
	bl	_mcount
	ldrb	w0, [x20, 9]
	cbz	w0, .L910
	ldr	w0, [x20, 3152]
	cbnz	w0, .L910
	add	x19, x22, 360
	add	x0, x20, 16384
	ldr	w1, [x19, 156]
	strb	w1, [x19, 1]
	ldrb	w0, [x0, 1689]
	strb	w0, [x20, 2]
.L929:
	ldrb	w0, [x19, 1]
	cmp	w0, 4
	bls	.L950
.L938:
	ldrb	w1, [x19, 4]
	mov	w0, 0
	cbz	w1, .L936
.L955:
	ldrb	w1, [x20, 9]
	cmp	w1, wzr
	cset	w1, ne
	strb	w1, [x19, 41]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L910:
	mov	w1, 3
	mov	x0, x21
	add	x19, x22, 360
	add	x23, x22, 16
	bl	BsGet
	sbfiz	x1, x0, 3, 32
	ldr	x2, .LC105
	str	w0, [x19, 124]
	add	x0, x2, x1
	ldr	w1, [x2, x1]
	add	x2, x20, 16384
	ldr	w0, [x0, 4]
	stp	w1, w0, [x19, 152]
	uxtb	w1, w1
	ldrb	w3, [x20, 9]
	uxtb	w0, w0
	cmp	w3, wzr
	csel	w0, w0, w1, ne
	strb	w0, [x19, 1]
	ldrb	w0, [x2, 1689]
	strb	w0, [x20, 2]
	ldrb	w0, [x23, 8]
	cbnz	w0, .L951
	ldrb	w0, [x23, 6]
	cbnz	w0, .L952
.L915:
	mov	w0, 1
	strb	w0, [x19, 4]
	ldrb	w0, [x23, 7]
	cmp	w0, 1
	beq	.L918
.L919:
	mov	w0, 1
	str	w0, [x19, 144]
.L922:
	add	x23, x22, 188
	ldrb	w1, [x23, 2]
	cmp	w1, 1
	beq	.L923
.L926:
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
	strb	w0, [x22, 360]
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
	strb	w0, [x19, 8]
	ldrb	w0, [x23, 3]
	cmp	w0, 1
	beq	.L953
.L925:
	ldr	w0, [x19, 124]
	cmp	w0, 3
	ble	.L929
.L930:
	add	x1, x22, 508
	mov	x0, x21
	bl	VC1_DecBfraction
	strb	w0, [x19, 2]
	ldrb	w0, [x19, 1]
	cmp	w0, 4
	bhi	.L938
	.p2align 2
.L950:
	ldr	x1, .LC106
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx933
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx933:
	.section	.rodata
	.align	0
	.align	2
.L933:
	.byte	(.L932 - .Lrtx933) / 4
	.byte	(.L934 - .Lrtx933) / 4
	.byte	(.L935 - .Lrtx933) / 4
	.byte	(.L938 - .Lrtx933) / 4
	.byte	(.L932 - .Lrtx933) / 4
	.text
	.p2align 3
.L952:
	ldrb	w0, [x23, 7]
	cbz	w0, .L954
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
	strb	w0, [x19, 4]
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
	strb	w0, [x19, 5]
.L917:
	ldrb	w0, [x23, 7]
	cmp	w0, 1
	ldrb	w0, [x23, 6]
	beq	.L920
	cmp	w0, 1
	bne	.L919
	ldrb	w0, [x19, 6]
	add	w0, w0, 1
	str	w0, [x19, 144]
	b	.L922
	.p2align 3
.L935:
	mov	x2, x22
	mov	x1, x20
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvBFieldHdr
.L931:
	ldrb	w1, [x19, 4]
	cbnz	w1, .L955
.L936:
	ldrb	w1, [x20, 9]
	cmp	w1, 1
	cset	w1, ne
	strb	w1, [x19, 41]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L934:
	mov	x2, x22
	mov	x1, x20
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvPFieldHdr
	b	.L931
	.p2align 3
.L932:
	mov	x2, x22
	mov	x1, x20
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvIFieldHdr
	b	.L931
	.p2align 3
.L951:
	mov	w1, 8
	mov	x0, x21
	bl	BsGet
	str	w0, [x19, 48]
	ldrb	w0, [x23, 6]
	cbz	w0, .L915
	b	.L952
	.p2align 3
.L954:
	mov	w1, 2
	mov	x0, x21
	bl	BsGet
	strb	w0, [x19, 6]
	b	.L917
	.p2align 3
.L953:
	ldr	w0, [x19, 124]
	cmp	w0, 3
	bgt	.L930
	mov	x0, x21
	bl	VC1_DecRefdist
	strb	w0, [x19, 31]
	b	.L925
	.p2align 3
.L918:
	mov	w0, 2
	str	w0, [x19, 144]
	b	.L922
	.p2align 3
.L920:
	cmp	w0, 1
	bne	.L918
	ldrb	w0, [x19, 5]
	add	w0, w0, 2
	str	w0, [x19, 144]
	b	.L922
	.p2align 3
.L923:
	mov	x0, x21
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 7]
	bne	.L926
	ldr	w0, [x19, 144]
	cmp	w0, wzr
	ble	.L926
	mov	w25, 0
	.p2align 2
.L927:
	add	x24, x22, x25, sxtw 2
	mov	w1, 18
	mov	x0, x21
	add	w25, w25, 1
	bl	BsGet
	str	w0, [x24, 412]
	mov	w1, 18
	mov	x0, x21
	bl	BsGet
	str	w0, [x24, 428]
	mov	w1, 14
	mov	x0, x21
	bl	BsGet
	str	w0, [x24, 444]
	mov	w1, 14
	mov	x0, x21
	bl	BsGet
	str	w0, [x24, 460]
	ldr	w0, [x19, 144]
	cmp	w0, w25
	bgt	.L927
	b	.L926
	.size	VC1_Vfmw_ParseAdvFieldPicHdr, .-VC1_Vfmw_ParseAdvFieldPicHdr
	.align	3
.LC105:
	.xword	.LANCHOR1
	.align	3
.LC106:
	.xword	.L933
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvPicHdr
	.type	VC1_Vfmw_ParseAdvPicHdr, %function
VC1_Vfmw_ParseAdvPicHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x1
	mov	x21, x0
	mov	x0, x30
	mov	x20, x2
	bl	_mcount
	ldr	w0, [x19, 3104]
	add	x5, x19, 3072
	ldr	w1, [x19, 3108]
	ldrb	w2, [x19, 9]
	lsl	w4, w0, 4
	stp	w0, w1, [x5, 112]
	lsl	w3, w1, 4
	mul	w0, w0, w1
	stp	w4, w3, [x5, 104]
	str	w0, [x19, 3192]
	cbz	w2, .L957
	ldr	w0, [x19, 3152]
	cbz	w0, .L967
.L957:
	ldrb	w23, [x20, 23]
	cmp	w23, 1
	beq	.L968
	mov	w1, 0
	mov	w0, 0
.L959:
	str	w0, [x20, 404]
	mov	x2, x20
	cbz	w1, .L969
.L961:
	mov	x1, x19
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvFieldPicHdr
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L967:
	ldr	w1, [x20, 404]
	mov	x2, x20
	and	w1, w1, -3
	cbnz	w1, .L961
.L969:
	mov	x1, x19
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvFramePicHdr
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L968:
	mov	w1, 2
	mov	x0, x21
	bl	BsShow
	cmp	w0, 1
	mov	w22, w0
	ble	.L970
	mov	w1, 2
	mov	x0, x21
	bl	BsSkip
	and	w1, w22, -3
	mov	w0, w22
	b	.L959
	.p2align 3
.L970:
	mov	w1, w23
	mov	x0, x21
	bl	BsSkip
	mov	w1, 0
	mov	w0, 0
	b	.L959
	.size	VC1_Vfmw_ParseAdvPicHdr, .-VC1_Vfmw_ParseAdvPicHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvSlcHdr
	.type	VC1_Vfmw_ParseAdvSlcHdr, %function
VC1_Vfmw_ParseAdvSlcHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x1
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	bl	_mcount
	ldr	w19, [x22, 3152]
	mov	w1, 9
	mov	x0, x20
	uxtw	x19, w19
	bl	BsGet
	lsl	x2, x19, 2
	mov	w1, 1
	sub	x19, x2, x19
	add	x19, x21, x19, lsl 2
	str	w0, [x19, 540]
	mov	x0, x20
	bl	BsGet
	sxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 536]
	beq	.L974
	mov	w0, 1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L974:
	add	x19, x22, 20480
	add	x4, x21, 188
	add	x3, x19, 1028
	mov	x2, 172
	add	x23, x19, 840
	ldp	x0, x1, [x4]
	stp	x0, x1, [x3]
	add	x1, x21, 16
	add	x0, x19, 856
	ldp	x6, x7, [x4, 16]
	stp	x6, x7, [x3, 16]
	ldp	x6, x7, [x4, 32]
	stp	x6, x7, [x3, 32]
	ldr	x5, [x21, 236]
	str	x5, [x3, 48]
	ldr	w4, [x21, 244]
	str	w4, [x19, 1084]
	bl	memcpy
	add	x1, x21, 360
	mov	x2, 176
	add	x0, x19, 1200
	bl	memcpy
	mov	x2, x23
	mov	x1, x22
	mov	x0, x20
	bl	VC1_Vfmw_ParseAdvPicHdr
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	VC1_Vfmw_ParseAdvSlcHdr, .-VC1_Vfmw_ParseAdvSlcHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_ClearCurPacket
	.type	VC1_ClearCurPacket, %function
VC1_ClearCurPacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 36]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
	ldrsb	w0, [x19, 16]
	cmp	w0, 1
	beq	.L976
	ldr	w1, [x19, 40]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
.L976:
	ldr	x3, .LC107
	mov	x2, 48
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1_ClearCurPacket, .-VC1_ClearCurPacket
	.align	3
.LC107:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_ClearCurPic
	.type	VC1_ClearCurPic, %function
VC1_ClearCurPic:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w22, w1
	bl	_mcount
	add	x0, x21, 16384
	ldrsb	w0, [x0, 1296]
	cbz	w0, .L981
	ldr	w0, [x21, 3152]
	mov	w20, 0
	cbnz	w0, .L991
	b	.L980
	.p2align 3
.L984:
	ldr	w0, [x21, 3152]
	cmp	w0, w20
	bls	.L980
.L991:
	sxtw	x19, w20
	mov	w0, w22
	lsl	x1, x19, 3
	add	w20, w20, 1
	sub	x19, x1, x19
	add	x19, x21, x19, lsl 3
	ldr	w1, [x19, 3392]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 3352]
	cbz	x0, .L984
	ldr	w0, [x19, 3380]
	cbz	w0, .L984
	ldr	w1, [x19, 3396]
	mov	w0, w22
	bl	SM_ReleaseStreamSeg
	ldr	w0, [x21, 3152]
	cmp	w0, w20
	bhi	.L991
.L980:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L981:
	add	x1, x21, 3296
	mov	w0, w22
	bl	VC1_ClearCurPacket
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VC1_ClearCurPic, .-VC1_ClearCurPic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1DEC_VDMPostProc
	.type	VC1DEC_VDMPostProc, %function
VC1DEC_VDMPostProc:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 53248
	mov	w22, w1
	add	x19, x21, 12288
	bl	_mcount
	add	x23, x19, 2432
	ldr	w1, [x20, 192]
	mov	x0, x23
	bl	VC1_ClearCurPic
	ldrb	w0, [x19, 2434]
	sub	w0, w0, #2
	and	w0, w0, -3
	uxtb	w0, w0
	cbz	w0, .L1031
.L996:
	ldr	w1, [x19, 5576]
	ldr	w0, [x20, 192]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	ldr	w1, [x19, 5572]
	ldr	w0, [x20, 192]
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	cbz	x23, .L1032
	tbnz	w22, #31, .L1016
	mov	w0, 100
	cmp	w22, w0
	csel	w22, w22, w0, le
.L999:
	mov	x0, x21
	str	w22, [x23, 96]
	bl	VC1_SetImgFormat
	ldrsb	w1, [x19, 2435]
	cmp	w1, 3
	beq	.L1033
.L1000:
	stp	xzr, xzr, [x23, 168]
	ldr	x0, [x21]
	ldr	w0, [x0, 12]
	cbz	w0, .L1034
	ldr	w1, [x19, 5576]
	mov	w25, 0
	str	w1, [x19, 5580]
.L1004:
	ldr	w2, [x19, 5588]
	cmn	w1, #1
	add	x23, x19, 2432
	add	w2, w2, 1
	str	w2, [x19, 5588]
	beq	.L1005
.L1037:
	ldr	w0, [x20, 192]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L1035
	ldr	w3, [x0, 96]
	cbz	w3, .L1007
	ldr	x0, [x21]
	ldr	w4, [x0, 4]
	cmp	w3, w4
	bhi	.L1008
.L1007:
	ldr	w24, [x19, 5580]
	add	x23, x19, 2432
	ldr	w0, [x20, 192]
	mov	w1, w24
	bl	FSP_GetRef
	mov	w4, w0
	ldr	x2, .LC113
	mov	w3, w24
	mov	w1, 424
	mov	w0, 10
	bl	dprint_normal
	cbnz	w25, .L1036
	add	x1, x23, 36864
	mov	w2, 1
	mov	w0, 2
	ldr	x1, [x1, 1128]
	strb	w2, [x1, 1]
	strb	w0, [x23, 1]
.L1010:
	ldr	w1, [x19, 5580]
	mov	w2, 1
	ldr	w0, [x20, 192]
	add	x23, x19, 2432
	bl	FSP_SetDisplay
	add	x3, x21, 49152
	ldr	w0, [x20, 192]
	mov	x4, x22
	add	x3, x3, 3680
	mov	x2, x21
	mov	w1, 1
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L1011
	ldr	w0, [x20, 192]
	add	x23, x23, 36864
	ldr	x1, [x22, 168]
	bl	FreeUsdByDec
	str	xzr, [x22, 168]
	ldr	x1, [x22, 176]
	ldr	w0, [x20, 192]
	bl	FreeUsdByDec
	str	xzr, [x22, 176]
	mov	w2, 0
	ldr	w0, [x20, 192]
	ldr	w1, [x19, 5580]
	bl	FSP_SetDisplay
	mov	w0, 0
	cbnz	w25, .L1029
.L1030:
	ldr	x1, [x23, 1128]
	strb	wzr, [x1, 1]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1034:
	ldrb	w0, [x19, 2434]
	sub	w0, w0, #2
	and	w0, w0, -3
	uxtb	w0, w0
	cbz	w0, .L1002
	ldr	w0, [x19, 5564]
	cmp	w0, 1
	bls	.L1017
	ldr	w1, [x19, 5568]
.L1003:
	ldr	w2, [x19, 5588]
	cmp	w0, 1
	cset	w25, hi
	str	w1, [x19, 5580]
	add	w2, w2, 1
	cmn	w1, #1
	str	w2, [x19, 5588]
	add	x23, x19, 2432
	bne	.L1037
	.p2align 2
.L1005:
	mov	w0, 1
.L998:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1031:
	ldr	w1, [x19, 5576]
	mov	w2, 0
	ldr	w0, [x20, 192]
	bl	FSP_SetRef
	b	.L996
	.p2align 3
.L1033:
	ldrb	w0, [x19, 2442]
	cmp	w0, 1
	bne	.L1005
	b	.L1000
	.p2align 3
.L1016:
	mov	w22, 0
	b	.L999
	.p2align 3
.L1002:
	ldr	w1, [x19, 5576]
	str	w1, [x19, 5580]
	cbz	x24, .L1018
	ldr	x0, [x23, 208]
	mov	w25, 0
	ldr	x2, [x24, 208]
	cmp	x2, x0
	bge	.L1004
	str	x2, [x23, 208]
	str	x0, [x24, 208]
	ldr	w1, [x19, 5580]
	b	.L1004
	.p2align 3
.L1011:
	ldrsb	w1, [x23, 1]
	cmp	w1, 3
	beq	.L1038
	cmp	w1, 1
	beq	.L1039
	cmp	w1, 2
	bne	.L1005
	add	x1, x23, 36864
	ldr	x1, [x1, 1128]
	strb	wzr, [x1, 1]
	strb	wzr, [x23, 1]
	b	.L998
	.p2align 3
.L1036:
	add	x0, x23, 36864
	ldr	x0, [x0, 1144]
	strb	w25, [x0, 1]
	strb	w25, [x23, 1]
	b	.L1010
	.p2align 3
.L1008:
	ldr	x2, .LC115
	mov	w1, 481
	mov	w0, 1
	add	x23, x23, 36864
	bl	dprint_normal
	ldr	w0, [x20, 192]
	ldr	x1, [x22, 168]
	bl	FreeUsdByDec
	str	xzr, [x22, 168]
	ldr	x1, [x22, 176]
	ldr	w0, [x20, 192]
	bl	FreeUsdByDec
	str	xzr, [x22, 176]
	mov	w2, 0
	ldr	w0, [x20, 192]
	ldr	w1, [x19, 5580]
	bl	FSP_SetDisplay
	mov	w0, 1
	cbz	w25, .L1030
	mov	w0, w25
.L1029:
	ldr	x1, [x23, 1144]
	strb	wzr, [x1, 1]
	b	.L998
	.p2align 3
.L1017:
	mov	w1, -1
	b	.L1003
	.p2align 3
.L1039:
	add	x2, x23, 36864
	mov	w0, w1
	ldr	x1, [x2, 1144]
	strb	wzr, [x1, 1]
	strb	wzr, [x23, 1]
	b	.L998
	.p2align 3
.L1038:
	add	x0, x23, 36864
	ldr	x0, [x0, 1136]
	strb	wzr, [x0, 1]
	strb	wzr, [x23, 1]
	b	.L1005
	.p2align 3
.L1032:
	ldr	x2, .LC109
	mov	x4, x0
	mov	x3, 0
	mov	w1, 365
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	b	.L998
	.p2align 3
.L1018:
	mov	w25, 0
	b	.L1004
	.p2align 3
.L1035:
	mov	w3, 418
	ldr	x2, .LC111
	mov	w1, w3
	mov	w0, 20
	bl	dprint_normal
	mov	w0, 0
	b	.L998
	.size	VC1DEC_VDMPostProc, .-VC1DEC_VDMPostProc
	.align	3
.LC109:
	.xword	.LC108
	.align	3
.LC111:
	.xword	.LC110
	.align	3
.LC113:
	.xword	.LC112
	.align	3
.LC115:
	.xword	.LC114
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_DecodeArbiter
	.type	VC1_Vfmw_DecodeArbiter, %function
VC1_Vfmw_DecodeArbiter:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 12288
	bl	_mcount
	ldrb	w0, [x21, 2432]
	tbz	x0, 4, .L1103
	mov	w2, -21
	ldr	w1, [x21, 5668]
	and	w0, w0, w2
	strb	w0, [x21, 2432]
	sub	w0, w1, #2
	cmp	w0, 1
	ldr	x0, [x19]
	bls	.L1106
.L1100:
	ldr	w0, [x0, 8]
	ldr	w2, [x21, 5564]
.L1044:
	sub	w1, w0, #1
	str	w0, [x21, 5668]
	cmp	w1, 3
	bls	.L1107
.L1073:
	mov	w1, 1
	.p2align 2
.L1050:
	cbz	w2, .L1063
.L1062:
	cmp	w2, 1
	bls	.L1108
.L1066:
	cbz	w1, .L1065
	add	x20, x21, 2432
	add	x0, x20, 16384
	ldrsb	w0, [x0, 1296]
	cbnz	w0, .L1068
	add	x19, x19, 28672
	add	x1, x20, 24576
	add	x2, x19, 3760
	add	x0, x1, 352
	add	x19, x19, 4008
	add	x1, x1, 600
	ldp	x2, x3, [x2]
	stp	x2, x3, [x0]
	mov	w0, 1
	ldp	x2, x3, [x19]
	stp	x2, x3, [x1]
	ldp	x2, x3, [x19, 16]
	stp	x2, x3, [x1, 16]
	ldp	x2, x3, [x19, 32]
	stp	x2, x3, [x1, 32]
	ldp	x2, x3, [x19, 48]
	stp	x2, x3, [x1, 48]
	ldp	x2, x3, [x19, 64]
	stp	x2, x3, [x1, 64]
	ldp	x2, x3, [x19, 80]
	stp	x2, x3, [x1, 80]
	ldp	x2, x3, [x19, 96]
	stp	x2, x3, [x1, 96]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1102:
	ldr	x0, [x19]
	ldr	w0, [x0, 8]
	str	w0, [x21, 5668]
	sub	w1, w0, #1
	cmp	w1, 3
	bls	.L1109
	mov	w1, 1
	.p2align 2
.L1063:
	ldrb	w0, [x21, 2434]
	sub	w3, w0, #1
	sub	w2, w0, #4
	uxtb	w3, w3
	uxtb	w2, w2
	cmp	w3, 1
	ccmp	w2, 1, 0, hi
	bls	.L1069
.L1064:
	sub	w0, w0, #2
	and	w0, w0, -3
	uxtb	w0, w0
	cbnz	w0, .L1066
	ldr	x2, .LC120
	mov	w1, 1478
	mov	w0, 1
	bl	dprint_normal
	.p2align 2
.L1065:
	add	x19, x19, 53248
	add	x0, x21, 2432
	ldr	w1, [x19, 192]
	bl	VC1_ClearCurPic
	ldr	x0, .LC122
	ldr	x4, [x0]
	cbz	x4, .L1103
	ldr	w0, [x19, 192]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L1103:
	mov	w0, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1107:
	ldr	x0, .LC116
	ldrb	w0, [x0,w1,uxtw]
	adr	x1, .Lrtx1052
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1052:
	.section	.rodata
	.align	0
	.align	2
.L1052:
	.byte	(.L1051 - .Lrtx1052) / 4
	.byte	(.L1053 - .Lrtx1052) / 4
	.byte	(.L1054 - .Lrtx1052) / 4
	.byte	(.L1055 - .Lrtx1052) / 4
	.text
	.p2align 3
.L1106:
	ldr	w0, [x0, 8]
	cmp	w0, 1
	ccmp	w0, 4, 4, hi
	beq	.L1045
	ldr	w2, [x21, 5564]
	b	.L1044
	.p2align 3
.L1054:
	mov	w1, 0
	b	.L1050
	.p2align 3
.L1055:
	ldrb	w0, [x21, 2434]
	cbnz	w0, .L1059
	str	wzr, [x21, 5600]
	mov	w1, 1
	b	.L1050
	.p2align 3
.L1053:
	add	x3, x21, 2432
	ldrb	w0, [x3, 2]
	cbz	w0, .L1073
	cmp	w0, 1
	mov	w1, 0
	bne	.L1050
	ldr	x4, [x3, 8]
	mov	x3, 65280
	movk	x3, 0xff, lsl 32
	and	x3, x4, x3
	cmp	x3, 256
	bne	.L1098
	mov	w1, w0
.L1098:
	cbnz	w2, .L1062
	.p2align 2
.L1069:
	ldr	x2, .LC118
	mov	w1, 1473
	mov	w0, 1
	bl	dprint_normal
	b	.L1065
	.p2align 3
.L1051:
	ldrb	w0, [x21, 2434]
	sub	w0, w0, #2
	and	w0, w0, -3
	uxtb	w0, w0
	cmp	w0, wzr
	cset	w1, ne
	b	.L1050
	.p2align 3
.L1068:
	add	x22, x20, 24576
	add	x19, x19, 28672
	add	x1, x19, 3776
	mov	x2, 172
	add	x0, x22, 368
	add	x23, x19, 3760
	bl	memcpy
	add	x4, x19, 3948
	add	x3, x22, 540
	mov	x2, 176
	ldp	x0, x1, [x4]
	stp	x0, x1, [x3]
	ldp	x0, x1, [x4, 16]
	stp	x0, x1, [x3, 16]
	ldp	x0, x1, [x4, 32]
	stp	x0, x1, [x3, 32]
	add	x1, x23, 360
	add	x0, x22, 712
	ldr	x5, [x4, 48]
	str	x5, [x3, 48]
	ldr	w4, [x19, 4004]
	str	w4, [x22, 596]
	bl	memcpy
	ldr	w0, [x19, 4164]
	add	x1, x23, 536
	strb	w0, [x20, 4]
	add	x0, x22, 888
	ldr	x2, .LC121
	ldr	w3, [x21, 5584]
	ldr	x4, [x2, 104]
	lsl	x2, x3, 2
	sub	x2, x2, x3
	lsl	x2, x2, 2
	blr	x4
	ldr	x23, [sp, 48]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1059:
	cmp	w0, 2
	bne	.L1061
	ldr	w0, [x21, 5600]
	cbnz	w0, .L1073
	mov	w1, 0
	cbnz	w2, .L1062
	b	.L1069
	.p2align 3
.L1061:
	and	w1, w0, -5
	uxtb	w1, w1
	cmp	w1, 1
	bne	.L1073
	str	w1, [x21, 5600]
	cbnz	w2, .L1062
	b	.L1069
	.p2align 3
.L1045:
	add	x22, x19, 53248
	ldr	w1, [x21, 5572]
	ldr	w0, [x22, 192]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L1046
	ldr	w0, [x22, 192]
	ldr	x1, [x20, 168]
	bl	FreeUsdByDec
	ldr	w0, [x22, 192]
	ldr	x1, [x20, 176]
	bl	FreeUsdByDec
	ldr	w0, [x22, 192]
	ldr	x1, [x20, 184]
	bl	FreeUsdByDec
	ldr	w0, [x22, 192]
	ldr	x1, [x20, 192]
	bl	FreeUsdByDec
	stp	xzr, xzr, [x20, 168]
	stp	xzr, xzr, [x20, 184]
	ldr	w1, [x21, 5572]
	ldr	w0, [x22, 192]
	bl	FSP_ClearLogicFs
	ldr	w1, [x21, 5568]
	ldr	w0, [x22, 192]
	bl	FSP_ClearLogicFs
	ldr	w0, [x22, 192]
	bl	FSP_GetNullLogicFs
	str	w0, [x21, 5568]
	str	w0, [x21, 5572]
.L1046:
	add	x0, x21, 2432
	str	wzr, [x21, 5564]
	add	x0, x0, 36864
	ldr	x1, [x0, 1136]
	cbz	x1, .L1102
	ldr	x2, [x0, 1144]
	cbz	x2, .L1102
	strb	wzr, [x1, 1]
	ldr	x1, [x0, 1144]
	strb	wzr, [x1, 1]
	ldr	x1, [x0, 1136]
	strb	wzr, [x1]
	ldr	x0, [x0, 1144]
	strb	wzr, [x0]
	ldr	x0, [x19]
	b	.L1100
.L1109:
	ldr	x0, .LC123
	mov	w2, 0
	ldrh	w0, [x0,w1,uxtw #1]
	adr	x1, .Lrtx1072
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx1072:
	.section	.rodata
	.align	0
	.align	2
.L1072:
	.2byte	(.L1051 - .Lrtx1072) / 4
	.2byte	(.L1053 - .Lrtx1072) / 4
	.2byte	(.L1054 - .Lrtx1072) / 4
	.2byte	(.L1055 - .Lrtx1072) / 4
	.text
.L1108:
	ldrb	w0, [x21, 2434]
	b	.L1064
	.size	VC1_Vfmw_DecodeArbiter, .-VC1_Vfmw_DecodeArbiter
	.align	3
.LC116:
	.xword	.L1052
	.align	3
.LC118:
	.xword	.LC117
	.align	3
.LC120:
	.xword	.LC119
	.align	3
.LC121:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC122:
	.xword	g_EventReportFunc
	.align	3
.LC123:
	.xword	.L1072
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_StartDecode
	.type	VC1_Vfmw_StartDecode, %function
VC1_Vfmw_StartDecode:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 12288
	add	x21, x19, 16
	bl	_mcount
	add	x22, x20, 2432
	add	x0, x22, 16384
	ldrsb	w0, [x0, 1296]
	cbz	w0, .L1125
.L1111:
	mov	x1, x21
	mov	x0, x19
	add	x23, x20, 2432
	bl	VC1_WritePicMsg
	ldr	w2, [x20, 5584]
	add	x1, x23, 3344
	ldr	x4, .LC124
	add	x0, x19, 208
	strb	w2, [x21, 74]
	uxtw	x2, w2
	lsl	x3, x2, 3
	ldr	x4, [x4, 104]
	sub	x2, x3, x2
	lsl	x2, x2, 3
	blr	x4
	mov	x0, x22
	mov	x1, x21
	bl	VC1_CfgVDH
	ldrb	w0, [x20, 2434]
	cmp	w0, 1
	bls	.L1126
.L1112:
	cmp	w0, 5
	beq	.L1127
	strb	wzr, [x21, 1]
	add	x23, x20, 2432
	ldrsb	w2, [x20, 2436]
	ldrb	w1, [x20, 2441]
	strb	w2, [x19, 16]
	strb	w2, [x20, 2435]
	strb	w1, [x20, 2442]
	strb	w0, [x20, 2444]
	ldrb	w1, [x21, 3]
	cmp	w1, 2
	beq	.L1128
.L1115:
	and	w0, w1, -5
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L1116
	str	w0, [x20, 5600]
.L1116:
	ldr	x2, [x19]
	str	x21, [x19, 8]
	ldr	w0, [x2, 880]
	cmp	w0, 1
	beq	.L1129
	cmp	w0, 2
	beq	.L1130
.L1120:
	mov	w0, 1
.L1117:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1130:
	ldr	w0, [x2, 884]
	cmp	w0, wzr
	ccmp	x21, xzr, 4, gt
	beq	.L1120
	sub	w1, w1, #2
	mov	w0, 1
	and	w1, w1, -3
	uxtb	w1, w1
	cbnz	w1, .L1117
	add	x20, x20, 2432
	add	x3, x19, 53248
	add	x20, x20, 36864
	mov	x0, x22
	ldr	x1, [x20, 1128]
	strb	wzr, [x1, 1]
	ldr	x2, [x19]
	ldr	w1, [x2, 884]
	sub	w1, w1, #1
	str	w1, [x2, 884]
	ldr	w1, [x3, 192]
	bl	VC1_ClearCurPic
	str	xzr, [x19, 8]
	mov	w0, 0
	b	.L1117
	.p2align 3
.L1127:
	mov	w4, 1
	strb	w4, [x21, 1]
	strb	w4, [x20, 2441]
	mov	w1, 1
	ldrsb	w2, [x20, 2437]
	add	x23, x20, 2432
	strb	w2, [x20, 2436]
	ldr	w3, [x20, 5624]
	str	w3, [x21, 152]
	strb	w2, [x19, 16]
	strb	w2, [x20, 2435]
	strb	w1, [x20, 2442]
	strb	w0, [x20, 2444]
	ldrb	w1, [x21, 3]
	cmp	w1, 2
	bne	.L1115
.L1128:
	ldr	w0, [x20, 5600]
	cbnz	w0, .L1116
	add	x1, x19, 53248
	mov	x0, x22
	add	x23, x23, 36864
	ldr	w1, [x1, 192]
	bl	VC1_ClearCurPic
	ldr	x1, [x23, 1128]
	mov	w0, 0
	strb	wzr, [x1]
	ldr	w1, [x20, 5604]
	add	w1, w1, 1
	str	w1, [x20, 5604]
	str	xzr, [x19, 8]
	b	.L1117
	.p2align 3
.L1126:
	ldrb	w1, [x20, 2436]
	strb	w1, [x20, 2437]
	b	.L1112
	.p2align 3
.L1129:
	cbz	x21, .L1117
	sub	w1, w1, #2
	and	w1, w1, -3
	uxtb	w1, w1
	cbnz	w1, .L1117
	add	x20, x20, 2432
	add	x1, x19, 53248
	add	x20, x20, 36864
	mov	x0, x22
	ldr	x2, [x20, 1128]
	strb	wzr, [x2, 1]
	ldr	w1, [x1, 192]
	bl	VC1_ClearCurPic
	str	xzr, [x19, 8]
	mov	w0, 0
	b	.L1117
	.p2align 3
.L1125:
	mov	x0, x22
	bl	VC1_Vfmw_UpdataLastPicRNDCTRL.part.3
	b	.L1111
	.size	VC1_Vfmw_StartDecode, .-VC1_Vfmw_StartDecode
	.align	3
.LC124:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvHdr
	.type	VC1_Vfmw_ParseAdvHdr, %function
VC1_Vfmw_ParseAdvHdr:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	mov	w23, w2
	mov	x24, x1
	bl	_mcount
	add	x22, x19, 3296
	ldr	x25, [x19, 3248]
	mov	w1, 32
	strb	wzr, [x19, 6]
	mov	x0, x25
	strh	wzr, [x29, 92]
	str	wzr, [x29, 88]
	bl	BsGet
	ldr	w21, [x22, 28]
	ldr	w3, [x25, 32]
	uxtb	w26, w0
	ldr	x20, [x19, 3296]
	mov	x0, x25
	lsr	w3, w3, 3
	sub	w21, w21, w3
	add	x20, x20, x3
	mov	w2, w21
	mov	x1, x20
	bl	BsInit
	sub	w0, w26, #10
	cmp	w0, 5
	bhi	.L1132
	cmp	w26, 11
	beq	.L1220
	ldrb	w1, [x19]
	and	w2, w1, 7
	cmp	w2, 7
	beq	.L1221
	ldr	x2, .LC132
	strb	wzr, [x19, 9]
	str	wzr, [x19, 3152]
	ldrh	w0, [x2,w0,uxtw #1]
	adr	x2, .Lrtx1148
	add	x0, x2, w0, sxth #2
	br	x0
.Lrtx1148:
	.section	.rodata
	.align	0
	.align	2
.L1148:
	.2byte	(.L1147 - .Lrtx1148) / 4
	.2byte	(.L1169 - .Lrtx1148) / 4
	.2byte	(.L1149 - .Lrtx1148) / 4
	.2byte	(.L1170 - .Lrtx1148) / 4
	.2byte	(.L1151 - .Lrtx1148) / 4
	.2byte	(.L1152 - .Lrtx1148) / 4
	.text
	.p2align 3
.L1132:
	sub	w0, w26, #27
	cmp	w0, 4
	bhi	.L1163
	cmp	w26, 28
	ccmp	w21, 5, 4, gt
	ble	.L1165
	cbz	w21, .L1165
	mov	x0, 0
	.p2align 2
.L1168:
	cmp	w0, 5
	bls	.L1222
.L1167:
	add	x0, x0, 1
	cmp	w21, w0
	bhi	.L1168
	mov	w0, 21572
	ldr	w1, [x29, 88]
	movk	w0, 0x3147, lsl 16
	cmp	w1, w0
	bne	.L1165
	ldrb	w0, [x29, 92]
	add	x19, x19, 36864
	cmp	w0, 65
	cset	w1, eq
	str	w1, [x19, 1200]
	bne	.L1165
	ldrb	w0, [x29, 93]
	and	w0, w0, 15
	str	w0, [x19, 1204]
.L1165:
	mov	x1, x22
	mov	w0, w23
	bl	VC1_ClearCurPacket
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1163:
	cmp	w26, 254
	beq	.L1223
.L1169:
	mov	w0, w23
	mov	x1, x22
	bl	VC1_ClearCurPacket
	mov	w0, 0
.L1137:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1220:
	ldrb	w0, [x19]
	and	w0, w0, 7
	cmp	w0, 7
	bne	.L1169
	mov	x2, x24
	mov	x1, x19
	mov	x0, x25
	bl	VC1_Vfmw_ParseAdvSlcHdr
	cmp	w0, 1
	mov	w21, w0
	bne	.L1135
	ldr	w0, [x19, 3152]
	cmp	w0, 255
	bls	.L1136
	mov	w1, w23
	mov	x0, x19
	bl	VC1_ClearCurPic
	ldr	x2, .LC126
	mov	w1, 4127
	ldr	w3, [x19, 3152]
	mov	w0, w21
	bl	dprint_normal
	mov	w0, 0
	b	.L1137
	.p2align 3
.L1223:
	mov	w1, 32
	mov	x0, x25
	bl	BsGet
	mov	w20, w0
	mov	w1, 32
	mov	x0, x25
	bl	BsGet
	mov	w2, 20553
	mov	w1, 20036
	movk	w2, 0x4853, lsl 16
	movk	w1, 0x4345, lsl 16
	cmp	w20, w2
	ccmp	w0, w1, 0, eq
	bne	.L1169
	ldr	w1, [x19, 3152]
	mov	w0, 1
	strb	w0, [x19, 8]
	mov	w0, 1
	cbz	w1, .L1137
	ldrb	w1, [x19]
	strb	w0, [x19, 6]
	orr	w1, w1, 16
	strb	w1, [x19]
	b	.L1137
	.p2align 3
.L1170:
	ldr	x21, .LC133
.L1204:
	ldr	x3, [x21, 96]
	mov	x2, 176
	mov	w1, 0
	add	x0, x24, 360
	ldrb	w26, [x24, 391]
	blr	x3
	strb	w26, [x24, 391]
.L1153:
	ldr	x3, [x21, 96]
	add	x26, x19, 3344
	mov	x2, 14336
	mov	w1, 0
	mov	x0, x26
	blr	x3
	mov	x0, x25
	bl	BsPos
	str	w0, [x24, 500]
	mov	x2, x24
	mov	x1, x19
	mov	x0, x25
	bl	VC1_Vfmw_ParseAdvPicHdr
	cmp	w0, 1
	mov	w21, w0
	beq	.L1224
	mov	x1, x22
	mov	w0, w23
	bl	VC1_ClearCurPacket
	mov	w3, 4208
	ldr	x2, .LC135
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w0, w21
	b	.L1137
	.p2align 3
.L1221:
	mov	w0, 1
	orr	w1, w1, 16
	strb	w0, [x19, 6]
	mov	w0, 1
	strb	w1, [x19]
	b	.L1137
	.p2align 3
.L1151:
	mov	x2, x24
	mov	x1, x19
	mov	x0, x25
	bl	VC1_Vfmw_ParseAdvEntptHdr
	cmp	w0, 1
	mov	w20, w0
	beq	.L1225
.L1162:
	mov	w0, w23
	mov	x1, x22
	bl	VC1_ClearCurPacket
	mov	w0, w20
	b	.L1137
	.p2align 3
.L1152:
	mov	x2, x24
	mov	x1, x19
	mov	x0, x25
	bl	VC1_Vfmw_ParseAdvSeqHdr
	cmp	w0, 1
	mov	w20, w0
	bne	.L1162
	ldrb	w0, [x19]
	orr	w0, w0, 1
	strb	w0, [x19]
	b	.L1162
	.p2align 3
.L1147:
	orr	w0, w1, 32
	mov	x1, x22
	strb	w0, [x19]
	mov	w0, w23
	bl	VC1_ClearCurPacket
	mov	w0, 1
	b	.L1137
	.p2align 3
.L1149:
	ldr	x21, .LC133
	mov	w0, 1
	strb	w0, [x19, 9]
	mov	x2, 16
	mov	w1, 0
	add	x0, x24, 520
	ldr	x3, [x21, 96]
	blr	x3
	ldrb	w0, [x19, 9]
	cbnz	w0, .L1153
	b	.L1204
	.p2align 3
.L1135:
	mov	x1, x22
	mov	w0, w23
	bl	VC1_ClearCurPacket
	mov	w3, 4136
	ldr	x2, .LC131
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w0, w21
	b	.L1137
	.p2align 3
.L1224:
	mov	x0, x25
	bl	BsPos
	ldr	w1, [x24, 500]
	sub	w0, w0, w1
	str	w0, [x24, 500]
	mov	x0, x25
	ldrb	w1, [x19]
	orr	w1, w1, 4
	strb	w1, [x19]
	bl	BsPos
	add	w0, w0, 32
	ldr	w1, [x22, 28]
	cmp	w0, w1, lsl 3
	bge	.L1155
	ldr	w4, [x19, 3152]
	add	x23, x24, 536
	ldr	x2, [x19, 3248]
	uxtw	x0, w4
	lsl	x1, x0, 3
	lsl	x3, x0, 2
	sub	x1, x1, x0
	sub	x0, x3, x0
	lsl	x1, x1, 3
	add	x21, x26, x1
	add	x23, x23, x0, lsl 2
	strb	w4, [x21, 16]
	ldr	w0, [x2, 32]
	ubfx	x0, x0, 3, 29
	add	x0, x20, x0
	str	x0, [x26, x1]
.L1219:
	ldr	w1, [x2, 32]
	and	w1, w1, 7
	str	w1, [x21, 24]
	ldr	w1, [x2, 24]
	ldr	w2, [x2, 32]
	lsl	w1, w1, 3
	sub	w1, w1, w2
	str	w1, [x21, 28]
	bl	MEM_Vir2Phy
	str	w0, [x21, 20]
	ldr	w0, [x22, 36]
	str	w0, [x21, 48]
	ldr	x1, [x22, 8]
	cbz	x1, .L1156
	ldr	w0, [x22, 24]
	cbz	w0, .L1156
	str	x1, [x21, 8]
	str	wzr, [x21, 40]
	ldr	w0, [x22, 32]
	lsl	w0, w0, 3
	str	w0, [x21, 44]
	ldr	w0, [x22, 24]
	str	w0, [x21, 36]
	ldr	w0, [x22, 40]
	str	w0, [x21, 52]
.L1157:
	ldr	w5, [x19, 3104]
	ldr	w0, [x19, 3108]
	ldrb	w2, [x19, 9]
	mul	w5, w0, w5
	sub	w5, w5, #1
	cbz	w2, .L1158
	add	w0, w0, 1
	ldr	w4, [x23, 4]
	add	w0, w0, w0, lsr 31
	sub	w4, w4, w0, asr 1
	str	w4, [x21, 32]
	cmp	w4, wzr
	ccmp	w5, w4, 2, gt
	bcc	.L1226
.L1141:
	ldr	w0, [x21, 28]
	cmp	w0, wzr
	ble	.L1144
	cbz	x1, .L1160
	ldr	w0, [x21, 44]
	cmp	w0, wzr
	ble	.L1144
.L1160:
	ldr	w1, [x19, 3152]
	mov	w0, 1
	add	w1, w1, w0
	str	w1, [x19, 3152]
	b	.L1137
	.p2align 3
.L1156:
	mov	x1, 0
	str	xzr, [x21, 8]
	stp	wzr, wzr, [x21, 36]
	str	wzr, [x21, 44]
	str	wzr, [x21, 52]
	b	.L1157
	.p2align 3
.L1155:
	mov	x1, x22
	mov	w0, w23
	bl	VC1_ClearCurPacket
	mov	w3, 4202
	ldr	x2, .LC135
	mov	w1, w3
	mov	w0, w21
	bl	dprint_normal
	mov	w0, w21
	b	.L1137
	.p2align 3
.L1158:
	ldr	w4, [x23, 4]
	str	w4, [x21, 32]
	cmp	w5, w4
	bcs	.L1141
	ldr	x2, .LC128
	mov	w1, 4048
	ldr	w3, [x23, 4]
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	b	.L1137
	.p2align 3
.L1136:
	uxtw	x4, w0
	add	x3, x19, 3344
	lsl	x1, x4, 3
	ldr	x2, [x19, 3248]
	sub	x1, x1, x4
	lsl	x23, x4, 2
	lsl	x1, x1, 3
	sub	x4, x23, x4
	add	x21, x3, x1
	add	x23, x24, 536
	add	x23, x23, x4, lsl 2
	strb	w0, [x21, 16]
	ldr	w0, [x2, 32]
	ubfx	x0, x0, 3, 29
	add	x0, x20, x0
	str	x0, [x3, x1]
	b	.L1219
.L1225:
	mov	x1, x24
	mov	x0, x19
	bl	VC1_Vfmw_UpdateAdvSPS
	ldrb	w0, [x19]
	orr	w0, w0, 2
	strb	w0, [x19]
	b	.L1162
.L1144:
	ldr	x2, .LC129
	mov	w1, 4055
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	b	.L1137
.L1226:
	ldr	x2, .LC127
	mov	w1, 4036
	ldr	w5, [x19, 3108]
	mov	w0, 1
	ldr	w3, [x23, 4]
	bl	dprint_normal
	mov	w0, 0
	b	.L1137
.L1222:
	add	x1, x29, 88
	ldrb	w2, [x20, x0]
	strb	w2, [x0, x1]
	b	.L1167
	.size	VC1_Vfmw_ParseAdvHdr, .-VC1_Vfmw_ParseAdvHdr
	.align	3
.LC126:
	.xword	.LC125
	.align	3
.LC127:
	.xword	.LC85
	.align	3
.LC128:
	.xword	.LC87
	.align	3
.LC129:
	.xword	.LC89
	.align	3
.LC131:
	.xword	.LC130
	.align	3
.LC132:
	.xword	.L1148
	.align	3
.LC133:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC135:
	.xword	.LC134
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseHeader
	.type	VC1_Vfmw_ParseHeader, %function
VC1_Vfmw_ParseHeader:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	w21, w2
	bl	_mcount
	add	x0, x19, 16384
	ldrsb	w0, [x0, 1296]
	cbnz	w0, .L1228
	ldrb	w3, [x19]
	mov	x2, x20
	ldr	x0, [x19, 3248]
	mov	x1, x19
	orr	w3, w3, 3
	strb	w3, [x19]
	bl	VC1_Vfmw_ParseSMPPicHdr
	cmp	w0, 1
	beq	.L1230
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1228:
	mov	w2, w21
	mov	x1, x20
	mov	x0, x19
	bl	VC1_Vfmw_ParseAdvHdr
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1230:
	ldrb	w2, [x19]
	mov	w1, 20
	orr	w1, w2, w1
	strb	w1, [x19]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VC1_Vfmw_ParseHeader, .-VC1_Vfmw_ParseHeader
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_SetCodeInfo
	.type	VC1_SetCodeInfo, %function
VC1_SetCodeInfo:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 12288
	mov	x21, x1
	bl	_mcount
	add	x2, x19, 2432
	add	x1, x2, 16384
	add	x0, x2, 3256
	str	x0, [x19, 5680]
	ldrb	w1, [x1, 1298]
	cmp	w1, 8
	beq	.L1236
	strb	wzr, [x2, 14]
	strb	w1, [x2, 13]
.L1233:
	add	x20, x19, 2432
	ldr	w2, [x21, 28]
	add	x20, x20, 16384
	ldrsb	w1, [x20, 1296]
	cbz	w1, .L1237
	ldr	x1, [x21]
	bl	BsInit
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1237:
	ldr	x1, [x21]
	bl	BsInit
	ldr	w1, [x20, 1304]
	add	x3, x20, 1312
	add	x2, x20, 1328
	adds	w4, w1, 15
	add	w0, w1, 30
	csel	w0, w0, w4, mi
	asr	w0, w0, 4
	str	w0, [x19, 5536]
	ldr	w0, [x20, 1308]
	str	w0, [x19, 5556]
	str	w1, [x19, 5552]
	add	w1, w0, 30
	adds	w0, w0, 15
	csel	w0, w1, w0, mi
	asr	w0, w0, 4
	str	w0, [x19, 5540]
	ldp	x0, x1, [x3]
	stp	x0, x1, [x2]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1236:
	mov	w3, 1
	mov	w1, 6
	strb	w3, [x2, 14]
	strb	w1, [x2, 13]
	b	.L1233
	.size	VC1_SetCodeInfo, .-VC1_SetCodeInfo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_ReceivePacket
	.type	VC1_ReceivePacket, %function
VC1_ReceivePacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	add	x1, x20, 16384
	add	x1, x1, 1632
	cbz	x19, .L1246
	ldr	w0, [x19, 16]
	str	w0, [x1, 20]
	ldr	x0, [x19]
	str	x0, [x20, 18016]
	ldr	w0, [x19, 20]
	str	w0, [x1, 28]
	ldrb	w0, [x19, 10]
	strb	w0, [x1, 16]
	ldr	w0, [x19, 24]
	str	w0, [x1, 36]
	ldrb	w0, [x19, 10]
	cmp	w0, 1
	beq	.L1241
	ldr	w0, [x19, 104]
	str	w0, [x1, 24]
	ldr	x0, [x19, 88]
	str	x0, [x1, 8]
	ldr	w0, [x19, 108]
	str	w0, [x1, 32]
	ldrb	w0, [x19, 98]
	strb	w0, [x1, 17]
	ldr	w0, [x19, 112]
	str	w0, [x1, 40]
	ldrb	w0, [x19, 98]
	cmp	w0, 1
	bne	.L1247
.L1242:
	mov	x0, x20
	bl	VC1_SetCodeInfo
	mov	w0, 1
.L1240:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1247:
	add	x20, x20, 53248
	ldr	w0, [x20, 192]
	bl	VC1_ClearCurPacket
	ldrb	w3, [x19, 98]
	mov	w1, 4396
	ldr	x2, .LC139
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1241:
	strb	wzr, [x1, 17]
	str	xzr, [x1, 8]
	str	wzr, [x1, 24]
	str	wzr, [x1, 32]
	str	wzr, [x1, 40]
	b	.L1242
	.p2align 3
.L1246:
	ldr	x2, .LC137
	mov	w1, 4375
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	b	.L1240
	.size	VC1_ReceivePacket, .-VC1_ReceivePacket
	.align	3
.LC137:
	.xword	.LC136
	.align	3
.LC139:
	.xword	.LC138
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1DEC_Decode
	.type	VC1DEC_Decode, %function
VC1DEC_Decode:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x22, x1
	add	x20, x19, 12288
	bl	_mcount
	add	x21, x20, 2256
	ldr	x3, .LC140
	mov	x2, 176
	mov	x1, x22
	mov	x0, x21
	ldr	x3, [x3, 104]
	blr	x3
	mov	x1, x21
	mov	x0, x19
	bl	VC1_ReceivePacket
	mov	w21, w0
	cbz	w0, .L1269
	ldrsb	w0, [x20, 2439]
	add	x23, x19, 16384
	cbz	w0, .L1270
	ldrb	w0, [x23, 1576]
	add	x22, x19, 53248
	strb	w0, [x20, 2432]
	add	x1, x19, 28672
	add	x20, x20, 2432
	add	x1, x1, 3760
	ldr	w2, [x22, 192]
	mov	x0, x20
	bl	VC1_Vfmw_ParseHeader
	cbnz	w0, .L1253
.L1271:
	ldr	w0, [x22, 192]
	add	x1, x23, 1632
	bl	VC1_ClearCurPacket
	ldr	x0, .LC143
	ldr	x4, [x0]
	cbz	x4, .L1255
.L1267:
	ldr	w0, [x22, 192]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	mov	w21, 0
	blr	x4
.L1250:
	mov	w0, w21
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1270:
	ldrb	w0, [x20, 2432]
	add	x22, x19, 53248
	strb	w0, [x23, 1576]
	add	x20, x20, 2432
	add	x1, x19, 28672
	mov	x0, x20
	ldr	w2, [x22, 192]
	add	x1, x1, 3760
	bl	VC1_Vfmw_ParseHeader
	cbz	w0, .L1271
.L1253:
	mov	x0, x19
	bl	VC1_Vfmw_DecodeArbiter
	cbnz	w0, .L1272
.L1255:
	mov	w21, 0
.L1273:
	mov	w0, w21
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1269:
	add	x19, x19, 16384
	ldr	x2, .LC142
	mov	w1, 569
	ldr	w3, [x19, 1492]
	bl	dprint_normal
	ldr	x23, [sp, 48]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1272:
	mov	x0, x19
	bl	VC1_Vfmw_PrepareDecode
	cbnz	w0, .L1256
	ldrsb	w0, [x20, 7]
	cbnz	w0, .L1255
	ldr	w1, [x22, 192]
	mov	x0, x20
	bl	VC1_ClearCurPic
	ldr	x0, .LC143
	ldr	x4, [x0]
	cbnz	x4, .L1267
	mov	w21, 0
	b	.L1273
	.p2align 3
.L1256:
	mov	x0, x19
	mov	w21, 1
	bl	VC1_Vfmw_StartDecode
	cbnz	w0, .L1250
	ldr	w0, [x22, 192]
	add	x19, x19, 49152
	ldr	w1, [x23, 1480]
	bl	FSP_ClearLogicFs
	ldr	x1, [x19, 3560]
	ldr	x0, .LC143
	strb	wzr, [x1]
	ldr	x1, [x19, 3560]
	strb	wzr, [x1, 1]
	ldr	x4, [x0]
	cbnz	x4, .L1267
	mov	w21, 0
	b	.L1273
	.size	VC1DEC_Decode, .-VC1DEC_Decode
	.align	3
.LC140:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC142:
	.xword	.LC141
	.align	3
.LC143:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_GetPacketState
	.type	VC1_GetPacketState, %function
VC1_GetPacketState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 12288
	bl	_mcount
	mov	w0, 2
	ldrsb	w1, [x19, 2438]
	ldr	x19, [sp, 16]
	cmp	w1, 1
	csel	w0, w0, wzr, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1_GetPacketState, .-VC1_GetPacketState
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.9915, %object
	.size	__func__.9915, 12
__func__.9915:
	.string	"VC1DEC_Init"
	.zero	4
	.type	__func__.9924, %object
	.size	__func__.9924, 13
__func__.9924:
	.string	"Vc1SMPSeqHdr"
	.zero	3
	.type	__func__.9969, %object
	.size	__func__.9969, 19
__func__.9969:
	.string	"VC1_ArrangeVahbMem"
	.zero	5
.LC0:
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	2
	.word	1
	.word	2
	.word	2
	.word	3
	.word	3
	.word	3
.LC1:
	.word	3
	.word	1
	.word	2
	.word	0
	.word	4
	.zero	4
.LC2:
	.word	1
	.word	0
	.word	2
	.word	3
	.word	4
	.zero	4
.LC3:
	.word	1
	.word	1
	.word	2
	.word	1
	.word	3
	.word	1
	.word	2
	.zero	4
.LC4:
	.word	2
	.word	3
	.word	3
	.word	4
	.word	4
	.word	5
	.word	5
	.zero	4
.LC5:
	.word	3
	.word	4
	.word	1
	.word	5
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	1
	.word	3
	.word	5
	.word	7
.LC6:
	.word	5
	.word	5
	.word	6
	.word	6
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	8
	.word	8
	.word	8
	.word	8
.LC7:
	.word	256
	.word	128
	.word	85
	.word	64
	.word	51
	.word	43
	.word	37
	.word	32
	.type	__func__.10213, %object
	.size	__func__.10213, 17
__func__.10213:
	.string	"VC1_DecBfraction"
	.zero	7
	.type	aCount, %object
	.size	aCount, 128
aCount:
	.word	0
	.word	1
	.word	1
	.word	2
	.word	1
	.word	2
	.word	2
	.word	3
	.word	1
	.word	2
	.word	2
	.word	3
	.word	2
	.word	3
	.word	3
	.word	4
	.word	1
	.word	2
	.word	2
	.word	3
	.word	2
	.word	3
	.word	3
	.word	4
	.word	2
	.word	3
	.word	3
	.word	4
	.word	3
	.word	4
	.word	4
	.word	5
	.type	a2On4Off, %object
	.size	a2On4Off, 60
a2On4Off:
	.word	3
	.word	5
	.word	6
	.word	9
	.word	10
	.word	12
	.word	17
	.word	18
	.word	20
	.word	24
	.word	33
	.word	34
	.word	36
	.word	40
	.word	48
	.zero	4
.LC8:
	.word	1
	.word	2
	.word	2
	.word	2
	.word	0
	.word	1
	.word	0
	.word	1
.LC9:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	27
	.word	29
	.word	31
	.align	3
.LANCHOR1 = . + 0
	.type	FldPTypeTab, %object
	.size	FldPTypeTab, 64
FldPTypeTab:
	.word	0
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	2
	.word	2
	.word	2
	.word	4
	.word	4
	.word	2
	.word	4
	.word	4
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC14:
	ASCII(.string	"%s get ChanID = -1!\n\n" )
	.zero	2
.LC16:
	ASCII(.string	"Vc1SMPSeqHdr Err, BS is wrong" )
	.zero	2
.LC19:
	ASCII(.string	"%s: %s\n" )
.LC21:
	ASCII(.string	"Vc1SMPSeqHdr Err, BS is wrong\n" )
	.zero	1
.LC27:
	ASCII(.string	"%s arrange fs pool failed!\n" )
	.zero	4
.LC29:
	ASCII(.string	"line: %d, pImage is NULL!\n" )
	.zero	5
.LC32:
	ASCII(.string	"get frame store fail!\n" )
	.zero	1
.LC34:
	ASCII(.string	"VC1_Vfmw_GetImageBuffer get imgbuf err, clear all ref!\n" )
.LC36:
	ASCII(.string	"VC1_Vfmw_GetImageBuffer get_flag!=1, FSP_ClearLogicFs.\n" )
.LC39:
	ASCII(.string	"VC1 IsAdvProfile %d: SizeChanged New %dx%d, Old %dx%d\n" )
	.zero	1
.LC41:
	ASCII(.string	"VC1_Vfmw_GetStreamInfo VC1_Vfmw_GetImageBuffer err!\n" )
	.zero	3
.LC43:
	ASCII(.string	"dec_pts: %lld Usertag = %lld\n" )
	.zero	2
.LC46:
	ASCII(.string	"---------- unref %d\n" )
	.zero	3
.LC48:
	ASCII(.string	"VC1_Vfmw_GetStreamInfo B pic pCodecInf->RefNum < 2 err!\n" )
	.zero	7
.LC50:
	ASCII(.string	"line: %d (pCur,pFwd,pBwd)(%p,%p,%p)\n" )
	.zero	3
.LC52:
	ASCII(.string	"VC1_Vfmw_GetStreamInfo imgbuf = NULL err!\n" )
	.zero	5
.LC54:
	ASCII(.string	"CurFs(fwd%d,cur%d,bwd%d) abnormal!(pDec%p/pDisp%p)\n" )
	.zero	4
.LC56:
	ASCII(.string	"VC1_Vfmw_GetStreamInfo VC1_Vfmw_BuildRefList err!\n" )
	.zero	5
.LC69:
	ASCII(.string	"%s:%d Code(%d) is invalid\n" )
	.zero	5
.LC71:
	ASCII(.string	"%s:%d Denominator(%d) is invalid\n" )
	.zero	6
.LC85:
	ASCII(.string	"SLICE_ADDR = %d,SlcEndMbn = %d, MbHeight = %d\n" )
	.zero	1
.LC87:
	ASCII(.string	"SLICE_ADDR = %d,SlcEndMbn = %d, totalMbMin1 = %d\n" )
	.zero	6
.LC89:
	ASCII(.string	"VC1_RecordSlcStream stream len <= 0\n" )
	.zero	3
.LC92:
	ASCII(.string	"Check Pos 2: %d\n" )
	.zero	7
.LC94:
	ASCII(.string	"Check Pos 3: %d\n" )
	.zero	7
.LC98:
	ASCII(.string	"VC1_Vfmw_ParseMPBPicHdr err!\n" )
	.zero	2
.LC100:
	ASCII(.string	"VC1_Vfmw_ParseSMPIPicHdr err!\n" )
	.zero	1
.LC102:
	ASCII(.string	"After VC1_Vfmw_ParseSMPPicHdr BS Len <= 0 err!\n" )
.LC108:
	ASCII(.string	"pImg is null, pCurImg %p pBwdImg %p.\n" )
	.zero	2
.LC110:
	ASCII(.string	"line: %d, pToQueImg is Null!\n" )
	.zero	2
.LC112:
	ASCII(.string	"insert buf %d ref %d\n" )
	.zero	2
.LC114:
	ASCII(.string	"err(%d) > out_thr(%d)\n" )
	.zero	1
.LC117:
	ASCII(.string	"NOTE: Drop non-I\n" )
	.zero	6
.LC119:
	ASCII(.string	"NOTE: Drop B\n" )
	.zero	2
.LC125:
	ASCII(.string	" pCodecInf->SlcNum = %d >= 256 \n" )
	.zero	7
.LC130:
	ASCII(.string	"line %d, Code = VC1_SCSLC failed!\n" )
	.zero	5
.LC134:
	ASCII(.string	"line %d, Code = VC1_SCFRM failed!\n" )
	.zero	5
.LC136:
	ASCII(.string	"bitsream para error -----\n" )
	.zero	5
.LC138:
	ASCII(.string	"line %d, pPacket->StreamPack[1].IsLastSeg = %d\n" )
.LC141:
	ASCII(.string	"ERROR: frm %d, Invalid packet pointer!\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
