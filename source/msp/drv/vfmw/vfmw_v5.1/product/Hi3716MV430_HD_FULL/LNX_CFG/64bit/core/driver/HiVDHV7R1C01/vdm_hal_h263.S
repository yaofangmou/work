#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal_h263.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	H263HAL_Log2bin
	.type	H263HAL_Log2bin, %function
H263HAL_Log2bin:
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
	.size	H263HAL_Log2bin, .-H263HAL_Log2bin
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263HAL_CfgDnMsg
	.type	H263HAL_CfgDnMsg, %function
H263HAL_CfgDnMsg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	sxtw	x23, w1
	mov	w20, 0
	bl	_mcount
	ldrh	w0, [x21, 158]
	ldrh	w1, [x21, 160]
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
	mov	x22, x0
	cbz	x0, .L118
	ldrb	w0, [x21, 2]
	cmp	w0, 1
	beq	.L119
	ldr	x0, [x19, 856]
	ldr	w1, [x19, 864]
	sub	x0, x22, x0
	cmp	x0, x1
	bge	.L120
	str	wzr, [x22]
.L23:
	ldr	x2, .LC4
	mov	w3, 0
	mov	w1, 126
	mov	w0, 5
	bl	dprint_normal
	ldr	x4, [x19, 856]
	add	x0, x22, 4
	ldr	w2, [x19, 864]
	ldrb	w3, [x21, 3]
	sub	x0, x0, x4
	ldrb	w1, [x21, 1]
	cmp	x0, x2
	ubfiz	w3, w3, 26, 5
	orr	w3, w3, w1, lsl 31
	blt	.L24
	mov	w0, 1
	ldr	x2, .LC6
	str	w0, [x19, 852]
	mov	w1, 133
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x21]
	cmp	w0, 2
	beq	.L26
.L129:
	ldrb	w3, [x21, 16]
	ubfiz	w3, w3, 3, 1
.L27:
	ldrb	w2, [x21, 19]
	ubfiz	w1, w0, 5, 2
	ldr	w4, [x21, 14572]
	ubfiz	w20, w20, 22, 4
	and	w2, w2, 1
	ldr	w5, [x21, 14580]
	ubfiz	w4, w4, 26, 2
	ldrb	w0, [x21, 15]
	orr	w4, w4, w2
	ldr	w2, [x21, 14576]
	ubfiz	w5, w5, 28, 2
	ubfiz	w0, w0, 4, 1
	orr	w0, w0, w1
	ldrb	w1, [x21, 13]
	orr	w5, w5, w2, lsl 30
	ldrb	w2, [x21, 18]
	orr	w5, w4, w5
	ubfiz	w1, w1, 8, 3
	ubfiz	w4, w2, 1, 1
	ldrb	w2, [x21, 17]
	ubfiz	w2, w2, 2, 1
	orr	w2, w4, w2
	orr	w4, w5, w2
	ldrb	w2, [x21, 14]
	orr	w0, w4, w0
	ldrb	w4, [x21, 11]
	ubfiz	w2, w2, 7, 1
	ldr	x5, [x19, 856]
	orr	w2, w2, w1
	ldrb	w1, [x21, 12]
	orr	w0, w0, w2
	ubfiz	w2, w4, 11, 3
	ubfiz	w1, w1, 14, 3
	ldrb	w4, [x21, 10]
	orr	w1, w2, w1
	add	x2, x22, 8
	orr	w0, w0, w1
	ldr	w1, [x19, 864]
	ubfiz	w4, w4, 17, 5
	sub	x2, x2, x5
	orr	w20, w4, w20
	cmp	x2, x1
	orr	w0, w0, w20
	orr	w3, w0, w3
	blt	.L28
	mov	w0, 1
	ldr	x2, .LC8
	str	w0, [x19, 852]
	mov	w1, 158
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x21]
	cmp	w0, 2
	beq	.L121
.L21:
	ldr	x0, [x19, 856]
	add	x2, x22, 16
	ldrh	w3, [x21, 160]
	ldrh	w1, [x21, 158]
	sub	x2, x2, x0
	ldr	w4, [x19, 864]
	sub	w0, w3, #1
	sub	w1, w1, #1
	cmp	x2, x4
	and	w3, w1, 65535
	orr	w3, w3, w0, lsl 16
	blt	.L32
	mov	w0, 1
	str	w0, [x19, 852]
.L33:
	ldr	x2, .LC12
	mov	w1, 176
	mov	w0, 5
	bl	dprint_normal
	ldr	x3, [x19, 856]
	add	x0, x22, 20
	ldr	w2, [x19, 864]
	sub	x0, x0, x3
	ldr	w1, [x21, 14564]
	ldr	w3, [x21, 14568]
	cmp	x0, x2
	orr	w3, w3, w1, lsl 16
	blt	.L34
	mov	w0, 1
	ldr	x2, .LC14
	str	w0, [x19, 852]
	mov	w1, 183
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x21]
	cmp	w0, 3
	beq	.L122
.L36:
	ldr	x2, [x19, 856]
	add	x0, x22, 32
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L50
	mov	w0, 1
	str	w0, [x19, 852]
.L51:
	ldr	x2, .LC20
	mov	w1, 228
	mov	w3, 0
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 36
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L52
	mov	w0, 1
	str	w0, [x19, 852]
.L53:
	ldr	x2, .LC22
	mov	w1, 234
	mov	w3, 0
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 40
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L54
	mov	w0, 1
	str	w0, [x19, 852]
.L55:
	ldr	x2, .LC24
	mov	w1, 240
	mov	w3, 0
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 44
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L56
	mov	w0, 1
	str	w0, [x19, 852]
.L57:
	ldr	x2, .LC26
	mov	w3, 0
	mov	w1, 246
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 48
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x21, 14540]
	cmp	x0, x1
	blt	.L58
	mov	w0, 1
	str	w0, [x19, 852]
.L59:
	ldr	x2, .LC28
	mov	w1, 254
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 52
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x21, 180]
	cmp	x0, x1
	blt	.L60
	mov	w0, 1
	str	w0, [x19, 852]
.L61:
	ldr	x2, .LC30
	mov	w1, 260
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 56
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x21, 184]
	cmp	x0, x1
	blt	.L62
	mov	w0, 1
	str	w0, [x19, 852]
.L63:
	ldr	x2, .LC32
	mov	w1, 266
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 60
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x21, 188]
	cmp	x0, x1
	blt	.L64
	mov	w0, 1
	str	w0, [x19, 852]
.L65:
	ldr	x2, .LC34
	mov	w1, 272
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 64
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x21, 192]
	cmp	x0, x1
	blt	.L66
	mov	w0, 1
	str	w0, [x19, 852]
.L67:
	ldr	x2, .LC36
	mov	w1, 278
	mov	w0, 5
	bl	dprint_normal
	lsl	x0, x23, 7
	ldr	x3, [x19, 856]
	sub	x0, x0, x23
	add	x1, x22, 68
	ldr	w2, [x19, 864]
	sub	x1, x1, x3
	add	x0, x19, x0, lsl 3
	cmp	x1, x2
	ldr	w3, [x0, 876]
	blt	.L68
	mov	w0, 1
	str	w0, [x19, 852]
.L69:
	ldr	x2, .LC38
	mov	w1, 284
	mov	w0, 5
	bl	dprint_normal
	lsl	x0, x23, 7
	ldr	x3, [x19, 856]
	sub	x0, x0, x23
	add	x1, x22, 72
	ldr	w2, [x19, 864]
	sub	x1, x1, x3
	add	x0, x19, x0, lsl 3
	cmp	x1, x2
	ldr	w3, [x0, 900]
	blt	.L70
	mov	w0, 1
	ldr	x2, .LC40
	str	w0, [x19, 852]
	mov	w1, 290
	mov	w0, 5
	bl	dprint_normal
	strb	wzr, [x21, 153]
	ldrb	w0, [x21]
	cmp	w0, 3
	beq	.L123
.L72:
	ldrb	w0, [x21, 149]
	strb	w0, [x21, 148]
	and	w0, w0, 1
	lsl	w3, w0, 3
.L74:
	ldr	x5, [x19, 856]
	add	x4, x22, 76
	ldrb	w2, [x21, 152]
	orr	w0, w3, w0, lsl 2
	sub	x4, x4, x5
	ldrb	w1, [x21, 151]
	ldr	w5, [x19, 864]
	ubfiz	w2, w2, 1, 1
	and	w1, w1, 1
	cmp	x4, x5
	orr	w1, w2, w1
	orr	w3, w1, w0
	blt	.L75
	mov	w0, 1
	str	w0, [x19, 852]
.L76:
	ldr	x2, .LC42
	mov	w1, 320
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 80
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x21, 14584]
	cmp	x0, x1
	blt	.L77
	mov	w0, 1
	str	w0, [x19, 852]
.L78:
	ldr	x2, .LC44
	mov	w1, 326
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 84
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x21, 14588]
	cmp	x0, x1
	blt	.L79
	mov	w0, 1
	str	w0, [x19, 852]
.L80:
	ldr	x2, .LC46
	mov	w1, 332
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 88
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x21, 14592]
	cmp	x0, x1
	blt	.L81
	mov	w0, 1
	str	w0, [x19, 852]
.L82:
	ldr	x2, .LC48
	mov	w1, 338
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 92
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x21, 14596]
	cmp	x0, x1
	blt	.L83
	mov	w0, 1
	str	w0, [x19, 852]
.L84:
	ldr	x2, .LC50
	mov	w1, 344
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 96
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x21, 14600]
	cmp	x0, x1
	blt	.L85
	mov	w0, 1
	str	w0, [x19, 852]
.L86:
	ldr	x2, .LC52
	mov	w1, 350
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 100
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x21, 14604]
	cmp	x0, x1
	blt	.L87
	mov	w0, 1
	str	w0, [x19, 852]
.L88:
	ldr	x2, .LC54
	mov	w1, 356
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 104
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x21, 14608]
	cmp	x0, x1
	blt	.L89
	mov	w0, 1
	str	w0, [x19, 852]
.L90:
	ldr	x2, .LC56
	mov	w1, 362
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x22, 108
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x21, 14612]
	cmp	x0, x1
	blt	.L91
	mov	w0, 1
	ldr	x2, .LC58
	str	w0, [x19, 852]
	mov	w1, 368
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x21, 2]
	cmp	w0, 2
	beq	.L124
.L93:
	ldr	w5, [x19, 864]
	ldr	x6, [x19, 856]
.L103:
	add	x0, x22, 240
	sub	x0, x0, x6
	cmp	x0, x5
	blt	.L104
	mov	w0, 1
	str	w0, [x19, 852]
.L105:
	lsl	x0, x23, 7
	add	x1, x22, 252
	sub	x23, x0, x23
	sub	x0, x1, x6
	cmp	x0, x5
	add	x23, x19, x23, lsl 3
	ldr	w3, [x23, 40]
	add	w3, w3, 256
	blt	.L106
	mov	w0, 1
	str	w0, [x19, 852]
.L107:
	ldr	x2, .LC60
	mov	w1, 386
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
.L120:
	mov	w0, 1
	str	w0, [x19, 852]
	b	.L23
	.p2align 3
.L106:
	str	w3, [x22, 252]
	b	.L107
	.p2align 3
.L104:
	lsl	x0, x23, 7
	sub	x0, x0, x23
	add	x0, x19, x0, lsl 3
	ldr	w0, [x0, 896]
	str	w0, [x22, 240]
	ldr	w5, [x19, 864]
	ldr	x6, [x19, 856]
	b	.L105
	.p2align 3
.L91:
	ldr	x2, .LC58
	mov	w1, 368
	str	w3, [x22, 108]
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x21, 2]
	cmp	w0, 2
	bne	.L93
.L124:
	ldrb	w0, [x21, 1]
	cbz	w0, .L93
	ldr	w3, [x19, 864]
	add	x9, x21, 20
	ldr	x2, [x19, 856]
	mov	w6, 0
	mov	w11, 1
	.p2align 2
.L94:
	mov	w1, w6
	lsl	w5, w6, 3
	add	w10, w6, 16
.L97:
	sxtw	x0, w5
	sxtw	x8, w1
	add	x0, x0, 112
	add	x7, x9, x8
	add	x4, x22, x0
	sub	x4, x4, x2
	cmp	x4, x3
	blt	.L95
	str	w11, [x19, 852]
.L96:
	add	w1, w1, 8
	add	w5, w5, 4
	cmp	w1, w10
	bne	.L97
	add	w6, w6, 1
	cmp	w6, 8
	bne	.L94
	add	x0, x21, 84
	mov	w11, 64
	mov	w8, 0
	mov	w13, 1
	.p2align 2
.L99:
	mov	w4, w8
	add	w12, w8, 16
	mov	w7, w11
.L102:
	sxtw	x1, w7
	sxtw	x10, w4
	add	x1, x1, 112
	add	x9, x0, x10
	add	x5, x22, x1
	mov	x6, x2
	sub	x5, x5, x2
	cmp	x5, x3
	mov	x5, x3
	blt	.L100
	str	w13, [x19, 852]
.L101:
	add	w4, w4, 8
	add	w7, w7, 4
	cmp	w12, w4
	bne	.L102
	add	w8, w8, 1
	add	w11, w11, 8
	cmp	w8, 8
	bne	.L99
	b	.L103
	.p2align 3
.L89:
	str	w3, [x22, 104]
	b	.L90
	.p2align 3
.L87:
	str	w3, [x22, 100]
	b	.L88
	.p2align 3
.L85:
	str	w3, [x22, 96]
	b	.L86
	.p2align 3
.L83:
	str	w3, [x22, 92]
	b	.L84
	.p2align 3
.L81:
	str	w3, [x22, 88]
	b	.L82
	.p2align 3
.L79:
	str	w3, [x22, 84]
	b	.L80
	.p2align 3
.L77:
	str	w3, [x22, 80]
	b	.L78
	.p2align 3
.L75:
	str	w3, [x22, 76]
	b	.L76
	.p2align 3
.L70:
	ldr	x2, .LC40
	mov	w1, 290
	str	w3, [x22, 72]
	mov	w0, 5
	bl	dprint_normal
	strb	wzr, [x21, 153]
	ldrb	w0, [x21]
	cmp	w0, 3
	bne	.L72
.L123:
	ldr	w0, [x21, 14576]
	cmp	w0, 1
	beq	.L125
	bhi	.L72
	ldrb	w0, [x21, 148]
	ldrb	w1, [x21, 149]
	ubfiz	w3, w0, 3, 1
	and	w0, w1, 1
	b	.L74
	.p2align 3
.L68:
	str	w3, [x22, 68]
	b	.L69
	.p2align 3
.L66:
	str	w3, [x22, 64]
	b	.L67
	.p2align 3
.L64:
	str	w3, [x22, 60]
	b	.L65
	.p2align 3
.L62:
	str	w3, [x22, 56]
	b	.L63
	.p2align 3
.L60:
	str	w3, [x22, 52]
	b	.L61
	.p2align 3
.L58:
	str	w3, [x22, 48]
	b	.L59
	.p2align 3
.L56:
	str	wzr, [x22, 44]
	b	.L57
	.p2align 3
.L54:
	str	wzr, [x22, 40]
	b	.L55
	.p2align 3
.L52:
	str	wzr, [x22, 36]
	b	.L53
	.p2align 3
.L50:
	str	wzr, [x22, 32]
	b	.L51
	.p2align 3
.L34:
	ldr	x2, .LC14
	mov	w1, 183
	str	w3, [x22, 20]
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x21]
	cmp	w0, 3
	bne	.L36
.L122:
	ldr	w0, [x21, 14576]
	cmp	w0, 1
	bne	.L36
	ldrb	w1, [x21, 150]
	ldrb	w3, [x21, 15]
	cmp	w1, 1
	beq	.L126
	ldr	w1, [x21, 14600]
	add	x2, x22, 24
	lsl	w1, w1, w3
	ldr	w3, [x21, 14580]
	lsl	w0, w0, w3
	cbnz	w1, .L127
	asr	w0, w0, 1
	sub	w0, w0, #1
	lsr	w3, w0, w3
.L43:
	ldr	x0, [x19, 856]
	ldr	w1, [x19, 864]
	sub	x0, x2, x0
	cmp	x0, x1
	blt	.L44
	mov	w0, 1
	str	w0, [x19, 852]
.L45:
	ldr	x2, .LC16
	mov	w1, 210
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x21, 14604]
	add	x2, x22, 28
	ldrb	w1, [x21, 15]
	ldr	w3, [x21, 14580]
	lsl	w1, w0, w1
	mov	w0, 1
	lsl	w0, w0, w3
	cbz	w1, .L46
	add	w0, w1, w0, asr 1
	lsr	w3, w0, w3
.L47:
	ldr	x0, [x19, 856]
	ldr	w1, [x19, 864]
	sub	x0, x2, x0
	cmp	x0, x1
	blt	.L48
	mov	w0, 1
	str	w0, [x19, 852]
.L49:
	ldr	x2, .LC18
	mov	w1, 217
	mov	w0, 5
	bl	dprint_normal
	b	.L36
	.p2align 3
.L32:
	str	w3, [x22, 16]
	b	.L33
	.p2align 3
.L28:
	ldr	x2, .LC8
	mov	w1, 158
	str	w3, [x22, 8]
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x21]
	cmp	w0, 2
	bne	.L21
.L121:
	ldr	x4, [x19, 856]
	add	x0, x22, 12
	ldr	w2, [x19, 864]
	ldp	w3, w1, [x21, 164]
	sub	x0, x0, x4
	cmp	x0, x2
	ubfiz	w3, w3, 1, 15
	orr	w3, w3, w1, lsl 17
	bge	.L128
	str	w3, [x22, 12]
.L31:
	ldr	x2, .LC10
	mov	w1, 167
	mov	w0, 5
	bl	dprint_normal
	b	.L21
	.p2align 3
.L24:
	ldr	x2, .LC6
	mov	w1, 133
	str	w3, [x22, 4]
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x21]
	cmp	w0, 2
	bne	.L129
.L26:
	strb	wzr, [x21, 16]
	mov	w3, 0
	b	.L27
	.p2align 3
.L119:
	ldrb	w1, [x21, 156]
	ldrb	w0, [x21, 9]
	ubfiz	w0, w0, 3, 1
	cbz	w1, .L13
	mov	w3, 20
	ldr	w1, [x19, 864]
	orr	w3, w0, w3
	ldr	x0, [x19, 856]
	sub	x0, x22, x0
	cmp	x0, x1
	blt	.L15
.L130:
	mov	w0, 1
	str	w0, [x19, 852]
.L16:
	ldr	x2, .LC4
	mov	w1, 102
	mov	w0, 5
	bl	dprint_normal
	ldrh	w4, [x21, 4]
	add	x1, x22, 4
	ldrh	w0, [x21, 6]
	ubfiz	w4, w4, 5, 9
	ldrb	w3, [x21, 8]
	ubfiz	w0, w0, 14, 9
	ldr	x5, [x19, 856]
	orr	w0, w4, w0
	ldrb	w2, [x21, 3]
	ldr	w4, [x19, 864]
	sub	w3, w3, #1
	sub	x1, x1, x5
	and	w3, w3, 31
	ubfiz	w2, w2, 26, 5
	cmp	x1, x4
	orr	w2, w3, w2
	orr	w3, w2, w0
	blt	.L17
	mov	w0, 1
	str	w0, [x19, 852]
.L18:
	ldr	x2, .LC6
	mov	w1, 111
	mov	w0, 5
	bl	dprint_normal
	ldr	x4, [x19, 856]
	add	x1, x22, 8
	ldr	w3, [x19, 864]
	ldrb	w2, [x21]
	sub	x1, x1, x4
	ldrb	w0, [x21, 16]
	cmp	x1, x3
	ubfiz	w2, w2, 5, 2
	ubfiz	w3, w20, 22, 4
	ubfiz	w0, w0, 3, 1
	orr	w0, w2, w0
	orr	w3, w0, w3
	blt	.L19
	mov	w0, 1
	str	w0, [x19, 852]
.L20:
	ldr	x2, .LC8
	mov	w1, 119
	mov	w0, 5
	bl	dprint_normal
	b	.L21
	.p2align 3
.L13:
	mov	w3, 52
	ldr	w1, [x19, 864]
	orr	w3, w0, w3
	ldr	x0, [x19, 856]
	sub	x0, x22, x0
	cmp	x0, x1
	bge	.L130
.L15:
	str	w3, [x22]
	b	.L16
.L128:
	mov	w0, 1
	str	w0, [x19, 852]
	b	.L31
	.p2align 3
.L100:
	ldrb	w5, [x9, 32]
	ldrb	w2, [x9, 48]
	ldrb	w3, [x9, 16]
	ldrb	w6, [x0, x10]
	lsl	w2, w2, 24
	orr	w2, w2, w5, lsl 16
	orr	w3, w6, w3, lsl 8
	orr	w2, w2, w3
	str	w2, [x22, x1]
	ldr	w3, [x19, 864]
	ldr	x2, [x19, 856]
	mov	x5, x3
	mov	x6, x2
	b	.L101
	.p2align 3
.L95:
	ldrb	w4, [x7, 32]
	ldrb	w2, [x7, 48]
	ldrb	w3, [x7, 16]
	ldrb	w8, [x9, x8]
	lsl	w2, w2, 24
	orr	w2, w2, w4, lsl 16
	orr	w3, w8, w3, lsl 8
	orr	w2, w2, w3
	str	w2, [x22, x0]
	ldr	w3, [x19, 864]
	ldr	x2, [x19, 856]
	b	.L96
	.p2align 3
.L19:
	str	w3, [x22, 8]
	b	.L20
	.p2align 3
.L17:
	str	w3, [x22, 4]
	b	.L18
.L125:
	ldrb	w1, [x21, 149]
	mov	w3, 8
	strb	w0, [x21, 148]
	and	w0, w1, 1
	b	.L74
.L127:
	add	w0, w1, w0, asr 1
	lsr	w3, w0, w3
	b	.L43
.L48:
	str	w3, [x22, 28]
	b	.L49
.L46:
	asr	w0, w0, 1
	sub	w0, w0, #1
	lsr	w3, w0, w3
	b	.L47
.L44:
	str	w3, [x22, 24]
	b	.L45
.L126:
	ldr	w0, [x21, 14580]
	add	x2, x22, 24
	ldr	x5, [x19, 856]
	ldr	w4, [x19, 864]
	sub	w0, w0, w3
	sub	x2, x2, x5
	ldr	w3, [x21, 14600]
	lsl	w0, w1, w0
	cmp	x2, x4
	sdiv	w3, w3, w0
	blt	.L38
	str	w1, [x19, 852]
.L39:
	ldr	x2, .LC16
	mov	w1, 195
	mov	w0, 5
	bl	dprint_normal
	ldrb	w2, [x21, 15]
	add	x1, x22, 28
	ldr	w0, [x21, 14580]
	ldr	x5, [x19, 856]
	ldr	w4, [x19, 864]
	sub	w0, w0, w2
	ldr	w3, [x21, 14604]
	mov	w2, 1
	sub	x1, x1, x5
	lsl	w0, w2, w0
	cmp	x1, x4
	sdiv	w3, w3, w0
	blt	.L40
	str	w2, [x19, 852]
.L41:
	ldr	x2, .LC18
	mov	w1, 201
	mov	w0, 5
	bl	dprint_normal
	b	.L36
.L38:
	str	w3, [x22, 24]
	b	.L39
.L40:
	str	w3, [x22, 28]
	b	.L41
.L118:
	mov	w3, 84
	ldr	x2, .LC2
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L11
	.size	H263HAL_CfgDnMsg, .-H263HAL_CfgDnMsg
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
	.global	H263HAL_WriteSlicMsg
	.type	H263HAL_WriteSlicMsg, %function
H263HAL_WriteSlicMsg:
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
	add	x27, x24, 200
	bl	_mcount
	ldr	x28, .LC61
	sxtw	x1, w19
	str	wzr, [x29, 140]
	lsl	x0, x1, 7
	sub	x0, x0, x1
	ldr	w1, [x24, 14536]
	str	w1, [x29, 124]
	add	x0, x28, x0, lsl 3
	ldr	w1, [x24, 196]
	str	w1, [x29, 120]
	ldr	w19, [x0, 40]
	add	w20, w19, 256
	mov	w0, w20
	bl	MEM_Phy2Vir
	mov	x21, x0
	cbz	x0, .L203
	ldr	w0, [x27, 16]
	mov	w23, 0
	cbz	w0, .L134
	ldr	w0, [x27, 20]
	ubfiz	w1, w0, 3, 4
	and	w22, w0, -16
	ldr	w0, [x29, 140]
	and	w0, w0, -16777216
	str	w0, [x29, 140]
	lsr	w0, w0, 24
	ldrb	w2, [x27, 5]
	add	w1, w1, w2
	bfi	w0, w1, 0, 7
	strb	w0, [x29, 143]
	ldr	x0, [x28, 856]
	ldr	w1, [x28, 864]
	sub	x0, x21, x0
	cmp	x0, x1
	bge	.L204
	ldr	w3, [x29, 140]
	str	w3, [x21]
.L136:
	ldr	x2, .LC66
	mov	w1, 478
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
	blt	.L137
	mov	w0, 1
	str	w0, [x28, 852]
.L138:
	ldr	x2, .LC68
	mov	w1, 484
	mov	w0, 5
	bl	dprint_normal
	ldr	w22, [x27, 24]
	str	wzr, [x29, 140]
	ubfiz	w1, w22, 3, 4
	ldrb	w0, [x27, 6]
	ldr	x2, [x28, 856]
	add	w0, w1, w0
	add	x1, x21, 2
	sub	x1, x1, x2
	ldr	w2, [x28, 864]
	cmp	x1, x2
	mov	w1, 0
	bfi	w1, w0, 0, 7
	strb	w1, [x29, 143]
	blt	.L139
	ldr	w3, [x29, 140]
	mov	w0, 1
	str	w0, [x28, 852]
.L140:
	ldr	x2, .LC70
	mov	w1, 493
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 140]
	ldr	w1, [x27, 24]
	mov	w0, 0
	cbz	w1, .L141
	ldr	w1, [x29, 120]
	and	w0, w22, -16
	sub	w0, w0, w1
	and	w0, w0, 16777215
.L141:
	ldr	w3, [x29, 140]
	bfi	w3, w0, 0, 24
	str	w3, [x29, 140]
	add	x0, x21, 3
	ldr	x1, [x28, 856]
	sub	x0, x0, x1
	ldr	w1, [x28, 864]
	cmp	x0, x1
	blt	.L142
	mov	w0, 1
	str	w0, [x28, 852]
.L143:
	ldr	x2, .LC72
	mov	w1, 499
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 140]
	ldrb	w1, [x27, 4]
	mov	w0, 0
	bfi	w0, w1, 0, 5
	ldrb	w1, [x27, 3]
	bfi	w0, w1, 5, 2
	strb	w0, [x29, 140]
	ldrb	w1, [x27, 2]
	ldrh	w0, [x29, 140]
	bfi	w0, w1, 7, 3
	strh	w0, [x29, 140]
	lsr	x0, x0, 8
	ldrb	w1, [x24, 200]
	ldr	x2, [x28, 856]
	bfi	w0, w1, 2, 3
	ldrb	w1, [x27, 1]
	bfi	w0, w1, 5, 3
	add	x1, x21, 4
	strb	w0, [x29, 141]
	sub	x1, x1, x2
	ldr	w0, [x28, 864]
	cmp	x1, x0
	blt	.L144
	ldr	w3, [x29, 140]
	mov	w0, 1
	str	w0, [x28, 852]
.L145:
	ldr	x2, .LC74
	mov	w1, 509
	mov	w0, 5
	bl	dprint_normal
	ldr	x1, [x28, 856]
	add	x0, x21, 5
	str	wzr, [x29, 140]
	sub	x0, x0, x1
	ldr	w1, [x28, 864]
	cmp	x0, x1
	blt	.L146
	mov	w0, 1
	str	w0, [x28, 852]
.L147:
	ldr	x2, .LC76
	mov	w3, 0
	mov	w1, 515
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x27, 16]
	mov	w3, 0
	sub	w0, w0, #1
	bfi	w3, w0, 0, 20
	str	w3, [x29, 140]
	add	x0, x21, 6
	ldr	x1, [x28, 856]
	sub	x0, x0, x1
	ldr	w1, [x28, 864]
	cmp	x0, x1
	blt	.L148
	mov	w0, 1
	str	w0, [x28, 852]
.L149:
	ldr	x2, .LC78
	mov	w1, 522
	mov	w0, 5
	bl	dprint_normal
	ldr	x1, [x28, 856]
	add	x0, x21, 7
	add	w3, w19, 288
	str	w3, [x29, 140]
	sub	x0, x0, x1
	ldr	w1, [x28, 864]
	cmp	x0, x1
	blt	.L150
	mov	w0, 1
	str	w0, [x28, 852]
.L151:
	ldr	x2, .LC80
	mov	w1, 528
	mov	w0, 5
	mov	w23, 1
	bl	dprint_normal
.L134:
	ldr	w0, [x29, 124]
	cmp	w0, wzr
	ble	.L186
	lsl	w0, w23, 3
	add	w1, w20, w23, lsl 5
	mov	w19, 0
	str	w1, [x29, 108]
	sxtw	x0, w0
	str	x0, [x29, 112]
	.p2align 2
.L185:
	sxtw	x22, w19
	cmp	w19, wzr
	lsl	x7, x22, 3
	sub	x7, x7, x22
	add	x25, x27, x7, lsl 2
	ble	.L154
	ldr	w0, [x25, -12]
	ldr	w1, [x25, 16]
	cmp	w1, w0
	bls	.L155
.L154:
	ldr	w1, [x25, 20]
	lsl	w20, w19, 3
	ldr	x3, [x29, 112]
	ldr	w0, [x25, 8]
	ubfiz	w4, w1, 3, 4
	ldrb	w2, [x25, 5]
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
	blt	.L156
	ldr	w3, [x29, 140]
	mov	w0, 1
	str	w0, [x28, 852]
.L157:
	ldr	x2, .LC66
	mov	w1, 548
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
	blt	.L158
	mov	w0, 1
	str	w0, [x28, 852]
.L159:
	ldr	x2, .LC68
	mov	w1, 554
	mov	w0, 5
	bl	dprint_normal
	ldr	w26, [x25, 24]
	ldrb	w1, [x25, 6]
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
	blt	.L160
	ldr	w3, [x29, 140]
	mov	w0, 1
	str	w0, [x28, 852]
.L161:
	ldr	x2, .LC70
	mov	w1, 563
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 140]
	ldr	w0, [x25, 24]
	mov	w1, 0
	cbz	w0, .L162
	ldr	w0, [x29, 120]
	and	w4, w26, -16
	sub	w1, w4, w0
	and	w1, w1, 16777215
.L162:
	ldr	x4, [x28, 856]
	add	x0, x20, 3
	ldr	w2, [x28, 864]
	add	x0, x21, x0
	ldr	w3, [x29, 140]
	sub	x0, x0, x4
	cmp	x0, x2
	bfi	w3, w1, 0, 24
	str	w3, [x29, 140]
	blt	.L163
	mov	w0, 1
	str	w0, [x28, 852]
.L164:
	ldr	x2, .LC72
	mov	w1, 569
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 140]
	ldrb	w2, [x25, 4]
	mov	w0, 0
	ldrb	w1, [x25, 3]
	bfi	w0, w2, 0, 5
	ldrb	w4, [x25, 2]
	bfi	w0, w1, 5, 2
	strb	w0, [x29, 140]
	ldr	x1, [x28, 856]
	add	x0, x20, 4
	ldrh	w2, [x29, 140]
	add	x0, x21, x0
	ldrb	w8, [x25]
	sub	x0, x0, x1
	bfi	w2, w4, 7, 3
	ldrb	w3, [x25, 1]
	ldr	w4, [x28, 864]
	lsr	x1, x2, 8
	bfi	w1, w8, 2, 3
	strh	w2, [x29, 140]
	bfi	w1, w3, 5, 3
	cmp	x0, x4
	strb	w1, [x29, 141]
	blt	.L165
	ldr	w3, [x29, 140]
	mov	w0, 1
	str	w0, [x28, 852]
.L166:
	ldr	x2, .LC74
	mov	w1, 579
	mov	w0, 5
	bl	dprint_normal
	ldr	x4, [x28, 856]
	add	x0, x20, 5
	ldr	w2, [x25, 16]
	add	x0, x21, x0
	ldr	w1, [x28, 864]
	mov	w3, 0
	sub	x0, x0, x4
	bfi	w3, w2, 0, 20
	cmp	x0, x1
	str	w3, [x29, 140]
	blt	.L167
	mov	w0, 1
	str	w0, [x28, 852]
.L168:
	ldr	x2, .LC76
	mov	w1, 585
	mov	w0, 5
	add	w26, w19, 1
	bl	dprint_normal
	ldrh	w0, [x24, 158]
	ldrh	w2, [x24, 160]
	ldr	w3, [x24, 14536]
	mul	w2, w0, w2
	cmp	w3, w26
	sub	w8, w2, #1
	ble	.L169
	sxtw	x9, w26
	ldr	w7, [x25, 16]
	lsl	x0, x9, 3
	sub	x0, x0, x9
	add	x0, x27, x0, lsl 2
	ldr	w10, [x0, 16]
	cmp	w7, w10
	bcc	.L192
	mov	w1, w26
	b	.L172
	.p2align 3
.L174:
	sub	x0, x0, x2
	add	x0, x27, x0, lsl 2
	ldr	w0, [x0, 16]
	cmp	w7, w0
	bcc	.L170
.L172:
	add	w1, w1, 1
	cmp	w3, w1
	sxtw	x2, w1
	lsl	x0, x2, 3
	bgt	.L174
	cmp	w3, w1
	mov	w2, 0
	beq	.L205
.L187:
	lsl	x0, x9, 3
	and	w2, w2, 1048575
	sub	x9, x0, x9
	add	x9, x27, x9, lsl 2
	ldr	w10, [x9, 16]
	cmp	w7, w10
	bcs	.L177
	b	.L175
	.p2align 3
.L179:
	sub	x0, x0, x1
	add	x0, x27, x0, lsl 2
	ldr	w0, [x0, 16]
	cmp	w0, w7
	bhi	.L175
.L177:
	add	w26, w26, 1
	cmp	w26, w3
	sxtw	x1, w26
	lsl	x0, x1, 3
	blt	.L179
.L202:
	mov	w19, 0
.L178:
	cmp	w3, w26
	csel	w25, w19, wzr, ne
	mov	w19, w25
.L180:
	ldr	x8, [x28, 856]
	add	x0, x20, 6
	ldr	w1, [x28, 864]
	add	x0, x21, x0
	mov	w3, 0
	sub	x0, x0, x8
	bfi	w3, w2, 0, 20
	cmp	x0, x1
	str	w3, [x29, 140]
	blt	.L181
	mov	w0, 1
	str	w0, [x28, 852]
.L182:
	ldr	x2, .LC78
	mov	w1, 594
	mov	w0, 5
	add	x20, x20, 7
	add	x20, x21, x20
	bl	dprint_normal
	str	w19, [x29, 140]
	ldr	x0, [x28, 856]
	ldr	w1, [x28, 864]
	sub	x0, x20, x0
	cmp	x0, x1
	blt	.L183
	mov	w0, 1
	str	w0, [x28, 852]
.L184:
	ldr	x2, .LC80
	mov	w3, w19
	mov	w1, 600
	mov	w0, 5
	sub	w19, w26, #1
	bl	dprint_normal
.L155:
	ldr	w0, [x29, 124]
	add	w19, w19, 1
	cmp	w0, w19
	bgt	.L185
.L186:
	mov	w0, 0
.L201:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L167:
	add	x0, x22, x23, sxtw
	lsl	x0, x0, 5
	add	x0, x0, 20
	str	w3, [x21, x0]
	b	.L168
	.p2align 3
.L165:
	add	x0, x22, x23, sxtw
	ldr	w3, [x29, 140]
	lsl	x0, x0, 5
	add	x0, x0, 16
	str	w3, [x21, x0]
	b	.L166
	.p2align 3
.L163:
	add	x0, x22, x23, sxtw
	lsl	x0, x0, 5
	add	x0, x0, 12
	str	w3, [x21, x0]
	b	.L164
	.p2align 3
.L160:
	add	x0, x22, x23, sxtw
	ldr	w3, [x29, 140]
	lsl	x0, x0, 5
	add	x0, x0, 8
	str	w3, [x21, x0]
	b	.L161
	.p2align 3
.L158:
	add	x0, x22, x23, sxtw
	lsl	x0, x0, 5
	add	x0, x0, 4
	str	w3, [x21, x0]
	b	.L159
	.p2align 3
.L156:
	add	x0, x22, x23, sxtw
	ldr	w3, [x29, 140]
	lsl	x0, x0, 5
	str	w3, [x21, x0]
	b	.L157
	.p2align 3
.L183:
	add	x0, x22, x23, sxtw
	lsl	x0, x0, 5
	add	x0, x0, 28
	str	w25, [x21, x0]
	b	.L184
	.p2align 3
.L181:
	add	x0, x22, x23, sxtw
	lsl	x0, x0, 5
	add	x0, x0, 24
	str	w3, [x21, x0]
	b	.L182
.L192:
	mov	w0, w10
	mov	w1, w26
	.p2align 2
.L170:
	sub	w2, w0, #1
	cmp	w2, w8
	csel	w2, w2, w8, ls
	cmp	w3, w1
	bne	.L187
.L205:
	cmp	w7, w10
	and	w2, w8, 1048575
	bcs	.L177
	.p2align 2
.L175:
	ldr	w0, [x29, 108]
	add	w19, w0, w26, lsl 5
	b	.L178
.L204:
	mov	w0, 1
	ldr	w3, [x29, 140]
	str	w0, [x28, 852]
	b	.L136
.L169:
	mov	w2, 0
	bne	.L202
	and	w2, w8, 1048575
	mov	w25, 0
	mov	w19, 0
	b	.L180
.L139:
	ldr	w3, [x29, 140]
	str	w3, [x21, 8]
	b	.L140
.L137:
	str	w3, [x21, 4]
	b	.L138
.L150:
	str	w3, [x21, 28]
	b	.L151
.L148:
	str	w3, [x21, 24]
	b	.L149
.L146:
	str	wzr, [x21, 20]
	b	.L147
.L144:
	ldr	w3, [x29, 140]
	str	w3, [x21, 16]
	b	.L145
.L142:
	str	w3, [x21, 12]
	b	.L143
.L203:
	ldr	x3, .LC62
	mov	w1, 464
	ldr	x2, .LC64
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L201
	.size	H263HAL_WriteSlicMsg, .-H263HAL_WriteSlicMsg
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
	.global	H263HAL_StartDec
	.type	H263HAL_StartDec, %function
H263HAL_StartDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	mov	w1, w20
	mov	x0, x19
	bl	H263HAL_CfgDnMsg
	cbnz	w0, .L211
	mov	w1, w20
	mov	x0, x19
	bl	H263HAL_WriteSlicMsg
	mov	w1, 0
	cbnz	w0, .L212
.L208:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L211:
	ldr	x2, .LC82
	mov	w1, 616
	mov	w0, 0
	bl	dprint_normal
	mov	w1, -1
	b	.L208
	.p2align 3
.L212:
	ldr	x2, .LC84
	mov	w1, 624
	mov	w0, 0
	bl	dprint_normal
	mov	w1, -1
	b	.L208
	.size	H263HAL_StartDec, .-H263HAL_StartDec
	.align	3
.LC82:
	.xword	.LC81
	.align	3
.LC84:
	.xword	.LC83
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.10273, %object
	.size	__func__.10273, 21
__func__.10273:
	.string	"H263HAL_WriteSlicMsg"
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
	ASCII(.string	"H263HAL_CfgDnMsg failed!\n" )
	.zero	6
.LC83:
	ASCII(.string	"H263HAL_WriteSlicMsg failed!\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
