#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"fsp.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	FSP_ClearContext, %function
FSP_ClearContext:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L5
	ldr	x20, .LC4
	mov	w0, 8
	add	x21, x19, 24576
	ldr	x1, [x20, 24]
	blr	x1
	strb	wzr, [x19, 2]
	strb	wzr, [x19, 4]
	mov	x2, 20
	strb	wzr, [x19, 5]
	mov	w1, 0
	strb	wzr, [x19, 3]
	add	x0, x19, 36
	stp	wzr, wzr, [x19, 8]
	stp	wzr, wzr, [x19, 16]
	str	wzr, [x19, 24]
	str	wzr, [x19, 32]
	ldr	x3, [x20, 96]
	blr	x3
	ldr	x3, [x20, 96]
	mov	x2, 92
	mov	w1, 0
	add	x0, x19, 56
	blr	x3
	ldr	x3, [x20, 96]
	add	x0, x19, 20480
	mov	x2, 2944
	mov	w1, 0
	add	x0, x0, 1688
	blr	x3
	ldr	x3, [x20, 96]
	mov	x2, 2944
	mov	w1, 0
	add	x0, x21, 536
	blr	x3
	ldr	x3, [x20, 96]
	mov	x2, 256
	mov	w1, 0
	add	x0, x21, 3480
	blr	x3
	ldr	x1, [x20, 32]
	mov	w0, 8
	blr	x1
	mov	w0, 0
.L3:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L5:
	ldr	x3, .LC1
	mov	w2, 132
	ldr	x1, .LC3
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3
	.size	FSP_ClearContext, .-FSP_ClearContext
	.align	3
.LC1:
	.xword	.LC0
	.align	3
.LC3:
	.xword	.LC2
	.align	3
.LC4:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_Init
	.type	FSP_Init, %function
FSP_Init:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC5
	mov	x2, 256
	ldr	x0, .LC6
	mov	w1, 0
	ldr	x3, [x3, 96]
	blr	x3
	ldp	x29, x30, [sp], 16
	ret
	.size	FSP_Init, .-FSP_Init
	.align	3
.LC5:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC6:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ConfigAttribute
	.type	FSP_ConfigAttribute, %function
FSP_ConfigAttribute:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 31
	bhi	.L11
	ldr	x0, .LC10
	ldr	x2, [x0, w19, sxtw 3]
	ldr	w0, [x2, 28]
	cmp	w0, 1
	bne	.L12
	ldrsb	w1, [x20]
	mov	w0, 0
	strb	w1, [x2, 1]
.L9:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L12:
	ldr	x3, .LC12
	mov	w2, 349
	ldr	x1, .LC9
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L9
	.p2align 3
.L11:
	ldr	x3, .LC8
	mov	w2, 348
	ldr	x1, .LC9
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L9
	.size	FSP_ConfigAttribute, .-FSP_ConfigAttribute
	.align	3
.LC8:
	.xword	.LC7
	.align	3
.LC9:
	.xword	.LC2
	.align	3
.LC10:
	.xword	.LANCHOR0
	.align	3
.LC12:
	.xword	.LC11
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ClearContextAll
	.type	FSP_ClearContextAll, %function
FSP_ClearContextAll:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L17
	ldr	x0, .LC15
	ldr	x19, [x0, w19, sxtw 3]
	cbz	x19, .L18
	ldr	x3, .LC18
	mov	x2, 28312
	mov	w1, 0
	mov	x0, x19
	ldrsb	w22, [x19, 3]
	ldr	x3, [x3, 96]
	ldrsb	w21, [x19, 5]
	ldrsb	w25, [x19]
	ldrsb	w24, [x19, 1]
	ldp	w23, w20, [x19, 28]
	blr	x3
	strb	w25, [x19]
	strb	w24, [x19, 1]
	mov	w0, 0
	strb	w22, [x19, 3]
	strb	w21, [x19, 5]
	stp	w23, w20, [x19, 28]
.L15:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L17:
	ldr	x3, .LC13
	mov	w2, 369
	ldr	x1, .LC14
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L15
.L18:
	ldr	x3, .LC17
	mov	w2, 370
	ldr	x1, .LC14
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L15
	.size	FSP_ClearContextAll, .-FSP_ClearContextAll
	.align	3
.LC13:
	.xword	.LC7
	.align	3
.LC14:
	.xword	.LC2
	.align	3
.LC15:
	.xword	.LANCHOR0
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC18:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_EnableInstance
	.type	FSP_EnableInstance, %function
FSP_EnableInstance:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 31
	bhi	.L23
	ldr	x21, .LC21
	ldr	x0, [x21, w20, sxtw 3]
	cbnz	x0, .L24
	ldr	x3, .LC24
	mov	x2, 28312
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	strb	w20, [x19]
	mov	w0, 1
	stp	w0, wzr, [x19, 28]
	str	x19, [x21, w20, sxtw 3]
	mov	w0, 0
.L21:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L24:
	ldr	x3, .LC23
	mov	w2, 396
	ldr	x1, .LC20
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L23:
	ldr	x3, .LC19
	mov	w2, 395
	ldr	x1, .LC20
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L21
	.size	FSP_EnableInstance, .-FSP_EnableInstance
	.align	3
.LC19:
	.xword	.LC7
	.align	3
.LC20:
	.xword	.LC2
	.align	3
.LC21:
	.xword	.LANCHOR0
	.align	3
.LC23:
	.xword	.LC22
	.align	3
.LC24:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_DisableInstance
	.type	FSP_DisableInstance, %function
FSP_DisableInstance:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L30
	ldr	x1, .LC27
	ldr	x0, [x1, w19, sxtw 3]
	cbz	x0, .L31
	ldr	w2, [x0, 28]
	cmp	w2, 1
	beq	.L32
.L29:
	str	xzr, [x1, w19, sxtw 3]
.L25:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L32:
	str	wzr, [x0, 28]
	b	.L29
	.p2align 3
.L30:
	ldr	x3, .LC25
	mov	w2, 412
	ldr	x1, .LC26
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L31:
	ldr	x3, .LC28
	mov	w2, 413
	ldr	x1, .LC26
	bl	dprint_vfmw
	b	.L25
	.size	FSP_DisableInstance, .-FSP_DisableInstance
	.align	3
.LC25:
	.xword	.LC7
	.align	3
.LC26:
	.xword	.LC2
	.align	3
.LC27:
	.xword	.LANCHOR0
	.align	3
.LC28:
	.xword	.LC16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_Exit
	.type	FSP_Exit, %function
FSP_Exit:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x0, x30
	mov	x19, 0
	bl	_mcount
	ldr	x20, .LC31
	b	.L35
	.p2align 3
.L34:
	add	x19, x19, 1
	cmp	x19, 32
	beq	.L43
.L35:
	ldr	x0, [x20, x19, lsl 3]
	cbz	x0, .L34
	ldr	w0, [x0, 28]
	cbz	w0, .L34
	mov	w0, w19
	add	x19, x19, 1
	bl	FSP_DisableInstance
	cmp	x19, 32
	bne	.L35
.L43:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_Exit, .-FSP_Exit
	.align	3
.LC31:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ResetInstance
	.type	FSP_ResetInstance, %function
FSP_ResetInstance:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L48
	ldr	x0, .LC34
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L49
	bl	FSP_ClearContext
	mov	w0, 0
.L46:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L48:
	ldr	x3, .LC32
	mov	w2, 431
	ldr	x1, .LC33
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L46
.L49:
	ldr	x3, .LC35
	mov	w2, 432
	ldr	x1, .LC33
	bl	dprint_vfmw
	mov	w0, -1
	b	.L46
	.size	FSP_ResetInstance, .-FSP_ResetInstance
	.align	3
.LC32:
	.xword	.LC7
	.align	3
.LC33:
	.xword	.LC2
	.align	3
.LC34:
	.xword	.LANCHOR0
	.align	3
.LC35:
	.xword	.LC16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ConfigInstance
	.type	FSP_ConfigInstance, %function
FSP_ConfigInstance:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cmp	w19, 31
	bhi	.L65
	cbz	x21, .L66
	ldr	x0, .LC40
	sxtw	x1, w19
	ldr	x20, [x0, w19, sxtw 3]
	cbz	x20, .L54
	ldr	w0, [x20, 28]
	cmp	w0, 1
	bne	.L54
	ldr	x0, .LC43
	lsl	x2, x1, 6
	add	x2, x2, x1, lsl 3
	ldr	w3, [x21, 4]
	add	x2, x0, x2
	ldr	w4, [x2, 36]
	cmp	w4, w3
	beq	.L67
.L56:
	lsl	x2, x1, 6
	ldr	x23, .LC44
	add	x1, x2, x1, lsl 3
	add	x22, x0, x1
	ldr	w2, [x22, 24]
	cbz	w2, .L68
.L57:
	ldr	x0, .LC45
	ldr	x0, [x0, w19, sxtw 3]
	add	x0, x0, 503808
	ldr	w0, [x0, 1968]
	cbz	w0, .L69
.L58:
	ldr	x3, [x23, 104]
	mov	x2, 20
	mov	x1, x21
	add	x0, x20, 36
	blr	x3
	mov	w0, 0
.L52:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L69:
	mov	x0, x20
	bl	FSP_ClearContext
	b	.L58
	.p2align 3
.L67:
	ldr	w3, [x2, 40]
	ldr	w2, [x21, 8]
	cmp	w3, w2
	bne	.L56
	ldr	x23, .LC44
	b	.L57
	.p2align 3
.L68:
	add	x0, x0, x1
	ldr	x3, [x23, 96]
	mov	x2, 48
	mov	w1, 0
	add	x0, x0, 24
	blr	x3
	ldr	x0, [x23]
	mov	w1, 1
	str	w1, [x22, 24]
	blr	x0
	str	w0, [x22, 44]
	ldr	w0, [x20, 40]
	str	w0, [x22, 28]
	ldr	w0, [x20, 44]
	str	w0, [x22, 32]
	ldr	w0, [x21, 4]
	str	w0, [x22, 36]
	ldr	w0, [x21, 8]
	str	w0, [x22, 40]
	b	.L57
	.p2align 3
.L54:
	ldr	x3, .LC42
	mov	w2, 570
	ldr	x1, .LC37
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L52
	.p2align 3
.L65:
	ldr	x3, .LC36
	mov	w2, 567
	ldr	x1, .LC37
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L52
.L66:
	ldr	x3, .LC39
	mov	w2, 568
	ldr	x1, .LC37
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L52
	.size	FSP_ConfigInstance, .-FSP_ConfigInstance
	.align	3
.LC36:
	.xword	.LC7
	.align	3
.LC37:
	.xword	.LC2
	.align	3
.LC39:
	.xword	.LC38
	.align	3
.LC40:
	.xword	.LANCHOR0
	.align	3
.LC42:
	.xword	.LC41
	.align	3
.LC43:
	.xword	g_VfmwChanStat
	.align	3
.LC44:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC45:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ConfigFrameBuf
	.type	FSP_ConfigFrameBuf, %function
FSP_ConfigFrameBuf:
	sub	sp, sp, #128
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	stp	x23, x24, [sp, 64]
	stp	x25, x26, [sp, 80]
	stp	x27, x28, [sp, 96]
	mov	w26, w0
	mov	x0, x30
	mov	w25, w1
	mov	w27, w2
	mov	x20, x3
	bl	_mcount
	ldr	x19, .LC46
	mov	x2, 1232
	ldr	x22, .LC47
	mov	w1, 0
	ldr	x3, [x19, 96]
	add	x0, x22, 256
	blr	x3
	cmp	w26, 31
	bhi	.L114
	ldr	x21, [x22, w26, sxtw 3]
	cbz	x21, .L115
	ldr	x24, .LC51
	add	x23, x21, 36
	ldr	x0, [x24, w26, sxtw 3]
	ldp	w4, w5, [x23, 4]
	ldp	w2, w3, [x0, 148]
	mul	w6, w4, w5
	mul	w1, w2, w3
	cmp	w6, w1
	bgt	.L116
	ldr	w1, [x0, 1616]
	ldrsb	w28, [x23, 1]
	cmp	w1, 1
	beq	.L117
.L75:
	add	x1, x0, 503808
	ldr	w2, [x1, 1976]
	cmp	w28, w2
	beq	.L77
	mov	w2, 1
	str	w2, [x1, 1992]
	ldr	x2, .LC55
	ldr	x8, [x2, 128]
	ldrsb	w2, [x23, 1]
	str	w2, [x1, 1976]
	cbz	x8, .L79
.L122:
	ldp	w2, w3, [x23, 4]
	ldrsb	w6, [x21, 36]
	mov	w1, w27
	ldrsb	w4, [x23, 3]
	mov	w0, w25
	add	x27, x22, 256
	mov	w7, w26
	mov	w5, 32
	str	x27, [sp]
	sxtw	x25, w26
	blr	x8
	ldr	x1, [x24, w26, sxtw 3]
	mov	w2, 32
	add	x1, x1, 507904
	ldr	w1, [x1, 264]
	cmp	w1, 32
	csel	w1, w1, w2, le
	cmp	w0, 2
	strb	w1, [x21, 5]
	beq	.L118
	str	w2, [x29, 108]
	cbnz	w0, .L82
	ldr	w0, [x27, 48]
	strb	w0, [x21, 2]
	ldr	x1, .LC60
	ldr	x0, [x24, w26, sxtw 3]
	strb	wzr, [x0, 1696]
	str	wzr, [x0, 1672]
	mov	w0, 31
	bl	dprint_vfmw
	ldr	w4, [x27, 48]
	ldr	w2, [x29, 108]
	cmp	w28, w4
	bgt	.L119
	strb	wzr, [x21, 4]
	ldr	w0, [x27, 48]
	cmp	w0, 32
	csel	w0, w0, w2, le
	strb	w0, [x21, 3]
	mov	w0, 8
	ldr	x1, [x19, 24]
	blr	x1
	ldr	w0, [x27, 60]
	cbz	w0, .L120
	ldr	w12, [x21, 16]
	mov	x2, x27
	ldp	w4, w5, [x23, 4]
	ldp	w10, w9, [x27, 4]
	ldr	w8, [x27, 12]
	mov	w3, 0
	mov	w6, 4
	mov	w7, 1
	.p2align 2
.L90:
	uxtw	x11, w12
	uxtw	x0, w3
	lsl	x1, x11, 2
	lsl	x14, x0, 2
	sub	x1, x1, x11
	sub	x14, x14, x0
	lsl	x1, x1, 3
	add	x0, x0, 20
	sub	x1, x1, x11
	add	x14, x2, x14, lsl 2
	ldr	x13, [x24, x25, lsl 3]
	add	x1, x21, x1, lsl 2
	ldr	w15, [x2, x0, lsl 2]
	add	x0, x1, 20480
	ldr	w16, [x14, 464]
	ldr	w14, [x14, 468]
	ldp	w1, w18, [x2, 28]
	str	w14, [x0, 1700]
	add	x14, x0, 1536
	str	w16, [x0, 1696]
	strb	wzr, [x0, 1689]
	strb	wzr, [x0, 1690]
	str	w12, [x0, 1692]
	ldp	w17, w30, [x2, 16]
	stp	w15, w10, [x14, 176]
	add	x15, x0, 1536
	stp	w9, w30, [x14, 184]
	add	x14, x13, 507904
	stp	w1, w18, [x15, 192]
	stp	w8, w17, [x15, 200]
	str	w4, [x0, 1744]
	ldp	w16, w15, [x2, 36]
	ldr	w1, [x2, 44]
	str	w5, [x0, 1748]
	str	w16, [x0, 1752]
	str	w15, [x0, 1756]
	str	w1, [x0, 1760]
	ldr	w0, [x14, 2020]
	cbnz	w0, .L87
	ldr	w0, [x14, 2016]
	cbz	w0, .L87
	ldr	x4, [x22, x25, lsl 3]
	mov	w1, 0
	ldr	w5, [x4, 16]
	lsl	x0, x5, 2
	sub	x0, x0, x5
	lsl	x0, x0, 3
	sub	x0, x0, x5
	add	x4, x4, x0, lsl 2
	add	x0, x4, 20480
	ldr	w5, [x0, 1696]
	b	.L89
	.p2align 3
.L88:
	ldr	w0, [x14, 2016]
	cmp	w1, w0
	bcs	.L121
.L89:
	uxtw	x0, w1
	add	w1, w1, 1
	add	x0, x0, 28672
	add	x0, x0, 3165
	add	x0, x13, x0, lsl 4
	ldr	w0, [x0, 4]
	cmp	w5, w0
	bne	.L88
	add	x0, x4, 20480
	strb	w6, [x0, 1690]
	ldr	w0, [x14, 2016]
	cmp	w1, w0
	bcc	.L89
.L121:
	ldr	w12, [x21, 16]
	ldp	w4, w5, [x23, 4]
	uxtw	x11, w12
.L87:
	lsl	x0, x11, 2
	add	w12, w12, 1
	sub	x0, x0, x11
	add	w3, w3, 1
	lsl	x0, x0, 3
	sub	x0, x0, x11
	add	x0, x21, x0, lsl 2
	add	x0, x0, 20480
	str	w7, [x0, 1776]
	str	w12, [x21, 16]
	ldr	w0, [x2, 60]
	cmp	w0, w3
	bhi	.L90
.L86:
	add	x8, x22, 256
	ldr	w0, [x8, 68]
	cbz	w0, .L95
	ldr	w3, [x21, 24]
	mov	w2, 0
	.p2align 2
.L94:
	uxtw	x6, w3
	uxtw	x7, w2
	lsl	x0, x6, 2
	lsl	x1, x7, 2
	sub	x0, x0, x6
	sub	x1, x1, x7
	lsl	x0, x0, 3
	add	w3, w3, 1
	sub	x0, x0, x6
	add	x1, x8, x1, lsl 2
	add	w2, w2, 1
	add	x0, x21, x0, lsl 2
	add	x0, x0, 20480
	ldr	w6, [x1, 848]
	ldr	w1, [x1, 852]
	str	w6, [x0, 1704]
	str	w1, [x0, 1708]
	str	w3, [x21, 24]
	ldr	w0, [x8, 68]
	cmp	w0, w2
	bhi	.L94
.L95:
	add	x3, x22, 256
	ldr	w0, [x3, 56]
	mov	w1, 32
	cmp	w0, w1
	csel	w0, w0, w1, le
	strb	w0, [x21, 5]
	ldr	w0, [x3, 64]
	cbz	w0, .L93
	ldr	w2, [x21, 20]
	mov	w1, 0
	mov	w7, 1
	.p2align 2
.L96:
	add	x0, x21, x2, uxtw 3
	add	x6, x3, x1, uxtw 3
	add	x0, x0, 24576
	add	w2, w2, 1
	add	w1, w1, 1
	ldr	w6, [x6, 208]
	strb	wzr, [x0, 3485]
	strb	w7, [x0, 3484]
	str	w6, [x0, 3480]
	str	w2, [x21, 20]
	ldr	w0, [x3, 64]
	cmp	w0, w1
	bhi	.L96
.L93:
	ldr	w1, [x22, 308]
	add	x6, x21, 20480
	str	w1, [x21, 8]
	mov	w2, 1
	str	wzr, [x21, 60]
	ldr	w3, [x22, 260]
	ldr	w6, [x6, 1696]
	ldr	w7, [x22, 264]
	str	w6, [x21, 64]
	stp	w3, w7, [x21, 84]
	ldr	w6, [x22, 276]
	ldr	w3, [x22, 284]
	ldr	w0, [x22, 300]
	stp	w6, w3, [x21, 92]
	stp	w4, w5, [x21, 112]
	ldr	w6, [x22, 288]
	ldr	w4, [x22, 292]
	ldr	w3, [x22, 296]
	ldr	w1, [x22, 256]
	str	w0, [x21, 128]
	mov	w0, 8
	strb	wzr, [x21, 57]
	strb	wzr, [x21, 58]
	str	w2, [x21, 144]
	str	w4, [x21, 120]
	str	w6, [x21, 100]
	str	w3, [x21, 124]
	str	w1, [x20]
	mov	w20, 0
	ldr	x1, [x19, 32]
	blr	x1
.L103:
	add	sp, x29, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L116:
	ldr	x1, .LC53
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x0, .LC54
	ldr	x4, [x0]
	cbz	x4, .L97
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	mov	w0, w26
	mov	w20, -1
	blr	x4
	b	.L103
	.p2align 3
.L77:
	ldr	x2, .LC55
	str	wzr, [x1, 1992]
	ldr	x8, [x2, 128]
	ldrsb	w2, [x23, 1]
	str	w2, [x1, 1976]
	cbnz	x8, .L122
.L79:
	add	x1, x0, 507904
	mov	w2, 32
	mov	w0, -1
	ldr	w1, [x1, 264]
	cmp	w1, w2
	csel	w1, w1, w2, le
	strb	w1, [x21, 5]
.L82:
	strb	wzr, [x21, 2]
	mov	w2, w0
	ldr	x1, .LC62
	mov	w0, 0
	ldr	x3, [x24, w26, sxtw 3]
	mov	w20, -1
	strb	wzr, [x3, 1696]
	str	wzr, [x3, 1672]
	bl	dprint_vfmw
	b	.L103
.L97:
	mov	w20, -1
	b	.L103
	.p2align 3
.L117:
	add	x1, x0, 475136
	ldr	w1, [x1, 2360]
	tst	w1, -3
	beq	.L75
	cmp	w1, 1
	mov	w20, 0
	beq	.L103
	strb	wzr, [x21, 2]
	mov	w0, 31
	ldr	x1, .LC57
	mov	w20, -1
	ldr	x2, [x24, w26, sxtw 3]
	add	x2, x2, 475136
	ldr	w2, [x2, 2360]
	bl	dprint_vfmw
	b	.L103
	.p2align 3
.L118:
	ldr	w1, [x27, 48]
	mov	w2, 1
	strb	w1, [x21, 2]
	lsl	x1, x25, 6
	add	x25, x1, x25, lsl 3
	ldr	x3, .LC58
	ldr	x1, [x24, w26, sxtw 3]
	mov	w20, w0
	add	x21, x3, x25
	strb	w2, [x1, 1696]
	str	w2, [x1, 1672]
	ldr	w0, [x21, 24]
	cmp	w0, w2
	bne	.L103
	ldr	w0, [x21, 48]
	cbnz	w0, .L103
	ldr	x0, [x19]
	blr	x0
	str	w20, [x21, 24]
	str	w0, [x21, 48]
	b	.L103
.L120:
	ldp	w4, w5, [x23, 4]
	b	.L86
.L119:
	ldr	x1, .LC64
	mov	w3, w28
	mov	w2, 0
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L103
.L114:
	ldr	x3, .LC48
	mov	w2, 612
	ldr	x1, .LC49
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L103
.L115:
	ldr	x3, .LC50
	mov	w2, 613
	ldr	x1, .LC49
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L103
	.size	FSP_ConfigFrameBuf, .-FSP_ConfigFrameBuf
	.align	3
.LC46:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC47:
	.xword	.LANCHOR0
	.align	3
.LC48:
	.xword	.LC7
	.align	3
.LC49:
	.xword	.LC2
	.align	3
.LC50:
	.xword	.LC16
	.align	3
.LC51:
	.xword	s_pstVfmwChan
	.align	3
.LC53:
	.xword	.LC52
	.align	3
.LC54:
	.xword	g_event_report
	.align	3
.LC55:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC57:
	.xword	.LC56
	.align	3
.LC58:
	.xword	g_VfmwChanStat
	.align	3
.LC60:
	.xword	.LC59
	.align	3
.LC62:
	.xword	.LC61
	.align	3
.LC64:
	.xword	.LC63
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetOccupiedNum
	.type	FSP_GetOccupiedNum, %function
FSP_GetOccupiedNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w2
	bl	_mcount
	cmp	w19, 31
	bhi	.L129
	cmp	w20, 1088
	mov	w0, 1
	bgt	.L125
	ldr	x1, .LC68
	mov	w0, 4
	ldr	x1, [x1, w19, sxtw 3]
	add	x1, x1, 507904
	ldr	w1, [x1, 2076]
	cmp	w1, wzr
	csinc	w0, w0, wzr, eq
.L125:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L129:
	ldr	x3, .LC66
	mov	w2, 788
	ldr	x1, .LC67
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L125
	.size	FSP_GetOccupiedNum, .-FSP_GetOccupiedNum
	.align	3
.LC66:
	.xword	.LC7
	.align	3
.LC67:
	.xword	.LC2
	.align	3
.LC68:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IsPmvAvailable
	.type	FSP_IsPmvAvailable, %function
FSP_IsPmvAvailable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrh	w0, [x19, 4]
	ldr	x19, [sp, 16]
	cmp	w0, 1
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_IsPmvAvailable, .-FSP_IsPmvAvailable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetPhyFsNum
	.type	FSP_GetPhyFsNum, %function
FSP_GetPhyFsNum:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w21, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w21, 31
	bhi	.L140
	ldr	x23, .LC73
	ldr	x0, [x23, w21, sxtw 3]
	cbz	x0, .L141
	ldr	x22, .LC75
	mov	w0, 3
	mov	w19, 0
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x3, [x23, w21, sxtw 3]
	add	x2, x3, 20480
	add	x3, x3, 24576
	add	x2, x2, 1776
	add	x4, x3, 624
	b	.L136
	.p2align 3
.L135:
	add	x2, x2, 92
	cmp	x2, x4
	beq	.L142
.L136:
	ldr	w3, [x2]
	cmp	w3, 1
	bne	.L135
	ldr	w0, [x2, -76]
	add	x2, x2, 92
	cmp	w0, w20
	ccmp	w20, wzr, 4, ne
	csinc	w19, w19, w19, ne
	cmp	x2, x4
	bne	.L136
.L142:
	ldr	x1, [x22, 32]
	mov	w0, 3
	blr	x1
	mov	w0, w19
.L133:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L140:
	ldr	x3, .LC71
	mov	w2, 1073
	ldr	x1, .LC72
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L133
.L141:
	ldr	x3, .LC74
	mov	w2, 1074
	ldr	x1, .LC72
	bl	dprint_vfmw
	mov	w0, -1
	b	.L133
	.size	FSP_GetPhyFsNum, .-FSP_GetPhyFsNum
	.align	3
.LC71:
	.xword	.LC7
	.align	3
.LC72:
	.xword	.LC2
	.align	3
.LC73:
	.xword	.LANCHOR0
	.align	3
.LC74:
	.xword	.LC16
	.align	3
.LC75:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_RelsePhyFs
	.type	FSP_RelsePhyFs, %function
FSP_RelsePhyFs:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w20, w0
	mov	x0, x30
	mov	w21, w1
	bl	_mcount
	cmp	w20, 31
	bhi	.L176
	ldr	x22, .LC80
	ldr	x0, [x22, w20, sxtw 3]
	cbz	x0, .L177
	ldr	x23, .LC82
	mov	w0, 3
	mov	w19, 0
	ldr	x1, [x23, 24]
	blr	x1
	ldr	x2, [x22, w20, sxtw 3]
	add	x0, x2, 20480
	add	x0, x0, 1776
	b	.L150
	.p2align 3
.L147:
	add	w19, w19, 1
	add	x0, x0, 92
	cmp	w19, 32
	beq	.L174
.L150:
	ldr	w1, [x0]
	cmp	w1, 1
	bne	.L147
	ldrsb	w1, [x0, -87]
	cbnz	w1, .L147
	ldrsb	w1, [x0, -86]
	cbnz	w1, .L147
	ldr	w1, [x0, -76]
	cmp	w1, w21
	beq	.L147
	sxtw	x24, w19
	lsl	x0, x24, 2
	sub	x0, x0, x24
	lsl	x0, x0, 3
	sub	x24, x0, x24
	add	x2, x2, x24, lsl 2
	add	x24, x2, 20480
	ldr	w25, [x24, 1696]
	mov	w0, w25
	bl	MEM_Phy2Vir
	ldr	w21, [x24, 1700]
	cmp	w19, 31
	mov	x22, x0
	bgt	.L174
	mov	x1, x0
	str	wzr, [x24, 1776]
	mov	w2, w21
	mov	w0, w25
	uxtw	x19, w19
	bl	MEM_DelMemRecord
	ldr	x24, .LC83
	lsl	x1, x19, 6
	add	x19, x1, x19, lsl 3
	ldr	x0, [x24, w20, sxtw 3]
	add	x0, x0, x19
	add	x0, x0, 503808
	ldr	w1, [x0, 2008]
	cmp	w1, 255
	beq	.L152
	ldr	w26, [x0, 2064]
	mov	w0, w26
	bl	MEM_Phy2Vir
	mov	x1, x0
	ldr	x2, [x24, w20, sxtw 3]
	mov	w0, w26
	add	x19, x2, x19
	add	x2, x19, 503808
	ldr	w2, [x2, 2020]
	bl	MEM_DelMemRecord
.L152:
	ldr	x1, [x23, 32]
	mov	w0, 3
	blr	x1
	ldr	x1, [x23, 24]
	mov	w0, 8
	blr	x1
	ldr	x3, [x24, w20, sxtw 3]
	mov	w1, 0
	add	x4, x3, 507904
	add	x0, x4, 680
	b	.L155
	.p2align 3
.L153:
	add	w1, w1, 1
	add	x0, x0, 12
	cmp	w1, 32
	beq	.L156
.L155:
	ldrb	w2, [x0]
	cmp	w2, 1
	bne	.L153
	ldr	w2, [x0, -8]
	cmp	w25, w2
	bne	.L153
	cmp	w1, 31
	bgt	.L156
	sxtw	x1, w1
	lsl	x0, x1, 2
	sub	x1, x0, x1
	add	x0, x4, x1, lsl 2
	strb	wzr, [x0, 680]
.L156:
	add	x0, x3, 503808
	mov	w19, 0
	add	x0, x0, 2000
	b	.L159
	.p2align 3
.L157:
	add	w19, w19, 1
	add	x0, x0, 72
	cmp	w19, 32
	beq	.L160
.L159:
	ldr	w1, [x0]
	cmp	w1, 255
	beq	.L157
	ldr	w1, [x0, 32]
	cmp	w25, w1
	bne	.L157
	cmp	w19, 31
	bgt	.L160
	sxtw	x0, w19
	ldr	x2, .LC84
	lsl	x1, x0, 6
	add	x0, x1, x0, lsl 3
	mov	w1, 255
	add	x0, x3, x0
	ldr	x4, [x2]
	add	x0, x0, 503808
	str	w1, [x0, 2000]
	cbz	x4, .L160
	uxtw	x25, w25
	uxtw	x21, w21
	mov	w3, 24
	add	x2, x29, 88
	mov	w1, 123
	mov	w0, w20
	stp	x25, x22, [x29, 88]
	str	x21, [x29, 104]
	blr	x4
.L160:
	ldr	x1, [x23, 32]
	mov	w0, 8
	blr	x1
	cmp	w19, 31
	ldp	x21, x22, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	csetm	w0, gt
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L174:
	ldr	x1, [x23, 32]
	mov	w0, 3
	blr	x1
	mov	w0, -1
.L173:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
.L176:
	ldr	x3, .LC78
	mov	w2, 1100
	ldr	x1, .LC79
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L173
.L177:
	ldr	x3, .LC81
	mov	w2, 1101
	ldr	x1, .LC79
	bl	dprint_vfmw
	mov	w0, -1
	b	.L173
	.size	FSP_RelsePhyFs, .-FSP_RelsePhyFs
	.align	3
.LC78:
	.xword	.LC7
	.align	3
.LC79:
	.xword	.LC2
	.align	3
.LC80:
	.xword	.LANCHOR0
	.align	3
.LC81:
	.xword	.LC16
	.align	3
.LC82:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC83:
	.xword	s_pstVfmwChan
	.align	3
.LC84:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_RemovePmv
	.type	FSP_RemovePmv, %function
FSP_RemovePmv:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, 31
	bhi	.L184
	cmp	w19, 31
	bhi	.L185
	ldr	x0, .LC89
	ldr	x2, [x0, w20, sxtw 3]
	cbz	x2, .L186
	sxtw	x1, w19
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	add	x0, x2, x0, lsl 4
	ldr	w3, [x0, 176]
	cmp	w3, 2
	beq	.L187
.L178:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L187:
	ldrsb	w0, [x0, 156]
	uxtb	w3, w0
	cmp	w3, 31
	bhi	.L183
	sxtw	x0, w0
	add	x0, x0, 3506
	add	x0, x2, x0, lsl 3
	strb	wzr, [x0, 13]
.L183:
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x1, x0, x1
	add	x1, x2, x1, lsl 4
	str	wzr, [x1, 176]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L184:
	ldr	x3, .LC85
	mov	w2, 1183
	ldr	x1, .LC86
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L185:
	ldr	x3, .LC88
	mov	w2, 1184
	ldr	x1, .LC86
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L186:
	ldr	x3, .LC90
	mov	w2, 1185
	ldr	x1, .LC86
	mov	w0, 0
	bl	dprint_vfmw
	b	.L178
	.size	FSP_RemovePmv, .-FSP_RemovePmv
	.align	3
.LC85:
	.xword	.LC7
	.align	3
.LC86:
	.xword	.LC2
	.align	3
.LC88:
	.xword	.LC87
	.align	3
.LC89:
	.xword	.LANCHOR0
	.align	3
.LC90:
	.xword	.LC16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_SetRef
	.type	FSP_SetRef, %function
FSP_SetRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	sxtw	x19, w1
	mov	w21, w2
	bl	_mcount
	cmp	w20, 31
	bhi	.L217
	cmp	w19, 31
	bhi	.L218
	ldr	x0, .LC94
	ldr	x20, [x0, w20, sxtw 3]
	cbz	x20, .L219
	lsl	x0, x19, 2
	sxtb	w1, w21
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	add	x0, x20, x0, lsl 4
	ldrsb	w2, [x0, 154]
	strb	w1, [x0, 152]
	cbnz	w2, .L188
	ldr	x2, [x0, 184]
	cbz	x2, .L194
	ldr	w0, [x0, 172]
	ldr	w3, [x2, 76]
	cmp	w3, w0
	beq	.L220
.L194:
	lsl	x0, x19, 2
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	add	x0, x20, x0, lsl 4
	ldrsb	w3, [x0, 156]
	uxtb	w1, w3
	cmp	w1, 31
	bhi	.L195
	cmp	w21, 1
	beq	.L221
	cbnz	w21, .L198
	ldr	w1, [x0, 176]
	cmp	w1, 2
	beq	.L222
.L199:
	lsl	x0, x19, 2
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	add	x0, x20, x0, lsl 4
	ldr	x0, [x0, 192]
	cbz	x0, .L208
	ldrsb	w1, [x0, 2]
	cmp	w1, 1
	beq	.L223
.L208:
	lsl	x1, x19, 2
	sub	x1, x1, x19
	lsl	x1, x1, 2
	sub	x1, x1, x19
	lsl	x1, x1, 2
	sub	x19, x1, x19
	add	x19, x20, x19, lsl 4
	str	xzr, [x19, 184]
.L188:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L217:
	ldr	x3, .LC91
	mov	w2, 1208
	ldr	x1, .LC92
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L221:
	ldr	w1, [x0, 176]
	cmp	w1, 1
	beq	.L224
.L197:
	lsl	x0, x19, 2
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	add	x0, x20, x0, lsl 4
	ldr	x1, [x0, 192]
	cbz	x1, .L188
.L203:
	lsl	x0, x19, 2
	ldr	w3, [x1, 76]
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	add	x0, x20, x0, lsl 4
	ldr	w2, [x0, 172]
	cmp	w3, w2
	ccmp	w21, 1, 0, eq
	beq	.L225
.L200:
	cbz	w21, .L208
.L216:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L218:
	ldr	x3, .LC93
	mov	w2, 1209
	ldr	x1, .LC92
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L195:
	ldr	x1, .LC97
	mov	w2, 1257
	mov	w0, 0
	bl	dprint_vfmw
	cbz	w21, .L199
	b	.L197
	.p2align 3
.L220:
	strb	w1, [x2, 1]
	b	.L194
	.p2align 3
.L224:
	sxtw	x1, w3
	mov	w2, 2
	add	x1, x1, 3506
	add	x1, x20, x1, lsl 3
	strb	w21, [x1, 13]
	str	w2, [x0, 176]
.L198:
	lsl	x0, x19, 2
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	add	x0, x20, x0, lsl 4
	ldr	x1, [x0, 192]
	cbnz	x1, .L203
	cbz	w21, .L208
	b	.L216
	.p2align 3
.L225:
	ldrsb	w2, [x1, 2]
	cmp	w2, 1
	bne	.L200
	mov	w2, 2
	strb	w2, [x1, 2]
	strb	w2, [x0, 153]
	cbz	w21, .L208
	b	.L216
	.p2align 3
.L223:
	strb	wzr, [x0, 2]
	b	.L208
	.p2align 3
.L222:
	sxtw	x1, w3
	add	x1, x1, 3506
	add	x1, x20, x1, lsl 3
	strb	wzr, [x1, 13]
	str	wzr, [x0, 160]
	str	wzr, [x0, 176]
	b	.L199
	.p2align 3
.L219:
	ldr	x3, .LC95
	mov	w2, 1210
	ldr	x1, .LC92
	mov	w0, 0
	bl	dprint_vfmw
	b	.L188
	.size	FSP_SetRef, .-FSP_SetRef
	.align	3
.LC91:
	.xword	.LC7
	.align	3
.LC92:
	.xword	.LC2
	.align	3
.LC93:
	.xword	.LC87
	.align	3
.LC94:
	.xword	.LANCHOR0
	.align	3
.LC95:
	.xword	.LC16
	.align	3
.LC97:
	.xword	.LC96
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetRef
	.type	FSP_GetRef, %function
FSP_GetRef:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, 31
	bhi	.L231
	cmp	w19, 31
	bhi	.L232
	ldr	x0, .LC103
	ldr	x2, [x0, w20, sxtw 3]
	cbz	x2, .L233
	sxtw	x1, w19
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x1, x0, x1
	add	x1, x2, x1, lsl 4
	ldrsb	w0, [x1, 152]
.L228:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L231:
	ldr	x3, .LC99
	mov	w2, 1289
	ldr	x1, .LC100
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L228
	.p2align 3
.L232:
	ldr	x3, .LC102
	mov	w2, 1290
	ldr	x1, .LC100
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L228
.L233:
	ldr	x3, .LC104
	mov	w2, 1291
	ldr	x1, .LC100
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L228
	.size	FSP_GetRef, .-FSP_GetRef
	.align	3
.LC99:
	.xword	.LC98
	.align	3
.LC100:
	.xword	.LC2
	.align	3
.LC102:
	.xword	.LC101
	.align	3
.LC103:
	.xword	.LANCHOR0
	.align	3
.LC104:
	.xword	.LC16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_SetDisplay
	.type	FSP_SetDisplay, %function
FSP_SetDisplay:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w21, w0
	mov	x0, x30
	sxtw	x20, w1
	mov	w22, w2
	bl	_mcount
	cmp	w21, 31
	bhi	.L261
	cmp	w20, 31
	bhi	.L262
	ldr	x24, .LC108
	ldr	x0, [x24, w21, sxtw 3]
	cbz	x0, .L263
	ldr	x25, .LC110
	lsl	x19, x20, 2
	sub	x19, x19, x20
	mov	w0, 3
	lsl	x19, x19, 2
	mov	w23, w0
	ldr	x1, [x25, 24]
	sub	x19, x19, x20
	lsl	x19, x19, 2
	sub	x19, x19, x20
	blr	x1
	ldr	x26, [x24, w21, sxtw 3]
	cmp	w22, wzr
	add	x24, x26, x19, lsl 4
	csel	w1, wzr, w23, eq
	ldrsb	w0, [x24, 154]
	strb	w1, [x24, 153]
	cbnz	w0, .L247
	ldr	x1, [x24, 192]
	cbz	x1, .L247
	ldr	w3, [x1, 76]
	ldr	w2, [x24, 172]
	cmp	w3, w2
	bne	.L264
	cbnz	w22, .L243
	strb	wzr, [x24, 153]
	mov	w0, w21
	strb	wzr, [x1, 2]
	bl	VCTRL_GetVidStd
	cmp	w0, 17
	beq	.L265
.L245:
	lsl	x1, x20, 2
	sub	x1, x1, x20
	lsl	x1, x1, 2
	sub	x1, x1, x20
	lsl	x1, x1, 2
	sub	x1, x1, x20
	add	x20, x26, x1, lsl 4
	str	xzr, [x20, 192]
.L247:
	ldr	x1, [x25, 32]
	mov	w0, 3
	blr	x1
.L234:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L261:
	ldr	x3, .LC105
	mov	w2, 1304
	ldr	x1, .LC106
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L243:
	mov	w0, w21
	bl	VCTRL_GetVidStd
	cmp	w0, 17
	beq	.L266
.L246:
	lsl	x0, x20, 2
	mov	w1, 3
	sub	x0, x0, x20
	lsl	x0, x0, 2
	sub	x0, x0, x20
	lsl	x0, x0, 2
	sub	x20, x0, x20
	add	x20, x26, x20, lsl 4
	ldr	x0, [x20, 192]
	strb	w1, [x20, 153]
	strb	w1, [x0, 2]
	b	.L247
	.p2align 3
.L262:
	ldr	x3, .LC107
	mov	w2, 1305
	ldr	x1, .LC106
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L264:
	ldr	x1, .LC112
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x1, [x25, 32]
	mov	w0, w23
	blr	x1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L263:
	ldr	x3, .LC109
	mov	w2, 1306
	ldr	x1, .LC106
	bl	dprint_vfmw
	b	.L234
	.p2align 3
.L266:
	ldr	x0, [x24, 192]
	cbz	x0, .L246
	ldr	w1, [x0, 84]
	add	w1, w1, 1
	str	w1, [x0, 84]
	b	.L246
	.p2align 3
.L265:
	ldr	x0, [x24, 192]
	cbz	x0, .L245
	ldr	w1, [x0, 84]
	cbz	w1, .L245
	add	x19, x26, x19, lsl 4
	sub	w1, w1, #1
	str	w1, [x0, 84]
	ldr	x0, [x19, 192]
	ldr	w1, [x0, 84]
	cbz	w1, .L245
	mov	w1, 3
	strb	w1, [x0, 2]
	b	.L245
	.size	FSP_SetDisplay, .-FSP_SetDisplay
	.align	3
.LC105:
	.xword	.LC7
	.align	3
.LC106:
	.xword	.LC2
	.align	3
.LC107:
	.xword	.LC87
	.align	3
.LC108:
	.xword	.LANCHOR0
	.align	3
.LC109:
	.xword	.LC16
	.align	3
.LC110:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC112:
	.xword	.LC111
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ClearNotInVoQueue
	.type	FSP_ClearNotInVoQueue, %function
FSP_ClearNotInVoQueue:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	cmp	w20, 31
	bhi	.L278
	cbz	x22, .L279
	ldr	x0, .LC117
	ldr	x19, [x0, w20, sxtw 3]
	cbz	x19, .L280
	add	x21, x19, 20480
	add	x19, x19, 200
	add	x21, x21, 1736
	b	.L273
	.p2align 3
.L272:
	add	x19, x19, 688
	cmp	x19, x21
	beq	.L281
.L273:
	ldr	w1, [x19, 148]
	mov	w0, w20
	mov	w2, 0
	bl	FSP_SetRef
	mov	x1, x19
	mov	x0, x22
	bl	IsImageInVoQueue
	cbz	w0, .L272
	ldr	w1, [x19, 148]
	mov	w2, 0
	mov	w0, w20
	add	x19, x19, 688
	bl	FSP_SetDisplay
	cmp	x19, x21
	bne	.L273
.L281:
	mov	w0, 0
.L269:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L278:
	ldr	x3, .LC113
	mov	w2, 501
	ldr	x1, .LC114
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L269
.L280:
	ldr	x3, .LC118
	mov	w2, 503
	ldr	x1, .LC114
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L269
.L279:
	ldr	x3, .LC116
	mov	w2, 502
	ldr	x1, .LC114
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L269
	.size	FSP_ClearNotInVoQueue, .-FSP_ClearNotInVoQueue
	.align	3
.LC113:
	.xword	.LC7
	.align	3
.LC114:
	.xword	.LC2
	.align	3
.LC116:
	.xword	.LC115
	.align	3
.LC117:
	.xword	.LANCHOR0
	.align	3
.LC118:
	.xword	.LC16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetDisplay
	.type	FSP_GetDisplay, %function
FSP_GetDisplay:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, 31
	bhi	.L287
	ldr	x0, .LC121
	ldr	x2, [x0, w20, sxtw 3]
	cbz	x2, .L288
	cmp	w19, 31
	bhi	.L289
	sxtw	x1, w19
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x1, x0, x1
	add	x1, x2, x1, lsl 4
	ldrsb	w0, [x1, 153]
.L284:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L287:
	ldr	x3, .LC119
	mov	w2, 1379
	ldr	x1, .LC120
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L284
	.p2align 3
.L289:
	ldr	x3, .LC123
	mov	w2, 1381
	ldr	x1, .LC120
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L284
.L288:
	ldr	x3, .LC122
	mov	w2, 1380
	ldr	x1, .LC120
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L284
	.size	FSP_GetDisplay, .-FSP_GetDisplay
	.align	3
.LC119:
	.xword	.LC7
	.align	3
.LC120:
	.xword	.LC2
	.align	3
.LC121:
	.xword	.LANCHOR0
	.align	3
.LC122:
	.xword	.LC16
	.align	3
.LC123:
	.xword	.LC87
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_SetStoreType
	.type	FSP_SetStoreType, %function
FSP_SetStoreType:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w22, w1
	sxtw	x19, w2
	mov	w20, w3
	bl	_mcount
	cmp	w21, 31
	bhi	.L299
	ldr	x0, .LC126
	ldr	x3, [x0, w21, sxtw 3]
	cbz	x3, .L300
	cmp	w19, 31
	bhi	.L301
	cbz	w22, .L302
	cmp	w22, 1
	bne	.L298
	ldrsb	w0, [x3, 4]
	cmp	w19, w0
	bge	.L298
	lsl	x2, x19, 2
	mov	w0, 0
	sub	x2, x2, x19
	lsl	x2, x2, 3
	sub	x2, x2, x19
	add	x19, x3, x2, lsl 2
	add	x19, x19, 24576
	str	w20, [x19, 616]
.L292:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L302:
	ldrsb	w0, [x3, 3]
	cmp	w19, w0
	bge	.L298
	lsl	x2, x19, 2
	mov	w0, 0
	sub	x2, x2, x19
	lsl	x2, x2, 3
	sub	x19, x2, x19
	add	x19, x3, x19, lsl 2
	add	x19, x19, 20480
	str	w20, [x19, 1768]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L298:
	mov	w0, -1
	b	.L292
	.p2align 3
.L299:
	ldr	x3, .LC124
	mov	w2, 1394
	ldr	x1, .LC125
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L292
	.p2align 3
.L301:
	ldr	x3, .LC129
	mov	w2, 1396
	ldr	x1, .LC125
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L292
.L300:
	ldr	x3, .LC127
	mov	w2, 1395
	ldr	x1, .LC125
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L292
	.size	FSP_SetStoreType, .-FSP_SetStoreType
	.align	3
.LC124:
	.xword	.LC7
	.align	3
.LC125:
	.xword	.LC2
	.align	3
.LC126:
	.xword	.LANCHOR0
	.align	3
.LC127:
	.xword	.LC16
	.align	3
.LC129:
	.xword	.LC128
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetStoreType
	.type	FSP_GetStoreType, %function
FSP_GetStoreType:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w21, w1
	sxtw	x20, w2
	bl	_mcount
	cmp	w19, 31
	bhi	.L312
	ldr	x0, .LC132
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L313
	cmp	w20, 31
	bhi	.L314
	cbnz	w21, .L308
	ldrsb	w2, [x1, 3]
	mov	w0, 2
	cmp	w20, w2
	bge	.L305
	lsl	x0, x20, 2
	sub	x0, x0, x20
	lsl	x0, x0, 3
	sub	x20, x0, x20
	add	x1, x1, x20, lsl 2
	add	x1, x1, 20480
	ldr	w0, [x1, 1768]
	b	.L305
	.p2align 3
.L312:
	ldr	x3, .LC130
	mov	w2, 1425
	ldr	x1, .LC131
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
.L305:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L314:
	ldr	x3, .LC134
	mov	w2, 1427
	ldr	x1, .LC131
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L308:
	cmp	w21, 1
	mov	w0, 2
	bne	.L305
	ldrsb	w2, [x1, 4]
	cmp	w20, w2
	bge	.L305
	lsl	x0, x20, 2
	sub	x0, x0, x20
	lsl	x0, x0, 3
	sub	x0, x0, x20
	add	x0, x1, x0, lsl 2
	add	x0, x0, 24576
	ldr	w0, [x0, 616]
	b	.L305
	.p2align 3
.L313:
	ldr	x3, .LC133
	mov	w2, 1426
	ldr	x1, .LC131
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L305
	.size	FSP_GetStoreType, .-FSP_GetStoreType
	.align	3
.LC130:
	.xword	.LC7
	.align	3
.LC131:
	.xword	.LC2
	.align	3
.LC132:
	.xword	.LANCHOR0
	.align	3
.LC133:
	.xword	.LC16
	.align	3
.LC134:
	.xword	.LC128
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ClearLogicFs
	.type	FSP_ClearLogicFs, %function
FSP_ClearLogicFs:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 31
	ccmp	w20, 31, 2, ls
	bhi	.L315
	ldr	x21, .LC135
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L315
	mov	w2, 0
	mov	w1, w20
	mov	w0, w19
	bl	FSP_SetRef
	sxtw	x0, w20
	ldr	x2, [x21, w19, sxtw 3]
	lsl	x1, x0, 2
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x0, x1, x0
	add	x0, x2, x0, lsl 4
	ldrsb	w0, [x0, 153]
	cmp	w0, 3
	beq	.L315
	mov	w2, 0
	mov	w1, w20
	mov	w0, w19
	bl	FSP_SetDisplay
.L315:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	FSP_ClearLogicFs, .-FSP_ClearLogicFs
	.align	3
.LC135:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetLogicFs
	.type	FSP_GetLogicFs, %function
FSP_GetLogicFs:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, 31
	ccmp	w19, 31, 2, ls
	bhi	.L328
	ldr	x0, .LC136
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L328
	sxtw	x1, w19
	lsl	x2, x1, 2
	sub	x2, x2, x1
	lsl	x2, x2, 2
	sub	x2, x2, x1
	lsl	x2, x2, 2
	sub	x1, x2, x1
	ldp	x19, x20, [sp, 16]
	add	x0, x0, x1, lsl 4
	add	x0, x0, 152
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L328:
	mov	x0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_GetLogicFs, .-FSP_GetLogicFs
	.align	3
.LC136:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetFsImagePtr
	.type	FSP_GetFsImagePtr, %function
FSP_GetFsImagePtr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, 31
	ccmp	w19, 31, 2, ls
	bhi	.L332
	ldr	x0, .LC137
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L332
	sxtw	x1, w19
	lsl	x2, x1, 2
	sub	x2, x2, x1
	lsl	x2, x2, 2
	sub	x2, x2, x1
	lsl	x2, x2, 2
	sub	x1, x2, x1
	ldp	x19, x20, [sp, 16]
	add	x0, x0, x1, lsl 4
	add	x0, x0, 200
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L332:
	mov	x0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_GetFsImagePtr, .-FSP_GetFsImagePtr
	.align	3
.LC137:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetDecPhyFs
	.type	FSP_GetDecPhyFs, %function
FSP_GetDecPhyFs:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, 31
	ccmp	w19, 31, 2, ls
	bhi	.L336
	ldr	x0, .LC138
	ldr	x2, [x0, w20, sxtw 3]
	cbz	x2, .L336
	sxtw	x1, w19
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x1, x0, x1
	ldp	x19, x20, [sp, 16]
	add	x1, x2, x1, lsl 4
	ldp	x29, x30, [sp], 32
	ldr	x0, [x1, 184]
	ret
	.p2align 3
.L336:
	mov	x0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_GetDecPhyFs, .-FSP_GetDecPhyFs
	.align	3
.LC138:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetDispPhyFs
	.type	FSP_GetDispPhyFs, %function
FSP_GetDispPhyFs:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, 31
	ccmp	w19, 31, 2, ls
	bhi	.L340
	ldr	x0, .LC139
	ldr	x2, [x0, w20, sxtw 3]
	cbz	x2, .L340
	sxtw	x1, w19
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x1, x0, x1
	ldp	x19, x20, [sp, 16]
	add	x1, x2, x1, lsl 4
	ldp	x29, x30, [sp], 32
	ldr	x0, [x1, 192]
	ret
	.p2align 3
.L340:
	mov	x0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_GetDispPhyFs, .-FSP_GetDispPhyFs
	.align	3
.LC139:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetPmvAddr
	.type	FSP_GetPmvAddr, %function
FSP_GetPmvAddr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, 31
	ccmp	w19, 31, 2, ls
	bhi	.L344
	ldr	x0, .LC140
	ldr	x2, [x0, w20, sxtw 3]
	cbz	x2, .L344
	sxtw	x1, w19
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x1, x0, x1
	ldp	x19, x20, [sp, 16]
	add	x1, x2, x1, lsl 4
	ldp	x29, x30, [sp], 32
	ldr	w0, [x1, 160]
	ret
	.p2align 3
.L344:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_GetPmvAddr, .-FSP_GetPmvAddr
	.align	3
.LC140:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetDecFsAddrTab
	.type	FSP_GetDecFsAddrTab, %function
FSP_GetDecFsAddrTab:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w22, w0
	mov	x0, x30
	mov	x19, x1
	mov	x20, x2
	mov	x21, x3
	bl	_mcount
	cmp	w22, 31
	bhi	.L356
	ldr	x2, .LC143
	ldr	x0, [x2, w22, sxtw 3]
	cbz	x0, .L357
	cbz	x20, .L358
	cbz	x19, .L359
	ldrsb	w3, [x0, 3]
	mov	w1, 92
	str	w3, [x19]
	mov	w0, 0
	cmp	w3, wzr
	ldr	x6, [x2, w22, sxtw 3]
	add	x6, x6, 20480
	add	x6, x6, 1688
	ble	.L345
	.p2align 2
.L354:
	smaddl	x4, w0, w1, x6
	ldr	w5, [x4, 8]
	str	w5, [x20, w0, sxtw 2]
	ldr	w4, [x4, 24]
	str	w4, [x21, w0, sxtw 2]
	add	w0, w0, 1
	ldr	w4, [x19]
	cmp	w4, w0
	bgt	.L354
.L345:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L356:
	ldr	x3, .LC141
	mov	w2, 1544
	ldr	x1, .LC142
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L357:
	ldr	x3, .LC144
	mov	w2, 1545
	ldr	x1, .LC142
	bl	dprint_vfmw
	b	.L345
.L358:
	ldr	x3, .LC146
	mov	w2, 1546
	ldr	x1, .LC142
	mov	w0, 0
	bl	dprint_vfmw
	b	.L345
.L359:
	ldr	x3, .LC148
	mov	w2, 1547
	ldr	x1, .LC142
	mov	w0, 0
	bl	dprint_vfmw
	b	.L345
	.size	FSP_GetDecFsAddrTab, .-FSP_GetDecFsAddrTab
	.align	3
.LC141:
	.xword	.LC7
	.align	3
.LC142:
	.xword	.LC2
	.align	3
.LC143:
	.xword	.LANCHOR0
	.align	3
.LC144:
	.xword	.LC16
	.align	3
.LC146:
	.xword	.LC145
	.align	3
.LC148:
	.xword	.LC147
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetPmvAddrTab
	.type	FSP_GetPmvAddrTab, %function
FSP_GetPmvAddrTab:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	mov	x19, x2
	bl	_mcount
	cmp	w20, 31
	bhi	.L371
	ldr	x0, .LC151
	ldr	x4, [x0, w20, sxtw 3]
	cbz	x4, .L372
	cbz	x19, .L373
	cbz	x21, .L374
	ldrsb	w0, [x4, 5]
	mov	w3, 0
	str	w0, [x21]
	ldrsb	w0, [x4, 5]
	cmp	w0, wzr
	ble	.L360
	.p2align 2
.L369:
	sxtw	x0, w3
	add	x0, x0, 3506
	add	x0, x4, x0, lsl 3
	ldr	w0, [x0, 8]
	str	w0, [x19, w3, sxtw 2]
	add	w3, w3, 1
	ldrsb	w0, [x4, 5]
	cmp	w0, w3
	bgt	.L369
.L360:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L371:
	ldr	x3, .LC149
	mov	w2, 1568
	ldr	x1, .LC150
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L372:
	ldr	x3, .LC152
	mov	w2, 1569
	ldr	x1, .LC150
	mov	w0, 0
	bl	dprint_vfmw
	b	.L360
.L373:
	ldr	x3, .LC154
	mov	w2, 1570
	ldr	x1, .LC150
	mov	w0, 0
	bl	dprint_vfmw
	b	.L360
.L374:
	ldr	x3, .LC156
	mov	w2, 1571
	ldr	x1, .LC150
	mov	w0, 0
	bl	dprint_vfmw
	b	.L360
	.size	FSP_GetPmvAddrTab, .-FSP_GetPmvAddrTab
	.align	3
.LC149:
	.xword	.LC7
	.align	3
.LC150:
	.xword	.LC2
	.align	3
.LC151:
	.xword	.LANCHOR0
	.align	3
.LC152:
	.xword	.LC16
	.align	3
.LC154:
	.xword	.LC153
	.align	3
.LC156:
	.xword	.LC155
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetInstInfo
	.type	FSP_GetInstInfo, %function
FSP_GetInstInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 31
	bhi	.L379
	ldr	x0, .LC159
	ldr	x3, [x0, w20, sxtw 3]
	cbz	x3, .L380
	ldrsb	w1, [x3, 3]
	add	x0, x3, 20480
	strb	w1, [x19, 2]
	mov	x2, 2944
	ldr	x5, .LC161
	add	x1, x0, 1688
	ldr	w6, [x0, 1696]
	ldr	w4, [x0, 1788]
	add	x0, x19, 8
	sub	w4, w4, w6
	str	w4, [x19, 4]
	ldrsb	w4, [x3, 4]
	strb	w4, [x19, 3]
	ldrsb	w4, [x3]
	strb	w4, [x19]
	ldrsb	w3, [x3, 5]
	strb	w3, [x19, 1]
	ldr	x3, [x5, 104]
	blr	x3
.L375:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L379:
	ldr	x3, .LC157
	mov	w2, 1588
	ldr	x1, .LC158
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L380:
	ldr	x3, .LC160
	mov	w2, 1589
	ldr	x1, .LC158
	mov	w0, 0
	bl	dprint_vfmw
	b	.L375
	.size	FSP_GetInstInfo, .-FSP_GetInstInfo
	.align	3
.LC157:
	.xword	.LC7
	.align	3
.LC158:
	.xword	.LC2
	.align	3
.LC159:
	.xword	.LANCHOR0
	.align	3
.LC160:
	.xword	.LC16
	.align	3
.LC161:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetLogicIdByPhyAddr
	.type	FSP_GetLogicIdByPhyAddr, %function
FSP_GetLogicIdByPhyAddr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, 31
	bhi	.L393
	ldr	x1, .LC164
	mov	w0, 0
	ldr	x1, [x1, w20, sxtw 3]
	add	x2, x1, 184
	cbnz	x1, .L390
	b	.L394
	.p2align 3
.L385:
	add	w0, w0, 1
	cmp	w0, 32
	beq	.L395
.L390:
	ldr	x3, [x2]
	add	x2, x2, 688
	cbz	x3, .L385
	ldr	w3, [x3, 8]
	cmp	w3, w19
	bne	.L385
.L383:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L395:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L393:
	ldr	x3, .LC162
	mov	w2, 1610
	ldr	x1, .LC163
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L383
.L394:
	ldr	x3, .LC165
	mov	w2, 1611
	ldr	x1, .LC163
	bl	dprint_vfmw
	mov	w0, -1
	b	.L383
	.size	FSP_GetLogicIdByPhyAddr, .-FSP_GetLogicIdByPhyAddr
	.align	3
.LC162:
	.xword	.LC7
	.align	3
.LC163:
	.xword	.LC2
	.align	3
.LC164:
	.xword	.LANCHOR0
	.align	3
.LC165:
	.xword	.LC16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetNullLogicFs
	.type	FSP_GetNullLogicFs, %function
FSP_GetNullLogicFs:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L410
	ldr	x0, .LC168
	ldr	x3, [x0, w19, sxtw 3]
	cbz	x3, .L399
	add	x1, x3, 20480
	ldrsb	w0, [x1, 1001]
	cbz	w0, .L411
	add	x1, x1, 313
	mov	w0, 30
	b	.L402
	.p2align 3
.L413:
	sub	w0, w0, #1
	cmn	w0, #1
	beq	.L412
.L402:
	ldrsb	w2, [x1]
	sub	x1, x1, #688
	cbnz	w2, .L413
.L400:
	sxtw	x1, w0
	lsl	x2, x1, 2
	sub	x2, x2, x1
	lsl	x2, x2, 2
	sub	x2, x2, x1
	lsl	x2, x2, 2
	sub	x1, x2, x1
	add	x1, x3, x1, lsl 4
	stp	xzr, xzr, [x1, 184]
.L398:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L412:
	mov	w0, 0
	b	.L400
.L411:
	mov	w0, 31
	b	.L400
.L410:
	ldr	x3, .LC166
	mov	w2, 1637
	ldr	x1, .LC167
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L398
.L399:
	ldr	x3, .LC169
	mov	w2, 1638
	ldr	x1, .LC167
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L398
	.size	FSP_GetNullLogicFs, .-FSP_GetNullLogicFs
	.align	3
.LC166:
	.xword	.LC7
	.align	3
.LC167:
	.xword	.LC2
	.align	3
.LC168:
	.xword	.LANCHOR0
	.align	3
.LC169:
	.xword	.LC16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetFspType
	.type	FSP_GetFspType, %function
FSP_GetFspType:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L418
	ldr	x0, .LC172
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L419
	ldr	w0, [x0, 28]
	cmp	w0, 1
	csetm	w0, ne
.L416:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L418:
	ldr	x3, .LC170
	mov	w2, 1659
	ldr	x1, .LC171
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L416
.L419:
	ldr	x3, .LC173
	mov	w2, 1660
	ldr	x1, .LC171
	bl	dprint_vfmw
	mov	w0, -1
	b	.L416
	.size	FSP_GetFspType, .-FSP_GetFspType
	.align	3
.LC170:
	.xword	.LC7
	.align	3
.LC171:
	.xword	.LC2
	.align	3
.LC172:
	.xword	.LANCHOR0
	.align	3
.LC173:
	.xword	.LC16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetTotalValidFsNum
	.type	FSP_GetTotalValidFsNum, %function
FSP_GetTotalValidFsNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L424
	ldr	x0, .LC176
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L425
	ldrsb	w0, [x0, 2]
.L422:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L424:
	ldr	x3, .LC174
	mov	w2, 1674
	ldr	x1, .LC175
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L422
.L425:
	ldr	x3, .LC177
	mov	w2, 1675
	ldr	x1, .LC175
	bl	dprint_vfmw
	mov	w0, -1
	b	.L422
	.size	FSP_GetTotalValidFsNum, .-FSP_GetTotalValidFsNum
	.align	3
.LC174:
	.xword	.LC7
	.align	3
.LC175:
	.xword	.LC2
	.align	3
.LC176:
	.xword	.LANCHOR0
	.align	3
.LC177:
	.xword	.LC16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IsSpecialFrm
	.type	FSP_IsSpecialFrm, %function
FSP_IsSpecialFrm:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, 31
	bhi	.L436
	ldr	x0, .LC180
	ldr	x3, [x0, w20, sxtw 3]
	cbz	x3, .L431
	sub	w1, w19, #1
	mov	w0, 0
	cmn	w1, #3
	bhi	.L428
	add	x2, x3, 507904
	ldr	w1, [x2, 2016]
	cbz	w1, .L428
	ldr	w0, [x2, 1492]
	cmp	w19, w0
	beq	.L435
	mov	w2, 0
	b	.L429
	.p2align 3
.L430:
	add	x0, x0, 3165
	add	x0, x3, x0, lsl 4
	ldr	w0, [x0, 4]
	cmp	w19, w0
	beq	.L435
.L429:
	add	w2, w2, 1
	cmp	w2, w1
	sxtw	x0, w2
	add	x0, x0, 28672
	bne	.L430
.L431:
	mov	w0, 0
.L428:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L435:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L436:
	ldr	x3, .LC178
	mov	w2, 1685
	ldr	x1, .LC179
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L428
	.size	FSP_IsSpecialFrm, .-FSP_IsSpecialFrm
	.align	3
.LC178:
	.xword	.LC7
	.align	3
.LC179:
	.xword	.LC2
	.align	3
.LC180:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_EmptyInstance
	.type	FSP_EmptyInstance, %function
FSP_EmptyInstance:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L459
	ldr	x0, .LC183
	ldr	x22, [x0, w19, sxtw 3]
	cbz	x22, .L460
	ldr	x3, .LC185
	mov	x2, 22016
	mov	w1, 0
	add	x0, x22, 152
	mov	w24, 0
	mov	w21, 4
	ldr	x3, [x3, 96]
	blr	x3
	ldrsb	w0, [x22, 3]
	cmp	w0, wzr
	ble	.L447
	.p2align 2
.L455:
	sxtw	x23, w24
	mov	w0, w19
	lsl	x20, x23, 2
	add	w24, w24, 1
	sub	x20, x20, x23
	lsl	x20, x20, 3
	sub	x20, x20, x23
	add	x20, x22, x20, lsl 2
	add	x20, x20, 20480
	ldr	w1, [x20, 1696]
	bl	FSP_IsSpecialFrm
	cmp	w0, 1
	mov	w1, 0
	strb	wzr, [x20, 1689]
	csel	w1, w21, w1, eq
	strb	wzr, [x20, 1688]
	strb	w1, [x20, 1690]
	str	wzr, [x20, 1764]
	ldrsb	w0, [x22, 3]
	cmp	w0, w24
	bgt	.L455
.L447:
	ldrsb	w0, [x22, 4]
	mov	w24, 0
	mov	w21, 4
	cmp	w0, wzr
	ble	.L443
	.p2align 2
.L454:
	sxtw	x23, w24
	mov	w0, w19
	lsl	x20, x23, 2
	add	w24, w24, 1
	sub	x20, x20, x23
	lsl	x20, x20, 3
	sub	x20, x20, x23
	add	x20, x22, x20, lsl 2
	add	x20, x20, 24576
	ldr	w1, [x20, 544]
	bl	FSP_IsSpecialFrm
	cmp	w0, 1
	mov	w1, 0
	strb	wzr, [x20, 537]
	csel	w1, w21, w1, eq
	strb	wzr, [x20, 536]
	strb	w1, [x20, 538]
	str	wzr, [x20, 612]
	ldrsb	w0, [x22, 4]
	cmp	w0, w24
	bgt	.L454
.L443:
	ldrsb	w0, [x22, 5]
	cmp	w0, wzr
	ble	.L449
	sub	w1, w0, #1
	mov	x3, 28068
	add	x0, x22, 24576
	mov	w2, 1
	add	x1, x3, x1, uxtw 3
	add	x0, x0, 3484
	add	x1, x22, x1
	.p2align 2
.L453:
	strb	w2, [x0]
	add	x0, x0, 8
	strb	wzr, [x0, -7]
	cmp	x1, x0
	bne	.L453
.L449:
	mov	w0, 0
	str	wzr, [x22, 12]
.L439:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L459:
	ldr	x3, .LC181
	mov	w2, 446
	ldr	x1, .LC182
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L439
.L460:
	ldr	x3, .LC184
	mov	w2, 447
	ldr	x1, .LC182
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L439
	.size	FSP_EmptyInstance, .-FSP_EmptyInstance
	.align	3
.LC181:
	.xword	.LC7
	.align	3
.LC182:
	.xword	.LC2
	.align	3
.LC183:
	.xword	.LANCHOR0
	.align	3
.LC184:
	.xword	.LC16
	.align	3
.LC185:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IsDecFsAvailable
	.type	FSP_IsDecFsAvailable, %function
FSP_IsDecFsAvailable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 31
	bhi	.L466
	ldr	w1, [x20, 88]
	mov	w0, 0
	cmp	w1, 1
	beq	.L467
.L463:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L467:
	ldr	w1, [x20]
	tst	w1, 16776960
	bne	.L463
	ldr	w1, [x20, 8]
	mov	w0, w19
	bl	FSP_IsSpecialFrm
	cmp	w0, wzr
	cset	w0, eq
	b	.L463
	.p2align 3
.L466:
	ldr	x3, .LC186
	mov	w2, 804
	ldr	x1, .LC187
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 255
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_IsDecFsAvailable, .-FSP_IsDecFsAvailable
	.align	3
.LC186:
	.xword	.LC7
	.align	3
.LC187:
	.xword	.LC2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IfCanGetDecFs
	.type	FSP_IfCanGetDecFs, %function
FSP_IfCanGetDecFs:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 31
	bhi	.L486
	cbz	x19, .L487
	ldr	x0, .LC191
	ldr	x21, [x0, w20, sxtw 3]
	cbz	x21, .L488
	add	x22, x21, 20480
	add	x23, x21, 24576
	add	x19, x22, 1688
	add	x23, x23, 536
	b	.L473
	.p2align 3
.L490:
	cmp	x19, x23
	beq	.L489
.L473:
	mov	x1, x19
	mov	w0, w20
	add	x19, x19, 92
	bl	FSP_IsDecFsAvailable
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L490
	mov	w0, 0
.L483:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L489:
	add	x2, x22, 1776
	mov	w4, 0
	mov	w1, 0
	b	.L475
	.p2align 3
.L474:
	add	w1, w1, 1
	cmp	w1, 32
	beq	.L491
.L475:
	ldr	w0, [x2]
	add	x2, x2, 92
	cmp	w0, 1
	bne	.L474
	sxtw	x3, w1
	add	w1, w1, 1
	lsl	x0, x3, 2
	sub	x0, x0, x3
	lsl	x0, x0, 3
	sub	x0, x0, x3
	add	x0, x21, x0, lsl 2
	add	x0, x0, 20480
	ldr	w0, [x0, 1688]
	and	w0, w0, 16776960
	cmp	w0, 196608
	csinc	w4, w4, w4, ne
	cmp	w1, 32
	bne	.L475
.L491:
	ldr	w0, [x21, 40]
	cmp	w0, 1088
	bgt	.L492
	ldr	x1, .LC193
	mov	w0, 4
	ldr	x1, [x1, w20, sxtw 3]
	add	x1, x1, 507904
	ldr	w1, [x1, 2076]
	cmp	w1, wzr
	csinc	w0, w0, wzr, eq
	cmp	w4, w0
	csetm	w0, le
.L493:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L492:
	mov	w0, 1
	cmp	w4, w0
	csetm	w0, le
	b	.L493
.L486:
	ldr	x3, .LC188
	mov	w2, 529
	ldr	x1, .LC189
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L483
.L488:
	ldr	x3, .LC192
	mov	w2, 531
	ldr	x1, .LC189
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L483
.L487:
	ldr	x3, .LC190
	mov	w2, 530
	ldr	x1, .LC189
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L483
	.size	FSP_IfCanGetDecFs, .-FSP_IfCanGetDecFs
	.align	3
.LC188:
	.xword	.LC7
	.align	3
.LC189:
	.xword	.LC2
	.align	3
.LC190:
	.xword	.LC115
	.align	3
.LC191:
	.xword	.LANCHOR0
	.align	3
.LC192:
	.xword	.LC16
	.align	3
.LC193:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IsNewFsAvalible
	.type	FSP_IsNewFsAvalible, %function
FSP_IsNewFsAvalible:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	cmp	w20, 31
	bhi	.L532
	ldr	x21, .LC196
	ldr	x19, [x21, w20, sxtw 3]
	cbz	x19, .L533
	ldrsb	w0, [x19, 3]
	cbnz	w0, .L498
.L505:
	mov	w0, 1
.L530:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L498:
	mov	w0, w20
	bl	VCTRL_GetVidStd
	cmp	w0, 17
	beq	.L499
	ldrsb	w0, [x19, 3]
	cmp	w0, wzr
	ble	.L503
	mov	w22, 0
	b	.L502
	.p2align 3
.L534:
	add	w22, w22, 1
	cmp	w0, w22
	ble	.L503
.L502:
	sxtw	x2, w22
	mov	w0, w20
	lsl	x1, x2, 2
	sub	x1, x1, x2
	lsl	x1, x1, 3
	sub	x1, x1, x2
	add	x1, x19, x1, lsl 2
	add	x1, x1, 20480
	add	x1, x1, 1688
	bl	FSP_IsDecFsAvailable
	uxtb	w0, w0
	cmp	w0, 1
	ldrsb	w0, [x19, 3]
	bne	.L534
	cmp	w0, w22
	ble	.L503
.L509:
	mov	w0, w20
	bl	VCTRL_GetVidStd
	cmp	w0, 17
	beq	.L505
	ldrsb	w2, [x19, 5]
	cmp	w2, wzr
	ble	.L510
	add	x0, x19, 24576
	ldrh	w0, [x0, 3484]
	cmp	w0, 1
	beq	.L505
	mov	w1, 0
	b	.L511
	.p2align 3
.L512:
	add	x0, x19, x0, lsl 3
	ldrh	w0, [x0, 12]
	cmp	w0, 1
	beq	.L505
.L511:
	add	w1, w1, 1
	cmp	w1, w2
	sxtw	x0, w1
	add	x0, x0, 3506
	bne	.L512
.L515:
	mov	w0, w20
	bl	VCTRL_GetVidStd
	cbz	w0, .L505
	mov	w0, w20
	bl	VCTRL_GetVidStd
	cmp	w0, 16
	beq	.L505
	mov	w0, w20
	bl	VCTRL_GetVidStd
	cmp	w0, 15
	beq	.L505
	.p2align 2
.L503:
	ldr	x0, [x21, w20, sxtw 3]
	cbz	x0, .L535
	mov	w0, 0
.L536:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L499:
	ldr	x0, .LC198
	add	x22, x19, 20480
	add	x22, x22, 1688
	mov	w23, 0
	ldr	x0, [x0, w20, sxtw 3]
	add	x0, x0, 823296
	ldr	w24, [x0, 1128]
	b	.L508
	.p2align 3
.L506:
	add	w23, w23, 1
	add	x22, x22, 92
	cmp	w23, 32
	beq	.L503
.L508:
	mov	x1, x22
	mov	w0, w20
	bl	FSP_IsDecFsAvailable
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L506
	ldr	w0, [x22, 12]
	cmp	w24, w0
	bne	.L506
	cmp	w23, 31
	ble	.L509
	b	.L503
	.p2align 3
.L535:
	ldr	x1, .LC200
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	b	.L536
.L510:
	bne	.L503
	b	.L515
	.p2align 3
.L532:
	ldr	x3, .LC194
	mov	w2, 836
	ldr	x1, .LC195
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L530
.L533:
	ldr	x3, .LC197
	mov	w2, 837
	ldr	x1, .LC195
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L530
	.size	FSP_IsNewFsAvalible, .-FSP_IsNewFsAvalible
	.align	3
.LC194:
	.xword	.LC7
	.align	3
.LC195:
	.xword	.LC2
	.align	3
.LC196:
	.xword	.LANCHOR0
	.align	3
.LC197:
	.xword	.LC16
	.align	3
.LC198:
	.xword	s_pstVfmwChan
	.align	3
.LC200:
	.xword	.LC199
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_NewLogicFs
	.type	FSP_NewLogicFs, %function
FSP_NewLogicFs:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	sxtw	x21, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w21, 31
	bhi	.L577
	ldr	x23, .LC203
	ldr	x0, [x23, w21, sxtw 3]
	cbz	x0, .L578
	ldr	x22, .LC205
	mov	w0, 3
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x24, [x23, w21, sxtw 3]
	mov	w1, 0
	add	x0, x24, 152
	.p2align 2
.L543:
	ldrsb	w2, [x0]
	cbnz	w2, .L541
	ldrsb	w2, [x0, 1]
	cbz	w2, .L579
.L541:
	add	w1, w1, 1
	add	x0, x0, 688
	cmp	w1, 32
	bne	.L543
.L544:
	ldr	x1, .LC207
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x1, [x22, 32]
	mov	w0, 3
	blr	x1
	mov	w0, -1
.L574:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L579:
	sxtw	x25, w1
	lsl	x19, x25, 2
	sub	x19, x19, x25
	lsl	x19, x19, 2
	sub	x19, x19, x25
	lsl	x19, x19, 2
	sub	x19, x19, x25
	lsl	x19, x19, 4
	add	x0, x24, x19
	adds	x19, x0, 152
	strb	w1, [x0, 155]
	strb	wzr, [x0, 154]
	beq	.L544
	str	wzr, [x0, 160]
	stp	xzr, xzr, [x0, 184]
	cbnz	w20, .L545
	add	x1, x24, 24576
	add	x2, x24, 56
	stp	x2, x2, [x0, 184]
	mov	w2, 1
	ldr	w1, [x1, 3480]
	str	w1, [x0, 160]
	ldrb	w1, [x24, 5]
	strb	w2, [x0, 154]
	sub	w1, w1, #1
	strb	w1, [x0, 156]
.L546:
	lsl	x0, x25, 2
	mov	w1, 1
	sub	x0, x0, x25
	mov	w2, 1
	lsl	x0, x0, 2
	add	x19, x19, 48
	sub	x0, x0, x25
	lsl	x0, x0, 2
	sub	x0, x0, x25
	lsl	x0, x0, 4
	add	x23, x24, x0
	add	x0, x23, 200
	ldr	x3, [x23, 192]
	strb	w1, [x23, 153]
	strb	w1, [x3, 2]
	str	w2, [x23, 176]
	ldr	x2, [x23, 184]
	ldr	w1, [x24, 12]
	str	w1, [x23, 172]
	str	w1, [x2, 76]
	ldr	x1, [x23, 192]
	ldr	w2, [x23, 172]
	str	w2, [x1, 76]
	mov	x2, 640
	ldr	w1, [x24, 12]
	add	w1, w1, 1
	str	w1, [x24, 12]
	mov	w1, 0
	ldr	x3, [x22, 96]
	ldp	x20, x26, [x23, 184]
	blr	x3
	ldrsb	w0, [x23, 155]
	str	w0, [x19, 148]
	ldr	w0, [x20, 56]
	str	w0, [x19, 68]
	ldr	w0, [x20, 60]
	str	w0, [x19, 72]
	ldr	w0, [x26, 28]
	str	w0, [x19, 112]
	ldr	w0, [x26, 32]
	str	w0, [x19, 116]
	ldr	w0, [x26, 48]
	str	w0, [x19, 136]
	ldr	w0, [x26, 52]
	str	w0, [x19, 140]
	ldr	w0, [x20, 8]
	str	w0, [x19, 36]
	bl	MEM_Phy2Vir
	str	x0, [x19, 504]
	ldr	w1, [x19, 36]
	ldr	w0, [x20, 64]
	add	w0, w1, w0
	str	w0, [x19, 40]
	bl	MEM_Phy2Vir
	str	x0, [x19, 512]
	ldr	w1, [x26, 8]
	str	w1, [x19, 20]
	ldr	w0, [x26, 64]
	add	w0, w1, w0
	str	w0, [x19, 24]
	ldr	w2, [x26, 28]
	add	w1, w2, w1
	str	w1, [x19, 28]
	ldr	w1, [x19, 36]
	ldr	w2, [x26, 32]
	add	w0, w2, w0
	str	w0, [x19, 32]
	ldr	w0, [x20, 36]
	str	w0, [x19, 144]
	ldr	x0, [x19, 504]
	ldr	w2, [x20, 40]
	add	w2, w2, w1
	str	w2, [x19, 44]
	ldrsw	x2, [x20, 40]
	add	x2, x2, x0
	str	x2, [x19, 528]
	ldp	w3, w2, [x20, 40]
	add	w2, w3, w2
	add	w1, w2, w1
	str	w1, [x19, 48]
	ldpsw	x2, x1, [x20, 40]
	add	x1, x2, x1
	add	x0, x1, x0
	str	x0, [x19, 536]
	ldr	w0, [x20, 24]
	str	w0, [x19, 212]
	ldr	w0, [x20, 24]
	bl	MEM_Phy2Vir
	str	x0, [x19, 520]
	ldr	w0, [x20, 16]
	str	w0, [x19, 424]
	bl	MEM_Phy2Vir
	str	x0, [x19, 432]
	ldr	x1, [x22, 32]
	mov	w0, 3
	ldr	w2, [x20, 20]
	str	w2, [x19, 420]
	blr	x1
	ldr	x0, .LC214
	lsl	x1, x21, 6
	add	x21, x1, x21, lsl 3
	add	x21, x0, x21
	ldr	w0, [x21, 24]
	cmp	w0, 3
	beq	.L580
.L565:
	lsl	x0, x25, 2
	sub	x0, x0, x25
	lsl	x0, x0, 2
	sub	x0, x0, x25
	lsl	x0, x0, 2
	sub	x25, x0, x25
	ldp	x19, x20, [sp, 16]
	add	x24, x24, x25, lsl 4
	ldp	x21, x22, [sp, 32]
	ldp	x25, x26, [sp, 64]
	ldrsb	w0, [x24, 155]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L545:
	mov	w0, w21
	ldr	x23, [x23, w21, sxtw 3]
	bl	VCTRL_GetVidStd
	cmp	w0, 17
	beq	.L547
	ldrsb	w0, [x23, 3]
	mov	w26, 0
	cmp	w0, wzr
	bgt	.L568
	.p2align 2
.L549:
	lsl	x20, x25, 2
	sub	x20, x20, x25
	lsl	x20, x20, 2
	sub	x20, x20, x25
	lsl	x20, x20, 2
	sub	x20, x20, x25
	add	x20, x24, x20, lsl 4
	ldr	x1, [x20, 184]
	cbz	x1, .L581
	ldrsb	w0, [x24, 5]
	cmp	w0, wzr
	ble	.L556
	mov	w0, w21
	bl	VCTRL_GetVidStd
	cmp	w0, 17
	beq	.L557
	ldrsb	w2, [x24, 5]
	add	x4, x24, 24576
	cmp	w2, wzr
	ble	.L558
	ldrh	w0, [x4, 3484]
	cmp	w0, 1
	beq	.L559
	mov	w1, 0
	b	.L560
	.p2align 3
.L562:
	add	x0, x24, x0, lsl 3
	ldrh	w3, [x0, 12]
	cmp	w3, 1
	beq	.L582
.L560:
	add	w1, w1, 1
	cmp	w1, w2
	sxtw	x0, w1
	add	x0, x0, 3506
	bne	.L562
.L558:
	cmp	w2, wzr
	ldr	w5, [x24, 8]
	ble	.L564
.L561:
	sub	w2, w2, #1
	mov	x0, 28069
	add	x1, x4, 3485
	add	x0, x0, x2, uxtw 3
	add	x0, x24, x0
	.p2align 2
.L563:
	strb	wzr, [x1], 8
	cmp	x1, x0
	bne	.L563
.L564:
	lsl	x20, x25, 2
	ldr	x1, .LC213
	sub	x20, x20, x25
	mov	w0, 0
	lsl	x20, x20, 2
	sub	x20, x20, x25
	lsl	x20, x20, 2
	sub	x20, x20, x25
	add	x20, x24, x20, lsl 4
	strb	wzr, [x20, 156]
	ldr	w2, [x4, 3480]
	stp	w2, w5, [x20, 160]
	bl	dprint_vfmw
	ldr	x1, [x20, 184]
	.p2align 2
.L556:
	lsl	x0, x25, 2
	sub	x0, x0, x25
	lsl	x0, x0, 2
	sub	x0, x0, x25
	lsl	x0, x0, 2
	sub	x0, x0, x25
	add	x0, x24, x0, lsl 4
	str	x1, [x0, 192]
	b	.L546
	.p2align 3
.L583:
	ldrsb	w0, [x23, 3]
	cmp	w26, w0
	bge	.L549
.L568:
	sxtw	x20, w26
	mov	w0, w21
	lsl	x1, x20, 2
	add	w26, w26, 1
	sub	x1, x1, x20
	lsl	x1, x1, 3
	sub	x20, x1, x20
	add	x20, x23, x20, lsl 2
	add	x20, x20, 20480
	add	x20, x20, 1688
	mov	x1, x20
	bl	FSP_IsDecFsAvailable
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L583
	str	x20, [x19, 32]
	b	.L549
	.p2align 3
.L580:
	ldr	w0, [x21, 56]
	cbnz	w0, .L565
	ldr	x0, [x22]
	blr	x0
	str	w0, [x21, 56]
	mov	w1, 4
	str	w1, [x21, 24]
	b	.L565
.L547:
	ldr	x0, .LC208
	add	x20, x23, 20480
	add	x23, x23, 24576
	add	x20, x20, 1688
	add	x23, x23, 536
	ldr	x0, [x0, w21, sxtw 3]
	add	x0, x0, 823296
	ldr	w26, [x0, 1128]
	b	.L554
	.p2align 3
.L553:
	add	x20, x20, 92
	cmp	x20, x23
	beq	.L549
.L554:
	mov	x1, x20
	mov	w0, w21
	bl	FSP_IsDecFsAvailable
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L553
	ldr	w0, [x20, 12]
	cmp	w26, w0
	bne	.L553
	str	x20, [x19, 32]
	b	.L549
.L582:
	lsl	x3, x25, 2
	cmp	w1, w2
	sub	x3, x3, x25
	lsl	x3, x3, 2
	sub	x3, x3, x25
	lsl	x3, x3, 2
	sub	x3, x3, x25
	add	x3, x24, x3, lsl 4
	strb	w1, [x3, 156]
	ldr	w0, [x0, 8]
	str	w0, [x3, 160]
	ldr	w5, [x24, 8]
	str	w5, [x3, 164]
	bge	.L561
.L566:
	lsl	x0, x25, 2
	sub	x0, x0, x25
	lsl	x0, x0, 2
	sub	x0, x0, x25
	lsl	x0, x0, 2
	sub	x0, x0, x25
	add	x0, x24, x0, lsl 4
	ldr	x1, [x0, 184]
	b	.L556
.L557:
	add	x0, x24, 24576
	strb	wzr, [x20, 156]
	ldr	x1, [x20, 184]
	ldr	w0, [x0, 3480]
	str	w0, [x20, 160]
	ldr	w0, [x24, 8]
	str	w0, [x20, 164]
	b	.L556
.L577:
	ldr	x3, .LC201
	mov	w2, 931
	ldr	x1, .LC202
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L574
.L578:
	ldr	x3, .LC204
	mov	w2, 932
	ldr	x1, .LC202
	bl	dprint_vfmw
	mov	w0, -1
	b	.L574
.L559:
	strb	wzr, [x20, 156]
	ldr	w0, [x4, 3480]
	str	w0, [x20, 160]
	ldr	w0, [x24, 8]
	str	w0, [x20, 164]
	b	.L566
.L581:
	ldr	x2, .LC209
	mov	w0, 0
	ldr	x1, .LC211
	bl	dprint_vfmw
	ldr	x1, [x22, 32]
	mov	w0, 3
	blr	x1
	mov	w0, -1
	b	.L574
	.size	FSP_NewLogicFs, .-FSP_NewLogicFs
	.align	3
.LC201:
	.xword	.LC7
	.align	3
.LC202:
	.xword	.LC2
	.align	3
.LC203:
	.xword	.LANCHOR0
	.align	3
.LC204:
	.xword	.LC16
	.align	3
.LC205:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC207:
	.xword	.LC206
	.align	3
.LC208:
	.xword	s_pstVfmwChan
	.align	3
.LC209:
	.xword	.LANCHOR1
	.align	3
.LC211:
	.xword	.LC210
	.align	3
.LC213:
	.xword	.LC212
	.align	3
.LC214:
	.xword	g_VfmwChanStat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_SetSingleFrameBuf
	.type	FSP_SetSingleFrameBuf, %function
FSP_SetSingleFrameBuf:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 31
	bhi	.L631
	ldr	x0, .LC217
	mov	w7, 32
	ldr	x8, [x0, w20, sxtw 3]
	add	x0, x8, 503808
	add	x6, x8, 507904
	ldr	w1, [x0, 1980]
	ldr	w0, [x6, 1440]
	cmp	w1, w7
	csel	w7, w1, w7, le
	str	w7, [x6, 256]
	ldr	w1, [x19]
	cmp	w1, 255
	beq	.L604
	ldrb	w1, [x6, 680]
	cbz	w1, .L605
	add	x2, x6, 692
	mov	x3, 1
	b	.L589
	.p2align 3
.L633:
	add	w3, w3, 1
	cmp	w3, 32
	beq	.L632
.L589:
	ldrb	w4, [x2]
	add	x2, x2, 12
	cbnz	w4, .L633
.L588:
	uxtw	x5, w3
	add	x4, x6, 208
	lsl	x1, x5, 2
	ldr	w2, [x19, 32]
	sub	x1, x1, x5
	mov	w9, 1
	add	w2, w2, 1023
	add	x5, x5, 20
	add	x1, x4, x1, lsl 2
	and	w2, w2, -1024
	add	w0, w0, w2
	str	w2, [x1, 464]
	ldr	w2, [x19, 12]
	str	w2, [x1, 468]
	strb	w9, [x1, 472]
	ldr	w2, [x4, 60]
	add	w2, w2, 1
	str	w2, [x4, 60]
	str	w0, [x4, x5, lsl 2]
	ldr	w0, [x19, 4]
	cmp	w0, 255
	beq	.L587
	ldr	w0, [x19, 48]
	str	w0, [x1, 848]
	ldr	w0, [x19, 16]
	str	w0, [x1, 852]
	strb	w9, [x1, 856]
	ldr	w0, [x4, 68]
	add	w0, w0, 1
	str	w0, [x4, 68]
.L587:
	ldr	w0, [x19, 8]
	cmp	w0, 255
	beq	.L602
	ldrb	w0, [x6, 420]
	cbz	w0, .L634
	add	x2, x6, 428
	mov	w0, 1
	b	.L592
	.p2align 3
.L635:
	add	w0, w0, 1
	cmp	w0, 32
	beq	.L602
.L592:
	ldrb	w4, [x2]
	add	x2, x2, 8
	cbnz	w4, .L635
.L591:
	add	x0, x8, x0, uxtw 3
	ldr	w4, [x19, 64]
	add	x0, x0, 507904
	mov	w2, 1
	str	w4, [x0, 416]
	strb	w2, [x0, 420]
	ldr	w0, [x6, 272]
	add	w0, w0, 1
	str	w0, [x6, 272]
.L602:
	ldr	x0, .LC218
	ldr	x5, [x0, w20, sxtw 3]
	add	x8, x5, 20480
	strb	w7, [x5, 3]
	strb	wzr, [x5, 4]
	ldrsb	w7, [x6, 264]
	strb	w7, [x5, 5]
	ldr	w0, [x8, 1776]
	cbz	w0, .L606
	add	x2, x8, 1868
	mov	x0, 1
	b	.L595
	.p2align 3
.L594:
	add	w0, w0, 1
	cmp	w0, 32
	beq	.L636
.L595:
	ldr	w4, [x2]
	add	x2, x2, 92
	cbnz	w4, .L594
	mov	w9, w0
.L593:
	lsl	x2, x0, 2
	ldr	w4, [x5, 16]
	sub	x2, x2, x0
	lsl	x1, x3, 2
	lsl	x2, x2, 3
	sub	x1, x1, x3
	sub	x0, x2, x0
	add	w2, w4, 1
	str	w2, [x5, 16]
	add	x2, x6, 208
	add	x0, x5, x0, lsl 2
	add	x1, x2, x1, lsl 2
	add	x0, x0, 20480
	add	x3, x3, 20
	add	x4, x5, 36
	str	w9, [x0, 1692]
	mov	w9, 1
	ldr	w10, [x1, 464]
	str	w10, [x0, 1696]
	ldr	w1, [x1, 468]
	str	w1, [x0, 1700]
	ldr	w1, [x2, x3, lsl 2]
	str	w1, [x0, 1712]
	ldr	w1, [x2, 4]
	str	w1, [x0, 1716]
	ldr	w1, [x2, 8]
	str	w1, [x0, 1720]
	ldr	w1, [x2, 20]
	str	w1, [x0, 1724]
	ldr	w1, [x2, 28]
	str	w1, [x0, 1728]
	ldr	w1, [x2, 32]
	str	w1, [x0, 1732]
	ldr	w1, [x2, 12]
	str	w1, [x0, 1736]
	ldr	w1, [x2, 16]
	str	w1, [x0, 1740]
	ldr	w3, [x4, 4]
	str	w3, [x0, 1744]
	ldr	w4, [x4, 8]
	str	w4, [x0, 1748]
	ldr	w1, [x2, 36]
	str	w1, [x0, 1752]
	ldr	w1, [x2, 40]
	str	w1, [x0, 1756]
	ldr	w1, [x2, 44]
	str	w1, [x0, 1760]
	str	w9, [x0, 1776]
	strb	wzr, [x0, 1689]
	strb	wzr, [x0, 1690]
	ldr	w0, [x5, 20]
	cmp	w0, w7
	bcs	.L597
	ldr	w1, [x19, 8]
	cmp	w1, 255
	beq	.L597
	uxtw	x1, w0
	add	w0, w0, 1
	add	x2, x2, x1, lsl 3
	add	x1, x5, x1, lsl 3
	add	x1, x1, 24576
	ldr	w2, [x2, 208]
	str	w2, [x1, 3480]
	strb	wzr, [x1, 3485]
	strb	w9, [x1, 3484]
	str	w0, [x5, 20]
.L597:
	ldr	w1, [x5, 24]
	add	x2, x6, 208
	ldr	w0, [x6, 256]
	cmp	w1, w0
	bcc	.L637
.L598:
	ldr	w2, [x6, 260]
	mov	w0, 0
	ldr	w1, [x5, 144]
	add	x6, x6, 208
	str	w2, [x5, 8]
	cbnz	w1, .L617
	str	wzr, [x5, 60]
	mov	w1, 1
	ldr	w2, [x8, 1696]
	str	w2, [x5, 64]
	ldr	w2, [x6, 4]
	str	w2, [x5, 84]
	ldr	w2, [x6, 8]
	str	w2, [x5, 88]
	stp	w3, w4, [x5, 112]
	ldr	w2, [x6, 36]
	str	w2, [x5, 120]
	ldr	w2, [x6, 40]
	str	w2, [x5, 124]
	ldr	w2, [x6, 44]
	str	w2, [x5, 128]
	strb	wzr, [x5, 57]
	strb	wzr, [x5, 58]
	str	w1, [x5, 144]
.L617:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L637:
	ldr	w0, [x19, 4]
	cmp	w0, 255
	beq	.L598
	ldr	w7, [x6, 276]
	uxtw	x10, w1
	lsl	x0, x10, 2
	add	w1, w1, 1
	sub	w9, w7, #1
	sub	x0, x0, x10
	lsl	x7, x9, 2
	lsl	x0, x0, 3
	sub	x7, x7, x9
	sub	x0, x0, x10
	add	x7, x2, x7, lsl 2
	add	x0, x5, x0, lsl 2
	add	x0, x0, 20480
	ldr	w7, [x7, 848]
	str	w7, [x0, 1704]
	ldr	w7, [x6, 276]
	sub	w9, w7, #1
	lsl	x7, x9, 2
	sub	x7, x7, x9
	add	x2, x2, x7, lsl 2
	ldr	w2, [x2, 852]
	str	w2, [x0, 1708]
	str	w1, [x5, 24]
	b	.L598
	.p2align 3
.L636:
	ldr	x2, .LC219
	mov	w0, 1
	ldr	x1, .LC223
	add	x2, x2, 16
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L604:
	mov	x3, 0
	b	.L587
	.p2align 3
.L632:
	ldr	x2, .LC219
	mov	w0, 1
	ldr	x1, .LC221
	add	x2, x2, 16
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L606:
	mov	w9, 0
	mov	x0, 0
	b	.L593
.L605:
	mov	x3, 0
	b	.L588
.L634:
	mov	w0, 0
	b	.L591
.L631:
	ldr	x3, .LC215
	mov	w2, 1719
	ldr	x1, .LC216
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L617
	.size	FSP_SetSingleFrameBuf, .-FSP_SetSingleFrameBuf
	.align	3
.LC215:
	.xword	.LC7
	.align	3
.LC216:
	.xword	.LC2
	.align	3
.LC217:
	.xword	s_pstVfmwChan
	.align	3
.LC218:
	.xword	.LANCHOR0
	.align	3
.LC219:
	.xword	.LANCHOR1
	.align	3
.LC221:
	.xword	.LC220
	.align	3
.LC223:
	.xword	.LC222
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetInst
	.type	FSP_GetInst, %function
FSP_GetInst:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L641
	ldr	x0, .LC227
	ldr	x0, [x0, w19, sxtw 3]
.L640:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L641:
	ldr	x2, .LC224
	mov	w3, w19
	ldr	x1, .LC226
	mov	w0, 1
	add	x2, x2, 40
	bl	dprint_vfmw
	mov	x0, 0
	b	.L640
	.size	FSP_GetInst, .-FSP_GetInst
	.align	3
.LC224:
	.xword	.LANCHOR1
	.align	3
.LC226:
	.xword	.LC225
	.align	3
.LC227:
	.xword	.LANCHOR0
	.global	s_pFspInst
	.section	.rodata
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.11745, %object
	.size	__func__.11745, 15
__func__.11745:
	.string	"FSP_NewLogicFs"
	.zero	1
	.type	__func__.11937, %object
	.size	__func__.11937, 22
__func__.11937:
	.string	"FSP_SetSingleFrameBuf"
	.zero	2
	.type	__func__.11947, %object
	.size	__func__.11947, 12
__func__.11947:
	.string	"FSP_GetInst"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	ASCII(.string	"pFspInst = NULL" )
.LC2:
	ASCII(.string	"fsp.c,L%d: %s\n" )
	.zero	1
.LC7:
	ASCII(.string	"InstID out of range" )
	.zero	4
.LC11:
	ASCII(.string	"fsp instance not in used" )
	.zero	7
.LC16:
	ASCII(.string	"fsp is not inited" )
	.zero	6
.LC22:
	ASCII(.string	"fsp is already inited" )
	.zero	2
.LC38:
	ASCII(.string	"pstFspInstCfg = NULL" )
	.zero	3
.LC41:
	ASCII(.string	"This inst is not active" )
.LC52:
	ASCII(.string	"user set decode channel max resolution is (w=%d,h=%d), this stream (w=%d,h=%d) can NOT be decoded!\n" )
	.zero	4
.LC56:
	ASCII(.string	"DFS, Wrong Partition State. State: 0x%x\n" )
	.zero	7
.LC59:
	ASCII(.string	"DFS, Mem Element Fill Successed! Ready to Decode!\n" )
	.zero	5
.LC61:
	ASCII(.string	"Fsp arrange failed, return %d\n" )
	.zero	1
.LC63:
	ASCII(.string	"arrange ret %d, min = %d, actual = %d\n" )
	.zero	1
.LC87:
	ASCII(.string	"LogicFrameID out of range" )
	.zero	6
.LC96:
	ASCII(.string	"fsp.c, line %d: pstLogicFs->PmvIdc out of range(=%d)\n" )
	.zero	2
.LC98:
	ASCII(.string	"FSP_GetRef: InstID out of range" )
.LC101:
	ASCII(.string	"FSP_GetRef: LogicFrameID out of range" )
	.zero	2
.LC111:
	ASCII(.string	"FSP_SetDisplay: LogicTick=%d, DispTick=%d!\n" )
	.zero	4
.LC115:
	ASCII(.string	"pstVoQue is NULL" )
	.zero	7
.LC128:
	ASCII(.string	"PhyFsID out of range" )
	.zero	3
.LC145:
	ASCII(.string	"DecFsAddrTab is NULL\n" )
	.zero	2
.LC147:
	ASCII(.string	"DecFsNum is NULL\n" )
	.zero	6
.LC153:
	ASCII(.string	"PmvAddrTab is NULL\n" )
	.zero	4
.LC155:
	ASCII(.string	"PmvNum is NULL\n" )
.LC199:
	ASCII(.string	"FSP_IsFsLeak: fsp is not inited \n" )
	.zero	6
.LC206:
	ASCII(.string	"no logic frame store!!!\n" )
	.zero	7
.LC210:
	ASCII(.string	"%s no decode phy fs\n" )
	.zero	3
.LC212:
	ASCII(.string	"no pmv memory\n" )
	.zero	1
.LC220:
	ASCII(.string	"%s no free frame record position.\n" )
	.zero	5
.LC222:
	ASCII(.string	"%s no free dec fs record position.\n" )
	.zero	4
.LC225:
	ASCII(.string	"%s InstID %d out of range\n" )
	.bss
	.align	3
.LANCHOR0 = . + 0
	.type	s_pFspInst, %object
	.size	s_pFspInst, 256
s_pFspInst:
	.zero	256
	.type	MemArrange.11695, %object
	.size	MemArrange.11695, 1232
MemArrange.11695:
	.zero	1232
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
