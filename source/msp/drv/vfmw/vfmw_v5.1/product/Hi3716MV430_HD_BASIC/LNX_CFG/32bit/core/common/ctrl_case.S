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
	.file	"ctrl_case.c"
	.text
	.align	2
	.global	CASE_ResmueProcess
	.type	CASE_ResmueProcess, %function
CASE_ResmueProcess:
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
	.size	CASE_ResmueProcess, .-CASE_ResmueProcess
	.align	2
	.global	CASE_PauseProcess
	.type	CASE_PauseProcess, %function
CASE_PauseProcess:
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
	.size	CASE_PauseProcess, .-CASE_PauseProcess
	.align	2
	.global	CASE_GetChanMemSize
	.type	CASE_GetChanMemSize, %function
CASE_GetChanMemSize:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
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
	ldr	r2, .L10
	mov	r5, r1
	mov	r3, r0
	mov	r1, #52
	mov	r0, #20
	bl	dprint_normal
	cmp	r5, #0
	beq	.L9
	ldr	r6, .L10+4
	mov	r2, #12
	mov	r1, #0
	sub	r0, fp, #40
	ldr	r3, [r6, #48]
	blx	r3
	ldr	r3, [r6, #12]
	mov	r0, #0
	blx	r3
	sub	r2, fp, #40
	mov	r3, #1
	ldr	r1, [r5, #8]
	ldr	r0, [r5]
	bl	VCTRL_GetChanMemSize
	cmp	r0, #0
	bne	.L6
	ldr	r2, [fp, #-40]
	mov	r4, r0
	ldr	r3, [fp, #-36]
	stmia	r5, {r2, r3}
.L7:
	ldr	r3, [r6, #16]
	mov	r0, #0
	blx	r3
	mov	r0, r4
.L5:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L6:
	mvn	r3, #0
	ldr	r2, .L10+8
	mov	r1, #79
	mov	r0, #1
	bl	dprint_normal
	mvn	r4, #0
	b	.L7
.L9:
	mov	r1, #53
	mov	r0, r5
	str	r1, [sp]
	ldr	r3, .L10+12
	ldr	r2, .L10+16
	bl	dprint_normal
	mvn	r0, #0
	b	.L5
.L11:
	.align	2
.L10:
	.word	.LC0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC2
	.word	.LANCHOR0
	.word	.LC1
	UNWIND(.fnend)
	.size	CASE_GetChanMemSize, .-CASE_GetChanMemSize
	.align	2
	.global	CASE_DestroyChan
	.type	CASE_DestroyChan, %function
CASE_DestroyChan:
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
	ldr	r5, .L13
	mov	r4, r0
	ldr	r2, .L13+4
	mov	r3, r1
	mov	r0, #20
	mov	r1, #127
	bl	dprint_normal
	ldr	r3, [r5, #24]
	mvn	r1, #0
	mov	r0, #0
	blx	r3
	mov	r0, r4
	bl	VCTRL_DestroyChan
	ldr	r3, [r5, #28]
	mvn	r1, #0
	mov	r4, r0
	mov	r0, #0
	blx	r3
	adds	r0, r4, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L14:
	.align	2
.L13:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC3
	UNWIND(.fnend)
	.size	CASE_DestroyChan, .-CASE_DestroyChan
	.align	2
	.global	CASE_ResetChan
	.type	CASE_ResetChan, %function
CASE_ResetChan:
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
	ldr	r5, .L16
	mov	r4, r0
	ldr	r2, .L16+4
	mov	r3, r1
	mov	r0, #20
	mov	r1, #142
	bl	dprint_normal
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	mov	r0, r4
	bl	VCTRL_ResetChan
	ldr	r3, [r5, #16]
	mov	r4, r0
	mov	r0, #0
	blx	r3
	adds	r0, r4, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L17:
	.align	2
.L16:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC3
	UNWIND(.fnend)
	.size	CASE_ResetChan, .-CASE_ResetChan
	.align	2
	.global	CASE_StartChan
	.type	CASE_StartChan, %function
CASE_StartChan:
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
	ldr	r5, .L19
	mov	r7, r1
	mov	r4, r0
	ldr	r3, [r5]
	blx	r3
	ldr	r2, .L19+4
	mov	r1, #176
	mov	r3, r7
	mov	r6, r0
	mov	r0, #20
	bl	dprint_normal
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	mov	r0, r4
	bl	VCTRL_EnableEsBuf
	mov	r0, r4
	bl	VCTRL_StartChan
	ldr	r3, [r5, #16]
	mov	r7, r0
	mov	r0, #0
	blx	r3
	ldr	r3, [r5]
	blx	r3
	ldr	r3, .L19+8
	mov	r2, #100
	adds	r7, r7, #0
	mla	r4, r2, r4, r3
	movne	r7, #1
	rsb	r6, r6, r0
	rsb	r0, r7, #0
	str	r6, [r4, #40]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L20:
	.align	2
.L19:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC3
	.word	g_VfmwChanStat
	UNWIND(.fnend)
	.size	CASE_StartChan, .-CASE_StartChan
	.align	2
	.global	CASE_StopChan
	.type	CASE_StopChan, %function
CASE_StopChan:
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
	bl	VCTRL_StopChanWithCheck
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	CASE_StopChan, .-CASE_StopChan
	.align	2
	.global	CASE_GetChanState
	.type	CASE_GetChanState, %function
CASE_GetChanState:
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
	ldr	r4, .L23
	mov	r5, r0
	mov	r6, r1
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r6
	mov	r0, r5
	bl	VCTRL_GetChanState
	ldr	r3, [r4, #16]
	mov	r0, #0
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L24:
	.align	2
.L23:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	CASE_GetChanState, .-CASE_GetChanState
	.align	2
	.global	CASE_ReleaseStream
	.type	CASE_ReleaseStream, %function
CASE_ReleaseStream:
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
	ldr	r5, .L26
	mov	r4, r0
	ldr	r2, .L26+4
	mov	r3, r1
	mov	r0, #20
	mov	r1, #256
	bl	dprint_normal
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	mov	r0, r4
	bl	VCTRL_ReleaseStream
	ldr	r3, [r5, #16]
	mov	r4, r0
	mov	r0, #0
	blx	r3
	adds	r0, r4, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L27:
	.align	2
.L26:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC3
	UNWIND(.fnend)
	.size	CASE_ReleaseStream, .-CASE_ReleaseStream
	.align	2
	.global	CASE_ExtraWakupThread
	.type	CASE_ExtraWakupThread, %function
CASE_ExtraWakupThread:
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
	ldr	r4, .L29
	ldr	r2, .L29+4
	mov	r3, r0
	str	r1, [sp]
	mov	r0, #20
	mov	r1, #332
	bl	dprint_normal
	ldr	r3, [r4, #12]
	mov	r0, #0
	blx	r3
	bl	VCTRL_ExtraWakeUpThread
	ldr	r3, [r4, #16]
	mov	r0, #0
	blx	r3
	mov	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L30:
	.align	2
.L29:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC4
	UNWIND(.fnend)
	.size	CASE_ExtraWakupThread, .-CASE_ExtraWakupThread
	.align	2
	.global	CASE_ReportDemuxRelease
	.type	CASE_ReportDemuxRelease, %function
CASE_ReportDemuxRelease:
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
	ldr	r4, .L36
	mov	r5, r0
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r0, r5
	bl	VCTRL_IfEsBufEnable
	cmp	r0, #0
	beq	.L32
	mov	r0, r5
	bl	VCTRL_DisableEsBuf
.L32:
	ldr	r3, [r4, #16]
	mov	r0, #0
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L37:
	.align	2
.L36:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	CASE_ReportDemuxRelease, .-CASE_ReportDemuxRelease
	.align	2
	.global	CASE_BindRequireMem
	.type	CASE_BindRequireMem, %function
CASE_BindRequireMem:
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
	ldr	r4, .L39
	mov	r5, r0
	mov	r6, r1
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r6
	mov	r0, r5
	bl	VCTRL_BindRequireMem
	ldr	r3, [r4, #16]
	mov	r5, r0
	mov	r0, #0
	blx	r3
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L40:
	.align	2
.L39:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	CASE_BindRequireMem, .-CASE_BindRequireMem
	.align	2
	.global	CASE_SetFrameBufferMode
	.type	CASE_SetFrameBufferMode, %function
CASE_SetFrameBufferMode:
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
	ldr	r4, .L42
	mov	r5, r0
	mov	r6, r1
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	ldr	r1, [r6]
	mov	r0, r5
	bl	VCTRL_SetFrameBufferMode
	ldr	r3, [r4, #16]
	mov	r5, r0
	mov	r0, #0
	blx	r3
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L43:
	.align	2
.L42:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	CASE_SetFrameBufferMode, .-CASE_SetFrameBufferMode
	.align	2
	.global	CASE_BindExternBuffer
	.type	CASE_BindExternBuffer, %function
CASE_BindExternBuffer:
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
	ldr	r4, .L45
	mov	r5, r0
	mov	r6, r1
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r6
	mov	r0, r5
	bl	VCTRL_BindExternBuffer
	ldr	r3, [r4, #16]
	mov	r5, r0
	mov	r0, #0
	blx	r3
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L46:
	.align	2
.L45:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	CASE_BindExternBuffer, .-CASE_BindExternBuffer
	.align	2
	.global	CASE_UnBindExternBuffer
	.type	CASE_UnBindExternBuffer, %function
CASE_UnBindExternBuffer:
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
	ldr	r4, .L48
	mov	r5, r0
	mov	r6, r1
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r6
	mov	r0, r5
	bl	VCTRL_UnBindExternBuffer
	ldr	r3, [r4, #16]
	mov	r5, r0
	mov	r0, #0
	blx	r3
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L49:
	.align	2
.L48:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	CASE_UnBindExternBuffer, .-CASE_UnBindExternBuffer
	.align	2
	.global	CASE_SetFrameBufferNum
	.type	CASE_SetFrameBufferNum, %function
CASE_SetFrameBufferNum:
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
	ldr	r4, .L51
	mov	r5, r0
	mov	r6, r1
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	ldr	r1, [r6]
	mov	r0, r5
	bl	VCTRL_SetFrameBufferNum
	ldr	r3, [r4, #16]
	mov	r5, r0
	mov	r0, #0
	blx	r3
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L52:
	.align	2
.L51:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	CASE_SetFrameBufferNum, .-CASE_SetFrameBufferNum
	.align	2
	.global	CASE_GetCapability
	.type	CASE_GetCapability, %function
CASE_GetCapability:
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
	ldr	r2, .L57
	mov	r4, r1
	mov	r3, r0
	mov	r1, #24
	mov	r0, #20
	bl	dprint_normal
	cmp	r4, #0
	beq	.L56
	mov	r1, r4
	mov	r0, #0
	bl	PDT_GetAttribute
	mov	r0, #0
.L55:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L56:
	mov	r1, #25
	mov	r0, r4
	str	r1, [sp]
	ldr	r3, .L57+4
	ldr	r2, .L57+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L55
.L58:
	.align	2
.L57:
	.word	.LC0
	.word	.LANCHOR0+20
	.word	.LC1
	UNWIND(.fnend)
	.size	CASE_GetCapability, .-CASE_GetCapability
	.align	2
	.global	CASE_GetOutputFormat
	.type	CASE_GetOutputFormat, %function
CASE_GetOutputFormat:
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
	ldr	r2, .L63
	mov	r4, r1
	mov	r3, r0
	mov	r1, #34
	mov	r0, #20
	bl	dprint_normal
	cmp	r4, #0
	beq	.L62
	mov	r1, r4
	mov	r0, #1
	bl	PDT_GetAttribute
	mov	r0, #0
.L61:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L62:
	mov	r1, #35
	mov	r0, r4
	str	r1, [sp]
	ldr	r3, .L63+4
	ldr	r2, .L63+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L61
.L64:
	.align	2
.L63:
	.word	.LC0
	.word	.LANCHOR0+40
	.word	.LC1
	UNWIND(.fnend)
	.size	CASE_GetOutputFormat, .-CASE_GetOutputFormat
	.align	2
	.global	CASE_CreateChan
	.type	CASE_CreateChan, %function
CASE_CreateChan:
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
	ldr	r2, .L69
	mov	r4, r1
	mov	r3, r0
	mov	r1, #99
	mov	r0, #20
	bl	dprint_normal
	cmp	r4, #0
	beq	.L68
	ldr	r6, .L69+4
	mvn	r1, #0
	mov	r0, #0
	ldr	r3, [r6, #24]
	blx	r3
	mov	r3, #0
	mov	r2, #2
	ldr	r1, [r4, #8]
	ldr	r0, [r4]
	bl	VCTRL_CreateChan
	ldr	r3, [r6, #28]
	mvn	r1, #0
	mov	r5, r0
	mov	r0, #0
	blx	r3
	mov	r0, r5, asr #31
	str	r5, [r4]
.L67:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L68:
	mov	r1, #100
	mov	r0, r4
	str	r1, [sp]
	ldr	r3, .L69+8
	ldr	r2, .L69+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L67
.L70:
	.align	2
.L69:
	.word	.LC0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+64
	.word	.LC1
	UNWIND(.fnend)
	.size	CASE_CreateChan, .-CASE_CreateChan
	.align	2
	.global	CASE_ResetChanWithOption
	.type	CASE_ResetChanWithOption, %function
CASE_ResetChanWithOption:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L74
	ldr	r4, .L75
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_ResetChanWithOption
	ldr	r3, [r4, #16]
	adds	r4, r0, #0
	mov	r0, #0
	movne	r4, #1
	rsb	r4, r4, #0
	blx	r3
.L73:
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L74:
	mov	r1, #158
	mov	r0, r5
	str	r1, [sp]
	mvn	r4, #0
	ldr	r3, .L75+4
	ldr	r2, .L75+8
	bl	dprint_normal
	b	.L73
.L76:
	.align	2
.L75:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+80
	.word	.LC1
	UNWIND(.fnend)
	.size	CASE_ResetChanWithOption, .-CASE_ResetChanWithOption
	.align	2
	.global	CASE_GetChanConfig
	.type	CASE_GetChanConfig, %function
CASE_GetChanConfig:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L80
	ldr	r4, .L81
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_GetChanCfg
	ldr	r3, [r4, #16]
	adds	r4, r0, #0
	mov	r0, #0
	movne	r4, #1
	rsb	r4, r4, #0
	blx	r3
.L79:
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L80:
	mov	r1, #213
	mov	r0, r5
	str	r1, [sp]
	mvn	r4, #0
	ldr	r3, .L81+4
	ldr	r2, .L81+8
	bl	dprint_normal
	b	.L79
.L82:
	.align	2
.L81:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+108
	.word	.LC1
	UNWIND(.fnend)
	.size	CASE_GetChanConfig, .-CASE_GetChanConfig
	.align	2
	.global	CASE_ConfigChan
	.type	CASE_ConfigChan, %function
CASE_ConfigChan:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L86
	ldr	r4, .L87
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_ConfigChan
	ldr	r3, [r4, #16]
	adds	r4, r0, #0
	mov	r0, #0
	movne	r4, #1
	rsb	r4, r4, #0
	blx	r3
.L85:
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L86:
	mov	r1, #229
	mov	r0, r5
	str	r1, [sp]
	mvn	r4, #0
	ldr	r3, .L87+4
	ldr	r2, .L87+8
	bl	dprint_normal
	b	.L85
.L88:
	.align	2
.L87:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+128
	.word	.LC1
	UNWIND(.fnend)
	.size	CASE_ConfigChan, .-CASE_ConfigChan
	.align	2
	.global	CASE_SetStreamIntf
	.type	CASE_SetStreamIntf, %function
CASE_SetStreamIntf:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L92
	ldr	r4, .L93
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_SetStreamInterface
	ldr	r3, [r4, #16]
	adds	r4, r0, #0
	mov	r0, #0
	movne	r4, #1
	rsb	r4, r4, #0
	blx	r3
.L91:
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L92:
	mov	r1, #272
	mov	r0, r5
	str	r1, [sp]
	mvn	r4, #0
	ldr	r3, .L93+4
	ldr	r2, .L93+8
	bl	dprint_normal
	b	.L91
.L94:
	.align	2
.L93:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+144
	.word	.LC1
	UNWIND(.fnend)
	.size	CASE_SetStreamIntf, .-CASE_SetStreamIntf
	.align	2
	.global	CASE_SetDeiMemQueryIntf
	.type	CASE_SetDeiMemQueryIntf, %function
CASE_SetDeiMemQueryIntf:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L98
	ldr	r4, .L99
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_SetDeiMemQueryInterface
	ldr	r3, [r4, #16]
	adds	r4, r0, #0
	mov	r0, #0
	movne	r4, #1
	rsb	r4, r4, #0
	blx	r3
.L97:
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L98:
	mov	r1, #288
	mov	r0, r5
	str	r1, [sp]
	mvn	r4, #0
	ldr	r3, .L99+4
	ldr	r2, .L99+8
	bl	dprint_normal
	b	.L97
.L100:
	.align	2
.L99:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+164
	.word	.LC1
	UNWIND(.fnend)
	.size	CASE_SetDeiMemQueryIntf, .-CASE_SetDeiMemQueryIntf
	.align	2
	.global	CASE_GetChanMemInfo
	.type	CASE_GetChanMemInfo, %function
CASE_GetChanMemInfo:
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
	subs	r4, r1, #0
	mov	r6, r0
	beq	.L104
	ldr	r5, .L105
	mov	r0, #0
	ldr	r3, [r5, #12]
	blx	r3
	mov	r1, r4
	mov	r0, r6
	bl	VCTRL_GetChanMemInfo
	ldr	r3, [r5, #16]
	mov	r4, r0
	mov	r0, #0
	blx	r3
	mov	r0, r4
.L103:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L104:
	mov	r1, #304
	mov	r0, r4
	str	r1, [sp]
	ldr	r3, .L105+4
	ldr	r2, .L105+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L103
.L106:
	.align	2
.L105:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+188
	.word	.LC1
	UNWIND(.fnend)
	.size	CASE_GetChanMemInfo, .-CASE_GetChanMemInfo
	.align	2
	.global	CASE_GetStreamSize
	.type	CASE_GetStreamSize, %function
CASE_GetStreamSize:
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
	subs	r4, r1, #0
	mov	r6, r0
	beq	.L110
	ldr	r5, .L111
	mov	r0, #0
	ldr	r3, [r5, #12]
	blx	r3
	mov	r1, r4
	mov	r0, r6
	bl	VCTRL_GetStreamSize
	ldr	r3, [r5, #16]
	mov	r4, r0
	mov	r0, #0
	blx	r3
	mov	r0, r4
.L109:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L110:
	movw	r1, #319
	mov	r0, r4
	str	r1, [sp]
	ldr	r3, .L111+4
	ldr	r2, .L111+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L109
.L112:
	.align	2
.L111:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+208
	.word	.LC1
	UNWIND(.fnend)
	.size	CASE_GetStreamSize, .-CASE_GetStreamSize
	.align	2
	.global	CASE_SetDiscardPicParam
	.type	CASE_SetDiscardPicParam, %function
CASE_SetDiscardPicParam:
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
	subs	r4, r1, #0
	mov	r6, r0
	beq	.L116
	ldr	r5, .L117
	mov	r0, #0
	ldr	r3, [r5, #12]
	blx	r3
	mov	r1, r4
	mov	r0, r6
	bl	VCTRL_SetDiscardPicParam
	ldr	r3, [r5, #16]
	mov	r4, r0
	mov	r0, #0
	blx	r3
	mov	r0, r4
.L115:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L116:
	movw	r1, #347
	mov	r0, r4
	str	r1, [sp]
	ldr	r3, .L117+4
	ldr	r2, .L117+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L115
.L118:
	.align	2
.L117:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+228
	.word	.LC1
	UNWIND(.fnend)
	.size	CASE_SetDiscardPicParam, .-CASE_SetDiscardPicParam
	.align	2
	.global	CASE_SetPtsToSeek
	.type	CASE_SetPtsToSeek, %function
CASE_SetPtsToSeek:
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
	subs	r7, r1, #0
	mov	r6, r0
	beq	.L123
	ldr	r5, .L125
	mov	r0, #0
	ldr	r3, [r5, #12]
	blx	r3
	sub	r1, fp, #40
	mov	r0, r6
	mov	r3, #0
	mov	r2, #1
	str	r3, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-32]
	bl	VCTRL_ResetChanWithOption
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r4, r0, #0
	cmp	r4, #0
	beq	.L124
.L122:
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	mov	r0, r4
.L121:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L124:
	mov	r1, r7
	mov	r0, r6
	bl	VCTRL_SeekPts
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r4, r0, #0
	b	.L122
.L123:
	mov	r1, #364
	mov	r0, r7
	str	r1, [sp]
	ldr	r3, .L125+4
	ldr	r2, .L125+8
	bl	dprint_normal
	mvn	r0, #0
	b	.L121
.L126:
	.align	2
.L125:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+252
	.word	.LC1
	UNWIND(.fnend)
	.size	CASE_SetPtsToSeek, .-CASE_SetPtsToSeek
	.align	2
	.global	CASE_SetTrickMode
	.type	CASE_SetTrickMode, %function
CASE_SetTrickMode:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L130
	ldr	r4, .L131
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_ConfigFFFBSpeed
	ldr	r3, [r4, #16]
	adds	r4, r0, #0
	mov	r0, #0
	movne	r4, #1
	rsb	r4, r4, #0
	blx	r3
.L129:
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L130:
	movw	r1, #390
	mov	r0, r5
	str	r1, [sp]
	mvn	r4, #0
	ldr	r3, .L131+4
	ldr	r2, .L131+8
	bl	dprint_normal
	b	.L129
.L132:
	.align	2
.L131:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+272
	.word	.LC1
	UNWIND(.fnend)
	.size	CASE_SetTrickMode, .-CASE_SetTrickMode
	.align	2
	.global	CASE_SetCtrlInfo
	.type	CASE_SetCtrlInfo, %function
CASE_SetCtrlInfo:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L136
	ldr	r4, .L137
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_ConfigPVRInfo
	ldr	r3, [r4, #16]
	adds	r4, r0, #0
	mov	r0, #0
	movne	r4, #1
	rsb	r4, r4, #0
	blx	r3
.L135:
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L136:
	movw	r1, #406
	mov	r0, r5
	str	r1, [sp]
	mvn	r4, #0
	ldr	r3, .L137+4
	ldr	r2, .L137+8
	bl	dprint_normal
	b	.L135
.L138:
	.align	2
.L137:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+292
	.word	.LC1
	UNWIND(.fnend)
	.size	CASE_SetCtrlInfo, .-CASE_SetCtrlInfo
	.align	2
	.global	CASE_HandleEntry
	.type	CASE_HandleEntry, %function
CASE_HandleEntry:
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
	cmp	r1, #5
	ldrne	ip, .L171
	bne	.L144
	b	.L169
.L164:
	ldr	r3, [ip, #16]
	add	ip, ip, #12
	cmp	r3, #0
	beq	.L140
	cmp	lr, r1
	beq	.L167
.L144:
	ldr	lr, [ip, #12]
	cmp	lr, #41
	bne	.L164
.L140:
	cmp	r1, #11
	cmpne	r1, #1
	bls	.L151
	mov	r3, #0
.L141:
	cmp	r0, #3
	bhi	.L170
	ldr	ip, .L171+4
	ldr	ip, [ip, r0, asl #2]
	cmp	ip, #0
	beq	.L148
	ldr	ip, [ip, #4]
	cmp	ip, r0
	bne	.L148
	cmp	r3, #0
	beq	.L151
	mov	r1, r2
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L167:
	cmp	r1, #11
	cmpne	r1, #1
	bhi	.L141
	mov	r1, r2
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L151:
	mov	r3, r1
	ldr	r2, .L171+8
	mov	r1, #652
	mov	r0, #1
	bl	dprint_normal
.L165:
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L169:
	ldr	r3, .L171+12
	b	.L141
.L148:
	str	r1, [sp]
	mov	r3, r0
	ldr	r2, .L171+16
	movw	r1, #645
	mov	r0, #1
	bl	dprint_normal
	b	.L165
.L170:
	str	r1, [sp]
	mov	r3, r0
	ldr	r2, .L171+16
	movw	r1, #639
	mov	r0, #1
	bl	dprint_normal
	b	.L165
.L172:
	.align	2
.L171:
	.word	.LANCHOR0+312
	.word	s_pstVfmwChan
	.word	.LC6
	.word	CASE_GetChanState
	.word	.LC5
	UNWIND(.fnend)
	.size	CASE_HandleEntry, .-CASE_HandleEntry
	.global	VDEC_CID_HandlerTable
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.9898, %object
	.size	__func__.9898, 20
__func__.9898:
	.ascii	"CASE_GetChanMemSize\000"
	.type	__func__.9884, %object
	.size	__func__.9884, 19
__func__.9884:
	.ascii	"CASE_GetCapability\000"
	.space	1
	.type	__func__.9889, %object
	.size	__func__.9889, 21
__func__.9889:
	.ascii	"CASE_GetOutputFormat\000"
	.space	3
	.type	__func__.9906, %object
	.size	__func__.9906, 16
__func__.9906:
	.ascii	"CASE_CreateChan\000"
	.type	__func__.9922, %object
	.size	__func__.9922, 25
__func__.9922:
	.ascii	"CASE_ResetChanWithOption\000"
	.space	3
	.type	__func__.9939, %object
	.size	__func__.9939, 19
__func__.9939:
	.ascii	"CASE_GetChanConfig\000"
	.space	1
	.type	__func__.9945, %object
	.size	__func__.9945, 16
__func__.9945:
	.ascii	"CASE_ConfigChan\000"
	.type	__func__.9960, %object
	.size	__func__.9960, 19
__func__.9960:
	.ascii	"CASE_SetStreamIntf\000"
	.space	1
	.type	__func__.9966, %object
	.size	__func__.9966, 24
__func__.9966:
	.ascii	"CASE_SetDeiMemQueryIntf\000"
	.type	__func__.9972, %object
	.size	__func__.9972, 20
__func__.9972:
	.ascii	"CASE_GetChanMemInfo\000"
	.type	__func__.9978, %object
	.size	__func__.9978, 19
__func__.9978:
	.ascii	"CASE_GetStreamSize\000"
	.space	1
	.type	__func__.9988, %object
	.size	__func__.9988, 24
__func__.9988:
	.ascii	"CASE_SetDiscardPicParam\000"
	.type	__func__.9996, %object
	.size	__func__.9996, 18
__func__.9996:
	.ascii	"CASE_SetPtsToSeek\000"
	.space	2
	.type	__func__.10002, %object
	.size	__func__.10002, 18
__func__.10002:
	.ascii	"CASE_SetTrickMode\000"
	.space	2
	.type	__func__.10008, %object
	.size	__func__.10008, 17
__func__.10008:
	.ascii	"CASE_SetCtrlInfo\000"
	.space	3
	.type	VDEC_CID_HandlerTable, %object
	.size	VDEC_CID_HandlerTable, 372
VDEC_CID_HandlerTable:
	.word	5
	.word	CASE_GetChanState
	.word	100
	.word	0
	.word	CASE_GetCapability
	.word	148
	.word	29
	.word	CASE_GetOutputFormat
	.word	16
	.word	11
	.word	CASE_GetChanMemSize
	.word	128
	.word	1
	.word	CASE_CreateChan
	.word	128
	.word	2
	.word	CASE_DestroyChan
	.word	0
	.word	8
	.word	CASE_ResetChan
	.word	0
	.word	13
	.word	CASE_ResetChanWithOption
	.word	12
	.word	3
	.word	CASE_GetChanConfig
	.word	156
	.word	6
	.word	CASE_StartChan
	.word	0
	.word	7
	.word	CASE_StopChan
	.word	0
	.word	4
	.word	CASE_ConfigChan
	.word	156
	.word	12
	.word	CASE_ReleaseStream
	.word	0
	.word	9
	.word	CASE_SetStreamIntf
	.word	12
	.word	10
	.word	CASE_GetStreamSize
	.word	4
	.word	18
	.word	CASE_ExtraWakupThread
	.word	0
	.word	17
	.word	CASE_SetDiscardPicParam
	.word	8
	.word	21
	.word	CASE_SetPtsToSeek
	.word	24
	.word	22
	.word	CASE_SetTrickMode
	.word	4
	.word	23
	.word	CASE_SetCtrlInfo
	.word	24
	.word	30
	.word	CASE_ReportDemuxRelease
	.word	0
	.word	33
	.word	CASE_BindRequireMem
	.word	152
	.word	34
	.word	CASE_SetFrameBufferMode
	.word	4
	.word	35
	.word	CASE_BindExternBuffer
	.word	312
	.word	36
	.word	CASE_UnBindExternBuffer
	.word	312
	.word	28
	.word	CASE_SetFrameBufferNum
	.word	4
	.word	37
	.word	CASE_ResmueProcess
	.word	0
	.word	38
	.word	CASE_PauseProcess
	.word	0
	.word	39
	.word	CASE_SetDeiMemQueryIntf
	.word	8
	.word	40
	.word	CASE_GetChanMemInfo
	.word	28
	.word	41
	.word	0
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"Not care param %d\012\000" )
	.space	1
.LC1:
	ASCII(.ascii	"invalid condition: %s %d\012\000" )
	.space	2
.LC2:
	ASCII(.ascii	"call VCTRL_GetChanMemSize failed ret:%d\012\000" )
	.space	3
.LC3:
	ASCII(.ascii	"Not care param %p\012\000" )
	.space	1
.LC4:
	ASCII(.ascii	"Not care param %d %p\012\000" )
	.space	2
.LC5:
	ASCII(.ascii	"Chan id: %d is invalid, Cmd ID:%d\012\000" )
	.space	1
.LC6:
	ASCII(.ascii	"Unsupport eCmdID %d\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
