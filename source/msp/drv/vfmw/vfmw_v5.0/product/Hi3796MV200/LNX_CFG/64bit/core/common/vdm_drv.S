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
	mov	w20, w1
	mov	x21, x2
	bl	_mcount
	ldr	x22, .LC0
	add	x1, x22, x19, lsl 6
	ldr	w24, [x1, 8]
	cbz	w20, .L3
	cmp	w20, 2
	bls	.L15
	add	x0, x29, 80
	ldr	w2, [x1, 12]
	ldr	x1, [x1, 48]
	str	w2, [x29, 68]
	str	w19, [x0, -16]!
	str	x1, [x29, 72]
	bl	PostPro_GetErrRatio
	str	w0, [x21]
	ldr	x20, .LC3
	cbnz	w0, .L16
.L6:
	add	x19, x22, x19, lsl 6
	ldr	x1, [x20, w24, sxtw 3]
	mov	w0, 0
	add	x1, x1, 507904
	ldr	w3, [x19, 12]
	sub	w4, w3, #8
	ldr	w2, [x1, 2068]
	cmp	w4, 1
	ccmp	w3, 5, 4, hi
	add	w2, w2, 1
	cset	w3, eq
	str	w2, [x1, 2068]
	cbz	w3, .L17
	str	w0, [x21]
.L18:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L15:
	ldr	x1, .LC2
	mov	w4, 100
	mov	w3, w20
	mov	w2, w24
	str	w4, [x21]
	mov	w0, 1
	bl	dprint_vfmw
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
	ldr	x3, [x20, w24, sxtw 3]
	mov	w4, w0
	ldr	x1, .LC5
	mov	w2, w24
	add	x3, x3, 507904
	mov	w0, 1
	ldr	w3, [x3, 2068]
	bl	dprint_vfmw
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
	ldr	x2, .LC6
	mov	w3, 236
	ldr	x1, .LC8
	mov	w0, 1
	bl	dprint_vfmw
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
	.global	VDMDRV_Init
	.type	VDMDRV_Init, %function
VDMDRV_Init:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L23
	ldr	x20, .LC11
	mov	x2, 64
	ldr	x19, .LC12
	mov	w1, 0
	ldr	x3, [x20, 96]
	mov	x0, x19
	blr	x3
	str	wzr, [x19, 72]
	ldr	x0, .LC13
	mov	x2, 268
	ldr	x3, [x20, 96]
	mov	w1, 0
	str	wzr, [x19, 64]
	str	wzr, [x0, 20]
	add	x0, x19, 80
	blr	x3
	mov	w0, 4
	str	w0, [x19, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L23:
	ldr	x2, .LC9
	mov	w3, 36
	ldr	x1, .LC10
	mov	w0, 1
	add	x2, x2, 24
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_Init, .-VDMDRV_Init
	.align	3
.LC9:
	.xword	.LANCHOR1
	.align	3
.LC10:
	.xword	.LC7
	.align	3
.LC11:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC12:
	.xword	.LANCHOR0
	.align	3
.LC13:
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
	cbnz	w19, .L27
	ldr	x3, .LC16
	mov	x2, 64
	ldr	x0, .LC17
	mov	w1, 0
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L27:
	ldr	x2, .LC14
	mov	w3, 51
	ldr	x1, .LC15
	mov	w0, 1
	add	x2, x2, 40
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_Reset, .-VDMDRV_Reset
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
	cbz	x19, .L42
	ldr	x6, .LC22
	mov	w4, 0
	mov	w3, 0
	add	x5, x6, 480
	.p2align 2
.L37:
	mov	x0, 0
	mov	w2, 0
	.p2align 2
.L32:
	ldr	w1, [x19, x0, lsl 2]
	cmp	w1, w2
	ble	.L31
	mov	w3, w0
	mov	w2, w1
.L31:
	add	x0, x0, 1
	cmp	x0, 32
	bne	.L32
	cmp	w2, wzr
	ble	.L43
	str	w3, [x5], 4
	add	w4, w4, 1
	str	wzr, [x19, w3, sxtw 2]
	cmp	w4, 32
	bne	.L37
.L28:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L43:
	cmp	w4, 31
	add	x1, x6, 352
	mov	w2, -1
	bgt	.L28
	.p2align 2
.L38:
	add	x0, x1, x4, sxtw 2
	add	w4, w4, 1
	cmp	w4, 32
	str	w2, [x0, 128]
	bne	.L38
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L42:
	ldr	x2, .LC20
	mov	w3, 65
	ldr	x1, .LC21
	mov	w0, 1
	add	x2, x2, 56
	bl	dprint_vfmw
	b	.L28
	.size	VDMDRV_SetPriority, .-VDMDRV_SetPriority
	.align	3
.LC20:
	.xword	.LANCHOR1
	.align	3
.LC21:
	.xword	.LC7
	.align	3
.LC22:
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
	ldr	x8, .LC23
	ldr	w0, [x8, 480]
	cmp	w19, w0
	beq	.L54
	add	x2, x8, 484
	mov	x0, 1
	b	.L50
	.p2align 3
.L46:
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L54
.L50:
	ldr	w3, [x2]
	mov	w1, w0
	add	x2, x2, 4
	cmp	w3, w19
	bne	.L46
	cmp	w0, 30
	bgt	.L44
	add	x3, x0, 1
	lsl	x3, x3, 2
.L45:
	add	x2, x8, 480
	add	x7, x2, x3
	ldr	w3, [x2, x3]
	tbz	w3, #31, .L51
	b	.L44
	.p2align 3
.L53:
	add	x7, x2, x3, lsl 2
	ldr	w3, [x2, x3, lsl 2]
	tbnz	w3, #31, .L44
.L51:
	add	x4, x8, 352
	ldr	w5, [x2, x0, lsl 2]
	add	w1, w1, 1
	ldr	w6, [x4, w3, sxtw 2]
	ldr	w4, [x4, w5, sxtw 2]
	cmp	w6, w4
	blt	.L52
	str	w3, [x2, x0, lsl 2]
	str	w5, [x7]
.L52:
	cmp	w1, 30
	sxtw	x0, w1
	add	x3, x0, 1
	ble	.L53
.L44:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L54:
	mov	x3, 4
	mov	x0, 0
	mov	w1, 0
	b	.L45
	.size	VDMDRV_AdjustPriorityAfterDec, .-VDMDRV_AdjustPriorityAfterDec
	.align	3
.LC23:
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
	cbnz	w19, .L62
	ldr	x1, .LC28
	ldr	w0, [x1, 64]
	cbnz	w0, .L61
	ldr	w0, [x1]
	cbz	w0, .L63
	mov	w2, 1
	mov	w0, 0
	str	w2, [x1, 64]
.L59:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L63:
	mov	w2, 2
	str	w2, [x1, 64]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L61:
	mov	w0, -1
	b	.L59
	.p2align 3
.L62:
	ldr	x2, .LC26
	mov	w3, 138
	ldr	x1, .LC27
	mov	w0, 1
	add	x2, x2, 80
	bl	dprint_vfmw
	mov	w0, -1
	b	.L59
	.size	VDMDRV_PrepareSleep, .-VDMDRV_PrepareSleep
	.align	3
.LC26:
	.xword	.LANCHOR1
	.align	3
.LC27:
	.xword	.LC7
	.align	3
.LC28:
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
	cbnz	w19, .L67
	ldr	x0, .LC31
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 64]
	ret
	.p2align 3
.L67:
	ldr	x2, .LC29
	mov	w3, 163
	ldr	x1, .LC30
	mov	w0, 1
	add	x2, x2, 104
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_GetSleepStage, .-VDMDRV_GetSleepStage
	.align	3
.LC29:
	.xword	.LANCHOR1
	.align	3
.LC30:
	.xword	.LC7
	.align	3
.LC31:
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
	cbnz	w19, .L75
	ldr	x19, .LC34
	ldr	w0, [x19, 64]
	cmp	w0, 2
	beq	.L71
	mov	w0, 0
	bl	VDMDRV_Reset
	mov	w0, 2
	str	w0, [x19, 64]
.L71:
	ldr	x1, .LC36
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L75:
	ldr	x2, .LC32
	mov	w3, 169
	ldr	x1, .LC33
	mov	w0, 1
	add	x2, x2, 128
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_ForceSleep, .-VDMDRV_ForceSleep
	.align	3
.LC32:
	.xword	.LANCHOR1
	.align	3
.LC33:
	.xword	.LC7
	.align	3
.LC34:
	.xword	.LANCHOR0
	.align	3
.LC36:
	.xword	.LC35
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
	cbnz	w19, .L79
	ldr	x0, .LC39
	str	wzr, [x0, 64]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L79:
	ldr	x2, .LC37
	mov	w3, 183
	ldr	x1, .LC38
	mov	w0, 1
	add	x2, x2, 152
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_ExitSleep, .-VDMDRV_ExitSleep
	.align	3
.LC37:
	.xword	.LANCHOR1
	.align	3
.LC38:
	.xword	.LC7
	.align	3
.LC39:
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
	ldr	x0, .LC40
	ldr	x3, [x0, 232]
	cbz	x3, .L81
	mov	x1, x21
	mov	w0, w19
	sbfiz	x19, x19, 6, 32
	blr	x3
	ldr	x0, .LC43
	str	w20, [x0, x19]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L81:
	ldr	x1, .LC42
	mov	w2, 191
	mov	w0, 0
	sbfiz	x19, x19, 6, 32
	bl	dprint_vfmw
	ldr	x0, .LC43
	str	w20, [x0, x19]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VDMDRV_StartRepair, .-VDMDRV_StartRepair
	.align	3
.LC40:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC42:
	.xword	.LC41
	.align	3
.LC43:
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
	ldr	x0, .LC44
	ldr	x2, [x0, 240]
	cbz	x2, .L84
	mov	x1, x20
	mov	w0, w19
	sbfiz	x19, x19, 6, 32
	blr	x2
	ldr	x0, .LC46
	mov	w1, 1
	str	w1, [x0, x19]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L84:
	ldr	x1, .LC45
	mov	w2, 199
	mov	w0, 0
	sbfiz	x19, x19, 6, 32
	bl	dprint_vfmw
	ldr	x0, .LC46
	mov	w1, 1
	str	w1, [x0, x19]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_StartDec, .-VDMDRV_StartDec
	.align	3
.LC44:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC45:
	.xword	.LC41
	.align	3
.LC46:
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
	cmp	w19, 31
	bhi	.L89
	ldr	x0, .LC49
	add	x19, x0, x19, sxtw 2
	ldr	w0, [x19, 608]
	cmp	w0, wzr
	cset	w0, ne
.L88:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L89:
	ldr	x2, .LC47
	mov	w3, 206
	ldr	x1, .LC48
	mov	w0, 1
	add	x2, x2, 176
	bl	dprint_vfmw
	mov	w0, -1
	b	.L88
	.size	VDMDRV_IsChanDec, .-VDMDRV_IsChanDec
	.align	3
.LC47:
	.xword	.LANCHOR1
	.align	3
.LC48:
	.xword	.LC7
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
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, 31
	bhi	.L94
	cbnz	w19, .L95
	sxtw	x19, w20
	ldr	x1, .LC52
	mov	w0, w20
	mov	w2, 1
	add	x1, x1, x19, lsl 2
	str	w2, [x1, 608]
	bl	VDMDRV_AdjustPriorityAfterDec
	ldr	x0, .LC53
	lsl	x1, x19, 6
	add	x19, x1, x19, lsl 3
	add	x19, x0, x19
	ldr	w0, [x19, 24]
	cmp	w0, 4
	beq	.L96
.L90:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L95:
	ldr	x2, .LC50
	mov	w3, 220
	ldr	x1, .LC51
	mov	w0, 1
	add	x2, x2, 200
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L94:
	ldr	x2, .LC50
	mov	w3, 219
	ldr	x1, .LC51
	mov	w0, 1
	add	x2, x2, 200
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L96:
	ldr	w0, [x19, 60]
	cbnz	w0, .L90
	ldr	x0, .LC54
	ldr	x0, [x0]
	blr	x0
	str	w0, [x19, 60]
	mov	w1, 5
	str	w1, [x19, 24]
	b	.L90
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
	.align	3
.LC53:
	.xword	g_VfmwChanStat
	.align	3
.LC54:
	.xword	vfmw_Osal_Func_Ptr_S
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
	cmp	w19, 31
	bhi	.L100
	ldr	x0, .LC55
	add	x19, x0, x19, sxtw 2
	str	wzr, [x19, 608]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L100:
	bl	VDMDRV_ClearChanIsDec.part.4
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_ClearChanIsDec, .-VDMDRV_ClearChanIsDec
	.align	3
.LC55:
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
	ldr	x0, .LC58
	mov	w3, 1
	add	x2, x0, 256
	.p2align 2
.L103:
	ldr	x1, [x0]
	add	x0, x0, 8
	cmp	x0, x2
	cbz	x1, .L102
	str	w3, [x1, 16]
.L102:
	bne	.L103
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMDRV_ParamInit, .-VDMDRV_ParamInit
	.align	3
.LC58:
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
	stp	x21, x22, [sp, 32]
	mov	w22, w0
	mov	x0, x30
	mov	w19, w1
	mov	x21, x2
	bl	_mcount
	mov	w0, w19
	bl	VCTRL_IsChanActive
	mov	w20, w0
	cbnz	w0, .L117
	cmp	w19, 31
	bhi	.L118
	ldr	x0, .LC64
	add	x0, x0, x19, sxtw 2
	ldr	w0, [x0, 608]
	cbnz	w0, .L119
.L112:
	mov	w0, w19
	str	xzr, [x21]
	bl	VCTRL_GetDecParam
	str	x0, [x21]
	cbz	x0, .L120
	mov	w1, w22
	mov	w0, 1
	bl	VDH_TaskInUse
	cmp	w0, 1
	mov	w2, w0
	beq	.L121
.L110:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L118:
	ldr	x2, .LC60
	mov	w3, 206
	ldr	x1, .LC63
	mov	w0, 1
	add	x2, x2, 176
	bl	dprint_vfmw
	b	.L112
	.p2align 3
.L117:
	ldr	x2, .LC60
	mov	w3, w19
	ldr	x1, .LC62
	mov	w0, 22
	add	x2, x2, 224
	mov	w20, 1
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L119:
	ldr	x1, .LC66
	mov	w2, w19
	mov	w0, 22
	mov	w20, 1
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L121:
	ldr	x1, .LC70
	mov	w0, 22
	mov	w20, w2
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L120:
	ldr	x1, .LC68
	mov	w2, w19
	mov	w0, 22
	mov	w20, 1
	bl	dprint_vfmw
	b	.L110
	.size	VDMDRV_ChnDecReady, .-VDMDRV_ChnDecReady
	.align	3
.LC60:
	.xword	.LANCHOR1
	.align	3
.LC62:
	.xword	.LC61
	.align	3
.LC63:
	.xword	.LC7
	.align	3
.LC64:
	.xword	.LANCHOR0
	.align	3
.LC66:
	.xword	.LC65
	.align	3
.LC68:
	.xword	.LC67
	.align	3
.LC70:
	.xword	.LC69
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostPro_CopyYuvByProtocol
	.type	PostPro_CopyYuvByProtocol, %function
PostPro_CopyYuvByProtocol:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	mov	w19, w3
	mov	w20, w1
	mov	x21, x2
	bl	_mcount
	sub	w3, w19, #1
	cmp	w3, 11
	bls	.L129
.L128:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L129:
	ldr	x0, .LC71
	ldrb	w0, [x0,w3,uxtw]
	adr	x1, .Lrtx125
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx125:
	.section	.rodata
	.align	0
	.align	2
.L125:
	.byte	(.L124 - .Lrtx125) / 4
	.byte	(.L126 - .Lrtx125) / 4
	.byte	(.L128 - .Lrtx125) / 4
	.byte	(.L128 - .Lrtx125) / 4
	.byte	(.L128 - .Lrtx125) / 4
	.byte	(.L128 - .Lrtx125) / 4
	.byte	(.L128 - .Lrtx125) / 4
	.byte	(.L128 - .Lrtx125) / 4
	.byte	(.L128 - .Lrtx125) / 4
	.byte	(.L127 - .Lrtx125) / 4
	.byte	(.L127 - .Lrtx125) / 4
	.byte	(.L127 - .Lrtx125) / 4
	.text
	.p2align 3
.L127:
	ldr	x0, [x22]
	mov	x2, x21
	mov	w1, w20
	bl	PostPro_CopyYuv_Vp6
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L126:
	ldr	x0, [x22]
	mov	x2, x21
	mov	w1, w20
	bl	PostPro_CopyYuv_Mpeg4
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L124:
	ldr	x0, [x22]
	mov	x2, x21
	mov	w1, w20
	bl	PostPro_CopyYuv_Vc1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	PostPro_CopyYuvByProtocol, .-PostPro_CopyYuvByProtocol
	.align	3
.LC71:
	.xword	.L125
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
	ldr	x2, .LC72
	lsl	x1, x0, 2
	ldr	x19, [sp, 16]
	sub	x0, x1, x0
	lsl	x1, x0, 4
	sub	x0, x1, x0
	ldp	x29, x30, [sp], 32
	add	x0, x2, x0, lsl 2
	ldr	w0, [x0, 744]
	and	w0, w0, 31
	ret
	.size	VDMDRV_GetMb0QpInCurrPic, .-VDMDRV_GetMb0QpInCurrPic
	.align	3
.LC72:
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
	ldr	x2, .LC73
	lsl	x1, x0, 2
	ldr	x19, [sp, 16]
	sub	x0, x1, x0
	lsl	x1, x0, 4
	sub	x0, x1, x0
	ldp	x29, x30, [sp], 32
	add	x0, x2, x0, lsl 2
	ldr	w0, [x0, 748]
	and	w0, w0, 1
	ret
	.size	VDMDRV_GetSwitchRounding, .-VDMDRV_GetSwitchRounding
	.align	3
.LC73:
	.xword	.LANCHOR0
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
	cbnz	w19, .L154
	ldr	x20, .LC76
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	ldr	x19, .LC77
	ldr	x2, [x19, 208]
	cbz	x2, .L140
	mov	w1, 0
	mov	w0, 5
	blr	x2
	mov	w23, w0
	ldr	x2, [x19, 208]
	cbz	x2, .L140
	mov	w1, 0
	mov	w0, 6
	and	w22, w23, 7
	mov	w21, 0
	blr	x2
	mov	w24, w0
	ldr	x2, [x19, 208]
	cbz	x2, .L135
	mov	w1, 0
	mov	w0, 7
	blr	x2
	mov	w21, w0
.L135:
	cbz	w22, .L140
	cbnz	w24, .L155
	cbnz	w21, .L156
	.p2align 2
.L140:
	ldr	x1, [x19, 184]
	cbz	x1, .L141
	mov	w0, 0
	blr	x1
.L142:
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L154:
	ldr	x2, .LC74
	mov	w3, 769
	ldr	x1, .LC75
	mov	w0, 1
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L156:
	ldr	x1, .LC81
	mov	w3, w21
	mov	w2, w23
	mov	w0, 32
	bl	dprint_vfmw
	b	.L140
	.p2align 3
.L155:
	ldr	x1, .LC79
	mov	w3, w24
	mov	w2, w23
	mov	w0, 32
	bl	dprint_vfmw
	cbz	w21, .L140
	b	.L156
	.p2align 3
.L141:
	ldr	x1, .LC82
	mov	w2, 806
	mov	w0, 0
	bl	dprint_vfmw
	b	.L142
	.size	VDMDRV_MMUIntServeProc, .-VDMDRV_MMUIntServeProc
	.align	3
.LC74:
	.xword	.LANCHOR2
	.align	3
.LC75:
	.xword	.LC7
	.align	3
.LC76:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC77:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC79:
	.xword	.LC78
	.align	3
.LC81:
	.xword	.LC80
	.align	3
.LC82:
	.xword	.LC41
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
	cbnz	w19, .L160
	ldr	x0, .LC85
	str	wzr, [x0]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L160:
	ldr	x2, .LC83
	mov	w3, 814
	ldr	x1, .LC84
	mov	w0, 1
	add	x2, x2, 24
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_SetStateIdle, .-VDMDRV_SetStateIdle
	.align	3
.LC83:
	.xword	.LANCHOR2
	.align	3
.LC84:
	.xword	.LC7
	.align	3
.LC85:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_WaitVdmReadyIfNoIsr
	.type	VDMDRV_WaitVdmReadyIfNoIsr, %function
VDMDRV_WaitVdmReadyIfNoIsr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L172
	ldr	x20, .LC88
	mov	w19, 0
	b	.L165
	.p2align 3
.L167:
	add	w19, w19, 1
	cmp	w19, 400
	beq	.L166
.L165:
	ldr	x1, [x20, 256]
	mov	w0, 0
	cbz	x1, .L167
	blr	x1
	cbz	w0, .L167
.L166:
	cmp	w19, 399
	cset	w0, hi
.L163:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L172:
	ldr	x2, .LC86
	mov	w3, 824
	ldr	x1, .LC87
	mov	w0, 1
	add	x2, x2, 48
	bl	dprint_vfmw
	mov	w0, -1
	b	.L163
	.size	VDMDRV_WaitVdmReadyIfNoIsr, .-VDMDRV_WaitVdmReadyIfNoIsr
	.align	3
.LC86:
	.xword	.LANCHOR2
	.align	3
.LC87:
	.xword	.LC7
	.align	3
.LC88:
	.xword	g_vdm_hal_fun_ptr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_AvsFirstFldNeedRepair
	.type	VDMDRV_AvsFirstFldNeedRepair, %function
VDMDRV_AvsFirstFldNeedRepair:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x21, x1
	sxtw	x20, w2
	bl	_mcount
	cmp	w19, 6
	mov	w0, 0
	beq	.L177
.L174:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L177:
	ldrb	w1, [x21, 17]
	mov	w0, 0
	cmp	w1, 1
	bne	.L174
	lsl	x0, x20, 3
	ldr	x1, .LC89
	sub	x0, x0, x20
	lsl	x0, x0, 3
	sub	x0, x0, x20
	lsl	x0, x0, 2
	sub	x20, x0, x20
	add	x20, x1, x20, lsl 3
	ldr	w0, [x20, 964]
	cmp	w0, wzr
	cset	w0, gt
	b	.L174
	.size	VDMDRV_AvsFirstFldNeedRepair, .-VDMDRV_AvsFirstFldNeedRepair
	.align	3
.LC89:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_AvsSecondFldNeedRepair
	.type	VDMDRV_AvsSecondFldNeedRepair, %function
VDMDRV_AvsSecondFldNeedRepair:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x21, x1
	sxtw	x20, w2
	bl	_mcount
	cmp	w19, 6
	mov	w0, 0
	beq	.L182
.L179:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L182:
	ldrb	w1, [x21, 17]
	mov	w0, 0
	cmp	w1, 1
	bne	.L179
	lsl	x0, x20, 3
	ldr	x1, .LC90
	sub	x0, x0, x20
	lsl	x0, x0, 3
	sub	x0, x0, x20
	lsl	x0, x0, 2
	sub	x20, x0, x20
	add	x20, x1, x20, lsl 3
	ldr	w0, [x20, 1840]
	cmp	w0, wzr
	cset	w0, gt
	b	.L179
	.size	VDMDRV_AvsSecondFldNeedRepair, .-VDMDRV_AvsSecondFldNeedRepair
	.align	3
.LC90:
	.xword	.LANCHOR0
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
	cbz	x20, .L191
	sub	w0, w19, #1
	cmp	w0, 11
	bls	.L192
.L190:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L192:
	ldr	x1, .LC93
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx187
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx187:
	.section	.rodata
	.align	0
	.align	2
.L187:
	.byte	(.L189 - .Lrtx187) / 4
	.byte	(.L188 - .Lrtx187) / 4
	.byte	(.L190 - .Lrtx187) / 4
	.byte	(.L190 - .Lrtx187) / 4
	.byte	(.L190 - .Lrtx187) / 4
	.byte	(.L190 - .Lrtx187) / 4
	.byte	(.L190 - .Lrtx187) / 4
	.byte	(.L190 - .Lrtx187) / 4
	.byte	(.L190 - .Lrtx187) / 4
	.byte	(.L189 - .Lrtx187) / 4
	.byte	(.L189 - .Lrtx187) / 4
	.byte	(.L189 - .Lrtx187) / 4
	.text
	.p2align 3
.L189:
	ldrb	w0, [x20, 1]
	cmp	w0, 1
	cset	w0, eq
.L185:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L188:
	ldrb	w0, [x20, 166]
	ldp	x19, x20, [sp, 16]
	cmp	w0, 1
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L191:
	ldr	x1, .LC92
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L185
	.size	VDMDRV_IsCopy, .-VDMDRV_IsCopy
	.align	3
.LC92:
	.xword	.LC91
	.align	3
.LC93:
	.xword	.L187
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_DoBeforeDec
	.type	VDMDRV_DoBeforeDec, %function
VDMDRV_DoBeforeDec:
	stp	x29, x30, [sp, -304]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w23, w0
	mov	x0, x30
	mov	w22, w1
	mov	x20, x2
	bl	_mcount
	mov	x26, 0
	ldr	x0, .LC94
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L194
	ldr	x3, .LC95
	add	x0, x29, 112
	mov	x2, 188
	mov	w1, 0
	mov	x26, x0
	ldr	x3, [x3, 96]
	blr	x3
.L194:
	ldr	x0, [x20]
	cbz	x0, .L217
	mov	w0, w22
	sxtw	x24, w23
	bl	VCTRL_GetVidStd
	ldr	x21, .LC98
	ldr	x1, .LC99
	add	x25, x21, x24, lsl 6
	ldr	x1, [x1]
	str	w0, [x25, 12]
	cbz	x1, .L197
	ldr	x2, [x20]
	stp	w22, w0, [x29, 96]
	str	x2, [x29, 104]
	add	x0, x29, 96
	blr	x1
	cmp	w0, 1
	mov	w19, w0
	beq	.L196
	ldr	w0, [x25, 12]
.L197:
	ldr	x1, [x20]
	lsl	x27, x24, 6
	add	x25, x21, x27
	add	x28, x25, 4
	bl	VDMDRV_IsCopy
	mov	w19, w0
	cbz	w0, .L199
	ldr	w3, [x25, 12]
	mov	x2, x26
	mov	x0, x20
	mov	w1, w23
	bl	PostPro_CopyYuvByProtocol
	mov	w19, w0
	cbz	w0, .L218
	mov	w19, 0
.L196:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
	.p2align 3
.L199:
	ldr	w0, [x25, 12]
	ldr	x1, [x20]
	bl	VCTRL_IsSedOnlyMode
	uxtb	w0, w0
	cbz	w0, .L219
	mov	w0, 1
	str	w0, [x25, 56]
.L201:
	ldr	x0, .LC102
	ldr	x4, [x0, 248]
	cbz	x4, .L205
	lsl	x25, x24, 6
	ldr	x1, [x20]
	add	x20, x21, x25
	mov	x3, x26
	mov	w2, w23
	ldr	w0, [x20, 12]
	blr	x4
	cbz	w0, .L220
.L205:
	ldr	x1, .LC104
	mov	w0, 0
	add	x24, x21, x24, lsl 6
	bl	dprint_vfmw
	mov	x2, x28
	mov	w1, 2
	mov	w0, w23
	bl	VDMDRV_AdjustErrRatio
	ldr	w1, [x24, 4]
	mov	w3, w23
	mov	x2, 0
	mov	w0, w22
	bl	VCTRL_VdmPostProc
	mov	w0, w23
	bl	VDMDRV_Reset
	cmp	w22, 31
	bhi	.L221
	add	x21, x21, x22, sxtw 2
	mov	w0, w19
	str	wzr, [x21, 608]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
	.p2align 3
.L219:
	str	wzr, [x25, 56]
	b	.L201
	.p2align 3
.L218:
	mov	w0, w23
	mov	x2, x28
	mov	w1, 0
	bl	VDMDRV_AdjustErrRatio
	mov	x2, x26
	mov	w1, w23
	mov	w0, 2
	bl	VDMDRV_StartRepair
	ldr	x20, .LC95
	ldr	x0, [x20]
	blr	x0
	str	w0, [x25, 20]
	ldr	x2, .LC100
	ldr	x1, [x20, 8]
	add	x27, x2, x27
	str	w0, [x27, 4]
	blr	x1
	str	w0, [x27, 8]
	mov	w1, w23
	mov	w0, w22
	bl	VDMDRV_SetChanIsDec
	ldr	x3, .LC101
	add	x2, x21, 2672
	add	x2, x2, x22, sxtw 2
	mov	w0, w22
	mov	w4, 413
	add	x3, x3, 80
	mov	w1, 7
	bl	RecordPOS
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
	.p2align 3
.L217:
	ldr	x1, .LC97
	mov	w2, w22
	mov	w0, 22
	mov	w19, 1
	bl	dprint_vfmw
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
	.p2align 3
.L220:
	mov	x1, x26
	mov	w0, w23
	bl	VDMDRV_StartDec
	ldr	x19, .LC95
	ldr	x0, [x19]
	blr	x0
	str	w0, [x20, 20]
	ldr	x2, .LC100
	ldr	x1, [x19, 8]
	mov	w19, 0
	add	x25, x2, x25
	str	w0, [x25, 4]
	blr	x1
	str	w0, [x25, 8]
	mov	w1, w23
	mov	w0, w22
	bl	VDMDRV_SetChanIsDec
	ldr	x3, .LC101
	add	x2, x21, 2672
	mov	w4, 447
	add	x2, x2, x22, sxtw 2
	add	x3, x3, 80
	mov	w1, 5
	mov	w0, w22
	bl	RecordPOS
	b	.L196
	.p2align 3
.L221:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L196
	.size	VDMDRV_DoBeforeDec, .-VDMDRV_DoBeforeDec
	.align	3
.LC94:
	.xword	g_HalDisable
	.align	3
.LC95:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC97:
	.xword	.LC96
	.align	3
.LC98:
	.xword	.LANCHOR0
	.align	3
.LC99:
	.xword	AcceleratorCharacter
	.align	3
.LC100:
	.xword	g_VfmwGlobalStat
	.align	3
.LC101:
	.xword	.LANCHOR2
	.align	3
.LC102:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC104:
	.xword	.LC103
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_ActivateVDH
	.type	VDMDRV_ActivateVDH, %function
VDMDRV_ActivateVDH:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	w22, w0
	mov	x0, x30
	sbfiz	x20, x22, 6, 32
	bl	_mcount
	ldr	x25, .LC107
	ldr	x24, .LC106
	mov	w0, 5
	add	x21, x20, 48
	ldr	x1, [x25, 24]
	add	x21, x24, x21
	blr	x1
	ldr	w0, [x24, 480]
	tbnz	w0, #31, .L223
	add	x19, x24, 484
	add	x23, x24, 608
	add	x20, x24, x20
	b	.L224
	.p2align 3
.L227:
	cmp	x19, x23
	beq	.L223
	ldr	w0, [x19], 4
	tbnz	w0, #31, .L223
.L224:
	mov	w1, w0
	str	w0, [x20, 8]
	mov	x2, x21
	mov	w0, w22
	bl	VDMDRV_ChnDecReady
	cbnz	w0, .L227
	ldr	w1, [x20, 8]
	mov	x2, x21
	mov	w0, w22
	bl	VDMDRV_DoBeforeDec
	cbnz	w0, .L227
.L223:
	ldr	x1, [x25, 32]
	mov	w0, 5
	blr	x1
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.size	VDMDRV_ActivateVDH, .-VDMDRV_ActivateVDH
	.align	3
.LC106:
	.xword	.LANCHOR0
	.align	3
.LC107:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_AfterDec
	.type	VDMDRV_AfterDec, %function
VDMDRV_AfterDec:
	stp	x29, x30, [sp, -448]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w22, w0
	mov	x0, x30
	uxtb	w24, w1
	bl	_mcount
	ldr	x19, .LC109
	mov	x2, 160
	mov	w1, 0
	add	x0, x29, 96
	ldr	x3, [x19, 96]
	blr	x3
	ldr	x0, .LC110
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L230
	add	x20, x29, 256
	ldr	x3, [x19, 96]
	mov	x2, 188
	mov	w1, 0
	mov	x0, x20
	blr	x3
	str	x20, [x29, 240]
.L230:
	ldr	x3, [x19, 96]
	add	x25, x29, 100
	mov	w1, 0
	mov	x2, 136
	mov	x0, x25
	sxtw	x21, w22
	lsl	x23, x21, 6
	blr	x3
	ldr	x20, .LC111
	ldr	x26, .LC112
	add	x19, x20, x23
	strb	w24, [x29, 248]
	ldr	w3, [x20, x23]
	ldr	w0, [x19, 8]
	cmp	w3, 2
	ldr	x1, [x26, w0, sxtw 3]
	ldr	w1, [x1, 1352]
	str	w1, [x29, 96]
	beq	.L232
	cmp	w3, 3
	beq	.L233
	cmp	w3, 1
	beq	.L278
	ldr	x1, .LC120
	mov	w2, w0
	mov	w4, w24
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x19, 8]
	cmp	w0, 31
	bhi	.L279
	add	x20, x20, x0, sxtw 2
	str	wzr, [x20, 608]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 448
	ret
	.p2align 3
.L278:
	ldr	w24, [x19, 28]
	add	x23, x19, 4
	cmp	w24, 1
	beq	.L280
	mov	w1, 3
	mov	x2, x23
	mov	w0, w22
	bl	VDMDRV_AdjustErrRatio
	ldr	w1, [x19, 4]
	cbz	w1, .L236
	ldr	x0, .LC115
	ldr	x4, [x0]
	cbz	x4, .L236
	ldr	w0, [x19, 8]
	mov	w3, 4
	str	w1, [x29, 88]
	add	x2, x29, 88
	mov	w1, 114
	blr	x4
.L236:
	ldr	w0, [x29, 96]
	cmp	w0, 1
	beq	.L281
.L237:
	add	x19, x20, x21, lsl 6
	ldr	w0, [x19, 8]
	ldr	x1, [x26, w0, sxtw 3]
	add	x1, x1, 507904
	ldrsb	w1, [x1, 2024]
	cbnz	w1, .L282
	ldr	w1, [x19, 4]
.L255:
	ldr	w2, [x29, 96]
	cmp	w2, 1
	bne	.L240
	add	x21, x20, x21, lsl 6
	mov	w3, w22
	ldr	w2, [x21, 44]
	cmp	w2, 2
	add	x2, x29, 100
	beq	.L283
.L241:
	bl	VCTRL_VdmPostProc
	ldr	w0, [x21, 8]
	bl	VCTRL_ClearDecparam
	ldr	w0, [x21, 8]
	cmp	w0, 31
	bhi	.L245
.L243:
	add	x20, x20, x0, sxtw 2
	str	wzr, [x20, 608]
.L244:
	mov	w0, w22
	bl	VDMDRV_Reset
	mov	w0, w22
	bl	VDMDRV_ActivateVDH
.L229:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 448
	ret
	.p2align 3
.L233:
	ldr	w1, [x19, 4]
	mov	w3, w22
	mov	x2, x25
	str	wzr, [x19, 28]
	bl	VCTRL_VdmPostProc
	ldr	w0, [x19, 8]
	bl	VCTRL_ClearDecparam
	ldr	w0, [x19, 8]
	cmp	w0, 31
	bls	.L243
.L245:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L244
	.p2align 3
.L232:
	ldr	w0, [x19, 12]
	add	x24, x19, 4
	str	wzr, [x19, 28]
	cmp	w0, 6
	ldr	x1, [x19, 48]
	beq	.L284
.L250:
	bl	VDMDRV_IsCopy
	cbz	w0, .L285
	mov	x2, x24
	mov	w1, 0
	mov	w0, w22
	add	x21, x20, x21, lsl 6
	bl	VDMDRV_AdjustErrRatio
	mov	w3, w22
	add	x2, x29, 100
	ldp	w1, w0, [x21, 4]
	b	.L241
	.p2align 3
.L285:
	add	x21, x20, x21, lsl 6
	mov	w3, w22
	add	x2, x29, 100
	ldp	w1, w0, [x21, 4]
	b	.L241
	.p2align 3
.L280:
	ldr	x1, [x19, 48]
	mov	w2, w22
	ldr	w0, [x19, 12]
	bl	PostPro_SetFullRepair
	mov	x2, x23
	mov	w1, w24
	mov	w0, w22
	bl	VDMDRV_AdjustErrRatio
	str	wzr, [x19, 28]
	ldrb	w2, [x29, 248]
	mov	w0, 0
	ldr	x1, .LC114
	bl	dprint_vfmw
	b	.L236
	.p2align 3
.L284:
	ldrb	w2, [x1, 17]
	cmp	w2, 1
	bne	.L250
	lsl	x3, x21, 3
	sub	x3, x3, x21
	lsl	x3, x3, 3
	sub	x3, x3, x21
	lsl	x3, x3, 2
	sub	x3, x3, x21
	add	x3, x20, x3, lsl 3
	ldr	w3, [x3, 1840]
	cmp	w3, wzr
	ble	.L250
	ldr	x3, .LC116
	ldr	x5, [x3, 272]
	cbz	x5, .L252
	ldr	x4, [x29, 240]
	mov	w3, w22
	blr	x5
	cbz	w0, .L286
.L252:
	add	x19, x20, x21, lsl 6
	mov	x2, x24
	b	.L276
	.p2align 3
.L279:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L229
	.p2align 3
.L240:
	mov	w3, w22
	add	x2, x29, 100
	add	x21, x20, x21, lsl 6
	b	.L241
	.p2align 3
.L282:
	ldr	x1, [x19, 48]
	ldr	w0, [x19, 12]
	bl	PostPro_GetRepairStratage
	ldr	w1, [x19, 4]
	cmp	w1, wzr
	cset	w2, eq
	cmp	w0, 1
	cset	w0, eq
	orr	w2, w2, w0
	cbnz	w2, .L287
	ldr	w0, [x19, 12]
	ldr	x1, [x19, 48]
	mov	w19, 2
	cmp	w0, 6
	beq	.L288
.L246:
	ldr	x3, .LC116
	ldr	x5, [x3, 272]
	cbz	x5, .L247
	ldr	x4, [x29, 240]
	mov	w3, w22
	blr	x5
	cbz	w0, .L289
.L247:
	add	x19, x20, x21, lsl 6
	mov	x2, x23
.L276:
	mov	w1, 2
	mov	w0, w22
	bl	VDMDRV_AdjustErrRatio
	ldp	w1, w0, [x19, 4]
	mov	w3, w22
	add	x2, x29, 100
	bl	VCTRL_VdmPostProc
	ldr	w0, [x19, 8]
	bl	VCTRL_ClearDecparam
	ldr	w0, [x19, 8]
	cmp	w0, 31
	bhi	.L290
	add	x0, x20, x0, sxtw 2
	str	wzr, [x0, 608]
.L249:
	lsl	x21, x21, 6
	str	wzr, [x20, x21]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 448
	ret
	.p2align 3
.L290:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L249
	.p2align 3
.L281:
	mov	x2, x23
	mov	w1, 0
	mov	w0, w22
	bl	VDMDRV_AdjustErrRatio
	b	.L237
	.p2align 3
.L288:
	ldrb	w3, [x1, 17]
	cmp	w3, 1
	bne	.L246
	lsl	x2, x21, 3
	sub	x2, x2, x21
	lsl	x2, x2, 3
	sub	x2, x2, x21
	lsl	x2, x2, 2
	sub	x2, x2, x21
	add	x2, x20, x2, lsl 3
	ldr	w3, [x2, 1840]
	cmp	w3, wzr
	mov	w3, 3
	cset	w2, gt
	csel	w19, w19, w3, le
	b	.L246
	.p2align 3
.L286:
	ldr	x2, [x29, 240]
	mov	w1, w22
	mov	w0, 3
	bl	VDMDRV_StartRepair
	ldr	x2, .LC118
	mov	w4, 1008
	ldr	x3, .LC117
	mov	w1, 7
	add	x2, x23, x2
	ldr	w0, [x19, 8]
	add	x3, x3, 136
	add	x2, x2, 4
	bl	RecordPOS
	b	.L229
	.p2align 3
.L289:
	ldr	x2, [x29, 240]
	mov	w1, w22
	mov	w0, w19
	bl	VDMDRV_StartRepair
	lsl	x2, x21, 6
	ldr	x0, .LC118
	add	x20, x20, x2
	ldr	x3, .LC117
	add	x2, x2, x0
	mov	w4, 977
	mov	w1, 7
	add	x3, x3, 104
	ldr	w0, [x20, 8]
	add	x2, x2, 4
	bl	RecordPOS
	b	.L229
	.p2align 3
.L283:
	bl	VCTRL_VdmPostProc
	b	.L229
.L287:
	ldr	w0, [x19, 8]
	b	.L255
	.size	VDMDRV_AfterDec, .-VDMDRV_AfterDec
	.align	3
.LC109:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC110:
	.xword	g_HalDisable
	.align	3
.LC111:
	.xword	.LANCHOR0
	.align	3
.LC112:
	.xword	s_pstVfmwChan
	.align	3
.LC114:
	.xword	.LC113
	.align	3
.LC115:
	.xword	g_event_report
	.align	3
.LC116:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC117:
	.xword	.LANCHOR2
	.align	3
.LC118:
	.xword	g_VfmwGlobalStat
	.align	3
.LC120:
	.xword	.LC119
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
	sxtw	x19, w0
	mov	x0, x30
	mov	x21, x19
	bl	_mcount
	ldr	x20, .LC121
	lsl	x0, x19, 6
	add	x22, x20, x0
	ldr	w0, [x20, x0]
	cbnz	w0, .L310
	add	x19, x20, x19, lsl 2
	mov	w0, 0
	ldr	w1, [x19, 64]
	cbz	w1, .L307
	cmp	w1, 1
	beq	.L311
.L295:
	mov	w0, 1
.L307:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L310:
	ldr	x0, .LC122
	ldr	x0, [x0]
	blr	x0
	str	w0, [x22, 24]
	ldr	w1, [x22, 20]
	cmp	w0, w1
	bcc	.L293
	sub	w3, w0, w1
	cmp	w3, wzr
	ccmp	w1, wzr, 4, ge
	beq	.L293
	cmp	w3, 1000
	bls	.L295
	ldr	x1, .LC124
	mov	w0, 1
	ldr	w2, [x22, 8]
	bl	dprint_vfmw
	ldr	x0, .LC125
	ldr	x4, [x0]
	cbz	x4, .L296
	ldr	w0, [x22, 8]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 101
	blr	x4
.L296:
	ldr	x0, .LC126
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L297
	mov	w1, w21
	mov	w0, 1
	bl	VDH_Reset_Module
.L298:
	add	x0, x20, x19, lsl 6
	mov	w2, 1
	ldr	w1, [x0, 36]
	str	w2, [x0, 28]
	cmp	w1, w2
	bne	.L300
	str	wzr, [x0, 36]
.L301:
	lsl	x19, x19, 6
	add	x0, x20, x19
	str	wzr, [x20, x19]
	ldr	w19, [x0, 8]
	str	wzr, [x0, 28]
	cmp	w19, 31
	bhi	.L312
	add	x19, x20, x19, sxtw 2
	mov	w0, 0
	str	wzr, [x19, 608]
	b	.L307
	.p2align 3
.L293:
	str	w0, [x22, 20]
	mov	w0, 1
	b	.L307
	.p2align 3
.L311:
	mov	w2, 2
	str	w2, [x19, 64]
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L300:
	mov	w1, 0
	mov	w0, w21
	bl	VDMDRV_AfterDec
	b	.L301
	.p2align 3
.L297:
	ldr	x0, .LC127
	ldr	x1, [x0, 152]
	cbz	x1, .L299
	mov	w0, w21
	blr	x1
	b	.L298
.L299:
	ldr	x1, .LC128
	mov	w2, 1130
	mov	w0, 0
	bl	dprint_vfmw
	b	.L298
	.p2align 3
.L312:
	bl	VDMDRV_ClearChanIsDec.part.4
	mov	w0, 0
	b	.L307
	.size	VDMDRV_CheckDevice, .-VDMDRV_CheckDevice
	.align	3
.LC121:
	.xword	.LANCHOR0
	.align	3
.LC122:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC124:
	.xword	.LC123
	.align	3
.LC125:
	.xword	g_event_report
	.align	3
.LC126:
	.xword	g_HalDisable
	.align	3
.LC127:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC128:
	.xword	.LC41
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
	cbz	w0, .L315
	ldp	x29, x30, [sp], 16
	ret
	.p2align 3
.L315:
	bl	VDMDRV_ActivateVDH
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMDRV_WakeUpVdm, .-VDMDRV_WakeUpVdm
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_IsrProcess
	.type	VDMDRV_IsrProcess, %function
VDMDRV_IsrProcess:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	ble	.L317
	ldr	x2, .LC129
	mov	w3, w19
	ldr	x1, .LC131
	mov	w4, 0
	add	x2, x2, 168
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L317:
	mov	w0, 9
	sxtw	x20, w19
	bl	VCTRL_RecordPosTime
	ldr	x24, .LC132
	mov	w0, 0
	ldr	x1, [x24, 24]
	blr	x1
	ldr	x21, .LC133
	add	x0, x21, x20, lsl 6
	ldr	w0, [x0, 8]
	tbnz	w0, #31, .L367
	ldr	x1, .LC134
	ldr	x0, [x1, w0, sxtw 3]
	cbz	x0, .L367
	ldr	x22, .LC135
	ldr	w25, [x0, 1352]
	ldr	x2, [x22, 312]
	cbz	x2, .L368
.L416:
	mov	w1, w19
	mov	w0, 2
	blr	x2
	mov	w23, w0
	ldr	x2, [x22, 312]
	cbz	x2, .L369
	mov	w1, w19
	mov	w0, 1
	mov	w27, 0
	blr	x2
	mov	w26, w0
	ldr	x2, [x22, 312]
	cbz	x2, .L320
	mov	w1, w19
	mov	w0, 3
	blr	x2
	mov	w27, w0
.L320:
	ldr	x2, [x22, 320]
	cbz	x2, .L321
	mov	w1, w19
	mov	w0, 2
	blr	x2
	cmp	w23, 1
	beq	.L322
	cmp	w25, 1
	ccmp	w0, 1, 0, eq
	bne	.L365
.L322:
	add	x25, x21, x20, lsl 6
	ldr	x26, .LC137
	ldr	w1, [x25, 8]
	sxtw	x0, w1
	lsl	x23, x0, 6
	add	x0, x23, x0, lsl 3
	add	x23, x26, x0
	ldr	w0, [x23, 24]
	cmp	w0, 5
	beq	.L407
.L330:
	tbnz	w1, #31, .L333
	ldr	x0, .LC134
	ldr	x0, [x0, w1, sxtw 3]
	cbz	x0, .L333
	ldr	x2, [x22, 320]
	ldr	w23, [x0, 1352]
	cbz	x2, .L371
	mov	w1, w19
	mov	w0, 1
	blr	x2
	mov	w25, w0
.L334:
	ldr	x2, [x22, 312]
	cbz	x2, .L335
	mov	w1, w19
	mov	w0, 1
	blr	x2
	cmp	w23, 1
	bne	.L333
	cmp	w0, 1
	cset	w2, eq
	cmp	w25, 1
	cset	w1, eq
	tst	w2, w1
	beq	.L336
.L338:
	add	x0, x21, x20, lsl 6
	mov	w1, 1
	mov	w23, w1
	str	w1, [x0, 44]
	b	.L332
	.p2align 3
.L335:
	cmp	w23, 1
	beq	.L408
	.p2align 2
.L333:
	mov	w23, 1
.L332:
	ldr	x1, [x22, 288]
	cbz	x1, .L339
	mov	w0, w19
	blr	x1
.L340:
	ldr	x1, [x22, 176]
	cbz	x1, .L341
	mov	w0, w19
	blr	x1
.L342:
	lsl	x22, x20, 6
	ldr	x3, .LC129
	add	x0, x21, x22
	add	x2, x21, 2800
	mov	w4, 1213
	add	x3, x3, 192
	mov	w1, 6
	ldr	w0, [x0, 8]
	add	x2, x2, x0, sxtw 2
	bl	RecordPOS
	ldr	x0, [x24]
	blr	x0
	ldr	x4, .LC139
	add	x3, x4, x22
	ldr	w1, [x3, 4]
	cbz	w1, .L344
	ldr	w5, [x4, x22]
	add	w2, w5, 49152
	add	w2, w2, 848
	cmp	w1, w2
	bhi	.L345
	ldr	w2, [x3, 12]
.L346:
	lsl	x3, x20, 2
	sub	w1, w0, w1
	sub	w0, w0, w5
	sub	x5, x3, x20
	lsl	x3, x5, 4
	lsl	x7, x20, 6
	sub	x3, x3, x5
	add	w1, w1, w2
	add	x2, x4, x7
	cmp	w0, 999
	add	x3, x21, x3, lsl 2
	ldp	w5, w6, [x2, 32]
	ldr	w3, [x3, 760]
	add	w5, w5, 1
	str	wzr, [x2, 4]
	str	w1, [x2, 12]
	add	w6, w6, w3, lsr 10
	stp	w5, w6, [x2, 32]
	bls	.L344
	add	x7, x21, x7
	ldr	w3, [x7, 16]
	cbnz	w3, .L348
	ldr	w7, [x2, 16]
.L349:
	lsl	w2, w1, 6
	lsl	w3, w7, 6
	sub	w2, w2, w1
	sub	w3, w3, w7
	lsl	w2, w2, 1
	lsl	w3, w3, 1
	sub	w2, w2, w1
	lsl	w1, w5, 6
	sub	w1, w1, w5
	sub	w3, w3, w7
	lsl	w1, w1, 1
	lsl	w3, w3, 3
	sub	w1, w1, w5
	lsl	x5, x20, 6
	lsl	w2, w2, 3
	lsl	w1, w1, 3
	udiv	w3, w3, w0
	str	wzr, [x4, x5]
	add	x4, x4, x5
	stp	wzr, w6, [x4, 36]
	str	w0, [x4, 44]
	udiv	w2, w2, w0
	stp	w2, w3, [x4, 20]
	udiv	w1, w1, w0
	stp	w1, wzr, [x4, 28]
.L344:
	lsl	x0, x20, 6
	add	x22, x21, x0
	ldr	w1, [x22, 36]
	ldr	w25, [x22, 8]
	cmp	w1, 1
	beq	.L409
	ldr	w1, [x22, 56]
	cmp	w1, 1
	beq	.L410
	ldr	w2, [x21, x0]
	cbz	w2, .L353
	ldr	x0, [x22, 48]
	cbz	x0, .L411
.L353:
	mov	w0, w25
	bl	VCTRL_IsChanActive
	cbnz	w0, .L412
	mov	w0, w25
	bl	VCTRL_GetDecParam
	cbz	x0, .L413
	mov	w1, 1
	mov	w0, w19
	bl	VDMDRV_AfterDec
.L362:
	add	x0, x21, x20, lsl 6
	ldr	w0, [x0, 8]
	bl	VCTRL_InformVdmFree
	cmp	w23, 1
	beq	.L414
.L357:
	ldr	x1, [x24, 32]
	mov	w0, 0
	blr	x1
	lsl	x0, x20, 2
	sub	x20, x0, x20
	mov	w0, 1
	lsl	x1, x20, 4
	sub	x20, x1, x20
	add	x21, x21, x20, lsl 2
	ldr	w1, [x21, 760]
	bl	VCTRL_RecordData
	mov	w0, 10
	bl	VCTRL_RecordPosTime
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L321:
	cmp	w23, 1
	beq	.L322
.L365:
	cbnz	w23, .L359
	cmp	w26, 1
	ccmp	w27, 1, 0, eq
	beq	.L359
	ldr	x1, [x22, 264]
	cbz	x1, .L327
	mov	w0, w19
	blr	x1
	cbnz	w0, .L359
.L327:
	ldr	x2, [x22, 312]
	cbz	x2, .L326
	mov	w1, w19
	mov	w0, 1
	blr	x2
	cbnz	w0, .L359
.L326:
	lsl	x0, x20, 6
	str	wzr, [x21, x0]
	.p2align 2
.L359:
	add	x20, x21, x20, lsl 6
	ldr	w0, [x20, 8]
	bl	VCTRL_InformVdmFree
	ldr	x0, .LC136
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L329
	mov	w1, w19
	mov	w0, 1
	bl	VDH_Notify_ModuleIdle
.L329:
	ldr	x1, [x24, 32]
	mov	w0, 0
	blr	x1
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L412:
	ldr	x1, .LC145
	mov	w3, w25
	mov	w2, 750
	mov	w0, 0
	bl	dprint_vfmw
.L351:
	add	x0, x21, x20, lsl 6
	ldr	w0, [x0, 8]
	cmp	w0, 31
	bhi	.L415
	add	x0, x21, x0, sxtw 2
	str	wzr, [x0, 608]
.L356:
	lsl	x0, x20, 6
	str	wzr, [x21, x0]
	b	.L362
	.p2align 3
.L407:
	ldr	w0, [x23, 64]
	cbnz	w0, .L330
	ldr	x0, [x24]
	blr	x0
	str	w0, [x23, 64]
	ldr	w1, [x25, 8]
	mov	w2, 6
	sxtw	x0, w1
	lsl	x3, x0, 6
	add	x0, x3, x0, lsl 3
	add	x26, x26, x0
	str	w2, [x26, 24]
	b	.L330
	.p2align 3
.L367:
	ldr	x22, .LC135
	mov	w25, 0
	ldr	x2, [x22, 312]
	cbnz	x2, .L416
.L368:
	mov	w26, 0
	mov	w23, 0
	mov	w27, 0
	b	.L320
	.p2align 3
.L345:
	str	w1, [x4, x22]
	mov	w5, w1
	mov	w2, 0
	b	.L346
	.p2align 3
.L371:
	mov	w25, 0
	b	.L334
	.p2align 3
.L415:
	bl	VDMDRV_ClearChanIsDec.part.4
	b	.L356
	.p2align 3
.L348:
	udiv	w7, w6, w3
	str	w7, [x2, 16]
	b	.L349
	.p2align 3
.L336:
	cmp	w0, wzr
	cset	w0, eq
	tst	w1, w0
	bne	.L360
	cmp	w25, wzr
	cset	w0, eq
	tst	w2, w0
	beq	.L333
	add	x0, x21, x20, lsl 6
	ldr	w1, [x0, 44]
	cmp	w1, 2
	bne	.L338
	mov	w1, 3
	str	w1, [x0, 44]
	b	.L332
	.p2align 3
.L408:
	cmp	w25, 1
	bne	.L333
.L360:
	add	x0, x21, x20, lsl 6
	mov	w1, 2
	mov	w23, 0
	str	w1, [x0, 44]
	b	.L332
	.p2align 3
.L411:
	ldr	x1, .LC143
	bl	dprint_vfmw
	mov	w0, w25
	bl	VCTRL_GetDecParam
	cbz	x0, .L351
	mov	w3, w19
	mov	x2, 0
	mov	w1, 100
	mov	w0, w25
	bl	VCTRL_VdmPostProc
	b	.L351
	.p2align 3
.L341:
	ldr	x1, .LC138
	mov	w2, 1211
	mov	w0, 0
	bl	dprint_vfmw
	b	.L342
	.p2align 3
.L339:
	ldr	x1, .LC138
	mov	w2, 1209
	mov	w0, 0
	bl	dprint_vfmw
	b	.L340
	.p2align 3
.L414:
	ldr	x0, .LC136
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L357
	mov	w1, w19
	mov	w0, w23
	bl	VDH_Notify_ModuleIdle
	b	.L357
	.p2align 3
.L409:
	ldr	x1, .LC141
	mov	w2, 722
	mov	w0, 0
	bl	dprint_vfmw
	str	wzr, [x22, 36]
	b	.L351
	.p2align 3
.L410:
	mov	w1, w19
	mov	w0, w25
	bl	VCTRL_VdmProcSedOnly
	b	.L351
	.p2align 3
.L413:
	ldr	x1, .LC147
	mov	w3, w25
	mov	w2, 756
	bl	dprint_vfmw
	b	.L351
.L369:
	mov	w26, 0
	mov	w27, 0
	b	.L320
	.size	VDMDRV_IsrProcess, .-VDMDRV_IsrProcess
	.align	3
.LC129:
	.xword	.LANCHOR2
	.align	3
.LC131:
	.xword	.LC130
	.align	3
.LC132:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC133:
	.xword	.LANCHOR0
	.align	3
.LC134:
	.xword	s_pstVfmwChan
	.align	3
.LC135:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC136:
	.xword	g_HalDisable
	.align	3
.LC137:
	.xword	g_VfmwChanStat
	.align	3
.LC138:
	.xword	.LC41
	.align	3
.LC139:
	.xword	g_VfmwGlobalStat
	.align	3
.LC141:
	.xword	.LC140
	.align	3
.LC143:
	.xword	.LC142
	.align	3
.LC145:
	.xword	.LC144
	.align	3
.LC147:
	.xword	.LC146
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
	cmp	w19, 31
	bhi	.L418
	ldr	x20, .LC149
	ldr	w0, [x20, 8]
	cmp	w19, w0
	beq	.L425
.L417:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L418:
	ldr	x2, .LC150
	mov	w3, 1292
	ldr	x1, .LC151
	mov	w0, 1
	add	x2, x2, 216
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L425:
	ldr	x0, .LC152
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L421
	mov	w1, 0
	mov	w0, 1
	bl	VDH_Reset_Module
	str	wzr, [x20]
	b	.L417
	.p2align 3
.L421:
	ldr	x0, .LC153
	ldr	x1, [x0, 152]
	cbz	x1, .L423
	mov	w0, 0
	blr	x1
	str	wzr, [x20]
	b	.L417
.L423:
	ldr	x1, .LC154
	mov	w2, 1306
	mov	w0, 0
	bl	dprint_vfmw
	str	wzr, [x20]
	b	.L417
	.size	VDMDRV_ResetVDH, .-VDMDRV_ResetVDH
	.align	3
.LC149:
	.xword	.LANCHOR0
	.align	3
.LC150:
	.xword	.LANCHOR2
	.align	3
.LC151:
	.xword	.LC7
	.align	3
.LC152:
	.xword	g_HalDisable
	.align	3
.LC153:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC154:
	.xword	.LC41
	.global	g_VdmExtParam
	.global	g_DspDrvState
	.global	g_VdmDrvParam
	.global	USE_FF_APT_EN
	.global	g_ChanCtx
	.global	g_BackUp
	.global	g_DecReport
	.global	g_RepairParam
	.global	g_HwMem
	.global	g_UpMsg
	.section	.rodata
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.11678, %object
	.size	__func__.11678, 22
__func__.11678:
	.string	"VDMDRV_ClearChanIsDec"
	.zero	2
	.type	__func__.11602, %object
	.size	__func__.11602, 12
__func__.11602:
	.string	"VDMDRV_Init"
	.zero	4
	.type	__func__.11606, %object
	.size	__func__.11606, 13
__func__.11606:
	.string	"VDMDRV_Reset"
	.zero	3
	.type	__func__.11616, %object
	.size	__func__.11616, 19
__func__.11616:
	.string	"VDMDRV_SetPriority"
	.zero	5
	.type	__func__.11644, %object
	.size	__func__.11644, 20
__func__.11644:
	.string	"VDMDRV_PrepareSleep"
	.zero	4
	.type	__func__.11648, %object
	.size	__func__.11648, 21
__func__.11648:
	.string	"VDMDRV_GetSleepStage"
	.zero	3
	.type	__func__.11652, %object
	.size	__func__.11652, 18
__func__.11652:
	.string	"VDMDRV_ForceSleep"
	.zero	6
	.type	__func__.11656, %object
	.size	__func__.11656, 17
__func__.11656:
	.string	"VDMDRV_ExitSleep"
	.zero	7
	.type	__func__.11669, %object
	.size	__func__.11669, 17
__func__.11669:
	.string	"VDMDRV_IsChanDec"
	.zero	7
	.type	__func__.11674, %object
	.size	__func__.11674, 20
__func__.11674:
	.string	"VDMDRV_SetChanIsDec"
	.zero	4
	.type	__func__.11692, %object
	.size	__func__.11692, 19
__func__.11692:
	.string	"VDMDRV_ChnDecReady"
	.align	3
.LANCHOR2 = . + 0
	.type	__func__.11807, %object
	.size	__func__.11807, 23
__func__.11807:
	.string	"VDMDRV_MMUIntServeProc"
	.zero	1
	.type	__func__.11811, %object
	.size	__func__.11811, 20
__func__.11811:
	.string	"VDMDRV_SetStateIdle"
	.zero	4
	.type	__func__.11816, %object
	.size	__func__.11816, 27
__func__.11816:
	.string	"VDMDRV_WaitVdmReadyIfNoIsr"
	.zero	5
	.type	__FUNCTION__.11733, %object
	.size	__FUNCTION__.11733, 19
__FUNCTION__.11733:
	.string	"VDMDRV_DoBeforeDec"
	.zero	5
	.type	__FUNCTION__.11848, %object
	.size	__FUNCTION__.11848, 29
__FUNCTION__.11848:
	.string	"VDMDRV_AfterDecProcessNormal"
	.zero	3
	.type	__FUNCTION__.11860, %object
	.size	__FUNCTION__.11860, 29
__FUNCTION__.11860:
	.string	"VDMDRV_AfterDecProcessRepair"
	.zero	3
	.type	__func__.11898, %object
	.size	__func__.11898, 18
__func__.11898:
	.string	"VDMDRV_IsrProcess"
	.zero	6
	.type	__FUNCTION__.11899, %object
	.size	__FUNCTION__.11899, 18
__FUNCTION__.11899:
	.string	"VDMDRV_IsrProcess"
	.zero	6
	.type	__func__.11922, %object
	.size	__func__.11922, 16
__func__.11922:
	.string	"VDMDRV_ResetVDH"
	.data
	.align	2
	.type	USE_FF_APT_EN, %object
	.size	USE_FF_APT_EN, 4
USE_FF_APT_EN:
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
.LC35:
	ASCII(.string	"====== forece VDM sleep! ======\n" )
	.zero	7
.LC41:
	ASCII(.string	"VDMHAL_NULL_FUN_PRINT,L%d\n" )
	.zero	5
.LC61:
	ASCII(.string	"%s The channel %d is not active\n" )
	.zero	7
.LC65:
	ASCII(.string	"The channel %d is decoding\n" )
	.zero	4
.LC67:
	ASCII(.string	"The channel %d DEC PARAM is not ready\n" )
	.zero	1
.LC69:
	ASCII(.string	"some task is already wait to process!!!!\n" )
	.zero	6
.LC78:
	ASCII(.string	"SMMU_READ_ERR  MODULE : VFMW \t SMMU INT STATE: 0x%x \t read_err_addr  = 0x%x\n" )
	.zero	3
.LC80:
	ASCII(.string	"SMMU_WRITE_ERR MODULE : VFMW \t SMMU INT STATE: 0x%x \t write_err_addr = 0x%x\n" )
	.zero	3
.LC91:
	ASCII(.string	"VDMDRV_IsProtocolCopy point of picture para null, wait forever!!!\n" )
	.zero	5
.LC96:
	ASCII(.string	"The channel %d DEC PARAM is not ready(pDecParam == NULL)\n" )
	.zero	6
.LC103:
	ASCII(.string	"VDM Start Fail 2 !\n" )
	.zero	4
.LC113:
	ASCII(.string	"ISR process vdm timeout! FromInt = %d\n" )
	.zero	1
.LC119:
	ASCII(.string	"Chan %d VdmStateMachine=%d Error! FromInt = %d.\n" )
	.zero	7
.LC123:
	ASCII(.string	"Chan %d VDM Time Out(%d ms), Reset VDM!\n" )
	.zero	7
.LC130:
	ASCII(.string	"%s: VdhId(%d) > %d\n" )
	.zero	4
.LC140:
	ASCII(.string	"Line %d, ISR called, ChanResetFlag = 1!!\n" )
	.zero	6
.LC142:
	ASCII(.string	"vdm state machine = %d, but DecParam is null!\n" )
	.zero	1
.LC144:
	ASCII(.string	"line :%d ISR called but chan %d is not active!\n" )
.LC146:
	ASCII(.string	"line :%d ISR called chan %d is active! But Dec Param in CTX is NULL!!!\n" )
	.bss
	.align	3
.LANCHOR0 = . + 0
	.type	g_VdmDrvParam, %object
	.size	g_VdmDrvParam, 64
g_VdmDrvParam:
	.zero	64
	.type	s_eVdmDrvSleepState, %object
	.size	s_eVdmDrvSleepState, 4
s_eVdmDrvSleepState:
	.zero	4
	.zero	4
	.type	g_DspDrvState, %object
	.size	g_DspDrvState, 8
g_DspDrvState:
	.zero	8
	.type	g_VdmExtParam, %object
	.size	g_VdmExtParam, 268
g_VdmExtParam:
	.zero	268
	.zero	4
	.type	g_ChanCtx, %object
	.size	g_ChanCtx, 384
g_ChanCtx:
	.zero	384
	.type	g_BackUp, %object
	.size	g_BackUp, 180
g_BackUp:
	.zero	180
	.zero	4
	.type	g_RepairParam, %object
	.size	g_RepairParam, 1752
g_RepairParam:
	.zero	1752
	.type	last_rec_pos_time.11730, %object
	.size	last_rec_pos_time.11730, 128
last_rec_pos_time.11730:
	.zero	128
	.type	LastRecPosTime.11895, %object
	.size	LastRecPosTime.11895, 128
LastRecPosTime.11895:
	.zero	128
	.type	g_DecReport, %object
	.size	g_DecReport, 824
g_DecReport:
	.zero	824
	.type	g_HwMem, %object
	.size	g_HwMem, 1256
g_HwMem:
	.zero	1256
	.type	g_UpMsg, %object
	.size	g_UpMsg, 3200
g_UpMsg:
	.zero	3200
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
