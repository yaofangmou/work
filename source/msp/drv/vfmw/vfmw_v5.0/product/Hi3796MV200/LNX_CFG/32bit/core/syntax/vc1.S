#include "hi_asm_define.h"
	.arch armv7-a
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"vc1.c"
	.text
	.align	2
	.type	VC1_Vfmw_GenerateIntensityMap, %function
VC1_Vfmw_GenerateIntensityMap:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r2, #31
	subgt	r2, r2, #64
	cmp	r1, #0
	addne	ip, r1, #32
	moveq	r2, r2, asl #7
	mvneq	ip, #63
	rsbeq	r2, r2, #16320
	movne	r2, r2, asl #6
	cmp	r3, #0
	bne	.L13
	add	r3, r2, #32
	sub	r2, r0, #1
	add	r0, r0, #255
.L5:
	usat	r1, #8, r3, asr #6
	strb	r1, [r2, #1]!
	cmp	r2, r0
	add	r3, r3, ip
	bne	.L5
	ldmfd	sp, {fp, sp, pc}
.L13:
	mov	r3, ip, asl #7
	sub	r2, r0, #1
	rsb	r3, r3, #8192
	add	r0, r0, #255
	add	r3, r3, #32
.L6:
	usat	r1, #8, r3, asr #6
	strb	r1, [r2, #1]!
	cmp	r2, r0
	add	r3, r3, ip
	bne	.L6
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_Vfmw_GenerateIntensityMap, .-VC1_Vfmw_GenerateIntensityMap
	.align	2
	.global	emp_print
	.type	emp_print, %function
emp_print:
	UNWIND(.fnstart)
	@ args = 4, pretend = 12, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 1
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3}
	UNWIND(.save {r1, r2, r3})
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-16)
	sub	fp, ip, #16
	mov	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	emp_print, .-emp_print
	.align	2
	.global	AbandonBitsLenthNoUse
	.type	AbandonBitsLenthNoUse, %function
AbandonBitsLenthNoUse:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r2, r3
	bne	.L27
.L19:
	ldrb	r3, [r0, #-1]!	@ zero_extendqisi2
	add	r2, r2, #8
	cmp	r3, #0
	beq	.L19
	add	r0, r2, #1
.L20:
	tst	r3, #1
	bne	.L28
.L21:
	mov	r3, r3, lsr #1
	add	r2, r2, #1
	tst	r3, #1
	beq	.L21
	add	r0, r2, #1
	ldmfd	sp, {fp, sp, pc}
.L27:
	mov	r0, #1
	mov	r2, #0
	b	.L20
.L28:
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	AbandonBitsLenthNoUse, .-AbandonBitsLenthNoUse
	.align	2
	.global	VC1DEC_Init
	.type	VC1DEC_Init, %function
VC1DEC_Init:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #0
	cmpne	r0, #0
	mov	r8, r1
	mov	r6, r0
	moveq	r7, #1
	movne	r7, #0
	beq	.L33
	add	r4, r0, #49152
	ldr	r3, .L35
	movw	r2, #49688
	mov	r1, r7
	ldr	r9, [r4, #520]
	mov	r5, #1
	ldr	r3, [r3, #48]
	blx	r3
	add	r0, r4, #176
	str	r9, [r4, #520]
	bl	ResetVoQueue
	add	r2, r6, #12288
	ldr	r3, [r8, #32]
	mov	r0, r6
	str	r8, [r6]
	strb	r5, [r2, #457]
	add	r3, r3, #255
	ldr	r1, [r8, #8]
	bic	r3, r3, #255
	add	ip, r3, #2048
	str	r3, [r4, #96]
	str	ip, [r4, #100]
	add	ip, r3, #4096
	str	r1, [r4, #124]
	add	r1, r3, #6144
	str	ip, [r4, #104]
	add	ip, r3, #8192
	str	r1, [r4, #108]
	add	r1, r3, #10240
	str	ip, [r4, #112]
	add	r3, r3, #12288
	str	r1, [r4, #116]
	str	r3, [r4, #120]
	strb	r5, [r2, #458]
	str	r7, [r4, #56]
	str	r7, [r4, #60]
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r4, #528]
	beq	.L34
	ldr	r1, .L35+4
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L33:
	ldr	r1, .L35+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L34:
	mov	r0, r7
	ldr	r1, .L35+12
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L36:
	.align	2
.L35:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC15
	.word	.LC13
	.word	.LC14
	UNWIND(.fnend)
	.size	VC1DEC_Init, .-VC1DEC_Init
	.align	2
	.global	Vc1SMPSeqHdr
	.type	Vc1SMPSeqHdr, %function
Vc1SMPSeqHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #32)
	sub	sp, sp, #32
	cmp	r2, #0
	cmpne	r0, #0
	mov	r4, r2
	beq	.L51
	mov	r2, r1, asl #3
	mov	r1, r0
	sub	r0, fp, #52
	bl	BsInit
	mov	r1, #8
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #8
	mov	r5, r0
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #8
	add	r5, r5, r0, lsl #8
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #8
	add	r5, r5, r0, lsl #16
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #8
	add	r5, r5, r0, lsl #24
	sub	r0, fp, #52
	str	r5, [r4, #8]
	bl	BsGet
	mov	r1, #8
	mov	r5, r0
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #8
	add	r5, r5, r0, lsl #8
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #8
	add	r5, r5, r0, lsl #16
	sub	r0, fp, #52
	bl	BsGet
	ldr	r3, [r4, #8]
	cmp	r3, #8192
	add	r0, r5, r0, lsl #24
	str	r0, [r4, #12]
	bgt	.L42
	cmp	r0, #8192
	bgt	.L43
	cmp	r3, #31
	ble	.L42
	cmp	r0, #31
	ble	.L43
	mov	r1, #2
	sub	r0, fp, #52
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #16]
	cmp	r0, #1
	bhi	.L45
	mov	r1, #2
	sub	r0, fp, #52
	bl	BsGet
	cmp	r0, #0
	bne	.L45
	mov	r1, #3
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #5
	strb	r0, [r4, #17]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #18]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #19]
	sub	r0, fp, #52
	bl	BsGet
	cmp	r0, #0
	bne	.L45
	mov	r1, #1
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #20]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #21]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #22]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #2
	strb	r0, [r4, #23]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #24]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #25]
	sub	r0, fp, #52
	bl	BsGet
	subs	r5, r0, #0
	bne	.L45
	mov	r1, #1
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #26]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #27]
	sub	r0, fp, #52
	bl	BsGet
	ldrb	r3, [r4, #16]	@ zero_extendqisi2
	mov	r1, #3
	cmp	r3, #0
	strb	r0, [r4, #28]
	sub	r0, fp, #52
	streqb	r3, [r4, #28]
	bl	BsGet
	mov	r1, #2
	strb	r0, [r4, #29]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #30]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #31]
	sub	r0, fp, #52
	bl	BsGet
	sub	r0, fp, #52
	mov	r1, #32
	bl	BsGet
	cmp	r0, #0
	bne	.L52
.L39:
	mov	r0, r5
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L52:
	ldr	r1, .L53
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r5
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L45:
	ldr	r3, .L53+4
.L50:
	ldr	r2, .L53+8
	mov	r0, #0
	ldr	r1, .L53+12
	mvn	r5, #0
	bl	dprint_vfmw
	mov	r0, r5
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L43:
	ldr	r3, .L53+16
	b	.L50
.L51:
	ldr	r1, .L53+20
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r5, #0
	b	.L39
.L42:
	ldr	r3, .L53+24
	b	.L50
.L54:
	.align	2
.L53:
	.word	.LC21
	.word	.LC20
	.word	.LANCHOR0
	.word	.LC18
	.word	.LC19
	.word	.LC16
	.word	.LC17
	UNWIND(.fnend)
	.size	Vc1SMPSeqHdr, .-Vc1SMPSeqHdr
	.align	2
	.global	VC1_SetImgFormat
	.type	VC1_SetImgFormat, %function
VC1_SetImgFormat:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r6, r0, #32768
	add	r5, r0, #49152
	mov	r8, r0
	add	r7, r0, #12288
	ldr	r1, [r6, #4092]
	ldr	r0, [r5, #528]
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	mov	r9, #1
	str	r9, [r4, #296]
	ldrb	r3, [r7, #451]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L66
	ldr	ip, .L67
	mov	r3, #0
	mov	r1, r3
	strb	r3, [r4, #284]
	mov	r2, #4
	add	r0, r4, #64
	ldr	r3, [ip, #48]
	blx	r3
	ldrb	r3, [r4, #65]	@ zero_extendqisi2
	orr	r3, r3, #12
	bfi	r3, r9, #4, #2
	strb	r3, [r4, #65]
.L59:
	ldrb	r2, [r5, #129]	@ zero_extendqisi2
	mov	r1, #0
	ldrb	r3, [r4, #66]	@ zero_extendqisi2
	mov	r0, r4
	bfi	r3, r2, #1, #1
	strb	r3, [r4, #66]
	ldr	r3, [r5, #132]
	str	r3, [r4, #120]
	ldr	r3, [r6, #4036]
	str	r3, [r4, #72]
	ldr	r3, [r6, #4032]
	str	r3, [r4, #68]
	bl	SetAspectRatio
	ldr	r8, [r7, #244]
	ldr	r2, [r4, #36]
	add	lr, r4, #512
	ldr	r3, [r4, #112]
	add	ip, r2, r8
	str	ip, [r4, #40]
	ldrd	r0, [lr, #-8]
	add	r9, ip, r3
	add	r3, r2, r3
	adds	r0, r0, r8
	adc	r1, r1, #0
	strd	r0, [lr]
	ldr	r1, [r4, #68]
	mov	r0, #1
	str	ip, [r4, #24]
	mov	ip, #8
	str	r3, [r4, #28]
	add	r1, r1, #508
	str	r9, [r4, #32]
	add	r1, r1, #3
	str	r2, [r4, #20]
	bic	r3, r1, #508
	ldr	r2, [r6, #4036]
	bic	r3, r3, #3
	mov	r3, r3, lsr #5
	str	r2, [r4, #80]
	ldr	r2, [r6, #4032]
	str	r3, [r4, #136]
	strb	r0, [r4, #291]
	str	r2, [r4, #76]
	strb	r0, [r4, #289]
	str	ip, [r4, #300]
	str	ip, [r4, #308]
	str	ip, [r4, #304]
	ldrb	r3, [r7, #450]	@ zero_extendqisi2
	cmp	r3, #0
	ldreqb	r3, [r5, #140]	@ zero_extendqisi2
	ldreqb	r2, [r5, #136]	@ zero_extendqisi2
	ubfxeq	r1, r3, #1, #4
	ldrneb	r3, [r5, #136]	@ zero_extendqisi2
	andeq	r3, r3, #1
	bfieq	r2, r1, #1, #4
	bfieq	r2, r3, #0, #1
	streqb	r2, [r5, #136]
	ldrb	r2, [r4, #636]	@ zero_extendqisi2
	andne	r3, r3, r0
	bfi	r2, r3, #0, #1
	strb	r2, [r4, #636]
	ldrb	r3, [r5, #136]	@ zero_extendqisi2
	uxtb	r2, r2
	ubfx	r3, r3, #1, #4
	bfi	r2, r3, #1, #4
	strb	r2, [r4, #636]
	ldrb	r3, [r5, #140]	@ zero_extendqisi2
	and	r3, r3, #254
	bfc	r3, #1, #4
	strb	r3, [r5, #140]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L66:
	mov	r3, #4
	ldrb	r2, [r4, #65]	@ zero_extendqisi2
	strb	r3, [r4, #284]
	mov	r1, #1
	ldrb	r3, [r8, #16]	@ zero_extendqisi2
	ubfx	r2, r2, #2, #2
	add	r3, r3, r9
	orr	r3, r3, r2
	cmp	r3, #3
	andls	r2, r3, #3
	ldrb	r3, [r4, #65]	@ zero_extendqisi2
	movhi	r2, #0
	bfi	r3, r2, #2, #2
	bfi	r3, r1, #0, #2
	bfi	r3, r1, #4, #2
	strb	r3, [r4, #65]
	b	.L59
.L68:
	.align	2
.L67:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VC1_SetImgFormat, .-VC1_SetImgFormat
	.align	2
	.global	VC1DEC_Destroy
	.type	VC1DEC_Destroy, %function
VC1DEC_Destroy:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1DEC_Destroy, .-VC1DEC_Destroy
	.align	2
	.global	VC1DEC_RecycleImage
	.type	VC1DEC_RecycleImage, %function
VC1DEC_RecycleImage:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r4, r0, #0
	mov	r5, r1
	beq	.L74
	add	r4, r4, #49152
	mov	r2, #0
	ldr	r0, [r4, #528]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #528]
	bl	FSP_GetFsImagePtr
	cmp	r0, #0
	beq	.L73
	add	r5, r0, #560
	add	r8, r0, #544
	ldr	r1, [r0, #544]
	mov	r6, #0
	ldr	r0, [r4, #528]
	mov	r7, #0
	bl	FreeUsdByDec
	strd	r6, [r8]
	ldr	r0, [r4, #528]
	ldr	r1, [r5, #-8]
	bl	FreeUsdByDec
	strd	r6, [r5, #-8]
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L73:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L74:
	ldr	r1, .L75
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L76:
	.align	2
.L75:
	.word	.LC22
	UNWIND(.fnend)
	.size	VC1DEC_RecycleImage, .-VC1DEC_RecycleImage
	.align	2
	.global	VC1DEC_GetRemainImg
	.type	VC1DEC_GetRemainImg, %function
VC1DEC_GetRemainImg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	subs	r4, r0, #0
	beq	.L97
	add	r5, r4, #32768
	add	r9, r4, #12288
	ldr	r3, [r5, #4004]
	cmp	r3, #0
	beq	.L85
	ldr	r3, [r4]
	ldr	r3, [r3, #24]
	cmp	r3, #1
	beq	.L96
	add	r6, r4, #49152
	ldr	r1, [r5, #4088]
	ldr	r0, [r6, #528]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	moveq	r5, r6
	addeq	r5, r5, #176
	beq	.L84
	ldr	r1, [r5, #4088]
	ldr	r0, [r6, #528]
	bl	FSP_GetDisplay
	cmp	r0, #2
	beq	.L95
.L96:
	add	r5, r4, #49152
	add	r5, r5, #176
.L84:
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	GetVoLastImageID
.L95:
	add	r10, r8, #544
	add	r7, r8, #560
	mov	r0, r4
	bl	VC1_SetImgFormat
	mov	r2, #1
	mov	r0, #0
	str	r2, [r8, #180]
	mov	r1, #0
	strd	r0, [r10]
	strd	r0, [r7, #-8]
	ldr	r1, [r8, #148]
	ldr	r0, [r6, #528]
	bl	FSP_SetDisplay
	ldr	r3, [r5, #4004]
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L98
.L81:
	add	r5, r4, #49152
	ldr	r0, [r6, #528]
	add	r5, r5, #176
	str	r8, [sp]
	mov	r2, r4
	mov	r1, #1
	mov	r3, r5
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L82
	ldr	r1, [r8, #148]
	mov	r0, r4
	bl	VC1DEC_RecycleImage
	ldr	r1, [r8, #544]
	ldr	r0, [r6, #528]
	mov	r8, #0
	bl	FreeUsdByDec
	mov	r9, #0
	strd	r8, [r10]
	ldr	r0, [r6, #528]
	ldr	r1, [r7, #-8]
	bl	FreeUsdByDec
	strd	r8, [r7, #-8]
	b	.L84
.L82:
	ldr	r3, [r8, #152]
	cmp	r3, #100
	bhi	.L84
	ldr	r3, [r8, #68]
	cmp	r3, #31
	bls	.L84
	ldr	r3, [r8, #72]
	cmp	r3, #31
	movhi	r0, #0
	bls	.L84
.L92:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L98:
	strb	r2, [r3, #1]
	mov	r1, #0
	ldr	r2, [r5, #4004]
	mov	r3, #3
	strb	r1, [r2]
	strb	r3, [r9, #449]
	b	.L81
.L85:
	mvn	r0, #0
	b	.L92
.L97:
	ldr	r3, .L99
	mov	r2, #408
	ldr	r1, .L99+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L92
.L100:
	.align	2
.L99:
	.word	.LC23
	.word	.LC24
	UNWIND(.fnend)
	.size	VC1DEC_GetRemainImg, .-VC1DEC_GetRemainImg
	.align	2
	.global	VC1_ArrangeVahbMem
	.type	VC1_ArrangeVahbMem, %function
VC1_ArrangeVahbMem:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #32)
	sub	sp, sp, #32
	mov	r5, r1
	sub	r1, r1, #32
	movw	r3, #8160
	cmp	r1, r3
	mov	r7, r0
	mov	r6, r2
	bhi	.L102
	sub	r2, r2, #32
	cmp	r2, r3
	bhi	.L102
	add	r2, r0, #28160
	mov	r1, #0
	add	r2, r2, #208
	mov	r0, r1
.L105:
	str	r1, [r2, #-492]
	add	r1, r1, #1
	cmp	r1, #5
	strb	r0, [r2, #-1679]
	strb	r0, [r2, #-1680]
	add	r2, r2, #1680
	bne	.L105
	ldr	r3, [r7]
	ldr	r4, [r3, #732]
	ldr	r2, [r3, #28]
	cmp	r4, #0
	bne	.L106
	cmp	r2, #25
	beq	.L130
.L126:
	mov	r4, r1
	mov	r8, #3
	mov	r9, #2
.L107:
	ldr	r3, .L133
	mov	r2, #20
	mov	r1, #0
	sub	r0, fp, #56
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r7]
	str	r5, [fp, #-52]
	str	r6, [fp, #-48]
	ldr	r3, [r3, #28]
	str	r5, [fp, #-44]
	cmp	r3, #24
	str	r6, [fp, #-40]
	beq	.L117
	uxtb	r3, r9
	strb	r8, [fp, #-55]
	strb	r4, [fp, #-54]
.L122:
	add	r5, r7, #49152
	sub	r1, fp, #56
	strb	r3, [fp, #-53]
	ldr	r0, [r5, #528]
	bl	FSP_ConfigInstance
	subs	r4, r0, #0
	bne	.L118
	ldr	r1, [r7]
	sub	r3, fp, #60
	ldr	r0, [r5, #528]
	ldr	r2, [r1, #20]
	ldr	r1, [r1, #16]
	bl	FSP_ConfigFrameBuf
	cmp	r0, #2
	beq	.L131
	cmp	r0, #0
	bne	.L120
.L124:
	mov	r4, #1
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L102:
	mov	r3, r6
	mov	r2, r5
	ldr	r1, .L133+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r4, #0
.L129:
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L106:
	cmp	r2, #25
	bne	.L126
	ldr	r2, [r3, #692]
	ldr	r1, [r3, #696]
	cmp	r5, r2
	bhi	.L114
	cmp	r6, r1
	bhi	.L114
	ldr	r1, [r3, #720]
	ldr	r2, [r3, #716]
	cmp	r1, #0
	add	r8, r2, #2
	moveq	r9, #1
	bne	.L132
.L116:
	ldrb	r4, [r3, #740]	@ zero_extendqisi2
	b	.L107
.L118:
	ldr	r1, .L133+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r4, #0
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L130:
	ldr	r2, [r3, #692]
	cmp	r5, r2
	ldrhi	r0, [r3, #696]
	bhi	.L109
	ldr	r1, [r3, #696]
	cmp	r6, r1
	mov	r0, r1
	bhi	.L109
	add	r0, r7, #12288
	ldrb	r0, [r0, #448]	@ zero_extendqisi2
	tst	r0, #8
	bne	.L124
	ldr	ip, [r3, #720]
	ldr	r0, [r3, #716]
	cmp	ip, #0
	add	r8, r0, #2
	moveq	r9, #1
	beq	.L112
	add	r9, r0, #1
	cmp	r9, #17
	movcs	r9, #17
.L112:
	ldrb	r4, [r3, #740]	@ zero_extendqisi2
	mov	r6, r1
	mov	r5, r2
	b	.L107
.L117:
	mov	r3, #1
	strb	r4, [fp, #-54]
	strb	r3, [fp, #-55]
	b	.L122
.L114:
	str	r1, [sp, #4]
	mov	r3, r6
	str	r2, [sp]
	mov	r0, #0
	mov	r2, r5
	ldr	r1, .L133+12
	bl	dprint_vfmw
	mov	r4, #0
	b	.L129
.L131:
	add	r0, r5, #176
	bl	ResetVoQueue
.L120:
	ldr	r1, .L133+16
	mov	r0, #0
	bl	dprint_vfmw
	b	.L129
.L132:
	add	r9, r2, #1
	cmp	r9, #17
	movcs	r9, #17
	b	.L116
.L109:
	str	r0, [sp, #4]
	mov	r3, r6
	str	r2, [sp]
	mov	r0, #0
	mov	r2, r5
	ldr	r1, .L133+12
	bl	dprint_vfmw
	b	.L129
.L134:
	.align	2
.L133:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC25
	.word	.LC28
	.word	.LC26
	.word	.LC27
	UNWIND(.fnend)
	.size	VC1_ArrangeVahbMem, .-VC1_ArrangeVahbMem
	.align	2
	.global	VC1_WritePicMsg
	.type	VC1_WritePicMsg, %function
VC1_WritePicMsg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r7, r0, #32768
	add	r5, r0, #49152
	mov	r6, r0
	mov	r4, r1
	add	r8, r0, #12288
	ldr	r1, [r7, #4092]
	ldr	r0, [r5, #528]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L158
	movw	r3, #3544
	ldrsb	r2, [r8, r3]
	add	r3, r6, #20480
	cmp	r2, #0
	bne	.L159
	strb	r2, [r4, #5]
	ldrb	r1, [r3, #2612]	@ zero_extendqisi2
	strb	r1, [r4, #4]
	ldrb	r1, [r3, #2863]	@ zero_extendqisi2
	cmp	r1, #4
	moveq	r1, #3
	strb	r1, [r4, #3]
	ldr	r1, [r5, #76]
	sub	r1, r1, #1
	strh	r1, [r4, #80]	@ movhi
	ldr	r1, [r5, #72]
	strb	r2, [r4, #8]
	sub	r1, r1, #1
	strh	r1, [r4, #78]	@ movhi
	ldrb	r1, [r3, #2615]	@ zero_extendqisi2
	strb	r2, [r4, #9]
	strb	r1, [r4, #6]
	ldrb	r1, [r8, #456]	@ zero_extendqisi2
	strb	r2, [r4, #10]
	strb	r2, [r4, #11]
	strb	r1, [r4, #7]
	ldrb	r1, [r3, #2618]	@ zero_extendqisi2
	strb	r1, [r4, #13]
	ldrb	r1, [r3, #2622]	@ zero_extendqisi2
	strb	r1, [r4, #14]
	ldrb	r1, [r3, #2882]	@ zero_extendqisi2
	strb	r1, [r4, #12]
	ldrb	r1, [r3, #2892]	@ zero_extendqisi2
	strb	r1, [r4, #18]
	ldrb	r1, [r3, #2867]	@ zero_extendqisi2
	strb	r1, [r4, #19]
	ldrb	r1, [r3, #2866]	@ zero_extendqisi2
	strb	r1, [r4, #17]
	ldr	r1, [r3, #2952]
	strb	r1, [r4, #16]
	ldrb	r1, [r3, #2626]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L150
	ldrb	r2, [r3, #2866]	@ zero_extendqisi2
	cmp	r2, #8
	movhi	r2, #0
	movls	r2, #1
	strb	r2, [r4, #20]
.L151:
	ldrb	r1, [r3, #2886]	@ zero_extendqisi2
	add	r2, r4, #12288
	strb	r1, [r4, #24]
	ldrb	r1, [r3, #2885]	@ zero_extendqisi2
	strb	r1, [r4, #23]
	ldrb	r1, [r3, #2620]	@ zero_extendqisi2
	strb	r1, [r4, #22]
	ldrb	r1, [r3, #2884]	@ zero_extendqisi2
	strb	r1, [r4, #25]
	ldr	r1, [r3, #2896]
	strb	r1, [r4, #26]
	ldrb	r1, [r3, #2887]	@ zero_extendqisi2
	strb	r1, [r4, #21]
	ldrb	r1, [r3, #2871]	@ zero_extendqisi2
	strb	r1, [r4, #27]
	ldrb	r1, [r3, #2872]	@ zero_extendqisi2
	strb	r1, [r4, #28]
	ldr	r1, [r7, #4004]
	ldrb	r1, [r1, #1029]	@ zero_extendqisi2
	strb	r1, [r4, #30]
	ldr	r1, [r7, #4000]
	ldrb	r1, [r1, #1029]	@ zero_extendqisi2
	strb	r1, [r4, #29]
	ldrb	r1, [r3, #2869]	@ zero_extendqisi2
	strb	r1, [r4, #31]
	ldrb	r1, [r3, #2991]	@ zero_extendqisi2
	strb	r1, [r4, #32]
	ldrb	r1, [r3, #2881]	@ zero_extendqisi2
	strb	r1, [r4, #35]
	ldrb	r1, [r3, #2621]	@ zero_extendqisi2
	strb	r1, [r4, #36]
	ldrb	r1, [r3, #2877]	@ zero_extendqisi2
	strb	r1, [r4, #37]
	ldrb	r1, [r3, #2879]	@ zero_extendqisi2
	strb	r1, [r4, #38]
	ldrb	r1, [r3, #2880]	@ zero_extendqisi2
	strb	r1, [r4, #39]
	ldrb	r1, [r3, #2878]	@ zero_extendqisi2
	strb	r1, [r4, #40]
	ldr	r1, [r3, #2944]
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #42]
	ldr	r1, [r3, #2940]
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #43]
	ldr	r1, [r3, #2948]
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #45]
	ldrb	r1, [r3, #2864]	@ zero_extendqisi2
	strb	r1, [r4, #50]
	ldrb	r1, [r3, #2876]	@ zero_extendqisi2
	strb	r1, [r4, #49]
	ldrb	r1, [r3, #2875]	@ zero_extendqisi2
	strb	r1, [r4, #48]
	ldr	r1, [r3, #2956]
	str	r1, [r2, #84]
	ldrb	r1, [r3, #2624]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L160
	mov	r1, #0
	mov	ip, r1
	mov	r9, r1
	mov	lr, r1
.L154:
	strb	lr, [r4, #59]
	strb	r9, [r4, #60]
	strb	ip, [r4, #61]
	str	r1, [r0, #352]
	ldrb	r3, [r3, #2612]	@ zero_extendqisi2
	strb	r3, [r0, #330]
.L148:
	add	r3, r6, #36864
	add	r6, r6, #12736
	ldr	r1, .L164
	add	r6, r6, #14
	ldr	r3, [r3, #4]
	strh	r3, [r4, #72]	@ movhi
	ldr	r3, [r7, #4032]
	strh	r3, [r4, #74]	@ movhi
	ldr	r3, [r7, #4036]
	strh	r3, [r4, #76]	@ movhi
	ldrb	r3, [r8, #460]	@ zero_extendqisi2
	strb	r3, [r4, #63]
	ldrb	r3, [r8, #461]	@ zero_extendqisi2
	strb	r3, [r4, #62]
	ldr	r0, [r7, #4016]
	adds	r3, r0, #127
	addmi	r3, r0, #254
	mov	r3, r3, asr #7
	mov	r3, r3, asl #4
	str	r3, [r2, #116]
	ldr	r3, [r5, #96]
	str	r3, [r2, #120]
	ldr	r3, [r5, #100]
	str	r3, [r2, #124]
	ldr	r3, [r5, #104]
	str	r3, [r2, #128]
	ldr	r3, [r5, #108]
	str	r3, [r2, #132]
	ldr	r3, [r5, #112]
	str	r3, [r2, #136]
	ldr	r3, [r5, #116]
	str	r3, [r2, #140]
	ldr	r3, [r5, #120]
	str	r3, [r2, #144]
	str	r6, [r4, #64]
	ldr	r2, [r5, #528]
	ldrh	r3, [r4, #78]
	ldr	r2, [r1, r2, asl #2]
	add	r3, r3, #1
	str	r3, [r2, #1564]
	ldr	r3, [r5, #528]
	ldr	r2, [r1, r3, asl #2]
	ldrh	r3, [r4, #80]
	add	r3, r3, #1
	str	r3, [r2, #1568]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L159:
	ldr	r2, [r3, #3004]
	mov	ip, #1680
	strb	r2, [r4, #5]
	ldrb	r2, [r3, #2628]	@ zero_extendqisi2
	strb	r2, [r4, #4]
	ldrb	r2, [r3, #2961]	@ zero_extendqisi2
	cmp	r2, #4
	moveq	r2, #3
	strb	r2, [r4, #3]
	ldr	r2, [r3, #3004]
	cmp	r2, #3
	ldr	r2, [r5, #76]
	addeq	r2, r2, #1
	addeq	r2, r2, r2, lsr #31
	moveq	r2, r2, asr #1
	sub	r2, r2, #1
	strh	r2, [r4, #80]	@ movhi
	ldr	r1, [r5, #72]
	sub	r1, r1, #1
	strh	r1, [r4, #78]	@ movhi
	ldrb	r2, [r3, #3001]	@ zero_extendqisi2
	strb	r2, [r4, #8]
	ldrb	r2, [r3, #2804]	@ zero_extendqisi2
	strb	r2, [r4, #6]
	ldrb	r2, [r3, #2992]	@ zero_extendqisi2
	strb	r2, [r4, #9]
	ldrb	r2, [r8, #456]	@ zero_extendqisi2
	strb	r2, [r4, #7]
	ldr	r1, [r7, #4056]
	mla	r1, ip, r1, r8
	add	r1, r1, #15424
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
	strb	r2, [r4, #10]
	ldr	r2, [r7, #4072]
	mla	r2, ip, r2, r8
	add	r2, r2, #15424
	ldrb	r2, [r2, #3]	@ zero_extendqisi2
	strb	r2, [r4, #11]
	ldrb	r2, [r3, #2990]	@ zero_extendqisi2
	strb	r2, [r4, #15]
	ldrb	r2, [r3, #2805]	@ zero_extendqisi2
	strb	r2, [r4, #13]
	ldrb	r2, [r3, #2809]	@ zero_extendqisi2
	strb	r2, [r4, #14]
	ldrb	r2, [r3, #2960]	@ zero_extendqisi2
	strb	r2, [r4, #12]
	ldrb	r2, [r3, #3128]	@ zero_extendqisi2
	strb	r2, [r4, #18]
	ldrb	r2, [r3, #2963]	@ zero_extendqisi2
	strb	r2, [r4, #19]
	ldrb	r2, [r3, #2970]	@ zero_extendqisi2
	strb	r2, [r4, #17]
	ldr	r2, [r3, #3076]
	strb	r2, [r4, #16]
	ldrb	r2, [r3, #2810]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L141
	ldrb	r2, [r3, #2970]	@ zero_extendqisi2
	cmp	r2, #8
	movhi	r2, #0
	movls	r2, #1
	strb	r2, [r4, #20]
.L142:
	ldrb	r1, [r3, #3122]	@ zero_extendqisi2
	add	r2, r4, #12288
	strb	r1, [r4, #24]
	ldrb	r1, [r3, #3121]	@ zero_extendqisi2
	strb	r1, [r4, #23]
	ldrb	r1, [r3, #2807]	@ zero_extendqisi2
	strb	r1, [r4, #22]
	ldrb	r1, [r3, #3120]	@ zero_extendqisi2
	strb	r1, [r4, #25]
	ldr	r1, [r3, #3132]
	strb	r1, [r4, #26]
	ldrb	r1, [r3, #3123]	@ zero_extendqisi2
	strb	r1, [r4, #21]
	ldrb	r1, [r3, #2974]	@ zero_extendqisi2
	strb	r1, [r4, #27]
	ldrb	r1, [r3, #2975]	@ zero_extendqisi2
	strb	r1, [r4, #28]
	ldrb	r1, [r3, #2993]	@ zero_extendqisi2
	strb	r1, [r4, #34]
	ldrb	r1, [r3, #2985]	@ zero_extendqisi2
	strb	r1, [r4, #33]
	ldrb	ip, [r3, #3001]	@ zero_extendqisi2
	ldr	r1, [r7, #4004]
	add	r1, r1, ip
	ldrb	r1, [r1, #1029]	@ zero_extendqisi2
	strb	r1, [r4, #30]
	ldr	r1, [r7, #4000]
	ldrb	ip, [r3, #3001]	@ zero_extendqisi2
	add	r1, r1, ip
	ldrb	r1, [r1, #1029]	@ zero_extendqisi2
	strb	r1, [r4, #29]
	ldrb	r1, [r3, #2973]	@ zero_extendqisi2
	strb	r1, [r4, #31]
	ldrb	r1, [r3, #2991]	@ zero_extendqisi2
	strb	r1, [r4, #32]
	ldrb	r1, [r3, #2984]	@ zero_extendqisi2
	strb	r1, [r4, #35]
	ldrb	r1, [r3, #2808]	@ zero_extendqisi2
	strb	r1, [r4, #36]
	ldrb	r1, [r3, #2980]	@ zero_extendqisi2
	strb	r1, [r4, #37]
	ldrb	r1, [r3, #2982]	@ zero_extendqisi2
	strb	r1, [r4, #38]
	ldrb	r1, [r3, #2983]	@ zero_extendqisi2
	strb	r1, [r4, #39]
	ldrb	r1, [r3, #2981]	@ zero_extendqisi2
	strb	r1, [r4, #40]
	ldrb	r1, [r3, #2997]	@ zero_extendqisi2
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #46]
	ldrb	r1, [r3, #2995]	@ zero_extendqisi2
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #42]
	ldrb	r1, [r3, #2999]	@ zero_extendqisi2
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #44]
	ldrb	r1, [r3, #3000]	@ zero_extendqisi2
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #41]
	ldrb	r1, [r3, #2994]	@ zero_extendqisi2
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #43]
	ldrb	r1, [r3, #2998]	@ zero_extendqisi2
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #47]
	ldrb	r1, [r3, #2996]	@ zero_extendqisi2
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #45]
	ldrb	r1, [r3, #2962]	@ zero_extendqisi2
	strb	r1, [r4, #50]
	ldrb	r1, [r3, #2979]	@ zero_extendqisi2
	strb	r1, [r4, #49]
	ldrb	r1, [r3, #2978]	@ zero_extendqisi2
	strb	r1, [r4, #48]
	ldrb	r1, [r3, #2989]	@ zero_extendqisi2
	strb	r1, [r4, #53]
	ldrb	r1, [r3, #2986]	@ zero_extendqisi2
	strb	r1, [r4, #54]
	ldrb	r1, [r3, #2987]	@ zero_extendqisi2
	strb	r1, [r4, #51]
	ldrb	r1, [r3, #2988]	@ zero_extendqisi2
	strb	r1, [r4, #52]
	ldr	r1, [r3, #3108]
	str	r1, [r2, #84]
	ldr	r1, [r5, #48]
	str	r1, [r2, #88]
	ldr	r1, [r5, #52]
	str	r1, [r2, #92]
	ldrb	r1, [r3, #2813]	@ zero_extendqisi2
	strb	r1, [r4, #55]
	ldrb	r1, [r3, #2814]	@ zero_extendqisi2
	strb	r1, [r4, #56]
	ldrb	r1, [r3, #2815]	@ zero_extendqisi2
	strb	r1, [r4, #57]
	ldrb	r1, [r3, #2816]	@ zero_extendqisi2
	strb	r1, [r4, #58]
	ldr	r1, [r3, #3004]
	cmp	r1, #3
	beq	.L161
	ldrb	r1, [r3, #2813]	@ zero_extendqisi2
	strb	r1, [r0, #325]
	ldrb	r1, [r3, #2814]	@ zero_extendqisi2
	strb	r1, [r0, #326]
	ldrb	r1, [r3, #2815]	@ zero_extendqisi2
	strb	r1, [r0, #327]
	ldrb	r1, [r3, #2816]	@ zero_extendqisi2
	strb	r1, [r0, #328]
.L147:
	ldrb	r3, [r3, #2628]	@ zero_extendqisi2
	strb	r3, [r0, #330]
	ldrb	r3, [r8, #460]	@ zero_extendqisi2
	strb	r3, [r4, #63]
	b	.L148
.L150:
	cmp	r1, #1
	beq	.L162
	cmp	r1, #2
	movne	r2, #1
	strb	r2, [r4, #20]
	b	.L151
.L141:
	cmp	r2, #1
	beq	.L163
	cmp	r2, #2
	moveq	r2, #0
	movne	r2, #1
	strb	r2, [r4, #20]
	b	.L142
.L163:
	ldrb	r2, [r3, #2971]	@ zero_extendqisi2
	adds	r2, r2, #0
	movne	r2, #1
	strb	r2, [r4, #20]
	b	.L142
.L162:
	ldrb	r2, [r3, #2868]	@ zero_extendqisi2
	adds	r2, r2, #0
	movne	r2, #1
	strb	r2, [r4, #20]
	b	.L151
.L161:
	ldrb	r1, [r3, #3001]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L146
	ldrb	r1, [r3, #2813]	@ zero_extendqisi2
	strb	r1, [r0, #325]
	ldrb	r1, [r3, #2814]	@ zero_extendqisi2
	strb	r1, [r0, #326]
	ldrb	r1, [r3, #2815]	@ zero_extendqisi2
	strb	r1, [r0, #327]
	ldrb	r1, [r3, #2816]	@ zero_extendqisi2
	strb	r1, [r0, #328]
	ldrb	r1, [r3, #3001]	@ zero_extendqisi2
.L146:
	cmp	r1, #1
	bne	.L147
	ldrb	r1, [r3, #2813]	@ zero_extendqisi2
	strb	r1, [r0, #320]
	ldrb	r1, [r3, #2814]	@ zero_extendqisi2
	strb	r1, [r0, #321]
	ldrb	r1, [r3, #2815]	@ zero_extendqisi2
	strb	r1, [r0, #322]
	ldrb	r1, [r3, #2816]	@ zero_extendqisi2
	strb	r1, [r0, #323]
	b	.L147
.L160:
	ldr	ip, [r7, #4056]
	mov	r9, #1680
	ldr	r1, [r7, #4072]
	ldrb	lr, [r3, #2863]	@ zero_extendqisi2
	mla	ip, r9, ip, r8
	sub	lr, lr, #2
	mla	r1, r9, r1, r8
	tst	lr, #253
	add	ip, ip, #14400
	ldrneb	lr, [r3, #2862]	@ zero_extendqisi2
	add	r1, r1, #14400
	ldrb	r9, [ip, #2]	@ zero_extendqisi2
	ldrb	ip, [r1, #2]	@ zero_extendqisi2
	movne	r1, lr
	moveq	r1, ip
	moveq	lr, ip
	b	.L154
.L158:
	movw	r2, #927
	ldr	r1, .L164+4
	mov	r0, #22
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L165:
	.align	2
.L164:
	.word	s_pstVfmwChan
	.word	.LC29
	UNWIND(.fnend)
	.size	VC1_WritePicMsg, .-VC1_WritePicMsg
	.align	2
	.global	VC1_WriteSliceMsg
	.type	VC1_WriteSliceMsg, %function
VC1_WriteSliceMsg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r3, r0, #20480
	mov	r2, r1
	ldr	ip, .L167
	add	r1, r0, #24064
	ldr	lr, [r3, #3652]
	add	r0, r2, #84
	add	r1, r1, #72
	ldr	ip, [ip, #52]
	strb	lr, [r2, #70]
	ldr	r3, [r3, #3652]
	mov	r2, r3, asl #6
	sub	r2, r2, r3, asl #4
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	ip
.L168:
	.align	2
.L167:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VC1_WriteSliceMsg, .-VC1_WriteSliceMsg
	.align	2
	.global	VC1_CfgVDH
	.type	VC1_CfgVDH, %function
VC1_CfgVDH:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldrb	r3, [r0, #3096]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L170
	add	r3, r0, #8192
	ldr	r3, [r3, #2556]
	cmp	r3, #3
	beq	.L175
.L170:
	add	r3, r0, #32768
	add	r6, r1, #12288
	ldr	r3, [r3, #3728]
	sub	r3, r3, #1
	str	r3, [r6, #164]
.L171:
	add	r5, r0, #20480
	ldr	r3, [r6, #260]
	mov	r4, #1680
	mov	ip, #0
	ldr	r2, [r5, #3592]
	and	lr, r3, #1
	cmp	r2, #0
	add	r3, r2, #63
	movlt	r2, r3
	mov	r2, r2, asr #6
	mov	r2, r2, asl #4
	add	r3, r2, #536870913
	add	r3, r3, #81920
	orr	r3, r3, lr, asl #30
	str	r3, [r6, #168]
	ldr	lr, [r5, #3624]
	ldr	r3, [r5, #3608]
	ldr	r2, [r5, #3552]
	mla	lr, r4, lr, r0
	mla	r0, r4, r3, r0
	ldr	r2, [r2, #1092]
	add	r3, lr, #15040
	and	r2, r2, #3
	ldr	r3, [r3, #4]
	add	r0, r0, #15040
	mov	r2, r2, asl #4
	ldr	r0, [r0, #4]
	and	r3, r3, #3
	strb	ip, [r1, #69]
	orr	r3, r2, r3, asl #2
	and	r2, r0, #3
	orr	r3, r3, r2
	strb	r3, [r1, #68]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L175:
	add	r2, r0, #32768
	add	r6, r1, #12288
	ldr	r3, [r2, #3724]
	ldr	r2, [r2, #3720]
	add	r3, r3, #1
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	mul	r3, r2, r3
	sub	r3, r3, #1
	str	r3, [r6, #164]
	b	.L171
	UNWIND(.fnend)
	.size	VC1_CfgVDH, .-VC1_CfgVDH
	.align	2
	.global	VC1_Vfmw_GenerateDecPara
	.type	VC1_Vfmw_GenerateDecPara, %function
VC1_Vfmw_GenerateDecPara:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_Vfmw_GenerateDecPara, .-VC1_Vfmw_GenerateDecPara
	.align	2
	.global	VC1DEC_GetImageBuffer
	.type	VC1DEC_GetImageBuffer, %function
VC1DEC_GetImageBuffer:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r4, r0, #0
	beq	.L189
	add	r3, r4, #12288
	ldrb	r2, [r3, #451]	@ zero_extendqisi2
	cmp	r2, #3
	beq	.L190
.L180:
	add	r5, r4, #49152
	ldr	r0, [r5, #528]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	beq	.L181
	ldr	r0, [r5, #528]
	bl	FSP_IsNewFsAvalible
	cmn	r0, #1
	beq	.L191
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L190:
	ldrb	r3, [r3, #457]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L180
.L181:
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L191:
	ldr	r0, [r5, #528]
	add	r1, r5, #176
	bl	FSP_ClearNotInVoQueue
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L189:
	ldr	r3, .L192
	movw	r2, #1805
	ldr	r1, .L192+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L193:
	.align	2
.L192:
	.word	.LC23
	.word	.LC24
	UNWIND(.fnend)
	.size	VC1DEC_GetImageBuffer, .-VC1DEC_GetImageBuffer
	.align	2
	.global	VC1_Vfmw_GetImageBuffer
	.type	VC1_Vfmw_GetImageBuffer, %function
VC1_Vfmw_GetImageBuffer:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r6, r0, #49152
	add	r4, r0, #32768
	mov	r5, r0
	mov	r1, #1
	ldr	r0, [r6, #528]
	bl	FSP_NewLogicFs
	cmp	r0, #0
	str	r0, [r4, #4092]
	blt	.L214
	add	r3, r5, #26624
	add	r3, r3, #64
	mov	r2, r3
	ldrh	r3, [r3]
	cmp	r3, #0
	beq	.L198
	add	r3, r5, #28160
	add	lr, r5, #35072
	add	r3, r3, #208
	add	lr, lr, #16
.L201:
	ldrh	ip, [r3]
	mov	r2, r3
	add	r3, r3, #1680
	cmp	ip, #0
	beq	.L198
	cmp	r3, lr
	bne	.L201
	mov	r1, r0
	mov	r2, #1
	ldr	r0, [r6, #528]
	bl	FSP_ClearLogicFs
	ldr	r1, .L215
	mov	r0, #1
	bl	dprint_vfmw
	add	r3, r5, #26624
	add	r5, r5, #35072
	add	r3, r3, #65
	add	r5, r5, #17
	mov	r2, #0
.L203:
	strb	r2, [r3]
	add	r3, r3, #1680
	strb	r2, [r3, #-1681]
	cmp	r3, r5
	bne	.L203
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L198:
	mov	r3, #0
	str	r2, [r4, #4000]
	mov	r1, #1
	strb	r1, [r2, #1]
.L200:
	ldr	r1, [r4, #4000]
	uxtb	r2, r3
	add	r1, r1, r3
	strb	r2, [r1, #3]
	ldr	r1, [r4, #4000]
	add	r1, r1, r3
	strb	r2, [r1, #259]
	ldr	r1, [r4, #4000]
	add	r1, r1, r3
	strb	r2, [r1, #515]
	ldr	r1, [r4, #4000]
	add	r1, r1, r3
	add	r3, r3, #1
	cmp	r3, #256
	strb	r2, [r1, #771]
	bne	.L200
	mov	r0, #1
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L214:
	ldr	r1, .L215+4
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r1, [r4, #4088]
	ldr	r0, [r6, #528]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L196
	ldr	r1, [r7, #544]
	add	r9, r7, #560
	ldr	r0, [r6, #528]
	add	r8, r7, #576
	bl	FreeUsdByDec
	ldr	r1, [r7, #552]
	ldr	r0, [r6, #528]
	add	r10, r7, #544
	bl	FreeUsdByDec
	ldr	r1, [r7, #560]
	ldr	r0, [r6, #528]
	bl	FreeUsdByDec
	ldr	r1, [r7, #568]
	ldr	r0, [r6, #528]
	bl	FreeUsdByDec
	mov	r0, #0
	mov	r1, #0
	mov	r2, #1
	strd	r0, [r10]
	strd	r0, [r9, #-8]
	strd	r0, [r9]
	strd	r0, [r8, #-8]
	ldr	r1, [r4, #4088]
	ldr	r0, [r6, #528]
	bl	FSP_ClearLogicFs
	mov	r2, #1
	ldr	r1, [r4, #4084]
	ldr	r0, [r6, #528]
	bl	FSP_ClearLogicFs
	mov	r3, #0
	str	r3, [r4, #4084]
	str	r3, [r4, #4088]
	ldr	r0, [r6, #528]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #4088]
	str	r0, [r4, #4084]
.L196:
	add	r1, r5, #49152
	mov	r5, #0
	add	r1, r1, #176
	str	r5, [r4, #4080]
	ldr	r0, [r6, #528]
	bl	FSP_ClearNotInVoQueue
	ldr	r1, .L215+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L216:
	.align	2
.L215:
	.word	.LC32
	.word	.LC30
	.word	.LC31
	UNWIND(.fnend)
	.size	VC1_Vfmw_GetImageBuffer, .-VC1_Vfmw_GetImageBuffer
	.align	2
	.global	VC1_Vfmw_MemMove
	.type	VC1_Vfmw_MemMove, %function
VC1_Vfmw_MemMove:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r0, r0, #20480
	ldr	ip, .L218
	ldr	r3, [r0, #3572]
	ldr	r2, [r0, #3592]
	add	r3, r3, #1
	ldr	r1, [r0, #3556]
	ldr	r0, [r0, #3552]
	add	r3, r3, r3, lsr #31
	ldr	ip, [ip, #52]
	ldr	r1, [r1, #1544]
	mov	r3, r3, asr #1
	ldr	r0, [r0, #1544]
	mov	r3, r3, asl #5
	mul	r3, r2, r3
	add	r2, r3, r3, lsl #1
	mov	r2, r2, asr #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	ip
.L219:
	.align	2
.L218:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VC1_Vfmw_MemMove, .-VC1_Vfmw_MemMove
	.align	2
	.global	VC1_Vfmw_BuildRefList
	.type	VC1_Vfmw_BuildRefList, %function
VC1_Vfmw_BuildRefList:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 536
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #540)
	sub	sp, sp, #540
	mov	r10, r0
	mov	r4, r1
	mov	r8, r2
	mov	r1, #0
	mov	r2, #256
	sub	r0, fp, #556
	mov	r9, r3
	bl	memset
	sub	r0, fp, #300
	mov	r2, #256
	mov	r1, #0
	bl	memset
	cmp	r10, #0
	beq	.L283
	ldr	r5, .L297
	add	r0, r10, #24064
	mov	r2, #16
	mov	r1, #0
	add	r0, r0, #16
	ldr	r3, [r5, #48]
	blx	r3
	add	r0, r10, #24064
	ldr	r3, [r5, #48]
	add	r0, r0, #32
	mov	r2, #16
	mov	r1, #0
	blx	r3
	ldrsb	r3, [r10, #4]
	bics	r3, r3, #2
	bne	.L223
	cmp	r4, #1
	beq	.L284
	cmp	r4, #2
	addne	r3, r10, #20480
	beq	.L285
.L231:
	mov	r0, #1
	mov	r2, #0
	str	r2, [r3, #3620]
	str	r2, [r3, #3604]
.L265:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L223:
	add	r5, r10, #8192
	ldrb	r3, [r5, #2516]	@ zero_extendqisi2
	cmp	r3, #1
	ldrb	r3, [r5, #2553]	@ zero_extendqisi2
	beq	.L286
	cmp	r3, #0
	add	r3, r10, #20480
	beq	.L287
.L241:
	ldr	r2, [r3, #3560]
	ldr	r6, [r2, #1188]
	mov	r7, r6
.L240:
	cmp	r4, #1
	beq	.L288
.L242:
	cmp	r4, #2
	bne	.L231
	cmp	r8, #0
	mov	r1, #0
	mov	r2, #1
	str	r4, [r3, #3620]
	str	r4, [r3, #3604]
	strb	r1, [r3, #3600]
	strb	r2, [r3, #3601]
	bne	.L289
.L254:
	ldr	r2, [r3, #3560]
	ldr	lr, [r3, #3552]
	ldr	ip, [r2, #1188]
.L281:
	ldr	r0, [r3, #3556]
	mov	r1, #1
	str	ip, [r3, #3608]
	mov	r2, #0
	strb	r1, [r3, #3617]
	strb	r2, [r3, #3616]
	ldr	r1, [r0, #1188]
	str	r1, [r3, #3624]
	ldr	r0, [r0, #1188]
	str	r0, [r3, #3628]
	ldr	r0, [r5, #2640]
	ldr	r7, [lr, #1188]
	cmp	r0, #1
	bls	.L290
	bics	r0, r0, #2
	beq	.L260
.L259:
	mov	lr, #1680
	mov	r2, #0
	mul	r7, lr, r7
	str	r2, [fp, #-572]
	mul	r1, lr, r1
	mov	r3, r10
	mul	r0, lr, ip
	add	r2, r7, #13952
	str	r2, [fp, #-568]
	add	r2, r7, #14208
	str	r2, [fp, #-560]
	add	ip, r1, #14720
	ldr	r2, [fp, #-568]
	add	r9, r0, #13952
	add	r5, r1, #13952
	add	r4, r1, #14208
	add	r2, r2, #2
	str	r2, [fp, #-568]
	ldr	r2, [fp, #-560]
	add	lr, r1, #14464
	add	ip, ip, #2
	add	r1, r7, #14464
	add	r8, r0, #14208
	add	r6, r0, #14464
	add	r2, r2, #2
	add	r1, r1, #2
	add	r0, r0, #14720
	str	r1, [fp, #-576]
	add	r7, r7, #14720
	add	r1, r10, ip
	add	r9, r9, #2
	ldr	ip, [fp, #-568]
	add	r9, r10, r9
	add	r6, r6, #2
	add	r0, r0, #2
	add	r5, r5, #2
	add	r4, r4, #2
	add	lr, lr, #2
	add	r7, r7, #2
	str	r9, [fp, #-560]
	add	r9, r10, r2
	ldr	r2, [fp, #-576]
	add	r8, r8, #2
	add	r6, r10, r6
	add	r0, r10, r0
	add	r5, r10, r5
	add	r4, r10, r4
	add	lr, r10, lr
	add	ip, r10, ip
	add	r7, r10, r7
	add	r8, r10, r8
	str	r8, [fp, #-564]
	add	r8, r10, r2
	mov	r2, #0
	str	r1, [fp, #-568]
.L261:
	ldr	r1, [fp, #-560]
	add	r2, r2, #1
	cmp	r2, #256
	add	r3, r3, #1
	ldrb	r10, [r1, #1]!	@ zero_extendqisi2
	str	r1, [fp, #-560]
	ldr	r1, [fp, #-564]
	strb	r10, [r3, #13]
	ldrb	r10, [r1, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #269]
	ldrb	r10, [r6, #1]!	@ zero_extendqisi2
	str	r1, [fp, #-564]
	ldr	r1, [fp, #-568]
	strb	r10, [r3, #525]
	ldrb	r10, [r0, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #781]
	ldrb	r10, [r5, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #1037]
	ldrb	r10, [r4, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #1293]
	ldrb	r10, [lr, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #1549]
	ldrb	r10, [r1, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #1805]
	ldrb	r10, [ip, #1]!	@ zero_extendqisi2
	str	r1, [fp, #-568]
	strb	r10, [r3, #2061]
	ldrb	r10, [r9, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #2317]
	ldrb	r10, [r8, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #2573]
	ldrb	r10, [r7, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #2829]
	bne	.L261
	mov	r0, #1
.L294:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L287:
	ldr	r1, [r3, #3560]
	cmp	r4, #1
	ldr	r2, [r3, #3556]
	ldr	r6, [r1, #1188]
	ldr	r7, [r2, #1188]
	bne	.L242
.L288:
	ldrb	r2, [r5, #2544]	@ zero_extendqisi2
	cmp	r8, #0
	mov	r1, #0
	strb	r4, [r3, #3601]
	add	r2, r2, #1
	str	r1, [r3, #3620]
	str	r2, [r3, #3604]
	strb	r1, [r3, #3600]
	beq	.L243
	cmp	r9, r1
	beq	.L291
.L243:
	ldr	r2, [r3, #3560]
	ldr	r1, [r3, #3552]
	ldr	r4, [r2, #1188]
.L280:
	str	r4, [r3, #3608]
	ldr	r2, [r2, #1188]
	str	r2, [r3, #3612]
	ldr	r3, [r5, #2640]
	ldr	r8, [r1, #1188]
	cmp	r3, #1
	bls	.L292
.L247:
	bics	r2, r3, #2
	bne	.L248
	ldrb	r2, [r5, #2526]	@ zero_extendqisi2
	cmp	r2, #4
	beq	.L293
.L248:
	mov	r1, #1680
	mov	r3, r10
	mul	r4, r1, r4
	mov	r2, #0
	mul	r8, r1, r8
	add	r7, r4, #13952
	add	r6, r4, #14208
	add	r5, r4, #14464
	add	r0, r4, #14720
	add	lr, r8, #14208
	add	r4, r8, #13952
	add	ip, r8, #14464
	add	r8, r8, #14720
	add	r7, r7, #2
	add	r6, r6, #2
	add	r5, r5, #2
	add	r0, r0, #2
	add	r4, r4, #2
	add	lr, lr, #2
	add	ip, ip, #2
	add	r8, r8, #2
	add	r7, r10, r7
	add	r6, r10, r6
	add	r5, r10, r5
	add	r0, r10, r0
	add	r4, r10, r4
	add	lr, r10, lr
	add	ip, r10, ip
	add	r1, r10, r8
.L253:
	ldrb	r8, [r7, #1]!	@ zero_extendqisi2
	add	r2, r2, #1
	cmp	r2, #256
	add	r3, r3, #1
	strb	r8, [r3, #13]
	ldrb	r8, [r6, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #269]
	ldrb	r8, [r5, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #525]
	ldrb	r8, [r0, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #781]
	ldrb	r8, [r4, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #2061]
	ldrb	r8, [lr, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #2317]
	ldrb	r8, [ip, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #2573]
	ldrb	r8, [r1, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #2829]
	bne	.L253
	mov	r0, #1
	b	.L294
.L286:
	cmp	r3, #0
	add	r3, r10, #20480
	beq	.L241
	ldr	r1, [r3, #3556]
	ldr	r2, [r3, #3560]
	ldr	r6, [r1, #1188]
	ldr	r7, [r2, #1188]
	b	.L240
.L284:
	add	r2, r10, #20480
	ldr	r1, [r2, #3560]
	str	r4, [r2, #3604]
	str	r3, [r2, #3620]
	strb	r3, [r2, #3600]
	ldr	r4, [r1, #1188]
	str	r4, [r2, #3608]
	ldrb	r3, [r10, #3096]	@ zero_extendqisi2
	cmp	r3, #0
	add	r3, r10, #8192
	beq	.L225
	ldr	r2, [r3, #2556]
	ldrb	r5, [r3, #2528]	@ zero_extendqisi2
	cmp	r2, #2
	ldrb	r6, [r3, #2529]	@ zero_extendqisi2
	ldrb	r2, [r3, #2526]	@ zero_extendqisi2
	beq	.L295
.L226:
	cmp	r2, #4
	beq	.L227
.L228:
	mov	r3, #1680
	add	r5, r10, #268
	mul	r3, r3, r4
	add	lr, r10, #780
	add	r4, r10, #524
	add	r5, r5, #1
	add	r4, r4, #1
	add	lr, lr, #1
	add	ip, r3, #13952
	add	r0, r3, #14208
	add	r1, r3, #14464
	add	ip, ip, #2
	add	r3, r3, #14720
	add	r0, r0, #2
	add	r1, r1, #2
	add	r3, r3, #2
	add	ip, r10, ip
	add	r0, r10, r0
	add	r1, r10, r1
	add	r6, r10, #13
	add	r2, r10, r3
	mov	r3, #0
.L230:
	ldrb	r7, [ip, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r3, #256
	strb	r7, [r6, #1]!
	ldrb	r7, [r0, #1]!	@ zero_extendqisi2
	strb	r7, [r5, #1]!
	ldrb	r7, [r1, #1]!	@ zero_extendqisi2
	strb	r7, [r4, #1]!
	ldrb	r7, [r2, #1]!	@ zero_extendqisi2
	strb	r7, [lr, #1]!
	bne	.L230
	mov	r0, #1
	b	.L294
.L285:
	add	r2, r10, #20480
	mov	r1, #1
	ldr	r0, [r2, #3560]
	str	r1, [r2, #3620]
	str	r1, [r2, #3604]
	strb	r3, [r2, #3600]
	ldr	r1, [r2, #3556]
	ldr	r4, [r0, #1188]
	strb	r3, [r2, #3616]
	str	r4, [r2, #3608]
	ldr	r3, [r1, #1188]
	str	r3, [r2, #3624]
	str	r3, [fp, #-560]
	ldrb	r3, [r10, #3096]	@ zero_extendqisi2
	cmp	r3, #0
	add	r3, r10, #8192
	ldrneb	r5, [r3, #2528]	@ zero_extendqisi2
	ldrneb	r6, [r3, #2529]	@ zero_extendqisi2
	ldreqb	r5, [r3, #2425]	@ zero_extendqisi2
	ldreqb	r6, [r3, #2426]	@ zero_extendqisi2
	ldrneb	r3, [r3, #2526]	@ zero_extendqisi2
	ldreqb	r3, [r3, #2423]	@ zero_extendqisi2
	cmp	r3, #4
	beq	.L296
.L234:
	ldr	r0, [fp, #-560]
	mov	r1, #1680
	mul	r4, r1, r4
	mov	r3, r10
	mul	r0, r1, r0
	mov	r2, #0
	add	r7, r4, #13952
	add	r6, r4, #14208
	add	r5, r4, #14464
	add	r1, r4, #14720
	add	lr, r0, #14208
	add	r4, r0, #13952
	add	ip, r0, #14464
	add	r0, r0, #14720
	add	r7, r7, #2
	add	r6, r6, #2
	add	r5, r5, #2
	add	r1, r1, #2
	add	r4, r4, #2
	add	lr, lr, #2
	add	ip, ip, #2
	add	r0, r0, #2
	add	r7, r10, r7
	add	r6, r10, r6
	add	r5, r10, r5
	add	r1, r10, r1
	add	r4, r10, r4
	add	lr, r10, lr
	add	ip, r10, ip
	add	r0, r10, r0
.L236:
	ldrb	r8, [r7, #1]!	@ zero_extendqisi2
	add	r2, r2, #1
	cmp	r2, #256
	add	r3, r3, #1
	strb	r8, [r3, #13]
	ldrb	r8, [r6, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #269]
	ldrb	r8, [r5, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #525]
	ldrb	r8, [r1, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #781]
	ldrb	r8, [r4, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #1037]
	ldrb	r8, [lr, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #1293]
	ldrb	r8, [ip, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #1549]
	ldrb	r8, [r0, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #1805]
	bne	.L236
	mov	r0, #1
	b	.L294
.L283:
	ldr	r1, .L297+4
	mov	r0, r10
	bl	dprint_vfmw
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L225:
	ldrb	r5, [r3, #2425]	@ zero_extendqisi2
	ldrb	r6, [r3, #2426]	@ zero_extendqisi2
	ldrb	r2, [r3, #2423]	@ zero_extendqisi2
	b	.L226
.L289:
	cmp	r9, r1
	bne	.L254
	ldr	lr, [r3, #3552]
	ldr	ip, [lr, #1188]
	b	.L281
.L260:
	ldrb	r3, [r5, #2526]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L259
	b	.L265
.L291:
	ldr	r1, [r3, #3552]
	ldr	r2, [r3, #3560]
	ldr	r4, [r1, #1188]
	b	.L280
.L295:
	ldr	r3, [r3, #2632]
	cmp	r3, #1
	bne	.L226
.L227:
	mov	r1, r5
	sub	r0, fp, #556
	mov	r3, #0
	mov	r2, r6
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	r1, r5
	mov	r2, r6
	sub	r0, fp, #300
	mov	r3, #1
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	r3, #1680
	mul	r3, r3, r4
	mov	ip, #0
	add	lr, r3, #13952
	add	r0, r3, #14208
	add	r1, r3, #14464
	add	lr, lr, #2
	add	r3, r3, #14720
	add	lr, r10, lr
	add	r0, r0, #3
	add	r1, r1, #3
	add	r3, r3, #3
	add	r0, r10, r0
	add	r1, r10, r1
	add	r2, r10, r3
	mov	r5, lr
.L229:
	ldrb	r3, [lr, #1]!	@ zero_extendqisi2
	sub	r6, fp, #44
	add	ip, ip, #1
	add	r3, r6, r3
	cmp	ip, #256
	ldrb	r3, [r3, #-512]	@ zero_extendqisi2
	strb	r3, [r5, #1]!
	ldrb	r3, [r0]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r3, [r3, #-256]	@ zero_extendqisi2
	strb	r3, [r0], #1
	ldrb	r3, [r1]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r3, [r3, #-512]	@ zero_extendqisi2
	strb	r3, [r1], #1
	ldrb	r3, [r2]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r3, [r3, #-256]	@ zero_extendqisi2
	strb	r3, [r2], #1
	bne	.L229
	b	.L228
.L293:
	cmp	r3, #0
	sub	r0, fp, #556
	mov	r3, #0
	ldreqb	r6, [r5, #2644]	@ zero_extendqisi2
	ldrneb	r6, [r5, #2528]	@ zero_extendqisi2
	ldreqb	r5, [r5, #2648]	@ zero_extendqisi2
	ldrneb	r5, [r5, #2529]	@ zero_extendqisi2
	mov	r1, r6
	mov	r2, r5
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	r2, r5
	mov	r1, r6
	sub	r0, fp, #300
	mov	r3, #1
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	r2, #1680
	mul	r2, r2, r7
	mov	r1, #0
	add	r0, r2, #14464
	add	r2, r2, #14720
	add	r0, r0, #2
	add	r2, r2, #3
	add	r0, r10, r0
	add	r2, r10, r2
	mov	ip, r0
.L252:
	ldrb	r3, [r0, #1]!	@ zero_extendqisi2
	sub	lr, fp, #44
	add	r1, r1, #1
	add	r3, lr, r3
	cmp	r1, #256
	ldrb	r3, [r3, #-512]	@ zero_extendqisi2
	strb	r3, [ip, #1]!
	ldrb	r3, [r2]	@ zero_extendqisi2
	add	r3, lr, r3
	ldrb	r3, [r3, #-256]	@ zero_extendqisi2
	strb	r3, [r2], #1
	bne	.L252
	b	.L248
.L292:
	ldrb	r3, [r5, #2526]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L248
	ldrb	r9, [r5, #2528]	@ zero_extendqisi2
	mov	r3, #0
	ldrb	r2, [r5, #2529]	@ zero_extendqisi2
	sub	r0, fp, #556
	mov	r1, r9
	str	r2, [fp, #-560]
	bl	VC1_Vfmw_GenerateIntensityMap
	ldr	r2, [fp, #-560]
	mov	r1, r9
	sub	r0, fp, #300
	mov	r3, #1
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	r2, #1680
	mul	r2, r2, r6
	mov	r1, #0
	add	r0, r2, #13952
	add	r2, r2, #14208
	add	r0, r0, #2
	add	r2, r2, #3
	add	r0, r10, r0
	add	r2, r10, r2
	mov	ip, r0
.L249:
	ldrb	r3, [r0, #1]!	@ zero_extendqisi2
	sub	lr, fp, #44
	add	r1, r1, #1
	add	r3, lr, r3
	cmp	r1, #256
	ldrb	r3, [r3, #-512]	@ zero_extendqisi2
	strb	r3, [ip, #1]!
	ldrb	r3, [r2]	@ zero_extendqisi2
	add	r3, lr, r3
	ldrb	r3, [r3, #-256]	@ zero_extendqisi2
	strb	r3, [r2], #1
	bne	.L249
	ldr	r3, [r5, #2640]
	b	.L247
.L290:
	ldrb	r3, [r5, #2526]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L259
	mov	r0, r2
	b	.L265
.L296:
	mov	r2, r6
	mov	r1, r5
	sub	r0, fp, #556
	mov	r3, #0
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	r2, r6
	mov	r1, r5
	sub	r0, fp, #300
	mov	r3, #1
	mov	r7, #0
	bl	VC1_Vfmw_GenerateIntensityMap
	ldr	r3, [fp, #-560]
	mov	r2, #1680
	str	r4, [fp, #-564]
	mul	r1, r2, r4
	mul	r2, r2, r3
	add	r8, r1, #13952
	add	r6, r1, #14208
	add	r5, r1, #14464
	add	r8, r8, #2
	add	lr, r2, #13952
	add	ip, r2, #14208
	add	r0, r2, #14464
	add	r1, r1, #14720
	add	r2, r2, #14720
	add	r8, r10, r8
	add	r6, r6, #3
	add	r5, r5, #3
	add	r1, r1, #3
	add	lr, lr, #3
	add	ip, ip, #3
	add	r0, r0, #3
	add	r2, r2, #3
	add	r6, r10, r6
	add	r5, r10, r5
	add	r1, r10, r1
	add	lr, r10, lr
	add	ip, r10, ip
	add	r0, r10, r0
	add	r2, r10, r2
	mov	r9, r8
.L235:
	ldrb	r3, [r8, #1]!	@ zero_extendqisi2
	sub	r4, fp, #44
	add	r7, r7, #1
	add	r3, r4, r3
	cmp	r7, #256
	ldrb	r3, [r3, #-512]	@ zero_extendqisi2
	strb	r3, [r9, #1]!
	ldrb	r3, [r6]	@ zero_extendqisi2
	add	r3, r4, r3
	ldrb	r3, [r3, #-256]	@ zero_extendqisi2
	strb	r3, [r6], #1
	ldrb	r3, [r5]	@ zero_extendqisi2
	add	r3, r4, r3
	ldrb	r3, [r3, #-512]	@ zero_extendqisi2
	strb	r3, [r5], #1
	ldrb	r3, [r1]	@ zero_extendqisi2
	add	r3, r4, r3
	ldrb	r3, [r3, #-256]	@ zero_extendqisi2
	strb	r3, [r1], #1
	ldrb	r3, [lr]	@ zero_extendqisi2
	add	r3, r4, r3
	ldrb	r3, [r3, #-512]	@ zero_extendqisi2
	strb	r3, [lr], #1
	ldrb	r3, [ip]	@ zero_extendqisi2
	add	r3, r4, r3
	ldrb	r3, [r3, #-256]	@ zero_extendqisi2
	strb	r3, [ip], #1
	ldrb	r3, [r0]	@ zero_extendqisi2
	add	r3, r4, r3
	ldrb	r3, [r3, #-512]	@ zero_extendqisi2
	strb	r3, [r0], #1
	ldrb	r3, [r2]	@ zero_extendqisi2
	add	r3, r4, r3
	ldrb	r3, [r3, #-256]	@ zero_extendqisi2
	strb	r3, [r2], #1
	bne	.L235
	ldr	r4, [fp, #-564]
	b	.L234
.L298:
	.align	2
.L297:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC33
	UNWIND(.fnend)
	.size	VC1_Vfmw_BuildRefList, .-VC1_Vfmw_BuildRefList
	.align	2
	.global	VC1_Vfmw_GetStreamInfo
	.type	VC1_Vfmw_GetStreamInfo, %function
VC1_Vfmw_GetStreamInfo:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #44)
	sub	sp, sp, #44
	add	r6, r0, #12288
	add	r4, r0, #32768
	mov	r5, r0
	ldrb	r3, [r6, #3544]	@ zero_extendqisi2
	ldr	r7, [r4, #4016]
	cmp	r3, #0
	beq	.L300
	add	r3, r0, #20480
	ldr	r8, [r4, #4020]
	movw	r2, #3338
	movw	r1, #3336
	ldr	r3, [r3, #3004]
	cmp	r3, #3
	add	r3, r0, #12736
	addeq	r8, r8, #1
	ldrh	r2, [r3, r2]
	addeq	r8, r8, r8, lsr #31
	ldrh	r3, [r3, r1]
	moveq	r8, r8, asr #1
	adds	r1, r2, #15
	addmi	r1, r2, #30
	adds	r0, r3, #15
	mul	r8, r8, r7
	addmi	r0, r3, #30
	mov	r1, r1, asr #4
	mov	r0, r0, asr #4
.L352:
	mov	r2, r0, asl #4
	movw	ip, #8160
	sub	r3, r2, #32
	cmp	r3, ip
	mov	r3, r1, asl #4
	bhi	.L303
	sub	lr, r3, #32
	cmp	lr, ip
	bhi	.L303
	ldr	r3, [r4, #4028]
	cmp	r3, r1
	beq	.L385
.L306:
	ldr	r2, [r4, #4020]
	mov	r3, r7, asl #4
	add	r3, r3, #63
	str	r7, [r4, #4024]
	bic	r3, r3, #63
	str	r3, [r4, #4040]
	str	r2, [r4, #4028]
	ldrb	r3, [r6, #456]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L314
	mov	r3, #1
.L308:
	ldrb	r2, [r6, #451]	@ zero_extendqisi2
	cmp	r2, #3
	beq	.L386
.L311:
	ldrb	r2, [r6, #448]	@ zero_extendqisi2
	eor	r2, r2, #8
	ubfx	r2, r2, #3, #1
	orrs	r3, r3, r2
	bne	.L314
.L318:
	mov	r0, r5
	bl	VC1_Vfmw_GetImageBuffer
	subs	r9, r0, #0
	beq	.L387
	add	r9, r5, #49152
	ldr	r1, [r4, #4092]
	ldr	r0, [r9, #528]
	bl	FSP_GetFsImagePtr
	subs	lr, r0, #0
	beq	.L320
	ldr	r3, [r5]
	add	ip, lr, #592
	add	r10, lr, #608
	ldr	r1, .L394
	mov	r0, #29
	ldrd	r2, [r3, #64]
	strd	r2, [ip, #-8]
	ldr	r3, [r5]
	ldrd	r2, [r3, #80]
	strd	r2, [ip]
	ldr	r3, [r5]
	ldrd	r2, [r3, #96]
	strd	r2, [r10, #-8]
	mvn	r2, #0
	ldr	r10, [r5]
	mvn	r3, #0
	ldr	r10, [r10, #112]
	str	r10, [lr]
	ldr	r10, [r5]
	ldr	r10, [r10, #116]
	str	r10, [lr, #4]
	ldr	r10, [r5]
	ldr	r10, [r10, #120]
	str	r10, [lr, #8]
	ldr	r10, [r5]
	ldr	r10, [r10, #136]
	str	r10, [lr, #12]
	ldr	lr, [r5]
	strd	r2, [lr, #64]
	ldrd	r2, [ip]
	strd	r2, [fp, #-60]
	ldrd	r2, [ip, #-8]
	strd	r2, [fp, #-52]
	ldrd	r2, [fp, #-60]
	strd	r2, [sp]
	ldrd	r2, [fp, #-52]
	bl	dprint_vfmw
.L320:
	ldrb	r3, [r6, #3544]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L321
	add	r3, r5, #20480
	ldr	r3, [r3, #3004]
	cmp	r3, #3
	beq	.L388
.L321:
	ldr	r3, [r4, #4000]
	mov	r2, #0
	str	r2, [r3, #1092]
.L322:
	ldr	r3, [r4, #4000]
	mov	r2, #0
	strb	r2, [r3, #2]
	ldrb	r3, [r6, #3544]	@ zero_extendqisi2
	cmp	r3, r2
	bne	.L323
	add	r3, r5, #20480
	ldrb	r2, [r3, #2624]	@ zero_extendqisi2
	cmp	r2, #1
	ldreqb	r2, [r3, #2862]	@ zero_extendqisi2
	ldreq	r3, [r4, #4000]
	streqb	r2, [r3, #2]
.L323:
	ldrb	r3, [r6, #450]	@ zero_extendqisi2
	cmp	r3, #5
	cmpne	r3, #1
	ldr	r3, [r4, #4080]
	movls	r10, #1
	movhi	r10, #0
	bhi	.L324
	cmp	r3, #0
	ldr	r2, [r4, #4084]
	ldr	r3, [r4, #4088]
	movne	r1, #2
	moveq	r1, #1
	cmp	r2, r3
	str	r1, [r4, #4080]
	beq	.L326
	ldr	r1, .L394+4
	mov	r0, #13
	bl	dprint_vfmw
	mov	r2, #0
	ldr	r1, [r4, #4084]
	ldr	r0, [r9, #528]
	bl	FSP_SetRef
	ldr	r3, [r4, #4088]
.L326:
	ldr	r1, [r4, #4092]
	mov	r2, #1
	str	r3, [r4, #4084]
	str	r1, [r4, #4088]
	ldr	r0, [r9, #528]
	bl	FSP_SetRef
	ldr	r1, [r4, #4084]
	ldr	r0, [r9, #528]
	bl	FSP_RemovePmv
	ldrb	r3, [r6, #450]	@ zero_extendqisi2
	cmp	r3, #5
	cmpne	r3, #1
	bhi	.L328
	ldr	r3, [r4, #4008]
	mov	r1, #0
	mov	r2, #1
	strb	r1, [r3]
	ldr	r3, [r4, #4000]
	strb	r2, [r3]
	ldr	r2, [r4, #4004]
	ldr	r3, [r4, #4000]
	str	r2, [r4, #4008]
	str	r3, [r4, #4004]
.L328:
	ldr	r1, [r4, #4092]
	ldr	r0, [r9, #528]
	bl	FSP_GetLogicFs
	ldr	r1, [r4, #4084]
	str	r0, [fp, #-52]
	ldr	r0, [r9, #528]
	bl	FSP_GetLogicFs
	ldr	r1, [r4, #4088]
	mov	r10, r0
	ldr	r0, [r9, #528]
	bl	FSP_GetLogicFs
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	cmpne	r10, #0
	moveq	r2, #1
	movne	r2, #0
	cmp	r0, #0
	orreq	r2, r2, #1
	str	r0, [fp, #-52]
	cmp	r2, #0
	bne	.L389
	ldrb	r2, [r6, #3544]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L390
.L334:
	mov	r2, #0
.L379:
	str	r2, [r3, #92]
	ldrb	r2, [r6, #450]	@ zero_extendqisi2
	cmp	r2, #5
	beq	.L391
.L336:
	ldr	r1, [r3, #28]
	cmp	r1, #0
	beq	.L337
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L337
	ldr	r2, [fp, #-52]
	mov	r9, #0
	ldr	r2, [r2, #28]
	cmp	r2, #0
	ldreq	r2, [r1, #8]
	ldrne	r2, [r2, #8]
	str	r2, [r6, #112]
	ldr	r2, [r10, #28]
	cmp	r2, #0
	ldreq	r2, [r3, #28]
	ldr	r2, [r2, #8]
	str	r2, [r6, #108]
	ldr	r2, [r3, #28]
	ldr	r2, [r2, #8]
	str	r2, [r6, #236]
	ldr	r2, [r3, #8]
	str	r2, [r6, #116]
	ldr	r2, [fp, #-52]
	ldr	r2, [r2, #8]
	str	r2, [r6, #120]
	ldr	r2, [r3, #32]
	ldr	r2, [r2, #8]
	str	r2, [r6, #104]
	ldr	r2, [r3, #32]
	ldr	r2, [r2, #28]
	str	r2, [r6, #184]
	ldr	r2, [r3, #32]
	ldr	r2, [r2, #32]
	str	r2, [r6, #188]
	ldr	r2, [r3, #32]
	ldr	r2, [r2, #64]
	str	r2, [r6, #192]
	ldr	r2, [r3, #32]
	ldr	r2, [r2, #48]
	str	r2, [r6, #196]
	ldr	r2, [r3, #32]
	ldr	r2, [r2, #52]
	str	r2, [r6, #200]
	ldr	r3, [r3, #28]
	ldr	r10, [r4, #4000]
	ldr	r0, [r3, #8]
	bl	MEM_Phy2Vir
	str	r9, [r10, #1548]
	str	r0, [r10, #1544]
	ldr	r0, [r6, #108]
	ldr	r10, [r4, #4008]
	bl	MEM_Phy2Vir
	str	r9, [r10, #1548]
	str	r0, [r10, #1544]
	ldr	r0, [r6, #112]
	ldr	r10, [r4, #4004]
	bl	MEM_Phy2Vir
	str	r9, [r10, #1548]
	str	r0, [r10, #1544]
.L313:
	movw	r3, #3544
	ldrsb	r3, [r6, r3]
	cmp	r3, #0
	bne	.L343
	ldr	r1, [r4, #4000]
	add	r2, r5, #20480
	strb	r3, [r1, #1027]
	ldr	r1, [r4, #4000]
	ldrb	r0, [r2, #2863]	@ zero_extendqisi2
	strb	r0, [r1, #1028]
	ldrb	r0, [r2, #2871]	@ zero_extendqisi2
	ldr	r1, [r4, #4000]
	sub	ip, r0, #2
	cmp	ip, #1
	movls	r3, #1
	bls	.L344
	cmp	r0, #4
	beq	.L392
.L344:
	add	r7, r5, #36864
	add	r8, r5, #49152
	strb	r3, [r1, #1030]
	mov	r2, #1
	strb	r3, [r1, #1029]
	mov	r3, #0
	str	r2, [r7, #4]
	strb	r3, [r7, #16]
	ldr	r0, [r6, #3576]
	ldr	r9, [r8, #12]
	bl	BsPos
	add	r3, r0, #7
	cmp	r0, #0
	movlt	r0, r3
	add	r0, r9, r0, asr #3
	str	r0, [r7, #8]
	ldr	r0, [r6, #3576]
	ldr	r9, [r8, #24]
	bl	BsPos
	add	r3, r0, #7
	cmp	r0, #0
	movlt	r0, r3
	add	r0, r9, r0, asr #3
	str	r0, [r7, #20]
	ldr	r0, [r6, #3576]
	bl	BsPos
	and	r0, r0, #7
	str	r0, [r7, #24]
	ldr	r0, [r6, #3576]
	ldr	r9, [r8, #32]
	bl	BsPos
	mov	r9, r9, asl #3
	rsb	r0, r0, r9
	str	r0, [r7, #28]
	ldr	r2, [r8, #72]
	ldr	r3, [r8, #76]
	mul	r3, r3, r2
	sub	r3, r3, #1
	str	r3, [r7, #32]
	ldrb	r1, [r6, #450]	@ zero_extendqisi2
.L345:
	mov	r3, #1
	mov	r2, #0
	add	r0, r5, #12736
	bl	VC1_Vfmw_BuildRefList
	subs	r9, r0, #0
	movne	r9, #1
	bne	.L376
	add	r5, r5, #49152
	ldr	r1, [r4, #4092]
	mov	r2, #1
	ldr	r0, [r5, #528]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #4000]
	ldr	r1, .L394+8
	mov	r0, #1
	strb	r9, [r3]
	ldr	r3, [r4, #4000]
	strb	r9, [r3, #1]
	bl	dprint_vfmw
	b	.L376
.L303:
	ldr	r1, .L394+12
	mov	r0, #0
	bl	dprint_vfmw
	mov	r9, #0
.L376:
	mov	r0, r9
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L300:
	ldr	r1, [r4, #4020]
	mov	r0, r7
	mul	r8, r1, r7
	b	.L352
.L314:
	add	r9, r5, #49152
	add	r3, r5, #35072
	add	r3, r3, #16
	ldr	r1, [r4, #4088]
	str	r3, [r4, #4000]
	str	r3, [r4, #4012]
	str	r3, [r4, #4008]
	str	r3, [r4, #4004]
	ldr	r0, [r9, #528]
	bl	FSP_GetFsImagePtr
	subs	r2, r0, #0
	beq	.L310
	ldr	r1, [r2, #544]
	add	r3, r2, #576
	ldr	r0, [r9, #528]
	add	r10, r2, #560
	str	r3, [fp, #-52]
	str	r2, [fp, #-60]
	bl	FreeUsdByDec
	ldr	r2, [fp, #-60]
	ldr	r1, [r10, #-8]
	ldr	r0, [r9, #528]
	add	ip, r2, #544
	str	r2, [fp, #-64]
	str	ip, [fp, #-60]
	bl	FreeUsdByDec
	ldr	r2, [fp, #-64]
	ldr	r0, [r9, #528]
	ldr	r1, [r2, #560]
	bl	FreeUsdByDec
	ldr	r3, [fp, #-52]
	ldr	r0, [r9, #528]
	ldr	r1, [r3, #-8]
	bl	FreeUsdByDec
	ldr	ip, [fp, #-60]
	ldr	r3, [fp, #-52]
	mov	r0, #0
	mov	r1, #0
	mov	r2, #1
	strd	r0, [ip]
	strd	r0, [r10, #-8]
	strd	r0, [r10]
	strd	r0, [r3, #-8]
	ldr	r1, [r4, #4088]
	ldr	r0, [r9, #528]
	bl	FSP_ClearLogicFs
	mov	r2, #1
	ldr	r1, [r4, #4084]
	ldr	r0, [r9, #528]
	bl	FSP_ClearLogicFs
	mov	r3, #0
	str	r3, [r4, #4084]
	str	r3, [r4, #4088]
	ldr	r0, [r9, #528]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #4088]
	str	r0, [r4, #4084]
.L310:
	add	r3, r5, #26624
	add	r1, r5, #35072
	add	r3, r3, #65
	add	r1, r1, #17
	mov	r2, #0
	str	r2, [r4, #4080]
.L316:
	strb	r2, [r3]
	add	r3, r3, #1680
	strb	r2, [r3, #-1681]
	cmp	r3, r1
	bne	.L316
	add	r10, r5, #49152
	ldr	r0, [r9, #528]
	add	r10, r10, #176
	mov	r1, r10
	bl	FSP_ClearNotInVoQueue
	ldrb	r9, [r6, #448]	@ zero_extendqisi2
	and	r9, r9, #8
	ands	r9, r9, #255
	bne	.L318
	mov	r0, r10
	bl	ResetVoQueue
	ldr	r1, [r5]
	mov	r3, #2
	mov	r0, r5
	ldr	r2, [r1, #692]
	ldr	ip, [r1, #696]
	adds	r1, r2, #15
	addmi	r1, r2, #30
	adds	r2, ip, #15
	addmi	r2, ip, #30
	mov	r1, r1, asr #4
	str	r1, [r6, #276]
	mov	r2, r2, asr #4
	str	r2, [r6, #280]
	add	r2, r2, #1
	mov	r1, r1, asl #4
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	mov	r2, r2, asl #5
	bl	VC1_ArrangeVahbMem
	cmp	r0, #1
	bne	.L317
	ldrb	r3, [r6, #448]	@ zero_extendqisi2
	orr	r3, r3, #8
	strb	r3, [r6, #448]
	b	.L318
.L387:
	ldr	r1, .L394+16
	mov	r0, #1
	bl	dprint_vfmw
	b	.L376
.L385:
	ldr	r3, [r4, #4024]
	cmp	r3, r0
	bne	.L306
	mov	r3, r7, asl #4
	add	r3, r3, #63
	bic	r3, r3, #63
	str	r3, [r4, #4040]
	ldrb	r3, [r6, #456]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #0
	bne	.L308
	b	.L311
.L324:
	cmp	r3, #1
	bhi	.L328
	ldr	r0, [r9, #528]
	mov	r2, #1
	ldr	r1, [r4, #4092]
	mov	r9, r10
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #4000]
	ldr	r1, .L394+20
	mov	r0, #1
	strb	r10, [r3]
	ldr	r3, [r4, #4000]
	strb	r10, [r3, #1]
	bl	dprint_vfmw
	b	.L376
.L389:
	mov	r2, #1
	ldr	r1, [r4, #4092]
	ldr	r0, [r9, #528]
	str	r3, [fp, #-60]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #4000]
	mov	ip, #0
	mov	r0, ip
	ldr	r3, [fp, #-60]
	movw	r2, #2077
	strb	ip, [r1]
	ldr	lr, [r4, #4000]
	ldr	r1, .L394+24
	strb	ip, [lr, #1]
	ldr	ip, [fp, #-52]
	stmia	sp, {r10, ip}
	bl	dprint_vfmw
	ldrb	r3, [r6, #450]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L384
.L332:
	ldr	r1, .L394+28
	mov	r0, #1
	bl	dprint_vfmw
	mov	r9, #0
	b	.L376
.L343:
	add	lr, r5, #20480
	ldr	r3, [r4, #4000]
	ldr	r2, [lr, #3004]
	strb	r2, [r3, #1027]
	ldr	r3, [r4, #4000]
	ldrb	r2, [lr, #2961]	@ zero_extendqisi2
	strb	r2, [r3, #1028]
	ldrb	r2, [lr, #2974]	@ zero_extendqisi2
	ldr	r3, [r4, #4000]
	sub	r0, r2, #2
	ldrb	r1, [lr, #3001]	@ zero_extendqisi2
	cmp	r0, #1
	movls	r2, #1
	bls	.L346
	cmp	r2, #4
	movne	r2, #0
	beq	.L393
.L346:
	add	r3, r3, r1
	add	r1, r5, #36864
	strb	r2, [r3, #1029]
	ldr	ip, [r1, #4]
	cmp	ip, #0
	beq	.L347
	subs	ip, ip, #1
	addne	r2, r5, #36864
	movne	r1, #0
	addne	r2, r2, #16
	beq	.L381
.L350:
	ldr	r3, [r2, #64]
	add	r2, r2, #48
	strb	r1, [r2, #-48]
	add	r1, r1, #1
	cmp	r1, ip
	mul	r3, r3, r7
	movcs	r0, #0
	movcc	r0, #1
	cmp	r1, #254
	movgt	r0, #0
	cmp	r0, #0
	sub	r3, r3, #1
	str	r3, [r2, #-32]
	bne	.L350
	uxtb	r1, ip
.L349:
	mov	r3, ip, asl #6
	movw	r2, #24608
	sub	ip, r3, ip, asl #4
	movw	r3, #24592
	add	ip, r6, ip
	sub	r8, r8, #1
	str	r8, [ip, r2]
	strb	r1, [ip, r3]
	ldrb	r1, [r6, #450]	@ zero_extendqisi2
	cmp	r1, #2
	bne	.L345
	ldrb	r3, [lr, #2991]	@ zero_extendqisi2
	add	r0, r5, #49152
	ldr	r2, [lr, #3108]
	mul	r2, r2, r3
	mov	r2, r2, asr #8
	str	r2, [r0, #48]
	rsb	r3, r2, r3
	subs	r3, r3, #1
	movmi	r3, #0
	str	r3, [r0, #52]
	b	.L345
.L390:
	add	r2, r5, #20480
	ldr	r2, [r2, #3004]
	cmp	r2, #3
	bne	.L334
	ldr	r2, .L394+32
	ldr	r2, [r2]
	cmp	r2, #1
	bne	.L334
	b	.L379
.L337:
	mov	r2, #1
	ldr	r1, [r4, #4092]
	ldr	r0, [r9, #528]
	str	r3, [fp, #-52]
	bl	FSP_ClearLogicFs
	ldr	ip, [r4, #4000]
	mov	r2, #0
	ldr	r3, [fp, #-52]
	mov	r0, r2
	ldr	r1, .L394+36
	strb	r2, [ip]
	ldr	ip, [r4, #4000]
	strb	r2, [ip, #1]
	ldr	ip, [r3, #32]
	ldr	r2, [r4, #4092]
	str	ip, [sp, #8]
	ldr	lr, [r3, #28]
	mov	r3, r2
	ldr	ip, [r4, #4088]
	ldr	r2, [r4, #4084]
	stmia	sp, {ip, lr}
	bl	dprint_vfmw
	ldrb	r3, [r6, #450]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L332
.L384:
	ldr	r3, [r9, #92]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r9, #92]
	b	.L332
.L386:
	ldrb	r2, [r6, #457]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L313
	b	.L311
.L347:
	mov	r3, #1
	str	r3, [r1, #4]
.L381:
	mov	r1, ip
	b	.L349
.L391:
	ldr	r2, [r10, #92]
	str	r2, [r3, #92]
	ldr	r1, [r4, #4008]
	ldr	r2, [r4, #4000]
	ldr	r1, [r1, #1092]
	str	r1, [r2, #1092]
	ldr	r2, [r9, #92]
	add	r2, r2, #1
	str	r2, [r9, #92]
	b	.L336
.L388:
	ldr	r3, .L394+32
	ldr	r3, [r3]
	cmp	r3, #1
	ldreq	r2, [r4, #4000]
	streq	r3, [r2, #1092]
	bne	.L321
	b	.L322
.L317:
	ldr	r1, .L394+40
	mov	r0, #1
	bl	dprint_vfmw
	ldrb	r3, [r6, #448]	@ zero_extendqisi2
	bic	r3, r3, #8
	strb	r3, [r6, #448]
	b	.L376
.L393:
	ldrb	r2, [lr, #2975]	@ zero_extendqisi2
	sub	r2, r2, #2
	cmp	r2, #1
	movhi	r2, #0
	movls	r2, #1
	b	.L346
.L392:
	ldrb	r3, [r2, #2872]	@ zero_extendqisi2
	sub	r3, r3, #2
	cmp	r3, #1
	movhi	r3, #0
	movls	r3, #1
	b	.L344
.L395:
	.align	2
.L394:
	.word	.LC36
	.word	.LC37
	.word	.LC42
	.word	.LC25
	.word	.LC35
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	USE_FF_APT_EN
	.word	.LC41
	.word	.LC34
	UNWIND(.fnend)
	.size	VC1_Vfmw_GetStreamInfo, .-VC1_Vfmw_GetStreamInfo
	.align	2
	.global	VC1_Vfmw_PrepareDecode
	.type	VC1_Vfmw_PrepareDecode, %function
VC1_Vfmw_PrepareDecode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #0
	beq	.L400
	bl	VC1_Vfmw_GetStreamInfo
	subs	r4, r0, #0
	movne	r4, #1
	bne	.L398
	ldr	r1, .L401
	bl	dprint_vfmw
.L398:
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L400:
	ldr	r3, .L401+4
	movw	r2, #2253
	ldr	r1, .L401+8
	mvn	r4, #0
	bl	dprint_vfmw
	b	.L398
.L402:
	.align	2
.L401:
	.word	.LC44
	.word	.LC43
	.word	.LC24
	UNWIND(.fnend)
	.size	VC1_Vfmw_PrepareDecode, .-VC1_Vfmw_PrepareDecode
	.align	2
	.global	VC1_DecMvrange
	.type	VC1_DecMvrange, %function
VC1_DecMvrange:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #68)
	sub	sp, sp, #68
	ldr	lr, .L404
	mov	r4, r0
	sub	ip, fp, #84
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	mov	r0, r4
	mov	r1, #3
	bl	BsShow
	sub	r3, fp, #20
	add	r3, r3, r0, lsl #3
	mov	r0, r4
	ldr	r1, [r3, #-60]
	ldr	r4, [r3, #-64]
	bl	BsSkip
	mov	r0, r4
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L405:
	.align	2
.L404:
	.word	.LANCHOR0+16
	UNWIND(.fnend)
	.size	VC1_DecMvrange, .-VC1_DecMvrange
	.align	2
	.global	VC1_DecTransacfrm
	.type	VC1_DecTransacfrm, %function
VC1_DecTransacfrm:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #68)
	sub	sp, sp, #68
	mov	r2, #64
	mov	r4, r0
	mov	r1, #0
	sub	r0, fp, #84
	bl	memset
	mov	r3, #2
	mov	r1, r3
	mov	r0, r4
	mov	r2, #1
	str	r3, [fp, #-64]
	str	r3, [fp, #-60]
	str	r3, [fp, #-56]
	str	r2, [fp, #-80]
	str	r2, [fp, #-72]
	str	r2, [fp, #-68]
	bl	BsShow
	sub	r3, fp, #20
	add	r3, r3, r0, lsl #3
	mov	r0, r4
	ldr	r1, [r3, #-60]
	ldr	r4, [r3, #-64]
	bl	BsSkip
	mov	r0, r4
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_DecTransacfrm, .-VC1_DecTransacfrm
	.align	2
	.global	VC1_SetCurPicResolutionInfo
	.type	VC1_SetCurPicResolutionInfo, %function
VC1_SetCurPicResolutionInfo:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r3, r0, #20480
	cmp	r1, #1
	add	r0, r0, #32768
	ldr	r2, [r3, #3568]
	beq	.L409
	cmp	r1, #2
	beq	.L415
	cmp	r1, #0
	beq	.L414
	add	r2, r2, #1
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
.L415:
	str	r2, [r0, #3720]
	ldr	r3, [r3, #3572]
	add	r3, r3, #1
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	str	r3, [r0, #3724]
	b	.L412
.L409:
	add	r2, r2, #1
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
.L414:
	str	r2, [r0, #3720]
	ldr	r3, [r3, #3572]
	str	r3, [r0, #3724]
.L412:
	mul	r1, r3, r2
	mov	r2, r2, asl #4
	mov	r3, r3, asl #4
	str	r2, [r0, #3712]
	str	r3, [r0, #3716]
	str	r1, [r0, #3728]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_SetCurPicResolutionInfo, .-VC1_SetCurPicResolutionInfo
	.align	2
	.global	VC1_DecMvmodeProgrP
	.type	VC1_DecMvmodeProgrP, %function
VC1_DecMvmodeProgrP:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #44)
	sub	sp, sp, #44
	mov	r5, r1
	mov	r1, #4
	mov	r6, r0
	bl	BsShow
	ldr	ip, .L427
	sub	r4, fp, #76
	sub	lr, fp, #56
	mov	r7, r0
	cmp	r0, #1
	ldmia	ip!, {r0, r1, r2, r3}
	ldr	r8, [ip], #4
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	str	r8, [r4]
	ldr	ip, [ip]
	stmia	lr!, {r0, r1, r2, r3}
	str	ip, [lr]
	ble	.L425
	cmp	r7, #3
	movle	r1, #3
	movle	r4, #2
	bgt	.L426
.L418:
	mov	r0, r6
	bl	BsSkip
	sub	r3, fp, #36
	add	r4, r3, r4, lsl #2
	cmp	r5, #12
	ldrhi	r0, [r4, #-40]
	ldrls	r0, [r4, #-20]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L426:
	cmp	r7, #8
	movlt	r1, #2
	movge	r1, #1
	movlt	r4, #1
	movge	r4, #0
	b	.L418
.L425:
	cmp	r7, #0
	mov	r1, #4
	moveq	r4, #3
	movne	r4, r1
	b	.L418
.L428:
	.align	2
.L427:
	.word	.LANCHOR0+80
	UNWIND(.fnend)
	.size	VC1_DecMvmodeProgrP, .-VC1_DecMvmodeProgrP
	.align	2
	.global	VC1_DecMvmodeProgrB
	.type	VC1_DecMvmodeProgrB, %function
VC1_DecMvmodeProgrB:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	mov	r1, #1
	bl	BsSkip
	ldr	r2, .L430
	sub	r3, fp, #12
	add	r3, r3, r0, lsl #2
	ldmia	r2, {r0, r1}
	sub	r2, fp, #12
	stmdb	r2, {r0, r1}
	ldr	r0, [r3, #-8]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L431:
	.align	2
.L430:
	.word	.LANCHOR0+120
	UNWIND(.fnend)
	.size	VC1_DecMvmodeProgrB, .-VC1_DecMvmodeProgrB
	.align	2
	.global	VC1_DecMvmodeInterB
	.type	VC1_DecMvmodeInterB, %function
VC1_DecMvmodeInterB:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #40)
	sub	sp, sp, #40
	mov	r5, r1
	mov	r1, #3
	mov	r6, r0
	bl	BsShow
	ldr	r3, .L440
	mov	r2, #0
	str	r2, [fp, #-44]
	str	r2, [fp, #-32]
	sub	lr, fp, #64
	mov	ip, #1
	mov	r4, #3
	str	ip, [fp, #-48]
	mov	ip, #2
	str	r4, [fp, #-36]
	str	ip, [fp, #-40]
	mov	r7, r0
	cmp	r0, #1
	ldmia	r3, {r0, r1, r2, r3}
	stmia	lr, {r0, r1, r2, r3}
	ble	.L439
	cmp	r7, #4
	movlt	r1, #2
	movge	r1, #1
	movlt	r4, #1
	movge	r4, #0
.L434:
	mov	r0, r6
	bl	BsSkip
	sub	r3, fp, #28
	add	ip, r3, r4, lsl #2
	cmp	r5, #12
	ldrhi	r0, [ip, #-36]
	ldrls	r0, [ip, #-20]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L439:
	cmp	r7, #0
	mov	r1, r4
	movne	r4, ip
	b	.L434
.L441:
	.align	2
.L440:
	.word	.LANCHOR0+128
	UNWIND(.fnend)
	.size	VC1_DecMvmodeInterB, .-VC1_DecMvmodeInterB
	.align	2
	.global	VC1_DecMvmode2
	.type	VC1_DecMvmode2, %function
VC1_DecMvmode2:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	mov	r5, r1
	mov	r1, #3
	mov	r6, r0
	bl	BsShow
	ldr	r3, .L451
	sub	lr, fp, #60
	add	ip, r3, #16
	mov	r4, r0
	cmp	r0, #1
	ldmia	r3, {r0, r1, r2, r3}
	stmia	lr, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1, r2, r3}
	sub	ip, fp, #28
	stmdb	ip, {r0, r1, r2, r3}
	ble	.L450
	cmp	r4, #4
	movlt	r1, #2
	movge	r1, #1
	movlt	r4, #1
	movge	r4, #0
.L444:
	mov	r0, r6
	bl	BsSkip
	sub	r3, fp, #28
	add	r4, r3, r4, lsl #2
	cmp	r5, #12
	ldrhi	r0, [r4, #-32]
	ldrls	r0, [r4, #-16]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L450:
	cmp	r4, #0
	mov	r1, #3
	moveq	r4, r1
	movne	r4, #2
	b	.L444
.L452:
	.align	2
.L451:
	.word	.LANCHOR0+128
	UNWIND(.fnend)
	.size	VC1_DecMvmode2, .-VC1_DecMvmode2
	.align	2
	.global	VC1_DecBfractionSMP
	.type	VC1_DecBfractionSMP, %function
VC1_DecBfractionSMP:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 208
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #212)
	sub	sp, sp, #212
	ldr	ip, .L459
	mov	r8, r0
	str	r1, [fp, #-248]
	str	r2, [fp, #-252]
	sub	r10, fp, #244
	ldmia	ip!, {r0, r1, r2, r3}
	sub	r7, fp, #216
	sub	r4, fp, #156
	sub	lr, fp, #100
	sub	r6, fp, #188
	add	r9, ip, #12
	add	r5, ip, #40
	stmia	r10!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1, r2}
	stmia	r10, {r0, r1, r2}
	ldmia	r9!, {r0, r1, r2, r3}
	stmia	r7!, {r0, r1, r2, r3}
	ldmia	r9, {r0, r1, r2}
	add	r9, ip, #96
	add	ip, ip, #152
	stmia	r7, {r0, r1, r2}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5, {r0, r1}
	stmia	r4, {r0, r1}
	ldmia	r9!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r9!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r9!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r9, {r0, r1}
	stmia	lr, {r0, r1}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	r6!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1, r2, r3}
	stmia	r6, {r0, r1, r2, r3}
	mov	r0, r8
	mov	r1, #3
	bl	BsShow
	mov	r4, r0
	cmp	r4, #6
	mov	r0, r8
	bgt	.L454
	mov	r1, #3
	bl	BsSkip
	sub	r3, fp, #44
	add	r3, r3, r4, lsl #2
	ldr	r1, [r3, #-200]
	ldr	r2, [r3, #-172]
.L455:
	sub	r3, fp, #44
	mov	r0, r4
	add	r2, r3, r2, lsl #2
	ldr	r3, [r2, #-148]
	ldr	r2, [fp, #-248]
	mul	r3, r3, r1
	str	r3, [r2]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L454:
	mov	r1, #7
	bl	BsGet
	and	r4, r0, #15
	cmp	r4, #15
	beq	.L458
	sub	r0, r0, #112
	sub	r3, fp, #44
	add	r4, r4, #7
	add	r0, r3, r0, lsl #2
	ldr	r1, [r0, #-112]
	ldr	r2, [r0, #-56]
	b	.L455
.L458:
	ldr	r2, [fp, #-252]
	mov	r3, #4
	mov	r0, #22
	strb	r3, [r2]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L460:
	.align	2
.L459:
	.word	.LANCHOR0+160
	UNWIND(.fnend)
	.size	VC1_DecBfractionSMP, .-VC1_DecBfractionSMP
	.align	2
	.global	VC1_DecBfraction
	.type	VC1_DecBfraction, %function
VC1_DecBfraction:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 208
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #220)
	sub	sp, sp, #220
	ldr	r5, .L469
	mov	r8, r0
	str	r1, [fp, #-248]
	sub	r10, fp, #244
	sub	r7, fp, #216
	ldmia	r5!, {r0, r1, r2, r3}
	sub	lr, fp, #156
	sub	ip, fp, #100
	sub	r6, fp, #188
	add	r9, r5, #12
	add	r4, r5, #40
	stmia	r10!, {r0, r1, r2, r3}
	ldmia	r5, {r0, r1, r2}
	stmia	r10, {r0, r1, r2}
	ldmia	r9!, {r0, r1, r2, r3}
	stmia	r7!, {r0, r1, r2, r3}
	ldmia	r9, {r0, r1, r2}
	add	r9, r5, #96
	stmia	r7, {r0, r1, r2}
	add	r7, r5, #152
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4, {r0, r1}
	stmia	lr, {r0, r1}
	ldmia	r9!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r9!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r9!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r9, {r0, r1}
	stmia	ip, {r0, r1}
	ldmia	r7!, {r0, r1, r2, r3}
	stmia	r6!, {r0, r1, r2, r3}
	ldmia	r7, {r0, r1, r2, r3}
	stmia	r6, {r0, r1, r2, r3}
	mov	r0, r8
	mov	r1, #3
	bl	BsShow
	mov	r4, r0
	cmp	r4, #6
	mov	r0, r8
	bgt	.L462
	mov	r1, #3
	bl	BsSkip
	sub	r3, fp, #44
	add	r2, r3, r4, lsl #2
	ldr	r1, [r2, #-200]
	ldr	r2, [r2, #-172]
	sub	r3, r2, #1
	cmp	r3, #7
	bhi	.L466
.L468:
	sub	r2, fp, #44
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #-144]
	mul	r3, r3, r1
.L467:
	ldr	r2, [fp, #-248]
	str	r3, [r2]
.L464:
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L462:
	mov	r1, #7
	bl	BsGet
	and	r4, r0, #15
	sub	r3, r4, #14
	add	r4, r4, #7
	cmp	r3, #1
	bls	.L464
	sub	r3, r0, #112
	cmp	r3, #13
	bhi	.L465
	sub	r2, fp, #44
	add	r2, r2, r3, lsl #2
	ldr	r1, [r2, #-112]
	ldr	r2, [r2, #-56]
	sub	r3, r2, #1
	cmp	r3, #7
	bls	.L468
.L466:
	str	r2, [sp]
	movw	r3, #3234
	ldr	r2, .L469+4
	mov	r0, #1
	ldr	r1, .L469+8
	bl	dprint_vfmw
	mov	r3, #0
	b	.L467
.L465:
	str	r0, [sp]
	add	r2, r5, #184
	movw	r3, #3224
	ldr	r1, .L469+12
	mov	r0, #1
	bl	dprint_vfmw
	mov	r2, #0
	b	.L466
.L470:
	.align	2
.L469:
	.word	.LANCHOR0+160
	.word	.LANCHOR0+360
	.word	.LC46
	.word	.LC45
	UNWIND(.fnend)
	.size	VC1_DecBfraction, .-VC1_DecBfraction
	.align	2
	.global	VC1_VopDQuant
	.type	VC1_VopDQuant, %function
VC1_VopDQuant:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #2
	mov	r6, r2
	mov	r4, r3
	mov	r7, r0
	beq	.L489
	mov	r1, #1
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4]
	cmp	r5, #1
	beq	.L490
.L475:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L489:
	mov	r3, #1
	mov	r1, #3
	strb	r3, [r4, #3]
	strb	r3, [r4]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #4]
	cmp	r0, #7
	addne	r6, r6, #1
	addne	r0, r0, r6
	strneb	r0, [r4, #8]
	beq	.L491
.L474:
	mov	r3, #1
	mov	r0, #1
	str	r3, [r4, #12]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L490:
	mov	r1, #2
	mov	r0, r7
	bl	BsGet
	uxtb	r1, r0
	strb	r1, [r4, #1]
	cmp	r1, #0
	streq	r5, [r4, #12]
	beq	.L478
	cmp	r1, #2
	beq	.L492
	cmp	r1, #1
	beq	.L493
	cmp	r1, #3
	movne	r3, #0
	strne	r3, [r4, #12]
	beq	.L494
.L478:
	ldr	r3, [r4]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #768
	beq	.L475
	mov	r3, #1
	mov	r1, #3
	strb	r3, [r4, #3]
	mov	r0, r7
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #4]
	cmp	r0, #7
	addne	r6, r6, #1
	addne	r6, r0, r6
	strneb	r6, [r4, #8]
	bne	.L475
	mov	r0, r7
	mov	r1, #5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #5]
	strb	r0, [r4, #8]
	b	.L475
.L494:
	mov	r1, r5
	mov	r0, r7
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #2]
	cmp	r0, #0
	movne	r3, #10
	moveq	r3, #11
	str	r3, [r4, #12]
	b	.L478
.L491:
	mov	r0, r7
	mov	r1, #5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #5]
	strb	r0, [r4, #8]
	b	.L474
.L492:
	mov	r0, r7
	bl	BsGet
	uxtb	r3, r0
	strb	r0, [r4, #6]
	add	r3, r3, #6
	str	r3, [r4, #12]
	b	.L478
.L493:
	mov	r1, #2
	mov	r0, r7
	bl	BsGet
	uxtb	r3, r0
	strb	r0, [r4, #7]
	add	r3, r3, #2
	str	r3, [r4, #12]
	b	.L478
	UNWIND(.fnend)
	.size	VC1_VopDQuant, .-VC1_VopDQuant
	.align	2
	.global	VC1_DecNormDiff6Tile
	.type	VC1_DecNormDiff6Tile, %function
VC1_DecNormDiff6Tile:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r9, [r1]
	mov	r8, r1
	mov	r5, r0
	mov	r6, #0
.L496:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #3
	subs	r7, r0, #0
	mov	r0, r5
	bne	.L505
	bl	BsGet
	mov	r4, r0
	cmp	r4, #1
	mov	r1, r0
	mov	r0, r5
	bgt	.L515
	bne	.L499
	bl	BsGet
	cmp	r0, #0
	beq	.L500
	cmp	r6, #0
	mov	r6, r4
	beq	.L496
.L513:
	str	r9, [r8]
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L505:
	mov	r0, #0
.L497:
	cmp	r6, #0
	mov	r7, #1
	eorne	r0, r0, #63
.L514:
	str	r0, [r8]
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L515:
	sub	r4, r4, #2
	mov	r0, #1
	mov	r0, r0, asl r4
	b	.L497
.L499:
	mov	r0, r5
	mov	r1, #4
	bl	BsGet
	cmp	r0, #255
	beq	.L513
	ldr	r3, .L516
	add	r3, r3, r0, lsl #2
	ldr	r0, [r3, #508]
	b	.L497
.L500:
	mov	r0, r5
	mov	r1, #5
	bl	BsGet
	ldr	r3, .L516
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #380]
	cmp	r3, #2
	orreq	r0, r0, #32
	beq	.L497
	cmp	r3, #3
	bne	.L514
	b	.L497
.L517:
	.align	2
.L516:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VC1_DecNormDiff6Tile, .-VC1_DecNormDiff6Tile
	.align	2
	.global	VC1_Vfmw_ParseSMPIPicHdr
	.type	VC1_Vfmw_ParseSMPIPicHdr, %function
VC1_Vfmw_ParseSMPIPicHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	mov	r8, r1
	mov	r1, #7
	mov	r4, r2
	mov	r6, r0
	bl	BsGet
	mov	r1, #5
	strb	r0, [r4, #253]
	mov	r0, r6
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4, #254]
	cmp	r5, #0
	beq	.L519
	ldrb	r7, [r4, #14]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L534
	sub	r0, fp, #164
	bl	memcpy
	cmp	r7, #0
	mov	r3, r5
	subeq	r3, fp, #36
	addeq	r3, r3, r5, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r5, #8
	str	r3, [r4, #340]
	movhi	r3, #0
	strhib	r3, [r4, #255]
	bls	.L531
.L522:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #256]
	beq	.L532
.L524:
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strneb	r3, [r4, #257]
	beq	.L533
.L526:
	ldrb	r3, [r4, #251]	@ zero_extendqisi2
	sub	r3, r3, #2
	tst	r3, #253
	bne	.L527
.L529:
	ldrb	r1, [r4, #258]	@ zero_extendqisi2
.L528:
	mov	r0, r8
	mov	r5, #1
	bl	VC1_SetCurPicResolutionInfo
	mov	r0, r6
	bl	VC1_DecTransacfrm
	strb	r0, [r4, #267]
	mov	r0, r6
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #268]
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #269]
.L519:
	mov	r0, r5
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L527:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L529
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	uxtb	r1, r0
	strb	r1, [r4, #258]
	b	.L528
.L531:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	ldrb	r7, [r4, #14]	@ zero_extendqisi2
	strb	r0, [r4, #255]
	b	.L522
.L532:
	mov	r1, r7
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #256]
	b	.L524
.L533:
	mov	r0, r6
	bl	VC1_DecMvrange
	strb	r0, [r4, #257]
	b	.L526
.L535:
	.align	2
.L534:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseSMPIPicHdr, .-VC1_Vfmw_ParseSMPIPicHdr
	.align	2
	.global	VC1_Vfmw_ParseSMPPPicHdr
	.type	VC1_Vfmw_ParseSMPPPicHdr, %function
VC1_Vfmw_ParseSMPPPicHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	mov	r7, r1
	mov	r1, #5
	mov	r4, r2
	mov	r5, r0
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r4, #254]
	cmp	r6, #0
	beq	.L549
	ldrb	r8, [r4, #14]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L566
	sub	r0, fp, #164
	bl	memcpy
	cmp	r8, #0
	mov	r3, r6
	subeq	r3, fp, #36
	addeq	r3, r3, r6, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r6, #8
	str	r3, [r4, #340]
	movhi	r3, #0
	strhib	r3, [r4, #255]
	bls	.L560
.L541:
	cmp	r8, #1
	movne	r3, #0
	strneb	r3, [r4, #256]
	beq	.L561
.L543:
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strneb	r3, [r4, #257]
	beq	.L562
.L545:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L546
	ldrb	r1, [r4, #258]	@ zero_extendqisi2
.L547:
	mov	r0, r7
	bl	VC1_SetCurPicResolutionInfo
	mov	r0, r5
	bl	BsPos
	ldr	r1, .L566+4
	mov	r2, r0
	mov	r0, #18
	bl	dprint_vfmw
	ldrb	r1, [r4, #340]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_DecMvmodeProgrP
	uxtb	r0, r0
	strb	r0, [r4, #259]
	cmp	r0, #4
	beq	.L563
.L548:
	mov	r1, r7
	mov	r3, #0
	mov	r2, r4
	mov	r0, r5
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L549
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	mov	r1, #2
	strb	r0, [r4, #263]
	mov	r0, r5
	bl	BsGet
	ldrb	r1, [r4, #8]	@ zero_extendqisi2
	cmp	r1, #0
	strb	r0, [r4, #264]
	bne	.L564
.L550:
	mov	r0, r5
	bl	BsPos
	ldr	r1, .L566+8
	mov	r2, r0
	mov	r0, #18
	bl	dprint_vfmw
	ldrb	r1, [r4, #9]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L565
.L552:
	mov	r0, r5
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #267]
	mov	r0, r5
	bl	BsGet
	mov	r3, #1
	strb	r0, [r4, #269]
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L549:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L560:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r8, [r4, #14]	@ zero_extendqisi2
	strb	r0, [r4, #255]
	b	.L541
.L564:
	add	r3, r4, #272
	ldrb	r2, [r4, #340]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_VopDQuant
	b	.L550
.L562:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #257]
	b	.L545
.L546:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	uxtb	r1, r0
	strb	r1, [r4, #258]
	b	.L547
.L561:
	mov	r1, r8
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #256]
	b	.L543
.L563:
	ldrb	r1, [r4, #340]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_DecMvmode2
	mov	r1, #6
	strb	r0, [r4, #260]
	mov	r0, r5
	bl	BsGet
	mov	r1, #6
	strb	r0, [r4, #261]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #262]
	b	.L548
.L565:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #265]
	cmp	r0, #1
	bne	.L552
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #266]
	b	.L552
.L567:
	.align	2
.L566:
	.word	.LANCHOR0+568
	.word	.LC47
	.word	.LC48
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseSMPPPicHdr, .-VC1_Vfmw_ParseSMPPPicHdr
	.align	2
	.global	VC1_Vfmw_ParseMPBPicHdr
	.type	VC1_Vfmw_ParseMPBPicHdr, %function
VC1_Vfmw_ParseMPBPicHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	mov	r8, r1
	mov	r1, #5
	mov	r4, r2
	mov	r6, r0
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4, #254]
	cmp	r5, #0
	beq	.L579
	ldrb	r7, [r4, #14]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L596
	sub	r0, fp, #164
	bl	memcpy
	cmp	r7, #0
	mov	r3, r5
	subeq	r3, fp, #36
	addeq	r3, r3, r5, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r5, #8
	str	r3, [r4, #340]
	movhi	r3, #0
	strhib	r3, [r4, #255]
	bls	.L591
.L573:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #256]
	beq	.L592
.L575:
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strneb	r3, [r4, #257]
	beq	.L593
.L577:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	mov	r3, #0
	mov	r1, r8
	mov	r2, r4
	cmp	r0, r3
	mov	r0, r6
	moveq	ip, #3
	movne	ip, #1
	strb	ip, [r4, #259]
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L579
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	mov	r1, #2
	strb	r0, [r4, #263]
	mov	r0, r6
	bl	BsGet
	ldrb	r1, [r4, #8]	@ zero_extendqisi2
	cmp	r1, #0
	strb	r0, [r4, #264]
	bne	.L594
.L580:
	ldrb	r1, [r4, #9]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L595
.L582:
	mov	r0, r6
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #267]
	mov	r0, r6
	bl	BsGet
	mov	r3, #1
	strb	r0, [r4, #269]
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L579:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L591:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	ldrb	r7, [r4, #14]	@ zero_extendqisi2
	strb	r0, [r4, #255]
	b	.L573
.L594:
	add	r3, r4, #272
	ldrb	r2, [r4, #340]	@ zero_extendqisi2
	mov	r0, r6
	bl	VC1_VopDQuant
	b	.L580
.L592:
	mov	r1, r7
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #256]
	b	.L575
.L593:
	mov	r0, r6
	bl	VC1_DecMvrange
	strb	r0, [r4, #257]
	b	.L577
.L595:
	mov	r0, r6
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #265]
	cmp	r0, #1
	bne	.L582
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #266]
	b	.L582
.L597:
	.align	2
.L596:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseMPBPicHdr, .-VC1_Vfmw_ParseMPBPicHdr
	.align	2
	.global	VC1_Vfmw_ParseSMPPicHdr
	.type	VC1_Vfmw_ParseSMPPicHdr, %function
VC1_Vfmw_ParseSMPPicHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldrb	r7, [r2, #258]	@ zero_extendqisi2
	mov	r5, r0
	mov	r6, r1
	mov	r0, r1
	mov	r4, r2
	mov	r1, r7
	bl	VC1_SetCurPicResolutionInfo
	ldr	r3, [r5, #16]
	cmp	r3, #1
	ble	.L636
	ldr	r9, .L641
	mov	r2, #100
	mov	r1, #0
	add	r0, r4, #248
	add	r8, r6, #32768
	ldr	r3, [r9, #48]
	blx	r3
	add	r0, r6, #24064
	ldr	r3, [r9, #48]
	mov	r2, #12288
	mov	r1, #0
	add	r0, r0, #72
	strb	r7, [r4, #258]
	blx	r3
	ldr	r2, [r8, #3656]
	ldr	r1, .L641+4
	mov	r0, #18
	bl	dprint_vfmw
	mov	r0, r5
	bl	BsPos
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r4, #324]
	bne	.L601
	ldrb	r2, [r4, #248]	@ zero_extendqisi2
.L602:
	ldr	r1, .L641+8
	mov	r0, #18
	bl	dprint_vfmw
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	ldrb	r3, [r4, #12]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #249]
	bne	.L637
.L603:
	ldrb	r3, [r4, #13]	@ zero_extendqisi2
	mov	r1, #1
	mov	r0, r5
	cmp	r3, #0
	bne	.L604
	bl	BsGet
	adds	r0, r0, #0
	movne	r0, #1
	strb	r0, [r4, #251]
.L605:
	mov	r3, #0
	strb	r0, [r6, #2]
	strb	r3, [r6, #4]
	ldrb	r3, [r4, #251]	@ zero_extendqisi2
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L617
.L610:
	.word	.L609
	.word	.L611
	.word	.L612
	.word	.L617
	.word	.L613
.L613:
	ldrb	r7, [r6, #3112]	@ zero_extendqisi2
	cmp	r7, #1
	beq	.L638
.L617:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L636:
	mov	r3, #5
	mov	r0, #1
	strb	r3, [r4, #251]
	strb	r3, [r6, #2]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L604:
	bl	BsGet
	cmp	r0, #1
	beq	.L634
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #1
	beq	.L639
	mov	r2, r4
	mov	r3, #2
	add	r1, r4, #344
	strb	r3, [r2, #251]!
	mov	r0, r5
	bl	VC1_DecBfractionSMP
	uxtb	r0, r0
	strb	r0, [r4, #252]
	cmp	r0, #21
	ldrneb	r0, [r4, #251]	@ zero_extendqisi2
	bne	.L605
	b	.L617
.L601:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r2, r0
	strb	r2, [r4, #248]
	b	.L602
.L639:
	mov	r0, #0
.L634:
	strb	r0, [r4, #251]
	b	.L605
.L612:
	ldrb	r7, [r6, #3112]	@ zero_extendqisi2
	cmp	r7, #1
	bne	.L617
	mov	r1, r6
	mov	r2, r4
	mov	r0, r5
	bl	VC1_Vfmw_ParseMPBPicHdr
	cmp	r0, #1
	mov	r6, r0
	beq	.L614
	mov	r0, r7
	ldr	r1, .L641+12
	bl	dprint_vfmw
	b	.L614
.L611:
	mov	r1, r6
	mov	r2, r4
	mov	r0, r5
	bl	VC1_Vfmw_ParseSMPPPicHdr
	mov	r6, r0
.L614:
	mov	r0, r5
	bl	BsPos
	ldr	r3, [r4, #324]
	rsb	r0, r3, r0
	str	r0, [r4, #324]
	mov	r0, r5
	ldr	r4, [r8, #3680]
	bl	BsPos
	mov	r4, r4, asl #3
	rsb	r0, r0, r4
	cmp	r0, #0
	ble	.L640
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L609:
	mov	r1, r6
	mov	r2, r4
	mov	r0, r5
	bl	VC1_Vfmw_ParseSMPIPicHdr
	mov	r6, r0
	b	.L614
.L637:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #250]
	b	.L603
.L640:
	ldr	r1, .L641+16
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L638:
	mov	r1, r6
	mov	r2, r4
	mov	r0, r5
	bl	VC1_Vfmw_ParseSMPIPicHdr
	cmp	r0, #1
	mov	r6, r0
	beq	.L614
	mov	r0, r7
	ldr	r1, .L641+20
	bl	dprint_vfmw
	b	.L614
.L642:
	.align	2
.L641:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC53
	.word	.LC52
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseSMPPicHdr, .-VC1_Vfmw_ParseSMPPicHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvSeqHdr
	.type	VC1_Vfmw_ParseAdvSeqHdr, %function
VC1_Vfmw_ParseAdvSeqHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L660
	mov	r5, r0
	mov	r4, r2
	mov	r1, #0
	add	r0, r2, #16
	mov	r2, #172
	ldr	r3, [r3, #48]
	mov	r6, #2
	blx	r3
	mov	r0, r5
	bl	BsPos
	mov	r1, r6
	str	r0, [r4, #184]
	mov	r0, r5
	bl	BsGet
	strb	r6, [r4, #16]
	mov	r1, #3
	mov	r0, r5
	bl	BsGet
	mov	r1, r6
	strb	r0, [r4, #17]
	mov	r0, r5
	bl	BsGet
	mov	r1, #3
	strb	r0, [r4, #18]
	mov	r0, r5
	bl	BsGet
	mov	r1, #5
	strb	r0, [r4, #19]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #20]
	mov	r0, r5
	bl	BsGet
	mov	r1, #12
	strb	r0, [r4, #21]
	mov	r0, r5
	bl	BsGet
	mov	r1, #12
	uxth	r3, r0
	mov	r0, r5
	add	r3, r3, #1
	mov	r3, r3, asl #1
	strh	r3, [r4, #172]	@ movhi
	bl	BsGet
	mov	r1, #1
	uxth	r3, r0
	mov	r0, r5
	add	r3, r3, r1
	mov	r3, r3, asl r1
	strh	r3, [r4, #174]	@ movhi
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #22]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #23]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #24]
	mov	r0, r5
	bl	BsGet
	mov	r1, r6
	strb	r0, [r4, #25]
	mov	r0, r5
	bl	BsSkip
	mov	r0, r5
	mov	r1, #1
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r4, #26]
	cmp	r6, #1
	beq	.L657
	ldrh	r2, [r4, #172]
	ldrh	r3, [r4, #174]
	strh	r2, [r4, #176]	@ movhi
	strh	r3, [r4, #178]	@ movhi
.L650:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #39]
	cmp	r0, #1
	beq	.L651
.L653:
	mov	r0, r5
	bl	BsPos
	ldr	r3, [r4, #184]
	mov	r2, #1
	rsb	r0, r3, r0
	str	r0, [r4, #184]
.L652:
	mov	r0, r2
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L651:
	mov	r1, #5
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #40]
	cmp	r0, #31
	movhi	r2, #0
	bhi	.L652
	mov	r1, #4
	mov	r0, r5
	bl	BsGet
	mov	r1, #4
	strb	r0, [r4, #41]
	mov	r0, r5
	bl	BsGet
	ldrb	r3, [r4, #40]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #42]
	ble	.L653
	add	r7, r4, #42
	mov	r6, #0
.L654:
	mov	r1, #16
	mov	r0, r5
	bl	BsGet
	mov	r1, #16
	add	r6, r6, #1
	strh	r0, [r7, #2]!	@ movhi
	mov	r0, r5
	bl	BsGet
	strh	r0, [r7, #64]	@ movhi
	ldrb	r3, [r4, #40]	@ zero_extendqisi2
	cmp	r3, r6
	bgt	.L654
	b	.L653
.L657:
	mov	r1, #14
	mov	r0, r5
	bl	BsGet
	mov	r1, #14
	add	r3, r0, #1
	mov	r0, r5
	strh	r3, [r4, #176]	@ movhi
	bl	BsGet
	mov	r1, r6
	add	r3, r0, #1
	mov	r0, r5
	strh	r3, [r4, #178]	@ movhi
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #27]
	cmp	r0, #1
	beq	.L658
.L646:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r1, r0
	strb	r1, [r4, #31]
	cmp	r1, #1
	beq	.L659
.L648:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #35]
	cmp	r0, #1
	bne	.L650
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	mov	r1, #8
	strb	r0, [r4, #36]
	mov	r0, r5
	bl	BsGet
	mov	r1, #8
	strb	r0, [r4, #37]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #38]
	b	.L650
.L659:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #32]
	cmp	r0, #0
	bne	.L649
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	mov	r1, #4
	strb	r0, [r4, #33]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #34]
	b	.L648
.L658:
	mov	r1, #4
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #28]
	cmp	r0, #15
	bne	.L646
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	mov	r1, #8
	strb	r0, [r4, #29]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #30]
	b	.L646
.L649:
	mov	r1, #16
	mov	r0, r5
	bl	BsGet
	strh	r0, [r4, #180]	@ movhi
	b	.L648
.L661:
	.align	2
.L660:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvSeqHdr, .-VC1_Vfmw_ParseAdvSeqHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvEntptHdr
	.type	VC1_Vfmw_ParseAdvEntptHdr, %function
VC1_Vfmw_ParseAdvEntptHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L687
	mov	r4, r2
	mov	r5, r0
	mov	r1, #0
	add	r0, r2, #188
	mov	r2, #60
	ldr	r3, [r3, #48]
	blx	r3
	mov	r0, r5
	bl	BsPos
	mov	r1, #1
	str	r0, [r4, #244]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #188]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #189]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #190]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #191]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #192]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #193]
	mov	r0, r5
	bl	BsGet
	mov	r1, #2
	strb	r0, [r4, #194]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #195]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #196]
	mov	r0, r5
	bl	BsGet
	mov	r1, #2
	strb	r0, [r4, #197]
	mov	r0, r5
	bl	BsGet
	ldrb	r3, [r4, #39]	@ zero_extendqisi2
	cmp	r3, #1
	strb	r0, [r4, #198]
	beq	.L663
.L666:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #199]
	cmp	r0, #1
	ldrneh	r2, [r4, #240]
	beq	.L683
.L668:
	ldrh	r1, [r4, #238]
	ldrh	r0, [r4, #172]
	cmp	r1, #15
	movhi	r3, #0
	movls	r3, #1
	cmp	r1, r0
	orrhi	r3, r3, #1
	ldrb	r1, [r4, #194]	@ zero_extendqisi2
	cmp	r3, #0
	ldrh	r3, [r4, #174]
	strneh	r0, [r4, #238]	@ movhi
	cmp	r3, r2
	cmpcs	r2, #15
	strlsh	r3, [r4, #240]	@ movhi
	cmp	r1, #1
	beq	.L684
.L671:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #201]
	cmp	r0, #1
	beq	.L685
.L672:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #203]
	cmp	r0, #1
	beq	.L686
.L673:
	mov	r0, r5
	bl	BsPos
	ldr	r3, [r4, #244]
	rsb	r3, r3, r0
	mov	r0, #1
	str	r3, [r4, #244]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L663:
	ldrb	r3, [r4, #40]	@ zero_extendqisi2
	cmp	r3, #0
	ble	.L666
	add	r7, r4, #204
	mov	r6, #0
.L667:
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	add	r6, r6, #1
	strb	r0, [r7, #1]!
	ldrb	r3, [r4, #40]	@ zero_extendqisi2
	cmp	r3, r6
	bgt	.L667
	b	.L666
.L686:
	mov	r1, #3
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #204]
	b	.L673
.L683:
	mov	r1, #12
	mov	r0, r5
	bl	BsGet
	mov	r1, #12
	add	r3, r0, #1
	mov	r0, r5
	mov	r3, r3, asl #1
	strh	r3, [r4, #238]	@ movhi
	bl	BsGet
	add	r0, r0, #1
	mov	r2, r0, asl #1
	uxth	r2, r2
	strh	r2, [r4, #240]	@ movhi
	b	.L668
.L684:
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #200]
	b	.L671
.L685:
	mov	r1, #3
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #202]
	b	.L672
.L688:
	.align	2
.L687:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvEntptHdr, .-VC1_Vfmw_ParseAdvEntptHdr
	.align	2
	.global	VC1_DecFcm
	.type	VC1_DecFcm, %function
VC1_DecFcm:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r1, #2
	mov	r5, r0
	bl	BsShow
	mov	r4, r0
	cmp	r4, #1
	mov	r0, r5
	ble	.L692
	mov	r1, #2
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L692:
	mov	r1, #1
	mov	r4, #0
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_DecFcm, .-VC1_DecFcm
	.align	2
	.global	VC1_DecAdvPtype
	.type	VC1_DecAdvPtype, %function
VC1_DecAdvPtype:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r1, #4
	mov	r4, r0
	bl	BsShow
	cmp	r0, #7
	movle	r1, #1
	movle	r5, r1
	ble	.L694
	cmp	r0, #11
	movle	r1, #2
	movle	r5, r1
	bgt	.L699
.L694:
	mov	r0, r4
	bl	BsSkip
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L699:
	cmp	r0, #13
	movle	r1, #3
	movle	r5, #0
	ble	.L694
	cmp	r0, #14
	mov	r1, #4
	movne	r5, #5
	moveq	r5, r1
	b	.L694
	UNWIND(.fnend)
	.size	VC1_DecAdvPtype, .-VC1_DecAdvPtype
	.align	2
	.global	VC1_Vfmw_ParseAdvIPicHdr
	.type	VC1_Vfmw_ParseAdvIPicHdr, %function
VC1_Vfmw_ParseAdvIPicHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	mov	r8, r1
	mov	r1, #1
	mov	r4, r2
	mov	r6, r0
	bl	BsGet
	ldrb	r1, [r4, #23]	@ zero_extendqisi2
	cmp	r1, #1
	strb	r0, [r4, #348]
	beq	.L716
.L701:
	ldr	r3, [r4, #392]
	cmp	r3, #0
	bne	.L702
	ldrb	r1, [r4, #25]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L717
.L702:
	mov	r1, #5
	mov	r0, r6
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4, #358]
	cmp	r5, #0
	beq	.L711
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L721
	sub	r0, fp, #164
	bl	memcpy
	cmp	r7, #0
	mov	r3, r5
	subeq	r3, fp, #36
	addeq	r3, r3, r5, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r5, #8
	str	r3, [r4, #464]
	movhi	r3, #0
	strhib	r3, [r4, #351]
	bls	.L718
.L707:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L719
.L709:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L720
.L710:
	mov	r1, r8
	mov	r3, #0
	mov	r2, r4
	mov	r0, r6
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L711
	mov	r0, r6
	bl	VC1_DecTransacfrm
	strb	r0, [r4, #370]
	mov	r0, r6
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #371]
	mov	r0, r6
	bl	BsGet
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	strb	r0, [r4, #372]
	moveq	r0, #1
	beq	.L704
	mov	r0, r6
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	bl	VC1_VopDQuant
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L711:
	mov	r0, #0
.L704:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L718:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	strb	r0, [r4, #351]
	b	.L707
.L717:
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #357]
	b	.L702
.L716:
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #356]
	b	.L701
.L719:
	mov	r1, r7
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L709
.L720:
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L710
.L722:
	.align	2
.L721:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvIPicHdr, .-VC1_Vfmw_ParseAdvIPicHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvPPicHdr
	.type	VC1_Vfmw_ParseAdvPPicHdr, %function
VC1_Vfmw_ParseAdvPPicHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	mov	r8, r1
	mov	r1, #1
	mov	r4, r2
	mov	r5, r0
	bl	BsGet
	ldrb	r3, [r4, #23]	@ zero_extendqisi2
	cmp	r3, #1
	strb	r0, [r4, #348]
	beq	.L724
	ldr	r3, [r4, #392]
	cmp	r3, #2
	beq	.L724
	ldrb	r1, [r4, #25]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L761
.L726:
	mov	r1, #5
	mov	r0, r5
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r4, #358]
	cmp	r6, #0
	beq	.L741
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L774
	sub	r0, fp, #164
	bl	memcpy
	cmp	r7, #0
	mov	r3, r6
	subeq	r3, fp, #36
	addeq	r3, r3, r6, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r6, #8
	str	r3, [r4, #464]
	movhi	r3, #0
	strhib	r3, [r4, #351]
	bls	.L762
.L731:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L763
.L733:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L764
.L734:
	ldrb	r3, [r4, #194]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L765
.L735:
	ldr	r3, [r4, #392]
	cmp	r3, #0
	beq	.L766
	ldrb	r3, [r4, #200]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strneb	r3, [r4, #373]
	beq	.L767
.L739:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #374]
	mov	r0, r5
	bl	BsGet
	cmp	r0, #1
	str	r0, [r4, #468]
	beq	.L768
.L740:
	mov	r3, #0
	strb	r3, [r4, #382]
.L737:
	mov	r1, r8
	mov	r3, #0
	mov	r2, r4
	mov	r0, r5
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L741
	ldr	r1, [r4, #392]
	cmp	r1, #2
	beq	.L769
.L742:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	ldr	r3, [r4, #392]
	cmp	r3, #0
	moveq	r1, #2
	movne	r1, #3
	strb	r0, [r4, #366]
	mov	r0, r5
	bl	BsGet
	ldr	r6, [r4, #392]
	cmp	r6, #2
	uxtb	r0, r0
	strb	r0, [r4, #367]
	beq	.L770
.L745:
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L771
.L747:
	ldrb	r1, [r4, #196]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L772
.L749:
	mov	r0, r5
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #370]
	mov	r0, r5
	bl	BsGet
	mov	r3, #1
	strb	r0, [r4, #372]
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L741:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L724:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r1, [r4, #25]	@ zero_extendqisi2
	cmp	r1, #1
	strb	r0, [r4, #356]
	bne	.L726
.L761:
	ldr	r3, [r4, #392]
	cmp	r3, #0
	bne	.L726
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #357]
	b	.L726
.L766:
	ldrb	r1, [r4, #464]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_DecMvmodeProgrP
	uxtb	r0, r0
	strb	r0, [r4, #362]
	cmp	r0, #4
	bne	.L737
	ldrb	r1, [r4, #464]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_DecMvmode2
	mov	r1, #6
	strb	r0, [r4, #363]
	mov	r0, r5
	bl	BsGet
	mov	r1, #6
	strb	r0, [r4, #364]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #365]
	b	.L737
.L762:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	strb	r0, [r4, #351]
	b	.L731
.L771:
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_VopDQuant
	b	.L747
.L765:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #361]
	b	.L735
.L763:
	mov	r1, r7
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L733
.L764:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L734
.L772:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #368]
	cmp	r0, #1
	bne	.L749
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #369]
	b	.L749
.L770:
	mov	r1, r6
	mov	r0, r5
	bl	BsGet
	ldrb	r3, [r4, #374]	@ zero_extendqisi2
	cmp	r3, #1
	strb	r0, [r4, #376]
	movne	r0, #0
	beq	.L773
.L746:
	strb	r0, [r4, #377]
	b	.L745
.L769:
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #375]
	b	.L742
.L767:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #373]
	b	.L739
.L768:
	mov	r1, #6
	mov	r0, r5
	bl	BsGet
	mov	r1, #6
	strb	r0, [r4, #364]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #365]
	b	.L740
.L773:
	mov	r1, r6
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	b	.L746
.L775:
	.align	2
.L774:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvPPicHdr, .-VC1_Vfmw_ParseAdvPPicHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvBPicHdr
	.type	VC1_Vfmw_ParseAdvBPicHdr, %function
VC1_Vfmw_ParseAdvBPicHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	mov	r7, r1
	mov	r1, #1
	mov	r4, r2
	mov	r5, r0
	bl	BsGet
	ldrb	r3, [r4, #23]	@ zero_extendqisi2
	cmp	r3, #1
	strb	r0, [r4, #348]
	beq	.L777
	ldr	r3, [r4, #392]
	cmp	r3, #2
	beq	.L777
	ldrb	r1, [r4, #25]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L819
.L779:
	cmp	r3, #0
	bne	.L783
	add	r1, r4, #496
	mov	r0, r5
	bl	VC1_DecBfraction
	uxtb	r0, r0
	strb	r0, [r4, #350]
	cmp	r0, #21
	beq	.L781
.L783:
	mov	r1, #5
	mov	r0, r5
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r4, #358]
	cmp	r6, #0
	beq	.L781
	ldrb	r8, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L831
	sub	r0, fp, #164
	bl	memcpy
	cmp	r8, #0
	mov	r3, r6
	subeq	r3, fp, #36
	addeq	r3, r3, r6, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r6, #8
	str	r3, [r4, #464]
	movhi	r3, #0
	strhib	r3, [r4, #351]
	bls	.L820
	cmp	r8, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L821
.L789:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L822
.L790:
	ldr	r3, [r4, #392]
	cmp	r3, #2
	beq	.L823
.L791:
	ldrb	r3, [r4, #194]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L824
.L792:
	ldr	r3, [r4, #392]
	cmp	r3, #0
	beq	.L825
	ldrb	r3, [r4, #200]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L826
.L796:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #468]
.L795:
	mov	r1, r7
	mov	r3, #0
	mov	r2, r4
	mov	r0, r5
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L781
	ldr	r1, [r4, #392]
	cmp	r1, #2
	beq	.L827
.L797:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	ldr	r3, [r4, #392]
	cmp	r3, #0
	moveq	r1, #2
	movne	r1, #3
	strb	r0, [r4, #366]
	mov	r0, r5
	bl	BsGet
	ldr	r6, [r4, #392]
	cmp	r6, #2
	uxtb	r0, r0
	strb	r0, [r4, #367]
	beq	.L828
.L800:
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L829
.L801:
	ldrb	r1, [r4, #196]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L830
.L803:
	mov	r0, r5
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #370]
	mov	r0, r5
	bl	BsGet
	mov	r3, #1
	strb	r0, [r4, #372]
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L781:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L777:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r1, [r4, #25]	@ zero_extendqisi2
	ldr	r3, [r4, #392]
	cmp	r1, #1
	strb	r0, [r4, #356]
	bne	.L779
.L819:
	cmp	r3, #0
	bne	.L783
	mov	r0, r5
	bl	BsGet
	ldr	r3, [r4, #392]
	strb	r0, [r4, #357]
	b	.L779
.L825:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	moveq	r3, #3
	movne	r3, #1
	strb	r3, [r4, #362]
	b	.L795
.L820:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r8, [r4, #198]	@ zero_extendqisi2
	cmp	r8, #1
	movne	r3, #0
	strb	r0, [r4, #351]
	strneb	r3, [r4, #359]
	bne	.L789
.L821:
	mov	r1, r8
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L789
.L823:
	add	r1, r4, #496
	mov	r0, r5
	bl	VC1_DecBfraction
	strb	r0, [r4, #350]
	b	.L791
.L824:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #361]
	b	.L792
.L822:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L790
.L829:
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_VopDQuant
	b	.L801
.L830:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #368]
	cmp	r0, #1
	bne	.L803
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #369]
	b	.L803
.L828:
	mov	r1, r6
	mov	r0, r5
	bl	BsGet
	mov	r1, r6
	strb	r0, [r4, #376]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #377]
	b	.L800
.L827:
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #375]
	b	.L797
.L826:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #373]
	b	.L796
.L832:
	.align	2
.L831:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvBPicHdr, .-VC1_Vfmw_ParseAdvBPicHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvFramePicHdr
	.type	VC1_Vfmw_ParseAdvFramePicHdr, %function
VC1_Vfmw_ParseAdvFramePicHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r6, r1
	mov	r1, #4
	mov	r4, r2
	mov	r5, r0
	bl	BsShow
	cmp	r0, #7
	movle	r7, #1
	movle	r1, r7
	ble	.L834
	cmp	r0, #11
	movle	r7, #2
	movle	r1, r7
	bgt	.L865
.L834:
	mov	r0, r5
	bl	BsSkip
	strb	r7, [r4, #349]
	ldrb	r3, [r6, #3513]	@ zero_extendqisi2
	strb	r3, [r6, #2]
	ldrb	r3, [r4, #24]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L866
.L835:
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	r3, [r4, #23]	@ zero_extendqisi2
	beq	.L836
	cmp	r3, #0
	beq	.L867
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #352]
	mov	r0, r5
	bl	BsGet
	ldrb	r2, [r4, #23]	@ zero_extendqisi2
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r2, #1
	strb	r0, [r4, #353]
	beq	.L868
.L840:
	cmp	r3, #1
	bne	.L842
	ldrb	r1, [r4, #190]	@ zero_extendqisi2
	ldrb	r3, [r4, #354]	@ zero_extendqisi2
	cmp	r1, #1
	add	r3, r3, #1
	str	r3, [r4, #492]
	bne	.L851
.L843:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #355]
	cmp	r0, #1
	bne	.L851
	ldr	r3, [r4, #492]
	cmp	r3, #0
	ble	.L851
	mov	r7, r4
	mov	r8, #0
.L852:
	mov	r1, #18
	mov	r0, r5
	bl	BsGet
	mov	r1, #18
	add	r8, r8, #1
	add	r7, r7, #4
	str	r0, [r7, #396]
	mov	r0, r5
	bl	BsGet
	mov	r1, #14
	str	r0, [r7, #412]
	mov	r0, r5
	bl	BsGet
	mov	r1, #14
	str	r0, [r7, #428]
	mov	r0, r5
	bl	BsGet
	str	r0, [r7, #444]
	ldr	r3, [r4, #492]
	cmp	r3, r8
	bgt	.L852
	b	.L851
.L836:
	mov	r2, #1
	cmp	r3, r2
	strb	r2, [r4, #352]
	beq	.L839
.L842:
	mov	r3, #1
	str	r3, [r4, #492]
.L841:
	ldrb	r1, [r4, #190]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L843
.L851:
	ldrb	r3, [r4, #349]	@ zero_extendqisi2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L844
.L846:
	.word	.L849
	.word	.L847
	.word	.L848
	.word	.L844
	.word	.L849
	.word	.L857
.L849:
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvIPicHdr
.L867:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	ldrb	r2, [r4, #23]	@ zero_extendqisi2
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r2, #1
	strb	r0, [r4, #354]
	bne	.L840
.L868:
	cmp	r3, #1
	beq	.L869
.L839:
	mov	r3, #2
	str	r3, [r4, #492]
	b	.L841
.L865:
	cmp	r0, #13
	movle	r7, #0
	movle	r1, #3
	ble	.L834
	cmp	r0, #14
	moveq	r7, #4
	movne	r7, #5
	movne	r1, #4
	moveq	r1, r7
	b	.L834
.L866:
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #396]
	b	.L835
.L857:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L847:
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvPPicHdr
.L848:
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvBPicHdr
.L844:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L869:
	ldrb	r3, [r4, #353]	@ zero_extendqisi2
	add	r3, r3, #2
	str	r3, [r4, #492]
	b	.L841
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvFramePicHdr, .-VC1_Vfmw_ParseAdvFramePicHdr
	.align	2
	.global	VC1_DecRefdist
	.type	VC1_DecRefdist, %function
VC1_DecRefdist:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r1, #5
	mov	r5, r0
	bl	BsShow
	cmp	r0, #23
	bgt	.L871
	mov	r4, r0, asr #3
	mov	r1, #2
	mov	r0, r5
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L871:
	cmp	r0, #27
	movle	r4, #3
	bgt	.L877
.L873:
	mov	r0, r5
	mov	r1, r4
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L877:
	cmp	r0, #29
	movgt	r4, #5
	movle	r4, #4
	b	.L873
	UNWIND(.fnend)
	.size	VC1_DecRefdist, .-VC1_DecRefdist
	.align	2
	.global	VC1_DecIntCompField
	.type	VC1_DecIntCompField, %function
VC1_DecIntCompField:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	lr, .L879
	mov	r4, r0
	sub	ip, fp, #52
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	mov	r0, r4
	mov	r1, #2
	bl	BsShow
	sub	r3, fp, #20
	add	r3, r3, r0, lsl #3
	mov	r0, r4
	ldr	r1, [r3, #-28]
	ldr	r4, [r3, #-32]
	bl	BsSkip
	mov	r0, r4
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L880:
	.align	2
.L879:
	.word	.LANCHOR0+696
	UNWIND(.fnend)
	.size	VC1_DecIntCompField, .-VC1_DecIntCompField
	.align	2
	.global	VC1_Vfmw_ParseAdvIFieldHdr
	.type	VC1_Vfmw_ParseAdvIFieldHdr, %function
VC1_Vfmw_ParseAdvIFieldHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	mov	r8, r1
	mov	r1, #5
	mov	r4, r2
	mov	r6, r0
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4, #358]
	cmp	r5, #0
	beq	.L890
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L898
	sub	r0, fp, #164
	bl	memcpy
	cmp	r7, #0
	mov	r3, r5
	subeq	r3, fp, #36
	addeq	r3, r3, r5, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r5, #8
	str	r3, [r4, #464]
	movhi	r3, #0
	strhib	r3, [r4, #351]
	bls	.L895
.L886:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L896
.L888:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L897
.L889:
	mov	r1, r8
	mov	r3, #0
	mov	r2, r4
	mov	r0, r6
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L890
	mov	r0, r6
	bl	VC1_DecTransacfrm
	strb	r0, [r4, #370]
	mov	r0, r6
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #371]
	mov	r0, r6
	bl	BsGet
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	strb	r0, [r4, #372]
	moveq	r0, #1
	beq	.L883
	mov	r0, r6
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	bl	VC1_VopDQuant
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L890:
	mov	r0, #0
.L883:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L895:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	strb	r0, [r4, #351]
	b	.L886
.L896:
	mov	r1, r7
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L888
.L897:
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L889
.L899:
	.align	2
.L898:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvIFieldHdr, .-VC1_Vfmw_ParseAdvIFieldHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvPFieldHdr
	.type	VC1_Vfmw_ParseAdvPFieldHdr, %function
VC1_Vfmw_ParseAdvPFieldHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #128)
	sub	sp, sp, #128
	mov	r1, #5
	mov	r4, r2
	mov	r6, r0
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4, #358]
	cmp	r5, #0
	beq	.L901
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L938
	sub	r0, fp, #156
	bl	memcpy
	cmp	r7, #0
	mov	r3, r5
	subeq	r3, fp, #28
	addeq	r3, r3, r5, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r5, #8
	str	r3, [r4, #464]
	movhi	r3, #0
	strhib	r3, [r4, #351]
	bls	.L929
.L904:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L930
.L906:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L931
.L907:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #380]
	cmp	r0, #0
	beq	.L932
.L908:
	ldrb	r3, [r4, #194]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L933
.L909:
	ldrb	r3, [r4, #200]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L934
.L910:
	ldrb	r1, [r4, #464]	@ zero_extendqisi2
	mov	r0, r6
	bl	VC1_DecMvmodeProgrP
	uxtb	r0, r0
	strb	r0, [r4, #362]
	cmp	r0, #4
	beq	.L935
.L912:
	mov	r1, #3
	mov	r0, r6
	bl	BsGet
	ldrb	r3, [r4, #380]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r1, #2
	movne	r1, #3
	strb	r0, [r4, #375]
	mov	r0, r6
	bl	BsGet
	mov	r1, #3
	uxtb	r0, r0
	strb	r0, [r4, #366]
	mov	r0, r6
	bl	BsGet
	ldrb	r3, [r4, #362]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #367]
	beq	.L916
	movw	r3, #362
	ldrh	r3, [r4, r3]
	cmp	r3, #4
	beq	.L916
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L936
.L918:
	ldrb	r1, [r4, #196]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L937
.L920:
	mov	r0, r6
	mov	r5, #1
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #370]
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #372]
.L901:
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L916:
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	strb	r0, [r4, #377]
	beq	.L918
.L936:
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	mov	r0, r6
	bl	VC1_VopDQuant
	b	.L918
.L932:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	clz	r0, r0
	mov	r0, r0, lsr #5
	strb	r0, [r4, #381]
	b	.L908
.L929:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	strb	r0, [r4, #351]
	b	.L904
.L933:
	mov	r0, r6
	bl	VC1_DecMvrange
	strb	r0, [r4, #361]
	b	.L909
.L934:
	mov	r0, r6
	bl	VC1_DecMvrange
	strb	r0, [r4, #373]
	b	.L910
.L930:
	mov	r1, r7
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L906
.L937:
	mov	r0, r6
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #368]
	cmp	r0, #1
	bne	.L920
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #369]
	b	.L920
.L931:
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L907
.L935:
	ldrb	r1, [r4, #464]	@ zero_extendqisi2
	mov	r0, r6
	bl	VC1_DecMvmode2
	strb	r0, [r4, #363]
	mov	r0, r6
	bl	VC1_DecIntCompField
	mov	r1, #6
	str	r0, [r4, #476]
	mov	r0, r6
	bl	BsGet
	mov	r1, #6
	strb	r0, [r4, #364]
	mov	r0, r6
	bl	BsGet
	ldr	r3, [r4, #476]
	cmp	r3, #0
	strb	r0, [r4, #365]
	bne	.L912
	mov	r1, #6
	mov	r0, r6
	bl	BsGet
	mov	r1, #6
	str	r0, [r4, #480]
	mov	r0, r6
	bl	BsGet
	str	r0, [r4, #484]
	b	.L912
.L939:
	.align	2
.L938:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvPFieldHdr, .-VC1_Vfmw_ParseAdvPFieldHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvBFieldHdr
	.type	VC1_Vfmw_ParseAdvBFieldHdr, %function
VC1_Vfmw_ParseAdvBFieldHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	mov	r3, #1
	mov	r8, r1
	strb	r3, [r2, #380]
	mov	r1, #5
	mov	r4, r2
	mov	r5, r0
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r4, #358]
	cmp	r6, #0
	beq	.L951
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L971
	sub	r0, fp, #164
	bl	memcpy
	cmp	r7, #0
	mov	r3, r6
	subeq	r3, fp, #36
	addeq	r3, r3, r6, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r6, #8
	str	r3, [r4, #464]
	movhi	r3, #0
	strhib	r3, [r4, #351]
	bls	.L963
.L945:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L964
.L947:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L965
.L948:
	ldrb	r3, [r4, #194]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L966
.L949:
	ldrb	r3, [r4, #200]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L967
.L950:
	ldrb	r1, [r4, #464]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_DecMvmodeInterB
	mov	r1, r8
	mov	r3, #0
	mov	r2, r4
	strb	r0, [r4, #362]
	mov	r0, r5
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L951
	mov	r1, #3
	mov	r0, r5
	bl	BsGet
	mov	r1, #3
	strb	r0, [r4, #375]
	mov	r0, r5
	bl	BsGet
	mov	r1, #3
	strb	r0, [r4, #366]
	mov	r0, r5
	bl	BsGet
	ldrb	r3, [r4, #362]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #367]
	beq	.L968
.L952:
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L969
.L953:
	ldrb	r1, [r4, #196]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L970
.L955:
	mov	r0, r5
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #370]
	mov	r0, r5
	bl	BsGet
	mov	r3, #1
	strb	r0, [r4, #372]
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L951:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L963:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	strb	r0, [r4, #351]
	b	.L945
.L969:
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_VopDQuant
	b	.L953
.L968:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #377]
	b	.L952
.L965:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L948
.L966:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #361]
	b	.L949
.L964:
	mov	r1, r7
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L947
.L967:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #373]
	b	.L950
.L970:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #368]
	cmp	r0, #1
	bne	.L955
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #369]
	b	.L955
.L972:
	.align	2
.L971:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvBFieldHdr, .-VC1_Vfmw_ParseAdvBFieldHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvFieldPicHdr
	.type	VC1_Vfmw_ParseAdvFieldPicHdr, %function
VC1_Vfmw_ParseAdvFieldPicHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldrb	r3, [r1, #8]	@ zero_extendqisi2
	mov	r5, r1
	mov	r6, r0
	mov	r4, r2
	cmp	r3, #0
	beq	.L974
	add	r3, r1, #20480
	ldr	r3, [r3, #3652]
	cmp	r3, #0
	bne	.L974
	ldr	r3, [r2, #504]
	strb	r3, [r2, #349]
	ldrb	r3, [r1, #3513]	@ zero_extendqisi2
	strb	r3, [r1, #2]
.L992:
	ldrb	r3, [r4, #349]	@ zero_extendqisi2
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L1001
.L996:
	.word	.L995
	.word	.L997
	.word	.L998
	.word	.L1001
	.word	.L995
.L974:
	mov	r1, #3
	mov	r0, r6
	bl	BsGet
	ldr	r3, .L1020
	str	r0, [r4, #472]
	add	r0, r3, r0, lsl #3
	ldr	r3, [r0, #732]
	ldr	r2, [r0, #728]
	str	r3, [r4, #504]
	str	r2, [r4, #500]
	ldrb	r1, [r5, #8]	@ zero_extendqisi2
	cmp	r1, #0
	uxtbeq	r3, r2
	uxtbne	r3, r3
	strb	r3, [r4, #349]
	ldrb	r3, [r5, #3513]	@ zero_extendqisi2
	strb	r3, [r5, #2]
	ldrb	r3, [r4, #24]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1013
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	r3, [r4, #23]	@ zero_extendqisi2
	bne	.L1014
.L979:
	mov	r2, #1
	cmp	r3, r2
	strb	r2, [r4, #352]
	beq	.L982
.L985:
	mov	r3, #1
	str	r3, [r4, #492]
.L984:
	ldrb	r1, [r4, #190]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L986
.L989:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #348]
	mov	r0, r6
	bl	BsGet
	ldrb	r3, [r4, #191]	@ zero_extendqisi2
	cmp	r3, #1
	strb	r0, [r4, #356]
	beq	.L1015
.L988:
	ldr	r3, [r4, #472]
	cmp	r3, #3
	ble	.L992
.L993:
	add	r1, r4, #496
	mov	r0, r6
	bl	VC1_DecBfraction
	strb	r0, [r4, #350]
	b	.L992
.L1014:
	cmp	r3, #0
	beq	.L1016
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #352]
	mov	r0, r6
	bl	BsGet
	ldrb	r2, [r4, #23]	@ zero_extendqisi2
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r2, #1
	strb	r0, [r4, #353]
	beq	.L1017
.L983:
	cmp	r3, #1
	bne	.L985
	ldrb	r3, [r4, #354]	@ zero_extendqisi2
	add	r3, r3, #1
	str	r3, [r4, #492]
	b	.L984
.L998:
	mov	r0, r6
	mov	r2, r4
	mov	r1, r5
	bl	VC1_Vfmw_ParseAdvBFieldHdr
.L994:
	ldrb	r3, [r4, #352]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	bne	.L1018
.L999:
	subs	r3, r3, #1
	movne	r3, #1
	strb	r3, [r4, #389]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L997:
	mov	r0, r6
	mov	r2, r4
	mov	r1, r5
	bl	VC1_Vfmw_ParseAdvPFieldHdr
	ldrb	r3, [r4, #352]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	beq	.L999
.L1018:
	adds	r3, r3, #0
	movne	r3, #1
	strb	r3, [r4, #389]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L995:
	mov	r0, r6
	mov	r2, r4
	mov	r1, r5
	bl	VC1_Vfmw_ParseAdvIFieldHdr
	b	.L994
.L1013:
	mov	r1, #8
	mov	r0, r6
	bl	BsGet
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	r3, [r4, #23]	@ zero_extendqisi2
	str	r0, [r4, #396]
	beq	.L979
	b	.L1014
.L1016:
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	ldrb	r2, [r4, #23]	@ zero_extendqisi2
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r2, #1
	strb	r0, [r4, #354]
	bne	.L983
.L1017:
	cmp	r3, #1
	beq	.L1019
.L982:
	mov	r3, #2
	str	r3, [r4, #492]
	b	.L984
.L1001:
	mov	r0, #0
	b	.L994
.L1015:
	ldr	r3, [r4, #472]
	cmp	r3, #3
	bgt	.L993
	mov	r0, r6
	bl	VC1_DecRefdist
	strb	r0, [r4, #379]
	b	.L988
.L986:
	mov	r0, r6
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #355]
	cmp	r0, #1
	bne	.L989
	ldr	r3, [r4, #492]
	cmp	r3, #0
	ble	.L989
	mov	r7, r4
	mov	r8, #0
.L990:
	mov	r1, #18
	mov	r0, r6
	bl	BsGet
	mov	r1, #18
	add	r8, r8, #1
	add	r7, r7, #4
	str	r0, [r7, #396]
	mov	r0, r6
	bl	BsGet
	mov	r1, #14
	str	r0, [r7, #412]
	mov	r0, r6
	bl	BsGet
	mov	r1, #14
	str	r0, [r7, #428]
	mov	r0, r6
	bl	BsGet
	str	r0, [r7, #444]
	ldr	r3, [r4, #492]
	cmp	r3, r8
	bgt	.L990
	b	.L989
.L1019:
	ldrb	r3, [r4, #353]	@ zero_extendqisi2
	add	r3, r3, #2
	str	r3, [r4, #492]
	b	.L984
.L1021:
	.align	2
.L1020:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvFieldPicHdr, .-VC1_Vfmw_ParseAdvFieldPicHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvPicHdr
	.type	VC1_Vfmw_ParseAdvPicHdr, %function
VC1_Vfmw_ParseAdvPicHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r4, r1
	mov	r6, r0
	mov	r1, #0
	mov	r0, r4
	mov	r5, r2
	bl	VC1_SetCurPicResolutionInfo
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1023
	add	r3, r4, #20480
	ldr	r3, [r3, #3652]
	cmp	r3, #0
	beq	.L1032
.L1023:
	ldrb	r8, [r5, #23]	@ zero_extendqisi2
	cmp	r8, #1
	movne	r3, #0
	movne	r0, r3
	beq	.L1033
.L1025:
	str	r0, [r5, #392]
.L1024:
	cmp	r3, #0
	mov	r2, r5
	mov	r1, r4
	mov	r0, r6
	beq	.L1034
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvFieldPicHdr
.L1032:
	ldr	r3, [r5, #392]
	bic	r3, r3, #2
	b	.L1024
.L1034:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvFramePicHdr
.L1033:
	mov	r1, #2
	mov	r0, r6
	bl	BsShow
	cmp	r0, #1
	mov	r7, r0
	ble	.L1035
	mov	r1, #2
	mov	r0, r6
	bl	BsSkip
	bic	r3, r7, #2
	mov	r0, r7
	b	.L1025
.L1035:
	mov	r1, r8
	mov	r0, r6
	bl	BsSkip
	mov	r3, #0
	mov	r0, r3
	b	.L1025
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvPicHdr, .-VC1_Vfmw_ParseAdvPicHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvSlcHdr
	.type	VC1_Vfmw_ParseAdvSlcHdr, %function
VC1_Vfmw_ParseAdvSlcHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r3, r1, #20480
	mov	r5, r1
	mov	r1, #9
	mov	r6, r2
	ldr	r4, [r3, #3652]
	mov	r7, r0
	bl	BsGet
	mov	r1, #1
	mov	r3, r4, asl #4
	sub	r4, r3, r4, asl #2
	add	r4, r6, r4
	add	r4, r4, #520
	str	r0, [r4, #8]
	mov	r0, r7
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #4]
	cmp	r0, #1
	beq	.L1038
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1038:
	add	lr, r6, #188
	add	ip, r5, #6912
	add	ip, ip, #36
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	add	r0, r5, #6720
	add	r1, r6, #16
	mov	r2, #172
	add	r0, r0, #56
	bl	memcpy
	add	r0, r5, #7104
	add	r1, r6, #348
	mov	r2, #176
	add	r0, r0, #4
	bl	memcpy
	add	r2, r5, #6720
	mov	r0, r7
	add	r2, r2, #40
	mov	r1, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvPicHdr
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvSlcHdr, .-VC1_Vfmw_ParseAdvSlcHdr
	.align	2
	.global	VC1_Vfmw_next_start_code
	.type	VC1_Vfmw_next_start_code, %function
VC1_Vfmw_next_start_code:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r5, r0
	bl	BsToNextByte
	mov	r0, r5
	bl	BsResidBits
	add	r6, r0, #7
	cmp	r0, #0
	movlt	r0, r6
	mov	r6, r0, asr #3
	cmp	r6, #3
	subgt	r6, r6, #3
	movgt	r4, #0
	bgt	.L1042
	b	.L1043
.L1048:
	bl	BsSkip
	cmp	r4, r6
	beq	.L1043
.L1042:
	mov	r1, #24
	mov	r0, r5
	bl	BsShow
	add	r4, r4, #1
	mov	r1, #8
	mov	r3, r0
	cmp	r3, #1
	mov	r0, r5
	bne	.L1048
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1043:
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_Vfmw_next_start_code, .-VC1_Vfmw_next_start_code
	.align	2
	.global	VC1_Vfmw_UserData
	.type	VC1_Vfmw_UserData, %function
VC1_Vfmw_UserData:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_Vfmw_UserData, .-VC1_Vfmw_UserData
	.align	2
	.global	VC1_RecordSlcStream
	.type	VC1_RecordSlcStream, %function
VC1_RecordSlcStream:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #28)
	sub	sp, sp, #28
	add	r7, r0, #20480
	ldr	r3, [r0, #3128]
	mov	r5, r0
	ldr	r6, [r7, #3652]
	movw	r0, #24144
	movw	ip, #24136
	mov	r10, r1
	movw	r1, #24152
	mov	r9, r6, asl #4
	mov	r8, r6, asl #6
	rsb	r4, r9, r8
	add	r4, r5, r4
	strb	r6, [r4, r0]
	add	r0, r4, #24064
	ldr	lr, [r3, #24]
	add	r2, r2, lr, lsr #3
	str	r2, [r4, ip]
	ldr	lr, [r3, #24]
	add	r2, r0, #80
	str	r2, [fp, #-48]
	and	lr, lr, #7
	str	lr, [r4, r1]
	ldr	lr, [r3, #16]
	add	r1, r0, #72
	ldr	r3, [r3, #24]
	str	r1, [fp, #-52]
	rsb	r3, r3, lr, lsl #3
	str	r3, [r0, #92]
	ldr	r0, [r4, ip]
	str	r1, [fp, #-56]
	bl	MEM_Vir2Phy
	ldr	r2, [fp, #-48]
	add	r3, r5, #32768
	movw	lr, #24176
	add	ip, r4, #24064
	add	ip, ip, #112
	str	r0, [r2, #4]
	ldr	r2, [r3, #3688]
	str	r2, [r4, lr]
	ldr	r2, [r3, #3664]
	cmp	r2, #0
	beq	.L1051
	ldr	r0, [r3, #3676]
	ldr	r1, [fp, #-52]
	cmp	r0, #0
	bne	.L1070
.L1051:
	rsb	r3, r9, r8
	movw	lr, #24168
	add	r3, r5, r3
	mov	r2, #0
	add	ip, r3, #24064
	str	r2, [ip, #76]
	str	r2, [r3, lr]
	str	r2, [ip, #108]
	str	r2, [ip, #100]
	str	r2, [ip, #116]
.L1052:
	ldr	ip, [r7, #3572]
	sub	r6, r9, r6, asl #2
	ldr	r0, [r7, #3568]
	ldrb	r4, [r5, #8]	@ zero_extendqisi2
	mul	r0, r0, ip
	cmp	r4, #0
	sub	r0, r0, #1
	beq	.L1053
	add	r10, r10, r6
	add	r3, ip, #1
	rsb	r1, r9, r8
	movw	lr, #24160
	ldr	r2, [r10, #528]
	add	r3, r3, r3, lsr #31
	add	r1, r5, r1
	add	r10, r10, #520
	sub	r3, r2, r3, asr #1
	cmp	r0, r3
	str	r3, [r1, lr]
	movcs	r0, #0
	movcc	r0, #1
	cmp	r3, #0
	movle	r0, #0
	cmp	r0, #0
	bne	.L1071
.L1054:
	rsb	r0, r9, r8
	add	r0, r5, r0
	add	r3, r0, #24064
	add	r3, r3, #88
	ldr	r3, [r3, #4]
	cmp	r3, #0
	ble	.L1056
	add	r3, r0, #24064
	add	r3, r3, #72
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L1057
	add	r0, r0, #24064
	ldr	r3, [r0, #108]
	cmp	r3, #0
	ble	.L1056
.L1057:
	ldr	r3, [r7, #3652]
	mov	r0, #1
	add	r3, r3, r0
	str	r3, [r7, #3652]
.L1055:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1053:
	add	r6, r10, r6
	rsb	r2, r9, r8
	add	r2, r5, r2
	movw	r1, #24160
	ldr	r3, [r6, #528]
	add	r6, r6, #520
	cmp	r0, r3
	str	r3, [r2, r1]
	bcs	.L1054
	ldr	r2, [r6, #8]
	ldr	r1, .L1072
	str	r0, [sp]
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1070:
	movw	lr, #24168
	str	r2, [r1, #4]
	mov	r2, #0
	str	r2, [r4, lr]
	ldr	r1, [r3, #3684]
	add	r2, r4, #24064
	str	r0, [r2, #100]
	mov	r1, r1, asl #3
	str	r1, [r2, #108]
	ldr	r3, [r3, #3692]
	str	r3, [ip, #4]
	b	.L1052
.L1071:
	ldr	r2, [r10, #8]
	mov	r0, #1
	str	ip, [sp]
	ldr	r1, .L1072+4
	bl	dprint_vfmw
	mov	r0, #0
	b	.L1055
.L1056:
	ldr	r1, .L1072+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1073:
	.align	2
.L1072:
	.word	.LC55
	.word	.LC54
	.word	.LC56
	UNWIND(.fnend)
	.size	VC1_RecordSlcStream, .-VC1_RecordSlcStream
	.align	2
	.global	VC1_Vfmw_UpdateAdvSPS
	.type	VC1_Vfmw_UpdateAdvSPS, %function
VC1_Vfmw_UpdateAdvSPS:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r5, r0, #8192
	movw	r3, #2402
	ldrh	r2, [r1, #238]
	mov	r4, r1
	ldrh	r3, [r5, r3]
	cmp	r3, r2
	beq	.L1075
	adds	r3, r2, #15
	add	r0, r0, #20480
	addmi	r3, r2, #30
	movw	r1, #2404
	mov	r3, r3, asr #4
	str	r3, [r0, #3568]
	ldrh	r3, [r4, #238]
	str	r3, [r0, #3584]
	ldrh	r2, [r4, #240]
	ldrh	r3, [r5, r1]
	cmp	r3, r2
	beq	.L1076
.L1077:
	adds	r3, r2, #15
	addmi	r3, r2, #30
	mov	r3, r3, asr #4
	str	r3, [r0, #3572]
	ldrh	r3, [r4, #240]
	str	r3, [r0, #3588]
.L1076:
	add	r0, r5, #2176
	add	r1, r4, #16
	mov	r2, #172
	add	r0, r0, #4
	bl	memcpy
	add	lr, r4, #188
	add	ip, r5, #2352
	mov	r4, #1
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
.L1080:
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1075:
	movw	r3, #2404
	ldrh	r2, [r1, #240]
	ldrh	r3, [r5, r3]
	cmp	r3, r2
	addne	r0, r0, #20480
	bne	.L1077
	mov	r4, #0
	b	.L1080
	UNWIND(.fnend)
	.size	VC1_Vfmw_UpdateAdvSPS, .-VC1_Vfmw_UpdateAdvSPS
	.align	2
	.global	VC1_Vfmw_UpdataLastPicRNDCTRL
	.type	VC1_Vfmw_UpdataLastPicRNDCTRL, %function
VC1_Vfmw_UpdataLastPicRNDCTRL:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r3, r0, #0
	beq	.L1089
	ldrb	r2, [r3, #3096]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1087
	add	r1, r3, #8192
	ldrb	r2, [r1, #2415]	@ zero_extendqisi2
	tst	r2, #251
	moveq	r2, #1
	moveq	r0, r2
	bne	.L1090
.L1085:
	strb	r0, [r3, #10]
	mov	r0, #1
	strb	r2, [r1, #2434]
	ldmfd	sp, {fp, sp, pc}
.L1090:
	cmp	r2, #1
	ldreqsb	r2, [r3, #10]
	ldrneb	r0, [r3, #10]	@ zero_extendqisi2
	clzeq	r2, r2
	moveq	r2, r2, lsr #5
	uxtbne	r2, r0
	uxtbeq	r0, r2
	b	.L1085
.L1087:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1089:
	ldr	r3, .L1091
	movw	r2, #5854
	ldr	r1, .L1091+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1092:
	.align	2
.L1091:
	.word	.LC57
	.word	.LC24
	UNWIND(.fnend)
	.size	VC1_Vfmw_UpdataLastPicRNDCTRL, .-VC1_Vfmw_UpdataLastPicRNDCTRL
	.align	2
	.global	VC1_Vfmw_DecPQUANT
	.type	VC1_Vfmw_DecPQUANT, %function
VC1_Vfmw_DecPQUANT:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #128)
	sub	sp, sp, #128
	mov	r2, #128
	mov	r4, r1
	mov	r5, r0
	ldr	r1, .L1096
	sub	r0, fp, #148
	bl	memcpy
	cmp	r5, #0
	subeq	r3, fp, #20
	movne	r0, r4
	addeq	r4, r3, r4, lsl #2
	ldreq	r0, [r4, #-128]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1097:
	.align	2
.L1096:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_DecPQUANT, .-VC1_Vfmw_DecPQUANT
	.align	2
	.global	VC1_ClearCurPacket
	.type	VC1_ClearCurPacket, %function
VC1_ClearCurPacket:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r4, r1
	ldr	r1, [r1, #28]
	mov	r5, r0
	bl	SM_ReleaseStreamSeg
	ldrsb	r3, [r4, #8]
	cmp	r3, #1
	beq	.L1099
	mov	r0, r5
	ldr	r1, [r4, #32]
	bl	SM_ReleaseStreamSeg
.L1099:
	ldr	r3, .L1103
	mov	r0, r4
	mov	r2, #36
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L1104:
	.align	2
.L1103:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VC1_ClearCurPacket, .-VC1_ClearCurPacket
	.align	2
	.global	VC1_ClearCurPic
	.type	VC1_ClearCurPic, %function
VC1_ClearCurPic:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r4, r0, #0
	mov	r6, r1
	beq	.L1122
	cmp	r1, #32
	bhi	.L1123
	ldrb	r3, [r4, #3096]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1108
	add	r7, r4, #20480
	ldr	r3, [r7, #3652]
	cmp	r3, #0
	beq	.L1124
	add	r4, r4, #24064
	mov	r5, #0
	add	r4, r4, #112
	b	.L1112
.L1111:
	ldr	r3, [r7, #3652]
	add	r4, r4, #48
	cmp	r5, r3
	bcs	.L1125
.L1112:
	ldr	r1, [r4]
	mov	r0, r6
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #-36]
	add	r5, r5, #1
	cmp	r3, #0
	beq	.L1111
	ldr	r3, [r4, #-12]
	cmp	r3, #0
	beq	.L1111
	ldr	r1, [r4, #4]
	mov	r0, r6
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r7, #3652]
	add	r4, r4, #48
	cmp	r5, r3
	bcc	.L1112
.L1125:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1123:
	ldr	r1, .L1126
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1108:
	add	r1, r4, #36352
	mov	r0, r6
	add	r1, r1, #76
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VC1_ClearCurPacket
.L1124:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1122:
	ldr	r1, .L1126+4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1127:
	.align	2
.L1126:
	.word	.LC59
	.word	.LC58
	UNWIND(.fnend)
	.size	VC1_ClearCurPic, .-VC1_ClearCurPic
	.align	2
	.global	VC1DEC_VDMPostProc
	.type	VC1DEC_VDMPostProc, %function
VC1DEC_VDMPostProc:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	subs	r5, r0, #0
	mov	r9, r1
	beq	.L1162
	ldr	r3, [r5, #4]
	add	r4, r5, #49152
	add	r6, r5, #32768
	add	r0, r5, #12736
	add	r2, r3, #12288
	ldr	r1, [r4, #528]
	ldrb	r3, [r3, #71]	@ zero_extendqisi2
	strb	r3, [r4, #129]
	ldr	r3, [r2, #260]
	str	r3, [r4, #132]
	bl	VC1_ClearCurPic
	ldr	r1, [r6, #4092]
	ldr	r0, [r4, #528]
	bl	FSP_GetFsImagePtr
	ldr	r1, [r6, #4088]
	mov	r8, r0
	ldr	r0, [r4, #528]
	bl	FSP_GetFsImagePtr
	ldr	r1, [r6, #4084]
	mov	r7, r0
	ldr	r0, [r4, #528]
	bl	FSP_GetFsImagePtr
	cmp	r8, #0
	beq	.L1163
	cmp	r9, #0
	movlt	r3, #0
	blt	.L1132
	cmp	r9, #100
	movlt	r3, r9
	movge	r3, #100
.L1132:
	add	r9, r5, #12288
	str	r3, [r8, #152]
	mov	r0, r5
	bl	VC1_SetImgFormat
	ldrb	r3, [r9, #451]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L1164
.L1133:
	add	r3, r8, #560
	add	r2, r8, #544
	mov	r0, #0
	mov	r1, #0
	strd	r0, [r2]
	strd	r0, [r3, #-8]
	ldr	r3, [r5]
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L1165
	ldr	ip, [r6, #4092]
	add	r10, r5, #36864
	mov	r7, #0
	str	ip, [r10]
.L1137:
	ldr	r3, [r4, #8]
	cmn	ip, #1
	add	r3, r3, #1
	str	r3, [r4, #8]
	beq	.L1138
	mov	r1, ip
	ldr	r0, [r4, #528]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L1166
	ldr	r2, [r8, #152]
	cmp	r2, #0
	beq	.L1140
	ldr	r3, [r5]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bhi	.L1141
.L1140:
	ldr	r2, [r10]
	ldr	r0, [r4, #528]
	mov	r1, r2
	str	r2, [fp, #-48]
	bl	FSP_GetRef
	ldr	r2, [fp, #-48]
	ldr	r1, .L1170
	mov	r3, r0
	mov	r0, #12
	bl	dprint_vfmw
	mov	r2, #1
	ldr	r1, [r10]
	ldr	r0, [r4, #528]
	bl	FSP_SetDisplay
	cmp	r7, #1
	ldreq	r3, [r6, #4008]
	movne	r1, #1
	ldrne	r2, [r6, #4000]
	movne	r3, #2
	strneb	r1, [r2, #1]
	mov	r2, r5
	streqb	r7, [r3, #1]
	mov	r1, #1
	strneb	r3, [r9, #449]
	add	r3, r5, #49152
	streqb	r7, [r9, #449]
	add	r3, r3, #176
	ldr	r0, [r4, #528]
	str	r8, [sp]
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L1144
	ldr	r1, [r8, #544]
	add	r3, r8, #544
	ldr	r0, [r4, #528]
	add	r5, r8, #560
	str	r3, [fp, #-48]
	bl	FreeUsdByDec
	ldr	r3, [fp, #-48]
	mov	r8, #0
	mov	r9, #0
	strd	r8, [r3]
	ldr	r1, [r5, #-8]
	ldr	r0, [r4, #528]
	bl	FreeUsdByDec
	mov	r2, #0
	strd	r8, [r5, #-8]
	ldr	r0, [r4, #528]
	ldr	r1, [r10]
	bl	FSP_SetDisplay
	cmp	r7, #1
	mov	r3, #0
	ldreq	r2, [r6, #4008]
	mov	r0, r3
	ldrne	r2, [r6, #4000]
	strb	r3, [r2, #1]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1165:
	ldrb	lr, [r9, #450]	@ zero_extendqisi2
	sub	lr, lr, #2
	ands	lr, lr, #253
	bne	.L1167
	ldr	ip, [r6, #4092]
	add	r10, r5, #36864
	cmp	r7, #0
	str	ip, [r10]
	beq	.L1137
	add	r3, r7, #592
	add	r8, r8, #592
	str	r3, [fp, #-48]
	ldrd	r0, [r3, #-8]
	ldrd	r2, [r8, #-8]
	cmp	r0, r2
	sbcs	r7, r1, r3
	movge	r7, lr
	bge	.L1137
	strd	r0, [r8, #-8]
	mov	r7, lr
	ldr	r1, [fp, #-48]
	strd	r2, [r1, #-8]
	ldr	ip, [r10]
	b	.L1137
.L1168:
	ldr	r2, [r6, #4004]
	mov	r3, #0
	strb	r3, [r2, #1]
	strb	r3, [r9, #449]
.L1138:
	mov	r0, #1
.L1130:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1162:
	ldr	r3, .L1170+4
	movw	r2, #513
	ldr	r1, .L1170+8
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1167:
	ldr	r7, [r6, #4080]
	add	r10, r5, #36864
	cmp	r7, #1
	ldrhi	ip, [r6, #4084]
	mvnls	ip, #0
	cmp	r7, #1
	str	ip, [r10]
	movls	r7, #0
	movhi	r7, #1
	b	.L1137
.L1144:
	ldrb	r3, [r9, #449]	@ zero_extendqisi2
	sxtb	r3, r3
	cmp	r3, #3
	beq	.L1168
	cmp	r3, #1
	beq	.L1169
	cmp	r3, #2
	bne	.L1138
	ldr	r2, [r6, #4000]
	mov	r3, #0
	strb	r3, [r2, #1]
	strb	r3, [r9, #449]
	b	.L1130
.L1141:
	ldr	r1, .L1170+12
	mov	r0, #1
	add	ip, r8, #544
	str	ip, [fp, #-48]
	bl	dprint_vfmw
	ldr	r1, [r8, #544]
	ldr	r0, [r4, #528]
	add	r5, r8, #560
	bl	FreeUsdByDec
	ldr	ip, [fp, #-48]
	mov	r8, #0
	mov	r9, #0
	strd	r8, [ip]
	ldr	r1, [r5, #-8]
	ldr	r0, [r4, #528]
	bl	FreeUsdByDec
	strd	r8, [r5, #-8]
	mov	r2, #0
	ldr	r0, [r4, #528]
	ldr	r1, [r10]
	bl	FSP_SetDisplay
	cmp	r7, #1
	mov	r2, #0
	ldreq	r3, [r6, #4008]
	moveq	r0, r7
	ldrne	r3, [r6, #4000]
	movne	r0, #1
	strb	r2, [r3, #1]
	b	.L1130
.L1164:
	ldrb	r3, [r9, #457]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1138
	b	.L1133
.L1169:
	ldr	r2, [r6, #4008]
	mov	r0, r3
	mov	r3, #0
	strb	r3, [r2, #1]
	strb	r3, [r9, #449]
	b	.L1130
.L1163:
	str	r0, [sp]
	mov	r3, r7
	mov	r2, r8
	ldr	r1, .L1170+16
	mov	r0, r8
	bl	dprint_vfmw
	mov	r0, r8
	b	.L1130
.L1166:
	movw	r2, #595
	ldr	r1, .L1170+20
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r8
	b	.L1130
.L1171:
	.align	2
.L1170:
	.word	.LC62
	.word	.LC23
	.word	.LC24
	.word	.LC63
	.word	.LC60
	.word	.LC61
	UNWIND(.fnend)
	.size	VC1DEC_VDMPostProc, .-VC1DEC_VDMPostProc
	.align	2
	.global	VC1_Vfmw_DecodeArbiter
	.type	VC1_Vfmw_DecodeArbiter, %function
VC1_Vfmw_DecodeArbiter:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	subs	r4, r0, #0
	beq	.L1237
	add	r5, r4, #12288
	ldrb	r3, [r5, #448]	@ zero_extendqisi2
	tst	r3, #16
	beq	.L1234
	add	r6, r4, #49152
	bic	r3, r3, #20
	strb	r3, [r5, #448]
	ldr	r3, [r6, #124]
	sub	r3, r3, #2
	cmp	r3, #1
	ldr	r3, [r4]
	bls	.L1176
	add	r2, r4, #32768
	ldr	r1, [r2, #4080]
	ldr	r2, [r3, #8]
.L1177:
	sub	r3, r2, #1
	str	r2, [r6, #124]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L1193
.L1185:
	.word	.L1184
	.word	.L1186
	.word	.L1209
	.word	.L1188
.L1214:
	mov	r1, #0
.L1188:
	ldrb	r3, [r5, #450]	@ zero_extendqisi2
	cmp	r3, #0
	streq	r3, [r6, #56]
	beq	.L1193
	cmp	r3, #2
	bne	.L1194
	ldr	r3, [r6, #56]
	adds	r3, r3, #0
	movne	r3, #1
.L1191:
	cmp	r1, #0
	bne	.L1195
.L1203:
	ldr	r1, .L1239
	mov	r0, #1
	bl	dprint_vfmw
.L1205:
	add	r0, r4, #12736
	ldr	r1, [r6, #528]
	bl	VC1_ClearCurPic
	ldr	r3, .L1239+4
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L1234
	mov	r3, #0
	ldr	r0, [r6, #528]
	mov	r2, r3
	mov	r1, #113
	blx	r4
.L1234:
	mov	r0, #0
.L1231:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1210:
	mov	r1, #0
.L1193:
	mov	r3, #1
.L1187:
	cmp	r1, #0
	beq	.L1196
.L1195:
	cmp	r1, #1
	bls	.L1207
.L1199:
	cmp	r3, #0
	beq	.L1205
.L1200:
	ldrb	r3, [r5, #3544]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1202
	add	r3, r5, #3600
	add	ip, r4, #23040
	add	r3, r3, #12
	add	ip, ip, #52
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	add	r1, r5, #3856
	add	r0, r4, #23296
	add	r1, r1, #4
	mov	r2, #100
	add	r0, r0, #44
	bl	memcpy
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1213:
	mov	r3, #0
.L1196:
	ldrb	r2, [r5, #450]	@ zero_extendqisi2
	sub	r0, r2, #4
	sub	r1, r2, #1
	cmp	r1, #1
	cmphi	r0, #1
	bls	.L1203
.L1197:
	sub	r2, r2, #2
	tst	r2, #253
	bne	.L1199
	ldr	r1, .L1239+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1205
.L1176:
	ldr	r2, [r3, #8]
	cmp	r2, #4
	cmpne	r2, #1
	bls	.L1178
	add	r3, r4, #32768
	ldr	r1, [r3, #4080]
	b	.L1177
.L1212:
	mov	r1, #0
.L1186:
	ldrb	r3, [r5, #450]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1193
	cmp	r3, #1
	beq	.L1238
.L1209:
	mov	r3, #0
	b	.L1187
.L1211:
	mov	r1, #0
.L1184:
	ldrb	r3, [r5, #450]	@ zero_extendqisi2
	sub	r3, r3, #2
	tst	r3, #253
	movne	r3, #1
	moveq	r3, #0
	b	.L1187
.L1202:
	add	r1, r5, #3616
	add	r0, r4, #23040
	add	r1, r1, #12
	mov	r2, #172
	add	r0, r0, #68
	add	r6, r4, #20480
	bl	memcpy
	add	ip, r5, #3792
	add	ip, ip, #8
	add	lr, r6, #2800
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1, r2}
	stmia	lr, {r0, r1, r2}
	add	r1, r5, #3952
	add	r0, r6, #2960
	add	r1, r1, #8
	mov	r2, #176
	bl	memcpy
	ldr	ip, [r5, #4004]
	add	r3, r4, #36864
	ldr	r2, .L1239+12
	add	r1, r4, #16384
	add	r0, r4, #23552
	strb	ip, [r5, #452]
	add	r1, r1, #40
	ldr	r3, [r3, #4]
	add	r0, r0, #64
	ldr	r4, [r2, #52]
	mov	r2, r3, asl #4
	sub	r2, r2, r3, asl #2
	blx	r4
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1194:
	and	r3, r3, #251
	cmp	r3, #1
	bne	.L1193
	str	r3, [r6, #56]
	b	.L1187
.L1238:
	ldr	r3, [r5, #456]
	bic	r3, r3, #16711680
	bic	r3, r3, #65280
	cmp	r3, #1
	movne	r3, #0
	bne	.L1191
	cmp	r1, #0
	beq	.L1203
	cmp	r1, #1
	bhi	.L1200
.L1207:
	ldrb	r2, [r5, #450]	@ zero_extendqisi2
	b	.L1197
.L1178:
	add	r7, r4, #32768
	ldr	r1, .L1239+16
	mov	r0, #2
	bl	dprint_vfmw
	ldr	r1, [r7, #4088]
	ldr	r0, [r6, #528]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L1179
	ldr	r1, [r8, #544]
	add	r9, r8, #560
	ldr	r0, [r6, #528]
	add	r10, r8, #576
	bl	FreeUsdByDec
	ldr	r1, [r8, #552]
	ldr	r0, [r6, #528]
	add	r3, r8, #544
	str	r3, [fp, #-48]
	bl	FreeUsdByDec
	ldr	r1, [r8, #560]
	ldr	r0, [r6, #528]
	bl	FreeUsdByDec
	ldr	r1, [r8, #568]
	ldr	r0, [r6, #528]
	bl	FreeUsdByDec
	ldr	r3, [fp, #-48]
	mov	r0, #0
	mov	r1, #0
	mov	r2, #1
	strd	r0, [r3]
	strd	r0, [r9, #-8]
	strd	r0, [r9]
	strd	r0, [r10, #-8]
	ldr	r1, [r7, #4088]
	ldr	r0, [r6, #528]
	bl	FSP_ClearLogicFs
	mov	r2, #1
	ldr	r1, [r7, #4084]
	ldr	r0, [r6, #528]
	bl	FSP_ClearLogicFs
	mov	r3, #0
	str	r3, [r7, #4084]
	str	r3, [r7, #4088]
	ldr	r0, [r6, #528]
	bl	FSP_GetNullLogicFs
	str	r0, [r7, #4088]
	str	r0, [r7, #4084]
.L1179:
	ldr	r2, [r7, #4004]
	mov	r3, #0
	str	r3, [r7, #4080]
	cmp	r2, r3
	beq	.L1233
	ldr	r1, [r7, #4008]
	cmp	r1, #0
	beq	.L1233
	strb	r3, [r2, #1]
	ldr	r2, [r7, #4008]
	strb	r3, [r2, #1]
	ldr	r2, [r7, #4004]
	strb	r3, [r2]
	ldr	r2, [r7, #4008]
	strb	r3, [r2]
	ldr	r3, [r4]
	ldr	r1, [r7, #4080]
	ldr	r2, [r3, #8]
	b	.L1177
.L1233:
	ldr	r3, [r4]
	ldr	r2, [r3, #8]
	sub	r3, r2, #1
	str	r2, [r6, #124]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L1210
.L1206:
	.word	.L1211
	.word	.L1212
	.word	.L1213
	.word	.L1214
.L1237:
	ldr	r3, .L1239+20
	movw	r2, #2270
	ldr	r1, .L1239+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1231
.L1240:
	.align	2
.L1239:
	.word	.LC65
	.word	g_event_report
	.word	.LC66
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC64
	.word	.LC43
	.word	.LC24
	UNWIND(.fnend)
	.size	VC1_Vfmw_DecodeArbiter, .-VC1_Vfmw_DecodeArbiter
	.align	2
	.global	VC1_Vfmw_StartDecode
	.type	VC1_Vfmw_StartDecode, %function
VC1_Vfmw_StartDecode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r4, r0, #0
	beq	.L1260
	ldr	r3, [r4]
	add	r5, r4, #12288
	add	r6, r4, #12736
	add	r7, r4, #8
	ldrb	r1, [r5, #3544]	@ zero_extendqisi2
	ldr	r2, [r3, #600]
	cmp	r1, #1
	str	r2, [r5, #268]
	ldr	r3, [r3, #652]
	str	r3, [r5, #272]
	beq	.L1244
	mov	r0, r6
	bl	VC1_Vfmw_UpdataLastPicRNDCTRL
.L1244:
	mov	r1, r7
	mov	r0, r4
	bl	VC1_WritePicMsg
	add	r3, r4, #36864
	ldr	r2, .L1265
	add	r1, r6, #24064
	ldr	r3, [r3, #4]
	add	r1, r1, #72
	add	r0, r4, #92
	ldr	r8, [r2, #52]
	mov	r2, r3, asl #6
	strb	r3, [r4, #78]
	sub	r2, r2, r3, asl #4
	blx	r8
	mov	r1, r7
	mov	r0, r6
	bl	VC1_CfgVDH
	ldrb	r3, [r5, #450]	@ zero_extendqisi2
	cmp	r3, #1
	ldrlsb	r2, [r5, #452]	@ zero_extendqisi2
	strlsb	r2, [r5, #453]
	cmp	r3, #5
	beq	.L1261
	mov	r2, #0
	strb	r2, [r4, #9]
	ldrb	r2, [r5, #452]	@ zero_extendqisi2
	ldrb	r1, [r5, #456]	@ zero_extendqisi2
.L1247:
	strb	r2, [r4, #8]
	strb	r2, [r5, #451]
	strb	r1, [r5, #457]
	strb	r3, [r5, #459]
	ldrb	r3, [r4, #11]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1262
	and	r2, r3, #251
	cmp	r2, #1
	addeq	r1, r4, #49152
	streq	r2, [r1, #56]
.L1249:
	ldr	r2, [r4]
	str	r7, [r4, #4]
	ldr	r0, [r2, #944]
	cmp	r0, #1
	beq	.L1263
	cmp	r0, #2
	beq	.L1264
.L1253:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1264:
	ldr	r2, [r2, #948]
	cmp	r7, #0
	cmpne	r2, #0
	ble	.L1253
	sub	r3, r3, #2
	ands	r5, r3, #253
	bne	.L1253
	add	r3, r4, #32768
	add	r1, r4, #49152
	mov	r0, r6
	ldr	r3, [r3, #4000]
	strb	r5, [r3, #1]
	ldr	r2, [r4]
	ldr	r3, [r2, #948]
	sub	r3, r3, #1
	str	r3, [r2, #948]
	ldr	r1, [r1, #528]
	bl	VC1_ClearCurPic
	str	r5, [r4, #4]
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1262:
	add	r8, r4, #49152
	ldr	r5, [r8, #56]
	cmp	r5, #0
	bne	.L1249
	mov	r0, r6
	ldr	r1, [r8, #528]
	bl	VC1_ClearCurPic
	add	r3, r4, #32768
	mov	r0, r5
	ldr	r3, [r3, #4000]
	strb	r5, [r3]
	ldr	r3, [r8, #60]
	add	r3, r3, #1
	str	r3, [r8, #60]
	str	r5, [r4, #4]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1261:
	mov	r1, #1
	strb	r1, [r4, #9]
	ldrb	r2, [r5, #453]	@ zero_extendqisi2
	add	r0, r4, #49152
	strb	r1, [r5, #456]
	strb	r2, [r5, #452]
	ldr	r0, [r0, #80]
	sub	r0, r0, #1
	str	r0, [r5, #172]
	b	.L1247
.L1263:
	cmp	r7, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	sub	r3, r3, #2
	ands	r5, r3, #253
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r2, r4, #32768
	add	r3, r4, #49152
	mov	r0, r6
	ldr	r2, [r2, #4000]
	strb	r5, [r2, #1]
	ldr	r1, [r3, #528]
	bl	VC1_ClearCurPic
	str	r5, [r4, #4]
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1260:
	ldr	r3, .L1265+4
	movw	r2, #2423
	ldr	r1, .L1265+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1266:
	.align	2
.L1265:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC43
	.word	.LC24
	UNWIND(.fnend)
	.size	VC1_Vfmw_StartDecode, .-VC1_Vfmw_StartDecode
	.align	2
	.global	VC1_Vfmw_ParseAdvHdr
	.type	VC1_Vfmw_ParseAdvHdr, %function
VC1_Vfmw_ParseAdvHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	r8, [r0, #3128]
	mov	r5, r0
	mov	r4, #0
	str	r1, [fp, #-64]
	mov	r1, #32
	strb	r4, [r0, #6]
	mov	r0, r8
	str	r2, [fp, #-60]
	add	r10, r5, #32768
	str	r4, [fp, #-52]
	add	r9, r5, #36352
	strh	r4, [fp, #-48]	@ movhi
	bl	BsGet
	ldr	r3, [r8, #24]
	add	r9, r9, #76
	ldr	r7, [r10, #3680]
	ldr	r6, [r10, #3660]
	mov	r3, r3, lsr #3
	rsb	r7, r3, r7
	add	r6, r6, r3
	mov	r2, r7
	mov	r1, r6
	uxtb	r3, r0
	mov	r0, r8
	str	r3, [fp, #-56]
	bl	BsInit
	ldr	r3, [fp, #-56]
	sub	r2, r3, #10
	cmp	r2, #5
	bhi	.L1268
	cmp	r3, #11
	ldrb	r3, [r5]	@ zero_extendqisi2
	beq	.L1348
	and	r1, r3, #7
	cmp	r1, #7
	beq	.L1349
	add	r7, r5, #20480
	strb	r4, [r5, #8]
	str	r4, [r7, #3652]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L1305
.L1284:
	.word	.L1283
	.word	.L1305
	.word	.L1285
	.word	.L1306
	.word	.L1287
	.word	.L1288
.L1268:
	sub	r2, r3, #27
	cmp	r2, #4
	bhi	.L1299
	cmp	r3, #28
	cmpgt	r7, #5
	ble	.L1301
	cmp	r7, #0
	beq	.L1301
.L1304:
	cmp	r4, #5
	ldrb	r3, [r6], #1	@ zero_extendqisi2
	subls	r2, fp, #52
	strlsb	r3, [r4, r2]
	add	r4, r4, #1
	cmp	r4, r7
	bne	.L1304
	ldr	r2, [fp, #-52]
	movw	r3, #21572
	movt	r3, 12615
	cmp	r2, r3
	beq	.L1350
.L1301:
	ldr	r0, [fp, #-60]
	mov	r1, r9
	bl	VC1_ClearCurPacket
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1299:
	cmp	r3, #254
	beq	.L1351
.L1305:
	ldr	r0, [fp, #-60]
	mov	r1, r9
	bl	VC1_ClearCurPacket
	mov	r0, #0
.L1273:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1348:
	and	r3, r3, #7
	cmp	r3, #7
	beq	.L1352
.L1298:
	ldr	r0, [fp, #-60]
	mov	r1, r9
	bl	VC1_ClearCurPacket
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1351:
	mov	r1, #32
	mov	r0, r8
	bl	BsGet
	mov	r1, #32
	mov	r4, r0
	mov	r0, r8
	bl	BsGet
	movw	r2, #20036
	movw	r3, #20553
	movt	r2, 17221
	movt	r3, 18515
	cmp	r0, r2
	cmpeq	r4, r3
	bne	.L1305
	add	r3, r5, #20480
	mov	r2, #1
	strb	r2, [r5, #7]
	ldr	r3, [r3, #3652]
	cmp	r3, #0
	moveq	r0, r2
	beq	.L1273
	ldrb	r3, [r5]	@ zero_extendqisi2
	mov	r0, r2
	strb	r2, [r5, #6]
	orr	r3, r3, #16
	strb	r3, [r5]
	b	.L1273
.L1306:
	ldr	r4, .L1357
.L1342:
	ldr	r0, [fp, #-64]
	mov	r2, #176
	mov	r1, #0
	add	r0, r0, #348
	ldrb	r3, [r0, #31]	@ zero_extendqisi2
	str	r3, [fp, #-56]
	ldr	r3, [r4, #48]
	blx	r3
	ldr	r0, [fp, #-64]
	ldrb	r3, [fp, #-56]	@ zero_extendqisi2
	strb	r3, [r0, #379]
.L1289:
	add	r0, r5, #24064
	ldr	r3, [r4, #48]
	mov	r2, #12288
	mov	r1, #0
	add	r0, r0, #72
	blx	r3
	mov	r0, r8
	bl	BsPos
	ldr	r3, [fp, #-64]
	mov	r1, r5
	mov	r2, r3
	str	r0, [r3, #488]
	mov	r0, r8
	bl	VC1_Vfmw_ParseAdvPicHdr
	cmp	r0, #1
	mov	r4, r0
	beq	.L1353
	mov	r1, r9
	ldr	r0, [fp, #-60]
	bl	VC1_ClearCurPacket
	movw	r2, #5725
	ldr	r1, .L1357+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	b	.L1273
.L1349:
	mov	r4, #1
	orr	r3, r3, #16
	strb	r4, [r5, #6]
	mov	r0, r4
	strb	r3, [r5]
	b	.L1273
.L1285:
	ldr	r4, .L1357
	mov	r3, #1
	strb	r3, [r5, #8]
	mov	r2, #16
	ldr	r3, [fp, #-64]
	mov	r1, #0
	add	r0, r3, #508
	ldr	r3, [r4, #48]
	blx	r3
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1289
	b	.L1342
.L1283:
	orr	r3, r3, #32
	ldr	r0, [fp, #-60]
	mov	r1, r9
	strb	r3, [r5]
	bl	VC1_ClearCurPacket
	mov	r0, #1
	b	.L1273
.L1287:
	mov	r0, r8
	ldr	r2, [fp, #-64]
	mov	r1, r5
	bl	VC1_Vfmw_ParseAdvEntptHdr
	cmp	r0, #1
	mov	r4, r0
	bne	.L1298
	ldr	r1, [fp, #-64]
	mov	r0, r5
	bl	VC1_Vfmw_UpdateAdvSPS
	ldrb	r3, [r5]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r5]
	b	.L1298
.L1288:
	ldr	r2, [fp, #-64]
	mov	r0, r8
	mov	r1, r5
	bl	VC1_Vfmw_ParseAdvSeqHdr
	cmp	r0, #1
	mov	r4, r0
	ldreqb	r3, [r5]	@ zero_extendqisi2
	orreq	r3, r3, #1
	streqb	r3, [r5]
	b	.L1298
.L1350:
	ldrb	r2, [fp, #-48]	@ zero_extendqisi2
	ldrb	r3, [r10, #3788]	@ zero_extendqisi2
	sub	r2, r2, #65
	clz	r2, r2
	mov	r2, r2, lsr #5
	bfi	r3, r2, #0, #1
	strb	r3, [r10, #3788]
	uxtb	r3, r3
	tst	r3, #1
	ldrneb	r2, [fp, #-47]	@ zero_extendqisi2
	bfine	r3, r2, #1, #4
	strneb	r3, [r10, #3788]
	b	.L1301
.L1352:
	mov	r0, r8
	ldr	r2, [fp, #-64]
	mov	r1, r5
	bl	VC1_Vfmw_ParseAdvSlcHdr
	cmp	r0, #1
	bne	.L1271
	add	r7, r5, #20480
	ldr	r8, [r7, #3652]
	cmp	r8, #255
	bhi	.L1354
	mov	r3, r8, asl #4
	mov	r2, r8, asl #6
	str	r3, [fp, #-56]
	movw	r0, #24136
	str	r2, [fp, #-60]
	rsb	r2, r3, r2
	ldr	r3, [r5, #3128]
	add	r9, r5, r2
	movw	r2, #24144
	movw	ip, #24152
	strb	r8, [r9, r2]
	add	r2, r9, #24064
	ldr	r1, [r3, #24]
	add	r1, r6, r1, lsr #3
	str	r1, [r9, r0]
	ldr	r1, [r3, #24]
	mov	r6, r2
	and	r1, r1, #7
	str	r1, [r9, ip]
	ldr	r1, [r3, #16]
	add	ip, r2, #72
	ldr	r3, [r3, #24]
	str	ip, [fp, #-68]
	rsb	r3, r3, r1, lsl #3
	str	r3, [r2, #92]
	ldr	r0, [r9, r0]
	bl	MEM_Vir2Phy
	movw	r2, #24176
	add	r3, r6, #112
	str	r0, [r6, #84]
	ldr	r1, [r10, #3688]
	str	r1, [r9, r2]
	ldr	r2, [r10, #3664]
	cmp	r2, #0
	beq	.L1274
	ldr	r1, [r10, #3676]
	cmp	r1, #0
	beq	.L1274
	ldr	ip, [fp, #-68]
	movw	r0, #24168
	str	r2, [ip, #4]
	add	r2, r9, #24064
	str	r4, [r9, r0]
	ldr	r0, [r10, #3684]
	str	r1, [r2, #100]
	mov	r0, r0, asl #3
	str	r0, [r2, #108]
	ldr	r2, [r10, #3692]
	str	r2, [r3, #4]
.L1275:
	ldr	r2, [r7, #3572]
	ldr	r1, [r7, #3568]
	ldrb	r4, [r5, #8]	@ zero_extendqisi2
	mul	r1, r1, r2
	cmp	r4, #0
	sub	r1, r1, #1
	beq	.L1276
	ldr	ip, [fp, #-56]
	add	r3, r2, #1
	ldr	lr, [fp, #-64]
	movw	r4, #24160
	sub	r0, ip, r8, asl #2
	add	r3, r3, r3, lsr #31
	add	r0, lr, r0
	ldr	lr, [fp, #-60]
	add	r0, r0, #520
	rsb	lr, ip, lr
	ldr	ip, [r0, #8]
	add	lr, r5, lr
	sub	r3, ip, r3, asr #1
	cmp	r1, r3
	str	r3, [lr, r4]
	movcs	r1, #0
	movcc	r1, #1
	cmp	r3, #0
	movle	r1, #0
	cmp	r1, #0
	bne	.L1355
.L1277:
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-56]
	rsb	r9, r2, r3
	add	r5, r5, r9
.L1347:
	add	r3, r5, #24064
	add	r3, r3, #88
	ldr	r3, [r3, #4]
	cmp	r3, #0
	ble	.L1280
	add	r3, r5, #24064
	add	r3, r3, #72
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L1296
	add	r5, r5, #24064
	ldr	r3, [r5, #108]
	cmp	r3, #0
	ble	.L1280
.L1296:
	ldr	r3, [r7, #3652]
	mov	r0, #1
	add	r3, r3, r0
	str	r3, [r7, #3652]
	b	.L1273
.L1353:
	mov	r0, r8
	bl	BsPos
	ldr	r2, [fp, #-64]
	ldr	r3, [r2, #488]
	rsb	r0, r3, r0
	str	r0, [r2, #488]
	ldrb	r3, [r5]	@ zero_extendqisi2
	mov	r0, r8
	orr	r3, r3, #4
	strb	r3, [r5]
	bl	BsPos
	ldr	r3, [r10, #3680]
	add	r0, r0, #32
	cmp	r0, r3, asl #3
	bge	.L1291
	ldr	r8, [r7, #3652]
	movw	r1, #24144
	ldr	r3, [r5, #3128]
	movw	ip, #24152
	mov	r2, r8, asl #6
	mov	r9, r8, asl #4
	rsb	r4, r9, r2
	str	r2, [fp, #-56]
	add	r4, r5, r4
	movw	r2, #24136
	strb	r8, [r4, r1]
	add	r1, r4, #24064
	ldr	r0, [r3, #24]
	add	r0, r6, r0, lsr #3
	str	r0, [r4, r2]
	ldr	r0, [r3, #24]
	mov	r6, r1
	add	r2, r1, #72
	str	r2, [fp, #-60]
	and	r0, r0, #7
	str	r0, [r4, ip]
	ldr	r0, [r3, #16]
	ldr	r3, [r3, #24]
	rsb	r3, r3, r0, lsl #3
	str	r3, [r1, #92]
	movw	r3, #24136
	ldr	r0, [r4, r3]
	bl	MEM_Vir2Phy
	movw	r1, #24176
	add	r3, r6, #112
	ldr	r2, [fp, #-56]
	str	r0, [r6, #84]
	ldr	r0, [r10, #3688]
	str	r0, [r4, r1]
	ldr	r1, [r10, #3664]
	cmp	r1, #0
	beq	.L1292
	ldr	r0, [r10, #3676]
	cmp	r0, #0
	beq	.L1292
	ldr	lr, [fp, #-60]
	movw	ip, #24168
	str	r1, [lr, #4]
	mov	r1, #0
	str	r1, [r4, ip]
	add	r1, r4, #24064
	ldr	ip, [r10, #3684]
	str	r0, [r1, #100]
	mov	ip, ip, asl #3
	str	ip, [r1, #108]
	ldr	r1, [r10, #3692]
	str	r1, [r3, #4]
.L1293:
	ldr	r1, [r7, #3572]
	ldr	r0, [r7, #3568]
	ldrb	r4, [r5, #8]	@ zero_extendqisi2
	mul	r0, r0, r1
	cmp	r4, #0
	sub	r0, r0, #1
	beq	.L1294
	ldr	ip, [fp, #-64]
	sub	lr, r9, r8, asl #2
	add	r3, r1, #1
	rsb	r4, r9, r2
	add	lr, ip, lr
	add	r4, r5, r4
	add	r3, r3, r3, lsr #31
	movw	r6, #24160
	ldr	ip, [lr, #528]
	add	lr, lr, #520
	sub	r3, ip, r3, asr #1
	str	r3, [r4, r6]
	cmp	r0, r3
	movcs	r0, #0
	movcc	r0, #1
	cmp	r3, #0
	movle	r0, #0
	cmp	r0, #0
	bne	.L1356
.L1295:
	rsb	r2, r9, r2
	add	r5, r5, r2
	b	.L1347
.L1271:
	str	r0, [fp, #-56]
	mov	r1, r9
	ldr	r0, [fp, #-60]
	bl	VC1_ClearCurPacket
	movw	r2, #5640
	ldr	r1, .L1357+8
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [fp, #-56]
	mov	r0, r3
	b	.L1273
.L1291:
	mov	r1, r9
	ldr	r0, [fp, #-60]
	bl	VC1_ClearCurPacket
	movw	r2, #5719
	ldr	r1, .L1357+4
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	b	.L1273
.L1292:
	rsb	r3, r9, r2
	movw	r4, #24168
	add	r3, r5, r3
	mov	r1, #0
	add	lr, r3, #24064
	str	r1, [lr, #76]
	str	r1, [r3, r4]
	str	r1, [lr, #108]
	str	r1, [lr, #100]
	str	r1, [lr, #116]
	b	.L1293
.L1354:
	str	r0, [fp, #-56]
	mov	r0, r5
	ldr	r1, [fp, #-60]
	bl	VC1_ClearCurPic
	ldr	r3, [fp, #-56]
	ldr	r2, [r7, #3652]
	ldr	r1, .L1357+12
	mov	r0, r3
	bl	dprint_vfmw
	mov	r0, r4
	b	.L1273
.L1294:
	ldr	r3, [fp, #-64]
	sub	r1, r9, r8, asl #2
	rsb	ip, r9, r2
	movw	lr, #24160
	add	r1, r3, r1
	add	ip, r5, ip
	add	r1, r1, #520
	ldr	r3, [r1, #8]
	cmp	r0, r3
	str	r3, [ip, lr]
	bcs	.L1295
	ldr	r2, [r1, #8]
	str	r0, [sp]
	mov	r0, #1
	ldr	r1, .L1357+16
	bl	dprint_vfmw
	mov	r0, r4
	b	.L1273
.L1274:
	ldr	r2, [fp, #-56]
	movw	lr, #24168
	ldr	r3, [fp, #-60]
	rsb	r3, r2, r3
	mov	r2, #0
	add	r3, r5, r3
	add	ip, r3, #24064
	str	r2, [ip, #76]
	str	r2, [r3, lr]
	str	r2, [ip, #108]
	str	r2, [ip, #100]
	str	r2, [ip, #116]
	b	.L1275
.L1276:
	ldr	r3, [fp, #-56]
	movw	ip, #24160
	ldr	r0, [fp, #-60]
	sub	r2, r3, r8, asl #2
	rsb	r0, r3, r0
	ldr	r3, [fp, #-64]
	add	r0, r5, r0
	add	r2, r3, r2
	add	r2, r2, #520
	ldr	r3, [r2, #8]
	cmp	r1, r3
	str	r3, [r0, ip]
	bcs	.L1277
	ldr	r2, [r2, #8]
	mov	r0, #1
	str	r1, [sp]
	ldr	r1, .L1357+16
	bl	dprint_vfmw
	mov	r0, r4
	b	.L1273
.L1280:
	ldr	r1, .L1357+20
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	b	.L1273
.L1356:
	ldr	r2, [lr, #8]
	mov	r0, #1
	str	r1, [sp]
	ldr	r1, .L1357+24
	bl	dprint_vfmw
	mov	r0, #0
	b	.L1273
.L1355:
	str	r2, [sp]
	ldr	r1, .L1357+24
	ldr	r2, [r0, #8]
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	b	.L1273
.L1358:
	.align	2
.L1357:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC69
	.word	.LC68
	.word	.LC67
	.word	.LC55
	.word	.LC56
	.word	.LC54
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvHdr, .-VC1_Vfmw_ParseAdvHdr
	.align	2
	.global	VC1_Vfmw_ParseHeader
	.type	VC1_Vfmw_ParseHeader, %function
VC1_Vfmw_ParseHeader:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #0
	cmpne	r0, #0
	mov	r5, r0
	moveq	r4, #1
	movne	r4, #0
	beq	.L1365
	cmp	r2, #32
	bhi	.L1366
	ldrb	r3, [r0, #3096]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1363
	ldrb	r3, [r0]	@ zero_extendqisi2
	mov	r2, r1
	mov	r1, r0
	ldr	r0, [r0, #3128]
	orr	r3, r3, #3
	strb	r3, [r5]
	bl	VC1_Vfmw_ParseSMPPicHdr
	cmp	r0, #1
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldrb	r3, [r5]	@ zero_extendqisi2
	orr	r3, r3, #20
	strb	r3, [r5]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1363:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvHdr
.L1365:
	ldr	r1, .L1367
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1366:
	ldr	r1, .L1367+4
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1368:
	.align	2
.L1367:
	.word	.LC70
	.word	.LC59
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseHeader, .-VC1_Vfmw_ParseHeader
	.align	2
	.global	VC1_SetCodeInfo
	.type	VC1_SetCodeInfo, %function
VC1_SetCodeInfo:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r4, r0, #12288
	mov	r5, r0
	add	r0, r0, #15808
	ldrb	r3, [r4, #3546]	@ zero_extendqisi2
	add	r0, r0, #60
	str	r0, [r4, #3576]
	cmp	r3, #8
	strneb	r3, [r4, #460]
	moveq	r3, #6
	movne	r3, #0
	streqb	r3, [r4, #460]
	moveq	r2, #1
	strneb	r3, [r4, #461]
	ldrb	r3, [r4, #3544]	@ zero_extendqisi2
	streqb	r2, [r4, #461]
	cmp	r3, #0
	ldr	r2, [r1, #20]
	ldr	r1, [r1]
	beq	.L1375
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	BsInit
.L1375:
	bl	BsInit
	ldr	r0, [r4, #3552]
	add	r5, r5, #32768
	add	r3, r4, #3552
	adds	r2, r0, #15
	add	r3, r3, #8
	addmi	r2, r0, #30
	add	ip, r4, #3600
	add	ip, ip, #12
	mov	r2, r2, asr #4
	str	r2, [r5, #4016]
	ldr	r1, [r4, #3556]
	str	r0, [r5, #4032]
	adds	r2, r1, #15
	addmi	r2, r1, #30
	str	r1, [r5, #4036]
	mov	r2, r2, asr #4
	str	r2, [r5, #4020]
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_SetCodeInfo, .-VC1_SetCodeInfo
	.align	2
	.global	VC1_ReceivePacket
	.type	VC1_ReceivePacket, %function
VC1_ReceivePacket:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r4, r1, #0
	add	r1, r0, #49152
	add	r1, r1, #12
	beq	.L1384
	ldr	r2, [r4, #12]
	add	r3, r0, #49152
	str	r2, [r3, #24]
	ldr	r2, [r4]
	str	r2, [r3, #12]
	ldr	r2, [r4, #16]
	str	r2, [r3, #32]
	ldrb	r2, [r4, #6]	@ zero_extendqisi2
	strb	r2, [r3, #20]
	ldr	r2, [r4, #20]
	str	r2, [r3, #40]
	ldrb	r2, [r4, #6]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1379
	ldr	r2, [r4, #92]
	str	r2, [r3, #28]
	ldr	r2, [r4, #80]
	str	r2, [r3, #16]
	ldr	r2, [r4, #96]
	str	r2, [r3, #36]
	ldrb	r2, [r4, #86]	@ zero_extendqisi2
	strb	r2, [r3, #21]
	ldr	r2, [r4, #100]
	str	r2, [r3, #44]
	ldrb	r2, [r4, #86]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1385
.L1380:
	bl	VC1_SetCodeInfo
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1385:
	ldr	r0, [r3, #528]
	bl	VC1_ClearCurPacket
	ldrb	r2, [r4, #86]	@ zero_extendqisi2
	ldr	r1, .L1386
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1379:
	mov	r2, #0
	str	r2, [r3, #28]
	str	r2, [r3, #16]
	str	r2, [r3, #36]
	strb	r2, [r3, #21]
	str	r2, [r3, #44]
	b	.L1380
.L1384:
	ldr	r1, .L1386+4
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1387:
	.align	2
.L1386:
	.word	.LC72
	.word	.LC71
	UNWIND(.fnend)
	.size	VC1_ReceivePacket, .-VC1_ReceivePacket
	.align	2
	.global	VC1DEC_Decode
	.type	VC1DEC_Decode, %function
VC1DEC_Decode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r5, r1, #0
	mov	r4, r0
	beq	.L1414
	cmp	r0, #0
	beq	.L1415
	add	r5, r0, #12544
	ldr	r3, .L1421
	add	r5, r5, #32
	mov	r2, #160
	mov	r0, r5
	ldr	r3, [r3, #52]
	blx	r3
	mov	r1, r5
	mov	r0, r4
	bl	VC1_ReceivePacket
	subs	r5, r0, #0
	beq	.L1416
	ldr	r3, [r4]
	ldr	r2, [r3, #896]
	cmp	r2, #1
	beq	.L1417
.L1393:
	add	r3, r4, #12288
	add	r6, r4, #49152
	ldrb	r3, [r3, #448]	@ zero_extendqisi2
	strb	r3, [r6, #128]
.L1394:
	add	r7, r4, #12736
	add	r1, r4, #15872
	add	r1, r1, #28
	ldr	r2, [r6, #528]
	mov	r0, r7
	bl	VC1_Vfmw_ParseHeader
	subs	r8, r0, #0
	beq	.L1418
	mov	r0, r4
	bl	VC1_Vfmw_DecodeArbiter
	cmp	r0, #0
	bne	.L1419
.L1397:
	mov	r5, #0
.L1390:
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1418:
	add	r1, r4, #49152
	ldr	r0, [r6, #528]
	add	r1, r1, #12
	bl	VC1_ClearCurPacket
	ldr	r3, .L1421+4
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L1397
	ldr	r0, [r6, #528]
	mov	r3, r8
	mov	r2, r8
	mov	r1, #113
	mov	r5, r8
	blx	r4
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1417:
	ldr	r3, [r3, #952]
	cmp	r3, #1
	bne	.L1393
	add	r6, r4, #49152
	add	r3, r4, #12288
	ldrb	r2, [r6, #128]	@ zero_extendqisi2
	strb	r2, [r3, #448]
	b	.L1394
.L1416:
	add	r4, r4, #49152
	ldr	r1, .L1421+8
	ldr	r2, [r4, #8]
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1419:
	mov	r0, r4
	bl	VC1_Vfmw_PrepareDecode
	subs	r5, r0, #0
	bne	.L1398
	ldr	r3, [r4]
	ldr	r2, [r3, #896]
	cmp	r2, #1
	beq	.L1420
.L1399:
	mov	r0, r7
	ldr	r1, [r6, #528]
	bl	VC1_ClearCurPic
.L1400:
	ldr	r3, .L1421+4
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L1397
	mov	r3, #0
	ldr	r0, [r6, #528]
	mov	r2, r3
	mov	r1, #113
	blx	r4
	b	.L1390
.L1415:
	ldr	r1, .L1421+12
	mov	r5, r0
	bl	dprint_vfmw
	b	.L1390
.L1420:
	ldr	r3, [r3, #952]
	cmp	r3, #1
	bne	.L1399
	b	.L1400
.L1414:
	ldr	r1, .L1421+16
	mov	r0, r5
	bl	dprint_vfmw
	b	.L1390
.L1398:
	mov	r0, r4
	bl	VC1_Vfmw_StartDecode
	subs	r5, r0, #0
	movne	r5, r8
	bne	.L1390
	add	r4, r4, #32768
	mov	r2, #1
	ldr	r0, [r6, #528]
	ldr	r1, [r4, #4092]
	bl	FSP_ClearLogicFs
	ldr	r2, [r4, #4000]
	ldr	r3, .L1421+4
	strb	r5, [r2]
	ldr	r2, [r4, #4000]
	strb	r5, [r2, #1]
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L1397
	ldr	r0, [r6, #528]
	mov	r3, r5
	mov	r2, r5
	mov	r1, #113
	blx	r4
	b	.L1390
.L1422:
	.align	2
.L1421:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_event_report
	.word	.LC75
	.word	.LC74
	.word	.LC73
	UNWIND(.fnend)
	.size	VC1DEC_Decode, .-VC1DEC_Decode
	.align	2
	.global	VC1_GetPacketState
	.type	VC1_GetPacketState, %function
VC1_GetPacketState:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r3, r0, #0
	beq	.L1427
	add	r3, r3, #12736
	ldrsb	r3, [r3, #6]
	cmp	r3, #1
	movne	r0, #0
	moveq	r0, #2
	ldmfd	sp, {fp, sp, pc}
.L1427:
	ldr	r3, .L1428
	movw	r2, #6026
	ldr	r1, .L1428+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1429:
	.align	2
.L1428:
	.word	.LC23
	.word	.LC24
	UNWIND(.fnend)
	.size	VC1_GetPacketState, .-VC1_GetPacketState
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.14399, %object
	.size	__func__.14399, 13
__func__.14399:
	.ascii	"Vc1SMPSeqHdr\000"
	.space	3
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
.LC2:
	.word	1
	.word	0
	.word	2
	.word	3
	.word	4
.LC3:
	.word	3
	.word	1
.LC4:
	.word	3
	.word	1
	.word	2
	.word	0
.LC5:
	.word	1
	.word	0
	.word	2
	.word	3
.LC6:
	.word	1
	.word	1
	.word	2
	.word	1
	.word	3
	.word	1
	.word	2
.LC7:
	.word	2
	.word	3
	.word	3
	.word	4
	.word	4
	.word	5
	.word	5
.LC8:
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
.LC9:
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
.LC10:
	.word	256
	.word	128
	.word	85
	.word	64
	.word	51
	.word	43
	.word	37
	.word	32
	.type	__func__.14710, %object
	.size	__func__.14710, 17
__func__.14710:
	.ascii	"VC1_DecBfraction\000"
	.space	3
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
.LC12:
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
.LC11:
	.word	1
	.word	2
	.word	2
	.word	2
	.word	0
	.word	1
	.word	0
	.word	1
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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC13:
	ASCII(.ascii	"pCtx or pstExtraData is NULL!\012\000" )
	.space	1
.LC14:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC15:
	ASCII(.ascii	"VC1 INIT!!!\012\000" )
	.space	3
.LC16:
	ASCII(.ascii	"pBitBuf or pVc1Info is NULL!\012\000" )
	.space	2
.LC17:
	ASCII(.ascii	"picture width out of range\000" )
	.space	1
.LC18:
	ASCII(.ascii	"%s: %s\012\000" )
.LC19:
	ASCII(.ascii	"picture height out of range\000" )
.LC20:
	ASCII(.ascii	"Vc1SMPSeqHdr Err, BS is wrong\000" )
	.space	2
.LC21:
	ASCII(.ascii	"Vc1SMPSeqHdr Err, BS is wrong\012\000" )
	.space	1
.LC22:
	ASCII(.ascii	"pCtx is NULL!\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"pCtx is NULL!\000" )
	.space	2
.LC24:
	ASCII(.ascii	"vc1.c,L%d: %s\012\000" )
	.space	1
.LC25:
	ASCII(.ascii	"image size abnormal(%dx%d)\012\000" )
.LC26:
	ASCII(.ascii	"vc1 actual frame size(%dx%d) exeed max config(%dx%d" )
	ASCII(.ascii	")\012\000" )
	.space	2
.LC27:
	ASCII(.ascii	"partition fs memory fail!\012\000" )
	.space	1
.LC28:
	ASCII(.ascii	"ERROR: FSP_ConfigInstance fail!\012\000" )
	.space	3
.LC29:
	ASCII(.ascii	"line: %d, pImage is NULL!\012\000" )
	.space	1
.LC30:
	ASCII(.ascii	"get frame store fail!\012\000" )
	.space	1
.LC31:
	ASCII(.ascii	"VC1_Vfmw_GetImageBuffer get imgbuf err, clear all r" )
	ASCII(.ascii	"ef!\012\000" )
.LC32:
	ASCII(.ascii	"VC1_Vfmw_GetImageBuffer get_flag!=1, FSP_ClearLogic" )
	ASCII(.ascii	"Fs.\012\000" )
.LC33:
	ASCII(.ascii	"pCodecInf is NULL! \012\000" )
	.space	3
.LC34:
	ASCII(.ascii	"VC1_Vfmw_GetStreamInfo VC1_ArrangeVahbMem err!\012\000" )
.LC35:
	ASCII(.ascii	"VC1_Vfmw_GetStreamInfo VC1_Vfmw_GetImageBuffer err!" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC36:
	ASCII(.ascii	"dec_pts: %lld Usertag = %lld\012\000" )
	.space	2
.LC37:
	ASCII(.ascii	"---------- unref %d\012\000" )
	.space	3
.LC38:
	ASCII(.ascii	"VC1_Vfmw_GetStreamInfo B pic pCodecInf->RefNum < 2 " )
	ASCII(.ascii	"err!\012\000" )
	.space	3
.LC39:
	ASCII(.ascii	"line: %d (pCur,pFwd,pBwd)(%p,%p,%p)\012\000" )
	.space	3
.LC40:
	ASCII(.ascii	"VC1_Vfmw_GetStreamInfo imgbuf = NULL err!\012\000" )
	.space	1
.LC41:
	ASCII(.ascii	"CurFsID(fwd%d,%d,bwd%d) abnormal!(%p,%p)\012\000" )
	.space	2
.LC42:
	ASCII(.ascii	"VC1_Vfmw_GetStreamInfo VC1_Vfmw_BuildRefList err!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC43:
	ASCII(.ascii	"pVC1_CTX_S is NULL!\000" )
.LC44:
	ASCII(.ascii	"VC1_Vfmw_GetStreamInfo error! Release all packets!\012" )
	ASCII(.ascii	"\000" )
.LC45:
	ASCII(.ascii	"%s:%d Code(%d) is invalid\012\000" )
	.space	1
.LC46:
	ASCII(.ascii	"%s:%d Denominator(%d) is invalid\012\000" )
	.space	2
.LC47:
	ASCII(.ascii	"Check Pos 2: %d\012\000" )
	.space	3
.LC48:
	ASCII(.ascii	"Check Pos 3: %d\012\000" )
	.space	3
.LC49:
	ASCII(.ascii	"\012======PicNum  :%6d=========\012\000" )
	.space	2
.LC50:
	ASCII(.ascii	"INTERPFRM  :%#x\012\000" )
	.space	3
.LC51:
	ASCII(.ascii	"VC1_Vfmw_ParseMPBPicHdr err!\012\000" )
	.space	2
.LC52:
	ASCII(.ascii	"VC1_Vfmw_ParseSMPIPicHdr err!\012\000" )
	.space	1
.LC53:
	ASCII(.ascii	"After VC1_Vfmw_ParseSMPPicHdr BS Len <= 0 err!\012\000" )
.LC54:
	ASCII(.ascii	"SLICE_ADDR = %d,SlcEndMbn = %d, MbHeight = %d\012\000" )
	.space	1
.LC55:
	ASCII(.ascii	"SLICE_ADDR = %d,SlcEndMbn = %d, totalMbMin1 = %d\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC56:
	ASCII(.ascii	"VC1_RecordSlcStream stream len <= 0\012\000" )
	.space	3
.LC57:
	ASCII(.ascii	"pCodecInf is NULL!\000" )
	.space	1
.LC58:
	ASCII(.ascii	"pCodeInfo  is NULL! \012\000" )
	.space	2
.LC59:
	ASCII(.ascii	"ChanID is out of range! \012\000" )
	.space	2
.LC60:
	ASCII(.ascii	"pImg is null, pCurImg %p pBwdImg %p pFwdImg %p\012\000" )
.LC61:
	ASCII(.ascii	"line: %d, pToQueImg is Null!\012\000" )
	.space	2
.LC62:
	ASCII(.ascii	"insert buf %d ref %d\012\000" )
	.space	2
.LC63:
	ASCII(.ascii	"err(%d) > out_thr(%d)\012\000" )
	.space	1
.LC64:
	ASCII(.ascii	"----------------- VC1 Imode -> %d -----------------" )
	ASCII(.ascii	"-\012\000" )
	.space	2
.LC65:
	ASCII(.ascii	"NOTE: Drop non-I\012\000" )
	.space	2
.LC66:
	ASCII(.ascii	"NOTE: Drop B\012\000" )
	.space	2
.LC67:
	ASCII(.ascii	" pCodecInf->SlcNum = %d >= 256 \012\000" )
	.space	3
.LC68:
	ASCII(.ascii	"line %d, Code = VC1_SCSLC failed!\012\000" )
	.space	1
.LC69:
	ASCII(.ascii	"line %d, Code = VC1_SCFRM failed!\012\000" )
	.space	1
.LC70:
	ASCII(.ascii	"pCodecInf or pSyntax is NULL! \012\000" )
.LC71:
	ASCII(.ascii	"bitsream para error -----\012\000" )
	.space	1
.LC72:
	ASCII(.ascii	"line %d, pPacket->StreamPack[1].IsLastSeg = %d\012\000" )
.LC73:
	ASCII(.ascii	"ERROR: p_Packet is Null pointer!\012\000" )
	.space	2
.LC74:
	ASCII(.ascii	"ERROR: pVC1_CTX_S is Null pointer!\012\000" )
.LC75:
	ASCII(.ascii	"ERROR: frm %d, Invalid packet pointer!\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
