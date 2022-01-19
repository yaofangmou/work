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
	.file	"vdm_drv.c"
	.text
	.align	2
	.type	VDMDRV_AdjustErrRatio, %function
VDMDRV_AdjustErrRatio:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #24)
	sub	sp, sp, #24
	ldr	r4, .L18
	mov	r7, r0, asl #4
	mov	r5, r0, asl #6
	rsb	r3, r7, r5
	cmp	r1, #0
	add	r3, r4, r3
	mov	r6, r2
	add	r2, r3, #8
	ldr	r8, [r3, #8]
	streq	r1, [r6]
	beq	.L1
	cmp	r1, #1
	beq	.L15
	ldr	r1, [r2, #4]
	sub	r2, fp, #36
	ldr	r3, [r3, #40]
	str	r0, [r2, #-12]!
	mov	r0, r2
	str	r1, [fp, #-44]
	str	r3, [fp, #-40]
	bl	PostPro_GetErrRatio
	ldr	r9, .L18+4
	cmp	r0, #0
	str	r0, [r6]
	bne	.L16
.L6:
	rsb	r5, r7, r5
	ldr	r2, [r9, r8, asl #2]
	add	r4, r4, r5
	ldr	r1, [r4, #12]
	ldr	r3, [r2, #88]
	sub	r0, r1, #8
	cmp	r1, #5
	cmpne	r0, #1
	add	r3, r3, #1
	str	r3, [r2, #88]
	movls	r3, #0
	bhi	.L17
	str	r3, [r6]
.L1:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L15:
	str	r1, [sp]
	mov	ip, #100
	mov	r3, r8
	str	ip, [r6]
	mov	r0, r1
	ldr	r2, .L18+8
	movw	r1, #291
	str	ip, [sp, #4]
	bl	dprint_normal
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L17:
	ldr	r3, [r6]
	cmp	r3, #100
	movge	r3, #100
	bic	r3, r3, r3, asr #31
	str	r3, [r6]
	b	.L1
.L16:
	ldr	ip, [r9, r8, asl #2]
	mov	r3, r8
	str	r0, [sp, #4]
	movw	r1, #306
	ldr	r2, .L18+12
	mov	r0, #1
	ldr	ip, [ip, #88]
	str	ip, [sp]
	bl	dprint_normal
	b	.L6
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	.word	.LC0
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMDRV_AdjustErrRatio, .-VDMDRV_AdjustErrRatio
	.align	2
	.type	VDMDRV_ClearChanIsDec.part.4, %function
VDMDRV_ClearChanIsDec.part.4:
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
	mov	r1, #217
	ldr	r3, .L21
	mov	r0, #1
	str	r1, [sp]
	ldr	r2, .L21+4
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	.LANCHOR1
	.word	.LC2
	UNWIND(.fnend)
	.size	VDMDRV_ClearChanIsDec.part.4, .-VDMDRV_ClearChanIsDec.part.4
	.align	2
	.type	VDMDRV_SetStateIdle.part.9, %function
VDMDRV_SetStateIdle.part.9:
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
	movw	r1, #1191
	ldr	r3, .L24
	mov	r0, #1
	str	r1, [sp]
	ldr	r2, .L24+4
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L25:
	.align	2
.L24:
	.word	.LANCHOR1+24
	.word	.LC2
	UNWIND(.fnend)
	.size	VDMDRV_SetStateIdle.part.9, .-VDMDRV_SetStateIdle.part.9
	.align	2
	.global	VDMDRV_Init
	.type	VDMDRV_Init, %function
VDMDRV_Init:
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
	subs	r4, r0, #0
	bne	.L29
	ldr	r5, .L30
	mov	r2, #48
	ldr	r3, .L30+4
	mov	r1, r4
	mov	r0, r5
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, .L30+8
	str	r4, [r5, #48]
	str	r4, [r3, #16]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L29:
	mov	r1, #27
	ldr	r3, .L30+12
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L30+16
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L31:
	.align	2
.L30:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_VfmwGlobalStat
	.word	.LANCHOR1+44
	.word	.LC2
	UNWIND(.fnend)
	.size	VDMDRV_Init, .-VDMDRV_Init
	.align	2
	.global	VDMDRV_Reset
	.type	VDMDRV_Reset, %function
VDMDRV_Reset:
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
	subs	r1, r0, #0
	bne	.L36
	ldr	r3, .L37
	mov	r2, #48
	ldr	r0, .L37+4
	ldr	r3, [r3, #48]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L36:
	mov	r1, #38
	ldr	r3, .L37+8
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L37+12
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L38:
	.align	2
.L37:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LANCHOR1+56
	.word	.LC2
	UNWIND(.fnend)
	.size	VDMDRV_Reset, .-VDMDRV_Reset
	.align	2
	.global	VDMDRV_SetPriority
	.type	VDMDRV_SetPriority, %function
VDMDRV_SetPriority:
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
	cmp	r0, #0
	beq	.L52
	ldr	r5, .L54
	mov	lr, #0
	sub	r7, r0, #4
	mov	r4, lr
	mov	r6, lr
.L48:
	mov	ip, #0
	mov	r1, r7
	mov	r3, ip
.L43:
	ldr	r2, [r1, #4]!
	cmp	r2, ip
	movgt	r4, r3
	add	r3, r3, #1
	movgt	ip, r2
	cmp	r3, #4
	bne	.L43
	cmp	ip, #0
	ble	.L53
	add	lr, lr, #1
	str	r4, [r5, #4]!
	cmp	lr, #4
	str	r6, [r0, r4, asl #2]
	bne	.L48
.L39:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L53:
	cmp	lr, #3
	bgt	.L39
	ldr	r0, .L54+4
	mov	r2, lr, asl #2
	mvn	r1, #0
.L46:
	add	lr, lr, #1
	add	r3, r0, r2
	cmp	lr, #4
	add	r2, r2, #4
	str	r1, [r3, #68]
	bne	.L46
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L52:
	mov	r1, #52
	ldr	r3, .L54+8
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L54+12
	bl	dprint_normal
	b	.L39
.L55:
	.align	2
.L54:
	.word	.LANCHOR0+64
	.word	.LANCHOR0
	.word	.LANCHOR1+72
	.word	.LC2
	UNWIND(.fnend)
	.size	VDMDRV_SetPriority, .-VDMDRV_SetPriority
	.align	2
	.global	VDMDRV_AdjustPriorityAfterDec
	.type	VDMDRV_AdjustPriorityAfterDec, %function
VDMDRV_AdjustPriorityAfterDec:
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
	ldr	r5, .L67
	ldr	r3, [r5, #68]
	cmp	r3, r0
	beq	.L63
	ldr	r3, [r5, #72]
	cmp	r3, r0
	beq	.L64
	ldr	r3, [r5, #76]
	cmp	r3, r0
	beq	.L65
	ldr	r3, [r5, #80]
	cmp	r3, r0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	lr, #0
	mov	r2, #4
	mov	r3, lr
.L58:
	ldr	r0, .L67+4
	add	r7, r0, r2
	ldr	ip, [r0, r2]
	cmp	ip, #0
	ldmltfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r2, r3, #2
	mov	r2, r2, asl #2
	b	.L60
.L62:
	ldr	ip, [r0, r2]
	add	r2, r2, #4
	cmp	ip, #0
	ldmltfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L60:
	ldr	r4, [r0, lr, asl #2]
	add	r1, r5, ip, lsl #2
	add	r3, r3, #1
	ldr	r6, [r1, #52]
	add	r1, r5, r4, lsl #2
	ldr	r1, [r1, #52]
	cmp	r6, r1
	strge	ip, [r0, lr, asl #2]
	strge	r4, [r7]
	cmp	r3, #2
	add	r7, r0, r2
	mov	lr, r3
	ble	.L62
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L63:
	mov	r3, #0
.L57:
	add	r2, r3, #1
	mov	lr, r3
	mov	r2, r2, asl #2
	b	.L58
.L64:
	mov	r3, #1
	b	.L57
.L65:
	mov	r3, #2
	b	.L57
.L68:
	.align	2
.L67:
	.word	.LANCHOR0
	.word	.LANCHOR0+68
	UNWIND(.fnend)
	.size	VDMDRV_AdjustPriorityAfterDec, .-VDMDRV_AdjustPriorityAfterDec
	.align	2
	.global	VDMDRV_PrepareSleep
	.type	VDMDRV_PrepareSleep, %function
VDMDRV_PrepareSleep:
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
	cmp	r0, #0
	bne	.L74
	ldr	r3, .L75
	ldr	r0, [r3, #48]
	cmp	r0, #0
	mvnne	r0, #0
	bne	.L71
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r0, r2
	movne	r2, #1
	moveq	r2, #2
	str	r2, [r3, #48]
.L71:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L74:
	mov	r1, #125
	ldr	r3, .L75+4
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L75+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L71
.L76:
	.align	2
.L75:
	.word	.LANCHOR0
	.word	.LANCHOR1+92
	.word	.LC2
	UNWIND(.fnend)
	.size	VDMDRV_PrepareSleep, .-VDMDRV_PrepareSleep
	.align	2
	.global	VDMDRV_GetSleepStage
	.type	VDMDRV_GetSleepStage, %function
VDMDRV_GetSleepStage:
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
	cmp	r0, #0
	bne	.L80
	ldr	r3, .L81
	ldr	r0, [r3, #48]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L80:
	mov	r1, #150
	ldr	r3, .L81+4
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L81+8
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L82:
	.align	2
.L81:
	.word	.LANCHOR0
	.word	.LANCHOR1+112
	.word	.LC2
	UNWIND(.fnend)
	.size	VDMDRV_GetSleepStage, .-VDMDRV_GetSleepStage
	.align	2
	.global	VDMDRV_ForceSleep
	.type	VDMDRV_ForceSleep, %function
VDMDRV_ForceSleep:
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
	cmp	r0, #0
	bne	.L91
	ldr	r4, .L92
	ldr	r3, [r4, #48]
	cmp	r3, #2
	beq	.L86
	bl	VDMDRV_Reset
	mov	r3, #2
	str	r3, [r4, #48]
.L86:
	ldr	r2, .L92+4
	mov	r1, #164
	mov	r0, #0
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	dprint_normal
.L91:
	mov	r1, #156
	ldr	r3, .L92+8
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L92+12
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L93:
	.align	2
.L92:
	.word	.LANCHOR0
	.word	.LC3
	.word	.LANCHOR1+136
	.word	.LC2
	UNWIND(.fnend)
	.size	VDMDRV_ForceSleep, .-VDMDRV_ForceSleep
	.align	2
	.global	VDMDRV_ExitSleep
	.type	VDMDRV_ExitSleep, %function
VDMDRV_ExitSleep:
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
	cmp	r0, #0
	ldreq	r3, .L98
	streq	r0, [r3, #48]
	bne	.L97
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L97:
	mov	r1, #171
	ldr	r3, .L98+4
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L98+8
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L99:
	.align	2
.L98:
	.word	.LANCHOR0
	.word	.LANCHOR1+156
	.word	.LC2
	UNWIND(.fnend)
	.size	VDMDRV_ExitSleep, .-VDMDRV_ExitSleep
	.align	2
	.global	VDMDRV_StartRepair
	.type	VDMDRV_StartRepair, %function
VDMDRV_StartRepair:
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
	mov	r6, r0
	mov	r0, #8
	mov	r4, r1
	mov	r7, r2
	bl	VCTRL_RecordPosTime
	ldr	r3, .L103
	ldr	r5, [r3, #108]
	cmp	r5, #0
	beq	.L101
	mov	r1, r7
	mov	r0, r4
	blx	r5
.L102:
	mov	r1, r4, asl #6
	ldr	r3, .L103+4
	sub	r1, r1, r4, asl #4
	str	r6, [r3, r1]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L101:
	mov	r3, #179
	mov	r0, r5
	mov	r1, r3
	ldr	r2, .L103+8
	bl	dprint_normal
	b	.L102
.L104:
	.align	2
.L103:
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR0
	.word	.LC4
	UNWIND(.fnend)
	.size	VDMDRV_StartRepair, .-VDMDRV_StartRepair
	.align	2
	.global	VDMDRV_StartDec
	.type	VDMDRV_StartDec, %function
VDMDRV_StartDec:
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
	mov	r0, #8
	mov	r5, r1
	bl	VCTRL_RecordPosTime
	ldr	r3, .L108
	ldr	r2, [r3, #112]
	cmp	r2, #0
	beq	.L106
	mov	r1, r5
	mov	r0, r4
	blx	r2
.L107:
	mov	r0, r4, asl #6
	ldr	r3, .L108+4
	sub	r0, r0, r4, asl #4
	mov	r2, #1
	str	r2, [r3, r0]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L106:
	mov	r3, #188
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L108+8
	bl	dprint_normal
	b	.L107
.L109:
	.align	2
.L108:
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR0
	.word	.LC4
	UNWIND(.fnend)
	.size	VDMDRV_StartDec, .-VDMDRV_StartDec
	.align	2
	.global	VDMDRV_IsChanDec
	.type	VDMDRV_IsChanDec, %function
VDMDRV_IsChanDec:
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
	ldr	r3, .L111
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #84]
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L112:
	.align	2
.L111:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_IsChanDec, .-VDMDRV_IsChanDec
	.align	2
	.global	VDMDRV_SetChanIsDec
	.type	VDMDRV_SetChanIsDec, %function
VDMDRV_SetChanIsDec:
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
	cmp	r0, #3
	movhi	r1, #207
	bhi	.L117
	cmp	r1, #0
	bne	.L118
	ldr	r2, .L119
	mov	r1, #1
	add	r3, r2, r0, lsl #2
	str	r1, [r3, #84]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDMDRV_AdjustPriorityAfterDec
.L118:
	mov	r1, #208
.L117:
	ldr	r3, .L119+4
	mov	r0, #1
	str	r1, [sp]
	ldr	r2, .L119+8
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L120:
	.align	2
.L119:
	.word	.LANCHOR0
	.word	.LANCHOR1+176
	.word	.LC2
	UNWIND(.fnend)
	.size	VDMDRV_SetChanIsDec, .-VDMDRV_SetChanIsDec
	.align	2
	.global	VDMDRV_ClearChanIsDec
	.type	VDMDRV_ClearChanIsDec, %function
VDMDRV_ClearChanIsDec:
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
	cmp	r0, #3
	bhi	.L123
	add	r0, r0, #8
	ldr	r3, .L124
	mov	r2, #0
	add	r0, r3, r0, lsl #2
	str	r2, [r0, #52]
	ldmfd	sp, {fp, sp, pc}
.L123:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDMDRV_ClearChanIsDec.part.4
.L125:
	.align	2
.L124:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_ClearChanIsDec, .-VDMDRV_ClearChanIsDec
	.align	2
	.global	VDMDRV_ParamInit
	.type	VDMDRV_ParamInit, %function
VDMDRV_ParamInit:
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
	ldr	r3, .L133
	mov	r0, #1
	add	r1, r3, #16
.L128:
	ldr	r2, [r3], #4
	cmp	r2, #0
	strne	r0, [r2, #24]
	cmp	r3, r1
	bne	.L128
	ldmfd	sp, {fp, sp, pc}
.L134:
	.align	2
.L133:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	VDMDRV_ParamInit, .-VDMDRV_ParamInit
	.align	2
	.global	VDMDRV_ChnDecReady
	.type	VDMDRV_ChnDecReady, %function
VDMDRV_ChnDecReady:
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
	mov	r0, r1
	mov	r4, r1
	mov	r6, r2
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	bne	.L139
	ldr	r3, .L142
	add	r3, r3, r4, lsl #2
	ldr	r5, [r3, #84]
	cmp	r5, #0
	bne	.L140
	str	r5, [r6]
	mov	r0, r4
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	str	r0, [r6]
	beq	.L141
.L137:
	mov	r0, r5
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L139:
	str	r4, [sp]
	mov	r1, #243
	ldr	r3, .L142+4
	mov	r0, #20
	ldr	r2, .L142+8
	mov	r5, #1
	bl	dprint_normal
	mov	r0, r5
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L140:
	mov	r3, r4
	ldr	r2, .L142+12
	mov	r1, #249
	mov	r0, #20
	bl	dprint_normal
	mov	r5, #1
	mov	r0, r5
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L141:
	mov	r3, r4
	ldr	r2, .L142+16
	movw	r1, #258
	mov	r0, #20
	bl	dprint_normal
	mov	r5, #1
	b	.L137
.L143:
	.align	2
.L142:
	.word	.LANCHOR0
	.word	.LANCHOR1+196
	.word	.LC5
	.word	.LC6
	.word	.LC7
	UNWIND(.fnend)
	.size	VDMDRV_ChnDecReady, .-VDMDRV_ChnDecReady
	.align	2
	.global	VDMDRV_IsCopy
	.type	VDMDRV_IsCopy, %function
VDMDRV_IsCopy:
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
	beq	.L150
	cmp	r0, #2
	ldreqb	r0, [r4, #150]	@ zero_extendqisi2
	subeq	r0, r0, #1
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	movne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L150:
	ldr	r3, .L151
	movw	r1, #327
	ldr	r2, .L151+4
	mov	r0, r4
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L152:
	.align	2
.L151:
	.word	.LANCHOR1+216
	.word	.LC8
	UNWIND(.fnend)
	.size	VDMDRV_IsCopy, .-VDMDRV_IsCopy
	.align	2
	.global	VDMDRV_PrepairCopy
	.type	VDMDRV_PrepairCopy, %function
VDMDRV_PrepairCopy:
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
	cmp	r2, #2
	mov	r4, r2
	mov	r5, r0
	mov	r7, r3
	mov	r8, r1
	bne	.L159
	ldr	r0, [r0]
	bl	PostPro_PrepairMpeg4CopyParam
	ldr	r2, .L160
	ldr	r6, [r2, #128]
	cmp	r6, #0
	beq	.L158
	ldr	r1, [r5]
	mov	r3, r8
	str	r7, [sp]
	mov	r0, r4
	mov	r2, #3
	blx	r6
	cmp	r0, #0
	bne	.L158
.L157:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L158:
	mov	r2, #2
	ldr	r3, .L160+4
	str	r2, [sp]
	movw	r1, #409
	ldr	r2, .L160+8
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L159:
	str	r2, [sp]
	movw	r1, #401
	ldr	r3, .L160+4
	mov	r0, #1
	ldr	r2, .L160+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L157
.L161:
	.align	2
.L160:
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR1+232
	.word	.LC9
	.word	.LC10
	UNWIND(.fnend)
	.size	VDMDRV_PrepairCopy, .-VDMDRV_PrepairCopy
	.align	2
	.global	VDMDRV_DoBeforeDec
	.type	VDMDRV_DoBeforeDec, %function
VDMDRV_DoBeforeDec:
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
	mov	r4, r0
	ldr	r0, [r2]
	mov	r7, r4, asl #4
	mov	r6, r4, asl #6
	ldr	r8, .L182
	mov	r9, r2
	cmp	r0, #0
	rsb	r2, r7, r6
	mov	r5, r1
	add	r2, r8, r2
	add	r3, r2, #4
	str	r3, [fp, #-52]
	beq	.L180
	mov	r0, r1
	add	r10, r2, #8
	str	r2, [fp, #-48]
	bl	VCTRL_GetVidStd
	str	r0, [r10, #4]
	ldr	r1, [r9]
	bl	VDMDRV_IsCopy
	ldr	r2, [fp, #-48]
	cmp	r0, #0
	beq	.L165
	ldr	r2, [r10, #4]
	mov	r0, r9
	mov	r3, #0
	mov	r1, r4
	bl	VDMDRV_PrepairCopy
	subs	r10, r0, #0
	beq	.L166
	ldr	r2, .L182+4
	movw	r1, #446
	mov	r0, #0
	bl	dprint_normal
.L167:
	rsb	r6, r7, r6
	ldr	r2, [fp, #-52]
	add	r6, r8, r6
	mov	r1, #1
	mov	r0, r4
	ldr	r9, .L182
	bl	VDMDRV_AdjustErrRatio
	mov	r3, r4
	mov	r2, #0
	mov	r0, r5
	ldr	r1, [r6, #4]
	bl	VCTRL_VdmPostProc
	mov	r0, r4
	bl	VDMDRV_Reset
	cmp	r5, #3
	bhi	.L181
	add	r5, r5, #8
	mov	r0, #1
	mov	r3, #0
	add	r5, r9, r5, lsl #2
	str	r3, [r5, #52]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L165:
	ldr	r1, [r9]
	ldr	r0, [r10, #4]
	str	r2, [fp, #-48]
	bl	VCTRL_IsSedOnlyMode
	ldr	r2, [fp, #-48]
	cmp	r0, #0
	streq	r0, [r2, #44]
	movne	r1, #1
	strne	r1, [r2, #44]
	ldr	r2, .L182+8
	ldr	r10, [r2, #116]
	cmp	r10, #0
	beq	.L172
	rsb	r2, r7, r6
	ldr	r1, [r9]
	add	r3, r8, r2
	mov	r2, r4
	mov	r0, r3
	mov	r9, r3
	ldr	r0, [r0, #12]
	mov	r3, #0
	blx	r10
	cmp	r0, #0
	bne	.L172
	ldr	r3, .L182+12
	mov	r10, #100
	mla	r10, r10, r5, r3
	ldr	r3, [r10, #24]
	cmp	r3, #0
	ldrne	r9, .L182+16
	bne	.L173
	ldr	r3, [r9, #44]
	ldr	r9, .L182+16
	cmp	r3, #1
	beq	.L173
	ldr	r3, [r9]
	blx	r3
	str	r0, [r10, #24]
.L173:
	mov	r1, #0
	mov	r0, r4
	bl	VDMDRV_StartDec
	b	.L168
.L172:
	ldr	r2, .L182+20
	mov	r1, #468
	mov	r0, #0
	bl	dprint_normal
	b	.L167
.L166:
	ldr	r2, [fp, #-52]
	mov	r1, r10
	mov	r0, r4
	ldr	r9, .L182+16
	bl	VDMDRV_AdjustErrRatio
	mov	r2, r10
	mov	r1, r4
	mov	r0, #3
	bl	VDMDRV_StartRepair
.L168:
	ldr	r3, [r9]
	rsb	r7, r7, r6
	blx	r3
	ldr	r3, .L182+24
	sub	r6, r6, r4, asl #2
	add	r8, r8, r7
	add	r6, r3, r6
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	str	r2, [r8, #20]
	str	r2, [r6, #4]
	bl	VDMDRV_SetChanIsDec
	ldr	r2, .L182+28
	mov	r0, r5
	movw	r1, #486
	ldr	r3, .L182+32
	add	r2, r2, r5, lsl #2
	str	r1, [sp]
	mov	r1, #5
	bl	RecordPOS
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L180:
	mov	r3, r1
	ldr	r2, .L182+36
	mov	r1, #436
	mov	r0, #20
	bl	dprint_normal
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L181:
	bl	VDMDRV_ClearChanIsDec.part.4
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L183:
	.align	2
.L182:
	.word	.LANCHOR0
	.word	.LC12
	.word	g_vdm_hal_fun_ptr
	.word	g_VfmwChanStat
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC13
	.word	g_VfmwGlobalStat
	.word	.LANCHOR0+100
	.word	.LANCHOR1+252
	.word	.LC11
	UNWIND(.fnend)
	.size	VDMDRV_DoBeforeDec, .-VDMDRV_DoBeforeDec
	.align	2
	.global	VDMDRV_ActivateVDH
	.type	VDMDRV_ActivateVDH, %function
VDMDRV_ActivateVDH:
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
	ldr	r1, .L191
	mov	r4, r0, asl #6
	sub	r4, r4, r0, asl #4
	mov	r6, r0
	add	r7, r4, #40
	ldr	r3, [r1, #68]
	add	r7, r1, r7
	cmp	r3, #0
	ldmltfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r4, r1, r4
	add	r8, r1, #68
	add	r5, r1, #80
.L186:
	mov	r1, r3
	mov	r2, r7
	mov	r0, r6
	str	r3, [r4, #8]
	bl	VDMDRV_ChnDecReady
	cmp	r0, #0
	beq	.L187
.L189:
	cmp	r8, r5
	beq	.L190
	ldr	r3, [r8, #4]!
	cmp	r3, #0
	bge	.L186
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L187:
	mov	r2, r7
	ldr	r1, [r4, #8]
	mov	r0, r6
	bl	VDMDRV_DoBeforeDec
	cmp	r0, #0
	bne	.L189
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L190:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L192:
	.align	2
.L191:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_ActivateVDH, .-VDMDRV_ActivateVDH
	.align	2
	.global	VDMDRV_AfterDec
	.type	VDMDRV_AfterDec, %function
VDMDRV_AfterDec:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 160
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #172)
	sub	sp, sp, #172
	ldr	r10, .L247
	ldr	r5, .L247+4
	mov	r7, r0, asl #4
	mov	r9, r0, asl #6
	str	r1, [fp, #-200]
	rsb	r8, r7, r9
	mov	r2, #148
	mov	r1, #0
	mov	r6, r0
	sub	r0, fp, #192
	add	r4, r5, r8
	bl	memset
	ldr	r3, [r10, #48]
	mov	r2, #148
	mov	r1, #0
	sub	r0, fp, #192
	blx	r3
	ldr	r3, [r10, #48]
	mov	r2, #136
	mov	r1, #0
	sub	r0, fp, #188
	add	r10, r4, #24
	blx	r3
	ldr	r2, [r4, #8]
	ldr	r3, .L247+8
	movw	r1, #706
	ldrb	ip, [fp, #-200]	@ zero_extendqisi2
	mov	r0, #3
	ldr	lr, [r10, #4]
	ldr	r2, [r3, r2, asl #2]
	add	r3, r4, #8
	strb	ip, [fp, #-48]
	add	r2, r2, #204800
	ldr	ip, [r4, #4]
	str	r3, [fp, #-204]
	ldr	r2, [r2, #3276]
	ldr	r3, [r5, r8]
	str	lr, [sp]
	str	r2, [fp, #-192]
	str	ip, [sp, #4]
	ldr	r2, .L247+12
	bl	dprint_normal
	ldr	r2, [r5, r8]
	cmp	r2, #2
	beq	.L195
	cmp	r2, #3
	beq	.L196
	cmp	r2, #1
	beq	.L239
	ldr	r0, [fp, #-200]
	movw	r1, #723
	ldr	r3, [r4, #8]
	str	r2, [sp]
	str	r0, [sp, #4]
	mov	r0, #0
	ldr	r2, .L247+16
	bl	dprint_normal
	ldr	r3, [r4, #8]
	cmp	r3, #3
	bhi	.L240
	add	r3, r3, #8
	mov	r2, #0
	add	r5, r5, r3, lsl #2
	str	r2, [r5, #52]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L239:
	ldr	r0, [r4, #8]
	add	r8, r4, #4
	bl	FSP_CheckIfFsPolluted
	ldr	r3, [r10, #4]
	cmp	r3, #1
	beq	.L241
	mov	r2, r8
	mov	r1, #2
	mov	r0, r6
	bl	VDMDRV_AdjustErrRatio
	ldr	r3, [r4, #4]
	cmp	r3, #0
	beq	.L199
	ldr	r2, .L247+20
	ldr	r10, [r2]
	cmp	r10, #0
	beq	.L199
	sub	r2, fp, #44
	ldr	r0, [r4, #8]
	mov	r1, #43
	str	r3, [r2, #-152]!
	mov	r3, #4
	blx	r10
.L199:
	ldr	r3, [fp, #-192]
	cmp	r3, #1
	beq	.L242
.L200:
	rsb	r4, r7, r9
	ldr	r10, .L247+4
	add	r4, r5, r4
	add	r3, r4, #8
	str	r3, [fp, #-200]
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #40]
	ldr	r0, [r4, #8]
	bl	PostPro_GetRepairStratage
	ldr	r1, [r4, #4]
	ldr	r3, [fp, #-200]
	cmp	r1, #0
	cmpne	r0, #1
	beq	.L243
	ldr	r2, .L247+24
	ldr	r10, [r2, #128]
	cmp	r10, #0
	beq	.L205
	ldr	ip, [fp, #-52]
	mov	r2, #3
	ldr	r0, [r3, #4]
	mov	r3, r6
	ldr	r1, [r4, #40]
	str	ip, [sp]
	blx	r10
	cmp	r0, #0
	beq	.L244
.L205:
	mov	r2, r8
	mov	r1, #1
	mov	r0, r6
	rsb	r4, r7, r9
	bl	VDMDRV_AdjustErrRatio
	ldr	r8, .L247+4
	add	r4, r5, r4
.L238:
	mov	r3, r6
	sub	r2, fp, #188
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	VCTRL_VdmPostProc
	ldr	r0, [r4, #8]
	bl	VCTRL_ClearDecparam
	ldr	r3, [r4, #8]
	cmp	r3, #3
	bhi	.L245
	add	r3, r3, #8
	mov	r2, #0
	add	r3, r8, r3, lsl #2
	str	r2, [r3, #52]
.L216:
	rsb	r7, r7, r9
	mov	r3, #0
	str	r3, [r5, r7]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L196:
	ldr	r8, .L247+24
	mov	r3, #0
	str	r3, [fp, #-196]
	str	r3, [r10, #4]
	ldr	r3, [r8, #156]
	cmp	r3, #0
	beq	.L208
	sub	r0, fp, #196
	blx	r3
.L208:
	rsb	r4, r7, r9
	add	r4, r5, r4
	add	r10, r4, #8
	ldr	r1, [r4, #40]
	ldr	r0, [r10, #4]
	bl	VDMDRV_IsCopy
	cmp	r0, #0
	bne	.L209
	ldr	r3, [fp, #-196]
	cmp	r3, #0
	beq	.L209
	ldr	r8, [r8, #128]
	cmp	r8, #0
	beq	.L214
	ldr	ip, [fp, #-52]
	mov	r3, r6
	ldr	r0, [r10, #4]
	mov	r2, #2
	ldr	r1, [r4, #40]
	str	ip, [sp]
	blx	r8
	cmp	r0, #0
	beq	.L246
.L214:
	rsb	r4, r7, r9
	mov	r1, #1
	add	r4, r5, r4
	mov	r0, r6
	add	r2, r4, #4
	ldr	r8, .L247+4
	bl	VDMDRV_AdjustErrRatio
	b	.L238
.L195:
	mov	r3, r6
	sub	r2, fp, #188
	ldr	r1, [r4, #4]
	mov	r7, #0
	ldr	r0, [r4, #8]
	str	r7, [r10, #4]
	bl	VCTRL_VdmPostProc
	ldr	r0, [r4, #8]
	bl	VCTRL_ClearDecparam
	ldr	r3, [r4, #8]
	cmp	r3, #3
	bhi	.L235
	add	r3, r3, #8
	add	r5, r5, r3, lsl #2
	str	r7, [r5, #52]
.L212:
	mov	r0, r6
	bl	VDMDRV_Reset
	mov	r0, r6
	bl	VDMDRV_ActivateVDH
.L193:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L209:
	rsb	r7, r7, r9
	mov	r3, r6
	add	r5, r5, r7
	sub	r2, fp, #188
	ldr	r4, .L247+4
	ldr	r1, [r5, #4]
	ldr	r0, [r5, #8]
	bl	VCTRL_VdmPostProc
	ldr	r0, [r5, #8]
	bl	VCTRL_ClearDecparam
	ldr	r3, [r5, #8]
	cmp	r3, #3
	bhi	.L235
	add	r3, r3, #8
	mov	r2, #0
	add	r3, r4, r3, lsl #2
	str	r2, [r3, #52]
	b	.L212
.L241:
	ldr	r3, [fp, #-204]
	mov	r2, r6
	ldr	r1, [r4, #40]
	ldr	r0, [r3, #4]
	bl	PostPro_SetFullRepair
	mov	ip, #0
	ldrb	r3, [fp, #-48]	@ zero_extendqisi2
	movw	r1, #574
	str	ip, [r10, #4]
	ldr	r2, .L247+28
	str	r0, [r4, #4]
	mov	r0, ip
	bl	dprint_normal
	b	.L199
.L235:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L212
.L240:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L193
.L243:
	mov	r3, r6
	sub	r2, fp, #188
	ldr	r0, [r4, #8]
	bl	VCTRL_VdmPostProc
	ldr	r0, [r4, #8]
	bl	VCTRL_ClearDecparam
	ldr	r3, [r4, #8]
	cmp	r3, #3
	bhi	.L235
	add	r3, r3, #8
	mov	r2, #0
	add	r10, r10, r3, lsl #2
	str	r2, [r10, #52]
	b	.L212
.L245:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L216
.L242:
	mov	r2, r8
	mov	r1, #0
	mov	r0, r6
	bl	VDMDRV_AdjustErrRatio
	b	.L200
.L244:
	ldr	r2, [fp, #-52]
	mov	r1, r6
	mov	r0, #3
	bl	VDMDRV_StartRepair
	ldr	ip, .L247+32
	sub	r2, r9, r6, asl #2
	ldr	r0, [r4, #8]
	movw	r1, #613
	ldr	r3, .L247+36
	str	r1, [sp]
	add	r2, r2, ip
	mov	r1, #7
	bl	RecordPOS
	b	.L193
.L246:
	ldr	r2, [fp, #-52]
	mov	r1, r6
	mov	r0, #2
	sub	r6, r9, r6, asl #2
	bl	VDMDRV_StartRepair
	ldr	r2, .L247+32
	ldr	r0, [r4, #8]
	mov	r1, #660
	ldr	r3, .L247+40
	add	r2, r6, r2
	str	r1, [sp]
	mov	r1, #7
	bl	RecordPOS
	b	.L193
.L248:
	.align	2
.L247:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	.word	.LC14
	.word	.LC16
	.word	g_EventReportFunc
	.word	g_vdm_hal_fun_ptr
	.word	.LC15
	.word	g_VfmwGlobalStat+4
	.word	.LANCHOR1+272
	.word	.LANCHOR1+304
	UNWIND(.fnend)
	.size	VDMDRV_AfterDec, .-VDMDRV_AfterDec
	.align	2
	.global	VDMDRV_CheckDevice
	.type	VDMDRV_CheckDevice, %function
VDMDRV_CheckDevice:
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
	ldr	r4, .L268
	mov	r7, r0, asl #4
	mov	r6, r0, asl #6
	rsb	r3, r7, r6
	mov	r5, r0
	add	r8, r4, r3
	ldr	r3, [r4, r3]
	cmp	r3, #0
	bne	.L266
	add	r4, r4, r0, lsl #2
	ldr	r0, [r4, #48]
	cmp	r0, #0
	beq	.L265
	cmp	r0, #1
	moveq	r3, #2
	streq	r3, [r4, #48]
	beq	.L265
.L253:
	mov	r0, #1
.L265:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L266:
	ldr	r3, .L268+4
	ldr	r3, [r3]
	blx	r3
	add	r3, r8, #16
	ldr	r2, [r3, #4]
	str	r0, [r8, #24]
	cmp	r0, r2
	bcc	.L251
	clz	r9, r2
	rsb	r2, r2, r0
	mov	r9, r9, lsr #5
	orrs	r9, r9, r2, lsr #31
	bne	.L251
	cmp	r2, #500
	bls	.L253
	ldr	r3, [r8, #8]
	mov	r1, #780
	str	r2, [sp]
	mov	r0, #1
	ldr	r2, .L268+8
	bl	dprint_normal
	ldr	r3, .L268+12
	ldr	r10, [r3]
	cmp	r10, #0
	beq	.L256
	ldr	r0, [r8, #8]
	mov	r3, r9
	mov	r2, r9
	mov	r1, #20
	blx	r10
.L256:
	ldr	r3, .L268+16
	ldr	r2, [r3, #68]
	cmp	r2, #0
	beq	.L257
	mov	r0, r5
	blx	r2
.L258:
	rsb	r6, r7, r6
	mov	r3, #1
	add	r8, r4, r6
	mov	r0, r5
	mov	r1, #0
	str	r3, [r8, #28]
	mov	r5, r1
	bl	VDMDRV_AfterDec
	ldr	r3, [r8, #8]
	str	r5, [r8, #28]
	cmp	r3, #3
	str	r5, [r4, r6]
	ldr	r2, .L268
	bhi	.L267
	add	r3, r3, #8
	mov	r0, r5
	add	r3, r2, r3, lsl #2
	str	r5, [r3, #52]
	b	.L265
.L251:
	str	r0, [r3, #4]
	b	.L253
.L267:
	bl	VDMDRV_ClearChanIsDec.part.4
	mov	r0, r5
	b	.L265
.L257:
	movw	r3, #791
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L268+20
	bl	dprint_normal
	b	.L258
.L269:
	.align	2
.L268:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC17
	.word	g_EventReportFunc
	.word	g_vdm_hal_fun_ptr
	.word	.LC4
	UNWIND(.fnend)
	.size	VDMDRV_CheckDevice, .-VDMDRV_CheckDevice
	.align	2
	.global	VDMDRV_GetMb0QpInCurrPic
	.type	VDMDRV_GetMb0QpInCurrPic, %function
VDMDRV_GetMb0QpInCurrPic:
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
	ldr	r2, .L271
	mov	r3, #184
	mla	r0, r3, r0, r2
	ldr	r0, [r0, #124]
	and	r0, r0, #31
	ldmfd	sp, {fp, sp, pc}
.L272:
	.align	2
.L271:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_GetMb0QpInCurrPic, .-VDMDRV_GetMb0QpInCurrPic
	.align	2
	.global	VDMDRV_GetSwitchRounding
	.type	VDMDRV_GetSwitchRounding, %function
VDMDRV_GetSwitchRounding:
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
	ldr	r2, .L274
	mov	r3, #184
	mla	r0, r3, r0, r2
	ldr	r0, [r0, #128]
	and	r0, r0, #1
	ldmfd	sp, {fp, sp, pc}
.L275:
	.align	2
.L274:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_GetSwitchRounding, .-VDMDRV_GetSwitchRounding
	.global	__aeabi_uidiv
	.align	2
	.global	VDMDRV_IsrProcess
	.type	VDMDRV_IsrProcess, %function
VDMDRV_IsrProcess:
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
	subs	r4, r0, #0
	ble	.L277
	mov	r0, #0
	str	r4, [sp]
	str	r0, [sp, #4]
	movw	r1, #1064
	ldr	r3, .L355
	ldr	r2, .L355+4
	bl	dprint_normal
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L277:
	ldr	r9, .L355+8
	mov	r0, #9
	bl	VCTRL_RecordPosTime
	mov	r10, r4, asl #4
	mov	r0, #0
	mov	r5, r4, asl #6
	ldr	r3, [r9, #12]
	ldr	r6, .L355+12
	blx	r3
	rsb	r3, r10, r5
	add	r3, r6, r3
	ldr	r8, [r3, #8]
	cmp	r8, #3
	bhi	.L345
	ldr	r3, .L355+16
	ldr	r7, .L355+20
	ldr	r3, [r3, r8, asl #2]
	cmp	r3, #0
	addne	r3, r3, #204800
	ldrne	r3, [r3, #3276]
	str	r3, [fp, #-52]
	ldr	r3, [r7, #148]
	cmp	r3, #0
	beq	.L321
	mov	r1, r4
	mov	r0, #2
	blx	r3
	ldr	r3, [r7, #148]
	cmp	r3, #0
	str	r0, [fp, #-48]
	beq	.L322
	mov	r1, r4
	mov	r0, #1
	blx	r3
	ldr	r3, [r7, #148]
	cmp	r3, #0
	streq	r3, [fp, #-56]
	str	r0, [fp, #-60]
	beq	.L282
	mov	r1, r4
	mov	r0, #3
	blx	r3
	str	r0, [fp, #-56]
.L282:
	ldr	r3, [r7, #152]
	cmp	r3, #0
	beq	.L283
	mov	r1, r4
	mov	r0, #2
	blx	r3
	ldr	r3, .L355+16
	ldr	r2, [r3, r8, asl #2]
	sub	r3, r0, #1
	cmp	r2, #0
	cmpeq	r0, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	beq	.L346
	ldr	r2, [fp, #-48]
	cmp	r2, #1
	beq	.L287
	ldr	r2, [fp, #-52]
	cmp	r2, #1
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r3, #0
	bne	.L287
.L319:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	bne	.L293
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-60]
	cmp	r3, #1
	cmpeq	r2, #1
	beq	.L293
	ldr	r3, [r7, #124]
	cmp	r3, #0
	beq	.L292
	mov	r0, r4
	blx	r3
	cmp	r0, #0
	bne	.L293
.L292:
	ldr	r3, [r7, #148]
	cmp	r3, #0
	beq	.L291
	mov	r1, r4
	mov	r0, #1
	blx	r3
	cmp	r0, #0
	beq	.L291
.L293:
	rsb	r5, r10, r5
	add	r6, r6, r5
	ldr	r0, [r6, #8]
	bl	VCTRL_InformVdmFree
	ldr	r3, [r9, #16]
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L283:
	ldr	r3, [fp, #-48]
	cmp	r3, #1
	bne	.L319
.L287:
	ldr	r2, [r7, #140]
	cmp	r2, #0
	beq	.L347
	mov	r0, r4
	blx	r2
.L296:
	ldr	r2, [r7, #80]
	cmp	r2, #0
	beq	.L297
	mov	r0, r4
	blx	r2
.L298:
	rsb	r0, r10, r5
	ldr	r2, .L355+24
	add	r0, r6, r0
	movw	ip, #1098
	ldr	r3, .L355+28
	mov	r1, #6
	ldr	r0, [r0, #8]
	mov	r7, r4, asl #2
	str	ip, [sp]
	ldr	r8, .L355+32
	add	r2, r2, r0, lsl #2
	bl	RecordPOS
	ldr	r3, [r9]
	blx	r3
	rsb	r3, r7, r5
	add	lr, r8, r3
	ldr	r2, [lr, #4]
	cmp	r2, #0
	beq	.L300
	ldr	ip, [r8, r3]
	add	r1, ip, #49920
	add	r1, r1, #80
	cmp	r2, r1
	strhi	r2, [r8, r3]
	movhi	r1, #0
	strhi	r1, [fp, #-52]
	mov	r1, #184
	ldrls	r3, [lr, #8]
	mla	r1, r1, r4, r6
	movhi	ip, r2
	strls	r3, [fp, #-52]
	rsb	ip, ip, r0
	rsb	r0, r2, r0
	ldr	r2, [fp, #-52]
	rsb	r3, r7, r5
	str	ip, [fp, #-48]
	add	r3, r8, r3
	add	r2, r0, r2
	ldr	r1, [r1, #140]
	cmp	ip, #1000
	mov	r0, r2
	ldr	ip, [r3, #28]
	str	r2, [fp, #-56]
	mov	r2, #0
	str	r2, [r3, #4]
	add	r2, r3, #8
	str	r2, [fp, #-64]
	ldr	r2, [r3, #32]
	str	r0, [r3, #8]
	add	r0, ip, #1
	add	r2, r2, r1, lsr #10
	str	r0, [r3, #28]
	str	r2, [r3, #32]
	str	r0, [fp, #-60]
	str	r2, [fp, #-52]
	ldr	r3, .L355+12
	bcc	.L300
	rsb	r2, r10, r5
	add	r3, r3, r2
	ldr	r1, [r3, #16]
	cmp	r1, #0
	bne	.L304
	ldr	r3, [fp, #-64]
	ldr	r0, [r3, #4]
.L305:
	mov	r2, #1000
	ldr	r1, [fp, #-48]
	mul	r0, r2, r0
	bl	__aeabi_uidiv
	rsb	r3, r7, r5
	add	r7, r8, r3
	ldr	r1, [fp, #-48]
	add	r2, r7, #24
	str	r2, [fp, #-64]
	mov	r2, #1000
	str	r3, [fp, #-68]
	str	r0, [r7, #20]
	ldr	r0, [fp, #-56]
	mul	r0, r2, r0
	bl	__aeabi_uidiv
	mov	r2, #1000
	ldr	r1, [fp, #-48]
	str	r0, [r7, #16]
	ldr	r0, [fp, #-60]
	mul	r0, r2, r0
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-48]
	mov	r1, #0
	str	r1, [r7, #32]
	str	r2, [r7, #36]
	str	r3, [r7, #40]
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-68]
	str	r1, [r2, #4]
	str	r1, [r8, r3]
	str	r0, [r7, #24]
.L300:
	rsb	r3, r10, r5
	ldr	r0, .L355+12
	add	r2, r6, r3
	ldr	r1, [r2, #44]
	ldr	r7, [r2, #8]
	cmp	r1, #1
	beq	.L348
	ldr	r3, [r0, r3]
	cmp	r3, #0
	beq	.L308
	ldr	r8, [r2, #40]
	cmp	r8, #0
	beq	.L349
.L308:
	mov	r0, r7
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	bne	.L350
	mov	r0, r7
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L351
	rsb	r3, r10, r5
	ldr	r2, .L355+36
	add	r3, r6, r3
	mov	r7, #100
	ldr	r3, [r3, #8]
	mla	r7, r7, r3, r2
	add	r7, r7, #24
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L352
.L318:
	mov	r1, #1
	mov	r0, r4
	bl	VDMDRV_AfterDec
.L311:
	rsb	r5, r10, r5
	add	r5, r6, r5
	ldr	r0, [r5, #8]
	mov	r5, #184
	mla	r4, r5, r4, r6
	bl	VCTRL_InformVdmFree
	ldr	r3, [r9, #16]
	mov	r0, #0
	blx	r3
	mov	r0, #1
	ldr	r1, [r4, #140]
	bl	VCTRL_RecordData
	mov	r0, #10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VCTRL_RecordPosTime
.L350:
	movw	r3, #1039
	str	r7, [sp]
	mov	r1, r3
	ldr	r2, .L355+40
	mov	r0, #0
	bl	dprint_normal
.L307:
	rsb	r2, r10, r5
	ldr	r1, .L355+12
	add	r2, r6, r2
	ldr	r3, [r2, #8]
	cmp	r3, #3
	bhi	.L353
	add	r3, r3, #8
	mov	r2, #0
	add	r3, r1, r3, lsl #2
	str	r2, [r3, #52]
.L312:
	rsb	r3, r10, r5
	mov	r2, #0
	str	r2, [r6, r3]
	b	.L311
.L321:
	str	r3, [fp, #-60]
	str	r3, [fp, #-48]
	str	r3, [fp, #-56]
	b	.L282
.L345:
	movw	r1, #901
	ldr	r3, .L355+44
	str	r1, [sp]
	mov	r0, #32
	ldr	r2, .L355+48
	bl	dprint_normal
	b	.L293
.L346:
	ldr	r3, .L355+20
	ldr	r2, [r3, #80]
	cmp	r2, #0
	beq	.L285
	mov	r0, r4
	blx	r2
.L291:
	rsb	r2, r10, r5
	ldr	r1, .L355+12
	add	r2, r6, r2
	ldr	r3, [r2, #8]
	cmp	r3, #3
	bhi	.L354
	add	r3, r3, #8
	mov	r2, #0
	add	r3, r1, r3, lsl #2
	str	r2, [r3, #52]
.L295:
	rsb	r3, r10, r5
	mov	r2, #0
	str	r2, [r6, r3]
	b	.L293
.L304:
	ldr	r0, [fp, #-52]
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-64]
	str	r0, [r3, #4]
	b	.L305
.L297:
	movw	r3, #1096
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L355+52
	bl	dprint_normal
	b	.L298
.L347:
	movw	r3, #1094
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L355+52
	bl	dprint_normal
	b	.L296
.L353:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L312
.L352:
	ldr	r3, [r9]
	blx	r3
	str	r0, [r7, #4]
	b	.L318
.L348:
	mov	r0, r7
	mov	r1, r4
	bl	VCTRL_VdmProcSedOnly
	b	.L307
.L351:
	movw	r3, #1045
	str	r7, [sp]
	mov	r1, r3
	ldr	r2, .L355+56
	bl	dprint_normal
	b	.L307
.L349:
	ldr	r2, .L355+60
	movw	r1, #1027
	mov	r0, r8
	bl	dprint_normal
	mov	r0, r7
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L307
	mov	r2, r8
	mov	r0, r7
	mov	r3, r4
	mov	r1, #100
	bl	VCTRL_VdmPostProc
	b	.L307
.L354:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L295
.L285:
	movw	r3, #915
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L355+52
	bl	dprint_normal
	b	.L291
.L322:
	str	r3, [fp, #-60]
	str	r3, [fp, #-56]
	b	.L282
.L356:
	.align	2
.L355:
	.word	.LANCHOR1+332
	.word	.LC18
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR0+300
	.word	.LANCHOR1+376
	.word	g_VfmwGlobalStat
	.word	g_VfmwChanStat
	.word	.LC21
	.word	.LANCHOR1+352
	.word	.LC19
	.word	.LC4
	.word	.LC22
	.word	.LC20
	UNWIND(.fnend)
	.size	VDMDRV_IsrProcess, .-VDMDRV_IsrProcess
	.align	2
	.global	VDMDRV_MMUIntServeProc
	.type	VDMDRV_MMUIntServeProc, %function
VDMDRV_MMUIntServeProc:
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
	subs	r5, r0, #0
	bne	.L378
	ldr	r6, .L381
	ldr	r4, .L381+4
	ldr	r3, [r6, #12]
	blx	r3
	ldr	r3, [r4, #96]
	cmp	r3, #0
	beq	.L363
	mov	r1, r5
	mov	r0, #5
	blx	r3
	ldr	r3, [r4, #96]
	cmp	r3, #0
	moveq	r8, r3
	moveq	r5, r8
	mov	r7, r0
	andeq	r9, r0, #15
	beq	.L360
	mov	r1, r5
	mov	r0, #6
	blx	r3
	ldr	r3, [r4, #96]
	and	r9, r7, #15
	cmp	r3, #0
	mov	r8, r0
	beq	.L369
	mov	r1, r5
	mov	r0, #7
	blx	r3
	mov	r5, r0
.L360:
	cmp	r9, #0
	beq	.L363
	tst	r7, #4
	bne	.L379
.L364:
	tst	r7, #8
	bne	.L380
.L363:
	ldr	r2, [r4, #84]
	cmp	r2, #0
	beq	.L366
	mov	r0, #0
	blx	r2
.L367:
	ldr	r3, [r6, #16]
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L378:
	movw	r1, #1135
	ldr	r3, .L381+8
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L381+12
	bl	dprint_normal
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L380:
	str	r5, [sp]
	mov	r3, r7
	ldr	r2, .L381+16
	movw	r1, #1157
	mov	r0, #32
	bl	dprint_normal
	b	.L363
.L366:
	movw	r3, #1161
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L381+20
	bl	dprint_normal
	b	.L367
.L379:
	str	r8, [sp]
	mov	r3, r7
	ldr	r2, .L381+24
	mov	r1, #1152
	mov	r0, #32
	bl	dprint_normal
	b	.L364
.L369:
	mov	r5, r3
	b	.L360
.L382:
	.align	2
.L381:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR1+396
	.word	.LC2
	.word	.LC24
	.word	.LC4
	.word	.LC23
	UNWIND(.fnend)
	.size	VDMDRV_MMUIntServeProc, .-VDMDRV_MMUIntServeProc
	.align	2
	.global	VDMDRV_IsVdmInISR
	.type	VDMDRV_IsVdmInISR, %function
VDMDRV_IsVdmInISR:
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
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VDMDRV_IsVdmInISR, .-VDMDRV_IsVdmInISR
	.align	2
	.global	VDMDRV_WakeUpVdm
	.type	VDMDRV_WakeUpVdm, %function
VDMDRV_WakeUpVdm:
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
	bl	VDMDRV_CheckDevice
	cmp	r0, #0
	ldmnefd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDMDRV_ActivateVDH
	UNWIND(.fnend)
	.size	VDMDRV_WakeUpVdm, .-VDMDRV_WakeUpVdm
	.align	2
	.global	VDMDRV_SetStateIdle
	.type	VDMDRV_SetStateIdle, %function
VDMDRV_SetStateIdle:
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
	cmp	r0, #0
	ldreq	r3, .L388
	streq	r0, [r3]
	ldmeqfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDMDRV_SetStateIdle.part.9
.L389:
	.align	2
.L388:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_SetStateIdle, .-VDMDRV_SetStateIdle
	.align	2
	.global	VDMDRV_IsVdmIdle
	.type	VDMDRV_IsVdmIdle, %function
VDMDRV_IsVdmIdle:
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
	ldr	r2, .L391
	mov	r3, r0, asl #6
	sub	r0, r3, r0, asl #4
	ldr	r0, [r2, r0]
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L392:
	.align	2
.L391:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_IsVdmIdle, .-VDMDRV_IsVdmIdle
	.align	2
	.global	VDMDRV_GetCurrChanID
	.type	VDMDRV_GetCurrChanID, %function
VDMDRV_GetCurrChanID:
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
	ldr	r3, .L394
	mov	r2, r0, asl #6
	sub	r0, r2, r0, asl #4
	add	r0, r3, r0
	ldr	r0, [r0, #8]
	ldmfd	sp, {fp, sp, pc}
.L395:
	.align	2
.L394:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_GetCurrChanID, .-VDMDRV_GetCurrChanID
	.align	2
	.global	VDMDRV_WaitVdmReadyIfNoIsr
	.type	VDMDRV_WaitVdmReadyIfNoIsr, %function
VDMDRV_WaitVdmReadyIfNoIsr:
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
	ldr	r6, .L405
	mov	r5, r0
	mov	r4, #0
	b	.L398
.L400:
	add	r4, r4, #1
	cmp	r4, #400
	beq	.L399
.L398:
	ldr	r3, [r6, #120]
	mov	r0, r5
	cmp	r3, #0
	beq	.L400
	blx	r3
	cmp	r0, #0
	beq	.L400
.L399:
	cmp	r4, #400
	movcc	r0, #0
	movcs	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L406:
	.align	2
.L405:
	.word	g_vdm_hal_fun_ptr
	UNWIND(.fnend)
	.size	VDMDRV_WaitVdmReadyIfNoIsr, .-VDMDRV_WaitVdmReadyIfNoIsr
	.align	2
	.global	VDMDRV_ResetVDH
	.type	VDMDRV_ResetVDH, %function
VDMDRV_ResetVDH:
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
	cmp	r0, #3
	bhi	.L408
	ldr	r4, .L415
	ldr	r3, [r4, #8]
	cmp	r3, r0
	beq	.L414
.L407:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L408:
	movw	r1, #1242
	ldr	r3, .L415+4
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L415+8
	bl	dprint_normal
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L414:
	ldr	r3, .L415+12
	ldr	r2, [r3, #68]
	cmp	r2, #0
	beq	.L411
	mov	r0, #0
	blx	r2
.L412:
	mov	r3, #0
	str	r3, [r4]
	b	.L407
.L411:
	movw	r3, #1257
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L415+16
	bl	dprint_normal
	b	.L412
.L416:
	.align	2
.L415:
	.word	.LANCHOR0
	.word	.LANCHOR1+420
	.word	.LC2
	.word	g_vdm_hal_fun_ptr
	.word	.LC4
	UNWIND(.fnend)
	.size	VDMDRV_ResetVDH, .-VDMDRV_ResetVDH
	.align	2
	.global	VDMDRV_MarkReloadDsp
	.type	VDMDRV_MarkReloadDsp, %function
VDMDRV_MarkReloadDsp:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	subs	ip, r0, #0
	mov	r0, r1
	movwne	r1, #1271
	bne	.L424
	add	r3, r0, #1
	cmp	r3, #4
	bhi	.L425
	ldr	r3, .L426
	cmn	r0, #1
	mov	r2, #1
	str	r2, [r3, #36]
	beq	.L417
	ldr	r4, .L426+4
	mvn	r6, #0
	mov	lr, #1280
	ldr	r3, .L426+8
	mov	r1, lr
	ldr	r2, .L426+12
	ldr	r5, [r4, r0, asl #2]
	mov	r0, #20
	ldr	r4, [r4]
	str	r6, [r5, #36]
	ldr	r4, [r4, #36]
	str	ip, [sp, #4]
	str	lr, [sp]
	str	r4, [sp, #8]
	bl	dprint_normal
.L417:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L425:
	movw	r1, #1272
.L424:
	ldr	r3, .L426+8
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L426+16
	bl	dprint_normal
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L427:
	.align	2
.L426:
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	.word	.LANCHOR1+436
	.word	.LC26
	.word	.LC25
	UNWIND(.fnend)
	.size	VDMDRV_MarkReloadDsp, .-VDMDRV_MarkReloadDsp
	.align	2
	.global	VDMDRV_UpdateMatchMode
	.type	VDMDRV_UpdateMatchMode, %function
VDMDRV_UpdateMatchMode:
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
	UNWIND(.pad #16)
	sub	sp, sp, #16
	cmp	r0, #0
	mov	ip, r1
	movwne	r1, #1288
	bne	.L432
	cmp	ip, #3
	bhi	.L433
	ldr	r2, .L434
	movw	lr, #1293
	mov	r4, #1
	mov	r1, lr
	ldr	r3, .L434+4
	mov	r0, #20
	ldr	r5, [r2, ip, asl #2]
	ldr	r2, .L434+8
	str	r4, [r5, #36]
	stmib	sp, {r4, ip}
	str	lr, [sp]
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L433:
	movw	r1, #1289
.L432:
	ldr	r3, .L434+4
	mov	r0, #32
	str	r1, [sp]
	ldr	r2, .L434+12
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L435:
	.align	2
.L434:
	.word	s_pstVfmwChan
	.word	.LANCHOR1+460
	.word	.LC27
	.word	.LC25
	UNWIND(.fnend)
	.size	VDMDRV_UpdateMatchMode, .-VDMDRV_UpdateMatchMode
	.global	g_VdmExtParam
	.global	g_VdmDrvParam
	.global	g_Use_FFAPT_Enable
	.global	g_ChanCtx
	.global	g_BackUp
	.global	g_DecReport
	.global	g_RepairParam
	.global	g_HwMem
	.global	g_UpMsg
	.section	.rodata
	.align	2
.LANCHOR1 = . + 0
	.type	__func__.9963, %object
	.size	__func__.9963, 22
__func__.9963:
	.ascii	"VDMDRV_ClearChanIsDec\000"
	.space	2
	.type	__func__.10167, %object
	.size	__func__.10167, 20
__func__.10167:
	.ascii	"VDMDRV_SetStateIdle\000"
	.type	__func__.9888, %object
	.size	__func__.9888, 12
__func__.9888:
	.ascii	"VDMDRV_Init\000"
	.type	__func__.9892, %object
	.size	__func__.9892, 13
__func__.9892:
	.ascii	"VDMDRV_Reset\000"
	.space	3
	.type	__func__.9902, %object
	.size	__func__.9902, 19
__func__.9902:
	.ascii	"VDMDRV_SetPriority\000"
	.space	1
	.type	__func__.9930, %object
	.size	__func__.9930, 20
__func__.9930:
	.ascii	"VDMDRV_PrepareSleep\000"
	.type	__func__.9934, %object
	.size	__func__.9934, 21
__func__.9934:
	.ascii	"VDMDRV_GetSleepStage\000"
	.space	3
	.type	__func__.9938, %object
	.size	__func__.9938, 18
__func__.9938:
	.ascii	"VDMDRV_ForceSleep\000"
	.space	2
	.type	__func__.9942, %object
	.size	__func__.9942, 17
__func__.9942:
	.ascii	"VDMDRV_ExitSleep\000"
	.space	3
	.type	__func__.9959, %object
	.size	__func__.9959, 20
__func__.9959:
	.ascii	"VDMDRV_SetChanIsDec\000"
	.type	__func__.9977, %object
	.size	__func__.9977, 19
__func__.9977:
	.ascii	"VDMDRV_ChnDecReady\000"
	.space	1
	.type	__func__.9995, %object
	.size	__func__.9995, 14
__func__.9995:
	.ascii	"VDMDRV_IsCopy\000"
	.space	2
	.type	__func__.10009, %object
	.size	__func__.10009, 19
__func__.10009:
	.ascii	"VDMDRV_PrepairCopy\000"
	.space	1
	.type	__func__.10021, %object
	.size	__func__.10021, 19
__func__.10021:
	.ascii	"VDMDRV_DoBeforeDec\000"
	.space	1
	.type	__func__.10054, %object
	.size	__func__.10054, 29
__func__.10054:
	.ascii	"VDMDRV_AfterDecProcessNormal\000"
	.space	3
	.type	__func__.10068, %object
	.size	__func__.10068, 27
__func__.10068:
	.ascii	"VDMDRV_AfterOuterPicRepair\000"
	.space	1
	.type	__func__.10145, %object
	.size	__func__.10145, 18
__func__.10145:
	.ascii	"VDMDRV_IsrProcess\000"
	.space	2
	.type	__func__.10130, %object
	.size	__func__.10130, 24
__func__.10130:
	.ascii	"VDMDRV_IsValidInterrupt\000"
	.type	__FUNCTION__.10146, %object
	.size	__FUNCTION__.10146, 18
__FUNCTION__.10146:
	.ascii	"VDMDRV_IsrProcess\000"
	.space	2
	.type	__func__.10153, %object
	.size	__func__.10153, 23
__func__.10153:
	.ascii	"VDMDRV_MMUIntServeProc\000"
	.space	1
	.type	__func__.10186, %object
	.size	__func__.10186, 16
__func__.10186:
	.ascii	"VDMDRV_ResetVDH\000"
	.type	__func__.10195, %object
	.size	__func__.10195, 21
__func__.10195:
	.ascii	"VDMDRV_MarkReloadDsp\000"
	.space	3
	.type	__func__.10200, %object
	.size	__func__.10200, 23
__func__.10200:
	.ascii	"VDMDRV_UpdateMatchMode\000"
	.data
	.align	2
	.type	g_Use_FFAPT_Enable, %object
	.size	g_Use_FFAPT_Enable, 4
g_Use_FFAPT_Enable:
	.word	1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"Chan %d: CorrectType = %d ErrRatio = %d \012\000" )
	.space	2
.LC1:
	ASCII(.ascii	"Chan %d: Current frame:%d  ErrRatio = %d\012\000" )
	.space	2
.LC2:
	ASCII(.ascii	"[%s %d]assert warning\012\000" )
	.space	1
.LC3:
	ASCII(.ascii	"====== forece VDM sleep! ======\012\000" )
	.space	3
.LC4:
	ASCII(.ascii	"VDMHAL_NULL_FUN_PRINT,L%d\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"%s The channel %d is not active\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"The channel %d is decoding\012\000" )
.LC7:
	ASCII(.ascii	"The channel %d DEC PARAM is not ready\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"%s ERROR: pDecParam = NULL!\012\000" )
	.space	3
.LC9:
	ASCII(.ascii	"%s VidStd %d prepair repair failed!\012\000" )
	.space	3
.LC10:
	ASCII(.ascii	"%s VidStd %d no need repair copy\012\000" )
	.space	2
.LC11:
	ASCII(.ascii	"The channel %d DEC PARAM is not ready(pDecParam == " )
	ASCII(.ascii	"NULL)\012\000" )
	.space	2
.LC12:
	ASCII(.ascii	"VDM prepair copy failed!\012\000" )
	.space	2
.LC13:
	ASCII(.ascii	"VDM prepair decode failed!\012\000" )
.LC14:
	ASCII(.ascii	"isr begin: *pVdmStateMachine = %d, timeout = %d, Er" )
	ASCII(.ascii	"rRatio = %d\012\000" )
.LC15:
	ASCII(.ascii	"ISR process vdm timeout! FromInt = %d\012\000" )
	.space	1
.LC16:
	ASCII(.ascii	"Chan %d VdmStateMachine=%d Error! FromInt = %d.\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC17:
	ASCII(.ascii	"Chan %d VDM Time Out(%d ms), Reset VDM!\012\000" )
	.space	3
.LC18:
	ASCII(.ascii	"%s: VdhId(%d) > %d\012\000" )
.LC19:
	ASCII(.ascii	"%s %d: ASSERT return!\012\000" )
	.space	1
.LC20:
	ASCII(.ascii	"vdm state machine = %d, but DecParam is null!\012\000" )
	.space	1
.LC21:
	ASCII(.ascii	"line :%d ISR called but chan %d is not active!\012\000" )
.LC22:
	ASCII(.ascii	"line :%d ISR called chan %d is active! But Dec Para" )
	ASCII(.ascii	"m in CTX is NULL!!!\012\000" )
.LC23:
	ASCII(.ascii	"SMMU_READ_ERR  MODULE : VFMW \011 SMMU INT STATE: 0" )
	ASCII(.ascii	"x%x \011 read_err_addr  = 0x%x\012\000" )
	.space	3
.LC24:
	ASCII(.ascii	"SMMU_WRITE_ERR MODULE : VFMW \011 SMMU INT STATE: 0" )
	ASCII(.ascii	"x%x \011 write_err_addr = 0x%x\012\000" )
	.space	3
.LC25:
	ASCII(.ascii	"%s %d: ASSERT!\012\000" )
.LC26:
	ASCII(.ascii	"%s,%d, i = %d, MatchVdhIdPlus1 = %d\012\000" )
	.space	3
.LC27:
	ASCII(.ascii	"%s,%d, MatchVdhIdPlus1 = %d,chanId = %d\012\000" )
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	g_VdmDrvParam, %object
	.size	g_VdmDrvParam, 48
g_VdmDrvParam:
	.space	48
	.type	s_eVdmDrvSleepState, %object
	.size	s_eVdmDrvSleepState, 4
s_eVdmDrvSleepState:
	.space	4
	.type	g_ChanCtx, %object
	.size	g_ChanCtx, 48
g_ChanCtx:
	.space	48
	.type	last_rec_pos_time.10019, %object
	.size	last_rec_pos_time.10019, 16
last_rec_pos_time.10019:
	.space	16
	.type	g_BackUp, %object
	.size	g_BackUp, 184
g_BackUp:
	.space	184
	.type	LastRecPosTime.10142, %object
	.size	LastRecPosTime.10142, 16
LastRecPosTime.10142:
	.space	16
	.type	g_VdmExtParam, %object
	.size	g_VdmExtParam, 44
g_VdmExtParam:
	.space	44
	.type	g_DecReport, %object
	.size	g_DecReport, 820
g_DecReport:
	.space	820
	.type	g_RepairParam, %object
	.size	g_RepairParam, 3312
g_RepairParam:
	.space	3312
	.type	g_HwMem, %object
	.size	g_HwMem, 1000
g_HwMem:
	.space	1000
	.type	g_UpMsg, %object
	.size	g_UpMsg, 3200
g_UpMsg:
	.space	3200
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
