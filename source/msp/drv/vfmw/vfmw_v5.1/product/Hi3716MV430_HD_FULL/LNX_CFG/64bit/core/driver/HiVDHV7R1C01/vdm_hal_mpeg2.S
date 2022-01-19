#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal_mpeg2.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	MP2HAL_WriteSliceMsg
	.type	MP2HAL_WriteSliceMsg, %function
MP2HAL_WriteSliceMsg:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	w23, w2
	bl	_mcount
	str	wzr, [x29, 124]
	add	x0, x19, 45056
	add	x5, x19, 240
	ldr	w25, [x19, 196]
	ldr	w26, [x0, 240]
	cmp	w26, wzr
	ble	.L20
	sub	w0, w26, #1
	ldr	x28, .LC2
	mov	x27, x5
	mov	x22, x20
	mov	w21, 0
	mov	w24, 1
	str	w0, [x29, 108]
	b	.L16
	.p2align 3
.L22:
	ldr	w3, [x29, 124]
	str	w24, [x28, 852]
.L4:
	ldr	x2, .LC4
	mov	w1, 32
	mov	w0, 5
	bl	dprint_normal
	ldr	w1, [x27]
	add	x0, x19, 1
	ldr	x6, [x28, 856]
	add	x0, x20, x0
	ldr	w2, [x28, 864]
	and	w1, w1, -16
	mov	w3, 0
	sub	w1, w1, w25
	sub	x0, x0, x6
	bfi	w3, w1, 0, 24
	cmp	x0, x2
	str	w3, [x29, 124]
	blt	.L5
	str	w24, [x28, 852]
.L6:
	ldr	x2, .LC6
	mov	w1, 39
	mov	w0, 5
	bl	dprint_normal
	ldr	w1, [x27, 4]
	add	x0, x19, 2
	ldr	w2, [x27, 20]
	mov	w3, 0
	ldr	w8, [x27, 12]
	add	x0, x20, x0
	ldr	x7, [x28, 856]
	ubfiz	w1, w1, 3, 4
	ldr	w6, [x28, 864]
	add	w1, w1, w2
	bfi	w3, w8, 0, 24
	mov	w2, 0
	sub	x0, x0, x7
	str	w3, [x29, 124]
	bfi	w2, w1, 0, 7
	cmp	x0, x6
	strb	w2, [x29, 127]
	blt	.L7
	ldr	w3, [x29, 124]
	str	w24, [x28, 852]
.L8:
	ldr	x2, .LC8
	mov	w1, 47
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x27, 4]
	cbz	w0, .L9
	and	w0, w0, -16
	mov	w1, 0
	sub	w0, w0, w25
	bfi	w1, w0, 0, 24
	str	w1, [x29, 124]
.L10:
	add	x0, x19, 3
	ldr	x2, [x28, 856]
	add	x0, x20, x0
	ldr	w1, [x28, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L11
	ldr	w3, [x29, 124]
	str	w24, [x28, 852]
.L12:
	ldr	x2, .LC10
	mov	w1, 63
	mov	w0, 5
	add	x19, x19, 7
	add	x19, x20, x19
	bl	dprint_normal
	ldr	w2, [x29, 108]
	ldr	x1, [x28, 856]
	ldr	w0, [x28, 864]
	cmp	w21, w2
	sub	x19, x19, x1
	csel	w3, w23, wzr, ne
	cmp	x19, x0
	str	w3, [x29, 124]
	blt	.L14
	str	w24, [x28, 852]
.L15:
	ldr	x2, .LC12
	mov	w1, 78
	mov	w0, 5
	add	w21, w21, 1
	add	x27, x27, 44
	add	x22, x22, 32
	bl	dprint_normal
	add	w23, w23, 32
	cmp	w26, w21
	beq	.L20
.L16:
	lsl	w19, w21, 3
	ldr	w1, [x27]
	ldr	w2, [x27, 16]
	mov	w3, 0
	ldr	w8, [x27, 8]
	sxtw	x19, w19
	ldr	x7, [x28, 856]
	add	x0, x20, x19
	ldr	w6, [x28, 864]
	ubfiz	w1, w1, 3, 4
	add	w1, w1, w2
	bfi	w3, w8, 0, 24
	mov	w2, 0
	sub	x0, x0, x7
	str	w3, [x29, 124]
	bfi	w2, w1, 0, 7
	cmp	x0, x6
	strb	w2, [x29, 127]
	bge	.L22
	ldr	w3, [x29, 124]
	str	w3, [x22]
	b	.L4
	.p2align 3
.L14:
	str	w3, [x22, 28]
	b	.L15
	.p2align 3
.L11:
	ldr	w3, [x29, 124]
	str	w3, [x22, 12]
	b	.L12
	.p2align 3
.L9:
	str	wzr, [x29, 124]
	b	.L10
	.p2align 3
.L7:
	ldr	w3, [x29, 124]
	str	w3, [x22, 8]
	b	.L8
	.p2align 3
.L5:
	str	w3, [x22, 4]
	b	.L6
	.p2align 3
.L20:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, 0
	ldp	x29, x30, [sp], 128
	ret
	.size	MP2HAL_WriteSliceMsg, .-MP2HAL_WriteSliceMsg
	.align	3
.LC2:
	.xword	g_HwMem
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2HAL_CfgDnMsg
	.type	MP2HAL_CfgDnMsg, %function
MP2HAL_CfgDnMsg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	str	wzr, [x29, 60]
	cbz	x19, .L56
	ldr	w0, [x20, 40]
	bl	MEM_Phy2Vir
	mov	x22, x0
	cbz	x0, .L57
	ldr	x21, .LC21
	ldrh	w2, [x19, 146]
	ldrh	w0, [x29, 62]
	ldrh	w1, [x19, 150]
	sub	w2, w2, #1
	ldrh	w3, [x29, 60]
	bfi	w0, w2, 0, 9
	ldr	x8, [x21, 856]
	sub	w1, w1, #1
	ldr	w2, [x19, 176]
	bfi	w3, w1, 0, 9
	ldr	w7, [x21, 864]
	sub	x1, x22, x8
	strh	w0, [x29, 62]
	lsr	x0, x0, 8
	bfi	w0, w2, 1, 1
	strh	w3, [x29, 60]
	strb	w0, [x29, 63]
	cmp	x1, x7
	bge	.L58
	ldr	w0, [x29, 60]
	str	w0, [x22]
	ldr	w7, [x21, 864]
	ldr	x8, [x21, 856]
.L28:
	ldrb	w2, [x19]
	mov	w0, 0
	ldrb	w3, [x19, 3]
	mov	w1, 0
	bfi	w0, w2, 0, 3
	ldrb	w2, [x19, 2]
	ldrb	w4, [x19, 5]
	bfi	w1, w3, 0, 2
	bfi	w0, w2, 3, 1
	ldrb	w3, [x19, 1]
	mov	w2, 0
	bfi	w2, w4, 0, 1
	bfi	w0, w3, 4, 1
	strb	w2, [x29, 60]
	add	x2, x22, 1
	strb	w0, [x29, 63]
	sub	x2, x2, x8
	cmp	x2, x7
	mov	w0, 0
	ldrb	w3, [x19, 4]
	ldrb	w2, [x19, 7]
	bfi	w1, w3, 2, 1
	strb	w1, [x29, 61]
	bfi	w0, w2, 0, 1
	strb	w0, [x29, 62]
	blt	.L29
	mov	w0, 1
	str	w0, [x21, 852]
.L30:
	ldrb	w1, [x19, 12]
	mov	w0, 0
	ldrb	w4, [x19, 15]
	mov	w2, 0
	bfi	w0, w1, 0, 4
	ldrb	w1, [x19, 6]
	ldrb	w3, [x19, 14]
	bfi	w2, w4, 0, 4
	bfi	w0, w1, 7, 1
	strb	w0, [x29, 63]
	strb	w2, [x29, 60]
	mov	w2, 0
	bfi	w2, w3, 0, 4
	add	x1, x22, 2
	ldrb	w3, [x19, 13]
	sub	x1, x1, x8
	mov	w0, 0
	strb	w2, [x29, 61]
	bfi	w0, w3, 0, 4
	cmp	x1, x7
	strb	w0, [x29, 62]
	blt	.L31
	mov	w0, 1
	str	w0, [x21, 852]
.L32:
	ldrb	w2, [x19, 11]
	mov	w0, 0
	ldrb	w1, [x19, 10]
	bfi	w0, w2, 0, 2
	ldrb	w4, [x19, 9]
	mov	w2, 0
	ldrb	w3, [x19, 8]
	bfi	w2, w1, 0, 1
	mov	w1, 0
	bfi	w1, w4, 0, 1
	strb	w0, [x29, 60]
	add	x0, x22, 3
	strb	w1, [x29, 62]
	sub	x0, x0, x8
	mov	w1, 0
	bfi	w1, w3, 0, 1
	strb	w2, [x29, 61]
	cmp	x0, x7
	strb	w1, [x29, 63]
	blt	.L33
	mov	w0, 1
	str	w0, [x21, 852]
.L34:
	add	x0, x22, 4
	ldr	w1, [x19, 180]
	sub	x0, x0, x8
	cmp	x0, x7
	blt	.L35
	mov	w0, 1
	str	w0, [x21, 852]
.L36:
	add	x0, x22, 5
	ldr	w1, [x19, 184]
	sub	x0, x0, x8
	cmp	x0, x7
	blt	.L37
	mov	w0, 1
	str	w0, [x21, 852]
.L38:
	add	x0, x22, 6
	ldr	w1, [x19, 208]
	sub	x0, x0, x8
	cmp	x0, x7
	blt	.L39
	mov	w0, 1
	str	w0, [x21, 852]
.L40:
	add	x0, x22, 7
	ldr	w1, [x19, 228]
	sub	x0, x0, x8
	cmp	x0, x7
	blt	.L41
	mov	w0, 1
	str	w0, [x21, 852]
.L42:
	add	x12, x22, 128
	mov	x11, 16
	mov	w10, 0
	mov	w14, 1
	.p2align 2
.L43:
	mov	w1, w10
	add	x6, x22, x11
	add	w13, w10, 16
	mov	x9, x12
.L48:
	add	w4, w1, 16
	add	w3, w1, 32
	add	w0, w1, 48
	sxtw	x5, w1
	sxtw	x4, w4
	sxtw	x3, w3
	sxtw	x0, w0
	add	x17, x19, x5
	add	x16, x19, x4
	add	x15, x19, x3
	add	x18, x19, x0
	sub	x2, x6, x8
	ldrb	w17, [x17, 80]
	cmp	x2, x7
	ldrb	w16, [x16, 80]
	ldrb	w15, [x15, 80]
	ldrb	w2, [x18, 80]
	strb	w17, [x29, 60]
	strb	w16, [x29, 61]
	strb	w15, [x29, 62]
	strb	w2, [x29, 63]
	blt	.L44
	str	w14, [x21, 852]
.L45:
	add	x2, x19, x0
	add	x5, x19, x5
	add	x4, x19, x4
	add	x3, x19, x3
	add	x0, x6, 16
	ldrb	w5, [x5, 16]
	sub	x0, x0, x8
	ldrb	w4, [x4, 16]
	cmp	x0, x7
	ldrb	w3, [x3, 16]
	ldrb	w2, [x2, 16]
	strb	w5, [x29, 60]
	strb	w4, [x29, 61]
	strb	w3, [x29, 62]
	strb	w2, [x29, 63]
	blt	.L46
	str	w14, [x21, 852]
.L47:
	add	w1, w1, 8
	add	x6, x6, 1
	cmp	w13, w1
	add	x9, x9, 4
	bne	.L48
	add	w10, w10, 1
	add	x11, x11, 2
	cmp	w10, 8
	add	x12, x12, 8
	bne	.L43
	add	x0, x22, 48
	ldr	w1, [x20, 900]
	sub	x8, x0, x8
	str	w1, [x29, 60]
	cmp	x8, x7
	blt	.L50
	mov	w0, 1
	str	w0, [x21, 852]
.L51:
	ldr	w20, [x20, 40]
	and	w20, w20, -16
	add	w20, w20, 256
	mov	w0, w20
	bl	MEM_Phy2Vir
	cbz	x0, .L59
	ldr	x3, [x21, 856]
	add	x2, x22, 63
	ldr	w1, [x21, 864]
	sub	x2, x2, x3
	str	w20, [x29, 60]
	cmp	x2, x1
	blt	.L53
	mov	w1, 1
	str	w1, [x21, 852]
.L54:
	mov	x1, x0
	mov	w2, w20
	mov	x0, x19
	bl	MP2HAL_WriteSliceMsg
	mov	w0, 0
.L25:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L58:
	mov	w0, 1
	str	w0, [x21, 852]
	b	.L28
	.p2align 3
.L46:
	ldr	w0, [x29, 60]
	str	w0, [x9]
	ldr	w7, [x21, 864]
	ldr	x8, [x21, 856]
	b	.L47
	.p2align 3
.L44:
	ldr	w2, [x29, 60]
	str	w2, [x9, -64]
	ldr	w7, [x21, 864]
	ldr	x8, [x21, 856]
	b	.L45
	.p2align 3
.L29:
	ldr	w0, [x29, 60]
	str	w0, [x22, 4]
	ldr	w7, [x21, 864]
	ldr	x8, [x21, 856]
	b	.L30
	.p2align 3
.L41:
	str	w1, [x22, 28]
	ldr	w7, [x21, 864]
	ldr	x8, [x21, 856]
	b	.L42
	.p2align 3
.L39:
	str	w1, [x22, 24]
	ldr	w7, [x21, 864]
	ldr	x8, [x21, 856]
	b	.L40
	.p2align 3
.L37:
	str	w1, [x22, 20]
	ldr	w7, [x21, 864]
	ldr	x8, [x21, 856]
	b	.L38
	.p2align 3
.L35:
	str	w1, [x22, 16]
	ldr	w7, [x21, 864]
	ldr	x8, [x21, 856]
	b	.L36
	.p2align 3
.L33:
	ldr	w0, [x29, 60]
	str	w0, [x22, 12]
	ldr	w7, [x21, 864]
	ldr	x8, [x21, 856]
	b	.L34
	.p2align 3
.L31:
	ldr	w0, [x29, 60]
	str	w0, [x22, 8]
	ldr	w7, [x21, 864]
	ldr	x8, [x21, 856]
	b	.L32
	.p2align 3
.L53:
	str	w20, [x22, 252]
	b	.L54
	.p2align 3
.L50:
	str	w1, [x22, 192]
	b	.L51
.L56:
	ldr	x4, .LC15
	mov	w1, 92
	ldr	x3, .LC16
	mov	w0, 0
	ldr	x2, .LC18
	bl	dprint_normal
	mov	w0, -1
	b	.L25
.L57:
	ldr	x4, .LC20
	mov	w1, 95
	ldr	x3, .LC16
	mov	w0, 0
	ldr	x2, .LC18
	bl	dprint_normal
	mov	w0, -1
	b	.L25
.L59:
	ldr	x2, .LC23
	mov	w1, 173
	bl	dprint_normal
	mov	w0, -1
	b	.L25
	.size	MP2HAL_CfgDnMsg, .-MP2HAL_CfgDnMsg
	.align	3
.LC15:
	.xword	.LC14
	.align	3
.LC16:
	.xword	.LANCHOR0
	.align	3
.LC18:
	.xword	.LC17
	.align	3
.LC20:
	.xword	.LC19
	.align	3
.LC21:
	.xword	g_HwMem
	.align	3
.LC23:
	.xword	.LC22
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2HAL_StartDec
	.type	MP2HAL_StartDec, %function
MP2HAL_StartDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	sxtw	x3, w19
	ldr	x1, .LC24
	lsl	x0, x3, 7
	mov	w2, w19
	sub	x3, x0, x3
	mov	x0, x20
	add	x1, x1, x3, lsl 3
	bl	MP2HAL_CfgDnMsg
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2HAL_StartDec, .-MP2HAL_StartDec
	.align	3
.LC24:
	.xword	g_HwMem
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.10294, %object
	.size	__func__.10294, 16
__func__.10294:
	.string	"MP2HAL_CfgDnMsg"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC3:
	ASCII(.string	"D0 = %#x \n" )
	.zero	5
.LC5:
	ASCII(.string	"D1 = %#x \n" )
	.zero	5
.LC7:
	ASCII(.string	"D2 = %#x \n" )
	.zero	5
.LC9:
	ASCII(.string	"D3 = %#x \n" )
	.zero	5
.LC11:
	ASCII(.string	"D7 = %#x \n" )
	.zero	5
.LC14:
	ASCII(.string	"pDecParam is null!\n" )
	.zero	4
.LC17:
	ASCII(.string	"%s: %s\n" )
.LC19:
	ASCII(.string	"can not map down msg virtual address!" )
	.zero	2
.LC22:
	ASCII(.string	"Map SlcDnMsgPhyAddr to SlcDnMsgVirAddr is NULL \n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
