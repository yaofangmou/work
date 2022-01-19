#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"mpeg4.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	log2bin
	.type	log2bin, %function
log2bin:
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
	.size	log2bin, .-log2bin
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	bs_get_spritetrajectory
	.type	bs_get_spritetrajectory, %function
bs_get_spritetrajectory:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w20, 0
	bl	_mcount
	ldr	x22, .LC3
	add	x19, x22, 4
	.p2align 2
.L10:
	ldrb	w1, [x19]
	mov	x0, x21
	add	x19, x19, 8
	bl	BsShow
	ldr	w1, [x19, -12]
	cmp	w0, w1
	beq	.L12
	add	w20, w20, 1
	cmp	w20, 12
	bne	.L10
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L12:
	add	x22, x22, x20, uxtw 3
	mov	x0, x21
	ldrb	w1, [x22, 4]
	bl	BsSkip
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	bs_get_spritetrajectory, .-bs_get_spritetrajectory
	.align	3
.LC3:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_GetGMCparam
	.type	MP4_GetGMCparam, %function
MP4_GetGMCparam:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	w9, [x20, 716]
	mov	w10, 2
	ldrb	w1, [x20, 73]
	mov	w16, 3
	ldr	w12, [x20, 712]
	lsl	w2, w9, 4
	str	w2, [x19, 8]
	lsl	w10, w10, w1
	sub	w16, w16, w1
	add	x0, x20, 512
	ldr	w1, [x20, 712]
	mov	w18, 16
	cmp	w9, 1
	sdiv	w13, w18, w10
	lsl	w1, w1, 4
	str	w1, [x19, 12]
	ldrb	w1, [x20, 73]
	str	w1, [x19, 4]
	ldrb	w17, [x20, 72]
	str	w17, [x19]
	ldp	w14, w15, [x0, 176]
	ldp	w4, w8, [x0, 184]
	ldr	w11, [x20, 704]
	ldr	w6, [x20, 708]
	ble	.L39
	mov	w2, 0
	mov	w3, 1
	.p2align 2
.L15:
	add	w2, w2, 1
	lsl	w0, w3, w2
	cmp	w9, w0
	bgt	.L15
	mov	w1, w0
	lsl	w18, w0, 4
.L14:
	cmp	w12, 1
	ble	.L40
	mov	w0, 0
	mov	w5, 1
	.p2align 2
.L17:
	add	w0, w0, 1
	lsl	w3, w5, w0
	cmp	w12, w3
	bgt	.L17
	lsl	w30, w3, 4
.L16:
	ldrb	w5, [x20, 12]
	add	w8, w15, w8
	add	w11, w14, w11
	cmp	w5, 1
	beq	.L47
	add	w5, w14, w9, lsl 1
	add	w4, w5, w4
	add	w5, w15, w12, lsl 1
	add	w6, w5, w6
	asr	w5, w10, 1
	mul	w14, w14, w5
	mul	w15, w15, w5
	mul	w4, w4, w5
	mul	w8, w8, w5
	mul	w11, w11, w5
	mul	w6, w6, w5
.L19:
	neg	w5, w9, lsl 4
	sub	w21, w9, w1
	asr	w22, w9, 1
	madd	w4, w13, w4, w5
	mul	w5, w13, w14
	mul	w7, w21, w5
	madd	w4, w4, w1, w7
	cbz	w4, .L20
	add	w4, w4, w22
.L21:
	mul	w20, w13, w15
	mul	w8, w13, w8
	mul	w11, w13, w11
	mul	w21, w21, w20
	madd	w7, w8, w1, w21
	udiv	w4, w4, w9
	asr	w8, w12, 1
	cmp	w7, wzr
	add	w7, w7, w22
	csneg	w7, w7, w22, ne
	add	w4, w4, w18
	udiv	w7, w7, w9
	sub	w9, w12, w3
	mul	w5, w5, w9
	madd	w5, w11, w3, w5
	add	w11, w5, w8
	cbnz	w5, .L25
	neg	w11, w8
.L25:
	neg	w5, w12, lsl 4
	mul	w9, w20, w9
	madd	w6, w13, w6, w5
	madd	w5, w6, w3, w9
	cmp	w5, wzr
	add	w5, w5, w8
	csneg	w5, w5, w8, ne
	cmp	w17, 3
	bls	.L48
	ldp	w4, w20, [x19, 16]
	ldp	w7, w2, [x19, 24]
	ldp	w9, w6, [x19, 32]
	ldp	w11, w8, [x19, 40]
	mov	w1, 0
	mov	w0, 0
.L34:
	lsl	w3, w10, w0
	cmp	w3, w4
	beq	.L49
.L36:
	mov	w5, 16
	sub	w0, w5, w0
	sub	w1, w5, w1
	lsl	w15, w6, w0
	lsl	w5, w9, w0
	lsl	w11, w11, w1
	lsl	w4, w4, w0
	lsl	w20, w20, w0
	lsl	w7, w7, w0
	lsl	w1, w8, w1
	lsl	w0, w2, w0
	stp	w4, w20, [x19, 16]
	stp	w7, w0, [x19, 24]
	stp	w5, w15, [x19, 32]
	stp	w11, w1, [x19, 40]
.L13:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L48:
	ldr	x6, .LC4
	ldrb	w6, [x6,w17,uxtw]
	adr	x8, .Lrtx30
	add	x6, x8, w6, sxtb #2
	br	x6
.Lrtx30:
	.section	.rodata
	.align	0
	.align	2
.L30:
	.byte	(.L41 - .Lrtx30) / 4
	.byte	(.L31 - .Lrtx30) / 4
	.byte	(.L32 - .Lrtx30) / 4
	.byte	(.L33 - .Lrtx30) / 4
	.text
	.p2align 3
.L20:
	neg	w4, w22
	b	.L21
	.p2align 3
.L41:
	mov	w3, 0
	mov	w5, 0
	mov	w15, 0
	mov	w14, 0
.L29:
	mov	w0, 0
	mov	w1, 0
.L38:
	lsr	w14, w14, w0
	lsr	w5, w5, w1
	lsr	w0, w15, w0
	lsr	w1, w3, w1
	mov	w2, 1
	str	w2, [x19]
	stp	w10, wzr, [x19, 16]
	stp	wzr, w10, [x19, 24]
	stp	w14, w0, [x19, 32]
	stp	w5, w1, [x19, 40]
	b	.L13
	.p2align 3
.L33:
	udiv	w5, w5, w12
	cmp	w2, w0
	add	w16, w16, w2
	csel	w2, w2, w0, ls
	sub	w0, w0, w2
	add	w8, w5, w30
	lsr	w6, w3, w2
	lsr	w2, w1, w2
	lsl	w3, w13, 1
	mul	w1, w6, w1
	add	w5, w16, w0
	neg	w0, w13
	mul	w9, w0, w14
	mul	w0, w0, w15
	udiv	w20, w11, w12
	add	w4, w4, w9
	add	w7, w7, w0
	add	w8, w8, w0
	mul	w4, w4, w6
	mul	w7, w7, w6
	mov	w6, 1
	add	w20, w20, w9
	add	w0, w5, w6
	lsl	w9, w14, w5
	mul	w3, w3, w1
	lsl	w0, w6, w0
	sub	w1, w0, w1, lsl 4
	sub	w0, w5, #1
	mul	w20, w20, w2
	madd	w11, w14, w3, w1
	mul	w2, w8, w2
	lsl	w6, w6, w0
	mov	w0, w5
	madd	w1, w15, w3, w1
	lsl	w15, w15, w5
	add	w5, w20, w4
	add	w11, w11, w5
	add	w5, w2, w7
	add	w9, w9, w6
	add	w8, w1, w5
	add	w6, w15, w6
	add	w1, w0, 2
	stp	w4, w20, [x19, 16]
	stp	w7, w2, [x19, 24]
	stp	w9, w6, [x19, 32]
	stp	w11, w8, [x19, 40]
	b	.L34
	.p2align 3
.L32:
	lsl	w3, w13, 1
	add	w0, w16, w2
	sub	w20, w20, w7
	sub	w2, w0, #1
	mul	w1, w3, w1
	neg	w3, w13
	lsl	w5, w14, w0
	madd	w4, w3, w14, w4
	madd	w7, w3, w15, w7
	mov	w3, 1
	add	w8, w0, w3
	lsl	w8, w3, w8
	lsl	w3, w3, w2
	sub	w8, w8, w18
	add	w9, w5, w3
	mov	w2, w4
	madd	w11, w14, w1, w8
	madd	w8, w15, w1, w8
	add	w1, w20, w4
	lsl	w15, w15, w0
	add	w11, w11, w1
	add	w1, w4, w7
	add	w8, w8, w1
	add	w6, w15, w3
	add	w1, w0, 2
	stp	w4, w20, [x19, 16]
	stp	w7, w4, [x19, 24]
	stp	w9, w6, [x19, 32]
	stp	w11, w8, [x19, 40]
	b	.L34
	.p2align 3
.L31:
	and	w5, w14, 1
	and	w3, w15, 1
	orr	w5, w5, w14, asr 1
	orr	w3, w3, w15, asr 1
	b	.L29
	.p2align 3
.L47:
	madd	w5, w10, w9, w14
	add	w4, w5, w4
	madd	w5, w10, w12, w15
	add	w6, w5, w6
	b	.L19
.L40:
	mov	w30, 16
	mov	w3, 1
	mov	w0, 0
	b	.L16
.L39:
	mov	w1, 1
	mov	w2, 0
	b	.L14
.L49:
	mov	w14, w9
	mov	w15, w6
	mov	w5, w11
	mov	w3, w8
	cbnz	w20, .L36
	cbnz	w7, .L36
	cmp	w4, w2
	mov	w20, w7
	bne	.L36
	b	.L38
	.size	MP4_GetGMCparam, .-MP4_GetGMCparam
	.align	3
.LC4:
	.xword	.L30
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_GetUserDataBuf
	.type	Mp4_GetUserDataBuf, %function
Mp4_GetUserDataBuf:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x1
	mov	w19, w2
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x20, w19, uxtw 3]
	cbz	x0, .L55
.L51:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L55:
	mov	w0, w21
	bl	GetUsd
	str	x0, [x20, w19, uxtw 3]
	cbz	x0, .L51
	add	w1, w19, 4
	str	w1, [x0, 1040]
	ldr	x0, [x20, w19, uxtw 3]
	b	.L51
	.size	Mp4_GetUserDataBuf, .-Mp4_GetUserDataBuf
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_ClearUsrData
	.type	Mp4_ClearUsrData, %function
Mp4_ClearUsrData:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	x19, 0
	mov	x20, x1
	bl	_mcount
.L57:
	ldr	x1, [x20, x19]
	mov	w0, w21
	bl	FreeUsdByDec
	str	xzr, [x20, x19]
	add	x19, x19, 8
	cmp	x19, 32
	bne	.L57
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	Mp4_ClearUsrData, .-Mp4_ClearUsrData
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_Syntax_Init
	.type	Mp4_Syntax_Init, %function
Mp4_Syntax_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 16384
	add	x20, x20, 20480
	bl	_mcount
	ldr	x21, .LC7
	mov	x2, 24
	mov	w1, 0
	add	x0, x19, 3632
	ldr	x3, [x21, 96]
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 604
	mov	w1, 0
	add	x0, x19, 3656
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 60
	mov	w1, 0
	add	x0, x20, 768
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 776
	mov	w1, 0
	add	x0, x20, 828
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 7
	mov	w1, 0
	add	x0, x20, 1604
	blr	x3
	ldr	x3, .LC8
	mov	w1, 1
	mov	w0, 1
	strb	w1, [x20, 853]
	str	w0, [x20, 2232]
	add	x1, x19, 3744
	add	x4, x3, 256
	mov	w2, 8
	add	x0, x3, 4
	b	.L62
	.p2align 3
.L60:
	ldr	w2, [x0], 4
.L62:
	str	w2, [x1], 4
	cmp	x0, x4
	bne	.L60
	add	x0, x3, 260
	add	x1, x19, 4000
	add	x3, x3, 512
	mov	w2, 16
	b	.L61
	.p2align 3
.L64:
	ldr	w2, [x0], 4
.L61:
	str	w2, [x1], 4
	cmp	x0, x3
	bne	.L64
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	Mp4_Syntax_Init, .-Mp4_Syntax_Init
	.align	3
.LC7:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC8:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Global_Data_Init
	.type	Global_Data_Init, %function
Global_Data_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 20480
	bl	_mcount
	ldr	x21, .LC11
	mov	x2, 32
	mov	w1, 0
	add	x0, x19, 1648
	ldr	x3, [x21, 96]
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 24
	mov	w1, 0
	add	x0, x19, 1616
	blr	x3
	mov	x0, x20
	bl	Mp4_Syntax_Init
	str	xzr, [x20, 22672]
	str	xzr, [x20, 22680]
	add	x2, x19, 2048
	str	xzr, [x20, 22688]
	mov	w0, 0
	str	xzr, [x20, 22696]
	str	wzr, [x19, 1684]
	str	wzr, [x19, 2144]
	str	wzr, [x19, 2148]
	str	wzr, [x19, 2152]
	str	wzr, [x19, 2160]
	str	xzr, [x20, 22704]
	stp	wzr, wzr, [x2, 116]
	stp	wzr, wzr, [x2, 124]
	str	wzr, [x19, 2180]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	Global_Data_Init, .-Global_Data_Init
	.align	3
.LC11:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Bs_Get_Matrix
	.type	Bs_Get_Matrix, %function
Bs_Get_Matrix:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x25, x0
	mov	x0, x30
	mov	x21, x1
	mov	w19, 0
	bl	_mcount
	mov	w22, 0
	ldr	x24, .LC12
	mov	w20, 0
	mov	w23, 63
	b	.L68
	.p2align 3
.L75:
	ldr	w19, [x3, w1, sxtw 2]
	mov	w20, w1
	mov	w22, w0
.L68:
	mov	w1, 8
	mov	x0, x25
	bl	BsGet
	cmp	w0, wzr
	add	w2, w20, 1
	str	w0, [x21, w19, sxtw 2]
	add	x3, x24, 512
	sxtw	x19, w19
	sxth	w1, w2
	ccmp	w1, w23, 0, ne
	ble	.L75
	cbnz	w0, .L66
	cmp	w20, 63
	bgt	.L66
	ldr	x1, .LC12
	b	.L71
	.p2align 3
.L76:
	ldrsw	x19, [x0, w20, sxtw 2]
.L71:
	sxth	w20, w2
	str	w22, [x21, x19, lsl 2]
	cmp	w20, 64
	add	x0, x1, 512
	add	w2, w20, 1
	bne	.L76
.L66:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	Bs_Get_Matrix, .-Bs_Get_Matrix
	.align	3
.LC12:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	NextStartCode
	.type	NextStartCode, %function
NextStartCode:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	w22, w2
	mov	x23, x1
	mov	x21, x3
	bl	_mcount
	mov	w2, w22
	mov	x1, x23
	add	x0, x29, 72
	lsl	w19, w22, 3
	bl	BsInit
	mov	w2, 0
	b	.L78
	.p2align 3
.L82:
	cmp	w5, 256
	beq	.L91
.L86:
	bl	BsSkip
	add	x0, x29, 72
	bl	BsPos
	mov	w2, w0
.L78:
	sub	w2, w19, w2
	mov	w1, 32
	cmp	w2, 31
	add	x0, x29, 72
	ble	.L92
	bl	BsShow
	mov	w2, w0
	cmp	w2, 438
	mov	w1, 8
	add	x0, x29, 72
	and	w3, w2, -16
	and	w4, w2, -1024
	and	w5, w2, -256
	beq	.L79
	cmp	w3, 288
	beq	.L79
	cmp	w4, 32768
	bne	.L82
	ldrb	w2, [x20, 9]
	mov	w1, 8
	add	x0, x29, 72
	cmp	w2, 2
	bne	.L93
	ldr	w2, [x20, 752]
	add	w2, w2, 1
	str	w2, [x20, 752]
	cmp	w2, 18
	bls	.L86
	mov	w0, 196
	str	w0, [x21]
	mov	w1, 1
	add	x0, x29, 72
	strb	w1, [x20, 9]
	bl	BsPos
	b	.L81
	.p2align 3
.L79:
	mov	w0, 2
	str	wzr, [x20, 752]
	strb	w0, [x20, 9]
	add	x0, x29, 72
	str	w2, [x21]
	bl	BsPos
.L81:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L92:
	mov	w1, 197
	str	w1, [x21]
	bl	BsPos
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L91:
	str	w2, [x21]
	add	x0, x29, 72
	bl	BsPos
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
.L93:
	mov	w0, 1
	strb	w0, [x20, 9]
	mov	w1, 196
	add	x0, x29, 72
	str	w1, [x21]
	bl	BsPos
	b	.L81
	.size	NextStartCode, .-NextStartCode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4SearchStartCode
	.type	Mp4SearchStartCode, %function
Mp4SearchStartCode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w19, 4
	mov	w0, 0
	ble	.L95
	add	x4, x20, x19, sxtw
	add	x0, x20, 2
.L111:
	cmp	x4, x0
	bls	.L96
.L116:
	ldrb	w2, [x0]
	cmp	w2, 1
	bls	.L97
	and	w3, w2, 252
	cmp	w3, 128
	beq	.L97
.L104:
	add	x0, x0, 3
	cmp	x4, x0
	bhi	.L116
.L96:
	sub	w0, w19, #2
.L95:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L97:
	cbnz	w2, .L99
	ldrb	w2, [x0, -1]
	cbnz	w2, .L100
	add	x0, x0, 1
	b	.L111
	.p2align 3
.L99:
	ldrb	w1, [x0, -2]
	cbnz	w1, .L104
	ldrb	w1, [x0, -1]
	cbnz	w1, .L104
	sub	x0, x0, x20
	sub	w0, w0, #2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L100:
	ldrb	w2, [x0, 1]
	add	x1, x0, 2
	add	x0, x0, 4
	cmp	w2, wzr
	csel	x0, x0, x1, ne
	b	.L111
	.size	Mp4SearchStartCode, .-Mp4SearchStartCode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_Syntax_Gop
	.type	Mp4_Syntax_Gop, %function
Mp4_Syntax_Gop:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	w21, w2
	bl	_mcount
	mov	w2, w21
	mov	x1, x20
	add	x0, x29, 56
	bl	BsInit
	mov	w1, 32
	add	x0, x29, 56
	bl	BsSkip
	mov	w1, 5
	add	x0, x29, 56
	bl	BsGet
	mov	w1, 6
	add	x0, x29, 56
	bl	BsGet
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	cbnz	w0, .L118
	ldr	x1, .LC15
	mov	w0, 1
	add	x19, x19, 20480
	bl	dprint_vfmw
	add	x0, x29, 56
	strb	wzr, [x19, 1606]
	bl	BsPos
	mov	w20, w0
	ldr	x0, .LC16
	ldr	x4, [x0]
	cbz	x4, .L120
	ldr	w0, [x19, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 103
	blr	x4
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L118:
	mov	w1, 6
	add	x0, x29, 56
	add	x19, x19, 20480
	bl	BsGet
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 830]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 831]
	mov	w1, 1
	add	x0, x29, 56
	strb	w1, [x19, 1606]
	bl	BsPos
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L120:
	mov	w0, w20
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.size	Mp4_Syntax_Gop, .-Mp4_Syntax_Gop
	.align	3
.LC15:
	.xword	.LC14
	.align	3
.LC16:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_Syntax_UserData
	.type	Mp4_Syntax_UserData, %function
Mp4_Syntax_UserData:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	mov	w20, w2
	mov	x19, x1
	bl	_mcount
	strb	wzr, [x29, 95]
	cmp	w20, 6
	stp	wzr, wzr, [x29, 96]
	stp	wzr, wzr, [x29, 104]
	ble	.L122
	cmp	w20, 4
	ble	.L123
	ldrb	w0, [x19, 4]
	add	x1, x19, 5
	strb	w0, [x22, 3]
	add	x5, x22, 4
	orr	w0, w0, -256
	mov	w19, 4
	lsl	w0, w0, 8
	b	.L124
	.p2align 3
.L129:
	ldrb	w4, [x1]
	add	x1, x1, 1
	orr	w0, w4, w0
	lsl	w0, w0, 8
	cmp	w0, 256
	beq	.L180
	strb	w4, [x5], 1
	cmp	w3, 1030
	beq	.L181
	mov	w19, w3
.L124:
	add	w3, w19, 1
	sub	w21, w19, #3
	cmp	w20, w3
	bne	.L129
.L127:
	add	x23, x22, 20480
	mov	w1, 1
	cmp	w21, 2
	lsl	w25, w20, 3
	mov	w0, w25
	strb	w1, [x23, 1610]
	bhi	.L182
.L172:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L122:
	add	x22, x22, 20480
	add	w19, w20, 1
	lsl	w0, w19, 3
	strb	wzr, [x22, 1610]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L180:
	sub	w0, w19, #1
	cmp	w20, w0
	bge	.L183
.L128:
	add	w0, w20, 1
	ldp	x21, x22, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	lsl	w0, w0, 3
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L182:
	ldr	w2, [x23, 2180]
	add	x1, x23, 2192
	ldr	w0, [x23, 2848]
	bl	Mp4_GetUserDataBuf
	str	x0, [x22, 22704]
	cbz	x0, .L184
	sub	w26, w19, #5
	str	w26, [x0, 1052]
	mov	w0, 65533
	ldr	x24, .LC17
	movk	w0, 0x7fff, lsl 16
	add	x20, x22, 3
	cmn	w19, w0
	mov	x2, 0
	ldr	x3, [x24, 104]
	ldr	x0, [x22, 22704]
	bmi	.L185
.L132:
	mov	x1, x20
	blr	x3
	ldr	x1, [x22, 22120]
	ldr	x2, .LC18
	ldr	x0, [x22, 22704]
	ldr	x1, [x1, 64]
	ldr	x4, [x2]
	str	x1, [x0, 1056]
	cbz	x4, .L131
	ldr	w0, [x23, 2848]
	mov	w3, 1064
	ldr	x2, [x22, 22704]
	mov	w1, 6
	blr	x4
.L131:
	mov	w1, 2
	mov	w0, 0
	movk	w1, 0x8000, lsl 16
	cmn	w26, w1
	bmi	.L186
.L133:
	add	x0, x22, x0, sxtw
	ldr	x1, .LC20
	add	x4, x29, 95
	add	x3, x29, 100
	add	x2, x29, 96
	strb	wzr, [x0, 3]
	mov	x0, x20
	ldr	x5, [x24, 144]
	blr	x5
	cmp	w0, 1
	ble	.L187
.L134:
	ldp	w2, w1, [x29, 96]
	cmp	w0, 3
	str	w2, [x23, 1584]
	str	w1, [x23, 1588]
	mov	w0, 0
	beq	.L188
.L136:
	str	w0, [x23, 1592]
.L135:
	ldr	x1, .LC24
	add	x2, x29, 100
	ldr	x3, [x24, 144]
	mov	x0, x20
	blr	x3
	cmp	w0, 1
	beq	.L137
	ldr	x1, .LC26
	add	x5, x29, 100
	ldr	x6, [x24, 144]
	add	x4, x29, 108
	add	x3, x29, 104
	add	x2, x29, 96
	mov	x0, x20
	blr	x6
	cmp	w0, 4
	beq	.L137
	ldr	x1, .LC28
	add	x4, x29, 108
	ldr	x5, [x24, 144]
	add	x3, x29, 104
	add	x2, x29, 96
	mov	x0, x20
	blr	x5
	add	w0, w0, 1
	cmp	w0, 1
	ble	.L138
	ldp	w3, w1, [x29, 104]
	ldr	w2, [x29, 96]
	lsl	w3, w3, 8
	add	w2, w3, w2, lsl 16
	add	w1, w2, w1
	str	w1, [x29, 100]
.L138:
	cmp	w0, 4
	beq	.L137
	ldr	x1, .LC30
	mov	w2, 7
	ldr	x3, [x24, 152]
	mov	x0, x20
	blr	x3
	cbz	w0, .L189
.L149:
	ldr	x1, .LC32
	add	x2, x29, 100
	ldr	x3, [x24, 144]
	mov	x0, x20
	blr	x3
	cmp	w0, 1
	beq	.L140
	ldr	w0, [x23, 1596]
.L141:
	strb	wzr, [x23, 841]
	strb	wzr, [x23, 842]
	strb	wzr, [x23, 839]
	strb	wzr, [x23, 838]
	strb	wzr, [x23, 840]
	ldr	w1, [x23, 1584]
	cbz	w0, .L142
	cbz	w1, .L143
	str	wzr, [x23, 1584]
	str	wzr, [x23, 1588]
.L143:
	cmp	w0, 1
	beq	.L150
	mov	w1, -1
.L144:
	sub	w0, w0, #1
	cmp	w0, 11
	bls	.L154
.L145:
	ldr	w0, [x23, 1600]
	mov	w2, 4668
	sub	w0, w0, #1
	cmp	w0, w2
	bhi	.L146
	mov	w0, 1
	strb	w0, [x23, 839]
.L146:
	cmp	w1, 498
	bhi	.L147
	mov	w0, 1
	strb	w0, [x23, 839]
.L147:
	mov	x1, 500
	ldr	x2, [x22, 22064]
	movk	x1, 0x19d, lsl 32
	mov	w0, w25
	cmp	x2, x1
	bne	.L172
	mov	w1, 1
	strb	w1, [x23, 840]
	b	.L172
.L181:
	add	x22, x22, 20480
	sub	w19, w19, #1
	lsl	w0, w19, 3
	strb	wzr, [x22, 1610]
	b	.L172
.L142:
	cmp	w1, 499
	bls	.L190
	mov	w2, 1
	cmp	w1, 502
	strb	w2, [x23, 841]
	sub	w1, w1, #1
	bls	.L144
.L153:
	mov	w2, 1
	strb	w2, [x23, 842]
	b	.L144
.L150:
	strb	w0, [x23, 841]
	mov	w1, -1
.L154:
	mov	w0, 1
	strb	w0, [x23, 839]
	b	.L145
.L137:
	ldr	w0, [x29, 100]
	str	w0, [x23, 1600]
	b	.L149
.L189:
	mov	w0, 4600
	str	w0, [x23, 1600]
	b	.L149
.L188:
	ldrsb	w0, [x29, 95]
	cmp	w0, 112
	cset	w0, eq
	b	.L136
.L140:
	ldr	w0, [x29, 100]
	str	w0, [x23, 1596]
	b	.L141
.L186:
	add	w0, w26, 2
	mov	w1, 1024
	cmp	w0, w1
	csel	w0, w0, w1, le
	b	.L133
.L185:
	mov	w1, 1024
	cmp	w21, w1
	csel	w21, w21, w1, le
	sxtw	x2, w21
	b	.L132
.L123:
	cmp	w20, 3
	ble	.L128
	add	x22, x22, 20480
	mov	w1, 1
	mov	w0, 32
	strb	w1, [x22, 1610]
	b	.L172
.L184:
	add	x20, x22, 3
	mov	w26, w21
	ldr	x24, .LC17
	b	.L131
.L187:
	ldr	x1, .LC22
	add	x4, x29, 95
	ldr	x5, [x24, 144]
	add	x3, x29, 100
	add	x2, x29, 96
	mov	x0, x20
	blr	x5
	cmp	w0, 1
	ble	.L135
	b	.L134
	.p2align 3
.L183:
	mov	w20, w0
	b	.L127
.L190:
	cmp	w1, 502
	sub	w1, w1, #1
	bhi	.L153
	b	.L145
	.size	Mp4_Syntax_UserData, .-Mp4_Syntax_UserData
	.align	3
.LC17:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC18:
	.xword	g_event_report
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_Syntax_Vo
	.type	Mp4_Syntax_Vo, %function
Mp4_Syntax_Vo:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	mov	w22, w2
	bl	_mcount
	add	x19, x20, 20480
	mov	w2, w22
	mov	x1, x21
	add	x0, x29, 56
	mov	w21, 1
	add	x20, x20, 16384
	bl	BsInit
	strb	wzr, [x19, 852]
	mov	w1, 32
	strb	w21, [x19, 853]
	strb	wzr, [x19, 854]
	add	x0, x29, 56
	strb	wzr, [x19, 855]
	strb	wzr, [x19, 856]
	strb	wzr, [x19, 857]
	strb	wzr, [x19, 858]
	strb	wzr, [x19, 859]
	str	wzr, [x19, 864]
	str	wzr, [x19, 868]
	str	wzr, [x19, 872]
	bl	BsSkip
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x20, 3632]
	cbnz	w0, .L206
	strb	w21, [x20, 3633]
	mov	w1, 4
	add	x0, x29, 56
	bl	BsGet
	uxtb	w21, w0
	cmp	w21, 1
	strb	w21, [x20, 3635]
	beq	.L207
.L194:
	strb	wzr, [x19, 1605]
	add	x0, x29, 56
	bl	BsPos
	mov	w20, w0
	ldr	x0, .LC33
	ldr	x4, [x0]
	cbz	x4, .L199
	ldr	w0, [x19, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L206:
	mov	w1, 4
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x20, 3633]
	mov	w1, 3
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x20, 3634]
	mov	w1, 4
	add	x0, x29, 56
	bl	BsGet
	uxtb	w21, w0
	cmp	w21, 1
	strb	w21, [x20, 3635]
	bne	.L194
.L207:
	mov	w1, w21
	add	x0, x29, 56
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x20, 3636]
	cbnz	w0, .L208
.L196:
	mov	w1, 1
	add	x0, x29, 56
	strb	w1, [x19, 1605]
	bl	BsPos
	cmp	w0, w22, lsl 3
	bgt	.L198
	ldrb	w0, [x20, 3632]
	strb	w0, [x19, 852]
	ldrb	w0, [x20, 3633]
	strb	w0, [x19, 853]
	ldrb	w0, [x20, 3634]
	strb	w0, [x19, 854]
	ldrb	w0, [x20, 3635]
	strb	w0, [x19, 855]
	ldrb	w0, [x20, 3636]
	strb	w0, [x19, 856]
	ldrb	w0, [x20, 3637]
	strb	w0, [x19, 857]
	ldrb	w0, [x20, 3638]
	strb	w0, [x19, 858]
	ldrb	w0, [x20, 3639]
	strb	w0, [x19, 859]
	ldr	w0, [x20, 3644]
	str	w0, [x19, 864]
	ldr	w0, [x20, 3648]
	str	w0, [x19, 868]
	ldr	w0, [x20, 3652]
	str	w0, [x19, 872]
.L198:
	add	x0, x29, 56
	bl	BsPos
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L199:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L208:
	mov	w1, 3
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x20, 3637]
	mov	w1, w21
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x20, 3638]
	mov	w1, w21
	add	x0, x29, 56
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x20, 3639]
	cbz	w0, .L196
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	str	w0, [x20, 3644]
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	str	w0, [x20, 3648]
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	str	w0, [x20, 3652]
	b	.L196
	.size	Mp4_Syntax_Vo, .-Mp4_Syntax_Vo
	.align	3
.LC33:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_Syntax_Vol
	.type	Mp4_Syntax_Vol, %function
Mp4_Syntax_Vol:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 20480
	mov	x21, x1
	mov	w22, w2
	bl	_mcount
	ldr	x0, .LC34
	ldrsw	x1, [x20, 2848]
	ldr	x0, [x0, x1, lsl 3]
	cbz	x0, .L270
	ldr	w23, [x0, 1412]
	ldr	w24, [x0, 1416]
.L210:
	mov	w2, w22
	mov	x1, x21
	add	x0, x29, 88
	add	x19, x19, 16384
	add	x21, x19, 3656
	bl	BsInit
	ldr	x22, .LC35
	mov	x2, 604
	mov	w1, 0
	strb	wzr, [x20, 829]
	mov	x0, x21
	ldr	x3, [x22, 96]
	blr	x3
	mov	w1, 32
	add	x0, x29, 88
	bl	BsSkip
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	strb	w0, [x19, 3660]
	mov	w1, 8
	add	x0, x29, 88
	bl	BsGet
	str	w0, [x19, 3684]
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3656]
	cbnz	w0, .L357
	ldrb	w0, [x20, 853]
	mov	w1, 4
	strb	w0, [x19, 3657]
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 15
	strb	w0, [x19, 3659]
	beq	.L358
.L213:
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3661]
	cbnz	w0, .L359
	mov	w0, 1
	strb	w0, [x19, 3662]
.L218:
	mov	w1, 2
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3664]
	cbz	w0, .L360
.L351:
	strb	wzr, [x20, 1607]
	add	x0, x29, 88
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC38
	ldr	x4, [x0]
	cbz	x4, .L289
	ldr	w0, [x20, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
	mov	w0, w19
.L325:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L360:
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	cbz	w0, .L352
	mov	w1, 16
	add	x0, x29, 88
	bl	BsGet
	str	w0, [x19, 3728]
	cbz	w0, .L226
	subs	w0, w0, #1
	beq	.L278
	mov	w2, w0
	mov	w1, 0
	.p2align 2
.L228:
	add	w1, w1, 1
	lsr	w2, w2, 1
	sxth	w1, w1
	cbnz	w2, .L228
	cmp	w1, wzr
	mov	w1, 0
	ble	.L278
	.p2align 2
.L310:
	add	w1, w1, 1
	lsr	w0, w0, 1
	sxth	w1, w1
	cbnz	w0, .L310
.L227:
	str	w1, [x19, 3724]
.L231:
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	cbz	w0, .L352
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3665]
	cbnz	w0, .L361
.L233:
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	cbz	w0, .L352
	mov	w1, 13
	add	x0, x29, 88
	bl	BsGet
	str	w0, [x19, 3736]
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	cbz	w0, .L352
	mov	w1, 13
	add	x0, x29, 88
	bl	BsGet
	str	w0, [x19, 3740]
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	cbz	w0, .L352
	ldr	w0, [x19, 3736]
	cmp	w0, 31
	bls	.L237
	ldr	w1, [x19, 3740]
	cmp	w1, 31
	bls	.L237
	mul	w0, w0, w1
	mul	w23, w23, w24
	cmp	w0, w23
	bhi	.L237
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	strb	w0, [x19, 3666]
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3667]
	cbnz	w0, .L240
	ldr	x0, .LC38
	strb	wzr, [x20, 1607]
	ldr	x4, [x0]
	cbz	x4, .L240
	ldr	w0, [x20, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
.L240:
	ldrb	w2, [x19, 3657]
	mov	w1, 2
	add	x0, x29, 88
	cmp	w2, 1
	csinc	w1, w1, wzr, ne
	bl	BsGet
	uxtb	w23, w0
	strb	w23, [x19, 3668]
	cbz	w23, .L243
	ldr	x0, .LC39
	ldr	w0, [x0]
	tbz	x0, 3, .L362
	sub	w0, w23, #1
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L363
	strb	wzr, [x20, 1607]
	add	x0, x29, 88
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC38
	ldr	x4, [x0]
	cbz	x4, .L250
	ldr	w0, [x20, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
.L250:
	ldr	x1, .LC45
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w19
	b	.L325
	.p2align 3
.L352:
	ldr	x1, .LC37
	mov	w0, 1
	bl	dprint_vfmw
.L237:
	strb	wzr, [x20, 1607]
	add	x0, x29, 88
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC38
	ldr	x4, [x0]
	cbz	x4, .L289
	ldr	w0, [x20, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 103
	blr	x4
	ldr	x25, [sp, 64]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L359:
	mov	w1, 2
	add	x0, x29, 88
	bl	BsGet
	uxtb	w25, w0
	cmp	w25, 1
	strb	w25, [x19, 3662]
	beq	.L215
	strb	wzr, [x20, 1607]
	add	x0, x29, 88
	bl	BsPos
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L357:
	mov	w1, 4
	add	x0, x29, 88
	bl	BsGet
	strb	w0, [x19, 3657]
	mov	w1, 3
	add	x0, x29, 88
	bl	BsGet
	strb	w0, [x19, 3658]
	mov	w1, 4
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 15
	strb	w0, [x19, 3659]
	bne	.L213
.L358:
	mov	w1, 8
	add	x0, x29, 88
	bl	BsGet
	str	w0, [x19, 3688]
	mov	w1, 8
	add	x0, x29, 88
	bl	BsGet
	str	w0, [x19, 3692]
	b	.L213
	.p2align 3
.L289:
	mov	w0, w19
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L215:
	mov	w1, w25
	add	x0, x29, 88
	bl	BsGet
	strb	w0, [x19, 3663]
	mov	w1, w25
	add	x0, x29, 88
	bl	BsGet
	str	w0, [x19, 3696]
	cbz	w0, .L218
	mov	w1, 15
	add	x0, x29, 88
	bl	BsGet
	str	w0, [x19, 3700]
	mov	w1, w25
	add	x0, x29, 88
	bl	BsGet
	cbz	w0, .L353
	mov	w1, 15
	add	x0, x29, 88
	bl	BsGet
	str	w0, [x19, 3704]
	mov	w1, w25
	add	x0, x29, 88
	bl	BsGet
	cbz	w0, .L353
	mov	w1, 15
	add	x0, x29, 88
	bl	BsGet
	str	w0, [x19, 3708]
	mov	w1, w25
	add	x0, x29, 88
	bl	BsGet
	cbz	w0, .L353
	mov	w1, 3
	add	x0, x29, 88
	bl	BsGet
	str	w0, [x19, 3712]
	mov	w1, 11
	add	x0, x29, 88
	bl	BsGet
	str	w0, [x19, 3716]
	mov	w1, w25
	add	x0, x29, 88
	bl	BsGet
	cbz	w0, .L353
	mov	w1, 15
	add	x0, x29, 88
	bl	BsGet
	str	w0, [x19, 3720]
	mov	w1, w25
	add	x0, x29, 88
	bl	BsGet
	cbnz	w0, .L218
	.p2align 2
.L353:
	ldr	x1, .LC37
	mov	w0, w25
	bl	dprint_vfmw
	b	.L237
	.p2align 3
.L270:
	mov	w24, 8192
	mov	w23, w24
	b	.L210
	.p2align 3
.L226:
	mov	w0, 1
	str	w0, [x19, 3724]
	b	.L231
	.p2align 3
.L278:
	mov	w1, 1
	b	.L227
	.p2align 3
.L361:
	ldr	w1, [x19, 3724]
	add	x0, x29, 88
	bl	BsGet
	str	w0, [x19, 3732]
	b	.L233
.L364:
	mov	w1, 6
	add	x0, x29, 88
	bl	BsGet
	strb	w0, [x19, 3680]
	mov	w1, w23
	add	x0, x29, 88
	bl	BsGet
	strb	w0, [x19, 3681]
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	strb	w0, [x19, 3682]
	ldrb	w1, [x19, 3668]
	cmp	w1, 2
	bne	.L355
.L243:
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3669]
	cbz	w0, .L251
	strb	wzr, [x20, 1607]
	add	x0, x29, 88
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC38
	ldr	x4, [x0]
	cbz	x4, .L252
	ldr	w0, [x20, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
.L252:
	ldr	x1, .LC47
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w19
	b	.L325
.L363:
	cmp	w23, 2
	beq	.L364
.L355:
	strb	wzr, [x20, 1607]
	add	x0, x29, 88
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC38
	ldr	x4, [x0]
	cbz	x4, .L249
	ldr	w0, [x20, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
.L249:
	ldr	x1, .LC43
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w19
	b	.L325
.L251:
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3670]
	cbnz	w0, .L365
.L254:
	ldrb	w0, [x19, 3657]
	cmp	w0, 1
	beq	.L261
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	strb	w0, [x19, 3673]
.L262:
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3674]
	ldr	x1, .LC50
	cbz	w0, .L346
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	strb	w0, [x19, 3675]
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3676]
	ldr	x1, .LC52
	cbnz	w0, .L346
	ldrb	w0, [x19, 3657]
	cmp	w0, 1
	beq	.L265
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3677]
	ldr	x1, .LC54
	cbnz	w0, .L346
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3678]
	ldr	x1, .LC56
	cbnz	w0, .L346
.L267:
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3679]
	cbz	w0, .L268
	ldr	x1, .LC58
.L346:
	mov	w0, 1
	bl	dprint_vfmw
	b	.L351
.L362:
	strb	wzr, [x20, 1607]
	add	x0, x29, 88
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC38
	ldr	x4, [x0]
	cbz	x4, .L245
	ldr	w0, [x20, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
.L245:
	ldr	x1, .LC41
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w19
	b	.L325
.L261:
	strb	wzr, [x19, 3673]
	b	.L262
.L365:
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3671]
	cbnz	w0, .L366
	ldr	x0, .LC48
	add	x1, x19, 3744
	add	x3, x0, 256
.L257:
	ldr	w2, [x0], 4
	str	w2, [x1], 4
	cmp	x0, x3
	bne	.L257
.L256:
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3672]
	cbnz	w0, .L367
	ldr	x0, .LC48
	add	x1, x19, 4000
	add	x0, x0, 256
	add	x3, x0, 256
.L259:
	ldr	w2, [x0], 4
	str	w2, [x1], 4
	cmp	x0, x3
	bne	.L259
	b	.L254
.L366:
	add	x1, x19, 3744
	add	x0, x29, 88
	bl	Bs_Get_Matrix
	b	.L256
.L367:
	add	x1, x19, 4000
	add	x0, x29, 88
	bl	Bs_Get_Matrix
	b	.L254
.L268:
	mov	w0, 1
	ldr	x3, [x22, 104]
	strb	w0, [x20, 1607]
	mov	x2, 604
	strb	w0, [x20, 829]
	mov	x1, x21
	strb	w0, [x20, 1608]
	add	x0, x20, 164
	blr	x3
	add	x0, x29, 88
	bl	BsPos
	b	.L325
.L265:
	strb	wzr, [x19, 3677]
	strb	wzr, [x19, 3678]
	b	.L267
	.size	Mp4_Syntax_Vol, .-Mp4_Syntax_Vol
	.align	3
.LC34:
	.xword	s_pstVfmwChan
	.align	3
.LC35:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC37:
	.xword	.LC36
	.align	3
.LC38:
	.xword	g_event_report
	.align	3
.LC39:
	.xword	g_VdmCharacter
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
.LC48:
	.xword	.LANCHOR1
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_Syntax_Vos
	.type	Mp4_Syntax_Vos, %function
Mp4_Syntax_Vos:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	w21, w2
	bl	_mcount
	mov	w2, w21
	mov	x1, x20
	add	x0, x29, 56
	add	x20, x19, 20480
	add	x19, x19, 16384
	bl	BsInit
	mov	w1, 32
	add	x0, x29, 56
	str	wzr, [x20, 860]
	bl	BsSkip
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	sub	w2, w0, #1
	sub	w1, w0, #240
	cmp	w2, 2
	ccmp	w1, 5, 0, hi
	str	w0, [x19, 3640]
	ccmp	w0, 8, 4, hi
	beq	.L375
	cbz	w0, .L376
	ldr	x0, .LC63
	strb	wzr, [x20, 1604]
	ldr	x4, [x0]
	cbz	x4, .L370
	ldr	w0, [x20, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
	add	x0, x29, 56
	bl	BsPos
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L375:
	mov	w1, 1
	str	w0, [x20, 860]
	strb	w1, [x20, 1604]
.L370:
	add	x0, x29, 56
	bl	BsPos
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L376:
	ldr	x1, .LC62
	mov	w2, 0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 1
	strb	w0, [x20, 1604]
	ldr	w0, [x19, 3640]
	str	w0, [x20, 860]
	b	.L370
	.size	Mp4_Syntax_Vos, .-Mp4_Syntax_Vos
	.align	3
.LC62:
	.xword	.LC61
	.align	3
.LC63:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Frame_Init
	.type	Frame_Init, %function
Frame_Init:
	sub	sp, sp, #128
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	stp	x23, x24, [sp, 64]
	stp	x25, x26, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	mov	w22, w2
	mov	w21, w1
	bl	_mcount
	sub	w2, w22, #32
	sub	w1, w21, #32
	mov	w0, 3807
	cmp	w2, 2127
	ccmp	w1, w0, 2, ls
	bhi	.L378
	ldr	x0, [x19, 22120]
	ldr	w20, [x0, 772]
	cbnz	w20, .L418
	ldr	w1, [x0, 28]
	cmp	w1, 25
	beq	.L419
.L408:
	mov	w24, 2
	mov	w25, 5
	mov	w26, 3
.L382:
	ldr	w1, [x0, 936]
	add	x23, x19, 20480
	cmp	w1, 1
	beq	.L393
	ldr	x1, .LC69
	ldr	x8, [x1, 128]
	cbz	x8, .L395
	add	x23, x19, 20480
	ldr	w1, [x0, 20]
	ldr	x20, .LC72
	mov	w6, 0
	ldr	w0, [x0, 16]
	mov	w5, 40
	ldr	w7, [x23, 2848]
	mov	w4, 2
	mov	w3, w22
	mov	w2, w21
	str	x20, [sp]
	blr	x8
	cbnz	w0, .L395
	ldr	w2, [x20, 56]
	ldr	w3, [x20, 48]
	cmp	w2, 1
	ble	.L397
	cmp	w3, 2
	ble	.L397
	ldr	w0, [x20, 464]
	str	w0, [x23, 1672]
	bl	MEM_Phy2Vir
	str	x0, [x19, 22136]
.L393:
	ldr	x0, .LC75
	mov	x2, 20
	mov	w1, 0
	ldr	x3, [x0, 96]
	add	x0, x29, 88
	blr	x3
	ldr	x0, [x19, 22120]
	stp	w21, w22, [x29, 92]
	stp	w21, w22, [x29, 100]
	ldr	w0, [x0, 28]
	cmp	w0, 24
	beq	.L399
	strb	w26, [x29, 89]
	sxtb	w24, w24
	strb	w25, [x29, 90]
.L404:
	ldr	w0, [x23, 2848]
	add	x1, x29, 88
	strb	w24, [x29, 91]
	bl	FSP_ConfigInstance
	mov	w20, w0
	cbnz	w0, .L400
	ldr	x1, [x19, 22120]
	add	x3, x29, 84
	ldr	w0, [x23, 2848]
	ldr	w2, [x1, 20]
	ldr	w1, [x1, 16]
	bl	FSP_ConfigFrameBuf
	cmp	w0, 2
	beq	.L420
	cbnz	w0, .L402
	add	sp, x29, 0
	mov	w0, 1
	str	w0, [x23, 2852]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L378:
	ldr	x1, .LC65
	mov	w3, w22
	mov	w2, w21
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x0, .LC66
	ldr	x4, [x0]
	cbz	x4, .L405
	add	x19, x19, 20480
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	mov	w20, -1
	ldr	w0, [x19, 2848]
	blr	x4
.L411:
	add	sp, x29, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L418:
	ldr	w1, [x0, 28]
	cmp	w1, 25
	bne	.L408
	ldr	w4, [x0, 732]
	ldr	w5, [x0, 736]
	cmp	w21, w4
	bhi	.L389
	cmp	w22, w5
	bhi	.L389
	ldr	w2, [x0, 760]
	mov	w24, 1
	ldr	w1, [x0, 756]
	add	w26, w1, 2
	cbnz	w2, .L421
	ldr	w25, [x0, 780]
	b	.L382
	.p2align 3
.L405:
	add	sp, x29, 0
	mov	w20, -1
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L399:
	mov	w0, 1
	strb	w25, [x29, 90]
	strb	w0, [x29, 89]
	mov	w24, 1
	b	.L404
	.p2align 3
.L421:
	add	w1, w1, w24
	mov	w24, 17
	cmp	w1, w24
	ldr	w25, [x0, 780]
	csel	w24, w1, w24, le
	b	.L382
	.p2align 3
.L419:
	ldr	w4, [x0, 732]
	cmp	w21, w4
	bhi	.L422
	ldr	w1, [x0, 736]
	cmp	w22, w1
	mov	w5, w1
	bhi	.L389
	add	x23, x19, 20480
	ldr	w2, [x23, 2852]
	cmp	w2, 1
	beq	.L411
	ldr	w3, [x0, 760]
	mov	w24, 1
	ldr	w2, [x0, 756]
	add	w26, w2, 2
	cbz	w3, .L387
	add	w2, w2, w24
	mov	w24, 17
	cmp	w2, w24
	csel	w24, w2, w24, le
.L387:
	mov	w22, w1
	mov	w21, w4
	ldr	w25, [x0, 780]
	b	.L382
	.p2align 3
.L420:
	add	x0, x23, 2240
	bl	ResetVoQueue
.L402:
	ldr	x1, .LC77
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	str	wzr, [x23, 2852]
	b	.L411
	.p2align 3
.L397:
	ldr	x1, .LC74
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L411
	.p2align 3
.L395:
	ldr	x1, .LC71
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L411
	.p2align 3
.L400:
	ldr	x1, .LC79
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L411
.L422:
	ldr	w5, [x0, 736]
.L389:
	ldr	x1, .LC68
	mov	w3, w22
	mov	w2, w21
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L411
	.size	Frame_Init, .-Frame_Init
	.align	3
.LC65:
	.xword	.LC64
	.align	3
.LC66:
	.xword	g_event_report
	.align	3
.LC68:
	.xword	.LC67
	.align	3
.LC69:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC71:
	.xword	.LC70
	.align	3
.LC72:
	.xword	.LANCHOR2
	.align	3
.LC74:
	.xword	.LC73
	.align	3
.LC75:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC77:
	.xword	.LC76
	.align	3
.LC79:
	.xword	.LC78
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_RecordVFMWState
	.type	Mp4_RecordVFMWState, %function
Mp4_RecordVFMWState:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	Mp4_RecordVFMWState, .-Mp4_RecordVFMWState
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_RecordFrameAtr
	.type	Mp4_RecordFrameAtr, %function
Mp4_RecordFrameAtr:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 20480
	mov	w19, w1
	bl	_mcount
	ldrb	w0, [x20, 879]
	cmp	w0, 15
	beq	.L441
	sub	w2, w0, #2
	uxtb	w2, w2
	cmp	w2, 1
	bls	.L434
	sub	w2, w0, #4
	uxtb	w2, w2
	cmp	w2, 1
	bls	.L435
	mov	w22, 5
	cmp	w0, 1
	csel	w22, wzr, w22, ne
.L426:
	ldr	w0, [x20, 2848]
	mov	w1, w19
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L424
	ldr	w2, [x20, 1544]
	mov	w1, w22
	str	w2, [x0, 68]
	ldr	w2, [x20, 1540]
	str	w2, [x0, 72]
	bl	SetAspectRatio
	ldr	x0, [x21, 22120]
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L442
.L430:
	ldr	w0, [x20, 1544]
	mov	x4, -1
	str	w0, [x19, 76]
	mov	w0, 29
	ldrb	w2, [x19, 64]
	ldr	w3, [x20, 1540]
	str	w3, [x19, 80]
	ldrb	w1, [x19, 65]
	ldr	w3, [x20, 1544]
	lsr	w3, w3, 1
	str	w3, [x19, 84]
	ldr	w3, [x20, 1540]
	lsr	w3, w3, 1
	str	w3, [x19, 88]
	ldr	w3, [x20, 2148]
	str	w3, [x19, 160]
	ldr	w3, [x20, 2144]
	str	w3, [x19, 156]
	ldrb	w3, [x20, 1480]
	bfi	w2, w3, 0, 2
	strb	w2, [x19, 64]
	ldrb	w3, [x20, 857]
	bfi	w2, w3, 5, 3
	strb	w2, [x19, 64]
	ldrb	w2, [x20, 886]
	and	w2, w2, 1
	bfi	w1, w2, 0, 2
	orr	w1, w1, 12
	strb	w1, [x19, 65]
	ldrb	w2, [x20, 1485]
	bfi	w1, w2, 4, 2
	strb	w1, [x19, 65]
	ldr	w1, [x19, 64]
	bfi	w1, w22, 14, 3
	str	w1, [x19, 64]
	lsr	w1, w1, 16
	ldrb	w2, [x20, 844]
	bfi	w1, w2, 1, 1
	strb	w1, [x19, 66]
	ldr	w1, [x20, 848]
	str	w1, [x19, 120]
	ldrb	w1, [x20, 1480]
	and	w1, w1, 3
	str	w1, [x19, 56]
	ldrb	w1, [x20, 1480]
	and	w1, w1, 3
	str	w1, [x19, 60]
	str	wzr, [x19, 52]
	ldr	x1, [x21, 22672]
	str	x1, [x19, 544]
	ldr	x1, [x21, 22680]
	str	x1, [x19, 552]
	ldr	x1, [x21, 22688]
	str	x1, [x19, 560]
	ldr	x1, [x21, 22696]
	str	x1, [x19, 568]
	ldr	x1, [x21, 22120]
	ldr	x1, [x1, 64]
	str	x1, [x19, 584]
	ldr	x1, [x21, 22120]
	ldr	x1, [x1, 80]
	str	x1, [x19, 592]
	ldr	x1, [x21, 22120]
	ldr	x1, [x1, 96]
	str	x1, [x19, 600]
	ldr	x1, [x21, 22120]
	ldr	w1, [x1, 112]
	str	w1, [x19]
	ldr	x1, [x21, 22120]
	ldr	w1, [x1, 116]
	str	w1, [x19, 4]
	ldr	x1, [x21, 22120]
	ldr	w1, [x1, 120]
	str	w1, [x19, 8]
	ldr	x1, [x21, 22120]
	ldr	w1, [x1, 136]
	str	w1, [x19, 12]
	ldr	x1, [x21, 22120]
	str	x4, [x1, 64]
	ldr	x3, [x19, 592]
	ldr	x2, [x19, 584]
	ldr	x1, .LC81
	bl	dprint_vfmw
	strb	wzr, [x19, 284]
	mov	w1, 1
	strb	w1, [x19, 289]
	add	x1, x19, 256
	strb	wzr, [x19, 291]
	mov	w0, 8
	mov	w2, 2
	stp	w0, w0, [x1, 48]
	stp	w2, w0, [x1, 40]
.L424:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L442:
	ldr	w1, [x19, 72]
	ldr	w3, [x19, 112]
	add	w1, w1, 15
	ldr	w2, [x19, 36]
	lsl	w0, w3, 4
	lsr	w1, w1, 4
	ldr	x4, [x19, 504]
	mul	w0, w1, w0
	add	w1, w3, w2
	str	w1, [x19, 28]
	add	w1, w0, w2
	str	w2, [x19, 20]
	add	x0, x4, x0, sxtw
	add	w3, w3, w1
	str	w1, [x19, 24]
	str	w3, [x19, 32]
	str	w1, [x19, 40]
	str	x0, [x19, 512]
	b	.L430
	.p2align 3
.L435:
	mov	w22, 2
	b	.L426
	.p2align 3
.L434:
	mov	w22, 1
	b	.L426
	.p2align 3
.L441:
	ldr	w1, [x20, 908]
	mov	w22, 0
	ldr	w0, [x20, 912]
	cmp	w1, wzr
	ccmp	w0, wzr, 4, ne
	cset	w3, eq
	cbnz	w3, .L426
	ldr	w2, [x20, 960]
	mov	w22, w3
	mul	w2, w0, w2
	cbz	w2, .L426
	ldr	w0, [x20, 956]
	lsl	w1, w1, 10
	mul	w0, w1, w0
	udiv	w0, w0, w2
	subs	w2, w0, #1365
	bmi	.L443
.L427:
	subs	w1, w0, #1820
	bmi	.L444
.L428:
	mov	w22, 2
	cmp	w2, w1
	csinc	w22, w22, wzr, ge
	b	.L426
	.p2align 3
.L443:
	mov	w2, 1365
	sub	w2, w2, w0
	b	.L427
	.p2align 3
.L444:
	mov	w1, 1820
	sub	w1, w1, w0
	b	.L428
	.size	Mp4_RecordFrameAtr, .-Mp4_RecordFrameAtr
	.align	3
.LC81:
	.xword	.LC80
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_Frame_Atr
	.type	Mp4_Frame_Atr, %function
Mp4_Frame_Atr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 20480
	bl	_mcount
	ldrb	w0, [x19, 1480]
	strb	w0, [x20, 2]
	cmp	w0, 4
	ldr	w0, [x19, 2848]
	beq	.L455
.L447:
	mov	w1, 1
	bl	FSP_NewLogicFs
	str	w0, [x19, 2876]
	tbnz	w0, #31, .L448
	ldr	w1, [x19, 2852]
	cbz	w1, .L448
	mov	w1, w0
	mov	x0, x20
	bl	Mp4_RecordFrameAtr
	str	wzr, [x19, 2152]
	mov	w0, 0
.L451:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L455:
	sxtw	x2, w0
	ldr	x3, .LC82
	lsl	x1, x2, 6
	add	x2, x1, x2, lsl 3
	add	x1, x3, x2
	ldr	w2, [x1, 12]
	add	w2, w2, 1
	str	w2, [x1, 12]
	b	.L447
	.p2align 3
.L448:
	ldr	x1, .LC84
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x19, 2848]
	ldr	w1, [x19, 2868]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L450
	ldr	w0, [x19, 2848]
	ldr	x1, [x20, 544]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2848]
	ldr	x1, [x20, 552]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2848]
	ldr	x1, [x20, 560]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2848]
	ldr	x1, [x20, 568]
	bl	FreeUsdByDec
	add	x0, x20, 512
	mov	w2, 1
	stp	xzr, xzr, [x0, 32]
	stp	xzr, xzr, [x0, 48]
	ldr	w0, [x19, 2848]
	ldr	w1, [x19, 2868]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 2848]
	mov	w2, 1
	ldr	w1, [x19, 2860]
	bl	FSP_ClearLogicFs
	str	wzr, [x19, 2860]
	ldr	w0, [x19, 2848]
	str	wzr, [x19, 2868]
	bl	FSP_GetNullLogicFs
	str	w0, [x19, 2860]
	str	w0, [x19, 2868]
.L450:
	ldr	w0, [x19, 2848]
	add	x1, x19, 2240
	str	wzr, [x19, 2856]
	bl	FSP_ClearNotInVoQueue
	mov	w0, -1
	b	.L451
	.size	Mp4_Frame_Atr, .-Mp4_Frame_Atr
	.align	3
.LC82:
	.xword	g_VfmwChanStat
	.align	3
.LC84:
	.xword	.LC83
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_Set_DecPar
	.type	Mp4_Set_DecPar, %function
Mp4_Set_DecPar:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	mov	x20, x2
	bl	_mcount
	ldr	x3, .LC85
	mov	x2, 48
	mov	w1, 0
	add	x0, x29, 64
	ldr	x3, [x3, 96]
	blr	x3
	ldrb	w0, [x20, 10]
	cmp	w0, 1
	beq	.L474
	add	x19, x22, 1048
	ldr	w0, [x20, 104]
	add	x21, x22, 20480
	and	w0, w0, -4
	str	w0, [x19, 180]
	ldr	w0, [x21, 1624]
	str	w0, [x19, 192]
	ubfiz	w0, w0, 3, 2
	ldr	x2, [x22, 22096]
	str	x2, [x19, 16]
	ldr	w2, [x21, 1632]
	add	w0, w0, w2
	str	w0, [x19, 200]
	ldr	w0, [x21, 1628]
	lsl	w0, w0, 3
	sub	w0, w0, w2
	str	w0, [x19, 208]
	ldr	w0, [x20, 104]
	str	w0, [x19, 196]
	ldr	x0, [x20, 88]
	str	x0, [x19, 24]
	ldr	w0, [x20, 104]
	ubfiz	w0, w0, 3, 2
	str	w0, [x19, 204]
	ldr	w0, [x20, 108]
	str	wzr, [x19, 188]
	lsl	w0, w0, 3
	str	w0, [x19, 212]
.L458:
	add	x20, x21, 828
	ldr	w2, [x20, 716]
	add	w0, w2, 15
	lsr	w0, w0, 4
	strh	w0, [x19, 176]
	ldr	w1, [x20, 712]
	add	w0, w1, 15
	lsr	w0, w0, 4
	strh	w0, [x19, 178]
	ldrb	w0, [x20, 652]
	strb	w0, [x22, 1048]
	cmp	w0, 3
	ldrb	w0, [x20, 62]
	strb	w0, [x19, 1]
	ldrb	w0, [x20, 9]
	strb	w0, [x19, 2]
	ldrb	w0, [x20, 659]
	strb	w0, [x19, 3]
	ldrb	w0, [x20, 664]
	strb	w0, [x19, 4]
	ldrb	w0, [x20, 663]
	strb	w0, [x19, 5]
	ldr	w0, [x20, 116]
	strb	w0, [x19, 6]
	ldrb	w0, [x20, 660]
	strb	w0, [x19, 7]
	ldrb	w0, [x20, 661]
	strb	w0, [x19, 8]
	ldrb	w0, [x20, 656]
	strb	w0, [x19, 9]
	ldrb	w0, [x20, 67]
	strb	w0, [x19, 10]
	ldrb	w0, [x20, 65]
	strb	w0, [x19, 11]
	ldrb	w0, [x20, 654]
	strb	w0, [x19, 12]
	ldrb	w0, [x20, 658]
	strb	w0, [x19, 13]
	ldrb	w0, [x20, 657]
	strb	w0, [x19, 14]
	ldrb	w0, [x20, 58]
	strb	w0, [x19, 15]
	ldr	w0, [x20, 748]
	str	w0, [x19, 216]
	ldr	w0, [x20, 744]
	str	w0, [x19, 220]
	ldrb	w0, [x20, 12]
	strb	w0, [x19, 162]
	ldrb	w0, [x20, 11]
	strb	w0, [x19, 161]
	ldrb	w0, [x20, 10]
	strb	w0, [x19, 160]
	ldrb	w0, [x20, 13]
	strb	w0, [x19, 163]
	ldrb	w0, [x20, 14]
	strb	w0, [x19, 164]
	ldrb	w0, [x20, 15]
	strb	w0, [x19, 165]
	str	w1, [x19, 14620]
	str	w2, [x19, 14624]
	ldrb	w0, [x20, 60]
	str	w0, [x19, 14628]
	ccmp	w0, 2, 0, eq
	beq	.L475
	ldrb	w0, [x20, 73]
	str	w0, [x19, 14636]
	str	wzr, [x19, 14632]
	str	wzr, [x19, 14640]
	str	wzr, [x19, 14644]
	str	wzr, [x19, 14648]
	str	wzr, [x19, 14652]
	str	wzr, [x19, 14656]
	str	wzr, [x19, 14660]
	str	wzr, [x19, 14664]
	str	wzr, [x19, 14668]
.L460:
	ldr	w1, [x21, 2876]
	ldr	w0, [x21, 2848]
	bl	FSP_GetLogicFs
	mov	x20, x0
	ldr	w1, [x21, 2860]
	ldr	w0, [x21, 2848]
	bl	FSP_GetLogicFs
	mov	x23, x0
	ldr	w1, [x21, 2868]
	ldr	w0, [x21, 2848]
	bl	FSP_GetLogicFs
	cmp	x20, xzr
	ccmp	x23, xzr, 4, ne
	ccmp	x0, xzr, 4, ne
	beq	.L476
	ldp	x5, x6, [x20, 32]
	cbz	x5, .L464
	cbz	x6, .L464
	ldr	w1, [x20, 8]
	str	w1, [x19, 240]
	ldr	w1, [x0, 8]
	str	w1, [x19, 244]
	ldr	x0, [x0, 32]
	cbz	x0, .L477
.L472:
	ldr	w0, [x0, 8]
	str	w0, [x19, 236]
	ldr	x0, [x23, 32]
	cbz	x0, .L478
.L473:
	ldr	w0, [x0, 8]
	add	x1, x22, 1080
	str	w0, [x19, 232]
	add	x3, x21, 1220
	add	x0, x21, 964
	ldr	x2, [x20, 32]
	ldr	w2, [x2, 8]
	str	w2, [x19, 224]
	ldr	x2, [x20, 40]
	ldr	w2, [x2, 8]
	str	w2, [x19, 14588]
	ldr	x2, [x20, 40]
	ldr	w2, [x2, 28]
	str	w2, [x19, 14600]
	ldr	x2, [x20, 40]
	ldr	w2, [x2, 32]
	str	w2, [x19, 14604]
	ldr	x2, [x20, 40]
	ldr	w2, [x2, 64]
	str	w2, [x19, 14608]
	ldr	x2, [x20, 40]
	ldr	w2, [x2, 48]
	str	w2, [x19, 14612]
	ldr	x2, [x20, 40]
	ldr	w2, [x2, 52]
	str	w2, [x19, 14616]
	.p2align 2
.L470:
	ldr	w2, [x0]
	add	x0, x0, 4
	strb	w2, [x1]
	add	x1, x1, 1
	cmp	x3, x0
	ldr	w2, [x0, 252]
	strb	w2, [x1, 63]
	bne	.L470
	ldrh	w1, [x19, 178]
	ldrh	w0, [x19, 176]
	mul	w0, w0, w1
	str	w0, [x21, 1512]
	ldr	x0, [x22, 22120]
	ldr	w1, [x0, 640]
	str	w1, [x19, 14672]
	ldr	w0, [x0, 692]
	str	w0, [x19, 14676]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
.L476:
	ldr	x2, .LC86
	mov	w3, 3328
	ldr	x1, .LC88
	mov	w0, 0
	add	x2, x2, 1280
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
.L474:
	add	x21, x22, 20480
	add	x19, x22, 1048
	ldr	w1, [x21, 1624]
	str	w1, [x19, 180]
	and	w3, w1, -4
	str	w3, [x19, 192]
	ubfiz	w1, w1, 3, 2
	ldr	x3, [x22, 22096]
	str	x3, [x19, 16]
	ldr	w3, [x21, 1632]
	add	w1, w1, w3
	str	w1, [x19, 200]
	ldr	w1, [x21, 1628]
	str	w0, [x19, 188]
	lsl	w0, w1, 3
	str	wzr, [x19, 196]
	sub	w0, w0, w3
	str	wzr, [x19, 204]
	str	wzr, [x19, 212]
	str	w0, [x19, 208]
	b	.L458
.L464:
	ldr	w2, [x21, 2860]
	mov	w0, 0
	ldr	w4, [x21, 2868]
	ldr	w3, [x21, 2876]
	ldr	x1, .LC90
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
.L478:
	ldr	x0, [x20, 32]
	b	.L473
.L477:
	ldr	x0, [x20, 32]
	b	.L472
.L475:
	add	x1, x29, 64
	mov	x0, x20
	bl	MP4_GetGMCparam
	ldrb	w2, [x20, 73]
	ldp	w6, w0, [x29, 80]
	ldr	w1, [x29, 64]
	ldp	w5, w4, [x29, 88]
	ldr	w3, [x29, 96]
	str	w1, [x19, 14632]
	str	w2, [x19, 14636]
	str	w0, [x19, 14644]
	ldp	w2, w1, [x29, 100]
	ldr	w0, [x29, 108]
	str	w6, [x19, 14640]
	str	w5, [x19, 14648]
	str	w4, [x19, 14652]
	str	w3, [x19, 14656]
	str	w2, [x19, 14660]
	str	w1, [x19, 14664]
	str	w0, [x19, 14668]
	b	.L460
	.size	Mp4_Set_DecPar, .-Mp4_Set_DecPar
	.align	3
.LC85:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC86:
	.xword	.LANCHOR1
	.align	3
.LC88:
	.xword	.LC87
	.align	3
.LC90:
	.xword	.LC89
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_Get_DecMode
	.type	Mp4_Get_DecMode, %function
Mp4_Get_DecMode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 20480
	ldr	w0, [x1, 1684]
	cmp	w0, 2
	ldr	x0, [x19, 22120]
	beq	.L491
	ldr	w0, [x0, 8]
	cmp	w0, 2
	beq	.L484
.L492:
	cmp	w0, 1
	beq	.L490
	cmp	w0, 4
	csel	w0, w0, wzr, eq
.L490:
	str	w0, [x1, 1684]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L491:
	ldr	w2, [x0, 8]
	cmp	w2, 2
	beq	.L484
	mov	w2, 1
	str	w2, [x1, 2232]
	ldr	w0, [x0, 8]
	cmp	w0, 2
	bne	.L492
.L484:
	mov	w0, 2
	str	w0, [x1, 1684]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	Mp4_Get_DecMode, .-Mp4_Get_DecMode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetTrailingOneLen
	.type	GetTrailingOneLen, %function
GetTrailingOneLen:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w1
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, x19, sxtw
	bl	_mcount
	mov	w2, 0
	ldrb	w1, [x19, -1]
	tbnz	x1, 0, .L495
	b	.L500
	.p2align 3
.L497:
	mov	w2, w0
.L495:
	lsr	w1, w1, 1
	add	w0, w2, 1
	tbnz	x1, 0, .L497
	add	w2, w2, 2
	cmp	w0, wzr
	csel	w0, w2, w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L500:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetTrailingOneLen, .-GetTrailingOneLen
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG4DEC_Init
	.type	MPEG4DEC_Init, %function
MPEG4DEC_Init:
	sub	sp, sp, #784
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x1, .LC92
	mov	w0, 2
	bl	dprint_vfmw
	cmp	x19, xzr
	ccmp	x21, xzr, 4, ne
	beq	.L509
	ldr	w0, [x21, 664]
	add	x20, x19, 20480
	ldr	x22, .LC95
	cmp	w0, 1
	beq	.L510
.L504:
	ldr	x3, [x22, 96]
	mov	x2, 23376
	mov	w1, 0
	mov	x0, x19
	ldr	w23, [x20, 2840]
	blr	x3
	str	w23, [x20, 2840]
	add	x0, x20, 2240
	bl	ResetVoQueue
	str	x21, [x19, 22120]
	mov	x0, x19
	str	wzr, [x21, 992]
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x20, 2848]
	beq	.L511
	mov	x0, x19
	bl	Global_Data_Init
	mov	w23, w0
	cbnz	w0, .L506
	mov	w0, 1
	ldr	x1, .LC99
	str	w0, [x20, 2156]
	mov	w0, 2
	str	wzr, [x20, 2184]
	bl	dprint_vfmw
	ldr	w21, [x21, 664]
	cmp	w21, 1
	beq	.L512
.L503:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, w23
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 784
	ret
	.p2align 3
.L512:
	ldr	x3, [x22, 104]
	add	x1, x29, 72
	mov	x2, 776
	add	x0, x20, 828
	add	x19, x19, 16384
	blr	x3
	mov	x2, 24
	add	x0, x29, 72
	ldr	x3, [x22, 104]
	add	x1, x0, x2
	add	x0, x19, 3632
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x29, 120
	mov	x2, 604
	add	x0, x19, 3656
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x29, 64
	mov	x2, 7
	add	x0, x20, 1604
	blr	x3
	strb	w21, [x20, 2885]
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 784
	ret
	.p2align 3
.L510:
	ldr	x3, [x22, 104]
	add	x1, x20, 828
	mov	x2, 776
	add	x0, x29, 72
	add	x23, x19, 16384
	blr	x3
	mov	x2, 24
	ldr	x3, [x22, 104]
	add	x0, x29, 72
	add	x1, x23, 3632
	add	x0, x0, x2
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x23, 3656
	mov	x2, 604
	add	x0, x29, 120
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 7
	add	x1, x20, 1604
	add	x0, x29, 64
	blr	x3
	b	.L504
	.p2align 3
.L506:
	mov	w23, -1
	b	.L503
	.p2align 3
.L509:
	ldr	x1, .LC94
	mov	w2, 3474
	mov	w0, 0
	mov	w23, -1
	bl	dprint_vfmw
	b	.L503
	.p2align 3
.L511:
	ldr	x1, .LC97
	mov	w0, 0
	mov	w23, -20
	bl	dprint_vfmw
	b	.L503
	.size	MPEG4DEC_Init, .-MPEG4DEC_Init
	.align	3
.LC92:
	.xword	.LC91
	.align	3
.LC94:
	.xword	.LC93
	.align	3
.LC95:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC97:
	.xword	.LC96
	.align	3
.LC99:
	.xword	.LC98
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG4DEC_Destroy
	.type	MPEG4DEC_Destroy, %function
MPEG4DEC_Destroy:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC101
	mov	w0, 2
	bl	dprint_vfmw
	cbz	x19, .L516
	add	x19, x19, 20480
	str	wzr, [x19, 2156]
.L513:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L516:
	ldr	x1, .LC102
	mov	w2, 3556
	mov	w0, 0
	bl	dprint_vfmw
	b	.L513
	.size	MPEG4DEC_Destroy, .-MPEG4DEC_Destroy
	.align	3
.LC101:
	.xword	.LC100
	.align	3
.LC102:
	.xword	.LC93
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG4DEC_RecycleImage
	.type	MPEG4DEC_RecycleImage, %function
MPEG4DEC_RecycleImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L521
	add	x19, x19, 20480
	mov	w1, w20
	mov	w2, 0
	ldr	w0, [x19, 2848]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 2848]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L520
	ldr	w0, [x19, 2848]
	ldr	x1, [x20, 544]
	bl	FreeUsdByDec
	str	xzr, [x20, 544]
	ldr	x1, [x20, 552]
	ldr	w0, [x19, 2848]
	bl	FreeUsdByDec
	str	xzr, [x20, 552]
	mov	w0, 1
.L519:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L520:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L521:
	ldr	x1, .LC103
	mov	w2, 3960
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -2
	b	.L519
	.size	MPEG4DEC_RecycleImage, .-MPEG4DEC_RecycleImage
	.align	3
.LC103:
	.xword	.LC93
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_SetImgFormat
	.type	MP4_SetImgFormat, %function
MP4_SetImgFormat:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 20480
	bl	_mcount
	ldr	w0, [x19, 2848]
	ldr	w1, [x19, 2876]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L522
	ldr	w2, [x19, 1544]
	cbnz	w2, .L535
.L524:
	ldp	w2, w1, [x0, 68]
	stp	w2, w1, [x0, 76]
.L525:
	ldrb	w3, [x19, 844]
	mov	w1, 8
	ldrb	w2, [x0, 66]
	mov	w4, 2
	bfi	w2, w3, 1, 1
	strb	w2, [x0, 66]
	mov	w2, 1
	ldr	w3, [x19, 848]
	strb	w2, [x0, 289]
	add	x2, x0, 256
	strb	wzr, [x0, 284]
	strb	wzr, [x0, 291]
	str	w3, [x0, 120]
	stp	w4, w1, [x2, 40]
	stp	w1, w1, [x2, 48]
.L522:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L535:
	ldr	w3, [x19, 1540]
	cbz	w3, .L524
	ldp	w3, w4, [x0, 68]
	cmp	w3, w2
	csel	w2, w3, w2, ls
	str	w2, [x0, 76]
	ldr	w1, [x19, 1540]
	cmp	w1, w4
	csel	w1, w1, w4, ls
	str	w1, [x0, 80]
	b	.L525
	.size	MP4_SetImgFormat, .-MP4_SetImgFormat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG4DEC_GetRemainImg
	.type	MPEG4DEC_GetRemainImg, %function
MPEG4DEC_GetRemainImg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L551
	ldr	x0, [x19, 22120]
	add	x20, x19, 20480
	ldr	w0, [x0, 24]
	cmp	w0, 1
	beq	.L539
	ldr	w0, [x20, 2848]
	ldr	w1, [x20, 2868]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L539
	ldr	w0, [x20, 2848]
	ldr	w1, [x20, 2868]
	bl	FSP_GetDisplay
	cmp	w0, 2
	mov	w23, w0
	beq	.L552
.L539:
	add	x21, x20, 2240
.L542:
	mov	x0, x21
	bl	GetVoLastImageID
.L548:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L552:
	mov	x0, x19
	add	x21, x20, 2240
	bl	MP4_SetImgFormat
	mov	w2, 1
	str	w2, [x22, 180]
	ldr	w1, [x22, 148]
	ldr	w0, [x20, 2848]
	bl	FSP_SetDisplay
	ldr	w0, [x20, 2848]
	mov	x4, x22
	mov	x3, x21
	mov	x2, x19
	mov	w1, w23
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L540
	ldr	w1, [x22, 148]
	mov	x0, x19
	bl	MPEG4DEC_RecycleImage
	ldr	w0, [x20, 2848]
	ldr	x1, [x22, 544]
	bl	FreeUsdByDec
	str	xzr, [x22, 544]
	ldr	x1, [x22, 552]
	ldr	w0, [x20, 2848]
	bl	FreeUsdByDec
	str	xzr, [x22, 552]
	b	.L542
	.p2align 3
.L540:
	ldr	w0, [x22, 152]
	cmp	w0, 100
	bhi	.L539
	ldr	w0, [x22, 68]
	cmp	w0, 31
	bls	.L539
	ldr	w1, [x22, 72]
	mov	w0, 0
	cmp	w1, 31
	bhi	.L548
	b	.L542
	.p2align 3
.L551:
	ldr	x1, .LC104
	mov	w2, 4020
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L548
	.size	MPEG4DEC_GetRemainImg, .-MPEG4DEC_GetRemainImg
	.align	3
.LC104:
	.xword	.LC93
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG4DEC_GetImageBuffer
	.type	MPEG4DEC_GetImageBuffer, %function
MPEG4DEC_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L560
	add	x19, x19, 20480
	ldr	w0, [x19, 2848]
	bl	FSP_IsNewFsAvalible
	cmp	w0, 1
	mov	w20, w0
	beq	.L555
	ldr	w0, [x19, 2848]
	mov	w20, 0
	bl	FSP_IsNewFsAvalible
	cmn	w0, #1
	beq	.L561
.L555:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L561:
	ldr	w0, [x19, 2848]
	add	x1, x19, 2240
	bl	FSP_ClearNotInVoQueue
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L560:
	ldr	x1, .LC105
	mov	w2, 4253
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L555
	.size	MPEG4DEC_GetImageBuffer, .-MPEG4DEC_GetImageBuffer
	.align	3
.LC105:
	.xword	.LC93
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_GetPacketState
	.type	MP4_GetPacketState, %function
MP4_GetPacketState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L566
	add	x19, x19, 16384
	mov	w0, 3
	ldr	w1, [x19, 3628]
	cmp	w1, 1
	csinv	w0, w0, wzr, eq
.L564:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L566:
	ldr	x1, .LC106
	mov	w2, 4271
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L564
	.size	MP4_GetPacketState, .-MP4_GetPacketState
	.align	3
.LC106:
	.xword	.LC93
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_ClearCurPacket
	.type	MP4_ClearCurPacket, %function
MP4_ClearCurPacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 24]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x19, 10]
	cbnz	w0, .L568
	ldrb	w0, [x19, 98]
	cmp	w0, 1
	beq	.L569
.L568:
	ldr	x3, .LC107
	mov	x2, 176
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L569:
	ldr	w1, [x19, 112]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
	b	.L568
	.size	MP4_ClearCurPacket, .-MP4_ClearCurPacket
	.align	3
.LC107:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_ClearCurPic
	.type	MP4_ClearCurPic, %function
MP4_ClearCurPic:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L577
	add	x22, x20, 16384
	add	x1, x20, 20480
	ldr	w0, [x22, 3620]
	ldr	w21, [x1, 2848]
	cmp	w0, wzr
	ble	.L575
	sub	w0, w0, #1
	add	x19, x20, 12288
	add	x0, x0, 3978
	add	x19, x19, 3620
	add	x20, x20, x0, lsl 2
	.p2align 2
.L574:
	ldr	w1, [x19], 4
	mov	w0, w21
	bl	SM_ReleaseStreamSeg
	cmp	x19, x20
	bne	.L574
.L575:
	str	wzr, [x22, 3620]
.L570:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L577:
	ldr	x1, .LC108
	mov	w2, 4303
	mov	w0, 0
	bl	dprint_vfmw
	b	.L570
	.size	MP4_ClearCurPic, .-MP4_ClearCurPic
	.align	3
.LC108:
	.xword	.LC93
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Vdm_Mem_Move
	.type	Vdm_Mem_Move, %function
Vdm_Mem_Move:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	w25, w2
	mov	w24, w3
	mov	w23, w4
	mov	w22, w5
	mov	w21, w6
	bl	_mcount
	add	w22, w22, 15
	ldr	x1, .LC110
	mov	w0, 2
	add	w21, w21, 15
	lsr	w22, w22, 4
	lsr	w21, w21, 4
	bl	dprint_vfmw
	str	w25, [x19, 1272]
	str	w24, [x19, 15636]
	add	x2, x19, 1048
	ldr	w0, [x20, 8]
	str	w0, [x19, 1288]
	strh	w22, [x19, 1224]
	strh	w21, [x19, 1226]
	str	w23, [x19, 1280]
	ldr	x0, [x19, 22120]
	ldr	x1, [x20, 40]
	ldr	w1, [x1, 28]
	str	w1, [x19, 15648]
	ldr	x1, [x20, 40]
	ldr	w1, [x1, 32]
	str	w1, [x19, 15652]
	ldr	x1, [x20, 40]
	ldr	w1, [x1, 64]
	str	w1, [x19, 15656]
	ldr	x1, [x20, 40]
	ldr	w1, [x1, 48]
	str	w1, [x19, 15660]
	ldr	x1, [x20, 40]
	ldr	w1, [x1, 52]
	str	w1, [x19, 15664]
	ldr	w1, [x0, 640]
	str	w1, [x19, 15720]
	ldr	w1, [x0, 692]
	str	w1, [x19, 15724]
	str	x2, [x19, 1040]
	ldr	w1, [x0, 984]
	cmp	w1, 1
	beq	.L588
	cmp	w1, 2
	beq	.L589
.L580:
	mov	w0, 1
	strb	w0, [x19, 1214]
.L578:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L588:
	cbz	x2, .L580
	add	x0, x19, 20480
	str	xzr, [x19, 1040]
	mov	w2, 0
	ldr	w1, [x0, 2876]
	ldr	w0, [x0, 2848]
	bl	FSP_SetDisplay
	mov	x0, x19
	bl	MP4_ClearCurPic
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L589:
	ldr	w0, [x0, 988]
	cmp	w0, wzr
	ccmp	x2, xzr, 4, gt
	beq	.L580
	add	x1, x19, 20480
	str	xzr, [x19, 1040]
	mov	w2, 0
	ldr	w0, [x1, 2848]
	ldr	w1, [x1, 2876]
	bl	FSP_SetDisplay
	ldr	x2, [x19, 22120]
	mov	x0, x19
	ldr	w1, [x2, 988]
	sub	w1, w1, #1
	str	w1, [x2, 988]
	bl	MP4_ClearCurPic
	b	.L578
	.size	Vdm_Mem_Move, .-Vdm_Mem_Move
	.align	3
.LC110:
	.xword	.LC109
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_GetScdUpMsg
	.type	MP4_GetScdUpMsg, %function
MP4_GetScdUpMsg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x1, [x19, 22120]
	add	x0, x19, 12288
	add	x19, x19, 20480
	add	x0, x0, 3616
	add	x19, x19, 2892
	ldr	w2, [x1, 936]
	cmp	w2, 1
	beq	.L593
.L591:
	ldr	x21, .LC111
	add	x20, x20, 80
	mov	x2, 4
	mov	x1, x20
	ldr	x3, [x21, 104]
	blr	x3
	ldr	x3, [x21, 104]
	mov	x2, 4
	mov	x1, x20
	mov	x0, x19
	blr	x3
.L590:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L593:
	ldr	w1, [x1, 992]
	cmp	w1, 1
	bne	.L591
	ldr	x3, .LC111
	mov	x2, 4
	mov	x1, x19
	ldr	x3, [x3, 104]
	blr	x3
	b	.L590
	.size	MP4_GetScdUpMsg, .-MP4_GetScdUpMsg
	.align	3
.LC111:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_Check_Slice_NotSH
	.type	Mp4_Check_Slice_NotSH, %function
Mp4_Check_Slice_NotSH:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 16384
	add	x3, x19, 20480
	ldrb	w0, [x0, 3675]
	ldrb	w2, [x3, 768]
	cbnz	w0, .L602
	add	x19, x19, 12288
	ldrb	w0, [x19, 3616]
	tst	w0, 120
	bne	.L602
	ldrh	w0, [x19, 3616]
	cmp	w2, 3
	ubfx	x0, x0, 7, 4
	add	w0, w0, 17
	bls	.L604
	ldr	x1, .LC114
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
.L595:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L604:
	ldr	x1, .LC112
	ldrb	w1, [x1,w2,uxtw]
	adr	x2, .Lrtx598
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx598:
	.section	.rodata
	.align	0
	.align	2
.L598:
	.byte	(.L603 - .Lrtx598) / 4
	.byte	(.L599 - .Lrtx598) / 4
	.byte	(.L600 - .Lrtx598) / 4
	.byte	(.L599 - .Lrtx598) / 4
	.text
	.p2align 3
.L603:
	mov	w1, 17
.L597:
	cmp	w1, w0
	ldr	x19, [sp, 16]
	csetm	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L600:
	ldrb	w2, [x3, 777]
	ldrb	w1, [x3, 776]
	mov	w3, 18
	cmp	w1, w2, uxtb
	csel	w1, w1, w2, cs
	uxtb	w1, w1
	add	w1, w1, 16
	cmp	w1, w3
	csel	w1, w1, w3, ge
	b	.L597
	.p2align 3
.L599:
	ldrb	w1, [x3, 776]
	add	w1, w1, 16
	b	.L597
	.p2align 3
.L602:
	mov	w0, -1
	b	.L595
	.size	Mp4_Check_Slice_NotSH, .-Mp4_Check_Slice_NotSH
	.align	3
.LC112:
	.xword	.L598
	.align	3
.LC114:
	.xword	.LC113
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_Combine_SliceData
	.type	Mp4_Combine_SliceData, %function
Mp4_Combine_SliceData:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	add	x0, x19, 16384
	add	x4, x19, 1296
	ldr	w3, [x19, 15632]
	ldr	w0, [x0, 3624]
	tbz	x0, 1, .L606
	add	x1, x19, 12288
	ldrb	w0, [x1, 3450]
	cmp	w0, 1
	beq	.L620
	cbnz	w0, .L614
	ldrb	w0, [x1, 3538]
	cmp	w0, 1
	bne	.L614
	sub	w2, w3, #1
	lsl	x0, x2, 3
	sub	x2, x0, x2
	add	x2, x4, x2, lsl 2
	ldr	w0, [x2, 12]
	cbnz	w0, .L616
	ldr	w0, [x2, 20]
	cbnz	w0, .L616
	ldr	w1, [x2, 8]
	add	w20, w1, w20, lsl 3
	str	w20, [x2, 8]
	ldr	w1, [x19, 15832]
	str	w1, [x2, 20]
	ldr	w1, [x19, 15836]
	lsl	w1, w1, 3
	str	w1, [x2, 12]
.L609:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L620:
	sub	w2, w3, #1
	cmp	w2, 510
	bhi	.L621
	lsl	x1, x2, 3
	sub	x1, x1, x2
	add	x2, x4, x1, lsl 2
	ldr	w1, [x2, 12]
	cbz	w1, .L610
	ldr	w3, [x2, 20]
	cbz	w3, .L610
	ldr	w4, [x19, 15744]
	cmp	w3, w4
	bhi	.L622
	add	w1, w1, w20, lsl 3
	mov	w0, 0
	str	w1, [x2, 12]
	b	.L609
	.p2align 3
.L610:
	ldr	w0, [x2, 16]
	ldr	w1, [x19, 15744]
	cmp	w1, w0
	bls	.L612
	ldr	w1, [x2, 8]
	mov	w0, 0
	add	w20, w1, w20, lsl 3
	str	w20, [x2, 8]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L612:
	lsl	w20, w20, 3
	str	w20, [x2, 12]
	mov	w0, 0
	ldr	w1, [x19, 15744]
	str	w1, [x2, 20]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L614:
	ldr	x1, .LC118
	mov	w2, 4460
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L609
	.p2align 3
.L616:
	mov	w0, -1
	b	.L609
	.p2align 3
.L606:
	ldr	x1, .LC118
	mov	w2, 4466
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L609
.L621:
	ldr	x1, .LC116
	mov	w2, w3
	bl	dprint_vfmw
	mov	w0, -1
	b	.L609
.L622:
	ldr	x1, .LC118
	mov	w2, 4436
	bl	dprint_vfmw
	mov	w0, -1
	b	.L609
	.size	Mp4_Combine_SliceData, .-Mp4_Combine_SliceData
	.align	3
.LC116:
	.xword	.LC115
	.align	3
.LC118:
	.xword	.LC117
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_Check_StreamType
	.type	MP4_Check_StreamType, %function
MP4_Check_StreamType:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	add	x2, x19, 12288
	add	x19, x19, 20480
	ldrb	w0, [x2, 3616]
	tbnz	x0, 0, .L624
	mov	w0, 2
	strb	w0, [x19, 837]
	ldr	w0, [x20]
	lsr	w0, w0, 8
	sub	w0, w0, #128
	cmp	w0, 3
	bhi	.L625
	ldrb	w0, [x2, 3616]
	orr	w0, w0, 2
	strb	w0, [x2, 3616]
.L625:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L624:
	mov	w0, 196
	str	w0, [x20]
	mov	w0, 1
	strb	w0, [x19, 837]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP4_Check_StreamType, .-MP4_Check_StreamType
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_Clean_HeadPacket
	.type	MP4_Clean_HeadPacket, %function
MP4_Clean_HeadPacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x22, x20, 20480
	bl	_mcount
	mov	w1, 64
	ldr	w0, [x22, 2124]
	ldr	w21, [x22, 2848]
	cmp	w0, w1
	csel	w0, w0, w1, le
	cmp	w0, wzr
	ble	.L629
	sub	w0, w0, #1
	add	x19, x22, 1868
	add	x0, x0, 4096
	add	x0, x0, 1492
	add	x20, x20, x0, lsl 2
	.p2align 2
.L628:
	ldr	w1, [x19], 4
	mov	w0, w21
	bl	SM_ReleaseStreamSeg
	cmp	x19, x20
	bne	.L628
.L629:
	ldr	x3, .LC119
	mov	x2, 456
	mov	w1, 0
	add	x0, x22, 1688
	ldr	x3, [x3, 96]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MP4_Clean_HeadPacket, .-MP4_Clean_HeadPacket
	.align	3
.LC119:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG4DEC_VDMPostProc
	.type	MPEG4DEC_VDMPostProc, %function
MPEG4DEC_VDMPostProc:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	mov	x19, x2
	mov	w20, w1
	bl	_mcount
	cmp	x21, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L682
	ldr	x4, [x21, 1040]
	add	x19, x21, 20480
	ldr	x5, .LC121
	mov	x2, 14680
	mov	w1, 0
	add	x0, x21, 1048
	ldrb	w6, [x4, 167]
	strb	w6, [x19, 844]
	ldr	x5, [x5, 96]
	ldr	w4, [x4, 14672]
	str	w4, [x19, 848]
	blr	x5
	mov	x0, x21
	bl	MP4_ClearCurPic
	mov	x0, x21
	bl	MP4_Clean_HeadPacket
	str	w20, [x19, 2152]
	ldr	w1, [x19, 2876]
	ldr	w0, [x19, 2848]
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	ldr	w1, [x19, 2868]
	ldr	w0, [x19, 2848]
	bl	FSP_GetFsImagePtr
	mov	x25, x0
	cbz	x24, .L683
	ldr	x1, .LC125
	mov	w0, 11
	ldr	w2, [x19, 2160]
	add	x22, x19, 2192
	mov	x20, 0
	bl	dprint_vfmw
	ldrb	w2, [x19, 1480]
	mov	w0, 11
	ldr	x1, .LC127
	bl	dprint_vfmw
	ldr	w0, [x19, 2152]
	str	w0, [x24, 152]
	ldr	w23, [x19, 2848]
.L636:
	ldr	x1, [x22, x20]
	mov	w0, w23
	bl	FreeUsdByDec
	str	xzr, [x22, x20]
	add	x20, x20, 8
	cmp	x20, 32
	bne	.L636
	ldrb	w0, [x19, 1480]
	cmp	w0, 2
	beq	.L637
	ldr	x1, [x21, 22120]
	ldr	w0, [x19, 2152]
	ldr	w2, [x1]
	cmp	w0, w2
	bhi	.L684
.L637:
	mov	x0, x21
	str	wzr, [x19, 2232]
	bl	MP4_SetImgFormat
	ldr	x0, [x21, 22120]
	ldr	w0, [x0, 24]
	cbz	w0, .L685
	ldr	w1, [x19, 2876]
	ldrb	w20, [x19, 1480]
	ldr	w23, [x19, 1572]
	str	w1, [x19, 2880]
.L643:
	cmn	w1, #1
	beq	.L645
	ldr	w0, [x19, 2848]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L686
	cmp	w20, 4
	ccmp	w23, wzr, 0, eq
	beq	.L687
	ldr	w2, [x0, 152]
	cbz	w2, .L648
	ldr	x0, [x21, 22120]
	ldr	w3, [x0, 4]
	cmp	w2, w3
	bhi	.L649
.L648:
	ldr	w0, [x19, 2848]
	ldr	w1, [x19, 2880]
	bl	FSP_GetLogicFs
	cbz	x0, .L680
	cmp	w20, 2
	beq	.L651
	ldrsb	w0, [x0, 1]
	cmp	w0, 2
	beq	.L651
	ldr	x1, .LC133
	mov	w0, 11
	ldr	w2, [x19, 2880]
	bl	dprint_vfmw
	.p2align 2
.L645:
	ldr	w1, [x19, 2160]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 2160]
.L679:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L685:
	ldrb	w20, [x19, 1480]
	cmp	w20, 2
	beq	.L641
	ldr	w0, [x19, 2856]
	cmp	w0, 1
	ble	.L642
	ldr	w1, [x19, 2860]
	str	w1, [x19, 2880]
	ldr	w23, [x19, 2864]
	ldrb	w20, [x21]
	b	.L643
	.p2align 3
.L649:
	ldr	x0, .LC128
	ldr	x4, [x0]
	cbz	x4, .L654
	ldr	w0, [x19, 2848]
	mov	w1, 104
	stp	w2, w3, [x29, 88]
	mov	w3, 8
	add	x2, x29, 88
	blr	x4
	ldr	x0, [x21, 22120]
	ldr	w2, [x22, 152]
	ldr	w3, [x0, 4]
.L654:
	ldr	x1, .LC135
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x19, 2848]
	ldr	x1, [x22, 544]
	bl	FreeUsdByDec
	str	xzr, [x22, 544]
	ldr	x1, [x22, 552]
	ldr	w0, [x19, 2848]
	bl	FreeUsdByDec
	str	xzr, [x22, 552]
	mov	w2, 0
	ldr	w0, [x19, 2848]
	ldr	w1, [x19, 2880]
	bl	FSP_SetDisplay
	b	.L645
	.p2align 3
.L651:
	ldr	w0, [x19, 2848]
	mov	w2, 1
	ldr	w1, [x19, 2880]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 2848]
	mov	x4, x22
	add	x3, x19, 2240
	mov	x2, x21
	mov	w1, 2
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L645
.L680:
	ldr	w0, [x19, 2848]
	ldr	x1, [x22, 544]
.L681:
	bl	FreeUsdByDec
	str	xzr, [x22, 544]
	ldr	x1, [x22, 552]
	ldr	w0, [x19, 2848]
	bl	FreeUsdByDec
	str	xzr, [x22, 552]
	mov	w2, 0
	ldr	w0, [x19, 2848]
	ldr	w1, [x19, 2880]
	bl	FSP_SetDisplay
	mov	w0, -1
	b	.L679
	.p2align 3
.L641:
	ldr	w1, [x19, 2876]
	str	w1, [x19, 2880]
	ldr	w23, [x19, 1572]
	cbz	x25, .L643
	ldr	x0, [x24, 584]
	ldr	x2, [x25, 584]
	cmp	x2, x0
	bge	.L643
	str	x2, [x24, 584]
	str	x0, [x25, 584]
	ldr	w1, [x19, 2880]
	b	.L643
	.p2align 3
.L642:
	mov	w0, -1
	str	w0, [x19, 2880]
	b	.L645
	.p2align 3
.L682:
	ldr	x1, .LC120
	mov	w2, 4082
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L679
.L684:
	ldr	x2, .LC128
	ldr	x4, [x2]
	cbz	x4, .L638
	str	w0, [x29, 88]
	mov	w3, 8
	ldr	w0, [x19, 2848]
	add	x2, x29, 88
	ldr	w5, [x1]
	mov	w1, 104
	str	w5, [x29, 92]
	blr	x4
.L638:
	ldr	w0, [x19, 2848]
	mov	w21, 1
	ldr	w1, [x19, 2868]
	str	w21, [x19, 2232]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L639
	ldr	w0, [x19, 2848]
	ldr	x1, [x20, 544]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2848]
	ldr	x1, [x20, 552]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2848]
	ldr	x1, [x20, 560]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2848]
	ldr	x1, [x20, 568]
	bl	FreeUsdByDec
	add	x0, x20, 512
	mov	w2, w21
	stp	xzr, xzr, [x0, 32]
	stp	xzr, xzr, [x0, 48]
	ldr	w0, [x19, 2848]
	ldr	w1, [x19, 2868]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 2848]
	mov	w2, w21
	ldr	w1, [x19, 2860]
	bl	FSP_ClearLogicFs
	str	wzr, [x19, 2860]
	ldr	w0, [x19, 2848]
	str	wzr, [x19, 2868]
	bl	FSP_GetNullLogicFs
	str	w0, [x19, 2860]
	str	w0, [x19, 2868]
.L639:
	mov	w0, -1
	str	wzr, [x19, 2856]
	b	.L679
.L687:
	ldr	w2, [x19, 2848]
	ldr	x1, .LC131
	mov	w0, w2
	sxtw	x2, w2
	lsl	x3, x2, 6
	add	x2, x3, x2, lsl 3
	add	x1, x1, x2
	ldr	w2, [x1, 16]
	add	w2, w2, 1
	str	w2, [x1, 16]
	ldr	x1, [x22, 544]
	b	.L681
.L683:
	ldr	x1, .LC123
	mov	x3, x0
	mov	x2, 0
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L679
.L686:
	ldr	x1, .LC130
	mov	w2, 4173
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L679
	.size	MPEG4DEC_VDMPostProc, .-MPEG4DEC_VDMPostProc
	.align	3
.LC120:
	.xword	.LC93
	.align	3
.LC121:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC123:
	.xword	.LC122
	.align	3
.LC125:
	.xword	.LC124
	.align	3
.LC127:
	.xword	.LC126
	.align	3
.LC128:
	.xword	g_event_report
	.align	3
.LC130:
	.xword	.LC129
	.align	3
.LC131:
	.xword	g_VfmwChanStat
	.align	3
.LC133:
	.xword	.LC132
	.align	3
.LC135:
	.xword	.LC134
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_Record_SlcSegID
	.type	MP4_Record_SlcSegID, %function
MP4_Record_SlcSegID:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 16384
	bl	_mcount
	ldr	w0, [x20, 3620]
	cmp	w0, 1022
	bhi	.L691
	add	x1, x19, x0, uxtw 2
	ldr	w4, [x19, 15752]
	add	x3, x19, 12288
	add	w2, w0, 1
	str	w4, [x1, 15908]
	str	w2, [x20, 3620]
	ldrb	w1, [x3, 3450]
	cbnz	w1, .L688
	ldrb	w1, [x3, 3538]
	cmp	w1, 1
	beq	.L692
.L688:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L691:
	mov	x0, x19
	bl	MP4_Clean_HeadPacket
	mov	x0, x19
	bl	MP4_ClearCurPic
	add	x0, x19, 20480
	add	x1, x19, 12288
	add	x1, x1, 3440
	ldr	w0, [x0, 2848]
	bl	MP4_ClearCurPacket
	ldr	w2, [x20, 3620]
	mov	w3, 1022
	ldr	x1, .LC137
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L692:
	add	x2, x19, x2, uxtw 2
	ldr	w1, [x19, 15840]
	add	w0, w0, 2
	str	w1, [x2, 15908]
	str	w0, [x20, 3620]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP4_Record_SlcSegID, .-MP4_Record_SlcSegID
	.align	3
.LC137:
	.xword	.LC136
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_Syntax_ShortHeader
	.type	Mp4_Syntax_ShortHeader, %function
Mp4_Syntax_ShortHeader:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	w19, w2
	mov	x20, x1
	bl	_mcount
	ldr	w2, [x21, 15632]
	cbnz	w2, .L730
.L694:
	mov	x1, x20
	mov	w2, w19
	add	x0, x29, 72
	add	x20, x21, 20480
	bl	BsInit
	ldr	x3, .LC140
	mov	x2, 60
	mov	w1, 0
	add	x0, x20, 768
	ldr	x3, [x3, 96]
	blr	x3
	mov	w1, 22
	add	x0, x29, 72
	bl	BsSkip
	mov	w1, 13
	add	x0, x29, 72
	bl	BsSkip
	mov	w1, 3
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	sub	w1, w0, #1
	strb	w0, [x20, 778]
	cmp	w1, 3
	bls	.L731
	strb	wzr, [x20, 1609]
	add	x0, x29, 72
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC142
	ldr	x4, [x0]
	cbz	x4, .L716
	ldr	w0, [x20, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
	ldr	x23, [sp, 48]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L731:
	ldr	x0, .LC141
	ldrb	w0, [x0,w1,uxtw]
	adr	x1, .Lrtx697
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx697:
	.section	.rodata
	.align	0
	.align	2
.L697:
	.byte	(.L696 - .Lrtx697) / 4
	.byte	(.L698 - .Lrtx697) / 4
	.byte	(.L699 - .Lrtx697) / 4
	.byte	(.L700 - .Lrtx697) / 4
	.text
	.p2align 3
.L699:
	mov	w3, 18
	mov	w2, 22
	mov	w1, 352
	mov	w0, 288
	strb	w3, [x20, 779]
	strb	w2, [x20, 780]
	str	w0, [x20, 1540]
	str	w1, [x20, 1544]
.L701:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	ldrb	w1, [x20, 835]
	strb	w0, [x20, 768]
	cmp	w1, 2
	beq	.L703
	ldr	w1, [x20, 2232]
	cmp	w1, 1
	ccmp	w0, wzr, 4, eq
	bne	.L703
	mov	w1, 4
	add	x0, x29, 72
	bl	BsSkip
	mov	w1, 5
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L729
	mov	w0, 1
.L729:
	strb	w0, [x20, 775]
	mov	w1, 1
	add	x0, x29, 72
	lsl	w22, w19, 3
	mov	w19, 0
	bl	BsSkip
.L709:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	cmp	w0, 1
	beq	.L732
	add	w19, w19, 1
	cmp	w19, 15
	bls	.L710
.L728:
	strb	wzr, [x20, 1609]
	add	x0, x29, 72
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC142
	ldr	x4, [x0]
	cbz	x4, .L716
	ldr	w0, [x20, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 103
	blr	x4
	ldr	x23, [sp, 48]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L698:
	mov	w3, 9
	mov	w2, 11
	mov	w1, 176
	mov	w0, 144
	strb	w3, [x20, 779]
	strb	w2, [x20, 780]
	str	w0, [x20, 1540]
	str	w1, [x20, 1544]
	b	.L701
	.p2align 3
.L696:
	mov	w3, 6
	mov	w2, 8
	mov	w1, 128
	mov	w0, 96
	strb	w3, [x20, 779]
	strb	w2, [x20, 780]
	str	w0, [x20, 1540]
	str	w1, [x20, 1544]
	b	.L701
	.p2align 3
.L700:
	mov	w3, 18
	mov	w2, 88
	mov	w1, 704
	mov	w0, 576
	strb	w3, [x20, 779]
	strb	w2, [x20, 780]
	str	w0, [x20, 1540]
	str	w1, [x20, 1544]
	b	.L701
	.p2align 3
.L732:
	add	x0, x29, 72
	add	w19, w19, 1
	bl	BsPos
	cmp	w0, w22
	mov	w1, 8
	add	x0, x29, 72
	bgt	.L733
	bl	BsSkip
	cmp	w19, 15
	bls	.L709
	b	.L728
	.p2align 3
.L730:
	ldr	x1, .LC139
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x21, 15632]
	b	.L694
	.p2align 3
.L710:
	add	x23, x21, 16384
	mov	w2, 1
	strb	w2, [x20, 1609]
	add	x0, x29, 72
	ldr	w1, [x23, 3624]
	orr	w1, w1, 2
	str	w1, [x23, 3624]
	ldr	w1, [x21, 15632]
	add	w1, w1, 1
	str	w1, [x21, 15632]
	strb	w2, [x20, 776]
	bl	BsPos
	mov	w19, w0
	asr	w0, w0, 31
	sub	w22, w22, w19
	lsr	w0, w0, 29
	str	w22, [x21, 1304]
	add	w1, w19, w0
	add	w2, w19, 7
	ldr	w3, [x20, 1632]
	and	w1, w1, 7
	sub	w0, w1, w0
	cmp	w19, wzr
	add	w0, w3, w0
	strb	w0, [x21, 1302]
	csel	w0, w2, w19, lt
	add	x1, x21, 12288
	ldr	w2, [x20, 1624]
	add	w0, w2, w0, asr 3
	str	w0, [x21, 1312]
	ldrb	w0, [x1, 3450]
	cbz	w0, .L734
.L711:
	strb	wzr, [x21, 1303]
	str	wzr, [x21, 1308]
	str	wzr, [x21, 1316]
.L712:
	ldrb	w0, [x20, 768]
	strb	w0, [x21, 1300]
	ldrb	w0, [x20, 777]
	strb	w0, [x21, 1298]
	ldrb	w0, [x20, 776]
	strb	w0, [x21, 1297]
	ldrb	w0, [x20, 775]
	strb	w0, [x21, 1301]
	ldrb	w0, [x20, 772]
	strb	w0, [x21, 1299]
	ldr	w2, [x23, 3620]
	cbnz	w2, .L735
.L713:
	mov	x0, x21
	bl	MP4_Record_SlcSegID
	mov	w0, w19
.L727:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L703:
	add	x0, x29, 72
	bl	BsPos
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L734:
	ldrb	w0, [x1, 3538]
	cmp	w0, 1
	bne	.L711
	ldr	w0, [x21, 15836]
	ldr	w1, [x21, 15832]
	lsl	w0, w0, 3
	strb	wzr, [x21, 1303]
	str	w0, [x21, 1308]
	str	w1, [x21, 1316]
	b	.L712
	.p2align 3
.L716:
	mov	w0, w19
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
.L735:
	ldr	x1, .LC144
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x21
	bl	MP4_ClearCurPic
	b	.L713
.L733:
	bl	BsPos
	b	.L727
	.size	Mp4_Syntax_ShortHeader, .-Mp4_Syntax_ShortHeader
	.align	3
.LC139:
	.xword	.LC138
	.align	3
.LC140:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC141:
	.xword	.L697
	.align	3
.LC142:
	.xword	g_event_report
	.align	3
.LC144:
	.xword	.LC143
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_Syntax_Vop
	.type	Mp4_Syntax_Vop, %function
Mp4_Syntax_Vop:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	w21, w2
	mov	x22, x1
	bl	_mcount
	ldr	w2, [x20, 15632]
	cbnz	w2, .L817
	add	x19, x20, 20480
	ldrb	w0, [x19, 829]
	cbnz	w0, .L738
.L818:
	strb	wzr, [x19, 1609]
	mov	w0, 32
.L739:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L817:
	ldr	x1, .LC145
	mov	w0, 1
	add	x19, x20, 20480
	bl	dprint_vfmw
	str	wzr, [x20, 15632]
	ldrb	w0, [x19, 829]
	cbz	w0, .L818
.L738:
	mov	x1, x22
	mov	w2, w21
	add	x0, x29, 120
	add	x22, x19, 768
	bl	BsInit
	ldr	x23, .LC146
	mov	x2, 60
	mov	w1, 0
	mov	x0, x22
	ldr	x3, [x23, 96]
	blr	x3
	strb	wzr, [x19, 1609]
	mov	w1, 32
	add	x0, x29, 120
	bl	BsSkip
	mov	w1, 2
	add	x0, x29, 120
	bl	BsGet
	strb	w0, [x19, 768]
	ldr	x1, .LC148
	uxtb	w2, w0
	mov	w0, 18
	bl	dprint_vfmw
	ldrb	w0, [x19, 768]
	cmp	w0, 3
	beq	.L819
.L740:
	ldrb	w1, [x19, 835]
	cmp	w0, wzr
	cset	w0, ne
	cmp	w1, 1
	cset	w2, eq
	tst	w0, w2
	bne	.L743
	cmp	w1, 2
	beq	.L743
	ldr	w1, [x19, 2232]
	cmp	w1, 1
	cset	w1, eq
	tst	w0, w1
	bne	.L743
	lsl	w21, w21, 3
	mov	w24, 0
	mov	w25, 6400
	b	.L746
	.p2align 3
.L821:
	add	x0, x29, 120
	add	w24, w24, 1
	bl	BsPos
	cmp	w0, w21
	bgt	.L820
	cmp	w24, w25
	beq	.L747
.L746:
	mov	w1, 1
	add	x0, x29, 120
	bl	BsGet
	cbnz	w0, .L821
	mov	w0, 6399
	cmp	w24, w0
	bhi	.L747
	mov	w1, 1
	add	x0, x29, 120
	bl	BsGet
	cbz	w0, .L816
	ldr	w1, [x19, 944]
	mov	w0, 0
	cbnz	w1, .L822
.L750:
	str	w0, [x19, 1552]
	mov	w1, 1
	str	w24, [x19, 1548]
	add	x0, x29, 120
	bl	BsGet
	cbz	w0, .L816
	mov	w1, 1
	add	x0, x29, 120
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 769]
	cbz	w0, .L823
	ldrb	w0, [x19, 768]
	cmp	w0, 1
	beq	.L753
	cmp	w0, 3
	beq	.L824
.L754:
	strb	wzr, [x19, 770]
.L755:
	ldrb	w0, [x19, 884]
	add	x24, x20, 16384
	strb	wzr, [x19, 771]
	cmp	w0, 2
	beq	.L756
	mov	w1, 3
	add	x0, x29, 120
	add	x24, x20, 16384
	bl	BsGet
	strb	w0, [x19, 772]
	ldrb	w0, [x24, 3666]
	cbnz	w0, .L825
	mov	w0, 2
	strb	wzr, [x19, 774]
	strb	w0, [x19, 773]
.L758:
	ldrb	w0, [x19, 888]
	sub	w0, w0, #1
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L759
.L762:
	mov	w1, 5
	add	x0, x29, 120
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L813
	mov	w0, 1
.L813:
	strb	w0, [x19, 775]
	ldrb	w0, [x19, 768]
	cbnz	w0, .L826
.L756:
	mov	w0, 1
	strb	w0, [x19, 1609]
	ldr	x4, [x23, 104]
	mov	x1, x22
	ldr	w3, [x24, 3624]
	mov	x2, 60
	add	x0, x19, 1480
	orr	w3, w3, 2
	str	w3, [x24, 3624]
	ldr	w3, [x20, 15632]
	add	w3, w3, 1
	str	w3, [x20, 15632]
	blr	x4
	add	x0, x29, 120
	bl	BsPos
	mov	w22, w0
	asr	w0, w0, 31
	sub	w21, w21, w22
	lsr	w0, w0, 29
	str	w21, [x20, 1304]
	add	w1, w22, w0
	add	w2, w22, 7
	ldr	w3, [x19, 1632]
	and	w1, w1, 7
	sub	w0, w1, w0
	cmp	w22, wzr
	add	w0, w3, w0
	strb	w0, [x20, 1302]
	csel	w0, w2, w22, lt
	add	x1, x20, 12288
	ldr	w2, [x19, 1624]
	add	w0, w2, w0, asr 3
	str	w0, [x20, 1312]
	ldrb	w0, [x1, 3450]
	cbnz	w0, .L770
	ldrb	w0, [x1, 3538]
	cmp	w0, 1
	beq	.L827
.L770:
	strb	wzr, [x20, 1303]
	str	wzr, [x20, 1308]
	str	wzr, [x20, 1316]
.L771:
	ldrb	w0, [x19, 768]
	strb	w0, [x20, 1300]
	ldrb	w0, [x19, 777]
	strb	w0, [x20, 1298]
	ldrb	w0, [x19, 776]
	strb	w0, [x20, 1297]
	ldrb	w0, [x19, 775]
	strb	w0, [x20, 1301]
	ldrb	w0, [x19, 772]
	strb	w0, [x20, 1299]
	ldr	w2, [x24, 3620]
	cbnz	w2, .L828
.L772:
	mov	x0, x20
	bl	MP4_Record_SlcSegID
	mov	w0, w22
	b	.L739
	.p2align 3
.L747:
	strb	wzr, [x19, 1609]
	add	x0, x29, 120
	bl	BsPos
	mov	w19, w0
	ldr	x1, .LC156
	mov	w2, w24
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w19
	b	.L739
.L824:
	ldrb	w0, [x19, 888]
	cmp	w0, 2
	bne	.L754
.L753:
	mov	w1, 1
	add	x0, x29, 120
	bl	BsGet
	strb	w0, [x19, 770]
	b	.L755
	.p2align 3
.L820:
	add	x0, x29, 120
	bl	BsPos
	mov	w19, w0
	ldr	x1, .LC154
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w19
	b	.L739
	.p2align 3
.L819:
	ldr	x1, .LC149
	ldr	w1, [x1]
	tbnz	x1, 3, .L740
	strb	wzr, [x19, 1609]
	add	x0, x29, 120
	bl	BsPos
	mov	w20, w0
	ldr	x0, .LC150
	ldr	x4, [x0]
	cbz	x4, .L741
	ldr	w0, [x19, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 103
	blr	x4
.L741:
	ldr	x1, .LC152
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w20
	b	.L739
	.p2align 3
.L743:
	add	x0, x29, 120
	bl	BsPos
	b	.L739
	.p2align 3
.L816:
	ldr	x1, .LC157
	mov	w0, 1
	bl	dprint_vfmw
	strb	wzr, [x19, 1609]
	add	x0, x29, 120
	bl	BsPos
	mov	w20, w0
	ldr	x0, .LC150
	ldr	x4, [x0]
	cbz	x4, .L775
	ldr	w0, [x19, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 103
	blr	x4
	mov	w0, w20
	b	.L739
.L822:
	add	x0, x29, 120
	bl	BsGet
	b	.L750
.L775:
	mov	w0, w20
	b	.L739
.L828:
	ldr	x1, .LC162
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x20
	bl	MP4_ClearCurPic
	b	.L772
.L823:
	add	x20, x20, 16384
	mov	w0, 4
	mov	w1, 1
	strb	w0, [x19, 768]
	strb	w0, [x19, 1480]
	add	x0, x29, 120
	strb	w1, [x19, 1609]
	ldr	w1, [x20, 3624]
	orr	w1, w1, 128
	str	w1, [x20, 3624]
	bl	BsPos
	b	.L739
.L825:
	mov	w1, 1
	add	x0, x29, 120
	bl	BsGet
	strb	w0, [x19, 773]
	mov	w1, 1
	add	x0, x29, 120
	bl	BsGet
	strb	w0, [x19, 774]
	b	.L758
.L826:
	mov	w1, 3
	add	x0, x29, 120
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 776]
	cbz	w0, .L829
	ldrb	w0, [x19, 768]
	cmp	w0, 2
	bne	.L756
	mov	w1, 3
	add	x0, x29, 120
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 777]
	cbnz	w0, .L756
	strb	wzr, [x19, 1609]
	add	x0, x29, 120
	bl	BsPos
	mov	w20, w0
	ldr	x0, .LC150
	ldr	x4, [x0]
	cbz	x4, .L769
	ldr	w0, [x19, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 103
	blr	x4
.L769:
	ldr	x1, .LC161
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w20
	b	.L739
.L759:
	ldrb	w0, [x19, 768]
	cmp	w0, 3
	bne	.L762
	ldrb	w0, [x19, 900]
	cbz	w0, .L762
	mov	x28, 500
	mov	w25, 0
	movk	x28, 0x19d, lsl 32
	b	.L766
.L763:
	ldr	x0, [x20, 22064]
	mov	w1, 1
	cmp	x0, x28
	beq	.L764
	add	x0, x29, 120
	bl	BsSkip
.L764:
	add	x0, x29, 120
	bl	bs_get_spritetrajectory
	mov	w2, w0
	cbnz	w0, .L830
.L765:
	mov	w1, 1
	add	x0, x29, 120
	bl	BsSkip
	add	x0, x20, x25, uxtw 3
	add	w25, w25, 1
	add	x0, x0, 20480
	str	w27, [x0, 804]
	str	w26, [x0, 808]
	ldrb	w0, [x19, 900]
	cmp	w0, w25
	bls	.L762
.L766:
	add	x0, x29, 120
	mov	w27, 0
	mov	w26, 0
	bl	bs_get_spritetrajectory
	mov	w2, w0
	cbz	w0, .L763
	mov	w1, w0
	add	x0, x29, 120
	str	w2, [x29, 108]
	bl	BsGet
	mov	w27, w0
	ldr	w2, [x29, 108]
	mov	w0, 1
	lsl	w1, w0, w2
	sub	w0, w2, #1
	asr	w0, w27, w0
	sub	w1, w1, #1
	eor	w1, w1, w27
	cbnz	w0, .L763
	neg	w27, w1
	b	.L763
.L830:
	mov	w1, w0
	add	x0, x29, 120
	str	w2, [x29, 108]
	bl	BsGet
	mov	w26, w0
	ldr	w2, [x29, 108]
	mov	w0, 1
	lsl	w1, w0, w2
	sub	w0, w2, #1
	asr	w0, w26, w0
	sub	w1, w1, #1
	eor	w1, w1, w26
	cbnz	w0, .L765
	neg	w26, w1
	b	.L765
.L827:
	ldr	w0, [x20, 15836]
	ldr	w1, [x20, 15832]
	lsl	w0, w0, 3
	strb	wzr, [x20, 1303]
	str	w0, [x20, 1308]
	str	w1, [x20, 1316]
	b	.L771
.L829:
	strb	wzr, [x19, 1609]
	add	x0, x29, 120
	bl	BsPos
	mov	w20, w0
	ldr	x0, .LC150
	ldr	x4, [x0]
	cbz	x4, .L768
	ldr	w0, [x19, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 103
	blr	x4
.L768:
	ldrb	w2, [x19, 768]
	mov	w0, 1
	ldr	x1, .LC159
	bl	dprint_vfmw
	mov	w0, w20
	b	.L739
	.size	Mp4_Syntax_Vop, .-Mp4_Syntax_Vop
	.align	3
.LC145:
	.xword	.LC138
	.align	3
.LC146:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC148:
	.xword	.LC147
	.align	3
.LC149:
	.xword	g_VdmCharacter
	.align	3
.LC150:
	.xword	g_event_report
	.align	3
.LC152:
	.xword	.LC151
	.align	3
.LC154:
	.xword	.LC153
	.align	3
.LC156:
	.xword	.LC155
	.align	3
.LC157:
	.xword	.LC36
	.align	3
.LC159:
	.xword	.LC158
	.align	3
.LC161:
	.xword	.LC160
	.align	3
.LC162:
	.xword	.LC143
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_Syntax_Slice_NotSH
	.type	Mp4_Syntax_Slice_NotSH, %function
Mp4_Syntax_Slice_NotSH:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	mov	x22, x1
	mov	w21, w2
	bl	_mcount
	ldr	w20, [x19, 15632]
	sub	w0, w20, #1
	cmp	w0, 510
	bhi	.L852
	add	x24, x19, 12288
	add	w0, w20, 1
	str	w0, [x19, 15632]
	mov	x1, x22
	mov	w2, w21
	add	x0, x29, 88
	ldrh	w22, [x24, 3616]
	add	x23, x19, 20480
	bl	BsInit
	ubfx	x22, x22, 7, 4
	add	x0, x29, 88
	add	w22, w22, 17
	mov	w1, w22
	bl	BsSkip
	ldr	w22, [x23, 1540]
	ldr	w0, [x23, 1544]
	add	w22, w22, 15
	add	w0, w0, 15
	lsr	w22, w22, 4
	lsr	w0, w0, 4
	mul	w22, w0, w22
	cbz	w22, .L834
	mov	w0, w22
	mov	w1, 0
	.p2align 2
.L835:
	add	w1, w1, 1
	lsr	w0, w0, 1
	sxth	w1, w1
	cbnz	w0, .L835
	add	x0, x29, 88
	uxtw	x20, w20
	bl	BsGet
	lsl	x1, x20, 3
	sub	w3, w22, #1
	sub	x1, x1, x20
	cmp	w0, w3
	add	x1, x19, x1, lsl 2
	str	w0, [x1, 1320]
	bhi	.L853
.L836:
	lsl	x22, x20, 3
	mov	w1, 5
	sub	x22, x22, x20
	add	x0, x29, 88
	add	x22, x19, x22, lsl 2
	bl	BsGet
	mov	w1, 1
	strb	w0, [x22, 1301]
	add	x0, x29, 88
	bl	BsGet
	cbnz	w0, .L854
	ldrb	w0, [x23, 768]
	lsl	w21, w21, 3
	strb	w0, [x22, 1300]
	add	x25, x19, 16384
	ldrb	w0, [x23, 772]
	strb	w0, [x22, 1299]
.L840:
	lsl	x22, x20, 3
	ldrb	w1, [x23, 776]
	sub	x22, x22, x20
	add	x0, x29, 88
	add	x22, x19, x22, lsl 2
	strb	w1, [x22, 1297]
	ldrb	w1, [x23, 777]
	strb	w1, [x22, 1298]
	ldr	w1, [x25, 3624]
	orr	w1, w1, 16
	str	w1, [x25, 3624]
	bl	BsPos
	mov	w25, w0
	asr	w0, w0, 31
	sub	w21, w21, w25
	lsr	w0, w0, 29
	str	w21, [x22, 1304]
	add	w1, w25, w0
	add	w2, w25, 7
	ldr	w3, [x23, 1632]
	and	w1, w1, 7
	sub	w0, w1, w0
	cmp	w25, wzr
	add	w0, w3, w0
	strb	w0, [x22, 1302]
	csel	w0, w2, w25, lt
	ldr	w1, [x23, 1624]
	add	w0, w1, w0, asr 3
	str	w0, [x22, 1312]
	ldrb	w0, [x24, 3450]
	cbnz	w0, .L841
	ldrb	w0, [x24, 3538]
	cmp	w0, 1
	beq	.L855
.L841:
	lsl	x0, x20, 3
	sub	x20, x0, x20
	add	x20, x19, x20, lsl 2
	strb	wzr, [x20, 1303]
	str	wzr, [x20, 1308]
	str	wzr, [x20, 1316]
.L842:
	mov	x0, x19
	bl	MP4_Record_SlcSegID
	mov	w0, w25
.L851:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L854:
	lsl	w21, w21, 3
	.p2align 2
.L838:
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w22, w0
	add	x0, x29, 88
	bl	BsPos
	cmp	w22, wzr
	ccmp	w0, w21, 0, ne
	blt	.L838
	mov	w1, 1
	add	x25, x19, 16384
	add	x0, x29, 88
	bl	BsSkip
	ldr	w1, [x25, 3724]
	cbnz	w1, .L856
.L839:
	mov	w1, 1
	add	x0, x29, 88
	lsl	x22, x20, 3
	sub	x22, x22, x20
	bl	BsSkip
	mov	w1, 2
	add	x0, x29, 88
	add	x22, x19, x22, lsl 2
	bl	BsGet
	mov	w1, 3
	strb	w0, [x22, 1300]
	add	x0, x29, 88
	bl	BsGet
	strb	w0, [x22, 1299]
	ldrb	w1, [x22, 1300]
	cbz	w1, .L840
	mov	w1, 3
	add	x0, x29, 88
	bl	BsSkip
	ldrb	w0, [x22, 1300]
	cmp	w0, 2
	bne	.L840
	mov	w1, 3
	add	x0, x29, 88
	bl	BsSkip
	b	.L840
	.p2align 3
.L852:
	add	x0, x19, 20480
	add	x1, x19, 12288
	add	x1, x1, 3440
	ldr	w0, [x0, 2848]
	bl	MP4_ClearCurPacket
	mov	x0, x19
	bl	MP4_ClearCurPic
	add	x4, x19, 16384
	mov	w3, -435
	ldr	x2, .LC163
	mov	w0, 1
	ldr	x1, .LC165
	ldr	w5, [x4, 3624]
	add	x2, x2, 1296
	and	w3, w5, w3
	str	w3, [x4, 3624]
	ldr	w3, [x19, 15632]
	bl	dprint_vfmw
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, 0
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L856:
	add	x0, x29, 88
	bl	BsSkip
	b	.L839
	.p2align 3
.L855:
	ldr	w0, [x19, 15836]
	strb	wzr, [x22, 1303]
	lsl	w0, w0, 3
	str	w0, [x22, 1308]
	ldr	w0, [x19, 15832]
	str	w0, [x22, 1316]
	b	.L842
.L834:
	mov	w1, 0
	add	x0, x29, 88
	uxtw	x20, w20
	bl	BsGet
	lsl	x1, x20, 3
	sub	x1, x1, x20
	add	x1, x19, x1, lsl 2
	str	w0, [x1, 1320]
	b	.L836
.L853:
	ldr	x1, .LC167
	mov	w2, w0
	mov	w3, w22
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L851
	.size	Mp4_Syntax_Slice_NotSH, .-Mp4_Syntax_Slice_NotSH
	.align	3
.LC163:
	.xword	.LANCHOR1
	.align	3
.LC165:
	.xword	.LC164
	.align	3
.LC167:
	.xword	.LC166
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_Syntax_Slice_SH
	.type	Mp4_Syntax_Slice_SH, %function
Mp4_Syntax_Slice_SH:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	w24, w2
	bl	_mcount
	ldr	w3, [x19, 15632]
	sub	w22, w3, #1
	cmp	w22, 510
	bhi	.L871
	add	x25, x19, 12288
	add	w0, w3, 1
	str	w0, [x19, 15632]
	mov	x1, x20
	mov	w2, w24
	add	x0, x29, 88
	ldrb	w20, [x25, 3616]
	uxtw	x26, w3
	bl	BsInit
	add	x23, x19, 20480
	ubfx	x20, x20, 3, 4
	add	x0, x29, 88
	add	w20, w20, 17
	mov	w1, w20
	lsl	x20, x26, 3
	sub	x20, x20, x26
	bl	BsSkip
	mov	w1, 5
	add	x0, x29, 88
	add	x20, x19, x20, lsl 2
	bl	BsGet
	ldrb	w2, [x23, 780]
	mul	w0, w2, w0
	str	w0, [x20, 1320]
	ldrh	w1, [x19, 1226]
	ldrh	w3, [x19, 1224]
	mul	w3, w1, w3
	sub	w3, w3, #1
	cmp	w0, w3
	bhi	.L872
	mov	w1, 2
	add	x0, x29, 88
	lsl	w24, w24, 3
	bl	BsSkip
	mov	w1, 5
	add	x0, x29, 88
	bl	BsGet
	strb	w0, [x20, 1301]
	add	x0, x29, 88
	ldrb	w1, [x23, 768]
	strb	w1, [x20, 1300]
	ldrb	w1, [x23, 772]
	strb	w1, [x20, 1299]
	ldrb	w1, [x23, 776]
	strb	w1, [x20, 1297]
	ldrb	w1, [x23, 777]
	strb	w1, [x20, 1298]
	bl	BsPos
	mov	w21, w0
	asr	w0, w0, 31
	sub	w24, w24, w21
	lsr	w0, w0, 29
	str	w24, [x20, 1304]
	add	w1, w21, w0
	add	w2, w21, 7
	ldr	w3, [x23, 1632]
	and	w1, w1, 7
	sub	w0, w1, w0
	cmp	w21, wzr
	add	w0, w3, w0
	strb	w0, [x20, 1302]
	csel	w0, w2, w21, lt
	add	x1, x19, 16384
	ldr	w2, [x23, 1624]
	add	w0, w2, w0, asr 3
	str	w0, [x20, 1312]
	ldr	w0, [x1, 3624]
	orr	w0, w0, 16
	str	w0, [x1, 3624]
	ldrb	w0, [x25, 3450]
	cbz	w0, .L873
.L861:
	lsl	x0, x26, 3
	sub	x0, x0, x26
	add	x0, x19, x0, lsl 2
	strb	wzr, [x0, 1303]
	str	wzr, [x0, 1308]
	str	wzr, [x0, 1316]
.L862:
	uxtw	x0, w22
	lsl	x1, x0, 3
	sub	x1, x1, x0
	add	x1, x19, x1, lsl 2
	ldr	w2, [x1, 1316]
	cbnz	w2, .L874
.L863:
	lsl	x1, x0, 3
	ldrb	w2, [x25, 3616]
	sub	x0, x1, x0
	ubfx	x1, x2, 3, 4
	add	x0, x19, x0, lsl 2
	ldr	w2, [x0, 1304]
	add	w1, w2, w1
	str	w1, [x0, 1304]
.L864:
	mov	x0, x19
	bl	MP4_Record_SlcSegID
	mov	w0, w21
.L859:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L874:
	ldr	w2, [x1, 1308]
	cbz	w2, .L863
	ldrb	w0, [x25, 3616]
	ubfx	x0, x0, 3, 4
	add	w2, w0, w2
	str	w2, [x1, 1308]
	b	.L864
	.p2align 3
.L873:
	ldrb	w0, [x25, 3538]
	cmp	w0, 1
	bne	.L861
	ldr	w0, [x19, 15836]
	strb	wzr, [x20, 1303]
	lsl	w0, w0, 3
	str	w0, [x20, 1308]
	ldr	w0, [x19, 15832]
	str	w0, [x20, 1316]
	b	.L862
	.p2align 3
.L871:
	add	x0, x19, 20480
	add	x1, x19, 12288
	add	x1, x1, 3440
	ldr	w0, [x0, 2848]
	bl	MP4_ClearCurPacket
	mov	x0, x19
	bl	MP4_ClearCurPic
	add	x4, x19, 16384
	mov	w3, -435
	ldr	x2, .LC168
	mov	w0, 1
	ldr	x1, .LC169
	ldr	w5, [x4, 3624]
	add	x2, x2, 1320
	and	w3, w5, w3
	str	w3, [x4, 3624]
	ldr	w3, [x19, 15632]
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L872:
	ldr	x1, .LC171
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L859
	.size	Mp4_Syntax_Slice_SH, .-Mp4_Syntax_Slice_SH
	.align	3
.LC168:
	.xword	.LANCHOR1
	.align	3
.LC169:
	.xword	.LC164
	.align	3
.LC171:
	.xword	.LC170
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_Dec_Slice
	.type	MP4_Dec_Slice, %function
MP4_Dec_Slice:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 12288
	mov	x22, x1
	mov	w21, w2
	bl	_mcount
	ldrb	w0, [x20, 3616]
	tbz	x0, 0, .L885
	tbz	x0, 2, .L886
.L881:
	mov	w2, w21
	mov	x1, x22
	mov	x0, x19
	bl	Mp4_Syntax_Slice_SH
	cmn	w0, #1
	beq	.L883
.L879:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L886:
	ldrh	w1, [x20, 3616]
	ubfx	x1, x1, 7, 4
	sub	w2, w1, #1
	cmp	w2, 6
	bhi	.L881
	bfi	w0, w1, 3, 4
	mov	w2, w21
	strb	w0, [x20, 3616]
	mov	x1, x22
	mov	x0, x19
	bl	Mp4_Syntax_Slice_SH
	cmn	w0, #1
	bne	.L879
.L883:
	add	x19, x19, 20480
	add	x1, x20, 3440
	ldr	w0, [x19, 2848]
	bl	MP4_ClearCurPacket
	ldr	x2, .LC172
	mov	w0, 1
	ldr	x1, .LC174
	add	x2, x2, 1344
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L885:
	mov	x0, x19
	bl	Mp4_Check_Slice_NotSH
	cbz	w0, .L887
	mov	w1, w21
	mov	x0, x19
	bl	Mp4_Combine_SliceData
	cbnz	w0, .L883
	mov	x0, x19
	bl	MP4_Record_SlcSegID
	b	.L879
	.p2align 3
.L887:
	mov	w2, w21
	mov	x1, x22
	mov	x0, x19
	bl	Mp4_Syntax_Slice_NotSH
	cmn	w0, #1
	beq	.L883
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MP4_Dec_Slice, .-MP4_Dec_Slice
	.align	3
.LC172:
	.xword	.LANCHOR1
	.align	3
.LC174:
	.xword	.LC173
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_Record_PacketID
	.type	MP4_Record_PacketID, %function
MP4_Record_PacketID:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 20480
	bl	_mcount
	ldr	w1, [x20, 2124]
	cmp	w1, 62
	bgt	.L891
	add	x0, x19, x1, sxtw 2
	ldr	w4, [x19, 15752]
	add	x0, x0, 20480
	add	x3, x19, 12288
	add	w2, w1, 1
	str	w4, [x0, 1868]
	str	w2, [x20, 2124]
	ldrb	w2, [x3, 3450]
	cbnz	w2, .L888
	ldrb	w2, [x3, 3538]
	cmp	w2, 1
	beq	.L892
.L888:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L891:
	mov	x0, x19
	bl	MP4_Clean_HeadPacket
	ldr	w0, [x20, 2848]
	add	x1, x19, 12288
	add	x1, x1, 3440
	bl	MP4_ClearCurPacket
	ldr	w2, [x20, 2124]
	mov	w3, 62
	ldr	x1, .LC175
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L892:
	ldr	w2, [x19, 15840]
	add	w1, w1, 2
	str	w2, [x0, 1872]
	str	w1, [x20, 2124]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP4_Record_PacketID, .-MP4_Record_PacketID
	.align	3
.LC175:
	.xword	.LC136
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_Record_HeadPacketInfo
	.type	MP4_Record_HeadPacketInfo, %function
MP4_Record_HeadPacketInfo:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	w23, w1
	bl	_mcount
	cbz	x21, .L897
	ldr	x22, .LC178
	add	x19, x21, 20480
	add	x20, x21, 12288
	mov	x2, 176
	add	x1, x20, 3440
	add	x0, x19, 1688
	ldr	x3, [x22, 104]
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 4
	add	x1, x20, 3616
	add	x0, x19, 1864
	blr	x3
	str	w23, [x19, 2128]
	ldr	w0, [x19, 2132]
	cbz	w0, .L898
.L896:
	ldr	w0, [x19, 2136]
	add	w0, w0, 1
	str	w0, [x19, 2136]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L898:
	mov	x0, x21
	bl	MP4_Record_PacketID
	mov	w0, 1
	str	w0, [x19, 2132]
	b	.L896
	.p2align 3
.L897:
	ldr	x1, .LC177
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	MP4_Record_HeadPacketInfo, .-MP4_Record_HeadPacketInfo
	.align	3
.LC177:
	.xword	.LC176
	.align	3
.LC178:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_Syntax_Parse
	.type	Mp4_Syntax_Parse, %function
Mp4_Syntax_Parse:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x22, x0
	mov	x0, x30
	mov	x24, x1
	mov	w25, w2
	bl	_mcount
	ldr	x26, .LC179
	mov	x2, 40
	mov	w1, 0
	add	x0, x29, 112
	add	x23, x22, 16384
	ldr	x3, [x26, 96]
	blr	x3
	mov	w2, w25
	mov	x1, x24
	add	x0, x29, 112
	bl	BsInit
	mov	w1, 32
	add	x0, x29, 112
	bl	BsShow
	str	wzr, [x23, 3628]
	cmp	w0, 510
	mov	w20, w0
	beq	.L1032
	add	x27, x22, 12288
	ldrb	w0, [x27, 3616]
	tbz	x0, 0, .L1033
.L905:
	add	x19, x22, 20480
	mov	w1, 1
	mov	w20, 196
	strb	w1, [x19, 837]
.L906:
	tbnz	x0, 1, .L907
	ldr	w0, [x23, 3624]
	mov	w21, 130
	ands	w21, w0, w21
	bne	.L1034
	cmp	w20, 197
	beq	.L1035
	cmp	w20, 432
	beq	.L1036
	cmp	w20, 437
	beq	.L1037
	and	w0, w20, -16
	cmp	w0, 288
	beq	.L1038
	cmp	w20, 435
	beq	.L1039
	cmp	w20, 438
	beq	.L1040
	cmp	w20, 196
	beq	.L1041
	cmp	w20, 434
	beq	.L1042
	cmp	w20, 286
	bne	.L922
	ldr	x28, .LC180
	ldr	x4, [x28]
	cbz	x4, .L923
	ldr	w0, [x19, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L923:
	ldr	w0, [x19, 2848]
	add	x1, x27, 3440
	add	x21, x24, 4
	sub	w25, w25, #4
	bl	MP4_ClearCurPacket
	ldr	w0, [x23, 3624]
	tbz	x0, 1, .L924
	orr	w0, w0, 256
	str	w0, [x23, 3624]
.L924:
	ldr	w1, [x23, 3624]
	mov	w0, 18
	and	w0, w1, w0
	cmp	w0, 18
	beq	.L925
	ldr	x4, [x28]
	cbz	x4, .L925
	ldr	w0, [x19, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
.L925:
	ldrb	w0, [x19, 2885]
	mov	w28, 0
	cmp	w0, 1
	beq	.L956
.L931:
	ldrb	w0, [x19, 1607]
	mov	w21, w28
	cmp	w0, 1
	bne	.L1006
	ldr	w0, [x19, 2144]
	mov	x2, 604
	ldr	x3, [x26, 104]
	add	x1, x23, 3656
	add	w0, w0, 1
	str	wzr, [x19, 2148]
	str	w0, [x19, 2144]
	add	x0, x19, 876
	blr	x3
	ldr	w3, [x19, 1540]
	ldr	w1, [x23, 3740]
	ldr	w2, [x23, 3736]
	cmp	w3, w1
	beq	.L1043
.L947:
	ldr	x0, .LC180
	ldr	x4, [x0]
	cbz	x4, .L949
	ldr	w5, [x19, 1544]
	ldr	w0, [x19, 2848]
	strh	w2, [x29, 108]
	add	x2, x29, 104
	strh	w1, [x29, 110]
	mov	w1, 2
	strh	w3, [x29, 106]
	mov	w3, 8
	strh	w5, [x29, 104]
	blr	x4
	ldr	w2, [x23, 3736]
	ldr	w1, [x23, 3740]
.L949:
	str	w1, [x19, 1540]
	str	w2, [x19, 1544]
.L950:
	ldr	w0, [x19, 2848]
	ldr	w1, [x19, 2868]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L952
	ldr	w0, [x19, 2848]
	ldr	x1, [x20, 544]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2848]
	ldr	x1, [x20, 552]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2848]
	ldr	x1, [x20, 560]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2848]
	ldr	x1, [x20, 568]
	bl	FreeUsdByDec
	add	x0, x20, 512
	mov	w2, 1
	stp	xzr, xzr, [x0, 32]
	stp	xzr, xzr, [x0, 48]
	ldr	w0, [x19, 2848]
	ldr	w1, [x19, 2868]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 2848]
	mov	w2, 1
	ldr	w1, [x19, 2860]
	bl	FSP_ClearLogicFs
	str	wzr, [x19, 2860]
	ldr	w0, [x19, 2848]
	str	wzr, [x19, 2868]
	bl	FSP_GetNullLogicFs
	str	w0, [x19, 2860]
	str	w0, [x19, 2868]
.L952:
	add	x20, x19, 2240
	ldr	w0, [x19, 2848]
	mov	x1, x20
	str	wzr, [x19, 2856]
	bl	FSP_ClearNotInVoQueue
	ldr	x0, [x22, 22120]
	ldr	w1, [x0, 772]
	cbnz	w1, .L953
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L1044
.L953:
	ldr	w2, [x19, 1540]
	mov	x0, x22
	ldr	w1, [x19, 1544]
	bl	Frame_Init
	cbz	w0, .L951
	ldr	x1, .LC206
	mov	w0, 0
	bl	dprint_vfmw
	b	.L951
	.p2align 3
.L1034:
	orr	w0, w0, 32
	mov	w1, 1
	mov	w21, 0
	str	w0, [x23, 3624]
	str	w1, [x23, 3628]
.L1006:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L907:
	mov	w2, w25
	mov	x1, x24
	mov	x0, x22
	bl	MP4_Dec_Slice
	mov	w28, w0
.L911:
	ldrb	w0, [x19, 2885]
	mov	x21, x24
	cmp	w0, 1
	beq	.L956
	cmp	w28, w25, lsl 3
	bhi	.L930
.L1049:
	mov	w0, 196
	cmp	w20, 438
	ccmp	w20, w0, 4, ne
	bne	.L931
	ldr	w1, [x23, 3624]
	mov	w0, 130
	tst	w1, w0
	beq	.L931
	ldrb	w0, [x19, 837]
	cmp	w0, 2
	beq	.L1045
	ldr	w1, [x19, 1540]
	ldr	w0, [x19, 1544]
	str	w0, [x19, 2172]
	str	w1, [x19, 2176]
	cbz	w0, .L935
	ldr	w2, [x19, 2164]
	mov	w20, 1
	cmp	w0, w2
	beq	.L935
.L936:
	ldr	x2, .LC180
	ldr	x4, [x2]
	cbz	x4, .L940
	strh	w0, [x29, 108]
	mov	w3, 8
	ldr	w0, [x19, 2164]
	add	x2, x29, 104
	strh	w0, [x29, 104]
	ldr	w0, [x19, 2168]
	strh	w0, [x29, 106]
	ldr	w0, [x19, 2848]
	strh	w1, [x29, 110]
	mov	w1, 2
	blr	x4
.L940:
	cbnz	w20, .L1046
.L942:
	ldr	w1, [x19, 2172]
	ldr	w0, [x19, 2176]
	str	w1, [x19, 2164]
	str	w0, [x19, 2168]
.L934:
	ldr	x3, [x26, 104]
	mov	x2, 60
	add	x1, x19, 768
	add	x0, x19, 1480
	sub	x21, x21, x24
	blr	x3
	ldr	x1, .LC204
	mov	w0, 2
	add	w21, w28, w21, lsl 3
	bl	dprint_vfmw
	ldr	w0, [x19, 2148]
	add	w0, w0, 1
	str	w0, [x19, 2148]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1033:
	add	x19, x22, 20480
	mov	w1, 2
	strb	w1, [x19, 837]
	lsr	w1, w20, 8
	sub	w1, w1, #128
	cmp	w1, 3
	bhi	.L906
	ldrb	w0, [x27, 3616]
	orr	w0, w0, 2
	strb	w0, [x27, 3616]
	uxtb	w0, w0
	b	.L906
	.p2align 3
.L935:
	cbz	w1, .L937
	ldr	w2, [x19, 2168]
	cmp	w1, w2
	beq	.L1047
	mov	w20, 1
	cbz	w0, .L936
	ldr	w2, [x19, 2164]
	cmp	w0, w2
	bne	.L936
.L957:
	ldr	w2, [x19, 2168]
	cmp	w1, w2
	beq	.L940
	b	.L936
	.p2align 3
.L956:
	ldr	w1, [x23, 3736]
	cbz	w1, .L928
	ldr	w2, [x23, 3740]
	cbnz	w2, .L1048
.L928:
	strb	wzr, [x19, 2885]
.L1051:
	cmp	w28, w25, lsl 3
	bls	.L1049
.L930:
	ldr	x1, .LC208
	mov	w0, 2
	sub	x21, x21, x24
	lsl	w21, w21, 3
	bl	dprint_vfmw
	ldr	w1, [x23, 3624]
	mov	w0, -435
	and	w0, w1, w0
	str	w0, [x23, 3624]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1032:
	ldr	x3, [x26, 104]
	mov	x2, 40
	add	x1, x29, 112
	add	x0, x29, 152
	blr	x3
	mov	w1, 32
	add	x0, x29, 152
	bl	BsSkip
	mov	w1, 32
	add	x0, x29, 152
	bl	BsGet
	mov	w19, w0
	mov	w1, 32
	add	x0, x29, 152
	bl	BsGet
	mov	w2, 20553
	mov	w1, 20036
	movk	w2, 0x4853, lsl 16
	movk	w1, 0x4345, lsl 16
	cmp	w19, w2
	ccmp	w0, w1, 0, eq
	bne	.L901
	ldr	x1, .LC180
	add	x19, x22, 20480
	mov	w0, 1
	ldr	x4, [x1]
	strb	w0, [x19, 2884]
	cbz	x4, .L902
	ldr	w0, [x19, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 117
	blr	x4
.L902:
	ldr	w0, [x23, 3624]
	mov	w1, 130
	tst	w0, w1
	beq	.L903
	orr	w0, w0, 32
	mov	w1, 1
	str	w0, [x23, 3624]
	str	w1, [x23, 3628]
.L903:
	add	x1, x22, 12288
	ldr	w0, [x19, 2848]
	add	x1, x1, 3440
	mov	w21, 0
	bl	MP4_ClearCurPacket
	b	.L1006
	.p2align 3
.L901:
	add	x27, x22, 12288
	ldrb	w0, [x27, 3616]
	tbnz	x0, 0, .L905
	add	x19, x22, 20480
	mov	w1, 2
	strb	w1, [x19, 837]
	b	.L906
	.p2align 3
.L922:
	ldr	w0, [x19, 2848]
	add	x1, x27, 3440
	add	x21, x24, 4
	sub	w25, w25, #4
	bl	MP4_ClearCurPacket
	b	.L925
	.p2align 3
.L1036:
	ldr	x1, .LC184
	mov	w0, 2
	bl	dprint_vfmw
	str	wzr, [x19, 2180]
	mov	x1, x24
	mov	w2, w25
	mov	x0, x22
	bl	Mp4_Syntax_Vos
	mov	w28, w0
	mov	w1, w20
	mov	x0, x22
	bl	MP4_Record_HeadPacketInfo
	b	.L911
	.p2align 3
.L1040:
	ldr	x1, .LC192
	mov	w0, 2
	bl	dprint_vfmw
	cmp	w25, 4
	beq	.L1050
	mov	w2, w25
	mov	x1, x24
	mov	x0, x22
	bl	Mp4_Syntax_Vop
	mov	w28, w0
	ldr	w0, [x23, 3624]
	tbnz	x0, 1, .L918
	ldr	w0, [x19, 2848]
	add	x1, x27, 3440
	bl	MP4_ClearCurPacket
.L917:
	ldr	x1, .LC194
	mov	w2, w28
	mov	w0, 7
	bl	dprint_vfmw
	b	.L911
	.p2align 3
.L937:
	ldr	w2, [x19, 2852]
	cmp	w2, 1
	cset	w20, ne
	cbz	w0, .L940
.L958:
	ldr	w2, [x19, 2164]
	cmp	w0, w2
	bne	.L936
	cbnz	w1, .L957
	b	.L940
	.p2align 3
.L1048:
	mov	x0, x22
	bl	Frame_Init
	cbz	w0, .L928
	ldr	x1, .LC200
	mov	w0, 0
	bl	dprint_vfmw
	strb	wzr, [x19, 2885]
	b	.L1051
	.p2align 3
.L1043:
	ldr	w0, [x19, 1544]
	cmp	w0, w2
	bne	.L947
	ldr	w0, [x19, 2852]
	cmp	w0, 1
	bne	.L950
.L951:
	ldr	w0, [x19, 1540]
	mov	w21, w28
	ldr	w1, [x19, 1544]
	str	w1, [x19, 2164]
	str	w0, [x19, 2168]
	ldr	w0, [x23, 3740]
	str	w0, [x19, 1540]
	ldr	w0, [x23, 3736]
	str	w0, [x19, 1544]
	strb	wzr, [x19, 1607]
	b	.L1006
	.p2align 3
.L1037:
	ldr	x1, .LC186
	mov	w0, 2
	bl	dprint_vfmw
	mov	w0, 1
	mov	x1, x24
	str	w0, [x19, 2180]
	mov	w2, w25
	mov	x0, x22
	bl	Mp4_Syntax_Vo
	mov	w28, w0
	mov	w1, w20
	mov	x0, x22
	bl	MP4_Record_HeadPacketInfo
	b	.L911
	.p2align 3
.L1038:
	ldr	x1, .LC188
	mov	w0, 2
	bl	dprint_vfmw
	mov	w0, 2
	mov	w2, w25
	mov	x1, x24
	str	w0, [x19, 2180]
	mov	x0, x22
	bl	Mp4_Syntax_Vol
	mov	w28, w0
	mov	w1, w20
	mov	x0, x22
	bl	MP4_Record_HeadPacketInfo
	ldrb	w0, [x19, 1607]
	cmp	w0, 1
	beq	.L911
	ldrb	w21, [x19, 1608]
	cmp	w21, 1
	bne	.L911
	ldr	x3, [x26, 104]
	mov	x2, 604
	add	x1, x19, 164
	add	x0, x23, 3656
	blr	x3
	strb	w21, [x19, 1607]
	strb	w21, [x19, 829]
	b	.L911
	.p2align 3
.L1035:
	ldr	x1, .LC182
	mov	w0, 2
	bl	dprint_vfmw
	ldr	w0, [x19, 2848]
	add	x1, x27, 3440
	bl	MP4_ClearCurPacket
	b	.L1006
	.p2align 3
.L1039:
	ldr	x1, .LC190
	mov	w0, 2
	bl	dprint_vfmw
	mov	w0, 3
	mov	x1, x24
	str	w0, [x19, 2180]
	mov	w2, w25
	mov	x0, x22
	bl	Mp4_Syntax_Gop
	mov	w28, w0
	mov	w1, w20
	mov	x0, x22
	bl	MP4_Record_HeadPacketInfo
	b	.L911
	.p2align 3
.L1045:
	ldrb	w0, [x19, 768]
	cmp	w0, 2
	beq	.L933
	ldr	w0, [x19, 1556]
	ldr	w1, [x19, 1548]
	str	w0, [x19, 1560]
	add	w1, w0, w1
	str	w1, [x19, 1556]
	ldr	w3, [x19, 1552]
	ldr	w0, [x23, 3728]
	ldr	w2, [x19, 1568]
	madd	w0, w1, w0, w3
	str	w0, [x19, 1564]
	str	w0, [x19, 1568]
	sub	w0, w0, w2
	str	w0, [x19, 1572]
	b	.L934
	.p2align 3
.L1041:
	ldr	x1, .LC196
	mov	w0, 2
	bl	dprint_vfmw
	mov	w2, w25
	mov	x1, x24
	mov	x0, x22
	bl	Mp4_Syntax_ShortHeader
	mov	w28, w0
	ldr	w0, [x23, 3624]
	tbz	x0, 1, .L1029
	mov	w1, 196
	mov	x0, x22
	bl	MP4_Record_HeadPacketInfo
	b	.L911
	.p2align 3
.L1042:
	ldr	x1, .LC198
	mov	w0, 2
	bl	dprint_vfmw
	mov	w2, w25
	mov	x1, x24
	mov	x0, x22
	bl	Mp4_Syntax_UserData
	mov	w28, w0
.L1029:
	ldr	w0, [x19, 2848]
	add	x1, x27, 3440
	bl	MP4_ClearCurPacket
	b	.L911
	.p2align 3
.L1046:
	ldr	w0, [x19, 2848]
	ldr	w1, [x19, 2868]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	cbz	x0, .L943
	ldr	w0, [x19, 2848]
	ldr	x1, [x23, 544]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2848]
	ldr	x1, [x23, 552]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2848]
	ldr	x1, [x23, 560]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2848]
	ldr	x1, [x23, 568]
	bl	FreeUsdByDec
	add	x1, x23, 512
	mov	w2, w20
	stp	xzr, xzr, [x1, 32]
	stp	xzr, xzr, [x1, 48]
	ldr	w0, [x19, 2848]
	ldr	w1, [x19, 2868]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 2848]
	mov	w2, w20
	ldr	w1, [x19, 2860]
	bl	FSP_ClearLogicFs
	str	wzr, [x19, 2860]
	ldr	w0, [x19, 2848]
	str	wzr, [x19, 2868]
	bl	FSP_GetNullLogicFs
	str	w0, [x19, 2860]
	str	w0, [x19, 2868]
.L943:
	add	x20, x19, 2240
	ldr	w0, [x19, 2848]
	mov	x1, x20
	str	wzr, [x19, 2856]
	bl	FSP_ClearNotInVoQueue
	ldr	x0, [x22, 22120]
	ldr	w1, [x0, 772]
	cbnz	w1, .L944
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L1052
.L944:
	ldr	w1, [x19, 2172]
	mov	x0, x22
	ldr	w2, [x19, 2176]
	bl	Frame_Init
	cbz	w0, .L942
	ldr	x1, .LC202
	mov	w0, 0
	bl	dprint_vfmw
	b	.L942
.L918:
	mov	w1, 438
	mov	x0, x22
	bl	MP4_Record_HeadPacketInfo
	b	.L917
.L933:
	ldr	w2, [x19, 1560]
	ldr	w1, [x19, 1548]
	ldr	w0, [x23, 3728]
	ldr	w4, [x19, 1552]
	add	w1, w2, w1
	ldr	w3, [x19, 1568]
	ldr	w2, [x19, 1572]
	madd	w0, w1, w0, w4
	sub	w1, w2, w3
	str	w0, [x19, 1564]
	add	w0, w1, w0
	str	w0, [x19, 1576]
	b	.L934
.L1050:
	mov	w1, w20
	mov	x0, x22
	mov	w28, 0
	bl	MP4_Record_HeadPacketInfo
	b	.L917
.L1047:
	ldr	w2, [x19, 2852]
	cmp	w2, 1
	cset	w20, ne
	cbnz	w0, .L958
	cbnz	w1, .L957
	b	.L940
.L1044:
	ldr	w0, [x19, 2852]
	cbnz	w0, .L953
	mov	x0, x20
	bl	ResetVoQueue
	b	.L953
.L1052:
	ldr	w0, [x19, 2852]
	cbnz	w0, .L944
	mov	x0, x20
	bl	ResetVoQueue
	b	.L944
	.size	Mp4_Syntax_Parse, .-Mp4_Syntax_Parse
	.align	3
.LC179:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC180:
	.xword	g_event_report
	.align	3
.LC182:
	.xword	.LC181
	.align	3
.LC184:
	.xword	.LC183
	.align	3
.LC186:
	.xword	.LC185
	.align	3
.LC188:
	.xword	.LC187
	.align	3
.LC190:
	.xword	.LC189
	.align	3
.LC192:
	.xword	.LC191
	.align	3
.LC194:
	.xword	.LC193
	.align	3
.LC196:
	.xword	.LC195
	.align	3
.LC198:
	.xword	.LC197
	.align	3
.LC200:
	.xword	.LC199
	.align	3
.LC202:
	.xword	.LC201
	.align	3
.LC204:
	.xword	.LC203
	.align	3
.LC206:
	.xword	.LC205
	.align	3
.LC208:
	.xword	.LC207
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_Combine_HdPacket
	.type	MP4_Combine_HdPacket, %function
MP4_Combine_HdPacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19, 22168]
	add	x0, x19, 20480
	add	x20, x0, 1688
	cbz	x1, .L1065
	add	x1, x19, 12288
	ldrb	w2, [x1, 3450]
	cmp	w2, 1
	beq	.L1066
	cbnz	w2, .L1061
	ldrb	w2, [x1, 3538]
	cmp	w2, 1
	bne	.L1061
	ldr	x4, .LC212
	mov	x2, 88
	ldr	w3, [x19, 15748]
	add	x1, x1, 3528
	ldr	w5, [x20, 20]
	add	x0, x0, 1776
	ldr	x4, [x4, 104]
	add	w3, w5, w3
	str	w3, [x20, 20]
	blr	x4
	mov	w0, 0
.L1056:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1066:
	ldrb	w21, [x20, 10]
	cmp	w21, 1
	beq	.L1067
	cbnz	w21, .L1060
	ldrb	w0, [x20, 98]
	cmp	w0, 1
	bne	.L1060
	ldr	w1, [x19, 15748]
	mov	w0, 0
	ldr	w2, [x20, 108]
	add	w1, w2, w1
	str	w1, [x20, 108]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1061:
	ldr	x1, .LC213
	mov	w2, 5006
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1067:
	ldr	w3, [x19, 15744]
	ldr	w2, [x20, 16]
	cmp	w3, w2
	bcc	.L1068
	ldr	w1, [x19, 15748]
	mov	w0, 0
	ldr	w2, [x20, 20]
	add	w1, w2, w1
	str	w1, [x20, 20]
	b	.L1056
	.p2align 3
.L1060:
	ldr	x1, .LC213
	mov	w2, 4992
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1056
	.p2align 3
.L1068:
	ldr	x3, .LC212
	mov	x2, 88
	add	x1, x1, 3440
	add	x0, x0, 1776
	ldr	x3, [x3, 104]
	blr	x3
	strb	wzr, [x20, 10]
	strb	w21, [x20, 98]
	mov	w0, 0
	b	.L1056
.L1065:
	ldr	x1, .LC209
	ldr	x4, [x1]
	cbz	x4, .L1055
	ldr	w0, [x0, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 103
	blr	x4
.L1055:
	ldr	x1, .LC211
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1056
	.size	MP4_Combine_HdPacket, .-MP4_Combine_HdPacket
	.align	3
.LC209:
	.xword	g_event_report
	.align	3
.LC211:
	.xword	.LC210
	.align	3
.LC212:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC213:
	.xword	.LC117
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_Renew_CurPacket
	.type	MP4_Renew_CurPacket, %function
MP4_Renew_CurPacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x20
	bl	MP4_Combine_HdPacket
	cmn	w0, #1
	mov	w19, w0
	beq	.L1072
	mov	x0, x20
	add	x20, x20, 20480
	add	x19, x0, 12288
	bl	MP4_Record_PacketID
	ldr	x21, .LC216
	mov	x2, 176
	add	x1, x20, 1688
	add	x0, x19, 3440
	ldr	x3, [x21, 104]
	blr	x3
	ldr	x3, [x21, 104]
	mov	x2, 4
	add	x1, x20, 1864
	add	x0, x19, 3520
	blr	x3
	mov	w0, 0
.L1071:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1072:
	add	x0, x20, 20480
	add	x1, x20, 12288
	add	x1, x1, 3440
	ldr	w0, [x0, 2848]
	bl	MP4_ClearCurPacket
	ldr	x1, .LC215
	mov	w2, 5022
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w19
	b	.L1071
	.size	MP4_Renew_CurPacket, .-MP4_Renew_CurPacket
	.align	3
.LC215:
	.xword	.LC214
	.align	3
.LC216:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_Check_CurPacket
	.type	MP4_Check_CurPacket, %function
MP4_Check_CurPacket:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 12288
	add	x21, x19, 20480
	bl	_mcount
	add	x0, x29, 56
	ldr	w1, [x20, 3456]
	str	w1, [x21, 1624]
	ldr	x1, [x19, 15728]
	str	x1, [x19, 22096]
	ldr	w2, [x20, 3460]
	str	w2, [x21, 1628]
	str	wzr, [x21, 1632]
	bl	BsInit
	mov	w1, 32
	add	x0, x29, 56
	bl	BsShow
	ldrb	w1, [x20, 3616]
	tbz	x1, 0, .L1101
	mov	w0, 1
	strb	w0, [x21, 837]
	ldrb	w0, [x20, 3616]
	tbnz	x0, 1, .L1076
	ldr	w2, [x21, 2128]
	mov	w1, 196
.L1080:
	mov	w0, 438
	cmp	w1, w0
	ccmp	w2, w0, 0, eq
	beq	.L1099
	mov	w0, 196
	cmp	w1, w0
	ccmp	w2, w0, 0, eq
	beq	.L1099
.L1098:
	mov	w0, 0
	b	.L1084
	.p2align 3
.L1101:
	lsr	w1, w0, 8
	mov	w2, 2
	sub	w1, w1, #128
	strb	w2, [x21, 837]
	cmp	w1, 3
	mov	w1, w0
	bls	.L1102
.L1075:
	ldrb	w2, [x20, 3616]
	tbz	x2, 1, .L1103
	ldr	w2, [x21, 2128]
	cmp	w0, 196
	cset	w1, eq
	cmp	w2, 438
	cset	w0, eq
	orr	w0, w1, w0
	cbnz	w0, .L1104
.L1081:
	mov	x0, x19
	bl	MP4_Renew_CurPacket
.L1084:
	ldr	x1, [x19, 15728]
	cbz	x1, .L1088
	ldr	w1, [x19, 15744]
	cmp	w1, wzr
	csinv	w0, w0, wzr, ne
.L1097:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
.L1104:
	ldrb	w0, [x21, 1609]
	cmp	w0, 1
	cset	w0, eq
	orr	w1, w1, w0
	cbz	w1, .L1081
	.p2align 2
.L1076:
	mov	x0, 438
	ldr	x1, [x19, 22608]
	movk	x0, 0x1, lsl 32
	cmp	x1, x0
	bne	.L1098
	ldr	w0, [x21, 1708]
	cmp	w0, 4
	beq	.L1081
	mov	w0, 0
	b	.L1084
	.p2align 3
.L1102:
	ldrb	w2, [x20, 3616]
	orr	w2, w2, 2
	strb	w2, [x20, 3616]
	b	.L1075
	.p2align 3
.L1099:
	ldr	w0, [x21, 2136]
	cmp	w0, 1
	ble	.L1098
.L1079:
	mov	x0, x19
	bl	MP4_Clean_HeadPacket
	mov	w0, 0
	b	.L1084
	.p2align 3
.L1103:
	ldr	w2, [x21, 2128]
	mov	w3, 196
	cmp	w2, 438
	ccmp	w0, w3, 4, ne
	bne	.L1079
	b	.L1080
	.p2align 3
.L1088:
	mov	w0, -1
	b	.L1097
	.size	MP4_Check_CurPacket, .-MP4_Check_CurPacket
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG4DEC_Decode
	.type	MPEG4DEC_Decode, %function
MPEG4DEC_Decode:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x21, xzr, 4, ne
	beq	.L1212
	add	x19, x20, 20480
	ldr	w0, [x19, 2156]
	cbz	w0, .L1108
	ldr	w0, [x21, 20]
	cbz	w0, .L1108
	ldr	w0, [x21, 16]
	cbz	w0, .L1108
	ldr	x0, [x21]
	cbz	x0, .L1108
	ldr	x1, .LC221
	mov	w0, 2
	add	x22, x20, 12288
	add	x22, x22, 3440
	bl	dprint_vfmw
	ldr	x1, .LC223
	mov	w0, 7
	ldr	w2, [x21, 16]
	bl	dprint_vfmw
	ldr	x1, .LC225
	mov	w0, 7
	ldr	w2, [x21, 20]
	bl	dprint_vfmw
	ldrb	w2, [x21, 10]
	mov	w0, 7
	ldr	x1, .LC227
	bl	dprint_vfmw
	ldr	x1, .LC229
	mov	w0, 7
	ldr	w2, [x21, 104]
	bl	dprint_vfmw
	ldr	x1, .LC231
	mov	w0, 7
	ldr	w2, [x21, 108]
	bl	dprint_vfmw
	ldrb	w2, [x21, 98]
	mov	w0, 7
	ldr	x1, .LC233
	bl	dprint_vfmw
	ldr	x1, .LC235
	mov	w0, 7
	ldr	w2, [x21, 20]
	bl	dprint_vfmw
	ldr	x2, [x21]
	mov	w0, 7
	ldr	x1, .LC237
	ldrb	w2, [x2]
	bl	dprint_vfmw
	ldr	x2, [x21]
	mov	w0, 7
	ldr	x1, .LC239
	ldrb	w2, [x2, 1]
	bl	dprint_vfmw
	ldr	x2, [x21]
	mov	w0, 7
	ldr	x1, .LC241
	ldrb	w2, [x2, 2]
	bl	dprint_vfmw
	ldr	x2, [x21]
	mov	w0, 7
	ldr	x1, .LC243
	ldrb	w2, [x2, 3]
	bl	dprint_vfmw
	ldr	x0, .LC244
	mov	x2, 176
	mov	x1, x21
	ldr	x3, [x0, 104]
	mov	x0, x22
	blr	x3
	mov	x1, x22
	mov	x0, x20
	bl	MP4_GetScdUpMsg
	mov	x0, x20
	bl	MP4_Check_CurPacket
	cmn	w0, #1
	mov	w23, w0
	beq	.L1213
	mov	x1, x22
	mov	x0, x20
	bl	MP4_GetScdUpMsg
	ldr	w1, [x22, 16]
	str	w1, [x19, 1624]
	ldr	x1, [x20, 15728]
	str	x1, [x20, 22096]
	ldr	w0, [x19, 1684]
	ldr	w2, [x22, 20]
	str	w2, [x19, 1628]
	cmp	w0, 2
	str	wzr, [x19, 1632]
	ldr	x3, [x20, 22120]
	beq	.L1214
.L1112:
	ldr	w0, [x3, 8]
	cmp	w0, 2
	beq	.L1113
	cmp	w0, 1
	beq	.L1209
	cmp	w0, 4
	csel	w0, w0, wzr, eq
.L1209:
	str	w0, [x19, 1684]
	add	x22, x20, 16384
	ldr	w0, [x3, 936]
	cmp	w0, 1
	beq	.L1215
.L1118:
	ldr	w0, [x22, 3624]
	str	w0, [x19, 2888]
.L1119:
	mov	x0, x20
	bl	Mp4_Syntax_Parse
	lsr	w2, w0, 3
	ldr	x4, [x20, 22096]
	mov	x3, x2
	and	w0, w0, 7
	add	x2, x4, x2
	str	x2, [x20, 22096]
	str	w0, [x19, 1632]
	ldr	w2, [x19, 1624]
	ldr	w0, [x19, 1628]
	add	w2, w2, w3
	str	w2, [x19, 1624]
	sub	w0, w0, w3
	str	w0, [x19, 1628]
	ldr	x0, [x20, 22120]
	ldr	w1, [x0, 936]
	cmp	w1, 1
	beq	.L1216
.L1120:
	ldr	w1, [x22, 3624]
	mov	w0, 288
	tst	w1, w0
	beq	.L1121
	mov	w0, -435
	and	w0, w1, w0
	str	w0, [x22, 3624]
	ldr	w0, [x19, 1684]
	cmp	w0, 2
	beq	.L1217
	cmp	w0, 1
	beq	.L1218
	cmp	w0, 4
	bne	.L1160
	ldrb	w0, [x19, 1480]
	cbz	w0, .L1219
	sub	w1, w0, #2
	and	w1, w1, -3
	uxtb	w1, w1
	cbnz	w1, .L1128
	ldr	w1, [x19, 2184]
	cmp	w1, 2
	beq	.L1149
.L1128:
	cmp	w0, 1
	bne	.L1160
	str	w0, [x19, 2184]
	b	.L1160
	.p2align 3
.L1218:
	ldrb	w0, [x19, 1480]
	cmp	w0, 2
	beq	.L1123
.L1160:
	mov	x0, x20
	bl	Mp4_Frame_Atr
	cmn	w0, #1
	mov	w23, w0
	beq	.L1220
	ldr	w1, [x19, 2860]
	ldr	w0, [x19, 2848]
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	ldr	w1, [x19, 2868]
	ldr	w0, [x19, 2848]
	bl	FSP_GetFsImagePtr
	mov	x25, x0
	cmp	x24, xzr
	cset	w23, eq
	cmp	x0, xzr
	cset	w0, eq
	orr	w23, w23, w0
	cbnz	w23, .L1221
	ldrb	w0, [x19, 835]
	and	w22, w0, -3
	uxtb	w22, w22
	cmp	w22, 1
	bne	.L1131
	cbz	x24, .L1132
	ldr	x0, [x20, 22120]
	ldr	w1, [x24, 152]
	ldr	w0, [x0]
	cmp	w1, w0
	bhi	.L1133
.L1134:
	ldrb	w0, [x19, 1480]
	cmp	w0, 2
	beq	.L1144
	ldr	w3, [x19, 2856]
	mov	w0, 2
	ldr	w1, [x19, 2860]
	ldr	w2, [x19, 2868]
	cmp	w3, wzr
	csinc	w0, w0, wzr, gt
	str	w0, [x19, 2856]
	cmp	w1, w2
	beq	.L1142
	ldr	w0, [x19, 2848]
	mov	w2, 0
	bl	FSP_SetRef
	ldr	w0, [x19, 2848]
	ldr	w1, [x19, 2860]
	bl	FSP_GetDisplay
	cmp	w0, 3
	beq	.L1210
	ldr	w0, [x19, 2848]
	mov	w2, 0
	ldr	w1, [x19, 2860]
	bl	FSP_SetDisplay
.L1210:
	ldr	w2, [x19, 2868]
.L1142:
	str	w2, [x19, 2860]
	mov	w2, 1
	ldrb	w0, [x20, 1]
	strb	w0, [x20]
	ldr	w0, [x19, 2872]
	ldr	w1, [x19, 2876]
	str	w1, [x19, 2868]
	str	w0, [x19, 2864]
	ldrb	w0, [x20, 2]
	strb	w0, [x20, 1]
	ldr	w3, [x19, 1572]
	ldr	w0, [x19, 2848]
	str	w3, [x19, 2872]
	bl	FSP_SetRef
	ldr	w0, [x19, 2848]
	ldr	w1, [x19, 2860]
	bl	FSP_RemovePmv
	ldrb	w0, [x19, 1480]
	cmp	w0, 4
	bne	.L1144
	ldrb	w0, [x19, 832]
	cbz	w0, .L1222
.L1155:
	mov	w23, 0
.L1204:
	mov	w0, w23
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1131:
	cmp	w0, 2
	bne	.L1134
	cbz	x24, .L1135
	ldr	x0, [x20, 22120]
	ldr	w1, [x24, 152]
	ldr	w0, [x0]
	cmp	w1, w0
	bhi	.L1136
	cbz	x25, .L1137
	ldr	w1, [x25, 152]
	cmp	w0, w1
	bcs	.L1134
.L1137:
	ldr	w1, [x19, 2876]
	mov	w2, 1
	ldr	w0, [x19, 2848]
	mov	w23, -1
	bl	FSP_ClearLogicFs
	mov	x0, x20
	bl	MP4_ClearCurPic
	mov	x0, x20
	bl	MP4_Clean_HeadPacket
	ldr	x3, [x20, 22120]
	mov	w0, 1
	ldr	x1, .LC268
	ldr	w2, [x25, 152]
	ldr	w3, [x3]
	bl	dprint_vfmw
	b	.L1204
	.p2align 3
.L1214:
	ldr	w0, [x3, 8]
	cmp	w0, 2
	bne	.L1223
.L1113:
	mov	w0, 2
	str	w0, [x19, 1684]
	add	x22, x20, 16384
	ldr	w0, [x3, 936]
	cmp	w0, 1
	bne	.L1118
.L1215:
	ldr	w0, [x3, 992]
	cmp	w0, 1
	bne	.L1118
	ldr	w0, [x19, 2888]
	str	w0, [x22, 3624]
	b	.L1119
	.p2align 3
.L1216:
	ldr	w0, [x0, 992]
	cbz	w0, .L1120
	b	.L1155
	.p2align 3
.L1144:
	mov	x0, x20
	mov	x2, x21
	mov	w1, 0
	bl	Mp4_Set_DecPar
	ldrb	w0, [x19, 1480]
	cbnz	w0, .L1224
	ldr	w1, [x19, 2184]
	cbnz	w1, .L1146
	mov	w1, 2
	str	w1, [x19, 2184]
.L1147:
	ldr	x3, [x20, 22120]
	add	x1, x20, 1048
	str	x1, [x20, 1040]
	ldr	w2, [x3, 984]
	cmp	w2, 1
	beq	.L1154
.L1153:
	cmp	w2, 2
	beq	.L1161
.L1154:
	strb	wzr, [x20, 1214]
	cbnz	w0, .L1155
	ldr	x0, .LC252
	ldr	x4, [x0]
	cbz	x4, .L1155
	add	x2, x29, 96
	ldr	w0, [x19, 2848]
	mov	w3, 4
	mov	w1, 20
	mov	w23, 0
	str	wzr, [x2, -8]!
	blr	x4
	b	.L1204
	.p2align 3
.L1217:
	ldrb	w0, [x19, 1480]
	cbz	w0, .L1160
.L1123:
	mov	x0, x20
	mov	w23, -1
	bl	MP4_ClearCurPic
	mov	x0, x20
	bl	MP4_Clean_HeadPacket
	b	.L1204
	.p2align 3
.L1219:
	ldr	w0, [x19, 2184]
	cbnz	w0, .L1127
	mov	w0, 2
	str	w0, [x19, 2184]
	b	.L1160
	.p2align 3
.L1223:
	mov	w0, 1
	str	w0, [x19, 2232]
	b	.L1112
	.p2align 3
.L1133:
	ldr	w1, [x19, 2876]
	mov	w2, w22
	ldr	w0, [x19, 2848]
	mov	w23, -1
	bl	FSP_ClearLogicFs
	mov	x0, x20
	bl	MP4_ClearCurPic
	mov	x0, x20
	bl	MP4_Clean_HeadPacket
	ldr	x3, [x20, 22120]
	mov	w0, w22
	ldr	w2, [x24, 152]
	ldr	x1, .LC264
	ldr	w3, [x3]
	bl	dprint_vfmw
	ldr	x25, [sp, 64]
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1224:
	sub	w1, w0, #2
	cmp	w0, 2
	and	w1, w1, -3
	cset	w23, eq
	uxtb	w1, w1
	cbnz	w1, .L1148
	ldr	w1, [x19, 2184]
	cmp	w1, 2
	beq	.L1225
.L1148:
	cmp	w0, 1
	bne	.L1150
	str	w0, [x19, 2184]
	add	x1, x20, 1048
	str	x1, [x20, 1040]
	ldr	x3, [x20, 22120]
	ldr	w2, [x3, 984]
	cmp	w2, 1
	beq	.L1151
	cmp	w2, 2
	beq	.L1161
.L1151:
	strb	wzr, [x20, 1214]
	b	.L1155
	.p2align 3
.L1222:
	ldr	x1, .LC254
	mov	w0, 11
	bl	dprint_vfmw
	ldr	w1, [x19, 2876]
	ldr	w0, [x19, 2848]
	bl	FSP_GetLogicFs
	mov	x21, x0
	ldr	w1, [x19, 2860]
	ldr	w0, [x19, 2848]
	bl	FSP_GetLogicFs
	mov	x22, x0
	cmp	x21, xzr
	ccmp	x0, xzr, 4, ne
	beq	.L1226
	ldr	x1, [x21, 32]
	cbz	x1, .L1157
	ldr	x0, [x21, 40]
	cbz	x0, .L1157
	ldr	x4, [x22, 32]
	ldr	w3, [x0, 8]
	ldr	w2, [x1, 8]
	cbz	x4, .L1164
	ldr	w4, [x4, 8]
.L1159:
	ldr	w6, [x19, 1540]
	mov	x1, x21
	ldr	w5, [x19, 1544]
	mov	x0, x20
	mov	w23, 0
	bl	Vdm_Mem_Move
	b	.L1204
	.p2align 3
.L1108:
	ldr	x1, .LC219
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	ldr	x25, [sp, 64]
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1127:
	mov	w0, 1
	str	w0, [x19, 2184]
	b	.L1160
	.p2align 3
.L1146:
	mov	w1, 1
	str	w1, [x19, 2184]
	b	.L1147
	.p2align 3
.L1136:
	ldr	w1, [x19, 2876]
	mov	w2, 1
	ldr	w0, [x19, 2848]
	mov	w23, -1
	bl	FSP_ClearLogicFs
	mov	x0, x20
	bl	MP4_ClearCurPic
	mov	x0, x20
	bl	MP4_Clean_HeadPacket
	ldr	x3, [x20, 22120]
	mov	w0, 1
	ldr	x1, .LC266
	ldr	w2, [x24, 152]
	ldr	w3, [x3]
	bl	dprint_vfmw
	b	.L1204
	.p2align 3
.L1161:
	ldr	w2, [x3, 988]
	cmp	w2, wzr
	cset	w2, gt
	cmp	x1, xzr
	and	w23, w23, w2
	cset	w1, ne
	tst	w1, w23
	beq	.L1154
	str	xzr, [x20, 1040]
	mov	w2, 1
	mov	w23, -1
	ldr	w0, [x19, 2848]
	ldr	w1, [x19, 2876]
	bl	FSP_ClearLogicFs
	ldr	x2, [x20, 22120]
	mov	x0, x20
	ldr	w1, [x2, 988]
	add	w1, w1, w23
	str	w1, [x2, 988]
	bl	MP4_ClearCurPic
	mov	x0, x20
	bl	MP4_Clean_HeadPacket
	b	.L1204
	.p2align 3
.L1150:
	ldr	x3, [x20, 22120]
	add	x1, x20, 1048
	str	x1, [x20, 1040]
	ldr	w2, [x3, 984]
	cmp	w2, 1
	bne	.L1153
	cmp	x1, xzr
	cset	w1, ne
	tst	w23, w1
	beq	.L1154
	str	xzr, [x20, 1040]
	mov	w23, -1
	ldr	w0, [x19, 2848]
	ldr	w1, [x19, 2876]
	bl	FSP_ClearLogicFs
	mov	x0, x20
	bl	MP4_ClearCurPic
	mov	x0, x20
	bl	MP4_Clean_HeadPacket
	b	.L1204
	.p2align 3
.L1132:
	ldr	w1, [x19, 2876]
	mov	w2, w22
	ldr	w0, [x19, 2848]
	mov	w23, -1
	bl	FSP_ClearLogicFs
	mov	x0, x20
	bl	MP4_ClearCurPic
	mov	x0, x20
	bl	MP4_Clean_HeadPacket
	ldr	x2, .LC249
	mov	w3, 3729
	ldr	x1, .LC262
	mov	w0, w22
	add	x2, x2, 1360
	bl	dprint_vfmw
	b	.L1204
	.p2align 3
.L1212:
	ldr	x1, .LC217
	mov	w2, 3588
	mov	w0, 0
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1204
	.p2align 3
.L1225:
	ldr	w0, [x19, 2848]
	mov	w2, 1
	ldr	w1, [x19, 2876]
	bl	FSP_ClearLogicFs
	ldr	x0, .LC252
	ldr	x4, [x0]
	cbz	x4, .L1149
	ldr	w0, [x19, 2848]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	mov	w23, -1
	blr	x4
	b	.L1204
	.p2align 3
.L1213:
	ldr	x1, .LC246
	mov	w0, 1
	bl	dprint_vfmw
	b	.L1204
	.p2align 3
.L1121:
	ldr	x1, .LC260
	mov	w0, 2
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1204
	.p2align 3
.L1221:
	ldr	x2, .LC249
	mov	w3, 3715
	ldr	x1, .LC251
	mov	w0, 1
	add	x2, x2, 1360
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1204
	.p2align 3
.L1220:
	ldr	x1, .LC248
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x20
	bl	MP4_ClearCurPic
	mov	x0, x20
	bl	MP4_Clean_HeadPacket
	b	.L1204
.L1164:
	mov	w4, w2
	b	.L1159
.L1135:
	ldr	w1, [x19, 2876]
	mov	w2, 1
	ldr	w0, [x19, 2848]
	mov	w23, -1
	bl	FSP_ClearLogicFs
	mov	x0, x20
	bl	MP4_ClearCurPic
	mov	x0, x20
	bl	MP4_Clean_HeadPacket
	ldr	x2, .LC249
	mov	w3, 3749
	ldr	x1, .LC262
	mov	w0, 1
	add	x2, x2, 1360
	bl	dprint_vfmw
	b	.L1204
.L1149:
	mov	w23, -1
	b	.L1204
.L1226:
	ldr	w0, [x19, 2848]
	mov	w2, 1
	ldr	w1, [x19, 2876]
	mov	w23, -1
	bl	FSP_ClearLogicFs
	ldr	x1, .LC256
	mov	x4, x22
	mov	x3, x21
	mov	w2, 3900
	mov	w0, 0
	bl	dprint_vfmw
	mov	x0, x20
	bl	MP4_ClearCurPic
	mov	x0, x20
	bl	MP4_Clean_HeadPacket
	b	.L1204
.L1157:
	ldr	w0, [x19, 2848]
	mov	w2, 1
	ldr	w1, [x19, 2876]
	mov	w23, -1
	bl	FSP_ClearLogicFs
	ldr	x1, .LC258
	mov	w0, 0
	ldr	w2, [x19, 2860]
	ldr	w4, [x19, 2868]
	ldr	w3, [x19, 2876]
	ldp	x5, x6, [x21, 32]
	bl	dprint_vfmw
	mov	x0, x20
	bl	MP4_ClearCurPic
	mov	x0, x20
	bl	MP4_Clean_HeadPacket
	b	.L1204
	.size	MPEG4DEC_Decode, .-MPEG4DEC_Decode
	.align	3
.LC217:
	.xword	.LC93
	.align	3
.LC219:
	.xword	.LC218
	.align	3
.LC221:
	.xword	.LC220
	.align	3
.LC223:
	.xword	.LC222
	.align	3
.LC225:
	.xword	.LC224
	.align	3
.LC227:
	.xword	.LC226
	.align	3
.LC229:
	.xword	.LC228
	.align	3
.LC231:
	.xword	.LC230
	.align	3
.LC233:
	.xword	.LC232
	.align	3
.LC235:
	.xword	.LC234
	.align	3
.LC237:
	.xword	.LC236
	.align	3
.LC239:
	.xword	.LC238
	.align	3
.LC241:
	.xword	.LC240
	.align	3
.LC243:
	.xword	.LC242
	.align	3
.LC244:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC246:
	.xword	.LC245
	.align	3
.LC248:
	.xword	.LC247
	.align	3
.LC249:
	.xword	.LANCHOR1
	.align	3
.LC251:
	.xword	.LC250
	.align	3
.LC252:
	.xword	g_event_report
	.align	3
.LC254:
	.xword	.LC253
	.align	3
.LC256:
	.xword	.LC255
	.align	3
.LC258:
	.xword	.LC257
	.align	3
.LC260:
	.xword	.LC259
	.align	3
.LC262:
	.xword	.LC261
	.align	3
.LC264:
	.xword	.LC263
	.align	3
.LC266:
	.xword	.LC265
	.align	3
.LC268:
	.xword	.LC267
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG4DEC_GetImageWidth
	.type	MPEG4DEC_GetImageWidth, %function
MPEG4DEC_GetImageWidth:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1230
	add	x19, x19, 20480
	ldr	w0, [x19, 1544]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1230:
	ldr	x1, .LC269
	mov	w2, 5042
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
	.size	MPEG4DEC_GetImageWidth, .-MPEG4DEC_GetImageWidth
	.align	3
.LC269:
	.xword	.LC93
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG4DEC_GetImageHeight
	.type	MPEG4DEC_GetImageHeight, %function
MPEG4DEC_GetImageHeight:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1234
	add	x19, x19, 20480
	ldr	w0, [x19, 1540]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1234:
	ldr	x1, .LC270
	mov	w2, 5053
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
	.size	MPEG4DEC_GetImageHeight, .-MPEG4DEC_GetImageHeight
	.align	3
.LC270:
	.xword	.LC93
	.global	sprite_trajectory_len
	.global	default_inter_matrix
	.global	default_intra_matrix
	.global	scan_tables
	.section	.rodata
	.align	3
.LANCHOR1 = . + 0
	.type	default_intra_matrix, %object
	.size	default_intra_matrix, 256
default_intra_matrix:
	.word	8
	.word	17
	.word	18
	.word	19
	.word	21
	.word	23
	.word	25
	.word	27
	.word	17
	.word	18
	.word	19
	.word	21
	.word	23
	.word	25
	.word	27
	.word	28
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	26
	.word	28
	.word	30
	.word	21
	.word	22
	.word	23
	.word	24
	.word	26
	.word	28
	.word	30
	.word	32
	.word	22
	.word	23
	.word	24
	.word	26
	.word	28
	.word	30
	.word	32
	.word	35
	.word	23
	.word	24
	.word	26
	.word	28
	.word	30
	.word	32
	.word	35
	.word	38
	.word	25
	.word	26
	.word	28
	.word	30
	.word	32
	.word	35
	.word	38
	.word	41
	.word	27
	.word	28
	.word	30
	.word	32
	.word	35
	.word	38
	.word	41
	.word	45
	.type	default_inter_matrix, %object
	.size	default_inter_matrix, 256
default_inter_matrix:
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	26
	.word	27
	.word	20
	.word	21
	.word	22
	.word	23
	.word	25
	.word	26
	.word	27
	.word	28
	.word	21
	.word	22
	.word	23
	.word	24
	.word	26
	.word	27
	.word	28
	.word	30
	.word	22
	.word	23
	.word	24
	.word	26
	.word	27
	.word	28
	.word	30
	.word	31
	.word	23
	.word	24
	.word	25
	.word	27
	.word	28
	.word	30
	.word	31
	.word	33
	.type	scan_tables, %object
	.size	scan_tables, 768
scan_tables:
	.word	0
	.word	1
	.word	8
	.word	16
	.word	9
	.word	2
	.word	3
	.word	10
	.word	17
	.word	24
	.word	32
	.word	25
	.word	18
	.word	11
	.word	4
	.word	5
	.word	12
	.word	19
	.word	26
	.word	33
	.word	40
	.word	48
	.word	41
	.word	34
	.word	27
	.word	20
	.word	13
	.word	6
	.word	7
	.word	14
	.word	21
	.word	28
	.word	35
	.word	42
	.word	49
	.word	56
	.word	57
	.word	50
	.word	43
	.word	36
	.word	29
	.word	22
	.word	15
	.word	23
	.word	30
	.word	37
	.word	44
	.word	51
	.word	58
	.word	59
	.word	52
	.word	45
	.word	38
	.word	31
	.word	39
	.word	46
	.word	53
	.word	60
	.word	61
	.word	54
	.word	47
	.word	55
	.word	62
	.word	63
	.word	0
	.word	1
	.word	2
	.word	3
	.word	8
	.word	9
	.word	16
	.word	17
	.word	10
	.word	11
	.word	4
	.word	5
	.word	6
	.word	7
	.word	15
	.word	14
	.word	13
	.word	12
	.word	19
	.word	18
	.word	24
	.word	25
	.word	32
	.word	33
	.word	26
	.word	27
	.word	20
	.word	21
	.word	22
	.word	23
	.word	28
	.word	29
	.word	30
	.word	31
	.word	34
	.word	35
	.word	40
	.word	41
	.word	48
	.word	49
	.word	42
	.word	43
	.word	36
	.word	37
	.word	38
	.word	39
	.word	44
	.word	45
	.word	46
	.word	47
	.word	50
	.word	51
	.word	56
	.word	57
	.word	58
	.word	59
	.word	52
	.word	53
	.word	54
	.word	55
	.word	60
	.word	61
	.word	62
	.word	63
	.word	0
	.word	8
	.word	16
	.word	24
	.word	1
	.word	9
	.word	2
	.word	10
	.word	17
	.word	25
	.word	32
	.word	40
	.word	48
	.word	56
	.word	57
	.word	49
	.word	41
	.word	33
	.word	26
	.word	18
	.word	3
	.word	11
	.word	4
	.word	12
	.word	19
	.word	27
	.word	34
	.word	42
	.word	50
	.word	58
	.word	35
	.word	43
	.word	51
	.word	59
	.word	20
	.word	28
	.word	5
	.word	13
	.word	6
	.word	14
	.word	21
	.word	29
	.word	36
	.word	44
	.word	52
	.word	60
	.word	37
	.word	45
	.word	53
	.word	61
	.word	22
	.word	30
	.word	7
	.word	15
	.word	23
	.word	31
	.word	38
	.word	46
	.word	54
	.word	62
	.word	39
	.word	47
	.word	55
	.word	63
	.type	__FUNCTION__.11953, %object
	.size	__FUNCTION__.11953, 15
__FUNCTION__.11953:
	.string	"Mp4_Set_DecPar"
	.zero	1
	.type	__FUNCTION__.12087, %object
	.size	__FUNCTION__.12087, 23
__FUNCTION__.12087:
	.string	"Mp4_Syntax_Slice_NotSH"
	.zero	1
	.type	__FUNCTION__.12101, %object
	.size	__FUNCTION__.12101, 20
__FUNCTION__.12101:
	.string	"Mp4_Syntax_Slice_SH"
	.zero	4
	.type	__FUNCTION__.12116, %object
	.size	__FUNCTION__.12116, 14
__FUNCTION__.12116:
	.string	"MP4_Dec_Slice"
	.zero	2
	.type	__FUNCTION__.11990, %object
	.size	__FUNCTION__.11990, 16
__FUNCTION__.11990:
	.string	"MPEG4DEC_Decode"
	.data
	.align	3
.LANCHOR0 = . + 0
	.type	sprite_trajectory_len, %object
	.size	sprite_trajectory_len, 120
sprite_trajectory_len:
	.word	0
	.byte	2
	.zero	3
	.word	2
	.byte	3
	.zero	3
	.word	3
	.byte	3
	.zero	3
	.word	4
	.byte	3
	.zero	3
	.word	5
	.byte	3
	.zero	3
	.word	6
	.byte	3
	.zero	3
	.word	14
	.byte	4
	.zero	3
	.word	30
	.byte	5
	.zero	3
	.word	62
	.byte	6
	.zero	3
	.word	126
	.byte	7
	.zero	3
	.word	254
	.byte	8
	.zero	3
	.word	510
	.byte	9
	.zero	3
	.word	1022
	.byte	10
	.zero	3
	.word	2046
	.byte	11
	.zero	3
	.word	4094
	.byte	12
	.zero	3
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC14:
	ASCII(.string	"fatal stream error --- GOP marker_bit = 0\n" )
	.zero	5
.LC19:
	ASCII(.string	"DivX%4dBuild%4d%c" )
	.zero	6
.LC21:
	ASCII(.string	"DivX%4db%4d%c" )
	.zero	2
.LC23:
	ASCII(.string	"FFmpe%*[^b]b%4d" )
.LC25:
	ASCII(.string	"FFmpeg v%4d.%4d.%4d / libavcodec build: %d" )
	.zero	5
.LC27:
	ASCII(.string	"Lavc%d.%d.%d" )
	.zero	3
.LC29:
	ASCII(.string	"ffmpeg" )
	.zero	1
.LC31:
	ASCII(.string	"XviD%4d" )
.LC36:
	ASCII(.string	"fatal stream error --- VOP marker_bit = 0\n" )
	.zero	5
.LC40:
	ASCII(.string	"VDH doesn't support SPRITE_STATIC & SPRITE_GMC\n" )
.LC42:
	ASCII(.string	"VDH doesn't support SPRITE_STATIC\n" )
	.zero	5
.LC44:
	ASCII(.string	"Unknown sprite_enable\n" )
	.zero	1
.LC46:
	ASCII(.string	"ERROR: not_8_bit !=0\n" )
	.zero	2
.LC49:
	ASCII(.string	"not support no complexity_estimation_disable\n" )
	.zero	2
.LC51:
	ASCII(.string	"not support data_partitioned\n" )
	.zero	2
.LC53:
	ASCII(.string	"not support newpred_enable\n" )
	.zero	4
.LC55:
	ASCII(.string	"not support reduced_resolution_vop_eanble\n" )
	.zero	5
.LC57:
	ASCII(.string	"not support scalability\n" )
	.zero	7
.LC61:
	ASCII(.string	"warning! profile_and_level_indication=%#x, maybe HD pic...\n" )
	.zero	4
.LC64:
	ASCII(.string	"image size abnormal(%dx%d)\n" )
	.zero	4
.LC67:
	ASCII(.string	"actual frame size(%dx%d) exeed max config(%dx%d)\n" )
	.zero	6
.LC70:
	ASCII(.string	"MPEG4 Frame_Init return err!\n" )
	.zero	2
.LC73:
	ASCII(.string	"MPEG4 Frame_Init PmvNum=%d, FrameNum=%d, error!\n" )
	.zero	7
.LC76:
	ASCII(.string	"partition fs memory fail!\n" )
	.zero	5
.LC78:
	ASCII(.string	"ERROR: FSP_ConfigInstance fail!\n" )
	.zero	7
.LC80:
	ASCII(.string	"dec_pts: %lld Usertag: %lld\n" )
	.zero	3
.LC83:
	ASCII(.string	"get frame store fail!\n" )
	.zero	1
.LC87:
	ASCII(.string	"%s %d  abnormal!\n" )
	.zero	6
.LC89:
	ASCII(.string	"CurFsID(fwd%d,%d,bwd%d) abnormal!(%p,%p,%p)\n" )
	.zero	3
.LC91:
	ASCII(.string	"MPEG4DEC Init  -----\n" )
	.zero	2
.LC93:
	ASCII(.string	"line: %d\n" )
	.zero	6
.LC96:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC98:
	ASCII(.string	"MPEG4DEC Init success -----\n" )
	.zero	3
.LC100:
	ASCII(.string	"MPEG4 destroy\n" )
	.zero	1
.LC109:
	ASCII(.string	"NVOP VDM copy process................\n" )
	.zero	1
.LC113:
	ASCII(.string	"vop_coding_type = %d is not expected!\n" )
	.zero	1
.LC115:
	ASCII(.string	" slice num %d is not extpected!\n" )
	.zero	7
.LC117:
	ASCII(.string	" line %d packet is wrong!\n" )
	.zero	5
.LC122:
	ASCII(.string	"pImg is null, pCurImg %#x pBwdImg %#x\n" )
	.zero	1
.LC124:
	ASCII(.string	"FrameNum=%d\n" )
	.zero	3
.LC126:
	ASCII(.string	"vop_coding_type=%d\n" )
	.zero	4
.LC129:
	ASCII(.string	"line: %d pToQueImg is null!\n" )
	.zero	3
.LC132:
	ASCII(.string	"CurImage %d is already out put\n" )
.LC134:
	ASCII(.string	"err(%d) > out_thr(%d)\n" )
	.zero	1
.LC136:
	ASCII(.string	"StreamIDNum = %d > (%d)\n" )
	.zero	7
.LC138:
	ASCII(.string	"Warning : vop slice num %d != 0\n" )
	.zero	7
.LC143:
	ASCII(.string	"warning streamIDNum %d != 0 \n" )
	.zero	2
.LC147:
	ASCII(.string	"vop ---%d\n" )
	.zero	5
.LC151:
	ASCII(.string	"VDH doesn't support S_VOP\n" )
	.zero	5
.LC153:
	ASCII(.string	"parse time_module_base stream not enough\n" )
	.zero	6
.LC155:
	ASCII(.string	"module time base parse error, more than %d '1' was found!\n" )
	.zero	5
.LC158:
	ASCII(.string	"error: vop_coding_type = %d, but vop_fcode_forward = 0\n" )
.LC160:
	ASCII(.string	"error: B vop, but vop_fcode_backward = 0\n" )
	.zero	6
.LC164:
	ASCII(.string	"FUN: %s Invalid SlcNum = %d\n" )
	.zero	3
.LC166:
	ASCII(.string	" pSlcPara->mb_start_num = %d, MbCnt = %d\n" )
	.zero	6
.LC170:
	ASCII(.string	"pSlcPara->mb_start_num = %d, totalMbMin1 = %d\n" )
	.zero	1
.LC173:
	ASCII(.string	"FUN: %s MP4_ClearCurPacket\n" )
	.zero	4
.LC176:
	ASCII(.string	"pCtx is NUL!!!\n" )
.LC181:
	ASCII(.string	"Not find start code \n" )
	.zero	2
.LC183:
	ASCII(.string	"VOS beginning ~ !\n" )
	.zero	5
.LC185:
	ASCII(.string	"VO beginning ~ !\n" )
	.zero	6
.LC187:
	ASCII(.string	"VOL beginning ~ !\n" )
	.zero	5
.LC189:
	ASCII(.string	"GOP beginning ~ !\n" )
	.zero	5
.LC191:
	ASCII(.string	"VOP beginning ~ !\n" )
	.zero	5
.LC193:
	ASCII(.string	"BitUsed=%d\n" )
	.zero	4
.LC195:
	ASCII(.string	"SHVOP beginning ~ !\n" )
	.zero	3
.LC197:
	ASCII(.string	"USERDATA beginning ~ !\n" )
.LC199:
	ASCII(.string	"MPEG4 Frame_Init return err 3!\n" )
.LC201:
	ASCII(.string	"MPEG4 Frame_Init return err 1!\n" )
.LC203:
	ASCII(.string	"vop right\n" )
	.zero	5
.LC205:
	ASCII(.string	"MPEG4 Frame_Init return err 2!\n" )
.LC207:
	ASCII(.string	"bits over boundary\n" )
	.zero	4
.LC210:
	ASCII(.string	"pLastPacket->StreamPack[0].VirAddr is NULL!!\n" )
	.zero	2
.LC214:
	ASCII(.string	"line %d MP4_Combine_HdPacket failed!!\n" )
	.zero	1
.LC218:
	ASCII(.string	"bitsream para error -----\n" )
	.zero	5
.LC220:
	ASCII(.string	"MPEG4DEC Decode -----\n" )
	.zero	1
.LC222:
	ASCII(.string	"ptr_strm_para->PhyAddr0=0x%x\n" )
	.zero	2
.LC224:
	ASCII(.string	"ptr_strm_para->Length0=%d\n" )
	.zero	5
.LC226:
	ASCII(.string	"ptr_strm_para->IsLastSeg0=%d\n" )
	.zero	2
.LC228:
	ASCII(.string	"ptr_strm_para->PhyAddr1=0x%x\n" )
	.zero	2
.LC230:
	ASCII(.string	"ptr_strm_para->Length1=%d\n" )
	.zero	5
.LC232:
	ASCII(.string	"ptr_strm_para->IsLastSeg1=%d\n" )
	.zero	2
.LC234:
	ASCII(.string	"ptr_strm_para->Length0 = %d\n" )
	.zero	3
.LC236:
	ASCII(.string	"byte0: = 0x%x\n" )
	.zero	1
.LC238:
	ASCII(.string	"byte1: = 0x%x\n" )
	.zero	1
.LC240:
	ASCII(.string	"byte2: = 0x%x\n" )
	.zero	1
.LC242:
	ASCII(.string	"byte3: = 0x%x\n" )
	.zero	1
.LC245:
	ASCII(.string	"MP4_Check_CurPacket failed!\n" )
	.zero	3
.LC247:
	ASCII(.string	"Mp4_Frame_Atr return fail\n" )
	.zero	5
.LC250:
	ASCII(.string	"fuction return value is null, %s %d!!\n" )
	.zero	1
.LC253:
	ASCII(.string	"NVOP mem move--\n" )
	.zero	7
.LC255:
	ASCII(.string	"line: %d pCur = %p, pFwd = %p\n" )
	.zero	1
.LC257:
	ASCII(.string	"CurFsID(f%d,%d,b%d) abnormal!(%p,%p,%p)\n" )
	.zero	7
.LC259:
	ASCII(.string	"bits not enought\n" )
	.zero	6
.LC261:
	ASCII(.string	"fuction return value is null,%s %d!!\n" )
	.zero	2
.LC263:
	ASCII(.string	"dec P/S frame, fwd ref err(%d) > ref_thr(%d)\n" )
	.zero	2
.LC265:
	ASCII(.string	"dec B frame, bwd ref err(%d) > ref_thr(%d)\n" )
	.zero	4
.LC267:
	ASCII(.string	"dec B frame, fwd ref err(%d) > ref_thr(%d)\n" )
	.bss
	.align	3
.LANCHOR2 = . + 0
	.type	MemArrange.11891, %object
	.size	MemArrange.11891, 1232
MemArrange.11891:
	.zero	1232
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
