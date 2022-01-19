#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vfmw_ctrl.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	VCTRL_Isr_0
	.type	VCTRL_Isr_0, %function
VCTRL_Isr_0:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	bl	VDMDRV_IsrProcess
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_Isr_0, .-VCTRL_Isr_0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Scd_Isr
	.type	VCTRL_Scd_Isr, %function
VCTRL_Scd_Isr:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	bl	SM_SCDIntServeProc
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_Scd_Isr, .-VCTRL_Scd_Isr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_HandleAllocMemEvent, %function
VCTRL_HandleAllocMemEvent:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, 152
	beq	.L4
	ldr	x3, .LC0
	mov	x5, 152
	ldr	x2, .LC2
	mov	w4, w20
	mov	w1, 717
	mov	w0, 1
	bl	dprint_normal
.L3:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L4:
	ldr	x20, .LC3
	mov	x2, 144
	mov	w1, 0
	add	x0, x29, 48
	ldr	x3, [x20, 96]
	blr	x3
	ldr	x21, .LC5
	ldr	x4, [x20, 136]
	mov	x3, x19
	mov	x2, x21
	mov	x1, 32
	add	x0, x29, 48
	blr	x4
	strb	wzr, [x29, 79]
	ldp	w4, w3, [x19, 48]
	ldr	w2, [x19, 56]
	ldr	x1, [x19, 64]
	ldrsb	w0, [x19, 80]
	str	w2, [x29, 92]
	stp	wzr, w4, [x29, 104]
	str	w3, [x29, 112]
	str	x1, [x29, 184]
	cbnz	w0, .L14
.L6:
	ldr	w1, [x19, 32]
	add	x2, x29, 48
	mov	w0, 0
	cmp	w1, 1
	cset	w1, eq
	bl	VMM_SendCommand
	cbz	w0, .L3
	ldr	w5, [x29, 92]
	add	x4, x29, 48
	ldr	x3, .LC0
	mov	w1, 752
	ldr	x2, .LC7
	mov	w0, 1
	bl	dprint_normal
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L14:
	mov	w0, 1
	ldr	x4, [x20, 136]
	strb	w0, [x29, 120]
	mov	x2, x21
	mov	x1, 32
	add	x3, x19, 88
	add	x0, x29, 128
	blr	x4
	strb	wzr, [x29, 159]
	ldp	w1, w0, [x19, 136]
	ldr	w2, [x19, 144]
	stp	w2, w1, [x29, 172]
	str	w0, [x29, 180]
	b	.L6
	.size	VCTRL_HandleAllocMemEvent, .-VCTRL_HandleAllocMemEvent
	.align	3
.LC0:
	.xword	.LANCHOR0
	.align	3
.LC2:
	.xword	.LC1
	.align	3
.LC3:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC5:
	.xword	.LC4
	.align	3
.LC7:
	.xword	.LC6
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_HandleReleaseMemEvent, %function
VCTRL_HandleReleaseMemEvent:
	stp	x29, x30, [sp, -176]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, 152
	beq	.L16
	ldr	x3, .LC8
	mov	x5, 152
	ldr	x2, .LC9
	mov	w4, w20
	add	x3, x3, 32
	mov	w1, 766
	mov	w0, 1
	bl	dprint_normal
.L15:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L16:
	ldr	x20, .LC10
	mov	x2, 144
	mov	w1, 0
	add	x0, x29, 32
	ldr	x3, [x20, 96]
	blr	x3
	mov	x1, 32
	ldr	x2, .LC11
	ldr	x4, [x20, 136]
	mov	x3, x19
	add	x0, x29, x1
	blr	x4
	strb	wzr, [x29, 63]
	ldp	w7, w6, [x19, 48]
	ldr	x3, [x19, 40]
	add	x2, x29, 32
	ldr	w8, [x19, 32]
	mov	w1, 0
	ldr	w5, [x19, 56]
	mov	w0, 1
	ldr	x4, [x19, 64]
	str	x3, [x29, 64]
	mov	w3, 2
	stp	w8, w5, [x29, 72]
	stp	wzr, w7, [x29, 88]
	str	w6, [x29, 96]
	str	x4, [x29, 168]
	str	w3, [x29, 100]
	bl	VMM_SendCommand
	cbz	w0, .L15
	ldr	x3, .LC8
	add	x4, x29, 32
	ldr	w5, [x29, 72]
	mov	w1, 795
	ldr	x2, .LC13
	add	x3, x3, 32
	mov	w0, 1
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 176
	ret
	.size	VCTRL_HandleReleaseMemEvent, .-VCTRL_HandleReleaseMemEvent
	.align	3
.LC8:
	.xword	.LANCHOR0
	.align	3
.LC9:
	.xword	.LC1
	.align	3
.LC10:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC11:
	.xword	.LC4
	.align	3
.LC13:
	.xword	.LC12
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_HandleAllocPreProcessEvent, %function
VCTRL_HandleAllocPreProcessEvent:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	str	xzr, [x29, 184]
	add	x0, x29, 40
	cmp	w19, 16
	stp	xzr, xzr, [x0]
	add	x0, x29, 56
	stp	xzr, xzr, [x0]
	add	x0, x29, 72
	stp	xzr, xzr, [x0]
	add	x0, x29, 88
	stp	xzr, xzr, [x0]
	add	x0, x29, 104
	stp	xzr, xzr, [x0]
	add	x0, x29, 120
	stp	xzr, xzr, [x0]
	add	x0, x29, 136
	stp	xzr, xzr, [x0]
	add	x0, x29, 152
	stp	xzr, xzr, [x0]
	add	x0, x29, 168
	stp	xzr, xzr, [x0]
	bne	.L30
	ldr	x0, [x20]
	cmp	w0, 3
	bhi	.L31
	ldr	x1, [x20, 8]
	cbz	x1, .L32
	ldr	x3, .LC22
	mov	w19, 1
	ldr	x4, .LC23
	mov	x2, 28
	str	w19, [x29, 40]
	ldr	x3, [x3, w0, sxtw 3]
	add	x0, x29, 64
	ldr	x4, [x4, 104]
	add	x5, x3, 24576
	ldr	x3, [x3, 26904]
	str	x3, [x29, 56]
	ldr	w3, [x5, 2320]
	str	w3, [x29, 48]
	blr	x4
	add	x1, x29, 40
	mov	w0, 10
	bl	VMM_SendCommandBlock
	cbnz	w0, .L33
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L30:
	ldr	x3, .LC14
	mov	w4, w19
	ldr	x2, .LC15
	mov	x5, 16
	add	x3, x3, 64
	mov	w1, 866
	mov	w0, 1
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L31:
	ldr	x3, .LC14
	mov	w4, 873
	ldr	x5, .LC17
.L29:
	ldr	x2, .LC19
	add	x3, x3, 64
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L33:
	ldr	x3, .LC14
	mov	w1, 886
	ldr	w4, [x29, 40]
	mov	w0, w19
	ldr	x2, .LC25
	add	x3, x3, 64
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L32:
	ldr	x3, .LC14
	mov	w4, 874
	ldr	x5, .LC21
	b	.L29
	.size	VCTRL_HandleAllocPreProcessEvent, .-VCTRL_HandleAllocPreProcessEvent
	.align	3
.LC14:
	.xword	.LANCHOR0
	.align	3
.LC15:
	.xword	.LC1
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC19:
	.xword	.LC18
	.align	3
.LC21:
	.xword	.LC20
	.align	3
.LC22:
	.xword	.LANCHOR1
	.align	3
.LC23:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC25:
	.xword	.LC24
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_EventReport
	.type	VCTRL_EventReport, %function
VCTRL_EventReport:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	x22, x2
	mov	w21, w3
	bl	_mcount
	cmp	w19, 3
	bhi	.L64
	ldr	x2, .LC30
	ldr	x0, [x2, w19, sxtw 3]
	cbz	x0, .L65
	sub	w5, w20, #61
	cmp	w5, 4
	bls	.L66
	ldr	w4, [x0, 144]
	cbz	w4, .L51
	cmp	w4, 1
	bne	.L67
	ldr	x3, [x2, 224]
	cbz	x3, .L68
.L54:
	mov	x2, x22
	mov	w1, w20
	mov	w0, w19
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L66:
	ldr	x0, .LC33
	ldrb	w0, [x0,w5,uxtw]
	adr	x1, .Lrtx40
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx40:
	.section	.rodata
	.align	0
	.align	2
.L40:
	.byte	(.L39 - .Lrtx40) / 4
	.byte	(.L41 - .Lrtx40) / 4
	.byte	(.L42 - .Lrtx40) / 4
	.byte	(.L43 - .Lrtx40) / 4
	.byte	(.L44 - .Lrtx40) / 4
	.text
	.p2align 3
.L67:
	ldr	x3, .LC28
	mov	w5, w21
	ldr	x2, .LC44
	mov	w1, 968
	add	x3, x3, 104
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
.L61:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L51:
	ldr	x3, [x2, 216]
	cbnz	x3, .L54
	ldr	x2, .LC40
	mov	w1, 946
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L61
	.p2align 3
.L43:
	add	x0, x29, 56
	cmp	w21, 16
	str	xzr, [x29, 72]
	stp	xzr, xzr, [x0]
	beq	.L48
	ldr	x3, .LC28
	mov	x5, 16
	ldr	x2, .LC34
	mov	w4, w21
	add	x3, x3, 168
	mov	w1, 836
	mov	w0, 1
	bl	dprint_normal
.L45:
	mov	w0, 0
.L69:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L42:
	add	x0, x29, 56
	cmp	w21, 16
	stp	xzr, xzr, [x0]
	beq	.L46
	ldr	x3, .LC28
	mov	x5, 16
	ldr	x2, .LC34
	mov	w4, w21
	add	x3, x3, 128
	mov	w1, 809
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	b	.L69
	.p2align 3
.L41:
	mov	x0, x22
	mov	w1, w21
	bl	VCTRL_HandleReleaseMemEvent
	mov	w0, 0
	b	.L69
	.p2align 3
.L39:
	mov	x0, x22
	mov	w1, w21
	bl	VCTRL_HandleAllocMemEvent
	mov	w0, 0
	b	.L69
	.p2align 3
.L44:
	mov	x0, x22
	mov	w1, w21
	bl	VCTRL_HandleAllocPreProcessEvent
	mov	w0, 0
	b	.L69
	.p2align 3
.L48:
	ldp	x3, x2, [x22]
	add	x1, x29, 56
	mov	w0, 9
	stp	x3, x2, [x29, 64]
	bl	VMM_SendCommandBlock
	cbz	w0, .L45
	ldr	x3, .LC28
	mov	w1, 850
	ldr	x2, .LC38
	mov	w0, 1
	ldr	w4, [x29, 56]
	add	x3, x3, 168
	bl	dprint_normal
	mov	w0, 0
	b	.L69
	.p2align 3
.L46:
	ldp	x4, x3, [x22]
	add	x2, x29, 56
	mov	w1, 0
	mov	w0, 2
	stp	x4, x3, [x29, 56]
	bl	VMM_SendCommand
	cbz	w0, .L45
	ldr	x3, .LC28
	mov	w1, 822
	ldr	x2, .LC36
	mov	w0, 1
	add	x3, x3, 128
	bl	dprint_normal
	mov	w0, 0
	b	.L69
	.p2align 3
.L64:
	ldr	x3, .LC28
	mov	w4, 929
	ldr	x5, .LC27
	mov	w1, w4
	ldr	x2, .LC29
	add	x3, x3, 104
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L61
.L65:
	ldr	x3, .LC28
	mov	w4, 930
	ldr	x5, .LC32
	mov	w1, w4
	ldr	x2, .LC29
	add	x3, x3, 104
	bl	dprint_normal
	mov	w0, -1
	b	.L61
.L68:
	ldr	x2, .LC42
	mov	w1, 958
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L61
	.size	VCTRL_EventReport, .-VCTRL_EventReport
	.align	3
.LC27:
	.xword	.LC26
	.align	3
.LC28:
	.xword	.LANCHOR0
	.align	3
.LC29:
	.xword	.LC18
	.align	3
.LC30:
	.xword	.LANCHOR1
	.align	3
.LC32:
	.xword	.LC31
	.align	3
.LC33:
	.xword	.L40
	.align	3
.LC34:
	.xword	.LC1
	.align	3
.LC36:
	.xword	.LC35
	.align	3
.LC38:
	.xword	.LC37
	.align	3
.LC40:
	.xword	.LC39
	.align	3
.LC42:
	.xword	.LC41
	.align	3
.LC44:
	.xword	.LC43
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_SetLastFrameState.part.15, %function
VCTRL_SetLastFrameState.part.15:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w4, 6193
	ldr	x5, .LC45
	ldr	x3, .LC46
	mov	w1, w4
	ldr	x2, .LC47
	mov	w0, 0
	bl	dprint_normal
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_SetLastFrameState.part.15, .-VCTRL_SetLastFrameState.part.15
	.align	3
.LC45:
	.xword	.LC16
	.align	3
.LC46:
	.xword	.LANCHOR2
	.align	3
.LC47:
	.xword	.LC18
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Suspend
	.type	VCTRL_Suspend, %function
VCTRL_Suspend:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC48
	ldr	x0, [x21]
	blr	x0
	ldr	x25, .LC49
	mov	w23, w0
	ldr	x1, [x25]
	cbz	x1, .L72
	mov	w0, 0
	blr	x1
.L74:
	mov	w0, 0
	mov	w20, 32
	mov	w24, 0
	mov	w19, 0
	bl	SCDDRV_PrepareSleep
	mov	w0, 0
	bl	VDMDRV_PrepareSleep
	ldr	x0, [x21]
	blr	x0
	mov	w26, w0
	b	.L73
	.p2align 3
.L75:
	bl	VDMDRV_GetSleepStage
	cmp	w0, 2
	mov	w19, 1
	mov	w22, w19
	beq	.L78
.L109:
	tst	w24, w22
	mov	w0, 10
	bne	.L78
	subs	w20, w20, #1
	beq	.L110
	ldr	x1, [x21, 240]
	blr	x1
	cmp	w19, 1
	ccmp	w24, 1, 0, eq
	beq	.L78
.L73:
	mov	w0, 0
	bl	SCDDRV_GetSleepStage
	cmp	w0, 2
	mov	w0, 0
	beq	.L75
	bl	VDMDRV_GetSleepStage
	cmp	w0, 2
	mov	w22, w19
	bne	.L109
	mov	w24, 1
	b	.L109
	.p2align 3
.L110:
	ldr	x0, [x21]
	blr	x0
	cmp	w26, w0
	sub	w3, w0, w26
	bls	.L81
	mvn	w26, w26
	add	w3, w26, w0
.L81:
	ldr	x2, .LC53
	mov	w5, w24
	mov	w4, w19
	mov	w1, 270
	mov	w0, 0
	bl	dprint_normal
	cbnz	w19, .L96
	ldr	x2, .LC58
	mov	w3, 0
	mov	w1, 276
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	bl	SCDDRV_ForceSleep
.L96:
	cbnz	w24, .L78
	ldr	x2, .LC60
	mov	w3, 0
	mov	w1, 285
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	bl	VDMDRV_ForceSleep
.L78:
	ldr	x1, [x25, 64]
	cbz	x1, .L85
	mov	w0, 0
	blr	x1
.L85:
	ldr	x1, [x25, 48]
	cbz	x1, .L111
	mov	w0, 0
	blr	x1
	ldr	x1, [x25, 16]
	cbz	x1, .L112
.L88:
	mov	w0, 0
	blr	x1
.L89:
	ldr	x20, .LC54
	ldr	w1, [x20, 32]
	cmp	w1, 1
	bne	.L90
	ldr	w1, [x20, 36]
	mov	w2, 2
	str	w2, [x20, 40]
	cmp	w1, 1
	beq	.L92
	ldr	x1, [x21, 240]
	mov	w0, 10
	mov	w19, 49
	blr	x1
	b	.L93
	.p2align 3
.L113:
	ldr	x1, [x21, 240]
	blr	x1
	subs	w19, w19, #1
	beq	.L92
.L93:
	ldr	w1, [x20, 36]
	mov	w0, 10
	cmp	w1, 1
	bne	.L113
.L92:
	str	wzr, [x20, 40]
.L90:
	ldr	x0, [x21]
	blr	x0
	cmp	w23, w0
	sub	w3, w0, w23
	bls	.L95
	mvn	w23, w23
	add	w3, w23, w0
.L95:
	ldr	x2, .LC56
	mov	w1, 363
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L111:
	mov	w3, 320
	ldr	x2, .LC51
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldr	x1, [x25, 16]
	cbnz	x1, .L88
	.p2align 2
.L112:
	mov	w3, 325
	ldr	x2, .LC51
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L89
	.p2align 3
.L72:
	mov	w3, 343
	ldr	x2, .LC51
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L74
	.size	VCTRL_Suspend, .-VCTRL_Suspend
	.align	3
.LC48:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC49:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC51:
	.xword	.LC50
	.align	3
.LC53:
	.xword	.LC52
	.align	3
.LC54:
	.xword	.LANCHOR1
	.align	3
.LC56:
	.xword	.LC55
	.align	3
.LC58:
	.xword	.LC57
	.align	3
.LC60:
	.xword	.LC59
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Resume
	.type	VCTRL_Resume, %function
VCTRL_Resume:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC62
	ldr	x0, [x21]
	blr	x0
	ldr	x19, .LC63
	mov	w22, w0
	ldr	x1, [x19, 8]
	cbz	x1, .L134
	mov	w0, 0
	blr	x1
	ldr	x1, [x19, 40]
	cbz	x1, .L135
.L117:
	mov	w0, 0
	blr	x1
.L118:
	ldr	x1, [x19, 56]
	cbz	x1, .L119
	mov	w0, 0
	blr	x1
.L119:
	mov	w0, 0
	bl	SCDDRV_ExitSleep
	mov	w0, 0
	bl	VDMDRV_ExitSleep
	ldr	x20, .LC65
	ldr	w0, [x20, 32]
	cmp	w0, 1
	bne	.L120
	ldr	w2, [x20, 36]
	str	w0, [x20, 40]
	cmp	w2, 2
	beq	.L122
	ldr	x1, [x21, 240]
	mov	w0, 10
	mov	w19, 49
	blr	x1
	b	.L123
	.p2align 3
.L136:
	ldr	x1, [x21, 240]
	blr	x1
	subs	w19, w19, #1
	beq	.L122
.L123:
	ldr	w1, [x20, 36]
	mov	w0, 10
	cmp	w1, 2
	bne	.L136
.L122:
	str	wzr, [x20, 40]
.L120:
	ldr	x0, [x21]
	blr	x0
	cmp	w22, w0
	sub	w3, w0, w22
	bls	.L125
	mvn	w3, w22
	add	w3, w3, w0
.L125:
	ldr	x2, .LC67
	mov	w1, 426
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L134:
	mov	w3, 383
	ldr	x2, .LC64
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldr	x1, [x19, 40]
	cbnz	x1, .L117
	.p2align 2
.L135:
	mov	w3, 388
	ldr	x2, .LC64
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L118
	.size	VCTRL_Resume, .-VCTRL_Resume
	.align	3
.LC62:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC63:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC64:
	.xword	.LC50
	.align	3
.LC65:
	.xword	.LANCHOR1
	.align	3
.LC67:
	.xword	.LC66
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_RecordData
	.type	VCTRL_RecordData, %function
VCTRL_RecordData:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	uxtw	x19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 1
	bhi	.L142
	ldr	x3, .LC72
	ldrb	w0, [x3, x19]
	cmp	w0, 14
	bhi	.L141
	add	w4, w0, 1
	uxtb	w4, w4
.L140:
	lsl	x2, x19, 4
	ldr	x1, .LC73
	sub	x2, x2, x19
	strb	w4, [x3, x19]
	add	x0, x2, x0, sxtw
	str	w20, [x1, x0, lsl 2]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L141:
	mov	w4, 1
	mov	w0, 0
	b	.L140
	.p2align 3
.L142:
	ldr	x3, .LC69
	mov	w4, 565
	ldr	x2, .LC71
	mov	w5, w19
	add	x3, x3, 24
	mov	w1, w4
	mov	w0, 32
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_RecordData, .-VCTRL_RecordData
	.align	3
.LC69:
	.xword	.LANCHOR2
	.align	3
.LC71:
	.xword	.LC70
	.align	3
.LC72:
	.xword	g_DataRecId
	.align	3
.LC73:
	.xword	g_DataTable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_MMU_ISR
	.type	VCTRL_MMU_ISR, %function
VCTRL_MMU_ISR:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	bl	VDMDRV_MMUIntServeProc
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_MMU_ISR, .-VCTRL_MMU_ISR
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_InformVdmFree
	.type	VCTRL_InformVdmFree, %function
VCTRL_InformVdmFree:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC74
	mov	w0, 0
	ldr	x1, [x1, 256]
	blr	x1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_InformVdmFree, .-VCTRL_InformVdmFree
	.align	3
.LC74:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ExtraWakeUpThread
	.type	VCTRL_ExtraWakeUpThread, %function
VCTRL_ExtraWakeUpThread:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC75
	mov	w0, 0
	ldr	x1, [x1, 256]
	blr	x1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_ExtraWakeUpThread, .-VCTRL_ExtraWakeUpThread
	.align	3
.LC75:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetCallBack
	.type	VCTRL_SetCallBack, %function
VCTRL_SetCallBack:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L154
	cbz	w19, .L150
	cmp	w19, 1
	beq	.L151
	ldr	x3, .LC78
	mov	w4, w19
	ldr	x2, .LC82
	mov	w1, 991
	add	x3, x3, 48
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
.L148:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L151:
	ldr	x1, .LC80
	mov	w0, 0
	str	x20, [x1, 224]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L150:
	ldr	x1, .LC80
	mov	w0, 0
	str	x20, [x1, 216]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L154:
	ldr	x3, .LC78
	mov	w4, 978
	ldr	x5, .LC77
	mov	w1, w4
	ldr	x2, .LC79
	add	x3, x3, 48
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L148
	.size	VCTRL_SetCallBack, .-VCTRL_SetCallBack
	.align	3
.LC77:
	.xword	.LC76
	.align	3
.LC78:
	.xword	.LANCHOR2
	.align	3
.LC79:
	.xword	.LC18
	.align	3
.LC80:
	.xword	.LANCHOR1
	.align	3
.LC82:
	.xword	.LC81
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_InitChanCtx
	.type	VCTRL_InitChanCtx, %function
VCTRL_InitChanCtx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC84
	ldr	x0, .LC83
	mov	x2, 48
	mov	w1, 0
	ldr	x3, [x0, 96]
	mov	x0, x19
	blr	x3
	mov	w0, -1
	stp	w0, w0, [x19, 16]
	stp	w0, w0, [x19, 24]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_InitChanCtx, .-VCTRL_InitChanCtx
	.align	3
.LC83:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC84:
	.xword	g_ChanCtx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetStreamInterface
	.type	VCTRL_SetStreamInterface, %function
VCTRL_SetStreamInterface:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L162
	ldr	x0, .LC88
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L163
	cbz	x20, .L164
	ldr	x3, .LC92
	add	x0, x0, 24576
	mov	x2, 24
	mov	x1, x20
	add	x0, x0, 2264
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L158:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L162:
	ldr	x3, .LC86
	mov	w4, 1154
	ldr	x5, .LC85
.L161:
	ldr	x2, .LC87
	add	x3, x3, 72
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L158
.L164:
	ldr	x3, .LC86
	mov	w4, 1156
	ldr	x5, .LC91
	b	.L161
.L163:
	ldr	x3, .LC86
	mov	w4, 1155
	ldr	x5, .LC89
	mov	w1, w4
	ldr	x2, .LC87
	add	x3, x3, 72
	bl	dprint_normal
	mov	w0, -1
	b	.L158
	.size	VCTRL_SetStreamInterface, .-VCTRL_SetStreamInterface
	.align	3
.LC85:
	.xword	.LC16
	.align	3
.LC86:
	.xword	.LANCHOR2
	.align	3
.LC87:
	.xword	.LC18
	.align	3
.LC88:
	.xword	.LANCHOR1
	.align	3
.LC89:
	.xword	.LC31
	.align	3
.LC91:
	.xword	.LC90
	.align	3
.LC92:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetStreamInterface
	.type	VCTRL_GetStreamInterface, %function
VCTRL_GetStreamInterface:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L168
	ldr	x0, .LC93
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L168
	add	x0, x0, 24576
	ldr	x19, [sp, 16]
	add	x0, x0, 2264
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L168:
	mov	x0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetStreamInterface, .-VCTRL_GetStreamInterface
	.align	3
.LC93:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetDeiMemQueryInterface
	.type	VCTRL_SetDeiMemQueryInterface, %function
VCTRL_SetDeiMemQueryInterface:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L175
	ldr	x0, .LC97
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L176
	cbz	x20, .L177
	ldr	x3, .LC101
	add	x0, x0, 24576
	mov	x2, 16
	mov	x1, x20
	add	x0, x0, 2320
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L171:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L175:
	ldr	x3, .LC95
	mov	w4, 1176
	ldr	x5, .LC94
.L174:
	ldr	x2, .LC96
	add	x3, x3, 104
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L171
.L177:
	ldr	x3, .LC95
	mov	w4, 1178
	ldr	x5, .LC100
	b	.L174
.L176:
	ldr	x3, .LC95
	mov	w4, 1177
	ldr	x5, .LC98
	mov	w1, w4
	ldr	x2, .LC96
	add	x3, x3, 104
	bl	dprint_normal
	mov	w0, -1
	b	.L171
	.size	VCTRL_SetDeiMemQueryInterface, .-VCTRL_SetDeiMemQueryInterface
	.align	3
.LC94:
	.xword	.LC16
	.align	3
.LC95:
	.xword	.LANCHOR2
	.align	3
.LC96:
	.xword	.LC18
	.align	3
.LC97:
	.xword	.LANCHOR1
	.align	3
.LC98:
	.xword	.LC31
	.align	3
.LC100:
	.xword	.LC99
	.align	3
.LC101:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanMemInfo
	.type	VCTRL_GetChanMemInfo, %function
VCTRL_GetChanMemInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	mov	x1, x20
	mov	w0, w19
	bl	FSP_GetMemInfo
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetChanMemInfo, .-VCTRL_GetChanMemInfo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetStreamSize
	.type	VCTRL_GetStreamSize, %function
VCTRL_GetStreamSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L185
	ldr	x0, .LC105
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L186
	ldr	w2, [x0, 16]
	cmp	w2, 1
	bne	.L187
	mov	x2, 10648
	mov	x1, x20
	movk	x2, 0x1, lsl 16
	add	x0, x0, x2
	bl	GetSegStreamSize
.L181:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L187:
	ldr	x3, .LC103
	mov	w4, 1197
	ldr	x5, .LC108
.L184:
	ldr	x2, .LC104
	add	x3, x3, 136
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L185:
	ldr	x3, .LC103
	mov	w4, 1195
	ldr	x5, .LC102
	b	.L184
.L186:
	ldr	x3, .LC103
	mov	w4, 1196
	ldr	x5, .LC106
	mov	w1, w4
	ldr	x2, .LC104
	add	x3, x3, 136
	bl	dprint_normal
	mov	w0, -1
	b	.L181
	.size	VCTRL_GetStreamSize, .-VCTRL_GetStreamSize
	.align	3
.LC102:
	.xword	.LC16
	.align	3
.LC103:
	.xword	.LANCHOR2
	.align	3
.LC104:
	.xword	.LC18
	.align	3
.LC105:
	.xword	.LANCHOR1
	.align	3
.LC106:
	.xword	.LC31
	.align	3
.LC108:
	.xword	.LC107
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CheckFreshRaw
	.type	VCTRL_CheckFreshRaw, %function
VCTRL_CheckFreshRaw:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	stp	wzr, wzr, [x29, 40]
	bhi	.L197
	ldr	x0, .LC112
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L198
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L199
	add	x0, x0, 24576
	add	x1, x29, 40
	add	x19, x0, 2432
	mov	x0, x19
	bl	GetRawStreamNum
	cbnz	w0, .L196
	add	x1, x29, 44
	mov	x0, x19
	bl	GetRawStreamSize
	cbnz	w0, .L196
	ldr	x2, .LC117
	mov	w1, 1218
	ldp	w3, w4, [x29, 40]
	mov	w0, 20
	bl	dprint_normal
	ldr	w0, [x29, 40]
	cmp	w0, wzr
	ble	.L196
	ldr	w0, [x29, 44]
	cmp	w0, 3
	csetm	w0, le
.L190:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L199:
	ldr	x3, .LC110
	mov	w4, 1211
	ldr	x5, .LC115
.L195:
	ldr	x2, .LC111
	add	x3, x3, 160
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L196:
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L197:
	ldr	x3, .LC110
	mov	w4, 1209
	ldr	x5, .LC109
	b	.L195
.L198:
	ldr	x3, .LC110
	mov	w4, 1210
	ldr	x5, .LC114
	mov	w1, w4
	ldr	x2, .LC111
	add	x3, x3, 160
	bl	dprint_normal
	mov	w0, -1
	b	.L190
	.size	VCTRL_CheckFreshRaw, .-VCTRL_CheckFreshRaw
	.align	3
.LC109:
	.xword	.LC16
	.align	3
.LC110:
	.xword	.LANCHOR2
	.align	3
.LC111:
	.xword	.LC18
	.align	3
.LC112:
	.xword	.LANCHOR1
	.align	3
.LC114:
	.xword	.LC113
	.align	3
.LC115:
	.xword	.LC107
	.align	3
.LC117:
	.xword	.LC116
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CheckFreshSeg
	.type	VCTRL_CheckFreshSeg, %function
VCTRL_CheckFreshSeg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	stp	wzr, wzr, [x29, 40]
	bhi	.L206
	ldr	x0, .LC121
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L207
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L208
	mov	x3, 10648
	add	x2, x29, 44
	movk	x3, 0x1, lsl 16
	add	x1, x29, 40
	add	x0, x0, x3
	bl	GetFreshSegStream
	ldr	x2, .LC125
	mov	w1, 1241
	ldp	w3, w4, [x29, 40]
	mov	w0, 20
	bl	dprint_normal
	ldr	w0, [x29, 40]
	cmp	w0, wzr
	csetm	w0, le
.L202:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L208:
	ldr	x3, .LC119
	mov	w4, 1236
	ldr	x5, .LC123
.L205:
	ldr	x2, .LC120
	add	x3, x3, 184
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L206:
	ldr	x3, .LC119
	mov	w4, 1234
	ldr	x5, .LC118
	b	.L205
.L207:
	ldr	x3, .LC119
	mov	w4, 1235
	ldr	x5, .LC122
	mov	w1, w4
	ldr	x2, .LC120
	add	x3, x3, 184
	bl	dprint_normal
	mov	w0, -1
	b	.L202
	.size	VCTRL_CheckFreshSeg, .-VCTRL_CheckFreshSeg
	.align	3
.LC118:
	.xword	.LC16
	.align	3
.LC119:
	.xword	.LANCHOR2
	.align	3
.LC120:
	.xword	.LC18
	.align	3
.LC121:
	.xword	.LANCHOR1
	.align	3
.LC122:
	.xword	.LC113
	.align	3
.LC123:
	.xword	.LC107
	.align	3
.LC125:
	.xword	.LC124
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetDiscardPicParam
	.type	VCTRL_SetDiscardPicParam, %function
VCTRL_SetDiscardPicParam:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L216
	ldr	x21, .LC129
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L217
	cbz	x20, .L218
	ldr	x3, .LC133
	add	x0, x0, 221184
	mov	x1, x20
	mov	x2, 8
	add	x0, x0, 72
	ldr	x3, [x3, 104]
	blr	x3
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 221184
	ldr	w1, [x0, 72]
	sub	w1, w1, #1
	cmp	w1, 1
	bls	.L214
	str	wzr, [x0, 72]
	mov	w0, 0
.L211:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L214:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L216:
	ldr	x3, .LC127
	mov	w4, 1253
	ldr	x5, .LC126
.L215:
	ldr	x2, .LC128
	add	x3, x3, 208
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L211
.L218:
	ldr	x3, .LC127
	mov	w4, 1255
	ldr	x5, .LC132
	b	.L215
.L217:
	ldr	x3, .LC127
	mov	w4, 1254
	ldr	x5, .LC130
	mov	w1, w4
	ldr	x2, .LC128
	add	x3, x3, 208
	bl	dprint_normal
	mov	w0, -1
	b	.L211
	.size	VCTRL_SetDiscardPicParam, .-VCTRL_SetDiscardPicParam
	.align	3
.LC126:
	.xword	.LC16
	.align	3
.LC127:
	.xword	.LANCHOR2
	.align	3
.LC128:
	.xword	.LC18
	.align	3
.LC129:
	.xword	.LANCHOR1
	.align	3
.LC130:
	.xword	.LC31
	.align	3
.LC132:
	.xword	.LC131
	.align	3
.LC133:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_UnInstallChan
	.type	VCTRL_UnInstallChan, %function
VCTRL_UnInstallChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, w19
	bl	FSP_DisableInstance
	mov	w0, w19
	bl	CloseUsdPool_WithMem
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_UnInstallChan, .-VCTRL_UnInstallChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_FreeChanResource
	.type	VCTRL_FreeChanResource, %function
VCTRL_FreeChanResource:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L238
	ldr	x20, [x19, 16]
	cbz	x20, .L239
	ldr	w0, [x20, 16]
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	bl	MEM_DelMemRecord
	ldr	w0, [x19]
	cmp	w0, 1
	beq	.L240
.L224:
	ldr	x20, [x19, 24]
	cbz	x20, .L241
.L225:
	ldr	w0, [x20, 16]
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	bl	MEM_DelMemRecord
	ldr	w0, [x19, 4]
	cmp	w0, 1
	beq	.L242
.L226:
	ldr	x20, [x19, 32]
	cbz	x20, .L243
.L227:
	ldr	w0, [x20, 16]
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	bl	MEM_DelMemRecord
	ldr	w0, [x19, 8]
	cmp	w0, 1
	beq	.L244
.L228:
	ldr	x1, .LC143
	ldr	x0, [x20, 8]
	ldr	x1, [x1, 328]
	blr	x1
	mov	w0, 0
.L222:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L244:
	ldr	w0, [x20, 16]
	cbz	w0, .L228
	ldr	x1, [x20, 8]
	bl	MEM_ReleaseMemBlock
	mov	w0, 0
	b	.L222
	.p2align 3
.L242:
	ldr	w0, [x20, 16]
	cbz	w0, .L226
	ldr	x1, [x20, 8]
	bl	MEM_ReleaseMemBlock
	ldr	x20, [x19, 32]
	cbnz	x20, .L227
.L243:
	ldr	x3, .LC134
	mov	w1, 1566
	ldr	x2, .LC142
	mov	w0, 0
	add	x3, x3, 312
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L240:
	ldr	w0, [x20, 16]
	cbz	w0, .L224
	ldr	x1, [x20, 8]
	bl	MEM_ReleaseMemBlock
	ldr	x20, [x19, 24]
	cbnz	x20, .L225
	.p2align 2
.L241:
	ldr	x3, .LC134
	mov	w1, 1544
	ldr	x2, .LC140
	mov	w0, 0
	add	x3, x3, 288
	bl	dprint_normal
	b	.L226
	.p2align 3
.L239:
	ldr	x3, .LC134
	mov	w1, 1522
	ldr	x2, .LC138
	mov	w0, 0
	add	x3, x3, 264
	bl	dprint_normal
	b	.L224
.L238:
	ldr	x3, .LC134
	mov	w1, 1588
	ldr	x2, .LC136
	mov	w0, 0
	add	x3, x3, 240
	bl	dprint_normal
	mov	w0, -1
	b	.L222
	.size	VCTRL_FreeChanResource, .-VCTRL_FreeChanResource
	.align	3
.LC134:
	.xword	.LANCHOR2
	.align	3
.LC136:
	.xword	.LC135
	.align	3
.LC138:
	.xword	.LC137
	.align	3
.LC140:
	.xword	.LC139
	.align	3
.LC142:
	.xword	.LC141
	.align	3
.LC143:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanCtxSize
	.type	VCTRL_GetChanCtxSize, %function
VCTRL_GetChanCtxSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	mov	w0, 51600
	movk	w0, 0x7, lsl 16
	str	w0, [x19]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetChanCtxSize, .-VCTRL_GetChanCtxSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanHalSize
	.type	VCTRL_GetChanHalSize, %function
VCTRL_GetChanHalSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	str	wzr, [x19]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetChanHalSize, .-VCTRL_GetChanHalSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanCfg
	.type	VCTRL_GetChanCfg, %function
VCTRL_GetChanCfg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L253
	ldr	x0, .LC147
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L254
	cbz	x20, .L255
	ldr	x3, .LC151
	add	x1, x1, 217088
	mov	x2, 156
	add	x1, x1, 3072
	mov	x0, x20
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L249:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L253:
	ldr	x3, .LC145
	mov	w4, 2387
	ldr	x5, .LC144
.L252:
	ldr	x2, .LC146
	add	x3, x3, 336
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L249
.L255:
	ldr	x3, .LC145
	mov	w4, 2389
	ldr	x5, .LC150
	b	.L252
.L254:
	ldr	x3, .LC145
	mov	w4, 2388
	ldr	x5, .LC148
	b	.L252
	.size	VCTRL_GetChanCfg, .-VCTRL_GetChanCfg
	.align	3
.LC144:
	.xword	.LC16
	.align	3
.LC145:
	.xword	.LANCHOR2
	.align	3
.LC146:
	.xword	.LC18
	.align	3
.LC147:
	.xword	.LANCHOR1
	.align	3
.LC148:
	.xword	.LC31
	.align	3
.LC150:
	.xword	.LC149
	.align	3
.LC151:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CheckCommonParameter
	.type	VCTRL_CheckCommonParameter, %function
VCTRL_CheckCommonParameter:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x0, .LC152
	ldr	w1, [x19, 8]
	ldr	x0, [x0, w20, sxtw 3]
	add	x0, x0, 217088
	ldr	w2, [x0, 3080]
	cmp	w2, w1
	bne	.L269
	ldr	w2, [x0, 3100]
	ldr	w1, [x19, 28]
	cmp	w2, w1
	bne	.L269
	ldr	w2, [x0, 3096]
	ldr	w1, [x19, 24]
	cmp	w2, w1
	bne	.L269
	ldr	w2, [x0, 3104]
	ldr	w1, [x19, 32]
	cmp	w2, w1
	bne	.L269
	ldr	w2, [x0, 3108]
	ldr	w1, [x19, 36]
	cmp	w2, w1
	bne	.L269
	ldr	w2, [x0, 3112]
	ldr	w1, [x19, 40]
	cmp	w2, w1
	bne	.L269
	ldr	w2, [x0, 3128]
	ldr	w1, [x19, 56]
	cmp	w2, w1
	bne	.L269
	ldr	w2, [x0, 3212]
	ldr	w1, [x19, 140]
	cmp	w2, w1
	bne	.L269
	ldr	w2, [x0, 3140]
	ldr	w1, [x19, 68]
	cmp	w2, w1
	bne	.L269
	ldr	w2, [x0, 3136]
	ldr	w1, [x19, 64]
	cmp	w2, w1
	bne	.L269
	ldr	w2, [x0, 3132]
	ldr	w1, [x19, 60]
	cmp	w2, w1
	bne	.L269
	ldr	w2, [x0, 3144]
	ldr	w1, [x19, 72]
	cmp	w2, w1
	bne	.L269
	ldr	w1, [x0, 3204]
	ldr	w0, [x19, 132]
	ldp	x19, x20, [sp, 16]
	cmp	w1, w0
	csetm	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L269:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_CheckCommonParameter, .-VCTRL_CheckCommonParameter
	.align	3
.LC152:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CmpConfigParameter
	.type	VCTRL_CmpConfigParameter, %function
VCTRL_CmpConfigParameter:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x0, .LC153
	ldr	x19, [x0, w20, sxtw 3]
	ldr	w0, [x19, 128]
	cmp	w0, 22
	beq	.L275
	mov	x1, x21
	mov	w0, w20
	bl	VCTRL_CheckCommonParameter
	cbnz	w0, .L275
	add	x19, x19, 217088
	ldr	w1, [x19, 3080]
	cmp	w1, 1
	beq	.L276
	sub	w1, w1, #10
	cmp	w1, 2
	bhi	.L271
	ldr	w0, [x21, 12]
	ldr	w1, [x19, 3084]
	cmp	w1, w0
	csetm	w0, ne
.L271:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L276:
	ldr	w1, [x19, 3084]
	ldr	w0, [x21, 12]
	cmp	w1, w0
	bne	.L275
	ldr	w0, [x21, 16]
	ldr	w1, [x19, 3088]
	ldr	x21, [sp, 32]
	cmp	w1, w0
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L275:
	mov	w0, -1
	b	.L271
	.size	VCTRL_CmpConfigParameter, .-VCTRL_CmpConfigParameter
	.align	3
.LC153:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ConfigChanCompress
	.type	VCTRL_ConfigChanCompress, %function
VCTRL_ConfigChanCompress:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, .LC154
	mov	w2, -1
	ldr	w3, [x20, 56]
	ldr	x0, [x0, w19, sxtw 3]
	add	x0, x0, 217088
	str	w3, [x0, 3128]
	str	wzr, [x0, 3904]
	str	w2, [x0, 3908]
	str	w2, [x0, 3912]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_ConfigChanCompress, .-VCTRL_ConfigChanCompress
	.align	3
.LC154:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ConfigChanMaxWH
	.type	VCTRL_ConfigChanMaxWH, %function
VCTRL_ConfigChanMaxWH:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 104]
	cmp	w0, wzr
	ble	.L279
	ldr	w1, [x19, 108]
	cmp	w1, wzr
	ble	.L279
	ldr	x1, .LC155
	ldr	x1, [x1, w20, sxtw 3]
	add	x1, x1, 217088
	str	w0, [x1, 3176]
	ldr	w0, [x19, 108]
	str	w0, [x1, 3180]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L279:
	ldr	x0, .LC155
	mov	w2, 1920
	mov	w1, 1088
	ldr	x0, [x0, w20, sxtw 3]
	add	x0, x0, 217088
	str	w2, [x0, 3176]
	str	w1, [x0, 3180]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_ConfigChanMaxWH, .-VCTRL_ConfigChanMaxWH
	.align	3
.LC155:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SeekPts
	.type	VCTRL_SeekPts, %function
VCTRL_SeekPts:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L287
	ldr	x0, .LC159
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L288
	add	x1, x1, 128
	mov	w0, 3
	bl	PDT_GetAttribute
	cbnz	w0, .L285
	mov	x1, x20
	mov	w0, w19
	bl	SM_SeekPts
	cmp	w0, wzr
	csetm	w0, ne
.L283:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L285:
	mov	w0, -1
	b	.L283
	.p2align 3
.L287:
	ldr	x3, .LC157
	mov	w4, 2758
	ldr	x5, .LC156
.L286:
	ldr	x2, .LC158
	add	x3, x3, 360
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L283
.L288:
	ldr	x3, .LC157
	mov	w4, 2759
	ldr	x5, .LC161
	b	.L286
	.size	VCTRL_SeekPts, .-VCTRL_SeekPts
	.align	3
.LC156:
	.xword	.LC16
	.align	3
.LC157:
	.xword	.LANCHOR2
	.align	3
.LC158:
	.xword	.LC18
	.align	3
.LC159:
	.xword	.LANCHOR1
	.align	3
.LC161:
	.xword	.LC160
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_InitSyntaxCtx
	.type	VCTRL_InitSyntaxCtx, %function
VCTRL_InitSyntaxCtx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC162
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L296
	ldr	w1, [x0, 128]
	cmp	w1, 2
	beq	.L292
	cmp	w1, 3
	beq	.L293
	cbnz	w1, .L289
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	H264DEC_Init
.L289:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L293:
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	MPEG2DEC_Init
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L292:
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	MPEG4DEC_Init
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L296:
	ldr	x3, .LC164
	mov	w4, 2780
	ldr	x5, .LC163
	mov	w1, w4
	ldr	x2, .LC165
	add	x3, x3, 376
	bl	dprint_normal
	b	.L289
	.size	VCTRL_InitSyntaxCtx, .-VCTRL_InitSyntaxCtx
	.align	3
.LC162:
	.xword	.LANCHOR1
	.align	3
.LC163:
	.xword	.LC31
	.align	3
.LC164:
	.xword	.LANCHOR2
	.align	3
.LC165:
	.xword	.LC18
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ReleaseStream
	.type	VCTRL_ReleaseStream, %function
VCTRL_ReleaseStream:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L301
	ldr	x0, .LC170
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L302
	mov	w0, w19
	bl	SM_Reset
	cmp	w0, wzr
	csetm	w0, ne
.L299:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L301:
	ldr	x3, .LC168
	mov	w4, 2895
	ldr	x5, .LC167
	mov	w1, w4
	ldr	x2, .LC169
	add	x3, x3, 400
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L299
.L302:
	ldr	x3, .LC168
	mov	w4, 2896
	ldr	x5, .LC172
	mov	w1, w4
	ldr	x2, .LC169
	add	x3, x3, 400
	bl	dprint_normal
	mov	w0, -1
	b	.L299
	.size	VCTRL_ReleaseStream, .-VCTRL_ReleaseStream
	.align	3
.LC167:
	.xword	.LC166
	.align	3
.LC168:
	.xword	.LANCHOR2
	.align	3
.LC169:
	.xword	.LC18
	.align	3
.LC170:
	.xword	.LANCHOR1
	.align	3
.LC172:
	.xword	.LC171
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanUniqueID
	.type	VCTRL_GetChanUniqueID, %function
VCTRL_GetChanUniqueID:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L306
	ldr	x0, .LC173
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L306
	ldr	x0, [x0, 8]
.L304:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L306:
	mov	x0, -1
	b	.L304
	.size	VCTRL_GetChanUniqueID, .-VCTRL_GetChanUniqueID
	.align	3
.LC173:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanImage
	.type	VCTRL_GetChanImage, %function
VCTRL_GetChanImage:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	sxtw	x19, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L324
	ldr	x20, .LC177
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L325
	ldr	w0, [x0, 16]
	cmp	w0, 1
	bne	.L326
	cbz	x21, .L327
	ldr	x22, .LC183
	mov	w0, 4
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L313
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L313
	add	x0, x0, 221184
	mov	x1, x21
	add	x0, x0, 112
	bl	SYNTAX_ReceiveImage
	mov	w23, w0
	mov	w0, 9
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L328
.L316:
	cmp	w23, 1
	beq	.L329
.L318:
	ldr	x1, [x22, 32]
	mov	w0, 4
	blr	x1
	cmp	w23, 1
	csetm	w0, ne
.L309:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L328:
	ldr	x0, [x22]
	blr	x0
	mov	w4, w0
	add	x3, x20, 248
	ldr	x1, .LC184
	ldr	w0, [x3, w19, sxtw 2]
	ldr	w1, [x1]
	sub	w0, w4, w0
	cmp	w0, w1
	bls	.L316
	lsl	w2, w19, 24
	ldr	x0, .LC175
	cmp	w23, 1
	add	w2, w2, 589824
	csinc	w2, w2, w2, ne
	mov	w1, 3197
	add	x0, x0, 448
	str	w4, [x3, w19, sxtw 2]
	bl	DBG_AddTrace
	b	.L316
	.p2align 3
.L329:
	ldr	x2, [x20, w19, sxtw 3]
	lsl	x0, x19, 2
	sub	x0, x0, x19
	ldr	w4, [x21, 156]
	add	x3, x2, 24576
	lsl	x1, x0, 5
	add	x0, x0, x1
	add	x20, x20, 264
	add	x19, x0, x19
	str	w4, [x3, 2336]
	add	x19, x20, x19
	ldr	w0, [x21, 152]
	str	w0, [x2, 136]
	ldr	w0, [x19, 36]
	cbz	w0, .L330
.L319:
	ldr	x3, .LC175
	mov	w4, 3211
	ldr	x2, .LC186
	mov	w1, w4
	ldr	w7, [x21, 88]
	add	x3, x3, 424
	ldr	w6, [x21, 276]
	mov	w0, 26
	ldr	w5, [x21, 444]
	bl	dprint_normal
	b	.L318
	.p2align 3
.L330:
	ldr	x0, [x22]
	blr	x0
	str	w0, [x19, 36]
	b	.L319
	.p2align 3
.L313:
	ldr	x1, [x22, 32]
	mov	w0, 4
	blr	x1
	ldr	x23, [sp, 48]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L326:
	ldr	x3, .LC175
	mov	w4, 3156
	ldr	x5, .LC180
.L323:
	ldr	x2, .LC176
	add	x3, x3, 424
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L309
	.p2align 3
.L324:
	ldr	x3, .LC175
	mov	w4, 3154
	ldr	x5, .LC174
	b	.L323
.L327:
	ldr	x3, .LC175
	mov	w4, 3157
	ldr	x5, .LC182
	b	.L323
.L325:
	ldr	x3, .LC175
	mov	w4, 3155
	ldr	x5, .LC178
	mov	w1, w4
	ldr	x2, .LC176
	add	x3, x3, 424
	bl	dprint_normal
	mov	w0, -1
	b	.L309
	.size	VCTRL_GetChanImage, .-VCTRL_GetChanImage
	.align	3
.LC174:
	.xword	.LC16
	.align	3
.LC175:
	.xword	.LANCHOR2
	.align	3
.LC176:
	.xword	.LC18
	.align	3
.LC177:
	.xword	.LANCHOR1
	.align	3
.LC178:
	.xword	.LC31
	.align	3
.LC180:
	.xword	.LC179
	.align	3
.LC182:
	.xword	.LC181
	.align	3
.LC183:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC184:
	.xword	g_TraceImgPeriod
	.align	3
.LC186:
	.xword	.LC185
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ReleaseChanImage
	.type	VCTRL_ReleaseChanImage, %function
VCTRL_ReleaseChanImage:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L348
	ldr	x21, .LC192
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L349
	ldr	w0, [x0, 16]
	cmp	w0, 1
	bne	.L350
	cbz	x20, .L351
	ldr	x22, .LC196
	mov	w0, 4
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L352
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L353
	add	x0, x0, 221184
	mov	x1, x20
	add	x0, x0, 112
	bl	SYNTAX_ReleaseImage
	mov	w23, w0
	mov	w0, 10
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L354
.L346:
	ldr	x24, .LC190
.L340:
	cmp	w23, 1
	beq	.L342
	mov	w4, 3282
	ldr	x2, .LC203
	ldr	w5, [x20, 444]
	mov	w1, w4
	add	x3, x24, 472
	mov	w0, 26
	bl	dprint_normal
	mov	x1, x20
	mov	w0, w19
	bl	FSP_UnMarkImageOutHanging
.L343:
	ldr	x1, [x22, 32]
	mov	w0, 4
	blr	x1
	cmp	w23, 1
	csetm	w0, ne
.L333:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L354:
	ldr	x0, [x22]
	add	x21, x21, 664
	blr	x0
	mov	w3, w0
	ldr	x1, .LC201
	ldr	w0, [x21, w19, sxtw 2]
	ldr	w1, [x1]
	sub	w0, w3, w0
	cmp	w0, w1
	bls	.L346
	lsl	w2, w19, 24
	ldr	x24, .LC190
	cmp	w23, 1
	add	w2, w2, 655360
	csinc	w2, w2, w2, ne
	mov	w1, 3275
	add	x0, x24, 496
	str	w3, [x21, w19, sxtw 2]
	bl	DBG_AddTrace
	b	.L340
	.p2align 3
.L342:
	mov	w4, 3287
	ldr	x2, .LC205
	ldr	w6, [x20, 88]
	add	x3, x24, 472
	ldr	w5, [x20, 444]
	mov	w1, w4
	mov	w0, 26
	bl	dprint_normal
	b	.L343
	.p2align 3
.L353:
	ldr	x1, [x22, 32]
	mov	w0, 4
	blr	x1
	mov	w3, 3243
	ldr	x2, .LC200
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L333
	.p2align 3
.L350:
	ldr	x3, .LC190
	mov	w4, 3227
	ldr	x5, .LC194
.L347:
	ldr	x2, .LC191
	add	x3, x3, 472
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L333
	.p2align 3
.L348:
	ldr	x3, .LC190
	mov	w4, 3225
	ldr	x5, .LC189
	b	.L347
.L351:
	ldr	x3, .LC190
	mov	w4, 3228
	ldr	x5, .LC195
	b	.L347
.L349:
	ldr	x3, .LC190
	mov	w4, 3226
	ldr	x5, .LC193
	mov	w1, w4
	ldr	x2, .LC191
	add	x3, x3, 472
	bl	dprint_normal
	mov	w0, -1
	b	.L333
.L352:
	ldr	x1, [x22, 32]
	mov	w0, 4
	blr	x1
	mov	w3, 3235
	ldr	x2, .LC198
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L333
	.size	VCTRL_ReleaseChanImage, .-VCTRL_ReleaseChanImage
	.align	3
.LC189:
	.xword	.LC16
	.align	3
.LC190:
	.xword	.LANCHOR2
	.align	3
.LC191:
	.xword	.LC18
	.align	3
.LC192:
	.xword	.LANCHOR1
	.align	3
.LC193:
	.xword	.LC31
	.align	3
.LC194:
	.xword	.LC179
	.align	3
.LC195:
	.xword	.LC181
	.align	3
.LC196:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC198:
	.xword	.LC197
	.align	3
.LC200:
	.xword	.LC199
	.align	3
.LC201:
	.xword	g_TraceImgPeriod
	.align	3
.LC203:
	.xword	.LC202
	.align	3
.LC205:
	.xword	.LC204
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetVidStd
	.type	VCTRL_GetVidStd, %function
VCTRL_GetVidStd:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L356
	ldr	x0, .LC207
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L356
	ldr	w1, [x0, 16]
	cmp	w1, 1
	beq	.L359
	mov	w3, 3307
	ldr	x2, .LC211
	mov	w4, w19
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, 22
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L356:
	mov	w3, 3301
	ldr	x2, .LC209
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, 22
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L359:
	ldr	w0, [x0, 128]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetVidStd, .-VCTRL_GetVidStd
	.align	3
.LC207:
	.xword	.LANCHOR1
	.align	3
.LC209:
	.xword	.LC208
	.align	3
.LC211:
	.xword	.LC210
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetHDRConfigInfo
	.type	VCTRL_GetHDRConfigInfo, %function
VCTRL_GetHDRConfigInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 3
	bhi	.L366
	ldr	x0, .LC215
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L367
	cbz	x19, .L368
	add	x0, x0, 217088
	ldrb	w1, [x0, 3072]
	strb	w1, [x19, 65]
	ldrb	w1, [x0, 3074]
	strb	w1, [x19, 66]
	ldr	w1, [x0, 3184]
	str	w1, [x19, 76]
	ldr	w1, [x0, 3188]
	str	w1, [x19, 68]
	ldr	w0, [x0, 3192]
	str	w0, [x19, 72]
.L360:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L366:
	ldr	x3, .LC213
	mov	w4, 3316
	ldr	x5, .LC212
.L365:
	ldr	x2, .LC214
	add	x3, x3, 520
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L367:
	ldr	x3, .LC213
	mov	w4, 3317
	ldr	x5, .LC216
	mov	w1, w4
	ldr	x2, .LC214
	add	x3, x3, 520
	bl	dprint_normal
	b	.L360
	.p2align 3
.L368:
	ldr	x3, .LC213
	mov	w4, 3318
	ldr	x5, .LC218
	b	.L365
	.size	VCTRL_GetHDRConfigInfo, .-VCTRL_GetHDRConfigInfo
	.align	3
.LC212:
	.xword	.LC16
	.align	3
.LC213:
	.xword	.LANCHOR2
	.align	3
.LC214:
	.xword	.LC18
	.align	3
.LC215:
	.xword	.LANCHOR1
	.align	3
.LC216:
	.xword	.LC31
	.align	3
.LC218:
	.xword	.LC217
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetDecParam
	.type	VCTRL_GetDecParam, %function
VCTRL_GetDecParam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L377
	ldr	x0, .LC219
	ldr	x19, [x0, w19, sxtw 3]
	cbz	x19, .L377
	ldr	x1, [x19, 16]
	mov	x0, 4294967297
	mov	x20, 0
	cmp	x1, x0
	bne	.L370
	ldr	w4, [x19, 128]
	cmp	w4, 2
	beq	.L372
	cmp	w4, 3
	beq	.L373
	cbz	w4, .L382
	ldr	x3, .LC220
	mov	w1, 3461
	ldr	x2, .LC222
	mov	w0, 0
	add	x3, x3, 544
	bl	dprint_normal
	mov	x0, x20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L377:
	mov	x20, 0
.L370:
	mov	x0, x20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L372:
	add	x0, x19, 221184
	ldr	x0, [x0, 1160]
.L375:
	mov	x20, 0
	cbz	x0, .L370
	ldr	x1, .LC223
	mov	x20, x0
	ldr	x0, [x1]
	blr	x0
	str	w0, [x19, 40]
	mov	x0, x20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L382:
	add	x0, x19, 221184
	ldr	x0, [x0, 736]
	b	.L375
	.p2align 3
.L373:
	add	x0, x19, 221184
	ldr	x0, [x0, 160]
	b	.L375
	.size	VCTRL_GetDecParam, .-VCTRL_GetDecParam
	.align	3
.LC219:
	.xword	.LANCHOR1
	.align	3
.LC220:
	.xword	.LANCHOR2
	.align	3
.LC222:
	.xword	.LC221
	.align	3
.LC223:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IsSedOnlyMode
	.type	VCTRL_IsSedOnlyMode, %function
VCTRL_IsSedOnlyMode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L389
	mov	w0, 0
	cbnz	w20, .L385
	ldrb	w0, [x19, 940]
.L385:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L389:
	ldr	x2, .LC225
	mov	w1, 3480
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	b	.L385
	.size	VCTRL_IsSedOnlyMode, .-VCTRL_IsSedOnlyMode
	.align	3
.LC225:
	.xword	.LC224
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ChanDecparamInValidFlag
	.type	VCTRL_ChanDecparamInValidFlag, %function
VCTRL_ChanDecparamInValidFlag:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L391
	ldr	x21, .LC226
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L391
	ldr	x1, [x0, 16]
	mov	x0, 4294967297
	cmp	x1, x0
	beq	.L394
	ldr	x2, .LC230
	mov	w3, w19
	mov	w1, 3519
	mov	w0, 20
	mov	w20, 0
	bl	dprint_normal
.L393:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L394:
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbz	x0, .L399
	ldr	x0, [x21, w19, sxtw 3]
	mov	w20, 0
	stp	wzr, wzr, [x0, 108]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L391:
	mov	w3, 3513
	ldr	x2, .LC228
	mov	w4, w19
	mov	w1, w3
	mov	w0, 20
	mov	w20, 0
	bl	dprint_normal
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L399:
	ldr	x22, [x21, w19, sxtw 3]
	ldr	x0, .LC231
	ldr	w20, [x22, 108]
	cbz	w20, .L400
	ldr	x0, [x0]
	blr	x0
	ldr	x1, [x21, w19, sxtw 3]
	ldr	w2, [x1, 112]
	cmp	w0, w2
	bls	.L397
	sub	w0, w0, w2
	mov	w20, 0
	cmp	w0, 40
	bls	.L393
.L397:
	mov	w20, 1
	stp	wzr, wzr, [x1, 108]
	b	.L393
.L400:
	ldr	x0, [x0]
	mov	w1, 1
	str	w1, [x22, 108]
	blr	x0
	str	w0, [x22, 112]
	b	.L393
	.size	VCTRL_ChanDecparamInValidFlag, .-VCTRL_ChanDecparamInValidFlag
	.align	3
.LC226:
	.xword	.LANCHOR1
	.align	3
.LC228:
	.xword	.LC227
	.align	3
.LC230:
	.xword	.LC229
	.align	3
.LC231:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ClearDecparam
	.type	VCTRL_ClearDecparam, %function
VCTRL_ClearDecparam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L410
	ldr	x0, .LC236
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L411
	ldr	w4, [x0, 128]
	cmp	w4, 2
	beq	.L406
	cmp	w4, 3
	beq	.L407
	cbz	w4, .L412
	ldr	x3, .LC234
	mov	w1, 3989
	ldr	x2, .LC239
	mov	w0, 1
	add	x3, x3, 568
	bl	dprint_normal
.L401:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L410:
	ldr	x3, .LC234
	mov	w4, 3887
	ldr	x5, .LC233
	mov	w1, w4
	ldr	x2, .LC235
	add	x3, x3, 568
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L407:
	add	x0, x0, 221184
	str	xzr, [x0, 160]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L412:
	add	x0, x0, 221184
	str	xzr, [x0, 736]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L406:
	add	x0, x0, 221184
	str	xzr, [x0, 1160]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L411:
	ldr	x3, .LC234
	mov	w4, 3888
	ldr	x5, .LC237
	mov	w1, w4
	ldr	x2, .LC235
	add	x3, x3, 568
	bl	dprint_normal
	b	.L401
	.size	VCTRL_ClearDecparam, .-VCTRL_ClearDecparam
	.align	3
.LC233:
	.xword	.LC232
	.align	3
.LC234:
	.xword	.LANCHOR2
	.align	3
.LC235:
	.xword	.LC18
	.align	3
.LC236:
	.xword	.LANCHOR1
	.align	3
.LC237:
	.xword	.LC171
	.align	3
.LC239:
	.xword	.LC238
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_VdmProcSedOnly
	.type	VCTRL_VdmProcSedOnly, %function
VCTRL_VdmProcSedOnly:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w21, w1
	bl	_mcount
	cmp	w19, 3
	bhi	.L423
	ldr	x20, .LC243
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L424
	ldr	w0, [x0, 20]
	cmp	w0, 1
	beq	.L417
	ldr	x3, .LC241
	mov	w4, 4016
	ldr	x5, .LC246
.L422:
	ldr	x2, .LC242
	add	x3, x3, 592
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L413:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L417:
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbz	x0, .L413
	ldr	x0, [x20, w19, sxtw 3]
	ldr	w1, [x0, 128]
	cbnz	w1, .L413
	add	x0, x0, 221184
	mov	w1, w21
	add	x0, x0, 120
	bl	H264DEC_VDMProcSedOnly
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L423:
	ldr	x3, .LC241
	mov	w4, 4014
	ldr	x5, .LC240
	b	.L422
	.p2align 3
.L424:
	ldr	x3, .LC241
	mov	w4, 4015
	ldr	x5, .LC244
	mov	w1, w4
	ldr	x2, .LC242
	add	x3, x3, 592
	bl	dprint_normal
	b	.L413
	.size	VCTRL_VdmProcSedOnly, .-VCTRL_VdmProcSedOnly
	.align	3
.LC240:
	.xword	.LC232
	.align	3
.LC241:
	.xword	.LANCHOR2
	.align	3
.LC242:
	.xword	.LC18
	.align	3
.LC243:
	.xword	.LANCHOR1
	.align	3
.LC244:
	.xword	.LC179
	.align	3
.LC246:
	.xword	.LC245
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetImageBuffer
	.type	VCTRL_GetImageBuffer, %function
VCTRL_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L436
	ldr	x0, .LC250
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L437
	ldr	w1, [x0, 20]
	cmp	w1, 1
	bne	.L438
	ldr	w4, [x0, 128]
	cmp	w4, 2
	beq	.L431
	cmp	w4, 3
	beq	.L432
	cbz	w4, .L439
	ldr	x3, .LC248
	mov	w1, 4160
	ldr	x2, .LC254
	mov	w0, 0
	add	x3, x3, 616
	bl	dprint_normal
	mov	w0, 0
.L427:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L432:
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	MPEG2DEC_GetImageBuffer
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L439:
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	H264DEC_GetImageBuffer
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L431:
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	MPEG4DEC_GetImageBuffer
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L438:
	ldr	x3, .LC248
	mov	w4, 4053
	ldr	x5, .LC252
.L435:
	ldr	x2, .LC249
	add	x3, x3, 616
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L427
	.p2align 3
.L436:
	ldr	x3, .LC248
	mov	w4, 4051
	ldr	x5, .LC247
	b	.L435
.L437:
	ldr	x3, .LC248
	mov	w4, 4052
	ldr	x5, .LC251
	mov	w1, w4
	ldr	x2, .LC249
	add	x3, x3, 616
	bl	dprint_normal
	mov	w0, -1
	b	.L427
	.size	VCTRL_GetImageBuffer, .-VCTRL_GetImageBuffer
	.align	3
.LC247:
	.xword	.LC16
	.align	3
.LC248:
	.xword	.LANCHOR2
	.align	3
.LC249:
	.xword	.LC18
	.align	3
.LC250:
	.xword	.LANCHOR1
	.align	3
.LC251:
	.xword	.LC160
	.align	3
.LC252:
	.xword	.LC245
	.align	3
.LC254:
	.xword	.LC253
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ConfigFFFBSpeed
	.type	VCTRL_ConfigFFFBSpeed, %function
VCTRL_ConfigFFFBSpeed:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L447
	ldr	x0, .LC258
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L448
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L449
	cbz	x20, .L450
	add	x2, x0, 217088
	ldr	w1, [x20]
	mov	w0, 0
	str	w1, [x2, 3920]
.L442:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L449:
	ldr	x3, .LC256
	mov	w4, 4171
	ldr	x5, .LC261
.L446:
	ldr	x2, .LC257
	add	x3, x3, 640
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L442
	.p2align 3
.L447:
	ldr	x3, .LC256
	mov	w4, 4169
	ldr	x5, .LC255
	b	.L446
.L448:
	ldr	x3, .LC256
	mov	w4, 4170
	ldr	x5, .LC259
	mov	w1, w4
	ldr	x2, .LC257
	add	x3, x3, 640
	bl	dprint_normal
	mov	w0, -1
	b	.L442
.L450:
	ldr	x3, .LC256
	mov	w4, 4172
	ldr	x5, .LC263
	b	.L446
	.size	VCTRL_ConfigFFFBSpeed, .-VCTRL_ConfigFFFBSpeed
	.align	3
.LC255:
	.xword	.LC16
	.align	3
.LC256:
	.xword	.LANCHOR2
	.align	3
.LC257:
	.xword	.LC18
	.align	3
.LC258:
	.xword	.LANCHOR1
	.align	3
.LC259:
	.xword	.LC160
	.align	3
.LC261:
	.xword	.LC260
	.align	3
.LC263:
	.xword	.LC262
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ConfigPVRInfo
	.type	VCTRL_ConfigPVRInfo, %function
VCTRL_ConfigPVRInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L458
	ldr	x0, .LC267
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L459
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L460
	cbz	x20, .L461
	ldr	x3, .LC271
	add	x0, x0, 217088
	mov	x2, 24
	mov	x1, x20
	add	x0, x0, 3956
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L453:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L460:
	ldr	x3, .LC265
	mov	w4, 4183
	ldr	x5, .LC269
.L457:
	ldr	x2, .LC266
	add	x3, x3, 664
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L453
	.p2align 3
.L458:
	ldr	x3, .LC265
	mov	w4, 4181
	ldr	x5, .LC264
	b	.L457
.L461:
	ldr	x3, .LC265
	mov	w4, 4184
	ldr	x5, .LC270
	b	.L457
.L459:
	ldr	x3, .LC265
	mov	w4, 4182
	ldr	x5, .LC268
	mov	w1, w4
	ldr	x2, .LC266
	add	x3, x3, 664
	bl	dprint_normal
	mov	w0, -1
	b	.L453
	.size	VCTRL_ConfigPVRInfo, .-VCTRL_ConfigPVRInfo
	.align	3
.LC264:
	.xword	.LC16
	.align	3
.LC265:
	.xword	.LANCHOR2
	.align	3
.LC266:
	.xword	.LC18
	.align	3
.LC267:
	.xword	.LANCHOR1
	.align	3
.LC268:
	.xword	.LC160
	.align	3
.LC269:
	.xword	.LC260
	.align	3
.LC270:
	.xword	.LC262
	.align	3
.LC271:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IsChanActive
	.type	VCTRL_IsChanActive, %function
VCTRL_IsChanActive:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L469
	ldr	x0, .LC275
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L468
	ldr	w1, [x0, 16]
	cbz	w1, .L468
	ldr	w1, [x0, 20]
	cbz	w1, .L468
	ldr	w1, [x0, 28]
	cbz	w1, .L468
	ldr	w0, [x0, 128]
	cmp	w0, 22
	csetm	w0, eq
.L464:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L468:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L469:
	ldr	x3, .LC273
	mov	w4, 4193
	ldr	x5, .LC272
	mov	w1, w4
	ldr	x2, .LC274
	add	x3, x3, 688
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L464
	.size	VCTRL_IsChanActive, .-VCTRL_IsChanActive
	.align	3
.LC272:
	.xword	.LC16
	.align	3
.LC273:
	.xword	.LANCHOR2
	.align	3
.LC274:
	.xword	.LC18
	.align	3
.LC275:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_GetActiveChanNum, %function
VCTRL_GetActiveChanNum:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x22, x1
	mov	x0, x30
	mov	x19, 0
	bl	_mcount
	str	wzr, [x21]
	ldr	x23, .LC278
	str	wzr, [x22]
.L475:
	mov	w0, w19
	bl	VCTRL_IsChanActive
	cbz	w0, .L477
.L472:
	add	x19, x19, 1
	cmp	x19, 4
	bne	.L475
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L477:
	ldr	x20, [x23, x19, lsl 3]
	add	x1, x29, 76
	mov	w0, 3
	ldr	w2, [x20, 128]
	str	w2, [x29, 76]
	bl	PDT_GetAttribute
	cbnz	w0, .L473
	ldr	w0, [x21]
	add	w0, w0, 1
	str	w0, [x21]
.L473:
	ldr	w0, [x20, 128]
	cmp	w0, 1
	bne	.L472
	ldr	w0, [x22]
	add	w0, w0, 1
	str	w0, [x22]
	b	.L472
	.size	VCTRL_GetActiveChanNum, .-VCTRL_GetActiveChanNum
	.align	3
.LC278:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_VarifyOption
	.type	VCTRL_VarifyOption, %function
VCTRL_VarifyOption:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 28]
	tbnz	w0, #31, .L479
	ldr	w1, [x19, 44]
	mov	w0, 262143
	cmp	w1, w0
	ble	.L479
	ldr	w1, [x19, 36]
	mov	w0, 0
	cmp	w1, 1
	beq	.L483
.L480:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L483:
	ldr	w1, [x19, 20]
	cmp	w1, wzr
	ble	.L479
	ldr	w1, [x19, 24]
	cmp	w1, wzr
	bgt	.L480
	.p2align 2
.L479:
	ldr	x3, .LC279
	mov	w1, 4217
	ldr	x2, .LC281
	mov	w0, 1
	add	x3, x3, 712
	bl	dprint_normal
	mov	w0, -1
	b	.L480
	.size	VCTRL_VarifyOption, .-VCTRL_VarifyOption
	.align	3
.LC279:
	.xword	.LANCHOR2
	.align	3
.LC281:
	.xword	.LC280
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetMemSize_onDecode
	.type	VCTRL_GetMemSize_onDecode, %function
VCTRL_GetMemSize_onDecode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	mov	x20, x2
	bl	_mcount
	ldr	w3, [x19, 44]
	mov	w1, 51600
	movk	w1, 0x7, lsl 16
	add	w3, w3, 1039
	mov	w0, w1
	and	w3, w3, -1024
	stp	w3, w1, [x20, 4]
	ldr	w1, [x19, 36]
	cbz	w1, .L485
	ldr	w4, [x19, 12]
	cmp	w4, wzr
	ble	.L489
	sxtw	x3, w4
	lsl	x0, x3, 7
	sub	x0, x0, x3
	lsl	x3, x0, 5
.L486:
	ldp	w1, w2, [x19, 20]
	mov	w0, 2208
	mov	w5, 4000
	str	w4, [x19, 12]
	smull	x0, w2, w0
	smaddl	x0, w1, w5, x0
	ldr	w1, [x20, 8]
	add	x0, x0, x3
	add	w0, w1, w0
.L485:
	str	w0, [x20, 8]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L489:
	mov	x3, 28416
	mov	w4, 136
	movk	x3, 0x8, lsl 16
	b	.L486
	.size	VCTRL_GetMemSize_onDecode, .-VCTRL_GetMemSize_onDecode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanMemSize
	.type	VCTRL_GetChanMemSize, %function
VCTRL_GetChanMemSize:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x1
	mov	x0, x30
	mov	x20, x2
	mov	w21, w3
	bl	_mcount
	cbz	x19, .L506
	cbz	x20, .L507
	cmp	w21, 2
	beq	.L494
	ldr	x0, .LC288
	mov	w2, 16
	ldr	w3, [x19, 28]
	ldr	w5, [x19, 48]
	ldr	w4, [x0, 680]
	ldr	w6, [x0, 684]
	add	w0, w3, w4
	cmp	w0, w2
	add	w1, w5, w6
	csel	w0, w0, w2, le
	cmp	w0, wzr
	ccmp	w1, wzr, 1, ge
	blt	.L508
	str	w0, [x19, 28]
	str	w1, [x19, 48]
.L494:
	mov	x0, x19
	bl	VCTRL_VarifyOption
	cbnz	w0, .L499
	ldr	w3, [x19, 44]
	mov	w1, 51600
	movk	w1, 0x7, lsl 16
	add	w3, w3, 1039
	and	w3, w3, -1024
	stp	w3, w1, [x20, 4]
	ldr	w2, [x19, 36]
	cbz	w2, .L496
	ldr	w5, [x19, 12]
	cmp	w5, wzr
	ble	.L501
	sxtw	x3, w5
	lsl	x1, x3, 7
	sub	x1, x1, x3
	lsl	x3, x1, 5
.L497:
	ldp	w2, w4, [x19, 20]
	mov	w1, 2208
	mov	w6, 4000
	str	w5, [x19, 12]
	smull	x1, w4, w1
	smaddl	x1, w2, w6, x1
	ldr	w2, [x20, 8]
	add	x1, x1, x3
	add	w1, w2, w1
.L496:
	str	w1, [x20, 8]
.L492:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L501:
	mov	x3, 28416
	mov	w5, 136
	movk	x3, 0x8, lsl 16
	b	.L497
	.p2align 3
.L499:
	mov	w0, -1
	b	.L492
	.p2align 3
.L508:
	ldr	x2, .LC290
	mov	w1, 4291
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L492
.L507:
	ldr	x3, .LC284
	mov	w4, 4282
	ldr	x5, .LC287
.L505:
	ldr	x2, .LC285
	add	x3, x3, 736
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L492
.L506:
	ldr	x3, .LC284
	mov	w4, 4281
	ldr	x5, .LC283
	b	.L505
	.size	VCTRL_GetChanMemSize, .-VCTRL_GetChanMemSize
	.align	3
.LC283:
	.xword	.LC282
	.align	3
.LC284:
	.xword	.LANCHOR2
	.align	3
.LC285:
	.xword	.LC18
	.align	3
.LC287:
	.xword	.LC286
	.align	3
.LC288:
	.xword	.LANCHOR1
	.align	3
.LC290:
	.xword	.LC289
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_RegisterInterrupt
	.type	VCTRL_RegisterInterrupt, %function
VCTRL_RegisterInterrupt:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC291
	ldr	x22, .LC292
	mov	w0, 0
	ldr	x23, [x21, 400]
	ldrsw	x20, [x22]
	bl	VFMW_GetString
	ldr	x19, .LC293
	mov	x3, x0
	mov	x2, x20
	ldr	x1, .LC294
	add	x20, x19, 688
	mov	w0, 127
	mov	x4, x20
	blr	x23
	cbnz	w0, .L513
	add	x19, x19, 32
	mov	w0, 4
	ldrsw	x23, [x22]
	ldr	x22, [x21, 400]
	mov	w21, 1
	str	w21, [x19, 200]
	bl	VFMW_GetString
	ldr	x1, .LC297
	mov	x3, x0
	mov	x4, x20
	mov	x2, x23
	mov	w0, 136
	blr	x22
	cbnz	w0, .L514
	str	w21, [x19, 204]
.L511:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L513:
	ldr	x2, .LC296
	mov	w3, 127
	mov	w1, 4314
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L511
	.p2align 3
.L514:
	ldr	x2, .LC296
	mov	w3, 136
	mov	w1, 4322
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L511
	.size	VCTRL_RegisterInterrupt, .-VCTRL_RegisterInterrupt
	.align	3
.LC291:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC292:
	.xword	.LANCHOR3
	.align	3
.LC293:
	.xword	.LANCHOR1
	.align	3
.LC294:
	.xword	VCTRL_Isr_0
	.align	3
.LC296:
	.xword	.LC295
	.align	3
.LC297:
	.xword	VCTRL_Scd_Isr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_UnregisterInterrupt
	.type	VCTRL_UnregisterInterrupt, %function
VCTRL_UnregisterInterrupt:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC300
	ldr	w0, [x19, 232]
	cmp	w0, 1
	beq	.L518
.L516:
	ldr	w0, [x19, 236]
	cmp	w0, 1
	beq	.L519
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L519:
	ldr	x1, .LC301
	mov	w0, 4
	ldr	x21, [x1, 408]
	bl	VFMW_GetString
	add	x2, x19, 688
	mov	x1, x0
	mov	w0, 136
	blr	x21
	str	wzr, [x19, 236]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L518:
	ldr	x1, .LC301
	mov	w0, 0
	ldr	x21, [x1, 408]
	bl	VFMW_GetString
	add	x2, x19, 688
	mov	x1, x0
	mov	w0, 127
	blr	x21
	str	wzr, [x19, 232]
	b	.L516
	.size	VCTRL_UnregisterInterrupt, .-VCTRL_UnregisterInterrupt
	.align	3
.LC300:
	.xword	.LANCHOR1
	.align	3
.LC301:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_MapVdmRegister
	.type	VCTRL_MapVdmRegister, %function
VCTRL_MapVdmRegister:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 88
	bl	_mcount
	mov	x2, x19
	mov	w1, 65536
	mov	w0, -121438208
	bl	MEM_MapRegisterAddr
	mov	w20, w0
	cbnz	w0, .L523
	ldr	w0, [x19, 16]
	ldr	w2, [x19, 24]
	ldr	x1, [x19, 8]
	bl	MEM_AddMemRecord
.L522:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L523:
	ldr	x2, .LC304
	mov	w3, -121438208
	mov	w1, 4377
	mov	w0, 0
	mov	w20, -1
	bl	dprint_normal
	b	.L522
	.size	VCTRL_MapVdmRegister, .-VCTRL_MapVdmRegister
	.align	3
.LC304:
	.xword	.LC303
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_UnmapVdmRegister
	.type	VCTRL_UnmapVdmRegister, %function
VCTRL_UnmapVdmRegister:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 88
	bl	_mcount
	ldr	w20, [x19, 24]
	ldr	w21, [x19, 16]
	ldr	x22, [x19, 8]
	cbz	w20, .L525
	mov	x1, x22
	mov	w0, w21
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC305
	mov	x2, 32
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
.L525:
	mov	w2, w20
	mov	x1, x22
	mov	w0, w21
	bl	MEM_DelMemRecord
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VCTRL_UnmapVdmRegister, .-VCTRL_UnmapVdmRegister
	.align	3
.LC305:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_InitVdmHal
	.type	VCTRL_InitVdmHal, %function
VCTRL_InitVdmHal:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC306
	mov	w0, 15
	ldr	x20, [x21, 136]
	bl	VFMW_GetString
	mov	x1, 20
	mov	x2, x0
	mov	w3, 0
	add	x0, x29, 48
	blr	x20
	ldr	x20, .LC307
	strb	wzr, [x29, 67]
	ldr	x1, [x20, 88]
	cbz	x1, .L530
	mov	w0, 0
	blr	x1
	cmp	w0, wzr
	mov	w2, w0
	ble	.L530
	mov	w4, 0
	mov	x3, x19
	mov	w1, 0
	add	x0, x29, 48
	str	wzr, [x19, 28]
	bl	MEM_AllocMemBlock
	cbnz	w0, .L531
	ldr	w2, [x19, 24]
	ldr	x1, [x19, 8]
	ldr	w0, [x19, 16]
	bl	MEM_AddMemRecord
	ldr	x3, [x21, 96]
	mov	x2, 20
	mov	w1, 0
	add	x0, x29, 72
	blr	x3
	str	wzr, [x29, 80]
	ldr	w2, [x19, 16]
	ldr	w0, [x19, 24]
	ldr	x1, [x20, 96]
	stp	w2, w0, [x29, 72]
	cbz	x1, .L532
	add	x0, x29, 72
	blr	x1
	mov	w19, w0
	cbnz	w0, .L532
	bl	VDMDRV_Init
.L533:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L530:
	ldr	x2, .LC309
	mov	w3, 0
	mov	w1, 4482
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L532:
	ldr	x2, .LC313
	mov	w3, 0
	mov	w1, 4510
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L533
	.p2align 3
.L531:
	ldr	x2, .LC311
	mov	w3, 0
	mov	w1, 4496
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L533
	.size	VCTRL_InitVdmHal, .-VCTRL_InitVdmHal
	.align	3
.LC306:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC307:
	.xword	g_vdm_hal_fun_ptr
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
	.global	VCTRL_DeinitVdmHal
	.type	VCTRL_DeinitVdmHal, %function
VCTRL_DeinitVdmHal:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 64]
	cbz	w0, .L548
	ldr	w0, [x19, 80]
	cmp	w0, wzr
	cset	w23, ne
.L541:
	ldr	w20, [x19, 24]
	ldr	w21, [x19, 16]
	ldr	x22, [x19, 8]
	cbz	w20, .L542
	ldr	x0, .LC314
	ldr	x1, [x0, 104]
	cbz	x1, .L554
	mov	w0, 0
	blr	x1
	cbz	w23, .L545
.L546:
	ldr	x3, .LC315
	mov	x2, 32
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
.L542:
	mov	w2, w20
	mov	x1, x22
	mov	w0, w21
	bl	MEM_DelMemRecord
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L554:
	mov	w3, 4550
	ldr	x2, .LC316
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	cbnz	w23, .L546
	.p2align 2
.L545:
	ldr	w0, [x19, 16]
	ldr	x1, [x19, 8]
	bl	MEM_ReleaseMemBlock
	b	.L546
	.p2align 3
.L548:
	mov	w23, 0
	b	.L541
	.size	VCTRL_DeinitVdmHal, .-VCTRL_DeinitVdmHal
	.align	3
.LC314:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC315:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC316:
	.xword	.LC50
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_InitScdHal
	.type	VCTRL_InitScdHal, %function
VCTRL_InitScdHal:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC317
	mov	w0, 17
	ldr	x20, [x1, 136]
	bl	VFMW_GetString
	mov	w3, 0
	mov	x2, x0
	mov	x1, 20
	add	x0, x29, 40
	blr	x20
	str	wzr, [x19, 60]
	mov	w4, 0
	add	x3, x19, 32
	mov	w2, 25600
	mov	w1, 0
	add	x0, x29, 40
	strb	wzr, [x29, 59]
	bl	MEM_AllocMemBlock
	cbnz	w0, .L556
	ldr	w2, [x19, 56]
	ldr	x1, [x19, 40]
	ldr	w0, [x19, 48]
	bl	MEM_AddMemRecord
	ldr	w0, [x19, 48]
	mov	w2, 0
	ldr	w1, [x19, 56]
	bl	SM_OpenSCDDrv
	mov	w19, w0
	cbnz	w0, .L557
	bl	SM_InstInit
.L558:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L556:
	ldr	x2, .LC319
	mov	w3, 0
	mov	w1, 4592
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L558
	.p2align 3
.L557:
	ldr	x2, .LC321
	mov	w3, 0
	mov	w1, 4600
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L558
	.size	VCTRL_InitScdHal, .-VCTRL_InitScdHal
	.align	3
.LC317:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC319:
	.xword	.LC318
	.align	3
.LC321:
	.xword	.LC320
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DeinitScdHal
	.type	VCTRL_DeinitScdHal, %function
VCTRL_DeinitScdHal:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 64]
	cbz	w0, .L560
	ldr	w0, [x19, 80]
	cbz	w0, .L560
	ldr	w20, [x19, 56]
	ldr	w22, [x19, 48]
	ldr	x21, [x19, 40]
	cbz	w20, .L564
	mov	w0, 0
	add	x23, x19, 32
	bl	SM_CloseSCDDrv
.L562:
	ldr	x3, .LC322
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	ldr	x3, [x3, 96]
	blr	x3
.L564:
	mov	w2, w20
	mov	x1, x21
	mov	w0, w22
	bl	MEM_DelMemRecord
	bl	SM_InstInit
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L560:
	ldr	w20, [x19, 56]
	ldr	w22, [x19, 48]
	ldr	x21, [x19, 40]
	cbz	w20, .L564
	mov	w0, 0
	add	x23, x19, 32
	bl	SM_CloseSCDDrv
	ldr	w0, [x19, 48]
	ldr	x1, [x19, 40]
	bl	MEM_ReleaseMemBlock
	b	.L562
	.size	VCTRL_DeinitScdHal, .-VCTRL_DeinitScdHal
	.align	3
.LC322:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetNextDecodeMode
	.type	VCTRL_GetNextDecodeMode, %function
VCTRL_GetNextDecodeMode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w19, w2
	mov	w22, w1
	bl	_mcount
	add	w20, w19, 7
	mov	w0, 21846
	lsl	w4, w19, 1
	movk	w0, 0x5555, lsl 16
	cmp	w19, wzr
	csel	w20, w20, w19, lt
	ldr	x2, .LC324
	smull	x0, w4, w0
	asr	w20, w20, 3
	mov	w6, w22
	lsr	x0, x0, 32
	mov	w5, w19
	sub	w4, w0, w4, asr 31
	mov	w3, w20
	mov	w1, 4656
	mov	w0, 25
	bl	dprint_normal
	cmp	w21, 3
	beq	.L577
	cmp	w19, w22
	mov	w19, w21
	blt	.L578
.L574:
	ldr	x2, .LC330
	mov	w4, w19
	mov	w3, w21
	mov	w1, 4675
	mov	w0, 25
	bl	dprint_normal
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L578:
	ldr	x2, .LC328
	mov	w1, 4670
	mov	w0, 25
	mov	w19, 3
	bl	dprint_normal
	b	.L574
	.p2align 3
.L577:
	cmp	w20, w22
	mov	w19, w21
	ble	.L574
	ldr	x2, .LC326
	mov	w1, 4662
	mov	w0, 25
	mov	w19, 0
	bl	dprint_normal
	b	.L574
	.size	VCTRL_GetNextDecodeMode, .-VCTRL_GetNextDecodeMode
	.align	3
.LC324:
	.xword	.LC323
	.align	3
.LC326:
	.xword	.LC325
	.align	3
.LC328:
	.xword	.LC327
	.align	3
.LC330:
	.xword	.LC329
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanPriorityTab
	.type	VCTRL_GetChanPriorityTab, %function
VCTRL_GetChanPriorityTab:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC333
	mov	x0, 0
.L582:
	ldr	x1, [x2, x0, lsl 3]
	cbz	x1, .L580
	ldr	w1, [x1, 28]
	str	w1, [x19, x0, lsl 2]
.L581:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L582
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L580:
	str	wzr, [x19, x0, lsl 2]
	b	.L581
	.size	VCTRL_GetChanPriorityTab, .-VCTRL_GetChanPriorityTab
	.align	3
.LC333:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanIDByCtx
	.type	VCTRL_GetChanIDByCtx, %function
VCTRL_GetChanIDByCtx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L594
	ldr	x3, .LC338
	mov	x0, 0
.L588:
	ldr	x2, [x3, x0, lsl 3]
	add	x1, x2, 221184
	add	x1, x1, 120
	cbz	x2, .L587
	cmp	x19, x1
	beq	.L586
.L587:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L588
	mov	w0, -1
.L586:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L594:
	ldr	x3, .LC336
	mov	w4, 4703
	ldr	x5, .LC335
	mov	w1, w4
	ldr	x2, .LC337
	add	x3, x3, 760
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L586
	.size	VCTRL_GetChanIDByCtx, .-VCTRL_GetChanIDByCtx
	.align	3
.LC335:
	.xword	.LC334
	.align	3
.LC336:
	.xword	.LANCHOR2
	.align	3
.LC337:
	.xword	.LC18
	.align	3
.LC338:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DecChanProcessPts
	.type	VCTRL_DecChanProcessPts, %function
VCTRL_DecChanProcessPts:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x21, .LC339
	ldr	x6, [x21, w20, sxtw 3]
	add	x6, x6, 217088
	ldr	w2, [x6, 3080]
	cmp	w2, 6
	sub	w0, w2, #2
	ccmp	w2, 18, 4, ne
	ccmp	w0, 1, 0, ne
	bls	.L618
	ldr	x4, [x19, 40]
	cmn	x4, #1
	beq	.L619
	str	x4, [x6, 3320]
.L606:
	ldr	x5, [x19, 56]
	mov	w3, w20
	str	x5, [x6, 3336]
	mov	w1, 4824
	ldr	x2, .LC345
	ldr	x0, [x19, 64]
	str	x0, [x6, 3352]
	mov	w0, 24
	ldr	w7, [x19, 72]
	str	w7, [x6, 3368]
	ldr	w7, [x19, 76]
	str	w7, [x6, 3372]
	ldr	w7, [x19, 80]
	str	w7, [x6, 3376]
	ldr	w7, [x19, 84]
	str	w7, [x6, 3392]
	ldrb	w7, [x19, 20]
	strb	w7, [x6, 3316]
	bl	dprint_normal
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L619:
	ldr	x4, [x6, 3320]
	b	.L606
	.p2align 3
.L618:
	add	x3, x19, 8
	add	x1, x6, 3856
	mov	w0, w20
	bl	IsNewpicSeg
	cbnz	w0, .L597
	ldr	x0, [x21, w20, sxtw 3]
	add	x0, x0, 217088
	ldr	w1, [x0, 3080]
	cmp	w1, 3
	ldr	x1, [x0, 3328]
	beq	.L616
	cmn	x1, #1
	beq	.L599
.L616:
	str	x1, [x0, 3320]
.L599:
	ldr	x3, [x0, 3344]
	mov	x2, -1
	ldr	x1, [x0, 3360]
	str	x2, [x0, 3328]
	str	x3, [x0, 3336]
	str	x1, [x0, 3352]
	cbnz	x1, .L600
	ldr	x1, [x19, 64]
	str	x1, [x0, 3352]
.L600:
	ldr	w2, [x0, 3384]
	ldr	w3, [x0, 3388]
	ldr	w1, [x0, 3396]
	ldr	w5, [x0, 3380]
	str	w2, [x0, 3372]
	ldr	x4, [x0, 3320]
	ldr	x2, .LC341
	str	w3, [x0, 3376]
	mov	w3, w20
	str	w1, [x0, 3392]
	mov	w1, 4778
	str	w5, [x0, 3368]
	mov	w0, 24
	bl	dprint_normal
	ldr	x0, [x21, w20, sxtw 3]
	add	x0, x0, 217088
	ldr	w1, [x0, 3080]
	cmp	w1, 3
	beq	.L620
.L601:
	ldr	x1, [x19, 40]
	cmn	x1, #1
	beq	.L603
.L617:
	str	x1, [x0, 3328]
.L603:
	ldr	x1, [x19, 56]
	str	x1, [x0, 3344]
	ldr	x1, [x19, 64]
	str	x1, [x0, 3360]
	ldr	w1, [x19, 72]
	str	w1, [x0, 3380]
	ldr	w1, [x19, 76]
	str	w1, [x0, 3384]
	ldr	w1, [x19, 80]
	str	w1, [x0, 3388]
	ldr	w1, [x19, 84]
	str	w1, [x0, 3396]
.L602:
	ldr	x4, [x0, 3336]
	mov	w3, w20
	ldr	x2, .LC343
	mov	w1, 4807
	mov	w0, 24
	bl	dprint_normal
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L597:
	ldr	x0, [x21, w20, sxtw 3]
	add	x0, x0, 217088
	ldr	w1, [x0, 3080]
	cmp	w1, 3
	bne	.L601
	b	.L602
	.p2align 3
.L620:
	ldr	x1, [x19, 40]
	b	.L617
	.size	VCTRL_DecChanProcessPts, .-VCTRL_DecChanProcessPts
	.align	3
.LC339:
	.xword	.LANCHOR1
	.align	3
.LC341:
	.xword	.LC340
	.align	3
.LC343:
	.xword	.LC342
	.align	3
.LC345:
	.xword	.LC344
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DecChanCheckDecParam
	.type	VCTRL_DecChanCheckDecParam, %function
VCTRL_DecChanCheckDecParam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC346
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w0, [x0, 128]
	cmp	w0, 20
	beq	.L622
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbnz	x0, .L624
.L622:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L624:
	mov	w0, -2
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_DecChanCheckDecParam, .-VCTRL_DecChanCheckDecParam
	.align	3
.LC346:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DecChanSyntax
	.type	VCTRL_DecChanSyntax, %function
VCTRL_DecChanSyntax:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L653
	ldr	x21, .LC350
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L654
	ldr	w1, [x0, 20]
	cmp	w1, 1
	bne	.L655
	ldr	w20, [x0, 32]
	cbnz	w20, .L656
	mov	w0, w19
	bl	IsPrintStateAllow
	mov	w22, w0
	ldr	x0, [x21, w19, sxtw 3]
	ldr	w0, [x0, 128]
	cmp	w0, 20
	beq	.L634
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbnz	x0, .L657
.L634:
	mov	w0, w19
	bl	VCTRL_GetImageBuffer
	cmp	w0, 1
	beq	.L658
	cmp	w22, 1
	mov	w20, -3
	beq	.L659
.L646:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L657:
	cmp	w22, 1
	beq	.L637
	mov	w20, -2
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L658:
	ldr	x0, [x21, w19, sxtw 3]
	add	x23, x0, 217088
	add	x24, x23, 3400
	ldrb	w1, [x24, 1]
	cbnz	w1, .L636
	add	x0, x0, 221184
	ldr	w0, [x0, 80]
	cbz	w0, .L660
.L636:
	ldr	x4, [x23, 3440]
	mov	w3, w19
	ldr	x5, [x23, 3456]
	mov	w1, 4896
	ldr	x2, .LC362
	mov	w0, 24
	bl	dprint_normal
	mov	x1, x24
	mov	w0, w19
	bl	VCTRL_DecChanProcessPts
	ldr	x1, [x21, w19, sxtw 3]
	mov	x0, x24
	add	x2, x1, 221184
	ldr	w1, [x1, 128]
	add	x2, x2, 120
	bl	DecodeStream
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L637:
	ldr	x2, .LC356
	mov	w3, w19
	mov	w1, 4862
	mov	w0, 23
	mov	w20, -2
	bl	dprint_normal
	b	.L646
	.p2align 3
.L659:
	ldr	x2, .LC358
	mov	w3, w19
	mov	w1, 4873
	mov	w0, 23
	bl	dprint_normal
	b	.L646
	.p2align 3
.L655:
	ldr	x3, .LC348
	mov	w4, 4852
	ldr	x5, .LC352
.L650:
	ldr	x2, .LC349
	add	x3, x3, 784
	mov	w1, w4
	mov	w0, 0
	mov	w20, -1
	bl	dprint_normal
	b	.L646
	.p2align 3
.L656:
	ldr	x3, .LC348
	mov	w4, 4853
	ldr	x5, .LC354
	b	.L650
	.p2align 3
.L660:
	add	x1, x23, 3408
	mov	w0, w19
	bl	SM_ReadSegStream
	cbz	w0, .L636
	cmp	w22, 1
	mov	w20, -4
	bne	.L646
	ldr	x2, .LC360
	mov	w3, w19
	mov	w1, 4888
	mov	w0, 23
	bl	dprint_normal
	b	.L646
	.p2align 3
.L653:
	ldr	x3, .LC348
	mov	w4, 4850
	ldr	x5, .LC347
	b	.L650
.L654:
	ldr	x3, .LC348
	mov	w4, 4851
	ldr	x5, .LC351
	mov	w1, w4
	ldr	x2, .LC349
	add	x3, x3, 784
	mov	w20, -1
	bl	dprint_normal
	b	.L646
	.size	VCTRL_DecChanSyntax, .-VCTRL_DecChanSyntax
	.align	3
.LC347:
	.xword	.LC16
	.align	3
.LC348:
	.xword	.LANCHOR2
	.align	3
.LC349:
	.xword	.LC18
	.align	3
.LC350:
	.xword	.LANCHOR1
	.align	3
.LC351:
	.xword	.LC179
	.align	3
.LC352:
	.xword	.LC245
	.align	3
.LC354:
	.xword	.LC353
	.align	3
.LC356:
	.xword	.LC355
	.align	3
.LC358:
	.xword	.LC357
	.align	3
.LC360:
	.xword	.LC359
	.align	3
.LC362:
	.xword	.LC361
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DecSyntax
	.type	VCTRL_DecSyntax, %function
VCTRL_DecSyntax:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC363
	mov	x0, 0
.L664:
	ldr	x1, [x19, x0, lsl 3]
	add	x2, x19, 696
	cbz	x1, .L662
	ldr	w1, [x1, 28]
	str	w1, [x2, x0, lsl 2]
.L663:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L664
	ldr	x24, .LC364
	mov	w21, -1
	.p2align 2
.L665:
	ldr	w1, [x19, 696]
	mov	w20, 1
	ldr	w0, [x19, 700]
	cmp	w1, w0
	blt	.L666
	mov	w0, w1
	mov	w20, 0
.L666:
	ldr	w1, [x19, 704]
	cmp	w0, w1
	bge	.L693
	ldr	w0, [x19, 708]
	mov	w20, 2
	cmp	w1, w0
	bge	.L694
.L682:
	mov	w20, 3
	add	x3, x19, 696
	add	x1, x19, 32
	add	w2, w20, 1
	cmp	w0, wzr
	sxtw	x23, w20
	str	wzr, [x3, w20, sxtw 2]
	str	w2, [x1, 28]
	ble	.L669
.L696:
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L665
	ldr	w1, [x0, 20]
	cmp	w1, 1
	bne	.L665
	add	x0, x0, 217088
	ldr	w1, [x0, 3104]
	cmp	w1, wzr
	ble	.L671
	ldr	w0, [x0, 3108]
	cbz	w0, .L695
.L671:
	mov	w22, 500
	b	.L679
	.p2align 3
.L674:
	ldr	x0, [x19, x23, lsl 3]
	add	x0, x0, 221184
	cbnz	w21, .L677
	ldr	w1, [x0, 100]
	cmp	w1, 1
	beq	.L677
	subs	w22, w22, #1
	beq	.L665
.L679:
	mov	w0, w20
	bl	VCTRL_DecChanSyntax
	cmn	w0, #1
	mov	w21, w0
	bne	.L674
	ldr	x4, [x19, 712]
	cbz	x4, .L675
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	mov	w0, w20
	blr	x4
.L675:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L693:
	mov	w1, w0
	ldr	w0, [x19, 708]
	cmp	w1, w0
	blt	.L682
.L694:
	mov	w0, w1
	add	x3, x19, 696
	add	x1, x19, 32
	add	w2, w20, 1
	cmp	w0, wzr
	sxtw	x23, w20
	str	wzr, [x3, w20, sxtw 2]
	str	w2, [x1, 28]
	bgt	.L696
.L669:
	str	wzr, [x1, 28]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L677:
	str	wzr, [x0, 100]
	b	.L665
	.p2align 3
.L662:
	add	x1, x19, 696
	str	wzr, [x1, x0, lsl 2]
	b	.L663
	.p2align 3
.L695:
	add	x1, x29, 72
	mov	w0, w20
	bl	SM_GetInfo
	cbnz	w0, .L697
.L672:
	ldr	x21, [x19, x23, lsl 3]
	ldr	w1, [x29, 84]
	add	x21, x21, 217088
	ldr	w2, [x21, 3104]
	ldr	w0, [x21, 3296]
	bl	VCTRL_GetNextDecodeMode
	str	w0, [x21, 3296]
	ldr	x1, [x19, x23, lsl 3]
	add	x0, x1, 217088
	ldr	w1, [x0, 3296]
	cbz	w1, .L673
	str	wzr, [x0, 3288]
	str	wzr, [x0, 3292]
	b	.L671
.L673:
	ldr	w1, [x0, 3100]
	str	w1, [x0, 3288]
	str	w1, [x0, 3292]
	b	.L671
.L697:
	ldr	x3, [x24, 96]
	mov	x2, 24
	mov	w1, 0
	add	x0, x29, 72
	blr	x3
	b	.L672
	.size	VCTRL_DecSyntax, .-VCTRL_DecSyntax
	.align	3
.LC363:
	.xword	.LANCHOR1
	.align	3
.LC364:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanVoQue
	.type	VCTRL_GetChanVoQue, %function
VCTRL_GetChanVoQue:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L707
	ldr	x0, .LC367
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L707
	ldr	w1, [x0, 128]
	cmp	w1, 20
	bls	.L708
.L707:
	mov	x0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L708:
	ldr	x2, .LC368
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx701
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx701:
	.section	.rodata
	.align	0
	.align	2
.L701:
	.byte	(.L704 - .Lrtx701) / 4
	.byte	(.L707 - .Lrtx701) / 4
	.byte	(.L702 - .Lrtx701) / 4
	.byte	(.L703 - .Lrtx701) / 4
	.byte	(.L707 - .Lrtx701) / 4
	.byte	(.L707 - .Lrtx701) / 4
	.byte	(.L707 - .Lrtx701) / 4
	.byte	(.L707 - .Lrtx701) / 4
	.byte	(.L707 - .Lrtx701) / 4
	.byte	(.L707 - .Lrtx701) / 4
	.byte	(.L707 - .Lrtx701) / 4
	.byte	(.L707 - .Lrtx701) / 4
	.byte	(.L707 - .Lrtx701) / 4
	.byte	(.L707 - .Lrtx701) / 4
	.byte	(.L707 - .Lrtx701) / 4
	.byte	(.L707 - .Lrtx701) / 4
	.byte	(.L707 - .Lrtx701) / 4
	.byte	(.L707 - .Lrtx701) / 4
	.byte	(.L707 - .Lrtx701) / 4
	.byte	(.L707 - .Lrtx701) / 4
	.byte	(.L704 - .Lrtx701) / 4
	.text
	.p2align 3
.L704:
	add	x0, x0, 221184
	ldr	x19, [sp, 16]
	add	x0, x0, 128
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L703:
	add	x0, x0, 303104
	ldr	x19, [sp, 16]
	add	x0, x0, 248
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L702:
	add	x0, x0, 241664
	ldr	x19, [sp, 16]
	add	x0, x0, 2280
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetChanVoQue, .-VCTRL_GetChanVoQue
	.align	3
.LC367:
	.xword	.LANCHOR1
	.align	3
.LC368:
	.xword	.L701
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanImgNum
	.type	VCTRL_GetChanImgNum, %function
VCTRL_GetChanImgNum:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	x22, x1
	mov	x20, x2
	mov	x21, x3
	bl	_mcount
	cmp	w19, 3
	bhi	.L732
	ldr	x23, .LC372
	ldr	x0, [x23, w19, sxtw 3]
	cbz	x0, .L733
	cbz	x22, .L734
	cbz	x20, .L735
	cbz	x21, .L736
	ldr	w1, [x0, 128]
	cmp	w1, 20
	bls	.L737
.L722:
	str	wzr, [x21]
	str	wzr, [x20]
	str	wzr, [x22]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L732:
	ldr	x3, .LC370
	mov	w4, 5107
	ldr	x5, .LC369
.L731:
	ldr	x2, .LC371
	add	x3, x3, 808
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L709:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L737:
	ldr	x2, .LC380
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx718
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx718:
	.section	.rodata
	.align	0
	.align	2
.L718:
	.byte	(.L721 - .Lrtx718) / 4
	.byte	(.L722 - .Lrtx718) / 4
	.byte	(.L719 - .Lrtx718) / 4
	.byte	(.L720 - .Lrtx718) / 4
	.byte	(.L722 - .Lrtx718) / 4
	.byte	(.L722 - .Lrtx718) / 4
	.byte	(.L722 - .Lrtx718) / 4
	.byte	(.L722 - .Lrtx718) / 4
	.byte	(.L722 - .Lrtx718) / 4
	.byte	(.L722 - .Lrtx718) / 4
	.byte	(.L722 - .Lrtx718) / 4
	.byte	(.L722 - .Lrtx718) / 4
	.byte	(.L722 - .Lrtx718) / 4
	.byte	(.L722 - .Lrtx718) / 4
	.byte	(.L722 - .Lrtx718) / 4
	.byte	(.L722 - .Lrtx718) / 4
	.byte	(.L722 - .Lrtx718) / 4
	.byte	(.L722 - .Lrtx718) / 4
	.byte	(.L722 - .Lrtx718) / 4
	.byte	(.L722 - .Lrtx718) / 4
	.byte	(.L721 - .Lrtx718) / 4
	.text
	.p2align 3
.L721:
	add	x0, x0, 221184
	add	x0, x0, 128
.L716:
	cbz	x0, .L722
	mov	x2, x21
	mov	x1, x20
	bl	SYNTAX_GetQueueImgNum
	ldr	x0, [x23, w19, sxtw 3]
	ldr	w4, [x0, 128]
	cbz	w4, .L738
	cmp	w4, 16
	beq	.L739
	cmp	w4, 17
	beq	.L740
	cmp	w4, 15
	beq	.L741
	cmp	w4, 18
	beq	.L742
	mov	w0, 2
	str	w0, [x22]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L720:
	add	x0, x0, 303104
	add	x0, x0, 248
	b	.L716
	.p2align 3
.L719:
	add	x0, x0, 241664
	add	x0, x0, 2280
	b	.L716
	.p2align 3
.L738:
	add	x0, x0, 245760
	ldr	w0, [x0, 3824]
	str	w0, [x22]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L733:
	ldr	x3, .LC370
	mov	w4, 5108
	ldr	x5, .LC373
	mov	w1, w4
	ldr	x2, .LC371
	add	x3, x3, 808
	bl	dprint_normal
	b	.L709
	.p2align 3
.L734:
	ldr	x3, .LC370
	mov	w4, 5109
	ldr	x5, .LC375
	b	.L731
	.p2align 3
.L735:
	ldr	x3, .LC370
	mov	w4, 5110
	ldr	x5, .LC377
	b	.L731
	.p2align 3
.L736:
	ldr	x3, .LC370
	mov	w4, 5111
	ldr	x5, .LC379
	b	.L731
	.p2align 3
.L742:
	ldr	x3, .LC370
	mov	w1, 5156
	ldr	x2, .LC382
	mov	w0, 32
	add	x3, x3, 808
	bl	dprint_normal
	b	.L709
	.p2align 3
.L739:
	ldr	x3, .LC370
	mov	w1, 5132
	ldr	x2, .LC382
	mov	w0, 32
	add	x3, x3, 808
	bl	dprint_normal
	b	.L709
	.p2align 3
.L740:
	ldr	x3, .LC370
	mov	w1, 5140
	ldr	x2, .LC382
	mov	w0, 32
	add	x3, x3, 808
	bl	dprint_normal
	b	.L709
	.p2align 3
.L741:
	ldr	x3, .LC370
	mov	w1, 5148
	ldr	x2, .LC382
	mov	w0, 32
	add	x3, x3, 808
	bl	dprint_normal
	b	.L709
	.size	VCTRL_GetChanImgNum, .-VCTRL_GetChanImgNum
	.align	3
.LC369:
	.xword	.LC16
	.align	3
.LC370:
	.xword	.LANCHOR2
	.align	3
.LC371:
	.xword	.LC18
	.align	3
.LC372:
	.xword	.LANCHOR1
	.align	3
.LC373:
	.xword	.LC160
	.align	3
.LC375:
	.xword	.LC374
	.align	3
.LC377:
	.xword	.LC376
	.align	3
.LC379:
	.xword	.LC378
	.align	3
.LC380:
	.xword	.L718
	.align	3
.LC382:
	.xword	.LC381
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanState
	.type	VCTRL_GetChanState, %function
VCTRL_GetChanState:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 3
	bhi	.L749
	ldr	x22, .LC386
	sxtw	x21, w20
	ldr	x0, [x22, w20, sxtw 3]
	cbz	x0, .L750
	cbz	x19, .L751
	ldr	x0, .LC390
	mov	x2, 100
	mov	w1, 0
	str	wzr, [x29, 68]
	stp	wzr, wzr, [x29, 60]
	ldr	x3, [x0, 96]
	mov	x0, x19
	blr	x3
	ldr	x1, [x22, w20, sxtw 3]
	mov	w0, w20
	add	x1, x1, 217088
	ldr	w2, [x1, 3872]
	str	w2, [x19, 32]
	ldr	w2, [x1, 3876]
	str	w2, [x19, 36]
	ldr	w1, [x1, 3880]
	str	w1, [x19, 44]
	bl	FSP_GetWaitDispFsNum
	str	w0, [x19, 84]
	mov	w0, w20
	bl	FSP_GetTotalDispFsNum
	str	w0, [x19, 92]
	add	x3, x29, 68
	add	x2, x29, 64
	add	x1, x29, 60
	mov	w0, w20
	bl	VCTRL_GetChanImgNum
	lsl	x0, x21, 2
	sub	x0, x0, x21
	lsl	x2, x0, 5
	add	x0, x0, x2
	add	x2, x22, 264
	ldp	w3, w1, [x29, 64]
	add	x21, x0, x21
	add	x21, x2, x21
	add	w0, w3, w1
	str	w0, [x19, 48]
	add	x1, x29, 72
	mov	w0, w20
	ldr	w2, [x21, 96]
	str	w2, [x19, 96]
	ldr	w2, [x21, 8]
	str	w2, [x19, 20]
	bl	SM_GetInfo
	ldp	w2, w4, [x29, 88]
	ldr	x3, [x22, w20, sxtw 3]
	mov	x0, 36984
	movk	x0, 0x3, lsl 16
	ldr	w1, [x29, 80]
	add	x0, x3, x0
	cmp	w4, 10
	stp	w2, w1, [x19, 52]
	cset	w1, gt
	str	w1, [x19, 80]
	ldrb	w0, [x0, 3544]
	and	w0, w0, 1
	str	w0, [x19, 88]
.L743:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L749:
	ldr	x3, .LC384
	mov	w4, 1273
	ldr	x5, .LC383
.L748:
	ldr	x2, .LC385
	add	x3, x3, 832
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L751:
	ldr	x3, .LC384
	mov	w4, 1275
	ldr	x5, .LC389
	b	.L748
	.p2align 3
.L750:
	ldr	x3, .LC384
	mov	w4, 1274
	ldr	x5, .LC387
	mov	w1, w4
	ldr	x2, .LC385
	add	x3, x3, 832
	bl	dprint_normal
	b	.L743
	.size	VCTRL_GetChanState, .-VCTRL_GetChanState
	.align	3
.LC383:
	.xword	.LC166
	.align	3
.LC384:
	.xword	.LANCHOR2
	.align	3
.LC385:
	.xword	.LC18
	.align	3
.LC386:
	.xword	.LANCHOR1
	.align	3
.LC387:
	.xword	.LC171
	.align	3
.LC389:
	.xword	.LC388
	.align	3
.LC390:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetDbgOption
	.type	VCTRL_SetDbgOption, %function
VCTRL_SetDbgOption:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, -20
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_SetDbgOption, .-VCTRL_SetDbgOption
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetLastFrameState
	.type	VCTRL_SetLastFrameState, %function
VCTRL_SetLastFrameState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 3
	bhi	.L759
	ldr	x0, .LC392
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L753
	str	w20, [x0, 140]
.L753:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L759:
	bl	VCTRL_SetLastFrameState.part.15
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetLastFrameState, .-VCTRL_SetLastFrameState
	.align	3
.LC392:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ReportLastFrame
	.type	VCTRL_ReportLastFrame, %function
VCTRL_ReportLastFrame:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	w20, w1
	mov	x0, x30
	bl	_mcount
	cbz	w20, .L767
	cmp	w20, 1
	mov	w0, 3
	mov	w1, 4
	csel	w0, w0, w1, eq
	cmp	w19, 3
	bhi	.L774
.L764:
	ldr	x1, .LC393
	ldr	x2, [x1, w19, sxtw 3]
	cbz	x2, .L765
	str	w0, [x2, 140]
.L765:
	ldr	x4, [x1, 712]
	cbz	x4, .L760
	add	x2, x29, 48
	mov	w3, 4
	mov	w1, 44
	mov	w0, w19
	str	w20, [x2, -8]!
	blr	x4
.L760:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L767:
	cmp	w19, 3
	mov	w0, 2
	bls	.L764
.L774:
	bl	VCTRL_SetLastFrameState.part.15
	ldr	x1, .LC393
	b	.L765
	.size	VCTRL_ReportLastFrame, .-VCTRL_ReportLastFrame
	.align	3
.LC393:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_OutputLastFrame
	.type	VCTRL_OutputLastFrame, %function
VCTRL_OutputLastFrame:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	cmp	w20, 3
	bhi	.L789
	ldr	x19, .LC397
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L790
	add	x0, x0, 221184
	ldr	w1, [x0, 112]
	cmp	w1, 2
	beq	.L780
	cmp	w1, 3
	beq	.L781
	cbnz	w1, .L779
	add	x0, x0, 120
	bl	H264DEC_FlushRemainImg
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
.L779:
	add	x1, x0, 112
	mov	w0, w20
	bl	SYNTAX_MarkImageEos
	cmn	w0, #1
	mov	w19, w0
	beq	.L784
.L792:
	cbnz	w0, .L791
	mov	w1, 0
	mov	w0, w20
	bl	VCTRL_ReportLastFrame
	ldr	x2, .LC402
	mov	w1, 6327
	mov	w0, 3
	bl	dprint_normal
	mov	w0, 0
.L777:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L781:
	add	x0, x0, 120
	bl	MPEG2DEC_FlushRemainImg
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	add	x1, x0, 112
	mov	w0, w20
	bl	SYNTAX_MarkImageEos
	cmn	w0, #1
	mov	w19, w0
	bne	.L792
.L784:
	mov	w0, w20
	mov	w1, 1
	bl	VCTRL_ReportLastFrame
	ldr	x2, .LC400
	mov	w1, 6322
	mov	w0, 3
	bl	dprint_normal
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L791:
	mov	w1, w0
	mov	w0, w20
	bl	VCTRL_ReportLastFrame
	ldr	x2, .LC404
	sub	w3, w19, #2
	mov	w1, 6332
	mov	w0, 3
	bl	dprint_normal
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L780:
	add	x0, x0, 120
	bl	MPEG4DEC_FlushRemainImg
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	b	.L779
	.p2align 3
.L789:
	ldr	x3, .LC395
	mov	w4, 6232
	ldr	x5, .LC394
	mov	w1, w4
	ldr	x2, .LC396
	add	x3, x3, 856
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L777
.L790:
	ldr	x3, .LC395
	mov	w4, 6233
	ldr	x5, .LC398
	mov	w1, w4
	ldr	x2, .LC396
	add	x3, x3, 856
	bl	dprint_normal
	mov	w0, -1
	b	.L777
	.size	VCTRL_OutputLastFrame, .-VCTRL_OutputLastFrame
	.align	3
.LC394:
	.xword	.LC232
	.align	3
.LC395:
	.xword	.LANCHOR2
	.align	3
.LC396:
	.xword	.LC18
	.align	3
.LC397:
	.xword	.LANCHOR1
	.align	3
.LC398:
	.xword	.LC171
	.align	3
.LC400:
	.xword	.LC399
	.align	3
.LC402:
	.xword	.LC401
	.align	3
.LC404:
	.xword	.LC403
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_PostProc
	.type	VCTRL_PostProc, %function
VCTRL_PostProc:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	w21, w1
	mov	x22, x2
	mov	w23, w3
	bl	_mcount
	ldr	x20, .LC405
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L802
	ldr	w3, [x0, 128]
	cmp	w3, 2
	beq	.L796
	cmp	w3, 3
	beq	.L797
	cbz	w3, .L803
.L793:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L797:
	add	x0, x0, 221184
	mov	w1, w21
	add	x0, x0, 120
	bl	MPEG2DEC_VDMPostProc
	ldr	x0, [x20, w19, sxtw 3]
	add	x0, x0, 221184
	ldrb	w1, [x0, 138]
	cmp	w1, 1
	beq	.L804
	str	xzr, [x0, 160]
.L807:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L803:
	add	x0, x0, 221184
	mov	w1, w21
	mov	w5, w23
	mov	w4, 0
	mov	x3, x22
	mov	w2, 1
	add	x0, x0, 120
	bl	H264DEC_VDMPostProc
	ldr	x0, [x20, w19, sxtw 3]
	add	x1, x0, 233472
	ldrb	w1, [x1, 2760]
	cmp	w1, 1
	beq	.L805
.L799:
	add	x0, x0, 221184
	str	xzr, [x0, 736]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L796:
	add	x0, x0, 221184
	mov	w1, w21
	mov	x2, x22
	add	x0, x0, 120
	bl	MPEG4DEC_VDMPostProc
	ldr	x0, [x20, w19, sxtw 3]
	add	x1, x0, 241664
	ldrb	w1, [x1, 2924]
	cmp	w1, 1
	beq	.L806
.L801:
	add	x0, x0, 221184
	str	xzr, [x0, 1160]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L806:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x20, w19, sxtw 3]
	add	x1, x0, 241664
	strb	wzr, [x1, 2924]
	b	.L801
	.p2align 3
.L804:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x20, w19, sxtw 3]
	add	x0, x0, 221184
	strb	wzr, [x0, 138]
	str	xzr, [x0, 160]
	b	.L807
	.p2align 3
.L802:
	ldr	x3, .LC407
	mov	w4, 3750
	ldr	x5, .LC406
	mov	w1, w4
	ldr	x2, .LC408
	add	x3, x3, 880
	bl	dprint_normal
	b	.L793
	.p2align 3
.L805:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x20, w19, sxtw 3]
	add	x1, x0, 233472
	strb	wzr, [x1, 2760]
	b	.L799
	.size	VCTRL_PostProc, .-VCTRL_PostProc
	.align	3
.LC405:
	.xword	.LANCHOR1
	.align	3
.LC406:
	.xword	.LC31
	.align	3
.LC407:
	.xword	.LANCHOR2
	.align	3
.LC408:
	.xword	.LC18
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_VdmPostProc
	.type	VCTRL_VdmPostProc, %function
VCTRL_VdmPostProc:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	x21, x2
	mov	w22, w3
	bl	_mcount
	cmp	w19, 3
	bhi	.L817
	ldr	x0, .LC412
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L818
	ldr	w0, [x0, 20]
	cmp	w0, 1
	beq	.L812
	ldr	x3, .LC410
	mov	w4, 4000
	ldr	x5, .LC414
.L816:
	ldr	x2, .LC411
	add	x3, x3, 896
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L808:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L812:
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbz	x0, .L808
	mov	w3, w22
	mov	x2, x21
	mov	w1, w20
	mov	w0, w19
	bl	VCTRL_PostProc
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L817:
	ldr	x3, .LC410
	mov	w4, 3998
	ldr	x5, .LC409
	b	.L816
	.p2align 3
.L818:
	ldr	x3, .LC410
	mov	w4, 3999
	ldr	x5, .LC413
	mov	w1, w4
	ldr	x2, .LC411
	add	x3, x3, 896
	bl	dprint_normal
	b	.L808
	.size	VCTRL_VdmPostProc, .-VCTRL_VdmPostProc
	.align	3
.LC409:
	.xword	.LC16
	.align	3
.LC410:
	.xword	.LANCHOR2
	.align	3
.LC411:
	.xword	.LC18
	.align	3
.LC412:
	.xword	.LANCHOR1
	.align	3
.LC413:
	.xword	.LC31
	.align	3
.LC414:
	.xword	.LC245
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ResetHardware
	.type	VCTRL_ResetHardware, %function
VCTRL_ResetHardware:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, w19
	bl	SCDDRV_ResetSCD
	mov	w0, w19
	bl	VDMDRV_ResetVDH
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_ResetHardware, .-VCTRL_ResetHardware
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_OpenHardware
	.type	VCTRL_OpenHardware, %function
VCTRL_OpenHardware:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L838
	ldr	x0, .LC419
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L839
	ldr	w1, [x0, 16]
	cmp	w1, 1
	beq	.L824
	ldr	x3, .LC417
	mov	w4, 6528
	ldr	x5, .LC423
.L837:
	ldr	x2, .LC418
	add	x3, x3, 920
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L820:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L824:
	add	x1, x29, 48
	ldr	w19, [x0, 128]
	mov	w0, 3
	str	w19, [x1, -4]!
	bl	PDT_GetAttribute
	cbnz	w0, .L820
	add	x0, x29, 36
	add	x1, x29, 40
	bl	VCTRL_GetActiveChanNum
	ldr	w0, [x29, 36]
	cbz	w0, .L840
.L826:
	ldr	w0, [x29, 40]
	cmp	w0, wzr
	ccmp	w19, 1, 0, eq
	bne	.L820
	ldr	x0, .LC424
	ldr	x1, [x0, 56]
	cbz	x1, .L820
	mov	w0, 0
	blr	x1
	b	.L820
	.p2align 3
.L838:
	ldr	x3, .LC417
	mov	w4, 6524
	ldr	x5, .LC416
	b	.L837
	.p2align 3
.L839:
	ldr	x3, .LC417
	mov	w4, 6527
	ldr	x5, .LC421
	mov	w1, w4
	ldr	x2, .LC418
	add	x3, x3, 920
	bl	dprint_normal
	b	.L820
	.p2align 3
.L840:
	ldr	x20, .LC424
	ldr	x1, [x20, 8]
	cbz	x1, .L841
	mov	w0, 0
	blr	x1
.L828:
	ldr	x1, [x20, 40]
	cbz	x1, .L842
	mov	w0, 0
	blr	x1
	b	.L826
.L841:
	mov	w3, 6402
	ldr	x2, .LC425
	mov	w1, w3
	bl	dprint_normal
	b	.L828
.L842:
	mov	w3, 6449
	ldr	x2, .LC425
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L826
	.size	VCTRL_OpenHardware, .-VCTRL_OpenHardware
	.align	3
.LC416:
	.xword	.LC415
	.align	3
.LC417:
	.xword	.LANCHOR2
	.align	3
.LC418:
	.xword	.LC18
	.align	3
.LC419:
	.xword	.LANCHOR1
	.align	3
.LC421:
	.xword	.LC420
	.align	3
.LC423:
	.xword	.LC422
	.align	3
.LC424:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC425:
	.xword	.LC50
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_StartChan
	.type	VCTRL_StartChan, %function
VCTRL_StartChan:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L855
	ldr	x20, .LC429
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L856
	ldr	w21, [x0, 16]
	cmp	w21, 1
	bne	.L857
	ldr	w0, [x0, 128]
	cmp	w0, 22
	beq	.L858
	mov	w0, w19
	bl	SM_Start
	ldr	x0, [x20, w19, sxtw 3]
	str	w21, [x0, 24]
	str	wzr, [x0, 32]
	str	w21, [x0, 124]
	ldr	x0, [x20, w19, sxtw 3]
	ldr	w1, [x0, 28]
	cbnz	w1, .L849
	ldr	x4, .LC434
	mov	x3, x20
	str	w21, [x0, 28]
	mov	x0, 0
.L852:
	ldr	x1, [x20, x0, lsl 3]
	add	x2, x3, 720
	cbz	x1, .L850
	ldr	w1, [x1, 28]
	str	w1, [x2, x0, lsl 2]
	str	w1, [x4, x0, lsl 2]
.L851:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L852
	add	x0, x20, 720
	bl	VDMDRV_SetPriority
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
.L849:
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	mov	w0, w19
	bl	VCTRL_OpenHardware
	ldr	x21, .LC435
	ldr	x0, .LC436
	mov	x2, 12
	mov	w1, 0
	ldr	x3, [x21, 96]
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 720
	ldr	x0, .LC437
	mov	w1, 0
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 2
	ldr	x0, .LC438
	mov	w1, 0
	blr	x3
	ldr	x0, .LC439
	mov	x2, 120
	ldr	x3, [x21, 96]
	mov	w1, 0
	blr	x3
	ldr	x1, [x20, w19, sxtw 3]
	mov	w2, 1
	mov	w0, 0
	str	w2, [x1, 20]
.L845:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L850:
	add	x1, x3, 720
	str	wzr, [x4, x0, lsl 2]
	str	wzr, [x1, x0, lsl 2]
	b	.L851
	.p2align 3
.L857:
	ldr	x3, .LC427
	mov	w4, 2274
	ldr	x5, .LC431
.L854:
	ldr	x2, .LC428
	add	x3, x3, 944
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L845
.L855:
	ldr	x3, .LC427
	mov	w4, 2272
	ldr	x5, .LC426
	b	.L854
.L858:
	ldr	x3, .LC427
	mov	w4, 2275
	ldr	x5, .LC433
	b	.L854
.L856:
	ldr	x3, .LC427
	mov	w4, 2273
	ldr	x5, .LC430
	mov	w1, w4
	ldr	x2, .LC428
	add	x3, x3, 944
	bl	dprint_normal
	mov	w0, -1
	b	.L845
	.size	VCTRL_StartChan, .-VCTRL_StartChan
	.align	3
.LC426:
	.xword	.LC16
	.align	3
.LC427:
	.xword	.LANCHOR2
	.align	3
.LC428:
	.xword	.LC18
	.align	3
.LC429:
	.xword	.LANCHOR1
	.align	3
.LC430:
	.xword	.LC113
	.align	3
.LC431:
	.xword	.LC260
	.align	3
.LC433:
	.xword	.LC432
	.align	3
.LC434:
	.xword	g_ChanCtx
	.align	3
.LC435:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC436:
	.xword	g_TimeRecId
	.align	3
.LC437:
	.xword	g_TimeRecTable
	.align	3
.LC438:
	.xword	g_DataRecId
	.align	3
.LC439:
	.xword	g_DataTable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CloseHardware
	.type	VCTRL_CloseHardware, %function
VCTRL_CloseHardware:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L871
	ldr	x0, .LC444
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L872
	ldr	w1, [x0, 16]
	cmp	w1, 1
	beq	.L863
	ldr	x3, .LC442
	mov	w4, 6570
	ldr	x5, .LC446
.L870:
	ldr	x2, .LC443
	add	x3, x3, 960
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L859:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L863:
	add	x1, x29, 48
	ldr	w20, [x0, 128]
	mov	w0, 3
	str	w20, [x1, -4]!
	bl	PDT_GetAttribute
	cbnz	w0, .L859
	add	x0, x29, 36
	add	x1, x29, 40
	bl	VCTRL_GetActiveChanNum
	ldr	w0, [x29, 36]
	cbz	w0, .L873
.L865:
	ldr	w0, [x29, 40]
	cmp	w0, wzr
	ccmp	w20, 1, 0, eq
	bne	.L859
	ldr	x0, .LC447
	ldr	x1, [x0, 64]
	cbz	x1, .L859
	mov	w0, 0
	blr	x1
	b	.L859
	.p2align 3
.L871:
	ldr	x3, .LC442
	mov	w4, 6566
	ldr	x5, .LC441
	b	.L870
	.p2align 3
.L872:
	ldr	x3, .LC442
	mov	w4, 6569
	ldr	x5, .LC445
	mov	w1, w4
	ldr	x2, .LC443
	add	x3, x3, 960
	bl	dprint_normal
	b	.L859
	.p2align 3
.L873:
	mov	w0, w19
	bl	SCDDRV_ResetSCD
	mov	w0, w19
	bl	VDMDRV_ResetVDH
	b	.L865
	.size	VCTRL_CloseHardware, .-VCTRL_CloseHardware
	.align	3
.LC441:
	.xword	.LC415
	.align	3
.LC442:
	.xword	.LANCHOR2
	.align	3
.LC443:
	.xword	.LC18
	.align	3
.LC444:
	.xword	.LANCHOR1
	.align	3
.LC445:
	.xword	.LC420
	.align	3
.LC446:
	.xword	.LC422
	.align	3
.LC447:
	.xword	g_vdm_hal_fun_ptr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_StopChan
	.type	VCTRL_StopChan, %function
VCTRL_StopChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L880
	ldr	x20, .LC451
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L881
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L879
	str	wzr, [x0, 20]
	str	w1, [x0, 32]
	mov	w0, w19
	bl	SM_Stop
	cbnz	w0, .L879
	mov	w1, 0
	mov	w0, w19
	bl	DeleteRawPacketInBuffer
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	ldr	x1, [x20, w19, sxtw 3]
	mov	w0, w19
	str	wzr, [x1, 32]
	bl	VCTRL_CloseHardware
	mov	w0, 0
.L876:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L879:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L880:
	ldr	x3, .LC449
	mov	w4, 2357
	ldr	x5, .LC448
	mov	w1, w4
	ldr	x2, .LC450
	add	x3, x3, 984
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L876
.L881:
	ldr	x3, .LC449
	mov	w4, 2358
	ldr	x5, .LC453
	mov	w1, w4
	ldr	x2, .LC450
	add	x3, x3, 984
	bl	dprint_normal
	mov	w0, -1
	b	.L876
	.size	VCTRL_StopChan, .-VCTRL_StopChan
	.align	3
.LC448:
	.xword	.LC16
	.align	3
.LC449:
	.xword	.LANCHOR2
	.align	3
.LC450:
	.xword	.LC18
	.align	3
.LC451:
	.xword	.LANCHOR1
	.align	3
.LC453:
	.xword	.LC452
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_StopChanWithCheck
	.type	VCTRL_StopChanWithCheck, %function
VCTRL_StopChanWithCheck:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w22, w0
	mov	x0, x30
	mov	w20, 0
	bl	_mcount
	ldr	x19, .LC454
	b	.L884
	.p2align 3
.L888:
	ldr	x1, [x19, 240]
	mov	w0, 10
	add	w20, w20, 1
	blr	x1
	cmp	w20, 50
	beq	.L886
.L884:
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
	mov	w0, w22
	bl	VCTRL_StopChan
	mov	w21, w0
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	cbnz	w21, .L888
	cmp	w20, 49
	bgt	.L886
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L886:
	ldr	x2, .LC456
	mov	w1, 2346
	mov	w0, 0
	mov	w21, -1
	bl	dprint_normal
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VCTRL_StopChanWithCheck, .-VCTRL_StopChanWithCheck
	.align	3
.LC454:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC456:
	.xword	.LC455
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ResetChanWithOption
	.type	VCTRL_ResetChanWithOption, %function
VCTRL_ResetChanWithOption:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	sxtw	x19, w0
	mov	x0, x30
	mov	x24, x1
	bl	_mcount
	ldr	x21, .LC457
	ldr	x0, [x21]
	blr	x0
	mov	w22, w0
	cmp	w19, 3
	bhi	.L900
	ldr	x20, .LC461
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L901
	ldr	x23, .LC459
	mov	w4, 2966
	ldr	x2, .LC464
	mov	w1, w4
	add	x3, x23, 1000
	mov	w0, 26
	bl	dprint_normal
	ldr	x1, [x20, w19, sxtw 3]
	mov	w0, w19
	ldr	w25, [x1, 20]
	bl	VCTRL_StopChan
	ldr	x1, [x21, 24]
	mov	w0, 4
	blr	x1
	ldr	x1, [x20, w19, sxtw 3]
	cbz	x1, .L902
	add	x1, x1, 221184
	mov	w0, w19
	add	x1, x1, 112
	bl	SYNTAX_MarkImageOutHanging
.L894:
	mov	w0, w19
	bl	FSP_ResetInstance
	ldr	x1, [x20, w19, sxtw 3]
	mov	w0, w19
	ldr	w2, [x24, 4]
	add	x1, x1, 217088
	str	w2, [x1, 3924]
	bl	VCTRL_InitSyntaxCtx
	ldr	x0, [x20, w19, sxtw 3]
	mov	x2, 456
	ldr	x3, [x21, 96]
	mov	w1, 0
	add	x0, x0, 217088
	add	x0, x0, 3400
	blr	x3
	ldr	x1, [x20, w19, sxtw 3]
	mov	x2, -1
	add	x0, x1, 217088
	str	x2, [x0, 3320]
	str	x2, [x0, 3328]
	add	x2, x1, 221184
	str	wzr, [x0, 3856]
	mov	w0, w19
	str	wzr, [x2, 80]
	str	wzr, [x1, 52]
	stp	wzr, wzr, [x1, 60]
	str	wzr, [x1, 68]
	stp	wzr, wzr, [x1, 108]
	bl	InitUsdPool
	ldr	x1, [x21, 32]
	mov	w0, 4
	blr	x1
	ldr	w0, [x24]
	cbz	w0, .L903
	cbnz	w25, .L904
.L896:
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	mov	w4, 3019
	ldr	x2, .LC467
	mov	w1, w4
	add	x3, x23, 1000
	mov	w0, 26
	bl	dprint_normal
	ldr	x0, [x21]
	blr	x0
	sub	w22, w0, w22
	lsl	x1, x19, 2
	mov	w0, 0
	sub	x1, x1, x19
	lsl	x2, x1, 5
	add	x1, x1, x2
	add	x19, x1, x19
	add	x19, x20, x19
	str	w22, [x19, 324]
.L891:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L903:
	mov	w0, w19
	bl	SM_Reset
	cbz	w25, .L896
.L904:
	mov	w0, w19
	bl	VCTRL_StartChan
	b	.L896
	.p2align 3
.L902:
	mov	w4, 2916
	ldr	x5, .LC465
	ldr	x2, .LC460
	add	x3, x23, 1032
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	b	.L894
	.p2align 3
.L900:
	ldr	x3, .LC459
	mov	w4, 2963
	ldr	x5, .LC458
	mov	w1, w4
	ldr	x2, .LC460
	add	x3, x3, 1000
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L891
.L901:
	ldr	x3, .LC459
	mov	w4, 2964
	ldr	x5, .LC462
	mov	w1, w4
	ldr	x2, .LC460
	add	x3, x3, 1000
	bl	dprint_normal
	mov	w0, -1
	b	.L891
	.size	VCTRL_ResetChanWithOption, .-VCTRL_ResetChanWithOption
	.align	3
.LC457:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC458:
	.xword	.LC166
	.align	3
.LC459:
	.xword	.LANCHOR2
	.align	3
.LC460:
	.xword	.LC18
	.align	3
.LC461:
	.xword	.LANCHOR1
	.align	3
.LC462:
	.xword	.LC171
	.align	3
.LC464:
	.xword	.LC463
	.align	3
.LC465:
	.xword	.LC31
	.align	3
.LC467:
	.xword	.LC466
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ResetChan
	.type	VCTRL_ResetChan, %function
VCTRL_ResetChan:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC468
	mov	x2, 12
	mov	w1, 0
	add	x0, x29, 32
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 32
	mov	w0, w19
	bl	VCTRL_ResetChanWithOption
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	VCTRL_ResetChan, .-VCTRL_ResetChan
	.align	3
.LC468:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CreateChan
	.type	VCTRL_CreateChan, %function
VCTRL_CreateChan:
	stp	x29, x30, [sp, -304]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w27, w0
	mov	x0, x30
	mov	x20, x1
	mov	w19, w2
	bl	_mcount
	ldr	x21, .LC469
	ldr	x0, [x21]
	blr	x0
	mov	w25, w0
	ldr	x4, [x21, 96]
	mov	x2, 40
	mov	w1, 0
	add	x0, x29, 168
	blr	x4
	ldr	x4, [x21, 96]
	mov	x2, 96
	mov	w1, 0
	add	x0, x29, 208
	blr	x4
	ldr	x4, [x21, 96]
	mov	x2, 12
	mov	w1, 0
	add	x0, x29, 104
	blr	x4
	ldr	x4, [x21, 96]
	mov	x2, 12
	mov	w1, 0
	add	x0, x29, 120
	blr	x4
	cbz	x20, .L977
	ldr	w0, [x20, 28]
	tbnz	w0, #31, .L909
	ldr	w1, [x20, 44]
	mov	w0, 262143
	cmp	w1, w0
	ble	.L909
	ldr	w0, [x20, 36]
	cmp	w0, 1
	beq	.L978
.L910:
	ldr	w0, [x20, 160]
	cmp	w0, 1
	bls	.L911
	str	wzr, [x20, 160]
.L911:
	mov	w3, w19
	add	x2, x29, 120
	mov	x1, x20
	mov	w0, w27
	stp	wzr, wzr, [x20, 172]
	bl	VCTRL_GetChanMemSize
	cbnz	w0, .L979
	ldr	x24, .LC476
	ldr	x0, [x24]
	cbz	x0, .L980
	ldr	x0, [x24, 8]
	cbz	x0, .L951
	ldr	x0, [x24, 16]
	cbz	x0, .L952
	ldr	x0, [x24, 24]
	cbz	x0, .L953
	ldr	x2, .LC478
	mov	w3, 4
	mov	w1, 2047
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
.L968:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
	.p2align 3
.L978:
	ldr	w0, [x20, 20]
	cmp	w0, wzr
	ble	.L909
	ldr	w0, [x20, 24]
	cmp	w0, wzr
	bgt	.L910
	.p2align 2
.L909:
	ldr	x3, .LC472
	mov	w1, 1777
	ldr	x2, .LC473
	mov	w0, 1
	add	x3, x3, 1064
	bl	dprint_normal
.L908:
	mov	w0, -1
	b	.L968
	.p2align 3
.L980:
	mov	w22, 0
	mov	w26, 0
.L942:
	ldr	x0, [x21]
	add	x19, x20, 64
	blr	x0
	ldr	x3, [x21, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 136
	blr	x3
	ldr	x0, [x19, 56]
	cbz	x0, .L914
	ldr	w0, [x19, 64]
	cbnz	w0, .L915
.L914:
	mov	w0, 7
	str	wzr, [x29, 164]
	bl	VFMW_GetString
	ldr	w2, [x29, 128]
	mov	w4, 1
	add	x3, x29, 136
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L981
	ldr	w0, [x29, 152]
	ldr	w2, [x29, 160]
	ldr	x1, [x29, 144]
	bl	MEM_AddMemRecord
	ldr	w0, [x29, 152]
	str	w0, [x29, 256]
	ldr	x0, [x29, 144]
	str	x0, [x29, 264]
	ldr	w0, [x29, 160]
	str	w0, [x29, 272]
	mov	w0, 1
	str	w0, [x29, 112]
.L918:
	ldr	x3, [x21, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 136
	blr	x3
	ldr	x0, [x19, 8]
	cbz	x0, .L947
	ldr	w0, [x19, 16]
	cbnz	w0, .L920
.L947:
	ldr	w0, [x20, 160]
	cmp	w0, 1
	beq	.L921
	mov	w0, 8
	str	wzr, [x29, 164]
	bl	VFMW_GetString
	ldr	w2, [x29, 120]
	mov	w4, 0
	add	x3, x29, 136
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L982
	ldr	w0, [x29, 152]
	ldr	w2, [x29, 160]
	ldr	x1, [x29, 144]
	bl	MEM_AddMemRecord
	ldr	w0, [x29, 152]
	str	w0, [x29, 208]
	ldr	x0, [x29, 144]
	str	x0, [x29, 216]
	ldr	w0, [x29, 160]
	str	w0, [x29, 224]
	mov	w0, 1
	str	w0, [x29, 104]
.L925:
	ldr	x3, [x21, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 136
	blr	x3
	ldr	x0, [x19, 32]
	cbz	x0, .L949
	ldr	w0, [x19, 40]
	cbnz	w0, .L929
.L949:
	mov	w0, 9
	str	wzr, [x29, 164]
	bl	VFMW_GetString
	ldr	w2, [x29, 124]
	add	x3, x29, 136
	mov	w4, 0
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L983
	ldr	x1, [x29, 144]
	ldr	w0, [x29, 152]
	ldr	w2, [x29, 160]
	bl	MEM_AddMemRecord
	ldr	w1, [x29, 152]
	ldr	x0, [x29, 144]
	str	w1, [x29, 232]
	ldr	w1, [x29, 160]
	str	x0, [x29, 240]
	mov	w0, 1
	str	w1, [x29, 248]
	str	w0, [x29, 108]
.L969:
	ldr	x0, [x21]
	sxtw	x23, w22
	blr	x0
	ldr	x1, [x21, 24]
	mov	w0, 0
	blr	x1
	ldr	x19, [x29, 264]
	ldr	w2, [x29, 272]
	mov	w0, 41864
	movk	w0, 0x4, lsl 16
	ldr	x3, [x21, 96]
	cmp	w2, w0
	mov	w1, 0
	csel	w2, w2, w0, ls
	str	x19, [x24, w22, sxtw 3]
	mov	x0, x19
	add	x28, x19, 217088
	blr	x3
	ldr	x3, [x21, 104]
	mov	x1, x20
	mov	x2, 184
	add	x0, x28, 3984
	blr	x3
	mov	w0, 51600
	add	x1, x19, 221184
	movk	w0, 0x7, lsl 16
	str	w0, [x28, 3884]
	str	w27, [x19, 148]
	str	w27, [x28, 3304]
	str	wzr, [x28, 3916]
	str	w22, [x19, 4]
	ldr	x2, .LC491
	ldr	w0, [x20]
	str	w0, [x19, 144]
	mov	w0, 22
	str	w0, [x19, 128]
	str	w0, [x1, 112]
	str	wzr, [x19, 36]
	ldr	w0, [x20, 180]
	str	w0, [x19, 84]
	add	x0, x19, 24576
	add	x0, x0, 2344
	ldr	w1, [x20, 172]
	str	w1, [x0, 76]
	lsl	x1, x23, 4
	str	x0, [x2, x1]
	ldr	w1, [x20, 176]
	str	w1, [x0, 80]
	add	x1, x19, 280
	mov	w0, w22
	bl	FSP_EnableInstance
	cbnz	w0, .L984
	mov	w0, w22
	bl	VCTRL_ResetChan
	ldr	w0, [x29, 104]
	str	w0, [x19, 152]
	ldr	w0, [x29, 108]
	str	w0, [x19, 156]
	ldr	w0, [x29, 112]
	str	w0, [x19, 160]
	ldr	w5, [x29, 232]
	ldr	w0, [x20, 160]
	str	w0, [x19, 56]
	add	w4, w5, 1039
	ldr	w0, [x29, 248]
	str	w5, [x19, 164]
	str	w5, [x19, 264]
	add	w5, w5, w0
	str	w0, [x19, 272]
	sub	w0, w0, #16
	add	w4, w4, w0
	ldr	w1, [x29, 256]
	and	w4, w4, -1024
	str	wzr, [x19, 176]
	stp	w0, w4, [x19, 168]
	ldr	x0, [x29, 264]
	cmp	w4, w5
	str	x0, [x19, 192]
	ldr	w0, [x29, 272]
	str	w0, [x19, 208]
	ldr	w0, [x29, 208]
	str	w0, [x19, 232]
	ldr	x0, [x29, 216]
	str	x0, [x19, 224]
	ldr	w0, [x29, 224]
	str	w0, [x19, 240]
	ldr	x0, [x29, 240]
	str	w1, [x19, 200]
	str	x0, [x19, 256]
	bhi	.L985
	add	x1, x19, 208896
	str	w22, [x19, 4]
	stp	w22, w22, [x19, 44]
	mov	w0, w22
	uxth	x26, w26
	str	w22, [x1, 2584]
	add	x24, x24, 264
	bl	SM_ClearInst
	ldr	x1, [x19, 192]
	mov	w0, w22
	add	x1, x1, 303104
	add	x1, x1, 2952
	bl	OpenUsdPool_WithMem
	mov	w1, 1
	mov	w0, w22
	str	w1, [x19, 16]
	bl	VDMDRV_ClearChanIsDec
	bl	VDMDRV_ParamInit
	ldr	x0, [x21]
	blr	x0
	str	w0, [x19, 116]
	add	x0, x26, x0, lsl 32
	str	x0, [x19, 8]
	str	wzr, [x19, 124]
	mov	w0, 0
	ldr	x1, [x21, 32]
	blr	x1
	ldr	x0, [x21]
	blr	x0
	mov	w19, w0
	lsl	x0, x23, 2
	ldr	x3, [x21, 96]
	sub	x0, x0, x23
	mov	x2, 100
	lsl	x1, x0, 5
	sub	w25, w19, w25
	add	x0, x0, x1
	mov	w1, 0
	add	x23, x0, x23
	add	x23, x24, x23
	mov	x0, x23
	blr	x3
	stp	w25, wzr, [x23, 44]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
	.p2align 3
.L921:
	str	wzr, [x29, 104]
	str	wzr, [x29, 208]
	str	xzr, [x29, 216]
	str	wzr, [x29, 224]
	b	.L925
	.p2align 3
.L915:
	ldr	x3, [x21, 104]
	mov	x2, 24
	add	x1, x20, 112
	add	x0, x29, 256
	blr	x3
	ldr	w0, [x29, 128]
	ldr	w2, [x29, 272]
	cmp	w2, w0
	blt	.L986
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_AddMemRecord
	b	.L918
	.p2align 3
.L929:
	ldr	x3, [x21, 104]
	add	x1, x20, 88
	add	x0, x29, 232
	mov	x2, 24
	blr	x3
	ldr	x1, [x29, 240]
	cbz	x1, .L934
	ldr	w0, [x29, 124]
	ldr	w2, [x29, 248]
	cmp	w2, w0
	blt	.L934
	ldr	w0, [x29, 232]
	bl	MEM_AddMemRecord
	b	.L969
	.p2align 3
.L920:
	ldr	x3, [x21, 104]
	mov	x2, 24
	mov	x1, x19
	add	x0, x29, 208
	blr	x3
	ldr	w0, [x20, 160]
	ldr	w4, [x29, 224]
	cmp	w0, 1
	beq	.L927
	ldr	w5, [x29, 120]
	cmp	w4, w5
	blt	.L987
.L927:
	ldr	w0, [x29, 208]
	mov	w2, w4
	ldr	x1, [x29, 216]
	bl	MEM_AddMemRecord
	b	.L925
	.p2align 3
.L983:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L988
.L931:
	ldr	w0, [x29, 104]
	cmp	w0, 1
	beq	.L989
.L932:
	mov	w3, 1817
	ldr	x2, .LC488
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L968
	.p2align 3
.L982:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L990
.L923:
	mov	w3, 1881
	ldr	x2, .LC484
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L968
	.p2align 3
.L984:
	ldr	x2, .LC493
	mov	w3, w22
	mov	w1, 2086
	mov	w0, 1
	bl	dprint_normal
.L939:
	mov	w0, w22
	bl	FSP_DisableInstance
	mov	w0, w22
	bl	CloseUsdPool_WithMem
	str	xzr, [x24, w22, sxtw 3]
	ldr	w3, [x19, 160]
	mov	w0, w22
	ldp	w2, w1, [x19, 152]
	stp	w2, w1, [x29, 168]
	add	x2, x19, 216
	add	x1, x19, 248
	str	w3, [x29, 176]
	add	x19, x19, 184
	stp	x2, x1, [x29, 184]
	str	x19, [x29, 200]
	bl	VDMDRV_ClearChanIsDec
	ldr	x1, [x21, 32]
	mov	w0, 0
	blr	x1
	add	x1, x29, 168
	mov	w0, w22
	bl	VCTRL_FreeChanResource
	mov	w0, -1
	b	.L968
	.p2align 3
.L985:
	ldr	x2, .LC495
	mov	w3, w22
	mov	w1, 2118
	mov	w0, 1
	bl	dprint_normal
	b	.L939
	.p2align 3
.L951:
	mov	w22, 1
	mov	w26, w22
	b	.L942
	.p2align 3
.L952:
	mov	w22, 2
	mov	w26, w22
	b	.L942
	.p2align 3
.L953:
	mov	w22, 3
	mov	w26, w22
	b	.L942
	.p2align 3
.L981:
	mov	w3, 1938
	ldr	x2, .LC480
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	b	.L908
	.p2align 3
.L934:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L991
.L936:
	ldr	w0, [x29, 104]
	cmp	w0, 1
	beq	.L992
.L937:
	mov	w3, 1845
	ldr	x2, .LC490
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	b	.L908
	.p2align 3
.L979:
	mov	w3, 2033
	ldr	x2, .LC475
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L968
	.p2align 3
.L989:
	ldr	w0, [x29, 208]
	ldr	x1, [x29, 216]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 208]
	ldr	w2, [x29, 224]
	ldr	x1, [x29, 216]
	bl	MEM_DelMemRecord
	b	.L932
.L988:
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 256]
	ldr	w2, [x29, 272]
	ldr	x1, [x29, 264]
	bl	MEM_DelMemRecord
	b	.L931
.L990:
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 256]
	ldr	w2, [x29, 272]
	ldr	x1, [x29, 264]
	bl	MEM_DelMemRecord
	b	.L923
.L986:
	mov	w3, 1954
	ldr	x2, .LC482
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	b	.L908
.L987:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L993
.L928:
	mov	w3, 1912
	ldr	x2, .LC486
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	b	.L908
.L992:
	ldr	w0, [x29, 208]
	ldr	x1, [x29, 216]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 208]
	ldr	w2, [x29, 224]
	ldr	x1, [x29, 216]
	bl	MEM_DelMemRecord
	b	.L937
.L991:
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 256]
	ldr	w2, [x29, 272]
	ldr	x1, [x29, 264]
	bl	MEM_DelMemRecord
	b	.L936
.L977:
	ldr	x2, .LC471
	mov	w1, 1757
	mov	w0, 0
	bl	dprint_normal
	b	.L908
.L993:
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 256]
	ldr	w2, [x29, 272]
	ldr	x1, [x29, 264]
	bl	MEM_DelMemRecord
	ldr	w5, [x29, 120]
	ldr	w4, [x29, 224]
	b	.L928
	.size	VCTRL_CreateChan, .-VCTRL_CreateChan
	.align	3
.LC469:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC471:
	.xword	.LC470
	.align	3
.LC472:
	.xword	.LANCHOR2
	.align	3
.LC473:
	.xword	.LC280
	.align	3
.LC475:
	.xword	.LC474
	.align	3
.LC476:
	.xword	.LANCHOR1
	.align	3
.LC478:
	.xword	.LC477
	.align	3
.LC480:
	.xword	.LC479
	.align	3
.LC482:
	.xword	.LC481
	.align	3
.LC484:
	.xword	.LC483
	.align	3
.LC486:
	.xword	.LC485
	.align	3
.LC488:
	.xword	.LC487
	.align	3
.LC490:
	.xword	.LC489
	.align	3
.LC491:
	.xword	s_SmIIS
	.align	3
.LC493:
	.xword	.LC492
	.align	3
.LC495:
	.xword	.LC494
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ConfigChan
	.type	VCTRL_ConfigChan, %function
VCTRL_ConfigChan:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w22, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w22, 3
	bhi	.L1035
	ldr	x20, .LC500
	ldr	x0, [x20, w22, sxtw 3]
	cbz	x0, .L1036
	ldr	w0, [x0, 16]
	cmp	w0, 1
	bne	.L1037
	cbz	x19, .L1038
	add	x21, x20, 736
	mov	w0, 0
	mov	x1, x21
	bl	PDT_GetAttribute
	ldr	w21, [x19, 8]
	ldr	w0, [x20, 756]
	cmp	w0, 21
	bhi	.L1001
	cmp	w0, w21
	beq	.L1002
	add	x0, x20, 760
	add	x2, x20, 884
	.p2align 2
.L1004:
	ldr	w1, [x0]
	add	x0, x0, 4
	cmp	w1, 21
	bhi	.L1001
	cmp	w1, w21
	beq	.L1002
	cmp	x2, x0
	bne	.L1004
.L1002:
	mov	x1, x19
	mov	w0, w22
	bl	VCTRL_CmpConfigParameter
	cbz	w0, .L1039
	ldr	x3, [x20, w22, sxtw 3]
	mov	x2, 80
	ldr	x23, .LC512
	mov	w1, 0
	add	x0, x29, 64
	str	w21, [x3, 128]
	ldr	w4, [x19, 24]
	str	w4, [x3, 28]
	ldr	x3, [x20, w22, sxtw 3]
	ldrsb	w4, [x19, 1]
	strb	w4, [x3]
	ldr	x3, [x23, 96]
	blr	x3
	ldr	x0, [x20, w22, sxtw 3]
	ldr	w0, [x0, 164]
	str	w0, [x29, 80]
	bl	MEM_Phy2Vir
	str	x0, [x29, 64]
	ldr	x1, [x20, w22, sxtw 3]
	mov	w0, 49152
	ldr	w2, [x19, 84]
	movk	w0, 0xf8c3, lsl 16
	ldr	w3, [x19, 8]
	ldr	w4, [x1, 168]
	cmp	w2, 1
	ldr	w5, [x19, 24]
	strb	w5, [x29, 72]
	str	w3, [x29, 76]
	str	w4, [x29, 84]
	str	w0, [x29, 88]
	beq	.L1040
	str	wzr, [x1, 120]
.L1006:
	ldr	w0, [x19, 88]
	cbz	w0, .L1007
	mov	w0, 1
	str	w0, [x29, 120]
.L1007:
	ldr	w0, [x19, 80]
	ldr	w1, [x19, 8]
	str	w0, [x29, 112]
	mov	w0, 0
	cbnz	w1, .L1008
	ldr	w0, [x19, 52]
.L1008:
	str	w0, [x29, 108]
	mov	w1, 0
	mov	x0, 0
.L1010:
	ldr	x2, [x20, x0]
	add	x0, x0, 8
	cmp	x2, xzr
	csinc	w1, w1, w1, eq
	cmp	x0, 32
	bne	.L1010
	cmp	w1, 1
	ble	.L1011
	str	wzr, [x29, 108]
.L1011:
	ldrsb	w0, [x19]
	cmp	w0, 1
	beq	.L1012
	ldr	w0, [x29, 108]
.L1013:
	str	w0, [x19, 52]
	add	x21, x19, 12
	mov	x2, 12
	mov	x1, x21
	ldr	x3, [x23, 104]
	add	x0, x29, 92
	blr	x3
	add	x1, x29, 64
	mov	w0, w22
	bl	SM_Config
	ldr	x1, [x20, w22, sxtw 3]
	mov	w4, -1
	add	x0, x1, 217088
	add	x3, x1, 221184
	ldr	w2, [x1, 200]
	str	w2, [x0, 3888]
	ldr	w2, [x1, 208]
	str	w2, [x0, 3892]
	ldr	w2, [x1, 172]
	str	w2, [x0, 3308]
	ldr	w1, [x1, 176]
	str	w1, [x0, 3312]
	ldr	w1, [x19, 28]
	str	w1, [x0, 3292]
	ldr	w1, [x19, 28]
	str	w1, [x0, 3288]
	ldr	w1, [x19, 36]
	str	w1, [x0, 3296]
	ldr	w1, [x19, 40]
	str	w1, [x0, 3300]
	ldr	w1, [x19, 72]
	cmp	w1, 1
	cset	w1, eq
	str	w1, [x0, 3928]
	ldr	w1, [x19, 76]
	str	w1, [x0, 3932]
	ldr	w1, [x19, 48]
	str	w1, [x0, 3936]
	ldr	w1, [x19, 52]
	str	w1, [x0, 3940]
	ldr	w1, [x19, 132]
	str	w1, [x0, 3944]
	str	wzr, [x3, 80]
	str	wzr, [x3, 92]
	str	wzr, [x0, 3948]
	str	wzr, [x0, 3952]
	ldr	w1, [x19, 152]
	str	w1, [x3, 104]
	ldr	w1, [x19, 56]
	str	w1, [x0, 3128]
	str	wzr, [x0, 3904]
	str	w4, [x0, 3908]
	str	w4, [x0, 3912]
	ldr	w1, [x19, 104]
	cmp	w1, wzr
	ble	.L1014
	ldr	w2, [x19, 108]
	cmp	w2, wzr
	ble	.L1014
	str	w1, [x0, 3176]
	ldr	w1, [x19, 108]
	str	w1, [x0, 3180]
.L1015:
	ldr	x0, [x20, w22, sxtw 3]
	mov	x2, 156
	ldr	x3, [x23, 104]
	mov	x1, x19
	add	x0, x0, 217088
	add	x0, x0, 3072
	blr	x3
	ldr	x0, [x20, w22, sxtw 3]
	mov	x2, 12
	ldr	x3, [x23, 104]
	mov	x1, x21
	add	x0, x0, 217088
	add	x0, x0, 3860
	blr	x3
	ldr	x1, [x20, w22, sxtw 3]
	add	x0, x1, 221184
	ldr	w2, [x1, 128]
	ldr	w3, [x0, 112]
	cmp	w3, w2
	beq	.L1016
	mov	w0, w22
	bl	VCTRL_ResetChan
	ldr	x1, [x20, w22, sxtw 3]
	add	x0, x1, 221184
	ldr	w2, [x1, 128]
.L1016:
	add	x5, x1, 217088
	str	w2, [x0, 112]
	ldr	x4, .LC513
	mov	x3, x20
	mov	x0, 0
	ldrsb	w2, [x5, 3072]
	str	w2, [x1, 288]
.L1019:
	ldr	x1, [x20, x0, lsl 3]
	add	x2, x3, 888
	cbz	x1, .L1017
	ldr	w1, [x1, 28]
	str	w1, [x2, x0, lsl 2]
	str	w1, [x4, x0, lsl 2]
.L1018:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L1019
	add	x0, x20, 888
	bl	VDMDRV_SetPriority
	mov	w0, w22
	bl	VDMDRV_ClearChanIsDec
	mov	w0, 0
.L1031:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1039:
	ldr	x3, .LC498
	mov	w1, 2680
	ldr	x2, .LC511
	add	x3, x3, 1088
	bl	dprint_normal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, 0
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1017:
	add	x1, x3, 888
	str	wzr, [x4, x0, lsl 2]
	str	wzr, [x1, x0, lsl 2]
	b	.L1018
	.p2align 3
.L1001:
	ldr	x2, .LC507
	mov	w3, w21
	mov	w1, 2476
	mov	w0, 0
	bl	dprint_normal
	ldr	x3, .LC498
	mov	w1, 2672
	ldr	x2, .LC509
	mov	w0, 0
	add	x3, x3, 1088
	bl	dprint_normal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, -1
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1014:
	mov	w2, 1920
	mov	w1, 1088
	str	w2, [x0, 3176]
	str	w1, [x0, 3180]
	b	.L1015
	.p2align 3
.L1012:
	mov	w0, 0
	str	wzr, [x29, 108]
	b	.L1013
	.p2align 3
.L1040:
	ldp	w4, w3, [x19, 92]
	ldr	w0, [x19, 136]
	str	w0, [x1, 120]
	str	w2, [x29, 116]
	stp	w4, w3, [x29, 124]
	b	.L1006
.L1037:
	ldr	x3, .LC498
	mov	w4, 2663
	ldr	x5, .LC503
.L1033:
	ldr	x2, .LC499
	add	x3, x3, 1088
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1031
.L1035:
	ldr	x3, .LC498
	mov	w4, 2661
	ldr	x5, .LC497
	b	.L1033
.L1038:
	ldr	x3, .LC498
	mov	w4, 2664
	ldr	x5, .LC505
	b	.L1033
.L1036:
	ldr	x3, .LC498
	mov	w4, 2662
	ldr	x5, .LC501
	mov	w1, w4
	ldr	x2, .LC499
	add	x3, x3, 1088
	bl	dprint_normal
	mov	w0, -1
	b	.L1031
	.size	VCTRL_ConfigChan, .-VCTRL_ConfigChan
	.align	3
.LC497:
	.xword	.LC16
	.align	3
.LC498:
	.xword	.LANCHOR2
	.align	3
.LC499:
	.xword	.LC18
	.align	3
.LC500:
	.xword	.LANCHOR1
	.align	3
.LC501:
	.xword	.LC31
	.align	3
.LC503:
	.xword	.LC502
	.align	3
.LC505:
	.xword	.LC504
	.align	3
.LC507:
	.xword	.LC506
	.align	3
.LC509:
	.xword	.LC508
	.align	3
.LC511:
	.xword	.LC510
	.align	3
.LC512:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC513:
	.xword	g_ChanCtx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DestroyChan
	.type	VCTRL_DestroyChan, %function
VCTRL_DestroyChan:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC517
	ldr	x0, [x20]
	blr	x0
	mov	w23, w0
	ldr	x1, [x20, 24]
	mov	w0, 0
	blr	x1
	cmp	w19, 3
	bhi	.L1052
	ldr	x22, .LC522
	ldr	x0, [x22, w19, sxtw 3]
	cbz	x0, .L1053
	ldr	w21, [x0, 16]
	cmp	w21, 1
	bne	.L1054
	str	wzr, [x0, 20]
	mov	w0, 0
	ldr	x1, [x20, 32]
	blr	x1
	mov	w0, w19
	bl	SCDDRV_IsChanDec
	cbnz	w0, .L1055
.L1046:
	ldr	x1, [x20, 24]
	mov	w0, 0
	blr	x1
	ldr	x1, [x20, 24]
	mov	w0, 4
	blr	x1
	mov	w0, w19
	bl	VCTRL_StopChan
	ldr	x1, [x20, 32]
	cbnz	w0, .L1056
	mov	w0, 4
	sxtw	x21, w19
	blr	x1
	mov	w0, w19
	bl	VCTRL_ResetChan
	ldr	x1, [x20, 24]
	mov	w0, 4
	blr	x1
	mov	w0, w19
	bl	FSP_DisableInstance
	mov	w0, w19
	bl	CloseUsdPool_WithMem
	ldr	x1, [x22, w19, sxtw 3]
	lsl	x2, x21, 4
	ldr	x3, .LC527
	mov	w0, w19
	add	x5, x1, 216
	str	xzr, [x22, w19, sxtw 3]
	add	x22, x22, 264
	str	xzr, [x3, x2]
	add	x2, x1, 248
	ldp	w3, w4, [x1, 156]
	stp	w3, w4, [x29, 92]
	ldr	w4, [x1, 152]
	add	x1, x1, 184
	stp	x5, x2, [x29, 104]
	str	w4, [x29, 88]
	str	x1, [x29, 120]
	bl	VDMDRV_ClearChanIsDec
	mov	w0, w19
	bl	SCDDRV_ResetSCD
	mov	w0, w19
	bl	VDMDRV_ResetVDH
	ldr	x1, [x20, 32]
	mov	w0, 4
	blr	x1
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	ldr	x2, [x20, 48]
	mov	w1, w19
	mov	w0, 1
	blr	x2
	ldr	x0, [x20]
	blr	x0
	mov	w25, w0
	add	x1, x29, 88
	mov	w0, w19
	bl	VCTRL_FreeChanResource
	ldr	x0, [x20]
	blr	x0
	mov	w24, w0
	ldr	x2, [x20, 56]
	mov	w1, w19
	mov	w0, 1
	sub	w24, w24, w25
	blr	x2
	ldr	x0, [x20]
	blr	x0
	sub	w23, w0, w23
	lsl	x1, x21, 2
	mov	w0, 0
	sub	x1, x1, x21
	lsl	x2, x1, 5
	add	x1, x1, x2
	add	x21, x1, x21
	add	x21, x22, x21
	stp	w23, w24, [x21, 52]
.L1043:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L1055:
	mov	w0, w19
	ldr	x24, [x20, 264]
	bl	SCDDRV_IsChanDec
	cmp	w0, wzr
	mov	w2, 500
	cset	w1, eq
	mov	w0, w21
	blr	x24
	b	.L1046
	.p2align 3
.L1054:
	ldr	x3, .LC519
	mov	w4, 2196
	ldr	x5, .LC526
	mov	w1, w4
	ldr	x2, .LC521
	add	x3, x3, 1112
	mov	w0, 0
.L1051:
	bl	dprint_normal
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, -1
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L1056:
	mov	w0, 4
	blr	x1
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	mov	w0, -1
	b	.L1043
	.p2align 3
.L1052:
	ldr	x3, .LC519
	mov	w4, 2182
	ldr	x5, .LC518
	mov	w1, w4
	ldr	x2, .LC521
	add	x3, x3, 1112
	mov	w0, 0
	b	.L1051
.L1053:
	ldr	x3, .LC519
	mov	w4, 2189
	ldr	x5, .LC524
	mov	w1, w4
	ldr	x2, .LC521
	add	x3, x3, 1112
	b	.L1051
	.size	VCTRL_DestroyChan, .-VCTRL_DestroyChan
	.align	3
.LC517:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC518:
	.xword	.LC16
	.align	3
.LC519:
	.xword	.LANCHOR2
	.align	3
.LC521:
	.xword	.LC520
	.align	3
.LC522:
	.xword	.LANCHOR1
	.align	3
.LC524:
	.xword	.LC523
	.align	3
.LC526:
	.xword	.LC525
	.align	3
.LC527:
	.xword	s_SmIIS
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_EnableEsBuf
	.type	VCTRL_EnableEsBuf, %function
VCTRL_EnableEsBuf:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC529
	mov	w1, 1
	add	x0, x0, 904
	str	w1, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_EnableEsBuf, .-VCTRL_EnableEsBuf
	.align	3
.LC529:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DisableEsBuf
	.type	VCTRL_DisableEsBuf, %function
VCTRL_DisableEsBuf:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC531
	add	x0, x0, 904
	str	wzr, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_DisableEsBuf, .-VCTRL_DisableEsBuf
	.align	3
.LC531:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IfNoGapEnable
	.type	VCTRL_IfNoGapEnable, %function
VCTRL_IfNoGapEnable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC533
	ldr	x0, [x0, w19, sxtw 3]
	ldr	x19, [sp, 16]
	add	x0, x0, 217088
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 3156]
	cmp	w0, 1
	cset	w0, eq
	ret
	.size	VCTRL_IfNoGapEnable, .-VCTRL_IfNoGapEnable
	.align	3
.LC533:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IfEsBufEnable
	.type	VCTRL_IfEsBufEnable, %function
VCTRL_IfEsBufEnable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC534
	add	x0, x0, 904
	ldr	w0, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_IfEsBufEnable, .-VCTRL_IfEsBufEnable
	.align	3
.LC534:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanCrcMode
	.type	VCTRL_GetChanCrcMode, %function
VCTRL_GetChanCrcMode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC536
	ldr	x0, [x0, w19, sxtw 3]
	ldr	x19, [sp, 16]
	add	x0, x0, 217088
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 3116]
	ret
	.size	VCTRL_GetChanCrcMode, .-VCTRL_GetChanCrcMode
	.align	3
.LC536:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetChanWaitFsFlag
	.type	VCTRL_SetChanWaitFsFlag, %function
VCTRL_SetChanWaitFsFlag:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x0, .LC537
	ldr	x0, [x0, w20, sxtw 3]
	add	x0, x0, 221184
	str	w19, [x0, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetChanWaitFsFlag, .-VCTRL_SetChanWaitFsFlag
	.align	3
.LC537:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_BindRequireMem
	.type	VCTRL_BindRequireMem, %function
VCTRL_BindRequireMem:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L1071
	ldr	x21, .LC541
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L1072
	cbz	x20, .L1073
	ldr	x4, [x20, 64]
	ldr	x5, [x0, 8]
	and	x0, x4, -4294901761
	cmp	x0, x5
	bne	.L1074
	mov	x1, x20
	mov	w0, w19
	bl	FSP_BindRequireFs
	mov	w20, w0
	cbz	w0, .L1075
.L1069:
	cmp	w20, wzr
	csetm	w0, ne
.L1065:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1075:
	ldr	x1, [x21, w19, sxtw 3]
	ldr	w1, [x1, 124]
	cmp	w1, 1
	bne	.L1069
	ldr	x1, .LC547
	ldr	x1, [x1, 256]
	blr	x1
	ldr	x0, [x21, w19, sxtw 3]
	str	wzr, [x0, 124]
	b	.L1069
	.p2align 3
.L1074:
	ldr	x3, .LC539
	mov	w1, 6654
	ldr	x2, .LC546
	mov	w0, 1
	add	x3, x3, 1136
	bl	dprint_normal
	mov	w0, -1
	b	.L1065
	.p2align 3
.L1071:
	ldr	x3, .LC539
	mov	w4, 6644
	ldr	x5, .LC538
.L1070:
	ldr	x2, .LC540
	add	x3, x3, 1136
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1065
.L1073:
	ldr	x3, .LC539
	mov	w4, 6646
	ldr	x5, .LC544
	b	.L1070
.L1072:
	ldr	x3, .LC539
	mov	w4, 6645
	ldr	x5, .LC542
	mov	w1, w4
	ldr	x2, .LC540
	add	x3, x3, 1136
	bl	dprint_normal
	mov	w0, -1
	b	.L1065
	.size	VCTRL_BindRequireMem, .-VCTRL_BindRequireMem
	.align	3
.LC538:
	.xword	.LC232
	.align	3
.LC539:
	.xword	.LANCHOR2
	.align	3
.LC540:
	.xword	.LC18
	.align	3
.LC541:
	.xword	.LANCHOR1
	.align	3
.LC542:
	.xword	.LC171
	.align	3
.LC544:
	.xword	.LC543
	.align	3
.LC546:
	.xword	.LC545
	.align	3
.LC547:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetFrameBufferMode
	.type	VCTRL_SetFrameBufferMode, %function
VCTRL_SetFrameBufferMode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 3
	bhi	.L1080
	ldr	x0, .LC551
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1081
	mov	w1, w20
	mov	w0, w19
	bl	FSP_SetFrameBufferMode
	cmp	w0, wzr
	csetm	w0, ne
.L1078:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1080:
	ldr	x3, .LC549
	mov	w4, 6676
	ldr	x5, .LC548
	mov	w1, w4
	ldr	x2, .LC550
	add	x3, x3, 1160
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1078
.L1081:
	ldr	x3, .LC549
	mov	w4, 6677
	ldr	x5, .LC552
	mov	w1, w4
	ldr	x2, .LC550
	add	x3, x3, 1160
	bl	dprint_normal
	mov	w0, -1
	b	.L1078
	.size	VCTRL_SetFrameBufferMode, .-VCTRL_SetFrameBufferMode
	.align	3
.LC548:
	.xword	.LC232
	.align	3
.LC549:
	.xword	.LANCHOR2
	.align	3
.LC550:
	.xword	.LC18
	.align	3
.LC551:
	.xword	.LANCHOR1
	.align	3
.LC552:
	.xword	.LC179
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_BindExternBuffer
	.type	VCTRL_BindExternBuffer, %function
VCTRL_BindExternBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 3
	bhi	.L1094
	ldr	x0, .LC556
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L1095
	cbz	x19, .L1096
	mov	w0, w20
	mov	x1, x19
	bl	FSP_BindExternFs
	mov	w20, w0
	cbz	w0, .L1097
.L1088:
	cmp	w20, wzr
	csetm	w0, ne
.L1084:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1097:
	ldr	w0, [x19, 32]
	add	x19, x19, 152
	ldr	w2, [x19, -96]
	ldr	x1, [x19, -112]
	bl	MEM_AddMemRecord
	ldr	w3, [x19, 32]
	cbz	w3, .L1088
	ldr	x0, [x19, 40]
	cbnz	x0, .L1088
	ldr	x2, .LC561
	mov	w1, 6705
	bl	dprint_normal
	b	.L1088
	.p2align 3
.L1094:
	ldr	x3, .LC554
	mov	w4, 6690
	ldr	x5, .LC553
.L1093:
	ldr	x2, .LC555
	add	x3, x3, 1192
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1084
.L1096:
	ldr	x3, .LC554
	mov	w4, 6692
	ldr	x5, .LC559
	b	.L1093
.L1095:
	ldr	x3, .LC554
	mov	w4, 6691
	ldr	x5, .LC557
	mov	w1, w4
	ldr	x2, .LC555
	add	x3, x3, 1192
	bl	dprint_normal
	mov	w0, -1
	b	.L1084
	.size	VCTRL_BindExternBuffer, .-VCTRL_BindExternBuffer
	.align	3
.LC553:
	.xword	.LC232
	.align	3
.LC554:
	.xword	.LANCHOR2
	.align	3
.LC555:
	.xword	.LC18
	.align	3
.LC556:
	.xword	.LANCHOR1
	.align	3
.LC557:
	.xword	.LC179
	.align	3
.LC559:
	.xword	.LC558
	.align	3
.LC561:
	.xword	.LC560
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_UnBindExternBuffer
	.type	VCTRL_UnBindExternBuffer, %function
VCTRL_UnBindExternBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 3
	bhi	.L1108
	ldr	x0, .LC565
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L1109
	cbz	x19, .L1110
	mov	x1, x19
	mov	w0, w20
	add	x19, x19, 152
	bl	FSP_UnBindExternFs
	mov	w20, w0
	ldr	w2, [x19, -96]
	ldr	w0, [x19, -120]
	ldr	x1, [x19, -112]
	bl	MEM_DelMemRecord
	ldr	w3, [x19, 32]
	cbnz	w3, .L1111
.L1103:
	cmp	w20, wzr
	csetm	w0, ne
.L1100:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1111:
	ldr	x0, [x19, 40]
	cbnz	x0, .L1103
	ldr	x2, .LC568
	mov	w1, 6731
	bl	dprint_normal
	b	.L1103
	.p2align 3
.L1108:
	ldr	x3, .LC563
	mov	w4, 6718
	ldr	x5, .LC562
.L1107:
	ldr	x2, .LC564
	add	x3, x3, 1216
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1100
.L1110:
	ldr	x3, .LC563
	mov	w4, 6720
	ldr	x5, .LC567
	b	.L1107
.L1109:
	ldr	x3, .LC563
	mov	w4, 6719
	ldr	x5, .LC566
	mov	w1, w4
	ldr	x2, .LC564
	add	x3, x3, 1216
	bl	dprint_normal
	mov	w0, -1
	b	.L1100
	.size	VCTRL_UnBindExternBuffer, .-VCTRL_UnBindExternBuffer
	.align	3
.LC562:
	.xword	.LC232
	.align	3
.LC563:
	.xword	.LANCHOR2
	.align	3
.LC564:
	.xword	.LC18
	.align	3
.LC565:
	.xword	.LANCHOR1
	.align	3
.LC566:
	.xword	.LC179
	.align	3
.LC567:
	.xword	.LC558
	.align	3
.LC568:
	.xword	.LC560
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetFrameBufferNum
	.type	VCTRL_SetFrameBufferNum, %function
VCTRL_SetFrameBufferNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 3
	bhi	.L1115
	mov	w1, w20
	mov	w0, w19
	bl	FSP_SetDispFsNum
	cmp	w0, wzr
	csetm	w0, ne
.L1114:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1115:
	ldr	x3, .LC570
	mov	w4, 6741
	ldr	x5, .LC569
	mov	w1, w4
	ldr	x2, .LC571
	add	x3, x3, 1248
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1114
	.size	VCTRL_SetFrameBufferNum, .-VCTRL_SetFrameBufferNum
	.align	3
.LC569:
	.xword	.LC232
	.align	3
.LC570:
	.xword	.LANCHOR2
	.align	3
.LC571:
	.xword	.LC18
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetOccupiedNum
	.type	VCTRL_GetOccupiedNum, %function
VCTRL_GetOccupiedNum:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w21, w1
	mov	w20, w2
	bl	_mcount
	ldr	x3, .LC572
	add	x1, x29, 56
	mov	w0, 2
	ldr	x2, [x3, w19, sxtw 3]
	ldr	w4, [x2, 128]
	ldr	w3, [x2, 148]
	ldr	w2, [x2, 120]
	stp	w2, w21, [x29, 56]
	stp	w20, w4, [x29, 64]
	str	w3, [x29, 72]
	bl	PDT_GetAttribute
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.size	VCTRL_GetOccupiedNum, .-VCTRL_GetOccupiedNum
	.align	3
.LC572:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetExtraFrameNum
	.type	VCTRL_GetExtraFrameNum, %function
VCTRL_GetExtraFrameNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC573
	ldr	x0, [x0, w19, sxtw 3]
	ldr	x19, [sp, 16]
	add	x0, x0, 217088
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 3172]
	ret
	.size	VCTRL_GetExtraFrameNum, .-VCTRL_GetExtraFrameNum
	.align	3
.LC573:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IsSupport4KStd
	.type	VCTRL_IsSupport4KStd, %function
VCTRL_IsSupport4KStd:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sub	w0, w19, #16
	cmp	w0, 2
	bls	.L1120
	cmp	w19, wzr
	ldr	x19, [sp, 16]
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1120:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_IsSupport4KStd, .-VCTRL_IsSupport4KStd
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IsResolutionValid
	.type	VCTRL_IsResolutionValid, %function
VCTRL_IsResolutionValid:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	w21, w2
	bl	_mcount
	cmp	w19, 3
	bhi	.L1132
	ldr	x0, .LC577
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L1133
	mul	w0, w20, w21
	cmp	w0, 1023
	ble	.L1134
	add	x2, x1, 217088
	ldr	w3, [x2, 3176]
	cmp	w3, wzr
	ble	.L1126
	ldr	w4, [x2, 3180]
	cmp	w4, wzr
	ble	.L1126
	mul	w2, w3, w4
	cmp	w0, w2
	bgt	.L1135
.L1126:
	cmp	w0, 2088960
	mov	w0, 1
	ble	.L1123
	ldr	w3, [x1, 128]
	and	w1, w3, -3
	cmp	w1, 16
	beq	.L1123
	cmp	w3, 17
	ccmp	w3, wzr, 4, ne
	beq	.L1123
	ldr	x2, .LC584
	mov	w5, w21
	mov	w4, w20
	mov	w1, 6804
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
.L1123:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1132:
	ldr	x3, .LC575
	mov	w4, 6780
	ldr	x5, .LC574
.L1131:
	ldr	x2, .LC576
	add	x3, x3, 1272
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1133:
	ldr	x3, .LC575
	mov	w4, 6781
	ldr	x5, .LC578
	b	.L1131
	.p2align 3
.L1134:
	mov	w4, 32
	ldr	x2, .LC580
	mov	w6, w21
	mov	w5, w20
	mov	w3, w4
	mov	w1, 6788
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	b	.L1123
	.p2align 3
.L1135:
	ldr	x2, .LC582
	mov	w6, w21
	mov	w5, w20
	mov	w1, 6796
	mov	w0, 32
	bl	dprint_normal
	mov	w0, 0
	b	.L1123
	.size	VCTRL_IsResolutionValid, .-VCTRL_IsResolutionValid
	.align	3
.LC574:
	.xword	.LC232
	.align	3
.LC575:
	.xword	.LANCHOR2
	.align	3
.LC576:
	.xword	.LC18
	.align	3
.LC577:
	.xword	.LANCHOR1
	.align	3
.LC578:
	.xword	.LC179
	.align	3
.LC580:
	.xword	.LC579
	.align	3
.LC582:
	.xword	.LC581
	.align	3
.LC584:
	.xword	.LC583
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_RecordPosTime
	.type	VCTRL_RecordPosTime, %function
VCTRL_RecordPosTime:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC585
	ldr	w1, [x0, 920]
	cmp	w1, 1
	beq	.L1142
.L1136:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1142:
	cmp	w19, 11
	bhi	.L1143
	ldr	x22, .LC589
	uxtw	x21, w19
	ldrb	w1, [x22, x21]
	cmp	w1, 14
	mov	w20, w1
	bhi	.L1144
.L1140:
	cmp	w19, 10
	beq	.L1145
.L1141:
	ldr	x0, .LC590
	ldr	x0, [x0, 8]
	blr	x0
	lsl	x1, x21, 4
	ldr	x3, .LC591
	sub	x1, x1, x21
	ldrb	w2, [x22, x21]
	add	x1, x1, x20, sxtw
	add	w2, w2, 1
	strb	w2, [x22, x21]
	str	w0, [x3, x1, lsl 2]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1144:
	strb	wzr, [x22, x21]
	mov	w20, 0
	b	.L1140
	.p2align 3
.L1145:
	mov	w1, 1
	strb	w1, [x0, 924]
	b	.L1141
	.p2align 3
.L1143:
	ldr	x3, .LC586
	mov	w4, 6876
	ldr	x2, .LC588
	mov	w5, w19
	add	x3, x3, 1296
	mov	w1, w4
	mov	w0, 32
	bl	dprint_normal
	b	.L1136
	.size	VCTRL_RecordPosTime, .-VCTRL_RecordPosTime
	.align	3
.LC585:
	.xword	.LANCHOR1
	.align	3
.LC586:
	.xword	.LANCHOR2
	.align	3
.LC588:
	.xword	.LC587
	.align	3
.LC589:
	.xword	g_TimeRecId
	.align	3
.LC590:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC591:
	.xword	g_TimeRecTable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_RunProcess
	.type	VCTRL_RunProcess, %function
VCTRL_RunProcess:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	bl	VCTRL_RecordPosTime
	ldr	x20, .LC592
	ldrb	w0, [x20, 924]
	cmp	w0, 1
	beq	.L1150
.L1147:
	ldr	x21, .LC593
	mov	w2, 100
	mov	w0, 0
	str	w2, [x20, 56]
	mov	w19, 0
	ldr	x1, [x21, 24]
	blr	x1
	bl	SM_Wakeup
	mov	w0, 101
	str	w0, [x20, 56]
	bl	VCTRL_DecSyntax
	mov	w23, w0
	mov	w0, 102
	str	w0, [x20, 56]
	bl	VDMDRV_WakeUpVdm
.L1148:
	mov	w0, w19
	mov	w1, 0
	add	w19, w19, 1
	bl	DeleteRawPacketInBuffer
	cmp	w19, 4
	bne	.L1148
	ldr	x1, [x21, 32]
	mov	w0, 0
	blr	x1
	mov	w1, 105
	mov	w0, 1
	str	w1, [x20, 56]
	bl	VCTRL_RecordPosTime
	ldr	x3, [x21, 264]
	mov	w2, 10
	mov	w1, 0
	mov	w0, 0
	blr	x3
	mov	w0, w23
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1150:
	mov	w0, 11
	bl	VCTRL_RecordPosTime
	strb	wzr, [x20, 924]
	b	.L1147
	.size	VCTRL_RunProcess, .-VCTRL_RunProcess
	.align	3
.LC592:
	.xword	.LANCHOR1
	.align	3
.LC593:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DecodeThread
	.type	VCTRL_DecodeThread, %function
VCTRL_DecodeThread:
.L1152:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x0, x30
	mov	w21, 2
	mov	w24, 1
	mov	w22, 5
	bl	_mcount
	ldr	x20, .LC595
	ldr	x23, .LC596
	ldr	w0, [x20, 40]
.L1157:
	cmp	w0, 2
	str	w21, [x20, 36]
	bne	.L1177
	b	.L1153
	.p2align 3
.L1180:
	str	w21, [x20, 56]
	bl	VCTRL_RunProcess
	ldr	w0, [x20, 40]
	cmp	w0, 2
	beq	.L1153
.L1177:
	cmp	w0, 3
	bne	.L1180
.L1154:
	str	wzr, [x20, 36]
	mov	w0, 6
	str	w0, [x20, 56]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1153:
	str	w24, [x20, 36]
	str	w22, [x20, 56]
	.p2align 2
.L1159:
	ldr	x1, [x23, 240]
	mov	w0, 10
	blr	x1
	str	w22, [x20, 56]
	ldr	w0, [x20, 40]
	cmp	w0, 1
	beq	.L1157
	cmp	w0, 3
	bne	.L1159
	b	.L1154
	.size	VCTRL_DecodeThread, .-VCTRL_DecodeThread
	.align	3
.LC595:
	.xword	.LANCHOR1
	.align	3
.LC596:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CloseDrivers
	.type	VCTRL_CloseDrivers, %function
VCTRL_CloseDrivers:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	VCTRL_DeinitVdmHal
	mov	x0, x19
	bl	VCTRL_DeinitScdHal
	mov	x0, x19
	bl	VCTRL_UnmapVdmRegister
	bl	VCTRL_UnregisterInterrupt
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_CloseDrivers, .-VCTRL_CloseDrivers
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_OpenDrivers
	.type	VCTRL_OpenDrivers, %function
VCTRL_OpenDrivers:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	VCTRL_MapVdmRegister
	cbnz	w0, .L1191
	mov	x0, x19
	bl	VCTRL_InitVdmHal
	cbnz	w0, .L1192
	mov	x0, x19
	bl	VCTRL_InitScdHal
	cbnz	w0, .L1193
	bl	VCTRL_RegisterInterrupt
	cbnz	w0, .L1194
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1191:
	ldr	x3, .LC598
	mov	w4, 6968
.L1190:
	ldr	x2, .LC600
	mov	w1, w4
	add	x3, x3, 1320
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x19
	bl	VCTRL_CloseDrivers
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1192:
	ldr	x3, .LC598
	mov	w4, 6973
	b	.L1190
	.p2align 3
.L1193:
	ldr	x3, .LC598
	mov	w4, 6978
	b	.L1190
	.p2align 3
.L1194:
	ldr	x3, .LC598
	mov	w4, 6983
	b	.L1190
	.size	VCTRL_OpenDrivers, .-VCTRL_OpenDrivers
	.align	3
.LC598:
	.xword	.LANCHOR2
	.align	3
.LC600:
	.xword	.LC599
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CloseVfmw
	.type	VCTRL_CloseVfmw, %function
VCTRL_CloseVfmw:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC601
	ldr	w0, [x20, 32]
	cmp	w0, 1
	bne	.L1202
	mov	x19, 0
.L1198:
	ldr	x1, [x20, x19, lsl 3]
	mov	w0, w19
	add	x19, x19, 1
	cbz	x1, .L1197
	bl	VCTRL_DestroyChan
.L1197:
	cmp	x19, 4
	bne	.L1198
	bl	FSP_Exit
	ldr	w1, [x20, 36]
	mov	w2, 3
	str	w2, [x20, 40]
	cbz	w1, .L1200
	ldr	x21, .LC602
	mov	w0, 10
	mov	w19, 49
	ldr	x1, [x21, 240]
	blr	x1
	b	.L1201
	.p2align 3
.L1212:
	ldr	x1, [x21, 240]
	blr	x1
	subs	w19, w19, #1
	beq	.L1200
.L1201:
	ldr	w1, [x20, 36]
	mov	w0, 10
	cbnz	w1, .L1212
.L1200:
	add	x0, x20, 64
	bl	VCTRL_CloseDrivers
	str	wzr, [x20, 32]
	mov	w0, 0
.L1211:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1202:
	mov	w0, -1
	b	.L1211
	.size	VCTRL_CloseVfmw, .-VCTRL_CloseVfmw
	.align	3
.LC601:
	.xword	.LANCHOR1
	.align	3
.LC602:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_OpenVfmw
	.type	VCTRL_OpenVfmw, %function
VCTRL_OpenVfmw:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	bl	_mcount
	cbz	x22, .L1243
	ldr	x20, .LC608
	mov	x2, 8
	mov	w1, 0
	add	x0, x29, 64
	ldr	x3, [x20, 96]
	blr	x3
	ldr	x19, .LC609
	ldr	w21, [x19, 32]
	cbnz	w21, .L1234
	add	x23, x19, 928
	ldr	x2, [x20, 160]
	mov	w1, 1024
	mov	x0, x23
	str	xzr, [x29, 72]
	blr	x2
	ldr	x1, .LC611
	mov	x0, x23
	ldr	x2, [x20, 192]
	blr	x2
	str	x0, [x29, 72]
	cbz	x0, .L1217
	ldr	x1, .LC613
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1236
	ldr	x1, .LC615
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1244
	ldr	x3, [x20, 168]
	mov	x1, 0
	mov	w2, 0
	blr	x3
	mov	w3, w0
	str	w0, [x19, 680]
	add	w0, w3, 4096
	mov	w1, 10000
	add	w0, w0, 904
	cmp	w0, w1
	bhi	.L1222
.L1250:
	mov	w1, 5000
	mov	w0, -5000
	cmp	w3, w1
	csel	w3, w3, w1, le
	cmp	w3, w0
	csel	w3, w3, w0, ge
.L1218:
	str	w3, [x19, 680]
.L1220:
	add	x23, x19, 928
	ldr	x2, [x20, 160]
	mov	w1, 1024
	mov	x0, x23
	str	xzr, [x29, 72]
	blr	x2
	ldr	x1, .LC621
	mov	x0, x23
	ldr	x2, [x20, 192]
	blr	x2
	str	x0, [x29, 72]
	cbz	x0, .L1223
	ldr	x1, .LC613
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1224
	ldr	x1, .LC615
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1245
	ldr	x3, [x20, 168]
	mov	x1, 0
	mov	w2, 0
	blr	x3
	mov	w3, w0
	str	w0, [x19, 684]
	add	w0, w3, 4096
	mov	w1, 10000
	add	w0, w0, 904
	cmp	w0, w1
	bhi	.L1228
.L1249:
	mov	w21, 5000
	mov	w0, -5000
	cmp	w3, w21
	csel	w21, w3, w21, le
	cmp	w21, w0
	csel	w21, w21, w0, ge
.L1224:
	str	w21, [x19, 684]
.L1226:
	ldr	w0, [x19, 1952]
	str	xzr, [x29, 72]
	cbz	w0, .L1229
	ldr	x2, .LC624
	and	w4, w0, 1
	ubfx	x3, x0, 1, 1
	ubfx	x1, x0, 2, 1
	strb	w4, [x19, 1956]
	ubfx	x0, x0, 3, 1
	strb	w3, [x2, 4]
	strb	w1, [x19, 1957]
	strb	w0, [x19, 1958]
.L1230:
	add	x21, x19, 32
	ldr	x3, [x20, 96]
	mov	x2, 216
	mov	w1, 0
	mov	x0, x21
	add	x24, x21, 32
	mov	w23, -1
	blr	x3
	ldr	x3, [x20, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x19
	blr	x3
	ldr	x0, .LC627
	mov	w1, 3
	str	x0, [x19, 712]
	mov	w0, 134217728
	str	w0, [x29, 64]
	mov	w0, 75497472
	str	w1, [x19, 36]
	str	w0, [x29, 68]
	bl	FSP_Init
	ldr	x21, .LC628
	mov	x2, 48
	ldr	x3, [x20, 96]
	mov	w1, 0
	mov	x0, x21
	blr	x3
	ldr	x3, [x20, 104]
	mov	x2, 24
	add	x1, x22, 8
	add	x0, x19, 128
	stp	w23, w23, [x21, 16]
	stp	w23, w23, [x21, 24]
	blr	x3
	mov	x0, x24
	bl	VCTRL_OpenDrivers
	cbnz	w0, .L1234
	ldr	x2, [x20, 248]
	mov	w1, 1
	blr	x2
	ldr	x2, .LC629
	add	x0, x19, 48
	ldr	x1, .LC631
	ldr	x3, [x20, 384]
	blr	x3
	cbnz	w0, .L1246
	mov	w1, 1
	str	w1, [x19, 32]
.L1215:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1229:
	add	x21, x19, 928
	ldr	x2, [x20, 160]
	mov	w1, 1024
	mov	x0, x21
	blr	x2
	ldr	x1, .LC626
	mov	x0, x21
	ldr	x2, [x20, 192]
	blr	x2
	str	x0, [x29, 72]
	cbz	x0, .L1230
	ldr	x1, .LC613
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1247
	ldr	x1, .LC615
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1248
	ldr	x3, [x20, 168]
	mov	x1, 0
	mov	w2, 0
	blr	x3
	mov	w1, w0
	str	w0, [x19, 1952]
.L1232:
	ldr	x2, .LC624
	and	w4, w1, 1
	ubfx	x3, x1, 1, 1
	ubfx	x0, x1, 2, 1
	strb	w4, [x19, 1956]
	ubfx	x1, x1, 3, 1
	strb	w3, [x2, 4]
	strb	w0, [x19, 1957]
	strb	w1, [x19, 1958]
	b	.L1230
	.p2align 3
.L1223:
	ldr	w3, [x19, 684]
	mov	w1, 10000
	add	w0, w3, 4096
	add	w0, w0, 904
	cmp	w0, w1
	bls	.L1249
.L1228:
	ldr	x2, .LC623
	mov	w1, 1077
	mov	w0, 32
	bl	dprint_normal
	ldr	w21, [x19, 684]
	mov	w1, 5000
	mov	w0, -5000
	cmp	w21, w1
	csel	w21, w21, w1, le
	cmp	w21, w0
	csel	w21, w21, w0, ge
	b	.L1224
	.p2align 3
.L1217:
	ldr	w3, [x19, 680]
	mov	w1, 10000
	add	w0, w3, 4096
	add	w0, w0, 904
	cmp	w0, w1
	bls	.L1250
.L1222:
	ldr	x2, .LC619
	mov	w1, 1035
	mov	w0, 32
	bl	dprint_normal
	ldr	w0, [x19, 680]
	mov	w3, 5000
	mov	w1, -5000
	cmp	w0, w3
	csel	w3, w0, w3, le
	cmp	w3, w1
	csel	w3, w3, w1, ge
	b	.L1218
	.p2align 3
.L1236:
	mov	w3, 0
	b	.L1218
	.p2align 3
.L1247:
	ldr	w1, [x19, 1952]
	b	.L1232
	.p2align 3
.L1234:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, -1
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1245:
	ldr	x3, .LC606
	mov	w4, 1063
	ldr	x2, .LC617
	mov	w1, w4
	add	x3, x3, 1384
	mov	w0, 20
	bl	dprint_normal
	b	.L1226
	.p2align 3
.L1244:
	ldr	x3, .LC606
	mov	w4, 1021
	ldr	x2, .LC617
	mov	w1, w4
	add	x3, x3, 1360
	mov	w0, 20
	bl	dprint_normal
	b	.L1220
	.p2align 3
.L1248:
	ldr	x3, .LC606
	mov	w4, 1114
	ldr	x2, .LC617
	mov	w1, w4
	add	x3, x3, 1416
	mov	w0, 20
	bl	dprint_normal
	b	.L1230
	.p2align 3
.L1246:
	mov	x0, x24
	bl	VCTRL_CloseDrivers
	mov	w0, w23
	b	.L1215
.L1243:
	ldr	x3, .LC606
	mov	w4, 7044
	ldr	x5, .LC605
	mov	w1, w4
	ldr	x2, .LC607
	add	x3, x3, 1344
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1215
	.size	VCTRL_OpenVfmw, .-VCTRL_OpenVfmw
	.align	3
.LC605:
	.xword	.LC604
	.align	3
.LC606:
	.xword	.LANCHOR2
	.align	3
.LC607:
	.xword	.LC18
	.align	3
.LC608:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC609:
	.xword	.LANCHOR1
	.align	3
.LC611:
	.xword	.LC610
	.align	3
.LC613:
	.xword	.LC612
	.align	3
.LC615:
	.xword	.LC614
	.align	3
.LC617:
	.xword	.LC616
	.align	3
.LC619:
	.xword	.LC618
	.align	3
.LC621:
	.xword	.LC620
	.align	3
.LC623:
	.xword	.LC622
	.align	3
.LC624:
	.xword	.LANCHOR3
	.align	3
.LC626:
	.xword	.LC625
	.align	3
.LC627:
	.xword	VCTRL_EventReport
	.align	3
.LC628:
	.xword	g_ChanCtx
	.align	3
.LC629:
	.xword	VCTRL_DecodeThread
	.align	3
.LC631:
	.xword	.LC630
	.global	s_pstVfmwChan
	.global	g_VfmwGlobalStat
	.global	g_VfmwChanStat
	.global	g_EventReportFunc
	.global	g_AppleAirplayMirrorinigFlag
	.global	g_IRQ_FLAG
	.global	g_SaveMemRecord
	.global	g_SaveFilePath
	.global	g_SaveRawAfterReset
	.global	g_SaveYUVBitDepth
	.global	g_SaveYuvEnd
	.global	g_SaveYuvBegin
	.global	g_SaveYuvCount
	.global	g_SaveElFileHandler
	.global	g_SaveReorderMetadataFileHandler
	.global	g_SaveMetadataFileHandler
	.global	g_SaveDecYuvFileHandler
	.global	g_SaveDispYuvFileHandler
	.global	g_SaveSegFileHandler
	.global	g_SaveRawFileHandler
	.global	g_ClkSelect
	.global	g_StatisticsEnable
	.global	g_MaskMMUErrIntEnable
	.global	g_StandardObedience
	.global	g_CurProcChan
	.global	g_H264FullPictureRepairDisable
	.global	g_NotDirect_8x8_InferenceFlag
	.global	g_AllowBPicBeforePPic
	.global	g_ExtraDisp
	.global	g_ExtraRef
	.global	g_ExtraCommand
	.global	g_RpuStartCode
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.9513, %object
	.size	__func__.9513, 26
__func__.9513:
	.string	"VCTRL_HandleAllocMemEvent"
	.zero	6
	.type	__func__.9522, %object
	.size	__func__.9522, 28
__func__.9522:
	.string	"VCTRL_HandleReleaseMemEvent"
	.zero	4
	.type	__func__.9548, %object
	.size	__func__.9548, 33
__func__.9548:
	.string	"VCTRL_HandleAllocPreProcessEvent"
	.zero	7
	.type	__func__.9570, %object
	.size	__func__.9570, 18
__func__.9570:
	.string	"VCTRL_EventReport"
	.zero	6
	.type	__func__.9530, %object
	.size	__func__.9530, 33
__func__.9530:
	.string	"VCTRL_HandleReleaseBurstMemEvent"
	.zero	7
	.type	__func__.9538, %object
	.size	__func__.9538, 29
__func__.9538:
	.string	"VCTRL_HandleCancelAllocEvent"
	.align	3
.LANCHOR2 = . + 0
	.type	__func__.10215, %object
	.size	__func__.10215, 24
__func__.10215:
	.string	"VCTRL_SetLastFrameState"
	.type	__func__.9486, %object
	.size	__func__.9486, 17
__func__.9486:
	.string	"VCTRL_RecordData"
	.zero	7
	.type	__func__.9582, %object
	.size	__func__.9582, 18
__func__.9582:
	.string	"VCTRL_SetCallBack"
	.zero	6
	.type	__func__.9618, %object
	.size	__func__.9618, 25
__func__.9618:
	.string	"VCTRL_SetStreamInterface"
	.zero	7
	.type	__func__.9626, %object
	.size	__func__.9626, 30
__func__.9626:
	.string	"VCTRL_SetDeiMemQueryInterface"
	.zero	2
	.type	__func__.9637, %object
	.size	__func__.9637, 20
__func__.9637:
	.string	"VCTRL_GetStreamSize"
	.zero	4
	.type	__func__.9644, %object
	.size	__func__.9644, 20
__func__.9644:
	.string	"VCTRL_CheckFreshRaw"
	.zero	4
	.type	__func__.9651, %object
	.size	__func__.9651, 20
__func__.9651:
	.string	"VCTRL_CheckFreshSeg"
	.zero	4
	.type	__func__.9656, %object
	.size	__func__.9656, 25
__func__.9656:
	.string	"VCTRL_SetDiscardPicParam"
	.zero	7
	.type	__func__.9691, %object
	.size	__func__.9691, 23
__func__.9691:
	.string	"VCTRL_FreeChanResource"
	.zero	1
	.type	__func__.9674, %object
	.size	__func__.9674, 22
__func__.9674:
	.string	"VCTRL_FreeVdhResource"
	.zero	2
	.type	__func__.9680, %object
	.size	__func__.9680, 22
__func__.9680:
	.string	"VCTRL_FreeScdResource"
	.zero	2
	.type	__func__.9686, %object
	.size	__func__.9686, 22
__func__.9686:
	.string	"VCTRL_FreeCtxResource"
	.zero	2
	.type	__func__.9813, %object
	.size	__func__.9813, 17
__func__.9813:
	.string	"VCTRL_GetChanCfg"
	.zero	7
	.type	__func__.9869, %object
	.size	__func__.9869, 14
__func__.9869:
	.string	"VCTRL_SeekPts"
	.zero	2
	.type	__func__.9873, %object
	.size	__func__.9873, 20
__func__.9873:
	.string	"VCTRL_InitSyntaxCtx"
	.zero	4
	.type	__func__.9883, %object
	.size	__func__.9883, 20
__func__.9883:
	.string	"VCTRL_ReleaseStream"
	.zero	4
	.type	__func__.9915, %object
	.size	__func__.9915, 19
__func__.9915:
	.string	"VCTRL_GetChanImage"
	.zero	5
	.type	__FUNCTION__.9919, %object
	.size	__FUNCTION__.9919, 19
__FUNCTION__.9919:
	.string	"VCTRL_GetChanImage"
	.zero	5
	.type	__func__.9925, %object
	.size	__func__.9925, 23
__func__.9925:
	.string	"VCTRL_ReleaseChanImage"
	.zero	1
	.type	__FUNCTION__.9929, %object
	.size	__FUNCTION__.9929, 23
__FUNCTION__.9929:
	.string	"VCTRL_ReleaseChanImage"
	.zero	1
	.type	__func__.9937, %object
	.size	__func__.9937, 23
__func__.9937:
	.string	"VCTRL_GetHDRConfigInfo"
	.zero	1
	.type	__func__.9951, %object
	.size	__func__.9951, 18
__func__.9951:
	.string	"VCTRL_GetDecParam"
	.zero	6
	.type	__func__.9999, %object
	.size	__func__.9999, 20
__func__.9999:
	.string	"VCTRL_ClearDecparam"
	.zero	4
	.type	__func__.10016, %object
	.size	__func__.10016, 21
__func__.10016:
	.string	"VCTRL_VdmProcSedOnly"
	.zero	3
	.type	__func__.10025, %object
	.size	__func__.10025, 21
__func__.10025:
	.string	"VCTRL_GetImageBuffer"
	.zero	3
	.type	__func__.10035, %object
	.size	__func__.10035, 22
__func__.10035:
	.string	"VCTRL_ConfigFFFBSpeed"
	.zero	2
	.type	__func__.10040, %object
	.size	__func__.10040, 20
__func__.10040:
	.string	"VCTRL_ConfigPVRInfo"
	.zero	4
	.type	__func__.10044, %object
	.size	__func__.10044, 19
__func__.10044:
	.string	"VCTRL_IsChanActive"
	.zero	5
	.type	__func__.10048, %object
	.size	__func__.10048, 19
__func__.10048:
	.string	"VCTRL_VarifyOption"
	.zero	5
	.type	__func__.10066, %object
	.size	__func__.10066, 21
__func__.10066:
	.string	"VCTRL_GetChanMemSize"
	.zero	3
	.type	__func__.10149, %object
	.size	__func__.10149, 21
__func__.10149:
	.string	"VCTRL_GetChanIDByCtx"
	.zero	3
	.type	__func__.10171, %object
	.size	__func__.10171, 20
__func__.10171:
	.string	"VCTRL_DecChanSyntax"
	.zero	4
	.type	__func__.10206, %object
	.size	__func__.10206, 20
__func__.10206:
	.string	"VCTRL_GetChanImgNum"
	.zero	4
	.type	__func__.9665, %object
	.size	__func__.9665, 19
__func__.9665:
	.string	"VCTRL_GetChanState"
	.zero	5
	.type	__func__.10230, %object
	.size	__func__.10230, 22
__func__.10230:
	.string	"VCTRL_OutputLastFrame"
	.zero	2
	.type	__func__.9989, %object
	.size	__func__.9989, 15
__func__.9989:
	.string	"VCTRL_PostProc"
	.zero	1
	.type	__func__.10011, %object
	.size	__func__.10011, 18
__func__.10011:
	.string	"VCTRL_VdmPostProc"
	.zero	6
	.type	__func__.10285, %object
	.size	__func__.10285, 19
__func__.10285:
	.string	"VCTRL_OpenHardware"
	.zero	5
	.type	__func__.9792, %object
	.size	__func__.9792, 16
__func__.9792:
	.string	"VCTRL_StartChan"
	.type	__func__.10295, %object
	.size	__func__.10295, 20
__func__.10295:
	.string	"VCTRL_CloseHardware"
	.zero	4
	.type	__func__.9808, %object
	.size	__func__.9808, 15
__func__.9808:
	.string	"VCTRL_StopChan"
	.zero	1
	.type	__func__.9905, %object
	.size	__func__.9905, 26
__func__.9905:
	.string	"VCTRL_ResetChanWithOption"
	.zero	6
	.type	__func__.9890, %object
	.size	__func__.9890, 26
__func__.9890:
	.string	"VCTRL_MarkImageOutHanging"
	.zero	6
	.type	__func__.9703, %object
	.size	__func__.9703, 17
__func__.9703:
	.string	"VCTRL_CheckParam"
	.zero	7
	.type	__func__.9863, %object
	.size	__func__.9863, 17
__func__.9863:
	.string	"VCTRL_ConfigChan"
	.zero	7
	.type	__func__.9786, %object
	.size	__func__.9786, 18
__func__.9786:
	.string	"VCTRL_DestroyChan"
	.zero	6
	.type	__func__.10322, %object
	.size	__func__.10322, 21
__func__.10322:
	.string	"VCTRL_BindRequireMem"
	.zero	3
	.type	__func__.10328, %object
	.size	__func__.10328, 25
__func__.10328:
	.string	"VCTRL_SetFrameBufferMode"
	.zero	7
	.type	__func__.10336, %object
	.size	__func__.10336, 23
__func__.10336:
	.string	"VCTRL_BindExternBuffer"
	.zero	1
	.type	__func__.10344, %object
	.size	__func__.10344, 25
__func__.10344:
	.string	"VCTRL_UnBindExternBuffer"
	.zero	7
	.type	__func__.10350, %object
	.size	__func__.10350, 24
__func__.10350:
	.string	"VCTRL_SetFrameBufferNum"
	.type	__func__.10369, %object
	.size	__func__.10369, 24
__func__.10369:
	.string	"VCTRL_IsResolutionValid"
	.type	__func__.10381, %object
	.size	__func__.10381, 20
__func__.10381:
	.string	"VCTRL_RecordPosTime"
	.zero	4
	.type	__func__.10396, %object
	.size	__func__.10396, 18
__func__.10396:
	.string	"VCTRL_OpenDrivers"
	.zero	6
	.type	__func__.10411, %object
	.size	__func__.10411, 15
__func__.10411:
	.string	"VCTRL_OpenVfmw"
	.zero	1
	.type	__FUNCTION__.9593, %object
	.size	__FUNCTION__.9593, 24
__FUNCTION__.9593:
	.string	"VCTRL_GetExtraRefFrmNum"
	.type	__FUNCTION__.9599, %object
	.size	__FUNCTION__.9599, 25
__FUNCTION__.9599:
	.string	"VCTRL_GetExtraDispFrmNum"
	.zero	7
	.type	__FUNCTION__.9605, %object
	.size	__FUNCTION__.9605, 22
__FUNCTION__.9605:
	.string	"VCTRL_GetExtraCtrlCmd"
	.data
	.align	3
.LANCHOR3 = . + 0
	.type	g_IRQ_FLAG, %object
	.size	g_IRQ_FLAG, 4
g_IRQ_FLAG:
	.word	128
	.type	g_NotDirect_8x8_InferenceFlag, %object
	.size	g_NotDirect_8x8_InferenceFlag, 1
g_NotDirect_8x8_InferenceFlag:
	.byte	1
	.zero	3
	.type	g_SaveFilePath, %object
	.size	g_SaveFilePath, 64
g_SaveFilePath:
	.byte	47
	.byte	109
	.byte	110
	.byte	116
	.byte	0
	.zero	59
	.type	g_SaveYUVBitDepth, %object
	.size	g_SaveYUVBitDepth, 4
g_SaveYUVBitDepth:
	.word	8
	.type	g_SaveYuvEnd, %object
	.size	g_SaveYuvEnd, 4
g_SaveYuvEnd:
	.word	-1
	.type	g_ClkSelect, %object
	.size	g_ClkSelect, 4
g_ClkSelect:
	.word	-1
	.type	g_MaskMMUErrIntEnable, %object
	.size	g_MaskMMUErrIntEnable, 4
g_MaskMMUErrIntEnable:
	.word	1
	.type	g_RpuStartCode, %object
	.size	g_RpuStartCode, 5
g_RpuStartCode:
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	25
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC1:
	ASCII(.string	"%s ERROR: Arg Len %d != %d\n" )
	.zero	4
.LC4:
	ASCII(.string	"%s" )
	.zero	5
.LC6:
	ASCII(.string	"%s ERROR: VMM_CMD_Alloc %s size %d failed!\n" )
	.zero	4
.LC12:
	ASCII(.string	"%s ERROR: VMM_CMD_Release %s phy 0x%x failed!\n" )
	.zero	1
.LC16:
	ASCII(.string	"ChanID out of range" )
	.zero	4
.LC18:
	ASCII(.string	"%s %d: %s\n" )
	.zero	5
.LC20:
	ASCII(.string	"pMemInfo is NULL" )
	.zero	7
.LC24:
	ASCII(.string	"%s ERROR: VMM_CMD_BLK_OpsInvoke %d  Type failed!\n" )
	.zero	6
.LC26:
	ASCII(.string	"InstID out of range" )
	.zero	4
.LC31:
	ASCII(.string	"Chan inactive" )
	.zero	2
.LC35:
	ASCII(.string	"%s ERROR: VMM_CMD_ReleaseBurst failed!\n" )
.LC37:
	ASCII(.string	"%s ERROR: VMM_CMD_BLK_CancleCmd %d failed!\n" )
	.zero	4
.LC39:
	ASCII(.string	"g_VfmwCtrlData.event_report_vdec = NULL\n" )
	.zero	7
.LC41:
	ASCII(.string	"g_VfmwCtrlData.event_report_omxvdec = NULL\n" )
	.zero	4
.LC43:
	ASCII(.string	"%s Unkown Adapter Type: %d, Len: %d\n" )
	.zero	3
.LC50:
	ASCII(.string	"VDMHAL_NULL_FUN_PRINT,L%d\n" )
	.zero	5
.LC52:
	ASCII(.string	"Wait sleep time out %d ms (isScdSleep=%d, isVdmSleep=%d)!\n" )
	.zero	5
.LC55:
	ASCII(.string	"Vfmw suspend totally take %d ms\n" )
	.zero	7
.LC57:
	ASCII(.string	"Force scd %d sleep.\n" )
	.zero	3
.LC59:
	ASCII(.string	"Force vdm %d sleep.\n" )
	.zero	3
.LC66:
	ASCII(.string	"Vfmw resume totally take %d ms\n" )
.LC70:
	ASCII(.string	"%s, %d, pos(%d) error!\n" )
.LC76:
	ASCII(.string	"event_report null!" )
	.zero	5
.LC81:
	ASCII(.string	"%s Unkown Adapter Type: %d\n" )
	.zero	4
.LC90:
	ASCII(.string	"pstStreamParam is NULL" )
	.zero	1
.LC99:
	ASCII(.string	"pDeiMemIntf is NULL" )
	.zero	4
.LC107:
	ASCII(.string	"can NOT get a not-opened Chan's information of bitstream" )
	.zero	7
.LC113:
	ASCII(.string	"This Chan has not been created!!!" )
	.zero	6
.LC116:
	ASCII(.string	"Raw FreshNum=%d, FreshSize=%d\n" )
	.zero	1
.LC124:
	ASCII(.string	"Seg FreshNum=%d, FreshSize=%d\n" )
	.zero	1
.LC131:
	ASCII(.string	"pArgs is null" )
	.zero	2
.LC135:
	ASCII(.string	"%s FATAL: pstChan = NULL!\n" )
	.zero	5
.LC137:
	ASCII(.string	"%s FATAL: pChanMem_vdh = NULL!\n" )
.LC139:
	ASCII(.string	"%s FATAL: pChanMem_scd = NULL!\n" )
.LC141:
	ASCII(.string	"%s FATAL: pChanMem_ctx = NULL!\n" )
.LC149:
	ASCII(.string	"pstCfg is null" )
	.zero	1
.LC160:
	ASCII(.string	"chan not create" )
.LC166:
	ASCII(.string	"ChanID out of range!" )
	.zero	3
.LC171:
	ASCII(.string	"s_pstVfmwChan = NULL" )
	.zero	3
.LC179:
	ASCII(.string	"This channel is not opened" )
	.zero	5
.LC181:
	ASCII(.string	"pImage is NULL" )
	.zero	1
.LC185:
	ASCII(.string	"%s, %d, Phyaddr = 0x%x MetaDataPhyaddr = 0x%x image_id = %d\n" )
	.zero	3
.LC197:
	ASCII(.string	"vdm_ctrl.c,L%d: Chan inactive\n" )
	.zero	1
.LC199:
	ASCII(.string	"vdm_ctrl.c,L%d: This channel is not opened\n" )
	.zero	4
.LC202:
	ASCII(.string	"%s, %d, ===> Phyaddr 0x%x release Error, force to UnMark ImageOutHanging\n" )
	.zero	6
.LC204:
	ASCII(.string	"%s, %d, ===> Phyaddr 0x%x release success!! imageId = 0x%x\n" )
	.zero	4
.LC208:
	ASCII(.string	"vfmw_ctrl.c, line %d: ChanID out of range\n" )
	.zero	5
.LC210:
	ASCII(.string	"vfmw_ctrl.c, line %d: Chan %d is not open or not running\n" )
	.zero	6
.LC217:
	ASCII(.string	"pstHDRInput = null" )
	.zero	5
.LC221:
	ASCII(.string	"%s VidStd=%d Error!\n" )
	.zero	3
.LC224:
	ASCII(.string	"Get DecParam Type Failure!\n" )
	.zero	4
.LC227:
	ASCII(.string	"vfmw_ctrl.c, line %d: ChanID out of range is %d\n" )
	.zero	7
.LC229:
	ASCII(.string	"Chan %d is not open or not running\n" )
	.zero	4
.LC232:
	ASCII(.string	"ChanId out of range" )
	.zero	4
.LC238:
	ASCII(.string	"%s unsupport VidStd %d\n" )
.LC245:
	ASCII(.string	"This channel is not running" )
	.zero	4
.LC253:
	ASCII(.string	"%s unsupport VidStd %d.\n" )
	.zero	7
.LC260:
	ASCII(.string	"can NOT start a not-opened Chan" )
.LC262:
	ASCII(.string	"pArgs = null" )
	.zero	3
.LC280:
	ASCII(.string	"%s param invalid.\n" )
	.zero	5
.LC282:
	ASCII(.string	"pChanOption = null" )
	.zero	5
.LC286:
	ASCII(.string	"pDetailMemSize = null" )
	.zero	2
.LC289:
	ASCII(.string	"ERROR: s32MaxRefFrameNum(%d), g_ExtraRef(%d), s32DisplayFrameNum(%d), g_ExtraDisp(%d)\n" )
	.zero	1
.LC295:
	ASCII(.string	"Register irq %d failed!\n" )
	.zero	7
.LC303:
	ASCII(.string	"MEM_MapRegisterAddr reg 0x%x failed!\n" )
	.zero	2
.LC308:
	ASCII(.string	"VDMDRV_GetHalMemSize Vdh %d failed!\n" )
	.zero	3
.LC310:
	ASCII(.string	"MEM_AllocMemBlock Vdh %d failed!\n" )
	.zero	6
.LC312:
	ASCII(.string	"VDMDRV_OpenHAL Vdh %d failed!\n" )
	.zero	1
.LC318:
	ASCII(.string	"MEM_AllocMemBlock Scd %d failed!\n" )
	.zero	6
.LC320:
	ASCII(.string	"SM_OpenSCDDrv Scd %d failed!\n" )
	.zero	2
.LC323:
	ASCII(.string	"(safe,warn,danger) :amount = %d,%d,%d,%d\n" )
	.zero	6
.LC325:
	ASCII(.string	"strm_ctrl: I->IPB\n" )
	.zero	5
.LC327:
	ASCII(.string	"strm_ctrl: IPB->I\n" )
	.zero	5
.LC329:
	ASCII(.string	"(CurrMode,NextMode) = %d,%d\n" )
	.zero	3
.LC334:
	ASCII(.string	"pCtx = null" )
	.zero	4
.LC340:
	ASCII(.string	"Chan:%d pic_pts: %lld\n" )
	.zero	1
.LC342:
	ASCII(.string	"Chan:%d pic_usertag: %lld\n" )
	.zero	5
.LC344:
	ASCII(.string	"Chan:%d pic_pts: %lld pic_usertag = %lld\n" )
	.zero	6
.LC353:
	ASCII(.string	"Syntax is stopped from This channel" )
	.zero	4
.LC355:
	ASCII(.string	"[%d] vdm busy\n" )
	.zero	1
.LC357:
	ASCII(.string	"[%d] no frame\n" )
	.zero	1
.LC359:
	ASCII(.string	"[%d] no stream\n" )
.LC361:
	ASCII(.string	"Chan:%d seg_pts: %lld, seg_usertag = %lld\n" )
	.zero	5
.LC374:
	ASCII(.string	"pRefImgNum = null" )
	.zero	6
.LC376:
	ASCII(.string	"pReadImgNum = null" )
	.zero	5
.LC378:
	ASCII(.string	"pNewImgNum = null" )
	.zero	6
.LC381:
	ASCII(.string	"%s not support std %d\n" )
	.zero	1
.LC388:
	ASCII(.string	"pstChanState = NULL" )
	.zero	4
.LC399:
	ASCII(.string	"Last frame output failed!\n" )
	.zero	5
.LC401:
	ASCII(.string	"Last frame output successed!\n" )
	.zero	2
.LC403:
	ASCII(.string	"Last frame already output, image id: %d!\n" )
	.zero	6
.LC415:
	ASCII(.string	"Chan id out of range!" )
	.zero	2
.LC420:
	ASCII(.string	"Chan not created!" )
	.zero	6
.LC422:
	ASCII(.string	"Chan not open!" )
	.zero	1
.LC432:
	ASCII(.string	"WARNING: vidio std not setted!" )
	.zero	1
.LC452:
	ASCII(.string	"This Chan has not been created or has been destroyed !" )
	.zero	1
.LC455:
	ASCII(.string	"VCTRL_StopChanWithCheck fail!\n" )
	.zero	1
.LC463:
	ASCII(.string	"\n====>%s, %d=====> prepare\n" )
	.zero	4
.LC466:
	ASCII(.string	"====>%s, %d=====> end\n\n" )
.LC470:
	ASCII(.string	"Param Invalid of PChanOption is NULL\n" )
	.zero	2
.LC474:
	ASCII(.string	"line %d VCTRL_GetChanMemSize failed!\n" )
	.zero	2
.LC477:
	ASCII(.string	"vfmw have max(%d) channels opened, can NOT create more channels\n" )
	.zero	7
.LC479:
	ASCII(.string	"L: %d : part we can NOT alloc buffer for channel context\n" )
	.zero	6
.LC481:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel context\n" )
	.zero	6
.LC483:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel vdh\n" )
	.zero	2
.LC485:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel vdh, %#x < %#x\n" )
	.zero	7
.LC487:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel scd\n" )
	.zero	2
.LC489:
	ASCII(.string	"L: %d : can NOT alloc buffer for SCD\n" )
	.zero	2
.LC492:
	ASCII(.string	"Chan:%d can NOT enable FSP instance\n" )
	.zero	3
.LC494:
	ASCII(.string	"Chan:%d hal mem %d overlap scd mem %d\n" )
	.zero	1
.LC502:
	ASCII(.string	"can NOT config a not-opened Chan" )
	.zero	7
.LC504:
	ASCII(.string	"pstCfg = null" )
	.zero	2
.LC506:
	ASCII(.string	"VFMW didn't support std %d.\n" )
	.zero	3
.LC508:
	ASCII(.string	"%s check standard support failed.\n" )
	.zero	5
.LC510:
	ASCII(.string	"%s config not change, no need to proceed.\n" )
	.zero	5
.LC520:
	ASCII(.string	"%s:L%d: %s\n" )
	.zero	4
.LC523:
	ASCII(.string	"This Chan has not been created or has been destroyed !!!" )
	.zero	7
.LC525:
	ASCII(.string	"can NOT stop a not-opened Chan" )
	.zero	1
.LC543:
	ASCII(.string	"pMem = NULL" )
	.zero	4
.LC545:
	ASCII(.string	"%s Mem UniqueID %llx != Chan UniqueID %llx, ignor this bind operation.\n" )
.LC558:
	ASCII(.string	"pExternBuffer = NULL" )
	.zero	3
.LC560:
	ASCII(.string	"Attached buffer phy:%x, but vir addr is NULL\n" )
	.zero	2
.LC579:
	ASCII(.string	"Resolution min(w=%d,h=%d), this stream (w=%d,h=%d) invalid!\n" )
	.zero	3
.LC581:
	ASCII(.string	"Resolution max(w = %d, h = %d), this stream (w = %d, h = %d) invalid!\n" )
	.zero	1
.LC583:
	ASCII(.string	"Std(%d) not support 4K(w = %d, h = %d)\n" )
.LC587:
	ASCII(.string	"%s,%d,pos(%d) error!\n" )
	.zero	2
.LC599:
	ASCII(.string	"%s %d ERROR exit.\n" )
	.zero	5
.LC604:
	ASCII(.string	"pArgs null!" )
	.zero	4
.LC610:
	ASCII(.string	"g_ExtraRef=" )
	.zero	4
.LC612:
	ASCII(.string	"=" )
	.zero	6
.LC614:
	ASCII(.string	" " )
	.zero	6
.LC616:
	ASCII(.string	"fuction return value is null,%s %d unknow error!!\n" )
	.zero	5
.LC618:
	ASCII(.string	"ERROR: g_ExtraRef = %d is out of [ -5000, 5000 ]!\n" )
	.zero	5
.LC620:
	ASCII(.string	"g_ExtraDisp=" )
	.zero	3
.LC622:
	ASCII(.string	"ERROR: g_ExtraDisp = %d is out of [ -5000, 5000 ]!\n" )
	.zero	4
.LC625:
	ASCII(.string	"g_ExtraCommand=" )
.LC630:
	ASCII(.string	"HI_VFMW_VideoDecode" )
	.bss
	.align	3
.LANCHOR1 = . + 0
	.type	s_pstVfmwChan, %object
	.size	s_pstVfmwChan, 32
s_pstVfmwChan:
	.zero	32
	.type	g_VfmwCtrlData, %object
	.size	g_VfmwCtrlData, 216
g_VfmwCtrlData:
	.zero	216
	.type	last_rec_pos_time.9916, %object
	.size	last_rec_pos_time.9916, 16
last_rec_pos_time.9916:
	.zero	16
	.type	g_VfmwChanStat, %object
	.size	g_VfmwChanStat, 400
g_VfmwChanStat:
	.zero	400
	.type	last_rec_pos_time.9926, %object
	.size	last_rec_pos_time.9926, 16
last_rec_pos_time.9926:
	.zero	16
	.type	g_ExtraRef, %object
	.size	g_ExtraRef, 4
g_ExtraRef:
	.zero	4
	.type	g_ExtraDisp, %object
	.size	g_ExtraDisp, 4
g_ExtraDisp:
	.zero	4
	.type	g_IrqDevHandle, %object
	.size	g_IrqDevHandle, 4
g_IrqDevHandle:
	.zero	4
	.zero	4
	.type	ChanPriTab.10175, %object
	.size	ChanPriTab.10175, 16
ChanPriTab.10175:
	.zero	16
	.type	g_EventReportFunc, %object
	.size	g_EventReportFunc, 8
g_EventReportFunc:
	.zero	8
	.type	PrioArray.9791, %object
	.size	PrioArray.9791, 16
PrioArray.9791:
	.zero	16
	.type	Capability.9862, %object
	.size	Capability.9862, 148
Capability.9862:
	.zero	148
	.zero	4
	.type	PrioArray.9861, %object
	.size	PrioArray.9861, 16
PrioArray.9861:
	.zero	16
	.type	g_EsBufValidFlag, %object
	.size	g_EsBufValidFlag, 16
g_EsBufValidFlag:
	.zero	16
	.type	g_StatisticsEnable, %object
	.size	g_StatisticsEnable, 4
g_StatisticsEnable:
	.zero	4
	.type	g_IsrFlag, %object
	.size	g_IsrFlag, 1
g_IsrFlag:
	.zero	1
	.zero	3
	.type	g_CmdLine, %object
	.size	g_CmdLine, 1024
g_CmdLine:
	.zero	1024
	.type	g_ExtraCommand, %object
	.size	g_ExtraCommand, 4
g_ExtraCommand:
	.zero	4
	.type	g_AllowBPicBeforePPic, %object
	.size	g_AllowBPicBeforePPic, 1
g_AllowBPicBeforePPic:
	.zero	1
	.type	g_H264FullPictureRepairDisable, %object
	.size	g_H264FullPictureRepairDisable, 1
g_H264FullPictureRepairDisable:
	.zero	1
	.type	g_AppleAirplayMirrorinigFlag, %object
	.size	g_AppleAirplayMirrorinigFlag, 1
g_AppleAirplayMirrorinigFlag:
	.zero	1
	.zero	1
	.type	g_VfmwGlobalStat, %object
	.size	g_VfmwGlobalStat, 60
g_VfmwGlobalStat:
	.zero	60
	.zero	4
	.type	g_SaveMemRecord, %object
	.size	g_SaveMemRecord, 32
g_SaveMemRecord:
	.zero	32
	.type	g_SaveRawAfterReset, %object
	.size	g_SaveRawAfterReset, 4
g_SaveRawAfterReset:
	.zero	4
	.type	g_SaveYuvBegin, %object
	.size	g_SaveYuvBegin, 4
g_SaveYuvBegin:
	.zero	4
	.type	g_SaveYuvCount, %object
	.size	g_SaveYuvCount, 4
g_SaveYuvCount:
	.zero	4
	.zero	4
	.type	g_SaveElFileHandler, %object
	.size	g_SaveElFileHandler, 32
g_SaveElFileHandler:
	.zero	32
	.type	g_SaveReorderMetadataFileHandler, %object
	.size	g_SaveReorderMetadataFileHandler, 32
g_SaveReorderMetadataFileHandler:
	.zero	32
	.type	g_SaveMetadataFileHandler, %object
	.size	g_SaveMetadataFileHandler, 32
g_SaveMetadataFileHandler:
	.zero	32
	.type	g_SaveDecYuvFileHandler, %object
	.size	g_SaveDecYuvFileHandler, 32
g_SaveDecYuvFileHandler:
	.zero	32
	.type	g_SaveDispYuvFileHandler, %object
	.size	g_SaveDispYuvFileHandler, 32
g_SaveDispYuvFileHandler:
	.zero	32
	.type	g_SaveSegFileHandler, %object
	.size	g_SaveSegFileHandler, 32
g_SaveSegFileHandler:
	.zero	32
	.type	g_SaveRawFileHandler, %object
	.size	g_SaveRawFileHandler, 32
g_SaveRawFileHandler:
	.zero	32
	.type	g_StandardObedience, %object
	.size	g_StandardObedience, 4
g_StandardObedience:
	.zero	4
	.type	g_CurProcChan, %object
	.size	g_CurProcChan, 4
g_CurProcChan:
	.zero	4
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
