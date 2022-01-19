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
	.global	VDMHAL_V4R3C1_GetHalMemSize
	.type	VDMHAL_V4R3C1_GetHalMemSize, %function
VDMHAL_V4R3C1_GetHalMemSize:
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
	.size	VDMHAL_V4R3C1_GetHalMemSize, .-VDMHAL_V4R3C1_GetHalMemSize
	.align	2
	.global	VDMHAL_V4R3C1_OpenHAL
	.type	VDMHAL_V4R3C1_OpenHAL, %function
VDMHAL_V4R3C1_OpenHAL:
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
	beq	.L23
	ldmia	r2, {r0, r3}
	ldr	r6, [r2, #8]
	cmp	r0, #0
	beq	.L24
	cmp	r3, #614400
	blt	.L25
	cmp	r6, #0
	bgt	.L26
	movw	r1, #1228
	add	lr, r0, #1020
	mul	r1, r1, r6
	add	lr, lr, #3
	ldr	r4, .L28
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
.L19:
	str	r1, [r2, #4]!
	cmp	r2, ip
	add	r1, r1, #1280
	bne	.L19
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
	bcc	.L20
	mov	r0, r4
	bl	H264HAL_V4R3C1_InitHal
	mov	r5, r0
	mov	r0, r4
	bl	HEVCHAL_V4R3C1_InitHal
	cmp	r0, #0
	beq	.L27
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L27:
	adds	r0, r5, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L26:
	ldr	r1, .L28+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L20:
	ldr	r1, .L28+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L24:
	ldr	r3, .L28+12
	ldr	r2, .L28+16
	ldr	r1, .L28+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L25:
	ldr	r3, .L28+24
	mov	r0, #0
	ldr	r2, .L28+16
	ldr	r1, .L28+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L23:
	ldr	r3, .L28+28
	ldr	r2, .L28+16
	ldr	r1, .L28+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L29:
	.align	2
.L28:
	.word	g_HwMem
	.word	.LC4
	.word	.LC5
	.word	.LC2
	.word	.LANCHOR0
	.word	.LC1
	.word	.LC3
	.word	.LC0
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_OpenHAL, .-VDMHAL_V4R3C1_OpenHAL
	.align	2
	.global	VDMHAL_V4R3C1_CloseHAL
	.type	VDMHAL_V4R3C1_CloseHAL, %function
VDMHAL_V4R3C1_CloseHAL:
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
	.size	VDMHAL_V4R3C1_CloseHAL, .-VDMHAL_V4R3C1_CloseHAL
	.align	2
	.global	VDMHAL_V4R3C1_CalcFsSize
	.type	VDMHAL_V4R3C1_CalcFsSize, %function
VDMHAL_V4R3C1_CalcFsSize:
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
	str	r3, [fp, #-60]
	bhi	.L32
	sub	r3, r2, #32
	mov	r4, r2
	cmp	r3, r1
	bhi	.L32
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
	beq	.L50
	ldr	r2, [fp, #4]
	ldr	r9, .L56
	cmp	r2, #17
	beq	.L51
	add	r4, r8, #31
	ldr	ip, [r9, r7, asl #2]
	mov	r5, r5, asl #4
	bic	r4, r4, #31
	add	r5, r5, #255
	mov	r2, #0
	bic	r1, r5, #255
	str	r2, [fp, #-64]
	str	r1, [fp, #-56]
	str	r2, [fp, #-68]
.L36:
	ldr	r2, [ip, #1208]
	cmp	r2, #1
	movne	r5, #0
	movne	r10, r5
	movne	r8, r5
	beq	.L52
.L38:
	ldr	r2, [fp, #-60]
	cmp	r2, #1
	beq	.L53
	ldr	r2, [fp, #-56]
	add	r6, r8, r8, lsl #1
	ldr	r1, [fp, #-64]
	mul	r4, r4, r2
	ldr	r2, [fp, #-68]
	mul	r2, r2, r1
	add	r1, r4, r4, lsl #1
	mov	r1, r1, lsr #1
	add	r2, r2, r2, lsl #1
	add	r2, r1, r2, lsr #1
	add	r6, r2, r6, lsr #1
.L40:
	add	r2, ip, #290816
	ldr	r1, [r2, #1432]
	cmp	r1, #0
	beq	.L54
.L41:
	ldr	r1, [fp, #4]
	add	r0, ip, #294912
	cmp	r1, #17
	add	r1, r3, r3, lsr #31
	str	r6, [r0, #904]
	mov	r1, r1, asr #1
	str	r10, [r2, #3780]
	str	r5, [r2, #3784]
	str	r1, [r2, #3820]
	beq	.L42
	ldr	r1, [r2, #1440]
	ldr	r0, [fp, #-56]
	cmp	r1, #32
	ldr	lr, [fp, #4]
	mov	r5, r0, asl #4
	movge	r1, #32
	cmp	lr, #16
	str	r5, [r2, #3772]
	add	r0, r4, r8
	mov	r5, r5, lsr #1
	str	r1, [r2, #3824]
	str	r5, [r2, #3776]
	str	r0, [r2, #3804]
	beq	.L55
.L44:
	ldr	r2, [r9, r7, asl #2]
	mov	r0, #4096
	add	r6, r6, #1056
	add	r1, r2, #294912
	add	ip, r3, r6
	str	r3, [r1, #908]
	str	r0, [r1, #916]
	ldrsb	r2, [r2, #44]
	cmp	r2, #1
	ldr	r2, [fp, #8]
	addeq	ip, ip, r0
	cmp	r2, #0
	beq	.L48
	str	r6, [r2, #4]
	mov	r1, #4096
	ldr	r2, [r9, r7, asl #2]
	mov	r0, #0
	ldr	lr, [fp, #8]
	add	r2, r2, #290816
	ldr	r2, [r2, #1440]
	str	r3, [lr, #12]
	str	r2, [lr, #8]
	ldr	r3, [r9, r7, asl #2]
	add	r3, r3, #290816
	ldr	r3, [r3, #3824]
	str	ip, [lr]
	str	r1, [lr, #20]
	str	r3, [lr, #16]
	ldr	r3, [r9, r7, asl #2]
	add	r3, r3, #294912
	str	r6, [r3, #912]
.L34:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L55:
	ldr	r1, [ip, #1572]
	cmp	r1, #8
	ble	.L44
	ldr	r1, [fp, #-64]
	add	r8, r8, r8, lsl #1
	str	r3, [fp, #-56]
	add	r4, r4, r4, lsl #1
	ldr	r3, [fp, #-68]
	mul	ip, r1, r3
	mov	r1, r8, lsr #1
	mov	r0, r3, asl #5
	add	r4, r1, r4, lsr #1
	str	r0, [r2, #3788]
	mov	r0, #31
	ldr	r1, .L56+4
	str	r4, [r2, #3796]
	str	ip, [r2, #3800]
	bl	dprint_vfmw
	ldr	r3, [fp, #-56]
	b	.L44
.L54:
	ldr	lr, .L56+8
	movw	r0, #32440
	str	r3, [fp, #-60]
	mov	r2, #1248
	movt	r0, 4
	add	r0, ip, r0
	ldr	r3, [lr, #48]
	blx	r3
	ldr	ip, [r9, r7, asl #2]
	ldr	r3, [fp, #-60]
	add	r2, ip, #290816
	b	.L41
.L42:
	ldr	r1, [fp, #-56]
	add	r4, r4, r8
	str	r4, [r2, #3804]
	mov	r5, r1, asl #4
	mov	r1, #1
	str	r5, [r2, #3772]
	str	r1, [r2, #3824]
	mov	r5, r5, lsr r1
	str	r5, [r2, #3776]
	b	.L44
.L53:
	mov	r2, r6, asl #5
	add	r6, r2, r6, lsl #4
	ldr	r2, [fp, #-56]
	mul	r4, r4, r2
	mul	r6, r2, r6
	b	.L40
.L52:
	add	r2, r10, #508
	add	r10, r10, #1020
	add	r2, r2, #3
	add	r10, r10, #2
	cmp	r2, #0
	movge	r10, r2
	adds	r2, r8, #63
	addmi	r8, r8, #126
	movpl	r8, r2
	mov	r10, r10, asr #9
	mov	r8, r8, asr #6
	mov	r10, r10, asl #4
	mov	r8, r8, asl #5
	mul	r8, r10, r8
	mov	r5, r8
	b	.L38
.L50:
	ldr	r9, .L56
	add	r5, r10, #255
	bic	r2, r5, #255
	str	r2, [fp, #-56]
	ldr	ip, [r9, r7, asl #2]
	ldr	r2, [ip, #1572]
	cmp	r2, #8
	ble	.L46
	ldr	r1, [fp, #-56]
	add	r2, r8, #31
	bic	r2, r2, #31
	str	r2, [fp, #-64]
	mov	r1, r1, lsr #2
	str	r1, [fp, #-68]
	b	.L36
.L46:
	mov	r2, #0
	str	r2, [fp, #-64]
	str	r2, [fp, #-68]
	b	.L36
.L51:
	add	r5, r10, #255
	add	r4, r8, #63
	mov	r2, #0
	bic	r1, r5, #255
	str	r2, [fp, #-64]
	bic	r4, r4, #63
	str	r1, [fp, #-56]
	ldr	ip, [r9, r7, asl #2]
	str	r2, [fp, #-68]
	b	.L36
.L32:
	ldr	r3, .L56+12
	mov	r0, #0
	ldr	r2, .L56+16
	ldr	r1, .L56+20
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L48:
	ldr	r0, [fp, #8]
	b	.L34
.L57:
	.align	2
.L56:
	.word	s_pstVfmwChan
	.word	.LC7
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LANCHOR0+24
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_CalcFsSize, .-VDMHAL_V4R3C1_CalcFsSize
	.align	2
	.global	VDMHAL_V4R3C1_GetRpuSize
	.type	VDMHAL_V4R3C1_GetRpuSize, %function
VDMHAL_V4R3C1_GetRpuSize:
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
	.size	VDMHAL_V4R3C1_GetRpuSize, .-VDMHAL_V4R3C1_GetRpuSize
	.align	2
	.global	VDMHAL_V4R3C1_CalcFsNum
	.type	VDMHAL_V4R3C1_CalcFsNum, %function
VDMHAL_V4R3C1_CalcFsNum:
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
	beq	.L64
	cmp	r1, #17
	ldr	ip, .L66
	beq	.L65
	ldr	lr, [ip, r0, asl #2]
	add	r0, lr, #290816
	ldr	r1, [r0, #1440]
	cmp	r1, #32
	movge	r1, #32
	str	r1, [r0, #3824]
	ldr	r1, [lr, #632]
	cmp	r1, #2
	ldreq	r1, [r0, #1444]
	streq	r1, [r0, #3824]
.L63:
	ldr	r1, [ip, r2, asl #2]
	mov	r0, #0
	add	r1, r1, #290816
	ldr	r1, [r1, #1440]
	str	r1, [r3, #8]
	ldr	r2, [ip, r2, asl #2]
	add	r2, r2, #290816
	ldr	r2, [r2, #3824]
	str	r2, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L65:
	ldr	r1, [ip, r2, asl #2]
	mov	r0, #1
	add	r1, r1, #290816
	str	r0, [r1, #3824]
	b	.L63
.L64:
	ldr	r2, .L66+4
	mov	r0, #1
	ldr	r1, .L66+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L67:
	.align	2
.L66:
	.word	s_pstVfmwChan
	.word	.LANCHOR0+52
	.word	.LC8
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_CalcFsNum, .-VDMHAL_V4R3C1_CalcFsNum
	.align	2
	.global	VDMHAL_V4R3C1_DynamicAllocFrame
	.type	VDMHAL_V4R3C1_DynamicAllocFrame, %function
VDMHAL_V4R3C1_DynamicAllocFrame:
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
	ldr	r6, .L88
	mov	r7, r2
	mov	r8, r1
	movw	r1, #30136
	mov	r4, r0
	ldr	r2, [r6, r0, asl #2]
	movt	r1, 4
	mov	r5, r3
	add	r1, r2, r1
	bl	DelAllFrameMemRecord
	cmp	r0, #0
	bne	.L87
.L69:
	ldr	r1, [r6, r4, asl #2]
	movw	r2, #30136
	movt	r2, 4
	mov	r3, #0
	add	r2, r1, r2
	mov	r1, #255
.L70:
	str	r1, [r2, r3]
	add	r3, r3, #72
	cmp	r3, #2304
	bne	.L70
	cmp	r8, #1920
	cmple	r7, #1088
	ble	.L71
	ldr	r2, [r5, #8]
	ldr	r3, [r6, r4, asl #2]
.L72:
	ldr	r1, [r3, #1512]
	add	r3, r3, #290816
	mov	r0, r4
	add	r2, r2, r1
	str	r2, [r3, #1444]
	bl	VCTRL_GetVidStd
	ldr	r3, [r6, r4, asl #2]
	ldr	r1, .L88
	ldr	r2, [r3, #632]
	subs	r0, r0, #17
	movne	r0, #1
	cmp	r2, #2
	movne	r0, #0
	cmp	r0, #0
	addne	r3, r3, #290816
	mov	r0, #1
	ldrne	r3, [r3, #1444]
	strne	r3, [r5, #16]
	ldrne	r3, [r1, r4, asl #2]
	add	r1, r3, #294912
	add	r2, r3, #262144
	mov	r3, #0
	str	r3, [r1, #944]
	mov	r3, r7
	str	r0, [r2, #2080]
	mov	r2, r8
	str	r0, [r1, #1484]
	mov	r0, #31
	ldr	r1, [r5, #8]
	ldr	ip, [r5, #16]
	stmia	sp, {r1, ip}
	ldr	r1, .L88+4
	bl	dprint_vfmw
	ldr	r3, .L88+8
	ldr	r9, [r3]
	cmp	r9, #0
	beq	.L76
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
.L76:
	ldr	r0, [r6, r4, asl #2]
	mov	r1, #0
	ldr	r3, .L88+12
	mov	r2, #528
	add	r0, r0, #294912
	add	r0, r0, #952
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r6, r4, asl #2]
	mov	r2, #0
	mov	r0, r4
	add	r3, r3, #294912
	str	r2, [r3, #1480]
	bl	FSP_ClearContextAll
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L71:
	ldr	r3, [r6, r4, asl #2]
	ldr	r1, .L88
	ldr	r2, [r3, #36]
	cmp	r2, #24
	ldreq	r2, [r5, #8]
	beq	.L72
	add	r2, r3, #294912
	ldr	r2, [r2, #1540]
	cmp	r2, #0
	ldr	r2, [r5, #8]
	addeq	r2, r2, #4
	streq	r2, [r5, #8]
	ldreq	r3, [r1, r4, asl #2]
	b	.L72
.L87:
	ldr	r1, .L88+16
	mov	r0, #0
	bl	dprint_vfmw
	b	.L69
.L89:
	.align	2
.L88:
	.word	s_pstVfmwChan
	.word	.LC10
	.word	g_event_report
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC9
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_DynamicAllocFrame, .-VDMHAL_V4R3C1_DynamicAllocFrame
	.align	2
	.global	VDMHAL_V4R3C1_DynamicAllocFrame_Only
	.type	VDMHAL_V4R3C1_DynamicAllocFrame_Only, %function
VDMHAL_V4R3C1_DynamicAllocFrame_Only:
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
	ldr	ip, .L95
	ldr	lr, [r3, #8]
	mov	r4, r3
	mov	r8, r0
	mov	r3, r2
	ldr	ip, [ip, r0, asl #2]
	mov	r7, r1
	mov	r6, r2
	mov	r0, #31
	add	ip, ip, #290816
	mov	r2, r1
	ldr	r1, .L95+4
	str	lr, [ip, #1444]
	ldr	lr, [r4, #16]
	ldr	ip, [r4, #8]
	stmia	sp, {ip, lr}
	bl	dprint_vfmw
	ldr	r3, .L95+8
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L90
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
.L90:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L96:
	.align	2
.L95:
	.word	s_pstVfmwChan
	.word	.LC11
	.word	g_event_report
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_DynamicAllocFrame_Only, .-VDMHAL_V4R3C1_DynamicAllocFrame_Only
	.align	2
	.global	VDMHAL_V4R3C1_ArrangeMem_Normal
	.type	VDMHAL_V4R3C1_ArrangeMem_Normal, %function
VDMHAL_V4R3C1_ArrangeMem_Normal:
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
	bhi	.L127
	ldr	r10, .L135
	ldr	r1, [r10, r4, asl #2]
	add	r2, r1, #290816
	ldr	r3, [r1, #100]
	ldr	r2, [r2, #1436]
	cmp	r3, #2
	str	r2, [fp, #-76]
	beq	.L128
	ldr	ip, [r1, #1220]
	mov	r2, #1
	ldr	r3, [r1, #1212]
	mov	r0, r2
	str	r2, [r1, #1208]
	str	ip, [sp, #4]
	ldr	ip, [r1, #1216]
	ldr	r1, .L135+4
	str	ip, [sp]
	bl	dprint_vfmw
.L101:
	sub	r6, fp, #68
	ldr	r2, [fp, #4]
	mov	r1, r5
	mov	r0, r4
	mov	r3, r6
	bl	VDMHAL_V4R3C1_CalcFsNum
	ldr	r3, [fp, #8]
	str	r6, [sp, #4]
	mov	r2, r8
	str	r5, [sp]
	mov	r1, r7
	mov	r9, r0
	mov	r0, r4
	bl	VDMHAL_V4R3C1_CalcFsSize
	orrs	r3, r0, r9
	bne	.L129
	ldr	r3, [r10, r4, asl #2]
	ldr	r1, [fp, #-76]
	ldr	r5, [fp, #-68]
	str	r3, [fp, #-72]
	add	r3, r3, #290816
	cmp	r1, r5
	ldr	r2, .L135
	ldr	r9, [r3, #1440]
	ldr	r1, [r3, #1456]
	beq	.L130
.L104:
	str	r1, [sp, #4]
	mov	r3, r5
	ldr	r2, .L135+8
	mov	r0, #31
	ldr	r1, .L135+12
	str	r9, [sp]
	bl	dprint_vfmw
	ldr	r3, [r10, r4, asl #2]
	mov	r1, r7
	mov	r0, r4
	add	r3, r3, #290816
	ldr	r2, [r3, #1432]
	str	r5, [r3, #1436]
	mov	r3, r6
	cmp	r2, #0
	mov	r2, r8
	beq	.L131
	bl	VDMHAL_V4R3C1_DynamicAllocFrame_Only
.L107:
	ldr	ip, [r10, r4, asl #2]
	mov	r3, r9
	mov	r2, r5
	ldr	r1, .L135+16
	add	ip, ip, #290816
	mov	r0, #31
	ldr	ip, [ip, #1456]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, .L135+20
	ldr	r4, [r10, r4, asl #2]
	ldr	r3, [r3]
	add	r4, r4, #294912
	blx	r3
	mov	r3, #2
	str	r0, [r4, #920]
.L99:
	mov	r0, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L130:
	cmp	r1, #1
	beq	.L104
	ldr	r0, [r3, #1432]
	cmp	r0, #1
	beq	.L104
	ldr	r1, [fp, #12]
	cmp	r1, #0
	beq	.L132
	ldr	r0, [fp, #-72]
	cmp	r9, #0
	movw	ip, #32440
	add	r1, r0, #294912
	movt	ip, 4
	ldrne	r2, [fp, #-72]
	ldr	r9, [r1, #904]
	add	r1, r0, ip
	str	r1, [fp, #-80]
	beq	.L133
.L109:
	add	r2, r2, #290816
	ldr	r2, [r2, #1444]
	cmp	r2, #30
	bgt	.L134
.L110:
	str	r2, [r3, #3816]
	mov	r0, #8
	str	r3, [fp, #-76]
	ldr	r3, .L135+20
	ldr	r2, [r3, #12]
	blx	r2
	ldr	ip, [r10, r4, asl #2]
	ldr	r3, [fp, #-76]
	add	r8, ip, #294912
	ldr	r2, [r8, #944]
	cmp	r2, #0
	beq	.L115
	ldr	r2, [r3, #3828]
	movw	r5, #8129
	ldr	r0, [r3, #3824]
	movt	r5, 1
	add	lr, r2, #1
	add	r5, r2, r5
	movw	r1, #30168
	mov	r7, #1
	str	r0, [fp, #-76]
	mov	r0, r2, asl #4
	sub	r2, r0, r2, asl #2
	ldr	r0, [fp, #-72]
	add	r2, r2, #294912
	movt	r1, 4
	add	r2, r2, #136
	add	r5, r0, r5, lsl #2
	add	r0, r0, r2
	add	r1, ip, r1
	mov	r6, lr
	mov	ip, #0
	str	r4, [fp, #-84]
.L114:
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
	str	lr, [r3, #3828]
	ldr	r2, [r1, #-28]
	cmp	r2, #255
	beq	.L112
	ldr	lr, [r3, #3836]
	add	r4, lr, #1
	mov	r2, lr, asl #4
	sub	r2, r2, lr, asl #2
	ldr	lr, [r1, #16]
	add	r2, r3, r2
	add	r2, r2, #4608
	str	lr, [r2, #8]
	ldr	lr, [r1, #-16]
	str	lr, [r2, #12]
	str	r4, [r3, #3836]
.L112:
	ldr	r2, [r3, #3832]
	ldr	lr, [fp, #-76]
	cmp	r2, lr
	bcs	.L113
	ldr	r4, [r1, #-24]
	ldr	lr, [fp, #-72]
	cmp	r4, #255
	add	lr, lr, r2, lsl #3
	add	r2, r2, #1
	ldrne	r4, [r1, #32]
	add	lr, lr, #290816
	strneb	r7, [lr, #3980]
	strne	r4, [lr, #3976]
	strne	r2, [r3, #3832]
.L113:
	ldr	r2, [r8, #944]
	add	r1, r1, #72
	cmp	ip, r2
	bcc	.L114
	ldr	r4, [fp, #-84]
.L115:
	ldr	r3, .L135+20
	mov	r2, #1232
	ldr	r1, [fp, #-80]
	ldr	r0, [fp, #12]
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, [r10, r4, asl #2]
	ldr	r2, .L135+20
	mov	r1, #1
	add	r3, r3, #294912
	mov	r0, #8
	str	r1, [r3, #948]
	ldr	r2, [r2, #16]
	blx	r2
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L131:
	bl	VDMHAL_V4R3C1_DynamicAllocFrame
	b	.L107
.L128:
	mvn	r3, #0
	str	r0, [r1, #1208]
	str	r0, [r1, #1212]
	str	r3, [r1, #1216]
	str	r3, [r1, #1220]
	b	.L101
.L133:
	ldr	r1, .L135+24
	mov	r0, #31
	str	r3, [fp, #-84]
	str	r2, [fp, #-76]
	bl	dprint_vfmw
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-84]
	ldr	r2, [r2, r4, asl #2]
	b	.L109
.L134:
	ldr	r1, .L135+28
	mov	r0, #31
	str	r3, [fp, #-76]
	bl	dprint_vfmw
	ldr	r1, [r10, r4, asl #2]
	mov	r0, #30
	mov	r2, r0
	ldr	r3, [fp, #-76]
	add	r1, r1, #290816
	str	r0, [r1, #1444]
	b	.L110
.L127:
	ldr	r3, .L135+32
	ldr	r2, .L135+36
	ldr	r1, .L135+40
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L99
.L129:
	ldr	r1, .L135+44
	mov	r0, #31
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L99
.L132:
	ldr	r3, .L135+48
	mov	r0, r1
	ldr	r2, .L135+52
	ldr	r1, .L135+40
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L99
.L136:
	.align	2
.L135:
	.word	s_pstVfmwChan
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
	.size	VDMHAL_V4R3C1_ArrangeMem_Normal, .-VDMHAL_V4R3C1_ArrangeMem_Normal
	.global	__aeabi_idiv
	.align	2
	.global	VDMHAL_V4R3C1_ArrangeMem_Specific
	.type	VDMHAL_V4R3C1_ArrangeMem_Specific, %function
VDMHAL_V4R3C1_ArrangeMem_Specific:
	UNWIND(.fnstart)
	@ args = 28, pretend = 0, frame = 64
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
	cmp	r2, #0
	str	r3, [fp, #-76]
	mov	r10, r0
	str	r2, [fp, #-72]
	mov	r8, r1
	ldmib	fp, {r5, r9}
	ldr	r3, [fp, #12]
	ldr	r4, [fp, #28]
	beq	.L202
	sub	r1, r5, #32
	movw	r2, #8160
	cmp	r1, r2
	bhi	.L140
	sub	r1, r9, #32
	cmp	r1, r2
	bhi	.L140
	cmp	r4, #0
	beq	.L203
	ldr	ip, .L211
	cmp	r3, #20
	mov	r2, #1232
	mov	r1, #0
	mov	r0, r4
	movge	r3, #20
	ldr	r6, [ip, #48]
	str	r3, [fp, #-80]
	blx	r6
	sub	r2, fp, #44
	add	r1, r9, #15
	add	r6, r5, #15
	mov	r0, r8
	mov	r3, r1, asr #4
	sub	r1, fp, #64
	str	r3, [r2, #-16]!
	mov	r6, r6, asr #4
	str	r3, [fp, #-96]
	str	r6, [fp, #-64]
	bl	VDMHAL_CalcPmvSlotLen.isra.0
	ldr	r3, [fp, #-80]
	ldr	r1, [fp, #-76]
	mul	r2, r3, r0
	mov	r7, r0
	cmp	r2, r1
	str	r2, [fp, #-92]
	ldrge	r3, .L211+4
	bge	.L201
	ldr	r0, [fp, #-72]
	add	r1, r7, r7, lsr #31
	cmp	r8, #16
	str	r3, [r4, #56]
	add	r2, r0, #1020
	mov	r3, r1, asr #1
	add	r2, r2, #3
	str	r3, [r4, #52]
	bic	r2, r2, #1020
	bic	r2, r2, #3
	rsb	r1, r0, r2
	str	r1, [fp, #-80]
	beq	.L204
	cmp	r8, #17
	beq	.L205
	mov	r6, r6, asl #4
	add	r3, r9, #31
	add	r6, r6, #255
	bic	r3, r3, #31
	bic	r6, r6, #255
	add	r1, r9, #63
	mov	r0, #0
	str	r0, [fp, #-84]
	str	r0, [fp, #-88]
.L146:
	add	r0, r5, #508
	add	r5, r5, #1020
	add	r0, r0, #3
	add	r5, r5, #2
	cmp	r0, #0
	add	ip, r1, #63
	movlt	r0, r5
	cmp	r1, #0
	mov	r0, r0, asr #9
	movlt	r1, ip
	ldr	ip, [fp, #20]
	mov	r1, r1, asr #6
	cmp	ip, #1
	mov	ip, r6, asl #4
	str	ip, [r4, #4]
	mov	ip, r0, asl #9
	mov	r0, r0, asl #4
	str	r0, [r4, #12]
	mul	r1, r1, ip
	mov	r0, r6, asl #3
	str	r0, [r4, #8]
	str	r1, [r4, #16]
	beq	.L206
	ldr	ip, [fp, #-84]
	add	r5, r1, r1, lsl #1
	ldr	r0, [fp, #-88]
	mul	r0, r0, ip
	mul	ip, r6, r3
	add	r0, r0, r0, lsl #1
	add	r0, r0, r0, lsr #31
	add	ip, ip, ip, lsl #1
	mov	r0, r0, asr #1
	add	r0, r0, ip, asr #1
	add	r5, r0, r5, lsr #1
.L150:
	ldr	r0, [fp, #24]
	cmp	r0, #0
	blt	.L151
	str	r3, [fp, #-104]
	str	r1, [fp, #-100]
	str	r2, [fp, #-96]
	bl	VCTRL_GetChanWidth
	mov	r9, r0
	ldr	r0, [fp, #24]
	bl	VCTRL_GetChanHeight
	ldr	r2, [fp, #-96]
	ldr	r1, [fp, #-100]
	ldr	r3, [fp, #-104]
	cmn	r0, #1
	cmnne	r9, #1
	beq	.L207
	ldr	lr, [fp, #20]
	add	ip, r9, #15
	bic	ip, ip, #15
	add	r0, r0, #15
	cmp	lr, #1
	add	r9, ip, #255
	bic	r0, r0, #15
	bic	r9, r9, #255
	beq	.L208
	add	lr, ip, #508
	adds	r10, r0, #63
	add	lr, lr, #3
	addmi	r10, r0, #126
	cmp	lr, #0
	add	ip, ip, #1020
	add	ip, ip, #2
	ldr	r0, [fp, #-88]
	movge	ip, lr
	mov	lr, r10, asr #6
	ldr	r10, [fp, #-84]
	mul	r9, lr, r9
	mul	r10, r0, r10
	mov	r0, ip, asr #9
	mov	ip, lr, asl #7
	mov	r0, r0, asl #4
	sub	lr, ip, lr, asl #5
	mul	lr, r0, lr
	add	r10, r10, r10, lsl #1
	mov	r0, r9, asl #7
	add	r10, r10, r10, lsr #31
	sub	r9, r0, r9, asl #5
	add	r9, r9, r10, asr #1
	add	lr, r9, lr, lsr #1
.L154:
	cmp	r5, lr
	ldrgt	r3, .L211+8
	bgt	.L201
	ldr	r10, [fp, #24]
.L151:
	mul	r6, r6, r3
	cmp	r10, #0
	cmpge	r8, #16
	mvn	r9, r10
	str	r1, [fp, #-96]
	mov	r9, r9, lsr #31
	add	r3, r1, r6
	str	r3, [r4, #36]
	bne	.L156
	ldr	r3, .L211+12
	movw	r0, #34328
	movt	r0, 4
	str	r2, [fp, #-100]
	ldr	r3, [r3, r10, asl #2]
	add	r0, r3, r0
	bl	IsMain10Profile
	ldr	r2, [fp, #-100]
	ldr	r1, [fp, #-96]
	cmp	r0, #0
	bne	.L209
.L156:
	ldr	r3, [fp, #16]
	cmp	r3, #0
	streq	r3, [r4, #48]
	beq	.L159
	ldr	r3, [fp, #-76]
	ldr	r1, [fp, #-92]
	str	r2, [fp, #-76]
	rsb	r0, r1, r3
	ldr	r3, [fp, #-80]
	mov	r1, r5
	rsb	r0, r3, r0
	ldr	r3, [fp, #16]
	cmp	r3, #32
	movlt	r6, r3
	movge	r6, #32
	bl	__aeabi_idiv
	ldr	r2, [fp, #-76]
	cmp	r6, r0
	movlt	r1, r6
	movge	r1, r0
	cmp	r1, #0
	str	r1, [r4, #48]
	beq	.L159
	ldr	lr, [r4, #60]
	mov	ip, r4
	mov	r0, r2
	mov	r3, #0
.L164:
	add	r3, r3, #1
	str	r0, [ip, #464]
	cmp	r3, r1
	add	r0, r0, r5
	add	ip, ip, #12
	bne	.L164
	ldr	r3, [fp, #20]
	cmp	r3, #1
	add	r3, lr, r1
	str	r3, [r4, #60]
	beq	.L210
	ldr	r3, [fp, #-80]
	mla	r5, r1, r5, r3
	ldr	r3, [fp, #-72]
	add	r3, r5, r3
.L177:
	add	r0, r4, #76
	mov	r2, #0
.L168:
	add	r2, r2, #1
	str	r3, [r0, #4]!
	cmp	r2, r1
	add	r3, r3, #32
	bne	.L168
.L167:
	ldr	ip, [r4, #56]
	add	r5, r5, r1, lsl #5
	ldr	r3, [fp, #-72]
	cmp	ip, #0
	add	lr, r5, r3
	beq	.L173
	ldr	r6, [r4, #64]
	mov	r0, r4
	mov	r2, lr
	mov	r3, #0
.L172:
	add	r3, r3, #1
	str	r2, [r0, #208]
	cmp	ip, r3
	add	r2, r2, r7
	add	r0, r0, #8
	bne	.L172
	add	r3, ip, r6
	str	r3, [r4, #64]
.L173:
	mla	r7, ip, r7, r5
	cmp	r9, #0
	str	r7, [r4]
	beq	.L171
	ldr	r3, .L211+12
	ldr	r3, [r3, r10, asl #2]
	cmp	r3, #0
	beq	.L171
	cmp	r1, #0
	add	r3, r7, lr
	beq	.L171
	mov	r0, r4
	mov	r2, #0
.L174:
	add	r2, r2, #1
	str	r3, [r0, #848]
	cmp	r2, r1
	add	r3, r3, #4096
	add	r0, r0, #12
	bne	.L174
.L171:
	mov	r0, #0
	add	r7, r7, r1, lsl #12
	str	r7, [r4]
.L199:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L204:
	cmp	r10, #0
	add	r6, r5, #255
	bic	r6, r6, #255
	blt	.L200
	ldr	r3, .L211+12
	movw	r0, #34328
	movt	r0, 4
	str	r2, [fp, #-84]
	ldr	r3, [r3, r10, asl #2]
	add	r0, r3, r0
	bl	IsMain10Profile
	ldr	r2, [fp, #-84]
	cmp	r0, #0
	beq	.L200
	cmp	r6, #0
	add	r0, r6, #3
	add	r3, r9, #31
	add	r1, r9, #63
	movge	r0, r6
	bic	r3, r3, #31
	mov	r0, r0, asr #2
	str	r3, [fp, #-84]
	str	r0, [fp, #-88]
	mov	r3, r9
	b	.L146
.L206:
	ldr	r0, [fp, #-96]
	mov	r5, r0, asl #4
	mul	r5, r6, r5
	add	r5, r5, r5, lsl #1
	b	.L150
.L210:
	ldr	r3, .L211+16
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L166
	str	r2, [fp, #-56]
	mov	r3, #12
	str	r1, [fp, #-48]
	sub	r2, fp, #56
	mov	r1, #128
	str	r5, [fp, #-52]
	mov	r0, r10
	blx	r6
	ldr	r1, [r4, #48]
.L166:
	ldr	r3, [fp, #-80]
	cmp	r1, #0
	mla	r5, r1, r5, r3
	ldr	r3, [fp, #-72]
	add	r3, r5, r3
	bne	.L177
	b	.L167
.L200:
	mov	r3, #0
	add	r1, r9, #63
	str	r3, [fp, #-84]
	str	r3, [fp, #-88]
	mov	r3, r9
	b	.L146
.L159:
	ldr	r3, .L211+20
.L201:
	ldr	r2, .L211+24
	mov	r0, #0
	ldr	r1, .L211+28
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L208:
	mul	lr, r0, r9
	add	lr, lr, lr, lsl #1
	b	.L154
.L205:
	mov	r3, #0
	add	r1, r9, #63
	add	r6, r5, #255
	mov	r0, r3
	str	r3, [fp, #-84]
	bic	r6, r6, #255
	bic	r3, r1, #63
	str	r0, [fp, #-88]
	b	.L146
.L140:
	ldr	r3, .L211+32
	b	.L201
.L209:
	ldr	r0, [fp, #-84]
	add	r6, r6, r6, lsl #1
	str	r2, [fp, #-96]
	add	r3, r1, r1, lsl #1
	ldr	r2, [fp, #-88]
	mov	r6, r6, asr #1
	add	r6, r6, r3, lsr #1
	str	r6, [r4, #28]
	mul	ip, r2, r0
	mov	r0, r2, asl #5
	str	r0, [r4, #20]
	mov	r0, #0
	add	r1, ip, r1, lsr #1
	str	r1, [r4, #32]
	ldr	r1, .L211+36
	bl	dprint_vfmw
	ldr	r2, [fp, #-96]
	b	.L156
.L202:
	mov	r0, r2
	ldr	r3, .L211+40
	ldr	r2, .L211+24
	ldr	r1, .L211+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L199
.L207:
	ldr	r1, .L211+44
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L199
.L203:
	mov	r0, r4
	ldr	r3, .L211+48
	ldr	r2, .L211+24
	ldr	r1, .L211+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L199
.L212:
	.align	2
.L211:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC22
	.word	.LC24
	.word	s_pstVfmwChan
	.word	g_event_report
	.word	.LC25
	.word	.LANCHOR0+176
	.word	.LC1
	.word	.LC6
	.word	.LC7
	.word	.LC20
	.word	.LC23
	.word	.LC21
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_ArrangeMem_Specific, .-VDMHAL_V4R3C1_ArrangeMem_Specific
	.align	2
	.global	VDMHAL_V4R3C1_ArrangeMem
	.type	VDMHAL_V4R3C1_ArrangeMem, %function
VDMHAL_V4R3C1_ArrangeMem:
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
	beq	.L219
	cmp	r4, #0
	blt	.L220
	mov	r0, r4
	str	r3, [fp, #-52]
	str	r1, [fp, #-48]
	bl	VCTRL_GetVidStd
	ldr	r1, [fp, #-48]
	ldr	r3, [fp, #-52]
	cmp	r0, #22
	beq	.L223
	ldr	r2, .L225
	ldr	r2, [r2, r4, asl #2]
	ldr	r2, [r2, #1504]
	cmp	r2, #1
	beq	.L224
.L218:
	str	r3, [sp, #24]
	mov	r2, r9
	mov	r3, r1
	str	r4, [sp, #20]
	mov	r1, r0
	str	r8, [sp, #16]
	str	r10, [sp, #12]
	mov	r0, r4
	stmia	sp, {r5, r6, r7}
	bl	VDMHAL_V4R3C1_ArrangeMem_Specific
.L221:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L220:
	mov	r0, #22
	b	.L218
.L219:
	mov	r0, #16
	b	.L218
.L224:
	str	r3, [fp, #12]
	mov	r1, r0
	mov	r3, r6
	str	r8, [fp, #8]
	mov	r2, r5
	str	r7, [fp, #4]
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VDMHAL_V4R3C1_ArrangeMem_Normal
.L223:
	mvn	r2, #0
	ldr	r1, .L225+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L221
.L226:
	.align	2
.L225:
	.word	s_pstVfmwChan
	.word	.LC26
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_ArrangeMem, .-VDMHAL_V4R3C1_ArrangeMem
	.align	2
	.global	VDMHAL_V4R3C1_ResetVdm
	.type	VDMHAL_V4R3C1_ResetVdm, %function
VDMHAL_V4R3C1_ResetVdm:
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
	ble	.L228
	mov	r3, r7
	str	r0, [sp]
	ldr	r2, .L242
	ldr	r1, .L242+4
	bl	dprint_vfmw
.L227:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L228:
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r2, r0, #0
	beq	.L240
	movw	r3, #1228
	ldr	r9, .L242+8
	mul	r3, r3, r7
	ldr	r5, .L242+12
	ldr	r2, [r5]
	ldr	r3, [r9, r3]
	ldr	r10, [r3, #36]
	ldr	r8, [r2, #120]
	tst	r8, #1
	beq	.L227
	ldr	r6, .L242+16
	mov	r3, #2
	bfi	r8, r3, #8, #2
	str	r8, [r2, #120]
	mov	r4, #0
	orr	r8, r8, #64
	ldr	r3, [r6, #112]
	blx	r3
	ldr	r3, [r5]
	str	r8, [r3, #120]
	b	.L232
.L241:
	add	r4, r4, #1
	cmp	r4, #1000
	beq	.L233
.L232:
	ldr	r3, [r6, #116]
	mov	r0, #30
	blx	r3
	ldr	r3, [r5]
	ldr	r3, [r3, #372]
	tst	r3, #4
	beq	.L241
	cmp	r4, #1000
	bge	.L233
	mov	r3, r7
	ldr	r2, .L242
	ldr	r1, .L242+20
	mov	r0, #0
	bl	dprint_vfmw
.L235:
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
.L233:
	mov	r3, r7
	ldr	r2, .L242
	ldr	r1, .L242+24
	mov	r0, #0
	bl	dprint_vfmw
	b	.L235
.L240:
	ldr	r1, .L242+28
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L243:
	.align	2
.L242:
	.word	.LANCHOR0+212
	.word	.LC27
	.word	g_HwMem
	.word	g_pstRegCrg
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC30
	.word	.LC29
	.word	.LC28
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_ResetVdm, .-VDMHAL_V4R3C1_ResetVdm
	.align	2
	.global	VDMHAL_V4R3C1_SetSmmuPageTableAddr
	.type	VDMHAL_V4R3C1_SetSmmuPageTableAddr, %function
VDMHAL_V4R3C1_SetSmmuPageTableAddr:
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
	ldr	r3, .L250
	mov	r4, r0
	ldr	r3, [r3, #196]
	cmp	r3, #0
	beq	.L244
	sub	r2, fp, #24
	sub	r1, fp, #28
	sub	r0, fp, #32
	blx	r3
	cmp	r4, #0
	bne	.L246
	ldr	r3, .L250+4
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-28]
	ldr	r3, [r3]
	ldr	r2, [fp, #-24]
	add	r3, r3, #61440
	str	r0, [r3, #524]
	str	r1, [r3, #772]
	str	r2, [r3, #776]
.L244:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L246:
	mov	r5, #1
	mov	r3, r4
	str	r5, [sp]
	mov	r0, #32
	ldr	r2, .L250+8
	ldr	r1, .L250+12
	bl	dprint_vfmw
	mov	r3, r4
	str	r5, [sp]
	mov	r0, #32
	ldr	r2, .L250+8
	ldr	r1, .L250+12
	bl	dprint_vfmw
	str	r5, [sp]
	mov	r3, r4
	ldr	r2, .L250+8
	ldr	r1, .L250+12
	mov	r0, #32
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L251:
	.align	2
.L250:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_HwMem
	.word	.LANCHOR0+236
	.word	.LC31
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_SetSmmuPageTableAddr, .-VDMHAL_V4R3C1_SetSmmuPageTableAddr
	.align	2
	.global	VDMHAL_V4R3C1_EnableSmmu
	.type	VDMHAL_V4R3C1_EnableSmmu, %function
VDMHAL_V4R3C1_EnableSmmu:
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
	ldr	r3, .L253
	mov	r2, #8
	ldr	r3, [r3]
	add	r3, r3, #61440
	str	r2, [r3]
	ldmfd	sp, {fp, sp, pc}
.L254:
	.align	2
.L253:
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_EnableSmmu, .-VDMHAL_V4R3C1_EnableSmmu
	.align	2
	.global	VDMHAL_V4R3C1_GlbResetX
	.type	VDMHAL_V4R3C1_GlbResetX, %function
VDMHAL_V4R3C1_GlbResetX:
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
	mov	r8, r0
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L267
	ldr	r5, .L269
	ldr	r3, [r5]
	ldr	r7, [r3, #120]
	tst	r7, #1
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r6, .L269+4
	mov	r2, #2
	bfi	r7, r2, #8, #2
	str	r7, [r3, #120]
	mov	r4, #0
	orr	r7, r7, #16
	ldr	r3, [r6, #112]
	blx	r3
	ldr	r3, [r5]
	str	r7, [r3, #120]
	b	.L259
.L268:
	add	r4, r4, #1
	cmp	r4, #1000
	beq	.L260
.L259:
	ldr	r3, [r6, #116]
	mov	r0, #30
	blx	r3
	ldr	r3, [r5]
	ldr	r3, [r3, #372]
	tst	r3, #1
	beq	.L268
	cmp	r4, #1000
	bge	.L260
	mov	r3, r8
	ldr	r2, .L269+8
	ldr	r1, .L269+12
	mov	r0, #0
	bl	dprint_vfmw
.L262:
	ldr	r2, [r5]
	bfc	r7, #4, #1
	ldr	r3, [r6, #112]
	str	r7, [r2, #120]
	bfc	r7, #8, #2
	blx	r3
	ldr	r3, [r5]
	str	r7, [r3, #120]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L260:
	mov	r3, r8
	ldr	r2, .L269+8
	ldr	r1, .L269+16
	mov	r0, #0
	bl	dprint_vfmw
	b	.L262
.L267:
	mov	r3, #0
	ldr	r2, .L269+8
	movt	r3, 63683
	ldr	r1, .L269+20
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L270:
	.align	2
.L269:
	.word	g_pstRegCrg
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+272
	.word	.LC34
	.word	.LC33
	.word	.LC32
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_GlbResetX, .-VDMHAL_V4R3C1_GlbResetX
	.align	2
	.global	VDMHAL_V4R3C1_GlbReset
	.type	VDMHAL_V4R3C1_GlbReset, %function
VDMHAL_V4R3C1_GlbReset:
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
	beq	.L273
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDMHAL_V4R3C1_GlbResetX
.L273:
	mov	r3, #0
	ldr	r2, .L274
	movt	r3, 63683
	ldr	r1, .L274+4
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L275:
	.align	2
.L274:
	.word	.LANCHOR0+296
	.word	.LC32
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_GlbReset, .-VDMHAL_V4R3C1_GlbReset
	.align	2
	.global	VDMHAL_V4R3C1_ClearIntState
	.type	VDMHAL_V4R3C1_ClearIntState, %function
VDMHAL_V4R3C1_ClearIntState:
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
	ldr	r7, .L292
	mov	r5, r0, asl #3
	mov	r8, r0, asl #6
	rsb	r3, r5, r8
	ldr	r2, .L292+4
	add	r3, r7, r3
	ldr	r3, [r3, #8]
	ldr	r3, [r2, r3, asl #2]
	cmp	r3, #0
	ldrne	r4, [r3, #1240]
	moveq	r4, r3
	cmp	r0, #0
	bgt	.L289
	movw	r6, #1228
	ldr	r9, .L292+8
	mul	r6, r6, r0
	ldr	r3, [r9, r6]
	cmp	r3, #0
	beq	.L290
.L280:
	cmp	r4, #1
	beq	.L291
.L287:
	mvn	r2, #0
	str	r2, [r3, #32]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L289:
	mov	r2, #0
	mov	r3, r0
	str	r2, [sp]
	mov	r0, r2
	ldr	r1, .L292+12
	ldr	r2, .L292+16
	bl	dprint_vfmw
.L276:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L291:
	rsb	r5, r5, r8
	add	r7, r7, r5
	ldr	r2, [r7, #44]
	cmp	r2, #1
	beq	.L287
	cmp	r2, #2
	ldr	r1, [r3, #28]
	mvneq	r2, #11
	streq	r2, [r3, #32]
	beq	.L276
	cmp	r2, #3
	mvneq	r2, #14
	streq	r2, [r3, #32]
	b	.L276
.L290:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	strne	r3, [r9, r6]
	bne	.L280
.L281:
	ldr	r1, .L292+20
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L293:
	.align	2
.L292:
	.word	g_VdmDrvParam
	.word	s_pstVfmwChan
	.word	g_HwMem
	.word	.LC27
	.word	.LANCHOR0+320
	.word	.LC35
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_ClearIntState, .-VDMHAL_V4R3C1_ClearIntState
	.align	2
	.global	VDMHAL_V4R3C1_ClearMMUIntState
	.type	VDMHAL_V4R3C1_ClearMMUIntState, %function
VDMHAL_V4R3C1_ClearMMUIntState:
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
	bgt	.L299
	movw	r2, #1228
	ldr	r5, .L301
	mul	r4, r2, r3
	ldr	r2, [r5, r4]
	cmp	r2, #0
	beq	.L300
.L297:
	add	r2, r2, #61440
	mov	r3, #7
	str	r3, [r2, #44]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L299:
	mov	r0, #0
	ldr	r2, .L301+4
	str	r0, [sp]
	ldr	r1, .L301+8
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L300:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r2, r0, #0
	strne	r2, [r5, r4]
	bne	.L297
.L298:
	ldr	r1, .L301+12
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L302:
	.align	2
.L301:
	.word	g_HwMem
	.word	.LANCHOR0+348
	.word	.LC27
	.word	.LC35
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_ClearMMUIntState, .-VDMHAL_V4R3C1_ClearMMUIntState
	.align	2
	.global	VDMHAL_V4R3C1_MaskInt
	.type	VDMHAL_V4R3C1_MaskInt, %function
VDMHAL_V4R3C1_MaskInt:
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
	bgt	.L308
	movw	r2, #1228
	ldr	r5, .L310
	mul	r4, r2, r3
	ldr	r3, [r5, r4]
	cmp	r3, #0
	beq	.L309
.L306:
	mvn	r2, #0
	str	r2, [r3, #36]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L308:
	mov	r0, #0
	ldr	r2, .L310+4
	str	r0, [sp]
	ldr	r1, .L310+8
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L309:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	strne	r3, [r5, r4]
	bne	.L306
.L307:
	ldr	r1, .L310+12
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L311:
	.align	2
.L310:
	.word	g_HwMem
	.word	.LANCHOR0+380
	.word	.LC27
	.word	.LC35
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_MaskInt, .-VDMHAL_V4R3C1_MaskInt
	.align	2
	.global	VDMHAL_V4R3C1_GetIntMaskCfg
	.type	VDMHAL_V4R3C1_GetIntMaskCfg, %function
VDMHAL_V4R3C1_GetIntMaskCfg:
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
	.size	VDMHAL_V4R3C1_GetIntMaskCfg, .-VDMHAL_V4R3C1_GetIntMaskCfg
	.align	2
	.global	VDMHAL_V4R3C1_EnableInt
	.type	VDMHAL_V4R3C1_EnableInt, %function
VDMHAL_V4R3C1_EnableInt:
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
	ldr	r2, .L326
	mov	r3, r0, asl #6
	ldr	r1, .L326+4
	sub	r3, r3, r0, asl #3
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	ldr	r3, [r1, r3, asl #2]
	cmp	r3, #0
	ldrne	r4, [r3, #1240]
	moveq	r4, r3
	cmp	r0, #0
	bgt	.L324
	movw	r5, #1228
	ldr	r6, .L326+8
	mul	r5, r5, r0
	ldr	r3, [r6, r5]
	cmp	r3, #0
	beq	.L325
.L319:
	cmp	r4, #1
	mvneq	r2, #5
	mvnne	r2, #1
	str	r2, [r3, #36]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L324:
	mov	r2, #0
	mov	r3, r0
	str	r2, [sp]
	mov	r0, r2
	ldr	r1, .L326+12
	ldr	r2, .L326+16
	bl	dprint_vfmw
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L325:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	strne	r3, [r6, r5]
	bne	.L319
.L320:
	ldr	r1, .L326+20
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	dprint_vfmw
.L327:
	.align	2
.L326:
	.word	g_VdmDrvParam
	.word	s_pstVfmwChan
	.word	g_HwMem
	.word	.LC27
	.word	.LANCHOR0+404
	.word	.LC35
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_EnableInt, .-VDMHAL_V4R3C1_EnableInt
	.align	2
	.global	VDMHAL_V4R3C1_CheckReg
	.type	VDMHAL_V4R3C1_CheckReg, %function
VDMHAL_V4R3C1_CheckReg:
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
	bgt	.L345
	movw	r4, #1228
	ldr	r6, .L347
	mul	r4, r4, r5
	ldr	r3, [r6, r4]
	cmp	r3, #0
	beq	.L346
.L331:
	sub	r2, r7, #1
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L337
.L339:
	.word	.L342
	.word	.L340
	.word	.L341
	.word	.L343
	.word	.L333
	.word	.L335
	.word	.L336
.L343:
	mov	r3, #40
.L338:
	movw	r1, #1228
	mul	r5, r1, r5
	ldr	r2, [r6, r5]
	ldr	r0, [r2, r3]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L342:
	mov	r3, #28
	b	.L338
.L341:
	mov	r3, #36
	b	.L338
.L340:
	mov	r3, #32
	b	.L338
.L336:
	movw	r3, #62272
	b	.L338
.L333:
	movw	r3, #61480
	b	.L338
.L335:
	movw	r3, #62304
	b	.L338
.L337:
	mov	r3, r7
	ldr	r2, .L347+4
	ldr	r1, .L347+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L346:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r8, r0, #0
	beq	.L332
	str	r8, [r6, r4]
	b	.L331
.L345:
	mov	r3, r5
	ldr	r2, .L347+4
	ldr	r1, .L347+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L332:
	ldr	r2, .L347+4
	ldr	r1, .L347+16
	bl	dprint_vfmw
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L348:
	.align	2
.L347:
	.word	g_HwMem
	.word	.LANCHOR0+428
	.word	.LC38
	.word	.LC36
	.word	.LC37
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_CheckReg, .-VDMHAL_V4R3C1_CheckReg
	.align	2
	.global	VDMHAL_V4R3C1_ReadMMUMask
	.type	VDMHAL_V4R3C1_ReadMMUMask, %function
VDMHAL_V4R3C1_ReadMMUMask:
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
	ble	.L352
	mov	r1, #1
	ldr	r2, .L353
	str	r1, [sp]
	mov	r0, #32
	ldr	r1, .L353+4
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L352:
	movw	r0, #1228
	ldr	r2, .L353+8
	mul	r3, r0, r3
	ldr	r3, [r2, r3]
	add	r3, r3, #61440
	ldr	r0, [r3, #32]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L354:
	.align	2
.L353:
	.word	.LANCHOR0+452
	.word	.LC39
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_ReadMMUMask, .-VDMHAL_V4R3C1_ReadMMUMask
	.align	2
	.global	VDMHAL_V4R3C1_WriteMMUMask
	.type	VDMHAL_V4R3C1_WriteMMUMask, %function
VDMHAL_V4R3C1_WriteMMUMask:
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
	ble	.L358
	mov	r1, #1
	ldr	r2, .L359
	str	r1, [sp]
	mov	r0, #32
	ldr	r1, .L359+4
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L358:
	movw	r1, #1228
	ldr	r2, .L359+8
	mul	r3, r1, r3
	ldr	r3, [r2, r3]
	add	r3, r3, #61440
	str	r0, [r3, #32]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L360:
	.align	2
.L359:
	.word	.LANCHOR0+480
	.word	.LC31
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_WriteMMUMask, .-VDMHAL_V4R3C1_WriteMMUMask
	.align	2
	.global	VDMHAL_V4R3C1_PrepareDec
	.type	VDMHAL_V4R3C1_PrepareDec, %function
VDMHAL_V4R3C1_PrepareDec:
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
	subs	r7, r1, #0
	mov	r5, r0
	mov	r4, r2
	mov	r6, r3
	beq	.L380
	cmp	r2, #0
	bne	.L381
	sub	r1, r0, #6
	mov	r0, r2
	clz	r1, r1
	mov	r1, r1, lsr #5
	bl	SCD_ConfigReg
	mov	r3, r6
	mov	r2, r4
	mov	r1, #1
	mov	r0, #8
	bl	SCD_ConfigReg
	cmp	r5, #17
	ldrls	pc, [pc, r5, asl #2]
	b	.L363
.L366:
	.word	.L376
	.word	.L367
	.word	.L368
	.word	.L369
	.word	.L363
	.word	.L370
	.word	.L371
	.word	.L363
	.word	.L372
	.word	.L373
	.word	.L374
	.word	.L374
	.word	.L374
	.word	.L375
	.word	.L363
	.word	.L376
	.word	.L377
	.word	.L378
.L376:
	mov	r2, r6
	mov	r0, r7
	mov	r1, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	H264HAL_V4R3C1_StartDec
.L377:
	mov	r2, r6
	mov	r0, r7
	mov	r1, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	HEVCHAL_V4R3C1_StartDec
.L378:
	mov	r2, r6
	mov	r0, r7
	mov	r1, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VP9HAL_V4R3C1_StartDec
.L367:
	mov	r2, r6
	mov	r0, r7
	mov	r1, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VC1HAL_V4R3C1_StartDec
.L368:
	mov	r2, r6
	mov	r0, r7
	mov	r1, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MP4HAL_V4R3C1_StartDec
.L369:
	mov	r2, r6
	mov	r0, r7
	mov	r1, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MP2HAL_V4R3C1_StartDec
.L370:
	mov	r2, r6
	mov	r0, r7
	mov	r1, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	DIVX3HAL_V4R3C1_StartDec
.L371:
	mov	r2, r6
	mov	r0, r7
	mov	r1, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	AVSHAL_V4R3C1_StartDec
.L372:
	mov	r2, r6
	mov	r0, r7
	mov	r1, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	RV8HAL_V4R3C1_StartDec
.L373:
	mov	r2, r6
	mov	r0, r7
	mov	r1, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	RV9HAL_V4R3C1_StartDec
.L374:
	mov	r2, r6
	mov	r0, r7
	mov	r1, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VP6HAL_V4R3C1_StartDec
.L375:
	mov	r2, r6
	mov	r0, r7
	mov	r1, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VP8HAL_V4R3C1_StartDec
.L380:
	mov	r3, r7
	mov	r0, r7
	ldr	r2, .L382
	ldr	r1, .L382+4
	bl	dprint_vfmw
.L363:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L381:
	mov	r3, r2
	ldr	r1, .L382+8
	ldr	r2, .L382
	mov	r0, #0
	bl	dprint_vfmw
	b	.L363
.L383:
	.align	2
.L382:
	.word	.LANCHOR0+508
	.word	.LC40
	.word	.LC41
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_PrepareDec, .-VDMHAL_V4R3C1_PrepareDec
	.align	2
	.global	VDMHAL_V4R3C1_IsVdmReady
	.type	VDMHAL_V4R3C1_IsVdmReady, %function
VDMHAL_V4R3C1_IsVdmReady:
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
	ldr	r3, .L391
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L389
	cmp	r0, #0
	ble	.L390
	mov	r3, r0
	mov	r1, #1
	ldr	r2, .L391+4
	mov	r0, #32
	str	r1, [sp]
	ldr	r1, .L391+8
	bl	dprint_vfmw
	mov	r0, #0
.L386:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L390:
	ldr	r0, [r3, #28]
	ubfx	r0, r0, #17, #1
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L389:
	mov	r0, r3
	ldr	r2, .L391+4
	ldr	r3, .L391+12
	ldr	r1, .L391+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L386
.L392:
	.align	2
.L391:
	.word	g_HwMem
	.word	.LANCHOR0+536
	.word	.LC39
	.word	.LC42
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_IsVdmReady, .-VDMHAL_V4R3C1_IsVdmReady
	.align	2
	.global	VDMHAL_V4R3C1_IsVdmRun
	.type	VDMHAL_V4R3C1_IsVdmRun, %function
VDMHAL_V4R3C1_IsVdmRun:
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
	ldr	r3, .L400
	ldr	r4, [r3, r2]
	cmp	r4, #0
	beq	.L398
	cmp	r0, #0
	ble	.L399
	mov	r3, r0
	mov	r4, #1
	ldr	r2, .L400+4
	mov	r0, #32
	str	r4, [sp]
	ldr	r1, .L400+8
	bl	dprint_vfmw
	mov	r0, r4
.L395:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L399:
	ldr	r0, [r4, #40]
	subs	r0, r0, #1
	movne	r0, #1
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L398:
	ldr	r1, .L400+12
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	b	.L395
.L401:
	.align	2
.L400:
	.word	g_HwMem
	.word	.LANCHOR0+564
	.word	.LC39
	.word	.LC43
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_IsVdmRun, .-VDMHAL_V4R3C1_IsVdmRun
	.align	2
	.global	VDMHAL_V4R3C1_IsVdhDecOver
	.type	VDMHAL_V4R3C1_IsVdhDecOver, %function
VDMHAL_V4R3C1_IsVdhDecOver:
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
	ldr	r3, .L412
	mul	r2, r2, r1
	mov	r4, r0
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L410
	bl	VDMHAL_V4R3C1_CheckReg
	cmp	r4, #2
	beq	.L407
	cmp	r4, #3
	beq	.L407
	cmp	r4, #1
	beq	.L411
	mov	r3, r4
	ldr	r2, .L412+4
	ldr	r1, .L412+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L407:
	and	r0, r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L411:
	ubfx	r0, r0, #17, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L410:
	mov	r0, r3
	ldr	r2, .L412+4
	ldr	r3, .L412+12
	ldr	r1, .L412+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L413:
	.align	2
.L412:
	.word	g_HwMem
	.word	.LANCHOR0+588
	.word	.LC38
	.word	.LC42
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_IsVdhDecOver, .-VDMHAL_V4R3C1_IsVdhDecOver
	.align	2
	.global	VDMHAL_V4R3C1_IsVdhPartDecOver
	.type	VDMHAL_V4R3C1_IsVdhPartDecOver, %function
VDMHAL_V4R3C1_IsVdhPartDecOver:
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
	ldr	r3, .L424
	mul	r2, r2, r1
	mov	r4, r0
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L422
	bl	VDMHAL_V4R3C1_CheckReg
	cmp	r4, #1
	beq	.L418
	cmp	r4, #2
	bne	.L423
	ubfx	r0, r0, #2, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L423:
	mov	r3, r4
	ldr	r2, .L424+4
	ldr	r1, .L424+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L418:
	ubfx	r0, r0, #19, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L422:
	mov	r0, r3
	ldr	r2, .L424+4
	ldr	r3, .L424+12
	ldr	r1, .L424+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L425:
	.align	2
.L424:
	.word	g_HwMem
	.word	.LANCHOR0+616
	.word	.LC38
	.word	.LC42
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_IsVdhPartDecOver, .-VDMHAL_V4R3C1_IsVdhPartDecOver
	.align	2
	.global	VDMHAL_V4R3C1_UpdateHardwareInfo
	.type	VDMHAL_V4R3C1_UpdateHardwareInfo, %function
VDMHAL_V4R3C1_UpdateHardwareInfo:
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
	subs	r4, r0, #0
	bgt	.L427
	ldr	r2, .L475
	ldr	r3, [r2]
	cmp	r3, #1
	addne	r1, r2, #124
	bne	.L431
	b	.L428
.L471:
	cmp	r2, r1
	beq	.L470
.L431:
	ldr	r3, [r2, #4]!
	cmp	r3, #1
	bne	.L471
.L428:
	movw	r3, #1228
	ldr	r7, .L475+4
	mul	r3, r3, r4
	ldr	r3, [r7, r3]
	cmp	r3, #0
	beq	.L472
	mov	r2, #180
	ldr	r0, [r3, #12]
	mul	r2, r2, r4
	ldr	r6, .L475+8
	mov	r5, #1
	add	r1, r6, r2
	str	r0, [r6, r2]
	ldr	r8, [r3, #28]
	str	r8, [r1, #4]
.L434:
	movw	r3, #1228
	ubfx	r8, r8, #0, #17
	mla	r3, r3, r4, r7
	ldr	r0, [r3, #40]
	bl	MEM_Phy2Vir
	subs	ip, r0, #0
	beq	.L473
	movw	r1, #1228
	sub	r3, r8, #1
	mul	r1, r1, r4
	cmp	r3, #199
	subls	r3, r8, #-1073741823
	mov	r2, #180
	mla	r2, r2, r4, r6
	movls	r3, r3, asl #4
	movhi	r3, #0
	addls	r0, r3, #8
	ldr	lr, [ip, r3]
	movhi	r0, #8
	ldr	r3, [r7, r1]
	str	lr, [r2, #16]
	ldr	lr, [r3, #208]
	ldr	r0, [ip, r0]
	ldr	r1, [r3, #212]
	str	lr, [r2, #8]
	str	r0, [r2, #20]
	str	r1, [r2, #12]
	b	.L438
.L470:
	movw	r3, #1228
	ldr	r7, .L475+4
	mul	r3, r3, r4
	ldr	r3, [r7, r3]
	cmp	r3, #0
	beq	.L474
	mov	r2, #180
	ldr	r0, [r3, #12]
	mul	r2, r2, r4
	ldr	r6, .L475+8
	mov	r5, #0
	add	r1, r6, r2
	str	r0, [r6, r2]
	ldr	r2, [r3, #28]
	str	r2, [r1, #4]
.L435:
	mov	r2, #180
	add	r1, r3, #4096
	mla	r2, r2, r4, r6
	ldr	lr, [r1]
	ldr	ip, [r1, #20]
	cmp	r5, #0
	ldr	r0, [r3, #208]
	ldr	r1, [r3, #212]
	str	lr, [r2, #16]
	str	ip, [r2, #20]
	str	r0, [r2, #8]
	str	r1, [r2, #12]
	bne	.L438
	ldr	r1, [r3, #176]
	ldr	lr, [r3, #180]
	ldr	ip, [r3, #184]
	str	r1, [r2, #24]
	ldr	r0, [r3, #188]
	ldr	r1, [r3, #192]
	str	lr, [r2, #28]
	str	ip, [r2, #32]
	str	r0, [r2, #36]
	str	r1, [r2, #40]
.L438:
	mov	lr, #180
	add	r1, r3, #33024
	mul	lr, lr, r4
	add	r2, lr, #48
	add	lr, lr, #176
	add	r2, r6, r2
	add	lr, r6, lr
.L439:
	ldr	ip, [r1], #4
	str	ip, [r2, #4]!
	cmp	r2, lr
	bne	.L439
	cmp	r5, #0
	movne	r0, #0
	bne	.L460
	mov	r2, #180
	add	r3, r3, #32768
	mla	r4, r2, r4, r6
	ldr	r2, [r3, #384]
	ldr	r3, [r3, #388]
	mov	r0, r5
	str	r2, [r4, #48]
	str	r3, [r4, #44]
.L460:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L427:
	mov	r0, #0
	mov	r3, r4
	str	r0, [sp]
	ldr	r2, .L475+12
	ldr	r1, .L475+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L460
.L472:
	mov	r5, #1
.L442:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L433
	movw	r1, #1228
	mov	r2, #180
	mul	r1, r1, r4
	ldr	r6, .L475+8
	mul	r2, r2, r4
	cmp	r5, #1
	str	r3, [r7, r1]
	add	r1, r6, r2
	ldr	r0, [r3, #12]
	str	r0, [r6, r2]
	ldr	r8, [r3, #28]
	str	r8, [r1, #4]
	bne	.L435
	b	.L434
.L474:
	mov	r5, r3
	b	.L442
.L473:
	ldr	r3, .L475+20
	ldr	r2, .L475+12
	ldr	r1, .L475+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L460
.L433:
	ldr	r1, .L475+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L460
.L476:
	.align	2
.L475:
	.word	g_DSPState
	.word	g_HwMem
	.word	g_BackUp
	.word	.LANCHOR0+648
	.word	.LC27
	.word	.LC44
	.word	.LC1
	.word	.LC35
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_UpdateHardwareInfo, .-VDMHAL_V4R3C1_UpdateHardwareInfo
	.align	2
	.global	VDMHAL_V4R3C1_ReadMsgSlot
	.type	VDMHAL_V4R3C1_ReadMsgSlot, %function
VDMHAL_V4R3C1_ReadMsgSlot:
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
	beq	.L481
	cmp	r2, #800
	bhi	.L482
	ldr	r3, .L483
	mov	r2, r2, asl #2
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L482:
	mov	r0, r4
	ldr	r1, .L483+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L481:
	mov	r2, r0
	ldr	r1, .L483+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L484:
	.align	2
.L483:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC46
	.word	.LC45
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_ReadMsgSlot, .-VDMHAL_V4R3C1_ReadMsgSlot
	.align	2
	.global	VDMHAL_V4R3C1_WriteMsgSlot
	.type	VDMHAL_V4R3C1_WriteMsgSlot, %function
VDMHAL_V4R3C1_WriteMsgSlot:
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
	beq	.L486
	sub	r3, r2, #1
	cmp	r3, #255
	bhi	.L486
	ldr	r3, .L489
	mov	r2, r2, asl #2
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L486:
	ldr	r1, .L489+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L490:
	.align	2
.L489:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC47
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_WriteMsgSlot, .-VDMHAL_V4R3C1_WriteMsgSlot
	.global	__aeabi_uidiv
	.global	__aeabi_uidivmod
	.align	2
	.global	VDMHAL_V4R3C1_CfgRpMsg
	.type	VDMHAL_V4R3C1_CfgRpMsg, %function
VDMHAL_V4R3C1_CfgRpMsg:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r8, r0
	moveq	r4, #1
	movne	r4, #0
	beq	.L529
	ldr	r0, [r1, #48]
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	str	r3, [fp, #-68]
	beq	.L530
	ldr	r2, [r8, #44]
	sub	r3, r2, #1
	cmp	r3, #199
	bhi	.L531
	ldr	r1, [r8, #28]
	ldr	r0, [r8, #64]
	ldrb	ip, [r8]	@ zero_extendqisi2
	mov	r1, r1, asl r0
	ldr	r3, [r8, #32]
	add	r2, r1, #255
	cmp	ip, #1
	bic	r2, r2, #255
	mov	r3, r3, asl r0
	movne	r1, r4
	mov	ip, r2, asl #4
	beq	.L532
.L496:
	ldr	r0, [r8, #4]
	cmp	r0, #16
	beq	.L497
	add	r3, r3, #31
	mov	r0, #8
	bic	r3, r3, #31
	str	r0, [fp, #-80]
	mla	r3, r3, r2, r1
.L518:
	ldr	r2, [r8, #20]
	ldr	r4, [fp, #-68]
	mov	lr, #0	@ movhi
	mov	r0, lr	@ movhi
	str	r2, [r4]
	ldr	r2, [r8, #20]
	add	r2, r3, r2
	str	r2, [r4, #4]
	ldr	r2, [r8, #8]
	str	r2, [r4, #8]
	ldr	r2, [r8, #8]
	add	r3, r3, r2
	str	r3, [r4, #12]
	str	ip, [r4, #16]
	str	r1, [r4, #20]
	ldr	r2, [r8, #28]
	ldr	r3, [r8, #32]
	sub	r2, r2, #1
	sub	r3, r3, #1
	bfi	lr, r2, #0, #9
	bfi	r0, r3, #0, #9
	strh	lr, [fp, #-52]	@ movhi
	strh	r0, [fp, #-50]	@ movhi
	ldr	r3, [fp, #-52]
	str	r3, [r4, #24]
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
	strne	r3, [fp, #-60]
	beq	.L533
.L500:
	cmp	r1, #1
	beq	.L516
.L539:
	ldr	r3, [fp, #-60]
	sub	r3, r3, #1
	uxth	r3, r3
.L517:
	ldrb	r1, [r8]	@ zero_extendqisi2
	mov	r0, #0
	ldrb	r2, [fp, #-50]	@ zero_extendqisi2
	ldr	ip, [r8, #52]
	ldr	lr, [r8, #64]
	bfi	r2, r1, #0, #1
	ldrb	r1, [fp, #-49]	@ zero_extendqisi2
	and	ip, ip, #3
	sub	lr, lr, #4
	bfi	r2, ip, #4, #2
	bfi	r1, lr, #0, #2
	strh	r3, [fp, #-52]	@ movhi
	mov	r3, r2
	bfi	r3, ip, #6, #2
	mov	r2, r1
	ldr	r1, [fp, #-80]
	strb	r3, [fp, #-50]
	bfi	r2, r1, #2, #4
	strb	r2, [fp, #-49]
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-68]
	str	r3, [r2, #28]
.L527:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L533:
	ldr	r3, [r8, #64]
	cmp	r3, #6
	moveq	r4, #2
	beq	.L501
	cmp	r3, #5
	moveq	r4, #4
	beq	.L501
	cmp	r3, #4
	moveq	r4, #8
	bne	.L534
.L501:
	ldr	r9, [r8, #44]
	cmp	r9, #0
	movle	r3, #0
	ldrle	r1, [r8, #56]
	strle	r3, [fp, #-60]
	ble	.L500
	ldr	r2, [fp, #-84]
	mov	r6, #0
	ldr	r3, [fp, #-76]
	str	r6, [fp, #-72]
	str	r6, [fp, #-60]
	mul	r3, r3, r2
	str	r8, [fp, #-56]
	sub	r2, r4, #1
	str	r2, [fp, #-88]
	str	r3, [fp, #-92]
	sub	r3, r3, #1
	str	r3, [fp, #-96]
	b	.L504
.L537:
	ldrsh	r0, [r5, #74]
	mov	r1, r4
	sub	r0, r0, #1
	add	r0, r0, r4
	bl	__aeabi_uidiv
	mul	r3, r4, r0
	cmp	r7, r3
	str	r3, [fp, #-72]
	ldrgt	r7, [fp, #-88]
	bgt	.L507
.L506:
	add	r6, r6, #1
	cmp	r6, r9
	bge	.L535
.L515:
	cmp	r6, #199
	bgt	.L536
.L504:
	ldr	r3, [fp, #-56]
	mov	r1, r4
	add	r5, r3, r6, lsl #2
	ldrsh	r10, [r5, #78]
	ldrh	r3, [r5, #76]
	sub	r0, r10, #1
	add	r0, r0, r4
	str	r3, [fp, #-64]
	bl	__aeabi_uidiv
	cmp	r6, #0
	mul	r7, r4, r0
	bgt	.L537
	ldr	r3, [fp, #-72]
	cmp	r7, r3
	movgt	r3, #0
	movle	r3, #1
	cmp	r6, #0
	moveq	r3, #0
	cmp	r3, #0
	bne	.L506
.L509:
	ldrsh	r0, [fp, #-64]
	mov	r1, r4
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-92]
	ldr	r3, [fp, #-96]
	cmp	r2, r7
	movls	r7, r3
	ldr	r3, [fp, #-60]
	add	r3, r3, #1
	str	r3, [fp, #-60]
	mul	r5, r4, r0
	cmp	r5, r7
	movgt	r5, #0
	cmp	r3, #250
	bgt	.L538
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
	ldr	r3, [fp, #-60]
	ldr	r9, [fp, #-68]
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
	blt	.L515
.L535:
	ldr	r8, [fp, #-56]
	ldr	r1, [r8, #56]
	cmp	r1, #1
	bne	.L539
.L516:
	ldr	r3, [fp, #-76]
	mov	ip, #0	@ movhi
	str	r1, [r8, #44]
	sub	r2, r3, #1
	ldr	r3, [fp, #-84]
	ldr	r1, [fp, #-68]
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
	b	.L517
.L510:
	bl	__aeabi_uidiv
	mov	r1, r4
	mul	r10, r4, r0
	ldrsh	r0, [r5, #80]
	bl	__aeabi_uidiv
	mul	r0, r4, r0
	cmp	r10, r0
	add	r3, r0, #1
	bhi	.L511
	cmp	r10, r3
	mov	r1, r4
	beq	.L511
	ldrsh	r0, [r5, #74]
	add	r0, r0, r7
	bl	__aeabi_uidiv
	mul	r0, r4, r0
	cmp	r10, r0
	bhi	.L540
.L511:
	cmp	r8, #198
	mov	r6, r8
	add	r5, r5, #4
	bgt	.L541
	ldrsh	r10, [r5, #78]
.L507:
	add	r8, r6, #1
	mov	r1, r4
	cmp	r8, r9
	add	r0, r7, r10
	blt	.L510
	ldr	r3, [fp, #-88]
	add	r0, r3, r10
	bl	__aeabi_uidiv
	mul	r7, r4, r0
	b	.L509
.L541:
	ldr	r3, [fp, #-56]
	mov	r1, r4
	add	r2, r3, r8, lsl #2
	ldrsh	r0, [r2, #78]
	sub	r0, r0, #1
	add	r0, r0, r4
	bl	__aeabi_uidiv
	mul	r7, r4, r0
	b	.L509
.L497:
	mla	r3, r2, r3, r1
	mov	r2, #10
	str	r2, [fp, #-80]
	b	.L518
.L532:
	add	r0, r1, #508
	adds	lr, r3, #63
	add	r0, r0, #3
	addmi	lr, r3, #126
	add	r1, r1, #1020
	cmp	r0, #0
	add	r1, r1, #2
	movge	r1, r0
	mov	r0, lr, asr #6
	mov	r1, r1, asr #9
	mov	r0, r0, asl #5
	mov	r1, r1, asl #4
	mul	r1, r1, r0
	b	.L496
.L540:
	mov	r7, r10
	b	.L509
.L536:
	ldr	r8, [fp, #-56]
	mov	r0, #0
	ldr	r1, .L542
	mov	r3, #2080
	str	r6, [sp]
	ldr	r2, .L542+4
	str	r0, [fp, #-60]
	bl	dprint_vfmw
	ldr	r1, [r8, #56]
	b	.L500
.L534:
	ldr	r1, .L542+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r4, #1
	b	.L501
.L529:
	mov	r3, r1
	mov	r2, r0
	ldr	r1, .L542+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L527
.L538:
	ldr	r8, [fp, #-56]
	mov	r1, #1
	str	r1, [r8, #56]
	b	.L516
.L531:
	mov	r0, r4
	ldr	r1, .L542+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L527
.L530:
	ldr	r3, .L542+20
	ldr	r2, .L542+24
	ldr	r1, .L542+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L527
.L543:
	.align	2
.L542:
	.word	.LC52
	.word	.LANCHOR0+708
	.word	.LC51
	.word	.LC48
	.word	.LC50
	.word	.LC49
	.word	.LANCHOR0+684
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_CfgRpMsg, .-VDMHAL_V4R3C1_CfgRpMsg
	.align	2
	.global	VDMHAL_V4R3C1_CfgRpReg
	.type	VDMHAL_V4R3C1_CfgRpReg, %function
VDMHAL_V4R3C1_CfgRpReg:
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
	cmp	r1, #0
	cmpne	r2, #0
	mov	ip, #0
	mov	r5, r3
	moveq	r0, #1
	movne	r0, #0
	str	ip, [fp, #-32]
	beq	.L579
	cmp	r3, #0
	bgt	.L580
	ldr	r3, [r1]
	cmp	r3, #0
	beq	.L581
.L548:
	ldr	r4, .L583
	ldr	r3, [r1, #48]
	ldrb	r2, [r4]	@ zero_extendqisi2
	bic	r3, r3, #15
	str	r3, [fp, #-32]
	cmp	r2, #1
	bne	.L582
	movw	r1, #1228
	ldr	r2, .L583+4
	mul	r1, r1, r5
	ldr	r1, [r2, r1]
	str	r3, [r1, #16]
.L551:
	movw	r3, #1228
	movw	r1, #53763
	mul	r3, r3, r5
	movt	r1, 8192
	ldr	r3, [r2, r3]
	str	r1, [r3, #12]
.L553:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r5
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #60]
.L555:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r5
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #64]
.L557:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r5
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #68]
.L559:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r5
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #72]
.L561:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r5
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #76]
.L563:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r5
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #80]
.L565:
	movw	r3, #1228
	movw	r1, #3075
	mul	r5, r3, r5
	mov	r0, #0
	movt	r1, 48
	ldr	r3, [r2, r5]
	str	r1, [r3, #84]
.L568:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L582:
	mov	r2, #16
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r2, [r4]	@ zero_extendqisi2
	movw	r3, #53763
	cmp	r2, #1
	movt	r3, 8192
	str	r3, [fp, #-32]
	ldreq	r2, .L583+4
	beq	.L551
	mov	r2, #12
	mov	r1, #2
	ldr	r0, [fp, #4]
	movw	r6, #3075
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	movt	r6, 48
	str	r6, [fp, #-32]
	cmp	r3, #1
	ldreq	r2, .L583+4
	beq	.L553
	mov	r3, r6
	mov	r2, #60
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L583+4
	beq	.L555
	mov	r3, r6
	mov	r2, #64
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L583+4
	beq	.L557
	mov	r3, r6
	mov	r2, #68
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L583+4
	beq	.L559
	mov	r3, r6
	mov	r2, #72
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L583+4
	beq	.L561
	mov	r3, r6
	mov	r2, #76
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L583+4
	beq	.L563
	mov	r3, r6
	mov	r2, #80
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L583+4
	beq	.L565
	ldr	r0, [fp, #4]
	mov	r3, r6
	mov	r2, #84
	mov	r1, #2
	bl	VDH_Record_RegData
	mov	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L581:
	mov	r0, #0
	str	r1, [fp, #-40]
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L549
	ldr	r1, [fp, #-40]
	str	r3, [r1]
	b	.L548
.L580:
	str	r0, [sp]
	ldr	r2, .L583+8
	ldr	r1, .L583+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L568
.L579:
	mov	r3, r1
	mov	r0, ip
	ldr	r1, .L583+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L568
.L549:
	ldr	r1, .L583+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L568
.L584:
	.align	2
.L583:
	.word	g_HalDisable
	.word	g_HwMem
	.word	.LANCHOR0+732
	.word	.LC27
	.word	.LC53
	.word	.LC35
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_CfgRpReg, .-VDMHAL_V4R3C1_CfgRpReg
	.align	2
	.global	VDMHAL_V4R3C1_MakeDecReport
	.type	VDMHAL_V4R3C1_MakeDecReport, %function
VDMHAL_V4R3C1_MakeDecReport:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	subs	r3, r0, #0
	beq	.L614
	ldr	r5, [r3, #4]
	ldr	r8, [r3]
	cmp	r5, #0
	ldr	r6, [r3, #8]
	beq	.L615
	movw	r3, #1228
	ldr	r7, .L623
	mul	r3, r3, r6
	ldr	r0, [r7, r3]
	cmp	r0, #0
	beq	.L589
	ldr	r3, .L623+4
	ldr	r2, [r3]
	cmp	r2, #1
	addne	r1, r3, #124
	bne	.L592
	b	.L604
.L617:
	cmp	r3, r1
	beq	.L616
.L592:
	ldr	r2, [r3, #4]!
	cmp	r2, #1
	bne	.L617
.L604:
	mov	r4, r2
.L590:
	ldr	r3, .L623+8
	mov	r2, #824
	mov	r1, #0
	mov	r0, r5
	ldr	r3, [r3, #48]
	blx	r3
	movw	r3, #1228
	mla	r3, r3, r6, r7
	ldr	r1, .L623+12
	mov	r2, #180
	mla	r2, r2, r6, r1
	ldr	r3, [r3, #24]
	str	r3, [r5, #4]
	ldr	r3, [r2, #4]
	mov	r3, r3, lsr #17
	and	r2, r3, #3
	cmp	r2, #1
	moveq	r3, #0
	beq	.L593
	eor	r3, r3, #1
	and	r3, r3, #1
	cmp	r8, #3
	orrne	r3, r3, #1
.L593:
	mov	r2, #180
	str	r3, [r5]
	mla	r3, r2, r6, r1
	cmp	r8, #0
	cmpne	r8, #15
	ldr	r2, [r3, #4]
	ubfx	r2, r2, #0, #17
	str	r2, [r5, #12]
	beq	.L618
.L594:
	cmp	r2, #200
	bhi	.L619
.L596:
	movw	r3, #1228
	mla	r7, r3, r6, r7
	ldr	r7, [r7, #40]
	mov	r0, r7
	bl	MEM_Phy2Vir
	subs	r1, r0, #0
	beq	.L620
	ldr	r8, .L623+16
	mov	r0, #3200
	ldr	r2, [r5, #12]
	mla	r4, r0, r6, r8
	mov	r2, r2, asl #2
	mov	r0, r4
	bl	VDMHAL_V4R3C1_ReadMsgSlot
	ldr	ip, [r5, #12]
	cmp	ip, #0
	movne	r0, r4
	movne	r3, r5
	movne	r2, #0
	beq	.L601
.L600:
	ldr	r1, [r0, #4]
	add	r2, r2, #1
	cmp	r2, ip
	add	r0, r0, #16
	add	r3, r3, #4
	strh	r1, [r3, #16]	@ movhi
	ldr	r1, [r0, #-8]
	strh	r1, [r3, #18]	@ movhi
	bne	.L600
.L601:
	mov	r0, #6
	bl	IsDprintTypeEnable
	cmp	r0, #0
	bne	.L621
.L587:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L618:
	cmp	r4, #1
	beq	.L622
	ldr	r1, .L623+20
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L594
	ldrb	r3, [r3, #19]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #2
	bne	.L594
	mov	r3, #1
	strh	r1, [r5, #20]	@ movhi
	mov	r0, r1
	strh	r1, [r5, #22]	@ movhi
	str	r3, [r5, #12]
	b	.L587
.L616:
	mov	r4, #0
	b	.L590
.L621:
	ldr	r2, [r5, #12]
	mov	r0, #6
	ldr	r1, .L623+24
	mov	r4, #0
	bl	dprint_vfmw
	mov	r2, r7
	ldr	r1, .L623+28
	mov	r0, #6
	bl	dprint_vfmw
	mov	r3, #3200
	mla	r6, r3, r6, r8
.L602:
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
	ldr	r1, .L623+32
	bl	dprint_vfmw
	ldr	r3, [r5, #12]
	mov	r3, r3, asl #2
	sub	r3, r3, #3
	cmp	r3, r4
	bhi	.L602
	ldr	r1, .L623+36
	mov	r0, #6
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L619:
	mov	r3, #200
	ldr	r1, .L623+40
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r5, #12]
	b	.L596
.L622:
	ldr	r3, [r3, #16]
	ubfx	r3, r3, #21, #2
	cmp	r3, #2
	bne	.L594
	mov	r3, #0
	str	r4, [r5, #12]
	strh	r3, [r5, #20]	@ movhi
	mov	r0, r3
	strh	r3, [r5, #22]	@ movhi
	b	.L587
.L620:
	ldr	r3, .L623+44
	ldr	r2, .L623+48
	ldr	r1, .L623+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L587
.L589:
	ldr	r3, .L623+56
	ldr	r2, .L623+48
	ldr	r1, .L623+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L587
.L615:
	mov	r0, r5
	ldr	r3, .L623+60
	ldr	r2, .L623+48
	ldr	r1, .L623+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L587
.L614:
	ldr	r3, .L623+64
	ldr	r2, .L623+48
	ldr	r1, .L623+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L587
.L624:
	.align	2
.L623:
	.word	g_HwMem
	.word	g_DSPState
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_BackUp
	.word	g_UpMsg
	.word	g_not_allow_H264FullPictureRepair_flag
	.word	.LC57
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LC56
	.word	.LC44
	.word	.LANCHOR0+756
	.word	.LC1
	.word	.LC42
	.word	.LC55
	.word	.LC54
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_MakeDecReport, .-VDMHAL_V4R3C1_MakeDecReport
	.align	2
	.global	VDMHAL_V4R3C1_PrepareRepair
	.type	VDMHAL_V4R3C1_PrepareRepair, %function
VDMHAL_V4R3C1_PrepareRepair:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 8
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
	movw	r4, #1228
	mul	r4, r4, r3
	ldr	r5, .L642
	subs	r9, r1, #0
	mov	r6, r3
	mov	r7, r0
	add	r8, r4, r5
	beq	.L637
	cmp	r3, #0
	bgt	.L638
	ldr	r3, [r4, r5]
	cmp	r3, #0
	beq	.L639
.L629:
	cmp	r2, #0
	beq	.L640
	cmp	r2, #1
	movne	r0, #0
	beq	.L641
.L627:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L640:
	ldr	r4, .L642+4
	movw	r3, #1752
	mla	r3, r3, r6, r4
	ldr	r1, [r3, #44]
	cmp	r1, #0
	ble	.L632
	cmp	r7, #6
	bne	.L633
	ldrb	r1, [r9, #17]	@ zero_extendqisi2
	cmp	r1, #1
	moveq	r2, r1
	str	r2, [r3, #928]
.L633:
	ldr	r3, [fp, #4]
	mov	r2, r9
	mov	r1, r8
	mov	r0, r7
	str	r3, [sp]
	mov	r3, r6
	bl	VDMHAL_V4R3C1_CfgRpReg
	movw	r0, #1752
	mov	r1, r8
	mov	r2, r6
	mla	r0, r0, r6, r4
	bl	VDMHAL_V4R3C1_CfgRpMsg
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L641:
	cmp	r7, #6
	bne	.L635
	ldrb	r3, [r9, #17]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L635
	movw	r4, #1752
	ldr	r5, .L642+4
	mul	r4, r4, r6
	add	r1, r5, r4
	ldr	r3, [r1, #920]
	cmp	r3, #0
	ble	.L635
	ldr	r3, [fp, #4]
	mov	ip, #2
	mov	r2, r9
	mov	r0, r7
	str	r3, [sp]
	mov	r3, r6
	str	ip, [r1, #928]
	mov	r1, r8
	bl	VDMHAL_V4R3C1_CfgRpReg
	add	r0, r4, #876
	add	r0, r5, r0
	mov	r2, r6
	mov	r1, r8
	bl	VDMHAL_V4R3C1_CfgRpMsg
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L639:
	mov	r0, #0
	str	r2, [fp, #-40]
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L630
	str	r3, [r4, r5]
	ldr	r2, [fp, #-40]
	b	.L629
.L638:
	mov	r0, #0
	ldr	r2, .L642+8
	str	r0, [sp]
	ldr	r1, .L642+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L627
.L635:
	ldr	r1, .L642+16
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	b	.L627
.L637:
	mov	r2, r9
	mov	r0, r9
	ldr	r1, .L642+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L627
.L632:
	mov	r0, r2
	ldr	r1, .L642+24
	str	r2, [fp, #-40]
	bl	dprint_vfmw
	ldr	r2, [fp, #-40]
	mov	r0, r2
	b	.L627
.L630:
	ldr	r1, .L642+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L627
.L643:
	.align	2
.L642:
	.word	g_HwMem
	.word	g_RepairParam
	.word	.LANCHOR0+784
	.word	.LC27
	.word	.LC64
	.word	.LC61
	.word	.LC63
	.word	.LC62
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_PrepareRepair, .-VDMHAL_V4R3C1_PrepareRepair
	.align	2
	.global	VDMHAL_V4R3C1_StartHwRepair
	.type	VDMHAL_V4R3C1_StartHwRepair, %function
VDMHAL_V4R3C1_StartHwRepair:
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
	ldr	r6, .L674
	mov	r5, r0
	mov	r4, r1
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L668
	cmp	r0, #0
	ble	.L669
	str	r3, [sp]
	mov	r3, r0
	ldr	r2, .L674+4
	mov	r0, #32
	ldr	r1, .L674+8
	bl	dprint_vfmw
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L670
.L652:
	mov	r2, #1
	mov	r3, r5
	str	r2, [sp]
	mov	r0, #32
	ldr	r2, .L674+4
	ldr	r1, .L674+8
	bl	dprint_vfmw
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L664
.L647:
	cmp	r4, #0
	beq	.L671
	mov	r3, r5, asl #6
	ldr	r2, .L674+12
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
.L669:
	movw	r3, #1228
	ldr	r4, .L674+16
	mul	r3, r3, r0
	mov	r2, #67108864
	ldr	r3, [r4, r3]
	str	r2, [r3, #8]
.L650:
	movw	r3, #1228
	ldr	r2, .L674+20
	mul	r3, r3, r5
	mvn	r1, #1
	ldr	r3, [r4, r3]
	str	r1, [r3, #36]
	ldr	r3, [r2, #112]
	blx	r3
.L659:
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
.L644:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L668:
	mov	r3, #67108864
	mov	r2, #8
	mov	r1, #2
	mov	r0, r4
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L672
	cmp	r5, #0
	ldrle	r4, .L674+16
	bgt	.L652
	b	.L650
.L672:
	mvn	r3, #1
	mov	r2, #36
	mov	r1, #2
	mov	r0, r4
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L647
	ldr	r3, .L674+20
	ldr	r3, [r3, #112]
	blx	r3
	cmp	r5, #0
	ble	.L673
.L656:
	mov	r4, #1
	mov	r3, r5
	str	r4, [sp]
	mov	r0, #32
	ldr	r2, .L674+24
	ldr	r1, .L674+8
	bl	dprint_vfmw
	mov	r3, r5
	str	r4, [sp]
	mov	r0, #32
	ldr	r2, .L674+24
	ldr	r1, .L674+8
	bl	dprint_vfmw
	str	r4, [sp]
	mov	r3, r5
	ldr	r2, .L674+24
	ldr	r1, .L674+8
	mov	r0, #32
	bl	dprint_vfmw
	b	.L644
.L670:
	mvn	r3, #1
	mov	r2, #36
	mov	r1, #2
	mov	r0, r4
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L647
.L664:
	ldr	r3, .L674+20
	ldr	r3, [r3, #112]
	blx	r3
	b	.L656
.L671:
	mov	r3, r4
	mov	r0, r4
	ldr	r2, .L674+24
	ldr	r1, .L674+28
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	dprint_vfmw
.L673:
	ldr	r4, .L674+16
	b	.L659
.L675:
	.align	2
.L674:
	.word	g_HalDisable
	.word	.LANCHOR0+812
	.word	.LC31
	.word	g_VdmDrvParam
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+828
	.word	.LC65
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_StartHwRepair, .-VDMHAL_V4R3C1_StartHwRepair
	.align	2
	.global	VDMHAL_V4R3C1_CalVdhClkSkip
	.type	VDMHAL_V4R3C1_CalVdhClkSkip, %function
VDMHAL_V4R3C1_CalVdhClkSkip:
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
	ldr	r9, .L706
	ldr	r10, [r9, #128]
	cmp	r10, #0
	blt	.L698
	mov	r7, #0
	add	r4, r9, #128
	mov	r6, r7
	mov	r5, r7
	add	r9, r9, #252
	mov	r8, #30
	b	.L678
.L705:
	mov	r3, r10
	ldr	r2, .L706+4
	ldr	r1, .L706+8
	mov	r0, #1
	bl	dprint_vfmw
.L680:
	cmp	r4, r9
	beq	.L704
.L697:
	ldr	r10, [r4, #4]!
	cmp	r10, #0
	blt	.L704
.L678:
	mov	r0, r10
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	bne	.L705
	mov	r0, r10
	bl	FSP_GetInst
	cmp	r0, #0
	beq	.L681
	ldr	r1, [r0, #40]
	ldr	r2, [r0, #44]
	adds	r5, r1, #15
	addmi	r5, r1, #30
	adds	r6, r2, #15
	addmi	r6, r2, #30
	mov	r5, r5, asr #4
	mov	r6, r6, asr #4
.L681:
	ldr	r3, .L706+12
	mov	r0, r10
	ldr	r2, [r3, r10, asl #2]
	ldr	r3, [r2, #1600]
	cmp	r3, #30
	movgt	r8, r3
	bl	VCTRL_GetVidStd
	cmp	r0, #17
	ldrls	pc, [pc, r0, asl #2]
	b	.L699
.L684:
	.word	.L693
	.word	.L693
	.word	.L693
	.word	.L693
	.word	.L699
	.word	.L693
	.word	.L693
	.word	.L699
	.word	.L693
	.word	.L693
	.word	.L693
	.word	.L693
	.word	.L693
	.word	.L693
	.word	.L699
	.word	.L694
	.word	.L693
	.word	.L693
.L693:
	mul	r7, r6, r5
	cmp	r4, r9
	mul	r7, r7, r8
	bne	.L697
.L704:
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
.L694:
	mul	r7, r6, r5
	mul	r7, r7, r8
	mov	r7, r7, asl #1
	b	.L680
.L699:
	mov	r7, #0
	b	.L680
.L698:
	mov	r0, #25
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L707:
	.align	2
.L706:
	.word	g_ChanCtx
	.word	.LANCHOR0+856
	.word	.LC66
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_CalVdhClkSkip, .-VDMHAL_V4R3C1_CalVdhClkSkip
	.align	2
	.global	VDMHAL_V4R3C1_GetVdmClk
	.type	VDMHAL_V4R3C1_GetVdmClk, %function
VDMHAL_V4R3C1_GetVdmClk:
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
	ldr	r2, .L716
	sub	r0, r3, r0, asl #3
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L709
.L711:
	.word	.L709
	.word	.L712
	.word	.L713
	.word	.L714
.L709:
	add	r3, r2, r0
	mov	r1, #500
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L713:
	add	r3, r2, r0
	mov	r1, #100
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L712:
	add	r3, r2, r0
	mov	r1, #540
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L714:
	add	r3, r2, r0
	mov	r1, #600
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L717:
	.align	2
.L716:
	.word	g_VdmDrvParam
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_GetVdmClk, .-VDMHAL_V4R3C1_GetVdmClk
	.align	2
	.global	VDMHAL_V4R3C1_StartHwDecode
	.type	VDMHAL_V4R3C1_StartHwDecode, %function
VDMHAL_V4R3C1_StartHwDecode:
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
	ble	.L719
	mov	r0, #0
	mov	r3, r5
	str	r0, [sp]
	ldr	r2, .L756
	ldr	r1, .L756+4
	bl	dprint_vfmw
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L719:
	ldr	r6, .L756+8
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L753
	ldr	r2, .L756+12
	mov	r0, #500
	ldr	r8, .L756+16
	ldr	r1, [r2]
	ldr	r3, [r1, #120]
	tst	r3, #768
	bfcne	r3, #8, #2
	strne	r3, [r1, #120]
	mov	r3, r5, asl #6
	ldr	r1, .L756+20
	sub	r3, r3, r5, asl #3
	add	r3, r8, r3
	ldr	r7, [r3, #8]
	str	r0, [r3, #16]
	ldr	r3, [r1, r7, asl #2]
	ldr	r9, [r3, #1240]
.L723:
	ldr	r2, [r2]
	ldr	r3, [r2, #120]
	bfc	r3, #12, #5
	bfc	r3, #17, #1
	str	r3, [r2, #120]
	ldr	r3, [r2, #120]
	orr	r3, r3, #131072
	str	r3, [r2, #120]
.L725:
	mov	r2, r5
	mov	r3, r4
	mov	r1, #3
	mov	r0, #12
	bl	SCD_ConfigReg
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldr	r10, .L756+8
	cmp	r2, #1
	bne	.L754
	movw	r2, #1228
	ldr	r3, .L756+24
	mul	r2, r2, r5
	ldr	r4, .L756+28
	ldr	r1, [r3]
	movw	r3, #43690
	bfi	r3, r3, #16, #16
	cmp	r1, #1
	ldr	r2, [r4, r2]
	moveq	r1, #7
	movne	r1, #0
	str	r3, [r2, #156]
.L727:
	movw	r2, #1228
	cmp	r9, #1
	mul	r2, r2, r5
	mvneq	r3, #5
	mvnne	r3, #1
	ldr	r2, [r4, r2]
	add	r2, r2, #61440
	str	r1, [r2, #32]
.L729:
	movw	r2, #1228
	mul	r2, r2, r5
	ldr	r2, [r4, r2]
	str	r3, [r2, #36]
.L731:
	ldr	r6, .L756+32
	mov	r0, #30
	ldr	r3, [r6, #116]
	blx	r3
	ldr	r3, [r6, #112]
	blx	r3
	movw	r3, #1228
	mul	r3, r3, r5
	mov	r1, #56
	mov	r2, #0
	mov	lr, #1
	mla	r5, r1, r5, r8
	ldr	ip, .L756+36
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
.L754:
	movw	r3, #43690
	mov	r1, #2
	mov	r2, #156
	movt	r3, 43690
	mov	r0, r4
	bl	VDH_Record_RegData
	ldr	r3, .L756+24
	ldrb	r2, [r10]	@ zero_extendqisi2
	ldr	r3, [r3]
	cmp	r3, #1
	moveq	r1, #7
	movne	r1, #0
	cmp	r2, #1
	ldreq	r4, .L756+28
	beq	.L727
	mov	r3, r1
	movw	r2, #61472
	mov	r0, r4
	mov	r1, #2
	bl	VDH_Record_RegData
	cmp	r9, #1
	ldrb	r2, [r6]	@ zero_extendqisi2
	mvneq	r3, #5
	mvnne	r3, #1
	cmp	r2, #1
	ldreq	r4, .L756+28
	beq	.L729
	mov	r0, r4
	mov	r2, #36
	mov	r1, #2
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r4, .L756+28
	beq	.L731
	cmp	r4, #0
	beq	.L755
	mov	r3, #1
	str	r7, [r4, #8]
	strb	r5, [r4]
	mov	r0, r4
	str	r3, [r4, #4]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VDH_PostTask
.L753:
	mov	r3, #0
	mov	r0, r1
	mov	r2, r3
	mov	r1, r3
	bl	VDH_Record_RegData
	ldr	r8, .L756+16
	mov	r3, r5, asl #6
	ldr	r2, .L756+20
	sub	r3, r3, r5, asl #3
	ldrb	r0, [r6]	@ zero_extendqisi2
	add	r3, r8, r3
	mov	r1, #500
	cmp	r0, #1
	ldr	r7, [r3, #8]
	str	r1, [r3, #16]
	ldr	r3, [r2, r7, asl #2]
	ldreq	r2, .L756+12
	ldr	r9, [r3, #1240]
	beq	.L723
	mov	r3, #0
	mov	r2, #1
	mov	r1, r3
	mov	r0, r4
	bl	VDH_Record_RegData
	b	.L725
.L755:
	mov	r3, r4
	mov	r0, r4
	ldr	r2, .L756
	ldr	r1, .L756+40
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L757:
	.align	2
.L756:
	.word	.LANCHOR0+884
	.word	.LC27
	.word	g_HalDisable
	.word	g_pstRegCrg
	.word	g_VdmDrvParam
	.word	s_pstVfmwChan
	.word	mask_mmu_err_int
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_LowDelaySeqIndex
	.word	.LC65
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_StartHwDecode, .-VDMHAL_V4R3C1_StartHwDecode
	.align	2
	.global	VDMHAL_V4R3C1_GetCharacter
	.type	VDMHAL_V4R3C1_GetCharacter, %function
VDMHAL_V4R3C1_GetCharacter:
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
	ldr	r1, .L759
	mov	r0, #15
	ldr	r3, .L759+4
	mov	r2, #4
	str	r0, [r1]
	str	r2, [r3]
	ldmfd	sp, {fp, sp, pc}
.L760:
	.align	2
.L759:
	.word	g_VdmCharacter
	.word	g_eVdmVersion
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_GetCharacter, .-VDMHAL_V4R3C1_GetCharacter
	.align	2
	.global	VDMHAL_V4R3C1_WriteBigTitle1DYuv
	.type	VDMHAL_V4R3C1_WriteBigTitle1DYuv, %function
VDMHAL_V4R3C1_WriteBigTitle1DYuv:
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
	beq	.L762
	cmp	ip, #2
	moveq	r4, #1
	movne	r4, #2
.L762:
	ldr	r3, [fp, #-108]
	cmp	r3, #0
	beq	.L761
	mov	r3, #0
	mov	r2, #4194304
	mov	r1, r3
	str	r3, [sp]
	ldr	r0, .L851
	sub	r3, fp, #92
	bl	MEM_AllocMemBlock
	subs	r1, r0, #0
	bne	.L765
	str	r1, [sp]
	mov	r2, #4194304
	sub	r3, fp, #68
	ldr	r0, .L851+4
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	bne	.L765
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
	bne	.L766
	ldr	r3, [fp, #-100]
	mov	r1, r5, lsr #1
	ldr	r2, [fp, #-64]
	cmp	r3, #0
	ldr	r6, .L851+8
	mov	r3, r3, lsr #1
	ldr	r7, [fp, #-88]
	str	r2, [fp, #-120]
	movne	r10, r0
	add	r2, r2, #2097152
	str	r1, [fp, #-124]
	str	r2, [fp, #-128]
	str	r3, [fp, #-112]
	strne	r10, [fp, #-96]
	beq	.L768
.L767:
	cmp	r5, #0
	beq	.L770
	ldr	r2, [fp, #-96]
	mov	r4, #0
	and	r9, r2, #15
	mov	r3, r2, lsr #4
	ldr	r2, [fp, #-104]
	mul	r3, r2, r3
	add	r9, r3, r9, lsl #8
.L769:
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
	bhi	.L769
.L770:
	ldr	r3, [fp, #-96]
	add	r10, r10, r5
	ldr	r2, [fp, #-100]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	cmp	r2, r3
	bne	.L767
.L768:
	ldr	r3, [fp, #-100]
	mov	r0, r7
	ldr	r2, [fp, #-108]
	mul	r1, r5, r3
	ldr	r3, [r6, #44]
	blx	r3
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	beq	.L771
	ldr	r3, [fp, #-104]
	mov	r9, #0
	ldr	r10, [fp, #-116]
	str	r9, [fp, #-96]
	mov	r3, r3, asr #1
	str	r3, [fp, #-100]
.L772:
	cmp	r5, #0
	beq	.L775
	ldr	r2, [fp, #-96]
	mov	r4, #0
	and	r8, r2, #7
	mov	r3, r2, lsr #3
	ldr	r2, [fp, #-100]
	mul	r3, r2, r3
	add	r8, r3, r8, lsl #8
.L773:
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
	bhi	.L773
.L775:
	ldr	r3, [fp, #-96]
	add	r9, r9, r5
	ldr	r2, [fp, #-112]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	cmp	r3, r2
	bne	.L772
	ldr	r3, [fp, #4]
	cmp	r3, #1
	beq	.L849
.L777:
	ldr	r3, [fp, #4]
	cmp	r3, #0
	bne	.L778
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
.L778:
	ldr	r3, [fp, #-124]
.L848:
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
.L761:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L765:
	ldr	r1, .L851+12
	mov	r0, #1
	bl	dprint_vfmw
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L766:
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
	ldr	r6, .L851+8
	ldr	r7, [fp, #-88]
	strhi	r3, [fp, #-96]
	bls	.L785
.L787:
	cmp	r5, #0
	beq	.L788
	ldr	r2, [fp, #-96]
	mov	r4, #0
	and	r9, r2, #15
	mov	r3, r2, lsr #4
	mov	r10, r2, lsr #1
	ldr	r2, [fp, #-104]
	mul	r10, r5, r10
	mul	r3, r2, r3
	add	r9, r3, r9, lsl #8
.L786:
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
	bhi	.L786
.L788:
	ldr	r3, [fp, #-96]
	ldr	r2, [fp, #-100]
	add	r3, r3, #2
	str	r3, [fp, #-96]
	cmp	r2, r3
	bhi	.L787
.L785:
	ldr	r3, [fp, #-100]
	mov	r0, r7
	ldr	r2, [fp, #-108]
	mul	r1, r5, r3
	ldr	r3, [r6, #44]
	mov	r1, r1, lsr #1
	blx	r3
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	beq	.L789
	ldr	r3, [fp, #-104]
	mov	r9, #0
	ldr	r10, [fp, #-116]
	str	r9, [fp, #-96]
	mov	r3, r3, asr #1
	str	r3, [fp, #-100]
.L790:
	cmp	r5, #0
	beq	.L793
	ldr	r2, [fp, #-96]
	mov	r4, #0
	and	r8, r2, #7
	mov	r3, r2, lsr #3
	ldr	r2, [fp, #-100]
	mul	r3, r2, r3
	add	r8, r3, r8, lsl #8
.L791:
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
	bhi	.L791
.L793:
	ldr	r3, [fp, #-96]
	add	r9, r9, r5
	ldr	r2, [fp, #-112]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	cmp	r3, r2
	bne	.L790
	ldr	r3, [fp, #4]
	cmp	r3, #1
	beq	.L850
	ldr	r3, [fp, #4]
	cmp	r3, #0
	bne	.L796
	ldr	r2, [fp, #-112]
	ldr	r3, [fp, #-124]
	cmp	r2, r3
	bls	.L801
.L802:
	add	r3, r3, #2
	cmp	r2, r3
	bhi	.L802
.L801:
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
.L796:
	ldr	r3, [fp, #-132]
	b	.L848
.L849:
	ldr	r3, [fp, #-120]
	add	r7, r7, #1
	ldr	r4, [fp, #-124]
	mov	lr, #0
	ldr	r8, [fp, #-112]
.L779:
	cmp	r4, #0
	moveq	ip, r3
	beq	.L782
	sub	r1, r3, #-67108863
	add	ip, r3, r4
	sub	r1, r1, #65011712
	mov	r2, r7
.L780:
	ldrb	r0, [r2, #-1]	@ zero_extendqisi2
	strb	r0, [r1, #1]!
	ldrb	r0, [r2], #2	@ zero_extendqisi2
	strb	r0, [r3], #1
	cmp	r3, ip
	bne	.L780
.L782:
	add	lr, lr, #1
	mov	r3, ip
	cmp	lr, r8
	add	r7, r7, r5
	bne	.L779
	b	.L778
.L850:
	ldr	r3, [fp, #-124]
	mov	r4, #0
	ldr	lr, [fp, #-120]
	ldr	ip, [fp, #-132]
	mla	r3, r5, r3, r7
	ldr	r7, [fp, #-112]
	mov	r5, r5, asl #1
	add	r3, r3, #1
.L797:
	cmp	ip, #0
	beq	.L800
	mov	r2, r4, lsr #1
	mov	r1, r3
	mul	r2, ip, r2
	sub	r0, r2, #-67108863
	add	r9, r2, ip
	sub	r0, r0, #65011712
	add	r9, lr, r9
	add	r0, lr, r0
	add	r2, lr, r2
.L798:
	ldrb	r8, [r1, #-1]	@ zero_extendqisi2
	strb	r8, [r0, #1]!
	ldrb	r8, [r1], #2	@ zero_extendqisi2
	strb	r8, [r2], #1
	cmp	r2, r9
	bne	.L798
.L800:
	add	r4, r4, #2
	add	r3, r3, r5
	cmp	r7, r4
	bhi	.L797
	b	.L796
.L771:
	ldr	r3, [fp, #4]
	cmp	r3, #1
	bne	.L777
	b	.L778
.L789:
	ldr	r3, [fp, #4]
	cmp	r3, #1
	beq	.L796
	cmp	r3, #0
	beq	.L801
	b	.L796
.L852:
	.align	2
.L851:
	.word	.LC67
	.word	.LC69
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC68
	UNWIND(.fnend)
	.size	VDMHAL_V4R3C1_WriteBigTitle1DYuv, .-VDMHAL_V4R3C1_WriteBigTitle1DYuv
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
	ldr	ip, .L860
	mov	lr, r2
	ldrb	r2, [ip]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L859
	cmp	r0, #0
	bne	.L855
	ldr	r3, .L860+4
	ldr	r3, [r3]
	ldr	r2, [r3, #120]
	ubfx	r0, r2, #8, #2
	cmp	r1, r0
	bfine	r2, r1, #8, #2
	strne	r2, [r3, #120]
	ldmfd	sp, {fp, sp, pc}
.L855:
	cmp	r0, #1
	ldmnefd	sp, {fp, sp, pc}
	ldr	r3, .L860+4
	ldr	r3, [r3]
	ldr	r2, [r3, #120]
	bfi	r2, r1, #12, #5
	bfc	r2, #17, #1
	str	r2, [r3, #120]
	ldr	r2, [r3, #120]
	orr	r2, r2, #131072
	str	r2, [r3, #120]
	ldmfd	sp, {fp, sp, pc}
.L859:
	mov	r3, r1
	mov	r2, r0
	mov	r1, #0
	mov	r0, lr
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDH_Record_RegData
.L861:
	.align	2
.L860:
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
	ldr	ip, .L868
	mov	lr, r3
	ldrb	r3, [ip]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L866
	cmp	r2, #0
	ble	.L867
	str	r3, [sp]
	mov	r0, #32
	mov	r3, r2
	ldr	r1, .L868+4
	ldr	r2, .L868+8
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L867:
	movw	r3, #1228
	ldr	ip, .L868+12
	mul	r2, r3, r2
	ldr	r3, [ip, r2]
	str	r1, [r3, r0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L866:
	mov	r3, r1
	mov	r2, r0
	mov	r1, #2
	mov	r0, lr
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDH_Record_RegData
.L869:
	.align	2
.L868:
	.word	g_HalDisable
	.word	.LC31
	.word	.LANCHOR0+812
	.word	g_HwMem
	UNWIND(.fnend)
	.size	MFDE_ConfigReg, .-MFDE_ConfigReg
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.20535, %object
	.size	__func__.20535, 22
__func__.20535:
	.ascii	"VDMHAL_V4R3C1_OpenHAL\000"
	.space	2
	.type	__func__.20609, %object
	.size	__func__.20609, 25
__func__.20609:
	.ascii	"VDMHAL_V4R3C1_CalcFsSize\000"
	.space	3
	.type	__func__.20635, %object
	.size	__func__.20635, 24
__func__.20635:
	.ascii	"VDMHAL_V4R3C1_CalcFsNum\000"
	.type	__func__.20677, %object
	.size	__func__.20677, 32
__func__.20677:
	.ascii	"VDMHAL_V4R3C1_ArrangeMem_Normal\000"
	.type	__FUNCTION__.20678, %object
	.size	__FUNCTION__.20678, 32
__FUNCTION__.20678:
	.ascii	"VDMHAL_V4R3C1_ArrangeMem_Normal\000"
	.type	__func__.20621, %object
	.size	__func__.20621, 33
__func__.20621:
	.ascii	"VDMHAL_V4R3C1_FillMemArrangeInfo\000"
	.space	3
	.type	__func__.20758, %object
	.size	__func__.20758, 34
__func__.20758:
	.ascii	"VDMHAL_V4R3C1_ArrangeMem_Specific\000"
	.space	2
	.type	__func__.20782, %object
	.size	__func__.20782, 23
__func__.20782:
	.ascii	"VDMHAL_V4R3C1_ResetVdm\000"
	.space	1
	.type	__func__.20792, %object
	.size	__func__.20792, 35
__func__.20792:
	.ascii	"VDMHAL_V4R3C1_SetSmmuPageTableAddr\000"
	.space	1
	.type	__func__.20813, %object
	.size	__func__.20813, 24
__func__.20813:
	.ascii	"VDMHAL_V4R3C1_GlbResetX\000"
	.type	__func__.20802, %object
	.size	__func__.20802, 23
__func__.20802:
	.ascii	"VDMHAL_V4R3C1_GlbReset\000"
	.space	1
	.type	__func__.20825, %object
	.size	__func__.20825, 28
__func__.20825:
	.ascii	"VDMHAL_V4R3C1_ClearIntState\000"
	.type	__func__.20831, %object
	.size	__func__.20831, 31
__func__.20831:
	.ascii	"VDMHAL_V4R3C1_ClearMMUIntState\000"
	.space	1
	.type	__func__.20837, %object
	.size	__func__.20837, 22
__func__.20837:
	.ascii	"VDMHAL_V4R3C1_MaskInt\000"
	.space	2
	.type	__func__.20850, %object
	.size	__func__.20850, 24
__func__.20850:
	.ascii	"VDMHAL_V4R3C1_EnableInt\000"
	.type	__func__.20859, %object
	.size	__func__.20859, 23
__func__.20859:
	.ascii	"VDMHAL_V4R3C1_CheckReg\000"
	.space	1
	.type	__func__.20873, %object
	.size	__func__.20873, 26
__func__.20873:
	.ascii	"VDMHAL_V4R3C1_ReadMMUMask\000"
	.space	2
	.type	__func__.20878, %object
	.size	__func__.20878, 27
__func__.20878:
	.ascii	"VDMHAL_V4R3C1_WriteMMUMask\000"
	.space	1
	.type	__func__.20909, %object
	.size	__func__.20909, 25
__func__.20909:
	.ascii	"VDMHAL_V4R3C1_PrepareDec\000"
	.space	3
	.type	__func__.20914, %object
	.size	__func__.20914, 25
__func__.20914:
	.ascii	"VDMHAL_V4R3C1_IsVdmReady\000"
	.space	3
	.type	__func__.20919, %object
	.size	__func__.20919, 23
__func__.20919:
	.ascii	"VDMHAL_V4R3C1_IsVdmRun\000"
	.space	1
	.type	__func__.20925, %object
	.size	__func__.20925, 27
__func__.20925:
	.ascii	"VDMHAL_V4R3C1_IsVdhDecOver\000"
	.space	1
	.type	__func__.20935, %object
	.size	__func__.20935, 31
__func__.20935:
	.ascii	"VDMHAL_V4R3C1_IsVdhPartDecOver\000"
	.space	1
	.type	__func__.20950, %object
	.size	__func__.20950, 33
__func__.20950:
	.ascii	"VDMHAL_V4R3C1_UpdateHardwareInfo\000"
	.space	3
	.type	__func__.21023, %object
	.size	__func__.21023, 23
__func__.21023:
	.ascii	"VDMHAL_V4R3C1_CfgRpMsg\000"
	.space	1
	.type	__func__.21000, %object
	.size	__func__.21000, 24
__func__.21000:
	.ascii	"VDMHAL_CfgNotFullRepair\000"
	.type	__func__.21034, %object
	.size	__func__.21034, 23
__func__.21034:
	.ascii	"VDMHAL_V4R3C1_CfgRpReg\000"
	.space	1
	.type	__func__.21047, %object
	.size	__func__.21047, 28
__func__.21047:
	.ascii	"VDMHAL_V4R3C1_MakeDecReport\000"
	.type	__func__.21086, %object
	.size	__func__.21086, 28
__func__.21086:
	.ascii	"VDMHAL_V4R3C1_PrepareRepair\000"
	.type	__func__.21273, %object
	.size	__func__.21273, 15
__func__.21273:
	.ascii	"MFDE_ConfigReg\000"
	.space	1
	.type	__func__.21093, %object
	.size	__func__.21093, 28
__func__.21093:
	.ascii	"VDMHAL_V4R3C1_StartHwRepair\000"
	.type	__func__.21132, %object
	.size	__func__.21132, 28
__func__.21132:
	.ascii	"VDMHAL_V4R3C1_CalVdhClkSkip\000"
	.type	__func__.21155, %object
	.size	__func__.21155, 28
__func__.21155:
	.ascii	"VDMHAL_V4R3C1_StartHwDecode\000"
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
	ASCII(.ascii	"VDMHAL_V4R3C1_OpenHAL: Size error!\000" )
	.space	1
.LC4:
	ASCII(.ascii	"VdhId is wrong!!!\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"!!!!!! HAL memory not enouph! need %d, have %d\012\000" )
.LC6:
	ASCII(.ascii	"image size out of range\000" )
.LC7:
	ASCII(.ascii	"VDMHAL ArrangeMem HEVC 10 bit\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"%s pstVfmwFrameSizeInfo = NULL\012\000" )
.LC9:
	ASCII(.ascii	"DelAllFrameMemRecord err in VDMHAL_V4R3C1_ArrangeMe" )
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
	ASCII(.ascii	"VDMHAL_V4R3C1_CalcFsSize err!\012\000" )
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
	ASCII(.ascii	"VDMHAL_V4R3C1_ArrangeMem Mem addr is NULL\000" )
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
	ASCII(.ascii	"VDMHAL_V4R3C1_ResetVdm: map vdm register fail, vir(" )
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
	ASCII(.ascii	"%s: map vdm register 0x%x failed!\012\000" )
	.space	1
.LC33:
	ASCII(.ascii	"%s VdhId %d failed!\012\000" )
	.space	3
.LC34:
	ASCII(.ascii	"%s VdhId %d success!\012\000" )
	.space	2
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
	ASCII(.ascii	"%s: VdhId(%d)overgrown its limits\012\000" )
	.space	1
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
	ASCII(.ascii	"VDMHAL_V4R3C1_CfgRpMsg error! pRepairParam=%p, pHwM" )
	ASCII(.ascii	"em=%p\012\000" )
	.space	2
.LC49:
	ASCII(.ascii	"can not map repair msg virtual address!\000" )
.LC50:
	ASCII(.ascii	"ValidGroupNum=%d out of range!\012\000" )
.LC51:
	ASCII(.ascii	"align_mb error\012\000" )
.LC52:
	ASCII(.ascii	"[%s][%d]sclie_num is wrong! %d \012\000" )
	.space	3
.LC53:
	ASCII(.ascii	"VDMHAL_V4R3C1_CfgRpReg error! pDecParam=%p, pHwMem=" )
	ASCII(.ascii	"%p\012\000" )
	.space	1
.LC54:
	ASCII(.ascii	"'pMakeDecReport' is NULL\000" )
	.space	3
.LC55:
	ASCII(.ascii	"'pDecReport' is NULL\000" )
	.space	3
.LC56:
	ASCII(.ascii	"pDecReport->DecSliceNum(%d) > %d, set to 0 for full" )
	ASCII(.ascii	" repair.\012\000" )
	.space	3
.LC57:
	ASCII(.ascii	"\012***** UpMsg DecSliceNum=%d\012\000" )
	.space	3
.LC58:
	ASCII(.ascii	"\012***** Up Msg (phy addr: %#8x) *****\012\000" )
	.space	2
.LC59:
	ASCII(.ascii	"\0120x%02x 0x%08x 0x%08x 0x%08x 0x%08x\012\000" )
	.space	3
.LC60:
	ASCII(.ascii	"\012***** Up Msg print finished *****\012\000" )
.LC61:
	ASCII(.ascii	"VDMHAL_V4R3C1_PrepareRepair error! pDecParam=%p\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC62:
	ASCII(.ascii	"vdm register virtual address not mapped, VDMHAL_V20" )
	ASCII(.ascii	"0R003_PrepareRepair failed!\012\000" )
.LC63:
	ASCII(.ascii	"FIRST_REPAIR Parameter Error!\012\000" )
	.space	1
.LC64:
	ASCII(.ascii	"SECOND_REPAIR Parameter Error!\012\000" )
.LC65:
	ASCII(.ascii	"%s: pMfdeTask(%p) = NULL\012\000" )
	.space	2
.LC66:
	ASCII(.ascii	"%s The channel %d is not active\012\000" )
	.space	3
.LC67:
	ASCII(.ascii	"BigTile1d_y\000" )
.LC68:
	ASCII(.ascii	"failed mem_allocMemBlock BigTile_yuv save!\012\000" )
.LC69:
	ASCII(.ascii	"BigTile1d_uv\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
