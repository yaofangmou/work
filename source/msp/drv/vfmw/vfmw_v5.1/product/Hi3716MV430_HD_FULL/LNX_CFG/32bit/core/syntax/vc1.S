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
	.type	VC1_Vfmw_UpdataLastPicRNDCTRL.part.3, %function
VC1_Vfmw_UpdataLastPicRNDCTRL.part.3:
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
	add	r2, r0, #20480
	ldrb	r3, [r2, #2591]	@ zero_extendqisi2
	tst	r3, #251
	moveq	r3, #1
	moveq	r1, r3
	beq	.L15
	cmp	r3, #1
	ldreqsb	r3, [r0, #11]
	ldrneb	r1, [r0, #11]	@ zero_extendqisi2
	clzeq	r3, r3
	moveq	r3, r3, lsr #5
	uxtbne	r3, r1
	uxtbeq	r1, r3
.L15:
	strb	r1, [r0, #11]
	strb	r3, [r2, #2610]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_Vfmw_UpdataLastPicRNDCTRL.part.3, .-VC1_Vfmw_UpdataLastPicRNDCTRL.part.3
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
	ldr	r3, .L23
	add	r6, r0, #45056
	mov	r7, r1
	movw	r2, #48968
	ldr	r8, [r6, #3896]
	mov	r1, #0
	ldr	r3, [r3, #48]
	mov	r4, r0
	blx	r3
	add	r0, r4, #48384
	str	r8, [r6, #3896]
	add	r0, r0, #224
	bl	ResetVoQueue
	ldr	r3, [r7, #20]
	add	r2, r4, #12288
	mov	r5, #1
	add	r3, r3, #1020
	mov	r8, #0
	add	r3, r3, #3
	mov	r0, r4
	bic	r3, r3, #1020
	bic	r3, r3, #3
	str	r3, [r2, #3552]
	add	r1, r3, #2048
	str	r1, [r2, #3556]
	add	r1, r3, #4096
	str	r1, [r2, #3560]
	add	r1, r3, #6144
	str	r1, [r2, #3564]
	add	r1, r3, #8192
	str	r1, [r2, #3568]
	add	r1, r3, #10240
	add	r3, r3, #12288
	str	r1, [r2, #3572]
	str	r3, [r2, #3576]
	str	r7, [r4]
	strb	r5, [r2, #362]
	strb	r5, [r2, #363]
	str	r8, [r2, #3512]
	str	r8, [r2, #3516]
	ldr	r3, [r7, #8]
	str	r3, [r2, #3580]
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r6, #3904]
	beq	.L22
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L22:
	mov	r0, r8
	ldr	r3, .L23+4
	ldr	r2, .L23+8
	mov	r1, #121
	bl	dprint_normal
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L24:
	.align	2
.L23:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC12
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
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #44)
	sub	sp, sp, #44
	mov	r4, r2
	mov	r2, r1, asl #3
	mov	r1, r0
	sub	r0, fp, #60
	bl	BsInit
	mov	r1, #8
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #8
	mov	r5, r0
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #8
	add	r5, r5, r0, lsl #8
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #8
	add	r5, r5, r0, lsl #16
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #8
	add	r5, r5, r0, lsl #24
	sub	r0, fp, #60
	str	r5, [r4, #8]
	bl	BsGet
	mov	r1, #8
	mov	r5, r0
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #8
	add	r5, r5, r0, lsl #8
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #8
	add	r5, r5, r0, lsl #16
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #2
	add	r5, r5, r0, lsl #24
	sub	r0, fp, #60
	str	r5, [r4, #12]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #16]
	cmp	r0, #1
	ldrhi	ip, .L40
	movhi	r1, #148
	bhi	.L35
	mov	r1, #2
	sub	r0, fp, #60
	bl	BsGet
	subs	r5, r0, #0
	bne	.L36
	mov	r1, #3
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #5
	strb	r0, [r4, #17]
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #18]
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #19]
	sub	r0, fp, #60
	bl	BsGet
	subs	r6, r0, #0
	bne	.L37
	mov	r1, #1
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #20]
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #21]
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #22]
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #2
	strb	r0, [r4, #23]
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #24]
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #25]
	sub	r0, fp, #60
	bl	BsGet
	subs	r5, r0, #0
	bne	.L38
	mov	r1, #1
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #26]
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #27]
	sub	r0, fp, #60
	bl	BsGet
	ldrb	r3, [r4, #16]	@ zero_extendqisi2
	mov	r1, #3
	cmp	r3, #0
	strb	r0, [r4, #28]
	sub	r0, fp, #60
	streqb	r5, [r4, #28]
	bl	BsGet
	mov	r1, #2
	strb	r0, [r4, #29]
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #30]
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #31]
	sub	r0, fp, #60
	bl	BsGet
	sub	r0, fp, #60
	mov	r1, #32
	bl	BsGet
	cmp	r0, #0
	bne	.L39
.L27:
	mov	r0, r5
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L39:
	ldr	r2, .L40+4
	mov	r1, #193
	mov	r0, #0
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L36:
	ldr	ip, .L40
	mov	r1, #151
.L35:
	ldr	r3, .L40+8
	mov	r0, #0
	ldr	r2, .L40+12
	mvn	r5, #0
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L37:
	ldr	ip, .L40
	mov	r0, r5
	ldr	r3, .L40+8
	mov	r1, #158
	ldr	r2, .L40+12
	mvn	r5, #0
	str	ip, [sp]
	bl	dprint_normal
	b	.L27
.L38:
	ldr	ip, .L40
	mov	r0, r6
	ldr	r3, .L40+8
	mov	r1, #169
	ldr	r2, .L40+12
	mvn	r5, #0
	str	ip, [sp]
	bl	dprint_normal
	b	.L27
.L41:
	.align	2
.L40:
	.word	.LC14
	.word	.LC15
	.word	.LANCHOR0+12
	.word	.LC13
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
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r5, r0, #12288
	add	r6, r0, #45056
	mov	r7, r0
	ldr	r1, [r5, #3488]
	ldr	r0, [r6, #3904]
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r3, [r5, #355]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L53
	ldrb	r3, [r4, #157]	@ zero_extendqisi2
	mov	r2, #1
	orr	r3, r3, #12
	bfi	r3, r2, #4, #2
	strb	r3, [r4, #157]
.L46:
	ldr	r3, [r5, #3464]
	mov	r1, #0
	mov	r0, r4
	str	r3, [r4, #32]
	ldr	r3, [r5, #3468]
	str	r3, [r4, #36]
	ldr	r3, [r5, #3464]
	mov	r2, r3, lsr #1
	str	r3, [r4, #40]
	ldr	r3, [r5, #3468]
	str	r2, [r4, #48]
	str	r3, [r4, #44]
	mov	r3, r3, lsr #1
	str	r3, [r4, #52]
	bl	SetAspectRatio
	ldrb	r3, [r5, #354]	@ zero_extendqisi2
	cmp	r3, #0
	ldreq	r3, [r6, #3512]
	ldreq	r2, [r6, #3516]
	ldrne	r3, [r6, #3504]
	streq	r3, [r6, #3504]
	streq	r2, [r6, #3508]
	str	r3, [r4, #528]
	mov	r3, #0
	ldr	r2, [r6, #3508]
	str	r2, [r4, #532]
	str	r3, [r6, #3512]
	str	r3, [r6, #3516]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L53:
	ldrb	r2, [r7, #16]	@ zero_extendqisi2
	mov	r1, #1
	ldrb	r3, [r4, #157]	@ zero_extendqisi2
	add	r2, r2, #1
	ubfx	r3, r3, #2, #2
	orr	r3, r2, r3
	cmp	r3, #3
	andls	r2, r3, #3
	ldrb	r3, [r4, #157]	@ zero_extendqisi2
	movhi	r2, #0
	bfi	r3, r2, #2, #2
	bfi	r3, r1, #0, #2
	bfi	r3, r1, #4, #2
	strb	r3, [r4, #157]
	b	.L46
	UNWIND(.fnend)
	.size	VC1_SetImgFormat, .-VC1_SetImgFormat
	.align	2
	.global	VC1DEC_RecycleImage
	.type	VC1DEC_RecycleImage, %function
VC1DEC_RecycleImage:
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
	cmp	r0, #0
	mov	r5, r1
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r4, r0, #45056
	mov	r2, #0
	ldr	r0, [r4, #3904]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #3904]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L57
	ldr	r1, [r5, #168]
	mov	r6, #0
	ldr	r0, [r4, #3904]
	mov	r7, #0
	bl	FreeUsdByDec
	strd	r6, [r5, #168]
	ldr	r1, [r5, #176]
	ldr	r0, [r4, #3904]
	bl	FreeUsdByDec
	strd	r6, [r5, #176]
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L57:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1DEC_RecycleImage, .-VC1DEC_RecycleImage
	.align	2
	.global	VC1DEC_FlushRemainImg
	.type	VC1DEC_FlushRemainImg, %function
VC1DEC_FlushRemainImg:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	add	r5, r0, #45056
	mov	r4, r0
	add	r6, r0, #12288
	ldr	r3, [r5, #3460]
	cmp	r3, #0
	beq	.L58
	ldr	r3, [r0]
	ldr	r3, [r3, #12]
	cmp	r3, #1
	beq	.L58
	ldr	r1, [r6, #3484]
	ldr	r0, [r5, #3904]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L58
	ldr	r1, [r6, #3484]
	ldr	r0, [r5, #3904]
	bl	FSP_GetDisplay
	cmp	r0, #2
	beq	.L72
.L58:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L72:
	mov	r0, r4
	bl	VC1_SetImgFormat
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r7, #168]
	strd	r2, [r7, #176]
	ldr	r3, [r5, #3460]
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L73
.L62:
	mov	r2, #1
	ldr	r1, [r7, #88]
	ldr	r0, [r5, #3904]
	bl	FSP_SetDisplay
	add	r3, r4, #48384
	ldr	r0, [r5, #3904]
	add	r3, r3, #224
	str	r7, [sp]
	mov	r2, r4
	mov	r1, #1
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L58
	ldr	r1, [r7, #88]
	mov	r0, r4
	bl	VC1DEC_RecycleImage
	ldr	r1, [r7, #168]
	ldr	r0, [r5, #3904]
	mov	r8, #0
	bl	FreeUsdByDec
	mov	r9, #0
	ldr	r1, [r7, #176]
	strd	r8, [r7, #168]
	ldr	r0, [r5, #3904]
	bl	FreeUsdByDec
	strd	r8, [r7, #176]
	b	.L58
.L73:
	strb	r2, [r3, #1]
	mov	r1, #0
	ldr	r2, [r5, #3460]
	mov	r3, #3
	strb	r1, [r2]
	strb	r3, [r6, #353]
	b	.L62
	UNWIND(.fnend)
	.size	VC1DEC_FlushRemainImg, .-VC1DEC_FlushRemainImg
	.align	2
	.global	VC1_ArrangeVahbMem
	.type	VC1_ArrangeVahbMem, %function
VC1_ArrangeVahbMem:
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
	add	r3, r0, #39936
	mov	r5, r0
	add	r3, r3, #248
	mov	r0, #0
	mov	r7, r2
	mov	r8, r1
	mov	r2, r0
.L75:
	str	r0, [r3]
	add	r0, r0, #1
	cmp	r0, #5
	strb	r2, [r3, #-1127]
	strb	r2, [r3, #-1128]
	add	r3, r3, #1568
	add	r3, r3, #8
	bne	.L75
	ldr	r3, .L86
	add	r4, r5, #12288
	mov	r2, #36
	mov	r1, #0
	sub	r0, fp, #72
	mov	r6, #1
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r2, [r4, #3464]
	ldr	r0, [r4, #3468]
	add	r3, r5, #45056
	ldr	ip, [r5]
	sub	r1, fp, #72
	str	r2, [fp, #-56]
	mov	r2, #0
	str	r0, [fp, #-52]
	ldr	lr, [ip, #16]
	ldr	r0, [r3, #3904]
	mov	r3, #8
	cmp	lr, #24
	strb	r3, [fp, #-67]
	str	r8, [fp, #-64]
	movne	lr, #3
	moveq	lr, r6
	str	lr, [fp, #-48]
	ldr	ip, [ip, #16]
	str	r7, [fp, #-60]
	cmp	ip, #24
	str	r6, [fp, #-72]
	movne	r3, #2
	moveq	r3, r6
	str	r3, [fp, #-44]
	bl	FSP_ArrangeFsPool
	cmp	r0, #2
	beq	.L84
	cmp	r0, #0
	mov	r5, #0
	strb	r5, [r4, #359]
	bne	.L85
	ldrb	r3, [r4, #352]	@ zero_extendqisi2
	mov	r0, r6
	orr	r3, r3, #8
	strb	r3, [r4, #352]
.L79:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L85:
	ldr	r3, .L86+4
	movw	r1, #547
	ldr	r2, .L86+8
	mov	r0, r5
	bl	dprint_normal
	ldrb	r3, [r4, #352]	@ zero_extendqisi2
	mov	r0, r5
	bic	r3, r3, #8
	strb	r3, [r4, #352]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L84:
	add	r0, r5, #48384
	add	r0, r0, #224
	bl	ResetVoQueue
	strb	r6, [r4, #359]
	mov	r0, #0
	b	.L79
.L87:
	.align	2
.L86:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+28
	.word	.LC16
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
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r5, r0, #12288
	add	r7, r0, #45056
	mov	r6, r0
	mov	r4, r1
	ldr	r0, [r7, #3904]
	ldr	r1, [r5, #3488]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L109
	add	r3, r6, #28160
	ldrsb	r2, [r3, #76]
	add	r3, r6, #32768
	cmp	r2, #0
	bne	.L110
	strb	r2, [r4, #5]
	ldrb	r1, [r3, #2692]	@ zero_extendqisi2
	strb	r1, [r4, #4]
	ldrb	r1, [r3, #2943]	@ zero_extendqisi2
	cmp	r1, #4
	moveq	r1, #3
	strb	r1, [r4, #3]
	ldr	r1, [r5, #3532]
	sub	r1, r1, #1
	strh	r1, [r4, #80]	@ movhi
	ldr	r1, [r5, #3528]
	strb	r2, [r4, #8]
	sub	r1, r1, #1
	strh	r1, [r4, #78]	@ movhi
	ldrb	r1, [r3, #2695]	@ zero_extendqisi2
	strb	r2, [r4, #9]
	strb	r1, [r4, #6]
	ldrb	r1, [r5, #361]	@ zero_extendqisi2
	strb	r2, [r4, #10]
	strb	r2, [r4, #11]
	strb	r1, [r4, #7]
	ldrb	r1, [r3, #2698]	@ zero_extendqisi2
	strb	r1, [r4, #13]
	ldrb	r1, [r3, #2702]	@ zero_extendqisi2
	strb	r1, [r4, #14]
	ldrb	r1, [r3, #2962]	@ zero_extendqisi2
	strb	r1, [r4, #12]
	ldrb	r1, [r3, #2972]	@ zero_extendqisi2
	strb	r1, [r4, #18]
	ldrb	r1, [r3, #2947]	@ zero_extendqisi2
	strb	r1, [r4, #19]
	ldrb	r1, [r3, #2946]	@ zero_extendqisi2
	strb	r1, [r4, #17]
	ldr	r1, [r3, #3032]
	strb	r1, [r4, #16]
	ldrb	r1, [r3, #2706]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L100
	ldrb	r2, [r3, #2946]	@ zero_extendqisi2
	cmp	r2, #8
	movhi	r2, #0
	movls	r2, #1
	strb	r2, [r4, #20]
.L101:
	ldrb	r2, [r3, #2966]	@ zero_extendqisi2
	strb	r2, [r4, #24]
	ldrb	r2, [r3, #2965]	@ zero_extendqisi2
	strb	r2, [r4, #23]
	ldrb	r2, [r3, #2700]	@ zero_extendqisi2
	strb	r2, [r4, #22]
	ldrb	r2, [r3, #2964]	@ zero_extendqisi2
	strb	r2, [r4, #25]
	ldr	r2, [r3, #2976]
	strb	r2, [r4, #26]
	ldrb	r2, [r3, #2967]	@ zero_extendqisi2
	strb	r2, [r4, #21]
	ldrb	r2, [r3, #2951]	@ zero_extendqisi2
	strb	r2, [r4, #27]
	ldrb	r2, [r3, #2952]	@ zero_extendqisi2
	strb	r2, [r4, #28]
	ldr	r2, [r7, #3460]
	ldrb	r2, [r2, #1029]	@ zero_extendqisi2
	strb	r2, [r4, #30]
	ldr	r2, [r7, #3456]
	ldrb	r2, [r2, #1029]	@ zero_extendqisi2
	strb	r2, [r4, #29]
	ldrb	r2, [r3, #2949]	@ zero_extendqisi2
	strb	r2, [r4, #31]
	ldrb	r2, [r3, #3071]	@ zero_extendqisi2
	strb	r2, [r4, #32]
	ldrb	r2, [r3, #2961]	@ zero_extendqisi2
	strb	r2, [r4, #35]
	ldrb	r2, [r3, #2701]	@ zero_extendqisi2
	strb	r2, [r4, #36]
	ldrb	r2, [r3, #2957]	@ zero_extendqisi2
	strb	r2, [r4, #37]
	ldrb	r2, [r3, #2959]	@ zero_extendqisi2
	strb	r2, [r4, #38]
	ldrb	r2, [r3, #2960]	@ zero_extendqisi2
	strb	r2, [r4, #39]
	ldrb	r2, [r3, #2958]	@ zero_extendqisi2
	strb	r2, [r4, #40]
	ldr	r2, [r3, #3024]
	clz	r2, r2
	mov	r2, r2, lsr #5
	strb	r2, [r4, #42]
	ldr	r2, [r3, #3020]
	clz	r2, r2
	mov	r2, r2, lsr #5
	strb	r2, [r4, #43]
	ldr	r2, [r3, #3028]
	clz	r2, r2
	mov	r2, r2, lsr #5
	strb	r2, [r4, #45]
	ldrb	r2, [r3, #2944]	@ zero_extendqisi2
	strb	r2, [r4, #50]
	ldrb	r2, [r3, #2956]	@ zero_extendqisi2
	strb	r2, [r4, #49]
	ldrb	r2, [r3, #2955]	@ zero_extendqisi2
	strb	r2, [r4, #48]
	ldr	r2, [r3, #3036]
	str	r2, [r4, #84]
	ldrb	r2, [r3, #2704]	@ zero_extendqisi2
	cmp	r2, #1
	movne	r2, #0
	movne	r1, r2
	beq	.L111
.L108:
	mov	r3, r2
.L104:
	strb	r3, [r4, #59]
	strb	r1, [r4, #60]
	strb	r2, [r4, #61]
.L98:
	ldr	r3, [r5, #3496]
	add	r6, r6, #12608
	add	r6, r6, #47
	strh	r3, [r4, #72]	@ movhi
	ldr	r3, [r5, #3464]
	strh	r3, [r4, #74]	@ movhi
	ldr	r3, [r5, #3468]
	strh	r3, [r4, #76]	@ movhi
	ldrb	r3, [r5, #365]	@ zero_extendqisi2
	strb	r3, [r4, #63]
	ldrb	r3, [r5, #366]	@ zero_extendqisi2
	strb	r3, [r4, #62]
	ldr	r2, [r5, #3448]
	adds	r3, r2, #127
	addmi	r3, r2, #254
	mov	r3, r3, asr #7
	mov	r3, r3, asl #4
	str	r3, [r4, #116]
	ldr	r3, [r5, #3552]
	str	r3, [r4, #120]
	ldr	r3, [r5, #3556]
	str	r3, [r4, #124]
	ldr	r3, [r5, #3560]
	str	r3, [r4, #128]
	ldr	r3, [r5, #3564]
	str	r3, [r4, #132]
	ldr	r3, [r5, #3568]
	str	r3, [r4, #136]
	ldr	r3, [r5, #3572]
	str	r3, [r4, #140]
	ldr	r3, [r5, #3576]
	str	r6, [r4, #64]
	str	r3, [r4, #144]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L110:
	ldr	r2, [r3, #3084]
	movw	r0, #1576
	strb	r2, [r4, #5]
	ldrb	r2, [r3, #2708]	@ zero_extendqisi2
	strb	r2, [r4, #4]
	ldrb	r2, [r3, #3041]	@ zero_extendqisi2
	cmp	r2, #4
	moveq	r2, #3
	strb	r2, [r4, #3]
	ldr	r2, [r3, #3084]
	cmp	r2, #3
	ldr	r2, [r5, #3532]
	addeq	r2, r2, #1
	addeq	r2, r2, r2, lsr #31
	moveq	r2, r2, asr #1
	sub	r2, r2, #1
	strh	r2, [r4, #80]	@ movhi
	ldr	r1, [r5, #3528]
	sub	r1, r1, #1
	strh	r1, [r4, #78]	@ movhi
	ldrb	r2, [r3, #3081]	@ zero_extendqisi2
	strb	r2, [r4, #8]
	ldrb	r2, [r3, #2884]	@ zero_extendqisi2
	strb	r2, [r4, #6]
	ldrb	r2, [r3, #3072]	@ zero_extendqisi2
	strb	r2, [r4, #9]
	ldrb	r2, [r5, #361]	@ zero_extendqisi2
	strb	r2, [r4, #7]
	ldr	r1, [r7, #3480]
	mla	r1, r0, r1, r5
	add	r1, r1, #27648
	ldrb	r2, [r1, #147]	@ zero_extendqisi2
	strb	r2, [r4, #10]
	ldr	r2, [r7, #3496]
	mla	r2, r0, r2, r5
	add	r2, r2, #27648
	add	r2, r2, #144
	ldrb	r2, [r2, #3]	@ zero_extendqisi2
	strb	r2, [r4, #11]
	ldrb	r2, [r3, #3070]	@ zero_extendqisi2
	strb	r2, [r4, #15]
	ldrb	r2, [r3, #2885]	@ zero_extendqisi2
	strb	r2, [r4, #13]
	ldrb	r2, [r3, #2889]	@ zero_extendqisi2
	strb	r2, [r4, #14]
	ldrb	r2, [r3, #3040]	@ zero_extendqisi2
	strb	r2, [r4, #12]
	ldrb	r2, [r3, #3208]	@ zero_extendqisi2
	strb	r2, [r4, #18]
	ldrb	r2, [r3, #3043]	@ zero_extendqisi2
	strb	r2, [r4, #19]
	ldrb	r2, [r3, #3050]	@ zero_extendqisi2
	strb	r2, [r4, #17]
	ldr	r2, [r3, #3156]
	strb	r2, [r4, #16]
	ldrb	r2, [r3, #2890]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L94
	ldrb	r2, [r3, #3050]	@ zero_extendqisi2
	cmp	r2, #8
	movhi	r2, #0
	movls	r2, #1
	strb	r2, [r4, #20]
.L95:
	ldrb	r2, [r3, #3202]	@ zero_extendqisi2
	strb	r2, [r4, #24]
	ldrb	r2, [r3, #3201]	@ zero_extendqisi2
	strb	r2, [r4, #23]
	ldrb	r2, [r3, #2887]	@ zero_extendqisi2
	strb	r2, [r4, #22]
	ldrb	r2, [r3, #3200]	@ zero_extendqisi2
	strb	r2, [r4, #25]
	ldr	r2, [r3, #3212]
	strb	r2, [r4, #26]
	ldrb	r2, [r3, #3203]	@ zero_extendqisi2
	strb	r2, [r4, #21]
	ldrb	r2, [r3, #3054]	@ zero_extendqisi2
	strb	r2, [r4, #27]
	ldrb	r2, [r3, #3055]	@ zero_extendqisi2
	strb	r2, [r4, #28]
	ldrb	r2, [r3, #3073]	@ zero_extendqisi2
	strb	r2, [r4, #34]
	ldrb	r2, [r3, #3065]	@ zero_extendqisi2
	strb	r2, [r4, #33]
	ldrb	r1, [r3, #3081]	@ zero_extendqisi2
	ldr	r2, [r7, #3460]
	add	r2, r2, r1
	ldrb	r2, [r2, #1029]	@ zero_extendqisi2
	strb	r2, [r4, #30]
	ldrb	r1, [r3, #3081]	@ zero_extendqisi2
	ldr	r2, [r7, #3456]
	add	r2, r2, r1
	ldrb	r2, [r2, #1029]	@ zero_extendqisi2
	strb	r2, [r4, #29]
	ldrb	r2, [r3, #3053]	@ zero_extendqisi2
	strb	r2, [r4, #31]
	ldrb	r2, [r3, #3071]	@ zero_extendqisi2
	strb	r2, [r4, #32]
	ldrb	r2, [r3, #3064]	@ zero_extendqisi2
	strb	r2, [r4, #35]
	ldrb	r2, [r3, #2888]	@ zero_extendqisi2
	strb	r2, [r4, #36]
	ldrb	r2, [r3, #3060]	@ zero_extendqisi2
	strb	r2, [r4, #37]
	ldrb	r2, [r3, #3062]	@ zero_extendqisi2
	strb	r2, [r4, #38]
	ldrb	r2, [r3, #3063]	@ zero_extendqisi2
	strb	r2, [r4, #39]
	ldrb	r2, [r3, #3061]	@ zero_extendqisi2
	strb	r2, [r4, #40]
	ldrb	r2, [r3, #3077]	@ zero_extendqisi2
	clz	r2, r2
	mov	r2, r2, lsr #5
	strb	r2, [r4, #46]
	ldrb	r2, [r3, #3075]	@ zero_extendqisi2
	clz	r2, r2
	mov	r2, r2, lsr #5
	strb	r2, [r4, #42]
	ldrb	r2, [r3, #3079]	@ zero_extendqisi2
	clz	r2, r2
	mov	r2, r2, lsr #5
	strb	r2, [r4, #44]
	ldrb	r2, [r3, #3080]	@ zero_extendqisi2
	clz	r2, r2
	mov	r2, r2, lsr #5
	strb	r2, [r4, #41]
	ldrb	r2, [r3, #3074]	@ zero_extendqisi2
	clz	r2, r2
	mov	r2, r2, lsr #5
	strb	r2, [r4, #43]
	ldrb	r2, [r3, #3078]	@ zero_extendqisi2
	clz	r2, r2
	mov	r2, r2, lsr #5
	strb	r2, [r4, #47]
	ldrb	r2, [r3, #3076]	@ zero_extendqisi2
	clz	r2, r2
	mov	r2, r2, lsr #5
	strb	r2, [r4, #45]
	ldrb	r2, [r3, #3042]	@ zero_extendqisi2
	strb	r2, [r4, #50]
	ldrb	r2, [r3, #3059]	@ zero_extendqisi2
	strb	r2, [r4, #49]
	ldrb	r2, [r3, #3058]	@ zero_extendqisi2
	strb	r2, [r4, #48]
	ldrb	r2, [r3, #3069]	@ zero_extendqisi2
	strb	r2, [r4, #53]
	ldrb	r2, [r3, #3066]	@ zero_extendqisi2
	strb	r2, [r4, #54]
	ldrb	r2, [r3, #3067]	@ zero_extendqisi2
	strb	r2, [r4, #51]
	ldrb	r2, [r3, #3068]	@ zero_extendqisi2
	strb	r2, [r4, #52]
	ldr	r2, [r3, #3188]
	str	r2, [r4, #84]
	ldr	r2, [r5, #3504]
	str	r2, [r4, #88]
	ldr	r2, [r5, #3508]
	str	r2, [r4, #92]
	ldrb	r2, [r3, #2893]	@ zero_extendqisi2
	strb	r2, [r4, #55]
	ldrb	r2, [r3, #2894]	@ zero_extendqisi2
	strb	r2, [r4, #56]
	ldrb	r2, [r3, #2895]	@ zero_extendqisi2
	strb	r2, [r4, #57]
	ldrb	r3, [r3, #2896]	@ zero_extendqisi2
	strb	r3, [r4, #58]
	ldrb	r3, [r5, #365]	@ zero_extendqisi2
	strb	r3, [r4, #63]
	b	.L98
.L100:
	cmp	r1, #1
	beq	.L112
	cmp	r1, #2
	movne	r2, #1
	strb	r2, [r4, #20]
	b	.L101
.L94:
	cmp	r2, #1
	beq	.L113
	cmp	r2, #2
	moveq	r2, #0
	movne	r2, #1
	strb	r2, [r4, #20]
	b	.L95
.L113:
	ldrb	r2, [r3, #3051]	@ zero_extendqisi2
	adds	r2, r2, #0
	movne	r2, #1
	strb	r2, [r4, #20]
	b	.L95
.L112:
	ldrb	r2, [r3, #2948]	@ zero_extendqisi2
	adds	r2, r2, #0
	movne	r2, #1
	strb	r2, [r4, #20]
	b	.L101
.L111:
	ldr	r1, [r7, #3480]
	movw	ip, #1576
	ldr	r2, [r7, #3496]
	ldrb	r0, [r3, #2943]	@ zero_extendqisi2
	mla	r1, ip, r1, r5
	sub	r0, r0, #2
	mla	r2, ip, r2, r5
	tst	r0, #253
	add	r1, r1, #26624
	add	r1, r1, #144
	ldrneb	r3, [r3, #2942]	@ zero_extendqisi2
	add	r2, r2, #26624
	add	r2, r2, #144
	ldrb	r1, [r1, #2]	@ zero_extendqisi2
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	bne	.L104
	b	.L108
.L109:
	movw	r3, #646
	ldr	r2, .L114
	mov	r1, r3
	mov	r0, #20
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_normal
.L115:
	.align	2
.L114:
	.word	.LC17
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
	ldr	lr, [r0, #3144]
	mov	r2, r1
	mov	r3, r0
	ldr	ip, .L117
	add	r1, r0, #3296
	add	r0, r2, #184
	strb	lr, [r2, #70]
	add	r1, r1, #12
	ldr	r3, [r3, #3144]
	ldr	ip, [ip, #52]
	mov	r2, r3, asl #6
	sub	r2, r2, r3, asl #4
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	ip
.L118:
	.align	2
.L117:
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
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r3, r0, #15552
	ldrsb	r3, [r3, #44]
	cmp	r3, #0
	beq	.L120
	add	r3, r0, #20480
	ldr	r3, [r3, #2732]
	cmp	r3, #3
	beq	.L125
.L120:
	ldr	r3, [r0, #3184]
	str	r3, [r1, #148]
.L121:
	add	r2, r0, #32768
	movw	r4, #1576
	mov	lr, #0
	ldr	ip, [r2, #3144]
	ldr	r3, [r2, #3128]
	ldr	r2, [r2, #3104]
	mla	ip, r4, ip, r0
	mla	r0, r4, r3, r0
	ldr	r2, [r2, #1060]
	add	r3, ip, #27392
	add	r3, r3, #80
	and	r2, r2, #3
	add	r0, r0, #27392
	ldr	r3, [r3, #4]
	add	r0, r0, #80
	mov	r2, r2, asl #4
	ldr	r0, [r0, #4]
	and	r3, r3, #3
	strb	lr, [r1, #69]
	orr	r3, r2, r3, asl #2
	and	r2, r0, #3
	orr	r3, r3, r2
	strb	r3, [r1, #68]
	ldmfd	sp, {r4, fp, sp, pc}
.L125:
	ldr	r3, [r0, #3180]
	ldr	r2, [r0, #3176]
	add	r3, r3, #1
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	mul	r3, r2, r3
	str	r3, [r1, #148]
	b	.L121
	UNWIND(.fnend)
	.size	VC1_CfgVDH, .-VC1_CfgVDH
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
	add	r3, r0, #12288
	mov	r4, r0
	ldrb	r2, [r3, #355]	@ zero_extendqisi2
	cmp	r2, #3
	beq	.L137
.L127:
	add	r5, r4, #45056
	ldr	r0, [r5, #3904]
	bl	FSP_IsNewFsAvailable
	cmp	r0, #1
	beq	.L129
	cmn	r0, #1
	beq	.L138
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L137:
	ldrb	r3, [r3, #362]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L127
.L129:
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L138:
	add	r1, r4, #48384
	ldr	r0, [r5, #3904]
	add	r1, r1, #224
	bl	FSP_ClearNotInVoQueue
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
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
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r6, r0, #12288
	mov	r5, r0
	add	r4, r0, #45056
	ldrb	r3, [r6, #354]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L162
	mov	r1, #1
	ldr	r0, [r4, #3904]
	bl	FSP_NewLogicFs
	cmp	r0, #0
	str	r0, [r6, #3488]
	blt	.L163
.L143:
	add	r3, r5, #38912
	add	r3, r3, #144
	mov	r2, r3
	ldrh	r3, [r3]
	cmp	r3, #0
	beq	.L146
	add	r3, r5, #40448
	add	lr, r5, #46848
	add	r3, r3, #184
	add	lr, lr, #88
.L149:
	ldrh	ip, [r3]
	mov	r2, r3
	add	r3, r3, #1568
	cmp	ip, #0
	add	r3, r3, #8
	beq	.L146
	cmp	r3, lr
	bne	.L149
	mov	r1, r0
	ldr	r0, [r4, #3904]
	bl	FSP_ClearLogicFs
	ldr	r2, .L164
	movw	r1, #1048
	mov	r0, #1
	bl	dprint_normal
	add	r3, r5, #38912
	add	r5, r5, #46848
	add	r3, r3, #145
	add	r5, r5, #89
	mov	r2, #0
.L151:
	strb	r2, [r3]
	add	r3, r3, #1568
	strb	r2, [r3, #-1569]
	add	r3, r3, #8
	cmp	r3, r5
	bne	.L151
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L162:
	ldr	r1, [r6, #3484]
	ldr	r0, [r4, #3904]
	bl	FSP_LinkLogicFs
	cmp	r0, #0
	ldrne	r0, [r0, #4]
	ldreq	r0, [r6, #3488]
	strne	r0, [r6, #3488]
	cmp	r0, #0
	bge	.L143
.L163:
	ldr	r2, .L164+4
	movw	r1, #1009
	mov	r0, #0
	bl	dprint_normal
	ldr	r1, [r6, #3484]
	ldr	r0, [r4, #3904]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L144
	ldr	r1, [r7, #168]
	ldr	r0, [r4, #3904]
	bl	FreeUsdByDec
	ldr	r1, [r7, #176]
	ldr	r0, [r4, #3904]
	bl	FreeUsdByDec
	ldr	r1, [r7, #184]
	ldr	r0, [r4, #3904]
	bl	FreeUsdByDec
	ldr	r1, [r7, #192]
	ldr	r0, [r4, #3904]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r7, #168]
	strd	r2, [r7, #176]
	strd	r2, [r7, #184]
	strd	r2, [r7, #192]
	ldr	r1, [r6, #3484]
	ldr	r0, [r4, #3904]
	bl	FSP_ClearLogicFs
	ldr	r1, [r6, #3480]
	ldr	r0, [r4, #3904]
	bl	FSP_ClearLogicFs
	ldr	r0, [r4, #3904]
	bl	FSP_GetNullLogicFs
	str	r0, [r6, #3484]
	str	r0, [r6, #3480]
.L144:
	add	r1, r5, #48384
	mov	r5, #0
	add	r1, r1, #224
	str	r5, [r6, #3476]
	ldr	r0, [r4, #3904]
	bl	FSP_ClearNotInVoQueue
	ldr	r2, .L164+8
	movw	r1, #1015
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L146:
	mov	r3, #0
	str	r2, [r4, #3456]
	mov	r1, #1
	strb	r1, [r2, #1]
.L148:
	ldr	r1, [r4, #3456]
	uxtb	r2, r3
	add	r1, r1, r3
	strb	r2, [r1, #3]
	ldr	r1, [r4, #3456]
	add	r1, r1, r3
	strb	r2, [r1, #259]
	ldr	r1, [r4, #3456]
	add	r1, r1, r3
	strb	r2, [r1, #515]
	ldr	r1, [r4, #3456]
	add	r1, r1, r3
	add	r3, r3, #1
	cmp	r3, #256
	strb	r2, [r1, #771]
	bne	.L148
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L165:
	.align	2
.L164:
	.word	.LC20
	.word	.LC18
	.word	.LC19
	UNWIND(.fnend)
	.size	VC1_Vfmw_GetImageBuffer, .-VC1_Vfmw_GetImageBuffer
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
	ldr	r5, .L241
	mov	r10, r0
	mov	r4, r1
	mov	r8, r2
	mov	r1, #0
	mov	r2, #256
	sub	r0, fp, #556
	mov	r9, r3
	bl	memset
	mov	r2, #256
	mov	r1, #0
	sub	r0, fp, #300
	bl	memset
	add	r0, r10, #35840
	ldr	r3, [r5, #48]
	mov	r2, #16
	mov	r1, #0
	add	r0, r0, #48
	blx	r3
	add	r0, r10, #35840
	ldr	r3, [r5, #48]
	add	r0, r0, #64
	mov	r2, #16
	mov	r1, #0
	blx	r3
	ldrsb	r3, [r10, #4]
	bics	r3, r3, #2
	bne	.L167
	cmp	r4, #1
	beq	.L228
	cmp	r4, #2
	addne	r3, r10, #32768
	beq	.L229
.L176:
	mov	r0, #1
	mov	r2, #0
	str	r2, [r3, #3140]
	str	r2, [r3, #3124]
.L210:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L167:
	add	r5, r10, #20480
	ldrb	r3, [r5, #2692]	@ zero_extendqisi2
	cmp	r3, #1
	ldrb	r3, [r5, #2729]	@ zero_extendqisi2
	beq	.L230
	cmp	r3, #0
	add	r3, r10, #32768
	beq	.L231
.L186:
	ldr	r2, [r3, #3112]
	ldr	r6, [r2, #1128]
	mov	r7, r6
.L185:
	cmp	r4, #1
	beq	.L232
.L187:
	cmp	r4, #2
	bne	.L176
	cmp	r8, #0
	mov	r1, #0
	mov	r2, #1
	str	r4, [r3, #3140]
	str	r4, [r3, #3124]
	strb	r1, [r3, #3120]
	strb	r2, [r3, #3121]
	beq	.L199
	cmp	r9, r1
	beq	.L233
.L199:
	ldr	r2, [r3, #3112]
	ldr	lr, [r3, #3104]
	ldr	ip, [r2, #1128]
.L226:
	ldr	r0, [r3, #3108]
	mov	r1, #1
	str	ip, [r3, #3128]
	mov	r2, #0
	strb	r1, [r3, #3137]
	strb	r2, [r3, #3136]
	ldr	r1, [r0, #1128]
	str	r1, [r3, #3144]
	ldr	r0, [r0, #1128]
	str	r0, [r3, #3148]
	ldr	r0, [r5, #2816]
	ldr	r7, [lr, #1128]
	cmp	r0, #1
	bls	.L234
	bics	r0, r0, #2
	beq	.L205
.L204:
	movw	lr, #1576
	mov	r2, #0
	mul	r7, lr, r7
	str	r2, [fp, #-572]
	mul	r1, lr, r1
	mov	r3, r10
	mul	r0, lr, ip
	add	r2, r7, #26368
	str	r2, [fp, #-568]
	add	r2, r7, #26624
	str	r2, [fp, #-560]
	add	ip, r1, #27136
	ldr	r2, [fp, #-568]
	add	r9, r0, #26368
	add	r5, r1, #26368
	add	r4, r1, #26624
	add	r2, r2, #50
	str	r2, [fp, #-568]
	ldr	r2, [fp, #-560]
	add	lr, r1, #26880
	add	ip, ip, #50
	add	r1, r7, #26880
	add	r8, r0, #26624
	add	r6, r0, #26880
	add	r2, r2, #50
	add	r1, r1, #50
	add	r0, r0, #27136
	str	r1, [fp, #-576]
	add	r7, r7, #27136
	add	r1, r10, ip
	add	r9, r9, #50
	ldr	ip, [fp, #-568]
	add	r9, r10, r9
	add	r6, r6, #50
	add	r0, r0, #50
	add	r5, r5, #50
	add	r4, r4, #50
	add	lr, lr, #50
	add	r7, r7, #50
	str	r9, [fp, #-560]
	add	r9, r10, r2
	ldr	r2, [fp, #-576]
	add	r8, r8, #50
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
.L206:
	ldr	r1, [fp, #-560]
	add	r2, r2, #1
	cmp	r2, #256
	add	r3, r3, #1
	ldrb	r10, [r1, #1]!	@ zero_extendqisi2
	str	r1, [fp, #-560]
	ldr	r1, [fp, #-564]
	strb	r10, [r3, #14]
	ldrb	r10, [r1, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #270]
	ldrb	r10, [r6, #1]!	@ zero_extendqisi2
	str	r1, [fp, #-564]
	ldr	r1, [fp, #-568]
	strb	r10, [r3, #526]
	ldrb	r10, [r0, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #782]
	ldrb	r10, [r5, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #1038]
	ldrb	r10, [r4, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #1294]
	ldrb	r10, [lr, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #1550]
	ldrb	r10, [r1, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #1806]
	ldrb	r10, [ip, #1]!	@ zero_extendqisi2
	str	r1, [fp, #-568]
	strb	r10, [r3, #2062]
	ldrb	r10, [r9, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #2318]
	ldrb	r10, [r8, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #2574]
	ldrb	r10, [r7, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #2830]
	bne	.L206
	mov	r0, #1
.L238:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L231:
	ldr	r1, [r3, #3112]
	cmp	r4, #1
	ldr	r2, [r3, #3108]
	ldr	r6, [r1, #1128]
	ldr	r7, [r2, #1128]
	bne	.L187
.L232:
	ldrb	r2, [r5, #2720]	@ zero_extendqisi2
	cmp	r8, #0
	mov	r1, #0
	strb	r4, [r3, #3121]
	add	r2, r2, #1
	str	r1, [r3, #3140]
	str	r2, [r3, #3124]
	strb	r1, [r3, #3120]
	beq	.L188
	cmp	r9, r1
	beq	.L235
.L188:
	ldr	r2, [r3, #3112]
	ldr	r1, [r3, #3104]
	ldr	r4, [r2, #1128]
.L225:
	str	r4, [r3, #3128]
	ldr	r2, [r2, #1128]
	str	r2, [r3, #3132]
	ldr	r3, [r5, #2816]
	ldr	r8, [r1, #1128]
	cmp	r3, #1
	bls	.L236
.L192:
	bics	r2, r3, #2
	bne	.L193
	ldrb	r2, [r5, #2702]	@ zero_extendqisi2
	cmp	r2, #4
	beq	.L237
.L193:
	movw	r1, #1576
	mov	r3, r10
	mul	r4, r1, r4
	mov	r2, #0
	mul	r8, r1, r8
	add	r7, r4, #26368
	add	r6, r4, #26624
	add	r5, r4, #26880
	add	r0, r4, #27136
	add	lr, r8, #26624
	add	r4, r8, #26368
	add	ip, r8, #26880
	add	r8, r8, #27136
	add	r7, r7, #50
	add	r6, r6, #50
	add	r5, r5, #50
	add	r0, r0, #50
	add	r4, r4, #50
	add	lr, lr, #50
	add	ip, ip, #50
	add	r8, r8, #50
	add	r7, r10, r7
	add	r6, r10, r6
	add	r5, r10, r5
	add	r0, r10, r0
	add	r4, r10, r4
	add	lr, r10, lr
	add	ip, r10, ip
	add	r1, r10, r8
.L198:
	ldrb	r8, [r7, #1]!	@ zero_extendqisi2
	add	r2, r2, #1
	cmp	r2, #256
	add	r3, r3, #1
	strb	r8, [r3, #14]
	ldrb	r8, [r6, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #270]
	ldrb	r8, [r5, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #526]
	ldrb	r8, [r0, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #782]
	ldrb	r8, [r4, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #2062]
	ldrb	r8, [lr, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #2318]
	ldrb	r8, [ip, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #2574]
	ldrb	r8, [r1, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #2830]
	bne	.L198
	mov	r0, #1
	b	.L238
.L228:
	add	r2, r10, #32768
	add	r1, r10, #15552
	ldr	r0, [r2, #3112]
	str	r4, [r2, #3124]
	str	r3, [r2, #3140]
	strb	r3, [r2, #3120]
	ldr	r4, [r0, #1128]
	str	r4, [r2, #3128]
	ldrsb	r3, [r1, #44]
	cmp	r3, #0
	add	r3, r10, #20480
	beq	.L169
	ldr	r2, [r3, #2732]
	ldrb	r5, [r3, #2704]	@ zero_extendqisi2
	cmp	r2, #2
	ldrb	r6, [r3, #2705]	@ zero_extendqisi2
	ldrb	r2, [r3, #2702]	@ zero_extendqisi2
	beq	.L239
.L170:
	cmp	r2, #4
	beq	.L171
.L172:
	movw	r3, #1576
	add	r5, r10, #268
	mul	r3, r3, r4
	add	lr, r10, #780
	add	r4, r10, #524
	add	r5, r5, #2
	add	r4, r4, #2
	add	lr, lr, #2
	add	ip, r3, #26368
	add	r0, r3, #26624
	add	r1, r3, #26880
	add	ip, ip, #50
	add	r3, r3, #27136
	add	r0, r0, #50
	add	r1, r1, #50
	add	r3, r3, #50
	add	ip, r10, ip
	add	r0, r10, r0
	add	r1, r10, r1
	add	r6, r10, #14
	add	r2, r10, r3
	mov	r3, #0
.L174:
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
	bne	.L174
	mov	r0, #1
	b	.L238
.L230:
	cmp	r3, #0
	add	r3, r10, #32768
	beq	.L186
	ldr	r1, [r3, #3108]
	ldr	r2, [r3, #3112]
	ldr	r6, [r1, #1128]
	ldr	r7, [r2, #1128]
	b	.L185
.L229:
	add	r2, r10, #32768
	mov	r0, #1
	add	r1, r10, #15552
	ldr	ip, [r2, #3112]
	str	r0, [r2, #3140]
	str	r0, [r2, #3124]
	strb	r3, [r2, #3120]
	ldr	r0, [r2, #3108]
	ldr	r4, [ip, #1128]
	strb	r3, [r2, #3136]
	str	r4, [r2, #3128]
	ldr	r3, [r0, #1128]
	str	r3, [r2, #3144]
	str	r3, [fp, #-560]
	ldrsb	r3, [r1, #44]
	cmp	r3, #0
	add	r3, r10, #20480
	ldrneb	r5, [r3, #2704]	@ zero_extendqisi2
	ldrneb	r6, [r3, #2705]	@ zero_extendqisi2
	ldreqb	r5, [r3, #2601]	@ zero_extendqisi2
	ldreqb	r6, [r3, #2602]	@ zero_extendqisi2
	ldrneb	r3, [r3, #2702]	@ zero_extendqisi2
	ldreqb	r3, [r3, #2599]	@ zero_extendqisi2
	cmp	r3, #4
	beq	.L240
.L179:
	ldr	r0, [fp, #-560]
	movw	r1, #1576
	mul	r4, r1, r4
	mov	r3, r10
	mul	r0, r1, r0
	mov	r2, #0
	add	r7, r4, #26368
	add	r6, r4, #26624
	add	r5, r4, #26880
	add	r1, r4, #27136
	add	lr, r0, #26624
	add	r4, r0, #26368
	add	ip, r0, #26880
	add	r0, r0, #27136
	add	r7, r7, #50
	add	r6, r6, #50
	add	r5, r5, #50
	add	r1, r1, #50
	add	r4, r4, #50
	add	lr, lr, #50
	add	ip, ip, #50
	add	r0, r0, #50
	add	r7, r10, r7
	add	r6, r10, r6
	add	r5, r10, r5
	add	r1, r10, r1
	add	r4, r10, r4
	add	lr, r10, lr
	add	ip, r10, ip
	add	r0, r10, r0
.L181:
	ldrb	r8, [r7, #1]!	@ zero_extendqisi2
	add	r2, r2, #1
	cmp	r2, #256
	add	r3, r3, #1
	strb	r8, [r3, #14]
	ldrb	r8, [r6, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #270]
	ldrb	r8, [r5, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #526]
	ldrb	r8, [r1, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #782]
	ldrb	r8, [r4, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #1038]
	ldrb	r8, [lr, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #1294]
	ldrb	r8, [ip, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #1550]
	ldrb	r8, [r0, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #1806]
	bne	.L181
	mov	r0, #1
	b	.L238
.L169:
	ldrb	r5, [r3, #2601]	@ zero_extendqisi2
	ldrb	r6, [r3, #2602]	@ zero_extendqisi2
	ldrb	r2, [r3, #2599]	@ zero_extendqisi2
	b	.L170
.L205:
	ldrb	r3, [r5, #2702]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L204
	b	.L210
.L235:
	ldr	r1, [r3, #3104]
	ldr	r2, [r3, #3112]
	ldr	r4, [r1, #1128]
	b	.L225
.L233:
	ldr	lr, [r3, #3104]
	ldr	ip, [lr, #1128]
	b	.L226
.L236:
	ldrb	r3, [r5, #2702]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L193
	ldrb	r9, [r5, #2704]	@ zero_extendqisi2
	mov	r3, #0
	ldrb	r2, [r5, #2705]	@ zero_extendqisi2
	sub	r0, fp, #556
	mov	r1, r9
	str	r2, [fp, #-560]
	bl	VC1_Vfmw_GenerateIntensityMap
	ldr	r2, [fp, #-560]
	mov	r1, r9
	sub	r0, fp, #300
	mov	r3, #1
	bl	VC1_Vfmw_GenerateIntensityMap
	movw	r2, #1576
	mul	r2, r2, r6
	mov	r1, #0
	add	r0, r2, #26368
	add	r2, r2, #26624
	add	r0, r0, #50
	add	r2, r2, #51
	add	r0, r10, r0
	add	r2, r10, r2
	mov	ip, r0
.L194:
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
	bne	.L194
	ldr	r3, [r5, #2816]
	b	.L192
.L234:
	ldrb	r3, [r5, #2702]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L204
	mov	r0, r2
	b	.L210
.L237:
	cmp	r3, #0
	sub	r0, fp, #556
	mov	r3, #0
	ldreqb	r6, [r5, #2820]	@ zero_extendqisi2
	ldrneb	r6, [r5, #2704]	@ zero_extendqisi2
	ldreqb	r5, [r5, #2824]	@ zero_extendqisi2
	ldrneb	r5, [r5, #2705]	@ zero_extendqisi2
	mov	r1, r6
	mov	r2, r5
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	r2, r5
	mov	r1, r6
	sub	r0, fp, #300
	mov	r3, #1
	bl	VC1_Vfmw_GenerateIntensityMap
	movw	r2, #1576
	mul	r2, r2, r7
	mov	r1, #0
	add	r0, r2, #26880
	add	r2, r2, #27136
	add	r0, r0, #50
	add	r2, r2, #51
	add	r0, r10, r0
	add	r2, r10, r2
	mov	ip, r0
.L197:
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
	bne	.L197
	b	.L193
.L239:
	ldr	r3, [r3, #2808]
	cmp	r3, #1
	bne	.L170
.L171:
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
	movw	r3, #1576
	mul	r3, r3, r4
	mov	ip, #0
	add	lr, r3, #26368
	add	r0, r3, #26624
	add	r1, r3, #26880
	add	lr, lr, #50
	add	r3, r3, #27136
	add	lr, r10, lr
	add	r0, r0, #51
	add	r1, r1, #51
	add	r3, r3, #51
	add	r0, r10, r0
	add	r1, r10, r1
	add	r2, r10, r3
	mov	r5, lr
.L173:
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
	bne	.L173
	b	.L172
.L240:
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
	movw	r2, #1576
	str	r4, [fp, #-564]
	mul	r1, r2, r4
	mul	r2, r2, r3
	add	r8, r1, #26368
	add	r6, r1, #26624
	add	r5, r1, #26880
	add	r8, r8, #50
	add	lr, r2, #26368
	add	ip, r2, #26624
	add	r0, r2, #26880
	add	r1, r1, #27136
	add	r2, r2, #27136
	add	r8, r10, r8
	add	r6, r6, #51
	add	r5, r5, #51
	add	r1, r1, #51
	add	lr, lr, #51
	add	ip, ip, #51
	add	r0, r0, #51
	add	r2, r2, #51
	add	r6, r10, r6
	add	r5, r10, r5
	add	r1, r10, r1
	add	lr, r10, lr
	add	ip, r10, ip
	add	r0, r10, r0
	add	r2, r10, r2
	mov	r9, r8
.L180:
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
	bne	.L180
	ldr	r4, [fp, #-564]
	b	.L179
.L242:
	.align	2
.L241:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VC1_Vfmw_BuildRefList, .-VC1_Vfmw_BuildRefList
	.align	2
	.global	VC1_Vfmw_PrepareDecode
	.type	VC1_Vfmw_PrepareDecode, %function
VC1_Vfmw_PrepareDecode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #52)
	sub	sp, sp, #52
	add	r10, r0, #24576
	add	r4, r0, #12288
	mov	r5, r0
	ldrb	r3, [r10, #3660]	@ zero_extendqisi2
	ldr	r2, [r4, #3448]
	cmp	r3, #0
	str	r2, [fp, #-64]
	beq	.L244
	add	r0, r0, #32768
	ldr	r3, [r0, #3084]
	cmp	r3, #3
	ldr	r3, [r4, #3452]
	beq	.L339
	ldr	r2, [fp, #-64]
	mul	r3, r3, r2
	str	r3, [fp, #-68]
.L297:
	add	r3, r4, #12608
	movw	r2, #3514
	add	r3, r3, #32
	movw	r1, #3512
	ldrh	r2, [r3, r2]
	ldrh	r3, [r3, r1]
	adds	r7, r2, #15
	addmi	r7, r2, #30
	adds	r9, r3, #15
	addmi	r9, r3, #30
	ldr	r3, [r4, #3460]
	mov	r7, r7, asr #4
	cmp	r3, r7
	mov	r9, r9, asr #4
	bne	.L246
.L346:
	ldr	r3, [r4, #3456]
	cmp	r3, r9
	bne	.L246
	ldr	r3, [fp, #-64]
	ldrb	r2, [r4, #361]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	cmp	r2, #0
	add	r3, r3, #63
	bic	r3, r3, #63
	str	r3, [r4, #3472]
	beq	.L251
	mov	r2, #0
.L295:
	ldrb	r3, [r4, #355]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L340
.L251:
	ldrb	r3, [r4, #352]	@ zero_extendqisi2
	eor	r3, r3, #8
	ubfx	r3, r3, #3, #1
	orrs	r3, r2, r3
	bne	.L341
.L254:
	mov	r0, r5
	bl	VC1_Vfmw_GetImageBuffer
	subs	r3, r0, #0
	beq	.L342
	add	r6, r5, #45056
	ldr	r1, [r4, #3488]
	ldr	r0, [r6, #3904]
	bl	FSP_GetFsImagePtr
	subs	r3, r0, #0
	beq	.L261
	ldr	r1, [r5]
	ldr	r2, .L349
	ldrd	r0, [r1, #32]
	strd	r0, [r3, #208]
	movw	r1, #1169
	ldr	r0, [r5]
	ldrd	r8, [r0, #48]
	strd	r8, [r3, #216]
	ldr	r0, [r5]
	ldrd	r8, [r0, #64]
	mov	r0, #24
	strd	r8, [r3, #224]
	mvn	r8, #0
	ldr	ip, [r5]
	mvn	r9, #0
	ldr	ip, [ip, #80]
	str	ip, [r3]
	ldr	ip, [r5]
	ldr	ip, [ip, #84]
	str	ip, [r3, #4]
	ldr	ip, [r5]
	ldr	ip, [ip, #88]
	str	ip, [r3, #8]
	ldr	ip, [r5]
	ldr	ip, [ip, #104]
	str	ip, [r3, #12]
	ldr	ip, [r5]
	strd	r8, [ip, #32]
	ldrd	r8, [r3, #216]
	strd	r8, [sp, #8]
	ldrd	r8, [r3, #208]
	strd	r8, [sp]
	bl	dprint_normal
.L261:
	ldrb	r3, [r10, #3660]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L262
	add	r0, r5, #32768
	ldr	r3, [r0, #3084]
	cmp	r3, #3
	beq	.L343
.L262:
	ldr	r3, [r6, #3456]
	mov	r2, #0
	str	r2, [r3, #1060]
.L263:
	ldr	r3, [r6, #3456]
	mov	r2, #0
	strb	r2, [r3, #2]
	ldrb	r3, [r10, #3660]	@ zero_extendqisi2
	cmp	r3, r2
	bne	.L264
	add	r0, r5, #32768
	ldrb	r3, [r0, #2704]	@ zero_extendqisi2
	cmp	r3, #1
	ldreqb	r2, [r0, #2942]	@ zero_extendqisi2
	ldreq	r3, [r6, #3456]
	streqb	r2, [r3, #2]
.L264:
	ldrb	r3, [r4, #354]	@ zero_extendqisi2
	cmp	r3, #5
	cmpne	r3, #1
	movls	r7, #1
	movhi	r7, #0
	bhi	.L265
	ldr	r2, [r4, #3476]
	ldr	r3, [r4, #3480]
	cmp	r2, #0
	ldr	r0, [r4, #3484]
	movne	r2, #2
	moveq	r2, #1
	cmp	r3, r0
	str	r2, [r4, #3476]
	beq	.L267
	ldr	r2, .L349+4
	movw	r1, #1197
	mov	r0, #11
	bl	dprint_normal
	ldr	r0, [r6, #3904]
	mov	r2, #0
	ldr	r1, [r4, #3480]
	bl	FSP_SetRef
	ldr	r0, [r4, #3484]
.L267:
	ldr	r1, [r4, #3488]
	mov	r2, #1
	str	r0, [r4, #3480]
	str	r1, [r4, #3484]
	ldr	r0, [r6, #3904]
	bl	FSP_SetRef
	ldr	r1, [r4, #3480]
	ldr	r0, [r6, #3904]
	bl	FSP_ReleasePmv
	ldrb	r3, [r4, #354]	@ zero_extendqisi2
	cmp	r3, #5
	cmpne	r3, #1
	bhi	.L269
	ldr	r3, [r6, #3464]
	mov	r1, #0
	mov	r2, #1
	strb	r1, [r3]
	ldr	r3, [r6, #3456]
	strb	r2, [r3]
	ldr	r2, [r6, #3460]
	ldr	r3, [r6, #3456]
	str	r2, [r6, #3464]
	str	r3, [r6, #3460]
.L269:
	ldr	r1, [r4, #3488]
	ldr	r0, [r6, #3904]
	bl	FSP_GetLogicFs
	ldr	r1, [r4, #3480]
	mov	r7, r0
	ldr	r0, [r6, #3904]
	bl	FSP_GetLogicFs
	ldr	r1, [r4, #3484]
	mov	r9, r0
	ldr	r0, [r6, #3904]
	bl	FSP_GetLogicFs
	cmp	r7, #0
	cmpne	r9, #0
	moveq	r3, #1
	movne	r3, #0
	cmp	r0, #0
	orreq	r3, r3, #1
	mov	r2, r0
	cmp	r3, #0
	bne	.L344
	ldr	r1, [r7, #24]
	cmp	r1, #0
	beq	.L273
	ldr	r3, [r7, #28]
	cmp	r3, #0
	beq	.L273
	ldrb	r3, [r10, #3660]	@ zero_extendqisi2
	add	r0, r5, #32768
	cmp	r3, #0
	beq	.L276
	ldr	r3, [r0, #3084]
	cmp	r3, #3
	bne	.L276
	ldr	r3, .L349+8
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L333
.L276:
	mov	r3, #0
.L333:
	str	r3, [r7, #60]
	ldr	r3, [r2, #24]
	cmp	r3, #0
	ldrne	r3, [r3, #4]
	ldreq	r3, [r1, #4]
	str	r3, [r5, #112]
	ldr	r3, [r7, #32]
	ldr	r3, [r3, #8]
	str	r3, [r5, #116]
	ldr	r3, [r2, #32]
	ldr	r3, [r3, #8]
	str	r3, [r5, #120]
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #4]
	str	r3, [r5, #104]
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #44]
	str	r3, [r5, #164]
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #48]
	str	r3, [r5, #168]
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #72]
	str	r3, [r5, #172]
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #64]
	str	r3, [r5, #176]
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #68]
	str	r3, [r5, #180]
	ldrb	r3, [r7, #408]	@ zero_extendqisi2
	strb	r3, [r5, #79]
	ldrb	r3, [r4, #354]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L345
	ldr	r3, [r7, #24]
	mov	r2, #0
	ldr	r3, [r3, #4]
	str	r2, [r5, #188]
	str	r3, [r5, #184]
	ldr	r3, [r9, #24]
	cmp	r3, r2
	ldreq	r3, [r7, #24]
.L335:
	ldr	r3, [r3, #4]
	str	r3, [r5, #108]
	b	.L253
.L244:
	ldr	r7, [r4, #3452]
	ldr	r3, [fp, #-64]
	mov	r9, r3
	mul	r3, r7, r3
	str	r3, [fp, #-68]
	ldr	r3, [r4, #3460]
	cmp	r3, r7
	beq	.L346
.L246:
	add	r6, r5, #45056
	sub	r3, fp, #48
	sub	r2, fp, #52
	sub	r1, fp, #56
	ldr	r0, [r6, #3904]
	bl	VCTRL_GetChanImgNum
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	ble	.L248
	mov	r5, #0
	mov	r3, #2
	strb	r3, [r4, #359]
.L329:
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L248:
	ldrb	r3, [r4, #359]	@ zero_extendqisi2
	ldrb	r2, [r4, #361]	@ zero_extendqisi2
	cmp	r3, #2
	moveq	r3, #0
	streqb	r3, [r4, #359]
	ldr	r3, [r4, #3448]
	cmp	r2, #0
	movne	r2, #1
	mov	r3, r3, asl #4
	add	r3, r3, #63
	bic	r3, r3, #63
	str	r3, [r4, #3472]
	bne	.L295
.L294:
	add	r3, r5, #46848
	add	r3, r3, #88
	str	r3, [r6, #3456]
	str	r3, [r6, #3468]
	str	r3, [r6, #3464]
	str	r3, [r6, #3460]
	ldrb	r3, [r4, #359]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L255
.L259:
	add	r2, r7, #1
	mov	r6, r9, asl #4
	mov	r0, r5
	add	r2, r2, r2, lsr #31
	mov	r1, r6
	mov	r2, r2, asr #1
	mov	r2, r2, asl #5
	bl	VC1_ArrangeVahbMem
	cmp	r0, #1
	movne	r5, #0
	bne	.L329
	ldr	r1, [r4, #3460]
	movw	r3, #3660
	ldr	r2, [r4, #3456]
	mov	ip, r7, asl #4
	ldrsb	r3, [r10, r3]
	mov	r1, r1, asl #4
	str	r6, [sp]
	str	r1, [sp, #12]
	mov	r2, r2, asl #4
	str	ip, [sp, #4]
	movw	r1, #1142
	str	r2, [sp, #8]
	ldr	r2, .L349+12
	bl	dprint_normal
	str	r9, [r4, #3456]
	str	r7, [r4, #3460]
	b	.L254
.L339:
	add	r3, r3, #1
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	mul	r3, r3, r2
	str	r3, [fp, #-68]
	b	.L297
.L255:
	add	r1, r5, #48384
	ldr	r0, [r6, #3904]
	add	r1, r1, #224
	bl	FSP_ClearNotInVoQueue
	ldr	r1, [r4, #3484]
	ldr	r0, [r6, #3904]
	bl	FSP_GetFsImagePtr
	subs	r3, r0, #0
	beq	.L257
	ldr	r1, [r3, #168]
	ldr	r0, [r6, #3904]
	str	r3, [fp, #-72]
	bl	FreeUsdByDec
	ldr	r3, [fp, #-72]
	ldr	r0, [r6, #3904]
	ldr	r1, [r3, #176]
	bl	FreeUsdByDec
	ldr	r3, [fp, #-72]
	ldr	r0, [r6, #3904]
	ldr	r1, [r3, #184]
	bl	FreeUsdByDec
	ldr	r3, [fp, #-72]
	ldr	r0, [r6, #3904]
	ldr	r1, [r3, #192]
	bl	FreeUsdByDec
	ldr	r3, [fp, #-72]
	mov	r0, #0
	mov	r1, #0
	strd	r0, [r3, #168]
	strd	r0, [r3, #176]
	strd	r0, [r3, #184]
	strd	r0, [r3, #192]
	ldr	r1, [r4, #3484]
	ldr	r0, [r6, #3904]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #3480]
	ldr	r0, [r6, #3904]
	bl	FSP_ClearLogicFs
	ldr	r0, [r6, #3904]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #3484]
	str	r0, [r4, #3480]
.L257:
	add	r3, r5, #38912
	add	r1, r5, #46848
	ldr	r8, [fp, #-64]
	add	r3, r3, #145
	add	r1, r1, #89
	mov	r2, #0
	str	r2, [r4, #3476]
.L258:
	strb	r2, [r3]
	add	r3, r3, #1568
	strb	r2, [r3, #-1569]
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L258
	str	r8, [fp, #-64]
	b	.L259
.L342:
	ldr	r2, .L349+16
	mov	r1, #1152
	mov	r0, #1
	mov	r5, r3
	bl	dprint_normal
	b	.L329
.L340:
	ldrb	r3, [r4, #362]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L251
	add	r0, r5, #32768
	add	r6, r5, #45056
.L253:
	movw	r3, #3660
	ldrsb	r3, [r10, r3]
	cmp	r3, #0
	bne	.L285
	ldr	r2, [r6, #3456]
	strb	r3, [r2, #1027]
	ldr	r2, [r6, #3456]
	ldrb	r1, [r0, #2943]	@ zero_extendqisi2
	strb	r1, [r2, #1028]
	ldrb	r1, [r0, #2951]	@ zero_extendqisi2
	ldr	r2, [r6, #3456]
	sub	ip, r1, #2
	cmp	ip, #1
	movls	r3, #1
	bls	.L286
	cmp	r1, #4
	beq	.L347
.L286:
	strb	r3, [r2, #1030]
	mov	r1, #1
	strb	r3, [r2, #1029]
	mov	r3, #0
	str	r1, [r4, #3496]
	strb	r3, [r4, #3668]
	ldr	r0, [r4, #3588]
	ldr	r8, [r4, #3624]
	bl	BsPos
	ldr	r7, [r4, #3636]
	cmp	r0, #0
	add	r2, r0, #7
	movge	r2, r0
	ldr	r0, [r4, #3588]
	add	r2, r8, r2, asr #3
	str	r2, [r4, #3660]
	bl	BsPos
	add	r2, r0, #7
	mov	r3, r0
	cmp	r3, #0
	ldr	r0, [r4, #3588]
	movlt	r3, r2
	add	r3, r7, r3, asr #3
	str	r3, [r4, #3672]
	bl	BsPos
	ldr	r7, [r4, #3644]
	mov	r7, r7, asl #3
	and	r3, r0, #7
	ldr	r0, [r4, #3588]
	str	r3, [r4, #3676]
	bl	BsPos
	ldr	r2, [r4, #3528]
	ldr	r3, [r4, #3532]
	ldrb	r1, [r4, #354]	@ zero_extendqisi2
	mul	r3, r3, r2
	sub	r3, r3, #1
	str	r3, [r4, #3684]
	rsb	r0, r0, r7
	str	r0, [r4, #3680]
.L287:
	add	r0, r5, #12608
	mov	r3, #1
	add	r0, r0, #32
	mov	r2, #0
	bl	VC1_Vfmw_BuildRefList
	subs	r5, r0, #0
	movne	r5, #1
	bne	.L329
	ldr	r1, [r4, #3488]
	ldr	r0, [r6, #3904]
	bl	FSP_ClearLogicFs
	ldr	r3, [r6, #3456]
	ldr	r2, .L349+20
	movw	r1, #1373
	mov	r0, #1
	strb	r5, [r3]
	ldr	r3, [r6, #3456]
	strb	r5, [r3, #1]
	bl	dprint_normal
	b	.L329
.L341:
	add	r6, r5, #45056
	b	.L294
.L265:
	ldr	r3, [r4, #3476]
	cmp	r3, #1
	bhi	.L269
	ldr	r1, [r4, #3488]
	mov	r5, r7
	ldr	r0, [r6, #3904]
	bl	FSP_ClearLogicFs
	ldr	r3, [r6, #3456]
	ldr	r2, .L349+24
	movw	r1, #1214
	mov	r0, #1
	strb	r7, [r3]
	ldr	r3, [r6, #3456]
	strb	r7, [r3, #1]
	bl	dprint_normal
	b	.L329
.L343:
	ldr	r3, .L349+8
	ldr	r3, [r3]
	cmp	r3, #1
	ldreq	r2, [r6, #3456]
	streq	r3, [r2, #1060]
	bne	.L262
	b	.L263
.L345:
	ldr	r3, [r9, #60]
	mov	r2, #0
	str	r3, [r7, #60]
	ldr	r1, [r6, #3464]
	ldr	r3, [r6, #3456]
	ldr	r1, [r1, #1060]
	str	r1, [r3, #1060]
	ldr	r3, [r4, #3548]
	add	r3, r3, #1
	str	r3, [r4, #3548]
	ldr	r3, [r7, #28]
	ldr	r3, [r3, #4]
	str	r2, [r5, #188]
	str	r3, [r5, #184]
	ldr	r3, [r9, #28]
	cmp	r3, r2
	ldreq	r3, [r7, #28]
	b	.L335
.L285:
	ldr	r3, [r6, #3456]
	ldr	r2, [r0, #3084]
	strb	r2, [r3, #1027]
	ldr	r3, [r6, #3456]
	ldrb	r2, [r0, #3041]	@ zero_extendqisi2
	strb	r2, [r3, #1028]
	ldrb	r2, [r0, #3054]	@ zero_extendqisi2
	ldr	r3, [r6, #3456]
	sub	ip, r2, #2
	ldrb	r1, [r0, #3081]	@ zero_extendqisi2
	cmp	ip, #1
	movls	r2, #1
	bls	.L288
	cmp	r2, #4
	movne	r2, #0
	beq	.L348
.L288:
	add	r3, r3, r1
	strb	r2, [r3, #1029]
	ldr	r3, [r4, #3496]
	cmp	r3, #0
	beq	.L289
	subs	lr, r3, #1
	moveq	ip, lr
	moveq	r3, ip
	beq	.L291
	add	r2, r5, #15936
	ldr	r8, [fp, #-64]
	add	r2, r2, #20
	mov	r1, #0
.L292:
	ldr	r3, [r2, #64]
	add	r2, r2, #48
	strb	r1, [r2, #-48]
	add	r1, r1, #1
	cmp	r1, lr
	mul	r3, r3, r8
	movcs	ip, #0
	movcc	ip, #1
	cmp	r1, #254
	movgt	ip, #0
	cmp	ip, #0
	sub	r3, r3, #1
	str	r3, [r2, #-32]
	bne	.L292
	uxtb	ip, lr
	mov	r3, lr
.L291:
	mov	r2, r3, asl #6
	ldr	r1, [fp, #-68]
	sub	r3, r2, r3, asl #4
	add	r3, r4, r3
	sub	r1, r1, #1
	strb	ip, [r3, #3668]
	str	r1, [r3, #3684]
	ldrb	r1, [r4, #354]	@ zero_extendqisi2
	cmp	r1, #2
	bne	.L287
	ldrb	r3, [r0, #3071]	@ zero_extendqisi2
	ldr	r2, [r0, #3188]
	mul	r2, r2, r3
	mov	r2, r2, asr #8
	str	r2, [r4, #3504]
	rsb	r3, r2, r3
	subs	r3, r3, #1
	movmi	r3, #0
	str	r3, [r4, #3508]
	b	.L287
.L344:
	str	r0, [fp, #-64]
	ldr	r1, [r4, #3488]
	ldr	r0, [r6, #3904]
	bl	FSP_ClearLogicFs
	ldr	r1, [r6, #3456]
	mov	ip, #0
	ldr	r2, [fp, #-64]
	movw	r3, #1236
	mov	r0, ip
	strb	ip, [r1]
	mov	r1, r3
	ldr	lr, [r6, #3456]
	strb	ip, [lr, #1]
	str	r2, [sp, #8]
	stmia	sp, {r7, r9}
	ldr	r2, .L349+28
	bl	dprint_normal
	ldrb	r3, [r4, #354]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L272
	ldr	r3, [r4, #3548]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #3548]
.L272:
	ldr	r2, .L349+32
	movw	r1, #1243
	mov	r0, #1
	mov	r5, #0
	bl	dprint_normal
	b	.L329
.L289:
	mov	r2, #1
	mov	ip, r3
	str	r2, [r4, #3496]
	b	.L291
.L273:
	ldr	r1, [r4, #3488]
	ldr	r0, [r6, #3904]
	bl	FSP_ClearLogicFs
	ldr	ip, [r6, #3456]
	mov	r3, #0
	ldr	r2, .L349+36
	mov	r0, r3
	movw	r1, #1253
	strb	r3, [ip]
	ldr	ip, [r6, #3456]
	strb	r3, [ip, #1]
	ldr	ip, [r7, #28]
	ldr	r3, [r4, #3480]
	ldr	r5, [r4, #3484]
	str	ip, [sp, #12]
	ldr	lr, [r7, #24]
	ldr	ip, [r4, #3488]
	stmib	sp, {r5, lr}
	str	ip, [sp]
	bl	dprint_normal
	ldrb	r3, [r4, #354]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L275
	ldr	r3, [r4, #3548]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #3548]
.L275:
	ldr	r2, .L349+32
	movw	r1, #1260
	mov	r0, #1
	mov	r5, #0
	bl	dprint_normal
	b	.L329
.L347:
	ldrb	r3, [r0, #2952]	@ zero_extendqisi2
	sub	r3, r3, #2
	cmp	r3, #1
	movhi	r3, #0
	movls	r3, #1
	b	.L286
.L348:
	ldrb	r2, [r0, #3055]	@ zero_extendqisi2
	sub	r2, r2, #2
	cmp	r2, #1
	movhi	r2, #0
	movls	r2, #1
	b	.L288
.L350:
	.align	2
.L349:
	.word	.LC23
	.word	.LC24
	.word	g_Use_FFAPT_Enable
	.word	.LC21
	.word	.LC22
	.word	.LC29
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
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
	ldr	lr, .L352
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
.L353:
	.align	2
.L352:
	.word	.LANCHOR0+48
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
	cmp	r1, #1
	beq	.L357
	cmp	r1, #2
	beq	.L358
	ldr	r2, [r0, #3096]
	cmp	r1, #0
	ldr	r3, [r0, #3100]
	streq	r2, [r0, #3176]
	streq	r3, [r0, #3180]
	beq	.L360
	add	r2, r2, #1
	add	r3, r3, #1
	add	r2, r2, r2, lsr #31
	add	r3, r3, r3, lsr #31
	mov	r2, r2, asr #1
	mov	r3, r3, asr #1
	str	r2, [r0, #3176]
	str	r3, [r0, #3180]
.L360:
	mul	r1, r3, r2
	mov	r2, r2, asl #4
	mov	r3, r3, asl #4
	str	r2, [r0, #3168]
	str	r3, [r0, #3172]
	str	r1, [r0, #3184]
	ldmfd	sp, {fp, sp, pc}
.L358:
	ldr	r3, [r0, #3100]
	ldr	r2, [r0, #3096]
	add	r3, r3, #1
	add	r3, r3, r3, lsr #31
	str	r2, [r0, #3176]
	mov	r3, r3, asr #1
	str	r3, [r0, #3180]
	b	.L360
.L357:
	ldr	r2, [r0, #3096]
	ldr	r3, [r0, #3100]
	add	r2, r2, #1
	add	r2, r2, r2, lsr #31
	str	r3, [r0, #3180]
	mov	r2, r2, asr #1
	str	r2, [r0, #3176]
	b	.L360
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
	ldr	ip, .L374
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
	ble	.L372
	cmp	r7, #3
	movle	r1, #3
	movle	r4, #2
	bgt	.L373
.L365:
	mov	r0, r6
	bl	BsSkip
	sub	r3, fp, #36
	add	r4, r3, r4, lsl #2
	cmp	r5, #12
	ldrhi	r0, [r4, #-40]
	ldrls	r0, [r4, #-20]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L373:
	cmp	r7, #8
	movlt	r1, #2
	movge	r1, #1
	movlt	r4, #1
	movge	r4, #0
	b	.L365
.L372:
	cmp	r7, #0
	mov	r1, #4
	moveq	r4, #3
	movne	r4, r1
	b	.L365
.L375:
	.align	2
.L374:
	.word	.LANCHOR0+112
	UNWIND(.fnend)
	.size	VC1_DecMvmodeProgrP, .-VC1_DecMvmodeProgrP
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
	ldr	r3, .L384
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
	ble	.L383
	cmp	r7, #4
	movlt	r1, #2
	movge	r1, #1
	movlt	r4, #1
	movge	r4, #0
.L378:
	mov	r0, r6
	bl	BsSkip
	sub	r3, fp, #28
	add	ip, r3, r4, lsl #2
	cmp	r5, #12
	ldrhi	r0, [ip, #-36]
	ldrls	r0, [ip, #-20]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L383:
	cmp	r7, #0
	mov	r1, r4
	movne	r4, ip
	b	.L378
.L385:
	.align	2
.L384:
	.word	.LANCHOR0+152
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
	ldr	r3, .L395
	sub	lr, fp, #60
	add	ip, r3, #16
	mov	r4, r0
	cmp	r0, #1
	ldmia	r3, {r0, r1, r2, r3}
	stmia	lr, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1, r2, r3}
	sub	ip, fp, #28
	stmdb	ip, {r0, r1, r2, r3}
	ble	.L394
	cmp	r4, #4
	movlt	r1, #2
	movge	r1, #1
	movlt	r4, #1
	movge	r4, #0
.L388:
	mov	r0, r6
	bl	BsSkip
	sub	r3, fp, #28
	add	r4, r3, r4, lsl #2
	cmp	r5, #12
	ldrhi	r0, [r4, #-32]
	ldrls	r0, [r4, #-16]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L394:
	cmp	r4, #0
	mov	r1, #3
	moveq	r4, r1
	movne	r4, #2
	b	.L388
.L396:
	.align	2
.L395:
	.word	.LANCHOR0+152
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
	ldr	ip, .L404
	mov	r7, r0
	str	r1, [fp, #-248]
	str	r2, [fp, #-252]
	mov	r8, r3
	ldmia	ip!, {r0, r1, r2, r3}
	sub	r4, fp, #244
	sub	r9, fp, #216
	sub	r5, fp, #156
	sub	lr, fp, #100
	add	r10, ip, #12
	add	r6, ip, #40
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1, r2}
	stmia	r4, {r0, r1, r2}
	add	r4, ip, #96
	ldmia	r10!, {r0, r1, r2, r3}
	add	ip, ip, #152
	stmia	r9!, {r0, r1, r2, r3}
	ldmia	r10, {r0, r1, r2}
	sub	r10, fp, #188
	stmia	r9, {r0, r1, r2}
	ldmia	r6!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	ldmia	r6!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	ldmia	r6!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	ldmia	r6, {r0, r1}
	stmia	r5, {r0, r1}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4, {r0, r1}
	stmia	lr, {r0, r1}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	r10!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1, r2, r3}
	stmia	r10, {r0, r1, r2, r3}
	mov	r0, r7
	mov	r1, #3
	bl	BsShow
	mov	r4, r0
	cmp	r4, #6
	mov	r0, r7
	bgt	.L398
	mov	r1, #3
	bl	BsSkip
	sub	r3, fp, #44
	add	r3, r3, r4, lsl #2
	strb	r4, [r8]
	ldr	r1, [r3, #-200]
	ldr	r2, [r3, #-172]
.L399:
	sub	r3, fp, #44
	mov	r0, #0
	add	r2, r3, r2, lsl #2
	ldr	r3, [r2, #-148]
	ldr	r2, [fp, #-248]
	mul	r3, r3, r1
	str	r3, [r2]
.L401:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L398:
	mov	r1, #7
	bl	BsGet
	and	r3, r0, #15
	cmp	r3, #15
	beq	.L403
	sub	r0, r0, #112
	cmp	r0, #13
	bhi	.L402
	sub	r2, fp, #44
	add	r3, r3, #7
	add	r0, r2, r0, lsl #2
	strb	r3, [r8]
	ldr	r1, [r0, #-112]
	ldr	r2, [r0, #-56]
	b	.L399
.L403:
	ldr	r2, [fp, #-252]
	mov	r3, #4
	mov	r0, #22
	strb	r3, [r2]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L402:
	mvn	r0, #0
	b	.L401
.L405:
	.align	2
.L404:
	.word	.LANCHOR0+184
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
	ldr	r5, .L414
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
	bgt	.L407
	mov	r1, #3
	bl	BsSkip
	sub	r3, fp, #44
	add	r2, r3, r4, lsl #2
	ldr	r1, [r2, #-200]
	ldr	r2, [r2, #-172]
	sub	r3, r2, #1
	cmp	r3, #7
	bhi	.L411
.L413:
	sub	r2, fp, #44
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #-144]
	mul	r3, r3, r1
.L412:
	ldr	r2, [fp, #-248]
	str	r3, [r2]
.L409:
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L407:
	mov	r1, #7
	bl	BsGet
	and	r4, r0, #15
	sub	r3, r4, #14
	add	r4, r4, #7
	cmp	r3, #1
	bls	.L409
	sub	r3, r0, #112
	cmp	r3, #13
	bhi	.L410
	sub	r2, fp, #44
	add	r2, r2, r3, lsl #2
	ldr	r1, [r2, #-112]
	ldr	r2, [r2, #-56]
	sub	r3, r2, #1
	cmp	r3, #7
	bls	.L413
.L411:
	movw	r1, #2292
	ldr	r3, .L414+4
	stmia	sp, {r1, r2}
	mov	r0, #1
	ldr	r2, .L414+8
	bl	dprint_normal
	mov	r3, #0
	b	.L412
.L410:
	movw	r1, #2282
	str	r0, [sp, #4]
	ldr	r2, .L414+12
	add	r3, r5, #184
	str	r1, [sp]
	mov	r0, #1
	bl	dprint_normal
	mov	r2, #0
	b	.L411
.L415:
	.align	2
.L414:
	.word	.LANCHOR0+184
	.word	.LANCHOR0+384
	.word	.LC31
	.word	.LC30
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
	beq	.L434
	mov	r1, #1
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4]
	cmp	r5, #1
	beq	.L435
.L420:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L434:
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
	beq	.L436
.L419:
	mov	r3, #1
	mov	r0, #1
	str	r3, [r4, #12]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L435:
	mov	r1, #2
	mov	r0, r7
	bl	BsGet
	uxtb	r1, r0
	strb	r1, [r4, #1]
	cmp	r1, #0
	streq	r5, [r4, #12]
	beq	.L423
	cmp	r1, #2
	beq	.L437
	cmp	r1, #1
	beq	.L438
	cmp	r1, #3
	movne	r3, #0
	strne	r3, [r4, #12]
	beq	.L439
.L423:
	ldr	r3, [r4]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #768
	beq	.L420
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
	bne	.L420
	mov	r0, r7
	mov	r1, #5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #5]
	strb	r0, [r4, #8]
	b	.L420
.L439:
	mov	r1, r5
	mov	r0, r7
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #2]
	cmp	r0, #0
	movne	r3, #10
	moveq	r3, #11
	str	r3, [r4, #12]
	b	.L423
.L436:
	mov	r0, r7
	mov	r1, #5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #5]
	strb	r0, [r4, #8]
	b	.L419
.L437:
	mov	r0, r7
	bl	BsGet
	uxtb	r3, r0
	strb	r0, [r4, #6]
	add	r3, r3, #6
	str	r3, [r4, #12]
	b	.L423
.L438:
	mov	r1, #2
	mov	r0, r7
	bl	BsGet
	uxtb	r3, r0
	strb	r0, [r4, #7]
	add	r3, r3, #2
	str	r3, [r4, #12]
	b	.L423
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
.L441:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #3
	subs	r7, r0, #0
	mov	r0, r5
	bne	.L450
	bl	BsGet
	mov	r4, r0
	cmp	r4, #1
	mov	r1, r0
	mov	r0, r5
	bgt	.L460
	bne	.L444
	bl	BsGet
	cmp	r0, #0
	beq	.L445
	cmp	r6, #0
	mov	r6, r4
	beq	.L441
.L458:
	str	r9, [r8]
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L450:
	mov	r0, #0
.L442:
	cmp	r6, #0
	mov	r7, #1
	eorne	r0, r0, #63
.L459:
	str	r0, [r8]
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L460:
	sub	r4, r4, #2
	mov	r0, #1
	mov	r0, r0, asl r4
	b	.L442
.L444:
	mov	r0, r5
	mov	r1, #4
	bl	BsGet
	cmp	r0, #255
	beq	.L458
	ldr	r3, .L461
	add	r3, r3, r0, lsl #2
	ldr	r0, [r3, #532]
	b	.L442
.L445:
	mov	r0, r5
	mov	r1, #5
	bl	BsGet
	ldr	r3, .L461
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #404]
	cmp	r3, #2
	orreq	r0, r0, #32
	beq	.L442
	cmp	r3, #3
	bne	.L459
	b	.L442
.L462:
	.align	2
.L461:
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
	beq	.L464
	ldrb	r7, [r4, #14]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L479
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
	bls	.L476
.L467:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #256]
	beq	.L477
.L469:
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strneb	r3, [r4, #257]
	beq	.L478
.L471:
	ldrb	r3, [r4, #251]	@ zero_extendqisi2
	sub	r3, r3, #2
	tst	r3, #253
	bne	.L472
.L474:
	ldrb	r1, [r4, #258]	@ zero_extendqisi2
.L473:
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
.L464:
	mov	r0, r5
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L472:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L474
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	uxtb	r1, r0
	strb	r1, [r4, #258]
	b	.L473
.L476:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	ldrb	r7, [r4, #14]	@ zero_extendqisi2
	strb	r0, [r4, #255]
	b	.L467
.L477:
	mov	r1, r7
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #256]
	b	.L469
.L478:
	mov	r0, r6
	bl	VC1_DecMvrange
	strb	r0, [r4, #257]
	b	.L471
.L480:
	.align	2
.L479:
	.word	.LANCHOR0+592
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
	beq	.L494
	ldrb	r8, [r4, #14]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L511
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
	bls	.L505
.L486:
	cmp	r8, #1
	movne	r3, #0
	strneb	r3, [r4, #256]
	beq	.L506
.L488:
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strneb	r3, [r4, #257]
	beq	.L507
.L490:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L491
	ldrb	r1, [r4, #258]	@ zero_extendqisi2
.L492:
	mov	r0, r7
	bl	VC1_SetCurPicResolutionInfo
	mov	r0, r5
	bl	BsPos
	ldr	r2, .L511+4
	movw	r1, #2574
	mov	r3, r0
	mov	r0, #16
	bl	dprint_normal
	ldrb	r1, [r4, #340]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_DecMvmodeProgrP
	uxtb	r0, r0
	strb	r0, [r4, #259]
	cmp	r0, #4
	beq	.L508
.L493:
	mov	r1, r7
	mov	r3, #0
	mov	r2, r4
	mov	r0, r5
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L494
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
	bne	.L509
.L495:
	mov	r0, r5
	bl	BsPos
	movw	r1, #2599
	ldr	r2, .L511+8
	mov	r3, r0
	mov	r0, #16
	bl	dprint_normal
	ldrb	r1, [r4, #9]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L510
.L497:
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
.L494:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L505:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r8, [r4, #14]	@ zero_extendqisi2
	strb	r0, [r4, #255]
	b	.L486
.L509:
	add	r3, r4, #272
	ldrb	r2, [r4, #340]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_VopDQuant
	b	.L495
.L507:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #257]
	b	.L490
.L491:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	uxtb	r1, r0
	strb	r1, [r4, #258]
	b	.L492
.L506:
	mov	r1, r8
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #256]
	b	.L488
.L508:
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
	b	.L493
.L510:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #265]
	cmp	r0, #1
	bne	.L497
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #266]
	b	.L497
.L512:
	.align	2
.L511:
	.word	.LANCHOR0+592
	.word	.LC32
	.word	.LC33
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
	beq	.L524
	ldrb	r7, [r4, #14]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L541
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
	bls	.L536
.L518:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #256]
	beq	.L537
.L520:
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strneb	r3, [r4, #257]
	beq	.L538
.L522:
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
	beq	.L524
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
	bne	.L539
.L525:
	ldrb	r1, [r4, #9]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L540
.L527:
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
.L524:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L536:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	ldrb	r7, [r4, #14]	@ zero_extendqisi2
	strb	r0, [r4, #255]
	b	.L518
.L539:
	add	r3, r4, #272
	ldrb	r2, [r4, #340]	@ zero_extendqisi2
	mov	r0, r6
	bl	VC1_VopDQuant
	b	.L525
.L537:
	mov	r1, r7
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #256]
	b	.L520
.L538:
	mov	r0, r6
	bl	VC1_DecMvrange
	strb	r0, [r4, #257]
	b	.L522
.L540:
	mov	r0, r6
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #265]
	cmp	r0, #1
	bne	.L527
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #266]
	b	.L527
.L542:
	.align	2
.L541:
	.word	.LANCHOR0+592
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
	ble	.L583
	ldr	r8, .L589
	mov	r2, #100
	mov	r1, #0
	add	r0, r4, #248
	ldr	r3, [r8, #48]
	blx	r3
	add	r0, r6, #3296
	ldr	r3, [r8, #48]
	mov	r2, #12288
	mov	r1, #0
	add	r0, r0, #12
	strb	r7, [r4, #258]
	blx	r3
	mov	r0, r5
	bl	BsPos
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r4, #324]
	bne	.L584
.L546:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	ldrb	r3, [r4, #12]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #249]
	bne	.L585
.L547:
	ldrb	r3, [r4, #13]	@ zero_extendqisi2
	mov	r1, #1
	mov	r0, r5
	cmp	r3, #0
	bne	.L548
	bl	BsGet
	adds	r0, r0, #0
	movne	r0, #1
	strb	r0, [r4, #251]
.L549:
	mov	r3, #0
	strb	r0, [r6, #2]
	strb	r3, [r6, #4]
	ldrb	r3, [r4, #251]	@ zero_extendqisi2
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L561
.L555:
	.word	.L554
	.word	.L556
	.word	.L557
	.word	.L561
	.word	.L558
.L548:
	bl	BsGet
	cmp	r0, #1
	beq	.L581
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #1
	beq	.L586
	mov	r2, #2
	add	r3, r4, #252
	strb	r2, [r4, #251]
	add	r1, r4, #344
	add	r2, r4, #251
	mov	r0, r5
	bl	VC1_DecBfractionSMP
	cmp	r0, #0
	bne	.L561
	ldrb	r3, [r4, #252]	@ zero_extendqisi2
	cmp	r3, #21
	beq	.L561
	ldrb	r0, [r4, #251]	@ zero_extendqisi2
	b	.L549
.L558:
	add	r3, r6, #12288
	ldrb	r8, [r3, #3324]	@ zero_extendqisi2
	cmp	r8, #1
	beq	.L587
.L561:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L583:
	mov	r3, #5
	mov	r0, #1
	strb	r3, [r4, #251]
	strb	r3, [r6, #2]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L585:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #250]
	b	.L547
.L584:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #248]
	b	.L546
.L586:
	mov	r0, #0
.L581:
	strb	r0, [r4, #251]
	b	.L549
.L554:
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	bl	VC1_Vfmw_ParseSMPIPicHdr
	mov	r7, r0
.L559:
	mov	r0, r5
	bl	BsPos
	ldr	r3, [r4, #324]
	rsb	r0, r3, r0
	str	r0, [r4, #324]
	mov	r0, r5
	ldr	r4, [r6, #3292]
	bl	BsPos
	mov	r4, r4, asl #3
	rsb	r0, r0, r4
	cmp	r0, #0
	ble	.L588
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L557:
	add	r3, r6, #12288
	ldrb	r8, [r3, #3324]	@ zero_extendqisi2
	cmp	r8, #1
	bne	.L561
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	bl	VC1_Vfmw_ParseMPBPicHdr
	cmp	r0, #1
	mov	r7, r0
	beq	.L559
	mov	r0, r8
	ldr	r2, .L589+4
	movw	r1, #2781
	bl	dprint_normal
	b	.L559
.L556:
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	bl	VC1_Vfmw_ParseSMPPPicHdr
	mov	r7, r0
	b	.L559
.L588:
	ldr	r2, .L589+8
	movw	r1, #2818
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L587:
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	bl	VC1_Vfmw_ParseSMPIPicHdr
	cmp	r0, #1
	mov	r7, r0
	beq	.L559
	mov	r0, r8
	ldr	r2, .L589+12
	movw	r1, #2798
	bl	dprint_normal
	b	.L559
.L590:
	.align	2
.L589:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC34
	.word	.LC36
	.word	.LC35
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
	ldr	r3, .L608
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
	beq	.L605
	ldrh	r2, [r4, #172]
	ldrh	r3, [r4, #174]
	strh	r2, [r4, #176]	@ movhi
	strh	r3, [r4, #178]	@ movhi
.L598:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #39]
	cmp	r0, #1
	beq	.L599
.L601:
	mov	r0, r5
	bl	BsPos
	ldr	r3, [r4, #184]
	mov	r2, #1
	rsb	r0, r3, r0
	str	r0, [r4, #184]
.L600:
	mov	r0, r2
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L599:
	mov	r1, #5
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #40]
	cmp	r0, #31
	movhi	r2, #0
	bhi	.L600
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
	ble	.L601
	add	r7, r4, #42
	mov	r6, #0
.L602:
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
	bgt	.L602
	b	.L601
.L605:
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
	beq	.L606
.L594:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r1, r0
	strb	r1, [r4, #31]
	cmp	r1, #1
	beq	.L607
.L596:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #35]
	cmp	r0, #1
	bne	.L598
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
	b	.L598
.L607:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #32]
	cmp	r0, #0
	bne	.L597
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	mov	r1, #4
	strb	r0, [r4, #33]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #34]
	b	.L596
.L606:
	mov	r1, #4
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #28]
	cmp	r0, #15
	bne	.L594
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	mov	r1, #8
	strb	r0, [r4, #29]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #30]
	b	.L594
.L597:
	mov	r1, #16
	mov	r0, r5
	bl	BsGet
	strh	r0, [r4, #180]	@ movhi
	b	.L596
.L609:
	.align	2
.L608:
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
	ldr	r3, .L635
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
	beq	.L611
.L614:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #199]
	cmp	r0, #1
	ldrneh	r2, [r4, #240]
	beq	.L631
.L616:
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
	beq	.L632
.L619:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #201]
	cmp	r0, #1
	beq	.L633
.L620:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #203]
	cmp	r0, #1
	beq	.L634
.L621:
	mov	r0, r5
	bl	BsPos
	ldr	r3, [r4, #244]
	rsb	r3, r3, r0
	mov	r0, #1
	str	r3, [r4, #244]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L611:
	ldrb	r3, [r4, #40]	@ zero_extendqisi2
	cmp	r3, #0
	ble	.L614
	add	r7, r4, #204
	mov	r6, #0
.L615:
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	add	r6, r6, #1
	strb	r0, [r7, #1]!
	ldrb	r3, [r4, #40]	@ zero_extendqisi2
	cmp	r3, r6
	bgt	.L615
	b	.L614
.L634:
	mov	r1, #3
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #204]
	b	.L621
.L631:
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
	b	.L616
.L632:
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #200]
	b	.L619
.L633:
	mov	r1, #3
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #202]
	b	.L620
.L636:
	.align	2
.L635:
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
	ble	.L640
	mov	r1, #2
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L640:
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
	ble	.L642
	cmp	r0, #11
	movle	r1, #2
	movle	r5, r1
	bgt	.L647
.L642:
	mov	r0, r4
	bl	BsSkip
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L647:
	cmp	r0, #13
	movle	r1, #3
	movle	r5, #0
	ble	.L642
	cmp	r0, #14
	mov	r1, #4
	movne	r5, #5
	moveq	r5, r1
	b	.L642
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
	beq	.L664
.L649:
	ldr	r3, [r4, #392]
	cmp	r3, #0
	bne	.L650
	ldrb	r1, [r4, #25]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L665
.L650:
	mov	r1, #5
	mov	r0, r6
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4, #358]
	cmp	r5, #0
	beq	.L659
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L669
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
	bls	.L666
.L655:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L667
.L657:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L668
.L658:
	mov	r1, r8
	mov	r3, #0
	mov	r2, r4
	mov	r0, r6
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L659
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
	beq	.L652
	mov	r0, r6
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	bl	VC1_VopDQuant
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L659:
	mov	r0, #0
.L652:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L666:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	strb	r0, [r4, #351]
	b	.L655
.L665:
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #357]
	b	.L650
.L664:
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #356]
	b	.L649
.L667:
	mov	r1, r7
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L657
.L668:
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L658
.L670:
	.align	2
.L669:
	.word	.LANCHOR0+592
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
	beq	.L672
	ldr	r3, [r4, #392]
	cmp	r3, #2
	beq	.L672
	ldrb	r1, [r4, #25]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L709
.L674:
	mov	r1, #5
	mov	r0, r5
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r4, #358]
	cmp	r6, #0
	beq	.L689
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L722
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
	bls	.L710
.L679:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L711
.L681:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L712
.L682:
	ldrb	r3, [r4, #194]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L713
.L683:
	ldr	r3, [r4, #392]
	cmp	r3, #0
	beq	.L714
	ldrb	r3, [r4, #200]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strneb	r3, [r4, #373]
	beq	.L715
.L687:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #374]
	mov	r0, r5
	bl	BsGet
	cmp	r0, #1
	str	r0, [r4, #468]
	beq	.L716
.L688:
	mov	r3, #0
	strb	r3, [r4, #382]
.L685:
	mov	r1, r8
	mov	r3, #0
	mov	r2, r4
	mov	r0, r5
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L689
	ldr	r1, [r4, #392]
	cmp	r1, #2
	beq	.L717
.L690:
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
	beq	.L718
.L693:
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L719
.L695:
	ldrb	r1, [r4, #196]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L720
.L697:
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
.L689:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L672:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r1, [r4, #25]	@ zero_extendqisi2
	cmp	r1, #1
	strb	r0, [r4, #356]
	bne	.L674
.L709:
	ldr	r3, [r4, #392]
	cmp	r3, #0
	bne	.L674
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #357]
	b	.L674
.L714:
	ldrb	r1, [r4, #464]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_DecMvmodeProgrP
	uxtb	r0, r0
	strb	r0, [r4, #362]
	cmp	r0, #4
	bne	.L685
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
	b	.L685
.L710:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	strb	r0, [r4, #351]
	b	.L679
.L719:
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_VopDQuant
	b	.L695
.L713:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #361]
	b	.L683
.L711:
	mov	r1, r7
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L681
.L712:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L682
.L720:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #368]
	cmp	r0, #1
	bne	.L697
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #369]
	b	.L697
.L718:
	mov	r1, r6
	mov	r0, r5
	bl	BsGet
	ldrb	r3, [r4, #374]	@ zero_extendqisi2
	cmp	r3, #1
	strb	r0, [r4, #376]
	movne	r0, #0
	beq	.L721
.L694:
	strb	r0, [r4, #377]
	b	.L693
.L717:
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #375]
	b	.L690
.L715:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #373]
	b	.L687
.L716:
	mov	r1, #6
	mov	r0, r5
	bl	BsGet
	mov	r1, #6
	strb	r0, [r4, #364]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #365]
	b	.L688
.L721:
	mov	r1, r6
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	b	.L694
.L723:
	.align	2
.L722:
	.word	.LANCHOR0+592
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
	beq	.L725
	ldr	r3, [r4, #392]
	cmp	r3, #2
	beq	.L725
	ldrb	r1, [r4, #25]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L767
.L727:
	cmp	r3, #0
	bne	.L731
	add	r1, r4, #496
	mov	r0, r5
	bl	VC1_DecBfraction
	uxtb	r0, r0
	strb	r0, [r4, #350]
	cmp	r0, #21
	beq	.L729
.L731:
	mov	r1, #5
	mov	r0, r5
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r4, #358]
	cmp	r6, #0
	beq	.L729
	ldrb	r8, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L779
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
	bls	.L768
	cmp	r8, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L769
.L737:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L770
.L738:
	ldr	r3, [r4, #392]
	cmp	r3, #2
	beq	.L771
.L739:
	ldrb	r3, [r4, #194]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L772
.L740:
	ldr	r3, [r4, #392]
	cmp	r3, #0
	beq	.L773
	ldrb	r3, [r4, #200]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L774
.L744:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #468]
.L743:
	mov	r1, r7
	mov	r3, #0
	mov	r2, r4
	mov	r0, r5
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L729
	ldr	r1, [r4, #392]
	cmp	r1, #2
	beq	.L775
.L745:
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
	beq	.L776
.L748:
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L777
.L749:
	ldrb	r1, [r4, #196]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L778
.L751:
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
.L729:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L725:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r1, [r4, #25]	@ zero_extendqisi2
	ldr	r3, [r4, #392]
	cmp	r1, #1
	strb	r0, [r4, #356]
	bne	.L727
.L767:
	cmp	r3, #0
	bne	.L731
	mov	r0, r5
	bl	BsGet
	ldr	r3, [r4, #392]
	strb	r0, [r4, #357]
	b	.L727
.L773:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	moveq	r3, #3
	movne	r3, #1
	strb	r3, [r4, #362]
	b	.L743
.L768:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r8, [r4, #198]	@ zero_extendqisi2
	cmp	r8, #1
	movne	r3, #0
	strb	r0, [r4, #351]
	strneb	r3, [r4, #359]
	bne	.L737
.L769:
	mov	r1, r8
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L737
.L771:
	add	r1, r4, #496
	mov	r0, r5
	bl	VC1_DecBfraction
	strb	r0, [r4, #350]
	b	.L739
.L772:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #361]
	b	.L740
.L770:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L738
.L777:
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_VopDQuant
	b	.L749
.L778:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #368]
	cmp	r0, #1
	bne	.L751
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #369]
	b	.L751
.L776:
	mov	r1, r6
	mov	r0, r5
	bl	BsGet
	mov	r1, r6
	strb	r0, [r4, #376]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #377]
	b	.L748
.L775:
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #375]
	b	.L745
.L774:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #373]
	b	.L744
.L780:
	.align	2
.L779:
	.word	.LANCHOR0+592
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
	ble	.L782
	cmp	r0, #11
	movle	r7, #2
	movle	r1, r7
	bgt	.L813
.L782:
	mov	r0, r5
	bl	BsSkip
	add	r3, r6, #12288
	strb	r7, [r4, #349]
	ldrb	r3, [r3, #3689]	@ zero_extendqisi2
	strb	r3, [r6, #2]
	ldrb	r3, [r4, #24]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L814
.L783:
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	r3, [r4, #23]	@ zero_extendqisi2
	beq	.L784
	cmp	r3, #0
	beq	.L815
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
	beq	.L816
.L788:
	cmp	r3, #1
	bne	.L790
	ldrb	r1, [r4, #190]	@ zero_extendqisi2
	ldrb	r3, [r4, #354]	@ zero_extendqisi2
	cmp	r1, #1
	add	r3, r3, #1
	str	r3, [r4, #492]
	bne	.L799
.L791:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #355]
	cmp	r0, #1
	bne	.L799
	ldr	r3, [r4, #492]
	cmp	r3, #0
	ble	.L799
	mov	r7, r4
	mov	r8, #0
.L800:
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
	bgt	.L800
	b	.L799
.L784:
	mov	r2, #1
	cmp	r3, r2
	strb	r2, [r4, #352]
	beq	.L787
.L790:
	mov	r3, #1
	str	r3, [r4, #492]
.L789:
	ldrb	r1, [r4, #190]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L791
.L799:
	ldrb	r3, [r4, #349]	@ zero_extendqisi2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L792
.L794:
	.word	.L797
	.word	.L795
	.word	.L796
	.word	.L792
	.word	.L797
	.word	.L805
.L797:
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvIPicHdr
.L815:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	ldrb	r2, [r4, #23]	@ zero_extendqisi2
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r2, #1
	strb	r0, [r4, #354]
	bne	.L788
.L816:
	cmp	r3, #1
	beq	.L817
.L787:
	mov	r3, #2
	str	r3, [r4, #492]
	b	.L789
.L813:
	cmp	r0, #13
	movle	r7, #0
	movle	r1, #3
	ble	.L782
	cmp	r0, #14
	moveq	r7, #4
	movne	r7, #5
	movne	r1, #4
	moveq	r1, r7
	b	.L782
.L814:
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #396]
	b	.L783
.L805:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L795:
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvPPicHdr
.L796:
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvBPicHdr
.L792:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L817:
	ldrb	r3, [r4, #353]	@ zero_extendqisi2
	add	r3, r3, #2
	str	r3, [r4, #492]
	b	.L789
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
	bgt	.L819
	mov	r4, r0, asr #3
	mov	r1, #2
	mov	r0, r5
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L819:
	cmp	r0, #27
	movle	r4, #3
	bgt	.L825
.L821:
	mov	r0, r5
	mov	r1, r4
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L825:
	cmp	r0, #29
	movgt	r4, #5
	movle	r4, #4
	b	.L821
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
	ldr	lr, .L827
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
.L828:
	.align	2
.L827:
	.word	.LANCHOR0+720
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
	beq	.L838
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L846
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
	bls	.L843
.L834:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L844
.L836:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L845
.L837:
	mov	r1, r8
	mov	r3, #0
	mov	r2, r4
	mov	r0, r6
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L838
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
	beq	.L831
	mov	r0, r6
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	bl	VC1_VopDQuant
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L838:
	mov	r0, #0
.L831:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L843:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	strb	r0, [r4, #351]
	b	.L834
.L844:
	mov	r1, r7
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L836
.L845:
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L837
.L847:
	.align	2
.L846:
	.word	.LANCHOR0+592
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
	beq	.L849
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L886
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
	bls	.L877
.L852:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L878
.L854:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L879
.L855:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #380]
	cmp	r0, #0
	beq	.L880
.L856:
	ldrb	r3, [r4, #194]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L881
.L857:
	ldrb	r3, [r4, #200]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L882
.L858:
	ldrb	r1, [r4, #464]	@ zero_extendqisi2
	mov	r0, r6
	bl	VC1_DecMvmodeProgrP
	uxtb	r0, r0
	strb	r0, [r4, #362]
	cmp	r0, #4
	beq	.L883
.L860:
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
	beq	.L864
	movw	r3, #362
	ldrh	r3, [r4, r3]
	cmp	r3, #4
	beq	.L864
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L884
.L866:
	ldrb	r1, [r4, #196]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L885
.L868:
	mov	r0, r6
	mov	r5, #1
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #370]
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #372]
.L849:
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L864:
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	strb	r0, [r4, #377]
	beq	.L866
.L884:
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	mov	r0, r6
	bl	VC1_VopDQuant
	b	.L866
.L880:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	clz	r0, r0
	mov	r0, r0, lsr #5
	strb	r0, [r4, #381]
	b	.L856
.L877:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	strb	r0, [r4, #351]
	b	.L852
.L881:
	mov	r0, r6
	bl	VC1_DecMvrange
	strb	r0, [r4, #361]
	b	.L857
.L882:
	mov	r0, r6
	bl	VC1_DecMvrange
	strb	r0, [r4, #373]
	b	.L858
.L878:
	mov	r1, r7
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L854
.L885:
	mov	r0, r6
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #368]
	cmp	r0, #1
	bne	.L868
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #369]
	b	.L868
.L879:
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L855
.L883:
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
	bne	.L860
	mov	r1, #6
	mov	r0, r6
	bl	BsGet
	mov	r1, #6
	str	r0, [r4, #480]
	mov	r0, r6
	bl	BsGet
	str	r0, [r4, #484]
	b	.L860
.L887:
	.align	2
.L886:
	.word	.LANCHOR0+592
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
	beq	.L899
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L919
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
	bls	.L911
.L893:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L912
.L895:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L913
.L896:
	ldrb	r3, [r4, #194]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L914
.L897:
	ldrb	r3, [r4, #200]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L915
.L898:
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
	beq	.L899
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
	beq	.L916
.L900:
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L917
.L901:
	ldrb	r1, [r4, #196]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L918
.L903:
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
.L899:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L911:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	strb	r0, [r4, #351]
	b	.L893
.L917:
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_VopDQuant
	b	.L901
.L916:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #377]
	b	.L900
.L913:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L896
.L914:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #361]
	b	.L897
.L912:
	mov	r1, r7
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L895
.L915:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #373]
	b	.L898
.L918:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #368]
	cmp	r0, #1
	bne	.L903
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #369]
	b	.L903
.L920:
	.align	2
.L919:
	.word	.LANCHOR0+592
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
	ldrb	r3, [r1, #9]	@ zero_extendqisi2
	mov	r5, r1
	mov	r6, r0
	mov	r4, r2
	cmp	r3, #0
	beq	.L922
	ldr	r3, [r1, #3144]
	cmp	r3, #0
	bne	.L922
	ldr	r2, [r2, #504]
	add	r3, r1, #12288
	strb	r2, [r4, #349]
	ldrb	r3, [r3, #3689]	@ zero_extendqisi2
	strb	r3, [r1, #2]
.L940:
	ldrb	r3, [r4, #349]	@ zero_extendqisi2
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L949
.L944:
	.word	.L943
	.word	.L945
	.word	.L946
	.word	.L949
	.word	.L943
.L922:
	mov	r1, #3
	mov	r0, r6
	bl	BsGet
	ldr	r3, .L968
	str	r0, [r4, #472]
	add	r0, r3, r0, lsl #3
	ldr	r3, [r0, #756]
	ldr	r2, [r0, #752]
	str	r3, [r4, #504]
	str	r2, [r4, #500]
	ldrb	r1, [r5, #9]	@ zero_extendqisi2
	cmp	r1, #0
	uxtbeq	r3, r2
	add	r2, r5, #12288
	uxtbne	r3, r3
	strb	r3, [r4, #349]
	ldrb	r3, [r2, #3689]	@ zero_extendqisi2
	strb	r3, [r5, #2]
	ldrb	r3, [r4, #24]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L961
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	r3, [r4, #23]	@ zero_extendqisi2
	bne	.L962
.L927:
	mov	r2, #1
	cmp	r3, r2
	strb	r2, [r4, #352]
	beq	.L930
.L933:
	mov	r3, #1
	str	r3, [r4, #492]
.L932:
	ldrb	r1, [r4, #190]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L934
.L937:
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
	beq	.L963
.L936:
	ldr	r3, [r4, #472]
	cmp	r3, #3
	ble	.L940
.L941:
	add	r1, r4, #496
	mov	r0, r6
	bl	VC1_DecBfraction
	strb	r0, [r4, #350]
	b	.L940
.L962:
	cmp	r3, #0
	beq	.L964
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
	beq	.L965
.L931:
	cmp	r3, #1
	bne	.L933
	ldrb	r3, [r4, #354]	@ zero_extendqisi2
	add	r3, r3, #1
	str	r3, [r4, #492]
	b	.L932
.L946:
	mov	r0, r6
	mov	r2, r4
	mov	r1, r5
	bl	VC1_Vfmw_ParseAdvBFieldHdr
.L942:
	ldrb	r3, [r4, #352]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	bne	.L966
.L947:
	subs	r3, r3, #1
	movne	r3, #1
	strb	r3, [r4, #389]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L945:
	mov	r0, r6
	mov	r2, r4
	mov	r1, r5
	bl	VC1_Vfmw_ParseAdvPFieldHdr
	ldrb	r3, [r4, #352]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	beq	.L947
.L966:
	adds	r3, r3, #0
	movne	r3, #1
	strb	r3, [r4, #389]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L943:
	mov	r0, r6
	mov	r2, r4
	mov	r1, r5
	bl	VC1_Vfmw_ParseAdvIFieldHdr
	b	.L942
.L961:
	mov	r1, #8
	mov	r0, r6
	bl	BsGet
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	r3, [r4, #23]	@ zero_extendqisi2
	str	r0, [r4, #396]
	beq	.L927
	b	.L962
.L964:
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	ldrb	r2, [r4, #23]	@ zero_extendqisi2
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r2, #1
	strb	r0, [r4, #354]
	bne	.L931
.L965:
	cmp	r3, #1
	beq	.L967
.L930:
	mov	r3, #2
	str	r3, [r4, #492]
	b	.L932
.L949:
	mov	r0, #0
	b	.L942
.L963:
	ldr	r3, [r4, #472]
	cmp	r3, #3
	bgt	.L941
	mov	r0, r6
	bl	VC1_DecRefdist
	strb	r0, [r4, #379]
	b	.L936
.L934:
	mov	r0, r6
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #355]
	cmp	r0, #1
	bne	.L937
	ldr	r3, [r4, #492]
	cmp	r3, #0
	ble	.L937
	mov	r7, r4
	mov	r8, #0
.L938:
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
	bgt	.L938
	b	.L937
.L967:
	ldrb	r3, [r4, #353]	@ zero_extendqisi2
	add	r3, r3, #2
	str	r3, [r4, #492]
	b	.L932
.L969:
	.align	2
.L968:
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
	ldrb	r3, [r4, #9]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L971
	ldr	r3, [r4, #3144]
	cmp	r3, #0
	beq	.L980
.L971:
	ldrb	r8, [r5, #23]	@ zero_extendqisi2
	cmp	r8, #1
	movne	r3, #0
	movne	r0, r3
	beq	.L981
.L973:
	str	r0, [r5, #392]
.L972:
	cmp	r3, #0
	mov	r2, r5
	mov	r1, r4
	mov	r0, r6
	beq	.L982
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvFieldPicHdr
.L980:
	ldr	r3, [r5, #392]
	bic	r3, r3, #2
	b	.L972
.L982:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvFramePicHdr
.L981:
	mov	r1, #2
	mov	r0, r6
	bl	BsShow
	cmp	r0, #1
	mov	r7, r0
	ble	.L983
	mov	r1, #2
	mov	r0, r6
	bl	BsSkip
	bic	r3, r7, #2
	mov	r0, r7
	b	.L973
.L983:
	mov	r1, r8
	mov	r0, r6
	bl	BsSkip
	mov	r3, #0
	mov	r0, r3
	b	.L973
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
	mov	r5, r1
	mov	r1, #9
	mov	r6, r2
	ldr	r4, [r5, #3144]
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
	beq	.L986
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L986:
	add	lr, r6, #188
	add	ip, r5, #19200
	add	ip, ip, #212
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	add	r0, r5, #19200
	add	r1, r6, #16
	mov	r2, #172
	add	r0, r0, #40
	bl	memcpy
	add	r0, r5, #19456
	add	r1, r6, #348
	mov	r2, #176
	add	r0, r0, #116
	bl	memcpy
	add	r2, r5, #19200
	mov	r0, r7
	add	r2, r2, #24
	mov	r1, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvPicHdr
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvSlcHdr, .-VC1_Vfmw_ParseAdvSlcHdr
	.align	2
	.global	VC1_RecordSlcStream
	.type	VC1_RecordSlcStream, %function
VC1_RecordSlcStream:
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
	ldr	r6, [r0, #3144]
	mov	r9, r1
	ldr	r1, [r0, #3236]
	mov	r4, r0
	mov	r8, r6, asl #4
	mov	r7, r6, asl #6
	rsb	r5, r8, r7
	add	r5, r0, r5
	add	r10, r5, #3296
	strb	r6, [r5, #3316]
	add	r10, r10, #8
	ldr	r0, [r1, #24]
	add	r2, r2, r0, lsr #3
	str	r2, [r5, #3308]
	ldr	r2, [r1, #24]
	and	r2, r2, #7
	str	r2, [r5, #3324]
	ldr	r0, [r1, #16]
	ldr	r2, [r1, #24]
	rsb	r2, r2, r0, lsl #3
	ldr	r0, [r5, #3308]
	str	r2, [r5, #3328]
	bl	MEM_Vir2Phy
	str	r0, [r5, #3320]
	ldr	r3, [r4, #3300]
	str	r3, [r5, #3348]
	ldr	r3, [r4, #3276]
	cmp	r3, #0
	beq	.L988
	ldr	r2, [r4, #3288]
	cmp	r2, #0
	bne	.L1007
.L988:
	rsb	r3, r8, r7
	mov	r2, #0
	add	r3, r4, r3
	str	r2, [r3, #3312]
	str	r2, [r3, #3340]
	str	r2, [r3, #3344]
	str	r2, [r3, #3336]
	str	r2, [r3, #3352]
.L989:
	ldr	r0, [r4, #3100]
	sub	r6, r8, r6, asl #2
	ldr	r2, [r4, #3096]
	ldrb	r5, [r4, #9]	@ zero_extendqisi2
	mul	r2, r2, r0
	cmp	r5, #0
	sub	r2, r2, #1
	beq	.L990
	add	r9, r9, r6
	add	r3, r0, #1
	rsb	r1, r8, r7
	add	r9, r9, #520
	ldr	ip, [r9, #8]
	add	r3, r3, r3, lsr #31
	add	r1, r4, r1
	sub	ip, ip, r3, asr #1
	cmp	r2, ip
	str	ip, [r1, #3332]
	movcs	r2, #0
	movcc	r2, #1
	cmp	ip, #0
	movle	r2, #0
	cmp	r2, #0
	bne	.L1008
.L991:
	rsb	r3, r8, r7
	add	r3, r4, r3
	ldr	r2, [r3, #3328]
	cmp	r2, #0
	ble	.L993
	ldr	r2, [r3, #3312]
	cmp	r2, #0
	beq	.L994
	ldr	r3, [r3, #3344]
	cmp	r3, #0
	ble	.L993
.L994:
	ldr	r3, [r4, #3144]
	mov	r0, #1
	add	r3, r3, r0
	str	r3, [r4, #3144]
.L992:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L990:
	add	r6, r9, r6
	rsb	r3, r8, r7
	add	r3, r4, r3
	add	r6, r6, #520
	ldr	ip, [r6, #8]
	cmp	r2, ip
	str	ip, [r3, #3332]
	bcs	.L991
	ldr	r3, [r6, #8]
	mov	r1, #4048
	str	r2, [sp, #4]
	mov	r0, #1
	str	ip, [sp]
	ldr	r2, .L1009
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1007:
	str	r3, [r10, #8]
	mov	r3, #0
	str	r3, [r5, #3340]
	ldr	r3, [r4, #3296]
	str	r2, [r5, #3336]
	mov	r3, r3, asl #3
	str	r3, [r5, #3344]
	ldr	r3, [r4, #3304]
	str	r3, [r5, #3352]
	b	.L989
.L1008:
	ldr	r3, [r9, #8]
	movw	r1, #4036
	str	r0, [sp, #4]
	mov	r0, #1
	str	ip, [sp]
	ldr	r2, .L1009+4
	bl	dprint_normal
	mov	r0, #0
	b	.L992
.L993:
	ldr	r2, .L1009+8
	movw	r1, #4055
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1010:
	.align	2
.L1009:
	.word	.LC38
	.word	.LC37
	.word	.LC39
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
	add	r5, r0, #20480
	movw	r3, #2578
	ldrh	r2, [r1, #238]
	mov	r4, r1
	ldrh	r3, [r5, r3]
	cmp	r3, r2
	beq	.L1012
	adds	r3, r2, #15
	movw	r1, #2580
	addmi	r3, r2, #30
	mov	r3, r3, asr #4
	str	r3, [r0, #3096]
	ldrh	r3, [r4, #238]
	str	r3, [r0, #3112]
	ldrh	r2, [r4, #240]
	ldrh	r3, [r5, r1]
	cmp	r3, r2
	beq	.L1013
.L1014:
	adds	r3, r2, #15
	addmi	r3, r2, #30
	mov	r3, r3, asr #4
	str	r3, [r0, #3100]
	ldrh	r3, [r4, #240]
	str	r3, [r0, #3116]
.L1013:
	add	r0, r5, #2352
	add	r1, r4, #16
	mov	r2, #172
	add	r0, r0, #4
	bl	memcpy
	add	lr, r4, #188
	add	ip, r5, #2528
	mov	r4, #1
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
.L1016:
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1012:
	movw	r3, #2580
	ldrh	r2, [r1, #240]
	ldrh	r3, [r5, r3]
	cmp	r3, r2
	bne	.L1014
	mov	r4, #0
	b	.L1016
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
	add	r3, r0, #15552
	ldrsb	r3, [r3, #44]
	cmp	r3, #0
	bne	.L1018
	bl	VC1_Vfmw_UpdataLastPicRNDCTRL.part.3
.L1018:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
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
	ldr	r1, .L1022
	sub	r0, fp, #148
	bl	memcpy
	cmp	r5, #0
	subeq	r3, fp, #20
	movne	r0, r4
	addeq	r4, r3, r4, lsl #2
	ldreq	r0, [r4, #-128]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1023:
	.align	2
.L1022:
	.word	.LANCHOR0+592
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
	beq	.L1025
	mov	r0, r5
	ldr	r1, [r4, #32]
	bl	SM_ReleaseStreamSeg
.L1025:
	ldr	r3, .L1029
	mov	r0, r4
	mov	r2, #36
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L1030:
	.align	2
.L1029:
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
	add	r3, r0, #15552
	mov	r6, r0
	mov	r7, r1
	ldrsb	r3, [r3, #44]
	cmp	r3, #0
	beq	.L1032
	ldr	r3, [r0, #3144]
	cmp	r3, #0
	beq	.L1046
	mov	r4, r0
	mov	r5, #0
	b	.L1036
.L1035:
	ldr	r3, [r6, #3144]
	add	r4, r4, #48
	cmp	r5, r3
	bcs	.L1047
.L1036:
	ldr	r1, [r4, #3348]
	mov	r0, r7
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #3312]
	add	r5, r5, #1
	cmp	r3, #0
	beq	.L1035
	ldr	r3, [r4, #3336]
	cmp	r3, #0
	beq	.L1035
	ldr	r1, [r4, #3352]
	mov	r0, r7
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r6, #3144]
	add	r4, r4, #48
	cmp	r5, r3
	bcc	.L1036
.L1047:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1032:
	add	r1, r0, #3264
	mov	r0, r7
	add	r1, r1, #8
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VC1_ClearCurPacket
.L1046:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_ClearCurPic, .-VC1_ClearCurPic
	.align	2
	.global	VC1DEC_VDMPostProc
	.type	VC1DEC_VDMPostProc, %function
VC1DEC_VDMPostProc:
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
	add	r5, r0, #45056
	mov	r6, r0
	add	r0, r0, #12608
	add	r4, r6, #12288
	mov	r7, r1
	add	r0, r0, #32
	ldr	r1, [r5, #3904]
	bl	VC1_ClearCurPic
	ldrb	r2, [r4, #354]	@ zero_extendqisi2
	sub	r2, r2, #2
	ands	r2, r2, #253
	beq	.L1082
.L1049:
	ldr	r1, [r4, #3488]
	ldr	r0, [r5, #3904]
	bl	FSP_GetFsImagePtr
	ldr	r1, [r4, #3484]
	mov	r9, r0
	ldr	r0, [r5, #3904]
	bl	FSP_GetFsImagePtr
	cmp	r9, #0
	mov	r10, r0
	beq	.L1083
	cmp	r7, #0
	movlt	r7, #0
	blt	.L1052
	cmp	r7, #100
	movge	r7, #100
.L1052:
	str	r7, [r9, #96]
	mov	r0, r6
	bl	VC1_SetImgFormat
	ldrb	r3, [r4, #355]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L1084
.L1053:
	mov	r3, #0
	mov	r2, #0
	strd	r2, [r9, #168]
	strd	r2, [r9, #176]
	ldr	r3, [r6]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L1085
	ldr	ip, [r4, #3488]
	mov	r8, #0
	str	ip, [r4, #3492]
.L1057:
	ldr	r3, [r4, #3500]
	cmn	ip, #1
	add	r3, r3, #1
	str	r3, [r4, #3500]
	beq	.L1058
	mov	r1, ip
	ldr	r0, [r5, #3904]
	bl	FSP_GetFsImagePtr
	subs	r9, r0, #0
	beq	.L1086
	ldr	r3, [r9, #96]
	cmp	r3, #0
	beq	.L1060
	ldr	r2, [r6]
	ldr	r2, [r2, #4]
	cmp	r3, r2
	bhi	.L1061
.L1060:
	ldr	r7, [r4, #3492]
	ldr	r0, [r5, #3904]
	mov	r1, r7
	bl	FSP_GetRef
	mov	r3, r7
	ldr	r2, .L1090
	mov	r1, #424
	str	r0, [sp]
	mov	r0, #10
	bl	dprint_normal
	cmp	r8, #1
	ldreq	r3, [r5, #3464]
	movne	r1, #1
	ldrne	r2, [r5, #3456]
	movne	r3, #2
	streqb	r8, [r3, #1]
	strneb	r1, [r2, #1]
	mov	r2, #1
	strneb	r3, [r4, #353]
	streqb	r8, [r4, #353]
	ldr	r1, [r4, #3492]
	ldr	r0, [r5, #3904]
	bl	FSP_SetDisplay
	add	r3, r6, #48384
	ldr	r0, [r5, #3904]
	add	r3, r3, #224
	str	r9, [sp]
	mov	r2, r6
	mov	r1, #1
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L1064
	ldr	r1, [r9, #168]
	mov	r6, #0
	ldr	r0, [r5, #3904]
	mov	r7, #0
	bl	FreeUsdByDec
	strd	r6, [r9, #168]
	ldr	r1, [r9, #176]
	ldr	r0, [r5, #3904]
	bl	FreeUsdByDec
	mov	r2, #0
	strd	r6, [r9, #176]
	ldr	r0, [r5, #3904]
	ldr	r1, [r4, #3492]
	bl	FSP_SetDisplay
	cmp	r8, #1
	mov	r3, #0
	ldreq	r2, [r5, #3464]
	mov	r0, r3
	ldrne	r2, [r5, #3456]
	strb	r3, [r2, #1]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1085:
	ldrb	r8, [r4, #354]	@ zero_extendqisi2
	sub	r8, r8, #2
	ands	r8, r8, #253
	bne	.L1087
	ldr	ip, [r4, #3488]
	cmp	r10, #0
	moveq	r8, r10
	str	ip, [r4, #3492]
	beq	.L1057
	ldrd	r0, [r10, #208]
	ldrd	r2, [r9, #208]
	cmp	r0, r2
	sbcs	lr, r1, r3
	strltd	r0, [r9, #208]
	strltd	r2, [r10, #208]
	ldrlt	ip, [r4, #3492]
	b	.L1057
.L1088:
	ldr	r2, [r5, #3460]
	mov	r3, #0
	strb	r3, [r2, #1]
	strb	r3, [r4, #353]
.L1058:
	mov	r0, #1
.L1051:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1082:
	ldr	r1, [r4, #3488]
	ldr	r0, [r5, #3904]
	bl	FSP_SetRef
	b	.L1049
.L1084:
	ldrb	r3, [r4, #362]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1058
	b	.L1053
.L1087:
	ldr	r8, [r4, #3476]
	cmp	r8, #1
	ldrhi	ip, [r4, #3480]
	mvnls	ip, #0
	cmp	r8, #1
	str	ip, [r4, #3492]
	movls	r8, #0
	movhi	r8, #1
	b	.L1057
.L1064:
	ldrb	r3, [r4, #353]	@ zero_extendqisi2
	sxtb	r3, r3
	cmp	r3, #3
	beq	.L1088
	cmp	r3, #1
	beq	.L1089
	cmp	r3, #2
	bne	.L1058
	ldr	r2, [r5, #3456]
	mov	r3, #0
	strb	r3, [r2, #1]
	strb	r3, [r4, #353]
	b	.L1051
.L1061:
	str	r2, [sp]
	movw	r1, #481
	ldr	r2, .L1090+4
	mov	r0, #1
	bl	dprint_normal
	ldr	r1, [r9, #168]
	ldr	r0, [r5, #3904]
	mov	r6, #0
	bl	FreeUsdByDec
	mov	r7, #0
	ldr	r1, [r9, #176]
	strd	r6, [r9, #168]
	ldr	r0, [r5, #3904]
	bl	FreeUsdByDec
	strd	r6, [r9, #176]
	mov	r2, #0
	ldr	r0, [r5, #3904]
	ldr	r1, [r4, #3492]
	bl	FSP_SetDisplay
	cmp	r8, #1
	mov	r2, #0
	ldreq	r3, [r5, #3464]
	moveq	r0, r8
	ldrne	r3, [r5, #3456]
	movne	r0, #1
	strb	r2, [r3, #1]
	b	.L1051
.L1089:
	ldr	r2, [r5, #3464]
	mov	r0, r3
	mov	r3, #0
	strb	r3, [r2, #1]
	strb	r3, [r4, #353]
	b	.L1051
.L1083:
	str	r0, [sp]
	mov	r3, r9
	ldr	r2, .L1090+8
	movw	r1, #365
	mov	r0, r9
	bl	dprint_normal
	mov	r0, r9
	b	.L1051
.L1086:
	movw	r3, #418
	ldr	r2, .L1090+12
	mov	r1, r3
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r9
	b	.L1051
.L1091:
	.align	2
.L1090:
	.word	.LC42
	.word	.LC43
	.word	.LC40
	.word	.LC41
	UNWIND(.fnend)
	.size	VC1DEC_VDMPostProc, .-VC1DEC_VDMPostProc
	.align	2
	.global	VC1_Vfmw_DecodeArbiter
	.type	VC1_Vfmw_DecodeArbiter, %function
VC1_Vfmw_DecodeArbiter:
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
	add	r4, r0, #12288
	mov	r5, r0
	ldrb	r3, [r4, #352]	@ zero_extendqisi2
	tst	r3, #16
	beq	.L1155
	ldr	r2, [r4, #3580]
	bic	r3, r3, #20
	strb	r3, [r4, #352]
	sub	r3, r2, #2
	cmp	r3, #1
	ldr	r3, [r0]
	bls	.L1157
.L1153:
	ldr	r1, [r4, #3476]
	ldr	r3, [r3, #8]
.L1096:
	sub	r2, r3, #1
	str	r3, [r4, #3580]
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L1112
.L1104:
	.word	.L1103
	.word	.L1105
	.word	.L1128
	.word	.L1107
.L1134:
	mov	r1, #0
.L1107:
	ldrb	r3, [r4, #354]	@ zero_extendqisi2
	cmp	r3, #0
	streq	r3, [r4, #3512]
	beq	.L1112
	cmp	r3, #2
	bne	.L1113
	ldr	r3, [r4, #3512]
	adds	r3, r3, #0
	movne	r3, #1
.L1109:
	cmp	r1, #0
	bne	.L1114
.L1122:
	ldr	r2, .L1160
	movw	r1, #1473
	mov	r0, #1
	bl	dprint_normal
.L1124:
	add	r6, r5, #45056
	add	r0, r5, #12608
	add	r0, r0, #32
	ldr	r1, [r6, #3904]
	bl	VC1_ClearCurPic
	ldr	r3, .L1160+4
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L1155
	mov	r3, #0
	ldr	r0, [r6, #3904]
	mov	r2, r3
	mov	r1, #42
	blx	r4
.L1155:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1130:
	mov	r1, #0
.L1112:
	mov	r3, #1
.L1106:
	cmp	r1, #0
	beq	.L1115
.L1114:
	cmp	r1, #1
	bls	.L1126
.L1118:
	cmp	r3, #0
	beq	.L1124
.L1119:
	add	r6, r5, #24576
	ldrb	r3, [r6, #3660]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1121
	add	r3, r5, #28160
	add	ip, r5, #35328
	add	r3, r3, #108
	add	ip, ip, #132
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	add	r1, r5, #28416
	add	r0, r5, #35584
	add	r1, r1, #100
	mov	r2, #100
	add	r0, r0, #124
	bl	memcpy
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1133:
	mov	r3, #0
.L1115:
	ldrb	r2, [r4, #354]	@ zero_extendqisi2
	sub	r0, r2, #4
	sub	r1, r2, #1
	cmp	r1, #1
	cmphi	r0, #1
	bls	.L1122
.L1116:
	sub	r2, r2, #2
	tst	r2, #253
	bne	.L1118
	ldr	r2, .L1160+8
	movw	r1, #1478
	mov	r0, #1
	bl	dprint_normal
	b	.L1124
.L1157:
	ldr	r3, [r3, #8]
	cmp	r3, #4
	cmpne	r3, #1
	bls	.L1097
	ldr	r1, [r4, #3476]
	b	.L1096
.L1132:
	mov	r1, #0
.L1105:
	ldrb	r3, [r4, #354]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1112
	cmp	r3, #1
	beq	.L1158
.L1128:
	mov	r3, #0
	b	.L1106
.L1131:
	mov	r1, #0
.L1103:
	ldrb	r3, [r4, #354]	@ zero_extendqisi2
	sub	r3, r3, #2
	tst	r3, #253
	movne	r3, #1
	moveq	r3, #0
	b	.L1106
.L1121:
	add	r1, r5, #28160
	add	r0, r5, #35328
	add	r1, r1, #124
	mov	r2, #172
	add	r0, r0, #148
	add	r7, r5, #32768
	bl	memcpy
	add	ip, r5, #28416
	add	ip, ip, #40
	add	lr, r7, #2880
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1, r2}
	stmia	lr, {r0, r1, r2}
	add	r1, r5, #28416
	add	r0, r7, #3040
	add	r1, r1, #200
	mov	r2, #176
	bl	memcpy
	ldr	r3, [r4, #3496]
	ldr	lr, [r6, #4084]
	add	r1, r5, #28672
	ldr	ip, .L1160+12
	add	r0, r5, #35840
	mov	r2, r3, asl #4
	add	r1, r1, #120
	sub	r2, r2, r3, asl #2
	strb	lr, [r4, #356]
	ldr	r3, [ip, #52]
	add	r0, r0, #144
	blx	r3
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1113:
	and	r3, r3, #251
	cmp	r3, #1
	bne	.L1112
	str	r3, [r4, #3512]
	b	.L1106
.L1158:
	ldrb	r3, [r4, #361]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1159
.L1129:
	mov	r3, #0
	b	.L1109
.L1097:
	add	r6, r0, #45056
	ldr	r1, [r4, #3484]
	ldr	r0, [r6, #3904]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L1098
	ldr	r1, [r7, #168]
	ldr	r0, [r6, #3904]
	bl	FreeUsdByDec
	ldr	r1, [r7, #176]
	ldr	r0, [r6, #3904]
	bl	FreeUsdByDec
	ldr	r1, [r7, #184]
	ldr	r0, [r6, #3904]
	bl	FreeUsdByDec
	ldr	r1, [r7, #192]
	ldr	r0, [r6, #3904]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r7, #168]
	strd	r2, [r7, #176]
	strd	r2, [r7, #184]
	strd	r2, [r7, #192]
	ldr	r1, [r4, #3484]
	ldr	r0, [r6, #3904]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #3480]
	ldr	r0, [r6, #3904]
	bl	FSP_ClearLogicFs
	ldr	r0, [r6, #3904]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #3484]
	str	r0, [r4, #3480]
.L1098:
	mov	r3, #0
	str	r3, [r4, #3476]
	ldr	r2, [r6, #3460]
	cmp	r2, r3
	beq	.L1154
	ldr	r1, [r6, #3464]
	cmp	r1, #0
	beq	.L1154
	strb	r3, [r2, #1]
	ldr	r2, [r6, #3464]
	strb	r3, [r2, #1]
	ldr	r2, [r6, #3460]
	strb	r3, [r2]
	ldr	r2, [r6, #3464]
	strb	r3, [r2]
	ldr	r3, [r5]
	b	.L1153
.L1154:
	ldr	r3, [r5]
	ldr	r2, [r3, #8]
	sub	r3, r2, #1
	str	r2, [r4, #3580]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L1130
.L1125:
	.word	.L1131
	.word	.L1132
	.word	.L1133
	.word	.L1134
.L1159:
	ldrb	r2, [r4, #364]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1129
	cmp	r1, #0
	beq	.L1122
	cmp	r1, #1
	bhi	.L1119
.L1126:
	ldrb	r2, [r4, #354]	@ zero_extendqisi2
	b	.L1116
.L1161:
	.align	2
.L1160:
	.word	.LC44
	.word	g_EventReportFunc
	.word	.LC45
	.word	vfmw_Osal_Func_Ptr_S
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
	add	r3, r0, #28160
	add	r6, r0, #12608
	mov	r4, r0
	add	r7, r0, #8
	ldrsb	r3, [r3, #76]
	add	r6, r6, #32
	cmp	r3, #0
	beq	.L1177
.L1163:
	add	r5, r4, #12288
	mov	r1, r7
	mov	r0, r4
	bl	VC1_WritePicMsg
	ldr	r3, [r5, #3496]
	ldr	ip, .L1182
	add	r1, r6, #3296
	add	r1, r1, #12
	add	r0, r4, #192
	mov	r2, r3, asl #6
	strb	r3, [r4, #78]
	sub	r2, r2, r3, asl #4
	ldr	r3, [ip, #52]
	blx	r3
	mov	r1, r7
	mov	r0, r6
	bl	VC1_CfgVDH
	ldrb	r3, [r5, #354]	@ zero_extendqisi2
	cmp	r3, #1
	ldrlsb	r2, [r5, #356]	@ zero_extendqisi2
	strlsb	r2, [r5, #357]
	cmp	r3, #5
	beq	.L1178
	mov	r2, #0
	strb	r2, [r4, #9]
	ldrb	r2, [r5, #356]	@ zero_extendqisi2
	ldrb	r1, [r5, #361]	@ zero_extendqisi2
.L1166:
	strb	r2, [r4, #8]
	strb	r2, [r5, #355]
	strb	r1, [r5, #362]
	strb	r3, [r5, #364]
	ldrb	r3, [r4, #11]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1179
	and	r2, r3, #251
	cmp	r2, #1
	streq	r2, [r5, #3512]
.L1168:
	ldr	r2, [r4]
	str	r7, [r4, #4]
	ldr	r0, [r2, #840]
	cmp	r0, #1
	beq	.L1180
	cmp	r0, #2
	beq	.L1181
.L1173:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1181:
	ldr	r2, [r2, #844]
	cmp	r7, #0
	cmpne	r2, #0
	ble	.L1173
	sub	r3, r3, #2
	ands	r5, r3, #253
	bne	.L1173
	add	r2, r4, #45056
	mov	r0, r6
	ldr	r3, [r2, #3456]
	strb	r5, [r3, #1]
	ldr	r1, [r4]
	ldr	r3, [r1, #844]
	sub	r3, r3, #1
	str	r3, [r1, #844]
	ldr	r1, [r2, #3904]
	bl	VC1_ClearCurPic
	str	r5, [r4, #4]
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1179:
	ldr	r8, [r5, #3512]
	cmp	r8, #0
	bne	.L1168
	add	r7, r4, #45056
	mov	r0, r6
	ldr	r1, [r7, #3904]
	bl	VC1_ClearCurPic
	ldr	r3, [r7, #3456]
	mov	r0, r8
	strb	r8, [r3]
	ldr	r3, [r5, #3516]
	add	r3, r3, #1
	str	r3, [r5, #3516]
	str	r8, [r4, #4]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1178:
	mov	r0, #1
	strb	r0, [r4, #9]
	ldrb	r2, [r5, #357]	@ zero_extendqisi2
	mov	r1, r0
	ldr	ip, [r5, #3536]
	strb	r0, [r5, #361]
	strb	r2, [r5, #356]
	str	ip, [r4, #156]
	b	.L1166
.L1180:
	cmp	r7, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	sub	r3, r3, #2
	ands	r5, r3, #253
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r3, r4, #45056
	mov	r0, r6
	ldr	r2, [r3, #3456]
	strb	r5, [r2, #1]
	ldr	r1, [r3, #3904]
	bl	VC1_ClearCurPic
	str	r5, [r4, #4]
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1177:
	mov	r0, r6
	bl	VC1_Vfmw_UpdataLastPicRNDCTRL.part.3
	b	.L1163
.L1183:
	.align	2
.L1182:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VC1_Vfmw_StartDecode, .-VC1_Vfmw_StartDecode
	.align	2
	.global	VC1_Vfmw_ParseAdvHdr
	.type	VC1_Vfmw_ParseAdvHdr, %function
VC1_Vfmw_ParseAdvHdr:
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
	ldr	r8, [r0, #3236]
	mov	r5, r0
	mov	r4, #0
	str	r1, [fp, #-60]
	mov	r1, #32
	strb	r4, [r0, #6]
	mov	r0, r8
	str	r2, [fp, #-56]
	add	r9, r5, #3264
	str	r4, [fp, #-52]
	add	r9, r9, #8
	strh	r4, [fp, #-48]	@ movhi
	bl	BsGet
	ldr	r3, [r8, #24]
	ldr	r7, [r5, #3292]
	ldr	r6, [r5, #3272]
	mov	r3, r3, lsr #3
	rsb	r7, r3, r7
	add	r6, r6, r3
	mov	r2, r7
	mov	r1, r6
	uxtb	r10, r0
	mov	r0, r8
	bl	BsInit
	sub	r2, r10, #10
	cmp	r2, #5
	bhi	.L1185
	cmp	r10, #11
	ldrb	r3, [r5]	@ zero_extendqisi2
	beq	.L1265
	and	r1, r3, #7
	cmp	r1, #7
	beq	.L1266
	strb	r4, [r5, #9]
	str	r4, [r5, #3144]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L1222
.L1201:
	.word	.L1200
	.word	.L1222
	.word	.L1202
	.word	.L1223
	.word	.L1204
	.word	.L1205
.L1185:
	sub	r2, r10, #27
	cmp	r2, #4
	bhi	.L1216
	cmp	r10, #28
	cmpgt	r7, #5
	ble	.L1218
	cmp	r7, #0
	beq	.L1218
.L1221:
	cmp	r4, #5
	ldrb	r3, [r6], #1	@ zero_extendqisi2
	subls	r2, fp, #52
	strlsb	r3, [r4, r2]
	add	r4, r4, #1
	cmp	r4, r7
	bne	.L1221
	ldr	r2, [fp, #-52]
	movw	r3, #21572
	movt	r3, 12615
	cmp	r2, r3
	beq	.L1267
.L1218:
	ldr	r0, [fp, #-56]
	mov	r1, r9
	bl	VC1_ClearCurPacket
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1216:
	cmp	r10, #254
	beq	.L1268
.L1222:
	ldr	r0, [fp, #-56]
	mov	r1, r9
	bl	VC1_ClearCurPacket
	mov	r0, #0
.L1190:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1265:
	and	r3, r3, #7
	cmp	r3, #7
	beq	.L1269
.L1215:
	ldr	r0, [fp, #-56]
	mov	r1, r9
	bl	VC1_ClearCurPacket
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1268:
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
	bne	.L1222
	ldr	r2, [r5, #3144]
	mov	r3, #1
	strb	r3, [r5, #8]
	cmp	r2, #0
	moveq	r0, r3
	beq	.L1190
	ldrb	r2, [r5]	@ zero_extendqisi2
	mov	r0, r3
	strb	r3, [r5, #6]
	orr	r3, r2, #16
	strb	r3, [r5]
	b	.L1190
.L1223:
	ldr	r7, .L1274
.L1259:
	ldr	r10, [fp, #-60]
	mov	r2, #176
	ldr	r3, [r7, #48]
	mov	r1, #0
	add	r0, r10, #348
	ldrb	r4, [r10, #379]	@ zero_extendqisi2
	blx	r3
	strb	r4, [r10, #379]
.L1206:
	add	r0, r5, #3296
	ldr	r3, [r7, #48]
	mov	r2, #12288
	mov	r1, #0
	add	r0, r0, #12
	blx	r3
	mov	r0, r8
	bl	BsPos
	ldr	r3, [fp, #-60]
	mov	r1, r5
	mov	r2, r3
	str	r0, [r3, #488]
	mov	r0, r8
	bl	VC1_Vfmw_ParseAdvPicHdr
	cmp	r0, #1
	mov	r4, r0
	beq	.L1270
	mov	r1, r9
	ldr	r0, [fp, #-56]
	bl	VC1_ClearCurPacket
	movw	r3, #4208
	mov	r1, r3
	ldr	r2, .L1274+4
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	b	.L1190
.L1266:
	mov	r4, #1
	orr	r3, r3, #16
	strb	r4, [r5, #6]
	mov	r0, r4
	strb	r3, [r5]
	b	.L1190
.L1202:
	ldr	r7, .L1274
	mov	r3, #1
	strb	r3, [r5, #9]
	mov	r2, #16
	ldr	r3, [fp, #-60]
	mov	r1, #0
	add	r0, r3, #508
	ldr	r3, [r7, #48]
	blx	r3
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1206
	b	.L1259
.L1200:
	orr	r3, r3, #32
	ldr	r0, [fp, #-56]
	mov	r1, r9
	strb	r3, [r5]
	bl	VC1_ClearCurPacket
	mov	r0, #1
	b	.L1190
.L1204:
	mov	r0, r8
	ldr	r2, [fp, #-60]
	mov	r1, r5
	bl	VC1_Vfmw_ParseAdvEntptHdr
	cmp	r0, #1
	mov	r4, r0
	bne	.L1215
	ldr	r1, [fp, #-60]
	mov	r0, r5
	bl	VC1_Vfmw_UpdateAdvSPS
	ldrb	r3, [r5]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r5]
	b	.L1215
.L1205:
	ldr	r2, [fp, #-60]
	mov	r0, r8
	mov	r1, r5
	bl	VC1_Vfmw_ParseAdvSeqHdr
	cmp	r0, #1
	mov	r4, r0
	ldreqb	r3, [r5]	@ zero_extendqisi2
	orreq	r3, r3, #1
	streqb	r3, [r5]
	b	.L1215
.L1267:
	ldrb	r3, [fp, #-48]	@ zero_extendqisi2
	add	r5, r5, #32768
	sub	r3, r3, #65
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r5, #3160]
	cmp	r3, #0
	ldrneb	r3, [fp, #-47]	@ zero_extendqisi2
	andne	r3, r3, #15
	strne	r3, [r5, #3164]
	b	.L1218
.L1269:
	mov	r0, r8
	ldr	r2, [fp, #-60]
	mov	r1, r5
	bl	VC1_Vfmw_ParseAdvSlcHdr
	cmp	r0, #1
	mov	r7, r0
	bne	.L1188
	ldr	r8, [r5, #3144]
	cmp	r8, #255
	bhi	.L1271
	mov	r9, r8, asl #4
	mov	r7, r8, asl #6
	ldr	r1, [r5, #3236]
	rsb	r10, r9, r7
	add	r10, r5, r10
	add	r3, r10, #3296
	strb	r8, [r10, #3316]
	add	r3, r3, #8
	ldr	r0, [r1, #24]
	str	r3, [fp, #-56]
	add	r6, r6, r0, lsr #3
	str	r6, [r10, #3308]
	ldr	r0, [r1, #24]
	and	r0, r0, #7
	str	r0, [r10, #3324]
	ldr	r0, [r1, #16]
	ldr	r1, [r1, #24]
	rsb	r1, r1, r0, lsl #3
	mov	r0, r6
	str	r1, [r10, #3328]
	bl	MEM_Vir2Phy
	str	r0, [r10, #3320]
	ldr	r2, [r5, #3300]
	str	r2, [r10, #3348]
	ldr	r2, [r5, #3276]
	cmp	r2, #0
	beq	.L1191
	ldr	r1, [r5, #3288]
	ldr	r3, [fp, #-56]
	cmp	r1, #0
	beq	.L1191
	str	r2, [r3, #8]
	str	r4, [r10, #3340]
	ldr	r3, [r5, #3296]
	str	r1, [r10, #3336]
	mov	r3, r3, asl #3
	str	r3, [r10, #3344]
	ldr	r3, [r5, #3304]
	str	r3, [r10, #3352]
.L1192:
	ldr	r1, [r5, #3100]
	ldr	r2, [r5, #3096]
	ldrb	r4, [r5, #9]	@ zero_extendqisi2
	mul	r2, r2, r1
	cmp	r4, #0
	sub	r2, r2, #1
	beq	.L1193
	ldr	r0, [fp, #-60]
	sub	ip, r9, r8, asl #2
	add	r3, r1, #1
	rsb	lr, r9, r7
	add	ip, r0, ip
	add	lr, r5, lr
	add	r3, r3, r3, lsr #31
	add	ip, ip, #520
	ldr	r0, [ip, #8]
	sub	r3, r0, r3, asr #1
	str	r3, [lr, #3332]
	cmp	r2, r3
	movcs	r2, #0
	movcc	r2, #1
	cmp	r3, #0
	movle	r2, #0
	cmp	r2, #0
	bne	.L1272
.L1194:
	rsb	r3, r9, r7
	add	r3, r5, r3
	ldr	r2, [r3, #3328]
	cmp	r2, #0
	ble	.L1197
.L1264:
	ldr	r2, [r3, #3312]
	cmp	r2, #0
	beq	.L1213
	ldr	r3, [r3, #3344]
	cmp	r3, #0
	ble	.L1197
.L1213:
	ldr	r3, [r5, #3144]
	mov	r0, #1
	add	r3, r3, r0
	str	r3, [r5, #3144]
	b	.L1190
.L1270:
	mov	r0, r8
	bl	BsPos
	ldr	r2, [fp, #-60]
	ldr	r3, [r2, #488]
	rsb	r0, r3, r0
	str	r0, [r2, #488]
	ldrb	r3, [r5]	@ zero_extendqisi2
	mov	r0, r8
	orr	r3, r3, #4
	strb	r3, [r5]
	bl	BsPos
	ldr	r3, [r5, #3292]
	add	r0, r0, #32
	cmp	r0, r3, asl #3
	bge	.L1208
	ldr	r7, [r5, #3144]
	ldr	r2, [r5, #3236]
	mov	r9, r7, asl #4
	mov	r8, r7, asl #6
	rsb	r4, r9, r8
	add	r4, r5, r4
	add	r10, r4, #3296
	strb	r7, [r4, #3316]
	add	r10, r10, #8
	ldr	r1, [r2, #24]
	add	r6, r6, r1, lsr #3
	str	r6, [r4, #3308]
	ldr	r1, [r2, #24]
	mov	r0, r6
	and	r1, r1, #7
	str	r1, [r4, #3324]
	ldr	r1, [r2, #16]
	ldr	r2, [r2, #24]
	rsb	r2, r2, r1, lsl #3
	str	r2, [r4, #3328]
	bl	MEM_Vir2Phy
	str	r0, [r4, #3320]
	ldr	r3, [r5, #3300]
	str	r3, [r4, #3348]
	ldr	r3, [r5, #3276]
	cmp	r3, #0
	beq	.L1209
	ldr	r2, [r5, #3288]
	cmp	r2, #0
	beq	.L1209
	str	r3, [r10, #8]
	mov	r3, #0
	str	r3, [r4, #3340]
	ldr	r3, [r5, #3296]
	str	r2, [r4, #3336]
	mov	r3, r3, asl #3
	str	r3, [r4, #3344]
	ldr	r3, [r5, #3304]
	str	r3, [r4, #3352]
.L1210:
	ldr	r2, [r5, #3100]
	ldr	r0, [r5, #3096]
	ldrb	r4, [r5, #9]	@ zero_extendqisi2
	mul	r0, r0, r2
	cmp	r4, #0
	sub	r0, r0, #1
	beq	.L1211
	ldr	r1, [fp, #-60]
	sub	ip, r9, r7, asl #2
	add	r3, r2, #1
	rsb	lr, r9, r8
	add	ip, r1, ip
	add	lr, r5, lr
	add	r3, r3, r3, lsr #31
	add	ip, ip, #520
	ldr	r1, [ip, #8]
	sub	r3, r1, r3, asr #1
	str	r3, [lr, #3332]
	cmp	r0, r3
	movcs	r0, #0
	movcc	r0, #1
	cmp	r3, #0
	movle	r0, #0
	cmp	r0, #0
	bne	.L1273
.L1212:
	rsb	r3, r9, r8
	add	r3, r5, r3
	ldr	r2, [r3, #3328]
	cmp	r2, #0
	bgt	.L1264
.L1197:
	ldr	r2, .L1274+8
	movw	r1, #4055
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	b	.L1190
.L1188:
	mov	r1, r9
	ldr	r0, [fp, #-56]
	bl	VC1_ClearCurPacket
	movw	r3, #4136
	mov	r1, r3
	ldr	r2, .L1274+12
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r7
	b	.L1190
.L1208:
	mov	r1, r9
	ldr	r0, [fp, #-56]
	bl	VC1_ClearCurPacket
	movw	r3, #4202
	mov	r1, r3
	ldr	r2, .L1274+4
	mov	r0, r4
	bl	dprint_normal
	mov	r0, r4
	b	.L1190
.L1209:
	rsb	r3, r9, r8
	mov	r2, #0
	add	r3, r5, r3
	str	r2, [r3, #3312]
	str	r2, [r3, #3340]
	str	r2, [r3, #3344]
	str	r2, [r3, #3336]
	str	r2, [r3, #3352]
	b	.L1210
.L1271:
	ldr	r1, [fp, #-56]
	mov	r0, r5
	bl	VC1_ClearCurPic
	ldr	r3, [r5, #3144]
	mov	r0, r7
	ldr	r2, .L1274+16
	movw	r1, #4127
	bl	dprint_normal
	mov	r0, r4
	b	.L1190
.L1191:
	rsb	r3, r9, r7
	mov	r2, #0
	add	r3, r5, r3
	str	r2, [r3, #3312]
	str	r2, [r3, #3340]
	str	r2, [r3, #3344]
	str	r2, [r3, #3336]
	str	r2, [r3, #3352]
	b	.L1192
.L1211:
	ldr	r1, [fp, #-60]
	sub	r2, r9, r7, asl #2
	rsb	r3, r9, r8
	add	r2, r1, r2
	add	r3, r5, r3
	add	r2, r2, #520
	ldr	ip, [r2, #8]
	cmp	r0, ip
	str	ip, [r3, #3332]
	bcs	.L1212
	mov	r1, #4048
	ldr	r3, [r2, #8]
	str	r0, [sp, #4]
.L1260:
	mov	r0, #1
	str	ip, [sp]
	ldr	r2, .L1274+20
	bl	dprint_normal
	mov	r0, r4
	b	.L1190
.L1193:
	ldr	r0, [fp, #-60]
	sub	r3, r9, r8, asl #2
	rsb	r1, r9, r7
	add	r3, r0, r3
	add	r1, r5, r1
	add	r3, r3, #520
	ldr	ip, [r3, #8]
	cmp	r2, ip
	str	ip, [r1, #3332]
	bcs	.L1194
	ldr	r3, [r3, #8]
	mov	r1, #4048
	str	r2, [sp, #4]
	b	.L1260
.L1273:
	ldr	ip, [ip, #8]
	movw	r1, #4036
	str	r2, [sp, #4]
	mov	r0, #1
	str	r3, [sp]
	ldr	r2, .L1274+24
	mov	r3, ip
	bl	dprint_normal
	mov	r0, #0
	b	.L1190
.L1272:
	str	r1, [sp, #4]
	mov	r0, #1
	str	r3, [sp]
	movw	r1, #4036
	ldr	r3, [ip, #8]
	ldr	r2, .L1274+24
	bl	dprint_normal
	mov	r0, #0
	b	.L1190
.L1275:
	.align	2
.L1274:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC48
	.word	.LC39
	.word	.LC47
	.word	.LC46
	.word	.LC38
	.word	.LC37
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
	add	r3, r0, #15552
	mov	r4, r0
	ldrsb	r3, [r3, #44]
	cmp	r3, #0
	bne	.L1277
	ldrb	r3, [r0]	@ zero_extendqisi2
	mov	r2, r1
	mov	r1, r0
	ldr	r0, [r0, #3236]
	orr	r3, r3, #3
	strb	r3, [r4]
	bl	VC1_Vfmw_ParseSMPPicHdr
	cmp	r0, #1
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldrb	r3, [r4]	@ zero_extendqisi2
	orr	r3, r3, #20
	strb	r3, [r4]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1277:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvHdr
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
	add	r5, r0, #24576
	add	r0, r0, #15872
	add	r0, r0, #8
	str	r0, [r4, #3588]
	ldrb	r3, [r5, #3662]	@ zero_extendqisi2
	cmp	r3, #8
	strneb	r3, [r4, #365]
	moveq	r2, #1
	moveq	r3, #6
	streqb	r2, [r4, #366]
	movne	r3, #0
	streqb	r3, [r4, #365]
	strneb	r3, [r4, #366]
	ldrb	r3, [r5, #3660]	@ zero_extendqisi2
	ldr	r2, [r1, #20]
	cmp	r3, #0
	ldr	r1, [r1]
	beq	.L1285
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	BsInit
.L1285:
	bl	BsInit
	ldr	r0, [r5, #3668]
	add	r3, r5, #3664
	add	ip, r5, #3680
	adds	r2, r0, #15
	add	r3, r3, #12
	addmi	r2, r0, #30
	add	ip, ip, #12
	mov	r2, r2, asr #4
	str	r2, [r4, #3448]
	ldr	r1, [r5, #3672]
	str	r0, [r4, #3464]
	adds	r2, r1, #15
	addmi	r2, r1, #30
	str	r1, [r4, #3468]
	mov	r2, r2, asr #4
	str	r2, [r4, #3452]
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
	add	r1, r0, #15872
	add	r1, r1, #40
	beq	.L1294
	ldr	r2, [r4, #12]
	add	r3, r0, #12288
	str	r2, [r3, #3636]
	ldr	r2, [r4]
	str	r2, [r3, #3624]
	ldr	r2, [r4, #16]
	str	r2, [r3, #3644]
	ldrb	r2, [r4, #6]	@ zero_extendqisi2
	strb	r2, [r3, #3632]
	ldr	r2, [r4, #20]
	str	r2, [r3, #3652]
	ldrb	r2, [r4, #6]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1289
	ldr	r2, [r4, #92]
	str	r2, [r3, #3640]
	ldr	r2, [r4, #80]
	str	r2, [r3, #3628]
	ldr	r2, [r4, #96]
	str	r2, [r3, #3648]
	ldrb	r2, [r4, #86]	@ zero_extendqisi2
	strb	r2, [r3, #3633]
	ldr	r2, [r4, #100]
	str	r2, [r3, #3656]
	ldrb	r3, [r4, #86]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1295
.L1290:
	bl	VC1_SetCodeInfo
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1295:
	add	r0, r0, #45056
	ldr	r0, [r0, #3904]
	bl	VC1_ClearCurPacket
	ldrb	r3, [r4, #86]	@ zero_extendqisi2
	ldr	r2, .L1296
	movw	r1, #4396
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1289:
	mov	r2, #0
	str	r2, [r3, #3640]
	str	r2, [r3, #3628]
	str	r2, [r3, #3648]
	strb	r2, [r3, #3633]
	str	r2, [r3, #3656]
	b	.L1290
.L1294:
	ldr	r2, .L1296+4
	movw	r1, #4375
	mov	r0, r4
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1297:
	.align	2
.L1296:
	.word	.LC50
	.word	.LC49
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
	ldr	r3, .L1321
	add	r5, r0, #12480
	mov	r4, r0
	mov	r2, #160
	mov	r0, r5
	ldr	r3, [r3, #52]
	blx	r3
	mov	r1, r5
	mov	r0, r4
	bl	VC1_ReceivePacket
	subs	r5, r0, #0
	beq	.L1318
	add	r5, r4, #12288
	add	r6, r4, #12608
	add	r7, r4, #45056
	add	r6, r6, #32
	ldrb	r3, [r5, #359]	@ zero_extendqisi2
	add	r1, r4, #28160
	add	r1, r1, #108
	mov	r0, r6
	cmp	r3, #0
	ldreqb	r3, [r5, #352]	@ zero_extendqisi2
	ldrneb	r3, [r5, #3584]	@ zero_extendqisi2
	streqb	r3, [r5, #3584]
	strneb	r3, [r5, #352]
	ldr	r2, [r7, #3904]
	bl	VC1_Vfmw_ParseHeader
	subs	r8, r0, #0
	beq	.L1319
	mov	r0, r4
	bl	VC1_Vfmw_DecodeArbiter
	cmp	r0, #0
	bne	.L1320
.L1305:
	mov	r5, #0
.L1300:
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1319:
	add	r1, r4, #15872
	ldr	r0, [r7, #3904]
	add	r1, r1, #40
	bl	VC1_ClearCurPacket
	ldr	r3, .L1321+4
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L1305
	ldr	r0, [r7, #3904]
	mov	r3, r8
	mov	r2, r8
	mov	r1, #42
	mov	r5, r8
	blx	r4
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1318:
	add	r4, r4, #12288
	ldr	r2, .L1321+8
	movw	r1, #569
	ldr	r3, [r4, #3500]
	bl	dprint_normal
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1320:
	mov	r0, r4
	bl	VC1_Vfmw_PrepareDecode
	cmp	r0, #0
	bne	.L1306
	movw	r3, #359
	ldrsb	r4, [r5, r3]
	cmp	r4, #0
	bne	.L1305
	mov	r0, r6
	ldr	r1, [r7, #3904]
	bl	VC1_ClearCurPic
	ldr	r3, .L1321+4
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L1305
.L1317:
	ldr	r0, [r7, #3904]
	mov	r3, r4
	mov	r2, r4
	mov	r1, #42
	mov	r5, r4
	blx	r6
	b	.L1300
.L1306:
	mov	r0, r4
	bl	VC1_Vfmw_StartDecode
	subs	r4, r0, #0
	movne	r5, #1
	bne	.L1300
	ldr	r1, [r5, #3488]
	ldr	r0, [r7, #3904]
	bl	FSP_ClearLogicFs
	ldr	r2, [r7, #3456]
	ldr	r3, .L1321+4
	strb	r4, [r2]
	ldr	r2, [r7, #3456]
	strb	r4, [r2, #1]
	ldr	r6, [r3]
	cmp	r6, #0
	bne	.L1317
	b	.L1305
.L1322:
	.align	2
.L1321:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_EventReportFunc
	.word	.LC51
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
	add	r0, r0, #12608
	ldrsb	r3, [r0, #38]
	cmp	r3, #1
	moveq	r0, #2
	movne	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_GetPacketState, .-VC1_GetPacketState
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.12584, %object
	.size	__func__.12584, 12
__func__.12584:
	.ascii	"VC1DEC_Init\000"
	.type	__func__.12593, %object
	.size	__func__.12593, 13
__func__.12593:
	.ascii	"Vc1SMPSeqHdr\000"
	.space	3
	.type	__func__.12638, %object
	.size	__func__.12638, 19
__func__.12638:
	.ascii	"VC1_ArrangeVahbMem\000"
	.space	1
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
	.word	2
	.word	0
.LC4:
	.word	1
	.word	0
	.word	2
	.word	3
.LC5:
	.word	1
	.word	1
	.word	2
	.word	1
	.word	3
	.word	1
	.word	2
.LC6:
	.word	2
	.word	3
	.word	3
	.word	4
	.word	4
	.word	5
	.word	5
.LC7:
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
.LC8:
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
.LC9:
	.word	256
	.word	128
	.word	85
	.word	64
	.word	51
	.word	43
	.word	37
	.word	32
	.type	__func__.12882, %object
	.size	__func__.12882, 17
__func__.12882:
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
.LC11:
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
.LC10:
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
.LC12:
	ASCII(.ascii	"%s get ChanID = -1!\012\012\000" )
	.space	2
.LC13:
	ASCII(.ascii	"%s: %s\012\000" )
.LC14:
	ASCII(.ascii	"Vc1SMPSeqHdr Err, BS is wrong\000" )
	.space	2
.LC15:
	ASCII(.ascii	"Vc1SMPSeqHdr Err, BS is wrong\012\000" )
	.space	1
.LC16:
	ASCII(.ascii	"%s arrange fs pool failed!\012\000" )
.LC17:
	ASCII(.ascii	"line: %d, pImage is NULL!\012\000" )
	.space	1
.LC18:
	ASCII(.ascii	"get frame store fail!\012\000" )
	.space	1
.LC19:
	ASCII(.ascii	"VC1_Vfmw_GetImageBuffer get imgbuf err, clear all r" )
	ASCII(.ascii	"ef!\012\000" )
.LC20:
	ASCII(.ascii	"VC1_Vfmw_GetImageBuffer get_flag!=1, FSP_ClearLogic" )
	ASCII(.ascii	"Fs.\012\000" )
.LC21:
	ASCII(.ascii	"VC1 IsAdvProfile %d: SizeChanged New %dx%d, Old %dx" )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC22:
	ASCII(.ascii	"VC1_Vfmw_GetStreamInfo VC1_Vfmw_GetImageBuffer err!" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC23:
	ASCII(.ascii	"dec_pts: %lld Usertag = %lld\012\000" )
	.space	2
.LC24:
	ASCII(.ascii	"---------- unref %d\012\000" )
	.space	3
.LC25:
	ASCII(.ascii	"VC1_Vfmw_GetStreamInfo B pic pCodecInf->RefNum < 2 " )
	ASCII(.ascii	"err!\012\000" )
	.space	3
.LC26:
	ASCII(.ascii	"line: %d (pCur,pFwd,pBwd)(%p,%p,%p)\012\000" )
	.space	3
.LC27:
	ASCII(.ascii	"VC1_Vfmw_GetStreamInfo imgbuf = NULL err!\012\000" )
	.space	1
.LC28:
	ASCII(.ascii	"CurFs(fwd%d,cur%d,bwd%d) abnormal!(pDec%p/pDisp%p)\012" )
	ASCII(.ascii	"\000" )
.LC29:
	ASCII(.ascii	"VC1_Vfmw_GetStreamInfo VC1_Vfmw_BuildRefList err!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC30:
	ASCII(.ascii	"%s:%d Code(%d) is invalid\012\000" )
	.space	1
.LC31:
	ASCII(.ascii	"%s:%d Denominator(%d) is invalid\012\000" )
	.space	2
.LC32:
	ASCII(.ascii	"Check Pos 2: %d\012\000" )
	.space	3
.LC33:
	ASCII(.ascii	"Check Pos 3: %d\012\000" )
	.space	3
.LC34:
	ASCII(.ascii	"VC1_Vfmw_ParseMPBPicHdr err!\012\000" )
	.space	2
.LC35:
	ASCII(.ascii	"VC1_Vfmw_ParseSMPIPicHdr err!\012\000" )
	.space	1
.LC36:
	ASCII(.ascii	"After VC1_Vfmw_ParseSMPPicHdr BS Len <= 0 err!\012\000" )
.LC37:
	ASCII(.ascii	"SLICE_ADDR = %d,SlcEndMbn = %d, MbHeight = %d\012\000" )
	.space	1
.LC38:
	ASCII(.ascii	"SLICE_ADDR = %d,SlcEndMbn = %d, totalMbMin1 = %d\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC39:
	ASCII(.ascii	"VC1_RecordSlcStream stream len <= 0\012\000" )
	.space	3
.LC40:
	ASCII(.ascii	"pImg is null, pCurImg %p pBwdImg %p.\012\000" )
	.space	2
.LC41:
	ASCII(.ascii	"line: %d, pToQueImg is Null!\012\000" )
	.space	2
.LC42:
	ASCII(.ascii	"insert buf %d ref %d\012\000" )
	.space	2
.LC43:
	ASCII(.ascii	"err(%d) > out_thr(%d)\012\000" )
	.space	1
.LC44:
	ASCII(.ascii	"NOTE: Drop non-I\012\000" )
	.space	2
.LC45:
	ASCII(.ascii	"NOTE: Drop B\012\000" )
	.space	2
.LC46:
	ASCII(.ascii	" pCodecInf->SlcNum = %d >= 256 \012\000" )
	.space	3
.LC47:
	ASCII(.ascii	"line %d, Code = VC1_SCSLC failed!\012\000" )
	.space	1
.LC48:
	ASCII(.ascii	"line %d, Code = VC1_SCFRM failed!\012\000" )
	.space	1
.LC49:
	ASCII(.ascii	"bitsream para error -----\012\000" )
	.space	1
.LC50:
	ASCII(.ascii	"line %d, pPacket->StreamPack[1].IsLastSeg = %d\012\000" )
.LC51:
	ASCII(.ascii	"ERROR: frm %d, Invalid packet pointer!\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
