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
	str	r1, [r3, #2900]
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
	ldr	r0, [r0, #2900]
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
	addne	r0, r0, #112
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
	bl	FSP_PartitionFsMemory
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
	ldr	ip, [r4, #2488]
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
	add	r4, r4, #64
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
	add	r9, r9, #227328
	ldr	r2, [r9, #868]
	ldr	r1, [r9, #860]
	ldr	r0, [r9, #864]
	bl	MEM_DelMemRecord
	ldr	r3, [r8, r6, asl #2]
	add	r5, r3, r5
	add	r5, r5, #227328
	strb	r7, [r5, #872]
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
	add	r3, r3, #227328
	ldrb	r2, [r3, #872]	@ zero_extendqisi2
	cmp	r2, #255
	beq	.L248
	cmp	r2, #1
	bne	.L249
	ldr	r1, [r3, #860]
	ldr	r0, [r3, #864]
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
	ldr	r8, [r0, #2872]
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
	add	r3, r3, #227328
	movlt	ip, #1
	ldrb	r2, [r3, #872]	@ zero_extendqisi2
	cmp	r2, #255
	movne	r2, #0
	andeq	r2, ip, #1
	cmp	r2, #0
	beq	.L259
	ldr	r0, [fp, #-48]
	mov	r1, r6
	str	r6, [r3, #860]
	add	r5, r5, #1
	add	r0, r0, r6
	str	r8, [r3, #868]
	str	r0, [r3, #864]
	mov	r2, r8
	mov	r0, #0
	strb	r0, [r3, #872]
	ldr	r0, [r3, #864]
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
	ldr	r2, [r2, #2872]
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
	add	r3, r3, #227328
	ldrb	r2, [r3, #872]	@ zero_extendqisi2
	ldr	r3, [fp, #-52]
	cmp	r1, r3
	movge	r3, #0
	movlt	r3, #1
	cmp	r2, #255
	movne	r3, #0
	cmp	r3, #0
	beq	.L274
	add	r8, r8, #227328
	mov	r1, #0
	add	r8, r8, #856
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
	add	r6, r6, #227328
	strb	r2, [r6, #872]
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r8, r1, #0
	beq	.L327
	ldr	r3, [r8, #88]
	cmp	r3, #1
	beq	.L297
	ldr	r2, [r8, #12]
	ldr	r1, [r8, #4]
	ldr	r0, [r8, #8]
	bl	MEM_DelMemRecord
.L298:
	ldr	r2, [r8, #28]
	cmp	r2, #0
	bne	.L328
	ldr	r3, [r8, #64]
	cmp	r3, #1
	beq	.L329
.L304:
	ldr	r3, [r8, #68]
	cmp	r3, #1
	beq	.L330
.L305:
	ldr	r3, [r8, #72]
	cmp	r3, #1
	beq	.L331
.L306:
	ldr	r3, .L333
	ldr	r0, [r8, #36]
	ldr	r3, [r3, #168]
	blx	r3
.L307:
	ldr	r2, [r8, #44]
	ldr	r1, [r8, #36]
	ldr	r0, [r8, #40]
	bl	MEM_DelMemRecord
	add	r0, r8, #48
	bl	SM_DeletDSPCtxMem
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L331:
	ldr	r0, [r8, #40]
	cmp	r0, #0
	beq	.L306
	ldr	r1, [r8, #36]
	bl	MEM_ReleaseMemBlock
	b	.L307
.L297:
	ldr	r7, .L333
	mov	r5, #0
	mvn	r6, #0
	b	.L302
.L301:
	ldr	r3, [r8, #92]
	add	r3, r3, r5
	strb	r6, [r3, #16]
.L299:
	add	r5, r5, #20
	cmp	r5, #640
	beq	.L298
.L302:
	ldr	r4, [r8, #92]
	add	r4, r4, r5
	ldrb	r3, [r4, #16]	@ zero_extendqisi2
	cmp	r3, #255
	beq	.L299
	cmp	r3, #1
	beq	.L332
.L300:
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_DelMemRecord
	cmp	r0, #0
	beq	.L301
	ldr	r2, [r4, #8]
	mov	r0, #1
	ldr	r3, [r7, #68]
	ldr	r1, .L333+4
	blx	r3
	b	.L301
.L332:
	ldr	r3, [r7, #68]
	mov	r0, #31
	ldr	r1, .L333+8
	blx	r3
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_ReleaseMemBlock
	b	.L300
.L328:
	ldr	r1, [r8, #20]
	ldr	r0, [r8, #24]
	bl	MEM_DelMemRecord
	ldr	r3, [r8, #64]
	cmp	r3, #1
	bne	.L304
.L329:
	ldr	r0, [r8, #8]
	cmp	r0, #0
	beq	.L304
	ldr	r1, [r8, #4]
	bl	MEM_ReleaseMemBlock
	b	.L304
.L330:
	ldr	r0, [r8, #24]
	cmp	r0, #0
	beq	.L305
	ldr	r1, [r8, #20]
	bl	MEM_ReleaseMemBlock
	b	.L305
.L327:
	ldr	ip, .L333
	mov	r0, r8
	ldr	r3, .L333+12
	movw	r2, #1527
	ldr	r1, .L333+16
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L334:
	.align	2
.L333:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC34
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
	movweq	r3, #56880
	movwne	r3, #27784
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
	bhi	.L343
	cmp	r1, #0
	beq	.L344
	ldr	r2, .L346
	ldr	ip, .L346+4
	ldr	r1, [r2, r0, asl #2]
	cmp	r1, #0
	beq	.L345
	add	r1, r1, #48
	mov	r0, r3
	mov	r2, #104
	ldr	r3, [ip, #52]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L343:
	ldr	ip, .L346+4
	movw	r2, #2710
	ldr	r3, .L346+8
	mov	r0, #0
	ldr	r1, .L346+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L345:
	mov	r0, r1
	ldr	r3, .L346+16
	movw	r2, #2712
	ldr	r1, .L346+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L344:
	ldr	ip, .L346+4
	mov	r0, r1
	ldr	r3, .L346+20
	movw	r2, #2711
	ldr	r1, .L346+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L347:
	.align	2
.L346:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC2
	.word	.LC35
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
	ldr	r3, .L367
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r3, #528]
	cmp	r2, #20
	beq	.L364
	ldr	r2, [r3, #48]
	ldr	r0, [r1]
	cmp	r2, r0
	bne	.L364
	ldr	ip, [r3, #64]
	ldr	r0, [r1, #16]
	cmp	ip, r0
	bne	.L364
	ldr	ip, [r3, #60]
	ldr	r0, [r1, #12]
	cmp	ip, r0
	bne	.L364
	ldr	ip, [r3, #68]
	ldr	r0, [r1, #20]
	cmp	ip, r0
	bne	.L364
	ldr	ip, [r3, #72]
	ldr	r0, [r1, #24]
	cmp	ip, r0
	bne	.L364
	ldr	ip, [r3, #76]
	ldr	r0, [r1, #28]
	cmp	ip, r0
	bne	.L364
	ldr	ip, [r3, #80]
	ldr	r0, [r1, #32]
	cmp	ip, r0
	bne	.L364
	ldr	ip, [r3, #100]
	ldr	r0, [r1, #52]
	cmp	ip, r0
	bne	.L364
	ldr	ip, [r3, #112]
	ldr	r0, [r1, #64]
	cmp	ip, r0
	bne	.L364
	ldr	ip, [r3, #108]
	ldr	r0, [r1, #60]
	cmp	ip, r0
	bne	.L364
	ldr	ip, [r3, #104]
	ldr	r0, [r1, #56]
	cmp	ip, r0
	bne	.L364
	ldr	ip, [r3, #116]
	ldr	r0, [r1, #68]
	cmp	ip, r0
	bne	.L364
	cmp	r2, #1
	beq	.L366
	sub	r2, r2, #10
	cmp	r2, #2
	bhi	.L365
	ldr	r3, [r3, #52]
	ldr	r0, [r1, #4]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L364:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L365:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L366:
	ldr	r0, [r3, #52]
	ldr	r2, [r1, #4]
	cmp	r0, r2
	bne	.L364
	ldr	r3, [r3, #56]
	ldr	r0, [r1, #8]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L368:
	.align	2
.L367:
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
	ldr	r3, .L374
	ldr	r2, .L374+4
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r2]
	ldr	r0, [r3, #1272]
	ldr	r3, [r3, #1276]
	cmp	r0, r2
	bgt	.L370
	ldr	r0, .L374+8
	ldr	r0, [r0]
	cmp	r3, r0
	ble	.L372
.L370:
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
	ldr	ip, .L374+12
	mov	r0, #0
	ldr	r3, .L374+8
	ldr	r1, .L374+16
	ldr	r4, [ip, #68]
	ldr	r3, [r3]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L372:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L375:
	.align	2
.L374:
	.word	.LANCHOR0
	.word	g_ChipMaxWidth
	.word	g_ChipMaxHeight
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC36
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
	beq	.L384
	cmp	r0, #15
	bhi	.L385
	ldr	r2, .L388
	ldr	r3, [r2, r0, asl #2]
	cmp	r3, #0
	beq	.L386
	ldr	r3, [r3, #528]
	sub	ip, r3, #10
	cmp	ip, #2
	bls	.L387
.L381:
	cmp	r3, #15
	cmpne	r3, #4
	beq	.L383
	bl	SM_SeekPts
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L387:
	ldr	r2, [r2, #2492]
	tst	r2, #1
	bne	.L381
.L383:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L385:
	ldr	ip, .L388+4
	movw	r2, #3161
	ldr	r3, .L388+8
	mov	r0, #0
	ldr	r1, .L388+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L384:
	ldr	ip, .L388+4
	mov	r0, r1
	ldr	r3, .L388+16
	movw	r2, #3160
	ldr	r1, .L388+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L386:
	ldr	ip, .L388+4
	mov	r0, r3
	movw	r2, #3162
	ldr	r3, .L388+20
	ldr	r1, .L388+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L389:
	.align	2
.L388:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC37
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
	bhi	.L394
	ldr	r2, .L396
	ldr	r3, [r2, r0, asl #2]
	cmp	r3, #0
	beq	.L395
	bl	SM_Reset
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L394:
	ldr	ip, .L396+4
	movw	r2, #3617
	ldr	r3, .L396+8
	mov	r0, #0
	ldr	r1, .L396+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L395:
	ldr	ip, .L396+4
	mov	r0, r3
	movw	r2, #3618
	ldr	r3, .L396+16
	ldr	r1, .L396+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L397:
	.align	2
.L396:
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
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #508)
	sub	sp, sp, #508
	cmp	r0, #15
	mov	r4, r0
	mov	r5, r1
	bhi	.L419
	ldr	r8, .L427
	ldr	r0, [r8, r0, asl #2]
	cmp	r0, #0
	beq	.L420
	ldr	r3, [r0, #12]
	cmp	r3, #1
	bne	.L421
	cmp	r1, #0
	beq	.L422
	ldr	r6, .L427+4
	mov	r2, r4
	ldr	r3, [r1, #196]
	mov	r0, #2
	ldr	r1, .L427+8
	ldr	r7, [r6, #68]
	blx	r7
	ldr	r3, [r6, #12]
	mov	r0, #4
	blx	r3
	ldr	r0, [r8, r4, asl #2]
	cmp	r0, #0
	beq	.L423
	ldr	r3, [r0, #12]
	cmp	r3, #1
	bne	.L424
	add	r0, r0, #229376
	mov	r1, r5
	add	r0, r0, #112
	bl	SYNTAX_ReleaseImage
	ldr	r3, [r5, #252]
	cmn	r3, #1
	mov	r7, r0
	beq	.L406
	ldr	r0, [r8, r4, asl #2]
	sub	r1, fp, #540
	str	r3, [fp, #-344]
	add	r0, r0, #229376
	add	r0, r0, #112
	bl	SYNTAX_ReleaseImage
	mov	r7, r0
.L406:
	mov	r0, #13
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L425
.L408:
	subs	r4, r7, #1
	mvnne	r4, #0
	cmp	r4, #0
	bne	.L426
.L410:
	ldr	r3, [r6, #16]
	mov	r0, #4
	blx	r3
.L400:
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L426:
	ldr	r3, [r6, #68]
	mov	r0, #0
	ldr	r2, .L427+12
	ldr	r1, .L427+16
	blx	r3
	b	.L410
.L425:
	ldr	r3, [r6]
	add	r8, r8, r4, lsl #2
	blx	r3
	ldr	r2, .L427+20
	ldr	r3, [r8, #2496]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	mov	ip, r0
	cmp	r3, r2
	bls	.L408
	mov	r2, r4, asl #24
	movw	r1, #4220
	add	r2, r2, #851968
	ldr	r0, .L427+24
	cmp	r7, #1
	addeq	r2, r2, #1
	str	ip, [r8, #2496]
	bl	DBG_AddTrace
	b	.L408
.L424:
	ldr	r3, [r6, #68]
	movw	r2, #4122
	ldr	r1, .L427+28
	mov	r0, #0
.L418:
	blx	r3
	ldr	r3, [r6, #16]
	mov	r0, #4
	mvn	r4, #0
	blx	r3
	b	.L400
.L421:
	ldr	ip, .L427+4
	movw	r2, #4103
	ldr	r3, .L427+32
.L417:
	ldr	r1, .L427+36
	mov	r0, #0
	ldr	r5, [ip, #68]
	mvn	r4, #0
	blx	r5
	b	.L400
.L419:
	ldr	ip, .L427+4
	movw	r2, #4101
	ldr	r3, .L427+40
	b	.L417
.L422:
	ldr	ip, .L427+4
	mov	r0, r1
	ldr	r3, .L427+44
	movw	r2, #4104
	ldr	r1, .L427+36
	mvn	r4, #0
	ldr	r5, [ip, #68]
	blx	r5
	b	.L400
.L420:
	ldr	ip, .L427+4
	movw	r2, #4102
	ldr	r3, .L427+48
	mvn	r4, #0
	ldr	r1, .L427+36
	ldr	r5, [ip, #68]
	blx	r5
	b	.L400
.L423:
	ldr	r3, [r6, #68]
	movw	r2, #4112
	ldr	r1, .L427+52
	b	.L418
.L428:
	.align	2
.L427:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC40
	.word	.LANCHOR1+96
	.word	.LC43
	.word	g_TraceImgPeriod
	.word	.LANCHOR1+72
	.word	.LC42
	.word	.LC38
	.word	.LC1
	.word	.LC6
	.word	.LC39
	.word	.LC2
	.word	.LC41
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
	bhi	.L430
	ldr	r3, .L434
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L430
	ldr	r2, [r3, #12]
	cmp	r2, #1
	beq	.L433
	ldr	ip, .L434+4
	mov	r3, r0
	movw	r2, #4272
	ldr	r1, .L434+8
	mov	r0, #0
	ldr	r4, [ip, #68]
	blx	r4
	mov	r0, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L430:
	ldr	r3, .L434+4
	movw	r2, #4265
	ldr	r1, .L434+12
	mov	r0, #0
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L433:
	ldr	r0, [r3, #528]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L435:
	.align	2
.L434:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC45
	.word	.LC44
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
	bhi	.L437
	ldr	r3, .L462
	ldr	r4, [r3, r0, asl #2]
	cmp	r4, #0
	beq	.L437
	ldr	r2, [r4, #12]
	cmp	r2, #1
	bne	.L458
	ldr	r2, [r4, #16]
	cmp	r2, #1
	bne	.L458
	ldr	r2, [r4, #528]
	cmp	r2, #17
	ldrls	pc, [pc, r2, asl #2]
	b	.L458
.L442:
	.word	.L441
	.word	.L461
	.word	.L444
	.word	.L461
	.word	.L458
	.word	.L461
	.word	.L461
	.word	.L458
	.word	.L461
	.word	.L461
	.word	.L450
	.word	.L450
	.word	.L450
	.word	.L461
	.word	.L458
	.word	.L458
	.word	.L452
	.word	.L453
.L458:
	mov	r3, #0
.L439:
	mov	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L450:
	ldr	r3, [r3, #2492]
	ands	r3, r3, #1
	beq	.L439
.L461:
	add	r3, r4, #229376
	ldr	r5, [r3, #124]
.L440:
	cmp	r5, #0
	beq	.L458
	ldr	r3, .L462+4
	ldr	r3, [r3]
	blx	r3
	mov	r3, r5
	str	r0, [r4, #44]
	mov	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L437:
	ldr	ip, .L462+4
	mov	r3, r0
	movw	r2, #4289
	ldr	r1, .L462+8
	mov	r0, #22
	ldr	r4, [ip, #68]
	blx	r4
	mov	r3, #0
	b	.L439
.L441:
	add	r3, r4, #229376
	ldr	r5, [r3, #480]
	b	.L440
.L452:
	add	r3, r4, #229376
	ldr	r5, [r3, #348]
	b	.L440
.L453:
	add	r3, r4, #229376
	ldr	r5, [r3, #2432]
	b	.L440
.L444:
	add	r3, r4, #229376
	ldr	r5, [r3, #1156]
	b	.L440
.L463:
	.align	2
.L462:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC46
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
	bhi	.L465
	ldr	r5, .L476
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	beq	.L465
	ldr	r1, [r3, #12]
	cmp	r1, #1
	bne	.L468
	ldr	r6, [r3, #16]
	cmp	r6, #1
	beq	.L469
.L468:
	ldr	r3, .L476+4
	mov	r0, #22
	ldr	r1, .L476+8
	mov	r4, #0
	ldr	r3, [r3, #68]
	blx	r3
.L467:
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L465:
	ldr	ip, .L476+4
	mov	r3, r2
	ldr	r1, .L476+12
	movw	r2, #4408
	mov	r0, #22
	mov	r4, #0
	ldr	r5, [ip, #68]
	blx	r5
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L469:
	str	r0, [fp, #-40]
	bl	VCTRL_GetDecParam
	ldr	r2, [fp, #-40]
	subs	r7, r0, #0
	beq	.L474
	ldr	r2, [r5, r2, asl #2]
	mov	r3, #0
	mov	r4, r3
	str	r3, [r2, #328]
	str	r3, [r2, #332]
	b	.L467
.L474:
	ldr	r8, [r5, r2, asl #2]
	ldr	r4, [r8, #328]
	cmp	r4, #0
	beq	.L475
	ldr	r3, .L476+4
	str	r2, [fp, #-40]
	ldr	r3, [r3]
	blx	r3
	ldr	r2, [fp, #-40]
	ldr	r3, [r5, r2, asl #2]
	ldr	r2, [r3, #332]
	cmp	r0, r2
	bls	.L472
	rsb	r0, r2, r0
	cmp	r0, #40
	movls	r4, r7
	bls	.L467
.L472:
	str	r7, [r3, #328]
	mov	r4, r6
	str	r7, [r3, #332]
	b	.L467
.L475:
	ldr	r3, .L476+4
	str	r6, [r8, #328]
	ldr	r3, [r3]
	blx	r3
	str	r0, [r8, #332]
	b	.L467
.L477:
	.align	2
.L476:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC47
	.word	.LC46
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
	bhi	.L505
	ldr	r5, .L509
	ldr	r0, [r5, r0, asl #2]
	cmp	r0, #0
	beq	.L506
	add	r0, r0, #229376
	ldr	r3, [r0, #112]
	cmp	r3, #17
	ldrls	pc, [pc, r3, asl #2]
	b	.L498
.L483:
	.word	.L482
	.word	.L484
	.word	.L485
	.word	.L486
	.word	.L498
	.word	.L487
	.word	.L488
	.word	.L498
	.word	.L489
	.word	.L490
	.word	.L491
	.word	.L491
	.word	.L491
	.word	.L492
	.word	.L498
	.word	.L498
	.word	.L493
	.word	.L494
.L494:
	add	r0, r0, #120
	ldr	r4, .L509+4
	bl	HEVC_FlushOutputFrmFromDPB
	cmp	r0, #0
	bne	.L507
.L496:
	ldr	r3, [r4, #68]
	mov	r0, #32
	ldr	r1, .L509+8
	blx	r3
	bl	VDMDRV_WakeUpVdm
	bl	VDMDRV_WakeUpVdm
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L482:
	add	r0, r0, #120
	bl	H264_FlushDecoder
	bl	VDMDRV_WakeUpVdm
	bl	VDMDRV_WakeUpVdm
	ldr	r0, [r5, r4, asl #2]
	add	r0, r0, #229376
	add	r0, r0, #120
	bl	FlushDPB
	cmp	r0, #0
	bne	.L508
.L498:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L484:
	add	r0, r0, #120
	bl	VC1DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L485:
	add	r0, r0, #120
	bl	MPEG4DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L486:
	add	r0, r0, #120
	bl	MPEG2DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L487:
	add	r0, r0, #120
	bl	DIVX3DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L488:
	add	r0, r0, #120
	bl	AVSDEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L489:
	add	r0, r0, #120
	bl	REAL8DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L490:
	add	r0, r0, #120
	bl	REAL9DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L491:
	add	r0, r0, #120
	bl	VP6DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L492:
	add	r0, r0, #120
	bl	VP8DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L493:
	add	r0, r0, #120
	bl	MVC_FlushDecoder
	bl	VDMDRV_WakeUpVdm
	bl	VDMDRV_WakeUpVdm
	ldr	r0, [r5, r4, asl #2]
	mvn	r1, #0
	add	r0, r0, #229376
	add	r0, r0, #120
	bl	MVC_FlushDPB
	cmp	r0, #0
	beq	.L498
	ldr	ip, .L509+4
	movw	r3, #4720
	ldr	r2, .L509+12
	mov	r0, #22
	ldr	r1, .L509+16
	ldr	r4, [ip, #68]
	blx	r4
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L507:
	movw	r2, #4703
	ldr	r1, .L509+20
	ldr	r3, [r4, #68]
	mov	r0, #0
	blx	r3
	b	.L496
.L508:
	ldr	r3, .L509+4
	movw	r2, #4693
	ldr	r1, .L509+20
	mov	r0, #22
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L505:
	ldr	ip, .L509+4
	movw	r2, #4666
	ldr	r3, .L509+24
	mov	r0, #0
	ldr	r1, .L509+28
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L506:
	ldr	ip, .L509+4
	movw	r2, #4667
	ldr	r3, .L509+32
	ldr	r1, .L509+28
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L510:
	.align	2
.L509:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC49
	.word	.LANCHOR1+120
	.word	.LC50
	.word	.LC48
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
	bhi	.L534
	ldr	r1, .L537
	ldr	r3, [r1, r0, asl #2]
	cmp	r3, #0
	beq	.L535
	ldr	r0, [r3, #16]
	cmp	r0, #1
	bne	.L536
	ldr	r2, [r3, #528]
	cmp	r2, #17
	ldrls	pc, [pc, r2, asl #2]
	b	.L529
.L517:
	.word	.L516
	.word	.L518
	.word	.L519
	.word	.L520
	.word	.L529
	.word	.L521
	.word	.L522
	.word	.L529
	.word	.L523
	.word	.L524
	.word	.L525
	.word	.L525
	.word	.L525
	.word	.L526
	.word	.L529
	.word	.L529
	.word	.L527
	.word	.L528
.L528:
	add	r0, r3, #229376
	add	r0, r0, #120
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	HEVCDEC_GetImageBuffer
.L516:
	add	r0, r3, #229376
	add	r0, r0, #120
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	H264DEC_GetImageBuffer
.L518:
	add	r0, r3, #229376
	add	r0, r0, #120
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	VC1DEC_GetImageBuffer
.L519:
	add	r0, r3, #229376
	add	r0, r0, #120
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	MPEG4DEC_GetImageBuffer
.L520:
	add	r0, r3, #229376
	add	r0, r0, #120
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	MPEG2DEC_GetImageBuffer
.L521:
	add	r0, r3, #229376
	add	r0, r0, #120
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	DIVX3DEC_GetImageBuffer
.L522:
	add	r0, r3, #229376
	add	r0, r0, #120
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	AVSDEC_GetImageBuffer
.L523:
	add	r0, r3, #229376
	add	r0, r0, #120
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	REAL8DEC_GetImageBuffer
.L524:
	add	r0, r3, #229376
	add	r0, r0, #120
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	REAL9DEC_GetImageBuffer
.L525:
	ldr	r2, [r1, #2492]
	tst	r2, #1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	add	r0, r3, #229376
	add	r0, r0, #120
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	VP6DEC_GetImageBuffer
.L526:
	add	r0, r3, #229376
	add	r0, r0, #120
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	VP8DEC_GetImageBuffer
.L527:
	add	r0, r3, #229376
	add	r0, r0, #120
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	MVC_DEC_GetImageBuffer
.L529:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L536:
	ldr	ip, .L537+4
	movw	r2, #4785
	ldr	r3, .L537+8
.L533:
	ldr	r1, .L537+12
	mov	r0, #0
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L534:
	ldr	ip, .L537+4
	movw	r2, #4783
	ldr	r3, .L537+16
	b	.L533
.L535:
	ldr	ip, .L537+4
	mov	r0, r3
	movw	r2, #4784
	ldr	r3, .L537+20
	ldr	r1, .L537+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L538:
	.align	2
.L537:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC52
	.word	.LC1
	.word	.LC51
	.word	.LC38
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
	bhi	.L546
	ldr	r3, .L550
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L547
	ldr	r2, [r3, #12]
	cmp	r2, #1
	bne	.L548
	cmp	r1, #0
	beq	.L549
	ldr	r2, [r1]
	mov	r0, #0
	str	r2, [r3, #1220]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L548:
	ldr	ip, .L550+4
	movw	r2, #4890
	ldr	r3, .L550+8
.L545:
	ldr	r1, .L550+12
	mov	r0, #0
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L546:
	ldr	ip, .L550+4
	movw	r2, #4888
	ldr	r3, .L550+16
	b	.L545
.L547:
	ldr	ip, .L550+4
	mov	r0, r3
	movw	r2, #4889
	ldr	r3, .L550+20
	ldr	r1, .L550+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L549:
	ldr	ip, .L550+4
	mov	r0, r1
	ldr	r3, .L550+24
	movw	r2, #4891
	ldr	r1, .L550+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L551:
	.align	2
.L550:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC54
	.word	.LC1
	.word	.LC6
	.word	.LC53
	.word	.LC55
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
	bhi	.L559
	ldr	r3, .L563
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L560
	ldr	r3, [r0, #12]
	cmp	r3, #1
	bne	.L561
	cmp	r1, #0
	beq	.L562
	ldr	r3, .L563+4
	add	r0, r0, #1232
	mov	r2, #20
	add	r0, r0, #8
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L561:
	ldr	ip, .L563+4
	movw	r2, #4903
	ldr	r3, .L563+8
.L558:
	ldr	r1, .L563+12
	mov	r0, #0
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L559:
	ldr	ip, .L563+4
	movw	r2, #4901
	ldr	r3, .L563+16
	b	.L558
.L562:
	ldr	ip, .L563+4
	mov	r0, r1
	ldr	r3, .L563+20
	movw	r2, #4904
	ldr	r1, .L563+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L560:
	ldr	ip, .L563+4
	movw	r2, #4902
	ldr	r3, .L563+24
	ldr	r1, .L563+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L564:
	.align	2
.L563:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC54
	.word	.LC1
	.word	.LC6
	.word	.LC55
	.word	.LC53
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
	bhi	.L568
	ldr	r5, .L574
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	beq	.L568
	sub	r1, fp, #44
	bl	SM_GetInfo
	cmp	r0, #0
	bne	.L568
	ldr	r3, [fp, #-36]
	cmp	r3, #16
	bgt	.L569
	ldr	r3, [fp, #-28]
	cmp	r3, #524288
	ble	.L568
.L569:
	mov	r0, r4
	bl	VCTRL_GetImageBuffer
	subs	r0, r0, #1
	mvnne	r0, #0
	cmp	r0, #0
	bne	.L567
	ldr	r3, .L574+4
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
.L568:
	mvn	r0, #0
.L567:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L575:
	.align	2
.L574:
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
	bhi	.L579
	ldr	r3, .L580
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L579
	ldr	r0, [r3, #316]
	subs	r0, r0, #1
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L579:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L581:
	.align	2
.L580:
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
	bhi	.L588
	ldr	r3, .L589
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L588
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L588
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L588
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L588
	ldr	r0, [r3, #528]
	cmp	r0, #20
	movne	r0, #0
	mvneq	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L588:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L590:
	.align	2
.L589:
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
	ldr	r5, .L608
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
	ldr	r0, .L608+4
	mov	r2, #0
	str	r6, [r4]
.L595:
	ldr	r1, [r0], #4
	cmp	r1, #0
	add	r3, r1, #229376
	add	r3, r3, #120
	beq	.L592
	cmp	r4, r3
	beq	.L607
.L592:
	add	r2, r2, #1
	cmp	r2, #16
	bne	.L595
	mvn	r3, #0
	str	r3, [r4, #360]
.L593:
	ldr	r3, [r5, #68]
	mov	r0, #0
	ldr	r1, .L608+8
	blx	r3
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L607:
	cmn	r2, #1
	str	r2, [r4, #360]
	beq	.L593
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L609:
	.align	2
.L608:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC56
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
	beq	.L612
	mov	r2, #0
	ldr	r0, [r4, #360]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #360]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L613
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
.L613:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L612:
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
	bhi	.L633
	ldr	r6, .L640
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L634
	ldr	r2, [r3, #528]
	cmp	r2, #19
	bne	.L635
	ldr	r3, [r3, #468]
	cmp	r3, #2
	ble	.L636
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	bne	.L637
	mov	r1, r0
	mov	r0, r4
	bl	FSP_NewLogicFs
	subs	r8, r0, #0
	blt	.L638
	mov	r1, r8
	mov	r0, r4
	bl	FSP_GetLogicFs
	ldr	r9, .L640+4
	mov	r2, r8
	ldr	r1, .L640+8
	ldr	r3, [r9, #68]
	mov	r5, r0
	mov	r0, #18
	blx	r3
	cmp	r5, #0
	beq	.L639
	ldr	r2, [r5, #520]
	cmp	r2, #0
	beq	.L623
	ldr	r3, [r5, #524]
	cmp	r3, #0
	beq	.L623
	ldr	r1, [r5, #528]
	cmp	r1, #0
	beq	.L623
	ldr	ip, [r1, #12]
	mov	r0, #18
	ldr	r3, [r3, #12]
	ldr	r2, [r2, #12]
	ldr	r8, [r9, #68]
	ldr	r1, .L640+12
	str	ip, [sp]
	blx	r8
	ldr	r3, [r5, #520]
	mov	r0, #0
	ldr	r3, [r3, #12]
	str	r3, [r7]
	ldr	r3, [r6, r4, asl #2]
	ldr	r3, [r3, #464]
	str	r3, [r7, #8]
.L616:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L637:
	ldr	r3, .L640+4
	mov	r0, #0
	ldr	r1, .L640+16
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L616
.L635:
	ldr	r3, .L640+4
	mov	r0, #0
	ldr	r1, .L640+20
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L616
.L636:
	ldr	r3, .L640+4
	mov	r0, #0
	ldr	r1, .L640+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L616
.L623:
	ldr	r3, [r9, #68]
	mov	r0, #0
	ldr	r1, .L640+28
	blx	r3
	mvn	r0, #0
	b	.L616
.L633:
	ldr	ip, .L640+4
	movw	r2, #5272
	ldr	r3, .L640+32
	mov	r0, #0
	ldr	r1, .L640+36
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L616
.L638:
	ldr	r3, .L640+4
	mov	r0, #0
	ldr	r1, .L640+40
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L616
.L634:
	ldr	ip, .L640+4
	mov	r0, r3
	movw	r2, #5273
	ldr	r3, .L640+44
	ldr	r1, .L640+36
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L616
.L639:
	ldr	r3, [r9, #68]
	movw	r2, #5309
	ldr	r1, .L640+48
	mov	r0, #22
	blx	r3
	mvn	r0, #0
	b	.L616
.L641:
	.align	2
.L640:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC61
	.word	.LC63
	.word	.LC59
	.word	.LC57
	.word	.LC58
	.word	.LC64
	.word	.LC6
	.word	.LC1
	.word	.LC60
	.word	.LC2
	.word	.LC62
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
	ldr	r3, .L660
	ldr	r1, [r3, r0, asl #2]
	cmp	r1, #0
	beq	.L659
	ldr	r3, [r1, #528]
	cmp	r3, #19
	ldrls	pc, [pc, r3, asl #2]
	b	.L642
.L646:
	.word	.L645
	.word	.L647
	.word	.L648
	.word	.L649
	.word	.L642
	.word	.L650
	.word	.L651
	.word	.L642
	.word	.L652
	.word	.L653
	.word	.L654
	.word	.L654
	.word	.L654
	.word	.L655
	.word	.L642
	.word	.L642
	.word	.L656
	.word	.L657
	.word	.L642
	.word	.L658
.L658:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	USERDEC_Init
.L645:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_Init
.L647:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1DEC_Init
.L648:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_Init
.L649:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_Init
.L650:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	DIVX3DEC_Init
.L651:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVSDEC_Init
.L652:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL8DEC_Init
.L653:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL9DEC_Init
.L654:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP6DEC_Init
.L655:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP8DEC_Init
.L656:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_DEC_Init
.L657:
	add	r0, r1, #229376
	add	r1, r1, #536
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_Init
.L642:
	ldmfd	sp, {fp, sp, pc}
.L659:
	ldr	ip, .L660+4
	mov	r0, r1
	ldr	r3, .L660+8
	movw	r2, #5391
	ldr	r1, .L660+12
	ldr	ip, [ip, #68]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	ip
.L661:
	.align	2
.L660:
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
	@ args = 0, pretend = 0, frame = 568
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #596)
	sub	sp, sp, #596
	subs	r4, r1, #0
	mov	r7, r0
	mov	r5, r2
	mov	r8, r3
	beq	.L696
	cmp	r2, #0
	beq	.L697
	cmp	r0, #26
	movw	r3, #27784
	movw	r6, #56880
	movt	r3, 8
	movt	r6, 176
	movne	r6, r3
	cmp	r8, #2
	beq	.L667
	ldr	r1, .L706
	ldr	r2, [r4, #36]
	ldr	r0, [r4, #60]
	ldr	ip, [r1, #2564]
	ldr	r3, [r1, #2560]
	add	r9, r0, ip
	add	r1, r2, r3
	orrs	lr, r9, r1
	bmi	.L698
	cmp	r1, #16
	strle	r1, [r4, #36]
	strle	r9, [r4, #60]
	bgt	.L699
.L670:
	subs	r3, r7, #25
	movne	r3, #1
	cmp	r8, #0
	movne	r3, #0
	cmp	r3, #0
	bne	.L700
.L667:
	ldr	r1, [r4, #36]
	cmp	r1, #0
	blt	.L671
	ldr	r2, [r4, #12]
	cmp	r2, #31
	ble	.L671
	ldr	r3, [r4, #16]
	cmp	r3, #31
	ble	.L671
	ldr	r0, [r4, #56]
	cmp	r0, #262144
	blt	.L671
	ldr	r0, [r4, #44]
	cmp	r0, #1
	beq	.L701
	cmp	r0, #2
	beq	.L702
.L673:
	ldr	r0, [r4, #40]
	cmp	r0, #0
	moveq	r0, #1
	bne	.L703
.L675:
	ldr	ip, .L706+4
	sub	r8, r7, #27
	cmp	r8, #6
	ldr	lr, [r4, #60]
	ldr	r9, [ip, #48]
	mvncc	ip, #1
	mvncs	ip, #0
	cmp	r9, #0
	beq	.L677
	add	r1, r1, lr
	str	ip, [sp, #12]
	add	r1, r1, #2
	stmia	sp, {r0, r1}
	sub	r0, fp, #608
	mov	r1, #0
	str	r0, [sp, #16]
	mov	r0, #1
	str	r1, [sp, #8]
	mvn	r1, #-2147483648
	blx	r9
	cmp	r0, #0
	bne	.L677
	ldr	r3, [fp, #-604]
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
	beq	.L680
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
	beq	.L704
.L680:
	cmp	r8, #5
	bhi	.L681
.L705:
	movw	r2, #51528
	movt	r2, 13
	cmp	r3, r2
	movcc	r3, r2
.L681:
	mov	r0, #0
	add	r3, r3, r6
	str	r3, [r5, #8]
.L664:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L703:
	add	r0, r1, #1
	cmp	r0, #17
	movge	r0, #17
	b	.L675
.L702:
	ldr	r0, [r4, #20]
	cmp	r0, #0
	ble	.L671
	ldr	r0, [r4, #24]
	cmp	r0, #0
	ble	.L671
.L695:
	ldr	r0, [r4, #28]
	cmp	r0, #0
	ble	.L671
	ldr	r0, [r4, #32]
	cmp	r0, #0
	bgt	.L673
.L671:
	ldr	r3, .L706+8
	mov	r0, #32
	ldr	r1, .L706+12
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L699:
	ldr	ip, .L706+8
	mov	r0, #32
	ldr	r1, .L706+16
	ldr	r10, [ip, #68]
	blx	r10
	mov	r3, #16
	str	r9, [r4, #60]
	str	r3, [r4, #36]
	b	.L670
.L677:
	ldr	r3, .L706+8
	movw	r2, #5661
	ldr	r1, .L706+20
	mov	r0, #0
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L701:
	ldr	r0, [r4, #20]
	cmp	r0, #0
	bgt	.L695
	b	.L671
.L704:
	movw	r0, #3992
	mov	r2, #2240
	mla	r1, r0, lr, r1
	mla	ip, r2, ip, r1
	cmp	r3, ip
	movcc	r3, ip
	cmp	r8, #5
	bls	.L705
	b	.L681
.L700:
	ldr	r3, .L706+8
	mov	r0, #32
	ldr	r1, .L706+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L664
.L698:
	ldr	r1, .L706+8
	stmia	sp, {r0, ip}
	mov	r0, #32
	ldr	r4, [r1, #68]
	ldr	r1, .L706+28
	blx	r4
	mvn	r0, #0
	b	.L664
.L697:
	ldr	ip, .L706+8
	mov	r0, r2
	ldr	r3, .L706+32
	movw	r2, #5494
	ldr	r1, .L706+36
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L664
.L696:
	ldr	ip, .L706+8
	mov	r0, r4
	ldr	r3, .L706+40
	movw	r2, #5493
	ldr	r1, .L706+36
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L664
.L707:
	.align	2
.L706:
	.word	.LANCHOR0
	.word	g_vdm_hal_fun_ptr
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC70
	.word	.LC68
	.word	.LC71
	.word	.LC69
	.word	.LC67
	.word	.LC66
	.word	.LC1
	.word	.LC65
	UNWIND(.fnend)
	.size	VCTRL_GetChanMemSizeWithOption, .-VCTRL_GetChanMemSizeWithOption
	.align	2
	.global	VCTRL_GetChanMemSize
	.type	VCTRL_GetChanMemSize, %function
VCTRL_GetChanMemSize:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 592
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #628)
	sub	sp, sp, #628
	cmp	r0, #32
	mov	r4, r0
	str	r1, [fp, #-620]
	str	r2, [fp, #-624]
	bhi	.L733
	mov	r2, r0, asl #5
	mov	r3, r0, asl #2
	ldr	r10, .L735
	str	r3, [fp, #-632]
	rsb	r3, r3, r2
	add	r3, r10, r3
	str	r2, [fp, #-636]
	sub	r2, r0, #18
	ldr	r1, [r3, #16]
	ldr	r8, [r3, #12]
	ldr	r9, [r3, #8]
	str	r1, [fp, #-616]
	ldr	r1, [r3, #20]
	str	r1, [fp, #-628]
	cmp	r2, #7
	ldrls	pc, [pc, r2, asl #2]
	b	.L711
.L713:
	.word	.L726
	.word	.L726
	.word	.L726
	.word	.L726
	.word	.L726
	.word	.L714
	.word	.L714
	.word	.L714
.L726:
	mov	r3, #3
.L712:
	ldr	r7, .L735+4
	rsb	r3, r3, r8
	sub	r3, r3, #2
	ldr	r2, [r7, #2560]
	cmp	r2, #0
	movlt	r2, #0
	strlt	r2, [r7, #2560]
	cmp	r3, #15
	movgt	r6, #0
	bgt	.L716
	ldr	r6, [r7, #2560]
	add	r3, r3, r6
	cmp	r3, #16
	rsbgt	r3, r3, #16
	addgt	r6, r6, r3
.L716:
	add	r3, r9, r6
	ldr	r5, [r7, #2564]
	cmp	r3, #0
	ble	.L734
	cmp	r3, #17
	movlt	r9, r3
	movge	r9, #17
.L718:
	cmp	r4, #23
	bhi	.L719
	ldr	r3, [fp, #-616]
	add	r5, r6, r5
	add	r2, r5, r8
	add	r1, r3, r5
	ldr	r3, [fp, #-628]
	cmp	r2, #0
	cmpgt	r1, #0
	add	r5, r3, r5
	movle	r3, #1
	movgt	r3, #0
	cmp	r5, #0
	orrle	r3, r3, #1
	cmp	r3, #0
	streq	r5, [fp, #-628]
	streq	r1, [fp, #-616]
	moveq	r8, r2
	beq	.L719
	ldr	r1, [r7, #2564]
	mov	r3, r6
	ldr	ip, .L735+8
	mov	r2, r8
	str	r6, [sp, #20]
	mov	r0, #32
	str	r1, [sp, #24]
	str	r1, [sp, #12]
	str	r1, [sp]
	ldr	r1, [fp, #-628]
	str	r6, [sp, #8]
	str	r1, [sp, #16]
	ldr	r1, [fp, #-616]
	str	r1, [sp, #4]
	ldr	r1, .L735+12
	ldr	r4, [ip, #68]
	blx	r4
.L719:
	ldr	r5, .L735+16
	ldr	r6, [r5, #48]
	cmp	r6, #0
	beq	.L720
	ldr	r3, [fp, #-636]
	sub	r1, fp, #608
	ldr	r2, [fp, #-632]
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
	ldr	r6, .L735
	cmp	r0, #0
	bne	.L720
	ldr	r2, [fp, #-620]
	ldr	r3, [fp, #-604]
	add	r3, r3, #47616
	add	r3, r3, #16
	str	r3, [r2]
	ldr	r2, [fp, #-624]
	ldr	r3, [r4, #24]
	add	r3, r3, #32768
	str	r3, [r2]
	ldr	r10, [r5, #48]
	cmp	r10, #0
	beq	.L722
	ldr	r3, [r4, #4]
	sub	ip, fp, #608
	ldr	r2, [r6, r7]
	mvn	r1, #-2147483648
	str	r0, [sp, #8]
	ldr	r0, [fp, #-616]
	str	ip, [sp, #16]
	str	r8, [sp, #12]
	str	r0, [sp, #4]
	mov	r0, #1
	str	r9, [sp]
	blx	r10
	subs	ip, r0, #0
	bne	.L722
	ldr	r2, [fp, #-620]
	ldr	r3, [fp, #-604]
	add	r3, r3, #47616
	add	r3, r3, #16
	str	r3, [r2, #4]
	ldr	r2, [fp, #-624]
	ldr	r3, [r4, #24]
	add	r3, r3, #32768
	str	r3, [r2, #4]
	ldr	r5, [r5, #48]
	cmp	r5, #0
	beq	.L725
	ldr	r2, [r6, r7]
	sub	r0, fp, #608
	ldr	r3, [r4, #4]
	mvn	r1, #-2147483648
	str	ip, [sp, #8]
	ldr	ip, [fp, #-628]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r8, [sp, #12]
	stmia	sp, {r9, ip}
	blx	r5
	cmp	r0, #0
	bne	.L725
	ldr	r2, [fp, #-620]
	ldr	r3, [fp, #-604]
	add	r3, r3, #47616
	add	r3, r3, #16
	str	r3, [r2, #8]
	ldr	r2, [fp, #-624]
	ldr	r3, [r4, #24]
	add	r3, r3, #32768
	str	r3, [r2, #8]
.L710:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L714:
	mov	r3, #1
	b	.L712
.L711:
	mov	r3, #6
	b	.L712
.L720:
	ldr	r3, .L735+8
	movw	r2, #5827
.L732:
	ldr	r1, .L735+20
	mov	r0, #0
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L722:
	ldr	r3, .L735+8
	movw	r2, #5848
	b	.L732
.L725:
	ldr	r3, .L735+8
	movw	r2, #5869
	b	.L732
.L734:
	ldr	ip, .L735+8
	mov	r2, r9
	mov	r3, r6
	ldr	r1, .L735+24
	mov	r0, #32
	ldr	ip, [ip, #68]
	blx	ip
	cmp	r9, #17
	movge	r9, #17
	b	.L718
.L733:
	ldr	ip, .L735+8
	movw	r2, #5726
	ldr	r3, .L735+28
	mov	r0, #0
	ldr	r1, .L735+32
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L710
.L736:
	.align	2
.L735:
	.word	CapItem
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC74
	.word	g_vdm_hal_fun_ptr
	.word	.LC75
	.word	.LC73
	.word	.LC72
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
	beq	.L738
	ldr	r3, .L782
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L773
	mov	r0, #0
	ldr	r8, .L782+4
	blx	r3
.L741:
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_ReleaseMemBlock
	ldr	r3, [r8, #48]
	mov	r2, #16
	mov	r1, #0
	mov	r0, r4
	blx	r3
.L738:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #28]
	ldr	r6, [r4, #24]
	cmp	r5, #0
	ldr	r7, [r4, #20]
	bne	.L774
.L742:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	bl	SM_InstInit
	ldr	r5, [r4, #60]
	ldr	r6, [r4, #56]
	cmp	r5, #0
	ldr	r7, [r4, #52]
	bne	.L775
.L743:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #108]
	ldr	r6, [r4, #104]
	cmp	r5, #0
	ldr	r7, [r4, #100]
	bne	.L776
.L744:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #92]
	ldr	r6, [r4, #88]
	cmp	r5, #0
	ldr	r7, [r4, #84]
	bne	.L777
.L745:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #76]
	ldr	r6, [r4, #72]
	cmp	r5, #0
	ldr	r7, [r4, #68]
	bne	.L778
.L746:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #124]
	ldr	r6, [r4, #120]
	cmp	r5, #0
	ldr	r7, [r4, #116]
	bne	.L779
.L747:
	ldr	r4, .L782+8
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r3, [r4, #224]
	cmp	r3, #1
	beq	.L780
.L748:
	ldr	r3, [r4, #228]
	ldr	r4, .L782+8
	cmp	r3, #1
	beq	.L781
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L774:
	mov	r0, #0
	bl	SM_CloseSCDDrv
	ldr	r1, [r4, #20]
	ldr	r0, [r4, #24]
	bl	MEM_ReleaseMemBlock
	ldr	r3, .L782+4
	mov	r2, #16
	mov	r1, #0
	add	r0, r4, r2
	ldr	r3, [r3, #48]
	blx	r3
	b	.L742
.L775:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L782+4
	mov	r2, #16
	mov	r1, #0
	add	r0, r4, #48
	ldr	r3, [r3, #48]
	blx	r3
	b	.L743
.L779:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L782+4
	add	r0, r4, #112
	mov	r2, #16
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
	b	.L747
.L778:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L782+4
	mov	r2, #16
	mov	r1, #0
	add	r0, r4, #64
	ldr	r3, [r3, #48]
	blx	r3
	b	.L746
.L777:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L782+4
	mov	r2, #16
	mov	r1, #0
	add	r0, r4, #80
	ldr	r3, [r3, #48]
	blx	r3
	b	.L745
.L776:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L782+4
	mov	r2, #16
	mov	r1, #0
	add	r0, r4, #96
	ldr	r3, [r3, #48]
	blx	r3
	b	.L744
.L773:
	ldr	r8, .L782+4
	mov	r0, r3
	movw	r2, #6177
	ldr	r1, .L782+12
	ldr	r3, [r8, #68]
	blx	r3
	b	.L741
.L781:
	ldr	r3, .L782+4
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
.L780:
	ldr	r3, .L782+4
	mov	r0, #0
	ldr	r5, [r3, #184]
	bl	VFMW_GetString
	mov	r2, #0
	mov	r1, r0
	mov	r0, #127
	blx	r5
	mov	r3, #0
	str	r3, [r4, #224]
	b	.L748
.L783:
	.align	2
.L782:
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
	bne	.L790
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
	bne	.L817
	ldr	r6, .L820
	ldr	r3, [r6, #24]
	cmp	r3, #0
	beq	.L790
	blx	r3
	subs	r7, r0, #0
	bne	.L790
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
	ldrne	r3, .L820+4
	movne	r1, r7
	beq	.L819
.L815:
	mov	r0, r5
	mov	r2, #16
.L812:
	ldr	r3, [r3, #48]
	blx	r3
	mov	r0, r4
	bl	CloseDrivers
	mvn	r0, #0
.L788:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L790:
	ldr	r3, .L820+4
	mov	r0, r5
	mov	r2, #16
	mov	r1, #0
	b	.L812
.L819:
	ldr	r7, .L820+4
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
	beq	.L793
	blx	r3
	subs	r2, r0, #0
	ble	.L793
	str	r8, [sp]
	mov	r3, r4
	mov	r1, r8
	sub	r0, fp, #64
	bl	MEM_AllocMemBlock
	subs	r5, r0, #0
	bne	.L794
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
	beq	.L795
	sub	r0, fp, #76
	blx	r3
	cmp	r0, #0
	bne	.L795
	bl	VDMDRV_Init
	mov	r0, #12
	ldr	r7, [r7, #72]
	bl	VFMW_GetString
	mov	r3, #0
	mov	r1, #20
	mov	r5, r3
	add	r8, r4, #16
	ldr	r6, .L820+4
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
	bne	.L799
	ldr	r2, [r4, #28]
	ldr	r1, [r4, #20]
	ldr	r0, [r4, #24]
	bl	MEM_AddMemRecord
	mov	r2, r7
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #24]
	bl	SM_OpenSCDDrv
	subs	r5, r0, #0
	bne	.L814
	bl	SM_InstInit
	mov	r0, r5
	ldr	r7, [r6, #180]
	bl	VFMW_GetString
	str	r5, [sp]
	mov	r2, #32
	ldr	r1, .L820+8
	mov	r3, r0
	mov	r0, #127
	blx	r7
	subs	r7, r0, #0
	bne	.L799
	ldr	r5, .L820+12
	mov	r0, #3
	mov	r9, #1
	ldr	r10, [r6, #180]
	str	r9, [r5, #224]
	bl	VFMW_GetString
	str	r7, [sp]
	mov	r2, #32
	ldr	r1, .L820+16
	mov	r3, r0
	mov	r0, #136
	blx	r10
	cmp	r0, #0
	streq	r9, [r5, #228]
	beq	.L788
.L814:
	ldr	r3, [r6, #48]
	mov	r1, r7
.L813:
	mov	r2, #16
	mov	r0, r8
	blx	r3
	mov	r0, r4
	bl	CloseDrivers
	mvn	r0, #0
	b	.L788
.L793:
	ldr	r3, [r7, #48]
	mov	r2, #16
	mov	r1, #0
	mov	r0, r5
	blx	r3
	mov	r0, r4
	bl	CloseDrivers
	mvn	r0, #0
	b	.L788
.L817:
	ldr	r3, .L820+4
	mov	r1, r6
	b	.L815
.L799:
	ldr	r3, [r6, #48]
	mov	r1, r5
	b	.L813
.L795:
	ldr	r3, [r7, #48]
	mov	r2, #16
	mov	r1, #0
.L816:
	mov	r0, r4
	blx	r3
	mov	r0, r4
	bl	CloseDrivers
	mvn	r0, #0
	b	.L788
.L794:
	ldr	r3, [r7, #48]
	mov	r1, r8
	mov	r2, #16
	b	.L816
.L821:
	.align	2
.L820:
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
	ldr	r4, .L857
	ldr	r6, .L857+4
	mov	r2, #8
	sub	r0, fp, #44
	mov	r1, #0
	ldr	r3, [r4, #48]
	blx	r3
	ldr	r5, [r6, #64]
	cmp	r5, #0
	bne	.L843
	mov	r1, #1024
	ldr	r3, [r4, #84]
	str	r5, [fp, #-48]
	ldr	r0, .L857+8
	blx	r3
	ldr	r3, [r4, #100]
	ldr	r1, .L857+12
	ldr	r0, .L857+8
	blx	r3
	cmp	r0, #0
	str	r0, [fp, #-48]
	beq	.L824
	ldr	r3, [r4, #96]
	sub	r0, fp, #48
	ldr	r1, .L857+16
	blx	r3
	cmp	r0, #0
	beq	.L844
	sub	r0, fp, #48
	ldr	r3, [r4, #96]
	ldr	r1, .L857+20
	blx	r3
	cmp	r0, #0
	beq	.L852
	mov	r2, r5
	ldr	r3, [r4, #88]
	mov	r1, r5
	blx	r3
	mov	r2, r0
	str	r0, [r6, #2560]
.L828:
	add	r3, r2, #4992
	movw	r1, #10000
	add	r3, r3, #8
	movw	r7, #5000
	cmp	r3, r1
	bhi	.L829
	cmp	r2, r7
	movw	r3, #60536
.L851:
	movt	r3, 65535
	movge	r2, r7
	cmp	r2, r3
	movlt	r2, r3
.L825:
	str	r2, [r6, #2560]
.L827:
	mov	r8, #0
	ldr	r3, [r4, #84]
	mov	r1, #1024
	str	r8, [fp, #-48]
	ldr	r0, .L857+8
	blx	r3
	ldr	r3, [r4, #100]
	ldr	r1, .L857+24
	ldr	r0, .L857+8
	blx	r3
	ldr	r9, .L857+4
	ldr	r7, .L857
	cmp	r0, r8
	str	r0, [fp, #-48]
	beq	.L830
	ldr	r3, [r7, #96]
	sub	r0, fp, #48
	ldr	r1, .L857+16
	blx	r3
	cmp	r0, r8
	beq	.L831
	sub	r0, fp, #48
	ldr	r3, [r7, #96]
	ldr	r1, .L857+20
	blx	r3
	cmp	r0, r8
	beq	.L853
	mov	r2, r8
	ldr	r3, [r7, #88]
	mov	r1, r8
	blx	r3
	mov	r2, r0
	str	r0, [r9, #2564]
.L834:
	add	r3, r2, #4992
	movw	r1, #10000
	add	r3, r3, #8
	movw	r7, #5000
	cmp	r3, r1
	bhi	.L835
	cmp	r2, r7
	movw	r3, #60536
	movt	r3, 65535
	movlt	r5, r2
	movge	r5, r7
	cmp	r5, r3
	movlt	r5, r3
.L831:
	str	r5, [r6, #2564]
.L833:
	ldr	r5, [r6, #3592]
	mov	r3, #0
	ldr	r7, .L857+4
	cmp	r5, r3
	str	r3, [fp, #-48]
	beq	.L836
	ldr	r2, .L857+28
	and	r3, r5, #1
	ubfx	r1, r5, #1, #1
	strb	r3, [r7, #3596]
	ubfx	r3, r5, #2, #1
	ubfx	r5, r5, #3, #1
	strb	r1, [r2]
	strb	r3, [r7, #3597]
	strb	r5, [r7, #3598]
.L837:
	ldr	r5, .L857+4
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
	ldr	r1, .L857+32
	sub	r0, fp, #44
	mov	r2, #134217728
	mov	r3, #75497472
	str	r2, [fp, #-44]
	str	r1, [r6, #3600]
	str	r3, [fp, #-40]
	str	r7, [r6, #68]
	bl	MEM_InitMemManager
	bl	FSP_Init
	ldr	r6, .L857
	bl	ChanCtx_Init
	ldr	r3, [r4, #48]
	mov	r2, #64
	mov	r1, #0
	ldr	r0, .L857+36
	blx	r3
	add	r0, r5, #88
	bl	OpenDrivers
	cmp	r0, #0
	bne	.L854
	ldr	r3, [r6, #128]
	mov	r1, r7
	blx	r3
	ldr	r3, [r6, #176]
	ldr	r2, .L857+40
	add	r0, r5, #76
	ldr	r1, .L857+44
	blx	r3
	cmp	r0, #0
	streq	r7, [r5, #64]
	moveq	r3, #3
	streq	r3, [r5, #68]
	bne	.L855
.L823:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L836:
	ldr	r3, [r4, #84]
	mov	r1, #1024
	ldr	r0, .L857+8
	blx	r3
	ldr	r3, [r4, #100]
	ldr	r1, .L857+48
	ldr	r0, .L857+8
	blx	r3
	ldr	r8, .L857
	cmp	r0, #0
	str	r0, [fp, #-48]
	beq	.L837
	ldr	r3, [r8, #96]
	sub	r0, fp, #48
	ldr	r1, .L857+16
	blx	r3
	cmp	r0, #0
	ldreq	r0, [r7, #3592]
	beq	.L839
	sub	r0, fp, #48
	ldr	r3, [r8, #96]
	ldr	r1, .L857+20
	blx	r3
	cmp	r0, #0
	beq	.L856
	ldr	r3, [r8, #88]
	mov	r2, r5
	mov	r1, r5
	blx	r3
	str	r0, [r7, #3592]
.L839:
	ldr	r2, .L857+28
	and	r3, r0, #1
	ubfx	r1, r0, #1, #1
	strb	r3, [r6, #3596]
	ubfx	r3, r0, #2, #1
	ubfx	r0, r0, #3, #1
	strb	r1, [r2]
	strb	r3, [r6, #3597]
	strb	r0, [r6, #3598]
	b	.L837
.L830:
	ldr	r2, [r9, #2564]
	b	.L834
.L824:
	ldr	r2, [r6, #2560]
	b	.L828
.L835:
	ldr	r3, [r4, #68]
	mov	r0, #32
	ldr	r1, .L857+52
	blx	r3
	ldr	r5, [r6, #2564]
	movw	r3, #60536
	cmp	r5, r7
	movt	r3, 65535
	movge	r5, r7
	cmp	r5, r3
	movlt	r5, r3
	b	.L831
.L829:
	ldr	r3, [r4, #68]
	mov	r0, #32
	ldr	r1, .L857+56
	blx	r3
	ldr	r2, [r6, #2560]
	movw	r3, #60536
	cmp	r2, r7
	b	.L851
.L844:
	mov	r2, r5
	b	.L825
.L843:
	mvn	r0, #0
	b	.L823
.L852:
	ldr	r7, [r4, #68]
	movw	r3, #7276
	ldr	r2, .L857+60
	mov	r0, #22
	ldr	r1, .L857+64
	blx	r7
	b	.L827
.L853:
	ldr	r5, [r7, #68]
	movw	r3, #7323
	ldr	r2, .L857+68
	mov	r0, #22
	ldr	r1, .L857+64
	blx	r5
	b	.L833
.L854:
	ldr	r3, [r6, #68]
	mov	r0, r7
	ldr	r1, .L857+72
	blx	r3
	mvn	r0, #0
	b	.L823
.L856:
	ldr	r5, [r8, #68]
	movw	r3, #7380
	ldr	r2, .L857+76
	mov	r0, #22
	ldr	r1, .L857+64
	blx	r5
	b	.L837
.L855:
	add	r0, r5, #88
	bl	CloseDrivers
	mvn	r0, #0
	b	.L823
.L858:
	.align	2
.L857:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LANCHOR0+2568
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC81
	.word	.LANCHOR2
	.word	VCTRL_EventReport
	.word	.LANCHOR0+3604
	.word	VFMW_CTRL_thread_proc
	.word	.LC85
	.word	.LC83
	.word	.LC82
	.word	.LC80
	.word	.LANCHOR1+140
	.word	.LC79
	.word	.LANCHOR1+160
	.word	.LC84
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
	ldr	r6, .L866
	movge	r5, r4
	mov	r5, r5, asr #3
	mov	r7, r0
	str	r1, [sp, #4]
	mov	r8, r1
	str	r4, [sp]
	sub	r3, r3, ip, asr #31
	mov	r2, r5
	ldr	r9, [r6, #68]
	ldr	r1, .L866+4
	mov	r0, #30
	blx	r9
	cmp	r7, #3
	beq	.L864
	cmp	r4, r8
	blt	.L865
.L863:
	mov	r4, r7
.L861:
	ldr	r5, [r6, #68]
	mov	r2, r7
	mov	r3, r4
	ldr	r1, .L866+8
	mov	r0, #30
	blx	r5
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L865:
	ldr	r3, [r6, #68]
	mov	r0, #30
	ldr	r1, .L866+12
	mov	r4, #3
	blx	r3
	b	.L861
.L864:
	cmp	r5, r8
	ble	.L863
	ldr	r3, [r6, #68]
	mov	r0, #30
	ldr	r1, .L866+16
	mov	r4, #0
	blx	r3
	b	.L861
.L867:
	.align	2
.L866:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC86
	.word	.LC89
	.word	.LC88
	.word	.LC87
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
	ldr	ip, .L877
	mov	r2, #0
.L871:
	ldr	r1, [ip], #4
	cmp	r1, #0
	add	r3, r1, #229376
	add	r3, r3, #120
	beq	.L869
	cmp	r0, r3
	beq	.L872
.L869:
	add	r2, r2, #1
	cmp	r2, #16
	bne	.L871
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L872:
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
.L878:
	.align	2
.L877:
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
	ldr	ip, .L890
	mov	r2, #0
.L883:
	ldr	r3, [ip], #4
	cmp	r3, #0
	beq	.L880
	ldr	r1, [r3, #208]
	cmp	r1, r0
	bhi	.L881
	ldr	lr, [r3, #212]
	add	r1, r1, lr
	cmp	r0, r1
	bcc	.L885
.L881:
	ldr	r1, [r3, #224]
	cmp	r0, r1
	bcc	.L880
	ldr	r3, [r3, #228]
	add	r1, r1, r3
	cmp	r0, r1
	bcc	.L885
.L880:
	add	r2, r2, #1
	cmp	r2, #16
	bne	.L883
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L885:
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
.L891:
	.align	2
.L890:
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
	bhi	.L962
	ldr	r6, .L977
	ldr	r0, [r6, r0, asl #2]
	cmp	r0, #0
	beq	.L963
	ldr	r9, [r0, #16]
	cmp	r9, #1
	bne	.L964
	ldr	r5, [r0, #28]
	cmp	r5, #0
	bne	.L965
	ldr	r7, .L977+4
	mov	r3, r4, asl #2
	str	r5, [r0, #316]
	mov	r8, r3
	str	r3, [fp, #-48]
	ldr	r3, [r7]
	blx	r3
	add	r2, r6, r8
	ldr	r1, .L977+8
	ldr	r3, [r2, #3668]
	ldr	r1, [r1]
	rsb	r3, r3, r0
	cmp	r3, r1
	ldr	r3, [r6, r4, asl #2]
	strhi	r0, [r2, #3668]
	movhi	r10, r9
	movls	r10, r5
	ldr	r3, [r3, #528]
	ldr	r1, .L977
	sub	r2, r3, #10
	cmp	r2, #2
	bhi	.L899
	ldr	r2, [r1, #2492]
	tst	r2, #1
	bne	.L899
.L900:
	mov	r0, r4
	bl	VCTRL_GetImageBuffer
	cmp	r0, #1
	beq	.L901
	cmp	r10, #1
	mvnne	r5, #2
	beq	.L966
.L939:
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L899:
	sub	r2, r3, #15
	bics	r2, r2, #4
	movne	r2, #1
	moveq	r2, #0
	cmp	r3, #4
	moveq	r3, #0
	andne	r3, r2, #1
	cmp	r3, #0
	beq	.L900
	mov	r0, r4
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L900
	cmp	r10, #1
	mvnne	r5, #1
	bne	.L939
	ldr	r3, [r7, #68]
	mov	r2, r4
	ldr	r1, .L977+12
	mov	r0, #23
	blx	r3
	mvn	r5, #1
	b	.L939
.L901:
	ldr	r3, [r6, r4, asl #2]
	ldr	r2, [r3, #1404]
	str	r3, [fp, #-52]
	cmp	r2, #0
	bne	.L967
.L902:
	ldr	r3, [fp, #-52]
	ldrb	r3, [r3, #665]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L959
	ldr	r3, [fp, #-52]
	add	r3, r3, #672
	str	r3, [fp, #-56]
.L905:
	ldr	r3, [fp, #-56]
	ldr	ip, [r7, #68]
	ldrd	r0, [r3, #40]
	ldrd	r8, [r3, #24]
	strd	r0, [fp, #-68]
	mov	r0, #29
	ldrd	r2, [fp, #-68]
	ldr	r1, .L977+16
	strd	r2, [sp]
	mov	r2, r8
	mov	r3, r9
	blx	ip
	ldr	ip, [r6, r4, asl #2]
	ldr	r1, [ip, #48]
	cmp	r1, #1
	beq	.L968
	sub	r3, r1, #2
	cmp	r1, #6
	cmpne	r3, #1
	bls	.L926
.L908:
	ldr	r3, [fp, #-56]
	mvn	r2, #0
	ldrd	r0, [r3, #24]
	mvn	r3, #0
	cmp	r1, r3
	add	r3, ip, #592
	cmpeq	r0, r2
	beq	.L969
	strd	r0, [r3, #-8]
.L919:
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
	ldr	r1, .L977+20
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
.L917:
	mov	r0, #3
	bl	CHECK_REC_POS_ENABLE
	adds	r3, r0, #0
	movne	r3, #1
	cmp	r10, #1
	movne	r3, #0
	cmp	r3, #0
	bne	.L970
.L920:
	ldr	r3, [r6, r4, asl #2]
	ldr	r2, [fp, #-52]
	ldr	r9, .L977
	add	r0, r2, #664
	add	r2, r3, #229376
	ldr	r1, [r3, #528]
	add	r2, r2, #120
	bl	DecodeStream
	ldr	r0, [r6, r4, asl #2]
	ldr	r3, [r0, #528]
	cmp	r3, #17
	beq	.L971
.L921:
	mov	r0, #4
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	beq	.L939
	ldr	r3, [r7]
	blx	r3
	ldr	r3, [fp, #-48]
	ldr	r1, .L977+24
	add	r6, r6, r3
	ldr	r3, [r6, #3732]
	ldr	r1, [r1]
	rsb	r3, r3, r0
	mov	r2, r0
	cmp	r3, r1
	bls	.L939
	mov	r0, r4
	str	r2, [r6, #3732]
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L939
	mov	r2, r4, asl #24
	movw	r1, #6941
	add	r2, r2, #262144
	ldr	r0, .L977+28
	bl	DBG_AddTrace
	b	.L939
.L967:
	cmp	r2, #1
	beq	.L972
	ldr	r3, [fp, #-52]
	add	r9, r3, #225280
	ldr	r3, [r9, #2860]
.L925:
	ldr	r4, [r7, #68]
	mov	r0, #31
	ldr	r1, .L977+32
	mvn	r5, #0
	blx	r4
	b	.L939
.L966:
	ldr	r3, [r7, #68]
	mov	r2, r4
	ldr	r1, .L977+36
	mov	r0, #23
	blx	r3
	mvn	r5, #2
	b	.L939
.L959:
	ldr	r2, [fp, #-52]
	ldr	r3, [r2, #1444]
	cmp	r3, #0
	beq	.L960
	add	r3, r2, #672
	str	r3, [fp, #-56]
	b	.L905
.L968:
	add	r3, ip, #229376
	ldr	r3, [r3, #120]
	ldr	r1, [r3, #548]
	sxtb	r1, r1
	cmp	r1, #1
	bne	.L908
.L926:
	add	r0, ip, #1072
	ldr	r2, [fp, #-56]
	add	r0, r0, #8
	bl	IsNewpicSeg
	cmp	r0, #0
	bne	.L909
	ldr	r1, [r6, r4, asl #2]
	add	r0, r1, #592
	ldr	r3, [r1, #48]
	cmp	r3, #3
	beq	.L973
	ldrd	r8, [r0]
	mvn	r3, #0
	mvn	r2, #0
	cmp	r9, r3
	cmpeq	r8, r2
	beq	.L974
	mov	r2, r8
	mov	r3, r9
	strd	r2, [r0, #-8]
.L911:
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
.L913:
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
	ldr	r1, .L977+40
	blx	ip
	ldr	ip, [r6, r4, asl #2]
	ldr	r3, [ip, #48]
	cmp	r3, #3
	beq	.L975
.L914:
	ldr	r3, [fp, #-56]
	mvn	r1, #0
	mvn	r0, #0
	ldrd	r2, [r3, #24]
	cmp	r3, r1
	cmpeq	r2, r0
	addne	r1, ip, #592
	strned	r2, [r1]
.L916:
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
.L915:
	ldrd	r2, [r1, #-8]
	mov	r0, #29
	ldr	r1, .L977+44
	ldr	ip, [r7, #68]
	blx	ip
	b	.L917
.L960:
	ldr	r3, [fp, #-52]
	mov	r0, r4
	add	r3, r3, #672
	str	r3, [fp, #-56]
	mov	r1, r3
	bl	SM_ReadStreamSeg
	cmp	r0, #0
	beq	.L905
	cmp	r10, #1
	beq	.L976
.L906:
	ldr	r3, [r6, r4, asl #2]
	mov	r2, #1
	mvn	r5, #3
	str	r2, [r3, #316]
	b	.L939
.L964:
	ldr	ip, .L977+4
	movw	r2, #6693
	ldr	r3, .L977+48
.L961:
	ldr	r1, .L977+52
	mov	r0, #0
	ldr	r4, [ip, #68]
	mvn	r5, #0
	blx	r4
	b	.L939
.L965:
	ldr	ip, .L977+4
	movw	r2, #6694
	ldr	r3, .L977+56
	b	.L961
.L971:
	ldr	r3, [r0, #1460]
	cmp	r3, #1
	beq	.L921
	add	r0, r0, #229376
	add	r0, r0, #120
	bl	IsMain10Profile
	cmp	r0, #0
	ldreq	r3, [r9, r4, asl #2]
	streq	r0, [r3, #1460]
	beq	.L921
	mov	r3, r4
	ldr	r10, [r7, #68]
	ldr	r2, .L977+28
	mov	r0, #0
	ldr	r1, .L977+60
	blx	r10
	ldr	r3, [r9, r4, asl #2]
	mov	r2, #1
	str	r2, [r3, #1460]
	bl	VDMDRV_AddMatchMode
	b	.L921
.L972:
	add	r3, r3, #225280
	ldr	r3, [r3, #2860]
	bics	r1, r3, #2
	beq	.L902
	cmp	r3, #1
	bne	.L925
	ldr	r3, [r7, #68]
	mov	r0, #31
	ldr	r1, .L977+64
	mvn	r5, #2
	blx	r3
	b	.L939
.L975:
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
.L909:
	ldr	ip, [r6, r4, asl #2]
	ldr	r3, [ip, #48]
	cmp	r3, #3
	addeq	r1, ip, #608
	bne	.L914
	b	.L915
.L969:
	ldrd	r0, [r3, #-8]
	b	.L919
.L962:
	ldr	ip, .L977+4
	movw	r2, #6691
	ldr	r3, .L977+68
	b	.L961
.L970:
	mov	r2, r4, asl #24
	movw	r1, #6903
	add	r2, r2, #196608
	ldr	r0, .L977+28
	bl	DBG_AddTrace
	b	.L920
.L973:
	ldrd	r2, [r0]
	mov	r8, r2
	mov	r9, r3
	strd	r2, [r0, #-8]
	b	.L911
.L974:
	ldrd	r2, [r0, #-8]
	mov	r8, r2
	mov	r9, r3
	b	.L911
.L963:
	ldr	ip, .L977+4
	movw	r2, #6692
	ldr	r3, .L977+72
	mvn	r5, #0
	ldr	r1, .L977+52
	ldr	r4, [ip, #68]
	blx	r4
	b	.L939
.L976:
	ldr	r3, [r7, #68]
	mov	r2, r4
	ldr	r1, .L977+76
	mov	r0, #23
	blx	r3
	b	.L906
.L978:
	.align	2
.L977:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_TraceBsPeriod
	.word	.LC91
	.word	.LC94
	.word	.LC97
	.word	g_TraceFramePeriod
	.word	.LANCHOR1+196
	.word	.LC100
	.word	.LC92
	.word	.LC95
	.word	.LC96
	.word	.LC52
	.word	.LC1
	.word	.LC90
	.word	.LC98
	.word	.LC99
	.word	.LC6
	.word	.LC38
	.word	.LC93
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
	ldr	r0, .L1008
	ldr	r1, .L1008+4
	sub	r3, r0, #64
.L982:
	ldr	r2, [r1, #4]!
	add	r3, r3, #4
	cmp	r2, #0
	ldrne	r2, [r2, #24]
	str	r2, [r3, #-4]
	cmp	r3, r0
	bne	.L982
	ldr	r6, .L1008+8
	mvn	r5, #0
	ldr	r9, .L1008+12
	mov	r7, #0
	mov	r8, r6
.L983:
	mov	r3, #0
	ldr	r0, [r6, #3796]
	mov	r4, r3
	ldr	r1, .L1008+16
	b	.L984
.L986:
	ldr	r2, [r1, #4]!
	cmp	r0, r2
	movlt	r0, r2
	movlt	r4, r3
.L984:
	add	r3, r3, #1
	cmp	r3, #16
	bne	.L986
	add	r3, r6, r4, lsl #2
	cmp	r0, #0
	add	r2, r4, #1
	ldr	r1, .L1008+8
	str	r7, [r3, #3796]
	mov	r3, #0
	str	r2, [r6, #84]
	ble	.L987
	ldr	r3, [r8, r4, asl #2]
	cmp	r3, #0
	beq	.L983
	ldr	r2, [r3, #16]
	cmp	r2, #1
	bne	.L983
	ldr	r2, [r3, #68]
	cmp	r2, #0
	ble	.L989
	ldr	r5, [r3, #72]
	cmp	r5, #0
	beq	.L1006
.L989:
	mov	r10, #200
	b	.L994
.L992:
	cmp	r0, #0
	bne	.L983
	subs	r10, r10, #1
	beq	.L983
.L994:
	mov	r0, r4
	bl	DecChanSyntax
	cmn	r0, #1
	mov	r5, r0
	bne	.L992
	ldr	r6, [r6, #3600]
	cmp	r6, #0
	beq	.L1000
	mov	r3, #0
	mov	r0, r4
	mov	r2, r3
	mov	r1, #102
	blx	r6
.L1000:
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1006:
	mov	r0, r4
	sub	r1, fp, #68
	bl	SM_GetInfo
	cmp	r0, #0
	bne	.L1007
.L990:
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
	b	.L989
.L987:
	mov	r0, r5
	str	r3, [r1, #84]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1007:
	mov	r1, r5
	sub	r0, fp, #68
	ldr	r3, [r9, #48]
	mov	r2, #24
	blx	r3
	b	.L990
.L1009:
	.align	2
.L1008:
	.word	.LANCHOR0+3860
	.word	.LANCHOR0-4
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+3796
	UNWIND(.fnend)
	.size	DecSyntax, .-DecSyntax
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
	ldr	r5, .L1025
	mov	r3, #100
	ldr	r6, .L1025+4
	ldr	r0, [r5, #3860]
	str	r3, [r5, #80]
	cmp	r0, #0
	ble	.L1011
	ldr	r3, [r6, #124]
	blx	r3
.L1011:
	ldr	r3, [r6, #12]
	mov	r0, #0
	blx	r3
	bl	SM_Wakeup
	ldr	r3, [r5, #3864]
	mov	r2, #101
	str	r2, [r5, #80]
	cmp	r3, #0
	movne	r7, #0
	beq	.L1023
.L1012:
	mov	r3, #102
	str	r3, [r5, #80]
	bl	VDMDRV_WakeUpVdm
	mov	r0, #0
	bl	SCDDRV_EnableInt
	ldr	r3, .L1025+8
	ldr	r3, [r3, #76]
	cmp	r3, #0
	beq	.L1024
	mov	r0, #0
	blx	r3
.L1014:
	mov	r4, #0
.L1015:
	mov	r0, r4
	mov	r1, #0
	add	r4, r4, #1
	bl	DeleteRawPacketInBuffer
	cmp	r4, #16
	bne	.L1015
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
.L1023:
	bl	DecSyntax
	mov	r7, r0
	b	.L1012
.L1024:
	mov	r0, r3
	mov	r2, #580
	ldr	r3, [r6, #68]
	ldr	r1, .L1025+12
	blx	r3
	b	.L1014
.L1026:
	.align	2
.L1025:
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
	ldr	r4, .L1057
	ldr	r5, .L1057+4
	mov	r6, r4
	mov	r7, r5
.L1028:
.L1035:
	mov	r2, #0
	ldr	r3, [r5, #68]
	str	r2, [r4, #80]
	mov	r0, #2
	ldr	r1, .L1057+8
	blx	r3
	ldr	r3, [r4, #72]
	mov	r2, #2
	str	r2, [r4, #68]
	cmp	r3, r2
	beq	.L1033
	cmp	r3, #3
	bne	.L1053
	b	.L1032
.L1055:
	cmp	r3, #3
	beq	.L1032
	ldr	r3, [r6, #68]
	cmp	r3, #0
	beq	.L1032
.L1053:
	mov	r3, #2
	str	r3, [r4, #80]
	bl	VCTRL_RunProcess
	ldr	r3, [r5, #68]
	ldr	r1, .L1057+12
	mov	r0, #22
	blx	r3
	ldr	r3, [r4, #72]
	cmp	r3, #2
	bne	.L1055
.L1033:
	mov	r2, #4
	ldr	r3, [r5, #68]
	str	r2, [r4, #80]
	mov	r0, #2
	ldr	r1, .L1057+16
	mov	r8, #5
	blx	r3
	mov	r3, #1
	str	r3, [r4, #68]
	b	.L1030
.L1056:
	ldr	r3, [r7, #124]
	blx	r3
	ldr	r3, [r6, #68]
	cmp	r3, #0
	beq	.L1032
.L1030:
	ldr	r3, [r5, #68]
	mov	r0, #22
	str	r8, [r4, #80]
	ldr	r1, .L1057+20
	blx	r3
	ldr	r3, [r4, #72]
	mov	r0, #10
	cmp	r3, #1
	beq	.L1035
	cmp	r3, #3
	bne	.L1056
.L1032:
	mov	r2, #6
	ldr	r3, [r5, #68]
	ldr	r1, .L1057+24
	mov	r0, #2
	str	r2, [r4, #80]
	blx	r3
	mov	r0, #0
	str	r0, [r4, #68]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1058:
	.align	2
.L1057:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC101
	.word	.LC104
	.word	.LC102
	.word	.LC105
	.word	.LC103
	UNWIND(.fnend)
	.size	VFMW_CTRL_thread_proc, .-VFMW_CTRL_thread_proc
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
	bhi	.L1077
	ldr	r3, .L1078
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L1076
	ldr	r2, [r3, #528]
	cmp	r2, #19
	ldrls	pc, [pc, r2, asl #2]
	b	.L1077
.L1062:
	.word	.L1074
	.word	.L1063
	.word	.L1064
	.word	.L1065
	.word	.L1077
	.word	.L1066
	.word	.L1067
	.word	.L1077
	.word	.L1068
	.word	.L1069
	.word	.L1070
	.word	.L1070
	.word	.L1070
	.word	.L1071
	.word	.L1077
	.word	.L1077
	.word	.L1072
	.word	.L1073
	.word	.L1077
	.word	.L1074
.L1074:
	add	r0, r3, #229376
	add	r0, r0, #128
	ldmfd	sp, {fp, sp, pc}
.L1063:
	movw	r0, #15832
	movt	r0, 4
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1064:
	add	r0, r3, #251904
	add	r0, r0, #200
	ldmfd	sp, {fp, sp, pc}
.L1065:
	movw	r0, #47864
	movt	r0, 4
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1066:
	movw	r0, #1160
	movt	r0, 4
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1067:
	add	r0, r3, #244736
	add	r0, r0, #968
	ldmfd	sp, {fp, sp, pc}
.L1068:
	add	r0, r3, #274432
	add	r0, r0, #1200
	ldmfd	sp, {fp, sp, pc}
.L1069:
	add	r0, r3, #274432
	add	r0, r0, #1184
	ldmfd	sp, {fp, sp, pc}
.L1070:
	add	r0, r3, #241664
	add	r0, r0, #480
	ldmfd	sp, {fp, sp, pc}
.L1071:
	add	r0, r3, #237568
	add	r0, r0, #96
	ldmfd	sp, {fp, sp, pc}
.L1072:
	add	r0, r3, #229376
	add	r0, r0, #704
	ldmfd	sp, {fp, sp, pc}
.L1073:
	add	r0, r3, #278528
	add	r0, r0, #1968
	ldmfd	sp, {fp, sp, pc}
.L1077:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1076:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1079:
	.align	2
.L1078:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetChanVoQue, .-VCTRL_GetChanVoQue
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
	bhi	.L1089
	ldr	r5, .L1093
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	beq	.L1090
	bl	VCTRL_GetChanVoQue
	subs	r3, r0, #0
	beq	.L1083
	mov	r2, r8
	mov	r1, r7
	bl	GetQueueImgNum
	ldr	r3, [r5, r4, asl #2]
	ldr	r2, [r3, #528]
	cmp	r2, #0
	beq	.L1091
	cmp	r2, #17
	beq	.L1092
	cmp	r2, #16
	addeq	r3, r3, #11337728
	addeq	r3, r3, #12288
	movne	r3, #2
	ldreq	r3, [r3, #2496]
	str	r3, [r6]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1091:
	add	r3, r3, #253952
	ldr	r3, [r3, #2176]
	str	r3, [r6]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1083:
	str	r3, [r8]
	str	r3, [r7]
	str	r3, [r6]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1089:
	ldr	ip, .L1093+4
	movw	r2, #7076
	ldr	r3, .L1093+8
	mov	r0, #0
.L1088:
	ldr	r1, .L1093+12
	ldr	ip, [ip, #68]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L1092:
	add	r3, r3, #229376
	ldr	r3, [r3, #2608]
	str	r3, [r6]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1090:
	mov	r0, r3
	ldr	ip, .L1093+4
	ldr	r3, .L1093+16
	movw	r2, #7077
	b	.L1088
.L1094:
	.align	2
.L1093:
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
	mov	r5, r0
	mov	r4, r1
	bhi	.L1108
	cmp	r1, #0
	mov	r7, #0
	str	r7, [fp, #-64]
	str	r7, [fp, #-68]
	str	r7, [fp, #-72]
	beq	.L1095
	ldr	r8, .L1109
	mov	r1, r7
	ldr	r6, .L1109+4
	mov	r2, #108
	mov	r0, r4
	ldr	r3, [r8, #48]
	blx	r3
	ldr	r1, [r6, r5, asl #2]
	cmp	r1, r7
	beq	.L1095
	add	r1, r1, #1088
	ldr	r3, [r8, #52]
	add	r1, r1, #4
	mov	r2, #108
	mov	r0, r4
	blx	r3
	ldr	r0, [r6, r5, asl #2]
	movw	r3, #1482
	add	lr, r0, #204800
	ldrsb	ip, [lr, r3]
	cmp	ip, r7
	ble	.L1100
	mov	r1, r7
.L1102:
	mov	r2, r1, asl #6
	movw	r3, #27226
	movt	r3, 3
	add	r3, r2, r3
	add	r1, r1, #1
	ldrsb	r3, [r0, r3]
	cmp	r3, #3
	addeq	r7, r7, #1
	cmp	r1, ip
	bne	.L1102
.L1100:
	movw	r3, #1482
	str	r7, [r4, #92]
	ldrsb	ip, [lr, r3]
	sub	r2, fp, #68
	sub	r3, fp, #64
	sub	r1, fp, #72
	mov	r0, r5
	str	ip, [r4, #100]
	bl	VCTRL_GetChanImgNum
	mov	r3, #300
	mla	r3, r3, r5, r6
	ldr	r0, [fp, #-64]
	ldr	r2, [fp, #-68]
	sub	r1, fp, #60
	add	r2, r2, r0
	str	r2, [r4, #56]
	mov	r0, r5
	ldr	r2, [r3, #3888]
	str	r2, [r4, #104]
	ldr	r3, [r3, #3876]
	str	r3, [r4, #24]
	bl	SM_GetInfo
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-52]
	sub	r1, fp, #60
	mov	r0, r5
	str	r2, [r4, #60]
	str	r3, [r4, #64]
	bl	SM_GetInfo
	ldr	r2, [fp, #-40]
	ldr	r3, [r6, r5, asl #2]
	cmp	r2, #10
	add	r3, r3, #241664
	movle	r2, #0
	movgt	r2, #1
	str	r2, [r4, #88]
	ldrb	r3, [r3, #3696]	@ zero_extendqisi2
	and	r3, r3, #1
	str	r3, [r4, #96]
.L1095:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1108:
	ldr	ip, .L1109
	movw	r2, #1226
	ldr	r3, .L1109+8
	mov	r0, #0
	ldr	r1, .L1109+12
	ldr	r4, [ip, #68]
	blx	r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1110:
	.align	2
.L1109:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC106
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
	bhi	.L1115
	ldr	r3, .L1117
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L1116
	ldr	r0, [r0, #1272]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1115:
	ldr	ip, .L1117+4
	movw	r2, #7125
	ldr	r3, .L1117+8
	mov	r0, #0
	ldr	r1, .L1117+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1116:
	ldr	ip, .L1117+4
	movw	r2, #7126
	ldr	r3, .L1117+16
	ldr	r1, .L1117+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1118:
	.align	2
.L1117:
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
	bhi	.L1123
	ldr	r3, .L1125
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L1124
	ldr	r0, [r0, #1276]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1123:
	ldr	ip, .L1125+4
	movw	r2, #7133
	ldr	r3, .L1125+8
	mov	r0, #0
	ldr	r1, .L1125+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1124:
	ldr	ip, .L1125+4
	movw	r2, #7134
	ldr	r3, .L1125+16
	ldr	r1, .L1125+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1126:
	.align	2
.L1125:
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
	bhi	.L1131
	ldr	r3, .L1132
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	ldrne	r0, [r3, #40]
	moveq	r0, #33
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1131:
	ldr	ip, .L1132+4
	movw	r2, #7141
	ldr	r3, .L1132+8
	mov	r0, #0
	ldr	r1, .L1132+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1133:
	.align	2
.L1132:
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
	ldr	r5, .L1141
	add	r3, r3, #8
	movw	r2, #10000
	cmp	r3, r2
	mov	r4, r1
	str	r0, [r5, #2560]
	bhi	.L1139
.L1135:
	movw	r1, #5000
	cmp	r0, r1
	movw	r2, #60536
	add	r3, r4, #4992
	movge	r0, r1
	movt	r2, 65535
	cmp	r0, r2
	add	r3, r3, #8
	movw	r1, #10000
	str	r4, [r5, #2564]
	movlt	r0, r2
	cmp	r3, r1
	str	r0, [r5, #2560]
	ldr	r6, .L1141
	bhi	.L1140
.L1136:
	movw	r2, #5000
	cmp	r4, r2
	movw	r3, #60536
	movge	r4, r2
	movt	r3, 65535
	cmp	r4, r3
	movlt	r4, r3
	str	r4, [r5, #2564]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1139:
	ldr	r3, .L1141+4
	mov	r2, r0
	ldr	r1, .L1141+8
	mov	r0, #32
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r0, [r5, #2560]
	b	.L1135
.L1140:
	ldr	r3, .L1141+4
	mov	r2, r4
	ldr	r1, .L1141+12
	mov	r0, #32
	ldr	r3, [r3, #68]
	blx	r3
	ldr	r4, [r6, #2564]
	b	.L1136
.L1142:
	.align	2
.L1141:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC107
	.word	.LC108
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
	ldr	r3, .L1147
	ldr	r3, [r3, #72]
	cmp	r3, #0
	beq	.L1146
	mov	r0, #0
	blx	r3
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SCDDRV_MaskInt
.L1146:
	ldr	ip, .L1147+4
	mov	r0, r3
	movw	r2, #7186
	ldr	r1, .L1147+8
	ldr	r3, [ip, #68]
	blx	r3
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SCDDRV_MaskInt
.L1148:
	.align	2
.L1147:
	.word	g_vdm_hal_fun_ptr
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC8
	UNWIND(.fnend)
	.size	VCTRL_MaskAllInt, .-VCTRL_MaskAllInt
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
	ldr	r3, .L1153
	ldr	r3, [r3, #76]
	cmp	r3, #0
	beq	.L1152
	mov	r0, #0
	blx	r3
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SCDDRV_EnableInt
.L1152:
	ldr	ip, .L1153+4
	mov	r0, r3
	movw	r2, #7225
	ldr	r1, .L1153+8
	ldr	r3, [ip, #68]
	blx	r3
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SCDDRV_EnableInt
.L1154:
	.align	2
.L1153:
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
	bhi	.L1161
	ldr	r3, .L1162
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	strne	r1, [r3, #320]
	ldmfd	sp, {fp, sp, pc}
.L1161:
	ldr	ip, .L1162+4
	movw	r2, #8022
	ldr	r3, .L1162+8
	mov	r0, #0
	ldr	r1, .L1162+12
	ldr	ip, [ip, #68]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	ip
.L1163:
	.align	2
.L1162:
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
	bhi	.L1170
	ldr	r3, .L1171
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	strne	r1, [r3, #324]
	ldmfd	sp, {fp, sp, pc}
.L1170:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_SetLastFrameState.part.6
.L1172:
	.align	2
.L1171:
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
	bhi	.L1186
	ldr	r6, .L1188
	ldr	r0, [r6, r0, asl #2]
	cmp	r0, #0
	beq	.L1187
	cmp	r1, #0
	moveq	r3, #2
	beq	.L1178
	cmp	r1, #1
	moveq	r3, #3
	movne	r3, #4
.L1178:
	ldr	r7, [r6, #3600]
	str	r3, [r0, #324]
	cmp	r7, #0
	beq	.L1180
	sub	r2, fp, #28
	mov	r3, #4
	mov	r1, #115
	mov	r0, r4
	str	r5, [r2, #-4]!
	blx	r7
.L1180:
	ldr	r3, [r6, r4, asl #2]
	mov	r2, r5
	ldr	ip, .L1188+4
	mov	r0, #1
	ldr	r1, .L1188+8
	ldr	r3, [r3, #324]
	ldr	r4, [ip, #68]
	blx	r4
.L1173:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1186:
	ldr	ip, .L1188+4
	movw	r2, #8048
	ldr	r3, .L1188+12
	mov	r0, #0
	ldr	r1, .L1188+16
	ldr	r4, [ip, #68]
	blx	r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1187:
	ldr	ip, .L1188+4
	movw	r2, #8049
	ldr	r3, .L1188+20
	ldr	r1, .L1188+16
	ldr	r4, [ip, #68]
	blx	r4
	b	.L1173
.L1189:
	.align	2
.L1188:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC109
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
	bhi	.L1216
	ldr	r3, .L1219
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L1217
	add	r0, r0, #229376
	ldr	r3, [r0, #112]
	cmp	r3, #17
	ldrls	pc, [pc, r3, asl #2]
	b	.L1209
.L1196:
	.word	.L1195
	.word	.L1197
	.word	.L1198
	.word	.L1199
	.word	.L1209
	.word	.L1200
	.word	.L1201
	.word	.L1209
	.word	.L1202
	.word	.L1203
	.word	.L1204
	.word	.L1204
	.word	.L1204
	.word	.L1205
	.word	.L1209
	.word	.L1209
	.word	.L1206
	.word	.L1207
.L1209:
	mov	r0, r5
	mov	r1, #1
	bl	VCTRL_ReportLastFrame
	ldr	r3, .L1219+4
	ldr	r1, .L1219+8
	mov	r0, #2
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1207:
	add	r0, r0, #120
	bl	HEVCDEC_GetRemainImg
	mov	r4, r0
.L1194:
	cmn	r4, #1
	beq	.L1209
	cmp	r4, #0
	bne	.L1218
	mov	r0, r5
	mov	r1, r4
	bl	VCTRL_ReportLastFrame
	ldr	r3, .L1219+4
	ldr	r1, .L1219+12
	mov	r0, #2
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1195:
	add	r0, r0, #120
	bl	H264DEC_GetRemainImg
	mov	r4, r0
	b	.L1194
.L1197:
	add	r0, r0, #120
	bl	VC1DEC_GetRemainImg
	mov	r4, r0
	b	.L1194
.L1198:
	add	r0, r0, #120
	bl	MPEG4DEC_GetRemainImg
	mov	r4, r0
	b	.L1194
.L1199:
	add	r0, r0, #120
	bl	MPEG2DEC_GetRemainImg
	mov	r4, r0
	b	.L1194
.L1200:
	add	r0, r0, #120
	bl	DIVX3DEC_GetRemainImg
	mov	r4, r0
	b	.L1194
.L1201:
	add	r0, r0, #120
	bl	AVSDEC_GetRemainImg
	mov	r4, r0
	b	.L1194
.L1202:
	add	r0, r0, #120
	bl	REAL8DEC_GetRemainImg
	mov	r4, r0
	b	.L1194
.L1203:
	add	r0, r0, #120
	bl	REAL9DEC_GetRemainImg
	mov	r4, r0
	b	.L1194
.L1204:
	add	r0, r0, #120
	bl	VP6DEC_GetRemainImg
	mov	r4, r0
	b	.L1194
.L1205:
	add	r0, r0, #120
	bl	VP8DEC_GetRemainImg
	mov	r4, r0
	b	.L1194
.L1206:
	add	r0, r0, #120
	bl	MVC_DEC_GetRemainImg
	mov	r4, r0
	b	.L1194
.L1218:
	mov	r0, r5
	mov	r1, r4
	bl	VCTRL_ReportLastFrame
	ldr	r3, .L1219+4
	sub	r2, r4, #2
	ldr	r1, .L1219+16
	mov	r0, #2
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1216:
	ldr	ip, .L1219+4
	movw	r2, #8077
	ldr	r3, .L1219+20
	mov	r0, #0
	ldr	r1, .L1219+24
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1217:
	ldr	ip, .L1219+4
	movw	r2, #8078
	ldr	r3, .L1219+28
	ldr	r1, .L1219+24
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1220:
	.align	2
.L1219:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC110
	.word	.LC111
	.word	.LC112
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
	ldr	r5, .L1255
	mov	r4, r0
	ldr	lr, [fp, #4]
	ldr	r0, [r5, r0, asl #2]
	cmp	r0, #0
	beq	.L1249
	ldr	ip, [r0, #528]
	ldr	r6, [r0, #1232]
	cmp	ip, #17
	ldrls	pc, [pc, ip, asl #2]
	b	.L1221
.L1225:
	.word	.L1224
	.word	.L1226
	.word	.L1227
	.word	.L1228
	.word	.L1221
	.word	.L1229
	.word	.L1230
	.word	.L1221
	.word	.L1231
	.word	.L1232
	.word	.L1233
	.word	.L1233
	.word	.L1233
	.word	.L1234
	.word	.L1221
	.word	.L1221
	.word	.L1235
	.word	.L1236
.L1224:
	add	r0, r0, #229376
	str	lr, [sp, #4]
	add	r0, r0, #120
	str	r6, [sp]
	mov	r2, #1
	ldr	r7, .L1255
	bl	H264DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r3, r3, #241664
	ldrb	r3, [r3, #1392]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1250
.L1237:
	cmp	r6, #1
	ldrne	r3, [r5, r4, asl #2]
	movne	r2, #0
	addne	r3, r3, #229376
	strne	r2, [r3, #480]
.L1221:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1236:
	add	r0, r0, #229376
	str	lr, [sp, #4]
	add	r0, r0, #120
	str	r6, [sp]
	mov	r2, #1
	ldr	r7, .L1255
	bl	HEVCDEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r3, r3, #229376
	ldrb	r3, [r3, #126]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1251
.L1239:
	cmp	r6, #1
	ldrne	r3, [r5, r4, asl #2]
	movne	r2, #0
	addne	r3, r3, #229376
	strne	r2, [r3, #2432]
	b	.L1221
.L1226:
	add	r0, r0, #229376
	ldr	r6, .L1255
	add	r0, r0, #120
	bl	VC1DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r2, r3, #241664
	ldrb	r2, [r2, #551]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1252
.L1244:
	add	r3, r3, #229376
	mov	r2, #0
	str	r2, [r3, #124]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1227:
	add	r0, r0, #229376
	mov	r2, r3
	add	r0, r0, #120
	bl	MPEG4DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	ldr	r5, .L1255
	add	r2, r3, #282624
	ldrb	r2, [r2, #3680]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1253
.L1242:
	add	r3, r3, #229376
	mov	r2, #0
	str	r2, [r3, #1156]
	b	.L1221
.L1228:
	add	r0, r0, #229376
	ldr	r6, .L1255
	add	r0, r0, #120
	bl	MPEG2DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r2, r3, #344064
	ldrb	r2, [r2, #122]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1244
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r6, r4, asl #2]
	mov	r1, #0
	add	r2, r3, #344064
	strb	r1, [r2, #122]
	b	.L1244
.L1229:
	add	r0, r0, #229376
	add	r0, r0, #120
	bl	DIVX3DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #229376
	str	r2, [r3, #124]
	b	.L1221
.L1230:
	add	r0, r0, #229376
	ldr	r6, .L1255
	add	r0, r0, #120
	bl	AVSDEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r2, r3, #245760
	ldrb	r2, [r2, #980]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1244
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r6, r4, asl #2]
	mov	r1, #0
	add	r2, r3, #245760
	strb	r1, [r2, #980]
	b	.L1244
.L1231:
	add	r0, r0, #229376
	add	r0, r0, #120
	bl	REAL8DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #229376
	str	r2, [r3, #124]
	b	.L1221
.L1232:
	add	r0, r0, #229376
	add	r0, r0, #120
	bl	REAL9DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #229376
	str	r2, [r3, #124]
	b	.L1221
.L1233:
	add	r0, r0, #229376
	add	r0, r0, #120
	bl	VP6DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #229376
	str	r2, [r3, #124]
	b	.L1221
.L1234:
	add	r0, r0, #229376
	add	r0, r0, #120
	bl	VP8DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #229376
	str	r2, [r3, #124]
	b	.L1221
.L1235:
	add	r0, r0, #229376
	mov	r2, #1
	add	r0, r0, #120
	bl	MVC_DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	ldr	r5, .L1255
	add	r3, r3, #229376
	ldrb	r2, [r3, #121]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1254
.L1245:
	mov	r2, #0
	str	r2, [r3, #348]
	b	.L1221
.L1249:
	ldr	ip, .L1255+4
	movw	r2, #4472
	ldr	r3, .L1255+8
	ldr	r1, .L1255+12
	ldr	ip, [ip, #68]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	ip
.L1253:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r5, r4, asl #2]
	mov	r1, #0
	add	r2, r3, #282624
	strb	r1, [r2, #3680]
	b	.L1242
.L1252:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r6, r4, asl #2]
	mov	r1, #0
	add	r2, r3, #241664
	strb	r1, [r2, #551]
	b	.L1244
.L1254:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r2, [r5, r4, asl #2]
	mov	r1, #0
	add	r2, r2, #229376
	mov	r3, r2
	strb	r1, [r2, #121]
	b	.L1245
.L1250:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r7, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #241664
	strb	r2, [r3, #1392]
	b	.L1237
.L1251:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r7, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #229376
	strb	r2, [r3, #126]
	b	.L1239
.L1256:
	.align	2
.L1255:
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
	bhi	.L1263
	ldr	ip, .L1265
	ldr	ip, [ip, r0, asl #2]
	cmp	ip, #0
	beq	.L1264
	ldr	ip, [ip, #16]
	cmp	ip, #1
	beq	.L1260
	ldr	ip, .L1265+4
	movw	r2, #4652
	ldr	r3, .L1265+8
.L1262:
	mov	r0, #0
	ldr	r1, .L1265+12
	ldr	ip, [ip, #68]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L1260:
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
.L1263:
	ldr	ip, .L1265+4
	movw	r2, #4650
	ldr	r3, .L1265+16
	b	.L1262
.L1264:
	ldr	lr, .L1265+4
	mov	r0, ip
	ldr	r3, .L1265+20
	movw	r2, #4651
	ldr	r1, .L1265+12
	ldr	ip, [lr, #68]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L1266:
	.align	2
.L1265:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC52
	.word	.LC1
	.word	.LC51
	.word	.LC38
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
	b	.L1269
.L1271:
	.word	.L1270
	.word	.L1272
	.word	.L1273
	.word	.L1274
	.word	.L1275
	.word	.L1276
	.word	.L1277
.L1277:
	cmp	r0, #1
	moveq	r0, #1
	movne	r0, #7
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1270:
	cmp	r0, #1
	moveq	r0, #0
	movne	r0, #6
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1272:
	cmp	r0, #1
	moveq	r0, #2
	movne	r0, #8
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1273:
	cmp	r0, #1
	moveq	r0, #4
	movne	r0, #10
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1274:
	cmp	r0, #1
	moveq	r0, #3
	movne	r0, #9
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1275:
	cmp	r0, #1
	moveq	r0, #5
	movne	r0, #11
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1276:
	cmp	r0, #1
	moveq	r0, #13
	movne	r0, #12
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1269:
	ldr	ip, .L1286
	mov	r3, r1
	movw	r2, #8246
	ldr	r1, .L1286+4
	mov	r0, #1
	ldr	r4, [ip, #68]
	blx	r4
	mov	r0, #13
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1287:
	.align	2
.L1286:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC113
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
	beq	.L1296
	ldr	r3, [r5, #4]
	cmp	r3, #1
	beq	.L1291
	mov	r1, r0
	mov	r2, #0
	mov	r0, r8
	bl	FSP_ClearLogicFs
	mov	r0, #0
.L1290:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1291:
	ldr	r0, [r5, #36]
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L1297
.L1292:
	mov	r1, r7
	mov	r0, r8
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	beq	.L1298
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
	beq	.L1299
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
	ldr	r3, .L1300
	str	r4, [sp]
	mov	r1, r9
	mov	r0, r8
	ldr	r2, [r3, r8, asl #2]
	add	r2, r2, #229376
	add	r3, r2, #128
	add	r2, r2, #120
	bl	InsertImgToVoQueue
	cmp	r0, #1
	moveq	r0, r6
	beq	.L1290
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
	b	.L1290
.L1297:
	ldr	r3, [r5, #4]
	cmp	r3, #1
	bne	.L1292
	ldr	r3, .L1300+4
	ldr	r2, [r5, #36]
	ldr	r1, .L1300+8
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1290
.L1296:
	ldr	r3, .L1300+4
	mov	r0, #0
	ldr	r2, [r5, #28]
	ldr	r1, .L1300+12
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r7
	b	.L1290
.L1299:
	ldr	r3, .L1300+4
	mov	r2, r0
	ldr	r1, .L1300+16
	mov	r0, r9
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1290
.L1298:
	ldr	r3, .L1300+4
	movw	r2, #5093
	ldr	r1, .L1300+20
	mov	r0, #22
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1290
.L1301:
	.align	2
.L1300:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC115
	.word	.LC114
	.word	.LC117
	.word	.LC116
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
	bhi	.L1311
	ldr	r3, .L1315
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L1312
	cmp	r1, #0
	beq	.L1313
	ldr	r2, [r0, #528]
	cmp	r2, #19
	bne	.L1314
	ldr	r6, .L1315+4
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
	ldr	r1, .L1315+8
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1314:
	ldr	r3, .L1315+4
	mov	r0, #1
	ldr	r1, .L1315+12
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1311:
	ldr	ip, .L1315+4
	movw	r2, #5361
	ldr	r3, .L1315+16
	mov	r0, #0
	ldr	r1, .L1315+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1313:
	ldr	ip, .L1315+4
	mov	r0, r1
	ldr	r3, .L1315+24
	movw	r2, #5363
	ldr	r1, .L1315+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1312:
	ldr	ip, .L1315+4
	movw	r2, #5362
	ldr	r3, .L1315+28
	ldr	r1, .L1315+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1316:
	.align	2
.L1315:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC120
	.word	.LC119
	.word	.LC6
	.word	.LC1
	.word	.LC118
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
	ldr	r9, .L1360
	mov	r7, r0
	ldr	r6, [r9]
	cmp	r6, #0
	beq	.L1355
	cmp	r0, #15
	bhi	.L1356
	ldr	r8, .L1360+4
	ldr	r5, [r8, r0, asl #2]
	cmp	r5, #0
	beq	.L1357
	ldr	r3, [r5, #12]
	cmp	r3, #1
	bne	.L1321
	ldr	r3, [r5, #528]
	cmp	r3, #20
	beq	.L1321
	bic	r4, r3, #8
	cmp	r3, #4
	cmpne	r4, #7
	moveq	r4, #1
	movne	r4, #0
	ldmeqib	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	cmp	r3, #19
	ldmeqib	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	mov	r10, r4
.L1327:
	mov	r0, r4
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	bne	.L1326
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
.L1326:
	add	r4, r4, #1
	cmp	r4, #16
	bne	.L1327
	cmp	r10, #1
	beq	.L1358
.L1328:
	ldr	r1, .L1360+8
	mov	ip, #0
	add	lr, r1, #64
.L1333:
	ldr	r2, [r1, #4]!
	mov	r3, #0
	cmp	r2, r3
	beq	.L1331
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
.L1331:
	cmp	r1, lr
	bne	.L1333
	ldr	r3, [r6, #120]
	cmp	ip, #1
	orreq	r3, r3, #2
	bfcne	r3, #1, #1
	str	r3, [r6, #120]
	ldr	r3, [r5, #528]
	cmp	r3, #1
	ldmneib	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	ldr	r3, .L1360+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	ldmeqib	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L1321:
	ldr	r3, .L1360+16
	movw	r2, #8286
	ldr	r1, .L1360+20
.L1354:
	mov	r0, #0
.L1353:
	ldr	r3, [r3, #68]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L1356:
	ldr	r3, .L1360+16
	movw	r2, #8274
	ldr	r1, .L1360+24
	b	.L1354
.L1355:
	ldr	r3, .L1360+16
	mov	r0, r6
	movw	r2, #8268
	ldr	r1, .L1360+28
	b	.L1353
.L1358:
	ldr	r3, .L1360+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1359
	mov	r0, #0
	blx	r3
.L1330:
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
	b	.L1328
.L1357:
	ldr	r3, .L1360+16
	mov	r0, r5
	movw	r2, #8280
	ldr	r1, .L1360+32
	b	.L1353
.L1359:
	ldr	ip, .L1360+16
	mov	r0, r3
	movw	r2, #8322
	ldr	r1, .L1360+36
	ldr	r3, [ip, #68]
	blx	r3
	b	.L1330
.L1361:
	.align	2
.L1360:
	.word	g_pstRegCrg
	.word	.LANCHOR0
	.word	.LANCHOR0-4
	.word	g_vdm_hal_fun_ptr
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC124
	.word	.LC122
	.word	.LC121
	.word	.LC123
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
	bhi	.L1374
	ldr	r4, .L1378
	ldr	r3, [r4, r0, asl #2]
	cmp	r3, #0
	beq	.L1375
	ldr	r6, [r3, #12]
	cmp	r6, #1
	bne	.L1376
	ldr	r3, [r3, #528]
	cmp	r3, #20
	beq	.L1377
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
	bne	.L1368
	ldr	r3, .L1378+4
	sub	r0, r4, #4
	ldr	r1, .L1378+8
	add	lr, r3, #64
	str	r6, [r2, #24]
.L1371:
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
	bne	.L1371
	ldr	r0, .L1378+4
	bl	VDMDRV_SetPriority
	mov	r0, r5
	bl	VDMDRV_ClearChanIsDec
.L1368:
	mov	r0, r5
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r5
	bl	VCTRL_OpenHardware
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1376:
	ldr	ip, .L1378+12
	movw	r2, #2555
	ldr	r3, .L1378+16
.L1373:
	ldr	r1, .L1378+20
	mov	r0, #0
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1374:
	ldr	ip, .L1378+12
	movw	r2, #2553
	ldr	r3, .L1378+24
	b	.L1373
.L1377:
	ldr	ip, .L1378+12
	movw	r2, #2556
	ldr	r3, .L1378+28
	b	.L1373
.L1375:
	ldr	ip, .L1378+12
	mov	r0, r3
	movw	r2, #2554
	ldr	r3, .L1378+32
	ldr	r1, .L1378+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1379:
	.align	2
.L1378:
	.word	.LANCHOR0
	.word	.LANCHOR3+484
	.word	g_ChanCtx
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC54
	.word	.LC1
	.word	.LC6
	.word	.LC125
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
	ldr	r1, .L1418
	mov	r5, #0
	mov	r4, r5
	mov	r0, r5
	add	lr, r1, #64
	b	.L1386
.L1412:
	ldr	ip, [r3, #12]
	cmp	ip, #1
	beq	.L1410
.L1383:
	cmp	r2, #0
	ldreq	ip, [r3, #1236]
	movne	ip, #0
	cmp	r5, #0
	bne	.L1381
	cmp	r2, #6
	cmpne	ip, #1
	bne	.L1381
	ldr	r2, [r3, #12]
	cmp	r2, #1
	ldreq	r5, [r3, #16]
	subeq	r5, r5, #1
	clzeq	r5, r5
	moveq	r5, r5, lsr #5
.L1381:
	cmp	r1, lr
	beq	.L1411
.L1386:
	ldr	r3, [r1, #4]!
	cmp	r3, #0
	beq	.L1381
	cmp	r0, #0
	ldr	r2, [r3, #528]
	beq	.L1412
	cmp	r4, #0
	cmpeq	r2, #1
	bne	.L1383
	ldr	ip, [r3, #12]
	cmp	ip, #1
	bne	.L1383
	ldr	ip, [r3, #16]
.L1393:
	cmp	ip, #1
	moveq	r4, #1
	b	.L1383
.L1410:
	ldr	ip, [r3, #16]
	cmp	ip, #1
	beq	.L1413
.L1384:
	cmp	r4, #0
	cmpeq	r2, #1
	beq	.L1393
	b	.L1383
.L1411:
	cmp	r0, #0
	beq	.L1414
.L1387:
	cmp	r5, #0
	bne	.L1390
	ldr	r3, .L1418+4
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L1415
	mov	r0, r5
	blx	r3
.L1390:
	cmp	r4, #0
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L1418+4
	ldr	r3, [r3, #28]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L1414:
	ldr	r3, .L1418+4
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L1416
	blx	r3
.L1389:
	ldr	r1, .L1418+8
	mov	r3, #0
	ldr	r2, .L1418+12
	str	r3, [r1]
	str	r3, [r2, #84]
	b	.L1387
.L1413:
	sub	r0, r2, #5
	cmp	r0, #1
	cmphi	r2, #3
	bhi	.L1417
.L1395:
	mov	r0, ip
	b	.L1384
.L1417:
	sub	r0, r2, #8
	cmp	r0, #5
	bls	.L1395
	sub	r0, r2, #16
	cmp	r0, #1
	movhi	r0, #0
	movls	r0, #1
	b	.L1384
.L1416:
	ldr	r3, .L1418+16
	movw	r2, #8447
	ldr	r1, .L1418+20
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1389
.L1415:
	ldr	r3, .L1418+16
	mov	r0, r5
	movw	r2, #8463
	ldr	r1, .L1418+20
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1390
.L1419:
	.align	2
.L1418:
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
	bhi	.L1426
	ldr	r6, .L1428
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L1427
	ldr	r2, [r3, #12]
	cmp	r2, #1
	bne	.L1425
	str	r2, [r3, #28]
	mov	r2, #0
	ldr	r3, [r6, r0, asl #2]
	str	r2, [r3, #16]
	bl	SM_Stop
	subs	r5, r0, #0
	bne	.L1425
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
.L1425:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1426:
	ldr	ip, .L1428+4
	movw	r2, #2660
	ldr	r3, .L1428+8
	mov	r0, #0
	ldr	r1, .L1428+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1427:
	ldr	ip, .L1428+4
	mov	r0, r3
	movw	r2, #2661
	ldr	r3, .L1428+16
	ldr	r1, .L1428+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1429:
	.align	2
.L1428:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC126
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
	ldr	r5, .L1437
	mov	r7, r0
	mov	r4, #0
	mov	r8, r5
	b	.L1432
.L1436:
	add	r4, r4, #1
	ldr	r3, [r8, #124]
	blx	r3
	cmp	r4, #50
	beq	.L1434
.L1432:
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
	bne	.L1436
	cmp	r4, #49
	bgt	.L1434
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1434:
	ldr	r3, [r5, #68]
	mvn	r6, #0
	ldr	r1, .L1437+4
	mov	r0, #0
	blx	r3
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1438:
	.align	2
.L1437:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC127
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #15
	mov	r4, r0
	bhi	.L1460
	ldr	r6, .L1463
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L1461
	ldr	r7, .L1463+4
	mov	r5, #0
	ldr	r8, [r3, #16]
	bl	VCTRL_StopChan
	ldr	r3, [r6, r4, asl #2]
	mov	r2, #300
	ldr	r0, .L1463+8
	mov	r1, r5
	ldr	r9, [r7, #48]
	str	r5, [r3, #328]
	str	r5, [r3, #332]
	mla	r0, r2, r4, r0
	blx	r9
	mov	r1, r5
	mov	r0, r4
	bl	VCTRL_SetSendStreamAgainFlag
	mov	r1, r5
	mov	r2, #896
	ldr	r3, [r7, #48]
	ldr	r0, .L1463+12
	blx	r3
	ldr	r3, [r6, r4, asl #2]
	mov	r0, r4
	str	r5, [r3, #1224]
	bl	InitSyntaxCtx
	ldr	r0, [r6, r4, asl #2]
	ldr	r3, [r7, #48]
	mov	r1, r5
	mov	r2, #416
	add	r0, r0, #664
	blx	r3
	ldr	r3, [r6, r4, asl #2]
	mvn	r0, #0
	mvn	r1, #0
	add	r2, r3, #229376
	add	ip, r3, #592
	strd	r0, [ip, #-8]
	strd	r0, [ip]
	mov	r0, r4
	str	r5, [r3, #1080]
	str	r5, [r2, #88]
	str	r5, [r2, #80]
	str	r5, [r2, #84]
	ldr	r2, [r3, #1404]
	cmp	r2, #1
	streq	r5, [r3, #1444]
	bl	FSP_SwitchNotify
	ldr	r3, [r6, r4, asl #2]
	mov	r0, r4
	ldr	r3, [r3, #528]
	cmp	r3, #19
	beq	.L1444
	bl	FSP_ResetInstance
.L1445:
	mov	r0, r4
	bl	InitUsdPool
	mov	r0, r4
	bl	SM_Reset
	ldr	r3, .L1463+16
	ldr	r2, [r3, #548]
	cmp	r2, #0
	beq	.L1446
	add	r5, r3, r4, lsl #2
	str	r4, [fp, #-40]
	ldr	r3, [r5, #552]
	cmp	r3, #0
	beq	.L1448
	mov	r0, #512
	sub	r1, fp, #40
	bl	VCTRL_SetDbgOption
	ldr	r3, [r5, #552]
	cmp	r3, #0
	beq	.L1448
	sub	r1, fp, #40
	mov	r0, #512
	bl	VCTRL_SetDbgOption
.L1448:
	ldr	r3, [r7, #68]
	mov	r0, #32
	ldr	r1, .L1463+20
	blx	r3
.L1446:
	cmp	r8, #0
	bne	.L1462
.L1450:
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	mov	r0, #0
.L1441:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1462:
	mov	r0, r4
	bl	VCTRL_StartChan
	b	.L1450
.L1444:
	bl	FSP_EmptyInstance
	b	.L1445
.L1460:
	ldr	ip, .L1463+4
	movw	r2, #3698
	ldr	r3, .L1463+24
	mov	r0, #0
	ldr	r1, .L1463+28
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1441
.L1461:
	ldr	ip, .L1463+4
	mov	r0, r3
	movw	r2, #3699
	ldr	r3, .L1463+32
	ldr	r1, .L1463+28
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1441
.L1464:
	.align	2
.L1463:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+3868
	.word	g_stLowdlyInfo
	.word	.LANCHOR3
	.word	.LC128
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
	subs	r9, r1, #0
	mov	r4, r0
	mov	r5, r2
	beq	.L1528
	ldr	r6, .L1545
	mov	r2, #16
	mov	r1, #0
	sub	r0, fp, #204
	ldr	r10, .L1545+4
	ldr	r3, [r6, #48]
	blx	r3
	ldr	r3, [r6, #48]
	mov	r2, #16
	mov	r1, #0
	sub	r0, fp, #188
	blx	r3
	ldr	r3, [r6, #48]
	mov	r2, #16
	mov	r1, #0
	sub	r0, fp, #172
	blx	r3
	ldr	r3, [r6, #48]
	sub	r0, fp, #140
	mov	r2, #96
	mov	r1, #0
	blx	r3
	subs	r3, r4, #25
	str	r9, [r10, #680]
	movne	r3, #1
	cmp	r5, #0
	movne	r3, #0
	cmp	r3, #0
	bne	.L1529
	ldr	r3, [r9, #36]
	cmp	r3, #0
	blt	.L1469
	ldr	r3, [r9, #12]
	cmp	r3, #31
	ble	.L1469
	ldr	r3, [r9, #16]
	cmp	r3, #31
	ble	.L1469
	ldr	r3, [r9, #56]
	cmp	r3, #262144
	blt	.L1469
	ldr	r3, [r9, #44]
	cmp	r3, #1
	beq	.L1530
	cmp	r3, #2
	beq	.L1531
.L1471:
	ldr	r3, [r9, #144]
	movw	ip, #27784
	movt	ip, 8
	movw	lr, #56880
	cmp	r3, #1
	sub	r2, fp, #216
	mov	r1, r9
	mov	r0, r4
	movhi	r3, #0
	strhi	r3, [r9, #144]
	cmp	r4, #26
	mov	r3, r5
	movt	lr, 176
	movne	lr, ip
	str	lr, [fp, #-224]
	bl	VCTRL_GetChanMemSizeWithOption
	subs	r5, r0, #0
	bne	.L1532
	ldr	r3, [r9, #116]
	cmp	r3, #0
	beq	.L1476
	ldr	r3, [r9, #120]
	cmp	r3, #0
	bne	.L1477
.L1476:
	mov	r0, #5
	mov	r5, #1
	bl	VFMW_GetString
	ldr	r2, [fp, #-208]
	str	r5, [sp]
	sub	r3, fp, #156
	mov	r1, #0
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	bne	.L1533
	ldr	r2, [fp, #-144]
	ldr	r1, [fp, #-152]
	ldr	r0, [fp, #-148]
	str	r5, [fp, #-228]
	bl	MEM_AddMemRecord
	ldr	r1, [fp, #-148]
	ldr	r2, [fp, #-152]
	ldr	r3, [fp, #-144]
	str	r1, [fp, #-172]
	str	r2, [fp, #-168]
	str	r3, [fp, #-164]
.L1479:
	ldr	r3, [r9, #84]
	cmp	r3, #0
	beq	.L1481
	ldr	r3, [r9, #88]
	cmp	r3, #0
	bne	.L1482
.L1481:
	ldr	r3, [r9, #144]
	cmp	r3, #1
	beq	.L1483
	mov	r0, #6
	bl	VFMW_GetString
	mov	r1, #0
	ldr	r2, [fp, #-216]
	sub	r3, fp, #156
	str	r1, [sp]
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	bne	.L1534
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
.L1486:
	ldr	r3, [r9, #100]
	cmp	r3, #0
	beq	.L1490
	ldr	r3, [r9, #104]
	cmp	r3, #0
	bne	.L1491
.L1490:
	mov	r0, #7
	bl	VFMW_GetString
	mov	r1, #0
	ldr	r2, [fp, #-212]
	sub	r3, fp, #156
	str	r1, [sp]
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	bne	.L1535
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
.L1495:
	ldr	r7, .L1545+8
	mov	r0, #0
	ldr	r3, [r6, #12]
	blx	r3
	bl	VCTRL_MaskAllInt
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L1509
	mov	r3, r7
	mov	r5, #1
.L1502:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L1536
	add	r5, r5, #1
	cmp	r5, #16
	bne	.L1502
	mov	r2, r5
	ldr	r3, [r6, #68]
	ldr	r1, .L1545+12
	mov	r0, #1
	blx	r3
	bl	VCTRL_EnableAllInt
	ldr	r3, [r6, #16]
	mov	r0, #0
	blx	r3
	mvn	r0, #0
.L1524:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1483:
	mov	r3, #0
	str	r3, [fp, #-204]
	str	r3, [fp, #-200]
	str	r3, [fp, #-232]
	str	r3, [fp, #-196]
	b	.L1486
.L1531:
	ldr	r3, [r9, #20]
	cmp	r3, #0
	ble	.L1469
	ldr	r3, [r9, #24]
	cmp	r3, #0
	ble	.L1469
.L1526:
	ldr	r3, [r9, #28]
	cmp	r3, #0
	ble	.L1469
	ldr	r3, [r9, #32]
	cmp	r3, #0
	bgt	.L1471
.L1469:
	ldr	r3, [r6, #68]
	mov	r0, #0
	ldr	r1, .L1545+16
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1536:
	uxtb	r3, r5
	str	r3, [fp, #-240]
.L1500:
	ldr	r3, [fp, #-224]
	mov	r1, #0
	ldr	r0, [fp, #-168]
	mov	r8, r1
	sub	r2, r3, #207872
	ldr	r3, [r6, #48]
	sub	r2, r2, #8
	str	r0, [r7, r5, asl #2]
	blx	r3
	ldr	r0, [r7, r5, asl #2]
	ldr	r3, [r6, #52]
	mov	r2, #176
	add	r0, r0, #1248
	mov	r1, r9
	add	r0, r0, #12
	blx	r3
	ldr	r1, [r7, r5, asl #2]
	ldr	r0, [fp, #-224]
	mov	ip, r5, asl #4
	mov	lr, r5, asl #6
	str	ip, [fp, #-244]
	str	r4, [r1, #40]
	mov	r2, #20
	ldr	r3, [r7, r5, asl #2]
	str	r0, [r1, #1200]
	rsb	r0, ip, lr
	mov	r1, #30
	str	lr, [fp, #-248]
	str	r5, [r3, #8]
	str	r4, [r3, #564]
	mov	r4, r8
	str	r8, [r3, #1216]
	ldr	r3, [r7, r5, asl #2]
	ldr	ip, [r9]
	str	ip, [r3, #36]
	ldr	r3, [r7, r5, asl #2]
	add	ip, r3, #229376
	str	r2, [r3, #528]
	str	r2, [ip, #112]
	ldr	ip, .L1545+20
	str	r8, [r3, #32]
	ldr	r3, [r7, r5, asl #2]
	add	r0, ip, r0
	ldrb	ip, [fp, #-240]	@ zero_extendqisi2
	add	r2, r3, #204800
	strb	ip, [r2, #1472]
	add	r2, r3, #205824
	str	r1, [r3, #1464]
	add	r3, r3, #1472
	ldr	r1, .L1545+24
	add	r2, r2, #448
	str	r3, [r0, #40]
	mov	r0, r5
	str	r2, [r1, r5, asl #2]
	bl	VCTRL_ResetChan
	ldr	r2, [r7, r5, asl #2]
	ldr	r0, [fp, #-236]
	ldr	r1, [fp, #-232]
	add	r3, r2, #225280
	str	r0, [r2, #252]
	ldr	r0, [fp, #-228]
	str	r1, [r2, #248]
	add	r1, r2, #229376
	str	r0, [r2, #256]
	str	r8, [r3, #2872]
	str	r8, [r3, #2876]
	str	r8, [r3, #2884]
	str	r8, [r3, #2888]
	str	r8, [r3, #2880]
	str	r8, [r3, #2896]
	ldr	r3, [r9, #144]
	str	r8, [r1, #68]
	str	r3, [r1, #72]
.L1504:
	ldr	r0, [r7, r5, asl #2]
	mov	r3, r4, asl #4
	add	r3, r3, r4, lsl #2
	mvn	r1, #0
	add	r2, r0, r3
	add	r3, r3, #227328
	add	r2, r2, #227328
	add	r3, r3, #856
	add	r0, r0, r3
	add	r4, r4, #1
	strb	r1, [r2, #872]
	mov	r2, #16
	ldr	r3, [r6, #48]
	mov	r1, #0
	blx	r3
	cmp	r4, #32
	ldr	r8, .L1545+8
	ldr	r3, .L1545
	bne	.L1504
	ldr	r0, [r8, r5, asl #2]
	mov	r2, #572
	ldr	r4, [r3, #48]
	mov	r1, #0
	add	r0, r0, #228352
	str	r3, [fp, #-228]
	add	r0, r0, #472
	add	r10, r10, r5, lsl #2
	blx	r4
	ldr	r0, [r8, r5, asl #2]
	ldr	r3, [fp, #-228]
	mov	r2, #24
	add	r0, r0, #229376
	mov	r1, #0
	add	r0, r0, #20
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r8, r5, asl #2]
	ldr	r2, [fp, #-200]
	mov	ip, #0
	ldr	r1, [fp, #-184]
	add	r4, r3, #225280
	ldr	lr, [fp, #-172]
	ldr	r8, [fp, #-168]
	str	r2, [r3, #204]
	ldr	r0, [fp, #-204]
	str	r1, [r3, #220]
	ldr	r2, [fp, #-196]
	str	lr, [r3, #240]
	str	r8, [r3, #236]
	ldr	lr, [fp, #-188]
	ldr	r1, [fp, #-180]
	ldr	r8, [fp, #-164]
	str	r0, [r3, #208]
	str	r0, [r3, #280]
	str	r8, [r3, #244]
	str	r2, [r3, #212]
	str	r2, [r3, #284]
	str	lr, [r3, #224]
	str	r1, [r3, #228]
	str	ip, [r4, #2860]
	ldr	r4, [r3, #1404]
	str	ip, [r10, #684]
	cmp	r4, #1
	beq	.L1505
	ldr	r4, [r3, #272]
	ldr	ip, [r3, #4]
	rsb	r2, r4, r2
	str	r1, [r3, #288]
	rsb	r2, ip, r2
	add	ip, r4, ip
	sub	r2, r2, #47616
	add	ip, ip, r0
	sub	r2, r2, #16
	str	r2, [r3, #264]
	add	r1, r2, ip
	mov	r0, #14848
	add	r2, r1, #14848
	add	r1, r1, #15
	add	r2, r2, #15
	bic	r1, r1, #15
	bic	r2, r2, #15
	str	lr, [r3, #276]
	str	r2, [r3, #300]
	mov	r2, #32768
	str	ip, [r3, #260]
	str	r1, [r3, #292]
	str	r0, [r3, #296]
	str	r2, [r3, #304]
.L1506:
	ldr	r3, [r7, r5, asl #2]
	mov	r0, r5
	ldr	r4, .L1545+8
	str	r5, [r3, #8]
	ldr	r3, [r7, r5, asl #2]
	add	r2, r3, #188416
	str	r5, [r3, #188]
	str	r5, [r3, #192]
	str	r5, [r2, #3816]
	bl	FSP_EnableInstance
	subs	r8, r0, #0
	bne	.L1537
	mov	r0, r5
	mov	r7, #1
	bl	SM_ClearInst
	ldr	r3, [r4, r5, asl #2]
	ldr	r2, [fp, #-224]
	mov	r0, r5
	sub	r1, r2, #205824
	ldr	r3, [r3, #236]
	sub	r1, r1, #8
	add	r1, r3, r1
	bl	OpenUsdPool_WithMem
	ldr	r3, [r4, r5, asl #2]
	mov	r0, r5
	str	r7, [r3, #12]
	bl	VDMDRV_ClearChanIsDec
	bl	VCTRL_EnableAllInt
	bl	VDMDRV_ParamInit
	ldr	r3, [r6, #16]
	mov	r0, r8
	blx	r3
	str	r7, [r9, #48]
	mov	r0, r5
	bl	SM_AllocDSPCtxMem
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1530:
	ldr	r3, [r9, #20]
	cmp	r3, #0
	bgt	.L1526
	b	.L1469
.L1477:
	ldr	r3, [r6, #52]
	mov	r2, #16
	add	r1, r9, #112
	sub	r0, fp, #172
	blx	r3
	ldr	r2, [fp, #-164]
	ldr	r3, [fp, #-208]
	ldr	r1, .L1545
	cmp	r2, r3
	blt	.L1538
	ldr	r1, [fp, #-168]
	ldr	r0, [fp, #-172]
	str	r5, [fp, #-228]
	bl	MEM_AddMemRecord
	b	.L1479
.L1491:
	add	r1, r9, #96
	sub	r0, fp, #188
	ldr	r3, [r6, #52]
	mov	r2, #16
	blx	r3
	ldr	r1, [fp, #-184]
	cmp	r1, #0
	beq	.L1496
	ldr	r2, [fp, #-180]
	ldr	r3, [fp, #-212]
	cmp	r2, r3
	blt	.L1496
	ldr	r0, [fp, #-188]
	mov	r3, #0
	str	r3, [fp, #-236]
	bl	MEM_AddMemRecord
	b	.L1495
.L1482:
	ldr	r3, [r6, #52]
	mov	r2, #16
	sub	r0, fp, #204
	add	r1, r9, #80
	blx	r3
	ldr	r3, [r9, #144]
	ldr	r2, [fp, #-196]
	cmp	r3, #1
	beq	.L1488
	ldr	r3, [fp, #-216]
	cmp	r2, r3
	blt	.L1539
.L1488:
	ldr	r1, [fp, #-200]
	mov	r3, #0
	ldr	r0, [fp, #-204]
	str	r3, [fp, #-232]
	bl	MEM_AddMemRecord
	b	.L1486
.L1505:
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
	b	.L1506
.L1535:
	ldr	r3, [fp, #-228]
	cmp	r3, #1
	beq	.L1540
.L1493:
	ldr	r3, [fp, #-232]
	cmp	r3, #1
	beq	.L1541
.L1494:
	ldr	r3, [r6, #68]
	movw	r2, #2059
	ldr	r1, .L1545+28
	mov	r0, #1
	blx	r3
	mvn	r0, #0
	b	.L1524
.L1496:
	ldr	r3, [fp, #-228]
	cmp	r3, #1
	beq	.L1542
.L1498:
	ldr	r3, [fp, #-232]
	cmp	r3, #1
	beq	.L1543
.L1499:
	ldr	r3, [r6, #68]
	movw	r2, #2087
	ldr	r1, .L1545+32
	mov	r0, #1
	blx	r3
	mvn	r0, #0
	b	.L1524
.L1541:
	ldr	r1, [fp, #-200]
	ldr	r0, [fp, #-204]
	bl	MEM_ReleaseMemBlock
	sub	r0, fp, #204
	ldmia	r0, {r0, r1, r2}
	bl	MEM_DelMemRecord
	b	.L1494
.L1540:
	ldr	r1, [fp, #-168]
	ldr	r0, [fp, #-172]
	bl	MEM_ReleaseMemBlock
	sub	r0, fp, #172
	ldmia	r0, {r0, r1, r2}
	bl	MEM_DelMemRecord
	b	.L1493
.L1509:
	str	r3, [fp, #-240]
	mov	r5, r3
	b	.L1500
.L1534:
	ldr	r3, [fp, #-228]
	cmp	r3, #1
	beq	.L1544
.L1485:
	ldr	r3, [r6, #68]
	movw	r2, #2002
	ldr	r1, .L1545+36
	mov	r0, #1
	blx	r3
	mvn	r0, #0
	b	.L1524
.L1537:
	ldr	r3, [r6, #68]
	mov	r0, #1
	ldr	r1, .L1545+40
	mov	r7, #0
	blx	r3
	mov	r0, r5
	bl	FSP_DisableInstance
	mov	r0, r5
	bl	CloseUsdPool_WithMem
	ldr	r0, [r4, r5, asl #2]
	ldr	r3, [r6, #52]
	mov	r2, #16
	add	ip, r0, #227328
	add	r1, r0, #232
	ldr	lr, [r0, #256]
	add	ip, ip, #856
	str	ip, [fp, #-48]
	ldr	ip, [r0, #248]
	ldr	r0, [r0, #252]
	str	lr, [fp, #-68]
	str	ip, [fp, #-76]
	str	r0, [fp, #-72]
	sub	r0, fp, #108
	blx	r3
	ldr	r1, [r4, r5, asl #2]
	ldr	r3, [r6, #52]
	mov	r2, #16
	add	r1, r1, #200
	sub	r0, fp, #140
	blx	r3
	ldr	r1, [r4, r5, asl #2]
	ldr	r3, [r6, #52]
	mov	r2, #16
	add	r1, r1, #216
	sub	r0, fp, #124
	blx	r3
	ldr	r3, [fp, #-248]
	ldr	r2, [fp, #-244]
	sub	r0, fp, #92
	rsb	r1, r2, r3
	ldr	r3, .L1545+20
	mov	r2, #16
	add	r1, r3, r1
	ldr	r3, [r6, #52]
	blx	r3
	ldr	r1, [r4, r5, asl #2]
	mov	r2, #12
	ldr	r3, [r6, #52]
	add	r1, r1, #152
	sub	r0, fp, #64
	blx	r3
	mov	r0, r5
	str	r7, [r4, r5, asl #2]
	bl	VDMDRV_ClearChanIsDec
	bl	VCTRL_EnableAllInt
	ldr	r3, [r6, #16]
	mov	r0, r7
	blx	r3
	sub	r1, fp, #140
	mov	r0, r5
	bl	VCTRL_FreeChanResource
	mvn	r0, #0
	b	.L1524
.L1533:
	ldr	r3, [r6, #68]
	mov	r0, r5
	movw	r2, #1967
	ldr	r1, .L1545+44
	blx	r3
	mvn	r0, #0
	b	.L1524
.L1529:
	ldr	r3, [r6, #68]
	mov	r0, #0
	ldr	r1, .L1545+48
	blx	r3
	mvn	r0, #0
	b	.L1524
.L1532:
	ldr	r3, [r6, #68]
	movw	r2, #1959
	ldr	r1, .L1545+52
	mov	r0, #0
	blx	r3
	mvn	r0, #0
	b	.L1524
.L1538:
	ldr	r3, [r1, #68]
	movw	r2, #1983
	ldr	r1, .L1545+56
	mov	r0, #1
	blx	r3
	mvn	r0, #0
	b	.L1524
.L1528:
	ldr	ip, .L1545
	mov	r0, r9
	ldr	r3, .L1545+60
	movw	r2, #1909
	ldr	r1, .L1545+64
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1524
.L1539:
	ldr	r1, [fp, #-228]
	cmp	r1, #1
	bne	.L1489
	ldr	r1, [fp, #-168]
	ldr	r0, [fp, #-172]
	bl	MEM_ReleaseMemBlock
	sub	r0, fp, #172
	ldmia	r0, {r0, r1, r2}
	bl	MEM_DelMemRecord
	ldr	r2, [fp, #-196]
	ldr	r3, [fp, #-216]
.L1489:
	str	r3, [sp]
	mov	r0, #1
	mov	r3, r2
	ldr	r4, [r6, #68]
	movw	r2, #2034
	ldr	r1, .L1545+68
	blx	r4
	mvn	r0, #0
	b	.L1524
.L1544:
	ldr	r1, [fp, #-168]
	ldr	r0, [fp, #-172]
	bl	MEM_ReleaseMemBlock
	sub	r0, fp, #172
	ldmia	r0, {r0, r1, r2}
	bl	MEM_DelMemRecord
	b	.L1485
.L1543:
	ldr	r1, [fp, #-200]
	ldr	r0, [fp, #-204]
	bl	MEM_ReleaseMemBlock
	sub	r0, fp, #204
	ldmia	r0, {r0, r1, r2}
	bl	MEM_DelMemRecord
	b	.L1499
.L1542:
	ldr	r1, [fp, #-168]
	ldr	r0, [fp, #-172]
	bl	MEM_ReleaseMemBlock
	sub	r0, fp, #172
	ldmia	r0, {r0, r1, r2}
	bl	MEM_DelMemRecord
	b	.L1498
.L1546:
	.align	2
.L1545:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3
	.word	.LANCHOR0
	.word	.LC139
	.word	.LC70
	.word	s_SmIIS
	.word	s_pFspInst
	.word	.LC136
	.word	.LC137
	.word	.LC134
	.word	.LC138
	.word	.LC132
	.word	.LC130
	.word	.LC131
	.word	.LC133
	.word	.LC129
	.word	.LC1
	.word	.LC135
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
	bhi	.L1571
	ldr	r5, .L1574
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
	ldr	r2, .L1574+4
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
	b	.L1550
.L1552:
	.word	.L1562
	.word	.L1562
	.word	.L1562
	.word	.L1562
	.word	.L1562
	.word	.L1553
	.word	.L1553
	.word	.L1553
.L1562:
	mov	lr, #5
	mov	ip, #3
.L1551:
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
	beq	.L1557
	cmp	r4, #26
	beq	.L1572
	cmp	r4, #18
	moveq	r3, #4
	streq	r3, [fp, #-168]
	moveq	r3, #2
	streq	r3, [fp, #-144]
.L1557:
	sub	r2, fp, #248
	sub	r1, fp, #260
	mov	r0, r4
	bl	VCTRL_GetChanMemSize
	cmp	r0, #0
	bne	.L1573
	cmp	r6, #0
	beq	.L1563
	ldr	r3, [r6, #8]
	cmp	r3, #0
	beq	.L1560
	ldr	r2, [r6]
	cmp	r2, #0
	beq	.L1561
	ldr	r0, [r6, #4]
	cmp	r0, #0
	beq	.L1561
	ldr	r1, [fp, #-260]
	ldr	ip, [fp, #-248]
	add	r1, r1, ip
	cmp	r3, r1
	blt	.L1561
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
.L1560:
	sub	r1, fp, #204
	mov	r0, r4
	mov	r2, #1
	bl	VCTRL_CreateChanWithOption
	orr	r0, r0, r0, asr #31
.L1549:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1553:
	mov	lr, #3
	mov	ip, #1
	b	.L1551
.L1550:
	mov	lr, #8
	mov	ip, #6
	b	.L1551
.L1572:
	mov	r3, #16
	str	r3, [fp, #-168]
	mov	r3, #6
	str	r3, [fp, #-144]
	b	.L1557
.L1563:
	mov	r3, r6
	b	.L1560
.L1561:
	ldr	r3, [r5, #68]
	mov	r0, #1
	ldr	r1, .L1574+8
	blx	r3
	ldr	ip, [r6, #8]
	ldmia	r6, {r2, r3}
	mov	r0, #1
	ldr	r1, .L1574+12
	str	ip, [sp]
	ldr	r4, [r5, #68]
	blx	r4
	ldr	r1, [fp, #-260]
	ldr	r2, [fp, #-248]
	mov	r0, #1
	ldr	r3, [r5, #68]
	add	r2, r1, r2
	ldr	r1, .L1574+16
	blx	r3
	mvn	r0, #0
	b	.L1549
.L1571:
	ldr	r3, .L1574
	mov	r2, r0
	ldr	r1, .L1574+20
	mov	r0, #1
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1549
.L1573:
	ldr	r3, [r5, #68]
	mov	r0, #1
	ldr	r1, .L1574+24
	blx	r3
	mvn	r0, #0
	b	.L1549
.L1575:
	.align	2
.L1574:
	.word	vfmw_Osal_Func_Ptr_S
	.word	CapItem
	.word	.LC142
	.word	.LC143
	.word	.LC144
	.word	.LC140
	.word	.LC141
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #72)
	sub	sp, sp, #72
	subs	r8, r1, #0
	mov	r6, #0
	mov	r4, r0
	str	r6, [fp, #-92]
	beq	.L1613
	cmp	r0, #15
	bhi	.L1614
	ldr	r7, .L1623
	ldr	r3, [r7, r0, asl #2]
	cmp	r3, #0
	beq	.L1615
	ldr	r3, [r3, #12]
	cmp	r3, #1
	bne	.L1616
	bl	VCTRL_CheckChanWH
	subs	r5, r0, #0
	bne	.L1617
	ldr	r6, .L1623+4
	add	r0, r6, #748
	bl	GetVdecCapability
	ldr	r3, [r6, #768]
	ldr	r2, [r8]
	cmp	r3, #19
	bhi	.L1584
	cmp	r3, r2
	beq	.L1585
	add	r3, r6, #768
	add	r0, r6, #892
.L1587:
	ldr	r1, [r3, #4]!
	cmp	r1, #19
	bhi	.L1584
	cmp	r1, r2
	beq	.L1585
	cmp	r3, r0
	bne	.L1587
.L1585:
	cmp	r2, #8
	beq	.L1618
.L1588:
	cmp	r2, #9
	beq	.L1619
.L1590:
	cmp	r2, #5
	mov	r3, #0
	str	r3, [fp, #-88]
	beq	.L1620
.L1603:
	mov	r1, r8
	mov	r0, r4
	bl	VCTRL_CmpConfigParameter
	subs	r3, r0, #0
	beq	.L1621
	ldr	r6, .L1623+8
	mov	r2, #104
	ldr	r0, [r7, r4, asl #2]
	mov	r1, r8
	ldr	r3, [r6, #52]
	add	r0, r0, #48
	blx	r3
	ldr	ip, [r8, #12]
	ldr	r3, [r7, r4, asl #2]
	mov	r2, #52
	mov	r1, #0
	sub	r0, fp, #88
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
	str	r3, [fp, #-76]
	bl	MEM_Phy2Vir
	ldr	lr, [r7, r4, asl #2]
	ldr	r1, [r8, #80]
	mov	r2, #49152
	movt	r2, 63683
	ldr	r3, [r8]
	cmp	r1, #1
	ldr	ip, [r8, #12]
	str	r0, [fp, #-88]
	ldr	r0, [lr, #288]
	str	r2, [fp, #-68]
	ldreq	r2, [r8, #88]
	str	r0, [fp, #-72]
	ldreq	r0, [r8, #84]
	streq	r1, [fp, #-48]
	mov	r1, r9
	streq	r2, [fp, #-40]
	mov	r2, #8
	streq	r0, [fp, #-44]
	cmp	r3, #0
	str	r3, [fp, #-80]
	ldr	r0, [r8, #76]
	movne	r3, #0
	ldreq	r3, [r8, #48]
	strb	ip, [fp, #-84]
	str	r0, [fp, #-52]
	sub	r0, fp, #64
	str	r3, [fp, #-56]
	ldr	r3, [r6, #52]
	blx	r3
	sub	r1, fp, #88
	mov	r0, r4
	bl	SM_Config
	ldr	r3, [r6, #48]
	sub	r0, fp, #96
	mov	r2, #1
	mov	r1, #0
	blx	r3
	ldr	r3, [r8, #80]
	cmp	r3, #1
	beq	.L1622
.L1596:
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
	ldr	r6, .L1623
	add	r3, ip, #229376
	ldr	r7, .L1623+8
	ldr	r9, [ip, #528]
	ldr	r2, [r3, #112]
	cmp	r2, r9
	beq	.L1597
	mov	r0, r4
	bl	VCTRL_ResetChan
	ldr	r3, [r8]
	ldr	ip, [r6, r4, asl #2]
	cmp	r3, #19
	beq	.L1598
	ldr	r9, [ip, #528]
	add	r3, ip, #229376
.L1597:
	ldr	r2, .L1623+12
	ldr	r0, .L1623+16
	ldr	r1, .L1623+20
	add	lr, r2, #64
	str	r9, [r3, #112]
.L1602:
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
	bne	.L1602
	ldr	r0, .L1623+16
	bl	VDMDRV_SetPriority
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1621:
	ldr	r2, .L1623+8
	mov	r5, r3
	ldr	r1, .L1623+24
	ldr	r3, [r2, #68]
	blx	r3
.L1578:
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1584:
	ldr	r3, .L1623+8
	mov	r0, #0
	ldr	r1, .L1623+28
	mvn	r5, #0
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1618:
	sub	r0, fp, #92
	bl	REAL8DEC_Support
	ldr	r3, [fp, #-92]
	cmp	r3, #0
	ldrne	r2, [r8]
	bne	.L1588
.L1591:
	mvn	r5, #0
	b	.L1578
.L1619:
	sub	r0, fp, #92
	bl	REAL9DEC_Support
	ldr	r3, [fp, #-92]
	cmp	r3, #0
	beq	.L1591
	ldr	r2, [r8]
	b	.L1590
.L1620:
	sub	r0, fp, #88
	bl	DIVX3DEC_Support
	ldr	r3, [fp, #-88]
	cmp	r3, #0
	bne	.L1603
	b	.L1591
.L1616:
	ldr	ip, .L1623+8
	mov	r0, r6
	ldr	r3, .L1623+32
	movw	r2, #2873
	ldr	r1, .L1623+36
	mvn	r5, #0
	ldr	r4, [ip, #68]
	blx	r4
	b	.L1578
.L1622:
	sub	r1, fp, #96
	mov	r0, r4
	strb	r3, [fp, #-96]
	bl	FSP_ConfigAttribute
	b	.L1596
.L1617:
	ldr	r3, .L1623+8
	mov	r0, r6
	ldr	r1, .L1623+40
	mvn	r5, #0
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1578
.L1598:
	ldr	r3, [ip, #280]
	mov	r0, r4
	ldr	r2, [ip, #1276]
	ldr	r1, [ip, #1272]
	ldr	ip, [ip, #284]
	str	ip, [sp]
	bl	VCTRL_PartitionMemForStdUser
	cmp	r0, #0
	bne	.L1599
	ldr	ip, [r6, r4, asl #2]
	add	r3, ip, #229376
	ldr	r9, [ip, #528]
	b	.L1597
.L1614:
	ldr	ip, .L1623+8
	mov	r0, r6
	ldr	r3, .L1623+44
	movw	r2, #2871
	ldr	r1, .L1623+36
	mvn	r5, #0
	ldr	r4, [ip, #68]
	blx	r4
	b	.L1578
.L1615:
	ldr	ip, .L1623+8
	mov	r0, r3
	movw	r2, #2872
	ldr	r3, .L1623+48
	ldr	r1, .L1623+36
	mvn	r5, #0
	ldr	r4, [ip, #68]
	blx	r4
	b	.L1578
.L1613:
	ldr	ip, .L1623+8
	mov	r0, r8
	ldr	r3, .L1623+52
	movw	r2, #2870
	ldr	r1, .L1623+36
	mvn	r5, #0
	ldr	r4, [ip, #68]
	blx	r4
	b	.L1578
.L1599:
	ldr	r3, [r7, #68]
	mov	r0, #1
	ldr	r1, .L1623+56
	mvn	r5, #0
	blx	r3
	b	.L1578
.L1624:
	.align	2
.L1623:
	.word	.LANCHOR0
	.word	.LANCHOR3
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0-4
	.word	.LANCHOR3+896
	.word	g_ChanCtx
	.word	.LC148
	.word	.LC147
	.word	.LC13
	.word	.LC1
	.word	.LC146
	.word	.LC6
	.word	.LC2
	.word	.LC145
	.word	.LC149
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
	beq	.L1704
	cmp	r0, #516
	ldr	r4, [r1]
	beq	.L1627
	bls	.L1728
	cmp	r0, #1280
	beq	.L1649
	bhi	.L1650
	movw	r3, #898
	cmp	r0, r3
	beq	.L1651
	bhi	.L1652
	movw	r3, #769
	cmp	r0, r3
	beq	.L1653
	bls	.L1729
	cmp	r0, #896
	beq	.L1656
	movw	r3, #897
	cmp	r0, r3
	bne	.L1704
	mov	r0, r4
	bl	VCTRL_ResetChan
	ldr	r3, .L1741
	ldr	r1, .L1741+4
	mov	r2, r4
.L1723:
	ldr	r4, [r3, #68]
	mov	r3, r0
	mov	r0, #32
	blx	r4
.L1726:
	mov	r0, #1
.L1626:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1650:
	movw	r3, #1537
	cmp	r0, r3
	beq	.L1663
	bhi	.L1664
	movw	r3, #1282
	cmp	r0, r3
	beq	.L1665
	bcc	.L1666
	movw	r3, #1283
	cmp	r0, r3
	beq	.L1667
	cmp	r0, #1536
	bne	.L1704
	cmp	r4, #15
	bhi	.L1722
	ldr	ip, .L1741+8
	mov	r5, #1
	ldr	r3, .L1741
	mov	r2, r4
	ldr	r1, .L1741+12
	mov	r0, #32
	ldr	ip, [ip, r4, asl #2]
	ldr	r3, [r3, #68]
	str	r5, [ip, #1232]
	blx	r3
	mov	r0, r5
	b	.L1626
.L1728:
	cmp	r0, #8
	beq	.L1726
	bls	.L1730
	movw	r3, #257
	cmp	r0, r3
	beq	.L1637
	bhi	.L1638
	cmp	r0, #12
	beq	.L1639
	bls	.L1731
	cmp	r0, #13
	beq	.L1642
	cmp	r0, #256
	bne	.L1704
	ldr	r3, .L1741
	mov	r0, #32
	ldr	r1, .L1741+16
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, r4
	bl	DBG_PrintTracer
	b	.L1726
.L1652:
	cmp	r0, #1024
	beq	.L1658
	bls	.L1732
	movw	r3, #1025
	cmp	r0, r3
	beq	.L1661
	movw	r3, #1026
	cmp	r0, r3
	bne	.L1704
	ldr	ip, .L1741+8
	mov	r2, r4
	ldr	r3, .L1741
	mov	r0, #32
	ldr	r1, .L1741+20
	str	r4, [ip, #3864]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1626
.L1638:
	movw	r3, #513
	cmp	r0, r3
	beq	.L1644
	bls	.L1733
	movw	r3, #514
	cmp	r0, r3
	beq	.L1647
	movw	r3, #515
	cmp	r0, r3
	bne	.L1704
	ldr	r7, .L1741
	mov	r0, r4
	ldr	r3, [r7, #188]
	blx	r3
	subs	r5, r0, #0
	beq	.L1734
	mov	r0, #16
	ldr	r6, [r7, #72]
	bl	VFMW_GetString
	str	r4, [sp]
	mov	r1, #50
	ldr	r3, .L1741+24
	mov	r2, r0
	sub	r0, fp, #148
	blx	r6
	sub	r0, fp, #148
	ldr	r3, [r7, #32]
	mov	r2, #0
	mov	r1, #66
	blx	r3
	subs	r4, r0, #0
	beq	.L1695
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
	ldr	r1, .L1741+28
	mov	r0, #32
	blx	r3
	b	.L1726
.L1664:
	movw	r3, #1539
	cmp	r0, r3
	beq	.L1669
	bcc	.L1670
	movw	r3, #1540
	cmp	r0, r3
	beq	.L1671
	movw	r3, #1541
	cmp	r0, r3
	bne	.L1704
	ldr	r3, .L1741
	mov	r2, r4
	ldr	r1, .L1741+32
	mov	r0, #32
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1726
.L1730:
	cmp	r0, #3
	beq	.L1726
	bls	.L1735
	cmp	r0, #5
	beq	.L1634
	bcc	.L1635
	cmp	r0, #6
	beq	.L1726
	cmp	r0, #7
	bne	.L1704
	ldr	r6, .L1741
	mov	r5, r4, lsr #24
	bic	r4, r4, #-16777216
	mov	r2, #104
	mov	r1, #0
	sub	r0, fp, #148
	ldr	r3, [r6, #48]
	blx	r3
	mov	r3, r4
	mov	r2, r5
	ldr	r1, .L1741+36
	ldr	r6, [r6, #68]
	mov	r0, #32
	blx	r6
	sub	r1, fp, #148
	mov	r0, r5
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L1726
	sub	r1, fp, #148
	mov	r0, r5
	str	r4, [fp, #-128]
	bl	VCTRL_ConfigChan
	b	.L1726
.L1735:
	cmp	r0, #1
	beq	.L1726
	ldrls	r3, .L1741+40
	movls	r0, #1
	strls	r4, [r3]
	bls	.L1626
.L1736:
	ldr	r7, .L1741
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
	ldr	r1, .L1741+44
	ldr	r7, [r7, #68]
	mov	r0, #32
	blx	r7
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L1726
	mov	r1, r5
	mov	r0, r6
	str	r4, [fp, #-132]
	bl	VCTRL_ConfigChan
	b	.L1726
.L1667:
	ldr	ip, .L1741+48
	mov	r2, r4
	ldr	r3, .L1741
	mov	r0, #32
	ldr	r1, .L1741+52
	str	r4, [ip]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1626
.L1635:
	ldr	r7, .L1741
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
	ldr	r1, .L1741+56
	ldr	r7, [r7, #68]
	mov	r0, #32
	blx	r7
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L1726
	mov	r1, r5
	mov	r0, r6
	str	r4, [fp, #-120]
	bl	VCTRL_ConfigChan
	b	.L1726
.L1656:
	mov	r0, r4
	bl	VCTRL_StopChan
	ldr	r3, .L1741
	mov	r2, r4
	ldr	r1, .L1741+60
	b	.L1723
.L1647:
	cmp	r4, #15
	bhi	.L1726
	ldr	r6, .L1741+64
	add	r7, r6, r4, lsl #2
	ldr	r5, [r7, #1108]
	cmp	r5, #0
	beq	.L1737
	ldr	r5, .L1741
	mov	r0, #32
	ldr	r1, .L1741+68
	mov	r4, #0
	ldr	r3, [r5, #68]
	blx	r3
	ldr	r3, [r5, #36]
	ldr	r0, [r7, #1108]
	blx	r3
	ldr	r0, [r6, #1248]
	ldr	r3, .L1741+72
	mvn	r2, #0
	cmp	r0, r4
	str	r4, [r7, #1108]
	str	r4, [r6, #1256]
	str	r2, [r3, #68]
	str	r4, [r6, #1260]
	str	r4, [r6, #1264]
	str	r4, [r6, #1268]
	beq	.L1726
	ldr	r1, [r6, #1244]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [r6, #1252]
	ldr	r1, [r6, #1244]
	ldr	r0, [r6, #1248]
	bl	MEM_DelMemRecord
	ldr	r3, [r5, #48]
	mov	r1, r4
	mov	r2, #16
	ldr	r0, .L1741+76
	blx	r3
	mov	r0, #1
	b	.L1626
.L1671:
	mov	r2, r4, asl #6
	ldr	r3, .L1741+80
	sub	r4, r2, r4, asl #4
	mov	r0, #1
	add	r4, r3, r4
	mov	r2, #0
	ldr	r3, [r4, #40]
	str	r2, [r3, #80]
	b	.L1626
.L1642:
	cmp	r4, #16
	ldrhi	r3, .L1741
	movhi	r2, r4
	ldrls	ip, .L1741+64
	movhi	r0, #32
	ldrls	r3, .L1741
	movls	r2, r4
	ldrhi	r1, .L1741+84
	movls	r0, #32
	ldrls	r1, .L1741+88
	strls	r4, [ip, #960]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1626
.L1661:
	ldr	ip, .L1741+64
	mov	r2, r4
	ldr	r3, .L1741
	mov	r0, #32
	ldr	r1, .L1741+92
	str	r4, [ip, #1272]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1626
.L1704:
	mvn	r0, #1
	b	.L1626
.L1732:
	movw	r3, #899
	cmp	r0, r3
	bne	.L1704
	mov	r0, r4
	ldr	r5, .L1741
	bl	VCTRL_StopChan
	mov	r2, r4
	ldr	r1, .L1741+60
	ldr	r6, [r5, #68]
	mov	r3, r0
	mov	r0, #32
	blx	r6
	mov	r0, r4
	bl	VCTRL_ResetChan
	mov	r2, r4
	ldr	r1, .L1741+4
	ldr	r6, [r5, #68]
	mov	r3, r0
	mov	r0, #32
	blx	r6
	mov	r0, r4
	bl	VCTRL_StartChan
	ldr	r5, [r5, #68]
	mov	r2, r4
	ldr	r1, .L1741+96
	mov	r3, r0
	mov	r0, #32
	blx	r5
	mov	r0, #1
	b	.L1626
.L1731:
	cmp	r0, #11
	bne	.L1704
	cmp	r4, #1
	ldrls	ip, .L1741+100
	movls	r2, r4
	ldrls	r3, .L1741
	movls	r0, #32
	ldrhi	r3, .L1741
	movhi	r2, r4
	strls	r4, [ip]
	movhi	r0, #32
	ldrls	r1, .L1741+104
	ldrhi	r1, .L1741+108
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1626
.L1729:
	cmp	r0, #768
	bne	.L1704
	bl	VCTRL_Suspend
	mov	r0, #1
	b	.L1626
.L1733:
	cmp	r0, #512
	bne	.L1704
	cmp	r4, #15
	bhi	.L1726
	ldr	r6, .L1741+64
	add	r5, r6, r4, lsl #2
	ldr	r7, [r5, #552]
	cmp	r7, #0
	beq	.L1738
	ldr	r4, .L1741
	mov	r0, #32
	ldr	r1, .L1741+112
	ldr	r3, [r4, #68]
	blx	r3
	ldr	r3, [r4, #36]
	ldr	r0, [r5, #552]
	blx	r3
	mov	r3, #0
	mov	r0, #1
	str	r3, [r5, #552]
	b	.L1626
.L1658:
	ldr	ip, .L1741+8
	mov	r2, r4
	ldr	r3, .L1741
	mov	r0, #32
	ldr	r1, .L1741+116
	str	r4, [ip, #3860]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1626
.L1639:
	cmp	r4, #1
	ldrls	ip, .L1741+64
	movls	r2, r4
	ldrls	r3, .L1741
	movls	r0, #32
	ldrhi	r3, .L1741
	movhi	r2, r4
	ldrls	r1, .L1741+120
	movhi	r0, #32
	strls	r4, [ip, #548]
	ldrhi	r1, .L1741+124
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1626
.L1653:
	bl	VCTRL_Resume
	mov	r0, #1
	b	.L1626
.L1644:
	cmp	r4, #15
	bhi	.L1726
	ldr	r5, .L1741+64
	mov	r6, r4, asl #2
	add	r3, r5, r6
	ldr	r3, [r3, #972]
	cmp	r3, #0
	beq	.L1739
	ldr	r4, .L1741
	add	r5, r5, r6
	ldr	r1, .L1741+128
	mov	r0, #32
	ldr	r3, [r4, #68]
	blx	r3
	ldr	r3, [r4, #36]
	ldr	r0, [r5, #972]
	blx	r3
	mov	r3, #0
	mov	r0, #1
	str	r3, [r5, #972]
	b	.L1626
.L1634:
	ldr	r6, .L1741
	mov	r5, r4, lsr #24
	and	r4, r4, #7
	mov	r2, #104
	mov	r1, #0
	sub	r0, fp, #148
	ldr	r3, [r6, #48]
	blx	r3
	mov	r3, r4
	mov	r2, r5
	ldr	r1, .L1741+132
	ldr	r7, [r6, #68]
	mov	r0, #32
	blx	r7
	sub	r1, fp, #148
	mov	r0, r5
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L1675
	sub	r1, fp, #148
	mov	r0, r5
	str	r4, [fp, #-124]
	bl	VCTRL_ConfigChan
	b	.L1726
.L1649:
	ldr	ip, .L1741+136
	mov	r2, r4
	ldr	r3, .L1741
	mov	r0, #32
	ldr	r1, .L1741+140
	str	r4, [ip]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1626
.L1670:
	ldr	ip, .L1741+144
	mov	r2, r4
	ldr	r3, .L1741
	mov	r0, #32
	ldr	r1, .L1741+12
	str	r4, [ip]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1626
.L1669:
	mov	r2, r4, asl #6
	ldr	r3, .L1741+80
	sub	r4, r2, r4, asl #4
	mov	r2, #1
	add	r4, r3, r4
	mov	r0, r2
	ldr	r3, [r4, #40]
	str	r2, [r3, #80]
	b	.L1626
.L1722:
	ldr	r3, .L1741
	mov	r0, #0
	ldr	r1, .L1741+148
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1726
.L1666:
	ldr	ip, .L1741+152
	mov	r2, r4
	ldr	r3, .L1741
	mov	r0, #32
	ldr	r1, .L1741+156
	str	r4, [ip]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1626
.L1665:
	ldr	ip, .L1741+160
	mov	r2, r4
	ldr	r3, .L1741
	mov	r0, #32
	ldr	r1, .L1741+164
	str	r4, [ip]
	ldr	r3, [r3, #68]
	blx	r3
	mov	r0, #1
	b	.L1626
.L1627:
	ldr	r6, .L1741
	mov	r0, r4
	ldmib	r1, {r7, r8}
	ldr	r3, [r6, #188]
	blx	r3
	subs	r9, r0, #0
	beq	.L1740
	mov	r0, #17
	ldr	r10, [r6, #72]
	bl	VFMW_GetString
	sub	r5, fp, #148
	str	r4, [sp]
	mov	r1, #50
	ldr	r3, .L1741+24
	mov	r2, r0
	mov	r0, r5
	blx	r10
	mov	r0, r5
	ldr	r3, [r6, #32]
	mov	r2, #0
	mov	r1, #66
	blx	r3
	subs	r4, r0, #0
	beq	.L1698
	ldr	r3, .L1741+168
	ldr	r10, [r3, #116]
	cmp	r10, #0
	beq	.L1699
	mov	ip, #1
	mov	r3, r8
	mov	r2, r7
	mov	r1, r9
	str	ip, [sp]
	blx	r10
.L1700:
	mov	r0, r4
	ldr	r3, [r6, #36]
	blx	r3
	ldr	r3, [r6, #68]
	mov	r2, r5
	ldr	r1, .L1741+172
	mov	r0, #32
	blx	r3
	b	.L1726
.L1651:
	mov	r0, r4
	bl	VCTRL_StartChan
	ldr	r3, .L1741
	mov	r2, r4
	ldr	r1, .L1741+96
	b	.L1723
.L1637:
	ldr	r5, .L1741+40
	mov	r0, r4
	mov	r1, #1
	mov	r3, #67108864
	ldr	r4, [r5]
	str	r3, [r5]
	bl	PrintScdRawState
	mov	r0, #1
	str	r4, [r5]
	b	.L1626
.L1663:
	cmp	r4, #15
	bhi	.L1722
	ldr	ip, .L1741+8
	mov	lr, #0
	ldr	r3, .L1741
	mov	r2, r4
	ldr	r1, .L1741+12
	mov	r0, #32
	ldr	ip, [ip, r4, asl #2]
	ldr	r3, [r3, #68]
	str	lr, [ip, #1232]
	blx	r3
	mov	r0, #1
	b	.L1626
.L1675:
	ldr	r3, [r6, #68]
	mov	r2, r5
	ldr	r1, .L1741+176
	mov	r0, #32
	blx	r3
	b	.L1726
.L1740:
	ldr	r3, [r6, #68]
	mov	r2, r4
	ldr	r1, .L1741+180
	mov	r0, #32
	blx	r3
	b	.L1726
.L1734:
	ldr	r3, [r7, #68]
	mov	r2, r4
	ldr	r1, .L1741+180
	mov	r0, #32
	blx	r3
	b	.L1726
.L1739:
	ldr	r7, .L1741
	mov	r0, #14
	add	r6, r5, r6
	ldr	r8, [r7, #72]
	bl	VFMW_GetString
	ldr	r2, [r5, #1100]
	mov	r1, #50
	ldr	r3, .L1741+24
	add	ip, r2, #1
	str	ip, [r5, #1100]
	str	r2, [sp]
	mov	r2, r0
	sub	r0, fp, #148
	blx	r8
	ldr	r3, [r7, #32]
	sub	r0, fp, #148
	mov	r2, #0
	mov	r1, #66
	blx	r3
	str	r4, [r5, #1104]
	cmp	r0, #0
	str	r0, [r6, #972]
	beq	.L1687
	ldr	r5, [r7, #68]
	mov	r3, r4
	sub	r2, fp, #148
	ldr	r1, .L1741+184
	mov	r0, #32
	blx	r5
	b	.L1726
.L1738:
	ldr	r8, .L1741
	mov	r0, #13
	ldr	r9, [r8, #72]
	bl	VFMW_GetString
	ldr	r2, [r6, #964]
	mov	r1, #50
	ldr	r3, .L1741+24
	add	ip, r2, #1
	str	ip, [r6, #964]
	str	r2, [sp]
	mov	r2, r0
	sub	r0, fp, #148
	blx	r9
	mov	r2, r7
	ldr	r3, [r8, #32]
	sub	r0, fp, #148
	mov	r1, #66
	blx	r3
	str	r4, [r6, #968]
	cmp	r0, #0
	str	r0, [r5, #552]
	beq	.L1683
	ldr	r5, [r8, #68]
	mov	r3, r4
	sub	r2, fp, #148
	ldr	r1, .L1741+188
	mov	r0, #32
	blx	r5
	b	.L1726
.L1695:
	ldr	r3, [r7, #68]
	sub	r2, fp, #148
	ldr	r1, .L1741+192
	mov	r0, #32
	blx	r3
	b	.L1726
.L1699:
	mov	r0, r10
	ldr	r3, [r6, #68]
	movw	r2, #7876
	ldr	r1, .L1741+196
	blx	r3
	b	.L1700
.L1737:
	ldr	r8, .L1741
	mov	r0, #15
	ldr	r9, .L1741+72
	ldr	r10, [r8, #72]
	bl	VFMW_GetString
	ldr	r2, [r6, #1236]
	add	r3, r9, #4
	mov	r1, #100
	add	ip, r2, #1
	str	ip, [r6, #1236]
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
	str	r0, [r7, #1108]
	beq	.L1690
	ldr	r3, [r8, #48]
	mov	r2, #16
	mov	r1, r5
	ldr	r0, .L1741+76
	blx	r3
	mov	r0, #19
	bl	VFMW_GetString
	str	r5, [sp]
	ldr	r3, .L1741+76
	mov	r2, #14155776
	mov	r1, r5
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	beq	.L1691
	ldr	r3, [r8, #68]
	mov	r0, #1
	ldr	r1, .L1741+200
	blx	r3
	ldr	r3, [r8, #36]
	ldr	r0, [r7, #1108]
	blx	r3
	mvn	r3, #0
	str	r5, [r7, #1108]
	str	r5, [r6, #1256]
	str	r5, [r6, #1260]
	str	r5, [r6, #1264]
	str	r5, [r6, #1268]
	str	r3, [r9, #68]
	b	.L1726
.L1698:
	ldr	r3, [r6, #68]
	mov	r2, r5
	ldr	r1, .L1741+192
	mov	r0, #32
	blx	r3
	b	.L1726
.L1691:
	ldr	r2, [r6, #1252]
	ldr	r1, [r6, #1244]
	ldr	r0, [r6, #1248]
	bl	MEM_AddMemRecord
	ldr	r3, [r6, #1244]
	mov	r0, r4, lsr #24
	ldr	r5, [r8, #68]
	add	ip, r3, #9437184
	add	r1, r3, #11796480
	str	r3, [r6, #1264]
	and	r4, r4, #3
	str	r1, [r6, #1256]
	mov	r3, r0
	str	r0, [r9, #68]
	sub	r2, fp, #148
	str	ip, [r6, #1260]
	mov	r0, #32
	str	r4, [r6, #1268]
	ldr	r1, .L1741+204
	str	r4, [sp]
	blx	r5
	b	.L1726
.L1687:
	ldr	r3, [r7, #68]
	sub	r2, fp, #148
	ldr	r1, .L1741+208
	mov	r0, #32
	blx	r3
	b	.L1726
.L1683:
	ldr	r3, [r8, #68]
	sub	r2, fp, #148
	ldr	r1, .L1741+212
	mov	r0, #32
	blx	r3
	b	.L1726
.L1690:
	ldr	r3, [r8, #68]
	sub	r2, fp, #148
	ldr	r1, .L1741+216
	mov	r0, #32
	blx	r3
	b	.L1726
.L1742:
	.align	2
.L1741:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC177
	.word	.LANCHOR0
	.word	.LC187
	.word	.LC161
	.word	.LC181
	.word	.LANCHOR2+4
	.word	.LC173
	.word	.LC188
	.word	.LC154
	.word	g_PrintEnable
	.word	.LC150
	.word	g_TraceImgPeriod
	.word	.LC185
	.word	.LC151
	.word	.LC176
	.word	.LANCHOR3
	.word	.LC171
	.word	.LANCHOR2
	.word	.LANCHOR3+1240
	.word	s_SmIIS
	.word	.LC159
	.word	.LC160
	.word	.LC180
	.word	.LC178
	.word	USE_FF_APT_EN
	.word	.LC155
	.word	.LC156
	.word	.LC164
	.word	.LC179
	.word	.LC157
	.word	.LC158
	.word	.LC167
	.word	.LC152
	.word	g_TraceCtrl
	.word	.LC182
	.word	g_TunnelLineNumber
	.word	.LC186
	.word	g_TraceBsPeriod
	.word	.LC183
	.word	g_TraceFramePeriod
	.word	.LC184
	.word	g_vdm_hal_fun_ptr
	.word	.LC175
	.word	.LC153
	.word	.LC172
	.word	.LC165
	.word	.LC162
	.word	.LC174
	.word	.LC8
	.word	.LC168
	.word	.LC169
	.word	.LC166
	.word	.LC163
	.word	.LC170
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
	beq	.L1770
	cmp	r0, #15
	bhi	.L1771
	ldr	r6, .L1777
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L1772
	ldr	r2, [r7]
	cmp	r2, #1
	bhi	.L1773
	ldr	r9, [r3, #16]
	bl	VCTRL_StopChan
	ldr	r8, .L1777+4
	mov	r5, #0
	ldr	r3, [r6, r4, asl #2]
	mov	r2, #300
	ldr	r0, .L1777+8
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
	add	r1, r1, #120
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
	beq	.L1750
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L1774
.L1750:
	bl	FSP_EmptyInstance
.L1751:
	mov	r0, r4
	bl	InitUsdPool
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L1775
.L1752:
	ldr	r3, .L1777+12
	ldr	r2, [r3, #548]
	cmp	r2, #0
	beq	.L1753
	add	r5, r3, r4, lsl #2
	str	r4, [fp, #-48]
	ldr	r3, [r5, #552]
	cmp	r3, #0
	beq	.L1755
	mov	r0, #512
	sub	r1, fp, #48
	bl	VCTRL_SetDbgOption
	ldr	r3, [r5, #552]
	cmp	r3, #0
	beq	.L1755
	sub	r1, fp, #48
	mov	r0, #512
	bl	VCTRL_SetDbgOption
.L1755:
	ldr	r3, [r8, #68]
	mov	r0, #32
	ldr	r1, .L1777+16
	blx	r3
.L1753:
	cmp	r9, #0
	bne	.L1776
.L1757:
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	mov	r0, #0
.L1745:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1775:
	mov	r0, r4
	bl	SM_Reset
	b	.L1752
.L1776:
	mov	r0, r4
	bl	VCTRL_StartChan
	b	.L1757
.L1774:
	bl	FSP_ResetInstance
	b	.L1751
.L1773:
	ldr	r3, .L1777+4
	movw	r2, #3508
	ldr	r1, .L1777+20
	mov	r0, #0
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L1745
.L1771:
	ldr	ip, .L1777+4
	movw	r2, #3503
	ldr	r3, .L1777+24
	mov	r0, #0
	ldr	r1, .L1777+28
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1745
.L1770:
	ldr	ip, .L1777+4
	mov	r0, r7
	ldr	r3, .L1777+32
	movw	r2, #3502
	ldr	r1, .L1777+28
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1745
.L1772:
	ldr	ip, .L1777+4
	mov	r0, r3
	mov	r2, #3504
	ldr	r3, .L1777+36
	ldr	r1, .L1777+28
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1745
.L1778:
	.align	2
.L1777:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+3868
	.word	.LANCHOR3
	.word	.LC128
	.word	.LC190
	.word	.LC6
	.word	.LC1
	.word	.LC189
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
	ldr	r5, .L1790
	mov	r4, r0
	mov	r0, #0
	ldr	r3, [r5, #12]
	blx	r3
	cmp	r4, #15
	bhi	.L1786
	ldr	r7, .L1790+4
	ldr	r6, [r7, r4, asl #2]
	cmp	r6, #0
	beq	.L1787
	ldr	r3, [r6, #12]
	cmp	r3, #1
	bne	.L1788
	ldr	r2, .L1790+8
	mov	r8, #0
	ldr	r3, [r5, #12]
	mov	r0, #4
	str	r8, [r2, r4, asl #2]
	blx	r3
	mov	r0, r4
	bl	VCTRL_StopChan
	subs	r6, r0, #0
	bne	.L1789
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
	str	r6, [r2, #3604]
	blx	r3
	mov	r0, r4
	bl	FSP_DisableInstance
	mov	r0, r4
	bl	CloseUsdPool_WithMem
	ldr	r3, [r7, r4, asl #2]
	ldr	r8, [r5, #52]
	mov	r2, #16
	add	r1, r3, #232
	add	r0, r3, #227328
	ldr	lr, [r3, #248]
	add	r0, r0, #856
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
	ldr	r8, .L1790+12
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
	ldr	r3, .L1790+16
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
.L1781:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1788:
	ldr	r4, [r5, #68]
	movw	r2, #2466
	ldr	r3, .L1790+20
.L1785:
	ldr	r1, .L1790+24
	mov	r0, #0
	blx	r4
	bl	VCTRL_EnableAllInt
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1789:
	ldr	r3, [r5, #16]
	mov	r0, #4
	blx	r3
	ldr	r3, [r5, #16]
	mov	r0, r8
	blx	r3
	mvn	r0, #0
	b	.L1781
.L1786:
	ldr	r4, [r5, #68]
	movw	r2, #2440
	ldr	r3, .L1790+28
	b	.L1785
.L1787:
	movw	r2, #2451
	ldr	r3, .L1790+32
	ldr	r1, .L1790+24
	mov	r0, r6
	ldr	r4, [r5, #68]
	blx	r4
	bl	VCTRL_EnableAllInt
	ldr	r3, [r5, #16]
	mov	r0, r6
	blx	r3
	mvn	r0, #0
	b	.L1781
.L1791:
	.align	2
.L1790:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	g_LowDelaySeqIndex
	.word	s_SmIIS
	.word	s_pFspInst
	.word	.LC193
	.word	.LC191
	.word	.LC6
	.word	.LC192
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
	ldr	r6, .L1811
	ldr	r3, [r6, #64]
	cmp	r3, #1
	bne	.L1800
	sub	r5, r6, #4
	mov	r4, #0
.L1796:
	ldr	r3, [r5, #4]!
	mov	r0, r4
	add	r4, r4, #1
	cmp	r3, #0
	beq	.L1795
	bl	VCTRL_DestroyChanWithOption
.L1795:
	cmp	r4, #16
	bne	.L1796
	bl	FSP_Exit
	ldr	r3, [r6, #68]
	mov	r2, #3
	ldr	r5, .L1811+4
	cmp	r3, #0
	str	r2, [r6, #72]
	beq	.L1798
	mov	r0, #10
	ldr	r3, [r5, #124]
	mov	r4, #49
	blx	r3
	b	.L1799
.L1810:
	ldr	r3, [r5, #124]
	blx	r3
	subs	r4, r4, #1
	beq	.L1798
.L1799:
	ldr	r3, [r6, #68]
	mov	r0, #10
	cmp	r3, #0
	bne	.L1810
.L1798:
	ldr	r3, [r5, #48]
	mov	r2, #64
	mov	r1, #0
	ldr	r0, .L1811+8
	blx	r3
	ldr	r0, .L1811+12
	bl	CloseDrivers
	bl	DBG_DestroyTracer
	mov	r3, #0
	mov	r0, r3
	str	r3, [r6, #64]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1800:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1812:
	.align	2
.L1811:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+3604
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
	bhi	.L1855
	ldr	r8, .L1862
	ldr	r0, [r8, r0, asl #2]
	cmp	r0, #0
	beq	.L1856
	ldr	r3, [r0, #528]
	cmp	r3, #0
	beq	.L1857
	ldr	r5, [r8, #3604]
	cmp	r5, #0
	bne	.L1840
	mov	r2, r5
	mov	r7, r5
.L1836:
	ldr	r1, .L1862+4
	add	r0, r1, #60
.L1822:
	ldr	r5, [r1, #4]!
	cmp	r5, #0
	bne	.L1818
	cmp	r1, r0
	bne	.L1822
.L1829:
	ldr	r4, .L1862+8
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L1858
	mov	r0, #0
	blx	r3
.L1824:
	ldr	r3, [r4, #8]
	cmp	r3, #0
	beq	.L1859
	mov	r0, #0
	blx	r3
.L1826:
	clz	r5, r5
	mov	r5, r5, lsr #5
	ands	r1, r5, r7
	beq	.L1860
	ldr	r3, [r8, r6, asl #2]
	add	r6, r8, r6, lsl #2
	mov	r1, #0
	ldr	r0, [r3, #528]
	bl	WriteHexFile
	mov	r3, #1
	str	r3, [r6, #3604]
.L1830:
	ldr	r1, .L1862+12
	mov	r0, #0
	add	lr, r1, #64
.L1833:
	ldr	r2, [r1, #4]!
	mov	r3, #0
	cmp	r2, r3
	beq	.L1831
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
.L1831:
	cmp	r1, lr
	bne	.L1833
	cmp	r0, #0
	bne	.L1834
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L1861
	blx	r3
.L1834:
	bl	VCTRL_CloseHardware
	mov	r0, #0
.L1852:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1857:
	ldr	r2, [r0, #1236]
	ldr	r5, [r8, #3604]
	sub	r7, r2, #1
	clz	r7, r7
	cmp	r5, #0
	mov	r7, r7, lsr #5
	beq	.L1836
.L1818:
	cmp	r5, #2
	movne	r1, #0
	andeq	r1, r7, #1
	cmp	r1, #0
	bne	.L1820
.L1821:
	cmp	r5, #1
	cmpeq	r3, #6
	bne	.L1829
.L1820:
	ldr	ip, .L1862+16
	mov	r0, #0
	str	r5, [sp]
	ldr	r1, .L1862+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1852
.L1860:
	ldr	r3, [r8, r6, asl #2]
	ldr	r7, .L1862
	ldr	r0, [r3, #528]
	cmp	r0, #6
	movne	r5, #0
	andeq	r5, r5, #1
	cmp	r5, #0
	beq	.L1830
	add	r6, r7, r6, lsl #2
	bl	WriteHexFile
	mov	r3, #2
	str	r3, [r6, #3604]
	b	.L1830
.L1859:
	ldr	ip, .L1862+16
	mov	r0, r3
	movw	r2, #3372
	ldr	r1, .L1862+24
	ldr	r3, [ip, #68]
	blx	r3
	b	.L1826
.L1858:
	ldr	ip, .L1862+16
	mov	r0, r3
	movw	r2, #3371
	ldr	r1, .L1862+24
	ldr	r3, [ip, #68]
	blx	r3
	b	.L1824
.L1861:
	ldr	r3, .L1862+16
	movw	r2, #3425
	ldr	r1, .L1862+24
	ldr	r3, [r3, #68]
	blx	r3
	b	.L1834
.L1840:
	mov	r2, #0
	mov	r7, r2
	b	.L1821
.L1855:
	ldr	ip, .L1862+16
	movw	r2, #3199
	ldr	r3, .L1862+28
	mov	r0, #0
	ldr	r1, .L1862+32
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1852
.L1856:
	ldr	ip, .L1862+16
	mov	r2, #3200
	ldr	r3, .L1862+36
	ldr	r1, .L1862+32
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	b	.L1852
.L1863:
	.align	2
.L1862:
	.word	.LANCHOR0
	.word	.LANCHOR0+3604
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR0-4
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC194
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
	bhi	.L1868
	ldr	r3, .L1869
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	addne	r0, r0, #225280
	strne	r1, [r0, #2860]
	ldmnefd	sp, {fp, sp, pc}
	ldr	ip, .L1869+4
	movw	r2, #8480
	ldr	r3, .L1869+8
	b	.L1867
.L1868:
	ldr	ip, .L1869+4
	movw	r2, #8479
	ldr	r3, .L1869+12
	mov	r0, #0
.L1867:
	ldr	r1, .L1869+16
	ldr	ip, [ip, #68]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	ip
.L1870:
	.align	2
.L1869:
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
	bhi	.L1875
	ldr	r3, .L1877
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L1876
	add	r0, r0, #225280
	ldr	r0, [r0, #2872]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1875:
	ldr	ip, .L1877+4
	movw	r2, #8487
	ldr	r3, .L1877+8
	mov	r0, #0
	ldr	r1, .L1877+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1876:
	ldr	ip, .L1877+4
	movw	r2, #8488
	ldr	r3, .L1877+16
	ldr	r1, .L1877+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1878:
	.align	2
.L1877:
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
	bhi	.L1892
	ldr	r5, .L1894
	mov	r0, #0
	ldr	r3, [r5, #12]
	blx	r3
	cmp	r4, #1
	beq	.L1883
	bcc	.L1884
	cmp	r4, #2
	bne	.L1893
	ldr	r3, .L1894+4
	add	r6, r3, r6, lsl #2
	ldr	r3, [r6, #684]
	cmp	r3, #1
	beq	.L1888
.L1890:
	str	r4, [r6, #684]
	mov	r4, #0
	b	.L1882
.L1884:
	ldr	r3, .L1894+4
	mov	r2, #0
	mov	r4, r2
	add	r6, r3, r6, lsl #2
	str	r2, [r6, #684]
.L1882:
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1893:
	mov	r4, #0
	b	.L1882
.L1883:
	ldr	r3, .L1894+4
	add	r6, r3, r6, lsl #2
	ldr	r0, [r6, #684]
	cmp	r0, #0
	beq	.L1890
.L1888:
	mvn	r4, #0
	b	.L1882
.L1892:
	ldr	ip, .L1894
	movw	r2, #8497
	ldr	r3, .L1894+8
	mov	r0, #0
	ldr	r1, .L1894+12
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1895:
	.align	2
.L1894:
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
	bhi	.L1910
	ldr	r6, .L1915
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L1911
	add	ip, r3, #225280
	ldr	r2, [r3, #264]
	ldr	r1, [ip, #2872]
	ldr	r7, [ip, #2880]
	cmp	r1, #0
	ble	.L1912
	ldr	r3, [r3, #260]
	cmp	r3, #0
	cmpne	r2, #0
	ble	.L1901
	mov	r0, r2
	bl	__aeabi_idiv
	cmp	r7, r0
	mov	r9, r0
	ble	.L1902
	rsb	r8, r0, r7
	cmp	r8, #0
	ble	.L1902
	mov	r1, r0
	mov	r0, r4
	bl	VCTRL_AllocMemPre
	ldr	r7, .L1915+4
	ldr	r10, [r6, r4, asl #2]
	ldr	r3, [r7]
	add	r10, r10, #229376
	mov	r5, r0
	blx	r3
	ldr	r3, [r6, r4, asl #2]
	cmp	r5, #0
	add	r3, r3, #225280
	str	r0, [r10, #24]
	str	r9, [r3, #2884]
	bne	.L1903
	ldr	r3, [r3, #2892]
	cmp	r3, #1
	bne	.L1904
	mov	r1, r8
	mov	r0, r4
	bl	VCTRL_AllocMemMMZ
	subs	r5, r0, #0
	bne	.L1913
	ldr	r3, [r7]
	ldr	r7, [r6, r4, asl #2]
	blx	r3
	ldr	r2, [r6, r4, asl #2]
	mov	r3, r5
	add	r7, r7, #229376
	add	r2, r2, #225280
	str	r0, [r7, #28]
	mov	r0, r3
	str	r8, [r2, #2888]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1901:
	ldr	r3, [ip, #2892]
	cmp	r3, #1
	bne	.L1906
	mov	r1, r7
	ldr	r8, .L1915+4
	bl	VCTRL_AllocMemMMZ
	ldr	r9, [r6, r4, asl #2]
	ldr	r3, [r8]
	add	r9, r9, #229376
	mov	r5, r0
	blx	r3
	ldr	r3, [r6, r4, asl #2]
	cmp	r5, #0
	add	r3, r3, #225280
	str	r0, [r9, #28]
	str	r7, [r3, #2888]
	bne	.L1914
.L1908:
	mov	r3, r5
.L1898:
	mov	r0, r3
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1902:
	mov	r1, r7
	mov	r0, r4
	bl	VCTRL_AllocMemPre
	ldr	r8, .L1915+4
	ldr	r9, [r6, r4, asl #2]
	ldr	r3, [r8]
	add	r9, r9, #229376
	mov	r5, r0
	blx	r3
	ldr	r3, [r6, r4, asl #2]
	cmp	r5, #0
	add	r3, r3, #225280
	str	r0, [r9, #24]
	str	r7, [r3, #2884]
	beq	.L1908
	ldr	r4, [r8, #68]
	movw	r3, #8740
	b	.L1909
.L1914:
	ldr	r4, [r8, #68]
	movw	r3, #8757
	ldr	r2, .L1915+8
	mov	r0, #31
	ldr	r1, .L1915+12
	blx	r4
	mov	r3, r5
	mov	r0, r3
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1903:
	ldr	r4, [r7, #68]
	movw	r3, #8726
.L1909:
	ldr	r2, .L1915+8
	mov	r0, #31
	ldr	r1, .L1915+16
	blx	r4
	mov	r3, r5
	mov	r0, r3
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1906:
	ldr	ip, .L1915+4
	mov	r0, #31
	ldr	r2, .L1915+8
	ldr	r1, .L1915+20
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r3, #0
	b	.L1898
.L1904:
	ldr	r4, [r7, #68]
	mov	r0, #31
	ldr	r2, .L1915+8
	ldr	r1, .L1915+24
	blx	r4
	mvn	r3, #0
	b	.L1898
.L1910:
	ldr	ip, .L1915+4
	movw	r2, #8673
	ldr	r3, .L1915+28
	mov	r0, #0
	ldr	r1, .L1915+32
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r3, #0
	b	.L1898
.L1913:
	movw	r3, #8709
	ldr	r4, [r7, #68]
	ldr	r2, .L1915+8
	mov	r0, #31
	ldr	r1, .L1915+12
	blx	r4
	mvn	r3, #0
	b	.L1898
.L1912:
	ldr	r3, .L1915+4
	mov	r2, r1
	mov	r0, #31
	ldr	r1, .L1915+36
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r3, #0
	b	.L1898
.L1911:
	ldr	ip, .L1915+4
	mov	r0, r3
	movw	r2, #8674
	ldr	r3, .L1915+40
	ldr	r1, .L1915+32
	ldr	r4, [ip, #68]
	blx	r4
	mvn	r3, #0
	b	.L1898
.L1916:
	.align	2
.L1915:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+212
	.word	.LC196
	.word	.LC198
	.word	.LC199
	.word	.LC197
	.word	.LC6
	.word	.LC1
	.word	.LC195
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
	bhi	.L1921
	ldr	r3, .L1923
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L1922
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
	str	r2, [r3, #2880]
	ldr	r2, [r1, #16]
	str	r2, [r3, #2892]
	ldmfd	sp, {fp, sp, pc}
.L1921:
	ldr	ip, .L1923+4
	movw	r2, #8772
	ldr	r3, .L1923+8
	mov	r0, #0
.L1920:
	ldr	r1, .L1923+12
	ldr	ip, [ip, #68]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	ip
.L1922:
	ldr	ip, .L1923+4
	movw	r2, #8773
	ldr	r3, .L1923+16
	b	.L1920
.L1924:
	.align	2
.L1923:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_SetFsParamToChan, .-VCTRL_SetFsParamToChan
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
	beq	.L1925
	ldr	r4, .L2032
	ldr	r2, [r4, #1264]
	cmp	r2, #0
	beq	.L1925
	ldr	r2, [r4, #1260]
	cmp	r2, #0
	beq	.L1925
	ldr	r2, [r4, #1256]
	cmp	r2, #0
	beq	.L1925
	rsb	r9, ip, r5
	ldr	r6, .L2032+4
	rsb	r1, r1, r9
	rsb	r2, lr, r0
	rsb	r3, r3, r2
	str	r1, [fp, #-64]
	mov	ip, r1
	mov	r0, #32
	mov	r2, ip
	ldr	r1, .L2032+8
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
	bne	.L1929
	cmp	r2, #0
	mov	r3, r2
	strne	r10, [fp, #-92]
	movne	r3, #0
	strne	r3, [fp, #-52]
	movne	r9, r3
	beq	.L1931
.L1933:
	cmp	r5, #0
	beq	.L1934
	ldr	r3, [fp, #-52]
	mov	r10, #0
	and	r8, r3, #15
	mov	r2, r3, lsr #4
	ldr	r3, [fp, #-60]
	mul	r2, r3, r2
	add	r8, r2, r8, lsl #8
.L1932:
	mov	r1, r10, lsr #8
	ldr	r0, [r4, #1264]
	add	r2, r9, r10
	ldr	r3, [r6, #52]
	add	r1, r8, r1, lsl #12
	add	r0, r0, r2
	add	r1, r7, r1
	add	r10, r10, #256
	mov	r2, #256
	blx	r3
	cmp	r5, r10
	bhi	.L1932
.L1934:
	ldr	r3, [fp, #-52]
	add	r9, r9, r5
	ldr	r2, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-52]
	cmp	r3, r2
	bne	.L1933
	ldr	r10, [fp, #-92]
.L1931:
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-88]
	ldr	r1, [fp, #-48]
	cmp	r3, r5
	cmpeq	r2, r1
	moveq	r3, #1
	movne	r3, #0
	str	r3, [fp, #-92]
	beq	.L2027
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-80]
	ldr	r9, [fp, #-88]
	mla	r7, r3, r5, r2
	cmp	r9, #0
	ldr	r2, [r4, #1264]
	add	r7, r2, r7
	beq	.L1939
	str	r10, [fp, #-48]
	ldr	r8, [fp, #-92]
	ldr	r10, [fp, #-68]
.L1940:
	mov	r0, r7
	add	r8, r8, #1
	ldr	r3, [r6, #44]
	mov	r2, r10
	ldr	r1, [fp, #-64]
	add	r7, r7, r5
	blx	r3
	cmp	r8, r9
	bne	.L1940
	ldr	r10, [fp, #-48]
.L1939:
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	beq	.L1936
	ldr	r3, [fp, #-60]
	mov	r8, #0
	str	r8, [fp, #-48]
	mov	r3, r3, lsr #1
	str	r3, [fp, #-52]
.L1937:
	cmp	r5, #0
	beq	.L1944
	ldr	r3, [fp, #-48]
	mov	r9, #0
	and	r7, r3, #7
	mov	r2, r3, lsr #3
	ldr	r3, [fp, #-52]
	mul	r2, r3, r2
	add	r7, r2, r7, lsl #8
.L1942:
	mov	r1, r9, lsr #8
	ldr	r0, [r4, #1264]
	add	r2, r8, r9
	ldr	r3, [r6, #52]
	add	r1, r7, r1, lsl #11
	add	r0, r0, r2
	add	r1, r10, r1
	add	r9, r9, #256
	mov	r2, #256
	blx	r3
	cmp	r5, r9
	bhi	.L1942
.L1944:
	ldr	r3, [fp, #-48]
	add	r8, r8, r5
	ldr	r2, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-48]
	cmp	r3, r2
	bne	.L1937
	ldr	r3, [fp, #-72]
	ldr	lr, [r4, #1264]
	cmp	r3, #1
	beq	.L2028
.L1946:
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	beq	.L2029
.L1947:
	ldr	r3, [fp, #-92]
	cmp	r3, #0
	bne	.L2030
	ldr	r1, [fp, #-88]
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-76]
	movs	r8, r1, lsr #1
	ldr	r1, [fp, #-84]
	mov	r3, r3, lsr #1
	ldr	r5, [r4, #1260]
	mov	r2, r2, lsr #1
	ldr	r4, [r4, #1256]
	mla	r3, r3, r1, r2
	add	r5, r5, r3
	add	r4, r4, r3
	beq	.L1925
	ldr	r3, [fp, #-64]
	ldr	r7, [fp, #-92]
	ldr	r10, [fp, #-68]
	mov	r9, r3, lsr #1
	str	r4, [fp, #-48]
	mov	r4, r1
.L1953:
	mov	r0, r5
	add	r7, r7, #1
	ldr	r3, [r6, #44]
	mov	r2, r10
	mov	r1, r9
	add	r5, r5, r4
	blx	r3
	cmp	r7, r8
	bne	.L1953
	ldr	r4, [fp, #-48]
	mov	r5, #0
	ldr	r7, [fp, #-84]
	ldr	r10, [fp, #-68]
.L1954:
	mov	r0, r4
	add	r5, r5, #1
	ldr	r3, [r6, #44]
	mov	r2, r10
	mov	r1, r9
	add	r4, r4, r7
	blx	r3
	cmp	r5, r8
	bne	.L1954
.L1925:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1929:
	subs	r3, r8, #1
	ldr	r2, [fp, #-48]
	movne	r3, #1
	cmp	r2, r3
	str	r3, [fp, #-64]
	ldrhi	r3, [fp, #-64]
	strhi	r10, [fp, #-76]
	strhi	r3, [fp, #-52]
	bls	.L1956
.L1958:
	cmp	r5, #0
	beq	.L1959
	ldr	r3, [fp, #-52]
	mov	r10, #0
	and	r8, r3, #15
	mov	r2, r3, lsr #4
	mov	r9, r3, lsr #1
	ldr	r3, [fp, #-60]
	mul	r9, r5, r9
	mul	r2, r3, r2
	add	r8, r2, r8, lsl #8
.L1957:
	mov	r1, r10, lsr #8
	ldr	r0, [r4, #1264]
	add	r2, r10, r9
	ldr	r3, [r6, #52]
	add	r1, r8, r1, lsl #12
	add	r0, r0, r2
	add	r1, r7, r1
	add	r10, r10, #256
	mov	r2, #256
	blx	r3
	cmp	r5, r10
	bhi	.L1957
.L1959:
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-48]
	add	r3, r3, #2
	str	r3, [fp, #-52]
	cmp	r2, r3
	bhi	.L1958
	ldr	r10, [fp, #-76]
.L1956:
	ldr	r3, [fp, #-48]
	ldr	r2, [fp, #-68]
	ldr	r0, [r4, #1264]
	mul	r1, r3, r5
	ldr	r3, [r6, #44]
	mov	r1, r1, lsr #1
	blx	r3
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	beq	.L1960
	ldr	r3, [fp, #-60]
	mov	r8, #0
	str	r8, [fp, #-48]
	mov	r3, r3, lsr #1
	str	r3, [fp, #-52]
.L1961:
	cmp	r5, #0
	beq	.L1964
	ldr	r3, [fp, #-48]
	mov	r9, #0
	and	r7, r3, #7
	mov	r2, r3, lsr #3
	ldr	r3, [fp, #-52]
	mul	r2, r3, r2
	add	r7, r2, r7, lsl #8
.L1962:
	mov	r1, r9, lsr #8
	ldr	r0, [r4, #1264]
	add	r2, r8, r9
	ldr	r3, [r6, #52]
	add	r1, r7, r1, lsl #11
	add	r0, r0, r2
	add	r1, r10, r1
	add	r9, r9, #256
	mov	r2, #256
	blx	r3
	cmp	r5, r9
	bhi	.L1962
.L1964:
	ldr	r3, [fp, #-48]
	add	r8, r8, r5
	ldr	r2, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-48]
	cmp	r3, r2
	bne	.L1961
	ldr	r3, [fp, #-72]
	cmp	r3, #1
	ldr	r3, [r4, #1264]
	beq	.L2031
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	bne	.L1967
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-64]
	cmp	r2, r3
	bls	.L1972
.L1973:
	add	r3, r3, #2
	cmp	r2, r3
	bhi	.L1973
.L1972:
	ldr	r3, [r6, #48]
	mov	r2, #1048576
	mov	r1, #128
	ldr	r0, [r4, #1256]
	blx	r3
	ldr	r3, [r6, #48]
	mov	r2, #1048576
	mov	r1, #128
	ldr	r0, [r4, #1260]
	blx	r3
.L1967:
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-84]
	ldr	r7, [fp, #-68]
	ldr	r0, [r4, #1260]
	mul	r5, r3, r2
	ldr	r3, [r6, #44]
	mov	r2, r7
	mov	r5, r5, lsr #1
.L2026:
	mov	r1, r5
	blx	r3
	mov	r1, r5
	ldr	r3, [r6, #44]
	mov	r2, r7
	ldr	r0, [r4, #1256]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L2027:
	mul	r1, r1, r5
	ldr	r3, [r6, #44]
	ldr	r2, [fp, #-68]
	ldr	r0, [r4, #1264]
	blx	r3
	b	.L1939
.L2031:
	ldr	r2, [fp, #-64]
	mov	lr, #0
	ldr	r8, [fp, #-84]
	ldr	r9, [fp, #-56]
	mla	r3, r2, r5, r3
	mov	r5, r5, asl #1
	add	r7, r3, #1
.L1968:
	cmp	r8, #0
	beq	.L1971
	mov	r3, lr, lsr #1
	mov	r2, r7
	mul	r3, r8, r3
	add	ip, r3, r8
.L1969:
	ldrb	r0, [r2, #-1]	@ zero_extendqisi2
	ldr	r1, [r4, #1256]
	strb	r0, [r1, r3]
	ldrb	r0, [r2], #2	@ zero_extendqisi2
	ldr	r1, [r4, #1260]
	strb	r0, [r1, r3]
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1969
.L1971:
	add	lr, lr, #2
	add	r7, r7, r5
	cmp	r9, lr
	bhi	.L1968
	b	.L1967
.L2028:
	ldr	r8, [fp, #-84]
	mov	r3, #0
	ldr	r9, [fp, #-56]
	add	lr, lr, #1
	mov	r7, r3
.L1948:
	cmp	r8, #0
	moveq	ip, r3
	beq	.L1951
	add	ip, r3, r8
	mov	r2, lr
.L1949:
	ldrb	r0, [r2, #-1]	@ zero_extendqisi2
	ldr	r1, [r4, #1256]
	strb	r0, [r1, r3]
	ldrb	r0, [r2], #2	@ zero_extendqisi2
	ldr	r1, [r4, #1260]
	strb	r0, [r1, r3]
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1949
.L1951:
	add	r7, r7, #1
	mov	r3, ip
	cmp	r7, r9
	add	lr, lr, r5
	bne	.L1948
	b	.L1947
.L2029:
	ldr	r3, [r6, #48]
	mov	r2, #1048576
	mov	r1, #128
	ldr	r0, [r4, #1256]
	blx	r3
	ldr	r3, [r6, #48]
	mov	r2, #1048576
	mov	r1, #128
	ldr	r0, [r4, #1260]
	blx	r3
	b	.L1947
.L2030:
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-84]
	ldr	r7, [fp, #-68]
	ldr	r0, [r4, #1260]
	mul	r5, r3, r2
	ldr	r3, [r6, #44]
	mov	r2, r7
	b	.L2026
.L1936:
	ldr	r3, [fp, #-72]
	cmp	r3, #1
	bne	.L1946
	b	.L1947
.L1960:
	ldr	r3, [fp, #-72]
	cmp	r3, #1
	beq	.L1967
	cmp	r3, #0
	beq	.L1972
	b	.L1967
.L2033:
	.align	2
.L2032:
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
	ldr	r6, .L2088
	mov	r4, r1
	mov	r2, r0
	mov	r5, r0
	ldr	r1, .L2088+4
	mov	r0, #2
	ldr	r3, [r6, #68]
	blx	r3
	cmp	r4, #0
	beq	.L2073
	cmp	r5, #15
	bhi	.L2074
	ldr	r7, .L2088+8
	ldr	r0, [r7, r5, asl #2]
	cmp	r0, #0
	beq	.L2075
	ldr	r3, [r0, #12]
	cmp	r3, #1
	bne	.L2076
	ldr	r3, [r6, #12]
	mov	r0, #4
	blx	r3
	ldr	r0, [r7, r5, asl #2]
	cmp	r0, #0
	beq	.L2077
	ldr	r3, [r0, #12]
	cmp	r3, #1
	bne	.L2078
	add	r0, r0, #229376
	mov	r1, r4
	add	r0, r0, #112
	bl	SYNTAX_ReceiveImage
	cmp	r0, #1
	mov	r9, r0
	beq	.L2079
	mov	r0, #12
	mvn	r8, #0
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L2080
.L2055:
	ldr	r3, [r7, r5, asl #2]
	mov	r0, #4
	ldr	r2, [r6, #16]
	add	r3, r3, #241664
	ldrb	r3, [r3, #4036]	@ zero_extendqisi2
	strb	r3, [r4, #480]
	blx	r2
.L2069:
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2079:
	ldr	r10, .L2088+12
	mov	r3, r5, asl #2
	str	r3, [fp, #-552]
	add	r3, r10, r3
	ldr	r0, [r3, #1108]
	cmp	r0, #0
	beq	.L2043
	ldr	r3, [r4, #160]
	ldr	lr, [r10, #1268]
	tst	r3, #28
	ldr	r2, [r4, #36]
	ldr	r3, [r4, #164]
	moveq	ip, #1
	movne	ip, #0
	cmp	lr, #0
	beq	.L2044
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
.L2043:
	ldr	r3, [r4, #256]
	mvn	r8, #0
	str	r8, [r4, #252]
	cmp	r3, #1
	beq	.L2057
.L2053:
	mov	r0, #12
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L2081
.L2058:
	mov	r2, #0
	mov	r1, #12
	mov	r0, r5
	mov	r8, r2
	bl	DBG_CountTimeInfo
	ldr	r2, [r4, #160]
	ldr	r3, [r7, r5, asl #2]
	str	r2, [r3, #308]
	ldr	r2, [r4, #364]
	str	r2, [r3, #312]
	b	.L2055
.L2044:
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
	b	.L2043
.L2080:
	ldr	r10, .L2088+12
	mov	r3, r5, asl #2
	str	r3, [fp, #-552]
.L2054:
	ldr	r3, [r6]
	blx	r3
	ldr	r3, [fp, #-552]
	ldr	r2, .L2088+16
	add	r1, r10, r3
	ldr	r3, [r1, #1276]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	cmp	r3, r2
	bhi	.L2082
.L2056:
	cmp	r8, #0
	bne	.L2055
	b	.L2058
.L2057:
	ldr	r2, [r4, #244]
	cmp	r2, #0
	str	r2, [fp, #-556]
	beq	.L2083
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
	b	.L2053
.L2081:
	mov	r8, #0
	b	.L2054
.L2076:
	ldr	r4, [r6, #68]
	movw	r2, #3848
	ldr	r3, .L2088+20
	mov	r0, #0
	ldr	r1, .L2088+24
	mvn	r8, #0
	blx	r4
	b	.L2069
.L2078:
	ldr	r3, [r6, #68]
	movw	r2, #3866
	ldr	r1, .L2088+28
	mov	r0, #0
.L2070:
	blx	r3
	ldr	r3, [r6, #16]
	mov	r0, #4
	mvn	r8, #0
	blx	r3
	b	.L2069
.L2082:
	mov	r2, r5, asl #24
	str	r0, [r1, #1276]
	add	r2, r2, #786432
	movw	r1, #4056
	cmp	r9, #1
	addeq	r2, r2, #1
	ldr	r0, .L2088+32
	bl	DBG_AddTrace
	b	.L2056
.L2083:
	ldr	r0, [r7, r5, asl #2]
	sub	r1, fp, #548
	add	r0, r0, #229376
	add	r0, r0, #112
	bl	SYNTAX_ReceiveImage
	cmp	r0, #1
	str	r0, [fp, #-560]
	bne	.L2084
	ldr	r3, [r4, #248]
	ldr	r2, [fp, #-300]
	cmp	r3, r2
	blt	.L2085
	bgt	.L2086
	cmp	r3, #0
	ldr	r3, .L2088+8
	ldr	r0, [r3, r5, asl #2]
	bne	.L2050
	add	r0, r0, #229376
	mvn	r9, #1
	add	r0, r0, #112
	bl	SYNTAX_ReturnImage
	ldr	r3, .L2088+8
	mov	r1, r4
	ldr	r0, [r3, r5, asl #2]
	add	r0, r0, #229376
	add	r0, r0, #112
	bl	SYNTAX_ReleaseImage
	ldr	r0, [fp, #-560]
	ldr	r3, [r4, #248]
	ldr	r2, .L2088+36
	ldr	r1, .L2088+40
	ldr	ip, [r6, #68]
	blx	ip
.L2052:
	mov	r0, #12
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	beq	.L2056
	b	.L2054
.L2074:
	ldr	r4, [r6, #68]
	movw	r2, #3844
	ldr	r3, .L2088+44
	mov	r0, #0
	ldr	r1, .L2088+24
	mvn	r8, #0
	blx	r4
	b	.L2069
.L2084:
	ldr	r3, .L2088+8
	ldr	r8, [fp, #-560]
	ldr	r0, [r3, r5, asl #2]
	add	r0, r0, #229376
	add	r0, r0, #112
	bl	SYNTAX_ReturnImage
	ldr	r3, [r6, #16]
	mov	r0, #4
	blx	r3
	b	.L2069
.L2085:
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
	b	.L2052
.L2050:
	add	r0, r0, #229376
	mov	r1, r4
	add	r0, r0, #112
	bl	SYNTAX_ReleaseImage
	ldr	r3, [fp, #-304]
	cmp	r3, #0
	beq	.L2087
	ldr	ip, [r6, #68]
	ldr	r3, [r4, #248]
	ldr	r2, .L2088+36
	ldr	r1, .L2088+48
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
	b	.L2053
.L2086:
	ldr	r3, .L2088+8
	mvn	r9, #1
	ldr	r0, [r3, r5, asl #2]
	add	r0, r0, #229376
	add	r0, r0, #112
	bl	SYNTAX_ReturnImage
	ldr	r3, .L2088+8
	mov	r1, r4
	ldr	r0, [r3, r5, asl #2]
	add	r0, r0, #229376
	add	r0, r0, #112
	bl	SYNTAX_ReleaseImage
	ldr	r1, [fp, #-300]
	ldr	r3, [r4, #248]
	ldr	r0, [fp, #-560]
	str	r1, [sp]
	ldr	r2, .L2088+36
	ldr	r1, .L2088+52
	ldr	ip, [r6, #68]
	blx	ip
	b	.L2052
.L2073:
	ldr	r5, [r6, #68]
	mov	r0, r4
	ldr	r3, .L2088+56
	movw	r2, #3843
	ldr	r1, .L2088+24
	mvn	r8, #0
	blx	r5
	b	.L2069
.L2075:
	ldr	r4, [r6, #68]
	movw	r2, #3845
	ldr	r3, .L2088+60
	mvn	r8, #0
	ldr	r1, .L2088+24
	blx	r4
	b	.L2069
.L2077:
	ldr	r3, [r6, #68]
	mov	r2, #3856
	ldr	r1, .L2088+64
	b	.L2070
.L2087:
	ldr	r3, .L2088+8
	sub	r1, fp, #548
	mvn	r9, #1
	ldr	r0, [r3, r5, asl #2]
	add	r0, r0, #229376
	add	r0, r0, #112
	bl	SYNTAX_ReleaseImage
	ldr	r0, [fp, #-560]
	ldr	r3, [r4, #248]
	ldr	r2, .L2088+36
	ldr	r1, .L2088+48
	ldr	ip, [r6, #68]
	blx	ip
	b	.L2052
.L2089:
	.align	2
.L2088:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC201
	.word	.LANCHOR0
	.word	.LANCHOR3
	.word	g_TraceImgPeriod
	.word	.LC38
	.word	.LC1
	.word	.LC42
	.word	.LANCHOR1+256
	.word	.LANCHOR1+236
	.word	.LC203
	.word	.LC6
	.word	.LC204
	.word	.LC202
	.word	.LC39
	.word	.LC2
	.word	.LC41
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
	bhi	.L2091
	ldr	r3, .L2101
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L2091
	add	r0, r0, #229376
	ldr	r3, [r0, #112]
	cmp	r3, #2
	beq	.L2092
	cmp	r3, #17
	beq	.L2093
	cmp	r3, #0
	beq	.L2100
.L2091:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L2092:
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_GetImageWidth
.L2100:
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_GetImageWidth
.L2093:
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_GetImageWidth
.L2102:
	.align	2
.L2101:
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
	bhi	.L2104
	ldr	r3, .L2114
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L2104
	add	r0, r0, #229376
	ldr	r3, [r0, #112]
	cmp	r3, #2
	beq	.L2105
	cmp	r3, #17
	beq	.L2106
	cmp	r3, #0
	beq	.L2113
.L2104:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L2105:
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_GetImageHeight
.L2113:
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_GetImageHeight
.L2106:
	add	r0, r0, #120
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_GetImageHeight
.L2115:
	.align	2
.L2114:
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
	.type	__func__.16223, %object
	.size	__func__.16223, 18
__func__.16223:
	.ascii	"VCTRL_EventReport\000"
	.space	2
	.type	__func__.16235, %object
	.size	__func__.16235, 18
__func__.16235:
	.ascii	"VCTRL_SetCallBack\000"
	.space	2
	.type	__FUNCTION__.16323, %object
	.size	__FUNCTION__.16323, 29
__FUNCTION__.16323:
	.ascii	"VCTRL_PartitionMemForStdUser\000"
	.space	3
	.type	__FUNCTION__.16551, %object
	.size	__FUNCTION__.16551, 23
__FUNCTION__.16551:
	.ascii	"VCTRL_ReleaseChanImage\000"
	.space	1
	.type	__func__.16552, %object
	.size	__func__.16552, 23
__func__.16552:
	.ascii	"VCTRL_ReleaseChanImage\000"
	.space	1
	.type	__FUNCTION__.16623, %object
	.size	__FUNCTION__.16623, 19
__FUNCTION__.16623:
	.ascii	"VCTRL_FlushDecoder\000"
	.space	1
	.type	__FUNCTION__.16935, %object
	.size	__FUNCTION__.16935, 18
__FUNCTION__.16935:
	.ascii	"GetExtraRefFrmNum\000"
	.space	2
	.type	__FUNCTION__.16941, %object
	.size	__FUNCTION__.16941, 19
__FUNCTION__.16941:
	.ascii	"GetExtraDispFrmNum\000"
	.space	1
	.type	__FUNCTION__.16947, %object
	.size	__FUNCTION__.16947, 16
__FUNCTION__.16947:
	.ascii	"GetExtraCtrlCmd\000"
	.type	__FUNCTION__.16867, %object
	.size	__FUNCTION__.16867, 14
__FUNCTION__.16867:
	.ascii	"DecChanSyntax\000"
	.space	2
	.type	__FUNCTION__.17183, %object
	.size	__FUNCTION__.17183, 21
__FUNCTION__.17183:
	.ascii	"VCTRL_RequestChanMem\000"
	.space	3
	.type	__func__.16533, %object
	.size	__func__.16533, 19
__func__.16533:
	.ascii	"VCTRL_GetChanImage\000"
	.space	1
	.type	__FUNCTION__.16541, %object
	.size	__FUNCTION__.16541, 19
__FUNCTION__.16541:
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
	ASCII(.ascii	"DFS, rls MMZ Node\012\000" )
	.space	1
.LC34:
	ASCII(.ascii	"DelMemRecord 0x%x failed!\012\000" )
	.space	1
.LC35:
	ASCII(.ascii	"pstCfg is null\000" )
	.space	1
.LC36:
	ASCII(.ascii	"Chip not support beyond %dx%d when Std != H264/VP8/" )
	ASCII(.ascii	"MVC/USER.\012\000" )
	.space	2
.LC37:
	ASCII(.ascii	"pArgs is NULL\000" )
	.space	2
.LC38:
	ASCII(.ascii	"This channel is not opened\000" )
	.space	1
.LC39:
	ASCII(.ascii	"pImage is NULL\000" )
	.space	1
.LC40:
	ASCII(.ascii	"call VCTRL_ReleaseChanImage, ChanID, ImgID = %d,%d\012" )
	ASCII(.ascii	"\000" )
.LC41:
	ASCII(.ascii	"vdm_ctrl.c,L%d: Chan inactive\012\000" )
	.space	1
.LC42:
	ASCII(.ascii	"vdm_ctrl.c,L%d: This channel is not opened\012\000" )
.LC43:
	ASCII(.ascii	"%s call SYNTAX_ReleaseImage failed\012\000" )
.LC44:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: ChanID out of range\012\000" )
	.space	1
.LC45:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: Chan %d is not open or not ru" )
	ASCII(.ascii	"nning\012\000" )
	.space	2
.LC46:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: ChanID out of range is %d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC47:
	ASCII(.ascii	"Chan %d is not open or not running\012\000" )
.LC48:
	ASCII(.ascii	"line: %d Flush DPB failed!\012\000" )
.LC49:
	ASCII(.ascii	"VCTRL_FlushDecoder\012\000" )
.LC50:
	ASCII(.ascii	"fuction return value is null,%s %d MVC_OK != MVC_Fl" )
	ASCII(.ascii	"ushDPB!!\012\000" )
	.space	3
.LC51:
	ASCII(.ascii	"ChanId out of range\000" )
.LC52:
	ASCII(.ascii	"This channel is not running\000" )
.LC53:
	ASCII(.ascii	"chan not create\000" )
.LC54:
	ASCII(.ascii	"can NOT start a not-opened Chan\000" )
.LC55:
	ASCII(.ascii	"NULL == pArgs\000" )
	.space	2
.LC56:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC57:
	ASCII(.ascii	"VCTRL_GetUsrdecFrame but VFMW_USER != s_pstVfmwChan" )
	ASCII(.ascii	"[ChanID]->eVidStd!\012\000" )
	.space	1
.LC58:
	ASCII(.ascii	"VCTRL_GetUsrdecFrame but s_pstVfmwChan[ChanID]->s32" )
	ASCII(.ascii	"UsrdecFrameNum < MIN_USERDEC_FRAME_NUM!\012\000" )
.LC59:
	ASCII(.ascii	"VCTRL_GetUsrdecFrame but FSP_IsNewFsAvalible(ChanID" )
	ASCII(.ascii	") != 1!\012\000" )
.LC60:
	ASCII(.ascii	"get frame store fail!\012\000" )
	.space	1
.LC61:
	ASCII(.ascii	"get image buffer ok: LogicFsID = %d\012\000" )
	.space	3
.LC62:
	ASCII(.ascii	"line: %d, pLf is NULL!\012\000" )
.LC63:
	ASCII(.ascii	"decode %p, disp %p, tf %p\012\000" )
	.space	1
.LC64:
	ASCII(.ascii	"VCTRL_GetUsrdecFrame get LogicFs fail!\012\000" )
.LC65:
	ASCII(.ascii	"pChanOption is NULL\000" )
.LC66:
	ASCII(.ascii	"pDetailMemSize is NULL\000" )
	.space	1
.LC67:
	ASCII(.ascii	"ERROR: s32MaxRefFrameNum(%d), extra_ref(%d), s32Dis" )
	ASCII(.ascii	"playFrameNum(%d), extra_disp(%d)\012\000" )
	.space	3
.LC68:
	ASCII(.ascii	"ERROR: (MaxRefFrameNum(%d) + extra_ref(%d)) > 16\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC69:
	ASCII(.ascii	"VDEC_CID_GET_CHAN_DETAIL_MEMSIZE_BY_OPTION is desig" )
	ASCII(.ascii	"ned for CAP_LEVEL_USER_DEFINE_WITH_OPTION, please c" )
	ASCII(.ascii	"hange channel's capability or use VDEC_CID_GET_CHAN" )
	ASCII(.ascii	"_MEMSIZE.\012\000" )
.LC70:
	ASCII(.ascii	"CAP_LEVEL_USER_DEFINE_WITH_OPTION option is illegal" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC71:
	ASCII(.ascii	"VCTRL_GetChanMemSizeByOption L%d: arrange return fa" )
	ASCII(.ascii	"ilure\012\000" )
	.space	2
.LC72:
	ASCII(.ascii	"eCapLevel >= CAP_LEVEL_BUTT\000" )
.LC73:
	ASCII(.ascii	"ERROR: (nPmv(%d) + extra_ref(%d)) <= 0\012\000" )
.LC74:
	ASCII(.ascii	"ERROR: TempMinFrame(%d + %d + %d), TempMiddleFrame(" )
	ASCII(.ascii	"%d + %d + %d), TempFluentFrame(%d + %d + %d)\012\000" )
	.space	3
.LC75:
	ASCII(.ascii	"VCTRL_GetChanMemSize L%d: arrange return failure\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC76:
	ASCII(.ascii	"extra_ref=\000" )
	.space	1
.LC77:
	ASCII(.ascii	"=\000" )
	.space	2
.LC78:
	ASCII(.ascii	" \000" )
	.space	2
.LC79:
	ASCII(.ascii	"fuction return value is null,%s %d unknow error!!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC80:
	ASCII(.ascii	"ERROR: extra_ref = %d is out of [ -5000, 5000 ]!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC81:
	ASCII(.ascii	"extra_disp=\000" )
.LC82:
	ASCII(.ascii	"ERROR: extra_disp = %d is out of [ -5000, 5000 ]!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC83:
	ASCII(.ascii	"extra_cmd=\000" )
	.space	1
.LC84:
	ASCII(.ascii	"OpenDrivers() error\012\000" )
	.space	3
.LC85:
	ASCII(.ascii	"HI_VFMW_VideoDecode\000" )
.LC86:
	ASCII(.ascii	"(safe,warn,danger) :amount = %d,%d,%d,%d\012\000" )
	.space	2
.LC87:
	ASCII(.ascii	"strm_ctrl: I->IPB\012\000" )
	.space	1
.LC88:
	ASCII(.ascii	"strm_ctrl: IPB->I\012\000" )
	.space	1
.LC89:
	ASCII(.ascii	"(CurrMode,NextMode) = %d,%d\012\000" )
	.space	3
.LC90:
	ASCII(.ascii	"Syntax is stopped from This channel\000" )
.LC91:
	ASCII(.ascii	"[%d] vdm busy\012\000" )
	.space	1
.LC92:
	ASCII(.ascii	"[%d] no frame\012\000" )
	.space	1
.LC93:
	ASCII(.ascii	"[%d] no stream\012\000" )
.LC94:
	ASCII(.ascii	"seg_pts: %lld, seg_usertag = %lld\012\000" )
	.space	1
.LC95:
	ASCII(.ascii	"pic_pts: %lld\012\000" )
	.space	1
.LC96:
	ASCII(.ascii	"pic_usertag: %lld\012\000" )
	.space	1
.LC97:
	ASCII(.ascii	"pic_pts: %lld pic_usertag = %lld\012\000" )
	.space	2
.LC98:
	ASCII(.ascii	"%s:ChanId %d this hevc file is 10bit!!!\012\000" )
	.space	3
.LC99:
	ASCII(.ascii	"DFS, Wait Partition\012\000" )
	.space	3
.LC100:
	ASCII(.ascii	"DFS, Partition fail, u32DynamicFrameStoreAllocEn: %" )
	ASCII(.ascii	"d, eFspPartitionState: %d\012\000" )
	.space	2
.LC101:
	ASCII(.ascii	"Thread running...\012\000" )
	.space	1
.LC102:
	ASCII(.ascii	"Thread stopped!\012\000" )
	.space	3
.LC103:
	ASCII(.ascii	"Thread killed!\012\000" )
.LC104:
	ASCII(.ascii	"thread running...\012\000" )
	.space	1
.LC105:
	ASCII(.ascii	"thread stopped...\012\000" )
	.space	1
.LC106:
	ASCII(.ascii	"ChanID out of range!\000" )
	.space	3
.LC107:
	ASCII(.ascii	"SetVdecExtra ERROR: extra_ref = %d is out of [ -500" )
	ASCII(.ascii	"0, 5000 ]!\012\000" )
	.space	1
.LC108:
	ASCII(.ascii	"SetVdecExtra ERROR: extra_disp = %d is out of [ -50" )
	ASCII(.ascii	"00, 5000 ]!\012\000" )
.LC109:
	ASCII(.ascii	"Report Last Frame, Value=%d, LastFrameState=%d\012\000" )
.LC110:
	ASCII(.ascii	"Last frame output failed!\012\000" )
	.space	1
.LC111:
	ASCII(.ascii	"Last frame output successed!\012\000" )
	.space	2
.LC112:
	ASCII(.ascii	"Last frame already output, image id: %d!\012\000" )
	.space	2
.LC113:
	ASCII(.ascii	"line %d can not know YuvFormat = %d\012\000" )
	.space	3
.LC114:
	ASCII(.ascii	"userdec frame(phy=%#x) address error!\012\000" )
	.space	1
.LC115:
	ASCII(.ascii	"can not map vir addr for usrdat frame(cbphy=%#x)\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC116:
	ASCII(.ascii	"line: %d, pLogic is Null!\012\000" )
	.space	1
.LC117:
	ASCII(.ascii	"eYuvFormat %d is not support!!\012\000" )
.LC118:
	ASCII(.ascii	"pUsrdecFrame == NULL\000" )
	.space	3
.LC119:
	ASCII(.ascii	"VCTRL_PutUsrdecFrame: VidStd is %d\012\000" )
.LC120:
	ASCII(.ascii	"VCTRL_PutUsrdecFrame return err\012\000" )
	.space	3
.LC121:
	ASCII(.ascii	"L:%d g_pstRegCrg is NULL\012\000" )
	.space	2
.LC122:
	ASCII(.ascii	"L:%d ChanID out of range\012\000" )
	.space	2
.LC123:
	ASCII(.ascii	"L:%d This Chan has not been created!!!\012\000" )
.LC124:
	ASCII(.ascii	"L:%d WARNING: vidio std not setted!\012\000" )
	.space	3
.LC125:
	ASCII(.ascii	"WARNING: vidio std not setted!\000" )
	.space	1
.LC126:
	ASCII(.ascii	"This Chan has not been created or has been destroye" )
	ASCII(.ascii	"d !\000" )
	.space	1
.LC127:
	ASCII(.ascii	"VCTRL_StopChanWithCheck fail!\012\000" )
	.space	1
.LC128:
	ASCII(.ascii	"---------------------------------------------------" )
	ASCII(.ascii	"----------------------\012\000" )
	.space	1
.LC129:
	ASCII(.ascii	"pChanOption == null\000" )
.LC130:
	ASCII(.ascii	"VDEC_CID_CREATE_CHAN_WITH_OPTION is designed for CA" )
	ASCII(.ascii	"P_LEVEL_USER_DEFINE_WITH_OPTION, please change chan" )
	ASCII(.ascii	"nel's capability.\012\000" )
	.space	3
.LC131:
	ASCII(.ascii	"line %d VCTRL_GetChanMemSizeWithOption failed!\012\000" )
.LC132:
	ASCII(.ascii	"L: %d : part we can NOT alloc buffer for channel co" )
	ASCII(.ascii	"ntext\012\000" )
	.space	2
.LC133:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel context\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC134:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel vdh\012\000" )
	.space	2
.LC135:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel vdh, %#x <" )
	ASCII(.ascii	" %#x\012\000" )
	.space	3
.LC136:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel scd\012\000" )
	.space	2
.LC137:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for SCD\012\000" )
	.space	2
.LC138:
	ASCII(.ascii	"can NOT enable FSP instance\012\000" )
	.space	3
.LC139:
	ASCII(.ascii	"vfmw have max(%d) channels opened, can NOT crerate " )
	ASCII(.ascii	"more channels\012\000" )
	.space	2
.LC140:
	ASCII(.ascii	"VCTRL_CreateChan eCapLevel = %d error! Try to use V" )
	ASCII(.ascii	"CTRL_CreateChanWithOption(CAP_LEVEL_USER_DEFINE_WIT" )
	ASCII(.ascii	"H_OPTION, ...)\012\000" )
	.space	2
.LC141:
	ASCII(.ascii	"VCTRL_GetChanMemSize ERROR\012\000" )
.LC142:
	ASCII(.ascii	"channel memory have been allocated outside, but the" )
	ASCII(.ascii	" mem-info is not correct!\012\000" )
	.space	2
.LC143:
	ASCII(.ascii	"mem-info(phy, vir, size) = (%#x, %p, %d)\012\000" )
	.space	2
.LC144:
	ASCII(.ascii	"this channel totally need %d bytes memory\012\000" )
	.space	1
.LC145:
	ASCII(.ascii	"pstCfg == NULL\000" )
	.space	1
.LC146:
	ASCII(.ascii	"VCTRL_CheckChanWH return err.\012\000" )
	.space	1
.LC147:
	ASCII(.ascii	"VFMW didn't support std %d.\012\000" )
	.space	3
.LC148:
	ASCII(.ascii	"VCTRL_ConfigChan with same config paramater.\012\000" )
	.space	2
.LC149:
	ASCII(.ascii	"can NOT VCTRL_PartitionMemForStdUser\012\000" )
	.space	2
.LC150:
	ASCII(.ascii	"chan %d: new ChanErrThr = %d\012\000" )
	.space	2
.LC151:
	ASCII(.ascii	"chan %d: new DecOrderOutput = %d\012\000" )
	.space	2
.LC152:
	ASCII(.ascii	"chan %d: new DecMode = %d\012\000" )
	.space	1
.LC153:
	ASCII(.ascii	"chan %d: GetChanCfg failed!\012\000" )
	.space	3
.LC154:
	ASCII(.ascii	"chan %d: new StrmOFThr = %d\012\000" )
	.space	3
.LC155:
	ASCII(.ascii	"USE_FF_APT_EN = %d\012\000" )
.LC156:
	ASCII(.ascii	"USE_FF_APT_EN can NOT be set to %d, must be 0 or 1\012" )
	ASCII(.ascii	"\000" )
.LC157:
	ASCII(.ascii	"ResetCreateNewSave = %d\012\000" )
	.space	3
.LC158:
	ASCII(.ascii	"ResetCreateNewSave can NOT be set to %d, must be 0 " )
	ASCII(.ascii	"or 1\012\000" )
	.space	3
.LC159:
	ASCII(.ascii	"NO SUCH CHANNEL : %d\012\000" )
	.space	2
.LC160:
	ASCII(.ascii	"Pay attention to  CHANNEL : %d\012\000" )
.LC161:
	ASCII(.ascii	"print memory tracer...\012\000" )
.LC162:
	ASCII(.ascii	"OK create file '%s' for channel %d raw stream save\012" )
	ASCII(.ascii	"\000" )
.LC163:
	ASCII(.ascii	"failed create file '%s' for raw stream save!\012\000" )
	.space	2
.LC164:
	ASCII(.ascii	">>>> close raw stream saving >>>>\012\000" )
	.space	1
.LC165:
	ASCII(.ascii	"OK create file '%s' for channel %d seg stream save\012" )
	ASCII(.ascii	"\000" )
.LC166:
	ASCII(.ascii	"failed create file '%s' for seg stream save!\012\000" )
	.space	2
.LC167:
	ASCII(.ascii	">>>> close seg stream saving >>>>\012\000" )
	.space	1
.LC168:
	ASCII(.ascii	"Failed Alloc VFMW_BigTile1d_YUV for yuv save!\012\000" )
	.space	1
.LC169:
	ASCII(.ascii	"OK create file '%s' for chan %d yuv save.(crop %d)\012" )
	ASCII(.ascii	"\000" )
.LC170:
	ASCII(.ascii	"failed create file '%s' for yuv save!\012\000" )
	.space	1
.LC171:
	ASCII(.ascii	"OK close yuv save.\012\000" )
.LC172:
	ASCII(.ascii	"address '0x%x' is not valid!\012\000" )
	.space	2
.LC173:
	ASCII(.ascii	"2d image has been saved to '%s'\012\000" )
	.space	3
.LC174:
	ASCII(.ascii	"open file '%s' fail!\012\000" )
	.space	2
.LC175:
	ASCII(.ascii	"1d image has been saved to '%s'\012\000" )
	.space	3
.LC176:
	ASCII(.ascii	"stop chan %d: VCTRL_StopChan return %d\012\000" )
.LC177:
	ASCII(.ascii	"reset chan %d: VCTRL_ResetChan return %d\012\000" )
	.space	2
.LC178:
	ASCII(.ascii	"start chan %d: VCTRL_StartChan return %d\012\000" )
	.space	2
.LC179:
	ASCII(.ascii	"------ dec task delay %d ms ------\012\000" )
.LC180:
	ASCII(.ascii	"------ dnr active per %d ms ------\012\000" )
.LC181:
	ASCII(.ascii	"------ dec stop = %d ------\012\000" )
	.space	3
.LC182:
	ASCII(.ascii	"------ g_TraceCtrl = %x ------\012\000" )
.LC183:
	ASCII(.ascii	"------ g_TraceBsPeriod = %x ------\012\000" )
.LC184:
	ASCII(.ascii	"------ g_TraceFramePeriod = %x ------\012\000" )
	.space	1
.LC185:
	ASCII(.ascii	"------ g_TraceImgPeriod = %x ------\012\000" )
	.space	3
.LC186:
	ASCII(.ascii	"The channel number is to Large.\012\000" )
	.space	3
.LC187:
	ASCII(.ascii	"------ s_pstVfmwChan[%d]->stSynExtraData.s32ModuleL" )
	ASCII(.ascii	"owlyEnable = 1 ------\012\000" )
	.space	2
.LC188:
	ASCII(.ascii	"------ Set SCD[%d] to work  ------\012\000" )
.LC189:
	ASCII(.ascii	"pOption is NULL\000" )
.LC190:
	ASCII(.ascii	"vdm_ctrl.c,L%d: pOption->s32KeepBS error\012\000" )
	.space	2
.LC191:
	ASCII(.ascii	"vdm_ctrl.c,L%d: %s\012\000" )
.LC192:
	ASCII(.ascii	"This Chan has not been created or has been destroye" )
	ASCII(.ascii	"d !!!\000" )
	.space	3
.LC193:
	ASCII(.ascii	"can NOT stop a not-opened Chan\000" )
	.space	1
.LC194:
	ASCII(.ascii	"WARNNING: ScdLowdlyEnable = %d, VidStd = %d, eDSPSt" )
	ASCII(.ascii	"ate = %d AVS(+) and LOWDLY  cannot supported in the" )
	ASCII(.ascii	" same time!!!\012\000" )
	.space	3
.LC195:
	ASCII(.ascii	"DFS, framsize wrong! framesize: 0x%x\012\000" )
	.space	2
.LC196:
	ASCII(.ascii	"%s, %d, AllocMemMMZ fail!\012\000" )
	.space	1
.LC197:
	ASCII(.ascii	"%s,can not use mmz. NeedMMZ: %d\012\000" )
	.space	3
.LC198:
	ASCII(.ascii	"%s, %d, AllocMemPre fail!\012\000" )
	.space	1
.LC199:
	ASCII(.ascii	"%s,can't use mmz. NeedMMZ: %d\012\000" )
	.space	1
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
	.type	FspInstInfo.16319, %object
	.size	FspInstInfo.16319, 2060
FspInstInfo.16319:
	.space	2060
	.type	g_VdmCharacter, %object
	.size	g_VdmCharacter, 4
g_VdmCharacter:
	.space	4
	.type	last_rec_pos_time.16548, %object
	.size	last_rec_pos_time.16548, 64
last_rec_pos_time.16548:
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
	.type	g_event_report, %object
	.size	g_event_report, 4
g_event_report:
	.space	4
	.type	g_DSPState, %object
	.size	g_DSPState, 64
g_DSPState:
	.space	64
	.type	last_rec_pos_time.16861, %object
	.size	last_rec_pos_time.16861, 64
last_rec_pos_time.16861:
	.space	64
	.type	last_rec_pos_decparam_time.16862, %object
	.size	last_rec_pos_decparam_time.16862, 64
last_rec_pos_decparam_time.16862:
	.space	64
	.type	ChanPriTab.16822, %object
	.size	ChanPriTab.16822, 64
ChanPriTab.16822:
	.space	64
	.type	g_SleepTime, %object
	.size	g_SleepTime, 4
g_SleepTime:
	.space	4
	.type	g_StopDec, %object
	.size	g_StopDec, 4
g_StopDec:
	.space	4
	.type	g_VfmwChanStat, %object
	.size	g_VfmwChanStat, 4800
g_VfmwChanStat:
	.space	4800
	.type	PrioArray.16418, %object
	.size	PrioArray.16418, 64
PrioArray.16418:
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
	.type	Capability.16465, %object
	.size	Capability.16465, 148
Capability.16465:
	.space	148
	.type	PrioArray.16464, %object
	.size	PrioArray.16464, 64
PrioArray.16464:
	.space	64
	.type	g_CurProcChan, %object
	.size	g_CurProcChan, 4
g_CurProcChan:
	.space	4
	.type	save_file_cnt.16986, %object
	.size	save_file_cnt.16986, 4
save_file_cnt.16986:
	.space	4
	.type	save_str_chan_num, %object
	.size	save_str_chan_num, 4
save_str_chan_num:
	.space	4
	.type	vfmw_save_seg_file, %object
	.size	vfmw_save_seg_file, 128
vfmw_save_seg_file:
	.space	128
	.type	save_file_cnt.16989, %object
	.size	save_file_cnt.16989, 4
save_file_cnt.16989:
	.space	4
	.type	save_seg_chan_num, %object
	.size	save_seg_chan_num, 4
save_seg_chan_num:
	.space	4
	.type	vfmw_save_yuv_file, %object
	.size	vfmw_save_yuv_file, 128
vfmw_save_yuv_file:
	.space	128
	.type	save_file_cnt.16994, %object
	.size	save_file_cnt.16994, 4
save_file_cnt.16994:
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
	.type	last_rec_pos_time.16538, %object
	.size	last_rec_pos_time.16538, 64
last_rec_pos_time.16538:
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
