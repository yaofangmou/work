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
	.file	"product.c"
	.text
	.align	2
	.global	VDM_SetClockSkip
	.type	VDM_SetClockSkip, %function
VDM_SetClockSkip:
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
	.size	VDM_SetClockSkip, .-VDM_SetClockSkip
	.align	2
	.global	VDM_OpenHardware
	.type	VDM_OpenHardware, %function
VDM_OpenHardware:
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
	.size	VDM_OpenHardware, .-VDM_OpenHardware
	.align	2
	.global	VDM_CloseHardware
	.type	VDM_CloseHardware, %function
VDM_CloseHardware:
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
	.size	VDM_CloseHardware, .-VDM_CloseHardware
	.align	2
	.global	DSP_OpenHardware
	.type	DSP_OpenHardware, %function
DSP_OpenHardware:
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
	.size	DSP_OpenHardware, .-DSP_OpenHardware
	.align	2
	.global	DSP_CloseHardware
	.type	DSP_CloseHardware, %function
DSP_CloseHardware:
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
	.size	DSP_CloseHardware, .-DSP_CloseHardware
	.align	2
	.global	SCD_OpenHardware
	.type	SCD_OpenHardware, %function
SCD_OpenHardware:
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
	.size	SCD_OpenHardware, .-SCD_OpenHardware
	.align	2
	.global	SCD_CloseHardware
	.type	SCD_CloseHardware, %function
SCD_CloseHardware:
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
	.size	SCD_CloseHardware, .-SCD_CloseHardware
	.align	2
	.global	BPD_OpenHardware
	.type	BPD_OpenHardware, %function
BPD_OpenHardware:
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
	.size	BPD_OpenHardware, .-BPD_OpenHardware
	.align	2
	.global	BPD_CloseHardware
	.type	BPD_CloseHardware, %function
BPD_CloseHardware:
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
	.size	BPD_CloseHardware, .-BPD_CloseHardware
	.align	2
	.global	PDT_InitHalInterface
	.type	PDT_InitHalInterface, %function
PDT_InitHalInterface:
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
	ldr	r3, .L11
	mov	r2, #168
	mov	r1, #0
	mov	r4, r0
	ldr	r5, .L11+4
	ldr	r3, [r3, #48]
	blx	r3
	ldr	lr, .L11+8
	ldr	ip, .L11+12
	ldr	r0, .L11+16
	ldr	r1, .L11+20
	ldr	r2, .L11+24
	ldr	r3, .L11+28
	ldr	r6, .L11+32
	str	r5, [r4]
	str	lr, [r4, #4]
	ldr	r5, .L11+36
	ldr	lr, .L11+40
	str	ip, [r4, #8]
	str	r0, [r4, #12]
	ldr	ip, .L11+44
	ldr	r0, .L11+48
	str	r1, [r4, #16]
	str	r2, [r4, #20]
	ldr	r1, .L11+52
	ldr	r2, .L11+56
	str	r3, [r4, #24]
	ldr	r3, .L11+60
	str	r6, [r4, #28]
	str	r5, [r4, #32]
	ldr	r6, .L11+64
	ldr	r5, .L11+68
	str	lr, [r4, #44]
	str	ip, [r4, #48]
	ldr	lr, .L11+72
	ldr	ip, .L11+76
	str	r0, [r4, #52]
	str	r1, [r4, #56]
	ldr	r0, .L11+80
	ldr	r1, .L11+84
	str	r2, [r4, #68]
	str	r3, [r4, #60]
	ldr	r2, .L11+88
	ldr	r3, .L11+92
	str	r6, [r4, #64]
	str	r5, [r4, #72]
	ldr	r6, .L11+96
	ldr	r5, .L11+100
	str	lr, [r4, #76]
	str	ip, [r4, #80]
	ldr	lr, .L11+104
	ldr	ip, .L11+108
	str	r0, [r4, #84]
	str	r1, [r4, #88]
	ldr	r0, .L11+112
	ldr	r1, .L11+116
	str	r2, [r4, #92]
	str	r3, [r4, #96]
	ldr	r2, .L11+120
	ldr	r3, .L11+124
	str	r6, [r4, #100]
	str	r5, [r4, #104]
	str	lr, [r4, #108]
	str	ip, [r4, #112]
	str	r0, [r4, #116]
	str	r1, [r4, #120]
	str	r2, [r4, #124]
	str	r3, [r4, #128]
	ldr	r6, .L11+128
	ldr	r5, .L11+132
	ldr	lr, .L11+136
	ldr	ip, .L11+140
	ldr	r0, .L11+144
	ldr	r1, .L11+148
	ldr	r2, .L11+152
	ldr	r3, .L11+156
	str	r6, [r4, #132]
	str	r5, [r4, #136]
	str	lr, [r4, #140]
	str	ip, [r4, #148]
	str	r0, [r4, #152]
	str	r1, [r4, #156]
	str	r2, [r4, #160]
	str	r3, [r4, #164]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	vfmw_Osal_Func_Ptr_S
	.word	VDM_SetClockSkip
	.word	VDM_OpenHardware
	.word	VDM_CloseHardware
	.word	DSP_OpenHardware
	.word	DSP_CloseHardware
	.word	SCD_OpenHardware
	.word	SCD_CloseHardware
	.word	BPD_OpenHardware
	.word	BPD_CloseHardware
	.word	VDMHAL_GetHalMemSize
	.word	VDMHAL_OpenHAL
	.word	VDMHAL_CloseHAL
	.word	VDMHAL_InquireMemNeed
	.word	VDMHAL_ResetVdm
	.word	VDMHAL_SetSmmuPageTableAddr
	.word	VDMHAL_EnableSmmu
	.word	VDMHAL_GlbReset
	.word	VDMHAL_GlbResetX
	.word	VDMHAL_ClearIntState
	.word	VDMHAL_ClearMMUIntState
	.word	VDMHAL_MaskInt
	.word	VDMHAL_EnableInt
	.word	VDMHAL_CheckReg
	.word	VDMHAL_ReadMMUMask
	.word	VDMHAL_WriteMMUMask
	.word	VDMHAL_StartHwRepair
	.word	VDMHAL_StartHwDecode
	.word	VDMHAL_PrepareDec
	.word	VDMHAL_IsVdmReady
	.word	VDMHAL_IsVdmRun
	.word	VDMHAL_PrepareRepair
	.word	VDMHAL_GetUvMOSParam
	.word	VDMHAL_MakeDecReport
	.word	VDMHAL_UpdateHardwareInfo
	.word	VDMHAL_IsVdhDecOver
	.word	VDMHAL_IsVdhPartDecOver
	.word	VDMHAL_GetRepairRequire
	.word	VDMHAL_DumpYuv
	.word	VDMHAL_DeriveMemSize
	UNWIND(.fnend)
	.size	PDT_InitHalInterface, .-PDT_InitHalInterface
	.align	2
	.global	PDT_GetAttribute
	.type	PDT_GetAttribute, %function
PDT_GetAttribute:
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
	cmp	r0, #2
	mov	r4, r0
	mov	r5, r1
	moveq	r0, #0
	beq	.L15
	cmp	r4, #3
	beq	.L16
	cmp	r4, #0
	beq	.L21
	str	r4, [sp]
	mov	r1, #248
	ldr	r3, .L22
	mov	r0, #1
	ldr	r2, .L22+4
	bl	dprint_normal
	mvn	r0, #0
.L15:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L21:
	ldr	r3, .L22+8
	mov	r2, #148
	mov	r1, r4
	mov	r0, r5
	ldr	r3, [r3, #48]
	blx	r3
	mov	r3, #0
	mov	r0, r4
	movt	r3, 6480
	mov	r2, #4
	str	r3, [r5, #16]
	str	r2, [r5]
	mov	r3, #50
	mov	r2, #4096
	str	r3, [r5, #4]
	str	r2, [r5, #8]
	mov	r3, #2304
	mov	r2, #3
	str	r3, [r5, #12]
	str	r2, [r5, #24]
	mov	r3, #2
	mov	r2, #16
	str	r3, [r5, #28]
	str	r4, [r5, #20]
	mov	r3, #22
	str	r2, [r5, #32]
	str	r3, [r5, #36]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L16:
	ldr	r0, [r1]
	sub	r3, r0, #19
	cmp	r0, #7
	cmpne	r3, #1
	movls	r0, #1
	movhi	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L23:
	.align	2
.L22:
	.word	.LANCHOR0
	.word	.LC0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	PDT_GetAttribute, .-PDT_GetAttribute
	.align	2
	.global	PDT_Init
	.type	PDT_Init, %function
PDT_Init:
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
	bl	PDT_InitHalInterface
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	PDT_Init, .-PDT_Init
	.align	2
	.global	PDT_Deinit
	.type	PDT_Deinit, %function
PDT_Deinit:
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
	.size	PDT_Deinit, .-PDT_Deinit
	.global	g_ChipMaxHeight
	.global	g_ChipMaxWidth
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.14030, %object
	.size	__func__.14030, 17
__func__.14030:
	.ascii	"PDT_GetAttribute\000"
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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"%s unkown eAttrID %d\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
