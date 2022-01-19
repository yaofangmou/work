#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"bitstream.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	ZerosMS_32
	.type	ZerosMS_32, %function
ZerosMS_32:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x4, .LC0
	ubfx	x0, x19, 24, 8
	lsl	w1, w19, 8
	mov	w2, 3
	ldrb	w0, [x4, x0]
	cmp	w0, 8
	bne	.L5
.L4:
	ubfx	x3, x1, 24, 8
	lsl	w1, w1, 8
	ldrb	w3, [x4, x3]
	cmp	w3, 8
	add	w0, w0, w3
	bne	.L5
	subs	w2, w2, #1
	bne	.L4
.L5:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ZerosMS_32, .-ZerosMS_32
	.align	3
.LC0:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BsInit
	.type	BsInit, %function
BsInit:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	w21, w2
	bl	_mcount
	and	x0, x20, -4
	str	w21, [x19, 24]
	add	x1, x0, 8
	ubfiz	x20, x20, 3, 2
	stp	x0, x1, [x19]
	ldr	w1, [x0]
	rev	w1, w1
	str	w1, [x19, 16]
	ldr	w0, [x0, 4]
	stp	w20, wzr, [x19, 28]
	rev	w0, w0
	str	w0, [x19, 20]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	BsInit, .-BsInit
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BsPos
	.type	BsPos, %function
BsPos:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 32]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	BsPos, .-BsPos
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BsGet
	.type	BsGet, %function
BsGet:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	w3, [x19, 28]
	mov	w5, 32
	cmp	w20, wzr
	mov	w0, 0
	ccmp	w20, w5, 0, ne
	add	w4, w20, w3
	ccmp	w3, 31, 2, le
	cset	w1, hi
	cbnz	w1, .L12
	cmp	w4, w5
	ldr	w2, [x19, 16]
	ble	.L13
	mov	w1, 0
	lsl	w2, w2, w3
	ldr	w0, [x19, 20]
	cbz	w3, .L14
	sub	w3, w5, w3
	lsr	w1, w0, w3
.L14:
	mov	w0, 32
	orr	w1, w2, w1
	sub	w0, w0, w20
	lsr	w0, w1, w0
.L12:
	ldr	w1, [x19, 32]
	ldr	w2, [x19, 24]
	add	w20, w20, w1
	str	w20, [x19, 32]
	cmp	w20, w2, lsl 3
	bcs	.L16
	cmp	w4, 31
	bgt	.L21
	str	w4, [x19, 28]
.L16:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L21:
	ldr	w1, [x19, 20]
	sub	w4, w4, #32
	ldr	x2, [x19, 8]
	str	w1, [x19, 16]
	str	w4, [x19, 28]
	ldr	w1, [x2], 4
	str	x2, [x19, 8]
	rev	w1, w1
	str	w1, [x19, 20]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L13:
	sub	w5, w5, w20
	lsl	w0, w2, w3
	lsr	w0, w0, w5
	b	.L12
	.size	BsGet, .-BsGet
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BsShow
	.type	BsShow, %function
BsShow:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w19, 32
	ldr	w4, [x20, 28]
	ccmp	w19, wzr, 4, le
	mov	w0, 0
	ccmp	w4, 31, 2, ne
	bhi	.L23
	add	w0, w4, w19
	cmp	w0, 32
	ble	.L24
	ldp	w3, w1, [x20, 16]
	mov	w0, 0
	lsl	w3, w3, w4
	cbz	w4, .L25
	mov	w2, 32
	sub	w2, w2, w4
	lsr	w0, w1, w2
.L25:
	mov	w1, 32
	orr	w2, w0, w3
	sub	w0, w1, w19
	lsr	w0, w2, w0
.L23:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L24:
	ldr	w2, [x20, 16]
	mov	w0, 32
	sub	w0, w0, w19
	lsl	w2, w2, w4
	lsr	w0, w2, w0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	BsShow, .-BsShow
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BsSkip
	.type	BsSkip, %function
BsSkip:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	w0, [x19, 32]
	ldp	w1, w2, [x19, 24]
	add	w0, w20, w0
	str	w0, [x19, 32]
	cmp	w0, w1, lsl 3
	bcs	.L31
	add	w0, w2, w20
	cmp	w0, 31
	bgt	.L33
	str	w0, [x19, 28]
.L31:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L33:
	ldr	w2, [x19, 20]
	sub	w0, w0, #32
	ldr	x1, [x19, 8]
	str	w2, [x19, 16]
	str	w0, [x19, 28]
	ldr	w0, [x1], 4
	str	x1, [x19, 8]
	rev	w0, w0
	str	w0, [x19, 20]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	BsSkip, .-BsSkip
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BsBack
	.type	BsBack, %function
BsBack:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	w0, [x19, 32]
	mov	w2, w20
	cmp	w0, w20
	bcs	.L35
	mov	w20, w0
	mov	w2, w0
.L35:
	ldr	w1, [x19, 28]
	sub	w0, w0, w2
	str	w0, [x19, 32]
	subs	w1, w1, w20
	bmi	.L36
	str	w1, [x19, 28]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L36:
	ldr	x0, [x19, 8]
	add	w1, w1, 32
	ldr	w2, [x19, 16]
	str	w2, [x19, 20]
	sub	x2, x0, #4
	str	x2, [x19, 8]
	ldr	w0, [x0, -12]
	str	w1, [x19, 28]
	rev	w0, w0
	str	w0, [x19, 16]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	BsBack, .-BsBack
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BsBitsToNextByte
	.type	BsBitsToNextByte, %function
BsBitsToNextByte:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 32]
	ldr	x19, [sp, 16]
	add	w0, w1, 7
	and	w0, w0, -8
	sub	w0, w0, w1
	ldp	x29, x30, [sp], 32
	ret
	.size	BsBitsToNextByte, .-BsBitsToNextByte
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BsToNextByte
	.type	BsToNextByte, %function
BsToNextByte:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19, 32]
	ldp	w4, w2, [x19, 24]
	add	w1, w3, 7
	and	w0, w1, -8
	str	w0, [x19, 32]
	cmp	w0, w4, lsl 3
	sub	w0, w0, w3
	bcs	.L40
	add	w1, w0, w2
	cmp	w1, 31
	bgt	.L42
	str	w1, [x19, 28]
.L40:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L42:
	ldr	w3, [x19, 20]
	sub	w1, w1, #32
	ldr	x2, [x19, 8]
	str	w3, [x19, 16]
	str	w1, [x19, 28]
	ldr	w1, [x2], 4
	str	x2, [x19, 8]
	rev	w1, w1
	str	w1, [x19, 20]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	BsToNextByte, .-BsToNextByte
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BsResidBits
	.type	BsResidBits, %function
BsResidBits:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 24]
	ldr	w1, [x19, 32]
	lsl	w0, w0, 3
	ldr	x19, [sp, 16]
	sub	w0, w0, w1
	ldp	x29, x30, [sp], 32
	ret
	.size	BsResidBits, .-BsResidBits
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BsIsByteAligned
	.type	BsIsByteAligned, %function
BsIsByteAligned:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 32]
	ldr	x19, [sp, 16]
	and	w0, w0, 7
	cmp	w0, wzr
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	BsIsByteAligned, .-BsIsByteAligned
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BsLongSkip
	.type	BsLongSkip, %function
BsLongSkip:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	mov	w0, 0
	cbz	w19, .L46
	cmp	w19, 64
	bgt	.L47
	cmp	w19, 32
	bgt	.L48
	ldp	w1, w2, [x20, 24]
	ldr	w0, [x20, 32]
	lsl	w1, w1, 3
.L49:
	add	w0, w19, w0
	str	w0, [x20, 32]
	cmp	w0, w1
	mov	w0, w19
	bcs	.L46
	add	w2, w19, w2
	cmp	w2, 31
	bgt	.L58
	str	w2, [x20, 28]
.L46:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L47:
	ldp	w2, w1, [x20, 28]
	mov	w0, 32
	ldr	x3, [x20, 8]
	sub	w0, w0, w2
	sub	w19, w19, w0
	add	w2, w0, w1
	cmp	w19, wzr
	add	w0, w19, 31
	csel	w0, w0, w19, lt
	ands	w6, w19, 31
	asr	w0, w0, 5
	lsl	w1, w0, 2
	sub	w1, w1, #4
	add	w0, w2, w0, lsl 5
	stp	wzr, w2, [x20, 28]
	add	x2, x3, x1
	str	x2, [x20, 8]
	add	x5, x2, 4
	add	x4, x2, 8
	ldr	w1, [x3, x1]
	str	x5, [x20, 8]
	rev	w1, w1
	str	w1, [x20, 16]
	ldr	w1, [x2, 4]
	str	x4, [x20, 8]
	rev	w1, w1
	str	w1, [x20, 20]
	bne	.L53
	str	w0, [x20, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L48:
	ldr	w0, [x20, 32]
	ldp	w1, w2, [x20, 24]
	add	w0, w0, 32
	str	w0, [x20, 32]
	lsl	w1, w1, 3
	cmp	w0, w1
	bcs	.L50
	add	w3, w2, 32
	cmp	w3, 31
	bgt	.L59
	mov	w2, w3
	str	w3, [x20, 28]
.L50:
	sub	w19, w19, #32
	b	.L49
	.p2align 3
.L53:
	ldr	w2, [x20, 24]
	add	w1, w6, w0
	str	w1, [x20, 32]
	mov	w0, w19
	cmp	w1, w2, lsl 3
	bcs	.L46
	str	w6, [x20, 28]
	b	.L46
	.p2align 3
.L58:
	ldr	w1, [x20, 20]
	sub	w2, w2, #32
	ldr	x3, [x20, 8]
	str	w1, [x20, 16]
	str	w2, [x20, 28]
	ldr	w1, [x3], 4
	str	x3, [x20, 8]
	rev	w1, w1
	str	w1, [x20, 20]
	b	.L46
	.p2align 3
.L59:
	ldr	w3, [x20, 20]
	sub	w19, w19, #32
	ldr	x4, [x20, 8]
	str	w3, [x20, 16]
	ldr	w3, [x4], 4
	str	x4, [x20, 8]
	rev	w3, w3
	str	w3, [x20, 20]
	b	.L49
	.size	BsLongSkip, .-BsLongSkip
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BsGetNextBytePtr
	.type	BsGetNextBytePtr, %function
BsGetNextBytePtr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 28]
	mov	w1, 32
	ldr	x2, [x19, 8]
	sub	w0, w1, w0
	ldr	x19, [sp, 16]
	add	w1, w0, 7
	cmp	w0, wzr
	csel	w0, w1, w0, lt
	asr	w0, w0, 3
	add	w0, w0, 4
	ldp	x29, x30, [sp], 32
	sub	x0, x2, x0, sxtw
	ret
	.size	BsGetNextBytePtr, .-BsGetNextBytePtr
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	CalcZeroNum, %object
	.size	CalcZeroNum, 256
CalcZeroNum:
	.byte	8
	.byte	7
	.byte	6
	.byte	6
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
