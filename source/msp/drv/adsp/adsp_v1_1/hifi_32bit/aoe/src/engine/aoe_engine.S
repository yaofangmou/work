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
	.file	"aoe_engine.c"
	.text
	.align	2
	.type	ENGINECheckAipData, %function
ENGINECheckAipData:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r2, [r0, #32]
	ldr	r1, [r0, #36]
	ldr	r3, [r0, #40]
	cmp	r2, #0
	cmpne	r1, #0
	beq	.L2
	cmp	r2, #0
	moveq	r0, r2
	beq	.L3
	mov	ip, #0
	mov	r4, #1
	mov	r0, ip
.L5:
	mov	lr, r4, asl ip
	tst	lr, r2
	beq	.L6
	ands	lr, lr, r3
	mov	r0, #1
	beq	.L24
.L6:
	add	ip, ip, #1
	cmp	ip, #8
	bne	.L5
.L3:
	cmp	r1, #0
	movne	r2, #0
	movne	lr, #1
	beq	.L9
.L8:
	mov	ip, lr, asl r2
	tst	ip, r1
	beq	.L11
	tst	ip, r3
	beq	.L25
	orr	r0, r0, #2
.L11:
	add	r2, r2, #1
	cmp	r2, #8
	bne	.L8
.L9:
	and	r0, r0, #1
	ldmfd	sp, {r4, fp, sp, pc}
.L2:
	cmp	r3, #0
	beq	.L26
	mov	r0, #1
	ldmfd	sp, {r4, fp, sp, pc}
.L26:
	ldr	r0, [r0, #164]
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {r4, fp, sp, pc}
.L24:
	mov	r0, lr
	b	.L3
.L25:
	bic	r0, r0, #2
	b	.L9
	UNWIND(.fnend)
	.size	ENGINECheckAipData, .-ENGINECheckAipData
	.align	2
	.type	ENGINECheckAopSpace, %function
ENGINECheckAopSpace:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0, #64]
	ldr	lr, [r0, #48]
	cmp	r3, #0
	ldr	r0, [r0, #52]
	beq	.L42
	cmp	lr, #0
	beq	.L29
	mov	r2, #0
	mov	r4, #1
	mov	ip, r2
.L31:
	mov	r1, r4, asl r2
	tst	r1, lr
	beq	.L33
	ands	r1, r1, r3
	mov	ip, #1
	beq	.L48
.L33:
	add	r2, r2, #1
	cmp	r2, #8
	bne	.L31
.L32:
	cmp	r0, #0
	beq	.L41
.L39:
	mov	r2, #0
	mov	r4, #1
.L35:
	mov	r1, r4, asl r2
	tst	r1, r0
	beq	.L38
	tst	r1, r3
	beq	.L49
	orr	ip, ip, #2
.L38:
	add	r2, r2, #1
	cmp	r2, #8
	bne	.L35
.L36:
	cmp	lr, #0
	bne	.L41
	and	r0, ip, #2
	ldmfd	sp, {r4, fp, sp, pc}
.L29:
	cmp	r0, #0
	movne	ip, lr
	ldmeqfd	sp, {r4, fp, sp, pc}
	b	.L39
.L42:
	mov	r0, r3
	ldmfd	sp, {r4, fp, sp, pc}
.L41:
	and	r0, ip, #1
	ldmfd	sp, {r4, fp, sp, pc}
.L48:
	mov	ip, r1
	b	.L32
.L49:
	bic	ip, ip, #2
	b	.L36
	UNWIND(.fnend)
	.size	ENGINECheckAopSpace, .-ENGINECheckAopSpace
	.align	2
	.type	ENGINEDestroyChn, %function
ENGINEDestroyChn:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r4, r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r5, [r4, #12]
	cmp	r5, #0
	bne	.L52
	ldr	r1, [r4, #108]
	cmp	r1, #0
	beq	.L52
	mov	r0, #26
	bl	HI_ADSP_FREE
	str	r5, [r4, #108]
.L52:
	mov	r1, r4
	mov	r0, #26
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	HI_ADSP_FREE
	UNWIND(.fnend)
	.size	ENGINEDestroyChn, .-ENGINEDestroyChn
	.global	__aeabi_uidiv
	.align	2
	.type	ENGINECreateChn, %function
ENGINECreateChn:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #32)
	sub	sp, sp, #32
	ldr	r3, .L76
	ldr	r5, .L76+4
	mov	r2, #28
	mov	r1, #0
	mov	r6, r0
	ldr	r4, [r3, r0, asl #2]
	sub	r0, fp, #64
	ldr	r3, [r5, #20]
	blx	r3
	sub	r0, fp, #64
	ldr	r1, [r4]
	and	r1, r1, #3
	bl	AOE_REG_ReadBitDepth
	cmp	r0, #0
	bne	.L57
	ldr	r1, [r4]
	sub	r0, fp, #60
	ubfx	r1, r1, #2, #2
	bl	AOE_REG_ReadChannel
	cmp	r0, #0
	bne	.L57
	ldr	r1, [r4]
	sub	r0, fp, #56
	ubfx	r1, r1, #4, #4
	bl	AOE_REG_ReadSampelRate
	cmp	r0, #0
	bne	.L57
	ldr	r1, [r4]
	sub	r0, fp, #52
	ubfx	r1, r1, #8, #2
	bl	AOE_REG_ReadDataFormat
	subs	r7, r0, #0
	bne	.L57
	mov	r1, #196
	mov	r0, #26
	bl	HI_ADSP_MALLOC
	subs	r4, r0, #0
	beq	.L57
	mov	r1, r7
	ldr	r3, [r5, #20]
	mov	r2, #196
	blx	r3
	ldr	r3, [r5, #24]
	mov	r2, #28
	sub	r1, fp, #64
	mov	r0, r4
	blx	r3
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	bl	UTIL_CalcFrameSize
	ldr	r2, [r4, #8]
	movw	r1, #19923
	mov	ip, #60928
	movt	r1, 4194
	movt	ip, 2
	add	r3, r2, r2, lsl #2
	movw	lr, #48000
	cmp	r2, lr
	cmpne	r2, ip
	umull	r2, r3, r3, r1
	mov	r3, r3, lsr #6
	beq	.L74
	tst	r3, #3
	bicne	r3, r3, #3
	addne	r3, r3, #4
.L60:
	mul	r3, r0, r3
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	str	r3, [r4, #84]
	bl	UTIL_CalcFrameSize
	ldr	r8, [r4, #84]
	mov	r1, r0
	str	r0, [r4, #88]
	mov	r0, r8
	bl	__aeabi_uidiv
	ldr	r7, [r4, #12]
	cmp	r7, #0
	str	r0, [r4, #16]
	beq	.L75
.L61:
	mov	r0, r4
	mov	r3, #1
	str	r6, [r4, #80]
	str	r3, [r4, #92]
.L73:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L74:
	tst	r3, #255
	bicne	r3, r3, #255
	addne	r3, r3, #256
	b	.L60
.L75:
	ldr	lr, [r4, #4]
	add	r1, r4, #108
	ldr	ip, [r4]
	mov	r2, #28
	ldr	r3, [r4, #8]
	str	lr, [r4, #124]
	str	ip, [r4, #120]
	str	r8, [r4, #112]
	mov	r8, r1
	str	r0, [r4, #116]
	add	r0, r4, #136
	str	r3, [r4, #128]
	str	r7, [r4, #108]
	ldr	r3, [r5, #24]
	str	r7, [r4, #132]
	blx	r3
	mov	r1, r8
	ldr	r3, [r5, #24]
	mov	r2, #28
	add	r0, r4, #168
	ldr	r9, .L76+4
	blx	r3
	ldr	r8, [r4, #112]
	ldr	r3, [r4, #140]
	mov	r0, #26
	add	r8, r3, r8, lsl #1
	mov	r1, r8
	bl	HI_ADSP_MALLOC
	subs	r5, r0, #0
	beq	.L62
	ldr	r3, [r9, #20]
	mov	r2, r8
	mov	r1, r7
	blx	r3
	ldr	r3, [r4, #112]
	str	r5, [r4, #108]
	add	r0, r5, r3
	str	r0, [r4, #168]
	add	r0, r0, r3
	str	r0, [r4, #136]
	b	.L61
.L57:
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L62:
	mov	r0, r4
	bl	ENGINEDestroyChn
	mov	r0, r5
	b	.L73
.L77:
	.align	2
.L76:
	.word	.LANCHOR0
	.word	g_AdspOsalFunc
	UNWIND(.fnend)
	.size	ENGINECreateChn, .-ENGINECreateChn
	.align	2
	.type	ENGINEOutRawFrame, %function
ENGINEOutRawFrame:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r5, r1
	mov	r7, r2
	mov	r6, r0
	bl	AIP_GetRingIn
	mov	r4, r0
	mov	r0, r5
	bl	AOP_GetRingOut
	mov	r5, r0
	mov	r0, r6
	bl	AIP_GetMuteStatus
	cmp	r0, #1
	beq	.L81
.L79:
	cmp	r5, #0
	cmpne	r4, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r2, r7
	mov	r1, r5
	mov	r0, r4
	mov	r3, #3
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	RBUF_CopyData
.L81:
	mov	r0, r6
	mov	r1, r7
	bl	AIP_MuteRawData
	b	.L79
	UNWIND(.fnend)
	.size	ENGINEOutRawFrame, .-ENGINEOutRawFrame
	.align	2
	.type	ENGINEMixData, %function
ENGINEMixData:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #40)
	sub	sp, sp, #40
	mov	r4, r0
	mov	r5, r1
	mov	r0, r1
	sub	r1, fp, #72
	mov	r3, #0
	mov	r6, r2
	str	r3, [fp, #-72]
	str	r3, [fp, #-68]
	str	r3, [fp, #-64]
	str	r3, [fp, #-60]
	str	r3, [fp, #-56]
	str	r3, [fp, #-52]
	str	r3, [fp, #-48]
	str	r3, [fp, #-44]
	str	r3, [fp, #-40]
	ldr	r7, [r4, #4]
	ldr	r8, [r4]
	bl	AIP_QueryFiFoInfo
	ldr	r0, [r4, #84]
	ldr	r3, [fp, #-52]
	ldr	r9, [fp, #-56]
	cmp	r3, r0
	bcc	.L82
	cmp	r9, r0
	ldr	r1, [r4, #88]
	bcc	.L86
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-68]
	ldr	r1, [fp, #-72]
	mov	r3, r8
	add	r1, r1, r2
	mul	r2, r7, r0
	mov	r0, r6
	bl	UTIL_MixerPro
.L85:
	ldr	r1, [r4, #84]
	mov	r0, r5
	bl	AIP_ReadDataComplete
.L82:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L86:
	mov	r0, r9
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-68]
	ldr	r1, [fp, #-72]
	mov	r3, r8
	add	r1, r1, r2
	mul	r2, r7, r0
	mov	r0, r6
	bl	UTIL_MixerPro
	ldr	r0, [r4, #84]
	ldr	r1, [r4, #88]
	rsb	r0, r9, r0
	bl	__aeabi_uidiv
	mov	r3, r8
	ldr	r1, [fp, #-72]
	mul	r2, r7, r0
	add	r0, r6, r9
	bl	UTIL_MixerPro
	b	.L85
	UNWIND(.fnend)
	.size	ENGINEMixData, .-ENGINEMixData
	.align	2
	.type	ENGINEReclaimIn, %function
ENGINEReclaimIn:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #5
	mov	r5, r1
	mov	r6, r2
	bhi	.L90
	ldr	r3, .L92
	add	r0, r0, #6
	ldr	r4, [r3, r0, asl #2]
	cmp	r1, #0
	cmpne	r4, #0
	moveq	r0, #1
	movne	r0, #0
	beq	.L90
	ldr	r3, [r4, #84]
	cmp	r2, r3
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r1, [r4, #88]
	mov	r0, r2
	bl	__aeabi_uidiv
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	mov	r1, r5
	mul	r2, r2, r0
	ldr	r0, [r4, #168]
	bl	UTIL_MixerPro
	mov	r3, #7
	mov	r0, r6
	str	r3, [r4, #164]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L90:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L93:
	.align	2
.L92:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	ENGINEReclaimIn, .-ENGINEReclaimIn
	.align	2
	.global	ENGINE_Process
	.type	ENGINE_Process, %function
ENGINE_Process:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #116)
	sub	sp, sp, #116
	ldr	r9, .L276
	mov	r8, #0
	add	r10, r9, #24
	b	.L170
.L111:
	add	r8, r8, #1
	add	r10, r10, #4
	cmp	r8, #6
	beq	.L260
.L170:
	ldr	r3, [r9], #4
	ldr	r2, [r3, #4]
	ubfx	r2, r2, #2, #1
	cmp	r2, #0
	bne	.L255
	ldr	r1, [r3, #4]
	ands	r1, r1, #3
	beq	.L97
	cmp	r1, #1
	beq	.L98
	ldr	r2, [r3, #4]
	bic	r2, r2, #120
	orr	r2, r2, #32
	str	r2, [r3, #4]
	ldr	r2, [r3, #4]
	orr	r2, r2, #4
	str	r2, [r3, #4]
.L255:
	ldr	r4, [r10]
	cmp	r4, #0
	beq	.L111
.L110:
	ldr	r6, [r4, #92]
.L171:
	cmp	r6, #1
	bne	.L111
	ldr	r1, [r4]
	mov	r2, #0
	ldr	r3, [r9, #-4]
	mov	r5, r2
	mov	r7, r2
	str	r1, [fp, #-148]
	ldr	r1, [r4, #4]
	str	r3, [fp, #-124]
	str	r1, [fp, #-156]
	ldr	r3, [r3, #12]
	ldr	r1, [r4, #16]
	str	r4, [fp, #-144]
	uxth	r3, r3
	str	r2, [fp, #-120]
	str	r1, [fp, #-152]
	str	r2, [fp, #-136]
	mov	r4, r3
	str	r2, [fp, #-128]
	str	r2, [fp, #-132]
	str	r8, [fp, #-140]
	b	.L118
.L113:
	add	r5, r5, #1
	cmp	r5, #8
	beq	.L261
.L118:
	mov	r8, r6, asl r5
	tst	r8, r4
	beq	.L113
	sub	r1, fp, #80
	mov	r0, r5
	bl	AOP_GetChnStatus
	ldr	r1, [fp, #-80]
	cmp	r1, #1
	bne	.L113
	ldr	r1, [fp, #-76]
	cmp	r1, #1
	ldr	r1, [fp, #-72]
	ldreq	r3, [fp, #-132]
	ldrne	r3, [fp, #-128]
	orreq	r3, r3, r8
	orrne	r3, r3, r8
	streq	r3, [fp, #-132]
	strne	r3, [fp, #-128]
	ldr	r3, [fp, #-148]
	cmp	r3, r1
	beq	.L262
.L116:
	ldr	r3, [fp, #-120]
	orr	r3, r3, r8
	str	r3, [fp, #-120]
.L117:
	ldr	r1, [fp, #-64]
	mov	r0, r5
	ldr	r3, [fp, #-152]
	add	r5, r5, #1
	mul	r1, r1, r3
	bl	AOP_QueryRbfFree
	cmp	r0, #0
	orrne	r7, r7, r8
	cmp	r5, #8
	bne	.L118
.L261:
	mov	r3, r4
	ldr	r4, [fp, #-144]
	mov	r6, #0
	ldr	r8, [fp, #-140]
	mov	r5, #1
	str	r3, [r4, #44]
	ldr	r3, [fp, #-132]
	str	r7, [r4, #64]
	str	r6, [r4, #32]
	str	r3, [r4, #48]
	ldr	r3, [fp, #-128]
	str	r6, [r4, #36]
	str	r6, [r4, #40]
	str	r3, [r4, #52]
	ldr	r3, [fp, #-136]
	str	r3, [r4, #56]
	ldr	r3, [fp, #-120]
	str	r3, [r4, #60]
	ldr	r3, [fp, #-124]
	ldr	r3, [r3, #8]
	uxth	r3, r3
	str	r3, [r4, #28]
	b	.L130
.L119:
	add	r6, r6, #1
	cmp	r6, #8
	beq	.L129
.L264:
	ldr	r3, [r4, #28]
.L130:
	mov	r7, r5, asl r6
	tst	r3, r7
	beq	.L119
	sub	r1, fp, #108
	mov	r0, r6
	bl	AIP_GetChnStatus
	ldr	r3, [fp, #-108]
	cmp	r3, #1
	beq	.L263
.L121:
	mov	r0, r6
	ldr	r2, .L276+4
	ldr	r1, [r4, #80]
	add	r6, r6, #1
	bl	AIP_RegReclaimFun
	cmp	r6, #8
	bne	.L264
.L129:
	ldr	r2, [fp, #-124]
	ldr	r3, [r2, #4]
	ubfx	r3, r3, #13, #1
	str	r3, [r4, #72]
	ldr	r3, [r2, #4]
	ubfx	r3, r3, #14, #1
	str	r3, [r4, #76]
	ldr	r4, [r10]
	ldr	r3, [r4, #44]
	tst	r3, #1
	bne	.L182
	mov	r5, #1
	mov	r2, r5
.L133:
	ands	r1, r3, r2, asl r5
	bne	.L132
	add	r5, r5, #1
	cmp	r5, #8
	bne	.L133
.L141:
	ldr	r5, [r4, #12]
	cmp	r5, #0
	bne	.L265
	mov	r0, r4
	bl	ENGINECheckAopSpace
	cmp	r0, #0
	beq	.L111
	mov	r0, r4
	bl	ENGINECheckAipData
	cmp	r0, #0
	beq	.L111
	ldr	r3, .L276+8
	mov	r2, #5
	mov	r1, r5
	str	r2, [fp, #-80]
	ldr	r2, [r4, #112]
	ldr	r3, [r3, #20]
	ldr	r0, [r4, #108]
	blx	r3
	ldr	r3, [r4, #164]
	ldr	r6, [r4, #108]
	cmp	r3, #0
	beq	.L147
	cmp	r3, #7
	beq	.L266
	ldr	r3, .L276+8
	mov	r1, r5
	mov	r0, r6
	ldr	r2, [r4, #84]
	ldr	r3, [r3, #20]
	blx	r3
.L149:
	ldr	r3, [r4, #164]
	sub	r3, r3, #1
	str	r3, [r4, #164]
.L147:
	mov	r5, #0
	mov	r6, #1
	b	.L153
.L151:
	add	r5, r5, #1
	cmp	r5, #8
	beq	.L267
.L153:
	ldr	r3, [r4, #28]
	ands	r3, r3, r6, asl r5
	beq	.L151
	sub	r1, fp, #80
	mov	r0, r5
	bl	AIP_GetPcmType
	ldr	r3, [fp, #-80]
	cmp	r3, #1
	bhi	.L151
	ldr	r2, [r4, #108]
	mov	r1, r5
	mov	r0, r4
	bl	ENGINEMixData
	b	.L151
.L98:
	ldr	r4, [r10]
	cmp	r4, #0
	beq	.L111
	ldr	r6, [r4, #92]
	cmp	r6, #1
	beq	.L268
	ldr	r2, [r3, #4]
	tst	r2, #4
	bne	.L171
.L172:
	ldr	r2, [r3, #4]
	bic	r2, r2, #120
	str	r2, [r3, #4]
	ldr	r2, [r3, #4]
	orr	r2, r2, #4
	str	r2, [r3, #4]
	b	.L110
.L97:
	ldr	r0, [r10]
	cmp	r0, #0
	beq	.L269
	ldr	r2, [r0, #92]
	cmp	r2, #0
	beq	.L270
.L104:
	mov	r2, #1
	str	r2, [r0, #92]
.L103:
	ldr	r2, [r3, #4]
	tst	r2, #4
	ldreq	r2, [r3, #4]
	biceq	r2, r2, #120
	streq	r2, [r3, #4]
	ldreq	r2, [r3, #4]
	orreq	r2, r2, #4
	streq	r2, [r3, #4]
	b	.L255
.L263:
	ldr	r3, [fp, #-104]
	ldr	r2, [r4, #84]
	cmp	r3, #1
	ldreq	r3, [r4, #32]
	ldrne	r3, [r4, #36]
	orreq	r3, r3, r7
	orrne	r3, r3, r7
	streq	r3, [r4, #32]
	strne	r3, [r4, #36]
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L124
	mov	r0, r6
	str	r2, [fp, #-120]
	bl	AIP_QueryBusy
	ldr	r2, [fp, #-120]
	cmp	r2, r0
	movls	r3, r2
	bhi	.L121
	cmp	r3, #0
	ldrne	r3, [r4, #40]
	orrne	r7, r3, r7
	strne	r7, [r4, #40]
	b	.L121
.L260:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L124:
	sub	r1, fp, #80
	mov	r0, r6
	bl	AIP_GetChnStatus
	ldr	r2, [fp, #-80]
	ldr	r3, [r4, #112]
	cmp	r2, #1
	beq	.L271
.L127:
	mov	r0, r6
	str	r3, [fp, #-120]
	bl	AIP_QueryFiFoBusy
	ldr	r3, [fp, #-120]
	cmp	r0, r3
	bcc	.L121
	cmp	r3, #0
	ldrne	r3, [r4, #40]
	orrne	r7, r3, r7
	strne	r7, [r4, #40]
	b	.L121
.L270:
	bl	ENGINEDestroyChn
	mov	r0, r8
	bl	ENGINECreateChn
	cmp	r0, #0
	str	r0, [r10]
	ldr	r3, [r9, #-4]
	bne	.L104
	ldr	r2, [r3, #4]
	tst	r2, #4
	bne	.L111
.L256:
	ldr	r2, [r3, #4]
	bic	r2, r2, #120
	orr	r2, r2, #24
	str	r2, [r3, #4]
	ldr	r2, [r3, #4]
	orr	r2, r2, #4
	str	r2, [r3, #4]
	b	.L111
.L268:
	str	r2, [r4, #92]
	ldr	r2, [r3, #4]
	tst	r2, #4
	beq	.L172
	b	.L110
.L132:
	cmp	r5, #8
	beq	.L141
.L131:
	sub	r1, fp, #80
	mov	r0, r5
	bl	AOP_GetChnStatus
	ldr	r3, [fp, #-48]
	cmp	r3, #4
	bhi	.L141
	mov	r6, #0
	mov	r7, #1
	str	r5, [fp, #-120]
	b	.L140
.L136:
	add	r6, r6, #1
	cmp	r6, #8
	beq	.L141
.L140:
	ldr	r2, [r4, #28]
	mov	r5, r7, asl r6
	tst	r5, r2
	beq	.L136
	ldr	r2, [r4, #40]
	tst	r5, r2
	bne	.L136
	mov	r0, r6
	bl	AIP_CheckDataStatusStop
	cmp	r0, #1
	beq	.L136
	sub	r1, fp, #108
	mov	r0, r6
	bl	AIP_GetChnStatus
	ldr	r2, [fp, #-108]
	sub	r2, r2, #1
	cmp	r2, #1
	bhi	.L136
	ldr	r1, [r4, #72]
	mov	r0, r6
	bl	AIP_ContinueOutput
	ldr	r2, [r4, #12]
	cmp	r2, #0
	bne	.L272
	ldr	r2, [r4, #72]
	cmp	r2, #0
	beq	.L136
	mov	r0, r6
	bl	AIP_QueryFiFoBusy
	ldr	r2, [r4, #84]
	cmp	r0, r2
	ldrcs	r2, [r4, #40]
	orrcs	r3, r2, r5
	strcs	r3, [r4, #40]
	b	.L136
.L262:
	ldr	r1, [fp, #-68]
	ldr	r3, [fp, #-156]
	cmp	r3, r1
	bne	.L116
	ldr	r3, [fp, #-136]
	orr	r3, r3, r8
	str	r3, [fp, #-136]
	b	.L117
.L271:
	ldr	r2, [fp, #-64]
	cmp	r2, #1
	movne	r3, r3, asl #1
	b	.L127
.L269:
	mov	r0, r8
	bl	ENGINECreateChn
	cmp	r0, #0
	str	r0, [r10]
	beq	.L273
	mov	r3, #1
	str	r3, [r0, #92]
	ldr	r3, [r9, #-4]
	b	.L103
.L182:
	mov	r5, #0
	b	.L131
.L267:
	mov	r3, #5
	str	r3, [fp, #-80]
	ldr	r5, [r4, #12]
	cmp	r5, #0
	bne	.L111
	mov	r6, #1
	b	.L157
.L155:
	add	r5, r5, #1
	cmp	r5, #8
	beq	.L156
.L157:
	ldr	r3, [r4, #28]
	ands	r3, r3, r6, asl r5
	beq	.L155
	sub	r1, fp, #80
	mov	r0, r5
	bl	AIP_GetPcmType
	ldr	r3, [fp, #-80]
	cmp	r3, #2
	bne	.L155
	mov	r1, r5
	ldr	r2, [r4, #108]
	mov	r0, r4
	bl	ENGINEMixData
.L156:
	ldr	r2, [r4, #12]
	ldr	r6, [r4, #48]
	ldr	r3, [r4, #52]
	cmp	r2, #0
	str	r6, [fp, #-116]
	str	r3, [fp, #-112]
	bne	.L111
	sub	r3, fp, #116
	str	r8, [fp, #-124]
	mov	r2, r3
	mov	r3, #1
	mov	r8, r2
.L178:
	cmp	r6, #0
	beq	.L169
	mov	r5, #0
	b	.L168
.L164:
	add	r5, r5, #1
	cmp	r5, #8
	beq	.L169
.L168:
	mov	r7, r3, asl r5
	tst	r7, r6
	beq	.L164
	mov	r0, r5
	str	r3, [fp, #-120]
	bl	AOP_WriteBuffProcTryCnt
	sub	r1, fp, #80
	mov	r0, r5
	bl	AOP_GetChnStatus
	ldr	r2, [r4, #64]
	ldr	r3, [fp, #-120]
	tst	r7, r2
	beq	.L164
	mov	r0, r5
	sub	r7, fp, #108
	bl	AOP_WriteBuffProcOKCnt
	ldr	ip, [r4, #68]
	mov	r2, #28
	add	r1, r4, #108
	cmp	ip, #0
	mov	r0, r7
	ldr	r3, [fp, #-120]
	beq	.L166
	ldr	ip, [fp, #-60]
	cmp	ip, #0
	beq	.L274
.L166:
	str	r3, [fp, #-120]
	ldr	r3, .L276+8
	ldr	r3, [r3, #24]
	blx	r3
	ldr	r3, [fp, #-120]
.L167:
	mov	r1, r7
	mov	r0, r5
	str	r3, [fp, #-120]
	bl	AOP_WriteRbfData
	mov	r0, r5
	bl	AOP_ProcDelayCompensation
	ldr	r3, [fp, #-120]
	b	.L164
.L169:
	sub	r2, fp, #112
	cmp	r8, r2
	ldrne	r6, [r8, #4]!
	bne	.L178
.L275:
	ldr	r8, [fp, #-124]
	b	.L111
.L266:
	ldr	r1, [r4, #88]
	ldr	r0, [r4, #84]
	bl	__aeabi_uidiv
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	ldr	r1, [r4, #168]
	mul	r2, r2, r0
	mov	r0, r6
	bl	UTIL_MixerPro
	ldr	r3, .L276+8
	mov	r1, r5
	ldr	r2, [r4, #84]
	ldr	r0, [r4, #168]
	ldr	r3, [r3, #20]
	blx	r3
	b	.L149
.L273:
	ldr	r3, [r9, #-4]
	ldr	r2, [r3, #4]
	tst	r2, #4
	bne	.L111
	b	.L256
.L274:
	ldr	r3, .L276+8
	sub	r7, fp, #108
	add	r1, r4, #136
	mov	r0, r7
	ldr	r3, [r3, #24]
	blx	r3
	ldr	r3, [fp, #-120]
	b	.L167
.L272:
	mov	r0, r6
	bl	AIP_QueryBusy
	subs	r2, r0, #0
	beq	.L139
	ldr	r1, [fp, #-120]
	mov	r0, r6
	bl	ENGINEOutRawFrame
.L139:
	ldr	r3, [r4, #72]
	cmp	r3, #0
	beq	.L136
	ldr	r3, [r4, #76]
	ldr	r0, [fp, #-120]
	ldr	r2, [fp, #-96]
	ldr	r1, [fp, #-100]
	bl	AOP_ContinueOutput
	b	.L136
.L265:
	ldr	r3, [r4, #44]
	tst	r3, #1
	bne	.L173
	mov	r6, #1
	mov	r2, r6
.L143:
	ands	r1, r3, r2, asl r6
	bne	.L142
	add	r6, r6, #1
	cmp	r6, #8
	bne	.L143
	ldr	r3, [r4, #28]
	tst	r3, #1
	bne	.L111
	mov	r1, #1
.L177:
	mov	r5, #1
	mov	r2, r5
	b	.L146
.L144:
	add	r5, r5, #1
	cmp	r5, #8
	beq	.L111
.L146:
	ands	r0, r3, r2, asl r5
	beq	.L144
	sub	r3, r5, #8
	clz	r3, r3
	mov	r3, r3, lsr #5
.L145:
	orrs	r3, r3, r1
	bne	.L111
.L179:
	mov	r0, r4
	bl	ENGINECheckAopSpace
	cmp	r0, #0
	beq	.L111
	mov	r0, r4
	bl	ENGINECheckAipData
	cmp	r0, #0
	beq	.L111
	mov	r0, r5
	ldr	r2, [r4, #84]
	mov	r1, r6
	bl	ENGINEOutRawFrame
	mov	r0, r6
	bl	AOP_ProcDelayCompensation
	b	.L111
.L142:
	ldr	r3, [r4, #28]
	sub	r1, r6, #8
	clz	r1, r1
	tst	r3, #1
	mov	r1, r1, lsr #5
	beq	.L177
	mov	r3, #0
	mov	r5, r3
	b	.L145
.L173:
	ldr	r3, [r4, #28]
	ands	r6, r3, #1
	moveq	r1, r6
	beq	.L177
.L184:
	mov	r5, #0
	mov	r6, r5
	b	.L179
.L277:
	.align	2
.L276:
	.word	.LANCHOR0
	.word	ENGINEReclaimIn
	.word	g_AdspOsalFunc
	UNWIND(.fnend)
	.size	ENGINE_Process, .-ENGINE_Process
	.align	2
	.global	ENGINE_Init
	.type	ENGINE_Init, %function
ENGINE_Init:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r5, .L281
	add	r7, r0, #768
	ldr	r8, .L281+4
	mov	r4, r0
	mov	r6, #0
.L279:
	str	r4, [r5], #4
	mov	r0, r4
	ldr	r3, [r8, #20]
	mov	r2, #128
	mov	r1, #0
	add	r4, r4, #128
	blx	r3
	ldr	r3, [r4, #-124]
	orr	r3, r3, #4
	str	r3, [r4, #-124]
	ldr	r3, [r4, #-124]
	bic	r3, r3, #3
	orr	r3, r3, #1
	str	r3, [r4, #-124]
	cmp	r4, r7
	str	r6, [r5, #20]
	bne	.L279
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L282:
	.align	2
.L281:
	.word	.LANCHOR0
	.word	g_AdspOsalFunc
	UNWIND(.fnend)
	.size	ENGINE_Init, .-ENGINE_Init
	.align	2
	.global	ENGINE_DeInit
	.type	ENGINE_DeInit, %function
ENGINE_DeInit:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, .L286
	mov	r6, #0
	add	r5, r4, #24
.L284:
	ldr	r0, [r4, #4]!
	bl	ENGINEDestroyChn
	cmp	r4, r5
	str	r6, [r4]
	bne	.L284
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L287:
	.align	2
.L286:
	.word	.LANCHOR0+20
	UNWIND(.fnend)
	.size	ENGINE_DeInit, .-ENGINE_DeInit
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	g_stEneRm, %object
	.size	g_stEneRm, 48
g_stEneRm:
	.space	48
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
