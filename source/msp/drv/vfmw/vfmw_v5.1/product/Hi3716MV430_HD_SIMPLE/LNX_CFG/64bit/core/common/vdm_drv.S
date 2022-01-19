#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_drv.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	VDMDRV_AdjustErrRatio, %function
VDMDRV_AdjustErrRatio:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	sxtw	x19, w0
	mov	x0, x30
	mov	x21, x2
	mov	w20, w1
	bl	_mcount
	ldr	x22, .LC0
	lsl	x2, x19, 3
	sub	x2, x2, x19
	add	x2, x22, x2, lsl 3
	ldr	w24, [x2, 8]
	cbz	w20, .L3
	cmp	w20, 1
	bne	.L15
	ldr	x2, .LC2
	mov	w5, 100
	mov	w4, w20
	mov	w3, w24
	str	w5, [x21]
	mov	w1, 291
	mov	w0, w20
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L15:
	add	x0, x29, 80
	ldr	w3, [x2, 12]
	ldr	x1, [x2, 40]
	str	w3, [x29, 68]
	str	w19, [x0, -16]!
	str	x1, [x29, 72]
	bl	PostPro_GetErrRatio
	str	w0, [x21]
	ldr	x20, .LC3
	cbnz	w0, .L16
.L6:
	ldr	x2, [x20, w24, sxtw 3]
	lsl	x0, x19, 3
	sub	x19, x0, x19
	mov	w0, 0
	ldr	w1, [x2, 88]
	add	x22, x22, x19, lsl 3
	add	w1, w1, 1
	str	w1, [x2, 88]
	ldr	w1, [x22, 12]
	sub	w2, w1, #8
	cmp	w2, 1
	ccmp	w1, 5, 4, hi
	cset	w1, eq
	cbz	w1, .L17
	str	w0, [x21]
.L18:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3:
	str	wzr, [x21]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L17:
	ldr	w0, [x21]
	mov	w1, 100
	cmp	w0, w1
	csel	w0, w0, w1, le
	cmp	w0, wzr
	csel	w0, w0, wzr, ge
	str	w0, [x21]
	b	.L18
	.p2align 3
.L16:
	ldr	x4, [x20, w24, sxtw 3]
	mov	w5, w0
	ldr	x2, .LC5
	mov	w3, w24
	mov	w1, 306
	mov	w0, 1
	ldr	w4, [x4, 88]
	bl	dprint_normal
	b	.L6
	.size	VDMDRV_AdjustErrRatio, .-VDMDRV_AdjustErrRatio
	.align	3
.LC0:
	.xword	.LANCHOR0
	.align	3
.LC2:
	.xword	.LC1
	.align	3
.LC3:
	.xword	s_pstVfmwChan
	.align	3
.LC5:
	.xword	.LC4
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VDMDRV_ClearChanIsDec.part.4, %function
VDMDRV_ClearChanIsDec.part.4:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w4, 217
	ldr	x3, .LC6
	ldr	x2, .LC8
	mov	w1, w4
	mov	w0, 1
	bl	dprint_normal
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMDRV_ClearChanIsDec.part.4, .-VDMDRV_ClearChanIsDec.part.4
	.align	3
.LC6:
	.xword	.LANCHOR1
	.align	3
.LC8:
	.xword	.LC7
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VDMDRV_IsCopy.part.6, %function
VDMDRV_IsCopy.part.6:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC9
	mov	w1, 327
	ldr	x2, .LC11
	mov	w0, 0
	add	x3, x3, 24
	bl	dprint_normal
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMDRV_IsCopy.part.6, .-VDMDRV_IsCopy.part.6
	.align	3
.LC9:
	.xword	.LANCHOR1
	.align	3
.LC11:
	.xword	.LC10
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VDMDRV_SetStateIdle.part.9, %function
VDMDRV_SetStateIdle.part.9:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC12
	mov	w4, 1191
	ldr	x2, .LC13
	mov	w1, w4
	add	x3, x3, 40
	mov	w0, 1
	bl	dprint_normal
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMDRV_SetStateIdle.part.9, .-VDMDRV_SetStateIdle.part.9
	.align	3
.LC12:
	.xword	.LANCHOR1
	.align	3
.LC13:
	.xword	.LC7
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_Init
	.type	VDMDRV_Init, %function
VDMDRV_Init:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L25
	ldr	x3, .LC16
	mov	x2, 56
	ldr	x19, .LC17
	mov	w1, 0
	ldr	x3, [x3, 96]
	mov	x0, x19
	blr	x3
	str	wzr, [x19, 56]
	ldr	x0, .LC18
	str	wzr, [x0, 16]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L25:
	ldr	x3, .LC14
	mov	w4, 27
	ldr	x2, .LC15
	mov	w1, w4
	add	x3, x3, 64
	mov	w0, 1
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_Init, .-VDMDRV_Init
	.align	3
.LC14:
	.xword	.LANCHOR1
	.align	3
.LC15:
	.xword	.LC7
	.align	3
.LC16:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC17:
	.xword	.LANCHOR0
	.align	3
.LC18:
	.xword	g_VfmwGlobalStat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_Reset
	.type	VDMDRV_Reset, %function
VDMDRV_Reset:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L29
	ldr	x3, .LC21
	mov	x2, 56
	ldr	x0, .LC22
	mov	w1, 0
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L29:
	ldr	x3, .LC19
	mov	w4, 38
	ldr	x2, .LC20
	mov	w1, w4
	add	x3, x3, 80
	mov	w0, 1
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_Reset, .-VDMDRV_Reset
	.align	3
.LC19:
	.xword	.LANCHOR1
	.align	3
.LC20:
	.xword	.LC7
	.align	3
.LC21:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC22:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_SetPriority
	.type	VDMDRV_SetPriority, %function
VDMDRV_SetPriority:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L44
	ldr	x6, .LC27
	mov	w3, 0
	mov	w4, 0
	add	x5, x6, 80
.L39:
	mov	x0, 0
	mov	w2, 0
.L34:
	ldr	w1, [x19, x0, lsl 2]
	cmp	w1, w2
	ble	.L33
	mov	w4, w0
	mov	w2, w1
.L33:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L34
	cmp	w2, wzr
	ble	.L45
	str	w4, [x5], 4
	add	w3, w3, 1
	str	wzr, [x19, w4, sxtw 2]
	cmp	w3, 4
	bne	.L39
.L30:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L45:
	cmp	w3, 3
	add	x6, x6, 64
	mov	w1, -1
	bgt	.L30
	.p2align 2
.L40:
	add	x0, x6, x3, sxtw 2
	add	w3, w3, 1
	cmp	w3, 4
	str	w1, [x0, 16]
	bne	.L40
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L44:
	ldr	x3, .LC25
	mov	w4, 52
	ldr	x2, .LC26
	mov	w1, w4
	add	x3, x3, 96
	mov	w0, 1
	bl	dprint_normal
	b	.L30
	.size	VDMDRV_SetPriority, .-VDMDRV_SetPriority
	.align	3
.LC25:
	.xword	.LANCHOR1
	.align	3
.LC26:
	.xword	.LC7
	.align	3
.LC27:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_AdjustPriorityAfterDec
	.type	VDMDRV_AdjustPriorityAfterDec, %function
VDMDRV_AdjustPriorityAfterDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x8, .LC28
	ldr	w1, [x8, 80]
	cmp	w19, w1
	beq	.L57
	ldr	w1, [x8, 84]
	cmp	w19, w1
	beq	.L55
	ldr	w1, [x8, 88]
	cmp	w19, w1
	beq	.L56
	ldr	w0, [x8, 92]
	cmp	w0, w19
	beq	.L46
.L57:
	mov	x3, 4
	mov	x2, 0
	mov	w0, 0
.L47:
	add	x1, x8, 80
	add	x7, x1, x3
	ldr	w3, [x1, x3]
	tbz	w3, #31, .L51
	b	.L46
	.p2align 3
.L53:
	add	x7, x1, x3, lsl 2
	ldr	w3, [x1, x3, lsl 2]
	tbnz	w3, #31, .L46
.L51:
	add	x4, x8, 64
	ldr	w5, [x1, x2, lsl 2]
	add	w0, w0, 1
	ldr	w6, [x4, w3, sxtw 2]
	ldr	w4, [x4, w5, sxtw 2]
	cmp	w6, w4
	blt	.L52
	str	w3, [x1, x2, lsl 2]
	str	w5, [x7]
.L52:
	cmp	w0, 2
	sxtw	x2, w0
	add	x3, x2, 1
	ble	.L53
.L46:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L55:
	mov	w0, 1
	mov	x2, 1
.L48:
	add	x3, x2, 1
	lsl	x3, x3, 2
	b	.L47
.L56:
	mov	w0, 2
	mov	x2, 2
	b	.L48
	.size	VDMDRV_AdjustPriorityAfterDec, .-VDMDRV_AdjustPriorityAfterDec
	.align	3
.LC28:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_PrepareSleep
	.type	VDMDRV_PrepareSleep, %function
VDMDRV_PrepareSleep:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L64
	ldr	x1, .LC33
	ldr	w0, [x1, 56]
	cbnz	w0, .L63
	ldr	w0, [x1]
	cbz	w0, .L65
	mov	w2, 1
	mov	w0, 0
	str	w2, [x1, 56]
.L61:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L65:
	mov	w2, 2
	str	w2, [x1, 56]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L63:
	mov	w0, -1
	b	.L61
	.p2align 3
.L64:
	ldr	x3, .LC31
	mov	w4, 125
	ldr	x2, .LC32
	mov	w1, w4
	add	x3, x3, 120
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L61
	.size	VDMDRV_PrepareSleep, .-VDMDRV_PrepareSleep
	.align	3
.LC31:
	.xword	.LANCHOR1
	.align	3
.LC32:
	.xword	.LC7
	.align	3
.LC33:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_GetSleepStage
	.type	VDMDRV_GetSleepStage, %function
VDMDRV_GetSleepStage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L69
	ldr	x0, .LC36
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 56]
	ret
	.p2align 3
.L69:
	ldr	x3, .LC34
	mov	w4, 150
	ldr	x2, .LC35
	mov	w1, w4
	add	x3, x3, 144
	mov	w0, 1
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_GetSleepStage, .-VDMDRV_GetSleepStage
	.align	3
.LC34:
	.xword	.LANCHOR1
	.align	3
.LC35:
	.xword	.LC7
	.align	3
.LC36:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_ForceSleep
	.type	VDMDRV_ForceSleep, %function
VDMDRV_ForceSleep:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L77
	ldr	x19, .LC39
	ldr	w0, [x19, 56]
	cmp	w0, 2
	beq	.L73
	mov	w0, 0
	bl	VDMDRV_Reset
	mov	w0, 2
	str	w0, [x19, 56]
.L73:
	ldr	x2, .LC41
	mov	w1, 164
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L77:
	ldr	x3, .LC37
	mov	w4, 156
	ldr	x2, .LC38
	mov	w1, w4
	add	x3, x3, 168
	mov	w0, 1
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_ForceSleep, .-VDMDRV_ForceSleep
	.align	3
.LC37:
	.xword	.LANCHOR1
	.align	3
.LC38:
	.xword	.LC7
	.align	3
.LC39:
	.xword	.LANCHOR0
	.align	3
.LC41:
	.xword	.LC40
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_ExitSleep
	.type	VDMDRV_ExitSleep, %function
VDMDRV_ExitSleep:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L81
	ldr	x0, .LC44
	str	wzr, [x0, 56]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L81:
	ldr	x3, .LC42
	mov	w4, 171
	ldr	x2, .LC43
	mov	w1, w4
	add	x3, x3, 192
	mov	w0, 1
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_ExitSleep, .-VDMDRV_ExitSleep
	.align	3
.LC42:
	.xword	.LANCHOR1
	.align	3
.LC43:
	.xword	.LC7
	.align	3
.LC44:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_StartRepair
	.type	VDMDRV_StartRepair, %function
VDMDRV_StartRepair:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	mov	x21, x2
	bl	_mcount
	mov	w0, 8
	bl	VCTRL_RecordPosTime
	ldr	x0, .LC45
	ldr	x3, [x0, 216]
	cbz	x3, .L83
	mov	x1, x21
	mov	w0, w19
	blr	x3
.L84:
	sxtw	x1, w19
	ldr	x0, .LC48
	lsl	x2, x1, 3
	sub	x1, x2, x1
	lsl	x1, x1, 3
	str	w20, [x0, x1]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L83:
	mov	w3, 179
	ldr	x2, .LC47
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L84
	.size	VDMDRV_StartRepair, .-VDMDRV_StartRepair
	.align	3
.LC45:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC47:
	.xword	.LC46
	.align	3
.LC48:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_StartDec
	.type	VDMDRV_StartDec, %function
VDMDRV_StartDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	mov	w0, 8
	bl	VCTRL_RecordPosTime
	ldr	x0, .LC49
	ldr	x2, [x0, 224]
	cbz	x2, .L86
	mov	x1, x20
	mov	w0, w19
	blr	x2
.L87:
	sxtw	x0, w19
	ldr	x2, .LC51
	lsl	x1, x0, 3
	mov	w3, 1
	sub	x0, x1, x0
	lsl	x0, x0, 3
	str	w3, [x2, x0]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L86:
	mov	w3, 188
	ldr	x2, .LC50
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L87
	.size	VDMDRV_StartDec, .-VDMDRV_StartDec
	.align	3
.LC49:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC50:
	.xword	.LC46
	.align	3
.LC51:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_IsChanDec
	.type	VDMDRV_IsChanDec, %function
VDMDRV_IsChanDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC52
	add	x19, x0, x19, sxtw 2
	ldr	w0, [x19, 96]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_IsChanDec, .-VDMDRV_IsChanDec
	.align	3
.LC52:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_SetChanIsDec
	.type	VDMDRV_SetChanIsDec, %function
VDMDRV_SetChanIsDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 3
	bhi	.L94
	cbnz	w20, .L95
	ldr	x2, .LC55
	mov	w0, w19
	mov	w1, 1
	add	x19, x2, x19, sxtw 2
	str	w1, [x19, 96]
	bl	VDMDRV_AdjustPriorityAfterDec
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L95:
	ldr	x3, .LC53
	mov	w4, 208
.L93:
	ldr	x2, .LC54
	mov	w1, w4
	add	x3, x3, 216
	mov	w0, 1
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L94:
	ldr	x3, .LC53
	mov	w4, 207
	b	.L93
	.size	VDMDRV_SetChanIsDec, .-VDMDRV_SetChanIsDec
	.align	3
.LC53:
	.xword	.LANCHOR1
	.align	3
.LC54:
	.xword	.LC7
	.align	3
.LC55:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_ClearChanIsDec
	.type	VDMDRV_ClearChanIsDec, %function
VDMDRV_ClearChanIsDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L99
	ldr	x0, .LC56
	add	x19, x0, x19, sxtw 2
	str	wzr, [x19, 96]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L99:
	bl	VDMDRV_ClearChanIsDec.part.4
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_ClearChanIsDec, .-VDMDRV_ClearChanIsDec
	.align	3
.LC56:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_ParamInit
	.type	VDMDRV_ParamInit, %function
VDMDRV_ParamInit:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC59
	mov	x0, 0
	mov	w3, 1
.L102:
	ldr	x1, [x2, x0]
	add	x0, x0, 8
	cmp	x0, 32
	cbz	x1, .L101
	str	w3, [x1, 24]
.L101:
	bne	.L102
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMDRV_ParamInit, .-VDMDRV_ParamInit
	.align	3
.LC59:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_ChnDecReady
	.type	VDMDRV_ChnDecReady, %function
VDMDRV_ChnDecReady:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	mov	w19, w1
	mov	x21, x2
	bl	_mcount
	mov	w0, w19
	bl	VCTRL_IsChanActive
	cbnz	w0, .L111
	ldr	x0, .LC63
	add	x0, x0, x19, sxtw 2
	ldr	w20, [x0, 96]
	cbnz	w20, .L112
	mov	w0, w19
	str	xzr, [x21]
	bl	VCTRL_GetDecParam
	str	x0, [x21]
	cbz	x0, .L113
.L109:
	mov	w0, w20
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L111:
	ldr	x3, .LC60
	mov	w4, w19
	ldr	x2, .LC62
	mov	w1, 243
	add	x3, x3, 240
	mov	w0, 20
	mov	w20, 1
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L112:
	ldr	x2, .LC65
	mov	w3, w19
	mov	w1, 249
	mov	w0, 20
	mov	w20, 1
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L113:
	ldr	x2, .LC67
	mov	w3, w19
	mov	w1, 258
	mov	w0, 20
	mov	w20, 1
	bl	dprint_normal
	b	.L109
	.size	VDMDRV_ChnDecReady, .-VDMDRV_ChnDecReady
	.align	3
.LC60:
	.xword	.LANCHOR1
	.align	3
.LC62:
	.xword	.LC61
	.align	3
.LC63:
	.xword	.LANCHOR0
	.align	3
.LC65:
	.xword	.LC64
	.align	3
.LC67:
	.xword	.LC66
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_IsCopy
	.type	VDMDRV_IsCopy, %function
VDMDRV_IsCopy:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L120
	cmp	w20, 2
	mov	w0, 0
	bne	.L116
	ldrb	w0, [x19, 150]
	cmp	w0, 1
	cset	w0, eq
.L116:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L120:
	bl	VDMDRV_IsCopy.part.6
	b	.L116
	.size	VDMDRV_IsCopy, .-VDMDRV_IsCopy
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_PrepairCopy
	.type	VDMDRV_PrepairCopy, %function
VDMDRV_PrepairCopy:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w19, w2
	mov	w20, w1
	mov	x22, x3
	bl	_mcount
	cmp	w19, 2
	bne	.L127
	ldr	x0, [x21]
	mov	w1, w20
	bl	PostPro_PrepairMpeg4CopyParam
	ldr	x0, .LC68
	ldr	x5, [x0, 256]
	cbz	x5, .L126
	ldr	x1, [x21]
	mov	x4, x22
	mov	w3, w20
	mov	w2, 3
	mov	w0, w19
	blr	x5
	cbnz	w0, .L126
.L125:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L126:
	ldr	x3, .LC69
	mov	w4, 2
	ldr	x2, .LC71
	mov	w1, 409
	add	x3, x3, 264
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L127:
	ldr	x3, .LC69
	mov	w4, w19
	ldr	x2, .LC73
	mov	w1, 401
	add	x3, x3, 264
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L125
	.size	VDMDRV_PrepairCopy, .-VDMDRV_PrepairCopy
	.align	3
.LC68:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC69:
	.xword	.LANCHOR1
	.align	3
.LC71:
	.xword	.LC70
	.align	3
.LC73:
	.xword	.LC72
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_DoBeforeDec
	.type	VDMDRV_DoBeforeDec, %function
VDMDRV_DoBeforeDec:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	sxtw	x19, w0
	mov	x24, x2
	mov	x0, x30
	mov	w21, w1
	lsl	x20, x19, 3
	mov	x23, x19
	bl	_mcount
	sub	x20, x20, x19
	ldr	x22, .LC74
	ldr	x0, [x24]
	add	x20, x22, x20, lsl 3
	add	x25, x20, 4
	cbz	x0, .L152
	mov	w0, w21
	bl	VCTRL_GetVidStd
	str	w0, [x20, 12]
	ldr	x1, [x24]
	cbz	x1, .L153
	cmp	w0, 2
	beq	.L154
	bl	VCTRL_IsSedOnlyMode
	uxtb	w0, w0
	cbnz	w0, .L138
	.p2align 2
.L157:
	lsl	x0, x19, 3
	sub	x0, x0, x19
	add	x0, x22, x0, lsl 3
	str	wzr, [x0, 48]
.L139:
	ldr	x0, .LC79
	ldr	x4, [x0, 232]
	cbz	x4, .L141
	lsl	x20, x19, 3
	ldr	x1, [x24]
	sub	x20, x20, x19
	mov	x3, 0
	mov	w2, w23
	add	x20, x22, x20, lsl 3
	ldr	w0, [x20, 12]
	blr	x4
	cbz	w0, .L155
.L141:
	ldr	x2, .LC81
	mov	w1, 468
	mov	w0, 0
	bl	dprint_normal
.L136:
	mov	x2, x25
	mov	w1, 1
	mov	w0, w23
	bl	VDMDRV_AdjustErrRatio
	lsl	x0, x19, 3
	mov	w3, w23
	sub	x19, x0, x19
	mov	x2, 0
	mov	w0, w21
	add	x19, x22, x19, lsl 3
	ldr	w1, [x19, 4]
	bl	VCTRL_VdmPostProc
	mov	w0, w23
	bl	VDMDRV_Reset
	cmp	w21, 3
	bhi	.L156
	add	x21, x22, x21, sxtw 2
	mov	w0, 1
	str	wzr, [x21, 96]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L154:
	ldrb	w1, [x1, 150]
	cmp	w1, 1
	cset	w1, eq
.L132:
	cbnz	w1, .L149
	ldr	x1, [x24]
	bl	VCTRL_IsSedOnlyMode
	uxtb	w0, w0
	cbz	w0, .L157
.L138:
	lsl	x0, x19, 3
	mov	w1, 1
	sub	x0, x0, x19
	add	x0, x22, x0, lsl 3
	str	w1, [x0, 48]
	b	.L139
	.p2align 3
.L149:
	mov	w2, w0
	mov	x3, 0
	mov	w1, w23
	mov	x0, x24
	bl	VDMDRV_PrepairCopy
	cbz	w0, .L135
	ldr	x2, .LC78
	mov	w1, 446
	mov	w0, 0
	bl	dprint_normal
	b	.L136
	.p2align 3
.L135:
	mov	x2, x25
	mov	w1, 0
	mov	w0, w23
	sxtw	x24, w21
	bl	VDMDRV_AdjustErrRatio
	mov	x2, 0
	mov	w1, w23
	mov	w0, 3
	bl	VDMDRV_StartRepair
	ldr	x20, .LC83
.L137:
	ldr	x0, [x20]
	blr	x0
	mov	w3, w0
	lsl	x2, x19, 3
	lsl	x0, x19, 4
	ldr	x4, .LC84
	sub	x2, x2, x19
	sub	x19, x0, x19
	mov	w1, w23
	add	x2, x22, x2, lsl 3
	mov	w0, w21
	add	x19, x4, x19, lsl 2
	str	w3, [x2, 20]
	str	w3, [x19, 4]
	bl	VDMDRV_SetChanIsDec
	ldr	x3, .LC85
	add	x2, x22, 112
	add	x2, x2, x24, lsl 2
	mov	w0, w21
	mov	w4, 486
	add	x3, x3, 288
	mov	w1, 5
	bl	RecordPOS
	ldr	x25, [sp, 64]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L155:
	sxtw	x24, w21
	ldr	x25, .LC82
	lsl	x0, x24, 2
	sub	x1, x0, x24
	lsl	x0, x1, 5
	add	x0, x1, x0
	add	x0, x0, x24
	add	x25, x25, x0
	ldr	w0, [x25, 24]
	cbz	w0, .L150
	ldr	x20, .LC83
.L142:
	mov	x1, 0
	mov	w0, w23
	bl	VDMDRV_StartDec
	b	.L137
	.p2align 3
.L152:
	ldr	x2, .LC76
	mov	w3, w21
	mov	w1, 436
	mov	w0, 20
	bl	dprint_normal
	ldr	x25, [sp, 64]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L156:
	bl	VDMDRV_ClearChanIsDec.part.4
	ldr	x25, [sp, 64]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L150:
	ldr	w0, [x20, 48]
	ldr	x20, .LC83
	cmp	w0, 1
	beq	.L142
	ldr	x0, [x20]
	blr	x0
	str	w0, [x25, 24]
	b	.L142
	.p2align 3
.L153:
	bl	VDMDRV_IsCopy.part.6
	mov	w1, w0
	ldr	w0, [x20, 12]
	b	.L132
	.size	VDMDRV_DoBeforeDec, .-VDMDRV_DoBeforeDec
	.align	3
.LC74:
	.xword	.LANCHOR0
	.align	3
.LC76:
	.xword	.LC75
	.align	3
.LC78:
	.xword	.LC77
	.align	3
.LC79:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC81:
	.xword	.LC80
	.align	3
.LC82:
	.xword	g_VfmwChanStat
	.align	3
.LC83:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC84:
	.xword	g_VfmwGlobalStat
	.align	3
.LC85:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_ActivateVDH
	.type	VDMDRV_ActivateVDH, %function
VDMDRV_ActivateVDH:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	sxtw	x19, w0
	mov	x0, x30
	mov	x23, x19
	bl	_mcount
	ldr	x1, .LC87
	lsl	x0, x19, 3
	sub	x19, x0, x19
	lsl	x19, x19, 3
	ldr	w0, [x1, 80]
	add	x22, x1, x19
	add	x22, x22, 40
	tbnz	w0, #31, .L158
	add	x19, x1, x19
	add	x21, x1, 84
	add	x20, x1, 96
	mov	x24, x19
.L160:
	mov	w1, w0
	str	w0, [x19, 8]
	mov	x2, x22
	mov	w0, w23
	bl	VDMDRV_ChnDecReady
	cbz	w0, .L161
.L163:
	cmp	x21, x20
	beq	.L158
	ldr	w0, [x21], 4
	tbz	w0, #31, .L160
.L158:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L161:
	ldr	w1, [x24, 8]
	mov	x2, x22
	mov	w0, w23
	bl	VDMDRV_DoBeforeDec
	cbnz	w0, .L163
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	VDMDRV_ActivateVDH, .-VDMDRV_ActivateVDH
	.align	3
.LC87:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_AfterDec
	.type	VDMDRV_AfterDec, %function
VDMDRV_AfterDec:
	stp	x29, x30, [sp, -256]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	sxtw	x22, w0
	mov	x0, x30
	uxtb	w24, w1
	mov	x23, x22
	bl	_mcount
	ldr	x19, .LC89
	mov	x2, 160
	mov	w1, 0
	add	x0, x29, 96
	ldr	x3, [x19, 96]
	add	x25, x0, 4
	stp	xzr, xzr, [x29, 96]
	stp	xzr, xzr, [x29, 112]
	stp	xzr, xzr, [x29, 128]
	stp	xzr, xzr, [x29, 144]
	stp	xzr, xzr, [x29, 160]
	stp	xzr, xzr, [x29, 176]
	stp	xzr, xzr, [x29, 192]
	stp	xzr, xzr, [x29, 208]
	stp	xzr, xzr, [x29, 224]
	stp	xzr, xzr, [x29, 240]
	blr	x3
	ldr	x3, [x19, 96]
	mov	x2, 136
	mov	w1, 0
	mov	x0, x25
	lsl	x19, x22, 3
	blr	x3
	sub	x19, x19, x22
	ldr	x21, .LC91
	lsl	x19, x19, 3
	ldr	x0, .LC90
	add	x20, x21, x19
	ldr	x2, .LC93
	ldr	w3, [x21, x19]
	strb	w24, [x29, 248]
	ldrsw	x1, [x20, 8]
	ldr	w4, [x20, 28]
	ldr	w5, [x20, 4]
	ldr	x0, [x0, x1, lsl 3]
	mov	w1, 706
	add	x0, x0, 217088
	ldr	w0, [x0, 3932]
	str	w0, [x29, 96]
	mov	w0, 3
	bl	dprint_normal
	ldr	w4, [x21, x19]
	cmp	w4, 2
	beq	.L166
	cmp	w4, 3
	beq	.L167
	cmp	w4, 1
	beq	.L215
	ldr	x2, .LC101
	mov	w5, w24
	ldr	w3, [x20, 8]
	mov	w1, 723
	mov	w0, 0
	bl	dprint_normal
	ldr	w0, [x20, 8]
	cmp	w0, 3
	bhi	.L216
	add	x21, x21, x0, sxtw 2
	str	wzr, [x21, 96]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 256
	ret
	.p2align 3
.L215:
	ldr	w0, [x20, 8]
	add	x24, x20, 4
	bl	FSP_CheckIfFsPolluted
	ldr	w0, [x20, 28]
	cmp	w0, 1
	beq	.L217
	mov	w1, 2
	mov	x2, x24
	mov	w0, w22
	bl	VDMDRV_AdjustErrRatio
	ldr	w1, [x20, 4]
	cbz	w1, .L170
	ldr	x0, .LC96
	ldr	x4, [x0]
	cbz	x4, .L170
	add	x2, x29, 256
	ldr	w0, [x20, 8]
	mov	w3, 4
	str	w1, [x2, -168]!
	mov	w1, 43
	blr	x4
.L170:
	ldr	w0, [x29, 96]
	cmp	w0, 1
	beq	.L218
.L171:
	lsl	x19, x22, 3
	sub	x19, x19, x22
	add	x19, x21, x19, lsl 3
	ldp	w0, w1, [x19, 8]
	ldr	x2, [x19, 40]
	bl	PostPro_GetRepairStratage
	ldr	w1, [x19, 4]
	cmp	w1, wzr
	ccmp	w0, 1, 4, ne
	beq	.L219
	ldr	x0, .LC97
	ldr	x5, [x0, 256]
	cbz	x5, .L176
	ldr	w0, [x19, 12]
	mov	w3, w23
	ldr	x1, [x19, 40]
	mov	w2, 3
	ldr	x4, [x29, 240]
	blr	x5
	cbz	w0, .L220
.L176:
	lsl	x19, x22, 3
	mov	x2, x24
	sub	x19, x19, x22
	mov	w1, 1
	mov	w0, w23
	add	x19, x21, x19, lsl 3
	bl	VDMDRV_AdjustErrRatio
	mov	w3, w23
	add	x2, x29, 100
	ldp	w1, w0, [x19, 4]
.L214:
	bl	VCTRL_VdmPostProc
	ldr	w0, [x19, 8]
	bl	VCTRL_ClearDecparam
	ldr	w0, [x19, 8]
	cmp	w0, 3
	bhi	.L221
	add	x0, x21, x0, sxtw 2
	str	wzr, [x0, 96]
.L190:
	lsl	x0, x22, 3
	sub	x22, x0, x22
	lsl	x22, x22, 3
	str	wzr, [x21, x22]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 256
	ret
	.p2align 3
.L167:
	ldr	x19, .LC97
	str	wzr, [x20, 28]
	str	wzr, [x29, 88]
	ldr	x1, [x19, 312]
	cbz	x1, .L179
	add	x0, x29, 88
	blr	x1
.L179:
	lsl	x0, x22, 3
	sub	x0, x0, x22
	add	x0, x21, x0, lsl 3
	ldr	x1, [x0, 40]
	ldr	w0, [x0, 12]
	cbz	x1, .L222
	cmp	w0, 2
	beq	.L223
.L210:
	ldr	w0, [x29, 88]
	cbz	w0, .L183
	ldr	x5, [x19, 256]
	cbz	x5, .L188
	lsl	x19, x22, 3
	ldr	x4, [x29, 240]
	sub	x19, x19, x22
	mov	w3, w23
	mov	w2, 2
	add	x19, x21, x19, lsl 3
	ldr	w0, [x19, 12]
	ldr	x1, [x19, 40]
	blr	x5
	cbz	w0, .L224
.L188:
	lsl	x19, x22, 3
	mov	w1, 1
	sub	x19, x19, x22
	mov	w0, w23
	add	x19, x21, x19, lsl 3
	add	x2, x19, 4
	bl	VDMDRV_AdjustErrRatio
	mov	w3, w23
	add	x2, x29, 100
	ldp	w1, w0, [x19, 4]
	b	.L214
	.p2align 3
.L166:
	ldp	w1, w0, [x20, 4]
	mov	w3, w22
	mov	x2, x25
	str	wzr, [x20, 28]
	bl	VCTRL_VdmPostProc
	ldr	w0, [x20, 8]
	bl	VCTRL_ClearDecparam
	ldr	w0, [x20, 8]
	cmp	w0, 3
	bhi	.L211
.L185:
	add	x21, x21, x0, sxtw 2
	str	wzr, [x21, 96]
.L186:
	mov	w0, w23
	bl	VDMDRV_Reset
	mov	w0, w23
	bl	VDMDRV_ActivateVDH
.L164:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 256
	ret
	.p2align 3
.L223:
	ldrb	w0, [x1, 150]
	cmp	w0, 1
	cset	w0, eq
.L181:
	cbz	w0, .L210
.L183:
	lsl	x0, x22, 3
	mov	w3, w23
	sub	x22, x0, x22
	add	x2, x29, 100
	add	x22, x21, x22, lsl 3
	ldp	w1, w0, [x22, 4]
	bl	VCTRL_VdmPostProc
	ldr	w0, [x22, 8]
	bl	VCTRL_ClearDecparam
	ldr	w0, [x22, 8]
	cmp	w0, 3
	bls	.L185
.L211:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L186
	.p2align 3
.L217:
	ldr	x1, [x20, 40]
	mov	w2, w22
	ldr	w0, [x20, 12]
	bl	PostPro_SetFullRepair
	str	wzr, [x20, 28]
	ldrb	w3, [x29, 248]
	mov	w1, 574
	ldr	x2, .LC95
	str	w0, [x20, 4]
	mov	w0, 0
	bl	dprint_normal
	b	.L170
	.p2align 3
.L216:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L164
	.p2align 3
.L219:
	ldr	w0, [x19, 8]
	mov	w3, w23
	add	x2, x29, 100
	bl	VCTRL_VdmPostProc
	ldr	w0, [x19, 8]
	bl	VCTRL_ClearDecparam
	ldr	w0, [x19, 8]
	cmp	w0, 3
	bls	.L185
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L186
	.p2align 3
.L221:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L190
	.p2align 3
.L218:
	mov	x2, x24
	mov	w1, 0
	mov	w0, w23
	bl	VDMDRV_AdjustErrRatio
	b	.L171
	.p2align 3
.L220:
	ldr	x2, [x29, 240]
	mov	w1, w23
	mov	w0, 3
	bl	VDMDRV_StartRepair
	lsl	x2, x22, 4
	ldr	x3, .LC98
	sub	x22, x2, x22
	ldr	x2, .LC99
	ldr	w0, [x19, 8]
	mov	w4, 613
	add	x2, x2, x22, lsl 2
	add	x3, x3, 312
	add	x2, x2, 4
	mov	w1, 7
	bl	RecordPOS
	b	.L164
	.p2align 3
.L222:
	bl	VDMDRV_IsCopy.part.6
	b	.L181
	.p2align 3
.L224:
	ldr	x2, [x29, 240]
	mov	w1, w23
	mov	w0, 2
	bl	VDMDRV_StartRepair
	lsl	x2, x22, 4
	ldr	x3, .LC98
	sub	x22, x2, x22
	ldr	x2, .LC99
	ldr	w0, [x19, 8]
	mov	w4, 660
	add	x2, x2, x22, lsl 2
	add	x3, x3, 344
	add	x2, x2, 4
	mov	w1, 7
	bl	RecordPOS
	b	.L164
	.size	VDMDRV_AfterDec, .-VDMDRV_AfterDec
	.align	3
.LC89:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC90:
	.xword	s_pstVfmwChan
	.align	3
.LC91:
	.xword	.LANCHOR0
	.align	3
.LC93:
	.xword	.LC92
	.align	3
.LC95:
	.xword	.LC94
	.align	3
.LC96:
	.xword	g_EventReportFunc
	.align	3
.LC97:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC98:
	.xword	.LANCHOR1
	.align	3
.LC99:
	.xword	g_VfmwGlobalStat
	.align	3
.LC101:
	.xword	.LC100
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_CheckDevice
	.type	VDMDRV_CheckDevice, %function
VDMDRV_CheckDevice:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	sxtw	x20, w0
	mov	x0, x30
	mov	x22, x20
	bl	_mcount
	ldr	x21, .LC102
	lsl	x0, x20, 3
	sub	x0, x0, x20
	lsl	x0, x0, 3
	ldr	w1, [x21, x0]
	cbnz	w1, .L241
	add	x20, x21, x20, lsl 2
	mov	w0, 0
	ldr	w1, [x20, 56]
	cbz	w1, .L238
	cmp	w1, 1
	beq	.L242
.L229:
	mov	w0, 1
.L238:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L241:
	ldr	x1, .LC103
	add	x19, x21, x0
	ldr	x0, [x1]
	blr	x0
	str	w0, [x19, 24]
	ldr	w1, [x19, 20]
	cmp	w0, w1
	bcc	.L227
	sub	w4, w0, w1
	cmp	w4, wzr
	ccmp	w1, wzr, 4, ge
	beq	.L227
	cmp	w4, 500
	bls	.L229
	ldr	x2, .LC105
	mov	w1, 780
	ldr	w3, [x19, 8]
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC106
	ldr	x4, [x0]
	cbz	x4, .L230
	ldr	w0, [x19, 8]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 20
	blr	x4
.L230:
	ldr	x0, .LC107
	ldr	x1, [x0, 136]
	cbz	x1, .L231
	mov	w0, w22
	blr	x1
.L232:
	lsl	x0, x20, 3
	mov	w2, 1
	sub	x20, x0, x20
	mov	w1, 0
	lsl	x20, x20, 3
	mov	w0, w22
	add	x19, x21, x20
	str	w2, [x19, 28]
	bl	VDMDRV_AfterDec
	str	wzr, [x21, x20]
	ldr	w0, [x19, 8]
	str	wzr, [x19, 28]
	cmp	w0, 3
	bhi	.L243
	add	x20, x21, x0, sxtw 2
	mov	w0, 0
	str	wzr, [x20, 96]
	b	.L238
	.p2align 3
.L227:
	str	w0, [x19, 20]
	mov	w0, 1
	b	.L238
	.p2align 3
.L242:
	mov	w2, 2
	str	w2, [x20, 56]
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L243:
	bl	VDMDRV_ClearChanIsDec.part.4
	mov	w0, 0
	b	.L238
	.p2align 3
.L231:
	mov	w3, 791
	ldr	x2, .LC108
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L232
	.size	VDMDRV_CheckDevice, .-VDMDRV_CheckDevice
	.align	3
.LC102:
	.xword	.LANCHOR0
	.align	3
.LC103:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC105:
	.xword	.LC104
	.align	3
.LC106:
	.xword	g_EventReportFunc
	.align	3
.LC107:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC108:
	.xword	.LC46
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_GetMb0QpInCurrPic
	.type	VDMDRV_GetMb0QpInCurrPic, %function
VDMDRV_GetMb0QpInCurrPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sxtw	x0, w19
	ldr	x2, .LC109
	lsl	x1, x0, 2
	ldr	x19, [sp, 16]
	sub	x1, x1, x0
	lsl	x1, x1, 3
	sub	x0, x1, x0
	ldp	x29, x30, [sp], 32
	add	x0, x2, x0, lsl 3
	ldr	w0, [x0, 136]
	and	w0, w0, 31
	ret
	.size	VDMDRV_GetMb0QpInCurrPic, .-VDMDRV_GetMb0QpInCurrPic
	.align	3
.LC109:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_GetSwitchRounding
	.type	VDMDRV_GetSwitchRounding, %function
VDMDRV_GetSwitchRounding:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sxtw	x0, w19
	ldr	x2, .LC110
	lsl	x1, x0, 2
	ldr	x19, [sp, 16]
	sub	x1, x1, x0
	lsl	x1, x1, 3
	sub	x0, x1, x0
	ldp	x29, x30, [sp], 32
	add	x0, x2, x0, lsl 3
	ldr	w0, [x0, 140]
	and	w0, w0, 1
	ret
	.size	VDMDRV_GetSwitchRounding, .-VDMDRV_GetSwitchRounding
	.align	3
.LC110:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_IsrProcess
	.type	VDMDRV_IsrProcess, %function
VDMDRV_IsrProcess:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	cmp	w20, wzr
	ble	.L247
	ldr	x3, .LC111
	mov	w4, w20
	ldr	x2, .LC113
	mov	w5, 0
	add	x3, x3, 376
	mov	w1, 1064
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L247:
	mov	w0, 9
	sxtw	x19, w20
	bl	VCTRL_RecordPosTime
	ldr	x22, .LC114
	mov	w0, 0
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x21, .LC115
	lsl	x0, x19, 3
	sub	x0, x0, x19
	add	x0, x21, x0, lsl 3
	ldr	w24, [x0, 8]
	cmp	w24, 3
	bhi	.L320
	ldr	x25, .LC118
	ldr	x0, [x25, w24, sxtw 3]
	cbz	x0, .L290
	add	x0, x0, 217088
	ldr	w27, [x0, 3932]
.L251:
	ldr	x23, .LC119
	ldr	x2, [x23, 296]
	cbz	x2, .L291
	mov	w1, w20
	mov	w0, 2
	blr	x2
	mov	w26, w0
	ldr	x2, [x23, 296]
	cbz	x2, .L292
	mov	w1, w20
	mov	w0, 1
	mov	w28, 0
	blr	x2
	str	w0, [x29, 108]
	ldr	x2, [x23, 296]
	cbz	x2, .L252
	mov	w1, w20
	mov	w0, 3
	blr	x2
	mov	w28, w0
.L252:
	ldr	x2, [x23, 304]
	cbz	x2, .L253
	mov	w1, w20
	mov	w0, 2
	blr	x2
	cmp	w0, 1
	ldr	x1, [x25, w24, sxtw 3]
	cset	w0, eq
	cmp	x1, xzr
	cset	w1, eq
	tst	w0, w1
	bne	.L321
	cmp	w26, 1
	beq	.L257
	cmp	w27, 1
	cset	w1, eq
	tst	w0, w1
	beq	.L289
.L257:
	ldr	x1, [x23, 280]
	cbz	x1, .L322
	mov	w0, w20
	blr	x1
.L263:
	ldr	x1, [x23, 160]
	cbz	x1, .L264
	mov	w0, w20
	blr	x1
.L265:
	lsl	x0, x19, 3
	ldr	x3, .LC111
	sub	x0, x0, x19
	add	x5, x21, 312
	mov	w4, 1098
	add	x3, x3, 424
	add	x0, x21, x0, lsl 3
	mov	w1, 6
	ldr	w2, [x0, 8]
	mov	w0, w2
	add	x2, x5, x2, sxtw 2
	bl	RecordPOS
	ldr	x0, [x22]
	blr	x0
	lsl	x1, x19, 4
	ldr	x4, .LC121
	sub	x1, x1, x19
	lsl	x1, x1, 2
	add	x5, x4, x1
	ldr	w3, [x5, 4]
	cbz	w3, .L267
	ldr	w6, [x4, x1]
	add	w2, w6, 49152
	add	w2, w2, 848
	cmp	w3, w2
	bhi	.L268
	ldr	w5, [x5, 8]
.L269:
	lsl	x2, x19, 2
	lsl	x1, x19, 4
	sub	x2, x2, x19
	sub	x1, x1, x19
	lsl	x2, x2, 3
	sub	w3, w0, w3
	sub	x2, x2, x19
	add	x1, x4, x1, lsl 2
	sub	w0, w0, w6
	add	w3, w3, w5
	add	x2, x21, x2, lsl 3
	cmp	w0, 999
	stp	wzr, w3, [x1, 4]
	ldr	w6, [x2, 152]
	ldr	w2, [x1, 32]
	add	w6, w2, w6, lsr 10
	ldr	w2, [x1, 28]
	add	w7, w2, 1
	stp	w7, w6, [x1, 28]
	bls	.L267
	lsl	x2, x19, 3
	sub	x2, x2, x19
	add	x2, x21, x2, lsl 3
	ldr	w5, [x2, 16]
	cbnz	w5, .L271
	ldr	w5, [x1, 12]
.L272:
	lsl	w1, w5, 6
	sub	w1, w1, w5
	lsl	w1, w1, 1
	sub	w5, w1, w5
	lsl	w1, w3, 6
	sub	w1, w1, w3
	lsl	w5, w5, 3
	lsl	w1, w1, 1
	udiv	w5, w5, w0
	sub	w3, w1, w3
	lsl	w1, w7, 6
	lsl	w3, w3, 3
	sub	w2, w1, w7
	lsl	x1, x19, 4
	sub	x1, x1, x19
	lsl	w2, w2, 1
	lsl	x1, x1, 2
	sub	w2, w2, w7
	lsl	w2, w2, 3
	str	wzr, [x4, x1]
	add	x1, x4, x1
	udiv	w3, w3, w0
	stp	w3, w5, [x1, 16]
	stp	wzr, w6, [x1, 32]
	str	w0, [x1, 40]
	udiv	w2, w2, w0
	stp	w2, wzr, [x1, 24]
.L267:
	lsl	x0, x19, 3
	sub	x0, x0, x19
	lsl	x0, x0, 3
	add	x1, x21, x0
	ldr	w2, [x1, 48]
	ldr	w23, [x1, 8]
	cmp	w2, 1
	beq	.L323
	ldr	w3, [x21, x0]
	cbz	w3, .L275
	ldr	x0, [x1, 40]
	cbz	x0, .L324
.L275:
	mov	w0, w23
	bl	VCTRL_IsChanActive
	cbnz	w0, .L325
	mov	w0, w23
	bl	VCTRL_GetDecParam
	cbz	x0, .L326
	lsl	x1, x19, 3
	ldr	x23, .LC128
	sub	x1, x1, x19
	add	x1, x21, x1, lsl 3
	ldrsw	x0, [x1, 8]
	lsl	x1, x0, 2
	sub	x1, x1, x0
	lsl	x2, x1, 5
	add	x1, x1, x2
	add	x0, x1, x0
	add	x23, x23, x0
	ldr	w0, [x23, 28]
	cbz	w0, .L327
.L288:
	mov	w1, 1
	mov	w0, w20
	bl	VDMDRV_AfterDec
.L278:
	lsl	x0, x19, 3
	sub	x0, x0, x19
	add	x0, x21, x0, lsl 3
	ldr	w0, [x0, 8]
	bl	VCTRL_InformVdmFree
	ldr	x1, [x22, 32]
	mov	w0, 0
	blr	x1
	lsl	x1, x19, 2
	mov	w0, 1
	sub	x1, x1, x19
	lsl	x1, x1, 3
	sub	x19, x1, x19
	add	x21, x21, x19, lsl 3
	ldr	w1, [x21, 152]
	bl	VCTRL_RecordData
	mov	w0, 10
	bl	VCTRL_RecordPosTime
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L253:
	cmp	w26, 1
	beq	.L257
.L289:
	cbnz	w26, .L280
	ldr	w0, [x29, 108]
	cmp	w0, 1
	ccmp	w28, 1, 0, eq
	beq	.L280
	ldr	x1, [x23, 248]
	cbz	x1, .L261
	mov	w0, w20
	blr	x1
	cbnz	w0, .L280
.L261:
	ldr	x2, [x23, 296]
	cbz	x2, .L256
	mov	w1, w20
	mov	w0, 1
	blr	x2
	cbz	w0, .L256
.L280:
	lsl	x0, x19, 3
	sub	x19, x0, x19
	add	x21, x21, x19, lsl 3
	ldr	w0, [x21, 8]
	bl	VCTRL_InformVdmFree
	ldr	x1, [x22, 32]
	mov	w0, 0
	blr	x1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L325:
	mov	w3, 1039
	ldr	x2, .LC125
	mov	w4, w23
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
.L274:
	lsl	x0, x19, 3
	sub	x0, x0, x19
	add	x0, x21, x0, lsl 3
	ldr	w0, [x0, 8]
	cmp	w0, 3
	bhi	.L328
	add	x0, x21, x0, sxtw 2
	str	wzr, [x0, 96]
.L279:
	lsl	x0, x19, 3
	sub	x0, x0, x19
	lsl	x0, x0, 3
	str	wzr, [x21, x0]
	b	.L278
	.p2align 3
.L291:
	mov	w26, 0
	mov	w28, 0
	str	wzr, [x29, 108]
	b	.L252
	.p2align 3
.L268:
	str	w3, [x4, x1]
	mov	w6, w3
	mov	w5, 0
	b	.L269
	.p2align 3
.L320:
	ldr	x3, .LC111
	mov	w4, 901
	ldr	x2, .LC117
	mov	w1, w4
	add	x3, x3, 400
	mov	w0, 32
	bl	dprint_normal
	b	.L280
	.p2align 3
.L321:
	ldr	x1, [x23, 160]
	cbz	x1, .L255
	mov	w0, w20
	blr	x1
.L256:
	lsl	x0, x19, 3
	sub	x0, x0, x19
	add	x0, x21, x0, lsl 3
	ldr	w0, [x0, 8]
	cmp	w0, 3
	bhi	.L329
	add	x0, x21, x0, sxtw 2
	str	wzr, [x0, 96]
.L262:
	lsl	x0, x19, 3
	sub	x0, x0, x19
	lsl	x0, x0, 3
	str	wzr, [x21, x0]
	b	.L280
	.p2align 3
.L271:
	udiv	w5, w6, w5
	str	w5, [x1, 12]
	b	.L272
	.p2align 3
.L290:
	mov	w27, 0
	b	.L251
	.p2align 3
.L264:
	mov	w3, 1096
	ldr	x2, .LC120
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L265
	.p2align 3
.L322:
	mov	w3, 1094
	ldr	x2, .LC120
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L263
	.p2align 3
.L328:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L279
	.p2align 3
.L327:
	ldr	x0, [x22]
	blr	x0
	str	w0, [x23, 28]
	b	.L288
	.p2align 3
.L323:
	mov	w1, w20
	mov	w0, w23
	bl	VCTRL_VdmProcSedOnly
	b	.L274
	.p2align 3
.L326:
	mov	w3, 1045
	ldr	x2, .LC127
	mov	w4, w23
	mov	w1, w3
	bl	dprint_normal
	b	.L274
	.p2align 3
.L324:
	ldr	x2, .LC123
	mov	w1, 1027
	bl	dprint_normal
	mov	w0, w23
	bl	VCTRL_GetDecParam
	cbz	x0, .L274
	mov	w3, w20
	mov	x2, 0
	mov	w1, 100
	mov	w0, w23
	bl	VCTRL_VdmPostProc
	b	.L274
	.p2align 3
.L329:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L262
.L255:
	mov	w3, 915
	ldr	x2, .LC120
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L256
.L292:
	mov	w28, 0
	str	wzr, [x29, 108]
	b	.L252
	.size	VDMDRV_IsrProcess, .-VDMDRV_IsrProcess
	.align	3
.LC111:
	.xword	.LANCHOR1
	.align	3
.LC113:
	.xword	.LC112
	.align	3
.LC114:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC115:
	.xword	.LANCHOR0
	.align	3
.LC117:
	.xword	.LC116
	.align	3
.LC118:
	.xword	s_pstVfmwChan
	.align	3
.LC119:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC120:
	.xword	.LC46
	.align	3
.LC121:
	.xword	g_VfmwGlobalStat
	.align	3
.LC123:
	.xword	.LC122
	.align	3
.LC125:
	.xword	.LC124
	.align	3
.LC127:
	.xword	.LC126
	.align	3
.LC128:
	.xword	g_VfmwChanStat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_MMUIntServeProc
	.type	VDMDRV_MMUIntServeProc, %function
VDMDRV_MMUIntServeProc:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L351
	ldr	x20, .LC132
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	ldr	x19, .LC133
	ldr	x2, [x19, 192]
	cbz	x2, .L336
	mov	w1, 0
	mov	w0, 5
	blr	x2
	mov	w21, w0
	ldr	x2, [x19, 192]
	cbz	x2, .L352
	mov	w1, 0
	mov	w0, 6
	and	w22, w21, 15
	mov	w23, 0
	blr	x2
	mov	w24, w0
	ldr	x2, [x19, 192]
	cbz	x2, .L333
	mov	w1, 0
	mov	w0, 7
	blr	x2
	mov	w23, w0
.L333:
	cbz	w22, .L336
	tbnz	x21, 2, .L353
	tbnz	x21, 3, .L354
	.p2align 2
.L336:
	ldr	x1, [x19, 168]
	cbz	x1, .L339
	mov	w0, 0
	blr	x1
.L340:
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L351:
	ldr	x3, .LC130
	mov	w4, 1135
	ldr	x2, .LC131
	mov	w1, w4
	add	x3, x3, 448
	mov	w0, 1
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L354:
	ldr	x2, .LC137
	mov	w4, w23
	mov	w3, w21
	mov	w1, 1157
	mov	w0, 32
	bl	dprint_normal
	b	.L336
	.p2align 3
.L353:
	ldr	x2, .LC135
	mov	w4, w24
	mov	w3, w21
	mov	w1, 1152
	mov	w0, 32
	bl	dprint_normal
	tbz	x21, 3, .L336
	b	.L354
	.p2align 3
.L339:
	mov	w3, 1161
	ldr	x2, .LC138
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L340
.L352:
	and	w22, w0, 15
	mov	w24, 0
	mov	w23, 0
	b	.L333
	.size	VDMDRV_MMUIntServeProc, .-VDMDRV_MMUIntServeProc
	.align	3
.LC130:
	.xword	.LANCHOR1
	.align	3
.LC131:
	.xword	.LC7
	.align	3
.LC132:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC133:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC135:
	.xword	.LC134
	.align	3
.LC137:
	.xword	.LC136
	.align	3
.LC138:
	.xword	.LC46
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_IsVdmInISR
	.type	VDMDRV_IsVdmInISR, %function
VDMDRV_IsVdmInISR:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMDRV_IsVdmInISR, .-VDMDRV_IsVdmInISR
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_WakeUpVdm
	.type	VDMDRV_WakeUpVdm, %function
VDMDRV_WakeUpVdm:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	bl	VDMDRV_CheckDevice
	cbz	w0, .L358
	ldp	x29, x30, [sp], 16
	ret
	.p2align 3
.L358:
	bl	VDMDRV_ActivateVDH
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMDRV_WakeUpVdm, .-VDMDRV_WakeUpVdm
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_SetStateIdle
	.type	VDMDRV_SetStateIdle, %function
VDMDRV_SetStateIdle:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L362
	ldr	x0, .LC139
	str	wzr, [x0]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L362:
	bl	VDMDRV_SetStateIdle.part.9
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_SetStateIdle, .-VDMDRV_SetStateIdle
	.align	3
.LC139:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_IsVdmIdle
	.type	VDMDRV_IsVdmIdle, %function
VDMDRV_IsVdmIdle:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sxtw	x0, w19
	ldr	x2, .LC140
	lsl	x1, x0, 3
	ldr	x19, [sp, 16]
	sub	x0, x1, x0
	lsl	x0, x0, 3
	ldp	x29, x30, [sp], 32
	ldr	w0, [x2, x0]
	cmp	w0, wzr
	cset	w0, ne
	ret
	.size	VDMDRV_IsVdmIdle, .-VDMDRV_IsVdmIdle
	.align	3
.LC140:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_GetCurrChanID
	.type	VDMDRV_GetCurrChanID, %function
VDMDRV_GetCurrChanID:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sxtw	x0, w19
	ldr	x2, .LC141
	lsl	x1, x0, 3
	ldr	x19, [sp, 16]
	sub	x0, x1, x0
	ldp	x29, x30, [sp], 32
	add	x0, x2, x0, lsl 3
	ldr	w0, [x0, 8]
	ret
	.size	VDMDRV_GetCurrChanID, .-VDMDRV_GetCurrChanID
	.align	3
.LC141:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_WaitVdmReadyIfNoIsr
	.type	VDMDRV_WaitVdmReadyIfNoIsr, %function
VDMDRV_WaitVdmReadyIfNoIsr:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w19, 0
	bl	_mcount
	ldr	x20, .LC142
	b	.L367
	.p2align 3
.L369:
	add	w19, w19, 1
	cmp	w19, 400
	beq	.L368
.L367:
	ldr	x1, [x20, 240]
	mov	w0, w21
	cbz	x1, .L369
	blr	x1
	cbz	w0, .L369
.L368:
	cmp	w19, 399
	ldr	x21, [sp, 32]
	cset	w0, hi
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	VDMDRV_WaitVdmReadyIfNoIsr, .-VDMDRV_WaitVdmReadyIfNoIsr
	.align	3
.LC142:
	.xword	g_vdm_hal_fun_ptr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_ResetVDH
	.type	VDMDRV_ResetVDH, %function
VDMDRV_ResetVDH:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L375
	ldr	x20, .LC143
	ldr	w0, [x20, 8]
	cmp	w19, w0
	beq	.L381
.L374:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L375:
	ldr	x3, .LC144
	mov	w4, 1242
	ldr	x2, .LC145
	mov	w1, w4
	add	x3, x3, 472
	mov	w0, 1
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L381:
	ldr	x0, .LC146
	ldr	x1, [x0, 136]
	cbz	x1, .L378
	mov	w0, 0
	blr	x1
	str	wzr, [x20]
	b	.L374
.L378:
	mov	w3, 1257
	ldr	x2, .LC147
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	str	wzr, [x20]
	b	.L374
	.size	VDMDRV_ResetVDH, .-VDMDRV_ResetVDH
	.align	3
.LC143:
	.xword	.LANCHOR0
	.align	3
.LC144:
	.xword	.LANCHOR1
	.align	3
.LC145:
	.xword	.LC7
	.align	3
.LC146:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC147:
	.xword	.LC46
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_MarkReloadDsp
	.type	VDMDRV_MarkReloadDsp, %function
VDMDRV_MarkReloadDsp:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cbnz	w20, .L390
	add	w0, w19, 1
	cmp	w0, 4
	bhi	.L391
	ldr	x0, .LC151
	mov	w1, 1
	cmn	w19, #1
	str	w1, [x0, 36]
	beq	.L382
	ldr	x0, .LC152
	mov	w8, -1
	ldr	x3, .LC148
	mov	w4, 1280
	ldr	x2, .LC154
	mov	w5, 0
	ldr	x7, [x0, w19, sxtw 3]
	add	x3, x3, 488
	ldr	x6, [x0]
	mov	w1, w4
	mov	w0, 20
	str	w8, [x7, 36]
	ldr	w6, [x6, 36]
	bl	dprint_normal
.L382:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L390:
	ldr	x3, .LC148
	mov	w4, 1271
.L389:
	ldr	x2, .LC150
	mov	w1, w4
	add	x3, x3, 488
	mov	w0, 32
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L391:
	ldr	x3, .LC148
	mov	w4, 1272
	b	.L389
	.size	VDMDRV_MarkReloadDsp, .-VDMDRV_MarkReloadDsp
	.align	3
.LC148:
	.xword	.LANCHOR1
	.align	3
.LC150:
	.xword	.LC149
	.align	3
.LC151:
	.xword	.LANCHOR0
	.align	3
.LC152:
	.xword	s_pstVfmwChan
	.align	3
.LC154:
	.xword	.LC153
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_UpdateMatchMode
	.type	VDMDRV_UpdateMatchMode, %function
VDMDRV_UpdateMatchMode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cbnz	w20, .L397
	cmp	w19, 3
	bhi	.L398
	ldr	x0, .LC157
	mov	w7, 1
	ldr	x3, .LC155
	mov	w4, 1293
	ldr	x2, .LC159
	mov	w6, w19
	ldr	x8, [x0, w19, sxtw 3]
	mov	w5, w7
	add	x3, x3, 512
	mov	w1, w4
	mov	w0, 20
	str	w7, [x8, 36]
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L398:
	ldr	x3, .LC155
	mov	w4, 1289
.L396:
	ldr	x2, .LC156
	mov	w1, w4
	add	x3, x3, 512
	mov	w0, 32
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L397:
	ldr	x3, .LC155
	mov	w4, 1288
	b	.L396
	.size	VDMDRV_UpdateMatchMode, .-VDMDRV_UpdateMatchMode
	.align	3
.LC155:
	.xword	.LANCHOR1
	.align	3
.LC156:
	.xword	.LC149
	.align	3
.LC157:
	.xword	s_pstVfmwChan
	.align	3
.LC159:
	.xword	.LC158
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
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.6018, %object
	.size	__func__.6018, 22
__func__.6018:
	.string	"VDMDRV_ClearChanIsDec"
	.zero	2
	.type	__func__.6050, %object
	.size	__func__.6050, 14
__func__.6050:
	.string	"VDMDRV_IsCopy"
	.zero	2
	.type	__func__.6222, %object
	.size	__func__.6222, 20
__func__.6222:
	.string	"VDMDRV_SetStateIdle"
	.zero	4
	.type	__func__.5943, %object
	.size	__func__.5943, 12
__func__.5943:
	.string	"VDMDRV_Init"
	.zero	4
	.type	__func__.5947, %object
	.size	__func__.5947, 13
__func__.5947:
	.string	"VDMDRV_Reset"
	.zero	3
	.type	__func__.5957, %object
	.size	__func__.5957, 19
__func__.5957:
	.string	"VDMDRV_SetPriority"
	.zero	5
	.type	__func__.5985, %object
	.size	__func__.5985, 20
__func__.5985:
	.string	"VDMDRV_PrepareSleep"
	.zero	4
	.type	__func__.5989, %object
	.size	__func__.5989, 21
__func__.5989:
	.string	"VDMDRV_GetSleepStage"
	.zero	3
	.type	__func__.5993, %object
	.size	__func__.5993, 18
__func__.5993:
	.string	"VDMDRV_ForceSleep"
	.zero	6
	.type	__func__.5997, %object
	.size	__func__.5997, 17
__func__.5997:
	.string	"VDMDRV_ExitSleep"
	.zero	7
	.type	__func__.6014, %object
	.size	__func__.6014, 20
__func__.6014:
	.string	"VDMDRV_SetChanIsDec"
	.zero	4
	.type	__func__.6032, %object
	.size	__func__.6032, 19
__func__.6032:
	.string	"VDMDRV_ChnDecReady"
	.zero	5
	.type	__func__.6064, %object
	.size	__func__.6064, 19
__func__.6064:
	.string	"VDMDRV_PrepairCopy"
	.zero	5
	.type	__func__.6076, %object
	.size	__func__.6076, 19
__func__.6076:
	.string	"VDMDRV_DoBeforeDec"
	.zero	5
	.type	__func__.6109, %object
	.size	__func__.6109, 29
__func__.6109:
	.string	"VDMDRV_AfterDecProcessNormal"
	.zero	3
	.type	__func__.6123, %object
	.size	__func__.6123, 27
__func__.6123:
	.string	"VDMDRV_AfterOuterPicRepair"
	.zero	5
	.type	__func__.6200, %object
	.size	__func__.6200, 18
__func__.6200:
	.string	"VDMDRV_IsrProcess"
	.zero	6
	.type	__func__.6185, %object
	.size	__func__.6185, 24
__func__.6185:
	.string	"VDMDRV_IsValidInterrupt"
	.type	__FUNCTION__.6201, %object
	.size	__FUNCTION__.6201, 18
__FUNCTION__.6201:
	.string	"VDMDRV_IsrProcess"
	.zero	6
	.type	__func__.6208, %object
	.size	__func__.6208, 23
__func__.6208:
	.string	"VDMDRV_MMUIntServeProc"
	.zero	1
	.type	__func__.6241, %object
	.size	__func__.6241, 16
__func__.6241:
	.string	"VDMDRV_ResetVDH"
	.type	__func__.6250, %object
	.size	__func__.6250, 21
__func__.6250:
	.string	"VDMDRV_MarkReloadDsp"
	.zero	3
	.type	__func__.6255, %object
	.size	__func__.6255, 23
__func__.6255:
	.string	"VDMDRV_UpdateMatchMode"
	.data
	.align	2
	.type	g_Use_FFAPT_Enable, %object
	.size	g_Use_FFAPT_Enable, 4
g_Use_FFAPT_Enable:
	.word	1
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC1:
	ASCII(.string	"Chan %d: CorrectType = %d ErrRatio = %d \n" )
	.zero	6
.LC4:
	ASCII(.string	"Chan %d: Current frame:%d  ErrRatio = %d\n" )
	.zero	6
.LC7:
	ASCII(.string	"[%s %d]assert warning\n" )
	.zero	1
.LC10:
	ASCII(.string	"%s ERROR: pDecParam = NULL!\n" )
	.zero	3
.LC40:
	ASCII(.string	"====== forece VDM sleep! ======\n" )
	.zero	7
.LC46:
	ASCII(.string	"VDMHAL_NULL_FUN_PRINT,L%d\n" )
	.zero	5
.LC61:
	ASCII(.string	"%s The channel %d is not active\n" )
	.zero	7
.LC64:
	ASCII(.string	"The channel %d is decoding\n" )
	.zero	4
.LC66:
	ASCII(.string	"The channel %d DEC PARAM is not ready\n" )
	.zero	1
.LC70:
	ASCII(.string	"%s VidStd %d prepair repair failed!\n" )
	.zero	3
.LC72:
	ASCII(.string	"%s VidStd %d no need repair copy\n" )
	.zero	6
.LC75:
	ASCII(.string	"The channel %d DEC PARAM is not ready(pDecParam == NULL)\n" )
	.zero	6
.LC77:
	ASCII(.string	"VDM prepair copy failed!\n" )
	.zero	6
.LC80:
	ASCII(.string	"VDM prepair decode failed!\n" )
	.zero	4
.LC92:
	ASCII(.string	"isr begin: *pVdmStateMachine = %d, timeout = %d, ErrRatio = %d\n" )
.LC94:
	ASCII(.string	"ISR process vdm timeout! FromInt = %d\n" )
	.zero	1
.LC100:
	ASCII(.string	"Chan %d VdmStateMachine=%d Error! FromInt = %d.\n" )
	.zero	7
.LC104:
	ASCII(.string	"Chan %d VDM Time Out(%d ms), Reset VDM!\n" )
	.zero	7
.LC112:
	ASCII(.string	"%s: VdhId(%d) > %d\n" )
	.zero	4
.LC116:
	ASCII(.string	"%s %d: ASSERT return!\n" )
	.zero	1
.LC122:
	ASCII(.string	"vdm state machine = %d, but DecParam is null!\n" )
	.zero	1
.LC124:
	ASCII(.string	"line :%d ISR called but chan %d is not active!\n" )
.LC126:
	ASCII(.string	"line :%d ISR called chan %d is active! But Dec Param in CTX is NULL!!!\n" )
.LC134:
	ASCII(.string	"SMMU_READ_ERR  MODULE : VFMW \t SMMU INT STATE: 0x%x \t read_err_addr  = 0x%x\n" )
	.zero	3
.LC136:
	ASCII(.string	"SMMU_WRITE_ERR MODULE : VFMW \t SMMU INT STATE: 0x%x \t write_err_addr = 0x%x\n" )
	.zero	3
.LC149:
	ASCII(.string	"%s %d: ASSERT!\n" )
.LC153:
	ASCII(.string	"%s,%d, i = %d, MatchVdhIdPlus1 = %d\n" )
	.zero	3
.LC158:
	ASCII(.string	"%s,%d, MatchVdhIdPlus1 = %d,chanId = %d\n" )
	.bss
	.align	3
.LANCHOR0 = . + 0
	.type	g_VdmDrvParam, %object
	.size	g_VdmDrvParam, 56
g_VdmDrvParam:
	.zero	56
	.type	s_eVdmDrvSleepState, %object
	.size	s_eVdmDrvSleepState, 4
s_eVdmDrvSleepState:
	.zero	4
	.zero	4
	.type	g_ChanCtx, %object
	.size	g_ChanCtx, 48
g_ChanCtx:
	.zero	48
	.type	last_rec_pos_time.6074, %object
	.size	last_rec_pos_time.6074, 16
last_rec_pos_time.6074:
	.zero	16
	.type	g_BackUp, %object
	.size	g_BackUp, 184
g_BackUp:
	.zero	184
	.type	LastRecPosTime.6197, %object
	.size	LastRecPosTime.6197, 16
LastRecPosTime.6197:
	.zero	16
	.type	g_VdmExtParam, %object
	.size	g_VdmExtParam, 44
g_VdmExtParam:
	.zero	44
	.zero	4
	.type	g_DecReport, %object
	.size	g_DecReport, 820
g_DecReport:
	.zero	820
	.zero	4
	.type	g_RepairParam, %object
	.size	g_RepairParam, 3312
g_RepairParam:
	.zero	3312
	.type	g_HwMem, %object
	.size	g_HwMem, 1016
g_HwMem:
	.zero	1016
	.type	g_UpMsg, %object
	.size	g_UpMsg, 3200
g_UpMsg:
	.zero	3200
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
