#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"product.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	VDM_SetClockSkip
	.type	VDM_SetClockSkip, %function
VDM_SetClockSkip:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	VDM_SetClockSkip, .-VDM_SetClockSkip
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BPD_CloseHardware
	.type	BPD_CloseHardware, %function
BPD_CloseHardware:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	BPD_CloseHardware, .-BPD_CloseHardware
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BPD_OpenHardware
	.type	BPD_OpenHardware, %function
BPD_OpenHardware:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	BPD_OpenHardware, .-BPD_OpenHardware
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDM_OpenHardware
	.type	VDM_OpenHardware, %function
VDM_OpenHardware:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	VDM_OpenHardware, .-VDM_OpenHardware
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDM_CloseHardware
	.type	VDM_CloseHardware, %function
VDM_CloseHardware:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	VDM_CloseHardware, .-VDM_CloseHardware
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DSP_OpenHardware
	.type	DSP_OpenHardware, %function
DSP_OpenHardware:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	DSP_OpenHardware, .-DSP_OpenHardware
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DSP_CloseHardware
	.type	DSP_CloseHardware, %function
DSP_CloseHardware:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	DSP_CloseHardware, .-DSP_CloseHardware
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCD_OpenHardware
	.type	SCD_OpenHardware, %function
SCD_OpenHardware:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	SCD_OpenHardware, .-SCD_OpenHardware
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCD_CloseHardware
	.type	SCD_CloseHardware, %function
SCD_CloseHardware:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	SCD_CloseHardware, .-SCD_CloseHardware
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PDT_InitHalInterface
	.type	PDT_InitHalInterface, %function
PDT_InitHalInterface:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC0
	mov	x2, 336
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x6, .LC1
	ldr	x5, .LC2
	ldr	x4, .LC3
	ldr	x3, .LC4
	ldr	x2, .LC5
	ldr	x1, .LC6
	ldr	x8, .LC7
	ldr	x0, .LC8
	stp	x6, x5, [x19]
	stp	x4, x3, [x19, 16]
	stp	x2, x1, [x19, 32]
	stp	x8, x0, [x19, 48]
	ldr	x7, .LC9
	ldr	x5, .LC11
	ldr	x4, .LC12
	ldr	x3, .LC13
	ldr	x2, .LC14
	ldr	x1, .LC15
	ldr	x0, .LC16
	ldr	x6, .LC10
	stp	x4, x3, [x19, 104]
	stp	x1, x0, [x19, 120]
	str	x7, [x19, 64]
	stp	x6, x5, [x19, 88]
	str	x2, [x19, 136]
	ldr	x6, .LC17
	ldr	x5, .LC18
	ldr	x4, .LC19
	ldr	x3, .LC20
	ldr	x2, .LC21
	ldr	x1, .LC22
	ldr	x8, .LC23
	ldr	x0, .LC24
	stp	x6, x5, [x19, 144]
	stp	x4, x3, [x19, 160]
	stp	x2, x1, [x19, 176]
	stp	x8, x0, [x19, 192]
	ldr	x7, .LC25
	ldr	x5, .LC27
	ldr	x4, .LC28
	ldr	x3, .LC29
	ldr	x2, .LC30
	ldr	x1, .LC31
	ldr	x0, .LC32
	ldr	x6, .LC26
	stp	x4, x3, [x19, 232]
	stp	x2, x1, [x19, 248]
	str	x7, [x19, 208]
	stp	x6, x5, [x19, 216]
	str	x0, [x19, 264]
	ldr	x6, .LC33
	ldr	x5, .LC34
	ldr	x4, .LC35
	ldr	x3, .LC36
	ldr	x2, .LC37
	ldr	x1, .LC38
	ldr	x0, .LC39
	stp	x6, x5, [x19, 272]
	stp	x4, x3, [x19, 296]
	stp	x2, x1, [x19, 312]
	str	x0, [x19, 328]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	PDT_InitHalInterface, .-PDT_InitHalInterface
	.align	3
.LC0:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1:
	.xword	VDM_SetClockSkip
	.align	3
.LC2:
	.xword	VDM_OpenHardware
	.align	3
.LC3:
	.xword	VDM_CloseHardware
	.align	3
.LC4:
	.xword	DSP_OpenHardware
	.align	3
.LC5:
	.xword	DSP_CloseHardware
	.align	3
.LC6:
	.xword	SCD_OpenHardware
	.align	3
.LC7:
	.xword	SCD_CloseHardware
	.align	3
.LC8:
	.xword	BPD_OpenHardware
	.align	3
.LC9:
	.xword	BPD_CloseHardware
	.align	3
.LC10:
	.xword	VDMHAL_GetHalMemSize
	.align	3
.LC11:
	.xword	VDMHAL_OpenHAL
	.align	3
.LC12:
	.xword	VDMHAL_CloseHAL
	.align	3
.LC13:
	.xword	VDMHAL_InquireMemNeed
	.align	3
.LC14:
	.xword	VDMHAL_ResetVdm
	.align	3
.LC15:
	.xword	VDMHAL_SetSmmuPageTableAddr
	.align	3
.LC16:
	.xword	VDMHAL_EnableSmmu
	.align	3
.LC17:
	.xword	VDMHAL_GlbReset
	.align	3
.LC18:
	.xword	VDMHAL_GlbResetX
	.align	3
.LC19:
	.xword	VDMHAL_ClearIntState
	.align	3
.LC20:
	.xword	VDMHAL_ClearMMUIntState
	.align	3
.LC21:
	.xword	VDMHAL_MaskInt
	.align	3
.LC22:
	.xword	VDMHAL_EnableInt
	.align	3
.LC23:
	.xword	VDMHAL_CheckReg
	.align	3
.LC24:
	.xword	VDMHAL_ReadMMUMask
	.align	3
.LC25:
	.xword	VDMHAL_WriteMMUMask
	.align	3
.LC26:
	.xword	VDMHAL_StartHwRepair
	.align	3
.LC27:
	.xword	VDMHAL_StartHwDecode
	.align	3
.LC28:
	.xword	VDMHAL_PrepareDec
	.align	3
.LC29:
	.xword	VDMHAL_IsVdmReady
	.align	3
.LC30:
	.xword	VDMHAL_IsVdmRun
	.align	3
.LC31:
	.xword	VDMHAL_PrepareRepair
	.align	3
.LC32:
	.xword	VDMHAL_GetUvMOSParam
	.align	3
.LC33:
	.xword	VDMHAL_MakeDecReport
	.align	3
.LC34:
	.xword	VDMHAL_UpdateHardwareInfo
	.align	3
.LC35:
	.xword	VDMHAL_IsVdhDecOver
	.align	3
.LC36:
	.xword	VDMHAL_IsVdhPartDecOver
	.align	3
.LC37:
	.xword	VDMHAL_GetRepairRequire
	.align	3
.LC38:
	.xword	VDMHAL_DumpYuv
	.align	3
.LC39:
	.xword	VDMHAL_DeriveMemSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PDT_GetAttribute
	.type	PDT_GetAttribute, %function
PDT_GetAttribute:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 2
	beq	.L16
	cmp	w20, 3
	beq	.L14
	cbz	w20, .L19
	ldr	x3, .LC41
	mov	w4, w20
	ldr	x2, .LC43
	mov	w1, 248
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L19:
	ldr	x3, .LC40
	mov	x2, 148
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	mov	w7, 4
	mov	w6, 50
	mov	w5, 4096
	mov	w4, 2304
	stp	w7, w6, [x19]
	stp	w5, w4, [x19, 8]
	mov	w3, 424673280
	mov	w2, 3
	stp	w3, wzr, [x19, 16]
	mov	w1, 2
	mov	w0, 22
	stp	w2, w1, [x19, 24]
	str	w0, [x19, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L14:
	ldr	w0, [x19]
	ldp	x19, x20, [sp, 16]
	sub	w1, w0, #19
	cmp	w1, 1
	ccmp	w0, 7, 4, hi
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L16:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	PDT_GetAttribute, .-PDT_GetAttribute
	.align	3
.LC40:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC41:
	.xword	.LANCHOR0
	.align	3
.LC43:
	.xword	.LC42
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PDT_Init
	.type	PDT_Init, %function
PDT_Init:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	PDT_InitHalInterface
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	PDT_Init, .-PDT_Init
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PDT_Deinit
	.type	PDT_Deinit, %function
PDT_Deinit:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.size	PDT_Deinit, .-PDT_Deinit
	.global	g_ChipMaxHeight
	.global	g_ChipMaxWidth
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.10085, %object
	.size	__func__.10085, 17
__func__.10085:
	.string	"PDT_GetAttribute"
	.data
	.align	2
	.type	g_ChipMaxHeight, %object
	.size	g_ChipMaxHeight, 4
g_ChipMaxHeight:
	.word	4096
	.type	g_ChipMaxWidth, %object
	.size	g_ChipMaxWidth, 4
g_ChipMaxWidth:
	.word	4096
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC42:
	ASCII(.string	"%s unkown eAttrID %d\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
