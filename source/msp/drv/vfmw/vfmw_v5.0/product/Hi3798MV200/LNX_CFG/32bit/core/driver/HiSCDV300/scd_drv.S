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
	.file	"scd_drv.c"
	.text
	.align	2
	.type	SCDDRV_SetStateIdle.part.0, %function
SCDDRV_SetStateIdle.part.0:
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
	ldr	r2, .L2
	mov	r3, r0, asl #6
	ldr	ip, .L2+4
	sub	r3, r3, r0, asl #2
	add	r3, r2, r3
	mov	r1, #0
	mov	r0, #1
	ldr	r2, [ip, #128]
	str	r1, [r3, #48]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r2
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SCDDRV_SetStateIdle.part.0, .-SCDDRV_SetStateIdle.part.0
	.align	2
	.type	GetFreeSegBufSize.part.7, %function
GetFreeSegBufSize.part.7:
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
	add	r0, r0, #327680
	mov	r3, #0
	str	r3, [r1]
	ldr	r3, [r0, #36]
	ldr	r2, [r0, #32]
	cmp	r3, r2
	bls	.L5
	ldr	r0, [r0, #28]
	sub	r2, r2, #1
	add	r2, r2, r0
	rsb	r3, r3, r2
.L6:
	cmp	r3, r0
	strle	r3, [r1]
	ldmfd	sp, {fp, sp, pc}
.L5:
	ldrcs	r0, [r0, #28]
	subcc	r2, r2, #1
	ldrcc	r0, [r0, #28]
	rsbcc	r3, r3, r2
	subcs	r3, r0, #1
	b	.L6
	UNWIND(.fnend)
	.size	GetFreeSegBufSize.part.7, .-GetFreeSegBufSize.part.7
	.align	2
	.global	SCDDRV_CfgDspMem
	.type	SCDDRV_CfgDspMem, %function
SCDDRV_CfgDspMem:
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
	add	r0, r0, #127
	ldr	r4, .L11
	bic	r3, r0, #127
	mov	r0, r3
	str	r3, [r4, #60]
	bl	MEM_Phy2Vir
	movw	r3, #18048
	str	r3, [r4, #68]
	str	r0, [r4, #64]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_CfgDspMem, .-SCDDRV_CfgDspMem
	.align	2
	.global	SCDDRV_LoadDspCode
	.type	SCDDRV_LoadDspCode, %function
SCDDRV_LoadDspCode:
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
	mov	r7, r1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r5, .L33
	ldr	r0, [r5, #60]
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L28
	cmp	r7, #1
	beq	.L29
	cmp	r7, #2
	beq	.L30
	mov	r0, r4
	ldr	r1, .L33+4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L30:
	ldr	r6, .L33+8
	mov	r2, #17920
	ldr	r1, .L33+12
	ldr	r3, [r6, #52]
	blx	r3
	mov	r1, r4
	ldr	r0, [r5, #72]
	bl	MEM_WritePhyWord
.L18:
	ldr	r0, [r5, #72]
	mov	r1, #4480
	mov	r4, #0
	add	r0, r0, #264
	bl	MEM_WritePhyWord
	ldr	r0, [r5, #72]
	ldr	r1, [r5, #60]
	add	r0, r0, #268
	bl	MEM_WritePhyWord
	ldr	r0, [r5, #72]
	mov	r1, r4
	add	r0, r0, #256
	bl	MEM_WritePhyWord
	ldr	r0, [r5, #72]
	mov	r1, #5
	add	r0, r0, #256
	bl	MEM_WritePhyWord
	b	.L21
.L31:
	add	r4, r4, #1
	cmp	r4, #1000
	beq	.L22
.L21:
	ldr	r3, [r6, #116]
	mov	r0, #30
	blx	r3
	ldr	r0, [r5, #72]
	add	r0, r0, #260
	bl	MEM_ReadPhyWord
	tst	r0, #1
	beq	.L31
	cmp	r4, #1000
	bcs	.L22
	ldr	r2, .L33+16
	mov	r0, #0
	ldr	r1, .L33+20
	bl	dprint_vfmw
.L24:
	cmp	r7, #1
	beq	.L32
	cmp	r7, #2
	ldreq	r3, .L33+24
	moveq	r2, #1
	streq	r2, [r3]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L22:
	ldr	r2, .L33+16
	mov	r0, #0
	ldr	r1, .L33+28
	bl	dprint_vfmw
	b	.L24
.L29:
	ldr	r6, .L33+8
	mov	r2, #17920
	ldr	r1, .L33+32
	ldr	r3, [r6, #52]
	blx	r3
	mov	r1, r7
	ldr	r0, [r5, #72]
	bl	MEM_WritePhyWord
	b	.L18
.L32:
	ldr	r3, .L33+24
	mov	r2, #2
	str	r2, [r3]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L28:
	ldr	r2, [r5, #60]
	ldr	r1, .L33+36
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.word	.LC3
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+1552
	.word	.LANCHOR3
	.word	.LC5
	.word	g_DspDrvState
	.word	.LC4
	.word	.LANCHOR1
	.word	.LC2
	UNWIND(.fnend)
	.size	SCDDRV_LoadDspCode, .-SCDDRV_LoadDspCode
	.align	2
	.global	GetInstIDByRawArray
	.type	GetInstIDByRawArray, %function
GetInstIDByRawArray:
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
	ldr	ip, .L45
	mov	r3, #0
	b	.L38
.L36:
	add	r3, r3, #1
	cmp	r3, #32
	beq	.L44
.L38:
	ldr	r2, [ip, r3, asl #3]
	cmp	r2, #0
	add	r1, r2, #80
	beq	.L36
	cmp	r0, r1
	bne	.L36
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L44:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L46:
	.align	2
.L45:
	.word	.LANCHOR0+76
	UNWIND(.fnend)
	.size	GetInstIDByRawArray, .-GetInstIDByRawArray
	.align	2
	.global	SCDDRV_SetStateIdle
	.type	SCDDRV_SetStateIdle, %function
SCDDRV_SetStateIdle:
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
	ldmnefd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SCDDRV_SetStateIdle.part.0
	UNWIND(.fnend)
	.size	SCDDRV_SetStateIdle, .-SCDDRV_SetStateIdle
	.align	2
	.global	SCDDRV_SetStateWork
	.type	SCDDRV_SetStateWork, %function
SCDDRV_SetStateWork:
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
	ldreq	r3, .L51
	moveq	r2, #1
	streq	r2, [r3, #48]
	ldmfd	sp, {fp, sp, pc}
.L52:
	.align	2
.L51:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_SetStateWork, .-SCDDRV_SetStateWork
	.align	2
	.global	ResetSCD
	.type	ResetSCD, %function
ResetSCD:
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
	bne	.L60
	ldr	r5, .L68
	mov	r1, #3
	ldr	r6, .L68+4
	ldr	r0, [r5, #72]
	add	r0, r0, #2176
	bl	MEM_WritePhyWord
	ldr	r0, [r5, #72]
	add	r0, r0, #2064
	add	r0, r0, #12
	bl	MEM_ReadPhyWord
	ldr	ip, [r6]
	ldr	r4, [ip, #120]
	ands	r2, r4, #1
	mov	r7, r0
	beq	.L65
	orr	r4, r4, #32
	str	r4, [ip, #120]
	ldr	r3, [ip, #372]
	tst	r3, #2
	bne	.L59
	movw	r2, #9999
	b	.L57
.L67:
	subs	r2, r2, #1
	beq	.L66
.L57:
	ldr	r3, [ip, #372]
	tst	r3, #2
	beq	.L67
.L59:
	ldr	r0, [r5, #72]
	and	r1, r7, #1
	bfc	r4, #5, #1
	str	r4, [ip, #120]
	add	r0, r0, #2064
	add	r0, r0, #12
	bl	MEM_WritePhyWord
	ldr	r0, [r5, #72]
	mov	r1, #2
	add	r0, r0, #2176
	bl	MEM_WritePhyWord
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L65:
	ldr	r1, .L68+8
	mov	r0, #26
	bl	dprint_vfmw
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L66:
	mov	r0, r2
	ldr	r1, .L68+12
	bl	dprint_vfmw
	ldr	ip, [r6]
	b	.L59
.L60:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L69:
	.align	2
.L68:
	.word	.LANCHOR0
	.word	g_pstRegCrg
	.word	.LC6
	.word	.LC7
	UNWIND(.fnend)
	.size	ResetSCD, .-ResetSCD
	.align	2
	.global	SCDDRV_ResetSCD
	.type	SCDDRV_ResetSCD, %function
SCDDRV_ResetSCD:
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
	ldr	r3, .L74
	ldr	r3, [r3, #44]
	cmp	r3, r0
	ldmnefd	sp, {fp, sp, pc}
	ldr	r3, .L74+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L72
	mov	r1, #0
	mov	r0, r1
	bl	VDH_Reset_Module
.L73:
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SCDDRV_SetStateIdle.part.0
.L72:
	mov	r0, #0
	bl	ResetSCD
	b	.L73
.L75:
	.align	2
.L74:
	.word	.LANCHOR0
	.word	g_HalDisable
	UNWIND(.fnend)
	.size	SCDDRV_ResetSCD, .-SCDDRV_ResetSCD
	.align	2
	.global	SCDDRV_IsRawArrayFull
	.type	SCDDRV_IsRawArrayFull, %function
SCDDRV_IsRawArrayFull:
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
	add	r0, r0, #98304
	ldr	r3, [r0, #4]
	ldr	r0, [r0, #8]
	add	r3, r3, #1
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #22
	add	r3, r3, r2
	ubfx	r3, r3, #0, #10
	rsb	r3, r2, r3
	rsb	r0, r0, r3
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_IsRawArrayFull, .-SCDDRV_IsRawArrayFull
	.align	2
	.global	SCDDRV_InsertRawPacket
	.type	SCDDRV_InsertRawPacket, %function
SCDDRV_InsertRawPacket:
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
	ldr	r3, .L81
	ldr	r5, [r1, #4]
	add	r0, r3, r0, lsl #3
	ldr	r2, [r0, #76]
	cmp	r2, #0
	cmpne	r5, #0
	moveq	r5, #1
	movne	r5, #0
	beq	.L79
	add	r4, r2, #98304
	ldr	r0, [r4, #84]
	ldr	lr, [r4, #88]
	add	r3, r0, #1
	mov	ip, r3, asr #31
	mov	ip, ip, lsr #22
	add	r3, r3, ip
	ubfx	r3, r3, #0, #10
	rsb	r3, ip, r3
	cmp	r3, lr
	beq	.L80
	ldr	ip, .L81+4
	mov	r3, r0, asl #7
	add	r2, r2, #80
	sub	r0, r3, r0, asl #5
	add	r0, r2, r0
	mov	r2, #96
	ldr	r3, [ip, #52]
	blx	r3
	ldr	r3, [r4, #84]
	mov	r0, r5
	add	r3, r3, #1
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #22
	add	r3, r3, r2
	ubfx	r3, r3, #0, #10
	rsb	r3, r2, r3
	str	r3, [r4, #84]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L80:
	mvn	r0, #3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L79:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L82:
	.align	2
.L81:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SCDDRV_InsertRawPacket, .-SCDDRV_InsertRawPacket
	.align	2
	.global	GetRawState
	.type	GetRawState, %function
GetRawState:
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
	bhi	.L86
	ldr	r3, .L88
	add	r0, r3, r0, lsl #3
	ldr	r3, [r0, #76]
	cmp	r3, #0
	beq	.L86
	add	r2, r3, #98304
	ldr	r3, [r2, #84]
	ldr	r1, [r2, #88]
	add	r3, r3, #1
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #22
	add	r3, r3, r2
	ubfx	r3, r3, #0, #10
	rsb	r3, r2, r3
	cmp	r3, r1
	mvneq	r0, #3
	movne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L86:
	mvn	r0, #3
	ldmfd	sp, {fp, sp, pc}
.L89:
	.align	2
.L88:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	GetRawState, .-GetRawState
	.align	2
	.global	ShowRawPacket
	.type	ShowRawPacket, %function
ShowRawPacket:
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
	add	r4, r0, #98304
	mov	ip, r0
	ldr	r3, [r4, #16]
	cmp	r3, #1024
	bcs	.L93
	ldr	r2, [r4, #4]
	cmp	r3, r2
	beq	.L93
	ldr	lr, .L94
	mov	r2, r3, asl #7
	sub	r3, r2, r3, asl #5
	mov	r0, r1
	mov	r2, #96
	add	r1, ip, r3
	ldr	r3, [lr, #52]
	blx	r3
	ldr	r3, [r4, #16]
	mov	r0, #0
	add	r3, r3, #1
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #22
	add	r3, r3, r2
	ubfx	r3, r3, #0, #10
	rsb	r3, r2, r3
	str	r3, [r4, #16]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L93:
	mvn	r0, #2
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L95:
	.align	2
.L94:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	ShowRawPacket, .-ShowRawPacket
	.align	2
	.global	GetFirstOffset
	.type	GetFirstOffset, %function
GetFirstOffset:
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
	cmp	r1, #0
	cmpne	r0, #0
	moveq	r2, #1
	movne	r2, #0
	beq	.L98
	add	r3, r0, #98304
	ldr	ip, [r3]
	ldr	r0, [r3, #4]
	cmp	ip, r0
	beq	.L99
	ldr	r3, [r3, #12]
	mov	r0, r2
	str	r3, [r1]
	ldmfd	sp, {fp, sp, pc}
.L98:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L99:
	mvn	r0, #2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetFirstOffset, .-GetFirstOffset
	.align	2
	.global	GetFirstRawPacket
	.type	GetFirstRawPacket, %function
GetFirstRawPacket:
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
	cmp	r0, #0
	mov	r4, r1
	beq	.L104
	add	r3, r0, #98304
	ldr	r2, [r3]
	ldr	r1, [r3, #4]
	cmp	r2, r1
	beq	.L103
	ldr	r5, [r3, #12]
	mov	r7, r5, asr #31
	mov	r6, r5
	mov	r8, r5
.L102:
	str	r2, [r3, #16]
	mov	r1, r4
	bl	ShowRawPacket
	ldrd	r2, [r4, #40]
	ldr	r0, [r4, #4]
	ldr	r1, [r4, #12]
	adds	r6, r6, r2
	adc	r7, r7, r3
	add	r0, r0, r8
	rsb	r3, r5, r1
	str	r0, [r4, #4]
	strd	r6, [r4, #40]
	str	r3, [r4, #12]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L103:
	mov	r8, #0
	mov	r6, #0
	mov	r7, #0
	mov	r5, r8
	b	.L102
.L104:
	mov	r3, #98304
	mov	r6, #0
	mov	r7, #0
	ldr	r2, [r3]
	mov	r8, r0
	mov	r5, r0
	b	.L102
	UNWIND(.fnend)
	.size	GetFirstRawPacket, .-GetFirstRawPacket
	.align	2
	.global	SetFirstOffset
	.type	SetFirstOffset, %function
SetFirstOffset:
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
	beq	.L109
	add	r3, r0, #98304
	ldmia	r3, {r2, ip}
	cmp	r2, ip
	beq	.L108
	mov	ip, r2, asl #7
	ldr	lr, [r3, #12]
	sub	r2, ip, r2, asl #5
	add	r0, r0, r2
	add	r1, r1, lr
	ldr	r2, [r0, #12]
	cmp	r1, r2
	bge	.L109
	str	r1, [r3, #12]
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L109:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L108:
	mvn	r0, #2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SetFirstOffset, .-SetFirstOffset
	.align	2
	.global	DeleteRawPacket
	.type	DeleteRawPacket, %function
DeleteRawPacket:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r8, r0
	mov	r9, r1
	moveq	r3, #1
	movne	r3, #0
	beq	.L126
	ldr	r0, .L138
	b	.L115
.L112:
	add	r3, r3, #1
	cmp	r3, #32
	beq	.L113
.L115:
	ldr	r2, [r0, r3, asl #3]
	mov	r7, r3, asl #3
	cmp	r2, #0
	add	r1, r2, #80
	beq	.L112
	cmp	r8, r1
	bne	.L112
	cmp	r3, #31
	bhi	.L113
	add	r3, r8, #98304
	str	r3, [fp, #-48]
	mov	r2, r3
	ldr	r3, [r3]
	ldr	r2, [r2, #4]
	cmp	r3, r2
	addgt	r2, r2, #1024
	rsb	r2, r3, r2
	cmp	r2, r9
	bcc	.L137
	cmp	r9, #0
	mov	r4, r3
	beq	.L119
	ldr	r10, .L138+4
	mov	r5, #0
.L120:
	mov	r3, r4, asl #7
	ldr	r2, .L138+8
	sub	r3, r3, r4, asl #5
	ldr	r1, .L138+12
	add	r3, r8, r3
	mov	r0, #26
	add	r6, r3, #8
	add	r5, r5, #1
	ldr	ip, [r6, #4]
	add	r4, r4, #1
	ldr	r3, [r3, #4]
	ubfx	r4, r4, #0, #10
	str	ip, [sp]
	bl	dprint_vfmw
	add	r2, r10, r7
	ldr	r1, [r6, #4]
	cmp	r5, r9
	ldr	r2, [r2, #76]
	add	r2, r2, #98304
	ldr	r3, [r2, #100]
	rsb	r3, r1, r3
	bic	r3, r3, r3, asr #31
	str	r3, [r2, #100]
	bne	.L120
	ldr	r2, [fp, #-48]
	ldr	r3, [r2]
	add	r5, r5, r3
	str	r5, [r2]
	cmp	r5, #1024
	bge	.L124
.L125:
	ldr	r3, [fp, #-48]
	mov	r0, #0
	str	r0, [r3, #12]
.L133:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L124:
	ldr	r3, [fp, #-48]
	sub	r5, r5, #1024
	str	r5, [r3]
	b	.L125
.L119:
	ldr	r2, [fp, #-48]
	cmp	r3, #1024
	str	r3, [r2]
	ldrge	r2, [fp, #-48]
	subge	r3, r3, #1024
	strge	r3, [r2]
.L123:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L126:
	mvn	r0, #0
	b	.L133
.L137:
	mov	r3, r9
	ldr	r1, .L138+16
	mov	r0, #26
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L133
.L113:
	movw	r2, #487
	ldr	r1, .L138+20
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L133
.L139:
	.align	2
.L138:
	.word	.LANCHOR0+76
	.word	.LANCHOR0
	.word	.LANCHOR3+20
	.word	.LC10
	.word	.LC9
	.word	.LC8
	UNWIND(.fnend)
	.size	DeleteRawPacket, .-DeleteRawPacket
	.align	2
	.global	GetRawNumOffset
	.type	GetRawNumOffset, %function
GetRawNumOffset:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	clz	ip, r0
	ldr	r9, [fp, #4]
	mov	ip, ip, lsr #5
	orrs	lr, ip, r1, lsr #31
	bne	.L148
	cmp	r3, #0
	cmpne	r2, #0
	moveq	r6, #1
	movne	r6, #0
	cmp	r9, #0
	orreq	r6, r6, #1
	cmp	r6, #0
	bne	.L148
	add	r8, r0, #98304
	cmp	ip, #0
	ldr	r7, [r8]
	ldr	lr, [r8, #12]
	mov	ip, r7, asl #7
	sub	ip, ip, r7, asl #5
	add	ip, r0, ip
	ldr	r5, [ip, #12]
	rsb	r5, lr, r5
	bne	.L142
	ldr	r6, [r8, #4]
	subs	r6, r6, r7
	addmi	r6, r6, #1024
.L142:
	cmp	r1, r5
	add	r6, r7, r6
	mov	ip, r7
	movge	lr, #0
	movlt	lr, #1
	cmp	r6, r7
	orrls	lr, lr, #1
	cmp	lr, #0
	bne	.L143
	mov	r4, r7
.L144:
	add	r4, r4, #1
	mov	ip, r4, asr #31
	mov	lr, ip, lsr #22
	add	ip, r4, lr
	ubfx	ip, ip, #0, #10
	rsb	ip, lr, ip
	mov	lr, ip, asl #7
	sub	lr, lr, ip, asl #5
	add	lr, r0, lr
	ldr	r10, [lr, #12]
	add	r5, r5, r10
	cmp	r1, r5
	movge	lr, #0
	movlt	lr, #1
	cmp	r6, r4
	orrls	lr, lr, #1
	cmp	lr, #0
	beq	.L144
	cmp	r7, r4
	rsbne	r5, r10, r5
	rsbne	r5, r5, r1
	strne	r5, [r3]
	beq	.L143
.L146:
	str	ip, [r9]
	mov	r0, #0
	ldr	r3, [r8]
	rsb	r4, r3, r4
	str	r4, [r2]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L143:
	str	r1, [r3]
	mov	r4, r7
	b	.L146
.L148:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetRawNumOffset, .-GetRawNumOffset
	.align	2
	.global	DeleteRawLen
	.type	DeleteRawLen, %function
DeleteRawLen:
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
	UNWIND(.pad #32)
	sub	sp, sp, #32
	clz	r3, r0
	mov	r5, r0
	mov	r3, r3, lsr #5
	orrs	ip, r3, r1, lsr #31
	bne	.L155
	cmp	r3, #0
	str	ip, [fp, #-40]
	str	ip, [fp, #-36]
	bne	.L155
	add	r4, r0, #98304
	ldr	r3, [r4, #20]
	ldr	ip, [r4, #12]
	rsb	r3, ip, r3
	movs	r6, r3, asr #31
	bne	.L154
	cmp	r1, r3
	bgt	.L155
	sub	r2, fp, #32
	sub	r3, fp, #36
	str	r2, [sp]
	sub	r2, fp, #40
	bl	GetRawNumOffset
	ldr	r0, [r4]
	ldr	ip, [fp, #-40]
	movw	r2, #653
	ldr	lr, [fp, #-36]
	add	r0, ip, r0
	mov	r3, ip
	mov	r1, r0, asr #31
	mov	r1, r1, lsr #22
	add	r0, r0, r1
	ubfx	r0, r0, #0, #10
	rsb	r1, r1, r0
	str	r1, [fp, #-32]
	mov	r0, r1, asl #7
	sub	r1, r0, r1, asl #5
	mov	r0, #26
	add	r1, r5, r1
	ldrb	r7, [r1, #2]	@ zero_extendqisi2
	str	r7, [sp, #12]
	ldr	r1, [r1, #12]
	str	ip, [sp, #4]
	str	lr, [sp]
	str	r1, [sp, #8]
	ldr	r1, .L157
	bl	dprint_vfmw
	ldr	r1, [fp, #-40]
	mov	r0, r5
	bl	DeleteRawPacket
	ldr	r3, [r4]
	ldr	r1, [r4, #4]
	ldr	r2, [fp, #-36]
	cmp	r3, r1
	mvneq	r6, #2
	beq	.L154
	mov	r1, r3, asl #7
	ldr	r0, [r4, #12]
	sub	r3, r1, r3, asl #5
	add	r5, r5, r3
	add	r2, r2, r0
	ldr	r3, [r5, #12]
	cmp	r2, r3
	strlt	r2, [r4, #12]
	bge	.L155
.L154:
	mov	r0, r6
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L155:
	mvn	r6, #0
	mov	r0, r6
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L158:
	.align	2
.L157:
	.word	.LC11
	UNWIND(.fnend)
	.size	DeleteRawLen, .-DeleteRawLen
	.align	2
	.global	DeleteLastSendRaw
	.type	DeleteLastSendRaw, %function
DeleteLastSendRaw:
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
	ldmhifd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L163
	add	r0, r3, r0, lsl #3
	ldr	r0, [r0, #76]
	cmp	r0, #0
	beq	.L162
	add	r4, r0, #425984
	ldr	r1, [r4, #160]
	cmp	r1, #0
	ldmlefd	sp, {r4, r5, fp, sp, pc}
	add	r0, r0, #80
	bl	DeleteRawPacket
	mov	r3, #0
	str	r3, [r4, #160]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L162:
	movw	r2, #670
	ldr	r1, .L163+4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L164:
	.align	2
.L163:
	.word	.LANCHOR0
	.word	.LC12
	UNWIND(.fnend)
	.size	DeleteLastSendRaw, .-DeleteLastSendRaw
	.align	2
	.global	GetRawStreamSize
	.type	GetRawStreamSize, %function
GetRawStreamSize:
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
	cmp	r1, #0
	cmpne	r0, #0
	addne	r0, r0, #98304
	ldrne	r3, [r0, #20]
	strne	r3, [r1]
	ldrne	r0, [r0, #12]
	rsbne	r0, r0, r3
	strne	r0, [r1]
	movne	r0, r0, asr #31
	mvneq	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetRawStreamSize, .-GetRawStreamSize
	.align	2
	.global	GetRawStreamNum
	.type	GetRawStreamNum, %function
GetRawStreamNum:
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
	cmp	r1, #0
	cmpne	r0, #0
	moveq	ip, #1
	movne	ip, #0
	beq	.L171
	add	r2, r0, #98304
	ldmia	r2, {r2, r3}
	subs	r3, r3, r2
	strpl	r3, [r1]
	addmi	r3, r3, #1024
	strmi	r3, [r1]
	movpl	r0, ip
	movmi	r0, ip
	ldmfd	sp, {fp, sp, pc}
.L171:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetRawStreamNum, .-GetRawStreamNum
	.align	2
	.global	ConfigStreamSegArray
	.type	ConfigStreamSegArray, %function
ConfigStreamSegArray:
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
	subs	r7, r0, #0
	mov	r5, r1
	mov	r6, r2
	mov	r8, r3
	beq	.L175
	cmp	r2, #0
	cmpne	r1, #0
	moveq	r4, #1
	movne	r4, #0
	cmp	r3, #262144
	orrcc	r4, r4, #1
	cmp	r4, #0
	bne	.L175
	ldr	r3, .L176
	mov	r2, #56
	movt	r2, 5
	mov	r1, r4
	ldr	r3, [r3, #48]
	blx	r3
	add	r2, r7, #327680
	mov	r0, r4
	str	r5, [r2, #24]
	str	r6, [r7]
	str	r5, [r2, #32]
	str	r5, [r2, #36]
	str	r8, [r2, #28]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L175:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L177:
	.align	2
.L176:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	ConfigStreamSegArray, .-ConfigStreamSegArray
	.align	2
	.global	ResetStreamSegArray
	.type	ResetStreamSegArray, %function
ResetStreamSegArray:
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
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L183
	mov	r2, #327680
	mov	r1, #0
	add	r0, r4, #8
	ldr	r3, [r3, #48]
	blx	r3
	add	r0, r4, #327680
	mov	r3, #0
	ldr	r2, [r0, #24]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r2, [r0, #32]
	str	r2, [r0, #36]
	str	r3, [r0, #16]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L184:
	.align	2
.L183:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	ResetStreamSegArray, .-ResetStreamSegArray
	.align	2
	.global	GetSegBufFreeSize
	.type	GetSegBufFreeSize, %function
GetSegBufFreeSize:
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
	ldmeqfd	sp, {fp, sp, pc}
	add	r0, r0, #327680
	ldr	r2, [r0, #36]
	ldr	r3, [r0, #32]
	cmp	r2, r3
	bhi	.L190
	ldrcs	r0, [r0, #28]
	subcc	r3, r3, #1
	rsbcc	r0, r2, r3
	subcs	r0, r0, #1
	ldmfd	sp, {fp, sp, pc}
.L190:
	ldr	r0, [r0, #28]
	sub	r3, r3, #1
	add	r3, r3, r0
	rsb	r0, r2, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetSegBufFreeSize, .-GetSegBufFreeSize
	.align	2
	.global	CheckData
	.type	CheckData, %function
CheckData:
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
	ldmeqfd	sp, {fp, sp, pc}
	and	r3, r1, #31
	sub	r2, r3, #30
	sub	ip, r3, #1
	cmp	r3, #19
	cmpne	r2, #1
	movls	r3, #1
	movhi	r3, #0
	cmp	ip, #12
	orrls	r3, r3, #1
	cmp	r3, #0
	addne	r2, r0, #475136
	ldrne	r3, [r2, #1632]
	addne	r3, r3, #1
	strne	r3, [r2, #1632]
	add	r3, r1, #79
	sub	r2, r1, #1
	uxtb	r3, r3
	cmp	r3, #4
	uxtb	r2, r2
	movhi	r3, #0
	movls	r3, #1
	cmp	r2, #183
	orrhi	r3, r3, #1
	cmp	r3, #0
	beq	.L200
.L195:
	add	r0, r0, #475136
	ldr	r3, [r0, #1636]
	add	r3, r3, #1
	str	r3, [r0, #1636]
	ldmfd	sp, {fp, sp, pc}
.L200:
	add	r1, r1, #73
	uxtb	r1, r1
	cmp	r1, #3
	ldmhifd	sp, {fp, sp, pc}
	b	.L195
	UNWIND(.fnend)
	.size	CheckData, .-CheckData
	.align	2
	.global	CheckStartCodeCnt
	.type	CheckStartCodeCnt, %function
CheckStartCodeCnt:
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
	ldmeqfd	sp, {fp, sp, pc}
	add	r0, r0, #475136
	ldr	r3, [r0, #1640]
	cmp	r3, #2
	ldmlefd	sp, {fp, sp, pc}
	tst	r1, #31
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r3, [r0, #1652]
	ldr	r2, [r0, #1648]
	rsb	r1, r2, r3
	cmp	r1, #1
	beq	.L215
.L203:
	cmp	r3, r2
	ldmnefd	sp, {fp, sp, pc}
	ldr	r2, [r0, #1644]
	cmp	r3, r2
	ldmnefd	sp, {fp, sp, pc}
.L204:
	cmp	r3, #1
	cmpne	r3, #20
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r3, [r0, #1632]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r0, #1632]
	ldr	r3, [r0, #1636]
	add	r3, r3, #1
	str	r3, [r0, #1636]
	ldmfd	sp, {fp, sp, pc}
.L215:
	ldr	r1, [r0, #1644]
	rsb	r1, r1, r2
	cmp	r1, #1
	bne	.L203
	b	.L204
	UNWIND(.fnend)
	.size	CheckStartCodeCnt, .-CheckStartCodeCnt
	.align	2
	.type	CheckStream.part.3, %function
CheckStream.part.3:
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
	ldr	r3, .L236
	mov	r6, r1
	ldr	r4, [r3, r1, asl #2]
	cmp	r4, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, [r4, #600]
	cmp	r3, #0
	cmpne	r3, #3
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r5, r4, #475136
	ldr	r3, [r5, #1640]
	cmp	r3, #199
	ldmgtfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r2, [r0]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #0
	movne	r7, r2
	bne	.L220
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L234
	ldrb	r2, [r0, #2]	@ zero_extendqisi2
	cmp	r2, #1
	ldreqb	r7, [r0, #3]	@ zero_extendqisi2
	andeq	r2, r7, #31
	beq	.L220
	mov	r2, r1
.L234:
	mov	r7, r2
.L220:
	ldr	r0, [r5, #1648]
	add	r3, r3, #1
	ldr	ip, [r5, #1652]
	mov	r1, r7
	str	r3, [r5, #1640]
	str	r0, [r5, #1644]
	mov	r0, r4
	str	ip, [r5, #1648]
	str	r2, [r5, #1652]
	bl	CheckData
	mov	r1, r7
	mov	r0, r4
	bl	CheckStartCodeCnt
	ldr	r3, [r5, #1640]
	cmp	r3, #199
	ldmlefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r2, [r5, #1632]
	ldr	r3, [r5, #1636]
	rsb	r1, r3, r2
	cmp	r1, #49
	ble	.L221
	ldr	r1, [r4, #600]
	cmp	r1, #3
	beq	.L235
.L221:
	rsb	r3, r2, r3
	cmp	r3, #49
	ldmlefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, [r4, #600]
	cmp	r3, #0
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r2, .L236+4
	ldr	ip, [r2]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r0, r6
	mov	r2, r3
	mov	r1, #124
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	ip
.L235:
	ldr	r3, .L236+4
	ldr	r7, [r3]
	cmp	r7, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r3, #0
	mov	r1, #124
	mov	r2, r3
	mov	r0, r6
	blx	r7
	ldr	r3, [r5, #1636]
	ldr	r2, [r5, #1632]
	b	.L221
.L237:
	.align	2
.L236:
	.word	s_pstVfmwChan
	.word	g_event_report
	UNWIND(.fnend)
	.size	CheckStream.part.3, .-CheckStream.part.3
	.align	2
	.global	CheckStream
	.type	CheckStream, %function
CheckStream:
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
	ldmeqfd	sp, {fp, sp, pc}
	cmp	r1, #31
	ldmhifd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	CheckStream.part.3
	UNWIND(.fnend)
	.size	CheckStream, .-CheckStream
	.align	2
	.global	InsertStreamSeg
	.type	InsertStreamSeg, %function
InsertStreamSeg:
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
	mov	r6, r0
	mov	r5, r1
	beq	.L247
	add	r4, r0, #327680
	ldr	r7, [r4, #12]
	ldr	r0, [r4, #8]
	add	r3, r7, #1
	mov	r1, r3, asr #31
	mov	r1, r1, lsr #20
	add	r3, r3, r1
	ubfx	r3, r3, #0, #12
	rsb	r3, r1, r3
	cmp	r3, r0
	beq	.L248
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L245
	cmp	r2, #31
	bls	.L255
.L245:
	ldr	ip, .L256
	mov	r3, r7, asl #6
	add	r7, r3, r7, lsl #4
	mov	r2, #80
	add	r0, r7, #8
	mov	r1, r5
	ldr	r3, [ip, #52]
	add	r0, r6, r0
	blx	r3
	ldr	r1, [r4, #12]
	mov	ip, #1
	add	r7, r6, r7
	add	r3, r1, ip
	mov	r0, r1, asl #6
	mov	r2, r3, asr #31
	add	r0, r0, r1, lsl #4
	add	r6, r6, r0
	mov	r2, r2, lsr #20
	add	r3, r3, r2
	strb	ip, [r6, #12]
	ubfx	r3, r3, #0, #12
	str	r1, [r7, #28]
	rsb	r3, r2, r3
	str	r3, [r4, #12]
	ldrsb	r3, [r5, #5]
	cmp	r3, #2
	beq	.L246
	ldr	r1, [r5, #12]
	ldr	r3, [r5, #16]
	ldr	r2, [r4, #40]
	add	r3, r3, r1
	str	r3, [r4, #36]
	ldr	r1, [r5, #16]
	ldr	r3, [r4, #44]
	add	r2, r2, r1
	str	r2, [r4, #40]
	ldr	r2, [r5, #16]
	add	r3, r3, r2
	str	r3, [r4, #44]
.L246:
	ldr	r3, [r4, #48]
	mov	r0, #0
	add	r3, r3, #1
	str	r3, [r4, #48]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L248:
	mvn	r0, #3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L255:
	mov	r1, r2
	bl	CheckStream.part.3
	ldr	r7, [r4, #12]
	b	.L245
.L247:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L257:
	.align	2
.L256:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	InsertStreamSeg, .-InsertStreamSeg
	.align	2
	.global	SCDDRV_GetStreamSeg
	.type	SCDDRV_GetStreamSeg, %function
SCDDRV_GetStreamSeg:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r5, r0
	mov	r0, r1
	beq	.L269
	add	r4, r5, #327680
	ldr	r3, [r4, #8]
	cmp	r3, #0
	blt	.L269
	ldr	r1, [r4, #12]
	cmp	r1, #0
	blt	.L269
	cmp	r3, r1
	beq	.L271
	mov	r6, r3, asl #4
	mov	r7, r3, asl #6
	add	r2, r6, r7
	add	r2, r5, r2
	ldrsb	r2, [r2, #12]
	cmp	r2, #1
	bne	.L262
	b	.L260
.L276:
	add	r2, r5, r2
	ldrsb	r2, [r2, #12]
	cmp	r2, #1
	beq	.L260
.L262:
	add	r2, r3, #1
	mov	r3, r2, asr #31
	mov	r3, r3, lsr #20
	add	r2, r2, r3
	ubfx	r2, r2, #0, #12
	rsb	r3, r3, r2
	cmp	r1, r3
	mov	r6, r3, asl #4
	mov	r7, r3, asl #6
	add	r2, r6, r7
	bne	.L276
.L271:
	mvn	r0, #2
.L259:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L260:
	add	r8, r6, r7
	add	r1, r8, #8
	adds	r1, r5, r1
	beq	.L271
	ldr	r3, .L277
	mov	r2, #80
	add	r6, r6, r7
	add	r6, r5, r6
	ldr	r3, [r3, #52]
	blx	r3
	add	r3, r5, r8
	mov	r0, #2
	ldrsb	r1, [r3, #13]
	strb	r0, [r3, #12]
	cmp	r1, r0
	ldr	r3, [r3, #24]
	ldr	r1, [r4, #44]
	mov	r0, #26
	ldr	r2, [r4, #48]
	rsbne	r1, r3, r1
	sub	r2, r2, #1
	bic	r1, r1, r1, asr #31
	str	r1, [r4, #44]
	bic	r2, r2, r2, asr #31
	str	r2, [r4, #48]
	ldrb	ip, [r6, #14]	@ zero_extendqisi2
	ldr	r2, [r6, #20]
	ldr	r1, .L277+4
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L269:
	mvn	r0, #0
	b	.L259
.L278:
	.align	2
.L277:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC13
	UNWIND(.fnend)
	.size	SCDDRV_GetStreamSeg, .-SCDDRV_GetStreamSeg
	.align	2
	.global	ReleaseStreamSeg
	.type	ReleaseStreamSeg, %function
ReleaseStreamSeg:
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
	subs	r6, r0, #0
	mov	r4, r1
	beq	.L297
	movw	r3, #61438
	sub	r2, r1, #4096
	movt	r3, 65535
	cmp	r2, r3
	bls	.L297
	cmn	r1, #1
	add	r5, r6, #327680
	beq	.L313
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	cmp	r3, r2
	bne	.L308
	b	.L302
.L285:
	add	r3, r3, #1
	ubfx	r3, r3, #0, #12
	cmp	r3, r2
	beq	.L302
.L308:
	cmp	r4, r3
	bne	.L285
	mov	r2, r3, asl #6
	add	r3, r2, r3, lsl #4
	add	r2, r6, r3
	ldrsb	r2, [r2, #12]
	cmp	r2, #2
	addeq	r3, r3, #8
	addeq	r7, r6, r3
	beq	.L282
.L302:
	mvn	r0, #2
.L309:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L313:
	ldr	r7, [r5, #8]
	ldr	r3, [r5, #12]
	cmp	r7, r3
	beq	.L302
	mov	r3, r7, asl #6
	mov	r4, r7
	add	r7, r3, r7, lsl #4
	add	r7, r7, #8
	add	r7, r6, r7
.L282:
	cmp	r7, #0
	beq	.L302
	ldr	r3, [r7, #16]
	mov	r2, #0
	strb	r2, [r7, #4]
	mov	r0, #26
	ldr	r2, [r7, #12]
	str	r4, [sp, #4]
	ldrb	ip, [r7, #6]	@ zero_extendqisi2
	ldr	r1, .L315
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r5, #8]
	cmp	r3, r4
	beq	.L292
.L287:
	ldrsb	r3, [r7, #5]
	cmp	r3, #2
	beq	.L312
.L293:
	ldr	r2, [r7, #16]
	ldr	r3, [r5, #40]
	rsb	r3, r2, r3
.L291:
	bic	r3, r3, r3, asr #31
	mov	r0, #0
	str	r3, [r5, #40]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L288:
	ldr	r2, [r5, #12]
	cmp	r2, r4
	beq	.L294
	ldrsb	r2, [r3, #12]
	cmp	r2, #0
	bne	.L314
.L303:
	add	r4, r4, #1
	ubfx	r4, r4, #0, #12
.L292:
	mov	r3, r4, asl #6
	cmp	r4, #4096
	add	r3, r3, r4, lsl #4
	add	r3, r6, r3
	bcc	.L288
	ldr	r2, .L315+4
	mov	r0, #1
	ldr	r1, .L315+8
	bl	dprint_vfmw
	ldr	r2, [r5, #12]
	cmp	r2, r4
	bne	.L303
.L294:
	ldr	r3, [r5, #36]
	str	r2, [r5, #8]
	str	r3, [r5, #32]
	ldrsb	r3, [r7, #5]
	cmp	r3, #2
	bne	.L293
.L312:
	ldr	r3, [r5, #40]
	b	.L291
.L314:
	str	r4, [r5, #8]
	ldrsb	r2, [r7, #5]
	cmp	r2, #2
	ldrne	r3, [r3, #20]
	strne	r3, [r5, #32]
	bne	.L287
	b	.L312
.L297:
	mvn	r0, #0
	b	.L309
.L316:
	.align	2
.L315:
	.word	.LC14
	.word	.LANCHOR3+36
	.word	.LC15
	UNWIND(.fnend)
	.size	ReleaseStreamSeg, .-ReleaseStreamSeg
	.align	2
	.global	GetSegStreamSize
	.type	GetSegStreamSize, %function
GetSegStreamSize:
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
	cmp	r1, #0
	cmpne	r0, #0
	addne	r2, r0, #327680
	movne	r3, #0
	moveq	r3, #1
	movne	r0, r3
	ldrne	r3, [r2, #40]
	mvneq	r0, #0
	strne	r3, [r1]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetSegStreamSize, .-GetSegStreamSize
	.align	2
	.global	GetSegStreamNum
	.type	GetSegStreamNum, %function
GetSegStreamNum:
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
	addne	r0, r0, #327680
	ldrne	r3, [r0, #12]
	ldrne	r0, [r0, #8]
	rsbne	r0, r0, r3
	ubfxne	r0, r0, #0, #12
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetSegStreamNum, .-GetSegStreamNum
	.align	2
	.global	GetFreshSegStream
	.type	GetFreshSegStream, %function
GetFreshSegStream:
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
	cmp	r2, #0
	cmpne	r1, #0
	moveq	r3, #1
	movne	r3, #0
	cmp	r0, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	addeq	r0, r0, #327680
	ldreq	r3, [r0, #48]
	streq	r3, [r1]
	ldreq	r3, [r0, #44]
	streq	r3, [r2]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetFreshSegStream, .-GetFreshSegStream
	.align	2
	.global	SCDDRV_PrepareSleep
	.type	SCDDRV_PrepareSleep, %function
SCDDRV_PrepareSleep:
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
	bne	.L329
	ldr	r3, .L330
	ldr	r2, [r3, #332]
	cmp	r2, #0
	bne	.L329
	ldr	r0, [r3, #48]
	cmp	r0, #0
	moveq	r2, #2
	movne	r0, r2
	movne	r2, #1
	str	r2, [r3, #332]
	ldmfd	sp, {fp, sp, pc}
.L329:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L331:
	.align	2
.L330:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_PrepareSleep, .-SCDDRV_PrepareSleep
	.align	2
	.global	SCDDRV_GetSleepStage
	.type	SCDDRV_GetSleepStage, %function
SCDDRV_GetSleepStage:
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
	ldreq	r3, .L335
	ldreq	r0, [r3, #332]
	movne	r0, #3
	ldmfd	sp, {fp, sp, pc}
.L336:
	.align	2
.L335:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_GetSleepStage, .-SCDDRV_GetSleepStage
	.align	2
	.global	SCDDRV_ForceSleep
	.type	SCDDRV_ForceSleep, %function
SCDDRV_ForceSleep:
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
	ldmnefd	sp, {fp, sp, pc}
	ldr	r3, .L342
	ldr	r2, [r3, #332]
	cmp	r2, #2
	movne	r2, #2
	strne	r2, [r3, #332]
	ldmfd	sp, {fp, sp, pc}
.L343:
	.align	2
.L342:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_ForceSleep, .-SCDDRV_ForceSleep
	.align	2
	.global	SCDDRV_ExitSleep
	.type	SCDDRV_ExitSleep, %function
SCDDRV_ExitSleep:
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
	ldreq	r3, .L346
	streq	r0, [r3, #332]
	ldmfd	sp, {fp, sp, pc}
.L347:
	.align	2
.L346:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_ExitSleep, .-SCDDRV_ExitSleep
	.align	2
	.global	ResetLastUnfinishedSegInfo
	.type	ResetLastUnfinishedSegInfo, %function
ResetLastUnfinishedSegInfo:
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
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r1, .L350
	add	r3, r0, #425984
	add	r0, r3, #436
	add	r5, r3, #444
	mov	ip, #0
	mvn	r2, #0
	ldr	lr, [r1, #48]
	mov	r4, #1
	str	r2, [r3, #440]
	mov	r1, ip
	strh	r2, [r0]	@ movhi
	add	r0, r3, #480
	str	r2, [r3, #448]
	strh	r2, [r5]	@ movhi
	mov	r2, #80
	str	r4, [r3, #456]
	str	ip, [r3, #460]
	str	ip, [r3, #464]
	str	ip, [r3, #468]
	str	ip, [r3, #472]
	str	ip, [r3, #452]
	mov	r3, lr
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L351:
	.align	2
.L350:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	ResetLastUnfinishedSegInfo, .-ResetLastUnfinishedSegInfo
	.align	2
	.global	SM_ClearInst
	.type	SM_ClearInst, %function
SM_ClearInst:
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
	bhi	.L354
	ldr	r3, .L355
	movw	r2, #49720
	ldr	ip, .L355+4
	movt	r2, 6
	add	r4, r3, r0, lsl #3
	mov	r1, #0
	mvn	r5, #0
	ldr	r3, [ip, #48]
	ldr	r0, [r4, #76]
	blx	r3
	ldr	r0, [r4, #76]
	bl	ResetLastUnfinishedSegInfo
	ldr	r3, [r4, #76]
	mov	r0, #0
	mvn	r4, #0
	add	r3, r3, #425984
	strd	r4, [r3, #248]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L354:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L356:
	.align	2
.L355:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SM_ClearInst, .-SM_ClearInst
	.align	2
	.global	SM_InstInit
	.type	SM_InstInit, %function
SM_InstInit:
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
	ldr	r4, .L360
	ldr	r6, .L360+4
	add	r5, r4, #256
.L358:
	mov	r2, #8
	mov	r0, r4
	ldr	r3, [r6, #48]
	add	r4, r4, r2
	mov	r1, #0
	blx	r3
	cmp	r4, r5
	bne	.L358
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L361:
	.align	2
.L360:
	.word	.LANCHOR0+76
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SM_InstInit, .-SM_InstInit
	.align	2
	.global	SM_OpenSCDDrv
	.type	SM_OpenSCDDrv, %function
SM_OpenSCDDrv:
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
	adds	r6, r2, #0
	mov	r9, r1
	mov	r5, r0
	movne	r6, #1
	cmp	r1, #0
	orrle	r6, r6, #1
	cmp	r0, #0
	orreq	r6, r6, #1
	cmp	r6, #0
	bne	.L366
	mov	r7, r2, asl #2
	mov	r8, r2, asl #6
	rsb	r3, r7, r8
	ldr	r10, .L367
	str	r3, [fp, #-48]
	mov	r2, r3
	add	r4, r10, r2
	add	r7, r10, r7
	mov	r3, #49152
	ldr	r2, [r4, #40]
	movt	r3, 63683
	str	r3, [r7, #72]
	cmp	r2, #1
	beq	.L365
	ldr	r3, .L367+4
	mov	r1, r6
	mov	r2, #60
	mov	r0, r4
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r2, .L367+8
	add	r3, r5, #15
	str	r9, [r4, #4]
	add	r8, r2, r8
	ldr	r2, [fp, #-48]
	bic	r3, r3, #15
	str	r3, [r4, #12]
	str	r6, [r8, #60]
	str	r5, [r10, r2]
	mov	r0, r3
	rsb	r10, r5, r3
	str	r6, [r7, #332]
	bl	MEM_Phy2Vir
	add	r5, r5, #12288
	add	r5, r5, r10
	mov	r3, #12288
	str	r5, [r4, #24]
	add	r10, r10, #45056
	str	r3, [r4, #16]
	str	r0, [r4, #8]
	mov	r0, r5
	bl	MEM_Phy2Vir
	ldr	r1, [r7, #72]
	ldr	r2, [r7, #336]
	cmp	r9, r10
	mov	r3, #32768
	str	r3, [r4, #28]
	str	r1, [r4, #32]
	str	r2, [r4, #36]
	str	r0, [r4, #20]
	blt	.L365
	ldr	r3, [r4, #8]
	cmp	r3, #0
	cmpne	r0, #0
	moveq	r0, #1
	movne	r0, #0
	beq	.L365
	mov	r3, #1
	str	r3, [r4, #40]
.L363:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L365:
	mvn	r0, #6
	b	.L363
.L366:
	mvn	r0, #0
	b	.L363
.L368:
	.align	2
.L367:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_VfmwGlobalStat
	UNWIND(.fnend)
	.size	SM_OpenSCDDrv, .-SM_OpenSCDDrv
	.align	2
	.global	SM_CloseSCDDrv
	.type	SM_CloseSCDDrv, %function
SM_CloseSCDDrv:
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
	bne	.L373
	ldr	r1, .L381
	mov	ip, r0
.L372:
	cmp	r0, #31
	bhi	.L371
	ldr	r3, [r1, r0, asl #3]
	cmp	r3, #0
	add	r2, r3, #425984
	beq	.L371
	ldr	r3, [r2, #228]
	cmp	r3, #0
	beq	.L371
	ldr	r3, [r2, #216]
	cmp	r3, #0
	strle	ip, [r2, #228]
.L371:
	add	r0, r0, #1
	cmp	r0, #32
	bne	.L372
	ldr	ip, .L381+4
	mov	r4, #0
	ldr	r3, .L381+8
	mov	r1, r4
	mov	r2, #60
	ldr	r0, .L381+12
	str	r4, [ip, #60]
	ldr	r3, [r3, #48]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L373:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L382:
	.align	2
.L381:
	.word	.LANCHOR0+76
	.word	g_VfmwGlobalStat
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SM_CloseSCDDrv, .-SM_CloseSCDDrv
	.align	2
	.global	SM_Config
	.type	SM_Config, %function
SM_Config:
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
	clz	r3, r1
	mov	r7, r0
	mov	r5, r1
	mov	r3, r3, lsr #5
	cmp	r0, #31
	orrhi	r3, r3, #1
	cmp	r3, #0
	bne	.L386
	ldr	r3, .L398
	add	r2, r3, r0, lsl #3
	ldr	r6, [r2, #76]
	clz	r8, r6
	mov	r8, r8, lsr #5
	cmp	r8, #0
	bne	.L386
	ldr	r2, [r1, #44]
	add	r4, r6, #425984
	str	r2, [r4, #296]
	ldr	r2, [r1, #12]
	ldr	r1, [r6, #20]
	cmp	r1, r2
	addeq	r9, r6, #8
	ldreq	r10, .L398+4
	beq	.L388
	cmp	r2, #0
	beq	.L386
	ldr	r2, [r5]
	cmp	r2, #0
	beq	.L386
	ldr	r1, [r3, #12]
	mov	r2, #4096
	ldr	r0, [r3, #24]
	ldr	lr, [r3, #8]
	str	r1, [r4, #184]
	ldr	ip, [r3, #16]
	ldr	r1, [r3, #20]
	ldr	r3, [r3, #28]
	str	r2, [r4, #200]
	str	r1, [r4, #188]
	str	lr, [r4, #176]
	str	ip, [r4, #180]
	str	r0, [r4, #192]
	str	r3, [r4, #196]
	ldr	r3, [r5, #12]
	ldr	r0, [r5]
	add	r1, r3, #3
	bic	r1, r1, #3
	rsb	r3, r3, r1
	add	r1, r1, #131072
	add	r2, r3, #131072
	str	r1, [r4, #204]
	add	r2, r0, r2
	str	r2, [r4, #172]
	ldr	r0, [r5, #16]
	rsb	r3, r3, r0
	sub	r3, r3, #132096
	str	r3, [r4, #208]
	cmp	r3, #262144
	blt	.L386
	ldr	r10, .L398+4
	add	r0, r6, #98304
	add	r9, r6, #8
	add	r0, r0, #104
	bl	ConfigStreamSegArray
	mov	r2, #72
	ldr	r3, [r10, #52]
	mov	r0, r9
	mov	r1, r5
	blx	r3
	str	r8, [r4, #216]
.L388:
	ldr	r3, [r10, #52]
	mov	r0, r9
	mov	r2, #72
	mov	r1, r5
	blx	r3
	mov	r3, #2
	str	r3, [r4, #284]
	ldr	r3, [r5, #8]
	cmp	r3, #2
	moveq	r3, #3
	streq	r3, [r4, #284]
	ldr	r3, .L398+8
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L397
.L390:
	mov	r0, #0
	str	r7, [r4, #212]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L397:
	ldr	r2, [r5, #8]
	cmp	r2, #17
	streq	r3, [r6, #4]
	b	.L390
.L386:
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L399:
	.align	2
.L398:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_SegBypassEnable
	UNWIND(.fnend)
	.size	SM_Config, .-SM_Config
	.align	2
	.global	SM_CfgBuf
	.type	SM_CfgBuf, %function
SM_CfgBuf:
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
	cmp	r0, #31
	bhi	.L408
	cmp	r1, #0
	bne	.L409
	ldr	r2, .L410
	add	r0, r2, r0, lsl #3
	ldr	r3, [r0, #76]
	clz	r1, r3
	mov	r1, r1, lsr #5
	cmp	r1, #0
	bne	.L404
	add	r3, r3, #425984
	ldr	r0, [r3, #216]
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r6, [r2, #12]
	mov	r0, r1
	ldr	r5, [r2, #8]
	mov	ip, #4096
	ldr	r4, [r2, #16]
	ldr	lr, [r2, #24]
	str	r1, [r3, #216]
	ldr	r1, [r2, #20]
	ldr	r2, [r2, #28]
	str	r6, [r3, #184]
	str	r5, [r3, #176]
	str	r4, [r3, #180]
	str	lr, [r3, #192]
	str	r1, [r3, #188]
	str	r2, [r3, #196]
	str	ip, [r3, #200]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L404:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L408:
	mov	r3, r0
	movw	r2, #1379
	ldr	r1, .L410+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L409:
	mov	r3, r1
	movw	r2, #1386
	ldr	r1, .L410+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L411:
	.align	2
.L410:
	.word	.LANCHOR0
	.word	.LC16
	.word	.LC17
	UNWIND(.fnend)
	.size	SM_CfgBuf, .-SM_CfgBuf
	.align	2
	.global	SM_Start
	.type	SM_Start, %function
SM_Start:
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
	bhi	.L414
	ldr	r3, .L417
	add	r0, r3, r0, lsl #3
	ldr	r3, [r0, #76]
	cmp	r3, #0
	beq	.L416
	add	r3, r3, #425984
	ldr	r0, [r3, #228]
	cmp	r0, #0
	bne	.L416
	mov	r2, #1
	str	r2, [r3, #228]
	ldmfd	sp, {fp, sp, pc}
.L416:
	mvn	r0, #6
	ldmfd	sp, {fp, sp, pc}
.L414:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L418:
	.align	2
.L417:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SM_Start, .-SM_Start
	.align	2
	.global	SM_Stop
	.type	SM_Stop, %function
SM_Stop:
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
	bhi	.L421
	ldr	r3, .L427
	add	r0, r3, r0, lsl #3
	ldr	r0, [r0, #76]
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	add	r3, r0, #425984
	ldr	r0, [r3, #228]
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r2, [r3, #216]
	cmp	r2, #0
	bgt	.L423
	mov	r0, #0
	str	r0, [r3, #228]
	ldmfd	sp, {fp, sp, pc}
.L423:
	mvn	r0, #6
	ldmfd	sp, {fp, sp, pc}
.L421:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L428:
	.align	2
.L427:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SM_Stop, .-SM_Stop
	.align	2
	.global	SM_GetInfo
	.type	SM_GetInfo, %function
SM_GetInfo:
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
	clz	r3, r1
	mov	r4, r1
	mov	r5, r0
	mov	r3, r3, lsr #5
	cmp	r0, #31
	movls	r1, r3
	orrhi	r1, r3, #1
	cmp	r1, #0
	bne	.L444
	ldr	r3, .L447
	mov	r2, #24
	mov	r0, r4
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r0, .L447+4
	add	r0, r0, r5, lsl #3
	ldr	r3, [r0, #76]
	cmp	r3, #0
	beq	.L446
	add	ip, r3, #425984
	add	r1, r3, #98304
	adds	lr, r1, #104
	ldr	r2, [ip, #228]
	strb	r2, [r4]
	ldr	r2, [ip, #276]
	str	r2, [r4, #20]
	moveq	r2, lr
	ldrne	r0, [ip, #112]
	ldrne	r2, [ip, #116]
	rsbne	r2, r0, r2
	ubfxne	r2, r2, #0, #12
	cmn	r3, #80
	str	r2, [r4, #8]
	movne	r0, #0
	moveq	r0, #1
	cmn	r3, #80
	cmnne	r4, #4
	beq	.L444
	ldr	r3, [r1, #84]
	ldr	r2, [r1, #80]
	subs	r3, r3, r2
	addmi	r3, r3, #1024
	strmi	r3, [r4, #4]
	strpl	r3, [r4, #4]
.L436:
	cmn	r4, #12
	movne	r3, #0
	moveq	r3, #1
	orrs	r3, r0, r3
	bne	.L444
	ldr	r3, [r1, #100]
	str	r3, [r4, #12]
	ldr	r0, [r1, #92]
	rsb	r0, r0, r3
	str	r0, [r4, #12]
	movs	r0, r0, asr #31
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	cmn	r4, #16
	cmpne	lr, #0
	beq	.L444
	ldr	r3, [ip, #144]
	str	r3, [r4, #16]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L446:
	cmp	r4, #0
	strneb	r3, [r4]
.L444:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L448:
	.align	2
.L447:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SM_GetInfo, .-SM_GetInfo
	.align	2
	.global	GetRawNumInFrame
	.type	GetRawNumInFrame, %function
GetRawNumInFrame:
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
	add	r6, r0, #98304
	mov	r4, #1
	ldr	r3, [r6]
	mov	ip, r3, asl #5
	mov	r5, r3, asl #7
	rsb	lr, ip, r5
	add	lr, r0, lr
	ldr	lr, [lr, #12]
	str	lr, [r2]
	str	r4, [r1]
	b	.L450
.L452:
	ldr	r4, [r1]
	add	r4, r4, #1
	str	r4, [r1]
	ldr	r4, [lr, #12]
	ldr	lr, [r2]
	add	lr, lr, r4
	str	lr, [r2]
	ldr	lr, [r6, #4]
	cmp	lr, r3
	beq	.L454
	ldr	lr, [r1]
	cmp	lr, #1024
	bhi	.L454
.L450:
	rsb	ip, ip, r5
	add	r3, r3, #1
	ubfx	r3, r3, #0, #10
	ldrb	r4, [r0, ip]	@ zero_extendqisi2
	mov	r5, r3, asl #7
	mov	ip, r3, asl #5
	cmp	r4, #0
	rsb	lr, ip, r5
	add	lr, r0, lr
	bne	.L452
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L454:
	mvn	r0, #3
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetRawNumInFrame, .-GetRawNumInFrame
	.align	2
	.global	AdjustRawPacketVP6A
	.type	AdjustRawPacketVP6A, %function
AdjustRawPacketVP6A:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r10, [r1]
	add	ip, r0, #98304
	cmp	r10, #0
	ldr	ip, [ip]
	beq	.L460
	mov	r7, ip, asl #5
	mov	r6, ip, asl #7
	rsb	lr, r7, r6
	add	lr, r0, lr
	ldr	r4, [lr, #12]
	cmp	r4, #2
	bgt	.L461
	mov	lr, r4
	mov	r8, #3
	mov	r5, #0
	b	.L458
.L459:
	add	lr, r0, lr
	ldr	lr, [lr, #12]
	add	r4, r4, lr
	cmp	r4, #2
	bgt	.L463
.L458:
	add	ip, ip, #1
	add	r5, r5, #1
	ubfx	ip, ip, #0, #10
	cmp	r5, r10
	rsb	r8, lr, r8
	mov	r7, ip, asl #5
	mov	r6, ip, asl #7
	rsb	lr, r7, r6
	bne	.L459
.L460:
	mvn	r0, #3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L463:
	mov	r9, r8, asr #31
.L457:
	rsb	r6, r7, r6
	rsb	r5, r5, r10
	add	r6, r0, r6
	str	r5, [r1]
	sub	r4, r4, #3
	mov	r0, #0
	ldrd	r6, [r6, #40]
	adds	r8, r8, r6
	adc	r9, r9, r7
	strd	r8, [r2]
	str	r4, [r3]
	ldr	r3, [fp, #4]
	str	ip, [r3]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L461:
	mov	r8, #3
	mov	r9, #0
	mov	r5, #0
	b	.L457
	UNWIND(.fnend)
	.size	AdjustRawPacketVP6A, .-AdjustRawPacketVP6A
	.align	2
	.global	SM_LinkRawToSeg
	.type	SM_LinkRawToSeg, %function
SM_LinkRawToSeg:
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
	ldr	r3, .L483
	mov	r8, r0
	mov	r5, r1
	add	r3, r3, r0, lsl #3
	ldr	r6, [r3, #76]
	cmp	r6, #0
	beq	.L467
	add	r3, r6, #98304
	add	r2, r6, #80
	cmn	r3, #104
	cmnne	r6, #80
	str	r2, [fp, #-56]
	ldr	r4, [r3, #80]
	add	r10, r3, #104
	moveq	r2, #1
	movne	r2, #0
	cmp	r1, #0
	orreq	r2, r2, #1
	cmp	r2, #0
	str	r4, [fp, #-52]
	bne	.L467
	ldr	r3, [r3, #84]
	cmp	r4, r3
	beq	.L473
	mov	r9, r4, asl #5
	mov	r4, r4, asl #7
	rsb	ip, r9, r4
	add	r7, r6, ip
	ldrb	r3, [r7, #80]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L480
	ldrd	r0, [r7, #120]
	orrs	r3, r0, r1
	beq	.L481
	ldr	r3, [r6, #16]
	cmp	r3, #12
	beq	.L482
.L470:
	ldr	r3, .L483+4
	mov	r2, r8
	mov	r0, r10
	mov	r1, r5
	ldr	r3, [r3, r8, asl #2]
	add	r3, r3, #475136
	ldr	r3, [r3, #1656]
	cmp	r3, #1
	rsbne	r3, r9, r4
	rsb	r4, r9, r4
	addne	r3, r6, r3
	ldreq	r3, [r7, #84]
	add	r6, r6, r4
	ldrne	r3, [r3, #88]
	str	r3, [r5, #12]
	mov	r3, #1
	ldr	ip, [r6, #120]
	str	ip, [r5]
	ldr	ip, [r6, #92]
	str	ip, [r5, #16]
	ldrd	r8, [r6, #144]
	strd	r8, [r5, #24]
	ldrd	r8, [r6, #144]
	strd	r8, [r5, #32]
	ldrd	r8, [r6, #128]
	strd	r8, [r5, #40]
	ldrd	r8, [r6, #136]
	strd	r8, [r5, #48]
	ldr	ip, [r6, #104]
	str	ip, [r5, #56]
	ldr	ip, [r6, #108]
	str	ip, [r5, #60]
	ldr	ip, [r6, #112]
	str	ip, [r5, #64]
	ldr	ip, [r6, #116]
	str	ip, [r5, #68]
	ldrb	ip, [r7, #81]	@ zero_extendqisi2
	strb	r3, [r5, #6]
	strb	ip, [r5, #7]
	bl	InsertStreamSeg
	mov	r0, #0
.L466:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L482:
	add	r3, r7, #88
	str	r3, [fp, #-60]
	ldr	r3, [r7, #92]
	cmp	r3, #0
	beq	.L470
	ldr	lr, [fp, #-56]
	sub	r1, fp, #44
	add	r2, ip, #40
	mov	r0, #1
	add	r3, lr, ip
	str	r0, [r1, #-4]!
	add	r3, r3, #12
	sub	r0, fp, #52
	add	r2, lr, r2
	str	r0, [sp]
	mov	r0, lr
	bl	AdjustRawPacketVP6A
	cmp	r0, #0
	beq	.L470
	ldr	r3, [fp, #-60]
	ldr	r0, [fp, #-56]
	ldr	r1, [r3, #4]
	bl	DeleteRawLen
	mvn	r0, #3
	b	.L466
.L480:
	ldr	r1, [r7, #92]
	ldr	r0, [fp, #-56]
	str	r2, [fp, #-60]
	bl	DeleteRawLen
	ldr	r2, [fp, #-60]
	ldr	r1, .L483+8
	mov	r0, r2
	ldr	r2, .L483+12
	bl	dprint_vfmw
	mvn	r0, #3
	b	.L466
.L481:
	ldr	r1, [r7, #92]
	ldr	r0, [fp, #-56]
	bl	DeleteRawLen
	ldr	r2, .L483+12
	ldr	r1, .L483+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #3
	b	.L466
.L473:
	mvn	r0, #3
	b	.L466
.L467:
	mvn	r0, #0
	b	.L466
.L484:
	.align	2
.L483:
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	.word	.LC18
	.word	.LANCHOR3+56
	.word	.LC19
	UNWIND(.fnend)
	.size	SM_LinkRawToSeg, .-SM_LinkRawToSeg
	.align	2
	.global	SM_CopyRawToSeg
	.type	SM_CopyRawToSeg, %function
SM_CopyRawToSeg:
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
	ldr	r3, .L524
	mov	r2, r0
	str	r0, [fp, #-84]
	add	r3, r3, r2, lsl #3
	mov	r2, #0
	mov	r5, r1
	mov	r0, #0
	ldr	r4, [r3, #76]
	mov	r1, #0
	str	r2, [fp, #-64]
	cmp	r4, r2
	strd	r0, [fp, #-52]
	beq	.L504
	cmn	r4, #80
	add	r8, r4, #98304
	add	r2, r8, #104
	str	r2, [fp, #-80]
	movne	r3, #0
	moveq	r3, #1
	cmn	r8, #104
	add	r2, r4, #80
	str	r2, [fp, #-76]
	movne	r9, #0
	moveq	r9, #1
	orr	r3, r9, r3
	cmp	r5, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L504
	ldr	r10, [r8, #84]
	ldr	r3, [r8, #80]
	cmp	r10, r3
	beq	.L519
	mov	r2, r3, asl #5
	mov	r7, r3, asl #7
	rsb	r1, r2, r7
	mov	ip, #1
	add	r1, r4, r1
	str	r2, [fp, #-72]
	mov	lr, r2
	str	ip, [fp, #-56]
	mov	r2, r7
	ldr	r6, [r1, #92]
	b	.L488
.L490:
	add	ip, ip, #1
	ldr	r0, [r0, #92]
	cmp	ip, #1024
	add	r6, r6, r0
	movls	r1, #0
	movhi	r1, #1
	cmp	r3, r10
	orreq	r1, r1, #1
	cmp	r1, #0
	bne	.L519
.L488:
	rsb	r1, lr, r2
	add	r3, r3, #1
	add	r1, r4, r1
	ubfx	r3, r3, #0, #10
	ldrb	r1, [r1, #80]	@ zero_extendqisi2
	mov	lr, r3, asl #5
	mov	r2, r3, asl #7
	cmp	r1, #0
	rsb	r0, lr, r2
	add	r0, r4, r0
	bne	.L490
	cmp	r9, #0
	str	ip, [fp, #-56]
	addne	r3, r4, #425984
	bne	.L501
	ldr	r10, .L524+4
	mov	r2, #327680
	mov	r1, r9
	add	r0, r8, #112
	ldr	r3, [r10, #48]
	blx	r3
	add	r3, r4, #425984
	ldr	r2, [r3, #128]
	str	r9, [r3, #112]
	str	r9, [r3, #116]
	str	r9, [r3, #120]
	str	r2, [r3, #136]
	str	r2, [r3, #140]
.L501:
	ldr	r2, [r3, #132]
	cmp	r2, r6
	blt	.L522
	ldr	r2, [fp, #-72]
	ldr	r1, [r4, #16]
	rsb	r2, r2, r7
	ldr	r9, [r3, #128]
	add	r2, r4, r2
	ldr	r3, [r8, #80]
	sub	r1, r1, #12
	ldr	r8, [r8, #104]
	ldr	r0, [r2, #92]
	clz	r1, r1
	str	r3, [fp, #-60]
	cmp	r0, #0
	mov	r1, r1, lsr #5
	ldrd	r2, [r2, #120]
	moveq	r1, #0
	cmp	r1, #0
	str	r0, [fp, #-64]
	strd	r2, [fp, #-52]
	bne	.L493
.L496:
	str	r9, [r5, #12]
	mov	r0, r9
	bl	MEM_Phy2Vir
	ldr	r3, [fp, #-72]
	mov	r1, #1
	ldr	ip, [fp, #-56]
	rsb	r7, r3, r7
	add	r7, r4, r7
	cmp	ip, #0
	str	r0, [r5]
	rsb	r3, r0, r8
	str	r3, [r5, #16]
	ldrd	r2, [r7, #144]
	strd	r2, [r5, #24]
	ldrd	r2, [r7, #144]
	strd	r2, [r5, #32]
	ldrd	r2, [r7, #128]
	strb	r1, [r5, #6]
	strd	r2, [r5, #40]
	ldrd	r2, [r7, #136]
	strd	r2, [r5, #48]
	ldr	r3, [r7, #104]
	str	r3, [r5, #56]
	ldr	r3, [r7, #108]
	str	r3, [r5, #60]
	ldr	r3, [r7, #112]
	str	r3, [r5, #64]
	ldr	r3, [r7, #116]
	str	r3, [r5, #68]
	beq	.L495
	cmp	r8, #0
	beq	.L519
	ldrd	r2, [fp, #-52]
	orrs	r3, r2, r3
	ldrne	r10, .L524+4
	movne	r7, #0
	bne	.L498
	b	.L519
.L499:
	cmp	r8, #0
	beq	.L519
	orrs	r3, r0, r1
	beq	.L519
.L498:
	mov	r0, #2
	add	r7, r7, #1
	bl	VCTRL_RecordPosTime
	ldr	r3, [r10, #52]
	ldr	r2, [fp, #-64]
	mov	r0, r8
	ldr	r1, [fp, #-52]
	blx	r3
	mov	r0, #3
	bl	VCTRL_RecordPosTime
	ldr	r1, [fp, #-64]
	mov	r0, #0
	bl	VCTRL_RecordData
	ldr	r2, [fp, #-60]
	ldr	r1, [fp, #-64]
	add	r0, r2, #1
	ldr	ip, [fp, #-56]
	mov	r3, r2, asl #7
	ubfx	r0, r0, #0, #10
	sub	r2, r3, r2, asl #5
	str	r0, [fp, #-60]
	add	r2, r4, r2
	mov	r3, r0, asl #7
	sub	r3, r3, r0, asl #5
	add	r8, r8, r1
	ldrb	r0, [r2, #81]	@ zero_extendqisi2
	add	r3, r4, r3
	ldr	r2, [r5, #16]
	cmp	ip, r7
	strb	r0, [r5, #7]
	add	r1, r2, r1
	str	r1, [r5, #16]
	ldrd	r0, [r3, #120]
	ldr	r3, [r3, #92]
	strd	r0, [fp, #-52]
	str	r3, [fp, #-64]
	bhi	.L499
	ldr	r0, [r5]
.L495:
	cmp	r0, #0
	beq	.L523
	ldr	r2, [fp, #-84]
	mov	r1, r5
	ldr	r0, [fp, #-80]
	bl	InsertStreamSeg
	mov	r1, r6
	ldr	r0, [fp, #-76]
	bl	DeleteRawLen
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L522:
	mov	r2, r6
	ldr	r1, .L524+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r1, r6
	ldr	r0, [fp, #-76]
	bl	DeleteRawLen
	cmp	r0, #0
	beq	.L519
	movw	r2, #1683
	ldr	r1, .L524+12
	mov	r0, #0
	bl	dprint_vfmw
.L519:
	mvn	r0, #3
.L516:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L493:
	sub	r2, fp, #60
	sub	r3, fp, #64
	str	r2, [sp]
	sub	r1, fp, #56
	sub	r2, fp, #52
	ldr	r0, [fp, #-76]
	bl	AdjustRawPacketVP6A
	cmp	r0, #0
	beq	.L496
	b	.L519
.L504:
	mvn	r0, #0
	b	.L516
.L523:
	mov	r3, #1744
	ldr	r2, .L524+16
	ldr	r1, .L524+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #3
	b	.L516
.L525:
	.align	2
.L524:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC20
	.word	.LC21
	.word	.LANCHOR3+72
	.word	.LC22
	UNWIND(.fnend)
	.size	SM_CopyRawToSeg, .-SM_CopyRawToSeg
	.align	2
	.global	SCDDRV_IsSCDByPass
	.type	SCDDRV_IsSCDByPass, %function
SCDDRV_IsSCDByPass:
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
	bics	r3, r0, #16
	beq	.L532
	sub	r3, r0, #2
	cmp	r3, #1
	bls	.L531
	cmp	r0, #18
	cmpne	r0, #6
	moveq	r3, #1
	movne	r3, #0
	beq	.L531
	cmp	r0, #1
	beq	.L533
.L528:
	subs	r0, r0, #15
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L531:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L533:
	ldr	r2, [r1]
	cmp	r2, #0
	beq	.L528
.L532:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_IsSCDByPass, .-SCDDRV_IsSCDByPass
	.align	2
	.global	SCDDRV_SaveStreamSeg
	.type	SCDDRV_SaveStreamSeg, %function
SCDDRV_SaveStreamSeg:
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
	ldr	r5, .L542
	mov	r6, r0
	mov	r4, r1
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrsb	r3, [r1, #5]
	cmp	r3, #2
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r7, .L542+4
	mov	r0, #0
	ldr	r3, [r7, #16]
	blx	r3
	ldr	r3, [r7, #44]
	ldr	r2, [r5, r6, asl #2]
	ldr	r1, [r4, #16]
	ldr	r0, [r4]
	blx	r3
	ldr	r3, [r7, #12]
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3
.L543:
	.align	2
.L542:
	.word	vfmw_save_seg_file
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SCDDRV_SaveStreamSeg, .-SCDDRV_SaveStreamSeg
	.align	2
	.global	SM_ReadSegStream
	.type	SM_ReadSegStream, %function
SM_ReadSegStream:
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
	clz	r3, r1
	mov	r6, r0
	mov	r7, r1
	mov	r3, r3, lsr #5
	cmp	r0, #31
	orrhi	r3, r3, #1
	cmp	r3, #0
	bne	.L551
	ldr	r3, .L561
	add	r3, r3, r0, lsl #3
	ldr	r4, [r3, #76]
	cmp	r4, #0
	beq	.L551
	add	r1, r4, #32
	ldr	r0, [r4, #16]
	bl	SCDDRV_IsSCDByPass
	cmp	r0, #0
	beq	.L546
	ldr	r3, [r4, #4]
	mov	r1, r7
	mov	r0, r6
	cmp	r3, #1
	beq	.L558
	bl	SM_CopyRawToSeg
.L548:
	cmp	r0, #0
	bne	.L559
.L546:
	add	r0, r4, #98304
	mov	r1, r7
	add	r0, r0, #104
	add	r4, r4, #425984
	bl	SCDDRV_GetStreamSeg
	subs	r5, r0, #0
	beq	.L560
	ldr	r3, [r4, #276]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #276]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L560:
	mov	r0, r6
	mov	r1, r7
	str	r5, [r4, #276]
	bl	SCDDRV_SaveStreamSeg
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L558:
	bl	SM_LinkRawToSeg
	b	.L548
.L559:
	add	r4, r4, #425984
	mvn	r0, #6
	ldr	r3, [r4, #276]
	add	r3, r3, #1
	str	r3, [r4, #276]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L551:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L562:
	.align	2
.L561:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SM_ReadSegStream, .-SM_ReadSegStream
	.align	2
	.global	SM_ReleaseStreamSeg
	.type	SM_ReleaseStreamSeg, %function
SM_ReleaseStreamSeg:
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
	bhi	.L566
	ldr	r3, .L569
	add	r0, r3, r0, lsl #3
	ldr	r4, [r0, #76]
	cmp	r4, #0
	beq	.L566
	add	r0, r4, #98304
	add	r0, r0, #104
	bl	ReleaseStreamSeg
	subs	r5, r0, #0
	bne	.L567
	ldr	r0, [r4, #4]
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	add	r0, r4, #80
	mov	r1, #1
	bl	DeleteRawPacket
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L566:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L567:
	mvn	r0, #2
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L570:
	.align	2
.L569:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SM_ReleaseStreamSeg, .-SM_ReleaseStreamSeg
	.align	2
	.global	SM_GiveThreadEvent
	.type	SM_GiveThreadEvent, %function
SM_GiveThreadEvent:
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
	ldr	r3, .L572
	mov	r0, #0
	ldr	r3, [r3, #128]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L573:
	.align	2
.L572:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SM_GiveThreadEvent, .-SM_GiveThreadEvent
	.align	2
	.global	CalcInstBlockTime
	.type	CalcInstBlockTime, %function
CalcInstBlockTime:
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
	ldr	r3, .L579
	mov	r5, r1
	mov	r4, r0
	ldr	r3, [r3]
	blx	r3
	cmp	r5, #0
	add	r3, r4, #425984
	mov	r1, r0
	bne	.L578
	ldr	r2, [r3, #244]
	cmp	r0, r2
	strls	r5, [r3, #240]
	rsbhi	r0, r2, r0
	strls	r1, [r3, #244]
	strhi	r0, [r3, #240]
	movls	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L578:
	mov	r2, #0
	str	r1, [r3, #244]
	mov	r0, r2
	str	r2, [r3, #240]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L580:
	.align	2
.L579:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	CalcInstBlockTime, .-CalcInstBlockTime
	.align	2
	.global	SCDDRV_IsChanDec
	.type	SCDDRV_IsChanDec, %function
SCDDRV_IsChanDec:
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
	ldr	r3, .L584
	ldr	r2, [r3, #48]
	cmp	r2, #1
	ldreq	r3, [r3, #44]
	rsbeq	r0, r0, r3
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	movne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L585:
	.align	2
.L584:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_IsChanDec, .-SCDDRV_IsChanDec
	.align	2
	.global	SCDDRV_GetRawStreamStatus
	.type	SCDDRV_GetRawStreamStatus, %function
SCDDRV_GetRawStreamStatus:
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
	clz	r3, r0
	cmp	r0, #0
	cmpne	r1, #0
	mov	r3, r3, lsr #5
	beq	.L587
	add	lr, r0, #98304
	ldr	ip, [lr, #20]
	str	ip, [r1]
	ldr	lr, [lr, #12]
	rsb	ip, lr, ip
	str	ip, [r1]
.L587:
	cmp	r2, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	ldmnefd	sp, {fp, sp, pc}
	add	r0, r0, #98304
	ldmia	r0, {r1, r3}
	subs	r3, r3, r1
	addmi	r3, r3, #1024
	str	r3, [r2]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_GetRawStreamStatus, .-SCDDRV_GetRawStreamStatus
	.align	2
	.global	GetFreeSegBufSize
	.type	GetFreeSegBufSize, %function
GetFreeSegBufSize:
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
	cmp	r1, #0
	cmpne	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	GetFreeSegBufSize.part.7
	UNWIND(.fnend)
	.size	GetFreeSegBufSize, .-GetFreeSegBufSize
	.align	2
	.global	SCDDRV_GetSegStreamStatus
	.type	SCDDRV_GetSegStreamStatus, %function
SCDDRV_GetSegStreamStatus:
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
	ldr	r7, [fp, #4]
	clz	r5, r0
	cmp	r0, #0
	cmpne	r2, #0
	mov	r4, r3
	mov	r6, r1
	mov	r3, #0
	mov	r8, r2
	mov	r5, r5, lsr #5
	str	r3, [r7]
	mov	r9, r0
	bne	.L602
.L596:
	ldr	r2, [r8]
	add	r3, r6, #79
	add	r0, r9, #327680
	cmp	r2, r3
	movwcs	r3, #65457
	movcc	r3, #0
	movtcs	r3, 65535
	rsbcs	r3, r6, r3
	addcs	r3, r3, r2
	str	r3, [r8]
	ldr	ip, [r0, #28]
	rsb	ip, ip, ip, lsl #3
	add	r2, ip, #7
	cmp	ip, #0
	movlt	ip, r2
	cmp	r6, ip, asr #3
	addcs	r6, r3, r6
	strcs	r6, [r8]
	movcs	r3, #1
	strcs	r3, [r7]
	cmp	r5, #0
	ldreq	r2, [r0, #12]
	movne	r2, #4096
	ldreq	r3, [r0, #8]
	rsbeq	r2, r3, r2
	ubfxeq	r2, r2, #0, #12
	rsbeq	r2, r2, #4096
	str	r2, [r4]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L602:
	mov	r1, r2
	bl	GetFreeSegBufSize.part.7
	b	.L596
	UNWIND(.fnend)
	.size	SCDDRV_GetSegStreamStatus, .-SCDDRV_GetSegStreamStatus
	.align	2
	.global	SCDDRV_IsRawStreamNotEnough
	.type	SCDDRV_IsRawStreamNotEnough, %function
SCDDRV_IsRawStreamNotEnough:
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
	cmp	r1, #0
	cmpne	r0, #3
	movls	r0, #1
	movhi	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_IsRawStreamNotEnough, .-SCDDRV_IsRawStreamNotEnough
	.align	2
	.global	SCDDRV_IsFreeSegSlotNotEnough
	.type	SCDDRV_IsFreeSegSlotNotEnough, %function
SCDDRV_IsFreeSegSlotNotEnough:
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
	cmp	r0, #1024
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_IsFreeSegSlotNotEnough, .-SCDDRV_IsFreeSegSlotNotEnough
	.align	2
	.global	SCDDRV_IsFreeSegBufNotEnough
	.type	SCDDRV_IsFreeSegBufNotEnough, %function
SCDDRV_IsFreeSegBufNotEnough:
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
	cmp	r0, r1, lsr #3
	movls	r0, #1
	movhi	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_IsFreeSegBufNotEnough, .-SCDDRV_IsFreeSegBufNotEnough
	.align	2
	.global	SCDDRV_CheckConditionOfStartSCD
	.type	SCDDRV_CheckConditionOfStartSCD, %function
SCDDRV_CheckConditionOfStartSCD:
	UNWIND(.fnstart)
	@ args = 12, pretend = 0, frame = 8
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
	sub	ip, fp, #28
	mov	r5, r3
	mov	r4, r1
	mov	r3, #0
	mov	r6, r2
	str	r3, [ip, #-4]!
	mov	r1, r5
	mov	r2, ip
	bl	SCDDRV_GetRawStreamStatus
	ldr	r2, [r5]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	cmpne	r2, #3
	bls	.L608
	ldr	r3, [fp, #12]
	mov	r1, r6
	mov	r0, r4
	str	r3, [sp]
	ldmib	fp, {r2, r3}
	bl	SCDDRV_GetSegStreamStatus
	ldr	r3, [fp, #8]
	ldr	r3, [r3]
	cmp	r3, #1024
	bls	.L609
	add	r4, r4, #327680
	ldr	r3, [fp, #4]
	ldr	r2, [r4, #28]
	ldr	r3, [r3]
	cmp	r3, r2, lsr #3
	mvnls	r0, #5
	movhi	r0, #0
.L607:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L608:
	mvn	r0, #4
	b	.L607
.L609:
	mvn	r0, #5
	b	.L607
	UNWIND(.fnend)
	.size	SCDDRV_CheckConditionOfStartSCD, .-SCDDRV_CheckConditionOfStartSCD
	.align	2
	.global	SCDDRV_SetCtrlReg
	.type	SCDDRV_SetCtrlReg, %function
SCDDRV_SetCtrlReg:
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
	ldr	r2, [r0, #16]
	cmp	r2, #18
	beq	.L617
	sub	lr, r2, #6
	cmp	r2, #1
	cmpne	r2, #15
	clz	lr, lr
	moveq	r5, #1
	movne	r5, #0
	mov	lr, lr, lsr #5
	mov	r4, lr
.L612:
	add	r3, r0, #425984
	mov	ip, #1
	strb	ip, [r1, #2]
	ldr	ip, [r3, #184]
	str	ip, [r1, #4]
	ldr	ip, [r3, #176]
	str	ip, [r1, #8]
	ldr	ip, [r3, #192]
	str	ip, [r1, #16]
	ldr	r6, [r3, #200]
	ldr	ip, [r3, #284]
	mul	ip, ip, r6
	str	ip, [r1, #20]
	ldr	ip, [r3, #128]
	str	ip, [r1, #24]
	ldr	ip, [r3, #132]
	ldr	r6, [r3, #128]
	add	ip, ip, r6
	str	ip, [r1, #28]
	ldr	ip, [r3, #456]
	cmp	ip, #1
	ldreq	ip, [r3, #140]
	ldrne	ip, [r3, #452]
	addeq	ip, ip, #3
	biceq	ip, ip, #3
	cmp	r5, #0
	str	ip, [r1, #32]
	mov	ip, #1
	strb	ip, [r1]
	ldr	r0, [r0, #44]
	str	r4, [r1, #60]
	str	r0, [r1, #44]
	bne	.L618
	sub	r0, r2, #2
	cmp	r0, ip
	orrls	lr, lr, #1
	cmp	lr, #0
	strneb	ip, [r1, #1]
	beq	.L615
.L616:
	str	r2, [r1, #36]
	mov	r2, #1
	str	r2, [r1, #40]
	str	r2, [r1, #48]
	str	r2, [r1, #52]
	ldr	r3, [r3, #432]
	str	r3, [r1, #56]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L618:
	mov	r2, #0
.L615:
	mov	r0, #0
	strb	r0, [r1, #1]
	b	.L616
.L617:
	mov	r4, #1
	mov	r5, #0
	mov	lr, r4
	mov	r2, #6
	b	.L612
	UNWIND(.fnend)
	.size	SCDDRV_SetCtrlReg, .-SCDDRV_SetCtrlReg
	.align	2
	.global	SCDDRV_RecordStartState
	.type	SCDDRV_RecordStartState, %function
SCDDRV_RecordStartState:
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
	add	r4, r0, #425984
	cmp	r1, r2
	str	r1, [r4, #256]
	movls	r3, #1
	str	r2, [r4, #260]
	movhi	r3, #0
	strb	r3, [r0, #2]
	mov	r1, #1
	ldr	r3, .L625
	mov	r2, #0
	str	r1, [r4, #220]
	strb	r2, [r0, #3]
	ldr	r3, [r3]
	blx	r3
	str	r0, [r4, #280]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L626:
	.align	2
.L625:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SCDDRV_RecordStartState, .-SCDDRV_RecordStartState
	.align	2
	.global	SCD_ConfigReg
	.type	SCD_ConfigReg, %function
SCD_ConfigReg:
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
	ldr	ip, .L634
	mov	r5, r0
	mov	r0, r3
	ldrb	r3, [ip]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L633
	cmp	r5, #4
	beq	.L632
	ldr	r6, .L634+4
	mov	r4, r2, asl #2
.L629:
	add	r2, r6, r4
	ldr	r0, [r2, #72]
	add	r0, r5, r0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MEM_WritePhyWord
.L633:
	mov	r3, r1
	mov	r2, r5
	mov	r1, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VDH_Record_RegData
.L632:
	ldr	r6, .L634+4
	mov	r4, r2, asl #2
	cmp	r1, #0
	add	r3, r6, r4
	ldr	r0, [r3, #72]
	add	r0, r0, #4
	bne	.L630
	bl	MEM_ReadPhyWord
	uxth	r1, r0
	b	.L629
.L630:
	bl	MEM_ReadPhyWord
	orr	r1, r0, #65536
	b	.L629
.L635:
	.align	2
.L634:
	.word	g_HalDisable
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCD_ConfigReg, .-SCD_ConfigReg
	.align	2
	.global	WriteScdVtrlReg
	.type	WriteScdVtrlReg, %function
WriteScdVtrlReg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 192
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #196)
	sub	sp, sp, #196
	ldr	r5, .L695
	mov	r9, r0
	mov	r4, r1
	mov	r7, r2
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L637
	ldr	r3, .L695+4
	sub	r0, fp, #232
	mov	r2, #188
	mov	r1, #0
	mov	r8, r0
	ldr	r3, [r3, #48]
	blx	r3
.L638:
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldr	r1, [r4, #4]
	cmp	r2, #1
	bne	.L675
	ldr	r6, .L695+8
	add	r3, r6, r7, lsl #2
	ldr	r0, [r3, #72]
	add	r0, r0, #2048
	add	r0, r0, #4
	bl	MEM_WritePhyWord
.L640:
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldr	r1, [r4, #16]
	cmp	r2, #1
	bne	.L676
	add	r2, r6, r7, lsl #2
	ldr	r0, [r2, #72]
	add	r0, r0, #2048
	add	r0, r0, #8
	bl	MEM_WritePhyWord
.L642:
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldr	r1, [r4, #20]
	cmp	r2, #1
	bne	.L677
	add	r2, r6, r7, lsl #2
	ldr	r0, [r2, #72]
	add	r0, r0, #2048
	add	r0, r0, #12
	bl	MEM_WritePhyWord
.L644:
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldr	r1, [r4, #24]
	cmp	r2, #1
	bne	.L678
	add	r2, r6, r7, lsl #2
	ldr	r0, [r2, #72]
	add	r0, r0, #2064
	bl	MEM_WritePhyWord
.L646:
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldr	r1, [r4, #28]
	cmp	r2, #1
	bne	.L679
	add	r2, r6, r7, lsl #2
	ldr	r0, [r2, #72]
	add	r0, r0, #2064
	add	r0, r0, #4
	bl	MEM_WritePhyWord
.L648:
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldr	r1, [r4, #32]
	cmp	r2, #1
	bne	.L680
	add	r2, r6, r7, lsl #2
	ldr	r0, [r2, #72]
	add	r0, r0, #2064
	add	r0, r0, #8
	bl	MEM_WritePhyWord
.L650:
	mov	r10, r9, asl #3
	ldr	r3, .L695+8
	add	r2, r6, r10
	ldr	r2, [r2, #76]
	add	r2, r2, #425984
	ldr	r1, [r2, #456]
	cmp	r1, #1
	beq	.L681
	ldr	r1, [r2, #440]
	mov	r0, #3
	movt	r0, 768
	cmp	r1, r0
	beq	.L682
.L656:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L683
	add	r3, r6, r7, lsl #2
	ldr	r0, [r3, #72]
	add	r0, r0, #2096
	add	r0, r0, #12
	bl	MEM_WritePhyWord
.L661:
	add	r10, r6, r10
	ldrb	r1, [r5]	@ zero_extendqisi2
	ldr	r2, .L695+8
	ldr	r3, [r10, #76]
	cmp	r1, #1
	add	r3, r3, #425984
	add	r3, r3, #436
	ldrh	r1, [r3]
	bne	.L684
	add	r2, r2, r7, lsl #2
	ldr	r0, [r2, #72]
	add	r0, r0, #2112
	add	r0, r0, #4
	bl	MEM_WritePhyWord
.L655:
	ldr	r3, [r4, #52]
	ldr	r0, [r4, #44]
	ldr	r2, [r4, #36]
	mov	r3, r3, asl #9
	ldrb	r1, [r4, #1]	@ zero_extendqisi2
	orr	r3, r3, r0, asl #8
	and	r2, r2, #15
	orr	r2, r3, r2
	ldrb	r0, [r5]	@ zero_extendqisi2
	ldr	r3, [r4, #48]
	mov	r1, r1, asl #4
	cmp	r0, #1
	and	r1, r1, #16
	orr	r3, r2, r3, asl #13
	orr	r1, r3, r1
	bne	.L685
	add	r3, r6, r7, lsl #2
	ldr	r0, [r3, #72]
	add	r0, r0, #2080
	bl	MEM_WritePhyWord
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L686
.L665:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L687
	add	r3, r6, r7, lsl #2
	mov	r1, #0
	ldr	r10, .L695
	ldr	r0, [r3, #72]
	add	r0, r0, #2064
	add	r0, r0, #12
	bl	MEM_WritePhyWord
	ldrb	r5, [r5]	@ zero_extendqisi2
	cmp	r5, #1
	beq	.L669
.L690:
	ldr	r2, [r4, #44]
	sub	r0, fp, #232
	mov	r3, #0
	str	r9, [fp, #-224]
	strb	r7, [fp, #-232]
	strb	r2, [fp, #-231]
	str	r3, [fp, #-228]
	bl	VDH_PostTask
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L682:
	add	r2, r2, #436
	ldrh	r2, [r2]
	cmp	r2, #0
	bne	.L656
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L688
	add	r3, r3, r7, lsl #2
	mov	r1, #3
	ldr	r0, [r3, #72]
	add	r0, r0, #2096
	add	r0, r0, #12
	bl	MEM_WritePhyWord
.L658:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L689
	add	r3, r6, r7, lsl #2
	mov	r1, #0
	ldr	r0, [r3, #72]
	add	r0, r0, #2112
	add	r0, r0, #4
	bl	MEM_WritePhyWord
	b	.L655
.L683:
	mov	r3, r1
	movw	r2, #2108
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L661
.L687:
	mov	r3, #0
	movw	r2, #2076
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	ldrb	r5, [r5]	@ zero_extendqisi2
	ldr	r10, .L695
	cmp	r5, #1
	bne	.L690
.L669:
	add	r6, r6, r7, lsl #2
	mov	r1, #0
	ldr	r0, [r6, #72]
	add	r0, r0, #2048
	bl	MEM_WritePhyWord
	ldrb	r3, [r10]	@ zero_extendqisi2
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	cmp	r3, #1
	and	r1, r1, #1
	bne	.L691
	ldr	r0, [r6, #72]
	add	r0, r0, #2048
	bl	MEM_WritePhyWord
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L685:
	mov	r3, r1
	mov	r2, #2080
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L665
.L686:
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldr	r1, [r4, #60]
	cmp	r2, #1
	bne	.L692
	add	r2, r6, r7, lsl #2
	ldr	r0, [r2, #72]
	bl	MEM_WritePhyWord
	b	.L665
.L680:
	mov	r3, r1
	movw	r2, #2072
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L650
.L679:
	mov	r3, r1
	movw	r2, #2068
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L648
.L678:
	mov	r3, r1
	mov	r2, #2064
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L646
.L677:
	mov	r3, r1
	movw	r2, #2060
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L644
.L676:
	mov	r3, r1
	movw	r2, #2056
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L642
.L675:
	mov	r3, r1
	movw	r2, #2052
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	ldr	r6, .L695+8
	b	.L640
.L684:
	mov	r3, r1
	movw	r2, #2116
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L655
.L637:
	mov	r0, r2
	mov	r8, #0
	bl	ResetSCD
	b	.L638
.L692:
	mov	r3, r1
	mov	r2, #0
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L665
.L691:
	mov	r3, r1
	mov	r0, r8
	mov	r1, r5
	mov	r2, #2048
	bl	VDH_Record_RegData
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L681:
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L693
	add	r3, r3, r7, lsl #2
	mvn	r1, #0
	ldr	r0, [r3, #72]
	add	r0, r0, #2096
	add	r0, r0, #12
	bl	MEM_WritePhyWord
.L653:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L694
	add	r3, r6, r7, lsl #2
	mvn	r1, #0
	ldr	r0, [r3, #72]
	add	r0, r0, #2112
	add	r0, r0, #4
	bl	MEM_WritePhyWord
	b	.L655
.L693:
	mvn	r3, #0
	movw	r2, #2108
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L653
.L694:
	mvn	r3, #0
	movw	r2, #2116
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L655
.L688:
	mov	r3, #3
	movw	r2, #2108
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L658
.L689:
	mov	r3, #0
	movw	r2, #2116
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L655
.L696:
	.align	2
.L695:
	.word	g_HalDisable
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	WriteScdVtrlReg, .-WriteScdVtrlReg
	.align	2
	.global	WriteScdMsg
	.type	WriteScdMsg, %function
WriteScdMsg:
	UNWIND(.fnstart)
	@ args = 12, pretend = 0, frame = 136
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #140)
	sub	sp, sp, #140
	mov	r0, r0, asl #3
	mov	r10, r1
	str	r1, [fp, #-148]
	mov	r4, r0
	mov	r8, r2
	str	r2, [fp, #-164]
	mov	r1, #0
	str	r0, [fp, #-168]
	mov	r2, #96
	sub	r0, fp, #140
	mov	r7, r3
	str	r3, [fp, #-160]
	bl	memset
	ldr	r3, .L757
	mov	r2, #16384
	mov	r1, #0
	add	r3, r3, r4
	ldr	r3, [r3, #76]
	mov	r0, r3
	str	r3, [fp, #-172]
	ldr	r3, .L757+4
	add	r0, r0, #425984
	str	r0, [fp, #-176]
	mov	r5, r0
	add	r0, r0, #560
	ldr	r3, [r3, #48]
	add	r4, r5, #448
	str	r0, [fp, #-144]
	blx	r3
	sub	r1, fp, #140
	mov	r0, r7
	bl	GetFirstRawPacket
	ldr	r9, [fp, #-128]
	ldr	r3, [fp, #4]
	add	r6, r5, #444
	cmp	r9, r8
	mov	r5, #0
	str	r5, [r3]
	str	r5, [r3, #4]
	str	r5, [r3, #8]
	str	r5, [r10, #4]
	bgt	.L698
	add	r8, r7, #98304
	mov	r10, r5
	mov	r7, r5
	mov	r2, r9
	str	r6, [fp, #-152]
	str	r4, [fp, #-156]
.L701:
	ldr	r1, [fp, #4]
	mov	r3, r7, asl #2
	cmp	r2, #0
	mov	r0, r5, asl #4
	add	ip, r1, r3
	ldr	r1, [fp, #8]
	add	r3, r3, #12
	add	r10, r10, #1
	add	r3, r3, r1
	ldr	r1, [fp, #-144]
	add	lr, r1, r0
	ble	.L699
	ldr	r1, [fp, #-136]
	add	r5, r5, #1
	ldr	r6, [fp, #-136]
	ldr	r4, [fp, #4]
	sub	r1, r1, #1
	add	r1, r1, r2
	str	r6, [r4, r7, asl #2]
	add	r7, r7, #3
	str	r3, [ip, #8]
	str	r1, [ip, #4]
	ldrd	r2, [fp, #-100]
	ldr	r1, [fp, #-144]
	strd	r2, [r1, r0]
	ldrd	r2, [fp, #-100]
	ldr	r1, [fp, #-128]
	subs	r2, r2, #1
	sbc	r3, r3, #0
	adds	r2, r2, r1
	adc	r3, r3, r1, asr #31
	strd	r2, [lr, #8]
	mov	r3, #0
	str	r3, [fp, #-128]
.L699:
	ldr	r3, [fp, #-148]
	str	r9, [r3, #4]
	ldr	r3, [r8, #16]
	cmp	r3, #1024
	bcc	.L754
.L700:
	ldr	r3, [fp, #12]
	ldr	r6, [fp, #-152]
	cmp	r3, #0
	ldr	r4, [fp, #-156]
	bne	.L702
	ldr	r2, [fp, #-128]
	cmp	r2, #0
	bne	.L720
.L702:
	cmp	r10, #0
	beq	.L719
	cmp	r7, #0
	subgt	r7, r7, #-1073741823
	ldrgt	r2, [fp, #4]
	movgt	r3, #0
	strgt	r3, [r2, r7, asl #2]
	ldr	r2, [fp, #-168]
	ldr	r3, .L757
	add	r3, r3, r2
	ldr	r2, [fp, #-148]
	ldr	r3, [r3, #76]
	ldr	r2, [r2, #4]
	add	r3, r3, #425984
	add	r0, r3, #444
	cmp	r2, #6
	ldr	ip, [r3, #448]
	add	r1, r3, #436
	movge	r2, #6
	cmp	r2, #5
	str	ip, [r3, #440]
	ldrh	r3, [r0]
	strh	r3, [r1]	@ movhi
	bls	.L755
.L722:
	mov	r8, #2
	mov	r2, #4
.L706:
	cmp	r5, #0
	ldrgt	r3, [fp, #-144]
	addgt	r9, r3, r5, lsl #4
	ble	.L715
.L718:
	ldr	r1, [r9, #-8]
	ldr	r0, [r9, #-16]
	add	r3, r1, #1
	rsb	r0, r0, r3
	cmp	r0, r2
	movcc	lr, r0
	movcs	lr, r2
	cmp	r2, #0
	beq	.L711
	cmp	lr, #0
	beq	.L714
	add	ip, r4, lr
.L713:
	ldrb	r7, [r3, #-1]!	@ zero_extendqisi2
	strb	r7, [r4], #1
	cmp	r4, ip
	bne	.L713
	subs	r2, r2, lr
	beq	.L711
.L714:
	subs	r5, r5, #1
	sub	r9, r9, #16
	bne	.L718
.L715:
	ldr	r2, [fp, #-148]
	mov	r0, #0
	mov	r3, #1
	str	r10, [r2]
	str	r3, [r2, #8]
.L750:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L711:
	cmp	r8, #0
	beq	.L715
	rsb	r0, lr, r0
	rsb	r1, lr, r1
	cmp	r0, r8
	movcs	r0, r8
	cmp	r0, #0
	beq	.L716
	add	r1, r1, #1
	add	r2, r6, r0
.L717:
	ldrb	r3, [r1, #-1]!	@ zero_extendqisi2
	strb	r3, [r6], #1
	cmp	r6, r2
	bne	.L717
	subs	r8, r8, r0
	beq	.L715
	mov	r2, #0
	b	.L714
.L754:
	ldr	ip, [fp, #-160]
	mov	r1, r3, asl #7
	sub	r1, r1, r3, asl #5
	mov	r2, #96
	add	r1, ip, r1
	ldr	ip, [r8, #4]
	sub	r0, fp, #140
	cmp	r3, ip
	beq	.L700
	ldr	r3, .L757+4
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, [r8, #16]
	ldr	r2, [fp, #-128]
	ldr	r0, [fp, #-164]
	add	r3, r3, #1
	add	r9, r9, r2
	cmp	r0, r9
	mov	r1, r3, asr #31
	movge	r0, #1
	movlt	r0, #0
	cmp	r10, #1024
	mov	r1, r1, lsr #22
	add	r3, r3, r1
	movge	r0, #0
	cmp	r0, #0
	ubfx	r3, r3, #0, #10
	rsb	r3, r1, r3
	str	r3, [r8, #16]
	bne	.L701
	b	.L700
.L755:
	cmp	r2, #1
	beq	.L756
	rsbs	r0, r2, #6
	rsb	lr, r2, #5
	beq	.L722
	ldr	r3, [fp, #-172]
	movw	ip, #33214
	add	lr, r4, lr
	movt	ip, 6
	add	ip, r3, ip
	mov	r3, #2
.L708:
	subs	r0, r0, #1
	rsb	r7, r3, #3
	sub	r8, r3, #1
	ldrb	r1, [lr], #-1	@ zero_extendqisi2
	movne	r3, #1
	moveq	r3, #0
	cmp	r7, #1
	movhi	r3, #0
	andls	r3, r3, #1
	cmp	r3, #0
	strb	r1, [ip, #-1]!
	mov	r3, r8
	bne	.L708
	cmp	r8, #0
	bne	.L753
	cmp	r0, #0
	rsb	r2, r2, #3
	beq	.L724
	ldr	r3, [fp, #-176]
	rsb	ip, r0, r2
	add	ip, r4, ip
	add	r1, r3, #452
	add	r3, r4, r2
.L709:
	ldrb	r2, [r3], #-1	@ zero_extendqisi2
	cmp	r3, ip
	strb	r2, [r1, #-1]!
	bne	.L709
	rsb	r2, r0, #4
	b	.L706
.L698:
	ldr	r3, [fp, #12]
	cmp	r3, #0
	bne	.L719
	cmp	r9, #0
	beq	.L719
	ldr	r5, [fp, #12]
	mov	r2, r9
	mov	r7, r5
	mov	r10, r5
.L720:
	ldr	r3, [fp, #-148]
	ldr	r1, [fp, #-164]
	ldr	r3, [r3, #4]
	sub	r1, r1, #16
	cmp	r3, r1
	bge	.L702
	ldr	r1, [fp, #-164]
	cmp	r1, r9
	cmplt	r10, #1024
	bge	.L702
	rsb	r3, r3, r1
	cmp	r3, r2
	bgt	.L702
	ldr	r2, [fp, #-136]
	mov	r1, r7, asl #2
	ldr	lr, [fp, #4]
	add	r0, r1, #12
	ldr	ip, [fp, #4]
	add	r10, r10, #1
	str	r3, [fp, #-128]
	str	r2, [lr, r7, asl #2]
	add	r1, ip, r1
	sub	r2, r2, #1
	ldr	ip, [fp, #8]
	add	r2, r2, r3
	ldrd	r8, [fp, #-100]
	ldr	r3, [fp, #-144]
	add	r0, r0, ip
	mov	ip, r5, asl #4
	str	r0, [r1, #8]
	str	r2, [r1, #4]
	add	r0, r3, ip
	strd	r8, [r3, ip]
	mov	r1, #0
	ldrd	r2, [fp, #-100]
	add	r7, r7, #3
	ldr	ip, [fp, #-128]
	add	r5, r5, #1
	subs	r2, r2, #1
	sbc	r3, r3, #0
	adds	r2, r2, ip
	adc	r3, r3, ip, asr #31
	strd	r2, [r0, #8]
	ldr	r0, [fp, #-148]
	ldr	r2, [fp, #-128]
	str	r1, [fp, #-128]
	ldr	r3, [r0, #4]
	add	r3, r3, r2
	mov	r2, r0
	str	r3, [r0, #4]
	b	.L702
.L716:
	mov	r2, r0
	b	.L714
.L724:
.L753:
	mov	r2, #4
	b	.L706
.L756:
	ldr	ip, [fp, #-176]
	mov	r8, #0
	ldrb	r1, [ip, #444]	@ zero_extendqisi2
	ldrb	r3, [ip, #451]	@ zero_extendqisi2
	ldrb	r0, [ip, #450]	@ zero_extendqisi2
	strb	r1, [ip, #445]
	strb	r3, [ip, #444]
	ldrb	r1, [ip, #449]	@ zero_extendqisi2
	ldrb	r3, [ip, #448]	@ zero_extendqisi2
	strb	r0, [ip, #451]
	strb	r1, [ip, #450]
	strb	r3, [ip, #449]
	b	.L706
.L719:
	mvn	r0, #5
	b	.L750
.L758:
	.align	2
.L757:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	WriteScdMsg, .-WriteScdMsg
	.align	2
	.global	SCDDRV_StartSCD
	.type	SCDDRV_StartSCD, %function
SCDDRV_StartSCD:
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
	UNWIND(.pad #28)
	sub	sp, sp, #28
	add	r4, r1, #425984
	str	r3, [fp, #-52]
	mov	r7, r0
	ldr	r3, [r4, #184]
	mov	r9, r2
	ldr	r0, [r4, #212]
	add	r5, r1, #80
	ldr	r10, [r4, #176]
	add	r6, r4, #160
	str	r3, [fp, #-48]
	bl	VCTRL_IfEsBufEnable
	cmp	r0, #0
	beq	.L763
	ldr	r8, .L764
	mov	r2, #12
	mov	r1, #0
	mov	r0, r6
	ldr	r3, [r8, #48]
	blx	r3
	ldr	ip, [r7, #44]
	ldr	r2, [fp, #-48]
	mov	r3, r5
	ldr	r0, [r4, #212]
	mov	r1, r6
	str	r10, [sp]
	str	r2, [sp, #4]
	mov	r2, r9
	str	ip, [sp, #8]
	bl	WriteScdMsg
	subs	r5, r0, #0
	movne	r0, r5
	bne	.L761
	ldr	r3, [r8]
	blx	r3
	ldr	ip, [fp, #-52]
	ldr	r3, .L764+4
	mov	r1, r7
	add	r10, r3, ip, lsl #6
	mov	r2, ip
	str	r0, [r10, #52]
	ldr	r0, [r4, #212]
	bl	WriteScdVtrlReg
	mov	r0, r5
.L761:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L763:
	ldr	r2, [r4, #212]
	mov	r0, #1
	ldr	r1, .L764+8
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L761
.L765:
	.align	2
.L764:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_VfmwGlobalStat
	.word	.LC23
	UNWIND(.fnend)
	.size	SCDDRV_StartSCD, .-SCDDRV_StartSCD
	.align	2
	.global	CutStreamWithSCD
	.type	CutStreamWithSCD, %function
CutStreamWithSCD:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #96)
	sub	sp, sp, #96
	add	r6, r0, #425984
	mov	r7, r1
	add	r1, r0, #98304
	ldr	r2, [r6, #464]
	sub	r3, fp, #96
	mov	r5, r0
	str	r3, [sp, #8]
	add	r1, r1, #104
	sub	r3, fp, #104
	add	r0, r0, #80
	str	r3, [sp, #4]
	sub	r3, fp, #100
	str	r3, [sp]
	sub	r3, fp, #108
	mov	ip, #0
	str	ip, [fp, #-108]
	str	ip, [fp, #-104]
	str	ip, [fp, #-100]
	str	ip, [fp, #-96]
	bl	SCDDRV_CheckConditionOfStartSCD
	subs	r4, r0, #0
	bne	.L777
	ldr	r3, [fp, #-96]
	cmp	r3, #0
	bne	.L778
.L769:
	mov	r1, r7
	ldr	r0, [r6, #212]
	bl	SM_CfgBuf
	subs	r4, r0, #0
	bne	.L779
	ldr	r2, [fp, #-104]
	mov	r0, r5
	ldr	r3, [r6, #284]
	sub	r1, fp, #92
	str	r2, [r6, #200]
	mul	r3, r3, r2
	mov	r3, r3, asl #2
	str	r3, [r6, #196]
	bl	SCDDRV_SetCtrlReg
	ldr	r2, [fp, #-100]
	mov	r3, r7
	sub	r0, fp, #92
	mov	r1, r5
	bl	SCDDRV_StartSCD
	cmp	r0, #0
	movne	r2, r0
	bne	.L768
	ldr	r3, [fp, #-100]
	mov	r2, #1
	ldr	r1, [fp, #-108]
	mov	r4, #0
	cmp	r1, r3
	str	r3, [r6, #260]
	str	r1, [r6, #256]
	movls	r3, #1
	strlsb	r3, [r5, #2]
	ldr	r3, .L780
	strhib	r0, [r5, #2]
	str	r2, [r6, #220]
	strb	r4, [r5, #3]
	ldr	r3, [r3]
	blx	r3
	mov	r2, r4
	str	r0, [r6, #280]
.L768:
	mov	r0, r2
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L779:
	mov	r2, r4
	ldr	r1, .L780+4
	mov	r0, #26
	bl	dprint_vfmw
	mov	r2, r4
	mov	r0, r2
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L778:
	mov	r0, r5
	bl	ResetLastUnfinishedSegInfo
	b	.L769
.L777:
	mov	r2, r4
	ldr	r1, .L780+8
	mov	r0, #26
	bl	dprint_vfmw
	mov	r2, r4
	mov	r0, r2
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L781:
	.align	2
.L780:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC25
	.word	.LC24
	UNWIND(.fnend)
	.size	CutStreamWithSCD, .-CutStreamWithSCD
	.align	2
	.global	ReadScdStateReg
	.type	ReadScdStateReg, %function
ReadScdStateReg:
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
	ldr	r4, .L783
	mov	r5, r0
	movw	r6, #2124
	add	r4, r4, r1, lsl #2
	ldr	r0, [r4, #72]
	add	r0, r0, #2112
	bl	MEM_ReadPhyWord
	and	r0, r0, #1
	str	r0, [r5]
	ldr	r0, [r4, #72]
	add	r0, r6, r0
	bl	MEM_ReadPhyWord
	ldr	r2, [r4, #72]
	mov	r3, r0, lsr #22
	add	r0, r6, r2
	str	r3, [r5, #8]
	bl	MEM_ReadPhyWord
	ldr	r2, [r4, #72]
	ubfx	r3, r0, #0, #22
	add	r0, r2, #2128
	str	r3, [r5, #12]
	bl	MEM_ReadPhyWord
	ldr	r3, [r4, #72]
	str	r0, [r5, #16]
	add	r0, r3, #2128
	add	r0, r0, #4
	bl	MEM_ReadPhyWord
	ldr	r3, [r4, #72]
	str	r0, [r5, #20]
	add	r0, r3, #2048
	add	r0, r0, #12
	bl	MEM_ReadPhyWord
	ldr	r3, [r4, #72]
	str	r0, [r5, #24]
	add	r0, r3, #2128
	add	r0, r0, #12
	bl	MEM_ReadPhyWord
	str	r0, [r5, #28]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L784:
	.align	2
.L783:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	ReadScdStateReg, .-ReadScdStateReg
	.align	2
	.global	ParseMpeg4UniqueUpMsg
	.type	ParseMpeg4UniqueUpMsg, %function
ParseMpeg4UniqueUpMsg:
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
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r0, #1
	bfceq	r3, #0, #1
	orrne	r3, r3, #1
	strb	r3, [r1]
	ldr	r3, [r2, #4]
	ldrb	r0, [r1]	@ zero_extendqisi2
	mov	r3, r3, lsr #30
	bfi	r0, r3, #1, #1
	strb	r0, [r1]
	ldrh	r0, [r2, #10]
	ldrb	r3, [r1]	@ zero_extendqisi2
	bfi	r3, r0, #2, #1
	strb	r3, [r1]
	ldr	r3, [r2, #8]
	ldrb	r0, [r1]	@ zero_extendqisi2
	ubfx	r3, r3, #4, #3
	bfi	r0, r3, #3, #4
	strb	r0, [r1]
	ldr	r3, [r2, #8]
	ldrh	r2, [r1]
	and	r3, r3, #7
	bfi	r2, r3, #7, #4
	strh	r2, [r1]	@ movhi
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	ParseMpeg4UniqueUpMsg, .-ParseMpeg4UniqueUpMsg
	.align	2
	.global	ConvertByteOrder
	.type	ConvertByteOrder, %function
ConvertByteOrder:
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
	ldrb	r1, [r0, #3]	@ zero_extendqisi2
	mov	r2, r2, asl #16
	ldrb	r0, [r0, #2]	@ zero_extendqisi2
	orr	r3, r2, r3, asl #24
	orr	r3, r3, r1
	orr	r0, r3, r0, asl #8
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	ConvertByteOrder, .-ConvertByteOrder
	.align	2
	.global	CheckSegValid
	.type	CheckSegValid, %function
CheckSegValid:
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
	beq	.L794
	ldr	r3, [r0, #12]
	cmp	r3, #0
	beq	.L796
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L796
	cmp	r1, #0
	beq	.L791
	add	r1, r1, #327680
	ldr	r2, [r1, #36]
	ldr	r3, [r1, #32]
	cmp	r2, r3
	bls	.L792
	ldr	r1, [r1, #28]
	sub	r3, r3, #1
	add	r3, r3, r1
	rsb	r1, r2, r3
.L791:
	ldr	r3, [r0, #16]
	cmp	r3, r1
	mvnhi	r0, #6
	movls	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L792:
	ldrcs	r1, [r1, #28]
	subcc	r3, r3, #1
	rsbcc	r1, r2, r3
	subcs	r1, r1, #1
	b	.L791
.L796:
	mvn	r0, #6
	ldmfd	sp, {fp, sp, pc}
.L794:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	CheckSegValid, .-CheckSegValid
	.align	2
	.global	GetSegPts
	.type	GetSegPts, %function
GetSegPts:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 16
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
	mov	r4, r3
	mov	r5, r2
	sub	r3, fp, #36
	sub	r2, fp, #32
	str	r2, [sp]
	sub	r2, fp, #40
	mov	ip, #0
	mov	r6, r0
	str	ip, [fp, #-40]
	str	ip, [fp, #-36]
	str	ip, [fp, #-32]
	bl	GetRawNumOffset
	ldr	r0, [fp, #-32]
	mov	r3, r0, asl #7
	sub	r0, r3, r0, asl #5
	add	r0, r6, r0
	ldrd	r6, [r0, #64]
	strd	r6, [r4, #24]
	ldrd	r2, [r0, #48]
	strd	r2, [r4, #40]
	ldrd	r2, [r0, #64]
	strd	r2, [r4, #32]
	ldrd	r2, [r0, #56]
	strd	r2, [r4, #48]
	ldr	r3, [r0, #24]
	str	r3, [r4, #56]
	ldr	r3, [r0, #28]
	str	r3, [r4, #60]
	ldr	r3, [r0, #32]
	str	r3, [r4, #64]
	ldr	r3, [r0, #36]
	str	r3, [r4, #68]
	ldrb	r3, [r0, #92]	@ zero_extendqisi2
	strb	r3, [r4, #8]
	ldrd	r2, [r5]
	cmp	r7, r3
	cmpeq	r6, r2
	beq	.L802
.L800:
	strd	r6, [r5]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L802:
	ldr	r3, .L803
	ldr	r2, [fp, #4]
	ldr	r3, [r3, r2, asl #2]
	add	r3, r3, #475136
	ldr	r3, [r3, #1668]
	cmp	r3, #0
	bne	.L800
	mvn	r2, #0
	mvn	r3, #0
	strd	r2, [r4, #24]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L804:
	.align	2
.L803:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	GetSegPts, .-GetSegPts
	.align	2
	.global	IsVopHeader
	.type	IsVopHeader, %function
IsVopHeader:
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
	cmp	r0, #1
	beq	.L810
	cmp	r0, #2
	movne	r0, #0
	beq	.L811
.L807:
	mov	r2, #0
	movt	r2, 65025
	cmp	r1, r2
	moveq	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L810:
	mov	r3, #0
	movt	r3, 46593
	rsb	r0, r3, r1
	clz	r0, r0
	mov	r0, r0, lsr #5
	b	.L807
.L811:
	ubfx	r3, r1, #16, #8
	sub	r3, r3, #128
	cmp	r3, #3
	movhi	r0, #0
	movls	r0, #1
	b	.L807
	UNWIND(.fnend)
	.size	IsVopHeader, .-IsVopHeader
	.align	2
	.global	GetNextVop
	.type	GetNextVop, %function
GetNextVop:
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
	add	lr, r0, #98304
	cmn	lr, #104
	addne	ip, r0, #425984
	moveq	r8, #4096
	ldrne	r8, [ip, #112]
	ldrne	r3, [ip, #116]
	rsbne	r8, r8, r3
	sub	r3, r2, #1
	ubfxne	r8, r8, #0, #12
	rsbne	r8, r8, #4096
	cmp	r3, #0
	mov	ip, r3
	blt	.L822
	add	r0, r0, #425984
	mov	r4, #0
	mov	r9, r4
	ldr	r7, [lr, #104]
	ldr	r5, [r0, #284]
	movt	r4, 65025
	ldr	r6, [r0, #128]
	movt	r9, 46593
	ldr	lr, [r0, #232]
	mov	r5, r5, asl #2
	mla	r1, r5, r3, r1
	b	.L820
.L825:
	cmp	lr, #2
	beq	.L824
	cmp	r2, r4
	beq	.L818
.L819:
	sub	ip, ip, #1
	rsb	r1, r5, r1
	cmn	ip, #1
	mov	r2, r3
	beq	.L822
	sub	r3, r3, #1
.L820:
	ldr	r2, [r1]
	cmp	lr, #1
	rsb	r2, r6, r2
	ldr	r2, [r7, r2]
	rsbeq	r0, r9, r2
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	bne	.L825
.L816:
	cmp	r2, r4
	beq	.L818
	cmp	r0, #1
	bne	.L819
.L818:
	cmp	r3, r8
	mov	r2, r3
	bls	.L822
	sub	r3, r3, #1
	b	.L819
.L824:
	ubfx	r0, r2, #16, #8
	sub	r0, r0, #128
	cmp	r0, #3
	movhi	r0, #0
	movls	r0, #1
	b	.L816
.L822:
	mov	r0, r2
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetNextVop, .-GetNextVop
	.align	2
	.global	CorrectRollPhyAddr
	.type	CorrectRollPhyAddr, %function
CorrectRollPhyAddr:
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
	cmp	r1, r2
	rsbcc	r1, r2, r1
	addcc	r0, r1, r0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	CorrectRollPhyAddr, .-CorrectRollPhyAddr
	.align	2
	.global	CorrectSegNextAddr
	.type	CorrectSegNextAddr, %function
CorrectSegNextAddr:
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
	cmp	r0, r1
	movcc	r0, r1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	CorrectSegNextAddr, .-CorrectSegNextAddr
	.align	2
	.global	SetLastUnfinishedSegInfo
	.type	SetLastUnfinishedSegInfo, %function
SetLastUnfinishedSegInfo:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #92)
	sub	sp, sp, #92
	add	r4, r0, #425984
	mov	r5, r0
	mov	r9, r1
	ldr	r8, [r4, #284]
	mov	r7, r2
	mov	r1, #0
	mov	r2, #80
	sub	r0, fp, #124
	ldr	r6, [r4, #188]
	bl	memset
	mul	ip, r8, r9
	ldr	lr, [r4, #212]
	add	r8, r4, #480
	add	r2, r4, #248
	add	r0, r5, #80
	add	r9, r5, #98304
	add	ip, ip, #1
	mov	r3, r8
	ldr	r1, [r6, ip, asl #2]
	mov	r10, ip, asl #2
	str	lr, [sp]
	bic	r1, r1, #-1073741824
	bl	GetSegPts
	ldr	r3, .L845
	mov	r1, r8
	mov	r2, #80
	sub	r0, fp, #124
	add	r8, r9, #104
	ldr	r3, [r3, #52]
	blx	r3
	add	ip, r6, r10
	ldr	r2, [r4, #128]
	ldr	ip, [ip, #-4]
	str	ip, [r4, #460]
	ldr	r3, [r7, #28]
	cmp	r2, r3
	movcs	r3, r2
	cmp	ip, r3
	str	r3, [r4, #452]
	bls	.L831
	mov	r1, #1
	str	r1, [r4, #468]
	ldr	r0, [r7, #28]
	rsb	r6, r2, r3
	ldr	r1, [r7, #16]
	cmp	r2, r0
	addhi	r1, r0, r1
	rsbhi	r1, r2, r1
	str	r1, [r4, #472]
	rsb	lr, ip, r1
	add	r1, lr, r6
	str	r1, [r4, #464]
	ldr	r3, [r5, #48]
	cmp	r3, #1
	beq	.L844
.L834:
	mov	r3, #0
	str	r3, [r4, #456]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L831:
	rsb	r3, ip, r3
	mov	r1, #0
	cmp	r3, #3
	str	r1, [r4, #468]
	str	r1, [r4, #472]
	str	r3, [r4, #464]
	movls	r1, #0
	ldr	r0, [r5, #48]
	movhi	r1, #1
	cmp	r0, #1
	movne	r1, #0
	cmp	r1, #0
	beq	.L834
	ldr	r5, [r9, #104]
	rsb	lr, r2, ip
	sub	r1, fp, #124
	mov	r0, r8
	ldr	r2, [r4, #212]
	add	lr, r5, lr
	str	ip, [fp, #-112]
	mov	r5, #1
	mov	ip, #2
	str	lr, [fp, #-124]
	str	r3, [fp, #-108]
	strb	r5, [fp, #-118]
	strb	ip, [fp, #-119]
	bl	InsertStreamSeg
	b	.L834
.L844:
	cmp	r8, #0
	beq	.L835
	ldr	r3, [r4, #116]
	ldr	r0, [r4, #112]
	rsb	r3, r0, r3
	ubfx	r3, r3, #0, #12
	rsb	r3, r3, #4096
	cmp	r3, #3
	movls	r3, #0
	movhi	r3, #1
.L835:
	cmp	r1, #3
	movls	r3, #0
	andhi	r3, r3, #1
	cmp	r3, #0
	beq	.L834
	ldr	r3, [r9, #104]
	rsb	r0, r2, ip
	sub	r1, fp, #124
	ldr	r2, [r4, #212]
	add	r3, r3, r0
	mov	r0, r8
	str	ip, [fp, #-112]
	mov	r5, #2
	str	lr, [fp, #-108]
	str	r3, [fp, #-124]
	mov	r3, #0
	strb	r5, [fp, #-119]
	strb	r3, [fp, #-118]
	bl	InsertStreamSeg
	ldr	lr, [r9, #104]
	sub	r1, fp, #124
	ldr	ip, [r4, #128]
	mov	r0, r8
	ldr	r2, [r4, #212]
	mov	r3, #1
	strb	r5, [fp, #-119]
	str	lr, [fp, #-124]
	str	r6, [fp, #-108]
	str	ip, [fp, #-112]
	strb	r3, [fp, #-118]
	bl	InsertStreamSeg
	b	.L834
.L846:
	.align	2
.L845:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SetLastUnfinishedSegInfo, .-SetLastUnfinishedSegInfo
	.align	2
	.global	ProcessSegRoll
	.type	ProcessSegRoll, %function
ProcessSegRoll:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 16
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
	add	r5, r0, #425984
	mov	r4, r1
	add	r6, r0, #98304
	ldr	r1, [r5, #188]
	adds	r8, r6, #104
	ldr	r9, [r5, #128]
	ldr	r0, [r5, #460]
	ldr	r7, [r1]
	ldrsb	r1, [fp, #4]
	rsb	r2, r0, r2
	rsb	r7, r9, r7
	add	ip, r2, r7
	str	r1, [fp, #-56]
	beq	.L848
	ldr	lr, [r5, #112]
	cmp	ip, #3
	ldr	r1, [r5, #116]
	str	r0, [r4, #12]
	ldr	r10, [r5, #128]
	rsb	r1, lr, r1
	ldr	lr, [r6, #104]
	ubfx	r1, r1, #0, #12
	rsb	r0, r10, r0
	rsb	r1, r1, #4096
	add	r0, lr, r0
	str	ip, [r4, #16]
	str	r0, [r4]
	bls	.L854
	cmp	r1, #2
	bls	.L852
.L851:
	mov	r1, r8
	mov	r0, r4
	str	r3, [fp, #-52]
	str	r2, [fp, #-48]
	bl	CheckSegValid
	subs	r10, r0, #0
	bne	.L852
	ldr	r2, [fp, #-48]
	cmp	r7, #0
	ldr	r3, [fp, #-52]
	str	r2, [r4, #16]
	beq	.L856
	strb	r3, [r4, #5]
	mov	r1, r4
	strb	r10, [r4, #6]
	mov	r0, r8
	ldr	r2, [r5, #212]
	bl	InsertStreamSeg
	str	r9, [r4, #12]
	ldr	r2, [r5, #128]
	mov	ip, #1
	ldr	r3, [r6, #104]
	mov	r0, r8
	rsb	r9, r2, r9
	str	r7, [r4, #16]
	add	r9, r3, r9
	ldrb	r3, [fp, #-56]	@ zero_extendqisi2
	str	r9, [r4]
	mov	r1, r4
	strb	ip, [r4, #6]
	strb	r3, [r4, #5]
	ldr	r2, [r5, #212]
	bl	InsertStreamSeg
.L855:
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L856:
	strb	r3, [r4, #5]
	mov	r0, r8
	mov	r3, #1
	mov	r1, r4
	strb	r3, [r4, #6]
	ldr	r2, [r5, #212]
	bl	InsertStreamSeg
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L848:
	str	r0, [r4, #12]
	cmp	ip, #3
	ldr	lr, [r5, #128]
	ldr	r1, [r6, #104]
	rsb	r0, lr, r0
	str	ip, [r4, #16]
	add	r0, r1, r0
	str	r0, [r4]
	bhi	.L851
.L854:
	mov	r3, ip
	movw	r2, #2729
	ldr	r1, .L857
	mov	r0, #0
	bl	dprint_vfmw
	mov	r10, #0
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L852:
	mvn	r10, #3
	b	.L855
.L858:
	.align	2
.L857:
	.word	.LC26
	UNWIND(.fnend)
	.size	ProcessSegRoll, .-ProcessSegRoll
	.align	2
	.global	ProcessLastUnfinishedSeg
	.type	ProcessLastUnfinishedSeg, %function
ProcessLastUnfinishedSeg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #92)
	sub	sp, sp, #92
	add	r4, r0, #425984
	mov	r6, r2
	mov	r8, r1
	mov	r2, #80
	mov	r5, r0
	mov	r1, #0
	sub	r0, fp, #116
	bl	memset
	ldr	r3, [r6, #28]
	ldr	r2, [r4, #128]
	ldr	r7, [r6, #16]
	cmp	r2, r3
	addhi	r3, r3, r7
	rsbhi	r7, r2, r3
	cmp	r8, #0
	bne	.L861
	ldr	r3, [r4, #256]
	ldr	r1, [r4, #260]
	cmp	r3, r1
	movle	r3, #0
	movgt	r3, #1
	strb	r3, [r5]
	ldr	r0, [r4, #460]
	cmp	r0, #0
	ldreq	r1, [r4, #164]
	beq	.L863
	ldr	ip, [r4, #468]
	ldr	r3, [r4, #464]
	ldr	r1, [r4, #164]
	cmp	ip, #0
	add	r3, r1, r3
	str	r3, [r4, #464]
	bne	.L864
	ldr	r3, [r6, #28]
	cmp	r0, r3
	strhi	r7, [r4, #472]
	movhi	r3, #1
	strhi	r3, [r4, #468]
.L864:
	mov	r3, #0
	str	r3, [r4, #456]
	ldr	r3, [r6, #28]
	cmp	r3, r2
	movcc	r3, r2
	str	r3, [r4, #452]
.L863:
	add	r0, r5, #80
	bl	DeleteRawLen
.L865:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L861:
	mov	r6, #0
	strb	r6, [r5]
	ldr	r0, [r4, #460]
	cmp	r0, r6
	beq	.L865
	ldr	r3, .L873
	add	r1, r4, #480
	mov	r2, #80
	sub	r0, fp, #116
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r1, [r4, #468]
	cmp	r1, #1
	beq	.L871
	ldr	r0, [r4, #188]
	ldr	r3, [r4, #460]
	ldr	r2, [r0]
	cmp	r2, r3
	bcc	.L867
	add	r5, r5, #98304
	ldr	r2, [r4, #128]
	str	r3, [fp, #-104]
	mov	ip, #1
	ldr	r1, [r5, #104]
	rsb	r2, r2, r3
	add	r2, r1, r2
	str	r2, [fp, #-116]
	ldr	r2, [r0]
	strb	ip, [fp, #-110]
	rsb	r3, r3, r2
	strb	ip, [fp, #-111]
	cmp	r3, #3
	str	r3, [fp, #-100]
	bls	.L872
	add	r5, r5, #104
	sub	r0, fp, #116
	mov	r1, r5
	bl	CheckSegValid
	cmp	r0, #0
	bne	.L870
	ldr	r2, [r4, #212]
	sub	r1, fp, #116
	mov	r0, r5
	bl	InsertStreamSeg
	b	.L865
.L867:
	str	r6, [sp]
	mov	r2, r7
	sub	r1, fp, #116
	mov	r0, r5
	mov	r3, #1
	bl	ProcessSegRoll
	b	.L865
.L871:
	ldr	r2, [r4, #472]
	mov	r3, r1
	str	r1, [sp]
	mov	r0, r5
	sub	r1, fp, #116
	bl	ProcessSegRoll
	b	.L865
.L872:
	movw	r2, #2818
	ldr	r1, .L873+4
	mov	r0, r6
	bl	dprint_vfmw
	mov	r0, r6
	b	.L865
.L870:
	mvn	r0, #3
	b	.L865
.L874:
	.align	2
.L873:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC26
	UNWIND(.fnend)
	.size	ProcessLastUnfinishedSeg, .-ProcessLastUnfinishedSeg
	.align	2
	.global	SetPushRawOverState
	.type	SetPushRawOverState, %function
SetPushRawOverState:
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
	ldr	r3, [r0, #8]
	str	r1, [r0, #8]
	cmp	r1, #2
	cmpeq	r3, #3
	moveq	r3, #1
	movne	r3, #0
	mvneq	r3, #6
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SetPushRawOverState, .-SetPushRawOverState
	.align	2
	.global	ProcessExceptionalStartCodeNum
	.type	ProcessExceptionalStartCodeNum, %function
ProcessExceptionalStartCodeNum:
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
	movw	r2, #2857
	mov	r4, r0
	mov	r3, r1
	mov	r0, #0
	ldr	r1, .L879
	bl	dprint_vfmw
	add	r0, r4, #80
	mov	r1, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	DeleteRawPacket
.L880:
	.align	2
.L879:
	.word	.LC27
	UNWIND(.fnend)
	.size	ProcessExceptionalStartCodeNum, .-ProcessExceptionalStartCodeNum
	.global	__aeabi_uidiv
	.align	2
	.global	GetValidStartCodeNum
	.type	GetValidStartCodeNum, %function
GetValidStartCodeNum:
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
	ldr	r0, [r0, #24]
	bl	__aeabi_uidiv
	ldr	r3, [r4, #12]
	cmp	r0, r3
	movcs	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetValidStartCodeNum, .-GetValidStartCodeNum
	.align	2
	.global	ProcessNotMpeg4ScdUpMsg
	.type	ProcessNotMpeg4ScdUpMsg, %function
ProcessNotMpeg4ScdUpMsg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	add	r5, r0, #425984
	str	r1, [fp, #-132]
	mov	r4, r0
	ldr	r1, [r5, #284]
	add	r9, r0, #98304
	str	r2, [fp, #-152]
	add	r10, r9, #104
	ldr	r2, [r5, #188]
	mov	r3, r1, asl #2
	str	r1, [fp, #-160]
	mov	r1, #0
	str	r0, [fp, #-156]
	mov	ip, r2
	mov	lr, r3
	str	r2, [fp, #-164]
	mov	r8, r1
	str	r3, [fp, #-140]
	sub	r0, fp, #124
	mov	r3, ip
	mov	r2, #80
	add	ip, r3, lr
	mov	r6, r3
	str	ip, [fp, #-136]
	mov	r7, r8
	bl	memset
	add	r3, r4, #80
	str	r3, [fp, #-144]
	b	.L883
.L905:
	rsb	r3, r1, r4
	ldr	r2, [r5, #128]
	ldr	r0, [r9, #104]
	cmp	r3, #3
	rsb	r2, r2, r1
	str	r1, [fp, #-112]
	add	r2, r0, r2
	mov	r1, #1
	str	r3, [fp, #-108]
	str	r2, [fp, #-124]
	strb	r1, [fp, #-118]
	bls	.L904
	mov	r1, r10
	sub	r0, fp, #124
	bl	CheckSegValid
	cmp	r0, #0
	bne	.L890
	ldr	ip, [r5, #212]
	sub	r3, fp, #124
	strb	r0, [fp, #-119]
	add	r2, r5, #248
	ldr	r1, [r6, #4]
	ldr	r0, [fp, #-144]
	str	ip, [sp]
	bic	r1, r1, #-1073741824
	bl	GetSegPts
	ldr	r2, [r5, #212]
	sub	r1, fp, #124
	mov	r0, r10
	bl	InsertStreamSeg
	cmp	r0, #0
	bne	.L890
.L886:
	ldr	r3, [fp, #-140]
	ldr	r7, [fp, #-128]
	add	r6, r6, r3
	add	r8, r8, r3
.L883:
	ldr	r3, [fp, #-132]
	cmp	r7, r3
	beq	.L890
	add	r3, r7, #1
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-136]
	ldr	r1, [r6]
	ldr	r4, [r3, r8]
	cmp	r1, r4
	bls	.L905
	ldr	r3, [fp, #-152]
	cmp	r10, #0
	ldr	ip, [r5, #128]
	ldr	r2, [r3, #16]
	rsb	r4, ip, r4
	rsb	r2, r1, r2
	add	r3, r2, r4
	beq	.L891
	ldr	r0, [r5, #116]
	rsb	ip, ip, r1
	ldr	lr, [r5, #112]
	cmp	r3, #3
	str	r1, [fp, #-112]
	rsb	r0, lr, r0
	ldr	r1, [r9, #104]
	ubfx	r0, r0, #0, #12
	str	r3, [fp, #-108]
	add	ip, r1, ip
	rsb	r0, r0, #4096
	str	ip, [fp, #-124]
	bls	.L898
	cmp	r0, #2
	bls	.L890
.L899:
	mov	r1, r10
	sub	r0, fp, #124
	str	r2, [fp, #-148]
	bl	CheckSegValid
	subs	r3, r0, #0
	mov	r1, r3
	bne	.L890
	cmp	r4, #0
	ldr	ip, [r5, #212]
	ldr	r2, [fp, #-148]
	bne	.L893
	str	r2, [fp, #-108]
	mov	r1, #1
	strb	r4, [fp, #-119]
	add	r2, r5, #248
	strb	r1, [fp, #-118]
	sub	r3, fp, #124
	ldr	r1, [r6, #4]
	ldr	r0, [fp, #-144]
	str	ip, [sp]
	bic	r1, r1, #-1073741824
	bl	GetSegPts
	ldr	r2, [r5, #212]
	sub	r1, fp, #124
	mov	r0, r10
	bl	InsertStreamSeg
	b	.L886
.L893:
	str	r2, [fp, #-108]
	mov	r7, r1
	strb	r1, [fp, #-118]
	sub	r3, fp, #124
	strb	r1, [fp, #-119]
	add	r2, r5, #248
	ldr	r1, [r6, #4]
	ldr	r0, [fp, #-144]
	str	ip, [sp]
	bic	r1, r1, #-1073741824
	bl	GetSegPts
	ldr	r2, [r5, #212]
	sub	r1, fp, #124
	mov	r0, r10
	bl	InsertStreamSeg
	ldr	lr, [r5, #128]
	ldr	ip, [r9, #104]
	sub	r1, fp, #124
	ldr	r2, [r5, #212]
	mov	r0, r10
	mov	r3, #1
	str	r4, [fp, #-108]
	strb	r7, [fp, #-119]
	str	lr, [fp, #-112]
	str	ip, [fp, #-124]
	strb	r3, [fp, #-118]
	bl	InsertStreamSeg
	b	.L886
.L891:
	ldr	r0, [r9, #104]
	cmp	r3, #3
	rsb	ip, ip, r1
	str	r1, [fp, #-112]
	add	ip, r0, ip
	str	r3, [fp, #-108]
	str	ip, [fp, #-124]
	bhi	.L899
.L898:
	movw	r2, #2931
	ldr	r1, .L909
	mov	r0, #0
	bl	dprint_vfmw
	b	.L886
.L904:
	movw	r2, #2899
	ldr	r1, .L909
	mov	r0, #0
	bl	dprint_vfmw
	b	.L886
.L890:
	cmp	r7, #0
	ble	.L906
	ldr	r3, [fp, #-152]
	ldr	r1, [r3, #12]
	sub	r1, r1, #1
	cmp	r1, r7
	bhi	.L907
.L895:
	cmp	r1, r7
	beq	.L908
.L897:
	ldr	r2, [fp, #-152]
	mov	r1, #0
	ldr	r0, [fp, #-156]
	bl	SetLastUnfinishedSegInfo
.L882:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L906:
	blt	.L897
	ldr	r3, [fp, #-152]
	ldr	r1, [r3, #12]
	sub	r1, r1, #1
	b	.L895
.L907:
	ldr	r3, [fp, #-160]
	ldr	r2, [fp, #-164]
	ldr	r0, [fp, #-156]
	mul	r3, r3, r7
	add	r3, r3, #1
	ldr	r4, [r2, r3, asl #2]
	bl	ResetLastUnfinishedSegInfo
	ldr	r0, [fp, #-144]
	bic	r4, r4, #-1073741824
	mov	r1, r4
	bl	DeleteRawLen
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L908:
	ldr	r4, [r5, #164]
	ldr	r0, [fp, #-156]
	ldr	r2, [fp, #-152]
	bl	SetLastUnfinishedSegInfo
	mov	r1, r4
	ldr	r0, [fp, #-144]
	bl	DeleteRawLen
	b	.L882
.L910:
	.align	2
.L909:
	.word	.LC26
	UNWIND(.fnend)
	.size	ProcessNotMpeg4ScdUpMsg, .-ProcessNotMpeg4ScdUpMsg
	.align	2
	.global	GetMpeg4ModeFlag
	.type	GetMpeg4ModeFlag, %function
GetMpeg4ModeFlag:
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
	add	r6, r0, #425984
	subs	r8, r1, #0
	ldr	r7, [r6, #284]
	ldr	r4, [r6, #188]
	ldmeqib	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	mov	r7, r7, asl #2
	mov	r5, #0
	movw	r9, #438
	b	.L921
.L917:
	add	r5, r5, #1
	add	r4, r4, r7
	cmp	r5, r8
	beq	.L930
.L921:
	ldr	r0, [r4]
	bl	MEM_Phy2Vir
	mov	ip, #1
	mov	r1, #0
	cmp	r0, #0
	beq	.L931
	ldrb	lr, [r0, #1]	@ zero_extendqisi2
	ldrb	r3, [r0]	@ zero_extendqisi2
	ldrb	r2, [r0, #3]	@ zero_extendqisi2
	mov	lr, lr, asl #16
	ldrb	r0, [r0, #2]	@ zero_extendqisi2
	orr	r3, lr, r3, asl #24
	orr	r3, r3, r2
	orr	r3, r3, r0, asl #8
	bic	r2, r3, #1020
	cmp	r3, r9
	cmpne	r3, #288
	bic	r2, r2, #3
	streq	ip, [r6, #232]
	streq	r1, [r6, #236]
	cmp	r2, #32768
	bne	.L917
	ldr	r3, [r6, #232]
	cmp	r3, #1
	beq	.L918
.L920:
	add	r5, r5, #1
	mov	r3, #2
	cmp	r5, r8
	str	r3, [r6, #232]
	add	r4, r4, r7
	bne	.L921
.L930:
	ldmib	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L918:
	ldr	r3, [r6, #236]
	add	r3, r3, #1
	str	r3, [r6, #236]
	cmp	r3, #30
	bls	.L917
	ldr	r3, .L932
	mov	r1, #102
	ldr	r10, [r3]
	mov	r3, #0
	mov	r2, r3
	cmp	r10, r3
	beq	.L920
	ldr	r0, [r6, #212]
	blx	r10
	b	.L920
.L931:
	movw	r3, #3000
	ldr	r2, .L932+4
	ldr	r1, .L932+8
	mov	r0, ip
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L933:
	.align	2
.L932:
	.word	g_event_report
	.word	.LANCHOR3+88
	.word	.LC28
	UNWIND(.fnend)
	.size	GetMpeg4ModeFlag, .-GetMpeg4ModeFlag
	.align	2
	.global	ProcessMpeg4ScdUpMsg
	.type	ProcessMpeg4ScdUpMsg, %function
ProcessMpeg4ScdUpMsg:
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
	add	r5, r0, #425984
	mov	r7, r0
	mov	r8, r1
	ldr	r3, [r5, #284]
	mov	r10, r2
	str	r0, [fp, #-236]
	sub	r0, fp, #204
	str	r1, [fp, #-240]
	mov	r1, #0
	mov	r9, r3
	str	r3, [fp, #-244]
	ldr	r3, [r5, #188]
	mov	r9, r9, asl #2
	str	r2, [fp, #-232]
	mov	r2, #80
	mov	r6, r3
	str	r3, [fp, #-248]
	bl	memset
	mov	r2, #80
	mov	r1, #0
	sub	r0, fp, #124
	bl	memset
	ldr	r0, [r5, #128]
	bl	MEM_Phy2Vir
	mov	r4, r0
	ldr	r0, [r10, #16]
	bl	MEM_Phy2Vir
	ldr	r3, .L979
	mov	r1, r4
	mov	r2, #4
	mov	r4, r6
	ldr	r3, [r3, #52]
	blx	r3
	mov	r1, r8
	mov	r0, r7
	bl	GetMpeg4ModeFlag
	add	r3, r7, #98304
	mov	r2, r8
	mov	r1, r6
	mov	r0, r7
	mov	r6, r3
	str	r3, [fp, #-220]
	add	r3, r4, r9
	str	r3, [fp, #-216]
	bl	GetNextVop
	mov	r8, #0
	add	r3, r7, #80
	add	r6, r6, #104
	str	r3, [fp, #-224]
	mov	r7, r8
	str	r0, [fp, #-212]
	b	.L935
.L973:
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	beq	.L937
	ldr	r3, [fp, #-108]
	mov	r1, r6
	sub	r0, fp, #124
	add	r10, r3, r10
	str	r10, [fp, #-108]
	bl	CheckSegValid
	subs	r3, r0, #0
	bne	.L941
	ldr	r2, [r5, #212]
	sub	r1, fp, #124
	mov	r0, r6
	strb	r3, [fp, #-119]
	str	r3, [fp, #-228]
	bl	InsertStreamSeg
	ldr	r3, [fp, #-228]
	mov	r2, #80
	mov	r1, r3
	ldr	r3, .L979
	ldr	r3, [r3, #48]
	mov	r10, r0
	sub	r0, fp, #124
	blx	r3
	cmp	r10, #0
	bne	.L941
.L942:
	ldr	r7, [fp, #-208]
	add	r4, r4, r9
	add	r8, r8, r9
.L935:
	ldr	r3, [fp, #-212]
	cmp	r7, r3
	beq	.L941
	add	r3, r7, #1
	str	r3, [fp, #-208]
	ldr	r3, [fp, #-216]
	ldr	r2, [r4]
	ldr	r0, [r3, r8]
	rsb	r10, r2, r0
	cmp	r10, #3
	bgt	.L973
	sub	r3, r10, #1
	cmp	r3, #2
	bls	.L974
	ldr	r3, [fp, #-232]
	cmp	r6, #0
	ldr	ip, [r5, #128]
	ldr	r10, [r3, #16]
	rsb	r3, r2, r10
	rsb	r10, ip, r0
	str	r3, [fp, #-228]
	add	r3, r3, r10
	beq	.L951
	rsb	r0, ip, r2
	str	r2, [fp, #-192]
	ldr	r2, [fp, #-220]
	cmp	r3, #3
	ldr	r1, [r5, #116]
	ldr	lr, [r5, #112]
	ldr	ip, [r2, #104]
	rsb	r2, lr, r1
	str	r3, [fp, #-188]
	ubfx	r2, r2, #0, #12
	add	r0, ip, r0
	rsb	r2, r2, #4096
	str	r0, [fp, #-204]
	bls	.L962
	cmp	r2, #2
	bls	.L941
.L963:
	mov	r1, r6
	sub	r0, fp, #204
	bl	CheckSegValid
	cmp	r0, #0
	bne	.L941
	cmp	r10, #0
	ldr	r3, [r5, #232]
	bne	.L953
	cmp	r3, #1
	ldrb	r3, [fp, #-132]	@ zero_extendqisi2
	ldr	lr, [r5, #212]
	mov	ip, #0
	bfieq	r3, r10, #0, #1
	orrne	r3, r3, #1
	strb	r3, [fp, #-132]
	mov	r2, #1
	ldr	r3, [r4, #4]
	ldrb	r1, [fp, #-132]	@ zero_extendqisi2
	mov	r3, r3, lsr #30
	bfi	r1, r3, #1, #1
	strb	r1, [fp, #-132]
	ldrh	r0, [r4, #10]
	sub	r3, fp, #204
	uxtb	r1, r1
	bfi	r1, r0, #2, #1
	strb	r1, [fp, #-132]
	ldr	r1, [r4, #8]
	ldrb	r0, [fp, #-132]	@ zero_extendqisi2
	ubfx	r1, r1, #4, #3
	bfi	r0, r1, #3, #4
	strb	r0, [fp, #-132]
	ldr	r0, [fp, #-228]
	ldr	r1, [r4, #8]
	strb	r2, [fp, #-198]
	add	r2, r5, #248
	str	r0, [fp, #-188]
	and	r1, r1, #7
	ldrh	r0, [fp, #-132]
	strb	ip, [fp, #-199]
	bfi	r0, r1, #7, #4
	strh	r0, [fp, #-132]	@ movhi
	ldr	r1, [r4, #4]
	ldr	r0, [fp, #-224]
	str	lr, [sp]
	bic	r1, r1, #-1073741824
	bl	GetSegPts
	ldr	r2, [r5, #212]
	sub	r1, fp, #204
	mov	r0, r6
	bl	InsertStreamSeg
	b	.L942
.L937:
	ldr	r3, [r5, #128]
	mov	r1, r6
	str	r2, [fp, #-192]
	sub	r0, fp, #204
	rsb	r2, r3, r2
	ldr	r3, [fp, #-220]
	str	r10, [fp, #-188]
	ldr	r3, [r3, #104]
	add	r2, r3, r2
	mov	r3, #1
	str	r2, [fp, #-204]
	strb	r3, [fp, #-198]
	bl	CheckSegValid
	cmp	r0, #0
	bne	.L941
	ldr	r3, [r5, #232]
	add	r2, r5, #248
	ldr	lr, [r5, #212]
	cmp	r3, #1
	ldrb	r3, [fp, #-132]	@ zero_extendqisi2
	bfieq	r3, r0, #0, #1
	orrne	r3, r3, #1
	strb	r3, [fp, #-132]
	sub	r3, fp, #204
	ldr	r1, [r4, #4]
	ldrb	r0, [fp, #-132]	@ zero_extendqisi2
	mov	r1, r1, lsr #30
	bfi	r0, r1, #1, #1
	strb	r0, [fp, #-132]
	ldrh	ip, [r4, #10]
	uxtb	r1, r0
	ldr	r0, [fp, #-224]
	bfi	r1, ip, #2, #1
	strb	r1, [fp, #-132]
	ldr	r1, [r4, #8]
	ldrb	ip, [fp, #-132]	@ zero_extendqisi2
	ubfx	r1, r1, #4, #3
	bfi	ip, r1, #3, #4
	strb	ip, [fp, #-132]
	ldr	r1, [r4, #8]
	ldrh	ip, [fp, #-132]
	and	r1, r1, #7
	bfi	ip, r1, #7, #4
	strh	ip, [fp, #-132]	@ movhi
	ldr	r1, [r4, #4]
	str	lr, [sp]
	bic	r1, r1, #-1073741824
	bl	GetSegPts
	ldr	r2, [r5, #212]
	sub	r1, fp, #204
	mov	r0, r6
	mov	r3, #0
	strb	r3, [fp, #-199]
	bl	InsertStreamSeg
	cmp	r0, #0
	beq	.L942
.L941:
	cmp	r7, #0
	ble	.L940
	ldr	r3, [fp, #-232]
	ldr	r3, [r3, #12]
	sub	r3, r3, #1
	cmp	r3, r7
	bhi	.L975
	beq	.L976
.L940:
	ldr	r3, [fp, #-212]
	ldr	r2, [fp, #-240]
	clz	r3, r3
	cmp	r2, #1024
	mov	r3, r3, lsr #5
	movls	r3, #0
	cmp	r3, #0
	bne	.L977
.L961:
	ldr	r0, [fp, #-236]
	bl	ResetLastUnfinishedSegInfo
.L934:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L974:
	str	r2, [fp, #-228]
	bl	MEM_Phy2Vir
	ldr	r2, [fp, #-228]
	subs	ip, r0, #0
	beq	.L978
	ldrb	r1, [ip, #1]	@ zero_extendqisi2
	ldrb	r3, [ip]	@ zero_extendqisi2
	ldrb	r0, [ip, #2]	@ zero_extendqisi2
	mov	r1, r1, asl #16
	orr	r3, r1, r3, asl #24
	orr	r3, r3, r0, asl #8
	cmp	r3, #256
	beq	.L942
	ldr	r3, [r5, #232]
	mov	ip, #1
	cmp	r3, #1
	ldrb	r3, [fp, #-52]	@ zero_extendqisi2
	bfceq	r3, #0, #1
	orrne	r3, r3, #1
	strb	r3, [fp, #-52]
	sub	r3, fp, #124
	ldr	r1, [r4, #4]
	ldrb	r0, [fp, #-52]	@ zero_extendqisi2
	mov	r1, r1, lsr #30
	bfi	r0, r1, #1, #1
	strb	r0, [fp, #-52]
	uxtb	r1, r0
	ldrh	r0, [r4, #10]
	bfi	r1, r0, #2, #1
	strb	r1, [fp, #-52]
	ldr	r1, [r4, #8]
	ldrb	r0, [fp, #-52]	@ zero_extendqisi2
	ubfx	r1, r1, #4, #3
	bfi	r0, r1, #3, #4
	strb	r0, [fp, #-52]
	ldr	r0, [r4, #8]
	ldrh	lr, [fp, #-52]
	and	r0, r0, #7
	ldr	r1, [r5, #128]
	bfi	lr, r0, #7, #4
	ldr	r0, [fp, #-220]
	strb	ip, [fp, #-118]
	rsb	r1, r1, r2
	str	r2, [fp, #-112]
	add	r2, r5, #248
	ldr	ip, [r0, #104]
	strh	lr, [fp, #-52]	@ movhi
	add	r1, ip, r1
	ldr	ip, [r5, #212]
	str	r10, [fp, #-108]
	str	r1, [fp, #-124]
	ldr	r1, [r4, #4]
	ldr	r0, [fp, #-224]
	str	ip, [sp]
	bic	r1, r1, #-1073741824
	bl	GetSegPts
	b	.L942
.L953:
	cmp	r3, #1
	ldrb	r3, [fp, #-132]	@ zero_extendqisi2
	ldr	ip, [r5, #212]
	mov	r7, #0
	bfieq	r3, r0, #0, #1
	orrne	r3, r3, #1
	strb	r3, [fp, #-132]
	sub	r3, fp, #204
	ldr	r2, [r4, #4]
	ldrb	r1, [fp, #-132]	@ zero_extendqisi2
	mov	r2, r2, lsr #30
	bfi	r1, r2, #1, #1
	strb	r1, [fp, #-132]
	ldrh	r0, [r4, #10]
	add	r2, r5, #248
	uxtb	r1, r1
	bfi	r1, r0, #2, #1
	strb	r1, [fp, #-132]
	ldr	r1, [r4, #8]
	ldrb	r0, [fp, #-132]	@ zero_extendqisi2
	ubfx	r1, r1, #4, #3
	bfi	r0, r1, #3, #4
	strb	r0, [fp, #-132]
	ldr	r0, [fp, #-228]
	ldr	r1, [r4, #8]
	strb	r7, [fp, #-198]
	str	r0, [fp, #-188]
	and	r1, r1, #7
	ldrh	r0, [fp, #-132]
	strb	r7, [fp, #-199]
	bfi	r0, r1, #7, #4
	strh	r0, [fp, #-132]	@ movhi
	ldr	r1, [r4, #4]
	ldr	r0, [fp, #-224]
	str	ip, [sp]
	bic	r1, r1, #-1073741824
	bl	GetSegPts
	ldr	r2, [r5, #212]
	sub	r1, fp, #204
	mov	r0, r6
	bl	InsertStreamSeg
	ldr	r3, [fp, #-220]
	ldr	lr, [r5, #128]
	sub	r1, fp, #204
	ldr	r2, [r5, #212]
	mov	r0, r6
	ldr	ip, [r3, #104]
	mov	r3, #1
	strb	r7, [fp, #-199]
	str	r10, [fp, #-188]
	str	lr, [fp, #-192]
	str	ip, [fp, #-204]
	strb	r3, [fp, #-198]
	bl	InsertStreamSeg
	b	.L942
.L951:
	ldr	r1, [fp, #-220]
	cmp	r3, #3
	rsb	r0, ip, r2
	str	r2, [fp, #-192]
	str	r3, [fp, #-188]
	ldr	r1, [r1, #104]
	add	r0, r1, r0
	str	r0, [fp, #-204]
	bhi	.L963
.L962:
	movw	r2, #3140
	ldr	r1, .L979+4
	mov	r0, #0
	bl	dprint_vfmw
	b	.L942
.L975:
	ldr	r3, [fp, #-244]
	ldr	r2, [fp, #-248]
	ldr	r0, [fp, #-236]
	mul	r3, r3, r7
	add	r3, r3, #1
	ldr	r4, [r2, r3, asl #2]
	bl	ResetLastUnfinishedSegInfo
	ldr	r0, [fp, #-224]
	bic	r4, r4, #-1073741824
	mov	r1, r4
	bl	DeleteRawLen
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L977:
	ldr	r1, .L979+8
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r0, [fp, #-224]
	mov	r1, #1
	bl	DeleteRawPacket
	b	.L961
.L976:
	ldr	r4, [r5, #164]
	mov	r1, r7
	ldr	r0, [fp, #-236]
	ldr	r2, [fp, #-232]
	bl	SetLastUnfinishedSegInfo
	mov	r1, r4
	ldr	r0, [fp, #-224]
	bl	DeleteRawLen
	b	.L934
.L978:
	movw	r2, #3110
	ldr	r1, .L979+12
	bl	dprint_vfmw
	b	.L934
.L980:
	.align	2
.L979:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC26
	.word	.LC30
	.word	.LC29
	UNWIND(.fnend)
	.size	ProcessMpeg4ScdUpMsg, .-ProcessMpeg4ScdUpMsg
	.align	2
	.global	ProcessScdReturn
	.type	ProcessScdReturn, %function
ProcessScdReturn:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #32)
	sub	sp, sp, #32
	add	r4, r0, #425984
	mov	r5, r0
	ldr	r3, [r4, #168]
	cmp	r3, #3
	mov	r3, #2
	streq	r3, [r4, #168]
	mvneq	r0, #6
	beq	.L983
	str	r3, [r4, #168]
	sub	r0, fp, #60
	bl	ReadScdStateReg
	ldr	r6, [fp, #-48]
	movw	r3, #34464
	movt	r3, 1
	cmp	r6, r3
	bls	.L984
	ldr	r3, [r5, #16]
	cmp	r3, #0
	beq	.L989
.L984:
	ldr	r1, [r4, #284]
	ldr	r0, [fp, #-36]
	bl	__aeabi_uidiv
	cmp	r0, r6
	movcc	r7, r0
	movcs	r7, r6
	cmp	r6, r7
	bhi	.L990
.L986:
	sub	r2, fp, #60
	mov	r1, r7
	mov	r0, r5
	bl	ProcessLastUnfinishedSeg
	clz	r3, r7
	mov	r3, r3, lsr #5
	cmp	r0, #0
	moveq	r4, r3
	orrne	r4, r3, #1
	cmp	r4, #0
	bne	.L983
	ldr	r3, [r5, #16]
	sub	r2, fp, #60
	sub	r1, r7, #1
	mov	r0, r5
	cmp	r3, #2
	beq	.L987
	bl	ProcessNotMpeg4ScdUpMsg
	mov	r0, r4
.L983:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L990:
	ldrsb	r3, [r5, #2]
	cmp	r3, #1
	moveq	r3, #0
	streqb	r3, [r5, #2]
	b	.L986
.L987:
	bl	ProcessMpeg4ScdUpMsg
	mov	r0, r4
	b	.L983
.L989:
	mov	r0, r5
	mov	r1, r6
	bl	ProcessExceptionalStartCodeNum
	mvn	r0, #6
	b	.L983
	UNWIND(.fnend)
	.size	ProcessScdReturn, .-ProcessScdReturn
	.align	2
	.global	SCDDRV_SaveRawStream
	.type	SCDDRV_SaveRawStream, %function
SCDDRV_SaveRawStream:
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
	ldr	r6, .L999
	mov	r7, r0
	mov	r8, r1
	mov	r5, r2
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r4, .L999+4
	mov	r0, #0
	ldr	r9, [r1, #16]
	ldr	r3, [r4, #16]
	blx	r3
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L993
	add	r1, r8, #32
	mov	r0, r9
	bl	SCDDRV_IsSCDByPass
	cmp	r0, #0
	bne	.L998
.L994:
	ldr	r2, [r6, r7, asl #2]
	ldr	r3, [r4, #44]
	ldr	r1, [r5, #12]
	ldr	r0, [r5, #40]
	blx	r3
.L993:
	ldr	r3, [r4, #12]
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L998:
	ldr	r3, [r4, #44]
	mov	r1, #4
	ldr	r2, [r6, r7, asl #2]
	add	r0, r5, #12
	blx	r3
	b	.L994
.L1000:
	.align	2
.L999:
	.word	vfmw_save_str_file
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SCDDRV_SaveRawStream, .-SCDDRV_SaveRawStream
	.align	2
	.global	NeedReadStream
	.type	NeedReadStream, %function
NeedReadStream:
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
	mov	r4, r1
	ldr	r1, [r1, #56]
	mov	r5, r0
	cmp	r1, #0
	bne	.L1002
	ldr	r1, [r4, #60]
	cmp	r1, #0
	beq	.L1011
.L1002:
	cmp	r2, #1
	beq	.L1021
.L1011:
	mov	r0, #1
.L1017:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1021:
	ldr	r1, .L1023
	ldr	r1, [r1, r5, asl #2]
	add	r1, r1, #475136
	ldr	r1, [r1, #1668]
	cmp	r1, #1
	beq	.L1022
	ldr	r0, [r4, #60]
	cmp	r0, #1
	beq	.L1017
	adds	r6, r4, #80
	beq	.L1005
	add	r1, r4, #98304
	ldr	r2, [r1, #84]
	ldr	r1, [r1, #80]
	subs	r2, r2, r1
	ldr	r1, .L1023+4
	addmi	r2, r2, #1024
	ldr	r1, [r1, r5, asl #2]
	cmp	r1, #0
	beq	.L1012
.L1008:
	ldr	r0, [r1, #44]
	ldr	ip, [r1, #40]
	cmp	r0, #0
	movgt	r1, #1
	movle	r1, #0
	cmp	ip, #0
	andgt	r1, r1, #1
	movle	r1, #0
	cmp	r1, #0
	beq	.L1012
	mul	r0, r0, ip
	mov	r1, #57344
	movt	r1, 31
	cmp	r0, r1
	cmple	r3, #1
	movne	r3, #16
	moveq	r3, #2
.L1007:
	cmp	r3, r2
	movle	r0, #0
	ble	.L1017
.L1009:
	add	r4, r4, #425984
	ldr	r0, [r4, #152]
	cmp	r3, r0
	movle	r0, #0
	movgt	r0, #1
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1022:
	add	r4, r4, #425984
	ldr	r0, [r4, #152]
	cmp	r0, #0
	movgt	r0, #0
	movle	r0, #1
	b	.L1017
.L1012:
	mov	r3, #16
	b	.L1007
.L1005:
	mov	r0, r2
	ldr	r1, .L1023+8
	ldr	r2, .L1023+12
	str	r3, [fp, #-32]
	bl	dprint_vfmw
	ldr	r2, .L1023+4
	ldr	r3, [fp, #-32]
	ldr	r1, [r2, r5, asl #2]
	cmp	r1, #0
	moveq	r3, #16
	beq	.L1009
	mov	r2, r6
	b	.L1008
.L1024:
	.align	2
.L1023:
	.word	s_pstVfmwChan
	.word	s_pFspInst
	.word	.LC31
	.word	.LANCHOR3+108
	UNWIND(.fnend)
	.size	NeedReadStream, .-NeedReadStream
	.align	2
	.global	FillEopRawStream
	.type	FillEopRawStream, %function
FillEopRawStream:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #116)
	sub	sp, sp, #116
	ldr	r3, .L1039
	mov	r4, r1
	mov	r2, #100
	add	r3, r3, r0, lsl #3
	ldr	r1, .L1039+4
	sub	r0, fp, #128
	ldr	r5, [r3, #76]
	bl	memcpy
	cmp	r4, #0
	beq	.L1038
	ldr	r3, [r5, #16]
	cmp	r3, #18
	bhi	.L1028
	mov	r1, #1
	movw	r2, #65406
	mov	r1, r1, asl r3
	movt	r2, 4
	and	r2, r2, r1
	cmp	r2, #0
	bne	.L1029
	tst	r1, #65536
	bne	.L1033
	tst	r1, #1
	subne	r1, fp, #128
	movne	r5, #15
	beq	.L1028
.L1030:
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #80]
	add	r0, r5, r3
	cmp	r0, r2
	bhi	.L1031
	ldr	ip, .L1039+8
	mov	r2, r5
	ldr	r0, [r4, #40]
	ldr	r6, [ip, #52]
	add	r0, r3, r0
	blx	r6
	ldr	r3, [r4, #12]
	mov	r0, #0
	add	r5, r3, r5
	str	r5, [r4, #12]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1029:
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #80]
	cmp	r3, r2
	bhi	.L1035
	mov	r0, #0
.L1036:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1033:
	mov	r5, #16
	sub	r1, fp, #48
	b	.L1030
.L1028:
	ldr	r2, .L1039+12
	mov	r0, #0
	ldr	r1, .L1039+16
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1036
.L1035:
	mov	r5, #0
.L1031:
	str	r2, [sp, #4]
	mov	r0, #0
	str	r5, [sp]
	ldr	r2, .L1039+12
	ldr	r1, .L1039+20
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1036
.L1038:
	mov	r0, r4
	ldr	r2, .L1039+12
	ldr	r1, .L1039+24
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1036
.L1040:
	.align	2
.L1039:
	.word	.LANCHOR0
	.word	.LANCHOR3+124
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3+224
	.word	.LC33
	.word	.LC34
	.word	.LC32
	UNWIND(.fnend)
	.size	FillEopRawStream, .-FillEopRawStream
	.align	2
	.global	FillEosRawStream
	.type	FillEosRawStream, %function
FillEosRawStream:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #112)
	sub	sp, sp, #112
	ldr	r3, .L1063
	mov	r4, r1
	mov	r2, #100
	add	r3, r3, r0, lsl #3
	ldr	r1, .L1063+4
	sub	r0, fp, #120
	ldr	r5, [r3, #76]
	bl	memcpy
	cmp	r4, #0
	beq	.L1061
	ldr	r3, [r5, #16]
	cmp	r3, #18
	ldrls	pc, [pc, r3, asl #2]
	b	.L1044
.L1046:
	.word	.L1045
	.word	.L1047
	.word	.L1048
	.word	.L1049
	.word	.L1059
	.word	.L1059
	.word	.L1055
	.word	.L1044
	.word	.L1059
	.word	.L1059
	.word	.L1059
	.word	.L1059
	.word	.L1059
	.word	.L1059
	.word	.L1059
	.word	.L1045
	.word	.L1051
	.word	.L1059
	.word	.L1055
.L1045:
	sub	r1, fp, #120
	mov	r5, #15
.L1050:
	ldr	r3, [r4, #12]
	cmp	r5, r3
	bhi	.L1062
	ldr	r3, .L1063+8
	mov	r2, r5
	ldr	r0, [r4, #40]
	ldr	r3, [r3, #52]
	blx	r3
	str	r5, [r4, #12]
.L1059:
	mov	r0, #0
.L1057:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1055:
	mov	r5, #15
	sub	r1, fp, #100
	b	.L1050
.L1047:
	ldr	r3, [r5, #32]
	cmp	r3, #1
	bne	.L1059
	sub	r1, fp, #100
	mov	r5, #15
	b	.L1050
.L1048:
	mov	r5, #19
	sub	r1, fp, #80
	b	.L1050
.L1049:
	mov	r5, #16
	sub	r1, fp, #60
	b	.L1050
.L1051:
	mov	r5, #16
	sub	r1, fp, #40
	b	.L1050
.L1044:
	ldr	r2, .L1063+12
	mov	r0, #0
	ldr	r1, .L1063+16
	bl	dprint_vfmw
	mvn	r0, #6
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1062:
	str	r3, [sp]
	mov	r0, #0
	mov	r3, r5
	ldr	r2, .L1063+12
	ldr	r1, .L1063+20
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1057
.L1061:
	mov	r0, r4
	ldr	r2, .L1063+12
	ldr	r1, .L1063+24
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1057
.L1064:
	.align	2
.L1063:
	.word	.LANCHOR0
	.word	.LANCHOR3+244
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3+344
	.word	.LC33
	.word	.LC35
	.word	.LC32
	UNWIND(.fnend)
	.size	FillEosRawStream, .-FillEosRawStream
	.align	2
	.global	FillVC1ExtraData
	.type	FillVC1ExtraData, %function
FillVC1ExtraData:
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
	mov	r4, r1
	ldr	r1, [r0, #32]
	mov	r6, r0
	ldr	r0, [r4, #76]
	cmp	r1, #1
	beq	.L1075
	ands	r5, r0, #128
	bne	.L1076
	add	r6, r6, #425984
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #80]
	ldr	r0, [r6, #300]
	add	r3, r2, r0
	cmp	r3, r1
	bhi	.L1077
.L1073:
	ldr	r7, .L1080
	ldr	r1, [r4, #40]
	ldr	r3, [r7, #56]
	add	r0, r1, r0
	blx	r3
	ldr	r3, [r7, #52]
	ldr	r2, [r6, #300]
	add	r1, r6, #304
	ldr	r0, [r4, #40]
	blx	r3
	ldr	r2, [r6, #300]
	ldr	r3, [r4, #12]
	mov	r0, r5
	add	r3, r3, r2
	str	r3, [r4, #12]
.L1069:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1076:
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #80]
	cmp	r2, #116
	add	r3, r2, #12
	movle	r0, #0
	movgt	r0, #1
	cmp	r3, r1
	movls	r5, r0
	orrhi	r5, r0, #1
	cmp	r5, #0
	bne	.L1078
	ldr	r7, .L1080
	add	r6, r6, #425984
	ldr	r1, [r4, #40]
	ldr	r3, [r7, #56]
	add	r0, r1, #8
	blx	r3
	ldr	r3, [r7, #52]
	add	r1, r4, #84
	mov	r2, #4
	ldr	r0, [r4, #40]
	blx	r3
	ldr	r0, [r4, #40]
	ldr	r3, [r7, #52]
	mov	r2, #4
	add	r1, r4, #88
	add	r0, r0, r2
	blx	r3
	ldr	r0, [r4, #40]
	ldr	r3, [r7, #48]
	mov	r1, r5
	mov	r2, #4
	add	r0, r0, #12
	blx	r3
	mov	r3, #16
	add	r0, r6, #304
	str	r3, [r4, #12]
	str	r3, [r6, #300]
	ldr	r3, [r7, #52]
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #40]
	blx	r3
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1075:
	ands	r5, r0, #128
	beq	.L1067
	ldr	r3, [r4, #12]
	cmp	r3, #127
	bhi	.L1079
	ldr	r2, .L1080
	add	r6, r6, #425984
	add	r0, r6, #304
	str	r3, [r6, #300]
	ldr	r3, [r2, #52]
	ldr	r1, [r4, #40]
	ldr	r2, [r4, #12]
	blx	r3
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1067:
	ldrb	r0, [r4, #72]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1069
	add	r6, r6, #425984
	ldr	r2, [r4, #12]
	ldr	ip, [r4, #80]
	ldr	r0, [r6, #300]
	add	r3, r2, r0
	cmp	r3, ip
	bls	.L1073
	mov	r0, r1
	str	ip, [sp]
	ldr	r2, .L1080+4
	ldr	r1, .L1080+8
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L1069
.L1078:
	str	r1, [sp]
	mov	r0, #1
	mov	r1, #128
	ldr	r2, .L1080+4
	str	r1, [sp, #4]
	ldr	r1, .L1080+12
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L1069
.L1077:
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L1080+4
	ldr	r1, .L1080+8
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L1069
.L1079:
	mov	r0, r1
	ldr	r2, .L1080+4
	mov	r1, #128
	str	r1, [sp]
	ldr	r1, .L1080+16
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L1069
.L1081:
	.align	2
.L1080:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3+364
	.word	.LC37
	.word	.LC38
	.word	.LC36
	UNWIND(.fnend)
	.size	FillVC1ExtraData, .-FillVC1ExtraData
	.align	2
	.global	FillDIVX3ExtraData
	.type	FillDIVX3ExtraData, %function
FillDIVX3ExtraData:
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
	ldr	r2, [r1, #12]
	mov	r4, r1
	ldr	r1, [r1, #80]
	add	r3, r2, #8
	cmp	r3, r1
	bhi	.L1085
	ldr	r5, .L1086
	ldr	r1, [r4, #40]
	ldr	r3, [r5, #56]
	add	r0, r1, #8
	blx	r3
	ldr	r3, [r5, #52]
	mov	r2, #4
	add	r1, r4, #84
	ldr	r0, [r4, #40]
	blx	r3
	ldr	r0, [r4, #40]
	ldr	r3, [r5, #52]
	mov	r2, #4
	add	r1, r4, #88
	add	r0, r0, r2
	blx	r3
	ldr	r3, [r4, #12]
	mov	r0, #0
	add	r3, r3, #8
	str	r3, [r4, #12]
.L1084:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1085:
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L1086+4
	ldr	r1, .L1086+8
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L1084
.L1087:
	.align	2
.L1086:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3+384
	.word	.LC39
	UNWIND(.fnend)
	.size	FillDIVX3ExtraData, .-FillDIVX3ExtraData
	.align	2
	.global	FillREAL8ExtraData
	.type	FillREAL8ExtraData, %function
FillREAL8ExtraData:
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
	ldr	r3, [r1, #76]
	mov	r6, r1
	ands	r5, r3, #128
	beq	.L1089
	ldr	r3, [r1, #12]
	cmp	r3, #127
	bhi	.L1093
	ldr	r2, .L1095
	add	r4, r0, #425984
	add	r0, r4, #304
	str	r3, [r4, #300]
	ldr	r3, [r2, #52]
	ldr	r2, [r1, #12]
	ldr	r1, [r1, #40]
	blx	r3
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1089:
	add	r4, r0, #425984
	ldr	r2, [r1, #12]
	ldr	r1, [r1, #80]
	ldr	r0, [r4, #300]
	add	r3, r2, r0
	cmp	r3, r1
	bhi	.L1094
	ldr	r7, .L1095
	ldr	r1, [r6, #40]
	ldr	r3, [r7, #56]
	add	r0, r1, r0
	blx	r3
	ldr	r3, [r7, #52]
	ldr	r2, [r4, #300]
	add	r1, r4, #304
	ldr	r0, [r6, #40]
	blx	r3
	ldr	r2, [r4, #300]
	ldr	r3, [r6, #12]
	mov	r0, r5
	add	r3, r3, r2
	str	r3, [r6, #12]
.L1091:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1094:
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L1095+4
	ldr	r1, .L1095+8
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L1091
.L1093:
	mov	r1, #128
	ldr	r2, .L1095+4
	str	r1, [sp]
	mov	r0, #1
	ldr	r1, .L1095+12
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L1091
.L1096:
	.align	2
.L1095:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3+404
	.word	.LC40
	.word	.LC36
	UNWIND(.fnend)
	.size	FillREAL8ExtraData, .-FillREAL8ExtraData
	.align	2
	.global	FillExtraData
	.type	FillExtraData, %function
FillExtraData:
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
	clz	r3, r1
	mov	r3, r3, lsr #5
	cmp	r0, #31
	orrhi	r3, r3, #1
	cmp	r3, #0
	bne	.L1103
	ldr	r2, [r1, #12]
	cmp	r2, #0
	ble	.L1106
	ldr	r2, .L1108
	add	r0, r2, r0, lsl #3
	ldr	r0, [r0, #76]
	ldr	r2, [r0, #16]
	cmp	r2, #5
	beq	.L1100
	cmp	r2, #8
	beq	.L1101
	cmp	r2, #1
	beq	.L1107
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1101:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FillREAL8ExtraData
.L1100:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FillDIVX3ExtraData
.L1107:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FillVC1ExtraData
.L1103:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1106:
	mov	r3, r2
	ldr	r1, .L1108+4
	ldr	r2, .L1108+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1109:
	.align	2
.L1108:
	.word	.LANCHOR0
	.word	.LC41
	.word	.LANCHOR3+424
	UNWIND(.fnend)
	.size	FillExtraData, .-FillExtraData
	.align	2
	.global	ReleaseRawStreamData
	.type	ReleaseRawStreamData, %function
ReleaseRawStreamData:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #116)
	sub	sp, sp, #116
	mov	r6, r1
	mov	r7, r0
	bl	VCTRL_GetStreamInterface
	ldr	r5, .L1125
	mov	r2, #12
	mov	r1, #0
	ldr	r3, [r5, #48]
	mov	r4, r0
	sub	r0, fp, #144
	blx	r3
	cmp	r4, #0
	beq	.L1122
	mov	r1, r4
	ldr	r3, [r5, #52]
	mov	r2, #12
	sub	r0, fp, #144
	blx	r3
	mov	r1, r6
	ldr	r3, [r5, #52]
	sub	r0, fp, #132
	mov	r2, #96
	ldr	r6, .L1125+4
	blx	r3
	ldr	r3, [r4, #8]
	mov	r8, r7, asl #3
	cmp	r3, #0
	mvneq	r4, #6
	beq	.L1113
	add	r4, r6, r8
	ldr	r3, [r4, #76]
	ldr	r3, [r3, #56]
	cmp	r3, #1
	beq	.L1123
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	ldr	r3, [r5, #24]
	mov	r1, r7
	mov	r0, #1
	blx	r3
	ldr	r3, [r4, #76]
	cmp	r3, #0
	mvneq	r4, #6
	beq	.L1116
	sub	r1, fp, #132
	ldr	r3, [fp, #-136]
	ldr	r0, [fp, #-144]
	blx	r3
	mov	r4, r0
.L1116:
	ldr	r3, [r5, #28]
	mov	r0, #1
	mov	r1, r7
	blx	r3
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
.L1115:
	cmp	r4, #0
	mvnne	r4, #6
.L1113:
	add	r6, r6, r8
	ldr	r0, [r6, #76]
	cmp	r0, #0
	movne	r0, r4
	beq	.L1124
.L1112:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1123:
	sub	r1, fp, #132
	ldr	r3, [fp, #-136]
	ldr	r0, [fp, #-144]
	blx	r3
	mov	r4, r0
	b	.L1115
.L1122:
	mov	r2, r7
	mov	r0, r4
	ldr	r1, .L1125+8
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1112
.L1124:
	mov	r3, r7
	movw	r2, #4122
	ldr	r1, .L1125+12
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1112
.L1126:
	.align	2
.L1125:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC42
	.word	.LC43
	UNWIND(.fnend)
	.size	ReleaseRawStreamData, .-ReleaseRawStreamData
	.align	2
	.global	DeleteRawPacketInBuffer
	.type	DeleteRawPacketInBuffer, %function
DeleteRawPacketInBuffer:
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
	cmp	r0, #31
	mov	r8, r0
	bhi	.L1139
	ldr	r9, .L1146
	mov	r10, r0, asl #3
	add	r3, r9, r10
	ldr	r7, [r3, #76]
	cmp	r7, #0
	beq	.L1139
	cmp	r1, #0
	beq	.L1143
.L1129:
	adds	r3, r7, #80
	str	r3, [fp, #-52]
	beq	.L1139
	add	r3, r7, #98304
	str	r3, [fp, #-56]
	mov	r2, r3
	ldr	r3, [r3, #80]
	ldr	r4, [r2, #88]
	cmp	r3, r4
	addlt	r3, r3, #1024
	rsb	r3, r4, r3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L1139
	mov	r6, #0
	b	.L1133
.L1145:
	ldr	r2, [fp, #-48]
	cmp	r6, r2
	beq	.L1144
.L1133:
	mov	r5, r4, asl #7
	ldr	r2, .L1146+4
	sub	r5, r5, r4, asl #5
	ldr	r1, .L1146+8
	add	ip, r7, r5
	mov	r0, #26
	add	r4, r4, #1
	add	r6, r6, #1
	ldr	r3, [ip, #84]
	ubfx	r4, r4, #0, #10
	ldr	ip, [ip, #92]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [fp, #-52]
	mov	r0, r8
	add	r1, r3, r5
	bl	ReleaseRawStreamData
	add	r3, r9, r10
	ldr	r2, [r3, #76]
	subs	r3, r7, r2
	movne	r3, #1
	cmp	r2, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	beq	.L1145
	mvn	r0, #6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1143:
	add	r3, r7, #425984
	ldr	r3, [r3, #228]
	cmp	r3, #0
	bne	.L1129
.L1139:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1144:
	ldr	r2, [fp, #-56]
	ldr	r4, [r2, #88]
	add	r4, r4, r6
	cmp	r4, #1024
	strlt	r4, [r2, #88]
	subge	r4, r4, #1024
	movge	r0, r3
	ldrge	r3, [fp, #-56]
	movlt	r0, r3
	strge	r4, [r3, #88]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1147:
	.align	2
.L1146:
	.word	.LANCHOR0
	.word	.LANCHOR3+440
	.word	.LC10
	UNWIND(.fnend)
	.size	DeleteRawPacketInBuffer, .-DeleteRawPacketInBuffer
	.align	2
	.global	SM_Reset
	.type	SM_Reset, %function
SM_Reset:
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
	UNWIND(.pad #212)
	sub	sp, sp, #212
	cmp	r0, #31
	mov	r6, r0
	bhi	.L1160
	ldr	r7, .L1172
	mov	r10, r0, asl #3
	add	r3, r7, r10
	ldr	r5, [r3, #76]
	cmp	r5, #0
	beq	.L1150
	ldr	r3, [r7, #44]
	cmp	r3, r0
	bne	.L1152
	mov	r0, #0
	bl	SCDDRV_SetStateIdle.part.0
	movw	r3, #1160
	ldr	r2, .L1172+4
	mov	r0, #22
	ldr	r1, .L1172+8
	bl	dprint_vfmw
.L1152:
	ldr	r8, .L1172+12
	add	r4, r5, #425984
	mov	r2, #72
	add	r1, r5, #8
	sub	r0, fp, #244
	add	r9, r4, #304
	ldr	r3, [r8, #52]
	add	r7, r7, r10
	blx	r3
	ldr	ip, [r4, #228]
	ldr	r3, [r8, #52]
	mov	r1, r9
	sub	r0, fp, #172
	mov	r2, #128
	str	ip, [fp, #-248]
	ldr	ip, [r4, #300]
	str	ip, [fp, #-252]
	blx	r3
	ldr	r3, [r7, #76]
	cmp	r3, #0
	beq	.L1153
	add	r3, r3, #425984
	ldr	r2, [r3, #228]
	cmp	r2, #0
	bne	.L1170
.L1153:
	adds	r7, r5, #80
	beq	.L1154
.L1171:
	add	r2, r5, #98304
	ldr	r3, [r2, #84]
	ldr	r1, [r2, #80]
	subs	r1, r3, r1
	addmi	r1, r1, #1024
.L1159:
	mov	r0, r7
	bl	DeleteRawPacket
	mov	r1, #1
	mov	r0, r6
	bl	DeleteRawPacketInBuffer
	ldrb	r7, [r4, #212]	@ zero_extendqisi2
	movw	r2, #49720
	ldr	r3, [r8, #48]
	movt	r2, 6
	mov	r1, #0
	mov	r0, r5
	sxtb	r7, r7
	blx	r3
	mov	r0, r5
	bl	ResetLastUnfinishedSegInfo
	mvn	r2, #0
	mvn	r3, #0
	mov	ip, #2
	strd	r2, [r4, #248]
	sub	r1, fp, #244
	str	ip, [r4, #284]
	mov	r0, r6
	str	r7, [r4, #212]
	bl	SM_Config
	ldr	r3, [fp, #-248]
	sub	r1, fp, #172
	mov	r0, r9
	sub	r3, r3, #1
	mov	r2, #128
	cmp	r3, #1
	movls	r3, #1
	movhi	r3, #0
	str	r3, [r4, #228]
	ldr	r3, [fp, #-252]
	str	r3, [r4, #300]
	ldr	r3, [r8, #52]
	blx	r3
	mov	r0, #0
.L1167:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1170:
	ldr	r2, [r3, #216]
	cmp	r2, #0
	movle	r2, #0
	strle	r2, [r3, #228]
	adds	r7, r5, #80
	bne	.L1171
.L1154:
	ldr	r1, .L1172+16
	movw	r3, #1176
	ldr	r2, .L1172+4
	mov	r0, #22
	bl	dprint_vfmw
	mov	r1, r7
	b	.L1159
.L1160:
	mvn	r0, #0
	b	.L1167
.L1150:
	mov	r0, r5
	movw	r2, #1150
	ldr	r1, .L1172+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1167
.L1173:
	.align	2
.L1172:
	.word	.LANCHOR0
	.word	.LANCHOR3+464
	.word	.LC45
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC46
	.word	.LC44
	UNWIND(.fnend)
	.size	SM_Reset, .-SM_Reset
	.align	2
	.global	ReadRawStreamData
	.type	ReadRawStreamData, %function
ReadRawStreamData:
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
	ldr	r5, .L1212
	ldr	r6, .L1212+4
	mov	r7, r0
	add	r5, r5, r0, lsl #3
	mov	r9, r1
	sub	r0, fp, #48
	mov	r2, #12
	ldr	r4, [r5, #76]
	mov	r1, #0
	ldr	r3, [r6, #48]
	blx	r3
	cmp	r4, #0
	beq	.L1178
	mov	r0, r7
	bl	VCTRL_GetStreamInterface
	subs	r8, r0, #0
	beq	.L1205
	ldr	r3, [r6, #52]
	sub	r0, fp, #48
	mov	r2, #12
	mov	r1, r8
	blx	r3
	ldr	r3, [r8, #4]
	cmp	r3, #0
	beq	.L1178
	ldr	r3, [r4, #56]
	cmp	r3, #1
	beq	.L1206
	ldr	r3, [r6, #16]
	mov	r0, #0
	blx	r3
	ldr	r3, [fp, #-44]
	mov	r1, r9
	ldr	r0, [fp, #-48]
	blx	r3
	ldr	r3, [r6, #12]
	mov	r8, r0
	mov	r0, #0
	blx	r3
	ldr	r2, [r5, #76]
	subs	r3, r4, r2
	movne	r3, #1
	cmp	r2, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L1207
	cmp	r8, #0
	bne	.L1178
.L1181:
	ldrb	r5, [r9, #1]	@ zero_extendqisi2
	cmp	r5, #1
	beq	.L1208
	ldr	r3, [r4, #56]
	cmp	r3, #1
	beq	.L1209
.L1183:
	add	r4, r4, #98304
	ldr	r2, [r9, #12]
	mov	r0, #0
	ldr	r3, [r4, #100]
	add	r3, r3, r2
	str	r3, [r4, #100]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1178:
	mvn	r0, #6
.L1202:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1207:
	mov	r3, r7
	movw	r2, #4027
	ldr	r1, .L1212+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1202
.L1206:
	ldr	r3, [fp, #-44]
	mov	r1, r9
	ldr	r0, [fp, #-48]
	blx	r3
	mov	r8, r0
	cmp	r8, #0
	beq	.L1181
	b	.L1178
.L1208:
	mov	r1, r9
	mov	r0, r7
	bl	FillEosRawStream
	cmp	r0, #0
	bne	.L1210
	mov	r1, r5
	mov	r0, r7
	bl	VCTRL_SetLastFrameState
	b	.L1183
.L1209:
	mov	r1, r9
	mov	r0, r7
	bl	FillExtraData
	cmp	r0, #0
	bne	.L1211
	add	r3, r4, #425984
	ldr	r3, [r3, #296]
	cmp	r3, #0
	beq	.L1183
	ldrb	r3, [r9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1183
	mov	r0, r7
	mov	r1, r9
	bl	FillEopRawStream
	b	.L1183
.L1211:
	mov	r2, r7
	ldr	r1, .L1212+12
	mov	r0, r8
	bl	dprint_vfmw
	mov	r1, r9
	ldr	r0, [fp, #-48]
	bl	ReleaseRawStreamData
	cmp	r0, #0
	beq	.L1178
	mov	r0, r8
	ldr	r1, .L1212+16
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1202
.L1205:
	mov	r2, r7
	ldr	r1, .L1212+20
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1202
.L1210:
	mov	r2, r7
	mov	r0, r8
	ldr	r1, .L1212+24
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1202
.L1213:
	.align	2
.L1212:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC48
	.word	.LC50
	.word	.LC51
	.word	.LC47
	.word	.LC49
	UNWIND(.fnend)
	.size	ReadRawStreamData, .-ReadRawStreamData
	.align	2
	.global	FillRawData
	.type	FillRawData, %function
FillRawData:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 112
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
	ldr	r9, .L1254
	mov	r3, r0, asl #3
	ldr	r8, .L1254+4
	str	r3, [fp, #-144]
	add	r3, r9, r3
	mov	r4, r0
	mov	r2, #96
	ldr	r5, [r3, #76]
	mov	r1, #0
	sub	r0, fp, #140
	ldr	r3, [r8, #48]
	blx	r3
	cmp	r5, #0
	beq	.L1214
	ldr	r3, [r5, #16]
	cmp	r3, #20
	beq	.L1214
	mov	r3, r4, asl #24
	add	r7, r5, #442368
	str	r3, [fp, #-156]
	b	.L1228
.L1253:
	ldr	r3, [fp, #-144]
	add	r3, r9, r3
	ldr	r3, [r3, #76]
	cmp	r3, #0
	beq	.L1218
	add	r2, r3, #98304
	ldr	r3, [r2, #84]
	ldr	r2, [r2, #88]
	add	r3, r3, #1
	mov	r1, r3, asr #31
	mov	r1, r1, lsr #22
	add	r3, r3, r1
	ubfx	r3, r3, #0, #10
	rsb	r3, r1, r3
	cmp	r3, r2
	beq	.L1218
	sub	r1, fp, #140
	mov	r0, r4
	bl	ReadRawStreamData
	subs	r3, r0, #0
	str	r3, [fp, #-148]
	bne	.L1214
	add	r10, r5, #425984
	ldrb	r6, [fp, #-140]	@ zero_extendqisi2
	ldr	r2, [fp, #-128]
	ldr	r1, [r10, #292]
	subs	r6, r6, #1
	ldr	r0, [r10, #264]
	ldr	ip, [r10, #288]
	movne	r6, #1
	add	r0, r0, r2
	str	r0, [r10, #264]
	add	r2, r2, ip
	str	r2, [r10, #288]
	add	r2, r1, #1
	ldr	r1, [r8]
	str	r2, [r10, #292]
	str	r6, [r7, #560]
	blx	r1
	ldr	r1, [r10, #268]
	cmp	r1, #0
	streq	r0, [r10, #268]
	beq	.L1221
	rsb	r1, r1, r0
	cmp	r1, #2000
	bls	.L1221
	str	r0, [fp, #-152]
	ldr	r0, [r10, #264]
	mov	r0, r0, asl #3
	bl	__aeabi_uidiv
	mov	r1, #1000
	ldr	r3, [fp, #-148]
	ldr	r2, [fp, #-152]
	str	r3, [r10, #264]
	str	r2, [r10, #268]
	mul	r0, r1, r0
	mov	r0, r0, lsr #10
	str	r0, [r10, #272]
.L1221:
	ldrd	r2, [fp, #-76]
	mov	r0, #29
	ldr	r1, .L1254+8
	bl	dprint_vfmw
	ldr	r3, [fp, #-128]
	ldr	r2, [fp, #-136]
	mov	r0, #26
	ldr	r1, .L1254+12
	bl	dprint_vfmw
	ldrd	r2, [fp, #-76]
	mov	r1, #0
	mvn	r0, #0
	cmp	r3, r1
	cmpeq	r2, r0
	beq	.L1250
.L1222:
	sub	r1, fp, #140
	mov	r0, r4
	bl	SCDDRV_InsertRawPacket
	cmp	r0, #0
	bne	.L1251
	mov	r3, #1
	strb	r3, [r5, #3]
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L1252
.L1225:
	sub	r2, fp, #140
	mov	r1, r5
	mov	r0, r4
	bl	SCDDRV_SaveRawStream
	mov	r2, r6
	mov	r3, #1
	mov	r1, r5
	mov	r0, r4
	bl	NeedReadStream
	cmp	r0, #0
	beq	.L1214
	ldr	r3, .L1254+16
	ldr	r3, [r3, r4, asl #2]
	add	r3, r3, #475136
	ldr	r3, [r3, #1668]
	cmp	r3, #1
	beq	.L1214
.L1228:
	mov	r3, #0
	ldr	r2, [r7, #560]
	mov	r1, r5
	mov	r0, r4
	bl	NeedReadStream
	cmp	r0, #1
	bne	.L1214
	cmp	r4, #31
	bls	.L1253
.L1218:
	mov	r2, r4
	ldr	r1, .L1254+20
	mov	r0, #23
	bl	dprint_vfmw
.L1214:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1252:
	ldr	r3, [r8]
	blx	r3
	ldr	r3, .L1254+24
	add	ip, r9, r4, lsl #2
	ldr	r2, [r3]
	ldr	r3, [ip, #340]
	rsb	r3, r3, r0
	cmp	r3, r2
	bls	.L1225
	str	r0, [ip, #340]
	movw	r1, #3435
	ldr	r2, [fp, #-156]
	ldr	r0, .L1254+28
	bl	DBG_AddTrace
	b	.L1225
.L1250:
	mvn	r2, #0
	mvn	r3, #0
	strd	r2, [fp, #-76]
	b	.L1222
.L1251:
	ldr	r1, .L1254+32
	mov	r0, #0
	bl	dprint_vfmw
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1255:
	.align	2
.L1254:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC52
	.word	.LC53
	.word	s_pstVfmwChan
	.word	.LC55
	.word	g_TraceBsPeriod
	.word	.LANCHOR3+476
	.word	.LC54
	UNWIND(.fnend)
	.size	FillRawData, .-FillRawData
	.align	2
	.global	ReleaseSegArrayPackets
	.type	ReleaseSegArrayPackets, %function
ReleaseSegArrayPackets:
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
	cmp	r1, #4096
	mov	r4, r1
	mov	r8, r0
	mov	r6, r2
	beq	.L1261
	cmp	r1, r2
	beq	.L1262
	add	r9, r0, #327680
	mov	r5, #0
	mov	r7, #2
.L1260:
	mov	r3, r4, asl #6
	mov	r1, r4
	add	r3, r3, r4, lsl #4
	mov	r0, r8
	add	r3, r8, r3
	strb	r7, [r3, #12]
	ldr	ip, [r3, #24]
	ldr	r2, [r9, #44]
	ldr	r3, [r9, #48]
	rsb	r2, ip, r2
	sub	r3, r3, #1
	bic	r2, r2, r2, asr #31
	str	r2, [r9, #44]
	bic	r3, r3, r3, asr #31
	str	r3, [r9, #48]
	bl	ReleaseStreamSeg
	add	r3, r4, #1
	mov	r4, r3, asr #31
	mov	r4, r4, lsr #20
	add	r3, r3, r4
	ubfx	r3, r3, #0, #12
	rsb	r4, r4, r3
	cmp	r0, #0
	addeq	r5, r5, #1
	cmp	r6, r4
	bne	.L1260
.L1258:
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1261:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1262:
	mov	r5, #0
	b	.L1258
	UNWIND(.fnend)
	.size	ReleaseSegArrayPackets, .-ReleaseSegArrayPackets
	.align	2
	.global	SM_SeekPtsInSegArray
	.type	SM_SeekPtsInSegArray, %function
SM_SeekPtsInSegArray:
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
	add	r7, r0, #425984
	mov	r3, r1
	add	r5, r0, #98304
	mov	r2, #0
	mov	r6, r0
	str	r1, [fp, #-60]
	add	r10, r5, #104
	ldrd	r0, [r1]
	mvn	r8, #0
	ldr	r4, [r7, #112]
	mvn	r9, #0
	str	r2, [fp, #-56]
	ldr	ip, [r7, #116]
	ldrd	r2, [r3, #8]
	strd	r0, [fp, #-52]
	str	r4, [r7, #120]
	strd	r2, [fp, #-68]
.L1265:
	cmp	r4, ip
	beq	.L1291
.L1266:
	mov	r3, r4, asl #6
	add	r3, r3, r4, lsl #4
	add	r3, r5, r3
	ldrb	r2, [r3, #116]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1288
	cmp	r2, #2
	beq	.L1292
	ldrd	r2, [r3, #144]
	cmp	r3, r9
	cmpeq	r2, r8
	beq	.L1288
	ldrd	r0, [fp, #-52]
	cmp	r1, r3
	cmpeq	r0, r2
	strhi	r4, [r7, #120]
	addhi	r3, r4, #1
	bhi	.L1287
	beq	.L1293
	bcs	.L1265
	ldr	lr, [r7, #120]
	strd	r2, [fp, #-76]
	mvn	r3, #0
	mvn	r2, #0
	mov	ip, lr, asl #6
	add	ip, ip, lr, lsl #4
	add	r5, r5, ip
	ldrd	r8, [r5, #144]
	cmp	r9, r3
	cmpeq	r8, r2
	beq	.L1289
	ldrd	r0, [fp, #-52]
	cmp	r1, r9
	cmpeq	r0, r8
	bhi	.L1294
.L1282:
	mov	r4, lr
.L1278:
	ldr	r3, [fp, #-60]
	strd	r8, [r3]
.L1276:
	mov	r2, r4
	ldr	r1, [r7, #112]
	mov	r0, r10
	bl	ReleaseSegArrayPackets
	ldr	r3, [r6, #4]
	cmp	r3, #0
	bne	.L1295
.L1279:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1292:
	mov	r1, r4
	mov	r0, r10
	bl	ReleaseStreamSeg
	ldr	ip, [r7, #116]
	cmp	r0, #0
	ldreq	r3, [fp, #-56]
	addeq	r3, r3, #1
	streq	r3, [fp, #-56]
	add	r3, r4, #1
.L1287:
	mov	r4, r3, asr #31
	mov	r4, r4, lsr #20
	add	r3, r3, r4
	ubfx	r3, r3, #0, #12
	rsb	r4, r4, r3
	cmp	r4, ip
	bne	.L1266
.L1291:
	mov	r2, r4
	ldr	r1, [r7, #112]
	mov	r0, r10
	bl	ReleaseSegArrayPackets
	ldr	r3, [r6, #4]
	cmp	r3, #0
	bne	.L1296
.L1290:
	mvn	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1288:
	add	r3, r4, #1
	b	.L1287
.L1296:
	ldr	r3, [fp, #-56]
	add	r1, r0, r3
	add	r0, r6, #80
	bl	DeleteRawPacket
	b	.L1290
.L1293:
	ldr	r1, [fp, #-60]
	ldrd	r2, [fp, #-52]
	strd	r2, [r1]
	b	.L1276
.L1295:
	ldr	r3, [fp, #-56]
	add	r1, r0, r3
	add	r0, r6, #80
	bl	DeleteRawPacket
	b	.L1279
.L1294:
	subs	r0, r0, r8
	ldrd	r2, [fp, #-68]
	sbc	r1, r1, r9
	cmp	r3, r1
	cmpeq	r2, r0
	bcs	.L1282
.L1289:
	str	r4, [r7, #120]
	ldrd	r8, [fp, #-76]
	b	.L1278
	UNWIND(.fnend)
	.size	SM_SeekPtsInSegArray, .-SM_SeekPtsInSegArray
	.align	2
	.global	SM_SeekPtsInRawArray
	.type	SM_SeekPtsInRawArray, %function
SM_SeekPtsInRawArray:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 48
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
	ldr	ip, .L1336
	str	r2, [fp, #-64]
	mov	lr, r0
	add	ip, ip, r2, lsl #3
	mov	r0, r1
	str	r1, [fp, #-72]
	ldr	r2, [ip, #76]
	str	r3, [fp, #-76]
	cmp	r2, #0
	str	r2, [fp, #-68]
	beq	.L1318
	add	r8, lr, #98304
	ldr	r9, [r8]
	cmp	r9, #0
	blt	.L1318
	ldr	r1, [r8, #4]
	cmp	r1, #0
	blt	.L1318
	cmp	r3, #1
	ldrd	r4, [r0]
	ldrd	r2, [r0, #8]
	strd	r4, [fp, #-60]
	strd	r2, [fp, #-92]
	movne	r3, #0
	strne	r3, [fp, #-80]
	beq	.L1330
.L1299:
	mov	r3, r9
	mvn	r6, #0
	mvn	r7, #0
	str	r9, [r8, #8]
	strd	r6, [fp, #-52]
.L1300:
	mov	r10, r3, asl #5
	mov	ip, r3, asl #7
	add	r2, r3, #1
	cmp	r3, r1
	rsb	r0, r10, ip
	add	r0, lr, r0
	mov	r7, r2, asr #31
	beq	.L1331
	ldrd	r4, [r0, #64]
	mov	r0, r7, lsr #22
	ldrd	r6, [fp, #-52]
	add	r2, r2, r0
	ubfx	r2, r2, #0, #10
	cmp	r5, r7
	cmpeq	r4, r6
	beq	.L1332
	ldrd	r6, [fp, #-60]
	cmp	r7, r5
	cmpeq	r6, r4
	bls	.L1306
	str	r3, [r8, #8]
	rsb	r3, r0, r2
	b	.L1300
.L1332:
	add	r2, r3, #1
	mov	r3, r2, asr #31
	mov	r3, r3, lsr #22
	add	r2, r2, r3
	ubfx	r2, r2, #0, #10
	rsb	r3, r3, r2
	b	.L1300
.L1331:
	cmp	r9, r3
	mov	r0, lr
	addgt	r3, r3, #1024
	str	r9, [r8, #8]
	rsb	r1, r9, r3
	bl	DeleteRawPacket
	ldr	r0, [fp, #-64]
	mov	r1, #0
	bl	DeleteRawPacketInBuffer
	mvn	r0, #1
.L1298:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1306:
	beq	.L1333
	ldr	r2, [r8, #8]
	mvn	r5, #0
	mvn	r4, #0
	mov	r1, r2, asl #7
	sub	r1, r1, r2, asl #5
	add	r1, lr, r1
	ldrd	r0, [r1, #64]
	cmp	r1, r5
	cmpeq	r0, r4
	streq	r3, [r8, #8]
	moveq	r2, r3
	beq	.L1312
	ldrd	r4, [fp, #-60]
	cmp	r5, r1
	cmpeq	r4, r0
	bhi	.L1334
.L1312:
	cmp	r9, r2
	ldr	r3, [fp, #-76]
	addgt	r1, r2, #1024
	rsble	r1, r9, r2
	rsbgt	r1, r9, r1
	cmp	r3, #1
	beq	.L1335
.L1315:
	mov	r3, r2, asl #7
	mov	r0, lr
	sub	r2, r3, r2, asl #5
	add	lr, lr, r2
	ldrd	r2, [lr, #64]
.L1329:
	ldr	ip, [fp, #-72]
	strd	r2, [ip]
	ldr	r3, [r8]
	str	r3, [r8, #8]
	bl	DeleteRawPacket
	ldr	r0, [fp, #-64]
	mov	r1, #0
	bl	DeleteRawPacketInBuffer
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1330:
	ldr	r3, [fp, #-68]
	add	r3, r3, #425984
	ldr	r2, [r3, #168]
	cmp	r2, #1
	str	r2, [fp, #-80]
	moveq	r2, #3
	streq	r2, [r3, #168]
	ldreq	r1, [r8, #4]
	ldreq	r9, [r8]
	b	.L1299
.L1334:
	subs	r4, r4, r0
	sbc	r5, r5, r1
	mov	r0, r4
	mov	r1, r5
	ldrd	r4, [fp, #-92]
	cmp	r5, r1
	cmpeq	r4, r0
	strcc	r3, [r8, #8]
	movcc	r2, r3
	b	.L1312
.L1333:
	cmp	r3, r9
	addlt	r3, r3, #1024
	rsb	r1, r9, r3
	ldr	r3, [fp, #-76]
	cmp	r3, #1
	bne	.L1310
	ldr	r3, [fp, #-68]
	ldr	r0, [fp, #-80]
	add	r3, r3, #425984
	ldr	r2, [r3, #160]
	cmp	r1, r2
	cmple	r0, #1
	moveq	r2, r0
	streq	r2, [r3, #168]
.L1310:
	rsb	ip, r10, ip
	mov	r0, lr
	add	r3, lr, ip
	ldrd	r2, [r3, #64]
	b	.L1329
.L1335:
	ldr	r3, [fp, #-68]
	ldr	ip, [fp, #-80]
	add	r3, r3, #425984
	ldr	r0, [r3, #160]
	cmp	r1, r0
	cmple	ip, #1
	moveq	r2, ip
	streq	r2, [r3, #168]
	ldreq	r2, [r8, #8]
	b	.L1315
.L1318:
	mvn	r0, #0
	b	.L1298
.L1337:
	.align	2
.L1336:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SM_SeekPtsInRawArray, .-SM_SeekPtsInRawArray
	.align	2
	.global	SM_SeekPtsAfterFillNewRaw
	.type	SM_SeekPtsAfterFillNewRaw, %function
SM_SeekPtsAfterFillNewRaw:
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
	mov	r4, r2
	mov	r5, r0
	mov	r6, r1
	mov	r0, r2
	mov	r1, #0
	bl	DeleteRawPacketInBuffer
	mov	r0, r4
	bl	FillRawData
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	mov	r3, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	SM_SeekPtsInRawArray
	UNWIND(.fnend)
	.size	SM_SeekPtsAfterFillNewRaw, .-SM_SeekPtsAfterFillNewRaw
	.align	2
	.global	SM_SeekPts
	.type	SM_SeekPts, %function
SM_SeekPts:
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
	clz	r3, r1
	mov	r5, r0
	mov	r7, r1
	mov	r3, r3, lsr #5
	cmp	r0, #31
	movls	r4, r3
	orrhi	r4, r3, #1
	cmp	r4, #0
	bne	.L1352
	ldr	r3, .L1362
	add	r3, r3, r0, lsl #3
	ldr	r6, [r3, #76]
	cmp	r6, #0
	beq	.L1352
	mov	r0, r6
	bl	SM_SeekPtsInSegArray
	cmp	r0, #0
	bne	.L1341
.L1342:
	mov	r0, #0
.L1340:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1341:
	add	r8, r6, #80
	mov	r1, r4
	mov	r0, r5
	bl	DeleteRawPacketInBuffer
	mov	r0, r8
	mov	r3, #1
	mov	r2, r5
	mov	r1, r7
	bl	SM_SeekPtsInRawArray
	cmp	r0, #0
	beq	.L1342
	add	r6, r6, #98304
	ldr	r2, [r6, #80]
	ldr	r0, [r6, #84]
	cmp	r2, r0
	addgt	r0, r0, #1024
	rsb	r0, r2, r0
	ldrd	r2, [r7, #16]
	mov	r1, r0, asr #31
	cmp	r1, r3
	cmpeq	r0, r2
	bcs	.L1361
	subs	r2, r2, r0
	movw	r0, #1023
	sbc	r3, r3, r1
	and	r0, r0, r2
	mov	r1, #0
	mov	r6, r2, lsr #10
	and	r1, r1, r3
	orr	r6, r6, r3, asl #22
	orrs	r1, r0, r1
	addne	r6, r6, #1
	cmp	r6, #0
	movge	r4, #0
	blt	.L1350
.L1349:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r8
	add	r4, r4, #1
	bl	SM_SeekPtsAfterFillNewRaw
	cmp	r0, #0
	beq	.L1342
	cmp	r6, r4
	bge	.L1349
.L1350:
	mvn	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1352:
	mvn	r0, #0
	b	.L1340
.L1361:
	strd	r0, [sp]
	mov	r0, #1
	ldr	r1, .L1362+4
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L1340
.L1363:
	.align	2
.L1362:
	.word	.LANCHOR0
	.word	.LC56
	UNWIND(.fnend)
	.size	SM_SeekPts, .-SM_SeekPts
	.align	2
	.global	SM_MoveRawData
	.type	SM_MoveRawData, %function
SM_MoveRawData:
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
	add	r7, r0, #98304
	mov	r5, r0
	ldr	r3, [r7, #84]
	subs	r6, r3, #1
	addmi	r6, r3, #1020
	addmi	r6, r6, #3
	subs	ip, r3, #2
	addmi	ip, r3, #1020
	addmi	ip, ip, #2
	mov	r1, r6, asl #7
	sub	r1, r1, r6, asl #5
	mov	r3, ip, asl #7
	add	lr, r0, r1
	sub	ip, r3, ip, asl #5
	add	r1, r1, #80
	add	ip, r0, ip
	ldr	r3, [r0, #68]
	add	r4, r0, r1
	ldr	r2, [lr, #92]
	ldr	r0, [ip, #92]
	add	r9, lr, #88
	add	r8, ip, #88
	add	r1, r0, r2
	cmp	r1, r3
	bgt	.L1367
	ldr	r10, .L1369
	add	r5, r5, #425984
	ldr	r3, [ip, #120]
	ldr	r1, [lr, #120]
	add	r0, r0, r3
	ldr	r3, [r10, #52]
	blx	r3
	ldr	r2, [r9, #4]
	ldr	r3, [r8, #4]
	mov	r1, r4
	add	r3, r3, r2
	str	r3, [r8, #4]
	ldr	r0, [r5, #212]
	bl	ReleaseRawStreamData
	mov	r0, #0
	str	r6, [r7, #84]
.L1368:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1367:
	str	r3, [sp]
	mov	r3, r2
	ldr	r1, .L1369+4
	mov	r2, r0
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1368
.L1370:
	.align	2
.L1369:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC57
	UNWIND(.fnend)
	.size	SM_MoveRawData, .-SM_MoveRawData
	.align	2
	.global	SCDDRV_ProcessSegFull
	.type	SCDDRV_ProcessSegFull, %function
SCDDRV_ProcessSegFull:
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
	add	r8, r0, #98304
	add	r4, r0, #425984
	add	r8, r8, #104
	ldrsb	r7, [r0, #1]
	cmp	r8, #0
	mov	r6, r0
	ldr	r5, [r4, #132]
	ldrne	r10, [r4, #152]
	moveq	r9, r8
	ldrne	r9, [r4, #148]
	moveq	r10, r8
	cmp	r7, #0
	bne	.L1373
	add	r5, r5, r5, lsr #31
	cmp	r9, r5, asr #1
	movlt	r3, #1
	movge	r3, #0
	cmp	r10, #127
	movgt	r3, #0
	andle	r3, r3, #1
	cmp	r3, #0
	ldmeqfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	ldr	r3, .L1397
	mov	r2, #1
	strb	r2, [r0, #1]
	ldr	r3, [r3]
	blx	r3
	str	r7, [r4, #240]
	str	r0, [r4, #244]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1373:
	ldr	r3, .L1397
	ldr	r3, [r3]
	blx	r3
	ldr	r2, [r4, #244]
	cmp	r0, r2
	bls	.L1376
	rsb	r2, r2, r0
	str	r2, [r4, #240]
	cmp	r2, #1000
	ble	.L1396
	add	r3, r5, #3
	cmp	r5, #0
	movlt	r5, r3
	cmp	r9, r5, asr #2
	movlt	r3, #1
	movge	r3, #0
	cmp	r10, #63
	movgt	r3, #0
	andle	r3, r3, #1
	cmp	r3, #0
	ldmeqfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	cmp	r9, #0
	bne	.L1379
	ldr	r3, [r4, #464]
	cmp	r3, #0
	beq	.L1379
	cmp	r8, #0
	beq	.L1386
	ldr	r3, [r4, #116]
	ldr	r9, [r4, #112]
	rsb	r9, r9, r3
	ubfx	r9, r9, #0, #12
	cmp	r9, #2
	movwhi	r2, #43691
	movls	r7, r9
	movthi	r2, 43690
	umullhi	r2, r3, r9, r2
	movhi	r7, r3, lsr #1
	cmp	r7, #0
	movne	r5, #0
	beq	.L1380
.L1384:
	ldr	r1, [r4, #112]
	mov	r0, r8
	add	r1, r5, r1
	add	r5, r5, #1
	bl	ReleaseStreamSeg
	cmp	r5, r7
	bne	.L1384
.L1380:
	mov	r3, r9
	mov	r2, r7
	ldr	r1, .L1397+4
	mov	r0, #0
	bl	dprint_vfmw
.L1383:
	mov	r3, #0
	strb	r3, [r6, #1]
	strb	r3, [r6]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1376:
	mov	r3, #0
	str	r0, [r4, #244]
	str	r3, [r4, #240]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1379:
	ldr	r1, .L1397+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r8
	mvn	r1, #0
	bl	ReleaseStreamSeg
	b	.L1383
.L1386:
	mov	r9, r8
	mov	r7, r8
	b	.L1380
.L1396:
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1398:
	.align	2
.L1397:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC58
	.word	.LC59
	UNWIND(.fnend)
	.size	SCDDRV_ProcessSegFull, .-SCDDRV_ProcessSegFull
	.align	2
	.global	SCDDRV_CanNotSelectInst
	.type	SCDDRV_CanNotSelectInst, %function
SCDDRV_CanNotSelectInst:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #16)
	sub	sp, sp, #16
	ldr	r3, .L1412
	add	r0, r3, r0, lsl #3
	ldr	r3, [r0, #76]
	cmp	r3, #0
	beq	.L1402
	add	r2, r3, #425984
	ldr	r1, [r2, #228]
	cmp	r1, #0
	beq	.L1402
	ldr	r2, [r2, #220]
	cmp	r2, #1
	beq	.L1402
	add	r2, r3, #32
	ldr	ip, [r3, #16]
	sub	r3, fp, #24
	ldmia	r2, {r0, r1, r2}
	cmp	ip, #19
	stmia	r3, {r0, r1, r2}
	beq	.L1402
	mov	r1, r3
	mov	r0, ip
	bl	SCDDRV_IsSCDByPass
	adds	r0, r0, #0
	movne	r0, #1
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1402:
	mov	r0, #1
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1413:
	.align	2
.L1412:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_CanNotSelectInst, .-SCDDRV_CanNotSelectInst
	.align	2
	.global	SM_DoNextInstance
	.type	SM_DoNextInstance, %function
SM_DoNextInstance:
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
	ldr	r2, .L1433
	mov	r3, r0, asl #2
	str	r1, [fp, #-48]
	add	r1, r2, r3
	mov	r6, r0
	ldr	r2, [r1, #332]
	cmp	r2, #0
	beq	.L1415
	cmp	r2, #1
	beq	.L1416
.L1425:
	mvn	r0, #2
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1415:
	ldr	r2, .L1433
	rsb	r3, r3, r0, lsl #6
	ldr	r9, .L1433+4
	mov	r5, #32
	add	r3, r2, r3
	ldr	r4, [r3, #44]
	b	.L1424
.L1418:
	subs	r5, r5, #1
	beq	.L1425
.L1424:
	add	r3, r4, #1
	mov	r1, r6
	mov	r4, r3, asr #31
	mov	r4, r4, lsr #27
	add	r3, r3, r4
	and	r3, r3, #31
	rsb	r4, r4, r3
	mov	r0, r4
	bl	SCDDRV_CanNotSelectInst
	cmp	r0, #0
	bne	.L1418
	ldr	r3, .L1433
	ldr	r2, [r9]
	add	r3, r3, r4, lsl #3
	ldr	r10, [r3, #76]
	blx	r2
	add	r8, r10, #425984
	ldr	r1, [r8, #280]
	subs	r1, r0, r1
	bmi	.L1430
	ldrsh	ip, [r10, #2]
	cmp	ip, #1
	beq	.L1431
.L1420:
	str	r0, [r8, #280]
	ldrsb	r1, [r10]
	cmp	r1, #1
	movne	r1, #0
	strneb	r1, [r10, #1]
	beq	.L1432
.L1423:
	ldr	r3, .L1433+8
	mov	r1, r6
	mov	r0, r10
	ldr	ip, [r3, r4, asl #2]
	add	ip, ip, #475136
	ldr	ip, [ip, #1656]
	str	ip, [r8, #432]
	bl	CutStreamWithSCD
	cmn	r0, #6
	mov	r7, r0
	movne	r1, #0
	moveq	r1, #1
	cmp	r0, #0
	strb	r1, [r10]
	bne	.L1418
	ldr	r2, [fp, #-48]
	mov	r3, #1
	ldr	r0, .L1433+12
	mov	r1, r3
	movw	ip, #4623
	str	r4, [r2]
	add	r2, r0, r4, lsl #2
	str	r3, [r8, #228]
	mov	r0, r4
	ldr	r3, .L1433+16
	str	ip, [sp]
	bl	RecordPOS
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1431:
	cmp	r1, #500
	bcc	.L1418
	b	.L1420
.L1430:
	str	r0, [r8, #280]
	ldrsh	r1, [r10, #2]
	cmp	r1, #1
	bne	.L1420
	b	.L1418
.L1432:
	mov	r0, r10
	bl	SCDDRV_ProcessSegFull
	b	.L1423
.L1416:
	mov	r3, #2
	mvn	r0, #2
	str	r3, [r1, #332]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1434:
	.align	2
.L1433:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	s_pstVfmwChan
	.word	.LANCHOR0+468
	.word	.LANCHOR3+488
	UNWIND(.fnend)
	.size	SM_DoNextInstance, .-SM_DoNextInstance
	.align	2
	.type	SCDDRV_ActivateSCD.part.14, %function
SCDDRV_ActivateSCD.part.14:
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
	sub	r1, fp, #32
	mov	r6, r0
	bl	SM_DoNextInstance
	cmp	r0, #0
	bne	.L1435
	ldr	r4, .L1438
	mov	r7, r6, asl #2
	mov	r5, r6, asl #6
	ldr	r2, [fp, #-32]
	rsb	r3, r7, r5
	cmp	r6, #0
	add	r3, r4, r3
	rsb	r5, r7, r5
	str	r2, [r3, #44]
	moveq	r3, #1
	streq	r3, [r4, #48]
	add	r4, r4, r5
	ldr	r3, .L1438+4
	ldr	r3, [r3]
	blx	r3
	movw	r3, #4842
	ldr	r2, .L1438+8
	ldr	r1, .L1438+12
	str	r0, [r4, #52]
	mov	r0, #26
	bl	dprint_vfmw
.L1435:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1439:
	.align	2
.L1438:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3+508
	.word	.LC60
	UNWIND(.fnend)
	.size	SCDDRV_ActivateSCD.part.14, .-SCDDRV_ActivateSCD.part.14
	.align	2
	.global	SCDDRV_RecordGlobalState
	.type	SCDDRV_RecordGlobalState, %function
SCDDRV_RecordGlobalState:
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
	ldr	r3, .L1446
	mov	r4, r0
	mov	r4, r4, asl #6
	ldr	r3, [r3]
	blx	r3
	ldr	r3, .L1446+4
	add	ip, r3, r4
	ldr	r2, [ip, #52]
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r1, [ip, #48]
	add	r4, r3, r4
	mov	r5, #0
	add	lr, r1, #49920
	str	r5, [r4, #52]
	add	lr, lr, #80
	cmp	r2, lr
	strhi	r2, [ip, #48]
	movhi	r1, r2
	rsb	r1, r1, r0
	ldrls	lr, [ip, #56]
	movhi	lr, #0
	cmp	r1, #1000
	rsb	r0, r2, r0
	add	r0, r0, lr
	str	r0, [r4, #56]
	ldmccfd	sp, {r4, r5, fp, sp, pc}
	mov	r3, #1000
	mul	r0, r3, r0
	bl	__aeabi_uidiv
	str	r5, [r4, #48]
	str	r0, [r4, #60]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1447:
	.align	2
.L1446:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_VfmwGlobalStat
	UNWIND(.fnend)
	.size	SCDDRV_RecordGlobalState, .-SCDDRV_RecordGlobalState
	.align	2
	.global	SCDDRV_MoveRawByOmxPath
	.type	SCDDRV_MoveRawByOmxPath, %function
SCDDRV_MoveRawByOmxPath:
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
	ldr	r3, .L1458
	add	r0, r3, r0, lsl #3
	ldr	r4, [r0, #76]
	ldr	r0, [r4, #56]
	cmp	r0, #1
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	adds	r5, r4, #80
	beq	.L1451
	add	r2, r4, #98304
	ldr	r3, [r2, #84]
	ldr	r2, [r2, #80]
	subs	r3, r3, r2
	addmi	r3, r3, #1024
.L1454:
	ldrsb	r5, [r4, #2]
	cmp	r5, #1
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r2, [r4, #64]
	cmp	r2, r3
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	mov	r0, r4
	bl	SM_MoveRawData
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	mov	r0, r5
	ldr	r1, .L1458+4
	bl	dprint_vfmw
	add	r4, r4, #425984
	ldr	r0, [r4, #212]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	SM_Reset
.L1451:
	ldr	r1, .L1458+8
	bl	dprint_vfmw
	mov	r3, r5
	b	.L1454
.L1459:
	.align	2
.L1458:
	.word	.LANCHOR0
	.word	.LC61
	.word	.LC62
	UNWIND(.fnend)
	.size	SCDDRV_MoveRawByOmxPath, .-SCDDRV_MoveRawByOmxPath
	.align	2
	.global	SM_SCDIntServeProc
	.type	SM_SCDIntServeProc, %function
SM_SCDIntServeProc:
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
	subs	r6, r0, #0
	beq	.L1477
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1477:
	ldr	r5, .L1483
	ldr	r4, .L1483+4
	ldr	r3, [r5, #12]
	blx	r3
	ldr	r0, [r4, #72]
	add	r0, r0, #2112
	bl	MEM_ReadPhyWord
	tst	r0, #1
	bne	.L1478
.L1462:
	ldr	r3, .L1483+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1466
	mov	r1, #0
	mov	r0, r1
	bl	VDH_Notify_ModuleIdle
.L1466:
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1478:
	ldr	r0, [r4, #72]
	mov	r1, #1
	add	r0, r0, #2080
	add	r0, r0, #4
	bl	MEM_WritePhyWord
	ldr	r9, [r4, #44]
	ldr	r0, [r4, #40]
	add	r3, r4, r9, lsl #3
	ldr	r8, [r3, #76]
	cmp	r8, #0
	cmpne	r0, #0
	moveq	r7, #1
	movne	r7, #0
	beq	.L1479
	ldr	r3, .L1483+12
	movw	r2, #4716
	mov	r1, #2
	str	r2, [sp]
	mov	r0, r9
	add	r2, r4, #596
	bl	RecordPOS
	mov	r0, r7
	bl	SCDDRV_RecordGlobalState
	ldr	r3, [r4, #48]
	cmp	r3, #1
	beq	.L1480
.L1464:
	ldr	r3, [r5, #128]
	mov	r0, #1
	blx	r3
	ldr	r3, [r5, #128]
	mov	r0, #0
	blx	r3
	b	.L1462
.L1480:
	add	r10, r8, #425984
	ldr	r3, [r10, #228]
	cmp	r3, #1
	beq	.L1481
.L1465:
	mov	r6, #0
	sub	r1, fp, #48
	str	r6, [r10, #220]
	mov	r0, r6
	bl	SM_DoNextInstance
	cmp	r0, r6
	bne	.L1482
	ldr	r2, [fp, #-48]
	mov	r1, #1
	ldr	r3, [r5]
	str	r1, [r4, #48]
	str	r2, [r4, #44]
	blx	r3
	str	r0, [r4, #52]
	b	.L1464
.L1479:
	mov	r0, r6
	bl	SCDDRV_SetStateIdle.part.0
	b	.L1462
.L1482:
	mov	r0, r6
	bl	SCDDRV_SetStateIdle.part.0
	b	.L1464
.L1481:
	mov	r1, r7
	mov	r0, r8
	bl	ProcessScdReturn
	mov	r0, r9
	bl	SCDDRV_MoveRawByOmxPath
	b	.L1465
.L1484:
	.align	2
.L1483:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	g_HalDisable
	.word	.LANCHOR3+528
	UNWIND(.fnend)
	.size	SM_SCDIntServeProc, .-SM_SCDIntServeProc
	.align	2
	.global	SCDDRV_CheckDevice
	.type	SCDDRV_CheckDevice, %function
SCDDRV_CheckDevice:
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
	subs	r6, r0, #0
	bne	.L1494
	ldr	r4, .L1497
	movw	r3, #4768
	str	r6, [sp]
	mov	r0, #26
	ldr	r2, .L1497+4
	ldr	ip, [r4, #48]
	ldr	r1, .L1497+8
	str	ip, [sp, #4]
	bl	dprint_vfmw
	ldr	r5, [r4, #48]
	cmp	r5, #0
	beq	.L1496
	movw	r3, #4777
	ldr	r2, .L1497+4
	ldr	r1, .L1497+8
	mov	r0, #26
	str	r5, [sp, #4]
	str	r6, [sp]
	bl	dprint_vfmw
	ldr	r3, .L1497+12
	ldr	r3, [r3]
	blx	r3
	ldr	r3, [r4, #52]
	cmp	r0, r3
	strcc	r0, [r4, #52]
	bcc	.L1489
	rsb	r0, r3, r0
	cmp	r0, #2000
	bls	.L1489
	ldr	r2, [r4, #44]
	mov	r3, r6
	str	r0, [sp]
	mov	r0, #1
	ldr	r1, .L1497+16
	bl	dprint_vfmw
	ldr	r3, .L1497+20
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1490
	mov	r1, r6
	mov	r0, r6
	bl	VDH_Reset_Module
.L1491:
	mov	r0, #0
	mov	r5, #0
	bl	SCDDRV_SetStateIdle.part.0
	ldr	r0, [r4, #44]
	add	r4, r4, r0, lsl #3
	ldr	r3, [r4, #76]
	cmp	r3, #0
	addne	r3, r3, #425984
	movne	r2, #0
	strne	r2, [r3, #220]
	bl	DeleteLastSendRaw
	mov	r0, r5
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1489:
	mov	r2, #0
	movw	r3, #4823
	str	r2, [sp]
	mov	r0, #26
	ldr	r2, .L1497+4
	mov	r5, #1
	ldr	r1, .L1497+24
	bl	dprint_vfmw
.L1495:
	mov	r0, r5
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1496:
	str	r5, [sp]
	movw	r3, #4772
	ldr	r2, .L1497+4
	mov	r0, #26
	ldr	r1, .L1497+28
	bl	dprint_vfmw
	mov	r0, r5
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1490:
	mov	r0, r6
	bl	ResetSCD
	b	.L1491
.L1494:
	mvn	r5, #0
	b	.L1495
.L1498:
	.align	2
.L1497:
	.word	.LANCHOR0
	.word	.LANCHOR3+548
	.word	.LC63
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC65
	.word	g_HalDisable
	.word	.LC66
	.word	.LC64
	UNWIND(.fnend)
	.size	SCDDRV_CheckDevice, .-SCDDRV_CheckDevice
	.align	2
	.global	SCDDRV_ActivateSCD
	.type	SCDDRV_ActivateSCD, %function
SCDDRV_ActivateSCD:
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
	ldmnefd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SCDDRV_ActivateSCD.part.14
	UNWIND(.fnend)
	.size	SCDDRV_ActivateSCD, .-SCDDRV_ActivateSCD
	.align	2
	.global	SM_Wakeup
	.type	SM_Wakeup, %function
SM_Wakeup:
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
	ldr	r5, .L1512
	mov	r4, #0
	b	.L1503
.L1502:
	add	r4, r4, #1
	cmp	r4, #32
	beq	.L1511
.L1503:
	ldr	r3, [r5, r4, asl #3]
	cmp	r3, #0
	add	r2, r3, #425984
	beq	.L1502
	ldr	r3, [r2, #228]
	cmp	r3, #1
	bne	.L1502
	mov	r0, r4
	add	r4, r4, #1
	bl	FillRawData
	cmp	r4, #32
	bne	.L1503
.L1511:
	mov	r2, #1
	mov	r3, #0
	str	r2, [sp]
	mov	r0, #26
	ldr	r2, .L1512+4
	ldr	r1, .L1512+8
	bl	dprint_vfmw
	mov	r0, #0
	bl	SCDDRV_CheckDevice
	subs	r4, r0, #0
	beq	.L1504
	mov	r2, #0
	movw	r3, #4871
	str	r2, [sp]
	mov	r0, #26
	ldr	r2, .L1512+4
	ldr	r1, .L1512+12
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1504:
	str	r4, [sp]
	movw	r3, #4866
	ldr	r2, .L1512+4
	mov	r0, #26
	ldr	r1, .L1512+16
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	SCDDRV_ActivateSCD.part.14
.L1513:
	.align	2
.L1512:
	.word	.LANCHOR0+76
	.word	.LANCHOR3+568
	.word	.LC67
	.word	.LC68
	.word	.LC69
	UNWIND(.fnend)
	.size	SM_Wakeup, .-SM_Wakeup
	.align	2
	.global	PrintScdRawState
	.type	PrintScdRawState, %function
PrintScdRawState:
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
	cmp	r0, #31
	mov	r5, r0
	mov	r6, r1
	ldmhifd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	mov	r0, #26
	bl	IsDprintTypeEnable
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r3, .L1528
	mov	r2, r5
	ldr	r1, .L1528+4
	mov	r0, #26
	add	r3, r3, r5, lsl #3
	ldr	r8, [r3, #76]
	bl	dprint_vfmw
	ldr	r1, .L1528+8
	mov	r0, #26
	add	r7, r8, #98304
	ldr	r2, [r7, #80]
	bl	dprint_vfmw
	ldr	r2, [r7, #84]
	ldr	r1, .L1528+12
	mov	r0, #26
	bl	dprint_vfmw
	ldr	r2, [r7, #88]
	ldr	r1, .L1528+16
	mov	r0, #26
	bl	dprint_vfmw
	ldr	r2, [r7, #92]
	ldr	r1, .L1528+20
	mov	r0, #26
	bl	dprint_vfmw
	ldr	r2, [r7, #96]
	ldr	r1, .L1528+24
	mov	r0, #26
	bl	dprint_vfmw
	cmp	r6, #1
	beq	.L1518
.L1522:
	mov	r2, r5
	ldr	r1, .L1528+28
	mov	r0, #26
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L1518:
	cmn	r8, #80
	beq	.L1519
	ldr	r4, [r7, #80]
	ldr	r7, [r7, #84]
	subs	r7, r7, r4
	addmi	r7, r7, #1024
	cmp	r7, #0
	ble	.L1522
	mov	r3, r4, asl #7
	mov	r6, #0
	sub	r3, r3, r4, asl #5
	add	r4, r8, r3
.L1521:
	ldr	r2, [r4, #84]
	mov	r0, #26
	ldr	r1, .L1528+32
	add	r6, r6, #1
	bl	dprint_vfmw
	ldrd	r2, [r4, #120]
	ldr	r1, .L1528+36
	mov	r0, #26
	bl	dprint_vfmw
	ldr	r2, [r4, #92]
	ldr	r1, .L1528+40
	mov	r0, #26
	bl	dprint_vfmw
	ldrd	r2, [r4, #144]
	ldr	r1, .L1528+44
	mov	r0, #26
	bl	dprint_vfmw
	cmp	r6, r7
	add	r4, r4, #96
	bne	.L1521
	b	.L1522
.L1519:
	movw	r3, #4900
	ldr	r2, .L1528+48
	ldr	r1, .L1528+52
	mov	r0, #22
	bl	dprint_vfmw
	b	.L1522
.L1529:
	.align	2
.L1528:
	.word	.LANCHOR0
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LANCHOR3+580
	.word	.LC81
	UNWIND(.fnend)
	.size	PrintScdRawState, .-PrintScdRawState
	.align	2
	.global	PrintScdSegState
	.type	PrintScdSegState, %function
PrintScdSegState:
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
	cmp	r0, #31
	mov	r6, r0
	mov	r7, r1
	ldmhifd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	mov	r0, #26
	bl	IsDprintTypeEnable
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r3, .L1544
	mov	r2, r6
	ldr	r1, .L1544+4
	mov	r0, #26
	add	r3, r3, r6, lsl #3
	ldr	r5, [r3, #76]
	bl	dprint_vfmw
	ldr	r1, .L1544+8
	mov	r0, #26
	add	r4, r5, #425984
	add	r8, r5, #98304
	ldr	r2, [r4, #112]
	bl	dprint_vfmw
	ldr	r2, [r4, #116]
	ldr	r1, .L1544+12
	mov	r0, #26
	bl	dprint_vfmw
	ldr	r2, [r4, #124]
	ldr	r1, .L1544+16
	mov	r0, #26
	bl	dprint_vfmw
	ldr	r2, [r4, #128]
	ldr	r1, .L1544+20
	mov	r0, #26
	bl	dprint_vfmw
	ldr	r2, [r8, #104]
	ldr	r1, .L1544+24
	mov	r0, #26
	bl	dprint_vfmw
	ldr	r2, [r4, #132]
	ldr	r1, .L1544+28
	mov	r0, #26
	bl	dprint_vfmw
	ldr	r2, [r4, #136]
	ldr	r1, .L1544+32
	mov	r0, #26
	bl	dprint_vfmw
	ldr	r2, [r4, #140]
	ldr	r1, .L1544+36
	mov	r0, #26
	bl	dprint_vfmw
	cmp	r7, #1
	beq	.L1534
.L1535:
	mov	r2, r6
	ldr	r1, .L1544+40
	mov	r0, #26
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L1534:
	cmn	r8, #104
	beq	.L1535
	ldr	r2, [r4, #112]
	ldr	r8, [r4, #116]
	rsb	r8, r2, r8
	ubfx	r8, r8, #0, #12
	cmp	r8, #0
	ble	.L1535
	mov	r3, r2, asl #6
	mov	r7, #0
	add	r4, r3, r2, lsl #4
	add	r4, r4, #98304
	add	r4, r4, #124
	add	r4, r5, r4
.L1536:
	ldr	r2, [r4]
	mov	r0, #26
	ldr	r1, .L1544+44
	add	r7, r7, #1
	bl	dprint_vfmw
	ldr	r2, [r4, #-12]
	ldr	r1, .L1544+48
	mov	r0, #26
	bl	dprint_vfmw
	ldr	r2, [r4, #4]
	ldr	r1, .L1544+52
	mov	r0, #26
	bl	dprint_vfmw
	ldr	r2, [r4, #8]
	ldr	r1, .L1544+56
	mov	r0, #26
	bl	dprint_vfmw
	ldrsb	r2, [r4, #-8]
	ldr	r1, .L1544+60
	mov	r0, #26
	bl	dprint_vfmw
	ldrb	r2, [r4, #-6]	@ zero_extendqisi2
	ldr	r1, .L1544+64
	mov	r0, #26
	bl	dprint_vfmw
	ldrd	r2, [r4, #12]
	ldr	r1, .L1544+68
	mov	r0, #26
	bl	dprint_vfmw
	cmp	r8, r7
	add	r4, r4, #80
	bne	.L1536
	b	.L1535
.L1545:
	.align	2
.L1544:
	.word	.LANCHOR0
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.word	.LC98
	UNWIND(.fnend)
	.size	PrintScdSegState, .-PrintScdSegState
	.global	g_pScdDrvParamBase
	.global	s_ScdRegResetOKPhyAddr
	.global	s_ScdRegResetPhyAddr
	.global	s_ScdRegPhyBaseAddr
	.global	g_ScdDrvParam
	.global	s_SmIIS
	.global	g_hex_flag
	.global	g_hex_len
	.global	g_hex_base_addr
	.global	g_hex_base_vir_addr
	.section	.rodata
	.align	2
.LANCHOR3 = . + 0
	.type	__func__.18269, %object
	.size	__func__.18269, 19
__func__.18269:
	.ascii	"SCDDRV_LoadDspCode\000"
	.space	1
	.type	__func__.18341, %object
	.size	__func__.18341, 16
__func__.18341:
	.ascii	"DeleteRawPacket\000"
	.type	__FUNCTION__.18447, %object
	.size	__FUNCTION__.18447, 17
__FUNCTION__.18447:
	.ascii	"ReleaseStreamSeg\000"
	.space	3
	.type	__func__.18584, %object
	.size	__func__.18584, 16
__func__.18584:
	.ascii	"SM_LinkRawToSeg\000"
	.type	__func__.18604, %object
	.size	__func__.18604, 16
__func__.18604:
	.ascii	"SM_CopyRawToSeg\000"
	.type	__func__.18937, %object
	.size	__func__.18937, 17
__func__.18937:
	.ascii	"GetMpeg4ModeFlag\000"
	.space	3
	.type	__func__.18996, %object
	.size	__func__.18996, 15
__func__.18996:
	.ascii	"NeedReadStream\000"
	.space	1
.LC0:
	.byte	0
	.byte	0
	.byte	1
	.byte	30
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	30
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-70
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	-70
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	96
	.byte	0
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	-1
	.byte	0
	.byte	0
	.byte	0
	.type	__func__.19020, %object
	.size	__func__.19020, 17
__func__.19020:
	.ascii	"FillEopRawStream\000"
	.space	3
.LC1:
	.byte	0
	.byte	0
	.byte	1
	.byte	11
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-73
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	-73
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	98
	.byte	0
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	__func__.19048, %object
	.size	__func__.19048, 17
__func__.19048:
	.ascii	"FillEosRawStream\000"
	.space	3
	.type	__func__.19073, %object
	.size	__func__.19073, 17
__func__.19073:
	.ascii	"FillVC1ExtraData\000"
	.space	3
	.type	__func__.19078, %object
	.size	__func__.19078, 19
__func__.19078:
	.ascii	"FillDIVX3ExtraData\000"
	.space	1
	.type	__func__.19083, %object
	.size	__func__.19083, 19
__func__.19083:
	.ascii	"FillREAL8ExtraData\000"
	.space	1
	.type	__func__.19091, %object
	.size	__func__.19091, 14
__func__.19091:
	.ascii	"FillExtraData\000"
	.space	2
	.type	__func__.18355, %object
	.size	__func__.18355, 24
__func__.18355:
	.ascii	"DeleteRawPacketInBuffer\000"
	.type	__FUNCTION__.18489, %object
	.size	__FUNCTION__.18489, 9
__FUNCTION__.18489:
	.ascii	"SM_Reset\000"
	.space	3
	.type	__FUNCTION__.19010, %object
	.size	__FUNCTION__.19010, 12
__FUNCTION__.19010:
	.ascii	"FillRawData\000"
	.type	__FUNCTION__.19217, %object
	.size	__FUNCTION__.19217, 18
__FUNCTION__.19217:
	.ascii	"SM_DoNextInstance\000"
	.space	2
	.type	__func__.19254, %object
	.size	__func__.19254, 19
__func__.19254:
	.ascii	"SCDDRV_ActivateSCD\000"
	.space	1
	.type	__FUNCTION__.19241, %object
	.size	__FUNCTION__.19241, 19
__FUNCTION__.19241:
	.ascii	"SM_SCDIntServeProc\000"
	.space	1
	.type	__func__.19248, %object
	.size	__func__.19248, 19
__func__.19248:
	.ascii	"SCDDRV_CheckDevice\000"
	.space	1
	.type	__func__.19263, %object
	.size	__func__.19263, 10
__func__.19263:
	.ascii	"SM_Wakeup\000"
	.space	2
	.type	__FUNCTION__.19275, %object
	.size	__FUNCTION__.19275, 17
__FUNCTION__.19275:
	.ascii	"PrintScdRawState\000"
	.data
	.align	2
.LANCHOR1 = . + 0
.LANCHOR2 = . + 16368
	.type	g_avsp_firmware, %object
	.size	g_avsp_firmware, 17920
g_avsp_firmware:
	.word	0
	.word	16283648
	.word	16349954
	.word	9468936
	.word	-252085482
	.word	9468688
	.word	9468692
	.word	16284426
	.word	9468680
	.word	18807566
	.word	-258442240
	.word	10517258
	.word	18807566
	.word	-258442239
	.word	10517258
	.word	18807566
	.word	-258442238
	.word	10517258
	.word	18807566
	.word	-258442237
	.word	10517258
	.word	18807566
	.word	-258442236
	.word	10517258
	.word	18807566
	.word	-258442235
	.word	10517258
	.word	18807566
	.word	-258442234
	.word	10517258
	.word	18807566
	.word	-258442233
	.word	10517258
	.word	-251200754
	.word	10517258
	.word	17758990
	.word	33128448
	.word	24738824
	.word	-1879048192
	.word	16349954
	.word	0
	.word	18512896
	.word	33390592
	.word	24738817
	.word	-250447311
	.word	9468672
	.word	17988136
	.word	-795837688
	.word	12090128
	.word	18807566
	.word	24967950
	.word	-249398743
	.word	33259520
	.word	554859056
	.word	-258966784
	.word	19561007
	.word	-235307008
	.word	-1063027960
	.word	16349968
	.word	0
	.word	11041536
	.word	0
	.word	1073741824
	.word	33259520
	.word	554859057
	.word	9468672
	.word	0
	.word	-1342177280
	.word	0
	.word	33128448
	.word	-1592624595
	.word	-258966776
	.word	12090128
	.word	0
	.word	17988137
	.word	9468680
	.word	16349968
	.word	17988143
	.word	-258966784
	.word	0
	.word	33521664
	.word	-1879048192
	.word	0
	.word	-1610612736
	.word	-248874449
	.word	9468688
	.word	9468692
	.word	11041536
	.word	0
	.word	0
	.word	0
	.word	286948352
	.word	9467906
	.word	33128448
	.word	-1320519377
	.word	1630697896
	.word	33128448
	.word	-786269183
	.word	17988140
	.word	9468680
	.word	12090128
	.word	21953294
	.word	19400197
	.word	33128448
	.word	-1059883006
	.word	33062912
	.word	-1073741824
	.word	1358526466
	.word	-1342177280
	.word	-1879048192
	.word	17988009
	.word	1620081416
	.word	1354267408
	.word	21953294
	.word	19400216
	.word	33128448
	.word	-2133624830
	.word	33062912
	.word	-2147483648
	.word	-2131134462
	.word	19400222
	.word	33128448
	.word	0
	.word	19036462
	.word	33390592
	.word	33398784
	.word	1092253959
	.word	33128448
	.word	1362626056
	.word	17988013
	.word	9468680
	.word	12090128
	.word	21429006
	.word	1092253999
	.word	33128448
	.word	-250447444
	.word	9468680
	.word	12090128
	.word	24673282
	.word	-250447445
	.word	814775048
	.word	12090128
	.word	0
	.word	-785744896
	.word	556956675
	.word	33128448
	.word	-235298816
	.word	-235290624
	.word	25000964
	.word	-2147483648
	.word	33128448
	.word	-1050147328
	.word	18351619
	.word	18875907
	.word	554858927
	.word	33128448
	.word	-235290624
	.word	-1073741824
	.word	10517258
	.word	9468680
	.word	0
	.word	-1845493760
	.word	23594500
	.word	18875906
	.word	554858927
	.word	33128448
	.word	-1073741824
	.word	10517258
	.word	9468680
	.word	0
	.word	872415232
	.word	-2147483648
	.word	18351646
	.word	24926480
	.word	-2124785392
	.word	-2147483648
	.word	0
	.word	19028272
	.word	20601264
	.word	554858927
	.word	10517258
	.word	546339592
	.word	0
	.word	-268435456
	.word	-1592100601
	.word	12090128
	.word	33128448
	.word	1634207232
	.word	18351619
	.word	18875907
	.word	554859050
	.word	33128448
	.word	-235290624
	.word	-1073741824
	.word	10517258
	.word	9468680
	.word	0
	.word	17988139
	.word	9468680
	.word	0
	.word	-771751936
	.word	23594500
	.word	18875906
	.word	554859050
	.word	33128448
	.word	-1073741824
	.word	10517258
	.word	9468680
	.word	0
	.word	17988139
	.word	9468680
	.word	0
	.word	-1543503872
	.word	1073741824
	.word	18351646
	.word	24926480
	.word	1096440080
	.word	-2147483648
	.word	17988138
	.word	19028272
	.word	20601264
	.word	536870912
	.word	10517258
	.word	9468680
	.word	17988139
	.word	9468680
	.word	0
	.word	-1879048192
	.word	1366850566
	.word	33398784
	.word	17987886
	.word	33398784
	.word	33398784
	.word	-518882770
	.word	9468680
	.word	16349968
	.word	0
	.word	-536870912
	.word	1903720450
	.word	1092093440
	.word	17988010
	.word	9468680
	.word	12090128
	.word	18807566
	.word	33259520
	.word	293436421
	.word	25000967
	.word	-1055753810
	.word	9468680
	.word	12090128
	.word	0
	.word	33460224
	.word	33460224
	.word	33198080
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1011712
	.word	0
	.word	0
	.word	1013760
	.word	18687
	.word	0
	.word	0
	.word	18688
	.word	0
	.word	0
	.word	103084
	.word	0
	.word	0
	.word	102700
	.word	0
	.word	0
	.word	102700
	.word	0
	.word	0
	.word	102700
	.word	0
	.word	0
	.word	102700
	.word	0
	.word	0
	.word	102700
	.word	0
	.word	0
	.word	102700
	.word	0
	.word	0
	.word	102700
	.word	0
	.word	102700
	.word	0
	.word	18432
	.word	916608
	.word	0
	.word	1027074
	.word	0
	.word	1013760
	.word	18432
	.word	916620
	.word	908352
	.word	1027075
	.word	0
	.word	1013760
	.word	105964
	.word	0
	.word	1013760
	.word	0
	.word	1031171
	.word	916484
	.word	1031173
	.word	98348
	.word	1013760
	.word	904428
	.word	1027075
	.word	0
	.word	1013760
	.word	0
	.word	1013760
	.word	1027075
	.word	916484
	.word	1031173
	.word	0
	.word	1013760
	.word	1035269
	.word	1031168
	.word	916712
	.word	1031172
	.word	23807
	.word	0
	.word	1013760
	.word	0
	.word	0
	.word	0
	.word	1013760
	.word	98348
	.word	1013760
	.word	916484
	.word	1031170
	.word	1007616
	.word	1018885
	.word	18687
	.word	0
	.word	0
	.word	0
	.word	1013760
	.word	1018880
	.word	1007616
	.word	18432
	.word	20480
	.word	916688
	.word	1031175
	.word	23552
	.word	916696
	.word	1027078
	.word	0
	.word	0
	.word	0
	.word	1013760
	.word	108112
	.word	917096
	.word	1031174
	.word	917076
	.word	1027078
	.word	25600
	.word	1018887
	.word	23553
	.word	908752
	.word	19456
	.word	22528
	.word	1013760
	.word	108112
	.word	917096
	.word	1031175
	.word	917076
	.word	1027079
	.word	25601
	.word	108108
	.word	917076
	.word	222628
	.word	19456
	.word	917068
	.word	917072
	.word	1027086
	.word	917068
	.word	1027080
	.word	0
	.word	0
	.word	0
	.word	1013760
	.word	23552
	.word	917068
	.word	1027080
	.word	0
	.word	0
	.word	1013760
	.word	1027080
	.word	23552
	.word	0
	.word	1013760
	.word	19457
	.word	20480
	.word	916756
	.word	916908
	.word	916844
	.word	0
	.word	1027083
	.word	917068
	.word	1027082
	.word	105120
	.word	595340
	.word	105112
	.word	916816
	.word	916844
	.word	185196
	.word	0
	.word	0
	.word	1013760
	.word	989193
	.word	105120
	.word	595340
	.word	105112
	.word	916816
	.word	185196
	.word	0
	.word	0
	.word	1013760
	.word	989194
	.word	1018891
	.word	113316
	.word	112296
	.word	1031179
	.word	310092
	.word	113572
	.word	0
	.word	0
	.word	69916
	.word	0
	.word	23552
	.word	1013760
	.word	988170
	.word	23553
	.word	0
	.word	917068
	.word	1027085
	.word	105120
	.word	595340
	.word	105112
	.word	916816
	.word	916844
	.word	185196
	.word	0
	.word	0
	.word	1013760
	.word	0
	.word	0
	.word	1013760
	.word	989195
	.word	105120
	.word	595340
	.word	105112
	.word	916816
	.word	185196
	.word	0
	.word	0
	.word	1013760
	.word	0
	.word	0
	.word	1013760
	.word	989196
	.word	1018894
	.word	113316
	.word	112296
	.word	1031182
	.word	310092
	.word	113572
	.word	0
	.word	0
	.word	69916
	.word	0
	.word	0
	.word	1013760
	.word	0
	.word	1013760
	.word	988173
	.word	19456
	.word	917068
	.word	19456
	.word	917068
	.word	917064
	.word	1027086
	.word	0
	.word	0
	.word	1013760
	.word	1018894
	.word	23552
	.word	1027087
	.word	0
	.word	0
	.word	0
	.word	1013760
	.word	916712
	.word	23556
	.word	0
	.word	1027087
	.word	0
	.word	0
	.word	1013760
	.word	999424
	.word	999424
	.word	999424
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	65537
	.word	1900544
	.word	513
	.word	1537
	.word	352782197
	.word	352782197
	.word	65536
	.word	131074
	.word	4
	.word	0
	.word	65537
	.word	131073
	.word	131074
	.word	131074
	.word	131074
	.word	131074
	.word	131074
	.word	131074
	.word	131074
	.word	131074
	.word	2
	.word	327686
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	131072
	.word	1
	.word	131072
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	65538
	.word	1
	.word	0
	.word	0
	.word	131072
	.word	131073
	.word	131073
	.word	1
	.word	131072
	.word	1
	.word	131072
	.word	131073
	.word	131073
	.word	1
	.word	0
	.word	0
	.word	2
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	3
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	524289
	.word	4196352
	.word	1048608
	.word	8396800
	.word	0
	.word	0
	.word	0
	.word	0
	.word	65536
	.word	0
	.word	65536
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	65536
	.word	65537
	.word	65537
	.word	1
	.word	65536
	.word	1
	.word	65536
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	131073
	.word	33554688
	.word	1073741828
	.word	132096
	.word	65540
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.type	g_h264_firmware, %object
	.size	g_h264_firmware, 17920
g_h264_firmware:
	.word	0
	.word	823064910
	.word	8419328
	.word	9239400
	.word	16349184
	.word	285670144
	.word	33128448
	.word	-1879048192
	.word	1342177280
	.word	0
	.word	8420384
	.word	8420386
	.word	8420387
	.word	8420388
	.word	8420389
	.word	8420390
	.word	8420391
	.word	8420393
	.word	8420394
	.word	8420395
	.word	8420392
	.word	8420396
	.word	8715424
	.word	8715428
	.word	8682668
	.word	8682542
	.word	8682671
	.word	268435456
	.word	8420385
	.word	-1342177280
	.word	24673452
	.word	-268435456
	.word	24673326
	.word	1610612736
	.word	17234198
	.word	0
	.word	-2130020076
	.word	33259520
	.word	1610612736
	.word	1091206148
	.word	33259520
	.word	1610612736
	.word	17234274
	.word	822770726
	.word	33259520
	.word	1610612736
	.word	33325056
	.word	1610612736
	.word	-1342177280
	.word	16349184
	.word	286194442
	.word	805306368
	.word	0
	.word	33128448
	.word	-2147483648
	.word	268435456
	.word	16349184
	.word	277150492
	.word	9239324
	.word	805306368
	.word	8419328
	.word	0
	.word	805306368
	.word	8419328
	.word	17234796
	.word	17758530
	.word	0
	.word	-268435456
	.word	1342177280
	.word	-235044864
	.word	1628371250
	.word	0
	.word	17464358
	.word	0
	.word	-235044864
	.word	1610612736
	.word	0
	.word	536870912
	.word	1610612736
	.word	24673326
	.word	-536870912
	.word	17234200
	.word	0
	.word	-2130020076
	.word	33259520
	.word	1610612736
	.word	1091206148
	.word	33259520
	.word	1610612736
	.word	17234274
	.word	822770726
	.word	33259520
	.word	1610612736
	.word	33325056
	.word	1610612736
	.word	-1342177280
	.word	16349184
	.word	286194442
	.word	805306368
	.word	0
	.word	33128448
	.word	1879048192
	.word	0
	.word	16349184
	.word	277150492
	.word	9239324
	.word	805306368
	.word	8419328
	.word	0
	.word	805306368
	.word	8419328
	.word	17234796
	.word	17758530
	.word	0
	.word	-268435456
	.word	1342177280
	.word	-235044864
	.word	1628371250
	.word	0
	.word	17464358
	.word	0
	.word	-235044864
	.word	-536870912
	.word	268435456
	.word	536870912
	.word	1610612736
	.word	24673455
	.word	1610612736
	.word	24935457
	.word	1610612736
	.word	24706208
	.word	1610612736
	.word	0
	.word	536870912
	.word	16349184
	.word	17758488
	.word	8715034
	.word	9239322
	.word	0
	.word	17234228
	.word	17758984
	.word	17758980
	.word	268435456
	.word	0
	.word	-234913792
	.word	1342177280
	.word	21428994
	.word	23525654
	.word	21952790
	.word	20904718
	.word	17758520
	.word	0
	.word	17234288
	.word	18282794
	.word	18807142
	.word	-2147483648
	.word	19331382
	.word	17235072
	.word	18283652
	.word	0
	.word	8715418
	.word	0
	.word	9763996
	.word	33325056
	.word	-1610612736
	.word	18282774
	.word	824113430
	.word	9239710
	.word	17235098
	.word	1610612736
	.word	16349184
	.word	9239710
	.word	17235098
	.word	17758988
	.word	0
	.word	805306368
	.word	17235098
	.word	18283278
	.word	18807964
	.word	0
	.word	805306368
	.word	18283278
	.word	-1073741824
	.word	268435456
	.word	17988648
	.word	286194026
	.word	33128448
	.word	-1879048192
	.word	33128448
	.word	-1861813906
	.word	33128448
	.word	822540652
	.word	33128448
	.word	-536870912
	.word	0
	.word	-1073741824
	.word	24673280
	.word	805306368
	.word	16349184
	.word	17234704
	.word	19037185
	.word	-2129725162
	.word	18282848
	.word	18807144
	.word	-2147483648
	.word	805306368
	.word	805306368
	.word	24673296
	.word	805306368
	.word	16349184
	.word	17234706
	.word	19037201
	.word	-2129725088
	.word	18282848
	.word	18807144
	.word	-2147483648
	.word	805306368
	.word	17235098
	.word	17759388
	.word	18283678
	.word	8715424
	.word	9239714
	.word	9764004
	.word	14711981
	.word	822609409
	.word	17827328
	.word	1879048192
	.word	21952864
	.word	-2147483648
	.word	16349184
	.word	17234228
	.word	17758984
	.word	0
	.word	17758980
	.word	268435456
	.word	33062912
	.word	-2147483648
	.word	-235175936
	.word	0
	.word	-235110400
	.word	-2147483648
	.word	16349184
	.word	17234288
	.word	17758978
	.word	18282782
	.word	18807142
	.word	-2147483648
	.word	16349184
	.word	20904718
	.word	17758520
	.word	0
	.word	19331382
	.word	17235072
	.word	0
	.word	0
	.word	8715420
	.word	16349184
	.word	17235100
	.word	17758982
	.word	0
	.word	17758988
	.word	33259520
	.word	-805306368
	.word	17235100
	.word	17758982
	.word	805306368
	.word	18282774
	.word	18807062
	.word	1879048192
	.word	17235100
	.word	17758988
	.word	0
	.word	0
	.word	805306368
	.word	17235100
	.word	18283278
	.word	18807558
	.word	0
	.word	805306368
	.word	-1073741824
	.word	268435456
	.word	17988648
	.word	286194026
	.word	33128448
	.word	1073741824
	.word	33128448
	.word	1073741824
	.word	822609409
	.word	17827328
	.word	1879048192
	.word	0
	.word	8420524
	.word	24706208
	.word	-2147483648
	.word	17759396
	.word	33521664
	.word	-536870912
	.word	17235104
	.word	17759396
	.word	18282774
	.word	18807062
	.word	-1879048192
	.word	16349184
	.word	17235104
	.word	17758988
	.word	0
	.word	805306368
	.word	17235104
	.word	18283278
	.word	18807970
	.word	0
	.word	805306368
	.word	18283278
	.word	-1073741824
	.word	268435456
	.word	17988648
	.word	286194026
	.word	33390592
	.word	0
	.word	536870912
	.word	33390592
	.word	-2147483648
	.word	268435456
	.word	1879048192
	.word	268435456
	.word	268435456
	.word	8420524
	.word	0
	.word	0
	.word	8420398
	.word	0
	.word	16349184
	.word	17234708
	.word	8715430
	.word	17758498
	.word	0
	.word	8715432
	.word	17758488
	.word	18807562
	.word	1073741824
	.word	0
	.word	805306368
	.word	8419328
	.word	16940070
	.word	17758514
	.word	0
	.word	-250676968
	.word	-268435456
	.word	1342177280
	.word	17758488
	.word	-268435456
	.word	1610612736
	.word	0
	.word	-268435456
	.word	-268435456
	.word	268435456
	.word	0
	.word	8715104
	.word	268435456
	.word	-536870912
	.word	8715106
	.word	16349184
	.word	17234708
	.word	805306368
	.word	10516480
	.word	8715108
	.word	17235088
	.word	8715110
	.word	17234214
	.word	8715120
	.word	17234244
	.word	8715118
	.word	16940060
	.word	-268435456
	.word	-805306368
	.word	17464339
	.word	-268435456
	.word	-1073741824
	.word	17464340
	.word	-268435456
	.word	-1323894504
	.word	17464322
	.word	0
	.word	-268435456
	.word	-1610612736
	.word	17464324
	.word	-268435456
	.word	268435456
	.word	24673285
	.word	-2147483648
	.word	17758486
	.word	805306368
	.word	24673316
	.word	-512197595
	.word	-1055983330
	.word	805306368
	.word	17758488
	.word	805306368
	.word	24673286
	.word	286193958
	.word	805306368
	.word	17758486
	.word	805306368
	.word	-536870912
	.word	17464323
	.word	0
	.word	8715328
	.word	17235110
	.word	18282776
	.word	18807144
	.word	-2147483648
	.word	16349184
	.word	17234710
	.word	8715330
	.word	1090976934
	.word	0
	.word	286718232
	.word	18807144
	.word	-2147483648
	.word	17235112
	.word	8715332
	.word	1090976934
	.word	0
	.word	555153688
	.word	18807144
	.word	-2147483648
	.word	16349184
	.word	17234712
	.word	8715334
	.word	-2130248538
	.word	0
	.word	823589144
	.word	18807144
	.word	-2147483648
	.word	17235090
	.word	8715336
	.word	16940202
	.word	8715338
	.word	17235092
	.word	33259520
	.word	-1610612736
	.word	0
	.word	8715340
	.word	17235094
	.word	8715342
	.word	16940203
	.word	8715344
	.word	17235096
	.word	33259520
	.word	805306368
	.word	0
	.word	8715346
	.word	-1593672675
	.word	17464365
	.word	0
	.word	-268435456
	.word	-1342177280
	.word	822770723
	.word	0
	.word	-268435456
	.word	-1879048192
	.word	17464353
	.word	0
	.word	8715348
	.word	-251495381
	.word	0
	.word	-268435456
	.word	1628077098
	.word	0
	.word	-268435456
	.word	268435456
	.word	17464327
	.word	-536870912
	.word	17464354
	.word	18807064
	.word	33128448
	.word	0
	.word	33128448
	.word	536870912
	.word	1091500310
	.word	268435456
	.word	1073741824
	.word	536870912
	.word	1073741824
	.word	0
	.word	8715350
	.word	17235112
	.word	1092024672
	.word	18807144
	.word	-2147483648
	.word	16940070
	.word	17758514
	.word	0
	.word	-268435456
	.word	8715352
	.word	17235112
	.word	0
	.word	-1055459048
	.word	18807144
	.word	-2147483648
	.word	0
	.word	8715354
	.word	-1056506712
	.word	0
	.word	-787023592
	.word	18807144
	.word	-2147483648
	.word	0
	.word	554173952
	.word	17827336
	.word	1879048192
	.word	-251200684
	.word	0
	.word	8420526
	.word	822609408
	.word	17827352
	.word	1879048192
	.word	-1073741824
	.word	11566081
	.word	-250446847
	.word	33325056
	.word	-805306368
	.word	17988609
	.word	33325056
	.word	-805306368
	.word	20085934
	.word	554203411
	.word	33128448
	.word	0
	.word	33128448
	.word	0
	.word	-2130151150
	.word	33128448
	.word	0
	.word	33128448
	.word	0
	.word	-519538416
	.word	33128448
	.word	0
	.word	33128448
	.word	16808209
	.word	33128448
	.word	0
	.word	-805306368
	.word	1091074311
	.word	33128448
	.word	-1342177280
	.word	33128448
	.word	-1342177280
	.word	-1593280239
	.word	33128448
	.word	-1342177280
	.word	33128448
	.word	-1342177280
	.word	-805306368
	.word	-1073741824
	.word	11566082
	.word	17827329
	.word	0
	.word	0
	.word	33390592
	.word	-805306368
	.word	-1073741824
	.word	0
	.word	33390592
	.word	-805306368
	.word	-1073741824
	.word	0
	.word	33390592
	.word	-805306368
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	0
	.word	33390592
	.word	-805306368
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	268435456
	.word	33390592
	.word	-268435456
	.word	0
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24673454
	.word	-1073741824
	.word	-2128083448
	.word	0
	.word	0
	.word	33128448
	.word	805306368
	.word	-805306368
	.word	18282786
	.word	0
	.word	17758564
	.word	0
	.word	0
	.word	33128448
	.word	1879048192
	.word	0
	.word	286193948
	.word	0
	.word	33062912
	.word	-1073741824
	.word	-1342177280
	.word	-234881024
	.word	0
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24673454
	.word	-1342177280
	.word	-2128083448
	.word	0
	.word	0
	.word	33128448
	.word	536870912
	.word	-805306368
	.word	18282786
	.word	0
	.word	17758564
	.word	0
	.word	0
	.word	33128448
	.word	1610612736
	.word	0
	.word	286193964
	.word	0
	.word	33062912
	.word	-1342177280
	.word	-1610612736
	.word	-536870912
	.word	-268435456
	.word	268435456
	.word	8420354
	.word	-1073741824
	.word	11566088
	.word	-1073741824
	.word	33259520
	.word	1342177280
	.word	-805306368
	.word	-1073741824
	.word	11566089
	.word	0
	.word	33128448
	.word	268435456
	.word	268435456
	.word	33128448
	.word	1879048192
	.word	536870912
	.word	33128448
	.word	-805306368
	.word	-805306368
	.word	-1073741824
	.word	11566091
	.word	-1073741824
	.word	33521664
	.word	-805306368
	.word	-805306368
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	17234772
	.word	8420362
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	1879048192
	.word	1879048192
	.word	-1073741824
	.word	11566254
	.word	-268435456
	.word	33259520
	.word	-805306368
	.word	0
	.word	33521664
	.word	-805306368
	.word	16940206
	.word	0
	.word	1879048192
	.word	-1342177280
	.word	-1073741824
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	-1073741824
	.word	11566083
	.word	286193960
	.word	33325056
	.word	-805306368
	.word	33062912
	.word	-805306368
	.word	-1073741824
	.word	11566084
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566085
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	0
	.word	33128448
	.word	1610612736
	.word	-2147483648
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566086
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	286193946
	.word	20085764
	.word	33325056
	.word	-805306368
	.word	33062912
	.word	-805306368
	.word	825392131
	.word	33325056
	.word	-805306368
	.word	0
	.word	0
	.word	8420358
	.word	286193956
	.word	20085764
	.word	33325056
	.word	-805306368
	.word	33062912
	.word	-805306368
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566087
	.word	24673455
	.word	-805306368
	.word	822609409
	.word	17827329
	.word	1879048192
	.word	268435456
	.word	8420352
	.word	0
	.word	822609409
	.word	17827328
	.word	1879048192
	.word	0
	.word	8420352
	.word	0
	.word	-1073741824
	.word	11566097
	.word	17827583
	.word	33325056
	.word	-1342177280
	.word	33259520
	.word	-1342177280
	.word	-1073741824
	.word	11566098
	.word	17827359
	.word	33325056
	.word	-1342177280
	.word	33259520
	.word	-1342177280
	.word	16349184
	.word	286194442
	.word	805306368
	.word	0
	.word	33128448
	.word	-2147483648
	.word	268435456
	.word	16349184
	.word	17758992
	.word	19037202
	.word	-2130249450
	.word	18282848
	.word	18807142
	.word	-2147483648
	.word	24935424
	.word	-1342177280
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566099
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566101
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	-1073741824
	.word	0
	.word	33390592
	.word	-1342177280
	.word	-1073741824
	.word	11566103
	.word	-268435456
	.word	33259520
	.word	-1342177280
	.word	-1073741824
	.word	11566104
	.word	-268435456
	.word	33259520
	.word	-1342177280
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566106
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	554173952
	.word	17827330
	.word	1879048192
	.word	20380500
	.word	11566107
	.word	822609408
	.word	17827330
	.word	1879048192
	.word	805306368
	.word	33062912
	.word	-1342177280
	.word	-805306368
	.word	11566109
	.word	-805306368
	.word	-805306368
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566105
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566100
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566102
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	17234198
	.word	8420380
	.word	822541470
	.word	17759062
	.word	0
	.word	33521664
	.word	805306368
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566108
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24935452
	.word	805306368
	.word	0
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	33390592
	.word	268435456
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	17235102
	.word	17759062
	.word	33521664
	.word	-536870912
	.word	-268435456
	.word	0
	.word	8420380
	.word	805306368
	.word	268435456
	.word	8420380
	.word	24673455
	.word	-1342177280
	.word	822609409
	.word	17827328
	.word	1879048192
	.word	268435456
	.word	8420368
	.word	0
	.word	822609409
	.word	17827328
	.word	1879048192
	.word	0
	.word	8420368
	.word	0
	.word	-1073741824
	.word	11566113
	.word	17758528
	.word	33062912
	.word	268435456
	.word	-1073741824
	.word	536870912
	.word	33128448
	.word	1610612736
	.word	1073741824
	.word	33128448
	.word	1610612736
	.word	1879048192
	.word	33128448
	.word	1610612736
	.word	-1879048192
	.word	33128448
	.word	1610612736
	.word	0
	.word	33128448
	.word	-1879048192
	.word	805306368
	.word	33128448
	.word	-1879048192
	.word	1342177280
	.word	33128448
	.word	-1879048192
	.word	-2147483648
	.word	33128448
	.word	-1879048192
	.word	268435456
	.word	33128448
	.word	-1073741824
	.word	1610612736
	.word	33128448
	.word	-1073741824
	.word	268435456
	.word	536870912
	.word	8944674
	.word	-536870912
	.word	0
	.word	8944674
	.word	-536870912
	.word	268435456
	.word	8944674
	.word	-1073741824
	.word	11566112
	.word	-268435456
	.word	33259520
	.word	268435456
	.word	16349184
	.word	286194442
	.word	805306368
	.word	0
	.word	33128448
	.word	-1610612736
	.word	805306368
	.word	16349184
	.word	17758994
	.word	19037216
	.word	-2130249376
	.word	18282848
	.word	18807142
	.word	-2147483648
	.word	24935440
	.word	268435456
	.word	16349184
	.word	17758992
	.word	19037202
	.word	-2130249450
	.word	18282848
	.word	18807142
	.word	-2147483648
	.word	24935424
	.word	268435456
	.word	822609408
	.word	1092254728
	.word	0
	.word	1879048192
	.word	0
	.word	8420388
	.word	8420389
	.word	24673285
	.word	1879048192
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566116
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24673316
	.word	1879048192
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566117
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	16940035
	.word	17464324
	.word	-268435456
	.word	-268435456
	.word	-2147483648
	.word	8420390
	.word	24673285
	.word	-1610612736
	.word	24673316
	.word	-1610612736
	.word	554335270
	.word	-2147483648
	.word	8420390
	.word	554335236
	.word	-268435456
	.word	-2147483648
	.word	268435456
	.word	0
	.word	8420356
	.word	285375524
	.word	17464326
	.word	0
	.word	8420391
	.word	1359641640
	.word	33390592
	.word	1342177280
	.word	-1073741824
	.word	17758528
	.word	33259520
	.word	268435456
	.word	17464329
	.word	33390592
	.word	536870912
	.word	822609408
	.word	1092254731
	.word	0
	.word	1879048192
	.word	16940053
	.word	285899812
	.word	0
	.word	33521664
	.word	536870912
	.word	1879048192
	.word	16940041
	.word	285899786
	.word	0
	.word	33521664
	.word	-536870912
	.word	1879048192
	.word	16940053
	.word	285899812
	.word	0
	.word	33521664
	.word	-536870912
	.word	1879048192
	.word	24935446
	.word	1073741824
	.word	-1073741824
	.word	0
	.word	33259520
	.word	268435456
	.word	285899810
	.word	33390592
	.word	-536870912
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	17234772
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	16940055
	.word	17464344
	.word	8420394
	.word	8944683
	.word	554335266
	.word	33128448
	.word	1610612736
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566121
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24935465
	.word	1610612736
	.word	-1073741824
	.word	11566122
	.word	285899810
	.word	33390592
	.word	1610612736
	.word	-1073741824
	.word	11566123
	.word	554335266
	.word	33390592
	.word	-1342177280
	.word	0
	.word	8420394
	.word	285899810
	.word	33128448
	.word	0
	.word	0
	.word	8420395
	.word	554335266
	.word	33390592
	.word	1073741824
	.word	1610612736
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24935598
	.word	1610612736
	.word	0
	.word	554335274
	.word	0
	.word	-1073741824
	.word	805306368
	.word	33259520
	.word	268435456
	.word	805306368
	.word	33128448
	.word	1610612736
	.word	0
	.word	33128448
	.word	536870912
	.word	268435456
	.word	33128448
	.word	536870912
	.word	536870912
	.word	33128448
	.word	1073741824
	.word	1342177280
	.word	1879048192
	.word	1342177280
	.word	1879048192
	.word	268435456
	.word	285899810
	.word	33390592
	.word	-1342177280
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24935598
	.word	-1342177280
	.word	0
	.word	554335275
	.word	0
	.word	-1073741824
	.word	805306368
	.word	33259520
	.word	268435456
	.word	805306368
	.word	33128448
	.word	-1342177280
	.word	0
	.word	33128448
	.word	1879048192
	.word	268435456
	.word	33128448
	.word	1879048192
	.word	536870912
	.word	33128448
	.word	-1879048192
	.word	-1610612736
	.word	1879048192
	.word	-1610612736
	.word	1879048192
	.word	1610612736
	.word	17464354
	.word	286948379
	.word	33390592
	.word	293108762
	.word	-2147483648
	.word	1879048192
	.word	17464354
	.word	33390592
	.word	1879048192
	.word	-235044864
	.word	1879048192
	.word	-2147483648
	.word	536870912
	.word	-1073741824
	.word	24673282
	.word	-1073741824
	.word	-1073741824
	.word	17464362
	.word	268435456
	.word	0
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24673454
	.word	-1342177280
	.word	-805306368
	.word	-805306368
	.word	24673282
	.word	-1342177280
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24673454
	.word	-1342177280
	.word	-805306368
	.word	-805306368
	.word	-805306368
	.word	-805306368
	.word	-268435456
	.word	285899810
	.word	17988635
	.word	33390592
	.word	536870912
	.word	-235044864
	.word	536870912
	.word	17464363
	.word	268435456
	.word	0
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24673454
	.word	268435456
	.word	-805306368
	.word	-805306368
	.word	24673282
	.word	268435456
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24673454
	.word	268435456
	.word	-805306368
	.word	-805306368
	.word	-805306368
	.word	-805306368
	.word	1342177280
	.word	24673324
	.word	-536870912
	.word	1359641640
	.word	33390592
	.word	-1342177280
	.word	822609408
	.word	17827330
	.word	1879048192
	.word	-536870912
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24673454
	.word	-536870912
	.word	-1073741824
	.word	11566254
	.word	268435456
	.word	33128448
	.word	1879048192
	.word	536870912
	.word	33128448
	.word	1879048192
	.word	1073741824
	.word	33128448
	.word	1879048192
	.word	1610612736
	.word	33128448
	.word	1879048192
	.word	805306368
	.word	33128448
	.word	-1879048192
	.word	-1342177280
	.word	-1073741824
	.word	-1342177280
	.word	-1073741824
	.word	-1073741824
	.word	16940206
	.word	33259520
	.word	1342177280
	.word	24673299
	.word	-1073741824
	.word	16940066
	.word	33128448
	.word	1879048192
	.word	268435456
	.word	33128448
	.word	1879048192
	.word	-1073741824
	.word	-1073741824
	.word	11566115
	.word	805306368
	.word	33062912
	.word	268435456
	.word	-805306368
	.word	11566125
	.word	24935449
	.word	-1879048192
	.word	-1073741824
	.word	536870912
	.word	33259520
	.word	268435456
	.word	17827329
	.word	33128448
	.word	-1879048192
	.word	-805306368
	.word	-805306368
	.word	24673455
	.word	268435456
	.word	822609409
	.word	17827328
	.word	1879048192
	.word	268435456
	.word	8420398
	.word	0
	.word	822609409
	.word	17827328
	.word	1879048192
	.word	0
	.word	8420398
	.word	0
	.word	1073741824
	.word	9992192
	.word	-2147483648
	.word	-1610612736
	.word	-268435456
	.word	268435456
	.word	0
	.word	17827329
	.word	0
	.word	8715072
	.word	0
	.word	286194520
	.word	-268435456
	.word	-536870912
	.word	18282776
	.word	33128448
	.word	-1879048192
	.word	-1342177280
	.word	268435456
	.word	8420527
	.word	0
	.word	1073741824
	.word	11565056
	.word	19331386
	.word	20379926
	.word	33390592
	.word	-536870912
	.word	20379926
	.word	11336516
	.word	11860806
	.word	19855676
	.word	0
	.word	805306368
	.word	11336520
	.word	9239370
	.word	9763660
	.word	11860814
	.word	10287952
	.word	-536870912
	.word	20379926
	.word	11336516
	.word	0
	.word	0
	.word	11336518
	.word	19855676
	.word	0
	.word	805306368
	.word	11336520
	.word	9239370
	.word	11860812
	.word	19855676
	.word	0
	.word	805306368
	.word	11336526
	.word	10287952
	.word	268435456
	.word	8715074
	.word	0
	.word	1073741824
	.word	11565056
	.word	823064854
	.word	18282784
	.word	1879048192
	.word	554629398
	.word	18282848
	.word	1879048192
	.word	-251200684
	.word	17758502
	.word	1342177280
	.word	9468968
	.word	9993260
	.word	823064854
	.word	18282848
	.word	1879048192
	.word	0
	.word	0
	.word	33390592
	.word	-1342177280
	.word	16349184
	.word	-2129724670
	.word	18906285
	.word	-2130249360
	.word	18282782
	.word	18807142
	.word	-2147483648
	.word	17235074
	.word	17758488
	.word	-268435456
	.word	-268435456
	.word	268435456
	.word	0
	.word	8715394
	.word	16349184
	.word	-2130248958
	.word	18906285
	.word	-2129725072
	.word	18282782
	.word	18807144
	.word	-2147483648
	.word	1879048192
	.word	16349184
	.word	-2129724670
	.word	19331848
	.word	-268435456
	.word	-2130249360
	.word	18282782
	.word	18807142
	.word	-2147483648
	.word	16349184
	.word	17234694
	.word	17759362
	.word	0
	.word	9239686
	.word	17234694
	.word	17759360
	.word	18283276
	.word	33259520
	.word	-536870912
	.word	805306368
	.word	17235072
	.word	17758988
	.word	18283270
	.word	18283278
	.word	0
	.word	9239684
	.word	17235074
	.word	17758488
	.word	-268435456
	.word	-268435456
	.word	268435456
	.word	0
	.word	8715394
	.word	16349184
	.word	-2130248958
	.word	19331848
	.word	-268435456
	.word	-2129725072
	.word	18282794
	.word	18807144
	.word	-2147483648
	.word	16349184
	.word	287767304
	.word	0
	.word	8715016
	.word	0
	.word	536870912
	.word	10516480
	.word	8715042
	.word	277674784
	.word	546634532
	.word	33128448
	.word	1073741824
	.word	33128448
	.word	-2147483648
	.word	33128448
	.word	-1073741824
	.word	-268435456
	.word	268435456
	.word	8715046
	.word	0
	.word	-268435456
	.word	268435456
	.word	8715048
	.word	0
	.word	-268435456
	.word	268435456
	.word	8715050
	.word	0
	.word	0
	.word	1073741824
	.word	11565056
	.word	20380502
	.word	24935443
	.word	-1879048192
	.word	1898379590
	.word	0
	.word	0
	.word	0
	.word	16349184
	.word	0
	.word	33390592
	.word	-1879048192
	.word	17235104
	.word	17759394
	.word	33259520
	.word	1610612736
	.word	17235104
	.word	17758988
	.word	0
	.word	805306368
	.word	33259520
	.word	1610612736
	.word	9763988
	.word	19331386
	.word	18283278
	.word	0
	.word	9763984
	.word	17235104
	.word	19331386
	.word	0
	.word	19855676
	.word	0
	.word	0
	.word	825162046
	.word	0
	.word	0
	.word	805306368
	.word	11336850
	.word	19855662
	.word	0
	.word	11041962
	.word	0
	.word	10288278
	.word	19331388
	.word	18283278
	.word	0
	.word	805306368
	.word	9993387
	.word	17759394
	.word	0
	.word	805306368
	.word	10288280
	.word	1342177280
	.word	19331386
	.word	18283278
	.word	0
	.word	9763984
	.word	17235104
	.word	17758988
	.word	0
	.word	805306368
	.word	0
	.word	17234236
	.word	17758990
	.word	0
	.word	805306368
	.word	0
	.word	19855678
	.word	0
	.word	805306368
	.word	10288274
	.word	19855662
	.word	0
	.word	9993386
	.word	17234702
	.word	17759394
	.word	0
	.word	805306368
	.word	0
	.word	10288276
	.word	0
	.word	10288278
	.word	9993387
	.word	10288280
	.word	-1073741824
	.word	17235104
	.word	17759396
	.word	-1879048192
	.word	17235100
	.word	17758982
	.word	18283276
	.word	33259520
	.word	1342177280
	.word	17235100
	.word	17758988
	.word	0
	.word	805306368
	.word	33259520
	.word	805306368
	.word	9763988
	.word	19331386
	.word	18283278
	.word	0
	.word	9763984
	.word	17235100
	.word	19331386
	.word	0
	.word	19855676
	.word	0
	.word	0
	.word	825162046
	.word	0
	.word	0
	.word	805306368
	.word	11336850
	.word	19855662
	.word	0
	.word	11041962
	.word	0
	.word	10288278
	.word	19331388
	.word	18283278
	.word	0
	.word	805306368
	.word	9993387
	.word	17758982
	.word	823590036
	.word	0
	.word	10288280
	.word	1073741824
	.word	19331386
	.word	18283278
	.word	0
	.word	9763984
	.word	17235100
	.word	17758988
	.word	0
	.word	805306368
	.word	0
	.word	17234236
	.word	17758990
	.word	0
	.word	805306368
	.word	0
	.word	19855678
	.word	0
	.word	805306368
	.word	10288274
	.word	19855662
	.word	0
	.word	9993386
	.word	17234694
	.word	17759388
	.word	18283276
	.word	0
	.word	0
	.word	805306368
	.word	0
	.word	10288276
	.word	0
	.word	10288278
	.word	9993387
	.word	10288280
	.word	-1073741824
	.word	17235100
	.word	17758982
	.word	805306368
	.word	-1879048192
	.word	19331386
	.word	0
	.word	10288272
	.word	19331388
	.word	0
	.word	805306368
	.word	19331374
	.word	0
	.word	11041962
	.word	0
	.word	9239700
	.word	19331390
	.word	0
	.word	805306368
	.word	11336850
	.word	0
	.word	10288278
	.word	9993387
	.word	10288280
	.word	0
	.word	1090520577
	.word	9992192
	.word	-2147483648
	.word	-1610612736
	.word	17827329
	.word	0
	.word	8715072
	.word	0
	.word	17758538
	.word	20380498
	.word	18807090
	.word	0
	.word	33128448
	.word	-1055983284
	.word	0
	.word	286194514
	.word	-268435456
	.word	-805306368
	.word	18282776
	.word	33128448
	.word	-1879048192
	.word	286194520
	.word	-268435456
	.word	-536870912
	.word	18282776
	.word	33128448
	.word	-1879048192
	.word	-1342177280
	.word	268435456
	.word	8420527
	.word	0
	.word	1090520576
	.word	9992192
	.word	-2147483648
	.word	-1610612736
	.word	17827329
	.word	0
	.word	8715072
	.word	0
	.word	17234226
	.word	20380498
	.word	0
	.word	286194514
	.word	-268435456
	.word	-805306368
	.word	18282776
	.word	33128448
	.word	1073741824
	.word	286194520
	.word	-268435456
	.word	-536870912
	.word	18282776
	.word	33128448
	.word	1073741824
	.word	1610612736
	.word	268435456
	.word	8420527
	.word	0
	.word	18875904
	.word	0
	.word	1091044864
	.word	546863104
	.word	17827332
	.word	-2147483648
	.word	-1610612736
	.word	-268435456
	.word	268435456
	.word	0
	.word	17827329
	.word	0
	.word	8715072
	.word	0
	.word	17234772
	.word	0
	.word	17455440
	.word	16778756
	.word	33390592
	.word	-1342177280
	.word	1091044864
	.word	815298560
	.word	17827332
	.word	-2147483648
	.word	-1610612736
	.word	-268435456
	.word	268435456
	.word	0
	.word	17827329
	.word	0
	.word	8715072
	.word	0
	.word	17303041
	.word	17827336
	.word	33325056
	.word	-1879048192
	.word	17303072
	.word	33062912
	.word	268435456
	.word	285738497
	.word	18351620
	.word	-2147483648
	.word	0
	.word	17827352
	.word	33062912
	.word	1073741824
	.word	17303064
	.word	0
	.word	1091044864
	.word	815298560
	.word	17827352
	.word	-2147483648
	.word	-1610612736
	.word	-268435456
	.word	268435456
	.word	0
	.word	17827329
	.word	0
	.word	8715072
	.word	0
	.word	536870912
	.word	1091044864
	.word	815298560
	.word	0
	.word	-2147483648
	.word	-1610612736
	.word	-268435456
	.word	268435456
	.word	0
	.word	17827329
	.word	0
	.word	8715072
	.word	0
	.word	-536870912
	.word	1091044864
	.word	815298560
	.word	-2147483648
	.word	0
	.word	-2147483648
	.word	-1610612736
	.word	-268435456
	.word	268435456
	.word	0
	.word	17827329
	.word	0
	.word	8715072
	.word	0
	.word	286194520
	.word	-268435456
	.word	-536870912
	.word	18282776
	.word	33128448
	.word	1342177280
	.word	1879048192
	.word	268435456
	.word	8420527
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1011712
	.word	16384
	.word	0
	.word	0
	.word	0
	.word	17408
	.word	916484
	.word	1031168
	.word	1018880
	.word	16384
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035272
	.word	0
	.word	1031172
	.word	0
	.word	1027080
	.word	0
	.word	1035361
	.word	16391
	.word	916544
	.word	1031176
	.word	16388
	.word	916544
	.word	1031176
	.word	0
	.word	18432
	.word	916544
	.word	1031176
	.word	916552
	.word	1031176
	.word	1035284
	.word	0
	.word	16384
	.word	99972
	.word	590912
	.word	916544
	.word	1031171
	.word	1018883
	.word	16384
	.word	17408
	.word	0
	.word	16384
	.word	0
	.word	1013760
	.word	16384
	.word	0
	.word	0
	.word	0
	.word	593924
	.word	103056
	.word	103056
	.word	905516
	.word	1031176
	.word	589828
	.word	0
	.word	902208
	.word	916588
	.word	1031176
	.word	16384
	.word	1035355
	.word	1018888
	.word	0
	.word	1027079
	.word	0
	.word	1035361
	.word	16391
	.word	916544
	.word	1031176
	.word	16388
	.word	916544
	.word	1031176
	.word	0
	.word	18432
	.word	916544
	.word	1031176
	.word	916552
	.word	1031176
	.word	1035284
	.word	0
	.word	16384
	.word	99972
	.word	590912
	.word	916544
	.word	1031174
	.word	1018886
	.word	16384
	.word	17408
	.word	0
	.word	16384
	.word	0
	.word	1013760
	.word	16384
	.word	0
	.word	0
	.word	0
	.word	593924
	.word	103056
	.word	103056
	.word	905516
	.word	1031176
	.word	589828
	.word	0
	.word	902208
	.word	916588
	.word	1031175
	.word	16384
	.word	1035355
	.word	1018888
	.word	0
	.word	1031176
	.word	0
	.word	1027080
	.word	0
	.word	1027080
	.word	16384
	.word	1035355
	.word	0
	.word	16384
	.word	0
	.word	0
	.word	1007616
	.word	0
	.word	0
	.word	589828
	.word	99972
	.word	622596
	.word	901164
	.word	1031182
	.word	0
	.word	109184
	.word	0
	.word	0
	.word	0
	.word	597444
	.word	107044
	.word	100000
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	589840
	.word	98332
	.word	592016
	.word	100508
	.word	0
	.word	902272
	.word	1031178
	.word	0
	.word	67204
	.word	0
	.word	0
	.word	1018891
	.word	17408
	.word	0
	.word	0
	.word	0
	.word	902208
	.word	67204
	.word	0
	.word	0
	.word	0
	.word	904392
	.word	69260
	.word	0
	.word	1035351
	.word	1035354
	.word	0
	.word	16384
	.word	916608
	.word	1031181
	.word	916612
	.word	1031181
	.word	916608
	.word	1031180
	.word	916608
	.word	1031180
	.word	1018894
	.word	1035295
	.word	0
	.word	1027086
	.word	0
	.word	0
	.word	21506
	.word	300368
	.word	98324
	.word	0
	.word	1035359
	.word	1018894
	.word	1035312
	.word	0
	.word	1027086
	.word	0
	.word	0
	.word	21506
	.word	300368
	.word	98324
	.word	0
	.word	1035359
	.word	1018894
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	983049
	.word	0
	.word	0
	.word	0
	.word	589828
	.word	0
	.word	99972
	.word	916484
	.word	1031188
	.word	916524
	.word	1031184
	.word	916524
	.word	1031188
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	0
	.word	597444
	.word	0
	.word	0
	.word	589840
	.word	98332
	.word	0
	.word	0
	.word	0
	.word	0
	.word	98308
	.word	0
	.word	916484
	.word	1031184
	.word	0
	.word	0
	.word	67204
	.word	0
	.word	0
	.word	1018897
	.word	0
	.word	0
	.word	902208
	.word	103044
	.word	67204
	.word	0
	.word	0
	.word	0
	.word	904400
	.word	69260
	.word	1035351
	.word	1035354
	.word	0
	.word	16384
	.word	916608
	.word	1031188
	.word	916612
	.word	1031188
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	0
	.word	1027092
	.word	16384
	.word	916544
	.word	1031186
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1018899
	.word	0
	.word	0
	.word	0
	.word	902208
	.word	67204
	.word	0
	.word	0
	.word	0
	.word	904392
	.word	69260
	.word	0
	.word	1035351
	.word	1035354
	.word	0
	.word	16384
	.word	916608
	.word	1031188
	.word	1018900
	.word	916612
	.word	1031188
	.word	1035322
	.word	1018900
	.word	1035322
	.word	16384
	.word	0
	.word	999424
	.word	16384
	.word	0
	.word	999424
	.word	0
	.word	0
	.word	0
	.word	0
	.word	98308
	.word	0
	.word	0
	.word	0
	.word	102028
	.word	592972
	.word	16384
	.word	0
	.word	0
	.word	0
	.word	589828
	.word	901164
	.word	67204
	.word	67204
	.word	606212
	.word	67204
	.word	67204
	.word	606212
	.word	69260
	.word	69260
	.word	69260
	.word	606220
	.word	0
	.word	16384
	.word	66176
	.word	0
	.word	0
	.word	0
	.word	20480
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	66176
	.word	66176
	.word	0
	.word	67204
	.word	67204
	.word	606212
	.word	67204
	.word	67204
	.word	606212
	.word	590920
	.word	67204
	.word	67204
	.word	606212
	.word	67204
	.word	67204
	.word	606212
	.word	1027096
	.word	0
	.word	1018905
	.word	0
	.word	1027096
	.word	1027096
	.word	1018905
	.word	0
	.word	1018905
	.word	0
	.word	1027097
	.word	1018905
	.word	0
	.word	1018905
	.word	67204
	.word	606212
	.word	606212
	.word	0
	.word	0
	.word	17410
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	0
	.word	17409
	.word	98308
	.word	17410
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	17410
	.word	98308
	.word	17410
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	0
	.word	17414
	.word	98308
	.word	17410
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	0
	.word	0
	.word	17408
	.word	901124
	.word	1031195
	.word	16384
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	17408
	.word	901124
	.word	1031196
	.word	16384
	.word	0
	.word	17409
	.word	98308
	.word	98308
	.word	66176
	.word	66176
	.word	18432
	.word	590980
	.word	67204
	.word	67204
	.word	606212
	.word	606212
	.word	0
	.word	18433
	.word	589832
	.word	66176
	.word	66176
	.word	590920
	.word	67204
	.word	67204
	.word	606212
	.word	67204
	.word	606212
	.word	18432
	.word	916552
	.word	1031198
	.word	916556
	.word	1031198
	.word	1018910
	.word	17408
	.word	1018910
	.word	17408
	.word	1018910
	.word	606212
	.word	0
	.word	0
	.word	17410
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	589828
	.word	901164
	.word	0
	.word	17419
	.word	98308
	.word	17410
	.word	0
	.word	1035359
	.word	16384
	.word	0
	.word	17423
	.word	98308
	.word	17410
	.word	0
	.word	1035359
	.word	999424
	.word	16384
	.word	0
	.word	1035350
	.word	17423
	.word	589828
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	1035374
	.word	0
	.word	16385
	.word	916488
	.word	1031215
	.word	16384
	.word	916608
	.word	1031215
	.word	0
	.word	16388
	.word	916864
	.word	1031202
	.word	916868
	.word	1031202
	.word	16389
	.word	916864
	.word	1031202
	.word	916868
	.word	1031202
	.word	16390
	.word	916864
	.word	1031202
	.word	916868
	.word	1031202
	.word	916864
	.word	1031202
	.word	1031215
	.word	16390
	.word	916864
	.word	1031202
	.word	916868
	.word	1031202
	.word	16391
	.word	916864
	.word	1031202
	.word	916868
	.word	1031202
	.word	1018920
	.word	1035374
	.word	0
	.word	17408
	.word	902532
	.word	903560
	.word	605256
	.word	1031215
	.word	1035374
	.word	17408
	.word	902532
	.word	1031215
	.word	1035374
	.word	17408
	.word	902532
	.word	1031215
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	17408
	.word	902532
	.word	1031215
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	17408
	.word	902532
	.word	1031208
	.word	29696
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1027110
	.word	20480
	.word	30720
	.word	16384
	.word	916800
	.word	1031206
	.word	1035372
	.word	0
	.word	104840
	.word	104848
	.word	595332
	.word	16384
	.word	906560
	.word	1031206
	.word	103060
	.word	16384
	.word	112696
	.word	917380
	.word	1031206
	.word	1018917
	.word	990244
	.word	29696
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1027112
	.word	20480
	.word	30720
	.word	16384
	.word	916800
	.word	1031208
	.word	1035372
	.word	0
	.word	104840
	.word	104848
	.word	595332
	.word	16384
	.word	906560
	.word	1031208
	.word	103060
	.word	16384
	.word	112696
	.word	917380
	.word	1031208
	.word	1018919
	.word	990246
	.word	1018920
	.word	16384
	.word	0
	.word	1035374
	.word	0
	.word	17408
	.word	916868
	.word	1027113
	.word	1018927
	.word	1035374
	.word	0
	.word	17408
	.word	916868
	.word	1031210
	.word	17408
	.word	916868
	.word	1031210
	.word	17408
	.word	916868
	.word	1031211
	.word	1018927
	.word	1035374
	.word	0
	.word	17408
	.word	916868
	.word	1031211
	.word	1018927
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	1035376
	.word	1035376
	.word	1035374
	.word	0
	.word	17423
	.word	916868
	.word	1031215
	.word	17408
	.word	916868
	.word	1031211
	.word	29696
	.word	110208
	.word	1035376
	.word	988203
	.word	1035374
	.word	16384
	.word	0
	.word	1035350
	.word	1035374
	.word	0
	.word	16384
	.word	916864
	.word	1031215
	.word	916868
	.word	1031215
	.word	1035374
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	17408
	.word	916868
	.word	1031213
	.word	1018926
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	916864
	.word	1031215
	.word	916868
	.word	1031215
	.word	16384
	.word	916864
	.word	1031215
	.word	1018927
	.word	16384
	.word	0
	.word	16384
	.word	0
	.word	916864
	.word	1031215
	.word	916868
	.word	1031215
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	0
	.word	1031215
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	999424
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	999424
	.word	1035374
	.word	0
	.word	17408
	.word	916868
	.word	1031225
	.word	916872
	.word	1031225
	.word	1035374
	.word	0
	.word	17408
	.word	916868
	.word	1031225
	.word	916872
	.word	1031225
	.word	0
	.word	16384
	.word	99972
	.word	590912
	.word	916544
	.word	1031217
	.word	1018929
	.word	0
	.word	0
	.word	21506
	.word	300368
	.word	99412
	.word	0
	.word	1035359
	.word	0
	.word	1031225
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	1035374
	.word	17408
	.word	916868
	.word	1031225
	.word	1035374
	.word	0
	.word	17409
	.word	916868
	.word	1031225
	.word	1035374
	.word	0
	.word	17409
	.word	916868
	.word	1031225
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	17408
	.word	916868
	.word	1031225
	.word	1035372
	.word	0
	.word	1035372
	.word	1035372
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	18432
	.word	0
	.word	901124
	.word	901128
	.word	1031225
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1031225
	.word	20480
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	916880
	.word	1031225
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	916484
	.word	1031224
	.word	1018935
	.word	16384
	.word	0
	.word	1018937
	.word	16384
	.word	0
	.word	0
	.word	1031225
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	999424
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	999424
	.word	1035374
	.word	0
	.word	0
	.word	916868
	.word	1031254
	.word	1035374
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	1018966
	.word	17408
	.word	0
	.word	1018940
	.word	17408
	.word	0
	.word	1018940
	.word	17408
	.word	0
	.word	1035374
	.word	0
	.word	17423
	.word	916868
	.word	1031254
	.word	0
	.word	16384
	.word	99972
	.word	590912
	.word	916544
	.word	1031229
	.word	1018941
	.word	0
	.word	0
	.word	21506
	.word	300368
	.word	99412
	.word	0
	.word	1035359
	.word	0
	.word	1031254
	.word	0
	.word	0
	.word	21506
	.word	300368
	.word	99412
	.word	0
	.word	1035359
	.word	0
	.word	1031254
	.word	16384
	.word	18432
	.word	100492
	.word	1035350
	.word	16384
	.word	0
	.word	0
	.word	0
	.word	1031232
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1027136
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	98348
	.word	99436
	.word	294916
	.word	0
	.word	0
	.word	1031233
	.word	0
	.word	1031233
	.word	16384
	.word	294916
	.word	0
	.word	16384
	.word	99436
	.word	294916
	.word	17408
	.word	901124
	.word	0
	.word	18432
	.word	49160
	.word	589828
	.word	0
	.word	16384
	.word	916544
	.word	1031234
	.word	1035374
	.word	0
	.word	916868
	.word	1031254
	.word	16384
	.word	916544
	.word	1031235
	.word	16384
	.word	18432
	.word	100492
	.word	1035350
	.word	0
	.word	18432
	.word	50248
	.word	605188
	.word	1031235
	.word	1035376
	.word	0
	.word	18432
	.word	50308
	.word	605188
	.word	1031235
	.word	1035376
	.word	0
	.word	18432
	.word	50308
	.word	605188
	.word	1031235
	.word	1035376
	.word	0
	.word	1031236
	.word	1035374
	.word	17408
	.word	916868
	.word	1031254
	.word	16384
	.word	916484
	.word	1031236
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	0
	.word	0
	.word	16384
	.word	916544
	.word	1031238
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1031238
	.word	1035374
	.word	0
	.word	16384
	.word	916484
	.word	1031238
	.word	1035374
	.word	0
	.word	16384
	.word	916484
	.word	1031238
	.word	16386
	.word	0
	.word	16384
	.word	916484
	.word	1031239
	.word	16386
	.word	0
	.word	16384
	.word	916484
	.word	1031239
	.word	1018953
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1031241
	.word	28672
	.word	16384
	.word	108548
	.word	1035374
	.word	17408
	.word	916868
	.word	1031254
	.word	17408
	.word	916868
	.word	1031241
	.word	17408
	.word	916868
	.word	1031241
	.word	18432
	.word	916872
	.word	1031241
	.word	17408
	.word	916868
	.word	1031241
	.word	1018953
	.word	1035376
	.word	1018953
	.word	1035376
	.word	983112
	.word	16384
	.word	902148
	.word	1031243
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1031243
	.word	28672
	.word	16384
	.word	108548
	.word	1035374
	.word	17408
	.word	916868
	.word	1031254
	.word	17408
	.word	916868
	.word	1031243
	.word	17408
	.word	916868
	.word	1031243
	.word	18432
	.word	916872
	.word	1031243
	.word	17408
	.word	916868
	.word	1031243
	.word	1018955
	.word	1035376
	.word	1018955
	.word	1035376
	.word	983114
	.word	16384
	.word	18432
	.word	901124
	.word	1031244
	.word	1031244
	.word	1018956
	.word	0
	.word	916612
	.word	1031244
	.word	130284
	.word	1031244
	.word	1018956
	.word	1018961
	.word	1035374
	.word	0
	.word	1027148
	.word	1035374
	.word	28672
	.word	16384
	.word	108548
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1027149
	.word	1035372
	.word	1035372
	.word	0
	.word	1027150
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1027150
	.word	1035372
	.word	1035372
	.word	1035372
	.word	1035372
	.word	983116
	.word	16384
	.word	0
	.word	916484
	.word	1031249
	.word	916652
	.word	1031249
	.word	28672
	.word	16384
	.word	108548
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1027152
	.word	1035372
	.word	1035372
	.word	0
	.word	1027153
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1027153
	.word	1035372
	.word	1035372
	.word	1035372
	.word	1035372
	.word	983119
	.word	0
	.word	1027155
	.word	16384
	.word	916544
	.word	1031249
	.word	16384
	.word	0
	.word	1035350
	.word	1018963
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1027155
	.word	1035374
	.word	0
	.word	17408
	.word	916868
	.word	1031251
	.word	17408
	.word	916868
	.word	1031251
	.word	17408
	.word	916868
	.word	1031251
	.word	17408
	.word	916868
	.word	1031251
	.word	17408
	.word	916868
	.word	1031251
	.word	1018963
	.word	1035374
	.word	1018963
	.word	1035374
	.word	1035374
	.word	17408
	.word	916484
	.word	1031250
	.word	0
	.word	1027156
	.word	17408
	.word	916484
	.word	1031252
	.word	18432
	.word	916488
	.word	1031252
	.word	1018964
	.word	1035374
	.word	0
	.word	17408
	.word	916868
	.word	1031254
	.word	1035372
	.word	0
	.word	0
	.word	1031253
	.word	1035374
	.word	17408
	.word	916868
	.word	1031254
	.word	0
	.word	916872
	.word	1031253
	.word	1035372
	.word	1035372
	.word	0
	.word	1031254
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	999424
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	999424
	.word	19456
	.word	0
	.word	66176
	.word	67204
	.word	68232
	.word	68232
	.word	606212
	.word	606216
	.word	606216
	.word	0
	.word	1013760
	.word	16384
	.word	99972
	.word	99972
	.word	589888
	.word	916608
	.word	1031255
	.word	1018967
	.word	16384
	.word	0
	.word	999424
	.word	22528
	.word	0
	.word	0
	.word	0
	.word	916632
	.word	1031256
	.word	594960
	.word	0
	.word	0
	.word	0
	.word	594964
	.word	71316
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1018969
	.word	595088
	.word	0
	.word	593936
	.word	906516
	.word	0
	.word	0
	.word	594964
	.word	71316
	.word	0
	.word	0
	.word	0
	.word	0
	.word	595092
	.word	71316
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	999424
	.word	22528
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	1035350
	.word	17409
	.word	591876
	.word	98944
	.word	592900
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	999424
	.word	17408
	.word	916484
	.word	1031260
	.word	0
	.word	21504
	.word	0
	.word	300368
	.word	99652
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	67204
	.word	67204
	.word	67204
	.word	606212
	.word	0
	.word	0
	.word	21504
	.word	0
	.word	300368
	.word	98624
	.word	0
	.word	1035359
	.word	1018975
	.word	0
	.word	21504
	.word	0
	.word	905516
	.word	300368
	.word	99652
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	0
	.word	99392
	.word	0
	.word	0
	.word	0
	.word	99392
	.word	916552
	.word	1031261
	.word	1018974
	.word	0
	.word	0
	.word	902208
	.word	902276
	.word	99460
	.word	0
	.word	0
	.word	0
	.word	67204
	.word	67204
	.word	67204
	.word	606212
	.word	0
	.word	0
	.word	21504
	.word	0
	.word	905516
	.word	300368
	.word	98624
	.word	0
	.word	1035359
	.word	0
	.word	16384
	.word	98560
	.word	0
	.word	999424
	.word	20480
	.word	0
	.word	20480
	.word	21504
	.word	22528
	.word	916688
	.word	1031264
	.word	916692
	.word	1031264
	.word	916696
	.word	1031264
	.word	1018976
	.word	16384
	.word	0
	.word	1013760
	.word	1018976
	.word	16384
	.word	0
	.word	1013760
	.word	1018976
	.word	16384
	.word	0
	.word	1013760
	.word	999424
	.word	22528
	.word	0
	.word	0
	.word	108184
	.word	1031265
	.word	19456
	.word	104664
	.word	596248
	.word	108184
	.word	0
	.word	17408
	.word	916484
	.word	1031270
	.word	0
	.word	0
	.word	916544
	.word	1031270
	.word	104088
	.word	0
	.word	903232
	.word	68232
	.word	903316
	.word	1027172
	.word	0
	.word	0
	.word	0
	.word	592136
	.word	0
	.word	0
	.word	0
	.word	594176
	.word	905480
	.word	595264
	.word	102676
	.word	70288
	.word	102680
	.word	595220
	.word	104084
	.word	0
	.word	0
	.word	595220
	.word	0
	.word	19456
	.word	0
	.word	0
	.word	0
	.word	593040
	.word	69260
	.word	0
	.word	0
	.word	904264
	.word	69260
	.word	0
	.word	1018982
	.word	0
	.word	0
	.word	592136
	.word	0
	.word	0
	.word	0
	.word	903232
	.word	68232
	.word	903560
	.word	108168
	.word	0
	.word	589828
	.word	66176
	.word	100480
	.word	0
	.word	593044
	.word	102028
	.word	0
	.word	0
	.word	593044
	.word	0
	.word	0
	.word	0
	.word	904256
	.word	69260
	.word	904420
	.word	0
	.word	19456
	.word	0
	.word	0
	.word	0
	.word	1018988
	.word	0
	.word	0
	.word	1018987
	.word	0
	.word	0
	.word	98308
	.word	916608
	.word	1031275
	.word	104088
	.word	0
	.word	903232
	.word	68232
	.word	903316
	.word	1027177
	.word	0
	.word	0
	.word	0
	.word	592136
	.word	0
	.word	0
	.word	0
	.word	594176
	.word	905480
	.word	595264
	.word	102676
	.word	70288
	.word	102680
	.word	595220
	.word	104084
	.word	0
	.word	0
	.word	595220
	.word	0
	.word	19456
	.word	0
	.word	0
	.word	0
	.word	593040
	.word	69260
	.word	0
	.word	0
	.word	67204
	.word	904264
	.word	0
	.word	1018987
	.word	0
	.word	0
	.word	592136
	.word	0
	.word	0
	.word	0
	.word	903232
	.word	68232
	.word	903560
	.word	108168
	.word	0
	.word	589828
	.word	66176
	.word	100480
	.word	0
	.word	593044
	.word	102028
	.word	0
	.word	0
	.word	593044
	.word	0
	.word	0
	.word	0
	.word	0
	.word	903300
	.word	904200
	.word	69260
	.word	904420
	.word	0
	.word	19456
	.word	0
	.word	0
	.word	0
	.word	1018988
	.word	0
	.word	0
	.word	67204
	.word	1018987
	.word	0
	.word	592912
	.word	0
	.word	0
	.word	592912
	.word	69260
	.word	101592
	.word	595152
	.word	0
	.word	902244
	.word	0
	.word	0
	.word	595152
	.word	104084
	.word	0
	.word	19456
	.word	0
	.word	0
	.word	0
	.word	999424
	.word	19456
	.word	17408
	.word	66176
	.word	67204
	.word	606212
	.word	606216
	.word	0
	.word	1013760
	.word	16384
	.word	0
	.word	590936
	.word	596184
	.word	916544
	.word	1031277
	.word	612440
	.word	16384
	.word	99972
	.word	99972
	.word	589888
	.word	916608
	.word	1031278
	.word	16384
	.word	99972
	.word	99972
	.word	589888
	.word	916608
	.word	1031278
	.word	1018990
	.word	16384
	.word	0
	.word	999424
	.word	19456
	.word	17408
	.word	66176
	.word	67204
	.word	606212
	.word	606216
	.word	0
	.word	1013760
	.word	0
	.word	0
	.word	595992
	.word	16384
	.word	99972
	.word	99972
	.word	589888
	.word	916608
	.word	1031280
	.word	16384
	.word	99972
	.word	99972
	.word	589888
	.word	916608
	.word	1031280
	.word	1018992
	.word	16384
	.word	0
	.word	999424
	.word	21504
	.word	22528
	.word	19456
	.word	16384
	.word	0
	.word	66176
	.word	67204
	.word	68232
	.word	68232
	.word	606212
	.word	606216
	.word	606216
	.word	0
	.word	1013760
	.word	0
	.word	113280
	.word	0
	.word	102660
	.word	916544
	.word	1031282
	.word	19456
	.word	16384
	.word	0
	.word	66176
	.word	67204
	.word	68232
	.word	68232
	.word	606212
	.word	606216
	.word	606216
	.word	0
	.word	1013760
	.word	0
	.word	104836
	.word	916872
	.word	1031280
	.word	104080
	.word	916804
	.word	1031285
	.word	70288
	.word	102660
	.word	295128
	.word	905472
	.word	104080
	.word	916628
	.word	1031284
	.word	0
	.word	905476
	.word	19456
	.word	16384
	.word	0
	.word	66176
	.word	67204
	.word	68232
	.word	68232
	.word	606212
	.word	606216
	.word	606216
	.word	0
	.word	1013760
	.word	1018995
	.word	19456
	.word	16384
	.word	101008
	.word	66176
	.word	67204
	.word	68232
	.word	68232
	.word	606212
	.word	606216
	.word	606216
	.word	0
	.word	1013760
	.word	1018997
	.word	19456
	.word	16384
	.word	299224
	.word	903504
	.word	66176
	.word	67204
	.word	68232
	.word	68232
	.word	606212
	.word	606216
	.word	606216
	.word	0
	.word	1013760
	.word	16384
	.word	99972
	.word	99972
	.word	589888
	.word	916608
	.word	1031286
	.word	1018998
	.word	16384
	.word	0
	.word	999424
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	65537
	.word	7208960
	.word	513
	.word	1537
	.word	319365736
	.word	319365736
	.word	9437306
	.word	5046372
	.word	0
	.word	0
	.word	1
	.word	131
	.word	16
	.word	2
	.word	24
	.word	256
	.word	263
	.word	3
	.word	351
	.word	4
	.word	64
	.word	127
	.word	262143
	.word	1048575
	.word	4194303
	.word	2147483647
	.word	-2147483648
	.word	-16
	.word	15
	.word	-128
	.word	8192
	.word	1048576
	.word	96000
	.word	-8
	.word	-1
	.word	262144
	.word	-524288
	.word	65280000
	.word	196612
	.word	131074
	.word	65537
	.word	65537
	.word	0
	.word	0
	.word	0
	.word	0
	.word	8
	.word	8160
	.word	255
	.word	0
	.word	1
	.word	5
	.word	8
	.word	7
	.word	64
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.type	g_pScdDrvParamBase, %object
	.size	g_pScdDrvParamBase, 4
g_pScdDrvParamBase:
	.word	g_ScdDrvParam
	.type	g_hex_flag, %object
	.size	g_hex_flag, 4
g_hex_flag:
	.word	1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC2:
	ASCII(.ascii	"Fatal: get g_hex_base_addr(0x%x) vir addr failed!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC3:
	ASCII(.ascii	"Warn: eVidStd = %d have not DSP vfmw bin file!!\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC4:
	ASCII(.ascii	"%s failed!\012\000" )
.LC5:
	ASCII(.ascii	"%s success!\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"Ignore the reset request when the SCD[%d] clock is " )
	ASCII(.ascii	"closed.\012\000" )
.LC7:
	ASCII(.ascii	"SCD[%d]   ResetSCD ERROR!!!\012\000" )
	.space	3
.LC8:
	ASCII(.ascii	"line: %d Get SmID fail!\000" )
.LC9:
	ASCII(.ascii	"DelRaw err PacketNum = %d, DelNum = %d\012\000" )
.LC10:
	ASCII(.ascii	"%s release RawPhyAddr = 0x%x, Len = %d\012\000" )
.LC11:
	ASCII(.ascii	"line: %d DelNum = %d,RawPacketOffSet = %d,DelNum = " )
	ASCII(.ascii	"%d,Next Length = %d,is_extern_eop_flag = %d\012\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC12:
	ASCII(.ascii	"line: %d pSmInstArray is NULL!\012\000" )
.LC13:
	ASCII(.ascii	"Read_seg SegPacket.PhyAddr=0x%x, LenByte=%d, IsLast" )
	ASCII(.ascii	"Seg=%d\012\000" )
	.space	1
.LC14:
	ASCII(.ascii	"Release SegPacket.PhyAddr=0x%x,LenByte=%d,IsLastSeg" )
	ASCII(.ascii	"=%d StreamID=%d\012\000" )
.LC15:
	ASCII(.ascii	"Array out of bound in function %s\012\000" )
	.space	1
.LC16:
	ASCII(.ascii	"line: %d, SmID = %d is not expected!\012\000" )
	.space	2
.LC17:
	ASCII(.ascii	"line: %d, SmID = %d, ScdId = %d is not expected!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC18:
	ASCII(.ascii	"%s not support discontinue raw.\012\000" )
	.space	3
.LC19:
	ASCII(.ascii	"%s VirAddr is null!!\012\000" )
	.space	2
.LC20:
	ASCII(.ascii	"Raw packet TOO BIG! Can't copy to seg! Len: 0x%x\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC21:
	ASCII(.ascii	"line: %d, delet raw failed!\012\000" )
	.space	3
.LC22:
	ASCII(.ascii	"[%s %d] VirAddr is null!!\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"InstID = %d EsRelease!\012\000" )
.LC24:
	ASCII(.ascii	"Cann't Start SCD, Ret = %d\012\000" )
.LC25:
	ASCII(.ascii	"SM_CfgBuf Err! ret =%d\012\000" )
.LC26:
	ASCII(.ascii	"Line: %d, The length of seg packet is invalid: %d\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC27:
	ASCII(.ascii	"Line: %d, start code num from scd state reg: %d, re" )
	ASCII(.ascii	"lease raw packet anyway!\012\000" )
	.space	3
.LC28:
	ASCII(.ascii	"[%s %d] pCurrentStartCodeVirAddr is null!!\012\000" )
.LC29:
	ASCII(.ascii	"Line: %d, pNextStartCodeVirAddr is null!\012\000" )
	.space	2
.LC30:
	ASCII(.ascii	"ValidSegNum = %d, FilteredSegNum = 0, release raw p" )
	ASCII(.ascii	"acket anyway!\012\000" )
	.space	2
.LC31:
	ASCII(.ascii	"%s call GetRawStreamNum return failed!\012\000" )
.LC32:
	ASCII(.ascii	"%s: pRawPacket = NULL!\012\000" )
.LC33:
	ASCII(.ascii	"%s: unkown standard type = %d!\012\000" )
.LC34:
	ASCII(.ascii	"%s: Length(%d)+FlagLen(%d) > BufLen(%d)\012\000" )
	.space	3
.LC35:
	ASCII(.ascii	"%s: FlagLen(%d) > RawPacketLength(%d)\012\000" )
	.space	1
.LC36:
	ASCII(.ascii	"Func: %s, buffer has no enough space,(act: %d, head" )
	ASCII(.ascii	"er_buf: %d)\012\000" )
.LC37:
	ASCII(.ascii	"Func: %s, buffer has no enough space,(act: %d, str_" )
	ASCII(.ascii	"buf: %d)\012\000" )
	.space	3
.LC38:
	ASCII(.ascii	"Func: %s, buffer has no enough space,(act:%d, str_b" )
	ASCII(.ascii	"uf: %d, header_buf: %d)\012\000" )
.LC39:
	ASCII(.ascii	"Func: %s, buffer has no enough space, (act: %d, str" )
	ASCII(.ascii	"_buf: %d)\012\000" )
	.space	2
.LC40:
	ASCII(.ascii	"Func: %s, buffer has no enough space,(act:%d, str_b" )
	ASCII(.ascii	"uf:%d)\012\000" )
	.space	1
.LC41:
	ASCII(.ascii	"%s: RawPacket Length %d <= 0\012\000" )
	.space	2
.LC42:
	ASCII(.ascii	"Chan %d has been destroyed or the function pointer " )
	ASCII(.ascii	"-- ReleaseRawStreamData pStreamIntf is NULL!\000" )
.LC43:
	ASCII(.ascii	"line: %d s_SmIIS[%d].pSmInstArray is NULL\012\000" )
	.space	1
.LC44:
	ASCII(.ascii	"line: %d, pScdInstance is NULL!\012\000" )
	.space	3
.LC45:
	ASCII(.ascii	"%s %d force to clear SCDState = 0\012\000" )
	.space	1
.LC46:
	ASCII(.ascii	"%s %d FMW_OK !=  GetRawStreamNum !!\012\000" )
	.space	3
.LC47:
	ASCII(.ascii	"Chan %d has been destroyed or the function pointer " )
	ASCII(.ascii	"-- ReadRawStreamData pStreamIntf is NULL!\000" )
	.space	3
.LC48:
	ASCII(.ascii	"line: %d s_SmIIS.pSmInstArray[%d] is NULL\012\000" )
	.space	1
.LC49:
	ASCII(.ascii	"Chan %d FillEosRawStream failed!\012\000" )
	.space	2
.LC50:
	ASCII(.ascii	"Chan %d FillExtraData failed!\012\000" )
	.space	1
.LC51:
	ASCII(.ascii	"Release this packet failed!\012\000" )
	.space	3
.LC52:
	ASCII(.ascii	"raw_pts: %lld\012\000" )
	.space	1
.LC53:
	ASCII(.ascii	"Get RawPhyAddr=0x%x,Len=%d\012\000" )
.LC54:
	ASCII(.ascii	"!!!push raw err!!!\012\000" )
.LC55:
	ASCII(.ascii	"Chan%d raw full\012\000" )
	.space	3
.LC56:
	ASCII(.ascii	"RawNum %lld <= RawNumInVfmw %lld\012\000" )
	.space	2
.LC57:
	ASCII(.ascii	"No space for raw move, total:%d+%d > max:%d!\012\000" )
	.space	2
.LC58:
	ASCII(.ascii	"scd buffer is full, DiscardSeg: %d, SegNum: %d\012\000" )
.LC59:
	ASCII(.ascii	"(%d ms) not release stream seg, release anyway!\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC60:
	ASCII(.ascii	"%s,%d, active scd Success!\012\000" )
.LC61:
	ASCII(.ascii	"Move raw data failed, force to reset scd.\012\000" )
	.space	1
.LC62:
	ASCII(.ascii	"SCD GetRawStreamNum Fail.\012\000" )
	.space	1
.LC63:
	ASCII(.ascii	"%s,%d,SCD(ID = %d) SCDState = %d\012\000" )
	.space	2
.LC64:
	ASCII(.ascii	"%s,%d,SCD(ID = %d) return Idle!\012\000" )
	.space	3
.LC65:
	ASCII(.ascii	"Chan %d SCD[%d] Time Out(%d ms), Reset it!\012\000" )
.LC66:
	ASCII(.ascii	"%s,%d,SCD(ID = %d) really busy!\012\000" )
	.space	3
.LC67:
	ASCII(.ascii	"%s prepare to check SCD(%d)/(MAX_SCD_NUM = %d)\012\000" )
.LC68:
	ASCII(.ascii	"%s,%d,SCD(ID = %d) return BUSY!!\012\000" )
	.space	2
.LC69:
	ASCII(.ascii	"%s,%d,find idle SCD(ID = %d)\012\000" )
	.space	2
.LC70:
	ASCII(.ascii	"********** SmID [%d] RawState begin **********\012\000" )
.LC71:
	ASCII(.ascii	"RawHead=%d\012\000" )
.LC72:
	ASCII(.ascii	"RawTail=%d\012\000" )
.LC73:
	ASCII(.ascii	"RawHistory=%d\012\000" )
	.space	1
.LC74:
	ASCII(.ascii	"RawFirstPacketOffset=%d\012\000" )
	.space	3
.LC75:
	ASCII(.ascii	"CurShowIndex=%d\012\000" )
	.space	3
.LC76:
	ASCII(.ascii	"********** SmID [%d] RawState end   **********\012\000" )
.LC77:
	ASCII(.ascii	"RawPhyAddr=0x%x\012\000" )
	.space	3
.LC78:
	ASCII(.ascii	"RawVirAddr=0x%x\012\000" )
	.space	3
.LC79:
	ASCII(.ascii	"RawLength=%d\012\000" )
	.space	2
.LC80:
	ASCII(.ascii	"RawPts=%ld\012\000" )
.LC81:
	ASCII(.ascii	"%s %d FMW_OK !=  GetRawStreamNum!!\012\000" )
.LC82:
	ASCII(.ascii	"********** SmID [%d] SegState begin **********\012\000" )
.LC83:
	ASCII(.ascii	"SegHead=%d\012\000" )
.LC84:
	ASCII(.ascii	"SegTail=%d\012\000" )
.LC85:
	ASCII(.ascii	"SegCurrent=%d\012\000" )
	.space	1
.LC86:
	ASCII(.ascii	"SegBufPhyAddr=%p\012\000" )
	.space	2
.LC87:
	ASCII(.ascii	"SegBufVirAddr=%p\012\000" )
	.space	2
.LC88:
	ASCII(.ascii	"SegBufSize=%d\012\000" )
	.space	1
.LC89:
	ASCII(.ascii	"SegBufReadAddr=%p\012\000" )
	.space	1
.LC90:
	ASCII(.ascii	"SegBufWriteAddr=%pd\012\000" )
	.space	3
.LC91:
	ASCII(.ascii	"********** SmID [%d] SegState end   **********\012\000" )
.LC92:
	ASCII(.ascii	"SegPhyAddr=0x%x\012\000" )
	.space	3
.LC93:
	ASCII(.ascii	"SegVirAddr=0x%x\012\000" )
	.space	3
.LC94:
	ASCII(.ascii	"SegLength=%d\012\000" )
	.space	2
.LC95:
	ASCII(.ascii	"SegStreamID=%d\012\000" )
.LC96:
	ASCII(.ascii	"SegState=%d\012\000" )
	.space	3
.LC97:
	ASCII(.ascii	"SegIsLastSeg=%d\012\000" )
	.space	3
.LC98:
	ASCII(.ascii	"SegPts=%lld\012\000" )
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	g_ScdDrvParam, %object
	.size	g_ScdDrvParam, 60
g_ScdDrvParam:
	.space	60
	.type	g_hex_base_addr, %object
	.size	g_hex_base_addr, 4
g_hex_base_addr:
	.space	4
	.type	g_hex_base_vir_addr, %object
	.size	g_hex_base_vir_addr, 4
g_hex_base_vir_addr:
	.space	4
	.type	g_hex_len, %object
	.size	g_hex_len, 4
g_hex_len:
	.space	4
	.type	s_ScdRegPhyBaseAddr, %object
	.size	s_ScdRegPhyBaseAddr, 4
s_ScdRegPhyBaseAddr:
	.space	4
	.type	s_SmIIS, %object
	.size	s_SmIIS, 256
s_SmIIS:
	.space	256
	.type	s_eScdDrvSleepStage, %object
	.size	s_eScdDrvSleepStage, 4
s_eScdDrvSleepStage:
	.space	4
	.type	s_ScdRegResetPhyAddr, %object
	.size	s_ScdRegResetPhyAddr, 4
s_ScdRegResetPhyAddr:
	.space	4
	.type	last_rec_pos_time.19004, %object
	.size	last_rec_pos_time.19004, 128
last_rec_pos_time.19004:
	.space	128
	.type	LastRecPosTime.19214, %object
	.size	LastRecPosTime.19214, 128
LastRecPosTime.19214:
	.space	128
	.type	last_rec_pos_time.19239, %object
	.size	last_rec_pos_time.19239, 128
last_rec_pos_time.19239:
	.space	128
	.type	s_ScdRegResetOKPhyAddr, %object
	.size	s_ScdRegResetOKPhyAddr, 4
s_ScdRegResetOKPhyAddr:
	.space	4
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
