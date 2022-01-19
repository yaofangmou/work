#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"ctrl_case.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	CASE_PauseProcess
	.type	CASE_PauseProcess, %function
CASE_PauseProcess:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.size	CASE_PauseProcess, .-CASE_PauseProcess
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_GetChanMemSize
	.type	CASE_GetChanMemSize, %function
CASE_GetChanMemSize:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x2, .LC1
	mov	w3, w20
	mov	w1, 52
	mov	w0, 20
	bl	dprint_normal
	cbz	x19, .L8
	ldr	x20, .LC5
	mov	x2, 12
	mov	w1, 0
	add	x0, x29, 32
	ldr	x3, [x20, 96]
	blr	x3
	ldr	x1, [x20, 24]
	mov	w0, 0
	blr	x1
	ldr	w0, [x19]
	mov	w3, 1
	ldr	x1, [x19, 8]
	add	x2, x29, 32
	bl	VCTRL_GetChanMemSize
	cbnz	w0, .L5
	ldp	w1, w0, [x29, 32]
	stp	w1, w0, [x19]
	mov	w19, 0
.L6:
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	mov	w0, w19
.L4:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L5:
	ldr	x2, .LC7
	mov	w3, -1
	mov	w1, 79
	mov	w0, 1
	mov	w19, w3
	bl	dprint_normal
	b	.L6
.L8:
	mov	w4, 53
	ldr	x3, .LC2
	ldr	x2, .LC4
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L4
	.size	CASE_GetChanMemSize, .-CASE_GetChanMemSize
	.align	3
.LC1:
	.xword	.LC0
	.align	3
.LC2:
	.xword	.LANCHOR0
	.align	3
.LC4:
	.xword	.LC3
	.align	3
.LC5:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC7:
	.xword	.LC6
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_DestroyChan
	.type	CASE_DestroyChan, %function
CASE_DestroyChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x2, .LC9
	mov	x3, x19
	mov	w1, 127
	mov	w0, 20
	bl	dprint_normal
	ldr	x19, .LC10
	mov	w1, -1
	mov	w0, 0
	ldr	x2, [x19, 48]
	blr	x2
	mov	w0, w20
	bl	VCTRL_DestroyChan
	mov	w20, w0
	ldr	x2, [x19, 56]
	mov	w0, 0
	mov	w1, -1
	blr	x2
	cmp	w20, wzr
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CASE_DestroyChan, .-CASE_DestroyChan
	.align	3
.LC9:
	.xword	.LC8
	.align	3
.LC10:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_ResetChan
	.type	CASE_ResetChan, %function
CASE_ResetChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x2, .LC11
	mov	x3, x19
	mov	w1, 142
	mov	w0, 20
	bl	dprint_normal
	ldr	x19, .LC12
	mov	w0, 0
	ldr	x1, [x19, 24]
	blr	x1
	mov	w0, w20
	bl	VCTRL_ResetChan
	mov	w20, w0
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	cmp	w20, wzr
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CASE_ResetChan, .-CASE_ResetChan
	.align	3
.LC11:
	.xword	.LC8
	.align	3
.LC12:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_StartChan
	.type	CASE_StartChan, %function
CASE_StartChan:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	sxtw	x19, w0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	ldr	x20, .LC13
	ldr	x0, [x20]
	blr	x0
	mov	w21, w0
	ldr	x2, .LC14
	mov	x3, x22
	mov	w1, 176
	mov	w0, 20
	bl	dprint_normal
	ldr	x1, [x20, 24]
	mov	w0, 0
	blr	x1
	mov	w0, w19
	bl	VCTRL_EnableEsBuf
	mov	w0, w19
	bl	VCTRL_StartChan
	mov	w22, w0
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	ldr	x0, [x20]
	blr	x0
	sub	w21, w0, w21
	lsl	x1, x19, 2
	ldr	x3, .LC15
	sub	x1, x1, x19
	cmp	w22, wzr
	lsl	x2, x1, 5
	csetm	w0, ne
	add	x1, x1, x2
	add	x19, x1, x19
	add	x19, x3, x19
	str	w21, [x19, 40]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	CASE_StartChan, .-CASE_StartChan
	.align	3
.LC13:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC14:
	.xword	.LC8
	.align	3
.LC15:
	.xword	g_VfmwChanStat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_StopChan
	.type	CASE_StopChan, %function
CASE_StopChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, w19
	bl	VCTRL_StopChanWithCheck
	cmp	w0, wzr
	csetm	w0, ne
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CASE_StopChan, .-CASE_StopChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_GetChanState
	.type	CASE_GetChanState, %function
CASE_GetChanState:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x19, .LC16
	mov	w0, 0
	ldr	x1, [x19, 24]
	blr	x1
	mov	x1, x21
	mov	w0, w20
	bl	VCTRL_GetChanState
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	CASE_GetChanState, .-CASE_GetChanState
	.align	3
.LC16:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_ReleaseStream
	.type	CASE_ReleaseStream, %function
CASE_ReleaseStream:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x2, .LC17
	mov	x3, x19
	mov	w1, 256
	mov	w0, 20
	bl	dprint_normal
	ldr	x19, .LC18
	mov	w0, 0
	ldr	x1, [x19, 24]
	blr	x1
	mov	w0, w20
	bl	VCTRL_ReleaseStream
	mov	w20, w0
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	cmp	w20, wzr
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CASE_ReleaseStream, .-CASE_ReleaseStream
	.align	3
.LC17:
	.xword	.LC8
	.align	3
.LC18:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_ExtraWakupThread
	.type	CASE_ExtraWakupThread, %function
CASE_ExtraWakupThread:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x2, .LC20
	mov	x4, x20
	mov	w3, w19
	mov	w1, 332
	mov	w0, 20
	bl	dprint_normal
	ldr	x19, .LC21
	mov	w0, 0
	ldr	x1, [x19, 24]
	blr	x1
	bl	VCTRL_ExtraWakeUpThread
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CASE_ExtraWakupThread, .-CASE_ExtraWakupThread
	.align	3
.LC20:
	.xword	.LC19
	.align	3
.LC21:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_ReportDemuxRelease
	.type	CASE_ReportDemuxRelease, %function
CASE_ReportDemuxRelease:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC22
	mov	w0, 0
	ldr	x1, [x19, 24]
	blr	x1
	mov	w0, w20
	bl	VCTRL_IfEsBufEnable
	cbz	w0, .L17
	mov	w0, w20
	bl	VCTRL_DisableEsBuf
.L17:
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CASE_ReportDemuxRelease, .-CASE_ReportDemuxRelease
	.align	3
.LC22:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_BindRequireMem
	.type	CASE_BindRequireMem, %function
CASE_BindRequireMem:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x19, .LC23
	mov	w0, 0
	ldr	x1, [x19, 24]
	blr	x1
	mov	x1, x21
	mov	w0, w20
	bl	VCTRL_BindRequireMem
	mov	w20, w0
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	CASE_BindRequireMem, .-CASE_BindRequireMem
	.align	3
.LC23:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_SetFrameBufferMode
	.type	CASE_SetFrameBufferMode, %function
CASE_SetFrameBufferMode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x19, .LC24
	mov	w0, 0
	ldr	x1, [x19, 24]
	blr	x1
	ldr	w1, [x21]
	mov	w0, w20
	bl	VCTRL_SetFrameBufferMode
	mov	w20, w0
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	CASE_SetFrameBufferMode, .-CASE_SetFrameBufferMode
	.align	3
.LC24:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_BindExternBuffer
	.type	CASE_BindExternBuffer, %function
CASE_BindExternBuffer:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x19, .LC25
	mov	w0, 0
	ldr	x1, [x19, 24]
	blr	x1
	mov	x1, x21
	mov	w0, w20
	bl	VCTRL_BindExternBuffer
	mov	w20, w0
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	CASE_BindExternBuffer, .-CASE_BindExternBuffer
	.align	3
.LC25:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_UnBindExternBuffer
	.type	CASE_UnBindExternBuffer, %function
CASE_UnBindExternBuffer:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x19, .LC26
	mov	w0, 0
	ldr	x1, [x19, 24]
	blr	x1
	mov	x1, x21
	mov	w0, w20
	bl	VCTRL_UnBindExternBuffer
	mov	w20, w0
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	CASE_UnBindExternBuffer, .-CASE_UnBindExternBuffer
	.align	3
.LC26:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_SetFrameBufferNum
	.type	CASE_SetFrameBufferNum, %function
CASE_SetFrameBufferNum:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x19, .LC27
	mov	w0, 0
	ldr	x1, [x19, 24]
	blr	x1
	ldr	w1, [x21]
	mov	w0, w20
	bl	VCTRL_SetFrameBufferNum
	mov	w20, w0
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	CASE_SetFrameBufferNum, .-CASE_SetFrameBufferNum
	.align	3
.LC27:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_GetCapability
	.type	CASE_GetCapability, %function
CASE_GetCapability:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x2, .LC28
	mov	w3, w20
	mov	w1, 24
	mov	w0, 20
	bl	dprint_normal
	cbz	x19, .L29
	mov	x1, x19
	mov	w0, 0
	bl	PDT_GetAttribute
	mov	w0, 0
.L28:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L29:
	ldr	x3, .LC29
	mov	w4, 25
	ldr	x2, .LC30
	mov	w1, w4
	add	x3, x3, 24
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L28
	.size	CASE_GetCapability, .-CASE_GetCapability
	.align	3
.LC28:
	.xword	.LC0
	.align	3
.LC29:
	.xword	.LANCHOR0
	.align	3
.LC30:
	.xword	.LC3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_GetOutputFormat
	.type	CASE_GetOutputFormat, %function
CASE_GetOutputFormat:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x2, .LC31
	mov	w3, w20
	mov	w1, 34
	mov	w0, 20
	bl	dprint_normal
	cbz	x19, .L33
	mov	x1, x19
	mov	w0, 1
	bl	PDT_GetAttribute
	mov	w0, 0
.L32:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L33:
	ldr	x3, .LC32
	mov	w4, 35
	ldr	x2, .LC33
	mov	w1, w4
	add	x3, x3, 48
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L32
	.size	CASE_GetOutputFormat, .-CASE_GetOutputFormat
	.align	3
.LC31:
	.xword	.LC0
	.align	3
.LC32:
	.xword	.LANCHOR0
	.align	3
.LC33:
	.xword	.LC3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_CreateChan
	.type	CASE_CreateChan, %function
CASE_CreateChan:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x2, .LC34
	mov	w3, w20
	mov	w1, 99
	mov	w0, 20
	bl	dprint_normal
	cbz	x19, .L37
	ldr	x21, .LC37
	mov	w1, -1
	mov	w0, 0
	ldr	x2, [x21, 48]
	blr	x2
	ldr	x1, [x19, 8]
	mov	w3, 0
	ldr	w0, [x19]
	mov	w2, 2
	bl	VCTRL_CreateChan
	mov	w20, w0
	ldr	x2, [x21, 56]
	mov	w0, 0
	mov	w1, -1
	blr	x2
	str	w20, [x19]
	asr	w0, w20, 31
.L36:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L37:
	ldr	x3, .LC35
	mov	w4, 100
	ldr	x2, .LC36
	mov	w1, w4
	add	x3, x3, 72
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L36
	.size	CASE_CreateChan, .-CASE_CreateChan
	.align	3
.LC34:
	.xword	.LC0
	.align	3
.LC35:
	.xword	.LANCHOR0
	.align	3
.LC36:
	.xword	.LC3
	.align	3
.LC37:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_ResetChanWithOption
	.type	CASE_ResetChanWithOption, %function
CASE_ResetChanWithOption:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L41
	ldr	x20, .LC40
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_ResetChanWithOption
	cmp	w0, wzr
	ldr	x1, [x20, 32]
	mov	w0, 0
	csetm	w19, ne
	blr	x1
.L40:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L41:
	ldr	x3, .LC38
	mov	w4, 158
	ldr	x2, .LC39
	mov	w1, w4
	add	x3, x3, 88
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L40
	.size	CASE_ResetChanWithOption, .-CASE_ResetChanWithOption
	.align	3
.LC38:
	.xword	.LANCHOR0
	.align	3
.LC39:
	.xword	.LC3
	.align	3
.LC40:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_GetChanConfig
	.type	CASE_GetChanConfig, %function
CASE_GetChanConfig:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L45
	ldr	x20, .LC43
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_GetChanCfg
	cmp	w0, wzr
	ldr	x1, [x20, 32]
	mov	w0, 0
	csetm	w19, ne
	blr	x1
.L44:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L45:
	ldr	x3, .LC41
	mov	w4, 213
	ldr	x2, .LC42
	mov	w1, w4
	add	x3, x3, 120
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L44
	.size	CASE_GetChanConfig, .-CASE_GetChanConfig
	.align	3
.LC41:
	.xword	.LANCHOR0
	.align	3
.LC42:
	.xword	.LC3
	.align	3
.LC43:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_ConfigChan
	.type	CASE_ConfigChan, %function
CASE_ConfigChan:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L49
	ldr	x20, .LC46
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_ConfigChan
	cmp	w0, wzr
	ldr	x1, [x20, 32]
	mov	w0, 0
	csetm	w19, ne
	blr	x1
.L48:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L49:
	ldr	x3, .LC44
	mov	w4, 229
	ldr	x2, .LC45
	mov	w1, w4
	add	x3, x3, 144
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L48
	.size	CASE_ConfigChan, .-CASE_ConfigChan
	.align	3
.LC44:
	.xword	.LANCHOR0
	.align	3
.LC45:
	.xword	.LC3
	.align	3
.LC46:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_SetStreamIntf
	.type	CASE_SetStreamIntf, %function
CASE_SetStreamIntf:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L53
	ldr	x20, .LC49
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_SetStreamInterface
	cmp	w0, wzr
	ldr	x1, [x20, 32]
	mov	w0, 0
	csetm	w19, ne
	blr	x1
.L52:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L53:
	ldr	x3, .LC47
	mov	w4, 272
	ldr	x2, .LC48
	mov	w1, w4
	add	x3, x3, 160
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L52
	.size	CASE_SetStreamIntf, .-CASE_SetStreamIntf
	.align	3
.LC47:
	.xword	.LANCHOR0
	.align	3
.LC48:
	.xword	.LC3
	.align	3
.LC49:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_SetDeiMemQueryIntf
	.type	CASE_SetDeiMemQueryIntf, %function
CASE_SetDeiMemQueryIntf:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L57
	ldr	x20, .LC52
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_SetDeiMemQueryInterface
	cmp	w0, wzr
	ldr	x1, [x20, 32]
	mov	w0, 0
	csetm	w19, ne
	blr	x1
.L56:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L57:
	ldr	x3, .LC50
	mov	w4, 288
	ldr	x2, .LC51
	mov	w1, w4
	add	x3, x3, 184
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L56
	.size	CASE_SetDeiMemQueryIntf, .-CASE_SetDeiMemQueryIntf
	.align	3
.LC50:
	.xword	.LANCHOR0
	.align	3
.LC51:
	.xword	.LC3
	.align	3
.LC52:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_GetChanMemInfo
	.type	CASE_GetChanMemInfo, %function
CASE_GetChanMemInfo:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L61
	ldr	x20, .LC55
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_GetChanMemInfo
	mov	w19, w0
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	mov	w0, w19
.L60:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L61:
	ldr	x3, .LC53
	mov	w4, 304
	ldr	x2, .LC54
	mov	w1, w4
	add	x3, x3, 208
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L60
	.size	CASE_GetChanMemInfo, .-CASE_GetChanMemInfo
	.align	3
.LC53:
	.xword	.LANCHOR0
	.align	3
.LC54:
	.xword	.LC3
	.align	3
.LC55:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_GetStreamSize
	.type	CASE_GetStreamSize, %function
CASE_GetStreamSize:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L65
	ldr	x20, .LC58
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_GetStreamSize
	mov	w19, w0
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	mov	w0, w19
.L64:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L65:
	ldr	x3, .LC56
	mov	w4, 319
	ldr	x2, .LC57
	mov	w1, w4
	add	x3, x3, 232
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L64
	.size	CASE_GetStreamSize, .-CASE_GetStreamSize
	.align	3
.LC56:
	.xword	.LANCHOR0
	.align	3
.LC57:
	.xword	.LC3
	.align	3
.LC58:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_SetDiscardPicParam
	.type	CASE_SetDiscardPicParam, %function
CASE_SetDiscardPicParam:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L69
	ldr	x20, .LC61
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_SetDiscardPicParam
	mov	w19, w0
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	mov	w0, w19
.L68:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L69:
	ldr	x3, .LC59
	mov	w4, 347
	ldr	x2, .LC60
	mov	w1, w4
	add	x3, x3, 256
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L68
	.size	CASE_SetDiscardPicParam, .-CASE_SetDiscardPicParam
	.align	3
.LC59:
	.xword	.LANCHOR0
	.align	3
.LC60:
	.xword	.LC3
	.align	3
.LC61:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_SetPtsToSeek
	.type	CASE_SetPtsToSeek, %function
CASE_SetPtsToSeek:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w22, w0
	mov	x21, x1
	mov	x0, x30
	bl	_mcount
	cbz	x21, .L74
	ldr	x20, .LC64
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	str	wzr, [x29, 56]
	mov	w2, 1
	add	x1, x29, 48
	mov	w0, w22
	stp	w2, wzr, [x29, 48]
	bl	VCTRL_ResetChanWithOption
	cmp	w0, wzr
	csetm	w19, ne
	cbz	w19, .L75
.L73:
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	mov	w0, w19
.L72:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L75:
	mov	x1, x21
	mov	w0, w22
	bl	VCTRL_SeekPts
	cmp	w0, wzr
	csetm	w19, ne
	b	.L73
.L74:
	ldr	x3, .LC62
	mov	w4, 364
	ldr	x2, .LC63
	mov	w1, w4
	add	x3, x3, 280
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L72
	.size	CASE_SetPtsToSeek, .-CASE_SetPtsToSeek
	.align	3
.LC62:
	.xword	.LANCHOR0
	.align	3
.LC63:
	.xword	.LC3
	.align	3
.LC64:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_SetTrickMode
	.type	CASE_SetTrickMode, %function
CASE_SetTrickMode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L79
	ldr	x20, .LC67
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_ConfigFFFBSpeed
	cmp	w0, wzr
	ldr	x1, [x20, 32]
	mov	w0, 0
	csetm	w19, ne
	blr	x1
.L78:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L79:
	ldr	x3, .LC65
	mov	w4, 390
	ldr	x2, .LC66
	mov	w1, w4
	add	x3, x3, 304
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L78
	.size	CASE_SetTrickMode, .-CASE_SetTrickMode
	.align	3
.LC65:
	.xword	.LANCHOR0
	.align	3
.LC66:
	.xword	.LC3
	.align	3
.LC67:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_SetCtrlInfo
	.type	CASE_SetCtrlInfo, %function
CASE_SetCtrlInfo:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L83
	ldr	x20, .LC70
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_ConfigPVRInfo
	cmp	w0, wzr
	ldr	x1, [x20, 32]
	mov	w0, 0
	csetm	w19, ne
	blr	x1
.L82:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L83:
	ldr	x3, .LC68
	mov	w4, 406
	ldr	x2, .LC69
	mov	w1, w4
	add	x3, x3, 328
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L82
	.size	CASE_SetCtrlInfo, .-CASE_SetCtrlInfo
	.align	3
.LC68:
	.xword	.LANCHOR0
	.align	3
.LC69:
	.xword	.LC3
	.align	3
.LC70:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_GetUserDecFrame
	.type	CASE_GetUserDecFrame, %function
CASE_GetUserDecFrame:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L87
	ldr	x20, .LC73
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_USERDEC_GetFrameBuffer
	cmp	w0, wzr
	ldr	x1, [x20, 32]
	mov	w0, 0
	csetm	w19, ne
	blr	x1
.L86:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L87:
	ldr	x3, .LC71
	mov	w4, 424
	ldr	x2, .LC72
	mov	w1, w4
	add	x3, x3, 352
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L86
	.size	CASE_GetUserDecFrame, .-CASE_GetUserDecFrame
	.align	3
.LC71:
	.xword	.LANCHOR0
	.align	3
.LC72:
	.xword	.LC3
	.align	3
.LC73:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_PutUserDecFrame
	.type	CASE_PutUserDecFrame, %function
CASE_PutUserDecFrame:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L91
	ldr	x20, .LC76
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_USERDEC_PutFrameBuffer
	cmp	w0, wzr
	ldr	x1, [x20, 32]
	mov	w0, 0
	csetm	w19, ne
	blr	x1
.L90:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L91:
	ldr	x3, .LC74
	mov	w4, 440
	ldr	x2, .LC75
	mov	w1, w4
	add	x3, x3, 376
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L90
	.size	CASE_PutUserDecFrame, .-CASE_PutUserDecFrame
	.align	3
.LC74:
	.xword	.LANCHOR0
	.align	3
.LC75:
	.xword	.LC3
	.align	3
.LC76:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_ResmueProcess
	.type	CASE_ResmueProcess, %function
CASE_ResmueProcess:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.size	CASE_ResmueProcess, .-CASE_ResmueProcess
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_HandleEntry
	.type	CASE_HandleEntry, %function
CASE_HandleEntry:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w20, w1
	mov	x19, x2
	bl	_mcount
	cmp	w20, 5
	beq	.L105
	ldr	x2, .LC78
	mov	w6, 1
	mov	w7, 0
	add	x2, x2, 400
	b	.L95
	.p2align 3
.L116:
	add	x0, x2, x0, lsl 3
	uxtw	x8, w6
	cmp	w20, w7
	lsl	x5, x8, 2
	sub	x5, x5, x8
	ldr	x7, [x0, 8]
	lsl	x5, x5, 3
	cbz	x7, .L96
	beq	.L97
	ldr	w7, [x2, x5]
.L95:
	uxtw	x5, w6
	cmp	w7, 41
	lsl	x0, x5, 2
	add	w6, w6, 1
	sub	x0, x0, x5
	bne	.L116
.L96:
	cmp	w20, 11
	mov	x7, 0
	ccmp	w20, 1, 0, ne
	cset	w0, hi
	cbz	w0, .L104
.L94:
	cmp	w21, 3
	bhi	.L118
	ldr	x0, .LC81
	ldr	x0, [x0, w21, sxtw 3]
	cbz	x0, .L101
	ldr	w0, [x0, 4]
	cmp	w21, w0
	bne	.L101
	cbz	x7, .L104
.L103:
	mov	x1, x19
	mov	w0, w21
	blr	x7
.L117:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L97:
	cmp	w20, 1
	ccmp	w20, 11, 4, hi
	beq	.L103
	b	.L94
	.p2align 3
.L118:
	ldr	x2, .LC80
	mov	w4, w20
	mov	w3, w21
	mov	w1, 639
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L117
.L105:
	ldr	x7, .LC77
	b	.L94
.L101:
	ldr	x2, .LC80
	mov	w4, w20
	mov	w3, w21
	mov	w1, 645
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L117
.L104:
	ldr	x2, .LC83
	mov	w3, w20
	mov	w1, 652
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L117
	.size	CASE_HandleEntry, .-CASE_HandleEntry
	.align	3
.LC77:
	.xword	CASE_GetChanState
	.align	3
.LC78:
	.xword	.LANCHOR0
	.align	3
.LC80:
	.xword	.LC79
	.align	3
.LC81:
	.xword	s_pstVfmwChan
	.align	3
.LC83:
	.xword	.LC82
	.global	VDEC_CID_HandlerTable
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.9829, %object
	.size	__func__.9829, 20
__func__.9829:
	.string	"CASE_GetChanMemSize"
	.zero	4
	.type	__func__.9815, %object
	.size	__func__.9815, 19
__func__.9815:
	.string	"CASE_GetCapability"
	.zero	5
	.type	__func__.9820, %object
	.size	__func__.9820, 21
__func__.9820:
	.string	"CASE_GetOutputFormat"
	.zero	3
	.type	__func__.9837, %object
	.size	__func__.9837, 16
__func__.9837:
	.string	"CASE_CreateChan"
	.type	__func__.9853, %object
	.size	__func__.9853, 25
__func__.9853:
	.string	"CASE_ResetChanWithOption"
	.zero	7
	.type	__func__.9870, %object
	.size	__func__.9870, 19
__func__.9870:
	.string	"CASE_GetChanConfig"
	.zero	5
	.type	__func__.9876, %object
	.size	__func__.9876, 16
__func__.9876:
	.string	"CASE_ConfigChan"
	.type	__func__.9891, %object
	.size	__func__.9891, 19
__func__.9891:
	.string	"CASE_SetStreamIntf"
	.zero	5
	.type	__func__.9897, %object
	.size	__func__.9897, 24
__func__.9897:
	.string	"CASE_SetDeiMemQueryIntf"
	.type	__func__.9903, %object
	.size	__func__.9903, 20
__func__.9903:
	.string	"CASE_GetChanMemInfo"
	.zero	4
	.type	__func__.9909, %object
	.size	__func__.9909, 19
__func__.9909:
	.string	"CASE_GetStreamSize"
	.zero	5
	.type	__func__.9919, %object
	.size	__func__.9919, 24
__func__.9919:
	.string	"CASE_SetDiscardPicParam"
	.type	__func__.9927, %object
	.size	__func__.9927, 18
__func__.9927:
	.string	"CASE_SetPtsToSeek"
	.zero	6
	.type	__func__.9933, %object
	.size	__func__.9933, 18
__func__.9933:
	.string	"CASE_SetTrickMode"
	.zero	6
	.type	__func__.9939, %object
	.size	__func__.9939, 17
__func__.9939:
	.string	"CASE_SetCtrlInfo"
	.zero	7
	.type	__func__.9945, %object
	.size	__func__.9945, 21
__func__.9945:
	.string	"CASE_GetUserDecFrame"
	.zero	3
	.type	__func__.9951, %object
	.size	__func__.9951, 21
__func__.9951:
	.string	"CASE_PutUserDecFrame"
	.zero	3
	.type	VDEC_CID_HandlerTable, %object
	.size	VDEC_CID_HandlerTable, 792
VDEC_CID_HandlerTable:
	.word	5
	.zero	4
	.xword	CASE_GetChanState
	.word	100
	.zero	4
	.word	0
	.zero	4
	.xword	CASE_GetCapability
	.word	148
	.zero	4
	.word	29
	.zero	4
	.xword	CASE_GetOutputFormat
	.word	16
	.zero	4
	.word	11
	.zero	4
	.xword	CASE_GetChanMemSize
	.word	128
	.zero	4
	.word	1
	.zero	4
	.xword	CASE_CreateChan
	.word	128
	.zero	4
	.word	2
	.zero	4
	.xword	CASE_DestroyChan
	.word	0
	.zero	4
	.word	8
	.zero	4
	.xword	CASE_ResetChan
	.word	0
	.zero	4
	.word	13
	.zero	4
	.xword	CASE_ResetChanWithOption
	.word	12
	.zero	4
	.word	3
	.zero	4
	.xword	CASE_GetChanConfig
	.word	156
	.zero	4
	.word	6
	.zero	4
	.xword	CASE_StartChan
	.word	0
	.zero	4
	.word	7
	.zero	4
	.xword	CASE_StopChan
	.word	0
	.zero	4
	.word	4
	.zero	4
	.xword	CASE_ConfigChan
	.word	156
	.zero	4
	.word	12
	.zero	4
	.xword	CASE_ReleaseStream
	.word	0
	.zero	4
	.word	9
	.zero	4
	.xword	CASE_SetStreamIntf
	.word	24
	.zero	4
	.word	10
	.zero	4
	.xword	CASE_GetStreamSize
	.word	4
	.zero	4
	.word	18
	.zero	4
	.xword	CASE_ExtraWakupThread
	.word	0
	.zero	4
	.word	17
	.zero	4
	.xword	CASE_SetDiscardPicParam
	.word	8
	.zero	4
	.word	21
	.zero	4
	.xword	CASE_SetPtsToSeek
	.word	24
	.zero	4
	.word	22
	.zero	4
	.xword	CASE_SetTrickMode
	.word	4
	.zero	4
	.word	23
	.zero	4
	.xword	CASE_SetCtrlInfo
	.word	24
	.zero	4
	.word	30
	.zero	4
	.xword	CASE_ReportDemuxRelease
	.word	0
	.zero	4
	.word	15
	.zero	4
	.xword	CASE_GetUserDecFrame
	.word	56
	.zero	4
	.word	16
	.zero	4
	.xword	CASE_PutUserDecFrame
	.word	56
	.zero	4
	.word	33
	.zero	4
	.xword	CASE_BindRequireMem
	.word	152
	.zero	4
	.word	34
	.zero	4
	.xword	CASE_SetFrameBufferMode
	.word	4
	.zero	4
	.word	35
	.zero	4
	.xword	CASE_BindExternBuffer
	.word	312
	.zero	4
	.word	36
	.zero	4
	.xword	CASE_UnBindExternBuffer
	.word	312
	.zero	4
	.word	28
	.zero	4
	.xword	CASE_SetFrameBufferNum
	.word	4
	.zero	4
	.word	37
	.zero	4
	.xword	CASE_ResmueProcess
	.word	0
	.zero	4
	.word	38
	.zero	4
	.xword	CASE_PauseProcess
	.word	0
	.zero	4
	.word	39
	.zero	4
	.xword	CASE_SetDeiMemQueryIntf
	.word	16
	.zero	4
	.word	40
	.zero	4
	.xword	CASE_GetChanMemInfo
	.word	28
	.zero	4
	.word	41
	.zero	4
	.xword	0
	.word	0
	.zero	4
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	ASCII(.string	"Not care param %d\n" )
	.zero	5
.LC3:
	ASCII(.string	"invalid condition: %s %d\n" )
	.zero	6
.LC6:
	ASCII(.string	"call VCTRL_GetChanMemSize failed ret:%d\n" )
	.zero	7
.LC8:
	ASCII(.string	"Not care param %p\n" )
	.zero	5
.LC19:
	ASCII(.string	"Not care param %d %p\n" )
	.zero	2
.LC79:
	ASCII(.string	"Chan id: %d is invalid, Cmd ID:%d\n" )
	.zero	5
.LC82:
	ASCII(.string	"Unsupport eCmdID %d\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
