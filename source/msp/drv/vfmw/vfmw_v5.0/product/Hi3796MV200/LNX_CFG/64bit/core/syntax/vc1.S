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
	.global	AbandonBitsLenthNoUse
	.type	AbandonBitsLenthNoUse, %function
AbandonBitsLenthNoUse:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w1, [x19]
	mov	w0, 0
	cbz	w1, .L22
	b	.L26
	.p2align 3
.L20:
	mov	w0, w2
.L22:
	ldrb	w1, [x19, -1]!
	add	w2, w0, 8
	cbz	w1, .L20
	add	w0, w0, 9
.L18:
	tbz	x1, 0, .L23
	b	.L16
	.p2align 3
.L21:
	mov	w2, w0
.L23:
	lsr	w1, w1, 1
	add	w0, w2, 1
	tbz	x1, 0, .L21
	add	w0, w2, 2
.L16:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L26:
	mov	w0, 1
	mov	w2, 0
	b	.L18
	.size	AbandonBitsLenthNoUse, .-AbandonBitsLenthNoUse
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
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x21, xzr, 4, ne
	beq	.L31
	ldr	x3, .LC14
	add	x19, x20, 53248
	mov	x2, 54160
	mov	w1, 0
	mov	x0, x20
	ldr	x3, [x3, 96]
	ldr	w22, [x19, 896]
	blr	x3
	str	w22, [x19, 896]
	add	x0, x19, 296
	bl	ResetVoQueue
	add	x4, x20, 12288
	ldr	w1, [x21, 32]
	str	x21, [x20]
	mov	w5, 1
	add	w1, w1, 255
	mov	x0, x20
	strb	w5, [x4, 2529]
	and	w1, w1, -256
	add	w3, w1, 4096
	add	w2, w1, 8192
	ldr	w6, [x21, 8]
	str	w6, [x19, 236]
	add	w6, w1, 2048
	str	w1, [x19, 208]
	add	w1, w1, 12288
	str	w3, [x19, 216]
	add	w3, w3, 2048
	str	w2, [x19, 224]
	add	w2, w2, 2048
	str	w6, [x19, 212]
	str	w3, [x19, 220]
	stp	w2, w1, [x19, 228]
	strb	w5, [x4, 2530]
	stp	wzr, wzr, [x19, 168]
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x19, 904]
	beq	.L32
	ldr	x1, .LC18
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, 1
.L29:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L31:
	ldr	x1, .LC13
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -2
	b	.L29
	.p2align 3
.L32:
	ldr	x1, .LC16
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L29
	.size	VC1DEC_Init, .-VC1DEC_Init
	.align	3
.LC13:
	.xword	.LC12
	.align	3
.LC14:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC16:
	.xword	.LC15
	.align	3
.LC18:
	.xword	.LC17
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
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L47
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
	ldr	w1, [x19, 8]
	str	w0, [x19, 12]
	cmp	w1, 8192
	bgt	.L38
	cmp	w0, 8192
	bgt	.L39
	cmp	w1, 31
	ble	.L38
	cmp	w0, 31
	ble	.L39
	mov	w1, 2
	add	x0, x29, 56
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 16]
	bhi	.L41
	mov	w1, 2
	add	x0, x29, 56
	bl	BsGet
	cbnz	w0, .L41
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
	cbnz	w0, .L41
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
	cbnz	w0, .L41
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
	cbnz	w1, .L42
	strb	wzr, [x19, 28]
.L42:
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
	cbnz	w0, .L48
.L35:
	mov	w0, w20
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L48:
	ldr	x1, .LC31
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L41:
	ldr	x3, .LC29
.L46:
	ldr	x2, .LC23
	mov	w0, 0
	ldr	x1, .LC25
	mov	w20, -1
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L39:
	ldr	x3, .LC27
	b	.L46
	.p2align 3
.L47:
	ldr	x1, .LC20
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L35
	.p2align 3
.L38:
	ldr	x3, .LC22
	b	.L46
	.size	Vc1SMPSeqHdr, .-Vc1SMPSeqHdr
	.align	3
.LC20:
	.xword	.LC19
	.align	3
.LC22:
	.xword	.LC21
	.align	3
.LC23:
	.xword	.LANCHOR0
	.align	3
.LC25:
	.xword	.LC24
	.align	3
.LC27:
	.xword	.LC26
	.align	3
.LC29:
	.xword	.LC28
	.align	3
.LC31:
	.xword	.LC30
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_SetImgFormat
	.type	VC1_SetImgFormat, %function
VC1_SetImgFormat:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x24, x0
	mov	x0, x30
	add	x20, x24, 12288
	bl	_mcount
	add	x21, x20, 2520
	add	x1, x21, 20480
	add	x0, x24, 53248
	ldr	w1, [x1, 3716]
	ldr	w0, [x0, 904]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L49
	mov	w22, 1
	str	w22, [x0, 296]
	ldrsb	w0, [x20, 2523]
	cmp	w0, 3
	beq	.L60
	ldr	x3, .LC32
	mov	x2, 4
	strb	wzr, [x19, 284]
	mov	w1, 0
	add	x0, x19, 64
	ldr	x3, [x3, 96]
	blr	x3
	ldrb	w0, [x19, 65]
	orr	w0, w0, 12
	bfi	w0, w22, 4, 2
	strb	w0, [x19, 65]
.L53:
	add	x21, x20, 2520
	ldrb	w2, [x19, 66]
	add	x22, x21, 36864
	add	x23, x21, 20480
	mov	w1, 0
	mov	x0, x19
	ldrb	w3, [x22, 1817]
	bfi	w2, w3, 1, 1
	strb	w2, [x19, 66]
	ldr	w2, [x22, 1820]
	str	w2, [x19, 120]
	ldr	w2, [x23, 3660]
	str	w2, [x19, 72]
	ldr	w2, [x23, 3656]
	str	w2, [x19, 68]
	bl	SetAspectRatio
	ldr	w2, [x24, 14592]
	ldr	w1, [x19, 36]
	ldr	w3, [x19, 112]
	ldr	x4, [x19, 504]
	add	w0, w2, w1
	stp	w1, w0, [x19, 20]
	str	w0, [x19, 40]
	add	w1, w3, w1
	add	w0, w3, w0
	add	x2, x4, x2, uxtw
	stp	w1, w0, [x19, 28]
	str	x2, [x19, 512]
	mov	w1, 8
	ldr	w0, [x19, 68]
	mov	w2, 1
	ldr	w3, [x23, 3660]
	str	w3, [x19, 80]
	add	w0, w0, 511
	and	w0, w0, -512
	ldr	w3, [x23, 3656]
	lsr	w0, w0, 5
	strb	w2, [x19, 291]
	strb	w2, [x19, 289]
	str	w3, [x19, 76]
	str	w0, [x19, 136]
	str	w1, [x19, 300]
	str	w1, [x19, 304]
	str	w1, [x19, 308]
	ldrb	w0, [x20, 2522]
	cbz	w0, .L54
	ldrb	w1, [x22, 1824]
	and	w1, w1, 1
.L55:
	ldrb	w0, [x19, 636]
	add	x20, x20, 2520
	add	x20, x20, 36864
	bfi	w0, w1, 0, 1
	strb	w0, [x19, 636]
	ldrb	w1, [x20, 1824]
	ubfx	x1, x1, 1, 4
	bfi	w0, w1, 1, 4
	strb	w0, [x19, 636]
	ldrb	w0, [x20, 1828]
	and	w0, w0, -32
	strb	w0, [x20, 1828]
.L49:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L60:
	mov	w0, 4
	strb	w0, [x19, 284]
	ldrb	w1, [x19, 65]
	mov	w5, 0
	ldrb	w3, [x24, 24]
	ubfx	x2, x1, 2, 2
	mov	x0, x1
	add	w1, w3, w22
	orr	w1, w1, w2
	and	w2, w1, 3
	cmp	w1, 3
	csel	w1, w2, w5, ls
	bfi	w0, w1, 2, 2
	bfi	w0, w22, 0, 2
	bfi	w0, w22, 4, 2
	strb	w0, [x19, 65]
	b	.L53
	.p2align 3
.L54:
	ldrb	w1, [x22, 1828]
	ldrb	w0, [x22, 1824]
	ubfx	x2, x1, 1, 4
	and	w1, w1, 1
	bfi	w0, w2, 1, 4
	bfi	w0, w1, 0, 1
	strb	w0, [x22, 1824]
	b	.L55
	.size	VC1_SetImgFormat, .-VC1_SetImgFormat
	.align	3
.LC32:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1DEC_Destroy
	.type	VC1DEC_Destroy, %function
VC1DEC_Destroy:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VC1DEC_Destroy, .-VC1DEC_Destroy
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
	cbz	x19, .L66
	add	x19, x19, 53248
	mov	w1, w20
	mov	w2, 0
	ldr	w0, [x19, 904]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 904]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L65
	ldr	w0, [x19, 904]
	ldr	x1, [x20, 544]
	bl	FreeUsdByDec
	str	xzr, [x20, 544]
	ldr	x1, [x20, 552]
	ldr	w0, [x19, 904]
	bl	FreeUsdByDec
	str	xzr, [x20, 552]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L65:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L66:
	ldr	x1, .LC34
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1DEC_RecycleImage, .-VC1DEC_RecycleImage
	.align	3
.LC34:
	.xword	.LC33
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1DEC_GetRemainImg
	.type	VC1DEC_GetRemainImg, %function
VC1DEC_GetRemainImg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L84
	add	x20, x19, 12288
	add	x20, x20, 2520
	ldr	x0, [x20, 24096]
	cbz	x0, .L75
	ldr	x0, [x19]
	add	x21, x19, 53248
	ldr	w0, [x0, 24]
	cmp	w0, 1
	beq	.L70
	add	x23, x20, 20480
	add	x21, x19, 53248
	ldr	w1, [x23, 3712]
	ldr	w0, [x21, 904]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L70
	ldr	w0, [x21, 904]
	ldr	w1, [x23, 3712]
	bl	FSP_GetDisplay
	cmp	w0, 2
	beq	.L85
.L70:
	add	x20, x21, 296
.L74:
	mov	x0, x20
	bl	GetVoLastImageID
.L81:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L85:
	mov	x0, x19
	bl	VC1_SetImgFormat
	str	xzr, [x22, 544]
	mov	w2, 1
	str	xzr, [x22, 552]
	str	w2, [x22, 180]
	ldr	w1, [x22, 148]
	ldr	w0, [x21, 904]
	bl	FSP_SetDisplay
	ldr	x0, [x20, 24096]
	ldrb	w1, [x0]
	cmp	w1, 1
	beq	.L86
.L71:
	add	x20, x21, 296
	ldr	w0, [x21, 904]
	mov	x4, x22
	mov	x3, x20
	mov	x2, x19
	mov	w1, 1
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L72
	ldr	w1, [x22, 148]
	mov	x0, x19
	bl	VC1DEC_RecycleImage
	ldr	w0, [x21, 904]
	ldr	x1, [x22, 544]
	bl	FreeUsdByDec
	str	xzr, [x22, 544]
	ldr	x1, [x22, 552]
	ldr	w0, [x21, 904]
	bl	FreeUsdByDec
	str	xzr, [x22, 552]
	b	.L74
	.p2align 3
.L72:
	ldr	w0, [x22, 152]
	cmp	w0, 100
	bhi	.L70
	ldr	w0, [x22, 68]
	cmp	w0, 31
	bls	.L70
	ldr	w1, [x22, 72]
	mov	w0, 0
	cmp	w1, 31
	bhi	.L81
	b	.L74
	.p2align 3
.L86:
	strb	w1, [x0, 1]
	mov	w0, 3
	ldr	x1, [x20, 24096]
	strb	wzr, [x1]
	strb	w0, [x20, 1]
	b	.L71
.L75:
	mov	w0, -1
	b	.L81
.L84:
	ldr	x3, .LC36
	mov	w2, 408
	ldr	x1, .LC38
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L81
	.size	VC1DEC_GetRemainImg, .-VC1DEC_GetRemainImg
	.align	3
.LC36:
	.xword	.LC35
	.align	3
.LC38:
	.xword	.LC37
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_ArrangeVahbMem
	.type	VC1_ArrangeVahbMem, %function
VC1_ArrangeVahbMem:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	mov	w21, w1
	mov	w23, w2
	bl	_mcount
	sub	w1, w21, #32
	mov	w0, 8160
	cmp	w1, w0
	bhi	.L88
	sub	w1, w23, #32
	cmp	w1, w0
	bhi	.L88
	add	x0, x22, 28672
	mov	w1, 0
	add	x0, x0, 144
	.p2align 2
.L91:
	str	w1, [x0, 1188]
	add	w1, w1, 1
	strb	wzr, [x0, 1]
	cmp	w1, 5
	strb	wzr, [x0]
	add	x0, x0, 1680
	bne	.L91
	ldr	x0, [x22]
	ldr	w19, [x0, 772]
	ldr	w2, [x0, 28]
	cmp	w2, 25
	cbnz	w19, .L92
	beq	.L118
.L112:
	mov	w19, w1
	mov	w24, 3
	mov	w20, 2
.L93:
	ldr	x0, .LC45
	mov	x2, 20
	mov	w1, 0
	ldr	x3, [x0, 96]
	add	x0, x29, 72
	blr	x3
	ldr	x0, [x22]
	stp	w21, w23, [x29, 76]
	stp	w21, w23, [x29, 84]
	ldr	w0, [x0, 28]
	cmp	w0, 24
	beq	.L103
	strb	w19, [x29, 74]
	sxtb	w19, w20
	strb	w24, [x29, 73]
.L108:
	add	x20, x22, 53248
	add	x1, x29, 72
	strb	w19, [x29, 75]
	ldr	w0, [x20, 904]
	bl	FSP_ConfigInstance
	mov	w19, w0
	cbnz	w0, .L104
	ldr	x1, [x22]
	add	x3, x29, 68
	ldr	w0, [x20, 904]
	ldr	w2, [x1, 20]
	ldr	w1, [x1, 16]
	bl	FSP_ConfigFrameBuf
	cmp	w0, 2
	beq	.L119
	cbnz	w0, .L106
	mov	w19, 1
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L88:
	ldr	x1, .LC42
	mov	w3, w23
	mov	w2, w21
	mov	w0, 0
	mov	w19, 0
	bl	dprint_vfmw
.L114:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L92:
	bne	.L112
	ldr	w4, [x0, 732]
	ldr	w5, [x0, 736]
	cmp	w21, w4
	bhi	.L100
	cmp	w23, w5
	bhi	.L100
	ldr	w2, [x0, 760]
	mov	w20, 1
	ldr	w1, [x0, 756]
	add	w24, w1, 2
	cbnz	w2, .L120
	ldrsb	w19, [x0, 780]
	b	.L93
	.p2align 3
.L104:
	ldr	x1, .LC49
	mov	w0, 0
	mov	w19, 0
	bl	dprint_vfmw
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L118:
	ldr	w4, [x0, 732]
	cmp	w21, w4
	bhi	.L121
	ldr	w1, [x0, 736]
	cmp	w23, w1
	mov	w5, w1
	bhi	.L95
	add	x2, x22, 12288
	mov	w19, 1
	ldrb	w2, [x2, 2520]
	tbnz	x2, 3, .L114
	ldr	w3, [x0, 760]
	mov	w20, w19
	ldr	w2, [x0, 756]
	add	w24, w2, 2
	cbz	w3, .L98
	add	w2, w2, w19
	mov	w19, 17
	cmp	w2, w19
	csel	w20, w2, w19, ls
.L98:
	ldrsb	w19, [x0, 780]
	mov	w23, w1
	mov	w21, w4
	b	.L93
	.p2align 3
.L103:
	mov	w0, 1
	strb	w19, [x29, 74]
	strb	w0, [x29, 73]
	mov	w19, 1
	b	.L108
	.p2align 3
.L100:
	ldr	x1, .LC44
	mov	w3, w23
	mov	w2, w21
	mov	w0, 0
	mov	w19, 0
	bl	dprint_vfmw
	b	.L114
	.p2align 3
.L119:
	add	x0, x20, 296
	bl	ResetVoQueue
.L106:
	ldr	x1, .LC47
	mov	w0, 0
	bl	dprint_vfmw
	b	.L114
	.p2align 3
.L120:
	mov	w19, 17
	add	w1, w1, w20
	cmp	w1, w19
	csel	w20, w1, w19, ls
	ldrsb	w19, [x0, 780]
	b	.L93
.L121:
	ldr	w5, [x0, 736]
.L95:
	ldr	x1, .LC44
	mov	w3, w23
	mov	w2, w21
	mov	w0, 0
	bl	dprint_vfmw
	b	.L114
	.size	VC1_ArrangeVahbMem, .-VC1_ArrangeVahbMem
	.align	3
.LC42:
	.xword	.LC41
	.align	3
.LC44:
	.xword	.LC43
	.align	3
.LC45:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC47:
	.xword	.LC46
	.align	3
.LC49:
	.xword	.LC48
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_WritePicMsg
	.type	VC1_WritePicMsg, %function
VC1_WritePicMsg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	add	x20, x22, 12288
	mov	x19, x1
	add	x21, x20, 2520
	bl	_mcount
	add	x22, x22, 53248
	add	x1, x21, 20480
	ldr	w0, [x22, 904]
	ldr	w1, [x1, 3716]
	bl	FSP_GetLogicFs
	cbz	x0, .L147
	ldrsb	w1, [x21, 3104]
	cbz	w1, .L125
	ldr	w2, [x21, 10804]
	add	x1, x21, 8192
	strb	w2, [x19, 5]
	mov	w2, 3
	ldrb	w3, [x1, 2224]
	strb	w3, [x19, 4]
	ldrb	w1, [x1, 2569]
	cmp	w1, 4
	csel	w1, w1, w2, ne
	strb	w1, [x19, 3]
	ldr	w1, [x21, 10804]
	add	x21, x21, 36864
	cmp	w1, w2
	ldr	w1, [x21, 1764]
	beq	.L148
	sub	w1, w1, #1
	strh	w1, [x19, 84]
.L128:
	add	x2, x20, 2520
	add	x3, x2, 36864
	add	x1, x2, 8192
	add	x5, x2, 20480
	ldr	w3, [x3, 1760]
	sub	w3, w3, #1
	strh	w3, [x19, 82]
	ldrb	w3, [x1, 2609]
	strb	w3, [x19, 8]
	ldrb	w3, [x1, 2400]
	strb	w3, [x19, 6]
	ldrb	w3, [x1, 2600]
	strb	w3, [x19, 9]
	ldrb	w3, [x20, 2528]
	strb	w3, [x19, 7]
	ldrsw	x4, [x5, 3680]
	lsl	x3, x4, 3
	sub	x4, x3, x4
	lsl	x3, x4, 4
	sub	x3, x3, x4
	add	x3, x2, x3, lsl 4
	add	x3, x3, 12288
	ldrb	w3, [x3, 2747]
	strb	w3, [x19, 10]
	ldrsw	x4, [x5, 3696]
	lsl	x3, x4, 3
	sub	x4, x3, x4
	lsl	x3, x4, 4
	sub	x3, x3, x4
	add	x3, x2, x3, lsl 4
	add	x3, x3, 12288
	ldrb	w3, [x3, 2747]
	strb	w3, [x19, 11]
	ldrb	w3, [x1, 2598]
	strb	w3, [x19, 15]
	ldrb	w3, [x1, 2401]
	strb	w3, [x19, 13]
	ldrb	w3, [x1, 2405]
	strb	w3, [x19, 14]
	ldrb	w3, [x1, 2568]
	strb	w3, [x19, 12]
	ldrb	w3, [x1, 2736]
	strb	w3, [x19, 18]
	ldrb	w3, [x1, 2571]
	strb	w3, [x19, 19]
	ldrb	w3, [x1, 2578]
	strb	w3, [x19, 17]
	ldr	w2, [x20, 13396]
	strb	w2, [x19, 16]
	ldrb	w2, [x1, 2406]
	cbnz	w2, .L129
	ldrb	w1, [x1, 2578]
	cmp	w1, 8
	cset	w1, ls
	strb	w1, [x19, 20]
.L130:
	add	x2, x20, 2520
	add	x1, x2, 8192
	add	x4, x2, 36864
	ldrb	w3, [x1, 2730]
	strb	w3, [x19, 24]
	ldrb	w3, [x1, 2729]
	strb	w3, [x19, 23]
	ldrb	w3, [x1, 2403]
	strb	w3, [x19, 22]
	ldrb	w3, [x1, 2728]
	strb	w3, [x19, 25]
	ldr	w3, [x20, 13452]
	strb	w3, [x19, 26]
	ldrb	w3, [x1, 2731]
	strb	w3, [x19, 21]
	ldrb	w3, [x1, 2582]
	strb	w3, [x19, 27]
	ldrb	w3, [x1, 2583]
	strb	w3, [x19, 28]
	ldrb	w3, [x1, 2601]
	strb	w3, [x19, 34]
	ldrb	w3, [x1, 2593]
	strb	w3, [x19, 33]
	ldr	x5, [x20, 26616]
	ldrb	w3, [x1, 2609]
	add	x3, x5, x3
	ldrb	w3, [x3, 1029]
	strb	w3, [x19, 30]
	ldrb	w3, [x1, 2609]
	ldr	x5, [x20, 26608]
	add	x3, x5, x3
	ldrb	w3, [x3, 1029]
	strb	w3, [x19, 29]
	ldrb	w3, [x1, 2581]
	strb	w3, [x19, 31]
	ldrb	w3, [x1, 2599]
	strb	w3, [x19, 32]
	ldrb	w3, [x1, 2592]
	strb	w3, [x19, 35]
	ldrb	w3, [x1, 2404]
	strb	w3, [x19, 36]
	ldrb	w3, [x1, 2588]
	strb	w3, [x19, 37]
	ldrb	w3, [x1, 2590]
	strb	w3, [x19, 38]
	ldrb	w3, [x1, 2591]
	strb	w3, [x19, 39]
	ldrb	w3, [x1, 2589]
	strb	w3, [x19, 40]
	ldrb	w3, [x1, 2605]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 46]
	ldrb	w3, [x1, 2603]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 42]
	ldrb	w3, [x1, 2607]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 44]
	ldrb	w3, [x1, 2608]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 41]
	ldrb	w3, [x1, 2602]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 43]
	ldrb	w3, [x1, 2606]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 47]
	ldrb	w3, [x1, 2604]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 45]
	ldrb	w3, [x1, 2570]
	strb	w3, [x19, 50]
	ldrb	w3, [x1, 2587]
	strb	w3, [x19, 49]
	ldrb	w3, [x1, 2586]
	strb	w3, [x19, 48]
	ldrb	w3, [x1, 2597]
	strb	w3, [x19, 53]
	ldrb	w3, [x1, 2594]
	strb	w3, [x19, 54]
	ldrb	w3, [x1, 2595]
	strb	w3, [x19, 51]
	ldrb	w3, [x1, 2596]
	strb	w3, [x19, 52]
	ldr	w3, [x20, 13428]
	str	w3, [x19, 14424]
	ldr	w3, [x4, 1736]
	str	w3, [x19, 14428]
	ldr	w3, [x4, 1740]
	str	w3, [x19, 14432]
	ldrb	w3, [x1, 2409]
	strb	w3, [x19, 55]
	ldrb	w3, [x1, 2410]
	strb	w3, [x19, 56]
	ldrb	w3, [x1, 2411]
	strb	w3, [x19, 57]
	ldrb	w3, [x1, 2412]
	strb	w3, [x19, 58]
	ldr	w2, [x20, 13324]
	cmp	w2, 3
	beq	.L149
	ldrb	w2, [x1, 2409]
	strb	w2, [x0, 333]
	ldrb	w2, [x1, 2410]
	strb	w2, [x0, 334]
	ldrb	w2, [x1, 2411]
	strb	w2, [x0, 335]
	ldrb	w1, [x1, 2412]
	strb	w1, [x0, 336]
.L135:
	add	x1, x20, 2520
	add	x2, x1, 8192
	ldrb	w2, [x2, 2224]
	strb	w2, [x0, 338]
	ldrb	w0, [x20, 2532]
	strb	w0, [x19, 63]
	b	.L136
	.p2align 3
.L125:
	add	x1, x21, 8192
	strb	wzr, [x19, 5]
	add	x3, x21, 36864
	mov	w4, 3
	ldrb	w2, [x1, 2208]
	strb	w2, [x19, 4]
	ldrb	w2, [x1, 2459]
	cmp	w2, 4
	csel	w2, w2, w4, ne
	strb	w2, [x19, 3]
	ldr	w2, [x3, 1764]
	sub	w2, w2, #1
	strh	w2, [x19, 84]
	ldr	w2, [x3, 1760]
	strb	wzr, [x19, 8]
	sub	w2, w2, #1
	strh	w2, [x19, 82]
	ldrb	w2, [x1, 2211]
	strb	w2, [x19, 6]
	strb	wzr, [x19, 9]
	ldrb	w2, [x21, 8]
	strb	w2, [x19, 7]
	strb	wzr, [x19, 10]
	strb	wzr, [x19, 11]
	ldrb	w2, [x1, 2214]
	strb	w2, [x19, 13]
	ldrb	w2, [x1, 2218]
	strb	w2, [x19, 14]
	ldrb	w2, [x1, 2478]
	strb	w2, [x19, 12]
	ldrb	w2, [x1, 2488]
	strb	w2, [x19, 18]
	ldrb	w2, [x1, 2463]
	strb	w2, [x19, 19]
	ldrb	w2, [x1, 2462]
	strb	w2, [x19, 17]
	ldr	w2, [x21, 10752]
	strb	w2, [x19, 16]
	ldrb	w2, [x1, 2222]
	cbnz	w2, .L138
	ldrb	w1, [x1, 2462]
	cmp	w1, 8
	cset	w1, ls
	strb	w1, [x19, 20]
.L139:
	add	x2, x20, 2520
	add	x1, x2, 8192
	ldrb	w3, [x1, 2482]
	strb	w3, [x19, 24]
	ldrb	w3, [x1, 2481]
	strb	w3, [x19, 23]
	ldrb	w3, [x1, 2216]
	strb	w3, [x19, 22]
	ldrb	w3, [x1, 2480]
	strb	w3, [x19, 25]
	ldr	w3, [x20, 13204]
	strb	w3, [x19, 26]
	ldrb	w3, [x1, 2483]
	strb	w3, [x19, 21]
	ldrb	w3, [x1, 2467]
	strb	w3, [x19, 27]
	ldrb	w3, [x1, 2468]
	strb	w3, [x19, 28]
	ldr	x3, [x20, 26616]
	ldrb	w3, [x3, 1029]
	strb	w3, [x19, 30]
	ldr	x3, [x20, 26608]
	ldrb	w3, [x3, 1029]
	strb	w3, [x19, 29]
	ldrb	w3, [x1, 2465]
	strb	w3, [x19, 31]
	ldrb	w3, [x1, 2599]
	strb	w3, [x19, 32]
	ldrb	w3, [x1, 2477]
	strb	w3, [x19, 35]
	ldrb	w3, [x1, 2217]
	strb	w3, [x19, 36]
	ldrb	w3, [x1, 2473]
	strb	w3, [x19, 37]
	ldrb	w3, [x1, 2475]
	strb	w3, [x19, 38]
	ldrb	w3, [x1, 2476]
	strb	w3, [x19, 39]
	ldrb	w3, [x1, 2474]
	strb	w3, [x19, 40]
	ldr	w3, [x20, 13264]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 42]
	ldr	w3, [x20, 13260]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 43]
	ldr	w3, [x20, 13268]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 45]
	ldrb	w3, [x1, 2460]
	strb	w3, [x19, 50]
	ldrb	w3, [x1, 2472]
	strb	w3, [x19, 49]
	ldrb	w3, [x1, 2471]
	strb	w3, [x19, 48]
	ldr	w3, [x20, 13276]
	str	w3, [x19, 14424]
	ldrb	w3, [x1, 2220]
	cmp	w3, 1
	beq	.L150
	mov	w5, 0
	mov	w2, 0
	mov	w4, 0
	mov	w3, 0
.L142:
	add	x1, x20, 2520
	strb	w3, [x19, 59]
	strb	w4, [x19, 60]
	add	x1, x1, 8192
	strb	w2, [x19, 61]
	str	w5, [x0, 360]
	ldrb	w1, [x1, 2208]
	strb	w1, [x0, 338]
.L136:
	add	x2, x20, 2520
	add	x20, x20, 2534
	add	x0, x2, 20480
	add	x1, x2, 36864
	ldr	x5, .LC52
	ldrh	w4, [x19, 82]
	ldr	w3, [x0, 3724]
	strh	w3, [x19, 76]
	add	w4, w4, 1
	ldr	w3, [x0, 3656]
	strh	w3, [x19, 78]
	ldr	w3, [x0, 3660]
	strh	w3, [x19, 80]
	ldrb	w3, [x2, 12]
	strb	w3, [x19, 63]
	ldrb	w2, [x2, 13]
	strb	w2, [x19, 62]
	ldr	w2, [x0, 3640]
	add	w3, w2, 254
	adds	w2, w2, 127
	csel	w2, w3, w2, mi
	asr	w2, w2, 7
	lsl	w2, w2, 4
	str	w2, [x19, 14456]
	ldr	w0, [x1, 1784]
	str	w0, [x19, 14460]
	ldr	w0, [x1, 1788]
	str	w0, [x19, 14464]
	ldr	w0, [x1, 1792]
	str	w0, [x19, 14468]
	ldr	w0, [x1, 1796]
	str	w0, [x19, 14472]
	ldr	w0, [x1, 1800]
	str	w0, [x19, 14476]
	ldr	w0, [x1, 1804]
	str	w0, [x19, 14480]
	ldr	w0, [x1, 1808]
	str	w0, [x19, 14484]
	str	x20, [x19, 64]
	ldrsw	x0, [x22, 904]
	ldr	x0, [x5, x0, lsl 3]
	str	w4, [x0, 1676]
	ldrsw	x1, [x22, 904]
	ldrh	w0, [x19, 84]
	ldr	x1, [x5, x1, lsl 3]
	add	w0, w0, 1
	str	w0, [x1, 1680]
.L122:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L138:
	cmp	w2, 1
	beq	.L151
	cmp	w2, 2
	beq	.L152
	mov	w1, 1
	strb	w1, [x19, 20]
	b	.L139
	.p2align 3
.L129:
	cmp	w2, 1
	beq	.L153
	cmp	w2, 2
	beq	.L154
	mov	w1, 1
	strb	w1, [x19, 20]
	b	.L130
	.p2align 3
.L153:
	ldrb	w1, [x1, 2579]
	cmp	w1, wzr
	cset	w1, ne
	strb	w1, [x19, 20]
	b	.L130
	.p2align 3
.L151:
	ldrb	w1, [x1, 2464]
	cmp	w1, wzr
	cset	w1, ne
	strb	w1, [x19, 20]
	b	.L139
	.p2align 3
.L149:
	ldrb	w2, [x1, 2609]
	cbnz	w2, .L134
	ldrb	w2, [x1, 2409]
	strb	w2, [x0, 333]
	ldrb	w2, [x1, 2410]
	strb	w2, [x0, 334]
	ldrb	w2, [x1, 2411]
	strb	w2, [x0, 335]
	ldrb	w2, [x1, 2412]
	strb	w2, [x0, 336]
	ldrb	w2, [x1, 2609]
.L134:
	cmp	w2, 1
	bne	.L135
	add	x1, x20, 2520
	add	x1, x1, 8192
	ldrb	w2, [x1, 2409]
	strb	w2, [x0, 328]
	ldrb	w2, [x1, 2410]
	strb	w2, [x0, 329]
	ldrb	w2, [x1, 2411]
	strb	w2, [x0, 330]
	ldrb	w1, [x1, 2412]
	strb	w1, [x0, 331]
	b	.L135
	.p2align 3
.L148:
	add	w1, w1, 1
	add	w1, w1, w1, lsr 31
	asr	w1, w1, 1
	sub	w1, w1, #1
	strh	w1, [x19, 84]
	b	.L128
	.p2align 3
.L150:
	add	x3, x2, 20480
	ldr	w5, [x3, 3680]
	ldr	w4, [x3, 3696]
	lsl	x3, x5, 3
	sub	x6, x3, x5
	lsl	x3, x4, 3
	sub	x4, x3, x4
	lsl	x5, x6, 4
	lsl	x3, x4, 4
	sub	x5, x5, x6
	sub	x4, x3, x4
	ldrb	w3, [x1, 2459]
	add	x5, x2, x5, lsl 4
	sub	w3, w3, #2
	add	x2, x2, x4, lsl 4
	and	w3, w3, -3
	add	x4, x5, 12288
	add	x2, x2, 12288
	uxtb	w3, w3
	ldrb	w4, [x4, 1722]
	ldrb	w2, [x2, 1722]
	cbnz	w3, .L143
	mov	w5, w2
	mov	w3, w2
	b	.L142
	.p2align 3
.L143:
	ldrb	w3, [x1, 2458]
	mov	w5, w3
	b	.L142
	.p2align 3
.L152:
	strb	wzr, [x19, 20]
	b	.L139
	.p2align 3
.L154:
	strb	wzr, [x19, 20]
	b	.L130
	.p2align 3
.L147:
	ldr	x1, .LC51
	mov	w2, 927
	mov	w0, 22
	bl	dprint_vfmw
	b	.L122
	.size	VC1_WritePicMsg, .-VC1_WritePicMsg
	.align	3
.LC51:
	.xword	.LC50
	.align	3
.LC52:
	.xword	s_pstVfmwChan
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
	add	x2, x19, 20480
	ldr	x4, .LC53
	add	x1, x2, 3728
	add	x0, x20, 88
	ldr	w3, [x2, 3724]
	strb	w3, [x20, 74]
	ldr	w3, [x2, 3724]
	ldr	x4, [x4, 104]
	lsl	x2, x3, 3
	sub	x2, x2, x3
	lsl	x2, x2, 3
	blr	x4
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1_WriteSliceMsg, .-VC1_WriteSliceMsg
	.align	3
.LC53:
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
	ldrsb	w0, [x19, 3104]
	cbz	w0, .L157
	ldr	w0, [x19, 10804]
	cmp	w0, 3
	beq	.L162
.L157:
	add	x0, x19, 36864
	ldr	w0, [x0, 1768]
	sub	w0, w0, #1
	str	w0, [x20, 14504]
.L158:
	add	x1, x19, 20480
	ldr	w3, [x20, 14600]
	mov	w0, 16385
	movk	w0, 0x2001, lsl 16
	ubfiz	w3, w3, 30, 1
	ldr	w4, [x1, 3664]
	cmp	w4, wzr
	add	w2, w4, 63
	csel	w2, w2, w4, lt
	asr	w2, w2, 6
	add	w0, w0, w2, lsl 4
	orr	w0, w0, w3
	str	w0, [x20, 14508]
	ldrsw	x4, [x1, 3696]
	ldrsw	x2, [x1, 3680]
	lsl	x1, x4, 3
	ldr	x5, [x19, 24088]
	sub	x4, x1, x4
	lsl	x0, x2, 3
	lsl	x3, x4, 4
	sub	x2, x0, x2
	sub	x4, x3, x4
	lsl	x0, x2, 4
	sub	x2, x0, x2
	ldr	w0, [x5, 1092]
	add	x4, x19, x4, lsl 4
	and	w0, w0, 3
	add	x19, x19, x2, lsl 4
	ubfiz	w3, w0, 4, 4
	ldr	w0, [x4, 15100]
	ldr	w2, [x19, 15100]
	and	w0, w0, 3
	strb	wzr, [x20, 73]
	and	w2, w2, 3
	orr	w0, w3, w0, lsl 2
	orr	w0, w0, w2
	strb	w0, [x20, 72]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L162:
	add	x0, x19, 36864
	ldr	w1, [x0, 1764]
	ldr	w2, [x0, 1760]
	add	w0, w1, 1
	add	w0, w0, w0, lsr 31
	asr	w0, w0, 1
	mul	w0, w0, w2
	sub	w0, w0, #1
	str	w0, [x20, 14504]
	b	.L158
	.size	VC1_CfgVDH, .-VC1_CfgVDH
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_GenerateDecPara
	.type	VC1_Vfmw_GenerateDecPara, %function
VC1_Vfmw_GenerateDecPara:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VC1_Vfmw_GenerateDecPara, .-VC1_Vfmw_GenerateDecPara
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1DEC_GetImageBuffer
	.type	VC1DEC_GetImageBuffer, %function
VC1DEC_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L176
	add	x0, x19, 12288
	add	x0, x0, 2520
	ldrsb	w1, [x0, 3]
	cmp	w1, 3
	beq	.L177
.L167:
	add	x19, x19, 53248
	ldr	w0, [x19, 904]
	bl	FSP_IsNewFsAvalible
	cmp	w0, 1
	beq	.L168
	ldr	w0, [x19, 904]
	mov	w20, 0
	bl	FSP_IsNewFsAvalible
	cmn	w0, #1
	bne	.L166
	ldr	w0, [x19, 904]
	add	x1, x19, 296
	bl	FSP_ClearNotInVoQueue
	b	.L166
	.p2align 3
.L177:
	ldrb	w0, [x0, 9]
	cmp	w0, 1
	beq	.L167
.L168:
	mov	w20, 1
.L166:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L176:
	ldr	x3, .LC54
	mov	w2, 1805
	ldr	x1, .LC55
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L166
	.size	VC1DEC_GetImageBuffer, .-VC1DEC_GetImageBuffer
	.align	3
.LC54:
	.xword	.LC35
	.align	3
.LC55:
	.xword	.LC37
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
	mov	x21, x0
	mov	x0, x30
	add	x22, x21, 53248
	add	x19, x21, 12288
	bl	_mcount
	mov	w1, 1
	ldr	w0, [x22, 904]
	bl	FSP_NewLogicFs
	mov	w1, w0
	add	x0, x19, 2520
	add	x20, x0, 20480
	str	w1, [x20, 3716]
	tbnz	w1, #31, .L198
	add	x20, x21, 28672
	add	x0, x0, 12288
	add	x0, x0, 1720
	ldrh	w2, [x20, 144]
	cbz	w2, .L188
	add	x21, x21, 36864
	add	x0, x20, 1824
	add	x4, x21, 352
.L185:
	ldrh	w3, [x0]
	mov	x2, x0
	add	x0, x0, 1680
	cmp	x0, x4
	cbz	w3, .L182
	bne	.L185
	ldr	w0, [x22, 904]
	mov	w2, 1
	add	x21, x21, 353
	bl	FSP_ClearLogicFs
	ldr	x1, .LC61
	mov	w0, 1
	bl	dprint_vfmw
	add	x0, x20, 145
.L187:
	strb	wzr, [x0]
	strb	wzr, [x0, -1]
	add	x0, x0, 1680
	cmp	x0, x21
	bne	.L187
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L188:
	mov	x2, x0
.L182:
	str	x2, [x19, 26608]
	mov	w0, 1
	mov	w1, 0
	strb	w0, [x2, 1]
	.p2align 2
.L184:
	ldr	x4, [x19, 26608]
	sxtw	x0, w1
	uxtb	w2, w1
	add	w1, w1, 1
	add	x4, x4, x0
	cmp	w1, 256
	strb	w2, [x4, 3]
	ldr	x4, [x19, 26608]
	add	x4, x4, x0
	strb	w2, [x4, 259]
	ldr	x4, [x19, 26608]
	add	x4, x4, x0
	strb	w2, [x4, 515]
	ldr	x3, [x19, 26608]
	add	x0, x3, x0
	strb	w2, [x0, 771]
	bne	.L184
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L198:
	ldr	x1, .LC57
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w1, [x20, 3712]
	ldr	w0, [x22, 904]
	bl	FSP_GetFsImagePtr
	mov	x21, x0
	cbz	x0, .L180
	ldr	w0, [x22, 904]
	ldr	x1, [x21, 544]
	bl	FreeUsdByDec
	ldr	w0, [x22, 904]
	ldr	x1, [x21, 552]
	bl	FreeUsdByDec
	ldr	w0, [x22, 904]
	ldr	x1, [x21, 560]
	bl	FreeUsdByDec
	ldr	w0, [x22, 904]
	ldr	x1, [x21, 568]
	bl	FreeUsdByDec
	add	x0, x21, 512
	mov	w2, 1
	stp	xzr, xzr, [x0, 32]
	stp	xzr, xzr, [x0, 48]
	ldr	w1, [x20, 3712]
	ldr	w0, [x22, 904]
	bl	FSP_ClearLogicFs
	ldr	w1, [x20, 3708]
	mov	w2, 1
	ldr	w0, [x22, 904]
	bl	FSP_ClearLogicFs
	str	wzr, [x20, 3708]
	str	wzr, [x20, 3712]
	ldr	w0, [x22, 904]
	bl	FSP_GetNullLogicFs
	str	w0, [x20, 3708]
	str	w0, [x20, 3712]
.L180:
	add	x0, x19, 2520
	add	x1, x22, 296
	add	x0, x0, 20480
	str	wzr, [x0, 3704]
	ldr	w0, [x22, 904]
	bl	FSP_ClearNotInVoQueue
	ldr	x1, .LC59
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VC1_Vfmw_GetImageBuffer, .-VC1_Vfmw_GetImageBuffer
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
	.global	VC1_Vfmw_MemMove
	.type	VC1_Vfmw_MemMove, %function
VC1_Vfmw_MemMove:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 20480
	ldr	x5, [x19, 24088]
	ldr	x1, [x19, 24096]
	ldr	x4, .LC62
	ldr	w3, [x0, 3644]
	ldr	w2, [x0, 3664]
	add	w3, w3, 1
	ldr	x4, [x4, 104]
	ldr	x1, [x1, 1544]
	add	w3, w3, w3, lsr 31
	ldr	x0, [x5, 1544]
	asr	w3, w3, 1
	lsl	w3, w3, 5
	mul	w2, w3, w2
	lsl	w3, w2, 2
	sub	w2, w3, w2
	asr	w2, w2, 1
	sxtw	x2, w2
	blr	x4
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1_Vfmw_MemMove, .-VC1_Vfmw_MemMove
	.align	3
.LC62:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_BuildRefList
	.type	VC1_Vfmw_BuildRefList, %function
VC1_Vfmw_BuildRefList:
	sub	sp, sp, #512
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	mov	w19, w1
	mov	w24, w2
	mov	w25, w3
	bl	_mcount
	mov	x2, 256
	mov	w1, 0
	add	x0, x29, 96
	bl	memset
	mov	x2, 256
	mov	w1, 0
	add	x0, x29, 352
	bl	memset
	cbz	x21, .L265
	ldr	x20, .LC65
	add	x22, x21, 20480
	mov	x2, 16
	mov	w1, 0
	add	x0, x22, 3672
	ldr	x3, [x20, 96]
	blr	x3
	ldr	x3, [x20, 96]
	mov	x2, 16
	mov	w1, 0
	add	x0, x22, 3688
	blr	x3
	ldrsb	w0, [x21, 4]
	tst	w0, -3
	bne	.L203
	cmp	w19, 1
	beq	.L266
	cmp	w19, 2
	beq	.L267
.L211:
	str	wzr, [x22, 3676]
	str	wzr, [x22, 3692]
.L263:
	mov	w0, 1
.L248:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	add	sp, sp, 512
	ret
	.p2align 3
.L203:
	add	x26, x21, 8192
	ldrb	w0, [x26, 2572]
	cmp	w0, 1
	ldrb	w0, [x26, 2609]
	beq	.L268
	cbz	w0, .L269
.L222:
	ldr	x0, [x21, 24104]
	ldr	w27, [x0, 1188]
	mov	w23, w27
.L221:
	cmp	w19, 1
	beq	.L270
.L223:
	cmp	w19, 2
	bne	.L211
	mov	w0, 1
	strb	wzr, [x22, 3672]
	strb	w0, [x22, 3673]
	str	w19, [x22, 3676]
	str	w19, [x22, 3692]
	cbnz	w24, .L271
	ldr	x0, [x21, 24104]
	ldr	w7, [x0, 1188]
	str	w7, [x22, 3680]
	ldr	x1, [x21, 24088]
.L240:
	strb	wzr, [x22, 3688]
	mov	w0, 1
	strb	w0, [x22, 3689]
	ldr	x0, [x21, 24096]
	ldr	w6, [x0, 1188]
	str	w6, [x22, 3696]
	ldr	w0, [x0, 1188]
	str	w0, [x22, 3700]
	ldr	w0, [x21, 10888]
	ldr	w1, [x1, 1188]
	cmp	w0, 1
	bls	.L272
	ands	w0, w0, -3
	bne	.L242
	ldrb	w2, [x26, 2582]
	cmp	w2, 4
	beq	.L248
.L242:
	mov	w8, 1680
	mov	x0, x21
	mov	x4, 0
	smull	x7, w7, w8
	smull	x6, w6, w8
	smull	x8, w1, w8
	.p2align 2
.L243:
	add	x3, x4, x7
	add	x0, x0, 1
	add	x3, x21, x3
	add	x2, x4, x6
	add	x3, x3, 12288
	add	x2, x21, x2
	add	x2, x2, 12288
	add	x1, x4, x8
	add	x1, x21, x1
	add	x4, x4, 1
	ldrb	w5, [x3, 1723]
	add	x1, x1, 12288
	strb	w5, [x0, 13]
	cmp	x4, 256
	ldrb	w5, [x3, 1979]
	strb	w5, [x0, 269]
	ldrb	w5, [x3, 2235]
	strb	w5, [x0, 525]
	ldrb	w3, [x3, 2491]
	strb	w3, [x0, 781]
	ldrb	w3, [x2, 1723]
	strb	w3, [x0, 1037]
	ldrb	w3, [x2, 1979]
	strb	w3, [x0, 1293]
	ldrb	w3, [x2, 2235]
	strb	w3, [x0, 1549]
	ldrb	w2, [x2, 2491]
	strb	w2, [x0, 1805]
	ldrb	w2, [x1, 1723]
	strb	w2, [x0, 2061]
	ldrb	w2, [x1, 1979]
	strb	w2, [x0, 2317]
	ldrb	w2, [x1, 2235]
	strb	w2, [x0, 2573]
	ldrb	w1, [x1, 2491]
	strb	w1, [x0, 2829]
	bne	.L243
	b	.L263
	.p2align 3
.L269:
	ldr	x0, [x21, 24096]
	cmp	w19, 1
	ldr	x1, [x21, 24104]
	ldr	w23, [x0, 1188]
	ldr	w27, [x1, 1188]
	bne	.L223
.L270:
	ldrb	w0, [x26, 2600]
	strb	w19, [x22, 3673]
	add	w0, w0, 1
	strb	wzr, [x22, 3672]
	str	w0, [x22, 3676]
	str	wzr, [x22, 3692]
	cbz	w24, .L224
	cbz	w25, .L225
	ldr	x0, [x21, 24104]
	ldr	x1, [x21, 24088]
	ldr	w19, [x0, 1188]
	str	w19, [x22, 3680]
	b	.L227
	.p2align 3
.L268:
	cbz	w0, .L222
	ldr	x1, [x21, 24096]
	ldr	x0, [x21, 24104]
	ldr	w27, [x1, 1188]
	ldr	w23, [x0, 1188]
	b	.L221
	.p2align 3
.L266:
	strb	wzr, [x22, 3672]
	str	w19, [x22, 3676]
	str	wzr, [x22, 3692]
	ldr	x0, [x21, 24104]
	ldr	w19, [x0, 1188]
	str	w19, [x22, 3680]
	ldrsb	w0, [x21, 3104]
	cbz	w0, .L205
	ldr	w1, [x21, 10804]
	add	x0, x21, 8192
	cmp	w1, 2
	ldrb	w20, [x0, 2584]
	ldrb	w22, [x0, 2585]
	ldrb	w0, [x0, 2582]
	beq	.L273
.L206:
	cmp	w0, 4
	beq	.L207
.L210:
	mov	w2, 1680
	add	x1, x21, 14
	smull	x2, w19, w2
	add	x2, x2, 12288
	add	x0, x2, 1723
	add	x2, x2, 1979
	add	x0, x21, x0
	add	x2, x21, x2
	.p2align 2
.L208:
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
	bne	.L208
	b	.L263
.L267:
	strb	wzr, [x22, 3672]
	mov	w0, 1
	str	w0, [x22, 3676]
	str	w0, [x22, 3692]
	ldr	x0, [x21, 24104]
	ldr	w19, [x0, 1188]
	str	w19, [x22, 3680]
	strb	wzr, [x22, 3688]
	ldr	x0, [x21, 24096]
	ldr	w20, [x0, 1188]
	str	w20, [x22, 3696]
	ldrsb	w0, [x21, 3104]
	cbz	w0, .L212
	add	x0, x21, 8192
	ldrb	w22, [x0, 2584]
	ldrb	w23, [x0, 2585]
	ldrb	w0, [x0, 2582]
.L213:
	cmp	w0, 4
	beq	.L214
.L217:
	mov	w1, 1680
	mov	x3, 14011
	add	x0, x21, 14
	add	x4, x21, 270
	smaddl	x2, w19, w1, x3
	smaddl	x1, w20, w1, x3
	add	x2, x21, x2
	add	x1, x21, x1
	.p2align 2
.L215:
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
	bne	.L215
	b	.L263
.L265:
	ldr	x1, .LC64
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	mov	w0, 0
	add	sp, sp, 512
	ret
.L205:
	add	x0, x21, 8192
	ldrb	w20, [x0, 2469]
	ldrb	w22, [x0, 2470]
	ldrb	w0, [x0, 2467]
	b	.L206
.L224:
	ldr	x0, [x21, 24104]
	ldr	w19, [x0, 1188]
	str	w19, [x22, 3680]
	ldr	x1, [x21, 24088]
.L227:
	ldr	w0, [x0, 1188]
	str	w0, [x22, 3684]
	ldr	w0, [x21, 10888]
	ldr	w20, [x1, 1188]
	cmp	w0, 1
	bls	.L274
.L228:
	tst	w0, -3
	bne	.L229
	ldrb	w1, [x26, 2582]
	cmp	w1, 4
	beq	.L275
.L229:
	mov	w3, 1680
	mov	x2, 14011
	add	x0, x21, 14
	add	x4, x21, 270
	smaddl	x1, w19, w3, x2
	smaddl	x2, w20, w3, x2
	add	x1, x21, x1
	add	x2, x21, x2
	.p2align 2
.L236:
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
	bne	.L236
	b	.L263
.L212:
	add	x0, x21, 8192
	ldrb	w22, [x0, 2469]
	ldrb	w23, [x0, 2470]
	ldrb	w0, [x0, 2467]
	b	.L213
.L271:
	cbz	w25, .L238
	ldr	x0, [x21, 24104]
	ldr	x1, [x21, 24088]
	ldr	w7, [x0, 1188]
	str	w7, [x22, 3680]
	b	.L240
.L225:
	ldr	x1, [x21, 24088]
	ldr	x0, [x21, 24104]
	ldr	w19, [x1, 1188]
	str	w19, [x22, 3680]
	b	.L227
.L273:
	ldr	w1, [x21, 10880]
	cmp	w1, 1
	bne	.L206
.L207:
	mov	w3, 0
	mov	w2, w22
	mov	w1, w20
	add	x0, x29, 96
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w2, w22
	mov	w1, w20
	add	x0, x29, 352
	mov	w3, 1
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w2, 1680
	sub	x0, x29, #3488
	smull	x2, w19, w2
	add	x2, x2, 12288
	add	x1, x2, 1723
	add	x2, x2, 1979
	add	x1, x21, x1
	add	x6, x21, x2
	.p2align 2
.L209:
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
	bne	.L209
	b	.L210
.L275:
	cbnz	w0, .L233
	ldr	w22, [x21, 10892]
	ldr	w24, [x21, 10896]
	uxtb	w22, w22
	uxtb	w24, w24
.L234:
	mov	w3, 0
	mov	w2, w24
	add	x0, x29, 96
	mov	w1, w22
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w2, w24
	mov	w1, w22
	add	x0, x29, 352
	mov	w3, 1
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w2, 1680
	sub	x0, x29, #3488
	smull	x2, w23, w2
	add	x2, x2, 12288
	add	x1, x2, 2235
	add	x2, x2, 2491
	add	x1, x21, x1
	add	x4, x21, x2
	.p2align 2
.L235:
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
	bne	.L235
	b	.L229
.L274:
	ldrb	w0, [x26, 2582]
	cmp	w0, 4
	bne	.L229
	ldrb	w22, [x26, 2584]
	mov	w3, 0
	ldrb	w24, [x26, 2585]
	add	x0, x29, 96
	mov	w1, w22
	mov	w2, w24
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w1, w22
	mov	w3, 1
	add	x0, x29, 352
	mov	w2, w24
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w0, 1680
	smull	x0, w27, w0
	add	x0, x0, 12288
	add	x1, x0, 1723
	add	x0, x0, 1979
	add	x3, x21, x0
	add	x1, x21, x1
	sub	x0, x29, #3488
	.p2align 2
.L230:
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
	bne	.L230
	ldr	w0, [x21, 10888]
	b	.L228
.L272:
	ldrb	w0, [x26, 2582]
	cmp	w0, 4
	bne	.L242
	mov	w0, 0
	b	.L248
.L238:
	ldr	x1, [x21, 24088]
	ldr	w7, [x1, 1188]
	str	w7, [x22, 3680]
	b	.L240
.L214:
	mov	w3, 0
	mov	w2, w23
	mov	w1, w22
	add	x0, x29, 96
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w3, 1
	mov	w2, w23
	mov	w1, w22
	add	x0, x29, 352
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w1, 1680
	mov	x2, 14011
	sub	x0, x29, #3488
	smull	x3, w19, w1
	smaddl	x2, w20, w1, x2
	add	x3, x3, 12288
	add	x1, x3, 1723
	add	x3, x3, 1979
	add	x1, x21, x1
	add	x2, x21, x2
	add	x7, x21, x3
	.p2align 2
.L216:
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
	bne	.L216
	b	.L217
.L233:
	ldrb	w22, [x26, 2584]
	ldrb	w24, [x26, 2585]
	b	.L234
	.size	VC1_Vfmw_BuildRefList, .-VC1_Vfmw_BuildRefList
	.align	3
.LC64:
	.xword	.LC63
	.align	3
.LC65:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_GetStreamInfo
	.type	VC1_Vfmw_GetStreamInfo, %function
VC1_Vfmw_GetStreamInfo:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 12288
	bl	_mcount
	add	x0, x19, 2520
	add	x1, x0, 20480
	ldrsb	w2, [x0, 3104]
	ldr	w22, [x1, 3640]
	cbz	w2, .L277
	ldr	w0, [x19, 13324]
	ldr	w21, [x1, 3644]
	cmp	w0, 3
	beq	.L357
.L355:
	ldrh	w0, [x19, 5878]
	ldrh	w1, [x19, 5876]
	add	w0, w0, 15
	add	w1, w1, 15
	asr	w0, w0, 4
	mul	w21, w21, w22
	asr	w1, w1, 4
.L329:
	lsl	w2, w1, 4
	mov	w4, 8160
	sub	w3, w2, #32
	cmp	w3, w4
	lsl	w3, w0, 4
	bhi	.L280
	sub	w5, w3, #32
	cmp	w5, w4
	bhi	.L280
	add	x4, x19, 2520
	add	x2, x4, 20480
	ldr	w3, [x2, 3652]
	cmp	w0, w3
	beq	.L358
.L283:
	add	x1, x19, 2520
	lsl	w0, w22, 4
	add	x2, x1, 20480
	add	w0, w0, 63
	and	w0, w0, -64
	mov	w3, 1
	ldr	w4, [x2, 3644]
	str	w22, [x2, 3648]
	str	w4, [x2, 3652]
	str	w0, [x2, 3664]
	ldrb	w0, [x19, 2528]
	cbz	w0, .L291
.L285:
	ldrsb	w1, [x19, 2523]
	cmp	w1, 3
	beq	.L359
.L288:
	ldrb	w1, [x19, 2520]
	eor	x1, x1, 8
	ubfx	x1, x1, 3, 1
	orr	w0, w3, w1
	cbnz	w0, .L291
.L295:
	mov	x0, x20
	bl	VC1_Vfmw_GetImageBuffer
	mov	w23, w0
	cbz	w0, .L360
	add	x1, x19, 2520
	add	x23, x20, 53248
	add	x1, x1, 20480
	ldr	w0, [x23, 904]
	ldr	w1, [x1, 3716]
	bl	FSP_GetFsImagePtr
	mov	x2, x0
	cbz	x0, .L297
	ldr	x3, [x20]
	mov	x4, -1
	ldr	x1, .LC72
	mov	w0, 29
	ldr	x3, [x3, 64]
	str	x3, [x2, 584]
	ldr	x3, [x20]
	ldr	x3, [x3, 80]
	str	x3, [x2, 592]
	ldr	x3, [x20]
	ldr	x3, [x3, 96]
	str	x3, [x2, 600]
	ldr	x3, [x20]
	ldr	w3, [x3, 112]
	str	w3, [x2]
	ldr	x3, [x20]
	ldr	w3, [x3, 116]
	str	w3, [x2, 4]
	ldr	x3, [x20]
	ldr	w3, [x3, 120]
	str	w3, [x2, 8]
	ldr	x3, [x20]
	ldr	w3, [x3, 136]
	str	w3, [x2, 12]
	ldr	x3, [x20]
	str	x4, [x3, 64]
	ldr	x3, [x2, 592]
	ldr	x2, [x2, 584]
	bl	dprint_vfmw
.L297:
	add	x0, x19, 2520
	ldrsb	w1, [x0, 3104]
	cbz	w1, .L298
	ldr	w1, [x19, 13324]
	cmp	w1, 3
	beq	.L361
.L298:
	ldr	x0, [x19, 26608]
	str	wzr, [x0, 1092]
.L299:
	ldr	x1, [x19, 26608]
	add	x0, x19, 2520
	strb	wzr, [x1, 2]
	ldrsb	w1, [x0, 3104]
	cbnz	w1, .L300
	add	x1, x0, 8192
	ldrb	w2, [x1, 2220]
	cmp	w2, 1
	beq	.L362
.L300:
	add	x24, x19, 2520
	ldrb	w0, [x24, 2]
	cmp	w0, 1
	ccmp	w0, 5, 4, hi
	bne	.L301
	add	x24, x24, 20480
	mov	w0, 2
	ldr	w1, [x24, 3704]
	ldr	w2, [x24, 3708]
	ldr	w3, [x24, 3712]
	cmp	w1, wzr
	csinc	w0, w0, wzr, ne
	str	w0, [x24, 3704]
	cmp	w2, w3
	beq	.L303
	ldr	x1, .LC75
	mov	w0, 13
	bl	dprint_vfmw
	ldr	w0, [x23, 904]
	mov	w2, 0
	ldr	w1, [x24, 3708]
	bl	FSP_SetRef
	ldr	w3, [x24, 3712]
.L303:
	add	x24, x19, 2520
	mov	w2, 1
	add	x25, x24, 20480
	ldr	w1, [x25, 3716]
	str	w3, [x25, 3708]
	str	w1, [x25, 3712]
	ldr	w0, [x23, 904]
	bl	FSP_SetRef
	ldr	w0, [x23, 904]
	ldr	w1, [x25, 3708]
	bl	FSP_RemovePmv
	ldrb	w0, [x24, 2]
	cmp	w0, 1
	ccmp	w0, 5, 4, hi
	bne	.L305
	ldr	x0, [x24, 24104]
	mov	w1, 1
	strb	wzr, [x0]
	ldr	x0, [x24, 24088]
	strb	w1, [x0]
	ldr	x1, [x24, 24096]
	ldr	x0, [x24, 24088]
	str	x0, [x24, 24096]
	str	x1, [x24, 24104]
.L305:
	add	x25, x19, 2520
	ldr	w0, [x23, 904]
	add	x26, x25, 20480
	ldr	w1, [x26, 3716]
	bl	FSP_GetLogicFs
	mov	x24, x0
	ldr	w1, [x26, 3708]
	ldr	w0, [x23, 904]
	bl	FSP_GetLogicFs
	mov	x28, x0
	ldr	w1, [x26, 3712]
	ldr	w0, [x23, 904]
	bl	FSP_GetLogicFs
	mov	x27, x0
	cmp	x24, xzr
	ccmp	x28, xzr, 4, ne
	ccmp	x0, xzr, 4, ne
	beq	.L363
	ldrsb	w0, [x25, 3104]
	cbnz	w0, .L364
.L311:
	str	wzr, [x24, 100]
.L312:
	ldrb	w1, [x19, 2522]
	add	x0, x19, 2520
	cmp	w1, 5
	beq	.L365
.L313:
	ldr	x1, [x24, 32]
	cbz	x1, .L314
	ldr	x0, [x24, 40]
	cbz	x0, .L314
	ldr	x0, [x27, 32]
	cbz	x0, .L316
	ldr	w0, [x0, 8]
.L317:
	str	w0, [x20, 14460]
	ldr	x0, [x28, 32]
	cbz	x0, .L366
.L356:
	ldr	w0, [x0, 8]
	str	w0, [x20, 14456]
	ldr	x0, [x24, 32]
	ldr	w0, [x0, 8]
	str	w0, [x20, 14584]
	ldr	w0, [x24, 8]
	str	w0, [x20, 14464]
	ldr	w0, [x27, 8]
	str	w0, [x20, 14468]
	ldr	x0, [x24, 40]
	ldr	w0, [x0, 8]
	str	w0, [x20, 14452]
	ldr	x0, [x24, 40]
	ldr	w0, [x0, 28]
	str	w0, [x20, 14532]
	ldr	x0, [x24, 40]
	ldr	w0, [x0, 32]
	str	w0, [x20, 14536]
	ldr	x0, [x24, 40]
	ldr	w0, [x0, 64]
	str	w0, [x20, 14540]
	ldr	x0, [x24, 40]
	ldr	w0, [x0, 48]
	str	w0, [x20, 14544]
	ldr	x0, [x24, 40]
	ldr	w0, [x0, 52]
	str	w0, [x20, 14548]
	ldr	x0, [x24, 32]
	ldr	x24, [x19, 26608]
	ldr	w0, [x0, 8]
	bl	MEM_Phy2Vir
	str	x0, [x24, 1544]
	ldr	x24, [x19, 26624]
	ldr	w0, [x20, 14456]
	bl	MEM_Phy2Vir
	str	x0, [x24, 1544]
	ldr	x23, [x19, 26616]
	ldr	w0, [x20, 14460]
	bl	MEM_Phy2Vir
	str	x0, [x23, 1544]
.L290:
	add	x0, x19, 2520
	ldr	x2, [x0, 24088]
	ldrsb	w1, [x0, 3104]
	cbz	w1, .L367
	ldr	w3, [x0, 10804]
	add	x1, x0, 8192
	strb	w3, [x2, 1027]
	ldr	x2, [x0, 24088]
	ldrb	w3, [x1, 2569]
	strb	w3, [x2, 1028]
	ldrb	w3, [x1, 2582]
	ldr	x4, [x0, 24088]
	sub	w2, w3, #2
	ldrb	w0, [x1, 2609]
	uxtb	w2, w2
	cmp	w2, 1
	bls	.L336
	cmp	w3, 4
	mov	w2, 0
	beq	.L368
.L323:
	add	x1, x4, x0, sxtw
	add	x0, x19, 2520
	add	x0, x0, 20480
	strb	w2, [x1, 1029]
	ldr	w3, [x0, 3724]
	cbz	w3, .L324
	subs	w3, w3, #1
	beq	.L369
	add	x1, x20, 36864
	mov	w2, 0
	add	x1, x1, 2168
	.p2align 2
.L327:
	ldr	w0, [x1, 72]
	add	x1, x1, 56
	strb	w2, [x1, -56]
	add	w2, w2, 1
	cmp	w2, 254
	mul	w0, w22, w0
	ccmp	w3, w2, 0, le
	sub	w0, w0, #1
	str	w0, [x1, -40]
	bhi	.L327
	uxtb	w1, w3
.L326:
	uxtw	x3, w3
	add	x2, x19, 2520
	lsl	x0, x3, 3
	sub	w21, w21, #1
	sub	x3, x0, x3
	add	x0, x2, x3, lsl 3
	add	x0, x0, 20480
	strb	w1, [x0, 3744]
	str	w21, [x0, 3760]
	ldrb	w1, [x19, 2522]
	cmp	w1, 2
	bne	.L322
	add	x0, x2, 8192
	ldr	w3, [x19, 13428]
	add	x2, x2, 36864
	ldrb	w0, [x0, 2599]
	mul	w3, w0, w3
	asr	w3, w3, 8
	str	w3, [x2, 1736]
	sub	w0, w0, w3
	subs	w0, w0, #1
	csel	w0, w0, wzr, pl
	str	w0, [x2, 1740]
	b	.L322
	.p2align 3
.L280:
	ldr	x1, .LC66
	mov	w0, 0
	mov	w23, 0
	bl	dprint_vfmw
.L354:
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L277:
	ldr	w0, [x1, 3644]
	mov	w1, w22
	mul	w21, w22, w0
	b	.L329
	.p2align 3
.L357:
	add	w21, w21, 1
	add	w21, w21, w21, lsr 31
	asr	w21, w21, 1
	b	.L355
	.p2align 3
.L291:
	add	x0, x19, 2520
	add	x23, x20, 53248
	add	x25, x0, 20480
	add	x1, x25, 1928
	str	x1, [x19, 26608]
	str	x1, [x19, 26616]
	str	x1, [x19, 26624]
	str	x1, [x19, 26632]
	ldr	w0, [x23, 904]
	ldr	w1, [x25, 3712]
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	cbz	x0, .L287
	ldr	w0, [x23, 904]
	ldr	x1, [x24, 544]
	bl	FreeUsdByDec
	ldr	w0, [x23, 904]
	ldr	x1, [x24, 552]
	bl	FreeUsdByDec
	ldr	w0, [x23, 904]
	ldr	x1, [x24, 560]
	bl	FreeUsdByDec
	ldr	w0, [x23, 904]
	ldr	x1, [x24, 568]
	bl	FreeUsdByDec
	add	x0, x24, 512
	mov	w2, 1
	stp	xzr, xzr, [x0, 32]
	stp	xzr, xzr, [x0, 48]
	ldr	w0, [x23, 904]
	ldr	w1, [x25, 3712]
	bl	FSP_ClearLogicFs
	ldr	w0, [x23, 904]
	mov	w2, 1
	ldr	w1, [x25, 3708]
	bl	FSP_ClearLogicFs
	str	wzr, [x25, 3708]
	str	wzr, [x25, 3712]
	ldr	w0, [x23, 904]
	bl	FSP_GetNullLogicFs
	str	w0, [x25, 3708]
	str	w0, [x25, 3712]
.L287:
	add	x2, x19, 2520
	add	x0, x20, 28672
	add	x2, x2, 20480
	add	x1, x20, 36864
	add	x0, x0, 145
	add	x1, x1, 353
	str	wzr, [x2, 3704]
	.p2align 2
.L293:
	strb	wzr, [x0]
	strb	wzr, [x0, -1]
	add	x0, x0, 1680
	cmp	x0, x1
	bne	.L293
	add	x24, x23, 296
	ldr	w0, [x23, 904]
	mov	x1, x24
	bl	FSP_ClearNotInVoQueue
	ldrb	w0, [x19, 2520]
	tbnz	x0, 3, .L295
	mov	x0, x24
	bl	ResetVoQueue
	ldr	x1, [x20]
	ldr	w0, [x1, 732]
	ldr	w3, [x1, 736]
	adds	w1, w0, 15
	add	w0, w0, 30
	add	w2, w3, 30
	csel	w1, w0, w1, mi
	adds	w0, w3, 15
	asr	w1, w1, 4
	csel	w0, w2, w0, mi
	str	w1, [x20, 14624]
	asr	w0, w0, 4
	mov	w3, 2
	add	w2, w0, 1
	str	w0, [x20, 14628]
	lsl	w1, w1, 4
	mov	x0, x20
	add	w2, w2, w2, lsr 31
	asr	w2, w2, 1
	lsl	w2, w2, 5
	bl	VC1_ArrangeVahbMem
	cmp	w0, 1
	bne	.L294
	ldrb	w0, [x19, 2520]
	orr	w0, w0, 8
	strb	w0, [x19, 2520]
	b	.L295
	.p2align 3
.L360:
	ldr	x1, .LC70
	mov	w0, 1
	bl	dprint_vfmw
	b	.L354
	.p2align 3
.L358:
	ldr	w0, [x2, 3648]
	cmp	w1, w0
	bne	.L283
	lsl	w0, w22, 4
	mov	w3, 0
	add	w0, w0, 63
	and	w0, w0, -64
	str	w0, [x2, 3664]
	ldrb	w0, [x4, 8]
	cbz	w0, .L288
	b	.L285
	.p2align 3
.L301:
	add	x0, x24, 20480
	ldr	w1, [x0, 3704]
	cmp	w1, 1
	bhi	.L305
	ldr	w1, [x0, 3716]
	mov	w2, 1
	ldr	w0, [x23, 904]
	mov	w23, 0
	bl	FSP_ClearLogicFs
	ldr	x2, [x24, 24088]
	mov	w0, 1
	ldr	x1, .LC77
	strb	wzr, [x2]
	ldr	x2, [x24, 24088]
	strb	wzr, [x2, 1]
	bl	dprint_vfmw
	b	.L354
	.p2align 3
.L363:
	ldr	w0, [x23, 904]
	mov	w2, 1
	ldr	w1, [x26, 3716]
	bl	FSP_ClearLogicFs
	ldr	x0, [x25, 24088]
	mov	x5, x27
	ldr	x1, .LC79
	mov	x4, x28
	mov	x3, x24
	mov	w2, 2077
	strb	wzr, [x0]
	mov	w0, 0
	ldr	x6, [x25, 24088]
	strb	wzr, [x6, 1]
	bl	dprint_vfmw
	ldrb	w0, [x25, 2]
	cmp	w0, 5
	beq	.L370
.L309:
	ldr	x1, .LC81
	mov	w0, 1
	mov	w23, 0
	bl	dprint_vfmw
	b	.L354
	.p2align 3
.L367:
	strb	wzr, [x2, 1027]
	add	x1, x0, 8192
	ldr	x2, [x0, 24088]
	ldrb	w3, [x1, 2459]
	strb	w3, [x2, 1028]
	ldrb	w3, [x1, 2467]
	ldr	x2, [x0, 24088]
	sub	w0, w3, #2
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L334
	cmp	w3, 4
	mov	w0, 0
	beq	.L371
.L321:
	add	x24, x19, 2520
	strb	w0, [x2, 1030]
	add	x21, x24, 20480
	strb	w0, [x2, 1029]
	mov	w0, 1
	add	x22, x24, 36864
	strb	wzr, [x21, 3744]
	str	w0, [x21, 3724]
	ldr	x0, [x19, 5656]
	ldr	x23, [x22, 1688]
	bl	BsPos
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w0, w1, w0, lt
	asr	w0, w0, 3
	add	x0, x23, x0, sxtw
	str	x0, [x19, 26728]
	ldr	x0, [x19, 5656]
	ldr	w23, [x22, 1708]
	bl	BsPos
	add	w1, w0, 7
	cmp	w0, wzr
	csel	w0, w1, w0, lt
	add	w0, w23, w0, asr 3
	str	w0, [x21, 3748]
	ldr	x0, [x19, 5656]
	bl	BsPos
	and	w0, w0, 7
	str	w0, [x21, 3752]
	ldr	w23, [x22, 1716]
	ldr	x0, [x19, 5656]
	lsl	w23, w23, 3
	bl	BsPos
	sub	w0, w23, w0
	str	w0, [x21, 3756]
	ldr	w1, [x22, 1764]
	ldr	w0, [x22, 1760]
	mul	w0, w0, w1
	sub	w0, w0, #1
	str	w0, [x21, 3760]
	ldrb	w1, [x19, 2522]
.L322:
	add	x19, x19, 2520
	mov	w3, 1
	mov	w2, 0
	mov	x0, x19
	bl	VC1_Vfmw_BuildRefList
	mov	w23, w0
	cbz	w0, .L372
	mov	w23, 1
	b	.L354
	.p2align 3
.L364:
	ldr	w0, [x25, 10804]
	cmp	w0, 3
	bne	.L311
	ldr	x0, .LC73
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L311
	str	w0, [x24, 100]
	b	.L312
	.p2align 3
.L370:
	add	x25, x25, 36864
	ldr	w0, [x25, 1780]
	cmp	w0, wzr
	ble	.L309
	sub	w0, w0, #1
	str	w0, [x25, 1780]
	b	.L309
	.p2align 3
.L359:
	ldrb	w0, [x19, 2529]
	cmp	w0, 1
	bne	.L290
	b	.L288
	.p2align 3
.L372:
	add	x0, x19, 20480
	add	x20, x20, 53248
	mov	w2, 1
	ldr	w1, [x0, 3716]
	ldr	w0, [x20, 904]
	bl	FSP_ClearLogicFs
	ldr	x2, [x19, 24088]
	mov	w0, 1
	ldr	x1, .LC85
	strb	wzr, [x2]
	ldr	x2, [x19, 24088]
	strb	wzr, [x2, 1]
	bl	dprint_vfmw
	b	.L354
	.p2align 3
.L324:
	mov	w2, 1
	mov	w1, 0
	str	w2, [x0, 3724]
	b	.L326
	.p2align 3
.L365:
	ldr	w1, [x28, 100]
	add	x0, x0, 36864
	str	w1, [x24, 100]
	ldr	x2, [x19, 26624]
	ldr	x1, [x19, 26608]
	ldr	w2, [x2, 1092]
	str	w2, [x1, 1092]
	ldr	w1, [x0, 1780]
	add	w1, w1, 1
	str	w1, [x0, 1780]
	b	.L313
	.p2align 3
.L362:
	ldr	x0, [x19, 26608]
	ldrb	w1, [x1, 2458]
	strb	w1, [x0, 2]
	b	.L300
	.p2align 3
.L361:
	ldr	x1, .LC73
	ldr	w1, [x1]
	cmp	w1, 1
	bne	.L298
	ldr	x0, [x19, 26608]
	str	w1, [x0, 1092]
	b	.L299
	.p2align 3
.L314:
	add	x19, x19, 2520
	ldr	w0, [x23, 904]
	add	x20, x19, 20480
	mov	w2, 1
	ldr	w1, [x20, 3716]
	bl	FSP_ClearLogicFs
	ldr	x2, [x19, 24088]
	mov	w0, 0
	ldr	x1, .LC83
	strb	wzr, [x2]
	ldr	x2, [x19, 24088]
	strb	wzr, [x2, 1]
	ldr	w2, [x20, 3708]
	ldr	w4, [x20, 3712]
	ldr	w3, [x20, 3716]
	ldp	x5, x6, [x24, 32]
	bl	dprint_vfmw
	ldrb	w0, [x19, 2]
	cmp	w0, 5
	bne	.L309
	add	x19, x19, 36864
	ldr	w0, [x19, 1780]
	cmp	w0, wzr
	ble	.L309
	sub	w0, w0, #1
	str	w0, [x19, 1780]
	b	.L309
	.p2align 3
.L294:
	ldr	x1, .LC68
	mov	w0, 1
	mov	w23, 0
	bl	dprint_vfmw
	ldrb	w0, [x19, 2520]
	and	w0, w0, -9
	strb	w0, [x19, 2520]
	b	.L354
	.p2align 3
.L336:
	mov	w2, 1
	b	.L323
	.p2align 3
.L334:
	mov	w0, 1
	b	.L321
	.p2align 3
.L316:
	ldr	w0, [x1, 8]
	b	.L317
	.p2align 3
.L366:
	ldr	x0, [x24, 32]
	b	.L356
	.p2align 3
.L368:
	ldrb	w1, [x1, 2583]
	sub	w1, w1, #2
	uxtb	w1, w1
	cmp	w1, 1
	cset	w2, ls
	b	.L323
	.p2align 3
.L371:
	ldrb	w0, [x1, 2468]
	sub	w0, w0, #2
	uxtb	w0, w0
	cmp	w0, 1
	cset	w0, ls
	b	.L321
.L369:
	mov	w1, 0
	mov	w3, 0
	b	.L326
	.size	VC1_Vfmw_GetStreamInfo, .-VC1_Vfmw_GetStreamInfo
	.align	3
.LC66:
	.xword	.LC41
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
.LC73:
	.xword	USE_FF_APT_EN
	.align	3
.LC75:
	.xword	.LC74
	.align	3
.LC77:
	.xword	.LC76
	.align	3
.LC79:
	.xword	.LC78
	.align	3
.LC81:
	.xword	.LC80
	.align	3
.LC83:
	.xword	.LC82
	.align	3
.LC85:
	.xword	.LC84
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_PrepareDecode
	.type	VC1_Vfmw_PrepareDecode, %function
VC1_Vfmw_PrepareDecode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L377
	mov	x0, x19
	bl	VC1_Vfmw_GetStreamInfo
	mov	w19, w0
	cbz	w0, .L378
	mov	w19, 1
.L375:
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L378:
	ldr	x1, .LC90
	bl	dprint_vfmw
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L377:
	ldr	x3, .LC87
	mov	w2, 2253
	ldr	x1, .LC88
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	b	.L375
	.size	VC1_Vfmw_PrepareDecode, .-VC1_Vfmw_PrepareDecode
	.align	3
.LC87:
	.xword	.LC86
	.align	3
.LC88:
	.xword	.LC37
	.align	3
.LC90:
	.xword	.LC89
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
	ldr	x3, .LC91
	mov	w1, 3
	mov	x0, x19
	ldp	x8, x9, [x3, 16]
	ldp	x6, x7, [x3, 32]
	ldp	x4, x5, [x3, 48]
	ldp	x2, x3, [x3, 64]
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
.LC91:
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
	add	x1, x19, 20480
	cmp	w20, 1
	add	x0, x19, 36864
	ldr	w2, [x1, 3640]
	beq	.L383
	cmp	w20, 2
	beq	.L389
	cbz	w20, .L388
	add	w2, w2, 1
	add	w2, w2, w2, lsr 31
	asr	w2, w2, 1
.L389:
	str	w2, [x0, 1760]
	ldr	w1, [x1, 3644]
	add	w1, w1, 1
	add	w1, w1, w1, lsr 31
	asr	w1, w1, 1
	str	w1, [x0, 1764]
	b	.L386
	.p2align 3
.L383:
	add	w2, w2, 1
	add	w2, w2, w2, lsr 31
	asr	w2, w2, 1
.L388:
	str	w2, [x0, 1760]
	ldr	w1, [x1, 3644]
	str	w1, [x0, 1764]
.L386:
	mul	w3, w2, w1
	str	w3, [x0, 1768]
	lsl	w2, w2, 4
	lsl	w1, w1, 4
	str	w2, [x0, 1752]
	str	w1, [x0, 1756]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
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
	ldr	x1, .LC93
	add	x2, x1, 104
	ldp	x4, x5, [x1, 80]
	ldr	w3, [x1, 96]
	ldp	x6, x7, [x2]
	add	x2, x29, 72
	ldr	w1, [x1, 120]
	stp	x4, x5, [x29, 48]
	str	w3, [x29, 64]
	stp	x6, x7, [x2]
	str	w1, [x29, 88]
	ble	.L398
	cmp	w0, 3
	ble	.L396
	cmp	w0, 8
	mov	w1, 2
	csinc	w1, w1, wzr, lt
	cset	w19, lt
.L392:
	mov	x0, x20
	sbfiz	x19, x19, 2, 32
	bl	BsSkip
	cmp	w21, 12
	add	x0, x29, 96
	add	x19, x0, x19
	bhi	.L399
.L393:
	ldr	w0, [x19, -24]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L396:
	mov	w1, 3
	mov	x0, x20
	mov	w19, 2
	bl	BsSkip
	sbfiz	x19, x19, 2, 32
	cmp	w21, 12
	add	x0, x29, 96
	add	x19, x0, x19
	bls	.L393
.L399:
	ldr	w0, [x19, -48]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L398:
	mov	w1, 4
	mov	w19, 3
	cbz	w0, .L392
	mov	w19, w1
	b	.L392
	.size	VC1_DecMvmodeProgrP, .-VC1_DecMvmodeProgrP
	.align	3
.LC93:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecMvmodeProgrB
	.type	VC1_DecMvmodeProgrB, %function
VC1_DecMvmodeProgrB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 1
	mov	x0, x19
	bl	BsSkip
	ldr	x19, [sp, 16]
	add	x1, x29, 48
	mov	w2, 3
	add	x0, x1, x0, sxtw 2
	mov	w1, 1
	stp	w2, w1, [x29, 40]
	ldr	w0, [x0, -8]
	ldp	x29, x30, [sp], 48
	ret
	.size	VC1_DecMvmodeProgrB, .-VC1_DecMvmodeProgrB
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
	ble	.L408
	cmp	w0, 4
	csinc	w1, w2, wzr, lt
	cset	w19, lt
.L403:
	mov	x0, x20
	bl	BsSkip
	cmp	w21, 12
	sbfiz	x2, x19, 2, 32
	add	x0, x29, 96
	add	x2, x0, x2
	bhi	.L409
	ldr	w0, [x2, -24]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L409:
	ldr	w0, [x2, -40]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L408:
	mov	w19, w1
	cbz	w0, .L403
	mov	w19, w2
	b	.L403
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
	ble	.L417
	cmp	w0, 4
	csinc	w1, w2, wzr, lt
	cset	w19, lt
.L412:
	mov	x0, x20
	bl	BsSkip
	cmp	w21, 12
	sbfiz	x2, x19, 2, 32
	add	x0, x29, 80
	add	x2, x0, x2
	bhi	.L418
	ldr	w0, [x2, -16]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L418:
	ldr	w0, [x2, -32]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L417:
	mov	w19, w1
	cbz	w0, .L412
	mov	w19, w2
	b	.L412
	.size	VC1_DecMvmode2, .-VC1_DecMvmode2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecBfractionSMP
	.type	VC1_DecBfractionSMP, %function
VC1_DecBfractionSMP:
	stp	x29, x30, [sp, -256]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	mov	x22, x2
	bl	_mcount
	ldr	x0, .LC95
	add	x1, x0, 248
	add	x8, x0, 304
	ldp	x4, x5, [x0, 128]
	ldr	w3, [x0, 184]
	ldr	x6, [x0, 144]
	stp	x4, x5, [x29, 48]
	ldr	x4, [x0, 176]
	ldr	w7, [x0, 152]
	str	x6, [x29, 64]
	str	x4, [x29, 96]
	ldr	x6, [x0, 240]
	ldp	x4, x5, [x0, 192]
	str	w3, [x29, 104]
	ldr	x3, [x0, 296]
	str	w7, [x29, 72]
	stp	x4, x5, [x29, 144]
	str	x6, [x29, 192]
	ldp	x4, x5, [x0, 208]
	ldp	x6, x7, [x0, 160]
	str	x3, [x29, 248]
	ldp	x2, x3, [x0, 224]
	add	x0, x29, 200
	stp	x6, x7, [x29, 80]
	ldp	x6, x7, [x1]
	stp	x6, x7, [x0]
	ldp	x6, x7, [x8]
	stp	x6, x7, [x29, 112]
	add	x6, x29, 216
	mov	x0, x21
	stp	x4, x5, [x29, 160]
	ldp	x4, x5, [x1, 16]
	stp	x4, x5, [x6]
	add	x4, x29, 232
	stp	x2, x3, [x29, 176]
	ldp	x2, x3, [x1, 32]
	stp	x2, x3, [x4]
	ldp	x2, x3, [x8, 16]
	mov	w1, 3
	stp	x2, x3, [x29, 128]
	bl	BsShow
	cmp	w0, 6
	mov	w19, w0
	bgt	.L420
	mov	w1, 3
	mov	x0, x21
	bl	BsSkip
	add	x0, x29, 256
	add	x0, x0, x19, sxtw 2
	ldr	w2, [x0, -208]
	ldr	w1, [x0, -176]
.L421:
	sub	w1, w1, #1
	add	x3, x29, 256
	mov	w0, w19
	add	x1, x3, x1, sxtw 2
	ldr	w1, [x1, -144]
	mul	w1, w1, w2
	str	w1, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 256
	ret
	.p2align 3
.L420:
	mov	w1, 7
	mov	x0, x21
	bl	BsGet
	and	w19, w0, 15
	cmp	w19, 15
	beq	.L424
	sub	w0, w0, #112
	add	x1, x29, 256
	add	w19, w19, 7
	add	x0, x1, x0, sxtw 2
	ldr	w2, [x0, -112]
	ldr	w1, [x0, -56]
	b	.L421
	.p2align 3
.L424:
	mov	w1, 4
	strb	w1, [x22]
	mov	w0, 22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 256
	ret
	.size	VC1_DecBfractionSMP, .-VC1_DecBfractionSMP
	.align	3
.LC95:
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
	ldr	x19, .LC101
	add	x0, x19, 248
	ldr	w6, [x19, 152]
	ldr	x8, [x19, 176]
	str	w6, [x29, 72]
	add	x6, x29, 200
	ldr	w5, [x19, 184]
	ldr	x4, [x19, 240]
	str	x8, [x29, 96]
	add	x8, x29, 216
	ldp	x2, x3, [x19, 128]
	str	w5, [x29, 104]
	str	x4, [x29, 192]
	ldp	x4, x5, [x0]
	stp	x4, x5, [x6]
	stp	x2, x3, [x29, 48]
	ldp	x4, x5, [x0, 16]
	ldp	x2, x3, [x19, 160]
	add	x6, x19, 304
	ldr	x7, [x19, 144]
	stp	x4, x5, [x8]
	stp	x2, x3, [x29, 80]
	add	x4, x29, 232
	str	x7, [x29, 64]
	ldp	x2, x3, [x19, 192]
	stp	x2, x3, [x29, 144]
	ldp	x2, x3, [x19, 208]
	stp	x2, x3, [x29, 160]
	ldp	x2, x3, [x0, 32]
	stp	x2, x3, [x4]
	ldp	x2, x3, [x6]
	ldp	x0, x1, [x19, 224]
	ldr	x7, [x19, 296]
	stp	x2, x3, [x29, 112]
	ldp	x2, x3, [x6, 16]
	stp	x0, x1, [x29, 176]
	mov	w1, 3
	mov	x0, x22
	str	x7, [x29, 248]
	stp	x2, x3, [x29, 128]
	bl	BsShow
	cmp	w0, 6
	mov	w20, w0
	bgt	.L426
	mov	w1, 3
	mov	x0, x22
	bl	BsSkip
	add	x0, x29, 256
	add	x0, x0, x20, sxtw 2
	ldr	w4, [x0, -176]
	ldr	w1, [x0, -208]
	sub	w0, w4, #1
	cmp	w0, 7
	bhi	.L430
.L432:
	add	x2, x29, 256
	add	x0, x2, x0, sxtw 2
	ldr	w0, [x0, -144]
	mul	w0, w1, w0
.L431:
	str	w0, [x21]
.L428:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 256
	ret
	.p2align 3
.L426:
	mov	w1, 7
	mov	x0, x22
	bl	BsGet
	and	w20, w0, 15
	sub	w1, w20, #14
	add	w20, w20, 7
	cmp	w1, 1
	bls	.L428
	sub	w1, w0, #112
	cmp	w1, 13
	bhi	.L429
	add	x0, x29, 256
	add	x0, x0, x1, sxtw 2
	ldr	w4, [x0, -56]
	ldr	w1, [x0, -112]
	sub	w0, w4, #1
	cmp	w0, 7
	bls	.L432
.L430:
	ldr	x1, .LC105
	mov	w3, 3234
	add	x2, x19, 336
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	b	.L431
	.p2align 3
.L429:
	ldr	x1, .LC103
	mov	w4, w0
	mov	w3, 3224
	add	x2, x19, 336
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, .LC105
	mov	w4, 0
	mov	w3, 3234
	add	x2, x19, 336
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	b	.L431
	.size	VC1_DecBfraction, .-VC1_DecBfraction
	.align	3
.LC101:
	.xword	.LANCHOR0
	.align	3
.LC103:
	.xword	.LC102
	.align	3
.LC105:
	.xword	.LC104
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
	beq	.L451
	mov	w1, 1
	mov	x0, x22
	bl	BsGet
	uxtb	w21, w0
	cmp	w21, 1
	strb	w21, [x19]
	beq	.L452
.L437:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L451:
	mov	w0, 1
	mov	w1, 3
	strb	w0, [x19, 3]
	strb	w0, [x19]
	mov	x0, x22
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 7
	strb	w0, [x19, 4]
	beq	.L453
	add	w20, w20, 1
	add	w0, w0, w20
	strb	w0, [x19, 8]
.L436:
	mov	w0, 1
	str	w0, [x19, 12]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L452:
	mov	w1, 2
	mov	x0, x22
	bl	BsGet
	uxtb	w1, w0
	strb	w1, [x19, 1]
	cbnz	w1, .L439
	str	w21, [x19, 12]
.L440:
	ldr	w0, [x19]
	and	w0, w0, 16776960
	cmp	w0, 768
	beq	.L437
	mov	w0, 1
	mov	w1, 3
	strb	w0, [x19, 3]
	mov	x0, x22
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 7
	strb	w0, [x19, 4]
	beq	.L454
	add	w20, w20, 1
	add	w0, w0, w20
	strb	w0, [x19, 8]
	b	.L437
	.p2align 3
.L439:
	cmp	w1, 2
	beq	.L455
	cmp	w1, 1
	beq	.L456
	cmp	w1, 3
	beq	.L457
	str	wzr, [x19, 12]
	b	.L440
.L457:
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
	b	.L440
	.p2align 3
.L453:
	mov	w1, 5
	mov	x0, x22
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 5]
	strb	w0, [x19, 8]
	b	.L436
.L455:
	mov	x0, x22
	bl	BsGet
	and	w1, w0, 255
	strb	w0, [x19, 6]
	add	w0, w1, 6
	str	w0, [x19, 12]
	b	.L440
.L456:
	mov	w1, 2
	mov	x0, x22
	bl	BsGet
	and	w1, w0, 255
	strb	w0, [x19, 7]
	add	w0, w1, 2
	str	w0, [x19, 12]
	b	.L440
.L454:
	mov	w1, 5
	mov	x0, x22
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 5]
	strb	w0, [x19, 8]
	b	.L437
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
	b	.L459
	.p2align 3
.L469:
	mov	w22, w19
.L459:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	mov	w21, w0
	mov	w1, 3
	mov	x0, x20
	cbnz	w21, .L468
	bl	BsGet
	cmp	w0, 1
	mov	w19, w0
	mov	w1, w0
	mov	x0, x20
	bgt	.L478
	bne	.L462
	bl	BsGet
	cbz	w0, .L463
	cbz	w22, .L469
.L475:
	str	w24, [x23]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L468:
	mov	w0, 0
.L460:
	eor	w1, w0, 63
	cmp	w22, wzr
	csel	w0, w1, w0, ne
	mov	w21, 1
	str	w0, [x23]
.L480:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L478:
	sub	w19, w19, #2
	mov	w0, 1
	lsl	w0, w0, w19
	b	.L460
	.p2align 3
.L462:
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	cmp	w0, 255
	beq	.L475
	ldr	x1, .LC111
	add	x1, x1, 488
	ldr	w0, [x1, w0, sxtw 2]
	b	.L460
	.p2align 3
.L463:
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	ldr	x1, .LC111
	add	x1, x1, 360
	ldr	w1, [x1, w0, sxtw 2]
	cmp	w1, 2
	beq	.L479
	cmp	w1, 3
	beq	.L460
	str	w0, [x23]
	b	.L480
.L479:
	orr	w0, w0, 32
	b	.L460
	.size	VC1_DecNormDiff6Tile, .-VC1_DecNormDiff6Tile
	.align	3
.LC111:
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
	ldr	x3, .LC114
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
	beq	.L495
	ldrh	w1, [x19, 156]
	ldrh	w0, [x19, 158]
	strh	w1, [x19, 160]
	strh	w0, [x19, 162]
.L488:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 23]
	beq	.L489
.L491:
	mov	x0, x20
	bl	BsPos
	ldr	w1, [x19, 168]
	mov	w2, 1
	sub	w0, w0, w1
	str	w0, [x19, 168]
.L490:
	mov	w0, w2
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L489:
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 31
	strb	w0, [x19, 24]
	mov	w2, 0
	bhi	.L490
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 25]
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 26]
	ldrb	w1, [x19, 24]
	cbz	w1, .L491
	mov	w21, 0
	.p2align 2
.L492:
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
	bgt	.L492
	b	.L491
	.p2align 3
.L495:
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
	beq	.L496
.L484:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w1, w0
	cmp	w1, 1
	strb	w1, [x19, 15]
	beq	.L497
.L486:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 19]
	bne	.L488
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
	b	.L488
	.p2align 3
.L497:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 16]
	cbnz	w0, .L487
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 17]
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 18]
	b	.L486
	.p2align 3
.L496:
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 15
	strb	w0, [x19, 12]
	bne	.L484
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 13]
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 14]
	b	.L484
.L487:
	mov	w1, 16
	mov	x0, x20
	bl	BsGet
	strh	w0, [x19, 164]
	b	.L486
	.size	VC1_Vfmw_ParseAdvSeqHdr, .-VC1_Vfmw_ParseAdvSeqHdr
	.align	3
.LC114:
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
	ldr	x3, .LC115
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
	beq	.L499
.L502:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 11]
	beq	.L519
.L517:
	ldrh	w0, [x19, 52]
.L504:
	ldrh	w1, [x19, 50]
	ldrh	w2, [x22, 156]
	cmp	w1, 15
	ccmp	w1, w2, 2, hi
	bls	.L505
	strh	w2, [x19, 50]
.L505:
	ldrh	w1, [x22, 158]
	cmp	w0, 15
	ccmp	w1, w0, 0, hi
	bcs	.L506
	strh	w1, [x19, 52]
.L506:
	ldrb	w1, [x19, 6]
	cmp	w1, 1
	beq	.L520
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 13]
	beq	.L521
.L508:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 15]
	beq	.L522
.L509:
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
.L499:
	ldrb	w0, [x22, 24]
	cbz	w0, .L502
	mov	w21, 0
	.p2align 2
.L503:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	add	x1, x19, x21, sxtw
	add	w21, w21, 1
	strb	w0, [x1, 17]
	ldrb	w0, [x22, 24]
	cmp	w0, w21
	bgt	.L503
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 11]
	bne	.L517
.L519:
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
	b	.L504
	.p2align 3
.L522:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 16]
	b	.L509
	.p2align 3
.L520:
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 13]
	bne	.L508
	.p2align 2
.L521:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 14]
	b	.L508
	.size	VC1_Vfmw_ParseAdvEntptHdr, .-VC1_Vfmw_ParseAdvEntptHdr
	.align	3
.LC115:
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
	ble	.L526
	mov	w1, 2
	mov	x0, x20
	bl	BsSkip
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L526:
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
	ble	.L529
	cmp	w0, 11
	bgt	.L533
	mov	w1, 2
	mov	w20, w1
.L528:
	mov	x0, x19
	bl	BsSkip
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L533:
	cmp	w0, 13
	ble	.L531
	cmp	w0, 14
	mov	w1, 4
	beq	.L532
	mov	w20, 5
	b	.L528
	.p2align 3
.L529:
	mov	w1, 1
	mov	x0, x19
	mov	w20, w1
	bl	BsSkip
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L531:
	mov	w1, 3
	mov	w20, 0
	b	.L528
	.p2align 3
.L532:
	mov	w20, w1
	b	.L528
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
	bgt	.L535
	mov	w1, 2
	mov	x0, x20
	asr	w19, w2, 3
	bl	BsSkip
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L535:
	cmp	w0, 27
	mov	w19, 3
	bgt	.L541
	mov	w1, w19
	mov	x0, x20
	bl	BsSkip
	mov	w0, w19
.L542:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L541:
	mov	w0, 5
	cmp	w2, 29
	mov	w19, 4
	csel	w19, w0, w19, gt
	mov	x0, x20
	mov	w1, w19
	bl	BsSkip
	mov	w0, w19
	b	.L542
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
	ldr	x2, .LC116
	mov	w1, 2
	mov	x0, x19
	add	x2, x2, 552
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
.LC116:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_next_start_code
	.type	VC1_Vfmw_next_start_code, %function
VC1_Vfmw_next_start_code:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 0
	bl	_mcount
	mov	x0, x20
	bl	BsToNextByte
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w21, w1, w0, lt
	asr	w21, w21, 3
	sub	w21, w21, #3
	cmp	w21, wzr
	bgt	.L551
	b	.L548
	.p2align 3
.L554:
	bl	BsSkip
	cmp	w19, w21
	beq	.L548
.L551:
	mov	w1, 24
	mov	x0, x20
	add	w19, w19, 1
	bl	BsShow
	mov	w2, w0
	cmp	w2, 1
	mov	w1, 8
	mov	x0, x20
	bne	.L554
	mov	w0, w2
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L548:
	mov	w2, 0
	ldr	x21, [sp, 32]
	mov	w0, w2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	VC1_Vfmw_next_start_code, .-VC1_Vfmw_next_start_code
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_UserData
	.type	VC1_Vfmw_UserData, %function
VC1_Vfmw_UserData:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VC1_Vfmw_UserData, .-VC1_Vfmw_UserData
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_RecordSlcStream
	.type	VC1_RecordSlcStream, %function
VC1_RecordSlcStream:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x20, x22, 20480
	mov	x21, x1
	mov	x23, x2
	bl	_mcount
	add	x1, x21, 536
	add	x5, x20, 3728
	ldr	w0, [x20, 3724]
	ldr	x4, [x22, 3136]
	uxtw	x21, w0
	lsl	x3, x21, 3
	sub	x3, x3, x21
	lsl	x3, x3, 3
	add	x19, x5, x3
	strb	w0, [x19, 16]
	ldr	w0, [x4, 32]
	ubfx	x0, x0, 3, 29
	add	x0, x23, x0
	str	x0, [x5, x3]
	ldr	w2, [x4, 32]
	and	w2, w2, 7
	str	w2, [x19, 24]
	ldr	w3, [x4, 24]
	ldr	w2, [x4, 32]
	lsl	w3, w3, 3
	sub	w3, w3, w2
	lsl	x2, x21, 2
	sub	x2, x2, x21
	str	w3, [x19, 28]
	add	x21, x1, x2, lsl 2
	bl	MEM_Vir2Phy
	add	x2, x22, 36864
	str	w0, [x19, 20]
	add	x0, x2, 1688
	ldr	w1, [x2, 1724]
	str	w1, [x19, 48]
	ldr	x1, [x2, 1696]
	cbz	x1, .L557
	ldr	w2, [x2, 1712]
	cbnz	w2, .L576
.L557:
	mov	x1, 0
	str	xzr, [x19, 8]
	stp	wzr, wzr, [x19, 36]
	str	wzr, [x19, 44]
	str	wzr, [x19, 52]
.L558:
	ldr	w4, [x20, 3640]
	ldr	w0, [x20, 3644]
	ldrb	w2, [x22, 8]
	mul	w4, w0, w4
	sub	w4, w4, #1
	cbz	w2, .L559
	add	w0, w0, 1
	ldr	w3, [x21, 4]
	add	w0, w0, w0, lsr 31
	sub	w3, w3, w0, asr 1
	str	w3, [x19, 32]
	cmp	w4, w3
	ccmp	w3, wzr, 4, cc
	bgt	.L577
.L560:
	ldr	w0, [x19, 28]
	cmp	w0, wzr
	ble	.L562
	cbz	x1, .L563
	ldr	w0, [x19, 44]
	cmp	w0, wzr
	ble	.L562
.L563:
	ldr	w1, [x20, 3724]
	mov	w0, 1
	add	w1, w1, w0
	str	w1, [x20, 3724]
.L561:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L559:
	ldr	w3, [x21, 4]
	str	w3, [x19, 32]
	cmp	w4, w3
	bcs	.L560
	ldr	w2, [x21, 4]
	mov	w0, 1
	ldr	x1, .LC121
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L576:
	str	x1, [x19, 8]
	str	wzr, [x19, 40]
	ldr	w2, [x0, 32]
	lsl	w2, w2, 3
	str	w2, [x19, 44]
	ldr	w2, [x0, 24]
	str	w2, [x19, 36]
	ldr	w0, [x0, 40]
	str	w0, [x19, 52]
	b	.L558
	.p2align 3
.L577:
	ldr	x1, .LC119
	mov	w0, 1
	ldr	w4, [x20, 3644]
	ldr	w2, [x21, 4]
	bl	dprint_vfmw
	mov	w0, 0
	b	.L561
	.p2align 3
.L562:
	ldr	x1, .LC123
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	VC1_RecordSlcStream, .-VC1_RecordSlcStream
	.align	3
.LC119:
	.xword	.LC118
	.align	3
.LC121:
	.xword	.LC120
	.align	3
.LC123:
	.xword	.LC122
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
	add	x21, x0, 8192
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldrh	w1, [x19, 238]
	ldrh	w0, [x21, 2446]
	cmp	w0, w1
	beq	.L579
	add	x0, x20, 20480
	add	w1, w1, 15
	asr	w1, w1, 4
	str	w1, [x0, 3640]
	ldrh	w1, [x19, 238]
	str	w1, [x0, 3656]
	ldrh	w1, [x19, 240]
	ldrh	w2, [x21, 2448]
	cmp	w2, w1
	beq	.L580
.L581:
	add	w1, w1, 15
	asr	w1, w1, 4
	str	w1, [x0, 3644]
	ldrh	w1, [x19, 240]
	str	w1, [x0, 3660]
.L580:
	add	x1, x19, 16
	add	x0, x21, 2224
	add	x19, x19, 188
	mov	x2, 172
	add	x21, x21, 2396
	bl	memcpy
	ldp	x0, x1, [x19]
	stp	x0, x1, [x21]
	mov	w0, 1
	ldp	x2, x3, [x19, 16]
	stp	x2, x3, [x21, 16]
	ldp	x2, x3, [x19, 32]
	stp	x2, x3, [x21, 32]
	ldr	x1, [x19, 48]
	str	x1, [x21, 48]
	ldr	w1, [x19, 56]
	str	w1, [x21, 56]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L579:
	ldrh	w1, [x19, 240]
	ldrh	w0, [x21, 2448]
	cmp	w0, w1
	bne	.L586
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L586:
	add	x0, x20, 20480
	b	.L581
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
	cbz	x19, .L594
	ldrsb	w1, [x19, 3104]
	mov	w0, 1
	cbnz	w1, .L589
	add	x1, x19, 8192
	ldrb	w2, [x1, 2459]
	and	w3, w2, -5
	cbz	w3, .L593
	cmp	w2, w0
	ldrsb	w0, [x19, 10]
	uxtb	w2, w0
	beq	.L595
.L590:
	strb	w0, [x19, 10]
	mov	w0, 1
	strb	w2, [x1, 2478]
.L589:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L593:
	mov	w2, w0
	b	.L590
	.p2align 3
.L595:
	cmp	w0, wzr
	cset	w0, eq
	mov	w2, w0
	sxtb	w0, w0
	b	.L590
.L594:
	ldr	x3, .LC125
	mov	w2, 5854
	ldr	x1, .LC126
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L589
	.size	VC1_Vfmw_UpdataLastPicRNDCTRL, .-VC1_Vfmw_UpdataLastPicRNDCTRL
	.align	3
.LC125:
	.xword	.LC124
	.align	3
.LC126:
	.xword	.LC37
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
	ldr	x1, .LC127
	mov	x2, 128
	add	x0, x29, 32
	add	x1, x1, 584
	bl	memcpy
	mov	w0, w19
	cbnz	w20, .L597
	add	x0, x29, 160
	add	x19, x0, x19, sxtw 2
	ldr	w0, [x19, -128]
.L597:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 160
	ret
	.size	VC1_Vfmw_DecPQUANT, .-VC1_Vfmw_DecPQUANT
	.align	3
.LC127:
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
	cbz	w22, .L600
	ldrb	w24, [x21, 14]
	mov	w1, w22
	mov	w0, w24
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 104]
	cmp	w22, 8
	bls	.L611
	strb	wzr, [x19, 7]
.L602:
	cmp	w24, 1
	beq	.L612
	strb	wzr, [x19, 8]
.L604:
	ldrb	w0, [x21, 7]
	cmp	w0, 1
	beq	.L613
	strb	wzr, [x19, 9]
.L606:
	ldrb	w0, [x19, 3]
	sub	w0, w0, #2
	and	w0, w0, -3
	uxtb	w0, w0
	cbz	w0, .L609
	ldrb	w0, [x21, 4]
	cmp	w0, 1
	beq	.L614
.L609:
	ldrb	w1, [x19, 10]
.L608:
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
.L600:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L611:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 7]
	ldrb	w24, [x21, 14]
	b	.L602
	.p2align 3
.L613:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 9]
	b	.L606
	.p2align 3
.L612:
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	b	.L604
	.p2align 3
.L614:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	uxtb	w1, w0
	strb	w1, [x19, 10]
	b	.L608
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
	cbz	w22, .L627
	ldrb	w24, [x21, 14]
	uxtb	w1, w0
	mov	w0, w24
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 104]
	cmp	w22, 8
	bls	.L638
	strb	wzr, [x19, 7]
.L619:
	cmp	w24, 1
	beq	.L639
	strb	wzr, [x19, 8]
.L621:
	ldrb	w0, [x21, 7]
	cmp	w0, 1
	beq	.L640
	strb	wzr, [x19, 9]
.L623:
	ldrb	w0, [x21, 4]
	cmp	w0, 1
	beq	.L624
	ldrb	w1, [x19, 10]
.L625:
	mov	x0, x23
	bl	VC1_SetCurPicResolutionInfo
	mov	x0, x20
	bl	BsPos
	mov	w2, w0
	ldr	x1, .LC129
	mov	w0, 18
	bl	dprint_vfmw
	ldrb	w1, [x19, 104]
	mov	x0, x20
	bl	VC1_DecMvmodeProgrP
	uxtb	w0, w0
	cmp	w0, 4
	strb	w0, [x19, 11]
	beq	.L641
.L626:
	mov	w3, 0
	mov	x2, x21
	mov	x1, x23
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L627
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 15]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 16]
	ldrb	w1, [x21, 8]
	cbnz	w1, .L642
.L628:
	mov	x0, x20
	bl	BsPos
	mov	w2, w0
	ldr	x1, .LC131
	mov	w0, 18
	bl	dprint_vfmw
	ldrb	w1, [x21, 9]
	cmp	w1, 1
	beq	.L643
.L630:
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
.L627:
	mov	w1, 0
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L638:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 7]
	ldrb	w24, [x21, 14]
	b	.L619
	.p2align 3
.L642:
	ldrb	w2, [x19, 104]
	add	x3, x21, 272
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L628
	.p2align 3
.L641:
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
	b	.L626
	.p2align 3
.L624:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	uxtb	w1, w0
	strb	w1, [x19, 10]
	b	.L625
	.p2align 3
.L640:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 9]
	b	.L623
	.p2align 3
.L639:
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	b	.L621
	.p2align 3
.L643:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 17]
	bne	.L630
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 18]
	b	.L630
	.size	VC1_Vfmw_ParseSMPPPicHdr, .-VC1_Vfmw_ParseSMPPPicHdr
	.align	3
.LC129:
	.xword	.LC128
	.align	3
.LC131:
	.xword	.LC130
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
	cbz	w22, .L654
	ldrb	w23, [x21, 14]
	uxtb	w1, w0
	mov	w0, w23
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 104]
	cmp	w22, 8
	bls	.L666
	strb	wzr, [x19, 7]
.L648:
	cmp	w23, 1
	beq	.L667
	strb	wzr, [x19, 8]
.L650:
	ldrb	w0, [x21, 7]
	cmp	w0, 1
	beq	.L668
	strb	wzr, [x19, 9]
.L652:
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
	beq	.L654
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 15]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 16]
	ldrb	w1, [x21, 8]
	cbnz	w1, .L669
.L655:
	ldrb	w1, [x21, 9]
	cmp	w1, 1
	beq	.L670
.L657:
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
.L654:
	mov	w1, 0
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L666:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 7]
	ldrb	w23, [x21, 14]
	b	.L648
	.p2align 3
.L669:
	ldrb	w2, [x19, 104]
	add	x3, x21, 272
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L655
	.p2align 3
.L668:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 9]
	b	.L652
	.p2align 3
.L667:
	mov	w1, w23
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	b	.L650
	.p2align 3
.L670:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 17]
	bne	.L657
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 18]
	b	.L657
	.size	VC1_Vfmw_ParseMPBPicHdr, .-VC1_Vfmw_ParseMPBPicHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseSMPPicHdr
	.type	VC1_Vfmw_ParseSMPPicHdr, %function
VC1_Vfmw_ParseSMPPicHdr:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
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
	ble	.L709
	ldr	x25, .LC132
	mov	x2, 112
	mov	w1, 0
	mov	x0, x19
	add	x24, x21, 36864
	ldr	x3, [x25, 96]
	blr	x3
	strb	w23, [x19, 10]
	ldr	x3, [x25, 96]
	add	x0, x21, 20480
	mov	x2, 14336
	mov	w1, 0
	add	x0, x0, 3728
	blr	x3
	ldr	x1, .LC134
	mov	w0, 18
	ldr	w2, [x24, 1680]
	bl	dprint_vfmw
	mov	x0, x20
	bl	BsPos
	str	w0, [x19, 88]
	ldrb	w0, [x22, 15]
	cbnz	w0, .L674
	ldrb	w2, [x22, 248]
.L675:
	ldr	x1, .LC136
	mov	w0, 18
	bl	dprint_vfmw
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 1]
	ldrb	w0, [x22, 12]
	cbnz	w0, .L710
.L676:
	ldrb	w0, [x22, 13]
	mov	w1, 1
	cbnz	w0, .L677
	mov	x0, x20
	bl	BsGet
	cmp	w0, wzr
	cset	w0, ne
	strb	w0, [x19, 3]
.L678:
	strb	w0, [x21, 2]
	strb	wzr, [x21, 4]
	ldrb	w0, [x19, 3]
	cmp	w0, 4
	bhi	.L707
	ldr	x1, .LC137
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx683
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx683:
	.section	.rodata
	.align	0
	.align	2
.L683:
	.byte	(.L682 - .Lrtx683) / 4
	.byte	(.L684 - .Lrtx683) / 4
	.byte	(.L685 - .Lrtx683) / 4
	.byte	(.L707 - .Lrtx683) / 4
	.byte	(.L686 - .Lrtx683) / 4
	.text
	.p2align 3
.L684:
	mov	x1, x21
	mov	x2, x22
	mov	x0, x20
	bl	VC1_Vfmw_ParseSMPPPicHdr
	mov	w21, w0
.L687:
	mov	x0, x20
	bl	BsPos
	ldr	w1, [x19, 88]
	sub	w0, w0, w1
	str	w0, [x19, 88]
	mov	x0, x20
	ldr	w19, [x24, 1716]
	bl	BsPos
	lsl	w19, w19, 3
	sub	w19, w19, w0
	mov	w0, w21
	cmp	w19, wzr
	bgt	.L700
	ldr	x1, .LC143
	mov	w0, 1
	bl	dprint_vfmw
	.p2align 2
.L707:
	mov	w0, 0
.L700:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L709:
	mov	w0, 5
	strb	w0, [x19, 3]
	strb	w0, [x21, 2]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L677:
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	beq	.L711
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	beq	.L712
	mov	w0, 2
	add	x2, x22, 251
	strb	w0, [x19, 3]
	add	x1, x22, 356
	mov	x0, x20
	bl	VC1_DecBfractionSMP
	uxtb	w0, w0
	cmp	w0, 21
	strb	w0, [x19, 4]
	beq	.L707
	ldrb	w0, [x19, 3]
	b	.L678
	.p2align 3
.L674:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w2, w0
	strb	w2, [x22, 248]
	b	.L675
	.p2align 3
.L711:
	strb	w0, [x19, 3]
	b	.L678
	.p2align 3
.L686:
	ldrb	w23, [x21, 3120]
	cmp	w23, 1
	bne	.L707
	mov	x1, x21
	mov	x2, x22
	mov	x0, x20
	bl	VC1_Vfmw_ParseSMPIPicHdr
	cmp	w0, 1
	mov	w21, w0
	beq	.L687
	ldr	x1, .LC141
	mov	w0, w23
	bl	dprint_vfmw
	b	.L687
	.p2align 3
.L685:
	ldrb	w23, [x21, 3120]
	cmp	w23, 1
	bne	.L707
	mov	x1, x21
	mov	x2, x22
	mov	x0, x20
	bl	VC1_Vfmw_ParseMPBPicHdr
	cmp	w0, 1
	mov	w21, w0
	beq	.L687
	ldr	x1, .LC139
	mov	w0, w23
	bl	dprint_vfmw
	b	.L687
	.p2align 3
.L682:
	mov	x1, x21
	mov	x2, x22
	mov	x0, x20
	bl	VC1_Vfmw_ParseSMPIPicHdr
	mov	w21, w0
	b	.L687
	.p2align 3
.L710:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 2]
	b	.L676
	.p2align 3
.L712:
	strb	wzr, [x19, 3]
	mov	w0, 0
	b	.L678
	.size	VC1_Vfmw_ParseSMPPicHdr, .-VC1_Vfmw_ParseSMPPicHdr
	.align	3
.LC132:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC134:
	.xword	.LC133
	.align	3
.LC136:
	.xword	.LC135
	.align	3
.LC137:
	.xword	.L683
	.align	3
.LC139:
	.xword	.LC138
	.align	3
.LC141:
	.xword	.LC140
	.align	3
.LC143:
	.xword	.LC142
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
	beq	.L729
.L714:
	ldr	w0, [x19, 44]
	cbnz	w0, .L715
	ldrb	w1, [x23, 9]
	cmp	w1, 1
	beq	.L730
.L715:
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w22, w0
	strb	w22, [x19, 10]
	cbz	w22, .L723
	add	x26, x21, 188
	ldrb	w24, [x26, 10]
	uxtb	w1, w0
	mov	w0, w24
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w22, 8
	bls	.L731
	strb	wzr, [x19, 3]
.L719:
	cmp	w24, 1
	beq	.L732
	strb	wzr, [x19, 11]
.L721:
	ldrb	w0, [x23, 5]
	cmp	w0, 1
	beq	.L733
.L722:
	mov	w3, 0
	mov	x2, x21
	mov	x1, x25
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L723
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
	cbz	w1, .L717
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
.L723:
	mov	w22, 0
.L717:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L731:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w24, [x26, 10]
	b	.L719
	.p2align 3
.L730:
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 9]
	b	.L715
	.p2align 3
.L729:
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	b	.L714
	.p2align 3
.L733:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L722
	.p2align 3
.L732:
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L721
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
	beq	.L735
	ldr	w0, [x19, 44]
	cmp	w0, 2
	beq	.L735
	ldrb	w1, [x22, 9]
	cmp	w1, 1
	beq	.L771
.L737:
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w23, w0
	strb	w23, [x19, 10]
	cbz	w23, .L751
	add	x24, x21, 188
	ldrb	w25, [x24, 10]
	uxtb	w1, w0
	mov	w0, w25
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w23, 8
	bls	.L772
	strb	wzr, [x19, 3]
.L741:
	cmp	w25, 1
	beq	.L773
	strb	wzr, [x19, 11]
.L743:
	ldrb	w0, [x22, 5]
	cmp	w0, 1
	beq	.L774
.L744:
	ldrb	w0, [x24, 6]
	cmp	w0, 1
	beq	.L775
.L745:
	ldr	w0, [x19, 44]
	cbz	w0, .L776
	ldrb	w0, [x24, 12]
	cmp	w0, 1
	beq	.L777
	strb	wzr, [x19, 25]
.L749:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 26]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x19, 120]
	beq	.L778
.L750:
	strb	wzr, [x19, 34]
.L747:
	mov	w3, 0
	mov	x2, x21
	mov	x1, x26
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L751
	ldr	w1, [x19, 44]
	cmp	w1, 2
	beq	.L779
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
	beq	.L780
.L755:
	ldrb	w1, [x24, 7]
	cbnz	w1, .L781
.L757:
	ldrb	w1, [x24, 8]
	cmp	w1, 1
	beq	.L782
.L759:
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
.L751:
	mov	w1, 0
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L735:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	ldrb	w1, [x22, 9]
	cmp	w1, 1
	bne	.L737
.L771:
	ldr	w0, [x19, 44]
	cbnz	w0, .L737
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 9]
	b	.L737
	.p2align 3
.L753:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	b	.L754
	.p2align 3
.L772:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w25, [x24, 10]
	b	.L741
	.p2align 3
.L778:
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 16]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 17]
	b	.L750
	.p2align 3
.L776:
	ldrb	w1, [x19, 116]
	mov	x0, x20
	bl	VC1_DecMvmodeProgrP
	uxtb	w0, w0
	cmp	w0, 4
	strb	w0, [x19, 14]
	bne	.L747
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
	b	.L747
	.p2align 3
.L781:
	ldrb	w2, [x19, 116]
	add	x3, x21, 520
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L757
	.p2align 3
.L773:
	mov	w1, w25
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L743
	.p2align 3
.L775:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 13]
	b	.L745
	.p2align 3
.L774:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L744
	.p2align 3
.L779:
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 27]
	b	.L752
	.p2align 3
.L780:
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 28]
	ldrb	w1, [x19, 26]
	mov	w0, 0
	cmp	w1, 1
	beq	.L783
	strb	w0, [x19, 29]
	b	.L755
	.p2align 3
.L782:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 20]
	bne	.L759
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	b	.L759
	.p2align 3
.L777:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 25]
	b	.L749
.L783:
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 29]
	b	.L755
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
	beq	.L785
	ldr	w2, [x19, 44]
	cmp	w2, 2
	beq	.L785
.L786:
	ldrb	w1, [x22, 9]
	cmp	w1, 1
	beq	.L826
.L787:
	cbnz	w2, .L791
	add	x1, x21, 508
	mov	x0, x20
	bl	VC1_DecBfraction
	uxtb	w0, w0
	cmp	w0, 21
	strb	w0, [x19, 2]
	beq	.L789
.L791:
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w23, w0
	strb	w23, [x19, 10]
	cbz	w23, .L789
	add	x24, x21, 188
	ldrb	w26, [x24, 10]
	uxtb	w1, w0
	mov	w0, w26
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w23, 8
	bls	.L827
	strb	wzr, [x19, 3]
.L794:
	cmp	w26, 1
	beq	.L828
	strb	wzr, [x19, 11]
.L796:
	ldrb	w0, [x22, 5]
	cmp	w0, 1
	beq	.L829
.L797:
	ldr	w0, [x19, 44]
	cmp	w0, 2
	beq	.L830
.L798:
	ldrb	w0, [x24, 6]
	cmp	w0, 1
	beq	.L831
.L799:
	ldr	w0, [x19, 44]
	cbz	w0, .L832
	ldrb	w0, [x24, 12]
	cmp	w0, 1
	beq	.L833
.L803:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 120]
.L802:
	mov	w3, 0
	mov	x2, x21
	mov	x1, x25
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L789
	ldr	w1, [x19, 44]
	cmp	w1, 2
	beq	.L834
.L804:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 18]
	ldr	w1, [x19, 44]
	cbnz	w1, .L805
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
.L806:
	ldr	w22, [x19, 44]
	strb	w0, [x19, 19]
	cmp	w22, 2
	beq	.L835
.L807:
	ldrb	w1, [x24, 7]
	cbnz	w1, .L836
.L808:
	ldrb	w1, [x24, 8]
	cmp	w1, 1
	beq	.L837
.L810:
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
.L789:
	mov	w1, 0
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L826:
	cbnz	w2, .L791
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 9]
	ldr	w2, [x19, 44]
	b	.L787
	.p2align 3
.L785:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	ldr	w2, [x19, 44]
	b	.L786
	.p2align 3
.L805:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	b	.L806
	.p2align 3
.L827:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w26, [x24, 10]
	b	.L794
	.p2align 3
.L832:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, wzr
	mov	w1, 3
	csinc	w1, w1, wzr, eq
	strb	w1, [x19, 14]
	b	.L802
	.p2align 3
.L836:
	ldrb	w2, [x19, 116]
	add	x3, x21, 520
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L808
	.p2align 3
.L831:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 13]
	b	.L799
	.p2align 3
.L830:
	add	x1, x21, 508
	mov	x0, x20
	bl	VC1_DecBfraction
	strb	w0, [x19, 2]
	b	.L798
	.p2align 3
.L829:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L797
	.p2align 3
.L828:
	mov	w1, w26
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L796
	.p2align 3
.L837:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 20]
	bne	.L810
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	b	.L810
	.p2align 3
.L835:
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 28]
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 29]
	b	.L807
	.p2align 3
.L834:
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 27]
	b	.L804
	.p2align 3
.L833:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 25]
	b	.L803
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
	ble	.L859
	cmp	w0, 11
	bgt	.L871
	mov	w24, 2
	mov	w1, w24
.L839:
	add	x20, x21, 360
	mov	x0, x19
	add	x22, x21, 16
	bl	BsSkip
	strb	w24, [x20, 1]
	ldrb	w0, [x23, 3545]
	strb	w0, [x23, 2]
	ldrb	w0, [x22, 8]
	cbnz	w0, .L872
.L840:
	ldrb	w0, [x22, 6]
	cbz	w0, .L841
	ldrb	w0, [x22, 7]
	cbnz	w0, .L842
	mov	w1, 2
	mov	x0, x19
	bl	BsGet
	strb	w0, [x20, 6]
	ldrb	w0, [x22, 7]
	cmp	w0, 1
	ldrb	w0, [x22, 6]
	beq	.L846
.L875:
	cmp	w0, 1
	bne	.L845
	ldrb	w0, [x20, 6]
	add	w0, w0, 1
	str	w0, [x20, 144]
.L848:
	ldrb	w1, [x21, 190]
	cmp	w1, 1
	beq	.L849
.L857:
	ldrb	w0, [x20, 1]
	cmp	w0, 5
	bls	.L873
.L863:
	mov	w0, 0
	b	.L850
	.p2align 3
.L873:
	ldr	x1, .LC144
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx852
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx852:
	.section	.rodata
	.align	0
	.align	2
.L852:
	.byte	(.L855 - .Lrtx852) / 4
	.byte	(.L853 - .Lrtx852) / 4
	.byte	(.L854 - .Lrtx852) / 4
	.byte	(.L863 - .Lrtx852) / 4
	.byte	(.L855 - .Lrtx852) / 4
	.byte	(.L856 - .Lrtx852) / 4
	.text
	.p2align 3
.L871:
	cmp	w0, 13
	ble	.L861
	cmp	w0, 14
	beq	.L874
	mov	w24, 5
	mov	w1, 4
	b	.L839
	.p2align 3
.L855:
	mov	x2, x21
	mov	x1, x23
	mov	x0, x19
	bl	VC1_Vfmw_ParseAdvIPicHdr
.L850:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L841:
	mov	w0, 1
	strb	w0, [x20, 4]
	ldrb	w0, [x22, 7]
	cmp	w0, 1
	beq	.L844
.L845:
	mov	w0, 1
	str	w0, [x20, 144]
	ldrb	w1, [x21, 190]
	cmp	w1, 1
	bne	.L857
.L849:
	mov	x0, x19
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x20, 7]
	bne	.L857
	ldr	w0, [x20, 144]
	cmp	w0, wzr
	ble	.L857
	mov	w24, 0
	.p2align 2
.L858:
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
	bgt	.L858
	b	.L857
	.p2align 3
.L844:
	mov	w0, 2
	str	w0, [x20, 144]
	b	.L848
	.p2align 3
.L859:
	mov	w24, 1
	mov	w1, w24
	b	.L839
	.p2align 3
.L872:
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	str	w0, [x20, 48]
	b	.L840
	.p2align 3
.L842:
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
	bne	.L875
.L846:
	cmp	w0, 1
	bne	.L844
	ldrb	w0, [x20, 5]
	add	w0, w0, 2
	str	w0, [x20, 144]
	b	.L848
	.p2align 3
.L853:
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
.L856:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L854:
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
.L861:
	mov	w24, 0
	mov	w1, 3
	b	.L839
	.p2align 3
.L874:
	mov	w24, 4
	mov	w1, w24
	b	.L839
	.size	VC1_Vfmw_ParseAdvFramePicHdr, .-VC1_Vfmw_ParseAdvFramePicHdr
	.align	3
.LC144:
	.xword	.L852
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
	cbz	w22, .L884
	add	x24, x21, 188
	ldrb	w23, [x24, 10]
	uxtb	w1, w0
	mov	w0, w23
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w22, 8
	bls	.L890
	strb	wzr, [x19, 3]
.L880:
	cmp	w23, 1
	beq	.L891
	strb	wzr, [x19, 11]
.L882:
	ldrb	w0, [x21, 21]
	cmp	w0, 1
	beq	.L892
.L883:
	mov	w3, 0
	mov	x2, x21
	mov	x1, x25
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L884
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
	cbz	w1, .L878
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
.L884:
	mov	w22, 0
.L878:
	mov	w0, w22
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L890:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w23, [x24, 10]
	b	.L880
	.p2align 3
.L892:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L883
	.p2align 3
.L891:
	mov	w1, w23
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L882
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
	cbz	w22, .L894
	add	x21, x23, 188
	ldrb	w24, [x21, 10]
	mov	w1, w22
	mov	w0, w24
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w22, 8
	bls	.L921
	strb	wzr, [x19, 3]
.L896:
	cmp	w24, 1
	beq	.L922
	strb	wzr, [x19, 11]
.L898:
	ldrb	w0, [x23, 21]
	cmp	w0, 1
	beq	.L923
.L899:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 32]
	cbz	w0, .L924
.L900:
	ldrb	w0, [x21, 6]
	cmp	w0, 1
	beq	.L925
.L901:
	ldrb	w0, [x21, 12]
	cmp	w0, 1
	beq	.L926
.L902:
	ldrb	w1, [x19, 116]
	mov	x0, x20
	bl	VC1_DecMvmodeProgrP
	uxtb	w0, w0
	cmp	w0, 4
	strb	w0, [x19, 14]
	beq	.L927
.L904:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 27]
	ldrb	w1, [x19, 32]
	cbnz	w1, .L906
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
	cbz	w1, .L908
.L930:
	ldrh	w0, [x19, 14]
	cmp	w0, 4
	beq	.L908
	ldrb	w1, [x21, 7]
	cbnz	w1, .L928
.L910:
	ldrb	w1, [x21, 8]
	cmp	w1, 1
	beq	.L929
.L912:
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 22]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 24]
	mov	w1, 1
.L894:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L906:
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
	cbnz	w1, .L930
.L908:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 29]
	ldrb	w1, [x21, 7]
	cbz	w1, .L910
.L928:
	ldrb	w2, [x19, 116]
	add	x3, x23, 520
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L910
	.p2align 3
.L921:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w24, [x21, 10]
	b	.L896
	.p2align 3
.L924:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, wzr
	cset	w0, eq
	strb	w0, [x19, 33]
	b	.L900
	.p2align 3
.L927:
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
	cbnz	w1, .L904
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 132]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 136]
	b	.L904
	.p2align 3
.L926:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 25]
	b	.L902
	.p2align 3
.L929:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 20]
	bne	.L912
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	b	.L912
	.p2align 3
.L925:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 13]
	b	.L901
	.p2align 3
.L923:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L899
	.p2align 3
.L922:
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L898
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
	cbz	w22, .L941
	add	x23, x21, 188
	ldrb	w24, [x23, 10]
	uxtb	w1, w0
	mov	w0, w24
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w22, 8
	bls	.L953
	strb	wzr, [x19, 3]
.L935:
	cmp	w24, 1
	beq	.L954
	strb	wzr, [x19, 11]
.L937:
	ldrb	w0, [x21, 21]
	cmp	w0, 1
	beq	.L955
.L938:
	ldrb	w0, [x23, 6]
	cmp	w0, 1
	beq	.L956
.L939:
	ldrb	w0, [x23, 12]
	cmp	w0, 1
	beq	.L957
.L940:
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
	beq	.L941
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
	cbz	w1, .L958
.L942:
	ldrb	w1, [x23, 7]
	cbnz	w1, .L959
.L943:
	ldrb	w1, [x23, 8]
	cmp	w1, 1
	beq	.L960
.L945:
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
.L941:
	mov	w1, 0
	ldr	x25, [sp, 64]
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L953:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w24, [x23, 10]
	b	.L935
	.p2align 3
.L959:
	ldrb	w2, [x19, 116]
	add	x3, x21, 520
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L943
	.p2align 3
.L958:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 29]
	b	.L942
	.p2align 3
.L957:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 25]
	b	.L940
	.p2align 3
.L956:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 13]
	b	.L939
	.p2align 3
.L955:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L938
	.p2align 3
.L954:
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L937
	.p2align 3
.L960:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 20]
	bne	.L945
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	b	.L945
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
	ldrb	w0, [x20, 8]
	cbz	w0, .L962
	add	x0, x20, 20480
	ldr	w0, [x0, 3724]
	cbnz	w0, .L962
	add	x19, x22, 360
	ldr	w0, [x19, 156]
	strb	w0, [x19, 1]
	ldrb	w0, [x20, 3545]
	strb	w0, [x20, 2]
.L981:
	ldrb	w0, [x19, 1]
	cmp	w0, 4
	bls	.L1002
.L990:
	ldrb	w1, [x19, 4]
	mov	w0, 0
	cbz	w1, .L988
.L1007:
	ldrb	w1, [x20, 8]
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
.L962:
	mov	w1, 3
	mov	x0, x21
	add	x19, x22, 360
	add	x23, x22, 16
	bl	BsGet
	sbfiz	x1, x0, 3, 32
	ldr	x2, .LC145
	str	w0, [x19, 124]
	add	x0, x2, x1
	ldr	w1, [x2, x1]
	ldr	w0, [x0, 4]
	stp	w1, w0, [x19, 152]
	uxtb	w1, w1
	ldrb	w2, [x20, 8]
	uxtb	w0, w0
	cmp	w2, wzr
	csel	w0, w0, w1, ne
	strb	w0, [x19, 1]
	ldrb	w0, [x20, 3545]
	strb	w0, [x20, 2]
	ldrb	w0, [x23, 8]
	cbnz	w0, .L1003
	ldrb	w0, [x23, 6]
	cbnz	w0, .L1004
.L967:
	mov	w0, 1
	strb	w0, [x19, 4]
	ldrb	w0, [x23, 7]
	cmp	w0, 1
	beq	.L970
.L971:
	mov	w0, 1
	str	w0, [x19, 144]
.L974:
	add	x23, x22, 188
	ldrb	w1, [x23, 2]
	cmp	w1, 1
	beq	.L975
.L978:
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
	beq	.L1005
.L977:
	ldr	w0, [x19, 124]
	cmp	w0, 3
	ble	.L981
.L982:
	add	x1, x22, 508
	mov	x0, x21
	bl	VC1_DecBfraction
	strb	w0, [x19, 2]
	ldrb	w0, [x19, 1]
	cmp	w0, 4
	bhi	.L990
	.p2align 2
.L1002:
	ldr	x1, .LC146
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx985
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx985:
	.section	.rodata
	.align	0
	.align	2
.L985:
	.byte	(.L984 - .Lrtx985) / 4
	.byte	(.L986 - .Lrtx985) / 4
	.byte	(.L987 - .Lrtx985) / 4
	.byte	(.L990 - .Lrtx985) / 4
	.byte	(.L984 - .Lrtx985) / 4
	.text
	.p2align 3
.L1004:
	ldrb	w0, [x23, 7]
	cbz	w0, .L1006
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
	strb	w0, [x19, 4]
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
	strb	w0, [x19, 5]
.L969:
	ldrb	w0, [x23, 7]
	cmp	w0, 1
	ldrb	w0, [x23, 6]
	beq	.L972
	cmp	w0, 1
	bne	.L971
	ldrb	w0, [x19, 6]
	add	w0, w0, 1
	str	w0, [x19, 144]
	b	.L974
	.p2align 3
.L987:
	mov	x2, x22
	mov	x1, x20
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvBFieldHdr
.L983:
	ldrb	w1, [x19, 4]
	cbnz	w1, .L1007
.L988:
	ldrb	w1, [x20, 8]
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
.L986:
	mov	x2, x22
	mov	x1, x20
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvPFieldHdr
	b	.L983
	.p2align 3
.L984:
	mov	x2, x22
	mov	x1, x20
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvIFieldHdr
	b	.L983
	.p2align 3
.L1003:
	mov	w1, 8
	mov	x0, x21
	bl	BsGet
	str	w0, [x19, 48]
	ldrb	w0, [x23, 6]
	cbz	w0, .L967
	b	.L1004
	.p2align 3
.L1006:
	mov	w1, 2
	mov	x0, x21
	bl	BsGet
	strb	w0, [x19, 6]
	b	.L969
	.p2align 3
.L1005:
	ldr	w0, [x19, 124]
	cmp	w0, 3
	bgt	.L982
	mov	x0, x21
	bl	VC1_DecRefdist
	strb	w0, [x19, 31]
	b	.L977
	.p2align 3
.L970:
	mov	w0, 2
	str	w0, [x19, 144]
	b	.L974
	.p2align 3
.L972:
	cmp	w0, 1
	bne	.L970
	ldrb	w0, [x19, 5]
	add	w0, w0, 2
	str	w0, [x19, 144]
	b	.L974
	.p2align 3
.L975:
	mov	x0, x21
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 7]
	bne	.L978
	ldr	w0, [x19, 144]
	cmp	w0, wzr
	ble	.L978
	mov	w25, 0
	.p2align 2
.L979:
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
	bgt	.L979
	b	.L978
	.size	VC1_Vfmw_ParseAdvFieldPicHdr, .-VC1_Vfmw_ParseAdvFieldPicHdr
	.align	3
.LC145:
	.xword	.LANCHOR1
	.align	3
.LC146:
	.xword	.L985
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
	mov	x21, x0
	mov	x0, x30
	mov	x19, x1
	mov	x20, x2
	bl	_mcount
	add	x2, x19, 20480
	add	x0, x19, 36864
	ldr	w1, [x2, 3640]
	str	w1, [x0, 1760]
	lsl	w4, w1, 4
	ldr	w3, [x2, 3644]
	str	w3, [x0, 1764]
	str	w4, [x0, 1752]
	lsl	w4, w3, 4
	mul	w1, w1, w3
	str	w1, [x0, 1768]
	str	w4, [x0, 1756]
	ldrb	w0, [x19, 8]
	cbz	w0, .L1009
	ldr	w0, [x2, 3724]
	cbz	w0, .L1019
.L1009:
	ldrb	w23, [x20, 23]
	cmp	w23, 1
	beq	.L1020
	mov	w1, 0
	mov	w0, 0
.L1011:
	str	w0, [x20, 404]
	mov	x2, x20
	cbz	w1, .L1021
.L1013:
	mov	x1, x19
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvFieldPicHdr
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1019:
	ldr	w1, [x20, 404]
	mov	x2, x20
	and	w1, w1, -3
	cbnz	w1, .L1013
.L1021:
	mov	x1, x19
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvFramePicHdr
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1020:
	mov	w1, 2
	mov	x0, x21
	bl	BsShow
	cmp	w0, 1
	mov	w22, w0
	ble	.L1022
	mov	w1, 2
	mov	x0, x21
	bl	BsSkip
	and	w1, w22, -3
	mov	w0, w22
	b	.L1011
	.p2align 3
.L1022:
	mov	w1, w23
	mov	x0, x21
	bl	BsSkip
	mov	w1, 0
	mov	w0, 0
	b	.L1011
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
	mov	x20, x0
	mov	x0, x30
	mov	x22, x1
	mov	x21, x2
	bl	_mcount
	add	x2, x22, 20480
	mov	w1, 9
	mov	x0, x20
	ldr	w19, [x2, 3724]
	bl	BsGet
	mov	w1, 1
	uxtw	x19, w19
	lsl	x2, x19, 2
	sub	x19, x2, x19
	add	x19, x21, x19, lsl 2
	str	w0, [x19, 540]
	mov	x0, x20
	bl	BsGet
	sxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 536]
	beq	.L1026
	mov	w0, 1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1026:
	add	x19, x22, 4096
	add	x4, x21, 188
	add	x3, x19, 2884
	mov	x2, 172
	add	x23, x19, 2696
	ldp	x0, x1, [x4]
	stp	x0, x1, [x3]
	add	x1, x21, 16
	add	x0, x19, 2712
	ldp	x6, x7, [x4, 16]
	stp	x6, x7, [x3, 16]
	ldp	x6, x7, [x4, 32]
	stp	x6, x7, [x3, 32]
	ldr	x5, [x21, 236]
	str	x5, [x3, 48]
	ldr	w4, [x21, 244]
	str	w4, [x22, 7036]
	bl	memcpy
	add	x1, x21, 360
	mov	x2, 176
	add	x0, x19, 3056
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
	beq	.L1028
	ldr	w1, [x19, 40]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
.L1028:
	ldr	x3, .LC147
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
.LC147:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_ClearCurPic
	.type	VC1_ClearCurPic, %function
VC1_ClearCurPic:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	mov	w23, w1
	bl	_mcount
	cbz	x22, .L1049
	cmp	w23, 32
	bhi	.L1050
	ldrsb	w0, [x22, 3104]
	cbz	w0, .L1036
	add	x24, x22, 20480
	mov	w20, 0
	ldr	w0, [x24, 3724]
	cbnz	w0, .L1045
	b	.L1032
	.p2align 3
.L1038:
	ldr	w0, [x24, 3724]
	cmp	w0, w20
	bls	.L1032
.L1045:
	sxtw	x19, w20
	mov	w0, w23
	lsl	x1, x19, 3
	add	w20, w20, 1
	sub	x19, x1, x19
	add	x19, x22, x19, lsl 3
	add	x21, x19, 20480
	ldr	w1, [x21, 3776]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 24216]
	cbz	x0, .L1038
	ldr	w0, [x21, 3764]
	cbz	w0, .L1038
	ldr	w1, [x21, 3780]
	mov	w0, w23
	bl	SM_ReleaseStreamSeg
	ldr	w0, [x24, 3724]
	cmp	w0, w20
	bhi	.L1045
.L1032:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1050:
	ldr	x1, .LC151
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1036:
	add	x1, x22, 36864
	mov	w0, w23
	add	x1, x1, 1688
	bl	VC1_ClearCurPacket
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L1049:
	ldr	x1, .LC149
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1032
	.size	VC1_ClearCurPic, .-VC1_ClearCurPic
	.align	3
.LC149:
	.xword	.LC148
	.align	3
.LC151:
	.xword	.LC150
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
	stp	x25, x26, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	mov	w22, w1
	bl	_mcount
	cbz	x19, .L1085
	add	x21, x19, 12288
	ldr	x2, [x19, 8]
	add	x0, x21, 2520
	add	x20, x19, 53248
	add	x1, x0, 36864
	add	x24, x0, 20480
	ldrb	w3, [x2, 75]
	strb	w3, [x1, 1817]
	ldr	w2, [x2, 14600]
	str	w2, [x1, 1820]
	ldr	w1, [x20, 904]
	bl	VC1_ClearCurPic
	ldr	w1, [x24, 3716]
	ldr	w0, [x20, 904]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	ldr	w1, [x24, 3712]
	ldr	w0, [x20, 904]
	bl	FSP_GetFsImagePtr
	mov	x25, x0
	ldr	w1, [x24, 3708]
	ldr	w0, [x20, 904]
	bl	FSP_GetFsImagePtr
	cbz	x23, .L1086
	tbnz	w22, #31, .L1072
	mov	w0, 100
	cmp	w22, w0
	csel	w22, w22, w0, le
.L1055:
	mov	x0, x19
	str	w22, [x23, 152]
	bl	VC1_SetImgFormat
	ldrsb	w1, [x21, 2523]
	cmp	w1, 3
	beq	.L1087
.L1056:
	str	xzr, [x23, 544]
	str	xzr, [x23, 552]
	ldr	x0, [x19]
	ldr	w0, [x0, 24]
	cbz	w0, .L1088
	add	x0, x21, 2520
	mov	w24, 0
	add	x0, x0, 20480
	ldr	w1, [x0, 3716]
	str	w1, [x0, 3720]
.L1060:
	add	x23, x21, 2520
	cmn	w1, #1
	add	x2, x23, 36864
	ldr	w0, [x2, 1680]
	add	w0, w0, 1
	str	w0, [x2, 1680]
	beq	.L1061
.L1092:
	ldr	w0, [x20, 904]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L1089
	ldr	w2, [x0, 152]
	cbz	w2, .L1063
	ldr	x0, [x19]
	ldr	w3, [x0, 4]
	cmp	w2, w3
	bhi	.L1064
.L1063:
	add	x23, x21, 2520
	ldr	w0, [x20, 904]
	add	x25, x23, 20480
	ldr	w26, [x25, 3720]
	mov	w1, w26
	bl	FSP_GetRef
	mov	w3, w0
	ldr	x1, .LC159
	mov	w2, w26
	mov	w0, 12
	bl	dprint_vfmw
	ldr	w0, [x20, 904]
	mov	w2, 1
	ldr	w1, [x25, 3720]
	bl	FSP_SetDisplay
	cbnz	w24, .L1090
	ldr	x1, [x23, 24088]
	mov	w2, 1
	mov	w0, 2
	strb	w2, [x1, 1]
	strb	w0, [x23, 1]
.L1066:
	ldr	w0, [x20, 904]
	mov	x4, x22
	add	x3, x20, 296
	mov	x2, x19
	mov	w1, 1
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L1067
	ldr	w0, [x20, 904]
	add	x21, x21, 2520
	ldr	x1, [x22, 544]
	bl	FreeUsdByDec
	str	xzr, [x22, 544]
	ldr	x1, [x22, 552]
	ldr	w0, [x20, 904]
	bl	FreeUsdByDec
	str	xzr, [x22, 552]
	add	x0, x21, 20480
	mov	w2, 0
	ldr	w1, [x0, 3720]
	ldr	w0, [x20, 904]
	bl	FSP_SetDisplay
	cbnz	w24, .L1091
	ldr	x1, [x21, 24088]
	mov	w0, 0
	strb	wzr, [x1, 1]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1088:
	add	x1, x21, 2520
	ldrb	w0, [x1, 2]
	sub	w0, w0, #2
	and	w0, w0, -3
	uxtb	w0, w0
	cbz	w0, .L1058
	add	x1, x1, 20480
	ldr	w2, [x1, 3704]
	cmp	w2, 1
	bls	.L1073
	ldr	w1, [x1, 3708]
.L1059:
	add	x0, x21, 2520
	add	x23, x21, 2520
	add	x0, x0, 20480
	cmp	w2, 1
	add	x2, x23, 36864
	cset	w24, hi
	cmn	w1, #1
	str	w1, [x0, 3720]
	ldr	w0, [x2, 1680]
	add	w0, w0, 1
	str	w0, [x2, 1680]
	bne	.L1092
	.p2align 2
.L1061:
	mov	w0, 1
.L1053:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1085:
	ldr	x3, .LC152
	mov	w2, 513
	ldr	x1, .LC153
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1058:
	add	x0, x1, 20480
	ldr	w1, [x0, 3716]
	str	w1, [x0, 3720]
	cbz	x25, .L1074
	ldr	x2, [x23, 584]
	mov	w24, 0
	ldr	x3, [x25, 584]
	cmp	x3, x2
	bge	.L1060
	str	x3, [x23, 584]
	str	x2, [x25, 584]
	ldr	w1, [x0, 3720]
	b	.L1060
	.p2align 3
.L1090:
	ldr	x0, [x23, 24104]
	strb	w24, [x0, 1]
	strb	w24, [x23, 1]
	b	.L1066
	.p2align 3
.L1064:
	ldr	x1, .LC161
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x20, 904]
	ldr	x1, [x22, 544]
	bl	FreeUsdByDec
	str	xzr, [x22, 544]
	ldr	x1, [x22, 552]
	ldr	w0, [x20, 904]
	bl	FreeUsdByDec
	str	xzr, [x22, 552]
	add	x0, x23, 20480
	mov	w2, 0
	ldr	w1, [x0, 3720]
	ldr	w0, [x20, 904]
	bl	FSP_SetDisplay
	cbnz	w24, .L1093
	ldr	x1, [x23, 24088]
	mov	w0, 1
	strb	wzr, [x1, 1]
	b	.L1053
	.p2align 3
.L1087:
	ldrb	w0, [x21, 2529]
	cmp	w0, 1
	bne	.L1061
	b	.L1056
	.p2align 3
.L1072:
	mov	w22, 0
	b	.L1055
	.p2align 3
.L1067:
	add	x21, x21, 2520
	ldrsb	w1, [x21, 1]
	cmp	w1, 3
	beq	.L1094
	cmp	w1, 1
	beq	.L1095
	cmp	w1, 2
	bne	.L1061
	ldr	x1, [x21, 24088]
	strb	wzr, [x1, 1]
	strb	wzr, [x21, 1]
	b	.L1053
	.p2align 3
.L1091:
	ldr	x1, [x21, 24104]
	mov	w0, 0
	strb	wzr, [x1, 1]
	b	.L1053
	.p2align 3
.L1073:
	mov	w1, -1
	b	.L1059
	.p2align 3
.L1095:
	ldr	x2, [x21, 24104]
	mov	w0, w1
	strb	wzr, [x2, 1]
	strb	wzr, [x21, 1]
	b	.L1053
	.p2align 3
.L1094:
	ldr	x0, [x21, 24096]
	strb	wzr, [x0, 1]
	strb	wzr, [x21, 1]
	b	.L1061
	.p2align 3
.L1086:
	ldr	x1, .LC155
	mov	x4, x0
	mov	x3, x25
	mov	x2, 0
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1053
	.p2align 3
.L1074:
	mov	w24, 0
	b	.L1060
	.p2align 3
.L1089:
	ldr	x1, .LC157
	mov	w2, 595
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1053
	.p2align 3
.L1093:
	ldr	x1, [x23, 24104]
	mov	w0, w24
	strb	wzr, [x1, 1]
	b	.L1053
	.size	VC1DEC_VDMPostProc, .-VC1DEC_VDMPostProc
	.align	3
.LC152:
	.xword	.LC35
	.align	3
.LC153:
	.xword	.LC37
	.align	3
.LC155:
	.xword	.LC154
	.align	3
.LC157:
	.xword	.LC156
	.align	3
.LC159:
	.xword	.LC158
	.align	3
.LC161:
	.xword	.LC160
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
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L1161
	add	x19, x20, 12288
	add	x3, x19, 2520
	ldrb	w0, [x19, 2520]
	tbz	x0, 4, .L1158
	mov	w2, -21
	add	x1, x3, 36864
	and	w0, w0, w2
	strb	w0, [x19, 2520]
	ldr	w0, [x1, 1812]
	sub	w0, w0, #2
	cmp	w0, 1
	ldr	x0, [x20]
	bls	.L1100
	add	x3, x3, 20480
	ldr	w2, [x0, 8]
	ldr	w3, [x3, 3704]
.L1101:
	add	x0, x19, 2520
	sub	w1, w2, #1
	add	x0, x0, 36864
	cmp	w1, 3
	str	w2, [x0, 1812]
	bls	.L1162
.L1130:
	mov	w4, 1
	.p2align 2
.L1107:
	cbz	w3, .L1120
.L1119:
	cmp	w3, 1
	bls	.L1163
.L1123:
	cbz	w4, .L1122
	add	x19, x19, 2520
	add	x20, x20, 16384
	ldrsb	w0, [x19, 3104]
	cbnz	w0, .L1125
	add	x1, x20, 1608
	add	x19, x19, 8192
	add	x0, x19, 2048
	add	x20, x20, 1856
	add	x19, x19, 2456
	ldp	x2, x3, [x1]
	stp	x2, x3, [x0, 160]
	mov	w0, 1
	ldp	x2, x3, [x20]
	stp	x2, x3, [x19]
	ldp	x2, x3, [x20, 16]
	stp	x2, x3, [x19, 16]
	ldp	x2, x3, [x20, 32]
	stp	x2, x3, [x19, 32]
	ldp	x2, x3, [x20, 48]
	stp	x2, x3, [x19, 48]
	ldp	x2, x3, [x20, 64]
	stp	x2, x3, [x19, 64]
	ldp	x2, x3, [x20, 80]
	stp	x2, x3, [x19, 80]
	ldp	x2, x3, [x20, 96]
	stp	x2, x3, [x19, 96]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1157:
	ldr	x0, [x20]
	ldr	w1, [x0, 8]
	add	x0, x19, 2520
	add	x0, x0, 36864
	sub	w2, w1, #1
	cmp	w2, 3
	str	w1, [x0, 1812]
	bls	.L1164
	mov	w4, 1
	.p2align 2
.L1120:
	ldrb	w0, [x19, 2522]
	sub	w2, w0, #1
	sub	w1, w0, #4
	uxtb	w2, w2
	uxtb	w1, w1
	cmp	w2, 1
	ccmp	w1, 1, 0, hi
	bls	.L1126
.L1121:
	sub	w0, w0, #2
	and	w0, w0, -3
	uxtb	w0, w0
	cbnz	w0, .L1123
	ldr	x1, .LC170
	mov	w0, 1
	bl	dprint_vfmw
	.p2align 2
.L1122:
	add	x20, x20, 53248
	add	x0, x19, 2520
	ldr	w1, [x20, 904]
	bl	VC1_ClearCurPic
	ldr	x0, .LC172
	ldr	x4, [x0]
	cbz	x4, .L1158
	ldr	w0, [x20, 904]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L1158:
	mov	w0, 0
.L1154:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1162:
	ldr	x0, .LC166
	ldrb	w0, [x0,w1,uxtw]
	adr	x1, .Lrtx1109
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1109:
	.section	.rodata
	.align	0
	.align	2
.L1109:
	.byte	(.L1108 - .Lrtx1109) / 4
	.byte	(.L1110 - .Lrtx1109) / 4
	.byte	(.L1111 - .Lrtx1109) / 4
	.byte	(.L1112 - .Lrtx1109) / 4
	.text
	.p2align 3
.L1100:
	ldr	w2, [x0, 8]
	cmp	w2, 1
	ccmp	w2, 4, 4, hi
	beq	.L1102
	add	x3, x3, 20480
	ldr	w3, [x3, 3704]
	b	.L1101
	.p2align 3
.L1111:
	mov	w4, 0
	b	.L1107
	.p2align 3
.L1110:
	add	x1, x19, 2520
	ldrb	w0, [x1, 2]
	cbz	w0, .L1130
	cmp	w0, 1
	mov	w4, 0
	bne	.L1107
	ldr	w0, [x1, 8]
	and	w0, w0, -16776961
	cmp	w0, 1
	bne	.L1155
	mov	w4, w0
.L1155:
	cbnz	w3, .L1119
	.p2align 2
.L1126:
	ldr	x1, .LC168
	mov	w0, 1
	bl	dprint_vfmw
	b	.L1122
	.p2align 3
.L1108:
	ldrb	w0, [x19, 2522]
	sub	w0, w0, #2
	and	w0, w0, -3
	uxtb	w0, w0
	cmp	w0, wzr
	cset	w4, ne
	b	.L1107
	.p2align 3
.L1112:
	add	x0, x19, 2520
	ldrb	w1, [x0, 2]
	cbnz	w1, .L1116
	add	x0, x0, 36864
	mov	w4, 1
	str	wzr, [x0, 1744]
	b	.L1107
	.p2align 3
.L1125:
	add	x21, x19, 8192
	add	x1, x20, 1624
	mov	x2, 172
	add	x0, x21, 2224
	bl	memcpy
	add	x4, x20, 1796
	add	x3, x21, 2396
	mov	x2, 176
	ldp	x0, x1, [x4]
	stp	x0, x1, [x3]
	add	x1, x20, 1968
	add	x0, x21, 2568
	ldp	x6, x7, [x4, 16]
	stp	x6, x7, [x3, 16]
	ldp	x6, x7, [x4, 32]
	stp	x6, x7, [x3, 32]
	ldr	x5, [x4, 48]
	str	x5, [x3, 48]
	ldr	w4, [x20, 1852]
	str	w4, [x19, 10644]
	bl	memcpy
	ldr	w0, [x20, 2012]
	add	x3, x19, 20480
	strb	w0, [x19, 4]
	add	x1, x20, 2144
	ldr	x2, .LC171
	add	x0, x21, 2744
	ldr	w3, [x3, 3724]
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
.L1116:
	cmp	w1, 2
	bne	.L1118
	add	x0, x0, 36864
	ldr	w0, [x0, 1744]
	cbnz	w0, .L1130
	mov	w4, 0
	cbnz	w3, .L1119
	b	.L1126
	.p2align 3
.L1118:
	and	w1, w1, -5
	uxtb	w1, w1
	cmp	w1, 1
	bne	.L1130
	add	x0, x0, 36864
	mov	w4, w1
	str	w1, [x0, 1744]
	cbnz	w3, .L1119
	b	.L1126
	.p2align 3
.L1102:
	ldr	x1, .LC165
	add	x21, x3, 20480
	mov	w0, 2
	add	x23, x20, 53248
	bl	dprint_vfmw
	ldr	w1, [x21, 3712]
	ldr	w0, [x23, 904]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L1103
	ldr	w0, [x23, 904]
	ldr	x1, [x22, 544]
	bl	FreeUsdByDec
	ldr	w0, [x23, 904]
	ldr	x1, [x22, 552]
	bl	FreeUsdByDec
	ldr	w0, [x23, 904]
	ldr	x1, [x22, 560]
	bl	FreeUsdByDec
	ldr	w0, [x23, 904]
	ldr	x1, [x22, 568]
	bl	FreeUsdByDec
	add	x0, x22, 512
	mov	w2, 1
	stp	xzr, xzr, [x0, 32]
	stp	xzr, xzr, [x0, 48]
	ldr	w1, [x21, 3712]
	ldr	w0, [x23, 904]
	bl	FSP_ClearLogicFs
	ldr	w1, [x21, 3708]
	mov	w2, 1
	ldr	w0, [x23, 904]
	bl	FSP_ClearLogicFs
	str	wzr, [x21, 3708]
	str	wzr, [x21, 3712]
	ldr	w0, [x23, 904]
	bl	FSP_GetNullLogicFs
	str	w0, [x21, 3708]
	str	w0, [x21, 3712]
.L1103:
	add	x0, x19, 2520
	add	x1, x0, 20480
	str	wzr, [x1, 3704]
	ldr	x2, [x0, 24096]
	cbz	x2, .L1157
	ldr	x3, [x0, 24104]
	cbz	x3, .L1157
	strb	wzr, [x2, 1]
	ldr	x2, [x0, 24104]
	strb	wzr, [x2, 1]
	ldr	x2, [x0, 24096]
	strb	wzr, [x2]
	ldr	x0, [x0, 24104]
	strb	wzr, [x0]
	ldr	x0, [x20]
	ldr	w3, [x1, 3704]
	ldr	w2, [x0, 8]
	b	.L1101
.L1164:
	ldr	x0, .LC173
	mov	w3, 0
	ldrh	w0, [x0,w2,uxtw #1]
	adr	x1, .Lrtx1129
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx1129:
	.section	.rodata
	.align	0
	.align	2
.L1129:
	.2byte	(.L1108 - .Lrtx1129) / 4
	.2byte	(.L1110 - .Lrtx1129) / 4
	.2byte	(.L1111 - .Lrtx1129) / 4
	.2byte	(.L1112 - .Lrtx1129) / 4
	.text
.L1161:
	ldr	x3, .LC162
	mov	w2, 2270
	ldr	x1, .LC163
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1154
.L1163:
	ldrb	w0, [x19, 2522]
	b	.L1121
	.size	VC1_Vfmw_DecodeArbiter, .-VC1_Vfmw_DecodeArbiter
	.align	3
.LC162:
	.xword	.LC86
	.align	3
.LC163:
	.xword	.LC37
	.align	3
.LC165:
	.xword	.LC164
	.align	3
.LC166:
	.xword	.L1109
	.align	3
.LC168:
	.xword	.LC167
	.align	3
.LC170:
	.xword	.LC169
	.align	3
.LC171:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC172:
	.xword	g_event_report
	.align	3
.LC173:
	.xword	.L1129
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
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1184
	ldr	x0, [x19]
	add	x20, x19, 16
	add	x23, x19, 12288
	add	x22, x23, 2520
	ldr	w1, [x0, 640]
	str	w1, [x20, 14600]
	ldr	w0, [x0, 692]
	str	w0, [x20, 14604]
	ldrsb	w0, [x22, 3104]
	cmp	w0, 1
	beq	.L1168
	mov	x0, x22
	bl	VC1_Vfmw_UpdataLastPicRNDCTRL
.L1168:
	mov	x1, x20
	mov	x0, x19
	add	x21, x23, 2520
	bl	VC1_WritePicMsg
	add	x2, x21, 20480
	ldr	x3, .LC176
	add	x1, x2, 3728
	add	x0, x19, 104
	ldr	w2, [x2, 3724]
	strb	w2, [x20, 74]
	uxtw	x2, w2
	ldr	x4, [x3, 104]
	lsl	x3, x2, 3
	sub	x2, x3, x2
	lsl	x2, x2, 3
	blr	x4
	mov	x0, x22
	mov	x1, x20
	bl	VC1_CfgVDH
	ldrb	w0, [x23, 2522]
	cmp	w0, 1
	bls	.L1185
.L1169:
	cmp	w0, 5
	beq	.L1186
	strb	wzr, [x20, 1]
	add	x21, x23, 2520
	ldrsb	w2, [x23, 2524]
	ldrb	w1, [x23, 2528]
	strb	w2, [x19, 16]
	strb	w2, [x21, 3]
	strb	w1, [x21, 9]
	strb	w0, [x21, 11]
	ldrb	w1, [x20, 3]
	cmp	w1, 2
	beq	.L1187
.L1172:
	and	w0, w1, -5
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L1173
	add	x21, x21, 36864
	str	w0, [x21, 1744]
.L1173:
	ldr	x2, [x19]
	str	x20, [x19, 8]
	ldr	w0, [x2, 984]
	cmp	w0, 1
	beq	.L1188
	cmp	w0, 2
	beq	.L1189
.L1176:
	mov	w0, 1
.L1167:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1189:
	ldr	w0, [x2, 988]
	cmp	w0, wzr
	ccmp	x20, xzr, 4, gt
	beq	.L1176
	sub	w1, w1, #2
	mov	w0, 1
	and	w1, w1, -3
	uxtb	w1, w1
	cbnz	w1, .L1167
	ldr	x1, [x23, 26608]
	add	x3, x19, 53248
	mov	x0, x22
	strb	wzr, [x1, 1]
	ldr	x2, [x19]
	ldr	w1, [x2, 988]
	sub	w1, w1, #1
	str	w1, [x2, 988]
	ldr	w1, [x3, 904]
	bl	VC1_ClearCurPic
	str	xzr, [x19, 8]
	mov	w0, 0
	b	.L1167
	.p2align 3
.L1186:
	mov	w4, 1
	strb	w4, [x20, 1]
	add	x3, x23, 2520
	strb	w4, [x23, 2528]
	ldrsb	w2, [x23, 2525]
	add	x5, x3, 36864
	strb	w2, [x23, 2524]
	add	x21, x23, 2520
	mov	w1, 1
	ldr	w3, [x5, 1768]
	sub	w3, w3, #1
	str	w3, [x20, 14504]
	strb	w2, [x19, 16]
	strb	w2, [x21, 3]
	strb	w1, [x21, 9]
	strb	w0, [x21, 11]
	ldrb	w1, [x20, 3]
	cmp	w1, 2
	bne	.L1172
.L1187:
	add	x24, x21, 36864
	ldr	w0, [x24, 1744]
	cbnz	w0, .L1173
	add	x1, x19, 53248
	mov	x0, x22
	ldr	w1, [x1, 904]
	bl	VC1_ClearCurPic
	ldr	x1, [x21, 24088]
	mov	w0, 0
	strb	wzr, [x1]
	ldr	w1, [x24, 1748]
	add	w1, w1, 1
	str	w1, [x24, 1748]
	str	xzr, [x19, 8]
	b	.L1167
	.p2align 3
.L1185:
	ldrb	w1, [x23, 2524]
	strb	w1, [x23, 2525]
	b	.L1169
	.p2align 3
.L1188:
	cbz	x20, .L1167
	sub	w1, w1, #2
	and	w1, w1, -3
	uxtb	w1, w1
	cbnz	w1, .L1167
	ldr	x2, [x23, 26608]
	add	x1, x19, 53248
	mov	x0, x22
	strb	wzr, [x2, 1]
	ldr	w1, [x1, 904]
	bl	VC1_ClearCurPic
	str	xzr, [x19, 8]
	mov	w0, 0
	b	.L1167
.L1184:
	ldr	x3, .LC174
	mov	w2, 2423
	ldr	x1, .LC175
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1167
	.size	VC1_Vfmw_StartDecode, .-VC1_Vfmw_StartDecode
	.align	3
.LC174:
	.xword	.LC86
	.align	3
.LC175:
	.xword	.LC37
	.align	3
.LC176:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvHdr
	.type	VC1_Vfmw_ParseAdvHdr, %function
VC1_Vfmw_ParseAdvHdr:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	mov	w24, w2
	mov	x25, x1
	bl	_mcount
	add	x22, x19, 36864
	ldr	x21, [x19, 3136]
	mov	w1, 32
	strb	wzr, [x19, 6]
	add	x23, x22, 1688
	mov	x0, x21
	strh	wzr, [x29, 108]
	str	wzr, [x29, 104]
	bl	BsGet
	ldr	w20, [x21, 32]
	uxtb	w27, w0
	ldr	x26, [x22, 1688]
	ldr	w0, [x23, 28]
	lsr	w1, w20, 3
	add	x26, x26, x1
	sub	w20, w0, w1
	mov	x0, x21
	mov	w2, w20
	mov	x1, x26
	bl	BsInit
	sub	w0, w27, #10
	cmp	w0, 5
	bhi	.L1191
	cmp	w27, 11
	beq	.L1277
	ldrb	w1, [x19]
	and	w2, w1, 7
	cmp	w2, 7
	beq	.L1278
	add	x27, x19, 20480
	strb	wzr, [x19, 8]
	ldr	x2, .LC184
	str	wzr, [x27, 3724]
	ldrh	w0, [x2,w0,uxtw #1]
	adr	x2, .Lrtx1207
	add	x0, x2, w0, sxth #2
	br	x0
.Lrtx1207:
	.section	.rodata
	.align	0
	.align	2
.L1207:
	.2byte	(.L1206 - .Lrtx1207) / 4
	.2byte	(.L1228 - .Lrtx1207) / 4
	.2byte	(.L1208 - .Lrtx1207) / 4
	.2byte	(.L1229 - .Lrtx1207) / 4
	.2byte	(.L1210 - .Lrtx1207) / 4
	.2byte	(.L1211 - .Lrtx1207) / 4
	.text
	.p2align 3
.L1191:
	sub	w0, w27, #27
	cmp	w0, 4
	bhi	.L1222
	cmp	w27, 28
	ccmp	w20, 5, 4, gt
	ble	.L1224
	cbz	w20, .L1224
	mov	x0, 0
	.p2align 2
.L1227:
	cmp	w0, 5
	bls	.L1279
.L1226:
	add	x0, x0, 1
	cmp	w20, w0
	bhi	.L1227
	mov	w0, 21572
	ldr	w1, [x29, 104]
	movk	w0, 0x3147, lsl 16
	cmp	w1, w0
	bne	.L1224
	ldrb	w1, [x29, 108]
	ldrb	w0, [x22, 1828]
	cmp	w1, 65
	cset	w1, eq
	bfi	w0, w1, 0, 1
	strb	w0, [x22, 1828]
	tbz	x0, 0, .L1224
	ldrb	w1, [x29, 109]
	bfi	w0, w1, 1, 4
	strb	w0, [x22, 1828]
.L1224:
	mov	x1, x23
	mov	w0, w24
	bl	VC1_ClearCurPacket
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1222:
	cmp	w27, 254
	beq	.L1280
.L1228:
	mov	w0, w24
	mov	x1, x23
	bl	VC1_ClearCurPacket
	mov	w0, 0
.L1196:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1277:
	ldrb	w0, [x19]
	and	w0, w0, 7
	cmp	w0, 7
	bne	.L1228
	mov	x2, x25
	mov	x1, x19
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvSlcHdr
	cmp	w0, 1
	mov	w20, w0
	bne	.L1194
	add	x27, x19, 20480
	ldr	w0, [x27, 3724]
	cmp	w0, 255
	bls	.L1195
	mov	w1, w24
	mov	x0, x19
	bl	VC1_ClearCurPic
	ldr	x1, .LC178
	mov	w0, w20
	ldr	w2, [x27, 3724]
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1196
	.p2align 3
.L1280:
	mov	w1, 32
	mov	x0, x21
	bl	BsGet
	mov	w20, w0
	mov	w1, 32
	mov	x0, x21
	bl	BsGet
	mov	w2, 20553
	mov	w1, 20036
	movk	w2, 0x4853, lsl 16
	movk	w1, 0x4345, lsl 16
	cmp	w20, w2
	ccmp	w0, w1, 0, eq
	bne	.L1228
	add	x1, x19, 20480
	mov	w0, 1
	strb	w0, [x19, 7]
	mov	w0, 1
	ldr	w1, [x1, 3724]
	cbz	w1, .L1196
	ldrb	w1, [x19]
	strb	w0, [x19, 6]
	orr	w1, w1, 16
	strb	w1, [x19]
	b	.L1196
	.p2align 3
.L1229:
	ldr	x20, .LC185
.L1266:
	ldr	x3, [x20, 96]
	mov	x2, 176
	mov	w1, 0
	add	x0, x25, 360
	ldrb	w28, [x25, 391]
	blr	x3
	strb	w28, [x25, 391]
.L1212:
	ldr	x3, [x20, 96]
	add	x28, x27, 3728
	mov	x2, 14336
	mov	w1, 0
	mov	x0, x28
	blr	x3
	mov	x0, x21
	bl	BsPos
	str	w0, [x25, 500]
	mov	x2, x25
	mov	x1, x19
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvPicHdr
	cmp	w0, 1
	mov	w20, w0
	beq	.L1281
	mov	x1, x23
	mov	w0, w24
	bl	VC1_ClearCurPacket
	ldr	x1, .LC187
	mov	w2, 5725
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w20
	b	.L1196
	.p2align 3
.L1278:
	mov	w0, 1
	orr	w1, w1, 16
	strb	w0, [x19, 6]
	mov	w0, 1
	strb	w1, [x19]
	b	.L1196
	.p2align 3
.L1210:
	mov	x2, x25
	mov	x1, x19
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvEntptHdr
	cmp	w0, 1
	mov	w20, w0
	beq	.L1282
.L1221:
	mov	w0, w24
	mov	x1, x23
	bl	VC1_ClearCurPacket
	mov	w0, w20
	b	.L1196
	.p2align 3
.L1211:
	mov	x2, x25
	mov	x1, x19
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvSeqHdr
	cmp	w0, 1
	mov	w20, w0
	bne	.L1221
	ldrb	w0, [x19]
	orr	w0, w0, 1
	strb	w0, [x19]
	b	.L1221
	.p2align 3
.L1206:
	orr	w0, w1, 32
	mov	x1, x23
	strb	w0, [x19]
	mov	w0, w24
	bl	VC1_ClearCurPacket
	mov	w0, 1
	b	.L1196
	.p2align 3
.L1208:
	ldr	x20, .LC185
	mov	w0, 1
	strb	w0, [x19, 8]
	mov	x2, 16
	mov	w1, 0
	add	x0, x25, 520
	ldr	x3, [x20, 96]
	blr	x3
	ldrb	w0, [x19, 8]
	cbnz	w0, .L1212
	b	.L1266
	.p2align 3
.L1194:
	mov	x1, x23
	mov	w0, w24
	bl	VC1_ClearCurPacket
	ldr	x1, .LC183
	mov	w2, 5640
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w20
	b	.L1196
	.p2align 3
.L1281:
	mov	x0, x21
	add	x22, x22, 1688
	bl	BsPos
	ldr	w1, [x25, 500]
	sub	w0, w0, w1
	str	w0, [x25, 500]
	mov	x0, x21
	ldrb	w1, [x19]
	orr	w1, w1, 4
	strb	w1, [x19]
	bl	BsPos
	add	w0, w0, 32
	ldr	w1, [x22, 28]
	cmp	w0, w1, lsl 3
	bge	.L1214
	ldr	w3, [x27, 3724]
	add	x21, x25, 536
	ldr	x2, [x19, 3136]
	uxtw	x0, w3
	lsl	x1, x0, 3
	sub	x1, x1, x0
	lsl	x1, x1, 3
	add	x20, x28, x1
	strb	w3, [x20, 16]
	lsl	x3, x0, 2
	sub	x0, x3, x0
	add	x21, x21, x0, lsl 2
	ldr	w0, [x2, 32]
	ubfx	x0, x0, 3, 29
	add	x0, x26, x0
	str	x0, [x28, x1]
	ldr	w1, [x2, 32]
	and	w1, w1, 7
	str	w1, [x20, 24]
	ldr	w1, [x2, 24]
	ldr	w2, [x2, 32]
	lsl	w1, w1, 3
	sub	w1, w1, w2
	str	w1, [x20, 28]
	bl	MEM_Vir2Phy
	str	w0, [x20, 20]
	ldr	w0, [x22, 36]
	str	w0, [x20, 48]
	ldr	x1, [x22, 8]
	cbz	x1, .L1215
	ldr	w0, [x22, 24]
	cbz	w0, .L1215
	str	x1, [x20, 8]
	str	wzr, [x20, 40]
	ldr	w0, [x22, 32]
	lsl	w0, w0, 3
	str	w0, [x20, 44]
	ldr	w0, [x22, 24]
	str	w0, [x20, 36]
	ldr	w0, [x22, 40]
	str	w0, [x20, 52]
.L1216:
	ldr	w4, [x27, 3640]
	ldr	w0, [x27, 3644]
	ldrb	w2, [x19, 8]
	mul	w4, w0, w4
	sub	w4, w4, #1
	cbz	w2, .L1217
	add	w0, w0, 1
	ldr	w3, [x21, 4]
	add	w0, w0, w0, lsr 31
	sub	w3, w3, w0, asr 1
	str	w3, [x20, 32]
	cmp	w3, wzr
	ccmp	w4, w3, 2, gt
	bcc	.L1283
.L1200:
	ldr	w0, [x20, 28]
	cmp	w0, wzr
	ble	.L1203
	cbz	x1, .L1219
	ldr	w0, [x20, 44]
	cmp	w0, wzr
	ble	.L1203
.L1219:
	ldr	w1, [x27, 3724]
	mov	w0, 1
	add	w1, w1, w0
	str	w1, [x27, 3724]
	b	.L1196
	.p2align 3
.L1215:
	mov	x1, 0
	str	xzr, [x20, 8]
	stp	wzr, wzr, [x20, 36]
	str	wzr, [x20, 44]
	str	wzr, [x20, 52]
	b	.L1216
	.p2align 3
.L1214:
	mov	x1, x23
	mov	w0, w24
	bl	VC1_ClearCurPacket
	ldr	x1, .LC187
	mov	w2, 5719
	mov	w0, w20
	bl	dprint_vfmw
	mov	w0, w20
	b	.L1196
	.p2align 3
.L1217:
	ldr	w3, [x21, 4]
	str	w3, [x20, 32]
	cmp	w4, w3
	bcs	.L1200
	ldr	x1, .LC180
	mov	w0, 1
	ldr	w2, [x21, 4]
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1196
	.p2align 3
.L1195:
	uxtw	x4, w0
	add	x3, x27, 3728
	lsl	x1, x4, 3
	ldr	x2, [x19, 3136]
	sub	x1, x1, x4
	add	x21, x25, 536
	lsl	x1, x1, 3
	add	x20, x3, x1
	strb	w0, [x20, 16]
	lsl	x0, x4, 2
	sub	x4, x0, x4
	ldr	w0, [x2, 32]
	add	x21, x21, x4, lsl 2
	ubfx	x0, x0, 3, 29
	add	x0, x26, x0
	str	x0, [x3, x1]
	ldr	w1, [x2, 32]
	and	w1, w1, 7
	str	w1, [x20, 24]
	ldr	w1, [x2, 24]
	ldr	w2, [x2, 32]
	lsl	w1, w1, 3
	sub	w1, w1, w2
	str	w1, [x20, 28]
	bl	MEM_Vir2Phy
	str	w0, [x20, 20]
	ldr	w0, [x23, 36]
	str	w0, [x20, 48]
	ldr	x1, [x23, 8]
	cbz	x1, .L1215
	ldr	w0, [x23, 24]
	cbz	w0, .L1215
	str	x1, [x20, 8]
	str	wzr, [x20, 40]
	ldr	w0, [x23, 32]
	lsl	w0, w0, 3
	str	w0, [x20, 44]
	ldr	w0, [x23, 24]
	str	w0, [x20, 36]
	ldr	w0, [x23, 40]
	str	w0, [x20, 52]
	b	.L1216
.L1282:
	mov	x1, x25
	mov	x0, x19
	bl	VC1_Vfmw_UpdateAdvSPS
	ldrb	w0, [x19]
	orr	w0, w0, 2
	strb	w0, [x19]
	b	.L1221
.L1203:
	ldr	x1, .LC181
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1196
.L1283:
	ldr	x1, .LC179
	mov	w0, 1
	ldr	w2, [x21, 4]
	ldr	w4, [x27, 3644]
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1196
.L1279:
	add	x1, x29, 104
	ldrb	w2, [x26, x0]
	strb	w2, [x0, x1]
	b	.L1226
	.size	VC1_Vfmw_ParseAdvHdr, .-VC1_Vfmw_ParseAdvHdr
	.align	3
.LC178:
	.xword	.LC177
	.align	3
.LC179:
	.xword	.LC118
	.align	3
.LC180:
	.xword	.LC120
	.align	3
.LC181:
	.xword	.LC122
	.align	3
.LC183:
	.xword	.LC182
	.align	3
.LC184:
	.xword	.L1207
	.align	3
.LC185:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC187:
	.xword	.LC186
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
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L1290
	cmp	w21, 32
	bhi	.L1291
	ldrsb	w0, [x19, 3104]
	cbz	w0, .L1292
	mov	w2, w21
	mov	x1, x20
	mov	x0, x19
	bl	VC1_Vfmw_ParseAdvHdr
.L1286:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1292:
	ldrb	w3, [x19]
	mov	x2, x20
	ldr	x0, [x19, 3136]
	mov	x1, x19
	orr	w3, w3, 3
	strb	w3, [x19]
	bl	VC1_Vfmw_ParseSMPPicHdr
	cmp	w0, 1
	bne	.L1286
	ldrb	w2, [x19]
	mov	w1, 20
	orr	w1, w2, w1
	strb	w1, [x19]
	b	.L1286
	.p2align 3
.L1290:
	ldr	x1, .LC189
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1291:
	ldr	x1, .LC190
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	VC1_Vfmw_ParseHeader, .-VC1_Vfmw_ParseHeader
	.align	3
.LC189:
	.xword	.LC188
	.align	3
.LC190:
	.xword	.LC150
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
	add	x2, x19, 2520
	add	x0, x2, 3144
	str	x0, [x19, 5656]
	ldrb	w1, [x2, 3106]
	cmp	w1, 8
	beq	.L1298
	strb	wzr, [x2, 13]
	strb	w1, [x2, 12]
.L1295:
	add	x20, x19, 2520
	ldr	w2, [x21, 28]
	ldrsb	w1, [x20, 3104]
	cbz	w1, .L1299
	ldr	x1, [x21]
	bl	BsInit
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1299:
	ldr	x1, [x21]
	bl	BsInit
	ldr	w1, [x19, 5632]
	add	x2, x20, 20480
	add	x3, x20, 3120
	add	x20, x20, 3184
	adds	w4, w1, 15
	add	w0, w1, 30
	csel	w0, w0, w4, mi
	asr	w0, w0, 4
	str	w0, [x2, 3640]
	ldr	w0, [x19, 5636]
	str	w0, [x2, 3660]
	str	w1, [x2, 3656]
	add	w1, w0, 30
	adds	w0, w0, 15
	csel	w0, w1, w0, mi
	asr	w0, w0, 4
	str	w0, [x2, 3644]
	ldp	x0, x1, [x3]
	stp	x0, x1, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1298:
	mov	w3, 1
	mov	w1, 6
	strb	w3, [x2, 13]
	strb	w1, [x2, 12]
	b	.L1295
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
	add	x0, x20, 53248
	add	x1, x0, 112
	cbz	x19, .L1308
	ldr	w2, [x19, 16]
	str	w2, [x1, 20]
	ldr	x2, [x19]
	str	x2, [x0, 112]
	ldr	w2, [x19, 20]
	str	w2, [x1, 28]
	ldrb	w2, [x19, 10]
	strb	w2, [x1, 16]
	ldr	w2, [x19, 24]
	str	w2, [x1, 36]
	ldrb	w2, [x19, 10]
	cmp	w2, 1
	beq	.L1303
	ldr	w2, [x19, 104]
	str	w2, [x1, 24]
	ldr	x2, [x19, 88]
	str	x2, [x1, 8]
	ldr	w2, [x19, 108]
	str	w2, [x1, 32]
	ldrb	w2, [x19, 98]
	strb	w2, [x1, 17]
	ldr	w2, [x19, 112]
	str	w2, [x1, 40]
	ldrb	w2, [x19, 98]
	cmp	w2, 1
	bne	.L1309
.L1304:
	mov	x0, x20
	bl	VC1_SetCodeInfo
	mov	w0, 1
.L1302:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1309:
	ldr	w0, [x0, 904]
	bl	VC1_ClearCurPacket
	ldrb	w2, [x19, 98]
	mov	w0, 1
	ldr	x1, .LC194
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1303:
	strb	wzr, [x1, 17]
	str	xzr, [x1, 8]
	str	wzr, [x1, 24]
	str	wzr, [x1, 32]
	str	wzr, [x1, 40]
	b	.L1304
	.p2align 3
.L1308:
	ldr	x1, .LC192
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1302
	.size	VC1_ReceivePacket, .-VC1_ReceivePacket
	.align	3
.LC192:
	.xword	.LC191
	.align	3
.LC194:
	.xword	.LC193
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
	mov	x21, x1
	mov	x0, x30
	bl	_mcount
	cbz	x21, .L1338
	cbz	x19, .L1339
	ldr	x3, .LC199
	add	x20, x19, 12288
	add	x22, x20, 2344
	mov	x1, x21
	mov	x2, 176
	mov	x0, x22
	ldr	x3, [x3, 104]
	blr	x3
	mov	x1, x22
	mov	x0, x19
	bl	VC1_ReceivePacket
	mov	w21, w0
	cbz	w0, .L1340
	ldr	x0, [x19]
	add	x22, x19, 53248
	ldr	w1, [x0, 936]
	cmp	w1, 1
	beq	.L1341
.L1315:
	ldrb	w0, [x20, 2520]
	strb	w0, [x22, 240]
.L1316:
	add	x20, x20, 2520
	add	x1, x19, 16384
	ldr	w2, [x22, 904]
	add	x1, x1, 1608
	mov	x0, x20
	bl	VC1_Vfmw_ParseHeader
	mov	w23, w0
	cbnz	w0, .L1317
	ldr	w0, [x22, 904]
	add	x1, x22, 112
	bl	VC1_ClearCurPacket
	ldr	x0, .LC202
	ldr	x4, [x0]
	cbz	x4, .L1319
	ldr	w0, [x22, 904]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	mov	w21, 0
	blr	x4
.L1312:
	mov	w0, w21
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1317:
	mov	x0, x19
	bl	VC1_Vfmw_DecodeArbiter
	cbnz	w0, .L1342
.L1319:
	mov	w21, 0
.L1345:
	mov	w0, w21
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1341:
	ldr	w0, [x0, 992]
	cmp	w0, 1
	bne	.L1315
	ldrb	w0, [x22, 240]
	strb	w0, [x20, 2520]
	b	.L1316
	.p2align 3
.L1342:
	mov	x0, x19
	bl	VC1_Vfmw_PrepareDecode
	mov	w21, w0
	cbnz	w0, .L1320
	ldr	x0, [x19]
	ldr	w1, [x0, 936]
	cmp	w1, 1
	beq	.L1343
.L1321:
	ldr	w1, [x22, 904]
	mov	x0, x20
	bl	VC1_ClearCurPic
.L1322:
	ldr	x0, .LC202
	ldr	x4, [x0]
	cbz	x4, .L1319
.L1336:
	ldr	w0, [x22, 904]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	b	.L1312
	.p2align 3
.L1340:
	add	x19, x19, 53248
	ldr	x1, .LC201
	ldr	w2, [x19, 104]
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1339:
	ldr	x1, .LC198
	mov	w0, 0
	mov	w21, 0
	bl	dprint_vfmw
	b	.L1312
	.p2align 3
.L1343:
	ldr	w0, [x0, 992]
	cmp	w0, 1
	bne	.L1321
	b	.L1322
	.p2align 3
.L1338:
	ldr	x1, .LC196
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1312
	.p2align 3
.L1320:
	mov	x0, x19
	bl	VC1_Vfmw_StartDecode
	mov	w21, w0
	cbz	w0, .L1344
	mov	w21, w23
	b	.L1312
	.p2align 3
.L1344:
	add	x19, x19, 36864
	ldr	w0, [x22, 904]
	mov	w2, 1
	ldr	w1, [x19, 2140]
	bl	FSP_ClearLogicFs
	ldr	x1, [x19, 2032]
	ldr	x0, .LC202
	strb	wzr, [x1]
	ldr	x1, [x19, 2032]
	strb	wzr, [x1, 1]
	ldr	x4, [x0]
	cbnz	x4, .L1336
	mov	w21, 0
	b	.L1345
	.size	VC1DEC_Decode, .-VC1DEC_Decode
	.align	3
.LC196:
	.xword	.LC195
	.align	3
.LC198:
	.xword	.LC197
	.align	3
.LC199:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC201:
	.xword	.LC200
	.align	3
.LC202:
	.xword	g_event_report
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
	bl	_mcount
	cbz	x19, .L1350
	add	x19, x19, 12288
	mov	w0, 2
	ldrsb	w1, [x19, 2526]
	cmp	w1, 1
	csel	w0, wzr, w0, ne
.L1348:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1350:
	ldr	x3, .LC203
	mov	w2, 6026
	ldr	x1, .LC204
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1348
	.size	VC1_GetPacketState, .-VC1_GetPacketState
	.align	3
.LC203:
	.xword	.LC35
	.align	3
.LC204:
	.xword	.LC37
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.11730, %object
	.size	__func__.11730, 13
__func__.11730:
	.string	"Vc1SMPSeqHdr"
	.zero	3
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
	.type	__func__.12041, %object
	.size	__func__.12041, 17
__func__.12041:
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
.LC12:
	ASCII(.string	"pCtx or pstExtraData is NULL!\n" )
	.zero	1
.LC15:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC17:
	ASCII(.string	"VC1 INIT!!!\n" )
	.zero	3
.LC19:
	ASCII(.string	"pBitBuf or pVc1Info is NULL!\n" )
	.zero	2
.LC21:
	ASCII(.string	"picture width out of range" )
	.zero	5
.LC24:
	ASCII(.string	"%s: %s\n" )
.LC26:
	ASCII(.string	"picture height out of range" )
	.zero	4
.LC28:
	ASCII(.string	"Vc1SMPSeqHdr Err, BS is wrong" )
	.zero	2
.LC30:
	ASCII(.string	"Vc1SMPSeqHdr Err, BS is wrong\n" )
	.zero	1
.LC33:
	ASCII(.string	"pCtx is NULL!\n" )
	.zero	1
.LC35:
	ASCII(.string	"pCtx is NULL!" )
	.zero	2
.LC37:
	ASCII(.string	"vc1.c,L%d: %s\n" )
	.zero	1
.LC41:
	ASCII(.string	"image size abnormal(%dx%d)\n" )
	.zero	4
.LC43:
	ASCII(.string	"vc1 actual frame size(%dx%d) exeed max config(%dx%d)\n" )
	.zero	2
.LC46:
	ASCII(.string	"partition fs memory fail!\n" )
	.zero	5
.LC48:
	ASCII(.string	"ERROR: FSP_ConfigInstance fail!\n" )
	.zero	7
.LC50:
	ASCII(.string	"line: %d, pImage is NULL!\n" )
	.zero	5
.LC56:
	ASCII(.string	"get frame store fail!\n" )
	.zero	1
.LC58:
	ASCII(.string	"VC1_Vfmw_GetImageBuffer get imgbuf err, clear all ref!\n" )
.LC60:
	ASCII(.string	"VC1_Vfmw_GetImageBuffer get_flag!=1, FSP_ClearLogicFs.\n" )
.LC63:
	ASCII(.string	"pCodecInf is NULL! \n" )
	.zero	3
.LC67:
	ASCII(.string	"VC1_Vfmw_GetStreamInfo VC1_ArrangeVahbMem err!\n" )
.LC69:
	ASCII(.string	"VC1_Vfmw_GetStreamInfo VC1_Vfmw_GetImageBuffer err!\n" )
	.zero	3
.LC71:
	ASCII(.string	"dec_pts: %lld Usertag = %lld\n" )
	.zero	2
.LC74:
	ASCII(.string	"---------- unref %d\n" )
	.zero	3
.LC76:
	ASCII(.string	"VC1_Vfmw_GetStreamInfo B pic pCodecInf->RefNum < 2 err!\n" )
	.zero	7
.LC78:
	ASCII(.string	"line: %d (pCur,pFwd,pBwd)(%p,%p,%p)\n" )
	.zero	3
.LC80:
	ASCII(.string	"VC1_Vfmw_GetStreamInfo imgbuf = NULL err!\n" )
	.zero	5
.LC82:
	ASCII(.string	"CurFsID(fwd%d,%d,bwd%d) abnormal!(%p,%p)\n" )
	.zero	6
.LC84:
	ASCII(.string	"VC1_Vfmw_GetStreamInfo VC1_Vfmw_BuildRefList err!\n" )
	.zero	5
.LC86:
	ASCII(.string	"pVC1_CTX_S is NULL!" )
	.zero	4
.LC89:
	ASCII(.string	"VC1_Vfmw_GetStreamInfo error! Release all packets!\n" )
	.zero	4
.LC102:
	ASCII(.string	"%s:%d Code(%d) is invalid\n" )
	.zero	5
.LC104:
	ASCII(.string	"%s:%d Denominator(%d) is invalid\n" )
	.zero	6
.LC118:
	ASCII(.string	"SLICE_ADDR = %d,SlcEndMbn = %d, MbHeight = %d\n" )
	.zero	1
.LC120:
	ASCII(.string	"SLICE_ADDR = %d,SlcEndMbn = %d, totalMbMin1 = %d\n" )
	.zero	6
.LC122:
	ASCII(.string	"VC1_RecordSlcStream stream len <= 0\n" )
	.zero	3
.LC124:
	ASCII(.string	"pCodecInf is NULL!" )
	.zero	5
.LC128:
	ASCII(.string	"Check Pos 2: %d\n" )
	.zero	7
.LC130:
	ASCII(.string	"Check Pos 3: %d\n" )
	.zero	7
.LC133:
	ASCII(.string	"\n======PicNum  :%6d=========\n" )
	.zero	2
.LC135:
	ASCII(.string	"INTERPFRM  :%#x\n" )
	.zero	7
.LC138:
	ASCII(.string	"VC1_Vfmw_ParseMPBPicHdr err!\n" )
	.zero	2
.LC140:
	ASCII(.string	"VC1_Vfmw_ParseSMPIPicHdr err!\n" )
	.zero	1
.LC142:
	ASCII(.string	"After VC1_Vfmw_ParseSMPPicHdr BS Len <= 0 err!\n" )
.LC148:
	ASCII(.string	"pCodeInfo  is NULL! \n" )
	.zero	2
.LC150:
	ASCII(.string	"ChanID is out of range! \n" )
	.zero	6
.LC154:
	ASCII(.string	"pImg is null, pCurImg %p pBwdImg %p pFwdImg %p\n" )
.LC156:
	ASCII(.string	"line: %d, pToQueImg is Null!\n" )
	.zero	2
.LC158:
	ASCII(.string	"insert buf %d ref %d\n" )
	.zero	2
.LC160:
	ASCII(.string	"err(%d) > out_thr(%d)\n" )
	.zero	1
.LC164:
	ASCII(.string	"----------------- VC1 Imode -> %d ------------------\n" )
	.zero	2
.LC167:
	ASCII(.string	"NOTE: Drop non-I\n" )
	.zero	6
.LC169:
	ASCII(.string	"NOTE: Drop B\n" )
	.zero	2
.LC177:
	ASCII(.string	" pCodecInf->SlcNum = %d >= 256 \n" )
	.zero	7
.LC182:
	ASCII(.string	"line %d, Code = VC1_SCSLC failed!\n" )
	.zero	5
.LC186:
	ASCII(.string	"line %d, Code = VC1_SCFRM failed!\n" )
	.zero	5
.LC188:
	ASCII(.string	"pCodecInf or pSyntax is NULL! \n" )
.LC191:
	ASCII(.string	"bitsream para error -----\n" )
	.zero	5
.LC193:
	ASCII(.string	"line %d, pPacket->StreamPack[1].IsLastSeg = %d\n" )
.LC195:
	ASCII(.string	"ERROR: p_Packet is Null pointer!\n" )
	.zero	6
.LC197:
	ASCII(.string	"ERROR: pVC1_CTX_S is Null pointer!\n" )
	.zero	4
.LC200:
	ASCII(.string	"ERROR: frm %d, Invalid packet pointer!\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
