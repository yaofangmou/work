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
	.type	VDMDRV_SetStateIdle.part.8, %function
VDMDRV_SetStateIdle.part.8:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC9
	mov	w4, 1191
	ldr	x2, .LC10
	mov	w1, w4
	add	x3, x3, 24
	mov	w0, 1
	bl	dprint_normal
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMDRV_SetStateIdle.part.8, .-VDMDRV_SetStateIdle.part.8
	.align	3
.LC9:
	.xword	.LANCHOR1
	.align	3
.LC10:
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
	cbnz	w19, .L24
	ldr	x3, .LC13
	mov	x2, 56
	ldr	x19, .LC14
	mov	w1, 0
	ldr	x3, [x3, 96]
	mov	x0, x19
	blr	x3
	str	wzr, [x19, 56]
	ldr	x0, .LC15
	str	wzr, [x0, 16]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L24:
	ldr	x3, .LC11
	mov	w4, 27
	ldr	x2, .LC12
	mov	w1, w4
	add	x3, x3, 48
	mov	w0, 1
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_Init, .-VDMDRV_Init
	.align	3
.LC11:
	.xword	.LANCHOR1
	.align	3
.LC12:
	.xword	.LC7
	.align	3
.LC13:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC14:
	.xword	.LANCHOR0
	.align	3
.LC15:
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
	cbnz	w19, .L28
	ldr	x3, .LC18
	mov	x2, 56
	ldr	x0, .LC19
	mov	w1, 0
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L28:
	ldr	x3, .LC16
	mov	w4, 38
	ldr	x2, .LC17
	mov	w1, w4
	add	x3, x3, 64
	mov	w0, 1
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_Reset, .-VDMDRV_Reset
	.align	3
.LC16:
	.xword	.LANCHOR1
	.align	3
.LC17:
	.xword	.LC7
	.align	3
.LC18:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC19:
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
	cbz	x19, .L43
	ldr	x6, .LC24
	mov	w3, 0
	mov	w4, 0
	add	x5, x6, 80
.L38:
	mov	x0, 0
	mov	w2, 0
.L33:
	ldr	w1, [x19, x0, lsl 2]
	cmp	w1, w2
	ble	.L32
	mov	w4, w0
	mov	w2, w1
.L32:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L33
	cmp	w2, wzr
	ble	.L44
	str	w4, [x5], 4
	add	w3, w3, 1
	str	wzr, [x19, w4, sxtw 2]
	cmp	w3, 4
	bne	.L38
.L29:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L44:
	cmp	w3, 3
	add	x6, x6, 64
	mov	w1, -1
	bgt	.L29
	.p2align 2
.L39:
	add	x0, x6, x3, sxtw 2
	add	w3, w3, 1
	cmp	w3, 4
	str	w1, [x0, 16]
	bne	.L39
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L43:
	ldr	x3, .LC22
	mov	w4, 52
	ldr	x2, .LC23
	mov	w1, w4
	add	x3, x3, 80
	mov	w0, 1
	bl	dprint_normal
	b	.L29
	.size	VDMDRV_SetPriority, .-VDMDRV_SetPriority
	.align	3
.LC22:
	.xword	.LANCHOR1
	.align	3
.LC23:
	.xword	.LC7
	.align	3
.LC24:
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
	ldr	x8, .LC25
	ldr	w1, [x8, 80]
	cmp	w19, w1
	beq	.L56
	ldr	w1, [x8, 84]
	cmp	w19, w1
	beq	.L54
	ldr	w1, [x8, 88]
	cmp	w19, w1
	beq	.L55
	ldr	w0, [x8, 92]
	cmp	w0, w19
	beq	.L45
.L56:
	mov	x3, 4
	mov	x2, 0
	mov	w0, 0
.L46:
	add	x1, x8, 80
	add	x7, x1, x3
	ldr	w3, [x1, x3]
	tbz	w3, #31, .L50
	b	.L45
	.p2align 3
.L52:
	add	x7, x1, x3, lsl 2
	ldr	w3, [x1, x3, lsl 2]
	tbnz	w3, #31, .L45
.L50:
	add	x4, x8, 64
	ldr	w5, [x1, x2, lsl 2]
	add	w0, w0, 1
	ldr	w6, [x4, w3, sxtw 2]
	ldr	w4, [x4, w5, sxtw 2]
	cmp	w6, w4
	blt	.L51
	str	w3, [x1, x2, lsl 2]
	str	w5, [x7]
.L51:
	cmp	w0, 2
	sxtw	x2, w0
	add	x3, x2, 1
	ble	.L52
.L45:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L54:
	mov	w0, 1
	mov	x2, 1
.L47:
	add	x3, x2, 1
	lsl	x3, x3, 2
	b	.L46
.L55:
	mov	w0, 2
	mov	x2, 2
	b	.L47
	.size	VDMDRV_AdjustPriorityAfterDec, .-VDMDRV_AdjustPriorityAfterDec
	.align	3
.LC25:
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
	cbnz	w19, .L63
	ldr	x1, .LC30
	ldr	w0, [x1, 56]
	cbnz	w0, .L62
	ldr	w0, [x1]
	cbz	w0, .L64
	mov	w2, 1
	mov	w0, 0
	str	w2, [x1, 56]
.L60:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L64:
	mov	w2, 2
	str	w2, [x1, 56]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L62:
	mov	w0, -1
	b	.L60
	.p2align 3
.L63:
	ldr	x3, .LC28
	mov	w4, 125
	ldr	x2, .LC29
	mov	w1, w4
	add	x3, x3, 104
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L60
	.size	VDMDRV_PrepareSleep, .-VDMDRV_PrepareSleep
	.align	3
.LC28:
	.xword	.LANCHOR1
	.align	3
.LC29:
	.xword	.LC7
	.align	3
.LC30:
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
	cbnz	w19, .L68
	ldr	x0, .LC33
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 56]
	ret
	.p2align 3
.L68:
	ldr	x3, .LC31
	mov	w4, 150
	ldr	x2, .LC32
	mov	w1, w4
	add	x3, x3, 128
	mov	w0, 1
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_GetSleepStage, .-VDMDRV_GetSleepStage
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
	.global	VDMDRV_ForceSleep
	.type	VDMDRV_ForceSleep, %function
VDMDRV_ForceSleep:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L76
	ldr	x19, .LC36
	ldr	w0, [x19, 56]
	cmp	w0, 2
	beq	.L72
	mov	w0, 0
	bl	VDMDRV_Reset
	mov	w0, 2
	str	w0, [x19, 56]
.L72:
	ldr	x2, .LC38
	mov	w1, 164
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L76:
	ldr	x3, .LC34
	mov	w4, 156
	ldr	x2, .LC35
	mov	w1, w4
	add	x3, x3, 152
	mov	w0, 1
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_ForceSleep, .-VDMDRV_ForceSleep
	.align	3
.LC34:
	.xword	.LANCHOR1
	.align	3
.LC35:
	.xword	.LC7
	.align	3
.LC36:
	.xword	.LANCHOR0
	.align	3
.LC38:
	.xword	.LC37
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
	cbnz	w19, .L80
	ldr	x0, .LC41
	str	wzr, [x0, 56]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L80:
	ldr	x3, .LC39
	mov	w4, 171
	ldr	x2, .LC40
	mov	w1, w4
	add	x3, x3, 176
	mov	w0, 1
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_ExitSleep, .-VDMDRV_ExitSleep
	.align	3
.LC39:
	.xword	.LANCHOR1
	.align	3
.LC40:
	.xword	.LC7
	.align	3
.LC41:
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
	ldr	x0, .LC42
	ldr	x3, [x0, 216]
	cbz	x3, .L82
	mov	x1, x21
	mov	w0, w19
	blr	x3
.L83:
	sxtw	x1, w19
	ldr	x0, .LC45
	lsl	x2, x1, 3
	sub	x1, x2, x1
	lsl	x1, x1, 3
	str	w20, [x0, x1]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L82:
	mov	w3, 179
	ldr	x2, .LC44
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L83
	.size	VDMDRV_StartRepair, .-VDMDRV_StartRepair
	.align	3
.LC42:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC44:
	.xword	.LC43
	.align	3
.LC45:
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
	ldr	x0, .LC46
	ldr	x2, [x0, 224]
	cbz	x2, .L85
	mov	x1, x20
	mov	w0, w19
	blr	x2
.L86:
	sxtw	x0, w19
	ldr	x2, .LC48
	lsl	x1, x0, 3
	mov	w3, 1
	sub	x0, x1, x0
	lsl	x0, x0, 3
	str	w3, [x2, x0]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L85:
	mov	w3, 188
	ldr	x2, .LC47
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L86
	.size	VDMDRV_StartDec, .-VDMDRV_StartDec
	.align	3
.LC46:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC47:
	.xword	.LC43
	.align	3
.LC48:
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
	ldr	x0, .LC49
	add	x19, x0, x19, sxtw 2
	ldr	w0, [x19, 96]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_IsChanDec, .-VDMDRV_IsChanDec
	.align	3
.LC49:
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
	bhi	.L93
	cbnz	w20, .L94
	ldr	x2, .LC52
	mov	w0, w19
	mov	w1, 1
	add	x19, x2, x19, sxtw 2
	str	w1, [x19, 96]
	bl	VDMDRV_AdjustPriorityAfterDec
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L94:
	ldr	x3, .LC50
	mov	w4, 208
.L92:
	ldr	x2, .LC51
	mov	w1, w4
	add	x3, x3, 200
	mov	w0, 1
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L93:
	ldr	x3, .LC50
	mov	w4, 207
	b	.L92
	.size	VDMDRV_SetChanIsDec, .-VDMDRV_SetChanIsDec
	.align	3
.LC50:
	.xword	.LANCHOR1
	.align	3
.LC51:
	.xword	.LC7
	.align	3
.LC52:
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
	bhi	.L98
	ldr	x0, .LC53
	add	x19, x0, x19, sxtw 2
	str	wzr, [x19, 96]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L98:
	bl	VDMDRV_ClearChanIsDec.part.4
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_ClearChanIsDec, .-VDMDRV_ClearChanIsDec
	.align	3
.LC53:
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
	ldr	x2, .LC56
	mov	x0, 0
	mov	w3, 1
.L101:
	ldr	x1, [x2, x0]
	add	x0, x0, 8
	cmp	x0, 32
	cbz	x1, .L100
	str	w3, [x1, 24]
.L100:
	bne	.L101
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMDRV_ParamInit, .-VDMDRV_ParamInit
	.align	3
.LC56:
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
	cbnz	w0, .L110
	ldr	x0, .LC60
	add	x0, x0, x19, sxtw 2
	ldr	w20, [x0, 96]
	cbnz	w20, .L111
	mov	w0, w19
	str	xzr, [x21]
	bl	VCTRL_GetDecParam
	str	x0, [x21]
	cbz	x0, .L112
.L108:
	mov	w0, w20
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L110:
	ldr	x3, .LC57
	mov	w4, w19
	ldr	x2, .LC59
	mov	w1, 243
	add	x3, x3, 224
	mov	w0, 20
	mov	w20, 1
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L111:
	ldr	x2, .LC62
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
.L112:
	ldr	x2, .LC64
	mov	w3, w19
	mov	w1, 258
	mov	w0, 20
	mov	w20, 1
	bl	dprint_normal
	b	.L108
	.size	VDMDRV_ChnDecReady, .-VDMDRV_ChnDecReady
	.align	3
.LC57:
	.xword	.LANCHOR1
	.align	3
.LC59:
	.xword	.LC58
	.align	3
.LC60:
	.xword	.LANCHOR0
	.align	3
.LC62:
	.xword	.LC61
	.align	3
.LC64:
	.xword	.LC63
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_IsCopy
	.type	VDMDRV_IsCopy, %function
VDMDRV_IsCopy:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L121
	sub	w0, w19, #1
	cmp	w0, 11
	bls	.L122
.L120:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L122:
	ldr	x1, .LC68
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx117
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx117:
	.section	.rodata
	.align	0
	.align	2
.L117:
	.byte	(.L119 - .Lrtx117) / 4
	.byte	(.L118 - .Lrtx117) / 4
	.byte	(.L120 - .Lrtx117) / 4
	.byte	(.L120 - .Lrtx117) / 4
	.byte	(.L120 - .Lrtx117) / 4
	.byte	(.L120 - .Lrtx117) / 4
	.byte	(.L120 - .Lrtx117) / 4
	.byte	(.L120 - .Lrtx117) / 4
	.byte	(.L120 - .Lrtx117) / 4
	.byte	(.L119 - .Lrtx117) / 4
	.byte	(.L119 - .Lrtx117) / 4
	.byte	(.L119 - .Lrtx117) / 4
	.text
	.p2align 3
.L119:
	ldrb	w0, [x20, 1]
	cmp	w0, 1
	cset	w0, eq
.L115:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L118:
	ldrb	w0, [x20, 150]
	ldp	x19, x20, [sp, 16]
	cmp	w0, 1
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L121:
	ldr	x3, .LC65
	mov	w1, 327
	ldr	x2, .LC67
	mov	w0, 0
	add	x3, x3, 248
	bl	dprint_normal
	mov	w0, 0
	b	.L115
	.size	VDMDRV_IsCopy, .-VDMDRV_IsCopy
	.align	3
.LC65:
	.xword	.LANCHOR1
	.align	3
.LC67:
	.xword	.LC66
	.align	3
.LC68:
	.xword	.L117
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
	sub	w0, w19, #1
	cmp	w0, 11
	bls	.L133
.L124:
	ldr	x3, .LC70
	mov	w4, w19
	ldr	x2, .LC72
	mov	w1, 401
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
.L130:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L133:
	ldr	x1, .LC69
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx126
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx126:
	.section	.rodata
	.align	0
	.align	2
.L126:
	.byte	(.L125 - .Lrtx126) / 4
	.byte	(.L127 - .Lrtx126) / 4
	.byte	(.L124 - .Lrtx126) / 4
	.byte	(.L124 - .Lrtx126) / 4
	.byte	(.L124 - .Lrtx126) / 4
	.byte	(.L124 - .Lrtx126) / 4
	.byte	(.L124 - .Lrtx126) / 4
	.byte	(.L124 - .Lrtx126) / 4
	.byte	(.L124 - .Lrtx126) / 4
	.byte	(.L128 - .Lrtx126) / 4
	.byte	(.L128 - .Lrtx126) / 4
	.byte	(.L128 - .Lrtx126) / 4
	.text
	.p2align 3
.L128:
	ldr	x0, [x21]
	mov	w1, w20
	bl	PostPro_PrepairVp6CopyParam
.L129:
	ldr	x0, .LC73
	ldr	x5, [x0, 256]
	cbz	x5, .L132
	ldr	x1, [x21]
	mov	x4, x22
	mov	w3, w20
	mov	w2, 3
	mov	w0, w19
	blr	x5
	cbz	w0, .L130
.L132:
	ldr	x3, .LC70
	mov	w4, w19
	ldr	x2, .LC75
	mov	w1, 409
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L127:
	ldr	x0, [x21]
	mov	w1, w20
	bl	PostPro_PrepairMpeg4CopyParam
	b	.L129
	.p2align 3
.L125:
	ldr	x0, [x21]
	mov	w1, w20
	bl	PostPro_PrepairVc1CopyParam
	b	.L129
	.size	VDMDRV_PrepairCopy, .-VDMDRV_PrepairCopy
	.align	3
.LC69:
	.xword	.L126
	.align	3
.LC70:
	.xword	.LANCHOR2
	.align	3
.LC72:
	.xword	.LC71
	.align	3
.LC73:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC75:
	.xword	.LC74
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
	sxtw	x20, w0
	mov	x24, x2
	mov	x0, x30
	mov	w21, w1
	lsl	x19, x20, 3
	mov	x22, x20
	bl	_mcount
	sub	x19, x19, x20
	ldr	x23, .LC76
	ldr	x0, [x24]
	add	x19, x23, x19, lsl 3
	add	x25, x19, 4
	cbz	x0, .L152
	mov	w0, w21
	bl	VCTRL_GetVidStd
	str	w0, [x19, 12]
	ldr	x1, [x24]
	bl	VDMDRV_IsCopy
	cbz	w0, .L137
	ldr	w2, [x19, 12]
	mov	x3, 0
	mov	w1, w20
	mov	x0, x24
	bl	VDMDRV_PrepairCopy
	cbz	w0, .L138
	ldr	x2, .LC80
	mov	w1, 446
	mov	w0, 0
	bl	dprint_normal
.L139:
	mov	x2, x25
	mov	w1, 1
	mov	w0, w22
	bl	VDMDRV_AdjustErrRatio
	lsl	x0, x20, 3
	mov	w3, w22
	sub	x20, x0, x20
	mov	x2, 0
	mov	w0, w21
	add	x20, x23, x20, lsl 3
	ldr	w1, [x20, 4]
	bl	VCTRL_VdmPostProc
	mov	w0, w22
	bl	VDMDRV_Reset
	cmp	w21, 3
	bhi	.L153
	add	x21, x23, x21, sxtw 2
	mov	w0, 1
	str	wzr, [x21, 96]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L137:
	ldr	w0, [x19, 12]
	ldr	x1, [x24]
	bl	VCTRL_IsSedOnlyMode
	uxtb	w0, w0
	cbnz	w0, .L141
	str	wzr, [x19, 48]
.L142:
	ldr	x0, .LC81
	ldr	x4, [x0, 232]
	cbz	x4, .L144
	lsl	x19, x20, 3
	ldr	x1, [x24]
	sub	x19, x19, x20
	mov	x3, 0
	mov	w2, w22
	add	x19, x23, x19, lsl 3
	ldr	w0, [x19, 12]
	blr	x4
	cbnz	w0, .L144
	sxtw	x24, w21
	ldr	x25, .LC84
	lsl	x0, x24, 2
	sub	x1, x0, x24
	lsl	x0, x1, 5
	add	x0, x1, x0
	add	x0, x0, x24
	add	x25, x25, x0
	ldr	w0, [x25, 24]
	cbz	w0, .L150
	ldr	x19, .LC85
.L145:
	mov	x1, 0
	mov	w0, w22
	bl	VDMDRV_StartDec
	b	.L140
	.p2align 3
.L144:
	ldr	x2, .LC83
	mov	w1, 468
	mov	w0, 0
	bl	dprint_normal
	b	.L139
	.p2align 3
.L141:
	mov	w0, 1
	str	w0, [x19, 48]
	b	.L142
	.p2align 3
.L138:
	mov	x2, x25
	mov	w1, 0
	mov	w0, w20
	sxtw	x24, w21
	bl	VDMDRV_AdjustErrRatio
	mov	x2, 0
	mov	w1, w20
	mov	w0, 3
	bl	VDMDRV_StartRepair
	ldr	x19, .LC85
.L140:
	ldr	x0, [x19]
	blr	x0
	mov	w3, w0
	lsl	x2, x20, 3
	lsl	x0, x20, 4
	ldr	x4, .LC86
	sub	x2, x2, x20
	sub	x20, x0, x20
	mov	w1, w22
	add	x2, x23, x2, lsl 3
	mov	w0, w21
	add	x20, x4, x20, lsl 2
	str	w3, [x2, 20]
	str	w3, [x20, 4]
	bl	VDMDRV_SetChanIsDec
	ldr	x3, .LC87
	add	x2, x23, 112
	add	x2, x2, x24, lsl 2
	mov	w0, w21
	mov	w4, 486
	add	x3, x3, 24
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
.L152:
	ldr	x2, .LC78
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
.L153:
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
	ldr	w0, [x19, 48]
	ldr	x19, .LC85
	cmp	w0, 1
	beq	.L145
	ldr	x0, [x19]
	blr	x0
	str	w0, [x25, 24]
	b	.L145
	.size	VDMDRV_DoBeforeDec, .-VDMDRV_DoBeforeDec
	.align	3
.LC76:
	.xword	.LANCHOR0
	.align	3
.LC78:
	.xword	.LC77
	.align	3
.LC80:
	.xword	.LC79
	.align	3
.LC81:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC83:
	.xword	.LC82
	.align	3
.LC84:
	.xword	g_VfmwChanStat
	.align	3
.LC85:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC86:
	.xword	g_VfmwGlobalStat
	.align	3
.LC87:
	.xword	.LANCHOR2
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
	ldr	x1, .LC89
	lsl	x0, x19, 3
	sub	x19, x0, x19
	lsl	x19, x19, 3
	ldr	w0, [x1, 80]
	add	x22, x1, x19
	add	x22, x22, 40
	tbnz	w0, #31, .L154
	add	x19, x1, x19
	add	x21, x1, 84
	add	x20, x1, 96
	mov	x24, x19
.L156:
	mov	w1, w0
	str	w0, [x19, 8]
	mov	x2, x22
	mov	w0, w23
	bl	VDMDRV_ChnDecReady
	cbz	w0, .L157
.L159:
	cmp	x21, x20
	beq	.L154
	ldr	w0, [x21], 4
	tbz	w0, #31, .L156
.L154:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L157:
	ldr	w1, [x24, 8]
	mov	x2, x22
	mov	w0, w23
	bl	VDMDRV_DoBeforeDec
	cbnz	w0, .L159
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	VDMDRV_ActivateVDH, .-VDMDRV_ActivateVDH
	.align	3
.LC89:
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
	ldr	x19, .LC91
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
	ldr	x21, .LC93
	lsl	x19, x19, 3
	ldr	x0, .LC92
	add	x20, x21, x19
	ldr	x2, .LC95
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
	beq	.L162
	cmp	w4, 3
	beq	.L163
	cmp	w4, 1
	beq	.L206
	ldr	x2, .LC103
	mov	w5, w24
	ldr	w3, [x20, 8]
	mov	w1, 723
	mov	w0, 0
	bl	dprint_normal
	ldr	w0, [x20, 8]
	cmp	w0, 3
	bhi	.L207
	add	x21, x21, x0, sxtw 2
	str	wzr, [x21, 96]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 256
	ret
	.p2align 3
.L206:
	ldr	w0, [x20, 8]
	add	x24, x20, 4
	bl	FSP_CheckIfFsPolluted
	ldr	w0, [x20, 28]
	cmp	w0, 1
	beq	.L208
	mov	w1, 2
	mov	x2, x24
	mov	w0, w22
	bl	VDMDRV_AdjustErrRatio
	ldr	w1, [x20, 4]
	cbz	w1, .L166
	ldr	x0, .LC98
	ldr	x4, [x0]
	cbz	x4, .L166
	add	x2, x29, 256
	ldr	w0, [x20, 8]
	mov	w3, 4
	str	w1, [x2, -168]!
	mov	w1, 43
	blr	x4
.L166:
	ldr	w0, [x29, 96]
	cmp	w0, 1
	beq	.L209
.L167:
	lsl	x19, x22, 3
	sub	x19, x19, x22
	add	x19, x21, x19, lsl 3
	ldp	w0, w1, [x19, 8]
	ldr	x2, [x19, 40]
	bl	PostPro_GetRepairStratage
	ldr	w1, [x19, 4]
	cmp	w1, wzr
	ccmp	w0, 1, 4, ne
	beq	.L210
	ldr	x0, .LC99
	ldr	x5, [x0, 256]
	cbz	x5, .L172
	ldr	w0, [x19, 12]
	mov	w3, w23
	ldr	x1, [x19, 40]
	mov	w2, 3
	ldr	x4, [x29, 240]
	blr	x5
	cbz	w0, .L211
.L172:
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
.L205:
	bl	VCTRL_VdmPostProc
	ldr	w0, [x19, 8]
	bl	VCTRL_ClearDecparam
	ldr	w0, [x19, 8]
	cmp	w0, 3
	bhi	.L212
	add	x0, x21, x0, sxtw 2
	str	wzr, [x0, 96]
.L183:
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
.L163:
	ldr	x24, .LC99
	str	wzr, [x20, 28]
	str	wzr, [x29, 88]
	ldr	x1, [x24, 312]
	cbz	x1, .L175
	add	x0, x29, 88
	blr	x1
.L175:
	lsl	x19, x22, 3
	sub	x19, x19, x22
	add	x19, x21, x19, lsl 3
	ldr	w0, [x19, 12]
	ldr	x1, [x19, 40]
	bl	VDMDRV_IsCopy
	cbnz	w0, .L176
	ldr	w0, [x29, 88]
	cbz	w0, .L176
	ldr	x5, [x24, 256]
	cbz	x5, .L181
	ldr	w0, [x19, 12]
	mov	w3, w23
	ldr	x1, [x19, 40]
	mov	w2, 2
	ldr	x4, [x29, 240]
	blr	x5
	cbz	w0, .L213
.L181:
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
	b	.L205
	.p2align 3
.L162:
	ldp	w1, w0, [x20, 4]
	mov	w3, w22
	mov	x2, x25
	str	wzr, [x20, 28]
	bl	VCTRL_VdmPostProc
	ldr	w0, [x20, 8]
	bl	VCTRL_ClearDecparam
	ldr	w0, [x20, 8]
	cmp	w0, 3
	bhi	.L202
.L178:
	add	x21, x21, x0, sxtw 2
	str	wzr, [x21, 96]
.L179:
	mov	w0, w23
	bl	VDMDRV_Reset
	mov	w0, w23
	bl	VDMDRV_ActivateVDH
.L160:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 256
	ret
	.p2align 3
.L176:
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
	bls	.L178
.L202:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L179
	.p2align 3
.L208:
	ldr	x1, [x20, 40]
	mov	w2, w22
	ldr	w0, [x20, 12]
	bl	PostPro_SetFullRepair
	str	wzr, [x20, 28]
	ldrb	w3, [x29, 248]
	mov	w1, 574
	ldr	x2, .LC97
	str	w0, [x20, 4]
	mov	w0, 0
	bl	dprint_normal
	b	.L166
	.p2align 3
.L207:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L160
	.p2align 3
.L210:
	ldr	w0, [x19, 8]
	mov	w3, w23
	add	x2, x29, 100
	bl	VCTRL_VdmPostProc
	ldr	w0, [x19, 8]
	bl	VCTRL_ClearDecparam
	ldr	w0, [x19, 8]
	cmp	w0, 3
	bls	.L178
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L179
	.p2align 3
.L212:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L183
	.p2align 3
.L209:
	mov	x2, x24
	mov	w1, 0
	mov	w0, w23
	bl	VDMDRV_AdjustErrRatio
	b	.L167
	.p2align 3
.L211:
	ldr	x2, [x29, 240]
	mov	w1, w23
	mov	w0, 3
	bl	VDMDRV_StartRepair
	lsl	x2, x22, 4
	ldr	x3, .LC100
	sub	x22, x2, x22
	ldr	x2, .LC101
	ldr	w0, [x19, 8]
	mov	w4, 613
	add	x2, x2, x22, lsl 2
	add	x3, x3, 48
	add	x2, x2, 4
	mov	w1, 7
	bl	RecordPOS
	b	.L160
	.p2align 3
.L213:
	ldr	x2, [x29, 240]
	mov	w1, w23
	mov	w0, 2
	bl	VDMDRV_StartRepair
	lsl	x2, x22, 4
	ldr	x3, .LC100
	sub	x22, x2, x22
	ldr	x2, .LC101
	ldr	w0, [x19, 8]
	mov	w4, 660
	add	x2, x2, x22, lsl 2
	add	x3, x3, 80
	add	x2, x2, 4
	mov	w1, 7
	bl	RecordPOS
	b	.L160
	.size	VDMDRV_AfterDec, .-VDMDRV_AfterDec
	.align	3
.LC91:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC92:
	.xword	s_pstVfmwChan
	.align	3
.LC93:
	.xword	.LANCHOR0
	.align	3
.LC95:
	.xword	.LC94
	.align	3
.LC97:
	.xword	.LC96
	.align	3
.LC98:
	.xword	g_EventReportFunc
	.align	3
.LC99:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC100:
	.xword	.LANCHOR2
	.align	3
.LC101:
	.xword	g_VfmwGlobalStat
	.align	3
.LC103:
	.xword	.LC102
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
	ldr	x21, .LC104
	lsl	x0, x20, 3
	sub	x0, x0, x20
	lsl	x0, x0, 3
	ldr	w1, [x21, x0]
	cbnz	w1, .L230
	add	x20, x21, x20, lsl 2
	mov	w0, 0
	ldr	w1, [x20, 56]
	cbz	w1, .L227
	cmp	w1, 1
	beq	.L231
.L218:
	mov	w0, 1
.L227:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L230:
	ldr	x1, .LC105
	add	x19, x21, x0
	ldr	x0, [x1]
	blr	x0
	str	w0, [x19, 24]
	ldr	w1, [x19, 20]
	cmp	w0, w1
	bcc	.L216
	sub	w4, w0, w1
	cmp	w4, wzr
	ccmp	w1, wzr, 4, ge
	beq	.L216
	cmp	w4, 500
	bls	.L218
	ldr	x2, .LC107
	mov	w1, 780
	ldr	w3, [x19, 8]
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC108
	ldr	x4, [x0]
	cbz	x4, .L219
	ldr	w0, [x19, 8]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 20
	blr	x4
.L219:
	ldr	x0, .LC109
	ldr	x1, [x0, 136]
	cbz	x1, .L220
	mov	w0, w22
	blr	x1
.L221:
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
	bhi	.L232
	add	x20, x21, x0, sxtw 2
	mov	w0, 0
	str	wzr, [x20, 96]
	b	.L227
	.p2align 3
.L216:
	str	w0, [x19, 20]
	mov	w0, 1
	b	.L227
	.p2align 3
.L231:
	mov	w2, 2
	str	w2, [x20, 56]
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L232:
	bl	VDMDRV_ClearChanIsDec.part.4
	mov	w0, 0
	b	.L227
	.p2align 3
.L220:
	mov	w3, 791
	ldr	x2, .LC110
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L221
	.size	VDMDRV_CheckDevice, .-VDMDRV_CheckDevice
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
.LC108:
	.xword	g_EventReportFunc
	.align	3
.LC109:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC110:
	.xword	.LC43
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
	ldr	x2, .LC111
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
.LC111:
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
	ldr	x2, .LC112
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
.LC112:
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
	ble	.L236
	ldr	x3, .LC113
	mov	w4, w20
	ldr	x2, .LC115
	mov	w5, 0
	add	x3, x3, 112
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
.L236:
	mov	w0, 9
	sxtw	x19, w20
	bl	VCTRL_RecordPosTime
	ldr	x22, .LC116
	mov	w0, 0
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x21, .LC117
	lsl	x0, x19, 3
	sub	x0, x0, x19
	add	x0, x21, x0, lsl 3
	ldr	w24, [x0, 8]
	cmp	w24, 3
	bhi	.L309
	ldr	x25, .LC120
	ldr	x0, [x25, w24, sxtw 3]
	cbz	x0, .L279
	add	x0, x0, 217088
	ldr	w27, [x0, 3932]
.L240:
	ldr	x23, .LC121
	ldr	x2, [x23, 296]
	cbz	x2, .L280
	mov	w1, w20
	mov	w0, 2
	blr	x2
	mov	w26, w0
	ldr	x2, [x23, 296]
	cbz	x2, .L281
	mov	w1, w20
	mov	w0, 1
	mov	w28, 0
	blr	x2
	str	w0, [x29, 108]
	ldr	x2, [x23, 296]
	cbz	x2, .L241
	mov	w1, w20
	mov	w0, 3
	blr	x2
	mov	w28, w0
.L241:
	ldr	x2, [x23, 304]
	cbz	x2, .L242
	mov	w1, w20
	mov	w0, 2
	blr	x2
	cmp	w0, 1
	ldr	x1, [x25, w24, sxtw 3]
	cset	w0, eq
	cmp	x1, xzr
	cset	w1, eq
	tst	w0, w1
	bne	.L310
	cmp	w26, 1
	beq	.L246
	cmp	w27, 1
	cset	w1, eq
	tst	w0, w1
	beq	.L278
.L246:
	ldr	x1, [x23, 280]
	cbz	x1, .L311
	mov	w0, w20
	blr	x1
.L252:
	ldr	x1, [x23, 160]
	cbz	x1, .L253
	mov	w0, w20
	blr	x1
.L254:
	lsl	x0, x19, 3
	ldr	x3, .LC113
	sub	x0, x0, x19
	add	x5, x21, 312
	mov	w4, 1098
	add	x3, x3, 160
	add	x0, x21, x0, lsl 3
	mov	w1, 6
	ldr	w2, [x0, 8]
	mov	w0, w2
	add	x2, x5, x2, sxtw 2
	bl	RecordPOS
	ldr	x0, [x22]
	blr	x0
	lsl	x1, x19, 4
	ldr	x4, .LC123
	sub	x1, x1, x19
	lsl	x1, x1, 2
	add	x5, x4, x1
	ldr	w3, [x5, 4]
	cbz	w3, .L256
	ldr	w6, [x4, x1]
	add	w2, w6, 49152
	add	w2, w2, 848
	cmp	w3, w2
	bhi	.L257
	ldr	w5, [x5, 8]
.L258:
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
	bls	.L256
	lsl	x2, x19, 3
	sub	x2, x2, x19
	add	x2, x21, x2, lsl 3
	ldr	w5, [x2, 16]
	cbnz	w5, .L260
	ldr	w5, [x1, 12]
.L261:
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
.L256:
	lsl	x0, x19, 3
	sub	x0, x0, x19
	lsl	x0, x0, 3
	add	x1, x21, x0
	ldr	w2, [x1, 48]
	ldr	w23, [x1, 8]
	cmp	w2, 1
	beq	.L312
	ldr	w3, [x21, x0]
	cbz	w3, .L264
	ldr	x0, [x1, 40]
	cbz	x0, .L313
.L264:
	mov	w0, w23
	bl	VCTRL_IsChanActive
	cbnz	w0, .L314
	mov	w0, w23
	bl	VCTRL_GetDecParam
	cbz	x0, .L315
	lsl	x1, x19, 3
	ldr	x23, .LC130
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
	cbz	w0, .L316
.L277:
	mov	w1, 1
	mov	w0, w20
	bl	VDMDRV_AfterDec
.L267:
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
.L242:
	cmp	w26, 1
	beq	.L246
.L278:
	cbnz	w26, .L269
	ldr	w0, [x29, 108]
	cmp	w0, 1
	ccmp	w28, 1, 0, eq
	beq	.L269
	ldr	x1, [x23, 248]
	cbz	x1, .L250
	mov	w0, w20
	blr	x1
	cbnz	w0, .L269
.L250:
	ldr	x2, [x23, 296]
	cbz	x2, .L245
	mov	w1, w20
	mov	w0, 1
	blr	x2
	cbz	w0, .L245
.L269:
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
.L314:
	mov	w3, 1039
	ldr	x2, .LC127
	mov	w4, w23
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
.L263:
	lsl	x0, x19, 3
	sub	x0, x0, x19
	add	x0, x21, x0, lsl 3
	ldr	w0, [x0, 8]
	cmp	w0, 3
	bhi	.L317
	add	x0, x21, x0, sxtw 2
	str	wzr, [x0, 96]
.L268:
	lsl	x0, x19, 3
	sub	x0, x0, x19
	lsl	x0, x0, 3
	str	wzr, [x21, x0]
	b	.L267
	.p2align 3
.L280:
	mov	w26, 0
	mov	w28, 0
	str	wzr, [x29, 108]
	b	.L241
	.p2align 3
.L257:
	str	w3, [x4, x1]
	mov	w6, w3
	mov	w5, 0
	b	.L258
	.p2align 3
.L309:
	ldr	x3, .LC113
	mov	w4, 901
	ldr	x2, .LC119
	mov	w1, w4
	add	x3, x3, 136
	mov	w0, 32
	bl	dprint_normal
	b	.L269
	.p2align 3
.L310:
	ldr	x1, [x23, 160]
	cbz	x1, .L244
	mov	w0, w20
	blr	x1
.L245:
	lsl	x0, x19, 3
	sub	x0, x0, x19
	add	x0, x21, x0, lsl 3
	ldr	w0, [x0, 8]
	cmp	w0, 3
	bhi	.L318
	add	x0, x21, x0, sxtw 2
	str	wzr, [x0, 96]
.L251:
	lsl	x0, x19, 3
	sub	x0, x0, x19
	lsl	x0, x0, 3
	str	wzr, [x21, x0]
	b	.L269
	.p2align 3
.L260:
	udiv	w5, w6, w5
	str	w5, [x1, 12]
	b	.L261
	.p2align 3
.L279:
	mov	w27, 0
	b	.L240
	.p2align 3
.L253:
	mov	w3, 1096
	ldr	x2, .LC122
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L254
	.p2align 3
.L311:
	mov	w3, 1094
	ldr	x2, .LC122
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L252
	.p2align 3
.L317:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L268
	.p2align 3
.L316:
	ldr	x0, [x22]
	blr	x0
	str	w0, [x23, 28]
	b	.L277
	.p2align 3
.L312:
	mov	w1, w20
	mov	w0, w23
	bl	VCTRL_VdmProcSedOnly
	b	.L263
	.p2align 3
.L315:
	mov	w3, 1045
	ldr	x2, .LC129
	mov	w4, w23
	mov	w1, w3
	bl	dprint_normal
	b	.L263
	.p2align 3
.L313:
	ldr	x2, .LC125
	mov	w1, 1027
	bl	dprint_normal
	mov	w0, w23
	bl	VCTRL_GetDecParam
	cbz	x0, .L263
	mov	w3, w20
	mov	x2, 0
	mov	w1, 100
	mov	w0, w23
	bl	VCTRL_VdmPostProc
	b	.L263
	.p2align 3
.L318:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L251
.L244:
	mov	w3, 915
	ldr	x2, .LC122
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L245
.L281:
	mov	w28, 0
	str	wzr, [x29, 108]
	b	.L241
	.size	VDMDRV_IsrProcess, .-VDMDRV_IsrProcess
	.align	3
.LC113:
	.xword	.LANCHOR2
	.align	3
.LC115:
	.xword	.LC114
	.align	3
.LC116:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC117:
	.xword	.LANCHOR0
	.align	3
.LC119:
	.xword	.LC118
	.align	3
.LC120:
	.xword	s_pstVfmwChan
	.align	3
.LC121:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC122:
	.xword	.LC43
	.align	3
.LC123:
	.xword	g_VfmwGlobalStat
	.align	3
.LC125:
	.xword	.LC124
	.align	3
.LC127:
	.xword	.LC126
	.align	3
.LC129:
	.xword	.LC128
	.align	3
.LC130:
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
	cbnz	w19, .L340
	ldr	x20, .LC134
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	ldr	x19, .LC135
	ldr	x2, [x19, 192]
	cbz	x2, .L325
	mov	w1, 0
	mov	w0, 5
	blr	x2
	mov	w21, w0
	ldr	x2, [x19, 192]
	cbz	x2, .L341
	mov	w1, 0
	mov	w0, 6
	and	w22, w21, 15
	mov	w23, 0
	blr	x2
	mov	w24, w0
	ldr	x2, [x19, 192]
	cbz	x2, .L322
	mov	w1, 0
	mov	w0, 7
	blr	x2
	mov	w23, w0
.L322:
	cbz	w22, .L325
	tbnz	x21, 2, .L342
	tbnz	x21, 3, .L343
	.p2align 2
.L325:
	ldr	x1, [x19, 168]
	cbz	x1, .L328
	mov	w0, 0
	blr	x1
.L329:
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L340:
	ldr	x3, .LC132
	mov	w4, 1135
	ldr	x2, .LC133
	mov	w1, w4
	add	x3, x3, 184
	mov	w0, 1
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L343:
	ldr	x2, .LC139
	mov	w4, w23
	mov	w3, w21
	mov	w1, 1157
	mov	w0, 32
	bl	dprint_normal
	b	.L325
	.p2align 3
.L342:
	ldr	x2, .LC137
	mov	w4, w24
	mov	w3, w21
	mov	w1, 1152
	mov	w0, 32
	bl	dprint_normal
	tbz	x21, 3, .L325
	b	.L343
	.p2align 3
.L328:
	mov	w3, 1161
	ldr	x2, .LC140
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L329
.L341:
	and	w22, w0, 15
	mov	w24, 0
	mov	w23, 0
	b	.L322
	.size	VDMDRV_MMUIntServeProc, .-VDMDRV_MMUIntServeProc
	.align	3
.LC132:
	.xword	.LANCHOR2
	.align	3
.LC133:
	.xword	.LC7
	.align	3
.LC134:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC135:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC137:
	.xword	.LC136
	.align	3
.LC139:
	.xword	.LC138
	.align	3
.LC140:
	.xword	.LC43
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
	cbz	w0, .L347
	ldp	x29, x30, [sp], 16
	ret
	.p2align 3
.L347:
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
	cbnz	w19, .L351
	ldr	x0, .LC141
	str	wzr, [x0]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L351:
	bl	VDMDRV_SetStateIdle.part.8
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_SetStateIdle, .-VDMDRV_SetStateIdle
	.align	3
.LC141:
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
	ldr	x2, .LC142
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
.LC142:
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
	ldr	x2, .LC143
	lsl	x1, x0, 3
	ldr	x19, [sp, 16]
	sub	x0, x1, x0
	ldp	x29, x30, [sp], 32
	add	x0, x2, x0, lsl 3
	ldr	w0, [x0, 8]
	ret
	.size	VDMDRV_GetCurrChanID, .-VDMDRV_GetCurrChanID
	.align	3
.LC143:
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
	ldr	x20, .LC144
	b	.L356
	.p2align 3
.L358:
	add	w19, w19, 1
	cmp	w19, 400
	beq	.L357
.L356:
	ldr	x1, [x20, 240]
	mov	w0, w21
	cbz	x1, .L358
	blr	x1
	cbz	w0, .L358
.L357:
	cmp	w19, 399
	ldr	x21, [sp, 32]
	cset	w0, hi
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	VDMDRV_WaitVdmReadyIfNoIsr, .-VDMDRV_WaitVdmReadyIfNoIsr
	.align	3
.LC144:
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
	bhi	.L364
	ldr	x20, .LC145
	ldr	w0, [x20, 8]
	cmp	w19, w0
	beq	.L370
.L363:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L364:
	ldr	x3, .LC146
	mov	w4, 1242
	ldr	x2, .LC147
	mov	w1, w4
	add	x3, x3, 208
	mov	w0, 1
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L370:
	ldr	x0, .LC148
	ldr	x1, [x0, 136]
	cbz	x1, .L367
	mov	w0, 0
	blr	x1
	str	wzr, [x20]
	b	.L363
.L367:
	mov	w3, 1257
	ldr	x2, .LC149
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	str	wzr, [x20]
	b	.L363
	.size	VDMDRV_ResetVDH, .-VDMDRV_ResetVDH
	.align	3
.LC145:
	.xword	.LANCHOR0
	.align	3
.LC146:
	.xword	.LANCHOR2
	.align	3
.LC147:
	.xword	.LC7
	.align	3
.LC148:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC149:
	.xword	.LC43
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
	cbnz	w20, .L379
	add	w0, w19, 1
	cmp	w0, 4
	bhi	.L380
	ldr	x0, .LC153
	mov	w1, 1
	cmn	w19, #1
	str	w1, [x0, 36]
	beq	.L371
	ldr	x0, .LC154
	mov	w8, -1
	ldr	x3, .LC150
	mov	w4, 1280
	ldr	x2, .LC156
	mov	w5, 0
	ldr	x7, [x0, w19, sxtw 3]
	add	x3, x3, 224
	ldr	x6, [x0]
	mov	w1, w4
	mov	w0, 20
	str	w8, [x7, 36]
	ldr	w6, [x6, 36]
	bl	dprint_normal
.L371:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L379:
	ldr	x3, .LC150
	mov	w4, 1271
.L378:
	ldr	x2, .LC152
	mov	w1, w4
	add	x3, x3, 224
	mov	w0, 32
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L380:
	ldr	x3, .LC150
	mov	w4, 1272
	b	.L378
	.size	VDMDRV_MarkReloadDsp, .-VDMDRV_MarkReloadDsp
	.align	3
.LC150:
	.xword	.LANCHOR2
	.align	3
.LC152:
	.xword	.LC151
	.align	3
.LC153:
	.xword	.LANCHOR0
	.align	3
.LC154:
	.xword	s_pstVfmwChan
	.align	3
.LC156:
	.xword	.LC155
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
	cbnz	w20, .L386
	cmp	w19, 3
	bhi	.L387
	ldr	x0, .LC159
	mov	w7, 1
	ldr	x3, .LC157
	mov	w4, 1293
	ldr	x2, .LC161
	mov	w6, w19
	ldr	x8, [x0, w19, sxtw 3]
	mov	w5, w7
	add	x3, x3, 248
	mov	w1, w4
	mov	w0, 20
	str	w7, [x8, 36]
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L387:
	ldr	x3, .LC157
	mov	w4, 1289
.L385:
	ldr	x2, .LC158
	mov	w1, w4
	add	x3, x3, 248
	mov	w0, 32
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L386:
	ldr	x3, .LC157
	mov	w4, 1288
	b	.L385
	.size	VDMDRV_UpdateMatchMode, .-VDMDRV_UpdateMatchMode
	.align	3
.LC157:
	.xword	.LANCHOR2
	.align	3
.LC158:
	.xword	.LC151
	.align	3
.LC159:
	.xword	s_pstVfmwChan
	.align	3
.LC161:
	.xword	.LC160
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
	.type	__func__.9900, %object
	.size	__func__.9900, 22
__func__.9900:
	.string	"VDMDRV_ClearChanIsDec"
	.zero	2
	.type	__func__.10112, %object
	.size	__func__.10112, 20
__func__.10112:
	.string	"VDMDRV_SetStateIdle"
	.zero	4
	.type	__func__.9825, %object
	.size	__func__.9825, 12
__func__.9825:
	.string	"VDMDRV_Init"
	.zero	4
	.type	__func__.9829, %object
	.size	__func__.9829, 13
__func__.9829:
	.string	"VDMDRV_Reset"
	.zero	3
	.type	__func__.9839, %object
	.size	__func__.9839, 19
__func__.9839:
	.string	"VDMDRV_SetPriority"
	.zero	5
	.type	__func__.9867, %object
	.size	__func__.9867, 20
__func__.9867:
	.string	"VDMDRV_PrepareSleep"
	.zero	4
	.type	__func__.9871, %object
	.size	__func__.9871, 21
__func__.9871:
	.string	"VDMDRV_GetSleepStage"
	.zero	3
	.type	__func__.9875, %object
	.size	__func__.9875, 18
__func__.9875:
	.string	"VDMDRV_ForceSleep"
	.zero	6
	.type	__func__.9879, %object
	.size	__func__.9879, 17
__func__.9879:
	.string	"VDMDRV_ExitSleep"
	.zero	7
	.type	__func__.9896, %object
	.size	__func__.9896, 20
__func__.9896:
	.string	"VDMDRV_SetChanIsDec"
	.zero	4
	.type	__func__.9914, %object
	.size	__func__.9914, 19
__func__.9914:
	.string	"VDMDRV_ChnDecReady"
	.zero	5
	.type	__func__.9932, %object
	.size	__func__.9932, 14
__func__.9932:
	.string	"VDMDRV_IsCopy"
	.align	3
.LANCHOR2 = . + 0
	.type	__func__.9954, %object
	.size	__func__.9954, 19
__func__.9954:
	.string	"VDMDRV_PrepairCopy"
	.zero	5
	.type	__func__.9966, %object
	.size	__func__.9966, 19
__func__.9966:
	.string	"VDMDRV_DoBeforeDec"
	.zero	5
	.type	__func__.9999, %object
	.size	__func__.9999, 29
__func__.9999:
	.string	"VDMDRV_AfterDecProcessNormal"
	.zero	3
	.type	__func__.10013, %object
	.size	__func__.10013, 27
__func__.10013:
	.string	"VDMDRV_AfterOuterPicRepair"
	.zero	5
	.type	__func__.10090, %object
	.size	__func__.10090, 18
__func__.10090:
	.string	"VDMDRV_IsrProcess"
	.zero	6
	.type	__func__.10075, %object
	.size	__func__.10075, 24
__func__.10075:
	.string	"VDMDRV_IsValidInterrupt"
	.type	__FUNCTION__.10091, %object
	.size	__FUNCTION__.10091, 18
__FUNCTION__.10091:
	.string	"VDMDRV_IsrProcess"
	.zero	6
	.type	__func__.10098, %object
	.size	__func__.10098, 23
__func__.10098:
	.string	"VDMDRV_MMUIntServeProc"
	.zero	1
	.type	__func__.10131, %object
	.size	__func__.10131, 16
__func__.10131:
	.string	"VDMDRV_ResetVDH"
	.type	__func__.10140, %object
	.size	__func__.10140, 21
__func__.10140:
	.string	"VDMDRV_MarkReloadDsp"
	.zero	3
	.type	__func__.10145, %object
	.size	__func__.10145, 23
__func__.10145:
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
.LC37:
	ASCII(.string	"====== forece VDM sleep! ======\n" )
	.zero	7
.LC43:
	ASCII(.string	"VDMHAL_NULL_FUN_PRINT,L%d\n" )
	.zero	5
.LC58:
	ASCII(.string	"%s The channel %d is not active\n" )
	.zero	7
.LC61:
	ASCII(.string	"The channel %d is decoding\n" )
	.zero	4
.LC63:
	ASCII(.string	"The channel %d DEC PARAM is not ready\n" )
	.zero	1
.LC66:
	ASCII(.string	"%s ERROR: pDecParam = NULL!\n" )
	.zero	3
.LC71:
	ASCII(.string	"%s VidStd %d no need repair copy\n" )
	.zero	6
.LC74:
	ASCII(.string	"%s VidStd %d prepair repair failed!\n" )
	.zero	3
.LC77:
	ASCII(.string	"The channel %d DEC PARAM is not ready(pDecParam == NULL)\n" )
	.zero	6
.LC79:
	ASCII(.string	"VDM prepair copy failed!\n" )
	.zero	6
.LC82:
	ASCII(.string	"VDM prepair decode failed!\n" )
	.zero	4
.LC94:
	ASCII(.string	"isr begin: *pVdmStateMachine = %d, timeout = %d, ErrRatio = %d\n" )
.LC96:
	ASCII(.string	"ISR process vdm timeout! FromInt = %d\n" )
	.zero	1
.LC102:
	ASCII(.string	"Chan %d VdmStateMachine=%d Error! FromInt = %d.\n" )
	.zero	7
.LC106:
	ASCII(.string	"Chan %d VDM Time Out(%d ms), Reset VDM!\n" )
	.zero	7
.LC114:
	ASCII(.string	"%s: VdhId(%d) > %d\n" )
	.zero	4
.LC118:
	ASCII(.string	"%s %d: ASSERT return!\n" )
	.zero	1
.LC124:
	ASCII(.string	"vdm state machine = %d, but DecParam is null!\n" )
	.zero	1
.LC126:
	ASCII(.string	"line :%d ISR called but chan %d is not active!\n" )
.LC128:
	ASCII(.string	"line :%d ISR called chan %d is active! But Dec Param in CTX is NULL!!!\n" )
.LC136:
	ASCII(.string	"SMMU_READ_ERR  MODULE : VFMW \t SMMU INT STATE: 0x%x \t read_err_addr  = 0x%x\n" )
	.zero	3
.LC138:
	ASCII(.string	"SMMU_WRITE_ERR MODULE : VFMW \t SMMU INT STATE: 0x%x \t write_err_addr = 0x%x\n" )
	.zero	3
.LC151:
	ASCII(.string	"%s %d: ASSERT!\n" )
.LC155:
	ASCII(.string	"%s,%d, i = %d, MatchVdhIdPlus1 = %d\n" )
	.zero	3
.LC160:
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
	.type	last_rec_pos_time.9964, %object
	.size	last_rec_pos_time.9964, 16
last_rec_pos_time.9964:
	.zero	16
	.type	g_BackUp, %object
	.size	g_BackUp, 184
g_BackUp:
	.zero	184
	.type	LastRecPosTime.10087, %object
	.size	LastRecPosTime.10087, 16
LastRecPosTime.10087:
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
