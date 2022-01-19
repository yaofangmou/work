#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal_vc1.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	VC1HAL_CfgSliceMsg
	.type	VC1HAL_CfgSliceMsg, %function
VC1HAL_CfgSliceMsg:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x1
	mov	x27, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 44]
	str	w0, [x29, 108]
	bl	MEM_Phy2Vir
	mov	x28, x0
	cbz	x0, .L76
	ldrb	w0, [x27, 4]
	cmp	w0, 2
	beq	.L77
	ldrb	w8, [x27, 74]
	add	x26, x27, 192
	cbz	w8, .L1
	ldr	x24, .LC5
	mov	w10, 0
	mov	w3, 0
	mov	w9, 0
	mov	w11, 1
	mov	w12, 256
	mov	x17, 4
	mov	x16, 8
	mov	x15, 12
	mov	x14, 16
	mov	x13, 252
	.p2align 2
.L57:
	cbnz	w9, .L33
	cmp	w8, 1
	ldr	w10, [x26, 32]
	beq	.L74
	ble	.L35
	ldr	w0, [x27, 280]
	cmp	w10, w0
	blt	.L35
	add	x0, x27, 336
	mov	w3, 1
	b	.L38
	.p2align 3
.L39:
	ldr	w1, [x0], 56
	cmp	w10, w1
	blt	.L37
.L38:
	add	w3, w3, 1
	cmp	w3, w8
	bne	.L39
.L74:
	mov	w20, 0
	mov	w19, 0
.L34:
	sxtw	x21, w9
	lsl	w0, w9, 6
	lsl	x8, x21, 3
	ldr	x2, [x24, 856]
	sub	x8, x8, x21
	sxtw	x0, w0
	add	x22, x28, x0
	ldr	w1, [x24, 864]
	add	x8, x27, x8, lsl 3
	sub	x22, x22, x2
	ldr	w18, [x27, 156]
	cmp	x22, x1
	ldr	w22, [x8, 212]
	sub	w18, w22, w18
	blt	.L45
	str	w11, [x24, 852]
.L46:
	add	x8, x0, 1
	add	x8, x28, x8
	sub	x8, x8, x2
	cmp	x8, x1
	blt	.L47
	str	w11, [x24, 852]
.L48:
	add	x8, x0, 2
	add	x8, x28, x8
	sub	x8, x8, x2
	cmp	x8, x1
	blt	.L49
	str	w11, [x24, 852]
.L50:
	add	x8, x0, 3
	add	x8, x28, x8
	sub	x8, x8, x2
	cmp	x8, x1
	blt	.L51
	str	w11, [x24, 852]
.L52:
	add	x8, x0, 4
	add	x8, x28, x8
	sub	x8, x8, x2
	cmp	x8, x1
	blt	.L53
	str	w11, [x24, 852]
.L54:
	add	x0, x0, 63
	add	x0, x28, x0
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L55
	str	w11, [x24, 852]
.L56:
	ldrb	w8, [x27, 74]
	add	w9, w9, 1
	cmp	w8, w9
	bgt	.L57
.L1:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L55:
	smaddl	x0, w9, w12, x13
	str	w19, [x28, x0]
	b	.L56
	.p2align 3
.L53:
	smaddl	x1, w9, w12, x14
	add	w20, w20, w10, lsl 16
	str	w20, [x28, x1]
	ldr	w1, [x24, 864]
	ldr	x2, [x24, 856]
	b	.L54
	.p2align 3
.L51:
	smaddl	x1, w9, w12, x15
	str	wzr, [x28, x1]
	ldr	w1, [x24, 864]
	ldr	x2, [x24, 856]
	b	.L52
	.p2align 3
.L49:
	smaddl	x1, w9, w12, x16
	str	wzr, [x28, x1]
	ldr	w1, [x24, 864]
	ldr	x2, [x24, 856]
	b	.L50
	.p2align 3
.L47:
	smaddl	x1, w9, w12, x17
	and	w18, w18, -16
	str	w18, [x28, x1]
	ldr	w1, [x24, 864]
	ldr	x2, [x24, 856]
	b	.L48
	.p2align 3
.L45:
	ldp	w1, w2, [x8, 216]
	lsl	x21, x21, 8
	add	w1, w1, w18, lsl 3
	add	w1, w2, w1, lsl 25
	str	w1, [x28, x21]
	ldr	w1, [x24, 864]
	ldr	x2, [x24, 856]
	b	.L46
	.p2align 3
.L33:
	sxtw	x2, w3
	add	w1, w3, 1
	lsl	x0, x2, 3
	cmp	w1, w8
	sub	x0, x0, x2
	add	x0, x26, x0, lsl 3
	ldr	w18, [x0, 32]
	bge	.L40
	ldr	w0, [x0, 88]
	cmp	w18, w0
	bge	.L42
	b	.L40
	.p2align 3
.L43:
	sub	x0, x0, x2
	add	x0, x26, x0, lsl 3
	ldr	w0, [x0, 32]
	cmp	w18, w0
	blt	.L40
.L42:
	add	w1, w1, 1
	cmp	w1, w8
	sxtw	x2, w1
	lsl	x0, x2, 3
	blt	.L43
.L40:
	cmp	w8, w1
	beq	.L66
	ldr	w0, [x29, 108]
	mov	w3, w1
	add	w19, w0, w1, lsl 8
.L44:
	add	w20, w10, 1
	mov	w10, w18
	b	.L34
.L35:
	cmp	w8, 1
	beq	.L65
	mov	w3, 1
	.p2align 2
.L37:
	ldr	w0, [x29, 108]
	mov	w20, 0
	add	w19, w0, w3, lsl 8
	b	.L34
	.p2align 3
.L66:
	mov	w19, 0
	b	.L44
.L77:
	ldrb	w9, [x27, 74]
	add	x26, x27, 192
	cbz	w9, .L1
	ldr	x24, .LC5
	mov	w22, 0
	mov	w25, 0
	mov	w20, 0
	.p2align 2
.L31:
	sxtw	x12, w20
	ldr	w21, [x27, 156]
	lsl	x0, x12, 3
	sub	x0, x0, x12
	add	x0, x27, x0, lsl 3
	ldp	w10, w2, [x0, 212]
	ldr	x1, [x0, 200]
	sub	w10, w10, w21
	ldr	w13, [x0, 220]
	ubfiz	w3, w10, 3, 4
	and	w10, w10, -16
	add	w3, w3, w2
	cbz	x1, .L59
	ldp	w1, w23, [x0, 228]
	sub	w21, w1, w21
	ldr	w1, [x0, 236]
	add	w0, w23, w21, lsl 3
	add	w23, w1, w0, lsl 25
	and	w0, w21, -16
	str	w0, [x29, 104]
.L6:
	cbnz	w20, .L7
	cmp	w9, 1
	ldr	w22, [x26, 32]
	beq	.L73
	ble	.L9
	ldr	w0, [x27, 280]
	cmp	w22, w0
	blt	.L72
	add	x0, x27, 336
	mov	w25, 1
	b	.L12
	.p2align 3
.L13:
	ldr	w1, [x0], 56
	cmp	w22, w1
	blt	.L78
.L12:
	add	w25, w25, 1
	cmp	w25, w9
	bne	.L13
.L73:
	mov	w21, 0
	str	wzr, [x29, 100]
.L8:
	lsl	w19, w20, 6
	ldr	x1, [x24, 856]
	add	w3, w13, w3, lsl 25
	sxtw	x19, w19
	add	x0, x28, x19
	sub	x0, x0, x1
	ldr	w1, [x24, 864]
	cmp	x0, x1
	blt	.L19
	mov	w0, 1
	str	w0, [x24, 852]
.L20:
	ldr	x2, .LC7
	mov	w1, 106
	mov	w0, 5
	str	w10, [x29, 96]
	bl	dprint_normal
	ldr	x1, [x24, 856]
	add	x0, x19, 1
	add	x0, x28, x0
	ldr	w10, [x29, 96]
	sub	x0, x0, x1
	ldr	w1, [x24, 864]
	cmp	x0, x1
	blt	.L21
	mov	w0, 1
	str	w0, [x24, 852]
.L22:
	ldr	x2, .LC9
	mov	w1, 110
	mov	w3, w10
	mov	w0, 5
	bl	dprint_normal
	ldr	x1, [x24, 856]
	add	x0, x19, 2
	add	x0, x28, x0
	sub	x0, x0, x1
	ldr	w1, [x24, 864]
	cmp	x0, x1
	blt	.L23
	mov	w0, 1
	str	w0, [x24, 852]
.L24:
	ldr	x2, .LC11
	mov	w1, 114
	mov	w3, w23
	mov	w0, 5
	bl	dprint_normal
	ldr	x1, [x24, 856]
	add	x0, x19, 3
	add	x0, x28, x0
	sub	x0, x0, x1
	ldr	w1, [x24, 864]
	cmp	x0, x1
	blt	.L25
	mov	w0, 1
	str	w0, [x24, 852]
.L26:
	ldr	w3, [x29, 104]
	mov	w1, 118
	ldr	x2, .LC13
	mov	w0, 5
	bl	dprint_normal
	ldr	w1, [x29, 100]
	add	x0, x19, 4
	add	x0, x28, x0
	add	w3, w1, w22, lsl 16
	ldr	x1, [x24, 856]
	sub	x0, x0, x1
	ldr	w1, [x24, 864]
	cmp	x0, x1
	blt	.L27
	mov	w0, 1
	str	w0, [x24, 852]
.L28:
	ldr	x2, .LC15
	mov	w1, 122
	mov	w0, 5
	add	x19, x19, 63
	add	x19, x28, x19
	bl	dprint_normal
	ldr	x0, [x24, 856]
	ldr	w1, [x24, 864]
	sub	x0, x19, x0
	cmp	x0, x1
	blt	.L29
	mov	w0, 1
	str	w0, [x24, 852]
.L30:
	ldr	x2, .LC17
	mov	w3, w21
	mov	w1, 126
	mov	w0, 5
	add	w20, w20, 1
	bl	dprint_normal
	ldrb	w9, [x27, 74]
	cmp	w9, w20
	bgt	.L31
	b	.L1
	.p2align 3
.L7:
	sxtw	x2, w25
	add	w1, w25, 1
	lsl	x0, x2, 3
	cmp	w1, w9
	sub	x0, x0, x2
	add	x0, x26, x0, lsl 3
	ldr	w11, [x0, 32]
	bge	.L14
	ldr	w0, [x0, 88]
	cmp	w11, w0
	bge	.L16
	b	.L14
	.p2align 3
.L17:
	sub	x0, x0, x2
	add	x0, x26, x0, lsl 3
	ldr	w0, [x0, 32]
	cmp	w11, w0
	blt	.L14
.L16:
	add	w1, w1, 1
	cmp	w1, w9
	sxtw	x2, w1
	lsl	x0, x2, 3
	blt	.L17
.L14:
	cmp	w9, w1
	beq	.L63
	ldr	w0, [x29, 108]
	mov	w25, w1
	add	w21, w0, w1, lsl 8
.L18:
	add	w0, w22, 1
	mov	w22, w11
	str	w0, [x29, 100]
	b	.L8
	.p2align 3
.L29:
	mov	x0, 252
	mov	w1, 256
	smaddl	x0, w20, w1, x0
	str	w21, [x28, x0]
	b	.L30
	.p2align 3
.L27:
	mov	x0, 16
	mov	w1, 256
	smaddl	x0, w20, w1, x0
	str	w3, [x28, x0]
	b	.L28
	.p2align 3
.L25:
	mov	w1, 256
	mov	x0, 12
	smaddl	x0, w20, w1, x0
	ldr	w1, [x29, 104]
	str	w1, [x28, x0]
	b	.L26
	.p2align 3
.L23:
	mov	x0, 8
	mov	w1, 256
	smaddl	x0, w20, w1, x0
	str	w23, [x28, x0]
	b	.L24
	.p2align 3
.L21:
	mov	x0, 4
	mov	w1, 256
	smaddl	x0, w20, w1, x0
	str	w10, [x28, x0]
	b	.L22
	.p2align 3
.L19:
	lsl	x12, x12, 8
	str	w3, [x28, x12]
	b	.L20
.L78:
	lsl	w0, w25, 8
.L58:
	ldr	w1, [x29, 108]
	str	wzr, [x29, 100]
	add	w21, w1, w0
	b	.L8
.L59:
	mov	w23, 0
	str	wzr, [x29, 104]
	b	.L6
.L63:
	mov	w21, 0
	b	.L18
.L72:
	mov	w0, 256
	mov	w25, 1
	b	.L58
.L76:
	ldr	x3, .LC2
	mov	w1, 233
	ldr	x2, .LC4
	mov	w0, 0
	bl	dprint_normal
	b	.L1
.L9:
	bne	.L72
	mov	w25, w9
	b	.L73
.L65:
	mov	w3, w8
	b	.L74
	.size	VC1HAL_CfgSliceMsg, .-VC1HAL_CfgSliceMsg
	.align	3
.LC2:
	.xword	.LANCHOR0
	.align	3
.LC4:
	.xword	.LC3
	.align	3
.LC5:
	.xword	g_HwMem
	.align	3
.LC7:
	.xword	.LC6
	.align	3
.LC9:
	.xword	.LC8
	.align	3
.LC11:
	.xword	.LC10
	.align	3
.LC13:
	.xword	.LC12
	.align	3
.LC15:
	.xword	.LC14
	.align	3
.LC17:
	.xword	.LC16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1HAL_CfgDnMsg
	.type	VC1HAL_CfgDnMsg, %function
VC1HAL_CfgDnMsg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x22, 40]
	bl	MEM_Phy2Vir
	mov	x21, x0
	cbz	x0, .L157
	ldr	x19, .LC20
	mov	w0, 0
	ldrb	w1, [x20, 4]
	mov	w2, 0
	ldrb	w5, [x20, 5]
	bfi	w0, w1, 4, 2
	ldr	x1, [x19, 856]
	ldrb	w4, [x20, 3]
	bfi	w2, w5, 6, 2
	ldr	w3, [x19, 864]
	sub	x1, x21, x1
	str	wzr, [x29, 60]
	bfi	w0, w4, 0, 2
	cmp	x1, x3
	strb	w2, [x29, 61]
	strb	w0, [x29, 60]
	bge	.L158
	ldr	w3, [x29, 60]
	str	w3, [x21]
.L83:
	ldr	x2, .LC21
	mov	w1, 267
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 60]
	ldr	x4, [x19, 856]
	add	x0, x21, 1
	ldr	w1, [x19, 864]
	ldrh	w3, [x20, 84]
	sub	x0, x0, x4
	ldrh	w2, [x20, 82]
	cmp	x0, x1
	strb	w3, [x29, 62]
	strb	w2, [x29, 60]
	blt	.L84
	ldr	w3, [x29, 60]
	mov	w0, 1
	str	w0, [x19, 852]
.L85:
	ldr	x2, .LC22
	mov	w1, 273
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 60]
	ldrb	w1, [x20, 8]
	mov	w0, 0
	ldrb	w2, [x20, 6]
	bfi	w0, w1, 2, 1
	ldrb	w1, [x20, 9]
	bfi	w0, w2, 0, 1
	ldrb	w5, [x20, 7]
	ldrb	w2, [x20, 10]
	bfi	w0, w1, 3, 1
	bfi	w0, w5, 1, 1
	ldr	x4, [x19, 856]
	bfi	w0, w2, 4, 2
	ldrb	w3, [x20, 11]
	add	x1, x21, 2
	ldr	w2, [x19, 864]
	sub	x1, x1, x4
	bfi	w0, w3, 6, 2
	cmp	x1, x2
	strb	w0, [x29, 60]
	blt	.L86
	ldr	w3, [x29, 60]
	mov	w0, 1
	str	w0, [x19, 852]
.L87:
	ldr	x2, .LC23
	mov	w1, 283
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 60]
	ldrb	w2, [x20, 15]
	mov	w0, 0
	ldrb	w1, [x20, 13]
	bfi	w0, w2, 4, 2
	ldrb	w2, [x20, 14]
	bfi	w0, w1, 1, 1
	ldr	x4, [x19, 856]
	bfi	w0, w2, 2, 1
	ldrb	w3, [x20, 12]
	add	x1, x21, 3
	ldr	w2, [x19, 864]
	sub	x1, x1, x4
	bfi	w0, w3, 0, 1
	cmp	x1, x2
	strb	w0, [x29, 60]
	blt	.L88
	ldr	w3, [x29, 60]
	mov	w0, 1
	str	w0, [x19, 852]
.L89:
	ldr	x2, .LC24
	mov	w1, 291
	mov	w0, 5
	bl	dprint_normal
	ldrb	w1, [x20, 18]
	mov	w2, 0
	ldr	x3, [x19, 856]
	add	x0, x21, 4
	ldrb	w6, [x20, 19]
	bfi	w2, w1, 0, 5
	mov	w1, 0
	sub	x0, x0, x3
	bfi	w1, w6, 0, 1
	ldrb	w5, [x20, 17]
	ldrb	w4, [x20, 16]
	ldr	w3, [x19, 864]
	strb	w2, [x29, 62]
	mov	w2, 0
	strb	w1, [x29, 63]
	mov	w1, 0
	bfi	w2, w5, 0, 5
	bfi	w1, w4, 0, 5
	strb	w2, [x29, 61]
	cmp	x0, x3
	strb	w1, [x29, 60]
	blt	.L90
	ldr	w3, [x29, 60]
	mov	w0, 1
	str	w0, [x19, 852]
.L91:
	ldr	x2, .LC25
	mov	w1, 299
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 60]
	ldrb	w2, [x20, 24]
	mov	w1, 0
	ldrb	w3, [x20, 20]
	mov	w0, 0
	bfi	w1, w2, 4, 1
	ldrb	w2, [x20, 22]
	bfi	w0, w3, 0, 1
	ldrb	w3, [x20, 23]
	bfi	w0, w2, 2, 2
	ldrb	w2, [x20, 25]
	bfi	w1, w3, 0, 2
	ldr	x4, [x19, 856]
	bfi	w1, w2, 6, 1
	add	x2, x21, 5
	sub	x2, x2, x4
	ldrb	w6, [x20, 26]
	ldrb	w5, [x20, 21]
	mov	w3, 0
	ldr	w4, [x19, 864]
	bfi	w3, w6, 0, 4
	bfi	w0, w5, 1, 1
	strb	w1, [x29, 61]
	cmp	x2, x4
	strb	w3, [x29, 62]
	strb	w0, [x29, 60]
	blt	.L92
	ldr	w3, [x29, 60]
	mov	w0, 1
	str	w0, [x19, 852]
.L93:
	ldr	x2, .LC27
	mov	w1, 310
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 60]
	ldrb	w1, [x20, 27]
	mov	w0, 0
	ldr	x4, [x19, 856]
	bfi	w0, w1, 0, 3
	ldrb	w3, [x20, 28]
	add	x1, x21, 6
	ldr	w2, [x19, 864]
	sub	x1, x1, x4
	bfi	w0, w3, 4, 2
	cmp	x1, x2
	strb	w0, [x29, 60]
	blt	.L94
	ldr	w3, [x29, 60]
	mov	w0, 1
	str	w0, [x19, 852]
.L95:
	ldr	x2, .LC29
	mov	w1, 316
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 60]
	ldrb	w1, [x20, 30]
	mov	w0, 0
	ldrb	w3, [x20, 34]
	ldrb	w2, [x20, 29]
	bfi	w0, w1, 1, 1
	mov	w1, 0
	ldr	x4, [x19, 856]
	bfi	w1, w3, 6, 1
	bfi	w0, w2, 0, 1
	ldrb	w3, [x20, 33]
	ldrb	w2, [x20, 31]
	bfi	w1, w3, 4, 2
	strb	w1, [x29, 61]
	bfi	w0, w2, 2, 2
	strb	w0, [x29, 60]
	ldrb	w3, [x20, 32]
	add	x0, x21, 7
	ldr	w2, [x19, 864]
	sub	x0, x0, x4
	ldrh	w1, [x29, 60]
	cmp	x0, x2
	bfi	w1, w3, 4, 5
	strh	w1, [x29, 60]
	blt	.L96
	ldr	w3, [x29, 60]
	mov	w0, 1
	str	w0, [x19, 852]
.L97:
	ldr	x2, .LC31
	mov	w1, 326
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 60]
	ldrb	w1, [x20, 35]
	mov	w0, 0
	ldrb	w3, [x20, 36]
	bfi	w0, w1, 0, 1
	ldrb	w1, [x20, 37]
	bfi	w0, w3, 1, 1
	ldr	x3, [x19, 856]
	ldrb	w2, [x20, 38]
	bfi	w0, w1, 2, 1
	add	x1, x21, 8
	ldrb	w5, [x20, 39]
	sub	x1, x1, x3
	ldrb	w4, [x20, 40]
	ldr	w3, [x19, 864]
	bfi	w0, w2, 4, 2
	mov	w2, 0
	bfi	w0, w5, 6, 2
	bfi	w2, w4, 0, 2
	cmp	x1, x3
	strb	w0, [x29, 60]
	strb	w2, [x29, 61]
	blt	.L98
	ldr	w3, [x29, 60]
	mov	w0, 1
	str	w0, [x19, 852]
.L99:
	ldr	x2, .LC33
	mov	w1, 336
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 60]
	ldrb	w1, [x20, 46]
	mov	w0, 0
	ldrb	w3, [x20, 42]
	bfi	w0, w1, 5, 1
	ldrb	w2, [x20, 44]
	ldrb	w1, [x20, 41]
	bfi	w0, w3, 1, 1
	bfi	w0, w2, 3, 1
	ldr	x3, [x19, 856]
	ldrb	w5, [x20, 43]
	bfi	w0, w1, 0, 1
	ldrb	w4, [x20, 47]
	add	x1, x21, 9
	sub	x1, x1, x3
	ldrb	w2, [x20, 45]
	bfi	w0, w5, 2, 1
	ldr	w3, [x19, 864]
	bfi	w0, w4, 6, 1
	bfi	w0, w2, 4, 1
	cmp	x1, x3
	strb	w0, [x29, 60]
	blt	.L100
	ldr	w3, [x29, 60]
	mov	w0, 1
	str	w0, [x19, 852]
.L101:
	ldr	x2, .LC35
	mov	w1, 347
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 60]
	ldrb	w2, [x20, 50]
	mov	w3, 0
	ldrb	w1, [x20, 49]
	add	x0, x21, 10
	ldr	x6, [x19, 856]
	bfi	w3, w2, 0, 7
	ldrb	w5, [x20, 48]
	mov	w2, 0
	ldr	w4, [x19, 864]
	bfi	w2, w1, 0, 3
	sub	x0, x0, x6
	mov	w1, 0
	bfi	w1, w5, 0, 3
	cmp	x0, x4
	strb	w3, [x29, 62]
	strb	w2, [x29, 61]
	strb	w1, [x29, 60]
	blt	.L102
	ldr	w3, [x29, 60]
	mov	w0, 1
	str	w0, [x19, 852]
.L103:
	ldr	x2, .LC37
	mov	w1, 354
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 60]
	ldrb	w0, [x20, 51]
	mov	w1, 0
	ldrb	w4, [x20, 53]
	mov	w2, 0
	ldr	x3, [x19, 856]
	bfi	w1, w0, 0, 3
	add	x0, x21, 11
	bfi	w2, w4, 0, 2
	sub	x0, x0, x3
	ldrb	w5, [x20, 54]
	ldrb	w4, [x20, 52]
	ldr	w3, [x19, 864]
	bfi	w2, w5, 4, 1
	bfi	w1, w4, 4, 2
	strb	w2, [x29, 61]
	cmp	x0, x3
	strb	w1, [x29, 60]
	blt	.L104
	ldr	w3, [x29, 60]
	mov	w0, 1
	str	w0, [x19, 852]
.L105:
	ldr	x2, .LC39
	mov	w1, 362
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 12
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 88]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L106
	mov	w0, 1
	str	w0, [x19, 852]
.L107:
	ldr	x2, .LC41
	mov	w1, 367
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 13
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 92]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L108
	mov	w0, 1
	str	w0, [x19, 852]
.L109:
	ldr	x2, .LC43
	mov	w1, 372
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 14
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 96]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L110
	mov	w0, 1
	str	w0, [x19, 852]
.L111:
	ldr	x2, .LC45
	mov	w1, 377
	mov	w0, 5
	bl	dprint_normal
	ldrb	w3, [x20, 55]
	mov	w2, 0
	ldrb	w0, [x20, 57]
	mov	w1, 0
	bfi	w2, w3, 4, 1
	ldrb	w3, [x20, 58]
	bfi	w1, w0, 0, 1
	ldr	x6, [x19, 856]
	ldrb	w4, [x20, 56]
	bfi	w1, w3, 1, 3
	add	x0, x21, 15
	ldr	w3, [x19, 864]
	ldrh	w5, [x20, 76]
	sub	x0, x0, x6
	bfi	w2, w4, 5, 3
	strh	w5, [x29, 60]
	strb	w2, [x29, 62]
	cmp	x0, x3
	strb	w1, [x29, 63]
	blt	.L112
	ldr	w3, [x29, 60]
	mov	w0, 1
	str	w0, [x19, 852]
.L113:
	ldr	x2, .LC47
	mov	w1, 386
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 16
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 100]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L114
	mov	w0, 1
	str	w0, [x19, 852]
.L115:
	ldr	x2, .LC49
	mov	w1, 391
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 17
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 104]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L116
	mov	w0, 1
	str	w0, [x19, 852]
.L117:
	ldr	x2, .LC51
	mov	w1, 396
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 18
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 108]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L118
	mov	w0, 1
	str	w0, [x19, 852]
.L119:
	ldr	x2, .LC53
	mov	w1, 401
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 19
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 112]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L120
	mov	w0, 1
	str	w0, [x19, 852]
.L121:
	ldr	x2, .LC55
	mov	w1, 406
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 20
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 116]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L122
	mov	w0, 1
	str	w0, [x19, 852]
.L123:
	ldr	x2, .LC57
	mov	w1, 411
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 21
	ldr	w1, [x19, 864]
	ldr	w3, [x22, 896]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L124
	mov	w0, 1
	str	w0, [x19, 852]
.L125:
	ldr	x2, .LC59
	mov	w1, 417
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 22
	ldr	w1, [x19, 864]
	ldr	w3, [x22, 900]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L126
	mov	w0, 1
	str	w0, [x19, 852]
.L127:
	ldr	x2, .LC61
	mov	w1, 422
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 23
	ldr	w1, [x19, 864]
	ldr	w3, [x22, 876]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L128
	mov	w0, 1
	str	w0, [x19, 852]
.L129:
	ldr	x2, .LC63
	mov	w1, 427
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 24
	ldr	w1, [x19, 864]
	ldr	w3, [x22, 908]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L130
	mov	w0, 1
	str	w0, [x19, 852]
.L131:
	ldr	x2, .LC65
	mov	w1, 432
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 26
	ldr	w1, [x19, 864]
	ldr	w3, [x22, 880]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L132
	mov	w0, 1
	str	w0, [x19, 852]
.L133:
	ldr	x2, .LC67
	mov	w1, 437
	mov	w0, 5
	bl	dprint_normal
	ldr	x4, [x19, 856]
	add	x0, x21, 27
	ldr	w1, [x19, 864]
	ldrh	w3, [x20, 78]
	sub	x0, x0, x4
	ldrh	w2, [x20, 80]
	cmp	x0, x1
	strh	w3, [x29, 60]
	strh	w2, [x29, 62]
	blt	.L134
	ldr	w3, [x29, 60]
	mov	w0, 1
	str	w0, [x19, 852]
.L135:
	ldr	x2, .LC69
	mov	w1, 443
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 60]
	ldrb	w1, [x20, 59]
	mov	w0, 0
	ldrb	w4, [x20, 63]
	mov	w2, 0
	bfi	w0, w1, 4, 1
	ldrb	w1, [x20, 60]
	ldr	x3, [x19, 856]
	bfi	w2, w4, 1, 3
	bfi	w0, w1, 5, 1
	add	x1, x21, 28
	sub	x1, x1, x3
	ldrb	w5, [x20, 61]
	ldrb	w4, [x20, 62]
	ldr	w3, [x19, 864]
	bfi	w0, w5, 6, 1
	bfi	w2, w4, 0, 1
	strb	w0, [x29, 62]
	cmp	x1, x3
	strb	w2, [x29, 63]
	blt	.L136
	ldr	w3, [x29, 60]
	mov	w0, 1
	str	w0, [x19, 852]
.L137:
	ldr	x2, .LC71
	mov	w1, 452
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 29
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 120]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L138
	mov	w0, 1
	str	w0, [x19, 852]
.L139:
	ldr	x2, .LC73
	mov	w1, 457
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 30
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 124]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L140
	mov	w0, 1
	str	w0, [x19, 852]
.L141:
	ldr	x2, .LC75
	mov	w1, 462
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 31
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 128]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L142
	mov	w0, 1
	str	w0, [x19, 852]
.L143:
	ldr	x2, .LC77
	mov	w1, 467
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 32
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 132]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L144
	mov	w0, 1
	str	w0, [x19, 852]
.L145:
	ldr	x2, .LC79
	mov	w1, 472
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 33
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 136]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L146
	mov	w0, 1
	str	w0, [x19, 852]
.L147:
	ldr	x2, .LC81
	mov	w1, 477
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 34
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 140]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L148
	mov	w0, 1
	str	w0, [x19, 852]
.L149:
	ldr	x2, .LC83
	mov	w1, 482
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 35
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 144]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L150
	mov	w0, 1
	str	w0, [x19, 852]
.L151:
	ldr	x2, .LC85
	mov	w1, 487
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 36
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 148]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L152
	mov	w0, 1
	str	w0, [x19, 852]
.L153:
	ldr	x2, .LC87
	mov	w1, 492
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 63
	ldr	w1, [x19, 864]
	ldr	w3, [x22, 44]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 60]
	blt	.L154
	mov	w0, 1
	str	w0, [x19, 852]
.L155:
	ldr	x2, .LC88
	mov	w1, 497
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x22, 880]
	bl	MEM_Phy2Vir
	cbz	x0, .L159
	ldr	x3, .LC91
	mov	x2, 3072
	ldr	x1, [x20, 64]
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L81:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L158:
	mov	w0, 1
	ldr	w3, [x29, 60]
	str	w0, [x19, 852]
	b	.L83
	.p2align 3
.L154:
	str	w3, [x21, 252]
	b	.L155
	.p2align 3
.L152:
	str	w3, [x21, 144]
	b	.L153
	.p2align 3
.L150:
	str	w3, [x21, 140]
	b	.L151
	.p2align 3
.L148:
	str	w3, [x21, 136]
	b	.L149
	.p2align 3
.L146:
	str	w3, [x21, 132]
	b	.L147
	.p2align 3
.L144:
	str	w3, [x21, 128]
	b	.L145
	.p2align 3
.L142:
	str	w3, [x21, 124]
	b	.L143
	.p2align 3
.L140:
	str	w3, [x21, 120]
	b	.L141
	.p2align 3
.L138:
	str	w3, [x21, 116]
	b	.L139
	.p2align 3
.L136:
	ldr	w3, [x29, 60]
	str	w3, [x21, 112]
	b	.L137
	.p2align 3
.L134:
	ldr	w3, [x29, 60]
	str	w3, [x21, 108]
	b	.L135
	.p2align 3
.L132:
	str	w3, [x21, 104]
	b	.L133
	.p2align 3
.L130:
	str	w3, [x21, 96]
	b	.L131
	.p2align 3
.L128:
	str	w3, [x21, 92]
	b	.L129
	.p2align 3
.L126:
	str	w3, [x21, 88]
	b	.L127
	.p2align 3
.L124:
	str	w3, [x21, 84]
	b	.L125
	.p2align 3
.L122:
	str	w3, [x21, 80]
	b	.L123
	.p2align 3
.L120:
	str	w3, [x21, 76]
	b	.L121
	.p2align 3
.L118:
	str	w3, [x21, 72]
	b	.L119
	.p2align 3
.L116:
	str	w3, [x21, 68]
	b	.L117
	.p2align 3
.L114:
	str	w3, [x21, 64]
	b	.L115
	.p2align 3
.L112:
	ldr	w3, [x29, 60]
	str	w3, [x21, 60]
	b	.L113
	.p2align 3
.L110:
	str	w3, [x21, 56]
	b	.L111
	.p2align 3
.L108:
	str	w3, [x21, 52]
	b	.L109
	.p2align 3
.L106:
	str	w3, [x21, 48]
	b	.L107
	.p2align 3
.L104:
	ldr	w3, [x29, 60]
	str	w3, [x21, 44]
	b	.L105
	.p2align 3
.L102:
	ldr	w3, [x29, 60]
	str	w3, [x21, 40]
	b	.L103
	.p2align 3
.L100:
	ldr	w3, [x29, 60]
	str	w3, [x21, 36]
	b	.L101
	.p2align 3
.L98:
	ldr	w3, [x29, 60]
	str	w3, [x21, 32]
	b	.L99
	.p2align 3
.L96:
	ldr	w3, [x29, 60]
	str	w3, [x21, 28]
	b	.L97
	.p2align 3
.L94:
	ldr	w3, [x29, 60]
	str	w3, [x21, 24]
	b	.L95
	.p2align 3
.L92:
	ldr	w3, [x29, 60]
	str	w3, [x21, 20]
	b	.L93
	.p2align 3
.L90:
	ldr	w3, [x29, 60]
	str	w3, [x21, 16]
	b	.L91
	.p2align 3
.L88:
	ldr	w3, [x29, 60]
	str	w3, [x21, 12]
	b	.L89
	.p2align 3
.L86:
	ldr	w3, [x29, 60]
	str	w3, [x21, 8]
	b	.L87
	.p2align 3
.L84:
	ldr	w3, [x29, 60]
	str	w3, [x21, 4]
	b	.L85
.L159:
	ldr	x3, .LC18
	mov	w1, 503
	ldr	x2, .LC90
	add	x3, x3, 24
	bl	dprint_normal
	mov	w0, -1
	b	.L81
.L157:
	ldr	x3, .LC18
	mov	w1, 258
	ldr	x2, .LC19
	mov	w0, 0
	add	x3, x3, 24
	bl	dprint_normal
	mov	w0, -1
	b	.L81
	.size	VC1HAL_CfgDnMsg, .-VC1HAL_CfgDnMsg
	.align	3
.LC18:
	.xword	.LANCHOR0
	.align	3
.LC19:
	.xword	.LC3
	.align	3
.LC20:
	.xword	g_HwMem
	.align	3
.LC21:
	.xword	.LC6
	.align	3
.LC22:
	.xword	.LC8
	.align	3
.LC23:
	.xword	.LC10
	.align	3
.LC24:
	.xword	.LC12
	.align	3
.LC25:
	.xword	.LC14
	.align	3
.LC27:
	.xword	.LC26
	.align	3
.LC29:
	.xword	.LC28
	.align	3
.LC31:
	.xword	.LC30
	.align	3
.LC33:
	.xword	.LC32
	.align	3
.LC35:
	.xword	.LC34
	.align	3
.LC37:
	.xword	.LC36
	.align	3
.LC39:
	.xword	.LC38
	.align	3
.LC41:
	.xword	.LC40
	.align	3
.LC43:
	.xword	.LC42
	.align	3
.LC45:
	.xword	.LC44
	.align	3
.LC47:
	.xword	.LC46
	.align	3
.LC49:
	.xword	.LC48
	.align	3
.LC51:
	.xword	.LC50
	.align	3
.LC53:
	.xword	.LC52
	.align	3
.LC55:
	.xword	.LC54
	.align	3
.LC57:
	.xword	.LC56
	.align	3
.LC59:
	.xword	.LC58
	.align	3
.LC61:
	.xword	.LC60
	.align	3
.LC63:
	.xword	.LC62
	.align	3
.LC65:
	.xword	.LC64
	.align	3
.LC67:
	.xword	.LC66
	.align	3
.LC69:
	.xword	.LC68
	.align	3
.LC71:
	.xword	.LC70
	.align	3
.LC73:
	.xword	.LC72
	.align	3
.LC75:
	.xword	.LC74
	.align	3
.LC77:
	.xword	.LC76
	.align	3
.LC79:
	.xword	.LC78
	.align	3
.LC81:
	.xword	.LC80
	.align	3
.LC83:
	.xword	.LC82
	.align	3
.LC85:
	.xword	.LC84
	.align	3
.LC87:
	.xword	.LC86
	.align	3
.LC88:
	.xword	.LC16
	.align	3
.LC90:
	.xword	.LC89
	.align	3
.LC91:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1HAL_StartDec
	.type	VC1HAL_StartDec, %function
VC1HAL_StartDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	sxtw	x1, w19
	ldr	x19, .LC92
	lsl	x0, x1, 7
	sub	x1, x0, x1
	mov	x0, x20
	add	x19, x19, x1, lsl 3
	mov	x1, x19
	bl	VC1HAL_CfgSliceMsg
	mov	x1, x19
	mov	x0, x20
	bl	VC1HAL_CfgDnMsg
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1HAL_StartDec, .-VC1HAL_StartDec
	.align	3
.LC92:
	.xword	g_HwMem
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.10592, %object
	.size	__func__.10592, 19
__func__.10592:
	.string	"VC1HAL_CfgSliceMsg"
	.zero	5
	.type	__func__.10600, %object
	.size	__func__.10600, 16
__func__.10600:
	.string	"VC1HAL_CfgDnMsg"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC3:
	ASCII(.string	"%s: pMsgBase = NULL\n" )
	.zero	3
.LC6:
	ASCII(.string	"D0 = 0x%08x\n" )
	.zero	3
.LC8:
	ASCII(.string	"D1 = 0x%08x\n" )
	.zero	3
.LC10:
	ASCII(.string	"D2 = 0x%08x\n" )
	.zero	3
.LC12:
	ASCII(.string	"D3 = 0x%08x\n" )
	.zero	3
.LC14:
	ASCII(.string	"D4 = 0x%08x\n" )
	.zero	3
.LC16:
	ASCII(.string	"D63 = 0x%08x\n" )
	.zero	2
.LC26:
	ASCII(.string	"D5 = 0x%08x\n" )
	.zero	3
.LC28:
	ASCII(.string	"D6 = 0x%08x\n" )
	.zero	3
.LC30:
	ASCII(.string	"D7 = 0x%08x\n" )
	.zero	3
.LC32:
	ASCII(.string	"D8 = 0x%08x\n" )
	.zero	3
.LC34:
	ASCII(.string	"D9 = 0x%08x\n" )
	.zero	3
.LC36:
	ASCII(.string	"D10 = 0x%08x\n" )
	.zero	2
.LC38:
	ASCII(.string	"D11 = 0x%08x\n" )
	.zero	2
.LC40:
	ASCII(.string	"D12 = 0x%08x\n" )
	.zero	2
.LC42:
	ASCII(.string	"D13 = 0x%08x\n" )
	.zero	2
.LC44:
	ASCII(.string	"D14 = 0x%08x\n" )
	.zero	2
.LC46:
	ASCII(.string	"D15 = 0x%08x\n" )
	.zero	2
.LC48:
	ASCII(.string	"D16 = 0x%08x\n" )
	.zero	2
.LC50:
	ASCII(.string	"D17 = 0x%08x\n" )
	.zero	2
.LC52:
	ASCII(.string	"D18 = 0x%08x\n" )
	.zero	2
.LC54:
	ASCII(.string	"D19 = 0x%08x\n" )
	.zero	2
.LC56:
	ASCII(.string	"D20 = 0x%08x\n" )
	.zero	2
.LC58:
	ASCII(.string	"D21 = 0x%08x\n" )
	.zero	2
.LC60:
	ASCII(.string	"D22 = 0x%08x\n" )
	.zero	2
.LC62:
	ASCII(.string	"D23 = 0x%08x\n" )
	.zero	2
.LC64:
	ASCII(.string	"D24 = 0x%08x\n" )
	.zero	2
.LC66:
	ASCII(.string	"D26 = 0x%08x\n" )
	.zero	2
.LC68:
	ASCII(.string	"D27 = 0x%08x\n" )
	.zero	2
.LC70:
	ASCII(.string	"D28 = 0x%08x\n" )
	.zero	2
.LC72:
	ASCII(.string	"D29 = 0x%08x\n" )
	.zero	2
.LC74:
	ASCII(.string	"D30 = 0x%08x\n" )
	.zero	2
.LC76:
	ASCII(.string	"D31 = 0x%08x\n" )
	.zero	2
.LC78:
	ASCII(.string	"D32 = 0x%08x\n" )
	.zero	2
.LC80:
	ASCII(.string	"D33 = 0x%08x\n" )
	.zero	2
.LC82:
	ASCII(.string	"D34 = 0x%08x\n" )
	.zero	2
.LC84:
	ASCII(.string	"D35 = 0x%08x\n" )
	.zero	2
.LC86:
	ASCII(.string	"D36 = 0x%08x\n" )
	.zero	2
.LC89:
	ASCII(.string	"%s: u8Tmp = NULL\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
