#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal_mpeg4.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	MP4HAL_Log2bin
	.type	MP4HAL_Log2bin, %function
MP4HAL_Log2bin:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	cbz	w19, .L2
	.p2align 2
.L3:
	add	w0, w0, 1
	lsr	w19, w19, 1
	sxth	w0, w0
	cbnz	w19, .L3
.L2:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP4HAL_Log2bin, .-MP4HAL_Log2bin
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4HAL_CfgDnMsg
	.type	MP4HAL_CfgDnMsg, %function
MP4HAL_CfgDnMsg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	sxtw	x23, w1
	mov	w20, 0
	bl	_mcount
	ldrh	w0, [x22, 152]
	ldrh	w1, [x22, 154]
	mul	w0, w0, w1
	cbz	w0, .L8
	.p2align 2
.L9:
	add	w20, w20, 1
	lsr	w0, w0, 1
	sxth	w20, w20
	cbnz	w0, .L9
.L8:
	lsl	x0, x23, 7
	ldr	x19, .LC0
	sub	x0, x0, x23
	add	x0, x19, x0, lsl 3
	ldr	w0, [x0, 40]
	bl	MEM_Phy2Vir
	mov	x21, x0
	cbz	x0, .L116
	ldrb	w0, [x22, 2]
	cmp	w0, 1
	beq	.L117
	ldr	x0, [x19, 856]
	ldr	w1, [x19, 864]
	sub	x0, x21, x0
	cmp	x0, x1
	bge	.L118
	str	wzr, [x21]
.L21:
	ldr	x2, .LC4
	mov	w3, 0
	mov	w1, 146
	mov	w0, 5
	bl	dprint_normal
	ldr	x4, [x19, 856]
	add	x0, x21, 4
	ldr	w2, [x19, 864]
	ldrb	w3, [x22, 3]
	sub	x0, x0, x4
	ldrb	w1, [x22, 1]
	cmp	x0, x2
	ubfiz	w3, w3, 26, 5
	orr	w3, w3, w1, lsl 31
	blt	.L22
	mov	w0, 1
	ldr	x2, .LC6
	str	w0, [x19, 852]
	mov	w1, 153
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x22]
	cmp	w0, 2
	beq	.L24
.L127:
	ldrb	w3, [x22, 12]
	ubfiz	w3, w3, 3, 1
.L25:
	ldrb	w2, [x22, 15]
	ubfiz	w1, w0, 5, 2
	ldr	w4, [x22, 14564]
	ubfiz	w20, w20, 22, 4
	and	w2, w2, 1
	ldr	w5, [x22, 14572]
	ubfiz	w4, w4, 26, 2
	ldrb	w0, [x22, 11]
	orr	w4, w4, w2
	ldr	w2, [x22, 14568]
	ubfiz	w5, w5, 28, 2
	ubfiz	w0, w0, 4, 1
	orr	w0, w0, w1
	ldrb	w1, [x22, 9]
	orr	w5, w5, w2, lsl 30
	ldrb	w2, [x22, 14]
	orr	w5, w4, w5
	ubfiz	w1, w1, 8, 3
	ubfiz	w4, w2, 1, 1
	ldrb	w2, [x22, 13]
	ubfiz	w2, w2, 2, 1
	orr	w2, w4, w2
	orr	w4, w5, w2
	ldrb	w2, [x22, 10]
	orr	w0, w4, w0
	ldrb	w4, [x22, 7]
	ubfiz	w2, w2, 7, 1
	ldr	x5, [x19, 856]
	orr	w2, w2, w1
	ldrb	w1, [x22, 8]
	orr	w0, w0, w2
	ubfiz	w2, w4, 11, 3
	ubfiz	w1, w1, 14, 3
	ldrb	w4, [x22, 6]
	orr	w1, w2, w1
	add	x2, x21, 8
	orr	w0, w0, w1
	ldr	w1, [x19, 864]
	ubfiz	w4, w4, 17, 5
	sub	x2, x2, x5
	orr	w20, w4, w20
	cmp	x2, x1
	orr	w0, w0, w20
	orr	w3, w0, w3
	blt	.L26
	mov	w0, 1
	ldr	x2, .LC8
	str	w0, [x19, 852]
	mov	w1, 178
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x22]
	cmp	w0, 2
	beq	.L119
.L19:
	ldr	x0, [x19, 856]
	add	x2, x21, 16
	ldrh	w3, [x22, 154]
	ldrh	w1, [x22, 152]
	sub	x2, x2, x0
	ldr	w4, [x19, 864]
	sub	w0, w3, #1
	sub	w1, w1, #1
	cmp	x2, x4
	and	w3, w1, 65535
	orr	w3, w3, w0, lsl 16
	blt	.L30
	mov	w0, 1
	str	w0, [x19, 852]
.L31:
	ldr	x2, .LC12
	mov	w1, 196
	mov	w0, 5
	bl	dprint_normal
	ldr	x3, [x19, 856]
	add	x0, x21, 20
	ldr	w2, [x19, 864]
	sub	x0, x0, x3
	ldr	w1, [x22, 14556]
	ldr	w3, [x22, 14560]
	cmp	x0, x2
	orr	w3, w3, w1, lsl 16
	blt	.L32
	mov	w0, 1
	ldr	x2, .LC14
	str	w0, [x19, 852]
	mov	w1, 202
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x22]
	cmp	w0, 3
	beq	.L120
.L34:
	ldr	x2, [x19, 856]
	add	x0, x21, 32
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L48
	mov	w0, 1
	str	w0, [x19, 852]
.L49:
	ldr	x2, .LC20
	mov	w1, 247
	mov	w3, 0
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 36
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L50
	mov	w0, 1
	str	w0, [x19, 852]
.L51:
	ldr	x2, .LC22
	mov	w1, 253
	mov	w3, 0
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 40
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L52
	mov	w0, 1
	str	w0, [x19, 852]
.L53:
	ldr	x2, .LC24
	mov	w1, 259
	mov	w3, 0
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 44
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L54
	mov	w0, 1
	str	w0, [x19, 852]
.L55:
	ldr	x2, .LC26
	mov	w3, 0
	mov	w1, 265
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 48
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x22, 188]
	cmp	x0, x1
	blt	.L56
	mov	w0, 1
	str	w0, [x19, 852]
.L57:
	ldr	x2, .LC28
	mov	w1, 273
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 52
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x22, 172]
	cmp	x0, x1
	blt	.L58
	mov	w0, 1
	str	w0, [x19, 852]
.L59:
	ldr	x2, .LC30
	mov	w1, 279
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 56
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x22, 176]
	cmp	x0, x1
	blt	.L60
	mov	w0, 1
	str	w0, [x19, 852]
.L61:
	ldr	x2, .LC32
	mov	w1, 285
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 60
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x22, 180]
	cmp	x0, x1
	blt	.L62
	mov	w0, 1
	str	w0, [x19, 852]
.L63:
	ldr	x2, .LC34
	mov	w1, 291
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 64
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x22, 184]
	cmp	x0, x1
	blt	.L64
	mov	w0, 1
	str	w0, [x19, 852]
.L65:
	ldr	x2, .LC36
	mov	w1, 297
	mov	w0, 5
	bl	dprint_normal
	lsl	x0, x23, 7
	ldr	x3, [x19, 856]
	sub	x0, x0, x23
	add	x1, x21, 68
	ldr	w2, [x19, 864]
	sub	x1, x1, x3
	add	x0, x19, x0, lsl 3
	cmp	x1, x2
	ldr	w3, [x0, 876]
	blt	.L66
	mov	w0, 1
	str	w0, [x19, 852]
.L67:
	ldr	x2, .LC38
	mov	w1, 303
	mov	w0, 5
	bl	dprint_normal
	lsl	x0, x23, 7
	ldr	x3, [x19, 856]
	sub	x0, x0, x23
	add	x1, x21, 72
	ldr	w2, [x19, 864]
	sub	x1, x1, x3
	add	x0, x19, x0, lsl 3
	cmp	x1, x2
	ldr	w3, [x0, 900]
	blt	.L68
	mov	w0, 1
	ldr	x2, .LC40
	str	w0, [x19, 852]
	mov	w1, 309
	mov	w0, 5
	bl	dprint_normal
	strb	wzr, [x22, 149]
	ldrb	w0, [x22]
	cmp	w0, 3
	beq	.L121
.L70:
	ldrb	w0, [x22, 145]
	strb	w0, [x22, 144]
	and	w0, w0, 1
	lsl	w3, w0, 3
.L72:
	ldr	x5, [x19, 856]
	add	x4, x21, 76
	ldrb	w2, [x22, 148]
	orr	w0, w3, w0, lsl 2
	sub	x4, x4, x5
	ldrb	w1, [x22, 147]
	ldr	w5, [x19, 864]
	ubfiz	w2, w2, 1, 1
	and	w1, w1, 1
	cmp	x4, x5
	orr	w1, w2, w1
	orr	w3, w1, w0
	blt	.L73
	mov	w0, 1
	str	w0, [x19, 852]
.L74:
	ldr	x2, .LC42
	mov	w1, 339
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 80
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x22, 14576]
	cmp	x0, x1
	blt	.L75
	mov	w0, 1
	str	w0, [x19, 852]
.L76:
	ldr	x2, .LC44
	mov	w1, 345
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 84
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x22, 14580]
	cmp	x0, x1
	blt	.L77
	mov	w0, 1
	str	w0, [x19, 852]
.L78:
	ldr	x2, .LC46
	mov	w1, 351
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 88
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x22, 14584]
	cmp	x0, x1
	blt	.L79
	mov	w0, 1
	str	w0, [x19, 852]
.L80:
	ldr	x2, .LC48
	mov	w1, 357
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 92
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x22, 14588]
	cmp	x0, x1
	blt	.L81
	mov	w0, 1
	str	w0, [x19, 852]
.L82:
	ldr	x2, .LC50
	mov	w1, 363
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 96
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x22, 14592]
	cmp	x0, x1
	blt	.L83
	mov	w0, 1
	str	w0, [x19, 852]
.L84:
	ldr	x2, .LC52
	mov	w1, 369
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 100
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x22, 14596]
	cmp	x0, x1
	blt	.L85
	mov	w0, 1
	str	w0, [x19, 852]
.L86:
	ldr	x2, .LC54
	mov	w1, 375
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 104
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x22, 14600]
	cmp	x0, x1
	blt	.L87
	mov	w0, 1
	str	w0, [x19, 852]
.L88:
	ldr	x2, .LC56
	mov	w1, 381
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 108
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x22, 14604]
	cmp	x0, x1
	blt	.L89
	mov	w0, 1
	ldr	x2, .LC58
	str	w0, [x19, 852]
	mov	w1, 387
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x22, 2]
	cmp	w0, 2
	beq	.L122
.L91:
	ldr	w5, [x19, 864]
	ldr	x6, [x19, 856]
.L101:
	add	x0, x21, 240
	sub	x0, x0, x6
	cmp	x0, x5
	blt	.L102
	mov	w0, 1
	str	w0, [x19, 852]
.L103:
	lsl	x0, x23, 7
	add	x1, x21, 252
	sub	x23, x0, x23
	sub	x0, x1, x6
	cmp	x0, x5
	add	x23, x19, x23, lsl 3
	ldr	w3, [x23, 40]
	add	w3, w3, 256
	blt	.L104
	mov	w0, 1
	str	w0, [x19, 852]
.L105:
	ldr	x2, .LC60
	mov	w1, 406
	mov	w0, 5
	bl	dprint_normal
	mov	w0, 0
.L11:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L118:
	mov	w0, 1
	str	w0, [x19, 852]
	b	.L21
	.p2align 3
.L104:
	str	w3, [x21, 252]
	b	.L105
	.p2align 3
.L102:
	str	wzr, [x21, 240]
	ldr	w5, [x19, 864]
	ldr	x6, [x19, 856]
	b	.L103
	.p2align 3
.L89:
	ldr	x2, .LC58
	mov	w1, 387
	str	w3, [x21, 108]
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x22, 2]
	cmp	w0, 2
	bne	.L91
.L122:
	ldrb	w0, [x22, 1]
	cbz	w0, .L91
	ldr	w3, [x19, 864]
	add	x9, x22, 16
	ldr	x2, [x19, 856]
	mov	w6, 0
	mov	w11, 1
	.p2align 2
.L92:
	mov	w1, w6
	lsl	w5, w6, 3
	add	w10, w6, 16
.L95:
	sxtw	x0, w5
	sxtw	x8, w1
	add	x0, x0, 112
	add	x7, x9, x8
	add	x4, x21, x0
	sub	x4, x4, x2
	cmp	x4, x3
	blt	.L93
	str	w11, [x19, 852]
.L94:
	add	w1, w1, 8
	add	w5, w5, 4
	cmp	w1, w10
	bne	.L95
	add	w6, w6, 1
	cmp	w6, 8
	bne	.L92
	add	x0, x22, 80
	mov	w11, 64
	mov	w8, 0
	mov	w13, 1
	.p2align 2
.L97:
	mov	w4, w8
	add	w12, w8, 16
	mov	w7, w11
.L100:
	sxtw	x1, w7
	sxtw	x10, w4
	add	x1, x1, 112
	add	x9, x0, x10
	add	x5, x21, x1
	mov	x6, x2
	sub	x5, x5, x2
	cmp	x5, x3
	mov	x5, x3
	blt	.L98
	str	w13, [x19, 852]
.L99:
	add	w4, w4, 8
	add	w7, w7, 4
	cmp	w12, w4
	bne	.L100
	add	w8, w8, 1
	add	w11, w11, 8
	cmp	w8, 8
	bne	.L97
	b	.L101
	.p2align 3
.L87:
	str	w3, [x21, 104]
	b	.L88
	.p2align 3
.L85:
	str	w3, [x21, 100]
	b	.L86
	.p2align 3
.L83:
	str	w3, [x21, 96]
	b	.L84
	.p2align 3
.L81:
	str	w3, [x21, 92]
	b	.L82
	.p2align 3
.L79:
	str	w3, [x21, 88]
	b	.L80
	.p2align 3
.L77:
	str	w3, [x21, 84]
	b	.L78
	.p2align 3
.L75:
	str	w3, [x21, 80]
	b	.L76
	.p2align 3
.L73:
	str	w3, [x21, 76]
	b	.L74
	.p2align 3
.L68:
	ldr	x2, .LC40
	mov	w1, 309
	str	w3, [x21, 72]
	mov	w0, 5
	bl	dprint_normal
	strb	wzr, [x22, 149]
	ldrb	w0, [x22]
	cmp	w0, 3
	bne	.L70
.L121:
	ldr	w0, [x22, 14568]
	cmp	w0, 1
	beq	.L123
	bhi	.L70
	ldrb	w0, [x22, 144]
	ldrb	w1, [x22, 145]
	ubfiz	w3, w0, 3, 1
	and	w0, w1, 1
	b	.L72
	.p2align 3
.L66:
	str	w3, [x21, 68]
	b	.L67
	.p2align 3
.L64:
	str	w3, [x21, 64]
	b	.L65
	.p2align 3
.L62:
	str	w3, [x21, 60]
	b	.L63
	.p2align 3
.L60:
	str	w3, [x21, 56]
	b	.L61
	.p2align 3
.L58:
	str	w3, [x21, 52]
	b	.L59
	.p2align 3
.L56:
	str	w3, [x21, 48]
	b	.L57
	.p2align 3
.L54:
	str	wzr, [x21, 44]
	b	.L55
	.p2align 3
.L52:
	str	wzr, [x21, 40]
	b	.L53
	.p2align 3
.L50:
	str	wzr, [x21, 36]
	b	.L51
	.p2align 3
.L48:
	str	wzr, [x21, 32]
	b	.L49
	.p2align 3
.L32:
	ldr	x2, .LC14
	mov	w1, 202
	str	w3, [x21, 20]
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x22]
	cmp	w0, 3
	bne	.L34
.L120:
	ldr	w0, [x22, 14568]
	cmp	w0, 1
	bne	.L34
	ldrb	w1, [x22, 146]
	ldrb	w3, [x22, 11]
	cmp	w1, 1
	beq	.L124
	ldr	w1, [x22, 14592]
	add	x2, x21, 24
	lsl	w1, w1, w3
	ldr	w3, [x22, 14572]
	lsl	w0, w0, w3
	cbnz	w1, .L125
	asr	w0, w0, 1
	sub	w0, w0, #1
	lsr	w3, w0, w3
.L41:
	ldr	x0, [x19, 856]
	ldr	w1, [x19, 864]
	sub	x0, x2, x0
	cmp	x0, x1
	blt	.L42
	mov	w0, 1
	str	w0, [x19, 852]
.L43:
	ldr	x2, .LC16
	mov	w1, 229
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x22, 14596]
	add	x2, x21, 28
	ldrb	w1, [x22, 11]
	ldr	w3, [x22, 14572]
	lsl	w1, w0, w1
	mov	w0, 1
	lsl	w0, w0, w3
	cbz	w1, .L44
	add	w0, w1, w0, asr 1
	lsr	w3, w0, w3
.L45:
	ldr	x0, [x19, 856]
	ldr	w1, [x19, 864]
	sub	x0, x2, x0
	cmp	x0, x1
	blt	.L46
	mov	w0, 1
	str	w0, [x19, 852]
.L47:
	ldr	x2, .LC18
	mov	w1, 236
	mov	w0, 5
	bl	dprint_normal
	b	.L34
	.p2align 3
.L30:
	str	w3, [x21, 16]
	b	.L31
	.p2align 3
.L26:
	ldr	x2, .LC8
	mov	w1, 178
	str	w3, [x21, 8]
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x22]
	cmp	w0, 2
	bne	.L19
.L119:
	ldr	x4, [x19, 856]
	add	x0, x21, 12
	ldr	w2, [x19, 864]
	ldp	w3, w1, [x22, 156]
	sub	x0, x0, x4
	cmp	x0, x2
	ubfiz	w3, w3, 1, 15
	orr	w3, w3, w1, lsl 17
	bge	.L126
	str	w3, [x21, 12]
.L29:
	ldr	x2, .LC10
	mov	w1, 187
	mov	w0, 5
	bl	dprint_normal
	b	.L19
	.p2align 3
.L22:
	ldr	x2, .LC6
	mov	w1, 153
	str	w3, [x21, 4]
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x22]
	cmp	w0, 2
	bne	.L127
.L24:
	strb	wzr, [x22, 12]
	mov	w3, 0
	b	.L25
	.p2align 3
.L117:
	ldr	x1, [x19, 856]
	ldr	w2, [x19, 864]
	sub	x1, x21, x1
	cmp	x1, x2
	bge	.L128
	mov	w0, 4
	str	w0, [x21]
.L14:
	ldr	x2, .LC4
	mov	w3, 4
	mov	w1, 124
	mov	w0, 5
	bl	dprint_normal
	ldr	x4, [x19, 856]
	add	x2, x21, 4
	ldrb	w3, [x22, 4]
	sub	x2, x2, x4
	ldrb	w1, [x22, 3]
	ldrb	w0, [x22, 5]
	ubfiz	w3, w3, 5, 7
	ldr	w4, [x19, 864]
	ubfiz	w1, w1, 26, 5
	sub	w0, w0, #1
	orr	w3, w3, w1
	cmp	x2, x4
	and	w0, w0, 31
	orr	w3, w3, w0
	blt	.L15
	mov	w0, 1
	str	w0, [x19, 852]
.L16:
	ldr	x2, .LC6
	mov	w1, 132
	mov	w0, 5
	ubfiz	w20, w20, 22, 4
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 8
	ldr	w1, [x19, 864]
	ldrb	w3, [x22]
	sub	x0, x0, x2
	cmp	x0, x1
	ubfiz	w3, w3, 5, 2
	orr	w3, w3, w20
	blt	.L17
	mov	w0, 1
	str	w0, [x19, 852]
.L18:
	ldr	x2, .LC8
	mov	w1, 139
	mov	w0, 5
	bl	dprint_normal
	b	.L19
	.p2align 3
.L128:
	str	w0, [x19, 852]
	b	.L14
.L126:
	mov	w0, 1
	str	w0, [x19, 852]
	b	.L29
	.p2align 3
.L98:
	ldrb	w5, [x9, 32]
	ldrb	w2, [x9, 48]
	ldrb	w3, [x9, 16]
	ldrb	w6, [x0, x10]
	lsl	w2, w2, 24
	orr	w2, w2, w5, lsl 16
	orr	w3, w6, w3, lsl 8
	orr	w2, w2, w3
	str	w2, [x21, x1]
	ldr	w3, [x19, 864]
	ldr	x2, [x19, 856]
	mov	x5, x3
	mov	x6, x2
	b	.L99
	.p2align 3
.L93:
	ldrb	w4, [x7, 32]
	ldrb	w2, [x7, 48]
	ldrb	w3, [x7, 16]
	ldrb	w8, [x9, x8]
	lsl	w2, w2, 24
	orr	w2, w2, w4, lsl 16
	orr	w3, w8, w3, lsl 8
	orr	w2, w2, w3
	str	w2, [x21, x0]
	ldr	w3, [x19, 864]
	ldr	x2, [x19, 856]
	b	.L94
	.p2align 3
.L17:
	str	w3, [x21, 8]
	b	.L18
	.p2align 3
.L15:
	str	w3, [x21, 4]
	b	.L16
.L123:
	ldrb	w1, [x22, 145]
	mov	w3, 8
	strb	w0, [x22, 144]
	and	w0, w1, 1
	b	.L72
.L125:
	add	w0, w1, w0, asr 1
	lsr	w3, w0, w3
	b	.L41
.L46:
	str	w3, [x21, 28]
	b	.L47
.L44:
	asr	w0, w0, 1
	sub	w0, w0, #1
	lsr	w3, w0, w3
	b	.L45
.L42:
	str	w3, [x21, 24]
	b	.L43
.L124:
	ldr	w0, [x22, 14572]
	add	x2, x21, 24
	ldr	x5, [x19, 856]
	ldr	w4, [x19, 864]
	sub	w0, w0, w3
	sub	x2, x2, x5
	ldr	w3, [x22, 14592]
	lsl	w0, w1, w0
	cmp	x2, x4
	sdiv	w3, w3, w0
	blt	.L36
	str	w1, [x19, 852]
.L37:
	ldr	x2, .LC16
	mov	w1, 214
	mov	w0, 5
	bl	dprint_normal
	ldrb	w2, [x22, 11]
	add	x1, x21, 28
	ldr	w0, [x22, 14572]
	ldr	x5, [x19, 856]
	ldr	w4, [x19, 864]
	sub	w0, w0, w2
	ldr	w3, [x22, 14596]
	mov	w2, 1
	sub	x1, x1, x5
	lsl	w0, w2, w0
	cmp	x1, x4
	sdiv	w3, w3, w0
	blt	.L38
	str	w2, [x19, 852]
.L39:
	ldr	x2, .LC18
	mov	w1, 220
	mov	w0, 5
	bl	dprint_normal
	b	.L34
.L36:
	str	w3, [x21, 24]
	b	.L37
.L38:
	str	w3, [x21, 28]
	b	.L39
.L116:
	mov	w3, 112
	ldr	x2, .LC2
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L11
	.size	MP4HAL_CfgDnMsg, .-MP4HAL_CfgDnMsg
	.align	3
.LC0:
	.xword	g_HwMem
	.align	3
.LC2:
	.xword	.LC1
	.align	3
.LC4:
	.xword	.LC3
	.align	3
.LC6:
	.xword	.LC5
	.align	3
.LC8:
	.xword	.LC7
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
	.align	3
.LC60:
	.xword	.LC59
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4HAL_WriteSlicMsg
	.type	MP4HAL_WriteSlicMsg, %function
MP4HAL_WriteSlicMsg:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x24, x0
	mov	x0, x30
	mov	w19, w1
	add	x27, x24, 196
	bl	_mcount
	ldr	x28, .LC61
	sxtw	x1, w19
	str	wzr, [x29, 140]
	lsl	x0, x1, 7
	sub	x0, x0, x1
	ldr	w1, [x24, 14532]
	str	w1, [x29, 124]
	add	x0, x28, x0, lsl 3
	ldr	w1, [x24, 192]
	str	w1, [x29, 120]
	ldr	w19, [x0, 40]
	add	w20, w19, 256
	mov	w0, w20
	bl	MEM_Phy2Vir
	mov	x21, x0
	cbz	x0, .L201
	ldr	w0, [x27, 24]
	mov	w23, 0
	cbz	w0, .L132
	ldr	w0, [x27, 16]
	ubfiz	w1, w0, 3, 4
	and	w22, w0, -16
	ldr	w0, [x29, 140]
	and	w0, w0, -16777216
	str	w0, [x29, 140]
	lsr	w0, w0, 24
	ldrb	w2, [x27, 6]
	add	w1, w1, w2
	bfi	w0, w1, 0, 7
	strb	w0, [x29, 143]
	ldr	x0, [x28, 856]
	ldr	w1, [x28, 864]
	sub	x0, x21, x0
	cmp	x0, x1
	bge	.L202
	ldr	w3, [x29, 140]
	str	w3, [x21]
.L134:
	ldr	x2, .LC66
	mov	w1, 498
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x29, 120]
	mov	w3, 0
	sub	w22, w22, w0
	add	x0, x21, 1
	bfi	w3, w22, 0, 24
	str	w3, [x29, 140]
	ldr	x1, [x28, 856]
	sub	x0, x0, x1
	ldr	w1, [x28, 864]
	cmp	x0, x1
	blt	.L135
	mov	w0, 1
	str	w0, [x28, 852]
.L136:
	ldr	x2, .LC68
	mov	w1, 504
	mov	w0, 5
	bl	dprint_normal
	ldr	w22, [x27, 20]
	str	wzr, [x29, 140]
	ubfiz	w1, w22, 3, 4
	ldrb	w0, [x27, 7]
	ldr	x2, [x28, 856]
	add	w0, w1, w0
	add	x1, x21, 2
	sub	x1, x1, x2
	ldr	w2, [x28, 864]
	cmp	x1, x2
	mov	w1, 0
	bfi	w1, w0, 0, 7
	strb	w1, [x29, 143]
	blt	.L137
	ldr	w3, [x29, 140]
	mov	w0, 1
	str	w0, [x28, 852]
.L138:
	ldr	x2, .LC70
	mov	w1, 513
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 140]
	ldr	w1, [x27, 20]
	mov	w0, 0
	cbz	w1, .L139
	ldr	w1, [x29, 120]
	and	w0, w22, -16
	sub	w0, w0, w1
	and	w0, w0, 16777215
.L139:
	ldr	w3, [x29, 140]
	bfi	w3, w0, 0, 24
	str	w3, [x29, 140]
	add	x0, x21, 3
	ldr	x1, [x28, 856]
	sub	x0, x0, x1
	ldr	w1, [x28, 864]
	cmp	x0, x1
	blt	.L140
	mov	w0, 1
	str	w0, [x28, 852]
.L141:
	ldr	x2, .LC72
	mov	w1, 519
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 140]
	ldrb	w1, [x27, 5]
	mov	w0, 0
	bfi	w0, w1, 0, 5
	ldrb	w1, [x27, 4]
	bfi	w0, w1, 5, 2
	strb	w0, [x29, 140]
	ldrb	w1, [x27, 3]
	ldrh	w0, [x29, 140]
	bfi	w0, w1, 7, 3
	strh	w0, [x29, 140]
	lsr	x0, x0, 8
	ldrb	w1, [x27, 1]
	ldr	x2, [x28, 856]
	bfi	w0, w1, 2, 3
	ldrb	w1, [x27, 2]
	bfi	w0, w1, 5, 3
	add	x1, x21, 4
	strb	w0, [x29, 141]
	sub	x1, x1, x2
	ldr	w0, [x28, 864]
	cmp	x1, x0
	blt	.L142
	ldr	w3, [x29, 140]
	mov	w0, 1
	str	w0, [x28, 852]
.L143:
	ldr	x2, .LC74
	mov	w1, 529
	mov	w0, 5
	bl	dprint_normal
	ldr	x1, [x28, 856]
	add	x0, x21, 5
	str	wzr, [x29, 140]
	sub	x0, x0, x1
	ldr	w1, [x28, 864]
	cmp	x0, x1
	blt	.L144
	mov	w0, 1
	str	w0, [x28, 852]
.L145:
	ldr	x2, .LC76
	mov	w3, 0
	mov	w1, 535
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x27, 24]
	mov	w3, 0
	sub	w0, w0, #1
	bfi	w3, w0, 0, 20
	str	w3, [x29, 140]
	add	x0, x21, 6
	ldr	x1, [x28, 856]
	sub	x0, x0, x1
	ldr	w1, [x28, 864]
	cmp	x0, x1
	blt	.L146
	mov	w0, 1
	str	w0, [x28, 852]
.L147:
	ldr	x2, .LC78
	mov	w1, 542
	mov	w0, 5
	bl	dprint_normal
	ldr	x1, [x28, 856]
	add	x0, x21, 7
	add	w3, w19, 288
	str	w3, [x29, 140]
	sub	x0, x0, x1
	ldr	w1, [x28, 864]
	cmp	x0, x1
	blt	.L148
	mov	w0, 1
	str	w0, [x28, 852]
.L149:
	ldr	x2, .LC80
	mov	w1, 548
	mov	w0, 5
	mov	w23, 1
	bl	dprint_normal
.L132:
	ldr	w0, [x29, 124]
	cmp	w0, wzr
	ble	.L184
	lsl	w0, w23, 3
	add	w1, w20, w23, lsl 5
	mov	w19, 0
	str	w1, [x29, 108]
	sxtw	x0, w0
	str	x0, [x29, 112]
	.p2align 2
.L183:
	sxtw	x22, w19
	cmp	w19, wzr
	lsl	x7, x22, 3
	sub	x7, x7, x22
	add	x25, x27, x7, lsl 2
	ble	.L152
	ldr	w0, [x25, -4]
	ldr	w1, [x25, 24]
	cmp	w1, w0
	bls	.L153
.L152:
	ldr	w1, [x25, 16]
	lsl	w20, w19, 3
	ldr	x3, [x29, 112]
	ldr	w0, [x25, 8]
	ubfiz	w4, w1, 3, 4
	ldrb	w2, [x25, 6]
	add	x20, x3, x20, sxtw
	ldr	x8, [x28, 856]
	mov	w3, 0
	bfi	w3, w0, 0, 24
	add	w2, w4, w2
	add	x0, x21, x20
	ldr	w4, [x28, 864]
	sub	x0, x0, x8
	str	w3, [x29, 140]
	mov	w3, 0
	cmp	x0, x4
	bfi	w3, w2, 0, 7
	strb	w3, [x29, 143]
	and	w26, w1, -16
	blt	.L154
	ldr	w3, [x29, 140]
	mov	w0, 1
	str	w0, [x28, 852]
.L155:
	ldr	x2, .LC66
	mov	w1, 568
	mov	w0, 5
	bl	dprint_normal
	ldr	x8, [x28, 856]
	add	x0, x20, 1
	ldr	w1, [x29, 120]
	add	x0, x21, x0
	ldr	w2, [x28, 864]
	mov	w3, 0
	sub	w1, w26, w1
	sub	x0, x0, x8
	bfi	w3, w1, 0, 24
	cmp	x0, x2
	str	w3, [x29, 140]
	blt	.L156
	mov	w0, 1
	str	w0, [x28, 852]
.L157:
	ldr	x2, .LC68
	mov	w1, 574
	mov	w0, 5
	bl	dprint_normal
	ldr	w26, [x25, 20]
	ldrb	w1, [x25, 7]
	add	x0, x20, 2
	ldr	w3, [x25, 12]
	ubfiz	w2, w26, 3, 4
	add	w1, w2, w1
	ldr	x8, [x28, 856]
	mov	w2, 0
	add	x0, x21, x0
	bfi	w2, w3, 0, 24
	ldr	w3, [x28, 864]
	sub	x0, x0, x8
	str	w2, [x29, 140]
	mov	w2, 0
	cmp	x0, x3
	bfi	w2, w1, 0, 7
	strb	w2, [x29, 143]
	blt	.L158
	ldr	w3, [x29, 140]
	mov	w0, 1
	str	w0, [x28, 852]
.L159:
	ldr	x2, .LC70
	mov	w1, 583
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 140]
	ldr	w0, [x25, 20]
	mov	w1, 0
	cbz	w0, .L160
	ldr	w0, [x29, 120]
	and	w4, w26, -16
	sub	w1, w4, w0
	and	w1, w1, 16777215
.L160:
	ldr	x4, [x28, 856]
	add	x0, x20, 3
	ldr	w2, [x28, 864]
	add	x0, x21, x0
	ldr	w3, [x29, 140]
	sub	x0, x0, x4
	cmp	x0, x2
	bfi	w3, w1, 0, 24
	str	w3, [x29, 140]
	blt	.L161
	mov	w0, 1
	str	w0, [x28, 852]
.L162:
	ldr	x2, .LC72
	mov	w1, 589
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 140]
	ldrb	w2, [x25, 5]
	mov	w0, 0
	ldrb	w1, [x25, 4]
	bfi	w0, w2, 0, 5
	ldrb	w4, [x25, 3]
	bfi	w0, w1, 5, 2
	strb	w0, [x29, 140]
	ldr	x1, [x28, 856]
	add	x0, x20, 4
	ldrh	w2, [x29, 140]
	add	x0, x21, x0
	ldrb	w8, [x25, 1]
	sub	x0, x0, x1
	bfi	w2, w4, 7, 3
	ldrb	w3, [x25, 2]
	ldr	w4, [x28, 864]
	lsr	x1, x2, 8
	bfi	w1, w8, 2, 3
	strh	w2, [x29, 140]
	bfi	w1, w3, 5, 3
	cmp	x0, x4
	strb	w1, [x29, 141]
	blt	.L163
	ldr	w3, [x29, 140]
	mov	w0, 1
	str	w0, [x28, 852]
.L164:
	ldr	x2, .LC74
	mov	w1, 599
	mov	w0, 5
	bl	dprint_normal
	ldr	x4, [x28, 856]
	add	x0, x20, 5
	ldr	w2, [x25, 24]
	add	x0, x21, x0
	ldr	w1, [x28, 864]
	mov	w3, 0
	sub	x0, x0, x4
	bfi	w3, w2, 0, 20
	cmp	x0, x1
	str	w3, [x29, 140]
	blt	.L165
	mov	w0, 1
	str	w0, [x28, 852]
.L166:
	ldr	x2, .LC76
	mov	w1, 605
	mov	w0, 5
	add	w26, w19, 1
	bl	dprint_normal
	ldrh	w0, [x24, 152]
	ldrh	w2, [x24, 154]
	ldr	w3, [x24, 14532]
	mul	w2, w0, w2
	cmp	w3, w26
	sub	w8, w2, #1
	ble	.L167
	sxtw	x9, w26
	ldr	w7, [x25, 24]
	lsl	x0, x9, 3
	sub	x0, x0, x9
	add	x0, x27, x0, lsl 2
	ldr	w10, [x0, 24]
	cmp	w7, w10
	bcc	.L190
	mov	w1, w26
	b	.L170
	.p2align 3
.L172:
	sub	x0, x0, x2
	add	x0, x27, x0, lsl 2
	ldr	w0, [x0, 24]
	cmp	w7, w0
	bcc	.L168
.L170:
	add	w1, w1, 1
	cmp	w3, w1
	sxtw	x2, w1
	lsl	x0, x2, 3
	bgt	.L172
	cmp	w3, w1
	mov	w2, 0
	beq	.L203
.L185:
	lsl	x0, x9, 3
	and	w2, w2, 1048575
	sub	x9, x0, x9
	add	x9, x27, x9, lsl 2
	ldr	w10, [x9, 24]
	cmp	w7, w10
	bcs	.L175
	b	.L173
	.p2align 3
.L177:
	sub	x0, x0, x1
	add	x0, x27, x0, lsl 2
	ldr	w0, [x0, 24]
	cmp	w0, w7
	bhi	.L173
.L175:
	add	w26, w26, 1
	cmp	w26, w3
	sxtw	x1, w26
	lsl	x0, x1, 3
	blt	.L177
.L200:
	mov	w19, 0
.L176:
	cmp	w3, w26
	csel	w25, w19, wzr, ne
	mov	w19, w25
.L178:
	ldr	x8, [x28, 856]
	add	x0, x20, 6
	ldr	w1, [x28, 864]
	add	x0, x21, x0
	mov	w3, 0
	sub	x0, x0, x8
	bfi	w3, w2, 0, 20
	cmp	x0, x1
	str	w3, [x29, 140]
	blt	.L179
	mov	w0, 1
	str	w0, [x28, 852]
.L180:
	ldr	x2, .LC78
	mov	w1, 614
	mov	w0, 5
	add	x20, x20, 7
	add	x20, x21, x20
	bl	dprint_normal
	str	w19, [x29, 140]
	ldr	x0, [x28, 856]
	ldr	w1, [x28, 864]
	sub	x0, x20, x0
	cmp	x0, x1
	blt	.L181
	mov	w0, 1
	str	w0, [x28, 852]
.L182:
	ldr	x2, .LC80
	mov	w3, w19
	mov	w1, 620
	mov	w0, 5
	sub	w19, w26, #1
	bl	dprint_normal
.L153:
	ldr	w0, [x29, 124]
	add	w19, w19, 1
	cmp	w0, w19
	bgt	.L183
.L184:
	mov	w0, 0
.L199:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L165:
	add	x0, x22, x23, sxtw
	lsl	x0, x0, 5
	add	x0, x0, 20
	str	w3, [x21, x0]
	b	.L166
	.p2align 3
.L163:
	add	x0, x22, x23, sxtw
	ldr	w3, [x29, 140]
	lsl	x0, x0, 5
	add	x0, x0, 16
	str	w3, [x21, x0]
	b	.L164
	.p2align 3
.L161:
	add	x0, x22, x23, sxtw
	lsl	x0, x0, 5
	add	x0, x0, 12
	str	w3, [x21, x0]
	b	.L162
	.p2align 3
.L158:
	add	x0, x22, x23, sxtw
	ldr	w3, [x29, 140]
	lsl	x0, x0, 5
	add	x0, x0, 8
	str	w3, [x21, x0]
	b	.L159
	.p2align 3
.L156:
	add	x0, x22, x23, sxtw
	lsl	x0, x0, 5
	add	x0, x0, 4
	str	w3, [x21, x0]
	b	.L157
	.p2align 3
.L154:
	add	x0, x22, x23, sxtw
	ldr	w3, [x29, 140]
	lsl	x0, x0, 5
	str	w3, [x21, x0]
	b	.L155
	.p2align 3
.L181:
	add	x0, x22, x23, sxtw
	lsl	x0, x0, 5
	add	x0, x0, 28
	str	w25, [x21, x0]
	b	.L182
	.p2align 3
.L179:
	add	x0, x22, x23, sxtw
	lsl	x0, x0, 5
	add	x0, x0, 24
	str	w3, [x21, x0]
	b	.L180
.L190:
	mov	w0, w10
	mov	w1, w26
	.p2align 2
.L168:
	sub	w2, w0, #1
	cmp	w2, w8
	csel	w2, w2, w8, ls
	cmp	w3, w1
	bne	.L185
.L203:
	cmp	w7, w10
	and	w2, w8, 1048575
	bcs	.L175
	.p2align 2
.L173:
	ldr	w0, [x29, 108]
	add	w19, w0, w26, lsl 5
	b	.L176
.L202:
	mov	w0, 1
	ldr	w3, [x29, 140]
	str	w0, [x28, 852]
	b	.L134
.L167:
	mov	w2, 0
	bne	.L200
	and	w2, w8, 1048575
	mov	w25, 0
	mov	w19, 0
	b	.L178
.L137:
	ldr	w3, [x29, 140]
	str	w3, [x21, 8]
	b	.L138
.L135:
	str	w3, [x21, 4]
	b	.L136
.L148:
	str	w3, [x21, 28]
	b	.L149
.L146:
	str	w3, [x21, 24]
	b	.L147
.L144:
	str	wzr, [x21, 20]
	b	.L145
.L142:
	ldr	w3, [x29, 140]
	str	w3, [x21, 16]
	b	.L143
.L140:
	str	w3, [x21, 12]
	b	.L141
.L201:
	ldr	x3, .LC62
	mov	w1, 484
	ldr	x2, .LC64
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L199
	.size	MP4HAL_WriteSlicMsg, .-MP4HAL_WriteSlicMsg
	.align	3
.LC61:
	.xword	g_HwMem
	.align	3
.LC62:
	.xword	.LANCHOR0
	.align	3
.LC64:
	.xword	.LC63
	.align	3
.LC66:
	.xword	.LC65
	.align	3
.LC68:
	.xword	.LC67
	.align	3
.LC70:
	.xword	.LC69
	.align	3
.LC72:
	.xword	.LC71
	.align	3
.LC74:
	.xword	.LC73
	.align	3
.LC76:
	.xword	.LC75
	.align	3
.LC78:
	.xword	.LC77
	.align	3
.LC80:
	.xword	.LC79
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4HAL_StartDec
	.type	MP4HAL_StartDec, %function
MP4HAL_StartDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	mov	w1, w20
	mov	x0, x19
	bl	MP4HAL_CfgDnMsg
	cbnz	w0, .L209
	mov	w1, w20
	mov	x0, x19
	bl	MP4HAL_WriteSlicMsg
	mov	w1, 0
	cbnz	w0, .L210
.L206:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L209:
	ldr	x2, .LC82
	mov	w1, 35
	mov	w0, 0
	bl	dprint_normal
	mov	w1, -1
	b	.L206
	.p2align 3
.L210:
	ldr	x2, .LC84
	mov	w1, 43
	mov	w0, 0
	bl	dprint_normal
	mov	w1, -1
	b	.L206
	.size	MP4HAL_StartDec, .-MP4HAL_StartDec
	.align	3
.LC82:
	.xword	.LC81
	.align	3
.LC84:
	.xword	.LC83
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.7685, %object
	.size	__func__.7685, 20
__func__.7685:
	.string	"MP4HAL_WriteSlicMsg"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC1:
	ASCII(.string	"line: %d ,pMsgBlock = NULL is not expected value!\n" )
	.zero	5
.LC3:
	ASCII(.string	"D0=0x%x\n" )
	.zero	7
.LC5:
	ASCII(.string	"D1=0x%x\n" )
	.zero	7
.LC7:
	ASCII(.string	"D2=0x%x\n" )
	.zero	7
.LC9:
	ASCII(.string	"D3=0x%x\n" )
	.zero	7
.LC11:
	ASCII(.string	"D4=0x%x\n" )
	.zero	7
.LC13:
	ASCII(.string	"D5=0x%x\n" )
	.zero	7
.LC15:
	ASCII(.string	"D6=0x%x\n" )
	.zero	7
.LC17:
	ASCII(.string	"D7=0x%x\n" )
	.zero	7
.LC19:
	ASCII(.string	"D8=0x%x\n" )
	.zero	7
.LC21:
	ASCII(.string	"D9=0x%x\n" )
	.zero	7
.LC23:
	ASCII(.string	"D10=0x%x\n" )
	.zero	6
.LC25:
	ASCII(.string	"D11=0x%x\n" )
	.zero	6
.LC27:
	ASCII(.string	"D12= 0x%x\n" )
	.zero	5
.LC29:
	ASCII(.string	"D13= 0x%x\n" )
	.zero	5
.LC31:
	ASCII(.string	"D14= 0x%x\n" )
	.zero	5
.LC33:
	ASCII(.string	"D15= 0x%x\n" )
	.zero	5
.LC35:
	ASCII(.string	"D16= 0x%x\n" )
	.zero	5
.LC37:
	ASCII(.string	"D17= 0x%x\n" )
	.zero	5
.LC39:
	ASCII(.string	"D18= 0x%x\n" )
	.zero	5
.LC41:
	ASCII(.string	"D19= 0x%x\n" )
	.zero	5
.LC43:
	ASCII(.string	"D20= 0x%x\n" )
	.zero	5
.LC45:
	ASCII(.string	"D21= 0x%x\n" )
	.zero	5
.LC47:
	ASCII(.string	"D22= 0x%x\n" )
	.zero	5
.LC49:
	ASCII(.string	"D23= 0x%x\n" )
	.zero	5
.LC51:
	ASCII(.string	"D24= 0x%x\n" )
	.zero	5
.LC53:
	ASCII(.string	"D25= 0x%x\n" )
	.zero	5
.LC55:
	ASCII(.string	"D26= 0x%x\n" )
	.zero	5
.LC57:
	ASCII(.string	"D27= 0x%x\n" )
	.zero	5
.LC59:
	ASCII(.string	"D63= 0x%x\n" )
	.zero	5
.LC63:
	ASCII(.string	"%s: SlcDnMsgVirAddr = NULL\n" )
	.zero	4
.LC65:
	ASCII(.string	"D0 = %#x \n" )
	.zero	5
.LC67:
	ASCII(.string	"D1 = %#x \n" )
	.zero	5
.LC69:
	ASCII(.string	"D2 = %#x \n" )
	.zero	5
.LC71:
	ASCII(.string	"D3 = %#x \n" )
	.zero	5
.LC73:
	ASCII(.string	"D4 = %#x \n" )
	.zero	5
.LC75:
	ASCII(.string	"D5 = %#x \n" )
	.zero	5
.LC77:
	ASCII(.string	"D6 = %#x \n" )
	.zero	5
.LC79:
	ASCII(.string	"D7 = %#x \n" )
	.zero	5
.LC81:
	ASCII(.string	"MP4HAL_CfgDnMsg failed!\n" )
	.zero	7
.LC83:
	ASCII(.string	"MP4HAL_WriteSlicMsg failed!\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
