#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"postprocess.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	PostPro_BubbleSort
	.type	PostPro_BubbleSort, %function
PostPro_BubbleSort:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w9, [x19, 12]
	mov	w8, 1
	add	x10, x19, 16
	cmp	w9, w8
	bls	.L1
	.p2align 2
.L10:
	mov	w1, 0
	sub	w5, w9, w8
	cmp	w1, w5
	add	w1, w1, 1
	mov	x0, x10
	mov	w7, 0
	add	x2, x19, x1, uxtw 2
	beq	.L14
	.p2align 2
.L5:
	ldrh	w3, [x0]
	ldrh	w4, [x2, 16]
	cmp	w3, w4
	bls	.L4
	strh	w4, [x0]
	mov	w7, 1
	ldrh	w4, [x0, 2]
	ldrh	w6, [x2, 18]
	strh	w6, [x0, 2]
	strh	w3, [x2, 16]
	strh	w4, [x2, 18]
.L4:
	cmp	w1, w5
	add	w1, w1, 1
	add	x0, x0, 4
	add	x2, x19, x1, uxtw 2
	bne	.L5
.L14:
	cbz	w7, .L1
	add	w8, w8, 1
	cmp	w9, w8
	ccmp	w7, 1, 0, hi
	beq	.L10
.L1:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	PostPro_BubbleSort, .-PostPro_BubbleSort
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostPro_GetMp24MbGroup
	.type	PostPro_GetMp24MbGroup, %function
PostPro_GetMp24MbGroup:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 12]
	sub	w0, w0, #1
	cmp	w0, 199
	bhi	.L37
	str	wzr, [x20, 32]
	str	wzr, [x20, 44]
	ldp	w5, w1, [x20, 16]
	ldr	w0, [x19, 12]
	mul	w5, w5, w1
	uxtw	x1, w0
	add	x3, x19, x1, lsl 2
	uxth	w2, w5
	strh	w2, [x3, 16]
	strh	w2, [x3, 18]
	cbnz	w0, .L38
.L18:
	mov	w7, -1
	mov	w0, 0
	mov	w6, w7
	add	w10, w5, w7
	b	.L27
	.p2align 3
.L42:
	cmp	w2, w3
	ccmp	w2, w6, 1, le
	blt	.L19
	cmp	w2, w7
	csel	w7, w7, w6, ge
	add	w4, w7, 1
	cmp	w2, w4
	beq	.L23
	add	w6, w6, w6, lsr 31
	sub	w8, w2, #1
	cmp	w6, w8
	bge	.L23
	ldr	w4, [x20, 32]
	cmp	w4, 199
	bgt	.L39
	add	x9, x20, x4, sxtw 3
	sub	w7, w7, #100
	cmp	w6, w7
	stp	w6, w8, [x9, 56]
	bcs	.L25
	str	w7, [x9, 56]
.L25:
	add	w4, w4, 1
	str	w4, [x20, 32]
.L23:
	ldr	w4, [x19, 12]
	sub	w6, w4, #1
	cmp	w6, w0
	beq	.L40
.L30:
	add	w0, w0, 1
	mov	w7, w3
	cmp	w0, w4
	mov	w6, w2
	bhi	.L41
.L27:
	uxtw	x1, w0
	add	x3, x19, x1, lsl 2
	mov	x2, x3
	ldrh	w3, [x3, 18]
	ldrh	w2, [x2, 16]
	cmp	w5, w3
	ccmp	w5, w2, 1, ge
	bge	.L42
.L19:
	ldr	w4, [x19, 12]
	add	w0, w0, 1
	cmp	w0, w4
	bls	.L27
.L41:
	mov	w0, 0
.L17:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L40:
	add	x1, x19, x1, lsl 2
	ldrh	w1, [x1, 18]
	cmp	w1, w10
	bge	.L30
	ldr	w0, [x20, 32]
	mov	w4, 118
	cmp	w0, 199
	bgt	.L36
	add	x3, x20, x0, sxtw 3
	add	w2, w0, 1
	mov	w0, 0
	stp	w1, w10, [x3, 56]
	str	w2, [x20, 32]
	b	.L17
	.p2align 3
.L38:
	sub	w0, w0, #1
	sub	w1, w5, #10
	add	x0, x19, x0, lsl 2
	ldrh	w3, [x0, 18]
	cmp	w3, w1
	blt	.L18
	sub	w2, w2, #1
	strh	w2, [x0, 18]
	b	.L18
.L37:
	ldr	x5, .LC3
	mov	w4, 61
.L35:
	ldr	x3, .LC4
	mov	w1, w4
	ldr	x2, .LC6
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L39:
	mov	w4, 101
.L36:
	ldr	x5, .LC8
	b	.L35
	.size	PostPro_GetMp24MbGroup, .-PostPro_GetMp24MbGroup
	.align	3
.LC3:
	.xword	.LC2
	.align	3
.LC4:
	.xword	.LANCHOR0
	.align	3
.LC6:
	.xword	.LC5
	.align	3
.LC8:
	.xword	.LC7
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostPro_GetH264MbOfMBAFF
	.type	PostPro_GetH264MbOfMBAFF, %function
PostPro_GetH264MbOfMBAFF:
	sub	sp, sp, #800
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 12]
	ldp	w6, w7, [x20, 16]
	cbz	w0, .L55
	sub	w1, w0, #1
	mov	x5, 6
	add	x0, x29, 34
	add	x3, x19, 16
	add	x5, x5, x1, uxtw 2
	add	x1, x29, 32
	add	x5, x1, x5
	mov	x2, x0
	.p2align 2
.L45:
	ldrh	w4, [x3]
	add	x3, x3, 4
	ldrh	w1, [x3, -2]
	strh	w4, [x2, -2]
	strh	w1, [x2], 4
	cmp	x2, x5
	bne	.L45
	ldrh	w4, [x0, -2]
	mov	w2, w6
	ldrh	w3, [x0]
	lsl	w2, w2, 1
	and	w4, w4, -2
	strh	w4, [x0, -2]
	orr	w3, w3, 1
	strh	w3, [x0]
	mov	w8, 0
	cbz	w2, .L46
	.p2align 2
.L62:
	uxth	w1, w4
	udiv	w4, w1, w2
	mul	w9, w4, w2
	sub	w3, w1, w9
	cmp	w3, 1
	bls	.L47
	ldrh	w11, [x0]
	sub	w10, w2, #2
	udiv	w12, w11, w2
	msub	w1, w12, w2, w11
	cmp	w10, w1
	bls	.L48
	cmp	w4, w12
	lsr	w3, w3, 1
	lsr	w1, w1, 1
	beq	.L49
	add	w9, w8, 3
	cmp	w9, 199
	bls	.L61
.L50:
	mul	w0, w6, w7
	mov	w1, 1
	strh	wzr, [x19, 16]
	sub	w0, w0, #1
	str	w1, [x19, 12]
	strh	w0, [x19, 18]
	mov	x0, x19
	bl	PostPro_BubbleSort
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	add	sp, sp, 800
	ret
	.p2align 3
.L48:
	add	w10, w8, 2
	cmp	w10, 199
	bhi	.L50
	uxtw	x2, w8
	uxth	w9, w9
	add	w3, w9, w3, lsr 1
	add	w1, w8, 1
	add	x12, x19, x2, lsl 2
	mov	w8, w10
	uxth	w3, w3
	add	x10, x19, x1, lsl 2
	strh	w3, [x12, 16]
	ldr	w1, [x20, 16]
	sub	w1, w1, #1
	add	w9, w9, w1
	strh	w9, [x12, 18]
	ldr	w1, [x20, 16]
	strh	w11, [x10, 18]
	add	w3, w3, w1
	strh	w3, [x10, 16]
.L51:
	add	x0, x0, 4
	cmp	x0, x5
	beq	.L46
	ldrh	w4, [x0, -2]
	ldrh	w3, [x0]
	ldr	w2, [x20, 16]
	and	w4, w4, -2
	orr	w3, w3, 1
	strh	w4, [x0, -2]
	lsl	w2, w2, 1
	strh	w3, [x0]
	cbnz	w2, .L62
.L46:
	str	w8, [x19, 12]
.L63:
	mov	x0, x19
	bl	PostPro_BubbleSort
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	add	sp, sp, 800
	ret
	.p2align 3
.L47:
	ldrh	w4, [x0]
	sub	w9, w2, #2
	udiv	w3, w4, w2
	mul	w2, w3, w2
	sub	w3, w4, w2
	cmp	w9, w3
	bls	.L52
	add	w10, w8, 2
	cmp	w10, 199
	bhi	.L50
	uxtw	x9, w8
	uxth	w2, w2
	ubfx	x3, x3, 1, 16
	add	w4, w8, 1
	add	x11, x19, x9, lsl 2
	mov	w8, w10
	add	w10, w2, w3
	add	x9, x19, x4, lsl 2
	strh	w1, [x11, 16]
	strh	w10, [x11, 18]
	ldr	w1, [x20, 16]
	add	w2, w2, w1
	uxth	w2, w2
	strh	w2, [x9, 16]
	add	w3, w3, w2
	strh	w3, [x9, 18]
	b	.L51
	.p2align 3
.L52:
	add	w3, w8, 1
	cmp	w3, 199
	bhi	.L50
	uxtw	x2, w8
	mov	w8, w3
	add	x3, x19, x2, lsl 2
	strh	w1, [x3, 16]
	strh	w4, [x3, 18]
	b	.L51
	.p2align 3
.L61:
	uxth	w2, w2
	add	w11, w8, 1
	add	w10, w8, 2
	uxth	w1, w1
	mul	w4, w2, w4
	mul	w2, w2, w12
	uxtw	x12, w8
	mov	w8, w9
	uxth	w4, w4
	add	x13, x19, x11, lsl 2
	add	x9, x19, x12, lsl 2
	add	w3, w4, w3
	mov	x12, x9
	uxth	w2, w2
	uxth	w3, w3
	strh	w3, [x9, 16]
	ldr	w9, [x20, 16]
	sub	w9, w9, #1
	add	w4, w4, w9
	strh	w4, [x12, 18]
	add	w12, w2, w1
	add	x9, x19, x10, lsl 2
	ldr	w4, [x20, 16]
	strh	w12, [x13, 18]
	add	w3, w3, w4
	strh	w3, [x13, 16]
	ldr	w3, [x20, 16]
	add	w2, w2, w3
	uxth	w2, w2
	strh	w2, [x9, 16]
	add	w1, w1, w2
	strh	w1, [x9, 18]
	b	.L51
	.p2align 3
.L49:
	add	w4, w8, 2
	cmp	w4, 199
	bhi	.L50
	uxth	w9, w9
	add	w3, w9, w3
	add	w1, w9, w1
	uxtw	x9, w8
	uxth	w2, w3
	add	w3, w8, 1
	mov	w8, w4
	add	x4, x19, x9, lsl 2
	uxth	w1, w1
	add	x9, x19, x3, lsl 2
	strh	w2, [x4, 16]
	strh	w1, [x4, 18]
	ldr	w4, [x20, 16]
	add	w2, w2, w4
	strh	w2, [x9, 16]
	ldr	w2, [x20, 16]
	add	w1, w1, w2
	strh	w1, [x9, 18]
	b	.L51
.L55:
	mov	w8, 0
	str	w8, [x19, 12]
	b	.L63
	.size	PostPro_GetH264MbOfMBAFF, .-PostPro_GetH264MbOfMBAFF
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostPro_GetH264MbGroup
	.type	PostPro_GetH264MbGroup, %function
PostPro_GetH264MbGroup:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x1
	mov	x21, x0
	mov	x0, x30
	mov	w22, w2
	bl	_mcount
	ldr	w3, [x19, 12]
	sub	w0, w3, #1
	cmp	w0, 199
	bhi	.L84
	ldp	w20, w0, [x21, 16]
	mul	w20, w20, w0
	cbnz	w22, .L85
.L67:
	str	wzr, [x21, 32]
	mov	w5, -1
	str	wzr, [x21, 44]
	uxth	w2, w20
	mov	w0, 0
	mov	w6, w5
	ldr	w1, [x19, 12]
	add	w9, w20, w5
	add	x3, x19, x1, lsl 2
	strh	w2, [x3, 18]
	strh	w2, [x3, 16]
	b	.L75
	.p2align 3
.L89:
	cmp	w1, w5
	csel	w5, w5, w6, ge
	add	w4, w5, 1
	cmp	w1, w4
	ble	.L70
	ldr	w4, [x21, 32]
	cmp	w4, 199
	bgt	.L86
	add	x7, x21, x4, sxtw 3
	add	w6, w6, w6, lsr 31
	sub	w5, w5, #100
	sub	w8, w1, #1
	cmp	w6, w5
	stp	w6, w8, [x7, 56]
	bcs	.L72
	str	w5, [x7, 56]
.L72:
	add	w4, w4, 1
	str	w4, [x21, 32]
.L70:
	ldr	w4, [x19, 12]
	sub	w5, w4, #1
	cmp	w5, w0
	beq	.L87
.L78:
	add	w0, w0, 1
	mov	w5, w2
	cmp	w0, w4
	mov	w6, w1
	bhi	.L88
.L75:
	uxtw	x3, w0
	add	x1, x19, x3, lsl 2
	mov	x2, x1
	ldrh	w1, [x1, 16]
	ldrh	w2, [x2, 18]
	cmp	w20, w1
	ccmp	w20, w2, 1, ge
	ccmp	w1, w2, 0, ge
	ble	.L89
	ldr	w4, [x19, 12]
	add	w0, w0, 1
	cmp	w0, w4
	bls	.L75
.L88:
	mov	w0, 0
.L66:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L87:
	add	x3, x19, x3, lsl 2
	ldrh	w3, [x3, 18]
	cmp	w3, w9
	bge	.L78
	ldr	w0, [x21, 32]
	cmp	w0, 199
	bgt	.L90
	add	x2, x21, x0, sxtw 3
	add	w1, w0, 1
	mov	w0, 0
	stp	w3, w9, [x2, 56]
	str	w1, [x21, 32]
	b	.L66
	.p2align 3
.L85:
	mov	x1, x19
	mov	x0, x21
	bl	PostPro_GetH264MbOfMBAFF
	b	.L67
.L84:
	ldr	x2, .LC10
	mov	w1, 303
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L86:
	mov	w3, 351
.L83:
	ldr	x2, .LC12
	mov	w1, w3
	mov	w0, 20
	bl	dprint_normal
	mov	w0, 1
	b	.L66
.L90:
	mov	w3, 372
	b	.L83
	.size	PostPro_GetH264MbGroup, .-PostPro_GetH264MbGroup
	.align	3
.LC10:
	.xword	.LC9
	.align	3
.LC12:
	.xword	.LC11
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostPro_GetH264RepairParam
	.type	PostPro_GetH264RepairParam, %function
PostPro_GetH264RepairParam:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	bl	_mcount
	ldr	w0, [x19, 284]
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 300]
	str	w0, [x20, 8]
	ldr	x0, [x19, 800]
	ldr	w4, [x0, 1640]
	add	x0, x19, x4, uxtw 2
	ldr	w0, [x0, 300]
	str	w0, [x20, 12]
	ldr	w0, [x19, 20]
	str	w0, [x20, 16]
	ldr	w0, [x19, 12]
	str	w0, [x20, 20]
	ldrb	w0, [x19]
	cmp	w0, wzr
	cset	w0, eq
	str	w0, [x20, 24]
	ldrb	w0, [x19, 1]
	cmp	w0, wzr
	cset	w0, eq
	str	w0, [x20, 28]
	ldr	w5, [x19, 792]
	cbz	w5, .L92
	ldr	w0, [x19, 872]
	cmp	w4, w0
	beq	.L129
	mov	w0, 0
	b	.L95
	.p2align 3
.L96:
	add	x3, x19, x2, lsl 2
	ldr	w3, [x3, 872]
	cmp	w4, w3
	beq	.L93
.L95:
	add	w0, w0, 1
	cmp	w0, w5
	sxtw	x2, w0
	bne	.L96
.L92:
	ldr	w2, [x19, 24]
	cbz	w2, .L97
	ldrb	w0, [x19]
	cmp	w0, wzr
	cset	w2, eq
.L97:
	ldrsb	w0, [x19, 2]
	cbnz	w0, .L130
	str	wzr, [x21, 12]
	ldp	w2, w0, [x20, 8]
	cmp	w2, w0
	beq	.L131
.L100:
	ldrb	w0, [x19]
	cbz	w0, .L109
	cmp	w0, 1
	beq	.L127
	cmp	w0, 2
	beq	.L127
	cmp	w0, 3
	bne	.L106
.L109:
	str	wzr, [x20, 40]
.L106:
	ldrb	w2, [x19, 4]
	mov	w1, 4
	strb	w2, [x20]
	mov	w0, 8
	str	w1, [x20, 48]
	strb	w0, [x20, 1]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L127:
	str	w0, [x20, 40]
	b	.L106
.L129:
	mov	x2, 0
	.p2align 2
.L93:
	add	x2, x19, x2, lsl 2
	ldr	w0, [x2, 808]
	str	w0, [x20, 36]
	b	.L92
	.p2align 3
.L130:
	mov	x1, x21
	mov	x0, x20
	bl	PostPro_GetH264MbGroup
	ldp	w2, w0, [x20, 8]
	cmp	w2, w0
	bne	.L100
.L131:
	ldr	w3, [x19, 436]
	cbz	w3, .L100
	ldr	w1, [x19, 300]
	mov	w0, 0
	cmp	w2, w1
	bne	.L101
	.p2align 2
.L103:
	add	w0, w0, 1
	cmp	w3, w0
	add	x1, x19, x0, sxtw 2
	beq	.L100
	ldr	w1, [x1, 300]
	cmp	w2, w1
	beq	.L103
.L101:
	str	w1, [x20, 12]
	b	.L100
	.size	PostPro_GetH264RepairParam, .-PostPro_GetH264RepairParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostPro_GetMPEG2RepairParam
	.type	PostPro_GetMPEG2RepairParam, %function
PostPro_GetMPEG2RepairParam:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	mov	x21, x2
	bl	_mcount
	ldr	w0, [x20, 188]
	str	w0, [x19, 8]
	ldr	w0, [x20, 184]
	str	w0, [x19, 12]
	ldrh	w0, [x20, 150]
	str	w0, [x19, 16]
	ldrh	w0, [x20, 146]
	str	w0, [x19, 20]
	ldrb	w0, [x20, 3]
	cmp	w0, 3
	cset	w0, eq
	stp	w0, wzr, [x19, 24]
	ldrb	w0, [x20, 3]
	cbz	w0, .L137
	cmp	w0, 1
	beq	.L141
	cmp	w0, 2
	beq	.L141
	cmp	w0, 3
	bne	.L134
.L137:
	str	wzr, [x19, 40]
.L134:
	ldrb	w2, [x20, 144]
	mov	w1, 4
	mov	w0, 8
	strb	w2, [x19]
	strb	w0, [x19, 1]
	mov	x0, x19
	str	w1, [x19, 48]
	mov	x1, x21
	bl	PostPro_GetMp24MbGroup
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L141:
	str	w0, [x19, 40]
	b	.L134
	.size	PostPro_GetMPEG2RepairParam, .-PostPro_GetMPEG2RepairParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostPro_GetMPEG4RepairParam
	.type	PostPro_GetMPEG4RepairParam, %function
PostPro_GetMPEG4RepairParam:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x20, x1
	mov	x0, x30
	mov	x21, x2
	bl	_mcount
	ldr	w0, [x20, 164]
	mov	w5, 1
	str	w0, [x19, 8]
	mov	w4, 4
	mov	w3, 8
	mov	x1, x21
	ldr	w0, [x20, 172]
	str	w0, [x19, 12]
	mov	x0, x19
	ldrh	w2, [x20, 152]
	str	w2, [x19, 16]
	ldrh	w2, [x20, 154]
	stp	w2, w5, [x19, 20]
	str	wzr, [x19, 28]
	str	wzr, [x19, 40]
	ldrb	w2, [x20, 151]
	strb	w2, [x19]
	strb	w3, [x19, 1]
	str	w4, [x19, 48]
	bl	PostPro_GetMp24MbGroup
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	PostPro_GetMPEG4RepairParam, .-PostPro_GetMPEG4RepairParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostPro_PrepairMpeg4CopyParam
	.type	PostPro_PrepairMpeg4CopyParam, %function
PostPro_PrepairMpeg4CopyParam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	sxtw	x1, w19
	ldr	x4, .LC13
	lsl	x0, x1, 3
	ldr	w2, [x20, 188]
	sub	x0, x0, x1
	mov	w3, 1
	lsl	x0, x0, 1
	mov	w7, 4
	sub	x0, x0, x1
	mov	w6, 8
	lsl	x0, x0, 4
	sub	x1, x0, x1
	lsl	x1, x1, 4
	add	x0, x4, x1
	str	w2, [x0, 8]
	ldr	w2, [x20, 172]
	str	w2, [x0, 12]
	ldrh	w2, [x20, 152]
	str	w2, [x0, 16]
	ldrh	w5, [x20, 154]
	str	w5, [x0, 20]
	mul	w2, w2, w5
	ldrb	w5, [x20, 151]
	strb	w5, [x4, x1]
	sub	w2, w2, #1
	strb	w3, [x0, 2]
	strb	w6, [x0, 1]
	stp	w3, wzr, [x0, 24]
	str	w3, [x0, 32]
	stp	wzr, w3, [x0, 40]
	str	w7, [x0, 48]
	stp	wzr, w2, [x0, 56]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	PostPro_PrepairMpeg4CopyParam, .-PostPro_PrepairMpeg4CopyParam
	.align	3
.LC13:
	.xword	g_RepairParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostProc_GetVPxRepairParam
	.type	PostProc_GetVPxRepairParam, %function
PostProc_GetVPxRepairParam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC14
	mov	w4, w19
	ldr	x2, .LC16
	mov	w1, 1734
	add	x3, x3, 24
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	PostProc_GetVPxRepairParam, .-PostProc_GetVPxRepairParam
	.align	3
.LC14:
	.xword	.LANCHOR0
	.align	3
.LC16:
	.xword	.LC15
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostProc_GetAVSxRepairParam
	.type	PostProc_GetAVSxRepairParam, %function
PostProc_GetAVSxRepairParam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC17
	mov	w4, w19
	ldr	x2, .LC18
	mov	w1, 1757
	add	x3, x3, 56
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	PostProc_GetAVSxRepairParam, .-PostProc_GetAVSxRepairParam
	.align	3
.LC17:
	.xword	.LANCHOR0
	.align	3
.LC18:
	.xword	.LC15
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostProc_GetREALxRepairParam
	.type	PostProc_GetREALxRepairParam, %function
PostProc_GetREALxRepairParam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC19
	mov	w4, w19
	ldr	x2, .LC20
	mov	w1, 1780
	add	x3, x3, 88
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	PostProc_GetREALxRepairParam, .-PostProc_GetREALxRepairParam
	.align	3
.LC19:
	.xword	.LANCHOR0
	.align	3
.LC20:
	.xword	.LC15
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostPro_GetRepairParam
	.type	PostPro_GetRepairParam, %function
PostPro_GetRepairParam:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x1
	mov	w21, w0
	add	x19, x1, 1656
	mov	x0, x30
	mov	x23, x2
	mov	x22, x3
	bl	_mcount
	str	w21, [x20, 4]
	str	wzr, [x20, 32]
	cmp	w21, 18
	str	wzr, [x19, 32]
	bls	.L171
.L148:
	ldr	x3, .LC24
	mov	w4, w21
	ldr	x2, .LC27
	mov	w1, 1864
	add	x3, x3, 120
	mov	w0, 0
	bl	dprint_normal
	.p2align 2
.L156:
	str	wzr, [x22, 12]
	ldp	w7, w0, [x20, 16]
	ldr	w1, [x20, 32]
	mul	w7, w7, w0
	cbz	w1, .L163
	sub	w3, w1, #1
	mov	x6, 68
	add	x2, x20, 60
	mov	w1, 0
	add	x6, x6, x3, uxtw 3
	add	x6, x20, x6
	.p2align 2
.L158:
	ldr	w4, [x2, -4]
	ldr	w3, [x2], 8
	sub	w1, w1, w4
	cmp	x2, x6
	add	w3, w3, 1
	add	w1, w3, w1
	bne	.L158
.L157:
	ldr	w2, [x19, 32]
	cbz	w2, .L159
	sub	w3, w2, #1
	mov	x5, 1724
	add	x2, x20, 1716
	add	x3, x5, x3, uxtw 3
	add	x5, x20, x3
	.p2align 2
.L160:
	ldr	w4, [x2, -4]
	ldr	w3, [x2], 8
	sub	w1, w1, w4
	cmp	x5, x2
	add	w3, w3, 1
	add	w1, w3, w1
	bne	.L160
.L159:
	cbz	w7, .L164
	lsl	w0, w1, 2
	mov	w3, 100
	sub	w0, w0, w1
	lsl	w2, w0, 5
	add	w0, w0, w2
	add	w0, w0, w1
	udiv	w0, w0, w7
	cmp	w0, w3
	csel	w0, w0, w3, ls
	cmp	w0, wzr
	cset	w2, eq
.L161:
	cmp	w1, 2
	ldr	x23, [sp, 48]
	cset	w1, hi
	tst	w2, w1
	csinc	w0, w0, wzr, eq
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L171:
	ldr	x0, .LC23
	ldrb	w0, [x0,w21,uxtw]
	adr	x1, .Lrtx150
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx150:
	.section	.rodata
	.align	0
	.align	2
.L150:
	.byte	(.L149 - .Lrtx150) / 4
	.byte	(.L148 - .Lrtx150) / 4
	.byte	(.L151 - .Lrtx150) / 4
	.byte	(.L152 - .Lrtx150) / 4
	.byte	(.L148 - .Lrtx150) / 4
	.byte	(.L148 - .Lrtx150) / 4
	.byte	(.L153 - .Lrtx150) / 4
	.byte	(.L148 - .Lrtx150) / 4
	.byte	(.L154 - .Lrtx150) / 4
	.byte	(.L154 - .Lrtx150) / 4
	.byte	(.L155 - .Lrtx150) / 4
	.byte	(.L155 - .Lrtx150) / 4
	.byte	(.L155 - .Lrtx150) / 4
	.byte	(.L155 - .Lrtx150) / 4
	.byte	(.L148 - .Lrtx150) / 4
	.byte	(.L148 - .Lrtx150) / 4
	.byte	(.L148 - .Lrtx150) / 4
	.byte	(.L155 - .Lrtx150) / 4
	.byte	(.L153 - .Lrtx150) / 4
	.text
	.p2align 3
.L164:
	mov	w2, 1
	mov	w0, 0
	b	.L161
.L155:
	ldr	x3, .LC24
	mov	w4, w21
	ldr	x2, .LC25
	mov	w1, 1734
	add	x3, x3, 24
	mov	w0, 0
	bl	dprint_normal
	b	.L156
.L149:
	mov	x2, x22
	mov	x1, x23
	mov	x0, x20
	bl	PostPro_GetH264RepairParam
	b	.L156
.L151:
	ldr	w0, [x23, 164]
	mov	w5, 1
	str	w0, [x20, 8]
	mov	w4, 4
	mov	w2, 8
	mov	x1, x22
	ldr	w3, [x23, 172]
	mov	x0, x20
	str	w3, [x20, 12]
	ldrh	w3, [x23, 152]
	str	w3, [x20, 16]
	ldrh	w3, [x23, 154]
	stp	w3, w5, [x20, 20]
	str	wzr, [x20, 28]
	str	wzr, [x20, 40]
	ldrb	w3, [x23, 151]
	strb	w3, [x20]
	strb	w2, [x20, 1]
	str	w4, [x20, 48]
	bl	PostPro_GetMp24MbGroup
	b	.L156
.L152:
	mov	x2, x22
	mov	x1, x23
	mov	x0, x20
	bl	PostPro_GetMPEG2RepairParam
	b	.L156
.L153:
	ldr	x3, .LC24
	mov	w4, w21
	ldr	x2, .LC25
	mov	w1, 1757
	add	x3, x3, 56
	mov	w0, 0
	bl	dprint_normal
	b	.L156
.L154:
	ldr	x3, .LC24
	mov	w4, w21
	ldr	x2, .LC25
	mov	w1, 1780
	add	x3, x3, 88
	mov	w0, 0
	bl	dprint_normal
	b	.L156
.L163:
	mov	w1, 0
	b	.L157
	.size	PostPro_GetRepairParam, .-PostPro_GetRepairParam
	.align	3
.LC23:
	.xword	.L150
	.align	3
.LC24:
	.xword	.LANCHOR0
	.align	3
.LC25:
	.xword	.LC15
	.align	3
.LC27:
	.xword	.LC26
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostPro_SetDecReport
	.type	PostPro_SetDecReport, %function
PostPro_SetDecReport:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x0, x30
	mov	x19, x2
	bl	_mcount
	ldr	x3, .LC28
	mov	x2, 820
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	mov	w1, 1
	str	w1, [x19, 12]
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	PostPro_SetDecReport, .-PostPro_SetDecReport
	.align	3
.LC28:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostPro_GetErrRatio
	.type	PostPro_GetErrRatio, %function
PostPro_GetErrRatio:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L178
	ldr	x3, .LC31
	mov	x2, 24
	mov	w1, 0
	add	x0, x29, 72
	ldp	w23, w20, [x19]
	ldr	x3, [x3, 96]
	ldr	x21, [x19, 8]
	blr	x3
	ldr	x22, .LC33
	sxtw	x0, w23
	ldr	x1, .LC34
	lsl	x2, x0, 3
	ldr	x19, .LC32
	sub	x2, x2, x0
	str	w20, [x29, 72]
	lsl	x2, x2, 1
	ldr	x3, [x1, 272]
	sub	x2, x2, x0
	str	w23, [x29, 88]
	lsl	x1, x2, 4
	sub	x1, x1, x0
	add	x0, x0, x2, lsl 6
	sub	x0, x0, x2
	add	x22, x0, x22
	str	x22, [x29, 80]
	add	x19, x19, x1, lsl 4
	cbz	x3, .L176
	add	x0, x29, 72
	blr	x3
.L177:
	mov	w4, w23
	mov	x3, x22
	mov	x2, x21
	mov	x1, x19
	mov	w0, w20
	bl	PostPro_GetRepairParam
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L176:
	mov	w3, 1945
	ldr	x2, .LC36
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L177
	.p2align 3
.L178:
	ldr	x2, .LC30
	mov	w1, 1927
	mov	w0, 0
	bl	dprint_normal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, 1
	ldp	x29, x30, [sp], 96
	ret
	.size	PostPro_GetErrRatio, .-PostPro_GetErrRatio
	.align	3
.LC30:
	.xword	.LC29
	.align	3
.LC31:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC32:
	.xword	g_RepairParam
	.align	3
.LC33:
	.xword	g_DecReport
	.align	3
.LC34:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC36:
	.xword	.LC35
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostPro_SetFullRepair
	.type	PostPro_SetFullRepair, %function
PostPro_SetFullRepair:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	mov	w20, w2
	bl	_mcount
	cbz	x19, .L183
	cbnz	w20, .L184
	ldr	x5, .LC42
	mov	x2, x19
	ldr	x20, .LC43
	mov	w19, 1
	mov	w4, 0
	mov	x3, x5
	mov	x1, x20
	mov	w0, w21
	str	w19, [x5]
	str	wzr, [x5, 12]
	bl	PostPro_GetRepairParam
	str	w19, [x20, 32]
	mov	w0, 100
	str	w19, [x20, 44]
.L181:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L184:
	ldr	x3, .LC37
	mov	w4, w20
	ldr	x2, .LC41
	mov	w1, 1967
	mov	w0, 0
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L183:
	ldr	x3, .LC37
	mov	w1, 1961
	ldr	x2, .LC39
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	b	.L181
	.size	PostPro_SetFullRepair, .-PostPro_SetFullRepair
	.align	3
.LC37:
	.xword	.LANCHOR1
	.align	3
.LC39:
	.xword	.LC38
	.align	3
.LC41:
	.xword	.LC40
	.align	3
.LC42:
	.xword	g_DecReport
	.align	3
.LC43:
	.xword	g_RepairParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostPro_GetRepairStratage
	.type	PostPro_GetRepairStratage, %function
PostPro_GetRepairStratage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x0, x30
	mov	x19, x2
	bl	_mcount
	mov	w0, 1
	cbz	x19, .L188
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L188:
	ldr	x3, .LC44
	mov	w1, 1988
	ldr	x2, .LC45
	mov	w0, 0
	add	x3, x3, 24
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, 2
	ldp	x29, x30, [sp], 32
	ret
	.size	PostPro_GetRepairStratage, .-PostPro_GetRepairStratage
	.align	3
.LC44:
	.xword	.LANCHOR1
	.align	3
.LC45:
	.xword	.LC38
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.6213, %object
	.size	__func__.6213, 23
__func__.6213:
	.string	"PostPro_GetMp24MbGroup"
	.zero	1
	.type	__func__.6315, %object
	.size	__func__.6315, 27
__func__.6315:
	.string	"PostProc_GetVPxRepairParam"
	.zero	5
	.type	__func__.6324, %object
	.size	__func__.6324, 28
__func__.6324:
	.string	"PostProc_GetAVSxRepairParam"
	.zero	4
	.type	__func__.6333, %object
	.size	__func__.6333, 29
__func__.6333:
	.string	"PostProc_GetREALxRepairParam"
	.zero	3
	.type	__func__.6356, %object
	.size	__func__.6356, 23
__func__.6356:
	.string	"PostPro_GetRepairParam"
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.6382, %object
	.size	__func__.6382, 22
__func__.6382:
	.string	"PostPro_SetFullRepair"
	.zero	2
	.type	__func__.6388, %object
	.size	__func__.6388, 26
__func__.6388:
	.string	"PostPro_GetRepairStratage"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC2:
	ASCII(.string	"DecSliceNum out of range!" )
	.zero	6
.LC5:
	ASCII(.string	"%s %d: %s\n" )
	.zero	5
.LC7:
	ASCII(.string	"ValidGroupNum out of range." )
	.zero	4
.LC9:
	ASCII(.string	"DecSliceNum(=%d) out of range!\n" )
.LC11:
	ASCII(.string	"line:%d! pRepairParam->ValidGroupNum > (MAX_UP_MSG_SLICE_NUM - 1)\n" )
	.zero	5
.LC15:
	ASCII(.string	"%s VidStd %d not belong here!\n" )
	.zero	1
.LC26:
	ASCII(.string	"%s VidStd %d Err!\n" )
	.zero	5
.LC29:
	ASCII(.string	"PostPro_GetErrRatio: pParam = NULL\n" )
	.zero	4
.LC35:
	ASCII(.string	"VDMHAL_NULL_FUN_PRINT,L%d\n" )
	.zero	5
.LC38:
	ASCII(.string	"%s pDecParam is null\n" )
	.zero	2
.LC40:
	ASCII(.string	"%s VdhId %d invalid!\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
