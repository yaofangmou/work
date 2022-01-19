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
	.type	VDMHAL_UpdateParam, %function
VDMHAL_UpdateParam:
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
	ldr	r3, [r2, #28]
	ldr	ip, [r2, #64]
	mov	r3, r3, asl ip
	cmp	r3, #1920
	ldmgtfd	sp, {fp, sp, pc}
	ldr	r3, [r2, #4]
	cmp	r3, #17
	ldmeqfd	sp, {fp, sp, pc}
	mov	ip, #0
	mov	r3, #1
	strb	ip, [r2]
	strb	r3, [r2, #1]
	cmp	r0, #17
	ldrls	pc, [pc, r0, asl #2]
	b	.L12
.L15:
	.word	.L25
	.word	.L16
	.word	.L17
	.word	.L18
	.word	.L12
	.word	.L19
	.word	.L20
	.word	.L12
	.word	.L21
	.word	.L22
	.word	.L23
	.word	.L23
	.word	.L23
	.word	.L24
	.word	.L12
	.word	.L25
	.word	.L26
	.word	.L27
.L25:
	mov	r2, #0
	mov	r3, #1
	strb	r2, [r1, #4]
	strb	r3, [r1, #17]
.L12:
	ldmfd	sp, {fp, sp, pc}
.L24:
	mov	r2, #0
	mov	r3, #1
	str	r2, [r1, #3144]
	strb	r3, [r1, #2778]
	ldmfd	sp, {fp, sp, pc}
.L26:
	mov	r2, #0
	mov	r3, #1
	strb	r2, [r1]
	strb	r3, [r1, #5]
	ldmfd	sp, {fp, sp, pc}
.L27:
	add	r1, r1, #270336
	mov	r2, #0
	mov	r3, #1
	str	r2, [r1, #2468]
	strb	r3, [r1, #2081]
	ldmfd	sp, {fp, sp, pc}
.L16:
	add	r2, r1, #12288
	mov	r0, #0
	mov	r3, #1
	str	r0, [r2, #260]
	strb	r3, [r1, #71]
	ldmfd	sp, {fp, sp, pc}
.L17:
	add	r2, r1, #12288
	mov	r0, #0
	mov	r3, #1
	str	r0, [r2, #2372]
	strb	r3, [r1, #159]
	ldmfd	sp, {fp, sp, pc}
.L18:
	add	r2, r1, #45056
	mov	r0, #0
	mov	r3, #1
	str	r0, [r2, #240]
	strb	r3, [r1, #144]
	ldmfd	sp, {fp, sp, pc}
.L19:
	mov	r2, #0
	mov	r3, #1
	str	r2, [r1, #160]
	strb	r3, [r1]
	ldmfd	sp, {fp, sp, pc}
.L20:
	add	r2, r1, #12288
	mov	r0, #0
	mov	r3, #1
	str	r0, [r2, #2604]
	strb	r3, [r1, #48]
	ldmfd	sp, {fp, sp, pc}
.L21:
	mov	r2, #0
	mov	r3, #1
	str	r2, [r1, #76]
	strb	r3, [r1]
	ldmfd	sp, {fp, sp, pc}
.L22:
	mov	r2, #0
	mov	r3, #1
	str	r2, [r1, #72]
	strb	r3, [r1, #1]
	ldmfd	sp, {fp, sp, pc}
.L23:
	mov	r2, #0
	mov	r3, #1
	str	r2, [r1, #212]
	strb	r3, [r1, #52]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VDMHAL_UpdateParam, .-VDMHAL_UpdateParam
	.align	2
	.global	VDMHAL_V5R2C1_GetHalMemSize
	.type	VDMHAL_V5R2C1_GetHalMemSize, %function
VDMHAL_V5R2C1_GetHalMemSize:
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
	.size	VDMHAL_V5R2C1_GetHalMemSize, .-VDMHAL_V5R2C1_GetHalMemSize
	.align	2
	.global	VDMHAL_V5R2C1_OpenHAL
	.type	VDMHAL_V5R2C1_OpenHAL, %function
VDMHAL_V5R2C1_OpenHAL:
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
	beq	.L42
	ldmia	r2, {r0, r3}
	ldr	r6, [r2, #8]
	cmp	r0, #0
	beq	.L43
	cmp	r3, #614400
	blt	.L44
	cmp	r6, #0
	bgt	.L45
	movw	r1, #1228
	add	lr, r0, #1020
	mul	r1, r1, r6
	add	lr, lr, #3
	ldr	r4, .L47
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
.L38:
	str	r1, [r2, #4]!
	cmp	r2, ip
	add	r1, r1, #1280
	bne	.L38
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
	bcc	.L39
	mov	r0, r4
	bl	H264HAL_V5R2C1_InitHal
	mov	r5, r0
	mov	r0, r4
	bl	HEVCHAL_V5R2C1_InitHal
	cmp	r0, #0
	beq	.L46
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L46:
	adds	r0, r5, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L45:
	ldr	r1, .L47+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L39:
	ldr	r1, .L47+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L43:
	ldr	r3, .L47+12
	ldr	r2, .L47+16
	ldr	r1, .L47+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L44:
	ldr	r3, .L47+24
	mov	r0, #0
	ldr	r2, .L47+16
	ldr	r1, .L47+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L42:
	ldr	r3, .L47+28
	ldr	r2, .L47+16
	ldr	r1, .L47+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L48:
	.align	2
.L47:
	.word	g_HwMem
	.word	.LC4
	.word	.LC5
	.word	.LC2
	.word	.LANCHOR0
	.word	.LC1
	.word	.LC3
	.word	.LC0
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_OpenHAL, .-VDMHAL_V5R2C1_OpenHAL
	.align	2
	.global	VDMHAL_V5R2C1_CloseHAL
	.type	VDMHAL_V5R2C1_CloseHAL, %function
VDMHAL_V5R2C1_CloseHAL:
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
	.size	VDMHAL_V5R2C1_CloseHAL, .-VDMHAL_V5R2C1_CloseHAL
	.align	2
	.global	VDMHAL_V5R2C1_CalcFsSize
	.type	VDMHAL_V5R2C1_CalcFsSize, %function
VDMHAL_V5R2C1_CalcFsSize:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 32
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
	sub	ip, r1, #32
	mov	r4, r1
	movw	r1, #8160
	cmp	ip, r1
	mov	r7, r0
	mov	r6, r2
	str	r3, [fp, #-64]
	bhi	.L51
	sub	r3, r2, #32
	mov	r5, r2
	cmp	r3, r1
	bhi	.L51
	add	r3, r2, #15
	sub	r2, fp, #44
	add	r10, r4, #15
	sub	r1, fp, #52
	mov	r3, r3, asr #4
	ldr	r0, [fp, #4]
	str	r3, [r2, #-4]!
	mov	r10, r10, asr #4
	str	r3, [fp, #-56]
	str	r10, [fp, #-52]
	bl	VDMHAL_CalcPmvSlotLen.isra.0
	ldr	r3, [fp, #4]
	cmp	r3, #16
	ldr	r3, [fp, #-56]
	mov	r9, r0
	beq	.L78
	ldr	r2, [fp, #4]
	ldr	r8, .L83
	cmp	r2, #17
	beq	.L79
	mov	r10, r10, asl #4
	mov	r2, #0
	add	r10, r10, #255
	mov	r1, r2
	add	r5, r6, #31
	str	r2, [fp, #-68]
	bic	r2, r10, #255
	str	r2, [fp, #-56]
	ldr	r2, [r8, r7, asl #2]
	bic	r5, r5, #31
	str	r1, [fp, #-72]
.L55:
	ldr	r1, [r2, #1208]
	cmp	r1, #1
	beq	.L80
.L77:
	mov	r10, #0
	str	r10, [fp, #-60]
	mov	r6, r10
.L58:
	ldr	r1, [fp, #-64]
	cmp	r1, #1
	beq	.L81
.L59:
	ldr	r1, [fp, #-72]
	add	r4, r6, r6, lsl #1
	ldr	r3, [fp, #-68]
	mul	r3, r3, r1
	ldr	r1, [fp, #-56]
	mul	r5, r1, r5
	add	r3, r3, r3, lsl #1
	mov	r3, r3, lsr #1
	add	r1, r5, r5, lsl #1
	add	r3, r3, r1, lsr #1
	add	r4, r3, r4, lsr #1
	add	r3, r2, #471040
	ldr	r1, [r3, #1560]
	cmp	r1, #0
	beq	.L82
.L61:
	add	r0, r2, #475136
	ldr	r1, [fp, #4]
	str	r4, [r0, #1032]
	cmp	r1, #17
	ldr	r0, [fp, #-60]
	add	r1, r9, r9, lsr #31
	str	r10, [r3, #3912]
	mov	r1, r1, asr #1
	str	r1, [r3, #3948]
	str	r0, [r3, #3908]
	beq	.L62
	ldr	r1, [r3, #1568]
	ldr	r0, [fp, #4]
	ldr	ip, [fp, #-56]
	cmp	r1, #32
	sub	r0, r0, #16
	movge	r1, #32
	cmp	r0, #1
	mov	r10, ip, asl #4
	str	r1, [r3, #3952]
	str	r10, [r3, #3900]
	add	r1, r5, r6
	mov	r10, r10, lsr #1
	str	r1, [r3, #3932]
	str	r10, [r3, #3904]
	bls	.L63
.L64:
	ldr	r3, [r8, r7, asl #2]
	mov	r0, #4096
	add	r4, r4, #1056
	add	r2, r3, #475136
	add	r1, r9, r4
	str	r9, [r2, #1036]
	str	r0, [r2, #1044]
	ldrsb	r3, [r3, #44]
	cmp	r3, #1
	ldr	r3, [fp, #8]
	addeq	r1, r1, r0
	cmp	r3, #0
	beq	.L72
	str	r4, [r3, #4]
	mov	r2, #4096
	ldr	r3, [r8, r7, asl #2]
	mov	r0, #0
	ldr	ip, [fp, #8]
	add	r3, r3, #471040
	ldr	r3, [r3, #1568]
	str	r9, [ip, #12]
	str	r3, [ip, #8]
	ldr	r3, [r8, r7, asl #2]
	add	r3, r3, #471040
	ldr	r3, [r3, #3952]
	str	r1, [ip]
	str	r2, [ip, #20]
	str	r3, [ip, #16]
	ldr	r3, [r8, r7, asl #2]
	add	r3, r3, #475136
	str	r4, [r3, #1040]
.L76:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L80:
	ldr	r1, [fp, #4]
	cmp	r1, #17
	cmpne	r6, #2160
	movge	r10, #1
	movlt	r10, #0
	cmp	r4, #3840
	orrge	r10, r10, #1
	cmp	r10, #0
	streq	r10, [fp, #-60]
	moveq	r6, r10
	beq	.L58
	add	r6, r6, #63
.L67:
	add	r1, r4, #2032
	add	r4, r4, #4080
	add	r1, r1, #15
	add	r4, r4, #14
	cmp	r1, #0
	add	r0, r6, #63
	movlt	r1, r4
	cmp	r6, #0
	mov	r1, r1, asr #11
	movlt	r6, r0
	mov	r6, r6, asr #6
	mov	r0, r1, asl #9
	mov	r1, r1, asl #4
	str	r1, [fp, #-60]
	mul	r6, r6, r0
	ldr	r1, [fp, #-64]
	cmp	r1, #1
	mov	r10, r6
	bne	.L59
.L81:
	mov	r4, r3, asl #5
	add	r4, r4, r3, lsl #4
	ldr	r3, [fp, #-56]
	mul	r5, r3, r5
	mul	r4, r3, r4
	add	r3, r2, #471040
	ldr	r1, [r3, #1560]
	cmp	r1, #0
	bne	.L61
.L82:
	ldr	r3, .L83+4
	movw	r0, #16184
	movt	r0, 7
	add	r0, r2, r0
	mov	r2, #1248
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r2, [r8, r7, asl #2]
	add	r3, r2, #471040
	b	.L61
.L62:
	ldr	r1, [fp, #-56]
	mov	r10, r1, asl #4
	mov	r1, #1
	str	r10, [r3, #3900]
	str	r1, [r3, #3952]
	mov	r10, r10, lsr r1
	add	r1, r5, r6
	str	r10, [r3, #3904]
	str	r1, [r3, #3932]
.L63:
	ldr	r2, [r2, #1572]
	cmp	r2, #8
	ble	.L64
	ldr	r1, [fp, #-72]
	add	r6, r6, r6, lsl #1
	ldr	r0, [fp, #-68]
	add	r5, r5, r5, lsl #1
	mov	r6, r6, lsr #1
	add	r5, r6, r5, lsr #1
	str	r5, [r3, #3924]
	mul	r2, r1, r0
	mov	r1, r1, asl #4
	mov	r0, #31
	str	r1, [r3, #3916]
	ldr	r1, .L83+8
	str	r2, [r3, #3928]
	bl	dprint_vfmw
	b	.L64
.L78:
	ldr	r8, .L83
	add	r10, r4, #255
	bic	r2, r10, #255
	str	r2, [fp, #-56]
	ldr	r2, [r8, r7, asl #2]
	ldr	r1, [r2, #1572]
	cmp	r1, #8
	ble	.L68
	ldr	r0, [fp, #-56]
	add	r1, r6, #31
	bic	r1, r1, #31
	str	r1, [fp, #-68]
	mov	r0, r0, lsr #2
	str	r0, [fp, #-72]
	b	.L55
.L79:
	add	r10, r4, #255
	add	r6, r6, #63
	bic	r2, r10, #255
	str	r2, [fp, #-56]
	ldr	r2, [r8, r7, asl #2]
	bic	r5, r6, #63
	ldr	r1, [r2, #1572]
	cmp	r1, #8
	ble	.L69
	ldr	r1, [fp, #-56]
	str	r5, [fp, #-68]
	mov	r1, r1, lsr #2
	str	r1, [fp, #-72]
.L57:
	ldr	r1, [r2, #1208]
	cmp	r1, #1
	bne	.L77
	b	.L67
.L68:
	mov	r1, #0
	str	r1, [fp, #-68]
	str	r1, [fp, #-72]
	b	.L55
.L51:
	ldr	r3, .L83+12
	mov	r0, #0
	ldr	r2, .L83+16
	ldr	r1, .L83+20
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L72:
	ldr	r0, [fp, #8]
	b	.L76
.L69:
	mov	r1, #0
	str	r1, [fp, #-68]
	str	r1, [fp, #-72]
	b	.L57
.L84:
	.align	2
.L83:
	.word	s_pstVfmwChan
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC7
	.word	.LC6
	.word	.LANCHOR0+24
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_CalcFsSize, .-VDMHAL_V5R2C1_CalcFsSize
	.align	2
	.global	VDMHAL_V5R2C1_GetRpuSize
	.type	VDMHAL_V5R2C1_GetRpuSize, %function
VDMHAL_V5R2C1_GetRpuSize:
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
	.size	VDMHAL_V5R2C1_GetRpuSize, .-VDMHAL_V5R2C1_GetRpuSize
	.align	2
	.global	VDMHAL_V5R2C1_CalcFsNum
	.type	VDMHAL_V5R2C1_CalcFsNum, %function
VDMHAL_V5R2C1_CalcFsNum:
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
	cmp	r3, #0
	mov	r2, r0
	beq	.L91
	cmp	r1, #17
	ldr	ip, .L93
	beq	.L92
	ldr	lr, [ip, r0, asl #2]
	add	r0, lr, #471040
	ldr	r1, [r0, #1568]
	cmp	r1, #32
	movge	r1, #32
	str	r1, [r0, #3952]
	ldr	r1, [lr, #632]
	cmp	r1, #2
	ldreq	r1, [r0, #1572]
	streq	r1, [r0, #3952]
.L90:
	ldr	r1, [ip, r2, asl #2]
	mov	r0, #0
	add	r1, r1, #471040
	ldr	r1, [r1, #1568]
	str	r1, [r3, #8]
	ldr	r2, [ip, r2, asl #2]
	add	r2, r2, #471040
	ldr	r2, [r2, #3952]
	str	r2, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L92:
	ldr	r1, [ip, r2, asl #2]
	mov	r0, #1
	add	r1, r1, #471040
	str	r0, [r1, #3952]
	b	.L90
.L91:
	ldr	r2, .L93+4
	mov	r0, #1
	ldr	r1, .L93+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L94:
	.align	2
.L93:
	.word	s_pstVfmwChan
	.word	.LANCHOR0+52
	.word	.LC8
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_CalcFsNum, .-VDMHAL_V5R2C1_CalcFsNum
	.align	2
	.global	VDMHAL_V5R2C1_DynamicAllocFrame
	.type	VDMHAL_V5R2C1_DynamicAllocFrame, %function
VDMHAL_V5R2C1_DynamicAllocFrame:
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
	ldr	r6, .L115
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
	bne	.L114
.L96:
	ldr	r1, [r6, r4, asl #2]
	movw	r2, #13880
	movt	r2, 7
	mov	r3, #0
	add	r2, r1, r2
	mov	r1, #255
.L97:
	str	r1, [r2, r3]
	add	r3, r3, #72
	cmp	r3, #2304
	bne	.L97
	cmp	r8, #1920
	cmple	r7, #1088
	ble	.L98
	ldr	r2, [r5, #8]
	ldr	r3, [r6, r4, asl #2]
.L99:
	ldr	r1, [r3, #1512]
	add	r3, r3, #471040
	mov	r0, r4
	add	r2, r2, r1
	str	r2, [r3, #1572]
	bl	VCTRL_GetVidStd
	ldr	r3, [r6, r4, asl #2]
	ldr	r1, .L115
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
	ldr	r1, .L115+4
	bl	dprint_vfmw
	ldr	r3, .L115+8
	ldr	r9, [r3]
	cmp	r9, #0
	beq	.L103
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
.L103:
	ldr	r3, .L115+12
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
.L98:
	ldr	r3, [r6, r4, asl #2]
	ldr	r1, .L115
	ldr	r2, [r3, #36]
	cmp	r2, #24
	ldreq	r2, [r5, #8]
	beq	.L99
	add	r2, r3, #475136
	ldr	r2, [r2, #1668]
	cmp	r2, #0
	ldr	r2, [r5, #8]
	addeq	r2, r2, #4
	streq	r2, [r5, #8]
	ldreq	r3, [r1, r4, asl #2]
	b	.L99
.L114:
	ldr	r1, .L115+16
	mov	r0, #0
	bl	dprint_vfmw
	b	.L96
.L116:
	.align	2
.L115:
	.word	s_pstVfmwChan
	.word	.LC10
	.word	g_event_report
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC9
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_DynamicAllocFrame, .-VDMHAL_V5R2C1_DynamicAllocFrame
	.align	2
	.global	VDMHAL_V5R2C1_DynamicAllocFrame_Only
	.type	VDMHAL_V5R2C1_DynamicAllocFrame_Only, %function
VDMHAL_V5R2C1_DynamicAllocFrame_Only:
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
	ldr	ip, .L122
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
	ldr	r1, .L122+4
	str	lr, [ip, #1572]
	ldr	lr, [r4, #16]
	ldr	ip, [r4, #8]
	stmia	sp, {ip, lr}
	bl	dprint_vfmw
	ldr	r3, .L122+8
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L117
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
.L117:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L123:
	.align	2
.L122:
	.word	s_pstVfmwChan
	.word	.LC11
	.word	g_event_report
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_DynamicAllocFrame_Only, .-VDMHAL_V5R2C1_DynamicAllocFrame_Only
	.align	2
	.global	VDMHAL_V5R2C1_ArrangeMem_Normal
	.type	VDMHAL_V5R2C1_ArrangeMem_Normal, %function
VDMHAL_V5R2C1_ArrangeMem_Normal:
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
	mov	r7, r2
	mov	r8, r3
	str	r0, [fp, #-68]
	str	r0, [fp, #-64]
	str	r0, [fp, #-60]
	str	r0, [fp, #-56]
	str	r0, [fp, #-52]
	str	r0, [fp, #-48]
	bhi	.L160
	ldr	r10, .L169
	ldr	r1, [r10, r4, asl #2]
	add	r2, r1, #471040
	ldr	r3, [r1, #100]
	ldr	r2, [r2, #1564]
	cmp	r3, #2
	str	r2, [fp, #-76]
	beq	.L161
	bics	r3, r5, #16
	moveq	r3, #1
	movne	r3, #0
	cmp	r5, #18
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L162
.L129:
	sub	r3, r5, #17
	clz	r3, r3
	mov	r3, r3, lsr #5
	mov	ip, r3
.L130:
	ldr	lr, [r1, #1220]
	mov	r2, r3
	str	r3, [r1, #1208]
	mov	r0, #1
	ldr	r3, [r1, #1212]
	str	lr, [sp, #4]
	ldr	lr, .L169+4
	ldr	r1, [r1, #1216]
	str	r1, [sp]
	ldr	r1, .L169+8
	str	ip, [lr, r4, asl #4]
	bl	dprint_vfmw
.L128:
	sub	r6, fp, #68
	ldr	r2, [fp, #4]
	mov	r1, r5
	mov	r0, r4
	mov	r3, r6
	bl	VDMHAL_V5R2C1_CalcFsNum
	ldr	r3, [fp, #8]
	str	r6, [sp, #4]
	mov	r2, r8
	str	r5, [sp]
	mov	r1, r7
	mov	r9, r0
	mov	r0, r4
	bl	VDMHAL_V5R2C1_CalcFsSize
	orrs	r3, r0, r9
	bne	.L163
	ldr	r3, [r10, r4, asl #2]
	ldr	r1, [fp, #-76]
	ldr	r5, [fp, #-68]
	str	r3, [fp, #-72]
	add	r3, r3, #471040
	cmp	r1, r5
	ldr	r2, .L169
	ldr	r9, [r3, #1568]
	ldr	r1, [r3, #1584]
	beq	.L164
.L133:
	str	r1, [sp, #4]
	mov	r3, r5
	ldr	r2, .L169+12
	mov	r0, #31
	ldr	r1, .L169+16
	str	r9, [sp]
	bl	dprint_vfmw
	ldr	r3, [r10, r4, asl #2]
	mov	r1, r7
	mov	r0, r4
	add	r3, r3, #471040
	ldr	r2, [r3, #1560]
	str	r5, [r3, #1564]
	mov	r3, r6
	cmp	r2, #0
	mov	r2, r8
	beq	.L165
	bl	VDMHAL_V5R2C1_DynamicAllocFrame_Only
.L136:
	ldr	ip, [r10, r4, asl #2]
	mov	r3, r9
	mov	r2, r5
	ldr	r1, .L169+20
	add	ip, ip, #471040
	mov	r0, #31
	ldr	ip, [ip, #1584]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, .L169+24
	ldr	r4, [r10, r4, asl #2]
	ldr	r3, [r3]
	add	r4, r4, #475136
	blx	r3
	mov	r3, #2
	str	r0, [r4, #1048]
.L126:
	mov	r0, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L164:
	cmp	r1, #1
	beq	.L133
	ldr	r0, [r3, #1560]
	cmp	r0, #1
	beq	.L133
	ldr	r1, [fp, #12]
	cmp	r1, #0
	beq	.L166
	ldr	r0, [fp, #-72]
	cmp	r9, #0
	movw	ip, #16184
	add	r1, r0, #475136
	movt	ip, 7
	ldrne	r2, [fp, #-72]
	ldr	r9, [r1, #1032]
	add	r1, r0, ip
	str	r1, [fp, #-80]
	beq	.L167
.L138:
	add	r2, r2, #471040
	ldr	r2, [r2, #1572]
	cmp	r2, #30
	bgt	.L168
.L139:
	str	r2, [r3, #3944]
	mov	r0, #8
	str	r3, [fp, #-76]
	ldr	r3, .L169+24
	ldr	r2, [r3, #12]
	blx	r2
	ldr	ip, [r10, r4, asl #2]
	ldr	r3, [fp, #-76]
	add	r8, ip, #475136
	ldr	r2, [r8, #1072]
	cmp	r2, #0
	beq	.L144
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
.L143:
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
	beq	.L141
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
.L141:
	ldr	r2, [r3, #3960]
	ldr	lr, [fp, #-76]
	cmp	r2, lr
	bcs	.L142
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
.L142:
	ldr	r2, [r8, #1072]
	add	r1, r1, #72
	cmp	ip, r2
	bcc	.L143
	ldr	r4, [fp, #-84]
.L144:
	ldr	r3, .L169+24
	mov	r2, #1232
	ldr	r1, [fp, #-80]
	ldr	r0, [fp, #12]
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, [r10, r4, asl #2]
	ldr	r2, .L169+24
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
.L165:
	bl	VDMHAL_V5R2C1_DynamicAllocFrame
	b	.L136
.L162:
	cmp	r8, #2160
	cmplt	r7, #3840
	movge	ip, #1
	movge	r3, ip
	bge	.L130
	b	.L129
.L161:
	mvn	r3, #0
	str	r0, [r1, #1208]
	str	r0, [r1, #1212]
	str	r3, [r1, #1216]
	str	r3, [r1, #1220]
	b	.L128
.L167:
	ldr	r1, .L169+28
	mov	r0, #31
	str	r3, [fp, #-84]
	str	r2, [fp, #-76]
	bl	dprint_vfmw
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-84]
	ldr	r2, [r2, r4, asl #2]
	b	.L138
.L168:
	ldr	r1, .L169+32
	mov	r0, #31
	str	r3, [fp, #-76]
	bl	dprint_vfmw
	ldr	r1, [r10, r4, asl #2]
	mov	r0, #30
	mov	r2, r0
	ldr	r3, [fp, #-76]
	add	r1, r1, #471040
	str	r0, [r1, #1572]
	b	.L139
.L160:
	ldr	r3, .L169+36
	ldr	r2, .L169+40
	ldr	r1, .L169+44
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L126
.L163:
	ldr	r1, .L169+48
	mov	r0, #31
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L126
.L166:
	ldr	r3, .L169+52
	mov	r0, r1
	ldr	r2, .L169+56
	ldr	r1, .L169+44
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L126
.L170:
	.align	2
.L169:
	.word	s_pstVfmwChan
	.word	g_VfmwCompressPara
	.word	.LC13
	.word	.LANCHOR0+108
	.word	.LC15
	.word	.LC16
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC18
	.word	.LC19
	.word	.LC12
	.word	.LANCHOR0+76
	.word	.LC1
	.word	.LC14
	.word	.LC17
	.word	.LANCHOR0+140
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_ArrangeMem_Normal, .-VDMHAL_V5R2C1_ArrangeMem_Normal
	.global	__aeabi_idiv
	.align	2
	.global	VDMHAL_V5R2C1_ArrangeMem_Specific
	.type	VDMHAL_V5R2C1_ArrangeMem_Specific, %function
VDMHAL_V5R2C1_ArrangeMem_Specific:
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
	beq	.L246
	ldr	r2, [fp, #4]
	sub	r1, r2, #32
	movw	r2, #8160
	cmp	r1, r2
	bhi	.L174
	ldr	r1, [fp, #8]
	sub	r1, r1, #32
	cmp	r1, r2
	bhi	.L174
	cmp	r6, #0
	beq	.L247
	ldr	ip, .L256
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
	ldrge	r3, .L256+4
	bge	.L245
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
	beq	.L248
	cmp	r9, #17
	beq	.L249
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
	blt	.L216
	ldr	r4, .L256+8
	mov	r3, #0
	str	r3, [fp, #-76]
	str	r3, [fp, #-80]
.L209:
	ldr	r3, [r4, r10, asl #2]
	ldr	r3, [r3, #1208]
	cmp	r3, #1
	movne	r1, #0
	movne	r0, r1
	movne	r3, r1
	beq	.L250
.L182:
	ldr	ip, [fp, #20]
	str	r0, [r6, #12]
	cmp	ip, #1
	str	r1, [r6, #16]
	beq	.L251
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
.L184:
	ldr	r1, [fp, #24]
	cmp	r1, #0
	blt	.L185
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
	beq	.L252
	ldr	r1, [fp, #20]
	add	r10, r10, #15
	bic	r10, r10, #15
	add	r0, r0, #15
	cmp	r1, #1
	add	r1, r10, #255
	bic	r0, r0, #15
	bic	r1, r1, #255
	beq	.L253
	ldr	lr, .L256+8
	ldr	ip, [fp, #24]
	ldr	lr, [lr, ip, asl #2]
	ldr	lr, [lr, #1208]
	cmp	lr, #1
	beq	.L189
	adds	lr, r0, #63
	ldr	ip, [fp, #-100]
	addmi	lr, r0, #126
	mov	lr, lr, asr #6
.L190:
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
.L188:
	cmp	r4, r1
	ldrgt	r3, .L256+12
	bgt	.L245
	ldr	r10, [fp, #24]
.L185:
	ldr	r1, [fp, #-72]
	mul	r7, r7, r1
	sub	r1, r9, #16
	cmp	r1, #1
	add	r1, r7, r3
	str	r1, [r6, #36]
	bls	.L254
	ldr	r3, [fp, #16]
	cmp	r3, #0
	beq	.L194
	cmp	r9, #3
	cmpne	r9, #0
	strne	r2, [fp, #-72]
	beq	.L192
.L244:
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
	beq	.L193
	ldr	lr, [r6, #60]
	mov	ip, r6
	mov	r0, r2
	mov	r3, #0
.L198:
	add	r3, r3, #1
	str	r0, [ip, #464]
	cmp	r1, r3
	add	r0, r0, r4
	add	ip, ip, #12
	bne	.L198
	ldr	r3, [fp, #20]
	cmp	r3, #1
	add	r3, r1, lr
	str	r3, [r6, #60]
	beq	.L255
	ldr	r3, [fp, #-84]
	mla	r4, r1, r4, r3
	add	r3, r4, r5
.L212:
	add	r0, r6, #76
	mov	r2, #0
.L202:
	add	r2, r2, #1
	str	r3, [r0, #4]!
	cmp	r2, r1
	add	r3, r3, #32
	bne	.L202
.L201:
	ldr	ip, [r6, #56]
	add	r4, r4, r1, lsl #5
	add	r5, r4, r5
	cmp	ip, #0
	beq	.L207
	ldr	lr, [r6, #64]
	mov	r0, r6
	mov	r2, r5
	mov	r3, #0
.L206:
	add	r3, r3, #1
	str	r2, [r0, #208]
	cmp	ip, r3
	add	r2, r2, r8
	add	r0, r0, #8
	bne	.L206
	add	r3, ip, lr
	str	r3, [r6, #64]
.L207:
	mla	r8, ip, r8, r4
	cmp	r10, #0
	str	r8, [r6]
	blt	.L205
	ldr	r3, .L256+8
	ldr	r3, [r3, r10, asl #2]
	cmp	r3, #0
	beq	.L205
	cmp	r1, #0
	add	r5, r8, r5
	beq	.L205
	mov	r2, r6
	mov	r3, #0
.L208:
	add	r3, r3, #1
	str	r5, [r2, #848]
	cmp	r3, r1
	add	r5, r5, #4096
	add	r2, r2, #12
	bne	.L208
.L205:
	mov	r0, #0
	add	r8, r8, r1, lsl #12
	str	r8, [r6]
.L243:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L254:
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
	bne	.L192
.L194:
	mov	r3, #0
	str	r3, [r6, #48]
.L193:
	ldr	r3, .L256+16
.L245:
	ldr	r2, .L256+20
	mov	r0, #0
	ldr	r1, .L256+24
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L192:
	str	r2, [fp, #-72]
	ldr	r3, [fp, #16]
	b	.L244
.L248:
	ldr	r3, [fp, #4]
	cmp	r10, #0
	add	r7, r3, #255
	bic	r7, r7, #255
	blt	.L179
	ldr	r4, .L256+8
	movw	r0, #18072
	movt	r0, 7
	str	r2, [fp, #-72]
	ldr	r3, [r4, r10, asl #2]
	add	r0, r3, r0
	bl	IsMain10Profile
	ldr	r2, [fp, #-72]
	cmp	r0, #0
	beq	.L213
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
	b	.L180
.L251:
	ldr	r1, [fp, #-92]
	mov	r4, r1, asl #4
	mul	r4, r7, r4
	add	r4, r4, r4, lsl #1
	b	.L184
.L255:
	ldr	r3, .L256+28
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L200
	str	r2, [fp, #-56]
	mov	r3, #12
	str	r1, [fp, #-48]
	sub	r2, fp, #56
	mov	r1, #128
	str	r4, [fp, #-52]
	mov	r0, r10
	blx	r7
	ldr	r1, [r6, #48]
.L200:
	ldr	r3, [fp, #-84]
	cmp	r1, #0
	mla	r4, r1, r4, r3
	add	r3, r4, r5
	bne	.L212
	b	.L201
.L249:
	ldr	r3, [fp, #4]
	cmp	r10, #0
	add	r7, r3, #255
	ldr	r3, [fp, #8]
	bic	r7, r7, #255
	add	r3, r3, #63
	bic	r3, r3, #63
	str	r3, [fp, #-72]
	blt	.L214
	ldr	r4, .L256+8
	ldr	r3, [r4, r10, asl #2]
	ldr	r3, [r3, #1572]
	cmp	r3, #8
	ble	.L215
	ldr	r1, [fp, #-72]
	cmp	r7, #0
	add	r3, r7, #3
	movge	r3, r7
	mov	r3, r3, asr #2
	str	r1, [fp, #-80]
	str	r3, [fp, #-76]
.L180:
	mov	r3, r7, asl #4
	str	r3, [r6, #4]
	mov	r3, r7, asl #3
	str	r3, [r6, #8]
	b	.L209
.L214:
	ldr	r3, [fp, #-72]
	str	r3, [fp, #8]
.L179:
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
	b	.L182
.L250:
	sub	r1, r9, #17
	ldr	r3, [fp, #4]
	clz	r1, r1
	mov	r1, r1, lsr #5
	cmp	r3, #1920
	orrgt	r1, r1, #1
	cmp	r1, #0
	moveq	r0, r1
	moveq	r3, r1
	beq	.L182
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
	b	.L182
.L253:
	mul	r1, r0, r1
	add	r1, r1, r1, lsl #1
	b	.L188
.L216:
	mov	r1, #0
	str	r1, [fp, #-76]
	mov	r0, r1
	str	r1, [fp, #-80]
	mov	r3, r1
	b	.L182
.L189:
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
	b	.L190
.L213:
	ldr	r1, [fp, #8]
	str	r0, [fp, #-80]
	str	r0, [fp, #-76]
	str	r1, [fp, #-72]
	b	.L180
.L215:
	mov	r3, #0
	str	r3, [fp, #-80]
	str	r3, [fp, #-76]
	b	.L180
.L174:
	ldr	r3, .L256+32
	b	.L245
.L246:
	mov	r0, r5
	ldr	r3, .L256+36
	ldr	r2, .L256+20
	ldr	r1, .L256+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L243
.L252:
	ldr	r1, .L256+40
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L243
.L247:
	mov	r0, r6
	ldr	r3, .L256+44
	ldr	r2, .L256+20
	ldr	r1, .L256+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L243
.L257:
	.align	2
.L256:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC22
	.word	s_pstVfmwChan
	.word	.LC24
	.word	.LC25
	.word	.LANCHOR0+176
	.word	.LC1
	.word	g_event_report
	.word	.LC6
	.word	.LC20
	.word	.LC23
	.word	.LC21
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_ArrangeMem_Specific, .-VDMHAL_V5R2C1_ArrangeMem_Specific
	.align	2
	.global	VDMHAL_V5R2C1_ArrangeMem
	.type	VDMHAL_V5R2C1_ArrangeMem, %function
VDMHAL_V5R2C1_ArrangeMem:
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
	beq	.L264
	cmp	r4, #0
	blt	.L265
	mov	r0, r4
	str	r3, [fp, #-52]
	str	r1, [fp, #-48]
	bl	VCTRL_GetVidStd
	ldr	r1, [fp, #-48]
	ldr	r3, [fp, #-52]
	cmp	r0, #22
	beq	.L268
	ldr	r2, .L270
	ldr	r2, [r2, r4, asl #2]
	ldr	r2, [r2, #1504]
	cmp	r2, #1
	beq	.L269
.L263:
	str	r3, [sp, #24]
	mov	r2, r9
	mov	r3, r1
	str	r4, [sp, #20]
	mov	r1, r0
	str	r8, [sp, #16]
	str	r10, [sp, #12]
	mov	r0, r4
	stmia	sp, {r5, r6, r7}
	bl	VDMHAL_V5R2C1_ArrangeMem_Specific
.L266:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L265:
	mov	r0, #22
	b	.L263
.L264:
	mov	r0, #16
	b	.L263
.L269:
	str	r3, [fp, #12]
	mov	r1, r0
	mov	r3, r6
	str	r8, [fp, #8]
	mov	r2, r5
	str	r7, [fp, #4]
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VDMHAL_V5R2C1_ArrangeMem_Normal
.L268:
	mvn	r2, #0
	ldr	r1, .L270+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L266
.L271:
	.align	2
.L270:
	.word	s_pstVfmwChan
	.word	.LC26
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_ArrangeMem, .-VDMHAL_V5R2C1_ArrangeMem
	.align	2
	.global	VDMHAL_V5R2C1_ResetVdm
	.type	VDMHAL_V5R2C1_ResetVdm, %function
VDMHAL_V5R2C1_ResetVdm:
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
	subs	r7, r0, #0
	mov	r0, #0
	ble	.L273
	mov	r3, r7
	str	r0, [sp]
	ldr	r2, .L287
	ldr	r1, .L287+4
	bl	dprint_vfmw
.L272:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L273:
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r2, r0, #0
	beq	.L285
	movw	r3, #1228
	ldr	r9, .L287+8
	mul	r3, r3, r7
	ldr	r5, .L287+12
	ldr	r2, [r5]
	ldr	r3, [r9, r3]
	ldr	r10, [r3, #36]
	ldr	r8, [r2, #120]
	tst	r8, #1
	beq	.L272
	ldr	r6, .L287+16
	mov	r3, #2
	bfi	r8, r3, #8, #2
	str	r8, [r2, #120]
	mov	r4, #0
	orr	r8, r8, #64
	ldr	r3, [r6, #112]
	blx	r3
	ldr	r3, [r5]
	str	r8, [r3, #120]
	b	.L277
.L286:
	add	r4, r4, #1
	cmp	r4, #1000
	beq	.L278
.L277:
	ldr	r3, [r6, #116]
	mov	r0, #30
	blx	r3
	ldr	r3, [r5]
	ldr	r3, [r3, #372]
	tst	r3, #4
	beq	.L286
	cmp	r4, #1000
	bge	.L278
	mov	r3, r7
	ldr	r2, .L287
	ldr	r1, .L287+20
	mov	r0, #0
	bl	dprint_vfmw
.L280:
	ldr	r2, [r5]
	bfc	r8, #6, #1
	ldr	r3, [r6, #112]
	str	r8, [r2, #120]
	bfc	r8, #8, #2
	blx	r3
	movw	r3, #1228
	mul	r7, r3, r7
	ldr	r3, [r5]
	str	r8, [r3, #120]
	ldr	r3, [r9, r7]
	str	r10, [r3, #36]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L278:
	mov	r3, r7
	ldr	r2, .L287
	ldr	r1, .L287+24
	mov	r0, #0
	bl	dprint_vfmw
	b	.L280
.L285:
	ldr	r1, .L287+28
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L288:
	.align	2
.L287:
	.word	.LANCHOR0+212
	.word	.LC27
	.word	g_HwMem
	.word	g_pstRegCrg
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC30
	.word	.LC29
	.word	.LC28
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_ResetVdm, .-VDMHAL_V5R2C1_ResetVdm
	.align	2
	.global	VDMHAL_V5R2C1_SetSmmuPageTableAddr
	.type	VDMHAL_V5R2C1_SetSmmuPageTableAddr, %function
VDMHAL_V5R2C1_SetSmmuPageTableAddr:
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
	ldr	r3, .L295
	mov	r4, r0
	ldr	r3, [r3, #196]
	cmp	r3, #0
	beq	.L289
	sub	r2, fp, #24
	sub	r1, fp, #28
	sub	r0, fp, #32
	blx	r3
	cmp	r4, #0
	bne	.L291
	ldr	r3, .L295+4
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-28]
	ldr	r3, [r3]
	ldr	r2, [fp, #-24]
	add	r3, r3, #61440
	str	r0, [r3, #524]
	str	r1, [r3, #772]
	str	r2, [r3, #776]
.L289:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L291:
	mov	r5, #1
	mov	r3, r4
	str	r5, [sp]
	mov	r0, #32
	ldr	r2, .L295+8
	ldr	r1, .L295+12
	bl	dprint_vfmw
	mov	r3, r4
	str	r5, [sp]
	mov	r0, #32
	ldr	r2, .L295+8
	ldr	r1, .L295+12
	bl	dprint_vfmw
	str	r5, [sp]
	mov	r3, r4
	ldr	r2, .L295+8
	ldr	r1, .L295+12
	mov	r0, #32
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L296:
	.align	2
.L295:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_HwMem
	.word	.LANCHOR0+236
	.word	.LC31
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_SetSmmuPageTableAddr, .-VDMHAL_V5R2C1_SetSmmuPageTableAddr
	.align	2
	.global	VDMHAL_V5R2C1_EnableSmmu
	.type	VDMHAL_V5R2C1_EnableSmmu, %function
VDMHAL_V5R2C1_EnableSmmu:
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
	ldr	r3, .L298
	mov	r2, #8
	movt	r2, 3
	ldr	r3, [r3]
	add	r3, r3, #61440
	str	r2, [r3]
	ldmfd	sp, {fp, sp, pc}
.L299:
	.align	2
.L298:
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_EnableSmmu, .-VDMHAL_V5R2C1_EnableSmmu
	.align	2
	.global	VDMHAL_V5R2C1_GlbResetX
	.type	VDMHAL_V5R2C1_GlbResetX, %function
VDMHAL_V5R2C1_GlbResetX:
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
	ldr	r5, .L312
	mov	r8, r0
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	ldr	r3, [r5]
	ldr	r7, [r3, #120]
	tst	r7, #1
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r6, .L312+4
	mov	r2, #2
	bfi	r7, r2, #8, #2
	str	r7, [r3, #120]
	mov	r4, #0
	orr	r7, r7, #16
	ldr	r3, [r6, #112]
	blx	r3
	ldr	r3, [r5]
	str	r7, [r3, #120]
	b	.L303
.L311:
	add	r4, r4, #1
	cmp	r4, #1000
	beq	.L304
.L303:
	ldr	r3, [r6, #116]
	mov	r0, #30
	blx	r3
	ldr	r3, [r5]
	ldr	r3, [r3, #372]
	tst	r3, #1
	beq	.L311
	cmp	r4, #1000
	bge	.L304
	mov	r3, r8
	ldr	r2, .L312+8
	ldr	r1, .L312+12
	mov	r0, #0
	bl	dprint_vfmw
.L306:
	ldr	r2, [r5]
	bfc	r7, #4, #1
	ldr	r3, [r6, #112]
	str	r7, [r2, #120]
	bfc	r7, #8, #2
	blx	r3
	ldr	r3, [r5]
	str	r7, [r3, #120]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L304:
	mov	r3, r8
	ldr	r2, .L312+8
	ldr	r1, .L312+16
	mov	r0, #0
	bl	dprint_vfmw
	b	.L306
.L313:
	.align	2
.L312:
	.word	g_pstRegCrg
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+272
	.word	.LC33
	.word	.LC32
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_GlbResetX, .-VDMHAL_V5R2C1_GlbResetX
	.align	2
	.global	VDMHAL_V5R2C1_GlbReset
	.type	VDMHAL_V5R2C1_GlbReset, %function
VDMHAL_V5R2C1_GlbReset:
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
	beq	.L316
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDMHAL_V5R2C1_GlbResetX
.L316:
	mov	r3, #0
	ldr	r2, .L317
	movt	r3, 63683
	ldr	r1, .L317+4
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L318:
	.align	2
.L317:
	.word	.LANCHOR0+296
	.word	.LC34
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_GlbReset, .-VDMHAL_V5R2C1_GlbReset
	.align	2
	.global	VDMHAL_V5R2C1_ClearIntState
	.type	VDMHAL_V5R2C1_ClearIntState, %function
VDMHAL_V5R2C1_ClearIntState:
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
	ldr	r7, .L335
	mov	r5, r0, asl #3
	mov	r8, r0, asl #6
	rsb	r3, r5, r8
	ldr	r2, .L335+4
	add	r3, r7, r3
	ldr	r3, [r3, #8]
	ldr	r3, [r2, r3, asl #2]
	cmp	r3, #0
	ldrne	r4, [r3, #1240]
	moveq	r4, r3
	cmp	r0, #0
	bgt	.L332
	movw	r6, #1228
	ldr	r9, .L335+8
	mul	r6, r6, r0
	ldr	r3, [r9, r6]
	cmp	r3, #0
	beq	.L333
.L323:
	cmp	r4, #1
	beq	.L334
.L330:
	mvn	r2, #0
	str	r2, [r3, #32]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L332:
	mov	r2, #0
	mov	r3, r0
	str	r2, [sp]
	mov	r0, r2
	ldr	r1, .L335+12
	ldr	r2, .L335+16
	bl	dprint_vfmw
.L319:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L334:
	rsb	r5, r5, r8
	add	r7, r7, r5
	ldr	r2, [r7, #44]
	cmp	r2, #1
	beq	.L330
	cmp	r2, #2
	ldr	r1, [r3, #28]
	mvneq	r2, #11
	streq	r2, [r3, #32]
	beq	.L319
	cmp	r2, #3
	mvneq	r2, #14
	streq	r2, [r3, #32]
	b	.L319
.L333:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	strne	r3, [r9, r6]
	bne	.L323
.L324:
	ldr	r1, .L335+20
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L336:
	.align	2
.L335:
	.word	g_VdmDrvParam
	.word	s_pstVfmwChan
	.word	g_HwMem
	.word	.LC27
	.word	.LANCHOR0+320
	.word	.LC35
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_ClearIntState, .-VDMHAL_V5R2C1_ClearIntState
	.align	2
	.global	VDMHAL_V5R2C1_ClearMMUIntState
	.type	VDMHAL_V5R2C1_ClearMMUIntState, %function
VDMHAL_V5R2C1_ClearMMUIntState:
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
	bgt	.L342
	movw	r2, #1228
	ldr	r5, .L344
	mul	r4, r2, r3
	ldr	r2, [r5, r4]
	cmp	r2, #0
	beq	.L343
.L340:
	add	r2, r2, #61440
	mov	r3, #7
	str	r3, [r2, #44]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L342:
	mov	r0, #0
	ldr	r2, .L344+4
	str	r0, [sp]
	ldr	r1, .L344+8
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L343:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r2, r0, #0
	strne	r2, [r5, r4]
	bne	.L340
.L341:
	ldr	r1, .L344+12
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L345:
	.align	2
.L344:
	.word	g_HwMem
	.word	.LANCHOR0+348
	.word	.LC27
	.word	.LC35
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_ClearMMUIntState, .-VDMHAL_V5R2C1_ClearMMUIntState
	.align	2
	.global	VDMHAL_V5R2C1_MaskInt
	.type	VDMHAL_V5R2C1_MaskInt, %function
VDMHAL_V5R2C1_MaskInt:
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
	bgt	.L351
	movw	r2, #1228
	ldr	r5, .L353
	mul	r4, r2, r3
	ldr	r3, [r5, r4]
	cmp	r3, #0
	beq	.L352
.L349:
	mvn	r2, #0
	str	r2, [r3, #36]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L351:
	mov	r0, #0
	ldr	r2, .L353+4
	str	r0, [sp]
	ldr	r1, .L353+8
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L352:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	strne	r3, [r5, r4]
	bne	.L349
.L350:
	ldr	r1, .L353+12
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L354:
	.align	2
.L353:
	.word	g_HwMem
	.word	.LANCHOR0+380
	.word	.LC27
	.word	.LC35
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_MaskInt, .-VDMHAL_V5R2C1_MaskInt
	.align	2
	.global	VDMHAL_V5R2C1_GetIntMaskCfg
	.type	VDMHAL_V5R2C1_GetIntMaskCfg, %function
VDMHAL_V5R2C1_GetIntMaskCfg:
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
	.size	VDMHAL_V5R2C1_GetIntMaskCfg, .-VDMHAL_V5R2C1_GetIntMaskCfg
	.align	2
	.global	VDMHAL_V5R2C1_EnableInt
	.type	VDMHAL_V5R2C1_EnableInt, %function
VDMHAL_V5R2C1_EnableInt:
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
	ldr	r2, .L369
	mov	r3, r0, asl #6
	ldr	r1, .L369+4
	sub	r3, r3, r0, asl #3
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	ldr	r3, [r1, r3, asl #2]
	cmp	r3, #0
	ldrne	r4, [r3, #1240]
	moveq	r4, r3
	cmp	r0, #0
	bgt	.L367
	movw	r5, #1228
	ldr	r6, .L369+8
	mul	r5, r5, r0
	ldr	r3, [r6, r5]
	cmp	r3, #0
	beq	.L368
.L362:
	cmp	r4, #1
	mvneq	r2, #5
	mvnne	r2, #1
	str	r2, [r3, #36]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L367:
	mov	r2, #0
	mov	r3, r0
	str	r2, [sp]
	mov	r0, r2
	ldr	r1, .L369+12
	ldr	r2, .L369+16
	bl	dprint_vfmw
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L368:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	strne	r3, [r6, r5]
	bne	.L362
.L363:
	ldr	r1, .L369+20
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	dprint_vfmw
.L370:
	.align	2
.L369:
	.word	g_VdmDrvParam
	.word	s_pstVfmwChan
	.word	g_HwMem
	.word	.LC27
	.word	.LANCHOR0+404
	.word	.LC35
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_EnableInt, .-VDMHAL_V5R2C1_EnableInt
	.align	2
	.global	VDMHAL_V5R2C1_CheckReg
	.type	VDMHAL_V5R2C1_CheckReg, %function
VDMHAL_V5R2C1_CheckReg:
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
	bgt	.L388
	movw	r4, #1228
	ldr	r6, .L390
	mul	r4, r4, r5
	ldr	r3, [r6, r4]
	cmp	r3, #0
	beq	.L389
.L374:
	sub	r2, r7, #1
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L380
.L382:
	.word	.L385
	.word	.L383
	.word	.L384
	.word	.L386
	.word	.L376
	.word	.L378
	.word	.L379
.L386:
	mov	r3, #40
.L381:
	movw	r1, #1228
	mul	r5, r1, r5
	ldr	r2, [r6, r5]
	ldr	r0, [r2, r3]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L385:
	mov	r3, #28
	b	.L381
.L384:
	mov	r3, #36
	b	.L381
.L383:
	mov	r3, #32
	b	.L381
.L379:
	movw	r3, #62272
	b	.L381
.L376:
	movw	r3, #61480
	b	.L381
.L378:
	movw	r3, #62304
	b	.L381
.L380:
	mov	r3, r7
	ldr	r2, .L390+4
	ldr	r1, .L390+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L389:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r8, r0, #0
	beq	.L375
	str	r8, [r6, r4]
	b	.L374
.L388:
	mov	r3, r5
	ldr	r2, .L390+4
	ldr	r1, .L390+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L375:
	ldr	r2, .L390+4
	ldr	r1, .L390+16
	bl	dprint_vfmw
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L391:
	.align	2
.L390:
	.word	g_HwMem
	.word	.LANCHOR0+428
	.word	.LC38
	.word	.LC36
	.word	.LC37
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_CheckReg, .-VDMHAL_V5R2C1_CheckReg
	.align	2
	.global	VDMHAL_V5R2C1_ReadMMUMask
	.type	VDMHAL_V5R2C1_ReadMMUMask, %function
VDMHAL_V5R2C1_ReadMMUMask:
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
	ble	.L395
	mov	r1, #1
	ldr	r2, .L396
	str	r1, [sp]
	mov	r0, #32
	ldr	r1, .L396+4
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L395:
	movw	r0, #1228
	ldr	r2, .L396+8
	mul	r3, r0, r3
	ldr	r3, [r2, r3]
	add	r3, r3, #61440
	ldr	r0, [r3, #32]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L397:
	.align	2
.L396:
	.word	.LANCHOR0+452
	.word	.LC39
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_ReadMMUMask, .-VDMHAL_V5R2C1_ReadMMUMask
	.align	2
	.global	VDMHAL_V5R2C1_WriteMMUMask
	.type	VDMHAL_V5R2C1_WriteMMUMask, %function
VDMHAL_V5R2C1_WriteMMUMask:
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
	ble	.L401
	mov	r1, #1
	ldr	r2, .L402
	str	r1, [sp]
	mov	r0, #32
	ldr	r1, .L402+4
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L401:
	movw	r1, #1228
	ldr	r2, .L402+8
	mul	r3, r1, r3
	ldr	r3, [r2, r3]
	add	r3, r3, #61440
	str	r0, [r3, #32]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L403:
	.align	2
.L402:
	.word	.LANCHOR0+480
	.word	.LC31
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_WriteMMUMask, .-VDMHAL_V5R2C1_WriteMMUMask
	.align	2
	.global	VDMHAL_V5R2C1_PrepareDec
	.type	VDMHAL_V5R2C1_PrepareDec, %function
VDMHAL_V5R2C1_PrepareDec:
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
	beq	.L423
	cmp	r2, #0
	bgt	.L424
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
	cmp	r4, #17
	ldrls	pc, [pc, r4, asl #2]
	b	.L406
.L409:
	.word	.L419
	.word	.L410
	.word	.L411
	.word	.L412
	.word	.L406
	.word	.L413
	.word	.L414
	.word	.L406
	.word	.L415
	.word	.L416
	.word	.L417
	.word	.L417
	.word	.L417
	.word	.L418
	.word	.L406
	.word	.L419
	.word	.L420
	.word	.L421
.L419:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	H264HAL_V5R2C1_StartDec
.L420:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	HEVCHAL_V5R2C1_StartDec
.L421:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VP9HAL_V5R2C1_StartDec
.L410:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VC1HAL_V5R2C1_StartDec
.L411:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MP4HAL_V5R2C1_StartDec
.L412:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MP2HAL_V5R2C1_StartDec
.L413:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	DIVX3HAL_V5R2C1_StartDec
.L414:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	AVSHAL_V5R2C1_StartDec
.L415:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	RV8HAL_V5R2C1_StartDec
.L416:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	RV9HAL_V5R2C1_StartDec
.L417:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VP6HAL_V5R2C1_StartDec
.L418:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VP8HAL_V5R2C1_StartDec
.L423:
	mov	r3, r7
	mov	r0, r7
	ldr	r2, .L425
	ldr	r1, .L425+4
	bl	dprint_vfmw
.L406:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L424:
	mov	r3, r2
	mov	r0, #0
	ldr	r2, .L425
	str	r0, [sp]
	ldr	r1, .L425+8
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L426:
	.align	2
.L425:
	.word	.LANCHOR0+508
	.word	.LC40
	.word	.LC27
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_PrepareDec, .-VDMHAL_V5R2C1_PrepareDec
	.align	2
	.global	VDMHAL_V5R2C1_IsVdmReady
	.type	VDMHAL_V5R2C1_IsVdmReady, %function
VDMHAL_V5R2C1_IsVdmReady:
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
	ldr	r3, .L434
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L432
	cmp	r0, #0
	ble	.L433
	mov	r3, r0
	mov	r1, #1
	ldr	r2, .L434+4
	mov	r0, #32
	str	r1, [sp]
	ldr	r1, .L434+8
	bl	dprint_vfmw
	mov	r0, #0
.L429:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L433:
	ldr	r0, [r3, #28]
	ubfx	r0, r0, #17, #1
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L432:
	mov	r0, r3
	ldr	r2, .L434+4
	ldr	r3, .L434+12
	ldr	r1, .L434+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L429
.L435:
	.align	2
.L434:
	.word	g_HwMem
	.word	.LANCHOR0+536
	.word	.LC39
	.word	.LC41
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_IsVdmReady, .-VDMHAL_V5R2C1_IsVdmReady
	.align	2
	.global	VDMHAL_V5R2C1_IsVdmRun
	.type	VDMHAL_V5R2C1_IsVdmRun, %function
VDMHAL_V5R2C1_IsVdmRun:
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
	ldr	r3, .L443
	ldr	r4, [r3, r2]
	cmp	r4, #0
	beq	.L441
	cmp	r0, #0
	ble	.L442
	mov	r3, r0
	mov	r4, #1
	ldr	r2, .L443+4
	mov	r0, #32
	str	r4, [sp]
	ldr	r1, .L443+8
	bl	dprint_vfmw
	mov	r0, r4
.L438:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L442:
	ldr	r0, [r4, #40]
	subs	r0, r0, #1
	movne	r0, #1
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L441:
	ldr	r1, .L443+12
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	b	.L438
.L444:
	.align	2
.L443:
	.word	g_HwMem
	.word	.LANCHOR0+564
	.word	.LC39
	.word	.LC42
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_IsVdmRun, .-VDMHAL_V5R2C1_IsVdmRun
	.align	2
	.global	VDMHAL_V5R2C1_IsVdhDecOver
	.type	VDMHAL_V5R2C1_IsVdhDecOver, %function
VDMHAL_V5R2C1_IsVdhDecOver:
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
	ldr	r3, .L455
	mul	r2, r2, r1
	mov	r4, r0
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L453
	bl	VDMHAL_V5R2C1_CheckReg
	cmp	r4, #2
	beq	.L450
	cmp	r4, #3
	beq	.L450
	cmp	r4, #1
	beq	.L454
	mov	r3, r4
	ldr	r2, .L455+4
	ldr	r1, .L455+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L450:
	and	r0, r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L454:
	ubfx	r0, r0, #17, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L453:
	mov	r0, r3
	ldr	r2, .L455+4
	ldr	r3, .L455+12
	ldr	r1, .L455+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L456:
	.align	2
.L455:
	.word	g_HwMem
	.word	.LANCHOR0+588
	.word	.LC38
	.word	.LC41
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_IsVdhDecOver, .-VDMHAL_V5R2C1_IsVdhDecOver
	.align	2
	.global	VDMHAL_V5R2C1_IsVdhPartDecOver
	.type	VDMHAL_V5R2C1_IsVdhPartDecOver, %function
VDMHAL_V5R2C1_IsVdhPartDecOver:
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
	ldr	r3, .L467
	mul	r2, r2, r1
	mov	r4, r0
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L465
	bl	VDMHAL_V5R2C1_CheckReg
	cmp	r4, #1
	beq	.L461
	cmp	r4, #2
	bne	.L466
	ubfx	r0, r0, #2, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L466:
	mov	r3, r4
	ldr	r2, .L467+4
	ldr	r1, .L467+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L461:
	ubfx	r0, r0, #19, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L465:
	mov	r0, r3
	ldr	r2, .L467+4
	ldr	r3, .L467+12
	ldr	r1, .L467+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L468:
	.align	2
.L467:
	.word	g_HwMem
	.word	.LANCHOR0+616
	.word	.LC38
	.word	.LC41
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_IsVdhPartDecOver, .-VDMHAL_V5R2C1_IsVdhPartDecOver
	.align	2
	.global	VDMHAL_V5R2C1_UpdateHardwareInfo
	.type	VDMHAL_V5R2C1_UpdateHardwareInfo, %function
VDMHAL_V5R2C1_UpdateHardwareInfo:
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
	bgt	.L470
	ldr	r2, .L504
	ldr	r4, [r2]
	cmp	r4, #1
	addne	r3, r2, #124
	bne	.L474
	b	.L471
.L498:
	cmp	r2, r3
	beq	.L497
.L474:
	ldr	r4, [r2, #4]!
	cmp	r4, #1
	bne	.L498
.L471:
	movw	r6, #1228
	ldr	r7, .L504+4
	mul	r6, r6, r5
	ldr	lr, [r7, r6]
	cmp	lr, #0
	beq	.L499
.L475:
	mov	r2, #180
	ldr	r1, .L504+8
	mul	r2, r2, r5
	mov	r3, r5, asl #6
	sub	r3, r3, r5, asl #3
	ldr	r0, [lr, #12]
	ldr	r6, .L504+12
	add	r3, r3, r1
	ldr	r1, [r3, #4]
	add	r3, r6, r2
	str	r0, [r6, r2]
	ldr	r2, [lr, #28]
	cmp	r1, #1
	str	r2, [r3, #4]
	beq	.L500
	cmp	r4, #1
	beq	.L501
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
	bne	.L480
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
.L480:
	mov	r0, #180
	add	r1, lr, #33024
	mul	r0, r0, r5
	add	r2, r0, #48
	add	r0, r0, #176
	add	r2, r6, r2
	add	r0, r6, r0
.L481:
	ldr	ip, [r1], #4
	str	ip, [r2, #4]!
	cmp	r2, r0
	bne	.L481
	cmp	r4, #0
	bne	.L502
	mov	r3, #180
	add	lr, lr, #32768
	mla	r5, r3, r5, r6
	ldr	r2, [lr, #384]
	ldr	r3, [lr, #388]
	mov	r0, r4
	str	r2, [r5, #48]
	str	r3, [r5, #44]
.L492:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L502:
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L497:
	mov	r4, #0
	b	.L471
.L500:
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
.L501:
	movw	r3, #1228
	ubfx	r8, r2, #0, #17
	mla	r3, r3, r5, r7
	ldr	r0, [r3, #40]
	bl	MEM_Phy2Vir
	subs	ip, r0, #0
	beq	.L503
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
	b	.L480
.L499:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	lr, r0, #0
	beq	.L476
	str	lr, [r7, r6]
	b	.L475
.L470:
	mov	r0, #0
	mov	r3, r5
	str	r0, [sp]
	ldr	r2, .L504+16
	ldr	r1, .L504+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L492
.L476:
	ldr	r1, .L504+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L492
.L503:
	ldr	r3, .L504+28
	ldr	r2, .L504+16
	ldr	r1, .L504+32
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L492
.L505:
	.align	2
.L504:
	.word	g_DSPState
	.word	g_HwMem
	.word	g_VdmDrvParam+48
	.word	g_BackUp
	.word	.LANCHOR0+648
	.word	.LC27
	.word	.LC35
	.word	.LC43
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_UpdateHardwareInfo, .-VDMHAL_V5R2C1_UpdateHardwareInfo
	.align	2
	.global	VDMHAL_V5R2C1_ReadMsgSlot
	.type	VDMHAL_V5R2C1_ReadMsgSlot, %function
VDMHAL_V5R2C1_ReadMsgSlot:
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
	beq	.L510
	cmp	r2, #800
	bhi	.L511
	ldr	r3, .L512
	mov	r2, r2, asl #2
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L511:
	mov	r0, r4
	ldr	r1, .L512+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L510:
	mov	r2, r0
	ldr	r1, .L512+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L513:
	.align	2
.L512:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC45
	.word	.LC44
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_ReadMsgSlot, .-VDMHAL_V5R2C1_ReadMsgSlot
	.align	2
	.global	VDMHAL_V5R2C1_WriteMsgSlot
	.type	VDMHAL_V5R2C1_WriteMsgSlot, %function
VDMHAL_V5R2C1_WriteMsgSlot:
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
	beq	.L515
	sub	r3, r2, #1
	cmp	r3, #255
	bhi	.L515
	ldr	r3, .L518
	mov	r2, r2, asl #2
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L515:
	ldr	r1, .L518+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L519:
	.align	2
.L518:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC46
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_WriteMsgSlot, .-VDMHAL_V5R2C1_WriteMsgSlot
	.global	__aeabi_uidiv
	.global	__aeabi_uidivmod
	.align	2
	.global	VDMHAL_V5R2C1_CfgRpMsg
	.type	VDMHAL_V5R2C1_CfgRpMsg, %function
VDMHAL_V5R2C1_CfgRpMsg:
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
	beq	.L559
	ldr	r2, [r8, #44]
	sub	r3, r2, #1
	cmp	r3, #199
	bhi	.L560
	ldr	r1, [r8, #28]
	ldr	r3, [r8, #64]
	ldrb	r2, [r8]	@ zero_extendqisi2
	ldr	r0, [r8, #32]
	mov	r1, r1, asl r3
	cmp	r2, #1
	add	r2, r1, #255
	bic	r2, r2, #255
	mov	r3, r0, asl r3
	movne	r1, #0
	beq	.L561
.L524:
	ldr	r0, [r8, #4]
	cmp	r0, #16
	beq	.L525
	add	r3, r3, #31
	mov	r0, #8
	bic	r3, r3, #31
	str	r0, [fp, #-80]
	mla	r3, r3, r2, r1
.L548:
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
	moveq	r2, r2, asl #4
	str	r2, [ip, #16]
	str	r1, [ip, #20]
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
	beq	.L562
.L530:
	cmp	r1, #1
	beq	.L546
.L568:
	ldr	r3, [fp, #-64]
	sub	r3, r3, #1
	uxth	r3, r3
.L547:
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
.L557:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L562:
	ldr	r3, [r8, #64]
	cmp	r3, #6
	moveq	r4, #2
	beq	.L531
	cmp	r3, #5
	moveq	r4, #4
	beq	.L531
	cmp	r3, #4
	moveq	r4, #8
	bne	.L563
.L531:
	ldr	r9, [r8, #44]
	cmp	r9, #0
	movle	r3, #0
	ldrle	r1, [r8, #56]
	strle	r3, [fp, #-64]
	ble	.L530
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
	b	.L534
.L566:
	ldrsh	r0, [r5, #74]
	mov	r1, r4
	sub	r0, r0, #1
	add	r0, r0, r4
	bl	__aeabi_uidiv
	mul	r3, r4, r0
	cmp	r7, r3
	str	r3, [fp, #-72]
	ldrgt	r7, [fp, #-88]
	bgt	.L537
.L536:
	add	r6, r6, #1
	cmp	r6, r9
	bge	.L564
.L545:
	cmp	r6, #199
	bgt	.L565
.L534:
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
	bgt	.L566
	ldr	r3, [fp, #-72]
	cmp	r7, r3
	movgt	r3, #0
	movle	r3, #1
	cmp	r6, #0
	moveq	r3, #0
	cmp	r3, #0
	bne	.L536
.L539:
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
	bgt	.L567
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
	blt	.L545
.L564:
	ldr	r8, [fp, #-56]
	ldr	r1, [r8, #56]
	cmp	r1, #1
	bne	.L568
.L546:
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
	b	.L547
.L540:
	bl	__aeabi_uidiv
	mov	r1, r4
	mul	r10, r4, r0
	ldrsh	r0, [r5, #80]
	bl	__aeabi_uidiv
	mul	r0, r4, r0
	cmp	r10, r0
	add	r3, r0, #1
	bhi	.L541
	cmp	r10, r3
	mov	r1, r4
	beq	.L541
	ldrsh	r0, [r5, #74]
	add	r0, r0, r7
	bl	__aeabi_uidiv
	mul	r0, r4, r0
	cmp	r10, r0
	bhi	.L569
.L541:
	cmp	r8, #198
	mov	r6, r8
	add	r5, r5, #4
	bgt	.L570
	ldrsh	r10, [r5, #78]
.L537:
	add	r8, r6, #1
	mov	r1, r4
	cmp	r8, r9
	add	r0, r7, r10
	blt	.L540
	ldr	r3, [fp, #-88]
	add	r0, r3, r10
	bl	__aeabi_uidiv
	mul	r7, r4, r0
	b	.L539
.L570:
	ldr	r3, [fp, #-56]
	mov	r1, r4
	add	r2, r3, r8, lsl #2
	ldrsh	r0, [r2, #78]
	sub	r0, r0, #1
	add	r0, r0, r4
	bl	__aeabi_uidiv
	mul	r7, r4, r0
	b	.L539
.L525:
	mov	r0, #10
	str	r0, [fp, #-80]
	mla	r3, r2, r3, r1
	b	.L548
.L561:
	add	r0, r1, #2032
	adds	ip, r3, #63
	add	r0, r0, #15
	addmi	ip, r3, #126
	add	r1, r1, #4080
	cmp	r0, #0
	add	r1, r1, #14
	movge	r1, r0
	mov	r0, ip, asr #6
	mov	r1, r1, asr #11
	mov	r0, r0, asl #5
	mov	r1, r1, asl #4
	mul	r1, r1, r0
	b	.L524
.L569:
	mov	r7, r10
	b	.L539
.L565:
	ldr	r8, [fp, #-56]
	mov	r0, #0
	ldr	r1, .L571
	movw	r3, #2105
	str	r6, [sp]
	ldr	r2, .L571+4
	str	r0, [fp, #-64]
	bl	dprint_vfmw
	ldr	r1, [r8, #56]
	b	.L530
.L563:
	ldr	r1, .L571+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r4, #1
	b	.L531
.L567:
	ldr	r8, [fp, #-56]
	mov	r1, #1
	str	r1, [r8, #56]
	b	.L546
.L560:
	ldr	r1, .L571+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L557
.L559:
	ldr	r3, .L571+16
	ldr	r2, .L571+20
	ldr	r1, .L571+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L557
.L572:
	.align	2
.L571:
	.word	.LC50
	.word	.LANCHOR0+708
	.word	.LC49
	.word	.LC48
	.word	.LC47
	.word	.LANCHOR0+684
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_CfgRpMsg, .-VDMHAL_V5R2C1_CfgRpMsg
	.align	2
	.global	VDMHAL_V5R2C1_CfgRpReg
	.type	VDMHAL_V5R2C1_CfgRpReg, %function
VDMHAL_V5R2C1_CfgRpReg:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #28)
	sub	sp, sp, #28
	subs	r6, r3, #0
	mov	r0, #0
	str	r0, [fp, #-32]
	bgt	.L607
	ldr	r3, [r1]
	cmp	r3, #0
	beq	.L608
.L576:
	ldr	r4, .L610
	ldr	r3, [r1, #48]
	ldrb	r2, [r4]	@ zero_extendqisi2
	bic	r3, r3, #15
	str	r3, [fp, #-32]
	cmp	r2, #1
	bne	.L609
	movw	r1, #1228
	ldr	r2, .L610+4
	mul	r1, r1, r6
	ldr	r1, [r2, r1]
	str	r3, [r1, #16]
.L579:
	movw	r3, #1228
	movw	r1, #53763
	mul	r3, r3, r6
	movt	r1, 8192
	ldr	r3, [r2, r3]
	str	r1, [r3, #12]
.L581:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #60]
.L583:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #64]
.L585:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #68]
.L587:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #72]
.L589:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #76]
.L591:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #80]
.L593:
	movw	r3, #1228
	movw	r1, #3075
	mul	r6, r3, r6
	mov	r0, #0
	movt	r1, 48
	ldr	r3, [r2, r6]
	str	r1, [r3, #84]
.L596:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L609:
	mov	r2, #16
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r2, [r4]	@ zero_extendqisi2
	movw	r3, #53763
	cmp	r2, #1
	movt	r3, 8192
	str	r3, [fp, #-32]
	ldreq	r2, .L610+4
	beq	.L579
	mov	r2, #12
	mov	r1, #2
	ldr	r0, [fp, #4]
	movw	r5, #3075
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	movt	r5, 48
	str	r5, [fp, #-32]
	cmp	r3, #1
	ldreq	r2, .L610+4
	beq	.L581
	mov	r3, r5
	mov	r2, #60
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L610+4
	beq	.L583
	mov	r3, r5
	mov	r2, #64
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L610+4
	beq	.L585
	mov	r3, r5
	mov	r2, #68
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L610+4
	beq	.L587
	mov	r3, r5
	mov	r2, #72
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L610+4
	beq	.L589
	mov	r3, r5
	mov	r2, #76
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L610+4
	beq	.L591
	mov	r3, r5
	mov	r2, #80
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L610+4
	beq	.L593
	ldr	r0, [fp, #4]
	mov	r3, r5
	mov	r2, #84
	mov	r1, #2
	bl	VDH_Record_RegData
	mov	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L608:
	mov	r0, #0
	str	r1, [fp, #-40]
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L577
	ldr	r1, [fp, #-40]
	str	r3, [r1]
	b	.L576
.L607:
	str	r0, [sp]
	ldr	r2, .L610+8
	ldr	r1, .L610+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L596
.L577:
	ldr	r1, .L610+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L596
.L611:
	.align	2
.L610:
	.word	g_HalDisable
	.word	g_HwMem
	.word	.LANCHOR0+732
	.word	.LC27
	.word	.LC35
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_CfgRpReg, .-VDMHAL_V5R2C1_CfgRpReg
	.align	2
	.global	VDMHAL_V5R2C1_MakeDecReport
	.type	VDMHAL_V5R2C1_MakeDecReport, %function
VDMHAL_V5R2C1_MakeDecReport:
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
	beq	.L641
	ldr	r5, [r3, #4]
	ldr	r8, [r3]
	cmp	r5, #0
	ldr	r6, [r3, #8]
	beq	.L642
	movw	r3, #1228
	ldr	r7, .L650
	mul	r3, r3, r6
	ldr	r0, [r7, r3]
	cmp	r0, #0
	beq	.L616
	ldr	r3, .L650+4
	ldr	r2, [r3]
	cmp	r2, #1
	addne	r1, r3, #124
	bne	.L619
	b	.L631
.L644:
	cmp	r3, r1
	beq	.L643
.L619:
	ldr	r2, [r3, #4]!
	cmp	r2, #1
	bne	.L644
.L631:
	mov	r4, r2
.L617:
	ldr	r3, .L650+8
	mov	r2, #824
	mov	r1, #0
	mov	r0, r5
	ldr	r3, [r3, #48]
	blx	r3
	movw	r3, #1228
	mla	r3, r3, r6, r7
	ldr	r1, .L650+12
	mov	r2, #180
	mla	r2, r2, r6, r1
	ldr	r3, [r3, #24]
	str	r3, [r5, #4]
	ldr	r3, [r2, #4]
	mov	r3, r3, lsr #17
	and	r2, r3, #3
	cmp	r2, #1
	moveq	r3, #0
	beq	.L620
	eor	r3, r3, #1
	and	r3, r3, #1
	cmp	r8, #3
	orrne	r3, r3, #1
.L620:
	mov	r2, #180
	str	r3, [r5]
	mla	r3, r2, r6, r1
	cmp	r8, #0
	cmpne	r8, #15
	ldr	r2, [r3, #4]
	ubfx	r2, r2, #0, #17
	str	r2, [r5, #12]
	beq	.L645
.L621:
	cmp	r2, #200
	bhi	.L646
.L623:
	movw	r3, #1228
	mla	r7, r3, r6, r7
	ldr	r8, [r7, #40]
	mov	r0, r8
	bl	MEM_Phy2Vir
	subs	r1, r0, #0
	beq	.L647
	mov	r9, #3200
	ldr	r7, .L650+16
	mul	r9, r9, r6
	ldr	r2, [r5, #12]
	add	r4, r7, r9
	mov	r2, r2, asl #2
	mov	r0, r4
	bl	VDMHAL_V5R2C1_ReadMsgSlot
	ldr	ip, [r5, #12]
	ldr	r3, [r7, r9]
	cmp	ip, #0
	mov	r3, r3, lsr #31
	movne	r0, r4
	str	r3, [r5, #16]
	movne	r2, #0
	movne	r3, r5
	beq	.L628
.L627:
	ldr	r1, [r0, #4]
	add	r2, r2, #1
	cmp	r2, ip
	add	r0, r0, #16
	add	r3, r3, #4
	strh	r1, [r3, #16]	@ movhi
	ldr	r1, [r0, #-8]
	strh	r1, [r3, #18]	@ movhi
	bne	.L627
.L628:
	mov	r0, #6
	bl	IsDprintTypeEnable
	cmp	r0, #0
	bne	.L648
.L614:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L645:
	cmp	r4, #1
	beq	.L649
	ldr	r1, .L650+20
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L621
	ldrb	r3, [r3, #19]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #2
	bne	.L621
	mov	r3, #1
	strh	r1, [r5, #20]	@ movhi
	mov	r0, r1
	strh	r1, [r5, #22]	@ movhi
	str	r3, [r5, #12]
	b	.L614
.L643:
	mov	r4, #0
	b	.L617
.L648:
	ldr	r2, [r5, #12]
	mov	r0, #6
	ldr	r1, .L650+24
	mov	r4, #0
	bl	dprint_vfmw
	mov	r2, r8
	ldr	r1, .L650+28
	mov	r0, #6
	bl	dprint_vfmw
	mov	r3, #3200
	mla	r6, r3, r6, r7
.L629:
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
	ldr	r1, .L650+32
	bl	dprint_vfmw
	ldr	r3, [r5, #12]
	mov	r3, r3, asl #2
	sub	r3, r3, #3
	cmp	r3, r4
	bhi	.L629
	ldr	r1, .L650+36
	mov	r0, #6
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L646:
	mov	r3, #200
	ldr	r1, .L650+40
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r5, #12]
	b	.L623
.L649:
	ldr	r3, [r3, #16]
	ubfx	r3, r3, #21, #2
	cmp	r3, #2
	bne	.L621
	mov	r3, #0
	str	r4, [r5, #12]
	strh	r3, [r5, #20]	@ movhi
	mov	r0, r3
	strh	r3, [r5, #22]	@ movhi
	b	.L614
.L647:
	ldr	r3, .L650+44
	ldr	r2, .L650+48
	ldr	r1, .L650+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L614
.L616:
	ldr	r3, .L650+56
	ldr	r2, .L650+48
	ldr	r1, .L650+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L614
.L642:
	mov	r0, r5
	ldr	r3, .L650+60
	ldr	r2, .L650+48
	ldr	r1, .L650+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L614
.L641:
	ldr	r3, .L650+64
	ldr	r2, .L650+48
	ldr	r1, .L650+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L614
.L651:
	.align	2
.L650:
	.word	g_HwMem
	.word	g_DSPState
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_BackUp
	.word	g_UpMsg
	.word	g_not_allow_H264FullPictureRepair_flag
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC53
	.word	.LC43
	.word	.LANCHOR0+756
	.word	.LC1
	.word	.LC41
	.word	.LC52
	.word	.LC51
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_MakeDecReport, .-VDMHAL_V5R2C1_MakeDecReport
	.align	2
	.global	VDMHAL_V5R2C1_PrepareRepair
	.type	VDMHAL_V5R2C1_PrepareRepair, %function
VDMHAL_V5R2C1_PrepareRepair:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 8
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
	ldr	r7, .L667
	movw	ip, #1752
	mov	r9, r1
	movw	r4, #1228
	ldr	r6, .L667+4
	mla	r1, ip, r3, r7
	cmp	r3, #0
	mul	r4, r4, r3
	mov	r5, r3
	mov	r8, r0
	add	r10, r4, r6
	str	r1, [fp, #-48]
	bgt	.L663
	ldr	r3, [r4, r6]
	cmp	r3, #0
	beq	.L664
.L655:
	cmp	r2, #0
	beq	.L665
	cmp	r2, #1
	movne	r0, #0
	beq	.L666
.L654:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L665:
	movw	r3, #1752
	mla	r7, r3, r5, r7
	ldr	r3, [r7, #44]
	cmp	r3, #0
	ble	.L658
	cmp	r8, #6
	bne	.L659
	ldrb	r3, [r9, #17]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r2, r3
	str	r2, [r7, #928]
.L659:
	ldr	r4, [fp, #-48]
	mov	r1, r9
	mov	r0, r8
	mov	r2, r4
	bl	VDMHAL_UpdateParam
	ldr	r3, [fp, #4]
	mov	r2, r9
	mov	r1, r10
	mov	r0, r8
	str	r3, [sp]
	mov	r3, r5
	bl	VDMHAL_V5R2C1_CfgRpReg
	mov	r2, r5
	mov	r1, r10
	mov	r0, r4
	bl	VDMHAL_V5R2C1_CfgRpMsg
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L666:
	cmp	r8, #6
	bne	.L661
	ldrb	r3, [r9, #17]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L661
	movw	r4, #1752
	ldr	r6, .L667
	mul	r4, r4, r5
	add	r7, r7, r4
	ldr	r3, [r7, #920]
	cmp	r3, #0
	ble	.L661
	ldr	r2, [fp, #-48]
	mov	r1, r9
	mov	r3, #2
	mov	r0, r8
	str	r3, [r7, #928]
	bl	VDMHAL_UpdateParam
	ldr	r3, [fp, #4]
	mov	r2, r9
	mov	r1, r10
	mov	r0, r8
	str	r3, [sp]
	mov	r3, r5
	bl	VDMHAL_V5R2C1_CfgRpReg
	add	r0, r4, #876
	add	r0, r6, r0
	mov	r2, r5
	mov	r1, r10
	bl	VDMHAL_V5R2C1_CfgRpMsg
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L664:
	mov	r0, #0
	str	r2, [fp, #-52]
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L656
	str	r3, [r4, r6]
	ldr	r2, [fp, #-52]
	b	.L655
.L663:
	mov	r0, #0
	ldr	r2, .L667+8
	str	r0, [sp]
	ldr	r1, .L667+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L654
.L661:
	ldr	r1, .L667+16
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	b	.L654
.L658:
	mov	r0, r2
	ldr	r1, .L667+20
	str	r2, [fp, #-48]
	bl	dprint_vfmw
	ldr	r2, [fp, #-48]
	mov	r0, r2
	b	.L654
.L656:
	ldr	r1, .L667+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L654
.L668:
	.align	2
.L667:
	.word	g_RepairParam
	.word	g_HwMem
	.word	.LANCHOR0+784
	.word	.LC27
	.word	.LC60
	.word	.LC59
	.word	.LC58
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_PrepareRepair, .-VDMHAL_V5R2C1_PrepareRepair
	.align	2
	.global	VDMHAL_V5R2C1_StartHwRepair
	.type	VDMHAL_V5R2C1_StartHwRepair, %function
VDMHAL_V5R2C1_StartHwRepair:
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
	ldr	r6, .L699
	mov	r5, r0
	mov	r4, r1
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L693
	cmp	r0, #0
	ble	.L694
	str	r3, [sp]
	mov	r3, r0
	ldr	r2, .L699+4
	mov	r0, #32
	ldr	r1, .L699+8
	bl	dprint_vfmw
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L695
.L677:
	mov	r2, #1
	mov	r3, r5
	str	r2, [sp]
	mov	r0, #32
	ldr	r2, .L699+4
	ldr	r1, .L699+8
	bl	dprint_vfmw
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L689
.L672:
	cmp	r4, #0
	beq	.L696
	mov	r3, r5, asl #6
	ldr	r2, .L699+12
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
.L694:
	movw	r3, #1228
	ldr	r4, .L699+16
	mul	r3, r3, r0
	mov	r2, #67108864
	ldr	r3, [r4, r3]
	str	r2, [r3, #8]
.L675:
	movw	r3, #1228
	ldr	r2, .L699+20
	mul	r3, r3, r5
	mvn	r1, #1
	ldr	r3, [r4, r3]
	str	r1, [r3, #36]
	ldr	r3, [r2, #112]
	blx	r3
.L684:
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
.L669:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L693:
	mov	r3, #67108864
	mov	r2, #8
	mov	r1, #2
	mov	r0, r4
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L697
	cmp	r5, #0
	ldrle	r4, .L699+16
	bgt	.L677
	b	.L675
.L697:
	mvn	r3, #1
	mov	r2, #36
	mov	r1, #2
	mov	r0, r4
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L672
	ldr	r3, .L699+20
	ldr	r3, [r3, #112]
	blx	r3
	cmp	r5, #0
	ble	.L698
.L681:
	mov	r4, #1
	mov	r3, r5
	str	r4, [sp]
	mov	r0, #32
	ldr	r2, .L699+24
	ldr	r1, .L699+8
	bl	dprint_vfmw
	mov	r3, r5
	str	r4, [sp]
	mov	r0, #32
	ldr	r2, .L699+24
	ldr	r1, .L699+8
	bl	dprint_vfmw
	str	r4, [sp]
	mov	r3, r5
	ldr	r2, .L699+24
	ldr	r1, .L699+8
	mov	r0, #32
	bl	dprint_vfmw
	b	.L669
.L695:
	mvn	r3, #1
	mov	r2, #36
	mov	r1, #2
	mov	r0, r4
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L672
.L689:
	ldr	r3, .L699+20
	ldr	r3, [r3, #112]
	blx	r3
	b	.L681
.L696:
	mov	r3, r4
	mov	r0, r4
	ldr	r2, .L699+24
	ldr	r1, .L699+28
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	dprint_vfmw
.L698:
	ldr	r4, .L699+16
	b	.L684
.L700:
	.align	2
.L699:
	.word	g_HalDisable
	.word	.LANCHOR0+812
	.word	.LC31
	.word	g_VdmDrvParam
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+828
	.word	.LC61
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_StartHwRepair, .-VDMHAL_V5R2C1_StartHwRepair
	.align	2
	.global	VDMHAL_V5R2C1_CalVdhClkSkip
	.type	VDMHAL_V5R2C1_CalVdhClkSkip, %function
VDMHAL_V5R2C1_CalVdhClkSkip:
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
	ldr	r9, .L731
	ldr	r10, [r9, #128]
	cmp	r10, #0
	blt	.L723
	mov	r7, #0
	add	r4, r9, #128
	mov	r6, r7
	mov	r5, r7
	add	r9, r9, #252
	mov	r8, #30
	b	.L703
.L730:
	mov	r3, r10
	ldr	r2, .L731+4
	ldr	r1, .L731+8
	mov	r0, #1
	bl	dprint_vfmw
.L705:
	cmp	r4, r9
	beq	.L729
.L722:
	ldr	r10, [r4, #4]!
	cmp	r10, #0
	blt	.L729
.L703:
	mov	r0, r10
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	bne	.L730
	mov	r0, r10
	bl	FSP_GetInst
	cmp	r0, #0
	beq	.L706
	ldr	r1, [r0, #40]
	ldr	r2, [r0, #44]
	adds	r5, r1, #15
	addmi	r5, r1, #30
	adds	r6, r2, #15
	addmi	r6, r2, #30
	mov	r5, r5, asr #4
	mov	r6, r6, asr #4
.L706:
	ldr	r3, .L731+12
	mov	r0, r10
	ldr	r2, [r3, r10, asl #2]
	ldr	r3, [r2, #1600]
	cmp	r3, #30
	movgt	r8, r3
	bl	VCTRL_GetVidStd
	cmp	r0, #17
	ldrls	pc, [pc, r0, asl #2]
	b	.L724
.L709:
	.word	.L718
	.word	.L718
	.word	.L718
	.word	.L718
	.word	.L724
	.word	.L718
	.word	.L718
	.word	.L724
	.word	.L718
	.word	.L718
	.word	.L718
	.word	.L718
	.word	.L718
	.word	.L718
	.word	.L724
	.word	.L719
	.word	.L718
	.word	.L718
.L718:
	mul	r7, r6, r5
	cmp	r4, r9
	mul	r7, r7, r8
	bne	.L722
.L729:
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
.L719:
	mul	r7, r6, r5
	mul	r7, r7, r8
	mov	r7, r7, asl #1
	b	.L705
.L724:
	mov	r7, #0
	b	.L705
.L723:
	mov	r0, #25
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L732:
	.align	2
.L731:
	.word	g_ChanCtx
	.word	.LANCHOR0+856
	.word	.LC62
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_CalVdhClkSkip, .-VDMHAL_V5R2C1_CalVdhClkSkip
	.align	2
	.global	VDMHAL_V5R2C1_GetVdmClk
	.type	VDMHAL_V5R2C1_GetVdmClk, %function
VDMHAL_V5R2C1_GetVdmClk:
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
	ldr	r2, .L741
	sub	r0, r3, r0, asl #3
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L734
.L736:
	.word	.L735
	.word	.L734
	.word	.L738
	.word	.L739
.L734:
	add	r3, r2, r0
	mov	r1, #500
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L738:
	add	r3, r2, r0
	mov	r1, #540
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L739:
	add	r3, r2, r0
	mov	r1, #600
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L735:
	add	r3, r2, r0
	movw	r1, #450
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L742:
	.align	2
.L741:
	.word	g_VdmDrvParam
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_GetVdmClk, .-VDMHAL_V5R2C1_GetVdmClk
	.align	2
	.global	VDMHAL_V5R2C1_StartHwDecode
	.type	VDMHAL_V5R2C1_StartHwDecode, %function
VDMHAL_V5R2C1_StartHwDecode:
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
	subs	r5, r0, #0
	mov	r4, r1
	bgt	.L783
	mov	r3, r5, asl #6
	ldr	r6, .L789
	sub	r3, r3, r5, asl #3
	ldr	r8, .L789+4
	add	r3, r6, r3
	ldr	r9, [r3, #8]
	ldr	r3, [r8, r9, asl #2]
	ldr	r2, [r3, #1588]
	cmp	r2, #1
	beq	.L784
.L767:
	mov	r10, #0
.L746:
	ldr	r7, .L789+8
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L785
	ldr	r3, .L789+12
	ldr	r2, [r3]
	ldr	r3, [r2, #120]
	ubfx	r1, r3, #8, #2
	cmp	r10, r1
	bfine	r3, r10, #8, #2
	strne	r3, [r2, #120]
.L750:
	mov	r1, r10
	mov	r0, r5
	bl	VDMHAL_V5R2C1_GetVdmClk
	ldrb	r2, [r7]	@ zero_extendqisi2
	ldr	r3, [r8, r9, asl #2]
	cmp	r2, #1
	ldr	r8, [r3, #1240]
	bne	.L786
	ldr	r3, .L789+12
	ldr	r2, [r3]
	ldr	r3, [r2, #120]
	bfc	r3, #12, #5
	bfc	r3, #17, #1
	str	r3, [r2, #120]
	ldr	r3, [r2, #120]
	orr	r3, r3, #131072
	str	r3, [r2, #120]
.L753:
	mov	r2, r5
	mov	r3, r4
	mov	r1, #3
	mov	r0, #12
	bl	SCD_ConfigReg
	ldrb	r2, [r7]	@ zero_extendqisi2
	ldr	r10, .L789+8
	cmp	r2, #1
	bne	.L787
	movw	r2, #1228
	ldr	r3, .L789+16
	mul	r2, r2, r5
	ldr	r4, .L789+20
	ldr	r1, [r3]
	movw	r3, #43690
	bfi	r3, r3, #16, #16
	cmp	r1, #1
	ldr	r2, [r4, r2]
	moveq	r1, #15
	movne	r1, #0
	str	r3, [r2, #156]
.L755:
	movw	r2, #1228
	cmp	r8, #1
	mul	r2, r2, r5
	mvneq	r3, #5
	mvnne	r3, #1
	ldr	r2, [r4, r2]
	add	r2, r2, #61440
	str	r1, [r2, #32]
.L757:
	movw	r2, #1228
	mul	r2, r2, r5
	ldr	r2, [r4, r2]
	str	r3, [r2, #36]
.L759:
	ldr	r7, .L789+24
	mov	r0, #30
	ldr	r3, [r7, #116]
	blx	r3
	ldr	r3, [r7, #112]
	blx	r3
	movw	r3, #1228
	mul	r3, r3, r5
	mov	r1, #56
	mov	r2, #0
	mov	lr, #1
	mla	r5, r1, r5, r6
	ldr	ip, .L789+28
	mov	r1, #4
	ldr	r0, [r4, r3]
	str	r2, [r0]
	ldr	r0, [r4, r3]
	str	lr, [r0]
	ldr	r3, [r4, r3]
	str	r2, [r3]
	ldr	r0, [r5, #8]
	ldr	r2, [ip, r0, asl #2]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VDEC_Lowdelay_Event_Time
.L785:
	mov	r2, #0
	mov	r3, r10
	mov	r1, r2
	mov	r0, r4
	bl	VDH_Record_RegData
	b	.L750
.L783:
	mov	r0, #0
	mov	r3, r5
	str	r0, [sp]
	ldr	r2, .L789+32
	ldr	r1, .L789+36
	bl	dprint_vfmw
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L787:
	movw	r3, #43690
	mov	r1, #2
	mov	r2, #156
	movt	r3, 43690
	mov	r0, r4
	bl	VDH_Record_RegData
	ldr	r3, .L789+16
	ldrb	r2, [r10]	@ zero_extendqisi2
	ldr	r3, [r3]
	cmp	r3, #1
	moveq	r1, #15
	movne	r1, #0
	cmp	r2, #1
	ldreq	r4, .L789+20
	beq	.L755
	mov	r3, r1
	movw	r2, #61472
	mov	r0, r4
	mov	r1, #2
	bl	VDH_Record_RegData
	cmp	r8, #1
	ldrb	r2, [r7]	@ zero_extendqisi2
	mvneq	r3, #5
	mvnne	r3, #1
	cmp	r2, #1
	ldreq	r4, .L789+20
	beq	.L757
	mov	r0, r4
	mov	r2, #36
	mov	r1, #2
	bl	VDH_Record_RegData
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r4, .L789+20
	beq	.L759
	cmp	r4, #0
	beq	.L788
	mov	r3, #1
	str	r9, [r4, #8]
	strb	r5, [r4]
	mov	r0, r4
	str	r3, [r4, #4]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VDH_PostTask
.L786:
	mov	r3, #0
	mov	r2, #1
	mov	r1, r3
	mov	r0, r4
	bl	VDH_Record_RegData
	b	.L753
.L784:
	ldr	r3, [r3, #600]
	cmp	r3, #17
	bne	.L767
	ldr	r3, .L789+40
	ldr	r3, [r3, r9, asl #2]
	ldr	r2, [r3, #40]
	cmp	r2, #3840
	bge	.L747
	ldr	r3, [r3, #44]
	cmp	r3, #2160
	blt	.L767
.L747:
	ldr	r3, .L789+24
	movw	r0, #12320
	movt	r0, 63650
	mov	r1, #65536
	ldr	r3, [r3, #152]
	blx	r3
	ldr	r3, .L789+44
	ldr	r3, [r3]
	ldr	r3, [r3, #196]
	mov	r3, r3, lsr #24
	cmp	r3, #3
	beq	.L768
	cmp	r3, #2
	beq	.L769
	mov	r2, #221
	cmp	r3, #1
	mov	r1, r2
	movt	r2, 137
	movt	r1, 113
	moveq	r3, r2
	movne	r3, r1
.L748:
	str	r3, [r0]
	mov	r10, #2
	b	.L746
.L788:
	mov	r3, r4
	mov	r0, r4
	ldr	r2, .L789+32
	ldr	r1, .L789+48
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L768:
	mov	r3, #221
	movt	r3, 113
	b	.L748
.L769:
	mov	r3, #221
	movt	r3, 125
	b	.L748
.L790:
	.align	2
.L789:
	.word	g_VdmDrvParam
	.word	s_pstVfmwChan
	.word	g_HalDisable
	.word	g_pstRegCrg
	.word	mask_mmu_err_int
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_LowDelaySeqIndex
	.word	.LANCHOR0+884
	.word	.LC27
	.word	s_pFspInst
	.word	g_pstRegSysCtrl
	.word	.LC61
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_StartHwDecode, .-VDMHAL_V5R2C1_StartHwDecode
	.align	2
	.global	VDMHAL_V5R2C1_GetCharacter
	.type	VDMHAL_V5R2C1_GetCharacter, %function
VDMHAL_V5R2C1_GetCharacter:
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
	ldr	r1, .L792
	mov	r0, #15
	ldr	r3, .L792+4
	mov	r2, #4
	str	r0, [r1]
	str	r2, [r3]
	ldmfd	sp, {fp, sp, pc}
.L793:
	.align	2
.L792:
	.word	g_VdmCharacter
	.word	g_eVdmVersion
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_GetCharacter, .-VDMHAL_V5R2C1_GetCharacter
	.align	2
	.global	VDMHAL_V5R2C1_WriteBigTitle1DYuv
	.type	VDMHAL_V5R2C1_WriteBigTitle1DYuv, %function
VDMHAL_V5R2C1_WriteBigTitle1DYuv:
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
	beq	.L795
	cmp	ip, #2
	moveq	r4, #1
	movne	r4, #2
.L795:
	ldr	r3, [fp, #-108]
	cmp	r3, #0
	beq	.L794
	mov	r3, #0
	mov	r2, #4194304
	mov	r1, r3
	str	r3, [sp]
	ldr	r0, .L884
	sub	r3, fp, #92
	bl	MEM_AllocMemBlock
	subs	r1, r0, #0
	bne	.L798
	str	r1, [sp]
	mov	r2, #4194304
	sub	r3, fp, #68
	ldr	r0, .L884+4
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	bne	.L798
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
	bne	.L799
	ldr	r3, [fp, #-100]
	mov	r1, r5, lsr #1
	ldr	r2, [fp, #-64]
	cmp	r3, #0
	ldr	r6, .L884+8
	mov	r3, r3, lsr #1
	ldr	r7, [fp, #-88]
	str	r2, [fp, #-120]
	movne	r10, r0
	add	r2, r2, #2097152
	str	r1, [fp, #-124]
	str	r2, [fp, #-128]
	str	r3, [fp, #-112]
	strne	r10, [fp, #-96]
	beq	.L801
.L800:
	cmp	r5, #0
	beq	.L803
	ldr	r2, [fp, #-96]
	mov	r4, #0
	and	r9, r2, #15
	mov	r3, r2, lsr #4
	ldr	r2, [fp, #-104]
	mul	r3, r2, r3
	add	r9, r3, r9, lsl #8
.L802:
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
	bhi	.L802
.L803:
	ldr	r3, [fp, #-96]
	add	r10, r10, r5
	ldr	r2, [fp, #-100]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	cmp	r2, r3
	bne	.L800
.L801:
	ldr	r3, [fp, #-100]
	mov	r0, r7
	ldr	r2, [fp, #-108]
	mul	r1, r5, r3
	ldr	r3, [r6, #44]
	blx	r3
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	beq	.L804
	ldr	r3, [fp, #-104]
	mov	r9, #0
	ldr	r10, [fp, #-116]
	str	r9, [fp, #-96]
	mov	r3, r3, asr #1
	str	r3, [fp, #-100]
.L805:
	cmp	r5, #0
	beq	.L808
	ldr	r2, [fp, #-96]
	mov	r4, #0
	and	r8, r2, #7
	mov	r3, r2, lsr #3
	ldr	r2, [fp, #-100]
	mul	r3, r2, r3
	add	r8, r3, r8, lsl #8
.L806:
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
	bhi	.L806
.L808:
	ldr	r3, [fp, #-96]
	add	r9, r9, r5
	ldr	r2, [fp, #-112]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	cmp	r3, r2
	bne	.L805
	ldr	r3, [fp, #4]
	cmp	r3, #1
	beq	.L882
.L810:
	ldr	r3, [fp, #4]
	cmp	r3, #0
	bne	.L811
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
.L811:
	ldr	r3, [fp, #-124]
.L881:
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
.L794:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L798:
	ldr	r1, .L884+12
	mov	r0, #1
	bl	dprint_vfmw
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L799:
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
	ldr	r6, .L884+8
	ldr	r7, [fp, #-88]
	strhi	r3, [fp, #-96]
	bls	.L818
.L820:
	cmp	r5, #0
	beq	.L821
	ldr	r2, [fp, #-96]
	mov	r4, #0
	and	r9, r2, #15
	mov	r3, r2, lsr #4
	mov	r10, r2, lsr #1
	ldr	r2, [fp, #-104]
	mul	r10, r5, r10
	mul	r3, r2, r3
	add	r9, r3, r9, lsl #8
.L819:
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
	bhi	.L819
.L821:
	ldr	r3, [fp, #-96]
	ldr	r2, [fp, #-100]
	add	r3, r3, #2
	str	r3, [fp, #-96]
	cmp	r2, r3
	bhi	.L820
.L818:
	ldr	r3, [fp, #-100]
	mov	r0, r7
	ldr	r2, [fp, #-108]
	mul	r1, r5, r3
	ldr	r3, [r6, #44]
	mov	r1, r1, lsr #1
	blx	r3
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	beq	.L822
	ldr	r3, [fp, #-104]
	mov	r9, #0
	ldr	r10, [fp, #-116]
	str	r9, [fp, #-96]
	mov	r3, r3, asr #1
	str	r3, [fp, #-100]
.L823:
	cmp	r5, #0
	beq	.L826
	ldr	r2, [fp, #-96]
	mov	r4, #0
	and	r8, r2, #7
	mov	r3, r2, lsr #3
	ldr	r2, [fp, #-100]
	mul	r3, r2, r3
	add	r8, r3, r8, lsl #8
.L824:
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
	bhi	.L824
.L826:
	ldr	r3, [fp, #-96]
	add	r9, r9, r5
	ldr	r2, [fp, #-112]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	cmp	r3, r2
	bne	.L823
	ldr	r3, [fp, #4]
	cmp	r3, #1
	beq	.L883
	ldr	r3, [fp, #4]
	cmp	r3, #0
	bne	.L829
	ldr	r2, [fp, #-112]
	ldr	r3, [fp, #-124]
	cmp	r2, r3
	bls	.L834
.L835:
	add	r3, r3, #2
	cmp	r2, r3
	bhi	.L835
.L834:
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
.L829:
	ldr	r3, [fp, #-132]
	b	.L881
.L882:
	ldr	r3, [fp, #-120]
	add	r7, r7, #1
	ldr	r4, [fp, #-124]
	mov	lr, #0
	ldr	r8, [fp, #-112]
.L812:
	cmp	r4, #0
	moveq	ip, r3
	beq	.L815
	sub	r1, r3, #-67108863
	add	ip, r3, r4
	sub	r1, r1, #65011712
	mov	r2, r7
.L813:
	ldrb	r0, [r2, #-1]	@ zero_extendqisi2
	strb	r0, [r1, #1]!
	ldrb	r0, [r2], #2	@ zero_extendqisi2
	strb	r0, [r3], #1
	cmp	r3, ip
	bne	.L813
.L815:
	add	lr, lr, #1
	mov	r3, ip
	cmp	lr, r8
	add	r7, r7, r5
	bne	.L812
	b	.L811
.L883:
	ldr	r3, [fp, #-124]
	mov	r4, #0
	ldr	lr, [fp, #-120]
	ldr	ip, [fp, #-132]
	mla	r3, r5, r3, r7
	ldr	r7, [fp, #-112]
	mov	r5, r5, asl #1
	add	r3, r3, #1
.L830:
	cmp	ip, #0
	beq	.L833
	mov	r2, r4, lsr #1
	mov	r1, r3
	mul	r2, ip, r2
	sub	r0, r2, #-67108863
	add	r9, r2, ip
	sub	r0, r0, #65011712
	add	r9, lr, r9
	add	r0, lr, r0
	add	r2, lr, r2
.L831:
	ldrb	r8, [r1, #-1]	@ zero_extendqisi2
	strb	r8, [r0, #1]!
	ldrb	r8, [r1], #2	@ zero_extendqisi2
	strb	r8, [r2], #1
	cmp	r2, r9
	bne	.L831
.L833:
	add	r4, r4, #2
	add	r3, r3, r5
	cmp	r7, r4
	bhi	.L830
	b	.L829
.L804:
	ldr	r3, [fp, #4]
	cmp	r3, #1
	bne	.L810
	b	.L811
.L822:
	ldr	r3, [fp, #4]
	cmp	r3, #1
	beq	.L829
	cmp	r3, #0
	beq	.L834
	b	.L829
.L885:
	.align	2
.L884:
	.word	.LC63
	.word	.LC65
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC64
	UNWIND(.fnend)
	.size	VDMHAL_V5R2C1_WriteBigTitle1DYuv, .-VDMHAL_V5R2C1_WriteBigTitle1DYuv
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
	ldr	ip, .L893
	mov	lr, r2
	ldrb	r2, [ip]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L892
	cmp	r0, #0
	bne	.L888
	ldr	r3, .L893+4
	ldr	r3, [r3]
	ldr	r2, [r3, #120]
	ubfx	r0, r2, #8, #2
	cmp	r1, r0
	bfine	r2, r1, #8, #2
	strne	r2, [r3, #120]
	ldmfd	sp, {fp, sp, pc}
.L888:
	cmp	r0, #1
	ldmnefd	sp, {fp, sp, pc}
	ldr	r3, .L893+4
	ldr	r3, [r3]
	ldr	r2, [r3, #120]
	bfi	r2, r1, #12, #5
	bfc	r2, #17, #1
	str	r2, [r3, #120]
	ldr	r2, [r3, #120]
	orr	r2, r2, #131072
	str	r2, [r3, #120]
	ldmfd	sp, {fp, sp, pc}
.L892:
	mov	r3, r1
	mov	r2, r0
	mov	r1, #0
	mov	r0, lr
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDH_Record_RegData
.L894:
	.align	2
.L893:
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
	ldr	ip, .L901
	mov	lr, r3
	ldrb	r3, [ip]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L899
	cmp	r2, #0
	ble	.L900
	str	r3, [sp]
	mov	r0, #32
	mov	r3, r2
	ldr	r1, .L901+4
	ldr	r2, .L901+8
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L900:
	movw	r3, #1228
	ldr	ip, .L901+12
	mul	r2, r3, r2
	ldr	r3, [ip, r2]
	str	r1, [r3, r0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L899:
	mov	r3, r1
	mov	r2, r0
	mov	r1, #2
	mov	r0, lr
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDH_Record_RegData
.L902:
	.align	2
.L901:
	.word	g_HalDisable
	.word	.LC31
	.word	.LANCHOR0+812
	.word	g_HwMem
	UNWIND(.fnend)
	.size	MFDE_ConfigReg, .-MFDE_ConfigReg
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.20834, %object
	.size	__func__.20834, 22
__func__.20834:
	.ascii	"VDMHAL_V5R2C1_OpenHAL\000"
	.space	2
	.type	__func__.20908, %object
	.size	__func__.20908, 25
__func__.20908:
	.ascii	"VDMHAL_V5R2C1_CalcFsSize\000"
	.space	3
	.type	__func__.20934, %object
	.size	__func__.20934, 24
__func__.20934:
	.ascii	"VDMHAL_V5R2C1_CalcFsNum\000"
	.type	__func__.20977, %object
	.size	__func__.20977, 32
__func__.20977:
	.ascii	"VDMHAL_V5R2C1_ArrangeMem_Normal\000"
	.type	__FUNCTION__.20978, %object
	.size	__FUNCTION__.20978, 32
__FUNCTION__.20978:
	.ascii	"VDMHAL_V5R2C1_ArrangeMem_Normal\000"
	.type	__func__.20920, %object
	.size	__func__.20920, 33
__func__.20920:
	.ascii	"VDMHAL_V5R2C1_FillMemArrangeInfo\000"
	.space	3
	.type	__func__.21060, %object
	.size	__func__.21060, 34
__func__.21060:
	.ascii	"VDMHAL_V5R2C1_ArrangeMem_Specific\000"
	.space	2
	.type	__func__.21084, %object
	.size	__func__.21084, 23
__func__.21084:
	.ascii	"VDMHAL_V5R2C1_ResetVdm\000"
	.space	1
	.type	__func__.21094, %object
	.size	__func__.21094, 35
__func__.21094:
	.ascii	"VDMHAL_V5R2C1_SetSmmuPageTableAddr\000"
	.space	1
	.type	__func__.21118, %object
	.size	__func__.21118, 24
__func__.21118:
	.ascii	"VDMHAL_V5R2C1_GlbResetX\000"
	.type	__func__.21104, %object
	.size	__func__.21104, 23
__func__.21104:
	.ascii	"VDMHAL_V5R2C1_GlbReset\000"
	.space	1
	.type	__func__.21127, %object
	.size	__func__.21127, 28
__func__.21127:
	.ascii	"VDMHAL_V5R2C1_ClearIntState\000"
	.type	__func__.21133, %object
	.size	__func__.21133, 31
__func__.21133:
	.ascii	"VDMHAL_V5R2C1_ClearMMUIntState\000"
	.space	1
	.type	__func__.21139, %object
	.size	__func__.21139, 22
__func__.21139:
	.ascii	"VDMHAL_V5R2C1_MaskInt\000"
	.space	2
	.type	__func__.21152, %object
	.size	__func__.21152, 24
__func__.21152:
	.ascii	"VDMHAL_V5R2C1_EnableInt\000"
	.type	__func__.21161, %object
	.size	__func__.21161, 23
__func__.21161:
	.ascii	"VDMHAL_V5R2C1_CheckReg\000"
	.space	1
	.type	__func__.21175, %object
	.size	__func__.21175, 26
__func__.21175:
	.ascii	"VDMHAL_V5R2C1_ReadMMUMask\000"
	.space	2
	.type	__func__.21180, %object
	.size	__func__.21180, 27
__func__.21180:
	.ascii	"VDMHAL_V5R2C1_WriteMMUMask\000"
	.space	1
	.type	__func__.21211, %object
	.size	__func__.21211, 25
__func__.21211:
	.ascii	"VDMHAL_V5R2C1_PrepareDec\000"
	.space	3
	.type	__func__.21216, %object
	.size	__func__.21216, 25
__func__.21216:
	.ascii	"VDMHAL_V5R2C1_IsVdmReady\000"
	.space	3
	.type	__func__.21221, %object
	.size	__func__.21221, 23
__func__.21221:
	.ascii	"VDMHAL_V5R2C1_IsVdmRun\000"
	.space	1
	.type	__func__.21227, %object
	.size	__func__.21227, 27
__func__.21227:
	.ascii	"VDMHAL_V5R2C1_IsVdhDecOver\000"
	.space	1
	.type	__func__.21237, %object
	.size	__func__.21237, 31
__func__.21237:
	.ascii	"VDMHAL_V5R2C1_IsVdhPartDecOver\000"
	.space	1
	.type	__func__.21252, %object
	.size	__func__.21252, 33
__func__.21252:
	.ascii	"VDMHAL_V5R2C1_UpdateHardwareInfo\000"
	.space	3
	.type	__func__.21325, %object
	.size	__func__.21325, 23
__func__.21325:
	.ascii	"VDMHAL_V5R2C1_CfgRpMsg\000"
	.space	1
	.type	__func__.21302, %object
	.size	__func__.21302, 24
__func__.21302:
	.ascii	"VDMHAL_CfgNotFullRepair\000"
	.type	__func__.21336, %object
	.size	__func__.21336, 23
__func__.21336:
	.ascii	"VDMHAL_V5R2C1_CfgRpReg\000"
	.space	1
	.type	__func__.21349, %object
	.size	__func__.21349, 28
__func__.21349:
	.ascii	"VDMHAL_V5R2C1_MakeDecReport\000"
	.type	__func__.21418, %object
	.size	__func__.21418, 28
__func__.21418:
	.ascii	"VDMHAL_V5R2C1_PrepareRepair\000"
	.type	__func__.21608, %object
	.size	__func__.21608, 15
__func__.21608:
	.ascii	"MFDE_ConfigReg\000"
	.space	1
	.type	__func__.21425, %object
	.size	__func__.21425, 28
__func__.21425:
	.ascii	"VDMHAL_V5R2C1_StartHwRepair\000"
	.type	__func__.21464, %object
	.size	__func__.21464, 28
__func__.21464:
	.ascii	"VDMHAL_V5R2C1_CalVdhClkSkip\000"
	.type	__func__.21490, %object
	.size	__func__.21490, 28
__func__.21490:
	.ascii	"VDMHAL_V5R2C1_StartHwDecode\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"pOpenParam = NULL error!\000" )
	.space	3
.LC1:
	ASCII(.ascii	"%s: %s\012\000" )
.LC2:
	ASCII(.ascii	"MemBaseAddr = 0 error!\000" )
	.space	1
.LC3:
	ASCII(.ascii	"VDMHAL_V5R2C1_OpenHAL: Size error!\000" )
	.space	1
.LC4:
	ASCII(.ascii	"VdhId is wrong!!!\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"!!!!!! HAL memory not enouph! need %d, have %d\012\000" )
.LC6:
	ASCII(.ascii	"image size out of range\000" )
.LC7:
	ASCII(.ascii	"VDMHAL ArrangeMem HEVC/VP9 10 bit\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"%s pstVfmwFrameSizeInfo = NULL\012\000" )
.LC9:
	ASCII(.ascii	"DelAllFrameMemRecord err in VDMHAL_V5R2C1_ArrangeMe" )
	ASCII(.ascii	"m!\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"Report arrange frame buffer: wxh %dx%d, FsNum %d, P" )
	ASCII(.ascii	"mvNum %d\012\000" )
	.space	3
.LC11:
	ASCII(.ascii	"Report arrange frame buffer only: wxh %dx%d, FsNum " )
	ASCII(.ascii	"%d, PmvNum %d\012\000" )
	.space	2
.LC12:
	ASCII(.ascii	"VidStd Invalid\000" )
	.space	1
.LC13:
	ASCII(.ascii	"Set CompressEn %d, LossCompressEn %d, YCompRatio %d" )
	ASCII(.ascii	", UVCompRatio %d\012\000" )
	.space	3
.LC14:
	ASCII(.ascii	"VDMHAL_V5R2C1_CalcFsSize err!\012\000" )
	.space	1
.LC15:
	ASCII(.ascii	"%s, need arrange, Size: %#x, Num: %#x, RefChanged: " )
	ASCII(.ascii	"%#x\012\000" )
.LC16:
	ASCII(.ascii	"DFS, report event. Size: 0x%x, Num: %d, RefChanged:" )
	ASCII(.ascii	" %d\012\000" )
.LC17:
	ASCII(.ascii	"pVdmMemArrange is NULL\000" )
	.space	1
.LC18:
	ASCII(.ascii	"DFS, no ref frame!\012\000" )
.LC19:
	ASCII(.ascii	"DFS, Frame number = %d > 30, Then, Frame num = 30, " )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC20:
	ASCII(.ascii	"VDMHAL_V5R2C1_ArrangeMem Mem addr is NULL\000" )
	.space	2
.LC21:
	ASCII(.ascii	"'pVdmMemArrange' is NULL\000" )
	.space	3
.LC22:
	ASCII(.ascii	"MemSize not enough for pmv slot\000" )
.LC23:
	ASCII(.ascii	"VDMHAL_V200R003_ArrangeMem get ChanWidth/ChanHeight" )
	ASCII(.ascii	" failed!\012\000" )
	.space	3
.LC24:
	ASCII(.ascii	"ImgSlotLen > ChanSlotLen\000" )
	.space	3
.LC25:
	ASCII(.ascii	"cann't allocate img slot\000" )
	.space	3
.LC26:
	ASCII(.ascii	"Chan: %d call VCTRL_GetVidStd failed\012\000" )
	.space	2
.LC27:
	ASCII(.ascii	"%s: VdhId(%d) > %d\012\000" )
.LC28:
	ASCII(.ascii	"VDMHAL_V5R2C1_ResetVdm: map vdm register fail, vir(" )
	ASCII(.ascii	"reg) = (%p)\012\000" )
.LC29:
	ASCII(.ascii	"%s module id %d failed!\012\000" )
	.space	3
.LC30:
	ASCII(.ascii	"%s module id %d success!\012\000" )
	.space	2
.LC31:
	ASCII(.ascii	"%s: WR_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\012\000" )
	.space	3
.LC32:
	ASCII(.ascii	"%s VdhId %d failed!\012\000" )
	.space	3
.LC33:
	ASCII(.ascii	"%s VdhId %d success!\012\000" )
	.space	2
.LC34:
	ASCII(.ascii	"%s: map vdm register 0x%x failed!\012\000" )
	.space	1
.LC35:
	ASCII(.ascii	"vdm register virtual address not mapped, reset fail" )
	ASCII(.ascii	"ed!\012\000" )
.LC36:
	ASCII(.ascii	"%s: VdhId(%d) Invalid!\012\000" )
.LC37:
	ASCII(.ascii	"%s: vdm register virtual address not mapped, reset " )
	ASCII(.ascii	"failed!\012\000" )
.LC38:
	ASCII(.ascii	"%s: unkown reg_id = %d\012\000" )
.LC39:
	ASCII(.ascii	"%s: RD_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\012\000" )
	.space	3
.LC40:
	ASCII(.ascii	"%s: pDecParam(%p) = NULL\012\000" )
	.space	2
.LC41:
	ASCII(.ascii	"VDM register not mapped yet!\000" )
	.space	3
.LC42:
	ASCII(.ascii	"VDM register not mapped yet!\012\000" )
	.space	2
.LC43:
	ASCII(.ascii	"can NOT map vir addr for up-msg\000" )
.LC44:
	ASCII(.ascii	"ReadUpMsgSlot error! pDst=%p, pSrc=%p\012\000" )
	.space	1
.LC45:
	ASCII(.ascii	"ReadUpMsgSlot error! upmsg_size(%d) > 512\012\000" )
	.space	1
.LC46:
	ASCII(.ascii	"WriteMsgSlot error!\012\000" )
	.space	3
.LC47:
	ASCII(.ascii	"can not map repair msg virtual address!\000" )
.LC48:
	ASCII(.ascii	"ValidGroupNum=%d out of range!\012\000" )
.LC49:
	ASCII(.ascii	"align_mb error\012\000" )
.LC50:
	ASCII(.ascii	"[%s][%d]sclie_num is wrong! %d \012\000" )
	.space	3
.LC51:
	ASCII(.ascii	"'pMakeDecReport' is NULL\000" )
	.space	3
.LC52:
	ASCII(.ascii	"'pDecReport' is NULL\000" )
	.space	3
.LC53:
	ASCII(.ascii	"pDecReport->DecSliceNum(%d) > %d, set to 0 for full" )
	ASCII(.ascii	" repair.\012\000" )
	.space	3
.LC54:
	ASCII(.ascii	"\012***** UpMsg DecSliceNum=%d\012\000" )
	.space	3
.LC55:
	ASCII(.ascii	"\012***** Up Msg (phy addr: %#8x) *****\012\000" )
	.space	2
.LC56:
	ASCII(.ascii	"\0120x%02x 0x%08x 0x%08x 0x%08x 0x%08x\012\000" )
	.space	3
.LC57:
	ASCII(.ascii	"\012***** Up Msg print finished *****\012\000" )
.LC58:
	ASCII(.ascii	"vdm register virtual address not mapped, VDMHAL_V20" )
	ASCII(.ascii	"0R003_PrepareRepair failed!\012\000" )
.LC59:
	ASCII(.ascii	"FIRST_REPAIR Parameter Error!\012\000" )
	.space	1
.LC60:
	ASCII(.ascii	"SECOND_REPAIR Parameter Error!\012\000" )
.LC61:
	ASCII(.ascii	"%s: pMfdeTask(%p) = NULL\012\000" )
	.space	2
.LC62:
	ASCII(.ascii	"%s The channel %d is not active\012\000" )
	.space	3
.LC63:
	ASCII(.ascii	"BigTile1d_y\000" )
.LC64:
	ASCII(.ascii	"failed mem_allocMemBlock BigTile_yuv save!\012\000" )
.LC65:
	ASCII(.ascii	"BigTile1d_uv\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
