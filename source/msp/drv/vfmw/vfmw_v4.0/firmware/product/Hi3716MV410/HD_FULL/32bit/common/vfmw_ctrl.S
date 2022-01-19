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
	.file	"vfmw_ctrl.c"
	.text
	.align	2
	.global	VCTRL_EventReport
	.type	VCTRL_EventReport, %function
VCTRL_EventReport:
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
	cmp	r0, #15
	mov	r4, r3
	bhi	.L13
	ldr	lr, .L17
	ldr	r3, [lr, r0, asl #2]
	cmp	r3, #0
	beq	.L14
	ldr	r3, [r3, #36]
	cmp	r3, #0
	beq	.L6
	cmp	r3, #1
	bne	.L15
	ldr	r3, [lr, #220]
	cmp	r3, #0
	beq	.L16
.L9:
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	bx	r3
.L15:
	ldr	r1, .L17+4
	mov	r0, #0
	str	r4, [sp]
	ldr	r2, .L17+8
	ldr	r4, [r1, #68]
	ldr	r1, .L17+12
	blx	r4
.L3:
	mvn	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L6:
	ldr	r3, [lr, #216]
	cmp	r3, #0
	bne	.L9
	ldr	r2, .L17+4
	mov	r0, r3
	ldr	r1, .L17+16
	ldr	r3, [r2, #68]
	blx	r3
	b	.L3
.L16:
	ldr	r2, .L17+4
	mov	r0, r3
	ldr	r1, .L17+20
	ldr	r3, [r2, #68]
	blx	r3
	b	.L3
.L13:
	ldr	ip, .L17+4
	movw	r2, #762
	ldr	r3, .L17+24
	mov	r0, #0
	ldr	r1, .L17+28
	ldr	r4, [ip, #68]
	blx	r4
	b	.L3
.L14:
	ldr	ip, .L17+4
	mov	r0, r3
	movw	r2, #763
	ldr	r3, .L17+32
	ldr	r1, .L17+28
	ldr	r4, [ip, #68]
	blx	r4
	b	.L3
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LC5
	.word	.LC3
	.word	.LC4
	.word	.LC0
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_EventReport, .-VCTRL_EventReport
	.align	2
	.global	VCTRL_Isr_0
	.type	VCTRL_Isr_0, %function
VCTRL_Isr_0:
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
	bl	VDMDRV_VdmIntServProc
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Isr_0, .-VCTRL_Isr_0
	.align	2
	.global	VCTRL_Scd_Isr
	.type	VCTRL_Scd_Isr, %function
VCTRL_Scd_Isr:
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
	bl	SM_SCDIntServeProc
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Scd_Isr, .-VCTRL_Scd_Isr
	.align	2
	.type	VCTRL_StopTask.part.1, %function
VCTRL_StopTask.part.1:
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
	ldr	r5, .L33
	ldr	r3, [r5, #68]
	cmp	r3, #1
	beq	.L24
	ldr	r6, .L33+4
	mov	r0, #10
	mov	r4, #49
	ldr	r3, [r6, #124]
	blx	r3
	b	.L25
.L32:
	ldr	r3, [r6, #124]
	blx	r3
	subs	r4, r4, #1
	beq	.L31
.L25:
	ldr	r3, [r5, #68]
	mov	r0, #10
	cmp	r3, #1
	bne	.L32
.L24:
	mov	r0, #0
.L23:
	mov	r3, #0
	str	r3, [r5, #72]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L31:
	mvn	r0, #0
	b	.L23
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_StopTask.part.1, .-VCTRL_StopTask.part.1
	.align	2
	.type	VCTRL_StartTask.part.2, %function
VCTRL_StartTask.part.2:
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
	ldr	r5, .L47
	ldr	r3, [r5, #68]
	cmp	r3, #2
	beq	.L38
	ldr	r6, .L47+4
	mov	r0, #10
	mov	r4, #49
	ldr	r3, [r6, #124]
	blx	r3
	b	.L39
.L46:
	ldr	r3, [r6, #124]
	blx	r3
	subs	r4, r4, #1
	beq	.L45
.L39:
	ldr	r3, [r5, #68]
	mov	r0, #10
	cmp	r3, #2
	bne	.L46
.L38:
	mov	r0, #0
.L37:
	mov	r3, #0
	str	r3, [r5, #72]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L45:
	mvn	r0, #0
	b	.L37
.L48:
	.align	2
.L47:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_StartTask.part.2, .-VCTRL_StartTask.part.2
	.align	2
	.type	VCTRL_SetLastFrameState.part.6, %function
VCTRL_SetLastFrameState.part.6:
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
	ldr	ip, .L50
	movw	r2, #8034
	ldr	r3, .L50+4
	mov	r0, #0
	ldr	r1, .L50+8
	ldr	ip, [ip, #68]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	ip
.L51:
	.align	2
.L50:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_SetLastFrameState.part.6, .-VCTRL_SetLastFrameState.part.6
	.align	2
	.global	VCTRL_Suspend
	.type	VCTRL_Suspend, %function
VCTRL_Suspend:
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
	ldr	r5, .L96
	mov	r6, #0
	mov	r4, #32
	mov	r7, r6
	ldr	r3, [r5]
	blx	r3
	mov	r8, r0
	bl	VDM_ResetClock
	mov	r0, r6
	bl	SCDDRV_PrepareSleep
	mov	r0, r6
	bl	VDMDRV_PrepareSleep
	ldr	r3, [r5]
	blx	r3
	mov	r9, r0
.L60:
	mov	r0, #0
	bl	SCDDRV_GetSleepStage
	cmp	r0, #2
	bne	.L90
	mov	r0, #0
	bl	VDMDRV_GetSleepStage
	cmp	r0, #2
	bne	.L91
.L72:
	ldr	r4, .L96+4
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L61
	mov	r0, #0
	blx	r3
.L62:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L63
	blx	r3
.L63:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	beq	.L92
	mov	r0, #0
	blx	r3
	ldr	r3, .L96+8
	ldr	r2, [r3, #64]
	cmp	r2, #1
	beq	.L93
.L65:
	ldr	r3, [r5]
	blx	r3
	ldr	r3, [r5, #68]
	ldr	r1, .L96+12
	cmp	r8, r0
	rsbls	r2, r8, r0
	mvnhi	r8, r8
	addhi	r2, r8, r0
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L61:
	mov	r0, r3
	movw	r2, #353
	ldr	r3, [r5, #68]
	ldr	r1, .L96+16
	blx	r3
	b	.L62
.L92:
	mov	r0, r3
	mov	r2, #360
	ldr	r3, [r5, #68]
	ldr	r1, .L96+16
	blx	r3
	ldr	r3, .L96+8
	ldr	r2, [r3, #64]
	cmp	r2, #1
	bne	.L65
.L93:
	mov	r2, #2
	str	r2, [r3, #72]
	bl	VCTRL_StopTask.part.1
	b	.L65
.L90:
	mov	r0, #0
	mov	r10, r7
	bl	VDMDRV_GetSleepStage
	cmp	r0, #2
	bne	.L68
	mov	r6, #1
	mov	r3, r6
.L69:
	tst	r3, r10
	bne	.L72
	subs	r4, r4, #1
	beq	.L94
	ldr	r3, [r5, #124]
	mov	r0, #10
	blx	r3
	eor	r3, r6, #1
	eor	r2, r7, #1
	orrs	r3, r3, r2
	bne	.L60
	b	.L72
.L91:
	mov	r7, #1
	mov	r10, r7
.L68:
	mov	r3, r6
	b	.L69
.L94:
	ldr	r3, [r5]
	blx	r3
	ldr	r4, [r5, #68]
	str	r6, [sp]
	mov	r3, r7
	ldr	r1, .L96+20
	cmp	r9, r0
	rsbls	r2, r9, r0
	mvnhi	r9, r9
	addhi	r2, r9, r0
	mov	r0, #0
	blx	r4
	cmp	r7, #1
	beq	.L95
	mov	r2, #0
	ldr	r3, [r5, #68]
	mov	r0, r2
	ldr	r1, .L96+24
	blx	r3
	mov	r0, #0
	bl	SCDDRV_ForceSleep
	cmp	r6, #1
	beq	.L72
.L75:
	mov	r2, #0
	ldr	r3, [r5, #68]
	mov	r0, r2
	ldr	r1, .L96+28
	blx	r3
	mov	r0, #0
	bl	VDMDRV_ForceSleep
	b	.L72
.L95:
	cmp	r6, #1
	bne	.L75
	b	.L72
.L97:
	.align	2
.L96:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR0
	.word	.LC9
	.word	.LC8
	.word	.LC10
	.word	.LC11
	.word	.LC7
	UNWIND(.fnend)
	.size	VCTRL_Suspend, .-VCTRL_Suspend
	.align	2
	.global	VCTRL_Resume
	.type	VCTRL_Resume, %function
VCTRL_Resume:
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
	ldr	r5, .L107
	ldr	r3, [r5]
	blx	r3
	mov	r4, r0
	mov	r0, #0
	bl	SCDDRV_ExitSleep
	mov	r0, #0
	bl	VDMDRV_ExitSleep
	ldr	r3, .L107+4
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L99
	blx	r3
.L99:
	ldr	r3, .L107+8
	ldr	r2, [r3, #64]
	cmp	r2, #1
	beq	.L106
.L100:
	ldr	r3, [r5]
	blx	r3
	ldr	r3, [r5, #68]
	ldr	r1, .L107+12
	cmp	r4, r0
	rsbls	r2, r4, r0
	mvnhi	r2, r4
	addhi	r2, r2, r0
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L106:
	str	r2, [r3, #72]
	bl	VCTRL_StartTask.part.2
	b	.L100
.L108:
	.align	2
.L107:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR0
	.word	.LC12
	UNWIND(.fnend)
	.size	VCTRL_Resume, .-VCTRL_Resume
	.align	2
	.global	ChanCtx_Init
	.type	ChanCtx_Init, %function
ChanCtx_Init:
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
	ldr	r3, .L112
	mov	r2, #192
	mov	r1, #0
	ldr	r0, .L112+4
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, .L112+8
	mvn	r1, #0
	add	r2, r3, #64
.L110:
	str	r1, [r3, #4]!
	cmp	r3, r2
	bne	.L110
	ldmfd	sp, {fp, sp, pc}
.L113:
	.align	2
.L112:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_ChanCtx
	.word	g_ChanCtx+60
	UNWIND(.fnend)
	.size	ChanCtx_Init, .-ChanCtx_Init
	.align	2
	.global	VCTRL_Isr_1
	.type	VCTRL_Isr_1, %function
VCTRL_Isr_1:
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
	bl	VDMDRV_VdmIntServProc
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Isr_1, .-VCTRL_Isr_1
	.align	2
	.global	VCTRL_Isr_2
	.type	VCTRL_Isr_2, %function
VCTRL_Isr_2:
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
	mov	r0, #2
	bl	VDMDRV_VdmIntServProc
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Isr_2, .-VCTRL_Isr_2
	.align	2
	.global	VCTRL_Scd_Isr_1
	.type	VCTRL_Scd_Isr_1, %function
VCTRL_Scd_Isr_1:
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
	bl	SM_SCDIntServeProc
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Scd_Isr_1, .-VCTRL_Scd_Isr_1
	.align	2
	.global	VCTRL_Scd_Isr_2
	.type	VCTRL_Scd_Isr_2, %function
VCTRL_Scd_Isr_2:
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
	mov	r0, #2
	bl	SM_SCDIntServeProc
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Scd_Isr_2, .-VCTRL_Scd_Isr_2
	.align	2
	.global	VCTRL_InformVdmFree
	.type	VCTRL_InformVdmFree, %function
VCTRL_InformVdmFree:
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
	ldr	r3, .L119
	mov	r0, #0
	ldr	r3, [r3, #132]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L120:
	.align	2
.L119:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_InformVdmFree, .-VCTRL_InformVdmFree
	.align	2
	.global	VCTRL_ExtraWakeUpThread
	.type	VCTRL_ExtraWakeUpThread, %function
VCTRL_ExtraWakeUpThread:
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
	ldr	r3, .L122
	mov	r0, #0
	ldr	r3, [r3, #132]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L123:
	.align	2
.L122:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_ExtraWakeUpThread, .-VCTRL_ExtraWakeUpThread
	.align	2
	.global	VCTRL_SetMoreGapEnable
	.type	VCTRL_SetMoreGapEnable, %function
VCTRL_SetMoreGapEnable:
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
	cmp	r0, #15
	bhi	.L131
	ldr	r3, .L134
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L132
	ldr	r2, [r3, #12]
	cmp	r2, #1
	bne	.L133
	cmp	r1, #1
	strls	r1, [r3, #1216]
	movls	r0, #0
	movhi	r2, #0
	strhi	r2, [r3, #1216]
	mvnhi	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L133:
	ldr	ip, .L134+4
	movw	r2, #742
	ldr	r3, .L134+8
.L130:
	ldr	r1, .L134+12
	mov	r0, #0
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L131:
	ldr	ip, .L134+4
	mov	r2, #740
	ldr	r3, .L134+16
	b	.L130
.L132:
	ldr	ip, .L134+4
	mov	r0, r3
	movw	r2, #741
	ldr	r3, .L134+20
	ldr	r1, .L134+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L135:
	.align	2
.L134:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC13
	.word	.LC1
	.word	.LC6
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_SetMoreGapEnable, .-VCTRL_SetMoreGapEnable
	.align	2
	.global	VCTRL_SetCallBack
	.type	VCTRL_SetCallBack, %function
VCTRL_SetCallBack:
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
	beq	.L144
	cmp	r0, #0
	beq	.L140
	cmp	r0, #1
	bne	.L145
	ldr	r3, .L146
	mov	r0, #0
	str	r1, [r3, #220]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L145:
	ldr	ip, .L146+4
	mov	r3, r0
	ldr	r2, .L146+8
	mov	r0, #0
	ldr	r1, .L146+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L140:
	ldr	r3, .L146
	str	r1, [r3, #216]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L144:
	ldr	ip, .L146+4
	mov	r0, r1
	ldr	r3, .L146+16
	movw	r2, #803
	ldr	r1, .L146+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L147:
	.align	2
.L146:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+20
	.word	.LC15
	.word	.LC14
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_SetCallBack, .-VCTRL_SetCallBack
	.align	2
	.global	VCTRL_StopTask
	.type	VCTRL_StopTask, %function
VCTRL_StopTask:
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
	ldr	r3, .L150
	ldr	r2, [r3, #64]
	cmp	r2, #1
	bne	.L149
	mov	r2, #2
	str	r2, [r3, #72]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_StopTask.part.1
.L149:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L151:
	.align	2
.L150:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_StopTask, .-VCTRL_StopTask
	.align	2
	.global	VCTRL_StartTask
	.type	VCTRL_StartTask, %function
VCTRL_StartTask:
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
	ldr	r3, .L154
	ldr	r2, [r3, #64]
	cmp	r2, #1
	bne	.L153
	str	r2, [r3, #72]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_StartTask.part.2
.L153:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L155:
	.align	2
.L154:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_StartTask, .-VCTRL_StartTask
	.align	2
	.global	VCTRL_SetStreamInterface
	.type	VCTRL_SetStreamInterface, %function
VCTRL_SetStreamInterface:
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
	cmp	r0, #15
	mov	r4, r0
	mov	r6, r1
	bhi	.L161
	cmp	r1, #0
	beq	.L162
	ldr	r5, .L164
	ldr	r0, [r5, r0, asl #2]
	cmp	r0, #0
	beq	.L163
	ldr	r7, .L164+4
	mov	r2, #12
	add	r0, r0, #152
	add	r5, r5, #240
	ldr	r3, [r7, #52]
	blx	r3
	mov	r0, r4, asl #4
	sub	r0, r0, r4, asl #2
	ldr	r3, [r7, #52]
	mov	r1, r6
	add	r0, r5, r0
	mov	r2, #12
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L161:
	ldr	ip, .L164+4
	movw	r2, #1095
	ldr	r3, .L164+8
	mov	r0, #0
	ldr	r1, .L164+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L163:
	ldr	ip, .L164+4
	movw	r2, #1097
	ldr	r3, .L164+16
	ldr	r1, .L164+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L162:
	ldr	ip, .L164+4
	mov	r0, r1
	ldr	r3, .L164+20
	movw	r2, #1096
	ldr	r1, .L164+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L165:
	.align	2
.L164:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC2
	.word	.LC16
	UNWIND(.fnend)
	.size	VCTRL_SetStreamInterface, .-VCTRL_SetStreamInterface
	.align	2
	.global	VCTRL_SetSendStreamAgainFlag
	.type	VCTRL_SetSendStreamAgainFlag, %function
VCTRL_SetSendStreamAgainFlag:
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
	cmp	r0, #15
	bhi	.L170
	ldr	r3, .L172
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L171
	add	r3, r0, #225280
	mov	r0, #0
	str	r1, [r3, #3316]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L170:
	ldr	ip, .L172+4
	movw	r2, #1110
	ldr	r3, .L172+8
	mov	r0, #0
	ldr	r1, .L172+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L171:
	ldr	ip, .L172+4
	movw	r2, #1111
	ldr	r3, .L172+16
	ldr	r1, .L172+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L173:
	.align	2
.L172:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_SetSendStreamAgainFlag, .-VCTRL_SetSendStreamAgainFlag
	.align	2
	.global	VCTRL_GetSendStreamAgainFlag
	.type	VCTRL_GetSendStreamAgainFlag, %function
VCTRL_GetSendStreamAgainFlag:
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
	cmp	r0, #15
	bhi	.L178
	ldr	r3, .L180
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L179
	add	r0, r0, #225280
	ldr	r0, [r0, #3316]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L178:
	ldr	ip, .L180+4
	movw	r2, #1118
	ldr	r3, .L180+8
	mov	r0, #0
	ldr	r1, .L180+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L179:
	ldr	ip, .L180+4
	movw	r2, #1119
	ldr	r3, .L180+16
	ldr	r1, .L180+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L181:
	.align	2
.L180:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_GetSendStreamAgainFlag, .-VCTRL_GetSendStreamAgainFlag
	.align	2
	.global	VCTRL_GetStreamInterface
	.type	VCTRL_GetStreamInterface, %function
VCTRL_GetStreamInterface:
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
	cmp	r0, #15
	mov	r4, r0
	bhi	.L187
	ldr	r5, .L189
	ldr	r1, [r5, r0, asl #2]
	cmp	r1, #0
	beq	.L187
	ldr	r6, .L189+4
	mov	r3, r0, asl #4
	sub	r3, r3, r0, asl #2
	add	r0, r5, #240
	add	r0, r0, r3
	add	r1, r1, #152
	ldr	r3, [r6, #60]
	mov	r2, #12
	blx	r3
	cmp	r0, #0
	bne	.L188
	ldr	r1, [r5, r4, asl #2]
	add	r0, r1, #152
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L188:
	ldr	r5, [r6, #68]
	mov	r3, r4
	movw	r2, #1137
	ldr	r1, .L189+8
	mov	r0, #0
	blx	r5
.L187:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L190:
	.align	2
.L189:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC17
	UNWIND(.fnend)
	.size	VCTRL_GetStreamInterface, .-VCTRL_GetStreamInterface
	.align	2
	.global	VCTRL_GetStreamSize
	.type	VCTRL_GetStreamSize, %function
VCTRL_GetStreamSize:
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
	cmp	r0, #15
	bhi	.L196
	ldr	r3, .L199
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L197
	ldr	r3, [r0, #12]
	cmp	r3, #1
	bne	.L198
	add	r0, r0, #99328
	add	r0, r0, #576
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	GetSegStreamSize
.L198:
	ldr	ip, .L199+4
	movw	r2, #1165
	ldr	r3, .L199+8
	mov	r0, #0
	ldr	r1, .L199+12
	ldr	r4, [ip, #68]
	blx	r4
.L193:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L196:
	ldr	ip, .L199+4
	movw	r2, #1163
	ldr	r3, .L199+16
	mov	r0, #0
	ldr	r1, .L199+12
	ldr	r4, [ip, #68]
	blx	r4
	b	.L193
.L197:
	ldr	ip, .L199+4
	movw	r2, #1164
	ldr	r3, .L199+20
	ldr	r1, .L199+12
	ldr	r4, [ip, #68]
	blx	r4
	b	.L193
.L200:
	.align	2
.L199:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC19
	.word	.LC1
	.word	.LC6
	.word	.LC18
	UNWIND(.fnend)
	.size	VCTRL_GetStreamSize, .-VCTRL_GetStreamSize
	.align	2
	.global	VCTRL_SetDiscardPicParam
	.type	VCTRL_SetDiscardPicParam, %function
VCTRL_SetDiscardPicParam:
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
	cmp	r0, #15
	mov	r4, r0
	mov	r0, r1
	bhi	.L207
	cmp	r1, #0
	beq	.L208
	ldr	r5, .L210
	ldr	r0, [r5, r4, asl #2]
	cmp	r0, #0
	beq	.L209
	ldr	r3, .L210+4
	add	r0, r0, #1424
	mov	r2, #8
	add	r0, r0, #12
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r2, [r5, r4, asl #2]
	mov	r0, #0
	ldr	r3, [r2, #1436]
	sub	r3, r3, #1
	cmp	r3, #1
	strhi	r0, [r2, #1436]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L207:
	ldr	ip, .L210+4
	movw	r2, #1177
	ldr	r3, .L210+8
	mov	r0, #0
	ldr	r1, .L210+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L209:
	ldr	ip, .L210+4
	movw	r2, #1179
	ldr	r3, .L210+16
	ldr	r1, .L210+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L208:
	ldr	ip, .L210+4
	movw	r2, #1178
	ldr	r3, .L210+20
	ldr	r1, .L210+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L211:
	.align	2
.L210:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC2
	.word	.LC20
	UNWIND(.fnend)
	.size	VCTRL_SetDiscardPicParam, .-VCTRL_SetDiscardPicParam
	.align	2
	.global	VCTRL_GetSyntaxCtx
	.type	VCTRL_GetSyntaxCtx, %function
VCTRL_GetSyntaxCtx:
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
	cmp	r0, #15
	bhi	.L214
	ldr	r3, .L216
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	addne	r0, r0, #229376
	addne	r0, r0, #792
	ldmfd	sp, {fp, sp, pc}
.L214:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L217:
	.align	2
.L216:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetSyntaxCtx, .-VCTRL_GetSyntaxCtx
	.align	2
	.global	VCTRL_GetImageInterface
	.type	VCTRL_GetImageInterface, %function
VCTRL_GetImageInterface:
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
	cmp	r0, #15
	bhi	.L220
	ldr	r3, .L222
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	addne	r0, r0, #164
	ldmfd	sp, {fp, sp, pc}
.L220:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L223:
	.align	2
.L222:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetImageInterface, .-VCTRL_GetImageInterface
	.align	2
	.global	VCTRL_PartitionMemForStdUser
	.type	VCTRL_PartitionMemForStdUser, %function
VCTRL_PartitionMemForStdUser:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 48
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
	ldr	r4, .L240
	cmp	r2, #31
	cmpgt	r1, #31
	mov	r7, r2
	mov	r8, r1
	mov	r9, r0
	movle	r2, #1
	movgt	r2, #0
	str	r3, [fp, #-88]
	ldr	r5, [r4, r0, asl #2]
	ble	.L236
	ldr	r3, [fp, #-88]
	ldr	r1, [fp, #4]
	cmp	r1, #0
	cmpne	r3, #0
	moveq	r6, #1
	movne	r6, #0
	beq	.L237
	ldr	r10, .L240+4
	mov	r2, #32
	mov	r1, r6
	sub	r0, fp, #76
	ldr	r3, [r10, #48]
	blx	r3
	sub	r1, fp, #76
	mov	r0, r9
	mov	r3, #1
	str	r7, [fp, #-64]
	str	r7, [fp, #-48]
	strb	r6, [fp, #-75]
	str	r8, [fp, #-68]
	str	r8, [fp, #-52]
	strb	r6, [fp, #-72]
	strb	r6, [fp, #-70]
	strb	r6, [fp, #-69]
	strb	r3, [fp, #-73]
	bl	FSP_ConfigInstance
	subs	r7, r0, #0
	bne	.L228
	ldr	r2, [fp, #4]
	sub	r3, fp, #80
	ldr	r1, [fp, #-88]
	mov	r0, r9
	bl	FSP_ConfigFrameBuf
	subs	r6, r0, #0
	bne	.L238
	mov	r0, r9
	add	r1, r4, #432
	bl	FSP_GetInstInfo
	movw	r3, #433
	ldrsb	r3, [r4, r3]
	cmp	r3, #16
	movge	r3, #16
	cmp	r3, #2
	str	r3, [r5, #468]
	ble	.L239
	ldr	ip, [r4, #2616]
	mov	r2, #64
	ldr	r3, [r10, #48]
	mov	r1, r7
	add	r0, r5, #400
	str	ip, [r5, #464]
	blx	r3
	mov	r1, r7
	ldr	r3, [r10, #48]
	mov	r2, #64
	add	r0, r5, #336
	blx	r3
	ldr	r1, [r5, #468]
	cmp	r1, #0
	ble	.L226
	add	r4, r4, #432
	add	r5, r5, #396
	mov	r3, r7
.L233:
	ldr	r2, [r4, #20]
	add	r3, r3, #1
	cmp	r3, r1
	add	r4, r4, #68
	str	r2, [r5, #4]!
	bne	.L233
.L226:
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L237:
	ldr	r3, .L240+4
	mov	r0, r2
	ldr	r1, .L240+8
	mvn	r7, #0
	ldr	r3, [r3, #68]
	blx	r3
	b	.L226
.L228:
	ldr	r3, [r10, #68]
	mov	r0, r6
	ldr	r1, .L240+12
	mvn	r7, #0
	blx	r3
	b	.L226
.L238:
	ldr	r3, [r10, #68]
	mov	r0, r7
	ldr	r1, .L240+16
	blx	r3
.L230:
	mvn	r7, #0
	b	.L226
.L239:
	ldr	r4, [r10, #68]
	mov	r0, r6
	movw	r3, #1434
	ldr	r2, .L240+20
	ldr	r1, .L240+24
	blx	r4
	b	.L230
.L236:
	ldr	ip, .L240+4
	mov	r3, r7
	mov	r2, r1
	mov	r0, #0
	ldr	r1, .L240+28
	mvn	r7, #0
	ldr	r4, [ip, #68]
	blx	r4
	b	.L226
.L241:
	.align	2
.L240:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC22
	.word	.LC25
	.word	.LC23
	.word	.LANCHOR1+40
	.word	.LC24
	.word	.LC21
	UNWIND(.fnend)
	.size	VCTRL_PartitionMemForStdUser, .-VCTRL_PartitionMemForStdUser
	.align	2
	.global	VCTRL_UnInstallChan
	.type	VCTRL_UnInstallChan, %function
VCTRL_UnInstallChan:
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
	bl	FSP_DisableInstance
	mov	r0, r4
	bl	CloseUsdPool_WithMem
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_UnInstallChan, .-VCTRL_UnInstallChan
	.align	2
	.global	VCTRL_RlsAllFrameNode
	.type	VCTRL_RlsAllFrameNode, %function
VCTRL_RlsAllFrameNode:
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
	cmp	r0, #15
	mov	r6, r0
	bhi	.L254
	ldr	r8, .L255
	ldr	r9, [r8, r0, asl #2]
	cmp	r9, #0
	beq	.L246
	mov	r4, #0
	mvn	r7, #0
	mov	r0, r4
	b	.L247
.L249:
	add	r9, r9, r5
	add	r9, r9, #228352
	ldr	r2, [r9, #260]
	ldr	r1, [r9, #252]
	ldr	r0, [r9, #256]
	bl	MEM_DelMemRecord
	ldr	r3, [r8, r6, asl #2]
	add	r5, r3, r5
	add	r5, r5, #228352
	strb	r7, [r5, #264]
.L248:
	cmp	r4, #32
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r9, [r8, r6, asl #2]
.L247:
	mov	r3, r4, asl #2
	mov	r2, r4, asl #4
	add	r5, r3, r2
	add	r4, r4, #1
	add	r3, r9, r5
	add	r3, r3, #228352
	ldrb	r2, [r3, #264]	@ zero_extendqisi2
	cmp	r2, #255
	beq	.L248
	cmp	r2, #1
	bne	.L249
	ldr	r1, [r3, #252]
	ldr	r0, [r3, #256]
	bl	MEM_ReleaseMemBlock
	b	.L249
.L254:
	ldr	ip, .L255+4
	movw	r2, #1496
	ldr	r3, .L255+8
	mov	r0, #0
	ldr	r1, .L255+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L246:
	ldr	ip, .L255+4
	mov	r0, r9
	ldr	r3, .L255+16
	movw	r2, #1497
	ldr	r1, .L255+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L256:
	.align	2
.L255:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC18
	UNWIND(.fnend)
	.size	VCTRL_RlsAllFrameNode, .-VCTRL_RlsAllFrameNode
	.align	2
	.type	VCTRL_AllocMemPre, %function
VCTRL_AllocMemPre:
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
	ldr	r10, .L271
	mov	r7, r1
	mov	r9, r0
	ldr	r1, [r10, r0, asl #2]
	add	r0, r1, #225280
	ldr	r2, [r1, #208]
	ldr	r6, [r1, #204]
	ldr	r8, [r0, #3288]
	cmp	r6, #0
	cmpne	r2, #0
	movne	r0, #1
	moveq	r0, #0
	cmp	r7, #31
	movgt	r0, #0
	andle	r0, r0, #1
	cmp	r0, #0
	beq	.L258
	mov	r5, #0
	rsb	r3, r6, r2
	mov	r4, r5
	str	r3, [fp, #-48]
	mov	r0, r5
	b	.L262
.L259:
	cmp	r7, r5
	ble	.L261
	add	r4, r4, #1
	add	r6, r6, r8
	cmp	r4, #32
	beq	.L261
.L269:
	ldr	r1, [r10, r9, asl #2]
.L262:
	mov	r3, r4, asl #4
	cmp	r5, r7
	add	r3, r3, r4, lsl #2
	add	r3, r1, r3
	movge	ip, #0
	add	r3, r3, #228352
	movlt	ip, #1
	ldrb	r2, [r3, #264]	@ zero_extendqisi2
	cmp	r2, #255
	movne	r2, #0
	andeq	r2, ip, #1
	cmp	r2, #0
	beq	.L259
	ldr	r0, [fp, #-48]
	mov	r1, r6
	str	r6, [r3, #252]
	add	r5, r5, #1
	add	r0, r0, r6
	str	r8, [r3, #260]
	str	r0, [r3, #256]
	mov	r2, r8
	mov	r0, #0
	strb	r0, [r3, #264]
	ldr	r0, [r3, #256]
	add	r4, r4, #1
	bl	MEM_AddMemRecord
	cmp	r7, r5
	add	r6, r6, r8
	movle	ip, #0
	movgt	ip, #1
	cmp	r4, #32
	bne	.L269
.L261:
	cmp	r4, #32
	movne	r4, #0
	andeq	r4, ip, #1
	cmp	r4, #0
	bne	.L270
.L263:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L270:
	ldr	r4, .L271+4
	mov	r3, r5
	mov	r2, r7
	ldr	r1, .L271+8
	mov	r0, #31
	ldr	r5, [r4, #68]
	blx	r5
	mov	r0, r9
	bl	VCTRL_RlsAllFrameNode
	cmp	r0, #0
	mvneq	r0, #0
	beq	.L263
	ldr	r3, [r4, #68]
	mov	r2, r9
	ldr	r1, .L271+12
	mov	r0, #31
	blx	r3
	mvn	r0, #0
	b	.L263
.L258:
	ldr	ip, .L271+4
	mov	r3, r6
	str	r7, [sp]
	mov	r0, #31
	ldr	r1, .L271+16
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L263
.L272:
	.align	2
.L271:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC27
	.word	.LC28
	.word	.LC26
	UNWIND(.fnend)
	.size	VCTRL_AllocMemPre, .-VCTRL_AllocMemPre
	.align	2
	.type	VCTRL_AllocMemMMZ, %function
VCTRL_AllocMemMMZ:
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
	UNWIND(.pad #44)
	sub	sp, sp, #44
	ldr	r10, .L292
	mov	r9, r0
	mov	r3, #0
	mov	r0, r3
	str	r3, [fp, #-48]
	ldr	r4, [r10, r9, asl #2]
	mov	r7, r3
	mov	r5, r3
	str	r1, [fp, #-52]
	add	r2, r4, #225280
	ldr	r3, [r4, #1408]
	ldr	r2, [r2, #3288]
	add	r3, r3, r3, lsr #31
	str	r2, [fp, #-60]
	mov	r3, r3, asr #1
	str	r3, [fp, #-72]
	b	.L280
.L274:
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-48]
	cmp	r3, r2
	ble	.L279
	add	r5, r5, #1
	cmp	r5, #32
	beq	.L277
.L290:
	ldr	r4, [r10, r9, asl #2]
.L280:
	mov	r3, r5, asl #4
	mov	r6, r5, asl #2
	add	r8, r6, r3
	str	r3, [fp, #-56]
	add	r3, r4, r8
	ldr	r1, [fp, #-48]
	add	r3, r3, #228352
	ldrb	r2, [r3, #264]	@ zero_extendqisi2
	ldr	r3, [fp, #-52]
	cmp	r1, r3
	movge	r3, #0
	movlt	r3, #1
	cmp	r2, #255
	movne	r3, #0
	cmp	r3, #0
	beq	.L274
	add	r8, r8, #228352
	mov	r1, #0
	add	r8, r8, #248
	str	r1, [sp]
	add	r4, r4, r8
	ldr	r2, [fp, #-60]
	ldr	r0, .L292+4
	mov	r3, r4
	bl	MEM_AllocMemBlock
	ldr	r3, [fp, #-72]
	cmp	r0, #0
	cmpne	r3, r7
	ble	.L275
	str	r5, [fp, #-64]
	ldr	r5, [fp, #-60]
	str	r6, [fp, #-68]
	mov	r6, r3
.L276:
	ldr	r3, .L292+8
	mov	r0, #2
	add	r7, r7, #1
	ldr	r3, [r3, #124]
	blx	r3
	ldr	r4, [r10, r9, asl #2]
	mov	r1, #0
	mov	r2, r5
	add	r4, r4, r8
	str	r1, [sp]
	ldr	r0, .L292+4
	mov	r3, r4
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	cmpne	r6, r7
	bgt	.L276
	ldr	r5, [fp, #-64]
	ldr	r6, [fp, #-68]
.L275:
	cmp	r0, #0
	bne	.L277
	ldr	r3, [fp, #-48]
	add	r5, r5, #1
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #4]
	add	r3, r3, #1
	ldr	r0, [r4, #8]
	str	r3, [fp, #-48]
	bl	MEM_AddMemRecord
	ldr	r2, [fp, #-56]
	cmp	r5, #32
	ldr	r3, [r10, r9, asl #2]
	add	r6, r6, r2
	mov	r2, #1
	add	r6, r3, r6
	add	r6, r6, #228352
	strb	r2, [r6, #264]
	bne	.L290
.L277:
	ldr	r1, [fp, #-52]
	ldr	r3, [fp, #-48]
	cmp	r1, r3
	ble	.L279
	ldr	r4, .L292+8
	mov	r2, r9
	str	r1, [sp]
	mov	r0, #31
	str	r5, [sp, #4]
	ldr	r1, .L292+12
	ldr	r5, [r4, #68]
	blx	r5
	mov	r0, r9
	bl	VCTRL_RlsAllFrameNode
	cmp	r0, #0
	mvneq	r0, #0
	bne	.L291
.L279:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L291:
	ldr	r3, [r4, #68]
	mov	r0, #31
	ldr	r1, .L292+16
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L293:
	.align	2
.L292:
	.word	.LANCHOR0
	.word	.LC29
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC30
	.word	.LC31
	UNWIND(.fnend)
	.size	VCTRL_AllocMemMMZ, .-VCTRL_AllocMemMMZ
	.align	2
	.global	VCTRL_FreeChanResource
	.type	VCTRL_FreeChanResource, %function
VCTRL_FreeChanResource:
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
	subs	r6, r1, #0
	beq	.L326
	ldr	r3, [r6, #88]
	cmp	r3, #1
	beq	.L297
	ldr	r2, [r6, #12]
	ldr	r1, [r6, #4]
	ldr	r0, [r6, #8]
	bl	MEM_DelMemRecord
.L298:
	ldr	r2, [r6, #28]
	cmp	r2, #0
	bne	.L327
	ldr	r3, [r6, #64]
	cmp	r3, #1
	beq	.L328
.L303:
	ldr	r3, [r6, #68]
	cmp	r3, #1
	beq	.L329
.L304:
	ldr	r3, [r6, #72]
	cmp	r3, #1
	beq	.L330
.L305:
	ldr	r3, .L331
	ldr	r0, [r6, #36]
	ldr	r3, [r3, #168]
	blx	r3
.L306:
	ldr	r2, [r6, #44]
	ldr	r1, [r6, #36]
	ldr	r0, [r6, #40]
	bl	MEM_DelMemRecord
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L330:
	ldr	r0, [r6, #40]
	cmp	r0, #0
	beq	.L305
	ldr	r1, [r6, #36]
	bl	MEM_ReleaseMemBlock
	b	.L306
.L297:
	ldr	r7, .L331
	mov	r5, #0
	b	.L301
.L300:
	ldr	r3, [r6, #92]
	mvn	r2, #0
	add	r3, r3, r5
	strb	r2, [r3, #16]
.L299:
	add	r5, r5, #20
	cmp	r5, #640
	beq	.L298
.L301:
	ldr	r4, [r6, #92]
	add	r4, r4, r5
	ldrb	r3, [r4, #16]	@ zero_extendqisi2
	cmp	r3, #255
	beq	.L299
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_DelMemRecord
	cmp	r0, #0
	beq	.L300
	ldr	r2, [r4, #8]
	mov	r0, #1
	ldr	r3, [r7, #68]
	ldr	r1, .L331+4
	blx	r3
	b	.L300
.L327:
	ldr	r1, [r6, #20]
	ldr	r0, [r6, #24]
	bl	MEM_DelMemRecord
	ldr	r3, [r6, #64]
	cmp	r3, #1
	bne	.L303
.L328:
	ldr	r0, [r6, #8]
	cmp	r0, #0
	beq	.L303
	ldr	r1, [r6, #4]
	bl	MEM_ReleaseMemBlock
	b	.L303
.L329:
	ldr	r0, [r6, #24]
	cmp	r0, #0
	beq	.L304
	ldr	r1, [r6, #20]
	bl	MEM_ReleaseMemBlock
	b	.L304
.L326:
	ldr	ip, .L331
	mov	r0, r6
	ldr	r3, .L331+8
	movw	r2, #1527
	ldr	r1, .L331+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L332:
	.align	2
.L331:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC33
	.word	.LC32
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_FreeChanResource, .-VCTRL_FreeChanResource
	.align	2
	.global	VCTRL_GetChanCtxSize
	.type	VCTRL_GetChanCtxSize, %function
VCTRL_GetChanCtxSize:
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
	cmp	r0, #26
	movweq	r3, #57560
	movwne	r3, #28464
	movteq	r3, 176
	movtne	r3, 8
	str	r3, [r1]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_GetChanCtxSize, .-VCTRL_GetChanCtxSize
	.align	2
	.global	VCTRL_GetChanCfg
	.type	VCTRL_GetChanCfg, %function
VCTRL_GetChanCfg:
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
	cmp	r0, #15
	mov	r3, r1
	bhi	.L341
	cmp	r1, #0
	beq	.L342
	ldr	r2, .L344
	ldr	ip, .L344+4
	ldr	r1, [r2, r0, asl #2]
	cmp	r1, #0
	beq	.L343
	add	r1, r1, #48
	mov	r0, r3
	mov	r2, #104
	ldr	r3, [ip, #52]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L341:
	ldr	ip, .L344+4
	movw	r2, #2710
	ldr	r3, .L344+8
	mov	r0, #0
	ldr	r1, .L344+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L343:
	mov	r0, r1
	ldr	r3, .L344+16
	movw	r2, #2712
	ldr	r1, .L344+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L342:
	ldr	ip, .L344+4
	mov	r0, r1
	ldr	r3, .L344+20
	movw	r2, #2711
	ldr	r1, .L344+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L345:
	.align	2
.L344:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC2
	.word	.LC34
	UNWIND(.fnend)
	.size	VCTRL_GetChanCfg, .-VCTRL_GetChanCfg
	.align	2
	.global	VCTRL_CmpConfigParameter
	.type	VCTRL_CmpConfigParameter, %function
VCTRL_CmpConfigParameter:
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
	ldr	r3, .L365
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r3, #528]
	cmp	r2, #20
	beq	.L362
	ldr	r2, [r3, #48]
	ldr	r0, [r1]
	cmp	r2, r0
	bne	.L362
	ldr	ip, [r3, #64]
	ldr	r0, [r1, #16]
	cmp	ip, r0
	bne	.L362
	ldr	ip, [r3, #60]
	ldr	r0, [r1, #12]
	cmp	ip, r0
	bne	.L362
	ldr	ip, [r3, #68]
	ldr	r0, [r1, #20]
	cmp	ip, r0
	bne	.L362
	ldr	ip, [r3, #72]
	ldr	r0, [r1, #24]
	cmp	ip, r0
	bne	.L362
	ldr	ip, [r3, #76]
	ldr	r0, [r1, #28]
	cmp	ip, r0
	bne	.L362
	ldr	ip, [r3, #80]
	ldr	r0, [r1, #32]
	cmp	ip, r0
	bne	.L362
	ldr	ip, [r3, #100]
	ldr	r0, [r1, #52]
	cmp	ip, r0
	bne	.L362
	ldr	ip, [r3, #112]
	ldr	r0, [r1, #64]
	cmp	ip, r0
	bne	.L362
	ldr	ip, [r3, #108]
	ldr	r0, [r1, #60]
	cmp	ip, r0
	bne	.L362
	ldr	ip, [r3, #104]
	ldr	r0, [r1, #56]
	cmp	ip, r0
	bne	.L362
	ldr	ip, [r3, #116]
	ldr	r0, [r1, #68]
	cmp	ip, r0
	bne	.L362
	cmp	r2, #1
	beq	.L364
	sub	r2, r2, #10
	cmp	r2, #2
	bhi	.L363
	ldr	r3, [r3, #52]
	ldr	r0, [r1, #4]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L362:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L363:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L364:
	ldr	r0, [r3, #52]
	ldr	r2, [r1, #4]
	cmp	r0, r2
	bne	.L362
	ldr	r3, [r3, #56]
	ldr	r0, [r1, #8]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L366:
	.align	2
.L365:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_CmpConfigParameter, .-VCTRL_CmpConfigParameter
	.align	2
	.global	VCTRL_CheckChanWH
	.type	VCTRL_CheckChanWH, %function
VCTRL_CheckChanWH:
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
	ldr	r3, .L372
	ldr	r2, .L372+4
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r2]
	ldr	r0, [r3, #1272]
	ldr	r3, [r3, #1276]
	cmp	r0, r2
	bgt	.L368
	ldr	r0, .L372+8
	ldr	r0, [r0]
	cmp	r3, r0
	ble	.L370
.L368:
	ldr	r3, [r1]
	cmp	r3, #19
	cmpne	r3, #13
	movne	r0, #1
	moveq	r0, #0
	bics	r3, r3, #16
	andne	r0, r0, #1
	moveq	r0, #0
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	ip, .L372+12
	mov	r0, #0
	ldr	r3, .L372+8
	ldr	r1, .L372+16
	ldr	r4, [ip, #68]
	ldr	r3, [r3]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L370:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L373:
	.align	2
.L372:
	.word	.LANCHOR0
	.word	g_ChipMaxWidth
	.word	g_ChipMaxHeight
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC35
	UNWIND(.fnend)
	.size	VCTRL_CheckChanWH, .-VCTRL_CheckChanWH
	.align	2
	.global	VCTRL_SeekPts
	.type	VCTRL_SeekPts, %function
VCTRL_SeekPts:
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
	beq	.L382
	cmp	r0, #15
	bhi	.L383
	ldr	r2, .L386
	ldr	r3, [r2, r0, asl #2]
	cmp	r3, #0
	beq	.L384
	ldr	r3, [r3, #528]
	sub	ip, r3, #10
	cmp	ip, #2
	bls	.L385
.L379:
	cmp	r3, #15
	cmpne	r3, #4
	beq	.L381
	bl	SM_SeekPts
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L385:
	ldr	r2, [r2, #2620]
	tst	r2, #1
	bne	.L379
.L381:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L383:
	ldr	ip, .L386+4
	movw	r2, #3161
	ldr	r3, .L386+8
	mov	r0, #0
	ldr	r1, .L386+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L382:
	ldr	ip, .L386+4
	mov	r0, r1
	ldr	r3, .L386+16
	movw	r2, #3160
	ldr	r1, .L386+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L384:
	ldr	ip, .L386+4
	mov	r0, r3
	movw	r2, #3162
	ldr	r3, .L386+20
	ldr	r1, .L386+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L387:
	.align	2
.L386:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC36
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_SeekPts, .-VCTRL_SeekPts
	.align	2
	.global	VCTRL_ReleaseStream
	.type	VCTRL_ReleaseStream, %function
VCTRL_ReleaseStream:
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
	cmp	r0, #15
	bhi	.L392
	ldr	r2, .L394
	ldr	r3, [r2, r0, asl #2]
	cmp	r3, #0
	beq	.L393
	bl	SM_Reset
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L392:
	ldr	ip, .L394+4
	movw	r2, #3617
	ldr	r3, .L394+8
	mov	r0, #0
	ldr	r1, .L394+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L393:
	ldr	ip, .L394+4
	mov	r0, r3
	movw	r2, #3618
	ldr	r3, .L394+16
	ldr	r1, .L394+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L395:
	.align	2
.L394:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_ReleaseStream, .-VCTRL_ReleaseStream
	.align	2
	.global	VCTRL_ReleaseChanImage
	.type	VCTRL_ReleaseChanImage, %function
VCTRL_ReleaseChanImage:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 504
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #504)
	sub	sp, sp, #504
	cmp	r0, #15
	mov	r4, r0
	mov	r5, r1
	bhi	.L424
	ldr	r8, .L433
	ldr	r0, [r8, r0, asl #2]
	cmp	r0, #0
	beq	.L425
	ldr	r3, [r0, #12]
	cmp	r3, #1
	bne	.L426
	cmp	r1, #0
	beq	.L427
	ldr	r6, .L433+4
	mov	r2, r4
	ldr	r3, [r1, #196]
	mov	r0, #2
	ldr	r1, .L433+8
	ldr	r7, [r6, #68]
	blx	r7
	ldr	r3, [r6, #12]
	mov	r0, #4
	blx	r3
	ldr	r3, [r8, r4, asl #2]
	cmp	r3, #0
	beq	.L428
	ldr	r2, [r3, #12]
	cmp	r2, #1
	bne	.L429
	ldr	r2, [r3, #1404]
	add	r0, r3, #229376
	cmp	r2, #1
	beq	.L430
.L404:
	add	r0, r0, #792
	mov	r1, r5
	bl	SYNTAX_ReleaseImage
	ldr	r3, [r5, #252]
	cmn	r3, #1
	mov	r7, r0
	beq	.L406
	ldr	r0, [r8, r4, asl #2]
	sub	r1, fp, #540
	str	r3, [fp, #-344]
	add	r0, r0, #229376
	add	r0, r0, #792
	bl	SYNTAX_ReleaseImage
	mov	r7, r0
.L406:
	mov	r0, #13
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L431
.L408:
	subs	r4, r7, #1
	mvnne	r4, #0
	cmp	r4, #0
	bne	.L432
.L410:
	ldr	r3, [r6, #16]
	mov	r0, #4
	blx	r3
.L398:
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L432:
	ldr	r3, [r6, #68]
	mov	r0, #0
	ldr	r2, .L433+12
	ldr	r1, .L433+16
	blx	r3
	b	.L410
.L431:
	ldr	r3, [r6]
	add	r8, r8, r4, lsl #2
	blx	r3
	ldr	r2, .L433+20
	ldr	r3, [r8, #2628]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	mov	ip, r0
	cmp	r3, r2
	bls	.L408
	mov	r2, r4, asl #24
	movw	r1, #4220
	add	r2, r2, #851968
	ldr	r0, .L433+24
	cmp	r7, #1
	addeq	r2, r2, #1
	str	ip, [r8, #2628]
	bl	DBG_AddTrace
	b	.L408
.L430:
	ldr	r3, [r0, #728]
	cmp	r3, #1
	bne	.L404
	ldr	r1, [r5, #104]
	ldr	r3, [r0, #716]
	cmp	r1, r3
	bcc	.L404
	ldr	r2, [r0, #724]
	add	r3, r3, r2
	cmp	r1, r3
	bcs	.L404
	ldr	r7, [r8, #2624]
	ldr	r9, .L433
	cmp	r7, #0
	beq	.L405
	sub	r2, fp, #36
	mov	r3, #4
	mov	r0, r4
	str	r1, [r2, #-504]!
	mov	r1, #123
	blx	r7
	ldr	r3, [r9, r4, asl #2]
	add	r0, r3, #229376
.L405:
	ldr	r3, [r8, r4, asl #2]
	mov	r2, #0
	str	r2, [r0, #728]
	add	r0, r3, #229376
	b	.L404
.L426:
	ldr	ip, .L433+4
	movw	r2, #4103
	ldr	r3, .L433+28
.L422:
	ldr	r1, .L433+32
	mov	r0, #0
	ldr	r5, [ip, #68]
	mvn	r4, #0
	blx	r5
	b	.L398
.L429:
	ldr	r3, [r6, #68]
	movw	r2, #4122
	ldr	r1, .L433+36
	mov	r0, #0
.L423:
	blx	r3
	ldr	r3, [r6, #16]
	mov	r0, #4
	mvn	r4, #0
	blx	r3
	b	.L398
.L424:
	ldr	ip, .L433+4
	movw	r2, #4101
	ldr	r3, .L433+40
	b	.L422
.L427:
	ldr	ip, .L433+4
	mov	r0, r1
	ldr	r3, .L433+44
	movw	r2, #4104
	ldr	r1, .L433+32
	mvn	r4, #0
	ldr	r5, [ip, #68]
	blx	r5
	b	.L398
.L425:
	ldr	ip, .L433+4
	movw	r2, #4102
	ldr	r3, .L433+48
	mvn	r4, #0
	ldr	r1, .L433+32
	ldr	r5, [ip, #68]
	blx	r5
	b	.L398
.L428:
	mov	r0, r3
	movw	r2, #4112
	ldr	r3, [r6, #68]
	ldr	r1, .L433+52
	b	.L423
.L434:
	.align	2
.L433:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC39
	.word	.LANCHOR1+96
	.word	.LC42
	.word	g_TraceImgPeriod
	.word	.LANCHOR1+72
	.word	.LC37
	.word	.LC1
	.word	.LC41
	.word	.LC6
	.word	.LC38
	.word	.LC2
	.word	.LC40
	UNWIND(.fnend)
	.size	VCTRL_ReleaseChanImage, .-VCTRL_ReleaseChanImage
	.align	2
	.global	VCTRL_GetVidStd
	.type	VCTRL_GetVidStd, %function
VCTRL_GetVidStd:
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
	cmp	r0, #15
	bhi	.L436
	ldr	r3, .L440
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L436
	ldr	r2, [r3, #12]
	cmp	r2, #1
	beq	.L439
	ldr	ip, .L440+4
	mov	r3, r0
	movw	r2, #4272
	ldr	r1, .L440+8
	mov	r0, #0
	ldr	r4, [ip, #68]
	blx	r4
	mov	r0, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L436:
	ldr	r3, .L440+4
	movw	r2, #4265
	ldr	r1, .L440+12
	mov	r0, #0
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L439:
	ldr	r0, [r3, #528]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L441:
	.align	2
.L440:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC44
	.word	.LC43
	UNWIND(.fnend)
	.size	VCTRL_GetVidStd, .-VCTRL_GetVidStd
	.align	2
	.global	VCTRL_GetDecParam
	.type	VCTRL_GetDecParam, %function
VCTRL_GetDecParam:
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
	cmp	r0, #15
	bhi	.L443
	ldr	r3, .L468
	ldr	r4, [r3, r0, asl #2]
	cmp	r4, #0
	beq	.L443
	ldr	r2, [r4, #12]
	cmp	r2, #1
	bne	.L464
	ldr	r2, [r4, #16]
	cmp	r2, #1
	bne	.L464
	ldr	r2, [r4, #528]
	cmp	r2, #17
	ldrls	pc, [pc, r2, asl #2]
	b	.L464
.L448:
	.word	.L447
	.word	.L467
	.word	.L450
	.word	.L467
	.word	.L464
	.word	.L467
	.word	.L467
	.word	.L464
	.word	.L467
	.word	.L467
	.word	.L456
	.word	.L456
	.word	.L456
	.word	.L467
	.word	.L464
	.word	.L464
	.word	.L458
	.word	.L459
.L464:
	mov	r3, #0
.L445:
	mov	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L456:
	ldr	r3, [r3, #2620]
	ands	r3, r3, #1
	beq	.L445
.L467:
	add	r3, r4, #229376
	ldr	r5, [r3, #804]
.L446:
	cmp	r5, #0
	beq	.L464
	ldr	r3, .L468+4
	ldr	r3, [r3]
	blx	r3
	mov	r3, r5
	str	r0, [r4, #44]
	mov	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L443:
	ldr	ip, .L468+4
	mov	r3, r0
	movw	r2, #4289
	ldr	r1, .L468+8
	mov	r0, #22
	ldr	r4, [ip, #68]
	blx	r4
	mov	r3, #0
	b	.L445
.L447:
	add	r3, r4, #229376
	ldr	r5, [r3, #1160]
	b	.L446
.L458:
	add	r3, r4, #229376
	ldr	r5, [r3, #1028]
	b	.L446
.L459:
	add	r3, r4, #229376
	ldr	r5, [r3, #3112]
	b	.L446
.L450:
	add	r3, r4, #229376
	ldr	r5, [r3, #1836]
	b	.L446
.L469:
	.align	2
.L468:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC45
	UNWIND(.fnend)
	.size	VCTRL_GetDecParam, .-VCTRL_GetDecParam
	.align	2
	.global	VCTRL_ChanDecparamInValidFlag
	.type	VCTRL_ChanDecparamInValidFlag, %function
VCTRL_ChanDecparamInValidFlag:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	cmp	r0, #15
	mov	r2, r0
	bhi	.L471
	ldr	r5, .L482
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	beq	.L471
	ldr	r1, [r3, #12]
	cmp	r1, #1
	bne	.L474
	ldr	r6, [r3, #16]
	cmp	r6, #1
	beq	.L475
.L474:
	ldr	r3, .L482+4
	mov	r0, #22
	ldr	r1, .L482+8
	mov	r4, #0
	ldr	r3, [r3, #68]
	blx	r3
.L473:
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L471:
	ldr	ip, .L482+4
	mov	r3, r2
	ldr	r1, .L482+12
	movw	r2, #4408
	mov	r0, #22
	mov	r4, #0
	ldr	r5, [ip, #68]
	blx	r5
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L475:
	str	r0, [fp, #-40]
	bl	VCTRL_GetDecParam
	ldr	r2, [fp, #-40]
	subs	r7, r0, #0
	beq	.L480
	ldr	r2, [r5, r2, asl #2]
	mov	r3, #0
	mov	r4, r3
	str	r3, [r2, #328]
	str	r3, [r2, #332]
	b	.L473
.L480:
	ldr	r8, [r5, r2, asl #2]
	ldr	r4, [r8, #328]
	cmp	r4, #0
	beq	.L481
	ldr	r3, .L482+4
	str	r2, [fp, #-40]
	ldr	r3, [r3]
	blx	r3
	ldr	r2, [fp, #-40]
	ldr	r3, [r5, r2, asl #2]
	ldr	r2, [r3, #332]
	cmp	r0, r2
	bls	.L478
	rsb	r0, r2, r0
	cmp	r0, #40
	movls	r4, r7
	bls	.L473
.L478:
	str	r7, [r3, #328]
	mov	r4, r6
	str	r7, [r3, #332]
	b	.L473
.L481:
	ldr	r3, .L482+4
	str	r6, [r8, #328]
	ldr	r3, [r3]
	blx	r3
	str	r0, [r8, #332]
	b	.L473
.L483:
	.align	2
.L482:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC46
	.word	.LC45
	UNWIND(.fnend)
	.size	VCTRL_ChanDecparamInValidFlag, .-VCTRL_ChanDecparamInValidFlag
	.align	2
	.global	VCTRL_FlushDecoder
	.type	VCTRL_FlushDecoder, %function
VCTRL_FlushDecoder:
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
	cmp	r0, #15
	mov	r4, r0
	bhi	.L511
	ldr	r5, .L515
	ldr	r0, [r5, r0, asl #2]
	cmp	r0, #0
	beq	.L512
	add	r0, r0, #229376
	ldr	r3, [r0, #792]
	cmp	r3, #17
	ldrls	pc, [pc, r3, asl #2]
	b	.L504
.L489:
	.word	.L488
	.word	.L490
	.word	.L491
	.word	.L492
	.word	.L504
	.word	.L493
	.word	.L494
	.word	.L504
	.word	.L495
	.word	.L496
	.word	.L497
	.word	.L497
	.word	.L497
	.word	.L498
	.word	.L504
	.word	.L504
	.word	.L499
	.word	.L500
.L500:
	add	r0, r0, #800
	ldr	r4, .L515+4
	bl	HEVC_FlushOutputFrmFromDPB
	cmp	r0, #0
	bne	.L513
.L502:
	ldr	r3, [r4, #68]
	mov	r0, #32
	ldr	r1, .L515+8
	blx	r3
	bl	VDMDRV_WakeUpVdm
	bl	VDMDRV_WakeUpVdm
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L488:
	add	r0, r0, #800
	bl	H264_FlushDecoder
	bl	VDMDRV_WakeUpVdm
	bl	VDMDRV_WakeUpVdm
	ldr	r0, [r5, r4, asl #2]
	add	r0, r0, #229376
	add	r0, r0, #800
	bl	FlushDPB
	cmp	r0, #0
	bne	.L514
.L504:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L490:
	add	r0, r0, #800
	bl	VC1DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L491:
	add	r0, r0, #800
	bl	MPEG4DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L492:
	add	r0, r0, #800
	bl	MPEG2DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L493:
	add	r0, r0, #800
	bl	DIVX3DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L494:
	add	r0, r0, #800
	bl	AVSDEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L495:
	add	r0, r0, #800
	bl	REAL8DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L496:
	add	r0, r0, #800
	bl	REAL9DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L497:
	add	r0, r0, #800
	bl	VP6DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L498:
	add	r0, r0, #800
	bl	VP8DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L499:
	add	r0, r0, #800
	bl	MVC_FlushDecoder
	bl	VDMDRV_WakeUpVdm
	bl	VDMDRV_WakeUpVdm
	ldr	r0, [r5, r4, asl #2]
	mvn	r1, #0
	add	r0, r0, #229376
	add	r0, r0, #800
	bl	MVC_FlushDPB
	cmp	r0, #0
	beq	.L504
	ldr	ip, .L515+4
	movw	r3, #4720
	ldr	r2, .L515+12
	mov	r0, #22
	ldr	r1, .L515+16
	ldr	r4, [ip, #68]
	blx	r4
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L513:
	movw	r2, #4703
	ldr	r1, .L515+20
	ldr	r3, [r4, #68]
	mov	r0, #0
	blx	r3
	b	.L502
.L514:
	ldr	r3, .L515+4
	movw	r2, #4693
	ldr	r1, .L515+20
	mov	r0, #22
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L511:
	ldr	ip, .L515+4
	movw	r2, #4666
	ldr	r3, .L515+24
	mov	r0, #0
	ldr	r1, .L515+28
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L512:
	ldr	ip, .L515+4
	movw	r2, #4667
	ldr	r3, .L515+32
	ldr	r1, .L515+28
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L516:
	.align	2
.L515:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC48
	.word	.LANCHOR1+120
	.word	.LC49
	.word	.LC47
	.word	.LC6
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_FlushDecoder, .-VCTRL_FlushDecoder
	.align	2
	.global	VCTRL_GetImageBuffer
	.type	VCTRL_GetImageBuffer, %function
VCTRL_GetImageBuffer:
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
	cmp	r0, #15
	bhi	.L540
	ldr	r1, .L543
	ldr	r3, [r1, r0, asl #2]
	cmp	r3, #0
	beq	.L541
	ldr	r0, [r3, #16]
	cmp	r0, #1
	bne	.L542
	ldr	r2, [r3, #528]
	cmp	r2, #17
	ldrls	pc, [pc, r2, asl #2]
	b	.L535
.L523:
	.word	.L522
	.word	.L524
	.word	.L525
	.word	.L526
	.word	.L535
	.word	.L527
	.word	.L528
	.word	.L535
	.word	.L529
	.word	.L530
	.word	.L531
	.word	.L531
	.word	.L531
	.word	.L532
	.word	.L535
	.word	.L535
	.word	.L533
	.word	.L534
.L534:
	add	r0, r3, #229376
	add	r0, r0, #800
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	HEVCDEC_GetImageBuffer
.L522:
	add	r0, r3, #229376
	add	r0, r0, #800
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	H264DEC_GetImageBuffer
.L524:
	add	r0, r3, #229376
	add	r0, r0, #800
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	VC1DEC_GetImageBuffer
.L525:
	add	r0, r3, #229376
	add	r0, r0, #800
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	MPEG4DEC_GetImageBuffer
.L526:
	add	r0, r3, #229376
	add	r0, r0, #800
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	MPEG2DEC_GetImageBuffer
.L527:
	add	r0, r3, #229376
	add	r0, r0, #800
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	DIVX3DEC_GetImageBuffer
.L528:
	add	r0, r3, #229376
	add	r0, r0, #800
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	AVSDEC_GetImageBuffer
.L529:
	add	r0, r3, #229376
	add	r0, r0, #800
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	REAL8DEC_GetImageBuffer
.L530:
	add	r0, r3, #229376
	add	r0, r0, #800
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	REAL9DEC_GetImageBuffer
.L531:
	ldr	r2, [r1, #2620]
	tst	r2, #1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	add	r0, r3, #229376
	add	r0, r0, #800
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	VP6DEC_GetImageBuffer
.L532:
	add	r0, r3, #229376
	add	r0, r0, #800
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	VP8DEC_GetImageBuffer
.L533:
	add	r0, r3, #229376
	add	r0, r0, #800
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	MVC_DEC_GetImageBuffer
.L535:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L542:
	ldr	ip, .L543+4
	movw	r2, #4785
	ldr	r3, .L543+8
.L539:
	ldr	r1, .L543+12
	mov	r0, #0
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L540:
	ldr	ip, .L543+4
	movw	r2, #4783
	ldr	r3, .L543+16
	b	.L539
.L541:
	ldr	ip, .L543+4
	mov	r0, r3
	movw	r2, #4784
	ldr	r3, .L543+20
	ldr	r1, .L543+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L544:
	.align	2
.L543:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC51
	.word	.LC1
	.word	.LC50
	.word	.LC37
	UNWIND(.fnend)
	.size	VCTRL_GetImageBuffer, .-VCTRL_GetImageBuffer
	.align	2
	.global	VCTRL_ConfigFFFBSpeed
	.type	VCTRL_ConfigFFFBSpeed, %function
VCTRL_ConfigFFFBSpeed:
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
	cmp	r0, #15
	bhi	.L552
	ldr	r3, .L556
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L553
	ldr	r2, [r3, #12]
	cmp	r2, #1
	bne	.L554
	cmp	r1, #0
	beq	.L555
	ldr	r2, [r1]
	mov	r0, #0
	str	r2, [r3, #1220]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L554:
	ldr	ip, .L556+4
	movw	r2, #4890
	ldr	r3, .L556+8
.L551:
	ldr	r1, .L556+12
	mov	r0, #0
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L552:
	ldr	ip, .L556+4
	movw	r2, #4888
	ldr	r3, .L556+16
	b	.L551
.L553:
	ldr	ip, .L556+4
	mov	r0, r3
	movw	r2, #4889
	ldr	r3, .L556+20
	ldr	r1, .L556+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L555:
	ldr	ip, .L556+4
	mov	r0, r1
	ldr	r3, .L556+24
	movw	r2, #4891
	ldr	r1, .L556+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L557:
	.align	2
.L556:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC53
	.word	.LC1
	.word	.LC6
	.word	.LC52
	.word	.LC54
	UNWIND(.fnend)
	.size	VCTRL_ConfigFFFBSpeed, .-VCTRL_ConfigFFFBSpeed
	.align	2
	.global	VCTRL_ConfigPVRInfo
	.type	VCTRL_ConfigPVRInfo, %function
VCTRL_ConfigPVRInfo:
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
	cmp	r0, #15
	bhi	.L565
	ldr	r3, .L569
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L566
	ldr	r3, [r0, #12]
	cmp	r3, #1
	bne	.L567
	cmp	r1, #0
	beq	.L568
	ldr	r3, .L569+4
	add	r0, r0, #1232
	mov	r2, #20
	add	r0, r0, #8
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L567:
	ldr	ip, .L569+4
	movw	r2, #4903
	ldr	r3, .L569+8
.L564:
	ldr	r1, .L569+12
	mov	r0, #0
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L565:
	ldr	ip, .L569+4
	movw	r2, #4901
	ldr	r3, .L569+16
	b	.L564
.L568:
	ldr	ip, .L569+4
	mov	r0, r1
	ldr	r3, .L569+20
	movw	r2, #4904
	ldr	r1, .L569+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L566:
	ldr	ip, .L569+4
	movw	r2, #4902
	ldr	r3, .L569+24
	ldr	r1, .L569+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L570:
	.align	2
.L569:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC53
	.word	.LC1
	.word	.LC6
	.word	.LC54
	.word	.LC52
	UNWIND(.fnend)
	.size	VCTRL_ConfigPVRInfo, .-VCTRL_ConfigPVRInfo
	.align	2
	.global	VCTRL_IsChanDecable
	.type	VCTRL_IsChanDecable, %function
VCTRL_IsChanDecable:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
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
	cmp	r0, #15
	mov	r4, r0
	bhi	.L574
	ldr	r5, .L580
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	beq	.L574
	sub	r1, fp, #44
	bl	SM_GetInfo
	cmp	r0, #0
	bne	.L574
	ldr	r3, [fp, #-36]
	cmp	r3, #16
	bgt	.L575
	ldr	r3, [fp, #-28]
	cmp	r3, #524288
	ble	.L574
.L575:
	mov	r0, r4
	bl	VCTRL_GetImageBuffer
	subs	r0, r0, #1
	mvnne	r0, #0
	cmp	r0, #0
	bne	.L573
	ldr	r3, .L580+4
	ldr	r3, [r3]
	blx	r3
	ldr	r3, [r5, r4, asl #2]
	ldr	r3, [r3, #44]
	rsb	r0, r3, r0
	cmp	r0, #50
	movls	r0, #0
	mvnhi	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L574:
	mvn	r0, #0
.L573:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L581:
	.align	2
.L580:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_IsChanDecable, .-VCTRL_IsChanDecable
	.align	2
	.global	VCTRL_IsChanSegEnough
	.type	VCTRL_IsChanSegEnough, %function
VCTRL_IsChanSegEnough:
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
	cmp	r0, #15
	bhi	.L585
	ldr	r3, .L586
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L585
	ldr	r0, [r3, #316]
	subs	r0, r0, #1
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L585:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L587:
	.align	2
.L586:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_IsChanSegEnough, .-VCTRL_IsChanSegEnough
	.align	2
	.global	VCTRL_IsChanActive
	.type	VCTRL_IsChanActive, %function
VCTRL_IsChanActive:
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
	cmp	r0, #15
	bhi	.L594
	ldr	r3, .L595
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L594
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L594
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L594
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L594
	ldr	r0, [r3, #528]
	cmp	r0, #20
	movne	r0, #0
	mvneq	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L594:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L596:
	.align	2
.L595:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_IsChanActive, .-VCTRL_IsChanActive
	.align	2
	.global	USERDEC_Init
	.type	USERDEC_Init, %function
USERDEC_Init:
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
	ldr	r5, .L614
	mov	r4, r0
	ldr	r7, [r0, #352]
	mov	r2, #368
	mov	r6, r1
	mov	r1, #0
	ldr	r3, [r5, #48]
	blx	r3
	add	r0, r4, #8
	str	r7, [r4, #352]
	bl	ResetVoQueue
	ldr	r0, .L614+4
	mov	r2, #0
	str	r6, [r4]
.L601:
	ldr	r1, [r0], #4
	cmp	r1, #0
	add	r3, r1, #229376
	add	r3, r3, #800
	beq	.L598
	cmp	r4, r3
	beq	.L613
.L598:
	add	r2, r2, #1
	cmp	r2, #16
	bne	.L601
	mvn	r3, #0
	str	r3, [r4, #360]
.L599:
	ldr	r3, [r5, #68]
	mov	r0, #0
	ldr	r1, .L614+8
	blx	r3
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L613:
	cmn	r2, #1
	str	r2, [r4, #360]
	beq	.L599
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L615:
	.align	2
.L614:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC55
	UNWIND(.fnend)
	.size	USERDEC_Init, .-USERDEC_Init
	.align	2
	.global	USERDEC_RecycleImage
	.type	USERDEC_RecycleImage, %function
USERDEC_RecycleImage:
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
	mov	r5, r1
	beq	.L618
	mov	r2, #0
	ldr	r0, [r4, #360]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #360]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L619
	ldr	r1, [r5, #212]
	mov	r6, #0
	ldr	r0, [r4, #360]
	bl	FreeUsdByDec
	str	r6, [r5, #212]
	ldr	r1, [r5, #216]
	ldr	r0, [r4, #360]
	bl	FreeUsdByDec
	str	r6, [r5, #216]
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L619:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L618:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	USERDEC_RecycleImage, .-USERDEC_RecycleImage
	.align	2
	.global	VCTRL_GetUsrdecFrame
	.type	VCTRL_GetUsrdecFrame, %function
VCTRL_GetUsrdecFrame:
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
	cmp	r0, #15
	mov	r4, r0
	mov	r7, r1
	bhi	.L639
	ldr	r6, .L646
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L640
	ldr	r2, [r3, #528]
	cmp	r2, #19
	bne	.L641
	ldr	r3, [r3, #468]
	cmp	r3, #2
	ble	.L642
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	bne	.L643
	mov	r1, r0
	mov	r0, r4
	bl	FSP_NewLogicFs
	subs	r8, r0, #0
	blt	.L644
	mov	r1, r8
	mov	r0, r4
	bl	FSP_GetLogicFs
	ldr	r9, .L646+4
	mov	r2, r8
	ldr	r1, .L646+8
	ldr	r3, [r9, #68]
	mov	r5, r0
	mov	r0, #18
	blx	r3
	cmp	r5, #0
	beq	.L645
	ldr	r2, [r5, #520]
	cmp	r2, #0
	beq	.L629
	ldr	r3, [r5, #524]
	cmp	r3, #0
	beq	.L629
	ldr	r1, [r5, #528]
	cmp	r1, #0
	beq	.L629
	ldr	ip, [r1, #12]
	mov	r0, #18
	ldr	r3, [r3, #12]
	ldr	r2, [r2, #12]
	ldr	r8, [r9, #68]
	ldr	r1, .L646+12
	str	ip, [sp]
	blx	r8
	ldr	r3, [r5, #520]
	mov	r0, #0
	ldr	r3, [r3, #12]
	str	r3, [r7]
	ldr	r3, [r6, r4, asl #2]
	ldr	r3, [r3, #464]
	str	r3, [r7, #8]
.L622:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L643:
	ldr	r3, .L646+4
	mov	r0, #0
	ldr	r1, .L646+16
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L622
.L641:
	ldr	r3, .L646+4
	mov	r0, #0
	ldr	r1, .L646+20
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L622
.L642:
	ldr	r3, .L646+4
	mov	r0, #0
	ldr	r1, .L646+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L622
.L629:
	ldr	r3, [r9, #68]
	mov	r0, #0
	ldr	r1, .L646+28
	blx	r3
	mvn	r0, #0
	b	.L622
.L639:
	ldr	ip, .L646+4
	movw	r2, #5272
	ldr	r3, .L646+32
	mov	r0, #0
	ldr	r1, .L646+36
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L622
.L644:
	ldr	r3, .L646+4
	mov	r0, #0
	ldr	r1, .L646+40
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L622
.L640:
	ldr	ip, .L646+4
	mov	r0, r3
	movw	r2, #5273
	ldr	r3, .L646+44
	ldr	r1, .L646+36
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L622
.L645:
	ldr	r3, [r9, #68]
	movw	r2, #5309
	ldr	r1, .L646+48
	mov	r0, #22
	blx	r3
	mvn	r0, #0
	b	.L622
.L647:
	.align	2
.L646:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC60
	.word	.LC62
	.word	.LC58
	.word	.LC56
	.word	.LC57
	.word	.LC63
	.word	.LC6
	.word	.LC1
	.word	.LC59
	.word	.LC2
	.word	.LC61
	UNWIND(.fnend)
	.size	VCTRL_GetUsrdecFrame, .-VCTRL_GetUsrdecFrame
	.align	2
	.global	InitSyntaxCtx
	.type	InitSyntaxCtx, %function
InitSyntaxCtx:
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
	ldr	r3, .L666
	ldr	r1, [r3, r0, asl #2]
	cmp	r1, #0
	beq	.L665
	ldr	r3, [r1, #528]
	cmp	r3, #19
	ldrls	pc, [pc, r3, asl #2]
	b	.L648
.L652:
	.word	.L651
	.word	.L653
	.word	.L654
	.word	.L655
	.word	.L648
	.word	.L656
	.word	.L657
	.word	.L648
	.word	.L658
	.word	.L659
	.word	.L660
	.word	.L660
	.word	.L660
	.word	.L661
	.word	.L648
	.word	.L648
	.word	.L662
	.word	.L663
	.word	.L648
	.word	.L664
.L664:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	USERDEC_Init
.L651:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_Init
.L653:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1DEC_Init
.L654:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_Init
.L655:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_Init
.L656:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	DIVX3DEC_Init
.L657:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVSDEC_Init
.L658:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL8DEC_Init
.L659:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL9DEC_Init
.L660:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP6DEC_Init
.L661:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP8DEC_Init
.L662:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_DEC_Init
.L663:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_Init
.L648:
	ldmfd	sp, {fp, sp, pc}
.L665:
	ldr	ip, .L666+4
	mov	r0, r1
	ldr	r3, .L666+8
	movw	r2, #5391
	ldr	r1, .L666+12
	ldr	ip, [ip, #68]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	ip
.L667:
	.align	2
.L666:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC2
	.word	.LC1
	UNWIND(.fnend)
	.size	InitSyntaxCtx, .-InitSyntaxCtx
	.align	2
	.global	VCTRL_GetChanMemSizeWithOption
	.type	VCTRL_GetChanMemSizeWithOption, %function
VCTRL_GetChanMemSizeWithOption:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 816
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #844)
	sub	sp, sp, #844
	subs	r4, r1, #0
	mov	r7, r0
	mov	r5, r2
	mov	r8, r3
	beq	.L702
	cmp	r2, #0
	beq	.L703
	cmp	r0, #26
	movw	r3, #28464
	movw	r6, #57560
	movt	r3, 8
	movt	r6, 176
	movne	r6, r3
	cmp	r8, #2
	beq	.L673
	ldr	r1, .L712
	ldr	r2, [r4, #36]
	ldr	r0, [r4, #60]
	ldr	ip, [r1, #2696]
	ldr	r3, [r1, #2692]
	add	r9, r0, ip
	add	r1, r2, r3
	orrs	lr, r9, r1
	bmi	.L704
	cmp	r1, #16
	strle	r1, [r4, #36]
	strle	r9, [r4, #60]
	bgt	.L705
.L676:
	subs	r3, r7, #25
	movne	r3, #1
	cmp	r8, #0
	movne	r3, #0
	cmp	r3, #0
	bne	.L706
.L673:
	ldr	r1, [r4, #36]
	cmp	r1, #0
	blt	.L677
	ldr	r2, [r4, #12]
	cmp	r2, #31
	ble	.L677
	ldr	r3, [r4, #16]
	cmp	r3, #31
	ble	.L677
	ldr	r0, [r4, #56]
	cmp	r0, #262144
	blt	.L677
	ldr	r0, [r4, #44]
	cmp	r0, #1
	beq	.L707
	cmp	r0, #2
	beq	.L708
.L679:
	ldr	r0, [r4, #40]
	cmp	r0, #0
	moveq	r0, #1
	bne	.L709
.L681:
	ldr	ip, .L712+4
	sub	r8, r7, #27
	cmp	r8, #6
	ldr	lr, [r4, #60]
	ldr	r9, [ip, #48]
	mvncc	ip, #1
	mvncs	ip, #0
	cmp	r9, #0
	beq	.L683
	add	r1, r1, lr
	str	ip, [sp, #12]
	add	r1, r1, #2
	stmia	sp, {r0, r1}
	sub	r0, fp, #856
	mov	r1, #0
	str	r0, [sp, #16]
	mov	r0, #1
	str	r1, [sp, #8]
	mvn	r1, #-2147483648
	blx	r9
	cmp	r0, #0
	bne	.L683
	ldr	r3, [fp, #-852]
	add	r2, r3, #16
	str	r2, [r5]
	ldr	r2, [r4, #144]
	cmp	r2, #1
	addne	r3, r3, #47616
	addne	r3, r3, #16
	ldreq	r3, [r4, #56]
	strne	r3, [r5]
	ldrne	r3, [r4, #56]
	addeq	r3, r3, #79872
	addeq	r3, r3, #528
	str	r6, [r5, #8]
	addne	r3, r3, #32768
	str	r3, [r5, #4]
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L686
	ldr	r1, [r4, #20]
	movw	r0, #4060
	ldr	lr, [r4, #28]
	mov	r3, #4000
	ldr	ip, [r4, #32]
	mov	r2, #2208
	mul	r1, r0, r1
	mla	r3, r3, lr, r1
	mla	r3, r2, ip, r3
	cmp	r3, #0
	movcc	r3, #0
	cmp	r7, #26
	beq	.L710
.L686:
	cmp	r8, #5
	bhi	.L687
.L711:
	movw	r2, #51528
	movt	r2, 13
	cmp	r3, r2
	movcc	r3, r2
.L687:
	mov	r0, #0
	add	r3, r3, r6
	str	r3, [r5, #8]
.L670:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L709:
	add	r0, r1, #1
	cmp	r0, #17
	movge	r0, #17
	b	.L681
.L708:
	ldr	r0, [r4, #20]
	cmp	r0, #0
	ble	.L677
	ldr	r0, [r4, #24]
	cmp	r0, #0
	ble	.L677
.L701:
	ldr	r0, [r4, #28]
	cmp	r0, #0
	ble	.L677
	ldr	r0, [r4, #32]
	cmp	r0, #0
	bgt	.L679
.L677:
	ldr	r3, .L712+8
	mov	r0, #32
	ldr	r1, .L712+12
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L705:
	ldr	ip, .L712+8
	mov	r0, #32
	ldr	r1, .L712+16
	ldr	r10, [ip, #68]
	blx	r10
	mov	r3, #16
	str	r9, [r4, #60]
	str	r3, [r4, #36]
	b	.L676
.L683:
	ldr	r3, .L712+8
	movw	r2, #5661
	ldr	r1, .L712+20
	mov	r0, #0
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L707:
	ldr	r0, [r4, #20]
	cmp	r0, #0
	bgt	.L701
	b	.L677
.L710:
	movw	r0, #3992
	mov	r2, #2240
	mla	r1, r0, lr, r1
	mla	ip, r2, ip, r1
	cmp	r3, ip
	movcc	r3, ip
	cmp	r8, #5
	bls	.L711
	b	.L687
.L706:
	ldr	r3, .L712+8
	mov	r0, #32
	ldr	r1, .L712+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L670
.L704:
	ldr	r1, .L712+8
	stmia	sp, {r0, ip}
	mov	r0, #32
	ldr	r4, [r1, #68]
	ldr	r1, .L712+28
	blx	r4
	mvn	r0, #0
	b	.L670
.L703:
	ldr	ip, .L712+8
	mov	r0, r2
	ldr	r3, .L712+32
	movw	r2, #5494
	ldr	r1, .L712+36
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L670
.L702:
	ldr	ip, .L712+8
	mov	r0, r4
	ldr	r3, .L712+40
	movw	r2, #5493
	ldr	r1, .L712+36
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L670
.L713:
	.align	2
.L712:
	.word	.LANCHOR0
	.word	g_vdm_hal_fun_ptr
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC69
	.word	.LC67
	.word	.LC70
	.word	.LC68
	.word	.LC66
	.word	.LC65
	.word	.LC1
	.word	.LC64
	UNWIND(.fnend)
	.size	VCTRL_GetChanMemSizeWithOption, .-VCTRL_GetChanMemSizeWithOption
	.align	2
	.global	VCTRL_GetChanMemSize
	.type	VCTRL_GetChanMemSize, %function
VCTRL_GetChanMemSize:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 840
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #876)
	sub	sp, sp, #876
	cmp	r0, #32
	mov	r4, r0
	str	r1, [fp, #-868]
	str	r2, [fp, #-872]
	bhi	.L739
	mov	r2, r0, asl #5
	mov	r3, r0, asl #2
	ldr	r10, .L741
	str	r3, [fp, #-880]
	rsb	r3, r3, r2
	add	r3, r10, r3
	str	r2, [fp, #-884]
	sub	r2, r0, #18
	ldr	r1, [r3, #16]
	ldr	r8, [r3, #12]
	ldr	r9, [r3, #8]
	str	r1, [fp, #-864]
	ldr	r1, [r3, #20]
	str	r1, [fp, #-876]
	cmp	r2, #7
	ldrls	pc, [pc, r2, asl #2]
	b	.L717
.L719:
	.word	.L732
	.word	.L732
	.word	.L732
	.word	.L732
	.word	.L732
	.word	.L720
	.word	.L720
	.word	.L720
.L732:
	mov	r3, #3
.L718:
	ldr	r7, .L741+4
	rsb	r3, r3, r8
	sub	r3, r3, #2
	ldr	r2, [r7, #2692]
	cmp	r2, #0
	movlt	r2, #0
	strlt	r2, [r7, #2692]
	cmp	r3, #15
	movgt	r6, #0
	bgt	.L722
	ldr	r6, [r7, #2692]
	add	r3, r3, r6
	cmp	r3, #16
	rsbgt	r3, r3, #16
	addgt	r6, r6, r3
.L722:
	add	r3, r9, r6
	ldr	r5, [r7, #2696]
	cmp	r3, #0
	ble	.L740
	cmp	r3, #17
	movlt	r9, r3
	movge	r9, #17
.L724:
	cmp	r4, #23
	bhi	.L725
	ldr	r3, [fp, #-864]
	add	r5, r6, r5
	add	r2, r5, r8
	add	r1, r3, r5
	ldr	r3, [fp, #-876]
	cmp	r2, #0
	cmpgt	r1, #0
	add	r5, r3, r5
	movle	r3, #1
	movgt	r3, #0
	cmp	r5, #0
	orrle	r3, r3, #1
	cmp	r3, #0
	streq	r5, [fp, #-876]
	streq	r1, [fp, #-864]
	moveq	r8, r2
	beq	.L725
	ldr	r1, [r7, #2696]
	mov	r3, r6
	ldr	ip, .L741+8
	mov	r2, r8
	str	r6, [sp, #20]
	mov	r0, #32
	str	r1, [sp, #24]
	str	r1, [sp, #12]
	str	r1, [sp]
	ldr	r1, [fp, #-876]
	str	r6, [sp, #8]
	str	r1, [sp, #16]
	ldr	r1, [fp, #-864]
	str	r1, [sp, #4]
	ldr	r1, .L741+12
	ldr	r4, [ip, #68]
	blx	r4
.L725:
	ldr	r5, .L741+16
	ldr	r6, [r5, #48]
	cmp	r6, #0
	beq	.L726
	ldr	r3, [fp, #-884]
	sub	r1, fp, #856
	ldr	r2, [fp, #-880]
	mov	r0, #1
	str	r8, [sp, #4]
	mvn	r8, #0
	rsb	r7, r2, r3
	str	r9, [sp]
	add	r4, r10, r7
	ldr	r2, [r10, r7]
	ldr	r3, [r4, #4]
	str	r1, [sp, #16]
	mov	r1, #0
	str	r8, [sp, #12]
	str	r1, [sp, #8]
	mvn	r1, #-2147483648
	blx	r6
	ldr	r6, .L741
	cmp	r0, #0
	bne	.L726
	ldr	r2, [fp, #-868]
	ldr	r3, [fp, #-852]
	add	r3, r3, #47616
	add	r3, r3, #16
	str	r3, [r2]
	ldr	r2, [fp, #-872]
	ldr	r3, [r4, #24]
	add	r3, r3, #32768
	str	r3, [r2]
	ldr	r10, [r5, #48]
	cmp	r10, #0
	beq	.L728
	ldr	r3, [r4, #4]
	sub	ip, fp, #856
	ldr	r2, [r6, r7]
	mvn	r1, #-2147483648
	str	r0, [sp, #8]
	ldr	r0, [fp, #-864]
	str	ip, [sp, #16]
	str	r8, [sp, #12]
	str	r0, [sp, #4]
	mov	r0, #1
	str	r9, [sp]
	blx	r10
	subs	ip, r0, #0
	bne	.L728
	ldr	r2, [fp, #-868]
	ldr	r3, [fp, #-852]
	add	r3, r3, #47616
	add	r3, r3, #16
	str	r3, [r2, #4]
	ldr	r2, [fp, #-872]
	ldr	r3, [r4, #24]
	add	r3, r3, #32768
	str	r3, [r2, #4]
	ldr	r5, [r5, #48]
	cmp	r5, #0
	beq	.L731
	ldr	r2, [r6, r7]
	sub	r0, fp, #856
	ldr	r3, [r4, #4]
	mvn	r1, #-2147483648
	str	ip, [sp, #8]
	ldr	ip, [fp, #-876]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r8, [sp, #12]
	stmia	sp, {r9, ip}
	blx	r5
	cmp	r0, #0
	bne	.L731
	ldr	r2, [fp, #-868]
	ldr	r3, [fp, #-852]
	add	r3, r3, #47616
	add	r3, r3, #16
	str	r3, [r2, #8]
	ldr	r2, [fp, #-872]
	ldr	r3, [r4, #24]
	add	r3, r3, #32768
	str	r3, [r2, #8]
.L716:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L720:
	mov	r3, #1
	b	.L718
.L717:
	mov	r3, #6
	b	.L718
.L726:
	ldr	r3, .L741+8
	movw	r2, #5827
.L738:
	ldr	r1, .L741+20
	mov	r0, #0
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L728:
	ldr	r3, .L741+8
	movw	r2, #5848
	b	.L738
.L731:
	ldr	r3, .L741+8
	movw	r2, #5869
	b	.L738
.L740:
	ldr	ip, .L741+8
	mov	r2, r9
	mov	r3, r6
	ldr	r1, .L741+24
	mov	r0, #32
	ldr	ip, [ip, #68]
	blx	ip
	cmp	r9, #17
	movge	r9, #17
	b	.L724
.L739:
	ldr	ip, .L741+8
	movw	r2, #5726
	ldr	r3, .L741+28
	mov	r0, #0
	ldr	r1, .L741+32
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L716
.L742:
	.align	2
.L741:
	.word	CapItem
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC73
	.word	g_vdm_hal_fun_ptr
	.word	.LC74
	.word	.LC72
	.word	.LC71
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_GetChanMemSize, .-VCTRL_GetChanMemSize
	.align	2
	.global	CloseDrivers
	.type	CloseDrivers, %function
CloseDrivers:
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
	ldr	r5, [r0, #12]
	mov	r4, r0
	ldr	r6, [r0, #8]
	cmp	r5, #0
	ldr	r7, [r0, #4]
	beq	.L744
	ldr	r3, .L788
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L779
	mov	r0, #0
	ldr	r8, .L788+4
	blx	r3
.L747:
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_ReleaseMemBlock
	ldr	r3, [r8, #48]
	mov	r2, #16
	mov	r1, #0
	mov	r0, r4
	blx	r3
.L744:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #28]
	ldr	r6, [r4, #24]
	cmp	r5, #0
	ldr	r7, [r4, #20]
	bne	.L780
.L748:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	bl	SM_InstInit
	ldr	r5, [r4, #60]
	ldr	r6, [r4, #56]
	cmp	r5, #0
	ldr	r7, [r4, #52]
	bne	.L781
.L749:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #108]
	ldr	r6, [r4, #104]
	cmp	r5, #0
	ldr	r7, [r4, #100]
	bne	.L782
.L750:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #92]
	ldr	r6, [r4, #88]
	cmp	r5, #0
	ldr	r7, [r4, #84]
	bne	.L783
.L751:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #76]
	ldr	r6, [r4, #72]
	cmp	r5, #0
	ldr	r7, [r4, #68]
	bne	.L784
.L752:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #124]
	ldr	r6, [r4, #120]
	cmp	r5, #0
	ldr	r7, [r4, #116]
	bne	.L785
.L753:
	ldr	r4, .L788+8
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r3, [r4, #224]
	cmp	r3, #1
	beq	.L786
.L754:
	ldr	r3, [r4, #228]
	ldr	r4, .L788+8
	cmp	r3, #1
	beq	.L787
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L780:
	mov	r0, #0
	bl	SM_CloseSCDDrv
	ldr	r1, [r4, #20]
	ldr	r0, [r4, #24]
	bl	MEM_ReleaseMemBlock
	ldr	r3, .L788+4
	mov	r2, #16
	mov	r1, #0
	add	r0, r4, r2
	ldr	r3, [r3, #48]
	blx	r3
	b	.L748
.L781:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L788+4
	mov	r2, #16
	mov	r1, #0
	add	r0, r4, #48
	ldr	r3, [r3, #48]
	blx	r3
	b	.L749
.L785:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L788+4
	add	r0, r4, #112
	mov	r2, #16
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
	b	.L753
.L784:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L788+4
	mov	r2, #16
	mov	r1, #0
	add	r0, r4, #64
	ldr	r3, [r3, #48]
	blx	r3
	b	.L752
.L783:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L788+4
	mov	r2, #16
	mov	r1, #0
	add	r0, r4, #80
	ldr	r3, [r3, #48]
	blx	r3
	b	.L751
.L782:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L788+4
	mov	r2, #16
	mov	r1, #0
	add	r0, r4, #96
	ldr	r3, [r3, #48]
	blx	r3
	b	.L750
.L779:
	ldr	r8, .L788+4
	mov	r0, r3
	movw	r2, #6177
	ldr	r1, .L788+12
	ldr	r3, [r8, #68]
	blx	r3
	b	.L747
.L787:
	ldr	r3, .L788+4
	mov	r0, #3
	ldr	r5, [r3, #184]
	bl	VFMW_GetString
	mov	r2, #0
	mov	r1, r0
	mov	r0, #136
	blx	r5
	mov	r3, #0
	mov	r0, #0
	str	r3, [r4, #228]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L786:
	ldr	r3, .L788+4
	mov	r0, #0
	ldr	r5, [r3, #184]
	bl	VFMW_GetString
	mov	r2, #0
	mov	r1, r0
	mov	r0, #127
	blx	r5
	mov	r3, #0
	str	r3, [r4, #224]
	b	.L754
.L789:
	.align	2
.L788:
	.word	g_vdm_hal_fun_ptr
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC8
	UNWIND(.fnend)
	.size	CloseDrivers, .-CloseDrivers
	.align	2
	.global	OpenDrivers
	.type	OpenDrivers, %function
OpenDrivers:
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
	UNWIND(.pad #44)
	sub	sp, sp, #44
	add	r5, r0, #48
	mov	r4, r0
	mov	r0, #0
	mov	r1, #4096
	mov	r2, r5
	movt	r0, 63683
	bl	MEM_MapRegisterAddr
	subs	r6, r0, #0
	bne	.L796
	ldr	r2, [r4, #60]
	add	r5, r4, #96
	ldr	r1, [r4, #52]
	ldr	r0, [r4, #56]
	bl	MEM_AddMemRecord
	mov	r0, #0
	mov	r2, r5
	movt	r0, 63686
	mov	r1, #4096
	bl	MEM_MapRegisterAddr
	cmp	r0, #0
	bne	.L823
	ldr	r6, .L826
	ldr	r3, [r6, #24]
	cmp	r3, #0
	beq	.L796
	blx	r3
	subs	r7, r0, #0
	bne	.L796
	ldr	r2, [r4, #108]
	add	r5, r4, #80
	ldr	r1, [r4, #100]
	ldr	r0, [r4, #104]
	bl	MEM_AddMemRecord
	mov	r0, #49152
	mov	r1, #4096
	mov	r2, r5
	movt	r0, 63683
	bl	MEM_MapRegisterAddr
	subs	r8, r0, #0
	ldrne	r3, .L826+4
	movne	r1, r7
	beq	.L825
.L821:
	mov	r0, r5
	mov	r2, #16
.L818:
	ldr	r3, [r3, #48]
	blx	r3
	mov	r0, r4
	bl	CloseDrivers
	mvn	r0, #0
.L794:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L796:
	ldr	r3, .L826+4
	mov	r0, r5
	mov	r2, #16
	mov	r1, #0
	b	.L818
.L825:
	ldr	r7, .L826+4
	ldr	r2, [r4, #92]
	ldr	r1, [r4, #84]
	ldr	r0, [r4, #88]
	bl	MEM_AddMemRecord
	mov	r0, #11
	ldr	r9, [r7, #72]
	bl	VFMW_GetString
	mov	r3, r8
	mov	r1, #20
	mov	r2, r0
	sub	r0, fp, #64
	blx	r9
	ldr	r3, [r6, #36]
	cmp	r3, #0
	beq	.L799
	blx	r3
	subs	r2, r0, #0
	ble	.L799
	str	r8, [sp]
	mov	r3, r4
	mov	r1, r8
	sub	r0, fp, #64
	bl	MEM_AllocMemBlock
	subs	r5, r0, #0
	bne	.L800
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_AddMemRecord
	ldr	r3, [r7, #48]
	mov	r2, #12
	mov	r1, r5
	sub	r0, fp, #76
	blx	r3
	ldr	r3, [r6, #40]
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #12]
	cmp	r3, #0
	str	r5, [fp, #-68]
	str	r1, [fp, #-76]
	str	r2, [fp, #-72]
	beq	.L801
	sub	r0, fp, #76
	blx	r3
	cmp	r0, #0
	bne	.L801
	bl	VDMDRV_Init
	mov	r0, #12
	ldr	r7, [r7, #72]
	bl	VFMW_GetString
	mov	r3, #0
	mov	r1, #20
	mov	r5, r3
	add	r8, r4, #16
	ldr	r6, .L826+4
	mov	r2, r0
	sub	r0, fp, #64
	blx	r7
	bl	get_scd_msg_size
	mov	r3, r8
	str	r5, [sp]
	mov	r1, r5
	mov	r2, r0
	sub	r0, fp, #64
	bl	MEM_AllocMemBlock
	subs	r7, r0, #0
	bne	.L805
	ldr	r2, [r4, #28]
	ldr	r1, [r4, #20]
	ldr	r0, [r4, #24]
	bl	MEM_AddMemRecord
	mov	r2, r7
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #24]
	bl	SM_OpenSCDDrv
	subs	r5, r0, #0
	bne	.L820
	bl	SM_InstInit
	mov	r0, r5
	ldr	r7, [r6, #180]
	bl	VFMW_GetString
	str	r5, [sp]
	mov	r2, #32
	ldr	r1, .L826+8
	mov	r3, r0
	mov	r0, #127
	blx	r7
	subs	r7, r0, #0
	bne	.L805
	ldr	r5, .L826+12
	mov	r0, #3
	mov	r9, #1
	ldr	r10, [r6, #180]
	str	r9, [r5, #224]
	bl	VFMW_GetString
	str	r7, [sp]
	mov	r2, #32
	ldr	r1, .L826+16
	mov	r3, r0
	mov	r0, #136
	blx	r10
	cmp	r0, #0
	streq	r9, [r5, #228]
	beq	.L794
.L820:
	ldr	r3, [r6, #48]
	mov	r1, r7
.L819:
	mov	r2, #16
	mov	r0, r8
	blx	r3
	mov	r0, r4
	bl	CloseDrivers
	mvn	r0, #0
	b	.L794
.L799:
	ldr	r3, [r7, #48]
	mov	r2, #16
	mov	r1, #0
	mov	r0, r5
	blx	r3
	mov	r0, r4
	bl	CloseDrivers
	mvn	r0, #0
	b	.L794
.L823:
	ldr	r3, .L826+4
	mov	r1, r6
	b	.L821
.L805:
	ldr	r3, [r6, #48]
	mov	r1, r5
	b	.L819
.L801:
	ldr	r3, [r7, #48]
	mov	r2, #16
	mov	r1, #0
.L822:
	mov	r0, r4
	blx	r3
	mov	r0, r4
	bl	CloseDrivers
	mvn	r0, #0
	b	.L794
.L800:
	ldr	r3, [r7, #48]
	mov	r1, r8
	mov	r2, #16
	b	.L822
.L827:
	.align	2
.L826:
	.word	g_vdm_hal_fun_ptr
	.word	vfmw_Osal_Func_Ptr_S
	.word	VCTRL_Isr_0
	.word	.LANCHOR0
	.word	VCTRL_Scd_Isr
	UNWIND(.fnend)
	.size	OpenDrivers, .-OpenDrivers
	.align	2
	.global	VCTRL_OpenVfmw
	.type	VCTRL_OpenVfmw, %function
VCTRL_OpenVfmw:
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
	UNWIND(.pad #16)
	sub	sp, sp, #16
	ldr	r4, .L863
	ldr	r6, .L863+4
	mov	r2, #8
	sub	r0, fp, #44
	mov	r1, #0
	ldr	r3, [r4, #48]
	blx	r3
	ldr	r5, [r6, #64]
	cmp	r5, #0
	bne	.L849
	mov	r1, #1024
	ldr	r3, [r4, #84]
	str	r5, [fp, #-48]
	ldr	r0, .L863+8
	blx	r3
	ldr	r3, [r4, #100]
	ldr	r1, .L863+12
	ldr	r0, .L863+8
	blx	r3
	cmp	r0, #0
	str	r0, [fp, #-48]
	beq	.L830
	ldr	r3, [r4, #96]
	sub	r0, fp, #48
	ldr	r1, .L863+16
	blx	r3
	cmp	r0, #0
	beq	.L850
	sub	r0, fp, #48
	ldr	r3, [r4, #96]
	ldr	r1, .L863+20
	blx	r3
	cmp	r0, #0
	beq	.L858
	mov	r2, r5
	ldr	r3, [r4, #88]
	mov	r1, r5
	blx	r3
	mov	r2, r0
	str	r0, [r6, #2692]
.L834:
	add	r3, r2, #4992
	movw	r1, #10000
	add	r3, r3, #8
	movw	r7, #5000
	cmp	r3, r1
	bhi	.L835
	cmp	r2, r7
	movw	r3, #60536
.L857:
	movt	r3, 65535
	movge	r2, r7
	cmp	r2, r3
	movlt	r2, r3
.L831:
	str	r2, [r6, #2692]
.L833:
	mov	r8, #0
	ldr	r3, [r4, #84]
	mov	r1, #1024
	str	r8, [fp, #-48]
	ldr	r0, .L863+8
	blx	r3
	ldr	r3, [r4, #100]
	ldr	r1, .L863+24
	ldr	r0, .L863+8
	blx	r3
	ldr	r9, .L863+4
	ldr	r7, .L863
	cmp	r0, r8
	str	r0, [fp, #-48]
	beq	.L836
	ldr	r3, [r7, #96]
	sub	r0, fp, #48
	ldr	r1, .L863+16
	blx	r3
	cmp	r0, r8
	beq	.L837
	sub	r0, fp, #48
	ldr	r3, [r7, #96]
	ldr	r1, .L863+20
	blx	r3
	cmp	r0, r8
	beq	.L859
	mov	r2, r8
	ldr	r3, [r7, #88]
	mov	r1, r8
	blx	r3
	mov	r2, r0
	str	r0, [r9, #2696]
.L840:
	add	r3, r2, #4992
	movw	r1, #10000
	add	r3, r3, #8
	movw	r7, #5000
	cmp	r3, r1
	bhi	.L841
	cmp	r2, r7
	movw	r3, #60536
	movt	r3, 65535
	movlt	r5, r2
	movge	r5, r7
	cmp	r5, r3
	movlt	r5, r3
.L837:
	str	r5, [r6, #2696]
.L839:
	ldr	r5, [r6, #3724]
	mov	r3, #0
	ldr	r7, .L863+4
	cmp	r5, r3
	str	r3, [fp, #-48]
	beq	.L842
	ldr	r2, .L863+28
	and	r3, r5, #1
	ubfx	r1, r5, #1, #1
	strb	r3, [r7, #3728]
	ubfx	r3, r5, #2, #1
	ubfx	r5, r5, #3, #1
	strb	r1, [r2]
	strb	r3, [r7, #3729]
	strb	r5, [r7, #3730]
.L843:
	ldr	r5, .L863+4
	mov	r2, #176
	ldr	r3, [r4, #48]
	mov	r1, #0
	add	r0, r5, #64
	mov	r7, #1
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #64
	mov	r1, #0
	mov	r0, r5
	blx	r3
	ldr	r1, .L863+32
	sub	r0, fp, #44
	mov	r2, #134217728
	mov	r3, #75497472
	str	r2, [fp, #-44]
	str	r1, [r6, #2624]
	str	r3, [fp, #-40]
	str	r7, [r6, #68]
	bl	MEM_InitMemManager
	bl	FSP_Init
	ldr	r6, .L863
	bl	ChanCtx_Init
	ldr	r3, [r4, #48]
	mov	r2, #64
	mov	r1, #0
	ldr	r0, .L863+36
	blx	r3
	add	r0, r5, #88
	bl	OpenDrivers
	cmp	r0, #0
	bne	.L860
	ldr	r3, [r6, #128]
	mov	r1, r7
	blx	r3
	ldr	r3, [r6, #176]
	ldr	r2, .L863+40
	add	r0, r5, #76
	ldr	r1, .L863+44
	blx	r3
	cmp	r0, #0
	streq	r7, [r5, #64]
	moveq	r3, #3
	streq	r3, [r5, #68]
	bne	.L861
.L829:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L842:
	ldr	r3, [r4, #84]
	mov	r1, #1024
	ldr	r0, .L863+8
	blx	r3
	ldr	r3, [r4, #100]
	ldr	r1, .L863+48
	ldr	r0, .L863+8
	blx	r3
	ldr	r8, .L863
	cmp	r0, #0
	str	r0, [fp, #-48]
	beq	.L843
	ldr	r3, [r8, #96]
	sub	r0, fp, #48
	ldr	r1, .L863+16
	blx	r3
	cmp	r0, #0
	ldreq	r0, [r7, #3724]
	beq	.L845
	sub	r0, fp, #48
	ldr	r3, [r8, #96]
	ldr	r1, .L863+20
	blx	r3
	cmp	r0, #0
	beq	.L862
	ldr	r3, [r8, #88]
	mov	r2, r5
	mov	r1, r5
	blx	r3
	str	r0, [r7, #3724]
.L845:
	ldr	r2, .L863+28
	and	r3, r0, #1
	ubfx	r1, r0, #1, #1
	strb	r3, [r6, #3728]
	ubfx	r3, r0, #2, #1
	ubfx	r0, r0, #3, #1
	strb	r1, [r2]
	strb	r3, [r6, #3729]
	strb	r0, [r6, #3730]
	b	.L843
.L836:
	ldr	r2, [r9, #2696]
	b	.L840
.L830:
	ldr	r2, [r6, #2692]
	b	.L834
.L841:
	ldr	r3, [r4, #68]
	mov	r0, #32
	ldr	r1, .L863+52
	blx	r3
	ldr	r5, [r6, #2696]
	movw	r3, #60536
	cmp	r5, r7
	movt	r3, 65535
	movge	r5, r7
	cmp	r5, r3
	movlt	r5, r3
	b	.L837
.L835:
	ldr	r3, [r4, #68]
	mov	r0, #32
	ldr	r1, .L863+56
	blx	r3
	ldr	r2, [r6, #2692]
	movw	r3, #60536
	cmp	r2, r7
	b	.L857
.L850:
	mov	r2, r5
	b	.L831
.L849:
	mvn	r0, #0
	b	.L829
.L858:
	ldr	r7, [r4, #68]
	movw	r3, #7276
	ldr	r2, .L863+60
	mov	r0, #22
	ldr	r1, .L863+64
	blx	r7
	b	.L833
.L859:
	ldr	r5, [r7, #68]
	movw	r3, #7323
	ldr	r2, .L863+68
	mov	r0, #22
	ldr	r1, .L863+64
	blx	r5
	b	.L839
.L860:
	ldr	r3, [r6, #68]
	mov	r0, r7
	ldr	r1, .L863+72
	blx	r3
	mvn	r0, #0
	b	.L829
.L862:
	ldr	r5, [r8, #68]
	movw	r3, #7380
	ldr	r2, .L863+76
	mov	r0, #22
	ldr	r1, .L863+64
	blx	r5
	b	.L843
.L861:
	add	r0, r5, #88
	bl	CloseDrivers
	mvn	r0, #0
	b	.L829
.L864:
	.align	2
.L863:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LANCHOR0+2700
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC80
	.word	.LANCHOR2
	.word	VCTRL_EventReport
	.word	.LANCHOR0+3732
	.word	VFMW_CTRL_thread_proc
	.word	.LC84
	.word	.LC82
	.word	.LC81
	.word	.LC79
	.word	.LANCHOR1+140
	.word	.LC78
	.word	.LANCHOR1+160
	.word	.LC83
	.word	.LANCHOR1+180
	UNWIND(.fnend)
	.size	VCTRL_OpenVfmw, .-VCTRL_OpenVfmw
	.align	2
	.global	GetNextDecodeMode
	.type	GetNextDecodeMode, %function
GetNextDecodeMode:
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
	mov	r4, r2
	mov	ip, r4, asl #1
	movw	r2, #21846
	cmp	r4, #0
	movt	r2, 21845
	smull	r2, r3, ip, r2
	add	r5, r4, #7
	ldr	r6, .L872
	movge	r5, r4
	mov	r5, r5, asr #3
	mov	r7, r0
	str	r1, [sp, #4]
	mov	r8, r1
	str	r4, [sp]
	sub	r3, r3, ip, asr #31
	mov	r2, r5
	ldr	r9, [r6, #68]
	ldr	r1, .L872+4
	mov	r0, #30
	blx	r9
	cmp	r7, #3
	beq	.L870
	cmp	r4, r8
	blt	.L871
.L869:
	mov	r4, r7
.L867:
	ldr	r5, [r6, #68]
	mov	r2, r7
	mov	r3, r4
	ldr	r1, .L872+8
	mov	r0, #30
	blx	r5
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L871:
	ldr	r3, [r6, #68]
	mov	r0, #30
	ldr	r1, .L872+12
	mov	r4, #3
	blx	r3
	b	.L867
.L870:
	cmp	r5, r8
	ble	.L869
	ldr	r3, [r6, #68]
	mov	r0, #30
	ldr	r1, .L872+16
	mov	r4, #0
	blx	r3
	b	.L867
.L873:
	.align	2
.L872:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC85
	.word	.LC88
	.word	.LC87
	.word	.LC86
	UNWIND(.fnend)
	.size	GetNextDecodeMode, .-GetNextDecodeMode
	.align	2
	.global	VCTRL_GetChanIDByCtx
	.type	VCTRL_GetChanIDByCtx, %function
VCTRL_GetChanIDByCtx:
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
	ldr	ip, .L883
	mov	r2, #0
.L877:
	ldr	r1, [ip], #4
	cmp	r1, #0
	add	r3, r1, #229376
	add	r3, r3, #800
	beq	.L875
	cmp	r0, r3
	beq	.L878
.L875:
	add	r2, r2, #1
	cmp	r2, #16
	bne	.L877
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L878:
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
.L884:
	.align	2
.L883:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetChanIDByCtx, .-VCTRL_GetChanIDByCtx
	.align	2
	.global	VCTRL_GetChanIDByMemAddr
	.type	VCTRL_GetChanIDByMemAddr, %function
VCTRL_GetChanIDByMemAddr:
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
	ldr	ip, .L896
	mov	r2, #0
.L889:
	ldr	r3, [ip], #4
	cmp	r3, #0
	beq	.L886
	ldr	r1, [r3, #208]
	cmp	r1, r0
	bhi	.L887
	ldr	lr, [r3, #212]
	add	r1, r1, lr
	cmp	r0, r1
	bcc	.L891
.L887:
	ldr	r1, [r3, #224]
	cmp	r0, r1
	bcc	.L886
	ldr	r3, [r3, #228]
	add	r1, r1, r3
	cmp	r0, r1
	bcc	.L891
.L886:
	add	r2, r2, #1
	cmp	r2, #16
	bne	.L889
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L891:
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
.L897:
	.align	2
.L896:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetChanIDByMemAddr, .-VCTRL_GetChanIDByMemAddr
	.align	2
	.global	DecChanSyntax
	.type	DecChanSyntax, %function
DecChanSyntax:
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
	cmp	r0, #15
	mov	r4, r0
	bhi	.L968
	ldr	r6, .L983
	ldr	r0, [r6, r0, asl #2]
	cmp	r0, #0
	beq	.L969
	ldr	r9, [r0, #16]
	cmp	r9, #1
	bne	.L970
	ldr	r5, [r0, #28]
	cmp	r5, #0
	bne	.L971
	ldr	r7, .L983+4
	mov	r3, r4, asl #2
	str	r5, [r0, #316]
	mov	r8, r3
	str	r3, [fp, #-48]
	ldr	r3, [r7]
	blx	r3
	add	r2, r6, r8
	ldr	r1, .L983+8
	ldr	r3, [r2, #3796]
	ldr	r1, [r1]
	rsb	r3, r3, r0
	cmp	r3, r1
	ldr	r3, [r6, r4, asl #2]
	strhi	r0, [r2, #3796]
	movhi	r10, r9
	movls	r10, r5
	ldr	r3, [r3, #528]
	ldr	r1, .L983
	sub	r2, r3, #10
	cmp	r2, #2
	bhi	.L905
	ldr	r2, [r1, #2620]
	tst	r2, #1
	bne	.L905
.L906:
	mov	r0, r4
	bl	VCTRL_GetImageBuffer
	cmp	r0, #1
	beq	.L907
	cmp	r10, #1
	mvnne	r5, #2
	beq	.L972
.L945:
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L905:
	sub	r2, r3, #15
	bics	r2, r2, #4
	movne	r2, #1
	moveq	r2, #0
	cmp	r3, #4
	moveq	r3, #0
	andne	r3, r2, #1
	cmp	r3, #0
	beq	.L906
	mov	r0, r4
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L906
	cmp	r10, #1
	mvnne	r5, #1
	bne	.L945
	ldr	r3, [r7, #68]
	mov	r2, r4
	ldr	r1, .L983+12
	mov	r0, #23
	blx	r3
	mvn	r5, #1
	b	.L945
.L907:
	ldr	r3, [r6, r4, asl #2]
	ldr	r2, [r3, #1404]
	str	r3, [fp, #-52]
	cmp	r2, #0
	bne	.L973
.L908:
	ldr	r3, [fp, #-52]
	ldrb	r3, [r3, #665]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L965
	ldr	r3, [fp, #-52]
	add	r3, r3, #672
	str	r3, [fp, #-56]
.L911:
	ldr	r3, [fp, #-56]
	ldr	ip, [r7, #68]
	ldrd	r0, [r3, #40]
	ldrd	r8, [r3, #24]
	strd	r0, [fp, #-68]
	mov	r0, #29
	ldrd	r2, [fp, #-68]
	ldr	r1, .L983+16
	strd	r2, [sp]
	mov	r2, r8
	mov	r3, r9
	blx	ip
	ldr	ip, [r6, r4, asl #2]
	ldr	r1, [ip, #48]
	cmp	r1, #1
	beq	.L974
	sub	r3, r1, #2
	cmp	r1, #6
	cmpne	r3, #1
	bls	.L932
.L914:
	ldr	r3, [fp, #-56]
	mvn	r2, #0
	ldrd	r0, [r3, #24]
	mvn	r3, #0
	cmp	r1, r3
	add	r3, ip, #592
	cmpeq	r0, r2
	beq	.L975
	strd	r0, [r3, #-8]
.L925:
	ldr	r3, [fp, #-56]
	add	lr, ip, #608
	ldrd	r2, [r3, #40]
	mov	r8, r2
	mov	r9, r3
	add	r2, ip, #624
	mov	r3, r1
	str	r2, [fp, #-60]
	mov	r1, r9
	mov	r2, r0
	mov	r0, r8
	strd	r0, [lr, #-8]
	ldr	r1, [fp, #-56]
	strd	r8, [fp, #-68]
	ldrd	r0, [r1, #48]
	mov	r9, r1
	ldr	r1, [fp, #-60]
	mov	r8, r0
	mov	r0, #29
	strd	r8, [r1, #-8]
	ldr	r8, [fp, #-52]
	ldr	r1, .L983+20
	ldr	lr, [r8, #728]
	str	lr, [ip, #632]
	ldr	lr, [r8, #732]
	str	lr, [ip, #636]
	ldr	lr, [r8, #736]
	str	lr, [ip, #640]
	ldr	lr, [r8, #740]
	ldrd	r8, [fp, #-68]
	str	lr, [ip, #656]
	strd	r8, [sp]
	ldr	ip, [r7, #68]
	blx	ip
.L923:
	mov	r0, #3
	bl	CHECK_REC_POS_ENABLE
	adds	r3, r0, #0
	movne	r3, #1
	cmp	r10, #1
	movne	r3, #0
	cmp	r3, #0
	bne	.L976
.L926:
	ldr	r3, [r6, r4, asl #2]
	ldr	r2, [fp, #-52]
	ldr	r9, .L983
	add	r0, r2, #664
	add	r2, r3, #229376
	ldr	r1, [r3, #528]
	add	r2, r2, #800
	bl	DecodeStream
	ldr	r0, [r6, r4, asl #2]
	ldr	r3, [r0, #528]
	cmp	r3, #17
	beq	.L977
.L927:
	mov	r0, #4
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	beq	.L945
	ldr	r3, [r7]
	blx	r3
	ldr	r3, [fp, #-48]
	ldr	r1, .L983+24
	add	r6, r6, r3
	ldr	r3, [r6, #3860]
	ldr	r1, [r1]
	rsb	r3, r3, r0
	mov	r2, r0
	cmp	r3, r1
	bls	.L945
	mov	r0, r4
	str	r2, [r6, #3860]
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L945
	mov	r2, r4, asl #24
	movw	r1, #6941
	add	r2, r2, #262144
	ldr	r0, .L983+28
	bl	DBG_AddTrace
	b	.L945
.L973:
	cmp	r2, #1
	beq	.L978
	ldr	r3, [fp, #-52]
	add	r9, r3, #225280
	ldr	r3, [r9, #3272]
.L931:
	ldr	r4, [r7, #68]
	mov	r0, #31
	ldr	r1, .L983+32
	mvn	r5, #0
	blx	r4
	b	.L945
.L972:
	ldr	r3, [r7, #68]
	mov	r2, r4
	ldr	r1, .L983+36
	mov	r0, #23
	blx	r3
	mvn	r5, #2
	b	.L945
.L965:
	ldr	r2, [fp, #-52]
	ldr	r3, [r2, #1444]
	cmp	r3, #0
	beq	.L966
	add	r3, r2, #672
	str	r3, [fp, #-56]
	b	.L911
.L974:
	add	r3, ip, #229376
	ldr	r3, [r3, #800]
	ldr	r1, [r3, #548]
	sxtb	r1, r1
	cmp	r1, #1
	bne	.L914
.L932:
	add	r0, ip, #1072
	ldr	r2, [fp, #-56]
	add	r0, r0, #8
	bl	IsNewpicSeg
	cmp	r0, #0
	bne	.L915
	ldr	r1, [r6, r4, asl #2]
	add	r0, r1, #592
	ldr	r3, [r1, #48]
	cmp	r3, #3
	beq	.L979
	ldrd	r8, [r0]
	mvn	r3, #0
	mvn	r2, #0
	cmp	r9, r3
	cmpeq	r8, r2
	beq	.L980
	mov	r2, r8
	mov	r3, r9
	strd	r2, [r0, #-8]
.L917:
	add	ip, r1, #608
	mvn	r2, #0
	mvn	r3, #0
	strd	r2, [r0]
	ldrd	r2, [ip]
	add	r0, r1, #624
	strd	r2, [ip, #-8]
	ldrd	r2, [r0]
	orrs	ip, r2, r3
	strd	r2, [r0, #-8]
	ldreq	r3, [fp, #-56]
	ldreqd	r2, [r3, #48]
	streqd	r2, [r0, #-8]
.L919:
	ldr	ip, [r1, #644]
	mov	r3, r9
	ldr	lr, [r1, #648]
	mov	r2, r8
	mov	r0, #29
	str	ip, [r1, #632]
	str	lr, [r1, #636]
	ldr	ip, [r1, #660]
	ldr	lr, [r1, #652]
	str	ip, [r1, #656]
	str	lr, [r1, #640]
	ldr	ip, [r7, #68]
	ldr	r1, .L983+40
	blx	ip
	ldr	ip, [r6, r4, asl #2]
	ldr	r3, [ip, #48]
	cmp	r3, #3
	beq	.L981
.L920:
	ldr	r3, [fp, #-56]
	mvn	r1, #0
	mvn	r0, #0
	ldrd	r2, [r3, #24]
	cmp	r3, r1
	cmpeq	r2, r0
	addne	r1, ip, #592
	strned	r2, [r1]
.L922:
	ldr	lr, [fp, #-56]
	add	r1, ip, #608
	add	r0, ip, #624
	ldrd	r2, [lr, #40]
	strd	r2, [r1]
	ldrd	r2, [lr, #48]
	strd	r2, [r0]
	ldr	r2, [fp, #-52]
	ldr	r3, [r2, #728]
	str	r3, [ip, #644]
	ldr	r3, [r2, #732]
	str	r3, [ip, #648]
	ldr	r3, [r2, #736]
	str	r3, [ip, #652]
	ldr	r3, [r2, #740]
	str	r3, [ip, #660]
.L921:
	ldrd	r2, [r1, #-8]
	mov	r0, #29
	ldr	r1, .L983+44
	ldr	ip, [r7, #68]
	blx	ip
	b	.L923
.L966:
	ldr	r3, [fp, #-52]
	mov	r0, r4
	add	r3, r3, #672
	str	r3, [fp, #-56]
	mov	r1, r3
	bl	SM_ReadStreamSeg
	cmp	r0, #0
	beq	.L911
	cmp	r10, #1
	beq	.L982
.L912:
	ldr	r3, [r6, r4, asl #2]
	mov	r2, #1
	mvn	r5, #3
	str	r2, [r3, #316]
	b	.L945
.L970:
	ldr	ip, .L983+4
	movw	r2, #6693
	ldr	r3, .L983+48
.L967:
	ldr	r1, .L983+52
	mov	r0, #0
	ldr	r4, [ip, #68]
	mvn	r5, #0
	blx	r4
	b	.L945
.L971:
	ldr	ip, .L983+4
	movw	r2, #6694
	ldr	r3, .L983+56
	b	.L967
.L977:
	ldr	r3, [r0, #1460]
	cmp	r3, #1
	beq	.L927
	add	r0, r0, #229376
	add	r0, r0, #800
	bl	IsMain10Profile
	cmp	r0, #0
	ldreq	r3, [r9, r4, asl #2]
	streq	r0, [r3, #1460]
	beq	.L927
	mov	r3, r4
	ldr	r10, [r7, #68]
	ldr	r2, .L983+28
	mov	r0, #0
	ldr	r1, .L983+60
	blx	r10
	ldr	r3, [r9, r4, asl #2]
	mov	r2, #1
	str	r2, [r3, #1460]
	bl	VDMDRV_AddMatchMode
	b	.L927
.L978:
	add	r3, r3, #225280
	ldr	r3, [r3, #3272]
	bics	r1, r3, #2
	beq	.L908
	cmp	r3, #1
	bne	.L931
	ldr	r3, [r7, #68]
	mov	r0, #31
	ldr	r1, .L983+64
	mvn	r5, #2
	blx	r3
	b	.L945
.L981:
	ldr	r8, [fp, #-56]
	add	lr, ip, #592
	add	r0, ip, #608
	add	r1, ip, #624
	ldrd	r2, [r8, #24]
	strd	r2, [lr]
	ldrd	r2, [r8, #40]
	strd	r2, [r0]
	ldrd	r2, [r8, #48]
	strd	r2, [r1]
	ldr	r2, [fp, #-52]
	ldr	r3, [r2, #728]
	str	r3, [ip, #644]
	ldr	r3, [r2, #732]
	str	r3, [ip, #648]
	ldr	r3, [r2, #736]
	str	r3, [ip, #652]
	ldr	r3, [r2, #740]
	str	r3, [ip, #660]
.L915:
	ldr	ip, [r6, r4, asl #2]
	ldr	r3, [ip, #48]
	cmp	r3, #3
	addeq	r1, ip, #608
	bne	.L920
	b	.L921
.L975:
	ldrd	r0, [r3, #-8]
	b	.L925
.L968:
	ldr	ip, .L983+4
	movw	r2, #6691
	ldr	r3, .L983+68
	b	.L967
.L976:
	mov	r2, r4, asl #24
	movw	r1, #6903
	add	r2, r2, #196608
	ldr	r0, .L983+28
	bl	DBG_AddTrace
	b	.L926
.L979:
	ldrd	r2, [r0]
	mov	r8, r2
	mov	r9, r3
	strd	r2, [r0, #-8]
	b	.L917
.L980:
	ldrd	r2, [r0, #-8]
	mov	r8, r2
	mov	r9, r3
	b	.L917
.L969:
	ldr	ip, .L983+4
	movw	r2, #6692
	ldr	r3, .L983+72
	mvn	r5, #0
	ldr	r1, .L983+52
	ldr	r4, [ip, #68]
	blx	r4
	b	.L945
.L982:
	ldr	r3, [r7, #68]
	mov	r2, r4
	ldr	r1, .L983+76
	mov	r0, #23
	blx	r3
	b	.L912
.L984:
	.align	2
.L983:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_TraceBsPeriod
	.word	.LC90
	.word	.LC93
	.word	.LC96
	.word	g_TraceFramePeriod
	.word	.LANCHOR1+196
	.word	.LC99
	.word	.LC91
	.word	.LC94
	.word	.LC95
	.word	.LC51
	.word	.LC1
	.word	.LC89
	.word	.LC97
	.word	.LC98
	.word	.LC6
	.word	.LC37
	.word	.LC92
	UNWIND(.fnend)
	.size	DecChanSyntax, .-DecChanSyntax
	.align	2
	.global	DecSyntax
	.type	DecSyntax, %function
DecSyntax:
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
	ldr	r0, .L1014
	ldr	r1, .L1014+4
	sub	r3, r0, #64
.L988:
	ldr	r2, [r1, #4]!
	add	r3, r3, #4
	cmp	r2, #0
	ldrne	r2, [r2, #24]
	str	r2, [r3, #-4]
	cmp	r3, r0
	bne	.L988
	ldr	r6, .L1014+8
	mvn	r5, #0
	ldr	r9, .L1014+12
	mov	r7, #0
	mov	r8, r6
.L989:
	mov	r3, #0
	ldr	r0, [r6, #3924]
	mov	r4, r3
	ldr	r1, .L1014+16
	b	.L990
.L992:
	ldr	r2, [r1, #4]!
	cmp	r0, r2
	movlt	r0, r2
	movlt	r4, r3
.L990:
	add	r3, r3, #1
	cmp	r3, #16
	bne	.L992
	add	r3, r6, r4, lsl #2
	cmp	r0, #0
	add	r2, r4, #1
	ldr	r1, .L1014+8
	str	r7, [r3, #3924]
	mov	r3, #0
	str	r2, [r6, #84]
	ble	.L993
	ldr	r3, [r8, r4, asl #2]
	cmp	r3, #0
	beq	.L989
	ldr	r2, [r3, #16]
	cmp	r2, #1
	bne	.L989
	ldr	r2, [r3, #68]
	cmp	r2, #0
	ble	.L995
	ldr	r5, [r3, #72]
	cmp	r5, #0
	beq	.L1012
.L995:
	mov	r10, #200
	b	.L1000
.L998:
	cmp	r0, #0
	bne	.L989
	subs	r10, r10, #1
	beq	.L989
.L1000:
	mov	r0, r4
	bl	DecChanSyntax
	cmn	r0, #1
	mov	r5, r0
	bne	.L998
	ldr	r6, [r6, #2624]
	cmp	r6, #0
	beq	.L1006
	mov	r3, #0
	mov	r0, r4
	mov	r2, r3
	mov	r1, #102
	blx	r6
.L1006:
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1012:
	mov	r0, r4
	sub	r1, fp, #68
	bl	SM_GetInfo
	cmp	r0, #0
	bne	.L1013
.L996:
	ldr	r5, [r6, r4, asl #2]
	ldr	r1, [fp, #-56]
	ldr	r2, [r5, #68]
	ldr	r0, [r5, #544]
	bl	GetNextDecodeMode
	ldr	r3, [r6, r4, asl #2]
	str	r0, [r5, #544]
	ldr	r2, [r3, #544]
	cmp	r2, #0
	strne	r7, [r3, #540]
	strne	r7, [r3, #536]
	ldreq	r2, [r3, #64]
	streq	r2, [r3, #540]
	streq	r2, [r3, #536]
	b	.L995
.L993:
	mov	r0, r5
	str	r3, [r1, #84]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1013:
	mov	r1, r5
	sub	r0, fp, #68
	ldr	r3, [r9, #48]
	mov	r2, #24
	blx	r3
	b	.L996
.L1015:
	.align	2
.L1014:
	.word	.LANCHOR0+3988
	.word	.LANCHOR0-4
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+3924
	UNWIND(.fnend)
	.size	DecSyntax, .-DecSyntax
	.align	2
	.global	VCTRL_GetChanVoQue
	.type	VCTRL_GetChanVoQue, %function
VCTRL_GetChanVoQue:
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
	cmp	r0, #15
	bhi	.L1034
	ldr	r3, .L1035
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L1033
	ldr	r2, [r3, #528]
	cmp	r2, #19
	ldrls	pc, [pc, r2, asl #2]
	b	.L1034
.L1019:
	.word	.L1031
	.word	.L1020
	.word	.L1021
	.word	.L1022
	.word	.L1034
	.word	.L1023
	.word	.L1024
	.word	.L1034
	.word	.L1025
	.word	.L1026
	.word	.L1027
	.word	.L1027
	.word	.L1027
	.word	.L1028
	.word	.L1034
	.word	.L1034
	.word	.L1029
	.word	.L1030
	.word	.L1034
	.word	.L1031
.L1031:
	add	r0, r3, #229376
	add	r0, r0, #808
	ldmfd	sp, {fp, sp, pc}
.L1020:
	add	r0, r3, #278528
	add	r0, r0, #128
	ldmfd	sp, {fp, sp, pc}
.L1021:
	add	r0, r3, #251904
	add	r0, r0, #880
	ldmfd	sp, {fp, sp, pc}
.L1022:
	add	r0, r3, #307200
	add	r0, r0, #3488
	ldmfd	sp, {fp, sp, pc}
.L1023:
	add	r0, r3, #262144
	add	r0, r0, #1840
	ldmfd	sp, {fp, sp, pc}
.L1024:
	add	r0, r3, #245760
	add	r0, r0, #624
	ldmfd	sp, {fp, sp, pc}
.L1025:
	movw	r0, #14168
	movt	r0, 4
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1026:
	movw	r0, #14152
	movt	r0, 4
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1027:
	add	r0, r3, #242688
	add	r0, r0, #136
	ldmfd	sp, {fp, sp, pc}
.L1028:
	add	r0, r3, #237568
	add	r0, r0, #776
	ldmfd	sp, {fp, sp, pc}
.L1029:
	add	r0, r3, #230400
	add	r0, r0, #360
	ldmfd	sp, {fp, sp, pc}
.L1030:
	movw	r0, #19032
	movt	r0, 4
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1034:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1033:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1036:
	.align	2
.L1035:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetChanVoQue, .-VCTRL_GetChanVoQue
	.align	2
	.global	VCTRL_FindOccupiedFrame
	.type	VCTRL_FindOccupiedFrame, %function
VCTRL_FindOccupiedFrame:
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
	cmp	r0, #15
	bhi	.L1056
	ldr	r2, .L1059
	ldr	r4, [r2, r0, asl #2]
	cmp	r4, #0
	beq	.L1057
	bl	VCTRL_GetChanVoQue
	cmp	r0, #0
	beq	.L1049
	ldrh	r3, [r0, #4]
	ldrh	r1, [r0, #6]
	and	r3, r3, #63
	cmp	r1, r3
	beq	.L1049
	add	r2, r0, r3, lsl #2
	ldr	ip, [r2, #12]
	cmp	ip, #0
	beq	.L1043
	b	.L1041
.L1055:
	ldr	ip, [r2, #12]
	cmp	ip, #0
	bne	.L1041
.L1043:
	add	r3, r3, #1
	and	r3, r3, #63
	cmp	r3, r1
	add	r2, r0, r3, lsl #2
	bne	.L1055
.L1049:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1041:
	add	lr, r4, #228352
	add	r3, lr, #248
	add	lr, lr, #888
.L1046:
	ldrb	r2, [r3, #16]	@ zero_extendqisi2
	cmp	r2, #255
	beq	.L1045
	ldr	r1, [ip, #104]
	ldr	r2, [r3, #8]
	cmp	r1, r2
	bcc	.L1045
	ldr	r0, [r3, #12]
	add	r0, r2, r0
	cmp	r1, r0
	bcc	.L1058
.L1045:
	add	r3, r3, #20
	cmp	r3, lr
	bne	.L1046
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1058:
	add	r4, r4, #229376
	mov	r1, #1
	mov	r0, #0
	str	r2, [r4, #716]
	ldr	r2, [r3, #4]
	str	r2, [r4, #720]
	ldr	r3, [r3, #12]
	str	r1, [r4, #728]
	str	r3, [r4, #724]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1056:
	ldr	ip, .L1059+4
	movw	r2, #3639
	ldr	r3, .L1059+8
	mov	r0, #0
	ldr	r1, .L1059+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1057:
	ldr	ip, .L1059+4
	mov	r0, r4
	ldr	r3, .L1059+16
	movw	r2, #3640
	ldr	r1, .L1059+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1060:
	.align	2
.L1059:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_FindOccupiedFrame, .-VCTRL_FindOccupiedFrame
	.align	2
	.global	VCTRL_GetChanImgNum
	.type	VCTRL_GetChanImgNum, %function
VCTRL_GetChanImgNum:
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
	cmp	r0, #15
	mov	r4, r0
	mov	r6, r1
	mov	r7, r2
	mov	r8, r3
	bhi	.L1070
	ldr	r5, .L1074
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	beq	.L1071
	bl	VCTRL_GetChanVoQue
	subs	r3, r0, #0
	beq	.L1064
	mov	r2, r8
	mov	r1, r7
	bl	GetQueueImgNum
	ldr	r3, [r5, r4, asl #2]
	ldr	r2, [r3, #528]
	cmp	r2, #0
	beq	.L1072
	cmp	r2, #17
	beq	.L1073
	cmp	r2, #16
	addeq	r3, r3, #11337728
	addeq	r3, r3, #12288
	movne	r3, #2
	ldreq	r3, [r3, #3176]
	str	r3, [r6]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1072:
	add	r3, r3, #253952
	ldr	r3, [r3, #2856]
	str	r3, [r6]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1064:
	str	r3, [r8]
	str	r3, [r7]
	str	r3, [r6]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1070:
	ldr	ip, .L1074+4
	movw	r2, #7076
	ldr	r3, .L1074+8
	mov	r0, #0
.L1069:
	ldr	r1, .L1074+12
	ldr	ip, [ip, #68]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L1073:
	add	r3, r3, #229376
	ldr	r3, [r3, #3288]
	str	r3, [r6]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1071:
	mov	r0, r3
	ldr	ip, .L1074+4
	ldr	r3, .L1074+16
	movw	r2, #7077
	b	.L1069
.L1075:
	.align	2
.L1074:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_GetChanImgNum, .-VCTRL_GetChanImgNum
	.align	2
	.global	VCTRL_GetChanState
	.type	VCTRL_GetChanState, %function
VCTRL_GetChanState:
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
	cmp	r0, #15
	mov	r6, r0
	mov	r5, r1
	bhi	.L1089
	cmp	r1, #0
	mov	r4, #0
	str	r4, [fp, #-64]
	str	r4, [fp, #-68]
	str	r4, [fp, #-72]
	beq	.L1076
	ldr	r8, .L1090
	mov	r1, r4
	ldr	r7, .L1090+4
	mov	r2, #108
	mov	r0, r5
	ldr	r3, [r8, #48]
	blx	r3
	ldr	r1, [r7, r6, asl #2]
	cmp	r1, r4
	beq	.L1076
	add	r1, r1, #1088
	ldr	r3, [r8, #52]
	mov	r2, #108
	add	r1, r1, #4
	mov	r0, r5
	blx	r3
	ldr	r2, [r7, r6, asl #2]
	movw	r3, #1482
	add	ip, r2, #204800
	ldrsb	r0, [ip, r3]
	cmp	r0, r4
	ble	.L1081
	movw	r3, #27214
	mov	r1, r4
	movt	r3, 3
	add	r3, r2, r3
.L1083:
	ldrsb	r2, [r3]
	add	r1, r1, #1
	add	r3, r3, #68
	cmp	r2, #3
	addeq	r4, r4, #1
	cmp	r1, r0
	bne	.L1083
.L1081:
	movw	r3, #1482
	str	r4, [r5, #92]
	ldrsb	ip, [ip, r3]
	sub	r2, fp, #68
	sub	r3, fp, #64
	sub	r1, fp, #72
	mov	r0, r6
	str	ip, [r5, #100]
	bl	VCTRL_GetChanImgNum
	mov	r3, #300
	mla	r3, r3, r6, r7
	ldr	r0, [fp, #-64]
	ldr	r2, [fp, #-68]
	sub	r1, fp, #60
	add	r2, r2, r0
	str	r2, [r5, #56]
	mov	r0, r6
	ldr	r2, [r3, #4008]
	str	r2, [r5, #104]
	ldr	r3, [r3, #3996]
	str	r3, [r5, #24]
	bl	SM_GetInfo
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-52]
	sub	r1, fp, #60
	mov	r0, r6
	str	r2, [r5, #60]
	str	r3, [r5, #64]
	bl	SM_GetInfo
	ldr	r2, [fp, #-40]
	ldr	r3, [r7, r6, asl #2]
	cmp	r2, #10
	add	r3, r3, #245760
	movle	r2, #0
	movgt	r2, #1
	str	r2, [r5, #88]
	ldrb	r3, [r3, #280]	@ zero_extendqisi2
	and	r3, r3, #1
	str	r3, [r5, #96]
.L1076:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1089:
	ldr	ip, .L1090
	movw	r2, #1226
	ldr	r3, .L1090+8
	mov	r0, #0
	ldr	r1, .L1090+12
	ldr	r4, [ip, #68]
	blx	r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1091:
	.align	2
.L1090:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC100
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_GetChanState, .-VCTRL_GetChanState
	.align	2
	.global	VCTRL_GetChanWidth
	.type	VCTRL_GetChanWidth, %function
VCTRL_GetChanWidth:
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
	cmp	r0, #15
	bhi	.L1096
	ldr	r3, .L1098
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L1097
	ldr	r0, [r0, #1272]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1096:
	ldr	ip, .L1098+4
	movw	r2, #7125
	ldr	r3, .L1098+8
	mov	r0, #0
	ldr	r1, .L1098+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1097:
	ldr	ip, .L1098+4
	movw	r2, #7126
	ldr	r3, .L1098+16
	ldr	r1, .L1098+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1099:
	.align	2
.L1098:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_GetChanWidth, .-VCTRL_GetChanWidth
	.align	2
	.global	VCTRL_GetChanHeight
	.type	VCTRL_GetChanHeight, %function
VCTRL_GetChanHeight:
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
	cmp	r0, #15
	bhi	.L1104
	ldr	r3, .L1106
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L1105
	ldr	r0, [r0, #1276]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1104:
	ldr	ip, .L1106+4
	movw	r2, #7133
	ldr	r3, .L1106+8
	mov	r0, #0
	ldr	r1, .L1106+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1105:
	ldr	ip, .L1106+4
	movw	r2, #7134
	ldr	r3, .L1106+16
	ldr	r1, .L1106+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1107:
	.align	2
.L1106:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_GetChanHeight, .-VCTRL_GetChanHeight
	.align	2
	.global	VCTRL_GetChanCapLevel
	.type	VCTRL_GetChanCapLevel, %function
VCTRL_GetChanCapLevel:
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
	cmp	r0, #15
	bhi	.L1112
	ldr	r3, .L1113
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	ldrne	r0, [r3, #40]
	moveq	r0, #33
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1112:
	ldr	ip, .L1113+4
	movw	r2, #7141
	ldr	r3, .L1113+8
	mov	r0, #0
	ldr	r1, .L1113+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1114:
	.align	2
.L1113:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_GetChanCapLevel, .-VCTRL_GetChanCapLevel
	.align	2
	.global	VCTRL_SetVdecExtra
	.type	VCTRL_SetVdecExtra, %function
VCTRL_SetVdecExtra:
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
	add	r3, r0, #4992
	ldr	r5, .L1122
	add	r3, r3, #8
	movw	r2, #10000
	cmp	r3, r2
	mov	r4, r1
	str	r0, [r5, #2692]
	bhi	.L1120
.L1116:
	movw	r1, #5000
	cmp	r0, r1
	movw	r2, #60536
	add	r3, r4, #4992
	movge	r0, r1
	movt	r2, 65535
	cmp	r0, r2
	add	r3, r3, #8
	movw	r1, #10000
	str	r4, [r5, #2696]
	movlt	r0, r2
	cmp	r3, r1
	str	r0, [r5, #2692]
	ldr	r6, .L1122
	bhi	.L1121
.L1117:
	movw	r2, #5000
	cmp	r4, r2
	movw	r3, #60536
	movge	r4, r2
	movt	r3, 65535
	cmp	r4, r3
	movlt	r4, r3
	str	r4, [r5, #2696]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1120:
	ldr	r3, .L1122+4
	mov	r2, r0
	ldr	r1, .L1122+8
	mov	r0, #32
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r0, [r5, #2692]
	b	.L1116
.L1121:
	ldr	r3, .L1122+4
	mov	r2, r4
	ldr	r1, .L1122+12
	mov	r0, #32
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r4, [r6, #2696]
	b	.L1117
.L1123:
	.align	2
.L1122:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC101
	.word	.LC102
	UNWIND(.fnend)
	.size	VCTRL_SetVdecExtra, .-VCTRL_SetVdecExtra
	.align	2
	.global	VCTRL_MaskAllInt
	.type	VCTRL_MaskAllInt, %function
VCTRL_MaskAllInt:
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
	ldr	r3, .L1128
	ldr	r3, [r3, #72]
	cmp	r3, #0
	beq	.L1127
	mov	r0, #0
	blx	r3
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SCDDRV_MaskInt
.L1127:
	ldr	ip, .L1128+4
	mov	r0, r3
	movw	r2, #7186
	ldr	r1, .L1128+8
	ldr	r3, [ip, #68]
	blx	r3
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SCDDRV_MaskInt
.L1129:
	.align	2
.L1128:
	.word	g_vdm_hal_fun_ptr
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC8
	UNWIND(.fnend)
	.size	VCTRL_MaskAllInt, .-VCTRL_MaskAllInt
	.align	2
	.global	VCTRL_RunProcess
	.type	VCTRL_RunProcess, %function
VCTRL_RunProcess:
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
	ldr	r4, .L1145
	mov	r3, #100
	ldr	r5, .L1145+4
	ldr	r6, .L1145+8
	ldr	r0, [r4, #604]
	str	r3, [r5, #80]
	cmp	r0, #0
	ble	.L1131
	ldr	r3, [r6, #124]
	blx	r3
.L1131:
	ldr	r3, [r6, #12]
	mov	r0, #0
	blx	r3
	bl	VCTRL_MaskAllInt
	bl	SM_Wakeup
	ldr	r3, [r4, #608]
	mov	r2, #101
	str	r2, [r5, #80]
	cmp	r3, #0
	movne	r7, #0
	beq	.L1143
.L1132:
	mov	r3, #102
	str	r3, [r5, #80]
	bl	VDMDRV_WakeUpVdm
	mov	r0, #0
	bl	SCDDRV_EnableInt
	ldr	r3, .L1145+12
	ldr	r3, [r3, #76]
	cmp	r3, #0
	beq	.L1144
	mov	r0, #0
	blx	r3
.L1134:
	mov	r4, #0
.L1135:
	mov	r0, r4
	mov	r1, #0
	add	r4, r4, #1
	bl	DeleteRawPacketInBuffer
	cmp	r4, #16
	bne	.L1135
	ldr	r3, [r6, #16]
	mov	r0, #0
	blx	r3
	mov	r2, #105
	ldr	r3, [r6, #136]
	mov	r1, #10
	str	r2, [r5, #80]
	mov	r0, #0
	blx	r3
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1143:
	bl	DecSyntax
	mov	r7, r0
	b	.L1132
.L1144:
	mov	r0, r3
	mov	r2, #580
	ldr	r3, [r6, #68]
	ldr	r1, .L1145+16
	blx	r3
	b	.L1134
.L1146:
	.align	2
.L1145:
	.word	.LANCHOR3
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LC8
	UNWIND(.fnend)
	.size	VCTRL_RunProcess, .-VCTRL_RunProcess
	.align	2
	.global	VFMW_CTRL_thread_proc
	.type	VFMW_CTRL_thread_proc, %function
VFMW_CTRL_thread_proc:
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
	ldr	r4, .L1177
	ldr	r5, .L1177+4
	mov	r6, r4
	mov	r7, r5
.L1148:
.L1155:
	mov	r2, #0
	ldr	r3, [r5, #68]
	str	r2, [r4, #80]
	mov	r0, #2
	ldr	r1, .L1177+8
	blx	r3
	ldr	r3, [r4, #72]
	mov	r2, #2
	str	r2, [r4, #68]
	cmp	r3, r2
	beq	.L1153
	cmp	r3, #3
	bne	.L1173
	b	.L1152
.L1175:
	cmp	r3, #3
	beq	.L1152
	ldr	r3, [r6, #68]
	cmp	r3, #0
	beq	.L1152
.L1173:
	mov	r3, #2
	str	r3, [r4, #80]
	bl	VCTRL_RunProcess
	ldr	r3, [r5, #68]
	ldr	r1, .L1177+12
	mov	r0, #22
	blx	r3
	ldr	r3, [r4, #72]
	cmp	r3, #2
	bne	.L1175
.L1153:
	mov	r2, #4
	ldr	r3, [r5, #68]
	str	r2, [r4, #80]
	mov	r0, #2
	ldr	r1, .L1177+16
	mov	r8, #5
	blx	r3
	mov	r3, #1
	str	r3, [r4, #68]
	b	.L1150
.L1176:
	ldr	r3, [r7, #124]
	blx	r3
	ldr	r3, [r6, #68]
	cmp	r3, #0
	beq	.L1152
.L1150:
	ldr	r3, [r5, #68]
	mov	r0, #22
	str	r8, [r4, #80]
	ldr	r1, .L1177+20
	blx	r3
	ldr	r3, [r4, #72]
	mov	r0, #10
	cmp	r3, #1
	beq	.L1155
	cmp	r3, #3
	bne	.L1176
.L1152:
	mov	r2, #6
	ldr	r3, [r5, #68]
	ldr	r1, .L1177+24
	mov	r0, #2
	str	r2, [r4, #80]
	blx	r3
	mov	r0, #0
	str	r0, [r4, #68]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1178:
	.align	2
.L1177:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC103
	.word	.LC106
	.word	.LC104
	.word	.LC107
	.word	.LC105
	UNWIND(.fnend)
	.size	VFMW_CTRL_thread_proc, .-VFMW_CTRL_thread_proc
	.align	2
	.global	VCTRL_EnableAllInt
	.type	VCTRL_EnableAllInt, %function
VCTRL_EnableAllInt:
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
	ldr	r3, .L1183
	ldr	r3, [r3, #76]
	cmp	r3, #0
	beq	.L1182
	mov	r0, #0
	blx	r3
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SCDDRV_EnableInt
.L1182:
	ldr	ip, .L1183+4
	mov	r0, r3
	movw	r2, #7225
	ldr	r1, .L1183+8
	ldr	r3, [ip, #68]
	blx	r3
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SCDDRV_EnableInt
.L1184:
	.align	2
.L1183:
	.word	g_vdm_hal_fun_ptr
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC8
	UNWIND(.fnend)
	.size	VCTRL_EnableAllInt, .-VCTRL_EnableAllInt
	.align	2
	.global	VCTRL_SetLastFrameIdPlus2
	.type	VCTRL_SetLastFrameIdPlus2, %function
VCTRL_SetLastFrameIdPlus2:
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
	cmp	r0, #15
	bhi	.L1191
	ldr	r3, .L1192
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	strne	r1, [r3, #320]
	ldmfd	sp, {fp, sp, pc}
.L1191:
	ldr	ip, .L1192+4
	movw	r2, #8022
	ldr	r3, .L1192+8
	mov	r0, #0
	ldr	r1, .L1192+12
	ldr	ip, [ip, #68]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	ip
.L1193:
	.align	2
.L1192:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_SetLastFrameIdPlus2, .-VCTRL_SetLastFrameIdPlus2
	.align	2
	.global	VCTRL_SetLastFrameState
	.type	VCTRL_SetLastFrameState, %function
VCTRL_SetLastFrameState:
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
	cmp	r0, #15
	bhi	.L1200
	ldr	r3, .L1201
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	strne	r1, [r3, #324]
	ldmfd	sp, {fp, sp, pc}
.L1200:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_SetLastFrameState.part.6
.L1202:
	.align	2
.L1201:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_SetLastFrameState, .-VCTRL_SetLastFrameState
	.align	2
	.global	VCTRL_ReportLastFrame
	.type	VCTRL_ReportLastFrame, %function
VCTRL_ReportLastFrame:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #15
	mov	r4, r0
	mov	r5, r1
	bhi	.L1216
	ldr	r6, .L1218
	ldr	r0, [r6, r0, asl #2]
	cmp	r0, #0
	beq	.L1217
	cmp	r1, #0
	moveq	r3, #2
	beq	.L1208
	cmp	r1, #1
	moveq	r3, #3
	movne	r3, #4
.L1208:
	ldr	r7, [r6, #2624]
	str	r3, [r0, #324]
	cmp	r7, #0
	beq	.L1210
	sub	r2, fp, #28
	mov	r3, #4
	mov	r1, #115
	mov	r0, r4
	str	r5, [r2, #-4]!
	blx	r7
.L1210:
	ldr	r3, [r6, r4, asl #2]
	mov	r2, r5
	ldr	ip, .L1218+4
	mov	r0, #1
	ldr	r1, .L1218+8
	ldr	r3, [r3, #324]
	ldr	r4, [ip, #68]
	blx	r4
.L1203:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1216:
	ldr	ip, .L1218+4
	movw	r2, #8048
	ldr	r3, .L1218+12
	mov	r0, #0
	ldr	r1, .L1218+16
	ldr	r4, [ip, #68]
	blx	r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1217:
	ldr	ip, .L1218+4
	movw	r2, #8049
	ldr	r3, .L1218+20
	ldr	r1, .L1218+16
	ldr	r4, [ip, #68]
	blx	r4
	b	.L1203
.L1219:
	.align	2
.L1218:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC108
	.word	.LC6
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_ReportLastFrame, .-VCTRL_ReportLastFrame
	.align	2
	.global	VCTRL_OutputLastFrame
	.type	VCTRL_OutputLastFrame, %function
VCTRL_OutputLastFrame:
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
	cmp	r0, #15
	mov	r5, r0
	bhi	.L1246
	ldr	r3, .L1249
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L1247
	add	r0, r0, #229376
	ldr	r3, [r0, #792]
	cmp	r3, #17
	ldrls	pc, [pc, r3, asl #2]
	b	.L1239
.L1226:
	.word	.L1225
	.word	.L1227
	.word	.L1228
	.word	.L1229
	.word	.L1239
	.word	.L1230
	.word	.L1231
	.word	.L1239
	.word	.L1232
	.word	.L1233
	.word	.L1234
	.word	.L1234
	.word	.L1234
	.word	.L1235
	.word	.L1239
	.word	.L1239
	.word	.L1236
	.word	.L1237
.L1239:
	mov	r0, r5
	mov	r1, #1
	bl	VCTRL_ReportLastFrame
	ldr	r3, .L1249+4
	ldr	r1, .L1249+8
	mov	r0, #2
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1237:
	add	r0, r0, #800
	bl	HEVCDEC_GetRemainImg
	mov	r4, r0
.L1224:
	cmn	r4, #1
	beq	.L1239
	cmp	r4, #0
	bne	.L1248
	mov	r0, r5
	mov	r1, r4
	bl	VCTRL_ReportLastFrame
	ldr	r3, .L1249+4
	ldr	r1, .L1249+12
	mov	r0, #2
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1225:
	add	r0, r0, #800
	bl	H264DEC_GetRemainImg
	mov	r4, r0
	b	.L1224
.L1227:
	add	r0, r0, #800
	bl	VC1DEC_GetRemainImg
	mov	r4, r0
	b	.L1224
.L1228:
	add	r0, r0, #800
	bl	MPEG4DEC_GetRemainImg
	mov	r4, r0
	b	.L1224
.L1229:
	add	r0, r0, #800
	bl	MPEG2DEC_GetRemainImg
	mov	r4, r0
	b	.L1224
.L1230:
	add	r0, r0, #800
	bl	DIVX3DEC_GetRemainImg
	mov	r4, r0
	b	.L1224
.L1231:
	add	r0, r0, #800
	bl	AVSDEC_GetRemainImg
	mov	r4, r0
	b	.L1224
.L1232:
	add	r0, r0, #800
	bl	REAL8DEC_GetRemainImg
	mov	r4, r0
	b	.L1224
.L1233:
	add	r0, r0, #800
	bl	REAL9DEC_GetRemainImg
	mov	r4, r0
	b	.L1224
.L1234:
	add	r0, r0, #800
	bl	VP6DEC_GetRemainImg
	mov	r4, r0
	b	.L1224
.L1235:
	add	r0, r0, #800
	bl	VP8DEC_GetRemainImg
	mov	r4, r0
	b	.L1224
.L1236:
	add	r0, r0, #800
	bl	MVC_DEC_GetRemainImg
	mov	r4, r0
	b	.L1224
.L1248:
	mov	r0, r5
	mov	r1, r4
	bl	VCTRL_ReportLastFrame
	ldr	r3, .L1249+4
	sub	r2, r4, #2
	ldr	r1, .L1249+16
	mov	r0, #2
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1246:
	ldr	ip, .L1249+4
	movw	r2, #8077
	ldr	r3, .L1249+20
	mov	r0, #0
	ldr	r1, .L1249+24
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1247:
	ldr	ip, .L1249+4
	movw	r2, #8078
	ldr	r3, .L1249+28
	ldr	r1, .L1249+24
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1250:
	.align	2
.L1249:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC6
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_OutputLastFrame, .-VCTRL_OutputLastFrame
	.align	2
	.global	VCTRL_PostProc
	.type	VCTRL_PostProc, %function
VCTRL_PostProc:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
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
	ldr	r5, .L1285
	mov	r4, r0
	ldr	lr, [fp, #4]
	ldr	r0, [r5, r0, asl #2]
	cmp	r0, #0
	beq	.L1279
	ldr	ip, [r0, #528]
	ldr	r6, [r0, #1232]
	cmp	ip, #17
	ldrls	pc, [pc, ip, asl #2]
	b	.L1251
.L1255:
	.word	.L1254
	.word	.L1256
	.word	.L1257
	.word	.L1258
	.word	.L1251
	.word	.L1259
	.word	.L1260
	.word	.L1251
	.word	.L1261
	.word	.L1262
	.word	.L1263
	.word	.L1263
	.word	.L1263
	.word	.L1264
	.word	.L1251
	.word	.L1251
	.word	.L1265
	.word	.L1266
.L1254:
	add	r0, r0, #229376
	str	lr, [sp, #4]
	add	r0, r0, #800
	str	r6, [sp]
	mov	r2, #1
	ldr	r7, .L1285
	bl	H264DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r3, r3, #241664
	ldrb	r3, [r3, #2072]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1280
.L1267:
	cmp	r6, #1
	ldrne	r3, [r5, r4, asl #2]
	movne	r2, #0
	addne	r3, r3, #229376
	strne	r2, [r3, #1160]
.L1251:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1266:
	add	r0, r0, #229376
	str	lr, [sp, #4]
	add	r0, r0, #800
	str	r6, [sp]
	mov	r2, #1
	ldr	r7, .L1285
	bl	HEVCDEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r3, r3, #229376
	ldrb	r3, [r3, #806]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1281
.L1269:
	cmp	r6, #1
	ldrne	r3, [r5, r4, asl #2]
	movne	r2, #0
	addne	r3, r3, #229376
	strne	r2, [r3, #3112]
	b	.L1251
.L1256:
	add	r0, r0, #229376
	ldr	r6, .L1285
	add	r0, r0, #800
	bl	VC1DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r2, r3, #241664
	ldrb	r2, [r2, #1231]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1282
.L1274:
	add	r3, r3, #229376
	mov	r2, #0
	str	r2, [r3, #804]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1257:
	add	r0, r0, #229376
	mov	r2, r3
	add	r0, r0, #800
	bl	MPEG4DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	ldr	r5, .L1285
	add	r2, r3, #286720
	ldrb	r2, [r2, #264]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1283
.L1272:
	add	r3, r3, #229376
	mov	r2, #0
	str	r2, [r3, #1836]
	b	.L1251
.L1258:
	add	r0, r0, #229376
	ldr	r6, .L1285
	add	r0, r0, #800
	bl	MPEG2DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r2, r3, #344064
	ldrb	r2, [r2, #802]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1274
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r6, r4, asl #2]
	mov	r1, #0
	add	r2, r3, #344064
	strb	r1, [r2, #802]
	b	.L1274
.L1259:
	add	r0, r0, #229376
	add	r0, r0, #800
	bl	DIVX3DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #229376
	str	r2, [r3, #804]
	b	.L1251
.L1260:
	add	r0, r0, #229376
	ldr	r6, .L1285
	add	r0, r0, #800
	bl	AVSDEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r2, r3, #245760
	ldrb	r2, [r2, #1660]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1274
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r6, r4, asl #2]
	mov	r1, #0
	add	r2, r3, #245760
	strb	r1, [r2, #1660]
	b	.L1274
.L1261:
	add	r0, r0, #229376
	add	r0, r0, #800
	bl	REAL8DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #229376
	str	r2, [r3, #804]
	b	.L1251
.L1262:
	add	r0, r0, #229376
	add	r0, r0, #800
	bl	REAL9DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #229376
	str	r2, [r3, #804]
	b	.L1251
.L1263:
	add	r0, r0, #229376
	add	r0, r0, #800
	bl	VP6DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #229376
	str	r2, [r3, #804]
	b	.L1251
.L1264:
	add	r0, r0, #229376
	add	r0, r0, #800
	bl	VP8DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #229376
	str	r2, [r3, #804]
	b	.L1251
.L1265:
	add	r0, r0, #229376
	mov	r2, #1
	add	r0, r0, #800
	bl	MVC_DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	ldr	r5, .L1285
	add	r3, r3, #229376
	ldrb	r2, [r3, #801]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1284
.L1275:
	mov	r2, #0
	str	r2, [r3, #1028]
	b	.L1251
.L1279:
	ldr	ip, .L1285+4
	movw	r2, #4472
	ldr	r3, .L1285+8
	ldr	r1, .L1285+12
	ldr	ip, [ip, #68]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	ip
.L1283:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r5, r4, asl #2]
	mov	r1, #0
	add	r2, r3, #286720
	strb	r1, [r2, #264]
	b	.L1272
.L1282:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r6, r4, asl #2]
	mov	r1, #0
	add	r2, r3, #241664
	strb	r1, [r2, #1231]
	b	.L1274
.L1284:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r2, [r5, r4, asl #2]
	mov	r1, #0
	add	r2, r2, #229376
	mov	r3, r2
	strb	r1, [r2, #801]
	b	.L1275
.L1280:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r7, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #241664
	strb	r2, [r3, #2072]
	b	.L1267
.L1281:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r7, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #229376
	strb	r2, [r3, #806]
	b	.L1269
.L1286:
	.align	2
.L1285:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC2
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_PostProc, .-VCTRL_PostProc
	.align	2
	.global	VCTRL_VdmPostProc
	.type	VCTRL_VdmPostProc, %function
VCTRL_VdmPostProc:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #15
	mov	r4, r0
	mov	r5, r1
	mov	r6, r2
	mov	r7, r3
	ldr	r8, [fp, #4]
	bhi	.L1293
	ldr	ip, .L1295
	ldr	ip, [ip, r0, asl #2]
	cmp	ip, #0
	beq	.L1294
	ldr	ip, [ip, #16]
	cmp	ip, #1
	beq	.L1290
	ldr	ip, .L1295+4
	movw	r2, #4652
	ldr	r3, .L1295+8
.L1292:
	mov	r0, #0
	ldr	r1, .L1295+12
	ldr	ip, [ip, #68]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L1290:
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	str	r8, [fp, #4]
	mov	r3, r7
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	VCTRL_PostProc
.L1293:
	ldr	ip, .L1295+4
	movw	r2, #4650
	ldr	r3, .L1295+16
	b	.L1292
.L1294:
	ldr	lr, .L1295+4
	mov	r0, ip
	ldr	r3, .L1295+20
	movw	r2, #4651
	ldr	r1, .L1295+12
	ldr	ip, [lr, #68]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L1296:
	.align	2
.L1295:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC51
	.word	.LC1
	.word	.LC50
	.word	.LC37
	UNWIND(.fnend)
	.size	VCTRL_VdmPostProc, .-VCTRL_VdmPostProc
	.align	2
	.global	VCTRL_SvdecLastFrame
	.type	VCTRL_SvdecLastFrame, %function
VCTRL_SvdecLastFrame:
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
	add	r1, r1, #2
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_ReportLastFrame
	UNWIND(.fnend)
	.size	VCTRL_SvdecLastFrame, .-VCTRL_SvdecLastFrame
	.align	2
	.global	Get_YuvFormat
	.type	Get_YuvFormat, %function
Get_YuvFormat:
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
	cmp	r1, #6
	ldrls	pc, [pc, r1, asl #2]
	b	.L1299
.L1301:
	.word	.L1300
	.word	.L1302
	.word	.L1303
	.word	.L1304
	.word	.L1305
	.word	.L1306
	.word	.L1307
.L1307:
	cmp	r0, #1
	moveq	r0, #1
	movne	r0, #7
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1300:
	cmp	r0, #1
	moveq	r0, #0
	movne	r0, #6
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1302:
	cmp	r0, #1
	moveq	r0, #2
	movne	r0, #8
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1303:
	cmp	r0, #1
	moveq	r0, #4
	movne	r0, #10
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1304:
	cmp	r0, #1
	moveq	r0, #3
	movne	r0, #9
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1305:
	cmp	r0, #1
	moveq	r0, #5
	movne	r0, #11
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1306:
	cmp	r0, #1
	moveq	r0, #13
	movne	r0, #12
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1299:
	ldr	ip, .L1316
	mov	r3, r1
	movw	r2, #8246
	ldr	r1, .L1316+4
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mov	r0, #13
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1317:
	.align	2
.L1316:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC112
	UNWIND(.fnend)
	.size	Get_YuvFormat, .-Get_YuvFormat
	.align	2
	.global	VDH_PutUsrdecFrame
	.type	VDH_PutUsrdecFrame, %function
VDH_PutUsrdecFrame:
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
	mov	r5, r1
	ldr	r1, [r1, #28]
	mov	r8, r0
	bl	FSP_GetLogicIdByPhyAddr
	cmn	r0, #1
	mov	r7, r0
	beq	.L1326
	ldr	r3, [r5, #4]
	cmp	r3, #1
	beq	.L1321
	mov	r1, r0
	mov	r2, #0
	mov	r0, r8
	bl	FSP_ClearLogicFs
	mov	r0, #0
.L1320:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1321:
	ldr	r0, [r5, #36]
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L1327
.L1322:
	mov	r1, r7
	mov	r0, r8
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	beq	.L1328
	str	r7, [r4, #196]
	mov	r6, #0
	ldrd	r2, [r5, #8]
	mov	r9, #1
	strd	r2, [r4]
	ldrd	r2, [r5, #8]
	strd	r2, [r4, #8]
	ldrd	r2, [r5, #8]
	strd	r2, [r4, #16]
	ldrd	r2, [r5, #8]
	str	r9, [r4, #68]
	str	r6, [r4, #72]
	strd	r2, [r4, #24]
	str	r6, [r4, #76]
	str	r6, [r4, #80]
	ldr	r3, [r5, #28]
	str	r3, [r4, #88]
	mov	r0, r3
	str	r3, [r4, #120]
	str	r3, [r4, #104]
	ldr	r3, [r5, #36]
	str	r3, [r4, #92]
	str	r3, [r4, #124]
	str	r3, [r4, #108]
	bl	MEM_Phy2Vir
	mov	r3, r0
	ldr	r0, [r4, #92]
	str	r3, [r4, #48]
	str	r3, [r4, #32]
	bl	MEM_Phy2Vir
	ldr	r2, [r4, #88]
	movw	r1, #11296
	str	r0, [r4, #52]
	str	r0, [r4, #36]
	ldr	r3, [r5, #32]
	ldr	r0, [r4, #92]
	add	r2, r3, r2
	str	r2, [r4, #96]
	ldr	r3, [r5, #32]
	str	r6, [r4, #148]
	add	r3, r3, r0
	str	r3, [r4, #100]
	ldr	r3, [r5, #20]
	str	r3, [r4, #164]
	ldr	r3, [r5, #24]
	str	r3, [r4, #168]
	ldr	r3, [r5, #20]
	str	r3, [r4, #172]
	mov	r2, r3, lsr r9
	ldr	r3, [r5, #24]
	str	r2, [r4, #180]
	str	r3, [r4, #176]
	mov	r3, r3, lsr r9
	str	r3, [r4, #184]
	ldr	r3, [r5, #32]
	str	r6, [r4, #188]
	str	r6, [r4, #200]
	str	r3, [r4, #192]
	str	r9, [r4, #228]
	str	r6, [r4, #276]
	str	r6, [r4, #56]
	str	r1, [r4, #160]
	ldr	r1, [r5]
	ldr	r0, [r5, #16]
	bl	Get_YuvFormat
	cmp	r0, #13
	beq	.L1329
	str	r0, [r4, #476]
	mov	r2, r9
	ldr	r3, [r5, #44]
	mov	r9, #19
	mov	r1, r7
	mov	r0, r8
	str	r3, [r4, #452]
	ldr	r3, [r5, #48]
	str	r3, [r4, #448]
	ldr	r3, [r5, #40]
	str	r9, [r4, #384]
	str	r3, [r4, #456]
	bl	FSP_SetDisplay
	ldr	r3, .L1330
	str	r4, [sp]
	mov	r1, r9
	mov	r0, r8
	ldr	r2, [r3, r8, asl #2]
	add	r2, r2, #229376
	add	r3, r2, #808
	add	r2, r2, #800
	bl	InsertImgToVoQueue
	cmp	r0, #1
	moveq	r0, r6
	beq	.L1320
	ldr	r1, [r4, #212]
	mov	r0, r8
	bl	FreeUsdByDec
	ldr	r1, [r4, #216]
	mov	r0, r8
	str	r6, [r4, #212]
	bl	FreeUsdByDec
	mov	r0, r8
	str	r6, [r4, #216]
	mov	r2, r6
	mov	r1, r7
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L1320
.L1327:
	ldr	r3, [r5, #4]
	cmp	r3, #1
	bne	.L1322
	ldr	r3, .L1330+4
	ldr	r2, [r5, #36]
	ldr	r1, .L1330+8
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1320
.L1326:
	ldr	r3, .L1330+4
	mov	r0, #0
	ldr	r2, [r5, #28]
	ldr	r1, .L1330+12
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r7
	b	.L1320
.L1329:
	ldr	r3, .L1330+4
	mov	r2, r0
	ldr	r1, .L1330+16
	mov	r0, r9
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1320
.L1328:
	ldr	r3, .L1330+4
	movw	r2, #5093
	ldr	r1, .L1330+20
	mov	r0, #22
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1320
.L1331:
	.align	2
.L1330:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC114
	.word	.LC113
	.word	.LC116
	.word	.LC115
	UNWIND(.fnend)
	.size	VDH_PutUsrdecFrame, .-VDH_PutUsrdecFrame
	.align	2
	.global	VCTRL_PutUsrdecFrame
	.type	VCTRL_PutUsrdecFrame, %function
VCTRL_PutUsrdecFrame:
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
	cmp	r0, #15
	mov	r4, r0
	mov	r5, r1
	bhi	.L1341
	ldr	r3, .L1345
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L1342
	cmp	r1, #0
	beq	.L1343
	ldr	r2, [r0, #528]
	cmp	r2, #19
	bne	.L1344
	ldr	r6, .L1345+4
	mov	r2, #56
	add	r0, r0, #472
	ldr	r3, [r6, #52]
	blx	r3
	mov	r1, r5
	mov	r0, r4
	bl	VDH_PutUsrdecFrame
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, [r6, #68]
	mov	r0, #1
	ldr	r1, .L1345+8
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1344:
	ldr	r3, .L1345+4
	mov	r0, #1
	ldr	r1, .L1345+12
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1341:
	ldr	ip, .L1345+4
	movw	r2, #5361
	ldr	r3, .L1345+16
	mov	r0, #0
	ldr	r1, .L1345+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1343:
	ldr	ip, .L1345+4
	mov	r0, r1
	ldr	r3, .L1345+24
	movw	r2, #5363
	ldr	r1, .L1345+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1342:
	ldr	ip, .L1345+4
	movw	r2, #5362
	ldr	r3, .L1345+28
	ldr	r1, .L1345+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1346:
	.align	2
.L1345:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC119
	.word	.LC118
	.word	.LC6
	.word	.LC1
	.word	.LC117
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_PutUsrdecFrame, .-VCTRL_PutUsrdecFrame
	.align	2
	.global	VCTRL_OpenHardware
	.type	VCTRL_OpenHardware, %function
VCTRL_OpenHardware:
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
	UNWIND(.pad #4)
	sub	sp, sp, #4
	ldr	r9, .L1390
	mov	r7, r0
	ldr	r6, [r9]
	cmp	r6, #0
	beq	.L1385
	cmp	r0, #15
	bhi	.L1386
	ldr	r8, .L1390+4
	ldr	r5, [r8, r0, asl #2]
	cmp	r5, #0
	beq	.L1387
	ldr	r3, [r5, #12]
	cmp	r3, #1
	bne	.L1351
	ldr	r3, [r5, #528]
	cmp	r3, #20
	beq	.L1351
	bic	r4, r3, #8
	cmp	r3, #4
	cmpne	r4, #7
	moveq	r4, #1
	movne	r4, #0
	ldmeqib	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	cmp	r3, #19
	ldmeqib	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	mov	r10, r4
.L1357:
	mov	r0, r4
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	bne	.L1356
	ldr	r3, [r8, r4, asl #2]
	ldr	r3, [r3, #528]
	cmp	r3, #19
	cmpne	r3, #4
	bic	r3, r3, #8
	movne	r2, #1
	moveq	r2, #0
	cmp	r3, #7
	moveq	r3, #0
	andne	r3, r2, #1
	cmp	r3, #0
	addne	r10, r10, #1
.L1356:
	add	r4, r4, #1
	cmp	r4, #16
	bne	.L1357
	cmp	r10, #1
	beq	.L1388
.L1358:
	ldr	r1, .L1390+8
	mov	ip, #0
	add	lr, r1, #64
.L1363:
	ldr	r2, [r1, #4]!
	mov	r3, #0
	cmp	r2, r3
	beq	.L1361
	ldr	r0, [r2, #528]
	cmp	r0, r3
	ldreq	r2, [r2, #1236]
	subeq	r3, r2, #1
	clzeq	r3, r3
	moveq	r3, r3, lsr #5
	cmp	r0, #6
	orreq	r3, r3, #1
	cmp	r3, #0
	movne	ip, #1
.L1361:
	cmp	r1, lr
	bne	.L1363
	ldr	r3, [r6, #120]
	cmp	ip, #1
	orreq	r3, r3, #2
	bfcne	r3, #1, #1
	str	r3, [r6, #120]
	ldr	r3, [r5, #528]
	cmp	r3, #1
	ldmneib	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	ldr	r3, .L1390+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	ldmeqib	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L1351:
	ldr	r3, .L1390+16
	movw	r2, #8286
	ldr	r1, .L1390+20
.L1384:
	mov	r0, #0
.L1383:
	ldr	r3, [r3, #68]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L1386:
	ldr	r3, .L1390+16
	movw	r2, #8274
	ldr	r1, .L1390+24
	b	.L1384
.L1385:
	ldr	r3, .L1390+16
	mov	r0, r6
	movw	r2, #8268
	ldr	r1, .L1390+28
	b	.L1383
.L1388:
	ldr	r3, .L1390+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1389
	mov	r0, #0
	blx	r3
.L1360:
	ldr	r6, [r9]
	mov	r2, #25
	ldr	r5, [r8, r7, asl #2]
	ldr	r3, [r6, #120]
	bfi	r3, r2, #12, #5
	bfc	r3, #17, #1
	str	r3, [r6, #120]
	ldr	r3, [r6, #120]
	orr	r3, r3, #131072
	str	r3, [r6, #120]
	b	.L1358
.L1387:
	ldr	r3, .L1390+16
	mov	r0, r5
	movw	r2, #8280
	ldr	r1, .L1390+32
	b	.L1383
.L1389:
	ldr	ip, .L1390+16
	mov	r0, r3
	movw	r2, #8322
	ldr	r1, .L1390+36
	ldr	r3, [ip, #68]
	blx	r3
	b	.L1360
.L1391:
	.align	2
.L1390:
	.word	g_pstRegCrg
	.word	.LANCHOR0
	.word	.LANCHOR0-4
	.word	g_vdm_hal_fun_ptr
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC123
	.word	.LC121
	.word	.LC120
	.word	.LC122
	.word	.LC8
	UNWIND(.fnend)
	.size	VCTRL_OpenHardware, .-VCTRL_OpenHardware
	.align	2
	.global	VCTRL_StartChan
	.type	VCTRL_StartChan, %function
VCTRL_StartChan:
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
	cmp	r0, #15
	mov	r5, r0
	bhi	.L1404
	ldr	r4, .L1408
	ldr	r3, [r4, r0, asl #2]
	cmp	r3, #0
	beq	.L1405
	ldr	r6, [r3, #12]
	cmp	r6, #1
	bne	.L1406
	ldr	r3, [r3, #528]
	cmp	r3, #20
	beq	.L1407
	bl	SM_Start
	ldr	r3, [r4, r5, asl #2]
	mov	r2, #0
	str	r6, [r3, #16]
	ldr	r3, [r4, r5, asl #2]
	str	r2, [r3, #28]
	ldr	r3, [r4, r5, asl #2]
	str	r6, [r3, #20]
	ldr	r2, [r4, r5, asl #2]
	ldr	r3, [r2, #24]
	cmp	r3, #0
	bne	.L1398
	ldr	r3, .L1408+4
	sub	r0, r4, #4
	ldr	r1, .L1408+8
	add	lr, r3, #64
	str	r6, [r2, #24]
.L1401:
	ldr	r2, [r0, #4]!
	add	r3, r3, #4
	add	r1, r1, #4
	cmp	r2, #0
	streq	r2, [r3, #-4]
	ldrne	ip, [r2, #24]
	strne	ip, [r3, #-4]
	ldrne	r2, [r2, #24]
	cmp	r3, lr
	str	r2, [r1, #-4]
	bne	.L1401
	ldr	r0, .L1408+4
	bl	VDMDRV_SetPriority
	mov	r0, r5
	bl	VDMDRV_ClearChanIsDec
.L1398:
	mov	r0, r5
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r5
	bl	VCTRL_OpenHardware
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1406:
	ldr	ip, .L1408+12
	movw	r2, #2555
	ldr	r3, .L1408+16
.L1403:
	ldr	r1, .L1408+20
	mov	r0, #0
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1404:
	ldr	ip, .L1408+12
	movw	r2, #2553
	ldr	r3, .L1408+24
	b	.L1403
.L1407:
	ldr	ip, .L1408+12
	movw	r2, #2556
	ldr	r3, .L1408+28
	b	.L1403
.L1405:
	ldr	ip, .L1408+12
	mov	r0, r3
	movw	r2, #2554
	ldr	r3, .L1408+32
	ldr	r1, .L1408+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1409:
	.align	2
.L1408:
	.word	.LANCHOR0
	.word	.LANCHOR3+612
	.word	g_ChanCtx
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC53
	.word	.LC1
	.word	.LC6
	.word	.LC124
	.word	.LC18
	UNWIND(.fnend)
	.size	VCTRL_StartChan, .-VCTRL_StartChan
	.align	2
	.global	VCTRL_CloseHardware
	.type	VCTRL_CloseHardware, %function
VCTRL_CloseHardware:
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
	ldr	r1, .L1448
	mov	r5, #0
	mov	r4, r5
	mov	r0, r5
	add	lr, r1, #64
	b	.L1416
.L1442:
	ldr	ip, [r3, #12]
	cmp	ip, #1
	beq	.L1440
.L1413:
	cmp	r2, #0
	ldreq	ip, [r3, #1236]
	movne	ip, #0
	cmp	r5, #0
	bne	.L1411
	cmp	r2, #6
	cmpne	ip, #1
	bne	.L1411
	ldr	r2, [r3, #12]
	cmp	r2, #1
	ldreq	r5, [r3, #16]
	subeq	r5, r5, #1
	clzeq	r5, r5
	moveq	r5, r5, lsr #5
.L1411:
	cmp	r1, lr
	beq	.L1441
.L1416:
	ldr	r3, [r1, #4]!
	cmp	r3, #0
	beq	.L1411
	cmp	r0, #0
	ldr	r2, [r3, #528]
	beq	.L1442
	cmp	r4, #0
	cmpeq	r2, #1
	bne	.L1413
	ldr	ip, [r3, #12]
	cmp	ip, #1
	bne	.L1413
	ldr	ip, [r3, #16]
.L1423:
	cmp	ip, #1
	moveq	r4, #1
	b	.L1413
.L1440:
	ldr	ip, [r3, #16]
	cmp	ip, #1
	beq	.L1443
.L1414:
	cmp	r4, #0
	cmpeq	r2, #1
	beq	.L1423
	b	.L1413
.L1441:
	cmp	r0, #0
	beq	.L1444
.L1417:
	cmp	r5, #0
	bne	.L1420
	ldr	r3, .L1448+4
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L1445
	mov	r0, r5
	blx	r3
.L1420:
	cmp	r4, #0
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L1448+4
	ldr	r3, [r3, #28]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L1444:
	ldr	r3, .L1448+4
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L1446
	blx	r3
.L1419:
	ldr	r1, .L1448+8
	mov	r3, #0
	ldr	r2, .L1448+12
	str	r3, [r1]
	str	r3, [r2, #84]
	b	.L1417
.L1443:
	sub	r0, r2, #5
	cmp	r0, #1
	cmphi	r2, #3
	bhi	.L1447
.L1425:
	mov	r0, ip
	b	.L1414
.L1447:
	sub	r0, r2, #8
	cmp	r0, #5
	bls	.L1425
	sub	r0, r2, #16
	cmp	r0, #1
	movhi	r0, #0
	movls	r0, #1
	b	.L1414
.L1446:
	ldr	r3, .L1448+16
	movw	r2, #8447
	ldr	r1, .L1448+20
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1419
.L1445:
	ldr	r3, .L1448+16
	mov	r0, r5
	movw	r2, #8463
	ldr	r1, .L1448+20
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1420
.L1449:
	.align	2
.L1448:
	.word	.LANCHOR0-4
	.word	g_vdm_hal_fun_ptr
	.word	g_VdmDrvParam
	.word	g_ScdDrvParam
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC8
	UNWIND(.fnend)
	.size	VCTRL_CloseHardware, .-VCTRL_CloseHardware
	.align	2
	.global	VCTRL_StopChan
	.type	VCTRL_StopChan, %function
VCTRL_StopChan:
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
	cmp	r0, #15
	mov	r4, r0
	bhi	.L1456
	ldr	r6, .L1458
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L1457
	ldr	r2, [r3, #12]
	cmp	r2, #1
	bne	.L1455
	str	r2, [r3, #28]
	mov	r2, #0
	ldr	r3, [r6, r0, asl #2]
	str	r2, [r3, #16]
	bl	SM_Stop
	subs	r5, r0, #0
	bne	.L1455
	mov	r1, r5
	mov	r0, r4
	bl	DeleteRawPacketInBuffer
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	ldr	r3, [r6, r4, asl #2]
	str	r5, [r3, #28]
	bl	VCTRL_CloseHardware
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1455:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1456:
	ldr	ip, .L1458+4
	movw	r2, #2660
	ldr	r3, .L1458+8
	mov	r0, #0
	ldr	r1, .L1458+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1457:
	ldr	ip, .L1458+4
	mov	r0, r3
	movw	r2, #2661
	ldr	r3, .L1458+16
	ldr	r1, .L1458+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1459:
	.align	2
.L1458:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC125
	UNWIND(.fnend)
	.size	VCTRL_StopChan, .-VCTRL_StopChan
	.align	2
	.global	VCTRL_StopChanWithCheck
	.type	VCTRL_StopChanWithCheck, %function
VCTRL_StopChanWithCheck:
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
	ldr	r5, .L1467
	mov	r7, r0
	mov	r4, #0
	mov	r8, r5
	b	.L1462
.L1466:
	add	r4, r4, #1
	ldr	r3, [r8, #124]
	blx	r3
	cmp	r4, #50
	beq	.L1464
.L1462:
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	mov	r0, r7
	bl	VCTRL_StopChan
	mov	r6, r0
	bl	VCTRL_EnableAllInt
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	cmp	r6, #0
	mov	r0, #10
	bne	.L1466
	cmp	r4, #49
	bgt	.L1464
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1464:
	ldr	r3, [r5, #68]
	mvn	r6, #0
	ldr	r1, .L1467+4
	mov	r0, #0
	blx	r3
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1468:
	.align	2
.L1467:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC126
	UNWIND(.fnend)
	.size	VCTRL_StopChanWithCheck, .-VCTRL_StopChanWithCheck
	.align	2
	.global	VCTRL_ResetChan
	.type	VCTRL_ResetChan, %function
VCTRL_ResetChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	cmp	r0, #15
	mov	r4, r0
	bhi	.L1491
	ldr	r5, .L1495
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	beq	.L1492
	ldr	r8, [r3, #16]
	bl	VCTRL_StopChan
	ldr	r7, .L1495+4
	mov	r2, #0
	ldr	r3, [r5, r4, asl #2]
	mov	r0, #4
	ldr	r1, [r7, #12]
	str	r2, [r3, #328]
	str	r2, [r3, #332]
	blx	r1
	ldr	r3, [r5, r4, asl #2]
	ldr	r2, [r3, #1404]
	cmp	r2, #1
	beq	.L1493
.L1473:
	ldr	r0, .L1495+8
	mov	r2, #300
	mov	r1, #0
	ldr	r3, [r7, #48]
	mov	r6, r1
	mla	r0, r2, r4, r0
	blx	r3
	mov	r1, r6
	mov	r0, r4
	bl	VCTRL_SetSendStreamAgainFlag
	ldr	r3, [r5, r4, asl #2]
	mov	r0, r4
	str	r6, [r3, #1224]
	bl	InitSyntaxCtx
	ldr	r0, [r5, r4, asl #2]
	mov	r1, r6
	ldr	r3, [r7, #48]
	mov	r2, #416
	add	r0, r0, #664
	blx	r3
	ldr	r3, [r5, r4, asl #2]
	mvn	r0, #0
	mvn	r1, #0
	add	r2, r3, #229376
	add	ip, r3, #592
	strd	r0, [ip, #-8]
	strd	r0, [ip]
	mov	r0, r4
	str	r6, [r3, #1080]
	str	r6, [r2, #752]
	str	r6, [r2, #744]
	str	r6, [r2, #748]
	ldr	r1, [r3, #1404]
	cmp	r1, #1
	streq	r6, [r3, #1444]
	streq	r6, [r2, #732]
	bl	FSP_SwitchNotify
	ldr	r3, [r5, r4, asl #2]
	mov	r0, r4
	ldr	r3, [r3, #528]
	cmp	r3, #19
	beq	.L1475
	bl	FSP_ResetInstance
.L1476:
	ldr	r3, [r7, #16]
	mov	r0, #4
	blx	r3
	mov	r0, r4
	bl	InitUsdPool
	mov	r0, r4
	bl	SM_Reset
	ldr	r3, .L1495+12
	ldr	r2, [r3, #676]
	cmp	r2, #0
	beq	.L1477
	add	r5, r3, r4, lsl #2
	str	r4, [fp, #-40]
	ldr	r3, [r5, #680]
	cmp	r3, #0
	beq	.L1479
	mov	r0, #512
	sub	r1, fp, #40
	bl	VCTRL_SetDbgOption
	ldr	r3, [r5, #680]
	cmp	r3, #0
	beq	.L1479
	sub	r1, fp, #40
	mov	r0, #512
	bl	VCTRL_SetDbgOption
.L1479:
	ldr	r3, [r7, #68]
	mov	r0, #32
	ldr	r1, .L1495+16
	blx	r3
.L1477:
	cmp	r8, #0
	bne	.L1494
.L1481:
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	mov	r0, #0
.L1471:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1494:
	mov	r0, r4
	bl	VCTRL_StartChan
	b	.L1481
.L1475:
	bl	FSP_EmptyInstance
	b	.L1476
.L1493:
	add	r2, r3, #229376
	ldr	r3, [r3, #528]
	ldr	r2, [r2, #792]
	cmp	r2, r3
	bne	.L1473
	mov	r0, r4
	bl	VCTRL_FindOccupiedFrame
	b	.L1473
.L1491:
	ldr	ip, .L1495+4
	movw	r2, #3698
	ldr	r3, .L1495+20
	mov	r0, #0
	ldr	r1, .L1495+24
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1471
.L1492:
	ldr	ip, .L1495+4
	mov	r0, r3
	movw	r2, #3699
	ldr	r3, .L1495+28
	ldr	r1, .L1495+24
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1471
.L1496:
	.align	2
.L1495:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+3988
	.word	.LANCHOR3
	.word	.LC127
	.word	.LC6
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_ResetChan, .-VCTRL_ResetChan
	.align	2
	.global	VCTRL_CreateChanWithOption
	.type	VCTRL_CreateChanWithOption, %function
VCTRL_CreateChanWithOption:
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
	subs	r7, r1, #0
	mov	r8, r0
	mov	r4, r2
	beq	.L1560
	ldr	r5, .L1577
	mov	r2, #16
	mov	r1, #0
	sub	r0, fp, #204
	ldr	r9, .L1577+4
	ldr	r3, [r5, #48]
	blx	r3
	ldr	r3, [r5, #48]
	mov	r2, #16
	mov	r1, #0
	sub	r0, fp, #188
	blx	r3
	ldr	r3, [r5, #48]
	mov	r2, #16
	mov	r1, #0
	sub	r0, fp, #172
	blx	r3
	ldr	r3, [r5, #48]
	sub	r0, fp, #140
	mov	r2, #96
	mov	r1, #0
	blx	r3
	subs	r3, r8, #25
	str	r7, [r9, #808]
	movne	r3, #1
	cmp	r4, #0
	movne	r3, #0
	cmp	r3, #0
	bne	.L1561
	ldr	r3, [r7, #36]
	cmp	r3, #0
	blt	.L1501
	ldr	r3, [r7, #12]
	cmp	r3, #31
	ble	.L1501
	ldr	r3, [r7, #16]
	cmp	r3, #31
	ble	.L1501
	ldr	r3, [r7, #56]
	cmp	r3, #262144
	blt	.L1501
	ldr	r3, [r7, #44]
	cmp	r3, #1
	beq	.L1562
	cmp	r3, #2
	beq	.L1563
.L1503:
	ldr	r3, [r7, #144]
	movw	ip, #28464
	movt	ip, 8
	movw	lr, #57560
	cmp	r3, #1
	sub	r2, fp, #216
	mov	r1, r7
	mov	r0, r8
	movhi	r3, #0
	strhi	r3, [r7, #144]
	cmp	r8, #26
	mov	r3, r4
	movt	lr, 176
	movne	lr, ip
	str	lr, [fp, #-224]
	bl	VCTRL_GetChanMemSizeWithOption
	subs	r4, r0, #0
	bne	.L1564
	ldr	r3, [r7, #116]
	cmp	r3, #0
	beq	.L1508
	ldr	r3, [r7, #120]
	cmp	r3, #0
	bne	.L1509
.L1508:
	mov	r0, #5
	mov	r4, #1
	bl	VFMW_GetString
	ldr	r2, [fp, #-208]
	str	r4, [sp]
	sub	r3, fp, #156
	mov	r1, #0
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	bne	.L1565
	ldr	r2, [fp, #-144]
	ldr	r1, [fp, #-152]
	ldr	r0, [fp, #-148]
	str	r4, [fp, #-228]
	bl	MEM_AddMemRecord
	ldr	r1, [fp, #-148]
	ldr	r2, [fp, #-152]
	ldr	r3, [fp, #-144]
	str	r1, [fp, #-172]
	str	r2, [fp, #-168]
	str	r3, [fp, #-164]
.L1511:
	ldr	r3, [r7, #84]
	cmp	r3, #0
	beq	.L1513
	ldr	r3, [r7, #88]
	cmp	r3, #0
	bne	.L1514
.L1513:
	ldr	r3, [r7, #144]
	cmp	r3, #1
	beq	.L1515
	mov	r0, #6
	bl	VFMW_GetString
	mov	r1, #0
	ldr	r2, [fp, #-216]
	sub	r3, fp, #156
	str	r1, [sp]
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	bne	.L1566
	ldr	r2, [fp, #-144]
	mov	r3, #1
	ldr	r1, [fp, #-152]
	ldr	r0, [fp, #-148]
	str	r3, [fp, #-232]
	bl	MEM_AddMemRecord
	ldr	r1, [fp, #-148]
	ldr	r2, [fp, #-152]
	ldr	r3, [fp, #-144]
	str	r1, [fp, #-204]
	str	r2, [fp, #-200]
	str	r3, [fp, #-196]
.L1518:
	ldr	r3, [r7, #100]
	cmp	r3, #0
	beq	.L1522
	ldr	r3, [r7, #104]
	cmp	r3, #0
	bne	.L1523
.L1522:
	mov	r0, #7
	bl	VFMW_GetString
	mov	r1, #0
	ldr	r2, [fp, #-212]
	sub	r3, fp, #156
	str	r1, [sp]
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	bne	.L1567
	ldr	r2, [fp, #-144]
	mov	r3, #1
	ldr	r1, [fp, #-152]
	ldr	r0, [fp, #-148]
	str	r3, [fp, #-236]
	bl	MEM_AddMemRecord
	ldr	r1, [fp, #-148]
	ldr	r2, [fp, #-152]
	ldr	r3, [fp, #-144]
	str	r1, [fp, #-188]
	str	r2, [fp, #-184]
	str	r3, [fp, #-180]
.L1527:
	ldr	r6, .L1577+8
	mov	r0, #0
	ldr	r3, [r5, #12]
	blx	r3
	bl	VCTRL_MaskAllInt
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L1541
	mov	r3, r6
	mov	r4, #1
.L1534:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L1568
	add	r4, r4, #1
	cmp	r4, #16
	bne	.L1534
	mov	r2, r4
	ldr	r3, [r5, #68]
	ldr	r1, .L1577+12
	mov	r0, #1
	blx	r3
	bl	VCTRL_EnableAllInt
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	mvn	r0, #0
.L1556:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1515:
	mov	r3, #0
	str	r3, [fp, #-204]
	str	r3, [fp, #-200]
	str	r3, [fp, #-232]
	str	r3, [fp, #-196]
	b	.L1518
.L1563:
	ldr	r3, [r7, #20]
	cmp	r3, #0
	ble	.L1501
	ldr	r3, [r7, #24]
	cmp	r3, #0
	ble	.L1501
.L1558:
	ldr	r3, [r7, #28]
	cmp	r3, #0
	ble	.L1501
	ldr	r3, [r7, #32]
	cmp	r3, #0
	bgt	.L1503
.L1501:
	ldr	r3, [r5, #68]
	mov	r0, #0
	ldr	r1, .L1577+16
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1568:
	uxtb	r3, r4
	str	r3, [fp, #-240]
.L1532:
	ldr	r3, [fp, #-224]
	mov	r1, #0
	ldr	r0, [fp, #-168]
	mov	r10, r1
	sub	r2, r3, #207872
	ldr	r3, [r5, #48]
	sub	r2, r2, #8
	str	r0, [r6, r4, asl #2]
	blx	r3
	ldr	r0, [r6, r4, asl #2]
	ldr	r3, [r5, #52]
	mov	r2, #176
	add	r0, r0, #1248
	mov	r1, r7
	add	r0, r0, #12
	blx	r3
	ldr	r1, [r6, r4, asl #2]
	ldr	r0, [fp, #-224]
	mov	ip, r4, asl #4
	mov	lr, r4, asl #6
	str	ip, [fp, #-244]
	str	r8, [r1, #40]
	mov	r2, #20
	ldr	r3, [r6, r4, asl #2]
	str	r0, [r1, #1200]
	rsb	r0, ip, lr
	mov	r1, #30
	str	lr, [fp, #-248]
	str	r4, [r3, #8]
	str	r8, [r3, #564]
	mov	r8, r10
	str	r10, [r3, #1216]
	ldr	r3, [r6, r4, asl #2]
	ldr	ip, [r7]
	str	ip, [r3, #36]
	ldr	r3, [r6, r4, asl #2]
	add	ip, r3, #229376
	str	r2, [r3, #528]
	str	r2, [ip, #792]
	ldr	ip, .L1577+20
	str	r10, [r3, #32]
	ldr	r3, [r6, r4, asl #2]
	add	r0, ip, r0
	ldrb	ip, [fp, #-240]	@ zero_extendqisi2
	add	r2, r3, #204800
	strb	ip, [r2, #1472]
	add	r2, r3, #205824
	str	r1, [r3, #1464]
	add	r3, r3, #1472
	ldr	r1, .L1577+24
	add	r2, r2, #448
	str	r3, [r0, #40]
	mov	r0, r4
	str	r2, [r1, r4, asl #2]
	bl	VCTRL_ResetChan
	ldr	r2, [r6, r4, asl #2]
	ldr	r0, [fp, #-236]
	ldr	r1, [fp, #-232]
	add	r3, r2, #225280
	str	r0, [r2, #252]
	ldr	r0, [fp, #-228]
	str	r1, [r2, #248]
	add	r1, r2, #229376
	str	r0, [r2, #256]
	str	r10, [r3, #3288]
	str	r10, [r3, #3292]
	str	r10, [r3, #3300]
	str	r10, [r3, #3304]
	str	r10, [r3, #3296]
	str	r10, [r3, #3312]
	ldr	r3, [r7, #144]
	str	r10, [r1, #732]
	str	r3, [r1, #736]
.L1536:
	ldr	r0, [r6, r4, asl #2]
	mov	r3, r8, asl #4
	add	r3, r3, r8, lsl #2
	mvn	r1, #0
	add	r2, r0, r3
	add	r3, r3, #228352
	add	r2, r2, #228352
	add	r3, r3, #248
	add	r0, r0, r3
	add	r8, r8, #1
	strb	r1, [r2, #264]
	mov	r2, #16
	ldr	r3, [r5, #48]
	mov	r1, #0
	blx	r3
	cmp	r8, #32
	ldr	r7, .L1577+8
	ldr	r10, .L1577
	bne	.L1536
	ldr	r0, [r7, r4, asl #2]
	mov	r2, #820
	ldr	r3, [r10, #48]
	mov	r1, #0
	add	r0, r0, #228352
	add	r9, r9, r4, lsl #2
	add	r0, r0, #888
	blx	r3
	ldr	r0, [r7, r4, asl #2]
	ldr	r3, [r10, #48]
	mov	r2, #24
	add	r0, r0, #229376
	mov	r1, #0
	add	r0, r0, #684
	blx	r3
	ldr	r3, [r7, r4, asl #2]
	ldr	r2, [fp, #-200]
	mov	ip, #0
	ldr	r1, [fp, #-184]
	add	r7, r3, #225280
	ldr	lr, [fp, #-172]
	str	r2, [r3, #204]
	ldr	r0, [fp, #-204]
	str	r1, [r3, #220]
	ldr	r2, [fp, #-196]
	str	lr, [r3, #240]
	ldr	r8, [fp, #-168]
	ldr	r10, [fp, #-164]
	ldr	lr, [fp, #-188]
	ldr	r1, [fp, #-180]
	str	r8, [r3, #236]
	str	r10, [r3, #244]
	str	r0, [r3, #208]
	str	r0, [r3, #280]
	str	r2, [r3, #212]
	str	r2, [r3, #284]
	str	lr, [r3, #224]
	str	r1, [r3, #228]
	str	ip, [r7, #3272]
	ldr	r7, [r3, #1404]
	str	ip, [r9, #812]
	cmp	r7, #1
	beq	.L1537
	ldr	ip, [r3, #272]
	ldr	r7, [r3, #4]
	rsb	r2, ip, r2
	str	r1, [r3, #288]
	rsb	r2, r7, r2
	add	ip, ip, r7
	sub	r2, r2, #47616
	add	r0, ip, r0
	sub	r2, r2, #16
	str	r2, [r3, #264]
	add	r1, r2, r0
	str	r0, [r3, #260]
	add	r2, r1, #14848
	add	r1, r1, #15
	add	r2, r2, #15
	bic	r1, r1, #15
	bic	r2, r2, #15
	mov	r0, #14848
	str	r2, [r3, #300]
	mov	r2, #32768
	str	lr, [r3, #276]
	str	r1, [r3, #292]
	str	r0, [r3, #296]
	str	r2, [r3, #304]
.L1538:
	ldr	r3, [r6, r4, asl #2]
	mov	r0, r4
	ldr	r7, .L1577+8
	str	r4, [r3, #8]
	ldr	r3, [r6, r4, asl #2]
	add	r2, r3, #188416
	str	r4, [r3, #188]
	str	r4, [r3, #192]
	str	r4, [r2, #3816]
	bl	FSP_EnableInstance
	subs	r6, r0, #0
	bne	.L1569
	mov	r0, r4
	bl	SM_ClearInst
	ldr	r3, [r7, r4, asl #2]
	ldr	r2, [fp, #-224]
	mov	r0, r4
	sub	r1, r2, #205824
	ldr	r3, [r3, #236]
	sub	r1, r1, #8
	add	r1, r3, r1
	bl	OpenUsdPool_WithMem
	ldr	r3, [r7, r4, asl #2]
	mov	r2, #1
	mov	r0, r4
	str	r2, [r3, #12]
	bl	VDMDRV_ClearChanIsDec
	bl	VCTRL_EnableAllInt
	bl	VDMDRV_ParamInit
	ldr	r3, [r5, #16]
	mov	r0, r6
	blx	r3
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1562:
	ldr	r3, [r7, #20]
	cmp	r3, #0
	bgt	.L1558
	b	.L1501
.L1509:
	ldr	r3, [r5, #52]
	mov	r2, #16
	add	r1, r7, #112
	sub	r0, fp, #172
	blx	r3
	ldr	r2, [fp, #-164]
	ldr	r3, [fp, #-208]
	ldr	r1, .L1577
	cmp	r2, r3
	blt	.L1570
	ldr	r1, [fp, #-168]
	ldr	r0, [fp, #-172]
	str	r4, [fp, #-228]
	bl	MEM_AddMemRecord
	b	.L1511
.L1523:
	add	r1, r7, #96
	sub	r0, fp, #188
	ldr	r3, [r5, #52]
	mov	r2, #16
	blx	r3
	ldr	r1, [fp, #-184]
	cmp	r1, #0
	beq	.L1528
	ldr	r2, [fp, #-180]
	ldr	r3, [fp, #-212]
	cmp	r2, r3
	blt	.L1528
	ldr	r0, [fp, #-188]
	mov	r3, #0
	str	r3, [fp, #-236]
	bl	MEM_AddMemRecord
	b	.L1527
.L1514:
	ldr	r3, [r5, #52]
	mov	r2, #16
	sub	r0, fp, #204
	add	r1, r7, #80
	blx	r3
	ldr	r3, [r7, #144]
	ldr	r2, [fp, #-196]
	cmp	r3, #1
	beq	.L1520
	ldr	r3, [fp, #-216]
	cmp	r2, r3
	blt	.L1571
.L1520:
	ldr	r1, [fp, #-200]
	mov	r3, #0
	ldr	r0, [fp, #-204]
	str	r3, [fp, #-232]
	bl	MEM_AddMemRecord
	b	.L1518
.L1537:
	sub	r1, r1, #47616
	str	ip, [r3, #260]
	sub	r1, r1, #16
	str	r1, [r3, #288]
	add	r2, r1, lr
	str	ip, [r3, #264]
	add	r1, r2, #14848
	add	r2, r2, #15
	add	r1, r1, #15
	bic	r2, r2, #15
	bic	r1, r1, #15
	str	r2, [r3, #292]
	str	r1, [r3, #300]
	mov	r2, #32768
	mov	r1, #14848
	str	lr, [r3, #276]
	str	r1, [r3, #296]
	str	r2, [r3, #304]
	b	.L1538
.L1567:
	ldr	r3, [fp, #-228]
	cmp	r3, #1
	beq	.L1572
.L1525:
	ldr	r3, [fp, #-232]
	cmp	r3, #1
	beq	.L1573
.L1526:
	ldr	r3, [r5, #68]
	movw	r2, #2059
	ldr	r1, .L1577+28
	mov	r0, #1
	blx	r3
	mvn	r0, #0
	b	.L1556
.L1528:
	ldr	r3, [fp, #-228]
	cmp	r3, #1
	beq	.L1574
.L1530:
	ldr	r3, [fp, #-232]
	cmp	r3, #1
	beq	.L1575
.L1531:
	ldr	r3, [r5, #68]
	movw	r2, #2087
	ldr	r1, .L1577+32
	mov	r0, #1
	blx	r3
	mvn	r0, #0
	b	.L1556
.L1573:
	ldr	r1, [fp, #-200]
	ldr	r0, [fp, #-204]
	bl	MEM_ReleaseMemBlock
	sub	r0, fp, #204
	ldmia	r0, {r0, r1, r2}
	bl	MEM_DelMemRecord
	b	.L1526
.L1572:
	ldr	r1, [fp, #-168]
	ldr	r0, [fp, #-172]
	bl	MEM_ReleaseMemBlock
	sub	r0, fp, #172
	ldmia	r0, {r0, r1, r2}
	bl	MEM_DelMemRecord
	b	.L1525
.L1541:
	str	r3, [fp, #-240]
	mov	r4, r3
	b	.L1532
.L1566:
	ldr	r3, [fp, #-228]
	cmp	r3, #1
	beq	.L1576
.L1517:
	ldr	r3, [r5, #68]
	movw	r2, #2002
	ldr	r1, .L1577+36
	mov	r0, #1
	blx	r3
	mvn	r0, #0
	b	.L1556
.L1569:
	ldr	r3, [r5, #68]
	mov	r0, #1
	ldr	r1, .L1577+40
	mov	r6, #0
	blx	r3
	mov	r0, r4
	bl	FSP_DisableInstance
	mov	r0, r4
	bl	CloseUsdPool_WithMem
	ldr	r0, [r7, r4, asl #2]
	ldr	r3, [r5, #52]
	mov	r2, #16
	add	ip, r0, #228352
	add	r1, r0, #232
	ldr	lr, [r0, #256]
	add	ip, ip, #248
	str	ip, [fp, #-48]
	ldr	ip, [r0, #248]
	ldr	r0, [r0, #252]
	str	lr, [fp, #-68]
	str	ip, [fp, #-76]
	str	r0, [fp, #-72]
	sub	r0, fp, #108
	blx	r3
	ldr	r1, [r7, r4, asl #2]
	ldr	r3, [r5, #52]
	mov	r2, #16
	add	r1, r1, #200
	sub	r0, fp, #140
	blx	r3
	ldr	r1, [r7, r4, asl #2]
	ldr	r3, [r5, #52]
	mov	r2, #16
	add	r1, r1, #216
	sub	r0, fp, #124
	blx	r3
	ldr	r3, [fp, #-248]
	ldr	r2, [fp, #-244]
	sub	r0, fp, #92
	rsb	r1, r2, r3
	ldr	r3, .L1577+20
	mov	r2, #16
	add	r1, r3, r1
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r1, [r7, r4, asl #2]
	mov	r2, #12
	ldr	r3, [r5, #52]
	add	r1, r1, #152
	sub	r0, fp, #64
	blx	r3
	mov	r0, r4
	str	r6, [r7, r4, asl #2]
	bl	VDMDRV_ClearChanIsDec
	bl	VCTRL_EnableAllInt
	ldr	r3, [r5, #16]
	mov	r0, r6
	blx	r3
	sub	r1, fp, #140
	mov	r0, r4
	bl	VCTRL_FreeChanResource
	mvn	r0, #0
	b	.L1556
.L1565:
	ldr	r3, [r5, #68]
	mov	r0, r4
	movw	r2, #1967
	ldr	r1, .L1577+44
	blx	r3
	mvn	r0, #0
	b	.L1556
.L1561:
	ldr	r3, [r5, #68]
	mov	r0, #0
	ldr	r1, .L1577+48
	blx	r3
	mvn	r0, #0
	b	.L1556
.L1564:
	ldr	r3, [r5, #68]
	movw	r2, #1959
	ldr	r1, .L1577+52
	mov	r0, #0
	blx	r3
	mvn	r0, #0
	b	.L1556
.L1570:
	ldr	r3, [r1, #68]
	movw	r2, #1983
	ldr	r1, .L1577+56
	mov	r0, #1
	blx	r3
	mvn	r0, #0
	b	.L1556
.L1560:
	ldr	ip, .L1577
	mov	r0, r7
	ldr	r3, .L1577+60
	movw	r2, #1909
	ldr	r1, .L1577+64
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1556
.L1571:
	ldr	r1, [fp, #-228]
	cmp	r1, #1
	bne	.L1521
	ldr	r1, [fp, #-168]
	ldr	r0, [fp, #-172]
	bl	MEM_ReleaseMemBlock
	sub	r0, fp, #172
	ldmia	r0, {r0, r1, r2}
	bl	MEM_DelMemRecord
	ldr	r2, [fp, #-196]
	ldr	r3, [fp, #-216]
.L1521:
	str	r3, [sp]
	mov	r0, #1
	mov	r3, r2
	ldr	r4, [r5, #68]
	movw	r2, #2034
	ldr	r1, .L1577+68
	blx	r4
	mvn	r0, #0
	b	.L1556
.L1576:
	ldr	r1, [fp, #-168]
	ldr	r0, [fp, #-172]
	bl	MEM_ReleaseMemBlock
	sub	r0, fp, #172
	ldmia	r0, {r0, r1, r2}
	bl	MEM_DelMemRecord
	b	.L1517
.L1575:
	ldr	r1, [fp, #-200]
	ldr	r0, [fp, #-204]
	bl	MEM_ReleaseMemBlock
	sub	r0, fp, #204
	ldmia	r0, {r0, r1, r2}
	bl	MEM_DelMemRecord
	b	.L1531
.L1574:
	ldr	r1, [fp, #-168]
	ldr	r0, [fp, #-172]
	bl	MEM_ReleaseMemBlock
	sub	r0, fp, #172
	ldmia	r0, {r0, r1, r2}
	bl	MEM_DelMemRecord
	b	.L1530
.L1578:
	.align	2
.L1577:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3
	.word	.LANCHOR0
	.word	.LC138
	.word	.LC69
	.word	s_SmIIS
	.word	s_pFspInst
	.word	.LC135
	.word	.LC136
	.word	.LC133
	.word	.LC137
	.word	.LC131
	.word	.LC129
	.word	.LC130
	.word	.LC132
	.word	.LC128
	.word	.LC1
	.word	.LC134
	UNWIND(.fnend)
	.size	VCTRL_CreateChanWithOption, .-VCTRL_CreateChanWithOption
	.align	2
	.global	VCTRL_CreateChan
	.type	VCTRL_CreateChan, %function
VCTRL_CreateChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 232
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #240)
	sub	sp, sp, #240
	cmp	r0, #32
	mov	r4, r0
	mov	r6, r1
	bhi	.L1603
	ldr	r5, .L1606
	mov	r2, #12
	mov	r1, #0
	sub	r0, fp, #260
	mov	r7, #2
	ldr	r3, [r5, #48]
	blx	r3
	ldr	r3, [r5, #48]
	mov	r2, #12
	mov	r1, #0
	sub	r0, fp, #248
	blx	r3
	ldr	r3, [r5, #48]
	mov	r2, #176
	mov	r1, #0
	sub	r0, fp, #204
	blx	r3
	ldr	r3, [r5, #48]
	mov	r2, #16
	mov	r1, #0
	sub	r0, fp, #236
	blx	r3
	ldr	r3, [r5, #48]
	mov	r2, #16
	mov	r1, #0
	sub	r0, fp, #220
	blx	r3
	ldr	r2, .L1606+4
	mov	r0, r4, asl #2
	mov	r1, r4, asl #5
	rsb	ip, r0, r1
	sub	r3, r4, #18
	add	lr, r2, ip
	str	r7, [fp, #-196]
	ldr	ip, [r2, ip]
	ldr	lr, [lr, #4]
	str	ip, [fp, #-192]
	mov	ip, #136
	str	lr, [fp, #-188]
	mov	lr, #32
	str	ip, [fp, #-184]
	mov	ip, #256
	str	lr, [fp, #-176]
	str	ip, [fp, #-172]
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L1582
.L1584:
	.word	.L1594
	.word	.L1594
	.word	.L1594
	.word	.L1594
	.word	.L1594
	.word	.L1585
	.word	.L1585
	.word	.L1585
.L1594:
	mov	lr, #5
	mov	ip, #3
.L1583:
	rsb	r3, r0, r1
	rsb	r1, r0, r1
	add	r3, r2, r3
	add	r2, r2, r1
	str	ip, [fp, #-144]
	mov	r1, #0
	ldr	r3, [r3, #12]
	ldr	r2, [r2, #24]
	cmp	r3, lr
	str	r1, [fp, #-140]
	rsbgt	r3, ip, r3
	str	r1, [fp, #-136]
	movle	r3, #1
	subgt	r3, r3, #2
	cmp	r4, #24
	str	r3, [fp, #-168]
	str	r2, [fp, #-148]
	mov	r3, #1
	streq	r1, [fp, #-168]
	str	r3, [fp, #-164]
	str	r3, [fp, #-160]
	str	r3, [fp, #-152]
	streq	r3, [fp, #-144]
	beq	.L1589
	cmp	r4, #26
	beq	.L1604
	cmp	r4, #18
	moveq	r3, #4
	streq	r3, [fp, #-168]
	moveq	r3, #2
	streq	r3, [fp, #-144]
.L1589:
	sub	r2, fp, #248
	sub	r1, fp, #260
	mov	r0, r4
	bl	VCTRL_GetChanMemSize
	cmp	r0, #0
	bne	.L1605
	cmp	r6, #0
	beq	.L1595
	ldr	r3, [r6, #8]
	cmp	r3, #0
	beq	.L1592
	ldr	r2, [r6]
	cmp	r2, #0
	beq	.L1593
	ldr	r0, [r6, #4]
	cmp	r0, #0
	beq	.L1593
	ldr	r1, [fp, #-260]
	ldr	ip, [fp, #-248]
	add	r1, r1, ip
	cmp	r3, r1
	blt	.L1593
	ldr	ip, [fp, #-244]
	mov	lr, #3
	sub	r1, fp, #220
	str	r2, [fp, #-220]
	rsb	r3, ip, r3
	add	r2, ip, r2
	str	r0, [fp, #-216]
	add	r0, r0, ip
	str	r2, [fp, #-236]
	mov	r2, #16
	str	r0, [fp, #-232]
	sub	r0, fp, #108
	str	ip, [fp, #-212]
	str	r3, [fp, #-228]
	str	lr, [fp, #-196]
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r3, [r5, #52]
	sub	r1, fp, #236
	mov	r2, #16
	sub	r0, fp, #124
	blx	r3
	mov	r3, #1
.L1592:
	sub	r1, fp, #204
	mov	r0, r4
	mov	r2, #1
	bl	VCTRL_CreateChanWithOption
	orr	r0, r0, r0, asr #31
.L1581:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1585:
	mov	lr, #3
	mov	ip, #1
	b	.L1583
.L1582:
	mov	lr, #8
	mov	ip, #6
	b	.L1583
.L1604:
	mov	r3, #16
	str	r3, [fp, #-168]
	mov	r3, #6
	str	r3, [fp, #-144]
	b	.L1589
.L1595:
	mov	r3, r6
	b	.L1592
.L1593:
	ldr	r3, [r5, #68]
	mov	r0, #1
	ldr	r1, .L1606+8
	blx	r3
	ldr	ip, [r6, #8]
	ldmia	r6, {r2, r3}
	mov	r0, #1
	ldr	r1, .L1606+12
	str	ip, [sp]
	ldr	r4, [r5, #68]
	blx	r4
	ldr	r1, [fp, #-260]
	ldr	r2, [fp, #-248]
	mov	r0, #1
	ldr	r3, [r5, #68]
	add	r2, r1, r2
	ldr	r1, .L1606+16
	blx	r3
	mvn	r0, #0
	b	.L1581
.L1603:
	ldr	r3, .L1606
	mov	r2, r0
	ldr	r1, .L1606+20
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1581
.L1605:
	ldr	r3, [r5, #68]
	mov	r0, #1
	ldr	r1, .L1606+24
	blx	r3
	mvn	r0, #0
	b	.L1581
.L1607:
	.align	2
.L1606:
	.word	vfmw_Osal_Func_Ptr_S
	.word	CapItem
	.word	.LC141
	.word	.LC142
	.word	.LC143
	.word	.LC139
	.word	.LC140
	UNWIND(.fnend)
	.size	VCTRL_CreateChan, .-VCTRL_CreateChan
	.align	2
	.global	VCTRL_ConfigChan
	.type	VCTRL_ConfigChan, %function
VCTRL_ConfigChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #76)
	sub	sp, sp, #76
	subs	r8, r1, #0
	mov	r6, #0
	mov	r4, r0
	str	r6, [fp, #-100]
	beq	.L1643
	cmp	r0, #15
	bhi	.L1644
	ldr	r7, .L1653
	ldr	r3, [r7, r0, asl #2]
	cmp	r3, #0
	beq	.L1645
	ldr	r3, [r3, #12]
	cmp	r3, #1
	bne	.L1646
	bl	VCTRL_CheckChanWH
	subs	r5, r0, #0
	bne	.L1647
	ldr	r6, .L1653+4
	add	r0, r6, #876
	bl	GetVdecCapability
	ldr	r3, [r6, #896]
	ldr	r2, [r8]
	cmp	r3, #19
	bhi	.L1616
	cmp	r3, r2
	beq	.L1617
	add	r3, r6, #896
	add	r0, r6, #1020
.L1619:
	ldr	r1, [r3, #4]!
	cmp	r1, #19
	bhi	.L1616
	cmp	r1, r2
	beq	.L1617
	cmp	r3, r0
	bne	.L1619
.L1617:
	cmp	r2, #8
	beq	.L1648
.L1620:
	cmp	r2, #9
	beq	.L1649
.L1622:
	cmp	r2, #5
	mov	r3, #0
	str	r3, [fp, #-96]
	beq	.L1650
.L1634:
	mov	r1, r8
	mov	r0, r4
	bl	VCTRL_CmpConfigParameter
	subs	r3, r0, #0
	beq	.L1651
	ldr	r6, .L1653+8
	mov	r2, #104
	ldr	r0, [r7, r4, asl #2]
	mov	r1, r8
	mov	r10, #0
	ldr	r3, [r6, #52]
	add	r0, r0, #48
	blx	r3
	ldr	ip, [r8, #12]
	ldr	r3, [r7, r4, asl #2]
	mov	r2, #52
	mov	r1, #0
	sub	r0, fp, #96
	str	ip, [r3, #24]
	ldr	r3, [r7, r4, asl #2]
	ldr	ip, [r8]
	ldr	r9, [r6, #48]
	str	ip, [r3, #528]
	ldr	ip, [r8, #92]
	str	ip, [r3, #1412]
	blx	r9
	ldr	r3, [r7, r4, asl #2]
	add	r9, r8, #4
	ldr	r3, [r3, #276]
	mov	r0, r3
	str	r3, [fp, #-84]
	bl	MEM_Phy2Vir
	ldr	r2, [r8, #80]
	ldr	r1, [r8]
	mov	r3, #49152
	ldr	lr, [r7, r4, asl #2]
	cmp	r2, #1
	ldr	ip, [r8, #12]
	movt	r3, 63683
	str	r0, [fp, #-96]
	ldr	r0, [lr, #288]
	streq	r2, [fp, #-56]
	str	r3, [fp, #-76]
	str	r1, [fp, #-88]
	ldreq	r3, [r8, #88]
	ldreq	r1, [r8, #84]
	ldr	r2, [r8, #76]
	streq	r3, [fp, #-48]
	streq	r1, [fp, #-52]
	mov	r1, r9
	strb	ip, [fp, #-92]
	ldr	r3, [r6, #52]
	str	r0, [fp, #-80]
	sub	r0, fp, #72
	str	r2, [fp, #-60]
	mov	r2, #8
	str	r10, [fp, #-64]
	blx	r3
	sub	r1, fp, #96
	mov	r0, r4
	bl	SM_Config
	ldr	r3, [r6, #48]
	mov	r1, r10
	sub	r0, fp, #104
	mov	r2, #1
	blx	r3
	ldr	r3, [r8, #80]
	cmp	r3, #1
	beq	.L1652
.L1627:
	ldr	r3, [r7, r4, asl #2]
	mov	r1, r9
	mov	lr, #0
	mov	r2, #8
	ldr	ip, [r3, #244]
	ldr	r0, [r3, #260]
	ldr	r9, [r3, #240]
	str	ip, [r3, #1208]
	ldr	ip, [r3, #264]
	str	r0, [r3, #556]
	ldr	r0, [r3, #292]
	str	ip, [r3, #560]
	ldr	ip, [r3, #296]
	str	r0, [r3, #568]
	ldr	r0, [r3, #300]
	str	ip, [r3, #572]
	ldr	ip, [r3, #304]
	str	r9, [r3, #1204]
	str	r0, [r3, #576]
	add	r0, r3, #1072
	str	ip, [r3, #580]
	add	r0, r0, #12
	ldr	ip, [r8, #16]
	str	ip, [r3, #540]
	ldr	ip, [r8, #16]
	str	ip, [r3, #536]
	ldr	ip, [r8, #24]
	str	ip, [r3, #544]
	ldr	ip, [r8, #28]
	str	ip, [r3, #548]
	ldr	ip, [r8, #32]
	str	ip, [r3, #552]
	ldr	ip, [r8, #52]
	str	ip, [r3, #1212]
	ldr	ip, [r8, #68]
	sub	ip, ip, #1
	clz	ip, ip
	mov	ip, ip, lsr #5
	str	ip, [r3, #1228]
	ldr	ip, [r8, #72]
	str	ip, [r3, #1232]
	ldr	ip, [r8, #48]
	ldr	r6, [r6, #52]
	str	lr, [r3, #1444]
	str	ip, [r3, #1236]
	str	lr, [r3, #1456]
	blx	r6
	ldr	ip, [r7, r4, asl #2]
	ldr	r6, .L1653
	add	r3, ip, #229376
	ldr	r7, .L1653+8
	ldr	r9, [ip, #528]
	ldr	r2, [r3, #792]
	cmp	r2, r9
	beq	.L1628
	mov	r0, r4
	bl	VCTRL_ResetChan
	ldr	r3, [r8]
	ldr	ip, [r6, r4, asl #2]
	cmp	r3, #19
	beq	.L1629
	ldr	r9, [ip, #528]
	add	r3, ip, #229376
.L1628:
	ldr	r2, .L1653+12
	ldr	r0, .L1653+16
	ldr	r1, .L1653+20
	add	lr, r2, #64
	str	r9, [r3, #792]
.L1633:
	ldr	r3, [r2, #4]!
	add	r0, r0, #4
	add	r1, r1, #4
	cmp	r3, #0
	streq	r3, [r0, #-4]
	ldrne	ip, [r3, #24]
	strne	ip, [r0, #-4]
	ldrne	r3, [r3, #24]
	cmp	r2, lr
	str	r3, [r1, #-4]
	bne	.L1633
	ldr	r0, .L1653+16
	bl	VDMDRV_SetPriority
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1651:
	ldr	r2, .L1653+8
	mov	r5, r3
	ldr	r1, .L1653+24
	ldr	r3, [r2, #68]
	blx	r3
.L1610:
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1616:
	ldr	r3, .L1653+8
	mov	r0, #0
	ldr	r1, .L1653+28
	mvn	r5, #0
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1648:
	sub	r0, fp, #100
	bl	REAL8DEC_Support
	ldr	r3, [fp, #-100]
	cmp	r3, #0
	ldrne	r2, [r8]
	bne	.L1620
.L1623:
	mvn	r5, #0
	b	.L1610
.L1649:
	sub	r0, fp, #100
	bl	REAL9DEC_Support
	ldr	r3, [fp, #-100]
	cmp	r3, #0
	beq	.L1623
	ldr	r2, [r8]
	b	.L1622
.L1650:
	sub	r0, fp, #96
	bl	DIVX3DEC_Support
	ldr	r3, [fp, #-96]
	cmp	r3, #0
	bne	.L1634
	b	.L1623
.L1646:
	ldr	ip, .L1653+8
	mov	r0, r6
	ldr	r3, .L1653+32
	movw	r2, #2873
	ldr	r1, .L1653+36
	mvn	r5, #0
	ldr	r4, [ip, #68]
	blx	r4
	b	.L1610
.L1652:
	sub	r1, fp, #104
	mov	r0, r4
	strb	r3, [fp, #-104]
	bl	FSP_ConfigAttribute
	b	.L1627
.L1647:
	ldr	r3, .L1653+8
	mov	r0, r6
	ldr	r1, .L1653+40
	mvn	r5, #0
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1610
.L1629:
	ldr	r3, [ip, #280]
	mov	r0, r4
	ldr	r2, [ip, #1276]
	ldr	r1, [ip, #1272]
	ldr	ip, [ip, #284]
	str	ip, [sp]
	bl	VCTRL_PartitionMemForStdUser
	cmp	r0, #0
	bne	.L1630
	ldr	ip, [r6, r4, asl #2]
	add	r3, ip, #229376
	ldr	r9, [ip, #528]
	b	.L1628
.L1644:
	ldr	ip, .L1653+8
	mov	r0, r6
	ldr	r3, .L1653+44
	movw	r2, #2871
	ldr	r1, .L1653+36
	mvn	r5, #0
	ldr	r4, [ip, #68]
	blx	r4
	b	.L1610
.L1645:
	ldr	ip, .L1653+8
	mov	r0, r3
	movw	r2, #2872
	ldr	r3, .L1653+48
	ldr	r1, .L1653+36
	mvn	r5, #0
	ldr	r4, [ip, #68]
	blx	r4
	b	.L1610
.L1643:
	ldr	ip, .L1653+8
	mov	r0, r8
	ldr	r3, .L1653+52
	movw	r2, #2870
	ldr	r1, .L1653+36
	mvn	r5, #0
	ldr	r4, [ip, #68]
	blx	r4
	b	.L1610
.L1630:
	ldr	r3, [r7, #68]
	mov	r0, #1
	ldr	r1, .L1653+56
	mvn	r5, #0
	blx	r3
	b	.L1610
.L1654:
	.align	2
.L1653:
	.word	.LANCHOR0
	.word	.LANCHOR3
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0-4
	.word	.LANCHOR3+1024
	.word	g_ChanCtx
	.word	.LC147
	.word	.LC146
	.word	.LC13
	.word	.LC1
	.word	.LC145
	.word	.LC6
	.word	.LC2
	.word	.LC144
	.word	.LC148
	UNWIND(.fnend)
	.size	VCTRL_ConfigChan, .-VCTRL_ConfigChan
	.align	2
	.global	VCTRL_SetDbgOption
	.type	VCTRL_SetDbgOption, %function
VCTRL_SetDbgOption:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #116)
	sub	sp, sp, #116
	cmp	r1, #0
	beq	.L1734
	cmp	r0, #516
	ldr	r4, [r1]
	beq	.L1657
	bls	.L1758
	cmp	r0, #1280
	beq	.L1679
	bhi	.L1680
	movw	r3, #898
	cmp	r0, r3
	beq	.L1681
	bhi	.L1682
	movw	r3, #769
	cmp	r0, r3
	beq	.L1683
	bls	.L1759
	cmp	r0, #896
	beq	.L1686
	movw	r3, #897
	cmp	r0, r3
	bne	.L1734
	mov	r0, r4
	bl	VCTRL_ResetChan
	ldr	r3, .L1771
	ldr	r1, .L1771+4
	mov	r2, r4
.L1753:
	ldr	r4, [r3, #68]
	mov	r3, r0
	mov	r0, #32
	blx	r4
.L1756:
	mov	r0, #1
.L1656:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1680:
	movw	r3, #1537
	cmp	r0, r3
	beq	.L1693
	bhi	.L1694
	movw	r3, #1282
	cmp	r0, r3
	beq	.L1695
	bcc	.L1696
	movw	r3, #1283
	cmp	r0, r3
	beq	.L1697
	cmp	r0, #1536
	bne	.L1734
	cmp	r4, #15
	bhi	.L1752
	ldr	ip, .L1771+8
	mov	r5, #1
	ldr	r3, .L1771
	mov	r2, r4
	ldr	r1, .L1771+12
	mov	r0, #32
	ldr	ip, [ip, r4, asl #2]
	ldr	r3, [r3, #68]
	str	r5, [ip, #1232]
	blx	r3
	mov	r0, r5
	b	.L1656
.L1758:
	cmp	r0, #8
	beq	.L1756
	bls	.L1760
	movw	r3, #257
	cmp	r0, r3
	beq	.L1667
	bhi	.L1668
	cmp	r0, #12
	beq	.L1669
	bls	.L1761
	cmp	r0, #13
	beq	.L1672
	cmp	r0, #256
	bne	.L1734
	ldr	r3, .L1771
	mov	r0, #32
	ldr	r1, .L1771+16
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r4
	bl	DBG_PrintTracer
	b	.L1756
.L1682:
	cmp	r0, #1024
	beq	.L1688
	bls	.L1762
	movw	r3, #1025
	cmp	r0, r3
	beq	.L1691
	movw	r3, #1026
	cmp	r0, r3
	bne	.L1734
	ldr	ip, .L1771+20
	mov	r2, r4
	ldr	r3, .L1771
	mov	r0, #32
	ldr	r1, .L1771+24
	str	r4, [ip, #608]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1656
.L1668:
	movw	r3, #513
	cmp	r0, r3
	beq	.L1674
	bls	.L1763
	movw	r3, #514
	cmp	r0, r3
	beq	.L1677
	movw	r3, #515
	cmp	r0, r3
	bne	.L1734
	ldr	r7, .L1771
	mov	r0, r4
	ldr	r3, [r7, #188]
	blx	r3
	subs	r5, r0, #0
	beq	.L1764
	mov	r0, #16
	ldr	r6, [r7, #72]
	bl	VFMW_GetString
	str	r4, [sp]
	mov	r1, #50
	ldr	r3, .L1771+28
	mov	r2, r0
	sub	r0, fp, #148
	blx	r6
	sub	r0, fp, #148
	ldr	r3, [r7, #32]
	mov	r2, #0
	mov	r1, #66
	blx	r3
	subs	r4, r0, #0
	beq	.L1725
	mov	r2, r4
	ldr	r3, [r7, #44]
	mov	r1, #3145728
	mov	r0, r5
	blx	r3
	mov	r0, r4
	ldr	r3, [r7, #36]
	blx	r3
	ldr	r3, [r7, #68]
	sub	r2, fp, #148
	ldr	r1, .L1771+32
	mov	r0, #32
	blx	r3
	b	.L1756
.L1694:
	movw	r3, #1539
	cmp	r0, r3
	beq	.L1699
	bcc	.L1700
	movw	r3, #1540
	cmp	r0, r3
	beq	.L1701
	movw	r3, #1541
	cmp	r0, r3
	bne	.L1734
	ldr	r3, .L1771
	mov	r2, r4
	ldr	r1, .L1771+36
	mov	r0, #32
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1756
.L1760:
	cmp	r0, #3
	beq	.L1756
	bls	.L1765
	cmp	r0, #5
	beq	.L1664
	bcc	.L1665
	cmp	r0, #6
	beq	.L1756
	cmp	r0, #7
	bne	.L1734
	ldr	r6, .L1771
	mov	r5, r4, lsr #24
	bic	r4, r4, #-16777216
	mov	r2, #104
	mov	r1, #0
	sub	r0, fp, #148
	ldr	r3, [r6, #48]
	blx	r3
	mov	r3, r4
	mov	r2, r5
	ldr	r1, .L1771+40
	ldr	r6, [r6, #68]
	mov	r0, #32
	blx	r6
	sub	r1, fp, #148
	mov	r0, r5
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L1756
	sub	r1, fp, #148
	mov	r0, r5
	str	r4, [fp, #-128]
	bl	VCTRL_ConfigChan
	b	.L1756
.L1765:
	cmp	r0, #1
	beq	.L1756
	ldrls	r3, .L1771+44
	movls	r0, #1
	strls	r4, [r3]
	bls	.L1656
.L1766:
	ldr	r7, .L1771
	sub	r5, fp, #148
	mov	r6, r4, lsr #24
	bic	r4, r4, #-16777216
	mov	r2, #104
	mov	r1, #0
	ldr	r3, [r7, #48]
	mov	r0, r5
	blx	r3
	mov	r3, r4
	mov	r2, r6
	ldr	r1, .L1771+48
	ldr	r7, [r7, #68]
	mov	r0, #32
	blx	r7
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L1756
	mov	r1, r5
	mov	r0, r6
	str	r4, [fp, #-132]
	bl	VCTRL_ConfigChan
	b	.L1756
.L1697:
	ldr	ip, .L1771+52
	mov	r2, r4
	ldr	r3, .L1771
	mov	r0, #32
	ldr	r1, .L1771+56
	str	r4, [ip]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1656
.L1665:
	ldr	r7, .L1771
	sub	r5, fp, #148
	mov	r6, r4, lsr #24
	and	r4, r4, #3
	mov	r2, #104
	mov	r1, #0
	ldr	r3, [r7, #48]
	mov	r0, r5
	blx	r3
	mov	r3, r4
	mov	r2, r6
	ldr	r1, .L1771+60
	ldr	r7, [r7, #68]
	mov	r0, #32
	blx	r7
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L1756
	mov	r1, r5
	mov	r0, r6
	str	r4, [fp, #-120]
	bl	VCTRL_ConfigChan
	b	.L1756
.L1686:
	mov	r0, r4
	bl	VCTRL_StopChan
	ldr	r3, .L1771
	mov	r2, r4
	ldr	r1, .L1771+64
	b	.L1753
.L1677:
	cmp	r4, #15
	bhi	.L1756
	ldr	r6, .L1771+20
	add	r7, r6, r4, lsl #2
	ldr	r5, [r7, #1236]
	cmp	r5, #0
	beq	.L1767
	ldr	r5, .L1771
	mov	r0, #32
	ldr	r1, .L1771+68
	mov	r4, #0
	ldr	r3, [r5, #68]
	blx	r3
	ldr	r3, [r5, #36]
	ldr	r0, [r7, #1236]
	blx	r3
	ldr	r0, [r6, #1376]
	ldr	r3, .L1771+72
	mvn	r2, #0
	cmp	r0, r4
	str	r4, [r7, #1236]
	str	r4, [r6, #1384]
	str	r2, [r3, #68]
	str	r4, [r6, #1388]
	str	r4, [r6, #1392]
	str	r4, [r6, #1396]
	beq	.L1756
	ldr	r1, [r6, #1372]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [r6, #1380]
	ldr	r1, [r6, #1372]
	ldr	r0, [r6, #1376]
	bl	MEM_DelMemRecord
	ldr	r3, [r5, #48]
	mov	r1, r4
	mov	r2, #16
	ldr	r0, .L1771+76
	blx	r3
	mov	r0, #1
	b	.L1656
.L1701:
	mov	r2, r4, asl #6
	ldr	r3, .L1771+80
	sub	r4, r2, r4, asl #4
	mov	r0, #1
	add	r4, r3, r4
	mov	r2, #0
	ldr	r3, [r4, #40]
	str	r2, [r3, #80]
	b	.L1656
.L1672:
	cmp	r4, #16
	ldrhi	r3, .L1771
	movhi	r2, r4
	ldrls	ip, .L1771+20
	movhi	r0, #32
	ldrls	r3, .L1771
	movls	r2, r4
	ldrhi	r1, .L1771+84
	movls	r0, #32
	ldrls	r1, .L1771+88
	strls	r4, [ip, #1088]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1656
.L1691:
	ldr	ip, .L1771+20
	mov	r2, r4
	ldr	r3, .L1771
	mov	r0, #32
	ldr	r1, .L1771+92
	str	r4, [ip, #1400]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1656
.L1734:
	mvn	r0, #1
	b	.L1656
.L1762:
	movw	r3, #899
	cmp	r0, r3
	bne	.L1734
	mov	r0, r4
	ldr	r5, .L1771
	bl	VCTRL_StopChan
	mov	r2, r4
	ldr	r1, .L1771+64
	ldr	r6, [r5, #68]
	mov	r3, r0
	mov	r0, #32
	blx	r6
	mov	r0, r4
	bl	VCTRL_ResetChan
	mov	r2, r4
	ldr	r1, .L1771+4
	ldr	r6, [r5, #68]
	mov	r3, r0
	mov	r0, #32
	blx	r6
	mov	r0, r4
	bl	VCTRL_StartChan
	ldr	r5, [r5, #68]
	mov	r2, r4
	ldr	r1, .L1771+96
	mov	r3, r0
	mov	r0, #32
	blx	r5
	mov	r0, #1
	b	.L1656
.L1761:
	cmp	r0, #11
	bne	.L1734
	cmp	r4, #1
	ldrls	ip, .L1771+100
	movls	r2, r4
	ldrls	r3, .L1771
	movls	r0, #32
	ldrhi	r3, .L1771
	movhi	r2, r4
	strls	r4, [ip]
	movhi	r0, #32
	ldrls	r1, .L1771+104
	ldrhi	r1, .L1771+108
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1656
.L1759:
	cmp	r0, #768
	bne	.L1734
	bl	VCTRL_Suspend
	mov	r0, #1
	b	.L1656
.L1763:
	cmp	r0, #512
	bne	.L1734
	cmp	r4, #15
	bhi	.L1756
	ldr	r6, .L1771+20
	add	r5, r6, r4, lsl #2
	ldr	r7, [r5, #680]
	cmp	r7, #0
	beq	.L1768
	ldr	r4, .L1771
	mov	r0, #32
	ldr	r1, .L1771+112
	ldr	r3, [r4, #68]
	blx	r3
	ldr	r3, [r4, #36]
	ldr	r0, [r5, #680]
	blx	r3
	mov	r3, #0
	mov	r0, #1
	str	r3, [r5, #680]
	b	.L1656
.L1688:
	ldr	ip, .L1771+20
	mov	r2, r4
	ldr	r3, .L1771
	mov	r0, #32
	ldr	r1, .L1771+116
	str	r4, [ip, #604]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1656
.L1669:
	cmp	r4, #1
	ldrls	ip, .L1771+20
	movls	r2, r4
	ldrls	r3, .L1771
	movls	r0, #32
	ldrhi	r3, .L1771
	movhi	r2, r4
	ldrls	r1, .L1771+120
	movhi	r0, #32
	strls	r4, [ip, #676]
	ldrhi	r1, .L1771+124
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1656
.L1683:
	bl	VCTRL_Resume
	mov	r0, #1
	b	.L1656
.L1674:
	cmp	r4, #15
	bhi	.L1756
	ldr	r5, .L1771+20
	mov	r6, r4, asl #2
	add	r3, r5, r6
	ldr	r3, [r3, #1100]
	cmp	r3, #0
	beq	.L1769
	ldr	r4, .L1771
	add	r5, r5, r6
	ldr	r1, .L1771+128
	mov	r0, #32
	ldr	r3, [r4, #68]
	blx	r3
	ldr	r3, [r4, #36]
	ldr	r0, [r5, #1100]
	blx	r3
	mov	r3, #0
	mov	r0, #1
	str	r3, [r5, #1100]
	b	.L1656
.L1664:
	ldr	r6, .L1771
	mov	r5, r4, lsr #24
	and	r4, r4, #7
	mov	r2, #104
	mov	r1, #0
	sub	r0, fp, #148
	ldr	r3, [r6, #48]
	blx	r3
	mov	r3, r4
	mov	r2, r5
	ldr	r1, .L1771+132
	ldr	r7, [r6, #68]
	mov	r0, #32
	blx	r7
	sub	r1, fp, #148
	mov	r0, r5
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L1705
	sub	r1, fp, #148
	mov	r0, r5
	str	r4, [fp, #-124]
	bl	VCTRL_ConfigChan
	b	.L1756
.L1679:
	ldr	ip, .L1771+136
	mov	r2, r4
	ldr	r3, .L1771
	mov	r0, #32
	ldr	r1, .L1771+140
	str	r4, [ip]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1656
.L1700:
	ldr	ip, .L1771+144
	mov	r2, r4
	ldr	r3, .L1771
	mov	r0, #32
	ldr	r1, .L1771+12
	str	r4, [ip]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1656
.L1699:
	mov	r2, r4, asl #6
	ldr	r3, .L1771+80
	sub	r4, r2, r4, asl #4
	mov	r2, #1
	add	r4, r3, r4
	mov	r0, r2
	ldr	r3, [r4, #40]
	str	r2, [r3, #80]
	b	.L1656
.L1752:
	ldr	r3, .L1771
	mov	r0, #0
	ldr	r1, .L1771+148
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1756
.L1696:
	ldr	ip, .L1771+152
	mov	r2, r4
	ldr	r3, .L1771
	mov	r0, #32
	ldr	r1, .L1771+156
	str	r4, [ip]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1656
.L1695:
	ldr	ip, .L1771+160
	mov	r2, r4
	ldr	r3, .L1771
	mov	r0, #32
	ldr	r1, .L1771+164
	str	r4, [ip]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1656
.L1657:
	ldr	r6, .L1771
	mov	r0, r4
	ldmib	r1, {r7, r8}
	ldr	r3, [r6, #188]
	blx	r3
	subs	r9, r0, #0
	beq	.L1770
	mov	r0, #17
	ldr	r10, [r6, #72]
	bl	VFMW_GetString
	sub	r5, fp, #148
	str	r4, [sp]
	mov	r1, #50
	ldr	r3, .L1771+28
	mov	r2, r0
	mov	r0, r5
	blx	r10
	mov	r0, r5
	ldr	r3, [r6, #32]
	mov	r2, #0
	mov	r1, #66
	blx	r3
	subs	r4, r0, #0
	beq	.L1728
	ldr	r3, .L1771+168
	ldr	r10, [r3, #116]
	cmp	r10, #0
	beq	.L1729
	mov	ip, #1
	mov	r3, r8
	mov	r2, r7
	mov	r1, r9
	str	ip, [sp]
	blx	r10
.L1730:
	mov	r0, r4
	ldr	r3, [r6, #36]
	blx	r3
	ldr	r3, [r6, #68]
	mov	r2, r5
	ldr	r1, .L1771+172
	mov	r0, #32
	blx	r3
	b	.L1756
.L1681:
	mov	r0, r4
	bl	VCTRL_StartChan
	ldr	r3, .L1771
	mov	r2, r4
	ldr	r1, .L1771+96
	b	.L1753
.L1667:
	ldr	r5, .L1771+44
	mov	r0, r4
	mov	r1, #1
	mov	r3, #67108864
	ldr	r4, [r5]
	str	r3, [r5]
	bl	PrintScdRawState
	mov	r0, #1
	str	r4, [r5]
	b	.L1656
.L1693:
	cmp	r4, #15
	bhi	.L1752
	ldr	ip, .L1771+8
	mov	lr, #0
	ldr	r3, .L1771
	mov	r2, r4
	ldr	r1, .L1771+12
	mov	r0, #32
	ldr	ip, [ip, r4, asl #2]
	ldr	r3, [r3, #68]
	str	lr, [ip, #1232]
	blx	r3
	mov	r0, #1
	b	.L1656
.L1705:
	ldr	r3, [r6, #68]
	mov	r2, r5
	ldr	r1, .L1771+176
	mov	r0, #32
	blx	r3
	b	.L1756
.L1770:
	ldr	r3, [r6, #68]
	mov	r2, r4
	ldr	r1, .L1771+180
	mov	r0, #32
	blx	r3
	b	.L1756
.L1764:
	ldr	r3, [r7, #68]
	mov	r2, r4
	ldr	r1, .L1771+180
	mov	r0, #32
	blx	r3
	b	.L1756
.L1769:
	ldr	r7, .L1771
	mov	r0, #14
	add	r6, r5, r6
	ldr	r8, [r7, #72]
	bl	VFMW_GetString
	ldr	r2, [r5, #1228]
	mov	r1, #50
	ldr	r3, .L1771+28
	add	ip, r2, #1
	str	ip, [r5, #1228]
	str	r2, [sp]
	mov	r2, r0
	sub	r0, fp, #148
	blx	r8
	ldr	r3, [r7, #32]
	sub	r0, fp, #148
	mov	r2, #0
	mov	r1, #66
	blx	r3
	str	r4, [r5, #1232]
	cmp	r0, #0
	str	r0, [r6, #1100]
	beq	.L1717
	ldr	r5, [r7, #68]
	mov	r3, r4
	sub	r2, fp, #148
	ldr	r1, .L1771+184
	mov	r0, #32
	blx	r5
	b	.L1756
.L1768:
	ldr	r8, .L1771
	mov	r0, #13
	ldr	r9, [r8, #72]
	bl	VFMW_GetString
	ldr	r2, [r6, #1092]
	mov	r1, #50
	ldr	r3, .L1771+28
	add	ip, r2, #1
	str	ip, [r6, #1092]
	str	r2, [sp]
	mov	r2, r0
	sub	r0, fp, #148
	blx	r9
	mov	r2, r7
	ldr	r3, [r8, #32]
	sub	r0, fp, #148
	mov	r1, #66
	blx	r3
	str	r4, [r6, #1096]
	cmp	r0, #0
	str	r0, [r5, #680]
	beq	.L1713
	ldr	r5, [r8, #68]
	mov	r3, r4
	sub	r2, fp, #148
	ldr	r1, .L1771+188
	mov	r0, #32
	blx	r5
	b	.L1756
.L1725:
	ldr	r3, [r7, #68]
	sub	r2, fp, #148
	ldr	r1, .L1771+192
	mov	r0, #32
	blx	r3
	b	.L1756
.L1729:
	mov	r0, r10
	ldr	r3, [r6, #68]
	movw	r2, #7876
	ldr	r1, .L1771+196
	blx	r3
	b	.L1730
.L1767:
	ldr	r8, .L1771
	mov	r0, #15
	ldr	r9, .L1771+72
	ldr	r10, [r8, #72]
	bl	VFMW_GetString
	ldr	r2, [r6, #1364]
	add	r3, r9, #4
	mov	r1, #100
	add	ip, r2, #1
	str	ip, [r6, #1364]
	str	r2, [sp]
	mov	r2, r0
	sub	r0, fp, #148
	blx	r10
	ldr	r3, [r8, #32]
	sub	r0, fp, #148
	mov	r2, r5
	movw	r1, #578
	blx	r3
	cmp	r0, #0
	str	r0, [r7, #1236]
	beq	.L1720
	ldr	r3, [r8, #48]
	mov	r2, #16
	mov	r1, r5
	ldr	r0, .L1771+76
	blx	r3
	mov	r0, #19
	bl	VFMW_GetString
	str	r5, [sp]
	ldr	r3, .L1771+76
	mov	r2, #14155776
	mov	r1, r5
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	beq	.L1721
	ldr	r3, [r8, #68]
	mov	r0, #1
	ldr	r1, .L1771+200
	blx	r3
	ldr	r3, [r8, #36]
	ldr	r0, [r7, #1236]
	blx	r3
	mvn	r3, #0
	str	r5, [r7, #1236]
	str	r5, [r6, #1384]
	str	r5, [r6, #1388]
	str	r5, [r6, #1392]
	str	r5, [r6, #1396]
	str	r3, [r9, #68]
	b	.L1756
.L1728:
	ldr	r3, [r6, #68]
	mov	r2, r5
	ldr	r1, .L1771+192
	mov	r0, #32
	blx	r3
	b	.L1756
.L1721:
	ldr	r2, [r6, #1380]
	ldr	r1, [r6, #1372]
	ldr	r0, [r6, #1376]
	bl	MEM_AddMemRecord
	ldr	r3, [r6, #1372]
	mov	r0, r4, lsr #24
	ldr	r5, [r8, #68]
	add	ip, r3, #9437184
	add	r1, r3, #11796480
	str	r3, [r6, #1392]
	and	r4, r4, #3
	str	r1, [r6, #1384]
	mov	r3, r0
	str	r0, [r9, #68]
	sub	r2, fp, #148
	str	ip, [r6, #1388]
	mov	r0, #32
	str	r4, [r6, #1396]
	ldr	r1, .L1771+204
	str	r4, [sp]
	blx	r5
	b	.L1756
.L1717:
	ldr	r3, [r7, #68]
	sub	r2, fp, #148
	ldr	r1, .L1771+208
	mov	r0, #32
	blx	r3
	b	.L1756
.L1713:
	ldr	r3, [r8, #68]
	sub	r2, fp, #148
	ldr	r1, .L1771+212
	mov	r0, #32
	blx	r3
	b	.L1756
.L1720:
	ldr	r3, [r8, #68]
	sub	r2, fp, #148
	ldr	r1, .L1771+216
	mov	r0, #32
	blx	r3
	b	.L1756
.L1772:
	.align	2
.L1771:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC176
	.word	.LANCHOR0
	.word	.LC186
	.word	.LC160
	.word	.LANCHOR3
	.word	.LC180
	.word	.LANCHOR2+4
	.word	.LC172
	.word	.LC187
	.word	.LC153
	.word	g_PrintEnable
	.word	.LC149
	.word	g_TraceImgPeriod
	.word	.LC184
	.word	.LC150
	.word	.LC175
	.word	.LC170
	.word	.LANCHOR2
	.word	.LANCHOR3+1368
	.word	s_SmIIS
	.word	.LC158
	.word	.LC159
	.word	.LC179
	.word	.LC177
	.word	USE_FF_APT_EN
	.word	.LC154
	.word	.LC155
	.word	.LC163
	.word	.LC178
	.word	.LC156
	.word	.LC157
	.word	.LC166
	.word	.LC151
	.word	g_TraceCtrl
	.word	.LC181
	.word	g_TunnelLineNumber
	.word	.LC185
	.word	g_TraceBsPeriod
	.word	.LC182
	.word	g_TraceFramePeriod
	.word	.LC183
	.word	g_vdm_hal_fun_ptr
	.word	.LC174
	.word	.LC152
	.word	.LC171
	.word	.LC164
	.word	.LC161
	.word	.LC173
	.word	.LC8
	.word	.LC167
	.word	.LC168
	.word	.LC165
	.word	.LC162
	.word	.LC169
	UNWIND(.fnend)
	.size	VCTRL_SetDbgOption, .-VCTRL_SetDbgOption
	.align	2
	.global	VCTRL_ResetChanWithOption
	.type	VCTRL_ResetChanWithOption, %function
VCTRL_ResetChanWithOption:
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
	subs	r7, r1, #0
	mov	r4, r0
	beq	.L1800
	cmp	r0, #15
	bhi	.L1801
	ldr	r6, .L1807
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L1802
	ldr	r2, [r7]
	cmp	r2, #1
	bhi	.L1803
	ldr	r9, [r3, #16]
	bl	VCTRL_StopChan
	ldr	r8, .L1807+4
	mov	r5, #0
	ldr	r3, [r6, r4, asl #2]
	mov	r2, #300
	ldr	r0, .L1807+8
	mov	r1, r5
	ldr	r10, [r8, #48]
	str	r5, [r3, #328]
	str	r5, [r3, #332]
	mla	r0, r2, r4, r0
	blx	r10
	mov	r1, r5
	mov	r0, r4
	bl	VCTRL_SetSendStreamAgainFlag
	ldr	r2, [r7, #4]
	ldr	r3, [r6, r4, asl #2]
	mov	r0, r4
	str	r2, [r3, #1224]
	bl	InitSyntaxCtx
	ldr	r3, [r6, r4, asl #2]
	add	r1, r3, #229376
	ldr	r0, [r3, #528]
	add	r1, r1, #800
	bl	ReleaseCurPic
	ldr	r0, [r6, r4, asl #2]
	ldr	r3, [r8, #48]
	mov	r1, r5
	mov	r2, #416
	add	r0, r0, #664
	blx	r3
	ldr	r3, [r6, r4, asl #2]
	mvn	r0, #0
	mvn	r1, #0
	add	r2, r3, #592
	strd	r0, [r2, #-8]
	strd	r0, [r2]
	mov	r0, r4
	ldr	r2, [r3, #1404]
	str	r5, [r3, #1080]
	cmp	r2, #1
	streq	r5, [r3, #1444]
	ldr	r3, [r3, #528]
	cmp	r3, #19
	beq	.L1780
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L1804
.L1780:
	bl	FSP_EmptyInstance
.L1781:
	mov	r0, r4
	bl	InitUsdPool
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L1805
.L1782:
	ldr	r3, .L1807+12
	ldr	r2, [r3, #676]
	cmp	r2, #0
	beq	.L1783
	add	r5, r3, r4, lsl #2
	str	r4, [fp, #-48]
	ldr	r3, [r5, #680]
	cmp	r3, #0
	beq	.L1785
	mov	r0, #512
	sub	r1, fp, #48
	bl	VCTRL_SetDbgOption
	ldr	r3, [r5, #680]
	cmp	r3, #0
	beq	.L1785
	sub	r1, fp, #48
	mov	r0, #512
	bl	VCTRL_SetDbgOption
.L1785:
	ldr	r3, [r8, #68]
	mov	r0, #32
	ldr	r1, .L1807+16
	blx	r3
.L1783:
	cmp	r9, #0
	bne	.L1806
.L1787:
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	mov	r0, #0
.L1775:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1805:
	mov	r0, r4
	bl	SM_Reset
	b	.L1782
.L1806:
	mov	r0, r4
	bl	VCTRL_StartChan
	b	.L1787
.L1804:
	bl	FSP_ResetInstance
	b	.L1781
.L1803:
	ldr	r3, .L1807+4
	movw	r2, #3508
	ldr	r1, .L1807+20
	mov	r0, #0
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1775
.L1801:
	ldr	ip, .L1807+4
	movw	r2, #3503
	ldr	r3, .L1807+24
	mov	r0, #0
	ldr	r1, .L1807+28
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1775
.L1800:
	ldr	ip, .L1807+4
	mov	r0, r7
	ldr	r3, .L1807+32
	movw	r2, #3502
	ldr	r1, .L1807+28
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1775
.L1802:
	ldr	ip, .L1807+4
	mov	r0, r3
	mov	r2, #3504
	ldr	r3, .L1807+36
	ldr	r1, .L1807+28
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1775
.L1808:
	.align	2
.L1807:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+3988
	.word	.LANCHOR3
	.word	.LC127
	.word	.LC189
	.word	.LC6
	.word	.LC1
	.word	.LC188
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_ResetChanWithOption, .-VCTRL_ResetChanWithOption
	.align	2
	.global	VCTRL_DestroyChanWithOption
	.type	VCTRL_DestroyChanWithOption, %function
VCTRL_DestroyChanWithOption:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #96)
	sub	sp, sp, #96
	ldr	r5, .L1820
	mov	r4, r0
	mov	r0, #0
	ldr	r3, [r5, #12]
	blx	r3
	cmp	r4, #15
	bhi	.L1816
	ldr	r7, .L1820+4
	ldr	r6, [r7, r4, asl #2]
	cmp	r6, #0
	beq	.L1817
	ldr	r3, [r6, #12]
	cmp	r3, #1
	bne	.L1818
	ldr	r2, .L1820+8
	mov	r8, #0
	ldr	r3, [r5, #12]
	mov	r0, #4
	str	r8, [r2, r4, asl #2]
	blx	r3
	mov	r0, r4
	bl	VCTRL_StopChan
	subs	r6, r0, #0
	bne	.L1819
	mov	r0, r4
	bl	SCDDRV_ResetSCD
	ldr	r3, [r5, #16]
	mov	r0, #4
	blx	r3
	mov	r0, r4
	bl	VCTRL_ResetChan
	bl	VDMDRV_ParamInit
	add	r2, r7, r4, lsl #2
	ldr	r3, [r5, #12]
	mov	r0, #4
	str	r6, [r2, #3732]
	blx	r3
	mov	r0, r4
	bl	FSP_DisableInstance
	mov	r0, r4
	bl	CloseUsdPool_WithMem
	ldr	r3, [r7, r4, asl #2]
	ldr	r8, [r5, #52]
	mov	r2, #16
	add	r1, r3, #232
	add	r0, r3, #228352
	ldr	lr, [r3, #248]
	add	r0, r0, #248
	ldr	ip, [r3, #252]
	ldr	r9, [r3, #256]
	ldr	r3, [r3, #1404]
	str	lr, [fp, #-68]
	str	ip, [fp, #-64]
	str	r0, [fp, #-40]
	sub	r0, fp, #100
	str	r9, [fp, #-60]
	str	r3, [fp, #-44]
	blx	r8
	ldr	r1, [r7, r4, asl #2]
	ldr	r3, [r5, #52]
	mov	r2, #16
	add	r1, r1, #200
	sub	r0, fp, #132
	blx	r3
	ldr	r1, [r7, r4, asl #2]
	ldr	r3, [r5, #52]
	mov	r2, #16
	add	r1, r1, #216
	sub	r0, fp, #116
	blx	r3
	ldr	r8, .L1820+12
	mov	r3, r4, asl #6
	mov	r2, #16
	sub	r3, r3, r4, asl #4
	ldr	r9, [r5, #52]
	add	r8, r3, r8
	sub	r0, fp, #84
	mov	r1, r8
	blx	r9
	ldr	r1, [r7, r4, asl #2]
	mov	r2, #12
	ldr	r3, [r5, #52]
	add	r1, r1, #152
	sub	r0, fp, #56
	blx	r3
	ldr	r3, .L1820+16
	mov	r0, r4
	str	r6, [r8, #40]
	str	r6, [r7, r4, asl #2]
	str	r6, [r3, r4, asl #2]
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r4
	bl	VDMDRV_ResetVDH
	ldr	r3, [r5, #16]
	mov	r0, #4
	blx	r3
	bl	VCTRL_EnableAllInt
	ldr	r3, [r5, #16]
	mov	r0, r6
	blx	r3
	sub	r1, fp, #132
	mov	r0, r4
	bl	VCTRL_FreeChanResource
	mov	r0, r6
.L1811:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1818:
	ldr	r4, [r5, #68]
	movw	r2, #2466
	ldr	r3, .L1820+20
.L1815:
	ldr	r1, .L1820+24
	mov	r0, #0
	blx	r4
	bl	VCTRL_EnableAllInt
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1819:
	ldr	r3, [r5, #16]
	mov	r0, #4
	blx	r3
	ldr	r3, [r5, #16]
	mov	r0, r8
	blx	r3
	mvn	r0, #0
	b	.L1811
.L1816:
	ldr	r4, [r5, #68]
	movw	r2, #2440
	ldr	r3, .L1820+28
	b	.L1815
.L1817:
	movw	r2, #2451
	ldr	r3, .L1820+32
	ldr	r1, .L1820+24
	mov	r0, r6
	ldr	r4, [r5, #68]
	blx	r4
	bl	VCTRL_EnableAllInt
	ldr	r3, [r5, #16]
	mov	r0, r6
	blx	r3
	mvn	r0, #0
	b	.L1811
.L1821:
	.align	2
.L1820:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	g_LowDelaySeqIndex
	.word	s_SmIIS
	.word	s_pFspInst
	.word	.LC192
	.word	.LC190
	.word	.LC6
	.word	.LC191
	UNWIND(.fnend)
	.size	VCTRL_DestroyChanWithOption, .-VCTRL_DestroyChanWithOption
	.align	2
	.global	VCTRL_DestroyChan
	.type	VCTRL_DestroyChan, %function
VCTRL_DestroyChan:
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
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_DestroyChanWithOption
	UNWIND(.fnend)
	.size	VCTRL_DestroyChan, .-VCTRL_DestroyChan
	.align	2
	.global	VCTRL_CloseVfmw
	.type	VCTRL_CloseVfmw, %function
VCTRL_CloseVfmw:
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
	ldr	r6, .L1841
	ldr	r3, [r6, #64]
	cmp	r3, #1
	bne	.L1830
	sub	r5, r6, #4
	mov	r4, #0
.L1826:
	ldr	r3, [r5, #4]!
	mov	r0, r4
	add	r4, r4, #1
	cmp	r3, #0
	beq	.L1825
	bl	VCTRL_DestroyChanWithOption
.L1825:
	cmp	r4, #16
	bne	.L1826
	bl	FSP_Exit
	ldr	r3, [r6, #68]
	mov	r2, #3
	ldr	r5, .L1841+4
	cmp	r3, #0
	str	r2, [r6, #72]
	beq	.L1828
	mov	r0, #10
	ldr	r3, [r5, #124]
	mov	r4, #49
	blx	r3
	b	.L1829
.L1840:
	ldr	r3, [r5, #124]
	blx	r3
	subs	r4, r4, #1
	beq	.L1828
.L1829:
	ldr	r3, [r6, #68]
	mov	r0, #10
	cmp	r3, #0
	bne	.L1840
.L1828:
	ldr	r3, [r5, #48]
	mov	r2, #64
	mov	r1, #0
	ldr	r0, .L1841+8
	blx	r3
	ldr	r0, .L1841+12
	bl	CloseDrivers
	bl	DBG_DestroyTracer
	mov	r3, #0
	mov	r0, r3
	str	r3, [r6, #64]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1830:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1842:
	.align	2
.L1841:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+3732
	.word	.LANCHOR0+88
	UNWIND(.fnend)
	.size	VCTRL_CloseVfmw, .-VCTRL_CloseVfmw
	.align	2
	.global	VCTRL_LoadDspCode
	.type	VCTRL_LoadDspCode, %function
VCTRL_LoadDspCode:
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
	cmp	r0, #15
	mov	r6, r0
	bhi	.L1885
	ldr	r8, .L1892
	ldr	r0, [r8, r0, asl #2]
	cmp	r0, #0
	beq	.L1886
	ldr	r3, [r0, #528]
	cmp	r3, #0
	beq	.L1887
	ldr	r5, [r8, #3732]
	cmp	r5, #0
	bne	.L1870
	mov	r2, r5
	mov	r7, r5
.L1866:
	ldr	r1, .L1892+4
	add	r0, r1, #60
.L1852:
	ldr	r5, [r1, #4]!
	cmp	r5, #0
	bne	.L1848
	cmp	r1, r0
	bne	.L1852
.L1859:
	ldr	r4, .L1892+8
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L1888
	mov	r0, #0
	blx	r3
.L1854:
	ldr	r3, [r4, #8]
	cmp	r3, #0
	beq	.L1889
	mov	r0, #0
	blx	r3
.L1856:
	clz	r5, r5
	mov	r5, r5, lsr #5
	ands	r1, r5, r7
	beq	.L1890
	ldr	r3, [r8, r6, asl #2]
	add	r6, r8, r6, lsl #2
	mov	r1, #0
	ldr	r0, [r3, #528]
	bl	WriteHexFile
	mov	r3, #1
	str	r3, [r6, #3732]
.L1860:
	ldr	r1, .L1892+12
	mov	r0, #0
	add	lr, r1, #64
.L1863:
	ldr	r2, [r1, #4]!
	mov	r3, #0
	cmp	r2, r3
	beq	.L1861
	ldr	ip, [r2, #528]
	cmp	ip, r3
	ldreq	r2, [r2, #1236]
	subeq	r3, r2, #1
	clzeq	r3, r3
	moveq	r3, r3, lsr #5
	cmp	ip, #6
	orreq	r3, r3, #1
	cmp	r3, #0
	movne	r0, #1
.L1861:
	cmp	r1, lr
	bne	.L1863
	cmp	r0, #0
	bne	.L1864
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L1891
	blx	r3
.L1864:
	bl	VCTRL_CloseHardware
	mov	r0, #0
.L1882:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1887:
	ldr	r2, [r0, #1236]
	ldr	r5, [r8, #3732]
	sub	r7, r2, #1
	clz	r7, r7
	cmp	r5, #0
	mov	r7, r7, lsr #5
	beq	.L1866
.L1848:
	cmp	r5, #2
	movne	r1, #0
	andeq	r1, r7, #1
	cmp	r1, #0
	bne	.L1850
.L1851:
	cmp	r5, #1
	cmpeq	r3, #6
	bne	.L1859
.L1850:
	ldr	ip, .L1892+16
	mov	r0, #0
	str	r5, [sp]
	ldr	r1, .L1892+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1882
.L1890:
	ldr	r3, [r8, r6, asl #2]
	ldr	r7, .L1892
	ldr	r0, [r3, #528]
	cmp	r0, #6
	movne	r5, #0
	andeq	r5, r5, #1
	cmp	r5, #0
	beq	.L1860
	add	r6, r7, r6, lsl #2
	bl	WriteHexFile
	mov	r3, #2
	str	r3, [r6, #3732]
	b	.L1860
.L1889:
	ldr	ip, .L1892+16
	mov	r0, r3
	movw	r2, #3372
	ldr	r1, .L1892+24
	ldr	r3, [ip, #68]
	blx	r3
	b	.L1856
.L1888:
	ldr	ip, .L1892+16
	mov	r0, r3
	movw	r2, #3371
	ldr	r1, .L1892+24
	ldr	r3, [ip, #68]
	blx	r3
	b	.L1854
.L1891:
	ldr	r3, .L1892+16
	movw	r2, #3425
	ldr	r1, .L1892+24
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1864
.L1870:
	mov	r2, #0
	mov	r7, r2
	b	.L1851
.L1885:
	ldr	ip, .L1892+16
	movw	r2, #3199
	ldr	r3, .L1892+28
	mov	r0, #0
	ldr	r1, .L1892+32
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1882
.L1886:
	ldr	ip, .L1892+16
	mov	r2, #3200
	ldr	r3, .L1892+36
	ldr	r1, .L1892+32
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1882
.L1893:
	.align	2
.L1892:
	.word	.LANCHOR0
	.word	.LANCHOR0+3732
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR0-4
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC193
	.word	.LC8
	.word	.LC6
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_LoadDspCode, .-VCTRL_LoadDspCode
	.align	2
	.global	VCTRL_SetChanFsPartitionState
	.type	VCTRL_SetChanFsPartitionState, %function
VCTRL_SetChanFsPartitionState:
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
	cmp	r0, #15
	bhi	.L1898
	ldr	r3, .L1899
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	addne	r0, r0, #225280
	strne	r1, [r0, #3272]
	ldmnefd	sp, {fp, sp, pc}
	ldr	ip, .L1899+4
	movw	r2, #8480
	ldr	r3, .L1899+8
	b	.L1897
.L1898:
	ldr	ip, .L1899+4
	movw	r2, #8479
	ldr	r3, .L1899+12
	mov	r0, #0
.L1897:
	ldr	r1, .L1899+16
	ldr	ip, [ip, #68]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	ip
.L1900:
	.align	2
.L1899:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC2
	.word	.LC6
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_SetChanFsPartitionState, .-VCTRL_SetChanFsPartitionState
	.align	2
	.global	VCTRL_GetCurChanFsSize
	.type	VCTRL_GetCurChanFsSize, %function
VCTRL_GetCurChanFsSize:
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
	cmp	r0, #15
	bhi	.L1905
	ldr	r3, .L1907
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L1906
	add	r0, r0, #225280
	ldr	r0, [r0, #3288]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1905:
	ldr	ip, .L1907+4
	movw	r2, #8487
	ldr	r3, .L1907+8
	mov	r0, #0
	ldr	r1, .L1907+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1906:
	ldr	ip, .L1907+4
	movw	r2, #8488
	ldr	r3, .L1907+16
	ldr	r1, .L1907+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1908:
	.align	2
.L1907:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_GetCurChanFsSize, .-VCTRL_GetCurChanFsSize
	.align	2
	.global	VCTRT_SetChanCtrlState
	.type	VCTRT_SetChanCtrlState, %function
VCTRT_SetChanCtrlState:
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
	cmp	r0, #15
	mov	r6, r0
	mov	r4, r1
	bhi	.L1922
	ldr	r5, .L1924
	mov	r0, #0
	ldr	r3, [r5, #12]
	blx	r3
	cmp	r4, #1
	beq	.L1913
	bcc	.L1914
	cmp	r4, #2
	bne	.L1923
	ldr	r3, .L1924+4
	add	r6, r3, r6, lsl #2
	ldr	r3, [r6, #812]
	cmp	r3, #1
	beq	.L1918
.L1920:
	str	r4, [r6, #812]
	mov	r4, #0
	b	.L1912
.L1914:
	ldr	r3, .L1924+4
	mov	r2, #0
	mov	r4, r2
	add	r6, r3, r6, lsl #2
	str	r2, [r6, #812]
.L1912:
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1923:
	mov	r4, #0
	b	.L1912
.L1913:
	ldr	r3, .L1924+4
	add	r6, r3, r6, lsl #2
	ldr	r0, [r6, #812]
	cmp	r0, #0
	beq	.L1920
.L1918:
	mvn	r4, #0
	b	.L1912
.L1922:
	ldr	ip, .L1924
	movw	r2, #8497
	ldr	r3, .L1924+8
	mov	r0, #0
	ldr	r1, .L1924+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1925:
	.align	2
.L1924:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3
	.word	.LC6
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRT_SetChanCtrlState, .-VCTRT_SetChanCtrlState
	.global	__aeabi_idiv
	.align	2
	.global	VCTRL_RequestChanMem
	.type	VCTRL_RequestChanMem, %function
VCTRL_RequestChanMem:
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
	cmp	r0, #15
	mov	r4, r0
	bhi	.L1940
	ldr	r6, .L1945
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L1941
	add	ip, r3, #225280
	ldr	r2, [r3, #264]
	ldr	r1, [ip, #3288]
	ldr	r7, [ip, #3296]
	cmp	r1, #0
	ble	.L1942
	ldr	r3, [r3, #260]
	cmp	r3, #0
	cmpne	r2, #0
	ble	.L1931
	mov	r0, r2
	bl	__aeabi_idiv
	cmp	r7, r0
	mov	r9, r0
	ble	.L1932
	rsb	r8, r0, r7
	cmp	r8, #0
	ble	.L1932
	mov	r1, r0
	mov	r0, r4
	bl	VCTRL_AllocMemPre
	ldr	r7, .L1945+4
	ldr	r10, [r6, r4, asl #2]
	ldr	r3, [r7]
	add	r10, r10, #229376
	mov	r5, r0
	blx	r3
	ldr	r3, [r6, r4, asl #2]
	cmp	r5, #0
	add	r3, r3, #225280
	str	r0, [r10, #688]
	str	r9, [r3, #3300]
	bne	.L1933
	ldr	r3, [r3, #3308]
	cmp	r3, #1
	bne	.L1934
	mov	r1, r8
	mov	r0, r4
	bl	VCTRL_AllocMemMMZ
	subs	r5, r0, #0
	bne	.L1943
	ldr	r3, [r7]
	ldr	r7, [r6, r4, asl #2]
	blx	r3
	ldr	r2, [r6, r4, asl #2]
	mov	r3, r5
	add	r7, r7, #229376
	add	r2, r2, #225280
	str	r0, [r7, #692]
	mov	r0, r3
	str	r8, [r2, #3304]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1931:
	ldr	r3, [ip, #3308]
	cmp	r3, #1
	bne	.L1936
	mov	r1, r7
	ldr	r8, .L1945+4
	bl	VCTRL_AllocMemMMZ
	ldr	r9, [r6, r4, asl #2]
	ldr	r3, [r8]
	add	r9, r9, #229376
	mov	r5, r0
	blx	r3
	ldr	r3, [r6, r4, asl #2]
	cmp	r5, #0
	add	r3, r3, #225280
	str	r0, [r9, #692]
	str	r7, [r3, #3304]
	bne	.L1944
.L1938:
	mov	r3, r5
.L1928:
	mov	r0, r3
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1932:
	mov	r1, r7
	mov	r0, r4
	bl	VCTRL_AllocMemPre
	ldr	r8, .L1945+4
	ldr	r9, [r6, r4, asl #2]
	ldr	r3, [r8]
	add	r9, r9, #229376
	mov	r5, r0
	blx	r3
	ldr	r3, [r6, r4, asl #2]
	cmp	r5, #0
	add	r3, r3, #225280
	str	r0, [r9, #688]
	str	r7, [r3, #3300]
	beq	.L1938
	ldr	r4, [r8, #68]
	movw	r3, #8740
	b	.L1939
.L1944:
	ldr	r4, [r8, #68]
	movw	r3, #8757
	ldr	r2, .L1945+8
	mov	r0, #31
	ldr	r1, .L1945+12
	blx	r4
	mov	r3, r5
	mov	r0, r3
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1933:
	ldr	r4, [r7, #68]
	movw	r3, #8726
.L1939:
	ldr	r2, .L1945+8
	mov	r0, #31
	ldr	r1, .L1945+16
	blx	r4
	mov	r3, r5
	mov	r0, r3
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1936:
	ldr	ip, .L1945+4
	mov	r0, #31
	ldr	r2, .L1945+8
	ldr	r1, .L1945+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r3, #0
	b	.L1928
.L1934:
	ldr	r4, [r7, #68]
	mov	r0, #31
	ldr	r2, .L1945+8
	ldr	r1, .L1945+24
	blx	r4
	mvn	r3, #0
	b	.L1928
.L1940:
	ldr	ip, .L1945+4
	movw	r2, #8673
	ldr	r3, .L1945+28
	mov	r0, #0
	ldr	r1, .L1945+32
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r3, #0
	b	.L1928
.L1943:
	movw	r3, #8709
	ldr	r4, [r7, #68]
	ldr	r2, .L1945+8
	mov	r0, #31
	ldr	r1, .L1945+12
	blx	r4
	mvn	r3, #0
	b	.L1928
.L1942:
	ldr	r3, .L1945+4
	mov	r2, r1
	mov	r0, #31
	ldr	r1, .L1945+36
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r3, #0
	b	.L1928
.L1941:
	ldr	ip, .L1945+4
	mov	r0, r3
	movw	r2, #8674
	ldr	r3, .L1945+40
	ldr	r1, .L1945+32
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r3, #0
	b	.L1928
.L1946:
	.align	2
.L1945:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+212
	.word	.LC195
	.word	.LC197
	.word	.LC198
	.word	.LC196
	.word	.LC6
	.word	.LC1
	.word	.LC194
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_RequestChanMem, .-VCTRL_RequestChanMem
	.align	2
	.global	VCTRL_SetFsParamToChan
	.type	VCTRL_SetFsParamToChan, %function
VCTRL_SetFsParamToChan:
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
	cmp	r0, #15
	bhi	.L1951
	ldr	r3, .L1953
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L1952
	ldr	r2, [r1, #8]
	add	r3, r0, #225280
	str	r2, [r0, #264]
	ldr	r2, [r1]
	str	r2, [r0, #260]
	ldr	r2, [r1]
	str	r2, [r0, #208]
	ldr	r2, [r1, #4]
	str	r2, [r0, #204]
	ldr	r2, [r1, #8]
	str	r2, [r0, #212]
	ldr	r2, [r1, #12]
	str	r2, [r3, #3296]
	ldr	r2, [r1, #16]
	str	r2, [r3, #3308]
	ldmfd	sp, {fp, sp, pc}
.L1951:
	ldr	ip, .L1953+4
	movw	r2, #8772
	ldr	r3, .L1953+8
	mov	r0, #0
.L1950:
	ldr	r1, .L1953+12
	ldr	ip, [ip, #68]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	ip
.L1952:
	ldr	ip, .L1953+4
	movw	r2, #8773
	ldr	r3, .L1953+16
	b	.L1950
.L1954:
	.align	2
.L1953:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_SetFsParamToChan, .-VCTRL_SetFsParamToChan
	.align	2
	.global	VCTRL_SetPMVBufToChan
	.type	VCTRL_SetPMVBufToChan, %function
VCTRL_SetPMVBufToChan:
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
	ldr	r3, .L1956
	ldr	r2, [r1, #4]
	ldr	r3, [r3, r0, asl #2]
	mov	r0, #0
	add	r3, r3, #229376
	str	r2, [r3, #780]
	ldr	r2, [r1]
	str	r2, [r3, #776]
	ldr	r2, [r1, #8]
	str	r2, [r3, #784]
	ldmfd	sp, {fp, sp, pc}
.L1957:
	.align	2
.L1956:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_SetPMVBufToChan, .-VCTRL_SetPMVBufToChan
	.align	2
	.global	VCTRL_SetSingleFrameBufToChan
	.type	VCTRL_SetSingleFrameBufToChan, %function
VCTRL_SetSingleFrameBufToChan:
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
	subs	r10, r1, #0
	mov	r3, r0
	beq	.L1976
	cmp	r0, #15
	bhi	.L1977
	ldr	r9, .L1981
	ldr	r8, [r9, r0, asl #2]
	cmp	r8, #0
	beq	.L1978
	ldr	r2, [r10, #16]
	add	r4, r8, #229376
	add	r6, r8, #225280
	ldr	ip, .L1981+4
	cmp	r2, #32
	ldr	r7, .L1981+8
	str	r2, [r6, #3296]
	mov	r0, #8
	movge	r2, #32
	str	r2, [r4, #284]
	ldr	r2, [r4, #676]
	ldr	r5, [ip, r3, asl #2]
	str	r3, [fp, #-48]
	ldr	r3, [r7, #12]
	str	r2, [fp, #-52]
	blx	r3
	ldr	r3, [fp, #-48]
	ldr	r0, [r9, r3, asl #2]
	add	ip, r0, #229376
	ldr	r2, [ip, #712]
	cmp	r2, #0
	beq	.L1979
	ldrsb	r2, [r5, #1]
	cmp	r2, #0
	beq	.L1965
	ldrsb	r2, [r5, #40]
	ldr	r0, [r4, #284]
	add	r2, r2, #4
	cmp	r2, r0
	movge	r2, r0
	strb	r2, [r5, #10]
.L1966:
	mov	r2, #0
	strb	r2, [r5, #11]
	ldr	r2, [r4, #664]
	strb	r2, [r5, #13]
	ldr	r1, [r9, r3, asl #2]
	add	r2, r1, #229376
	ldr	r0, [r2, #708]
	cmp	r0, #31
	bhi	.L1971
	add	r3, r1, #225280
	ldr	r3, [r3, #3296]
	cmp	r0, r3
	bcs	.L1971
	mov	r3, r0, asl #4
	add	r3, r3, r0, lsl #2
	add	r3, r1, r3
	add	r3, r3, #228352
	ldrb	r1, [r3, #264]	@ zero_extendqisi2
	cmp	r1, #255
	bne	.L1971
	ldr	r1, [r10, #4]
	add	r0, r0, #1
	str	r1, [r3, #256]
	ldr	r1, [r10]
	str	r1, [r3, #252]
	ldr	r1, [r10, #8]
	str	r1, [r3, #260]
	ldr	r1, [r10, #12]
	strb	r1, [r3, #264]
	str	r0, [r2, #708]
	ldr	r1, [r4, #668]
	ldr	r3, [r4, #284]
	cmp	r1, r3
	bcs	.L1971
	add	r8, r8, r1, lsl #3
	add	r8, r8, #225280
	ldr	r3, [r8, #3972]
	cmp	r3, #0
	bne	.L1971
	ldr	r3, [r10, #4]
	add	ip, r1, #66
	ldr	lr, [fp, #-52]
	add	r0, r1, #1
	add	r3, r3, #1020
	add	ip, r6, ip, lsl #2
	add	r3, r3, #3
	mov	r1, #1
	bic	r3, r3, #1020
	str	r1, [r8, #3972]
	bic	r3, r3, #3
	str	r3, [r8, #3968]
	add	r9, r3, lr
	str	r9, [ip, #3960]
	ldr	ip, [r4, #672]
	ldr	r3, [r4, #664]
	str	r0, [r4, #668]
	cmp	ip, r3
	bcc	.L1980
.L1970:
	add	r3, r5, #20480
	ldrsb	r2, [r5, #10]
	ldr	r8, [r3, #1804]
	cmp	r8, r2
	bcs	.L1971
	mov	r2, r8, asl #6
	add	r2, r2, r8, lsl #2
	add	r2, r5, r2
	add	ip, r2, #17408
	add	ip, ip, #200
	ldr	lr, [ip, #4]
	cmp	lr, #0
	bne	.L1971
	add	r1, r2, #17408
	add	r9, r1, #168
	str	r9, [fp, #-48]
	str	r8, [r1, #144]
	add	r8, r8, #1
	str	r8, [fp, #-52]
	ldr	r8, [r4, #668]
	add	r8, r6, r8, lsl #3
	ldr	r8, [r8, #3960]
	str	r8, [r1, #152]
	mov	r8, #1
	ldr	r0, [r4, #668]
	add	r0, r0, #65
	add	r0, r6, r0, lsl #2
	ldr	r0, [r0, #3960]
	str	r0, [r1, #156]
	ldr	r0, [r6, #3960]
	str	r0, [r1, #160]
	ldr	r0, [fp, #-48]
	ldr	r10, [r5, #44]
	str	r10, [r0, #8]
	ldr	r0, [r5, #48]
	str	r0, [r1, #180]
	str	r0, [fp, #-48]
	ldr	r0, [r4, #272]
	str	r0, [r1, #184]
	ldr	r9, [r4, #276]
	str	r9, [r1, #188]
	ldr	r9, [r4, #280]
	strb	lr, [r1, #140]
	strb	lr, [r1, #141]
	str	r9, [r1, #192]
	strb	lr, [r1, #142]
	str	r8, [ip, #4]
	ldr	r2, [r3, #1484]
	ldr	r1, [fp, #-52]
	cmp	r2, #0
	str	r1, [r3, #1804]
	bne	.L1973
	strb	r8, [r5, #12]
	ldr	r0, [fp, #-48]
	str	r2, [r3, #1424]
	str	r2, [r3, #1432]
	ldr	r1, [r6, #3960]
	str	r10, [r3, #1456]
	str	r0, [r3, #1460]
	str	r1, [r3, #1440]
	ldr	r1, [r4, #272]
	str	r1, [r3, #1464]
	ldr	r1, [r4, #276]
	str	r1, [r3, #1468]
	ldr	r1, [r4, #280]
	strb	r2, [r3, #1420]
	strb	r2, [r3, #1421]
	str	r1, [r3, #1472]
	strb	r2, [r3, #1422]
	str	r8, [r3, #1484]
.L1973:
	ldr	r2, [r3, #1808]
	ldrsb	r1, [r5, #13]
	cmp	r2, r1
	bcs	.L1974
	ldr	r8, [r4, #672]
	mov	r1, r2, asl #4
	sub	r1, r1, r2, asl #2
	movw	r9, #22048
	sub	r8, r8, #1
	add	r1, r5, r1
	add	ip, r1, #22016
	add	r2, r2, #1
	mov	lr, r8, asl #4
	mov	r0, #0
	sub	r8, lr, r8, asl #2
	movw	lr, #22040
	add	r8, r6, r8
	add	r8, r8, #4480
	add	r8, r8, #32
	ldr	r8, [r8, #4]
	str	r0, [r1, r9]
	mov	r9, #1
	str	r8, [r1, lr]
	str	r9, [ip, #28]
	str	r2, [r3, #1808]
.L1974:
	ldr	r2, [r4, #660]
	add	r5, r5, #16384
	str	r2, [r3, #1556]
	ldr	r3, [r5, #1160]
	cmp	r3, #0
	bne	.L1975
	ldr	r1, [r5, #1176]
	mov	r2, #1
	str	r3, [r5, #1100]
	ldr	r0, [fp, #-48]
	str	r1, [r5, #1108]
	ldr	r1, [r6, #3960]
	str	r10, [r5, #1132]
	str	r0, [r5, #1136]
	str	r1, [r5, #1116]
	ldr	r1, [r4, #272]
	str	r1, [r5, #1140]
	ldr	r1, [r4, #276]
	str	r1, [r5, #1144]
	ldr	r1, [r4, #280]
	strb	r3, [r5, #1096]
	strb	r3, [r5, #1097]
	str	r1, [r5, #1148]
	strb	r3, [r5, #1098]
	str	r2, [r5, #1160]
.L1975:
	ldr	r3, [r7, #16]
	mov	r0, #8
	blx	r3
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1979:
	ldr	r1, [ip, #708]
	str	r2, [fp, #-48]
	cmp	r1, #31
	bhi	.L1971
	add	r3, r0, #225280
	ldr	r3, [r3, #3296]
	cmp	r1, r3
	bcs	.L1971
	mov	r3, r1, asl #4
	add	r3, r3, r1, lsl #2
	add	r0, r0, r3
	add	r3, r0, #228352
	ldrb	r0, [r3, #264]	@ zero_extendqisi2
	cmp	r0, #255
	bne	.L1971
	ldr	lr, [r10, #4]
	add	r1, r1, #1
	ldr	r4, [r7, #16]
	mov	r0, #8
	str	lr, [r3, #256]
	ldr	lr, [r10]
	str	lr, [r3, #252]
	ldr	lr, [r10, #8]
	str	lr, [r3, #260]
	ldr	lr, [r10, #12]
	strb	lr, [r3, #264]
	str	r1, [ip, #708]
	blx	r4
	ldr	r2, [fp, #-48]
	mov	r0, r2
.L1960:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1965:
	ldr	r2, [r4, #284]
	strb	r2, [r5, #10]
	b	.L1966
.L1971:
	ldr	r3, [r7, #16]
	mov	r0, #8
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1980:
	mov	r3, ip, asl #4
	sub	r3, r3, ip, asl #2
	add	r3, r6, r3
	add	r3, r3, #4480
	add	r3, r3, #32
	ldr	r0, [r3, #8]
	cmp	r0, #0
	bne	.L1970
	ldr	lr, [r2, #680]
	add	r0, ip, r1
	ldr	r2, [r2, #780]
	str	r1, [r3, #8]
	mla	ip, lr, ip, r2
	str	ip, [r3, #4]
	str	r0, [r4, #672]
	b	.L1970
.L1977:
	ldr	ip, .L1981+8
	movw	r2, #8811
	ldr	r3, .L1981+12
	mov	r0, #0
	ldr	r1, .L1981+16
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1960
.L1978:
	ldr	ip, .L1981+8
	mov	r0, r8
	ldr	r3, .L1981+20
	movw	r2, #8812
	ldr	r1, .L1981+16
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1960
.L1976:
	ldr	ip, .L1981+8
	mov	r0, r10
	ldr	r3, .L1981+24
	movw	r2, #8810
	ldr	r1, .L1981+16
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1960
.L1982:
	.align	2
.L1981:
	.word	.LANCHOR0
	.word	s_pFspInst
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC2
	.word	.LC199
	UNWIND(.fnend)
	.size	VCTRL_SetSingleFrameBufToChan, .-VCTRL_SetSingleFrameBufToChan
	.align	2
	.global	DBG_WriteBigTileYuv
	.type	DBG_WriteBigTileYuv, %function
DBG_WriteBigTileYuv:
	UNWIND(.fnstart)
	@ args = 32, pretend = 0, frame = 48
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
	mov	r5, r3
	ldr	r3, [fp, #4]
	cmp	r0, #0
	cmpne	r1, #0
	str	r0, [fp, #-68]
	mov	r7, r1
	movne	ip, #1
	moveq	ip, #0
	mov	r0, r3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #12]
	cmp	r2, #0
	moveq	ip, #0
	andne	ip, ip, #1
	cmp	ip, #0
	mov	r10, r2
	ldr	r8, [fp, #8]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #16]
	ldr	r1, [fp, #24]
	str	r3, [fp, #-72]
	ldr	r3, [fp, #20]
	mov	ip, r3
	str	r3, [fp, #-76]
	ldr	r3, [fp, #28]
	mov	lr, r3
	str	r3, [fp, #-80]
	ldr	r3, [fp, #32]
	beq	.L1983
	ldr	r4, .L2090
	ldr	r2, [r4, #1392]
	cmp	r2, #0
	beq	.L1983
	ldr	r2, [r4, #1388]
	cmp	r2, #0
	beq	.L1983
	ldr	r2, [r4, #1384]
	cmp	r2, #0
	beq	.L1983
	rsb	r9, ip, r5
	ldr	r6, .L2090+4
	rsb	r1, r1, r9
	rsb	r2, lr, r0
	rsb	r3, r3, r2
	str	r1, [fp, #-64]
	mov	ip, r1
	mov	r0, #32
	mov	r2, ip
	ldr	r1, .L2090+8
	ldr	r9, [r6, #68]
	str	r3, [fp, #-88]
	blx	r9
	ldr	r2, [fp, #-48]
	cmp	r8, #0
	cmpne	r8, #3
	mov	r3, r5, lsr #1
	str	r3, [fp, #-84]
	mov	r3, r2, lsr #1
	str	r3, [fp, #-56]
	bne	.L1987
	cmp	r2, #0
	mov	r3, r2
	strne	r10, [fp, #-92]
	movne	r3, #0
	strne	r3, [fp, #-52]
	movne	r9, r3
	beq	.L1989
.L1991:
	cmp	r5, #0
	beq	.L1992
	ldr	r3, [fp, #-52]
	mov	r10, #0
	and	r8, r3, #15
	mov	r2, r3, lsr #4
	ldr	r3, [fp, #-60]
	mul	r2, r3, r2
	add	r8, r2, r8, lsl #8
.L1990:
	mov	r1, r10, lsr #8
	ldr	r0, [r4, #1392]
	add	r2, r9, r10
	ldr	r3, [r6, #52]
	add	r1, r8, r1, lsl #12
	add	r0, r0, r2
	add	r1, r7, r1
	add	r10, r10, #256
	mov	r2, #256
	blx	r3
	cmp	r5, r10
	bhi	.L1990
.L1992:
	ldr	r3, [fp, #-52]
	add	r9, r9, r5
	ldr	r2, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-52]
	cmp	r3, r2
	bne	.L1991
	ldr	r10, [fp, #-92]
.L1989:
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-88]
	ldr	r1, [fp, #-48]
	cmp	r3, r5
	cmpeq	r2, r1
	moveq	r3, #1
	movne	r3, #0
	str	r3, [fp, #-92]
	beq	.L2085
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-80]
	ldr	r9, [fp, #-88]
	mla	r7, r3, r5, r2
	cmp	r9, #0
	ldr	r2, [r4, #1392]
	add	r7, r2, r7
	beq	.L1997
	str	r10, [fp, #-48]
	ldr	r8, [fp, #-92]
	ldr	r10, [fp, #-68]
.L1998:
	mov	r0, r7
	add	r8, r8, #1
	ldr	r3, [r6, #44]
	mov	r2, r10
	ldr	r1, [fp, #-64]
	add	r7, r7, r5
	blx	r3
	cmp	r8, r9
	bne	.L1998
	ldr	r10, [fp, #-48]
.L1997:
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	beq	.L1994
	ldr	r3, [fp, #-60]
	mov	r8, #0
	str	r8, [fp, #-48]
	mov	r3, r3, lsr #1
	str	r3, [fp, #-52]
.L1995:
	cmp	r5, #0
	beq	.L2002
	ldr	r3, [fp, #-48]
	mov	r9, #0
	and	r7, r3, #7
	mov	r2, r3, lsr #3
	ldr	r3, [fp, #-52]
	mul	r2, r3, r2
	add	r7, r2, r7, lsl #8
.L2000:
	mov	r1, r9, lsr #8
	ldr	r0, [r4, #1392]
	add	r2, r8, r9
	ldr	r3, [r6, #52]
	add	r1, r7, r1, lsl #11
	add	r0, r0, r2
	add	r1, r10, r1
	add	r9, r9, #256
	mov	r2, #256
	blx	r3
	cmp	r5, r9
	bhi	.L2000
.L2002:
	ldr	r3, [fp, #-48]
	add	r8, r8, r5
	ldr	r2, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-48]
	cmp	r3, r2
	bne	.L1995
	ldr	r3, [fp, #-72]
	ldr	lr, [r4, #1392]
	cmp	r3, #1
	beq	.L2086
.L2004:
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	beq	.L2087
.L2005:
	ldr	r3, [fp, #-92]
	cmp	r3, #0
	bne	.L2088
	ldr	r1, [fp, #-88]
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-76]
	movs	r8, r1, lsr #1
	ldr	r1, [fp, #-84]
	mov	r3, r3, lsr #1
	ldr	r5, [r4, #1388]
	mov	r2, r2, lsr #1
	ldr	r4, [r4, #1384]
	mla	r3, r3, r1, r2
	add	r5, r5, r3
	add	r4, r4, r3
	beq	.L1983
	ldr	r3, [fp, #-64]
	ldr	r7, [fp, #-92]
	ldr	r10, [fp, #-68]
	mov	r9, r3, lsr #1
	str	r4, [fp, #-48]
	mov	r4, r1
.L2011:
	mov	r0, r5
	add	r7, r7, #1
	ldr	r3, [r6, #44]
	mov	r2, r10
	mov	r1, r9
	add	r5, r5, r4
	blx	r3
	cmp	r7, r8
	bne	.L2011
	ldr	r4, [fp, #-48]
	mov	r5, #0
	ldr	r7, [fp, #-84]
	ldr	r10, [fp, #-68]
.L2012:
	mov	r0, r4
	add	r5, r5, #1
	ldr	r3, [r6, #44]
	mov	r2, r10
	mov	r1, r9
	add	r4, r4, r7
	blx	r3
	cmp	r5, r8
	bne	.L2012
.L1983:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1987:
	subs	r3, r8, #1
	ldr	r2, [fp, #-48]
	movne	r3, #1
	cmp	r2, r3
	str	r3, [fp, #-64]
	ldrhi	r3, [fp, #-64]
	strhi	r10, [fp, #-76]
	strhi	r3, [fp, #-52]
	bls	.L2014
.L2016:
	cmp	r5, #0
	beq	.L2017
	ldr	r3, [fp, #-52]
	mov	r10, #0
	and	r8, r3, #15
	mov	r2, r3, lsr #4
	mov	r9, r3, lsr #1
	ldr	r3, [fp, #-60]
	mul	r9, r5, r9
	mul	r2, r3, r2
	add	r8, r2, r8, lsl #8
.L2015:
	mov	r1, r10, lsr #8
	ldr	r0, [r4, #1392]
	add	r2, r10, r9
	ldr	r3, [r6, #52]
	add	r1, r8, r1, lsl #12
	add	r0, r0, r2
	add	r1, r7, r1
	add	r10, r10, #256
	mov	r2, #256
	blx	r3
	cmp	r5, r10
	bhi	.L2015
.L2017:
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-48]
	add	r3, r3, #2
	str	r3, [fp, #-52]
	cmp	r2, r3
	bhi	.L2016
	ldr	r10, [fp, #-76]
.L2014:
	ldr	r3, [fp, #-48]
	ldr	r2, [fp, #-68]
	ldr	r0, [r4, #1392]
	mul	r1, r3, r5
	ldr	r3, [r6, #44]
	mov	r1, r1, lsr #1
	blx	r3
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	beq	.L2018
	ldr	r3, [fp, #-60]
	mov	r8, #0
	str	r8, [fp, #-48]
	mov	r3, r3, lsr #1
	str	r3, [fp, #-52]
.L2019:
	cmp	r5, #0
	beq	.L2022
	ldr	r3, [fp, #-48]
	mov	r9, #0
	and	r7, r3, #7
	mov	r2, r3, lsr #3
	ldr	r3, [fp, #-52]
	mul	r2, r3, r2
	add	r7, r2, r7, lsl #8
.L2020:
	mov	r1, r9, lsr #8
	ldr	r0, [r4, #1392]
	add	r2, r8, r9
	ldr	r3, [r6, #52]
	add	r1, r7, r1, lsl #11
	add	r0, r0, r2
	add	r1, r10, r1
	add	r9, r9, #256
	mov	r2, #256
	blx	r3
	cmp	r5, r9
	bhi	.L2020
.L2022:
	ldr	r3, [fp, #-48]
	add	r8, r8, r5
	ldr	r2, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-48]
	cmp	r3, r2
	bne	.L2019
	ldr	r3, [fp, #-72]
	cmp	r3, #1
	ldr	r3, [r4, #1392]
	beq	.L2089
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	bne	.L2025
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-64]
	cmp	r2, r3
	bls	.L2030
.L2031:
	add	r3, r3, #2
	cmp	r2, r3
	bhi	.L2031
.L2030:
	ldr	r3, [r6, #48]
	mov	r2, #1048576
	mov	r1, #128
	ldr	r0, [r4, #1384]
	blx	r3
	ldr	r3, [r6, #48]
	mov	r2, #1048576
	mov	r1, #128
	ldr	r0, [r4, #1388]
	blx	r3
.L2025:
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-84]
	ldr	r7, [fp, #-68]
	ldr	r0, [r4, #1388]
	mul	r5, r3, r2
	ldr	r3, [r6, #44]
	mov	r2, r7
	mov	r5, r5, lsr #1
.L2084:
	mov	r1, r5
	blx	r3
	mov	r1, r5
	ldr	r3, [r6, #44]
	mov	r2, r7
	ldr	r0, [r4, #1384]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L2085:
	mul	r1, r1, r5
	ldr	r3, [r6, #44]
	ldr	r2, [fp, #-68]
	ldr	r0, [r4, #1392]
	blx	r3
	b	.L1997
.L2089:
	ldr	r2, [fp, #-64]
	mov	lr, #0
	ldr	r8, [fp, #-84]
	ldr	r9, [fp, #-56]
	mla	r3, r2, r5, r3
	mov	r5, r5, asl #1
	add	r7, r3, #1
.L2026:
	cmp	r8, #0
	beq	.L2029
	mov	r3, lr, lsr #1
	mov	r2, r7
	mul	r3, r8, r3
	add	ip, r3, r8
.L2027:
	ldrb	r0, [r2, #-1]	@ zero_extendqisi2
	ldr	r1, [r4, #1384]
	strb	r0, [r1, r3]
	ldrb	r0, [r2], #2	@ zero_extendqisi2
	ldr	r1, [r4, #1388]
	strb	r0, [r1, r3]
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L2027
.L2029:
	add	lr, lr, #2
	add	r7, r7, r5
	cmp	r9, lr
	bhi	.L2026
	b	.L2025
.L2086:
	ldr	r8, [fp, #-84]
	mov	r3, #0
	ldr	r9, [fp, #-56]
	add	lr, lr, #1
	mov	r7, r3
.L2006:
	cmp	r8, #0
	moveq	ip, r3
	beq	.L2009
	add	ip, r3, r8
	mov	r2, lr
.L2007:
	ldrb	r0, [r2, #-1]	@ zero_extendqisi2
	ldr	r1, [r4, #1384]
	strb	r0, [r1, r3]
	ldrb	r0, [r2], #2	@ zero_extendqisi2
	ldr	r1, [r4, #1388]
	strb	r0, [r1, r3]
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L2007
.L2009:
	add	r7, r7, #1
	mov	r3, ip
	cmp	r7, r9
	add	lr, lr, r5
	bne	.L2006
	b	.L2005
.L2087:
	ldr	r3, [r6, #48]
	mov	r2, #1048576
	mov	r1, #128
	ldr	r0, [r4, #1384]
	blx	r3
	ldr	r3, [r6, #48]
	mov	r2, #1048576
	mov	r1, #128
	ldr	r0, [r4, #1388]
	blx	r3
	b	.L2005
.L2088:
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-84]
	ldr	r7, [fp, #-68]
	ldr	r0, [r4, #1388]
	mul	r5, r3, r2
	ldr	r3, [r6, #44]
	mov	r2, r7
	b	.L2084
.L1994:
	ldr	r3, [fp, #-72]
	cmp	r3, #1
	bne	.L2004
	b	.L2005
.L2018:
	ldr	r3, [fp, #-72]
	cmp	r3, #1
	beq	.L2025
	cmp	r3, #0
	beq	.L2030
	b	.L2025
.L2091:
	.align	2
.L2090:
	.word	.LANCHOR3
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC200
	UNWIND(.fnend)
	.size	DBG_WriteBigTileYuv, .-DBG_WriteBigTileYuv
	.align	2
	.global	VCTRL_GetChanImage
	.type	VCTRL_GetChanImage, %function
VCTRL_GetChanImage:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 520
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #556)
	sub	sp, sp, #556
	ldr	r6, .L2146
	mov	r4, r1
	mov	r2, r0
	mov	r5, r0
	ldr	r1, .L2146+4
	mov	r0, #2
	ldr	r3, [r6, #68]
	blx	r3
	cmp	r4, #0
	beq	.L2131
	cmp	r5, #15
	bhi	.L2132
	ldr	r7, .L2146+8
	ldr	r0, [r7, r5, asl #2]
	cmp	r0, #0
	beq	.L2133
	ldr	r3, [r0, #12]
	cmp	r3, #1
	bne	.L2134
	ldr	r3, [r6, #12]
	mov	r0, #4
	blx	r3
	ldr	r0, [r7, r5, asl #2]
	cmp	r0, #0
	beq	.L2135
	ldr	r3, [r0, #12]
	cmp	r3, #1
	bne	.L2136
	add	r0, r0, #229376
	mov	r1, r4
	add	r0, r0, #792
	bl	SYNTAX_ReceiveImage
	cmp	r0, #1
	mov	r9, r0
	beq	.L2137
	mov	r0, #12
	mvn	r8, #0
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L2138
.L2113:
	ldr	r3, [r7, r5, asl #2]
	mov	r0, #4
	ldr	r2, [r6, #16]
	add	r3, r3, #245760
	ldrb	r3, [r3, #620]	@ zero_extendqisi2
	strb	r3, [r4, #480]
	blx	r2
.L2127:
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2137:
	ldr	r10, .L2146+12
	mov	r3, r5, asl #2
	str	r3, [fp, #-552]
	add	r3, r10, r3
	ldr	r0, [r3, #1236]
	cmp	r0, #0
	beq	.L2101
	ldr	r3, [r4, #160]
	ldr	lr, [r10, #1396]
	tst	r3, #28
	ldr	r2, [r4, #36]
	ldr	r3, [r4, #164]
	moveq	ip, #1
	movne	ip, #0
	cmp	lr, #0
	beq	.L2102
	ldr	lr, [r4, #352]
	mov	r8, #0
	ldr	r1, [r4, #32]
	str	ip, [sp, #12]
	ldr	ip, [r4, #348]
	str	lr, [sp, #28]
	ldr	lr, [r4, #344]
	str	ip, [sp, #24]
	ldr	ip, [r4, #340]
	str	lr, [sp, #20]
	ldr	lr, [r4, #192]
	str	ip, [sp, #16]
	ldr	ip, [r4, #168]
	stmib	sp, {r8, lr}
	str	ip, [sp]
	bl	DBG_WriteBigTileYuv
.L2101:
	ldr	r3, [r4, #256]
	mvn	r8, #0
	str	r8, [r4, #252]
	cmp	r3, #1
	beq	.L2115
.L2111:
	mov	r0, #12
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L2139
.L2116:
	ldr	r2, [r4, #160]
	mov	r8, #0
	ldr	r3, [r7, r5, asl #2]
	str	r2, [r3, #308]
	ldr	r2, [r4, #364]
	str	r2, [r3, #312]
	b	.L2113
.L2102:
	ldr	r1, [r4, #32]
	ldr	r8, [r4, #192]
	str	lr, [sp, #28]
	str	lr, [sp, #24]
	str	lr, [sp, #20]
	str	lr, [sp, #16]
	str	ip, [sp, #12]
	ldr	ip, [r4, #168]
	str	lr, [sp, #4]
	str	r8, [sp, #8]
	str	ip, [sp]
	bl	DBG_WriteBigTileYuv
	b	.L2101
.L2138:
	ldr	r10, .L2146+12
	mov	r3, r5, asl #2
	str	r3, [fp, #-552]
.L2112:
	ldr	r3, [r6]
	blx	r3
	ldr	r3, [fp, #-552]
	ldr	r2, .L2146+16
	add	r1, r10, r3
	ldr	r3, [r1, #1404]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	cmp	r3, r2
	bhi	.L2140
.L2114:
	cmp	r8, #0
	bne	.L2113
	b	.L2116
.L2115:
	ldr	r2, [r4, #244]
	cmp	r2, #0
	str	r2, [fp, #-556]
	beq	.L2141
	ldr	r0, [r4, #92]
	mov	r2, #60
	ldr	ip, [r4, #88]
	add	r1, r4, #420
	str	r3, [fp, #-556]
	str	r0, [r4, #264]
	add	r0, r4, #280
	ldr	r3, [r6, #52]
	str	ip, [r4, #260]
	blx	r3
	ldr	r3, [fp, #-556]
	str	r8, [r4, #252]
	str	r3, [r4, #244]
	mov	r3, #3
	str	r3, [r4, #364]
	b	.L2111
.L2139:
	mov	r8, #0
	b	.L2112
.L2134:
	ldr	r4, [r6, #68]
	movw	r2, #3848
	ldr	r3, .L2146+20
	mov	r0, #0
	ldr	r1, .L2146+24
	mvn	r8, #0
	blx	r4
	b	.L2127
.L2136:
	ldr	r3, [r6, #68]
	movw	r2, #3866
	ldr	r1, .L2146+28
	mov	r0, #0
.L2128:
	blx	r3
	ldr	r3, [r6, #16]
	mov	r0, #4
	mvn	r8, #0
	blx	r3
	b	.L2127
.L2140:
	mov	r2, r5, asl #24
	str	r0, [r1, #1404]
	add	r2, r2, #786432
	movw	r1, #4056
	cmp	r9, #1
	addeq	r2, r2, #1
	ldr	r0, .L2146+32
	bl	DBG_AddTrace
	b	.L2114
.L2141:
	ldr	r0, [r7, r5, asl #2]
	sub	r1, fp, #548
	add	r0, r0, #229376
	add	r0, r0, #792
	bl	SYNTAX_ReceiveImage
	cmp	r0, #1
	str	r0, [fp, #-560]
	bne	.L2142
	ldr	r3, [r4, #248]
	ldr	r2, [fp, #-300]
	cmp	r3, r2
	blt	.L2143
	bgt	.L2144
	cmp	r3, #0
	ldr	r3, .L2146+8
	ldr	r0, [r3, r5, asl #2]
	bne	.L2108
	add	r0, r0, #229376
	mvn	r9, #1
	add	r0, r0, #792
	bl	SYNTAX_ReturnImage
	ldr	r3, .L2146+8
	mov	r1, r4
	ldr	r0, [r3, r5, asl #2]
	add	r0, r0, #229376
	add	r0, r0, #792
	bl	SYNTAX_ReleaseImage
	ldr	r0, [fp, #-560]
	ldr	r3, [r4, #248]
	ldr	r2, .L2146+36
	ldr	r1, .L2146+40
	ldr	ip, [r6, #68]
	blx	ip
.L2110:
	mov	r0, #12
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	beq	.L2114
	b	.L2112
.L2132:
	ldr	r4, [r6, #68]
	movw	r2, #3844
	ldr	r3, .L2146+44
	mov	r0, #0
	ldr	r1, .L2146+24
	mvn	r8, #0
	blx	r4
	b	.L2127
.L2142:
	ldr	r3, .L2146+8
	ldr	r8, [fp, #-560]
	ldr	r0, [r3, r5, asl #2]
	add	r0, r0, #229376
	add	r0, r0, #792
	bl	SYNTAX_ReturnImage
	ldr	r3, [r6, #16]
	mov	r0, #4
	blx	r3
	b	.L2127
.L2143:
	ldr	r0, [fp, #-460]
	mov	r2, #60
	ldr	r3, [fp, #-452]
	sub	r1, fp, #128
	ldr	ip, [fp, #-456]
	ldr	lr, [fp, #-448]
	str	r0, [r4, #260]
	add	r0, r4, #280
	str	r3, [r4, #268]
	str	ip, [r4, #264]
	ldr	r3, [r6, #52]
	str	lr, [r4, #272]
	blx	r3
	ldr	r8, [fp, #-304]
	ldr	r3, [fp, #-352]
	mov	r2, #3
	cmp	r8, #0
	str	r2, [r4, #364]
	str	r3, [r4, #252]
	ldreq	r9, [fp, #-560]
	ldrne	r3, [fp, #-560]
	ldrne	r8, [fp, #-556]
	strne	r3, [r4, #244]
	movne	r9, r3
	b	.L2110
.L2108:
	add	r0, r0, #229376
	mov	r1, r4
	add	r0, r0, #792
	bl	SYNTAX_ReleaseImage
	ldr	r3, [fp, #-304]
	cmp	r3, #0
	beq	.L2145
	ldr	ip, [r6, #68]
	ldr	r3, [r4, #248]
	ldr	r2, .L2146+36
	ldr	r1, .L2146+48
	ldr	r0, [fp, #-560]
	blx	ip
	sub	r1, fp, #548
	ldr	r3, [r6, #52]
	mov	r2, #504
	mov	r0, r4
	blx	r3
	ldr	r0, [fp, #-456]
	ldr	ip, [fp, #-460]
	mov	r2, #60
	ldr	r3, [r6, #52]
	sub	r1, fp, #128
	str	r0, [r4, #264]
	add	r0, r4, #280
	str	ip, [r4, #260]
	blx	r3
	ldr	r3, [fp, #-560]
	str	r8, [r4, #252]
	str	r3, [r4, #244]
	mov	r3, #3
	str	r3, [r4, #364]
	b	.L2111
.L2144:
	ldr	r3, .L2146+8
	mvn	r9, #1
	ldr	r0, [r3, r5, asl #2]
	add	r0, r0, #229376
	add	r0, r0, #792
	bl	SYNTAX_ReturnImage
	ldr	r3, .L2146+8
	mov	r1, r4
	ldr	r0, [r3, r5, asl #2]
	add	r0, r0, #229376
	add	r0, r0, #792
	bl	SYNTAX_ReleaseImage
	ldr	r1, [fp, #-300]
	ldr	r3, [r4, #248]
	ldr	r0, [fp, #-560]
	str	r1, [sp]
	ldr	r2, .L2146+36
	ldr	r1, .L2146+52
	ldr	ip, [r6, #68]
	blx	ip
	b	.L2110
.L2131:
	ldr	r5, [r6, #68]
	mov	r0, r4
	ldr	r3, .L2146+56
	movw	r2, #3843
	ldr	r1, .L2146+24
	mvn	r8, #0
	blx	r5
	b	.L2127
.L2133:
	ldr	r4, [r6, #68]
	movw	r2, #3845
	ldr	r3, .L2146+60
	mvn	r8, #0
	ldr	r1, .L2146+24
	blx	r4
	b	.L2127
.L2135:
	ldr	r3, [r6, #68]
	mov	r2, #3856
	ldr	r1, .L2146+64
	b	.L2128
.L2145:
	ldr	r3, .L2146+8
	sub	r1, fp, #548
	mvn	r9, #1
	ldr	r0, [r3, r5, asl #2]
	add	r0, r0, #229376
	add	r0, r0, #792
	bl	SYNTAX_ReleaseImage
	ldr	r0, [fp, #-560]
	ldr	r3, [r4, #248]
	ldr	r2, .L2146+36
	ldr	r1, .L2146+48
	ldr	ip, [r6, #68]
	blx	ip
	b	.L2110
.L2147:
	.align	2
.L2146:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC201
	.word	.LANCHOR0
	.word	.LANCHOR3
	.word	g_TraceImgPeriod
	.word	.LC37
	.word	.LC1
	.word	.LC41
	.word	.LANCHOR1+256
	.word	.LANCHOR1+236
	.word	.LC203
	.word	.LC6
	.word	.LC204
	.word	.LC202
	.word	.LC38
	.word	.LC2
	.word	.LC40
	UNWIND(.fnend)
	.size	VCTRL_GetChanImage, .-VCTRL_GetChanImage
	.align	2
	.global	VCTRL_GetImageWidth
	.type	VCTRL_GetImageWidth, %function
VCTRL_GetImageWidth:
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
	cmp	r0, #15
	bhi	.L2149
	ldr	r3, .L2159
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L2149
	add	r0, r0, #229376
	ldr	r3, [r0, #792]
	cmp	r3, #2
	beq	.L2150
	cmp	r3, #17
	beq	.L2151
	cmp	r3, #0
	beq	.L2158
.L2149:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L2150:
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_GetImageWidth
.L2158:
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_GetImageWidth
.L2151:
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_GetImageWidth
.L2160:
	.align	2
.L2159:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetImageWidth, .-VCTRL_GetImageWidth
	.align	2
	.global	VCTRL_GetImageHeight
	.type	VCTRL_GetImageHeight, %function
VCTRL_GetImageHeight:
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
	cmp	r0, #15
	bhi	.L2162
	ldr	r3, .L2172
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L2162
	add	r0, r0, #229376
	ldr	r3, [r0, #792]
	cmp	r3, #2
	beq	.L2163
	cmp	r3, #17
	beq	.L2164
	cmp	r3, #0
	beq	.L2171
.L2162:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L2163:
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_GetImageHeight
.L2171:
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_GetImageHeight
.L2164:
	add	r0, r0, #800
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_GetImageHeight
.L2173:
	.align	2
.L2172:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetImageHeight, .-VCTRL_GetImageHeight
	.global	s_VfmwSavePath
	.global	g_DnrIrqHandle
	.global	g_VdecIrqHandle
	.global	g_StopDec
	.global	g_DnrSleepTime
	.global	g_SleepTime
	.global	MemRecord_YUV
	.global	pVl
	.global	pUl
	.global	pY
	.global	g_u32DFSMaxAllocTime
	.global	pOption
	.global	g_eVdmVersion
	.global	g_VdmCharacter
	.global	g_CurProcChan
	.global	g_ResetCreateNewSave
	.global	save_yuv_with_crop
	.global	save_yuv_chan_num
	.global	vfmw_save_yuv_file
	.global	save_seg_chan_num
	.global	vfmw_save_seg_file
	.global	save_str_chan_num
	.global	vfmw_save_str_file
	.global	g_apple_airplay_mirrorinig_flag
	.global	g_not_allow_H264FullPictureRepair_flag
	.global	g_not_direct_8x8_inference_flag
	.global	g_allow_B_before_P
	.global	extra_cmd
	.global	extra_disp
	.global	extra_ref
	.global	g_VfmwGlobalStat
	.global	g_VfmwChanStat
	.global	s_pstVfmwChan
	.global	AcceleratorCharacter
	.global	g_event_report
	.global	g_DSPState
	.section	.rodata
	.align	2
.LANCHOR1 = . + 0
	.type	__func__.17012, %object
	.size	__func__.17012, 18
__func__.17012:
	.ascii	"VCTRL_EventReport\000"
	.space	2
	.type	__func__.17024, %object
	.size	__func__.17024, 18
__func__.17024:
	.ascii	"VCTRL_SetCallBack\000"
	.space	2
	.type	__FUNCTION__.17112, %object
	.size	__FUNCTION__.17112, 29
__FUNCTION__.17112:
	.ascii	"VCTRL_PartitionMemForStdUser\000"
	.space	3
	.type	__FUNCTION__.17355, %object
	.size	__FUNCTION__.17355, 23
__FUNCTION__.17355:
	.ascii	"VCTRL_ReleaseChanImage\000"
	.space	1
	.type	__func__.17356, %object
	.size	__func__.17356, 23
__func__.17356:
	.ascii	"VCTRL_ReleaseChanImage\000"
	.space	1
	.type	__FUNCTION__.17427, %object
	.size	__FUNCTION__.17427, 19
__FUNCTION__.17427:
	.ascii	"VCTRL_FlushDecoder\000"
	.space	1
	.type	__FUNCTION__.17739, %object
	.size	__FUNCTION__.17739, 18
__FUNCTION__.17739:
	.ascii	"GetExtraRefFrmNum\000"
	.space	2
	.type	__FUNCTION__.17745, %object
	.size	__FUNCTION__.17745, 19
__FUNCTION__.17745:
	.ascii	"GetExtraDispFrmNum\000"
	.space	1
	.type	__FUNCTION__.17751, %object
	.size	__FUNCTION__.17751, 16
__FUNCTION__.17751:
	.ascii	"GetExtraCtrlCmd\000"
	.type	__FUNCTION__.17671, %object
	.size	__FUNCTION__.17671, 14
__FUNCTION__.17671:
	.ascii	"DecChanSyntax\000"
	.space	2
	.type	__FUNCTION__.17987, %object
	.size	__FUNCTION__.17987, 21
__FUNCTION__.17987:
	.ascii	"VCTRL_RequestChanMem\000"
	.space	3
	.type	__func__.17336, %object
	.size	__func__.17336, 19
__func__.17336:
	.ascii	"VCTRL_GetChanImage\000"
	.space	1
	.type	__FUNCTION__.17344, %object
	.size	__FUNCTION__.17344, 19
__FUNCTION__.17344:
	.ascii	"VCTRL_GetChanImage\000"
	.data
	.align	2
.LANCHOR2 = . + 0
	.type	g_not_direct_8x8_inference_flag, %object
	.size	g_not_direct_8x8_inference_flag, 1
g_not_direct_8x8_inference_flag:
	.byte	1
	.space	3
	.type	s_VfmwSavePath, %object
	.size	s_VfmwSavePath, 64
s_VfmwSavePath:
	.byte	47
	.byte	109
	.byte	110
	.byte	116
	.byte	0
	.space	59
	.type	save_yuv_chan_num, %object
	.size	save_yuv_chan_num, 4
save_yuv_chan_num:
	.word	-1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"InstID out of range\000" )
.LC1:
	ASCII(.ascii	"vfmw_ctrl.c,L%d: %s\012\000" )
	.space	3
.LC2:
	ASCII(.ascii	"Chan inactive\000" )
	.space	2
.LC3:
	ASCII(.ascii	"s_VfmwCTrl.event_report_vdec = NULL\012\000" )
	.space	3
.LC4:
	ASCII(.ascii	"s_VfmwCTrl.event_report_omxvdec = NULL\012\000" )
.LC5:
	ASCII(.ascii	"%s Unkown Adapter Type: %d, Len: %d\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"ChanID out of range\000" )
.LC7:
	ASCII(.ascii	"Force vdm %d sleep.\012\000" )
	.space	3
.LC8:
	ASCII(.ascii	"VDMHAL_NULL_FUN_PRINT,L%d\012\000" )
	.space	1
.LC9:
	ASCII(.ascii	"Vfmw suspend totally take %d ms\012\000" )
	.space	3
.LC10:
	ASCII(.ascii	"Wait sleep time out %d ms (isScdSleep=%d, isVdmSlee" )
	ASCII(.ascii	"p=%d)!\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"Force scd %d sleep.\012\000" )
	.space	3
.LC12:
	ASCII(.ascii	"Vfmw resume totally take %d ms\012\000" )
.LC13:
	ASCII(.ascii	"can NOT config a not-opened Chan\000" )
	.space	3
.LC14:
	ASCII(.ascii	"event_report null!\000" )
	.space	1
.LC15:
	ASCII(.ascii	"%s Unkown Adapter Type: %d\012\000" )
.LC16:
	ASCII(.ascii	"pstStreamParam is NULL\000" )
	.space	1
.LC17:
	ASCII(.ascii	"L: %d, Stream Interface Error!!, ChanID: %d\012\000" )
	.space	3
.LC18:
	ASCII(.ascii	"This Chan has not been created!!!\000" )
	.space	2
.LC19:
	ASCII(.ascii	"can NOT get a not-opened Chan's information of bits" )
	ASCII(.ascii	"tream\000" )
	.space	3
.LC20:
	ASCII(.ascii	"pArgs is null\000" )
	.space	2
.LC21:
	ASCII(.ascii	"image size abnormal(%dx%d)\012\000" )
.LC22:
	ASCII(.ascii	"no mem to arrange for soft dec\012\000" )
.LC23:
	ASCII(.ascii	"partition fs memory fail!\012\000" )
	.space	1
.LC24:
	ASCII(.ascii	"%s: L%d : vdm chan memory is too small to support u" )
	ASCII(.ascii	"ser decoder\012\000" )
.LC25:
	ASCII(.ascii	"FSP_ConfigInstance fail!\012\000" )
	.space	2
.LC26:
	ASCII(.ascii	"DFS, Wrong! Phyaddr:0x%x, Viraddr:0x%x, frm_num: 0x" )
	ASCII(.ascii	"%x\012\000" )
	.space	1
.LC27:
	ASCII(.ascii	"DFS, Not enough Frame node,rls all node, FrmNum:%d," )
	ASCII(.ascii	" AllocedFrameNum: %d\012\000" )
	.space	3
.LC28:
	ASCII(.ascii	"DFS, Rls Fail, chanid: %d\012\000" )
	.space	1
.LC29:
	ASCII(.ascii	"VFMW_FRM_BUF\000" )
	.space	3
.LC30:
	ASCII(.ascii	"DFS, Not enough resource, ChanID: %d, AllocedFrmNum" )
	ASCII(.ascii	": %d, FrmNum: %d, i: %d\012\000" )
.LC31:
	ASCII(.ascii	"DFS, Rls Frame Node Fail!\012\000" )
	.space	1
.LC32:
	ASCII(.ascii	"pstChan == NULL\000" )
.LC33:
	ASCII(.ascii	"DelMemRecord 0x%x failed!\012\000" )
	.space	1
.LC34:
	ASCII(.ascii	"pstCfg is null\000" )
	.space	1
.LC35:
	ASCII(.ascii	"Chip not support beyond %dx%d when Std != H264/VP8/" )
	ASCII(.ascii	"MVC/USER.\012\000" )
	.space	2
.LC36:
	ASCII(.ascii	"pArgs is NULL\000" )
	.space	2
.LC37:
	ASCII(.ascii	"This channel is not opened\000" )
	.space	1
.LC38:
	ASCII(.ascii	"pImage is NULL\000" )
	.space	1
.LC39:
	ASCII(.ascii	"call VCTRL_ReleaseChanImage, ChanID, ImgID = %d,%d\012" )
	ASCII(.ascii	"\000" )
.LC40:
	ASCII(.ascii	"vdm_ctrl.c,L%d: Chan inactive\012\000" )
	.space	1
.LC41:
	ASCII(.ascii	"vdm_ctrl.c,L%d: This channel is not opened\012\000" )
.LC42:
	ASCII(.ascii	"%s call SYNTAX_ReleaseImage failed\012\000" )
.LC43:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: ChanID out of range\012\000" )
	.space	1
.LC44:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: Chan %d is not open or not ru" )
	ASCII(.ascii	"nning\012\000" )
	.space	2
.LC45:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: ChanID out of range is %d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC46:
	ASCII(.ascii	"Chan %d is not open or not running\012\000" )
.LC47:
	ASCII(.ascii	"line: %d Flush DPB failed!\012\000" )
.LC48:
	ASCII(.ascii	"VCTRL_FlushDecoder\012\000" )
.LC49:
	ASCII(.ascii	"fuction return value is null,%s %d MVC_OK != MVC_Fl" )
	ASCII(.ascii	"ushDPB!!\012\000" )
	.space	3
.LC50:
	ASCII(.ascii	"ChanId out of range\000" )
.LC51:
	ASCII(.ascii	"This channel is not running\000" )
.LC52:
	ASCII(.ascii	"chan not create\000" )
.LC53:
	ASCII(.ascii	"can NOT start a not-opened Chan\000" )
.LC54:
	ASCII(.ascii	"NULL == pArgs\000" )
	.space	2
.LC55:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC56:
	ASCII(.ascii	"VCTRL_GetUsrdecFrame but VFMW_USER != s_pstVfmwChan" )
	ASCII(.ascii	"[ChanID]->eVidStd!\012\000" )
	.space	1
.LC57:
	ASCII(.ascii	"VCTRL_GetUsrdecFrame but s_pstVfmwChan[ChanID]->s32" )
	ASCII(.ascii	"UsrdecFrameNum < MIN_USERDEC_FRAME_NUM!\012\000" )
.LC58:
	ASCII(.ascii	"VCTRL_GetUsrdecFrame but FSP_IsNewFsAvalible(ChanID" )
	ASCII(.ascii	") != 1!\012\000" )
.LC59:
	ASCII(.ascii	"get frame store fail!\012\000" )
	.space	1
.LC60:
	ASCII(.ascii	"get image buffer ok: LogicFsID = %d\012\000" )
	.space	3
.LC61:
	ASCII(.ascii	"line: %d, pLf is NULL!\012\000" )
.LC62:
	ASCII(.ascii	"decode %p, disp %p, tf %p\012\000" )
	.space	1
.LC63:
	ASCII(.ascii	"VCTRL_GetUsrdecFrame get LogicFs fail!\012\000" )
.LC64:
	ASCII(.ascii	"pChanOption is NULL\000" )
.LC65:
	ASCII(.ascii	"pDetailMemSize is NULL\000" )
	.space	1
.LC66:
	ASCII(.ascii	"ERROR: s32MaxRefFrameNum(%d), extra_ref(%d), s32Dis" )
	ASCII(.ascii	"playFrameNum(%d), extra_disp(%d)\012\000" )
	.space	3
.LC67:
	ASCII(.ascii	"ERROR: (MaxRefFrameNum(%d) + extra_ref(%d)) > 16\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC68:
	ASCII(.ascii	"VDEC_CID_GET_CHAN_DETAIL_MEMSIZE_BY_OPTION is desig" )
	ASCII(.ascii	"ned for CAP_LEVEL_USER_DEFINE_WITH_OPTION, please c" )
	ASCII(.ascii	"hange channel's capability or use VDEC_CID_GET_CHAN" )
	ASCII(.ascii	"_MEMSIZE.\012\000" )
.LC69:
	ASCII(.ascii	"CAP_LEVEL_USER_DEFINE_WITH_OPTION option is illegal" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC70:
	ASCII(.ascii	"VCTRL_GetChanMemSizeByOption L%d: arrange return fa" )
	ASCII(.ascii	"ilure\012\000" )
	.space	2
.LC71:
	ASCII(.ascii	"eCapLevel >= CAP_LEVEL_BUTT\000" )
.LC72:
	ASCII(.ascii	"ERROR: (nPmv(%d) + extra_ref(%d)) <= 0\012\000" )
.LC73:
	ASCII(.ascii	"ERROR: TempMinFrame(%d + %d + %d), TempMiddleFrame(" )
	ASCII(.ascii	"%d + %d + %d), TempFluentFrame(%d + %d + %d)\012\000" )
	.space	3
.LC74:
	ASCII(.ascii	"VCTRL_GetChanMemSize L%d: arrange return failure\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC75:
	ASCII(.ascii	"extra_ref=\000" )
	.space	1
.LC76:
	ASCII(.ascii	"=\000" )
	.space	2
.LC77:
	ASCII(.ascii	" \000" )
	.space	2
.LC78:
	ASCII(.ascii	"fuction return value is null,%s %d unknow error!!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC79:
	ASCII(.ascii	"ERROR: extra_ref = %d is out of [ -5000, 5000 ]!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC80:
	ASCII(.ascii	"extra_disp=\000" )
.LC81:
	ASCII(.ascii	"ERROR: extra_disp = %d is out of [ -5000, 5000 ]!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC82:
	ASCII(.ascii	"extra_cmd=\000" )
	.space	1
.LC83:
	ASCII(.ascii	"OpenDrivers() error\012\000" )
	.space	3
.LC84:
	ASCII(.ascii	"HI_VFMW_VideoDecode\000" )
.LC85:
	ASCII(.ascii	"(safe,warn,danger) :amount = %d,%d,%d,%d\012\000" )
	.space	2
.LC86:
	ASCII(.ascii	"strm_ctrl: I->IPB\012\000" )
	.space	1
.LC87:
	ASCII(.ascii	"strm_ctrl: IPB->I\012\000" )
	.space	1
.LC88:
	ASCII(.ascii	"(CurrMode,NextMode) = %d,%d\012\000" )
	.space	3
.LC89:
	ASCII(.ascii	"Syntax is stopped from This channel\000" )
.LC90:
	ASCII(.ascii	"[%d] vdm busy\012\000" )
	.space	1
.LC91:
	ASCII(.ascii	"[%d] no frame\012\000" )
	.space	1
.LC92:
	ASCII(.ascii	"[%d] no stream\012\000" )
.LC93:
	ASCII(.ascii	"seg_pts: %lld, seg_usertag = %lld\012\000" )
	.space	1
.LC94:
	ASCII(.ascii	"pic_pts: %lld\012\000" )
	.space	1
.LC95:
	ASCII(.ascii	"pic_usertag: %lld\012\000" )
	.space	1
.LC96:
	ASCII(.ascii	"pic_pts: %lld pic_usertag = %lld\012\000" )
	.space	2
.LC97:
	ASCII(.ascii	"%s:ChanId %d this hevc file is 10bit!!!\012\000" )
	.space	3
.LC98:
	ASCII(.ascii	"DFS, Wait Partition\012\000" )
	.space	3
.LC99:
	ASCII(.ascii	"DFS, Partition fail, u32DynamicFrameStoreAllocEn: %" )
	ASCII(.ascii	"d, eFspPartitionState: %d\012\000" )
	.space	2
.LC100:
	ASCII(.ascii	"ChanID out of range!\000" )
	.space	3
.LC101:
	ASCII(.ascii	"SetVdecExtra ERROR: extra_ref = %d is out of [ -500" )
	ASCII(.ascii	"0, 5000 ]!\012\000" )
	.space	1
.LC102:
	ASCII(.ascii	"SetVdecExtra ERROR: extra_disp = %d is out of [ -50" )
	ASCII(.ascii	"00, 5000 ]!\012\000" )
.LC103:
	ASCII(.ascii	"Thread running...\012\000" )
	.space	1
.LC104:
	ASCII(.ascii	"Thread stopped!\012\000" )
	.space	3
.LC105:
	ASCII(.ascii	"Thread killed!\012\000" )
.LC106:
	ASCII(.ascii	"thread running...\012\000" )
	.space	1
.LC107:
	ASCII(.ascii	"thread stopped...\012\000" )
	.space	1
.LC108:
	ASCII(.ascii	"Report Last Frame, Value=%d, LastFrameState=%d\012\000" )
.LC109:
	ASCII(.ascii	"Last frame output failed!\012\000" )
	.space	1
.LC110:
	ASCII(.ascii	"Last frame output successed!\012\000" )
	.space	2
.LC111:
	ASCII(.ascii	"Last frame already output, image id: %d!\012\000" )
	.space	2
.LC112:
	ASCII(.ascii	"line %d can not know YuvFormat = %d\012\000" )
	.space	3
.LC113:
	ASCII(.ascii	"userdec frame(phy=%#x) address error!\012\000" )
	.space	1
.LC114:
	ASCII(.ascii	"can not map vir addr for usrdat frame(cbphy=%#x)\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC115:
	ASCII(.ascii	"line: %d, pLogic is Null!\012\000" )
	.space	1
.LC116:
	ASCII(.ascii	"eYuvFormat %d is not support!!\012\000" )
.LC117:
	ASCII(.ascii	"pUsrdecFrame == NULL\000" )
	.space	3
.LC118:
	ASCII(.ascii	"VCTRL_PutUsrdecFrame: VidStd is %d\012\000" )
.LC119:
	ASCII(.ascii	"VCTRL_PutUsrdecFrame return err\012\000" )
	.space	3
.LC120:
	ASCII(.ascii	"L:%d g_pstRegCrg is NULL\012\000" )
	.space	2
.LC121:
	ASCII(.ascii	"L:%d ChanID out of range\012\000" )
	.space	2
.LC122:
	ASCII(.ascii	"L:%d This Chan has not been created!!!\012\000" )
.LC123:
	ASCII(.ascii	"L:%d WARNING: vidio std not setted!\012\000" )
	.space	3
.LC124:
	ASCII(.ascii	"WARNING: vidio std not setted!\000" )
	.space	1
.LC125:
	ASCII(.ascii	"This Chan has not been created or has been destroye" )
	ASCII(.ascii	"d !\000" )
	.space	1
.LC126:
	ASCII(.ascii	"VCTRL_StopChanWithCheck fail!\012\000" )
	.space	1
.LC127:
	ASCII(.ascii	"---------------------------------------------------" )
	ASCII(.ascii	"----------------------\012\000" )
	.space	1
.LC128:
	ASCII(.ascii	"pChanOption == null\000" )
.LC129:
	ASCII(.ascii	"VDEC_CID_CREATE_CHAN_WITH_OPTION is designed for CA" )
	ASCII(.ascii	"P_LEVEL_USER_DEFINE_WITH_OPTION, please change chan" )
	ASCII(.ascii	"nel's capability.\012\000" )
	.space	3
.LC130:
	ASCII(.ascii	"line %d VCTRL_GetChanMemSizeWithOption failed!\012\000" )
.LC131:
	ASCII(.ascii	"L: %d : part we can NOT alloc buffer for channel co" )
	ASCII(.ascii	"ntext\012\000" )
	.space	2
.LC132:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel context\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC133:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel vdh\012\000" )
	.space	2
.LC134:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel vdh, %#x <" )
	ASCII(.ascii	" %#x\012\000" )
	.space	3
.LC135:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel scd\012\000" )
	.space	2
.LC136:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for SCD\012\000" )
	.space	2
.LC137:
	ASCII(.ascii	"can NOT enable FSP instance\012\000" )
	.space	3
.LC138:
	ASCII(.ascii	"vfmw have max(%d) channels opened, can NOT crerate " )
	ASCII(.ascii	"more channels\012\000" )
	.space	2
.LC139:
	ASCII(.ascii	"VCTRL_CreateChan eCapLevel = %d error! Try to use V" )
	ASCII(.ascii	"CTRL_CreateChanWithOption(CAP_LEVEL_USER_DEFINE_WIT" )
	ASCII(.ascii	"H_OPTION, ...)\012\000" )
	.space	2
.LC140:
	ASCII(.ascii	"VCTRL_GetChanMemSize ERROR\012\000" )
.LC141:
	ASCII(.ascii	"channel memory have been allocated outside, but the" )
	ASCII(.ascii	" mem-info is not correct!\012\000" )
	.space	2
.LC142:
	ASCII(.ascii	"mem-info(phy, vir, size) = (%#x, %p, %d)\012\000" )
	.space	2
.LC143:
	ASCII(.ascii	"this channel totally need %d bytes memory\012\000" )
	.space	1
.LC144:
	ASCII(.ascii	"pstCfg == NULL\000" )
	.space	1
.LC145:
	ASCII(.ascii	"VCTRL_CheckChanWH return err.\012\000" )
	.space	1
.LC146:
	ASCII(.ascii	"VFMW didn't support std %d.\012\000" )
	.space	3
.LC147:
	ASCII(.ascii	"VCTRL_ConfigChan with same config paramater.\012\000" )
	.space	2
.LC148:
	ASCII(.ascii	"can NOT VCTRL_PartitionMemForStdUser\012\000" )
	.space	2
.LC149:
	ASCII(.ascii	"chan %d: new ChanErrThr = %d\012\000" )
	.space	2
.LC150:
	ASCII(.ascii	"chan %d: new DecOrderOutput = %d\012\000" )
	.space	2
.LC151:
	ASCII(.ascii	"chan %d: new DecMode = %d\012\000" )
	.space	1
.LC152:
	ASCII(.ascii	"chan %d: GetChanCfg failed!\012\000" )
	.space	3
.LC153:
	ASCII(.ascii	"chan %d: new StrmOFThr = %d\012\000" )
	.space	3
.LC154:
	ASCII(.ascii	"USE_FF_APT_EN = %d\012\000" )
.LC155:
	ASCII(.ascii	"USE_FF_APT_EN can NOT be set to %d, must be 0 or 1\012" )
	ASCII(.ascii	"\000" )
.LC156:
	ASCII(.ascii	"ResetCreateNewSave = %d\012\000" )
	.space	3
.LC157:
	ASCII(.ascii	"ResetCreateNewSave can NOT be set to %d, must be 0 " )
	ASCII(.ascii	"or 1\012\000" )
	.space	3
.LC158:
	ASCII(.ascii	"NO SUCH CHANNEL : %d\012\000" )
	.space	2
.LC159:
	ASCII(.ascii	"Pay attention to  CHANNEL : %d\012\000" )
.LC160:
	ASCII(.ascii	"print memory tracer...\012\000" )
.LC161:
	ASCII(.ascii	"OK create file '%s' for channel %d raw stream save\012" )
	ASCII(.ascii	"\000" )
.LC162:
	ASCII(.ascii	"failed create file '%s' for raw stream save!\012\000" )
	.space	2
.LC163:
	ASCII(.ascii	">>>> close raw stream saving >>>>\012\000" )
	.space	1
.LC164:
	ASCII(.ascii	"OK create file '%s' for channel %d seg stream save\012" )
	ASCII(.ascii	"\000" )
.LC165:
	ASCII(.ascii	"failed create file '%s' for seg stream save!\012\000" )
	.space	2
.LC166:
	ASCII(.ascii	">>>> close seg stream saving >>>>\012\000" )
	.space	1
.LC167:
	ASCII(.ascii	"Failed Alloc VFMW_BigTile1d_YUV for yuv save!\012\000" )
	.space	1
.LC168:
	ASCII(.ascii	"OK create file '%s' for chan %d yuv save.(crop %d)\012" )
	ASCII(.ascii	"\000" )
.LC169:
	ASCII(.ascii	"failed create file '%s' for yuv save!\012\000" )
	.space	1
.LC170:
	ASCII(.ascii	"OK close yuv save.\012\000" )
.LC171:
	ASCII(.ascii	"address '0x%x' is not valid!\012\000" )
	.space	2
.LC172:
	ASCII(.ascii	"2d image has been saved to '%s'\012\000" )
	.space	3
.LC173:
	ASCII(.ascii	"open file '%s' fail!\012\000" )
	.space	2
.LC174:
	ASCII(.ascii	"1d image has been saved to '%s'\012\000" )
	.space	3
.LC175:
	ASCII(.ascii	"stop chan %d: VCTRL_StopChan return %d\012\000" )
.LC176:
	ASCII(.ascii	"reset chan %d: VCTRL_ResetChan return %d\012\000" )
	.space	2
.LC177:
	ASCII(.ascii	"start chan %d: VCTRL_StartChan return %d\012\000" )
	.space	2
.LC178:
	ASCII(.ascii	"------ dec task delay %d ms ------\012\000" )
.LC179:
	ASCII(.ascii	"------ dnr active per %d ms ------\012\000" )
.LC180:
	ASCII(.ascii	"------ dec stop = %d ------\012\000" )
	.space	3
.LC181:
	ASCII(.ascii	"------ g_TraceCtrl = %x ------\012\000" )
.LC182:
	ASCII(.ascii	"------ g_TraceBsPeriod = %x ------\012\000" )
.LC183:
	ASCII(.ascii	"------ g_TraceFramePeriod = %x ------\012\000" )
	.space	1
.LC184:
	ASCII(.ascii	"------ g_TraceImgPeriod = %x ------\012\000" )
	.space	3
.LC185:
	ASCII(.ascii	"The channel number is to Large.\012\000" )
	.space	3
.LC186:
	ASCII(.ascii	"------ s_pstVfmwChan[%d]->stSynExtraData.s32ModuleL" )
	ASCII(.ascii	"owlyEnable = 1 ------\012\000" )
	.space	2
.LC187:
	ASCII(.ascii	"------ Set SCD[%d] to work  ------\012\000" )
.LC188:
	ASCII(.ascii	"pOption is NULL\000" )
.LC189:
	ASCII(.ascii	"vdm_ctrl.c,L%d: pOption->s32KeepBS error\012\000" )
	.space	2
.LC190:
	ASCII(.ascii	"vdm_ctrl.c,L%d: %s\012\000" )
.LC191:
	ASCII(.ascii	"This Chan has not been created or has been destroye" )
	ASCII(.ascii	"d !!!\000" )
	.space	3
.LC192:
	ASCII(.ascii	"can NOT stop a not-opened Chan\000" )
	.space	1
.LC193:
	ASCII(.ascii	"WARNNING: ScdLowdlyEnable = %d, VidStd = %d, eDSPSt" )
	ASCII(.ascii	"ate = %d AVS(+) and LOWDLY  cannot supported in the" )
	ASCII(.ascii	" same time!!!\012\000" )
	.space	3
.LC194:
	ASCII(.ascii	"DFS, framsize wrong! framesize: 0x%x\012\000" )
	.space	2
.LC195:
	ASCII(.ascii	"%s, %d, AllocMemMMZ fail!\012\000" )
	.space	1
.LC196:
	ASCII(.ascii	"%s,can not use mmz. NeedMMZ: %d\012\000" )
	.space	3
.LC197:
	ASCII(.ascii	"%s, %d, AllocMemPre fail!\012\000" )
	.space	1
.LC198:
	ASCII(.ascii	"%s,can't use mmz. NeedMMZ: %d\012\000" )
	.space	1
.LC199:
	ASCII(.ascii	"frameBuf is NULL\000" )
	.space	3
.LC200:
	ASCII(.ascii	"VFMW: WriteBigTileYuv %dx%d...\012\000" )
.LC201:
	ASCII(.ascii	"call VCTRL_GetChanImage, ChanID = %d,\012\000" )
	.space	1
.LC202:
	ASCII(.ascii	"%s: view_0 id(%d) > view_1 id(%d), error!\012\000" )
	.space	1
.LC203:
	ASCII(.ascii	"%s: continuous view0 id(%d)!\012\000" )
	.space	2
.LC204:
	ASCII(.ascii	"%s: continuous view1 id(%d)!\012\000" )
	.bss
	.align	2
.LANCHOR0 = . + 0
.LANCHOR3 = . + 8184
	.type	s_pstVfmwChan, %object
	.size	s_pstVfmwChan, 64
s_pstVfmwChan:
	.space	64
	.type	s_VfmwCTrl, %object
	.size	s_VfmwCTrl, 176
s_VfmwCTrl:
	.space	176
	.type	s_StreamIntf, %object
	.size	s_StreamIntf, 192
s_StreamIntf:
	.space	192
	.type	FspInstInfo.17108, %object
	.size	FspInstInfo.17108, 2188
FspInstInfo.17108:
	.space	2188
	.type	g_VdmCharacter, %object
	.size	g_VdmCharacter, 4
g_VdmCharacter:
	.space	4
	.type	g_event_report, %object
	.size	g_event_report, 4
g_event_report:
	.space	4
	.type	last_rec_pos_time.17352, %object
	.size	last_rec_pos_time.17352, 64
last_rec_pos_time.17352:
	.space	64
	.type	extra_ref, %object
	.size	extra_ref, 4
extra_ref:
	.space	4
	.type	extra_disp, %object
	.size	extra_disp, 4
extra_disp:
	.space	4
	.type	cmdline, %object
	.size	cmdline, 1024
cmdline:
	.space	1024
	.type	extra_cmd, %object
	.size	extra_cmd, 4
extra_cmd:
	.space	4
	.type	g_allow_B_before_P, %object
	.size	g_allow_B_before_P, 1
g_allow_B_before_P:
	.space	1
	.type	g_not_allow_H264FullPictureRepair_flag, %object
	.size	g_not_allow_H264FullPictureRepair_flag, 1
g_not_allow_H264FullPictureRepair_flag:
	.space	1
	.type	g_apple_airplay_mirrorinig_flag, %object
	.size	g_apple_airplay_mirrorinig_flag, 1
g_apple_airplay_mirrorinig_flag:
	.space	1
	.space	1
	.type	g_DSPState, %object
	.size	g_DSPState, 64
g_DSPState:
	.space	64
	.type	last_rec_pos_time.17665, %object
	.size	last_rec_pos_time.17665, 64
last_rec_pos_time.17665:
	.space	64
	.type	last_rec_pos_decparam_time.17666, %object
	.size	last_rec_pos_decparam_time.17666, 64
last_rec_pos_decparam_time.17666:
	.space	64
	.type	ChanPriTab.17626, %object
	.size	ChanPriTab.17626, 64
ChanPriTab.17626:
	.space	64
	.type	g_VfmwChanStat, %object
	.size	g_VfmwChanStat, 4800
g_VfmwChanStat:
	.space	4800
	.type	g_SleepTime, %object
	.size	g_SleepTime, 4
g_SleepTime:
	.space	4
	.type	g_StopDec, %object
	.size	g_StopDec, 4
g_StopDec:
	.space	4
	.type	PrioArray.17207, %object
	.size	PrioArray.17207, 64
PrioArray.17207:
	.space	64
	.type	g_ResetCreateNewSave, %object
	.size	g_ResetCreateNewSave, 4
g_ResetCreateNewSave:
	.space	4
	.type	vfmw_save_str_file, %object
	.size	vfmw_save_str_file, 128
vfmw_save_str_file:
	.space	128
	.type	pOption, %object
	.size	pOption, 4
pOption:
	.space	4
	.type	s_ChanControlState, %object
	.size	s_ChanControlState, 64
s_ChanControlState:
	.space	64
	.type	Capability.17254, %object
	.size	Capability.17254, 148
Capability.17254:
	.space	148
	.type	PrioArray.17253, %object
	.size	PrioArray.17253, 64
PrioArray.17253:
	.space	64
	.type	g_CurProcChan, %object
	.size	g_CurProcChan, 4
g_CurProcChan:
	.space	4
	.type	save_file_cnt.17790, %object
	.size	save_file_cnt.17790, 4
save_file_cnt.17790:
	.space	4
	.type	save_str_chan_num, %object
	.size	save_str_chan_num, 4
save_str_chan_num:
	.space	4
	.type	vfmw_save_seg_file, %object
	.size	vfmw_save_seg_file, 128
vfmw_save_seg_file:
	.space	128
	.type	save_file_cnt.17793, %object
	.size	save_file_cnt.17793, 4
save_file_cnt.17793:
	.space	4
	.type	save_seg_chan_num, %object
	.size	save_seg_chan_num, 4
save_seg_chan_num:
	.space	4
	.type	vfmw_save_yuv_file, %object
	.size	vfmw_save_yuv_file, 128
vfmw_save_yuv_file:
	.space	128
	.type	save_file_cnt.17798, %object
	.size	save_file_cnt.17798, 4
save_file_cnt.17798:
	.space	4
	.type	MemRecord_YUV, %object
	.size	MemRecord_YUV, 16
MemRecord_YUV:
	.space	16
	.type	pVl, %object
	.size	pVl, 4
pVl:
	.space	4
	.type	pUl, %object
	.size	pUl, 4
pUl:
	.space	4
	.type	pY, %object
	.size	pY, 4
pY:
	.space	4
	.type	save_yuv_with_crop, %object
	.size	save_yuv_with_crop, 4
save_yuv_with_crop:
	.space	4
	.type	g_DnrSleepTime, %object
	.size	g_DnrSleepTime, 4
g_DnrSleepTime:
	.space	4
	.type	last_rec_pos_time.17341, %object
	.size	last_rec_pos_time.17341, 64
last_rec_pos_time.17341:
	.space	64
	.type	g_DnrIrqHandle, %object
	.size	g_DnrIrqHandle, 4
g_DnrIrqHandle:
	.space	4
	.type	g_VdecIrqHandle, %object
	.size	g_VdecIrqHandle, 4
g_VdecIrqHandle:
	.space	4
	.type	g_u32DFSMaxAllocTime, %object
	.size	g_u32DFSMaxAllocTime, 4
g_u32DFSMaxAllocTime:
	.space	4
	.type	g_eVdmVersion, %object
	.size	g_eVdmVersion, 4
g_eVdmVersion:
	.space	4
	.type	g_VfmwGlobalStat, %object
	.size	g_VfmwGlobalStat, 84
g_VfmwGlobalStat:
	.space	84
	.type	AcceleratorCharacter, %object
	.size	AcceleratorCharacter, 4
AcceleratorCharacter:
	.space	4
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
