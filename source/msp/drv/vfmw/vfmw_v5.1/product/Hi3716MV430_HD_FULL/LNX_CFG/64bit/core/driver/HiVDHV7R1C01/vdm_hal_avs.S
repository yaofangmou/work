#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal_avs.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	AVSHAL_StartDec_ConfigWQMatrix.part.0, %function
AVSHAL_StartDec_ConfigWQMatrix.part.0:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	w21, w1
	mov	x0, x30
	mov	x20, x2
	bl	_mcount
	cbz	w21, .L1
	mov	w9, 1
	ldr	x10, .LC0
	add	w1, w21, w9
	mov	x2, x20
	mov	w0, 6
	mov	w11, w9
	b	.L7
	.p2align 3
.L11:
	ldrb	w4, [x13, 280]
	ldrb	w6, [x12, 280]
	ldrb	w5, [x8, 280]
	ldrb	w3, [x7, 280]
	lsl	w5, w5, 8
	orr	w5, w5, w6, lsl 16
	orr	w3, w3, w4, lsl 24
	ldr	x4, [x10, 856]
	orr	w3, w5, w3
	ldr	w5, [x10, 864]
	sub	x4, x2, x4
	cmp	x4, x5
	blt	.L5
.L12:
	add	w9, w9, 1
	str	w11, [x10, 852]
	cmp	w1, w9
	add	x2, x2, 4
	add	w0, w0, 4
	beq	.L1
.L7:
	sub	w6, w0, #3
	sub	w5, w0, #5
	sub	w4, w0, #7
	sub	w3, w0, #9
	lsl	w12, w9, 2
	sub	w8, w0, #4
	sub	w7, w2, w20
	add	x6, x19, x6, sxtw 2
	add	x5, x19, x5, sxtw 2
	add	x4, x19, x4, sxtw 2
	add	x3, x19, x3, sxtw 2
	add	x12, x19, x12, sxtw 2
	add	x8, x19, x8, sxtw 2
	add	x13, x19, x0, sxtw 2
	add	x7, x19, x7, sxtw 2
	tbnz	x9, 0, .L11
	ldrb	w4, [x4, 280]
	ldrb	w6, [x6, 280]
	ldrb	w5, [x5, 280]
	ldrb	w3, [x3, 280]
	lsl	w5, w5, 16
	orr	w5, w5, w6, lsl 24
	orr	w3, w3, w4, lsl 8
	ldr	x4, [x10, 856]
	orr	w3, w5, w3
	ldr	w5, [x10, 864]
	sub	x4, x2, x4
	cmp	x4, x5
	bge	.L12
.L5:
	add	w9, w9, 1
	str	w3, [x2]
	cmp	w1, w9
	add	x2, x2, 4
	add	w0, w0, 4
	bne	.L7
.L1:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVSHAL_StartDec_ConfigWQMatrix.part.0, .-AVSHAL_StartDec_ConfigWQMatrix.part.0
	.align	3
.LC0:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVSHAL_StartDec_ConfigWQMatrix
	.type	AVSHAL_StartDec_ConfigWQMatrix, %function
AVSHAL_StartDec_ConfigWQMatrix:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	mov	x21, x2
	bl	_mcount
	ldrb	w0, [x19, 45]
	cmp	w0, 1
	bne	.L13
	mov	x2, x21
	mov	w1, w20
	mov	x0, x19
	bl	AVSHAL_StartDec_ConfigWQMatrix.part.0
.L13:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVSHAL_StartDec_ConfigWQMatrix, .-AVSHAL_StartDec_ConfigWQMatrix
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVSHAL_WriteSliceMsg
	.type	AVSHAL_WriteSliceMsg, %function
AVSHAL_WriteSliceMsg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	mov	w20, w1
	add	x19, x22, 568
	bl	_mcount
	ldr	x21, .LC2
	sxtw	x1, w20
	ldr	w23, [x22, 80]
	lsl	x0, x1, 7
	sub	x0, x0, x1
	add	x0, x21, x0, lsl 3
	ldr	w24, [x0, 40]
	mov	w0, w24
	add	w20, w24, 320
	bl	MEM_Phy2Vir
	add	x6, x0, 320
	ldrh	w8, [x22, 72]
	ldrh	w2, [x22, 74]
	ldr	w1, [x19, 16]
	mul	w8, w8, w2
	cbz	w1, .L66
	ldr	w1, [x22, 568]
	add	w1, w1, 4
	sub	w1, w1, w23
	ubfiz	w2, w1, 3, 4
	and	w3, w1, -16
	cmp	w2, 7
	bls	.L77
	sub	w4, w2, #8
	ldr	x2, [x21, 856]
	ldr	w1, [x21, 864]
	sub	x5, x6, x2
	cmp	x5, x1
	blt	.L19
.L81:
	mov	w4, 1
	str	w4, [x21, 852]
	add	x4, x0, 321
	sub	x4, x4, x2
	cmp	x4, x1
	blt	.L21
.L82:
	mov	w3, 1
	str	w3, [x21, 852]
	add	x3, x0, 322
	sub	x3, x3, x2
	cmp	x3, x1
	blt	.L23
.L83:
	mov	w3, 1
	str	w3, [x21, 852]
	add	x3, x0, 323
	sub	x3, x3, x2
	cmp	x3, x1
	blt	.L25
.L84:
	mov	w3, 1
	str	w3, [x21, 852]
	sub	w4, w8, #1
	ldr	w3, [x19, 16]
	sub	w3, w3, #1
	cmp	w3, w4
	bcs	.L67
.L85:
	add	x5, x0, 324
	mov	w4, w3
	sub	x5, x5, x2
	mov	w3, 1
	cmp	x5, x1
	mov	w9, 0
	blt	.L28
.L86:
	mov	w4, 1
	str	w4, [x21, 852]
	add	x4, x0, 383
	cmp	w9, 1
	add	w24, w24, 576
	sub	x2, x4, x2
	csel	w24, w24, wzr, ne
	cmp	x2, x1
	blt	.L31
.L87:
	mov	w12, 1
	str	w12, [x21, 852]
	b	.L16
	.p2align 3
.L66:
	mov	w3, 1
	mov	w9, 0
	mov	w12, 0
.L16:
	ldr	w4, [x22, 116]
	cmp	w4, wzr
	cset	w0, gt
	tst	w3, w0
	beq	.L15
	lsr	w11, w8, 1
	mov	w1, 0
	sub	w8, w8, #1
	sub	w13, w11, #1
	mov	w7, 0
	mov	w0, 0
	mov	w10, 1
	.p2align 2
.L64:
	cmp	w7, 255
	eor	w3, w9, 1
	bgt	.L34
	sxtw	x15, w0
	cmp	w0, wzr
	lsl	x3, x15, 3
	sub	x3, x3, x15
	add	x3, x19, x3, lsl 2
	ldr	w2, [x3, 16]
	ble	.L36
	ldr	w5, [x3, -12]
	cmp	w2, w5
	bls	.L76
.L36:
	cmp	w8, w2
	mov	w16, w8
	bcc	.L76
	ldp	w1, w2, [x3]
	ldr	w4, [x3, 8]
	add	w1, w1, 4
	sub	w1, w1, w23
	sub	w4, w4, #4
	and	w30, w1, -16
	lsl	w4, w4, 3
	ubfiz	w1, w1, 3, 4
	cbz	w2, .L74
	lsl	x5, x15, 3
	sub	x5, x5, x15
	add	x5, x22, x5, lsl 2
	ldr	w5, [x5, 580]
	cmp	w5, wzr
	ble	.L74
	ldr	w14, [x3, 12]
	sub	w2, w2, w23
	and	w5, w2, -16
	ubfiz	w2, w2, 3, 4
	lsl	w14, w14, 3
	cbnz	w4, .L78
	mov	w4, w14
	mov	w1, w2
	mov	w30, w5
.L74:
	mov	w5, 0
	mov	w18, 0
.L39:
	cmp	w1, 7
	bhi	.L40
	add	w2, w1, 120
	sub	w30, w30, #4
	add	w1, w4, 8
.L41:
	lsl	w4, w0, 6
	ldr	x17, [x21, 856]
	ldr	w14, [x21, 864]
	sxtw	x4, w4
	add	x24, x6, x4
	sub	x24, x24, x17
	cmp	x24, x14
	blt	.L42
	str	w10, [x21, 852]
.L43:
	add	x2, x4, 1
	add	x2, x6, x2
	sub	x2, x2, x17
	cmp	x2, x14
	blt	.L44
	str	w10, [x21, 852]
.L45:
	add	x2, x4, 2
	add	x2, x6, x2
	sub	x2, x2, x17
	cmp	x2, x14
	blt	.L46
	str	w10, [x21, 852]
.L47:
	add	x1, x4, 3
	add	x1, x6, x1
	sub	x1, x1, x17
	cmp	x1, x14
	blt	.L48
	str	w10, [x21, 852]
.L49:
	ldr	w5, [x22, 116]
	add	w1, w0, 1
	cmp	w1, w5
	bge	.L50
	sxtw	x2, w1
	ldr	w14, [x3, 16]
	lsl	x0, x2, 3
	sub	x0, x0, x2
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 16]
	cmp	w14, w0
	bcs	.L52
	b	.L50
	.p2align 3
.L53:
	sub	x0, x0, x2
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 16]
	cmp	w0, w14
	bhi	.L50
.L52:
	add	w1, w1, 1
	cmp	w1, w5
	sxtw	x2, w1
	lsl	x0, x2, 3
	blt	.L53
.L50:
	cmp	w5, w1
	beq	.L79
	ldrb	w0, [x22, 21]
	sxtw	x2, w1
	cmp	w0, 1
	lsl	x0, x2, 3
	sub	x0, x0, x2
	add	x0, x19, x0, lsl 2
	ldr	w2, [x0, 16]
	sub	w2, w2, #1
	beq	.L80
.L75:
	ldr	w17, [x3, 16]
.L57:
	cmp	w2, w8
	bcs	.L72
	add	w14, w12, w1
	mov	w16, w2
	eor	w3, w9, 1
	add	w14, w20, w14, lsl 8
.L55:
	add	x0, x4, 4
	ldr	x2, [x21, 856]
	add	x0, x6, x0
	ldr	w5, [x21, 864]
	sub	x0, x0, x2
	cmp	x0, x5
	blt	.L60
	str	w10, [x21, 852]
.L61:
	add	x4, x4, 63
	add	x4, x6, x4
	sub	x2, x4, x2
	cmp	x2, x5
	blt	.L62
	str	w10, [x21, 852]
.L63:
	ldr	w4, [x22, 116]
	add	w7, w7, 1
.L34:
	sub	w0, w1, #1
.L37:
	add	w0, w0, 1
	cmp	w4, w0
	cset	w2, gt
	tst	w3, w2
	bne	.L64
.L15:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L76:
	eor	w3, w9, 1
	b	.L37
	.p2align 3
.L48:
	lsl	x1, x15, 8
	add	x1, x1, 12
	str	w5, [x6, x1]
	b	.L49
	.p2align 3
.L62:
	lsl	x0, x15, 8
	add	x0, x0, 252
	str	w14, [x6, x0]
	b	.L63
	.p2align 3
.L60:
	lsl	x0, x15, 8
	and	w17, w17, 65535
	add	x0, x0, 16
	orr	w16, w17, w16, lsl 16
	str	w16, [x6, x0]
	ldr	w5, [x21, 864]
	ldr	x2, [x21, 856]
	b	.L61
	.p2align 3
.L46:
	lsl	x1, x15, 8
	add	x1, x1, 8
	str	w18, [x6, x1]
	ldr	w14, [x21, 864]
	ldr	x17, [x21, 856]
	b	.L47
	.p2align 3
.L44:
	lsl	x1, x15, 8
	add	x1, x1, 4
	str	w30, [x6, x1]
	ldr	w14, [x21, 864]
	ldr	x17, [x21, 856]
	b	.L45
	.p2align 3
.L42:
	and	w1, w1, 33554431
	orr	w1, w1, w2, lsl 25
	lsl	x2, x15, 8
	str	w1, [x6, x2]
	ldr	w14, [x21, 864]
	ldr	x17, [x21, 856]
	b	.L43
	.p2align 3
.L40:
	sub	w2, w1, #8
	add	w1, w4, 8
	b	.L41
	.p2align 3
.L72:
	mov	w3, 0
	mov	w14, 0
	mov	w9, 1
	b	.L55
	.p2align 3
.L80:
	cmp	w2, w11
	bcc	.L58
	ldr	w17, [x3, 16]
	cmp	w11, w17
	bls	.L57
.L59:
	str	w11, [x0, 16]
	mov	w2, w13
	ldr	w17, [x3, 16]
	b	.L57
	.p2align 3
.L78:
	and	w14, w14, 33554431
	orr	w18, w14, w2, lsl 25
	b	.L39
	.p2align 3
.L77:
	add	w4, w2, 120
	ldr	x2, [x21, 856]
	ldr	w1, [x21, 864]
	sub	w3, w3, #4
	sub	x5, x6, x2
	cmp	x5, x1
	bge	.L81
.L19:
	lsl	w1, w4, 25
	add	x4, x0, 321
	orr	w1, w1, 8
	str	w1, [x0, 320]
	ldr	x2, [x21, 856]
	ldr	w1, [x21, 864]
	sub	x4, x4, x2
	cmp	x4, x1
	bge	.L82
.L21:
	str	w3, [x0, 324]
	add	x3, x0, 322
	ldr	x2, [x21, 856]
	ldr	w1, [x21, 864]
	sub	x3, x3, x2
	cmp	x3, x1
	bge	.L83
.L23:
	str	wzr, [x0, 328]
	add	x3, x0, 323
	ldr	x2, [x21, 856]
	ldr	w1, [x21, 864]
	sub	x3, x3, x2
	cmp	x3, x1
	bge	.L84
.L25:
	str	wzr, [x0, 332]
	sub	w4, w8, #1
	ldr	w3, [x19, 16]
	ldr	w1, [x21, 864]
	sub	w3, w3, #1
	ldr	x2, [x21, 856]
	cmp	w3, w4
	bcc	.L85
.L67:
	add	x5, x0, 324
	mov	w3, 0
	sub	x5, x5, x2
	mov	w9, 1
	cmp	x5, x1
	bge	.L86
.L28:
	lsl	w4, w4, 16
	str	w4, [x0, 336]
	add	x4, x0, 383
	cmp	w9, 1
	ldr	x2, [x21, 856]
	add	w24, w24, 576
	ldr	w1, [x21, 864]
	csel	w24, w24, wzr, ne
	sub	x2, x4, x2
	cmp	x2, x1
	bge	.L87
.L31:
	mov	w12, 1
	str	w24, [x0, 572]
	b	.L16
	.p2align 3
.L79:
	ldr	w17, [x3, 16]
	mov	w14, 0
	mov	w9, 1
	mov	w3, 0
	b	.L55
.L58:
	add	w14, w1, 1
	cmp	w14, w5
	bne	.L75
	b	.L59
	.size	AVSHAL_WriteSliceMsg, .-AVSHAL_WriteSliceMsg
	.align	3
.LC2:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVSHAL_StartDec
	.type	AVSHAL_StartDec, %function
AVSHAL_StartDec:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	sxtw	x22, w1
	bl	_mcount
	ldr	x19, .LC5
	lsl	x0, x22, 7
	mov	x23, x22
	sub	x0, x0, x22
	add	x0, x19, x0, lsl 3
	ldr	w0, [x0, 40]
	bl	MEM_Phy2Vir
	mov	x21, x0
	cbz	x0, .L147
	ldrh	w0, [x20, 74]
	ldrh	w3, [x29, 78]
	ldrh	w2, [x20, 72]
	sub	w0, w0, #1
	ldrb	w4, [x20, 44]
	bfi	w3, w0, 0, 9
	ldrh	w1, [x29, 76]
	sub	w2, w2, #1
	lsr	x0, x3, 8
	strh	w3, [x29, 78]
	bfi	w1, w2, 0, 9
	bfi	w0, w4, 1, 2
	ldr	x2, [x19, 856]
	ldrb	w4, [x20, 43]
	ldr	w3, [x19, 864]
	sub	x2, x21, x2
	strh	w1, [x29, 76]
	bfi	w0, w4, 3, 2
	ubfx	x1, x1, 8, 1
	and	w0, w0, 31
	strb	w1, [x29, 77]
	cmp	x2, x3
	strb	w0, [x29, 79]
	blt	.L91
	mov	w0, 1
	ldr	w3, [x29, 76]
	ldr	x2, .LC12
	mov	w1, 81
	str	w0, [x19, 852]
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x20, 116]
	cmp	w0, 1
	beq	.L93
.L151:
	ldrb	w1, [x20, 21]
	and	w1, w1, 3
.L94:
	ldrb	w2, [x20, 29]
	mov	w0, 0
	ldrb	w4, [x20, 23]
	ldrb	w3, [x20, 20]
	bfi	w0, w2, 0, 1
	bfi	w0, w1, 1, 2
	mov	w2, 0
	ldrb	w1, [x20, 22]
	bfi	w2, w4, 0, 1
	bfi	w0, w3, 3, 2
	ldrb	w4, [x20, 28]
	ldrb	w3, [x20, 25]
	bfi	w2, w1, 1, 1
	mov	w1, 0
	bfi	w0, w4, 5, 1
	bfi	w1, w3, 0, 6
	ldrb	w4, [x20, 27]
	ldrb	w3, [x20, 24]
	orr	w2, w2, 4
	str	wzr, [x29, 76]
	bfi	w0, w4, 6, 1
	bfi	w1, w3, 6, 1
	ldrb	w4, [x20, 26]
	ldrb	w3, [x20, 35]
	strb	w2, [x29, 78]
	bfi	w0, w4, 7, 1
	bfi	w1, w3, 7, 1
	ldr	x3, [x19, 856]
	ldrh	w2, [x29, 78]
	strb	w0, [x29, 76]
	add	x0, x21, 4
	strb	w1, [x29, 77]
	sub	x0, x0, x3
	ldr	w1, [x19, 864]
	and	w2, w2, 7
	strh	w2, [x29, 78]
	cmp	x0, x1
	blt	.L96
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L97:
	ldr	x2, .LC14
	mov	w1, 105
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 76]
	ldrb	w1, [x20, 33]
	mov	w0, 0
	ldrb	w2, [x20, 32]
	bfi	w0, w1, 0, 1
	ldrb	w1, [x20, 31]
	bfi	w0, w2, 1, 1
	ldr	x4, [x19, 856]
	bfi	w0, w1, 2, 5
	strb	w0, [x29, 76]
	ldrb	w2, [x20, 30]
	add	x0, x21, 8
	ldr	w3, [x19, 864]
	sub	x0, x0, x4
	ldrh	w1, [x29, 76]
	cmp	x0, x3
	bfi	w1, w2, 7, 5
	strh	w1, [x29, 76]
	blt	.L98
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L99:
	ldr	x2, .LC16
	mov	w1, 115
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 76]
	ldrb	w1, [x20, 38]
	mov	w0, 0
	ldrb	w3, [x20, 39]
	ldrb	w2, [x20, 40]
	bfi	w0, w1, 0, 1
	bfi	w0, w3, 1, 2
	ldrb	w1, [x20, 41]
	ldrb	w3, [x20, 36]
	bfi	w0, w2, 3, 1
	bfi	w0, w1, 4, 2
	ldrb	w2, [x20, 37]
	bfi	w0, w3, 6, 1
	strb	w0, [x29, 76]
	ldr	x4, [x19, 856]
	add	x1, x21, 12
	ldrh	w0, [x29, 76]
	ldr	w3, [x19, 864]
	sub	x1, x1, x4
	bfi	w0, w2, 7, 2
	strh	w0, [x29, 76]
	cmp	x1, x3
	ldr	w3, [x29, 76]
	and	w3, w3, 511
	str	w3, [x29, 76]
	blt	.L100
	mov	w0, 1
	str	w0, [x19, 852]
.L101:
	ldr	x2, .LC18
	mov	w1, 128
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 16
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 120]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 76]
	blt	.L102
	mov	w0, 1
	str	w0, [x19, 852]
.L103:
	ldr	x2, .LC20
	mov	w1, 135
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 20
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 124]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 76]
	blt	.L104
	mov	w0, 1
	str	w0, [x19, 852]
.L105:
	ldr	x2, .LC22
	mov	w1, 142
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 24
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 128]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 76]
	blt	.L106
	mov	w0, 1
	str	w0, [x19, 852]
.L107:
	ldr	x2, .LC24
	mov	w1, 149
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 28
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 144]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 76]
	blt	.L108
	mov	w0, 1
	str	w0, [x19, 852]
.L109:
	ldr	x2, .LC26
	mov	w1, 156
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 76]
	ldrb	w1, [x20, 42]
	add	x0, x21, 32
	ldr	x5, [x19, 856]
	mov	w2, 0
	ldrb	w4, [x20, 34]
	bfi	w2, w1, 0, 1
	ldr	w3, [x19, 864]
	mov	w1, 0
	sub	x0, x0, x5
	bfi	w1, w4, 0, 2
	cmp	x0, x3
	strb	w2, [x29, 76]
	strb	w1, [x29, 79]
	blt	.L110
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L111:
	ldr	x2, .LC28
	mov	w1, 164
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 36
	ldr	w1, [x19, 864]
	mov	w3, 1
	sub	x0, x0, x2
	strh	w3, [x29, 76]
	mov	w2, 6
	cmp	x0, x1
	strh	w2, [x29, 78]
	blt	.L112
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L113:
	ldr	x2, .LC30
	mov	w1, 172
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 40
	ldr	w1, [x19, 864]
	mov	w3, 25
	sub	x0, x0, x2
	strh	w3, [x29, 76]
	mov	w2, 8
	cmp	x0, x1
	strh	w2, [x29, 78]
	blt	.L114
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L115:
	ldr	x2, .LC32
	mov	w1, 180
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 44
	ldr	w1, [x19, 864]
	mov	w3, 4
	sub	x0, x0, x2
	strh	w3, [x29, 76]
	mov	w2, 3
	cmp	x0, x1
	strh	w2, [x29, 78]
	blt	.L116
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L117:
	ldr	x2, .LC34
	mov	w1, 188
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 76]
	ldrb	w2, [x20, 47]
	mov	w0, 0
	ldrb	w3, [x20, 45]
	mov	w1, 0
	bfi	w0, w2, 0, 6
	ldrb	w2, [x20, 49]
	bfi	w1, w3, 0, 1
	ldrb	w3, [x20, 46]
	bfi	w0, w2, 6, 1
	ldrb	w2, [x20, 50]
	bfi	w1, w3, 1, 1
	ldr	x5, [x19, 856]
	bfi	w0, w2, 7, 1
	ldrb	w3, [x20, 48]
	ldrb	w4, [x20, 51]
	add	x2, x21, 48
	strb	w0, [x29, 77]
	bfi	w1, w3, 2, 6
	ldr	w0, [x19, 864]
	mov	w3, 0
	sub	x2, x2, x5
	bfi	w3, w4, 0, 1
	strb	w1, [x29, 76]
	cmp	x2, x0
	strb	w3, [x29, 78]
	blt	.L118
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L119:
	ldr	x2, .LC36
	mov	w1, 201
	mov	w0, 5
	bl	dprint_normal
	lsl	x0, x22, 7
	ldr	x3, [x19, 856]
	sub	x0, x0, x22
	add	x1, x21, 52
	ldr	w2, [x19, 864]
	sub	x1, x1, x3
	add	x0, x19, x0, lsl 3
	cmp	x1, x2
	ldr	w3, [x0, 900]
	str	w3, [x29, 76]
	blt	.L120
	mov	w0, 1
	str	w0, [x19, 852]
.L121:
	ldr	x2, .LC38
	mov	w1, 208
	mov	w0, 5
	bl	dprint_normal
	lsl	x0, x22, 7
	ldr	x3, [x19, 856]
	sub	x0, x0, x22
	add	x1, x21, 56
	ldr	w2, [x19, 864]
	sub	x1, x1, x3
	add	x0, x19, x0, lsl 3
	cmp	x1, x2
	ldr	w3, [x0, 904]
	str	w3, [x29, 76]
	blt	.L122
	mov	w0, 1
	str	w0, [x19, 852]
.L123:
	ldr	x2, .LC40
	mov	w1, 215
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 64
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 140]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 76]
	blt	.L124
	mov	w0, 1
	str	w0, [x19, 852]
.L125:
	ldr	x2, .LC42
	mov	w1, 225
	mov	w0, 5
	bl	dprint_normal
	add	x0, x20, 152
	add	x2, x21, 68
	add	x6, x20, 280
	mov	w7, 1
	ldr	w4, [x19, 864]
	ldr	x5, [x19, 856]
	b	.L128
	.p2align 3
.L149:
	add	x0, x0, 4
	str	w7, [x19, 852]
	cmp	x6, x0
	add	x2, x2, 4
	beq	.L148
.L128:
	sub	x1, x2, x5
	ldr	w3, [x0]
	cmp	x1, x4
	bge	.L149
	add	x0, x0, 4
	str	w3, [x2]
	cmp	x6, x0
	add	x2, x2, 4
	ldr	w4, [x19, 864]
	ldr	x5, [x19, 856]
	bne	.L128
.L148:
	add	x0, x21, 196
	ldr	w3, [x20, 136]
	sub	x5, x0, x5
	str	w3, [x29, 76]
	cmp	x5, x4
	blt	.L129
	mov	w0, 1
	str	w0, [x19, 852]
.L130:
	ldr	x2, .LC44
	mov	w1, 240
	mov	w0, 5
	bl	dprint_normal
	lsl	x0, x22, 7
	ldr	x3, [x19, 856]
	sub	x0, x0, x22
	add	x1, x21, 200
	ldr	w2, [x19, 864]
	sub	x1, x1, x3
	add	x0, x19, x0, lsl 3
	cmp	x1, x2
	ldr	w3, [x0, 908]
	str	w3, [x29, 76]
	blt	.L131
	mov	w0, 1
	str	w0, [x19, 852]
.L132:
	ldr	x2, .LC46
	mov	w1, 247
	mov	w0, 5
	bl	dprint_normal
	lsl	x0, x22, 7
	ldr	x3, [x19, 856]
	sub	x0, x0, x22
	add	x1, x21, 228
	ldr	w2, [x19, 864]
	sub	x1, x1, x3
	add	x0, x19, x0, lsl 3
	cmp	x1, x2
	ldr	w3, [x0, 896]
	str	w3, [x29, 76]
	blt	.L133
	mov	w0, 1
	str	w0, [x19, 852]
.L134:
	ldr	x2, .LC48
	mov	w1, 255
	mov	w0, 5
	bl	dprint_normal
	ldr	x1, [x19, 856]
	add	x0, x21, 232
	ldr	w2, [x19, 864]
	sub	x0, x0, x1
	mov	w1, -1
	cmp	x0, x2
	strh	w1, [x29, 76]
	strh	w1, [x29, 78]
	blt	.L135
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L136:
	ldr	x2, .LC50
	mov	w1, 263
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 236
	ldr	w1, [x19, 864]
	mov	w3, -1
	sub	x0, x0, x2
	strh	w3, [x29, 76]
	mov	w2, 1
	cmp	x0, x1
	strh	w2, [x29, 78]
	blt	.L137
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L138:
	ldr	x2, .LC52
	mov	w1, 271
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 240
	ldr	w1, [x19, 864]
	mov	w3, 7
	sub	x0, x0, x2
	strh	w3, [x29, 76]
	mov	w2, 65
	cmp	x0, x1
	strh	w2, [x29, 78]
	blt	.L139
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L140:
	ldr	x2, .LC54
	mov	w1, 279
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 76]
	ldr	x1, [x19, 856]
	add	x0, x21, 244
	ldr	w2, [x19, 864]
	sub	x0, x0, x1
	mov	w1, 4095
	cmp	x0, x2
	strh	w1, [x29, 76]
	blt	.L141
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L142:
	ldr	x2, .LC56
	mov	w1, 286
	mov	w0, 5
	bl	dprint_normal
	lsl	x0, x22, 7
	ldr	x3, [x19, 856]
	sub	x0, x0, x22
	add	x1, x21, 252
	sub	x1, x1, x3
	ldr	w2, [x19, 864]
	add	x0, x19, x0, lsl 3
	cmp	x1, x2
	ldr	w3, [x0, 40]
	add	w3, w3, 320
	str	w3, [x29, 76]
	blt	.L143
	mov	w0, 1
	ldr	x2, .LC58
	str	w0, [x19, 852]
	mov	w1, 293
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x20, 45]
	cmp	w0, 1
	beq	.L150
.L145:
	mov	x0, x20
	mov	w1, w23
	bl	AVSHAL_WriteSliceMsg
	mov	w0, 0
.L90:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L129:
	str	w3, [x21, 196]
	b	.L130
	.p2align 3
.L143:
	ldr	x2, .LC58
	mov	w1, 293
	str	w3, [x21, 252]
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x20, 45]
	cmp	w0, 1
	bne	.L145
.L150:
	add	x2, x21, 256
	mov	w1, 16
	mov	x0, x20
	bl	AVSHAL_StartDec_ConfigWQMatrix.part.0
	b	.L145
	.p2align 3
.L141:
	ldr	w3, [x29, 76]
	str	w3, [x21, 244]
	b	.L142
	.p2align 3
.L139:
	ldr	w3, [x29, 76]
	str	w3, [x21, 240]
	b	.L140
	.p2align 3
.L137:
	ldr	w3, [x29, 76]
	str	w3, [x21, 236]
	b	.L138
	.p2align 3
.L135:
	ldr	w3, [x29, 76]
	str	w3, [x21, 232]
	b	.L136
	.p2align 3
.L133:
	str	w3, [x21, 228]
	b	.L134
	.p2align 3
.L131:
	str	w3, [x21, 200]
	b	.L132
	.p2align 3
.L124:
	str	w3, [x21, 64]
	b	.L125
	.p2align 3
.L91:
	ldr	w3, [x29, 76]
	mov	w1, 81
	ldr	x2, .LC12
	mov	w0, 5
	str	w3, [x21]
	bl	dprint_normal
	ldr	w0, [x20, 116]
	cmp	w0, 1
	bne	.L151
.L93:
	ldrb	w1, [x20, 21]
	cmp	w1, 1
	beq	.L95
	and	w1, w1, 3
	b	.L94
	.p2align 3
.L96:
	ldr	w3, [x29, 76]
	str	w3, [x21, 4]
	b	.L97
	.p2align 3
.L98:
	ldr	w3, [x29, 76]
	str	w3, [x21, 8]
	b	.L99
	.p2align 3
.L100:
	str	w3, [x21, 12]
	b	.L101
	.p2align 3
.L102:
	str	w3, [x21, 16]
	b	.L103
	.p2align 3
.L104:
	str	w3, [x21, 20]
	b	.L105
	.p2align 3
.L106:
	str	w3, [x21, 24]
	b	.L107
	.p2align 3
.L108:
	str	w3, [x21, 28]
	b	.L109
	.p2align 3
.L110:
	ldr	w3, [x29, 76]
	str	w3, [x21, 32]
	b	.L111
	.p2align 3
.L112:
	ldr	w3, [x29, 76]
	str	w3, [x21, 36]
	b	.L113
	.p2align 3
.L114:
	ldr	w3, [x29, 76]
	str	w3, [x21, 40]
	b	.L115
	.p2align 3
.L116:
	ldr	w3, [x29, 76]
	str	w3, [x21, 44]
	b	.L117
	.p2align 3
.L118:
	ldr	w3, [x29, 76]
	str	w3, [x21, 48]
	b	.L119
	.p2align 3
.L120:
	str	w3, [x21, 52]
	b	.L121
	.p2align 3
.L122:
	str	w3, [x21, 56]
	b	.L123
.L95:
	mov	w0, 3
	mov	w1, 3
	strb	w0, [x20, 21]
	b	.L94
.L147:
	ldr	x4, .LC7
	mov	w1, 70
	ldr	x3, .LC8
	mov	w0, 0
	ldr	x2, .LC10
	bl	dprint_normal
	mov	w0, -1
	b	.L90
	.size	AVSHAL_StartDec, .-AVSHAL_StartDec
	.align	3
.LC5:
	.xword	g_HwMem
	.align	3
.LC7:
	.xword	.LC6
	.align	3
.LC8:
	.xword	.LANCHOR0
	.align	3
.LC10:
	.xword	.LC9
	.align	3
.LC12:
	.xword	.LC11
	.align	3
.LC14:
	.xword	.LC13
	.align	3
.LC16:
	.xword	.LC15
	.align	3
.LC18:
	.xword	.LC17
	.align	3
.LC20:
	.xword	.LC19
	.align	3
.LC22:
	.xword	.LC21
	.align	3
.LC24:
	.xword	.LC23
	.align	3
.LC26:
	.xword	.LC25
	.align	3
.LC28:
	.xword	.LC27
	.align	3
.LC30:
	.xword	.LC29
	.align	3
.LC32:
	.xword	.LC31
	.align	3
.LC34:
	.xword	.LC33
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
	.align	3
.LC46:
	.xword	.LC45
	.align	3
.LC48:
	.xword	.LC47
	.align	3
.LC50:
	.xword	.LC49
	.align	3
.LC52:
	.xword	.LC51
	.align	3
.LC54:
	.xword	.LC53
	.align	3
.LC56:
	.xword	.LC55
	.align	3
.LC58:
	.xword	.LC57
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.10309, %object
	.size	__func__.10309, 16
__func__.10309:
	.string	"AVSHAL_StartDec"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC6:
	ASCII(.string	"can not map down msg virtual address!" )
	.zero	2
.LC9:
	ASCII(.string	"%s: %s\n" )
.LC11:
	ASCII(.string	"D0 = 0x%x\n" )
	.zero	5
.LC13:
	ASCII(.string	"D1 = 0x%x\n" )
	.zero	5
.LC15:
	ASCII(.string	"D2 = 0x%x\n" )
	.zero	5
.LC17:
	ASCII(.string	"D3 = 0x%x\n" )
	.zero	5
.LC19:
	ASCII(.string	"D4 = 0x%x\n" )
	.zero	5
.LC21:
	ASCII(.string	"D5 = 0x%x\n" )
	.zero	5
.LC23:
	ASCII(.string	"D6 = 0x%x\n" )
	.zero	5
.LC25:
	ASCII(.string	"D7 = 0x%x\n" )
	.zero	5
.LC27:
	ASCII(.string	"D8 = 0x%x\n" )
	.zero	5
.LC29:
	ASCII(.string	"D9 = 0x%x\n" )
	.zero	5
.LC31:
	ASCII(.string	"D10 = 0x%x\n" )
	.zero	4
.LC33:
	ASCII(.string	"D11 = 0x%x\n" )
	.zero	4
.LC35:
	ASCII(.string	"D12 = 0x%x\n" )
	.zero	4
.LC37:
	ASCII(.string	"D13 = 0x%x\n" )
	.zero	4
.LC39:
	ASCII(.string	"D14 = 0x%x\n" )
	.zero	4
.LC41:
	ASCII(.string	"D16 = 0x%x\n" )
	.zero	4
.LC43:
	ASCII(.string	"D49 = 0x%x\n" )
	.zero	4
.LC45:
	ASCII(.string	"D50 = 0x%x\n" )
	.zero	4
.LC47:
	ASCII(.string	"D51 = 0x%x\n" )
	.zero	4
.LC49:
	ASCII(.string	"D58 = 0x%x\n" )
	.zero	4
.LC51:
	ASCII(.string	"D59 = 0x%x\n" )
	.zero	4
.LC53:
	ASCII(.string	"D60 = 0x%x\n" )
	.zero	4
.LC55:
	ASCII(.string	"D61 = 0x%x\n" )
	.zero	4
.LC57:
	ASCII(.string	"D63 = 0x%x\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
