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
	.global	PostPro_GetHevcMbGroupOfTile
	.type	PostPro_GetHevcMbGroupOfTile, %function
PostPro_GetHevcMbGroupOfTile:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w3
	mov	x21, x1
	bl	_mcount
	sxtw	x0, w19
	ldr	x2, .LC14
	lsl	x1, x0, 3
	str	wzr, [x20, 32]
	sub	x0, x1, x0
	str	wzr, [x20, 44]
	ldr	x1, .LC13
	add	x0, x2, x0, lsl 3
	ldp	w19, w2, [x20, 16]
	ldrsw	x0, [x0, 8]
	mul	w19, w19, w2
	ldr	x0, [x1, x0, lsl 3]
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	HEVC_CalcTileMap
	ldr	w1, [x21, 12]
	cbz	w1, .L133
	ldr	x9, .LC15
	mov	w6, 0
	ldr	x8, .LC16
	mov	w7, 1
	.p2align 2
.L136:
	add	x4, x21, x6, uxtw 2
	ldrh	w3, [x4, 16]
	ldrh	w2, [x4, 18]
	mov	w0, w3
	cmp	w3, w2
	bhi	.L134
	mov	x5, x4
	b	.L135
	.p2align 3
.L153:
	ldrh	w3, [x4, 16]
.L135:
	cmp	w19, w3
	blt	.L137
	cmp	w19, w2
	blt	.L137
	ldr	w2, [x8, w0, uxtw 2]
	strb	w7, [x9, x2]
.L137:
	ldrh	w2, [x5, 18]
	add	w0, w0, 1
	cmp	w2, w0
	bcs	.L153
	ldr	w1, [x21, 12]
.L134:
	add	w6, w6, 1
	cmp	w1, w6
	bhi	.L136
.L133:
	ldr	x3, .LC15
	mov	w4, 0
	.p2align 2
.L142:
	cmp	w4, w19
	bcs	.L143
	ldrb	w0, [x3, w4, uxtw]
	mov	w1, w4
	cmp	w0, 1
	bne	.L151
	b	.L154
	.p2align 3
.L155:
	ldrb	w2, [x3, w0, uxtw]
	cbnz	w2, .L140
	mov	w1, w0
.L151:
	add	w0, w1, 1
	cmp	w0, w19
	bcc	.L155
.L140:
	ldr	w2, [x20, 32]
	add	w5, w2, 1
	add	x2, x20, x2, sxtw 3
	stp	w4, w1, [x2, 56]
	str	w5, [x20, 32]
	mov	w4, w0
.L139:
	cmp	w5, 199
	ble	.L142
	ldr	x2, .LC18
	mov	w1, 595
	mov	w0, 1
	sub	w19, w19, #1
	bl	dprint_normal
	mov	w0, 1
	str	w0, [x20, 32]
	stp	wzr, w19, [x20, 56]
.L143:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L154:
	add	w4, w4, 1
	ldr	w5, [x20, 32]
	b	.L139
	.size	PostPro_GetHevcMbGroupOfTile, .-PostPro_GetHevcMbGroupOfTile
	.align	3
.LC13:
	.xword	s_pstVfmwChan
	.align	3
.LC14:
	.xword	g_VdmDrvParam
	.align	3
.LC15:
	.xword	g_IsDeced
	.align	3
.LC16:
	.xword	g_TsToRsMap
	.align	3
.LC18:
	.xword	.LC17
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostPro_GetHevcMbGroupOfNoTile
	.type	PostPro_GetHevcMbGroupOfNoTile, %function
PostPro_GetHevcMbGroupOfNoTile:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w20, w3
	mov	x19, x1
	bl	_mcount
	sxtw	x0, w20
	ldr	x2, .LC20
	lsl	x1, x0, 3
	str	wzr, [x21, 32]
	sub	x0, x1, x0
	str	wzr, [x21, 44]
	ldr	x1, .LC19
	add	x0, x2, x0, lsl 3
	ldp	w20, w2, [x21, 16]
	ldrsw	x0, [x0, 8]
	mul	w20, w20, w2
	ldr	x0, [x1, x0, lsl 3]
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	HEVC_CalcTileMap
	ldr	w1, [x19, 12]
	mov	w6, -1
	uxth	w2, w20
	mov	w7, w6
	mov	w0, 0
	add	w9, w20, w6
	add	x3, x19, x1, lsl 2
	strh	w2, [x3, 18]
	strh	w2, [x3, 16]
	b	.L165
	.p2align 3
.L173:
	cmp	w2, w6
	csel	w6, w6, w7, ge
	add	w1, w6, 1
	cmp	w2, w1
	ble	.L159
	ldr	w4, [x21, 32]
	cmp	w4, 199
	bgt	.L170
	add	x1, x21, x4, sxtw 3
	add	w7, w7, w7, lsr 31
	sub	w6, w6, #100
	sub	w8, w2, #1
	cmp	w7, w6
	stp	w7, w8, [x1, 56]
	bcs	.L162
	str	w6, [x1, 56]
.L162:
	add	w4, w4, 1
	str	w4, [x21, 32]
.L159:
	ldr	w1, [x19, 12]
	sub	w4, w1, #1
	cmp	w4, w0
	beq	.L171
.L168:
	add	w0, w0, 1
	mov	w6, w3
	cmp	w0, w1
	mov	w7, w2
	bhi	.L172
.L165:
	sxtw	x5, w0
	add	x2, x19, x5, lsl 2
	mov	x1, x2
	ldrh	w2, [x2, 16]
	ldrh	w3, [x1, 18]
	cmp	w20, w2
	ccmp	w20, w3, 1, ge
	ccmp	w2, w3, 0, ge
	ble	.L173
	ldr	w1, [x19, 12]
	add	w0, w0, 1
	cmp	w0, w1
	bls	.L165
.L172:
	mov	w0, 0
.L161:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L171:
	add	x5, x19, x5, lsl 2
	ldrh	w5, [x5, 18]
	cmp	w5, w9
	bge	.L168
	ldr	w4, [x21, 32]
	cmp	w4, 199
	bgt	.L174
	add	x1, x21, x4, sxtw 3
	mov	w0, 0
	add	w4, w4, 1
	stp	w5, w9, [x1, 56]
	str	w4, [x21, 32]
	b	.L161
.L170:
	ldr	x3, .LC21
	mov	w1, 643
	ldr	x2, .LC23
	mov	w0, 1
	add	x3, x3, 24
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L174:
	ldr	x3, .LC21
	mov	w1, 664
	ldr	x2, .LC25
	mov	w0, 1
	add	x3, x3, 24
	bl	dprint_normal
	mov	w0, 1
	b	.L161
	.size	PostPro_GetHevcMbGroupOfNoTile, .-PostPro_GetHevcMbGroupOfNoTile
	.align	3
.LC19:
	.xword	s_pstVfmwChan
	.align	3
.LC20:
	.xword	g_VdmDrvParam
	.align	3
.LC21:
	.xword	.LANCHOR0
	.align	3
.LC23:
	.xword	.LC22
	.align	3
.LC25:
	.xword	.LC24
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostPro_GetHevcMbGroup
	.type	PostPro_GetHevcMbGroup, %function
PostPro_GetHevcMbGroup:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	mov	w22, w3
	mov	x21, x2
	bl	_mcount
	ldr	w3, [x19, 12]
	sub	w1, w3, #1
	cmp	w1, 199
	bhi	.L179
	ldr	w0, [x20, 52]
	mov	w3, w22
	mov	x2, x21
	mov	x1, x19
	cbnz	w0, .L180
	mov	x0, x20
	bl	PostPro_GetHevcMbGroupOfNoTile
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L180:
	mov	x0, x20
	bl	PostPro_GetHevcMbGroupOfTile
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L179:
	ldr	x2, .LC26
	mov	w1, 687
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	PostPro_GetHevcMbGroup, .-PostPro_GetHevcMbGroup
	.align	3
.LC26:
	.xword	.LC9
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostPro_GetHEVCRepairParam
	.type	PostPro_GetHEVCRepairParam, %function
PostPro_GetHEVCRepairParam:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	mov	x22, x2
	mov	w21, w3
	bl	_mcount
	ldr	w0, [x19, 1284]
	mov	w4, 1
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 1336]
	str	w0, [x20, 8]
	ldr	x0, [x19, 2368]
	ldr	w0, [x0, 372]
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 1336]
	str	w0, [x20, 12]
	ldr	w3, [x19, 72]
	str	w3, [x20, 48]
	lsl	w2, w4, w3
	ldrb	w0, [x19]
	strb	w0, [x20]
	ldp	w5, w0, [x19, 92]
	cmp	w0, w5
	csel	w0, w0, w5, cs
	strb	w0, [x20, 1]
	ldr	w0, [x19, 192]
	sub	w0, w0, #1
	add	w0, w0, w2
	lsr	w0, w0, w3
	str	w0, [x20, 16]
	ldr	w0, [x19, 188]
	sub	w0, w0, #1
	add	w2, w0, w2
	lsr	w2, w2, w3
	str	w2, [x20, 20]
	ldrb	w0, [x19, 221]
	str	w0, [x20, 52]
	str	w4, [x20, 24]
	ldr	w0, [x19, 8]
	cmp	w0, wzr
	cset	w0, eq
	str	w0, [x20, 28]
	ldr	w0, [x19, 1332]
	cbnz	w0, .L194
	str	wzr, [x22, 12]
.L183:
	ldp	w2, w0, [x20, 8]
	cmp	w2, w0
	beq	.L195
.L184:
	str	wzr, [x20, 40]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L195:
	ldr	w3, [x19, 1464]
	cbz	w3, .L184
	ldr	w1, [x19, 1336]
	mov	w0, 0
	cmp	w2, w1
	bne	.L185
	.p2align 2
.L187:
	add	w0, w0, 1
	cmp	w3, w0
	add	x1, x19, x0, sxtw 2
	beq	.L184
	ldr	w1, [x1, 1336]
	cmp	w2, w1
	beq	.L187
.L185:
	str	w1, [x20, 12]
	str	wzr, [x20, 40]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L194:
	mov	w3, w21
	mov	x2, x19
	mov	x1, x22
	mov	x0, x20
	bl	PostPro_GetHevcMbGroup
	b	.L183
	.size	PostPro_GetHEVCRepairParam, .-PostPro_GetHEVCRepairParam
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
	cbz	w0, .L201
	cmp	w0, 1
	beq	.L205
	cmp	w0, 2
	beq	.L205
	cmp	w0, 3
	bne	.L198
.L201:
	str	wzr, [x19, 40]
.L198:
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
.L205:
	str	w0, [x19, 40]
	b	.L198
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
	ldr	x4, .LC27
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
.LC27:
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
	ldr	x3, .LC28
	mov	w4, w19
	ldr	x2, .LC30
	mov	w1, 1734
	add	x3, x3, 56
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	PostProc_GetVPxRepairParam, .-PostProc_GetVPxRepairParam
	.align	3
.LC28:
	.xword	.LANCHOR0
	.align	3
.LC30:
	.xword	.LC29
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
	ldr	x3, .LC31
	mov	w4, w19
	ldr	x2, .LC32
	mov	w1, 1757
	add	x3, x3, 88
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	PostProc_GetAVSxRepairParam, .-PostProc_GetAVSxRepairParam
	.align	3
.LC31:
	.xword	.LANCHOR0
	.align	3
.LC32:
	.xword	.LC29
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
	ldr	x3, .LC33
	mov	w4, w19
	ldr	x2, .LC34
	mov	w1, 1780
	add	x3, x3, 120
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	PostProc_GetREALxRepairParam, .-PostProc_GetREALxRepairParam
	.align	3
.LC33:
	.xword	.LANCHOR0
	.align	3
.LC34:
	.xword	.LC29
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
	stp	x23, x24, [sp, 48]
	mov	x20, x1
	mov	w21, w0
	add	x19, x1, 1656
	mov	x0, x30
	mov	x23, x2
	mov	x22, x3
	mov	w24, w4
	bl	_mcount
	str	w21, [x20, 4]
	cmp	w21, 18
	str	wzr, [x20, 32]
	str	wzr, [x19, 32]
	bls	.L236
.L212:
	ldr	x3, .LC38
	mov	w4, w21
	ldr	x2, .LC41
	mov	w1, 1864
	add	x3, x3, 152
	mov	w0, 0
	bl	dprint_normal
	.p2align 2
.L221:
	str	wzr, [x22, 12]
	ldp	w7, w0, [x20, 16]
	ldr	w1, [x20, 32]
	mul	w7, w7, w0
	cbz	w1, .L228
	sub	w3, w1, #1
	mov	x6, 68
	add	x2, x20, 60
	mov	w1, 0
	add	x6, x6, x3, uxtw 3
	add	x6, x20, x6
	.p2align 2
.L223:
	ldr	w4, [x2, -4]
	ldr	w3, [x2], 8
	sub	w1, w1, w4
	cmp	x2, x6
	add	w3, w3, 1
	add	w1, w3, w1
	bne	.L223
.L222:
	ldr	w2, [x19, 32]
	cbz	w2, .L224
	sub	w3, w2, #1
	mov	x5, 1724
	add	x2, x20, 1716
	add	x3, x5, x3, uxtw 3
	add	x5, x20, x3
	.p2align 2
.L225:
	ldr	w4, [x2, -4]
	ldr	w3, [x2], 8
	sub	w1, w1, w4
	cmp	x5, x2
	add	w3, w3, 1
	add	w1, w3, w1
	bne	.L225
.L224:
	cbz	w7, .L229
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
.L226:
	cmp	w1, 2
	cset	w1, hi
	tst	w2, w1
	csinc	w0, w0, wzr, eq
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L236:
	ldr	x0, .LC37
	ldrb	w0, [x0,w21,uxtw]
	adr	x1, .Lrtx214
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx214:
	.section	.rodata
	.align	0
	.align	2
.L214:
	.byte	(.L213 - .Lrtx214) / 4
	.byte	(.L212 - .Lrtx214) / 4
	.byte	(.L215 - .Lrtx214) / 4
	.byte	(.L216 - .Lrtx214) / 4
	.byte	(.L212 - .Lrtx214) / 4
	.byte	(.L212 - .Lrtx214) / 4
	.byte	(.L217 - .Lrtx214) / 4
	.byte	(.L212 - .Lrtx214) / 4
	.byte	(.L218 - .Lrtx214) / 4
	.byte	(.L218 - .Lrtx214) / 4
	.byte	(.L219 - .Lrtx214) / 4
	.byte	(.L219 - .Lrtx214) / 4
	.byte	(.L219 - .Lrtx214) / 4
	.byte	(.L219 - .Lrtx214) / 4
	.byte	(.L212 - .Lrtx214) / 4
	.byte	(.L212 - .Lrtx214) / 4
	.byte	(.L220 - .Lrtx214) / 4
	.byte	(.L219 - .Lrtx214) / 4
	.byte	(.L217 - .Lrtx214) / 4
	.text
	.p2align 3
.L229:
	mov	w2, 1
	mov	w0, 0
	b	.L226
.L220:
	mov	w3, w24
	mov	x2, x22
	mov	x1, x23
	mov	x0, x20
	bl	PostPro_GetHEVCRepairParam
	b	.L221
.L213:
	mov	x2, x22
	mov	x1, x23
	mov	x0, x20
	bl	PostPro_GetH264RepairParam
	b	.L221
.L215:
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
	b	.L221
.L216:
	mov	x2, x22
	mov	x1, x23
	mov	x0, x20
	bl	PostPro_GetMPEG2RepairParam
	b	.L221
.L217:
	ldr	x3, .LC38
	mov	w4, w21
	ldr	x2, .LC39
	mov	w1, 1757
	add	x3, x3, 88
	mov	w0, 0
	bl	dprint_normal
	b	.L221
.L218:
	ldr	x3, .LC38
	mov	w4, w21
	ldr	x2, .LC39
	mov	w1, 1780
	add	x3, x3, 120
	mov	w0, 0
	bl	dprint_normal
	b	.L221
.L219:
	ldr	x3, .LC38
	mov	w4, w21
	ldr	x2, .LC39
	mov	w1, 1734
	add	x3, x3, 56
	mov	w0, 0
	bl	dprint_normal
	b	.L221
.L228:
	mov	w1, 0
	b	.L222
	.size	PostPro_GetRepairParam, .-PostPro_GetRepairParam
	.align	3
.LC37:
	.xword	.L214
	.align	3
.LC38:
	.xword	.LANCHOR0
	.align	3
.LC39:
	.xword	.LC29
	.align	3
.LC41:
	.xword	.LC40
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
	ldr	x3, .LC42
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
.LC42:
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
	cbz	x19, .L243
	ldr	x3, .LC45
	mov	x2, 24
	mov	w1, 0
	add	x0, x29, 72
	ldp	w23, w20, [x19]
	ldr	x3, [x3, 96]
	ldr	x21, [x19, 8]
	blr	x3
	ldr	x22, .LC47
	sxtw	x0, w23
	ldr	x1, .LC48
	lsl	x2, x0, 3
	ldr	x19, .LC46
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
	cbz	x3, .L241
	add	x0, x29, 72
	blr	x3
.L242:
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
.L241:
	mov	w3, 1945
	ldr	x2, .LC50
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L242
	.p2align 3
.L243:
	ldr	x2, .LC44
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
.LC44:
	.xword	.LC43
	.align	3
.LC45:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC46:
	.xword	g_RepairParam
	.align	3
.LC47:
	.xword	g_DecReport
	.align	3
.LC48:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC50:
	.xword	.LC49
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
	cbz	x19, .L248
	cbnz	w20, .L249
	ldr	x5, .LC56
	mov	x2, x19
	ldr	x20, .LC57
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
.L246:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L249:
	ldr	x3, .LC51
	mov	w4, w20
	ldr	x2, .LC55
	mov	w1, 1967
	mov	w0, 0
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L248:
	ldr	x3, .LC51
	mov	w1, 1961
	ldr	x2, .LC53
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	b	.L246
	.size	PostPro_SetFullRepair, .-PostPro_SetFullRepair
	.align	3
.LC51:
	.xword	.LANCHOR1
	.align	3
.LC53:
	.xword	.LC52
	.align	3
.LC55:
	.xword	.LC54
	.align	3
.LC56:
	.xword	g_DecReport
	.align	3
.LC57:
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
	cbz	x19, .L253
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L253:
	ldr	x3, .LC58
	mov	w1, 1988
	ldr	x2, .LC59
	mov	w0, 0
	add	x3, x3, 24
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, 2
	ldp	x29, x30, [sp], 32
	ret
	.size	PostPro_GetRepairStratage, .-PostPro_GetRepairStratage
	.align	3
.LC58:
	.xword	.LANCHOR1
	.align	3
.LC59:
	.xword	.LC52
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.7489, %object
	.size	__func__.7489, 23
__func__.7489:
	.string	"PostPro_GetMp24MbGroup"
	.zero	1
	.type	__func__.7598, %object
	.size	__func__.7598, 31
__func__.7598:
	.string	"PostPro_GetHevcMbGroupOfNoTile"
	.zero	1
	.type	__func__.7658, %object
	.size	__func__.7658, 27
__func__.7658:
	.string	"PostProc_GetVPxRepairParam"
	.zero	5
	.type	__func__.7667, %object
	.size	__func__.7667, 28
__func__.7667:
	.string	"PostProc_GetAVSxRepairParam"
	.zero	4
	.type	__func__.7676, %object
	.size	__func__.7676, 29
__func__.7676:
	.string	"PostProc_GetREALxRepairParam"
	.zero	3
	.type	__func__.7700, %object
	.size	__func__.7700, 23
__func__.7700:
	.string	"PostPro_GetRepairParam"
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.7726, %object
	.size	__func__.7726, 22
__func__.7726:
	.string	"PostPro_SetFullRepair"
	.zero	2
	.type	__func__.7732, %object
	.size	__func__.7732, 26
__func__.7732:
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
.LC17:
	ASCII(.string	"pRepairParam->ValidGroupNum >(MAX_UP_MSG_SLICE_NUM - 1)\n" )
	.zero	7
.LC22:
	ASCII(.string	"%s:0 pRepairParam->ValidGroupNum(%d) > (MAX_UP_MSG_SLICE_NUM - 1)\n" )
	.zero	5
.LC24:
	ASCII(.string	"%s:1 pRepairParam->ValidGroupNum(%d) > (MAX_UP_MSG_SLICE_NUM - 1)\n" )
	.zero	5
.LC29:
	ASCII(.string	"%s VidStd %d not belong here!\n" )
	.zero	1
.LC40:
	ASCII(.string	"%s VidStd %d Err!\n" )
	.zero	5
.LC43:
	ASCII(.string	"PostPro_GetErrRatio: pParam = NULL\n" )
	.zero	4
.LC49:
	ASCII(.string	"VDMHAL_NULL_FUN_PRINT,L%d\n" )
	.zero	5
.LC52:
	ASCII(.string	"%s pDecParam is null\n" )
	.zero	2
.LC54:
	ASCII(.string	"%s VdhId %d invalid!\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
