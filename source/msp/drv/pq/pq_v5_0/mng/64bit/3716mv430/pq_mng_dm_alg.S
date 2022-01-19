#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"pq_mng_dm_alg.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	DM_Init
	.type	DM_Init, %function
DM_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x19, x3
	add	x20, x3, 4096
	bl	_mcount
	add	x3, x19, 8
	mov	x2, 128
	mov	x0, x3
	str	x3, [x19, 144]
	mov	w1, 0
	stp	wzr, wzr, [x19]
	bl	pq_alg_memset
	ldr	x22, .LC0
	mov	w3, 1
	mov	w4, 6
	strb	w3, [x19, 152]
	mov	x1, x22
	strb	w3, [x19, 153]
	add	x0, x19, 154
	str	w4, [x19, 136]
	mov	x2, 14
	bl	pq_alg_memcpy
	add	x1, x22, 16
	add	x0, x19, 168
	mov	x2, 192
	bl	pq_alg_memcpy
	add	x0, x19, 360
	mov	x2, 1440
	mov	w1, 0
	bl	pq_alg_memset
	add	x0, x19, 1800
	mov	x2, 1440
	mov	w1, 0
	bl	pq_alg_memset
	add	x0, x19, 3240
	mov	x2, 1440
	mov	w1, 0
	bl	pq_alg_memset
	add	x0, x20, 584
	mov	x2, 90
	mov	w1, 0
	bl	pq_alg_memset
	ldr	w0, [x21, 12]
	mov	w1, 30
	mov	w2, 2
	mov	w4, 21846
	adds	w3, w0, 9
	add	w0, w0, 24
	csel	w0, w0, w3, mi
	movk	w4, 0x5555, lsl 16
	asr	w0, w0, 4
	strh	w0, [x19, 4770]
	and	w0, w0, 65535
	mov	w5, 5
	ldr	w3, [x21, 8]
	strh	w1, [x19, 4776]
	add	w1, w3, 96
	adds	w3, w3, 33
	csel	w3, w1, w3, mi
	strh	w2, [x19, 4778]
	asr	w3, w3, 6
	strh	w2, [x19, 4782]
	strh	w2, [x19, 4788]
	strh	w2, [x19, 4792]
	strh	w2, [x19, 4796]
	uxth	w2, w3
	and	w3, w3, 65535
	lsr	w1, w2, 1
	strh	w5, [x19, 4774]
	mul	w3, w0, w3
	strh	w2, [x19, 4772]
	mov	w0, 20
	lsl	w3, w3, 1
	strh	w1, [x19, 4786]
	strh	w5, [x19, 4794]
	mov	x2, 300
	smull	x4, w3, w4
	strh	w1, [x19, 4798]
	mov	w1, 256
	lsr	x4, x4, 32
	strh	w1, [x19, 4780]
	strh	w0, [x19, 4784]
	sub	w3, w4, w3, asr 31
	strh	w3, [x19, 4790]
	add	x0, x20, 708
	mov	w1, 0
	ldr	w3, [x21, 12]
	strh	w5, [x19, 4802]
	add	w3, w3, w3, lsr 31
	asr	w3, w3, 1
	strh	w3, [x19, 4800]
	bl	pq_alg_memset
	strh	wzr, [x19, 5104]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	DM_Init, .-DM_Init
	.align	3
.LC0:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DM_InitOutputReg
	.type	DM_InitOutputReg, %function
DM_InitOutputReg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldrh	w0, [x20, 4]
	add	x1, x20, 26
	strh	w0, [x19]
	mov	x2, 62
	add	x0, x19, 22
	ldrh	w3, [x20, 6]
	strh	w3, [x19, 2]
	ldrh	w3, [x20, 8]
	strh	w3, [x19, 4]
	ldrh	w3, [x20, 10]
	strh	w3, [x19, 6]
	ldrb	w3, [x20, 12]
	strb	w3, [x19, 8]
	ldrb	w3, [x20, 13]
	strb	w3, [x19, 9]
	ldrsh	w3, [x20, 14]
	strh	w3, [x19, 10]
	ldrsh	w3, [x20, 16]
	strh	w3, [x19, 12]
	ldrsh	w3, [x20, 18]
	strh	w3, [x19, 14]
	ldrsh	w3, [x20, 20]
	strh	w3, [x19, 16]
	ldrb	w3, [x20, 22]
	strb	w3, [x19, 18]
	ldrb	w3, [x20, 23]
	strb	w3, [x19, 19]
	ldrb	w3, [x20, 24]
	strb	w3, [x19, 20]
	bl	pq_alg_memcpy
	ldrh	w0, [x20, 88]
	add	x1, x20, 108
	strh	w0, [x19, 84]
	mov	x2, 300
	ldr	x3, .LC1
	add	x0, x19, 102
	ldrh	w4, [x20, 90]
	strh	w4, [x19, 86]
	ldr	w4, [x3, 208]
	ldrb	w3, [x20, 92]
	strb	w3, [x19, 88]
	ldrb	w3, [x20, 93]
	strb	w3, [x19, 89]
	ldrb	w3, [x20, 94]
	strb	w3, [x19, 90]
	ldrh	w3, [x20, 96]
	strh	w3, [x19, 92]
	ldrh	w3, [x20, 98]
	strh	w3, [x19, 94]
	ldrh	w3, [x20, 100]
	strh	w3, [x19, 96]
	ldrh	w3, [x20, 102]
	strh	w3, [x19, 98]
	strb	w4, [x19, 100]
	bl	pq_alg_memcpy
	ldrh	w0, [x20, 408]
	strh	w0, [x19, 402]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	DM_InitOutputReg, .-DM_InitOutputReg
	.align	3
.LC1:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DM_sort_cxp
	.type	DM_sort_cxp, %function
DM_sort_cxp:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	uxtb	w20, w1
	bl	_mcount
	sub	w7, w20, #1
	mov	w5, 0
	cmp	w7, wzr
	mov	w6, 0
	ble	.L3
	.p2align 2
.L11:
	sub	w5, w7, w5
	mov	w1, 0
	cmp	w5, wzr
	ble	.L10
	.p2align 2
.L12:
	sbfiz	x0, x1, 1, 32
	ldrsh	w3, [x19, w1, sxtw 1]
	add	x0, x0, 2
	add	w4, w1, 1
	ldrsh	w2, [x19, x0]
	cmp	w3, w2
	ble	.L6
	strh	w3, [x19, x0]
	strh	w2, [x19, w1, sxtw 1]
.L6:
	sxth	w1, w4
	cmp	w1, w5
	blt	.L12
.L10:
	add	w6, w6, 1
	sxth	w6, w6
	cmp	w6, w7
	mov	w5, w6
	blt	.L11
.L3:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	DM_sort_cxp, .-DM_sort_cxp
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DM_GetMedian
	.type	DM_GetMedian, %function
DM_GetMedian:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	uxtb	w19, w1
	bl	_mcount
	ldr	x20, .LC2
	ubfiz	x21, x19, 1, 8
	mov	w1, 0
	mov	x2, x21
	mov	x0, x20
	bl	pq_alg_memset
	mov	x2, x21
	mov	x1, x22
	mov	x0, x20
	bl	pq_alg_memcpy
	mov	w1, w19
	mov	x0, x20
	lsr	w19, w19, 1
	bl	DM_sort_cxp
	ldp	x21, x22, [sp, 32]
	ldrh	w0, [x20, w19, sxtw 1]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	DM_GetMedian, .-DM_GetMedian
	.align	3
.LC2:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DM_MvUniCheck
	.type	DM_MvUniCheck, %function
DM_MvUniCheck:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x21, x1
	uxth	w20, w4
	mov	x0, x30
	mov	x22, x2
	mov	x23, x3
	bl	_mcount
	ldrsh	w0, [x19, 4774]
	ldrsh	w1, [x21, w20, uxtw 1]
	cmp	w0, w1
	bgt	.L19
	ldrsh	w2, [x19, 4776]
	mov	w0, 0
	cmp	w2, w1
	blt	.L18
	ldrsh	w2, [x22, w20, uxtw 1]
	ldrsh	w1, [x19, 4778]
	cmp	w2, w1
	bgt	.L18
	ldrsh	w0, [x19, 4780]
	ldrh	w1, [x23, w20, uxtw 1]
	cmp	w1, w0
	cset	w0, ge
.L18:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L19:
	mov	w0, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	DM_MvUniCheck, .-DM_MvUniCheck
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DM_DetRoSub_1st
	.type	DM_DetRoSub_1st, %function
DM_DetRoSub_1st:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x24, x0
	mov	x0, x30
	mov	x21, x2
	add	x23, x24, 4096
	stp	x2, x1, [x29, 96]
	bl	_mcount
	ldr	x20, .LC3
	ldrh	w3, [x24, 4770]
	mov	x2, 8192
	add	x20, x20, 3840
	mov	w1, 0
	mov	x0, x20
	mov	w19, w3
	add	x3, x23, 584
	ldrh	w25, [x24, 4772]
	str	w19, [x29, 124]
	add	x26, x24, 360
	str	x3, [x29, 128]
	bl	pq_alg_memset
	add	x0, x24, 3240
	strh	wzr, [x21]
	str	x0, [x29, 136]
	add	x27, x24, 1800
	cbz	w19, .L29
	ubfiz	x0, x25, 1, 16
	mov	w23, 0
	str	x0, [x29, 112]
	mov	w9, 0
	uxtb	w0, w25
	mov	w19, 0
	mov	w28, 0
	str	w0, [x29, 120]
	.p2align 2
.L28:
	mul	w22, w9, w25
	ldr	x2, [x29, 112]
	mov	x0, x20
	sxtw	x21, w28
	add	x1, x26, x22, sxtw 1
	bl	pq_alg_memcpy
	ldrb	w1, [x29, 120]
	mov	x0, x20
	bl	DM_GetMedian
	sxth	x3, w0
	ldr	x1, [x29, 128]
	eor	x2, x3, x3, asr 63
	sub	x2, x2, x3, asr 63
	strh	w0, [x1, w28, sxtw 1]
	mov	x0, x3
	ldrsh	w1, [x24, 4784]
	mul	w1, w1, w2
	mov	w2, 34079
	add	w1, w1, 50
	movk	w2, 0x51eb, lsl 16
	smull	x12, w1, w2
	asr	x12, x12, 37
	sub	w12, w12, w1, asr 31
	sxth	w12, w12
	cbz	w25, .L24
	ldrsh	w13, [x24, 4774]
	mov	w11, 0
	mov	w14, 0
	mov	w15, 0
	mov	w1, 0
	.p2align 2
.L26:
	uxth	w1, w1
	add	w2, w23, w1
	add	w1, w1, 1
	uxth	w2, w2
	sxth	w1, w1
	ldrsh	w3, [x26, w2, uxtw 1]
	cmp	w3, w13
	blt	.L25
	ldrsh	w16, [x24, 4776]
	cmp	w16, w3
	blt	.L25
	ldrsh	w16, [x27, w2, uxtw 1]
	add	w11, w22, w11
	ldrsh	w3, [x24, 4778]
	cmp	w16, w3
	bgt	.L25
	ldr	x3, [x29, 136]
	add	w16, w15, 1
	ldrh	w3, [x3, w2, uxtw 1]
	ldrsh	w2, [x24, 4780]
	cmp	w3, w2
	blt	.L25
	ldrsh	w3, [x26, w11, sxtw 1]
	sub	w2, w3, w0
	sxtw	x2, w2
	eor	x11, x2, x2, asr 63
	sub	x11, x11, x2, asr 63
	cmp	w12, w11
	blt	.L25
	add	w14, w14, w3
	sxth	w15, w16
.L25:
	cmp	w1, w25
	mov	w11, w1
	blt	.L26
	ldrsh	w0, [x24, 4786]
	add	w19, w19, w15
	cmp	w15, w0
	sxth	w19, w19
	ccmp	w15, wzr, 4, ge
	ble	.L24
	add	w0, w15, w15, lsr 31
	sbfx	x0, x0, 1, 16
	add	w14, w0, w14
	ldr	x0, [x29, 104]
	sdiv	w15, w14, w15
	strh	w15, [x0, x21, lsl 1]
.L27:
	add	w8, w28, 1
	ldr	w0, [x29, 124]
	add	w5, w25, w23
	sxth	w28, w8
	cmp	w28, w0
	uxth	w23, w5
	mov	w9, w28
	blt	.L28
.L23:
	ldr	x0, [x29, 96]
	strh	w19, [x0]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L24:
	ldr	x0, [x29, 104]
	strh	wzr, [x0, x21, lsl 1]
	b	.L27
.L29:
	mov	w19, 0
	b	.L23
	.size	DM_DetRoSub_1st, .-DM_DetRoSub_1st
	.align	3
.LC3:
	.xword	.LANCHOR2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DM_GetMean
	.type	DM_GetMean, %function
DM_GetMean:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	uxtb	w19, w1
	bl	_mcount
	mov	w0, 0
	cbz	w19, .L36
	mov	w2, 0
	.p2align 2
.L37:
	add	w4, w2, 1
	ldrh	w3, [x20, w2, sxtw 1]
	sxth	w2, w4
	add	w0, w0, w3
	cmp	w2, w19
	sxth	w0, w0
	blt	.L37
.L36:
	add	w0, w0, w19, lsr 1
	sdiv	w0, w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	DM_GetMean, .-DM_GetMean
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DM_GetRoSubCoordX
	.type	DM_GetRoSubCoordX, %function
DM_GetRoSubCoordX:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	sxth	w22, w2
	sxth	w19, w3
	sxth	w20, w1
	mov	x23, x4
	mov	x24, x5
	bl	_mcount
	sub	w11, w19, w22
	ldrsh	w2, [x21, 4796]
	add	w0, w11, 1
	add	x1, x21, 360
	cmp	w0, w2
	ldrh	w3, [x21, 4772]
	blt	.L56
	ldrsh	w2, [x21, 4794]
	cmp	w0, w2
	bgt	.L56
	sub	w4, w3, #1
	sxtw	x0, w20
	mov	w7, 34079
	sxth	w4, w4
	strh	w4, [x23]
	strh	wzr, [x24]
	eor	x2, x0, x0, asr 63
	sub	x2, x2, x0, asr 63
	movk	w7, 0x51eb, lsl 16
	ldrsh	w0, [x21, 4784]
	mul	w0, w0, w2
	add	w0, w0, 50
	smull	x7, w0, w7
	asr	x7, x7, 37
	sub	w0, w7, w0, asr 31
	sxth	w7, w0
	cbz	w3, .L42
	add	w12, w11, w11, lsr 31
	mov	w9, 0
	asr	w12, w12, 1
	mov	w10, 0
	.p2align 2
.L43:
	cmp	w19, w22
	blt	.L57
	mov	w0, w22
	mov	w2, 0
	.p2align 2
.L45:
	madd	w6, w0, w3, w9
	add	w0, w0, 1
	add	w5, w2, 1
	ldrsh	w6, [x1, w6, sxtw 1]
	sxth	w0, w0
	sub	w6, w6, w20
	sxtw	x6, w6
	eor	x8, x6, x6, asr 63
	sub	x8, x8, x6, asr 63
	cmp	w7, w8
	blt	.L44
	uxth	w2, w5
.L44:
	cmp	w19, w0
	bge	.L45
	cmp	w12, w2
	blt	.L61
.L46:
	add	w10, w10, 1
	sxth	w10, w10
	cmp	w10, w3
	mov	w9, w10
	blt	.L43
.L42:
	tbnz	w4, #31, .L48
	add	w11, w11, w11, lsr 31
	asr	w5, w11, 1
	.p2align 2
.L49:
	cmp	w19, w22
	blt	.L58
	mov	w0, w22
	mov	w9, 0
	.p2align 2
.L51:
	madd	w6, w0, w3, w4
	add	w0, w0, 1
	add	w2, w9, 1
	ldrsh	w6, [x1, w6, sxtw 1]
	sxth	w0, w0
	sub	w6, w6, w20
	sxtw	x6, w6
	eor	x8, x6, x6, asr 63
	sub	x8, x8, x6, asr 63
	cmp	w7, w8
	blt	.L50
	uxth	w9, w2
.L50:
	cmp	w19, w0
	bge	.L51
	cmp	w5, w9
	blt	.L62
.L52:
	sub	w4, w4, #1
	sxth	w4, w4
	tbz	w4, #31, .L49
.L48:
	ldrsh	w4, [x24]
.L53:
	ldrsh	w0, [x23]
	ldrsh	w1, [x21, 4798]
	sub	w0, w4, w0
	cmp	w0, w1
	csetm	w0, lt
.L41:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L58:
	mov	w9, 0
	cmp	w5, w9
	bge	.L52
.L62:
	strh	w4, [x24]
	b	.L53
.L57:
	mov	w2, 0
	cmp	w12, w2
	bge	.L46
.L61:
	strh	w10, [x23]
	b	.L42
.L56:
	mov	w0, -1
	b	.L41
	.size	DM_GetRoSubCoordX, .-DM_GetRoSubCoordX
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DM_CoordXY2Pix
	.type	DM_CoordXY2Pix, %function
DM_CoordXY2Pix:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x19, x1
	mov	x26, x0
	mov	x0, x30
	ldrsh	w27, [x29, 96]
	sxth	w25, w2
	sxth	w23, w3
	sxth	w24, w4
	sxth	w21, w5
	sxth	w22, w6
	sxth	w20, w7
	bl	_mcount
	ldrh	w0, [x19, 5104]
	lsl	x1, x0, 3
	mov	x2, x0
	add	x1, x1, x0, lsl 1
	add	x1, x19, x1
	strh	w27, [x1, 4812]
	ldr	w1, [x26, 8]
	cmp	w1, wzr
	ble	.L64
	uxth	w25, w1
	lsl	x1, x0, 3
	add	x1, x1, x0, lsl 1
	add	x1, x19, x1
	strh	w25, [x1, 4804]
	ldr	w1, [x26, 12]
	cmp	w1, wzr
	ble	.L66
.L73:
	uxth	w24, w1
	lsl	x1, x0, 3
	add	x1, x1, x0, lsl 1
	add	x1, x19, x1
	strh	w24, [x1, 4806]
	ldr	w1, [x26, 8]
	cmp	w1, wzr
	ble	.L68
.L74:
	uxth	w22, w1
	lsl	x1, x0, 3
	add	x1, x1, x0, lsl 1
	add	x1, x19, x1
	strh	w22, [x1, 4808]
	ldr	w1, [x26, 12]
	cmp	w1, wzr
	ble	.L70
.L75:
	uxth	w1, w1
.L71:
	lsl	x3, x0, 3
	cmp	w2, 28
	add	x0, x3, x0, lsl 1
	add	x0, x19, x0
	strh	w1, [x0, 4810]
	bhi	.L63
	add	w2, w2, 1
	strh	w2, [x19, 5104]
.L63:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L64:
	mul	w25, w25, w22
	lsl	x1, x0, 3
	add	x1, x1, x0, lsl 1
	cmp	w25, wzr
	add	x1, x19, x1
	csel	w25, w25, wzr, le
	uxth	w25, w25
	strh	w25, [x1, 4804]
	ldr	w1, [x26, 12]
	cmp	w1, wzr
	bgt	.L73
.L66:
	mul	w24, w24, w20
	lsl	x1, x0, 3
	add	x1, x1, x0, lsl 1
	cmp	w24, wzr
	add	x1, x19, x1
	csel	w24, w24, wzr, le
	uxth	w24, w24
	strh	w24, [x1, 4806]
	ldr	w1, [x26, 8]
	cmp	w1, wzr
	bgt	.L74
.L68:
	madd	w22, w23, w22, w22
	lsl	x1, x0, 3
	add	x1, x1, x0, lsl 1
	cmp	w22, wzr
	add	x1, x19, x1
	csel	w22, w22, wzr, le
	uxth	w22, w22
	strh	w22, [x1, 4808]
	ldr	w1, [x26, 12]
	cmp	w1, wzr
	bgt	.L75
.L70:
	madd	w20, w21, w20, w20
	cmp	w20, wzr
	csel	w20, w20, wzr, le
	uxth	w1, w20
	b	.L71
	.size	DM_CoordXY2Pix, .-DM_CoordXY2Pix
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DM_CheckRoSub
	.type	DM_CheckRoSub, %function
DM_CheckRoSub:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrh	w5, [x19, 5104]
	cbz	w5, .L80
	mov	x0, 0
	mov	w1, 0
	mov	w3, 0
	.p2align 2
.L78:
	lsl	x2, x0, 3
	add	w1, w1, 1
	add	x0, x2, x0, lsl 1
	add	x4, x19, x0
	sxth	w1, w1
	cmp	w1, w5
	sxtw	x0, w1
	ldrh	w2, [x4, 4810]
	ldrh	w4, [x4, 4806]
	sub	w2, w2, w4
	sxtw	x2, w2
	eor	x4, x2, x2, asr 63
	sub	x4, x4, x2, asr 63
	add	w3, w3, w4
	uxth	w3, w3
	blt	.L78
.L77:
	ldrsh	w0, [x19, 4800]
	cmp	w0, w3
	bge	.L76
	add	x0, x19, 4096
	mov	x2, 300
	mov	w1, 0
	add	x0, x0, 708
	bl	pq_alg_memset
	strh	wzr, [x19, 5104]
.L76:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L80:
	mov	w3, 0
	b	.L77
	.size	DM_CheckRoSub, .-DM_CheckRoSub
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DM_DetRoSub
	.type	DM_DetRoSub, %function
DM_DetRoSub:
	sub	sp, sp, #128
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	stp	x23, x24, [sp, 64]
	stp	x25, x26, [sp, 80]
	str	x27, [sp, 96]
	mov	x20, x1
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	ldrh	w24, [x20, 4770]
	ldrh	w3, [x20, 4772]
	add	x0, x20, 4096
	mov	x2, 300
	mov	w1, 0
	sub	w3, w3, #1
	add	x0, x0, 708
	strh	w3, [x29, 110]
	ubfiz	x25, x24, 1, 16
	strh	wzr, [x29, 106]
	strh	wzr, [x29, 108]
	bl	pq_alg_memset
	ldr	x23, .LC5
	mov	x2, x25
	mov	w1, 0
	strh	wzr, [x20, 5104]
	add	x22, x23, 3328
	mov	x0, x22
	bl	pq_alg_memset
	ldr	x19, .LC6
	mov	x2, x25
	mov	w1, 0
	add	x26, x19, 2816
	mov	x0, x26
	bl	pq_alg_memset
	mov	x1, x22
	mov	x0, x20
	add	x2, x29, 106
	bl	DM_DetRoSub_1st
	ldrsh	w1, [x20, 4790]
	ldrsh	w0, [x29, 106]
	cmp	w1, w0
	bge	.L137
	add	sp, x29, 0
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L137:
	mov	x1, x22
	mov	x0, x26
	mov	x2, x25
	bl	pq_alg_memcpy
	mov	w1, 0
	mov	w0, 0
	sub	w6, w24, #1
	cbnz	w24, .L122
	b	.L104
	.p2align 3
.L139:
	add	w1, w1, 1
	ldrsh	w1, [x3, w1, sxtw 1]
	cbz	w1, .L92
	ldrsh	w3, [x20, 4792]
	sub	w2, w2, w1
.L135:
	sxtw	x2, w2
	eor	x1, x2, x2, asr 63
	sub	x1, x1, x2, asr 63
	cmp	w3, w1
	bge	.L86
.L92:
	add	x1, x23, 3328
	strh	wzr, [x1, x4, lsl 1]
.L86:
	add	w0, w0, 1
	sxth	w0, w0
	cmp	w0, w24
	mov	w1, w0
	bge	.L138
.L122:
	add	x3, x19, 2816
	sxtw	x4, w1
	ldrsh	w2, [x3, w1, sxtw 1]
	cbz	w2, .L86
	cbz	w0, .L139
	cmp	w6, w1
	beq	.L140
	sub	w5, w1, #1
	ldrsh	w5, [x3, w5, sxtw 1]
	cbnz	w5, .L91
	add	w7, w1, 1
	ldrsh	w3, [x3, w7, sxtw 1]
	cbz	w3, .L92
.L91:
	sub	w5, w2, w5
	ldrsh	w3, [x20, 4792]
	sxtw	x5, w5
	eor	x7, x5, x5, asr 63
	sub	x7, x7, x5, asr 63
	cmp	w3, w7
	bge	.L86
	add	w1, w1, 1
	add	x5, x19, 2816
	ldrsh	w1, [x5, w1, sxtw 1]
	sub	w2, w2, w1
	b	.L135
	.p2align 3
.L138:
	mov	w25, 1
	mov	w0, 0
	mov	w26, 0
	mov	w19, 0
	sub	w27, w24, #1
	.p2align 2
.L103:
	cbnz	w19, .L94
	add	x1, x23, 3328
	ldrsh	w0, [x1, w0, sxtw 1]
	cmp	w0, wzr
	csel	w26, w26, wzr, eq
.L95:
	add	w19, w19, 1
	add	w25, w25, 1
	sxth	w19, w19
	uxth	w25, w25
	cmp	w19, w24
	mov	w0, w19
	blt	.L103
.L104:
	mov	x0, x20
	bl	DM_CheckRoSub
	add	sp, x29, 0
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L94:
	cmp	w27, w0
	beq	.L141
	add	x2, x23, 3328
	ldrsh	w1, [x2, w0, sxtw 1]
	cbz	w1, .L95
	sub	w3, w0, #1
	add	w0, w0, 1
	ldrsh	w3, [x2, w3, sxtw 1]
	ldrsh	w2, [x2, w0, sxtw 1]
	sub	w0, w1, w3
	sub	w1, w1, w2
	sxtw	x0, w0
	sxtw	x1, w1
	eor	x3, x0, x0, asr 63
	sub	x3, x3, x0, asr 63
	ldrsh	w0, [x20, 4802]
	eor	x2, x1, x1, asr 63
	cmp	w0, w3
	sub	x2, x2, x1, asr 63
	csel	w26, w26, w19, gt
	cmp	w0, w2
	bgt	.L95
	sub	w22, w25, w26
	mov	w1, 0
	uxtb	w22, w22
	cbz	w22, .L101
	mov	w0, 0
	.p2align 2
.L102:
	sbfiz	x2, x0, 1, 32
	add	x3, x23, 3328
	add	x2, x2, x26, sxtw 1
	add	w0, w0, 1
	sxth	w0, w0
	ldrh	w2, [x3, x2]
	cmp	w0, w22
	add	w1, w1, w2
	sxth	w1, w1
	blt	.L102
.L101:
	add	w1, w1, w22, lsr 1
	add	x5, x29, 110
	add	x4, x29, 108
	mov	w3, w19
	sdiv	w22, w1, w22
	mov	w2, w26
	mov	x0, x20
	sxth	w22, w22
	mov	w1, w22
	bl	DM_GetRoSubCoordX
	cbnz	w0, .L95
	ldrh	w3, [x29, 110]
	mov	w7, 16
	ldrh	w2, [x29, 108]
	mov	w6, 64
	strh	w22, [sp]
	mov	w5, w19
	mov	w4, w26
	mov	x1, x20
	mov	x0, x21
	bl	DM_CoordXY2Pix
	b	.L95
	.p2align 3
.L141:
	add	x0, x23, 3328
	ldrsh	w0, [x0, w27, sxtw 1]
	cbz	w0, .L95
	sub	w22, w25, w26
	mov	w1, 0
	uxtb	w22, w22
	cbz	w22, .L101
	mov	w0, 0
	.p2align 2
.L98:
	sbfiz	x2, x0, 1, 32
	add	x3, x23, 3328
	add	x2, x2, x26, sxtw 1
	add	w0, w0, 1
	sxth	w0, w0
	ldrh	w2, [x3, x2]
	cmp	w0, w22
	add	w1, w1, w2
	sxth	w1, w1
	blt	.L98
	b	.L101
	.p2align 3
.L140:
	sub	w1, w6, #1
	ldrsh	w1, [x3, w1, sxtw 1]
	cbz	w1, .L92
	sub	w1, w2, w1
	ldrsh	w3, [x20, 4792]
	sxtw	x1, w1
	eor	x2, x1, x1, asr 63
	sub	x2, x2, x1, asr 63
	cmp	w3, w2
	bge	.L86
	b	.L92
	.size	DM_DetRoSub, .-DM_DetRoSub
	.align	3
.LC5:
	.xword	.LANCHOR3
	.align	3
.LC6:
	.xword	.LANCHOR4
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DBM_WriteDMRoSubInfo
	.type	DBM_WriteDMRoSubInfo, %function
DBM_WriteDMRoSubInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldrh	w0, [x20, 5104]
	strh	w0, [x19, 402]
	cbz	w0, .L147
	sub	w3, w0, #1
	mov	w4, 10
	mov	x0, 4822
	add	x2, x20, 4096
	add	x2, x2, 716
	add	x1, x19, 110
	umaddl	x0, w3, w4, x0
	add	x0, x20, x0
	.p2align 2
.L144:
	ldrh	w3, [x2]
	add	x2, x2, 10
	strh	w3, [x1]
	add	x1, x1, 10
	cmp	x2, x0
	ldrh	w3, [x2, -14]
	strh	w3, [x1, -14]
	ldrh	w3, [x2, -18]
	strh	w3, [x1, -18]
	ldrh	w3, [x2, -12]
	strh	w3, [x1, -12]
	ldrh	w3, [x2, -16]
	strh	w3, [x1, -16]
	bne	.L144
.L147:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	DBM_WriteDMRoSubInfo, .-DBM_WriteDMRoSubInfo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DM_UpdateCfg
	.type	DM_UpdateCfg, %function
DM_UpdateCfg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	mov	x20, x1
	mov	x19, x2
	mov	x21, x3
	bl	_mcount
	cmp	x22, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L172
	cmp	x19, xzr
	ccmp	x21, xzr, 4, ne
	beq	.L172
	mov	x1, x19
	mov	x0, x20
	add	x23, x21, 168
	bl	DM_InitOutputReg
	ldr	x0, .LC11
	mov	x2, 1440
	ldr	x3, .LC12
	ldr	x5, .LC13
	ldrsb	w0, [x0]
	ldr	w6, [x3]
	sub	w3, w0, #4
	ldr	x4, .LC14
	ldr	x1, .LC15
	uxtb	w3, w3
	cmp	w3, 61
	csel	w3, w0, wzr, cc
	add	x0, x21, 360
	stp	w6, w3, [x21]
	ldrh	w5, [x5]
	ldrh	w4, [x4]
	strh	w5, [x21, 4772]
	strh	w4, [x21, 4770]
	bl	pq_alg_memcpy
	ldr	x1, .LC16
	mov	x2, 1440
	add	x0, x21, 1800
	bl	pq_alg_memcpy
	ldr	x1, .LC17
	add	x0, x21, 3240
	mov	x2, 1440
	bl	pq_alg_memcpy
	ldr	w0, [x22, 8]
	cmp	w0, 720
	ble	.L184
.L152:
	ldrb	w0, [x21, 152]
.L162:
	uxtw	x1, w0
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x0, x0, 4
	add	x20, x23, x0
	ldrh	w0, [x23, x0]
	strh	w0, [x19]
	ldrh	w0, [x20, 2]
	strh	w0, [x19, 2]
	ldrh	w0, [x20, 4]
	strh	w0, [x19, 4]
	ldrh	w0, [x20, 6]
	strh	w0, [x19, 6]
	ldrb	w0, [x20, 8]
	strb	w0, [x19, 8]
	ldrb	w0, [x20, 9]
	strb	w0, [x19, 9]
	ldrsh	w4, [x20, 10]
	strh	w4, [x19, 10]
	ldrsh	w2, [x20, 12]
	strh	w2, [x19, 12]
	ldrsh	w3, [x20, 14]
	strh	w3, [x19, 14]
	ldrsh	w1, [x20, 16]
	strh	w1, [x19, 16]
	ldrb	w0, [x20, 20]
	strb	w0, [x19, 18]
	cmp	w0, 1
	beq	.L185
.L166:
	ldrb	w0, [x20, 19]
	strb	w0, [x19, 19]
	ldrb	w0, [x20, 18]
	strb	w0, [x19, 20]
	ldr	x1, [x20, 40]
	cbz	x1, .L167
	mov	x2, 62
	add	x0, x19, 22
	bl	pq_alg_memcpy
.L167:
	ldrh	w0, [x20, 22]
	mov	x1, x21
	strh	w0, [x19, 84]
	mov	x0, x22
	ldr	x3, .LC19
	ldrh	w2, [x20, 24]
	strh	w2, [x19, 86]
	ldr	w3, [x3, 208]
	ldrb	w2, [x20, 26]
	strb	w2, [x19, 88]
	ldrb	w2, [x20, 27]
	strb	w2, [x19, 89]
	ldrb	w2, [x20, 28]
	strb	w2, [x19, 90]
	ldrh	w2, [x20, 30]
	strh	w2, [x19, 92]
	ldrh	w2, [x20, 32]
	strh	w2, [x19, 94]
	ldrh	w2, [x20, 34]
	strh	w2, [x19, 96]
	ldrh	w2, [x20, 36]
	strh	w2, [x19, 98]
	strb	w3, [x19, 100]
	bl	DM_DetRoSub
	ldrh	w0, [x21, 5104]
	strh	w0, [x19, 402]
	cbz	w0, .L170
	sub	w4, w0, #1
	mov	w3, 10
	mov	x2, 4822
	add	x1, x21, 4096
	add	x1, x1, 716
	add	x0, x19, 110
	umaddl	x2, w4, w3, x2
	add	x3, x21, x2
	.p2align 2
.L169:
	ldrh	w2, [x1]
	add	x1, x1, 10
	strh	w2, [x0]
	add	x0, x0, 10
	cmp	x3, x1
	ldrh	w2, [x1, -14]
	strh	w2, [x0, -14]
	ldrh	w2, [x1, -18]
	strh	w2, [x0, -18]
	ldrh	w2, [x1, -12]
	strh	w2, [x0, -12]
	ldrh	w2, [x1, -16]
	strh	w2, [x0, -16]
	bne	.L169
.L170:
	mov	w0, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L184:
	ldrb	w1, [x21, 153]
	cmp	w1, 1
	bne	.L152
	ldr	x3, .LC18
	cmp	w0, wzr
	mov	w2, 15
	csel	w2, wzr, w2, le
	ldr	w4, [x3, 2304]
	cmp	w4, 31
	bhi	.L174
	uxtw	x0, w4
	add	w1, w4, 1
	lsl	x6, x0, 2
.L154:
	add	x0, x21, x0, lsl 2
	add	x5, x21, 8
	str	w1, [x3, 2304]
	str	w2, [x0, 8]
	add	x0, x5, x6
	str	x0, [x21, 144]
	ldr	w4, [x21, 136]
	cmp	w4, wzr
	beq	.L155
	mov	w2, 0
	mov	w1, 0
	add	x6, x21, 132
	ble	.L157
	.p2align 2
.L179:
	ldr	w3, [x0], -4
	add	w2, w2, 1
	cmp	x0, x5
	add	w1, w1, w3
	csel	x0, x0, x6, cs
	cmp	w4, w2
	bne	.L179
.L157:
	sdiv	w0, w1, w4
.L158:
	ldrh	w1, [x21, 154]
	uxth	w0, w0
	cmp	w1, w0
	bls	.L161
	ldrb	w0, [x21, 162]
	b	.L162
	.p2align 3
.L172:
	mov	w0, -1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L185:
	cmp	w4, w3
	ccmp	w2, w1, 4, gt
	bgt	.L166
	strb	wzr, [x19, 18]
	b	.L166
.L161:
	ldrh	w1, [x21, 156]
	cmp	w1, w0
	bhi	.L186
	ldrh	w1, [x21, 158]
	cmp	w1, w0
	bls	.L164
	ldrb	w0, [x21, 164]
	b	.L162
.L155:
	ldr	w0, [x5, x6]
	b	.L158
.L174:
	mov	x6, 0
	mov	x0, 0
	b	.L154
.L186:
	ldrb	w0, [x21, 163]
	b	.L162
.L164:
	ldrh	w1, [x21, 160]
	cmp	w1, w0
	bls	.L165
	ldrb	w0, [x21, 165]
	b	.L162
.L165:
	ldrb	w0, [x21, 166]
	b	.L162
	.size	DM_UpdateCfg, .-DM_UpdateCfg
	.align	3
.LC11:
	.xword	g_s8DbDetUsingSizeHy
	.align	3
.LC12:
	.xword	g_u32DbDetUsingHyCounterBorder
	.align	3
.LC13:
	.xword	g_u16RgmvBlkNumW
	.align	3
.LC14:
	.xword	g_u16RgmvBlkNumH
	.align	3
.LC15:
	.xword	g_as16RGMVX
	.align	3
.LC16:
	.xword	g_as16RGMVY
	.align	3
.LC17:
	.xword	g_au16RGMVMag
	.align	3
.LC18:
	.xword	.LANCHOR5
	.align	3
.LC19:
	.xword	.LANCHOR0
	.global	g_s16ColTemp
	.global	g_s16ColStaMvX
	.global	g_as16RgmvTemp
	.global	g_as16MedianTemp
	.global	g_DMParaSDSplit
	.global	g_astDMParaSD
	.global	g_stMMFLimTransBand
	.global	g_stLimitFlagLutSD
	.global	g_u32DmStr
	.data
	.align	3
.LANCHOR0 = . + 0
	.type	g_stLimitFlagLutSD, %object
	.size	g_stLimitFlagLutSD, 14
g_stLimitFlagLutSD:
	.hword	2
	.hword	3
	.hword	13
	.hword	15
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.zero	1
	.zero	2
	.type	g_astDMParaSD, %object
	.size	g_astDMParaSD, 192
g_astDMParaSD:
	.hword	15
	.hword	9
	.hword	35
	.hword	140
	.byte	4
	.byte	5
	.hword	50
	.hword	200
	.hword	1
	.hword	4
	.byte	1
	.byte	0
	.byte	1
	.zero	1
	.hword	10
	.hword	40
	.byte	6
	.byte	6
	.byte	6
	.zero	1
	.hword	30
	.hword	120
	.hword	0
	.hword	0
	.zero	2
	.xword	g_stMMFLimTransBand+62
	.hword	20
	.hword	18
	.hword	40
	.hword	160
	.byte	4
	.byte	4
	.hword	50
	.hword	200
	.hword	0
	.hword	0
	.byte	1
	.byte	0
	.byte	1
	.zero	1
	.hword	18
	.hword	72
	.byte	7
	.byte	8
	.byte	7
	.zero	1
	.hword	30
	.hword	120
	.hword	0
	.hword	0
	.zero	2
	.xword	g_stMMFLimTransBand+62
	.hword	20
	.hword	18
	.hword	45
	.hword	180
	.byte	4
	.byte	4
	.hword	60
	.hword	240
	.hword	-1
	.hword	-4
	.byte	1
	.byte	1
	.byte	1
	.zero	1
	.hword	20
	.hword	80
	.byte	7
	.byte	8
	.byte	7
	.zero	1
	.hword	30
	.hword	120
	.hword	0
	.hword	0
	.zero	2
	.xword	g_stMMFLimTransBand+62
	.hword	25
	.hword	18
	.hword	50
	.hword	200
	.byte	4
	.byte	4
	.hword	60
	.hword	240
	.hword	0
	.hword	0
	.byte	1
	.byte	1
	.byte	0
	.zero	1
	.hword	25
	.hword	100
	.byte	8
	.byte	8
	.byte	8
	.zero	1
	.hword	30
	.hword	120
	.hword	0
	.hword	0
	.zero	2
	.xword	g_stMMFLimTransBand+62
	.type	g_u32DmStr, %object
	.size	g_u32DmStr, 4
g_u32DmStr:
	.word	8
	.zero	4
	.type	g_DMParaSDSplit, %object
	.size	g_DMParaSDSplit, 192
g_DMParaSDSplit:
	.hword	20
	.hword	18
	.hword	45
	.hword	180
	.byte	3
	.byte	3
	.hword	60
	.hword	240
	.hword	-1
	.hword	-4
	.byte	1
	.byte	1
	.byte	0
	.zero	1
	.hword	40
	.hword	160
	.byte	7
	.byte	8
	.byte	7
	.zero	1
	.hword	30
	.hword	120
	.hword	0
	.hword	0
	.zero	2
	.xword	g_stMMFLimTransBand+62
	.hword	20
	.hword	18
	.hword	45
	.hword	180
	.byte	3
	.byte	3
	.hword	60
	.hword	240
	.hword	-1
	.hword	-4
	.byte	1
	.byte	1
	.byte	0
	.zero	1
	.hword	40
	.hword	160
	.byte	7
	.byte	8
	.byte	7
	.zero	1
	.hword	30
	.hword	120
	.hword	0
	.hword	0
	.zero	2
	.xword	g_stMMFLimTransBand+62
	.hword	20
	.hword	18
	.hword	45
	.hword	180
	.byte	3
	.byte	3
	.hword	60
	.hword	240
	.hword	-1
	.hword	-4
	.byte	1
	.byte	1
	.byte	0
	.zero	1
	.hword	40
	.hword	160
	.byte	7
	.byte	8
	.byte	7
	.zero	1
	.hword	30
	.hword	120
	.hword	0
	.hword	0
	.zero	2
	.xword	g_stMMFLimTransBand+62
	.hword	20
	.hword	18
	.hword	45
	.hword	180
	.byte	3
	.byte	3
	.hword	60
	.hword	240
	.hword	-1
	.hword	-4
	.byte	1
	.byte	1
	.byte	0
	.zero	1
	.hword	40
	.hword	160
	.byte	7
	.byte	8
	.byte	7
	.zero	1
	.hword	30
	.hword	120
	.hword	0
	.hword	0
	.zero	2
	.xword	g_stMMFLimTransBand+62
	.type	g_stMMFLimTransBand, %object
	.size	g_stMMFLimTransBand, 124
g_stMMFLimTransBand:
	.hword	0
	.hword	1
	.hword	2
	.hword	3
	.hword	4
	.hword	5
	.hword	6
	.hword	7
	.hword	8
	.hword	9
	.hword	10
	.hword	11
	.hword	12
	.hword	13
	.hword	14
	.hword	15
	.hword	16
	.hword	17
	.hword	18
	.hword	19
	.hword	20
	.hword	21
	.hword	22
	.hword	23
	.hword	24
	.hword	25
	.hword	26
	.hword	27
	.hword	28
	.hword	29
	.hword	30
	.hword	0
	.hword	2
	.hword	4
	.hword	6
	.hword	8
	.hword	10
	.hword	12
	.hword	14
	.hword	16
	.hword	18
	.hword	20
	.hword	22
	.hword	24
	.hword	26
	.hword	28
	.hword	30
	.hword	32
	.hword	34
	.hword	36
	.hword	38
	.hword	40
	.hword	42
	.hword	44
	.hword	46
	.hword	48
	.hword	50
	.hword	52
	.hword	54
	.hword	56
	.hword	58
	.hword	60
	.bss
	.align	3
.LANCHOR1 = . + 0
.LANCHOR2 = . + 4352
.LANCHOR3 = . + 13056
.LANCHOR4 = . + 21760
.LANCHOR5 = . + 30464
	.type	g_as16MedianTemp, %object
	.size	g_as16MedianTemp, 8192
g_as16MedianTemp:
	.zero	8192
	.type	g_as16RgmvTemp, %object
	.size	g_as16RgmvTemp, 8192
g_as16RgmvTemp:
	.zero	8192
	.type	g_s16ColStaMvX, %object
	.size	g_s16ColStaMvX, 8192
g_s16ColStaMvX:
	.zero	8192
	.type	g_s16ColTemp, %object
	.size	g_s16ColTemp, 8192
g_s16ColTemp:
	.zero	8192
	.type	i.1874, %object
	.size	i.1874, 4
i.1874:
	.zero	4
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
