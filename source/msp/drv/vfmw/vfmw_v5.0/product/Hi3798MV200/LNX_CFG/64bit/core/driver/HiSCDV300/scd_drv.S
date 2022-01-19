#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"scd_drv.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	SCDDRV_SetStateIdle.part.0, %function
SCDDRV_SetStateIdle.part.0:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sxtw	x0, w19
	ldr	x3, .LC2
	lsl	x1, x0, 6
	ldr	x2, .LC3
	add	x0, x1, x0, lsl 3
	add	x1, x3, x0
	mov	w0, 1
	ldr	x2, [x2, 256]
	str	wzr, [x1, 56]
	blr	x2
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_SetStateIdle.part.0, .-SCDDRV_SetStateIdle.part.0
	.align	3
.LC2:
	.xword	.LANCHOR0
	.align	3
.LC3:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	SCDDRV_SaveStreamSeg.part.6, %function
SCDDRV_SaveStreamSeg.part.6:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x19, .LC4
	mov	w0, 0
	ldr	x1, [x19, 32]
	blr	x1
	ldr	x2, .LC5
	ldr	x3, [x19, 88]
	ldr	w1, [x20, 20]
	ldr	x2, [x2, w21, sxtw 3]
	ldr	x0, [x20]
	blr	x3
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	SCDDRV_SaveStreamSeg.part.6, .-SCDDRV_SaveStreamSeg.part.6
	.align	3
.LC4:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC5:
	.xword	vfmw_save_seg_file
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	GetFreeSegBufSize.part.7, %function
GetFreeSegBufSize.part.7:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	add	x0, x19, 360448
	str	wzr, [x20]
	ldp	w2, w3, [x0, 32]
	cmp	w3, w2
	sub	w2, w2, #1
	bls	.L4
	ldr	w0, [x0, 28]
	add	w2, w0, w2
	sub	w2, w2, w3
.L5:
	cmp	w2, w0
	bgt	.L3
	str	w2, [x20]
.L3:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L4:
	bcs	.L6
	sub	w2, w2, w3
	ldr	w0, [x0, 28]
	b	.L5
	.p2align 3
.L6:
	ldr	w0, [x0, 28]
	sub	w2, w0, #1
	b	.L5
	.size	GetFreeSegBufSize.part.7, .-GetFreeSegBufSize.part.7
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_CfgDspMem
	.type	SCDDRV_CfgDspMem, %function
SCDDRV_CfgDspMem:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	add	w1, w19, 127
	ldr	x19, .LC6
	and	w1, w1, -128
	mov	w0, w1
	str	w1, [x19, 72]
	bl	MEM_Phy2Vir
	str	x0, [x19, 80]
	mov	w1, 18048
	str	w1, [x19, 88]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_CfgDspMem, .-SCDDRV_CfgDspMem
	.align	3
.LC6:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_LoadDspCode
	.type	SCDDRV_LoadDspCode, %function
SCDDRV_LoadDspCode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w22, w1
	bl	_mcount
	cbz	w19, .L25
.L10:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L25:
	ldr	x20, .LC7
	ldr	w0, [x20, 72]
	bl	MEM_Phy2Vir
	cbz	x0, .L26
	cmp	w22, 1
	beq	.L27
	cmp	w22, 2
	beq	.L28
	ldr	x1, .LC14
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L28:
	ldr	x21, .LC10
	mov	x2, 17920
	ldr	x1, .LC12
	ldr	x3, [x21, 104]
	add	x1, x1, 512
	blr	x3
	ldr	w0, [x20, 96]
	mov	w1, 0
	bl	MEM_WritePhyWord
.L15:
	ldr	w0, [x20, 96]
	mov	w1, 4480
	mov	w19, 0
	add	w0, w0, 264
	bl	MEM_WritePhyWord
	ldr	w0, [x20, 96]
	ldr	w1, [x20, 72]
	add	w0, w0, 268
	bl	MEM_WritePhyWord
	ldr	w0, [x20, 96]
	mov	w1, 0
	add	w0, w0, 256
	bl	MEM_WritePhyWord
	ldr	w0, [x20, 96]
	mov	w1, 5
	add	w0, w0, 256
	bl	MEM_WritePhyWord
	b	.L18
	.p2align 3
.L29:
	add	w19, w19, 1
	cmp	w19, 1000
	beq	.L19
.L18:
	ldr	x1, [x21, 232]
	mov	x0, 30
	blr	x1
	ldr	w0, [x20, 96]
	add	w0, w0, 260
	bl	MEM_ReadPhyWord
	tbz	x0, 0, .L29
	cmp	w19, 999
	bhi	.L19
	ldr	x2, .LC15
	mov	w0, 0
	ldr	x1, .LC19
	bl	dprint_vfmw
.L21:
	cmp	w22, 1
	beq	.L30
	cmp	w22, 2
	bne	.L10
	ldr	x0, .LC20
	mov	w1, 1
	str	w1, [x0]
	b	.L10
	.p2align 3
.L19:
	ldr	x2, .LC15
	mov	w0, 0
	ldr	x1, .LC17
	bl	dprint_vfmw
	b	.L21
	.p2align 3
.L27:
	ldr	x21, .LC10
	mov	x2, 17920
	ldr	x1, .LC11
	ldr	x3, [x21, 104]
	blr	x3
	ldr	w0, [x20, 96]
	mov	w1, w22
	bl	MEM_WritePhyWord
	b	.L15
	.p2align 3
.L30:
	ldr	x0, .LC20
	mov	w1, 2
	str	w1, [x0]
	b	.L10
.L26:
	ldr	x1, .LC9
	ldr	w2, [x20, 72]
	bl	dprint_vfmw
	b	.L10
	.size	SCDDRV_LoadDspCode, .-SCDDRV_LoadDspCode
	.align	3
.LC7:
	.xword	.LANCHOR0
	.align	3
.LC9:
	.xword	.LC8
	.align	3
.LC10:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC11:
	.xword	.LANCHOR1
	.align	3
.LC12:
	.xword	.LANCHOR2
	.align	3
.LC14:
	.xword	.LC13
	.align	3
.LC15:
	.xword	.LANCHOR3
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC19:
	.xword	.LC18
	.align	3
.LC20:
	.xword	g_DspDrvState
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetInstIDByRawArray
	.type	GetInstIDByRawArray, %function
GetInstIDByRawArray:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC23
	mov	x0, 0
	b	.L34
	.p2align 3
.L32:
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L40
.L34:
	add	x1, x3, x0, lsl 4
	ldr	x1, [x1, 104]
	add	x2, x1, 88
	cmp	x19, x2
	cbz	x1, .L32
	bne	.L32
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L40:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetInstIDByRawArray, .-GetInstIDByRawArray
	.align	3
.LC23:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_SetStateIdle
	.type	SCDDRV_SetStateIdle, %function
SCDDRV_SetStateIdle:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L41
	mov	w0, 0
	bl	SCDDRV_SetStateIdle.part.0
.L41:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_SetStateIdle, .-SCDDRV_SetStateIdle
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_SetStateWork
	.type	SCDDRV_SetStateWork, %function
SCDDRV_SetStateWork:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L43
	ldr	x0, .LC24
	mov	w1, 1
	str	w1, [x0, 56]
.L43:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_SetStateWork, .-SCDDRV_SetStateWork
	.align	3
.LC24:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ResetSCD
	.type	ResetSCD, %function
ResetSCD:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L52
	ldr	x20, .LC25
	mov	w1, 3
	ldr	w0, [x20, 96]
	add	w0, w0, 2176
	bl	MEM_WritePhyWord
	ldr	w0, [x20, 96]
	add	w0, w0, 2076
	bl	MEM_ReadPhyWord
	ldr	x21, .LC26
	mov	w22, w0
	ldr	x2, [x21]
	ldr	w19, [x2, 120]
	tbz	x19, 0, .L57
	orr	w19, w19, 32
	str	w19, [x2, 120]
	ldr	w0, [x2, 372]
	tbnz	x0, 1, .L51
	mov	w0, 9999
	b	.L49
	.p2align 3
.L59:
	subs	w0, w0, #1
	beq	.L58
.L49:
	ldr	w1, [x2, 372]
	tbz	x1, 1, .L59
.L51:
	ldr	w0, [x20, 96]
	and	w1, w22, 1
	and	w19, w19, -33
	str	w19, [x2, 120]
	add	w0, w0, 2076
	bl	MEM_WritePhyWord
	ldr	w0, [x20, 96]
	mov	w1, 2
	add	w0, w0, 2176
	bl	MEM_WritePhyWord
	mov	w0, 1
.L54:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L58:
	ldr	x1, .LC30
	mov	w2, 0
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x2, [x21]
	b	.L51
	.p2align 3
.L57:
	ldr	x1, .LC28
	mov	w2, 0
	mov	w0, 26
	bl	dprint_vfmw
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L52:
	mov	w0, -2
	b	.L54
	.size	ResetSCD, .-ResetSCD
	.align	3
.LC25:
	.xword	.LANCHOR0
	.align	3
.LC26:
	.xword	g_pstRegCrg
	.align	3
.LC28:
	.xword	.LC27
	.align	3
.LC30:
	.xword	.LC29
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_ResetSCD
	.type	SCDDRV_ResetSCD, %function
SCDDRV_ResetSCD:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC31
	ldr	w0, [x0, 52]
	cmp	w19, w0
	beq	.L64
.L60:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L64:
	ldr	x0, .LC32
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L62
	mov	w1, 0
	mov	w0, 0
	bl	VDH_Reset_Module
.L63:
	mov	w0, 0
	bl	SCDDRV_SetStateIdle.part.0
	b	.L60
	.p2align 3
.L62:
	mov	w0, 0
	bl	ResetSCD
	b	.L63
	.size	SCDDRV_ResetSCD, .-SCDDRV_ResetSCD
	.align	3
.LC31:
	.xword	.LANCHOR0
	.align	3
.LC32:
	.xword	g_HalDisable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_IsRawArrayFull
	.type	SCDDRV_IsRawArrayFull, %function
SCDDRV_IsRawArrayFull:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 98304
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldp	w0, w2, [x1, 4]
	add	w0, w0, 1
	asr	w1, w0, 31
	lsr	w1, w1, 22
	add	w0, w0, w1
	and	w0, w0, 1023
	sub	w0, w0, w1
	cmp	w0, w2
	cset	w0, eq
	ret
	.size	SCDDRV_IsRawArrayFull, .-SCDDRV_IsRawArrayFull
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_InsertRawPacket
	.type	SCDDRV_InsertRawPacket, %function
SCDDRV_InsertRawPacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, .LC33
	add	x19, x0, x19, sxtw 4
	ldr	w0, [x20, 4]
	cmp	w0, wzr
	ldr	x0, [x19, 104]
	ccmp	x0, xzr, 4, ne
	beq	.L68
	add	x0, x0, 88
	add	x19, x0, 98304
	ldp	w3, w1, [x19, 4]
	add	w2, w3, 1
	asr	w4, w2, 31
	lsr	w4, w4, 22
	add	w2, w2, w4
	and	w2, w2, 1023
	sub	w2, w2, w4
	cmp	w2, w1
	beq	.L69
	sxtw	x3, w3
	ldr	x5, .LC34
	lsl	x4, x3, 2
	mov	x2, 96
	sub	x3, x4, x3
	mov	x1, x20
	ldr	x4, [x5, 104]
	add	x0, x0, x3, lsl 5
	blr	x4
	ldr	w1, [x19, 4]
	mov	w0, 0
	add	w1, w1, 1
	asr	w2, w1, 31
	lsr	w2, w2, 22
	add	w1, w1, w2
	and	w1, w1, 1023
	sub	w1, w1, w2
	str	w1, [x19, 4]
.L67:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L69:
	mov	w0, -4
	b	.L67
.L68:
	mov	w0, -1
	b	.L67
	.size	SCDDRV_InsertRawPacket, .-SCDDRV_InsertRawPacket
	.align	3
.LC33:
	.xword	.LANCHOR0
	.align	3
.LC34:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetRawState
	.type	GetRawState, %function
GetRawState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L73
	ldr	x0, .LC35
	add	x19, x0, x19, sxtw 4
	ldr	x0, [x19, 104]
	cbz	x0, .L73
	add	x2, x0, 88
	mov	w0, -4
	add	x2, x2, 98304
	ldp	w1, w3, [x2, 4]
	add	w1, w1, 1
	asr	w2, w1, 31
	lsr	w2, w2, 22
	add	w1, w1, w2
	and	w1, w1, 1023
	sub	w1, w1, w2
	cmp	w1, w3
	csel	w0, w0, wzr, eq
.L71:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L73:
	mov	w0, -4
	b	.L71
	.size	GetRawState, .-GetRawState
	.align	3
.LC35:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ShowRawPacket
	.type	ShowRawPacket, %function
ShowRawPacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 98304
	mov	x21, x1
	bl	_mcount
	ldr	w0, [x19, 16]
	cmp	w0, 1023
	bhi	.L78
	ldr	w1, [x19, 4]
	cmp	w0, w1
	beq	.L78
	sxtw	x0, w0
	ldr	x1, .LC36
	lsl	x3, x0, 2
	mov	x2, 96
	sub	x3, x3, x0
	mov	x0, x21
	ldr	x4, [x1, 104]
	add	x1, x20, x3, lsl 5
	blr	x4
	ldr	w1, [x19, 16]
	mov	w0, 0
	add	w1, w1, 1
	asr	w2, w1, 31
	lsr	w2, w2, 22
	add	w1, w1, w2
	and	w1, w1, 1023
	sub	w1, w1, w2
	str	w1, [x19, 16]
.L76:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L78:
	mov	w0, -3
	b	.L76
	.size	ShowRawPacket, .-ShowRawPacket
	.align	3
.LC36:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetFirstOffset
	.type	GetFirstOffset, %function
GetFirstOffset:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L81
	add	x0, x19, 98304
	ldp	w2, w1, [x0]
	cmp	w2, w1
	beq	.L82
	ldr	w1, [x0, 12]
	mov	w0, 0
	str	w1, [x20]
.L80:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L81:
	mov	w0, -1
	b	.L80
	.p2align 3
.L82:
	mov	w0, -3
	b	.L80
	.size	GetFirstOffset, .-GetFirstOffset
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetFirstRawPacket
	.type	GetFirstRawPacket, %function
GetFirstRawPacket:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x23, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cbz	x23, .L88
	add	x20, x23, 98304
	ldp	w1, w0, [x20]
	cmp	w1, w0
	beq	.L87
	ldr	w24, [x20, 12]
	mov	w22, w24
	sxtw	x21, w24
.L85:
	cmp	w1, 1023
	str	w1, [x20, 16]
	bhi	.L86
	ldr	w0, [x20, 4]
	cmp	w0, w1
	beq	.L86
	sxtw	x1, w1
	ldr	x3, .LC37
	lsl	x0, x1, 2
	mov	x2, 96
	sub	x1, x0, x1
	mov	x0, x19
	ldr	x3, [x3, 104]
	add	x1, x23, x1, lsl 5
	blr	x3
	ldr	w0, [x20, 16]
	add	w0, w0, 1
	asr	w1, w0, 31
	lsr	w1, w1, 22
	add	w0, w0, w1
	and	w0, w0, 1023
	sub	w0, w0, w1
	str	w0, [x20, 16]
.L86:
	ldr	w2, [x19, 4]
	ldr	w0, [x19, 12]
	ldr	x1, [x19, 40]
	add	w22, w2, w22
	sub	w0, w0, w24
	str	w22, [x19, 4]
	str	w0, [x19, 12]
	add	x21, x1, x21
	str	x21, [x19, 40]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L87:
	mov	x21, 0
	mov	w22, 0
	mov	w24, 0
	b	.L85
	.p2align 3
.L88:
	mov	x0, 98304
	mov	x21, 0
	mov	w22, 0
	mov	w24, 0
	mov	x20, x0
	ldr	w1, [x0]
	b	.L85
	.size	GetFirstRawPacket, .-GetFirstRawPacket
	.align	3
.LC37:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SetFirstOffset
	.type	SetFirstOffset, %function
SetFirstOffset:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L93
	add	x3, x19, 98304
	ldp	w0, w2, [x3]
	cmp	w0, w2
	beq	.L92
	sxtw	x0, w0
	ldr	w4, [x3, 12]
	lsl	x2, x0, 2
	sub	x0, x2, x0
	add	w1, w20, w4
	add	x0, x19, x0, lsl 5
	ldr	w0, [x0, 12]
	cmp	w1, w0
	bge	.L93
	mov	w0, 0
	str	w1, [x3, 12]
.L90:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L93:
	mov	w0, -1
	b	.L90
	.p2align 3
.L92:
	mov	w0, -3
	b	.L90
	.size	SetFirstOffset, .-SetFirstOffset
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DeleteRawPacket
	.type	DeleteRawPacket, %function
DeleteRawPacket:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x26, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	x26, xzr
	ccmp	w20, wzr, 4, ne
	beq	.L110
	ldr	x27, .LC38
	mov	x0, 0
	b	.L98
	.p2align 3
.L96:
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L99
.L98:
	add	x1, x27, x0, lsl 4
	mov	w3, w0
	ldr	x1, [x1, 104]
	add	x2, x1, 88
	cmp	x26, x2
	cbz	x1, .L96
	bne	.L96
	cmp	w0, 31
	bhi	.L99
	add	x23, x26, 98304
	ldp	w0, w2, [x23]
	cmp	w0, w2
	bgt	.L121
.L118:
	sub	w2, w2, w0
	cmp	w2, w20
	bcc	.L122
	mov	w24, w0
	cbz	w20, .L104
	ldr	x21, .LC43
	add	x27, x27, 104
	ldr	x22, .LC45
	mov	w25, 0
	add	x21, x21, 24
	add	x27, x27, x3, sxtw 4
	.p2align 2
.L105:
	uxtw	x19, w24
	mov	x2, x21
	lsl	x0, x19, 2
	mov	x1, x22
	sub	x19, x0, x19
	mov	w0, 26
	add	w25, w25, 1
	add	w24, w24, 1
	add	x19, x26, x19, lsl 5
	and	w24, w24, 1023
	ldr	w3, [x19, 4]
	ldr	w4, [x19, 12]
	bl	dprint_vfmw
	ldr	x1, [x27]
	ldr	w2, [x19, 12]
	add	x1, x1, 98304
	ldr	w0, [x1, 108]
	subs	w0, w0, w2
	csel	w0, w0, wzr, pl
	cmp	w20, w25
	str	w0, [x1, 108]
	bne	.L105
	ldr	w0, [x23]
	add	w20, w20, w0
	str	w20, [x23]
	cmp	w20, 1023
	ble	.L108
	sub	w20, w20, #1024
	str	w20, [x23]
.L108:
	str	wzr, [x23, 12]
.L119:
	mov	w0, 0
.L116:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L121:
	add	w2, w2, 1024
	b	.L118
.L104:
	cmp	w0, 1023
	str	w0, [x23]
	ble	.L119
	sub	w0, w0, #1024
	str	w0, [x23]
	b	.L119
	.p2align 3
.L110:
	mov	w0, -1
	b	.L116
.L122:
	ldr	x1, .LC42
	mov	w3, w20
	mov	w0, 26
	bl	dprint_vfmw
	mov	w0, -1
	b	.L116
	.p2align 3
.L99:
	ldr	x1, .LC40
	mov	w2, 487
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L116
	.size	DeleteRawPacket, .-DeleteRawPacket
	.align	3
.LC38:
	.xword	.LANCHOR0
	.align	3
.LC40:
	.xword	.LC39
	.align	3
.LC42:
	.xword	.LC41
	.align	3
.LC43:
	.xword	.LANCHOR3
	.align	3
.LC45:
	.xword	.LC44
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetRawNumOffset
	.type	GetRawNumOffset, %function
GetRawNumOffset:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	mov	x21, x2
	mov	x22, x3
	mov	x23, x4
	bl	_mcount
	cmp	x20, xzr
	ccmp	w19, wzr, 1, ne
	blt	.L131
	cmp	x21, xzr
	ccmp	x22, xzr, 4, ne
	ccmp	x23, xzr, 4, ne
	beq	.L131
	add	x2, x20, 98304
	ldr	w1, [x2]
	ldr	w8, [x2, 12]
	sxtw	x3, w1
	lsl	x0, x3, 2
	sub	x0, x0, x3
	add	x0, x20, x0, lsl 5
	ldr	w0, [x0, 12]
	sub	w8, w0, w8
	cbz	x20, .L132
	ldr	w10, [x2, 4]
	sub	w10, w10, w1
	add	w0, w10, 1024
	cmp	w10, wzr
	csel	w10, w0, w10, lt
.L125:
	add	w10, w1, w10
	cmp	w19, w8
	ccmp	w10, w1, 0, ge
	mov	w0, w1
	bls	.L133
	mov	w6, w1
	b	.L127
	.p2align 3
.L134:
	mov	w8, w5
.L127:
	add	w6, w6, 1
	asr	w0, w6, 31
	lsr	w5, w0, 22
	add	w0, w6, w5
	and	w0, w0, 1023
	sub	w0, w0, w5
	sxtw	x7, w0
	lsl	x5, x7, 2
	sub	x5, x5, x7
	add	x5, x20, x5, lsl 5
	ldr	w5, [x5, 12]
	add	w5, w8, w5
	cmp	w19, w5
	cset	w9, lt
	cmp	w10, w6
	cset	w7, ls
	orr	w7, w9, w7
	cbz	w7, .L134
	cmp	w1, w6
	beq	.L126
	sub	w8, w19, w8
	str	w8, [x22]
.L129:
	str	w0, [x23]
	mov	w0, 0
	ldr	w1, [x2]
	sub	w6, w6, w1
	str	w6, [x21]
.L124:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L133:
	mov	w6, w1
	.p2align 2
.L126:
	str	w19, [x22]
	b	.L129
	.p2align 3
.L132:
	mov	w10, 0
	b	.L125
.L131:
	mov	w0, -1
	b	.L124
	.size	GetRawNumOffset, .-GetRawNumOffset
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DeleteRawLen
	.type	DeleteRawLen, %function
DeleteRawLen:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w22, w1
	bl	_mcount
	cmp	x19, xzr
	ccmp	w22, wzr, 1, ne
	blt	.L138
	stp	wzr, wzr, [x29, 52]
	cbz	x19, .L138
	add	x20, x19, 98304
	ldr	w1, [x20, 12]
	ldr	w0, [x20, 20]
	sub	w0, w0, w1
	asr	w21, w0, 31
	cbnz	w21, .L137
	cmp	w22, w0
	bgt	.L138
	add	x4, x29, 60
	add	x3, x29, 56
	add	x2, x29, 52
	mov	w1, w22
	mov	x0, x19
	bl	GetRawNumOffset
	ldp	w5, w4, [x29, 52]
	ldr	w1, [x20]
	mov	w3, w5
	add	w1, w5, w1
	asr	w0, w1, 31
	lsr	w0, w0, 22
	add	w1, w1, w0
	and	w1, w1, 1023
	sub	w0, w1, w0
	str	w0, [x29, 60]
	ldr	x1, .LC49
	sxtw	x6, w0
	lsl	x2, x6, 2
	sub	x0, x2, x6
	mov	w2, 653
	add	x0, x19, x0, lsl 5
	ldrb	w7, [x0, 2]
	ldr	w6, [x0, 12]
	mov	w0, 26
	bl	dprint_vfmw
	ldr	w1, [x29, 52]
	mov	x0, x19
	bl	DeleteRawPacket
	ldp	w0, w1, [x20]
	cmp	w0, w1
	beq	.L139
	sxtw	x0, w0
	ldr	w2, [x20, 12]
	lsl	x1, x0, 2
	ldr	w3, [x29, 56]
	sub	x0, x1, x0
	add	w1, w3, w2
	add	x19, x19, x0, lsl 5
	ldr	w0, [x19, 12]
	cmp	w1, w0
	blt	.L143
.L138:
	mov	w21, -1
.L137:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L143:
	str	w1, [x20, 12]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L139:
	mov	w21, -3
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	DeleteRawLen, .-DeleteRawLen
	.align	3
.LC49:
	.xword	.LC48
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DeleteLastSendRaw
	.type	DeleteLastSendRaw, %function
DeleteLastSendRaw:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L144
	ldr	x0, .LC50
	ubfiz	x19, x19, 4, 32
	add	x0, x0, 104
	ldr	x0, [x0, x19]
	cbz	x0, .L147
	add	x19, x0, 458752
	ldr	w1, [x19, 168]
	cmp	w1, wzr
	ble	.L144
	add	x0, x0, 88
	bl	DeleteRawPacket
	str	wzr, [x19, 168]
.L144:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L147:
	ldr	x1, .LC52
	mov	w2, 670
	bl	dprint_vfmw
	b	.L144
	.size	DeleteLastSendRaw, .-DeleteLastSendRaw
	.align	3
.LC50:
	.xword	.LANCHOR0
	.align	3
.LC52:
	.xword	.LC51
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetRawStreamSize
	.type	GetRawStreamSize, %function
GetRawStreamSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L150
	add	x19, x19, 98304
	ldr	w2, [x19, 20]
	str	w2, [x20]
	ldr	w0, [x19, 12]
	sub	w0, w2, w0
	str	w0, [x20]
	asr	w0, w0, 31
.L149:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L150:
	mov	w0, -1
	b	.L149
	.size	GetRawStreamSize, .-GetRawStreamSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetRawStreamNum
	.type	GetRawStreamNum, %function
GetRawStreamNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L154
	add	x19, x19, 98304
	ldp	w1, w0, [x19]
	subs	w0, w0, w1
	bmi	.L153
	str	w0, [x20]
	mov	w0, 0
.L152:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L153:
	add	w2, w0, 1024
	str	w2, [x20]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L154:
	mov	w0, -1
	b	.L152
	.size	GetRawStreamNum, .-GetRawStreamNum
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ConfigStreamSegArray
	.type	ConfigStreamSegArray, %function
ConfigStreamSegArray:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	mov	x22, x2
	mov	w21, w3
	bl	_mcount
	cbz	x19, .L158
	cmp	w20, wzr
	mov	w0, 262143
	ccmp	x22, xzr, 4, ne
	ccmp	w21, w0, 0, ne
	bls	.L158
	ldr	x3, .LC54
	mov	x2, 32824
	mov	w1, 0
	movk	x2, 0x5, lsl 16
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x19, 360448
	mov	w0, 0
	str	w20, [x1, 24]
	str	x22, [x19]
	stp	w21, w20, [x1, 28]
	str	w20, [x1, 36]
.L156:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L158:
	mov	w0, -1
	b	.L156
	.size	ConfigStreamSegArray, .-ConfigStreamSegArray
	.align	3
.LC54:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ResetStreamSegArray
	.type	ResetStreamSegArray, %function
ResetStreamSegArray:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L159
	ldr	x3, .LC55
	mov	x2, 32768
	mov	w1, 0
	movk	x2, 0x5, lsl 16
	add	x0, x19, 8
	ldr	x3, [x3, 96]
	blr	x3
	add	x0, x19, 360448
	ldr	w1, [x0, 24]
	stp	wzr, wzr, [x0, 8]
	str	wzr, [x0, 16]
	stp	w1, w1, [x0, 32]
.L159:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ResetStreamSegArray, .-ResetStreamSegArray
	.align	3
.LC55:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetSegBufFreeSize
	.type	GetSegBufFreeSize, %function
GetSegBufFreeSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L168
	add	x1, x19, 360448
	ldp	w0, w2, [x1, 32]
	cmp	w2, w0
	sub	w0, w0, #1
	bhi	.L169
	sub	w0, w0, w2
	bcc	.L165
	ldr	w0, [x1, 28]
	sub	w0, w0, #1
.L165:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L169:
	ldr	w1, [x1, 28]
	ldr	x19, [sp, 16]
	add	w0, w0, w1
	sub	w0, w0, w2
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L168:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetSegBufFreeSize, .-GetSegBufFreeSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckData
	.type	CheckData, %function
CheckData:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	uxtb	w20, w1
	bl	_mcount
	cbz	x19, .L170
	and	w0, w20, 31
	sub	w1, w0, #30
	sub	w2, w0, #1
	uxtb	w1, w1
	cmp	w1, 1
	ccmp	w0, 19, 4, hi
	ccmp	w2, 12, 0, ne
	bhi	.L172
	add	x1, x19, 507904
	ldr	w0, [x1, 2040]
	add	w0, w0, 1
	str	w0, [x1, 2040]
.L172:
	sub	w2, w20, #1
	add	w0, w20, 79
	uxtb	w2, w2
	uxtb	w0, w0
	cmp	w2, 183
	ccmp	w0, 4, 0, ls
	bhi	.L182
.L173:
	add	x19, x19, 507904
	ldr	w0, [x19, 2044]
	add	w0, w0, 1
	str	w0, [x19, 2044]
.L170:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L182:
	add	w20, w20, 73
	uxtb	w20, w20
	cmp	w20, 3
	bls	.L173
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CheckData, .-CheckData
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckStartCodeCnt
	.type	CheckStartCodeCnt, %function
CheckStartCodeCnt:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	uxtb	w20, w1
	bl	_mcount
	cbz	x19, .L183
	add	x0, x19, 507904
	ldr	w1, [x0, 2048]
	cmp	w1, 2
	ble	.L183
	and	w20, w20, 31
	cbz	w20, .L183
	ldr	w2, [x0, 2056]
	ldr	w1, [x0, 2060]
	sub	w3, w1, w2
	cmp	w3, 1
	beq	.L197
.L185:
	cmp	w1, w2
	beq	.L198
.L183:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L198:
	ldr	w2, [x0, 2052]
	cmp	w1, w2
	bne	.L183
.L186:
	cmp	w1, 20
	ccmp	w1, 1, 4, ne
	beq	.L183
	ldr	w1, [x0, 2040]
	cmp	w1, wzr
	ble	.L187
	sub	w1, w1, #1
	str	w1, [x0, 2040]
.L187:
	ldr	w1, [x0, 2044]
	add	w1, w1, 1
	str	w1, [x0, 2044]
	b	.L183
	.p2align 3
.L197:
	ldr	w3, [x0, 2052]
	sub	w3, w2, w3
	cmp	w3, 1
	bne	.L185
	b	.L186
	.size	CheckStartCodeCnt, .-CheckStartCodeCnt
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	CheckStream.part.3, %function
CheckStream.part.3:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	mov	w21, w1
	bl	_mcount
	ldr	x0, .LC56
	ldr	x19, [x0, w21, sxtw 3]
	cbz	x19, .L199
	ldr	w0, [x19, 672]
	cmp	w0, wzr
	ccmp	w0, 3, 4, ne
	bne	.L199
	add	x20, x19, 507904
	ldr	w0, [x20, 2048]
	cmp	w0, 199
	bgt	.L199
	ldrb	w1, [x22]
	cbz	w1, .L217
.L207:
	mov	w3, 0
	mov	w22, 0
.L203:
	add	x4, x20, 2048
	ldr	w2, [x20, 2056]
	ldr	w1, [x20, 2060]
	add	w0, w0, 1
	stp	w1, w3, [x4, 8]
	stp	w0, w2, [x4]
	mov	w1, w22
	mov	x0, x19
	bl	CheckData
	mov	x0, x19
	mov	w1, w22
	bl	CheckStartCodeCnt
	ldr	w0, [x20, 2048]
	cmp	w0, 199
	ble	.L199
	ldr	w1, [x20, 2040]
	ldr	w0, [x20, 2044]
	sub	w2, w1, w0
	cmp	w2, 49
	bgt	.L218
.L204:
	sub	w0, w0, w1
	cmp	w0, 49
	ble	.L199
	ldr	w0, [x19, 672]
	cbnz	w0, .L199
	ldr	x0, .LC57
	ldr	x4, [x0]
	cbz	x4, .L199
	mov	w3, 0
	mov	x2, 0
	mov	w1, 124
	mov	w0, w21
	blr	x4
.L199:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L217:
	ldrb	w1, [x22, 1]
	cbnz	w1, .L207
	ldrb	w1, [x22, 2]
	cmp	w1, 1
	bne	.L207
	ldrb	w22, [x22, 3]
	and	w3, w22, 31
	b	.L203
	.p2align 3
.L218:
	ldr	w2, [x19, 672]
	cmp	w2, 3
	bne	.L204
	ldr	x0, .LC57
	ldr	x4, [x0]
	cbz	x4, .L199
	mov	w1, 124
	mov	w3, 0
	mov	x2, 0
	mov	w0, w21
	blr	x4
	ldr	w1, [x20, 2040]
	ldr	w0, [x20, 2044]
	b	.L204
	.size	CheckStream.part.3, .-CheckStream.part.3
	.align	3
.LC56:
	.xword	s_pstVfmwChan
	.align	3
.LC57:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckStream
	.type	CheckStream, %function
CheckStream:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L219
	cmp	w20, 31
	bhi	.L219
	mov	w1, w20
	mov	x0, x19
	bl	CheckStream.part.3
.L219:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CheckStream, .-CheckStream
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InsertStreamSeg
	.type	InsertStreamSeg, %function
InsertStreamSeg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	mov	x21, x1
	mov	w23, w2
	bl	_mcount
	cmp	x22, xzr
	ccmp	x21, xzr, 4, ne
	beq	.L228
	add	x20, x22, 360448
	ldp	w1, w19, [x20, 8]
	add	w0, w19, 1
	asr	w3, w0, 31
	lsr	w3, w3, 20
	add	w0, w0, w3
	and	w0, w0, 4095
	sub	w0, w0, w3
	cmp	w0, w1
	beq	.L229
	ldr	x0, [x21]
	cbz	x0, .L226
	cmp	w23, 31
	bls	.L236
.L226:
	sxtw	x0, w19
	ldr	x3, .LC58
	lsl	x19, x0, 2
	mov	x2, 88
	sub	x19, x19, x0
	mov	x1, x21
	lsl	x19, x19, 2
	ldr	x3, [x3, 104]
	sub	x19, x19, x0
	add	x19, x22, x19, lsl 3
	add	x0, x19, 8
	blr	x3
	ldr	w3, [x20, 12]
	mov	w5, 1
	add	w1, w3, 1
	sxtw	x4, w3
	asr	w2, w1, 31
	lsl	x0, x4, 2
	lsr	w2, w2, 20
	sub	x0, x0, x4
	add	w1, w1, w2
	lsl	x0, x0, 2
	and	w1, w1, 4095
	sub	x0, x0, x4
	sub	w1, w1, w2
	add	x0, x22, x0, lsl 3
	strb	w5, [x0, 16]
	str	w3, [x19, 32]
	str	w1, [x20, 12]
	ldrsb	w0, [x21, 9]
	cmp	w0, 2
	beq	.L227
	ldp	w1, w2, [x21, 16]
	ldp	w0, w3, [x20, 40]
	add	w2, w1, w2
	str	w2, [x20, 36]
	ldr	w1, [x21, 20]
	add	w1, w0, w1
	str	w1, [x20, 40]
	ldr	w0, [x21, 20]
	add	w0, w3, w0
	str	w0, [x20, 44]
.L227:
	ldr	w1, [x20, 48]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x20, 48]
.L225:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L236:
	mov	w1, w23
	bl	CheckStream.part.3
	ldr	w19, [x20, 12]
	b	.L226
	.p2align 3
.L228:
	mov	w0, -1
	b	.L225
	.p2align 3
.L229:
	mov	w0, -4
	b	.L225
	.size	InsertStreamSeg, .-InsertStreamSeg
	.align	3
.LC58:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_GetStreamSeg
	.type	SCDDRV_GetStreamSeg, %function
SCDDRV_GetStreamSeg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x24, x1
	bl	_mcount
	cmp	x21, xzr
	ccmp	x24, xzr, 4, ne
	beq	.L248
	add	x22, x21, 360448
	ldr	w19, [x22, 8]
	tbnz	w19, #31, .L248
	ldr	w1, [x22, 12]
	tbnz	w1, #31, .L248
	cmp	w19, w1
	beq	.L250
	sxtw	x20, w19
	lsl	x0, x20, 2
	b	.L255
	.p2align 3
.L241:
	add	w0, w19, 1
	asr	w19, w0, 31
	lsr	w19, w19, 20
	add	w0, w0, w19
	and	w0, w0, 4095
	sub	w19, w0, w19
	cmp	w1, w19
	sxtw	x20, w19
	lsl	x0, x20, 2
	beq	.L250
.L255:
	sub	x0, x0, x20
	lsl	x0, x0, 2
	sub	x0, x0, x20
	add	x0, x21, x0, lsl 3
	ldrsb	w0, [x0, 16]
	cmp	w0, 1
	bne	.L241
	lsl	x23, x20, 2
	sub	x23, x23, x20
	lsl	x23, x23, 2
	sub	x23, x23, x20
	add	x23, x21, x23, lsl 3
	adds	x1, x23, 8
	beq	.L250
	ldr	x3, .LC59
	mov	x2, 88
	mov	x0, x24
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 88
	mov	w1, 2
	smaddl	x19, w19, w0, x21
	ldrsb	w0, [x19, 17]
	strb	w1, [x19, 16]
	cmp	w0, 2
	ldr	w2, [x22, 44]
	ldr	w3, [x23, 28]
	beq	.L245
	sub	w2, w2, w3
.L245:
	lsl	x0, x20, 2
	ldr	w1, [x22, 48]
	sub	x0, x0, x20
	cmp	w2, wzr
	lsl	x0, x0, 2
	csel	w2, w2, wzr, ge
	sub	x20, x0, x20
	subs	w1, w1, #1
	csel	w1, w1, wzr, pl
	mov	w0, 26
	add	x21, x21, x20, lsl 3
	stp	w2, w1, [x22, 44]
	ldr	x1, .LC61
	ldrb	w4, [x19, 18]
	ldr	w2, [x21, 24]
	bl	dprint_vfmw
	mov	w0, 0
.L238:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L250:
	mov	w0, -3
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L248:
	mov	w0, -1
	b	.L238
	.size	SCDDRV_GetStreamSeg, .-SCDDRV_GetStreamSeg
	.align	3
.LC59:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC61:
	.xword	.LC60
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseStreamSeg
	.type	ReleaseStreamSeg, %function
ReleaseStreamSeg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x24, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x24, .L275
	sub	w1, w20, #4096
	mov	w0, -4098
	cmp	w1, w0
	bls	.L275
	cmn	w20, #1
	add	x23, x24, 360448
	beq	.L291
	ldp	w0, w1, [x23, 8]
	cmp	w0, w1
	bne	.L287
	b	.L279
	.p2align 3
.L263:
	add	w0, w0, 1
	and	w0, w0, 4095
	cmp	w0, w1
	beq	.L279
.L287:
	cmp	w20, w0
	bne	.L263
	uxtw	x1, w0
	mov	w0, -3
	lsl	x22, x1, 2
	sub	x22, x22, x1
	lsl	x22, x22, 2
	sub	x1, x22, x1
	add	x1, x24, x1, lsl 3
	add	x22, x1, 8
	ldrsb	w2, [x1, 16]
	cmp	w2, 2
	beq	.L260
.L283:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L291:
	ldp	w20, w0, [x23, 8]
	cmp	w20, w0
	bne	.L292
.L279:
	mov	w0, -3
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L292:
	sxtw	x22, w20
	lsl	x0, x22, 2
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x22, x0, x22
	add	x22, x24, x22, lsl 3
	add	x22, x22, 8
.L260:
	mov	w0, -3
	cbz	x22, .L283
	ldrb	w4, [x22, 10]
	mov	w5, w20
	ldr	x1, .LC63
	mov	w0, 26
	ldp	w2, w3, [x22, 16]
	strb	wzr, [x22, 8]
	bl	dprint_vfmw
	ldr	w19, [x23, 8]
	cmp	w20, w19
	beq	.L293
.L265:
	ldrsb	w0, [x22, 9]
	cmp	w0, 2
	beq	.L290
	ldr	w1, [x22, 20]
	ldr	w0, [x23, 40]
	sub	w1, w0, w1
.L269:
	cmp	w1, wzr
	mov	w0, 0
	csel	w1, w1, wzr, ge
	str	w1, [x23, 40]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L290:
	ldr	w1, [x23, 40]
	b	.L269
	.p2align 3
.L293:
	ldr	x20, .LC64
	ldr	x21, .LC66
	add	x20, x20, 40
	b	.L270
	.p2align 3
.L266:
	ldr	w2, [x23, 12]
	lsl	x0, x0, 2
	sub	x0, x0, x1
	cmp	w19, w2
	add	x0, x24, x0, lsl 3
	beq	.L272
	ldrsb	w1, [x0, 16]
	cbnz	w1, .L294
.L267:
	add	w19, w19, 1
	and	w19, w19, 4095
.L270:
	uxtw	x1, w19
	cmp	w19, 4095
	lsl	x0, x1, 2
	sub	x0, x0, x1
	bls	.L266
	mov	x2, x20
	mov	x1, x21
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w2, [x23, 12]
	cmp	w19, w2
	bne	.L267
	.p2align 2
.L272:
	ldr	w0, [x23, 36]
	str	w2, [x23, 8]
	str	w0, [x23, 32]
	b	.L265
	.p2align 3
.L294:
	str	w19, [x23, 8]
	ldrsb	w1, [x22, 9]
	cmp	w1, 2
	beq	.L290
	ldr	w0, [x0, 24]
	str	w0, [x23, 32]
	b	.L265
.L275:
	mov	w0, -1
	b	.L283
	.size	ReleaseStreamSeg, .-ReleaseStreamSeg
	.align	3
.LC63:
	.xword	.LC62
	.align	3
.LC64:
	.xword	.LANCHOR3
	.align	3
.LC66:
	.xword	.LC65
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetSegStreamSize
	.type	GetSegStreamSize, %function
GetSegStreamSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L297
	add	x19, x19, 360448
	mov	w0, 0
	ldr	w1, [x19, 40]
	str	w1, [x20]
.L296:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L297:
	mov	w0, -1
	b	.L296
	.size	GetSegStreamSize, .-GetSegStreamSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetSegStreamNum
	.type	GetSegStreamNum, %function
GetSegStreamNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L300
	add	x19, x19, 360448
	ldp	w1, w0, [x19, 8]
	ldr	x19, [sp, 16]
	sub	w0, w0, w1
	and	w0, w0, 4095
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L300:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetSegStreamNum, .-GetSegStreamNum
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetFreshSegStream
	.type	GetFreshSegStream, %function
GetFreshSegStream:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	mov	x20, x2
	bl	_mcount
	cmp	x21, xzr
	ccmp	x20, xzr, 4, ne
	ccmp	x19, xzr, 4, ne
	beq	.L301
	add	x19, x19, 360448
	ldr	w0, [x19, 48]
	str	w0, [x21]
	ldr	w0, [x19, 44]
	str	w0, [x20]
.L301:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	GetFreshSegStream, .-GetFreshSegStream
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_PrepareSleep
	.type	SCDDRV_PrepareSleep, %function
SCDDRV_PrepareSleep:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L307
	ldr	x1, .LC68
	ldr	w0, [x1, 616]
	cbnz	w0, .L307
	ldr	w0, [x1, 56]
	cbz	w0, .L308
	mov	w2, 1
	mov	w0, 0
	str	w2, [x1, 616]
.L304:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L308:
	mov	w2, 2
	str	w2, [x1, 616]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L307:
	mov	w0, -1
	b	.L304
	.size	SCDDRV_PrepareSleep, .-SCDDRV_PrepareSleep
	.align	3
.LC68:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_GetSleepStage
	.type	SCDDRV_GetSleepStage, %function
SCDDRV_GetSleepStage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, 3
	cbz	w19, .L312
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L312:
	ldr	x0, .LC69
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 616]
	ret
	.size	SCDDRV_GetSleepStage, .-SCDDRV_GetSleepStage
	.align	3
.LC69:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_ForceSleep
	.type	SCDDRV_ForceSleep, %function
SCDDRV_ForceSleep:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L313
	ldr	x0, .LC70
	ldr	w1, [x0, 616]
	cmp	w1, 2
	beq	.L313
	mov	w1, 2
	str	w1, [x0, 616]
.L313:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_ForceSleep, .-SCDDRV_ForceSleep
	.align	3
.LC70:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_ExitSleep
	.type	SCDDRV_ExitSleep, %function
SCDDRV_ExitSleep:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L318
	ldr	x0, .LC71
	str	wzr, [x0, 616]
.L318:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_ExitSleep, .-SCDDRV_ExitSleep
	.align	3
.LC71:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ResetLastUnfinishedSegInfo
	.type	ResetLastUnfinishedSegInfo, %function
ResetLastUnfinishedSegInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L320
	add	x0, x19, 458752
	ldr	x4, .LC72
	add	x6, x0, 256
	mov	w3, -1
	mov	w5, 1
	mov	x2, 88
	strh	w3, [x0, 468]
	mov	w1, 0
	strh	w3, [x0, 476]
	add	x0, x0, 512
	str	w3, [x0, -40]
	ldr	x4, [x4, 96]
	stp	w3, wzr, [x6, 224]
	stp	w5, wzr, [x6, 232]
	str	wzr, [x0, -16]
	str	wzr, [x0, -12]
	str	wzr, [x0, -8]
	blr	x4
.L320:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ResetLastUnfinishedSegInfo, .-ResetLastUnfinishedSegInfo
	.align	3
.LC72:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_ClearInst
	.type	SM_ClearInst, %function
SM_ClearInst:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L328
	ldr	x20, .LC74
	sbfiz	x19, x19, 4, 32
	ldr	x21, .LC73
	mov	x2, 16992
	add	x20, x20, 104
	movk	x2, 0x7, lsl 16
	mov	w1, 0
	ldr	x3, [x21, 96]
	ldr	x0, [x20, x19]
	blr	x3
	ldr	x0, [x20, x19]
	cbz	x0, .L327
	add	x0, x0, 458752
	mov	w3, -1
	add	x6, x0, 256
	ldr	x4, [x21, 96]
	mov	w5, 1
	mov	x2, 88
	strh	w3, [x0, 468]
	mov	w1, 0
	strh	w3, [x0, 476]
	add	x0, x0, 512
	str	w3, [x0, -40]
	stp	w3, wzr, [x6, 224]
	stp	w5, wzr, [x6, 232]
	str	wzr, [x0, -16]
	str	wzr, [x0, -12]
	str	wzr, [x0, -8]
	blr	x4
	ldr	x0, [x20, x19]
.L327:
	add	x1, x0, 458752
	mov	x2, -1
	mov	w0, 0
	str	x2, [x1, 280]
.L326:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L328:
	mov	w0, -1
	b	.L326
	.size	SM_ClearInst, .-SM_ClearInst
	.align	3
.LC73:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC74:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_InstInit
	.type	SM_InstInit, %function
SM_InstInit:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC76
	ldr	x21, .LC77
	add	x19, x20, 104
	add	x20, x20, 616
	.p2align 2
.L333:
	ldr	x3, [x21, 96]
	mov	x0, x19
	mov	x2, 16
	mov	w1, 0
	add	x19, x19, x2
	blr	x3
	cmp	x19, x20
	bne	.L333
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	SM_InstInit, .-SM_InstInit
	.align	3
.LC76:
	.xword	.LANCHOR0
	.align	3
.LC77:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_OpenSCDDrv
	.type	SM_OpenSCDDrv, %function
SM_OpenSCDDrv:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w21, w0
	mov	x0, x30
	mov	w22, w1
	sxtw	x20, w2
	bl	_mcount
	cmp	w22, wzr
	ccmp	w20, wzr, 0, gt
	ccmp	w21, wzr, 4, eq
	beq	.L339
	ldr	x25, .LC79
	lsl	x23, x20, 6
	add	x26, x23, x20, lsl 3
	mov	w0, 49152
	add	x20, x25, x20, lsl 2
	add	x19, x25, x26
	movk	w0, 0xf8c3, lsl 16
	str	w0, [x20, 96]
	ldr	w0, [x19, 48]
	cmp	w0, 1
	beq	.L338
	ldr	x0, .LC80
	mov	x2, 72
	mov	w1, 0
	ldr	x3, [x0, 96]
	mov	x0, x19
	blr	x3
	str	w21, [x25, x26]
	ldr	x1, .LC81
	add	w0, w21, 15
	and	w0, w0, -16
	str	w22, [x19, 4]
	add	x23, x1, x23
	str	w0, [x19, 16]
	sub	w24, w0, w21
	str	wzr, [x20, 616]
	add	w21, w21, 12288
	str	wzr, [x23, 60]
	add	w21, w21, w24
	add	w24, w24, 45056
	bl	MEM_Phy2Vir
	str	x0, [x19, 8]
	mov	w0, 12288
	str	w21, [x19, 32]
	str	w0, [x19, 20]
	mov	w0, w21
	bl	MEM_Phy2Vir
	str	x0, [x19, 24]
	ldr	w2, [x20, 96]
	mov	w3, 32768
	ldr	w1, [x20, 624]
	cmp	w22, w24
	stp	w3, w2, [x19, 36]
	str	w1, [x19, 44]
	blt	.L338
	ldr	x1, [x19, 8]
	cmp	x1, xzr
	ccmp	x0, xzr, 4, ne
	beq	.L338
	mov	w1, 1
	mov	w0, 0
	str	w1, [x19, 48]
.L336:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L338:
	mov	w0, -7
	b	.L336
	.p2align 3
.L339:
	mov	w0, -1
	b	.L336
	.size	SM_OpenSCDDrv, .-SM_OpenSCDDrv
	.align	3
.LC79:
	.xword	.LANCHOR0
	.align	3
.LC80:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC81:
	.xword	g_VfmwGlobalStat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_CloseSCDDrv
	.type	SM_CloseSCDDrv, %function
SM_CloseSCDDrv:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L344
	ldr	x0, .LC82
	mov	w1, 0
	add	x2, x0, 104
	b	.L343
	.p2align 3
.L342:
	cmp	w1, 32
	add	x2, x2, 16
	beq	.L352
.L343:
	cmp	w1, 31
	add	w1, w1, 1
	bhi	.L342
	ldr	x3, [x2]
	add	x4, x3, 458752
	cbz	x3, .L342
	ldr	w3, [x4, 256]
	cbz	w3, .L342
	ldr	w3, [x4, 244]
	cmp	w3, wzr
	bgt	.L342
	str	wzr, [x4, 256]
	cmp	w1, 32
	add	x2, x2, 16
	bne	.L343
	.p2align 2
.L352:
	ldr	x3, .LC84
	mov	x2, 72
	ldr	x4, .LC83
	mov	w1, 0
	ldr	x3, [x3, 96]
	str	wzr, [x4, 60]
	blr	x3
	mov	w0, 0
.L341:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L344:
	mov	w0, -1
	b	.L341
	.size	SM_CloseSCDDrv, .-SM_CloseSCDDrv
	.align	3
.LC82:
	.xword	.LANCHOR0
	.align	3
.LC83:
	.xword	g_VfmwGlobalStat
	.align	3
.LC84:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_Config
	.type	SM_Config, %function
SM_Config:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w22, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	w22, 31, 2, ne
	bhi	.L356
	ldr	x1, .LC85
	add	x0, x1, x22, sxtw 4
	ldr	x24, [x0, 104]
	cbz	x24, .L356
	add	x23, x24, 458752
	ldr	w0, [x19, 48]
	str	w0, [x23, 328]
	ldr	w0, [x19, 16]
	ldr	w2, [x24, 24]
	cmp	w2, w0
	beq	.L376
	cbz	w0, .L356
	ldr	x0, [x19]
	cbz	x0, .L356
	ldr	x2, [x1, 8]
	str	x2, [x23, 192]
	ldp	w5, w4, [x1, 16]
	ldr	x2, [x1, 24]
	ldr	w3, [x1, 32]
	ldr	w1, [x1, 36]
	str	x2, [x23, 208]
	mov	w2, 262143
	str	w1, [x23, 220]
	mov	w1, 4096
	stp	w4, w5, [x23, 200]
	str	w1, [x23, 224]
	str	w3, [x23, 216]
	ldr	w20, [x19, 16]
	ldr	x25, [x19]
	add	w21, w20, 3
	and	w21, w21, -4
	sub	w20, w21, w20
	add	w21, w21, 131072
	str	w21, [x23, 228]
	sxtw	x1, w20
	add	x1, x1, 131072
	add	x25, x25, x1
	str	x25, [x23, 184]
	ldr	w1, [x19, 20]
	sub	w20, w1, w20
	sub	w20, w20, #131072
	sub	w20, w20, #1024
	str	w20, [x23, 232]
	cmp	w20, w2
	ble	.L356
	add	x27, x24, 98304
	adds	x28, x27, 112
	beq	.L377
	cmp	w21, wzr
	ldr	x26, .LC86
	ccmp	x25, xzr, 4, ne
	ccmp	w20, w2, 0, ne
	bhi	.L378
.L359:
	add	x20, x24, 8
	ldr	x3, [x26, 104]
	mov	x2, 80
	mov	x1, x19
	mov	x0, x20
	blr	x3
	str	wzr, [x23, 244]
.L358:
	ldr	x3, [x26, 104]
	mov	x2, 80
	mov	x1, x19
	mov	x0, x20
	blr	x3
	mov	w0, 2
	str	w0, [x23, 316]
	ldr	w0, [x19, 12]
	cmp	w0, 2
	beq	.L379
.L360:
	ldr	x0, .LC87
	ldr	w0, [x0]
	cmp	w0, 1
	beq	.L380
.L361:
	mov	w0, 0
	str	w22, [x23, 240]
.L355:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L380:
	ldr	w1, [x19, 12]
	cmp	w1, 17
	bne	.L361
	str	w0, [x24, 4]
	b	.L361
	.p2align 3
.L379:
	mov	w0, 3
	str	w0, [x23, 316]
	b	.L360
	.p2align 3
.L378:
	mov	x0, x28
	mov	x2, 32824
	add	x28, x28, 360448
	ldr	x3, [x26, 96]
	movk	x2, 0x5, lsl 16
	mov	w1, 0
	blr	x3
	str	w21, [x28, 24]
	str	x25, [x27, 112]
	stp	w20, w21, [x28, 28]
	str	w21, [x28, 36]
	b	.L359
	.p2align 3
.L376:
	add	x20, x24, 8
	ldr	x26, .LC86
	b	.L358
	.p2align 3
.L377:
	ldr	x26, .LC86
	b	.L359
	.p2align 3
.L356:
	mov	w0, -1
	b	.L355
	.size	SM_Config, .-SM_Config
	.align	3
.LC85:
	.xword	.LANCHOR0
	.align	3
.LC86:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC87:
	.xword	g_SegBypassEnable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_CfgBuf
	.type	SM_CfgBuf, %function
SM_CfgBuf:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 31
	bhi	.L389
	cbnz	w20, .L390
	ldr	x1, .LC92
	add	x19, x1, x19, sxtw 4
	ldr	x2, [x19, 104]
	cbz	x2, .L385
	add	x2, x2, 458752
	ldr	w0, [x2, 244]
	cbz	w0, .L383
	ldp	w7, w5, [x1, 16]
	ldr	w4, [x1, 32]
	mov	w0, 0
	ldr	x6, [x1, 8]
	ldr	x3, [x1, 24]
	ldr	w1, [x1, 36]
	stp	w4, w1, [x2, 216]
	str	x6, [x2, 192]
	mov	w1, 4096
	stp	w5, w7, [x2, 200]
	str	x3, [x2, 208]
	str	wzr, [x2, 244]
	str	w1, [x2, 224]
.L383:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L389:
	ldr	x1, .LC89
	mov	w3, w19
	mov	w2, 1379
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L383
	.p2align 3
.L390:
	ldr	x1, .LC91
	mov	w3, w20
	mov	w2, 1386
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L383
.L385:
	mov	w0, -1
	b	.L383
	.size	SM_CfgBuf, .-SM_CfgBuf
	.align	3
.LC89:
	.xword	.LC88
	.align	3
.LC91:
	.xword	.LC90
	.align	3
.LC92:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_Start
	.type	SM_Start, %function
SM_Start:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L393
	ldr	x0, .LC93
	add	x19, x0, x19, sxtw 4
	ldr	x0, [x19, 104]
	cbz	x0, .L395
	add	x1, x0, 458752
	ldr	w0, [x1, 256]
	cbnz	w0, .L395
	mov	w2, 1
	str	w2, [x1, 256]
.L392:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L395:
	mov	w0, -7
	b	.L392
	.p2align 3
.L393:
	mov	w0, -1
	b	.L392
	.size	SM_Start, .-SM_Start
	.align	3
.LC93:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_Stop
	.type	SM_Stop, %function
SM_Stop:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L398
	ldr	x0, .LC94
	add	x19, x0, x19, sxtw 4
	ldr	x0, [x19, 104]
	cbz	x0, .L399
	add	x1, x0, 458752
	ldr	w0, [x1, 256]
	cbz	w0, .L397
	ldr	w0, [x1, 244]
	cmp	w0, wzr
	bgt	.L400
	mov	w0, 0
	str	wzr, [x1, 256]
.L397:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L400:
	mov	w0, -7
	b	.L397
	.p2align 3
.L399:
	mov	w0, 0
	b	.L397
	.p2align 3
.L398:
	mov	w0, -1
	b	.L397
	.size	SM_Stop, .-SM_Stop
	.align	3
.LC94:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_GetInfo
	.type	SM_GetInfo, %function
SM_GetInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 31
	ccmp	x19, xzr, 4, ls
	beq	.L419
	ldr	x3, .LC95
	mov	x2, 24
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x0, .LC96
	add	x20, x0, x20, sxtw 4
	ldr	x0, [x20, 104]
	cbz	x0, .L420
	add	x1, x0, 458752
	add	x2, x0, 98304
	adds	x4, x2, 112
	ldr	w3, [x1, 256]
	strb	w3, [x19]
	ldr	w1, [x1, 308]
	str	w1, [x19, 20]
	beq	.L413
	add	x3, x4, 360448
	ldr	w1, [x3, 12]
	ldr	w3, [x3, 8]
	sub	w1, w1, w3
	and	w1, w1, 4095
.L409:
	adds	x0, x0, 88
	str	w1, [x19, 8]
	cset	w3, eq
	cmn	x19, #4
	cset	w1, eq
	orr	w1, w3, w1
	cbnz	w1, .L419
	add	x5, x0, 98304
	ldr	w1, [x5, 4]
	ldr	w5, [x5]
	subs	w1, w1, w5
	bmi	.L421
	str	w1, [x19, 4]
.L411:
	cmn	x19, #12
	cset	w1, eq
	orr	w1, w3, w1
	cbnz	w1, .L419
	add	x0, x0, 98304
	ldr	w1, [x0, 20]
	str	w1, [x19, 12]
	ldr	w0, [x0, 12]
	sub	w0, w1, w0
	str	w0, [x19, 12]
	asr	w0, w0, 31
	cbnz	w0, .L415
	add	x1, x19, 16
	cmp	x1, xzr
	ccmp	x4, xzr, 4, ne
	beq	.L419
	add	x2, x2, 112
	add	x2, x2, 360448
	ldr	w1, [x2, 40]
	str	w1, [x19, 16]
.L415:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L420:
	cbz	x19, .L419
	strb	wzr, [x19]
.L419:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L421:
	add	w1, w1, 1024
	str	w1, [x19, 4]
	b	.L411
	.p2align 3
.L413:
	mov	w1, 0
	b	.L409
	.size	SM_GetInfo, .-SM_GetInfo
	.align	3
.LC95:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC96:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetRawNumInFrame
	.type	GetRawNumInFrame, %function
GetRawNumInFrame:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	mov	x21, x2
	bl	_mcount
	add	x2, x20, 98304
	mov	w3, 1
	ldr	w0, [x2]
	uxtw	x5, w0
	lsl	x1, x5, 2
	sub	x1, x1, x5
	add	x1, x20, x1, lsl 5
	ldr	w1, [x1, 12]
	str	w1, [x21]
	str	w3, [x19]
	b	.L423
	.p2align 3
.L425:
	ldr	w3, [x19]
	add	w3, w3, 1
	str	w3, [x19]
	ldr	w1, [x21]
	ldr	w3, [x4, 12]
	add	w3, w1, w3
	str	w3, [x21]
	ldr	w1, [x2, 4]
	cmp	w0, w1
	beq	.L427
	ldr	w1, [x19]
	cmp	w1, 1024
	bhi	.L427
.L423:
	lsl	x3, x5, 2
	add	w0, w0, 1
	sub	x3, x3, x5
	and	w0, w0, 1023
	lsl	x3, x3, 5
	uxtw	x5, w0
	lsl	x4, x5, 2
	ldrb	w1, [x20, x3]
	sub	x4, x4, x5
	add	x4, x20, x4, lsl 5
	cbnz	w1, .L425
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L427:
	mov	w0, -4
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	GetRawNumInFrame, .-GetRawNumInFrame
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AdjustRawPacketVP6A
	.type	AdjustRawPacketVP6A, %function
AdjustRawPacketVP6A:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x23, x1
	mov	x22, x0
	mov	x0, x30
	mov	x19, x4
	mov	x21, x2
	mov	x20, x3
	bl	_mcount
	add	x0, x22, 98304
	ldr	w4, [x23]
	ldr	w5, [x0]
	cbz	w4, .L433
	uxtw	x7, w5
	lsl	x0, x7, 2
	sub	x0, x0, x7
	add	x0, x22, x0, lsl 5
	ldr	w6, [x0, 12]
	cmp	w6, 2
	bgt	.L434
	mov	w0, w6
	mov	w3, 3
	mov	w2, 0
	b	.L431
	.p2align 3
.L432:
	uxtw	x7, w5
	lsl	x0, x7, 2
	sub	x0, x0, x7
	add	x0, x22, x0, lsl 5
	ldr	w0, [x0, 12]
	add	w6, w6, w0
	cmp	w6, 2
	bgt	.L436
.L431:
	add	w2, w2, 1
	add	w5, w5, 1
	cmp	w2, w4
	sub	w3, w3, w0
	and	w5, w5, 1023
	bne	.L432
.L433:
	mov	w0, -4
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L436:
	sxtw	x3, w3
.L430:
	lsl	x0, x7, 2
	sub	w2, w4, w2
	sub	x7, x0, x7
	str	w2, [x23]
	sub	w6, w6, #3
	mov	w0, 0
	add	x22, x22, x7, lsl 5
	ldr	x1, [x22, 40]
	add	x3, x1, x3
	str	x3, [x21]
	str	w6, [x20]
	str	w5, [x19]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L434:
	mov	x3, 3
	mov	w2, 0
	b	.L430
	.size	AdjustRawPacketVP6A, .-AdjustRawPacketVP6A
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_LinkRawToSeg
	.type	SM_LinkRawToSeg, %function
SM_LinkRawToSeg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x0, .LC97
	add	x0, x0, x20, sxtw 4
	ldr	x6, [x0, 104]
	cbz	x6, .L446
	add	x5, x6, 88
	add	x0, x6, 98304
	add	x0, x0, 112
	cmp	x5, xzr
	add	x1, x5, 98304
	ccmp	x0, xzr, 4, ne
	ccmp	x19, xzr, 4, ne
	ldr	w3, [x1]
	beq	.L446
	ldr	w1, [x1, 4]
	cmp	w3, w1
	beq	.L452
	uxtw	x3, w3
	lsl	x1, x3, 2
	sub	x1, x1, x3
	lsl	x1, x1, 5
	add	x7, x6, x1
	ldrb	w2, [x7, 88]
	cbnz	w2, .L453
	add	x4, x5, x1
	ldr	x8, [x4, 40]
	cbz	x8, .L454
	ldr	w1, [x6, 20]
	cmp	w1, 12
	beq	.L455
.L441:
	ldr	x1, .LC103
	ldr	x1, [x1, w20, sxtw 3]
	add	x1, x1, 507904
	ldr	w1, [x1, 2064]
	cmp	w1, 1
	beq	.L456
	ldr	w1, [x7, 96]
	str	w1, [x19, 16]
.L444:
	lsl	x1, x3, 2
	mov	w4, 1
	sub	x3, x1, x3
	mov	w2, w20
	mov	x1, x19
	add	x3, x5, x3, lsl 5
	ldr	x5, [x3, 40]
	str	x5, [x19]
	ldr	w5, [x7, 100]
	str	w5, [x19, 20]
	ldr	x5, [x3, 64]
	str	x5, [x19, 32]
	ldr	x5, [x3, 64]
	str	x5, [x19, 40]
	ldr	x5, [x3, 48]
	str	x5, [x19, 48]
	ldr	x5, [x3, 56]
	str	x5, [x19, 56]
	ldr	w5, [x3, 24]
	str	w5, [x19, 64]
	ldr	w5, [x3, 28]
	str	w5, [x19, 68]
	ldr	w5, [x3, 32]
	str	w5, [x19, 72]
	ldr	w3, [x3, 36]
	str	w3, [x19, 76]
	ldrb	w3, [x7, 89]
	strb	w3, [x19, 11]
	strb	w4, [x19, 10]
	bl	InsertStreamSeg
	mov	w0, 0
.L451:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L455:
	ldr	w1, [x7, 100]
	cbz	w1, .L441
	cmp	w1, 2
	bgt	.L457
	mov	x0, x5
	bl	DeleteRawLen
.L452:
	mov	w0, -4
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L456:
	ldr	w1, [x7, 92]
	str	w1, [x19, 16]
	b	.L444
.L457:
	add	x8, x8, 3
	str	x8, [x4, 40]
	sub	w1, w1, #3
	str	w1, [x7, 100]
	b	.L441
	.p2align 3
.L453:
	ldr	w1, [x7, 100]
	mov	x0, x5
	bl	DeleteRawLen
	ldr	x2, .LC98
	mov	w0, 0
	ldr	x1, .LC100
	add	x2, x2, 64
	bl	dprint_vfmw
	mov	w0, -4
	b	.L451
	.p2align 3
.L454:
	ldr	w1, [x7, 100]
	mov	x0, x5
	bl	DeleteRawLen
	ldr	x2, .LC98
	mov	w0, 1
	ldr	x1, .LC102
	add	x2, x2, 64
	bl	dprint_vfmw
	mov	w0, -4
	b	.L451
	.p2align 3
.L446:
	mov	w0, -1
	b	.L451
	.size	SM_LinkRawToSeg, .-SM_LinkRawToSeg
	.align	3
.LC97:
	.xword	.LANCHOR0
	.align	3
.LC98:
	.xword	.LANCHOR3
	.align	3
.LC100:
	.xword	.LC99
	.align	3
.LC102:
	.xword	.LC101
	.align	3
.LC103:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_CopyRawToSeg
	.type	SM_CopyRawToSeg, %function
SM_CopyRawToSeg:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w19, w0
	mov	x0, x30
	mov	x26, x1
	str	w19, [x29, 100]
	bl	_mcount
	ldr	x0, .LC104
	mov	x1, x19
	add	x0, x0, x1, sxtw 4
	ldr	x28, [x0, 104]
	cbz	x28, .L479
	add	x22, x28, 88
	add	x25, x28, 98304
	add	x0, x25, 112
	cmp	x22, xzr
	ccmp	x0, xzr, 4, ne
	str	x0, [x29, 104]
	ccmp	x26, xzr, 4, ne
	beq	.L479
	add	x0, x22, 98304
	ldp	w23, w4, [x0]
	cmp	w4, w23
	beq	.L499
	uxtw	x1, w23
	mov	w0, w23
	lsl	x2, x1, 2
	mov	x3, x1
	sub	x2, x2, x1
	mov	w21, 1
	add	x1, x22, x2, lsl 5
	ldr	w27, [x1, 12]
	b	.L461
	.p2align 3
.L463:
	add	w21, w21, 1
	ldr	w1, [x2, 12]
	cmp	w21, 1024
	ccmp	w4, w0, 4, ls
	add	w27, w27, w1
	beq	.L499
.L461:
	lsl	x2, x3, 2
	add	w0, w0, 1
	sub	x1, x2, x3
	and	w0, w0, 1023
	lsl	x1, x1, 5
	uxtw	x3, w0
	lsl	x2, x3, 2
	ldrb	w1, [x22, x1]
	sub	x2, x2, x3
	add	x2, x22, x2, lsl 5
	cbnz	w1, .L463
	ldr	x0, [x29, 104]
	cbz	x0, .L476
	ldr	x0, .LC105
	mov	x2, 32768
	mov	w1, 0
	movk	x2, 0x5, lsl 16
	ldr	x3, [x0, 96]
	add	x0, x25, 120
	blr	x3
	add	x0, x25, 112
	add	x0, x0, 360448
	ldr	w1, [x0, 24]
	stp	wzr, wzr, [x0, 8]
	str	wzr, [x0, 16]
	stp	w1, w1, [x0, 32]
.L476:
	add	x0, x25, 112
	add	x0, x0, 360448
	ldr	w1, [x0, 28]
	cmp	w1, w27
	blt	.L501
	sxtw	x19, w23
	ldr	w1, [x28, 20]
	lsl	x2, x19, 2
	ldr	x24, [x25, 112]
	sub	x2, x2, x19
	cmp	w1, 12
	add	x1, x22, 98304
	ldr	w0, [x0, 24]
	add	x2, x22, x2, lsl 5
	ldr	w23, [x1]
	ldr	w25, [x2, 12]
	ldr	x28, [x2, 40]
	ccmp	w25, wzr, 4, eq
	beq	.L466
	cbz	w21, .L499
	uxtw	x20, w23
	lsl	x1, x20, 2
	sub	x1, x1, x20
	add	x1, x22, x1, lsl 5
	ldr	w25, [x1, 12]
	cmp	w25, 2
	bgt	.L480
	mov	w6, 3
	mov	w2, 0
	mov	w5, w25
	b	.L469
	.p2align 3
.L470:
	uxtw	x20, w23
	lsl	x1, x20, 2
	sub	x1, x1, x20
	add	x1, x22, x1, lsl 5
	ldr	w5, [x1, 12]
	add	w25, w25, w5
	cmp	w25, 2
	bgt	.L502
.L469:
	add	w2, w2, 1
	add	w23, w23, 1
	cmp	w2, w21
	sub	w6, w6, w5
	and	w23, w23, 1023
	bne	.L470
	.p2align 2
.L499:
	mov	w0, -4
.L496:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
.L502:
	sxtw	x6, w6
.L467:
	lsl	x1, x20, 2
	sub	w21, w21, w2
	sub	x1, x1, x20
	sub	w25, w25, #3
	add	x1, x22, x1, lsl 5
	ldr	x28, [x1, 40]
	add	x28, x28, x6
	.p2align 2
.L466:
	str	w0, [x26, 16]
	bl	MEM_Phy2Vir
	str	x0, [x26]
	lsl	x1, x19, 2
	sub	x2, x24, x0
	sub	x1, x1, x19
	str	w2, [x26, 20]
	mov	w3, 1
	add	x1, x22, x1, lsl 5
	ldr	x2, [x1, 64]
	str	x2, [x26, 32]
	ldr	x2, [x1, 64]
	str	x2, [x26, 40]
	ldr	x2, [x1, 48]
	str	x2, [x26, 48]
	strb	w3, [x26, 10]
	ldr	x2, [x1, 56]
	str	x2, [x26, 56]
	ldr	w2, [x1, 24]
	str	w2, [x26, 64]
	ldr	w2, [x1, 28]
	str	w2, [x26, 68]
	ldr	w2, [x1, 32]
	str	w2, [x26, 72]
	ldr	w1, [x1, 36]
	str	w1, [x26, 76]
	cbz	w21, .L471
	cmp	x28, xzr
	ccmp	x24, xzr, 4, ne
	beq	.L499
	ldr	x0, .LC105
	mov	w19, 0
	uxtw	x20, w23
	str	x0, [x29, 112]
	b	.L473
	.p2align 3
.L474:
	cmp	x28, xzr
	ccmp	x24, xzr, 4, ne
	beq	.L499
.L473:
	sxtw	x2, w25
	mov	w0, 2
	str	x2, [x29, 120]
	add	w23, w23, 1
	bl	VCTRL_RecordPosTime
	and	w23, w23, 1023
	ldp	x0, x2, [x29, 112]
	mov	x1, x28
	add	w19, w19, 1
	ldr	x6, [x0, 104]
	mov	x0, x24
	add	x24, x24, x2
	blr	x6
	mov	w0, 3
	bl	VCTRL_RecordPosTime
	mov	w1, w25
	mov	w0, 0
	bl	VCTRL_RecordData
	lsl	x2, x20, 2
	ldr	w1, [x26, 20]
	sub	x2, x2, x20
	uxtw	x20, w23
	lsl	x0, x20, 2
	add	w25, w1, w25
	add	x2, x22, x2, lsl 5
	sub	x0, x0, x20
	cmp	w21, w19
	add	x0, x22, x0, lsl 5
	ldrb	w1, [x2, 1]
	strb	w1, [x26, 11]
	str	w25, [x26, 20]
	ldr	w25, [x0, 12]
	ldr	x28, [x0, 40]
	bne	.L474
	ldr	x0, [x26]
.L471:
	cbz	x0, .L503
	ldr	w2, [x29, 100]
	mov	x1, x26
	ldr	x0, [x29, 104]
	bl	InsertStreamSeg
	mov	w1, w27
	mov	x0, x22
	bl	DeleteRawLen
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L501:
	ldr	x1, .LC107
	mov	w2, w27
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, w27
	mov	x0, x22
	bl	DeleteRawLen
	cbz	w0, .L499
	ldr	x1, .LC109
	mov	w2, 1683
	mov	w0, 0
	bl	dprint_vfmw
	b	.L499
.L479:
	mov	w0, -1
	b	.L496
.L480:
	mov	x6, 3
	mov	w2, 0
	b	.L467
.L503:
	ldr	x2, .LC110
	mov	w3, 1744
	ldr	x1, .LC112
	mov	w0, 1
	add	x2, x2, 80
	bl	dprint_vfmw
	mov	w0, -4
	b	.L496
	.size	SM_CopyRawToSeg, .-SM_CopyRawToSeg
	.align	3
.LC104:
	.xword	.LANCHOR0
	.align	3
.LC105:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC107:
	.xword	.LC106
	.align	3
.LC109:
	.xword	.LC108
	.align	3
.LC110:
	.xword	.LANCHOR3
	.align	3
.LC112:
	.xword	.LC111
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_IsSCDByPass
	.type	SCDDRV_IsSCDByPass, %function
SCDDRV_IsSCDByPass:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	tst	w19, -17
	beq	.L508
	sub	w0, w19, #2
	cmp	w0, 1
	bls	.L508
	cmp	w19, 6
	mov	w0, 0
	ccmp	w19, 18, 4, ne
	cset	w1, eq
	cbnz	w1, .L505
	cmp	w19, 1
	beq	.L511
.L506:
	cmp	w19, 15
	cset	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L508:
	mov	w0, 0
.L505:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L511:
	ldr	w1, [x20]
	cbz	w1, .L506
	b	.L505
	.size	SCDDRV_IsSCDByPass, .-SCDDRV_IsSCDByPass
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_SaveStreamSeg
	.type	SCDDRV_SaveStreamSeg, %function
SCDDRV_SaveStreamSeg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, .LC113
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L512
	ldrsb	w0, [x20, 9]
	cmp	w0, 2
	beq	.L512
	mov	x1, x20
	mov	w0, w19
	bl	SCDDRV_SaveStreamSeg.part.6
.L512:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_SaveStreamSeg, .-SCDDRV_SaveStreamSeg
	.align	3
.LC113:
	.xword	vfmw_save_seg_file
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_ReadSegStream
	.type	SM_ReadSegStream, %function
SM_ReadSegStream:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	cmp	x22, xzr
	ccmp	w20, 31, 2, ne
	bhi	.L527
	ldr	x0, .LC114
	add	x0, x0, x20, sxtw 4
	ldr	x19, [x0, 104]
	cbz	x19, .L527
	ldr	w0, [x19, 20]
	add	x1, x19, 36
	bl	SCDDRV_IsSCDByPass
	uxtb	w0, w0
	cbz	w0, .L522
	ldr	w0, [x19, 4]
	mov	x1, x22
	cmp	w0, 1
	mov	w0, w20
	beq	.L537
	bl	SM_CopyRawToSeg
	cbnz	w0, .L538
.L522:
	add	x0, x19, 98304
	mov	x1, x22
	add	x0, x0, 112
	add	x19, x19, 458752
	bl	SCDDRV_GetStreamSeg
	cbnz	w0, .L525
	ldr	x0, .LC115
	str	wzr, [x19, 308]
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L528
	ldrsb	w0, [x22, 9]
	mov	w21, 0
	cmp	w0, 2
	beq	.L521
	mov	x1, x22
	mov	w0, w20
	bl	SCDDRV_SaveStreamSeg.part.6
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L525:
	mov	w21, w0
	ldr	w0, [x19, 308]
	add	w0, w0, 1
	str	w0, [x19, 308]
.L521:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L537:
	bl	SM_LinkRawToSeg
	cbz	w0, .L522
.L538:
	add	x19, x19, 458752
	mov	w21, -7
	ldr	w0, [x19, 308]
	add	w0, w0, 1
	str	w0, [x19, 308]
	b	.L521
	.p2align 3
.L528:
	mov	w21, 0
	b	.L521
	.p2align 3
.L527:
	mov	w21, -1
	b	.L521
	.size	SM_ReadSegStream, .-SM_ReadSegStream
	.align	3
.LC114:
	.xword	.LANCHOR0
	.align	3
.LC115:
	.xword	vfmw_save_seg_file
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_ReleaseStreamSeg
	.type	SM_ReleaseStreamSeg, %function
SM_ReleaseStreamSeg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 31
	bhi	.L542
	ldr	x0, .LC116
	add	x19, x0, x19, sxtw 4
	ldr	x19, [x19, 104]
	cbz	x19, .L542
	add	x0, x19, 98304
	mov	w1, w20
	add	x0, x0, 112
	bl	ReleaseStreamSeg
	cbnz	w0, .L543
	ldr	w0, [x19, 4]
	mov	w20, 0
	cbz	w0, .L540
	mov	w1, 1
	add	x0, x19, 88
	bl	DeleteRawPacket
.L540:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L542:
	mov	w20, -1
	b	.L540
	.p2align 3
.L543:
	mov	w20, -3
	b	.L540
	.size	SM_ReleaseStreamSeg, .-SM_ReleaseStreamSeg
	.align	3
.LC116:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_GiveThreadEvent
	.type	SM_GiveThreadEvent, %function
SM_GiveThreadEvent:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC117
	mov	w0, 0
	ldr	x1, [x1, 256]
	blr	x1
	ldp	x29, x30, [sp], 16
	ret
	.size	SM_GiveThreadEvent, .-SM_GiveThreadEvent
	.align	3
.LC117:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CalcInstBlockTime
	.type	CalcInstBlockTime, %function
CalcInstBlockTime:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	x0, .LC118
	ldr	x0, [x0]
	blr	x0
	mov	w3, w0
	add	x1, x19, 458752
	cbnz	w20, .L551
	ldr	w2, [x1, 272]
	cmp	w0, w2
	bhi	.L552
	str	wzr, [x1, 268]
	mov	w0, 0
	str	w3, [x1, 272]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L552:
	sub	w0, w0, w2
	str	w0, [x1, 268]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L551:
	str	wzr, [x1, 268]
	mov	w0, 0
	str	w3, [x1, 272]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CalcInstBlockTime, .-CalcInstBlockTime
	.align	3
.LC118:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_IsChanDec
	.type	SCDDRV_IsChanDec, %function
SCDDRV_IsChanDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC119
	ldr	w1, [x0, 56]
	cmp	w1, 1
	beq	.L556
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L556:
	ldr	w0, [x0, 52]
	cmp	w0, w19
	ldr	x19, [sp, 16]
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_IsChanDec, .-SCDDRV_IsChanDec
	.align	3
.LC119:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_GetRawStreamStatus
	.type	SCDDRV_GetRawStreamStatus, %function
SCDDRV_GetRawStreamStatus:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	x21, x2
	bl	_mcount
	cmp	x19, xzr
	cset	w1, eq
	cmp	x20, xzr
	cset	w3, eq
	orr	w3, w1, w3
	cbnz	w3, .L558
	add	x0, x19, 98304
	ldr	w3, [x0, 20]
	str	w3, [x20]
	ldr	w0, [x0, 12]
	sub	w3, w3, w0
	str	w3, [x20]
.L558:
	cmp	x21, xzr
	cset	w0, eq
	orr	w0, w1, w0
	cbnz	w0, .L557
	add	x19, x19, 98304
	ldp	w1, w0, [x19]
	subs	w0, w0, w1
	bmi	.L564
.L563:
	str	w0, [x21]
.L557:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L564:
	add	w0, w0, 1024
	b	.L563
	.size	SCDDRV_GetRawStreamStatus, .-SCDDRV_GetRawStreamStatus
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetFreeSegBufSize
	.type	GetFreeSegBufSize, %function
GetFreeSegBufSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L565
	mov	x1, x20
	mov	x0, x19
	bl	GetFreeSegBufSize.part.7
.L565:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetFreeSegBufSize, .-GetFreeSegBufSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_GetSegStreamStatus
	.type	SCDDRV_GetSegStreamStatus, %function
SCDDRV_GetSegStreamStatus:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x23, x4
	mov	x20, x2
	mov	w19, w1
	mov	x22, x3
	bl	_mcount
	cmp	x21, xzr
	str	wzr, [x23]
	ccmp	x20, xzr, 4, ne
	bne	.L574
.L568:
	ldr	w1, [x20]
	add	w0, w19, 79
	mov	w3, 0
	cmp	w1, w0
	bcc	.L569
	sub	w1, w1, w19
	sub	w3, w1, #79
.L569:
	add	x2, x21, 360448
	str	w3, [x20]
	ldr	w1, [x2, 28]
	lsl	w0, w1, 3
	sub	w0, w0, w1
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w0, w1, w0, lt
	cmp	w19, w0, asr 3
	bcc	.L570
	add	w19, w3, w19
	str	w19, [x20]
	mov	w0, 1
	str	w0, [x23]
.L570:
	cbz	x21, .L573
	ldp	w0, w1, [x2, 8]
	mov	w2, 4096
	sub	w0, w1, w0
	and	w0, w0, 4095
	sub	w0, w2, w0
	str	w0, [x22]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L574:
	mov	x1, x20
	mov	x0, x21
	bl	GetFreeSegBufSize.part.7
	b	.L568
	.p2align 3
.L573:
	mov	w0, 4096
	str	w0, [x22]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	SCDDRV_GetSegStreamStatus, .-SCDDRV_GetSegStreamStatus
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_IsRawStreamNotEnough
	.type	SCDDRV_IsRawStreamNotEnough, %function
SCDDRV_IsRawStreamNotEnough:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, wzr
	ccmp	w19, 3, 0, ne
	cset	w0, ls
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_IsRawStreamNotEnough, .-SCDDRV_IsRawStreamNotEnough
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_IsFreeSegSlotNotEnough
	.type	SCDDRV_IsFreeSegSlotNotEnough, %function
SCDDRV_IsFreeSegSlotNotEnough:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 1024
	ldr	x19, [sp, 16]
	cset	w0, ls
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_IsFreeSegSlotNotEnough, .-SCDDRV_IsFreeSegSlotNotEnough
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_IsFreeSegBufNotEnough
	.type	SCDDRV_IsFreeSegBufNotEnough, %function
SCDDRV_IsFreeSegBufNotEnough:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, w20, lsr 3
	cset	w0, ls
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_IsFreeSegBufNotEnough, .-SCDDRV_IsFreeSegBufNotEnough
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_CheckConditionOfStartSCD
	.type	SCDDRV_CheckConditionOfStartSCD, %function
SCDDRV_CheckConditionOfStartSCD:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x3
	mov	x20, x1
	mov	w24, w2
	mov	x22, x4
	mov	x23, x5
	mov	x25, x6
	bl	_mcount
	cmp	x21, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L579
	add	x1, x19, 98304
	ldr	w0, [x1, 20]
	str	w0, [x21]
	ldr	w1, [x1, 12]
	sub	w0, w0, w1
	str	w0, [x21]
.L579:
	cbz	x19, .L583
	add	x19, x19, 98304
	ldr	w3, [x21]
	mov	w0, -5
	ldp	w1, w2, [x19]
	sub	w2, w2, w1
	cmp	w2, wzr
	add	w1, w2, 1024
	csel	w2, w1, w2, lt
	cmp	w3, 3
	ccmp	w2, wzr, 4, hi
	cset	w1, eq
	cbnz	w1, .L580
	mov	x0, x20
	mov	x4, x25
	mov	x3, x23
	mov	x2, x22
	mov	w1, w24
	bl	SCDDRV_GetSegStreamStatus
	ldr	w0, [x23]
	cmp	w0, 1024
	bls	.L585
	add	x20, x20, 360448
	ldr	w1, [x22]
	mov	w0, -6
	ldr	w2, [x20, 28]
	cmp	w1, w2, lsr 3
	csel	w0, w0, wzr, ls
.L580:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L583:
	mov	w0, -5
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L585:
	mov	w0, -6
	b	.L580
	.size	SCDDRV_CheckConditionOfStartSCD, .-SCDDRV_CheckConditionOfStartSCD
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_SetCtrlReg
	.type	SCDDRV_SetCtrlReg, %function
SCDDRV_SetCtrlReg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	w1, [x20, 20]
	cmp	w1, 18
	beq	.L593
	cmp	w1, 6
	cset	w5, eq
	cmp	w1, 1
	cset	w4, eq
	cmp	w1, 15
	cset	w0, eq
	mov	w6, w5
	orr	w4, w4, w0
.L588:
	add	x0, x20, 458752
	mov	w2, 1
	strb	w2, [x19, 2]
	mov	x2, 112
	movk	x2, 0x7, lsl 16
	ldr	w3, [x0, 204]
	add	x2, x20, x2
	str	w3, [x19, 4]
	ldr	x3, [x0, 192]
	str	x3, [x19, 8]
	ldr	w3, [x0, 216]
	str	w3, [x19, 24]
	ldr	w7, [x0, 224]
	ldr	w3, [x0, 316]
	mul	w3, w3, w7
	str	w3, [x19, 28]
	ldr	w3, [x2, 24]
	str	w3, [x19, 32]
	ldp	w7, w3, [x2, 24]
	add	w3, w7, w3
	str	w3, [x19, 36]
	ldr	w3, [x0, 488]
	cmp	w3, 1
	beq	.L598
	ldr	w2, [x0, 484]
	str	w2, [x19, 40]
.L590:
	mov	w2, 1
	strb	w2, [x19]
	ldr	w3, [x20, 48]
	str	w3, [x19, 52]
	str	w6, [x19, 68]
	cbnz	w4, .L594
	sub	w3, w1, #2
	cmp	w3, 1
	cset	w3, ls
	orr	w5, w5, w3
	cbnz	w5, .L599
	strb	wzr, [x19, 1]
.L600:
	mov	w2, 1
	stp	w1, w2, [x19, 44]
	stp	w2, w2, [x19, 56]
	ldr	w0, [x0, 464]
	str	w0, [x19, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L599:
	strb	w2, [x19, 1]
	mov	w2, 1
	stp	w1, w2, [x19, 44]
	stp	w2, w2, [x19, 56]
	ldr	w0, [x0, 464]
	str	w0, [x19, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L594:
	mov	w1, 0
	strb	wzr, [x19, 1]
	b	.L600
	.p2align 3
.L598:
	ldr	w2, [x2, 36]
	add	w2, w2, 3
	and	w2, w2, -4
	str	w2, [x19, 40]
	b	.L590
	.p2align 3
.L593:
	mov	w5, 1
	mov	w4, 0
	mov	w6, w5
	mov	w1, 6
	b	.L588
	.size	SCDDRV_SetCtrlReg, .-SCDDRV_SetCtrlReg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_RecordStartState
	.type	SCDDRV_RecordStartState, %function
SCDDRV_RecordStartState:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 458752
	mov	w22, w1
	mov	w21, w2
	bl	_mcount
	cmp	w22, w21
	str	w22, [x19, 288]
	str	w21, [x19, 292]
	bls	.L604
	strb	wzr, [x20, 2]
.L603:
	mov	w1, 1
	ldr	x0, .LC120
	str	w1, [x19, 248]
	strb	wzr, [x20, 3]
	ldr	x0, [x0]
	blr	x0
	str	w0, [x19, 312]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L604:
	mov	w0, 1
	strb	w0, [x20, 2]
	b	.L603
	.size	SCDDRV_RecordStartState, .-SCDDRV_RecordStartState
	.align	3
.LC120:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCD_ConfigReg
	.type	SCD_ConfigReg, %function
SCD_ConfigReg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	w21, w1
	sxtw	x19, w2
	mov	x22, x3
	bl	_mcount
	ldr	x0, .LC121
	ldrb	w0, [x0]
	cmp	w0, 1
	bne	.L612
	cmp	w20, 4
	ldr	x22, .LC122
	beq	.L613
.L608:
	add	x19, x22, x19, lsl 2
	mov	w1, w21
	ldr	w0, [x19, 96]
	add	w0, w20, w0
	bl	MEM_WritePhyWord
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L612:
	mov	w3, w21
	mov	w2, w20
	mov	x0, x22
	mov	w1, 1
	bl	VDH_Record_RegData
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L613:
	add	x0, x22, x19, lsl 2
	ldr	w0, [x0, 96]
	add	w0, w0, 4
	cbnz	w21, .L609
	bl	MEM_ReadPhyWord
	uxth	w21, w0
	b	.L608
	.p2align 3
.L609:
	bl	MEM_ReadPhyWord
	orr	w21, w0, 65536
	b	.L608
	.size	SCD_ConfigReg, .-SCD_ConfigReg
	.align	3
.LC121:
	.xword	g_HalDisable
	.align	3
.LC122:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	WriteScdVtrlReg
	.type	WriteScdVtrlReg, %function
WriteScdVtrlReg:
	stp	x29, x30, [sp, -272]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	w24, w0
	mov	x0, x30
	mov	x19, x1
	mov	w21, w2
	bl	_mcount
	ldr	x20, .LC123
	ldrb	w0, [x20]
	cmp	w0, 1
	beq	.L615
	ldr	x3, .LC124
	add	x0, x29, 80
	mov	x2, 188
	mov	w1, 0
	mov	x23, x0
	ldr	x3, [x3, 96]
	blr	x3
.L616:
	ldrb	w0, [x20]
	ldr	w1, [x19, 4]
	cmp	w0, 1
	bne	.L653
	ldr	x22, .LC125
	add	x0, x22, x21, sxtw 2
	ldr	w0, [x0, 96]
	add	w0, w0, 2052
	bl	MEM_WritePhyWord
.L618:
	ldrb	w0, [x20]
	ldr	w1, [x19, 24]
	cmp	w0, 1
	bne	.L654
	add	x0, x22, x21, sxtw 2
	ldr	w0, [x0, 96]
	add	w0, w0, 2056
	bl	MEM_WritePhyWord
.L620:
	ldrb	w0, [x20]
	ldr	w1, [x19, 28]
	cmp	w0, 1
	bne	.L655
	add	x0, x22, x21, sxtw 2
	ldr	w0, [x0, 96]
	add	w0, w0, 2060
	bl	MEM_WritePhyWord
.L622:
	ldrb	w0, [x20]
	ldr	w1, [x19, 32]
	cmp	w0, 1
	bne	.L656
	add	x0, x22, x21, sxtw 2
	ldr	w0, [x0, 96]
	add	w0, w0, 2064
	bl	MEM_WritePhyWord
.L624:
	ldrb	w0, [x20]
	ldr	w1, [x19, 36]
	cmp	w0, 1
	bne	.L657
	add	x0, x22, x21, sxtw 2
	ldr	w0, [x0, 96]
	add	w0, w0, 2068
	bl	MEM_WritePhyWord
.L626:
	ldrb	w0, [x20]
	ldr	w1, [x19, 40]
	cmp	w0, 1
	bne	.L658
	add	x0, x22, x21, sxtw 2
	sxtw	x25, w24
	ldr	w0, [x0, 96]
	add	w0, w0, 2072
	bl	MEM_WritePhyWord
	add	x0, x22, x25, lsl 4
	ldr	x0, [x0, 104]
	add	x0, x0, 458752
	ldr	w1, [x0, 488]
	cmp	w1, 1
	beq	.L659
.L629:
	mov	w2, 3
	ldr	w1, [x0, 472]
	movk	w2, 0x300, lsl 16
	cmp	w1, w2
	beq	.L660
.L634:
	ldrb	w0, [x20]
	cmp	w0, 1
	bne	.L661
	add	x0, x22, x21, sxtw 2
	add	x25, x22, x25, lsl 4
	ldr	w0, [x0, 96]
	add	w0, w0, 2108
	bl	MEM_WritePhyWord
	ldrb	w0, [x20]
	cmp	w0, 1
	ldr	x0, [x25, 104]
	add	x0, x0, 458752
	ldrh	w1, [x0, 468]
	bne	.L662
.L640:
	add	x0, x22, x21, sxtw 2
	ldr	w0, [x0, 96]
	add	w0, w0, 2116
	bl	MEM_WritePhyWord
.L633:
	ldp	w0, w4, [x19, 52]
	ldr	w2, [x19, 44]
	ldr	w5, [x19, 60]
	lsl	w0, w0, 8
	and	w2, w2, 15
	ldrb	w1, [x19, 1]
	orr	w2, w2, w4, lsl 13
	ldrb	w4, [x20]
	orr	w3, w0, w5, lsl 9
	ubfiz	w1, w1, 4, 1
	cmp	w4, 1
	orr	w0, w3, w2
	orr	w1, w0, w1
	bne	.L663
	add	x0, x22, x21, sxtw 2
	ldr	w0, [x0, 96]
	add	w0, w0, 2080
	bl	MEM_WritePhyWord
	ldr	w0, [x19, 52]
	cbnz	w0, .L664
.L643:
	ldrb	w0, [x20]
	cmp	w0, 1
	bne	.L665
	add	x0, x22, x21, sxtw 2
	mov	w1, 0
	ldr	w0, [x0, 96]
	add	w0, w0, 2076
	bl	MEM_WritePhyWord
	ldrb	w25, [x20]
	cmp	w25, 1
	beq	.L647
.L668:
	ldr	w1, [x19, 52]
	add	x0, x29, 80
	strb	w21, [x29, 80]
	strb	w1, [x29, 81]
	stp	wzr, w24, [x29, 84]
	bl	VDH_PostTask
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 272
	ret
	.p2align 3
.L660:
	ldrh	w0, [x0, 468]
	cbnz	w0, .L634
	ldrb	w0, [x20]
	cmp	w0, 1
	bne	.L666
	add	x0, x22, x21, sxtw 2
	mov	w1, 3
	ldr	w0, [x0, 96]
	add	w0, w0, 2108
	bl	MEM_WritePhyWord
.L636:
	ldrb	w0, [x20]
	cmp	w0, 1
	bne	.L667
	add	x0, x22, x21, sxtw 2
	mov	w1, 0
	ldr	w0, [x0, 96]
	add	w0, w0, 2116
	bl	MEM_WritePhyWord
	b	.L633
	.p2align 3
.L661:
	mov	w3, w1
	mov	x0, x23
	mov	w1, 1
	mov	w2, 2108
	add	x25, x22, x25, lsl 4
	bl	VDH_Record_RegData
	ldrb	w0, [x20]
	cmp	w0, 1
	ldr	x0, [x25, 104]
	add	x0, x0, 458752
	ldrh	w1, [x0, 468]
	beq	.L640
.L662:
	mov	w3, w1
	mov	w2, 2116
	mov	w1, 1
	mov	x0, x23
	bl	VDH_Record_RegData
	b	.L633
	.p2align 3
.L665:
	mov	w3, 0
	mov	w2, 2076
	mov	w1, 1
	mov	x0, x23
	bl	VDH_Record_RegData
	ldrb	w25, [x20]
	cmp	w25, 1
	bne	.L668
.L647:
	add	x21, x22, x21, sxtw 2
	mov	w1, 0
	ldr	w0, [x21, 96]
	add	w0, w0, 2048
	bl	MEM_WritePhyWord
	ldrb	w0, [x20]
	ldrb	w1, [x19, 2]
	cmp	w0, 1
	and	w1, w1, 1
	bne	.L669
	ldr	w0, [x21, 96]
	add	w0, w0, 2048
	bl	MEM_WritePhyWord
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 272
	ret
	.p2align 3
.L663:
	mov	w3, w1
	mov	x0, x23
	mov	w2, 2080
	mov	w1, 1
	bl	VDH_Record_RegData
	ldr	w0, [x19, 52]
	cbz	w0, .L643
.L664:
	ldrb	w0, [x20]
	ldr	w1, [x19, 68]
	cmp	w0, 1
	bne	.L670
	add	x0, x22, x21, sxtw 2
	ldr	w0, [x0, 96]
	bl	MEM_WritePhyWord
	b	.L643
	.p2align 3
.L658:
	mov	w3, w1
	mov	x0, x23
	mov	w1, 1
	mov	w2, 2072
	sxtw	x25, w24
	bl	VDH_Record_RegData
	add	x0, x22, x25, lsl 4
	ldr	x0, [x0, 104]
	add	x0, x0, 458752
	ldr	w1, [x0, 488]
	cmp	w1, 1
	bne	.L629
.L659:
	ldrb	w0, [x20]
	cmp	w0, 1
	bne	.L671
	add	x0, x22, x21, sxtw 2
	mov	w1, -1
	ldr	w0, [x0, 96]
	add	w0, w0, 2108
	bl	MEM_WritePhyWord
.L631:
	ldrb	w0, [x20]
	cmp	w0, 1
	bne	.L672
	add	x0, x22, x21, sxtw 2
	mov	w1, -1
	ldr	w0, [x0, 96]
	add	w0, w0, 2116
	bl	MEM_WritePhyWord
	b	.L633
	.p2align 3
.L657:
	mov	w3, w1
	mov	w2, 2068
	mov	w1, 1
	mov	x0, x23
	bl	VDH_Record_RegData
	b	.L626
	.p2align 3
.L656:
	mov	w3, w1
	mov	w2, 2064
	mov	w1, 1
	mov	x0, x23
	bl	VDH_Record_RegData
	b	.L624
	.p2align 3
.L655:
	mov	w3, w1
	mov	w2, 2060
	mov	w1, 1
	mov	x0, x23
	bl	VDH_Record_RegData
	b	.L622
	.p2align 3
.L654:
	mov	w3, w1
	mov	w2, 2056
	mov	w1, 1
	mov	x0, x23
	bl	VDH_Record_RegData
	b	.L620
	.p2align 3
.L653:
	mov	w3, w1
	mov	w2, 2052
	mov	w1, 1
	mov	x0, x23
	bl	VDH_Record_RegData
	ldr	x22, .LC125
	b	.L618
	.p2align 3
.L615:
	mov	w0, w21
	mov	x23, 0
	bl	ResetSCD
	b	.L616
	.p2align 3
.L670:
	mov	w3, w1
	mov	w2, 0
	mov	w1, 1
	mov	x0, x23
	bl	VDH_Record_RegData
	b	.L643
	.p2align 3
.L669:
	mov	w3, w1
	mov	x0, x23
	mov	w1, w25
	mov	w2, 2048
	bl	VDH_Record_RegData
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 272
	ret
	.p2align 3
.L671:
	mov	w3, -1
	mov	w2, 2108
	mov	x0, x23
	bl	VDH_Record_RegData
	b	.L631
	.p2align 3
.L672:
	mov	w3, -1
	mov	w2, 2116
	mov	w1, 1
	mov	x0, x23
	bl	VDH_Record_RegData
	b	.L633
	.p2align 3
.L666:
	mov	w3, 3
	mov	w2, 2108
	mov	w1, 1
	mov	x0, x23
	bl	VDH_Record_RegData
	b	.L636
	.p2align 3
.L667:
	mov	w3, 0
	mov	w2, 2116
	mov	w1, 1
	mov	x0, x23
	bl	VDH_Record_RegData
	b	.L633
	.size	WriteScdVtrlReg, .-WriteScdVtrlReg
	.align	3
.LC123:
	.xword	g_HalDisable
	.align	3
.LC124:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC125:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	WriteScdMsg
	.type	WriteScdMsg, %function
WriteScdMsg:
	stp	x29, x30, [sp, -240]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w7, w0
	mov	x27, x1
	mov	x0, x30
	mov	x26, x4
	sxtw	x1, w7
	mov	x22, x3
	mov	x19, x1
	mov	w23, w2
	stp	w5, w2, [x29, 128]
	str	w6, [x29, 116]
	str	x1, [x29, 104]
	bl	_mcount
	ldr	x0, .LC128
	mov	x2, 16384
	ldr	x11, .LC129
	mov	w1, 0
	add	x0, x0, x19, lsl 4
	str	x11, [x29, 136]
	stp	xzr, xzr, [x29, 144]
	ldr	x3, [x11, 96]
	ldr	x24, [x0, 104]
	stp	xzr, xzr, [x29, 160]
	add	x0, x24, 458752
	add	x20, x0, 600
	mov	x21, x0
	stp	xzr, xzr, [x29, 176]
	stp	xzr, xzr, [x29, 192]
	stp	xzr, xzr, [x29, 208]
	stp	xzr, xzr, [x29, 224]
	add	x19, x0, 480
	mov	x0, x20
	str	x21, [x29, 96]
	add	x28, x21, 476
	blr	x3
	str	x22, [x29, 120]
	add	x1, x29, 144
	mov	x0, x22
	bl	GetFirstRawPacket
	str	wzr, [x26, 8]
	ldr	w3, [x29, 156]
	stp	wzr, wzr, [x26]
	cmp	w3, w23
	str	wzr, [x27, 4]
	bgt	.L674
	ldr	x0, [x29, 120]
	mov	w22, w3
	ldr	x11, [x29, 136]
	mov	w25, 0
	mov	w23, 0
	mov	w24, 0
	mov	w2, w3
	add	x21, x0, 98304
	.p2align 2
.L677:
	cmp	w2, wzr
	ubfiz	x1, x25, 4, 32
	add	x12, x26, x23, sxtw 2
	add	x13, x20, x1
	add	w24, w24, 1
	ble	.L675
	ldr	w0, [x29, 148]
	add	w25, w25, 1
	str	w0, [x26, w23, sxtw 2]
	add	w23, w23, 3
	sub	w0, w0, #1
	ldr	x14, [x29, 184]
	add	w0, w0, w2
	ldr	w2, [x29, 128]
	add	w2, w2, w23, lsl 2
	stp	w0, w2, [x12, 4]
	str	x14, [x20, x1]
	ldr	x0, [x29, 184]
	ldrsw	x1, [x29, 156]
	sub	x0, x0, #1
	add	x0, x0, x1
	str	x0, [x13, 8]
	str	wzr, [x29, 156]
.L675:
	str	w22, [x27, 4]
	ldr	w12, [x21, 16]
	cmp	w12, 1023
	bls	.L729
.L676:
	ldr	w0, [x29, 116]
	cbz	w0, .L730
.L678:
	cbz	w24, .L695
	cmp	w23, wzr
	ble	.L681
	add	x4, x26, x23, sxtw 2
	str	wzr, [x4, -4]
.L681:
	ldr	x0, [x29, 104]
	mov	w2, 6
	ldr	x1, .LC128
	ldr	w4, [x27, 4]
	add	x26, x1, x0, lsl 4
	cmp	w4, w2
	csel	w4, w4, w2, le
	ldr	x0, [x26, 104]
	cmp	w4, 5
	add	x0, x0, 458752
	ldr	w1, [x0, 480]
	str	w1, [x0, 472]
	ldrh	w1, [x0, 476]
	strh	w1, [x0, 468]
	bls	.L731
.L698:
	mov	w10, 2
	mov	w9, 4
.L682:
	cmp	w25, wzr
	mov	w8, w25
	mov	x11, -16
	ble	.L691
	.p2align 2
.L713:
	add	x0, x11, x8, sxtw 4
	add	x1, x20, x0
	ldr	x3, [x20, x0]
	ldr	x2, [x1, 8]
	add	w0, w2, 1
	sub	w3, w0, w3
	cmp	w3, w9
	csel	w4, w3, w9, ls
	cbz	w9, .L687
	cbz	w4, .L690
	mov	x0, 0
	.p2align 2
.L689:
	neg	x1, x0
	ldrb	w1, [x1, x2]
	strb	w1, [x19, x0]
	add	x0, x0, 1
	cmp	w4, w0
	bhi	.L689
	sub	w0, w4, #1
	subs	w9, w9, w4
	add	x0, x0, 1
	add	x19, x19, x0
	beq	.L687
.L690:
	subs	w8, w8, #1
	bne	.L713
	.p2align 2
.L691:
	mov	w0, 1
	str	w24, [x27]
	str	w0, [x27, 8]
	mov	w0, 0
.L726:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 240
	ret
	.p2align 3
.L687:
	cbz	w10, .L691
	sub	w1, w3, w4
	sub	x2, x2, x4, uxtw
	cmp	w1, w10
	csel	w1, w1, w10, ls
	cbz	w1, .L727
	mov	x0, 0
	.p2align 2
.L693:
	neg	x3, x0
	ldrb	w3, [x3, x2]
	strb	w3, [x28, x0]
	add	x0, x0, 1
	cmp	w1, w0
	bhi	.L693
	sub	w0, w1, #1
	subs	w10, w10, w1
	add	x0, x0, 1
	add	x28, x28, x0
	beq	.L691
.L727:
	mov	w9, 0
	b	.L690
	.p2align 3
.L729:
	sxtw	x13, w12
	ldr	x3, [x29, 120]
	lsl	x1, x13, 2
	mov	x2, 96
	sub	x1, x1, x13
	ldr	w13, [x21, 4]
	add	x0, x29, 144
	cmp	w12, w13
	add	x1, x3, x1, lsl 5
	beq	.L676
	ldr	x12, [x11, 104]
	str	x11, [x29, 136]
	blr	x12
	ldr	w0, [x21, 16]
	ldr	w2, [x29, 156]
	add	w0, w0, 1
	ldr	w3, [x29, 132]
	asr	w1, w0, 31
	add	w22, w22, w2
	lsr	w1, w1, 22
	cmp	w3, w22
	add	w0, w0, w1
	mov	w3, 1023
	and	w0, w0, w3
	ccmp	w24, w3, 0, ge
	sub	w0, w0, w1
	str	w0, [x21, 16]
	ldr	x11, [x29, 136]
	ble	.L677
	ldr	w0, [x29, 116]
	cbnz	w0, .L678
.L730:
	ldr	w0, [x29, 156]
	cbz	w0, .L678
.L696:
	ldr	w3, [x29, 132]
	ldr	w1, [x27, 4]
	sub	w2, w3, #16
	cmp	w1, w2
	bge	.L678
	cmp	w3, w22
	mov	w2, 1023
	ccmp	w24, w2, 0, lt
	bgt	.L678
	sub	w1, w3, w1
	cmp	w0, w1
	blt	.L678
	ldr	w0, [x29, 148]
	add	w24, w24, 1
	str	w0, [x26, w23, sxtw 2]
	sub	w0, w0, #1
	str	w1, [x29, 156]
	add	w1, w0, w1
	add	x0, x26, x23, sxtw 2
	add	w23, w23, 3
	str	w1, [x0, 4]
	ldr	w1, [x29, 128]
	add	w1, w1, w23, lsl 2
	str	w1, [x0, 8]
	ubfiz	x0, x25, 4, 32
	ldr	x1, [x29, 184]
	add	w25, w25, 1
	str	x1, [x20, x0]
	add	x0, x20, x0
	ldr	x1, [x29, 184]
	sub	x2, x1, #1
	ldrsw	x1, [x29, 156]
	add	x1, x2, x1
	str	x1, [x0, 8]
	ldr	w1, [x27, 4]
	ldr	w0, [x29, 156]
	str	wzr, [x29, 156]
	add	w0, w1, w0
	str	w0, [x27, 4]
	b	.L678
	.p2align 3
.L731:
	cmp	w4, 1
	beq	.L732
	mov	x0, 3
	sub	w9, w4, #2
	sub	x9, x0, x9
	subs	w2, w2, w4
	ldr	x0, [x29, 96]
	add	x12, x0, 477
	beq	.L698
	mov	w0, 0
	mov	w11, 2
	.p2align 2
.L684:
	uxtw	x1, w0
	sub	w2, w2, #1
	sub	x3, x9, x1
	sub	x1, x12, x1
	add	w0, w0, 1
	cmp	w2, wzr
	ccmp	w0, 1, 2, ne
	sub	w10, w11, w0
	ldrb	w3, [x19, x3]
	strb	w3, [x1]
	bls	.L684
	mov	w9, 4
	cbnz	w10, .L682
	ldr	x0, [x29, 96]
	add	x5, x0, 483
	mov	x0, 3
	sub	x4, x0, x4, uxtw
	cbz	w2, .L682
	mov	w1, 0
	.p2align 2
.L685:
	uxtw	x0, w1
	add	w1, w1, 1
	sub	x3, x4, x0
	sub	x0, x5, x0
	cmp	w2, w1
	ldrb	w3, [x19, x3]
	strb	w3, [x0]
	bne	.L685
	mov	w9, 4
	sub	w9, w9, w2
	b	.L682
.L732:
	ldr	x2, [x29, 96]
	mov	w10, 0
	mov	w9, w4
	ldrb	w0, [x2, 483]
	ldrb	w1, [x2, 476]
	strb	w0, [x2, 476]
	ldrb	w0, [x2, 481]
	strb	w1, [x2, 477]
	ldrb	w1, [x2, 482]
	strb	w0, [x2, 482]
	ldrb	w0, [x2, 480]
	strb	w1, [x2, 483]
	strb	w0, [x2, 481]
	b	.L682
.L674:
	ldr	w0, [x29, 116]
	cbnz	w0, .L695
	cbz	w3, .L695
	mov	w0, w3
	mov	w25, 0
	mov	w22, w3
	mov	w23, 0
	mov	w24, 0
	b	.L696
.L695:
	mov	w0, -6
	b	.L726
	.size	WriteScdMsg, .-WriteScdMsg
	.align	3
.LC128:
	.xword	.LANCHOR0
	.align	3
.LC129:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_StartSCD
	.type	SCDDRV_StartSCD, %function
SCDDRV_StartSCD:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	add	x19, x1, 458752
	mov	x22, x0
	mov	x0, x30
	mov	x20, x1
	mov	w24, w2
	mov	w26, w3
	bl	_mcount
	add	x21, x19, 168
	ldr	w0, [x19, 240]
	add	x20, x20, 88
	ldr	w27, [x19, 204]
	ldr	x25, [x19, 192]
	bl	VCTRL_IfEsBufEnable
	cbz	w0, .L737
	ldr	x23, .LC132
	mov	x2, 12
	mov	w1, 0
	mov	x0, x21
	ldr	x3, [x23, 96]
	blr	x3
	ldr	w0, [x19, 240]
	mov	x3, x20
	ldr	w6, [x22, 52]
	mov	w5, w27
	mov	x4, x25
	mov	w2, w24
	mov	x1, x21
	bl	WriteScdMsg
	mov	w20, w0
	cbnz	w0, .L735
	ldr	x0, [x23]
	blr	x0
	ldr	x3, .LC133
	sbfiz	x1, x26, 6, 32
	mov	w2, w26
	add	x3, x3, x1
	mov	x1, x22
	str	w0, [x3, 52]
	ldr	w0, [x19, 240]
	bl	WriteScdVtrlReg
.L735:
	mov	w0, w20
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L737:
	ldr	x1, .LC131
	mov	w0, 1
	ldr	w2, [x19, 240]
	mov	w20, -7
	bl	dprint_vfmw
	b	.L735
	.size	SCDDRV_StartSCD, .-SCDDRV_StartSCD
	.align	3
.LC131:
	.xword	.LC130
	.align	3
.LC132:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC133:
	.xword	g_VfmwGlobalStat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CutStreamWithSCD
	.type	CutStreamWithSCD, %function
CutStreamWithSCD:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w22, w1
	add	x19, x21, 458752
	bl	_mcount
	str	wzr, [x29, 64]
	add	x6, x29, 144
	add	x1, x21, 98304
	ldr	w2, [x19, 496]
	add	x5, x29, 60
	add	x4, x29, 64
	add	x3, x29, 56
	str	wzr, [x6, -76]!
	add	x1, x1, 112
	add	x0, x21, 88
	stp	wzr, wzr, [x29, 56]
	bl	SCDDRV_CheckConditionOfStartSCD
	mov	w20, w0
	cbnz	w0, .L746
	ldr	w0, [x29, 68]
	cmp	w0, wzr
	ccmp	x21, xzr, 4, ne
	beq	.L741
	ldr	x2, .LC136
	add	x4, x19, 256
	mov	w0, -1
	strh	w0, [x19, 468]
	strh	w0, [x19, 476]
	mov	w1, 1
	str	w0, [x19, 472]
	ldr	x3, [x2, 96]
	mov	x2, 88
	stp	w0, wzr, [x4, 224]
	stp	w1, wzr, [x4, 232]
	str	wzr, [x19, 496]
	mov	w1, 0
	str	wzr, [x19, 500]
	add	x0, x19, 512
	str	wzr, [x19, 504]
	blr	x3
.L741:
	ldr	w0, [x19, 240]
	mov	w1, w22
	bl	SM_CfgBuf
	mov	w20, w0
	cbnz	w0, .L747
	ldr	w3, [x19, 316]
	mov	x0, x21
	ldr	w2, [x29, 60]
	add	x1, x29, 72
	str	w2, [x19, 224]
	mul	w2, w2, w3
	lsl	w2, w2, 2
	str	w2, [x19, 220]
	bl	SCDDRV_SetCtrlReg
	ldr	w2, [x29, 64]
	mov	w3, w22
	mov	x1, x21
	add	x0, x29, 72
	bl	SCDDRV_StartSCD
	mov	w2, w0
	cbnz	w0, .L740
	ldr	w1, [x29, 56]
	ldr	w0, [x29, 64]
	str	w1, [x19, 288]
	cmp	w1, w0
	str	w0, [x19, 292]
	bls	.L748
	strb	wzr, [x21, 2]
.L744:
	mov	w1, 1
	ldr	x0, .LC136
	str	w1, [x19, 248]
	strb	wzr, [x21, 3]
	ldr	x0, [x0]
	blr	x0
	str	w0, [x19, 312]
	mov	w2, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, w2
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L747:
	ldr	x1, .LC138
	mov	w2, w0
	mov	w0, 26
	bl	dprint_vfmw
	mov	w2, w20
.L740:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, w2
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L746:
	ldr	x1, .LC135
	mov	w2, w0
	mov	w0, 26
	bl	dprint_vfmw
	mov	w2, w20
	ldp	x21, x22, [sp, 32]
	ldp	x19, x20, [sp, 16]
	mov	w0, w2
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L748:
	mov	w0, 1
	strb	w0, [x21, 2]
	b	.L744
	.size	CutStreamWithSCD, .-CutStreamWithSCD
	.align	3
.LC135:
	.xword	.LC134
	.align	3
.LC136:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC138:
	.xword	.LC137
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReadScdStateReg
	.type	ReadScdStateReg, %function
ReadScdStateReg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x1, .LC139
	add	x19, x1, x19, sxtw 2
	ldr	w0, [x19, 96]
	add	w0, w0, 2112
	bl	MEM_ReadPhyWord
	and	w0, w0, 1
	str	w0, [x20]
	ldr	w0, [x19, 96]
	add	w0, w0, 2124
	bl	MEM_ReadPhyWord
	lsr	w0, w0, 22
	ldr	w1, [x19, 96]
	str	w0, [x20, 8]
	add	w0, w1, 2124
	bl	MEM_ReadPhyWord
	and	w0, w0, 4194303
	ldr	w1, [x19, 96]
	str	w0, [x20, 12]
	add	w0, w1, 2128
	bl	MEM_ReadPhyWord
	str	w0, [x20, 16]
	ldr	w1, [x19, 96]
	add	w0, w1, 2132
	bl	MEM_ReadPhyWord
	str	w0, [x20, 20]
	ldr	w1, [x19, 96]
	add	w0, w1, 2060
	bl	MEM_ReadPhyWord
	str	w0, [x20, 24]
	ldr	w1, [x19, 96]
	add	w0, w1, 2140
	bl	MEM_ReadPhyWord
	str	w0, [x20, 28]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ReadScdStateReg, .-ReadScdStateReg
	.align	3
.LC139:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ParseMpeg4UniqueUpMsg
	.type	ParseMpeg4UniqueUpMsg, %function
ParseMpeg4UniqueUpMsg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	x19, x1
	mov	x20, x2
	bl	_mcount
	cmp	w21, 1
	ldrb	w0, [x19]
	beq	.L753
	orr	w0, w0, 1
	strb	w0, [x19]
.L752:
	ldr	w1, [x20, 4]
	ldrb	w0, [x19]
	lsr	w1, w1, 30
	bfi	w0, w1, 1, 1
	strb	w0, [x19]
	ldrh	w1, [x20, 10]
	bfi	w0, w1, 2, 1
	strb	w0, [x19]
	ldr	w1, [x20, 8]
	ubfx	x1, x1, 4, 3
	bfi	w0, w1, 3, 4
	strb	w0, [x19]
	ldr	w0, [x20, 8]
	ldrh	w1, [x19]
	and	w0, w0, 7
	bfi	w1, w0, 7, 4
	strh	w1, [x19]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L753:
	and	w0, w0, -2
	strb	w0, [x19]
	b	.L752
	.size	ParseMpeg4UniqueUpMsg, .-ParseMpeg4UniqueUpMsg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ConvertByteOrder
	.type	ConvertByteOrder, %function
ConvertByteOrder:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	ldr	x19, [sp, 16]
	rev	w0, w0
	ldp	x29, x30, [sp], 32
	ret
	.size	ConvertByteOrder, .-ConvertByteOrder
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckSegValid
	.type	CheckSegValid, %function
CheckSegValid:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cbz	x20, .L760
	ldr	w0, [x20, 16]
	cbz	w0, .L762
	ldr	x0, [x20]
	cbz	x0, .L762
	cbz	x19, .L763
	add	x1, x19, 360448
	ldp	w2, w0, [x1, 32]
	cmp	w0, w2
	sub	w2, w2, #1
	bhi	.L765
	sub	w0, w2, w0
	bcc	.L757
	ldr	w0, [x1, 28]
	sub	w0, w0, #1
.L757:
	ldr	w2, [x20, 20]
	mov	w1, -7
	cmp	w2, w0
	csel	w0, wzr, w1, ls
.L756:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L765:
	ldr	w1, [x1, 28]
	add	w2, w2, w1
	sub	w0, w2, w0
	b	.L757
	.p2align 3
.L763:
	mov	w0, 0
	b	.L757
	.p2align 3
.L762:
	mov	w0, -7
	b	.L756
.L760:
	mov	w0, -1
	b	.L756
	.size	CheckSegValid, .-CheckSegValid
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetSegPts
	.type	GetSegPts, %function
GetSegPts:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x3
	mov	x21, x2
	mov	w23, w1
	mov	w22, w4
	bl	_mcount
	add	x4, x29, 80
	add	x2, x29, 68
	mov	w1, w23
	add	x3, x29, 72
	mov	x0, x20
	str	wzr, [x4, -4]!
	stp	wzr, wzr, [x29, 68]
	bl	GetRawNumOffset
	ldr	w1, [x29, 76]
	lsl	x0, x1, 2
	sub	x0, x0, x1
	add	x0, x20, x0, lsl 5
	ldr	x1, [x0, 64]
	str	x1, [x19, 32]
	ldr	x2, [x0, 48]
	str	x2, [x19, 48]
	ldr	x2, [x0, 64]
	str	x2, [x19, 40]
	ldr	x2, [x0, 56]
	str	x2, [x19, 56]
	ldr	w2, [x0, 24]
	str	w2, [x19, 64]
	ldr	w2, [x0, 28]
	str	w2, [x19, 68]
	ldr	w2, [x0, 32]
	str	w2, [x19, 72]
	ldr	w2, [x0, 36]
	str	w2, [x19, 76]
	ldrb	w0, [x0, 92]
	strb	w0, [x19, 12]
	ldr	x0, [x21]
	cmp	x1, x0
	beq	.L769
.L767:
	str	x1, [x21]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L769:
	ldr	x0, .LC140
	ldr	x0, [x0, w22, sxtw 3]
	add	x0, x0, 507904
	ldr	w0, [x0, 2076]
	cbnz	w0, .L767
	mov	x0, -1
	str	x0, [x19, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.size	GetSegPts, .-GetSegPts
	.align	3
.LC140:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsVopHeader
	.type	IsVopHeader, %function
IsVopHeader:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 1
	beq	.L775
	cmp	w19, 2
	mov	w0, 0
	beq	.L776
	mov	w1, -33488896
	cmp	w20, w1
	csinc	w0, w0, wzr, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L775:
	mov	w0, -1241448448
	mov	w1, -33488896
	cmp	w20, w0
	cset	w0, eq
	cmp	w20, w1
	csinc	w0, w0, wzr, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L776:
	ubfx	x0, x20, 16, 8
	mov	w1, -33488896
	sub	w0, w0, #128
	cmp	w0, 3
	cset	w0, ls
	cmp	w20, w1
	csinc	w0, w0, wzr, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	IsVopHeader, .-IsVopHeader
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetNextVop
	.type	GetNextVop, %function
GetNextVop:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w19, w2
	mov	x20, x1
	bl	_mcount
	add	x2, x21, 98304
	adds	x3, x2, 112
	beq	.L786
	add	x3, x3, 360448
	mov	w0, 4096
	ldp	w10, w1, [x3, 8]
	sub	w10, w1, w10
	and	w10, w10, 4095
	sub	w10, w0, w10
.L778:
	sub	w3, w19, #1
	mov	w5, w3
	tbnz	w3, #31, .L787
	add	x21, x21, 458752
	add	x0, x2, 112
	add	x0, x0, 360448
	ldr	x7, [x2, 112]
	mov	w8, -33488896
	mov	w11, -1241448448
	ldr	w2, [x21, 316]
	ldr	w1, [x0, 24]
	ldr	w6, [x21, 260]
	mul	w4, w3, w2
	b	.L785
	.p2align 3
.L780:
	cmp	w6, 2
	beq	.L789
	cmp	w0, w8
	beq	.L783
.L784:
	sub	w5, w5, #1
	mov	w19, w3
	cmn	w5, #1
	sub	w4, w4, w2
	beq	.L787
.L790:
	sub	w3, w3, #1
.L785:
	ldr	w0, [x20, w4, uxtw 2]
	cmp	w6, 1
	sub	w0, w0, w1
	ldr	w0, [x7, x0]
	bne	.L780
	cmp	w0, w11
	cset	w9, eq
.L781:
	cmp	w0, w8
	beq	.L783
	cbz	w9, .L784
	.p2align 2
.L783:
	cmp	w3, w10
	mov	w19, w3
	bls	.L787
	sub	w5, w5, #1
	sub	w3, w3, #1
	cmn	w5, #1
	mov	w19, w3
	sub	w4, w4, w2
	bne	.L790
.L787:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L789:
	ubfx	x9, x0, 16, 8
	sub	w9, w9, #128
	cmp	w9, 3
	cset	w9, ls
	b	.L781
.L786:
	mov	w10, 4096
	b	.L778
	.size	GetNextVop, .-GetNextVop
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CorrectRollPhyAddr
	.type	CorrectRollPhyAddr, %function
CorrectRollPhyAddr:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	w21, w2
	bl	_mcount
	cmp	w20, w21
	mov	w0, w19
	bcs	.L792
	sub	w0, w20, w21
	add	w0, w0, w19
.L792:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	CorrectRollPhyAddr, .-CorrectRollPhyAddr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CorrectSegNextAddr
	.type	CorrectSegNextAddr, %function
CorrectSegNextAddr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, w19
	csel	w0, w20, w19, cs
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CorrectSegNextAddr, .-CorrectSegNextAddr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SetLastUnfinishedSegInfo
	.type	SetLastUnfinishedSegInfo, %function
SetLastUnfinishedSegInfo:
	stp	x29, x30, [sp, -176]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	mov	w20, w1
	mov	x22, x2
	bl	_mcount
	add	x19, x21, 458752
	add	x0, x29, 88
	add	x1, x29, 120
	str	xzr, [x29, 168]
	add	x24, x19, 512
	ldr	x23, [x19, 208]
	mov	x3, x24
	stp	xzr, xzr, [x0]
	add	x0, x29, 104
	ldr	w4, [x19, 240]
	stp	xzr, xzr, [x1]
	add	x1, x29, 136
	add	x2, x19, 280
	stp	xzr, xzr, [x0]
	ldr	w0, [x19, 316]
	add	x25, x21, 98304
	stp	xzr, xzr, [x1]
	add	x1, x29, 152
	mul	w20, w0, w20
	add	w0, w20, 1
	stp	xzr, xzr, [x1]
	ldr	w1, [x23, w0, uxtw 2]
	add	x0, x21, 88
	and	w1, w1, 1073741823
	bl	GetSegPts
	ldr	x0, .LC141
	mov	x2, 88
	mov	x1, x24
	ldr	x3, [x0, 104]
	add	x0, x29, x2
	blr	x3
	ldr	w5, [x23, w20, uxtw 2]
	add	x23, x25, 112
	add	x1, x23, 360448
	str	w5, [x19, 492]
	ldr	w0, [x22, 28]
	ldr	w4, [x1, 24]
	cmp	w0, w4
	csel	w0, w0, w4, cs
	str	w0, [x19, 484]
	cmp	w5, w0
	bls	.L796
	mov	w1, 1
	str	w1, [x19, 500]
	ldr	w2, [x22, 28]
	ldr	w1, [x22, 16]
	cmp	w4, w2
	bls	.L797
	add	w1, w1, w2
	sub	w1, w1, w4
.L797:
	sub	w20, w0, w4
	sub	w3, w1, w5
	str	w1, [x19, 504]
	add	w1, w3, w20
	str	w1, [x19, 496]
	ldr	w0, [x21, 52]
	cmp	w0, 1
	beq	.L809
.L799:
	str	wzr, [x19, 488]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L796:
	sub	w3, w0, w5
	str	wzr, [x19, 500]
	str	w3, [x19, 496]
	str	wzr, [x19, 504]
	ldr	w0, [x21, 52]
	cmp	w0, 1
	ccmp	w3, 3, 0, eq
	bls	.L799
	ldr	x6, [x25, 112]
	sub	w4, w5, w4
	ldr	w2, [x19, 240]
	mov	w7, 1
	add	x4, x6, x4
	add	x1, x29, 88
	mov	w6, 2
	mov	x0, x23
	strb	w7, [x29, 98]
	strb	w6, [x29, 97]
	str	x4, [x29, 88]
	stp	w5, w3, [x29, 104]
	bl	InsertStreamSeg
	b	.L799
	.p2align 3
.L809:
	cbz	x23, .L800
	add	x6, x25, 112
	mov	w7, 4096
	add	x6, x6, 360448
	ldp	w0, w2, [x6, 8]
	sub	w0, w2, w0
	and	w0, w0, 4095
	sub	w0, w7, w0
	cmp	w0, 3
	cset	w0, hi
.L800:
	cmp	w1, 3
	cset	w1, hi
	tst	w0, w1
	beq	.L799
	ldr	x0, [x25, 112]
	sub	w4, w5, w4
	ldr	w2, [x19, 240]
	add	x21, x25, 112
	add	x4, x0, x4
	add	x1, x29, 88
	add	x21, x21, 360448
	mov	x0, x23
	stp	w5, w3, [x29, 104]
	mov	w22, 2
	str	x4, [x29, 88]
	strb	wzr, [x29, 98]
	strb	w22, [x29, 97]
	bl	InsertStreamSeg
	ldr	w4, [x21, 24]
	mov	w3, 1
	ldr	x5, [x25, 112]
	add	x1, x29, 88
	ldr	w2, [x19, 240]
	mov	x0, x23
	strb	w3, [x29, 98]
	strb	w22, [x29, 97]
	str	x5, [x29, 88]
	stp	w4, w20, [x29, 104]
	bl	InsertStreamSeg
	b	.L799
	.size	SetLastUnfinishedSegInfo, .-SetLastUnfinishedSegInfo
	.align	3
.LC141:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessSegRoll
	.type	ProcessSegRoll, %function
ProcessSegRoll:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	add	x25, x20, 458752
	add	x20, x20, 98304
	mov	w24, w2
	mov	x19, x1
	sxtb	w22, w3
	sxtb	w23, w4
	add	x27, x20, 112
	bl	_mcount
	add	x4, x27, 360448
	ldr	x0, [x25, 208]
	ldr	w1, [x25, 492]
	ldr	w28, [x4, 24]
	sub	w24, w24, w1
	ldr	w21, [x0]
	sub	w21, w21, w28
	add	w3, w24, w21
	cbz	x27, .L811
	ldp	w2, w0, [x4, 8]
	str	w1, [x19, 16]
	cmp	w3, 3
	sub	w0, w0, w2
	ldr	w2, [x4, 24]
	and	w0, w0, 4095
	sub	w1, w1, w2
	ldr	x2, [x20, 112]
	str	w3, [x19, 20]
	add	x1, x2, x1
	str	x1, [x19]
	mov	w1, 4096
	sub	w0, w1, w0
	bls	.L817
	cmp	w0, 2
	bls	.L815
.L814:
	mov	x1, x27
	mov	x0, x19
	bl	CheckSegValid
	mov	w26, w0
	cbnz	w0, .L815
	str	w24, [x19, 20]
	cbz	w21, .L819
	strb	wzr, [x19, 10]
	mov	x1, x19
	strb	w22, [x19, 9]
	mov	x0, x27
	ldr	w2, [x25, 240]
	bl	InsertStreamSeg
	str	w28, [x19, 16]
	add	x2, x20, 112
	mov	x0, x27
	add	x2, x2, 360448
	ldr	x3, [x20, 112]
	ldr	w1, [x2, 24]
	mov	w2, 1
	strb	w23, [x19, 9]
	sub	w1, w28, w1
	strb	w2, [x19, 10]
	add	x1, x3, x1
	str	w21, [x19, 20]
	str	x1, [x19]
	mov	x1, x19
	ldr	w2, [x25, 240]
	bl	InsertStreamSeg
.L818:
	mov	w0, w26
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L819:
	strb	w22, [x19, 9]
	mov	w0, 1
	strb	w0, [x19, 10]
	mov	x1, x19
	mov	x0, x27
	ldr	w2, [x25, 240]
	bl	InsertStreamSeg
	mov	w0, w26
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L811:
	str	w1, [x19, 16]
	cmp	w3, 3
	ldr	w0, [x4, 24]
	sub	w1, w1, w0
	ldr	x0, [x20, 112]
	str	w3, [x19, 20]
	add	x1, x0, x1
	str	x1, [x19]
	bhi	.L814
.L817:
	ldr	x1, .LC143
	mov	w2, 2729
	mov	w0, 0
	mov	w26, 0
	bl	dprint_vfmw
	mov	w0, w26
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L815:
	mov	w26, -4
	b	.L818
	.size	ProcessSegRoll, .-ProcessSegRoll
	.align	3
.LC143:
	.xword	.LC142
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessLastUnfinishedSeg
	.type	ProcessLastUnfinishedSeg, %function
ProcessLastUnfinishedSeg:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x2
	mov	w23, w1
	bl	_mcount
	add	x21, x19, 98304
	add	x1, x29, 72
	add	x0, x21, 112
	add	x0, x0, 360448
	ldr	w3, [x20, 28]
	str	xzr, [x29, 152]
	stp	xzr, xzr, [x1]
	add	x1, x29, 88
	ldr	w2, [x0, 24]
	ldr	w22, [x20, 16]
	cmp	w2, w3
	stp	xzr, xzr, [x1]
	add	x1, x29, 104
	stp	xzr, xzr, [x1]
	add	x1, x29, 120
	stp	xzr, xzr, [x1]
	add	x1, x29, 136
	stp	xzr, xzr, [x1]
	bls	.L821
	add	w3, w22, w3
	sub	w22, w3, w2
.L821:
	cbnz	w23, .L822
	add	x0, x19, 458752
	ldr	w1, [x0, 292]
	ldr	w3, [x0, 288]
	cmp	w3, w1
	cset	w1, gt
	strb	w1, [x19]
	ldr	w4, [x0, 492]
	cbz	w4, .L833
	ldr	w3, [x0, 496]
	ldr	w1, [x0, 172]
	ldr	w5, [x0, 500]
	add	w3, w3, w1
	str	w3, [x0, 496]
	cbnz	w5, .L825
	ldr	w3, [x20, 28]
	cmp	w4, w3
	bls	.L825
	mov	w3, 1
	str	w22, [x0, 504]
	str	w3, [x0, 500]
.L825:
	str	wzr, [x0, 488]
	ldr	w3, [x20, 28]
	cmp	w3, w2
	csel	w2, w3, w2, cs
	str	w2, [x0, 484]
.L824:
	add	x0, x19, 88
	bl	DeleteRawLen
	mov	w20, w0
.L826:
	mov	w0, w20
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L822:
	add	x23, x19, 458752
	strb	wzr, [x19]
	mov	w20, 0
	ldr	w0, [x23, 492]
	cbz	w0, .L826
	ldr	x3, .LC144
	mov	x2, 88
	add	x1, x23, 512
	add	x0, x29, 72
	ldr	x3, [x3, 104]
	blr	x3
	ldr	w3, [x23, 500]
	cmp	w3, 1
	beq	.L834
	ldr	x2, [x23, 208]
	ldr	w1, [x23, 492]
	ldr	w0, [x2]
	cmp	w0, w1
	bcc	.L828
	add	x19, x21, 112
	ldr	x3, [x21, 112]
	add	x0, x19, 360448
	str	w1, [x29, 88]
	mov	w4, 1
	ldr	w0, [x0, 24]
	sub	w0, w1, w0
	add	x0, x3, x0
	str	x0, [x29, 72]
	ldr	w3, [x2]
	strb	w4, [x29, 82]
	sub	w3, w3, w1
	strb	w4, [x29, 81]
	cmp	w3, 3
	str	w3, [x29, 92]
	bls	.L835
	mov	x1, x19
	add	x0, x29, 72
	bl	CheckSegValid
	cbnz	w0, .L831
	ldr	w2, [x23, 240]
	add	x1, x29, 72
	mov	x0, x19
	bl	InsertStreamSeg
	mov	w20, w0
	b	.L826
	.p2align 3
.L833:
	ldr	w1, [x0, 172]
	b	.L824
	.p2align 3
.L828:
	mov	w4, 0
	mov	w3, 1
	mov	w2, w22
	add	x1, x29, 72
	mov	x0, x19
	bl	ProcessSegRoll
	mov	w20, w0
	b	.L826
	.p2align 3
.L835:
	ldr	x1, .LC145
	mov	w2, 2818
	mov	w0, 0
	bl	dprint_vfmw
	b	.L826
	.p2align 3
.L834:
	ldr	w2, [x23, 504]
	mov	w4, w3
	add	x1, x29, 72
	mov	x0, x19
	bl	ProcessSegRoll
	mov	w20, w0
	b	.L826
.L831:
	mov	w20, -4
	b	.L826
	.size	ProcessLastUnfinishedSeg, .-ProcessLastUnfinishedSeg
	.align	3
.LC144:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC145:
	.xword	.LC142
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SetPushRawOverState
	.type	SetPushRawOverState, %function
SetPushRawOverState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	w0, [x19, 8]
	str	w20, [x19, 8]
	cmp	w0, 3
	mov	w0, -7
	ccmp	w20, 2, 0, eq
	beq	.L838
	mov	w0, 0
.L838:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SetPushRawOverState, .-SetPushRawOverState
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessExceptionalStartCodeNum
	.type	ProcessExceptionalStartCodeNum, %function
ProcessExceptionalStartCodeNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	x1, .LC147
	mov	w3, w20
	mov	w2, 2857
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, 1
	add	x0, x19, 88
	bl	DeleteRawPacket
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ProcessExceptionalStartCodeNum, .-ProcessExceptionalStartCodeNum
	.align	3
.LC147:
	.xword	.LC146
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetValidStartCodeNum
	.type	GetValidStartCodeNum, %function
GetValidStartCodeNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	w2, [x19, 24]
	ldr	w0, [x19, 12]
	udiv	w1, w2, w20
	ldp	x19, x20, [sp, 16]
	cmp	w1, w0
	csel	w0, w1, w0, ls
	ldp	x29, x30, [sp], 32
	ret
	.size	GetValidStartCodeNum, .-GetValidStartCodeNum
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessNotMpeg4ScdUpMsg
	.type	ProcessNotMpeg4ScdUpMsg, %function
ProcessNotMpeg4ScdUpMsg:
	stp	x29, x30, [sp, -224]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	str	x20, [x29, 96]
	mov	x28, x2
	str	w1, [x29, 124]
	bl	_mcount
	add	x0, x29, 136
	add	x19, x20, 458752
	mov	x3, x20
	add	x20, x20, 98304
	add	x20, x20, 112
	mov	w25, 1
	stp	xzr, xzr, [x0]
	add	x0, x29, 152
	ldr	w24, [x19, 316]
	mov	w27, 0
	mov	x23, x20
	add	x21, x20, 360448
	ldr	x26, [x19, 208]
	stp	xzr, xzr, [x0]
	add	x0, x29, 168
	str	xzr, [x29, 216]
	stp	xzr, xzr, [x0]
	add	x0, x29, 184
	stp	xzr, xzr, [x0]
	add	x0, x29, 200
	stp	xzr, xzr, [x0]
	add	x0, x3, 88
	str	x0, [x29, 112]
	sub	w0, w24, #1
	str	w0, [x29, 120]
	b	.L842
	.p2align 3
.L866:
	ldr	w1, [x21, 24]
	sub	w3, w3, w0
	ldr	x4, [x23]
	mov	w2, 1
	sub	w1, w0, w1
	strb	w2, [x29, 146]
	stp	w0, w3, [x29, 152]
	cmp	w3, 3
	add	x0, x4, x1
	str	x0, [x29, 136]
	bls	.L865
	mov	x1, x20
	add	x0, x29, 136
	bl	CheckSegValid
	cbnz	w0, .L849
	strb	wzr, [x29, 145]
	add	x2, x19, 280
	ldr	x0, [x29, 112]
	add	x3, x29, 136
	ldr	w1, [x26, w25, uxtw 2]
	ldr	w4, [x19, 240]
	and	w1, w1, 1073741823
	bl	GetSegPts
	ldr	w2, [x19, 240]
	add	x1, x29, 136
	mov	x0, x20
	bl	InsertStreamSeg
	cbnz	w0, .L849
.L845:
	add	w25, w25, w24
	mov	w27, w22
.L842:
	ldr	w0, [x29, 124]
	cmp	w27, w0
	beq	.L849
	ldr	w1, [x29, 120]
	sub	w0, w25, #1
	add	w22, w27, 1
	add	w1, w1, w25
	ldr	w0, [x26, w0, uxtw 2]
	ldr	w3, [x26, w1, uxtw 2]
	cmp	w0, w3
	bls	.L866
	ldr	w1, [x21, 24]
	ldr	w2, [x28, 16]
	sub	w5, w3, w1
	sub	w2, w2, w0
	add	w3, w2, w5
	cbz	x20, .L850
	ldr	x4, [x23]
	sub	w1, w0, w1
	stp	w0, w3, [x29, 152]
	add	x1, x4, x1
	cmp	w3, 3
	str	x1, [x29, 136]
	ldp	w1, w0, [x21, 8]
	bls	.L858
	sub	w0, w0, w1
	mov	w1, 4096
	and	w0, w0, 4095
	sub	w0, w1, w0
	cmp	w0, 2
	bls	.L849
.L859:
	mov	x1, x20
	add	x0, x29, 136
	stp	w5, w2, [x29, 104]
	bl	CheckSegValid
	cbnz	w0, .L849
	ldp	w5, w2, [x29, 104]
	cbnz	w5, .L852
	str	w2, [x29, 156]
	mov	w0, 1
	strb	wzr, [x29, 145]
	add	x2, x19, 280
	strb	w0, [x29, 146]
	add	x3, x29, 136
	ldr	x0, [x29, 112]
	ldr	w1, [x26, w25, uxtw 2]
	ldr	w4, [x19, 240]
	and	w1, w1, 1073741823
	bl	GetSegPts
	ldr	w2, [x19, 240]
	add	x1, x29, 136
	mov	x0, x20
	bl	InsertStreamSeg
	b	.L845
	.p2align 3
.L852:
	str	w2, [x29, 156]
	add	x3, x29, 136
	strb	wzr, [x29, 146]
	add	x2, x19, 280
	strb	wzr, [x29, 145]
	ldr	w4, [x19, 240]
	ldr	w1, [x26, w25, uxtw 2]
	ldr	x0, [x29, 112]
	and	w1, w1, 1073741823
	str	w5, [x29, 108]
	bl	GetSegPts
	ldr	w2, [x19, 240]
	add	x1, x29, 136
	mov	x0, x20
	bl	InsertStreamSeg
	strb	wzr, [x29, 145]
	ldr	w7, [x21, 24]
	mov	w3, 1
	ldr	w5, [x29, 108]
	add	x1, x29, 136
	ldr	x4, [x23]
	mov	x0, x20
	ldr	w2, [x19, 240]
	strb	w3, [x29, 146]
	str	x4, [x29, 136]
	stp	w7, w5, [x29, 152]
	bl	InsertStreamSeg
	b	.L845
	.p2align 3
.L850:
	sub	w1, w0, w1
	cmp	w3, 3
	stp	w0, w3, [x29, 152]
	ldr	x0, [x23]
	add	x1, x0, x1
	str	x1, [x29, 136]
	bhi	.L859
	.p2align 2
.L858:
	ldr	x1, .LC148
	mov	w2, 2931
	mov	w0, 0
	bl	dprint_vfmw
	b	.L845
	.p2align 3
.L865:
	ldr	x1, .LC148
	mov	w2, 2899
	mov	w0, 0
	bl	dprint_vfmw
	b	.L845
	.p2align 3
.L849:
	cmp	w27, wzr
	ble	.L867
	ldr	w0, [x28, 12]
	sub	w0, w0, #1
	cmp	w27, w0
	bcs	.L854
	mul	w0, w24, w27
	add	w0, w0, 1
	ldr	w20, [x26, w0, uxtw 2]
	ldr	x0, [x29, 96]
	and	w20, w20, 1073741823
	cbz	x0, .L855
	ldr	x2, .LC149
	add	x4, x19, 256
	mov	w0, -1
	strh	w0, [x19, 468]
	strh	w0, [x19, 476]
	mov	w1, 1
	str	w0, [x19, 472]
	ldr	x3, [x2, 96]
	mov	x2, 88
	stp	w0, wzr, [x4, 224]
	stp	w1, wzr, [x4, 232]
	str	wzr, [x19, 496]
	mov	w1, 0
	str	wzr, [x19, 500]
	add	x0, x19, 512
	str	wzr, [x19, 504]
	blr	x3
.L855:
	ldr	x0, [x29, 112]
	mov	w1, w20
	bl	DeleteRawLen
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 224
	ret
	.p2align 3
.L867:
	blt	.L857
	ldr	w0, [x28, 12]
	sub	w0, w0, #1
.L854:
	cmp	w27, w0
	beq	.L868
.L857:
	ldr	x0, [x29, 96]
	mov	x2, x28
	mov	w1, 0
	bl	SetLastUnfinishedSegInfo
.L841:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 224
	ret
.L868:
	ldr	x0, [x29, 96]
	mov	w1, w27
	mov	x2, x28
	ldr	w19, [x19, 172]
	bl	SetLastUnfinishedSegInfo
	ldr	x0, [x29, 112]
	mov	w1, w19
	bl	DeleteRawLen
	b	.L841
	.size	ProcessNotMpeg4ScdUpMsg, .-ProcessNotMpeg4ScdUpMsg
	.align	3
.LC148:
	.xword	.LC142
	.align	3
.LC149:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetMpeg4ModeFlag
	.type	GetMpeg4ModeFlag, %function
GetMpeg4ModeFlag:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	add	x19, x0, 458752
	mov	w20, w1
	mov	x0, x30
	mov	w27, 0
	mov	w28, 0
	bl	_mcount
	ldr	w22, [x19, 316]
	ldr	x21, [x19, 208]
	cbz	w20, .L869
	ldr	x26, .LC153
	mov	w23, 288
	mov	w25, 2
	mov	w24, 1
	b	.L883
	.p2align 3
.L889:
	cmp	w1, 32768
	str	w24, [x19, 260]
	str	wzr, [x19, 264]
	beq	.L887
.L875:
	add	w28, w28, 1
	add	w27, w27, w22
	cmp	w28, w20
	beq	.L869
.L883:
	ldr	w0, [x21, w27, uxtw 2]
	bl	MEM_Phy2Vir
	cbz	x0, .L888
	ldr	w1, [x0]
	rev	w1, w1
	cmp	w1, 438
	ccmp	w1, w23, 4, ne
	and	w1, w1, -1024
	beq	.L889
	cmp	w1, 32768
	bne	.L875
	ldr	w0, [x19, 260]
	cmp	w0, 1
	beq	.L890
.L877:
	str	w25, [x19, 260]
.L891:
	add	w28, w28, 1
	add	w27, w27, w22
	cmp	w28, w20
	bne	.L883
.L869:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L887:
	str	w24, [x19, 264]
	b	.L875
	.p2align 3
.L888:
	ldr	x2, .LC150
	mov	w3, 3000
	ldr	x1, .LC152
	mov	w0, 1
	add	x2, x2, 96
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L890:
	ldr	w0, [x19, 264]
	add	w0, w0, 1
	str	w0, [x19, 264]
	cmp	w0, 30
	bls	.L875
	ldr	x4, [x26]
	cbz	x4, .L877
	ldr	w0, [x19, 240]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
	str	w25, [x19, 260]
	b	.L891
	.size	GetMpeg4ModeFlag, .-GetMpeg4ModeFlag
	.align	3
.LC150:
	.xword	.LANCHOR3
	.align	3
.LC152:
	.xword	.LC151
	.align	3
.LC153:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessMpeg4ScdUpMsg
	.type	ProcessMpeg4ScdUpMsg, %function
ProcessMpeg4ScdUpMsg:
	stp	x29, x30, [sp, -320]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x22, x0
	mov	x0, x30
	add	x19, x22, 458752
	mov	x25, x2
	stp	x22, x2, [x29, 104]
	mov	w23, w1
	str	w1, [x29, 100]
	bl	_mcount
	ldr	x28, [x19, 208]
	ldr	w1, [x19, 316]
	add	x20, x22, 98304
	ldr	w0, [x19, 136]
	add	x20, x20, 112
	mov	w24, w1
	add	x1, x29, 232
	str	w24, [x29, 136]
	mov	w27, 0
	stp	xzr, xzr, [x29, 144]
	stp	xzr, xzr, [x1]
	add	x1, x29, 248
	str	xzr, [x29, 224]
	stp	xzr, xzr, [x29, 160]
	stp	xzr, xzr, [x29, 176]
	stp	xzr, xzr, [x1]
	add	x1, x29, 264
	str	xzr, [x29, 312]
	stp	xzr, xzr, [x29, 192]
	stp	xzr, xzr, [x29, 208]
	stp	xzr, xzr, [x1]
	add	x1, x29, 280
	mov	x26, x20
	stp	xzr, xzr, [x1]
	add	x1, x29, 296
	stp	xzr, xzr, [x1]
	bl	MEM_Phy2Vir
	mov	x21, x0
	mov	x0, x25
	add	x1, x22, 88
	str	x1, [x29, 128]
	mov	w25, 1
	ldr	w0, [x0, 16]
	bl	MEM_Phy2Vir
	sub	w3, w24, #1
	str	w3, [x29, 140]
	ldr	x3, .LC154
	mov	x2, 4
	mov	x1, x21
	ldr	x3, [x3, 104]
	blr	x3
	mov	x0, x22
	mov	w1, w23
	bl	GetMpeg4ModeFlag
	mov	x0, x22
	mov	w2, w23
	mov	x1, x28
	add	x22, x20, 360448
	bl	GetNextVop
	mov	w24, w0
	b	.L893
	.p2align 3
.L935:
	ldr	w0, [x29, 248]
	cbz	w0, .L895
	ldr	w2, [x29, 252]
	mov	x1, x20
	add	x0, x29, 232
	add	w3, w2, w3
	str	w3, [x29, 252]
	bl	CheckSegValid
	cbnz	w0, .L899
	ldr	w2, [x19, 240]
	add	x1, x29, 232
	mov	x0, x20
	strb	wzr, [x29, 241]
	bl	InsertStreamSeg
	mov	w23, w0
	ldr	x0, .LC154
	mov	x2, 88
	mov	w1, 0
	ldr	x4, [x0, 96]
	add	x0, x29, 232
	blr	x4
	cbnz	w23, .L899
.L900:
	ldr	w0, [x29, 136]
	mov	w27, w21
	add	w25, w25, w0
.L893:
	cmp	w27, w24
	beq	.L899
	ldr	w1, [x29, 140]
	sub	w0, w25, #1
	add	w21, w27, 1
	add	w1, w1, w25
	add	x23, x28, x0, uxtw 2
	ldr	w2, [x28, w0, uxtw 2]
	ldr	w0, [x28, w1, uxtw 2]
	sub	w3, w0, w2
	cmp	w3, 3
	bgt	.L935
	sub	w1, w3, #1
	cmp	w1, 2
	bls	.L936
	ldr	x1, [x29, 112]
	ldr	w10, [x1, 16]
	ldr	w1, [x22, 24]
	sub	w10, w10, w2
	sub	w9, w0, w1
	add	w3, w10, w9
	cbz	x20, .L909
	ldr	x0, [x26]
	sub	w1, w2, w1
	cmp	w3, 3
	add	x1, x0, x1
	str	x1, [x29, 144]
	stp	w2, w3, [x29, 160]
	ldr	w0, [x22, 12]
	ldr	w1, [x22, 8]
	bls	.L921
	sub	w0, w0, w1
	mov	w1, 4096
	and	w0, w0, 4095
	sub	w0, w1, w0
	cmp	w0, 2
	bls	.L899
.L922:
	mov	x1, x20
	add	x0, x29, 144
	stp	w9, w10, [x29, 120]
	bl	CheckSegValid
	cbnz	w0, .L899
	ldp	w9, w10, [x29, 120]
	ldr	w0, [x19, 260]
	cmp	w0, 1
	ldrb	w0, [x29, 224]
	cbnz	w9, .L911
	beq	.L937
	orr	w0, w0, 1
	strb	w0, [x29, 224]
.L913:
	ldr	w1, [x23, 4]
	mov	w2, 1
	ldrb	w0, [x29, 224]
	add	x3, x29, 144
	lsr	w1, w1, 30
	ldr	w4, [x19, 240]
	bfi	w0, w1, 1, 1
	strb	w0, [x29, 224]
	ldrh	w1, [x23, 10]
	bfi	w0, w1, 2, 1
	strb	w0, [x29, 224]
	ldr	w1, [x23, 8]
	ubfx	x1, x1, 4, 3
	bfi	w0, w1, 3, 4
	strb	w0, [x29, 224]
	ldr	w0, [x23, 8]
	ldrh	w1, [x29, 224]
	and	w0, w0, 7
	strb	w2, [x29, 154]
	strb	wzr, [x29, 153]
	bfi	w1, w0, 7, 4
	str	w10, [x29, 164]
	add	x2, x19, 280
	strh	w1, [x29, 224]
	ldr	x0, [x29, 128]
	ldr	w1, [x28, w25, uxtw 2]
	and	w1, w1, 1073741823
	bl	GetSegPts
	ldr	w2, [x19, 240]
	add	x1, x29, 144
	mov	x0, x20
	bl	InsertStreamSeg
	b	.L900
	.p2align 3
.L895:
	ldr	w4, [x22, 24]
	mov	w9, 1
	ldr	x10, [x26]
	mov	x1, x20
	sub	w4, w2, w4
	add	x0, x29, 144
	add	x4, x10, x4
	strb	w9, [x29, 154]
	str	x4, [x29, 144]
	stp	w2, w3, [x29, 160]
	bl	CheckSegValid
	cbnz	w0, .L899
	ldr	w0, [x19, 260]
	cmp	w0, 1
	ldrb	w0, [x29, 224]
	beq	.L938
	orr	w0, w0, 1
	strb	w0, [x29, 224]
.L902:
	ldr	w3, [x23, 4]
	add	x2, x19, 280
	ldrb	w1, [x29, 224]
	lsr	w3, w3, 30
	ldr	w4, [x19, 240]
	bfi	w1, w3, 1, 1
	strb	w1, [x29, 224]
	ldr	x0, [x29, 128]
	ldrh	w3, [x23, 10]
	bfi	w1, w3, 2, 1
	strb	w1, [x29, 224]
	add	x3, x29, 144
	ldr	w9, [x23, 8]
	ubfx	x9, x9, 4, 3
	bfi	w1, w9, 3, 4
	strb	w1, [x29, 224]
	ldr	w1, [x23, 8]
	ldrh	w7, [x29, 224]
	and	w1, w1, 7
	bfi	w7, w1, 7, 4
	strh	w7, [x29, 224]
	ldr	w1, [x28, w25, uxtw 2]
	and	w1, w1, 1073741823
	bl	GetSegPts
	strb	wzr, [x29, 153]
	ldr	w2, [x19, 240]
	add	x1, x29, 144
	mov	x0, x20
	bl	InsertStreamSeg
	cbz	w0, .L900
	.p2align 2
.L899:
	cmp	w27, wzr
	ble	.L898
	ldr	x0, [x29, 112]
	ldr	w0, [x0, 12]
	sub	w0, w0, #1
	cmp	w27, w0
	bcs	.L917
	ldr	w0, [x29, 136]
	mul	w0, w0, w27
	add	w0, w0, 1
	ldr	w20, [x28, w0, uxtw 2]
	ldr	x0, [x29, 104]
	and	w20, w20, 1073741823
	cbz	x0, .L918
	ldr	x0, .LC154
	add	x5, x19, 256
	mov	w1, 1
	mov	x2, 88
	ldr	x3, [x0, 96]
	mov	w0, -1
	strh	w0, [x19, 468]
	strh	w0, [x19, 476]
	str	w0, [x19, 472]
	stp	w0, wzr, [x5, 224]
	stp	w1, wzr, [x5, 232]
	str	wzr, [x19, 496]
	mov	w1, 0
	str	wzr, [x19, 500]
	add	x0, x19, 512
	str	wzr, [x19, 504]
	blr	x3
.L918:
	ldr	x0, [x29, 128]
	mov	w1, w20
	bl	DeleteRawLen
.L892:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 320
	ret
	.p2align 3
.L936:
	stp	w3, w2, [x29, 120]
	bl	MEM_Phy2Vir
	ldp	w3, w2, [x29, 120]
	cbz	x0, .L939
	ldr	w0, [x0]
	and	w0, w0, 16777215
	cmp	w0, 65536
	beq	.L900
	ldr	w0, [x19, 260]
	cmp	w0, 1
	ldrb	w0, [x29, 312]
	beq	.L940
	orr	w0, w0, 1
	strb	w0, [x29, 312]
.L908:
	ldr	w1, [x23, 4]
	ldrb	w0, [x29, 312]
	lsr	w1, w1, 30
	bfi	w0, w1, 1, 1
	strb	w0, [x29, 312]
	ldr	w1, [x22, 24]
	ldrh	w4, [x23, 10]
	sub	w1, w2, w1
	bfi	w0, w4, 2, 1
	ldr	x4, [x26]
	strb	w0, [x29, 312]
	add	x1, x4, x1
	str	x1, [x29, 232]
	ldr	w1, [x23, 8]
	ldr	w4, [x19, 240]
	ubfx	x1, x1, 4, 3
	bfi	w0, w1, 3, 4
	strb	w0, [x29, 312]
	mov	w1, 1
	ldr	w0, [x23, 8]
	strb	w1, [x29, 242]
	ldrh	w1, [x29, 312]
	and	w0, w0, 7
	stp	w2, w3, [x29, 248]
	bfi	w1, w0, 7, 4
	strh	w1, [x29, 312]
	ldr	x0, [x29, 128]
	add	x3, x29, 232
	ldr	w1, [x28, w25, uxtw 2]
	add	x2, x19, 280
	and	w1, w1, 1073741823
	bl	GetSegPts
	b	.L900
	.p2align 3
.L911:
	beq	.L941
	orr	w0, w0, 1
	strb	w0, [x29, 224]
.L915:
	ldr	w1, [x23, 4]
	add	x3, x29, 144
	ldrb	w0, [x29, 224]
	add	x2, x19, 280
	lsr	w1, w1, 30
	ldr	w4, [x19, 240]
	bfi	w0, w1, 1, 1
	strb	w0, [x29, 224]
	str	w9, [x29, 124]
	ldrh	w1, [x23, 10]
	bfi	w0, w1, 2, 1
	strb	w0, [x29, 224]
	ldr	w1, [x23, 8]
	ubfx	x1, x1, 4, 3
	bfi	w0, w1, 3, 4
	strb	w0, [x29, 224]
	ldr	w0, [x23, 8]
	ldrh	w1, [x29, 224]
	and	w0, w0, 7
	str	w10, [x29, 164]
	strb	wzr, [x29, 154]
	bfi	w1, w0, 7, 4
	strb	wzr, [x29, 153]
	strh	w1, [x29, 224]
	ldr	x0, [x29, 128]
	ldr	w1, [x28, w25, uxtw 2]
	and	w1, w1, 1073741823
	bl	GetSegPts
	ldr	w2, [x19, 240]
	add	x1, x29, 144
	mov	x0, x20
	bl	InsertStreamSeg
	strb	wzr, [x29, 153]
	ldr	w3, [x22, 24]
	add	x1, x29, 144
	ldr	w9, [x29, 124]
	mov	x0, x20
	ldr	x4, [x26]
	ldr	w2, [x19, 240]
	stp	w3, w9, [x29, 160]
	mov	w3, 1
	str	x4, [x29, 144]
	strb	w3, [x29, 154]
	bl	InsertStreamSeg
	b	.L900
	.p2align 3
.L909:
	ldr	x0, [x26]
	sub	w1, w2, w1
	cmp	w3, 3
	add	x1, x0, x1
	str	x1, [x29, 144]
	stp	w2, w3, [x29, 160]
	bhi	.L922
	.p2align 2
.L921:
	ldr	x1, .LC157
	mov	w2, 3140
	mov	w0, 0
	bl	dprint_vfmw
	b	.L900
	.p2align 3
.L938:
	and	w0, w0, -2
	strb	w0, [x29, 224]
	b	.L902
	.p2align 3
.L937:
	and	w0, w0, -2
	strb	w0, [x29, 224]
	b	.L913
	.p2align 3
.L941:
	and	w0, w0, -2
	strb	w0, [x29, 224]
	b	.L915
	.p2align 3
.L917:
	beq	.L942
.L898:
	ldr	w0, [x29, 100]
	cmp	w0, 1024
	ccmp	w24, wzr, 0, hi
	beq	.L943
	ldr	x0, [x29, 104]
	cbz	x0, .L892
.L944:
	ldr	x0, .LC154
	add	x4, x19, 256
	mov	w1, 1
	mov	x2, 88
	ldr	x3, [x0, 96]
	mov	w0, -1
	strh	w0, [x19, 468]
	strh	w0, [x19, 476]
	str	w0, [x19, 472]
	stp	w0, wzr, [x4, 224]
	stp	w1, wzr, [x4, 232]
	str	wzr, [x19, 496]
	mov	w1, 0
	str	wzr, [x19, 500]
	add	x0, x19, 512
	str	wzr, [x19, 504]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 320
	ret
	.p2align 3
.L940:
	and	w0, w0, -2
	strb	w0, [x29, 312]
	b	.L908
.L943:
	ldr	x1, .LC159
	mov	x2, x0
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x0, [x29, 128]
	mov	w1, 1
	bl	DeleteRawPacket
	ldr	x0, [x29, 104]
	cbnz	x0, .L944
	b	.L892
.L942:
	ldp	x0, x2, [x29, 104]
	mov	w1, w27
	ldr	w19, [x19, 172]
	bl	SetLastUnfinishedSegInfo
	ldr	x0, [x29, 128]
	mov	w1, w19
	bl	DeleteRawLen
	b	.L892
.L939:
	ldr	x1, .LC156
	mov	w2, 3110
	bl	dprint_vfmw
	b	.L892
	.size	ProcessMpeg4ScdUpMsg, .-ProcessMpeg4ScdUpMsg
	.align	3
.LC154:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC156:
	.xword	.LC155
	.align	3
.LC157:
	.xword	.LC142
	.align	3
.LC159:
	.xword	.LC158
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	ProcessScdReturn.part.10, %function
ProcessScdReturn.part.10:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	mov	w1, w19
	add	x0, x29, 32
	bl	ReadScdStateReg
	mov	w0, 34464
	ldr	w1, [x29, 44]
	movk	w0, 0x1, lsl 16
	cmp	w1, w0
	bls	.L946
	ldr	w0, [x20, 20]
	cbz	w0, .L951
.L946:
	add	x2, x20, 458752
	ldr	w0, [x29, 56]
	ldr	w19, [x2, 316]
	udiv	w19, w0, w19
	cmp	w19, w1
	csel	w19, w19, w1, ls
	cmp	w1, w19
	bhi	.L952
.L948:
	mov	w1, w19
	add	x2, x29, 32
	mov	x0, x20
	bl	ProcessLastUnfinishedSeg
	cmp	w0, wzr
	ccmp	w19, wzr, 4, eq
	cset	w1, eq
	cbnz	w1, .L947
	ldr	w0, [x20, 20]
	add	x2, x29, 32
	sub	w1, w19, #1
	cmp	w0, 2
	mov	x0, x20
	beq	.L949
	bl	ProcessNotMpeg4ScdUpMsg
	mov	w0, 0
.L947:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L952:
	ldrsb	w0, [x20, 2]
	cmp	w0, 1
	bne	.L948
	strb	wzr, [x20, 2]
	b	.L948
	.p2align 3
.L949:
	bl	ProcessMpeg4ScdUpMsg
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
.L951:
	mov	x0, x20
	bl	ProcessExceptionalStartCodeNum
	mov	w0, -7
	b	.L947
	.size	ProcessScdReturn.part.10, .-ProcessScdReturn.part.10
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessScdReturn
	.type	ProcessScdReturn, %function
ProcessScdReturn:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	add	x2, x19, 458752
	add	x2, x2, 168
	ldr	w0, [x2, 8]
	cmp	w0, 3
	beq	.L956
	mov	w0, 2
	mov	w1, w20
	str	w0, [x2, 8]
	mov	x0, x19
	bl	ProcessScdReturn.part.10
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L956:
	mov	w1, 2
	str	w1, [x2, 8]
	mov	w0, -7
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ProcessScdReturn, .-ProcessScdReturn
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_SaveRawStream
	.type	SCDDRV_SaveRawStream, %function
SCDDRV_SaveRawStream:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w22, w0
	mov	x0, x30
	mov	x23, x1
	mov	x20, x2
	bl	_mcount
	ldr	x21, .LC160
	ldr	x0, [x21, w22, sxtw 3]
	cbz	x0, .L957
	ldr	x19, .LC161
	mov	w0, 0
	ldr	w24, [x23, 20]
	ldr	x1, [x19, 32]
	blr	x1
	ldrb	w0, [x20, 2]
	cbnz	w0, .L959
	add	x1, x23, 36
	mov	w0, w24
	bl	SCDDRV_IsSCDByPass
	uxtb	w0, w0
	cbnz	w0, .L967
.L960:
	ldr	x2, [x21, w22, sxtw 3]
	ldr	w1, [x20, 12]
	ldr	x3, [x19, 88]
	ldr	x0, [x20, 40]
	blr	x3
.L959:
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
.L957:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L967:
	ldr	x2, [x21, w22, sxtw 3]
	mov	w1, 4
	ldr	x3, [x19, 88]
	add	x0, x20, 12
	blr	x3
	b	.L960
	.size	SCDDRV_SaveRawStream, .-SCDDRV_SaveRawStream
	.align	3
.LC160:
	.xword	vfmw_save_str_file
	.align	3
.LC161:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	NeedReadStream
	.type	NeedReadStream, %function
NeedReadStream:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x1
	mov	w21, w0
	mov	x0, x30
	mov	w20, w2
	mov	w22, w3
	bl	_mcount
	ldr	w0, [x19, 60]
	cbnz	w0, .L969
	ldr	w1, [x19, 64]
	mov	w0, 1
	cbz	w1, .L984
.L969:
	cmp	w20, 1
	mov	w0, 1
	beq	.L990
.L984:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L990:
	ldr	x0, .LC162
	ldr	x0, [x0, w21, sxtw 3]
	add	x0, x0, 507904
	ldr	w0, [x0, 2076]
	cmp	w0, 1
	beq	.L991
	ldr	w0, [x19, 64]
	cmp	w0, 1
	beq	.L984
	adds	x1, x19, 88
	beq	.L972
	add	x1, x1, 98304
	ldr	x3, .LC166
	ldp	w2, w0, [x1]
	ldr	x1, [x3, w21, sxtw 3]
	sub	w0, w0, w2
	add	w2, w0, 1024
	cmp	w0, wzr
	csel	w0, w2, w0, lt
	cbz	x1, .L989
.L975:
	ldp	w2, w3, [x1, 40]
	mov	w1, 16
	cmp	w2, wzr
	ccmp	w3, wzr, 4, gt
	cset	w4, gt
	cbz	w4, .L974
	mul	w2, w2, w3
	mov	w3, 2
	cmp	w2, 2088960
	ccmp	w22, 1, 0, le
	cset	w2, eq
	cmp	w2, wzr
	csel	w1, w1, w3, eq
.L974:
	cmp	w1, w0
	mov	w0, 0
	ble	.L984
.L976:
	add	x19, x19, 458752
	ldp	x21, x22, [sp, 32]
	ldr	w0, [x19, 160]
	ldp	x19, x20, [sp, 16]
	cmp	w0, w1
	cset	w0, lt
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L991:
	add	x19, x19, 458752
	ldr	w0, [x19, 160]
	cmp	w0, wzr
	cset	w0, le
	b	.L984
	.p2align 3
.L972:
	ldr	x2, .LC163
	mov	w0, w20
	ldr	x1, .LC165
	add	x2, x2, 120
	bl	dprint_vfmw
	ldr	x1, .LC166
	mov	w0, 0
	ldr	x1, [x1, w21, sxtw 3]
	cbnz	x1, .L975
	mov	w1, 16
	b	.L976
	.p2align 3
.L989:
	mov	w1, 16
	b	.L974
	.size	NeedReadStream, .-NeedReadStream
	.align	3
.LC162:
	.xword	s_pstVfmwChan
	.align	3
.LC163:
	.xword	.LANCHOR3
	.align	3
.LC165:
	.xword	.LC164
	.align	3
.LC166:
	.xword	s_pFspInst
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FillEopRawStream
	.type	FillEopRawStream, %function
FillEopRawStream:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x21, .LC168
	ldr	x0, .LC167
	mov	x2, 100
	add	x1, x21, 136
	add	x20, x0, x20, sxtw 4
	add	x0, x29, 56
	ldr	x20, [x20, 104]
	bl	memcpy
	cbz	x19, .L1006
	ldr	w3, [x20, 20]
	cmp	w3, 18
	bls	.L1007
.L995:
	ldr	x1, .LC173
	add	x2, x21, 240
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -7
.L1004:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L1007:
	ldr	x0, .LC171
	ldrb	w0, [x0,w3,uxtw]
	adr	x1, .Lrtx997
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx997:
	.section	.rodata
	.align	0
	.align	2
.L997:
	.byte	(.L1002 - .Lrtx997) / 4
	.byte	(.L998 - .Lrtx997) / 4
	.byte	(.L998 - .Lrtx997) / 4
	.byte	(.L998 - .Lrtx997) / 4
	.byte	(.L998 - .Lrtx997) / 4
	.byte	(.L998 - .Lrtx997) / 4
	.byte	(.L998 - .Lrtx997) / 4
	.byte	(.L995 - .Lrtx997) / 4
	.byte	(.L998 - .Lrtx997) / 4
	.byte	(.L998 - .Lrtx997) / 4
	.byte	(.L998 - .Lrtx997) / 4
	.byte	(.L998 - .Lrtx997) / 4
	.byte	(.L998 - .Lrtx997) / 4
	.byte	(.L998 - .Lrtx997) / 4
	.byte	(.L998 - .Lrtx997) / 4
	.byte	(.L998 - .Lrtx997) / 4
	.byte	(.L999 - .Lrtx997) / 4
	.byte	(.L995 - .Lrtx997) / 4
	.byte	(.L998 - .Lrtx997) / 4
	.text
	.p2align 3
.L1002:
	ldr	w3, [x19, 12]
	mov	w20, 15
	ldr	w5, [x19, 80]
	add	x1, x29, 56
	add	w0, w3, w20
	cmp	w0, w5
	bhi	.L1000
.L1005:
	ldr	x4, .LC176
	and	x2, x20, 31
	ldr	x0, [x19, 40]
	add	x0, x0, x3, sxtw
	ldr	x3, [x4, 104]
	blr	x3
	ldr	w4, [x19, 12]
	mov	w0, 0
	add	w20, w4, w20
	str	w20, [x19, 12]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L999:
	ldr	w3, [x19, 12]
	mov	w20, 16
	ldr	w5, [x19, 80]
	add	x1, x29, 136
	add	w0, w3, w20
	cmp	w0, w5
	bls	.L1005
.L1000:
	ldr	x1, .LC175
	mov	w4, w20
	add	x2, x21, 240
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -7
	b	.L1004
	.p2align 3
.L998:
	ldr	w3, [x19, 12]
	mov	w0, 0
	ldr	w5, [x19, 80]
	cmp	w3, w5
	bls	.L1004
	mov	w20, 0
	b	.L1000
	.p2align 3
.L1006:
	ldr	x1, .LC170
	add	x2, x21, 240
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -7
	b	.L1004
	.size	FillEopRawStream, .-FillEopRawStream
	.align	3
.LC167:
	.xword	.LANCHOR0
	.align	3
.LC168:
	.xword	.LANCHOR3
	.align	3
.LC170:
	.xword	.LC169
	.align	3
.LC171:
	.xword	.L997
	.align	3
.LC173:
	.xword	.LC172
	.align	3
.LC175:
	.xword	.LC174
	.align	3
.LC176:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FillEosRawStream
	.type	FillEosRawStream, %function
FillEosRawStream:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, .LC177
	mov	x2, 100
	ldr	x1, .LC178
	add	x19, x0, x19, sxtw 4
	add	x0, x29, 40
	add	x1, x1, 264
	ldr	x19, [x19, 104]
	bl	memcpy
	cbz	x20, .L1028
	ldr	w3, [x19, 20]
	cmp	w3, 18
	bls	.L1029
.L1011:
	ldr	x2, .LC179
	mov	w0, 0
	ldr	x1, .LC182
	bl	dprint_vfmw
	mov	w0, -7
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1029:
	ldr	x0, .LC181
	ldrb	w0, [x0,w3,uxtw]
	adr	x1, .Lrtx1013
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1013:
	.section	.rodata
	.align	0
	.align	2
.L1013:
	.byte	(.L1012 - .Lrtx1013) / 4
	.byte	(.L1014 - .Lrtx1013) / 4
	.byte	(.L1015 - .Lrtx1013) / 4
	.byte	(.L1016 - .Lrtx1013) / 4
	.byte	(.L1026 - .Lrtx1013) / 4
	.byte	(.L1026 - .Lrtx1013) / 4
	.byte	(.L1023 - .Lrtx1013) / 4
	.byte	(.L1011 - .Lrtx1013) / 4
	.byte	(.L1026 - .Lrtx1013) / 4
	.byte	(.L1026 - .Lrtx1013) / 4
	.byte	(.L1026 - .Lrtx1013) / 4
	.byte	(.L1026 - .Lrtx1013) / 4
	.byte	(.L1026 - .Lrtx1013) / 4
	.byte	(.L1026 - .Lrtx1013) / 4
	.byte	(.L1026 - .Lrtx1013) / 4
	.byte	(.L1012 - .Lrtx1013) / 4
	.byte	(.L1018 - .Lrtx1013) / 4
	.byte	(.L1026 - .Lrtx1013) / 4
	.byte	(.L1023 - .Lrtx1013) / 4
	.text
	.p2align 3
.L1012:
	mov	w19, 15
	add	x1, x29, 40
.L1017:
	ldr	w4, [x20, 12]
	cmp	w19, w4
	bls	.L1030
	ldr	x2, .LC179
	mov	w3, w19
	ldr	x1, .LC184
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -7
	b	.L1024
	.p2align 3
.L1030:
	ldr	x3, .LC185
	and	x2, x19, 31
	ldr	x0, [x20, 40]
	ldr	x3, [x3, 104]
	blr	x3
	str	w19, [x20, 12]
.L1026:
	mov	w0, 0
.L1024:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1014:
	ldr	w0, [x19, 36]
	cmp	w0, 1
	bne	.L1026
.L1023:
	mov	w19, 15
	add	x1, x29, 60
	b	.L1017
	.p2align 3
.L1018:
	mov	w19, 16
	add	x1, x29, 120
	b	.L1017
	.p2align 3
.L1016:
	mov	w19, 16
	add	x1, x29, 100
	b	.L1017
	.p2align 3
.L1015:
	mov	w19, 19
	add	x1, x29, 80
	b	.L1017
.L1028:
	ldr	x2, .LC179
	mov	w0, 0
	ldr	x1, .LC180
	bl	dprint_vfmw
	mov	w0, -7
	b	.L1024
	.size	FillEosRawStream, .-FillEosRawStream
	.align	3
.LC177:
	.xword	.LANCHOR0
	.align	3
.LC178:
	.xword	.LANCHOR3
	.align	3
.LC179:
	.xword	.LANCHOR4
	.align	3
.LC180:
	.xword	.LC169
	.align	3
.LC181:
	.xword	.L1013
	.align	3
.LC182:
	.xword	.LC172
	.align	3
.LC184:
	.xword	.LC183
	.align	3
.LC185:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FillVC1ExtraData
	.type	FillVC1ExtraData, %function
FillVC1ExtraData:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	w0, [x20, 36]
	cmp	w0, 1
	beq	.L1043
	ldr	w0, [x19, 76]
	tbnz	x0, 7, .L1044
	add	x20, x20, 458752
	ldr	w2, [x19, 12]
	ldr	w4, [x19, 80]
	ldr	w0, [x20, 332]
	add	w3, w2, w0
	cmp	w3, w4
	bhi	.L1045
	ldr	x1, [x19, 40]
	sxtw	x2, w2
	ldr	x22, .LC189
	mov	w21, 0
	add	x0, x1, x0, uxtw
.L1042:
	ldr	x3, [x22, 112]
	blr	x3
	ldr	w2, [x20, 332]
	add	x1, x20, 336
	ldr	x0, [x19, 40]
	ldr	x3, [x22, 104]
	blr	x3
	ldr	w1, [x19, 12]
	ldr	w0, [x20, 332]
	add	w0, w1, w0
	str	w0, [x19, 12]
.L1035:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1044:
	ldr	w2, [x19, 12]
	ldr	w4, [x19, 80]
	add	w3, w2, 12
	cmp	w3, 128
	ccmp	w3, w4, 2, le
	bhi	.L1046
	ldr	x22, .LC189
	sxtw	x2, w2
	ldr	x1, [x19, 40]
	add	x20, x20, 458752
	mov	w21, 0
	ldr	x3, [x22, 112]
	add	x0, x1, 8
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x19, 84
	ldr	x0, [x19, 40]
	mov	x2, 4
	blr	x3
	ldr	x0, [x19, 40]
	mov	x2, 4
	ldr	x3, [x22, 104]
	add	x1, x19, 88
	add	x0, x0, x2
	blr	x3
	ldr	x0, [x19, 40]
	mov	x2, 4
	ldr	x3, [x22, 96]
	mov	w1, 0
	add	x0, x0, 12
	blr	x3
	mov	w1, 16
	str	w1, [x19, 12]
	str	w1, [x20, 332]
	add	x0, x20, 336
	ldr	x3, [x22, 104]
	ldrsw	x2, [x19, 12]
	ldr	x1, [x19, 40]
	blr	x3
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1043:
	ldr	w1, [x19, 76]
	tbnz	x1, 7, .L1047
	ldrb	w1, [x19, 72]
	mov	w21, 0
	cbz	w1, .L1035
	add	x20, x20, 458752
	ldr	w2, [x19, 12]
	ldr	w4, [x19, 80]
	ldr	w5, [x20, 332]
	add	w3, w2, w5
	cmp	w3, w4
	bhi	.L1048
	ldr	x1, [x19, 40]
	sxtw	x2, w2
	ldr	x22, .LC189
	add	x0, x1, x5, uxtw
	b	.L1042
	.p2align 3
.L1047:
	ldr	w3, [x19, 12]
	cmp	w3, 127
	bhi	.L1049
	add	x20, x20, 458752
	ldr	x1, .LC189
	add	x0, x20, 336
	mov	w21, 0
	str	w3, [x20, 332]
	ldr	x3, [x1, 104]
	ldrsw	x2, [x19, 12]
	ldr	x1, [x19, 40]
	blr	x3
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1046:
	ldr	x2, .LC186
	mov	w5, 128
	ldr	x1, .LC193
	mov	w0, 1
	add	x2, x2, 24
	mov	w21, -2
	bl	dprint_vfmw
	b	.L1035
	.p2align 3
.L1045:
	ldr	x2, .LC186
	mov	w0, 1
	ldr	x1, .LC191
	mov	w21, -2
	add	x2, x2, 24
	bl	dprint_vfmw
	b	.L1035
.L1049:
	ldr	x2, .LC186
	mov	w4, 128
	ldr	x1, .LC188
	mov	w21, -2
	add	x2, x2, 24
	bl	dprint_vfmw
	b	.L1035
.L1048:
	ldr	x2, .LC186
	mov	w21, -2
	ldr	x1, .LC191
	add	x2, x2, 24
	bl	dprint_vfmw
	b	.L1035
	.size	FillVC1ExtraData, .-FillVC1ExtraData
	.align	3
.LC186:
	.xword	.LANCHOR4
	.align	3
.LC188:
	.xword	.LC187
	.align	3
.LC189:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC191:
	.xword	.LC190
	.align	3
.LC193:
	.xword	.LC192
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FillDIVX3ExtraData
	.type	FillDIVX3ExtraData, %function
FillDIVX3ExtraData:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	ldr	w2, [x19, 12]
	ldr	w4, [x19, 80]
	add	w3, w2, 8
	cmp	w3, w4
	bhi	.L1053
	ldr	x20, .LC197
	sxtw	x2, w2
	ldr	x1, [x19, 40]
	ldr	x3, [x20, 112]
	add	x0, x1, 8
	blr	x3
	ldr	x3, [x20, 104]
	mov	x2, 4
	ldr	x0, [x19, 40]
	add	x1, x19, 84
	blr	x3
	ldr	x0, [x19, 40]
	mov	x2, 4
	ldr	x3, [x20, 104]
	add	x1, x19, 88
	add	x0, x0, x2
	blr	x3
	ldr	w1, [x19, 12]
	mov	w0, 0
	add	w1, w1, 8
	str	w1, [x19, 12]
.L1052:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1053:
	ldr	x2, .LC194
	mov	w0, 1
	ldr	x1, .LC196
	add	x2, x2, 48
	bl	dprint_vfmw
	mov	w0, -2
	b	.L1052
	.size	FillDIVX3ExtraData, .-FillDIVX3ExtraData
	.align	3
.LC194:
	.xword	.LANCHOR4
	.align	3
.LC196:
	.xword	.LC195
	.align	3
.LC197:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FillREAL8ExtraData
	.type	FillREAL8ExtraData, %function
FillREAL8ExtraData:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 76]
	tbz	x0, 7, .L1055
	ldr	w3, [x19, 12]
	cmp	w3, 127
	bhi	.L1059
	add	x20, x20, 458752
	ldr	x1, .LC200
	add	x0, x20, 336
	str	w3, [x20, 332]
	ldr	x3, [x1, 104]
	ldr	w2, [x19, 12]
	ldr	x1, [x19, 40]
	blr	x3
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1055:
	add	x20, x20, 458752
	ldr	w2, [x19, 12]
	ldr	w4, [x19, 80]
	ldr	w0, [x20, 332]
	add	w3, w2, w0
	cmp	w3, w4
	bhi	.L1060
	ldr	x21, .LC200
	sxtw	x2, w2
	ldr	x1, [x19, 40]
	ldr	x3, [x21, 112]
	add	x0, x1, x0, uxtw
	blr	x3
	ldr	w2, [x20, 332]
	add	x1, x20, 336
	ldr	x0, [x19, 40]
	ldr	x3, [x21, 104]
	blr	x3
	ldr	w2, [x19, 12]
	mov	w0, 0
	ldr	w1, [x20, 332]
	add	w1, w2, w1
	str	w1, [x19, 12]
.L1057:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1060:
	ldr	x2, .LC198
	mov	w0, 1
	ldr	x1, .LC202
	add	x2, x2, 72
	bl	dprint_vfmw
	mov	w0, -2
	b	.L1057
	.p2align 3
.L1059:
	ldr	x2, .LC198
	mov	w4, 128
	ldr	x1, .LC199
	mov	w0, 1
	add	x2, x2, 72
	bl	dprint_vfmw
	mov	w0, -2
	b	.L1057
	.size	FillREAL8ExtraData, .-FillREAL8ExtraData
	.align	3
.LC198:
	.xword	.LANCHOR4
	.align	3
.LC199:
	.xword	.LC187
	.align	3
.LC200:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC202:
	.xword	.LC201
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FillExtraData
	.type	FillExtraData, %function
FillExtraData:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	w19, 31, 2, ne
	bhi	.L1067
	ldr	w3, [x20, 12]
	cmp	w3, wzr
	ble	.L1070
	ldr	x0, .LC206
	add	x19, x0, x19, sxtw 4
	ldr	x0, [x19, 104]
	ldr	w1, [x0, 20]
	cmp	w1, 5
	beq	.L1064
	cmp	w1, 8
	beq	.L1065
	cmp	w1, 1
	beq	.L1071
	mov	w0, 0
.L1062:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1065:
	mov	x1, x20
	bl	FillREAL8ExtraData
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1064:
	mov	x1, x20
	bl	FillDIVX3ExtraData
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1071:
	mov	x1, x20
	bl	FillVC1ExtraData
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1067:
	mov	w0, -1
	b	.L1062
.L1070:
	ldr	x2, .LC203
	mov	w0, 1
	ldr	x1, .LC205
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1062
	.size	FillExtraData, .-FillExtraData
	.align	3
.LC203:
	.xword	.LANCHOR4
	.align	3
.LC205:
	.xword	.LC204
	.align	3
.LC206:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseRawStreamData
	.type	ReleaseRawStreamData, %function
ReleaseRawStreamData:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w22, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	mov	w0, w22
	bl	VCTRL_GetStreamInterface
	ldr	x19, .LC207
	mov	x20, x0
	mov	x2, 24
	mov	w1, 0
	add	x0, x29, 72
	ldr	x3, [x19, 96]
	blr	x3
	cbz	x20, .L1088
	ldr	x3, [x19, 104]
	mov	x2, 24
	mov	x1, x20
	add	x0, x29, 72
	blr	x3
	mov	x2, 96
	ldr	x3, [x19, 104]
	mov	x1, x21
	add	x0, x29, x2
	sxtw	x21, w22
	blr	x3
	ldr	x23, .LC210
	ldr	x0, [x20, 16]
	cbz	x0, .L1075
	lsl	x20, x21, 4
	add	x24, x23, 104
	ldr	x0, [x24, x20]
	ldr	w0, [x0, 60]
	cmp	w0, 1
	beq	.L1089
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	ldr	x2, [x19, 48]
	mov	w1, w22
	mov	w0, 1
	blr	x2
	ldr	x0, [x24, x20]
	cbz	x0, .L1080
	ldr	w0, [x29, 72]
	add	x1, x29, 96
	ldr	x2, [x29, 88]
	blr	x2
	mov	w20, w0
.L1078:
	ldr	x2, [x19, 56]
	mov	w0, 1
	mov	w1, w22
	blr	x2
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
	cbz	w20, .L1079
.L1075:
	mov	w20, -7
.L1079:
	add	x21, x23, x21, lsl 4
	mov	w0, w20
	ldr	x1, [x21, 104]
	cbz	x1, .L1090
.L1074:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1089:
	ldr	w0, [x29, 72]
	add	x1, x29, 96
	ldr	x2, [x29, 88]
	blr	x2
	mov	w20, w0
	cbz	w20, .L1079
	b	.L1075
	.p2align 3
.L1080:
	mov	w20, -7
	b	.L1078
.L1088:
	ldr	x1, .LC209
	mov	w2, w22
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -7
	b	.L1074
.L1090:
	ldr	x1, .LC212
	mov	w3, w22
	mov	w2, 4122
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -7
	b	.L1074
	.size	ReleaseRawStreamData, .-ReleaseRawStreamData
	.align	3
.LC207:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC209:
	.xword	.LC208
	.align	3
.LC210:
	.xword	.LANCHOR0
	.align	3
.LC212:
	.xword	.LC211
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DeleteRawPacketInBuffer
	.type	DeleteRawPacketInBuffer, %function
DeleteRawPacketInBuffer:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w23, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w23, 31
	bhi	.L1103
	ldr	x28, .LC214
	sxtw	x0, w23
	add	x1, x28, x0, lsl 4
	ldr	x27, [x1, 104]
	cbz	x27, .L1103
	cbz	w19, .L1107
.L1093:
	adds	x22, x27, 88
	beq	.L1103
	add	x1, x22, 98304
	ldr	w21, [x1]
	ldr	w20, [x1, 8]
	cmp	w21, w20
	blt	.L1108
.L1106:
	sub	w21, w21, w20
	cbz	w21, .L1103
	ldr	x25, .LC215
	add	x28, x28, 104
	ldr	x24, .LC216
	mov	w26, 0
	add	x25, x25, 112
	add	x28, x28, x0, lsl 4
	b	.L1097
	.p2align 3
.L1110:
	cmp	w26, w21
	beq	.L1109
.L1097:
	uxtw	x19, w20
	mov	x2, x25
	lsl	x0, x19, 2
	mov	x1, x24
	sub	x19, x0, x19
	mov	w0, 26
	lsl	x19, x19, 5
	add	w20, w20, 1
	add	x3, x27, x19
	add	w26, w26, 1
	and	w20, w20, 1023
	ldr	w4, [x3, 100]
	ldr	w3, [x3, 92]
	bl	dprint_vfmw
	add	x1, x22, x19
	mov	w0, w23
	bl	ReleaseRawStreamData
	ldr	x0, [x28]
	cmp	x27, x0
	ccmp	x0, xzr, 4, eq
	bne	.L1110
	mov	w0, -7
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1107:
	add	x1, x27, 458752
	ldr	w1, [x1, 256]
	cbnz	w1, .L1093
.L1103:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1108:
	add	w21, w21, 1024
	b	.L1106
	.p2align 3
.L1109:
	add	x22, x22, 98304
	ldr	w20, [x22, 8]
	add	w20, w20, w26
	cmp	w20, 1023
	ble	.L1111
	sub	w20, w20, #1024
	str	w20, [x22, 8]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1111:
	str	w20, [x22, 8]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.size	DeleteRawPacketInBuffer, .-DeleteRawPacketInBuffer
	.align	3
.LC214:
	.xword	.LANCHOR0
	.align	3
.LC215:
	.xword	.LANCHOR4
	.align	3
.LC216:
	.xword	.LC44
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_Reset
	.type	SM_Reset, %function
SM_Reset:
	stp	x29, x30, [sp, -304]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	cmp	w21, 31
	bhi	.L1124
	ldr	x27, .LC219
	sxtw	x23, w21
	add	x0, x27, x23, lsl 4
	ldr	x20, [x0, 104]
	cbz	x20, .L1114
	ldr	w0, [x27, 52]
	cmp	w21, w0
	bne	.L1116
	mov	w0, 0
	bl	SCDDRV_SetStateIdle.part.0
	ldr	x2, .LC223
	mov	w3, 1160
	ldr	x1, .LC225
	mov	w0, 22
	add	x2, x2, 136
	bl	dprint_vfmw
.L1116:
	ldr	x22, .LC222
	mov	x2, 80
	add	x1, x20, 8
	add	x0, x29, 96
	add	x19, x20, 458752
	add	x23, x27, x23, lsl 4
	ldr	x3, [x22, 104]
	add	x25, x19, 336
	blr	x3
	ldr	w24, [x19, 256]
	ldr	x3, [x22, 104]
	mov	x2, 128
	mov	x1, x25
	add	x0, x29, 176
	ldr	w26, [x19, 332]
	blr	x3
	ldr	x0, [x23, 104]
	cbz	x0, .L1117
	add	x0, x0, 458752
	ldr	w1, [x0, 256]
	cbnz	w1, .L1134
.L1117:
	adds	x0, x20, 88
	beq	.L1118
	add	x2, x0, 98304
	ldr	w1, [x2, 4]
	ldr	w2, [x2]
	sub	w1, w1, w2
	add	w2, w1, 1024
	cmp	w1, wzr
	csel	w1, w2, w1, lt
	bl	DeleteRawPacket
	mov	w1, 1
	mov	w0, w21
	bl	DeleteRawPacketInBuffer
	ldrsb	w23, [x19, 240]
	mov	x2, 16992
	ldr	x3, [x22, 96]
	mov	x0, x20
	movk	x2, 0x7, lsl 16
	mov	w1, 0
	blr	x3
.L1123:
	mov	w0, -1
	strh	w0, [x19, 468]
	strh	w0, [x19, 476]
	mov	x2, 88
	str	w0, [x19, 472]
	mov	w1, 0
	str	w0, [x19, 480]
	add	x0, x19, 256
	str	wzr, [x19, 484]
	sub	w24, w24, #1
	ldr	x3, [x22, 96]
	stp	wzr, wzr, [x0, 236]
	stp	wzr, wzr, [x0, 244]
	mov	w0, 1
	str	w0, [x19, 488]
	add	x0, x19, 512
	blr	x3
	str	w23, [x19, 240]
	mov	w0, 2
	mov	x2, -1
	add	x1, x29, 96
	str	x2, [x19, 280]
	str	w0, [x19, 316]
	mov	w0, w21
	bl	SM_Config
	str	w26, [x19, 332]
	cmp	w24, 1
	ldr	x3, [x22, 104]
	cset	w0, ls
	mov	x2, 128
	str	w0, [x19, 256]
	add	x1, x29, 176
	mov	x0, x25
	blr	x3
	mov	w0, 0
.L1131:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
	.p2align 3
.L1134:
	ldr	w1, [x0, 244]
	cmp	w1, wzr
	bgt	.L1117
	str	wzr, [x0, 256]
	b	.L1117
	.p2align 3
.L1118:
	ldr	x2, .LC223
	mov	w3, 1176
	ldr	x1, .LC227
	mov	w0, 22
	add	x2, x2, 136
	bl	dprint_vfmw
	mov	w1, 0
	mov	x0, 0
	bl	DeleteRawPacket
	mov	w1, 1
	mov	w0, w21
	bl	DeleteRawPacketInBuffer
	ldrsb	w23, [x19, 240]
	mov	x2, 16992
	ldr	x3, [x22, 96]
	mov	x0, x20
	movk	x2, 0x7, lsl 16
	mov	w1, 0
	blr	x3
	b	.L1123
	.p2align 3
.L1124:
	mov	w0, -1
	b	.L1131
.L1114:
	ldr	x1, .LC221
	mov	w2, 1150
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1131
	.size	SM_Reset, .-SM_Reset
	.align	3
.LC219:
	.xword	.LANCHOR0
	.align	3
.LC221:
	.xword	.LC220
	.align	3
.LC222:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC223:
	.xword	.LANCHOR4
	.align	3
.LC225:
	.xword	.LC224
	.align	3
.LC227:
	.xword	.LC226
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReadRawStreamData
	.type	ReadRawStreamData, %function
ReadRawStreamData:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	w23, w0
	mov	x0, x30
	mov	x24, x1
	sbfiz	x25, x23, 4, 32
	bl	_mcount
	ldr	x20, .LC228
	ldr	x22, .LC229
	mov	x2, 24
	add	x20, x20, 104
	mov	w1, 0
	add	x0, x29, 88
	ldr	x3, [x22, 96]
	ldr	x19, [x20, x25]
	blr	x3
	cbz	x19, .L1136
	mov	w0, w23
	bl	VCTRL_GetStreamInterface
	mov	x21, x0
	cbz	x0, .L1168
	ldr	x3, [x22, 104]
	mov	x2, 24
	add	x0, x29, 88
	mov	x1, x21
	blr	x3
	ldr	x0, [x21, 8]
	cbz	x0, .L1136
	ldr	w0, [x19, 60]
	cmp	w0, 1
	beq	.L1169
	ldr	x1, [x22, 32]
	mov	w0, 0
	blr	x1
	ldr	x2, [x29, 96]
	mov	x1, x24
	ldr	w0, [x29, 88]
	blr	x2
	mov	w21, w0
	ldr	x1, [x22, 24]
	mov	w0, 0
	blr	x1
	ldr	x0, [x20, x25]
	cmp	x19, x0
	ccmp	x0, xzr, 4, eq
	beq	.L1170
	cbz	w21, .L1142
.L1136:
	mov	w0, -7
.L1165:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1142:
	ldrb	w20, [x24, 1]
	cmp	w20, 1
	beq	.L1171
	ldr	w0, [x19, 60]
	cmp	w0, 1
	beq	.L1172
.L1144:
	add	x19, x19, 98304
	ldr	w1, [x24, 12]
	mov	w0, 0
	ldr	w2, [x19, 108]
	add	w1, w2, w1
	str	w1, [x19, 108]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1170:
	ldr	x1, .LC233
	mov	w3, w23
	mov	w2, 4027
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -7
	b	.L1165
	.p2align 3
.L1171:
	mov	x1, x24
	mov	w0, w23
	bl	FillEosRawStream
	cbnz	w0, .L1173
	mov	w1, w20
	mov	w0, w23
	bl	VCTRL_SetLastFrameState
	b	.L1144
	.p2align 3
.L1169:
	ldr	w0, [x29, 88]
	mov	x1, x24
	ldr	x2, [x29, 96]
	blr	x2
	mov	w21, w0
	cbz	w21, .L1142
	b	.L1136
	.p2align 3
.L1172:
	mov	x1, x24
	mov	w0, w23
	bl	FillExtraData
	cbnz	w0, .L1174
	add	x0, x19, 458752
	ldr	w0, [x0, 328]
	cbz	w0, .L1144
	ldrb	w0, [x24]
	cbnz	w0, .L1144
	mov	x1, x24
	mov	w0, w23
	bl	FillEopRawStream
	b	.L1144
	.p2align 3
.L1174:
	ldr	x1, .LC237
	mov	w2, w23
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x29, 88]
	mov	x1, x24
	bl	ReleaseRawStreamData
	cbz	w0, .L1136
	ldr	x1, .LC239
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -7
	b	.L1165
.L1168:
	ldr	x1, .LC231
	mov	w2, w23
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -7
	b	.L1165
.L1173:
	ldr	x1, .LC235
	mov	w2, w23
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -7
	b	.L1165
	.size	ReadRawStreamData, .-ReadRawStreamData
	.align	3
.LC228:
	.xword	.LANCHOR0
	.align	3
.LC229:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC231:
	.xword	.LC230
	.align	3
.LC233:
	.xword	.LC232
	.align	3
.LC235:
	.xword	.LC234
	.align	3
.LC237:
	.xword	.LC236
	.align	3
.LC239:
	.xword	.LC238
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FillRawData
	.type	FillRawData, %function
FillRawData:
	stp	x29, x30, [sp, -224]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	sxtw	x23, w0
	mov	x0, x30
	lsl	x21, x23, 4
	mov	x19, x23
	bl	_mcount
	ldr	x24, .LC242
	ldr	x0, .LC241
	mov	x2, 96
	mov	w1, 0
	add	x25, x0, 104
	ldr	x3, [x24, 96]
	add	x0, x29, 128
	ldr	x20, [x25, x21]
	blr	x3
	cbz	x20, .L1175
	ldr	w0, [x20, 20]
	cmp	w0, 20
	beq	.L1175
	lsl	w0, w23, 24
	str	w0, [x29, 108]
	ldr	x0, .LC250
	add	x22, x20, 475136
	stp	x21, x25, [x29, 112]
	add	x0, x0, 152
	ldr	x26, .LC244
	ldr	x27, .LC251
	ldr	x25, .LC246
	str	x0, [x29, 96]
	b	.L1189
	.p2align 3
.L1212:
	ldp	x1, x0, [x29, 112]
	ldr	x0, [x0, x1]
	cbz	x0, .L1179
	add	x0, x0, 88
	add	x1, x0, 98304
	ldp	w0, w2, [x1, 4]
	add	w0, w0, 1
	asr	w1, w0, 31
	lsr	w1, w1, 22
	add	w0, w0, w1
	and	w0, w0, 1023
	sub	w0, w0, w1
	cmp	w0, w2
	beq	.L1179
	add	x1, x29, 128
	mov	w0, w19
	bl	ReadRawStreamData
	cbnz	w0, .L1175
	add	x28, x20, 458752
	ldr	w0, [x29, 140]
	ldrb	w6, [x29, 128]
	ldr	x4, [x24]
	ldr	w3, [x28, 296]
	cmp	w6, 1
	ldr	w5, [x28, 320]
	cset	w21, ne
	ldr	w2, [x28, 324]
	add	w3, w3, w0
	add	w0, w5, w0
	str	w3, [x28, 296]
	add	w2, w2, 1
	str	w0, [x28, 320]
	str	w2, [x28, 324]
	str	w21, [x22, 600]
	blr	x4
	ldr	w2, [x28, 300]
	cbnz	w2, .L1181
	str	w0, [x28, 300]
.L1182:
	ldr	x2, [x29, 192]
	mov	x1, x26
	mov	w0, 29
	bl	dprint_vfmw
	ldr	w2, [x29, 132]
	mov	x1, x25
	ldr	w3, [x29, 140]
	mov	w0, 26
	bl	dprint_vfmw
	ldr	x1, [x29, 192]
	mov	x0, 4294967295
	cmp	x1, x0
	beq	.L1209
	add	x1, x29, 128
	mov	w0, w19
	bl	SCDDRV_InsertRawPacket
	cbnz	w0, .L1210
.L1184:
	mov	w1, 1
	strb	w1, [x20, 3]
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L1211
.L1186:
	add	x2, x29, 128
	mov	x1, x20
	mov	w0, w19
	bl	SCDDRV_SaveRawStream
	mov	w3, 1
	mov	w2, w21
	mov	x1, x20
	mov	w0, w19
	bl	NeedReadStream
	cbz	w0, .L1175
	ldr	x0, [x27, x23, lsl 3]
	add	x0, x0, 507904
	ldr	w0, [x0, 2076]
	cmp	w0, 1
	beq	.L1175
.L1189:
	ldr	w2, [x22, 600]
	mov	w3, 0
	mov	x1, x20
	mov	w0, w19
	bl	NeedReadStream
	cmp	w0, 1
	bne	.L1175
	cmp	w19, 31
	bls	.L1212
.L1179:
	ldr	x1, .LC253
	mov	w2, w19
	mov	w0, 23
	bl	dprint_vfmw
.L1175:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 224
	ret
	.p2align 3
.L1181:
	sub	w2, w0, w2
	cmp	w2, 2000
	bls	.L1182
	str	w0, [x28, 300]
	ldr	w0, [x28, 296]
	str	wzr, [x28, 296]
	lsl	w0, w0, 3
	udiv	w2, w0, w2
	lsl	w0, w2, 6
	sub	w0, w0, w2
	lsl	w0, w0, 1
	sub	w2, w0, w2
	ubfx	x2, x2, 7, 22
	str	w2, [x28, 304]
	b	.L1182
	.p2align 3
.L1211:
	ldr	x0, [x24]
	blr	x0
	ldr	x1, .LC241
	add	x2, x1, 632
	ldr	x1, .LC249
	ldr	w3, [x1]
	ldr	w1, [x2, x23, lsl 2]
	sub	w1, w0, w1
	cmp	w1, w3
	bls	.L1186
	str	w0, [x2, x23, lsl 2]
	mov	w1, 3435
	ldr	w2, [x29, 108]
	ldr	x0, [x29, 96]
	bl	DBG_AddTrace
	b	.L1186
	.p2align 3
.L1209:
	mov	x0, -1
	add	x1, x29, 128
	str	x0, [x29, 192]
	mov	w0, w19
	bl	SCDDRV_InsertRawPacket
	cbz	w0, .L1184
.L1210:
	ldr	x1, .LC248
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 224
	ret
	.size	FillRawData, .-FillRawData
	.align	3
.LC241:
	.xword	.LANCHOR0
	.align	3
.LC242:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC244:
	.xword	.LC243
	.align	3
.LC246:
	.xword	.LC245
	.align	3
.LC248:
	.xword	.LC247
	.align	3
.LC249:
	.xword	g_TraceBsPeriod
	.align	3
.LC250:
	.xword	.LANCHOR4
	.align	3
.LC251:
	.xword	s_pstVfmwChan
	.align	3
.LC253:
	.xword	.LC252
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseSegArrayPackets
	.type	ReleaseSegArrayPackets, %function
ReleaseSegArrayPackets:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	mov	w21, w2
	bl	_mcount
	cmp	w19, 4096
	beq	.L1218
	cmp	w19, w21
	beq	.L1218
	mov	w24, 0
	add	x23, x20, 360448
	mov	w22, 2
	.p2align 2
.L1216:
	sxtw	x3, w19
	mov	w1, w19
	lsl	x2, x3, 2
	mov	x0, x20
	sub	x2, x2, x3
	lsl	x2, x2, 2
	sub	x2, x2, x3
	add	x2, x20, x2, lsl 3
	strb	w22, [x2, 16]
	ldr	w4, [x2, 28]
	ldp	w3, w2, [x23, 44]
	subs	w3, w3, w4
	csel	w3, w3, wzr, pl
	subs	w2, w2, #1
	csel	w2, w2, wzr, pl
	stp	w3, w2, [x23, 44]
	bl	ReleaseStreamSeg
	cmp	w0, wzr
	add	w1, w19, 1
	csinc	w24, w24, w24, ne
	asr	w19, w1, 31
	lsr	w19, w19, 20
	add	w1, w1, w19
	and	w1, w1, 4095
	sub	w19, w1, w19
	cmp	w21, w19
	bne	.L1216
	mov	w0, w24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1218:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	ReleaseSegArrayPackets, .-ReleaseSegArrayPackets
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_SeekPtsInSegArray
	.type	SM_SeekPtsInSegArray, %function
SM_SeekPtsInSegArray:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	add	x19, x21, 98304
	mov	x22, x1
	add	x27, x19, 112
	bl	_mcount
	add	x26, x27, 360448
	mov	w20, 0
	ldp	x28, x23, [x22]
	mov	x25, x27
	ldp	w24, w3, [x26, 8]
	str	w24, [x26, 16]
	.p2align 2
.L1221:
	cmp	w24, w3
	beq	.L1222
.L1247:
	sxtw	x1, w24
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	add	x0, x25, x0, lsl 3
	ldrsb	w1, [x0, 16]
	cbz	w1, .L1244
	cmp	w1, 2
	beq	.L1246
	ldr	x0, [x0, 48]
	cmn	x0, #1
	beq	.L1244
	cmp	x28, x0
	bls	.L1228
	add	w0, w24, 1
	str	w24, [x26, 16]
.L1243:
	asr	w24, w0, 31
	lsr	w24, w24, 20
	add	w0, w0, w24
	and	w0, w0, 4095
	sub	w24, w0, w24
	cmp	w24, w3
	bne	.L1247
.L1222:
	add	x1, x19, 112
	mov	w2, w24
	add	x1, x1, 360448
	mov	x0, x27
	ldr	w1, [x1, 8]
	bl	ReleaseSegArrayPackets
	add	w1, w20, w0
	ldr	w2, [x21, 4]
	cbz	w2, .L1236
	add	x0, x21, 88
	bl	DeleteRawPacket
.L1236:
	mov	w0, -2
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1244:
	add	w0, w24, 1
	b	.L1243
	.p2align 3
.L1228:
	beq	.L1248
	bcs	.L1221
	add	x4, x25, 360448
	ldr	w3, [x4, 16]
	sxtw	x2, w3
	lsl	x1, x2, 2
	sub	x1, x1, x2
	lsl	x1, x1, 2
	sub	x1, x1, x2
	add	x25, x25, x1, lsl 3
	ldr	x1, [x25, 48]
	cmn	x1, #1
	beq	.L1249
	cmp	x28, x1
	bls	.L1238
	sub	x28, x28, x1
	cmp	x23, x28
	bcs	.L1238
	add	x2, x19, 112
	mov	x1, x0
	add	x0, x2, 360448
	str	w24, [x0, 16]
.L1232:
	str	x1, [x22]
.L1230:
	add	x1, x19, 112
	mov	w2, w24
	add	x1, x1, 360448
	mov	x0, x27
	ldr	w1, [x1, 8]
	bl	ReleaseSegArrayPackets
	ldr	w2, [x21, 4]
	cbnz	w2, .L1250
	mov	w0, 0
.L1251:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1246:
	mov	w1, w24
	mov	x0, x27
	bl	ReleaseStreamSeg
	cmp	w0, wzr
	add	w1, w24, 1
	csinc	w20, w20, w20, ne
	asr	w24, w1, 31
	ldr	w3, [x26, 12]
	lsr	w24, w24, 20
	add	w1, w1, w24
	and	w1, w1, 4095
	sub	w24, w1, w24
	b	.L1221
.L1238:
	mov	w24, w3
	b	.L1232
.L1248:
	str	x28, [x22]
	b	.L1230
.L1249:
	mov	x1, x0
	str	w24, [x4, 16]
	b	.L1232
.L1250:
	add	w1, w20, w0
	add	x0, x21, 88
	bl	DeleteRawPacket
	mov	w0, 0
	b	.L1251
	.size	SM_SeekPtsInSegArray, .-SM_SeekPtsInSegArray
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_SeekPtsInRawArray
	.type	SM_SeekPtsInRawArray, %function
SM_SeekPtsInRawArray:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w2
	mov	x21, x1
	mov	w22, w3
	bl	_mcount
	ldr	x0, .LC257
	add	x0, x0, x19, sxtw 4
	ldr	x9, [x0, 104]
	cbz	x9, .L1273
	add	x7, x20, 98304
	ldr	w1, [x7]
	tbnz	w1, #31, .L1273
	ldr	w6, [x7, 4]
	tbnz	w6, #31, .L1273
	cmp	w22, 1
	mov	w3, w1
	mov	w10, 0
	ldp	x8, x11, [x21]
	beq	.L1286
.L1254:
	mov	w1, w3
	str	w3, [x7, 8]
	.p2align 2
.L1255:
	sxtw	x5, w1
	add	w0, w1, 1
	asr	w4, w0, 31
	lsl	x2, x5, 2
	sub	x2, x2, x5
	lsr	w4, w4, 22
	cmp	w1, w6
	add	w0, w0, w4
	add	x2, x20, x2, lsl 5
	and	w0, w0, 1023
	beq	.L1287
	ldr	x2, [x2, 64]
	cmn	x2, #1
	beq	.L1288
	cmp	x8, x2
	bls	.L1261
	str	w1, [x7, 8]
	sub	w1, w0, w4
	b	.L1255
	.p2align 3
.L1288:
	add	w0, w1, 1
	asr	w1, w0, 31
	lsr	w1, w1, 22
	add	w0, w0, w1
	and	w0, w0, 1023
	sub	w1, w0, w1
	b	.L1255
	.p2align 3
.L1287:
	cmp	w3, w1
	bgt	.L1289
.L1282:
	sub	w1, w1, w3
	str	w3, [x7, 8]
	mov	x0, x20
	bl	DeleteRawPacket
	mov	w1, 0
	mov	w0, w19
	bl	DeleteRawPacketInBuffer
	mov	w0, -2
.L1253:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1289:
	add	w1, w1, 1024
	b	.L1282
	.p2align 3
.L1261:
	beq	.L1290
	ldr	w0, [x7, 8]
	sxtw	x4, w0
	lsl	x2, x4, 2
	sub	x2, x2, x4
	add	x2, x20, x2, lsl 5
	ldr	x2, [x2, 64]
	cmn	x2, #1
	beq	.L1284
	cmp	x8, x2
	bls	.L1267
	sub	x8, x8, x2
	cmp	x11, x8
	bcs	.L1267
.L1284:
	mov	w0, w1
	str	w1, [x7, 8]
.L1267:
	cmp	w3, w0
	sub	w1, w0, w3
	bgt	.L1291
.L1269:
	cmp	w22, 1
	beq	.L1292
.L1270:
	sxtw	x2, w0
	mov	x0, x20
	lsl	x3, x2, 2
	sub	x2, x3, x2
	add	x20, x20, x2, lsl 5
.L1285:
	ldr	x2, [x20, 64]
	str	x2, [x21]
	ldr	w2, [x7]
	str	w2, [x7, 8]
	bl	DeleteRawPacket
	mov	w1, 0
	mov	w0, w19
	bl	DeleteRawPacketInBuffer
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1286:
	add	x0, x9, 458752
	ldr	w10, [x0, 176]
	cmp	w10, 1
	bne	.L1254
	mov	w1, 3
	str	w1, [x0, 176]
	ldp	w3, w6, [x7]
	b	.L1254
	.p2align 3
.L1291:
	add	w1, w0, 1024
	sub	w1, w1, w3
	b	.L1269
.L1290:
	cmp	w1, w3
	bge	.L1283
	add	w1, w1, 1024
.L1283:
	cmp	w22, 1
	sub	w1, w1, w3
	beq	.L1293
.L1265:
	lsl	x0, x5, 2
	sub	x5, x0, x5
	mov	x0, x20
	add	x20, x20, x5, lsl 5
	b	.L1285
.L1292:
	add	x9, x9, 458752
	ldr	w2, [x9, 168]
	cmp	w1, w2
	ccmp	w10, 1, 0, le
	bne	.L1270
	str	w10, [x9, 176]
	ldr	w0, [x7, 8]
	b	.L1270
.L1293:
	add	x9, x9, 458752
	ldr	w0, [x9, 168]
	cmp	w1, w0
	ccmp	w10, 1, 0, le
	bne	.L1265
	str	w10, [x9, 176]
	b	.L1265
.L1273:
	mov	w0, -1
	b	.L1253
	.size	SM_SeekPtsInRawArray, .-SM_SeekPtsInRawArray
	.align	3
.LC257:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_SeekPtsAfterFillNewRaw
	.type	SM_SeekPtsAfterFillNewRaw, %function
SM_SeekPtsAfterFillNewRaw:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w2
	mov	x21, x1
	bl	_mcount
	mov	w1, 0
	mov	w0, w19
	bl	DeleteRawPacketInBuffer
	mov	w0, w19
	bl	FillRawData
	mov	w2, w19
	mov	x1, x21
	mov	w3, 0
	mov	x0, x20
	bl	SM_SeekPtsInRawArray
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	SM_SeekPtsAfterFillNewRaw, .-SM_SeekPtsAfterFillNewRaw
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_SeekPts
	.type	SM_SeekPts, %function
SM_SeekPts:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w22, w0
	mov	x0, x30
	mov	x23, x1
	bl	_mcount
	cmp	x23, xzr
	ccmp	w22, 31, 2, ne
	bhi	.L1308
	ldr	x0, .LC258
	add	x0, x0, x22, sxtw 4
	ldr	x20, [x0, 104]
	cbz	x20, .L1308
	mov	x1, x23
	mov	x0, x20
	bl	SM_SeekPtsInSegArray
	cbnz	w0, .L1297
.L1298:
	mov	w0, 0
.L1296:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1297:
	mov	w1, 0
	mov	w0, w22
	add	x20, x20, 88
	bl	DeleteRawPacketInBuffer
	mov	w3, 1
	mov	w2, w22
	mov	x1, x23
	mov	x0, x20
	bl	SM_SeekPtsInRawArray
	cbz	w0, .L1298
	add	x1, x20, 98304
	ldp	w3, w0, [x1]
	cmp	w3, w0
	bgt	.L1318
.L1317:
	sub	w3, w0, w3
	ldr	x2, [x23, 16]
	sxtw	x3, w3
	cmp	x3, x2
	bcs	.L1319
	sub	x3, x2, x3
	and	x0, x3, 1023
	lsr	x21, x3, 10
	cbnz	x0, .L1320
.L1303:
	add	w21, w21, 1
	mov	w19, 0
	cmp	w21, wzr
	bgt	.L1313
	b	.L1306
	.p2align 3
.L1321:
	cmp	w19, w21
	beq	.L1306
.L1313:
	mov	w2, w22
	mov	x1, x23
	mov	x0, x20
	add	w19, w19, 1
	bl	SM_SeekPtsAfterFillNewRaw
	cbnz	w0, .L1321
	b	.L1298
	.p2align 3
.L1318:
	add	w0, w0, 1024
	b	.L1317
	.p2align 3
.L1320:
	add	w21, w21, 1
	b	.L1303
	.p2align 3
.L1306:
	mov	w0, -2
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1308:
	mov	w0, -1
	b	.L1296
.L1319:
	ldr	x1, .LC260
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -2
	b	.L1296
	.size	SM_SeekPts, .-SM_SeekPts
	.align	3
.LC258:
	.xword	.LANCHOR0
	.align	3
.LC260:
	.xword	.LC259
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_MoveRawData
	.type	SM_MoveRawData, %function
SM_MoveRawData:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x24, x20, 98304
	bl	_mcount
	ldr	w4, [x20, 72]
	ldr	w0, [x24, 92]
	add	w1, w0, 1023
	subs	w22, w0, #1
	csel	w22, w1, w22, mi
	add	w1, w0, 1022
	subs	w0, w0, #2
	csel	w0, w1, w0, mi
	sxtw	x2, w22
	lsl	x1, x2, 2
	sxtw	x0, w0
	sub	x1, x1, x2
	lsl	x21, x0, 2
	lsl	x1, x1, 5
	sub	x0, x21, x0
	add	x23, x20, x1
	add	x19, x23, 88
	add	x21, x20, x0, lsl 5
	ldr	w2, [x23, 100]
	ldr	w0, [x21, 100]
	add	w1, w0, w2
	cmp	w1, w4
	bgt	.L1325
	ldr	x1, .LC261
	sxtw	x2, w2
	ldr	x3, [x21, 128]
	add	x20, x20, 458752
	add	x0, x3, x0, sxtw
	ldr	x3, [x1, 104]
	ldr	x1, [x23, 128]
	blr	x3
	ldr	w2, [x21, 100]
	mov	x1, x19
	ldr	w0, [x23, 100]
	add	w0, w2, w0
	str	w0, [x21, 100]
	ldr	w0, [x20, 240]
	bl	ReleaseRawStreamData
	str	w22, [x24, 92]
	mov	w0, 0
.L1326:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1325:
	ldr	x1, .LC263
	mov	w3, w2
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -7
	b	.L1326
	.size	SM_MoveRawData, .-SM_MoveRawData
	.align	3
.LC261:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC263:
	.xword	.LC262
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_ProcessSegFull
	.type	SCDDRV_ProcessSegFull, %function
SCDDRV_ProcessSegFull:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	add	x21, x22, 98304
	bl	_mcount
	adds	x23, x21, 112
	beq	.L1341
	add	x0, x23, 360448
	ldp	w24, w25, [x0, 44]
.L1328:
	add	x19, x21, 112
	ldrsb	w0, [x22, 1]
	add	x19, x19, 360448
	ldr	w20, [x19, 28]
	cbnz	w0, .L1329
	add	w20, w20, w20, lsr 31
	mov	w0, 127
	asr	w20, w20, 1
	cmp	w20, w24
	ccmp	w25, w0, 0, gt
	ble	.L1352
.L1327:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1329:
	ldr	x0, .LC264
	ldr	x0, [x0]
	blr	x0
	add	x1, x22, 458752
	ldr	w2, [x1, 272]
	cmp	w0, w2
	bls	.L1332
	sub	w2, w0, w2
	str	w2, [x1, 268]
	cmp	w2, 1000
	ble	.L1327
	cmp	w20, wzr
	add	w0, w20, 3
	csel	w20, w0, w20, lt
	mov	w0, 63
	asr	w20, w20, 2
	cmp	w20, w24
	ccmp	w25, w0, 0, gt
	bgt	.L1327
	cbnz	w24, .L1335
	ldr	w0, [x1, 496]
	cbz	w0, .L1335
	cbz	x23, .L1342
	ldp	w25, w0, [x19, 8]
	sub	w25, w0, w25
	and	w25, w25, 4095
	cmp	w25, 2
	mov	w24, w25
	bls	.L1337
	mov	w24, 43691
	movk	w24, 0xaaaa, lsl 16
	umull	x24, w25, w24
	lsr	x24, x24, 32
	lsr	w24, w24, 1
.L1337:
	add	x19, x21, 112
	mov	w20, 0
	add	x19, x19, 360448
	cbz	w24, .L1336
	.p2align 2
.L1348:
	ldr	w1, [x19, 8]
	mov	x0, x23
	add	w1, w20, w1
	add	w20, w20, 1
	bl	ReleaseStreamSeg
	cmp	w24, w20
	bne	.L1348
.L1336:
	ldr	x1, .LC266
	mov	w3, w25
	mov	w2, w24
	mov	w0, 0
	bl	dprint_vfmw
.L1339:
	strb	wzr, [x22, 1]
	strb	wzr, [x22]
	b	.L1327
	.p2align 3
.L1332:
	str	wzr, [x1, 268]
	str	w0, [x1, 272]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1341:
	mov	w24, 0
	mov	w25, 0
	b	.L1328
	.p2align 3
.L1352:
	ldr	x0, .LC264
	mov	w1, 1
	strb	w1, [x22, 1]
	add	x22, x22, 458752
	ldr	x0, [x0]
	blr	x0
	str	wzr, [x22, 268]
	str	w0, [x22, 272]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1335:
	ldr	x1, .LC268
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	mov	x0, x23
	bl	ReleaseStreamSeg
	b	.L1339
.L1342:
	mov	w25, 0
	mov	w24, 0
	b	.L1336
	.size	SCDDRV_ProcessSegFull, .-SCDDRV_ProcessSegFull
	.align	3
.LC264:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC266:
	.xword	.LC265
	.align	3
.LC268:
	.xword	.LC267
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_CanNotSelectInst
	.type	SCDDRV_CanNotSelectInst, %function
SCDDRV_CanNotSelectInst:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC269
	add	x19, x0, x19, sxtw 4
	ldr	x1, [x19, 104]
	cbz	x1, .L1356
	add	x0, x1, 458752
	ldr	w2, [x0, 256]
	cbz	w2, .L1356
	ldr	w0, [x0, 248]
	cmp	w0, 1
	beq	.L1356
	ldr	w0, [x1, 20]
	ldr	x2, [x1, 36]
	ldr	w1, [x1, 44]
	cmp	w0, 19
	str	x2, [x29, 32]
	str	w1, [x29, 40]
	beq	.L1356
	add	x1, x29, 32
	bl	SCDDRV_IsSCDByPass
	uxtb	w0, w0
	cmp	w0, wzr
	ldr	x19, [sp, 16]
	cset	w0, ne
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1356:
	ldr	x19, [sp, 16]
	mov	w0, 1
	ldp	x29, x30, [sp], 48
	ret
	.size	SCDDRV_CanNotSelectInst, .-SCDDRV_CanNotSelectInst
	.align	3
.LC269:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	SM_DoNextInstance.part.13, %function
SM_DoNextInstance.part.13:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w21, w0
	mov	x0, x30
	str	x1, [x29, 104]
	mov	w20, 32
	bl	_mcount
	ldr	x25, .LC270
	sxtw	x0, w21
	ldr	x23, .LC271
	lsl	x1, x0, 6
	ldr	x24, .LC272
	add	x0, x1, x0, lsl 3
	add	x22, x25, 104
	add	x0, x25, x0
	ldr	w19, [x0, 52]
	b	.L1374
	.p2align 3
.L1367:
	subs	w20, w20, #1
	beq	.L1381
.L1374:
	add	w0, w19, 1
	mov	w1, w21
	asr	w19, w0, 31
	lsr	w19, w19, 27
	add	w0, w0, w19
	and	w0, w0, 31
	sub	w19, w0, w19
	mov	w0, w19
	bl	SCDDRV_CanNotSelectInst
	uxtb	w0, w0
	cbnz	w0, .L1367
	sxtw	x28, w19
	ldr	x0, [x23]
	lsl	x1, x28, 4
	ldr	x27, [x22, x1]
	blr	x0
	add	x26, x27, 458752
	ldr	w1, [x26, 312]
	subs	w1, w0, w1
	bmi	.L1382
	ldrsh	w2, [x27, 2]
	cmp	w2, 1
	beq	.L1383
.L1369:
	str	w0, [x26, 312]
	ldrsb	w0, [x27]
	cmp	w0, 1
	beq	.L1384
.L1371:
	strb	wzr, [x27, 1]
.L1372:
	ldr	x2, [x24, x28, lsl 3]
	mov	w1, w21
	mov	x0, x27
	add	x2, x2, 507904
	ldr	w2, [x2, 2064]
	str	w2, [x26, 464]
	bl	CutStreamWithSCD
	cmn	w0, #6
	cset	w1, eq
	strb	w1, [x27]
	cbnz	w0, .L1367
	ldr	x0, [x29, 104]
	add	x2, x25, 760
	ldr	x3, .LC273
	mov	w1, 1
	add	x2, x2, x28, lsl 2
	mov	w4, 4623
	str	w19, [x0]
	add	x3, x3, 168
	mov	w0, w19
	str	w1, [x26, 256]
	bl	RecordPOS
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1382:
	str	w0, [x26, 312]
	ldrsh	w1, [x27, 2]
	cmp	w1, 1
	beq	.L1367
	str	w0, [x26, 312]
	ldrsb	w0, [x27]
	cmp	w0, 1
	bne	.L1371
.L1384:
	mov	x0, x27
	bl	SCDDRV_ProcessSegFull
	b	.L1372
	.p2align 3
.L1383:
	cmp	w1, 499
	bhi	.L1369
	subs	w20, w20, #1
	bne	.L1374
.L1381:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, -3
	ldp	x29, x30, [sp], 112
	ret
	.size	SM_DoNextInstance.part.13, .-SM_DoNextInstance.part.13
	.align	3
.LC270:
	.xword	.LANCHOR0
	.align	3
.LC271:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC272:
	.xword	s_pstVfmwChan
	.align	3
.LC273:
	.xword	.LANCHOR4
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	SCDDRV_ActivateSCD.part.14, %function
SCDDRV_ActivateSCD.part.14:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC276
	add	x1, x20, x19, lsl 2
	ldr	w0, [x1, 616]
	cbz	w0, .L1386
	cmp	w0, 1
	beq	.L1390
.L1385:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1386:
	add	x1, x29, 60
	mov	w0, w19
	bl	SM_DoNextInstance.part.13
	cbnz	w0, .L1385
	lsl	x0, x19, 6
	ldr	w1, [x29, 60]
	add	x0, x0, x19, lsl 3
	add	x0, x20, x0
	str	w1, [x0, 52]
	cbnz	w19, .L1388
	mov	w0, 1
	str	w0, [x20, 56]
.L1388:
	ldr	x0, .LC277
	ldr	x0, [x0]
	blr	x0
	lsl	x1, x19, 6
	ldr	x2, .LC278
	add	x19, x1, x19, lsl 3
	ldr	x1, .LC280
	add	x19, x20, x19
	mov	w3, 4842
	add	x2, x2, 192
	str	w0, [x19, 60]
	mov	w0, 26
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1390:
	mov	w0, 2
	str	w0, [x1, 616]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	SCDDRV_ActivateSCD.part.14, .-SCDDRV_ActivateSCD.part.14
	.align	3
.LC276:
	.xword	.LANCHOR0
	.align	3
.LC277:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC278:
	.xword	.LANCHOR4
	.align	3
.LC280:
	.xword	.LC279
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_DoNextInstance
	.type	SM_DoNextInstance, %function
SM_DoNextInstance:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x2, .LC281
	add	x2, x2, x19, sxtw 2
	ldr	w0, [x2, 616]
	cbz	w0, .L1392
	cmp	w0, 1
	mov	w0, -3
	beq	.L1395
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1392:
	mov	x1, x20
	mov	w0, w19
	bl	SM_DoNextInstance.part.13
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1395:
	mov	w1, 2
	str	w1, [x2, 616]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SM_DoNextInstance, .-SM_DoNextInstance
	.align	3
.LC281:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_RecordGlobalState
	.type	SCDDRV_RecordGlobalState, %function
SCDDRV_RecordGlobalState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC282
	ldr	x0, [x0]
	blr	x0
	ldr	x4, .LC283
	sxtw	x1, w19
	add	x3, x4, x1, lsl 6
	ldr	w2, [x3, 52]
	cbz	w2, .L1396
	ldr	w6, [x3, 48]
	add	w5, w6, 49152
	add	w5, w5, 848
	cmp	w2, w5
	bhi	.L1399
	ldr	w3, [x3, 56]
.L1400:
	add	x1, x4, x1, lsl 6
	sub	w2, w0, w2
	sub	w0, w0, w6
	add	w2, w2, w3
	cmp	w0, 999
	stp	wzr, w2, [x1, 52]
	bls	.L1396
	lsl	w3, w2, 6
	str	wzr, [x1, 48]
	sub	w3, w3, w2
	lsl	w3, w3, 1
	sub	w2, w3, w2
	lsl	w2, w2, 3
	udiv	w0, w2, w0
	str	w0, [x1, 60]
.L1396:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1399:
	str	w2, [x3, 48]
	mov	w6, w2
	mov	w3, 0
	b	.L1400
	.size	SCDDRV_RecordGlobalState, .-SCDDRV_RecordGlobalState
	.align	3
.LC282:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC283:
	.xword	g_VfmwGlobalStat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_MoveRawByOmxPath
	.type	SCDDRV_MoveRawByOmxPath, %function
SCDDRV_MoveRawByOmxPath:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC284
	add	x19, x0, x19, sxtw 4
	ldr	x19, [x19, 104]
	ldr	w0, [x19, 60]
	cmp	w0, 1
	beq	.L1412
.L1402:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1412:
	adds	x1, x19, 88
	beq	.L1405
	add	x1, x1, 98304
	ldr	w0, [x1, 4]
	ldr	w1, [x1]
	sub	w0, w0, w1
	add	w1, w0, 1024
	cmp	w0, wzr
	csel	w0, w1, w0, lt
.L1408:
	ldrsb	w20, [x19, 2]
	cmp	w20, 1
	bne	.L1402
	ldr	w1, [x19, 68]
	cmp	w1, w0
	bne	.L1402
	mov	x0, x19
	bl	SM_MoveRawData
	cbz	w0, .L1402
	ldr	x1, .LC286
	mov	w0, w20
	add	x19, x19, 458752
	bl	dprint_vfmw
	ldr	w0, [x19, 240]
	bl	SM_Reset
	b	.L1402
	.p2align 3
.L1405:
	ldr	x1, .LC288
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1408
	.size	SCDDRV_MoveRawByOmxPath, .-SCDDRV_MoveRawByOmxPath
	.align	3
.LC284:
	.xword	.LANCHOR0
	.align	3
.LC286:
	.xword	.LC285
	.align	3
.LC288:
	.xword	.LC287
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_SCDIntServeProc
	.type	SM_SCDIntServeProc, %function
SM_SCDIntServeProc:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbz	w19, .L1431
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1431:
	ldr	x20, .LC289
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	ldr	x19, .LC290
	ldr	w0, [x19, 96]
	add	w0, w0, 2112
	bl	MEM_ReadPhyWord
	tbnz	x0, 0, .L1432
.L1415:
	ldr	x0, .LC292
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L1424
	mov	w1, 0
	mov	w0, 0
	bl	VDH_Notify_ModuleIdle
.L1424:
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1432:
	ldr	w0, [x19, 96]
	mov	w1, 1
	add	w0, w0, 2084
	bl	MEM_WritePhyWord
	ldp	w1, w21, [x19, 48]
	cmp	w1, wzr
	add	x0, x19, x21, sxtw 4
	ldr	x22, [x0, 104]
	ccmp	x22, xzr, 4, ne
	beq	.L1433
	ldr	x3, .LC291
	mov	w4, 4716
	add	x2, x19, 888
	mov	w1, 2
	add	x3, x3, 216
	mov	w0, w21
	bl	RecordPOS
	mov	w0, 0
	bl	SCDDRV_RecordGlobalState
	ldr	w0, [x19, 56]
	cmp	w0, 1
	beq	.L1434
.L1417:
	ldr	x1, [x20, 256]
	mov	w0, 1
	blr	x1
	ldr	x1, [x20, 256]
	mov	w0, 0
	blr	x1
	b	.L1415
	.p2align 3
.L1434:
	add	x23, x22, 458752
	ldr	w0, [x23, 256]
	cmp	w0, 1
	beq	.L1435
.L1418:
	ldr	w0, [x19, 616]
	str	wzr, [x23, 248]
	cbz	w0, .L1421
	cmp	w0, 1
	beq	.L1436
.L1422:
	mov	w0, 0
	bl	SCDDRV_SetStateIdle.part.0
	b	.L1417
	.p2align 3
.L1433:
	mov	w0, 0
	bl	SCDDRV_SetStateIdle.part.0
	b	.L1415
.L1421:
	add	x1, x29, 76
	mov	w0, 0
	bl	SM_DoNextInstance.part.13
	cbnz	w0, .L1422
	ldr	w1, [x29, 76]
	ldr	x0, [x20]
	str	w1, [x19, 52]
	mov	w1, 1
	str	w1, [x19, 56]
	blr	x0
	str	w0, [x19, 60]
	b	.L1417
.L1435:
	add	x0, x23, 168
	ldr	w1, [x0, 8]
	cmp	w1, 3
	beq	.L1437
	mov	w2, 2
	mov	w1, 0
	str	w2, [x0, 8]
	mov	x0, x22
	bl	ProcessScdReturn.part.10
.L1420:
	mov	w0, w21
	bl	SCDDRV_MoveRawByOmxPath
	b	.L1418
.L1436:
	mov	w0, 2
	str	w0, [x19, 616]
	b	.L1422
.L1437:
	mov	w1, 2
	str	w1, [x0, 8]
	b	.L1420
	.size	SM_SCDIntServeProc, .-SM_SCDIntServeProc
	.align	3
.LC289:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC290:
	.xword	.LANCHOR0
	.align	3
.LC291:
	.xword	.LANCHOR4
	.align	3
.LC292:
	.xword	g_HalDisable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_CheckDevice
	.type	SCDDRV_CheckDevice, %function
SCDDRV_CheckDevice:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L1447
	ldr	x19, .LC293
	mov	w4, 0
	ldr	x23, .LC294
	mov	w3, 4768
	ldr	x22, .LC296
	mov	w0, 26
	add	x21, x23, 240
	ldr	w5, [x19, 56]
	mov	x2, x21
	mov	x1, x22
	bl	dprint_vfmw
	ldr	w20, [x19, 56]
	cbz	w20, .L1449
	mov	w4, 0
	mov	w5, w20
	mov	w3, 4777
	mov	x2, x21
	mov	x1, x22
	mov	w0, 26
	bl	dprint_vfmw
	ldr	x0, .LC299
	ldr	x0, [x0]
	blr	x0
	ldr	w4, [x19, 60]
	cmp	w0, w4
	bcs	.L1441
	str	w0, [x19, 60]
.L1442:
	ldr	x1, .LC304
	mov	w4, 0
	mov	w3, 4823
	add	x2, x23, 240
	mov	w0, 26
	mov	w20, 1
	bl	dprint_vfmw
.L1448:
	mov	w0, w20
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1441:
	sub	w4, w0, w4
	cmp	w4, 2000
	bls	.L1442
	ldr	x1, .LC301
	mov	w3, 0
	ldr	w2, [x19, 52]
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC302
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L1443
	mov	w1, 0
	mov	w0, 0
	bl	VDH_Reset_Module
.L1444:
	mov	w0, 0
	bl	SCDDRV_SetStateIdle.part.0
	ldr	w0, [x19, 52]
	add	x19, x19, x0, sxtw 4
	ldr	x1, [x19, 104]
	cbz	x1, .L1446
	add	x1, x1, 458752
	str	wzr, [x1, 248]
.L1446:
	bl	DeleteLastSendRaw
	mov	w20, 0
	mov	w0, w20
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1449:
	ldr	x1, .LC298
	mov	x2, x21
	mov	w4, 0
	mov	w3, 4772
	mov	w0, 26
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1443:
	mov	w0, 0
	bl	ResetSCD
	b	.L1444
	.p2align 3
.L1447:
	mov	w20, -1
	b	.L1448
	.size	SCDDRV_CheckDevice, .-SCDDRV_CheckDevice
	.align	3
.LC293:
	.xword	.LANCHOR0
	.align	3
.LC294:
	.xword	.LANCHOR4
	.align	3
.LC296:
	.xword	.LC295
	.align	3
.LC298:
	.xword	.LC297
	.align	3
.LC299:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC301:
	.xword	.LC300
	.align	3
.LC302:
	.xword	g_HalDisable
	.align	3
.LC304:
	.xword	.LC303
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_ActivateSCD
	.type	SCDDRV_ActivateSCD, %function
SCDDRV_ActivateSCD:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L1450
	mov	w0, 0
	bl	SCDDRV_ActivateSCD.part.14
.L1450:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_ActivateSCD, .-SCDDRV_ActivateSCD
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_Wakeup
	.type	SM_Wakeup, %function
SM_Wakeup:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x0, x30
	mov	w19, 0
	bl	_mcount
	ldr	x20, .LC306
	add	x20, x20, 104
	b	.L1454
	.p2align 3
.L1453:
	add	w19, w19, 1
	cmp	w19, 32
	beq	.L1461
.L1454:
	ldr	x0, [x20]
	add	x20, x20, 16
	add	x1, x0, 458752
	cbz	x0, .L1453
	ldr	w0, [x1, 256]
	cmp	w0, 1
	bne	.L1453
	mov	w0, w19
	add	w19, w19, 1
	bl	FillRawData
	cmp	w19, 32
	bne	.L1454
	.p2align 2
.L1461:
	ldr	x19, .LC307
	mov	w4, 1
	ldr	x1, .LC309
	mov	w3, 0
	add	x19, x19, 264
	mov	w0, 26
	mov	x2, x19
	bl	dprint_vfmw
	mov	w0, 0
	bl	SCDDRV_CheckDevice
	cbz	w0, .L1455
	ldr	x1, .LC311
	mov	x2, x19
	mov	w4, 0
	mov	w3, 4871
	mov	w0, 26
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1455:
	ldr	x1, .LC313
	mov	x2, x19
	mov	w4, 0
	mov	w3, 4866
	mov	w0, 26
	bl	dprint_vfmw
	mov	w0, 0
	bl	SCDDRV_ActivateSCD.part.14
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SM_Wakeup, .-SM_Wakeup
	.align	3
.LC306:
	.xword	.LANCHOR0
	.align	3
.LC307:
	.xword	.LANCHOR4
	.align	3
.LC309:
	.xword	.LC308
	.align	3
.LC311:
	.xword	.LC310
	.align	3
.LC313:
	.xword	.LC312
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PrintScdRawState
	.type	PrintScdRawState, %function
PrintScdRawState:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, 31
	bls	.L1476
.L1462:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1476:
	mov	w0, 26
	bl	IsDprintTypeEnable
	cbz	w0, .L1462
	ldr	x3, .LC315
	mov	w2, w20
	ldr	x1, .LC317
	mov	w0, 26
	add	x3, x3, x20, sxtw 4
	ldr	x23, [x3, 104]
	bl	dprint_vfmw
	ldr	x1, .LC319
	mov	w0, 26
	add	x22, x23, 88
	add	x21, x22, 98304
	ldr	w2, [x21]
	bl	dprint_vfmw
	ldr	x1, .LC321
	mov	w0, 26
	ldr	w2, [x21, 4]
	bl	dprint_vfmw
	ldr	x1, .LC323
	mov	w0, 26
	ldr	w2, [x21, 8]
	bl	dprint_vfmw
	ldr	x1, .LC325
	mov	w0, 26
	ldr	w2, [x21, 12]
	bl	dprint_vfmw
	ldr	x1, .LC327
	mov	w0, 26
	ldr	w2, [x21, 16]
	bl	dprint_vfmw
	cmp	w19, 1
	beq	.L1466
.L1470:
	ldr	x1, .LC329
	mov	w2, w20
	mov	w0, 26
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1466:
	cbz	x22, .L1467
	ldp	w28, w21, [x21]
	sub	w21, w21, w28
	cmp	w21, wzr
	add	w0, w21, 1024
	csel	w21, w0, w21, lt
	cmp	w21, wzr
	ble	.L1470
	ldr	x27, .LC331
	add	w0, w21, w28
	ldr	x26, .LC333
	ldr	x25, .LC335
	ldr	x24, .LC337
	str	w0, [x29, 108]
	.p2align 2
.L1469:
	sxtw	x19, w28
	mov	x1, x27
	lsl	x0, x19, 2
	add	w28, w28, 1
	sub	x19, x0, x19
	mov	w0, 26
	lsl	x19, x19, 5
	add	x21, x23, x19
	add	x19, x22, x19
	ldr	w2, [x21, 92]
	bl	dprint_vfmw
	ldr	x2, [x19, 40]
	mov	x1, x26
	mov	w0, 26
	bl	dprint_vfmw
	ldr	w2, [x21, 100]
	mov	x1, x25
	mov	w0, 26
	bl	dprint_vfmw
	ldr	x2, [x19, 64]
	mov	x1, x24
	mov	w0, 26
	bl	dprint_vfmw
	ldr	w0, [x29, 108]
	cmp	w28, w0
	bne	.L1469
	b	.L1470
.L1467:
	ldr	x2, .LC338
	mov	w3, 4900
	ldr	x1, .LC340
	mov	w0, 22
	add	x2, x2, 280
	bl	dprint_vfmw
	b	.L1470
	.size	PrintScdRawState, .-PrintScdRawState
	.align	3
.LC315:
	.xword	.LANCHOR0
	.align	3
.LC317:
	.xword	.LC316
	.align	3
.LC319:
	.xword	.LC318
	.align	3
.LC321:
	.xword	.LC320
	.align	3
.LC323:
	.xword	.LC322
	.align	3
.LC325:
	.xword	.LC324
	.align	3
.LC327:
	.xword	.LC326
	.align	3
.LC329:
	.xword	.LC328
	.align	3
.LC331:
	.xword	.LC330
	.align	3
.LC333:
	.xword	.LC332
	.align	3
.LC335:
	.xword	.LC334
	.align	3
.LC337:
	.xword	.LC336
	.align	3
.LC338:
	.xword	.LANCHOR4
	.align	3
.LC340:
	.xword	.LC339
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PrintScdSegState
	.type	PrintScdSegState, %function
PrintScdSegState:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w20, w0
	mov	x0, x30
	mov	w23, w1
	bl	_mcount
	cmp	w20, 31
	bls	.L1491
.L1477:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1491:
	mov	w0, 26
	bl	IsDprintTypeEnable
	cbz	w0, .L1477
	ldr	x3, .LC341
	mov	w2, w20
	ldr	x1, .LC343
	mov	w0, 26
	add	x3, x3, x20, sxtw 4
	ldr	x22, [x3, 104]
	bl	dprint_vfmw
	ldr	x1, .LC345
	mov	w0, 26
	add	x24, x22, 98304
	add	x21, x24, 112
	add	x19, x21, 360448
	ldr	w2, [x19, 8]
	bl	dprint_vfmw
	ldr	x1, .LC347
	mov	w0, 26
	ldr	w2, [x19, 12]
	bl	dprint_vfmw
	ldr	x1, .LC349
	mov	w0, 26
	ldr	w2, [x19, 20]
	bl	dprint_vfmw
	ldr	x1, .LC351
	mov	w0, 26
	ldr	w2, [x19, 24]
	bl	dprint_vfmw
	ldr	x1, .LC353
	mov	w0, 26
	ldr	x2, [x24, 112]
	bl	dprint_vfmw
	ldr	x1, .LC355
	mov	w0, 26
	ldr	w2, [x19, 28]
	bl	dprint_vfmw
	ldr	x1, .LC357
	mov	w0, 26
	ldr	w2, [x19, 32]
	bl	dprint_vfmw
	ldr	x1, .LC359
	mov	w0, 26
	ldr	w2, [x19, 36]
	bl	dprint_vfmw
	cmp	w23, 1
	beq	.L1481
.L1482:
	ldr	x1, .LC361
	mov	w2, w20
	mov	w0, 26
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1481:
	cbz	x21, .L1482
	ldp	w24, w23, [x19, 8]
	sub	w23, w23, w24
	ands	w23, w23, 4095
	beq	.L1482
	ldr	x28, .LC363
	add	w23, w24, w23
	ldr	x27, .LC365
	ldr	x26, .LC367
	ldr	x25, .LC369
	str	x21, [x29, 104]
	.p2align 2
.L1483:
	sxtw	x19, w24
	mov	x1, x28
	lsl	x0, x19, 2
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	ldr	x0, [x29, 104]
	add	x19, x0, x19, lsl 3
	mov	w0, 26
	ldr	w2, [x19, 24]
	bl	dprint_vfmw
	mov	w0, 88
	mov	x1, x27
	smaddl	x3, w24, w0, x22
	mov	w0, 26
	add	w24, w24, 1
	add	x21, x3, 98304
	ldr	x2, [x21, 120]
	bl	dprint_vfmw
	ldr	w2, [x19, 28]
	mov	x1, x26
	mov	w0, 26
	bl	dprint_vfmw
	ldr	w2, [x19, 32]
	mov	x1, x25
	mov	w0, 26
	bl	dprint_vfmw
	ldrsb	w2, [x21, 128]
	mov	w0, 26
	ldr	x1, .LC371
	bl	dprint_vfmw
	ldrb	w2, [x21, 130]
	mov	w0, 26
	ldr	x1, .LC373
	bl	dprint_vfmw
	ldr	x1, .LC375
	mov	w0, 26
	ldr	x2, [x19, 40]
	bl	dprint_vfmw
	cmp	w23, w24
	bne	.L1483
	b	.L1482
	.size	PrintScdSegState, .-PrintScdSegState
	.align	3
.LC341:
	.xword	.LANCHOR0
	.align	3
.LC343:
	.xword	.LC342
	.align	3
.LC345:
	.xword	.LC344
	.align	3
.LC347:
	.xword	.LC346
	.align	3
.LC349:
	.xword	.LC348
	.align	3
.LC351:
	.xword	.LC350
	.align	3
.LC353:
	.xword	.LC352
	.align	3
.LC355:
	.xword	.LC354
	.align	3
.LC357:
	.xword	.LC356
	.align	3
.LC359:
	.xword	.LC358
	.align	3
.LC361:
	.xword	.LC360
	.align	3
.LC363:
	.xword	.LC362
	.align	3
.LC365:
	.xword	.LC364
	.align	3
.LC367:
	.xword	.LC366
	.align	3
.LC369:
	.xword	.LC368
	.align	3
.LC371:
	.xword	.LC370
	.align	3
.LC373:
	.xword	.LC372
	.align	3
.LC375:
	.xword	.LC374
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
	.align	3
.LANCHOR3 = . + 0
	.type	__func__.15600, %object
	.size	__func__.15600, 19
__func__.15600:
	.string	"SCDDRV_LoadDspCode"
	.zero	5
	.type	__func__.15672, %object
	.size	__func__.15672, 16
__func__.15672:
	.string	"DeleteRawPacket"
	.type	__FUNCTION__.15778, %object
	.size	__FUNCTION__.15778, 17
__FUNCTION__.15778:
	.string	"ReleaseStreamSeg"
	.zero	7
	.type	__func__.15915, %object
	.size	__func__.15915, 16
__func__.15915:
	.string	"SM_LinkRawToSeg"
	.type	__func__.15935, %object
	.size	__func__.15935, 16
__func__.15935:
	.string	"SM_CopyRawToSeg"
	.type	__func__.16268, %object
	.size	__func__.16268, 17
__func__.16268:
	.string	"GetMpeg4ModeFlag"
	.zero	7
	.type	__func__.16327, %object
	.size	__func__.16327, 15
__func__.16327:
	.string	"NeedReadStream"
	.zero	1
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
	.zero	4
	.type	__func__.16351, %object
	.size	__func__.16351, 17
__func__.16351:
	.string	"FillEopRawStream"
	.zero	7
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
	.align	3
.LANCHOR4 = . + 0
	.type	__func__.16379, %object
	.size	__func__.16379, 17
__func__.16379:
	.string	"FillEosRawStream"
	.zero	7
	.type	__func__.16404, %object
	.size	__func__.16404, 17
__func__.16404:
	.string	"FillVC1ExtraData"
	.zero	7
	.type	__func__.16409, %object
	.size	__func__.16409, 19
__func__.16409:
	.string	"FillDIVX3ExtraData"
	.zero	5
	.type	__func__.16414, %object
	.size	__func__.16414, 19
__func__.16414:
	.string	"FillREAL8ExtraData"
	.zero	5
	.type	__func__.16422, %object
	.size	__func__.16422, 14
__func__.16422:
	.string	"FillExtraData"
	.zero	2
	.type	__func__.15686, %object
	.size	__func__.15686, 24
__func__.15686:
	.string	"DeleteRawPacketInBuffer"
	.type	__FUNCTION__.15820, %object
	.size	__FUNCTION__.15820, 9
__FUNCTION__.15820:
	.string	"SM_Reset"
	.zero	7
	.type	__FUNCTION__.16341, %object
	.size	__FUNCTION__.16341, 12
__FUNCTION__.16341:
	.string	"FillRawData"
	.zero	4
	.type	__FUNCTION__.16548, %object
	.size	__FUNCTION__.16548, 18
__FUNCTION__.16548:
	.string	"SM_DoNextInstance"
	.zero	6
	.type	__func__.16585, %object
	.size	__func__.16585, 19
__func__.16585:
	.string	"SCDDRV_ActivateSCD"
	.zero	5
	.type	__FUNCTION__.16572, %object
	.size	__FUNCTION__.16572, 19
__FUNCTION__.16572:
	.string	"SM_SCDIntServeProc"
	.zero	5
	.type	__func__.16579, %object
	.size	__func__.16579, 19
__func__.16579:
	.string	"SCDDRV_CheckDevice"
	.zero	5
	.type	__func__.16594, %object
	.size	__func__.16594, 10
__func__.16594:
	.string	"SM_Wakeup"
	.zero	6
	.type	__FUNCTION__.16606, %object
	.size	__FUNCTION__.16606, 17
__FUNCTION__.16606:
	.string	"PrintScdRawState"
	.data
	.align	3
.LANCHOR1 = . + 0
.LANCHOR2 = . + 17408
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
	.size	g_pScdDrvParamBase, 8
g_pScdDrvParamBase:
	.xword	g_ScdDrvParam
	.type	g_hex_flag, %object
	.size	g_hex_flag, 4
g_hex_flag:
	.word	1
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC8:
	ASCII(.string	"Fatal: get g_hex_base_addr(0x%x) vir addr failed!\n" )
	.zero	5
.LC13:
	ASCII(.string	"Warn: eVidStd = %d have not DSP vfmw bin file!!\n" )
	.zero	7
.LC16:
	ASCII(.string	"%s failed!\n" )
	.zero	4
.LC18:
	ASCII(.string	"%s success!\n" )
	.zero	3
.LC27:
	ASCII(.string	"Ignore the reset request when the SCD[%d] clock is closed.\n" )
	.zero	4
.LC29:
	ASCII(.string	"SCD[%d]   ResetSCD ERROR!!!\n" )
	.zero	3
.LC39:
	ASCII(.string	"line: %d Get SmID fail!" )
.LC41:
	ASCII(.string	"DelRaw err PacketNum = %d, DelNum = %d\n" )
.LC44:
	ASCII(.string	"%s release RawPhyAddr = 0x%x, Len = %d\n" )
.LC48:
	ASCII(.string	"line: %d DelNum = %d,RawPacketOffSet = %d,DelNum = %d,Next Length = %d,is_extern_eop_flag = %d\n\n" )
	.zero	7
.LC51:
	ASCII(.string	"line: %d pSmInstArray is NULL!\n" )
.LC60:
	ASCII(.string	"Read_seg SegPacket.PhyAddr=0x%x, LenByte=%d, IsLastSeg=%d\n" )
	.zero	5
.LC62:
	ASCII(.string	"Release SegPacket.PhyAddr=0x%x,LenByte=%d,IsLastSeg=%d StreamID=%d\n" )
	.zero	4
.LC65:
	ASCII(.string	"Array out of bound in function %s\n" )
	.zero	5
.LC88:
	ASCII(.string	"line: %d, SmID = %d is not expected!\n" )
	.zero	2
.LC90:
	ASCII(.string	"line: %d, SmID = %d, ScdId = %d is not expected!\n" )
	.zero	6
.LC99:
	ASCII(.string	"%s not support discontinue raw.\n" )
	.zero	7
.LC101:
	ASCII(.string	"%s VirAddr is null!!\n" )
	.zero	2
.LC106:
	ASCII(.string	"Raw packet TOO BIG! Can't copy to seg! Len: 0x%x\n" )
	.zero	6
.LC108:
	ASCII(.string	"line: %d, delet raw failed!\n" )
	.zero	3
.LC111:
	ASCII(.string	"[%s %d] VirAddr is null!!\n" )
	.zero	5
.LC130:
	ASCII(.string	"InstID = %d EsRelease!\n" )
.LC134:
	ASCII(.string	"Cann't Start SCD, Ret = %d\n" )
	.zero	4
.LC137:
	ASCII(.string	"SM_CfgBuf Err! ret =%d\n" )
.LC142:
	ASCII(.string	"Line: %d, The length of seg packet is invalid: %d\n" )
	.zero	5
.LC146:
	ASCII(.string	"Line: %d, start code num from scd state reg: %d, release raw packet anyway!\n" )
	.zero	3
.LC151:
	ASCII(.string	"[%s %d] pCurrentStartCodeVirAddr is null!!\n" )
	.zero	4
.LC155:
	ASCII(.string	"Line: %d, pNextStartCodeVirAddr is null!\n" )
	.zero	6
.LC158:
	ASCII(.string	"ValidSegNum = %d, FilteredSegNum = 0, release raw packet anyway!\n" )
	.zero	6
.LC164:
	ASCII(.string	"%s call GetRawStreamNum return failed!\n" )
.LC169:
	ASCII(.string	"%s: pRawPacket = NULL!\n" )
.LC172:
	ASCII(.string	"%s: unkown standard type = %d!\n" )
.LC174:
	ASCII(.string	"%s: Length(%d)+FlagLen(%d) > BufLen(%d)\n" )
	.zero	7
.LC183:
	ASCII(.string	"%s: FlagLen(%d) > RawPacketLength(%d)\n" )
	.zero	1
.LC187:
	ASCII(.string	"Func: %s, buffer has no enough space,(act: %d, header_buf: %d)\n" )
.LC190:
	ASCII(.string	"Func: %s, buffer has no enough space,(act: %d, str_buf: %d)\n" )
	.zero	3
.LC192:
	ASCII(.string	"Func: %s, buffer has no enough space,(act:%d, str_buf: %d, header_buf: %d)\n" )
	.zero	4
.LC195:
	ASCII(.string	"Func: %s, buffer has no enough space, (act: %d, str_buf: %d)\n" )
	.zero	2
.LC201:
	ASCII(.string	"Func: %s, buffer has no enough space,(act:%d, str_buf:%d)\n" )
	.zero	5
.LC204:
	ASCII(.string	"%s: RawPacket Length %d <= 0\n" )
	.zero	2
.LC208:
	ASCII(.string	"Chan %d has been destroyed or the function pointer -- ReleaseRawStreamData pStreamIntf is NULL!" )
.LC211:
	ASCII(.string	"line: %d s_SmIIS[%d].pSmInstArray is NULL\n" )
	.zero	5
.LC220:
	ASCII(.string	"line: %d, pScdInstance is NULL!\n" )
	.zero	7
.LC224:
	ASCII(.string	"%s %d force to clear SCDState = 0\n" )
	.zero	5
.LC226:
	ASCII(.string	"%s %d FMW_OK !=  GetRawStreamNum !!\n" )
	.zero	3
.LC230:
	ASCII(.string	"Chan %d has been destroyed or the function pointer -- ReadRawStreamData pStreamIntf is NULL!" )
	.zero	3
.LC232:
	ASCII(.string	"line: %d s_SmIIS.pSmInstArray[%d] is NULL\n" )
	.zero	5
.LC234:
	ASCII(.string	"Chan %d FillEosRawStream failed!\n" )
	.zero	6
.LC236:
	ASCII(.string	"Chan %d FillExtraData failed!\n" )
	.zero	1
.LC238:
	ASCII(.string	"Release this packet failed!\n" )
	.zero	3
.LC243:
	ASCII(.string	"raw_pts: %lld\n" )
	.zero	1
.LC245:
	ASCII(.string	"Get RawPhyAddr=0x%x,Len=%d\n" )
	.zero	4
.LC247:
	ASCII(.string	"!!!push raw err!!!\n" )
	.zero	4
.LC252:
	ASCII(.string	"Chan%d raw full\n" )
	.zero	7
.LC259:
	ASCII(.string	"RawNum %lld <= RawNumInVfmw %lld\n" )
	.zero	6
.LC262:
	ASCII(.string	"No space for raw move, total:%d+%d > max:%d!\n" )
	.zero	2
.LC265:
	ASCII(.string	"scd buffer is full, DiscardSeg: %d, SegNum: %d\n" )
.LC267:
	ASCII(.string	"(%d ms) not release stream seg, release anyway!\n" )
	.zero	7
.LC279:
	ASCII(.string	"%s,%d, active scd Success!\n" )
	.zero	4
.LC285:
	ASCII(.string	"Move raw data failed, force to reset scd.\n" )
	.zero	5
.LC287:
	ASCII(.string	"SCD GetRawStreamNum Fail.\n" )
	.zero	5
.LC295:
	ASCII(.string	"%s,%d,SCD(ID = %d) SCDState = %d\n" )
	.zero	6
.LC297:
	ASCII(.string	"%s,%d,SCD(ID = %d) return Idle!\n" )
	.zero	7
.LC300:
	ASCII(.string	"Chan %d SCD[%d] Time Out(%d ms), Reset it!\n" )
	.zero	4
.LC303:
	ASCII(.string	"%s,%d,SCD(ID = %d) really busy!\n" )
	.zero	7
.LC308:
	ASCII(.string	"%s prepare to check SCD(%d)/(MAX_SCD_NUM = %d)\n" )
.LC310:
	ASCII(.string	"%s,%d,SCD(ID = %d) return BUSY!!\n" )
	.zero	6
.LC312:
	ASCII(.string	"%s,%d,find idle SCD(ID = %d)\n" )
	.zero	2
.LC316:
	ASCII(.string	"********** SmID [%d] RawState begin **********\n" )
.LC318:
	ASCII(.string	"RawHead=%d\n" )
	.zero	4
.LC320:
	ASCII(.string	"RawTail=%d\n" )
	.zero	4
.LC322:
	ASCII(.string	"RawHistory=%d\n" )
	.zero	1
.LC324:
	ASCII(.string	"RawFirstPacketOffset=%d\n" )
	.zero	7
.LC326:
	ASCII(.string	"CurShowIndex=%d\n" )
	.zero	7
.LC328:
	ASCII(.string	"********** SmID [%d] RawState end   **********\n" )
.LC330:
	ASCII(.string	"RawPhyAddr=0x%x\n" )
	.zero	7
.LC332:
	ASCII(.string	"RawVirAddr=0x%x\n" )
	.zero	7
.LC334:
	ASCII(.string	"RawLength=%d\n" )
	.zero	2
.LC336:
	ASCII(.string	"RawPts=%ld\n" )
	.zero	4
.LC339:
	ASCII(.string	"%s %d FMW_OK !=  GetRawStreamNum!!\n" )
	.zero	4
.LC342:
	ASCII(.string	"********** SmID [%d] SegState begin **********\n" )
.LC344:
	ASCII(.string	"SegHead=%d\n" )
	.zero	4
.LC346:
	ASCII(.string	"SegTail=%d\n" )
	.zero	4
.LC348:
	ASCII(.string	"SegCurrent=%d\n" )
	.zero	1
.LC350:
	ASCII(.string	"SegBufPhyAddr=%p\n" )
	.zero	6
.LC352:
	ASCII(.string	"SegBufVirAddr=%p\n" )
	.zero	6
.LC354:
	ASCII(.string	"SegBufSize=%d\n" )
	.zero	1
.LC356:
	ASCII(.string	"SegBufReadAddr=%p\n" )
	.zero	5
.LC358:
	ASCII(.string	"SegBufWriteAddr=%pd\n" )
	.zero	3
.LC360:
	ASCII(.string	"********** SmID [%d] SegState end   **********\n" )
.LC362:
	ASCII(.string	"SegPhyAddr=0x%x\n" )
	.zero	7
.LC364:
	ASCII(.string	"SegVirAddr=0x%x\n" )
	.zero	7
.LC366:
	ASCII(.string	"SegLength=%d\n" )
	.zero	2
.LC368:
	ASCII(.string	"SegStreamID=%d\n" )
.LC370:
	ASCII(.string	"SegState=%d\n" )
	.zero	3
.LC372:
	ASCII(.string	"SegIsLastSeg=%d\n" )
	.zero	7
.LC374:
	ASCII(.string	"SegPts=%lld\n" )
	.bss
	.align	3
.LANCHOR0 = . + 0
	.type	g_ScdDrvParam, %object
	.size	g_ScdDrvParam, 72
g_ScdDrvParam:
	.zero	72
	.type	g_hex_base_addr, %object
	.size	g_hex_base_addr, 4
g_hex_base_addr:
	.zero	4
	.zero	4
	.type	g_hex_base_vir_addr, %object
	.size	g_hex_base_vir_addr, 8
g_hex_base_vir_addr:
	.zero	8
	.type	g_hex_len, %object
	.size	g_hex_len, 4
g_hex_len:
	.zero	4
	.zero	4
	.type	s_ScdRegPhyBaseAddr, %object
	.size	s_ScdRegPhyBaseAddr, 4
s_ScdRegPhyBaseAddr:
	.zero	4
	.zero	4
	.type	s_SmIIS, %object
	.size	s_SmIIS, 512
s_SmIIS:
	.zero	512
	.type	s_eScdDrvSleepStage, %object
	.size	s_eScdDrvSleepStage, 4
s_eScdDrvSleepStage:
	.zero	4
	.zero	4
	.type	s_ScdRegResetPhyAddr, %object
	.size	s_ScdRegResetPhyAddr, 4
s_ScdRegResetPhyAddr:
	.zero	4
	.zero	4
	.type	last_rec_pos_time.16335, %object
	.size	last_rec_pos_time.16335, 128
last_rec_pos_time.16335:
	.zero	128
	.type	LastRecPosTime.16545, %object
	.size	LastRecPosTime.16545, 128
LastRecPosTime.16545:
	.zero	128
	.type	last_rec_pos_time.16570, %object
	.size	last_rec_pos_time.16570, 128
last_rec_pos_time.16570:
	.zero	128
	.type	s_ScdRegResetOKPhyAddr, %object
	.size	s_ScdRegResetOKPhyAddr, 4
s_ScdRegResetOKPhyAddr:
	.zero	4
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
