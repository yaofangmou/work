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
	.file	"avs2.c"
	.text
	.align	2
	.type	AVS2_ue_v.isra.2, %function
AVS2_ue_v.isra.2:
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
	mov	r1, #32
	mov	r5, r0
	bl	BsShow
	bl	ZerosMS_32
	cmp	r0, #31
	bls	.L5
	movw	r3, #61166
	mov	r2, r0
	movt	r3, 65535
	ldr	r1, .L6
	mov	r0, #1
	bl	dprint_vfmw
	movw	r0, #61166
	movt	r0, 65535
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L5:
	add	r4, r0, #1
	mov	r1, r0
	mov	r0, r5
	bl	BsSkip
	mov	r1, r4
	mov	r0, r5
	bl	BsShow
	mov	r1, r4
	sub	r4, r0, #1
	mov	r0, r5
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L7:
	.align	2
.L6:
	.word	.LC0
	UNWIND(.fnend)
	.size	AVS2_ue_v.isra.2, .-AVS2_ue_v.isra.2
	.align	2
	.type	AVS2_se_v.isra.3, %function
AVS2_se_v.isra.3:
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
	mov	r1, #32
	mov	r5, r0
	bl	BsShow
	bl	ZerosMS_32
	cmp	r0, #31
	bls	.L13
	mvn	r0, #-2147483648
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L13:
	add	r6, r0, #1
	mov	r1, r0
	mov	r0, r5
	bl	BsSkip
	mov	r1, r6
	mov	r0, r5
	bl	BsShow
	mov	r1, r6
	sub	r0, r0, #1
	tst	r0, #1
	mov	r0, r0, asr #1
	addne	r4, r0, #1
	rsbeq	r4, r0, #0
	mov	r0, r5
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_se_v.isra.3, .-AVS2_se_v.isra.3
	.align	2
	.type	AVS2_UpdateSceneBuf.part.8, %function
AVS2_UpdateSceneBuf.part.8:
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
	add	r4, r0, #19200
	add	r5, r0, #20736
	mov	r6, r0
	add	r4, r4, #88
	add	r5, r5, #216
	add	r7, r0, #8192
	b	.L18
.L16:
	add	r4, r4, #104
	cmp	r4, r5
	beq	.L23
.L18:
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	sub	r3, r3, #5
	cmp	r3, #1
	bhi	.L16
	ldrb	r3, [r4, #6]	@ zero_extendqisi2
	tst	r3, #2
	and	r2, r3, #1
	beq	.L16
	ldr	r3, [r7, #2928]
	cmp	r3, r4
	beq	.L16
	cmp	r2, #0
	strb	r2, [r4, #6]
	bne	.L16
	strb	r2, [r4, #5]
	add	r4, r4, #104
	ldr	r1, [r4, #-48]
	ldr	r0, [r6, #4]
	bl	FSP_SetRef
	cmp	r4, r5
	bne	.L18
.L23:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_UpdateSceneBuf.part.8, .-AVS2_UpdateSceneBuf.part.8
	.align	2
	.global	AVS2_Vfmw_EpbRemove
	.type	AVS2_Vfmw_EpbRemove, %function
AVS2_Vfmw_EpbRemove:
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
	add	r5, r0, #44
	mov	r4, r0
	ldr	r7, [r0, #60]
	mov	r1, #8
	mov	r0, r5
	add	r6, r4, #76
	bl	BsGet
	mov	r1, #8
	sub	r7, r7, #3
	strb	r0, [r4, #76]
	mov	r0, r5
	bl	BsGet
	mov	r1, #8
	strb	r0, [r4, #77]
	mov	r0, r5
	bl	BsGet
	mov	r1, #24
	strb	r0, [r4, #78]
	mov	r0, r5
	bl	BsShow
	cmp	r7, #0
	mov	r3, r0
	mov	r9, r0, lsr #8
	beq	.L34
	mov	r8, #3
	mov	r4, #16
.L30:
	bic	r1, r3, #-16777216
	uxtb	r2, r3
	cmp	r1, #2
	mov	r0, r5
	ubfxeq	r2, r3, #2, #6
	addeq	r4, r4, #6
	addne	r4, r4, #8
	orreq	r9, r2, r9, asl #6
	orrne	r9, r2, r9, asl #8
	cmp	r4, #23
	mov	r1, #8
	sub	r7, r7, #1
	mov	r10, r3, asl r1
	ble	.L28
	cmp	r8, #512
	sub	r4, r4, #8
	mov	r3, r9, lsr r4
	bcs	.L29
	strb	r3, [r6, r8]
	add	r8, r8, #1
.L28:
	bl	BsGet
	mov	r1, #24
	mov	r0, r5
	bl	BsShow
	cmp	r7, #0
	uxtb	r0, r0
	orr	r3, r0, r10
	bne	.L30
	cmp	r4, #16
	ble	.L32
	cmp	r8, #512
	bcs	.L29
	mov	r9, r9, lsr #16
	rsb	r4, r4, #24
	mov	r4, r9, asl r4
	uxtb	r4, r4
	strb	r4, [r6, r8]
	cmp	r4, #0
	addne	r2, r8, #1
	bne	.L25
.L32:
	mov	r2, r8
.L25:
	mov	r0, r5
	mov	r1, r6
	bl	BsInit
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L29:
	mov	r0, r5
	mov	r1, #32
	bl	BsShow
	ldr	r1, .L36
	uxtb	r2, r0
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L34:
	mov	r2, #3
	b	.L25
.L37:
	.align	2
.L36:
	.word	.LC1
	UNWIND(.fnend)
	.size	AVS2_Vfmw_EpbRemove, .-AVS2_Vfmw_EpbRemove
	.align	2
	.global	AVS2_SkipToNextStartCode
	.type	AVS2_SkipToNextStartCode, %function
AVS2_SkipToNextStartCode:
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
	bgt	.L41
	b	.L42
.L47:
	bl	BsSkip
	cmp	r4, r6
	beq	.L42
.L41:
	mov	r1, #24
	mov	r0, r5
	bl	BsShow
	add	r4, r4, #1
	mov	r1, #8
	mov	r3, r0
	cmp	r3, #1
	mov	r0, r5
	bne	.L47
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L42:
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_SkipToNextStartCode, .-AVS2_SkipToNextStartCode
	.align	2
	.global	AVS2_DumpDpbStatus
	.type	AVS2_DumpDpbStatus, %function
AVS2_DumpDpbStatus:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	mov	r4, r0
	mov	r7, r1
	mov	r0, #32
	ldr	r1, .L57
	sub	r7, r7, #1
	bl	dprint_vfmw
	ldr	r1, .L57+4
	mov	r0, #32
	clz	r7, r7
	bl	dprint_vfmw
	add	r4, r4, #19200
	ldr	r8, .L57+8
	mov	r6, #0
	add	r4, r4, #94
	mov	r7, r7, lsr #5
	mov	r5, r6
.L51:
	ldrb	ip, [r4]	@ zero_extendqisi2
	cmp	ip, #0
	moveq	r3, r7
	orrne	r3, r7, #1
	cmp	r3, #0
	beq	.L49
	ldr	lr, [r4, #74]
	mov	r0, #32
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	add	r6, r6, #1
	ldr	r3, .L57+12
	str	lr, [sp, #28]
	cmp	r2, #6
	ldr	lr, [r4, #54]
	ldrls	r3, [r8, r2, asl #2]
	mov	r2, r5
	ldr	r1, .L57+16
	str	lr, [sp, #24]
	ldr	lr, [r4, #50]
	str	lr, [sp, #20]
	ldrsh	lr, [r4, #-4]
	str	lr, [sp, #16]
	ldrsh	lr, [r4, #-6]
	str	lr, [sp, #12]
	ldrb	lr, [r4, #-2]	@ zero_extendqisi2
	str	lr, [sp, #8]
	ldrb	lr, [r4, #-1]	@ zero_extendqisi2
	stmia	sp, {ip, lr}
	bl	dprint_vfmw
.L49:
	add	r5, r5, #1
	add	r4, r4, #104
	cmp	r5, #16
	bne	.L51
	mov	r2, r6
	ldr	r1, .L57+20
	mov	r0, #32
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	dprint_vfmw
.L58:
	.align	2
.L57:
	.word	.LC3
	.word	.LC4
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC5
	.word	.LC6
	UNWIND(.fnend)
	.size	AVS2_DumpDpbStatus, .-AVS2_DumpDpbStatus
	.align	2
	.global	AVS2_ClearPacket
	.type	AVS2_ClearPacket, %function
AVS2_ClearPacket:
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
	add	r4, r0, #16384
	mov	r5, r0
	ldr	r0, [r0, #4]
	ldr	r1, [r4, #2764]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #2750]	@ zero_extendqisi2
	cmp	r3, #0
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldrb	r3, [r4, #2830]	@ zero_extendqisi2
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, [r4, #2836]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r1, [r4, #2844]
	ldr	r0, [r5, #4]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	SM_ReleaseStreamSeg
	UNWIND(.fnend)
	.size	AVS2_ClearPacket, .-AVS2_ClearPacket
	.align	2
	.global	AVS2_ClearPicSlice
	.type	AVS2_ClearPicSlice, %function
AVS2_ClearPicSlice:
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
	ldr	r3, [r0, #1728]
	mov	r5, r0
	cmp	r3, #0
	movne	r6, r0
	movne	r4, #0
	bne	.L67
	b	.L68
.L66:
	ldr	r3, [r5, #1728]
	add	r6, r6, #36
	cmp	r3, r4
	bls	.L68
.L67:
	ldr	r1, [r6, #1760]
	ldr	r0, [r5, #4]
	bl	SM_ReleaseStreamSeg
	mov	r3, r4, asl #5
	add	r3, r3, r4, lsl #2
	add	r4, r4, #1
	add	r3, r5, r3
	add	r3, r3, #1728
	ldrh	r3, [r3, #28]
	cmp	r3, #256
	bne	.L66
	ldr	r3, [r6, #1744]
	cmp	r3, #0
	beq	.L66
	ldr	r1, [r6, #1764]
	add	r6, r6, #36
	ldr	r0, [r5, #4]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r5, #1728]
	cmp	r3, r4
	bhi	.L67
.L68:
	mov	r3, #0
	str	r3, [r5, #1728]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_ClearPicSlice, .-AVS2_ClearPicSlice
	.align	2
	.global	AVS2_ClearDpb
	.type	AVS2_ClearDpb, %function
AVS2_ClearDpb:
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
	add	r4, r0, #19200
	add	r5, r0, #20992
	mov	r6, r0
	add	r4, r4, #144
	add	r5, r5, #16
	mov	r7, #0
	b	.L76
.L75:
	add	r4, r4, #104
	cmp	r4, r5
	beq	.L81
.L76:
	ldrb	r3, [r4, #-50]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L75
	ldr	r1, [r4]
	mov	r2, #0
	ldr	r0, [r6, #4]
	add	r4, r4, #104
	bl	FSP_ClearLogicFs
	strb	r7, [r4, #-154]
	cmp	r4, r5
	bne	.L76
.L81:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_ClearDpb, .-AVS2_ClearDpb
	.align	2
	.global	AVS2_SequenceDisplayExtension
	.type	AVS2_SequenceDisplayExtension, %function
AVS2_SequenceDisplayExtension:
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
	add	r5, r0, #44
	add	r4, r0, #16384
	mov	r1, #4
	mov	r0, r5
	bl	BsGet
	mov	r1, #3
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #1024]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #1028]
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #1032]
	bne	.L88
.L83:
	mov	r1, #14
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #1048]
	mov	r0, r5
	bl	BsGet
	mov	r1, #14
	str	r0, [r4, #1052]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #1056]
	mov	r0, r5
	bl	BsGet
	cmp	r0, #1
	mov	r6, r0
	str	r0, [r4, #1060]
	beq	.L89
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L88:
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	mov	r1, #8
	str	r0, [r4, #1036]
	mov	r0, r5
	bl	BsGet
	mov	r1, #8
	str	r0, [r4, #1040]
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #1044]
	b	.L83
.L89:
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	mov	r1, r6
	str	r0, [r4, #1064]
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #1068]
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_SequenceDisplayExtension, .-AVS2_SequenceDisplayExtension
	.align	2
	.global	AVS2_CopyrightExtension
	.type	AVS2_CopyrightExtension, %function
AVS2_CopyrightExtension:
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
	add	r4, r0, #44
	mov	r1, #4
	mov	r0, r4
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #8
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #7
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #20
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #22
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #22
	bl	BsGet
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_CopyrightExtension, .-AVS2_CopyrightExtension
	.align	2
	.global	AVS2_CameraParametersExtension
	.type	AVS2_CameraParametersExtension, %function
AVS2_CameraParametersExtension:
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
	add	r4, r0, #44
	mov	r1, #4
	mov	r0, r4
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #7
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #22
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #22
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #22
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #22
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #16
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #16
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #16
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #16
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #16
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #16
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #22
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #22
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #22
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #22
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #22
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #22
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	mov	r0, r4
	mov	r1, #16
	bl	BsGet
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_CameraParametersExtension, .-AVS2_CameraParametersExtension
	.align	2
	.global	AVS2_TemporalScalabilityExtension
	.type	AVS2_TemporalScalabilityExtension, %function
AVS2_TemporalScalabilityExtension:
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
	add	r5, r0, #44
	mov	r1, #4
	add	r7, r0, #16384
	mov	r4, r0
	mov	r0, r5
	bl	BsGet
	mov	r0, r5
	mov	r1, #3
	bl	BsGet
	cmp	r0, #0
	str	r0, [r7, #2144]
	beq	.L97
	add	r4, r4, #18432
	mov	r6, #0
	add	r4, r4, #96
.L94:
	mov	r1, #4
	mov	r0, r5
	bl	BsGet
	mov	r1, #18
	add	r6, r6, #1
	str	r0, [r4, #4]!
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #28]
	mov	r0, r5
	bl	BsGet
	mov	r1, #12
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #60]
	ldr	r3, [r7, #2144]
	cmp	r3, r6
	bhi	.L94
.L97:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_TemporalScalabilityExtension, .-AVS2_TemporalScalabilityExtension
	.align	2
	.global	AVS2_PictureDisplayExtension
	.type	AVS2_PictureDisplayExtension, %function
AVS2_PictureDisplayExtension:
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
	add	r4, r0, #44
	add	r7, r0, #12288
	mov	r5, r0
	mov	r1, #4
	mov	r0, r4
	bl	BsGet
	ldr	r3, [r7, #2708]
	cmp	r3, #1
	add	r3, r5, #16384
	beq	.L115
	ldr	r2, [r3, #1248]
	cmp	r2, #0
	bne	.L116
.L100:
	mov	r3, #1
	str	r3, [r7, #2696]
.L102:
	add	r5, r5, #18432
	mov	r6, #0
	add	r5, r5, #68
.L104:
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	add	r6, r6, r1
	str	r0, [r5, #4]!
	mov	r0, r4
	bl	BsGet
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #12]
	mov	r0, r4
	bl	BsGet
	ldr	r3, [r7, #2696]
	cmp	r6, r3
	bcc	.L104
	mov	r0, r4
	bl	AVS2_SkipToNextStartCode
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L116:
	ldr	r3, [r3, #1256]
	cmp	r3, #1
	beq	.L103
.L101:
	mov	r3, #2
	str	r3, [r7, #2696]
	b	.L102
.L115:
	ldr	r2, [r3, #1256]
	cmp	r2, #1
	bne	.L100
	ldr	r3, [r3, #1252]
	cmp	r3, #1
	bne	.L101
.L103:
	mov	r3, #3
	str	r3, [r7, #2696]
	b	.L102
	UNWIND(.fnend)
	.size	AVS2_PictureDisplayExtension, .-AVS2_PictureDisplayExtension
	.align	2
	.global	AVS2_MasteringMetadataExtension
	.type	AVS2_MasteringMetadataExtension, %function
AVS2_MasteringMetadataExtension:
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
	add	r4, r0, #44
	add	r5, r0, #18432
	mov	r6, r0
	mov	r1, #4
	mov	r0, r4
	mov	r7, r5
	bl	BsGet
	add	r5, r5, #192
	add	r7, r7, #204
.L118:
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #4]!
	mov	r0, r4
	bl	BsGet
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #12]
	mov	r0, r4
	bl	BsGet
	cmp	r5, r7
	bne	.L118
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	add	r5, r6, #16384
	mov	r1, #1
	str	r0, [r5, #2268]
	mov	r0, r4
	bl	BsGet
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2272]
	mov	r0, r4
	bl	BsGet
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2276]
	mov	r0, r4
	bl	BsGet
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2280]
	mov	r0, r4
	bl	BsGet
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2284]
	mov	r0, r4
	bl	BsGet
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2288]
	mov	r0, r4
	bl	BsGet
	mov	r0, r4
	mov	r1, #16
	bl	BsGet
	mov	r3, #1
	mov	r0, r3
	str	r3, [r5, #2236]
	str	r3, [r5, #2240]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_MasteringMetadataExtension, .-AVS2_MasteringMetadataExtension
	.align	2
	.global	AVS2_DynamicMetadataExtension
	.type	AVS2_DynamicMetadataExtension, %function
AVS2_DynamicMetadataExtension:
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
	add	r4, r0, #44
	add	r5, r0, #16384
	mov	r1, #4
	mov	r7, r0
	mov	r0, r4
	bl	BsGet
	mov	r1, #4
	mov	r0, r4
	bl	BsGet
	mov	r1, #4
	strb	r0, [r5, #2293]
	mov	r0, r4
	bl	BsGet
	mov	r1, #4
	strb	r0, [r5, #2294]
	mov	r0, r4
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #2295]
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	mov	r0, r4
	bl	BsGet
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	cmp	r0, #0
	mov	r6, r0
	str	r0, [r5, #2304]
	beq	.L135
	add	r6, r7, #18688
	mov	r8, r6
	add	r6, r6, #18
	add	r8, r8, #24
.L123:
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strh	r0, [r6, #2]!	@ movhi
	mov	r0, r4
	bl	BsGet
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strh	r0, [r6, #6]	@ movhi
	mov	r0, r4
	bl	BsGet
	cmp	r6, r8
	bne	.L123
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	add	r9, r5, #2288
	mov	r1, #1
	add	r6, r7, #18688
	add	r9, r9, #4
	mov	r8, r6
	add	r6, r6, #38
	add	r8, r8, #46
	strh	r0, [r9, #44]	@ movhi
	mov	r0, r4
	bl	BsGet
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strh	r0, [r9, #46]	@ movhi
	mov	r0, r4
	bl	BsGet
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strh	r0, [r9, #48]	@ movhi
	mov	r0, r4
	bl	BsGet
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strh	r0, [r9, #50]	@ movhi
	mov	r0, r4
	bl	BsGet
.L124:
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strh	r0, [r6, #2]!	@ movhi
	mov	r0, r4
	bl	BsGet
	cmp	r6, r8
	bne	.L124
	mov	r1, #3
	mov	r0, r4
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #2352]
	mov	r0, r4
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #2353]
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #2354]
	mov	r0, r4
	bl	BsGet
	mov	r1, #8
	mov	r0, r4
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #2355]
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #2356]
	mov	r0, r4
	bl	BsGet
	mov	r1, #8
	mov	r0, r4
	bl	BsGet
	mov	r1, #4
	strb	r0, [r5, #2357]
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #2358]
	mov	r0, r4
	bl	BsGet
	ldrb	r3, [r5, #2358]	@ zero_extendqisi2
	cmp	r3, #0
	addgt	r8, r7, #18688
	movgt	r6, #0
	addgt	r8, r8, #54
	ble	.L129
.L128:
	mov	r1, #8
	mov	r0, r4
	bl	BsGet
	mov	r1, #8
	add	r6, r6, #1
	strb	r0, [r8, #1]!
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strb	r0, [r8, #10]
	mov	r0, r4
	bl	BsGet
	ldrb	r3, [r5, #2358]	@ zero_extendqisi2
	cmp	r3, r6
	movgt	r3, #1
	movle	r3, #0
	cmp	r6, #9
	movgt	r3, #0
	cmp	r3, #0
	bne	.L128
.L129:
	mov	r1, #4
	mov	r0, r4
	bl	BsGet
	tst	r0, #255
	strb	r0, [r5, #2379]
	addne	r6, r7, #18688
	addne	r6, r6, #75
	movne	r7, #0
	beq	.L127
.L130:
	mov	r1, #8
	mov	r0, r4
	bl	BsGet
	mov	r1, #8
	add	r7, r7, #1
	strb	r0, [r6, #1]!
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6, #6]
	mov	r0, r4
	bl	BsGet
	ldrb	r3, [r5, #2379]	@ zero_extendqisi2
	cmp	r3, r7
	movgt	r3, #1
	movle	r3, #0
	cmp	r7, #5
	movgt	r3, #0
	cmp	r3, #0
	bne	.L130
.L127:
	mov	r0, #1
	strb	r0, [r5, #2292]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L135:
	strb	r0, [r5, #2292]
	mov	r0, #1
	ldr	r2, .L136
	ldr	r1, .L136+4
	bl	dprint_vfmw
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L137:
	.align	2
.L136:
	.word	.LANCHOR0+28
	.word	.LC7
	UNWIND(.fnend)
	.size	AVS2_DynamicMetadataExtension, .-AVS2_DynamicMetadataExtension
	.align	2
	.global	AVS2_Extension
	.type	AVS2_Extension, %function
AVS2_Extension:
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
	add	r4, r0, #44
	mov	r6, r1
	mov	r5, r0
	mov	r1, #32
	mov	r0, r4
	bl	BsGet
	mov	r0, r4
	mov	r1, #4
	bl	BsShow
	cmp	r6, #0
	bne	.L139
	sub	r0, r0, #2
	cmp	r0, #10
	ldrls	pc, [pc, r0, asl #2]
	b	.L149
.L142:
	.word	.L141
	.word	.L143
	.word	.L150
	.word	.L149
	.word	.L149
	.word	.L152
	.word	.L149
	.word	.L149
	.word	.L146
	.word	.L154
	.word	.L148
.L139:
	sub	r0, r0, #4
	cmp	r0, #8
	ldrls	pc, [pc, r0, asl #2]
	b	.L149
.L151:
	.word	.L150
	.word	.L149
	.word	.L149
	.word	.L152
	.word	.L149
	.word	.L149
	.word	.L153
	.word	.L154
	.word	.L148
.L149:
	mov	r0, r4
	mov	r1, #4
	bl	BsSkip
.L148:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L154:
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	AVS2_CameraParametersExtension
.L150:
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	AVS2_CopyrightExtension
.L152:
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	AVS2_PictureDisplayExtension
.L153:
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	AVS2_DynamicMetadataExtension
.L146:
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	AVS2_MasteringMetadataExtension
.L141:
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	AVS2_SequenceDisplayExtension
.L143:
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	AVS2_TemporalScalabilityExtension
	UNWIND(.fnend)
	.size	AVS2_Extension, .-AVS2_Extension
	.align	2
	.global	AVS2_User_Data
	.type	AVS2_User_Data, %function
AVS2_User_Data:
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
	add	r4, r0, #44
	mov	r5, r0
	ldr	r1, .L163
	mov	r0, #7
	bl	dprint_vfmw
	mov	r0, r4
	mov	r1, #32
	bl	BsGet
	b	.L158
.L161:
	ldr	r3, [r5, #68]
	ldr	r2, [r5, #60]
	add	ip, r3, #8
	cmp	ip, r2, asl #3
	bhi	.L162
	bl	BsGet
.L158:
	mov	r1, #24
	mov	r0, r4
	bl	BsShow
	mov	r1, #8
	cmp	r0, #1
	mov	r0, r4
	bne	.L161
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L162:
	str	r2, [sp]
	mov	r0, #1
	ldr	r2, .L163+4
	ldr	r1, .L163+8
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L164:
	.align	2
.L163:
	.word	.LC8
	.word	.LANCHOR0+60
	.word	.LC9
	UNWIND(.fnend)
	.size	AVS2_User_Data, .-AVS2_User_Data
	.align	2
	.global	AVS2_ConvertSLHDRMetadata
	.type	AVS2_ConvertSLHDRMetadata, %function
AVS2_ConvertSLHDRMetadata:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 240
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #248)
	sub	sp, sp, #248
	ldr	r6, .L194
	mov	r5, r0
	mov	r4, r1
	sub	r0, fp, #276
	mov	r2, #240
	ldr	r3, [r6, #48]
	mov	r1, #0
	blx	r3
	ldr	r0, [r5, #472]
	ldr	r3, [r5, #476]
	cmp	r0, #0
	beq	.L190
	mov	r3, #1
	strb	r3, [r5, #458]
	ldrh	r1, [r4, #32]
	movw	ip, #15000
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	cmp	r1, ip
	ldrb	lr, [r4, #2]	@ zero_extendqisi2
	add	r2, r2, r3
	ldrb	ip, [r4, #3]	@ zero_extendqisi2
	str	r2, [fp, #-276]
	ldrb	r2, [r4, #60]	@ zero_extendqisi2
	str	lr, [fp, #-272]
	str	ip, [fp, #-268]
	str	r2, [fp, #-264]
	beq	.L171
	movw	r2, #8500
	cmp	r1, r2
	beq	.L188
	movw	r3, #13250
	cmp	r1, r3
	beq	.L191
.L171:
	mov	r3, #0
	str	r3, [fp, #-256]
.L169:
	ldr	ip, [r4, #12]
	mov	r2, #1
	str	r3, [fp, #-240]
	mov	r1, #100
	cmp	ip, #0
	mov	r3, #0
	str	r2, [fp, #-244]
	str	r2, [fp, #-260]
	str	r1, [fp, #-236]
	str	r3, [fp, #-232]
	bne	.L192
.L172:
	ldrh	r1, [r4, #52]
	ldrh	r2, [r4, #54]
	ldrh	r3, [r4, #56]
	str	r1, [fp, #-228]
	str	r2, [fp, #-224]
	ldrh	r1, [r4, #58]
	ldrb	r2, [r4, #61]	@ zero_extendqisi2
	str	r3, [fp, #-220]
	ldrb	r3, [r4, #62]	@ zero_extendqisi2
	ldrb	r9, [r4, #66]	@ zero_extendqisi2
	str	r1, [fp, #-216]
	str	r2, [fp, #-192]
	cmp	r9, #0
	ldrb	r1, [r4, #63]	@ zero_extendqisi2
	ldrb	r2, [r4, #64]	@ zero_extendqisi2
	str	r3, [fp, #-188]
	ldrb	r3, [r4, #65]	@ zero_extendqisi2
	str	r9, [fp, #-172]
	str	r1, [fp, #-184]
	str	r2, [fp, #-180]
	str	r3, [fp, #-176]
	beq	.L176
	add	lr, r4, #66
	sub	ip, fp, #172
	add	r1, r4, #76
	sub	r2, fp, #132
	mov	r3, #0
.L175:
	add	r3, r3, #1
	ldrb	r8, [lr, #1]!	@ zero_extendqisi2
	ldrb	r7, [r1, #1]!	@ zero_extendqisi2
	cmp	r9, r3
	str	r8, [ip, #4]!
	str	r7, [r2, #4]!
	bne	.L175
.L176:
	ldrb	r9, [r4, #87]	@ zero_extendqisi2
	cmp	r9, #0
	str	r9, [fp, #-88]
	beq	.L174
	add	ip, r4, #87
	sub	r1, fp, #88
	add	r4, r4, #93
	sub	r2, fp, #64
	mov	r3, #0
.L179:
	add	r3, r3, #1
	ldrb	r7, [ip, #1]!	@ zero_extendqisi2
	cmp	r9, r3
	ldrb	lr, [r4, #1]!	@ zero_extendqisi2
	movhi	r8, #1
	movls	r8, #0
	cmp	r3, #5
	str	r7, [r1, #4]!
	str	lr, [r2, #4]!
	movhi	r8, #0
	cmp	r8, #0
	bne	.L179
.L174:
	ldr	r3, [r5, #460]
	cmp	r3, #239
	bhi	.L193
	mov	r1, #240
	ldr	r2, .L194+4
	str	r1, [sp]
	mov	r0, #1
	ldr	r1, .L194+8
	bl	dprint_vfmw
.L165:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L192:
	ldrh	r3, [r4, #48]
	movw	r8, #34079
	movt	r8, 20971
	ldrh	r2, [r4, #50]
	add	r3, r3, #25
	movw	r7, #35757
	add	r2, r2, #4992
	movt	r7, 26843
	smull	r8, r9, r3, r8
	mov	r3, r3, asr #31
	add	r2, r2, #8
	mov	r1, #50
	movw	lr, #10000
	mov	ip, r2, asr #31
	rsb	r3, r3, r9, asr #4
	mul	r1, r1, r3
	smull	r2, r3, r2, r7
	cmp	r1, lr
	movge	r1, lr
	str	r1, [fp, #-252]
	rsb	r3, ip, r3, asr #12
	str	r3, [fp, #-248]
	b	.L172
.L193:
	ldr	r3, [r6, #52]
	sub	r1, fp, #276
	mov	r2, #240
	blx	r3
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L191:
	mov	r3, #2
.L188:
	str	r3, [fp, #-256]
	b	.L169
.L190:
	str	r0, [sp]
	mov	r0, #1
	str	r3, [sp, #4]
	ldr	r2, .L194+4
	ldr	r1, .L194+12
	bl	dprint_vfmw
	b	.L165
.L195:
	.align	2
.L194:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+76
	.word	.LC11
	.word	.LC10
	UNWIND(.fnend)
	.size	AVS2_ConvertSLHDRMetadata, .-AVS2_ConvertSLHDRMetadata
	.align	2
	.global	AVS2_ConvertHDRInfo
	.type	AVS2_ConvertHDRInfo, %function
AVS2_ConvertHDRInfo:
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
	ldr	r3, [r1, #4]
	add	lr, r0, #484
	add	r4, r2, #3632
	add	ip, r2, #3648
	add	r4, r4, #8
	add	lr, lr, #2
	strb	r3, [r0, #480]
	add	ip, ip, #4
	ldr	r6, [r1, #12]
	add	r5, r0, #492
	mov	r3, #0
	strb	r6, [r0, #481]
	ldr	r6, [r1, #20]
	strb	r6, [r0, #482]
	ldr	r1, [r1, #16]
	str	r1, [r0, #484]
	ldr	r1, [r2, #3636]
	strb	r1, [r0, #456]
.L197:
	ldr	r1, [r4, #4]!
	add	r3, r3, #1
	cmp	r3, #3
	strh	r1, [lr, #2]!	@ movhi
	ldr	r1, [ip, #4]!
	strh	r1, [r5, #2]!	@ movhi
	bne	.L197
	ldr	ip, [r2, #3668]
	add	r3, r0, #500
	movw	r1, #502
	strh	ip, [r3]	@ movhi
	ldr	r3, [r2, #3672]
	strh	r3, [r0, r1]	@ movhi
	ldr	r3, [r2, #3676]
	str	r3, [r0, #504]
	ldr	r3, [r2, #3680]
	str	r3, [r0, #508]
	ldr	r3, [r2, #3640]
	strb	r3, [r0, #457]
	ldr	r3, [r2, #3684]
	str	r3, [r0, #512]
	ldr	r3, [r2, #3688]
	str	r3, [r0, #516]
	ldrb	r3, [r2, #3692]	@ zero_extendqisi2
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, fp, sp, pc}
	add	r1, r2, #3680
	add	r1, r1, #12
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	AVS2_ConvertSLHDRMetadata
	UNWIND(.fnend)
	.size	AVS2_ConvertHDRInfo, .-AVS2_ConvertHDRInfo
	.align	2
	.global	AVS2_WriteSliceMsg
	.type	AVS2_WriteSliceMsg, %function
AVS2_WriteSliceMsg:
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
	ldr	r2, [r0, #1728]
	mov	r4, r0
	cmp	r2, #255
	bhi	.L206
	add	r7, r0, #44
	mov	r1, #24
	mov	r0, r7
	bl	BsSkip
	mov	r0, r7
	mov	r1, #8
	bl	BsGet
	cmp	r0, #143
	mov	r6, r0
	bhi	.L207
	add	r5, r4, #12288
	mov	r1, #144
	ldr	r2, [r5, #2776]
	ldr	r3, [r5, #2724]
	cmp	r3, r1, asl r2
	bhi	.L208
.L204:
	mov	r1, #8
	mov	r0, r7
	bl	BsGet
	ldr	r2, [r5, #2776]
	ldr	r3, [r5, #2716]
	mov	r1, #255
	cmp	r3, r1, asl r2
	mov	r8, r0
	bhi	.L209
.L205:
	ldr	r2, [r4, #1728]
	add	r5, r5, #5056
	add	r7, r4, #16384
	mov	r0, #1
	add	lr, r2, #1
	mov	r3, r2, asl #5
	add	r3, r3, r2, lsl #2
	add	r3, r4, r3
	add	r2, r3, #1728
	mov	ip, r3
	strh	r6, [r2, #6]	@ movhi
	strh	r8, [r2, #4]	@ movhi
	ldrh	r2, [r5, #52]
	mla	r6, r2, r6, r8
	mov	r2, r3
	str	r6, [ip, #1736]!
	ldr	r5, [r7, #2756]
	str	r5, [ip, #4]
	ldr	ip, [r7, #2836]
	str	ip, [r3, #1744]
	ldr	ip, [r7, #2760]
	str	ip, [r2, #1748]!
	ldr	ip, [r7, #2840]
	str	ip, [r2, #4]
	ldrb	r2, [r7, #2750]	@ zero_extendqisi2
	strb	r2, [r3, #1756]
	ldrb	r2, [r7, #2830]	@ zero_extendqisi2
	strb	r2, [r3, #1757]
	ldr	r2, [r7, #2764]
	str	r2, [r3, #1760]
	ldr	r2, [r7, #2844]
	str	r2, [r3, #1764]
	ldr	r3, [r4, #12]
	str	lr, [r4, #1728]
	orr	r3, r3, #32768
	str	r3, [r4, #12]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L206:
	mov	r3, #256
	ldr	r1, .L210
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L207:
	mov	r2, r0
	ldr	r1, .L210+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L209:
	mov	r0, r7
	mov	r1, #2
	bl	BsGet
	add	r8, r8, r0, lsl #8
	b	.L205
.L208:
	mov	r1, #3
	mov	r0, r7
	bl	BsGet
	add	r6, r6, r0, lsl #7
	b	.L204
.L211:
	.align	2
.L210:
	.word	.LC12
	.word	.LC13
	UNWIND(.fnend)
	.size	AVS2_WriteSliceMsg, .-AVS2_WriteSliceMsg
	.align	2
	.global	AVS2_Head_GetRefConfigSet
	.type	AVS2_Head_GetRefConfigSet, %function
AVS2_Head_GetRefConfigSet:
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
	mov	r6, r1
	mov	r5, r0
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	mov	r1, #3
	str	r0, [r5]
	mov	r0, r6
	bl	BsGet
	cmp	r0, #0
	str	r0, [r5, #4]
	addne	r7, r5, #4
	movne	r4, #0
	beq	.L217
.L216:
	mov	r1, #6
	mov	r0, r6
	bl	BsGet
	add	r4, r4, #1
	str	r0, [r7, #4]!
	ldr	r3, [r5, #4]
	cmp	r3, r4
	bhi	.L216
.L217:
	mov	r1, #3
	mov	r0, r6
	bl	BsGet
	cmp	r0, #0
	str	r0, [r5, #36]
	addne	r7, r5, #36
	movne	r4, #0
	beq	.L215
.L218:
	mov	r1, #6
	mov	r0, r6
	bl	BsGet
	add	r4, r4, #1
	str	r0, [r7, #4]!
	ldr	r3, [r5, #36]
	cmp	r3, r4
	bhi	.L218
.L215:
	mov	r0, r6
	mov	r1, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	BsGet
	UNWIND(.fnend)
	.size	AVS2_Head_GetRefConfigSet, .-AVS2_Head_GetRefConfigSet
	.align	2
	.global	AVS2_WeightQuantMatrix
	.type	AVS2_WeightQuantMatrix, %function
AVS2_WeightQuantMatrix:
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
	add	r8, r0, #16
	mov	r5, r0
	mov	r4, r1
	mov	r6, r2
.L223:
	add	r7, r5, #4
.L222:
	mov	r0, r6
	bl	AVS2_ue_v.isra.2
	strb	r0, [r5], #1
	cmp	r5, r7
	bne	.L222
	cmp	r5, r8
	bne	.L223
	add	r7, r4, #64
.L225:
	add	r5, r4, #8
.L224:
	mov	r0, r6
	bl	AVS2_ue_v.isra.2
	strb	r0, [r4], #1
	cmp	r4, r5
	bne	.L224
	cmp	r4, r7
	bne	.L225
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_WeightQuantMatrix, .-AVS2_WeightQuantMatrix
	.align	2
	.global	AVS2_SetupWqMatrix84DataIdx01
	.type	AVS2_SetupWqMatrix84DataIdx01, %function
AVS2_SetupWqMatrix84DataIdx01:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	ldr	r5, .L255
	mov	r4, r0
	mov	r2, #6
	sub	r0, fp, #36
	mov	r1, #0
	ldr	r3, [r5, #48]
	blx	r3
	ldr	r3, [r4, #2716]
	cmp	r3, #0
	beq	.L253
	cmp	r3, #1
	beq	.L254
	cmp	r3, #2
	beq	.L251
.L252:
	add	lr, r4, #2480
	add	lr, lr, #5
.L232:
	ldr	r3, [r4, #2720]
	cmp	r3, #0
	beq	.L243
	cmp	r3, #1
	beq	.L244
	ldr	ip, .L255+4
	add	r2, ip, #64
	b	.L237
.L243:
	ldr	ip, .L255+8
	add	r2, ip, #64
.L237:
	add	r5, r2, #16
.L238:
	add	r0, r2, #4
	mov	r1, lr
.L239:
	ldrb	r3, [r2], #1	@ zero_extendqisi2
	sub	r6, fp, #28
	add	r3, r6, r3
	cmp	r0, r2
	ldrb	r3, [r3, #-8]	@ zero_extendqisi2
	strb	r3, [r1, #1]!
	bne	.L239
	cmp	r0, r5
	add	lr, lr, #4
	mov	r2, r0
	bne	.L238
	add	r0, r4, #2496
	add	lr, ip, #64
	add	r0, r0, #13
.L240:
	sub	r2, r0, #8
	mov	r1, ip
.L241:
	ldrb	r3, [r1], #1	@ zero_extendqisi2
	sub	r4, fp, #28
	add	r3, r4, r3
	ldrb	r3, [r3, #-8]	@ zero_extendqisi2
	strb	r3, [r2, #1]!
	cmp	r0, r2
	bne	.L241
	add	ip, ip, #8
	add	r0, r0, #8
	cmp	ip, lr
	bne	.L240
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L253:
	ldr	r3, [r5, #52]
	sub	r0, fp, #36
	mov	r2, #6
	ldr	r1, .L255+12
	blx	r3
	add	lr, r4, #2480
	add	lr, lr, #5
	b	.L232
.L254:
	add	r2, r4, #2464
	ldr	r0, .L255+16
	sub	r1, fp, #36
	mov	lr, r2
	add	r2, r2, #9
	add	lr, lr, #15
.L234:
	ldrb	ip, [r2, #1]!	@ zero_extendqisi2
	ldrb	r3, [r0], #1	@ zero_extendqisi2
	cmp	r2, lr
	add	r3, r3, ip
	strb	r3, [r1], #1
	bne	.L234
	b	.L252
.L251:
	add	r1, r4, #2464
	add	lr, r4, #2480
	ldr	r0, .L255+20
	add	r1, r1, #15
	add	lr, lr, #5
	sub	r3, fp, #36
.L236:
	ldrb	ip, [r1, #1]!	@ zero_extendqisi2
	ldrb	r2, [r0], #1	@ zero_extendqisi2
	cmp	r1, lr
	add	r2, r2, ip
	strb	r2, [r3], #1
	bne	.L236
	b	.L232
.L244:
	ldr	ip, .L255+24
	add	r2, ip, #64
	b	.L237
.L256:
	.align	2
.L255:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+264
	.word	.LANCHOR0+104
	.word	.LANCHOR0+344
	.word	.LANCHOR0+352
	.word	.LANCHOR0+360
	.word	.LANCHOR0+184
	UNWIND(.fnend)
	.size	AVS2_SetupWqMatrix84DataIdx01, .-AVS2_SetupWqMatrix84DataIdx01
	.align	2
	.global	AVS2_SetupWqMatrix84
	.type	AVS2_SetupWqMatrix84, %function
AVS2_SetupWqMatrix84:
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
	ldr	r3, [r0, #2696]
	mov	r4, r0
	cmp	r3, #0
	beq	.L262
	ldr	r3, [r0, #2700]
	cmp	r3, #0
	bne	.L259
	ldr	r3, [r0, #88]
	add	r0, r0, #2480
	ldr	r5, .L263
	add	r0, r0, #6
	cmp	r3, #0
	mov	r2, #16
	bne	.L260
	ldr	r3, [r5, #52]
	ldr	r1, .L263+4
	blx	r3
	add	r0, r4, #2496
	ldr	r3, [r5, #52]
	add	r0, r0, #6
	mov	r2, #64
	ldr	r1, .L263+8
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L259:
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	AVS2_SetupWqMatrix84DataIdx01
.L262:
	ldr	r5, .L263
	add	r0, r0, #2480
	mov	r2, #16
	mov	r1, #64
	add	r0, r0, #6
	ldr	r3, [r5, #48]
	blx	r3
	add	r0, r4, #2496
	mov	r2, #64
	ldr	r3, [r5, #48]
	add	r0, r0, #6
	mov	r1, r2
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L260:
	add	r1, r4, #108
	ldr	r3, [r5, #52]
	blx	r3
	add	r0, r4, #2496
	ldr	r3, [r5, #52]
	add	r0, r0, #6
	add	r1, r4, #124
	mov	r2, #64
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L264:
	.align	2
.L263:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+368
	.word	.LANCHOR0+384
	UNWIND(.fnend)
	.size	AVS2_SetupWqMatrix84, .-AVS2_SetupWqMatrix84
	.align	2
	.global	AVS2_ALF_ParameterSet
	.type	AVS2_ALF_ParameterSet, %function
AVS2_ALF_ParameterSet:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 608
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #612)
	sub	sp, sp, #612
	ldr	r6, [r0, #252]
	mov	r5, r0
	mov	r4, r1
	cmp	r6, #1
	beq	.L327
.L266:
	ldr	r3, [r5, #256]
	cmp	r3, #1
	beq	.L328
	ldr	r3, [r5, #260]
	cmp	r3, #1
	beq	.L297
.L299:
	mov	r0, #1
.L322:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L330:
	add	r2, r3, #1088
	cmp	r2, #2160
	bcs	.L292
	add	r3, r5, #904
	add	r0, r5, #936
	mov	r2, #64
.L293:
	ldr	r1, [r3, #4]!
	cmp	r3, r0
	sub	r2, r2, r1, asl #1
	bne	.L293
	ldr	r1, [r5, #260]
	ldr	r3, [r5, #940]
	cmp	r1, #1
	add	r2, r3, r2
	str	r2, [r5, #940]
	bne	.L299
.L297:
	mov	r0, r4
	mov	r7, r5
	bl	AVS2_se_v.isra.3
	mov	r6, #0
	mov	r3, r0
	str	r0, [r7, #944]!
	b	.L298
.L302:
	bl	AVS2_se_v.isra.3
	add	r6, r6, #1
	cmp	r6, #8
	mov	r3, r0
	str	r0, [r7, #4]!
	beq	.L329
.L298:
	add	r1, r3, #64
	mov	r0, r4
	cmp	r1, #127
	bls	.L302
	mov	r2, r6
	ldr	r1, .L334
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	b	.L322
.L328:
	mov	r0, r4
	mov	r7, r5
	bl	AVS2_se_v.isra.3
	mov	r6, #0
	mov	r3, r0
	str	r0, [r7, #908]!
	b	.L296
.L294:
	bl	AVS2_se_v.isra.3
	add	r6, r6, #1
	cmp	r6, #8
	mov	r3, r0
	str	r0, [r7, #4]!
	beq	.L330
.L296:
	add	r1, r3, #64
	mov	r0, r4
	cmp	r1, #127
	bls	.L294
	mov	r2, r6
	ldr	r1, .L334+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	b	.L322
.L327:
	mov	r0, r1
	bl	AVS2_ue_v.isra.2
	cmp	r0, #15
	str	r0, [r5, #264]
	bhi	.L267
	cmn	r0, #1
	beq	.L331
	add	r3, r5, #268
	sub	r7, fp, #624
	str	r6, [fp, #-644]
	mov	r8, #0
	mov	r6, r3
	str	r3, [fp, #-648]
.L281:
	cmp	r8, #0
	movle	r3, #0
	movgt	r3, #1
	cmp	r0, #15
	cmpne	r8, #0
	ble	.L271
	mov	r0, r4
	bl	AVS2_ue_v.isra.2
	sub	r3, r0, #1
	str	r0, [r6]
	cmp	r3, #14
	bhi	.L332
.L273:
	mov	r0, r4
	mov	r9, r7
	bl	AVS2_se_v.isra.3
	mov	r10, #0
	str	r6, [fp, #-640]
	mov	r3, r0
	str	r0, [r9, #4]!
	b	.L280
.L277:
	ldr	ip, [r6]
	cmp	ip, #63
	bhi	.L278
	bl	AVS2_se_v.isra.3
	add	r10, r10, #1
	cmp	r10, #8
	mov	r3, r0
	str	r0, [r9, #4]!
	beq	.L333
.L280:
	cmn	r3, #64
	mov	r0, r4
	bge	.L277
.L278:
	mov	r2, r10
	ldr	r1, .L334+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	b	.L322
.L271:
	cmp	r3, #0
	ldrne	r3, [fp, #-644]
	strne	r3, [r6]
	b	.L273
.L267:
	mov	r2, r0
	ldr	r1, .L334+12
	mov	r0, r6
	bl	dprint_vfmw
	mov	r0, #0
	b	.L322
.L332:
	mov	r2, r0
	ldr	r1, .L334+16
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	b	.L322
.L331:
	mov	r0, #0
	strb	r0, [fp, #-636]
.L282:
	sub	r2, fp, #636
	mov	r3, r0
	add	r0, r2, r0
	sub	r2, fp, #44
	add	r1, r2, r3
.L290:
	add	r3, r3, #1
	ldrb	r2, [r1, #-592]	@ zero_extendqisi2
	cmp	r3, #15
	strb	r2, [r0], #1
	ble	.L290
.L289:
	ldr	r6, .L334+20
	add	r7, r5, #332
	ldr	r9, .L334+24
	add	r8, r6, #16
.L291:
	ldrb	r1, [r6, #1]!	@ zero_extendqisi2
	sub	ip, fp, #44
	mov	r2, #36
	mov	r0, r7
	add	r1, ip, r1
	ldr	r3, [r9, #52]
	add	r7, r7, r2
	ldrb	ip, [r1, #-592]	@ zero_extendqisi2
	mov	r1, ip, asl #5
	add	r1, r1, ip, lsl #2
	sub	ip, fp, #620
	add	r1, ip, r1
	blx	r3
	cmp	r6, r8
	bne	.L291
	b	.L266
.L329:
	add	r2, r3, #1088
	cmp	r2, #2160
	bcs	.L300
	add	r3, r5, #940
	add	r0, r5, #972
	mov	r2, #64
.L301:
	ldr	r1, [r3, #4]!
	cmp	r3, r0
	sub	r2, r2, r1, asl #1
	bne	.L301
	ldr	r3, [r5, #976]
	mov	r0, #1
	add	r2, r3, r2
	str	r2, [r5, #976]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L333:
	cmn	r3, #1088
	blt	.L275
	ldr	r2, [fp, #-640]
	add	r6, r6, #4
	ldr	r2, [r2]
	cmp	r2, #1072
	bcs	.L275
	add	r0, r7, #32
	mov	r3, r7
	mov	r1, #64
.L276:
	ldr	r2, [r3, #4]!
	cmp	r0, r3
	sub	r1, r1, r2, asl #1
	bne	.L276
	ldr	r0, [r5, #264]
	add	r8, r8, #1
	ldr	r3, [r7, #36]
	add	ip, r0, #1
	cmp	r8, ip
	add	r1, r3, r1
	str	r1, [r7, #36]!
	bcc	.L281
	cmp	ip, #1
	mov	r0, #0
	strb	r0, [fp, #-636]
	bls	.L282
	mov	r8, #1
	mov	lr, r0
.L283:
	ldr	r3, [fp, #-648]
	ldr	r7, [r3, #4]!
	cmp	r7, #1
	str	r3, [fp, #-648]
	subeq	r3, fp, #44
	addeq	r3, r3, lr
	beq	.L287
	sub	r1, fp, #44
	sub	r6, r7, #1
	mov	r3, lr
	mov	r2, #0
	add	r1, r1, lr
	b	.L288
.L284:
	ldrb	r0, [r1, #-592]	@ zero_extendqisi2
.L288:
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, r6
	strb	r0, [r1, #-591]
	uxtb	r3, r3
	sub	r1, fp, #44
	add	r1, r1, r3
	bne	.L284
	add	lr, lr, #1
	sub	r7, r7, #2
	sub	r3, fp, #44
	uxtab	lr, r7, lr
	uxtb	lr, lr
	add	r3, r3, lr
	ldrb	r0, [r3, #-592]	@ zero_extendqisi2
.L287:
	add	r8, r8, #1
	add	lr, lr, #1
	cmp	r8, ip
	add	r0, r0, #1
	uxtb	lr, lr
	strb	r0, [r3, #-591]
	subne	r3, fp, #44
	addne	r3, r3, lr
	ldrneb	r0, [r3, #-592]	@ zero_extendqisi2
	bne	.L283
.L285:
	cmp	lr, #15
	mov	r0, lr
	ble	.L282
	b	.L289
.L292:
	mov	r2, r3
	ldr	r1, .L334+28
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	b	.L322
.L275:
	mov	r2, r3
	ldr	r1, .L334+32
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	b	.L322
.L300:
	mov	r2, r3
	ldr	r1, .L334+36
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	b	.L322
.L335:
	.align	2
.L334:
	.word	.LC21
	.word	.LC19
	.word	.LC17
	.word	.LC14
	.word	.LC15
	.word	.LANCHOR0+447
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC18
	.word	.LC16
	.word	.LC20
	UNWIND(.fnend)
	.size	AVS2_ALF_ParameterSet, .-AVS2_ALF_ParameterSet
	.global	__aeabi_uidiv
	.align	2
	.global	AVS2_DeriveMaxDpbNum
	.type	AVS2_DeriveMaxDpbNum, %function
AVS2_DeriveMaxDpbNum:
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
	ldr	r2, [r0, #4]
	mov	r5, r0
	cmp	r2, #34
	movls	r3, #15
	strlsb	r3, [r0, #2412]
	ldmlsfd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, [r0, #24]
	cmp	r2, #74
	ldr	r4, [r0, #16]
	add	r3, r3, #7
	movls	r0, #13369344
	add	r4, r4, #7
	bic	r3, r3, #7
	bic	r4, r4, #7
	mul	r4, r4, r3
	mov	r1, r4
	bls	.L344
	cmp	r2, #90
	movls	r0, #56623104
	movhi	r0, #213909504
.L344:
	bl	__aeabi_uidiv
	mov	r3, #57344
	movt	r3, 31
	cmp	r0, #16
	movcs	r0, #16
	sub	r0, r0, #1
	cmp	r4, r3
	uxtb	r0, r0
	movls	r3, #7
	movhi	r3, #6
	movls	r2, #15
	movhi	r2, #10
	cmp	r3, r0
	movcc	r3, r0
	cmp	r3, r2
	movcs	r3, r2
	strb	r3, [r5, #2412]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_DeriveMaxDpbNum, .-AVS2_DeriveMaxDpbNum
	.align	2
	.global	AVS2_IntraPictureHeader
	.type	AVS2_IntraPictureHeader, %function
AVS2_IntraPictureHeader:
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
	ldr	r8, .L441
	ldr	r3, [r0, #12]
	add	r9, r0, #17408
	mov	r7, r0
	add	r9, r9, #48
	mov	r2, #16
	mov	r1, #0
	bic	r3, r3, #262144
	add	r5, r7, #44
	str	r3, [r7, #12]
	add	r0, r9, #268
	ldr	r3, [r8, #48]
	add	r4, r7, #16384
	blx	r3
	mov	r0, r7
	bl	AVS2_Vfmw_EpbRemove
	mov	r1, #32
	mov	r0, r5
	add	r6, r7, #12288
	bl	BsGet
	mov	r0, r5
	mov	r1, #32
	bl	BsGet
	str	r0, [r4, #1168]
	ldr	r3, [r6, #2700]
	cmp	r3, #72
	beq	.L421
.L346:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #1
	str	r0, [r4, #1176]
	beq	.L422
.L347:
	ldr	r3, [r6, #2788]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r4, #1212]
	beq	.L423
.L350:
	mov	r3, #0
	str	r3, [r4, #1216]
.L351:
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #1220]
	ldr	r3, [r6, #2768]
	cmp	r3, #1
	movne	r3, #0
	strne	r3, [r4, #1224]
	beq	.L424
.L353:
	ldr	r3, [r6, #2764]
	cmp	r3, #0
	bne	.L354
	ldr	r3, [r4, #1212]
	cmp	r3, #0
	beq	.L355
	ldr	r3, [r4, #1216]
	cmp	r3, #1
	beq	.L355
.L354:
	mov	r3, #0
	str	r3, [r4, #1228]
.L356:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #1232]
	beq	.L357
	mov	r1, #5
	mov	r0, r5
	bl	BsGet
	mov	r2, #68
	mov	r3, r0, asl #6
	str	r0, [r4, #1236]
	add	r1, r3, r0, lsl #2
	ldr	r3, [r8, #52]
	add	r1, r7, r1
	add	r0, r9, #980
	add	r1, r1, #15168
	add	r1, r1, #36
	blx	r3
	ldr	r3, [r6, #2764]
	cmp	r3, #1
	beq	.L425
.L359:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #1244]
	ldr	r3, [r6, #2708]
	cmp	r3, #1
	beq	.L426
	ldr	r3, [r6, #2712]
	cmp	r3, #1
	beq	.L427
	cmp	r0, #0
	beq	.L394
.L362:
	mov	r3, #1
	str	r3, [r4, #1248]
.L365:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #1252]
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #1256]
	ldr	r8, [r6, #2712]
	cmp	r8, #1
	movne	r3, #1
	strne	r3, [r4, #1260]
	beq	.L428
.L367:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #7
	str	r0, [r4, #1264]
	mov	r0, r5
	bl	BsGet
	ldrb	r8, [r4, #1017]	@ zero_extendqisi2
	mov	r8, r8, asl #3
	sub	r8, r8, #1
	cmp	r8, r0
	str	r0, [r4, #1268]
	bcc	.L429
.L368:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	mov	r8, r0
	str	r0, [r4, #1280]
	beq	.L430
.L370:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	mov	r8, r0
	str	r0, [r4, #1304]
	movne	r3, #0
	strne	r3, [r4, #1308]
	strne	r3, [r4, #1312]
	beq	.L431
.L376:
	mov	r8, #2
	strb	r8, [r4, #1073]
	ldr	r3, [r6, #2780]
	cmp	r3, #0
	streq	r3, [r4, #1300]
	streq	r3, [r4, #1296]
	bne	.L432
.L417:
	ldr	r3, [r6, #2904]
	cmp	r3, #1
	beq	.L433
	mov	r3, #0
	str	r3, [r4, #1324]
	str	r3, [r4, #1328]
	str	r3, [r4, #1332]
.L388:
	ldr	r3, [r4, #1328]
	cmp	r3, #0
	beq	.L434
.L387:
	mov	r1, r5
	mov	r0, r9
	bl	AVS2_ALF_ParameterSet
	subs	r5, r0, #0
	beq	.L435
.L389:
	ldr	r3, [r4, #1212]
	cmp	r3, #0
	bne	.L436
.L419:
	str	r3, [r4, #1204]
.L392:
	add	r0, r7, #14976
	mov	r5, #1
	mov	r3, #0
	add	r0, r0, #8
	strb	r3, [r4, #1072]
	str	r5, [r4, #1208]
	bl	AVS2_SetupWqMatrix84
	ldr	r3, [r7, #12]
	mov	r0, r5
	orr	r3, r3, #262144
	str	r3, [r7, #12]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L433:
	add	r6, r7, #17664
	mov	r8, r6
	add	r6, r6, #40
	add	r8, r8, #52
.L386:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	str	r0, [r6, #4]!
	cmp	r6, r8
	bne	.L386
	ldr	r3, [r4, #1324]
	cmp	r3, #0
	bne	.L387
	b	.L388
.L357:
	mov	r1, r5
	add	r0, r9, #980
	bl	AVS2_Head_GetRefConfigSet
	ldr	r3, [r6, #2764]
	cmp	r3, #1
	bne	.L359
.L425:
	mov	r0, r5
	bl	AVS2_ue_v.isra.2
	str	r0, [r4, #1240]
	b	.L359
.L436:
	ldr	r3, [r4, #1216]
	cmp	r3, #1
	moveq	r3, #5
	streq	r3, [r4, #1204]
	beq	.L392
	mov	r3, #6
	b	.L419
.L434:
	ldr	r3, [r4, #1332]
	cmp	r3, #0
	beq	.L389
	b	.L387
.L355:
	mov	r0, r5
	bl	AVS2_ue_v.isra.2
	cmp	r0, #63
	str	r0, [r4, #1228]
	bls	.L356
	mov	r2, r0
	ldr	r1, .L441+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #63
	str	r3, [r4, #1228]
	b	.L356
.L423:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #1
	str	r0, [r4, #1212]
	bne	.L350
	mov	r1, r0
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #1216]
	b	.L351
.L432:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #1296]
	streq	r0, [r4, #1300]
	beq	.L417
	mov	r1, r8
	mov	r0, r5
	bl	BsGet
	cmp	r0, #1
	str	r0, [r4, #1300]
	beq	.L437
	cmp	r0, #2
	bne	.L417
	mov	r2, r5
	add	r1, r9, #30
	add	r0, r9, #14
	bl	AVS2_WeightQuantMatrix
	b	.L417
.L431:
	mov	r0, r5
	bl	AVS2_se_v.isra.3
	add	r3, r0, #16
	str	r0, [r4, #1308]
	cmp	r3, #32
	bhi	.L438
.L375:
	mov	r0, r5
	bl	AVS2_se_v.isra.3
	add	r3, r0, #16
	str	r0, [r4, #1312]
	cmp	r3, #32
	bls	.L376
	mov	r2, r0
	ldr	r1, .L441+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #1312]
	b	.L376
.L430:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #1284]
	streq	r0, [r4, #1288]
	streq	r0, [r4, #1292]
	beq	.L370
	mov	r0, r5
	bl	AVS2_se_v.isra.3
	add	r3, r0, #8
	str	r0, [r4, #1288]
	cmp	r3, #16
	bhi	.L439
.L372:
	mov	r0, r5
	bl	AVS2_se_v.isra.3
	add	r3, r0, #8
	str	r0, [r4, #1292]
	cmp	r3, #16
	bls	.L370
	mov	r2, r0
	ldr	r1, .L441+12
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #1292]
	b	.L370
.L429:
	mov	r2, r0
	str	r8, [sp]
	mov	r3, r8
	ldr	r1, .L441+16
	mov	r0, #1
	bl	dprint_vfmw
	str	r8, [r4, #1268]
	b	.L368
.L427:
	cmp	r0, #0
	beq	.L394
.L361:
	ldr	r1, .L441+20
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #1244]
.L394:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #1248]
	b	.L365
.L426:
	str	r3, [r4, #1244]
	ldr	r3, [r6, #2712]
	cmp	r3, #1
	bne	.L362
	b	.L361
.L435:
	ldr	r2, .L441+24
	mov	r0, #1
	ldr	r1, .L441+28
	bl	dprint_vfmw
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L421:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #7
	str	r0, [r4, #1184]
	mov	r0, r5
	bl	BsGet
	ldr	r3, [r4, #1168]
	str	r0, [r4, #1172]
	orr	r0, r0, r3, asl #7
	str	r0, [r4, #1168]
	b	.L346
.L428:
	mov	r1, r8
	mov	r0, r5
	bl	BsGet
	mov	r1, r8
	str	r0, [r4, #1260]
	mov	r0, r5
	bl	BsGet
	b	.L367
.L424:
	mov	r1, #3
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #1224]
	b	.L353
.L422:
	mov	r1, #24
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #1180]
	b	.L347
.L438:
	mov	r2, r0
	ldr	r1, .L441+32
	mov	r0, #1
	bl	dprint_vfmw
	str	r8, [r4, #1308]
	b	.L375
.L439:
	mov	r2, r0
	ldr	r1, .L441+36
	mov	r0, #1
	bl	dprint_vfmw
	str	r8, [r4, #1288]
	b	.L372
.L437:
	mov	r1, r0
	mov	r0, r5
	bl	BsGet
	mov	r1, r8
	mov	r0, r5
	bl	BsGet
	mov	r1, r8
	str	r0, [r4, #1316]
	mov	r0, r5
	bl	BsGet
	ldr	r3, [r4, #1316]
	cmp	r3, #1
	str	r0, [r4, #1320]
	beq	.L440
.L380:
	cmp	r3, #2
	bne	.L417
	add	r8, r7, #17408
	mov	r10, r8
	add	r8, r8, #55
	add	r10, r10, #61
.L382:
	mov	r0, r5
	bl	AVS2_se_v.isra.3
	strb	r0, [r8, #1]!
	cmp	r8, r10
	bne	.L382
	b	.L417
.L440:
	add	r8, r7, #17408
	mov	r10, r8
	add	r8, r8, #49
	add	r10, r10, #55
.L381:
	mov	r0, r5
	bl	AVS2_se_v.isra.3
	strb	r0, [r8, #1]!
	cmp	r8, r10
	bne	.L381
	ldr	r3, [r4, #1316]
	b	.L380
.L442:
	.align	2
.L441:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC22
	.word	.LC28
	.word	.LC26
	.word	.LC24
	.word	.LC23
	.word	.LANCHOR0+464
	.word	.LC29
	.word	.LC27
	.word	.LC25
	UNWIND(.fnend)
	.size	AVS2_IntraPictureHeader, .-AVS2_IntraPictureHeader
	.align	2
	.global	AVS2_InterPictureHeader
	.type	AVS2_InterPictureHeader, %function
AVS2_InterPictureHeader:
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
	ldr	r3, [r0, #12]
	add	r5, r0, #44
	add	r4, r0, #16384
	bic	r3, r3, #262144
	str	r3, [r0, #12]
	add	r6, r0, #12288
	mov	r7, r0
	bl	AVS2_Vfmw_EpbRemove
	mov	r1, #32
	mov	r0, r5
	bl	BsGet
	mov	r0, r5
	mov	r1, #32
	bl	BsGet
	str	r0, [r4, #1168]
	ldr	r3, [r6, #2700]
	cmp	r3, #72
	beq	.L516
.L444:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #1188]
	beq	.L517
	ldr	r3, [r6, #2788]
	cmp	r0, #1
	cmpeq	r3, #0
	movne	r0, #0
	moveq	r0, #1
	strne	r0, [r4, #1192]
	beq	.L518
.L448:
	cmp	r3, #0
	mov	r3, #0
	str	r3, [r4, #1196]
	beq	.L519
.L449:
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #1220]
	ldr	r3, [r6, #2768]
	cmp	r3, #1
	movne	r3, #0
	strne	r3, [r4, #1224]
	beq	.L520
.L451:
	ldr	r3, [r6, #2764]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r4, #1228]
	beq	.L521
.L453:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #1232]
	bne	.L522
	add	r9, r7, #17408
	mov	r1, r5
	add	r9, r9, #48
	add	r0, r9, #980
	bl	AVS2_Head_GetRefConfigSet
	ldr	r3, [r6, #2764]
	cmp	r3, #1
	beq	.L523
.L456:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	subs	r3, r0, #1
	str	r0, [r4, #1244]
	ldr	r2, [r6, #2708]
	movne	r3, #1
	cmp	r2, #1
	movne	r3, #0
	cmp	r3, #0
	beq	.L457
	ldr	r1, .L537
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #1
	str	r3, [r4, #1244]
	ldr	r3, [r6, #2712]
	cmp	r3, #1
	beq	.L461
.L458:
	mov	r3, #1
	str	r3, [r4, #1248]
.L462:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #1252]
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #1256]
	ldr	r8, [r6, #2712]
	cmp	r8, #1
	beq	.L524
.L463:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #7
	str	r0, [r4, #1264]
	mov	r0, r5
	bl	BsGet
	ldrb	r8, [r4, #1017]	@ zero_extendqisi2
	mov	r8, r8, asl #3
	sub	r8, r8, #1
	cmp	r8, r0
	str	r0, [r4, #1268]
	bcc	.L525
.L464:
	ldr	r3, [r4, #1188]
	cmp	r3, #2
	bne	.L465
	ldr	r3, [r4, #1248]
	cmp	r3, #1
	beq	.L466
.L465:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #1276]
.L466:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #1200]
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	mov	r8, r0
	str	r0, [r4, #1280]
	beq	.L526
.L468:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	mov	r8, r0
	str	r0, [r4, #1304]
	movne	r3, #0
	strne	r3, [r4, #1308]
	strne	r3, [r4, #1312]
	beq	.L527
.L474:
	mov	r8, #2
	strb	r8, [r4, #1073]
	ldr	r3, [r6, #2780]
	cmp	r3, #0
	streq	r3, [r4, #1296]
	bne	.L528
.L496:
	ldr	r3, [r6, #2904]
	cmp	r3, #1
	beq	.L529
	mov	r3, #0
	str	r3, [r4, #1324]
	str	r3, [r4, #1328]
	str	r3, [r4, #1332]
.L486:
	ldr	r3, [r4, #1328]
	cmp	r3, #0
	bne	.L485
	ldr	r3, [r4, #1332]
	cmp	r3, #0
	bne	.L485
.L487:
	ldr	r2, [r4, #1188]
	cmp	r2, #1
	beq	.L530
	cmp	r2, #2
	beq	.L493
	cmp	r2, #3
	bne	.L498
.L493:
	ldrb	r3, [r4, #2056]	@ zero_extendqisi2
	str	r2, [r4, #1204]
	strb	r3, [r4, #1072]
	sub	r3, r3, #1
	cmp	r3, #6
	bhi	.L531
.L494:
	add	r0, r7, #14976
	mov	r3, #0
	add	r0, r0, #8
	str	r3, [r4, #1208]
	bl	AVS2_SetupWqMatrix84
	ldr	r3, [r7, #12]
	mov	r5, #1
	orr	r3, r3, #262144
	mov	r0, r5
	str	r3, [r7, #12]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L522:
	mov	r1, #5
	mov	r0, r5
	bl	BsGet
	ldr	r3, .L537+4
	add	r9, r7, #17408
	mov	r2, #68
	add	r9, r9, #48
	ldr	r3, [r3, #52]
	mov	r1, r0, asl #6
	str	r0, [r4, #1236]
	add	r1, r1, r0, lsl #2
	add	r0, r9, #980
	add	r1, r7, r1
	add	r1, r1, #15168
	add	r1, r1, #36
	blx	r3
	ldr	r3, [r6, #2764]
	cmp	r3, #1
	bne	.L456
.L523:
	mov	r0, r5
	bl	AVS2_ue_v.isra.2
	str	r0, [r4, #1240]
	b	.L456
.L519:
	ldr	r3, [r4, #1188]
	cmp	r3, #2
	beq	.L449
	ldr	r3, [r4, #1192]
	cmp	r3, #0
	bne	.L449
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #1196]
	b	.L449
.L529:
	add	r6, r7, #17664
	mov	r8, r6
	add	r6, r6, #40
	add	r8, r8, #52
.L484:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	str	r0, [r6, #4]!
	cmp	r6, r8
	bne	.L484
	ldr	r3, [r4, #1324]
	cmp	r3, #0
	beq	.L486
.L485:
	mov	r1, r5
	mov	r0, r9
	bl	AVS2_ALF_ParameterSet
	subs	r5, r0, #0
	bne	.L487
	ldr	r2, .L537+8
	mov	r0, #1
	ldr	r1, .L537+12
	bl	dprint_vfmw
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L530:
	ldr	r3, [r4, #1192]
	cmp	r3, #0
	streq	r2, [r4, #1204]
	strneb	r2, [r4, #1072]
	ldreq	r3, [r4, #2056]
	movne	r3, #4
	strne	r3, [r4, #1204]
	streqb	r3, [r4, #1072]
.L498:
	ldrb	r3, [r4, #1072]	@ zero_extendqisi2
	sub	r3, r3, #1
	cmp	r3, #6
	bls	.L494
.L531:
	mov	r3, #7
	ldr	r2, .L537+8
	ldr	r1, .L537+16
	mov	r0, #1
	bl	dprint_vfmw
	mov	r5, #0
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L457:
	ldr	r3, [r6, #2712]
	cmp	r3, #1
	beq	.L532
	cmp	r0, #0
	bne	.L458
.L495:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #1248]
	b	.L462
.L528:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #1296]
	streq	r0, [r4, #1300]
	beq	.L496
	mov	r1, r8
	mov	r0, r5
	bl	BsGet
	cmp	r0, #1
	str	r0, [r4, #1300]
	beq	.L533
	cmp	r0, #2
	bne	.L496
	mov	r2, r5
	add	r1, r9, #30
	add	r0, r9, #14
	bl	AVS2_WeightQuantMatrix
	b	.L496
.L527:
	mov	r0, r5
	bl	AVS2_se_v.isra.3
	add	r3, r0, #16
	str	r0, [r4, #1308]
	cmp	r3, #32
	bhi	.L534
.L473:
	mov	r0, r5
	bl	AVS2_se_v.isra.3
	add	r3, r0, #16
	str	r0, [r4, #1312]
	cmp	r3, #32
	bls	.L474
	mov	r2, r0
	ldr	r1, .L537+20
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #1312]
	b	.L474
.L521:
	mov	r0, r5
	bl	AVS2_ue_v.isra.2
	cmp	r0, #63
	str	r0, [r4, #1228]
	bls	.L453
	mov	r2, r0
	ldr	r1, .L537+24
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #63
	str	r3, [r4, #1228]
	b	.L453
.L526:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #1284]
	streq	r0, [r4, #1288]
	streq	r0, [r4, #1292]
	beq	.L468
	mov	r0, r5
	bl	AVS2_se_v.isra.3
	add	r3, r0, #8
	str	r0, [r4, #1288]
	cmp	r3, #16
	bhi	.L535
.L470:
	mov	r0, r5
	bl	AVS2_se_v.isra.3
	add	r3, r0, #8
	str	r0, [r4, #1292]
	cmp	r3, #16
	bls	.L468
	mov	r2, r0
	ldr	r1, .L537+28
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #1292]
	b	.L468
.L525:
	mov	r2, r0
	str	r8, [sp]
	mov	r3, r8
	ldr	r1, .L537+32
	mov	r0, #1
	bl	dprint_vfmw
	str	r8, [r4, #1268]
	b	.L464
.L532:
	cmp	r0, #0
	beq	.L495
.L461:
	ldr	r1, .L537+36
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #1244]
	b	.L495
.L517:
	mov	r2, r0
	ldr	r1, .L537+40
	mov	r0, #1
	mov	r5, r2
	bl	dprint_vfmw
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L534:
	mov	r2, r0
	ldr	r1, .L537+44
	mov	r0, #1
	bl	dprint_vfmw
	str	r8, [r4, #1308]
	b	.L473
.L516:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #7
	str	r0, [r4, #1184]
	mov	r0, r5
	bl	BsGet
	ldr	r3, [r4, #1168]
	str	r0, [r4, #1172]
	orr	r0, r0, r3, asl #7
	str	r0, [r4, #1168]
	b	.L444
.L524:
	mov	r1, r8
	mov	r0, r5
	bl	BsGet
	mov	r1, r8
	str	r0, [r4, #1260]
	mov	r0, r5
	bl	BsGet
	b	.L463
.L520:
	mov	r1, #3
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #1224]
	b	.L451
.L518:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #1192]
	ldr	r3, [r6, #2788]
	b	.L448
.L535:
	mov	r2, r0
	ldr	r1, .L537+48
	mov	r0, #1
	bl	dprint_vfmw
	str	r8, [r4, #1288]
	b	.L470
.L533:
	mov	r1, r0
	mov	r0, r5
	bl	BsGet
	mov	r1, r8
	mov	r0, r5
	bl	BsGet
	mov	r1, r8
	str	r0, [r4, #1316]
	mov	r0, r5
	bl	BsGet
	ldr	r3, [r4, #1316]
	cmp	r3, #1
	str	r0, [r4, #1320]
	beq	.L536
.L478:
	cmp	r3, #2
	bne	.L496
	add	r8, r7, #17408
	mov	r10, r8
	add	r8, r8, #55
	add	r10, r10, #61
.L480:
	mov	r0, r5
	bl	AVS2_se_v.isra.3
	strb	r0, [r8, #1]!
	cmp	r8, r10
	bne	.L480
	b	.L496
.L536:
	add	r8, r7, #17408
	mov	r10, r8
	add	r8, r8, #49
	add	r10, r10, #55
.L479:
	mov	r0, r5
	bl	AVS2_se_v.isra.3
	strb	r0, [r8, #1]!
	cmp	r8, r10
	bne	.L479
	ldr	r3, [r4, #1316]
	b	.L478
.L538:
	.align	2
.L537:
	.word	.LC32
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+488
	.word	.LC29
	.word	.LC39
	.word	.LC38
	.word	.LC31
	.word	.LC36
	.word	.LC34
	.word	.LC33
	.word	.LC30
	.word	.LC37
	.word	.LC35
	UNWIND(.fnend)
	.size	AVS2_InterPictureHeader, .-AVS2_InterPictureHeader
	.align	2
	.global	AVS2_SequenceHeader
	.type	AVS2_SequenceHeader, %function
AVS2_SequenceHeader:
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
	ldr	r1, .L592
	mov	r7, r0
	mov	r0, #7
	add	r6, r7, #44
	bl	dprint_vfmw
	ldr	r3, [r7, #12]
	mov	r1, #32
	mov	r0, r6
	bic	r3, r3, #65536
	str	r3, [r7, #12]
	bl	BsGet
	mov	r0, r6
	mov	r1, #8
	add	r5, r7, #12288
	bl	BsGet
	bic	r3, r0, #2
	str	r0, [r5, #2700]
	cmp	r3, #32
	cmpne	r0, #18
	movne	r8, #1
	moveq	r8, #0
	bne	.L580
	mov	r1, #8
	mov	r0, r6
	bl	BsGet
	cmp	r0, #0
	mov	r4, r0
	str	r0, [r5, #2704]
	beq	.L581
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2708]
	mov	r0, r6
	bl	BsGet
	ldr	r3, [r5, #2708]
	cmp	r0, #1
	cmpeq	r3, #1
	str	r0, [r5, #2712]
	beq	.L582
.L543:
	mov	r1, #14
	mov	r0, r6
	bl	BsGet
	cmp	r0, #0
	mov	r4, r0
	str	r0, [r5, #2716]
	beq	.L583
	mov	r1, #14
	mov	r0, r6
	bl	BsGet
	cmp	r0, #0
	mov	r4, r0
	str	r0, [r5, #2724]
	beq	.L584
	ldr	r1, [r5, #2716]
	add	r2, r0, #7
	str	r0, [r5, #2728]
	bic	r2, r2, #7
	add	r3, r1, #7
	str	r2, [r5, #2724]
	str	r1, [r5, #2720]
	bic	r3, r3, #7
	mov	r1, #2
	str	r3, [r5, #2716]
	mov	r0, r6
	bl	BsGet
	cmp	r0, #1
	mov	r4, r0
	str	r0, [r5, #2732]
	beq	.L546
	mov	r2, r0
	ldr	r1, .L592+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L581:
	mov	r2, r0
	ldr	r1, .L592+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L580:
	mov	r2, r0
	ldr	r1, .L592+12
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L584:
	mov	r2, r0
	ldr	r1, .L592+16
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L583:
	mov	r2, r0
	ldr	r1, .L592+20
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L546:
	mov	r1, #3
	mov	r0, r6
	bl	BsGet
	add	r0, r0, #3
	mov	r2, r0, asl #1
	str	r2, [r5, #2736]
	bic	r3, r2, #2
	cmp	r3, #8
	bne	.L585
	ldr	r2, [r5, #2700]
	cmp	r2, #34
	beq	.L586
	add	r9, r7, #16384
	mov	r2, r3
	mov	r1, #0
	str	r1, [r5, #2740]
	strb	r3, [r9, #1017]
.L551:
	ldr	r3, [r7, #36]
	mov	r1, #4
	mov	r0, r6
	str	r2, [r3, #964]
	bl	BsGet
	cmp	r0, #0
	str	r0, [r5, #2744]
	beq	.L587
.L552:
	mov	r1, #4
	mov	r0, r6
	bl	BsGet
	cmp	r0, #0
	str	r0, [r5, #2748]
	beq	.L588
.L553:
	cmp	r0, #15
	mov	r1, #18
	ldrls	r3, .L592+24
	mvnhi	r3, #0
	addls	r0, r3, r0, lsl #2
	ldrls	r3, [r0, #512]
	mov	r0, r6
	str	r3, [r9, #1020]
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2752]
	mov	r0, r6
	bl	BsGet
	mov	r1, #12
	str	r0, [r5, #2756]
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2760]
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2764]
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2756]
	mov	r0, r6
	bl	BsGet
	mov	r1, #18
	str	r0, [r5, #2768]
	mov	r0, r6
	bl	BsGet
	mov	r1, #3
	str	r0, [r5, #2772]
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2776]
	mov	r0, r6
	bl	BsGet
	cmp	r0, #1
	str	r0, [r5, #2780]
	beq	.L589
.L557:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2788]
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2792]
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2796]
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2800]
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2884]
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2888]
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2892]
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2896]
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2900]
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2904]
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #2908]
	mov	r0, r6
	bl	BsGet
	mov	r1, #6
	str	r0, [r5, #2756]
	mov	r0, r6
	bl	BsGet
	cmp	r0, #32
	str	r0, [r5, #2912]
	bhi	.L559
	cmp	r0, #0
	addne	r4, r7, #15168
	movne	r8, #0
	addne	r4, r4, #36
	beq	.L564
.L563:
	mov	r0, r4
	mov	r1, r6
	bl	AVS2_Head_GetRefConfigSet
	ldr	r3, [r5, #2912]
	add	r8, r8, #1
	add	r4, r4, #68
	cmp	r3, r8
	bhi	.L563
.L564:
	ldr	r3, [r5, #2764]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r9, #996]
	beq	.L590
.L565:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	mov	r3, #1
	add	r1, r5, #2688
	movw	lr, #2408
	add	r1, r1, #12
	movw	ip, #2410
	str	r0, [r9, #1000]
	add	r0, r7, #14976
	ldr	r4, [r5, #2776]
	add	r0, r0, #12
	ldr	r2, [r5, #2716]
	mov	r3, r3, asl r4
	sub	r2, r2, #1
	uxth	r3, r3
	add	r2, r3, r2
	uxth	r2, r2
	mov	r2, r2, asr r4
	strh	r2, [r1, lr]	@ movhi
	ldr	r2, [r5, #2724]
	sub	r2, r2, #1
	add	r3, r3, r2
	uxth	r3, r3
	mov	r3, r3, asr r4
	strh	r3, [r1, ip]	@ movhi
	bl	AVS2_DeriveMaxDpbNum
	add	r3, r7, #8192
	ldr	r2, [r3, #3020]
	cmp	r2, #0
	beq	.L566
	ldr	r3, [r3, #3028]
	cmp	r3, #0
	beq	.L566
	ldr	r1, [r5, #2716]
	cmp	r2, r1
	beq	.L591
.L569:
	mov	r3, #1
	str	r3, [r7, #20]
.L568:
	ldr	r3, [r7, #12]
	mov	r0, #1
	orr	r3, r3, #65536
	str	r3, [r7, #12]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L585:
	mov	r0, r4
	ldr	r1, .L592+28
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L566:
	mov	r3, #0
	str	r3, [r7, #20]
	b	.L568
.L582:
	ldr	r1, .L592+32
	mov	r0, #1
	bl	dprint_vfmw
	str	r8, [r5, #2712]
	b	.L543
.L588:
	ldr	r1, .L592+36
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r0, [r5, #2748]
	b	.L553
.L587:
	ldr	r1, .L592+40
	mov	r0, #1
	bl	dprint_vfmw
	b	.L552
.L590:
	mov	r1, #5
	mov	r0, r6
	bl	BsGet
	str	r0, [r9, #996]
	b	.L565
.L559:
	mov	r2, r0
	mov	r3, #32
	ldr	r1, .L592+44
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L586:
	mov	r1, #3
	mov	r0, r6
	bl	BsGet
	add	r9, r7, #16384
	add	r2, r0, #3
	str	r0, [r5, #2740]
	mov	r2, r2, asl #1
	uxtb	r2, r2
	strb	r2, [r9, #1017]
	and	r3, r2, #252
	cmp	r3, #8
	ldr	r3, [r5, #2736]
	bne	.L550
	cmp	r2, r3
	bcs	.L551
.L550:
	ldr	r1, .L592+48
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L589:
	mov	r1, r0
	mov	r0, r6
	bl	BsGet
	cmp	r0, #1
	str	r0, [r5, #2784]
	bne	.L557
	add	r0, r7, #14976
	mov	r2, r6
	add	r1, r0, #132
	add	r0, r0, #116
	bl	AVS2_WeightQuantMatrix
	b	.L557
.L591:
	ldr	r2, [r5, #2724]
	cmp	r3, r2
	bne	.L569
	b	.L568
.L593:
	.align	2
.L592:
	.word	.LC40
	.word	.LC46
	.word	.LC42
	.word	.LC41
	.word	.LC45
	.word	.LC44
	.word	.LANCHOR0
	.word	.LC47
	.word	.LC43
	.word	.LC50
	.word	.LC49
	.word	.LC51
	.word	.LC48
	UNWIND(.fnend)
	.size	AVS2_SequenceHeader, .-AVS2_SequenceHeader
	.align	2
	.global	AVS2_AllocateVHB
	.type	AVS2_AllocateVHB, %function
AVS2_AllocateVHB:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
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
	add	r5, r0, #12288
	mov	r4, r0
	mov	r3, #0
	ldr	r0, [r5, #2708]
	str	r3, [fp, #-56]
	ldr	r1, [r5, #2716]
	cmp	r0, #1
	str	r3, [fp, #-52]
	movw	r0, #510
	str	r3, [fp, #-48]
	add	r2, r1, #15
	str	r3, [fp, #-44]
	str	r3, [fp, #-40]
	mov	r2, r2, lsr #4
	ldr	r3, [r5, #2724]
	sub	ip, r2, #2
	addne	r3, r3, #31
	addeq	r3, r3, #15
	movne	r3, r3, lsr #5
	moveq	r3, r3, lsr #4
	movne	r3, r3, asl #1
	cmp	ip, r0
	bhi	.L597
	sub	ip, r3, #2
	cmp	ip, r0
	bhi	.L597
	ldr	r2, [r4, #36]
	ldr	r6, [r2, #732]
	ldr	r3, [r2, #28]
	cmp	r6, #0
	bne	.L600
	cmp	r3, #25
	beq	.L624
.L601:
	add	r3, r4, #16384
	mov	r8, #0
	ldrb	r7, [r3, #1016]	@ zero_extendqisi2
	add	r7, r7, #1
	mov	r6, r7
.L606:
	ldr	r3, .L627
	mov	r2, #20
	mov	r1, #0
	sub	r0, fp, #56
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r4, #36]
	ldr	r0, [r5, #2716]
	ldr	r1, [r5, #2724]
	ldr	ip, [r3, #28]
	add	r2, r0, #15
	add	r3, r1, #15
	bic	r2, r2, #15
	cmp	ip, #24
	bic	r3, r3, #15
	str	r0, [fp, #-44]
	str	r1, [fp, #-40]
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	beq	.L612
	uxtb	r6, r6
	strb	r7, [fp, #-55]
	strb	r8, [fp, #-54]
.L617:
	sub	r1, fp, #56
	ldr	r0, [r4, #4]
	strb	r6, [fp, #-53]
	bl	FSP_ConfigInstance
	subs	r6, r0, #0
	bne	.L613
	ldr	r1, [r4, #36]
	sub	r3, fp, #36
	ldr	r0, [r4, #4]
	str	r6, [r3, #-24]!
	ldr	r2, [r1, #20]
	ldr	r1, [r1, #16]
	bl	FSP_ConfigFrameBuf
	cmp	r0, #2
	beq	.L625
	cmp	r0, #0
	moveq	r6, #1
	streq	r6, [r4, #24]
	beq	.L621
	ldr	r1, .L627+4
	mov	r0, r6
	bl	dprint_vfmw
	b	.L621
.L597:
	ldr	r1, .L627+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r6, #0
.L621:
	mov	r0, r6
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L600:
	cmp	r3, #25
	bne	.L601
	ldr	r0, [r2, #692]
	ldr	r3, [r5, #2724]
	cmp	r1, r0
	ldr	ip, [r2, #696]
	bhi	.L609
	cmp	r3, ip
	bhi	.L609
	ldr	r3, [r2, #720]
	ldr	r6, [r2, #716]
	cmp	r3, #0
	add	r7, r6, #2
	bne	.L626
.L619:
	mov	r6, #1
	b	.L611
.L613:
	ldr	r1, .L627+12
	mov	r0, #0
	bl	dprint_vfmw
	mov	r6, #0
	mov	r0, r6
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L624:
	ldr	r0, [r2, #692]
	ldr	r3, [r5, #2724]
	cmp	r1, r0
	ldr	ip, [r2, #696]
	bhi	.L603
	cmp	r3, ip
	bhi	.L603
	ldr	r6, [r4, #24]
	cmp	r6, #1
	beq	.L621
	ldr	r1, [r2, #720]
	ldr	r3, [r2, #716]
	cmp	r1, #0
	add	r7, r3, #2
	beq	.L619
	add	r6, r3, #1
	cmp	r6, #17
	movge	r6, #17
.L611:
	ldrb	r8, [r2, #740]	@ zero_extendqisi2
	b	.L606
.L612:
	mov	r3, #0
	strb	r8, [fp, #-54]
	mov	r6, #1
	strb	r3, [fp, #-55]
	b	.L617
.L609:
	stmia	sp, {r0, ip}
	mov	r2, r1
	mov	r0, #0
	ldr	r1, .L627+16
	bl	dprint_vfmw
	mov	r6, #0
	b	.L621
.L626:
	add	r6, r6, #1
	cmp	r6, #17
	movge	r6, #17
	b	.L611
.L603:
	stmia	sp, {r0, ip}
	mov	r2, r1
	mov	r0, #0
	ldr	r1, .L627+20
	bl	dprint_vfmw
	b	.L621
.L625:
	add	r0, r4, #18688
	mov	r6, #3
	add	r0, r0, #88
	bl	ResetVoQueue
	b	.L621
.L628:
	.align	2
.L627:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC55
	.word	.LC52
	.word	.LC56
	.word	.LC54
	.word	.LC53
	UNWIND(.fnend)
	.size	AVS2_AllocateVHB, .-AVS2_AllocateVHB
	.align	2
	.global	AVS2_OutputOneFrame
	.type	AVS2_OutputOneFrame, %function
AVS2_OutputOneFrame:
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
	ldr	r6, [r1, #56]
	mov	r4, r0
	ldr	r0, [r0, #4]
	mov	r1, r6
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L635
	mov	r2, #1
	mov	r1, r6
	ldr	r0, [r4, #4]
	bl	FSP_SetDisplay
	add	r3, r4, #18688
	ldr	r0, [r4, #4]
	add	r3, r3, #88
	str	r5, [sp]
	mov	r2, r4
	mov	r1, #18
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L631
	ldr	r0, [r4, #4]
	mov	r2, #0
	mov	r1, r6
	bl	FSP_SetDisplay
	mov	r2, r6
	ldr	r1, .L636
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
.L631:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L635:
	movw	r2, #2654
	ldr	r1, .L636+4
	bl	dprint_vfmw
	mov	r0, r5
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L637:
	.align	2
.L636:
	.word	.LC58
	.word	.LC57
	UNWIND(.fnend)
	.size	AVS2_OutputOneFrame, .-AVS2_OutputOneFrame
	.align	2
	.type	AVS2_DisplayFrameInPOI, %function
AVS2_DisplayFrameInPOI:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
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
	add	r3, r0, #19200
	add	lr, r0, #10944
	mov	r7, #0
	add	r3, r3, #98
	add	lr, lr, #4
	mov	r5, r0
	mov	r2, r7
.L641:
	cmp	r1, #0
	bne	.L639
	ldrsh	ip, [r3]
	ldrsh	r0, [lr, #2]
	cmp	ip, r0
	bgt	.L640
.L639:
	ldrb	r0, [r3, #-6]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L640
	ldrb	r0, [r3, #-4]	@ zero_extendqisi2
	add	r4, r7, #1
	sub	ip, fp, #44
	cmp	r0, #0
	add	ip, ip, r7
	uxtbne	r7, r4
	strneb	r2, [ip, #-16]
.L640:
	add	r2, r2, #1
	add	r3, r3, #104
	cmp	r2, #16
	bne	.L641
	cmp	r7, #0
	beq	.L638
	mov	r3, #0
	sub	r1, fp, #60
	add	r2, r5, #19200
	add	r6, r1, r7
	str	r7, [fp, #-64]
	mov	r10, r3
	mov	r7, r3
	add	r2, r2, #92
	str	r2, [fp, #-84]
.L643:
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	ble	.L646
	sub	r2, fp, #60
	movw	lr, #32767
	mov	ip, #104
.L645:
	ldrb	r1, [r2], #1	@ zero_extendqisi2
	mla	r3, ip, r1, r5
	add	r3, r3, #19200
	add	r3, r3, #88
	ldrb	r0, [r3, #4]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L644
	ldrsh	r3, [r3, #2]
	cmp	r3, lr
	movle	r10, r1
	movle	lr, r3
.L644:
	cmp	r2, r6
	bne	.L645
	movw	r3, #32767
	cmp	lr, r3
	beq	.L646
	mov	r3, #104
	mov	r1, #1
	mul	r3, r3, r10
	add	r2, r5, r3
	add	r3, r3, #19200
	add	r3, r3, #88
	add	r2, r2, #19200
	add	r3, r5, r3
	str	r3, [fp, #-68]
	strb	r1, [r2, #92]
	ldr	r1, [r3, #56]
	ldr	r0, [r5, #4]
	bl	FSP_GetFsImagePtr
	subs	r3, r0, #0
	beq	.L674
	add	r3, r3, #592
	str	r3, [fp, #-80]
	mvn	r1, #0
	mvn	r0, #0
	ldrd	r2, [r3, #-8]
	cmp	r3, r1
	cmpeq	r2, r0
	beq	.L648
	ldr	r8, [fp, #-84]
	add	r9, r5, #20736
	add	r9, r9, #220
	mvn	r3, #0
	mvn	r2, #1
	strd	r2, [fp, #-76]
	mov	r3, r8
	mov	r4, #0
	mov	r8, r9
	mov	r9, r3
	b	.L651
.L650:
	add	r9, r9, #104
	cmp	r9, r8
	beq	.L675
.L651:
	ldrb	r1, [r9]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L650
	ldrb	r1, [r9, #2]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L650
	ldr	r1, [r9, #52]
	ldr	r0, [r5, #4]
	bl	FSP_GetFsImagePtr
	subs	lr, r0, #0
	add	r1, lr, #592
	beq	.L650
	ldrd	r0, [r1, #-8]
	ldrd	r2, [fp, #-76]
	cmp	r1, r3
	cmpeq	r0, r2
	movcc	ip, #1
	movcs	ip, #0
	orrs	r3, r0, r1
	andne	ip, ip, #1
	moveq	ip, #0
	cmp	ip, #0
	beq	.L650
	add	r9, r9, #104
	strd	r0, [fp, #-76]
	cmp	r9, r8
	mov	r4, lr
	bne	.L651
.L675:
	cmp	r4, #0
	beq	.L648
	ldr	r3, [fp, #-80]
	add	r4, r4, #592
	ldrd	r8, [r4, #-8]
	ldrd	r2, [r3, #-8]
	cmp	r9, r3
	cmpeq	r8, r2
	bcc	.L676
.L648:
	ldr	r1, [fp, #-68]
	mov	r0, r5
	bl	AVS2_OutputOneFrame
	mov	r3, #104
	mla	r3, r3, r10, r5
	ldr	r1, .L677
	mov	r0, #13
	add	r3, r3, #19200
	ldrsh	r2, [r3, #90]
	bl	dprint_vfmw
.L646:
	add	r7, r7, #1
	ldr	r2, [fp, #-64]
	uxtb	r3, r7
	cmp	r2, r3
	bhi	.L643
.L638:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L676:
	ldr	r0, [r5, #4]
	strd	r8, [sp]
	bl	IsPtsRewind
	cmp	r0, #0
	bne	.L648
	ldr	r1, [fp, #-80]
	ldrd	r2, [r1, #-8]
	strd	r2, [r4, #-8]
	ldrd	r2, [fp, #-76]
	strd	r2, [r1, #-8]
	b	.L648
.L674:
	ldr	r2, .L677+4
	ldr	r1, .L677+8
	bl	dprint_vfmw
	b	.L648
.L678:
	.align	2
.L677:
	.word	.LC60
	.word	.LANCHOR0+576
	.word	.LC59
	UNWIND(.fnend)
	.size	AVS2_DisplayFrameInPOI, .-AVS2_DisplayFrameInPOI
	.align	2
	.global	AVS2_UpdateSceneBuf
	.type	AVS2_UpdateSceneBuf, %function
AVS2_UpdateSceneBuf:
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
	add	r3, r0, #12288
	ldr	r3, [r3, #1508]
	sub	r3, r3, #5
	cmp	r3, #1
	ldmhifd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVS2_UpdateSceneBuf.part.8
	UNWIND(.fnend)
	.size	AVS2_UpdateSceneBuf, .-AVS2_UpdateSceneBuf
	.align	2
	.global	AVS2_UpdateRefBuf
	.type	AVS2_UpdateRefBuf, %function
AVS2_UpdateRefBuf:
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
	add	r8, r0, #12288
	mov	r10, r0
	ldr	r1, .L695
	mov	r0, #13
	ldr	r2, [r8, #2392]
	bl	dprint_vfmw
	ldr	r3, [r8, #2392]
	cmp	r3, #0
	ldmeqfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	add	r6, r10, #14656
	add	r7, r10, #19200
	add	r6, r6, #24
	add	r7, r7, #88
	add	r9, r10, #8192
	mov	r5, #0
.L687:
	add	r3, r9, #2752
	ldr	r4, [r6, #4]!
	add	r3, r3, #4
	ldr	r1, .L695+4
	mov	r2, r5
	mov	r0, #13
	ldrh	r3, [r3, #2]
	rsb	r4, r4, r3
	sxth	r4, r4
	mov	r3, r4
	bl	dprint_vfmw
	mov	r3, r7
	mov	r1, #0
	b	.L686
.L683:
	add	r1, r1, #1
	add	r3, r3, #104
	cmp	r1, #16
	beq	.L685
.L686:
	ldrsh	r2, [r3]
	cmp	r2, r4
	bne	.L683
	ldrb	r2, [r3, #6]	@ zero_extendqisi2
	and	r0, r2, #2
	cmp	r2, #0
	uxtb	r0, r0
	beq	.L683
	ldrb	r2, [r3, #7]	@ zero_extendqisi2
	sub	r2, r2, #5
	cmp	r2, #1
	bhi	.L684
	cmp	r0, #0
	strb	r0, [r3, #6]
	bne	.L683
	mov	r3, #104
	mov	r2, r0
	mla	r3, r3, r1, r10
.L694:
	add	r1, r3, #19200
	strb	r0, [r1, #93]
	ldr	r1, [r1, #144]
	ldr	r0, [r10, #4]
	bl	FSP_SetRef
.L685:
	ldr	r3, [r8, #2392]
	add	r5, r5, #1
	cmp	r5, r3
	bcc	.L687
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L684:
	mov	r3, #104
	mov	r0, #0
	mla	r3, r3, r1, r10
	mov	r2, r0
	b	.L694
.L696:
	.align	2
.L695:
	.word	.LC61
	.word	.LC62
	UNWIND(.fnend)
	.size	AVS2_UpdateRefBuf, .-AVS2_UpdateRefBuf
	.align	2
	.global	AVS2_RefreshBuf
	.type	AVS2_RefreshBuf, %function
AVS2_RefreshBuf:
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
	add	r5, r0, #19200
	mov	r6, r0
	add	r5, r5, #144
	mov	r4, #0
	mov	r7, #104
	b	.L701
.L699:
	cmp	r4, #16
	add	r5, r5, #104
	beq	.L703
.L701:
	mla	r3, r7, r4, r6
	ldrb	r2, [r5, #-50]	@ zero_extendqisi2
	add	r4, r4, #1
	cmp	r2, #0
	add	r3, r3, #19200
	add	r3, r3, #88
	beq	.L699
	ldrh	r3, [r3, #4]
	cmp	r3, #1
	bne	.L699
	and	r2, r2, #2
	uxtb	r2, r2
	strb	r2, [r5, #-50]
	cmp	r2, #0
	bne	.L699
	ldr	r1, [r5]
	add	r5, r5, #104
	ldr	r0, [r6, #4]
	bl	FSP_SetRef
	cmp	r4, #16
	bne	.L701
.L703:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_RefreshBuf, .-AVS2_RefreshBuf
	.align	2
	.global	AVS2_SetPicInfo
	.type	AVS2_SetPicInfo, %function
AVS2_SetPicInfo:
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
	add	r4, r0, #12288
	add	r1, r0, #10944
	add	r6, r0, #8192
	movw	lr, #2756
	ldr	r3, [r4, #1524]
	uxth	r5, r3
	strh	r5, [r1, #6]	@ movhi
	ldr	r2, [r4, #1532]
	ldr	ip, [r4, #1300]
	add	r3, r2, r3
	rsb	r3, ip, r3
	strh	r3, [r1, #8]	@ movhi
	ldr	r3, [r0, #28]
	cmp	r3, #0
	ble	.L706
	ldrsh	r2, [r6, lr]
	sxth	r3, r5
	cmp	r2, r3
	ble	.L706
	add	r2, r0, #19200
	ldr	lr, [r6, #3016]
	add	r0, r0, #20736
	mov	r1, r2
	add	r0, r0, #216
	add	r2, r2, #88
	add	r1, r1, #90
.L708:
	ldrh	r3, [r1, #-2]
	cmp	lr, #0
	add	r1, r1, #104
	sub	r3, r3, #256
	strh	r3, [r1, #-106]	@ movhi
	ldrh	r3, [r2, #2]
	ldrh	ip, [r2, #10]
	sub	r3, r3, #256
	strh	r3, [r2, #2]	@ movhi
	sub	ip, ip, #256
	strh	ip, [r2, #10]	@ movhi
	sxth	r3, r3
	mov	r3, r3, asl #1
	strh	r3, [r2, #8]	@ movhi
	bne	.L707
	ldr	ip, [r4, #1564]
	add	r3, r3, #1
	cmp	ip, #0
	streqh	r3, [r2, #8]	@ movhi
.L707:
	add	r2, r2, #104
	cmp	r2, r0
	bne	.L708
.L706:
	movw	r3, #2756
	strh	r5, [r6, r3]	@ movhi
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_SetPicInfo, .-AVS2_SetPicInfo
	.align	2
	.global	AVS2_VarifyDecMode
	.type	AVS2_VarifyDecMode, %function
AVS2_VarifyDecMode:
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
	ldr	r3, [r0, #36]
	mov	r5, r0
	ldr	r4, [r3, #8]
	cmp	r4, #2
	beq	.L713
	cmp	r4, #3
	moveq	r6, #0
	beq	.L712
	cmp	r4, #1
	movne	r6, #1
	beq	.L729
.L712:
	str	r4, [r5, #32]
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L729:
	add	r6, r0, #12288
	ldr	r3, [r6, #1508]
	cmp	r3, #2
	beq	.L730
.L720:
	mov	r6, r4
.L716:
	ldr	r3, [r5, #32]
	cmp	r3, #1
	beq	.L712
	mov	r0, r5
	bl	AVS2_ClearDpb
	b	.L712
.L713:
	add	r3, r0, #12288
	ldr	r6, [r3, #1512]
	adds	r6, r6, #0
	movne	r6, #1
	b	.L712
.L730:
	ldr	r1, [r6, #2356]
	cmp	r1, #0
	bne	.L720
	bl	AVS2_DisplayFrameInPOI
	ldr	r3, [r6, #2392]
	cmp	r3, #0
	bne	.L731
.L717:
	mov	r0, r5
	mov	r6, #0
	bl	AVS2_RefreshBuf
	b	.L716
.L731:
	mov	r0, r5
	bl	AVS2_UpdateRefBuf
	b	.L717
	UNWIND(.fnend)
	.size	AVS2_VarifyDecMode, .-AVS2_VarifyDecMode
	.align	2
	.global	AVS2_VarifyFrame
	.type	AVS2_VarifyFrame, %function
AVS2_VarifyFrame:
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
	UNWIND(.pad #40)
	sub	sp, sp, #40
	add	r3, r0, #19200
	add	r3, r3, #94
	mov	r2, #0
	b	.L736
.L733:
	add	r2, r2, #1
	add	r3, r3, #104
	cmp	r2, #16
	beq	.L746
.L736:
	ldrb	ip, [r3]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L733
	ldr	r4, [r1, #56]
	ldr	lr, [r3, #50]
	cmp	r4, lr
	beq	.L734
	ldr	r5, [r1, #100]
	ldr	lr, [r3, #54]
	cmp	r5, lr
	beq	.L738
	ldr	r5, [r1, #80]
	ldr	lr, [r3, #74]
	cmp	r5, lr
	bne	.L733
	ldrb	lr, [r3, #-1]	@ zero_extendqisi2
	cmp	lr, #1
	beq	.L740
	tst	ip, #2
	beq	.L733
.L740:
	mov	lr, r4
	b	.L735
.L746:
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L738:
	mov	lr, r4
.L734:
	ldr	r5, [r1, #80]
.L735:
	mov	r3, #104
	movw	ip, #19368
	mla	r2, r3, r2, r0
	ldrsh	r3, [r1]
	movw	r6, #19344
	movw	r4, #19288
	add	r0, r2, #19200
	ldr	r7, [r2, ip]
	mov	ip, r0
	add	ip, ip, #88
	str	r7, [sp, #36]
	ldr	r7, [r0, #148]
	mov	r0, #1
	str	r7, [sp, #32]
	ldr	r6, [r2, r6]
	str	r6, [sp, #28]
	ldrsh	r6, [r2, r4]
	ldrb	r2, [r1, #7]	@ zero_extendqisi2
	ldr	r4, [r1, #60]
	str	r6, [sp, #24]
	ldrb	r6, [ip, #5]	@ zero_extendqisi2
	ldr	r1, .L747
	str	r6, [sp, #20]
	ldrb	r6, [ip, #6]	@ zero_extendqisi2
	str	r6, [sp, #16]
	ldrb	ip, [ip, #7]	@ zero_extendqisi2
	str	r5, [sp, #8]
	str	lr, [sp]
	str	ip, [sp, #12]
	str	r4, [sp, #4]
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L748:
	.align	2
.L747:
	.word	.LC63
	UNWIND(.fnend)
	.size	AVS2_VarifyFrame, .-AVS2_VarifyFrame
	.align	2
	.global	AVS2_ReleaseFrameBuf
	.type	AVS2_ReleaseFrameBuf, %function
AVS2_ReleaseFrameBuf:
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
	add	r4, r0, #8192
	ldr	r3, [r4, #2928]
	cmp	r3, #0
	beq	.L750
	ldr	r1, [r3, #56]
	mov	r2, #0
	ldr	r0, [r0, #4]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #2928]
	mov	r2, #0
	strb	r2, [r3, #6]
.L750:
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_ReleaseFrameBuf, .-AVS2_ReleaseFrameBuf
	.align	2
	.global	AVS2_SetupFrameBuf
	.type	AVS2_SetupFrameBuf, %function
AVS2_SetupFrameBuf:
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
	add	r7, r0, #12288
	mov	r6, r0
	ldr	r3, [r7, #1508]
	cmp	r3, #6
	beq	.L755
.L759:
	add	r3, r6, #16384
	ldrb	r3, [r3, #2910]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r2, r6, #19200
	movne	r3, #1
	addne	r2, r2, #198
	beq	.L756
.L764:
	ldrb	r1, [r2]	@ zero_extendqisi2
	add	r2, r2, #104
	cmp	r1, #0
	beq	.L756
	add	r3, r3, #1
	cmp	r3, #16
	bne	.L764
.L763:
	ldr	r2, .L793
	mov	r0, #1
	ldr	r1, .L793+4
	mov	r5, #0
	bl	dprint_vfmw
.L765:
	mov	r0, r5
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L755:
	add	r3, r0, #19200
	add	r0, r0, #10944
	add	r3, r3, #94
	add	r0, r0, #4
	add	lr, r6, #8192
	mov	r2, #0
	b	.L761
.L758:
	add	r2, r2, #1
	add	r3, r3, #104
	cmp	r2, #16
	beq	.L759
.L761:
	ldrb	r1, [r3]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L758
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	cmp	r1, #6
	bne	.L758
	ldrsh	ip, [r3, #-6]
	mov	r8, lr
	ldrsh	r1, [r0, #2]
	cmp	ip, r1
	bne	.L758
	mov	r3, #104
	movw	r1, #19344
	mul	r2, r3, r2
	add	r4, r2, #19200
	add	r2, r6, r2
	add	r4, r4, #88
	add	r4, r6, r4
	str	r4, [lr, #2928]
	cmp	r4, #0
	ldr	r9, [r2, r1]
	bne	.L760
	b	.L759
.L756:
	mov	r4, #104
	add	r8, r6, #8192
	mla	r3, r4, r3, r6
	mov	r1, #1
	add	r4, r3, #19200
	add	r4, r4, #88
	str	r4, [r8, #2928]
	ldr	r0, [r6, #4]
	bl	FSP_NewLogicFs
	cmp	r4, #0
	mov	r9, r0
	beq	.L763
.L760:
	mov	r1, r9
	ldr	r0, [r6, #4]
	bl	FSP_GetLogicFs
	mvn	r5, r9
	mov	r5, r5, lsr #31
	cmp	r0, #0
	moveq	r5, #0
	cmp	r5, #0
	beq	.L766
	add	r2, r6, #11136
	add	r1, r6, #13568
	add	r2, r2, #56
	add	r1, r1, #48
	bl	AVS2_ConvertHDRInfo
	mov	r1, r9
	ldr	r0, [r6, #4]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L791
	str	r9, [r4, #56]
	mov	r1, r9
	ldr	r3, [r5, #112]
	add	r9, r5, #608
	str	r3, [r4, #88]
	ldr	r3, [r5, #116]
	str	r3, [r4, #92]
	ldr	r3, [r5, #140]
	str	r3, [r4, #96]
	ldr	r2, [r5, #36]
	ldr	r3, [r5, #40]
	rsb	r3, r2, r3
	str	r3, [r4, #84]
	ldr	r3, [r5, #36]
	str	r3, [r4, #60]
	ldr	r3, [r5, #40]
	str	r3, [r4, #64]
	ldr	r0, [r6, #4]
	bl	FSP_GetPmvAddr
	add	ip, r5, #592
	add	r1, r8, #2752
	mov	lr, #0
	add	r1, r1, #4
	str	r0, [r4, #80]
	ldr	r0, [r5, #212]
	str	r0, [r4, #100]
	ldr	r0, [r5, #144]
	str	r0, [r4, #68]
	ldr	r10, [r5, #36]
	ldr	r0, [r5, #44]
	rsb	r0, r10, r0
	str	r0, [r4, #72]
	ldr	r0, [r5, #48]
	ldr	r10, [r5, #44]
	rsb	r0, r10, r0
	str	r0, [r4, #76]
	ldr	r0, [r6, #28]
	str	r0, [r5, #176]
	ldrb	r0, [r7, #1321]	@ zero_extendqisi2
	str	r0, [r5, #168]
	ldrb	r0, [r7, #1321]	@ zero_extendqisi2
	str	r0, [r5, #172]
	ldr	r0, [r6, #36]
	ldrd	r2, [r0, #64]
	strd	r2, [ip, #-8]
	ldr	r0, [r6, #36]
	ldrd	r2, [r0, #80]
	strd	r2, [ip]
	ldr	r0, [r6, #36]
	ldrd	r2, [r0, #96]
	strd	r2, [r9, #-8]
	mvn	r2, #0
	ldr	r0, [r6, #36]
	mvn	r3, #0
	ldr	r0, [r0, #112]
	str	r0, [r5]
	ldr	r0, [r6, #36]
	ldr	r0, [r0, #116]
	str	r0, [r5, #4]
	ldr	r0, [r6, #36]
	ldr	r0, [r0, #120]
	str	r0, [r5, #8]
	ldr	r0, [r6, #36]
	ldr	r0, [r0, #136]
	str	r0, [r5, #12]
	ldr	r0, [r7, #1552]
	clz	r0, r0
	mov	r0, r0, lsr #5
	str	r0, [r5, #52]
	ldr	r0, [r6, #36]
	strd	r2, [r0, #64]
	ldrh	r3, [r1, #2]
	strh	r3, [r4]	@ movhi
	ldrh	r3, [r1, #4]
	strh	r3, [r4, #2]	@ movhi
	mov	r2, r3, asl #1
	ldr	r3, [r7, #1508]
	strb	r3, [r4, #7]
	ldr	r3, [r7, #2356]
	strb	lr, [r4, #4]
	strb	r3, [r4, #5]
	ldrh	r1, [r1, #2]
	ldr	r3, [r7, #1532]
	strh	r2, [r4, #8]	@ movhi
	add	r3, r3, r1
	strh	r3, [r4, #10]	@ movhi
	ldr	r3, [r8, #3016]
	cmp	r3, lr
	ldr	r3, [r7, #1564]
	bne	.L770
	cmp	r3, #0
	addeq	r3, r2, #1
	streqh	r3, [r4, #8]	@ movhi
	ldreq	r3, [r7, #1564]
.L770:
	strb	r3, [r4, #12]
	mov	r2, #0
	ldr	r3, [r7, #1552]
	mov	r1, r4
	mov	r0, r6
	strb	r3, [r4, #13]
	ldr	r3, [r7, #1556]
	strb	r2, [r4, #6]
	strb	r3, [r4, #14]
	bl	AVS2_VarifyFrame
	subs	r5, r0, #0
	beq	.L792
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #4
	bhi	.L772
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	mov	r5, #1
	strb	r5, [r4, #6]
	cmp	r3, #0
	beq	.L765
.L773:
	mov	r2, #1
	ldr	r0, [r6, #4]
	mov	r5, r2
	ldr	r1, [r4, #56]
	bl	FSP_SetRef
	mov	r0, r5
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L766:
	ldr	r2, .L793
	mov	r0, #1
	ldr	r1, .L793+8
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L772:
	cmp	r3, #6
	moveq	r3, #2
	movne	r3, #3
	strb	r3, [r4, #6]
	b	.L773
.L792:
	ldrsh	r2, [r4]
	mov	r0, #1
	ldr	r1, .L793+12
	bl	dprint_vfmw
	mov	r0, r6
	bl	AVS2_ReleaseFrameBuf
	mov	r0, r5
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L791:
	ldr	r2, .L793
	mov	r0, #1
	ldr	r1, .L793+16
	bl	dprint_vfmw
	b	.L765
.L794:
	.align	2
.L793:
	.word	.LANCHOR0+596
	.word	.LC64
	.word	.LC65
	.word	.LC67
	.word	.LC66
	UNWIND(.fnend)
	.size	AVS2_SetupFrameBuf, .-AVS2_SetupFrameBuf
	.align	2
	.global	AVS2_SetupRefFrame
	.type	AVS2_SetupRefFrame, %function
AVS2_SetupRefFrame:
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
	add	r3, r0, #11072
	add	r2, r0, #11136
	add	r3, r3, #48
	add	r2, r2, #44
	mov	r7, r0
	mov	r1, #0
.L796:
	str	r1, [r3, #4]!
	cmp	r3, r2
	bne	.L796
	add	r6, r7, #12288
	ldr	r2, [r6, #1508]
	cmp	r2, #4
	beq	.L833
	ldr	r3, [r6, #2360]
	sub	r1, r3, #1
	cmp	r1, #6
	bhi	.L801
	cmp	r3, #0
	beq	.L802
	add	r5, r7, #14592
	add	r9, r7, #19200
	mov	r10, #0
	add	r5, r5, #56
	add	r9, r9, #94
	add	r8, r7, #8192
	mov	r4, r10
.L807:
	add	r2, r8, #2752
	ldr	r3, [r5, #4]!
	add	r2, r2, #4
	ldrh	r2, [r2, #2]
	rsb	r3, r3, r2
	sxth	r2, r2
	sxth	r3, r3
	cmp	r2, r3
	beq	.L803
	mov	r2, r9
	mov	r1, #0
	b	.L806
.L804:
	add	r1, r1, #1
	add	r2, r2, #104
	cmp	r1, #16
	beq	.L805
.L806:
	ldrb	r0, [r2]	@ zero_extendqisi2
	tst	r0, #1
	beq	.L804
	ldrsh	r0, [r2, #-6]
	cmp	r0, r3
	bne	.L804
	ldrb	r0, [r2, #-1]	@ zero_extendqisi2
	cmp	r0, #1
	bne	.L804
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	cmp	r0, #6
	beq	.L804
	mov	r2, #104
	cmp	r1, #15
	mla	r2, r2, r1, r7
	add	r1, r8, r10, lsl #2
	add	r10, r10, #1
	add	r2, r2, #19200
	add	r2, r2, #88
	str	r2, [r1, #2932]
	bgt	.L805
.L803:
	ldr	r3, [r6, #2360]
	add	r4, r4, #1
	cmp	r4, r3
	bcc	.L807
.L835:
	cmp	r10, r3
	bcc	.L808
	ldr	r2, [r6, #1508]
.L802:
	bic	r2, r2, #2
	cmp	r2, #1
	bne	.L810
	ldr	r2, [r6, #1500]
	cmp	r2, #1
	beq	.L834
.L810:
	mov	r0, #1
.L799:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L805:
	add	r2, r8, #2752
	ldr	r1, .L837
	add	r2, r2, #4
	mov	r0, #1
	add	r4, r4, #1
	ldrsh	r2, [r2, #2]
	bl	dprint_vfmw
	ldr	r3, [r6, #2360]
	cmp	r4, r3
	bcc	.L807
	b	.L835
.L833:
	add	r3, r7, #19200
	mov	r2, #0
	add	r3, r3, #94
.L800:
	ldrb	r1, [r3]	@ zero_extendqisi2
	tst	r1, #2
	beq	.L798
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	sub	r1, r1, #5
	cmp	r1, #1
	bls	.L836
.L798:
	add	r2, r2, #1
	add	r3, r3, #104
	cmp	r2, #16
	bne	.L800
	ldr	r1, .L837+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L808:
	mov	r2, r10
	ldr	r1, .L837+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L834:
	add	r3, r7, r3, lsl #2
	add	r2, r7, #19200
	add	r3, r3, #8320
	add	r7, r7, #20736
	add	r3, r3, #44
	add	r2, r2, #88
	add	r7, r7, #216
.L812:
	ldrb	r1, [r2, #6]	@ zero_extendqisi2
	tst	r1, #2
	beq	.L811
	ldrb	r1, [r2, #7]	@ zero_extendqisi2
	sub	r1, r1, #5
	cmp	r1, #1
	strls	r2, [r3, #2756]
.L811:
	add	r2, r2, #104
	cmp	r2, r7
	bne	.L812
	b	.L810
.L801:
	mov	r1, #7
	ldr	r2, .L837+12
	str	r1, [sp]
	mov	r0, #1
	ldr	r1, .L837+16
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L836:
	mov	r3, #104
	add	r1, r7, #8192
	mla	r3, r3, r2, r7
	mov	r0, #1
	add	r3, r3, #19200
	add	r3, r3, #88
	str	r3, [r1, #2932]
	b	.L799
.L838:
	.align	2
.L837:
	.word	.LC69
	.word	.LC68
	.word	.LC70
	.word	.LANCHOR0+616
	.word	.LC71
	UNWIND(.fnend)
	.size	AVS2_SetupRefFrame, .-AVS2_SetupRefFrame
	.align	2
	.global	AVS2_SetupHalConfig
	.type	AVS2_SetupHalConfig, %function
AVS2_SetupHalConfig:
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
	ldr	r2, [r0, #36]
	add	r6, r0, #8192
	mov	r4, r0
	add	r3, r0, #11136
	movw	ip, #2412
	ldr	r1, [r2, #600]
	add	r3, r3, #56
	ldr	r7, [r6, #2932]
	movw	r0, #2414
	add	r5, r4, #12288
	strb	r1, [r4, #590]
	ldr	r1, [r2, #632]
	strb	r1, [r4, #592]
	ldr	r2, [r2, #652]
	strb	r2, [r4, #589]
	ldr	r1, [r6, #2928]
	ldr	r2, [r1, #60]
	str	r2, [r4, #680]
	ldr	r2, [r1, #88]
	str	r2, [r4, #848]
	ldr	r2, [r1, #92]
	str	r2, [r4, #852]
	ldr	r2, [r1, #84]
	str	r2, [r4, #856]
	ldr	r2, [r1, #96]
	str	r2, [r4, #860]
	ldr	r2, [r1, #100]
	str	r2, [r4, #684]
	ldr	r2, [r1, #68]
	str	r2, [r4, #864]
	ldr	r2, [r1, #72]
	str	r2, [r4, #868]
	ldr	r2, [r1, #76]
	str	r2, [r4, #872]
	ldr	r2, [r6, #3020]
	str	r2, [r4, #688]
	ldr	r2, [r6, #3028]
	str	r2, [r4, #692]
	ldrh	r2, [r3, ip]
	str	r2, [r4, #696]
	ldrh	r3, [r3, r0]
	str	r3, [r4, #700]
	ldr	r3, [r5, #1564]
	str	r3, [r4, #708]
	ldrb	r2, [r5, #1321]	@ zero_extendqisi2
	strb	r2, [r4, #588]
	ldr	r2, [r5, #1572]
	str	r2, [r4, #712]
	ldr	r2, [r5, #1568]
	str	r2, [r4, #716]
	ldr	r2, [r5, #1508]
	str	r2, [r4, #720]
	ldr	r2, [r6, #3016]
	cmp	r2, #1
	movne	r3, #0
	strne	r3, [r4, #724]
	beq	.L863
.L842:
	ldr	r3, [r5, #1304]
	str	r3, [r4, #728]
	ldr	r3, [r6, #3192]
	str	r3, [r4, #732]
	ldr	r3, [r6, #3036]
	str	r3, [r4, #736]
	ldr	r3, [r6, #3196]
	str	r3, [r4, #740]
	ldr	r3, [r6, #3096]
	str	r3, [r4, #744]
	ldr	r3, [r6, #3104]
	str	r3, [r4, #748]
	ldr	r3, [r6, #3100]
	str	r3, [r4, #752]
	ldrb	r3, [r5, #1376]	@ zero_extendqisi2
	str	r3, [r4, #756]
	ldr	r3, [r6, #3188]
	str	r3, [r4, #760]
	ldr	r2, [r5, #1632]
	ldr	r3, [r5, #1636]
	ldr	r0, [r5, #1628]
	mov	r2, r2, asl #1
	orr	r3, r2, r3, asl #2
	orr	r3, r3, r0
	str	r3, [r4, #764]
	ldr	r3, [r6, #3204]
	str	r3, [r4, #768]
	ldr	r3, [r6, #3208]
	str	r3, [r4, #772]
	ldr	r3, [r6, #3080]
	str	r3, [r4, #704]
	ldr	r3, [r6, #3200]
	str	r3, [r4, #776]
	ldr	r3, [r6, #3084]
	str	r3, [r4, #780]
	ldr	r3, [r5, #1600]
	str	r3, [r4, #796]
	ldr	r3, [r5, #1616]
	str	r3, [r4, #784]
	ldr	r3, [r5, #1612]
	str	r3, [r4, #788]
	ldr	r3, [r5, #1608]
	str	r3, [r4, #792]
	ldr	r3, [r5, #1596]
	str	r3, [r4, #800]
	ldr	r3, [r5, #1592]
	str	r3, [r4, #804]
	ldr	r3, [r5, #1588]
	str	r3, [r4, #808]
	ldr	r3, [r5, #1584]
	str	r3, [r4, #812]
	ldrb	r3, [r1, #12]	@ zero_extendqisi2
	str	r3, [r4, #816]
	ldrb	r3, [r1, #13]	@ zero_extendqisi2
	str	r3, [r4, #820]
	ldrb	r3, [r1, #14]	@ zero_extendqisi2
	str	r3, [r4, #824]
	ldr	r0, [r5, #1512]
	cmp	r0, #0
	bne	.L843
	add	ip, r4, #11072
	mov	r3, r4
	add	ip, ip, #52
	mov	r2, r7
	b	.L846
.L864:
	ldr	r2, [ip, #4]!
.L846:
	cmp	r2, #0
	add	r0, r0, #1
	beq	.L844
	ldrb	lr, [r2, #12]	@ zero_extendqisi2
	str	lr, [r3, #904]
	ldrb	lr, [r2, #13]	@ zero_extendqisi2
	str	lr, [r3, #932]
	ldrb	lr, [r2, #14]	@ zero_extendqisi2
	str	lr, [r3, #960]
	ldr	r2, [r2, #60]
	str	r2, [r3, #988]
.L844:
	cmp	r0, #7
	add	r3, r3, #4
	bne	.L864
.L845:
	ldr	r3, [r1, #80]
	cmp	r7, #0
	ldr	r8, .L866
	add	r9, r4, #588
	add	r1, r4, #13952
	streq	r7, [r4, #832]
	str	r3, [r4, #828]
	add	r1, r1, #44
	ldrne	r3, [r7, #80]
	mov	r2, #576
	add	r0, r9, #492
	add	r10, r4, #11136
	add	r10, r10, #56
	strne	r3, [r4, #832]
	ldr	r3, [r8, #52]
	blx	r3
	add	r1, r4, #14528
	add	r0, r4, #1648
	ldr	r3, [r8, #52]
	add	r1, r1, #44
	add	r0, r0, #8
	mov	r2, #72
	blx	r3
	ldr	r3, [r5, #1512]
	cmp	r3, #0
	beq	.L865
	ldrb	r3, [r5, #1377]	@ zero_extendqisi2
	str	r3, [r4, #836]
	ldr	r3, [r6, #3212]
	str	r3, [r4, #840]
	ldr	r3, [r5, #1500]
	str	r3, [r4, #844]
.L850:
	add	r0, r4, #876
	ldr	r3, [r8, #48]
	mov	r2, #28
	mov	r1, #0
	blx	r3
.L851:
	add	r1, r10, #2480
	ldr	r3, [r8, #52]
	add	r1, r1, #6
	mov	r2, #16
	add	r0, r9, #5
	blx	r3
	add	r1, r10, #2496
	add	r1, r1, #6
	ldr	r3, [r8, #52]
	add	r0, r9, #21
	mov	r2, #64
	blx	r3
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L843:
	ldrb	r3, [r1, #12]	@ zero_extendqisi2
	str	r3, [r4, #904]
	ldrb	r3, [r1, #13]	@ zero_extendqisi2
	str	r3, [r4, #932]
	ldrb	r3, [r1, #14]	@ zero_extendqisi2
	str	r3, [r4, #960]
	ldr	r3, [r1, #60]
	str	r3, [r4, #988]
	b	.L845
.L865:
	str	r3, [fp, #-52]
	add	r3, r4, #10944
	add	r3, r3, #4
	mov	r2, #14
	add	r1, r3, #12
	ldr	ip, [r8, #52]
	add	r0, r4, #1016
	str	r3, [fp, #-48]
	blx	ip
	ldr	r3, [fp, #-48]
	mov	r2, #14
	ldr	ip, [r8, #52]
	add	r1, r3, #40
	add	r0, r9, #444
	blx	ip
	ldr	r3, [fp, #-48]
	ldr	ip, [r8, #52]
	mov	r2, #14
	add	r1, r3, #26
	add	r0, r9, #460
	blx	ip
	ldr	r3, [fp, #-48]
	mov	r2, #14
	add	r0, r9, #476
	add	r1, r3, #54
	ldr	r3, [r8, #52]
	blx	r3
	ldr	r3, [fp, #-52]
	movw	r2, #474
	movw	r0, #442
	movw	r1, #458
	movw	ip, #490
	strh	r3, [r9, r0]	@ movhi
	strh	r3, [r9, r1]	@ movhi
	strh	r3, [r9, r2]	@ movhi
	strh	r3, [r9, ip]	@ movhi
	ldrb	r2, [r5, #1377]	@ zero_extendqisi2
	ldr	r3, [r5, #1512]
	str	r2, [r4, #836]
	cmp	r3, #0
	ldr	r3, [r6, #3212]
	str	r3, [r4, #840]
	ldr	r3, [r5, #1500]
	str	r3, [r4, #844]
	bne	.L850
	ldrb	r3, [r7, #46]	@ zero_extendqisi2
	str	r3, [r4, #876]
	ldrb	r3, [r7, #47]	@ zero_extendqisi2
	str	r3, [r4, #880]
	ldrb	r3, [r7, #48]	@ zero_extendqisi2
	str	r3, [r4, #884]
	ldrb	r3, [r7, #49]	@ zero_extendqisi2
	str	r3, [r4, #888]
	ldrb	r3, [r7, #50]	@ zero_extendqisi2
	str	r3, [r4, #892]
	ldrb	r3, [r7, #51]	@ zero_extendqisi2
	str	r3, [r4, #896]
	ldrb	r3, [r7, #52]	@ zero_extendqisi2
	str	r3, [r4, #900]
	b	.L851
.L863:
	cmp	r3, #1
	movne	r3, #2
	str	r3, [r4, #724]
	b	.L842
.L867:
	.align	2
.L866:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	AVS2_SetupHalConfig, .-AVS2_SetupHalConfig
	.global	__aeabi_idiv
	.align	2
	.global	AVS2_CalDistance
	.type	AVS2_CalDistance, %function
AVS2_CalDistance:
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
	add	r3, r0, #8192
	str	r3, [fp, #-56]
	mov	r2, r3
	ldr	r3, [r3, #2932]
	str	r0, [fp, #-52]
	cmp	r3, #0
	ldr	r10, [r2, #2928]
	moveq	r3, r0
	addeq	r3, r3, #12288
	ldreqb	r3, [r3, #1376]	@ zero_extendqisi2
	beq	.L870
	ldr	r3, [fp, #-52]
	add	r2, r3, #12288
	ldrb	r3, [r2, #1376]	@ zero_extendqisi2
	sub	r1, r3, #1
	cmp	r1, #6
	bhi	.L870
	add	r3, r10, #16
	add	r6, r10, #30
	mov	lr, #1
	mov	ip, #16384
	mov	r1, r3
	mov	r0, r6
.L873:
	strh	lr, [r1, #2]!	@ movhi
	cmp	r1, r6
	strh	ip, [r0, #2]!	@ movhi
	bne	.L873
	ldrb	r1, [r2, #1376]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L874
	ldr	r1, [fp, #-52]
	add	r9, r10, #45
	add	r4, r10, #18
	mov	r8, r6
	add	r7, r1, #11072
	ldrsh	r1, [r10, #2]
	add	r7, r7, #48
	str	r6, [fp, #-64]
	mov	r5, #0
	mov	r6, r10
	mov	r10, r2
	str	r1, [fp, #-48]
	str	r3, [fp, #-60]
.L879:
	ldr	r1, [r7, #4]!
	ldr	r3, [fp, #-48]
	ldrb	r0, [r1, #12]	@ zero_extendqisi2
	strb	r0, [r9, #1]!
	ldrsh	r0, [r1, #2]
	cmp	r0, r3
	ldrltsh	r0, [r1, #8]
	ldrgesh	r1, [r1, #8]
	ldrltsh	r1, [r6, #8]
	ldrgesh	r0, [r6, #8]
	rsb	r0, r0, r1
	add	r0, r0, #512
	mov	r1, r0, asr #31
	mov	r1, r1, lsr #23
	add	r0, r0, r1
	ubfx	r0, r0, #0, #9
	rsb	r1, r1, r0
	mov	r0, #16384
	mov	ip, r0
	uxth	r1, r1
	strh	r1, [r4]	@ movhi
	cmp	r1, #0
	sxth	r1, r1
	moveq	r3, #1	@ movhi
	streqh	r3, [r4]	@ movhi
	beq	.L878
	bl	__aeabi_idiv
	uxth	ip, r0
.L878:
	strh	ip, [r8, #2]!	@ movhi
	add	r5, r5, #1
	ldrb	r1, [r10, #1376]	@ zero_extendqisi2
	add	r4, r4, #2
	cmp	r1, r5
	bhi	.L879
	ldr	r0, [r10, #1500]
	ldr	r2, [fp, #-56]
	cmp	r0, #1
	ldr	r3, [fp, #-60]
	ldr	r6, [fp, #-64]
	ldr	r2, [r2, #2932]
	beq	.L886
.L887:
	ldr	r1, [fp, #-52]
	add	r5, r2, #16
	add	r4, r1, #10944
	add	r1, r2, #30
	mov	r2, #7
	mov	lr, r4
	mov	ip, r4
	mov	r0, r4
	add	lr, lr, #42
	add	r4, r4, #14
	add	ip, ip, #28
	add	r0, r0, #56
.L884:
	ldrh	r7, [r3, #2]!
	subs	r2, r2, #1
	strh	r7, [r4, #2]!	@ movhi
	ldrh	r7, [r5, #2]!
	strh	r7, [lr, #2]!	@ movhi
	ldrh	r7, [r6, #2]!
	strh	r7, [ip, #2]!	@ movhi
	ldrh	r7, [r1, #2]!
	strh	r7, [r0, #2]!	@ movhi
	bne	.L884
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L870:
	mov	r1, #7
	ldr	r2, .L901
	str	r1, [sp]
	mov	r0, #1
	ldr	r1, .L901+4
	bl	dprint_vfmw
.L868:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L886:
	cmp	r1, #1
	beq	.L900
.L881:
	ldr	r0, [fp, #-52]
	add	r7, r2, #16
	add	r2, r2, #30
	add	r5, r0, #10944
	mov	r0, #7
	mov	r4, r5
	mov	lr, r5
	mov	ip, r5
	add	r4, r4, #42
	add	r5, r5, #14
	add	lr, lr, #28
	add	ip, ip, #56
.L883:
	ldrh	r8, [r3, #2]!
	subs	r0, r0, #1
	strh	r8, [r5, #2]!	@ movhi
	ldrh	r8, [r7, #2]!
	strh	r8, [r4, #2]!	@ movhi
	ldrh	r8, [r6, #2]!
	strh	r8, [lr, #2]!	@ movhi
	ldrh	r8, [r2, #2]!
	strh	r8, [ip, #2]!	@ movhi
	bne	.L883
	ldr	r3, [fp, #-52]
	movw	r0, #2766
	mov	ip, #1
	mov	r2, #16384
	add	r1, r3, r1, lsl #1
	movw	r3, #2780
	add	r1, r1, #8192
	strh	ip, [r1, r0]	@ movhi
	strh	r2, [r1, r3]	@ movhi
	b	.L868
.L874:
	ldr	r0, [r2, #1500]
	ldr	r2, [fp, #-56]
	cmp	r0, #1
	ldr	r2, [r2, #2932]
	bne	.L887
	b	.L881
.L900:
	ldr	r3, [fp, #-52]
	mov	r4, #16384
	add	lr, r3, #10944
	mov	r3, #7
	mov	ip, lr
	mov	r0, lr
	mov	r2, lr
	add	ip, ip, #42
	add	lr, lr, #14
	add	r0, r0, #28
	add	r2, r2, #56
.L882:
	subs	r3, r3, #1
	strh	r1, [lr, #2]!	@ movhi
	strh	r1, [ip, #2]!	@ movhi
	strh	r4, [r0, #2]!	@ movhi
	strh	r4, [r2, #2]!	@ movhi
	bne	.L882
	b	.L868
.L902:
	.align	2
.L901:
	.word	.LANCHOR0+636
	.word	.LC72
	UNWIND(.fnend)
	.size	AVS2_CalDistance, .-AVS2_CalDistance
	.align	2
	.global	AVS2_SetImgFormat
	.type	AVS2_SetImgFormat, %function
AVS2_SetImgFormat:
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
	add	r5, r0, #8192
	add	r7, r0, #12288
	mov	r6, r0
	ldr	r2, [r5, #3012]
	ldr	r3, [r7, #1328]
	cmp	r2, #1
	ldr	r10, [r7, #1508]
	str	r3, [fp, #-48]
	moveq	r8, #0
	beq	.L904
	ldr	r8, [r7, #1548]
	subs	r8, r8, #1
	movne	r8, #1
.L904:
	ldr	r2, [r5, #3048]
	ldr	r3, [r7, #1556]
	sub	r2, r2, #1
	ldr	r0, [r6, #4]
	cmp	r2, #3
	str	r3, [fp, #-52]
	ldrls	r1, .L918
	movhi	r9, #0
	addls	r2, r1, r2, lsl #2
	ldr	r1, [r5, #2928]
	ldrls	r9, [r2, #656]
	ldr	r1, [r1, #56]
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	beq	.L915
	cmp	r8, #1
	movne	lr, #3
	beq	.L916
.L907:
	ldr	ip, [r4, #64]
	mov	r1, r9
	mov	r0, r4
	bfi	ip, r9, #14, #3
	str	ip, [r4, #64]
	ldr	r3, [fp, #-52]
	mov	r2, ip, lsr #8
	ldrb	r9, [r4, #66]	@ zero_extendqisi2
	bfi	r2, r3, #4, #2
	ldr	r3, [fp, #-48]
	bfi	r2, lr, #2, #2
	bfi	ip, r3, #5, #3
	bfi	r2, r8, #0, #2
	and	ip, ip, #227
	strb	r2, [r4, #65]
	bfi	ip, r10, #0, #2
	strb	ip, [r4, #64]
	ldr	r2, [r5, #2928]
	ldrb	r2, [r2, #15]	@ zero_extendqisi2
	bfi	r9, r2, #1, #1
	strb	r9, [r4, #66]
	ldr	r2, [r5, #2764]
	str	r10, [r4, #56]
	str	r10, [r4, #60]
	str	r2, [r4, #152]
	bl	SetAspectRatio
	ldr	r3, [r5, #2928]
	ldrb	r3, [r3, #16]	@ zero_extendqisi2
	str	r3, [r4, #120]
	ldr	r3, [r6, #36]
	ldr	r3, [r3, #604]
	str	r3, [r4, #124]
	ldr	r3, [r6, #36]
	ldr	r3, [r3, #608]
	str	r3, [r4, #128]
	ldr	r3, [r6, #36]
	ldr	r3, [r3, #612]
	str	r3, [r4, #132]
	ldr	r3, [r5, #3020]
	str	r3, [r4, #68]
	ldr	r3, [r5, #3028]
	str	r3, [r4, #72]
	ldr	r2, [r5, #3024]
	str	r2, [r4, #76]
	ldr	r2, [r5, #3032]
	str	r2, [r4, #80]
	ldr	r2, [r7, #1324]
	str	r2, [r4, #108]
	ldr	r2, [r6, #36]
	ldr	r2, [r2, #28]
	cmp	r2, #25
	beq	.L917
.L908:
	mov	r3, #18
	str	r3, [r4, #296]
	ldr	r1, [r7, #1552]
	mov	r2, #1
	mov	r3, #8
	strb	r2, [r4, #291]
	cmp	r1, r2
	strb	r2, [r4, #289]
	str	r3, [r4, #300]
	moveq	r2, #0
	movne	r2, #4
	str	r3, [r4, #308]
	strb	r2, [r4, #284]
	str	r3, [r4, #304]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L916:
	ldr	r1, [r7, #1564]
	cmp	r1, #1
	moveq	lr, #1
	movne	lr, #2
	b	.L907
.L917:
	ldr	r0, [r4, #112]
	add	r3, r3, #15
	ldr	ip, [r4, #36]
	add	lr, r4, #512
	mov	r3, r3, lsr #4
	mov	r1, r0, asl #4
	add	r5, ip, r0
	mul	r1, r3, r1
	add	r6, r1, ip
	str	r6, [r4, #40]
	ldrd	r2, [lr, #-8]
	add	r0, r6, r0
	adds	r2, r2, r1
	adc	r3, r3, r1, asr #31
	strd	r2, [lr]
	str	r6, [r4, #24]
	str	r0, [r4, #32]
	str	r5, [r4, #28]
	str	ip, [r4, #20]
	b	.L908
.L915:
	movw	r2, #3585
	ldr	r1, .L918+4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L919:
	.align	2
.L918:
	.word	.LANCHOR0
	.word	.LC73
	UNWIND(.fnend)
	.size	AVS2_SetImgFormat, .-AVS2_SetImgFormat
	.align	2
	.global	AVS2_SimpleDirectProcess
	.type	AVS2_SimpleDirectProcess, %function
AVS2_SimpleDirectProcess:
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
	add	r3, r0, #8192
	mov	r2, #1
	mov	r6, r0
	ldr	r4, [r3, #2928]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	strb	r2, [r4, #4]
	cmp	r3, #6
	beq	.L923
	mov	r1, r4
	bl	AVS2_OutputOneFrame
.L922:
	mov	r5, #0
	ldr	r1, [r4, #56]
	strb	r5, [r4, #5]
	mov	r2, r5
	ldr	r0, [r6, #4]
	bl	FSP_SetRef
	strb	r5, [r4, #6]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L923:
	mov	r2, #0
	ldr	r1, [r4, #56]
	ldr	r0, [r0, #4]
	bl	FSP_SetDisplay
	b	.L922
	UNWIND(.fnend)
	.size	AVS2_SimpleDirectProcess, .-AVS2_SimpleDirectProcess
	.align	2
	.global	AVS2_DispOrderProcess
	.type	AVS2_DispOrderProcess, %function
AVS2_DispOrderProcess:
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
	add	r3, r0, #8192
	mov	r4, r0
	ldr	r2, [r3, #2928]
	ldrb	r1, [r2, #7]	@ zero_extendqisi2
	cmp	r1, #6
	beq	.L927
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L926
	ldr	r1, [r0, #36]
	ldr	r1, [r1, #12]
	cmp	r1, #0
	beq	.L928
.L926:
	mov	r0, r4
	mov	r1, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	AVS2_DisplayFrameInPOI
.L928:
	mov	r5, #1
	strb	r5, [r2, #4]
	ldr	r1, [r3, #2928]
	bl	AVS2_OutputOneFrame
	strb	r5, [r4, #1]
	b	.L926
.L927:
	mov	r1, #1
	strb	r1, [r2, #4]
	ldr	r3, [r3, #2928]
	mov	r2, #0
	ldr	r0, [r0, #4]
	ldr	r1, [r3, #56]
	bl	FSP_SetDisplay
	b	.L926
	UNWIND(.fnend)
	.size	AVS2_DispOrderProcess, .-AVS2_DispOrderProcess
	.align	2
	.global	AVS2_DecOrderProcess
	.type	AVS2_DecOrderProcess, %function
AVS2_DecOrderProcess:
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
	add	r2, r0, #8192
	mov	ip, #1
	ldr	r1, [r2, #2928]
	ldrb	r2, [r1, #7]	@ zero_extendqisi2
	strb	ip, [r1, #4]
	cmp	r2, #6
	beq	.L931
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVS2_OutputOneFrame
.L931:
	ldr	r1, [r1, #56]
	mov	r2, #0
	ldr	r0, [r0, #4]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FSP_SetDisplay
	UNWIND(.fnend)
	.size	AVS2_DecOrderProcess, .-AVS2_DecOrderProcess
	.align	2
	.global	AVS2_UpdateFrameBuf
	.type	AVS2_UpdateFrameBuf, %function
AVS2_UpdateFrameBuf:
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
	ldr	r3, [r3, #1508]
	sub	r3, r3, #5
	cmp	r3, #1
	bls	.L934
.L933:
	mov	r0, r4
	bl	AVS2_UpdateRefBuf
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	AVS2_RefreshBuf
.L934:
	bl	AVS2_UpdateSceneBuf.part.8
	b	.L933
	UNWIND(.fnend)
	.size	AVS2_UpdateFrameBuf, .-AVS2_UpdateFrameBuf
	.align	2
	.global	AVS2_FlushFrameInDpb
	.type	AVS2_FlushFrameInDpb, %function
AVS2_FlushFrameInDpb:
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
	mov	r1, #1
	mov	r4, r0
	bl	AVS2_DisplayFrameInPOI
	add	r3, r4, #19200
	add	r0, r4, #20736
	add	r3, r3, #92
	add	r0, r0, #220
	b	.L937
.L936:
	add	r3, r3, #104
	cmp	r3, r0
	beq	.L939
.L937:
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L936
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	add	r3, r3, #104
	cmp	r2, #0
	ldreqb	r2, [r3, #-102]	@ zero_extendqisi2
	andeq	r2, r2, #2
	streqb	r2, [r3, #-102]
	cmp	r3, r0
	bne	.L937
.L939:
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_FlushFrameInDpb, .-AVS2_FlushFrameInDpb
	.align	2
	.global	AVS2_FlushPreSizeImg
	.type	AVS2_FlushPreSizeImg, %function
AVS2_FlushPreSizeImg:
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
	UNWIND(.pad #16)
	sub	sp, sp, #16
	sub	r3, fp, #20
	mov	r4, #0
	mov	r5, r0
	str	r4, [r3, #-4]!
	sub	r2, fp, #28
	ldr	r0, [r0, #4]
	sub	r1, fp, #32
	str	r4, [fp, #-32]
	str	r4, [fp, #-28]
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r5, #36]
	ldr	r3, [r3, #732]
	cmp	r3, #1
	movne	r0, #1
	beq	.L945
.L941:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L945:
	ldr	r3, [fp, #-24]
	cmp	r3, r4
	ble	.L946
.L944:
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L946:
	ldr	r3, [fp, #-28]
	cmp	r3, #32
	bgt	.L944
	ldr	r4, [r5, #40]
	clz	r0, r4
	mov	r0, r0, lsr #5
	b	.L941
	UNWIND(.fnend)
	.size	AVS2_FlushPreSizeImg, .-AVS2_FlushPreSizeImg
	.align	2
	.global	AVS2_ArrangeFrameBuf
	.type	AVS2_ArrangeFrameBuf, %function
AVS2_ArrangeFrameBuf:
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
	ldr	r3, [r0, #20]
	mov	r4, r0
	cmp	r3, #0
	beq	.L948
	bl	AVS2_FlushPreSizeImg
	cmp	r0, #0
	bne	.L949
.L951:
	mov	r0, #3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L949:
	mov	r0, r4
	bl	AVS2_ClearDpb
	add	r1, r4, #18688
	add	r1, r1, #88
	ldr	r0, [r4, #4]
	bl	FSP_ClearNotInVoQueue
	mov	r3, #0
	str	r3, [r4, #20]
.L948:
	mov	r3, #0
	mov	r0, r4
	str	r3, [r4, #24]
	bl	AVS2_AllocateVHB
	cmp	r0, #3
	mov	r4, r0
	beq	.L951
	cmp	r0, #0
	beq	.L959
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L959:
	ldr	r1, .L960
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L961:
	.align	2
.L960:
	.word	.LC74
	UNWIND(.fnend)
	.size	AVS2_ArrangeFrameBuf, .-AVS2_ArrangeFrameBuf
	.align	2
	.global	AVS2_ParseHeader
	.type	AVS2_ParseHeader, %function
AVS2_ParseHeader:
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
	add	r5, r0, #44
	mov	r3, #0
	mov	r4, r0
	str	r3, [r0, #8]
	mov	r1, #32
	mov	r0, r5
	bl	BsShow
	uxtb	r6, r0
	sub	r3, r6, #176
	cmp	r3, #78
	ldrls	pc, [pc, r3, asl #2]
	b	.L963
.L965:
	.word	.L964
	.word	.L966
	.word	.L967
	.word	.L968
	.word	.L963
	.word	.L969
	.word	.L968
	.word	.L966
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L963
	.word	.L970
.L966:
	ldr	r3, [r4, #12]
	tst	r3, #32768
	bne	.L1005
	cmp	r6, #177
	beq	.L1006
	ldr	r1, .L1011
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r5, .L1011+4
.L987:
	ldr	r3, [r5]
	tst	r3, #1
	bne	.L967
	mov	r0, r4
	bl	AVS2_ClearDpb
.L967:
	mov	r0, r4
	mov	r5, #1
	bl	AVS2_ClearPacket
.L972:
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L968:
	ldr	r3, [r4, #12]
	tst	r3, #32768
	bne	.L1005
	tst	r3, #65536
	beq	.L976
	ldr	r3, [r4, #20]
	cmp	r3, #1
	beq	.L977
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L978
.L977:
	mov	r0, r4
	bl	AVS2_ArrangeFrameBuf
	cmp	r0, #1
	mov	r5, r0
	beq	.L978
	cmp	r0, #3
	moveq	r3, #1
	streq	r3, [r4, #8]
	beq	.L972
.L1003:
	mov	r0, r4
	bl	AVS2_ClearPacket
	b	.L972
.L970:
	mov	r1, #32
	mov	r0, r5
	bl	BsSkip
	mov	r1, #32
	mov	r0, r5
	bl	BsGet
	mov	r1, #32
	mov	r6, r0
	mov	r0, r5
	bl	BsGet
	ldr	r3, [r4, #12]
	tst	r3, #32768
	bne	.L1005
	movw	r2, #20036
	movw	r3, #20553
	movt	r2, 17221
	movt	r3, 18515
	cmp	r0, r2
	cmpeq	r6, r3
	bne	.L976
	mvn	r3, #0
	mov	r5, #1
	str	r3, [r4, #28]
	mov	r0, r4
	strb	r5, [r4]
	bl	AVS2_ClearPacket
	b	.L972
.L969:
	ldr	r1, [r4, #12]
	tst	r1, #65536
	beq	.L967
	ands	r1, r1, #262144
	mov	r0, r4
	movne	r1, #1
	bl	AVS2_Extension
	b	.L967
.L964:
	ldr	r3, [r4, #12]
	tst	r3, #32768
	bne	.L1005
	ldr	r3, [r4, #28]
	mov	r0, r4
	cmn	r3, #1
	beq	.L1007
	bl	AVS2_FlushFrameInDpb
.L974:
	mov	r0, r4
	mov	r5, #1
	bl	AVS2_SequenceHeader
	mov	r0, r4
	bl	AVS2_ClearPacket
	b	.L972
.L963:
	cmp	r6, #143
	bhi	.L976
	ldr	r3, [r4, #12]
	and	r3, r3, #327680
	cmp	r3, #327680
	beq	.L1008
.L976:
	mov	r0, r4
	mov	r5, #0
	bl	AVS2_ClearPacket
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1005:
	mov	r5, #1
	orr	r3, r3, #16384
	str	r5, [r4, #8]
	mov	r0, r5
	str	r3, [r4, #12]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1006:
	ldr	r5, .L1011+4
	ldr	r3, [r5]
	tst	r3, #1
	beq	.L1009
.L986:
	ldr	r1, .L1011+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L987
.L978:
	ldr	r3, [r4, #28]
	cmp	r6, #179
	mov	r0, r4
	add	r3, r3, #1
	str	r3, [r4, #28]
	beq	.L1010
	bl	AVS2_InterPictureHeader
	b	.L967
.L1007:
	bl	AVS2_ClearDpb
	b	.L974
.L1008:
	mov	r0, r4
	bl	AVS2_WriteSliceMsg
	subs	r5, r0, #0
	bne	.L972
	b	.L1003
.L1009:
	mov	r0, r4
	bl	AVS2_FlushFrameInDpb
	b	.L986
.L1010:
	bl	AVS2_IntraPictureHeader
	b	.L967
.L1012:
	.align	2
.L1011:
	.word	.LC76
	.word	g_StandardObedience
	.word	.LC75
	UNWIND(.fnend)
	.size	AVS2_ParseHeader, .-AVS2_ParseHeader
	.align	2
	.global	AVS2_DecodeArbiter
	.type	AVS2_DecodeArbiter, %function
AVS2_DecodeArbiter:
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
	ldr	r5, [r0, #12]
	mov	r4, r0
	and	r3, r5, #376832
	cmp	r3, #376832
	beq	.L1016
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1016:
	add	r1, r0, #14976
	add	r0, r0, #11136
	add	r1, r1, #8
	mov	r2, #3792
	add	r0, r0, #56
	bic	r5, r5, #311296
	bl	memcpy
	mov	r0, #1
	str	r5, [r4, #12]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_DecodeArbiter, .-AVS2_DecodeArbiter
	.align	2
	.global	AVS2_PrepareDecode
	.type	AVS2_PrepareDecode, %function
AVS2_PrepareDecode:
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
	mov	r4, r0
	bl	AVS2_SetPicInfo
	ldr	r3, [r4, #1728]
	sub	r2, r3, #1
	cmp	r2, #255
	bhi	.L1032
	mov	r0, r4
	bl	AVS2_VarifyDecMode
	cmp	r0, #0
	bne	.L1033
.L1031:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1033:
	mov	r0, r4
	bl	AVS2_SetupFrameBuf
	cmp	r0, #0
	beq	.L1031
	add	r3, r4, #12288
	ldr	r3, [r3, #1512]
	cmp	r3, #0
	bne	.L1022
	mov	r0, r4
	bl	AVS2_SetupRefFrame
	cmp	r0, #0
	beq	.L1024
	mov	r0, r4
	bl	AVS2_CalDistance
.L1022:
	mov	r0, r4
	bl	AVS2_SetupHalConfig
	cmp	r0, #0
	beq	.L1024
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1032:
	ldr	r2, .L1034
	mov	r0, #1
	ldr	r1, .L1034+4
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1024:
	mov	r0, r4
	bl	AVS2_ReleaseFrameBuf
	b	.L1031
.L1035:
	.align	2
.L1034:
	.word	.LANCHOR0+672
	.word	.LC77
	UNWIND(.fnend)
	.size	AVS2_PrepareDecode, .-AVS2_PrepareDecode
	.align	2
	.global	AVS2_StartDecode
	.type	AVS2_StartDecode, %function
AVS2_StartDecode:
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
	ldr	r3, [r0, #36]
	add	r2, r0, #588
	str	r2, [r0, #40]
	ldr	r2, [r3, #600]
	strb	r2, [r0, #590]
	ldr	r3, [r3, #652]
	strb	r3, [r0, #589]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	AVS2_StartDecode, .-AVS2_StartDecode
	.align	2
	.global	AVS2_PostProcess
	.type	AVS2_PostProcess, %function
AVS2_PostProcess:
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
	mov	r4, r0
	bl	AVS2_SetImgFormat
	ldr	r3, [r4, #36]
	ldr	r2, [r3, #8]
	cmp	r2, #2
	beq	.L1043
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L1044
	sub	r3, r2, #1
	cmp	r3, #1
	bls	.L1042
	ldr	r1, .L1045
	mov	r0, #1
	bl	dprint_vfmw
.L1042:
	mov	r0, r4
	bl	AVS2_DecOrderProcess
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	AVS2_UpdateFrameBuf
.L1044:
	mov	r0, r4
	bl	AVS2_DispOrderProcess
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	AVS2_UpdateFrameBuf
.L1043:
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	AVS2_SimpleDirectProcess
.L1046:
	.align	2
.L1045:
	.word	.LC78
	UNWIND(.fnend)
	.size	AVS2_PostProcess, .-AVS2_PostProcess
	.align	2
	.global	AVS2DEC_Init
	.type	AVS2DEC_Init, %function
AVS2DEC_Init:
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
	mov	r7, r1
	mov	r4, r0
	moveq	r6, #1
	movne	r6, #0
	beq	.L1051
	add	r5, r0, #16384
	ldr	r3, .L1053
	movw	r2, #20952
	mov	r1, r6
	ldr	r8, [r5, #2736]
	ldr	r3, [r3, #48]
	blx	r3
	mov	r0, r4
	str	r8, [r5, #2736]
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r4, #4]
	beq	.L1052
	add	r0, r4, #18688
	add	r0, r0, #88
	bl	ResetVoQueue
	str	r7, [r4, #36]
	mvn	r3, #0
	str	r6, [r7, #952]
	mov	r0, #1
	str	r3, [r4, #28]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1051:
	movw	r2, #4114
	ldr	r1, .L1053+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1052:
	mov	r0, r6
	ldr	r2, .L1053+8
	ldr	r1, .L1053+12
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1054:
	.align	2
.L1053:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC57
	.word	.LANCHOR0+692
	.word	.LC79
	UNWIND(.fnend)
	.size	AVS2DEC_Init, .-AVS2DEC_Init
	.align	2
	.global	AVS2DEC_Destroy
	.type	AVS2DEC_Destroy, %function
AVS2DEC_Destroy:
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
	.size	AVS2DEC_Destroy, .-AVS2DEC_Destroy
	.align	2
	.global	AVS2_TryReleaseOldestFs
	.type	AVS2_TryReleaseOldestFs, %function
AVS2_TryReleaseOldestFs:
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
	mov	ip, #0
	add	r2, r0, #19200
	mov	r5, r0
	add	r2, r2, #94
	mov	r1, ip
	movw	r3, #4095
	mvn	r4, #0
	b	.L1058
.L1057:
	add	r1, r1, #1
	add	r2, r2, #104
	cmp	r1, #16
	beq	.L1064
.L1058:
	ldrb	r0, [r2]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1057
	ldrb	r0, [r2, #-1]	@ zero_extendqisi2
	cmp	r0, #1
	bne	.L1057
	ldrh	lr, [r2, #-6]
	sxth	r0, r3
	add	ip, ip, #1
	sxth	r6, lr
	cmp	r6, r0
	bge	.L1057
	ldrb	r0, [r2, #-2]	@ zero_extendqisi2
	add	r2, r2, #104
	cmp	r0, #1
	moveq	r4, r1
	add	r1, r1, #1
	moveq	r3, lr
	cmp	r1, #16
	bne	.L1058
.L1064:
	add	r2, r5, #16384
	cmn	r4, #1
	ldrb	r2, [r2, #1016]	@ zero_extendqisi2
	movne	r6, #0
	moveq	r6, #1
	add	r2, r2, #1
	cmp	ip, r2
	orrcc	r6, r6, #1
	cmp	r6, #0
	bne	.L1056
	str	ip, [sp]
	sxth	r3, r3
	ldr	r2, .L1065
	mov	r0, #1
	ldr	r1, .L1065+4
	bl	dprint_vfmw
	mov	r3, #104
	mla	r4, r3, r4, r5
	movw	r1, #19344
	mov	r2, r6
	add	r3, r4, #19200
	add	r3, r3, #88
	strb	r6, [r3, #6]
	strb	r6, [r3, #5]
	ldr	r0, [r5, #4]
	ldr	r1, [r4, r1]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	FSP_SetRef
.L1056:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1066:
	.align	2
.L1065:
	.word	.LANCHOR0+708
	.word	.LC80
	UNWIND(.fnend)
	.size	AVS2_TryReleaseOldestFs, .-AVS2_TryReleaseOldestFs
	.align	2
	.global	AVS2DEC_GetImageBuffer
	.type	AVS2DEC_GetImageBuffer, %function
AVS2DEC_GetImageBuffer:
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
	beq	.L1074
	ldr	r0, [r4, #4]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r0, [r4, #4]
	bl	FSP_IsNewFsAvalible
	cmn	r0, #1
	beq	.L1075
.L1070:
	mov	r0, r4
	bl	AVS2_TryReleaseOldestFs
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1075:
	add	r1, r4, #18688
	ldr	r0, [r4, #4]
	add	r1, r1, #88
	bl	FSP_ClearNotInVoQueue
	b	.L1070
.L1074:
	movw	r2, #4188
	ldr	r1, .L1076
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1077:
	.align	2
.L1076:
	.word	.LC57
	UNWIND(.fnend)
	.size	AVS2DEC_GetImageBuffer, .-AVS2DEC_GetImageBuffer
	.align	2
	.global	AVS2DEC_Decode
	.type	AVS2DEC_Decode, %function
AVS2DEC_Decode:
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
	mov	r6, r1
	moveq	r5, #1
	movne	r5, #0
	beq	.L1086
	ldr	r2, [r1, #16]
	add	r0, r0, #44
	ldr	r1, [r1]
	bl	BsInit
	ldr	r3, .L1090
	add	r0, r4, #18944
	mov	r1, r6
	mov	r2, #160
	add	r0, r0, #184
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, [r4, #12]
	mov	r0, r4
	str	r3, [r4, #16]
	bl	AVS2_ParseHeader
	cmp	r0, #3
	beq	.L1087
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r6, [r4, #12]
	and	r3, r6, #376832
	cmp	r3, #376832
	beq	.L1088
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1086:
	movw	r2, #4211
	ldr	r1, .L1090+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1087:
	ldr	r3, [r4, #16]
	str	r3, [r4, #12]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1088:
	add	r1, r4, #14976
	add	r0, r4, #11136
	add	r1, r1, #8
	mov	r2, #3792
	add	r0, r0, #56
	bic	r6, r6, #311296
	bl	memcpy
	mov	r0, r4
	str	r6, [r4, #12]
	bl	AVS2_PrepareDecode
	subs	r5, r0, #0
	beq	.L1089
	ldr	r3, [r4, #36]
	add	r2, r4, #588
	str	r2, [r4, #40]
	mov	r0, #1
	ldr	r2, [r3, #600]
	strb	r2, [r4, #590]
	ldr	r3, [r3, #652]
	strb	r3, [r4, #589]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1089:
	mov	r0, r4
	bl	AVS2_ClearPicSlice
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1091:
	.align	2
.L1090:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC57
	UNWIND(.fnend)
	.size	AVS2DEC_Decode, .-AVS2DEC_Decode
	.align	2
	.global	AVS2DEC_RecycleImage
	.type	AVS2DEC_RecycleImage, %function
AVS2DEC_RecycleImage:
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
	beq	.L1096
	mov	r2, #0
	ldr	r0, [r4, #4]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #4]
	bl	FSP_GetFsImagePtr
	cmp	r0, #0
	beq	.L1095
	add	r5, r0, #560
	add	r8, r0, #544
	ldr	r1, [r0, #544]
	mov	r6, #0
	ldr	r0, [r4, #4]
	mov	r7, #0
	bl	FreeUsdByDec
	strd	r6, [r8]
	ldr	r0, [r4, #4]
	ldr	r1, [r5, #-8]
	bl	FreeUsdByDec
	strd	r6, [r5, #-8]
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1095:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1096:
	movw	r2, #4296
	ldr	r1, .L1097
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1098:
	.align	2
.L1097:
	.word	.LC57
	UNWIND(.fnend)
	.size	AVS2DEC_RecycleImage, .-AVS2DEC_RecycleImage
	.align	2
	.global	AVS2DEC_GetRemainImg
	.type	AVS2DEC_GetRemainImg, %function
AVS2DEC_GetRemainImg:
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
	beq	.L1103
	bl	AVS2_FlushFrameInDpb
	add	r0, r4, #18688
	add	r0, r0, #88
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	GetVoLastImageID
.L1103:
	movw	r2, #4318
	ldr	r1, .L1104
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1105:
	.align	2
.L1104:
	.word	.LC57
	UNWIND(.fnend)
	.size	AVS2DEC_GetRemainImg, .-AVS2DEC_GetRemainImg
	.align	2
	.global	AVS2DEC_ClearCurPic
	.type	AVS2DEC_ClearCurPic, %function
AVS2DEC_ClearCurPic:
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
	beq	.L1109
	bl	AVS2_ClearPicSlice
	mov	r0, r4
	bl	AVS2_ReleaseFrameBuf
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1109:
	movw	r2, #4340
	ldr	r1, .L1110
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1111:
	.align	2
.L1110:
	.word	.LC57
	UNWIND(.fnend)
	.size	AVS2DEC_ClearCurPic, .-AVS2DEC_ClearCurPic
	.align	2
	.global	AVS2DEC_VDMPostProc
	.type	AVS2DEC_VDMPostProc, %function
AVS2DEC_VDMPostProc:
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
	mov	r5, r1
	beq	.L1122
	add	ip, r4, #8192
	ldrb	r1, [r4, #591]	@ zero_extendqisi2
	cmp	r2, #0
	ldr	r2, [ip, #2928]
	strb	r1, [r2, #15]
	ldrb	r1, [r4, #590]	@ zero_extendqisi2
	strb	r1, [r2, #16]
	beq	.L1115
	mov	r2, r3, asl #6
	ldr	r1, .L1125
	sub	r3, r2, r3, asl #3
	add	r3, r3, r1
	ldr	r3, [r3, #4]
	cmp	r3, #3
	beq	.L1123
	cmp	r3, #1
	beq	.L1115
.L1117:
	ldr	r3, [r4, #36]
	mov	r0, r4
	ldr	r3, [r3, #4]
	cmp	r3, r5
	blt	.L1124
	bl	AVS2_PostProcess
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1115:
	mov	r0, r4
	bl	AVS2_ClearPicSlice
	b	.L1117
.L1124:
	bl	AVS2DEC_ClearCurPic
	ldr	r3, [r4, #36]
	mov	r2, r5
	ldr	r1, .L1125+4
	mov	r0, #1
	ldr	r3, [r3, #4]
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1123:
	bl	AVS2_ClearPicSlice
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1122:
	movw	r2, #4251
	ldr	r1, .L1125+8
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1126:
	.align	2
.L1125:
	.word	g_VdmDrvParam+40
	.word	.LC81
	.word	.LC57
	UNWIND(.fnend)
	.size	AVS2DEC_VDMPostProc, .-AVS2DEC_VDMPostProc
	.global	AVS2_WqM4x4IdxModel2
	.global	AVS2_WqM4x4IdxModel1
	.global	AVS2_WqM4x4IdxModel0
	.global	AVS2_WqM8x8IdxModel2
	.global	AVS2_WqM8x8IdxModel1
	.global	AVS2_WqM8x8IdxModel0
	.global	AVS2_WQM_8x8Default
	.global	AVS2_WQM_4x4Default
	.global	AVS2_WeightQuantParamBase2
	.global	AVS2_WeightQuantParamBase1
	.global	AVS2_WeightQuantParamDefault
	.global	Avs2_AlfRegionTable
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	CSWTCH.37, %object
	.size	CSWTCH.37, 28
CSWTCH.37:
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.type	__func__.14371, %object
	.size	__func__.14371, 30
__func__.14371:
	.ascii	"AVS2_DynamicMetadataExtension\000"
	.space	2
	.type	__func__.14411, %object
	.size	__func__.14411, 15
__func__.14411:
	.ascii	"AVS2_User_Data\000"
	.space	1
	.type	__func__.14424, %object
	.size	__func__.14424, 26
__func__.14424:
	.ascii	"AVS2_ConvertSLHDRMetadata\000"
	.space	2
	.type	AVS2_WqM8x8IdxModel0, %object
	.size	AVS2_WqM8x8IdxModel0, 64
AVS2_WqM8x8IdxModel0:
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	5
	.byte	5
	.byte	0
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	1
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.type	AVS2_WqM4x4IdxModel0, %object
	.size	AVS2_WqM4x4IdxModel0, 16
AVS2_WqM4x4IdxModel0:
	.byte	0
	.byte	4
	.byte	3
	.byte	5
	.byte	4
	.byte	2
	.byte	1
	.byte	5
	.byte	3
	.byte	1
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.type	AVS2_WqM8x8IdxModel1, %object
	.size	AVS2_WqM8x8IdxModel1, 64
AVS2_WqM8x8IdxModel1:
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	0
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.type	AVS2_WqM4x4IdxModel1, %object
	.size	AVS2_WqM4x4IdxModel1, 16
AVS2_WqM4x4IdxModel1:
	.byte	0
	.byte	4
	.byte	4
	.byte	5
	.byte	3
	.byte	2
	.byte	2
	.byte	5
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.type	AVS2_WqM8x8IdxModel2, %object
	.size	AVS2_WqM8x8IdxModel2, 64
AVS2_WqM8x8IdxModel2:
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	5
	.byte	5
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.type	AVS2_WqM4x4IdxModel2, %object
	.size	AVS2_WqM4x4IdxModel2, 16
AVS2_WqM4x4IdxModel2:
	.byte	0
	.byte	4
	.byte	3
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	5
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.type	AVS2_WeightQuantParamDefault, %object
	.size	AVS2_WeightQuantParamDefault, 6
AVS2_WeightQuantParamDefault:
	.byte	64
	.byte	49
	.byte	53
	.byte	58
	.byte	58
	.byte	64
	.space	2
	.type	AVS2_WeightQuantParamBase1, %object
	.size	AVS2_WeightQuantParamBase1, 6
AVS2_WeightQuantParamBase1:
	.byte	67
	.byte	71
	.byte	71
	.byte	80
	.byte	80
	.byte	106
	.space	2
	.type	AVS2_WeightQuantParamBase2, %object
	.size	AVS2_WeightQuantParamBase2, 6
AVS2_WeightQuantParamBase2:
	.byte	64
	.byte	49
	.byte	53
	.byte	58
	.byte	58
	.byte	64
	.space	2
	.type	AVS2_WQM_4x4Default, %object
	.size	AVS2_WQM_4x4Default, 16
AVS2_WQM_4x4Default:
	.byte	64
	.byte	64
	.byte	64
	.byte	68
	.byte	64
	.byte	64
	.byte	68
	.byte	72
	.byte	64
	.byte	68
	.byte	76
	.byte	80
	.byte	72
	.byte	76
	.byte	84
	.byte	96
	.type	AVS2_WQM_8x8Default, %object
	.size	AVS2_WQM_8x8Default, 64
AVS2_WQM_8x8Default:
	.byte	64
	.byte	64
	.byte	64
	.byte	64
	.byte	68
	.byte	68
	.byte	72
	.byte	76
	.byte	64
	.byte	64
	.byte	64
	.byte	68
	.byte	72
	.byte	76
	.byte	84
	.byte	92
	.byte	64
	.byte	64
	.byte	68
	.byte	72
	.byte	76
	.byte	80
	.byte	88
	.byte	100
	.byte	64
	.byte	68
	.byte	72
	.byte	80
	.byte	84
	.byte	92
	.byte	100
	.byte	112
	.byte	68
	.byte	72
	.byte	80
	.byte	84
	.byte	92
	.byte	104
	.byte	112
	.byte	-128
	.byte	76
	.byte	80
	.byte	84
	.byte	92
	.byte	104
	.byte	116
	.byte	-124
	.byte	-104
	.byte	96
	.byte	100
	.byte	104
	.byte	116
	.byte	124
	.byte	-116
	.byte	-92
	.byte	-68
	.byte	104
	.byte	108
	.byte	116
	.byte	-128
	.byte	-104
	.byte	-84
	.byte	-64
	.byte	-40
	.type	Avs2_AlfRegionTable, %object
	.size	Avs2_AlfRegionTable, 16
Avs2_AlfRegionTable:
	.byte	0
	.byte	1
	.byte	4
	.byte	5
	.byte	15
	.byte	2
	.byte	3
	.byte	6
	.byte	14
	.byte	11
	.byte	10
	.byte	7
	.byte	13
	.byte	12
	.byte	9
	.byte	8
	.type	__func__.14587, %object
	.size	__func__.14587, 24
__func__.14587:
	.ascii	"AVS2_IntraPictureHeader\000"
	.type	__func__.14605, %object
	.size	__func__.14605, 24
__func__.14605:
	.ascii	"AVS2_InterPictureHeader\000"
	.type	frame_rate_Table, %object
	.size	frame_rate_Table, 64
frame_rate_Table:
	.word	0
	.word	23976
	.word	24000
	.word	25000
	.word	29970
	.word	30000
	.word	50000
	.word	59940
	.word	60000
	.word	100000
	.word	120000
	.word	200000
	.word	240000
	.word	300000
	.word	3
	.word	3
	.type	__func__.14645, %object
	.size	__func__.14645, 17
__func__.14645:
	.ascii	"AVS2_ExchangePts\000"
	.space	3
	.type	__func__.14759, %object
	.size	__func__.14759, 19
__func__.14759:
	.ascii	"AVS2_SetupFrameBuf\000"
	.space	1
	.type	__func__.14778, %object
	.size	__func__.14778, 19
__func__.14778:
	.ascii	"AVS2_SetupRefFrame\000"
	.space	1
	.type	__func__.14809, %object
	.size	__func__.14809, 17
__func__.14809:
	.ascii	"AVS2_CalDistance\000"
	.space	3
	.type	CSWTCH.87, %object
	.size	CSWTCH.87, 16
CSWTCH.87:
	.word	5
	.word	1
	.word	2
	.word	3
	.type	__func__.14902, %object
	.size	__func__.14902, 19
__func__.14902:
	.ascii	"AVS2_PrepareDecode\000"
	.space	1
	.type	__func__.14919, %object
	.size	__func__.14919, 13
__func__.14919:
	.ascii	"AVS2DEC_Init\000"
	.space	3
	.type	__func__.14934, %object
	.size	__func__.14934, 24
__func__.14934:
	.ascii	"AVS2_TryReleaseOldestFs\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"AVS2_ue_v ERROR: LeadingZeros (%d) >= 32, return 0x" )
	ASCII(.ascii	"%x\012\000" )
	.space	1
.LC1:
	ASCII(.ascii	"Stream StartCode is 0x%x Length is too Long cannot " )
	ASCII(.ascii	"Remove DPB!!\000" )
.LC2:
	ASCII(.ascii	"Unkown\000" )
	.space	1
.LC3:
	ASCII(.ascii	"\012\000" )
	.space	2
.LC4:
	ASCII(.ascii	" ----> Dump Dpb Status:\012\000" )
	.space	3
.LC5:
	ASCII(.ascii	"Pic %2d, Type %6s, Occupied %d, Ref %d, Disp %d, DO" )
	ASCII(.ascii	"I %d, POI %d, FspID %d, FsPhy 0x%x, PmvPhy 0x%x\012" )
	ASCII(.ascii	"\000" )
.LC6:
	ASCII(.ascii	" ----> Dump End: Totoal Occupied Frame %d\012\012\000" )
.LC7:
	ASCII(.ascii	"%s: Unsupport sl hdr!\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"User Data:\012\000" )
.LC9:
	ASCII(.ascii	"%s: cosume TotalPos(%d > %d)!\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"%s pMetaData is null vir:%p\012\000" )
	.space	3
.LC11:
	ASCII(.ascii	"%s error: metadata size(%d) < structure size(%d)\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC12:
	ASCII(.ascii	"Slice num out of slot: %d > %d\012\000" )
.LC13:
	ASCII(.ascii	"Stream ERROR: slice_vertical_position %d out of ran" )
	ASCII(.ascii	"ge [0, 0x8F].\012\000" )
	.space	2
.LC14:
	ASCII(.ascii	"Stream ERROR: alf_filter_num_minus1 %d > 15.\012\000" )
	.space	2
.LC15:
	ASCII(.ascii	"ALF ERROR: alf_region_distance %d out of range [1, " )
	ASCII(.ascii	"15].\012\000" )
	.space	3
.LC16:
	ASCII(.ascii	"ALF ERROR: alf_coef_luma_8 %d out of range [-1088, " )
	ASCII(.ascii	"1071].\012\000" )
	.space	1
.LC17:
	ASCII(.ascii	"ALF ERROR: alf_coef_luma_%d %d out of range [-64, 6" )
	ASCII(.ascii	"3].\012\000" )
.LC18:
	ASCII(.ascii	"ALF ERROR: alf_coef_chroma0_8 %d out of range [-108" )
	ASCII(.ascii	"8, 1071].\012\000" )
	.space	2
.LC19:
	ASCII(.ascii	"ALF ERROR: alf_coef_chroma0_%d %d out of range [-64" )
	ASCII(.ascii	", 63].\012\000" )
	.space	1
.LC20:
	ASCII(.ascii	"ALF ERROR: alf_coef_chroma1_8 %d out of range [-108" )
	ASCII(.ascii	"8, 1071].\012\000" )
	.space	2
.LC21:
	ASCII(.ascii	"ALF ERROR: alf_coef_chroma1_%d %d out of range [-64" )
	ASCII(.ascii	", 63].\012\000" )
	.space	1
.LC22:
	ASCII(.ascii	"Intra stream ERROR: picture_output_delay out of ran" )
	ASCII(.ascii	"ge [0, 63], force 63.\012\000" )
	.space	2
.LC23:
	ASCII(.ascii	"Intra stream ERROR: force progressive_frame to 0 fo" )
	ASCII(.ascii	"r field_coded_sequence = 1\012\000" )
	.space	1
.LC24:
	ASCII(.ascii	"Intra stream ERROR: picture_qp %d out of range [0, " )
	ASCII(.ascii	"%d], force %d.\012\000" )
	.space	1
.LC25:
	ASCII(.ascii	"Intra stream ERROR: alpha_c_offset %d out of range " )
	ASCII(.ascii	"[-8, 8], force 0.\012\000" )
	.space	2
.LC26:
	ASCII(.ascii	"Intra stream ERROR: beta_offset %d out of range [-8" )
	ASCII(.ascii	", 8], force 0.\012\000" )
	.space	1
.LC27:
	ASCII(.ascii	"Intra stream ERROR: chroma_quant_param_delta_cb %d " )
	ASCII(.ascii	"out of range [-16, 16], force 0.\012\000" )
	.space	3
.LC28:
	ASCII(.ascii	"Intra stream ERROR: chroma_quant_param_delta_cr %d " )
	ASCII(.ascii	"out of range [-16, 16], force 0.\012\000" )
	.space	3
.LC29:
	ASCII(.ascii	"%s call AVS2_alf_parameter_set failed\012\000" )
	.space	1
.LC30:
	ASCII(.ascii	"Inter stream ERROR: picture_coding_type should not " )
	ASCII(.ascii	"equal 0.\012\000" )
	.space	3
.LC31:
	ASCII(.ascii	"Inter stream ERROR: picture_output_delay out of ran" )
	ASCII(.ascii	"ge [0, 63], force 63.\012\000" )
	.space	2
.LC32:
	ASCII(.ascii	"Inter stream ERROR: force progressive_frame to 1 fo" )
	ASCII(.ascii	"r progressive_sequence = 1\012\000" )
	.space	1
.LC33:
	ASCII(.ascii	"Inter stream ERROR: force progressive_frame to 0 fo" )
	ASCII(.ascii	"r field_coded_sequence = 1\012\000" )
	.space	1
.LC34:
	ASCII(.ascii	"Inter stream ERROR: picture_qp %d out of range [0, " )
	ASCII(.ascii	"%d], force %d.\012\000" )
	.space	1
.LC35:
	ASCII(.ascii	"Inter stream ERROR: alpha_c_offset %d out of range " )
	ASCII(.ascii	"[-8, 8], force 0.\012\000" )
	.space	2
.LC36:
	ASCII(.ascii	"Inter stream ERROR: beta_offset %d out of range [-8" )
	ASCII(.ascii	", 8], force 0.\012\000" )
	.space	1
.LC37:
	ASCII(.ascii	"Inter stream ERROR: chroma_quant_param_delta_cb %d " )
	ASCII(.ascii	"out of range [-16, 16], force 0.\012\000" )
	.space	3
.LC38:
	ASCII(.ascii	"Inter stream ERROR: chroma_quant_param_delta_cr %d " )
	ASCII(.ascii	"out of range [-16, 16], force 0.\012\000" )
	.space	3
.LC39:
	ASCII(.ascii	"%s ERROR: ucRefPicNum out of range [1, %d].\012\000" )
	.space	3
.LC40:
	ASCII(.ascii	"Sequence Header:\012\000" )
	.space	2
.LC41:
	ASCII(.ascii	"Stream ERROR: profile_id 0x%x unsupport.\012\000" )
	.space	2
.LC42:
	ASCII(.ascii	"Stream ERROR: level_id should not equal 0.\012\000" )
.LC43:
	ASCII(.ascii	"Stream ERROR: field_coded_sequence should be 0 when" )
	ASCII(.ascii	" progressive_sequence = 1\012\000" )
	.space	2
.LC44:
	ASCII(.ascii	"Stream ERROR: horizontal_size should not equal 0.\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC45:
	ASCII(.ascii	"Stream ERROR: vertical_size should not equal 0.\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC46:
	ASCII(.ascii	"Stream ERROR: chroma_format %d not support, only 4:" )
	ASCII(.ascii	"2:0 now.\012\000" )
	.space	3
.LC47:
	ASCII(.ascii	"Stream ERROR: sample_precision %d should equal to 8" )
	ASCII(.ascii	"/10\012\000" )
.LC48:
	ASCII(.ascii	"AVS2 sequence ERROR: ucBitDepth %d should equal to " )
	ASCII(.ascii	"8/10, and not less than sample_precision %d\012\000" )
.LC49:
	ASCII(.ascii	"Stream ERROR: aspect_ratio = 0 is forbidden!\012\000" )
	.space	2
.LC50:
	ASCII(.ascii	"Stream ERROR: frame_rate_code = 0 is forbidden!\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC51:
	ASCII(.ascii	"Stream ERROR: num_of_rcs %d out of range [0, %d]\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC52:
	ASCII(.ascii	"MbWidth = %d, MbHeight = %d, don't support!\012\000" )
	.space	3
.LC53:
	ASCII(.ascii	"avs2 actual frame size(%dx%d) exeed max config(%dx%" )
	ASCII(.ascii	"d)\012\000" )
	.space	1
.LC54:
	ASCII(.ascii	"avs2 actual frame size(%dx%d) exceed max config(%dx" )
	ASCII(.ascii	"%d)\012\000" )
.LC55:
	ASCII(.ascii	"ERROR: partition fs memory failed!\012\000" )
.LC56:
	ASCII(.ascii	"ERROR: FSP_ConfigInstance failed!\012\000" )
	.space	1
.LC57:
	ASCII(.ascii	"line: %d\012\000" )
	.space	2
.LC58:
	ASCII(.ascii	"ERROR: AVS2_OutputOneFrame is err(%d)\012\000" )
	.space	1
.LC59:
	ASCII(.ascii	"%s can't find pCurImage.\012\000" )
	.space	2
.LC60:
	ASCII(.ascii	"Dump frame, POI: %d\012\000" )
	.space	3
.LC61:
	ASCII(.ascii	"NumOfRemovedPicture: %d\012\000" )
	.space	3
.LC62:
	ASCII(.ascii	"Target removal DOI[%d]: %d\012\000" )
.LC63:
	ASCII(.ascii	"Conflict: cur frame(Type %d, DOI %d, FspID %d, FsPh" )
	ASCII(.ascii	"y 0x%x, PmvPhy 0x%x) with frame(Type %d, Occupied %" )
	ASCII(.ascii	"d, UsedAsRef %d, DOI %d, FspID %d, FsPhy 0x%x, PmvP" )
	ASCII(.ascii	"hy 0x%x)\012\000" )
	.space	1
.LC64:
	ASCII(.ascii	"%s: Can't find non-occupied frame memory buffer!!!\012" )
	ASCII(.ascii	"\000" )
.LC65:
	ASCII(.ascii	"%s ERROR: get frame store fail!\012\000" )
	.space	3
.LC66:
	ASCII(.ascii	"%s ERROR: get image pointer fail!\012\000" )
	.space	1
.LC67:
	ASCII(.ascii	"Varify current frame DOI %d failed!\012\000" )
	.space	3
.LC68:
	ASCII(.ascii	"Can't find G or GB picture for the reference of S p" )
	ASCII(.ascii	"icture.\012\000" )
.LC69:
	ASCII(.ascii	"CurPic Doi %d cant find ref frame TargetDoi %d\012\000" )
.LC70:
	ASCII(.ascii	"Found ref num %d < num_of_reference_picture %d\012\000" )
.LC71:
	ASCII(.ascii	"%s ERROR: num_of_reference_picture %d out of range " )
	ASCII(.ascii	"[1, %d].\012\000" )
	.space	3
.LC72:
	ASCII(.ascii	"%s ERROR: pstRefFrmMem[0] = NULL or ucRefPicNum %d " )
	ASCII(.ascii	"out of range [1, %d].\012\000" )
	.space	2
.LC73:
	ASCII(.ascii	"line: %d pImage is null\012\000" )
	.space	3
.LC74:
	ASCII(.ascii	"ERROR: allocate vhb\012\000" )
	.space	3
.LC75:
	ASCII(.ascii	"AVS2_VIDEO_SEQUENCE_END_CODE\012\000" )
	.space	2
.LC76:
	ASCII(.ascii	"AVS2_VIDEO_EDIT_CODE\012\000" )
	.space	2
.LC77:
	ASCII(.ascii	"%s SliceNum %d invalid.\012\000" )
	.space	3
.LC78:
	ASCII(.ascii	"AVS2 unsupport output order %d, force dec order out" )
	ASCII(.ascii	"put.\012\000" )
	.space	3
.LC79:
	ASCII(.ascii	"%s get chan id failed!\012\000" )
.LC80:
	ASCII(.ascii	"%s set fs unref with oldest Doi %d to proceed decod" )
	ASCII(.ascii	"ing for ref num %d is full.\012\000" )
.LC81:
	ASCII(.ascii	"Discard cur pic, ErrLevel(%d) > OutErrThr(%d)\012\000" )
	.space	1
.LC82:
	ASCII(.ascii	"I_PIC\000" )
	.space	2
.LC83:
	ASCII(.ascii	"P_PIC\000" )
	.space	2
.LC84:
	ASCII(.ascii	"B_PIC\000" )
	.space	2
.LC85:
	ASCII(.ascii	"F_PIC\000" )
	.space	2
.LC86:
	ASCII(.ascii	"S_PIC\000" )
	.space	2
.LC87:
	ASCII(.ascii	"G_PIC\000" )
	.space	2
.LC88:
	ASCII(.ascii	"GB_PIC\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
