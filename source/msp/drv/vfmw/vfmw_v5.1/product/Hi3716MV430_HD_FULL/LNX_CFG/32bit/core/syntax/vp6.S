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
	.file	"vp6.c"
	.text
	.align	2
	.global	Vp6_Vfmw_DecodeBool
	.type	Vp6_Vfmw_DecodeBool, %function
Vp6_Vfmw_DecodeBool:
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
	mov	r7, r1
	ldmib	r1, {r1, r5}
	mov	r6, r0
	ldr	r3, [r7, #12]
	sub	r4, r1, #1
	mul	r2, r4, r2
	mov	r4, r2, lsr #8
	add	r4, r4, #1
	mov	r2, r4, asl #16
	cmp	r5, r2
	rsbcs	r4, r4, r1
	rsbcs	r5, r2, r5
	movcs	r8, #1
	movcc	r8, #0
	cmp	r4, #127
	bls	.L6
	b	.L9
.L5:
	cmp	r4, #127
	bhi	.L11
.L6:
	subs	r3, r3, #1
	mov	r4, r4, asl #1
	mov	r5, r5, asl #1
	bne	.L5
	mov	r1, #8
	mov	r0, r6
	bl	BsGet
	cmp	r4, #127
	mov	r3, #8
	orr	r5, r5, r0
	bls	.L6
.L11:
	str	r3, [r7, #12]
.L9:
	stmib	r7, {r4, r5}
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp6_Vfmw_DecodeBool, .-Vp6_Vfmw_DecodeBool
	.align	2
	.global	Vp6_Vfmw_DecodeBool128
	.type	Vp6_Vfmw_DecodeBool128, %function
Vp6_Vfmw_DecodeBool128:
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
	ldr	r5, [r1, #4]
	mov	r4, r1
	ldr	r2, [r1, #8]
	add	r3, r5, #1
	ldr	r1, [r1, #12]
	mov	r3, r3, lsr #1
	mov	r6, r3, asl #16
	cmp	r2, r6
	rsbcs	r3, r3, r5
	rsbcs	r2, r6, r2
	movcs	r7, #1
	movcc	r5, r3, asl #1
	movcs	r5, r3, asl r7
	movcs	r6, r2, asl r7
	movcc	r6, r2, asl #1
	movcc	r7, #0
	subs	r1, r1, #1
	bne	.L15
	mov	r1, #8
	bl	BsGet
	mov	r1, #8
	orr	r6, r6, r0
.L15:
	str	r1, [r4, #12]
	mov	r0, r7
	stmib	r4, {r5, r6}
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp6_Vfmw_DecodeBool128, .-Vp6_Vfmw_DecodeBool128
	.align	2
	.global	Vp6_Vfmw_BoolRead
	.type	Vp6_Vfmw_BoolRead, %function
Vp6_Vfmw_BoolRead:
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
	subs	r4, r2, #1
	mov	r5, #0
	mov	r6, r0
	mov	r7, r1
	bmi	.L17
.L18:
	mov	r1, r7
	mov	r0, r6
	bl	Vp6_Vfmw_DecodeBool128
	orr	r5, r5, r0, asl r4
	subs	r4, r4, #1
	bcs	.L18
.L17:
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp6_Vfmw_BoolRead, .-Vp6_Vfmw_BoolRead
	.align	2
	.global	Vp6_Vfmw_StartDecode
	.type	Vp6_Vfmw_StartDecode, %function
Vp6_Vfmw_StartDecode:
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
	mov	r2, #0
	mov	r3, #255
	stmia	r1, {r2, r3}
	mov	r3, #8
	mov	r1, #24
	str	r3, [r4, #12]
	bl	BsGet
	str	r0, [r4, #8]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp6_Vfmw_StartDecode, .-Vp6_Vfmw_StartDecode
	.align	2
	.global	VP6_ArrangeVHBMem
	.type	VP6_ArrangeVHBMem, %function
VP6_ArrangeVHBMem:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
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
	ldr	r3, .L32
	mov	r4, r0
	mov	r2, #36
	mov	r1, #0
	sub	r0, fp, #64
	ldr	r3, [r3, #48]
	mov	r5, #10
	blx	r3
	add	r0, r4, #12288
	ldr	lr, [r4]
	sub	r1, fp, #64
	ldr	ip, [r0, #224]
	mov	r2, #0
	ldr	r3, [r0, #220]
	ldr	r0, [r0, #728]
	mov	ip, ip, asl #4
	str	ip, [fp, #-48]
	mov	r3, r3, asl #4
	str	r3, [fp, #-44]
	ldr	r6, [lr, #16]
	str	r3, [fp, #-52]
	cmp	r6, #24
	str	ip, [fp, #-56]
	str	r5, [fp, #-64]
	mov	ip, #8
	movne	r3, #3
	moveq	r3, #1
	str	r3, [fp, #-40]
	ldr	r3, [lr, #16]
	strb	ip, [fp, #-59]
	cmp	r3, #24
	movne	r3, #3
	moveq	r3, #1
	str	r3, [fp, #-36]
	bl	FSP_ArrangeFsPool
	cmp	r0, #2
	beq	.L30
	cmp	r0, #0
	moveq	r0, #1
	streq	r0, [r4, #252]
	bne	.L31
.L26:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L31:
	ldr	r3, .L32+4
	movw	r1, #429
	ldr	r2, .L32+8
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L30:
	add	r0, r4, #12608
	add	r0, r0, #56
	bl	ResetVoQueue
	mov	r0, #0
	b	.L26
.L33:
	.align	2
.L32:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC0
	UNWIND(.fnend)
	.size	VP6_ArrangeVHBMem, .-VP6_ArrangeVHBMem
	.align	2
	.global	VP6_GetImageBuffer
	.type	VP6_GetImageBuffer, %function
VP6_GetImageBuffer:
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
	ldrb	r3, [r0, #256]	@ zero_extendqisi2
	mvn	r2, #0
	mov	r4, r0
	str	r2, [r0, #264]
	cmp	r3, #3
	add	r5, r0, #12288
	beq	.L40
	mov	r1, #1
	ldr	r0, [r5, #728]
	bl	FSP_NewLogicFs
	mov	r3, r0
	cmp	r3, #0
	str	r0, [r4, #264]
	blt	.L41
.L38:
	ldr	r2, .L42
	movw	r1, #473
	mov	r0, #16
	bl	dprint_normal
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L40:
	ldr	r1, [r0, #272]
	ldr	r0, [r5, #728]
	bl	FSP_LinkLogicFs
	cmp	r0, #0
	ldrne	r3, [r0, #4]
	ldreq	r3, [r4, #264]
	strne	r3, [r4, #264]
	cmp	r3, #0
	bge	.L38
.L41:
	ldr	r2, .L42+4
	movw	r1, #465
	mov	r0, #0
	mov	r6, r0
	bl	dprint_normal
	ldr	r1, [r4, #268]
	ldr	r0, [r5, #728]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #272]
	ldr	r0, [r5, #728]
	bl	FSP_ClearLogicFs
	ldr	r0, [r5, #728]
	bl	FSP_GetNullLogicFs
	add	r1, r4, #12608
	str	r6, [r4, #248]
	add	r1, r1, #56
	str	r0, [r4, #272]
	str	r0, [r4, #268]
	ldr	r0, [r5, #728]
	bl	FSP_ClearNotInVoQueue
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L43:
	.align	2
.L42:
	.word	.LC2
	.word	.LC1
	UNWIND(.fnend)
	.size	VP6_GetImageBuffer, .-VP6_GetImageBuffer
	.align	2
	.global	VP6_InitFrameInfo
	.type	VP6_InitFrameInfo, %function
VP6_InitFrameInfo:
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
	add	r4, r0, #12288
	ldr	r1, [r0, #264]
	mov	r9, r0
	mov	r2, #1
	ldr	r0, [r4, #728]
	bl	FSP_SetRef
	ldr	r0, [r4, #728]
	ldr	r1, [r9, #264]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L47
	ldr	r1, [r9]
	mov	r3, #0
	mvn	r4, #0
	mvn	r5, #0
	ldr	r2, .L48
	mov	r0, #24
	ldrd	r6, [r1, #32]
	mov	r1, #504
	strd	r6, [r8, #208]
	ldr	ip, [r9]
	ldrd	r6, [ip, #48]
	strd	r6, [r8, #216]
	ldr	ip, [r9]
	ldrd	r6, [ip, #64]
	strd	r6, [r8, #224]
	ldr	ip, [r9]
	ldr	ip, [ip, #80]
	str	ip, [r8]
	ldr	ip, [r9]
	ldr	ip, [ip, #84]
	str	ip, [r8, #4]
	ldr	ip, [r9]
	ldr	ip, [ip, #88]
	str	ip, [r8, #8]
	ldr	ip, [r9]
	ldr	ip, [ip, #104]
	str	r3, [r8, #20]
	str	ip, [r8, #12]
	ldr	r3, [r9]
	strd	r4, [r3, #32]
	ldrd	r4, [r8, #216]
	strd	r4, [sp, #8]
	ldrd	r4, [r8, #208]
	strd	r4, [sp]
	bl	dprint_normal
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L47:
	ldr	r2, .L48+4
	movw	r1, #490
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r8
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L49:
	.align	2
.L48:
	.word	.LC4
	.word	.LC3
	UNWIND(.fnend)
	.size	VP6_InitFrameInfo, .-VP6_InitFrameInfo
	.align	2
	.global	VP6DEC_GetImageBuffer
	.type	VP6DEC_GetImageBuffer, %function
VP6DEC_GetImageBuffer:
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
	ldr	r0, [r4, #728]
	bl	FSP_IsNewFsAvailable
	cmp	r0, #1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	cmn	r0, #1
	beq	.L54
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L54:
	add	r1, r5, #12608
	ldr	r0, [r4, #728]
	add	r1, r1, #56
	bl	FSP_ClearNotInVoQueue
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VP6DEC_GetImageBuffer, .-VP6DEC_GetImageBuffer
	.align	2
	.global	VP6_BuildScanOrder
	.type	VP6_BuildScanOrder, %function
VP6_BuildScanOrder:
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
	add	r5, r0, #1120
	mov	r4, #1
	add	r5, r5, #12
	mov	lr, #0
	strb	lr, [r0, #1004]
.L56:
	mov	r2, r5
	mov	r3, #1
.L58:
	ldrb	ip, [r2, #1]!	@ zero_extendqisi2
	cmp	ip, lr
	addeq	ip, r0, r4
	addeq	r4, r4, #1
	streqb	r3, [ip, #1004]
	add	r3, r3, #1
	cmp	r3, #64
	bne	.L58
	add	lr, lr, #1
	cmp	lr, #16
	bne	.L56
	add	r5, r0, #1056
	add	r4, r0, #1000
	add	r5, r5, #11
	add	r4, r4, #3
	mov	lr, #0
.L59:
	mov	r3, #0
	mov	ip, r4
	mov	r2, r3
.L60:
	ldrb	r0, [ip, #1]!	@ zero_extendqisi2
	add	r2, r2, #1
	cmp	r3, r0
	movcc	r3, r0
	cmp	r2, lr
	bls	.L60
	uxtb	r3, r3
	strb	r3, [r5, #1]!
	ldr	r2, [r1, #12]
	add	lr, lr, #1
	cmp	r2, #6
	addhi	r3, r3, #1
	strhib	r3, [r5]
	cmp	lr, #64
	bne	.L59
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VP6_BuildScanOrder, .-VP6_BuildScanOrder
	.global	__aeabi_idiv
	.global	__aeabi_uidiv
	.align	2
	.global	VP6_BuildModeTree
	.type	VP6_BuildModeTree, %function
VP6_BuildModeTree:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 96
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
	mov	r9, #0
	mov	r10, #100
	mov	r7, r9
	add	r2, r0, #448
	add	r3, r0, #508
	str	r0, [fp, #-128]
	str	r0, [fp, #-132]
	str	r2, [fp, #-140]
	str	r3, [fp, #-136]
.L67:
	ldr	r3, [fp, #-128]
	ldr	r8, [fp, #-140]
	ldr	r9, [fp, #-132]
	str	r3, [fp, #-92]
	str	r3, [fp, #-88]
.L73:
	mov	r4, #0
	sub	r1, fp, #84
	mov	r2, r4
	mov	r0, r8
.L70:
	cmp	r7, r2
	add	r2, r2, #1
	add	r1, r1, #4
	add	r0, r0, #1
	ldrneb	r3, [r0, #-1]	@ zero_extendqisi2
	moveq	r3, #0
	smulbbne	r3, r3, r10
	cmp	r2, #10
	add	r4, r4, r3
	str	r3, [r1, #-4]
	bne	.L70
	ldr	r2, [fp, #-88]
	add	r8, r8, #20
	add	r9, r9, #90
	add	r2, r2, #20
	ldrb	r0, [r2, #438]	@ zero_extendqisi2
	ldrb	r3, [r2, #428]	@ zero_extendqisi2
	str	r2, [fp, #-88]
	mvn	r1, r0
	rsb	r0, r0, r0, lsl #8
	rsb	r1, r3, r1
	bl	__aeabi_idiv
	ldr	r3, [fp, #-84]
	ldr	r6, [fp, #-76]
	add	r1, r4, #1
	ldr	r5, [fp, #-92]
	mov	r2, r3
	ldr	r3, [fp, #-72]
	add	r6, r2, r6
	str	r2, [fp, #-96]
	add	r5, r5, #10
	mov	ip, r3
	ldr	r3, [fp, #-68]
	str	ip, [fp, #-100]
	add	lr, ip, r3
	str	lr, [fp, #-108]
	add	r4, lr, r6
	sub	r3, r0, #1
	rsb	r0, r4, r4, lsl #8
	strb	r3, [r5, #38]
	str	r5, [fp, #-92]
	bl	__aeabi_uidiv
	add	r1, r4, #1
	add	r3, r0, #1
	rsb	r0, r6, r6, lsl #8
	strb	r3, [r9, #-2]
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-80]
	ldr	r4, [fp, #-64]
	ldr	r5, [fp, #-56]
	ldr	r1, [fp, #-52]
	add	r5, r3, r5
	ldr	r2, [fp, #-48]
	str	r3, [fp, #-124]
	mov	r3, r4
	ldr	r4, [fp, #-60]
	add	r2, r1, r2
	add	ip, r2, #1
	str	r1, [fp, #-112]
	add	r4, r3, r4
	add	r1, r2, r5
	add	r2, r4, #1
	str	r3, [fp, #-104]
	add	r1, r1, r2
	str	ip, [fp, #-116]
	str	r2, [fp, #-120]
	add	r0, r0, #1
	strb	r0, [r9, #-1]
	rsb	r0, r5, r5, lsl #8
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-96]
	add	r1, r6, #1
	add	ip, r0, #1
	rsb	r0, r2, r2, lsl #8
	strb	ip, [r9]
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-100]
	ldr	lr, [fp, #-108]
	add	r1, lr, #1
	add	ip, r0, #1
	rsb	r0, r3, r3, lsl #8
	strb	ip, [r9, #1]
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-124]
	add	r1, r5, #1
	add	ip, r0, #1
	rsb	r0, r3, r3, lsl #8
	strb	ip, [r9, #2]
	bl	__aeabi_uidiv
	ldr	r5, [fp, #-116]
	add	r1, r5, r4
	add	r3, r0, #1
	rsb	r0, r4, r4, lsl #8
	strb	r3, [r9, #3]
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-120]
	ldr	r4, [fp, #-104]
	mov	r1, r2
	add	r3, r0, #1
	rsb	r0, r4, r4, lsl #8
	strb	r3, [r9, #4]
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-112]
	mov	r1, r5
	add	r3, r0, #1
	rsb	r0, r2, r2, lsl #8
	strb	r3, [r9, #5]
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-136]
	cmp	r8, r3
	add	r0, r0, #1
	strb	r0, [r9, #6]
	bne	.L73
	ldr	r3, [fp, #-128]
	add	r7, r7, #1
	cmp	r7, #10
	add	r3, r3, #1
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-132]
	add	r3, r3, #9
	str	r3, [fp, #-132]
	bne	.L67
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	VP6_BuildModeTree, .-VP6_BuildModeTree
	.align	2
	.global	VP6_ConfigureContexts
	.type	VP6_ConfigureContexts, %function
VP6_ConfigureContexts:
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
	add	r7, r0, #1232
	add	lr, r0, #560
	add	r7, r7, #1
	add	lr, lr, #2
	add	r0, r0, #584
.L76:
	ldr	r6, .L84
	sub	r5, r7, #33
	add	r4, lr, #6
	sub	r8, lr, #5
.L81:
	sub	ip, r5, #5
	mov	r1, r8
	mov	r2, r6
.L77:
	ldmia	r2, {r3, r9}
	add	r2, r2, #24
	ldrb	r10, [r1, #1]!	@ zero_extendqisi2
	mul	r3, r3, r10
	add	r3, r3, #128
	add	r3, r9, r3, asr #8
	cmp	r3, #255
	movge	r3, #255
	cmp	r3, #1
	movlt	r3, #1
	cmp	r1, lr
	strb	r3, [ip, #1]!
	bne	.L77
	mov	r2, r5
	mov	r3, lr
.L78:
	ldrb	r1, [r3, #1]!	@ zero_extendqisi2
	cmp	r4, r3
	strb	r1, [r2, #1]!
	bne	.L78
	add	r5, r5, #11
	add	r6, r6, #8
	cmp	r7, r5
	bne	.L81
	add	lr, lr, #11
	add	r7, r7, #33
	cmp	lr, r0
	bne	.L76
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L85:
	.align	2
.L84:
	.word	.LANCHOR0+20
	UNWIND(.fnend)
	.size	VP6_ConfigureContexts, .-VP6_ConfigureContexts
	.align	2
	.global	VP6_ConfigureEntropyDecoder
	.type	VP6_ConfigureEntropyDecoder, %function
VP6_ConfigureEntropyDecoder:
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
	UNWIND(.pad #60)
	sub	sp, sp, #60
	mov	r5, r2
	str	r2, [fp, #-96]
	add	r7, r5, #72
	ldr	r2, .L136
	mov	r8, r1
	str	r0, [fp, #-76]
	mov	r1, #128
	sub	r0, fp, #56
	str	r3, [fp, #-64]
	ldr	r4, [r2, #48]
	mov	r2, #11
	blx	r4
	mov	r3, #0
	str	r3, [fp, #-68]
.L87:
	ldr	r3, [fp, #-68]
	sub	r4, fp, #56
	add	r5, r3, #556
	sub	r6, r3, #1
	ldr	r3, .L136+4
	add	r5, r5, #2
	add	r6, r3, r6
	ldr	r3, [fp, #-76]
	add	r5, r3, r5
.L91:
	ldrb	r2, [r6, #1]!	@ zero_extendqisi2
	mov	r1, r7
	mov	r0, r8
	bl	Vp6_Vfmw_DecodeBool
	cmp	r0, #0
	beq	.L88
	mov	r10, #0
	mov	r9, #6
.L89:
	mov	r1, r7
	mov	r0, r8
	bl	Vp6_Vfmw_DecodeBool128
	orr	r10, r10, r0, asl r9
	subs	r9, r9, #1
	bcs	.L89
	mov	r3, r10, asl #1
	ands	r3, r3, #255
	moveq	r2, #1
	movne	r2, #0
	add	r3, r3, r2
	uxtb	r3, r3
	strb	r3, [r4]
	strb	r3, [r5]
.L90:
	add	r4, r4, #1
	sub	r3, fp, #45
	cmp	r4, r3
	add	r5, r5, #1
	bne	.L91
	ldr	r3, [fp, #-68]
	add	r3, r3, #11
	str	r3, [fp, #-68]
	cmp	r3, #22
	bne	.L87
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	ldr	r3, [fp, #-76]
	add	r3, r3, #580
	strne	r3, [fp, #-68]
	bne	.L93
	mov	r0, r3
	str	r3, [fp, #-68]
	ldr	r3, .L136
	mov	r2, #28
	ldr	r1, .L136+8
	ldr	r3, [r3, #52]
	blx	r3
.L93:
	mov	r1, r7
	mov	r0, r8
	bl	Vp6_Vfmw_DecodeBool128
	cmp	r0, #0
	beq	.L97
	ldr	r3, [fp, #-76]
	ldr	r4, .L136+12
	add	r5, r3, #1120
	add	r5, r5, #13
	add	r6, r4, #63
.L96:
	ldrb	r2, [r4, #1]!	@ zero_extendqisi2
	mov	r1, r7
	mov	r0, r8
	bl	Vp6_Vfmw_DecodeBool
	cmp	r0, #0
	beq	.L94
	mov	r10, #0
	mov	r9, #3
.L95:
	mov	r1, r7
	mov	r0, r8
	bl	Vp6_Vfmw_DecodeBool128
	orr	r10, r10, r0, asl r9
	subs	r9, r9, #1
	bcs	.L95
	strb	r10, [r5]
.L94:
	cmp	r4, r6
	add	r5, r5, #1
	bne	.L96
	ldr	r1, [fp, #-96]
	ldr	r0, [fp, #-76]
	bl	VP6_BuildScanOrder
.L97:
	ldr	r4, .L136+16
.L101:
	ldr	r6, [fp, #-68]
	add	r9, r4, #14
.L100:
	ldrb	r2, [r4, #1]!	@ zero_extendqisi2
	mov	r1, r7
	mov	r0, r8
	bl	Vp6_Vfmw_DecodeBool
	cmp	r0, #0
	beq	.L98
	mov	r10, #0
	mov	r5, #6
.L99:
	mov	r1, r7
	mov	r0, r8
	bl	Vp6_Vfmw_DecodeBool128
	orr	r10, r10, r0, asl r5
	subs	r5, r5, #1
	bcs	.L99
	mov	r10, r10, asl #1
	ands	r10, r10, #255
	moveq	r3, #1
	movne	r3, #0
	add	r3, r10, r3
	strb	r3, [r6]
.L98:
	cmp	r4, r9
	add	r6, r6, #1
	bne	.L100
	ldr	r3, .L136+20
	cmp	r3, r4
	ldr	r3, [fp, #-68]
	add	r3, r3, #14
	str	r3, [fp, #-68]
	bne	.L101
	mov	r3, #0
	str	r3, [fp, #-88]
.L110:
	ldr	r2, [fp, #-88]
	ldr	r1, .L136+24
	add	r3, r1, r2, lsl #1
	str	r2, [fp, #-84]
	add	r1, r2, #396
	sub	r3, r3, #1
	str	r1, [fp, #-92]
	str	r3, [fp, #-68]
.L112:
	ldr	r3, [fp, #-68]
	add	r3, r3, #66
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-84]
	str	r3, [fp, #-72]
.L109:
	ldr	r3, [fp, #-72]
	sub	r4, fp, #56
	ldr	r6, [fp, #-68]
	add	r5, r3, #608
	ldr	r3, [fp, #-76]
	add	r5, r3, r5
.L106:
	ldrb	r2, [r6, #1]!	@ zero_extendqisi2
	mov	r1, r7
	mov	r0, r8
	bl	Vp6_Vfmw_DecodeBool
	cmp	r0, #0
	beq	.L103
	mov	r10, #0
	mov	r9, #6
.L104:
	mov	r1, r7
	mov	r0, r8
	bl	Vp6_Vfmw_DecodeBool128
	orr	r10, r10, r0, asl r9
	subs	r9, r9, #1
	bcs	.L104
	mov	r3, r10, asl #1
	ands	r3, r3, #255
	moveq	r2, #1
	movne	r2, #0
	add	r3, r3, r2
	uxtb	r3, r3
	strb	r3, [r4]
	strb	r3, [r5]
.L105:
	add	r4, r4, #1
	sub	r3, fp, #45
	cmp	r4, r3
	add	r5, r5, #1
	bne	.L106
	ldr	r2, [fp, #-72]
	ldr	r3, [fp, #-68]
	add	r2, r2, #11
	str	r2, [fp, #-72]
	ldr	r2, [fp, #-80]
	add	r3, r3, #11
	str	r3, [fp, #-68]
	cmp	r2, r3
	bne	.L109
	ldr	r2, [fp, #-80]
	ldr	r3, [fp, #-84]
	str	r2, [fp, #-68]
	add	r3, r3, #198
	ldr	r2, [fp, #-92]
	str	r3, [fp, #-84]
	cmp	r3, r2
	bne	.L112
	ldr	r3, [fp, #-88]
	add	r3, r3, #66
	str	r3, [fp, #-88]
	cmp	r3, #198
	bne	.L110
	ldr	r1, [fp, #-96]
	ldr	r0, [fp, #-76]
	bl	VP6_ConfigureContexts
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L103:
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	ldreqb	r3, [r4]	@ zero_extendqisi2
	streqb	r3, [r5]
	b	.L105
.L88:
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	ldreqb	r3, [r4]	@ zero_extendqisi2
	streqb	r3, [r5]
	b	.L90
.L137:
	.align	2
.L136:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+140
	.word	.LANCHOR0+164
	.word	.LANCHOR0+616
	.word	.LANCHOR0+191
	.word	.LANCHOR0+219
	.word	.LANCHOR0+220
	UNWIND(.fnend)
	.size	VP6_ConfigureEntropyDecoder, .-VP6_ConfigureEntropyDecoder
	.align	2
	.global	VP6_decodeModeDiff
	.type	VP6_decodeModeDiff, %function
VP6_decodeModeDiff:
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
	add	r5, r1, #72
	mov	r2, #205
	mov	r7, r0
	mov	r1, r5
	bl	Vp6_Vfmw_DecodeBool
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	mov	r1, r5
	mov	r0, r7
	bl	Vp6_Vfmw_DecodeBool128
	mov	r2, #171
	mov	r1, r5
	mov	r6, r0, asl #1
	mov	r0, r7
	bl	Vp6_Vfmw_DecodeBool
	rsb	r6, r6, #1
	cmp	r0, #0
	beq	.L148
	mov	r2, #199
	mov	r1, r5
	mov	r0, r7
	bl	Vp6_Vfmw_DecodeBool
	cmp	r0, #0
	movne	r8, #0
	movne	r4, #6
	beq	.L149
.L145:
	mov	r1, r5
	mov	r0, r7
	bl	Vp6_Vfmw_DecodeBool128
	orr	r8, r8, r0, asl r4
	subs	r4, r4, #1
	bcs	.L145
	mul	r0, r8, r6
	mov	r0, r0, asl #2
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L149:
	mov	r2, #140
	mov	r1, r5
	mov	r0, r7
	bl	Vp6_Vfmw_DecodeBool
	cmp	r0, #0
	beq	.L142
	mov	r0, r6, asl #4
	sub	r0, r0, r6, asl #2
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L148:
	mov	r1, r5
	mov	r0, r7
	mov	r2, #83
	bl	Vp6_Vfmw_DecodeBool
	rsb	r0, r0, #3
	mov	r0, r6, asl r0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L142:
	mov	r2, #125
	mov	r1, r5
	mov	r0, r7
	bl	Vp6_Vfmw_DecodeBool
	cmp	r0, #0
	beq	.L143
	mov	r0, r6, asl #4
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L143:
	mov	r1, r5
	mov	r0, r7
	mov	r2, #104
	bl	Vp6_Vfmw_DecodeBool
	cmp	r0, #0
	movne	r0, r6, asl #4
	addne	r0, r0, r6, lsl #2
	moveq	r0, r6, asl #5
	subeq	r0, r0, r6, asl #3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	VP6_decodeModeDiff, .-VP6_decodeModeDiff
	.align	2
	.global	VP6_DecodeModeProbs
	.type	VP6_DecodeModeProbs, %function
VP6_DecodeModeProbs:
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
	add	r9, r0, #456
	add	r9, r9, #1
	add	r7, r2, #72
	mov	r6, r2
	mov	r5, r1
	mov	r8, #0
	str	r0, [fp, #-48]
.L157:
	mov	r2, #174
	mov	r1, r7
	mov	r0, r5
	bl	Vp6_Vfmw_DecodeBool
	cmp	r0, #0
	beq	.L151
	mov	r10, #0
	mov	r4, #3
.L152:
	mov	r1, r7
	mov	r0, r5
	bl	Vp6_Vfmw_DecodeBool128
	orr	r10, r10, r0, asl r4
	subs	r4, r4, #1
	bcs	.L152
	mov	r2, r10, asl #4
	add	r0, r8, #20
	add	r1, r2, r10, lsl #2
	mov	r2, r9
	add	r3, r8, r1
	add	r0, r1, r0
	ldr	r1, .L171
	add	r3, r1, r3
	add	r0, r1, r0
.L153:
	ldrb	r1, [r3]	@ zero_extendqisi2
	add	r3, r3, #2
	strb	r1, [r2, #1]!
	ldrb	r1, [r3, #-1]	@ zero_extendqisi2
	cmp	r3, r0
	strb	r1, [r2, #-10]
	bne	.L153
.L151:
	mov	r2, #254
	mov	r1, r7
	mov	r0, r5
	bl	Vp6_Vfmw_DecodeBool
	cmp	r0, #0
	beq	.L158
	sub	r10, r9, #456
	mov	r4, #0
	sub	r10, r10, #1
.L156:
	mov	r1, r6
	mov	r0, r5
	bl	VP6_decodeModeDiff
	ldrb	r3, [r10, #458]	@ zero_extendqisi2
	adds	r0, r3, r0
	movmi	r0, #0
	bmi	.L154
	cmp	r0, #255
	movge	r0, #255
	uxtb	r0, r0
.L154:
	strb	r0, [r10, #458]
	mov	r1, r6
	mov	r0, r5
	bl	VP6_decodeModeDiff
	ldrb	r3, [r10, #448]	@ zero_extendqisi2
	adds	r0, r3, r0
	movmi	r0, #0
	bmi	.L155
	cmp	r0, #255
	movge	r0, #255
	uxtb	r0, r0
.L155:
	add	r4, r4, #1
	strb	r0, [r10, #448]
	cmp	r4, #10
	add	r10, r10, #1
	bne	.L156
.L158:
	add	r8, r8, #320
	add	r9, r9, #20
	cmp	r8, #960
	bne	.L157
	mov	r1, r6
	ldr	r0, [fp, #-48]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VP6_BuildModeTree
.L172:
	.align	2
.L171:
	.word	.LANCHOR0+680
	UNWIND(.fnend)
	.size	VP6_DecodeModeProbs, .-VP6_DecodeModeProbs
	.align	2
	.global	VP6_ConfigureMvEntropyDecoder
	.type	VP6_ConfigureMvEntropyDecoder, %function
VP6_ConfigureMvEntropyDecoder:
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
	ldr	r7, .L211
	add	r4, r2, #72
	add	r9, r0, #44
	add	r8, r7, #34
	mov	r5, r1
	str	r0, [fp, #-52]
.L181:
	ldrb	r2, [r7]	@ zero_extendqisi2
	mov	r1, r4
	mov	r0, r5
	bl	Vp6_Vfmw_DecodeBool
	cmp	r0, #0
	beq	.L177
	mov	r10, #0
	mov	r6, #6
.L175:
	mov	r1, r4
	mov	r0, r5
	bl	Vp6_Vfmw_DecodeBool128
	orr	r10, r10, r0, asl r6
	subs	r6, r6, #1
	bcs	.L175
	mov	r10, r10, asl #1
	ands	r10, r10, #255
	strneb	r10, [r9, #2]
	moveq	r3, #1
	streqb	r3, [r9, #2]
.L177:
	ldrb	r2, [r7, #1]	@ zero_extendqisi2
	mov	r1, r4
	mov	r0, r5
	bl	Vp6_Vfmw_DecodeBool
	cmp	r0, #0
	beq	.L180
	mov	r10, #0
	mov	r6, #6
.L178:
	mov	r1, r4
	mov	r0, r5
	bl	Vp6_Vfmw_DecodeBool128
	orr	r10, r10, r0, asl r6
	subs	r6, r6, #1
	bcs	.L178
	mov	r10, r10, asl #1
	ands	r10, r10, #255
	strneb	r10, [r9]
	moveq	r3, #1
	streqb	r3, [r9]
.L180:
	add	r7, r7, #17
	add	r9, r9, #1
	cmp	r7, r8
	bne	.L181
	ldr	r3, .L211+4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-52]
	add	r9, r3, #532
	add	r9, r9, #3
.L182:
	ldr	r8, [fp, #-48]
	sub	r7, r9, #7
.L188:
	ldrb	r2, [r8, #1]!	@ zero_extendqisi2
	mov	r1, r4
	mov	r0, r5
	bl	Vp6_Vfmw_DecodeBool
	cmp	r0, #0
	beq	.L184
	mov	r10, #0
	mov	r6, #6
.L185:
	mov	r1, r4
	mov	r0, r5
	bl	Vp6_Vfmw_DecodeBool128
	orr	r10, r10, r0, asl r6
	subs	r6, r6, #1
	bcs	.L185
	mov	r10, r10, asl #1
	ands	r10, r10, #255
	strneb	r10, [r7]
	moveq	r3, #1
	streqb	r3, [r7]
.L184:
	add	r7, r7, #1
	cmp	r9, r7
	bne	.L188
	ldr	r3, [fp, #-48]
	add	r9, r9, #7
	ldr	r2, .L211+8
	add	r3, r3, #17
	str	r3, [fp, #-48]
	cmp	r3, r2
	bne	.L182
	sub	r3, r2, #27
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-52]
	add	r8, r3, #548
	add	r8, r8, #2
.L189:
	ldr	r9, [fp, #-48]
	sub	r7, r8, #8
.L195:
	ldrb	r2, [r9, #1]!	@ zero_extendqisi2
	mov	r1, r4
	mov	r0, r5
	bl	Vp6_Vfmw_DecodeBool
	cmp	r0, #0
	beq	.L191
	mov	r10, #0
	mov	r6, #6
.L192:
	mov	r1, r4
	mov	r0, r5
	bl	Vp6_Vfmw_DecodeBool128
	orr	r10, r10, r0, asl r6
	subs	r6, r6, #1
	bcs	.L192
	mov	r3, r10, asl #1
	ands	r3, r3, #255
	moveq	r3, #1
	strb	r3, [r7]
.L191:
	add	r7, r7, #1
	cmp	r8, r7
	bne	.L195
	ldr	r3, [fp, #-48]
	add	r8, r8, #8
	ldr	r2, .L211+12
	add	r3, r3, #17
	str	r3, [fp, #-48]
	cmp	r3, r2
	bne	.L189
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L212:
	.align	2
.L211:
	.word	.LANCHOR0+1640
	.word	.LANCHOR0+1641
	.word	.LANCHOR0+1675
	.word	.LANCHOR0+1682
	UNWIND(.fnend)
	.size	VP6_ConfigureMvEntropyDecoder, .-VP6_ConfigureMvEntropyDecoder
	.align	2
	.global	VP6_BoolTreeToHuffCodes
	.type	VP6_BoolTreeToHuffCodes, %function
VP6_BoolTreeToHuffCodes:
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
	ldrb	r2, [r0, #1]	@ zero_extendqisi2
	ldrb	r3, [r0]	@ zero_extendqisi2
	smulbb	r3, r2, r3
	mov	r3, r3, lsr #8
	str	r3, [r1, #44]
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	ldrb	r2, [r0]	@ zero_extendqisi2
	rsb	r3, r3, #255
	mul	r3, r2, r3
	mov	r3, r3, lsr #8
	str	r3, [r1]
	ldrb	ip, [r0]	@ zero_extendqisi2
	ldrb	r3, [r0, #2]	@ zero_extendqisi2
	rsb	ip, ip, #255
	mul	r3, r3, ip
	mov	r3, r3, lsr #8
	str	r3, [r1, #4]
	ldrb	r3, [r0, #2]	@ zero_extendqisi2
	ldrb	r2, [r0, #3]	@ zero_extendqisi2
	rsb	r3, r3, #255
	ldrb	lr, [r0, #4]	@ zero_extendqisi2
	mul	r3, ip, r3
	mov	r3, r3, lsr #8
	mul	r2, r2, r3
	mov	ip, r2, lsr #8
	mul	r2, lr, ip
	mov	r2, r2, lsr #8
	str	r2, [r1, #8]
	ldrb	r2, [r0, #4]	@ zero_extendqisi2
	ldrb	lr, [r0, #5]	@ zero_extendqisi2
	rsb	r2, r2, #255
	mul	r2, r2, ip
	mov	r2, r2, lsr #8
	mul	ip, lr, r2
	mov	ip, ip, lsr #8
	str	ip, [r1, #12]
	ldrb	ip, [r0, #5]	@ zero_extendqisi2
	rsb	ip, ip, #255
	mul	r2, ip, r2
	mov	r2, r2, lsr #8
	str	r2, [r1, #16]
	ldrb	ip, [r0, #3]	@ zero_extendqisi2
	ldrb	r2, [r0, #6]	@ zero_extendqisi2
	rsb	ip, ip, #255
	ldrb	lr, [r0, #7]	@ zero_extendqisi2
	mul	r3, ip, r3
	mov	r3, r3, lsr #8
	mul	r2, r2, r3
	mov	ip, r2, lsr #8
	mul	r2, lr, ip
	mov	r2, r2, lsr #8
	str	r2, [r1, #20]
	ldrb	r2, [r0, #7]	@ zero_extendqisi2
	rsb	r2, r2, #255
	mul	r2, r2, ip
	mov	r2, r2, lsr #8
	str	r2, [r1, #24]
	ldrb	ip, [r0, #6]	@ zero_extendqisi2
	ldrb	r2, [r0, #8]	@ zero_extendqisi2
	rsb	ip, ip, #255
	ldrb	lr, [r0, #9]	@ zero_extendqisi2
	mul	r3, ip, r3
	mov	r3, r3, lsr #8
	mul	r2, r2, r3
	mov	ip, r2, lsr #8
	mul	r2, lr, ip
	mov	r2, r2, lsr #8
	str	r2, [r1, #28]
	ldrb	r2, [r0, #9]	@ zero_extendqisi2
	rsb	r2, r2, #255
	mul	r2, r2, ip
	mov	r2, r2, lsr #8
	str	r2, [r1, #32]
	ldrb	r2, [r0, #8]	@ zero_extendqisi2
	ldrb	ip, [r0, #10]	@ zero_extendqisi2
	rsb	r2, r2, #255
	mul	r3, r2, r3
	mov	r3, r3, lsr #8
	mul	r2, ip, r3
	mov	r2, r2, lsr #8
	str	r2, [r1, #36]
	ldrb	r2, [r0, #10]	@ zero_extendqisi2
	rsb	r2, r2, #255
	mul	r3, r2, r3
	mov	r3, r3, lsr #8
	str	r3, [r1, #40]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VP6_BoolTreeToHuffCodes, .-VP6_BoolTreeToHuffCodes
	.align	2
	.global	VP6_ZerosBoolTreeToHuffCodes
	.type	VP6_ZerosBoolTreeToHuffCodes, %function
VP6_ZerosBoolTreeToHuffCodes:
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
	ldrb	ip, [r0, #1]	@ zero_extendqisi2
	ldrb	r3, [r0]	@ zero_extendqisi2
	ldrb	r2, [r0, #2]	@ zero_extendqisi2
	smulbb	r3, ip, r3
	mov	r3, r3, lsr #8
	mul	r2, r2, r3
	mov	r2, r2, lsr #8
	str	r2, [r1]
	ldrb	r2, [r0, #2]	@ zero_extendqisi2
	rsb	r2, r2, #255
	mul	r3, r3, r2
	mov	r3, r3, lsr #8
	str	r3, [r1, #4]
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	ldrb	ip, [r0]	@ zero_extendqisi2
	rsb	r3, r3, #255
	ldrb	lr, [r0, #3]	@ zero_extendqisi2
	mul	r3, ip, r3
	mov	r2, r3, lsr #8
	mul	r3, lr, r2
	mov	r3, r3, lsr #8
	str	r3, [r1, #8]
	ldrb	r3, [r0, #3]	@ zero_extendqisi2
	rsb	r3, r3, #255
	mul	r3, r3, r2
	mov	r3, r3, lsr #8
	str	r3, [r1, #12]
	ldrb	r3, [r0]	@ zero_extendqisi2
	ldrb	r4, [r0, #4]	@ zero_extendqisi2
	rsb	r3, r3, #255
	ldrb	ip, [r0, #5]	@ zero_extendqisi2
	ldrb	lr, [r0, #6]	@ zero_extendqisi2
	mul	r3, r4, r3
	mov	r3, r3, lsr #8
	mul	r3, ip, r3
	mov	r2, r3, lsr #8
	mul	r3, lr, r2
	mov	r3, r3, lsr #8
	str	r3, [r1, #16]
	ldrb	r3, [r0, #6]	@ zero_extendqisi2
	rsb	r3, r3, #255
	mul	r3, r3, r2
	mov	r3, r3, lsr #8
	str	r3, [r1, #20]
	ldrb	r3, [r0]	@ zero_extendqisi2
	ldrb	lr, [r0, #4]	@ zero_extendqisi2
	rsb	r3, r3, #255
	ldrb	r2, [r0, #5]	@ zero_extendqisi2
	ldrb	ip, [r0, #7]	@ zero_extendqisi2
	mul	r3, lr, r3
	rsb	r2, r2, #255
	mov	r3, r3, lsr #8
	mul	r3, r2, r3
	mov	r3, r3, lsr #8
	mul	r2, ip, r3
	mov	r2, r2, lsr #8
	str	r2, [r1, #24]
	ldrb	r2, [r0, #7]	@ zero_extendqisi2
	rsb	r2, r2, #255
	mul	r3, r2, r3
	mov	r3, r3, lsr #8
	str	r3, [r1, #28]
	ldrb	r3, [r0, #4]	@ zero_extendqisi2
	ldrb	r2, [r0]	@ zero_extendqisi2
	rsb	r0, r3, #255
	rsb	r3, r2, #255
	mul	r3, r3, r0
	mov	r3, r3, lsr #8
	str	r3, [r1, #32]
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	VP6_ZerosBoolTreeToHuffCodes, .-VP6_ZerosBoolTreeToHuffCodes
	.align	2
	.global	VP6_InsertSorted
	.type	VP6_InsertSorted, %function
VP6_InsertSorted:
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
	ldr	r5, [r2]
	mov	r7, r1, asl #4
	cmn	r5, #1
	beq	.L216
	mov	r3, r5, asl #4
	sub	r7, r7, r1, asl #2
	sub	r3, r3, r5, asl #2
	add	r7, r0, r7
	add	r3, r0, r3
	ldr	r6, [r7, #8]
	ldr	ip, [r3, #8]
	cmp	r6, ip
	bls	.L217
	mov	r4, r5
	b	.L219
.L227:
	add	r3, r0, r3
	ldr	lr, [r3, #8]
	cmp	lr, r6
	bcs	.L226
	mov	r4, ip
.L219:
	ldr	ip, [r3, #4]
	cmn	ip, #1
	mov	r3, ip, asl #4
	sub	r3, r3, ip, asl #2
	bne	.L227
.L218:
	mov	r3, r4, asl #4
	sub	r4, r3, r4, asl #2
	add	r0, r0, r4
	str	r1, [r0, #4]
	str	ip, [r7, #4]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L226:
	cmp	r5, ip
	bne	.L218
.L221:
	str	r1, [r2]
	str	ip, [r7, #4]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L216:
	sub	r7, r7, r1, asl #2
	add	r7, r0, r7
.L217:
	mov	ip, r5
	b	.L221
	UNWIND(.fnend)
	.size	VP6_InsertSorted, .-VP6_InsertSorted
	.align	2
	.global	VP6_BuildHuffTree
	.type	VP6_BuildHuffTree, %function
VP6_BuildHuffTree:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 376
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #380)
	sub	sp, sp, #380
	subs	r10, r2, #0
	mov	r9, r0
	mov	r0, #0
	str	r0, [fp, #-408]
	beq	.L233
	sub	r6, fp, #404
	sub	r1, r1, #4
	mov	r5, #1
	mvn	r4, #0
	mov	ip, r6
.L232:
	mov	r2, r0, asl #4
	sub	r3, fp, #44
	sub	r2, r2, r0, asl #2
	ldr	lr, [r1, #4]!
	add	r2, r3, r2
	cmp	lr, #0
	ldrb	r3, [r2, #-360]	@ zero_extendqisi2
	moveq	lr, #1
	streq	r5, [r1]
	orr	r3, r3, #1
	bfi	r3, r0, #1, #4
	add	r0, r0, #1
	cmp	r0, r10
	bfc	r3, #5, #3
	strb	r3, [r2, #-360]
	stmib	ip, {r4, lr}
	add	ip, ip, #12
	bne	.L232
	cmp	r10, #1
	bls	.L233
	sub	r7, fp, #408
	mov	r4, #1
.L234:
	mov	r1, r4
	mov	r2, r7
	mov	r0, r6
	add	r4, r4, #1
	bl	VP6_InsertSorted
	cmp	r4, r10
	bne	.L234
	ldr	r2, [fp, #-408]
.L230:
	mov	r0, r2, asl #2
	mov	r2, r2, asl #4
	rsb	r3, r0, r2
	sub	r1, fp, #44
	add	r3, r1, r3
	ldr	r3, [r3, #-356]
	cmn	r3, #1
	beq	.L228
	mov	r5, r10, asl #4
	sub	r8, r10, #2
	sub	r6, fp, #404
	sub	r5, r5, r10, asl #2
	add	r8, r8, r10
	add	r9, r9, r10, lsl #1
	and	r8, r8, #15
	add	r5, r6, r5
	sub	r7, fp, #408
	mov	r4, r10
	str	r6, [fp, #-416]
.L236:
	mov	r1, r4, asl #4
	rsb	ip, r0, r2
	sub	r1, r1, r4, asl #2
	sub	r2, fp, #44
	add	r1, r2, r1
	mov	lr, r3, asl #4
	sub	r3, lr, r3, asl #2
	add	ip, r2, ip
	ldrb	r10, [r1, #-360]	@ zero_extendqisi2
	add	r3, r2, r3
	rsb	lr, r4, r8
	ldr	r0, [ip, #-352]
	and	r10, r10, #254
	ldrb	ip, [ip, #-360]	@ zero_extendqisi2
	bfi	r10, lr, #1, #4
	ldrb	lr, [r3, #-360]	@ zero_extendqisi2
	strb	r10, [r1, #-360]
	mvn	r6, #0
	ldr	r10, [r3, #-352]
	mov	r1, r4
	str	r6, [r5, #4]
	mov	r2, r7
	add	r0, r10, r0
	str	r0, [r5, #8]
	ldr	r3, [r3, #-356]
	add	r4, r4, #1
	ldr	r0, [fp, #-416]
	add	r5, r5, #12
	strb	lr, [r9, #-3]
	sub	r9, r9, #2
	strb	ip, [r9, #-2]
	str	r3, [fp, #-408]
	bl	VP6_InsertSorted
	ldr	r2, [fp, #-408]
	sub	r1, fp, #44
	mov	r0, r2, asl #2
	mov	r2, r2, asl #4
	rsb	r3, r0, r2
	add	r3, r1, r3
	ldr	r3, [r3, #-356]
	cmp	r3, r6
	bne	.L236
.L228:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L233:
	mov	r2, #0
	b	.L230
	UNWIND(.fnend)
	.size	VP6_BuildHuffTree, .-VP6_BuildHuffTree
	.align	2
	.global	VP6_BuildHuffLookupTable
	.type	VP6_BuildHuffLookupTable, %function
VP6_BuildHuffLookupTable:
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
	mov	r4, #0
.L245:
	mov	r2, #0
	mov	lr, r2
.L244:
	rsb	r3, lr, #5
	add	r5, r0, r2, lsl #1
	mov	r3, r4, asr r3
	add	ip, lr, #1
	tst	r3, #1
	mov	lr, ip
	ldrneb	r3, [r5, #1]	@ zero_extendqisi2
	ldreqb	r3, [r0, r2, asl #1]	@ zero_extendqisi2
	and	r5, r3, #1
	ubfx	r2, r3, #1, #4
	bfi	r3, r5, #0, #1
	bfi	r3, r2, #1, #4
	eor	r3, r3, #1
	cmp	ip, #5
	movhi	r3, #0
	andls	r3, r3, #1
	cmp	r3, #0
	bne	.L244
	ldrb	r3, [r1, r4]	@ zero_extendqisi2
	bfi	r3, r2, #4, #4
	bfi	r3, ip, #1, #3
	bfi	r3, r5, #0, #1
	strb	r3, [r1, r4]
	add	r4, r4, #1
	cmp	r4, #64
	bne	.L245
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VP6_BuildHuffLookupTable, .-VP6_BuildHuffLookupTable
	.align	2
	.global	VP6_BuildTreeTab
	.type	VP6_BuildTreeTab, %function
VP6_BuildTreeTab:
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
	add	r6, r0, #9152
	add	r7, r0, #9984
	add	r6, r6, #10
	add	r7, r7, #42
	mov	r1, #0
.L249:
	sub	r5, r6, #432
.L258:
	sub	r4, r5, #96
.L256:
	ldrb	lr, [r4, #-2]	@ zero_extendqisi2
	add	r3, r0, r1
	add	ip, r1, #1
	mov	r2, r4
	add	ip, r0, ip
	add	r1, r1, #2
	strb	lr, [r3, #1262]
	mov	r3, #0
	ldrb	lr, [r4, #-1]	@ zero_extendqisi2
	strb	lr, [ip, #1262]
	b	.L254
.L252:
	ldrb	lr, [r2]	@ zero_extendqisi2
	cmp	r3, #5
	cmpne	r3, #11
	addne	r1, r1, #2
	addeq	r1, r1, #6
	add	r2, r2, #2
	strb	lr, [ip, #1262]
	ldrb	lr, [r2, #-1]	@ zero_extendqisi2
	strb	lr, [ip, #1263]
.L254:
	add	r3, r3, #1
	add	ip, r0, r1
	cmp	r3, #12
	bne	.L252
	add	r4, r4, #24
	cmp	r4, r5
	bne	.L256
	add	r5, r4, #144
	cmp	r6, r5
	bne	.L258
	add	r6, r4, #576
	cmp	r6, r7
	bne	.L249
	add	r4, r0, #9472
	add	r5, r0, #9536
	add	r4, r4, #26
	add	r5, r5, #10
	mov	r1, #768
.L257:
	ldrb	lr, [r4, #-2]	@ zero_extendqisi2
	add	r3, r0, r1
	add	ip, r1, #1
	mov	r2, r4
	add	ip, r0, ip
	add	r1, r1, #2
	strb	lr, [r3, #1262]
	mov	r3, #0
	ldrb	lr, [r4, #-1]	@ zero_extendqisi2
	strb	lr, [ip, #1262]
	b	.L263
.L261:
	ldrb	lr, [r2]	@ zero_extendqisi2
	cmp	r3, #5
	cmpne	r3, #11
	addne	r1, r1, #2
	addeq	r1, r1, #6
	add	r2, r2, #2
	strb	lr, [ip, #1262]
	ldrb	lr, [r2, #-1]	@ zero_extendqisi2
	strb	lr, [ip, #1263]
.L263:
	add	r3, r3, #1
	add	ip, r0, r1
	cmp	r3, #12
	bne	.L261
	add	r4, r4, #24
	cmp	r4, r5
	bne	.L257
	add	r5, r0, #8576
	mov	ip, #832
	mov	r4, r5
	add	r5, r5, #56
.L262:
	mov	r1, r4
	mov	r3, #0
.L268:
	ldrb	lr, [r1]	@ zero_extendqisi2
	add	r2, r0, ip
	cmp	r3, #5
	cmpne	r3, #11
	addeq	ip, ip, #6
	strb	lr, [r2, #1262]
	ldrb	lr, [r1, #1]	@ zero_extendqisi2
	strb	lr, [r2, #1263]
	beq	.L265
	cmp	r3, #13
	beq	.L273
	add	ip, ip, #2
.L265:
	add	r3, r3, #1
	add	r1, r1, #2
	cmp	r3, #14
	bne	.L268
.L267:
	add	r4, r4, #28
	cmp	r4, r5
	bne	.L262
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L273:
	add	ip, ip, #30
	b	.L267
	UNWIND(.fnend)
	.size	VP6_BuildTreeTab, .-VP6_BuildTreeTab
	.align	2
	.global	VP6_ConvertBoolToHuff
	.type	VP6_ConvertBoolToHuff, %function
VP6_ConvertBoolToHuff:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	add	r5, r0, #6592
	mov	r8, r0
	add	r5, r5, #48
	ldr	r2, .L281
	movw	r1, #1308
	mov	r0, #20
	add	r4, r8, #9472
	bl	dprint_normal
	add	r4, r4, #24
	add	r0, r8, #556
	mov	r1, r5
	add	r0, r0, #2
	add	r6, r8, #6656
	bl	VP6_BoolTreeToHuffCodes
	mov	r2, #12
	mov	r1, r5
	mov	r0, r4
	bl	VP6_BuildHuffTree
	add	r1, r8, #9536
	mov	r0, r4
	add	r6, r6, #32
	add	r1, r1, #8
	add	r5, r8, #9472
	bl	VP6_BuildHuffLookupTable
	add	r5, r5, #48
	add	r0, r8, #568
	mov	r1, r6
	add	r0, r0, #1
	add	r4, r8, #6720
	bl	VP6_BoolTreeToHuffCodes
	mov	r2, #12
	mov	r1, r6
	mov	r0, r5
	bl	VP6_BuildHuffTree
	add	r4, r4, #16
	add	r1, r8, #9600
	add	r6, r8, #8576
	mov	r0, r5
	add	r1, r1, #8
	bl	VP6_BuildHuffLookupTable
	mov	r1, r4
	add	r0, r8, #580
	add	r5, r8, #6784
	bl	VP6_ZerosBoolTreeToHuffCodes
	mov	r2, #9
	mov	r1, r4
	mov	r0, r6
	bl	VP6_BuildHuffTree
	add	r1, r8, #11968
	mov	r0, r6
	add	r5, r5, #8
	add	r1, r1, #8
	add	r4, r6, #28
	bl	VP6_BuildHuffLookupTable
	add	r0, r8, #592
	mov	r1, r5
	add	r0, r0, #2
	bl	VP6_ZerosBoolTreeToHuffCodes
	mov	r1, r5
	mov	r0, r4
	mov	r2, #9
	bl	VP6_BuildHuffTree
	add	r3, r8, #804
	mov	r0, r4
	mov	r5, r6
	mov	r4, r3
	add	r3, r8, #9664
	add	r1, r8, #12032
	mov	r6, r3
	add	r3, r8, #1200
	add	r1, r1, #8
	mov	r7, r3
	bl	VP6_BuildHuffLookupTable
	add	r3, r4, #2
	str	r8, [fp, #-72]
	str	r3, [fp, #-52]
	add	r3, r5, #56
	str	r3, [fp, #-64]
	add	r3, r6, #8
	str	r3, [fp, #-56]
	add	r3, r7, #2
	str	r3, [fp, #-68]
	add	r3, r8, #6848
	str	r3, [fp, #-60]
.L275:
	ldr	r3, [fp, #-52]
	ldr	r10, [fp, #-56]
	sub	r4, r3, #198
	ldr	r9, [fp, #-64]
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-48]
.L279:
	ldr	r8, [fp, #-48]
	add	r7, r4, #66
	mov	r6, r10
	mov	r5, r9
.L276:
	mov	r1, r8
	mov	r0, r4
	bl	VP6_BoolTreeToHuffCodes
	mov	r1, r8
	mov	r0, r5
	mov	r2, #12
	bl	VP6_BuildHuffTree
	add	r4, r4, #11
	mov	r1, r6
	mov	r0, r5
	bl	VP6_BuildHuffLookupTable
	cmp	r4, r7
	add	r8, r8, #48
	add	r6, r6, #64
	add	r5, r5, #24
	bne	.L276
	ldr	r3, [fp, #-52]
	add	r9, r9, #144
	add	r10, r10, #384
	cmp	r3, r4
	ldr	r3, [fp, #-48]
	add	r3, r3, #288
	str	r3, [fp, #-48]
	bne	.L279
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-52]
	add	r2, r2, #864
	str	r2, [fp, #-60]
	ldr	r2, [fp, #-68]
	add	r3, r3, #198
	str	r3, [fp, #-52]
	cmp	r3, r2
	ldr	r3, [fp, #-64]
	add	r3, r3, #432
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-56]
	add	r3, r3, #1152
	str	r3, [fp, #-56]
	bne	.L275
	ldr	r8, [fp, #-72]
	mov	r0, r8
	bl	VP6_BuildTreeTab
	ldr	r2, .L281+4
	movw	r1, #1338
	mov	r0, #20
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_normal
.L282:
	.align	2
.L281:
	.word	.LC5
	.word	.LC6
	UNWIND(.fnend)
	.size	VP6_ConvertBoolToHuff, .-VP6_ConvertBoolToHuff
	.align	2
	.global	VP6_IntraFrmHeader
	.type	VP6_IntraFrmHeader, %function
VP6_IntraFrmHeader:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	r2, .L322
	mov	r4, r1
	mov	r8, r0
	movw	r1, #1347
	mov	r0, #20
	bl	dprint_normal
	mov	r1, #5
	mov	r0, r4
	add	r7, r8, #8192
	bl	BsGet
	mov	r1, #2
	uxtb	r3, r0
	mov	r0, r4
	str	r3, [r7, #4068]
	bl	BsGet
	ldr	r3, [r7, #4068]
	cmp	r3, #8
	uxtb	r0, r0
	str	r0, [r7, #4072]
	bhi	.L318
	mov	r1, #1
	mov	r0, r4
	bl	BsGet
	uxtb	r5, r0
	cmp	r5, #0
	bne	.L319
	ldrb	r3, [r7, #4058]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L287
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	add	r3, r8, #12288
	mov	r2, #255
	str	r3, [fp, #-48]
	mov	ip, r3
	mov	r1, #24
	mov	r3, #8
	str	r5, [ip, #32]
	str	r2, [ip, #36]
	mov	r5, ip
	str	r3, [ip, #44]
	str	r0, [ip, #12]
	mov	r0, r4
	bl	BsGet
	str	r0, [r5, #40]
.L288:
	add	r5, r8, #12288
	mov	r9, #0
	add	r5, r5, #32
	mov	r6, #7
.L289:
	mov	r1, r5
	mov	r0, r4
	bl	Vp6_Vfmw_DecodeBool128
	orr	r9, r9, r0, asl r6
	subs	r6, r6, #1
	bcs	.L289
	mov	r6, #0
	mov	r10, #7
	uxtb	r3, r9
	str	r3, [r7, #4080]
.L290:
	mov	r1, r5
	mov	r0, r4
	bl	Vp6_Vfmw_DecodeBool128
	orr	r6, r6, r0, asl r10
	subs	r10, r10, #1
	bcs	.L290
	ldr	r3, [r7, #4080]
	uxtb	r2, r6
	mov	r10, #0
	mov	r6, #7
	mov	r9, r2, asl #1
	str	r2, [r7, #4084]
	mov	r3, r3, asl #1
	str	r9, [r7, #4092]
	str	r3, [fp, #-52]
	str	r3, [r7, #4088]
.L291:
	mov	r1, r5
	mov	r0, r4
	bl	Vp6_Vfmw_DecodeBool128
	orr	r10, r10, r0, asl r6
	subs	r6, r6, #1
	bcs	.L291
	ldr	r3, [fp, #-48]
	uxtb	r1, r10
	mov	r6, #0
	mov	r10, #7
	mov	r1, r1, asl #1
	str	r1, [r3]
.L292:
	mov	r1, r5
	mov	r0, r4
	bl	Vp6_Vfmw_DecodeBool128
	orr	r6, r6, r0, asl r10
	subs	r10, r10, #1
	bcs	.L292
	ldr	r3, [fp, #-48]
	uxtb	r2, r6
	mov	r1, r5
	mov	r0, r4
	mov	r2, r2, asl #1
	str	r2, [r3, #4]
	bl	Vp6_Vfmw_DecodeBool128
	mov	r1, r5
	str	r0, [fp, #-56]
	mov	r0, r4
	bl	Vp6_Vfmw_DecodeBool128
	ldr	r3, [fp, #-56]
	orr	r0, r0, r3, asl #1
	ldr	r3, [fp, #-52]
	strb	r0, [r7, #4059]
	ldr	r2, [r8, #4]
	cmp	r3, r2
	ldr	r3, [r8]
	bne	.L294
	cmp	r9, r3
	beq	.L295
.L294:
	ldr	r1, [fp, #-52]
	mov	r0, #20
	str	r2, [sp]
	str	r9, [sp, #4]
	str	r1, [sp, #8]
	movw	r1, #1397
	ldr	r2, .L322+4
	bl	dprint_normal
.L295:
	ldr	r3, [fp, #-52]
	str	r9, [r8]
	str	r3, [r8, #4]
	ldr	r3, [r7, #4072]
	cmp	r3, #0
	bne	.L320
	mov	r2, #14
	strb	r2, [r7, #4062]
	ldr	r2, [fp, #-48]
	str	r3, [r2, #16]
.L304:
	ldr	r2, .L322+8
	movw	r1, #1444
	mov	r0, #20
	bl	dprint_normal
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L318:
	ldr	r2, .L322+12
	movw	r1, #1355
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L287:
	add	r2, r8, #12288
	mov	ip, #255
	str	r2, [fp, #-48]
	mov	r1, #24
	mov	r5, r2
	mov	r0, r4
	mov	r2, #8
	str	r3, [r5, #32]
	str	ip, [r5, #36]
	str	r2, [r5, #44]
	bl	BsGet
	str	r0, [r5, #40]
	b	.L288
.L319:
	ldr	r2, .L322+16
	movw	r1, #1362
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L320:
	mov	r1, r5
	mov	r0, r4
	bl	Vp6_Vfmw_DecodeBool128
	cmp	r0, #0
	beq	.L297
	ldr	r2, [fp, #-48]
	mov	r8, #0
	mov	r6, #4
	mov	r3, #2
	str	r3, [r2, #16]
.L298:
	mov	r1, r5
	mov	r0, r4
	bl	Vp6_Vfmw_DecodeBool128
	orr	r8, r8, r0, asl r6
	subs	r6, r6, #1
	bcs	.L298
	ldr	r3, [r7, #4068]
	mov	r9, #0
	mov	r6, #2
	cmp	r3, #7
	movhi	r3, r9
	movls	r3, #5
	mov	r8, r8, asl r3
	strb	r8, [r7, #4060]
.L300:
	mov	r1, r5
	mov	r0, r4
	bl	Vp6_Vfmw_DecodeBool128
	orr	r9, r9, r0, asl r6
	subs	r6, r6, #1
	bcs	.L300
	strb	r9, [r7, #4061]
.L301:
	ldr	r3, [r7, #4068]
	cmp	r3, #7
	bls	.L321
	mov	r8, #0
	mov	r6, #3
.L303:
	mov	r1, r5
	mov	r0, r4
	bl	Vp6_Vfmw_DecodeBool128
	orr	r8, r8, r0, asl r6
	subs	r6, r6, #1
	bcs	.L303
	strb	r8, [r7, #4062]
	b	.L304
.L321:
	mov	r3, #16
	strb	r3, [r7, #4062]
	b	.L304
.L297:
	mov	r1, r5
	mov	r0, r4
	bl	Vp6_Vfmw_DecodeBool128
	cmp	r0, #0
	ldrne	r2, [fp, #-48]
	movne	r3, #1
	ldreq	r3, [fp, #-48]
	strne	r3, [r2, #16]
	streq	r0, [r3, #16]
	b	.L301
.L323:
	.align	2
.L322:
	.word	.LC7
	.word	.LC10
	.word	.LC11
	.word	.LC8
	.word	.LC9
	UNWIND(.fnend)
	.size	VP6_IntraFrmHeader, .-VP6_IntraFrmHeader
	.align	2
	.global	VP6_InterFrmHeader
	.type	VP6_InterFrmHeader, %function
VP6_InterFrmHeader:
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
	add	r4, r0, #8192
	mov	r6, r0
	mov	r8, r1
	ldr	r3, [r4, #3924]
	cmp	r3, #0
	beq	.L346
	ldrb	r2, [r4, #4058]	@ zero_extendqisi2
	ldr	r1, [r4, #3928]
	cmp	r2, #0
	str	r3, [r4, #4068]
	str	r1, [r4, #4072]
	bne	.L347
	add	r5, r0, #12288
	mov	ip, #255
	mov	r3, #8
	mov	r1, #24
	str	r2, [r5, #32]
	mov	r0, r8
	str	ip, [r5, #36]
	str	r3, [r5, #44]
	bl	BsGet
	str	r0, [r5, #40]
.L328:
	add	r7, r6, #12288
	mov	r0, r8
	add	r7, r7, #32
	mov	r1, r7
	bl	Vp6_Vfmw_DecodeBool128
	str	r0, [r5, #20]
	str	r0, [r6, #24]
	ldr	r3, [r4, #3928]
	cmp	r3, #0
	bne	.L348
	mov	r0, #1
	mov	r2, #14
	strb	r2, [r4, #4062]
	str	r3, [r5, #16]
.L345:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L347:
	mov	r1, #16
	mov	r0, r8
	bl	BsGet
	add	r5, r6, #12288
	mov	r3, #0
	mov	r2, #255
	str	r3, [r5, #32]
	mov	r1, #24
	mov	r3, #8
	str	r2, [r5, #36]
	str	r3, [r5, #44]
	str	r0, [r5, #12]
	mov	r0, r8
	bl	BsGet
	str	r0, [r5, #40]
	b	.L328
.L348:
	mov	r1, r7
	mov	r0, r8
	bl	Vp6_Vfmw_DecodeBool128
	cmp	r0, #0
	mov	r6, r0
	str	r0, [r5, #24]
	bne	.L349
.L330:
	ldr	r3, [r4, #3924]
	cmp	r3, #7
	bhi	.L350
	mov	r3, #16
	mov	r0, #1
	strb	r3, [r4, #4062]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L350:
	mov	r1, r7
	mov	r0, r8
	bl	Vp6_Vfmw_DecodeBool128
	cmp	r0, #0
	moveq	r0, #1
	beq	.L345
	mov	r1, r7
	mov	r0, r8
	bl	Vp6_Vfmw_DecodeBool128
	cmp	r0, #0
	beq	.L332
	mov	r9, #0
	mov	r6, #4
	mov	r3, #2
	str	r3, [r5, #16]
.L333:
	mov	r1, r7
	mov	r0, r8
	bl	Vp6_Vfmw_DecodeBool128
	orr	r9, r9, r0, asl r6
	subs	r6, r6, #1
	bcs	.L333
	mov	r6, #0
	mov	r5, #2
	strb	r9, [r4, #4060]
.L334:
	mov	r1, r7
	mov	r0, r8
	bl	Vp6_Vfmw_DecodeBool128
	orr	r6, r6, r0, asl r5
	subs	r5, r5, #1
	bcs	.L334
	strb	r6, [r4, #4061]
.L335:
	mov	r6, #0
	mov	r5, #3
.L337:
	mov	r1, r7
	mov	r0, r8
	bl	Vp6_Vfmw_DecodeBool128
	orr	r6, r6, r0, asl r5
	subs	r5, r5, #1
	bcs	.L337
	strb	r6, [r4, #4062]
	mov	r0, #1
	b	.L345
.L349:
	mov	r1, r7
	mov	r0, r8
	bl	Vp6_Vfmw_DecodeBool128
	orr	r0, r0, r6, asl #1
	str	r0, [r5, #24]
	b	.L330
.L346:
	ldr	ip, [r4, #4068]
	movw	r1, #1458
	ldr	r2, .L351
	mov	r0, #1
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #87
	b	.L345
.L332:
	mov	r1, r7
	mov	r0, r8
	bl	Vp6_Vfmw_DecodeBool128
	cmp	r0, #0
	streq	r0, [r5, #16]
	movne	r3, #1
	strne	r3, [r5, #16]
	b	.L335
.L352:
	.align	2
.L351:
	.word	.LC12
	UNWIND(.fnend)
	.size	VP6_InterFrmHeader, .-VP6_InterFrmHeader
	.align	2
	.global	VP6_GetPictureHeader
	.type	VP6_GetPictureHeader, %function
VP6_GetPictureHeader:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r7, r1
	beq	.L359
	ldr	r2, .L362
	movw	r1, #1546
	mov	r0, #20
	add	r6, r4, #8192
	bl	dprint_normal
	mov	r1, #1
	mov	r0, r7
	bl	BsGet
	mov	r1, #6
	uxtb	r3, r0
	mov	r0, r7
	str	r3, [r6, #4076]
	strb	r3, [r4, #20]
	bl	BsGet
	ldr	ip, .L362+4
	ldr	r1, .L362+8
	add	r2, r4, #12224
	add	r5, ip, #128
	uxtb	r3, r0
	strb	r0, [r6, #4056]
	add	r1, r1, r3
	mov	r0, r7
	mov	r3, r3, asl #1
	ldrb	lr, [r1, #1676]	@ zero_extendqisi2
	mov	r1, #1
	ldrh	ip, [ip, r3]
	ldrh	r3, [r5, r3]
	strb	lr, [r6, #4057]
	strh	ip, [r2, #32]	@ movhi
	strh	r3, [r2, #34]	@ movhi
	bl	BsGet
	ldr	r3, [r6, #4076]
	mov	r1, r7
	cmp	r3, #0
	strb	r0, [r6, #4058]
	mov	r0, r4
	beq	.L360
	bl	VP6_InterFrmHeader
	mov	r5, r0
	cmp	r5, #1
	beq	.L361
.L358:
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L360:
	bl	VP6_IntraFrmHeader
	mov	r5, r0
	cmp	r5, #1
	bne	.L358
.L361:
	add	r1, r4, #12288
	mov	r0, r7
	add	r1, r1, #32
	add	r4, r4, #12288
	bl	Vp6_Vfmw_DecodeBool128
	ldr	r2, .L362+12
	movw	r1, #1583
	str	r0, [r4, #28]
	mov	r0, #20
	ldrb	r3, [r6, #4056]	@ zero_extendqisi2
	str	r3, [r4, #8]
	bl	dprint_normal
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L359:
	ldr	r2, .L362+16
	movw	r1, #1542
	mov	r0, #20
	bl	dprint_normal
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L363:
	.align	2
.L362:
	.word	.LC14
	.word	.LANCHOR0+1740
	.word	.LANCHOR0
	.word	.LC15
	.word	.LC13
	UNWIND(.fnend)
	.size	VP6_GetPictureHeader, .-VP6_GetPictureHeader
	.align	2
	.global	VP6DEC_Init
	.type	VP6DEC_Init, %function
VP6DEC_Init:
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
	ldr	r6, .L368
	add	r5, r0, #12288
	movw	r2, #13032
	mov	r7, r1
	ldr	r8, [r5, #720]
	mov	r1, #0
	ldr	r3, [r6, #48]
	mov	r4, r0
	blx	r3
	add	r0, r4, #12608
	add	r0, r0, #56
	str	r8, [r5, #720]
	bl	ResetVoQueue
	str	r7, [r4]
	mov	r0, r4
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r5, #728]
	beq	.L367
	ldr	r3, [r6, #48]
	movw	r2, #12392
	mov	r1, #0
	add	r0, r4, #236
	blx	r3
	ldr	r3, [r4]
	mov	r2, #0
	str	r2, [r4, #252]
	movw	r1, #1619
	ldr	r2, .L368+4
	ldr	r3, [r3, #8]
	mov	r0, #20
	str	r3, [r4, #244]
	bl	dprint_normal
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L367:
	ldr	r2, .L368+8
	movw	r1, #1607
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L369:
	.align	2
.L368:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC17
	.word	.LC16
	UNWIND(.fnend)
	.size	VP6DEC_Init, .-VP6DEC_Init
	.align	2
	.global	VP6_DecodeDecide
	.type	VP6_DecodeDecide, %function
VP6_DecodeDecide:
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
	ldr	r5, [r0, #252]
	mov	r4, r0
	cmp	r5, #0
	beq	.L396
	ldr	r3, [r0, #244]
	sub	r3, r3, #2
	cmp	r3, #1
	ldr	r3, [r0]
	ldr	r3, [r3, #8]
	bls	.L397
.L374:
	str	r3, [r4, #244]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L379
.L380:
	.word	.L378
	.word	.L378
	.word	.L375
	.word	.L377
	.word	.L378
.L398:
	ldr	r2, .L400
	movw	r1, #1659
	mov	r0, #16
	bl	dprint_normal
.L377:
	mov	r0, #0
.L393:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L397:
	cmp	r3, #4
	cmpne	r3, #1
	bhi	.L374
	add	r5, r0, #12288
	ldr	r2, .L400+4
	movw	r1, #1642
	mov	r0, #3
	bl	dprint_normal
	ldr	r0, [r5, #728]
	ldr	r1, [r4, #268]
	bl	FSP_ClearLogicFs
	ldr	r0, [r5, #728]
	ldr	r1, [r4, #272]
	bl	FSP_ClearLogicFs
	ldr	r0, [r5, #728]
	bl	FSP_GetNullLogicFs
	ldr	r3, [r4]
	mov	r2, #0
	str	r2, [r4, #248]
	str	r0, [r4, #272]
	str	r0, [r4, #268]
	ldr	r3, [r3, #8]
	b	.L374
.L396:
	ldr	r2, .L400+8
	movw	r1, #1634
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L375:
	ldrb	r3, [r4, #256]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L398
.L376:
	add	r3, r4, #12288
	ldr	r1, [r4, #272]
	ldr	r0, [r3, #728]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L399
	ldrb	r3, [r4, #256]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L385
	ldr	r2, [r4]
	ldr	r3, [r5, #96]
	ldr	r2, [r2]
	cmp	r3, r2
	bls	.L385
	str	r2, [sp]
	movw	r1, #1697
	ldr	r2, .L400+12
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L378:
	ldrb	r3, [r4, #256]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L376
	ldr	r3, [r4, #248]
	cmp	r3, #0
	bne	.L376
	str	r3, [sp]
	movw	r1, #1671
	ldr	r3, .L400+16
	mov	r0, #16
	ldr	r2, .L400+20
	bl	dprint_normal
	b	.L377
.L379:
	ldr	r2, .L400+24
	movw	r1, #1679
	mov	r0, #1
	bl	dprint_normal
	b	.L377
.L385:
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L399:
	movw	r1, #1689
	ldr	r3, .L400+28
	str	r1, [sp]
	mov	r0, #20
	ldr	r2, .L400+32
	bl	dprint_normal
	mov	r0, r5
	b	.L393
.L401:
	.align	2
.L400:
	.word	.LC20
	.word	.LC19
	.word	.LC18
	.word	.LC25
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LANCHOR0+1996
	.word	.LC24
	UNWIND(.fnend)
	.size	VP6_DecodeDecide, .-VP6_DecodeDecide
	.align	2
	.global	VP6_Set_DecParam
	.type	VP6_Set_DecParam, %function
VP6_Set_DecParam:
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
	ldr	r3, .L424
	add	r7, r0, #8
	add	r5, r0, #12288
	mov	r4, r0
	mov	r2, #212
	mov	r1, #0
	ldr	r3, [r3, #48]
	mov	r0, r7
	ldr	r8, [r4, #220]
	blx	r3
	ldr	r3, [r5, #216]
	ldr	r1, [r4, #264]
	str	r3, [r4, #72]
	ldr	r3, [r5, #224]
	strh	r3, [r4, #62]	@ movhi
	ldr	r3, [r5, #220]
	strh	r3, [r4, #64]	@ movhi
	ldr	r0, [r5, #728]
	bl	FSP_GetLogicFs
	ldr	r1, [r4, #272]
	mov	r6, r0
	ldr	r0, [r5, #728]
	bl	FSP_GetLogicFs
	ldr	r1, [r4, #268]
	mov	r10, r0
	ldr	r0, [r5, #728]
	bl	FSP_GetLogicFs
	cmp	r6, #0
	cmpne	r10, #0
	moveq	r3, #1
	movne	r3, #0
	cmp	r0, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L420
	ldrb	r1, [r4, #256]	@ zero_extendqisi2
	ldrb	r2, [r6, #408]	@ zero_extendqisi2
	cmp	r1, #3
	strb	r2, [r4, #60]
	beq	.L421
	ldr	r9, [r6, #24]
	cmp	r9, #0
	beq	.L422
	ldr	r2, [r9, #4]
	add	r9, r4, #12608
	str	r3, [r4, #188]
	add	r9, r9, #20
	str	r2, [r4, #184]
	ldr	r3, [r0, #24]
	mov	r0, r9
	cmp	r3, #0
	ldreq	r3, [r6, #24]
	ldr	r3, [r3, #4]
	str	r3, [r4, #192]
	ldr	r3, [r10, #24]
	cmp	r3, #0
	ldreq	r3, [r6, #24]
	ldr	r3, [r3, #4]
	str	r3, [r4, #196]
	ldr	r3, [r6, #24]
	ldr	r3, [r3, #44]
	str	r3, [r4, #200]
	ldr	r3, [r6, #24]
	ldr	r3, [r3, #48]
	str	r3, [r4, #204]
	ldr	r3, [r6, #24]
	ldr	r3, [r3, #72]
	str	r3, [r4, #208]
	ldr	r3, [r6, #24]
	ldr	r3, [r3, #64]
	str	r3, [r4, #212]
	ldr	r3, [r6, #24]
	ldr	r3, [r3, #68]
	str	r3, [r4, #216]
	ldr	r3, [r5, #276]
	str	r3, [r4, #172]
	ldr	r3, [r5, #272]
	str	r3, [r4, #176]
	ldr	r3, [r5, #280]
	str	r3, [r4, #180]
	ldrb	r3, [r5, #196]	@ zero_extendqisi2
	str	r3, [r4, #76]
	ldrb	r3, [r5, #198]	@ zero_extendqisi2
	str	r3, [r4, #80]
	ldr	r3, [r5, #264]
	str	r3, [r4, #84]
	ldr	r3, [r5, #252]
	str	r3, [r4, #96]
	ldrb	r3, [r5, #200]	@ zero_extendqisi2
	str	r3, [r4, #100]
	ldrb	r3, [r5, #201]	@ zero_extendqisi2
	str	r3, [r4, #104]
	ldrb	r3, [r5, #202]	@ zero_extendqisi2
	str	r3, [r4, #108]
	ldr	r3, [r5, #260]
	str	r3, [r4, #120]
	ldrb	r3, [r5, #197]	@ zero_extendqisi2
	strb	r3, [r4, #8]
	ldrh	r3, [r5, #204]
	str	r3, [r4, #88]
	ldrh	r3, [r5, #206]
	str	r3, [r4, #92]
	ldr	r3, [r5, #212]
	str	r3, [r4, #116]
	ldr	r3, [r5, #208]
	str	r3, [r4, #112]
	ldr	r6, [r8]
	bl	BsPos
	cmp	r0, #0
	add	r3, r0, #7
	movlt	r0, r3
	add	r6, r6, r0, asr #3
	mov	r0, r6
	bl	MEM_Vir2Phy
	bic	r3, r0, #15
	mov	r0, r6
	sub	r3, r3, #16
	str	r3, [r4, #68]
	bl	MEM_Vir2Phy
	ldrb	r6, [r5, #198]	@ zero_extendqisi2
	cmp	r6, #0
	and	r0, r0, #15
	mov	r0, r0, asl #3
	bne	.L414
	ldr	r3, [r5, #212]
	cmp	r3, #0
	bne	.L415
.L414:
	mov	r3, #16
	str	r0, [r4, #128]
	str	r3, [r4, #132]
	mov	r0, r9
	ldr	r9, [r5, #248]
	bl	BsPos
	mov	r6, #0
	str	r6, [r4, #144]
	str	r6, [r4, #140]
	mov	r9, r9, asl #3
	str	r6, [r4, #136]
	rsb	r0, r0, r9
	str	r0, [r4, #124]
	ldr	r3, [r8]
	ldr	r10, [r5, #248]
	add	r10, r3, r10
	mov	r0, r10
	bl	MEM_Vir2Phy
	mov	r9, r0
	mov	r0, r10
	bl	MEM_Vir2Phy
	and	r9, r9, #15
	ldr	r3, [r4, #68]
	mov	r9, r9, asl #3
	str	r9, [r4, #152]
	bic	r0, r0, #15
	rsb	r0, r3, r0
	str	r0, [r4, #156]
	ldr	r3, [r5, #248]
	ldr	r2, [r8, #8]
	str	r6, [r4, #168]
	mov	r3, r3, asl #3
	str	r6, [r4, #164]
	rsb	r3, r3, r2, lsl #3
	str	r6, [r4, #160]
	str	r3, [r4, #148]
.L416:
	add	lr, r4, #5184
	add	ip, r4, #4416
	add	r1, r4, #5056
	add	r2, r4, #4352
	add	r3, r4, #3344
	add	r0, r4, #3408
	add	r5, r4, #3280
	add	lr, lr, #26
	add	ip, ip, #58
	str	lr, [r4, #52]
	str	ip, [r4, #40]
	add	lr, r4, #2576
	add	ip, r4, #2512
	add	r1, r1, #26
	add	r2, r2, #26
	str	r1, [r4, #48]
	str	r2, [r4, #36]
	add	r1, r4, #3216
	add	r2, r4, #6720
	add	r3, r3, #10
	str	r3, [r4, #28]
	add	r3, r4, #4992
	add	r0, r0, #10
	add	r5, r5, #10
	str	r0, [r4, #32]
	add	lr, lr, #10
	add	ip, ip, #10
	add	r1, r1, #10
	add	r2, r2, #26
	add	r3, r3, #58
	str	r2, [r4, #56]
	mov	r0, #1
	mov	r2, #0
	str	r7, [r4, #4]
	str	r5, [r4, #24]
	str	lr, [r4, #16]
	str	ip, [r4, #12]
	str	r1, [r4, #20]
	str	r3, [r4, #44]
	strb	r2, [r4, #9]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L420:
	ldr	r3, .L424+4
	movw	r1, #1740
	ldr	r2, .L424+8
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L421:
	ldr	r5, [r6, #28]
	cmp	r5, #0
	beq	.L423
	ldr	r2, [r5, #4]
	str	r3, [r4, #188]
	str	r2, [r4, #184]
	ldr	r3, [r10, #28]
	cmp	r3, #0
	ldreq	r3, [r6, #28]
	ldr	r3, [r3, #4]
	str	r3, [r4, #196]
	mov	r3, #1
	ldr	r2, [r6, #28]
	mov	r0, r3
	ldr	r2, [r2, #44]
	str	r2, [r4, #200]
	ldr	r2, [r6, #28]
	ldr	r2, [r2, #48]
	str	r2, [r4, #204]
	ldr	r2, [r6, #28]
	ldr	r2, [r2, #72]
	str	r2, [r4, #208]
	ldr	r2, [r6, #28]
	ldr	r2, [r2, #64]
	str	r2, [r4, #212]
	ldr	r2, [r6, #28]
	ldr	r2, [r2, #68]
	str	r7, [r4, #4]
	strb	r3, [r4, #9]
	str	r2, [r4, #216]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L415:
	str	r0, [r4, #128]
	mov	r3, #16
	mov	r0, r9
	str	r3, [r4, #132]
	ldr	r5, [r8, #8]
	bl	BsPos
	str	r6, [r4, #144]
	str	r6, [r4, #140]
	mov	r5, r5, asl #3
	str	r6, [r4, #136]
	str	r6, [r4, #156]
	str	r6, [r4, #152]
	str	r6, [r4, #148]
	str	r6, [r4, #168]
	str	r6, [r4, #164]
	str	r6, [r4, #160]
	rsb	r0, r0, r5
	str	r0, [r4, #124]
	b	.L416
.L422:
	ldr	r3, .L424+4
	movw	r1, #1771
	ldr	r2, .L424+12
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r9
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L423:
	ldr	r3, .L424+4
	movw	r1, #1750
	ldr	r2, .L424+12
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L425:
	.align	2
.L424:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+2016
	.word	.LC26
	.word	.LC27
	UNWIND(.fnend)
	.size	VP6_Set_DecParam, .-VP6_Set_DecParam
	.align	2
	.global	VP6_CfgTable
	.type	VP6_CfgTable, %function
VP6_CfgTable:
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
	UNWIND(.pad #28)
	sub	sp, sp, #28
	ldr	r6, .L451
	add	r4, r0, #2272
	add	r8, r0, #2320
	add	r4, r4, #14
	add	r8, r8, #14
	add	r5, r0, #48
	mov	r7, r0
	mov	r3, #0
	str	r1, [fp, #-64]
	str	r3, [fp, #-60]
	str	r3, [fp, #-56]
	str	r3, [fp, #-52]
	str	r3, [fp, #-48]
.L427:
	mov	r1, r5
	mov	r0, r4
	ldr	r3, [r6, #52]
	mov	r2, #10
	add	r4, r4, #16
	blx	r3
	cmp	r4, r8
	add	r5, r5, #10
	bne	.L427
	add	r3, r7, #2976
	add	r4, r7, #2336
	add	r3, r3, #14
	add	r4, r4, #14
	add	r9, r7, #88
	str	r7, [fp, #-68]
	mov	r8, r3
.L428:
	add	r5, r4, #160
	mov	r7, r9
.L429:
	mov	r1, r7
	mov	r0, r4
	ldr	r3, [r6, #52]
	mov	r2, #9
	add	r4, r4, #16
	blx	r3
	cmp	r4, r5
	add	r7, r7, #9
	ldr	r10, .L451
	bne	.L429
	cmp	r4, r8
	add	r9, r9, #90
	bne	.L428
	ldr	r7, [fp, #-68]
	mov	r1, #0
	ldr	r8, [r10, #48]
	mov	r2, #16
	sub	r0, fp, #60
	mov	r5, r1
	blx	r8
	ldrb	ip, [r7, #44]	@ zero_extendqisi2
	ldrb	r2, [r7, #528]	@ zero_extendqisi2
	mov	r0, r4
	ldrb	lr, [r7, #529]	@ zero_extendqisi2
	sub	r1, fp, #60
	strb	ip, [fp, #-60]
	ldrb	ip, [r7, #530]	@ zero_extendqisi2
	ldrb	r8, [r7, #46]	@ zero_extendqisi2
	ldrb	r4, [r7, #531]	@ zero_extendqisi2
	strb	r2, [fp, #-58]
	strb	lr, [fp, #-57]
	ldrb	r2, [r7, #532]	@ zero_extendqisi2
	ldrb	lr, [r7, #533]	@ zero_extendqisi2
	strb	ip, [fp, #-56]
	ldrb	ip, [r7, #534]	@ zero_extendqisi2
	strb	lr, [fp, #-53]
	strb	r8, [fp, #-59]
	strb	ip, [fp, #-52]
	strb	r4, [fp, #-55]
	strb	r2, [fp, #-54]
	mov	r2, #16
	ldr	r4, [r10, #52]
	blx	r4
	mov	r1, r5
	ldr	r4, [r10, #48]
	mov	r2, #16
	sub	r0, fp, #60
	blx	r4
	ldrb	ip, [r7, #44]	@ zero_extendqisi2
	ldrb	r4, [r7, #542]	@ zero_extendqisi2
	add	r0, r7, #2992
	ldrb	r2, [r7, #543]	@ zero_extendqisi2
	sub	r1, fp, #60
	ldrb	lr, [r7, #544]	@ zero_extendqisi2
	add	r0, r0, #14
	strb	ip, [fp, #-60]
	ldrb	ip, [r7, #545]	@ zero_extendqisi2
	strb	r4, [fp, #-59]
	strb	r2, [fp, #-58]
	ldrb	r4, [r7, #546]	@ zero_extendqisi2
	ldrb	r2, [r7, #547]	@ zero_extendqisi2
	strb	lr, [fp, #-57]
	strb	ip, [fp, #-56]
	ldrb	lr, [r7, #548]	@ zero_extendqisi2
	ldrb	ip, [r7, #549]	@ zero_extendqisi2
	strb	r4, [fp, #-55]
	strb	lr, [fp, #-53]
	strb	ip, [fp, #-52]
	strb	r2, [fp, #-54]
	mov	r2, #16
	strb	r5, [fp, #-51]
	strb	r5, [fp, #-50]
	ldr	r4, [r10, #52]
	blx	r4
	mov	r1, r5
	ldr	r4, [r10, #48]
	mov	r2, #16
	sub	r0, fp, #60
	blx	r4
	ldrb	ip, [r7, #45]	@ zero_extendqisi2
	ldrb	r4, [r7, #47]	@ zero_extendqisi2
	add	r0, r7, #3008
	ldrb	r2, [r7, #535]	@ zero_extendqisi2
	sub	r1, fp, #60
	ldrb	lr, [r7, #536]	@ zero_extendqisi2
	add	r0, r0, #14
	strb	ip, [fp, #-60]
	ldrb	ip, [r7, #537]	@ zero_extendqisi2
	strb	r4, [fp, #-59]
	strb	r2, [fp, #-58]
	ldrb	r4, [r7, #538]	@ zero_extendqisi2
	ldrb	r2, [r7, #539]	@ zero_extendqisi2
	strb	lr, [fp, #-57]
	strb	ip, [fp, #-56]
	ldrb	lr, [r7, #540]	@ zero_extendqisi2
	ldrb	ip, [r7, #541]	@ zero_extendqisi2
	strb	r4, [fp, #-55]
	strb	lr, [fp, #-53]
	strb	ip, [fp, #-52]
	strb	r2, [fp, #-54]
	mov	r2, #16
	ldr	r4, [r10, #52]
	blx	r4
	mov	r1, r5
	ldr	r4, [r10, #48]
	mov	r2, #16
	sub	r0, fp, #60
	blx	r4
	ldrb	r4, [r7, #45]	@ zero_extendqisi2
	ldrb	lr, [r7, #550]	@ zero_extendqisi2
	add	r0, r7, #3024
	ldrb	ip, [r7, #551]	@ zero_extendqisi2
	sub	r1, fp, #60
	ldrb	r2, [r7, #553]	@ zero_extendqisi2
	add	r0, r0, #14
	ldrb	r8, [r7, #552]	@ zero_extendqisi2
	strb	r5, [fp, #-51]
	strb	r5, [fp, #-50]
	strb	r4, [fp, #-60]
	ldrb	r5, [r7, #554]	@ zero_extendqisi2
	ldrb	r4, [r7, #555]	@ zero_extendqisi2
	strb	lr, [fp, #-59]
	strb	ip, [fp, #-58]
	ldrb	lr, [r7, #556]	@ zero_extendqisi2
	ldrb	ip, [r7, #557]	@ zero_extendqisi2
	strb	r2, [fp, #-56]
	mov	r2, #16
	strb	r4, [fp, #-54]
	strb	r8, [fp, #-57]
	strb	r5, [fp, #-55]
	strb	lr, [fp, #-53]
	strb	ip, [fp, #-52]
	ldr	r4, [r10, #52]
	blx	r4
	ldr	r3, [fp, #-64]
	ldr	r2, [r3, #68]
	cmp	r2, #0
	bne	.L431
	add	r5, r7, #4096
	add	r8, r7, #1184
	add	r4, r7, #4160
	add	r5, r5, #46
	add	r8, r8, #12
	add	r4, r4, #30
.L432:
	mov	r1, r8
	mov	r0, r5
	ldr	r3, [r6, #52]
	mov	r2, #11
	add	r5, r5, #16
	blx	r3
	cmp	r5, r4
	add	r8, r8, #11
	bne	.L432
	add	r5, r7, #1216
	add	r8, r7, #4224
	add	r5, r5, #13
	add	r8, r8, #14
.L433:
	mov	r1, r5
	mov	r0, r4
	ldr	r3, [r6, #52]
	mov	r2, #11
	add	r4, r4, #16
	blx	r3
	cmp	r4, r8
	add	r5, r5, #11
	ldr	r9, .L451
	bne	.L433
	add	r0, r7, #4800
	ldr	r3, [r9, #52]
	mov	r2, #14
	add	r1, r7, #580
	add	r0, r0, #14
	add	r10, r7, #4480
	blx	r3
	add	ip, r7, #5056
	add	r1, r7, #592
	add	r0, r7, #4800
	ldr	r3, [r9, #52]
	add	r1, r1, #2
	add	r0, r0, #30
	mov	r2, #14
	mov	r4, ip
	blx	r3
	add	r3, r4, #46
	str	r3, [fp, #-64]
	add	r3, r7, #608
	add	r10, r10, #46
	str	r7, [fp, #-68]
	mov	r9, r3
.L440:
	sub	r4, r10, #288
	mov	r8, r9
.L443:
	add	r7, r4, #48
	mov	r5, r8
.L441:
	mov	r1, r5
	mov	r0, r4
	ldr	r3, [r6, #52]
	mov	r2, #11
	add	r4, r4, #16
	blx	r3
	cmp	r7, r4
	add	r5, r5, #66
	bne	.L441
	cmp	r7, r10
	add	r8, r8, #11
	mov	r4, r7
	bne	.L443
	ldr	r3, [fp, #-64]
	add	r10, r10, #288
	add	r9, r9, #198
	cmp	r10, r3
	bne	.L440
	ldr	r7, [fp, #-68]
.L439:
	add	r0, r7, #3040
	ldr	r3, [r6, #52]
	add	r1, r7, #1004
	mov	r2, #64
	add	r0, r0, #14
	blx	r3
	add	r1, r7, #1056
	add	r0, r7, #3104
	ldr	r3, [r6, #52]
	add	r1, r1, #12
	mov	r2, #64
	add	r0, r0, #14
	blx	r3
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L431:
	add	r1, r7, #9536
	add	r0, r7, #4800
	ldr	r4, [r10, #52]
	add	r1, r1, #8
	mov	r2, #128
	add	r0, r0, #46
	blx	r4
	add	ip, r7, #9664
	add	r1, r7, #11968
	add	r0, r7, #6464
	ldr	r3, [r10, #52]
	mov	r2, #128
	add	r1, r1, #8
	add	r0, r0, #46
	mov	r4, ip
	add	r10, r7, #5696
	blx	r3
	add	r2, r4, #8
	add	r10, r10, #46
	add	r3, r7, #7232
	mov	r9, r2
	add	r3, r3, #46
	str	r7, [fp, #-68]
	str	r3, [fp, #-64]
.L434:
	sub	r4, r10, #768
	mov	r8, r9
.L438:
	add	r7, r4, #256
	mov	r5, r8
.L435:
	ldr	r3, [r6, #52]
	mov	r2, #64
	mov	r1, r5
	mov	r0, r4
	add	r4, r4, r2
	blx	r3
	cmp	r7, r4
	add	r5, r5, #64
	ldr	r3, .L451
	bne	.L435
	cmp	r7, r10
	add	r8, r8, #384
	mov	r4, r7
	bne	.L438
	ldr	r2, [fp, #-64]
	add	r10, r7, #768
	add	r9, r9, #1152
	cmp	r10, r2
	bne	.L434
	ldr	r7, [fp, #-68]
	mov	r2, #960
	ldr	r3, [r3, #52]
	add	r1, r7, #1248
	add	r0, r7, #3168
	add	r1, r1, #14
	add	r0, r0, #14
	blx	r3
	b	.L439
.L452:
	.align	2
.L451:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VP6_CfgTable, .-VP6_CfgTable
	.align	2
	.global	VP6_BuildTables
	.type	VP6_BuildTables, %function
VP6_BuildTables:
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
	cmp	r2, #0
	cmpne	r1, #0
	mov	r4, r1
	mov	r6, r2
	mov	r5, r0
	moveq	r3, #1
	movne	r3, #0
	cmp	r0, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L458
	ldr	r3, [r1, #20]
	cmp	r3, #0
	bne	.L462
	ldr	r7, .L464
	mov	r2, #80
	ldr	r1, .L464+4
	add	r0, r0, #448
	ldr	r3, [r7, #52]
	blx	r3
	ldr	r3, [r7, #52]
	mov	r2, #2
	ldr	r1, .L464+8
	add	r0, r5, #46
	blx	r3
	ldr	r3, [r7, #52]
	mov	r2, #14
	ldr	r1, .L464+12
	add	r0, r5, #528
	blx	r3
	ldr	r3, [r7, #52]
	mov	r2, #2
	ldr	r1, .L464+16
	add	r0, r5, #44
	blx	r3
	add	r0, r5, #540
	ldr	r3, [r7, #52]
	mov	r2, #16
	ldr	r1, .L464+20
	add	r0, r0, #2
	blx	r3
	add	r0, r5, #1120
	ldr	r1, .L464+24
	add	r0, r0, #12
	ldr	r3, [r7, #52]
	mov	r2, #64
	blx	r3
	mov	r1, r4
	mov	r0, r5
	bl	VP6_BuildScanOrder
.L456:
	ldr	r3, [r4, #20]
	mov	r1, r6
	mov	r2, r4
	mov	r0, r5
	bl	VP6_ConfigureEntropyDecoder
	ldr	r3, [r4, #68]
	cmp	r3, #0
	bne	.L463
.L457:
	mov	r1, r4
	mov	r0, r5
	bl	VP6_CfgTable
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L462:
	mov	r2, r1
	mov	r1, r6
	bl	VP6_DecodeModeProbs
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	bl	VP6_ConfigureMvEntropyDecoder
	b	.L456
.L463:
	mov	r0, r5
	bl	VP6_ConvertBoolToHuff
	b	.L457
.L458:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L465:
	.align	2
.L464:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+2036
	.word	.LANCHOR0+2116
	.word	.LANCHOR0+2120
	.word	.LANCHOR0+2136
	.word	.LANCHOR0+2140
	.word	.LANCHOR0+2156
	UNWIND(.fnend)
	.size	VP6_BuildTables, .-VP6_BuildTables
	.align	2
	.global	IsFrameSizeChanged
	.type	IsFrameSizeChanged, %function
IsFrameSizeChanged:
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
	add	r0, r0, #8192
	ldr	r2, [r0, #3936]
	ldr	r3, [r0, #4080]
	cmp	r2, r3
	beq	.L469
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L469:
	ldr	r3, [r0, #3940]
	ldr	r0, [r0, #4084]
	subs	r0, r3, r0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	IsFrameSizeChanged, .-IsFrameSizeChanged
	.align	2
	.global	VP6DEC_Decode
	.type	VP6DEC_Decode, %function
VP6DEC_Decode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	r3, [r1]
	mov	r4, r0
	str	r3, [r0, #224]
	ldr	r2, [r1, #12]
	str	r2, [r0, #228]
	ldr	r2, [r1, #16]
	cmp	r2, #0
	str	r2, [r0, #232]
	moveq	r3, #3
	streqb	r3, [r0, #256]
	beq	.L472
	cmp	r2, #2
	ble	.L505
	add	r5, r0, #12608
	add	r6, r0, #236
	add	r5, r5, #20
	mov	r1, r3
	mov	r0, r5
	bl	BsInit
	add	r3, r4, #224
	mov	r1, r5
	mov	r0, r6
	str	r3, [r4, #220]
	bl	VP6_GetPictureHeader
	cmp	r0, #1
	mov	r7, r0
	beq	.L475
	ldr	r2, .L509
	mov	r1, #2080
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L475:
	add	r1, r4, #12480
	mov	r2, r5
	mov	r0, r6
	add	r1, r1, #4
	bl	VP6_BuildTables
	cmp	r0, #1
	bne	.L506
	ldr	r3, [r4, #252]
	add	r6, r4, #12288
	cmp	r3, #0
	beq	.L477
	ldr	r2, [r6, #76]
	ldr	r3, [r6, #220]
	cmp	r2, r3
	bne	.L477
	ldr	r2, [r6, #80]
	ldr	r3, [r6, #224]
	cmp	r2, r3
	bne	.L477
.L472:
	mov	r0, r4
	bl	VP6_DecodeDecide
	cmp	r0, #1
	mov	r5, r0
	beq	.L485
	ldr	r2, .L509+4
	movw	r1, #2139
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
.L474:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L485:
	mov	r0, r4
	bl	VP6_GetImageBuffer
	cmp	r0, #1
	mov	r6, r0
	beq	.L486
	mov	r0, r5
	ldr	r2, .L509+8
	movw	r1, #2147
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L505:
	ldr	r2, .L509+12
	movw	r1, #2071
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L486:
	mov	r0, r4
	bl	VP6_InitFrameInfo
	cmp	r0, #1
	mov	r7, r0
	beq	.L487
	mov	r0, r6
	ldr	r2, .L509+16
	movw	r1, #2155
	bl	dprint_normal
	mov	r0, #0
	b	.L474
.L477:
	ldr	r8, .L509+20
	ldr	r7, [r8]
	cmp	r7, #0
	subeq	r5, fp, #44
	beq	.L479
	ldr	r1, [r6, #76]
	sub	r5, fp, #44
	ldr	r0, [r6, #220]
	mov	r3, #8
	ldr	lr, [r6, #80]
	mov	r2, r5
	ldr	ip, [r6, #224]
	strh	r1, [fp, #-42]	@ movhi
	mov	r1, #1
	strh	r0, [fp, #-38]	@ movhi
	strh	lr, [fp, #-44]	@ movhi
	strh	ip, [fp, #-40]	@ movhi
	ldr	r0, [r6, #728]
	blx	r7
.L479:
	mov	r3, r5
	sub	r2, fp, #48
	sub	r1, fp, #52
	ldr	r0, [r6, #728]
	mov	ip, #0
	str	ip, [fp, #-52]
	str	ip, [fp, #-48]
	str	ip, [fp, #-44]
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r4]
	ldr	r3, [r3, #696]
	cmp	r3, #1
	beq	.L507
.L481:
	ldr	r1, [r4, #268]
	mov	r5, #0
	ldr	r0, [r6, #728]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #272]
	ldr	r0, [r6, #728]
	bl	FSP_ClearLogicFs
	ldr	r0, [r6, #728]
	bl	FSP_GetNullLogicFs
	add	r1, r4, #12608
	add	r1, r1, #56
	str	r5, [r4, #248]
	str	r0, [r4, #272]
	str	r0, [r4, #268]
	ldr	r0, [r6, #728]
	bl	FSP_ClearNotInVoQueue
	mov	r0, r4
	bl	VP6_ArrangeVHBMem
	cmp	r0, #1
	beq	.L472
	ldr	r2, .L509+24
	movw	r1, #2129
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	b	.L474
.L487:
	mov	r0, r4
	bl	VP6_Set_DecParam
	cmp	r0, #1
	mov	r5, r0
	beq	.L488
	mov	r0, r7
	ldr	r2, .L509+28
	movw	r1, #2172
	bl	dprint_normal
	mov	r0, #0
	b	.L474
.L507:
	ldr	r2, [fp, #-44]
	cmp	r2, #0
	bgt	.L482
	ldr	r2, [fp, #-48]
	cmp	r2, #32
	bgt	.L482
	ldr	r5, [r4, #4]
	cmp	r5, #0
	bne	.L482
	ldr	r2, [r6, #80]
	cmp	r2, #0
	beq	.L481
	ldr	r1, [r6, #220]
	ldr	r0, [r6, #732]
	cmp	r1, r0
	beq	.L481
	ldr	r0, [r6, #224]
	ldr	ip, [r6, #736]
	cmp	r0, ip
	beq	.L481
	ldr	ip, [r6, #76]
	str	r1, [sp, #12]
	movw	r1, #2113
	str	r0, [sp, #8]
	mov	r0, r3
	str	r2, [sp]
	str	ip, [sp, #4]
	ldr	r2, .L509+32
	bl	dprint_normal
	ldr	r7, [r8]
	ldr	r2, [r6, #220]
	ldr	r3, [r6, #224]
	cmp	r7, #0
	str	r2, [r6, #732]
	str	r3, [r6, #736]
	beq	.L481
	mov	r3, r5
	mov	r2, r5
	mov	r1, #48
	ldr	r0, [r6, #728]
	blx	r7
	b	.L481
.L506:
	mov	r0, r7
	ldr	r2, .L509+36
	movw	r1, #2088
	bl	dprint_normal
	mov	r0, #0
	b	.L474
.L488:
	ldrb	r3, [r4, #256]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L508
	add	r6, r4, #12288
	ldr	r3, .L509+40
	add	r1, r4, #12480
	add	r0, r6, #52
	ldr	r7, [r6, #64]
	add	r1, r1, #4
	ldr	r4, [r6, #68]
	mov	r2, #144
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, r5
	str	r7, [r6, #64]
	str	r4, [r6, #68]
	b	.L474
.L482:
	mvn	r0, #1
	b	.L474
.L508:
	ldr	r3, .L509+40
	add	r1, r4, #12480
	add	r0, r4, #12288
	add	r1, r1, #4
	add	r0, r0, #52
	mov	r2, #144
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, r5
	b	.L474
.L510:
	.align	2
.L509:
	.word	.LC29
	.word	.LC33
	.word	.LC34
	.word	.LC28
	.word	.LC35
	.word	g_EventReportFunc
	.word	.LC32
	.word	.LC36
	.word	.LC31
	.word	.LC30
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VP6DEC_Decode, .-VP6DEC_Decode
	.align	2
	.global	VP6_SetImgFormat
	.type	VP6_SetImgFormat, %function
VP6_SetImgFormat:
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
	ldr	r1, [r0, #264]
	mov	r5, r0
	ldr	r0, [r3, #728]
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldrb	r1, [r5, #256]	@ zero_extendqisi2
	mov	lr, #1
	ldrb	r2, [r4, #156]	@ zero_extendqisi2
	mov	r5, #5
	ldrb	r3, [r4, #157]	@ zero_extendqisi2
	and	ip, r1, #3
	bfi	r2, r1, #0, #2
	str	ip, [r4, #24]
	and	r3, r3, #252
	and	r2, r2, #227
	orr	r3, r3, #12
	bfi	r2, r5, #5, #3
	bfi	r3, lr, #4, #2
	strb	r2, [r4, #156]
	strb	r3, [r4, #157]
	mov	r1, #0
	ldr	r3, [r4, #156]
	str	ip, [r4, #28]
	bfc	r3, #14, #3
	str	r3, [r4, #156]
	bl	SetAspectRatio
	ldr	r2, [r4, #32]
	ldr	r3, [r4, #36]
	mov	r2, r2, lsr #1
	str	r2, [r4, #48]
	mov	r3, r3, lsr #1
	str	r3, [r4, #52]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VP6_SetImgFormat, .-VP6_SetImgFormat
	.align	2
	.global	VP6DEC_VDMPostProc
	.type	VP6DEC_VDMPostProc, %function
VP6DEC_VDMPostProc:
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
	ldr	r2, .L552
	mov	r4, r0
	mov	r3, r1
	mov	r6, r1
	mov	r0, #20
	movw	r1, #2228
	add	r5, r4, #12288
	bl	dprint_normal
	mov	r1, r4
	mov	r0, #10
	bl	ReleasePacket
	ldr	r0, [r5, #728]
	ldr	r1, [r4, #264]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L545
	cmp	r6, #0
	blt	.L519
	cmp	r6, #100
	movge	r6, #100
	str	r6, [r8, #96]
	ldr	r3, [r4]
	ldr	r3, [r3]
	cmp	r6, r3
	bhi	.L546
.L520:
	mov	r0, r4
	bl	VP6_SetImgFormat
	ldr	r3, [r4, #244]
	mov	r2, #1
	str	r2, [r4, #248]
	cmp	r3, #2
	beq	.L547
.L521:
	ldr	r1, [r4, #264]
	str	r1, [r4, #276]
.L522:
	cmn	r1, #1
	beq	.L523
	ldr	r0, [r5, #728]
	bl	FSP_GetFsImagePtr
	subs	r9, r0, #0
	beq	.L548
	mov	r2, #1
	ldr	r1, [r4, #276]
	ldr	r0, [r5, #728]
	bl	FSP_SetDisplay
	add	r3, r4, #12608
	ldr	r0, [r5, #728]
	add	r3, r3, #56
	str	r9, [sp]
	mov	r2, r4
	mov	r1, #10
	bl	InsertImgToVoQueue
	cmp	r0, #1
	mov	r8, r0
	bne	.L549
.L523:
	ldr	r3, [r4, #272]
	ldr	r2, [r4, #268]
	cmp	r3, r2
	beq	.L525
	ldr	r1, [r4, #264]
	cmp	r3, r1
	beq	.L526
	mov	r1, r3
	mov	r2, #0
	ldr	r0, [r5, #728]
	bl	FSP_SetRef
	ldr	r1, [r4, #264]
.L526:
	str	r1, [r4, #272]
	mov	r2, #1
	ldr	r0, [r5, #728]
	bl	FSP_SetRef
	ldrb	r3, [r4, #256]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L550
	ldr	r3, [r4, #268]
	ldr	r1, [r4, #264]
	cmp	r3, r1
	beq	.L529
.L551:
	mov	r1, r3
	mov	r2, #0
	ldr	r0, [r5, #728]
	bl	FSP_SetRef
	ldr	r1, [r4, #264]
.L529:
	str	r1, [r4, #268]
	mov	r2, #1
	ldr	r0, [r5, #728]
	bl	FSP_SetRef
	mov	r0, #1
.L543:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L550:
	ldr	r3, [r4, #260]
	cmp	r3, #0
	moveq	r0, #1
	beq	.L543
	ldr	r3, [r4, #268]
	ldr	r1, [r4, #264]
	cmp	r3, r1
	bne	.L551
	b	.L529
.L519:
	mov	r3, #0
	str	r3, [r8, #96]
	b	.L520
.L547:
	ldrb	r3, [r4, #256]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L521
	mvn	r3, #0
	ldr	r1, [r4, #264]
	str	r3, [r4, #276]
	mov	r2, #0
	ldr	r0, [r5, #728]
	bl	FSP_SetDisplay
	ldr	r1, [r4, #276]
	b	.L522
.L549:
	mov	r2, #0
	ldr	r1, [r4, #264]
	ldr	r0, [r5, #728]
	mov	r6, #0
	bl	FSP_SetRef
	ldr	r1, [r9, #168]
	ldr	r0, [r5, #728]
	mov	r7, #0
	bl	FreeUsdByDec
	strd	r6, [r9, #168]
	ldr	r1, [r9, #176]
	ldr	r0, [r5, #728]
	bl	FreeUsdByDec
	strd	r6, [r9, #176]
	mov	r2, #0
	ldr	r1, [r4, #276]
	ldr	r0, [r5, #728]
	bl	FSP_SetDisplay
	ldr	r2, .L552+4
	movw	r1, #2295
	mov	r0, #0
	bl	dprint_normal
	mov	r0, r8
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L525:
	mov	r1, r3
	ldr	r0, [r5, #728]
	bl	FSP_GetRef
	subs	r2, r0, #0
	bne	.L544
	ldr	r3, [r4, #272]
	ldr	r1, [r4, #264]
	cmp	r3, r1
	beq	.L526
	mov	r1, r3
	ldr	r0, [r5, #728]
	bl	FSP_SetRef
.L544:
	ldr	r1, [r4, #264]
	b	.L526
.L546:
	str	r3, [sp]
	movw	r1, #2244
	mov	r3, r6
	ldr	r2, .L552+8
	mov	r0, #1
	mov	r6, #0
	bl	dprint_normal
	mov	r2, #0
	ldr	r1, [r4, #264]
	mov	r7, #0
	ldr	r0, [r5, #728]
	bl	FSP_SetRef
	ldr	r1, [r8, #168]
	ldr	r0, [r5, #728]
	bl	FreeUsdByDec
	strd	r6, [r8, #168]
	ldr	r1, [r8, #176]
	ldr	r0, [r5, #728]
	bl	FreeUsdByDec
	mov	r2, #0
	strd	r6, [r8, #176]
	ldr	r1, [r4, #264]
	ldr	r0, [r5, #728]
	bl	FSP_SetDisplay
	ldr	r1, [r4, #268]
	ldr	r0, [r5, #728]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #272]
	ldr	r0, [r5, #728]
	bl	FSP_ClearLogicFs
	ldr	r0, [r5, #728]
	bl	FSP_GetNullLogicFs
	mov	r3, #0
	str	r3, [r4, #248]
	str	r0, [r4, #272]
	str	r0, [r4, #268]
	mvn	r0, #0
	b	.L543
.L548:
	mov	r3, r9
	ldr	r2, .L552+12
	movw	r1, #2279
	mov	r0, #20
	bl	dprint_normal
	mvn	r0, #0
	b	.L543
.L545:
	ldr	r2, .L552+16
	movw	r1, #2236
	bl	dprint_normal
	mvn	r0, #0
	b	.L543
.L553:
	.align	2
.L552:
	.word	.LC37
	.word	.LC41
	.word	.LC39
	.word	.LC40
	.word	.LC38
	UNWIND(.fnend)
	.size	VP6DEC_VDMPostProc, .-VP6DEC_VDMPostProc
	.align	2
	.global	VP6DEC_RecycleImage
	.type	VP6DEC_RecycleImage, %function
VP6DEC_RecycleImage:
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
	add	r4, r0, #12288
	mov	r2, #0
	ldr	r0, [r4, #728]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #728]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L557
	ldr	r1, [r5, #168]
	mov	r6, #0
	ldr	r0, [r4, #728]
	mov	r7, #0
	bl	FreeUsdByDec
	strd	r6, [r5, #168]
	ldr	r1, [r5, #176]
	ldr	r0, [r4, #728]
	bl	FreeUsdByDec
	strd	r6, [r5, #176]
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L557:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	VP6DEC_RecycleImage, .-VP6DEC_RecycleImage
	.global	DefaultScanBands
	.global	ZrlUpdateProbs
	.global	ScanBandUpdateProbs
	.global	ZeroRunProbDefaults
	.global	VP6_AcUpdateProbs
	.global	VP6_DcUpdateProbs
	.global	DefaultSignProbs
	.global	DefaultIsShortProbs
	.global	DefaultMvLongProbs
	.global	DefaultMvShortProbs
	.global	VP6_MvUpdateProbs
	.global	VP6_BaselineXmittedProbs
	.global	VP6_ModeVq
	.global	VP6_DcNodeEqs
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.12542, %object
	.size	__func__.12542, 18
__func__.12542:
	.ascii	"VP6_ArrangeVHBMem\000"
	.space	2
	.type	VP6_DcNodeEqs, %object
	.size	VP6_DcNodeEqs, 120
VP6_DcNodeEqs:
	.word	122
	.word	133
	.word	133
	.word	51
	.word	142
	.word	-16
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	78
	.word	171
	.word	169
	.word	71
	.word	221
	.word	-30
	.word	139
	.word	117
	.word	214
	.word	44
	.word	246
	.word	-3
	.word	168
	.word	79
	.word	210
	.word	38
	.word	203
	.word	17
	.type	VP6_DcUpdateProbs, %object
	.size	VP6_DcUpdateProbs, 22
VP6_DcUpdateProbs:
	.byte	-110
	.byte	-1
	.byte	-75
	.byte	-49
	.byte	-24
	.byte	-13
	.byte	-18
	.byte	-5
	.byte	-12
	.byte	-6
	.byte	-7
	.byte	-77
	.byte	-1
	.byte	-42
	.byte	-16
	.byte	-6
	.byte	-1
	.byte	-12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.space	2
	.type	ZeroRunProbDefaults, %object
	.size	ZeroRunProbDefaults, 28
ZeroRunProbDefaults:
	.byte	-58
	.byte	-59
	.byte	-60
	.byte	-110
	.byte	-58
	.byte	-52
	.byte	-87
	.byte	-114
	.byte	-126
	.byte	-120
	.byte	-107
	.byte	-107
	.byte	-65
	.byte	-7
	.byte	-121
	.byte	-55
	.byte	-75
	.byte	-102
	.byte	98
	.byte	117
	.byte	-124
	.byte	126
	.byte	-110
	.byte	-87
	.byte	-72
	.byte	-16
	.byte	-10
	.byte	-2
	.type	ZrlUpdateProbs, %object
	.size	ZrlUpdateProbs, 28
ZrlUpdateProbs:
	.byte	-37
	.byte	-10
	.byte	-18
	.byte	-7
	.byte	-24
	.byte	-17
	.byte	-7
	.byte	-1
	.byte	-8
	.byte	-3
	.byte	-17
	.byte	-12
	.byte	-15
	.byte	-8
	.byte	-58
	.byte	-24
	.byte	-5
	.byte	-3
	.byte	-37
	.byte	-15
	.byte	-3
	.byte	-1
	.byte	-8
	.byte	-7
	.byte	-12
	.byte	-18
	.byte	-5
	.byte	-1
	.type	VP6_AcUpdateProbs, %object
	.size	VP6_AcUpdateProbs, 396
VP6_AcUpdateProbs:
	.byte	-29
	.byte	-10
	.byte	-26
	.byte	-9
	.byte	-12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-47
	.byte	-25
	.byte	-25
	.byte	-7
	.byte	-7
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-31
	.byte	-14
	.byte	-15
	.byte	-5
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-15
	.byte	-3
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-16
	.byte	-1
	.byte	-8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-16
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-50
	.byte	-53
	.byte	-29
	.byte	-17
	.byte	-9
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-49
	.byte	-57
	.byte	-36
	.byte	-20
	.byte	-13
	.byte	-4
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-44
	.byte	-37
	.byte	-26
	.byte	-13
	.byte	-12
	.byte	-3
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-20
	.byte	-19
	.byte	-9
	.byte	-4
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-16
	.byte	-16
	.byte	-8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-26
	.byte	-23
	.byte	-7
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-18
	.byte	-18
	.byte	-6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-8
	.byte	-5
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-31
	.byte	-17
	.byte	-29
	.byte	-25
	.byte	-12
	.byte	-3
	.byte	-13
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-24
	.byte	-22
	.byte	-32
	.byte	-28
	.byte	-14
	.byte	-7
	.byte	-14
	.byte	-4
	.byte	-5
	.byte	-5
	.byte	-1
	.byte	-21
	.byte	-7
	.byte	-18
	.byte	-16
	.byte	-5
	.byte	-1
	.byte	-7
	.byte	-1
	.byte	-3
	.byte	-3
	.byte	-1
	.byte	-7
	.byte	-3
	.byte	-5
	.byte	-6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-5
	.byte	-6
	.byte	-7
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-13
	.byte	-12
	.byte	-6
	.byte	-6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-7
	.byte	-8
	.byte	-6
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.type	ScanBandUpdateProbs, %object
	.size	ScanBandUpdateProbs, 64
ScanBandUpdateProbs:
	.byte	-1
	.byte	-124
	.byte	-124
	.byte	-97
	.byte	-103
	.byte	-105
	.byte	-95
	.byte	-86
	.byte	-92
	.byte	-94
	.byte	-120
	.byte	110
	.byte	103
	.byte	114
	.byte	-127
	.byte	118
	.byte	124
	.byte	125
	.byte	-124
	.byte	-120
	.byte	114
	.byte	110
	.byte	-114
	.byte	-121
	.byte	-122
	.byte	123
	.byte	-113
	.byte	126
	.byte	-103
	.byte	-73
	.byte	-90
	.byte	-95
	.byte	-85
	.byte	-76
	.byte	-77
	.byte	-92
	.byte	-53
	.byte	-38
	.byte	-31
	.byte	-39
	.byte	-41
	.byte	-50
	.byte	-53
	.byte	-39
	.byte	-27
	.byte	-15
	.byte	-8
	.byte	-13
	.byte	-3
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.type	VP6_ModeVq, %object
	.size	VP6_ModeVq, 960
VP6_ModeVq:
	.byte	9
	.byte	15
	.byte	32
	.byte	25
	.byte	7
	.byte	19
	.byte	9
	.byte	21
	.byte	1
	.byte	12
	.byte	14
	.byte	12
	.byte	3
	.byte	18
	.byte	14
	.byte	23
	.byte	3
	.byte	10
	.byte	0
	.byte	4
	.byte	48
	.byte	39
	.byte	1
	.byte	2
	.byte	11
	.byte	27
	.byte	29
	.byte	44
	.byte	7
	.byte	27
	.byte	1
	.byte	4
	.byte	0
	.byte	3
	.byte	1
	.byte	6
	.byte	1
	.byte	2
	.byte	0
	.byte	0
	.byte	21
	.byte	32
	.byte	1
	.byte	2
	.byte	4
	.byte	10
	.byte	32
	.byte	43
	.byte	6
	.byte	23
	.byte	2
	.byte	3
	.byte	1
	.byte	19
	.byte	1
	.byte	6
	.byte	12
	.byte	21
	.byte	0
	.byte	7
	.byte	69
	.byte	83
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	10
	.byte	29
	.byte	3
	.byte	12
	.byte	0
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	3
	.byte	2
	.byte	2
	.byte	0
	.byte	0
	.byte	11
	.byte	20
	.byte	1
	.byte	4
	.byte	18
	.byte	36
	.byte	43
	.byte	48
	.byte	13
	.byte	35
	.byte	0
	.byte	2
	.byte	0
	.byte	5
	.byte	3
	.byte	12
	.byte	1
	.byte	2
	.byte	0
	.byte	0
	.byte	70
	.byte	44
	.byte	0
	.byte	1
	.byte	2
	.byte	10
	.byte	37
	.byte	46
	.byte	8
	.byte	26
	.byte	0
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	8
	.byte	15
	.byte	0
	.byte	1
	.byte	8
	.byte	21
	.byte	74
	.byte	53
	.byte	22
	.byte	42
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	3
	.byte	1
	.byte	2
	.byte	0
	.byte	0
	.byte	-115
	.byte	42
	.byte	0
	.byte	0
	.byte	1
	.byte	4
	.byte	11
	.byte	24
	.byte	1
	.byte	11
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	8
	.byte	19
	.byte	4
	.byte	10
	.byte	24
	.byte	45
	.byte	21
	.byte	37
	.byte	9
	.byte	29
	.byte	0
	.byte	3
	.byte	1
	.byte	7
	.byte	11
	.byte	25
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	46
	.byte	42
	.byte	0
	.byte	1
	.byte	2
	.byte	10
	.byte	54
	.byte	51
	.byte	10
	.byte	30
	.byte	0
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	28
	.byte	32
	.byte	0
	.byte	0
	.byte	3
	.byte	10
	.byte	75
	.byte	51
	.byte	14
	.byte	33
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	0
	.byte	0
	.byte	100
	.byte	46
	.byte	0
	.byte	1
	.byte	3
	.byte	9
	.byte	21
	.byte	37
	.byte	5
	.byte	20
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	1
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	27
	.byte	29
	.byte	0
	.byte	1
	.byte	9
	.byte	25
	.byte	53
	.byte	51
	.byte	12
	.byte	34
	.byte	0
	.byte	1
	.byte	0
	.byte	3
	.byte	1
	.byte	5
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	80
	.byte	38
	.byte	0
	.byte	0
	.byte	1
	.byte	4
	.byte	69
	.byte	33
	.byte	5
	.byte	16
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	16
	.byte	20
	.byte	0
	.byte	0
	.byte	2
	.byte	8
	.byte	104
	.byte	49
	.byte	15
	.byte	33
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	-62
	.byte	16
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	9
	.byte	1
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	41
	.byte	22
	.byte	1
	.byte	0
	.byte	1
	.byte	31
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	7
	.byte	0
	.byte	1
	.byte	98
	.byte	25
	.byte	4
	.byte	10
	.byte	123
	.byte	37
	.byte	6
	.byte	4
	.byte	1
	.byte	27
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	5
	.byte	8
	.byte	1
	.byte	7
	.byte	0
	.byte	1
	.byte	12
	.byte	10
	.byte	0
	.byte	2
	.byte	26
	.byte	14
	.byte	14
	.byte	12
	.byte	0
	.byte	24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	17
	.byte	1
	.byte	9
	.byte	0
	.byte	36
	.byte	5
	.byte	7
	.byte	1
	.byte	3
	.byte	-47
	.byte	5
	.byte	0
	.byte	0
	.byte	0
	.byte	27
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	5
	.byte	4
	.byte	5
	.byte	0
	.byte	121
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	2
	.byte	4
	.byte	1
	.byte	4
	.byte	2
	.byte	2
	.byte	0
	.byte	1
	.byte	-81
	.byte	5
	.byte	0
	.byte	1
	.byte	0
	.byte	48
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	83
	.byte	5
	.byte	2
	.byte	3
	.byte	0
	.byte	102
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	3
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-23
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	8
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	34
	.byte	16
	.byte	112
	.byte	21
	.byte	1
	.byte	28
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	8
	.byte	1
	.byte	7
	.byte	0
	.byte	3
	.byte	2
	.byte	5
	.byte	0
	.byte	2
	.byte	-97
	.byte	35
	.byte	2
	.byte	2
	.byte	0
	.byte	25
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	6
	.byte	0
	.byte	5
	.byte	0
	.byte	1
	.byte	4
	.byte	4
	.byte	0
	.byte	1
	.byte	75
	.byte	39
	.byte	5
	.byte	7
	.byte	2
	.byte	48
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	11
	.byte	2
	.byte	16
	.byte	1
	.byte	4
	.byte	7
	.byte	10
	.byte	0
	.byte	2
	.byte	-44
	.byte	21
	.byte	0
	.byte	1
	.byte	0
	.byte	9
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	2
	.byte	2
	.byte	0
	.byte	0
	.byte	4
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	-84
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	-69
	.byte	22
	.byte	1
	.byte	1
	.byte	0
	.byte	17
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	6
	.byte	0
	.byte	4
	.byte	0
	.byte	1
	.byte	4
	.byte	4
	.byte	0
	.byte	1
	.byte	-123
	.byte	6
	.byte	1
	.byte	2
	.byte	1
	.byte	70
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	4
	.byte	0
	.byte	3
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	-5
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	0
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	11
	.byte	4
	.byte	1
	.byte	4
	.byte	0
	.byte	2
	.byte	3
	.byte	2
	.byte	0
	.byte	4
	.byte	49
	.byte	46
	.byte	3
	.byte	4
	.byte	7
	.byte	31
	.byte	42
	.byte	41
	.byte	0
	.byte	0
	.byte	2
	.byte	6
	.byte	1
	.byte	7
	.byte	1
	.byte	4
	.byte	2
	.byte	4
	.byte	0
	.byte	1
	.byte	26
	.byte	25
	.byte	1
	.byte	1
	.byte	2
	.byte	10
	.byte	67
	.byte	39
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	14
	.byte	0
	.byte	2
	.byte	31
	.byte	26
	.byte	1
	.byte	6
	.byte	103
	.byte	46
	.byte	1
	.byte	2
	.byte	2
	.byte	10
	.byte	33
	.byte	42
	.byte	0
	.byte	0
	.byte	1
	.byte	4
	.byte	0
	.byte	3
	.byte	0
	.byte	1
	.byte	1
	.byte	3
	.byte	0
	.byte	0
	.byte	14
	.byte	31
	.byte	9
	.byte	13
	.byte	14
	.byte	54
	.byte	22
	.byte	29
	.byte	0
	.byte	0
	.byte	2
	.byte	6
	.byte	4
	.byte	18
	.byte	6
	.byte	13
	.byte	1
	.byte	5
	.byte	0
	.byte	1
	.byte	85
	.byte	39
	.byte	0
	.byte	0
	.byte	1
	.byte	9
	.byte	69
	.byte	40
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	0
	.byte	0
	.byte	31
	.byte	28
	.byte	0
	.byte	0
	.byte	3
	.byte	14
	.byte	-126
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	1
	.byte	3
	.byte	3
	.byte	0
	.byte	1
	.byte	-85
	.byte	25
	.byte	0
	.byte	0
	.byte	1
	.byte	5
	.byte	25
	.byte	21
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	17
	.byte	21
	.byte	68
	.byte	29
	.byte	6
	.byte	15
	.byte	13
	.byte	22
	.byte	0
	.byte	0
	.byte	6
	.byte	12
	.byte	3
	.byte	14
	.byte	4
	.byte	10
	.byte	1
	.byte	7
	.byte	0
	.byte	3
	.byte	51
	.byte	39
	.byte	0
	.byte	1
	.byte	2
	.byte	12
	.byte	91
	.byte	44
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	3
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	0
	.byte	1
	.byte	81
	.byte	25
	.byte	0
	.byte	0
	.byte	2
	.byte	9
	.byte	106
	.byte	26
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	-116
	.byte	37
	.byte	0
	.byte	1
	.byte	1
	.byte	8
	.byte	24
	.byte	33
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	0
	.byte	0
	.byte	14
	.byte	23
	.byte	1
	.byte	3
	.byte	11
	.byte	53
	.byte	90
	.byte	31
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	1
	.byte	5
	.byte	2
	.byte	6
	.byte	1
	.byte	2
	.byte	0
	.byte	0
	.byte	123
	.byte	29
	.byte	0
	.byte	0
	.byte	1
	.byte	7
	.byte	57
	.byte	30
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	13
	.byte	14
	.byte	0
	.byte	0
	.byte	4
	.byte	20
	.byte	-81
	.byte	20
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	-54
	.byte	23
	.byte	0
	.byte	0
	.byte	1
	.byte	3
	.byte	2
	.byte	9
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	VP6_MvUpdateProbs, %object
	.size	VP6_MvUpdateProbs, 34
VP6_MvUpdateProbs:
	.byte	-19
	.byte	-10
	.byte	-3
	.byte	-3
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-6
	.byte	-6
	.byte	-4
	.byte	-25
	.byte	-13
	.byte	-11
	.byte	-3
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-5
	.byte	-5
	.byte	-2
	.space	2
	.type	VP6_LoopFilterLimitValues, %object
	.size	VP6_LoopFilterLimitValues, 64
VP6_LoopFilterLimitValues:
	.byte	14
	.byte	14
	.byte	13
	.byte	13
	.byte	12
	.byte	12
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.type	DcQuantTab, %object
	.size	DcQuantTab, 128
DcQuantTab:
	.short	188
	.short	188
	.short	188
	.short	188
	.short	180
	.short	172
	.short	172
	.short	172
	.short	172
	.short	172
	.short	168
	.short	164
	.short	164
	.short	160
	.short	160
	.short	160
	.short	160
	.short	140
	.short	140
	.short	140
	.short	140
	.short	132
	.short	132
	.short	132
	.short	132
	.short	128
	.short	128
	.short	128
	.short	108
	.short	108
	.short	104
	.short	104
	.short	100
	.short	100
	.short	96
	.short	96
	.short	92
	.short	92
	.short	76
	.short	76
	.short	76
	.short	76
	.short	72
	.short	72
	.short	68
	.short	64
	.short	64
	.short	64
	.short	64
	.short	64
	.short	60
	.short	44
	.short	44
	.short	44
	.short	40
	.short	40
	.short	36
	.short	32
	.short	28
	.short	20
	.short	12
	.short	12
	.short	8
	.short	8
	.type	AcQuantTab, %object
	.size	AcQuantTab, 128
AcQuantTab:
	.short	376
	.short	368
	.short	360
	.short	352
	.short	344
	.short	328
	.short	312
	.short	296
	.short	280
	.short	264
	.short	248
	.short	232
	.short	216
	.short	212
	.short	208
	.short	204
	.short	200
	.short	196
	.short	192
	.short	188
	.short	184
	.short	180
	.short	176
	.short	172
	.short	168
	.short	160
	.short	156
	.short	148
	.short	144
	.short	140
	.short	136
	.short	132
	.short	128
	.short	124
	.short	120
	.short	116
	.short	112
	.short	108
	.short	104
	.short	100
	.short	96
	.short	92
	.short	88
	.short	84
	.short	80
	.short	76
	.short	72
	.short	68
	.short	64
	.short	60
	.short	56
	.short	52
	.short	48
	.short	44
	.short	40
	.short	36
	.short	32
	.short	28
	.short	24
	.short	20
	.short	16
	.short	12
	.short	8
	.short	4
	.type	__FUNCTION__.12851, %object
	.size	__FUNCTION__.12851, 17
__FUNCTION__.12851:
	.ascii	"VP6_DecodeDecide\000"
	.space	3
	.type	__func__.12865, %object
	.size	__func__.12865, 17
__func__.12865:
	.ascii	"VP6_Set_DecParam\000"
	.space	3
	.type	VP6_BaselineXmittedProbs, %object
	.size	VP6_BaselineXmittedProbs, 80
VP6_BaselineXmittedProbs:
	.byte	42
	.byte	2
	.byte	7
	.byte	42
	.byte	22
	.byte	3
	.byte	2
	.byte	5
	.byte	1
	.byte	0
	.byte	69
	.byte	1
	.byte	1
	.byte	44
	.byte	6
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	8
	.byte	1
	.byte	8
	.byte	0
	.byte	0
	.byte	2
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	-27
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	35
	.byte	1
	.byte	6
	.byte	34
	.byte	0
	.byte	2
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	122
	.byte	1
	.byte	1
	.byte	46
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	64
	.byte	0
	.byte	64
	.byte	64
	.byte	64
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	64
	.byte	0
	.byte	64
	.byte	64
	.byte	64
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	DefaultIsShortProbs, %object
	.size	DefaultIsShortProbs, 2
DefaultIsShortProbs:
	.byte	-94
	.byte	-92
	.space	2
	.type	DefaultMvShortProbs, %object
	.size	DefaultMvShortProbs, 14
DefaultMvShortProbs:
	.byte	-31
	.byte	-110
	.byte	-84
	.byte	-109
	.byte	-42
	.byte	39
	.byte	-100
	.byte	-52
	.byte	-86
	.byte	119
	.byte	-21
	.byte	-116
	.byte	-26
	.byte	-28
	.space	2
	.type	DefaultSignProbs, %object
	.size	DefaultSignProbs, 2
DefaultSignProbs:
	.byte	-128
	.byte	-128
	.space	2
	.type	DefaultMvLongProbs, %object
	.size	DefaultMvLongProbs, 16
DefaultMvLongProbs:
	.byte	-9
	.byte	-46
	.byte	-121
	.byte	68
	.byte	-118
	.byte	-36
	.byte	-17
	.byte	-10
	.byte	-12
	.byte	-72
	.byte	-55
	.byte	44
	.byte	-83
	.byte	-35
	.byte	-17
	.byte	-3
	.type	DefaultScanBands, %object
	.size	DefaultScanBands, 64
DefaultScanBands:
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	6
	.byte	6
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	8
	.byte	8
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	10
	.byte	10
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"%s arrange fs pool failed!\012\000" )
.LC1:
	ASCII(.ascii	"get frame store fail!\012\000" )
	.space	1
.LC2:
	ASCII(.ascii	"get image buffer ok: LogicFsID = %d\012\000" )
	.space	3
.LC3:
	ASCII(.ascii	"VP6 FSP_GetFsImagePtr Error!\012\000" )
	.space	2
.LC4:
	ASCII(.ascii	"dec_pts: %lld Usertag = %lld\012\000" )
	.space	2
.LC5:
	ASCII(.ascii	"enter VP6_ConvertBoolToHuff\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"leave VP6_ConvertBoolToHuff\012\000" )
	.space	3
.LC7:
	ASCII(.ascii	"enter VP6_IntraFrmHeader\012\000" )
	.space	2
.LC8:
	ASCII(.ascii	"error: Vp3VersionNo %d > CURRENT_DECODE_VERSION(8)\012" )
	ASCII(.ascii	"\000" )
.LC9:
	ASCII(.ascii	"error: bitstream error!\012\000" )
	.space	3
.LC10:
	ASCII(.ascii	"We have a new size image!\012 The old size is %d x " )
	ASCII(.ascii	"%d, and the new is %d x %d\012\000" )
.LC11:
	ASCII(.ascii	"leave VP6_IntraFrmHeader\012\000" )
	.space	2
.LC12:
	ASCII(.ascii	"VP6_InterFrmHeader VersionNo fault,old:%d,new:%d\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC13:
	ASCII(.ascii	"[ERR]VP6_GetPictureHeader invalid param!\012\000" )
	.space	2
.LC14:
	ASCII(.ascii	"VP6_GetPictureHeader enter!\012\000" )
	.space	3
.LC15:
	ASCII(.ascii	"VP6_GetPictureHeader leave!\012\000" )
	.space	3
.LC16:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC17:
	ASCII(.ascii	"VP6DEC_Init leave\012\000" )
	.space	1
.LC18:
	ASCII(.ascii	"ERROR: No Img buffer is allocated\012\000" )
	.space	1
.LC19:
	ASCII(.ascii	"----------------- vp6 Imode -> %d -----------------" )
	ASCII(.ascii	"-\012\000" )
	.space	2
.LC20:
	ASCII(.ascii	"-----I_MODE, but FrameType is %d-----\012\000" )
	.space	1
.LC21:
	ASCII(.ascii	"P-frm\000" )
	.space	2
.LC22:
	ASCII(.ascii	"-----cur framtype is %s, but refnum=%d-----\012\000" )
	.space	3
.LC23:
	ASCII(.ascii	"error: DecMode illegal\012\000" )
.LC24:
	ASCII(.ascii	"%s %d NULL == pFwdImg!!\012\000" )
	.space	3
.LC25:
	ASCII(.ascii	"dec P frame, fwd ref err(%d) > ref_thr(%d)\012\000" )
.LC26:
	ASCII(.ascii	"%s ERROR: logic fs is null!\012\000" )
	.space	3
.LC27:
	ASCII(.ascii	"%s ERROR: cur fs pstDecodeFs is null!\012\000" )
	.space	1
.LC28:
	ASCII(.ascii	"Error! Truncated packet\012\000" )
	.space	3
.LC29:
	ASCII(.ascii	"[ERR]VP6_GetPictureHeader Error!\012\000" )
	.space	2
.LC30:
	ASCII(.ascii	"[ERR] VP6_DecodeDecide Error!\012\000" )
	.space	1
.LC31:
	ASCII(.ascii	"IsSizeChanged = %d,old w/h = %d/%d,new w/h = %d/%d\012" )
	ASCII(.ascii	"\000" )
.LC32:
	ASCII(.ascii	"VP6_ArrangeVHBMem err\012\000" )
	.space	1
.LC33:
	ASCII(.ascii	"VP6_DecodeDecide err\012\000" )
	.space	2
.LC34:
	ASCII(.ascii	"VP6DEC_GetImageBuffer err\012\000" )
	.space	1
.LC35:
	ASCII(.ascii	"VP6_InitFrameInfo err\012\000" )
	.space	1
.LC36:
	ASCII(.ascii	"VP6_Set_DecParam Error!\012\000" )
	.space	3
.LC37:
	ASCII(.ascii	"ErrRatio = %d\012\000" )
	.space	1
.LC38:
	ASCII(.ascii	"pCurImg is null\012\000" )
	.space	3
.LC39:
	ASCII(.ascii	"err_level(%d) over ref_thr(%d)\012\000" )
.LC40:
	ASCII(.ascii	"line: %d pToQueImg is null!\012\000" )
	.space	3
.LC41:
	ASCII(.ascii	"insert img to Voqueue failed!\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
