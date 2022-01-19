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
	.file	"aoe_aip.c"
	.text
	.align	2
	.type	AIPCalcProcBlockSize, %function
AIPCalcProcBlockSize:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r3, r1
	mov	r4, r0
	mov	r1, r2
	mov	r0, r3
	bl	UTIL_CalcFrameSize
	add	r3, r4, r4, lsl #2
	movw	r2, #19923
	mov	r1, #25856
	movt	r2, 4194
	movt	r1, 4
	umull	r2, r3, r3, r2
	movw	r2, #48000
	cmp	r4, r1
	cmpne	r4, r2
	mov	r3, r3, lsr #6
	bne	.L2
	ands	r2, r3, #255
	addne	r3, r3, #256
	rsbne	r3, r2, r3
	mul	r0, r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2:
	tst	r3, #3
	bicne	r3, r3, #3
	addne	r3, r3, #4
	mul	r0, r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	AIPCalcProcBlockSize, .-AIPCalcProcBlockSize
	.align	2
	.type	AIPDestroyChn, %function
AIPDestroyChn:
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
	ldr	r0, [r4, #132]
	mov	r3, #0
	str	r3, [r4, #152]
	cmp	r0, r3
	beq	.L13
	bl	RBUF_Destroy
.L13:
	ldr	r0, [r4, #136]
	cmp	r0, #0
	beq	.L14
	bl	RBUF_Destroy
.L14:
	ldr	r0, [r4, #148]
	cmp	r0, #0
	beq	.L15
	bl	FADE_Destroy
.L15:
	ldr	r0, [r4, #140]
	cmp	r0, #0
	beq	.L16
	bl	LSRC_Destroy
.L16:
	ldr	r0, [r4, #144]
	cmp	r0, #0
	beq	.L17
	bl	ResamplerFree
.L17:
	ldr	r1, [r4, #216]
	cmp	r1, #0
	beq	.L18
	mov	r0, #26
	bl	HI_ADSP_FREE
.L18:
	mov	r1, r4
	mov	r0, #26
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	HI_ADSP_FREE
	UNWIND(.fnend)
	.size	AIPDestroyChn, .-AIPDestroyChn
	.align	2
	.type	AIPGainPcmData, %function
AIPGainPcmData:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #28)
	sub	sp, sp, #28
	ldr	r3, .L50
	mov	r4, #0
	mov	r6, r0
	mov	r2, #20
	str	r4, [fp, #-48]
	ldr	r3, [r3, #24]
	mov	r5, r1
	str	r4, [fp, #-44]
	add	r1, r6, #156
	str	r4, [fp, #-40]
	sub	r0, fp, #48
	str	r4, [fp, #-36]
	str	r4, [fp, #-32]
	blx	r3
	ldr	r3, [r6, #176]
	ldr	r2, [fp, #-44]
	ldr	r1, [fp, #-32]
	add	r2, r3, r2
	cmp	r2, #120
	subhi	r4, r2, #121
	ldr	r2, [fp, #-40]
	str	r4, [fp, #-44]
	add	r3, r3, r2
	ldr	r2, [fp, #-36]
	cmp	r3, #120
	subhi	r3, r3, #121
	movls	r3, #0
	cmp	r4, #121
	str	r3, [fp, #-40]
	ldr	r3, [r6, #180]
	add	r2, r3, r2
	add	r3, r3, r1
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	beq	.L49
.L42:
	sub	r2, fp, #48
	mov	r0, r5
	mov	r1, #0
	bl	UTIL_LRGainProcess
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L49:
	ldr	r1, [fp, #-40]
	cmp	r2, #0
	cmpeq	r1, #121
	movne	r2, #1
	moveq	r2, #0
	cmp	r3, #0
	moveq	r3, r2
	orrne	r3, r2, #1
	cmp	r3, #0
	bne	.L42
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L51:
	.align	2
.L50:
	.word	g_AdspOsalFunc
	UNWIND(.fnend)
	.size	AIPGainPcmData, .-AIPGainPcmData
	.align	2
	.type	AIPUpdateTrackLatency, %function
AIPUpdateTrackLatency:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #44)
	sub	sp, sp, #44
	mov	r5, r0
	mov	r6, r1
	mov	r0, #0
	sub	r1, fp, #64
	bl	AOP_GetChnStatus
	ldr	r0, [r5, #136]
	bl	RBUF_QueryBusy
	ldr	r2, [r5, #88]
	ldr	r1, [r5, #228]
	bl	UTIL_LatencyMs
	mov	r4, r0
	ldr	r0, [r5, #132]
	bl	RBUF_QueryBusy
	ldr	r2, [r5, #32]
	ldr	r1, [r5, #232]
	bl	UTIL_LatencyMs
	ldr	r3, [fp, #-32]
	add	r0, r4, r0
	add	r0, r0, r3
	ldr	r3, [r6, #56]
	cmp	r0, #1000
	ubfxcc	r0, r0, #0, #10
	biccc	r3, r3, #66846720
	orrcs	r3, r3, #66846720
	biccc	r3, r3, #196608
	orrcc	r0, r3, r0, asl #16
	orrcs	r3, r3, #196608
	strcc	r0, [r6, #56]
	strcs	r3, [r6, #56]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	AIPUpdateTrackLatency, .-AIPUpdateTrackLatency
	.align	2
	.type	AIPUpdateChnState, %function
AIPUpdateChnState:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #16)
	sub	sp, sp, #16
	ldr	r3, .L67
	add	r2, r0, #8
	ldr	r4, [r3, r2, asl #2]
	ldr	r3, [r3, r0, asl #2]
	cmp	r4, #0
	beq	.L55
	ldr	r2, [r3, #84]
	ubfx	r2, r2, #20, #1
	cmp	r2, #1
	streq	r2, [r4, #20]
	ldreq	r2, [r3, #84]
	biceq	r2, r2, #1048576
	streq	r2, [r3, #84]
	ldr	r2, [r4, #36]
	cmp	r2, #0
	bne	.L55
	ldr	r1, [r3, #8]
	str	r1, [fp, #-32]
	ldr	r1, [r3, #48]
	str	r1, [fp, #-28]
	ldr	r1, [r3, #76]
	str	r2, [r4, #156]
	str	r1, [fp, #-24]
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-24]
	ldr	ip, [fp, #-24]
	uxtb	r0, r0
	ubfx	r1, r1, #8, #8
	str	r0, [r4, #160]
	uxtb	r2, r2
	str	r2, [r4, #176]
	ldr	r2, [fp, #-24]
	tst	ip, #2048
	str	r1, [r4, #164]
	ubfxeq	r2, r2, #8, #3
	streq	r2, [r4, #180]
	beq	.L61
	tst	r2, #2048
	ldrne	r2, [fp, #-24]
	ubfxne	r2, r2, #8, #3
	rsbne	r2, r2, #0
	strne	r2, [r4, #180]
.L61:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-28]
	ubfx	r0, r0, #16, #1
	ubfx	r1, r1, #17, #3
	str	r1, [r4, #188]
	ubfx	r2, r2, #23, #2
	str	r2, [r4, #192]
	cmp	r2, #1
	str	r0, [r4, #184]
	ldrne	r2, [fp, #-28]
	moveq	r2, #256
	movne	r2, r2, lsr #25
	rsbne	r2, r2, #0
	str	r2, [r4, #288]
	ldr	r2, [fp, #-28]
	ldr	r1, [fp, #-32]
	ubfx	r2, r2, #20, #3
	str	r2, [r4, #292]
	ldr	r2, [fp, #-32]
	tst	r1, #1610612736
	ubfxeq	r2, r2, #24, #5
	streq	r2, [r4, #208]
	bne	.L66
.L65:
	ldr	r1, [r3]
	ldr	r2, [r4, #88]
	ubfx	r1, r1, #14, #1
	str	r1, [r4, #4]
	ldr	r5, [r3, #4]
	ldr	lr, [fp, #-24]
	ldr	ip, [fp, #-24]
	ubfx	r5, r5, #24, #1
	ldr	r0, [fp, #-24]
	ubfx	lr, lr, #24, #1
	ldr	r1, [fp, #-32]
	ubfx	ip, ip, #12, #4
	str	r5, [r4, #244]
	ubfx	r0, r0, #16, #8
	str	lr, [r4, #248]
	ubfx	r1, r1, #15, #1
	str	ip, [r4, #256]
	str	r1, [r4, #252]
	str	r0, [r4, #260]
	ldr	r0, [r3, #4]
	ldr	r1, [r4, #228]
	ubfx	r0, r0, #10, #7
	str	r0, [r4, #128]
	bl	UTIL_LatencyMs2ByteSize
	add	r1, r4, #96
	str	r0, [r4, #124]
	ldr	r0, [r4, #136]
	bl	RBUF_UpdateAttr
.L55:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L66:
	ubfx	r2, r2, #29, #2
	cmp	r2, #1
	ldreq	r2, [fp, #-32]
	ubfxeq	r2, r2, #24, #5
	rsbeq	r2, r2, #0
	streq	r2, [r4, #208]
	b	.L65
.L68:
	.align	2
.L67:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIPUpdateChnState, .-AIPUpdateChnState
	.align	2
	.type	AIPReclaimFifo, %function
AIPReclaimFifo:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r4, r0
	ldr	r0, [r0, #136]
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	bl	RBUF_QueryBusy
	ldr	r3, [r4, #224]
	cmp	r0, r3
	bcc	.L81
	bl	AOE_GetWKBuf
	ldr	r5, [r4, #224]
	mov	r2, r5
	mov	r1, r0
	mov	r6, r0
	ldr	r0, [r4, #136]
	bl	RBUF_ReadData
	cmp	r5, r0
	bne	.L81
	ldr	r3, [r4, #252]
	cmp	r3, #0
	bne	.L82
.L73:
	ldr	r3, [r4, #316]
	ldr	r2, [r4, #224]
	cmp	r3, #0
	ldr	r0, [r4, #312]
	beq	.L74
	mov	r1, r6
	blx	r3
.L74:
	ldr	r0, [r4, #136]
	bl	RBUF_Flush
	ldr	r2, [r4, #224]
	ldr	r0, [r4, #136]
	mov	r1, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	RBUF_WriteData
.L81:
	ldr	r0, [r4, #136]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	RBUF_Flush
.L82:
	ldr	r0, [r4, #148]
	mov	r2, #6
	mov	r1, #2
	bl	FADE_Active
	mov	r2, #256
	mov	r1, r6
	ldr	r0, [r4, #148]
	bl	FADE_OutProcess
	b	.L73
	UNWIND(.fnend)
	.size	AIPReclaimFifo, .-AIPReclaimFifo
	.align	2
	.global	AIP_GetPcmType
	.type	AIP_GetPcmType, %function
AIP_GetPcmType:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L86
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	ldrne	r3, [r3]
	moveq	r3, #5
	ubfxne	r3, r3, #11, #3
	str	r3, [r1]
	ldmfd	sp, {fp, sp, pc}
.L87:
	.align	2
.L86:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIP_GetPcmType, .-AIP_GetPcmType
	.align	2
	.global	AIPGetRbfFiFoAttr
	.type	AIPGetRbfFiFoAttr, %function
AIPGetRbfFiFoAttr:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r3, .L92
	mov	r4, r1
	ldr	r5, [r3, r0, asl #2]
	add	r0, r1, #80
	ldr	r1, [r5, #4]
	and	r1, r1, #3
	bl	AOE_REG_ReadBitDepth
	cmp	r0, #0
	bne	.L91
	ldr	r1, [r5, #4]
	add	r0, r4, #84
	ubfx	r1, r1, #2, #2
	bl	AOE_REG_ReadChannel
	cmp	r0, #0
	bne	.L91
	ldr	r1, [r5, #4]
	add	r0, r4, #88
	ubfx	r1, r1, #4, #4
	bl	AOE_REG_ReadSampelRate
	cmp	r0, #0
	bne	.L91
	ldr	r1, [r5, #4]
	add	r0, r4, #92
	ubfx	r1, r1, #8, #2
	bl	AOE_REG_ReadDataFormat
	cmp	r0, #0
	bne	.L91
	ldr	r1, [r5, #4]
	sub	r0, fp, #32
	ubfx	r1, r1, #10, #7
	bl	AOE_REG_ReadBufLatencyMs
	subs	r6, r0, #0
	bne	.L91
	ldr	r3, [fp, #-32]
	cmp	r3, #80
	bhi	.L91
	ldr	r1, [r4, #80]
	ldr	r0, [r4, #84]
	bl	UTIL_CalcFrameSize
	ldr	r2, [r4, #88]
	str	r6, [r4, #96]
	str	r6, [r4, #116]
	mov	r7, r0
	mov	r1, r0
	mov	r0, #80
	bl	UTIL_LatencyMs2ByteSize
	ldr	r3, [fp, #-32]
	add	r2, r5, #68
	str	r7, [r4, #120]
	str	r2, [r4, #108]
	mov	r1, r7
	add	r5, r5, #72
	str	r3, [r4, #128]
	str	r5, [r4, #112]
	ldr	r2, [r4, #88]
	str	r0, [r4, #104]
	mov	r0, r3
	bl	UTIL_LatencyMs2ByteSize
	str	r0, [r4, #124]
	mov	r0, r6
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L91:
	mvn	r6, #0
	mov	r0, r6
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L93:
	.align	2
.L92:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIPGetRbfFiFoAttr, .-AIPGetRbfFiFoAttr
	.align	2
	.global	AIPGetRbfInAttr
	.type	AIPGetRbfInAttr, %function
AIPGetRbfInAttr:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r3, .L106
	mov	r4, r1
	ldr	r5, [r3, r0, asl #2]
	add	r0, r1, #24
	ldr	r1, [r5]
	and	r1, r1, #3
	bl	AOE_REG_ReadBitDepth
	cmp	r0, #0
	bne	.L97
	ldr	r1, [r5]
	add	r0, r4, #28
	ubfx	r1, r1, #2, #3
	bl	AOE_REG_ReadChannel
	cmp	r0, #0
	bne	.L97
	ldr	r1, [r5]
	add	r0, r4, #32
	ubfx	r1, r1, #5, #4
	bl	AOE_REG_ReadSampelRate
	cmp	r0, #0
	beq	.L100
	ldr	r3, [r5]
	ubfx	r3, r3, #5, #4
	cmp	r3, #15
	beq	.L104
.L100:
	ldr	r1, [r5]
	add	r0, r4, #36
	ubfx	r1, r1, #9, #2
	bl	AOE_REG_ReadDataFormat
	cmp	r0, #0
	bne	.L97
	ldr	r1, [r5]
	mov	r0, r4
	ubfx	r1, r1, #11, #3
	bl	AOE_REG_ReadPcmType
	subs	r6, r0, #0
	bne	.L97
	ldr	r3, [r5]
	ldr	r1, [r4, #24]
	ubfx	r3, r3, #14, #1
	ldr	r0, [r4, #28]
	str	r3, [r4, #4]
	bl	UTIL_CalcFrameSize
	str	r6, [fp, #-36]
	mov	r3, #1
	str	r6, [fp, #-32]
	str	r3, [r4, #44]
	ldr	r3, [r5, #16]
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-36]
	ldr	r3, [r5, #20]
	str	r2, [r4, #48]
	str	r3, [fp, #-32]
	ldr	r3, [r5, #24]
	bic	r3, r3, #-16777216
	str	r3, [r4, #52]
	ldr	r2, [r5, #24]
	tst	r2, #16777216
	bne	.L105
	add	r1, r5, #28
	add	r2, r5, #36
	str	r1, [r4, #56]
	str	r2, [r4, #60]
.L102:
	ldr	r2, [r5, #24]
	mov	ip, #0
	str	r0, [r4, #68]
	mov	r1, #16
	ubfx	r2, r2, #24, #1
	str	r3, [r4, #72]
	str	r2, [r4, #64]
	mov	r3, #2
	mov	r2, #8
	mov	r0, r6
	str	ip, [r4, #76]
	str	r1, [r4, #12]
	str	r2, [r4, #16]
	str	r3, [r4, #20]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L105:
	str	r6, [fp, #-36]
	str	r6, [fp, #-32]
	ldr	r2, [r5, #28]
	str	r2, [fp, #-36]
	ldr	r1, [fp, #-36]
	ldr	r2, [r5, #32]
	str	r1, [r4, #56]
	str	r2, [fp, #-32]
	str	r6, [fp, #-36]
	str	r6, [fp, #-32]
	ldr	r2, [r5, #36]
	str	r2, [fp, #-36]
	ldr	r1, [fp, #-36]
	ldr	r2, [r5, #40]
	str	r1, [r4, #60]
	str	r2, [fp, #-32]
	b	.L102
.L104:
	ldr	r3, [r5, #12]
	movw	r2, #56928
	movt	r2, 2
	bic	r3, r3, #-16777216
	str	r3, [r4, #32]
	sub	r3, r3, #4000
	cmp	r3, r2
	bhi	.L97
	ldr	r3, [r4, #28]
	cmp	r3, #2
	bhi	.L97
	ldr	r3, [r4, #24]
	cmp	r3, #16
	beq	.L100
.L97:
	mvn	r6, #0
	mov	r0, r6
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L107:
	.align	2
.L106:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIPGetRbfInAttr, .-AIPGetRbfInAttr
	.align	2
	.global	AIPGetChnCreateAttr
	.type	AIPGetChnCreateAttr, %function
AIPGetChnCreateAttr:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r4, r0
	mov	r5, r1
	bl	AIPGetRbfInAttr
	cmp	r0, #0
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	mov	r1, r5
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	AIPGetRbfFiFoAttr
	UNWIND(.fnend)
	.size	AIPGetChnCreateAttr, .-AIPGetChnCreateAttr
	.align	2
	.global	AIPIsChnAttrChange
	.type	AIPIsChnAttrChange, %function
AIPIsChnAttrChange:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #140)
	sub	sp, sp, #140
	ldr	r3, .L111
	add	r2, r0, #8
	sub	r1, fp, #160
	ldr	r5, [r3, r2, asl #2]
	bl	AIPGetChnCreateAttr
	ldr	ip, [fp, #-132]
	ldr	r0, [fp, #-136]
	ldr	lr, [r5, #28]
	ldr	r1, [r5, #24]
	subs	lr, lr, ip
	ldr	r3, [r5, #32]
	ldr	r4, [fp, #-128]
	movne	lr, #1
	cmp	r1, r0
	moveq	ip, lr
	addne	ip, lr, #1
	ldr	r0, [r5, #36]
	cmp	r3, r4
	moveq	r1, ip
	addne	r1, ip, #1
	ldr	lr, [fp, #-124]
	ldr	r4, [r5]
	ldr	ip, [fp, #-160]
	cmp	r0, lr
	moveq	r2, r1
	addne	r2, r1, #1
	ldr	lr, [r5, #4]
	ldr	r1, [fp, #-156]
	cmp	r4, ip
	moveq	r3, r2
	addne	r3, r2, #1
	ldr	ip, [r5, #48]
	ldr	r2, [fp, #-112]
	cmp	lr, r1
	moveq	r0, r3
	addne	r0, r3, #1
	ldr	r1, [r5, #52]
	ldr	r3, [fp, #-108]
	cmp	ip, r2
	moveq	r4, r0
	addne	r4, r0, #1
	ldr	r2, [r5, #64]
	ldr	r0, [fp, #-96]
	cmp	r1, r3
	moveq	lr, r4
	addne	lr, r4, #1
	ldr	r6, [fp, #-80]
	ldr	r3, [r5, #80]
	cmp	r2, r0
	moveq	ip, lr
	addne	ip, lr, #1
	ldr	r4, [fp, #-76]
	ldr	r0, [r5, #84]
	cmp	r3, r6
	moveq	r1, ip
	addne	r1, ip, #1
	ldr	lr, [r5, #88]
	ldr	ip, [fp, #-72]
	cmp	r0, r4
	moveq	r2, r1
	addne	r2, r1, #1
	ldr	r0, [r5, #92]
	ldr	r1, [fp, #-68]
	cmp	lr, ip
	moveq	r3, r2
	addne	r3, r2, #1
	cmp	r0, r1
	moveq	r0, r3
	addne	r0, r3, #1
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L112:
	.align	2
.L111:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIPIsChnAttrChange, .-AIPIsChnAttrChange
	.align	2
	.global	AIPCreateChn
	.type	AIPCreateChn, %function
AIPCreateChn:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #196)
	sub	sp, sp, #196
	ldr	r3, .L167
	sub	r1, fp, #168
	mov	r4, #0
	mov	r6, r0
	str	r4, [fp, #-220]
	ldr	r5, [r3, r0, asl #2]
	str	r4, [fp, #-216]
	str	r4, [fp, #-212]
	str	r4, [fp, #-208]
	bl	AIPGetChnCreateAttr
	subs	r8, r0, #0
	movne	r3, r4
	bne	.L162
	mov	r1, #328
	mov	r0, #26
	bl	HI_ADSP_MALLOC
	subs	r4, r0, #0
	beq	.L115
	ldr	r7, .L167+4
	mov	r2, #328
	mov	r1, r8
	ldr	r3, [r7, #20]
	blx	r3
	ldr	r3, [r7, #24]
	sub	r1, fp, #168
	mov	r2, #132
	mov	r0, r4
	blx	r3
	str	r6, [r4, #236]
	sub	r1, fp, #124
	sub	r0, fp, #212
	bl	RBUF_Create_EXT
	ldr	r3, [fp, #-212]
	cmp	r3, #0
	beq	.L115
	ldr	r2, [fp, #-132]
	str	r3, [r4, #132]
	cmp	r2, #0
	beq	.L163
	str	r8, [r5, #60]
	ldr	r3, [r5, #64]
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	str	r3, [r5, #64]
.L117:
	mov	r1, #768
	mov	r0, #26
	bl	HI_ADSP_MALLOC
	cmp	r0, #0
	str	r0, [r4, #216]
	beq	.L115
	ldr	r3, [fp, #-132]
	cmp	r3, #0
	ldrne	r2, [r4]
	beq	.L164
.L119:
	ldr	r3, [r5, #8]
	cmp	r2, #4
	ubfx	r3, r3, #15, #1
	str	r3, [r4, #252]
	moveq	r3, #24576
	streq	r3, [r4, #324]
	beq	.L130
.L129:
	mov	r3, #6144
	str	r3, [r4, #324]
.L130:
	mov	r3, #0
	mov	r1, #256
	str	r3, [r4, #156]
	mov	r2, #3
	str	r3, [r4, #160]
	str	r3, [r4, #164]
	str	r3, [r4, #188]
	str	r1, [r4, #288]
	str	r2, [r4, #292]
	ldr	r1, [r4, #28]
	ldr	r2, [r4, #24]
	ldr	r0, [r4, #32]
	bl	AIPCalcProcBlockSize
	ldr	r2, [r4, #80]
	ldr	r1, [r4, #84]
	str	r0, [r4, #220]
	ldr	r0, [r4, #88]
	bl	AIPCalcProcBlockSize
	ldr	r1, [r4, #80]
	str	r0, [r4, #224]
	ldr	r0, [r4, #84]
	bl	UTIL_CalcFrameSize
	ldr	r1, [r4, #24]
	str	r0, [r4, #228]
	ldr	r0, [r4, #28]
	bl	UTIL_CalcFrameSize
	mov	r3, r4
	mov	r2, #1
	str	r2, [r4, #152]
	str	r0, [r4, #232]
.L162:
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L164:
	ldr	r0, [fp, #-136]
	ldr	r2, [fp, #-80]
	cmp	r0, r2
	beq	.L120
	cmp	r0, #32000
	beq	.L121
	bls	.L165
.L121:
	mov	r3, #1
	mov	r1, r2
	str	r3, [r4, #240]
	mov	ip, #0
	ldr	r3, [fp, #-88]
	ldr	r2, [fp, #-84]
	str	ip, [sp]
	bl	ResamplerCreate
	cmp	r0, #0
	beq	.L115
	ldr	r2, [fp, #-80]
	str	r0, [r4, #144]
.L120:
	ldr	ip, [fp, #-84]
	mov	r1, r2
	ldr	r3, [fp, #-88]
	sub	r0, fp, #220
	str	ip, [sp]
	bl	LSRC_Create
	ldr	r3, [fp, #-220]
	cmp	r3, #0
	beq	.L115
	str	r3, [r4, #140]
	mov	r6, #0
	str	r6, [r5, #80]
	ldr	r3, [r4]
	cmp	r3, r6
	bne	.L166
	ldr	r3, [r5, #8]
	ubfx	r3, r3, #15, #1
	str	r3, [r4, #252]
	b	.L129
.L163:
	sub	r0, fp, #208
	sub	r1, fp, #72
	bl	RBUF_Create
	ldr	r0, [fp, #-208]
	cmp	r0, #0
	beq	.L115
	str	r0, [r4, #136]
	sub	r1, fp, #204
	bl	RBUF_QueryInfo
	ldr	r3, [r5, #64]
	ldrh	r2, [fp, #-192]
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	orr	r3, r3, r2
	str	r3, [r5, #64]
	b	.L117
.L165:
	movw	r3, #12000
	cmp	r0, r3
	beq	.L121
	b	.L121
.L166:
	ldr	r3, [fp, #-140]
	sub	r0, fp, #216
	ldr	r2, [fp, #-144]
	ldr	r1, [fp, #-136]
	bl	FADE_Create
	ldr	r3, [fp, #-216]
	cmp	r3, r6
	ldrne	r2, [r4]
	strne	r3, [r4, #148]
	strne	r6, [r4, #204]
	bne	.L119
.L115:
	mov	r0, r4
	bl	AIPDestroyChn
	mov	r3, #0
	b	.L162
.L168:
	.align	2
.L167:
	.word	.LANCHOR0
	.word	g_AdspOsalFunc
	UNWIND(.fnend)
	.size	AIPCreateChn, .-AIPCreateChn
	.align	2
	.global	AIPFlushChnCtx
	.type	AIPFlushChnCtx, %function
AIPFlushChnCtx:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r4, r0
	ldr	r0, [r0, #144]
	cmp	r0, #0
	beq	.L170
	bl	ResampleFlush
.L170:
	ldr	r0, [r4, #140]
	cmp	r0, #0
	beq	.L171
	bl	LSRC_Flush
.L171:
	ldr	r0, [r4, #148]
	mov	r3, #0
	str	r3, [r4, #212]
	cmp	r0, r3
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	mov	r2, #8
	mov	r1, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	FADE_Active
	UNWIND(.fnend)
	.size	AIPFlushChnCtx, .-AIPFlushChnCtx
	.align	2
	.type	AIPFlushChn, %function
AIPFlushChn:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	tst	r1, #1
	mov	r4, r1
	mov	r5, r0
	bne	.L198
.L180:
	tst	r4, #2
	beq	.L181
	ldr	r0, [r5, #132]
	cmp	r0, #0
	beq	.L181
	bl	RBUF_Flush
.L181:
	tst	r4, #4
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r0, [r5, #136]
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	RBUF_Flush
.L198:
	bl	AIPFlushChnCtx
	b	.L180
	UNWIND(.fnend)
	.size	AIPFlushChn, .-AIPFlushChn
	.align	2
	.global	AIPFlushChnRufIn
	.type	AIPFlushChnRufIn, %function
AIPFlushChnRufIn:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r0, [r0, #132]
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	RBUF_Flush
	UNWIND(.fnend)
	.size	AIPFlushChnRufIn, .-AIPFlushChnRufIn
	.align	2
	.global	AIPFlushChnFifo
	.type	AIPFlushChnFifo, %function
AIPFlushChnFifo:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r0, [r0, #136]
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	RBUF_Flush
	UNWIND(.fnend)
	.size	AIPFlushChnFifo, .-AIPFlushChnFifo
	.align	2
	.global	AIPGetChnCmd
	.type	AIPGetChnCmd, %function
AIPGetChnCmd:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r3, .L213
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r3, #8]
	str	r2, [fp, #-16]
	ldr	r2, [fp, #-16]
	tst	r2, #8
	movne	r0, #4
	beq	.L212
.L204:
	str	r0, [r1]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L212:
	ldr	r2, [fp, #-16]
	and	r2, r2, #3
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L205
.L206:
	.word	.L211
	.word	.L207
	.word	.L208
	.word	.L209
.L211:
	mov	r0, #0
	b	.L204
.L209:
	mov	r0, #3
	b	.L204
.L208:
	mov	r0, #2
	b	.L204
.L207:
	mov	r0, #1
	b	.L204
.L205:
	ldr	r2, [r3, #8]
	mov	r0, #4
	bic	r2, r2, #240
	orr	r2, r2, #64
	str	r2, [r3, #8]
	ldr	r2, [r3, #8]
	orr	r2, r2, #8
	str	r2, [r3, #8]
	b	.L204
.L214:
	.align	2
.L213:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIPGetChnCmd, .-AIPGetChnCmd
	.align	2
	.global	AIPAckChnCmd
	.type	AIPAckChnCmd, %function
AIPAckChnCmd:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L217
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r3, #8]
	tst	r2, #8
	ldmnefd	sp, {fp, sp, pc}
	ldr	r2, [r3, #8]
	and	r1, r1, #15
	bic	r2, r2, #240
	orr	r1, r2, r1, asl #4
	str	r1, [r3, #8]
	ldr	r2, [r3, #8]
	orr	r2, r2, #8
	str	r2, [r3, #8]
	ldmfd	sp, {fp, sp, pc}
.L218:
	.align	2
.L217:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIPAckChnCmd, .-AIPAckChnCmd
	.align	2
	.global	AIP_Init
	.type	AIP_Init, %function
AIP_Init:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r5, .L222
	mov	r4, r0
	ldr	r8, .L222+4
	mov	r7, #0
	add	r6, r5, #32
.L220:
	str	r4, [r5, #4]!
	mov	r0, r4
	ldr	r3, [r8, #20]
	mov	r2, #96
	mov	r1, #0
	blx	r3
	ldr	r3, [r4, #8]
	cmp	r5, r6
	orr	r3, r3, #8
	str	r3, [r4, #8]
	ldr	r3, [r4, #8]
	bic	r3, r3, #32512
	orr	r3, r3, #30976
	str	r3, [r4, #8]
	ldr	r3, [r4]
	bic	r3, r3, #14336
	orr	r3, r3, #10240
	str	r3, [r4], #96
	str	r7, [r5, #32]
	bne	.L220
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L223:
	.align	2
.L222:
	.word	.LANCHOR0-4
	.word	g_AdspOsalFunc
	UNWIND(.fnend)
	.size	AIP_Init, .-AIP_Init
	.align	2
	.global	AIP_DeInit
	.type	AIP_DeInit, %function
AIP_DeInit:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, .L227
	mov	r6, #0
	add	r5, r4, #32
.L225:
	ldr	r0, [r4, #4]!
	bl	AIPDestroyChn
	cmp	r4, r5
	str	r6, [r4]
	bne	.L225
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L228:
	.align	2
.L227:
	.word	.LANCHOR0+28
	UNWIND(.fnend)
	.size	AIP_DeInit, .-AIP_DeInit
	.global	__aeabi_uidiv
	.align	2
	.global	AIP_Process
	.type	AIP_Process, %function
AIP_Process:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #108)
	sub	sp, sp, #108
	ldr	r3, .L391
	movw	r8, #19923
	mov	r4, #0
	add	r6, r3, #32
	movt	r8, 4194
	mov	r7, r3
.L297:
	sub	r1, fp, #80
	mov	r0, r4
	bl	AIPGetChnCmd
	cmp	r0, #4
	beq	.L366
	ldr	r3, [fp, #-80]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L366
.L234:
	.word	.L233
	.word	.L235
	.word	.L236
	.word	.L237
.L237:
	ldr	r5, [r6]
	cmp	r5, #0
	beq	.L253
	ldr	r9, [r5, #152]
	cmp	r9, #1
	beq	.L371
	cmp	r9, #2
	beq	.L372
.L248:
	mov	r3, #0
	str	r3, [r5, #320]
	mov	r3, #2
	str	r3, [r5, #20]
.L369:
	ldr	r3, [r7]
.L370:
	ldr	r2, [r3, #8]
	tst	r2, #8
	bne	.L366
	ldr	r2, [r3, #8]
	bic	r2, r2, #240
.L367:
	str	r2, [r3, #8]
	ldr	r2, [r3, #8]
	orr	r2, r2, #8
	str	r2, [r3, #8]
.L366:
	ldr	r5, [r6]
.L231:
	cmp	r5, #0
	beq	.L253
	ldr	r9, [r5, #152]
	cmp	r9, #1
	beq	.L373
.L253:
	add	r4, r4, #1
	add	r7, r7, #4
	cmp	r4, #8
	add	r6, r6, #4
	bne	.L297
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L236:
	ldr	r5, [r6]
	cmp	r5, #0
	beq	.L253
	ldr	r9, [r5, #152]
	cmp	r9, #1
	bne	.L248
	mov	r0, r5
	bl	AIPReclaimFifo
	mov	r1, r9
	mov	r0, r5
	bl	AIPFlushChn
	mov	r3, #2
	str	r3, [r5, #152]
	b	.L248
.L233:
	ldr	r5, [r6]
	cmp	r5, #0
	beq	.L365
	ldr	r3, [r5, #152]
	cmp	r3, #0
	beq	.L374
	cmp	r3, #2
	bne	.L369
	mov	r1, #1
	ldr	r0, [r5, #148]
	str	r1, [r5, #152]
	mov	r2, #8
	bl	FADE_Active
	ldr	r0, [r6]
	cmp	r0, #0
	bne	.L369
.L384:
	ldr	r3, [r7]
	ldr	r2, [r3, #8]
	tst	r2, #8
	bne	.L253
	ldr	r2, [r3, #8]
	bic	r2, r2, #240
	orr	r2, r2, #16
	b	.L367
.L235:
	ldr	r5, [r6]
	ldr	r9, [r7]
	cmp	r5, #0
	cmpne	r9, #0
	beq	.L231
	ldr	r3, [r5, #152]
	sub	r2, r3, #1
	cmp	r2, #1
	movhi	r3, r9
	bhi	.L370
	cmp	r3, #1
	beq	.L375
.L251:
	mov	r1, #3
	mov	r0, r5
	bl	AIPFlushChn
	mov	r3, #0
	mov	r2, #2
	str	r3, [r5, #152]
	str	r2, [r5, #20]
	str	r3, [r9, #80]
	str	r3, [r5, #320]
	ldr	r3, [r7]
	b	.L370
.L373:
	ldr	r10, [r7]
	cmp	r10, #0
	beq	.L255
	ldr	r3, [r5, #20]
	cmp	r3, #1
	bls	.L255
	ldr	r0, [r5, #132]
	bl	RBUF_QueryBusy
	cmp	r0, #0
	beq	.L255
	ldr	r3, [r5, #32]
	ldr	ip, [r5, #68]
	ldr	r2, [r10, #84]
	ldr	r1, [r5, #20]
	mul	ip, ip, r3
	ubfx	r2, r2, #0, #10
	ldr	lr, [r10, #84]
	ubfx	lr, lr, #10, #10
	mul	r2, r2, ip
	umull	r2, r3, r2, r8
	cmp	r0, r3, lsr #6
	movcc	r3, #1
	movcs	r3, #0
	cmp	r1, #2
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r3, #0
	bne	.L255
	mul	r2, ip, lr
	umull	r2, r3, r2, r8
	cmp	r0, r3, lsr #6
	movcc	r3, #1
	movcs	r3, #0
	cmp	r1, #3
	movne	r1, #0
	andeq	r1, r3, #1
	cmp	r1, #0
	bne	.L255
	str	r9, [r5, #20]
	mov	r1, r9
	mov	r2, #8
	ldr	r0, [r5, #148]
	bl	FADE_Active
.L255:
	ldr	r3, [r5, #36]
	mov	r0, r4
	cmp	r3, #0
	beq	.L376
	bl	AIPUpdateChnState
	b	.L253
.L376:
	bl	AIPUpdateChnState
	ldr	r3, [r5, #20]
	cmp	r3, #1
	beq	.L377
.L259:
	ldr	r5, [r6]
	ldr	r9, [r7]
	ldr	r0, [r5, #136]
	bl	RBUF_QueryBusy
	ldr	r2, [r5, #88]
	ldr	r1, [r5, #228]
	bl	UTIL_LatencyMs
	ldr	r3, [r9, #4]
	mov	r1, r9
	bic	r3, r3, #16646144
	and	r2, r0, #127
	mov	r0, r5
	orr	r3, r3, r2, asl #17
	str	r3, [r9, #4]
	bl	AIPUpdateTrackLatency
	mov	r2, #6
	mov	r3, #0
	str	r2, [r5, #312]
	str	r3, [r5, #316]
	b	.L253
.L377:
	ldr	r3, [r5, #244]
	cmp	r3, #1
	beq	.L259
	ldr	r3, [r5, #248]
	cmp	r3, #0
	bne	.L261
	ldr	r2, [r5, #264]
	cmp	r2, #1
	streq	r3, [r5, #264]
.L271:
	ldr	r10, [r5, #212]
	ldr	r1, [r5, #228]
	ldr	r9, [r5, #224]
	mul	r3, r10, r1
	cmp	r3, r9
	bcs	.L378
	ldr	r3, [r5, #36]
	ldr	r2, [r5, #88]
	cmp	r3, #0
	ldr	r3, [r5, #84]
	movne	r10, r9
	str	r3, [fp, #-120]
	ldr	r3, [r5, #80]
	beq	.L379
.L274:
	ldr	r0, [r5, #132]
	bl	RBUF_QueryBusy
	cmp	r0, r10
	bcc	.L259
	cmp	r10, #0
	beq	.L259
	ldr	r0, [r5, #136]
	cmp	r0, #0
	beq	.L259
	mov	r1, r9
	bl	RBUF_CheckFree
	cmp	r0, #0
	beq	.L259
	cmp	r9, #0
	beq	.L259
	bl	AOE_GetWKBuf
	ldr	r1, [r5, #232]
	str	r10, [fp, #-104]
	mov	r9, r0
	mov	r0, r10
	str	r9, [fp, #-108]
	bl	__aeabi_uidiv
	ldr	ip, [r5, #24]
	mov	r1, r9
	ldr	r3, [r5, #28]
	mov	r2, r10
	ldr	lr, [r5, #32]
	str	ip, [fp, #-96]
	ldr	ip, [r5, #36]
	str	r3, [fp, #-92]
	mov	r3, #0
	str	lr, [fp, #-88]
	str	ip, [fp, #-84]
	str	r0, [fp, #-100]
	ldr	r0, [r5, #132]
	bl	RBUF_ReadDataDma
	ldr	r3, [r5, #36]
	cmp	r3, #0
	beq	.L380
.L280:
	ldr	r3, [r5, #184]
	cmp	r3, #1
	beq	.L381
.L292:
	ldr	r2, [r5, #228]
	ldr	r3, [r5, #212]
	ldr	r10, [r5, #224]
	mul	r2, r3, r2
	cmp	r2, #0
	bne	.L382
.L293:
	cmp	r10, #0
	ldr	r3, [fp, #-104]
	beq	.L295
	cmp	r10, r3
	movcs	r10, r3
	cmp	r10, #0
	beq	.L295
	mov	r2, r10
	ldr	r1, [fp, #-108]
	ldr	r0, [r5, #136]
	bl	RBUF_WriteData
	ldr	r3, [fp, #-104]
.L295:
	subs	r9, r3, r10
	beq	.L296
	ldr	r3, .L391+4
	mov	r2, r9
	ldr	r1, [fp, #-108]
	ldr	r0, [r5, #216]
	ldr	r3, [r3, #24]
	add	r1, r1, r10
	blx	r3
.L296:
	mov	r0, r9
	ldr	r1, [r5, #228]
	bl	__aeabi_uidiv
	ldr	r3, [r5, #320]
	add	r3, r3, #1
	str	r3, [r5, #320]
	str	r0, [r5, #212]
	b	.L259
.L374:
	mov	r0, r4
	bl	AIPIsChnAttrChange
	cmp	r0, #0
	bne	.L383
	mov	r3, #1
	str	r3, [r5, #152]
	ldr	r0, [r6]
.L239:
	cmp	r0, #0
	bne	.L369
	b	.L384
.L383:
	ldr	r0, [r6]
	bl	AIPDestroyChn
.L365:
	mov	r0, r4
	bl	AIPCreateChn
	str	r0, [r6]
	b	.L239
.L371:
	mov	r0, r5
	bl	AIPReclaimFifo
	mov	r0, r5
	mov	r1, #3
	bl	AIPFlushChn
	mov	r1, r9
	mov	r2, #8
	ldr	r0, [r5, #148]
	bl	FADE_Active
	b	.L248
.L372:
	mov	r1, #7
	mov	r0, r5
	bl	AIPFlushChn
	b	.L248
.L261:
	ldr	r3, [r5, #264]
	cmp	r3, #0
	beq	.L264
	ldr	r3, [r5, #268]
.L265:
	ldr	r9, [r5, #224]
	ldr	r0, [r5, #256]
	str	r3, [fp, #-112]
	mov	r1, r9
	bl	AOP_QueryRbfFree
	cmp	r0, #0
	beq	.L271
	ldr	r0, [r5, #132]
	sub	r1, fp, #112
	bl	RBUF_QueryBusy_ProvideRptr
	cmp	r9, r0
	bhi	.L271
	bl	AOE_GetWKBuf
	ldr	r1, [r5, #232]
	str	r9, [fp, #-104]
	mov	r10, r0
	mov	r0, r9
	str	r10, [fp, #-108]
	bl	__aeabi_uidiv
	ldr	lr, [r5, #28]
	mov	r1, r10
	ldr	ip, [r5, #32]
	sub	r3, fp, #112
	ldr	r10, [r5, #24]
	mov	r2, r9
	str	lr, [fp, #-92]
	sub	r9, fp, #108
	ldr	lr, [r5, #36]
	str	r10, [fp, #-96]
	str	ip, [fp, #-88]
	str	lr, [fp, #-84]
	str	r0, [fp, #-100]
	ldr	r0, [r5, #132]
	bl	RBUF_ReadDataDma
	ldr	r3, [r5, #192]
	cmp	r3, #1
	beq	.L385
.L268:
	mov	r1, r9
	mov	r0, r5
	bl	AIPGainPcmData
	ldr	r1, [r5, #188]
	ldr	r2, [r5, #80]
	sub	r3, r1, #1
	cmp	r3, #6
	bls	.L386
.L269:
	ldr	r3, [r5, #184]
	cmp	r3, #1
	beq	.L387
.L270:
	mov	r1, r9
	ldr	r0, [r5, #256]
	bl	AOP_WriteRbfData
	ldr	r3, [fp, #-112]
	str	r3, [r5, #268]
	b	.L271
.L378:
	ldr	r0, [r5, #136]
	cmp	r0, #0
	beq	.L259
	mov	r1, r9
	bl	RBUF_CheckFree
	cmp	r0, #0
	beq	.L259
	cmp	r9, #0
	beq	.L259
	ldr	r2, [r5, #224]
	ldr	r1, [r5, #216]
	ldr	r0, [r5, #136]
	bl	RBUF_WriteData
	ldr	r1, [r5, #228]
	ldr	r0, [r5, #224]
	bl	__aeabi_uidiv
	ldr	r3, [r5, #212]
	rsb	r0, r0, r3
	str	r0, [r5, #212]
	b	.L259
.L375:
	mov	r0, r5
	bl	AIPReclaimFifo
	b	.L251
.L264:
	ldr	r1, [r5, #80]
	ldr	r0, [r5, #84]
	bl	UTIL_CalcFrameSize
	ldr	r3, [r5, #260]
	ldr	r2, [r5, #32]
	sub	r1, fp, #80
	mul	r2, r3, r2
	mul	r2, r0, r2
	ldr	r0, [r5, #132]
	umull	r2, r3, r2, r8
	mov	r9, r3, lsr #6
	bl	RBUF_QueryInfo
	ldr	r1, [fp, #-52]
	ldr	r2, [fp, #-76]
	cmp	r9, r1
	ldr	r0, [fp, #-68]
	movcs	r9, r1
	add	r3, r9, r2
	cmp	r3, r0
	rsbcs	r3, r0, r2
	mov	r2, #1
	addcs	r3, r3, r9
	str	r2, [r5, #264]
	str	r3, [r5, #268]
	b	.L265
.L379:
	mov	r0, r9
	str	r3, [fp, #-128]
	str	r2, [fp, #-124]
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-120]
	ldr	ip, [r5, #140]
	ldr	r3, [fp, #-128]
	str	r2, [sp]
	ldr	r2, [fp, #-124]
	mov	r1, r2
	rsb	r10, r10, r0
	mov	r0, ip
	bl	LSRC_UpdateChange
	ldr	r1, [r5, #208]
	ldr	r0, [r5, #140]
	bl	LSRC_SetSpeedAdjust
	mov	r1, r10
	ldr	r0, [r5, #140]
	bl	LSRC_GetMinInputNum
	ldr	r3, [r5, #144]
	cmp	r3, #0
	beq	.L276
	mov	r1, r0
	mov	r0, r3
	bl	ResamplerGetMinInputNum
.L276:
	tst	r0, #3
	ldr	r10, [r5, #232]
	bicne	r0, r0, #3
	addne	r0, r0, #4
	mul	r10, r10, r0
	b	.L274
.L380:
	ldr	r10, [r5, #84]
	ldr	r3, [fp, #-92]
	ldr	r2, [r5, #80]
	cmp	r10, r3
	subeq	r9, fp, #108
	str	r2, [fp, #-120]
	beq	.L281
	bls	.L282
	bl	AOE_GetWKBuf
	sub	r9, fp, #108
	mov	r2, r9
	mov	r1, r0
	mov	r0, r10
	bl	UTIL_UpmixPcmData
.L281:
	ldr	r3, [fp, #-96]
	ldr	r10, [fp, #-120]
	cmp	r10, r3
	beq	.L283
	bl	AOE_GetWKBuf
	mov	r2, r9
	mov	r1, r0
	mov	r0, r10
	bl	UTIL_UnifyBitDepthPcmData
.L283:
	ldr	r3, [r5, #144]
	ldr	r10, [r5, #88]
	cmp	r3, #0
	beq	.L284
	bl	AOE_GetWKBuf
	ldr	ip, [fp, #-88]
	mov	lr, #1
	ldr	r3, [fp, #-100]
	ldr	r1, [fp, #-108]
	mov	r2, r0
	str	r0, [fp, #-120]
	ldr	r0, [r5, #144]
	stmib	sp, {r10, lr}
	str	ip, [sp]
	bl	ResamplerProcessFrame
	ldr	r3, [fp, #-120]
	ldr	r1, [fp, #-96]
	str	r10, [fp, #-88]
	str	r3, [fp, #-108]
	str	r0, [fp, #-100]
	ldr	r0, [fp, #-92]
	bl	UTIL_CalcFrameSize
	ldr	r3, [fp, #-100]
	mul	r0, r3, r0
	str	r0, [fp, #-104]
.L284:
	ldr	r3, [r5, #236]
	ldr	r2, .L391
	ldr	r0, [r5, #140]
	ldr	r3, [r2, r3, asl #2]
	cmp	r0, #0
	str	r3, [fp, #-120]
	beq	.L286
	bl	LSRC_CheckDoSRC
	cmp	r0, #0
	beq	.L286
	ldr	r3, [fp, #-100]
	str	r3, [fp, #-124]
	bl	AOE_GetWKBuf
	ldr	r3, [fp, #-124]
	ldr	r1, [fp, #-108]
	mov	r2, r0
	mov	r10, r0
	ldr	r0, [r5, #140]
	bl	LSRC_ProcessFrame
	ldr	r1, [fp, #-96]
	str	r10, [fp, #-108]
	str	r0, [fp, #-100]
	ldr	r0, [fp, #-92]
	bl	UTIL_CalcFrameSize
	ldr	r3, [fp, #-100]
	ldr	r1, [fp, #-120]
	ldr	r2, [r1, #80]
	add	r2, r2, #1
	str	r2, [r1, #80]
	mul	r0, r3, r0
	str	r0, [fp, #-104]
.L286:
	ldr	r3, [r5, #192]
	cmp	r3, #1
	beq	.L388
.L288:
	mov	r1, r9
	mov	r0, r5
	bl	AIPGainPcmData
	ldr	r1, [r5, #188]
	ldr	r2, [r5, #80]
	sub	r3, r1, #1
	cmp	r3, #6
	bls	.L389
.L289:
	ldr	r0, [r5, #148]
	cmp	r0, #0
	beq	.L280
	ldr	r1, [r5, #252]
	cmp	r1, #0
	bne	.L390
	mov	r2, #8
	bl	FADE_Active
	b	.L280
.L382:
	ldr	r1, [r5, #216]
	rsb	r10, r2, r10
	ldr	r0, [r5, #136]
	bl	RBUF_WriteData
	b	.L293
.L381:
	ldr	r3, .L391+4
	mov	r1, #0
	ldr	r2, [fp, #-104]
	ldr	r0, [fp, #-108]
	ldr	r3, [r3, #20]
	blx	r3
	b	.L292
.L390:
	ldr	r2, [fp, #-96]
	ldr	r1, [fp, #-88]
	ldr	r3, [fp, #-92]
	bl	FADE_Flush
	ldr	r2, [fp, #-100]
	ldr	r1, [fp, #-108]
	ldr	r0, [r5, #148]
	bl	FADE_InProcess
	b	.L280
.L282:
	bl	AOE_GetWKBuf
	sub	r9, fp, #108
	mov	r2, r9
	mov	r1, r0
	mov	r0, r10
	bl	UTIL_DownmixPcmData
	b	.L281
.L387:
	ldr	r3, .L391+4
	mov	r1, #0
	ldr	r2, [fp, #-104]
	ldr	r0, [fp, #-108]
	ldr	r3, [r3, #20]
	blx	r3
	b	.L270
.L389:
	mov	r0, r9
	bl	UTIL_ChannelModeProcess
	b	.L289
.L388:
	add	r1, r5, #272
	mov	r0, r9
	bl	UTIL_DRE_16BIT_Process
	b	.L288
.L386:
	mov	r0, r9
	bl	UTIL_ChannelModeProcess
	b	.L269
.L385:
	add	r1, r5, #272
	mov	r0, r9
	bl	UTIL_DRE_16BIT_Process
	b	.L268
.L392:
	.align	2
.L391:
	.word	.LANCHOR0
	.word	g_AdspOsalFunc
	UNWIND(.fnend)
	.size	AIP_Process, .-AIP_Process
	.align	2
	.global	AIP_GetChnStatus
	.type	AIP_GetChnStatus, %function
AIP_GetChnStatus:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L396
	add	r0, r0, #8
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	streq	r3, [r1]
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r2, [r3, #152]
	str	r2, [r1]
	ldr	r2, [r3, #4]
	str	r2, [r1, #4]
	ldr	r2, [r3]
	str	r2, [r1, #8]
	ldr	r2, [r3, #324]
	str	r2, [r1, #12]
	ldr	r3, [r3, #244]
	str	r3, [r1, #16]
	ldmfd	sp, {fp, sp, pc}
.L397:
	.align	2
.L396:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIP_GetChnStatus, .-AIP_GetChnStatus
	.align	2
	.global	AIP_CheckDataStatusStop
	.type	AIP_CheckDataStatusStop, %function
AIP_CheckDataStatusStop:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L401
	add	r0, r0, #8
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	ldrne	r0, [r3, #20]
	subne	r0, r0, #2
	clzne	r0, r0
	movne	r0, r0, lsr #5
	moveq	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L402:
	.align	2
.L401:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIP_CheckDataStatusStop, .-AIP_CheckDataStatusStop
	.align	2
	.global	AIP_QueryFiFoInfo
	.type	AIP_QueryFiFoInfo, %function
AIP_QueryFiFoInfo:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L410
	add	r2, r0, #8
	mov	r0, r1
	ldr	r3, [r3, r2, asl #2]
	cmp	r3, #0
	beq	.L407
	ldr	r2, [r3, #244]
	cmp	r2, #0
	beq	.L408
	ldr	r2, [r3, #152]
	cmp	r2, #1
	beq	.L409
	ldr	r3, .L410+4
	mov	r2, #36
	mov	r1, #0
	ldr	r3, [r3, #20]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L408:
	ldr	r0, [r3, #136]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	RBUF_QueryInfo
.L409:
	ldr	r0, [r3, #132]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	RBUF_QueryInfo
.L407:
	ldr	ip, .L410+4
	mov	r1, r3
	mov	r2, #36
	ldr	r3, [ip, #20]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L411:
	.align	2
.L410:
	.word	.LANCHOR0
	.word	g_AdspOsalFunc
	UNWIND(.fnend)
	.size	AIP_QueryFiFoInfo, .-AIP_QueryFiFoInfo
	.align	2
	.global	AIP_QueryFiFoBusy
	.type	AIP_QueryFiFoBusy, %function
AIP_QueryFiFoBusy:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L416
	add	r0, r0, #8
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r3, [r0, #244]
	cmp	r3, #0
	beq	.L415
	ldr	r0, [r0, #132]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	RBUF_QueryBusy
.L415:
	ldr	r0, [r0, #136]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	RBUF_QueryBusy
.L417:
	.align	2
.L416:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIP_QueryFiFoBusy, .-AIP_QueryFiFoBusy
	.align	2
	.global	AIP_QueryBusy
	.type	AIP_QueryBusy, %function
AIP_QueryBusy:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L426
	add	r0, r0, #8
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L419
	ldr	r0, [r3, #132]
	cmp	r0, #0
	beq	.L419
	ldr	r3, [r3, #20]
	cmp	r3, #1
	beq	.L425
.L419:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L425:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	RBUF_QueryBusy
.L427:
	.align	2
.L426:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIP_QueryBusy, .-AIP_QueryBusy
	.align	2
	.global	AIP_ReadDataComplete
	.type	AIP_ReadDataComplete, %function
AIP_ReadDataComplete:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L432
	add	r2, r0, #8
	ldr	r4, [r3, r2, asl #2]
	ldr	r5, [r3, r0, asl #2]
	cmp	r4, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, [r4, #244]
	cmp	r3, #0
	beq	.L431
	ldr	r0, [r4, #132]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	RBUF_ReadDataComplete
.L431:
	ldr	r0, [r4, #136]
	bl	RBUF_ReadDataComplete
	ldr	r0, [r4, #136]
	bl	RBUF_QueryBusy
	ldr	r2, [r4, #88]
	ldr	r1, [r4, #228]
	bl	UTIL_LatencyMs
	ldr	r3, [r5, #4]
	mov	r1, r5
	bic	r3, r3, #16646144
	and	r2, r0, #127
	mov	r0, r4
	orr	r3, r3, r2, asl #17
	str	r3, [r5, #4]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	AIPUpdateTrackLatency
.L433:
	.align	2
.L432:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIP_ReadDataComplete, .-AIP_ReadDataComplete
	.align	2
	.global	AIP_UnderFlowCalc
	.type	AIP_UnderFlowCalc, %function
AIP_UnderFlowCalc:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L439
	ldr	r2, [r3, r0, asl #2]
	cmp	r2, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r3, [r2, #64]
	ldr	r1, [r2, #64]
	mov	r3, r3, lsr #16
	uxth	r1, r1
	mov	r3, r3, asl #16
	add	r3, r3, #65536
	orr	r3, r1, r3
	str	r3, [r2, #64]
	ldmfd	sp, {fp, sp, pc}
.L440:
	.align	2
.L439:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIP_UnderFlowCalc, .-AIP_UnderFlowCalc
	.align	2
	.global	AIP_GetRingIn
	.type	AIP_GetRingIn, %function
AIP_GetRingIn:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L444
	add	r0, r0, #8
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	ldrne	r0, [r0, #132]
	ldmfd	sp, {fp, sp, pc}
.L445:
	.align	2
.L444:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIP_GetRingIn, .-AIP_GetRingIn
	.align	2
	.global	AIP_MuteRawData
	.type	AIP_MuteRawData, %function
AIP_MuteRawData:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L454
	add	r0, r0, #8
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r0, [r3, #132]
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	RBUF_MuteRawData
.L455:
	.align	2
.L454:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIP_MuteRawData, .-AIP_MuteRawData
	.align	2
	.global	AIP_GetMuteStatus
	.type	AIP_GetMuteStatus, %function
AIP_GetMuteStatus:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L459
	add	r0, r0, #8
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	ldrne	r0, [r0, #184]
	ldmfd	sp, {fp, sp, pc}
.L460:
	.align	2
.L459:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIP_GetMuteStatus, .-AIP_GetMuteStatus
	.align	2
	.global	AIP_ContinueOutputCnt
	.type	AIP_ContinueOutputCnt, %function
AIP_ContinueOutputCnt:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L466
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	ldrne	r2, [r3, #88]
	addne	r2, r2, #1
	strne	r2, [r3, #88]
	ldmfd	sp, {fp, sp, pc}
.L467:
	.align	2
.L466:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIP_ContinueOutputCnt, .-AIP_ContinueOutputCnt
	.align	2
	.global	AIP_ContinueOutput
	.type	AIP_ContinueOutput, %function
AIP_ContinueOutput:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r5, .L492
	add	r3, r0, #8
	mov	r6, r0
	ldr	r4, [r5, r3, asl #2]
	cmp	r4, #0
	beq	.L468
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L471
	cmp	r1, #1
	beq	.L489
	ldr	r3, [r4, #20]
	cmp	r3, #1
	beq	.L490
.L468:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L471:
	ldr	r3, [r4, #320]
	cmp	r3, #4
	bhi	.L476
	ldr	r3, [r4, #152]
	cmp	r3, #1
	beq	.L468
.L476:
	ldr	r3, [r4, #20]
	bic	r2, r3, #2
	cmp	r2, #1
	bne	.L468
	cmp	r3, #1
	beq	.L491
.L477:
	cmp	r1, #1
	bne	.L468
	ldr	r2, [r4, #324]
	mov	r1, #0
	ldr	r0, [r4, #136]
	bl	RBUF_WriteData
	ldr	r3, [r5, r6, asl #2]
	cmp	r3, #0
	ldrne	r2, [r3, #88]
	addne	r2, r2, #1
	strne	r2, [r3, #88]
	b	.L468
.L490:
	cmp	r1, #0
	moveq	r3, #2
	movne	r3, #3
.L475:
	str	r3, [r4, #20]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L489:
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	ldrne	r2, [r3, #88]
	addne	r2, r2, #1
	strne	r2, [r3, #88]
.L473:
	ldr	r3, [r4, #20]
	cmp	r3, #1
	bne	.L468
	mov	r3, #3
	b	.L475
.L491:
	mov	r3, #3
	mov	r0, r4
	str	r3, [r4, #20]
	str	r1, [fp, #-32]
	bl	AIPReclaimFifo
	mov	r0, r4
	bl	AIPFlushChnCtx
	ldr	r1, [fp, #-32]
	cmp	r1, #0
	streq	r1, [r4, #320]
	bne	.L477
	b	.L468
.L493:
	.align	2
.L492:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIP_ContinueOutput, .-AIP_ContinueOutput
	.align	2
	.global	AIP_RegReclaimFun
	.type	AIP_RegReclaimFun, %function
AIP_RegReclaimFun:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #7
	bhi	.L497
	ldr	r3, .L498
	add	r0, r0, #8
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L497
	str	r1, [r3, #312]
	mov	r0, #0
	str	r2, [r3, #316]
	ldmfd	sp, {fp, sp, pc}
.L497:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L499:
	.align	2
.L498:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AIP_RegReclaimFun, .-AIP_RegReclaimFun
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	g_stAipRm, %object
	.size	g_stAipRm, 64
g_stAipRm:
	.space	64
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
