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
	ldr	r4, .L17
	mov	r7, r0, asl #3
	mov	r5, r0, asl #6
	rsb	ip, r7, r5
	subs	r3, r1, #0
	add	ip, r4, ip
	mov	r6, r2
	add	r2, ip, #8
	ldr	r8, [ip, #8]
	beq	.L7
	cmp	r3, #2
	bls	.L14
	ldr	r1, [r2, #4]
	sub	r3, fp, #36
	ldr	r2, [ip, #48]
	str	r0, [r3, #-12]!
	mov	r0, r3
	str	r1, [fp, #-44]
	str	r2, [fp, #-40]
	bl	PostPro_GetErrRatio
	ldr	r9, .L17+4
	cmp	r0, #0
	mov	ip, r0
	str	r0, [r6]
	bne	.L15
.L6:
	rsb	r5, r7, r5
	ldr	r3, [r9, r8, asl #2]
	add	r4, r4, r5
	add	r3, r3, #294912
	ldr	r1, [r4, #12]
	ldr	r2, [r3, #1532]
	sub	r0, r1, #8
	cmp	r1, #5
	cmpne	r0, #1
	add	r2, r2, #1
	str	r2, [r3, #1532]
	movls	r3, #0
	bhi	.L16
.L7:
	str	r3, [r6]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L14:
	mov	ip, #100
	mov	r2, r8
	str	ip, [r6]
	mov	r0, #1
	ldr	r1, .L17+8
	str	ip, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L16:
	ldr	r3, [r6]
	cmp	r3, #100
	movge	r3, #100
	bic	r3, r3, r3, asr #31
	b	.L7
.L15:
	ldr	r3, [r9, r8, asl #2]
	mov	r2, r8
	ldr	r1, .L17+12
	mov	r0, #1
	add	r3, r3, #294912
	ldr	r3, [r3, #1532]
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L6
.L18:
	.align	2
.L17:
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
	mov	r3, #236
	ldr	r2, .L20
	ldr	r1, .L20+4
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L21:
	.align	2
.L20:
	.word	.LANCHOR1
	.word	.LC2
	UNWIND(.fnend)
	.size	VDMDRV_ClearChanIsDec.part.4, .-VDMDRV_ClearChanIsDec.part.4
	.align	2
	.global	VDMDRV_Init
	.type	VDMDRV_Init, %function
VDMDRV_Init:
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
	bne	.L24
	ldr	r5, .L25
	mov	r2, #56
	ldr	r6, .L25+4
	mov	r1, r4
	mov	r0, r5
	ldr	r3, [r6, #48]
	blx	r3
	ldr	r2, .L25+8
	ldr	r3, [r6, #48]
	add	r0, r5, #68
	str	r4, [r5, #60]
	mov	r1, r4
	str	r4, [r2, #20]
	mov	r2, #268
	str	r4, [r5, #56]
	blx	r3
	mov	r3, #4
	str	r3, [r5, #68]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L24:
	mov	r3, #36
	ldr	r2, .L25+12
	ldr	r1, .L25+16
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_VfmwGlobalStat
	.word	.LANCHOR1+24
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
	subs	r1, r0, #0
	bne	.L29
	ldr	r3, .L30
	mov	r2, #56
	ldr	r0, .L30+4
	ldr	r3, [r3, #48]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L29:
	mov	r3, #51
	ldr	r2, .L30+8
	ldr	r1, .L30+12
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L31:
	.align	2
.L30:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LANCHOR1+36
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
	cmp	r0, #0
	beq	.L45
	ldr	r5, .L47
	mov	r4, #0
	sub	r6, r0, #4
	mov	lr, r4
	mov	r7, r4
.L41:
	mov	ip, #0
	mov	r1, r6
	mov	r3, ip
.L35:
	ldr	r2, [r1, #4]!
	cmp	r2, ip
	movgt	lr, r3
	add	r3, r3, #1
	movgt	ip, r2
	cmp	r3, #32
	bne	.L35
	cmp	ip, #0
	ble	.L46
	add	r4, r4, #1
	str	lr, [r5, #4]!
	cmp	r4, #32
	str	r7, [r0, lr, asl #2]
	bne	.L41
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L46:
	cmp	r4, #31
	ldmgtfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, .L47+4
	mov	r2, r4, asl #2
	mvn	r1, #0
.L39:
	add	r4, r4, #1
	add	r3, r0, r2
	cmp	r4, #32
	add	r2, r2, #4
	str	r1, [r3, #464]
	bne	.L39
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L45:
	mov	r3, #65
	ldr	r2, .L47+8
	ldr	r1, .L47+12
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L48:
	.align	2
.L47:
	.word	.LANCHOR0+460
	.word	.LANCHOR0
	.word	.LANCHOR1+52
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
	ldr	r5, .L62
	add	ip, r5, #464
	ldr	r3, [r5, #464]
	cmp	r3, r0
	beq	.L58
	mov	r3, #1
	mov	r2, ip
	b	.L54
.L51:
	add	r3, r3, #1
	cmp	r3, #32
	beq	.L60
.L54:
	ldr	r1, [r2, #4]!
	cmp	r1, r0
	bne	.L51
	cmp	r3, #30
	bgt	.L61
.L50:
	add	r6, r3, #1
	mov	lr, r3
	mov	r6, r6, asl #2
.L55:
	ldr	r0, [ip, r6]
	add	r6, ip, r6
	cmp	r0, #0
	ldmltfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r2, r3, #2
	mov	r2, r2, asl #2
	b	.L53
.L57:
	ldr	r0, [ip, r2]
	add	r2, r2, #4
	cmp	r0, #0
	ldmltfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L53:
	ldr	r4, [ip, lr, asl #2]
	add	r1, r5, r0, lsl #2
	add	r3, r3, #1
	ldr	r7, [r1, #336]
	add	r1, r5, r4, lsl #2
	ldr	r1, [r1, #336]
	cmp	r7, r1
	strge	r0, [ip, lr, asl #2]
	strge	r4, [r6]
	cmp	r3, #30
	add	r6, ip, r2
	mov	lr, r3
	ble	.L57
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L60:
	mov	r3, #0
	mov	r6, #4
	mov	lr, r3
	b	.L55
.L58:
	mov	r3, #0
	b	.L50
.L61:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L63:
	.align	2
.L62:
	.word	.LANCHOR0
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
	cmp	r0, #0
	bne	.L69
	ldr	r3, .L70
	ldr	r0, [r3, #56]
	cmp	r0, #0
	bne	.L68
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r0, r2
	movne	r2, #1
	moveq	r2, #2
	str	r2, [r3, #56]
	ldmfd	sp, {fp, sp, pc}
.L68:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L69:
	mov	r3, #138
	ldr	r2, .L70+4
	ldr	r1, .L70+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L71:
	.align	2
.L70:
	.word	.LANCHOR0
	.word	.LANCHOR1+72
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
	cmp	r0, #0
	bne	.L75
	ldr	r3, .L76
	ldr	r0, [r3, #56]
	ldmfd	sp, {fp, sp, pc}
.L75:
	mov	r3, #163
	ldr	r2, .L76+4
	ldr	r1, .L76+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L77:
	.align	2
.L76:
	.word	.LANCHOR0
	.word	.LANCHOR1+92
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
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #0
	bne	.L84
	ldr	r4, .L85
	ldr	r3, [r4, #56]
	cmp	r3, #2
	beq	.L80
	bl	VDMDRV_Reset
	mov	r3, #2
	str	r3, [r4, #56]
.L80:
	ldr	r1, .L85+4
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L84:
	mov	r3, #169
	ldr	r2, .L85+8
	ldr	r1, .L85+12
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L86:
	.align	2
.L85:
	.word	.LANCHOR0
	.word	.LC3
	.word	.LANCHOR1+116
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
	cmp	r0, #0
	ldreq	r3, .L89
	streq	r0, [r3, #56]
	ldmeqfd	sp, {fp, sp, pc}
	mov	r3, #183
	ldr	r2, .L89+4
	ldr	r1, .L89+8
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L90:
	.align	2
.L89:
	.word	.LANCHOR0
	.word	.LANCHOR1+136
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
	mov	r5, r0
	mov	r0, #8
	mov	r4, r1
	mov	r6, r2
	bl	VCTRL_RecordPosTime
	ldr	r3, .L94
	ldr	r3, [r3, #116]
	cmp	r3, #0
	beq	.L92
	mov	r1, r6
	mov	r0, r4
	blx	r3
.L93:
	mov	r1, r4, asl #6
	ldr	r3, .L94+4
	sub	r1, r1, r4, asl #3
	str	r5, [r3, r1]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L92:
	mov	r0, r3
	mov	r2, #191
	ldr	r1, .L94+8
	bl	dprint_vfmw
	b	.L93
.L95:
	.align	2
.L94:
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
	ldr	r3, .L99
	ldr	r3, [r3, #120]
	cmp	r3, #0
	beq	.L97
	mov	r1, r5
	mov	r0, r4
	blx	r3
.L98:
	mov	r0, r4, asl #6
	ldr	r3, .L99+4
	sub	r0, r0, r4, asl #3
	mov	r2, #1
	str	r2, [r3, r0]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L97:
	mov	r0, r3
	mov	r2, #199
	ldr	r1, .L99+8
	bl	dprint_vfmw
	b	.L98
.L100:
	.align	2
.L99:
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
	cmp	r0, #31
	bhi	.L104
	ldr	r3, .L105
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #592]
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L104:
	mov	r3, #206
	ldr	r2, .L105+4
	ldr	r1, .L105+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L106:
	.align	2
.L105:
	.word	.LANCHOR0
	.word	.LANCHOR1+156
	.word	.LC2
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
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #31
	mov	r4, r0
	movhi	r3, #219
	bhi	.L111
	cmp	r1, #0
	bne	.L112
	ldr	r3, .L113
	mov	r2, #1
	add	r3, r3, r0, lsl #2
	str	r2, [r3, #592]
	bl	VDMDRV_AdjustPriorityAfterDec
	ldr	r3, .L113+4
	mov	r2, r4, asl #6
	add	r4, r2, r4, lsl #3
	add	r4, r3, r4
	ldr	r3, [r4, #24]
	cmp	r3, #4
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, [r4, #60]
	add	r5, r4, #56
	cmp	r3, #0
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L113+8
	ldr	r3, [r3]
	blx	r3
	mov	r3, #5
	str	r3, [r4, #24]
	str	r0, [r4, #60]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L112:
	mov	r3, #220
.L111:
	ldr	r2, .L113+12
	mov	r0, #1
	ldr	r1, .L113+16
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L114:
	.align	2
.L113:
	.word	.LANCHOR0
	.word	g_VfmwChanStat
	.word	vfmw_Osal_Func_Ptr_S
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
	cmp	r0, #31
	bhi	.L117
	add	r0, r0, #64
	ldr	r3, .L118
	mov	r2, #0
	add	r0, r3, r0, lsl #2
	str	r2, [r0, #336]
	ldmfd	sp, {fp, sp, pc}
.L117:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDMDRV_ClearChanIsDec.part.4
.L119:
	.align	2
.L118:
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
	ldr	r3, .L127
	mov	r0, #1
	add	r1, r3, #128
.L122:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	strne	r0, [r2, #16]
	cmp	r3, r1
	bne	.L122
	ldmfd	sp, {fp, sp, pc}
.L128:
	.align	2
.L127:
	.word	s_pstVfmwChan-4
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
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r7, r0
	mov	r0, r1
	mov	r4, r1
	mov	r6, r2
	bl	VCTRL_IsChanActive
	subs	r5, r0, #0
	bne	.L138
	cmp	r4, #31
	bhi	.L139
	ldr	r3, .L143
	add	r3, r3, r4, lsl #2
	ldr	r3, [r3, #592]
	cmp	r3, #0
	bne	.L140
.L133:
	mov	r3, #0
	mov	r0, r4
	str	r3, [r6]
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	str	r0, [r6]
	beq	.L141
	uxtb	r1, r7
	mov	r0, #1
	bl	VDH_TaskInUse
	cmp	r0, #1
	mov	r4, r0
	beq	.L142
.L131:
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L139:
	mov	r3, #206
	ldr	r2, .L143+4
	ldr	r1, .L143+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L133
.L138:
	mov	r3, r4
	ldr	r2, .L143+12
	ldr	r1, .L143+16
	mov	r5, #1
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L140:
	mov	r2, r4
	ldr	r1, .L143+20
	mov	r5, #1
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L142:
	ldr	r1, .L143+24
	mov	r5, r4
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L141:
	mov	r2, r4
	ldr	r1, .L143+28
	mov	r0, #22
	mov	r5, #1
	bl	dprint_vfmw
	b	.L131
.L144:
	.align	2
.L143:
	.word	.LANCHOR0
	.word	.LANCHOR1+156
	.word	.LC2
	.word	.LANCHOR1+196
	.word	.LC5
	.word	.LC6
	.word	.LC8
	.word	.LC7
	UNWIND(.fnend)
	.size	VDMDRV_ChnDecReady, .-VDMDRV_ChnDecReady
	.align	2
	.global	PostPro_CopyYuvByProtocol
	.type	PostPro_CopyYuvByProtocol, %function
PostPro_CopyYuvByProtocol:
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
	sub	r3, r3, #1
	cmp	r3, #11
	ldrls	pc, [pc, r3, asl #2]
	b	.L146
.L148:
	.word	.L147
	.word	.L149
	.word	.L146
	.word	.L146
	.word	.L146
	.word	.L146
	.word	.L146
	.word	.L146
	.word	.L146
	.word	.L150
	.word	.L150
	.word	.L150
.L150:
	ldr	r0, [r0]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	PostPro_CopyYuv_Vp6
.L149:
	ldr	r0, [r0]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	PostPro_CopyYuv_Mpeg4
.L147:
	ldr	r0, [r0]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	PostPro_CopyYuv_Vc1
.L146:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	PostPro_CopyYuvByProtocol, .-PostPro_CopyYuvByProtocol
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
	ldr	r2, .L152
	mov	r3, #180
	mla	r0, r3, r0, r2
	ldr	r0, [r0, #728]
	and	r0, r0, #31
	ldmfd	sp, {fp, sp, pc}
.L153:
	.align	2
.L152:
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
	ldr	r2, .L155
	mov	r3, #180
	mla	r0, r3, r0, r2
	ldr	r0, [r0, #732]
	and	r0, r0, #1
	ldmfd	sp, {fp, sp, pc}
.L156:
	.align	2
.L155:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_GetSwitchRounding, .-VDMDRV_GetSwitchRounding
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
	subs	r5, r0, #0
	bne	.L177
	ldr	r6, .L180
	ldr	r4, .L180+4
	ldr	r3, [r6, #12]
	blx	r3
	ldr	r3, [r4, #104]
	cmp	r3, #0
	beq	.L164
	mov	r1, r5
	mov	r0, #5
	blx	r3
	ldr	r3, [r4, #104]
	cmp	r3, #0
	mov	r7, r0
	beq	.L164
	mov	r1, r5
	mov	r0, #6
	blx	r3
	ldr	r2, [r4, #104]
	and	r8, r7, #7
	cmp	r2, #0
	mov	r9, r0
	beq	.L169
	mov	r1, r5
	mov	r0, #7
	blx	r2
	mov	r5, r0
.L159:
	cmp	r8, #0
	beq	.L164
	cmp	r9, #0
	bne	.L178
.L161:
	cmp	r5, #0
	bne	.L179
.L164:
	ldr	r3, [r4, #92]
	cmp	r3, #0
	beq	.L165
	mov	r0, #0
	blx	r3
.L166:
	ldr	r3, [r6, #16]
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L177:
	movw	r3, #769
	ldr	r2, .L180+8
	ldr	r1, .L180+12
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L179:
	mov	r3, r5
	mov	r2, r7
	ldr	r1, .L180+16
	mov	r0, #32
	bl	dprint_vfmw
	b	.L164
.L165:
	mov	r0, r3
	movw	r2, #806
	ldr	r1, .L180+20
	bl	dprint_vfmw
	b	.L166
.L178:
	mov	r3, r9
	mov	r2, r7
	ldr	r1, .L180+24
	mov	r0, #32
	bl	dprint_vfmw
	b	.L161
.L169:
	mov	r5, r2
	b	.L159
.L181:
	.align	2
.L180:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR1+216
	.word	.LC2
	.word	.LC10
	.word	.LC4
	.word	.LC9
	UNWIND(.fnend)
	.size	VDMDRV_MMUIntServeProc, .-VDMDRV_MMUIntServeProc
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
	ldreq	r3, .L184
	streq	r0, [r3]
	ldmeqfd	sp, {fp, sp, pc}
	movw	r3, #814
	ldr	r2, .L184+4
	ldr	r1, .L184+8
	mov	r0, #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L185:
	.align	2
.L184:
	.word	.LANCHOR0
	.word	.LANCHOR1+240
	.word	.LC2
	UNWIND(.fnend)
	.size	VDMDRV_SetStateIdle, .-VDMDRV_SetStateIdle
	.align	2
	.global	VDMDRV_WaitVdmReadyIfNoIsr
	.type	VDMDRV_WaitVdmReadyIfNoIsr, %function
VDMDRV_WaitVdmReadyIfNoIsr:
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
	ldreq	r5, .L198
	moveq	r4, r0
	beq	.L190
	b	.L197
.L192:
	add	r4, r4, #1
	cmp	r4, #400
	beq	.L191
.L190:
	ldr	r3, [r5, #128]
	mov	r0, #0
	cmp	r3, r0
	beq	.L192
	blx	r3
	cmp	r0, #0
	beq	.L192
.L191:
	cmp	r4, #400
	movcc	r0, #0
	movcs	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L197:
	mov	r3, #824
	ldr	r2, .L198+4
	ldr	r1, .L198+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L199:
	.align	2
.L198:
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR1+260
	.word	.LC2
	UNWIND(.fnend)
	.size	VDMDRV_WaitVdmReadyIfNoIsr, .-VDMDRV_WaitVdmReadyIfNoIsr
	.align	2
	.global	VDMDRV_AvsFirstFldNeedRepair
	.type	VDMDRV_AvsFirstFldNeedRepair, %function
VDMDRV_AvsFirstFldNeedRepair:
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
	cmp	r0, #6
	beq	.L204
.L203:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L204:
	ldrb	r3, [r1, #17]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L203
	ldr	r3, .L205
	movw	r1, #1752
	mla	r2, r1, r2, r3
	ldr	r3, [r2, #944]
	cmp	r3, #0
	movgt	r0, #1
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L206:
	.align	2
.L205:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_AvsFirstFldNeedRepair, .-VDMDRV_AvsFirstFldNeedRepair
	.align	2
	.global	VDMDRV_AvsSecondFldNeedRepair
	.type	VDMDRV_AvsSecondFldNeedRepair, %function
VDMDRV_AvsSecondFldNeedRepair:
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
	cmp	r0, #6
	beq	.L211
.L210:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L211:
	ldrb	r3, [r1, #17]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L210
	ldr	r3, .L212
	movw	r1, #1752
	mla	r2, r1, r2, r3
	ldr	r3, [r2, #920]
	cmp	r3, #0
	movgt	r0, #1
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L213:
	.align	2
.L212:
	.word	.LANCHOR0+900
	UNWIND(.fnend)
	.size	VDMDRV_AvsSecondFldNeedRepair, .-VDMDRV_AvsSecondFldNeedRepair
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
	beq	.L222
	sub	r0, r0, #1
	cmp	r0, #11
	ldrls	pc, [pc, r0, asl #2]
	b	.L221
.L218:
	.word	.L220
	.word	.L219
	.word	.L221
	.word	.L221
	.word	.L221
	.word	.L221
	.word	.L221
	.word	.L221
	.word	.L221
	.word	.L220
	.word	.L220
	.word	.L220
.L220:
	ldrb	r0, [r4, #1]	@ zero_extendqisi2
	sub	r0, r0, #1
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L219:
	ldrb	r0, [r4, #158]	@ zero_extendqisi2
	sub	r0, r0, #1
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L221:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L222:
	ldr	r1, .L223
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L224:
	.align	2
.L223:
	.word	.LC11
	UNWIND(.fnend)
	.size	VDMDRV_IsCopy, .-VDMDRV_IsCopy
	.align	2
	.global	VDMDRV_DoBeforeDec
	.type	VDMDRV_DoBeforeDec, %function
VDMDRV_DoBeforeDec:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 216
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #228)
	sub	sp, sp, #228
	ldr	ip, .L250
	mov	r8, r2
	mov	r4, r0
	mov	r5, r1
	ldrb	r2, [ip]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r3, #0
	streq	r3, [fp, #-252]
	beq	.L226
	ldr	ip, .L250+4
	sub	r0, fp, #232
	mov	r2, #188
	mov	r1, #0
	str	r0, [fp, #-252]
	ldr	r6, [ip, #48]
	blx	r6
.L226:
	ldr	r2, [r8]
	cmp	r2, #0
	beq	.L246
	mov	r3, r4, asl #3
	mov	r0, r5
	str	r3, [fp, #-248]
	mov	r6, r4, asl #6
	mov	r7, r3
	bl	VCTRL_GetVidStd
	ldr	r2, .L250+8
	rsb	r10, r7, r6
	ldr	r9, .L250+12
	ldr	r2, [r2]
	add	r10, r9, r10
	add	r10, r10, #8
	cmp	r2, #0
	str	r0, [r10, #4]
	beq	.L229
	ldr	r1, [r8]
	str	r0, [fp, #-240]
	sub	r0, fp, #244
	str	r5, [fp, #-244]
	str	r1, [fp, #-236]
	blx	r2
	cmp	r0, #1
	mov	r7, r0
	beq	.L228
	ldr	r0, [r10, #4]
.L229:
	ldr	r3, [fp, #-248]
	ldr	r1, [r8]
	rsb	r2, r3, r6
	add	r10, r9, r2
	bl	VDMDRV_IsCopy
	add	r3, r10, #4
	str	r3, [fp, #-256]
	subs	r7, r0, #0
	bne	.L247
	ldr	r2, .L250+16
	ldr	r3, [r2, #124]
	subs	ip, r3, #0
	beq	.L235
	ldr	r1, [r8]
	mov	r2, r4
	ldr	r3, [fp, #-252]
	ldr	r0, [r10, #12]
	blx	ip
	cmp	r0, #0
	beq	.L248
.L235:
	ldr	r1, .L250+20
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r2, [fp, #-256]
	mov	r1, #2
	mov	r0, r4
	bl	VDMDRV_AdjustErrRatio
	ldr	r3, [fp, #-248]
	mov	r2, #0
	mov	r0, r5
	rsb	r6, r3, r6
	mov	r3, r4
	add	r9, r9, r6
	ldr	r1, [r9, #4]
	bl	VCTRL_VdmPostProc
	mov	r0, r4
	bl	VDMDRV_Reset
	cmp	r5, #31
	ldr	r3, .L250+12
	bhi	.L249
	add	r5, r5, #64
	mov	r2, #0
	add	r3, r3, r5, lsl #2
	str	r2, [r3, #336]
.L228:
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L247:
	mov	r0, r8
	ldr	r3, [r10, #12]
	ldr	r2, [fp, #-252]
	mov	r1, r4
	bl	PostPro_CopyYuvByProtocol
	subs	r7, r0, #0
	movne	r7, #0
	bne	.L228
	ldr	r8, .L250+4
	mov	r1, r7
	ldr	r2, [fp, #-256]
	mov	r0, r4
	bl	VDMDRV_AdjustErrRatio
	mov	r1, r4
	ldr	r2, [fp, #-252]
	mov	r0, #2
	bl	VDMDRV_StartRepair
	ldr	r3, [r8]
	blx	r3
	ldr	r3, .L250+24
	ldr	r2, [r8, #4]
	add	r6, r3, r6
	str	r0, [r10, #20]
	str	r0, [r6, #4]
	blx	r2
	mov	r1, r4
	str	r0, [r6, #8]
	mov	r0, r5
	bl	VDMDRV_SetChanIsDec
	ldr	r2, .L250+28
	movw	r3, #413
	mov	r0, r5
	str	r3, [sp]
	add	r2, r2, r5, lsl #2
	ldr	r3, .L250+32
	mov	r1, #7
	bl	RecordPOS
	b	.L228
.L248:
	ldr	r8, .L250+4
	mov	r0, r4
	ldr	r1, [fp, #-252]
	bl	VDMDRV_StartDec
	ldr	r3, [r8]
	blx	r3
	ldr	r3, .L250+24
	ldr	r2, [r8, #4]
	add	r6, r3, r6
	str	r0, [r10, #20]
	str	r0, [r6, #4]
	blx	r2
	mov	r1, r4
	str	r0, [r6, #8]
	mov	r0, r5
	bl	VDMDRV_SetChanIsDec
	ldr	r2, .L250+28
	mov	r0, r5
	movw	r3, #447
	add	r2, r2, r5, lsl #2
	str	r3, [sp]
	mov	r1, #5
	ldr	r3, .L250+32
	bl	RecordPOS
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L249:
	bl	VDMDRV_ClearChanIsDec.part.4
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L246:
	mov	r2, r5
	ldr	r1, .L250+36
	mov	r0, #22
	mov	r7, #1
	bl	dprint_vfmw
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L251:
	.align	2
.L250:
	.word	g_HalDisable
	.word	vfmw_Osal_Func_Ptr_S
	.word	AcceleratorCharacter
	.word	.LANCHOR0
	.word	g_vdm_hal_fun_ptr
	.word	.LC13
	.word	g_VfmwGlobalStat
	.word	.LANCHOR0+2652
	.word	.LANCHOR1+288
	.word	.LC12
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
	ldr	r9, .L258
	mov	r5, r0, asl #6
	ldr	r6, .L258+4
	sub	r5, r5, r0, asl #3
	mov	r8, r0
	mov	r0, #5
	ldr	r3, [r9, #12]
	add	r7, r5, #48
	blx	r3
	ldr	r3, [r6, #464]
	add	r7, r6, r7
	cmp	r3, #0
	blt	.L253
	add	r5, r6, r5
	add	r4, r6, #464
	add	r6, r6, #588
	b	.L254
.L257:
	cmp	r4, r6
	beq	.L253
	ldr	r3, [r4, #4]!
	cmp	r3, #0
	blt	.L253
.L254:
	mov	r1, r3
	mov	r2, r7
	mov	r0, r8
	str	r3, [r5, #8]
	bl	VDMDRV_ChnDecReady
	cmp	r0, #0
	bne	.L257
	mov	r2, r7
	ldr	r1, [r5, #8]
	mov	r0, r8
	bl	VDMDRV_DoBeforeDec
	cmp	r0, #0
	bne	.L257
.L253:
	ldr	r3, [r9, #16]
	mov	r0, #5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L259:
	.align	2
.L258:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_ActivateVDH, .-VDMDRV_ActivateVDH
	.align	2
	.global	VDMDRV_AfterDec
	.type	VDMDRV_AfterDec, %function
VDMDRV_AfterDec:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 352
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #364)
	sub	sp, sp, #364
	ldr	r4, .L325
	mov	r5, r0
	mov	r10, r1
	mov	r2, #148
	mov	r1, #0
	ldr	r3, [r4, #48]
	sub	r0, fp, #380
	blx	r3
	ldr	r3, .L325+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L261
	sub	r6, fp, #232
	ldr	r3, [r4, #48]
	mov	r2, #188
	mov	r1, #0
	mov	r0, r6
	blx	r3
	str	r6, [fp, #-240]
.L261:
	ldr	r3, [r4, #48]
	mov	r2, #136
	ldr	r7, .L325+8
	mov	r1, #0
	sub	r0, fp, #376
	mov	r8, r5, asl #3
	mov	r6, r5, asl #6
	blx	r3
	rsb	r3, r8, r6
	ldr	r9, .L325+12
	add	r4, r7, r3
	strb	r10, [fp, #-236]
	ldr	r3, [r7, r3]
	add	ip, r4, #8
	ldr	r0, [r4, #8]
	cmp	r3, #2
	ldr	r2, [r9, r0, asl #2]
	ldr	r2, [r2, #1240]
	str	r2, [fp, #-380]
	beq	.L263
	cmp	r3, #3
	beq	.L264
	cmp	r3, #1
	beq	.L312
	mov	r2, r0
	str	r10, [sp]
	ldr	r1, .L325+16
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r4, #8]
	cmp	r3, #31
	bhi	.L313
	add	r3, r3, #64
	mov	r2, #0
	add	r7, r7, r3, lsl #2
	str	r2, [r7, #336]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L312:
	ldr	r10, [r4, #28]
	add	r2, r4, #4
	add	r3, r4, #24
	str	r2, [fp, #-392]
	cmp	r10, #1
	beq	.L314
	ldr	r2, [fp, #-392]
	mov	r1, #3
	mov	r0, r5
	bl	VDMDRV_AdjustErrRatio
	ldr	r3, [r4, #4]
	cmp	r3, #0
	beq	.L267
	ldr	r2, .L325+20
	ldr	r10, [r2]
	cmp	r10, #0
	beq	.L267
	sub	r2, fp, #44
	ldr	r0, [r4, #8]
	mov	r1, #114
	str	r3, [r2, #-340]!
	mov	r3, #4
	blx	r10
.L267:
	ldr	r3, [fp, #-380]
	cmp	r3, #1
	beq	.L315
.L268:
	rsb	r4, r8, r6
	ldr	r3, .L325+8
	add	r4, r7, r4
	add	r10, r4, #8
	ldr	r0, [r4, #8]
	ldr	r2, [r9, r0, asl #2]
	add	r2, r2, #294912
	add	r2, r2, #1488
	ldrsb	r2, [r2]
	cmp	r2, #0
	ldreq	r1, [r4, #4]
	bne	.L316
.L286:
	ldr	r3, [fp, #-380]
	cmp	r3, #1
	bne	.L271
	rsb	r6, r8, r6
	ldr	r4, .L325+8
	add	r7, r7, r6
	ldr	r3, [r7, #44]
	cmp	r3, #2
	beq	.L317
	sub	r2, fp, #376
	mov	r3, r5
	bl	VCTRL_VdmPostProc
.L309:
	ldr	r0, [r7, #8]
	bl	VCTRL_ClearDecparam
	ldr	r3, [r7, #8]
	cmp	r3, #31
	bhi	.L276
	add	r3, r3, #64
	mov	r2, #0
	add	r3, r4, r3, lsl #2
	str	r2, [r3, #336]
	b	.L275
.L264:
	mov	r3, r5
	sub	r2, fp, #376
	ldr	r1, [r4, #4]
	mov	r6, #0
	str	r6, [r4, #28]
	bl	VCTRL_VdmPostProc
	ldr	r0, [r4, #8]
	bl	VCTRL_ClearDecparam
	ldr	r3, [r4, #8]
	cmp	r3, #31
	bhi	.L276
	add	r3, r3, #64
	add	r7, r7, r3, lsl #2
	str	r6, [r7, #336]
.L275:
	mov	r0, r5
	bl	VDMDRV_Reset
	mov	r0, r5
	bl	VDMDRV_ActivateVDH
.L260:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L263:
	ldr	r0, [ip, #4]
	mov	r2, #0
	add	r9, r4, #4
	str	r2, [r4, #28]
	cmp	r0, #6
	ldr	r1, [r4, #48]
	beq	.L318
.L281:
	bl	VDMDRV_IsCopy
	subs	r4, r0, #0
	beq	.L319
	rsb	r6, r8, r6
	mov	r2, r9
	add	r7, r7, r6
	mov	r0, r5
	mov	r1, #0
	ldr	r4, .L325+8
	bl	VDMDRV_AdjustErrRatio
	sub	r2, fp, #376
	mov	r3, r5
	ldr	r1, [r7, #4]
	ldr	r0, [r7, #8]
	bl	VCTRL_VdmPostProc
	b	.L309
.L319:
	rsb	r6, r8, r6
	mov	r3, r5
	add	r7, r7, r6
	sub	r2, fp, #376
	ldr	r6, .L325+8
	ldr	r1, [r7, #4]
	ldr	r0, [r7, #8]
	bl	VCTRL_VdmPostProc
	ldr	r0, [r7, #8]
	bl	VCTRL_ClearDecparam
	ldr	r3, [r7, #8]
	cmp	r3, #31
	bhi	.L276
	add	r6, r6, r3, lsl #2
	str	r4, [r6, #592]
	b	.L275
.L314:
	ldr	r1, [r4, #48]
	mov	r2, r5
	ldr	r0, [ip, #4]
	str	r3, [fp, #-396]
	bl	PostPro_SetFullRepair
	ldr	r2, [fp, #-392]
	mov	r1, r10
	mov	r0, r5
	bl	VDMDRV_AdjustErrRatio
	ldr	r3, [fp, #-396]
	mov	ip, #0
	ldrb	r2, [fp, #-236]	@ zero_extendqisi2
	mov	r0, ip
	ldr	r1, .L325+24
	str	ip, [r3, #4]
	bl	dprint_vfmw
	b	.L267
.L318:
	ldrb	r2, [r1, #17]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L281
	movw	r3, #1752
	mla	r3, r3, r5, r7
	ldr	r3, [r3, #1820]
	cmp	r3, #0
	ble	.L281
	ldr	r3, .L325+28
	ldr	r10, [r3, #136]
	cmp	r10, #0
	beq	.L283
	ldr	ip, [fp, #-240]
	mov	r3, r5
	str	ip, [sp]
	blx	r10
	cmp	r0, #0
	beq	.L320
.L283:
	mov	r2, r9
	b	.L310
.L276:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L275
.L313:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L260
.L271:
	sub	r2, fp, #376
	mov	r3, r5
	rsb	r6, r8, r6
	bl	VCTRL_VdmPostProc
	add	r7, r7, r6
	ldr	r4, .L325+8
	b	.L309
.L316:
	ldr	r1, [r4, #48]
	ldr	r0, [r10, #4]
	str	r3, [fp, #-396]
	bl	PostPro_GetRepairStratage
	ldr	r1, [r4, #4]
	ldr	r3, [fp, #-396]
	cmp	r1, #0
	cmpne	r0, #1
	moveq	r2, #1
	movne	r2, #0
	beq	.L321
	ldr	r0, [r10, #4]
	ldr	r1, [r4, #48]
	cmp	r0, #6
	beq	.L322
.L291:
	mov	r9, #2
.L277:
	ldr	r3, .L325+28
	ldr	r4, [r3, #136]
	cmp	r4, #0
	beq	.L278
	ldr	ip, [fp, #-240]
	mov	r3, r5
	str	ip, [sp]
	blx	r4
	cmp	r0, #0
	beq	.L323
.L278:
	ldr	r2, [fp, #-392]
.L310:
	rsb	r4, r8, r6
	mov	r1, #2
	add	r4, r7, r4
	mov	r0, r5
	bl	VDMDRV_AdjustErrRatio
	mov	r3, r5
	sub	r2, fp, #376
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	VCTRL_VdmPostProc
	ldr	r0, [r4, #8]
	bl	VCTRL_ClearDecparam
	ldr	r3, [r4, #8]
	ldr	r9, .L325+8
	cmp	r3, #31
	bhi	.L324
	add	r3, r3, #64
	mov	r2, #0
	add	r3, r9, r3, lsl #2
	str	r2, [r3, #336]
.L280:
	rsb	r6, r8, r6
	mov	r3, #0
	str	r3, [r7, r6]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L324:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L280
.L315:
	ldr	r2, [fp, #-392]
	mov	r1, #0
	mov	r0, r5
	bl	VDMDRV_AdjustErrRatio
	b	.L268
.L322:
	ldrb	ip, [r1, #17]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L291
	movw	r2, #1752
	mla	r3, r2, r5, r3
	ldr	r3, [r3, #1820]
	cmp	r3, #0
	movgt	r2, #1
	movle	r2, #0
	movle	r9, #2
	movgt	r9, #3
	b	.L277
.L320:
	mov	r1, r5
	ldr	r2, [fp, #-240]
	mov	r0, #3
	bl	VDMDRV_StartRepair
	ldr	r2, .L325+32
	ldr	r0, [r4, #8]
	mov	ip, #1008
	ldr	r3, .L325+36
	mov	r1, #7
	add	r2, r6, r2
	str	ip, [sp]
	bl	RecordPOS
	b	.L260
.L323:
	mov	r1, r5
	mov	r0, r9
	ldr	r2, [fp, #-240]
	rsb	r8, r8, r6
	bl	VDMDRV_StartRepair
	add	r7, r7, r8
	ldr	r2, .L325+32
	movw	r1, #977
	ldr	r0, [r7, #8]
	ldr	r3, .L325+40
	add	r2, r6, r2
	str	r1, [sp]
	mov	r1, #7
	bl	RecordPOS
	b	.L260
.L317:
	mov	r3, r5
	sub	r2, fp, #376
	bl	VCTRL_VdmPostProc
	b	.L260
.L321:
	ldr	r0, [r4, #8]
	b	.L286
.L326:
	.align	2
.L325:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_HalDisable
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	.word	.LC15
	.word	g_event_report
	.word	.LC14
	.word	g_vdm_hal_fun_ptr
	.word	g_VfmwGlobalStat+4
	.word	.LANCHOR1+340
	.word	.LANCHOR1+308
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
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, .L350
	mov	r7, r0, asl #3
	mov	r6, r0, asl #6
	mov	r5, r0
	rsb	r3, r7, r6
	add	r8, r4, r3
	ldr	r3, [r4, r3]
	cmp	r3, #0
	bne	.L347
	add	r4, r4, r0, lsl #2
	ldr	r0, [r4, #56]
	cmp	r0, #0
	ldmeqfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	cmp	r0, #1
	beq	.L348
.L331:
	mov	r0, #1
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L347:
	ldr	r3, .L350+4
	ldr	r3, [r3]
	blx	r3
	add	r2, r8, #16
	ldr	r3, [r2, #4]
	str	r0, [r8, #24]
	cmp	r0, r3
	bcc	.L329
	clz	r9, r3
	rsb	r3, r3, r0
	mov	r9, r9, lsr #5
	orrs	r9, r9, r3, lsr #31
	bne	.L329
	cmp	r3, #1000
	bls	.L331
	ldr	r2, [r8, #8]
	mov	r0, #1
	ldr	r1, .L350+8
	bl	dprint_vfmw
	ldr	r3, .L350+12
	ldr	r10, [r3]
	cmp	r10, #0
	beq	.L334
	ldr	r0, [r8, #8]
	mov	r3, r9
	mov	r2, r9
	mov	r1, #101
	blx	r10
.L334:
	ldr	r3, .L350+16
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L335
	mov	r1, r5
	mov	r0, #1
	bl	VDH_Reset_Module
.L336:
	rsb	r3, r7, r6
	mov	r1, #1
	add	r3, r4, r3
	add	r2, r3, #32
	str	r1, [r3, #28]
	ldr	r3, [r3, #36]
	cmp	r3, r1
	moveq	r3, #0
	streq	r3, [r2, #4]
	beq	.L339
	mov	r0, r5
	mov	r1, #0
	bl	VDMDRV_AfterDec
.L339:
	rsb	r6, r7, r6
	mov	r5, #0
	add	r3, r4, r6
	ldr	r2, .L350
	add	r1, r3, #24
	str	r5, [r4, r6]
	ldr	r3, [r3, #8]
	str	r5, [r1, #4]
	cmp	r3, #31
	bhi	.L349
	add	r3, r3, #64
	mov	r0, r5
	add	r3, r2, r3, lsl #2
	str	r5, [r3, #336]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L329:
	str	r0, [r2, #4]
	mov	r0, #1
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L348:
	mov	r3, #2
	str	r3, [r4, #56]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L335:
	ldr	r3, .L350+20
	ldr	r3, [r3, #76]
	cmp	r3, #0
	beq	.L337
	mov	r0, r5
	blx	r3
	b	.L336
.L337:
	mov	r0, r3
	movw	r2, #1130
	ldr	r1, .L350+24
	bl	dprint_vfmw
	b	.L336
.L349:
	bl	VDMDRV_ClearChanIsDec.part.4
	mov	r0, r5
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L351:
	.align	2
.L350:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC16
	.word	g_event_report
	.word	g_HalDisable
	.word	g_vdm_hal_fun_ptr
	.word	.LC4
	UNWIND(.fnend)
	.size	VDMDRV_CheckDevice, .-VDMDRV_CheckDevice
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
	.global	__aeabi_uidiv
	.align	2
	.global	VDMDRV_IsrProcess
	.type	VDMDRV_IsrProcess, %function
VDMDRV_IsrProcess:
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
	subs	r4, r0, #0
	ble	.L355
	mov	r0, #0
	mov	r3, r4
	str	r0, [sp]
	ldr	r2, .L452
	ldr	r1, .L452+4
	bl	dprint_vfmw
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L355:
	mov	r0, #9
	mov	r10, r4, asl #3
	bl	VCTRL_RecordPosTime
	ldr	r3, .L452+8
	mov	r0, #0
	mov	r5, r4, asl #6
	ldr	r9, .L452+12
	ldr	r3, [r3, #12]
	blx	r3
	rsb	r3, r10, r5
	add	r3, r9, r3
	ldr	r3, [r3, #8]
	cmp	r3, #0
	blt	.L401
	ldr	r2, .L452+16
	ldr	r8, [r2, r3, asl #2]
	cmp	r8, #0
	streq	r8, [fp, #-48]
	ldrne	r3, [r8, #1240]
	strne	r3, [fp, #-48]
.L357:
	ldr	r6, .L452+20
	ldr	r7, [r6, #156]
	cmp	r7, #0
	beq	.L403
	mov	r1, r4
	mov	r0, #2
	blx	r7
	ldr	r7, [r6, #156]
	cmp	r7, #0
	mov	r8, r0
	beq	.L404
	mov	r1, r4
	mov	r0, #1
	blx	r7
	ldr	r3, [r6, #156]
	cmp	r3, #0
	mov	r7, r0
	beq	.L405
	mov	r1, r4
	mov	r0, #3
	blx	r3
	str	r0, [fp, #-52]
.L358:
	ldr	r3, [r6, #160]
	cmp	r3, #0
	beq	.L359
	mov	r1, r4
	mov	r0, #2
	blx	r3
	cmp	r8, #1
	beq	.L360
	ldr	r3, [fp, #-48]
	cmp	r0, #1
	cmpeq	r3, #1
	beq	.L360
.L395:
	cmp	r8, #0
	beq	.L441
.L366:
	rsb	r5, r10, r5
	add	r5, r9, r5
	ldr	r0, [r5, #8]
	bl	VCTRL_InformVdmFree
	ldr	r3, .L452+24
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L367
	mov	r1, r4
	mov	r0, #1
	bl	VDH_Notify_ModuleIdle
.L367:
	ldr	r3, .L452+8
	mov	r0, #0
	ldr	r3, [r3, #16]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L441:
	ldr	r3, [fp, #-52]
	cmp	r3, #1
	cmpeq	r7, #1
	beq	.L366
	ldr	r3, [r6, #132]
	cmp	r3, #0
	beq	.L365
	mov	r0, r4
	blx	r3
	cmp	r0, #0
	bne	.L366
.L365:
	ldr	r3, [r6, #156]
	cmp	r3, #0
	beq	.L364
	mov	r1, r4
	mov	r0, #1
	blx	r3
	cmp	r0, #0
	bne	.L366
.L364:
	rsb	r3, r10, r5
	mov	r2, #0
	str	r2, [r9, r3]
	b	.L366
.L359:
	cmp	r8, #1
	bne	.L395
.L360:
	rsb	r8, r10, r5
	ldr	r1, .L452+28
	add	r8, r9, r8
	ldr	r3, [r8, #8]
	mov	r7, r3, asl #6
	add	r7, r7, r3, lsl #3
	add	r7, r1, r7
	ldr	r2, [r7, #24]
	cmp	r2, #5
	beq	.L442
.L368:
	cmp	r3, #0
	blt	.L371
	ldr	r2, .L452+16
	ldr	r3, [r2, r3, asl #2]
	cmp	r3, #0
	beq	.L371
	ldr	r2, [r6, #160]
	ldr	r7, [r3, #1240]
	cmp	r2, #0
	moveq	r8, r2
	beq	.L372
	mov	r1, r4
	mov	r0, #1
	blx	r2
	mov	r8, r0
.L372:
	ldr	r3, [r6, #156]
	cmp	r3, #0
	beq	.L373
	mov	r1, r4
	mov	r0, #1
	blx	r3
	cmp	r7, #1
	beq	.L443
.L371:
	mov	r3, #1
	str	r3, [fp, #-48]
.L370:
	ldr	r3, [r6, #144]
	cmp	r3, #0
	beq	.L377
	mov	r0, r4
	blx	r3
.L378:
	ldr	r3, [r6, #88]
	cmp	r3, #0
	beq	.L379
	mov	r0, r4
	blx	r3
.L380:
	rsb	r0, r10, r5
	ldr	r2, .L452+32
	add	r0, r9, r0
	movw	ip, #1213
	mov	r1, #6
	ldr	r3, .L452+36
	ldr	r0, [r0, #8]
	str	ip, [sp]
	ldr	r7, .L452+40
	add	r2, r2, r0, lsl #2
	bl	RecordPOS
	ldr	r3, .L452+8
	ldr	r3, [r3]
	blx	r3
	add	r1, r7, r5
	ldr	r2, [r1, #4]
	cmp	r2, #0
	beq	.L382
	ldr	r6, [r7, r4, asl #6]
	add	r8, r7, r5
	add	r3, r6, #49920
	ldr	lr, [r8, #36]
	add	r3, r3, #80
	cmp	r2, r3
	strhi	r2, [r7, r4, asl #6]
	ldrls	ip, [r1, #12]
	mov	r1, #180
	mla	r1, r1, r4, r9
	movhi	r6, r2
	rsb	r6, r6, r0
	rsb	r0, r2, r0
	movhi	ip, #0
	add	r3, r0, ip
	str	r3, [fp, #-52]
	cmp	r6, #1000
	str	r3, [r8, #12]
	ldr	r3, [r1, #744]
	mov	r1, #0
	ldr	r2, [r8, #32]
	str	r1, [r8, #4]
	add	r2, r2, #1
	add	r3, lr, r3, lsr #10
	str	r2, [r8, #32]
	ldr	r1, .L452+12
	str	r3, [r8, #36]
	bcc	.L382
	rsb	r0, r10, r5
	add	r1, r1, r0
	ldr	r1, [r1, #16]
	cmp	r1, #0
	ldreq	r0, [r8, #16]
	bne	.L444
.L387:
	str	r3, [fp, #-56]
	mov	r3, #1000
	mov	r1, r6
	str	r2, [fp, #-60]
	mul	r0, r3, r0
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-52]
	add	r8, r7, r5
	mov	r3, #1000
	mov	r1, r6
	str	r0, [r8, #24]
	mul	r0, r3, r2
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-60]
	mov	r3, #1000
	mov	r1, r6
	str	r0, [r8, #20]
	mul	r0, r3, r2
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-56]
	str	r6, [r8, #44]
	str	r3, [r8, #40]
	mov	r3, #0
	str	r3, [r8, #36]
	str	r3, [r7, r4, asl #6]
	str	r3, [r8, #32]
	str	r0, [r8, #28]
.L382:
	rsb	r2, r10, r5
	ldr	r0, .L452+12
	add	r3, r9, r2
	add	r7, r3, #32
	ldr	r1, [r3, #36]
	ldr	r6, [r3, #8]
	cmp	r1, #1
	beq	.L445
	ldr	r2, [r0, r2]
	cmp	r2, #0
	beq	.L390
	ldr	r7, [r3, #48]
	cmp	r7, #0
	beq	.L446
.L390:
	mov	r0, r6
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	bne	.L447
	mov	r0, r6
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L448
	mov	r1, #1
	mov	r0, r4
	bl	VDMDRV_AfterDec
.L398:
	rsb	r5, r10, r5
	add	r5, r9, r5
	ldr	r0, [r5, #8]
	bl	VCTRL_InformVdmFree
	ldr	r3, [fp, #-48]
	cmp	r3, #1
	beq	.L449
.L394:
	mov	r5, #180
	ldr	r3, .L452+8
	mla	r4, r5, r4, r9
	mov	r0, #0
	ldr	r3, [r3, #16]
	blx	r3
	mov	r0, #1
	ldr	r1, [r4, #744]
	bl	VCTRL_RecordData
	mov	r0, #10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VCTRL_RecordPosTime
.L403:
	mov	r8, r7
	str	r7, [fp, #-52]
	b	.L358
.L401:
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L357
.L447:
	mov	r3, r6
	movw	r2, #750
	ldr	r1, .L452+44
	mov	r0, #0
	bl	dprint_vfmw
.L389:
	rsb	r2, r10, r5
	ldr	r1, .L452+12
	add	r2, r9, r2
	ldr	r3, [r2, #8]
	cmp	r3, #31
	bhi	.L450
	add	r3, r3, #64
	mov	r2, #0
	add	r3, r1, r3, lsl #2
	str	r2, [r3, #336]
.L393:
	rsb	r3, r10, r5
	mov	r2, #0
	str	r2, [r9, r3]
	b	.L398
.L442:
	ldr	r2, [r7, #64]
	cmp	r2, #0
	bne	.L368
	ldr	r3, .L452+8
	str	r1, [fp, #-48]
	ldr	r3, [r3]
	blx	r3
	ldr	r3, [r8, #8]
	mov	ip, #6
	ldr	r1, [fp, #-48]
	mov	r2, r3, asl ip
	add	r2, r2, r3, lsl #3
	add	r2, r1, r2
	str	ip, [r2, #24]
	str	r0, [r7, #64]
	b	.L368
.L443:
	sub	r2, r0, #1
	sub	r3, r8, #1
	clz	r2, r2
	clz	r3, r3
	mov	r2, r2, lsr #5
	mov	r3, r3, lsr #5
	tst	r2, r3
	bne	.L376
	cmp	r0, #0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r3, #0
	bne	.L396
	cmp	r8, #0
	movne	r2, #0
	andeq	r2, r2, #1
	cmp	r2, #0
	beq	.L371
	rsb	r3, r10, r5
	add	r3, r9, r3
	add	r3, r3, #40
	ldr	r2, [r3, #4]
	cmp	r2, #2
	beq	.L451
.L376:
	rsb	r3, r10, r5
	mov	r2, #1
	add	r3, r9, r3
	str	r2, [fp, #-48]
	str	r2, [r3, #44]
	b	.L370
.L373:
	cmp	r7, #1
	bne	.L371
	cmp	r8, #1
	bne	.L371
.L396:
	rsb	r3, r10, r5
	mov	r2, #2
	add	r3, r9, r3
	mov	r1, #0
	str	r1, [fp, #-48]
	str	r2, [r3, #44]
	b	.L370
.L450:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L393
.L444:
	mov	r0, r3
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-56]
	str	r0, [r8, #16]
	b	.L387
.L379:
	mov	r0, r3
	movw	r2, #1211
	ldr	r1, .L452+48
	bl	dprint_vfmw
	b	.L380
.L377:
	mov	r0, r3
	movw	r2, #1209
	ldr	r1, .L452+48
	bl	dprint_vfmw
	b	.L378
.L449:
	ldr	r3, .L452+24
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L394
	ldr	r0, [fp, #-48]
	mov	r1, r4
	bl	VDH_Notify_ModuleIdle
	b	.L394
.L445:
	movw	r2, #722
	ldr	r1, .L452+52
	mov	r0, #0
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r7, #4]
	b	.L389
.L448:
	mov	r3, r6
	mov	r2, #756
	ldr	r1, .L452+56
	bl	dprint_vfmw
	b	.L389
.L446:
	ldr	r1, .L452+60
	mov	r0, r7
	bl	dprint_vfmw
	mov	r0, r6
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L389
	mov	r2, r7
	mov	r0, r6
	mov	r3, r4
	mov	r1, #100
	bl	VCTRL_VdmPostProc
	b	.L389
.L451:
	mov	r2, #3
	str	r7, [fp, #-48]
	str	r2, [r3, #4]
	b	.L370
.L404:
	str	r7, [fp, #-52]
	b	.L358
.L405:
	str	r3, [fp, #-52]
	b	.L358
.L453:
	.align	2
.L452:
	.word	.LANCHOR1+372
	.word	.LC17
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	.word	g_vdm_hal_fun_ptr
	.word	g_HalDisable
	.word	g_VfmwChanStat
	.word	.LANCHOR0+2780
	.word	.LANCHOR1+392
	.word	g_VfmwGlobalStat
	.word	.LC20
	.word	.LC4
	.word	.LC18
	.word	.LC21
	.word	.LC19
	UNWIND(.fnend)
	.size	VDMDRV_IsrProcess, .-VDMDRV_IsrProcess
	.align	2
	.global	VDMDRV_ResetVDH
	.type	VDMDRV_ResetVDH, %function
VDMDRV_ResetVDH:
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
	cmp	r0, #31
	bhi	.L455
	ldr	r4, .L462
	ldr	r3, [r4, #8]
	cmp	r3, r0
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L462+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L458
	mov	r1, #0
	mov	r0, #1
	bl	VDH_Reset_Module
.L459:
	mov	r3, #0
	str	r3, [r4]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L455:
	movw	r3, #1292
	ldr	r2, .L462+8
	ldr	r1, .L462+12
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L458:
	ldr	r3, .L462+16
	ldr	r3, [r3, #76]
	cmp	r3, #0
	beq	.L460
	mov	r0, #0
	blx	r3
	b	.L459
.L460:
	mov	r0, r3
	movw	r2, #1306
	ldr	r1, .L462+20
	bl	dprint_vfmw
	b	.L459
.L463:
	.align	2
.L462:
	.word	.LANCHOR0
	.word	g_HalDisable
	.word	.LANCHOR1+412
	.word	.LC2
	.word	g_vdm_hal_fun_ptr
	.word	.LC4
	UNWIND(.fnend)
	.size	VDMDRV_ResetVDH, .-VDMDRV_ResetVDH
	.global	g_VdmExtParam
	.global	g_DspDrvState
	.global	g_VdmDrvParam
	.global	USE_FF_APT_EN
	.global	g_ChanCtx
	.global	g_BackUp
	.global	g_DecReport
	.global	g_RepairParam
	.global	g_HwMem
	.global	g_UpMsg
	.section	.rodata
	.align	2
.LANCHOR1 = . + 0
	.type	__func__.13751, %object
	.size	__func__.13751, 22
__func__.13751:
	.ascii	"VDMDRV_ClearChanIsDec\000"
	.space	2
	.type	__func__.13675, %object
	.size	__func__.13675, 12
__func__.13675:
	.ascii	"VDMDRV_Init\000"
	.type	__func__.13679, %object
	.size	__func__.13679, 13
__func__.13679:
	.ascii	"VDMDRV_Reset\000"
	.space	3
	.type	__func__.13689, %object
	.size	__func__.13689, 19
__func__.13689:
	.ascii	"VDMDRV_SetPriority\000"
	.space	1
	.type	__func__.13717, %object
	.size	__func__.13717, 20
__func__.13717:
	.ascii	"VDMDRV_PrepareSleep\000"
	.type	__func__.13721, %object
	.size	__func__.13721, 21
__func__.13721:
	.ascii	"VDMDRV_GetSleepStage\000"
	.space	3
	.type	__func__.13725, %object
	.size	__func__.13725, 18
__func__.13725:
	.ascii	"VDMDRV_ForceSleep\000"
	.space	2
	.type	__func__.13729, %object
	.size	__func__.13729, 17
__func__.13729:
	.ascii	"VDMDRV_ExitSleep\000"
	.space	3
	.type	__func__.13742, %object
	.size	__func__.13742, 17
__func__.13742:
	.ascii	"VDMDRV_IsChanDec\000"
	.space	3
	.type	__func__.13747, %object
	.size	__func__.13747, 20
__func__.13747:
	.ascii	"VDMDRV_SetChanIsDec\000"
	.type	__func__.13765, %object
	.size	__func__.13765, 19
__func__.13765:
	.ascii	"VDMDRV_ChnDecReady\000"
	.space	1
	.type	__func__.13880, %object
	.size	__func__.13880, 23
__func__.13880:
	.ascii	"VDMDRV_MMUIntServeProc\000"
	.space	1
	.type	__func__.13884, %object
	.size	__func__.13884, 20
__func__.13884:
	.ascii	"VDMDRV_SetStateIdle\000"
	.type	__func__.13889, %object
	.size	__func__.13889, 27
__func__.13889:
	.ascii	"VDMDRV_WaitVdmReadyIfNoIsr\000"
	.space	1
	.type	__FUNCTION__.13806, %object
	.size	__FUNCTION__.13806, 19
__FUNCTION__.13806:
	.ascii	"VDMDRV_DoBeforeDec\000"
	.space	1
	.type	__FUNCTION__.13921, %object
	.size	__FUNCTION__.13921, 29
__FUNCTION__.13921:
	.ascii	"VDMDRV_AfterDecProcessNormal\000"
	.space	3
	.type	__FUNCTION__.13933, %object
	.size	__FUNCTION__.13933, 29
__FUNCTION__.13933:
	.ascii	"VDMDRV_AfterDecProcessRepair\000"
	.space	3
	.type	__func__.13971, %object
	.size	__func__.13971, 18
__func__.13971:
	.ascii	"VDMDRV_IsrProcess\000"
	.space	2
	.type	__FUNCTION__.13972, %object
	.size	__FUNCTION__.13972, 18
__FUNCTION__.13972:
	.ascii	"VDMDRV_IsrProcess\000"
	.space	2
	.type	__func__.13995, %object
	.size	__func__.13995, 16
__func__.13995:
	.ascii	"VDMDRV_ResetVDH\000"
	.data
	.align	2
	.type	USE_FF_APT_EN, %object
	.size	USE_FF_APT_EN, 4
USE_FF_APT_EN:
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
	ASCII(.ascii	"some task is already wait to process!!!!\012\000" )
	.space	2
.LC9:
	ASCII(.ascii	"SMMU_READ_ERR  MODULE : VFMW \011 SMMU INT STATE: 0" )
	ASCII(.ascii	"x%x \011 read_err_addr  = 0x%x\012\000" )
	.space	3
.LC10:
	ASCII(.ascii	"SMMU_WRITE_ERR MODULE : VFMW \011 SMMU INT STATE: 0" )
	ASCII(.ascii	"x%x \011 write_err_addr = 0x%x\012\000" )
	.space	3
.LC11:
	ASCII(.ascii	"VDMDRV_IsProtocolCopy point of picture para null, w" )
	ASCII(.ascii	"ait forever!!!\012\000" )
	.space	1
.LC12:
	ASCII(.ascii	"The channel %d DEC PARAM is not ready(pDecParam == " )
	ASCII(.ascii	"NULL)\012\000" )
	.space	2
.LC13:
	ASCII(.ascii	"VDM Start Fail 2 !\012\000" )
.LC14:
	ASCII(.ascii	"ISR process vdm timeout! FromInt = %d\012\000" )
	.space	1
.LC15:
	ASCII(.ascii	"Chan %d VdmStateMachine=%d Error! FromInt = %d.\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC16:
	ASCII(.ascii	"Chan %d VDM Time Out(%d ms), Reset VDM!\012\000" )
	.space	3
.LC17:
	ASCII(.ascii	"%s: VdhId(%d) > %d\012\000" )
.LC18:
	ASCII(.ascii	"Line %d, ISR called, ChanResetFlag = 1!!\012\000" )
	.space	2
.LC19:
	ASCII(.ascii	"vdm state machine = %d, but DecParam is null!\012\000" )
	.space	1
.LC20:
	ASCII(.ascii	"line :%d ISR called but chan %d is not active!\012\000" )
.LC21:
	ASCII(.ascii	"line :%d ISR called chan %d is active! But Dec Para" )
	ASCII(.ascii	"m in CTX is NULL!!!\012\000" )
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	g_VdmDrvParam, %object
	.size	g_VdmDrvParam, 56
g_VdmDrvParam:
	.space	56
	.type	s_eVdmDrvSleepState, %object
	.size	s_eVdmDrvSleepState, 4
s_eVdmDrvSleepState:
	.space	4
	.type	g_DspDrvState, %object
	.size	g_DspDrvState, 8
g_DspDrvState:
	.space	8
	.type	g_VdmExtParam, %object
	.size	g_VdmExtParam, 268
g_VdmExtParam:
	.space	268
	.type	g_ChanCtx, %object
	.size	g_ChanCtx, 384
g_ChanCtx:
	.space	384
	.type	g_BackUp, %object
	.size	g_BackUp, 180
g_BackUp:
	.space	180
	.type	g_RepairParam, %object
	.size	g_RepairParam, 1752
g_RepairParam:
	.space	1752
	.type	last_rec_pos_time.13803, %object
	.size	last_rec_pos_time.13803, 128
last_rec_pos_time.13803:
	.space	128
	.type	LastRecPosTime.13968, %object
	.size	LastRecPosTime.13968, 128
LastRecPosTime.13968:
	.space	128
	.type	g_DecReport, %object
	.size	g_DecReport, 824
g_DecReport:
	.space	824
	.type	g_HwMem, %object
	.size	g_HwMem, 1228
g_HwMem:
	.space	1228
	.type	g_UpMsg, %object
	.size	g_UpMsg, 3200
g_UpMsg:
	.space	3200
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
