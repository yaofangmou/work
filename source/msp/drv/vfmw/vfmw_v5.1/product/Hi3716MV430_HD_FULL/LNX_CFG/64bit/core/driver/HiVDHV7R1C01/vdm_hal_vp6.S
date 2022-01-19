#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal_vp6.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	VP6HAL_CfgDnMsg
	.type	VP6HAL_CfgDnMsg, %function
VP6HAL_CfgDnMsg:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x22, 40]
	bl	MEM_Phy2Vir
	mov	x21, x0
	cbz	x0, .L59
	ldr	x19, .LC5
	mov	w0, 0
	ldr	w1, [x20, 116]
	str	wzr, [x29, 76]
	bfi	w0, w1, 0, 1
	strb	w0, [x29, 76]
	ldr	x0, [x19, 856]
	ldr	w1, [x19, 864]
	sub	x0, x21, x0
	cmp	x0, x1
	bge	.L60
	ldr	w3, [x29, 76]
	str	w3, [x21]
.L5:
	ldr	x2, .LC7
	mov	w1, 41
	mov	w0, 5
	bl	dprint_normal
	ldrh	w3, [x20, 108]
	mov	w2, 0
	ldrh	w4, [x20, 106]
	mov	w1, 0
	sub	w3, w3, #1
	ldr	x5, [x19, 856]
	bfi	w2, w3, 0, 9
	sub	w4, w4, #1
	ldr	w3, [x19, 864]
	add	x0, x21, 4
	bfi	w1, w4, 0, 9
	strh	w2, [x29, 78]
	strh	w1, [x29, 76]
	sub	x0, x0, x5
	ubfx	x2, x2, 8, 1
	ubfx	x1, x1, 8, 1
	strb	w2, [x29, 79]
	cmp	x0, x3
	strb	w1, [x29, 77]
	blt	.L6
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L7:
	ldr	x2, .LC9
	mov	w1, 51
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 76]
	ldp	w1, w3, [x20, 156]
	mov	w0, 0
	ldr	w4, [x20, 128]
	ldr	w2, [x20, 164]
	bfi	w0, w1, 0, 5
	bfi	w0, w3, 5, 2
	mov	w1, 0
	ldr	w3, [x20, 124]
	lsr	w2, w2, 1
	bfi	w1, w4, 0, 1
	bfi	w1, w2, 1, 1
	bfi	w0, w3, 7, 1
	strb	w1, [x29, 77]
	strb	w0, [x29, 76]
	add	x0, x21, 8
	ldr	x2, [x19, 856]
	ldr	w1, [x19, 864]
	ldr	w3, [x29, 76]
	sub	x0, x0, x2
	cmp	x0, x1
	and	w3, w3, 1023
	str	w3, [x29, 76]
	blt	.L8
	mov	w0, 1
	str	w0, [x19, 852]
.L9:
	ldr	x2, .LC11
	mov	w1, 63
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 76]
	ldr	w2, [x20, 152]
	mov	w0, 0
	ldp	w4, w1, [x20, 144]
	bfi	w0, w2, 0, 5
	ldr	w2, [x20, 140]
	bfi	w0, w1, 5, 3
	strb	w0, [x29, 76]
	ldr	w3, [x19, 864]
	add	x1, x21, 12
	ldr	w0, [x29, 76]
	ldr	x5, [x19, 856]
	bfi	w0, w4, 8, 10
	str	w0, [x29, 76]
	lsr	w0, w0, 16
	sub	x1, x1, x5
	bfi	w0, w2, 2, 2
	strb	w0, [x29, 78]
	cmp	x1, x3
	ldrh	w0, [x29, 78]
	and	w0, w0, 15
	strh	w0, [x29, 78]
	blt	.L10
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L11:
	ldr	x2, .LC13
	mov	w1, 74
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 76]
	ldrb	w1, [x20]
	mov	w0, 0
	ldp	w5, w2, [x20, 132]
	bfi	w0, w1, 0, 4
	strb	w0, [x29, 76]
	ldr	w3, [x19, 864]
	add	x1, x21, 16
	ldrh	w0, [x29, 76]
	ldr	x4, [x19, 856]
	bfi	w0, w5, 4, 8
	strh	w0, [x29, 76]
	sub	x1, x1, x4
	ldr	w0, [x29, 76]
	cmp	x1, x3
	bfi	w0, w2, 12, 9
	str	w0, [x29, 76]
	ubfx	x0, x0, 16, 5
	strh	w0, [x29, 78]
	blt	.L12
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L13:
	ldr	x2, .LC15
	mov	w1, 84
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 32
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 216]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 76]
	blt	.L14
	mov	w0, 1
	str	w0, [x19, 852]
.L15:
	ldr	x2, .LC17
	mov	w1, 91
	mov	w0, 5
	bl	dprint_normal
	str	wzr, [x29, 76]
	ldp	w3, w1, [x20, 220]
	mov	w0, 0
	ldr	x4, [x19, 856]
	bfi	w0, w1, 0, 4
	strb	w0, [x29, 78]
	ldr	w2, [x19, 864]
	add	x0, x21, 36
	ldrh	w1, [x29, 78]
	sub	x0, x0, x4
	strb	w3, [x29, 76]
	cmp	x0, x2
	and	w1, w1, 15
	strh	w1, [x29, 78]
	blt	.L16
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L17:
	ldr	x2, .LC19
	mov	w1, 101
	mov	w0, 5
	bl	dprint_normal
	ldr	w23, [x20, 176]
	ldr	w0, [x20, 224]
	ldp	w3, w1, [x20, 168]
	add	w0, w0, 8
	cmp	w0, w1
	add	w3, w0, w3
	bhi	.L18
	sub	w0, w1, w0
.L19:
	ldr	x4, [x19, 856]
	mov	w1, 0
	bfi	w1, w3, 0, 25
	add	x2, x21, 64
	ldr	w3, [x19, 864]
	sub	x2, x2, x4
	str	w1, [x29, 76]
	lsr	w1, w1, 24
	bfi	w1, w0, 1, 7
	cmp	x2, x3
	strb	w1, [x29, 79]
	blt	.L20
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L21:
	ldr	x2, .LC21
	mov	w1, 124
	mov	w0, 5
	bl	dprint_normal
	str	w23, [x29, 76]
	ldr	x2, [x19, 856]
	add	x0, x21, 68
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L22
	mov	w0, 1
	str	w0, [x19, 852]
.L23:
	ldr	x2, .LC23
	mov	w3, w23
	mov	w1, 131
	mov	w0, 5
	bl	dprint_normal
	ldp	w1, w3, [x20, 180]
	ldr	x4, [x19, 856]
	mov	w0, 0
	bfi	w0, w1, 0, 25
	ldr	w2, [x19, 864]
	add	x1, x21, 72
	str	w0, [x29, 76]
	sub	x1, x1, x4
	lsr	w0, w0, 24
	bfi	w0, w3, 1, 7
	cmp	x1, x2
	strb	w0, [x29, 79]
	blt	.L24
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L25:
	ldr	x2, .LC25
	mov	w1, 139
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 76
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 188]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 76]
	blt	.L26
	mov	w0, 1
	str	w0, [x19, 852]
.L27:
	ldr	x2, .LC27
	mov	w1, 146
	mov	w0, 5
	bl	dprint_normal
	ldp	w1, w3, [x20, 192]
	ldr	x4, [x19, 856]
	mov	w0, 0
	bfi	w0, w1, 0, 25
	ldr	w2, [x19, 864]
	add	x1, x21, 80
	str	w0, [x29, 76]
	sub	x1, x1, x4
	lsr	w0, w0, 24
	bfi	w0, w3, 1, 7
	cmp	x1, x2
	strb	w0, [x29, 79]
	blt	.L28
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L29:
	ldr	x2, .LC29
	mov	w1, 154
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 84
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 200]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 76]
	blt	.L30
	mov	w0, 1
	str	w0, [x19, 852]
.L31:
	ldr	x2, .LC31
	mov	w1, 161
	mov	w0, 5
	bl	dprint_normal
	ldp	w1, w3, [x20, 204]
	ldr	x4, [x19, 856]
	mov	w0, 0
	bfi	w0, w1, 0, 25
	ldr	w2, [x19, 864]
	add	x1, x21, 88
	str	w0, [x29, 76]
	sub	x1, x1, x4
	lsr	w0, w0, 24
	bfi	w0, w3, 1, 7
	cmp	x1, x2
	strb	w0, [x29, 79]
	blt	.L32
	ldr	w3, [x29, 76]
	mov	w0, 1
	str	w0, [x19, 852]
.L33:
	ldr	x2, .LC33
	mov	w1, 169
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 92
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 212]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 76]
	blt	.L34
	mov	w0, 1
	str	w0, [x19, 852]
.L35:
	ldr	x2, .LC35
	mov	w1, 176
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 128
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 228]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 76]
	blt	.L36
	mov	w0, 1
	str	w0, [x19, 852]
.L37:
	ldr	x2, .LC37
	mov	w1, 183
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 136
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 236]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 76]
	blt	.L38
	mov	w0, 1
	str	w0, [x19, 852]
.L39:
	ldr	x2, .LC39
	mov	w1, 190
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 140
	ldr	w1, [x19, 864]
	ldr	w3, [x20, 240]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 76]
	blt	.L40
	mov	w0, 1
	str	w0, [x19, 852]
.L41:
	ldr	x2, .LC41
	mov	w1, 197
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 144
	ldr	w1, [x19, 864]
	ldr	w3, [x22, 896]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 76]
	blt	.L42
	mov	w0, 1
	str	w0, [x19, 852]
.L43:
	ldr	x2, .LC43
	mov	w1, 203
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 148
	ldr	w1, [x19, 864]
	ldr	w3, [x22, 900]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 76]
	blt	.L44
	mov	w0, 1
	str	w0, [x19, 852]
.L45:
	ldr	x2, .LC45
	mov	w1, 210
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 152
	ldr	w1, [x19, 864]
	ldr	w3, [x22, 904]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 76]
	blt	.L46
	mov	w0, 1
	str	w0, [x19, 852]
.L47:
	ldr	x2, .LC47
	mov	w1, 217
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x21, 156
	ldr	w1, [x19, 864]
	ldr	w3, [x22, 884]
	sub	x0, x0, x2
	cmp	x0, x1
	str	w3, [x29, 76]
	blt	.L48
	mov	w0, 1
	str	w0, [x19, 852]
.L49:
	ldr	x2, .LC49
	mov	w1, 224
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x22, 884]
	bl	MEM_Phy2Vir
	mov	x21, x0
	cbz	x0, .L61
	ldr	x19, .LC52
	mov	x2, 4096
	mov	w1, 0
	ldr	x3, [x19, 96]
	blr	x3
	ldr	x3, [x19, 104]
	mov	x2, 64
	ldr	x1, [x20, 8]
	mov	x0, x21
	blr	x3
	ldr	x3, [x19, 104]
	mov	x2, 640
	ldr	x1, [x20, 16]
	add	x0, x21, 64
	blr	x3
	ldr	x3, [x19, 104]
	mov	x2, 64
	ldr	x1, [x20, 24]
	add	x0, x21, 704
	blr	x3
	ldr	w0, [x20, 128]
	cbnz	w0, .L51
	ldr	w0, [x22, 884]
	bl	MEM_Phy2Vir
	mov	x21, x0
	adds	x0, x0, 768
	mov	w3, 251
	beq	.L57
	ldr	x3, [x19, 104]
	mov	x2, 96
	ldr	x1, [x20, 56]
	blr	x3
	ldr	x3, [x19, 104]
	mov	x2, 32
	ldr	x1, [x20, 72]
	add	x0, x21, 864
	blr	x3
	ldr	x3, [x19, 104]
	mov	x2, 576
	ldr	x1, [x20, 64]
	add	x0, x21, 896
	blr	x3
.L53:
	ldr	w0, [x22, 884]
	bl	MEM_Phy2Vir
	mov	x21, x0
	adds	x0, x0, 2560
	mov	w3, 291
	beq	.L57
	ldr	x3, [x19, 104]
	mov	x2, 64
	ldr	x1, [x20, 32]
	blr	x3
	ldr	x3, [x19, 104]
	mov	x2, 64
	ldr	x1, [x20, 40]
	add	x0, x21, 2624
	blr	x3
	ldr	x3, [x19, 104]
	mov	x2, 960
	ldr	x1, [x20, 48]
	add	x0, x21, 2688
	blr	x3
	ldr	w0, [x22, 884]
	bl	MEM_Phy2Vir
	adds	x0, x0, 2816
	mov	w3, 309
	beq	.L57
	ldr	x3, [x19, 104]
	mov	x2, 960
	ldr	x1, [x20, 48]
	blr	x3
	mov	w0, 0
.L3:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L60:
	mov	w0, 1
	ldr	w3, [x29, 76]
	str	w0, [x19, 852]
	b	.L5
	.p2align 3
.L48:
	str	w3, [x21, 156]
	b	.L49
	.p2align 3
.L46:
	str	w3, [x21, 152]
	b	.L47
	.p2align 3
.L44:
	str	w3, [x21, 148]
	b	.L45
	.p2align 3
.L42:
	str	w3, [x21, 144]
	b	.L43
	.p2align 3
.L40:
	str	w3, [x21, 140]
	b	.L41
	.p2align 3
.L38:
	str	w3, [x21, 136]
	b	.L39
	.p2align 3
.L36:
	str	w3, [x21, 128]
	b	.L37
	.p2align 3
.L34:
	str	w3, [x21, 92]
	b	.L35
	.p2align 3
.L32:
	ldr	w3, [x29, 76]
	str	w3, [x21, 88]
	b	.L33
	.p2align 3
.L30:
	str	w3, [x21, 84]
	b	.L31
	.p2align 3
.L28:
	ldr	w3, [x29, 76]
	str	w3, [x21, 80]
	b	.L29
	.p2align 3
.L26:
	str	w3, [x21, 76]
	b	.L27
	.p2align 3
.L24:
	ldr	w3, [x29, 76]
	str	w3, [x21, 72]
	b	.L25
	.p2align 3
.L22:
	str	w23, [x21, 68]
	b	.L23
	.p2align 3
.L20:
	ldr	w3, [x29, 76]
	str	w3, [x21, 64]
	b	.L21
	.p2align 3
.L18:
	add	w1, w1, 128
	sub	w23, w23, #16
	sub	w0, w1, w0
	b	.L19
	.p2align 3
.L16:
	ldr	w3, [x29, 76]
	str	w3, [x21, 36]
	b	.L17
	.p2align 3
.L14:
	str	w3, [x21, 32]
	b	.L15
	.p2align 3
.L12:
	ldr	w3, [x29, 76]
	str	w3, [x21, 16]
	b	.L13
	.p2align 3
.L10:
	ldr	w3, [x29, 76]
	str	w3, [x21, 12]
	b	.L11
	.p2align 3
.L8:
	str	w3, [x21, 8]
	b	.L9
	.p2align 3
.L6:
	ldr	w3, [x29, 76]
	str	w3, [x21, 4]
	b	.L7
	.p2align 3
.L51:
	ldr	w0, [x22, 884]
	bl	MEM_Phy2Vir
	mov	x21, x0
	adds	x0, x0, 768
	beq	.L62
	ldr	x3, [x19, 104]
	mov	x2, 1536
	ldr	x1, [x20, 88]
	blr	x3
	ldr	x3, [x19, 104]
	mov	x2, 128
	ldr	x1, [x20, 80]
	add	x0, x21, 2304
	blr	x3
	ldr	x3, [x19, 104]
	mov	x2, 128
	ldr	x1, [x20, 96]
	add	x0, x21, 2432
	blr	x3
	b	.L53
.L62:
	mov	w3, 272
	.p2align 2
.L57:
	ldr	x2, .LC54
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L3
.L61:
	ldr	x3, .LC2
	mov	x4, 0
	ldr	x2, .LC51
	mov	w1, 230
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L3
.L59:
	ldr	x4, .LC1
	mov	w1, 34
	ldr	x3, .LC2
	mov	w0, 0
	ldr	x2, .LC4
	bl	dprint_normal
	mov	w0, -1
	b	.L3
	.size	VP6HAL_CfgDnMsg, .-VP6HAL_CfgDnMsg
	.align	3
.LC1:
	.xword	.LC0
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
	.align	3
.LC19:
	.xword	.LC18
	.align	3
.LC21:
	.xword	.LC20
	.align	3
.LC23:
	.xword	.LC22
	.align	3
.LC25:
	.xword	.LC24
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
.LC52:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC54:
	.xword	.LC53
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP6HAL_StartDec
	.type	VP6HAL_StartDec, %function
VP6HAL_StartDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	sxtw	x3, w19
	ldr	x1, .LC55
	lsl	x0, x3, 7
	mov	w2, w19
	sub	x3, x0, x3
	mov	x0, x20
	add	x1, x1, x3, lsl 3
	bl	VP6HAL_CfgDnMsg
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VP6HAL_StartDec, .-VP6HAL_StartDec
	.align	3
.LC55:
	.xword	g_HwMem
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.10331, %object
	.size	__func__.10331, 16
__func__.10331:
	.string	"VP6HAL_CfgDnMsg"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	ASCII(.string	"can not map down msg virtual address!" )
	.zero	2
.LC3:
	ASCII(.string	"%s: %s\n" )
.LC6:
	ASCII(.string	"D0 = 0x%x\n" )
	.zero	5
.LC8:
	ASCII(.string	"D1 = 0x%x\n" )
	.zero	5
.LC10:
	ASCII(.string	"D2 = 0x%x\n" )
	.zero	5
.LC12:
	ASCII(.string	"D3 = 0x%x\n" )
	.zero	5
.LC14:
	ASCII(.string	"D4 = 0x%x\n" )
	.zero	5
.LC16:
	ASCII(.string	"D8 = 0x%x\n" )
	.zero	5
.LC18:
	ASCII(.string	"D9 = 0x%x\n" )
	.zero	5
.LC20:
	ASCII(.string	"D16 = 0x%x\n" )
	.zero	4
.LC22:
	ASCII(.string	"D17 = 0x%x\n" )
	.zero	4
.LC24:
	ASCII(.string	"D18 = 0x%x\n" )
	.zero	4
.LC26:
	ASCII(.string	"D19 = 0x%x\n" )
	.zero	4
.LC28:
	ASCII(.string	"D20 = 0x%x\n" )
	.zero	4
.LC30:
	ASCII(.string	"D21 = 0x%x\n" )
	.zero	4
.LC32:
	ASCII(.string	"D22 = 0x%x\n" )
	.zero	4
.LC34:
	ASCII(.string	"D23 = 0x%x\n" )
	.zero	4
.LC36:
	ASCII(.string	"D32 = 0x%x\n" )
	.zero	4
.LC38:
	ASCII(.string	"D34 = 0x%x\n" )
	.zero	4
.LC40:
	ASCII(.string	"D35 = 0x%x\n" )
	.zero	4
.LC42:
	ASCII(.string	"D36 = 0x%x\n" )
	.zero	4
.LC44:
	ASCII(.string	"D37 = 0x%x\n" )
	.zero	4
.LC46:
	ASCII(.string	"D38 = 0x%x\n" )
	.zero	4
.LC48:
	ASCII(.string	"D39 = 0x%x\n" )
	.zero	4
.LC50:
	ASCII(.string	"%s: TabBaseAddr = NULL\n" )
.LC53:
	ASCII(.string	"line: %d  NULL == TabBaseAddr.\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
