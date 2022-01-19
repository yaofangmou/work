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
	.file	"vdm_hal.c"
	.text
	.align	2
	.type	VDMHAL_CalcPmvSlotLen.isra.0, %function
VDMHAL_CalcPmvSlotLen.isra.0:
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
	ldr	lr, .L10
	ldr	ip, [r1]
	ldr	r3, [r2]
	ldrb	r4, [lr]	@ zero_extendqisi2
	cmp	ip, #45
	cmple	r3, #36
	movle	lr, #64
	movgt	lr, #32
	cmp	r4, #1
	moveq	lr, #64
	cmp	r0, #16
	moveq	lr, r0
	beq	.L4
	cmp	r0, #17
	beq	.L9
.L4:
	mul	r0, ip, lr
	mul	r0, r3, r0
	add	r0, r0, #143
	bic	r0, r0, #127
	ldmfd	sp, {r4, fp, sp, pc}
.L9:
	mov	r0, #144
	mov	ip, #256
	mov	r3, r0
	str	ip, [r1]
	mov	lr, #64
	str	r0, [r2]
	ldr	ip, [r1]
	b	.L4
.L11:
	.align	2
.L10:
	.word	g_not_direct_8x8_inference_flag
	UNWIND(.fnend)
	.size	VDMHAL_CalcPmvSlotLen.isra.0, .-VDMHAL_CalcPmvSlotLen.isra.0
	.align	2
	.type	VDMHAL_V5R6C1_CfgRpReg.isra.9, %function
VDMHAL_V5R6C1_CfgRpReg.isra.9:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #24)
	sub	sp, sp, #24
	subs	r7, r2, #0
	mov	r4, r0
	mov	r5, r3
	mov	r0, #0
	str	r0, [fp, #-32]
	bgt	.L46
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L47
.L15:
	ldr	r4, .L49
	ldr	r3, [r1]
	ldrb	r2, [r4]	@ zero_extendqisi2
	bic	r3, r3, #15
	str	r3, [fp, #-32]
	cmp	r2, #1
	bne	.L48
	movw	r1, #1228
	ldr	r2, .L49+4
	mul	r1, r1, r7
	ldr	r1, [r2, r1]
	str	r3, [r1, #16]
.L18:
	movw	r3, #1228
	movw	r1, #53763
	mul	r3, r3, r7
	movt	r1, 8192
	ldr	r3, [r2, r3]
	str	r1, [r3, #12]
.L20:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r7
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #60]
.L22:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r7
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #64]
.L24:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r7
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #68]
.L26:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r7
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #72]
.L28:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r7
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #76]
.L30:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r7
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #80]
.L32:
	movw	r3, #1228
	movw	r1, #3075
	mul	r7, r3, r7
	mov	r0, #0
	movt	r1, 48
	ldr	r3, [r2, r7]
	str	r1, [r3, #84]
.L35:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L48:
	mov	r2, #16
	mov	r1, #2
	mov	r0, r5
	bl	VDH_Record_RegData
	ldrb	r2, [r4]	@ zero_extendqisi2
	movw	r3, #53763
	cmp	r2, #1
	movt	r3, 8192
	str	r3, [fp, #-32]
	ldreq	r2, .L49+4
	beq	.L18
	mov	r2, #12
	mov	r1, #2
	mov	r0, r5
	movw	r6, #3075
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	movt	r6, 48
	str	r6, [fp, #-32]
	cmp	r3, #1
	ldreq	r2, .L49+4
	beq	.L20
	mov	r3, r6
	mov	r2, #60
	mov	r1, #2
	mov	r0, r5
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L49+4
	beq	.L22
	mov	r3, r6
	mov	r2, #64
	mov	r1, #2
	mov	r0, r5
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L49+4
	beq	.L24
	mov	r3, r6
	mov	r2, #68
	mov	r1, #2
	mov	r0, r5
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L49+4
	beq	.L26
	mov	r3, r6
	mov	r2, #72
	mov	r1, #2
	mov	r0, r5
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L49+4
	beq	.L28
	mov	r3, r6
	mov	r2, #76
	mov	r1, #2
	mov	r0, r5
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L49+4
	beq	.L30
	mov	r3, r6
	mov	r2, #80
	mov	r1, #2
	mov	r0, r5
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L49+4
	beq	.L32
	mov	r0, r5
	mov	r3, r6
	mov	r2, #84
	mov	r1, #2
	bl	VDH_Record_RegData
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L47:
	mov	r0, #0
	str	r1, [fp, #-40]
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L16
	str	r3, [r4]
	ldr	r1, [fp, #-40]
	b	.L15
.L46:
	str	r0, [sp]
	mov	r3, r7
	ldr	r2, .L49+8
	ldr	r1, .L49+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L35
.L16:
	ldr	r1, .L49+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L35
.L50:
	.align	2
.L49:
	.word	g_HalDisable
	.word	g_HwMem
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_CfgRpReg.isra.9, .-VDMHAL_V5R6C1_CfgRpReg.isra.9
	.align	2
	.global	VDMHAL_V5R6C1_GetHalMemSize
	.type	VDMHAL_V5R6C1_GetHalMemSize, %function
VDMHAL_V5R6C1_GetHalMemSize:
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
	mov	r0, #614400
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_GetHalMemSize, .-VDMHAL_V5R6C1_GetHalMemSize
	.align	2
	.global	VDMHAL_V5R6C1_OpenHAL
	.type	VDMHAL_V5R6C1_OpenHAL, %function
VDMHAL_V5R6C1_OpenHAL:
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
	subs	r2, r0, #0
	beq	.L62
	ldmia	r2, {r0, r3}
	ldr	r6, [r2, #8]
	cmp	r0, #0
	beq	.L63
	cmp	r3, #614400
	blt	.L64
	cmp	r6, #0
	bgt	.L65
	movw	r1, #1228
	add	lr, r0, #1020
	mul	r1, r1, r6
	add	lr, lr, #3
	ldr	r4, .L67
	bic	lr, lr, #1020
	bic	lr, lr, #3
	add	r5, r3, r0
	add	r2, r1, #36
	add	r7, r4, r1
	add	r2, r4, r2
	add	r1, r1, #876
	add	ip, r4, r1
	mov	r1, lr
	rsb	r5, lr, r5
	str	lr, [r7, #16]
	str	r5, [r7, #20]
	mov	r5, #1024
	str	r5, [r7, #24]
.L58:
	str	r1, [r2, #4]!
	cmp	r2, ip
	add	r1, r1, #1280
	bne	.L58
	add	ip, lr, #274432
	add	lr, lr, #266240
	add	r1, lr, #41728
	movw	r2, #1228
	add	r1, r1, #255
	add	lr, lr, #3072
	bic	r1, r1, #32512
	mov	r7, #210
	mla	r4, r2, r6, r4
	bic	r1, r1, #255
	add	r6, r1, #84992
	add	r2, r1, #183296
	add	r6, r6, #896
	add	r5, r1, #81920
	cmp	r6, r2
	rsbcs	r2, r0, r6
	rsbcc	r2, r0, r2
	add	r5, r5, #768
	cmp	r3, r2
	add	r0, r1, #143360
	str	lr, [r4, #1088]
	add	lr, r1, #146432
	str	ip, [r4, #1108]
	add	ip, r1, #179200
	str	r1, [r4, #1156]
	str	r1, [r4, #1092]
	str	r1, [r4, #1096]
	str	r1, [r4, #1100]
	str	r0, [r4, #1176]
	add	r0, r1, #8960
	str	ip, [r4, #1184]
	add	ip, r1, #45056
	str	r0, [r4, #1116]
	mov	r0, #0
	str	r6, [r4, #1136]
	add	r6, r1, #6912
	str	r7, [r4, #1064]
	add	r1, r1, #34304
	str	r5, [r4, #1128]
	str	r5, [r4, #1132]
	str	ip, [r4, #1144]
	str	ip, [r4, #1148]
	str	ip, [r4, #1152]
	str	ip, [r4, #1160]
	str	ip, [r4, #1192]
	str	lr, [r4, #1180]
	str	lr, [r4, #1204]
	str	lr, [r4, #1188]
	str	r6, [r4, #1104]
	str	r6, [r4, #1112]
	str	r1, [r4, #1120]
	str	r1, [r4, #1124]
	str	r0, [r4, #1168]
	str	r0, [r4, #1140]
	bcc	.L59
	mov	r0, r4
	bl	H264HAL_V5R6C1_InitHal
	mov	r5, r0
	mov	r0, r4
	bl	HEVCHAL_V5R6C1_InitHal
	cmp	r0, #0
	beq	.L66
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L66:
	adds	r0, r5, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L65:
	ldr	r1, .L67+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L59:
	ldr	r1, .L67+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L63:
	ldr	r3, .L67+12
	ldr	r2, .L67+16
	ldr	r1, .L67+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L64:
	ldr	r3, .L67+24
	mov	r0, #0
	ldr	r2, .L67+16
	ldr	r1, .L67+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L62:
	ldr	r3, .L67+28
	ldr	r2, .L67+16
	ldr	r1, .L67+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L68:
	.align	2
.L67:
	.word	g_HwMem
	.word	.LC6
	.word	.LC7
	.word	.LC4
	.word	.LANCHOR0+24
	.word	.LC3
	.word	.LC5
	.word	.LC2
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_OpenHAL, .-VDMHAL_V5R6C1_OpenHAL
	.align	2
	.global	VDMHAL_V5R6C1_CloseHAL
	.type	VDMHAL_V5R6C1_CloseHAL, %function
VDMHAL_V5R6C1_CloseHAL:
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
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_CloseHAL, .-VDMHAL_V5R6C1_CloseHAL
	.align	2
	.global	VDMHAL_V5R6C1_CalcFsSize
	.type	VDMHAL_V5R6C1_CalcFsSize, %function
VDMHAL_V5R6C1_CalcFsSize:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 24
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
	sub	ip, r1, #32
	mov	r10, r1
	movw	r1, #8160
	cmp	ip, r1
	mov	r7, r0
	mov	r8, r2
	str	r3, [fp, #-56]
	bhi	.L71
	sub	r3, r2, #32
	mov	r4, r2
	cmp	r3, r1
	bhi	.L71
	add	r6, r2, #15
	sub	r2, fp, #44
	add	r5, r10, #15
	sub	r1, fp, #52
	mov	r6, r6, asr #4
	ldr	r0, [fp, #4]
	str	r6, [r2, #-4]!
	mov	r5, r5, asr #4
	str	r5, [fp, #-52]
	bl	VDMHAL_CalcPmvSlotLen.isra.0
	ldr	r2, [fp, #4]
	cmp	r2, #16
	mov	r3, r0
	beq	.L91
	ldr	r2, [fp, #4]
	ldr	r9, .L96
	sub	r2, r2, #17
	cmp	r2, #1
	bls	.L92
	mov	r5, r5, asl #4
	add	r4, r8, #31
	add	r5, r5, #255
	ldr	ip, [r9, r7, asl #2]
	bic	r5, r5, #255
	bic	r4, r4, #31
	mov	r2, #0
	str	r2, [fp, #-64]
	str	r2, [fp, #-68]
.L75:
	ldr	r2, [ip, #1208]
	cmp	r2, #1
	movne	r10, #0
	strne	r10, [fp, #-60]
	movne	r8, r10
	beq	.L93
.L77:
	ldr	r2, [fp, #-56]
	cmp	r2, #1
	beq	.L94
	ldr	r1, [fp, #-64]
	add	r6, r8, r8, lsl #1
	ldr	r2, [fp, #-68]
	mul	r4, r4, r5
	mul	r2, r2, r1
	add	r1, r4, r4, lsl #1
	add	r2, r2, r2, lsl #1
	mov	r1, r1, lsr #1
	add	r2, r1, r2, lsr #1
	add	r6, r2, r6, lsr #1
.L79:
	add	r2, ip, #471040
	ldr	r1, [r2, #1560]
	cmp	r1, #0
	beq	.L95
.L80:
	add	r0, ip, #475136
	ldr	r1, [fp, #4]
	str	r6, [r0, #1032]
	cmp	r1, #17
	ldr	r0, [fp, #-60]
	add	r1, r3, r3, lsr #31
	str	r10, [r2, #3912]
	mov	r1, r1, asr #1
	str	r1, [r2, #3948]
	str	r0, [r2, #3908]
	beq	.L81
	ldr	r1, [r2, #1568]
	mov	r5, r5, asl #4
	cmp	r1, #32
	movlt	r0, r1
	movge	r0, #32
	str	r0, [r2, #3952]
	ldr	r0, [ip, #632]
	str	r5, [r2, #3900]
	mov	r5, r5, lsr #1
	cmp	r0, #2
	str	r5, [r2, #3904]
	addeq	r1, r1, #1
	streq	r1, [r2, #3952]
	ldr	r1, [fp, #4]
	sub	r1, r1, #16
	cmp	r1, #2
	add	r1, r4, r8
	str	r1, [r2, #3932]
	bls	.L83
.L84:
	ldr	r2, [r9, r7, asl #2]
	mov	r0, #4096
	add	r6, r6, #1056
	add	r1, r2, #475136
	add	ip, r3, r6
	str	r3, [r1, #1036]
	str	r0, [r1, #1044]
	ldrsb	r2, [r2, #44]
	cmp	r2, #1
	ldr	r2, [fp, #8]
	addeq	ip, ip, r0
	cmp	r2, #0
	beq	.L90
	str	r6, [r2, #4]
	mov	r1, #4096
	ldr	r2, [r9, r7, asl #2]
	mov	r0, #0
	ldr	lr, [fp, #8]
	add	r2, r2, #471040
	ldr	r2, [r2, #1568]
	str	r3, [lr, #12]
	str	r2, [lr, #8]
	ldr	r3, [r9, r7, asl #2]
	add	r3, r3, #471040
	ldr	r3, [r3, #3952]
	str	ip, [lr]
	str	r1, [lr, #20]
	str	r3, [lr, #16]
	ldr	r3, [r9, r7, asl #2]
	add	r3, r3, #475136
	str	r6, [r3, #1040]
.L73:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L81:
	mov	r5, r5, asl #4
	mov	r1, #1
	str	r5, [r2, #3900]
	str	r1, [r2, #3952]
	mov	r5, r5, lsr r1
	add	r1, r4, r8
	str	r5, [r2, #3904]
	str	r1, [r2, #3932]
.L83:
	ldr	r1, [ip, #1572]
	cmp	r1, #8
	ble	.L84
	ldr	r1, [fp, #-64]
	add	r8, r8, r8, lsl #1
	str	r3, [fp, #-56]
	add	r4, r4, r4, lsl #1
	ldr	r3, [fp, #-68]
	mov	r8, r8, lsr #1
	add	r4, r8, r4, lsr #1
	mov	r0, #31
	str	r4, [r2, #3924]
	mul	ip, r1, r3
	mov	r1, r3, asl #5
	str	r1, [r2, #3916]
	ldr	r1, .L96+4
	str	ip, [r2, #3928]
	bl	dprint_vfmw
	ldr	r3, [fp, #-56]
	b	.L84
.L95:
	ldr	lr, .L96+8
	movw	r0, #16184
	str	r3, [fp, #-56]
	mov	r2, #1248
	movt	r0, 7
	add	r0, ip, r0
	ldr	r3, [lr, #48]
	blx	r3
	ldr	ip, [r9, r7, asl #2]
	ldr	r3, [fp, #-56]
	add	r2, ip, #471040
	b	.L80
.L94:
	mov	r2, r6, asl #5
	add	r6, r2, r6, lsl #4
	mul	r4, r4, r5
	mul	r6, r5, r6
	b	.L79
.L93:
	add	r2, r10, #2032
	add	r10, r10, #4080
	add	r2, r2, #15
	add	r10, r10, #14
	cmp	r2, #0
	movge	r10, r2
	adds	r2, r8, #63
	addmi	r8, r8, #126
	movpl	r8, r2
	mov	r10, r10, asr #11
	mov	r8, r8, asr #6
	mov	r2, r10, asl #4
	str	r2, [fp, #-60]
	mov	r8, r8, asl #5
	mul	r8, r2, r8
	mov	r10, r8
	b	.L77
.L91:
	ldr	r9, .L96
	add	r5, r10, #255
	bic	r5, r5, #255
	ldr	ip, [r9, r7, asl #2]
	ldr	r2, [ip, #1572]
	cmp	r2, #8
	ble	.L88
	add	r2, r8, #31
	mov	r1, r5, lsr #2
	bic	r2, r2, #31
	str	r1, [fp, #-68]
	str	r2, [fp, #-64]
	b	.L75
.L88:
	mov	r2, #0
	str	r2, [fp, #-64]
	str	r2, [fp, #-68]
	b	.L75
.L92:
	ldr	ip, [r9, r7, asl #2]
	add	r5, r10, #255
	add	r4, r8, #63
	bic	r5, r5, #255
	bic	r4, r4, #63
	ldr	r2, [ip, #1572]
	cmp	r2, #8
	ble	.L88
	mov	r2, r5, lsr #2
	str	r4, [fp, #-64]
	str	r2, [fp, #-68]
	b	.L75
.L71:
	ldr	r3, .L96+12
	mov	r0, #0
	ldr	r2, .L96+16
	ldr	r1, .L96+20
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L90:
	ldr	r0, [fp, #8]
	b	.L73
.L97:
	.align	2
.L96:
	.word	s_pstVfmwChan
	.word	.LC9
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC8
	.word	.LANCHOR0+48
	.word	.LC3
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_CalcFsSize, .-VDMHAL_V5R6C1_CalcFsSize
	.align	2
	.global	VDMHAL_V5R6C1_GetRpuSize
	.type	VDMHAL_V5R6C1_GetRpuSize, %function
VDMHAL_V5R6C1_GetRpuSize:
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
	mov	r0, #4096
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_GetRpuSize, .-VDMHAL_V5R6C1_GetRpuSize
	.align	2
	.global	VDMHAL_V5R6C1_CalcFsNum
	.type	VDMHAL_V5R6C1_CalcFsNum, %function
VDMHAL_V5R6C1_CalcFsNum:
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
	cmp	r3, #0
	beq	.L104
	cmp	r1, #17
	ldr	r1, .L106
	beq	.L105
	ldr	lr, [r1, r0, asl #2]
	add	ip, lr, #471040
	ldr	r2, [ip, #1568]
	cmp	r2, #32
	movlt	r4, r2
	movge	r4, #32
	str	r4, [ip, #3952]
	ldr	lr, [lr, #632]
	cmp	lr, #2
	addeq	lr, r2, #1
	streq	lr, [ip, #3952]
.L103:
	str	r2, [r3, #8]
	mov	ip, #0
	ldr	r2, [r1, r0, asl #2]
	add	r2, r2, #471040
	ldr	r2, [r2, #3952]
	str	r2, [r3, #16]
.L101:
	mov	r0, ip
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L105:
	ldr	r2, [r1, r0, asl #2]
	mov	ip, #1
	add	r2, r2, #471040
	str	ip, [r2, #3952]
	ldr	r2, [r2, #1568]
	b	.L103
.L104:
	ldr	r2, .L106+4
	mov	r0, #1
	ldr	r1, .L106+8
	bl	dprint_vfmw
	mvn	ip, #0
	b	.L101
.L107:
	.align	2
.L106:
	.word	s_pstVfmwChan
	.word	.LANCHOR0+76
	.word	.LC10
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_CalcFsNum, .-VDMHAL_V5R6C1_CalcFsNum
	.align	2
	.global	VDMHAL_V5R6C1_DynamicAllocFrame
	.type	VDMHAL_V5R6C1_DynamicAllocFrame, %function
VDMHAL_V5R6C1_DynamicAllocFrame:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #40)
	sub	sp, sp, #40
	ldr	r6, .L132
	mov	r7, r2
	mov	r8, r1
	movw	r1, #13880
	mov	r4, r0
	ldr	r2, [r6, r0, asl #2]
	movt	r1, 7
	mov	r5, r3
	add	r1, r2, r1
	bl	DelAllFrameMemRecord
	cmp	r0, #0
	bne	.L130
.L109:
	ldr	r1, [r6, r4, asl #2]
	movw	r2, #13880
	movt	r2, 7
	mov	r3, #0
	add	r2, r1, r2
	mov	r1, #255
.L110:
	str	r1, [r2, r3]
	add	r3, r3, #72
	cmp	r3, #2304
	bne	.L110
	ldr	r3, [r6, r4, asl #2]
	ldr	r0, .L132
	add	r2, r3, #475136
	ldr	r1, [r2, #1672]
	cmp	r1, #0
	bne	.L129
	cmp	r8, #1920
	cmple	r7, #1088
	ble	.L131
.L129:
	ldr	r2, [r5, #8]
.L112:
	ldr	r1, [r3, #1512]
	add	r3, r3, #471040
	mov	r0, r4
	add	r2, r2, r1
	str	r2, [r3, #1572]
	bl	VCTRL_GetVidStd
	ldr	r3, [r6, r4, asl #2]
	ldr	r1, .L132
	ldr	r2, [r3, #632]
	subs	r0, r0, #17
	movne	r0, #1
	cmp	r2, #2
	movne	r0, #0
	cmp	r0, #0
	addne	r3, r3, #471040
	mov	r0, #1
	ldrne	r3, [r3, #1572]
	strne	r3, [r5, #16]
	ldrne	r3, [r1, r4, asl #2]
	add	r1, r3, #475136
	add	r2, r3, #442368
	mov	r3, #0
	str	r3, [r1, #1072]
	mov	r3, r7
	str	r0, [r2, #2208]
	mov	r2, r8
	str	r0, [r1, #1612]
	mov	r0, #31
	ldr	r1, [r5, #8]
	ldr	ip, [r5, #16]
	stmia	sp, {r1, ip}
	ldr	r1, .L132+4
	bl	dprint_vfmw
	ldr	r3, .L132+8
	ldr	r9, [r3]
	cmp	r9, #0
	beq	.L117
	ldr	r2, [r5, #4]
	mov	r3, #28
	ldr	r1, [r5, #16]
	ldr	r0, [r5, #12]
	ldr	lr, [r5, #8]
	ldr	ip, [r5, #20]
	str	r2, [fp, #-60]
	sub	r2, fp, #64
	str	r1, [fp, #-56]
	mov	r1, #121
	str	r0, [fp, #-52]
	mov	r0, r4
	str	r8, [fp, #-44]
	str	r7, [fp, #-40]
	str	lr, [fp, #-64]
	str	ip, [fp, #-48]
	blx	r9
.L117:
	ldr	r3, .L132+12
	movw	r0, #17464
	ldr	ip, [r6, r4, asl #2]
	mov	r1, #0
	mov	r2, #528
	movt	r0, 7
	ldr	r3, [r3, #48]
	add	r0, ip, r0
	blx	r3
	ldr	r3, [r6, r4, asl #2]
	mov	r2, #0
	mov	r0, r4
	add	r3, r3, #475136
	str	r2, [r3, #1608]
	bl	FSP_ClearContextAll
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L131:
	ldr	r1, [r3, #36]
	cmp	r1, #24
	beq	.L129
	ldr	r2, [r2, #1668]
	cmp	r2, #0
	ldr	r2, [r5, #8]
	addeq	r2, r2, #4
	streq	r2, [r5, #8]
	ldreq	r3, [r0, r4, asl #2]
	b	.L112
.L130:
	ldr	r1, .L132+16
	mov	r0, #0
	bl	dprint_vfmw
	b	.L109
.L133:
	.align	2
.L132:
	.word	s_pstVfmwChan
	.word	.LC12
	.word	g_event_report
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC11
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_DynamicAllocFrame, .-VDMHAL_V5R6C1_DynamicAllocFrame
	.align	2
	.global	VDMHAL_V5R6C1_DynamicAllocFrame_Only
	.type	VDMHAL_V5R6C1_DynamicAllocFrame_Only, %function
VDMHAL_V5R6C1_DynamicAllocFrame_Only:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
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
	ldr	ip, .L139
	ldr	lr, [r3, #8]
	mov	r4, r3
	mov	r8, r0
	mov	r3, r2
	ldr	ip, [ip, r0, asl #2]
	mov	r7, r1
	mov	r6, r2
	mov	r0, #31
	add	ip, ip, #471040
	mov	r2, r1
	ldr	r1, .L139+4
	str	lr, [ip, #1572]
	ldr	lr, [r4, #16]
	ldr	ip, [r4, #8]
	stmia	sp, {ip, lr}
	bl	dprint_vfmw
	ldr	r3, .L139+8
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L134
	ldr	r2, [r4, #8]
	mov	r0, r8
	ldr	r1, [r4, #4]
	mov	r3, #28
	ldr	r8, [r4, #16]
	ldr	lr, [r4, #12]
	ldr	ip, [r4, #20]
	str	r2, [fp, #-64]
	sub	r2, fp, #64
	str	r1, [fp, #-60]
	mov	r1, #122
	str	r7, [fp, #-44]
	str	r6, [fp, #-40]
	str	r8, [fp, #-56]
	str	lr, [fp, #-52]
	str	ip, [fp, #-48]
	blx	r5
.L134:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L140:
	.align	2
.L139:
	.word	s_pstVfmwChan
	.word	.LC13
	.word	g_event_report
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_DynamicAllocFrame_Only, .-VDMHAL_V5R6C1_DynamicAllocFrame_Only
	.align	2
	.global	VDMHAL_V5R6C1_ArrangeMem_Normal
	.type	VDMHAL_V5R6C1_ArrangeMem_Normal, %function
VDMHAL_V5R6C1_ArrangeMem_Normal:
	UNWIND(.fnstart)
	@ args = 12, pretend = 0, frame = 40
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
	cmp	r1, #21
	mov	r4, r0
	mov	r5, r1
	mov	r0, #0
	mov	r6, r2
	mov	r7, r3
	str	r0, [fp, #-68]
	str	r0, [fp, #-64]
	str	r0, [fp, #-60]
	str	r0, [fp, #-56]
	str	r0, [fp, #-52]
	str	r0, [fp, #-48]
	bhi	.L181
	bl	PDT_Is3716MV450
	cmp	r0, #0
	beq	.L144
	mul	r2, r7, r6
	movw	r3, #36863
	movt	r3, 126
	cmp	r2, r3
	bgt	.L182
.L144:
	ldr	r10, .L191
	ldr	r1, [r10, r4, asl #2]
	add	r2, r1, #471040
	ldr	r3, [r1, #100]
	ldr	r2, [r2, #1564]
	cmp	r3, #2
	str	r2, [fp, #-76]
	beq	.L183
	bics	r3, r5, #16
	moveq	r3, #1
	movne	r3, #0
	cmp	r5, #18
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L184
.L147:
	sub	r3, r5, #17
	clz	r3, r3
	mov	r3, r3, lsr #5
	mov	ip, r3
.L148:
	ldr	lr, [r1, #1220]
	mov	r2, r3
	str	r3, [r1, #1208]
	mov	r0, #1
	ldr	r3, [r1, #1212]
	str	lr, [sp, #4]
	ldr	lr, .L191+4
	ldr	r1, [r1, #1216]
	str	r1, [sp]
	ldr	r1, .L191+8
	str	ip, [lr, r4, asl #4]
	bl	dprint_vfmw
.L146:
	sub	r8, fp, #68
	ldr	r2, [fp, #4]
	mov	r1, r5
	mov	r0, r4
	mov	r3, r8
	bl	VDMHAL_V5R6C1_CalcFsNum
	ldr	r3, [fp, #8]
	str	r8, [sp, #4]
	mov	r2, r7
	str	r5, [sp]
	mov	r1, r6
	mov	r9, r0
	mov	r0, r4
	bl	VDMHAL_V5R6C1_CalcFsSize
	orrs	r3, r0, r9
	bne	.L185
	ldr	r3, [r10, r4, asl #2]
	ldr	r1, [fp, #-76]
	ldr	r5, [fp, #-68]
	str	r3, [fp, #-72]
	add	r3, r3, #471040
	cmp	r1, r5
	ldr	r2, .L191
	ldr	r9, [r3, #1568]
	ldr	r1, [r3, #1584]
	beq	.L186
.L151:
	str	r1, [sp, #4]
	mov	r3, r5
	ldr	r2, .L191+12
	mov	r0, #31
	ldr	r1, .L191+16
	str	r9, [sp]
	bl	dprint_vfmw
	ldr	r3, [r10, r4, asl #2]
	mov	r1, r6
	mov	r0, r4
	add	r3, r3, #471040
	ldr	r2, [r3, #1560]
	str	r5, [r3, #1564]
	mov	r3, r8
	cmp	r2, #0
	mov	r2, r7
	beq	.L187
	bl	VDMHAL_V5R6C1_DynamicAllocFrame_Only
.L154:
	ldr	ip, [r10, r4, asl #2]
	mov	r3, r9
	mov	r2, r5
	ldr	r1, .L191+20
	add	ip, ip, #471040
	mov	r0, #31
	ldr	ip, [ip, #1584]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, .L191+24
	ldr	r4, [r10, r4, asl #2]
	ldr	r3, [r3]
	add	r4, r4, #475136
	blx	r3
	mov	r3, #2
	str	r0, [r4, #1048]
.L143:
	mov	r0, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L186:
	cmp	r1, #1
	beq	.L151
	ldr	r0, [r3, #1560]
	cmp	r0, #1
	beq	.L151
	ldr	r1, [fp, #12]
	cmp	r1, #0
	beq	.L188
	ldr	r0, [fp, #-72]
	cmp	r9, #0
	movw	ip, #16184
	add	r1, r0, #475136
	movt	ip, 7
	ldrne	r2, [fp, #-72]
	ldr	r9, [r1, #1032]
	add	r1, r0, ip
	str	r1, [fp, #-80]
	beq	.L189
.L156:
	add	r2, r2, #471040
	ldr	r2, [r2, #1572]
	cmp	r2, #30
	bgt	.L190
.L157:
	str	r2, [r3, #3944]
	mov	r0, #8
	str	r3, [fp, #-76]
	ldr	r3, .L191+24
	ldr	r2, [r3, #12]
	blx	r2
	ldr	ip, [r10, r4, asl #2]
	ldr	r3, [fp, #-76]
	add	r8, ip, #475136
	ldr	r2, [r8, #1072]
	cmp	r2, #0
	beq	.L162
	ldr	r2, [r3, #3956]
	movw	r5, #53217
	ldr	r0, [r3, #3952]
	movt	r5, 1
	add	lr, r2, #1
	add	r5, r2, r5
	movw	r1, #13912
	mov	r7, #1
	str	r0, [fp, #-76]
	mov	r0, r2, asl #4
	sub	r2, r0, r2, asl #2
	ldr	r0, [fp, #-72]
	add	r2, r2, #475136
	movt	r1, 7
	add	r2, r2, #264
	add	r5, r0, r5, lsl #2
	add	r0, r0, r2
	add	r1, ip, r1
	mov	r6, lr
	mov	ip, #0
	str	r4, [fp, #-84]
.L161:
	ldr	r2, [r1]
	add	lr, r6, ip
	ldr	r4, [r1, #-20]
	add	ip, ip, #1
	add	r2, r2, #1020
	strb	r7, [r0, #8]
	add	r2, r2, #3
	add	r0, r0, #12
	bic	r2, r2, #1020
	str	r4, [r0, #-8]
	bic	r2, r2, #3
	str	r2, [r0, #-12]
	add	r2, r2, r9
	str	r2, [r5, #4]!
	str	lr, [r3, #3956]
	ldr	r2, [r1, #-28]
	cmp	r2, #255
	beq	.L159
	ldr	lr, [r3, #3964]
	add	r4, lr, #1
	mov	r2, lr, asl #4
	sub	r2, r2, lr, asl #2
	ldr	lr, [r1, #16]
	add	r2, r3, r2
	add	r2, r2, #4736
	str	lr, [r2, #8]
	ldr	lr, [r1, #-16]
	str	lr, [r2, #12]
	str	r4, [r3, #3964]
.L159:
	ldr	r2, [r3, #3960]
	ldr	lr, [fp, #-76]
	cmp	r2, lr
	bcs	.L160
	ldr	r4, [r1, #-24]
	ldr	lr, [fp, #-72]
	cmp	r4, #255
	add	lr, lr, r2, lsl #3
	add	r2, r2, #1
	ldrne	r4, [r1, #32]
	add	lr, lr, #475136
	strneb	r7, [lr, #12]
	strne	r4, [lr, #8]
	strne	r2, [r3, #3960]
.L160:
	ldr	r2, [r8, #1072]
	add	r1, r1, #72
	cmp	ip, r2
	bcc	.L161
	ldr	r4, [fp, #-84]
.L162:
	ldr	r3, .L191+24
	mov	r2, #1232
	ldr	r1, [fp, #-80]
	ldr	r0, [fp, #12]
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, [r10, r4, asl #2]
	ldr	r2, .L191+24
	mov	r1, #1
	add	r3, r3, #475136
	mov	r0, #8
	str	r1, [r3, #1076]
	ldr	r2, [r2, #16]
	blx	r2
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L187:
	bl	VDMHAL_V5R6C1_DynamicAllocFrame
	b	.L154
.L184:
	cmp	r7, #2160
	cmplt	r6, #3840
	movge	ip, #1
	movge	r3, ip
	bge	.L148
	b	.L147
.L183:
	mov	r3, #0
	str	r3, [r1, #1208]
	str	r3, [r1, #1212]
	mvn	r3, #0
	str	r3, [r1, #1216]
	str	r3, [r1, #1220]
	b	.L146
.L189:
	ldr	r1, .L191+28
	mov	r0, #31
	str	r3, [fp, #-84]
	str	r2, [fp, #-76]
	bl	dprint_vfmw
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-84]
	ldr	r2, [r2, r4, asl #2]
	b	.L156
.L190:
	ldr	r1, .L191+32
	mov	r0, #31
	str	r3, [fp, #-76]
	bl	dprint_vfmw
	ldr	r1, [r10, r4, asl #2]
	mov	r0, #30
	mov	r2, r0
	ldr	r3, [fp, #-76]
	add	r1, r1, #471040
	str	r0, [r1, #1572]
	b	.L157
.L181:
	ldr	r3, .L191+36
	ldr	r2, .L191+40
	ldr	r1, .L191+44
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L143
.L185:
	ldr	r1, .L191+48
	mov	r0, #31
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L143
.L182:
	bl	PDT_Is3716MV450
	ldr	r1, .L191+52
	mov	r2, r0
	mov	r0, #31
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L143
.L188:
	ldr	r3, .L191+56
	mov	r0, r1
	ldr	r2, .L191+60
	ldr	r1, .L191+44
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L143
.L192:
	.align	2
.L191:
	.word	s_pstVfmwChan
	.word	g_VfmwCompressPara
	.word	.LC16
	.word	.LANCHOR0+132
	.word	.LC18
	.word	.LC19
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC21
	.word	.LC22
	.word	.LC14
	.word	.LANCHOR0+100
	.word	.LC3
	.word	.LC17
	.word	.LC15
	.word	.LC20
	.word	.LANCHOR0+164
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_ArrangeMem_Normal, .-VDMHAL_V5R6C1_ArrangeMem_Normal
	.global	__aeabi_idiv
	.align	2
	.global	VDMHAL_V5R6C1_ArrangeMem_Specific
	.type	VDMHAL_V5R6C1_ArrangeMem_Specific, %function
VDMHAL_V5R6C1_ArrangeMem_Specific:
	UNWIND(.fnstart)
	@ args = 28, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #60)
	sub	sp, sp, #60
	subs	r5, r2, #0
	mov	r10, r0
	mov	r9, r1
	ldr	r7, [fp, #12]
	ldr	r6, [fp, #28]
	beq	.L268
	ldr	r2, [fp, #4]
	sub	r1, r2, #32
	movw	r2, #8160
	cmp	r1, r2
	bhi	.L196
	ldr	r1, [fp, #8]
	sub	r1, r1, #32
	cmp	r1, r2
	bhi	.L196
	cmp	r6, #0
	beq	.L269
	ldr	ip, .L278
	cmp	r7, #20
	mov	r2, #1232
	mov	r1, #0
	mov	r0, r6
	movge	r7, #20
	ldr	r4, [ip, #48]
	str	r3, [fp, #-72]
	blx	r4
	ldr	r3, [fp, #8]
	sub	r2, fp, #44
	mov	r0, r9
	add	r1, r3, #15
	ldr	r3, [fp, #4]
	add	r4, r3, #15
	mov	r3, r1, asr #4
	sub	r1, fp, #64
	str	r3, [r2, #-16]!
	str	r3, [fp, #-92]
	mov	r4, r4, asr #4
	str	r4, [fp, #-64]
	bl	VDMHAL_CalcPmvSlotLen.isra.0
	ldr	r3, [fp, #-72]
	mul	r1, r7, r0
	mov	r8, r0
	cmp	r1, r3
	ldrge	r3, .L278+4
	bge	.L267
	add	r2, r5, #1020
	rsb	r3, r1, r3
	add	r2, r2, #3
	add	r1, r0, r0, lsr #31
	bic	r2, r2, #1020
	cmp	r9, #16
	bic	r2, r2, #3
	mov	r1, r1, asr #1
	rsb	r0, r5, r2
	str	r7, [r6, #56]
	rsb	r3, r0, r3
	str	r0, [fp, #-84]
	str	r3, [fp, #-88]
	str	r1, [r6, #52]
	beq	.L270
	sub	r3, r9, #17
	cmp	r3, #1
	bls	.L271
	mov	r7, r4, asl #4
	ldr	r3, [fp, #8]
	add	r7, r7, #255
	cmp	r10, #0
	bic	r7, r7, #255
	add	r3, r3, #31
	bic	r3, r3, #31
	str	r3, [fp, #-72]
	mov	r3, r7, asl #4
	str	r3, [r6, #4]
	mov	r3, r7, asl #3
	str	r3, [r6, #8]
	blt	.L238
	ldr	r4, .L278+8
	mov	r3, #0
	str	r3, [fp, #-76]
	str	r3, [fp, #-80]
.L231:
	ldr	r3, [r4, r10, asl #2]
	ldr	r3, [r3, #1208]
	cmp	r3, #1
	movne	r1, #0
	movne	r0, r1
	movne	r3, r1
	beq	.L272
.L204:
	ldr	ip, [fp, #20]
	str	r0, [r6, #12]
	cmp	ip, #1
	str	r1, [r6, #16]
	beq	.L273
	ldr	r0, [fp, #-80]
	add	r4, r3, r3, lsl #1
	ldr	r1, [fp, #-76]
	mul	r1, r1, r0
	ldr	r0, [fp, #-72]
	mul	r0, r7, r0
	add	r1, r1, r1, lsl #1
	add	r1, r1, r1, lsr #31
	add	r0, r0, r0, lsl #1
	mov	r1, r1, asr #1
	add	r1, r1, r0, asr #1
	add	r4, r1, r4, lsr #1
.L206:
	ldr	r1, [fp, #24]
	cmp	r1, #0
	blt	.L207
	mov	r0, r1
	str	r3, [fp, #-92]
	str	r2, [fp, #-96]
	bl	VCTRL_GetChanWidth
	mov	r10, r0
	ldr	r0, [fp, #24]
	bl	VCTRL_GetChanHeight
	ldr	r2, [fp, #-96]
	cmn	r0, #1
	cmnne	r10, #1
	moveq	r3, #1
	movne	r3, #0
	str	r3, [fp, #-100]
	ldr	r3, [fp, #-92]
	beq	.L274
	ldr	r1, [fp, #20]
	add	r10, r10, #15
	bic	r10, r10, #15
	add	r0, r0, #15
	cmp	r1, #1
	add	r1, r10, #255
	bic	r0, r0, #15
	bic	r1, r1, #255
	beq	.L275
	ldr	lr, .L278+8
	ldr	ip, [fp, #24]
	ldr	lr, [lr, ip, asl #2]
	ldr	lr, [lr, #1208]
	cmp	lr, #1
	beq	.L211
	adds	lr, r0, #63
	ldr	ip, [fp, #-100]
	addmi	lr, r0, #126
	mov	lr, lr, asr #6
.L212:
	ldr	r0, [fp, #-76]
	ldr	r10, [fp, #-80]
	mul	r1, lr, r1
	mul	r0, r0, r10
	mov	lr, r1, asl #7
	sub	r1, lr, r1, asl #5
	add	r0, r0, r0, lsl #1
	add	r0, r0, r0, lsr #31
	add	r1, r1, r0, asr #1
	add	r1, r1, ip
.L210:
	cmp	r4, r1
	ldrgt	r3, .L278+12
	bgt	.L267
	ldr	r10, [fp, #24]
.L207:
	ldr	r1, [fp, #-72]
	mul	r7, r7, r1
	sub	r1, r9, #16
	cmp	r1, #1
	add	r1, r7, r3
	str	r1, [r6, #36]
	bls	.L276
	ldr	r3, [fp, #16]
	cmp	r3, #0
	beq	.L216
	cmp	r9, #3
	cmpne	r9, #0
	strne	r2, [fp, #-72]
	beq	.L214
.L266:
	cmp	r3, #32
	mov	r1, r4
	ldr	r0, [fp, #-88]
	movlt	r7, r3
	movge	r7, #32
	bl	__aeabi_idiv
	ldr	r2, [fp, #-72]
	cmp	r7, r0
	movlt	r1, r7
	movge	r1, r0
	cmp	r1, #0
	str	r1, [r6, #48]
	beq	.L215
	ldr	lr, [r6, #60]
	mov	ip, r6
	mov	r0, r2
	mov	r3, #0
.L220:
	add	r3, r3, #1
	str	r0, [ip, #464]
	cmp	r1, r3
	add	r0, r0, r4
	add	ip, ip, #12
	bne	.L220
	ldr	r3, [fp, #20]
	cmp	r3, #1
	add	r3, r1, lr
	str	r3, [r6, #60]
	beq	.L277
	ldr	r3, [fp, #-84]
	mla	r4, r1, r4, r3
	add	r3, r4, r5
.L234:
	add	r0, r6, #76
	mov	r2, #0
.L224:
	add	r2, r2, #1
	str	r3, [r0, #4]!
	cmp	r2, r1
	add	r3, r3, #32
	bne	.L224
.L223:
	ldr	ip, [r6, #56]
	add	r4, r4, r1, lsl #5
	add	r5, r4, r5
	cmp	ip, #0
	beq	.L229
	ldr	lr, [r6, #64]
	mov	r0, r6
	mov	r2, r5
	mov	r3, #0
.L228:
	add	r3, r3, #1
	str	r2, [r0, #208]
	cmp	ip, r3
	add	r2, r2, r8
	add	r0, r0, #8
	bne	.L228
	add	r3, ip, lr
	str	r3, [r6, #64]
.L229:
	mla	r8, ip, r8, r4
	cmp	r10, #0
	str	r8, [r6]
	blt	.L227
	ldr	r3, .L278+8
	ldr	r3, [r3, r10, asl #2]
	cmp	r3, #0
	beq	.L227
	cmp	r1, #0
	add	r5, r8, r5
	beq	.L227
	mov	r2, r6
	mov	r3, #0
.L230:
	add	r3, r3, #1
	str	r5, [r2, #848]
	cmp	r3, r1
	add	r5, r5, #4096
	add	r2, r2, #12
	bne	.L230
.L227:
	mov	r0, #0
	add	r8, r8, r1, lsl #12
	str	r8, [r6]
.L265:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L276:
	ldr	r0, [fp, #16]
	mov	r1, r3, lsr #1
	ldr	ip, [fp, #-80]
	add	r3, r3, r3, lsl #1
	cmp	r0, #0
	ldr	r0, [fp, #-76]
	add	r7, r7, r7, lsl #1
	mov	r3, r3, lsr #1
	mla	r1, r0, ip, r1
	add	r7, r3, r7, asr #1
	mov	r3, r0, asl #4
	str	r7, [r6, #28]
	str	r3, [r6, #20]
	str	r1, [r6, #32]
	bne	.L214
.L216:
	mov	r3, #0
	str	r3, [r6, #48]
.L215:
	ldr	r3, .L278+16
.L267:
	ldr	r2, .L278+20
	mov	r0, #0
	ldr	r1, .L278+24
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L214:
	str	r2, [fp, #-72]
	ldr	r3, [fp, #16]
	b	.L266
.L270:
	ldr	r3, [fp, #4]
	cmp	r10, #0
	add	r7, r3, #255
	bic	r7, r7, #255
	blt	.L201
	ldr	r4, .L278+8
	movw	r0, #18072
	movt	r0, 7
	str	r2, [fp, #-72]
	ldr	r3, [r4, r10, asl #2]
	add	r0, r3, r0
	bl	IsMain10Profile
	ldr	r2, [fp, #-72]
	cmp	r0, #0
	beq	.L235
	ldr	r1, [fp, #8]
	cmp	r7, #0
	add	r3, r7, #3
	add	r1, r1, #31
	movge	r3, r7
	bic	r1, r1, #31
	str	r1, [fp, #-80]
	ldr	r1, [fp, #8]
	mov	r3, r3, asr #2
	str	r3, [fp, #-76]
	str	r1, [fp, #-72]
	b	.L202
.L273:
	ldr	r1, [fp, #-92]
	mov	r4, r1, asl #4
	mul	r4, r7, r4
	add	r4, r4, r4, lsl #1
	b	.L206
.L277:
	ldr	r3, .L278+28
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L222
	str	r2, [fp, #-56]
	mov	r3, #12
	str	r1, [fp, #-48]
	sub	r2, fp, #56
	mov	r1, #128
	str	r4, [fp, #-52]
	mov	r0, r10
	blx	r7
	ldr	r1, [r6, #48]
.L222:
	ldr	r3, [fp, #-84]
	cmp	r1, #0
	mla	r4, r1, r4, r3
	add	r3, r4, r5
	bne	.L234
	b	.L223
.L271:
	ldr	r3, [fp, #4]
	cmp	r10, #0
	add	r7, r3, #255
	ldr	r3, [fp, #8]
	bic	r7, r7, #255
	add	r3, r3, #63
	bic	r3, r3, #63
	str	r3, [fp, #-72]
	blt	.L236
	ldr	r4, .L278+8
	ldr	r3, [r4, r10, asl #2]
	ldr	r3, [r3, #1572]
	cmp	r3, #8
	ble	.L237
	ldr	r1, [fp, #-72]
	cmp	r7, #0
	add	r3, r7, #3
	movge	r3, r7
	mov	r3, r3, asr #2
	str	r1, [fp, #-80]
	str	r3, [fp, #-76]
.L202:
	mov	r3, r7, asl #4
	str	r3, [r6, #4]
	mov	r3, r7, asl #3
	str	r3, [r6, #8]
	b	.L231
.L236:
	ldr	r3, [fp, #-72]
	str	r3, [fp, #8]
.L201:
	ldr	r3, [fp, #8]
	mov	r1, #0
	mov	ip, r7, asl #4
	mov	r0, r1
	str	ip, [r6, #4]
	mov	ip, r7, asl #3
	str	r3, [fp, #-72]
	mov	r3, r1
	str	r1, [fp, #-76]
	str	r1, [fp, #-80]
	str	ip, [r6, #8]
	b	.L204
.L272:
	sub	r1, r9, #17
	ldr	r3, [fp, #4]
	clz	r1, r1
	mov	r1, r1, lsr #5
	cmp	r3, #1920
	orrgt	r1, r1, #1
	cmp	r1, #0
	moveq	r0, r1
	moveq	r3, r1
	beq	.L204
	ldr	r1, [fp, #4]
	add	r3, r3, #2032
	add	r3, r3, #15
	ldr	r0, [fp, #8]
	add	r1, r1, #4080
	cmp	r3, #0
	add	r1, r1, #14
	movlt	r3, r1
	ldr	r1, [fp, #8]
	mov	r3, r3, asr #11
	adds	r1, r1, #63
	addmi	r1, r0, #126
	mov	r0, r3, asl #4
	mov	r1, r1, asr #6
	mov	r3, r1, asl #5
	mul	r3, r0, r3
	mov	r1, r3
	b	.L204
.L275:
	mul	r1, r0, r1
	add	r1, r1, r1, lsl #1
	b	.L210
.L238:
	mov	r1, #0
	str	r1, [fp, #-76]
	mov	r0, r1
	str	r1, [fp, #-80]
	mov	r3, r1
	b	.L204
.L211:
	add	lr, r10, #2032
	adds	ip, r0, #63
	add	lr, lr, #15
	addmi	ip, r0, #126
	add	r10, r10, #4080
	cmp	lr, #0
	add	r10, r10, #14
	movge	r10, lr
	mov	lr, ip, asr #6
	mov	r10, r10, asr #11
	mov	ip, lr, asl #7
	sub	ip, ip, lr, asl #5
	mov	r0, r10, asl #4
	mul	ip, r0, ip
	mov	ip, ip, lsr #1
	b	.L212
.L235:
	ldr	r1, [fp, #8]
	str	r0, [fp, #-80]
	str	r0, [fp, #-76]
	str	r1, [fp, #-72]
	b	.L202
.L237:
	mov	r3, #0
	str	r3, [fp, #-80]
	str	r3, [fp, #-76]
	b	.L202
.L196:
	ldr	r3, .L278+32
	b	.L267
.L268:
	mov	r0, r5
	ldr	r3, .L278+36
	ldr	r2, .L278+20
	ldr	r1, .L278+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L265
.L274:
	ldr	r1, .L278+40
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L265
.L269:
	mov	r0, r6
	ldr	r3, .L278+44
	ldr	r2, .L278+20
	ldr	r1, .L278+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L265
.L279:
	.align	2
.L278:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC25
	.word	s_pstVfmwChan
	.word	.LC27
	.word	.LC28
	.word	.LANCHOR0+200
	.word	.LC3
	.word	g_event_report
	.word	.LC8
	.word	.LC23
	.word	.LC26
	.word	.LC24
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_ArrangeMem_Specific, .-VDMHAL_V5R6C1_ArrangeMem_Specific
	.align	2
	.global	VDMHAL_V5R6C1_ArrangeMem
	.type	VDMHAL_V5R6C1_ArrangeMem, %function
VDMHAL_V5R6C1_ArrangeMem:
	UNWIND(.fnstart)
	@ args = 20, pretend = 0, frame = 8
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
	ldr	r4, [fp, #16]
	mov	r6, r3
	mov	r9, r0
	cmn	r4, #2
	mov	r5, r2
	ldmib	fp, {r7, r10}
	ldr	r8, [fp, #12]
	ldr	r3, [fp, #20]
	beq	.L286
	cmp	r4, #0
	blt	.L287
	mov	r0, r4
	str	r3, [fp, #-52]
	str	r1, [fp, #-48]
	bl	VCTRL_GetVidStd
	ldr	r1, [fp, #-48]
	ldr	r3, [fp, #-52]
	cmp	r0, #22
	beq	.L290
	ldr	r2, .L292
	ldr	r2, [r2, r4, asl #2]
	ldr	r2, [r2, #1504]
	cmp	r2, #1
	beq	.L291
.L285:
	str	r3, [sp, #24]
	mov	r2, r9
	mov	r3, r1
	str	r4, [sp, #20]
	mov	r1, r0
	str	r8, [sp, #16]
	str	r10, [sp, #12]
	mov	r0, r4
	stmia	sp, {r5, r6, r7}
	bl	VDMHAL_V5R6C1_ArrangeMem_Specific
.L288:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L287:
	mov	r0, #22
	b	.L285
.L286:
	mov	r0, #16
	b	.L285
.L291:
	str	r3, [fp, #12]
	mov	r1, r0
	mov	r3, r6
	str	r8, [fp, #8]
	mov	r2, r5
	str	r7, [fp, #4]
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VDMHAL_V5R6C1_ArrangeMem_Normal
.L290:
	mvn	r2, #0
	ldr	r1, .L292+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L288
.L293:
	.align	2
.L292:
	.word	s_pstVfmwChan
	.word	.LC29
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_ArrangeMem, .-VDMHAL_V5R6C1_ArrangeMem
	.align	2
	.global	VDMHAL_V5R6C1_ResetVdm
	.type	VDMHAL_V5R6C1_ResetVdm, %function
VDMHAL_V5R6C1_ResetVdm:
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
	mov	r0, #0
	ble	.L295
	mov	r3, r5
	str	r0, [sp]
	ldr	r2, .L312
	ldr	r1, .L312+4
	bl	dprint_vfmw
.L294:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L295:
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r2, r0, #0
	beq	.L310
	movw	r10, #1228
	ldr	r6, .L312+8
	mul	r10, r10, r5
	ldr	r3, [r6, r10]
	add	r2, r3, #61440
	ldr	r7, [r3, #36]
	ldr	r3, [r2, #2052]
	tst	r3, #3
	str	r3, [fp, #-48]
	beq	.L294
	ldr	r4, .L312+12
	mov	r9, r6
	mov	r8, #0
	ldr	r3, [r4, #112]
	blx	r3
	ldr	r2, [r9, r10]!
	add	r2, r2, #61440
	ldr	r3, [r2, #2060]
	str	r3, [fp, #-48]
	uxtb	r3, r3
	orr	r3, r3, #2
	strb	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [r2, #2060]
	b	.L300
.L311:
	add	r8, r8, #1
	cmp	r8, #1000
	beq	.L301
.L300:
	ldr	r3, [r4, #116]
	mov	r0, #30
	blx	r3
	ldr	r3, [r9]
	add	r3, r3, #61440
	ldr	r3, [r3, #2064]
	tst	r3, #2
	str	r3, [fp, #-48]
	beq	.L311
	cmp	r8, #1000
	bge	.L301
	mov	r3, r5
	ldr	r2, .L312
	ldr	r1, .L312+16
	mov	r0, #0
	bl	dprint_vfmw
.L303:
	movw	r3, #1228
	ldr	r1, [r4, #112]
	mul	r5, r3, r5
	ldr	r2, [r6, r5]
	add	r2, r2, #61440
	ldr	r3, [r2, #2060]
	str	r3, [fp, #-48]
	bfc	r3, #1, #1
	strb	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [r2, #2060]
	blx	r1
	ldr	r3, [r6, r5]
	str	r7, [r3, #36]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L301:
	mov	r3, r5
	ldr	r2, .L312
	ldr	r1, .L312+20
	mov	r0, #0
	bl	dprint_vfmw
	b	.L303
.L310:
	ldr	r1, .L312+24
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L313:
	.align	2
.L312:
	.word	.LANCHOR0+236
	.word	.LC0
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC32
	.word	.LC31
	.word	.LC30
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_ResetVdm, .-VDMHAL_V5R6C1_ResetVdm
	.align	2
	.global	VDMHAL_V5R6C1_SetSmmuPageTableAddr
	.type	VDMHAL_V5R6C1_SetSmmuPageTableAddr, %function
VDMHAL_V5R6C1_SetSmmuPageTableAddr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #24)
	sub	sp, sp, #24
	ldr	r3, .L320
	mov	r4, r0
	ldr	r3, [r3, #196]
	cmp	r3, #0
	beq	.L314
	sub	r2, fp, #24
	sub	r1, fp, #28
	sub	r0, fp, #32
	blx	r3
	cmp	r4, #0
	bne	.L316
	ldr	r3, .L320+4
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-28]
	ldr	r3, [r3]
	ldr	r2, [fp, #-24]
	add	r3, r3, #61440
	str	r0, [r3, #524]
	str	r1, [r3, #772]
	str	r2, [r3, #776]
.L314:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L316:
	mov	r5, #1
	mov	r3, r4
	str	r5, [sp]
	mov	r0, #32
	ldr	r2, .L320+8
	ldr	r1, .L320+12
	bl	dprint_vfmw
	mov	r3, r4
	str	r5, [sp]
	mov	r0, #32
	ldr	r2, .L320+8
	ldr	r1, .L320+12
	bl	dprint_vfmw
	str	r5, [sp]
	mov	r3, r4
	ldr	r2, .L320+8
	ldr	r1, .L320+12
	mov	r0, #32
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L321:
	.align	2
.L320:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_HwMem
	.word	.LANCHOR0+260
	.word	.LC33
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_SetSmmuPageTableAddr, .-VDMHAL_V5R6C1_SetSmmuPageTableAddr
	.align	2
	.global	VDMHAL_V5R6C1_EnableSmmu
	.type	VDMHAL_V5R6C1_EnableSmmu, %function
VDMHAL_V5R6C1_EnableSmmu:
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
	ldr	r3, .L323
	mov	r2, #8
	movt	r2, 3
	ldr	r3, [r3]
	add	r3, r3, #61440
	str	r2, [r3]
	ldmfd	sp, {fp, sp, pc}
.L324:
	.align	2
.L323:
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_EnableSmmu, .-VDMHAL_V5R6C1_EnableSmmu
	.align	2
	.global	VDMHAL_V5R6C1_GlbResetX
	.type	VDMHAL_V5R6C1_GlbResetX, %function
VDMHAL_V5R6C1_GlbResetX:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #16)
	sub	sp, sp, #16
	mov	r4, r0
	mov	r0, #0
	mov	r3, #0
	movt	r0, 63683
	str	r3, [fp, #-32]
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L344
	cmp	r4, #0
	ble	.L345
	mov	r2, #1
	mov	r3, r4
	str	r2, [sp]
	mov	r0, #32
	ldr	r2, .L349
	ldr	r1, .L349+4
	bl	dprint_vfmw
	ldrb	r5, [fp, #-32]	@ zero_extendqisi2
	and	r5, r5, #3
	cmp	r5, #1
	beq	.L346
.L325:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L345:
	movw	r5, #1228
	ldr	r7, .L349+8
	mul	r5, r5, r4
	ldr	r3, [r7, r5]
	add	r3, r3, #61440
	ldr	r3, [r3, #2052]
	and	r2, r3, #3
	cmp	r2, #1
	str	r3, [fp, #-32]
	bne	.L325
	ldr	r6, .L349+12
	ldr	r3, [r6, #112]
	blx	r3
	ldr	r3, [r7, r5]
	add	r3, r3, #61440
	ldr	r1, [r3, #2060]
	uxtb	r2, r1
	str	r1, [fp, #-32]
	orr	r2, r2, #1
	strb	r2, [fp, #-32]
	ldr	r2, [fp, #-32]
	str	r2, [r3, #2060]
	b	.L340
.L346:
	ldr	r6, .L349+12
	ldr	r3, [r6, #112]
	blx	r3
	mov	r3, r4
	ldr	r2, .L349
	mov	r0, #32
	ldr	r1, .L349+4
	str	r5, [sp]
	bl	dprint_vfmw
	ldrb	ip, [fp, #-32]	@ zero_extendqisi2
	str	r5, [sp]
	mov	r3, r4
	ldr	r2, .L349
	mov	r0, #32
	ldr	r1, .L349+16
	orr	ip, ip, #1
	strb	ip, [fp, #-32]
	bl	dprint_vfmw
.L340:
	ldr	r3, .L349+8
	movw	r7, #1228
	mov	r5, #0
	mla	r7, r7, r4, r3
	b	.L335
.L332:
	str	ip, [sp]
	bl	dprint_vfmw
	ldrb	r3, [fp, #-32]	@ zero_extendqisi2
	tst	r3, #1
	bne	.L334
.L347:
	add	r5, r5, #1
	cmp	r5, #1000
	beq	.L336
.L335:
	ldr	r3, [r6, #116]
	mov	r0, #30
	blx	r3
	cmp	r4, #0
	mov	ip, #1
	mov	r3, r4
	ldr	r2, .L349
	mov	r0, #32
	ldr	r1, .L349+4
	bgt	.L332
	ldr	r3, [r7]
	add	r3, r3, #61440
	ldr	r3, [r3, #2064]
	str	r3, [fp, #-32]
	ldrb	r3, [fp, #-32]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L347
.L334:
	cmp	r5, #1000
	bge	.L336
	mov	r3, r4
	ldr	r2, .L349
	ldr	r1, .L349+20
	mov	r0, #0
	bl	dprint_vfmw
.L338:
	cmp	r4, #0
	ble	.L348
	mov	r5, #1
	mov	r3, r4
	str	r5, [sp]
	mov	r0, #32
	ldr	r2, .L349
	ldr	r1, .L349+4
	bl	dprint_vfmw
	str	r5, [sp]
	mov	r3, r4
	ldr	r2, .L349
	ldr	r1, .L349+16
	mov	r0, #32
	bl	dprint_vfmw
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L336:
	mov	r3, r4
	ldr	r2, .L349
	ldr	r1, .L349+24
	mov	r0, #0
	bl	dprint_vfmw
	b	.L338
.L348:
	movw	r3, #1228
	ldr	r2, .L349+8
	mul	r4, r3, r4
	ldr	r2, [r2, r4]
	add	r2, r2, #61440
	ldr	r3, [r2, #2060]
	str	r3, [fp, #-32]
	bfc	r3, #0, #1
	strb	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #2060]
	b	.L325
.L344:
	mov	r3, #0
	ldr	r2, .L349
	movt	r3, 63683
	ldr	r1, .L349+28
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L350:
	.align	2
.L349:
	.word	.LANCHOR0+296
	.word	.LC35
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC33
	.word	.LC37
	.word	.LC36
	.word	.LC34
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_GlbResetX, .-VDMHAL_V5R6C1_GlbResetX
	.align	2
	.global	VDMHAL_V5R6C1_GlbReset
	.type	VDMHAL_V5R6C1_GlbReset, %function
VDMHAL_V5R6C1_GlbReset:
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
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L353
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDMHAL_V5R6C1_GlbResetX
.L353:
	mov	r3, #0
	ldr	r2, .L354
	movt	r3, 63683
	ldr	r1, .L354+4
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L355:
	.align	2
.L354:
	.word	.LANCHOR0+320
	.word	.LC34
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_GlbReset, .-VDMHAL_V5R6C1_GlbReset
	.align	2
	.global	VDMHAL_V5R6C1_ClearIntState
	.type	VDMHAL_V5R6C1_ClearIntState, %function
VDMHAL_V5R6C1_ClearIntState:
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
	ldr	r7, .L372
	mov	r5, r0, asl #3
	mov	r8, r0, asl #6
	rsb	r3, r5, r8
	ldr	r2, .L372+4
	add	r3, r7, r3
	ldr	r3, [r3, #8]
	ldr	r3, [r2, r3, asl #2]
	cmp	r3, #0
	ldrne	r4, [r3, #1240]
	moveq	r4, r3
	cmp	r0, #0
	bgt	.L369
	movw	r6, #1228
	ldr	r9, .L372+8
	mul	r6, r6, r0
	ldr	r3, [r9, r6]
	cmp	r3, #0
	beq	.L370
.L360:
	cmp	r4, #1
	beq	.L371
.L367:
	mvn	r2, #0
	str	r2, [r3, #32]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L369:
	mov	r2, #0
	mov	r3, r0
	str	r2, [sp]
	mov	r0, r2
	ldr	r1, .L372+12
	ldr	r2, .L372+16
	bl	dprint_vfmw
.L356:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L371:
	rsb	r5, r5, r8
	add	r7, r7, r5
	ldr	r2, [r7, #44]
	cmp	r2, #1
	beq	.L367
	cmp	r2, #2
	ldr	r1, [r3, #28]
	mvneq	r2, #11
	streq	r2, [r3, #32]
	beq	.L356
	cmp	r2, #3
	mvneq	r2, #14
	streq	r2, [r3, #32]
	b	.L356
.L370:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	strne	r3, [r9, r6]
	bne	.L360
.L361:
	ldr	r1, .L372+20
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L373:
	.align	2
.L372:
	.word	g_VdmDrvParam
	.word	s_pstVfmwChan
	.word	g_HwMem
	.word	.LC0
	.word	.LANCHOR0+344
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_ClearIntState, .-VDMHAL_V5R6C1_ClearIntState
	.align	2
	.global	VDMHAL_V5R6C1_ClearMMUIntState
	.type	VDMHAL_V5R6C1_ClearMMUIntState, %function
VDMHAL_V5R6C1_ClearMMUIntState:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	subs	r3, r0, #0
	bgt	.L379
	movw	r2, #1228
	ldr	r5, .L381
	mul	r4, r2, r3
	ldr	r2, [r5, r4]
	cmp	r2, #0
	beq	.L380
.L377:
	add	r2, r2, #61440
	mov	r3, #7
	str	r3, [r2, #44]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L379:
	mov	r0, #0
	ldr	r2, .L381+4
	str	r0, [sp]
	ldr	r1, .L381+8
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L380:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r2, r0, #0
	strne	r2, [r5, r4]
	bne	.L377
.L378:
	ldr	r1, .L381+12
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L382:
	.align	2
.L381:
	.word	g_HwMem
	.word	.LANCHOR0+372
	.word	.LC0
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_ClearMMUIntState, .-VDMHAL_V5R6C1_ClearMMUIntState
	.align	2
	.global	VDMHAL_V5R6C1_MaskInt
	.type	VDMHAL_V5R6C1_MaskInt, %function
VDMHAL_V5R6C1_MaskInt:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	subs	r3, r0, #0
	bgt	.L388
	movw	r2, #1228
	ldr	r5, .L390
	mul	r4, r2, r3
	ldr	r3, [r5, r4]
	cmp	r3, #0
	beq	.L389
.L386:
	mvn	r2, #0
	str	r2, [r3, #36]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L388:
	mov	r0, #0
	ldr	r2, .L390+4
	str	r0, [sp]
	ldr	r1, .L390+8
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L389:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	strne	r3, [r5, r4]
	bne	.L386
.L387:
	ldr	r1, .L390+12
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L391:
	.align	2
.L390:
	.word	g_HwMem
	.word	.LANCHOR0+404
	.word	.LC0
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_MaskInt, .-VDMHAL_V5R6C1_MaskInt
	.align	2
	.global	VDMHAL_V5R6C1_GetIntMaskCfg
	.type	VDMHAL_V5R6C1_GetIntMaskCfg, %function
VDMHAL_V5R6C1_GetIntMaskCfg:
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
	cmp	r0, #1
	mvneq	r0, #5
	mvnne	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_GetIntMaskCfg, .-VDMHAL_V5R6C1_GetIntMaskCfg
	.align	2
	.global	VDMHAL_V5R6C1_EnableInt
	.type	VDMHAL_V5R6C1_EnableInt, %function
VDMHAL_V5R6C1_EnableInt:
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r2, .L406
	mov	r3, r0, asl #6
	ldr	r1, .L406+4
	sub	r3, r3, r0, asl #3
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	ldr	r3, [r1, r3, asl #2]
	cmp	r3, #0
	ldrne	r4, [r3, #1240]
	moveq	r4, r3
	cmp	r0, #0
	bgt	.L404
	movw	r5, #1228
	ldr	r6, .L406+8
	mul	r5, r5, r0
	ldr	r3, [r6, r5]
	cmp	r3, #0
	beq	.L405
.L399:
	cmp	r4, #1
	mvneq	r2, #5
	mvnne	r2, #1
	str	r2, [r3, #36]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L404:
	mov	r2, #0
	mov	r3, r0
	str	r2, [sp]
	mov	r0, r2
	ldr	r1, .L406+12
	ldr	r2, .L406+16
	bl	dprint_vfmw
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L405:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	strne	r3, [r6, r5]
	bne	.L399
.L400:
	ldr	r1, .L406+20
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	dprint_vfmw
.L407:
	.align	2
.L406:
	.word	g_VdmDrvParam
	.word	s_pstVfmwChan
	.word	g_HwMem
	.word	.LC0
	.word	.LANCHOR0+428
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_EnableInt, .-VDMHAL_V5R6C1_EnableInt
	.align	2
	.global	VDMHAL_V5R6C1_CheckReg
	.type	VDMHAL_V5R6C1_CheckReg, %function
VDMHAL_V5R6C1_CheckReg:
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
	mov	r7, r0
	bgt	.L425
	movw	r4, #1228
	ldr	r6, .L427
	mul	r4, r4, r5
	ldr	r3, [r6, r4]
	cmp	r3, #0
	beq	.L426
.L411:
	sub	r2, r7, #1
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L417
.L419:
	.word	.L422
	.word	.L420
	.word	.L421
	.word	.L423
	.word	.L413
	.word	.L415
	.word	.L416
.L423:
	mov	r3, #40
.L418:
	movw	r1, #1228
	mul	r5, r1, r5
	ldr	r2, [r6, r5]
	ldr	r0, [r2, r3]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L422:
	mov	r3, #28
	b	.L418
.L421:
	mov	r3, #36
	b	.L418
.L420:
	mov	r3, #32
	b	.L418
.L416:
	movw	r3, #62272
	b	.L418
.L413:
	movw	r3, #61480
	b	.L418
.L415:
	movw	r3, #62304
	b	.L418
.L417:
	mov	r3, r7
	ldr	r2, .L427+4
	ldr	r1, .L427+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L426:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r8, r0, #0
	beq	.L412
	str	r8, [r6, r4]
	b	.L411
.L425:
	mov	r3, r5
	ldr	r2, .L427+4
	ldr	r1, .L427+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L412:
	ldr	r2, .L427+4
	ldr	r1, .L427+16
	bl	dprint_vfmw
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L428:
	.align	2
.L427:
	.word	g_HwMem
	.word	.LANCHOR0+452
	.word	.LC40
	.word	.LC38
	.word	.LC39
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_CheckReg, .-VDMHAL_V5R6C1_CheckReg
	.align	2
	.global	VDMHAL_V5R6C1_ReadMMUMask
	.type	VDMHAL_V5R6C1_ReadMMUMask, %function
VDMHAL_V5R6C1_ReadMMUMask:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	subs	r3, r0, #0
	ble	.L432
	mov	r1, #1
	ldr	r2, .L433
	str	r1, [sp]
	mov	r0, #32
	ldr	r1, .L433+4
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L432:
	movw	r0, #1228
	ldr	r2, .L433+8
	mul	r3, r0, r3
	ldr	r3, [r2, r3]
	add	r3, r3, #61440
	ldr	r0, [r3, #32]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L434:
	.align	2
.L433:
	.word	.LANCHOR0+476
	.word	.LC35
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_ReadMMUMask, .-VDMHAL_V5R6C1_ReadMMUMask
	.align	2
	.global	VDMHAL_V5R6C1_WriteMMUMask
	.type	VDMHAL_V5R6C1_WriteMMUMask, %function
VDMHAL_V5R6C1_WriteMMUMask:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	subs	r3, r1, #0
	ble	.L438
	mov	r1, #1
	ldr	r2, .L439
	str	r1, [sp]
	mov	r0, #32
	ldr	r1, .L439+4
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L438:
	movw	r1, #1228
	ldr	r2, .L439+8
	mul	r3, r1, r3
	ldr	r3, [r2, r3]
	add	r3, r3, #61440
	str	r0, [r3, #32]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L440:
	.align	2
.L439:
	.word	.LANCHOR0+504
	.word	.LC33
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_WriteMMUMask, .-VDMHAL_V5R6C1_WriteMMUMask
	.align	2
	.global	VDMHAL_V5R6C1_PrepareDec
	.type	VDMHAL_V5R6C1_PrepareDec, %function
VDMHAL_V5R6C1_PrepareDec:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	subs	r7, r1, #0
	mov	r4, r0
	mov	r5, r2
	mov	r6, r3
	beq	.L461
	cmp	r2, #0
	bgt	.L462
	sub	r1, r0, #6
	mov	r2, #0
	clz	r1, r1
	mov	r0, r2
	mov	r1, r1, lsr #5
	bl	SCD_ConfigReg
	mov	r3, r6
	mov	r2, #0
	mov	r1, #1
	mov	r0, #8
	bl	SCD_ConfigReg
	cmp	r4, #18
	ldrls	pc, [pc, r4, asl #2]
	b	.L443
.L446:
	.word	.L456
	.word	.L447
	.word	.L448
	.word	.L449
	.word	.L443
	.word	.L450
	.word	.L451
	.word	.L443
	.word	.L452
	.word	.L453
	.word	.L454
	.word	.L454
	.word	.L454
	.word	.L455
	.word	.L443
	.word	.L456
	.word	.L457
	.word	.L458
	.word	.L459
.L456:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	H264HAL_V5R6C1_StartDec
.L457:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	HEVCHAL_V5R6C1_StartDec
.L458:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VP9HAL_V5R6C1_StartDec
.L459:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	AVS2HAL_V5R6C1_StartDec
.L447:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VC1HAL_V5R6C1_StartDec
.L448:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MP4HAL_V5R6C1_StartDec
.L449:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MP2HAL_V5R6C1_StartDec
.L450:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	DIVX3HAL_V5R6C1_StartDec
.L451:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	AVSHAL_V5R6C1_StartDec
.L452:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	RV8HAL_V5R6C1_StartDec
.L453:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	RV9HAL_V5R6C1_StartDec
.L454:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VP6HAL_V5R6C1_StartDec
.L455:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VP8HAL_V5R6C1_StartDec
.L461:
	mov	r3, r7
	mov	r0, r7
	ldr	r2, .L463
	ldr	r1, .L463+4
	bl	dprint_vfmw
.L443:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L462:
	mov	r3, r2
	mov	r0, #0
	ldr	r2, .L463
	str	r0, [sp]
	ldr	r1, .L463+8
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L464:
	.align	2
.L463:
	.word	.LANCHOR0+532
	.word	.LC41
	.word	.LC0
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_PrepareDec, .-VDMHAL_V5R6C1_PrepareDec
	.align	2
	.global	VDMHAL_V5R6C1_IsVdmReady
	.type	VDMHAL_V5R6C1_IsVdmReady, %function
VDMHAL_V5R6C1_IsVdmReady:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	movw	r2, #1228
	mul	r2, r2, r0
	ldr	r3, .L472
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L470
	cmp	r0, #0
	ble	.L471
	mov	r3, r0
	mov	r1, #1
	ldr	r2, .L472+4
	mov	r0, #32
	str	r1, [sp]
	ldr	r1, .L472+8
	bl	dprint_vfmw
	mov	r0, #0
.L467:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L471:
	ldr	r0, [r3, #28]
	ubfx	r0, r0, #17, #1
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L470:
	mov	r0, r3
	ldr	r2, .L472+4
	ldr	r3, .L472+12
	ldr	r1, .L472+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L467
.L473:
	.align	2
.L472:
	.word	g_HwMem
	.word	.LANCHOR0+560
	.word	.LC35
	.word	.LC42
	.word	.LC3
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_IsVdmReady, .-VDMHAL_V5R6C1_IsVdmReady
	.align	2
	.global	VDMHAL_V5R6C1_IsVdmRun
	.type	VDMHAL_V5R6C1_IsVdmRun, %function
VDMHAL_V5R6C1_IsVdmRun:
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	movw	r2, #1228
	mul	r2, r2, r0
	ldr	r3, .L481
	ldr	r4, [r3, r2]
	cmp	r4, #0
	beq	.L479
	cmp	r0, #0
	ble	.L480
	mov	r3, r0
	mov	r4, #1
	ldr	r2, .L481+4
	mov	r0, #32
	str	r4, [sp]
	ldr	r1, .L481+8
	bl	dprint_vfmw
	mov	r0, r4
.L476:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L480:
	ldr	r0, [r4, #40]
	subs	r0, r0, #1
	movne	r0, #1
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L479:
	ldr	r1, .L481+12
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	b	.L476
.L482:
	.align	2
.L481:
	.word	g_HwMem
	.word	.LANCHOR0+588
	.word	.LC35
	.word	.LC43
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_IsVdmRun, .-VDMHAL_V5R6C1_IsVdmRun
	.align	2
	.global	VDMHAL_V5R6C1_IsVdhDecOver
	.type	VDMHAL_V5R6C1_IsVdhDecOver, %function
VDMHAL_V5R6C1_IsVdhDecOver:
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
	movw	r2, #1228
	ldr	r3, .L493
	mul	r2, r2, r1
	mov	r4, r0
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L491
	bl	VDMHAL_V5R6C1_CheckReg
	cmp	r4, #2
	beq	.L488
	cmp	r4, #3
	beq	.L488
	cmp	r4, #1
	beq	.L492
	mov	r3, r4
	ldr	r2, .L493+4
	ldr	r1, .L493+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L488:
	and	r0, r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L492:
	ubfx	r0, r0, #17, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L491:
	mov	r0, r3
	ldr	r2, .L493+4
	ldr	r3, .L493+12
	ldr	r1, .L493+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L494:
	.align	2
.L493:
	.word	g_HwMem
	.word	.LANCHOR0+612
	.word	.LC40
	.word	.LC42
	.word	.LC3
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_IsVdhDecOver, .-VDMHAL_V5R6C1_IsVdhDecOver
	.align	2
	.global	VDMHAL_V5R6C1_IsVdhPartDecOver
	.type	VDMHAL_V5R6C1_IsVdhPartDecOver, %function
VDMHAL_V5R6C1_IsVdhPartDecOver:
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
	movw	r2, #1228
	ldr	r3, .L505
	mul	r2, r2, r1
	mov	r4, r0
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L503
	bl	VDMHAL_V5R6C1_CheckReg
	cmp	r4, #1
	beq	.L499
	cmp	r4, #2
	bne	.L504
	ubfx	r0, r0, #2, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L504:
	mov	r3, r4
	ldr	r2, .L505+4
	ldr	r1, .L505+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L499:
	ubfx	r0, r0, #19, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L503:
	mov	r0, r3
	ldr	r2, .L505+4
	ldr	r3, .L505+12
	ldr	r1, .L505+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L506:
	.align	2
.L505:
	.word	g_HwMem
	.word	.LANCHOR0+640
	.word	.LC40
	.word	.LC42
	.word	.LC3
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_IsVdhPartDecOver, .-VDMHAL_V5R6C1_IsVdhPartDecOver
	.align	2
	.global	VDMHAL_V5R6C1_UpdateHardwareInfo
	.type	VDMHAL_V5R6C1_UpdateHardwareInfo, %function
VDMHAL_V5R6C1_UpdateHardwareInfo:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	subs	r5, r0, #0
	bgt	.L508
	ldr	r2, .L542
	ldr	r4, [r2]
	cmp	r4, #1
	addne	r3, r2, #124
	bne	.L512
	b	.L509
.L536:
	cmp	r2, r3
	beq	.L535
.L512:
	ldr	r4, [r2, #4]!
	cmp	r4, #1
	bne	.L536
.L509:
	movw	r6, #1228
	ldr	r7, .L542+4
	mul	r6, r6, r5
	ldr	lr, [r7, r6]
	cmp	lr, #0
	beq	.L537
.L513:
	mov	r2, #180
	ldr	r1, .L542+8
	mul	r2, r2, r5
	mov	r3, r5, asl #6
	sub	r3, r3, r5, asl #3
	ldr	r0, [lr, #12]
	ldr	r6, .L542+12
	add	r3, r3, r1
	ldr	r1, [r3, #4]
	add	r3, r6, r2
	str	r0, [r6, r2]
	ldr	r2, [lr, #28]
	cmp	r1, #1
	str	r2, [r3, #4]
	beq	.L538
	cmp	r4, #1
	beq	.L539
	add	r2, lr, #4096
	cmp	r4, #0
	ldr	ip, [r2]
	ldr	r0, [r2, #12]
	ldr	r1, [lr, #208]
	ldr	r2, [lr, #212]
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	bne	.L518
	ldr	r2, [lr, #176]
	ldr	ip, [lr, #180]
	ldr	r0, [lr, #184]
	str	r2, [r3, #24]
	ldr	r1, [lr, #188]
	ldr	r2, [lr, #192]
	str	ip, [r3, #28]
	str	r0, [r3, #32]
	str	r1, [r3, #36]
	str	r2, [r3, #40]
.L518:
	mov	r0, #180
	add	r1, lr, #33024
	mul	r0, r0, r5
	add	r2, r0, #48
	add	r0, r0, #176
	add	r2, r6, r2
	add	r0, r6, r0
.L519:
	ldr	ip, [r1], #4
	str	ip, [r2, #4]!
	cmp	r2, r0
	bne	.L519
	cmp	r4, #0
	bne	.L540
	mov	r3, #180
	add	lr, lr, #32768
	mla	r5, r3, r5, r6
	ldr	r2, [lr, #384]
	ldr	r3, [lr, #388]
	mov	r0, r4
	str	r2, [r5, #48]
	str	r3, [r5, #44]
.L530:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L540:
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L535:
	mov	r4, #0
	b	.L509
.L538:
	add	r1, lr, #4096
	mov	r0, #0
	ldr	r1, [r1, #12]
	ubfx	ip, r1, #0, #20
	str	r1, [r3, #20]
	ldr	r1, [lr, #176]
	str	ip, [r3, #20]
	str	r1, [r3, #24]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L539:
	movw	r3, #1228
	ubfx	r8, r2, #0, #17
	mla	r3, r3, r5, r7
	ldr	r0, [r3, #40]
	bl	MEM_Phy2Vir
	subs	ip, r0, #0
	beq	.L541
	sub	r3, r8, #1
	movw	r1, #1228
	cmp	r3, #199
	mov	r2, #180
	subls	r3, r8, #-1073741823
	mul	r1, r1, r5
	movls	r3, r3, asl #4
	movhi	r3, #0
	addls	r8, r3, #8
	ldr	r0, [ip, r3]
	movhi	r8, #8
	mla	r3, r2, r5, r6
	ldr	lr, [r7, r1]
	str	r0, [r3, #16]
	ldr	r0, [lr, #208]
	ldr	r1, [ip, r8]
	ldr	r2, [lr, #212]
	str	r0, [r3, #8]
	str	r1, [r3, #20]
	str	r2, [r3, #12]
	b	.L518
.L537:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	lr, r0, #0
	beq	.L514
	str	lr, [r7, r6]
	b	.L513
.L508:
	mov	r0, #0
	mov	r3, r5
	str	r0, [sp]
	ldr	r2, .L542+16
	ldr	r1, .L542+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L530
.L514:
	ldr	r1, .L542+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L530
.L541:
	ldr	r3, .L542+28
	ldr	r2, .L542+16
	ldr	r1, .L542+32
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L530
.L543:
	.align	2
.L542:
	.word	g_DSPState
	.word	g_HwMem
	.word	g_VdmDrvParam+48
	.word	g_BackUp
	.word	.LANCHOR0+672
	.word	.LC0
	.word	.LC1
	.word	.LC44
	.word	.LC3
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_UpdateHardwareInfo, .-VDMHAL_V5R6C1_UpdateHardwareInfo
	.align	2
	.global	VDMHAL_V5R6C1_ReadMsgSlot
	.type	VDMHAL_V5R6C1_ReadMsgSlot, %function
VDMHAL_V5R6C1_ReadMsgSlot:
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
	mov	r3, r1
	moveq	r4, #1
	movne	r4, #0
	beq	.L548
	cmp	r2, #800
	bhi	.L549
	ldr	r3, .L550
	mov	r2, r2, asl #2
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L549:
	mov	r0, r4
	ldr	r1, .L550+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L548:
	mov	r2, r0
	ldr	r1, .L550+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L551:
	.align	2
.L550:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC46
	.word	.LC45
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_ReadMsgSlot, .-VDMHAL_V5R6C1_ReadMsgSlot
	.align	2
	.global	VDMHAL_V5R6C1_WriteMsgSlot
	.type	VDMHAL_V5R6C1_WriteMsgSlot, %function
VDMHAL_V5R6C1_WriteMsgSlot:
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
	moveq	r4, #1
	movne	r4, #0
	beq	.L553
	sub	r3, r2, #1
	cmp	r3, #255
	bhi	.L553
	ldr	r3, .L556
	mov	r2, r2, asl #2
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L553:
	ldr	r1, .L556+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L557:
	.align	2
.L556:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC47
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_WriteMsgSlot, .-VDMHAL_V5R6C1_WriteMsgSlot
	.global	__aeabi_uidiv
	.global	__aeabi_uidivmod
	.align	2
	.global	VDMHAL_V5R6C1_CfgRpMsg
	.type	VDMHAL_V5R6C1_CfgRpMsg, %function
VDMHAL_V5R6C1_CfgRpMsg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #68)
	sub	sp, sp, #68
	mov	r8, r0
	ldr	r0, [r1, #48]
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	str	r3, [fp, #-60]
	beq	.L601
	ldr	r2, [r8, #44]
	sub	r3, r2, #1
	cmp	r3, #199
	bhi	.L602
	ldr	r0, [r8, #28]
	ldr	r3, [r8, #64]
	ldr	r2, [r8, #32]
	mov	r0, r0, asl r3
	ldr	ip, [r8, #4]
	cmp	r0, #1920
	add	r1, r0, #255
	mov	r3, r2, asl r3
	bic	r1, r1, #255
	bgt	.L599
	cmp	ip, #17
	movne	r2, #0
	strneb	r2, [r8]
	strneb	r2, [r8, #1]
	beq	.L599
.L565:
	cmp	ip, #16
	beq	.L566
.L604:
	add	r3, r3, #31
	mov	r0, #8
	bic	r3, r3, #31
	str	r0, [fp, #-80]
	mla	r3, r3, r1, r2
.L589:
	ldr	r0, [r8, #20]
	ldr	ip, [fp, #-60]
	str	r0, [ip]
	ldr	r0, [r8, #20]
	add	r0, r3, r0
	str	r0, [ip, #4]
	ldr	r0, [r8, #8]
	str	r0, [ip, #8]
	ldr	r0, [r8, #8]
	add	r3, r3, r0
	str	r3, [ip, #12]
	ldr	ip, [fp, #-60]
	mov	r0, #0	@ movhi
	ldrb	r3, [r8, #1]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r1, r1, asl #4
	str	r1, [ip, #16]
	str	r2, [ip, #20]
	mov	r1, r0	@ movhi
	ldr	r2, [r8, #28]
	ldr	r3, [r8, #32]
	sub	r2, r2, #1
	sub	r3, r3, #1
	bfi	r0, r2, #0, #9
	bfi	r1, r3, #0, #9
	strh	r0, [fp, #-52]	@ movhi
	strh	r1, [fp, #-50]	@ movhi
	ldr	r3, [fp, #-52]
	str	r3, [ip, #24]
	ldr	r3, [r8, #52]
	ldr	r1, [r8, #56]
	sub	r3, r3, #1
	ldr	r2, [r8, #28]
	cmp	r3, #1
	ldr	r3, [r8, #32]
	str	r2, [fp, #-76]
	addls	r3, r3, r3, lsr #31
	movls	r3, r3, asr #1
	cmp	r1, #0
	str	r3, [fp, #-84]
	movne	r3, #0
	strne	r3, [fp, #-64]
	beq	.L603
.L571:
	cmp	r1, #1
	beq	.L587
.L610:
	ldr	r3, [fp, #-64]
	sub	r3, r3, #1
	uxth	r3, r3
.L588:
	ldr	ip, [r8, #64]
	mov	r0, #0
	ldrb	r1, [fp, #-49]	@ zero_extendqisi2
	ldrb	lr, [r8]	@ zero_extendqisi2
	sub	ip, ip, #4
	ldrb	r2, [fp, #-50]	@ zero_extendqisi2
	bfi	r1, ip, #0, #2
	strh	r3, [fp, #-52]	@ movhi
	ldr	ip, [r8, #52]
	bfi	r2, lr, #0, #1
	ldr	r3, [fp, #-80]
	ldrb	lr, [r8, #1]	@ zero_extendqisi2
	and	ip, ip, #3
	bfi	r1, r3, #2, #4
	mov	r3, r2
	bfi	r3, ip, #4, #2
	bfi	r3, ip, #6, #2
	mov	r2, r1
	strb	r3, [fp, #-50]
	bfi	r2, lr, #6, #1
	strb	r2, [fp, #-49]
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-60]
	str	r3, [r2, #28]
.L598:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L599:
	ldrb	r2, [r8]	@ zero_extendqisi2
	cmp	r2, #1
	mov	r2, #0
	strb	r2, [r8, #1]
	bne	.L565
	add	r2, r0, #2032
	adds	lr, r3, #63
	add	r2, r2, #15
	add	r0, r0, #4080
	add	r0, r0, #14
	addmi	lr, r3, #126
	cmp	r2, #0
	movlt	r2, r0
	mov	r0, lr, asr #6
	mov	r2, r2, asr #11
	cmp	ip, #16
	mov	r0, r0, asl #5
	mov	r2, r2, asl #4
	mul	r2, r2, r0
	bne	.L604
.L566:
	mov	r0, #10
	str	r0, [fp, #-80]
	mla	r3, r1, r3, r2
	b	.L589
.L603:
	ldr	r3, [r8, #64]
	cmp	r3, #6
	moveq	r4, #2
	beq	.L572
	cmp	r3, #5
	moveq	r4, #4
	beq	.L572
	cmp	r3, #4
	moveq	r4, #8
	bne	.L605
.L572:
	ldr	r9, [r8, #44]
	cmp	r9, #0
	movle	r3, #0
	ldrle	r1, [r8, #56]
	strle	r3, [fp, #-64]
	ble	.L571
	ldr	r2, [fp, #-84]
	mov	r6, #0
	ldr	r3, [fp, #-76]
	str	r6, [fp, #-72]
	str	r6, [fp, #-64]
	mul	r3, r3, r2
	str	r8, [fp, #-56]
	sub	r2, r4, #1
	str	r2, [fp, #-88]
	str	r3, [fp, #-92]
	sub	r3, r3, #1
	str	r3, [fp, #-96]
	b	.L575
.L608:
	ldrsh	r0, [r5, #74]
	mov	r1, r4
	sub	r0, r0, #1
	add	r0, r0, r4
	bl	__aeabi_uidiv
	mul	r3, r4, r0
	cmp	r7, r3
	str	r3, [fp, #-72]
	ldrgt	r7, [fp, #-88]
	bgt	.L578
.L577:
	add	r6, r6, #1
	cmp	r6, r9
	bge	.L606
.L586:
	cmp	r6, #199
	bgt	.L607
.L575:
	ldr	r3, [fp, #-56]
	mov	r1, r4
	add	r5, r3, r6, lsl #2
	ldrsh	r10, [r5, #78]
	ldrh	r3, [r5, #76]
	sub	r0, r10, #1
	add	r0, r0, r4
	str	r3, [fp, #-68]
	bl	__aeabi_uidiv
	cmp	r6, #0
	mul	r7, r4, r0
	bgt	.L608
	ldr	r3, [fp, #-72]
	cmp	r7, r3
	movgt	r3, #0
	movle	r3, #1
	cmp	r6, #0
	moveq	r3, #0
	cmp	r3, #0
	bne	.L577
.L580:
	ldrsh	r0, [fp, #-68]
	mov	r1, r4
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-92]
	ldr	r3, [fp, #-96]
	cmp	r2, r7
	movls	r7, r3
	ldr	r3, [fp, #-64]
	add	r3, r3, #1
	str	r3, [fp, #-64]
	mul	r5, r4, r0
	cmp	r5, r7
	movgt	r5, #0
	cmp	r3, #250
	bgt	.L609
	ldr	r8, [fp, #-76]
	mov	r0, r5
	add	r6, r6, #1
	mov	r1, r8
	bl	__aeabi_uidivmod
	mov	r0, r5
	mov	r3, #0	@ movhi
	bfi	r3, r1, #0, #9
	mov	r1, r8
	strh	r3, [fp, #-48]	@ movhi
	bl	__aeabi_uidiv
	mov	r2, #0	@ movhi
	ldr	r3, [fp, #-64]
	ldr	r9, [fp, #-60]
	mov	r1, r8
	add	r3, r3, #5
	mov	r5, r3, asl #3
	add	r5, r5, #4
	bfi	r2, r0, #0, #9
	strh	r2, [fp, #-46]	@ movhi
	ldr	r2, [fp, #-48]
	mov	r0, r7
	str	r2, [r9, r3, asl #3]
	bl	__aeabi_uidivmod
	mov	r0, r7
	mov	r3, #0	@ movhi
	bfi	r3, r1, #0, #9
	mov	r1, r8
	strh	r3, [fp, #-48]	@ movhi
	bl	__aeabi_uidiv
	mov	r3, #0	@ movhi
	bfi	r3, r0, #0, #9
	strh	r3, [fp, #-46]	@ movhi
	ldr	r3, [fp, #-48]
	str	r3, [r9, r5]
	ldr	r3, [fp, #-56]
	ldr	r9, [r3, #44]
	cmp	r6, r9
	blt	.L586
.L606:
	ldr	r8, [fp, #-56]
	ldr	r1, [r8, #56]
	cmp	r1, #1
	bne	.L610
.L587:
	ldr	r3, [fp, #-76]
	mov	ip, #0	@ movhi
	str	r1, [r8, #44]
	sub	r2, r3, #1
	ldr	r3, [fp, #-84]
	ldr	r1, [fp, #-60]
	sub	r0, r3, #1
	mov	r3, #0
	bfi	ip, r3, #0, #9
	strh	ip, [fp, #-52]	@ movhi
	mov	ip, #0	@ movhi
	bfi	ip, r3, #0, #9
	strh	ip, [fp, #-50]	@ movhi
	mov	ip, #0	@ movhi
	ldr	lr, [fp, #-52]
	bfi	ip, r2, #0, #9
	mov	r2, #0	@ movhi
	strh	ip, [fp, #-52]	@ movhi
	bfi	r2, r0, #0, #9
	strh	r2, [fp, #-50]	@ movhi
	ldr	r2, [fp, #-52]
	str	lr, [r1, #48]
	str	r2, [r1, #52]
	b	.L588
.L581:
	bl	__aeabi_uidiv
	mov	r1, r4
	mul	r10, r4, r0
	ldrsh	r0, [r5, #80]
	bl	__aeabi_uidiv
	mul	r0, r4, r0
	cmp	r10, r0
	add	r3, r0, #1
	bhi	.L582
	cmp	r10, r3
	mov	r1, r4
	beq	.L582
	ldrsh	r0, [r5, #74]
	add	r0, r0, r7
	bl	__aeabi_uidiv
	mul	r0, r4, r0
	cmp	r10, r0
	bhi	.L611
.L582:
	cmp	r8, #198
	mov	r6, r8
	add	r5, r5, #4
	bgt	.L612
	ldrsh	r10, [r5, #78]
.L578:
	add	r8, r6, #1
	mov	r1, r4
	cmp	r8, r9
	add	r0, r7, r10
	blt	.L581
	ldr	r3, [fp, #-88]
	add	r0, r3, r10
	bl	__aeabi_uidiv
	mul	r7, r4, r0
	b	.L580
.L612:
	ldr	r3, [fp, #-56]
	mov	r1, r4
	add	r2, r3, r8, lsl #2
	ldrsh	r0, [r2, #78]
	sub	r0, r0, #1
	add	r0, r0, r4
	bl	__aeabi_uidiv
	mul	r7, r4, r0
	b	.L580
.L611:
	mov	r7, r10
	b	.L580
.L607:
	ldr	r8, [fp, #-56]
	mov	r0, #0
	ldr	r1, .L613
	movw	r3, #2123
	str	r6, [sp]
	ldr	r2, .L613+4
	str	r0, [fp, #-64]
	bl	dprint_vfmw
	ldr	r1, [r8, #56]
	b	.L571
.L605:
	ldr	r1, .L613+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r4, #1
	b	.L572
.L609:
	ldr	r8, [fp, #-56]
	mov	r1, #1
	str	r1, [r8, #56]
	b	.L587
.L602:
	ldr	r1, .L613+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L598
.L601:
	ldr	r3, .L613+16
	ldr	r2, .L613+20
	ldr	r1, .L613+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L598
.L614:
	.align	2
.L613:
	.word	.LC51
	.word	.LANCHOR0+732
	.word	.LC50
	.word	.LC49
	.word	.LC48
	.word	.LANCHOR0+708
	.word	.LC3
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_CfgRpMsg, .-VDMHAL_V5R6C1_CfgRpMsg
	.align	2
	.global	VDMHAL_V5R6C1_MakeDecReport
	.type	VDMHAL_V5R6C1_MakeDecReport, %function
VDMHAL_V5R6C1_MakeDecReport:
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
	UNWIND(.pad #16)
	sub	sp, sp, #16
	subs	r3, r0, #0
	beq	.L644
	ldr	r5, [r3, #4]
	ldr	r8, [r3]
	cmp	r5, #0
	ldr	r6, [r3, #8]
	beq	.L645
	movw	r3, #1228
	ldr	r7, .L653
	mul	r3, r3, r6
	ldr	r0, [r7, r3]
	cmp	r0, #0
	beq	.L619
	ldr	r3, .L653+4
	ldr	r2, [r3]
	cmp	r2, #1
	addne	r1, r3, #124
	bne	.L622
	b	.L634
.L647:
	cmp	r3, r1
	beq	.L646
.L622:
	ldr	r2, [r3, #4]!
	cmp	r2, #1
	bne	.L647
.L634:
	mov	r4, r2
.L620:
	ldr	r3, .L653+8
	mov	r2, #824
	mov	r1, #0
	mov	r0, r5
	ldr	r3, [r3, #48]
	blx	r3
	movw	r3, #1228
	mla	r3, r3, r6, r7
	ldr	r1, .L653+12
	mov	r2, #180
	mla	r2, r2, r6, r1
	ldr	r3, [r3, #24]
	str	r3, [r5, #4]
	ldr	r3, [r2, #4]
	mov	r3, r3, lsr #17
	and	r2, r3, #3
	cmp	r2, #1
	moveq	r3, #0
	beq	.L623
	eor	r3, r3, #1
	and	r3, r3, #1
	cmp	r8, #3
	orrne	r3, r3, #1
.L623:
	mov	r2, #180
	str	r3, [r5]
	mla	r3, r2, r6, r1
	cmp	r8, #0
	cmpne	r8, #15
	ldr	r2, [r3, #4]
	ubfx	r2, r2, #0, #17
	str	r2, [r5, #12]
	beq	.L648
.L624:
	cmp	r2, #200
	bhi	.L649
.L626:
	movw	r3, #1228
	mla	r7, r3, r6, r7
	ldr	r8, [r7, #40]
	mov	r0, r8
	bl	MEM_Phy2Vir
	subs	r1, r0, #0
	beq	.L650
	mov	r9, #3200
	ldr	r7, .L653+16
	mul	r9, r9, r6
	ldr	r2, [r5, #12]
	add	r4, r7, r9
	mov	r2, r2, asl #2
	mov	r0, r4
	bl	VDMHAL_V5R6C1_ReadMsgSlot
	ldr	ip, [r5, #12]
	ldr	r3, [r7, r9]
	cmp	ip, #0
	mov	r3, r3, lsr #31
	movne	r0, r4
	str	r3, [r5, #16]
	movne	r2, #0
	movne	r3, r5
	beq	.L631
.L630:
	ldr	r1, [r0, #4]
	add	r2, r2, #1
	cmp	r2, ip
	add	r0, r0, #16
	add	r3, r3, #4
	strh	r1, [r3, #16]	@ movhi
	ldr	r1, [r0, #-8]
	strh	r1, [r3, #18]	@ movhi
	bne	.L630
.L631:
	mov	r0, #6
	bl	IsDprintTypeEnable
	cmp	r0, #0
	bne	.L651
.L617:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L648:
	cmp	r4, #1
	beq	.L652
	ldr	r1, .L653+20
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L624
	ldrb	r3, [r3, #19]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #2
	bne	.L624
	mov	r3, #1
	strh	r1, [r5, #20]	@ movhi
	mov	r0, r1
	strh	r1, [r5, #22]	@ movhi
	str	r3, [r5, #12]
	b	.L617
.L646:
	mov	r4, #0
	b	.L620
.L651:
	ldr	r2, [r5, #12]
	mov	r0, #6
	ldr	r1, .L653+24
	mov	r4, #0
	bl	dprint_vfmw
	mov	r2, r8
	ldr	r1, .L653+28
	mov	r0, #6
	bl	dprint_vfmw
	mov	r3, #3200
	mla	r6, r3, r6, r7
.L632:
	ldr	r1, [r6, #4]
	ldr	lr, [r6, #12]
	mov	r2, r4
	ldr	ip, [r6, #8]
	mov	r0, #6
	ldr	r3, [r6]
	add	r4, r4, #4
	str	r1, [sp]
	add	r6, r6, #16
	str	lr, [sp, #8]
	str	ip, [sp, #4]
	ldr	r1, .L653+32
	bl	dprint_vfmw
	ldr	r3, [r5, #12]
	mov	r3, r3, asl #2
	sub	r3, r3, #3
	cmp	r3, r4
	bhi	.L632
	ldr	r1, .L653+36
	mov	r0, #6
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L649:
	mov	r3, #200
	ldr	r1, .L653+40
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r5, #12]
	b	.L626
.L652:
	ldr	r3, [r3, #16]
	ubfx	r3, r3, #21, #2
	cmp	r3, #2
	bne	.L624
	mov	r3, #0
	str	r4, [r5, #12]
	strh	r3, [r5, #20]	@ movhi
	mov	r0, r3
	strh	r3, [r5, #22]	@ movhi
	b	.L617
.L650:
	ldr	r3, .L653+44
	ldr	r2, .L653+48
	ldr	r1, .L653+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L617
.L619:
	ldr	r3, .L653+56
	ldr	r2, .L653+48
	ldr	r1, .L653+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L617
.L645:
	mov	r0, r5
	ldr	r3, .L653+60
	ldr	r2, .L653+48
	ldr	r1, .L653+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L617
.L644:
	ldr	r3, .L653+64
	ldr	r2, .L653+48
	ldr	r1, .L653+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L617
.L654:
	.align	2
.L653:
	.word	g_HwMem
	.word	g_DSPState
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_BackUp
	.word	g_UpMsg
	.word	g_not_allow_H264FullPictureRepair_flag
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.word	.LC54
	.word	.LC44
	.word	.LANCHOR0+756
	.word	.LC3
	.word	.LC42
	.word	.LC53
	.word	.LC52
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_MakeDecReport, .-VDMHAL_V5R6C1_MakeDecReport
	.align	2
	.global	VDMHAL_V5R6C1_PrepareRepair
	.type	VDMHAL_V5R6C1_PrepareRepair, %function
VDMHAL_V5R6C1_PrepareRepair:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	movw	r4, #1228
	mul	r4, r4, r3
	ldr	r5, .L670
	cmp	r3, #0
	mov	r6, r3
	mov	r8, r0
	add	r7, r4, r5
	bgt	.L666
	ldr	r3, [r4, r5]
	cmp	r3, #0
	beq	.L667
.L658:
	cmp	r2, #0
	beq	.L668
	cmp	r2, #1
	movne	r0, #0
	beq	.L669
.L657:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L668:
	ldr	r4, .L670+4
	movw	r3, #1752
	mla	r3, r3, r6, r4
	ldr	r0, [r3, #44]
	cmp	r0, #0
	ble	.L661
	cmp	r8, #6
	bne	.L662
	ldrb	r1, [r1, #17]	@ zero_extendqisi2
	cmp	r1, #1
	moveq	r2, r1
	str	r2, [r3, #928]
.L662:
	ldr	r3, [fp, #4]
	mov	r2, r6
	add	r1, r7, #48
	mov	r0, r7
	bl	VDMHAL_V5R6C1_CfgRpReg.isra.9
	movw	r0, #1752
	mov	r1, r7
	mov	r2, r6
	mla	r0, r0, r6, r4
	bl	VDMHAL_V5R6C1_CfgRpMsg
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L669:
	cmp	r8, #6
	bne	.L664
	ldrb	r3, [r1, #17]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L664
	movw	r4, #1752
	ldr	r5, .L670+4
	mul	r4, r4, r6
	add	r0, r5, r4
	ldr	r3, [r0, #920]
	cmp	r3, #0
	ble	.L664
	mov	ip, #2
	ldr	r3, [fp, #4]
	str	ip, [r0, #928]
	mov	r2, r6
	add	r1, r7, #48
	mov	r0, r7
	bl	VDMHAL_V5R6C1_CfgRpReg.isra.9
	add	r0, r4, #876
	add	r0, r5, r0
	mov	r2, r6
	mov	r1, r7
	bl	VDMHAL_V5R6C1_CfgRpMsg
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L667:
	mov	r0, #0
	str	r2, [fp, #-44]
	movt	r0, 63683
	str	r1, [fp, #-40]
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L659
	str	r3, [r4, r5]
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-44]
	b	.L658
.L666:
	mov	r0, #0
	ldr	r2, .L670+8
	str	r0, [sp]
	ldr	r1, .L670+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L657
.L664:
	ldr	r1, .L670+16
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	b	.L657
.L661:
	mov	r0, r2
	ldr	r1, .L670+20
	str	r2, [fp, #-40]
	bl	dprint_vfmw
	ldr	r2, [fp, #-40]
	mov	r0, r2
	b	.L657
.L659:
	ldr	r1, .L670+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L657
.L671:
	.align	2
.L670:
	.word	g_HwMem
	.word	g_RepairParam
	.word	.LANCHOR0+784
	.word	.LC0
	.word	.LC61
	.word	.LC60
	.word	.LC59
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_PrepareRepair, .-VDMHAL_V5R6C1_PrepareRepair
	.align	2
	.global	VDMHAL_V5R6C1_StartHwRepair
	.type	VDMHAL_V5R6C1_StartHwRepair, %function
VDMHAL_V5R6C1_StartHwRepair:
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r6, .L702
	mov	r5, r0
	mov	r4, r1
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L696
	cmp	r0, #0
	ble	.L697
	str	r3, [sp]
	mov	r3, r0
	ldr	r2, .L702+4
	mov	r0, #32
	ldr	r1, .L702+8
	bl	dprint_vfmw
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L698
.L680:
	mov	r2, #1
	mov	r3, r5
	str	r2, [sp]
	mov	r0, #32
	ldr	r2, .L702+4
	ldr	r1, .L702+8
	bl	dprint_vfmw
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L692
.L675:
	cmp	r4, #0
	beq	.L699
	mov	r3, r5, asl #6
	ldr	r2, .L702+12
	sub	r3, r3, r5, asl #3
	mov	r1, #1
	add	r3, r2, r3
	str	r1, [r4, #4]
	mov	r0, r4
	ldr	r3, [r3, #8]
	strb	r1, [r4, #2]
	strb	r5, [r4]
	str	r3, [r4, #8]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	VDH_PostTask
.L697:
	movw	r3, #1228
	ldr	r4, .L702+16
	mul	r3, r3, r0
	mov	r2, #67108864
	ldr	r3, [r4, r3]
	str	r2, [r3, #8]
.L678:
	movw	r3, #1228
	ldr	r2, .L702+20
	mul	r3, r3, r5
	mvn	r1, #1
	ldr	r3, [r4, r3]
	str	r1, [r3, #36]
	ldr	r3, [r2, #112]
	blx	r3
.L687:
	movw	r3, #1228
	mov	r2, #0
	mul	r5, r3, r5
	mov	r1, #1
	ldr	r3, [r4, r5]
	str	r2, [r3]
	ldr	r3, [r4, r5]
	str	r1, [r3]
	ldr	r3, [r4, r5]
	str	r2, [r3]
.L672:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L696:
	mov	r3, #67108864
	mov	r2, #8
	mov	r1, #2
	mov	r0, r4
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L700
	cmp	r5, #0
	ldrle	r4, .L702+16
	bgt	.L680
	b	.L678
.L700:
	mvn	r3, #1
	mov	r2, #36
	mov	r1, #2
	mov	r0, r4
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L675
	ldr	r3, .L702+20
	ldr	r3, [r3, #112]
	blx	r3
	cmp	r5, #0
	ble	.L701
.L684:
	mov	r4, #1
	mov	r3, r5
	str	r4, [sp]
	mov	r0, #32
	ldr	r2, .L702+24
	ldr	r1, .L702+8
	bl	dprint_vfmw
	mov	r3, r5
	str	r4, [sp]
	mov	r0, #32
	ldr	r2, .L702+24
	ldr	r1, .L702+8
	bl	dprint_vfmw
	str	r4, [sp]
	mov	r3, r5
	ldr	r2, .L702+24
	ldr	r1, .L702+8
	mov	r0, #32
	bl	dprint_vfmw
	b	.L672
.L698:
	mvn	r3, #1
	mov	r2, #36
	mov	r1, #2
	mov	r0, r4
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L675
.L692:
	ldr	r3, .L702+20
	ldr	r3, [r3, #112]
	blx	r3
	b	.L684
.L699:
	mov	r3, r4
	mov	r0, r4
	ldr	r2, .L702+24
	ldr	r1, .L702+28
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	dprint_vfmw
.L701:
	ldr	r4, .L702+16
	b	.L687
.L703:
	.align	2
.L702:
	.word	g_HalDisable
	.word	.LANCHOR0+812
	.word	.LC33
	.word	g_VdmDrvParam
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+828
	.word	.LC62
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_StartHwRepair, .-VDMHAL_V5R6C1_StartHwRepair
	.align	2
	.global	VDMHAL_V5R6C1_CalVdhClkSkip
	.type	VDMHAL_V5R6C1_CalVdhClkSkip, %function
VDMHAL_V5R6C1_CalVdhClkSkip:
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
	ldr	r9, .L734
	ldr	r10, [r9, #128]
	cmp	r10, #0
	blt	.L726
	mov	r7, #0
	add	r4, r9, #128
	mov	r6, r7
	mov	r5, r7
	add	r9, r9, #252
	mov	r8, #30
	b	.L706
.L733:
	mov	r3, r10
	ldr	r2, .L734+4
	ldr	r1, .L734+8
	mov	r0, #1
	bl	dprint_vfmw
.L708:
	cmp	r4, r9
	beq	.L732
.L725:
	ldr	r10, [r4, #4]!
	cmp	r10, #0
	blt	.L732
.L706:
	mov	r0, r10
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	bne	.L733
	mov	r0, r10
	bl	FSP_GetInst
	cmp	r0, #0
	beq	.L709
	ldr	r1, [r0, #40]
	ldr	r2, [r0, #44]
	adds	r5, r1, #15
	addmi	r5, r1, #30
	adds	r6, r2, #15
	addmi	r6, r2, #30
	mov	r5, r5, asr #4
	mov	r6, r6, asr #4
.L709:
	ldr	r3, .L734+12
	mov	r0, r10
	ldr	r2, [r3, r10, asl #2]
	ldr	r3, [r2, #1600]
	cmp	r3, #30
	movgt	r8, r3
	bl	VCTRL_GetVidStd
	cmp	r0, #17
	ldrls	pc, [pc, r0, asl #2]
	b	.L727
.L712:
	.word	.L721
	.word	.L721
	.word	.L721
	.word	.L721
	.word	.L727
	.word	.L721
	.word	.L721
	.word	.L727
	.word	.L721
	.word	.L721
	.word	.L721
	.word	.L721
	.word	.L721
	.word	.L721
	.word	.L727
	.word	.L722
	.word	.L721
	.word	.L721
.L721:
	mul	r7, r6, r5
	cmp	r4, r9
	mul	r7, r7, r8
	bne	.L725
.L732:
	mov	r2, r7, asl #8
	movw	r3, #23813
	sub	r7, r2, r7, asl #6
	movt	r3, 56143
	umull	r2, r3, r7, r3
	mov	r0, r3, lsr #21
	rsb	r0, r0, #32
	cmp	r0, #25
	movge	r0, #25
	bic	r0, r0, r0, asr #31
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L722:
	mul	r7, r6, r5
	mul	r7, r7, r8
	mov	r7, r7, asl #1
	b	.L708
.L727:
	mov	r7, #0
	b	.L708
.L726:
	mov	r0, #25
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L735:
	.align	2
.L734:
	.word	g_ChanCtx
	.word	.LANCHOR0+856
	.word	.LC63
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_CalVdhClkSkip, .-VDMHAL_V5R6C1_CalVdhClkSkip
	.align	2
	.global	VDMHAL_V5R6C1_GetVdmClk
	.type	VDMHAL_V5R6C1_GetVdmClk, %function
VDMHAL_V5R6C1_GetVdmClk:
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
	mov	r3, r0, asl #6
	ldr	r2, .L744
	sub	r0, r3, r0, asl #3
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L737
.L739:
	.word	.L737
	.word	.L740
	.word	.L741
	.word	.L742
.L737:
	add	r3, r2, r0
	mov	r1, #500
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L741:
	add	r3, r2, r0
	mov	r1, #100
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L740:
	add	r3, r2, r0
	mov	r1, #540
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L742:
	add	r3, r2, r0
	mov	r1, #600
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L745:
	.align	2
.L744:
	.word	g_VdmDrvParam
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_GetVdmClk, .-VDMHAL_V5R6C1_GetVdmClk
	.align	2
	.global	VDMHAL_V5R6C1_StartHwDecode
	.type	VDMHAL_V5R6C1_StartHwDecode, %function
VDMHAL_V5R6C1_StartHwDecode:
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
	subs	r4, r0, #0
	mov	r3, #8
	mov	r5, r1
	str	r3, [fp, #-48]
	ble	.L747
	mov	r0, #0
	mov	r3, r4
	str	r0, [sp]
	ldr	r2, .L780
	ldr	r1, .L780+4
	bl	dprint_vfmw
.L746:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L747:
	ldr	r6, .L780+8
	sub	r0, fp, #48
	bl	HI_DRV_SYS_GetChipPackageType
	ldr	r7, [fp, #-48]
	ldrb	r3, [r6]	@ zero_extendqisi2
	adds	r7, r7, #0
	movne	r7, #1
	cmp	r3, #1
	bne	.L776
	ldr	r3, .L780+12
	ldr	r2, [r3]
	ldr	r3, [r2, #120]
	ubfx	r1, r3, #8, #2
	cmp	r1, r7
	bfine	r3, r7, #8, #2
	strne	r3, [r2, #120]
.L750:
	mov	r1, r7
	mov	r0, r4
	bl	VDMHAL_V5R6C1_GetVdmClk
	ldr	r7, .L780+16
	mov	r3, r4, asl #6
	ldr	r2, .L780+20
	sub	r3, r3, r4, asl #3
	ldrb	r1, [r6]	@ zero_extendqisi2
	add	r3, r7, r3
	cmp	r1, #1
	ldr	r8, [r3, #8]
	ldr	r3, [r2, r8, asl #2]
	ldr	r9, [r3, #1240]
	bne	.L777
	ldr	r3, .L780+12
	ldr	r2, [r3]
	ldr	r3, [r2, #120]
	bfc	r3, #12, #5
	bfc	r3, #17, #1
	str	r3, [r2, #120]
	ldr	r3, [r2, #120]
	orr	r3, r3, #131072
	str	r3, [r2, #120]
.L753:
	mov	r2, r4
	mov	r3, r5
	mov	r1, #3
	mov	r0, #12
	bl	SCD_ConfigReg
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldr	r10, .L780+8
	cmp	r2, #1
	bne	.L778
	movw	r2, #1228
	ldr	r3, .L780+24
	mul	r2, r2, r4
	ldr	r5, .L780+28
	ldr	r1, [r3]
	movw	r3, #43690
	bfi	r3, r3, #16, #16
	cmp	r1, #1
	ldr	r2, [r5, r2]
	moveq	r1, #15
	movne	r1, #0
	str	r3, [r2, #156]
.L755:
	movw	r2, #1228
	cmp	r9, #1
	mul	r2, r2, r4
	mvneq	r3, #5
	mvnne	r3, #1
	ldr	r2, [r5, r2]
	add	r2, r2, #61440
	str	r1, [r2, #32]
.L757:
	movw	r2, #1228
	mul	r2, r2, r4
	ldr	r2, [r5, r2]
	str	r3, [r2, #36]
.L759:
	ldr	r6, .L780+32
	mov	r0, #30
	ldr	r3, [r6, #116]
	blx	r3
	ldr	r3, [r6, #112]
	blx	r3
	movw	r3, #1228
	mul	r3, r3, r4
	mov	r1, #56
	mov	r2, #0
	mov	lr, #1
	mla	r4, r1, r4, r7
	ldr	ip, .L780+36
	mov	r1, #4
	ldr	r0, [r5, r3]
	str	r2, [r0]
	ldr	r0, [r5, r3]
	str	lr, [r0]
	ldr	r3, [r5, r3]
	str	r2, [r3]
	ldr	r0, [r4, #8]
	ldr	r2, [ip, r0, asl #2]
	bl	VDEC_Lowdelay_Event_Time
	b	.L746
.L778:
	movw	r3, #43690
	mov	r1, #2
	mov	r2, #156
	movt	r3, 43690
	mov	r0, r5
	bl	VDH_Record_RegData
	ldr	r3, .L780+24
	ldrb	r2, [r10]	@ zero_extendqisi2
	ldr	r3, [r3]
	cmp	r3, #1
	moveq	r1, #15
	movne	r1, #0
	cmp	r2, #1
	ldreq	r5, .L780+28
	beq	.L755
	mov	r3, r1
	movw	r2, #61472
	mov	r0, r5
	mov	r1, #2
	bl	VDH_Record_RegData
	cmp	r9, #1
	ldrb	r2, [r6]	@ zero_extendqisi2
	mvneq	r3, #5
	mvnne	r3, #1
	cmp	r2, #1
	ldreq	r5, .L780+28
	beq	.L757
	mov	r0, r5
	mov	r2, #36
	mov	r1, #2
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r5, .L780+28
	beq	.L759
	cmp	r5, #0
	beq	.L779
	mov	r3, #1
	str	r8, [r5, #8]
	strb	r4, [r5]
	mov	r0, r5
	str	r3, [r5, #4]
	bl	VDH_PostTask
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L777:
	mov	r3, #0
	mov	r2, #1
	mov	r1, r3
	mov	r0, r5
	bl	VDH_Record_RegData
	b	.L753
.L776:
	mov	r2, #0
	mov	r3, r7
	mov	r1, r2
	mov	r0, r5
	bl	VDH_Record_RegData
	b	.L750
.L779:
	mov	r3, r5
	mov	r0, r5
	ldr	r2, .L780
	ldr	r1, .L780+40
	bl	dprint_vfmw
	b	.L746
.L781:
	.align	2
.L780:
	.word	.LANCHOR0+884
	.word	.LC0
	.word	g_HalDisable
	.word	g_pstRegCrg
	.word	g_VdmDrvParam
	.word	s_pstVfmwChan
	.word	mask_mmu_err_int
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_LowDelaySeqIndex
	.word	.LC62
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_StartHwDecode, .-VDMHAL_V5R6C1_StartHwDecode
	.align	2
	.global	VDMHAL_V5R6C1_GetCharacter
	.type	VDMHAL_V5R6C1_GetCharacter, %function
VDMHAL_V5R6C1_GetCharacter:
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
	ldr	r1, .L783
	mov	r0, #15
	ldr	r3, .L783+4
	mov	r2, #4
	str	r0, [r1]
	str	r2, [r3]
	ldmfd	sp, {fp, sp, pc}
.L784:
	.align	2
.L783:
	.word	g_VdmCharacter
	.word	g_eVdmVersion
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_GetCharacter, .-VDMHAL_V5R6C1_GetCharacter
	.align	2
	.global	VDMHAL_V5R6C1_WriteBigTitle1DYuv
	.type	VDMHAL_V5R6C1_WriteBigTitle1DYuv, %function
VDMHAL_V5R6C1_WriteBigTitle1DYuv:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #100)
	sub	sp, sp, #100
	ubfx	ip, r3, #29, #2
	cmp	ip, #1
	mov	r6, r3
	mov	r3, #0
	str	r0, [fp, #-108]
	mov	r8, r1
	mov	r5, r2
	str	r3, [fp, #-92]
	moveq	r4, r3
	str	r3, [fp, #-88]
	str	r3, [fp, #-84]
	str	r3, [fp, #-80]
	str	r3, [fp, #-76]
	str	r3, [fp, #-72]
	str	r3, [fp, #-68]
	str	r3, [fp, #-64]
	str	r3, [fp, #-60]
	str	r3, [fp, #-56]
	str	r3, [fp, #-52]
	str	r3, [fp, #-48]
	beq	.L786
	cmp	ip, #2
	moveq	r4, #1
	movne	r4, #2
.L786:
	ldr	r3, [fp, #-108]
	cmp	r3, #0
	beq	.L785
	mov	r3, #0
	mov	r2, #4194304
	mov	r1, r3
	str	r3, [sp]
	ldr	r0, .L875
	sub	r3, fp, #92
	bl	MEM_AllocMemBlock
	subs	r1, r0, #0
	bne	.L789
	str	r1, [sp]
	mov	r2, #4194304
	sub	r3, fp, #68
	ldr	r0, .L875+4
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	bne	.L789
	add	r6, r6, #15
	add	r5, r5, #15
	bic	r3, r6, #15
	str	r3, [fp, #-100]
	bic	r5, r5, #15
	mov	r1, r3
	adds	r3, r3, #31
	addmi	r3, r1, #62
	add	r2, r5, #255
	bic	r2, r2, #255
	cmp	r4, #0
	cmpne	r4, #3
	mov	r3, r3, asr #5
	mov	r1, r2, asl #4
	str	r1, [fp, #-104]
	mla	r3, r3, r2, r8
	str	r3, [fp, #-116]
	bne	.L790
	ldr	r3, [fp, #-100]
	mov	r1, r5, lsr #1
	ldr	r2, [fp, #-64]
	cmp	r3, #0
	ldr	r6, .L875+8
	mov	r3, r3, lsr #1
	ldr	r7, [fp, #-88]
	str	r2, [fp, #-120]
	movne	r10, r0
	add	r2, r2, #2097152
	str	r1, [fp, #-124]
	str	r2, [fp, #-128]
	str	r3, [fp, #-112]
	strne	r10, [fp, #-96]
	beq	.L792
.L791:
	cmp	r5, #0
	beq	.L794
	ldr	r2, [fp, #-96]
	mov	r4, #0
	and	r9, r2, #15
	mov	r3, r2, lsr #4
	ldr	r2, [fp, #-104]
	mul	r3, r2, r3
	add	r9, r3, r9, lsl #8
.L793:
	mov	r1, r4, lsr #8
	add	r0, r10, r4
	add	r0, r7, r0
	add	r4, r4, #256
	add	r1, r9, r1, lsl #12
	ldr	r3, [r6, #52]
	add	r1, r8, r1
	mov	r2, #256
	blx	r3
	cmp	r5, r4
	bhi	.L793
.L794:
	ldr	r3, [fp, #-96]
	add	r10, r10, r5
	ldr	r2, [fp, #-100]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	cmp	r2, r3
	bne	.L791
.L792:
	ldr	r3, [fp, #-100]
	mov	r0, r7
	ldr	r2, [fp, #-108]
	mul	r1, r5, r3
	ldr	r3, [r6, #44]
	blx	r3
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	beq	.L795
	ldr	r3, [fp, #-104]
	mov	r9, #0
	ldr	r10, [fp, #-116]
	str	r9, [fp, #-96]
	mov	r3, r3, asr #1
	str	r3, [fp, #-100]
.L796:
	cmp	r5, #0
	beq	.L799
	ldr	r2, [fp, #-96]
	mov	r4, #0
	and	r8, r2, #7
	mov	r3, r2, lsr #3
	ldr	r2, [fp, #-100]
	mul	r3, r2, r3
	add	r8, r3, r8, lsl #8
.L797:
	mov	r1, r4, lsr #8
	add	r0, r9, r4
	add	r0, r7, r0
	add	r4, r4, #256
	add	r1, r8, r1, lsl #11
	ldr	r3, [r6, #52]
	add	r1, r10, r1
	mov	r2, #256
	blx	r3
	cmp	r5, r4
	bhi	.L797
.L799:
	ldr	r3, [fp, #-96]
	add	r9, r9, r5
	ldr	r2, [fp, #-112]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	cmp	r3, r2
	bne	.L796
	ldr	r3, [fp, #4]
	cmp	r3, #1
	beq	.L873
.L801:
	ldr	r3, [fp, #4]
	cmp	r3, #0
	bne	.L802
	ldr	r3, [r6, #48]
	mov	r2, #1048576
	mov	r1, #128
	ldr	r0, [fp, #-128]
	blx	r3
	ldr	r3, [r6, #48]
	mov	r2, #1048576
	mov	r1, #128
	ldr	r0, [fp, #-120]
	blx	r3
.L802:
	ldr	r3, [fp, #-124]
.L872:
	ldr	r2, [fp, #-112]
	ldr	r5, [fp, #-108]
	ldr	r0, [fp, #-120]
	mul	r4, r3, r2
	ldr	r3, [r6, #44]
	mov	r2, r5
	mov	r1, r4
	blx	r3
	mov	r2, r5
	ldr	r3, [r6, #44]
	mov	r1, r4
	ldr	r0, [fp, #-128]
	blx	r3
	ldr	r1, [fp, #-88]
	ldr	r0, [fp, #-84]
	bl	MEM_ReleaseMemBlock
	ldr	r3, [r6, #48]
	mov	r2, #24
	mov	r1, #0
	sub	r0, fp, #92
	blx	r3
	ldr	r1, [fp, #-64]
	ldr	r0, [fp, #-60]
	bl	MEM_ReleaseMemBlock
	ldr	r3, [r6, #48]
	sub	r0, fp, #68
	mov	r2, #24
	mov	r1, #0
	blx	r3
.L785:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L789:
	ldr	r1, .L875+12
	mov	r0, #1
	bl	dprint_vfmw
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L790:
	subs	r3, r4, #1
	ldr	r1, [fp, #-100]
	ldr	r2, [fp, #-64]
	movne	r3, #1
	cmp	r1, r3
	str	r3, [fp, #-124]
	add	r3, r2, #2097152
	str	r3, [fp, #-128]
	mov	r3, r5, lsr #1
	str	r3, [fp, #-132]
	mov	r3, r1, lsr #1
	str	r3, [fp, #-112]
	ldrhi	r3, [fp, #-124]
	str	r2, [fp, #-120]
	ldr	r6, .L875+8
	ldr	r7, [fp, #-88]
	strhi	r3, [fp, #-96]
	bls	.L809
.L811:
	cmp	r5, #0
	beq	.L812
	ldr	r2, [fp, #-96]
	mov	r4, #0
	and	r9, r2, #15
	mov	r3, r2, lsr #4
	mov	r10, r2, lsr #1
	ldr	r2, [fp, #-104]
	mul	r10, r5, r10
	mul	r3, r2, r3
	add	r9, r3, r9, lsl #8
.L810:
	mov	r1, r4, lsr #8
	add	r0, r4, r10
	add	r0, r7, r0
	add	r4, r4, #256
	add	r1, r9, r1, lsl #12
	ldr	r3, [r6, #52]
	add	r1, r8, r1
	mov	r2, #256
	blx	r3
	cmp	r5, r4
	bhi	.L810
.L812:
	ldr	r3, [fp, #-96]
	ldr	r2, [fp, #-100]
	add	r3, r3, #2
	str	r3, [fp, #-96]
	cmp	r2, r3
	bhi	.L811
.L809:
	ldr	r3, [fp, #-100]
	mov	r0, r7
	ldr	r2, [fp, #-108]
	mul	r1, r5, r3
	ldr	r3, [r6, #44]
	mov	r1, r1, lsr #1
	blx	r3
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	beq	.L813
	ldr	r3, [fp, #-104]
	mov	r9, #0
	ldr	r10, [fp, #-116]
	str	r9, [fp, #-96]
	mov	r3, r3, asr #1
	str	r3, [fp, #-100]
.L814:
	cmp	r5, #0
	beq	.L817
	ldr	r2, [fp, #-96]
	mov	r4, #0
	and	r8, r2, #7
	mov	r3, r2, lsr #3
	ldr	r2, [fp, #-100]
	mul	r3, r2, r3
	add	r8, r3, r8, lsl #8
.L815:
	mov	r1, r4, lsr #8
	add	r0, r9, r4
	add	r0, r7, r0
	add	r4, r4, #256
	add	r1, r8, r1, lsl #11
	ldr	r3, [r6, #52]
	add	r1, r10, r1
	mov	r2, #256
	blx	r3
	cmp	r5, r4
	bhi	.L815
.L817:
	ldr	r3, [fp, #-96]
	add	r9, r9, r5
	ldr	r2, [fp, #-112]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	cmp	r3, r2
	bne	.L814
	ldr	r3, [fp, #4]
	cmp	r3, #1
	beq	.L874
	ldr	r3, [fp, #4]
	cmp	r3, #0
	bne	.L820
	ldr	r2, [fp, #-112]
	ldr	r3, [fp, #-124]
	cmp	r2, r3
	bls	.L825
.L826:
	add	r3, r3, #2
	cmp	r2, r3
	bhi	.L826
.L825:
	ldr	r3, [r6, #48]
	mov	r2, #1048576
	mov	r1, #128
	ldr	r0, [fp, #-128]
	blx	r3
	ldr	r3, [r6, #48]
	mov	r2, #1048576
	mov	r1, #128
	ldr	r0, [fp, #-120]
	blx	r3
.L820:
	ldr	r3, [fp, #-132]
	b	.L872
.L873:
	ldr	r3, [fp, #-120]
	add	r7, r7, #1
	ldr	r4, [fp, #-124]
	mov	lr, #0
	ldr	r8, [fp, #-112]
.L803:
	cmp	r4, #0
	moveq	ip, r3
	beq	.L806
	sub	r1, r3, #-67108863
	add	ip, r3, r4
	sub	r1, r1, #65011712
	mov	r2, r7
.L804:
	ldrb	r0, [r2, #-1]	@ zero_extendqisi2
	strb	r0, [r1, #1]!
	ldrb	r0, [r2], #2	@ zero_extendqisi2
	strb	r0, [r3], #1
	cmp	r3, ip
	bne	.L804
.L806:
	add	lr, lr, #1
	mov	r3, ip
	cmp	lr, r8
	add	r7, r7, r5
	bne	.L803
	b	.L802
.L874:
	ldr	r3, [fp, #-124]
	mov	r4, #0
	ldr	lr, [fp, #-120]
	ldr	ip, [fp, #-132]
	mla	r3, r5, r3, r7
	ldr	r7, [fp, #-112]
	mov	r5, r5, asl #1
	add	r3, r3, #1
.L821:
	cmp	ip, #0
	beq	.L824
	mov	r2, r4, lsr #1
	mov	r1, r3
	mul	r2, ip, r2
	sub	r0, r2, #-67108863
	add	r9, r2, ip
	sub	r0, r0, #65011712
	add	r9, lr, r9
	add	r0, lr, r0
	add	r2, lr, r2
.L822:
	ldrb	r8, [r1, #-1]	@ zero_extendqisi2
	strb	r8, [r0, #1]!
	ldrb	r8, [r1], #2	@ zero_extendqisi2
	strb	r8, [r2], #1
	cmp	r2, r9
	bne	.L822
.L824:
	add	r4, r4, #2
	add	r3, r3, r5
	cmp	r7, r4
	bhi	.L821
	b	.L820
.L795:
	ldr	r3, [fp, #4]
	cmp	r3, #1
	bne	.L801
	b	.L802
.L813:
	ldr	r3, [fp, #4]
	cmp	r3, #1
	beq	.L820
	cmp	r3, #0
	beq	.L825
	b	.L820
.L876:
	.align	2
.L875:
	.word	.LC64
	.word	.LC66
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC65
	UNWIND(.fnend)
	.size	VDMHAL_V5R6C1_WriteBigTitle1DYuv, .-VDMHAL_V5R6C1_WriteBigTitle1DYuv
	.align	2
	.global	CRG_ConfigReg
	.type	CRG_ConfigReg, %function
CRG_ConfigReg:
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
	ldr	ip, .L884
	mov	lr, r2
	ldrb	r2, [ip]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L883
	cmp	r0, #0
	bne	.L879
	ldr	r3, .L884+4
	ldr	r3, [r3]
	ldr	r2, [r3, #120]
	ubfx	r0, r2, #8, #2
	cmp	r1, r0
	bfine	r2, r1, #8, #2
	strne	r2, [r3, #120]
	ldmfd	sp, {fp, sp, pc}
.L879:
	cmp	r0, #1
	ldmnefd	sp, {fp, sp, pc}
	ldr	r3, .L884+4
	ldr	r3, [r3]
	ldr	r2, [r3, #120]
	bfi	r2, r1, #12, #5
	bfc	r2, #17, #1
	str	r2, [r3, #120]
	ldr	r2, [r3, #120]
	orr	r2, r2, #131072
	str	r2, [r3, #120]
	ldmfd	sp, {fp, sp, pc}
.L883:
	mov	r3, r1
	mov	r2, r0
	mov	r1, #0
	mov	r0, lr
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDH_Record_RegData
.L885:
	.align	2
.L884:
	.word	g_HalDisable
	.word	g_pstRegCrg
	UNWIND(.fnend)
	.size	CRG_ConfigReg, .-CRG_ConfigReg
	.align	2
	.global	MFDE_ConfigReg
	.type	MFDE_ConfigReg, %function
MFDE_ConfigReg:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	ip, .L892
	mov	lr, r3
	ldrb	r3, [ip]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L890
	cmp	r2, #0
	ble	.L891
	str	r3, [sp]
	mov	r0, #32
	mov	r3, r2
	ldr	r1, .L892+4
	ldr	r2, .L892+8
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L891:
	movw	r3, #1228
	ldr	ip, .L892+12
	mul	r2, r3, r2
	ldr	r3, [ip, r2]
	str	r1, [r3, r0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L890:
	mov	r3, r1
	mov	r2, r0
	mov	r1, #2
	mov	r0, lr
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDH_Record_RegData
.L893:
	.align	2
.L892:
	.word	g_HalDisable
	.word	.LC33
	.word	.LANCHOR0+812
	.word	g_HwMem
	UNWIND(.fnend)
	.size	MFDE_ConfigReg, .-MFDE_ConfigReg
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.23349, %object
	.size	__func__.23349, 23
__func__.23349:
	.ascii	"VDMHAL_V5R6C1_CfgRpReg\000"
	.space	1
	.type	__func__.22849, %object
	.size	__func__.22849, 22
__func__.22849:
	.ascii	"VDMHAL_V5R6C1_OpenHAL\000"
	.space	2
	.type	__func__.22922, %object
	.size	__func__.22922, 25
__func__.22922:
	.ascii	"VDMHAL_V5R6C1_CalcFsSize\000"
	.space	3
	.type	__func__.22948, %object
	.size	__func__.22948, 24
__func__.22948:
	.ascii	"VDMHAL_V5R6C1_CalcFsNum\000"
	.type	__func__.22991, %object
	.size	__func__.22991, 32
__func__.22991:
	.ascii	"VDMHAL_V5R6C1_ArrangeMem_Normal\000"
	.type	__FUNCTION__.22992, %object
	.size	__FUNCTION__.22992, 32
__FUNCTION__.22992:
	.ascii	"VDMHAL_V5R6C1_ArrangeMem_Normal\000"
	.type	__func__.22934, %object
	.size	__func__.22934, 33
__func__.22934:
	.ascii	"VDMHAL_V5R6C1_FillMemArrangeInfo\000"
	.space	3
	.type	__func__.23074, %object
	.size	__func__.23074, 34
__func__.23074:
	.ascii	"VDMHAL_V5R6C1_ArrangeMem_Specific\000"
	.space	2
	.type	__func__.23097, %object
	.size	__func__.23097, 23
__func__.23097:
	.ascii	"VDMHAL_V5R6C1_ResetVdm\000"
	.space	1
	.type	__func__.23107, %object
	.size	__func__.23107, 35
__func__.23107:
	.ascii	"VDMHAL_V5R6C1_SetSmmuPageTableAddr\000"
	.space	1
	.type	__func__.23127, %object
	.size	__func__.23127, 24
__func__.23127:
	.ascii	"VDMHAL_V5R6C1_GlbResetX\000"
	.type	__func__.23117, %object
	.size	__func__.23117, 23
__func__.23117:
	.ascii	"VDMHAL_V5R6C1_GlbReset\000"
	.space	1
	.type	__func__.23139, %object
	.size	__func__.23139, 28
__func__.23139:
	.ascii	"VDMHAL_V5R6C1_ClearIntState\000"
	.type	__func__.23145, %object
	.size	__func__.23145, 31
__func__.23145:
	.ascii	"VDMHAL_V5R6C1_ClearMMUIntState\000"
	.space	1
	.type	__func__.23151, %object
	.size	__func__.23151, 22
__func__.23151:
	.ascii	"VDMHAL_V5R6C1_MaskInt\000"
	.space	2
	.type	__func__.23164, %object
	.size	__func__.23164, 24
__func__.23164:
	.ascii	"VDMHAL_V5R6C1_EnableInt\000"
	.type	__func__.23173, %object
	.size	__func__.23173, 23
__func__.23173:
	.ascii	"VDMHAL_V5R6C1_CheckReg\000"
	.space	1
	.type	__func__.23187, %object
	.size	__func__.23187, 26
__func__.23187:
	.ascii	"VDMHAL_V5R6C1_ReadMMUMask\000"
	.space	2
	.type	__func__.23192, %object
	.size	__func__.23192, 27
__func__.23192:
	.ascii	"VDMHAL_V5R6C1_WriteMMUMask\000"
	.space	1
	.type	__func__.23224, %object
	.size	__func__.23224, 25
__func__.23224:
	.ascii	"VDMHAL_V5R6C1_PrepareDec\000"
	.space	3
	.type	__func__.23229, %object
	.size	__func__.23229, 25
__func__.23229:
	.ascii	"VDMHAL_V5R6C1_IsVdmReady\000"
	.space	3
	.type	__func__.23234, %object
	.size	__func__.23234, 23
__func__.23234:
	.ascii	"VDMHAL_V5R6C1_IsVdmRun\000"
	.space	1
	.type	__func__.23240, %object
	.size	__func__.23240, 27
__func__.23240:
	.ascii	"VDMHAL_V5R6C1_IsVdhDecOver\000"
	.space	1
	.type	__func__.23250, %object
	.size	__func__.23250, 31
__func__.23250:
	.ascii	"VDMHAL_V5R6C1_IsVdhPartDecOver\000"
	.space	1
	.type	__func__.23265, %object
	.size	__func__.23265, 33
__func__.23265:
	.ascii	"VDMHAL_V5R6C1_UpdateHardwareInfo\000"
	.space	3
	.type	__func__.23338, %object
	.size	__func__.23338, 23
__func__.23338:
	.ascii	"VDMHAL_V5R6C1_CfgRpMsg\000"
	.space	1
	.type	__func__.23315, %object
	.size	__func__.23315, 24
__func__.23315:
	.ascii	"VDMHAL_CfgNotFullRepair\000"
	.type	__func__.23362, %object
	.size	__func__.23362, 28
__func__.23362:
	.ascii	"VDMHAL_V5R6C1_MakeDecReport\000"
	.type	__func__.23401, %object
	.size	__func__.23401, 28
__func__.23401:
	.ascii	"VDMHAL_V5R6C1_PrepareRepair\000"
	.type	__func__.23589, %object
	.size	__func__.23589, 15
__func__.23589:
	.ascii	"MFDE_ConfigReg\000"
	.space	1
	.type	__func__.23408, %object
	.size	__func__.23408, 28
__func__.23408:
	.ascii	"VDMHAL_V5R6C1_StartHwRepair\000"
	.type	__func__.23447, %object
	.size	__func__.23447, 28
__func__.23447:
	.ascii	"VDMHAL_V5R6C1_CalVdhClkSkip\000"
	.type	__func__.23471, %object
	.size	__func__.23471, 28
__func__.23471:
	.ascii	"VDMHAL_V5R6C1_StartHwDecode\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"%s: VdhId(%d) > %d\012\000" )
.LC1:
	ASCII(.ascii	"vdm register virtual address not mapped, reset fail" )
	ASCII(.ascii	"ed!\012\000" )
.LC2:
	ASCII(.ascii	"pOpenParam = NULL error!\000" )
	.space	3
.LC3:
	ASCII(.ascii	"%s: %s\012\000" )
.LC4:
	ASCII(.ascii	"MemBaseAddr = 0 error!\000" )
	.space	1
.LC5:
	ASCII(.ascii	"VDMHAL_V5R6C1_OpenHAL: Size error!\000" )
	.space	1
.LC6:
	ASCII(.ascii	"VdhId is wrong!!!\012\000" )
	.space	1
.LC7:
	ASCII(.ascii	"!!!!!! HAL memory not enouph! need %d, have %d\012\000" )
.LC8:
	ASCII(.ascii	"image size out of range\000" )
.LC9:
	ASCII(.ascii	"VDMHAL ArrangeMem HEVC/VP9/AVS2 10 bit\012\000" )
.LC10:
	ASCII(.ascii	"%s pstVfmwFrameSizeInfo = NULL\012\000" )
.LC11:
	ASCII(.ascii	"DelAllFrameMemRecord err in VDMHAL_V5R6C1_ArrangeMe" )
	ASCII(.ascii	"m!\012\000" )
	.space	1
.LC12:
	ASCII(.ascii	"Report arrange frame buffer: wxh %dx%d, FsNum %d, P" )
	ASCII(.ascii	"mvNum %d\012\000" )
	.space	3
.LC13:
	ASCII(.ascii	"Report arrange frame buffer only: wxh %dx%d, FsNum " )
	ASCII(.ascii	"%d, PmvNum %d\012\000" )
	.space	2
.LC14:
	ASCII(.ascii	"VidStd Invalid\000" )
	.space	1
.LC15:
	ASCII(.ascii	"decoder not support, ISMV450 = %d\012\000" )
	.space	1
.LC16:
	ASCII(.ascii	"Set CompressEn %d, LossCompressEn %d, YCompRatio %d" )
	ASCII(.ascii	", UVCompRatio %d\012\000" )
	.space	3
.LC17:
	ASCII(.ascii	"VDMHAL_V5R6C1_CalcFsSize err!\012\000" )
	.space	1
.LC18:
	ASCII(.ascii	"%s, need arrange, Size: %#x, Num: %#x, RefChanged: " )
	ASCII(.ascii	"%#x\012\000" )
.LC19:
	ASCII(.ascii	"DFS, report event. Size: 0x%x, Num: %d, RefChanged:" )
	ASCII(.ascii	" %d\012\000" )
.LC20:
	ASCII(.ascii	"pVdmMemArrange is NULL\000" )
	.space	1
.LC21:
	ASCII(.ascii	"DFS, no ref frame!\012\000" )
.LC22:
	ASCII(.ascii	"DFS, Frame number = %d > 30, Then, Frame num = 30, " )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC23:
	ASCII(.ascii	"VDMHAL_V5R6C1_ArrangeMem Mem addr is NULL\000" )
	.space	2
.LC24:
	ASCII(.ascii	"'pVdmMemArrange' is NULL\000" )
	.space	3
.LC25:
	ASCII(.ascii	"MemSize not enough for pmv slot\000" )
.LC26:
	ASCII(.ascii	"VDMHAL_V200R003_ArrangeMem get ChanWidth/ChanHeight" )
	ASCII(.ascii	" failed!\012\000" )
	.space	3
.LC27:
	ASCII(.ascii	"ImgSlotLen > ChanSlotLen\000" )
	.space	3
.LC28:
	ASCII(.ascii	"cann't allocate img slot\000" )
	.space	3
.LC29:
	ASCII(.ascii	"Chan: %d call VCTRL_GetVidStd failed\012\000" )
	.space	2
.LC30:
	ASCII(.ascii	"VDMHAL_V5R6C1_ResetVdm: map vdm register fail, vir(" )
	ASCII(.ascii	"reg) = (%p)\012\000" )
.LC31:
	ASCII(.ascii	"%s module id %d failed!\012\000" )
	.space	3
.LC32:
	ASCII(.ascii	"%s module id %d success!\012\000" )
	.space	2
.LC33:
	ASCII(.ascii	"%s: WR_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\012\000" )
	.space	3
.LC34:
	ASCII(.ascii	"%s: map vdm register 0x%x failed!\012\000" )
	.space	1
.LC35:
	ASCII(.ascii	"%s: RD_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\012\000" )
	.space	3
.LC36:
	ASCII(.ascii	"%s VdhId %d failed!\012\000" )
	.space	3
.LC37:
	ASCII(.ascii	"%s VdhId %d success!\012\000" )
	.space	2
.LC38:
	ASCII(.ascii	"%s: VdhId(%d) Invalid!\012\000" )
.LC39:
	ASCII(.ascii	"%s: vdm register virtual address not mapped, reset " )
	ASCII(.ascii	"failed!\012\000" )
.LC40:
	ASCII(.ascii	"%s: unkown reg_id = %d\012\000" )
.LC41:
	ASCII(.ascii	"%s: pDecParam(%p) = NULL\012\000" )
	.space	2
.LC42:
	ASCII(.ascii	"VDM register not mapped yet!\000" )
	.space	3
.LC43:
	ASCII(.ascii	"VDM register not mapped yet!\012\000" )
	.space	2
.LC44:
	ASCII(.ascii	"can NOT map vir addr for up-msg\000" )
.LC45:
	ASCII(.ascii	"ReadUpMsgSlot error! pDst=%p, pSrc=%p\012\000" )
	.space	1
.LC46:
	ASCII(.ascii	"ReadUpMsgSlot error! upmsg_size(%d) > 512\012\000" )
	.space	1
.LC47:
	ASCII(.ascii	"WriteMsgSlot error!\012\000" )
	.space	3
.LC48:
	ASCII(.ascii	"can not map repair msg virtual address!\000" )
.LC49:
	ASCII(.ascii	"ValidGroupNum=%d out of range!\012\000" )
.LC50:
	ASCII(.ascii	"align_mb error\012\000" )
.LC51:
	ASCII(.ascii	"[%s][%d]sclie_num is wrong! %d \012\000" )
	.space	3
.LC52:
	ASCII(.ascii	"'pMakeDecReport' is NULL\000" )
	.space	3
.LC53:
	ASCII(.ascii	"'pDecReport' is NULL\000" )
	.space	3
.LC54:
	ASCII(.ascii	"pDecReport->DecSliceNum(%d) > %d, set to 0 for full" )
	ASCII(.ascii	" repair.\012\000" )
	.space	3
.LC55:
	ASCII(.ascii	"\012***** UpMsg DecSliceNum=%d\012\000" )
	.space	3
.LC56:
	ASCII(.ascii	"\012***** Up Msg (phy addr: %#8x) *****\012\000" )
	.space	2
.LC57:
	ASCII(.ascii	"\0120x%02x 0x%08x 0x%08x 0x%08x 0x%08x\012\000" )
	.space	3
.LC58:
	ASCII(.ascii	"\012***** Up Msg print finished *****\012\000" )
.LC59:
	ASCII(.ascii	"vdm register virtual address not mapped, VDMHAL_V20" )
	ASCII(.ascii	"0R003_PrepareRepair failed!\012\000" )
.LC60:
	ASCII(.ascii	"FIRST_REPAIR Parameter Error!\012\000" )
	.space	1
.LC61:
	ASCII(.ascii	"SECOND_REPAIR Parameter Error!\012\000" )
.LC62:
	ASCII(.ascii	"%s: pMfdeTask(%p) = NULL\012\000" )
	.space	2
.LC63:
	ASCII(.ascii	"%s The channel %d is not active\012\000" )
	.space	3
.LC64:
	ASCII(.ascii	"BigTile1d_y\000" )
.LC65:
	ASCII(.ascii	"failed mem_allocMemBlock BigTile_yuv save!\012\000" )
.LC66:
	ASCII(.ascii	"BigTile1d_uv\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
