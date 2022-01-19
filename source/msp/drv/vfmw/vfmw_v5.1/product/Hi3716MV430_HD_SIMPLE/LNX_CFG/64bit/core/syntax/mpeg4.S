#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"mpeg4.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	MP4_PrepareNvopDecparam.part.1, %function
MP4_PrepareNvopDecparam.part.1:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19, 22040]
	ldr	w0, [x1, 880]
	cmp	w0, 1
	beq	.L17
	cmp	w0, 2
	beq	.L18
.L7:
	add	x21, x19, 20480
	ldr	w1, [x21, 2796]
	ldr	w0, [x21, 2768]
	bl	FSP_GetLogicFs
	mov	x20, x0
	ldr	w1, [x21, 2780]
	ldr	w0, [x21, 2768]
	bl	FSP_GetLogicFs
	cmp	x20, xzr
	ccmp	x0, xzr, 4, ne
	beq	.L19
	ldr	x1, [x20, 32]
	cbz	x1, .L20
	ldr	w1, [x1, 4]
	str	w1, [x19, 1236]
	ldr	x0, [x0, 32]
	cbz	x0, .L21
.L15:
	ldr	w0, [x0, 4]
	mov	w3, 1
	str	w0, [x19, 1220]
	add	x2, x19, 1048
	mov	w0, 0
	ldr	w1, [x21, 776]
	add	w1, w1, 15
	lsr	w1, w1, 4
	strh	w1, [x19, 1200]
	ldr	w1, [x21, 772]
	add	w1, w1, 15
	lsr	w1, w1, 4
	strh	w1, [x19, 1202]
	ldr	x1, [x20, 32]
	ldr	w1, [x1, 44]
	str	w1, [x19, 15584]
	ldr	x1, [x20, 32]
	ldr	w1, [x1, 48]
	str	w1, [x19, 15588]
	ldr	x1, [x20, 32]
	ldr	w1, [x1, 72]
	str	w1, [x19, 15592]
	ldr	x1, [x20, 32]
	ldr	w1, [x1, 64]
	str	w1, [x19, 15596]
	ldr	x1, [x20, 32]
	ldr	w1, [x1, 68]
	str	w1, [x19, 15600]
	ldrb	w1, [x20, 424]
	strb	w1, [x19, 1199]
	strb	w3, [x19, 1198]
	str	x2, [x19, 1040]
.L4:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L18:
	ldr	w0, [x1, 884]
	cmp	w0, wzr
	ble	.L7
	add	x20, x19, 20480
	sub	w0, w0, #1
	str	w0, [x1, 884]
	add	x21, x19, 16384
	mov	w2, 0
	ldr	w0, [x20, 2768]
	ldr	w1, [x20, 2796]
	bl	FSP_SetDisplay
	ldr	w22, [x20, 2768]
	ldr	w0, [x21, 3548]
	cmp	w0, wzr
	ble	.L6
	sub	w0, w0, #1
	add	x20, x19, 12288
	add	x0, x0, 3960
	add	x20, x20, 3548
	add	x19, x19, x0, lsl 2
	.p2align 2
.L8:
	ldr	w1, [x20], 4
	mov	w0, w22
	bl	SM_ReleaseStreamSeg
	cmp	x20, x19
	bne	.L8
.L6:
	mov	w0, 0
	str	wzr, [x21, 3548]
.L22:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L17:
	add	x20, x19, 20480
	add	x21, x19, 16384
	mov	w2, 0
	ldr	w0, [x20, 2768]
	ldr	w1, [x20, 2796]
	bl	FSP_SetDisplay
	ldr	w22, [x20, 2768]
	ldr	w0, [x21, 3548]
	cmp	w0, wzr
	ble	.L6
	sub	w0, w0, #1
	add	x20, x19, 12288
	add	x0, x0, 3960
	add	x20, x20, 3548
	add	x19, x19, x0, lsl 2
	.p2align 2
.L5:
	ldr	w1, [x20], 4
	mov	w0, w22
	bl	SM_ReleaseStreamSeg
	cmp	x20, x19
	bne	.L5
	mov	w0, 0
	str	wzr, [x21, 3548]
	b	.L22
	.p2align 3
.L21:
	ldr	x0, [x20, 32]
	b	.L15
.L19:
	mov	w3, 2579
	ldr	x2, .LC3
	mov	x5, x0
	mov	x4, x20
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L4
.L20:
	ldr	x2, .LC5
	mov	x6, 0
	ldr	w3, [x21, 2780]
	mov	w1, 2585
	ldr	w5, [x21, 2788]
	mov	w0, 0
	ldr	w4, [x21, 2796]
	bl	dprint_normal
	mov	w0, -1
	b	.L4
	.size	MP4_PrepareNvopDecparam.part.1, .-MP4_PrepareNvopDecparam.part.1
	.align	3
.LC3:
	.xword	.LC2
	.align	3
.LC5:
	.xword	.LC4
	.global	_mcount
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
	cbz	w19, .L24
	.p2align 2
.L25:
	add	w0, w0, 1
	lsr	w19, w19, 1
	sxth	w0, w0
	cbnz	w19, .L25
.L24:
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
	ldr	x22, .LC8
	add	x19, x22, 4
	.p2align 2
.L31:
	ldrb	w1, [x19]
	mov	x0, x21
	add	x19, x19, 8
	bl	BsShow
	ldr	w1, [x19, -12]
	cmp	w0, w1
	beq	.L33
	add	w20, w20, 1
	cmp	w20, 12
	bne	.L31
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L33:
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
.LC8:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_GetGMCparam
	.type	MP4_GetGMCparam, %function
MP4_GetGMCparam:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldp	w1, w8, [x20, 16]
	ldrb	w2, [x20, 129]
	mov	w11, 2
	lsl	w3, w8, 4
	str	w3, [x19, 8]
	mov	w9, 3
	lsl	w11, w11, w2
	sub	w9, w9, w2
	ldr	w2, [x20, 16]
	add	x0, x20, 512
	mov	w5, 16
	lsl	w2, w2, 4
	str	w2, [x19, 12]
	sdiv	w12, w5, w11
	cmp	w8, 1
	ldrb	w2, [x20, 129]
	str	w2, [x19, 4]
	ldrb	w14, [x20, 128]
	str	w14, [x19]
	ldp	w13, w10, [x0, 232]
	ldp	w6, w7, [x0, 240]
	ldr	w17, [x20, 760]
	ldr	w16, [x20, 764]
	ble	.L60
	mov	w2, 0
	mov	w0, 1
	.p2align 2
.L36:
	add	w2, w2, 1
	lsl	w3, w0, w2
	cmp	w8, w3
	bgt	.L36
	lsl	w30, w3, 4
.L35:
	cmp	w1, 1
	ble	.L61
	mov	w0, 0
	mov	w15, 1
	.p2align 2
.L38:
	add	w0, w0, 1
	lsl	w4, w15, w0
	cmp	w1, w4
	bgt	.L38
	lsl	w15, w4, 4
.L37:
	ldrb	w5, [x20, 12]
	add	w7, w10, w7
	add	w17, w13, w17
	cmp	w5, 1
	beq	.L68
	add	w5, w13, w8, lsl 1
	add	w6, w5, w6
	add	w5, w10, w1, lsl 1
	add	w16, w5, w16
	asr	w5, w11, 1
	mul	w13, w13, w5
	mul	w10, w10, w5
	mul	w6, w6, w5
	mul	w7, w7, w5
	mul	w17, w17, w5
	mul	w16, w16, w5
.L40:
	neg	w5, w8, lsl 4
	sub	w23, w8, w3
	mul	w21, w12, w13
	madd	w6, w12, w6, w5
	asr	w22, w8, 1
	mul	w5, w23, w21
	madd	w5, w6, w3, w5
	cmp	w5, wzr
	ble	.L41
	add	w5, w5, w22
.L42:
	sdiv	w5, w5, w8
	mul	w20, w12, w10
	mul	w7, w12, w7
	mul	w18, w12, w17
	add	w5, w5, w30
	sub	w30, w1, w4
	mul	w6, w23, w20
	madd	w6, w7, w3, w6
	mul	w17, w21, w30
	madd	w17, w18, w4, w17
	cmp	w6, wzr
	add	w7, w6, w22
	sub	w6, w6, w22
	asr	w18, w1, 1
	csel	w6, w6, w7, le
	cmp	w17, wzr
	sdiv	w6, w6, w8
	ble	.L45
	add	w17, w17, w18
.L46:
	neg	w7, w1, lsl 4
	mul	w30, w20, w30
	madd	w8, w12, w16, w7
	madd	w7, w8, w4, w30
	cmp	w7, wzr
	add	w8, w7, w18
	sub	w7, w7, w18
	csel	w7, w7, w8, le
	cmp	w14, 3
	bls	.L69
	ldp	w2, w1, [x19, 16]
	ldp	w5, w8, [x19, 24]
	ldp	w14, w7, [x19, 32]
	ldp	w6, w3, [x19, 40]
	mov	w9, 0
	mov	w0, 0
.L55:
	lsl	w4, w11, w0
	cmp	w4, w2
	beq	.L70
.L57:
	mov	w4, 16
	sub	w0, w4, w0
	sub	w4, w4, w9
	lsl	w13, w14, w0
	lsl	w7, w7, w0
	lsl	w2, w2, w0
	lsl	w1, w1, w0
	lsl	w5, w5, w0
	lsl	w6, w6, w4
	lsl	w3, w3, w4
	lsl	w0, w8, w0
	stp	w2, w1, [x19, 16]
	stp	w5, w0, [x19, 24]
	stp	w13, w7, [x19, 32]
	stp	w6, w3, [x19, 40]
.L34:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L69:
	ldr	x8, .LC9
	ldrb	w8, [x8,w14,uxtw]
	adr	x14, .Lrtx51
	add	x8, x14, w8, sxtb #2
	br	x8
.Lrtx51:
	.section	.rodata
	.align	0
	.align	2
.L51:
	.byte	(.L62 - .Lrtx51) / 4
	.byte	(.L52 - .Lrtx51) / 4
	.byte	(.L53 - .Lrtx51) / 4
	.byte	(.L54 - .Lrtx51) / 4
	.text
	.p2align 3
.L62:
	mov	w4, 0
	mov	w12, 0
	mov	w10, 0
	mov	w13, 0
.L50:
	mov	w0, 0
	mov	w9, 0
.L59:
	lsr	w13, w13, w0
	lsr	w12, w12, w9
	lsr	w0, w10, w0
	lsr	w4, w4, w9
	mov	w1, 1
	str	w1, [x19]
	stp	w11, wzr, [x19, 16]
	stp	wzr, w11, [x19, 24]
	stp	w13, w0, [x19, 32]
	stp	w12, w4, [x19, 40]
	b	.L34
	.p2align 3
.L54:
	sdiv	w7, w7, w1
	cmp	w2, w0
	csel	w8, w2, w0, le
	add	w0, w2, w0
	add	w0, w0, w9
	lsr	w4, w4, w8
	add	w7, w7, w15
	sub	w0, w0, w8
	lsr	w8, w3, w8
	sdiv	w17, w17, w1
	neg	w1, w12
	mul	w2, w1, w10
	mul	w9, w1, w13
	add	w6, w6, w2
	add	w7, w7, w2
	add	w5, w5, w9
	add	w1, w17, w9
	mul	w2, w5, w4
	mul	w5, w6, w4
	lsl	w6, w3, 1
	neg	w3, w3, lsl 4
	mul	w1, w1, w8
	mul	w6, w6, w4
	mul	w8, w7, w8
	mul	w3, w3, w4
	mul	w12, w6, w12
	add	w4, w5, w8
	add	w6, w2, w1
	sub	w7, w0, #1
	madd	w6, w12, w13, w6
	madd	w12, w12, w10, w4
	mov	w4, 1
	add	w6, w6, w3
	add	w9, w0, w4
	lsl	w7, w4, w7
	lsl	w13, w13, w0
	lsl	w4, w4, w9
	add	w3, w12, w3
	lsl	w10, w10, w0
	add	w14, w13, w7
	add	w6, w6, w4
	add	w7, w10, w7
	add	w3, w3, w4
	add	w9, w0, 2
	stp	w2, w1, [x19, 16]
	stp	w5, w8, [x19, 24]
	stp	w14, w7, [x19, 32]
	stp	w6, w3, [x19, 40]
	b	.L55
	.p2align 3
.L53:
	neg	w4, w12
	add	w0, w9, w2
	sub	w1, w20, w6
	lsl	w7, w10, w0
	madd	w2, w4, w13, w5
	madd	w5, w4, w10, w6
	lsl	w4, w3, 1
	add	w6, w1, w2
	neg	w3, w3, lsl 4
	add	w9, w0, 2
	mul	w12, w4, w12
	add	w4, w2, w5
	mov	w8, w2
	stp	w2, w1, [x19, 16]
	madd	w6, w12, w13, w6
	madd	w12, w12, w10, w4
	add	w6, w6, w3
	mov	w4, 1
	add	w12, w12, w3
	sub	w3, w0, #1
	lsl	w3, w4, w3
	lsl	w13, w13, w0
	add	w14, w13, w3
	add	w7, w7, w3
	add	w3, w0, w4
	lsl	w3, w4, w3
	add	w6, w6, w3
	add	w3, w12, w3
	stp	w5, w2, [x19, 24]
	stp	w14, w7, [x19, 32]
	stp	w6, w3, [x19, 40]
	b	.L55
	.p2align 3
.L52:
	and	w12, w13, 1
	and	w4, w10, 1
	orr	w12, w12, w13, asr 1
	orr	w4, w4, w10, asr 1
	b	.L50
	.p2align 3
.L68:
	madd	w5, w11, w8, w13
	add	w6, w5, w6
	madd	w5, w11, w1, w10
	add	w16, w5, w16
	b	.L40
	.p2align 3
.L41:
	sub	w5, w5, w22
	b	.L42
	.p2align 3
.L45:
	sub	w17, w17, w18
	b	.L46
.L61:
	mov	w15, 16
	mov	w4, 1
	mov	w0, 0
	b	.L37
.L60:
	mov	w30, w5
	mov	w3, 1
	mov	w2, 0
	b	.L35
.L70:
	mov	w13, w14
	mov	w10, w7
	mov	w12, w6
	mov	w4, w3
	cbnz	w1, .L57
	cbnz	w5, .L57
	cmp	w2, w8
	mov	w1, w5
	bne	.L57
	b	.L59
	.size	MP4_GetGMCparam, .-MP4_GetGMCparam
	.align	3
.LC9:
	.xword	.L51
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
	cbz	x0, .L76
.L72:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L76:
	mov	w0, w21
	bl	GetUsd
	str	x0, [x20, w19, uxtw 3]
	cbz	x0, .L72
	add	w1, w19, 4
	str	w1, [x0, 1040]
	ldr	x0, [x20, w19, uxtw 3]
	b	.L72
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
.L78:
	ldr	x1, [x20, x19]
	mov	w0, w21
	bl	FreeUsdByDec
	str	xzr, [x20, x19]
	add	x19, x19, 8
	cmp	x19, 32
	bne	.L78
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
	ldr	x21, .LC12
	mov	x2, 24
	mov	w1, 0
	add	x0, x19, 3560
	ldr	x3, [x21, 96]
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 604
	mov	w1, 0
	add	x0, x19, 3584
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 60
	mov	w1, 0
	add	x0, x20, 696
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 768
	mov	w1, 0
	add	x0, x20, 756
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 7
	mov	w1, 0
	add	x0, x20, 1524
	blr	x3
	ldr	x3, .LC13
	mov	w1, 1
	mov	w0, 1
	strb	w1, [x20, 837]
	str	w0, [x20, 2152]
	add	x1, x19, 3672
	add	x4, x3, 256
	mov	w2, 8
	add	x0, x3, 4
	b	.L83
	.p2align 3
.L81:
	ldr	w2, [x0], 4
.L83:
	str	w2, [x1], 4
	cmp	x0, x4
	bne	.L81
	add	x0, x3, 260
	add	x1, x19, 3928
	add	x3, x3, 512
	mov	w2, 16
	b	.L82
	.p2align 3
.L85:
	ldr	w2, [x0], 4
.L82:
	str	w2, [x1], 4
	cmp	x0, x3
	bne	.L85
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	Mp4_Syntax_Init, .-Mp4_Syntax_Init
	.align	3
.LC12:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC13:
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
	ldr	x21, .LC16
	mov	x2, 32
	mov	w1, 0
	add	x0, x19, 1568
	ldr	x3, [x21, 96]
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 24
	mov	w1, 0
	add	x0, x19, 1536
	blr	x3
	mov	x0, x20
	bl	Mp4_Syntax_Init
	str	xzr, [x20, 22592]
	str	xzr, [x20, 22600]
	add	x2, x19, 2048
	str	xzr, [x20, 22608]
	mov	w0, 0
	str	xzr, [x20, 22616]
	str	wzr, [x19, 1604]
	str	wzr, [x19, 2064]
	str	wzr, [x19, 2068]
	str	wzr, [x19, 2072]
	str	wzr, [x19, 2080]
	str	xzr, [x20, 22624]
	stp	wzr, wzr, [x2, 36]
	stp	wzr, wzr, [x2, 44]
	str	wzr, [x19, 2100]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	Global_Data_Init, .-Global_Data_Init
	.align	3
.LC16:
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
	ldr	x24, .LC17
	mov	w20, 0
	mov	w23, 63
	b	.L89
	.p2align 3
.L96:
	ldr	w19, [x3, w1, sxtw 2]
	mov	w20, w1
	mov	w22, w0
.L89:
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
	ble	.L96
	cbnz	w0, .L87
	cmp	w20, 63
	bgt	.L87
	ldr	x1, .LC17
	b	.L92
	.p2align 3
.L97:
	ldrsw	x19, [x0, w20, sxtw 2]
.L92:
	sxth	w20, w2
	str	w22, [x21, x19, lsl 2]
	cmp	w20, 64
	add	x0, x1, 512
	add	w2, w20, 1
	bne	.L97
.L87:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	Bs_Get_Matrix, .-Bs_Get_Matrix
	.align	3
.LC17:
	.xword	.LANCHOR1
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
	cbnz	w0, .L99
	ldr	x2, .LC20
	mov	w1, 717
	mov	w0, 1
	add	x19, x19, 20480
	bl	dprint_normal
	add	x0, x29, 56
	strb	wzr, [x19, 1526]
	bl	BsPos
	mov	w20, w0
	ldr	x0, .LC21
	ldr	x4, [x0]
	cbz	x4, .L101
	ldr	w0, [x19, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 22
	blr	x4
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L99:
	mov	w1, 6
	add	x0, x29, 56
	add	x19, x19, 20480
	bl	BsGet
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 758]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 759]
	mov	w1, 1
	add	x0, x29, 56
	strb	w1, [x19, 1526]
	bl	BsPos
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L101:
	mov	w0, w20
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.size	Mp4_Syntax_Gop, .-Mp4_Syntax_Gop
	.align	3
.LC20:
	.xword	.LC19
	.align	3
.LC21:
	.xword	g_EventReportFunc
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
	ble	.L103
	cmp	w20, 4
	ble	.L104
	ldrb	w0, [x19, 4]
	add	x1, x19, 5
	strb	w0, [x22, 3]
	add	x5, x22, 4
	orr	w0, w0, -256
	mov	w19, 4
	lsl	w0, w0, 8
	b	.L105
	.p2align 3
.L110:
	ldrb	w4, [x1]
	add	x1, x1, 1
	orr	w0, w4, w0
	lsl	w0, w0, 8
	cmp	w0, 256
	beq	.L161
	strb	w4, [x5], 1
	cmp	w3, 1030
	beq	.L162
	mov	w19, w3
.L105:
	add	w3, w19, 1
	sub	w21, w19, #3
	cmp	w20, w3
	bne	.L110
.L108:
	add	x23, x22, 20480
	mov	w1, 1
	cmp	w21, 2
	lsl	w25, w20, 3
	mov	w0, w25
	strb	w1, [x23, 1530]
	bhi	.L163
.L153:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L103:
	add	x22, x22, 20480
	add	w19, w20, 1
	lsl	w0, w19, 3
	strb	wzr, [x22, 1530]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L161:
	sub	w0, w19, #1
	cmp	w20, w0
	bge	.L164
.L109:
	add	w0, w20, 1
	ldp	x21, x22, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	lsl	w0, w0, 3
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L163:
	ldr	w2, [x23, 2100]
	add	x1, x23, 2112
	ldr	w0, [x23, 2768]
	bl	Mp4_GetUserDataBuf
	str	x0, [x22, 22624]
	cbz	x0, .L165
	sub	w26, w19, #5
	str	w26, [x0, 1052]
	mov	w0, 65533
	ldr	x24, .LC22
	movk	w0, 0x7fff, lsl 16
	add	x20, x22, 3
	cmn	w19, w0
	mov	x2, 0
	ldr	x3, [x24, 104]
	ldr	x0, [x22, 22624]
	bmi	.L166
.L113:
	mov	x1, x20
	blr	x3
	ldr	x1, [x22, 22040]
	ldr	x2, .LC23
	ldr	x0, [x22, 22624]
	ldr	x1, [x1, 32]
	ldr	x4, [x2]
	str	x1, [x0, 1056]
	cbz	x4, .L112
	ldr	w0, [x23, 2768]
	mov	w3, 1064
	ldr	x2, [x22, 22624]
	mov	w1, 5
	blr	x4
.L112:
	mov	w1, 2
	mov	w0, 0
	movk	w1, 0x8000, lsl 16
	cmn	w26, w1
	bmi	.L167
.L114:
	add	x0, x22, x0, sxtw
	ldr	x1, .LC25
	add	x4, x29, 95
	add	x3, x29, 100
	add	x2, x29, 96
	strb	wzr, [x0, 3]
	mov	x0, x20
	ldr	x5, [x24, 144]
	blr	x5
	cmp	w0, 1
	ble	.L168
.L115:
	ldp	w2, w1, [x29, 96]
	cmp	w0, 3
	str	w2, [x23, 816]
	str	w1, [x23, 820]
	mov	w0, 0
	beq	.L169
.L117:
	str	w0, [x23, 824]
.L116:
	ldr	x1, .LC29
	add	x2, x29, 100
	ldr	x3, [x24, 144]
	mov	x0, x20
	blr	x3
	cmp	w0, 1
	beq	.L118
	ldr	x1, .LC31
	add	x5, x29, 100
	ldr	x6, [x24, 144]
	add	x4, x29, 108
	add	x3, x29, 104
	add	x2, x29, 96
	mov	x0, x20
	blr	x6
	cmp	w0, 4
	beq	.L118
	ldr	x1, .LC33
	add	x4, x29, 108
	ldr	x5, [x24, 144]
	add	x3, x29, 104
	add	x2, x29, 96
	mov	x0, x20
	blr	x5
	add	w0, w0, 1
	cmp	w0, 1
	ble	.L119
	ldp	w3, w1, [x29, 104]
	ldr	w2, [x29, 96]
	lsl	w3, w3, 8
	add	w2, w3, w2, lsl 16
	add	w1, w2, w1
	str	w1, [x29, 100]
.L119:
	cmp	w0, 4
	beq	.L118
	ldr	x1, .LC35
	mov	w2, 7
	ldr	x3, [x24, 152]
	mov	x0, x20
	blr	x3
	cbz	w0, .L170
.L130:
	ldr	x1, .LC37
	add	x2, x29, 100
	ldr	x3, [x24, 144]
	mov	x0, x20
	blr	x3
	cmp	w0, 1
	beq	.L121
	ldr	w0, [x23, 828]
.L122:
	strb	wzr, [x23, 769]
	strb	wzr, [x23, 770]
	strb	wzr, [x23, 767]
	strb	wzr, [x23, 766]
	strb	wzr, [x23, 768]
	ldr	w1, [x23, 816]
	cbz	w0, .L123
	cbz	w1, .L124
	str	wzr, [x23, 816]
	str	wzr, [x23, 820]
.L124:
	cmp	w0, 1
	beq	.L131
	mov	w1, -1
.L125:
	sub	w0, w0, #1
	cmp	w0, 11
	bls	.L135
.L126:
	ldr	w0, [x23, 832]
	mov	w2, 4668
	sub	w0, w0, #1
	cmp	w0, w2
	bhi	.L127
	mov	w0, 1
	strb	w0, [x23, 767]
.L127:
	cmp	w1, 498
	bhi	.L128
	mov	w0, 1
	strb	w0, [x23, 767]
.L128:
	mov	x1, 500
	ldr	x2, [x22, 21296]
	movk	x1, 0x19d, lsl 32
	mov	w0, w25
	cmp	x2, x1
	bne	.L153
	mov	w1, 1
	strb	w1, [x23, 768]
	b	.L153
.L162:
	add	x22, x22, 20480
	sub	w19, w19, #1
	lsl	w0, w19, 3
	strb	wzr, [x22, 1530]
	b	.L153
.L123:
	cmp	w1, 499
	bls	.L171
	mov	w2, 1
	cmp	w1, 502
	strb	w2, [x23, 769]
	sub	w1, w1, #1
	bls	.L125
.L134:
	mov	w2, 1
	strb	w2, [x23, 770]
	b	.L125
.L131:
	strb	w0, [x23, 769]
	mov	w1, -1
.L135:
	mov	w0, 1
	strb	w0, [x23, 767]
	b	.L126
.L118:
	ldr	w0, [x29, 100]
	str	w0, [x23, 832]
	b	.L130
.L170:
	mov	w0, 4600
	str	w0, [x23, 832]
	b	.L130
.L169:
	ldrsb	w0, [x29, 95]
	cmp	w0, 112
	cset	w0, eq
	b	.L117
.L121:
	ldr	w0, [x29, 100]
	str	w0, [x23, 828]
	b	.L122
.L167:
	add	w0, w26, 2
	mov	w1, 1024
	cmp	w0, w1
	csel	w0, w0, w1, le
	b	.L114
.L166:
	mov	w1, 1024
	cmp	w21, w1
	csel	w21, w21, w1, le
	sxtw	x2, w21
	b	.L113
.L104:
	cmp	w20, 3
	ble	.L109
	add	x22, x22, 20480
	mov	w1, 1
	mov	w0, 32
	strb	w1, [x22, 1530]
	b	.L153
.L165:
	add	x20, x22, 3
	mov	w26, w21
	ldr	x24, .LC22
	b	.L112
.L168:
	ldr	x1, .LC27
	add	x4, x29, 95
	ldr	x5, [x24, 144]
	add	x3, x29, 100
	add	x2, x29, 96
	mov	x0, x20
	blr	x5
	cmp	w0, 1
	ble	.L116
	b	.L115
	.p2align 3
.L164:
	mov	w20, w0
	b	.L108
.L171:
	cmp	w1, 502
	sub	w1, w1, #1
	bhi	.L134
	b	.L126
	.size	Mp4_Syntax_UserData, .-Mp4_Syntax_UserData
	.align	3
.LC22:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC23:
	.xword	g_EventReportFunc
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
	strb	wzr, [x19, 836]
	mov	w1, 32
	strb	w21, [x19, 837]
	strb	wzr, [x19, 838]
	add	x0, x29, 56
	strb	wzr, [x19, 839]
	strb	wzr, [x19, 840]
	strb	wzr, [x19, 841]
	strb	wzr, [x19, 842]
	strb	wzr, [x19, 843]
	str	wzr, [x19, 848]
	str	wzr, [x19, 852]
	str	wzr, [x19, 856]
	bl	BsSkip
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x20, 3560]
	cbnz	w0, .L187
	strb	w21, [x20, 3561]
	mov	w1, 4
	add	x0, x29, 56
	bl	BsGet
	uxtb	w21, w0
	cmp	w21, 1
	strb	w21, [x20, 3563]
	beq	.L188
.L175:
	strb	wzr, [x19, 1525]
	add	x0, x29, 56
	bl	BsPos
	mov	w20, w0
	ldr	x0, .LC38
	ldr	x4, [x0]
	cbz	x4, .L180
	ldr	w0, [x19, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L187:
	mov	w1, 4
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x20, 3561]
	mov	w1, 3
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x20, 3562]
	mov	w1, 4
	add	x0, x29, 56
	bl	BsGet
	uxtb	w21, w0
	cmp	w21, 1
	strb	w21, [x20, 3563]
	bne	.L175
.L188:
	mov	w1, w21
	add	x0, x29, 56
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x20, 3564]
	cbnz	w0, .L189
.L177:
	mov	w1, 1
	add	x0, x29, 56
	strb	w1, [x19, 1525]
	bl	BsPos
	cmp	w0, w22, lsl 3
	bgt	.L179
	ldrb	w0, [x20, 3560]
	strb	w0, [x19, 836]
	ldrb	w0, [x20, 3561]
	strb	w0, [x19, 837]
	ldrb	w0, [x20, 3562]
	strb	w0, [x19, 838]
	ldrb	w0, [x20, 3563]
	strb	w0, [x19, 839]
	ldrb	w0, [x20, 3564]
	strb	w0, [x19, 840]
	ldrb	w0, [x20, 3565]
	strb	w0, [x19, 841]
	ldrb	w0, [x20, 3566]
	strb	w0, [x19, 842]
	ldrb	w0, [x20, 3567]
	strb	w0, [x19, 843]
	ldr	w0, [x20, 3572]
	str	w0, [x19, 848]
	ldr	w0, [x20, 3576]
	str	w0, [x19, 852]
	ldr	w0, [x20, 3580]
	str	w0, [x19, 856]
.L179:
	add	x0, x29, 56
	bl	BsPos
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L180:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L189:
	mov	w1, 3
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x20, 3565]
	mov	w1, w21
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x20, 3566]
	mov	w1, w21
	add	x0, x29, 56
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x20, 3567]
	cbz	w0, .L177
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	str	w0, [x20, 3572]
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	str	w0, [x20, 3576]
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	str	w0, [x20, 3580]
	b	.L177
	.size	Mp4_Syntax_Vo, .-Mp4_Syntax_Vo
	.align	3
.LC38:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Mp4_Syntax_Vol
	.type	Mp4_Syntax_Vol, %function
Mp4_Syntax_Vol:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	w21, w2
	bl	_mcount
	mov	w2, w21
	mov	x1, x20
	add	x0, x29, 72
	add	x20, x19, 20480
	add	x19, x19, 16384
	bl	BsInit
	ldr	x22, .LC39
	add	x21, x19, 3584
	mov	x2, 604
	mov	w1, 0
	strb	wzr, [x20, 757]
	ldr	x3, [x22, 96]
	mov	x0, x21
	blr	x3
	mov	w1, 32
	add	x0, x29, 72
	bl	BsSkip
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	strb	w0, [x19, 3588]
	mov	w1, 8
	add	x0, x29, 72
	bl	BsGet
	str	w0, [x19, 3612]
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3584]
	cbnz	w0, .L326
	ldrb	w0, [x20, 837]
	mov	w1, 4
	strb	w0, [x19, 3585]
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 15
	strb	w0, [x19, 3587]
	beq	.L327
.L193:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3589]
	cbnz	w0, .L328
	mov	w0, 1
	strb	w0, [x19, 3590]
.L198:
	mov	w1, 2
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3592]
	cbz	w0, .L329
.L324:
	strb	wzr, [x20, 1527]
	add	x0, x29, 72
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC42
	ldr	x4, [x0]
	cbz	x4, .L266
	ldr	w0, [x20, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
	mov	w0, w19
.L299:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L329:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	cbz	w0, .L330
	mov	w1, 16
	add	x0, x29, 72
	bl	BsGet
	str	w0, [x19, 3656]
	cbz	w0, .L206
	subs	w0, w0, #1
	beq	.L255
	mov	w2, w0
	mov	w1, 0
	.p2align 2
.L208:
	add	w1, w1, 1
	lsr	w2, w2, 1
	sxth	w1, w1
	cbnz	w2, .L208
	cmp	w1, wzr
	mov	w1, 0
	ble	.L255
	.p2align 2
.L285:
	add	w1, w1, 1
	lsr	w0, w0, 1
	sxth	w1, w1
	cbnz	w0, .L285
.L207:
	str	w1, [x19, 3652]
.L211:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	cbnz	w0, .L212
	ldr	x2, .LC41
	mov	w1, 1514
	mov	w0, 1
	bl	dprint_normal
	b	.L217
	.p2align 3
.L328:
	mov	w1, 2
	add	x0, x29, 72
	bl	BsGet
	uxtb	w23, w0
	cmp	w23, 1
	strb	w23, [x19, 3590]
	beq	.L195
	strb	wzr, [x20, 1527]
	add	x0, x29, 72
	bl	BsPos
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L326:
	mov	w1, 4
	add	x0, x29, 72
	bl	BsGet
	strb	w0, [x19, 3585]
	mov	w1, 3
	add	x0, x29, 72
	bl	BsGet
	strb	w0, [x19, 3586]
	mov	w1, 4
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 15
	strb	w0, [x19, 3587]
	bne	.L193
.L327:
	mov	w1, 8
	add	x0, x29, 72
	bl	BsGet
	str	w0, [x19, 3616]
	mov	w1, 8
	add	x0, x29, 72
	bl	BsGet
	str	w0, [x19, 3620]
	b	.L193
	.p2align 3
.L266:
	mov	w0, w19
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L330:
	ldr	x2, .LC41
	mov	w1, 1501
	mov	w0, 1
	bl	dprint_normal
.L217:
	strb	wzr, [x20, 1527]
	add	x0, x29, 72
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC42
	ldr	x4, [x0]
	cbz	x4, .L266
	ldr	w0, [x20, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 22
	blr	x4
	ldr	x23, [sp, 48]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L195:
	mov	w1, w23
	add	x0, x29, 72
	bl	BsGet
	strb	w0, [x19, 3591]
	mov	w1, w23
	add	x0, x29, 72
	bl	BsGet
	str	w0, [x19, 3624]
	cbz	w0, .L198
	mov	w1, 15
	add	x0, x29, 72
	bl	BsGet
	str	w0, [x19, 3628]
	mov	w1, w23
	add	x0, x29, 72
	bl	BsGet
	cbnz	w0, .L199
	ldr	x2, .LC41
	mov	w1, 1473
	mov	w0, w23
	bl	dprint_normal
	b	.L217
	.p2align 3
.L206:
	mov	w0, 1
	str	w0, [x19, 3652]
	b	.L211
	.p2align 3
.L212:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3593]
	cbnz	w0, .L331
.L213:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	cbz	w0, .L332
	mov	w1, 13
	add	x0, x29, 72
	bl	BsGet
	str	w0, [x19, 3664]
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	cbnz	w0, .L215
	ldr	x2, .LC41
	mov	w1, 1524
	mov	w0, 1
	bl	dprint_normal
	b	.L217
	.p2align 3
.L332:
	ldr	x2, .LC41
	mov	w1, 1522
	mov	w0, 1
	bl	dprint_normal
	b	.L217
	.p2align 3
.L255:
	mov	w1, 1
	b	.L207
	.p2align 3
.L331:
	ldr	w1, [x19, 3652]
	add	x0, x29, 72
	bl	BsGet
	str	w0, [x19, 3660]
	b	.L213
	.p2align 3
.L215:
	mov	w1, 13
	add	x0, x29, 72
	bl	BsGet
	str	w0, [x19, 3668]
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	cbz	w0, .L333
	ldr	w0, [x19, 3664]
	cmp	w0, 31
	bls	.L217
	ldr	w1, [x19, 3668]
	cmp	w1, 31
	bls	.L217
	mul	w0, w0, w1
	mov	w1, 16777216
	cmp	w0, w1
	bhi	.L217
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	strb	w0, [x19, 3594]
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3595]
	cbnz	w0, .L220
	ldr	x0, .LC42
	strb	wzr, [x20, 1527]
	ldr	x4, [x0]
	cbz	x4, .L220
	ldr	w0, [x20, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
.L220:
	ldrb	w2, [x19, 3585]
	mov	w1, 2
	add	x0, x29, 72
	cmp	w2, 1
	csinc	w1, w1, wzr, ne
	bl	BsGet
	uxtb	w23, w0
	strb	w23, [x19, 3596]
	cbz	w23, .L223
	sub	w0, w23, #1
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L334
	strb	wzr, [x20, 1527]
	add	x0, x29, 72
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC42
	ldr	x4, [x0]
	cbz	x4, .L228
	ldr	w0, [x20, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
.L228:
	ldr	x2, .LC46
	mov	w1, 1617
	mov	w0, 1
	bl	dprint_normal
	mov	w0, w19
	b	.L299
	.p2align 3
.L199:
	mov	w1, 15
	add	x0, x29, 72
	bl	BsGet
	str	w0, [x19, 3632]
	mov	w1, w23
	add	x0, x29, 72
	bl	BsGet
	cbnz	w0, .L200
	ldr	x2, .LC41
	mov	w1, 1475
	mov	w0, w23
	bl	dprint_normal
	b	.L217
.L200:
	mov	w1, 15
	add	x0, x29, 72
	bl	BsGet
	str	w0, [x19, 3636]
	mov	w1, w23
	add	x0, x29, 72
	bl	BsGet
	cbnz	w0, .L201
	ldr	x2, .LC41
	mov	w1, 1477
	mov	w0, w23
	bl	dprint_normal
	b	.L217
.L333:
	ldr	x2, .LC41
	mov	w1, 1526
	mov	w0, 1
	bl	dprint_normal
	b	.L217
.L201:
	mov	w1, 3
	add	x0, x29, 72
	bl	BsGet
	str	w0, [x19, 3640]
	mov	w1, 11
	add	x0, x29, 72
	bl	BsGet
	str	w0, [x19, 3644]
	mov	w1, w23
	add	x0, x29, 72
	bl	BsGet
	cbnz	w0, .L202
	ldr	x2, .LC41
	mov	w1, 1481
	mov	w0, w23
	bl	dprint_normal
	b	.L217
.L202:
	mov	w1, 15
	add	x0, x29, 72
	bl	BsGet
	str	w0, [x19, 3648]
	mov	w1, w23
	add	x0, x29, 72
	bl	BsGet
	cbnz	w0, .L198
	ldr	x2, .LC41
	mov	w1, 1483
	mov	w0, w23
	bl	dprint_normal
	b	.L217
.L334:
	cmp	w23, 2
	beq	.L225
	strb	wzr, [x20, 1527]
	add	x0, x29, 72
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC42
	ldr	x4, [x0]
	cbz	x4, .L226
	ldr	w0, [x20, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
.L226:
	ldr	x2, .LC44
	mov	w1, 1575
	mov	w0, 1
	bl	dprint_normal
	mov	w0, w19
	b	.L299
.L223:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3597]
	cbz	w0, .L229
	strb	wzr, [x20, 1527]
	add	x0, x29, 72
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC42
	ldr	x4, [x0]
	cbz	x4, .L230
	ldr	w0, [x20, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
.L230:
	ldr	x2, .LC48
	mov	w1, 1631
	mov	w0, 1
	bl	dprint_normal
	mov	w0, w19
	b	.L299
.L229:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3598]
	cbnz	w0, .L335
.L232:
	ldrb	w0, [x19, 3585]
	cmp	w0, 1
	beq	.L239
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	strb	w0, [x19, 3601]
.L240:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3602]
	cbnz	w0, .L241
	ldr	x2, .LC51
	mov	w1, 1682
.L319:
	mov	w0, 1
	bl	dprint_normal
	b	.L324
.L225:
	mov	w1, 6
	add	x0, x29, 72
	bl	BsGet
	strb	w0, [x19, 3608]
	mov	w1, w23
	add	x0, x29, 72
	bl	BsGet
	strb	w0, [x19, 3609]
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	strb	w0, [x19, 3610]
	ldrb	w1, [x19, 3596]
	cmp	w1, 2
	beq	.L223
	strb	wzr, [x20, 1527]
	add	x0, x29, 72
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC42
	ldr	x4, [x0]
	cbz	x4, .L227
	ldr	w0, [x20, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
.L227:
	ldr	x2, .LC44
	mov	w1, 1607
	mov	w0, 1
	bl	dprint_normal
	mov	w0, w19
	b	.L299
.L241:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	strb	w0, [x19, 3603]
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3604]
	cbnz	w0, .L336
	ldrb	w0, [x19, 3585]
	cmp	w0, 1
	bne	.L337
	strb	wzr, [x19, 3605]
	strb	wzr, [x19, 3606]
.L245:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3607]
	cbz	w0, .L246
	ldr	x2, .LC59
	mov	w1, 1735
	b	.L319
.L239:
	strb	wzr, [x19, 3601]
	b	.L240
.L335:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3599]
	cbnz	w0, .L338
	ldr	x0, .LC49
	add	x1, x19, 3672
	add	x3, x0, 256
.L235:
	ldr	w2, [x0], 4
	str	w2, [x1], 4
	cmp	x0, x3
	bne	.L235
.L234:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3600]
	cbnz	w0, .L339
	ldr	x0, .LC49
	add	x1, x19, 3928
	add	x0, x0, 256
	add	x3, x0, 256
.L237:
	ldr	w2, [x0], 4
	str	w2, [x1], 4
	cmp	x0, x3
	bne	.L237
	b	.L232
.L337:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3605]
	cbz	w0, .L244
	ldr	x2, .LC55
	mov	w1, 1707
	b	.L319
.L338:
	add	x1, x19, 3672
	add	x0, x29, 72
	bl	Bs_Get_Matrix
	b	.L234
.L336:
	ldr	x2, .LC53
	mov	w1, 1694
	b	.L319
.L339:
	add	x1, x19, 3928
	add	x0, x29, 72
	bl	Bs_Get_Matrix
	b	.L232
.L246:
	mov	w0, 1
	ldr	x3, [x22, 104]
	strb	w0, [x20, 1527]
	mov	x2, 604
	strb	w0, [x20, 757]
	mov	x1, x21
	strb	w0, [x20, 1528]
	add	x0, x20, 92
	blr	x3
	add	x0, x29, 72
	bl	BsPos
	b	.L299
.L244:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3606]
	cbz	w0, .L245
	ldr	x2, .LC57
	mov	w1, 1718
	b	.L319
	.size	Mp4_Syntax_Vol, .-Mp4_Syntax_Vol
	.align	3
.LC39:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC41:
	.xword	.LC40
	.align	3
.LC42:
	.xword	g_EventReportFunc
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
.LC49:
	.xword	.LANCHOR1
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
	str	wzr, [x20, 844]
	bl	BsSkip
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	sub	w2, w0, #1
	sub	w1, w0, #240
	cmp	w2, 2
	ccmp	w1, 5, 0, hi
	str	w0, [x19, 3568]
	ccmp	w0, 8, 4, hi
	beq	.L347
	cbz	w0, .L348
	ldr	x0, .LC64
	strb	wzr, [x20, 1524]
	ldr	x4, [x0]
	cbz	x4, .L342
	ldr	w0, [x20, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
	add	x0, x29, 56
	bl	BsPos
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L347:
	mov	w1, 1
	str	w0, [x20, 844]
	strb	w1, [x20, 1524]
.L342:
	add	x0, x29, 56
	bl	BsPos
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L348:
	ldr	x2, .LC63
	mov	w3, 0
	mov	w1, 1781
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 1
	strb	w0, [x20, 1524]
	ldr	w0, [x19, 3568]
	str	w0, [x20, 844]
	b	.L342
	.size	Mp4_Syntax_Vos, .-Mp4_Syntax_Vos
	.align	3
.LC63:
	.xword	.LC62
	.align	3
.LC64:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_FrameInit
	.type	MP4_FrameInit, %function
MP4_FrameInit:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	mov	w21, w1
	mov	w20, w2
	bl	_mcount
	add	x19, x22, 20480
	ldr	x3, .LC65
	mov	x2, 36
	mov	w1, 0
	add	x0, x29, 56
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x5, [x22, 22040]
	mov	w4, 3
	stp	w21, w20, [x29, 72]
	mov	w3, 2
	ldr	w0, [x19, 2768]
	ldr	w6, [x5, 16]
	mov	w2, 0
	str	w3, [x29, 56]
	add	x1, x29, 56
	cmp	w6, 24
	csinc	w4, w4, wzr, ne
	str	w4, [x29, 80]
	stp	w21, w20, [x29, 64]
	ldr	w4, [x5, 16]
	cmp	w4, 24
	csinc	w3, w3, wzr, ne
	str	w3, [x29, 84]
	mov	w3, 8
	strb	w3, [x29, 61]
	bl	FSP_ArrangeFsPool
	cmp	w0, 2
	beq	.L357
	cbnz	w0, .L358
	mov	w1, 1
	mov	w0, 0
	str	w1, [x19, 2772]
.L353:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L358:
	ldr	x3, .LC66
	mov	w1, 2162
	ldr	x2, .LC68
	mov	w0, 0
	add	x3, x3, 1280
	bl	dprint_normal
	str	wzr, [x19, 2772]
	mov	w0, -1
	b	.L353
.L357:
	add	x0, x19, 2160
	bl	ResetVoQueue
	str	wzr, [x19, 2772]
	mov	w0, -1
	b	.L353
	.size	MP4_FrameInit, .-MP4_FrameInit
	.align	3
.LC65:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC66:
	.xword	.LANCHOR1
	.align	3
.LC68:
	.xword	.LC67
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
	ldrb	w0, [x20, 863]
	cmp	w0, 15
	beq	.L375
	sub	w2, w0, #2
	uxtb	w2, w2
	cmp	w2, 1
	bls	.L368
	sub	w2, w0, #4
	uxtb	w2, w2
	cmp	w2, 1
	bls	.L369
	mov	w22, 5
	cmp	w0, 1
	csel	w22, wzr, w22, ne
.L361:
	ldr	w0, [x20, 2768]
	mov	w1, w19
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L359
	mov	w1, w22
	bl	SetAspectRatio
	ldr	w1, [x20, 776]
	mov	x4, -1
	ldrb	w0, [x19, 156]
	lsr	w1, w1, 1
	str	w1, [x19, 48]
	ldrb	w2, [x19, 157]
	ldr	w1, [x20, 772]
	lsr	w1, w1, 1
	str	w1, [x19, 52]
	ldr	w1, [x20, 2068]
	str	w1, [x19, 104]
	ldr	w1, [x20, 2064]
	str	w1, [x19, 100]
	ldrb	w1, [x20, 1464]
	bfi	w0, w1, 0, 2
	strb	w0, [x19, 156]
	ldrb	w1, [x20, 841]
	bfi	w0, w1, 5, 3
	strb	w0, [x19, 156]
	mov	w1, 2295
	ldrb	w0, [x20, 870]
	and	w0, w0, 1
	bfi	w2, w0, 0, 2
	mov	w0, 24
	orr	w2, w2, 12
	strb	w2, [x19, 157]
	ldrb	w3, [x20, 1469]
	bfi	w2, w3, 4, 2
	strb	w2, [x19, 157]
	ldr	w2, [x19, 156]
	bfi	w2, w22, 14, 3
	str	w2, [x19, 156]
	ldrb	w2, [x20, 1464]
	and	w2, w2, 3
	str	w2, [x19, 24]
	ldrb	w2, [x20, 1464]
	str	wzr, [x19, 20]
	and	w2, w2, 3
	str	w2, [x19, 28]
	ldr	x2, [x21, 22592]
	str	x2, [x19, 168]
	ldr	x2, [x21, 22600]
	str	x2, [x19, 176]
	ldr	x2, [x21, 22608]
	str	x2, [x19, 184]
	ldr	x2, [x21, 22616]
	str	x2, [x19, 192]
	ldr	x3, [x21, 22040]
	ldr	x2, .LC70
	ldr	x3, [x3, 32]
	str	x3, [x19, 208]
	ldr	x3, [x21, 22040]
	ldr	x3, [x3, 48]
	str	x3, [x19, 216]
	ldr	x3, [x21, 22040]
	ldr	x3, [x3, 64]
	str	x3, [x19, 224]
	ldr	x3, [x21, 22040]
	ldr	w3, [x3, 80]
	str	w3, [x19]
	ldr	x3, [x21, 22040]
	ldr	w3, [x3, 84]
	str	w3, [x19, 4]
	ldr	x3, [x21, 22040]
	ldr	w3, [x3, 88]
	str	w3, [x19, 8]
	ldr	x3, [x21, 22040]
	ldr	w3, [x3, 104]
	str	w3, [x19, 12]
	ldr	x3, [x21, 22040]
	str	x4, [x3, 32]
	ldr	w3, [x20, 2768]
	ldp	x4, x5, [x19, 208]
	bl	dprint_normal
.L359:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L369:
	mov	w22, 2
	b	.L361
	.p2align 3
.L368:
	mov	w22, 1
	b	.L361
	.p2align 3
.L375:
	ldr	w1, [x20, 892]
	mov	w22, 0
	ldr	w0, [x20, 896]
	cmp	w1, wzr
	ccmp	w0, wzr, 4, ne
	cset	w3, eq
	cbnz	w3, .L361
	ldr	w2, [x20, 944]
	mov	w22, w3
	mul	w2, w0, w2
	cbz	w2, .L361
	ldr	w0, [x20, 940]
	lsl	w1, w1, 10
	mul	w0, w1, w0
	udiv	w0, w0, w2
	subs	w2, w0, #1365
	bmi	.L376
.L362:
	subs	w1, w0, #1820
	bmi	.L377
.L363:
	mov	w22, 2
	cmp	w2, w1
	csinc	w22, w22, wzr, ge
	b	.L361
	.p2align 3
.L376:
	mov	w2, 1365
	sub	w2, w2, w0
	b	.L362
	.p2align 3
.L377:
	mov	w1, 1820
	sub	w1, w1, w0
	b	.L363
	.size	Mp4_RecordFrameAtr, .-Mp4_RecordFrameAtr
	.align	3
.LC70:
	.xword	.LC69
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
	mov	w1, -1
	ldrb	w0, [x19, 1464]
	strb	w0, [x20, 2]
	cmp	w0, 4
	str	w1, [x19, 2796]
	beq	.L389
	ldr	w0, [x19, 2768]
	mov	w1, 1
	bl	FSP_NewLogicFs
	mov	w1, w0
	str	w0, [x19, 2796]
.L381:
	tbnz	w1, #31, .L382
	ldr	w0, [x19, 2772]
	cbz	w0, .L382
	mov	x0, x20
	bl	Mp4_RecordFrameAtr
	str	wzr, [x19, 2072]
	mov	w0, 0
.L385:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L389:
	ldr	w3, [x19, 2768]
	ldr	x5, .LC71
	mov	w0, w3
	ldr	w1, [x19, 2788]
	sxtw	x2, w3
	lsl	x3, x2, 2
	sub	x3, x3, x2
	lsl	x4, x3, 5
	add	x3, x3, x4
	add	x2, x3, x2
	add	x2, x5, x2
	ldr	w3, [x2, 88]
	add	w3, w3, 1
	str	w3, [x2, 88]
	bl	FSP_LinkLogicFs
	cbz	x0, .L390
	ldr	w1, [x0, 4]
	str	w1, [x19, 2796]
	b	.L381
	.p2align 3
.L382:
	ldrb	w3, [x20, 2]
	mov	w1, 2323
	ldr	x2, .LC73
	mov	w0, 0
	bl	dprint_normal
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2788]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L384
	ldr	w0, [x19, 2768]
	ldr	x1, [x20, 168]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2768]
	ldr	x1, [x20, 176]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2768]
	ldr	x1, [x20, 184]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2768]
	ldr	x1, [x20, 192]
	bl	FreeUsdByDec
	stp	xzr, xzr, [x20, 168]
	stp	xzr, xzr, [x20, 184]
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2788]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2780]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 2768]
	bl	FSP_GetNullLogicFs
	str	w0, [x19, 2780]
	str	w0, [x19, 2788]
.L384:
	ldr	w0, [x19, 2768]
	add	x1, x19, 2160
	str	wzr, [x19, 2776]
	bl	FSP_ClearNotInVoQueue
	mov	w0, -1
	b	.L385
	.p2align 3
.L390:
	ldr	w1, [x19, 2796]
	b	.L381
	.size	Mp4_Frame_Atr, .-Mp4_Frame_Atr
	.align	3
.LC71:
	.xword	g_VfmwChanStat
	.align	3
.LC73:
	.xword	.LC72
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
	mov	x19, x0
	mov	x0, x30
	add	x22, x19, 20480
	add	x20, x19, 1048
	bl	_mcount
	add	x21, x22, 756
	ldr	x3, .LC74
	mov	x2, 48
	mov	w1, 0
	add	x0, x29, 64
	ldr	x3, [x3, 96]
	blr	x3
	ldr	w2, [x21, 20]
	add	w0, w2, 15
	lsr	w0, w0, 4
	strh	w0, [x20, 152]
	ldr	w1, [x21, 16]
	add	w0, w1, 15
	lsr	w0, w0, 4
	strh	w0, [x20, 154]
	ldrb	w0, [x21, 708]
	strb	w0, [x19, 1048]
	cmp	w0, 3
	ldrb	w0, [x21, 118]
	strb	w0, [x20, 1]
	ldrb	w0, [x21, 9]
	strb	w0, [x20, 2]
	ldrb	w0, [x21, 715]
	strb	w0, [x20, 3]
	ldrb	w0, [x21, 720]
	strb	w0, [x20, 4]
	ldrb	w0, [x21, 719]
	strb	w0, [x20, 5]
	ldr	w0, [x21, 172]
	strb	w0, [x20, 6]
	ldrb	w0, [x21, 716]
	strb	w0, [x20, 7]
	ldrb	w0, [x21, 717]
	strb	w0, [x20, 8]
	ldrb	w0, [x21, 712]
	strb	w0, [x20, 9]
	ldrb	w0, [x21, 123]
	strb	w0, [x20, 10]
	ldrb	w0, [x21, 121]
	strb	w0, [x20, 11]
	ldrb	w0, [x21, 710]
	strb	w0, [x20, 12]
	ldrb	w0, [x21, 714]
	strb	w0, [x20, 13]
	ldrb	w0, [x21, 713]
	strb	w0, [x20, 14]
	ldrb	w0, [x21, 114]
	strb	w0, [x20, 15]
	ldr	w0, [x21, 52]
	str	w0, [x20, 156]
	ldr	w0, [x21, 48]
	str	w0, [x20, 160]
	ldrb	w0, [x21, 12]
	strb	w0, [x20, 146]
	ldrb	w0, [x21, 11]
	strb	w0, [x20, 145]
	ldrb	w0, [x21, 10]
	strb	w0, [x20, 144]
	ldrb	w0, [x21, 13]
	strb	w0, [x20, 147]
	ldrb	w0, [x21, 14]
	strb	w0, [x20, 148]
	ldrb	w0, [x21, 15]
	strb	w0, [x20, 149]
	str	w1, [x20, 14556]
	str	w2, [x20, 14560]
	ldrb	w0, [x21, 116]
	str	w0, [x20, 14564]
	ccmp	w0, 2, 0, eq
	beq	.L405
	ldrb	w0, [x21, 129]
	str	w0, [x20, 14572]
	str	wzr, [x20, 14568]
	str	wzr, [x20, 14576]
	str	wzr, [x20, 14580]
	str	wzr, [x20, 14584]
	str	wzr, [x20, 14588]
	str	wzr, [x20, 14592]
	str	wzr, [x20, 14596]
	str	wzr, [x20, 14600]
	str	wzr, [x20, 14604]
.L393:
	ldr	w1, [x22, 2796]
	ldr	w0, [x22, 2768]
	bl	FSP_GetLogicFs
	mov	x21, x0
	ldr	w1, [x22, 2780]
	ldr	w0, [x22, 2768]
	bl	FSP_GetLogicFs
	mov	x23, x0
	ldr	w1, [x22, 2788]
	ldr	w0, [x22, 2768]
	bl	FSP_GetLogicFs
	cmp	x21, xzr
	ccmp	x23, xzr, 4, ne
	ccmp	x0, xzr, 4, ne
	beq	.L406
	ldr	x1, [x21, 24]
	cbz	x1, .L407
	ldr	x1, [x21, 40]
	ldr	w1, [x1, 8]
	str	w1, [x20, 180]
	ldr	x1, [x0, 40]
	ldr	w1, [x1, 8]
	str	w1, [x20, 184]
	ldr	x0, [x0, 24]
	cbz	x0, .L408
.L403:
	ldr	w0, [x0, 4]
	str	w0, [x20, 176]
	ldr	x0, [x23, 24]
	cbz	x0, .L409
.L404:
	ldr	w0, [x0, 4]
	add	x1, x19, 1064
	str	w0, [x20, 172]
	add	x3, x22, 1204
	add	x0, x22, 948
	ldr	x2, [x21, 24]
	ldr	w2, [x2, 4]
	stp	w2, wzr, [x20, 164]
	ldr	x2, [x21, 24]
	ldr	w2, [x2, 4]
	str	w2, [x20, 188]
	ldr	x2, [x21, 24]
	ldr	w2, [x2, 44]
	str	w2, [x20, 14536]
	ldr	x2, [x21, 24]
	ldr	w2, [x2, 48]
	str	w2, [x20, 14540]
	ldr	x2, [x21, 24]
	ldr	w2, [x2, 72]
	str	w2, [x20, 14544]
	ldr	x2, [x21, 24]
	ldr	w2, [x2, 64]
	str	w2, [x20, 14548]
	ldr	x2, [x21, 24]
	ldr	w2, [x2, 68]
	str	w2, [x20, 14552]
	ldrb	w2, [x21, 424]
	strb	w2, [x20, 151]
	.p2align 2
.L401:
	ldr	w2, [x0]
	add	x0, x0, 4
	strb	w2, [x1]
	add	x1, x1, 1
	cmp	x0, x3
	ldr	w2, [x0, 252]
	strb	w2, [x1, 63]
	bne	.L401
	ldrh	w0, [x20, 152]
	ldrh	w1, [x20, 154]
	mul	w0, w0, w1
	str	w0, [x22, 1496]
.L391:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
.L406:
	ldr	x3, .LC75
	mov	w4, 2422
	ldr	x2, .LC77
	mov	w1, w4
	add	x3, x3, 1296
	mov	w0, 0
	bl	dprint_normal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
.L409:
	ldr	x0, [x21, 24]
	b	.L404
.L408:
	ldr	x0, [x21, 24]
	b	.L403
.L405:
	add	x1, x29, 64
	mov	x0, x21
	bl	MP4_GetGMCparam
	ldrb	w2, [x21, 129]
	ldp	w6, w0, [x29, 80]
	ldr	w1, [x29, 64]
	ldp	w5, w4, [x29, 88]
	ldr	w3, [x29, 96]
	str	w1, [x20, 14568]
	str	w2, [x20, 14572]
	str	w0, [x20, 14580]
	ldp	w2, w1, [x29, 100]
	ldr	w0, [x29, 108]
	str	w6, [x20, 14576]
	str	w5, [x20, 14584]
	str	w4, [x20, 14588]
	str	w3, [x20, 14592]
	str	w2, [x20, 14596]
	str	w1, [x20, 14600]
	str	w0, [x20, 14604]
	b	.L393
.L407:
	ldr	x2, .LC79
	mov	x6, 0
	ldr	w3, [x22, 2780]
	mov	w1, 2428
	ldr	w5, [x22, 2788]
	mov	w0, 0
	ldr	w4, [x22, 2796]
	bl	dprint_normal
	b	.L391
	.size	Mp4_Set_DecPar, .-Mp4_Set_DecPar
	.align	3
.LC74:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC75:
	.xword	.LANCHOR1
	.align	3
.LC77:
	.xword	.LC76
	.align	3
.LC79:
	.xword	.LC78
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
	ldr	w0, [x1, 1604]
	cmp	w0, 2
	ldr	x0, [x19, 22040]
	beq	.L422
	ldr	w0, [x0, 8]
	cmp	w0, 2
	beq	.L415
.L423:
	cmp	w0, 1
	beq	.L421
	cmp	w0, 4
	csel	w0, w0, wzr, eq
.L421:
	str	w0, [x1, 1604]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L422:
	ldr	w2, [x0, 8]
	cmp	w2, 2
	beq	.L415
	mov	w2, 1
	str	w2, [x1, 2152]
	ldr	w0, [x0, 8]
	cmp	w0, 2
	bne	.L423
.L415:
	mov	w0, 2
	str	w0, [x1, 1604]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	Mp4_Get_DecMode, .-Mp4_Get_DecMode
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
	ldr	x2, .LC81
	mov	w1, 2496
	mov	w0, 3
	bl	dprint_normal
	cmp	x19, xzr
	ccmp	x21, xzr, 4, ne
	beq	.L429
	ldr	w0, [x21, 636]
	add	x20, x19, 20480
	ldr	x22, .LC82
	cmp	w0, 1
	beq	.L432
.L427:
	ldr	x3, [x22, 96]
	mov	x2, 23296
	mov	w1, 0
	mov	x0, x19
	ldr	w23, [x20, 2760]
	blr	x3
	str	w23, [x20, 2760]
	add	x0, x20, 2160
	bl	ResetVoQueue
	str	x21, [x19, 22040]
	mov	x0, x19
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x20, 2768]
	beq	.L433
	mov	x0, x19
	bl	Global_Data_Init
	mov	w23, w0
	cbnz	w0, .L429
	mov	w0, 1
	ldr	x2, .LC86
	str	w0, [x20, 2076]
	mov	w1, 2535
	str	wzr, [x20, 2104]
	mov	w0, 3
	bl	dprint_normal
	ldr	w21, [x21, 636]
	cmp	w21, 1
	beq	.L434
.L426:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, w23
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 784
	ret
	.p2align 3
.L434:
	ldr	x3, [x22, 104]
	add	x1, x29, 80
	mov	x2, 768
	add	x0, x20, 756
	add	x19, x19, 16384
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x29, 160
	mov	x2, 24
	add	x0, x19, 3560
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x29, 184
	mov	x2, 604
	add	x0, x19, 3584
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x29, 72
	mov	x2, 7
	add	x0, x20, 1524
	blr	x3
	strb	w21, [x20, 2805]
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 784
	ret
	.p2align 3
.L432:
	ldr	x3, [x22, 104]
	add	x1, x20, 756
	mov	x2, 768
	add	x0, x29, 80
	add	x23, x19, 16384
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x23, 3560
	mov	x2, 24
	add	x0, x29, 160
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x23, 3584
	mov	x2, 604
	add	x0, x29, 184
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 7
	add	x1, x20, 1524
	add	x0, x29, 72
	blr	x3
	b	.L427
	.p2align 3
.L429:
	mov	w23, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, w23
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 784
	ret
	.p2align 3
.L433:
	ldr	x2, .LC84
	mov	w1, 2523
	mov	w0, 0
	mov	w23, -20
	bl	dprint_normal
	b	.L426
	.size	MPEG4DEC_Init, .-MPEG4DEC_Init
	.align	3
.LC81:
	.xword	.LC80
	.align	3
.LC82:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC84:
	.xword	.LC83
	.align	3
.LC86:
	.xword	.LC85
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_PrepareNvopDecparam
	.type	MP4_PrepareNvopDecparam, %function
MP4_PrepareNvopDecparam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 20480
	ldrb	w0, [x0, 760]
	cbnz	w0, .L437
	mov	x0, x19
	bl	MP4_PrepareNvopDecparam.part.1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L437:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP4_PrepareNvopDecparam, .-MP4_PrepareNvopDecparam
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
	cbz	x19, .L440
	add	x19, x19, 20480
	mov	w1, w20
	mov	w2, 0
	ldr	w0, [x19, 2768]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 2768]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L441
	ldr	w0, [x19, 2768]
	ldr	x1, [x20, 168]
	bl	FreeUsdByDec
	str	xzr, [x20, 168]
	ldr	x1, [x20, 176]
	ldr	w0, [x19, 2768]
	bl	FreeUsdByDec
	str	xzr, [x20, 176]
	mov	w0, 1
.L439:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L441:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L440:
	mov	w0, -2
	b	.L439
	.size	MPEG4DEC_RecycleImage, .-MPEG4DEC_RecycleImage
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
	bl	_mcount
	add	x0, x19, 20480
	ldr	w1, [x0, 2796]
	ldr	w0, [x0, 2768]
	bl	FSP_GetFsImagePtr
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP4_SetImgFormat, .-MP4_SetImgFormat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG4DEC_FlushRemainImg
	.type	MPEG4DEC_FlushRemainImg, %function
MPEG4DEC_FlushRemainImg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x20, 22040]
	ldr	w0, [x0, 12]
	cmp	w0, 1
	beq	.L443
	add	x19, x20, 20480
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2788]
	bl	FSP_GetFsImagePtr
	mov	x21, x0
	cbz	x0, .L443
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2788]
	bl	FSP_GetDisplay
	cmp	w0, 2
	mov	w22, w0
	beq	.L453
.L443:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L453:
	ldr	w1, [x19, 2796]
	ldr	w0, [x19, 2768]
	bl	FSP_GetFsImagePtr
	ldr	w0, [x19, 2768]
	mov	w2, 1
	ldr	w1, [x21, 88]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 2768]
	mov	x4, x21
	add	x3, x19, 2160
	mov	x2, x20
	mov	w1, w22
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L443
	ldr	w1, [x21, 88]
	mov	x0, x20
	bl	MPEG4DEC_RecycleImage
	ldr	w0, [x19, 2768]
	ldr	x1, [x21, 168]
	bl	FreeUsdByDec
	str	xzr, [x21, 168]
	ldr	x1, [x21, 176]
	ldr	w0, [x19, 2768]
	bl	FreeUsdByDec
	str	xzr, [x21, 176]
	b	.L443
	.size	MPEG4DEC_FlushRemainImg, .-MPEG4DEC_FlushRemainImg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG4DEC_GetImageBuffer
	.type	MPEG4DEC_GetImageBuffer, %function
MPEG4DEC_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x20, x20, 20480
	bl	_mcount
	ldr	w0, [x20, 2768]
	bl	FSP_IsNewFsAvailable
	cmp	w0, 1
	beq	.L456
	cmn	w0, #1
	mov	w19, 0
	beq	.L458
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L456:
	mov	w19, w0
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L458:
	ldr	w0, [x20, 2768]
	add	x1, x20, 2160
	bl	FSP_ClearNotInVoQueue
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MPEG4DEC_GetImageBuffer, .-MPEG4DEC_GetImageBuffer
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
	add	x19, x19, 16384
	bl	_mcount
	mov	w0, 3
	ldr	w1, [x19, 3556]
	ldr	x19, [sp, 16]
	cmp	w1, 1
	csinv	w0, w0, wzr, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	MP4_GetPacketState, .-MP4_GetPacketState
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
	cbnz	w0, .L463
	ldrb	w0, [x19, 98]
	cmp	w0, 1
	beq	.L464
.L463:
	ldr	x3, .LC87
	mov	x2, 176
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L464:
	ldr	w1, [x19, 112]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
	b	.L463
	.size	MP4_ClearCurPacket, .-MP4_ClearCurPacket
	.align	3
.LC87:
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
	add	x22, x20, 16384
	bl	_mcount
	add	x1, x20, 20480
	ldr	w0, [x22, 3548]
	cmp	w0, wzr
	ldr	w21, [x1, 2768]
	ble	.L468
	sub	w0, w0, #1
	add	x19, x20, 12288
	add	x0, x0, 3960
	add	x19, x19, 3548
	add	x20, x20, x0, lsl 2
	.p2align 2
.L467:
	ldr	w1, [x19], 4
	mov	w0, w21
	bl	SM_ReleaseStreamSeg
	cmp	x19, x20
	bne	.L467
.L468:
	str	wzr, [x22, 3548]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MP4_ClearCurPic, .-MP4_ClearCurPic
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
	ldr	x1, [x19, 22040]
	add	x0, x19, 12288
	add	x19, x19, 20480
	add	x0, x0, 3544
	add	x19, x19, 2812
	ldr	w2, [x1, 856]
	cmp	w2, 1
	beq	.L474
.L472:
	ldr	x21, .LC88
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
.L471:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L474:
	ldr	w1, [x1, 888]
	cmp	w1, 1
	bne	.L472
	ldr	x3, .LC88
	mov	x2, 4
	mov	x1, x19
	ldr	x3, [x3, 104]
	blr	x3
	b	.L471
	.size	MP4_GetScdUpMsg, .-MP4_GetScdUpMsg
	.align	3
.LC88:
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
	add	x2, x19, 20480
	ldrb	w0, [x0, 3603]
	ldrb	w3, [x2, 696]
	cbnz	w0, .L483
	add	x19, x19, 12288
	ldrb	w0, [x19, 3544]
	tst	w0, 120
	bne	.L483
	ldrh	w0, [x19, 3544]
	cmp	w3, 3
	ubfx	x0, x0, 7, 4
	add	w0, w0, 17
	bls	.L485
	ldr	x2, .LC91
	mov	w1, 3268
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
.L476:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L485:
	ldr	x1, .LC89
	ldrb	w1, [x1,w3,uxtw]
	adr	x3, .Lrtx479
	add	x1, x3, w1, sxtb #2
	br	x1
.Lrtx479:
	.section	.rodata
	.align	0
	.align	2
.L479:
	.byte	(.L484 - .Lrtx479) / 4
	.byte	(.L480 - .Lrtx479) / 4
	.byte	(.L481 - .Lrtx479) / 4
	.byte	(.L480 - .Lrtx479) / 4
	.text
	.p2align 3
.L484:
	mov	w1, 17
.L478:
	cmp	w1, w0
	ldr	x19, [sp, 16]
	csetm	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L481:
	ldrb	w3, [x2, 705]
	ldrb	w1, [x2, 704]
	mov	w2, 18
	cmp	w1, w3, uxtb
	csel	w1, w1, w3, cs
	uxtb	w1, w1
	add	w1, w1, 16
	cmp	w1, w2
	csel	w1, w1, w2, ge
	b	.L478
	.p2align 3
.L480:
	ldrb	w1, [x2, 704]
	add	w1, w1, 16
	b	.L478
	.p2align 3
.L483:
	mov	w0, -1
	b	.L476
	.size	Mp4_Check_Slice_NotSH, .-Mp4_Check_Slice_NotSH
	.align	3
.LC89:
	.xword	.L479
	.align	3
.LC91:
	.xword	.LC90
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
	add	x2, x19, 1244
	ldr	w4, [x19, 15580]
	ldr	w0, [x0, 3552]
	tbz	x0, 1, .L487
	add	x1, x19, 12288
	ldrb	w0, [x1, 3378]
	cmp	w0, 1
	beq	.L502
	cbnz	w0, .L495
	ldrb	w0, [x1, 3466]
	cmp	w0, 1
	bne	.L495
	sub	w3, w4, #1
	lsl	x0, x3, 3
	sub	x3, x0, x3
	add	x3, x2, x3, lsl 2
	ldr	w0, [x3, 12]
	cbnz	w0, .L497
	ldr	w0, [x3, 20]
	cbnz	w0, .L497
	ldr	w1, [x3, 8]
	add	w20, w1, w20, lsl 3
	str	w20, [x3, 8]
	ldr	w1, [x19, 15760]
	str	w1, [x3, 20]
	ldr	w1, [x19, 15764]
	lsl	w1, w1, 3
	str	w1, [x3, 12]
.L490:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L502:
	sub	w3, w4, #1
	cmp	w3, 510
	bhi	.L503
	lsl	x1, x3, 3
	sub	x1, x1, x3
	add	x3, x2, x1, lsl 2
	ldr	w1, [x3, 12]
	cbz	w1, .L491
	ldr	w2, [x3, 20]
	cbz	w2, .L491
	ldr	w4, [x19, 15672]
	cmp	w2, w4
	bhi	.L504
	add	w1, w1, w20, lsl 3
	mov	w0, 0
	str	w1, [x3, 12]
	b	.L490
	.p2align 3
.L491:
	ldr	w0, [x3, 16]
	ldr	w1, [x19, 15672]
	cmp	w1, w0
	bls	.L493
	ldr	w1, [x3, 8]
	mov	w0, 0
	add	w20, w1, w20, lsl 3
	str	w20, [x3, 8]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L493:
	lsl	w20, w20, 3
	str	w20, [x3, 12]
	mov	w0, 0
	ldr	w1, [x19, 15672]
	str	w1, [x3, 20]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L495:
	mov	w3, 3337
.L501:
	ldr	x2, .LC95
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L490
	.p2align 3
.L497:
	mov	w0, -1
	b	.L490
	.p2align 3
.L487:
	mov	w3, 3343
	b	.L501
.L503:
	ldr	x2, .LC93
	mov	w3, w4
	mov	w1, 3296
	bl	dprint_normal
	mov	w0, -1
	b	.L490
.L504:
	mov	w3, 3316
	ldr	x2, .LC95
	mov	w1, w3
	bl	dprint_normal
	mov	w0, -1
	b	.L490
	.size	Mp4_Combine_SliceData, .-Mp4_Combine_SliceData
	.align	3
.LC93:
	.xword	.LC92
	.align	3
.LC95:
	.xword	.LC94
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
	ldrb	w0, [x2, 3544]
	tbnz	x0, 0, .L506
	mov	w0, 2
	strb	w0, [x19, 765]
	ldr	w0, [x20]
	lsr	w0, w0, 8
	sub	w0, w0, #128
	cmp	w0, 3
	bhi	.L507
	ldrb	w0, [x2, 3544]
	orr	w0, w0, 2
	strb	w0, [x2, 3544]
.L507:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L506:
	mov	w0, 196
	str	w0, [x20]
	mov	w0, 1
	strb	w0, [x19, 765]
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
	ldr	w0, [x22, 2044]
	ldr	w21, [x22, 2768]
	cmp	w0, w1
	csel	w0, w0, w1, le
	cmp	w0, wzr
	ble	.L511
	sub	w0, w0, #1
	add	x19, x22, 1788
	add	x0, x0, 4096
	add	x0, x0, 1472
	add	x20, x20, x0, lsl 2
	.p2align 2
.L510:
	ldr	w1, [x19], 4
	mov	w0, w21
	bl	SM_ReleaseStreamSeg
	cmp	x19, x20
	bne	.L510
.L511:
	ldr	x3, .LC96
	mov	x2, 456
	mov	w1, 0
	add	x0, x22, 1608
	ldr	x3, [x3, 96]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MP4_Clean_HeadPacket, .-MP4_Clean_HeadPacket
	.align	3
.LC96:
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
	mov	x23, x0
	mov	x0, x30
	mov	w25, w1
	add	x24, x23, 16384
	bl	_mcount
	add	x20, x23, 20480
	ldr	x3, .LC97
	mov	x2, 14608
	mov	w1, 0
	add	x0, x23, 1048
	ldr	x3, [x3, 96]
	blr	x3
	ldr	w22, [x20, 2768]
	ldr	w0, [x24, 3548]
	cmp	w0, wzr
	ble	.L519
	sub	w21, w0, #1
	add	x19, x23, 12288
	add	x21, x21, 3960
	add	x19, x19, 3548
	add	x21, x23, x21, lsl 2
	.p2align 2
.L518:
	ldr	w1, [x19], 4
	mov	w0, w22
	bl	SM_ReleaseStreamSeg
	cmp	x21, x19
	bne	.L518
.L519:
	mov	x0, x23
	str	wzr, [x24, 3548]
	bl	MP4_Clean_HeadPacket
	ldrb	w0, [x20, 1464]
	cmp	w0, 2
	beq	.L570
.L517:
	ldr	w1, [x20, 2796]
	ldr	w0, [x20, 2768]
	str	w25, [x20, 2072]
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	ldr	w1, [x20, 2788]
	ldr	w0, [x20, 2768]
	bl	FSP_GetFsImagePtr
	mov	x25, x0
	cbz	x24, .L571
	ldr	w0, [x20, 2072]
	add	x21, x20, 2112
	str	w0, [x24, 96]
	mov	x19, 0
	ldr	w22, [x20, 2768]
.L522:
	ldr	x1, [x21, x19]
	mov	w0, w22
	bl	FreeUsdByDec
	str	xzr, [x21, x19]
	add	x19, x19, 8
	cmp	x19, 32
	bne	.L522
	ldrb	w0, [x20, 1464]
	cmp	w0, 2
	beq	.L523
	ldr	x1, [x23, 22040]
	ldr	w0, [x20, 2072]
	ldr	w2, [x1]
	cmp	w0, w2
	bhi	.L572
.L523:
	ldr	w0, [x20, 2768]
	ldr	w1, [x20, 2796]
	str	wzr, [x20, 2152]
	bl	FSP_GetFsImagePtr
	ldr	x0, [x23, 22040]
	ldr	w0, [x0, 12]
	cbz	w0, .L573
	ldr	w1, [x20, 2796]
	ldrb	w19, [x20, 1464]
	ldr	w22, [x20, 804]
	str	w1, [x20, 2800]
.L529:
	cmn	w1, #1
	beq	.L531
	ldr	w0, [x20, 2768]
	bl	FSP_GetFsImagePtr
	mov	x21, x0
	cbz	x0, .L574
	cmp	w19, 4
	ccmp	w22, wzr, 0, eq
	beq	.L575
	ldr	w3, [x0, 96]
	cbz	w3, .L534
	ldr	x0, [x23, 22040]
	ldr	w4, [x0, 4]
	cmp	w3, w4
	bhi	.L535
.L534:
	ldr	w0, [x20, 2768]
	ldr	w1, [x20, 2800]
	bl	FSP_GetLogicFs
	cbz	x0, .L567
	cmp	w19, 2
	beq	.L537
	ldr	w0, [x0, 20]
	cmp	w0, 2
	beq	.L537
	ldr	x2, .LC105
	mov	w1, 3138
	ldr	w3, [x20, 2800]
	mov	w0, 9
	bl	dprint_normal
	.p2align 2
.L531:
	ldr	w1, [x20, 2080]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x20, 2080]
.L566:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L573:
	ldrb	w19, [x20, 1464]
	cmp	w19, 2
	beq	.L527
	ldr	w0, [x20, 2776]
	cmp	w0, 1
	ble	.L528
	ldr	w1, [x20, 2780]
	str	w1, [x20, 2800]
	ldr	w22, [x20, 2784]
	ldrb	w19, [x23]
	b	.L529
	.p2align 3
.L535:
	ldr	x0, .LC100
	ldr	x5, [x0]
	cbz	x5, .L540
	ldr	w0, [x20, 2768]
	add	x2, x29, 88
	stp	w3, w4, [x29, 88]
	mov	w1, 23
	mov	w3, 8
	blr	x5
	ldr	x0, [x23, 22040]
	ldr	w3, [x21, 96]
	ldr	w4, [x0, 4]
.L540:
	ldr	x2, .LC107
	mov	w1, 3144
	mov	w0, 1
	bl	dprint_normal
	ldr	w0, [x20, 2768]
	ldr	x1, [x21, 168]
	bl	FreeUsdByDec
	str	xzr, [x21, 168]
	ldr	x1, [x21, 176]
	ldr	w0, [x20, 2768]
	bl	FreeUsdByDec
	str	xzr, [x21, 176]
	mov	w2, 0
	ldr	w0, [x20, 2768]
	ldr	w1, [x20, 2800]
	bl	FSP_SetDisplay
	b	.L531
	.p2align 3
.L537:
	ldr	w0, [x20, 2768]
	mov	w2, 1
	ldr	w1, [x20, 2800]
	bl	FSP_SetDisplay
	ldr	w0, [x20, 2768]
	mov	x4, x21
	add	x3, x20, 2160
	mov	x2, x23
	mov	w1, 2
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L531
.L567:
	ldr	w0, [x20, 2768]
	ldr	x1, [x21, 168]
.L568:
	bl	FreeUsdByDec
	str	xzr, [x21, 168]
	ldr	x1, [x21, 176]
	ldr	w0, [x20, 2768]
	bl	FreeUsdByDec
	str	xzr, [x21, 176]
	mov	w2, 0
	ldr	w0, [x20, 2768]
	ldr	w1, [x20, 2800]
	bl	FSP_SetDisplay
	mov	w0, -1
	b	.L566
	.p2align 3
.L570:
	ldr	w0, [x20, 2768]
	mov	w2, 0
	ldr	w1, [x20, 2796]
	bl	FSP_SetRef
	b	.L517
	.p2align 3
.L527:
	ldr	w1, [x20, 2796]
	str	w1, [x20, 2800]
	ldr	w22, [x20, 804]
	cbz	x25, .L529
	ldr	x0, [x24, 208]
	ldr	x2, [x25, 208]
	cmp	x2, x0
	bge	.L529
	str	x2, [x24, 208]
	str	x0, [x25, 208]
	ldr	w1, [x20, 2800]
	b	.L529
.L528:
	mov	w0, -1
	str	w0, [x20, 2800]
	b	.L531
.L572:
	ldr	x2, .LC100
	ldr	x4, [x2]
	cbz	x4, .L524
	str	w0, [x29, 88]
	mov	w3, 8
	ldr	w0, [x20, 2768]
	add	x2, x29, 88
	ldr	w5, [x1]
	mov	w1, 23
	str	w5, [x29, 92]
	blr	x4
.L524:
	ldr	w0, [x20, 2768]
	mov	w2, 1
	ldr	w1, [x20, 2788]
	str	w2, [x20, 2152]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L525
	ldr	w0, [x20, 2768]
	ldr	x1, [x19, 168]
	bl	FreeUsdByDec
	ldr	w0, [x20, 2768]
	ldr	x1, [x19, 176]
	bl	FreeUsdByDec
	ldr	w0, [x20, 2768]
	ldr	x1, [x19, 184]
	bl	FreeUsdByDec
	ldr	w0, [x20, 2768]
	ldr	x1, [x19, 192]
	bl	FreeUsdByDec
	stp	xzr, xzr, [x19, 168]
	stp	xzr, xzr, [x19, 184]
	ldr	w0, [x20, 2768]
	ldr	w1, [x20, 2788]
	bl	FSP_ClearLogicFs
	ldr	w0, [x20, 2768]
	ldr	w1, [x20, 2780]
	bl	FSP_ClearLogicFs
	ldr	w0, [x20, 2768]
	bl	FSP_GetNullLogicFs
	str	w0, [x20, 2780]
	str	w0, [x20, 2788]
.L525:
	mov	w0, -1
	str	wzr, [x20, 2776]
	b	.L566
.L575:
	ldr	w1, [x20, 2768]
	ldr	x4, .LC103
	mov	w0, w1
	sxtw	x1, w1
	lsl	x2, x1, 2
	sub	x2, x2, x1
	lsl	x3, x2, 5
	add	x2, x2, x3
	add	x1, x2, x1
	add	x1, x4, x1
	ldr	w2, [x1, 92]
	add	w2, w2, 1
	str	w2, [x1, 92]
	ldr	x1, [x21, 168]
	b	.L568
.L571:
	ldr	x2, .LC99
	mov	x4, x0
	mov	x3, 0
	mov	w1, 3029
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L566
.L574:
	mov	w3, 3093
	ldr	x2, .LC102
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L566
	.size	MPEG4DEC_VDMPostProc, .-MPEG4DEC_VDMPostProc
	.align	3
.LC97:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC99:
	.xword	.LC98
	.align	3
.LC100:
	.xword	g_EventReportFunc
	.align	3
.LC102:
	.xword	.LC101
	.align	3
.LC103:
	.xword	g_VfmwChanStat
	.align	3
.LC105:
	.xword	.LC104
	.align	3
.LC107:
	.xword	.LC106
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP4_Record_SlcSegID
	.type	MP4_Record_SlcSegID, %function
MP4_Record_SlcSegID:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x22, x20, 16384
	bl	_mcount
	ldr	w0, [x22, 3548]
	cmp	w0, 1022
	bhi	.L583
	add	x1, x20, x0, uxtw 2
	ldr	w4, [x20, 15680]
	add	x3, x20, 12288
	add	w2, w0, 1
	str	w4, [x1, 15836]
	str	w2, [x22, 3548]
	ldrb	w1, [x3, 3378]
	cbnz	w1, .L576
	ldrb	w1, [x3, 3466]
	cmp	w1, 1
	beq	.L584
.L576:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L583:
	mov	x0, x20
	add	x23, x20, 20480
	bl	MP4_Clean_HeadPacket
	ldr	w1, [x22, 3548]
	ldr	w21, [x23, 2768]
	cmp	w1, wzr
	ble	.L581
	sub	w1, w1, #1
	add	x24, x20, 12288
	add	x1, x1, 3960
	add	x19, x24, 3548
	add	x20, x20, x1, lsl 2
	.p2align 2
.L579:
	ldr	w1, [x19], 4
	mov	w0, w21
	bl	SM_ReleaseStreamSeg
	cmp	x19, x20
	bne	.L579
	ldr	w0, [x23, 2768]
.L578:
	add	x1, x24, 3368
	str	wzr, [x22, 3548]
	bl	MP4_ClearCurPacket
	ldr	w3, [x22, 3548]
	mov	w4, 1022
	ldr	x2, .LC109
	mov	w1, 3634
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L584:
	add	x2, x20, x2, uxtw 2
	ldr	w1, [x20, 15768]
	add	w0, w0, 2
	str	w1, [x2, 15836]
	str	w0, [x22, 3548]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L581:
	mov	w0, w21
	add	x24, x20, 12288
	b	.L578
	.size	MP4_Record_SlcSegID, .-MP4_Record_SlcSegID
	.align	3
.LC109:
	.xword	.LC108
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
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	mov	w19, w2
	bl	_mcount
	ldr	w3, [x21, 15580]
	cbnz	w3, .L626
.L586:
	mov	x1, x20
	mov	w2, w19
	add	x0, x29, 72
	add	x20, x21, 20480
	bl	BsInit
	ldr	x3, .LC112
	mov	x2, 60
	mov	w1, 0
	add	x0, x20, 696
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
	strb	w0, [x20, 706]
	cmp	w1, 3
	bls	.L627
	strb	wzr, [x20, 1529]
	add	x0, x29, 72
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC114
	ldr	x4, [x0]
	cbz	x4, .L611
	ldr	w0, [x20, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L627:
	ldr	x0, .LC113
	ldrb	w0, [x0,w1,uxtw]
	adr	x1, .Lrtx589
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx589:
	.section	.rodata
	.align	0
	.align	2
.L589:
	.byte	(.L588 - .Lrtx589) / 4
	.byte	(.L590 - .Lrtx589) / 4
	.byte	(.L591 - .Lrtx589) / 4
	.byte	(.L592 - .Lrtx589) / 4
	.text
	.p2align 3
.L591:
	mov	w3, 18
	mov	w2, 22
	mov	w1, 352
	mov	w0, 288
	strb	w3, [x20, 707]
	strb	w2, [x20, 708]
	str	w0, [x20, 772]
	str	w1, [x20, 776]
.L593:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	ldrb	w1, [x20, 763]
	strb	w0, [x20, 696]
	cmp	w1, 2
	beq	.L595
	ldr	w1, [x20, 2152]
	cmp	w1, 1
	ccmp	w0, wzr, 4, eq
	bne	.L595
	mov	w1, 4
	add	x0, x29, 72
	bl	BsSkip
	mov	w1, 5
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L625
	mov	w0, 1
.L625:
	strb	w0, [x20, 703]
	mov	w1, 1
	add	x0, x29, 72
	lsl	w22, w19, 3
	mov	w19, 0
	bl	BsSkip
.L601:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	cmp	w0, 1
	beq	.L628
	add	w19, w19, 1
	cmp	w19, 15
	bls	.L602
.L624:
	strb	wzr, [x20, 1529]
	add	x0, x29, 72
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC114
	ldr	x4, [x0]
	cbz	x4, .L611
	ldr	w0, [x20, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 22
	blr	x4
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L590:
	mov	w3, 9
	mov	w2, 11
	mov	w1, 176
	mov	w0, 144
	strb	w3, [x20, 707]
	strb	w2, [x20, 708]
	str	w0, [x20, 772]
	str	w1, [x20, 776]
	b	.L593
	.p2align 3
.L588:
	mov	w3, 6
	mov	w2, 8
	mov	w1, 128
	mov	w0, 96
	strb	w3, [x20, 707]
	strb	w2, [x20, 708]
	str	w0, [x20, 772]
	str	w1, [x20, 776]
	b	.L593
	.p2align 3
.L592:
	mov	w3, 18
	mov	w2, 88
	mov	w1, 704
	mov	w0, 576
	strb	w3, [x20, 707]
	strb	w2, [x20, 708]
	str	w0, [x20, 772]
	str	w1, [x20, 776]
	b	.L593
	.p2align 3
.L628:
	add	x0, x29, 72
	add	w19, w19, 1
	bl	BsPos
	cmp	w0, w22
	mov	w1, 8
	add	x0, x29, 72
	bgt	.L629
	bl	BsSkip
	cmp	w19, 15
	bls	.L601
	b	.L624
	.p2align 3
.L626:
	ldr	x2, .LC111
	mov	w1, 740
	mov	w0, 1
	bl	dprint_normal
	str	wzr, [x21, 15580]
	b	.L586
	.p2align 3
.L602:
	add	x24, x21, 16384
	mov	w2, 1
	strb	w2, [x20, 1529]
	add	x0, x29, 72
	add	x19, x21, 12288
	ldr	w1, [x24, 3552]
	orr	w1, w1, 2
	str	w1, [x24, 3552]
	ldr	w1, [x21, 15580]
	add	w1, w1, 1
	str	w1, [x21, 15580]
	strb	w2, [x20, 704]
	bl	BsPos
	mov	w23, w0
	asr	w0, w0, 31
	sub	w22, w22, w23
	lsr	w0, w0, 29
	str	w22, [x21, 1252]
	add	w1, w23, w0
	add	w2, w23, 7
	ldr	w3, [x20, 1552]
	and	w1, w1, 7
	sub	w0, w1, w0
	cmp	w23, wzr
	add	w0, w3, w0
	strb	w0, [x21, 1250]
	csel	w0, w2, w23, lt
	ldr	w1, [x20, 1544]
	add	w0, w1, w0, asr 3
	str	w0, [x21, 1260]
	ldrb	w0, [x19, 3378]
	cbz	w0, .L630
.L603:
	strb	wzr, [x21, 1251]
	str	wzr, [x21, 1256]
	str	wzr, [x21, 1264]
.L604:
	ldrb	w0, [x20, 696]
	strb	w0, [x21, 1248]
	ldrb	w0, [x20, 705]
	strb	w0, [x21, 1246]
	ldrb	w0, [x20, 704]
	strb	w0, [x21, 1245]
	ldrb	w0, [x20, 703]
	strb	w0, [x21, 1249]
	ldrb	w0, [x20, 700]
	strb	w0, [x21, 1247]
	ldr	w3, [x24, 3548]
	cbnz	w3, .L631
.L605:
	mov	x0, x21
	bl	MP4_Record_SlcSegID
	mov	w0, w23
.L623:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L595:
	add	x0, x29, 72
	bl	BsPos
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L630:
	ldrb	w0, [x19, 3466]
	cmp	w0, 1
	bne	.L603
	ldr	w0, [x21, 15764]
	ldr	w1, [x21, 15760]
	lsl	w0, w0, 3
	strb	wzr, [x21, 1251]
	str	w0, [x21, 1256]
	str	w1, [x21, 1264]
	b	.L604
	.p2align 3
.L611:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
.L631:
	ldr	x2, .LC116
	mov	w1, 877
	mov	w0, 1
	bl	dprint_normal
	ldr	w22, [x20, 2768]
	ldr	w0, [x24, 3548]
	cmp	w0, wzr
	ble	.L608
	sub	w20, w0, #1
	add	x19, x19, 3548
	add	x20, x20, 3960
	add	x20, x21, x20, lsl 2
	.p2align 2
.L607:
	ldr	w1, [x19], 4
	mov	w0, w22
	bl	SM_ReleaseStreamSeg
	cmp	x19, x20
	bne	.L607
.L608:
	str	wzr, [x24, 3548]
	b	.L605
.L629:
	bl	BsPos
	b	.L623
	.size	Mp4_Syntax_ShortHeader, .-Mp4_Syntax_ShortHeader
	.align	3
.LC111:
	.xword	.LC110
	.align	3
.LC112:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC113:
	.xword	.L589
	.align	3
.LC114:
	.xword	g_EventReportFunc
	.align	3
.LC116:
	.xword	.LC115
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
	mov	x22, x1
	mov	w21, w2
	bl	_mcount
	ldr	w3, [x20, 15580]
	cbnz	w3, .L717
	add	x19, x20, 20480
	ldrb	w0, [x19, 757]
	cbnz	w0, .L634
.L718:
	strb	wzr, [x19, 1529]
	mov	w0, 32
.L635:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L717:
	ldr	x2, .LC117
	mov	w1, 1165
	mov	w0, 1
	add	x19, x20, 20480
	bl	dprint_normal
	str	wzr, [x20, 15580]
	ldrb	w0, [x19, 757]
	cbz	w0, .L718
.L634:
	mov	x1, x22
	mov	w2, w21
	add	x0, x29, 120
	add	x22, x19, 696
	bl	BsInit
	ldr	x23, .LC118
	mov	x2, 60
	mov	w1, 0
	mov	x0, x22
	ldr	x3, [x23, 96]
	blr	x3
	strb	wzr, [x19, 1529]
	mov	w1, 32
	add	x0, x29, 120
	bl	BsSkip
	mov	w1, 2
	add	x0, x29, 120
	bl	BsGet
	strb	w0, [x19, 696]
	ldr	x2, .LC120
	uxtb	w3, w0
	mov	w1, 1186
	mov	w0, 16
	bl	dprint_normal
	ldrb	w0, [x19, 763]
	cmp	w0, 1
	beq	.L712
	cmp	w0, 2
	beq	.L638
	ldr	w0, [x19, 2152]
	cmp	w0, 1
	beq	.L712
.L637:
	lsl	w21, w21, 3
	mov	w24, 0
	mov	w25, 6400
	b	.L641
	.p2align 3
.L720:
	add	x0, x29, 120
	add	w24, w24, 1
	bl	BsPos
	cmp	w0, w21
	bgt	.L719
	cmp	w24, w25
	beq	.L642
.L641:
	mov	w1, 1
	add	x0, x29, 120
	bl	BsGet
	cbnz	w0, .L720
	mov	w0, 6399
	cmp	w24, w0
	bhi	.L642
	mov	w1, 1
	add	x0, x29, 120
	bl	BsGet
	cbz	w0, .L721
	ldr	w1, [x19, 928]
	mov	w0, 0
	cbnz	w1, .L722
.L645:
	str	w0, [x19, 784]
	mov	w1, 1
	str	w24, [x19, 780]
	add	x0, x29, 120
	bl	BsGet
	cbnz	w0, .L646
	ldr	x2, .LC125
	mov	w1, 1250
.L716:
	mov	w0, 1
	bl	dprint_normal
	strb	wzr, [x19, 1529]
	add	x0, x29, 120
	bl	BsPos
	mov	w20, w0
	ldr	x0, .LC126
	ldr	x4, [x0]
	cbz	x4, .L673
	ldr	w0, [x19, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 22
	blr	x4
	mov	w0, w20
	b	.L635
	.p2align 3
.L712:
	ldrb	w0, [x19, 696]
	cbz	w0, .L637
.L638:
	add	x0, x29, 120
	bl	BsPos
	b	.L635
	.p2align 3
.L719:
	add	x0, x29, 120
	bl	BsPos
	mov	w19, w0
	ldr	x2, .LC122
	mov	w1, 1226
	mov	w0, 1
	bl	dprint_normal
	mov	w0, w19
	b	.L635
	.p2align 3
.L642:
	strb	wzr, [x19, 1529]
	add	x0, x29, 120
	bl	BsPos
	mov	w19, w0
	ldr	x2, .LC124
	mov	w3, w24
	mov	w1, 1237
	mov	w0, 1
	bl	dprint_normal
	mov	w0, w19
	b	.L635
.L646:
	mov	w1, 1
	add	x0, x29, 120
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 697]
	cbz	w0, .L723
	ldrb	w0, [x19, 696]
	cmp	w0, 1
	beq	.L648
	cmp	w0, 3
	beq	.L724
.L649:
	strb	wzr, [x19, 698]
.L650:
	ldrb	w0, [x19, 868]
	add	x24, x20, 16384
	strb	wzr, [x19, 699]
	cmp	w0, 2
	beq	.L651
	mov	w1, 3
	add	x0, x29, 120
	add	x24, x20, 16384
	bl	BsGet
	strb	w0, [x19, 700]
	ldrb	w0, [x24, 3594]
	cbnz	w0, .L725
	mov	w0, 2
	strb	wzr, [x19, 702]
	strb	w0, [x19, 701]
.L653:
	ldrb	w0, [x19, 872]
	sub	w0, w0, #1
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L654
.L657:
	mov	w1, 5
	add	x0, x29, 120
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L713
	mov	w0, 1
.L713:
	strb	w0, [x19, 703]
	ldrb	w0, [x19, 696]
	cbnz	w0, .L726
.L651:
	mov	w0, 1
	strb	w0, [x19, 1529]
	ldr	x4, [x23, 104]
	mov	x1, x22
	ldr	w3, [x24, 3552]
	mov	x2, 60
	add	x0, x19, 1464
	add	x23, x20, 12288
	orr	w3, w3, 2
	str	w3, [x24, 3552]
	ldr	w3, [x20, 15580]
	add	w3, w3, 1
	str	w3, [x20, 15580]
	blr	x4
	add	x0, x29, 120
	bl	BsPos
	mov	w22, w0
	asr	w0, w0, 31
	sub	w21, w21, w22
	lsr	w0, w0, 29
	str	w21, [x20, 1252]
	add	w1, w22, w0
	add	w2, w22, 7
	ldr	w3, [x19, 1552]
	and	w1, w1, 7
	sub	w0, w1, w0
	cmp	w22, wzr
	add	w0, w3, w0
	strb	w0, [x20, 1250]
	csel	w0, w2, w22, lt
	ldr	w1, [x19, 1544]
	add	w0, w1, w0, asr 3
	str	w0, [x20, 1260]
	ldrb	w0, [x23, 3378]
	cbnz	w0, .L665
	ldrb	w0, [x23, 3466]
	cmp	w0, 1
	beq	.L727
.L665:
	strb	wzr, [x20, 1251]
	str	wzr, [x20, 1256]
	str	wzr, [x20, 1264]
.L666:
	ldrb	w0, [x19, 696]
	strb	w0, [x20, 1248]
	ldrb	w0, [x19, 705]
	strb	w0, [x20, 1246]
	ldrb	w0, [x19, 704]
	strb	w0, [x20, 1245]
	ldrb	w0, [x19, 703]
	strb	w0, [x20, 1249]
	ldrb	w0, [x19, 700]
	strb	w0, [x20, 1247]
	ldr	w3, [x24, 3548]
	cbnz	w3, .L728
.L667:
	mov	x0, x20
	bl	MP4_Record_SlcSegID
	mov	w0, w22
	b	.L635
.L724:
	ldrb	w0, [x19, 872]
	cmp	w0, 2
	bne	.L649
.L648:
	mov	w1, 1
	add	x0, x29, 120
	bl	BsGet
	strb	w0, [x19, 698]
	b	.L650
.L721:
	ldr	x2, .LC125
	mov	w1, 1241
	b	.L716
.L722:
	add	x0, x29, 120
	bl	BsGet
	b	.L645
.L673:
	mov	w0, w20
	b	.L635
.L728:
	ldr	x2, .LC131
	mov	w1, 1407
	mov	w0, 1
	bl	dprint_normal
	ldr	w25, [x19, 2768]
	ldr	w0, [x24, 3548]
	cmp	w0, wzr
	ble	.L670
	sub	w21, w0, #1
	add	x19, x23, 3548
	add	x21, x21, 3960
	add	x21, x20, x21, lsl 2
	.p2align 2
.L669:
	ldr	w1, [x19], 4
	mov	w0, w25
	bl	SM_ReleaseStreamSeg
	cmp	x19, x21
	bne	.L669
.L670:
	str	wzr, [x24, 3548]
	b	.L667
.L723:
	add	x20, x20, 16384
	mov	w0, 4
	mov	w1, 1
	strb	w0, [x19, 696]
	strb	w0, [x19, 1464]
	add	x0, x29, 120
	strb	w1, [x19, 1529]
	ldr	w1, [x20, 3552]
	orr	w1, w1, 128
	str	w1, [x20, 3552]
	bl	BsPos
	b	.L635
.L725:
	mov	w1, 1
	add	x0, x29, 120
	bl	BsGet
	strb	w0, [x19, 701]
	mov	w1, 1
	add	x0, x29, 120
	bl	BsGet
	strb	w0, [x19, 702]
	b	.L653
.L726:
	mov	w1, 3
	add	x0, x29, 120
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 704]
	cbz	w0, .L729
	ldrb	w0, [x19, 696]
	cmp	w0, 2
	bne	.L651
	mov	w1, 3
	add	x0, x29, 120
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 705]
	cbnz	w0, .L651
	strb	wzr, [x19, 1529]
	add	x0, x29, 120
	bl	BsPos
	mov	w20, w0
	ldr	x0, .LC126
	ldr	x4, [x0]
	cbz	x4, .L664
	ldr	w0, [x19, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 22
	blr	x4
.L664:
	ldr	x2, .LC130
	mov	w1, 1366
	mov	w0, 1
	bl	dprint_normal
	mov	w0, w20
	b	.L635
.L654:
	ldrb	w0, [x19, 696]
	cmp	w0, 3
	bne	.L657
	ldrb	w0, [x19, 884]
	cbz	w0, .L657
	mov	x28, 500
	mov	w25, 0
	movk	x28, 0x19d, lsl 32
	b	.L661
.L658:
	ldr	x0, [x20, 21296]
	mov	w1, 1
	cmp	x0, x28
	beq	.L659
	add	x0, x29, 120
	bl	BsSkip
.L659:
	add	x0, x29, 120
	bl	bs_get_spritetrajectory
	mov	w2, w0
	cbnz	w0, .L730
.L660:
	mov	w1, 1
	add	x0, x29, 120
	bl	BsSkip
	add	x0, x20, x25, uxtw 3
	add	w25, w25, 1
	add	x0, x0, 20480
	str	w27, [x0, 732]
	str	w26, [x0, 736]
	ldrb	w0, [x19, 884]
	cmp	w0, w25
	bls	.L657
.L661:
	add	x0, x29, 120
	mov	w27, 0
	mov	w26, 0
	bl	bs_get_spritetrajectory
	mov	w2, w0
	cbz	w0, .L658
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
	cbnz	w0, .L658
	neg	w27, w1
	b	.L658
.L730:
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
	cbnz	w0, .L660
	neg	w26, w1
	b	.L660
.L727:
	ldr	w0, [x20, 15764]
	ldr	w1, [x20, 15760]
	lsl	w0, w0, 3
	strb	wzr, [x20, 1251]
	str	w0, [x20, 1256]
	str	w1, [x20, 1264]
	b	.L666
.L729:
	strb	wzr, [x19, 1529]
	add	x0, x29, 120
	bl	BsPos
	mov	w20, w0
	ldr	x0, .LC126
	ldr	x4, [x0]
	cbz	x4, .L663
	ldr	w0, [x19, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 22
	blr	x4
.L663:
	ldrb	w3, [x19, 696]
	mov	w1, 1352
	ldr	x2, .LC128
	mov	w0, 1
	bl	dprint_normal
	mov	w0, w20
	b	.L635
	.size	Mp4_Syntax_Vop, .-Mp4_Syntax_Vop
	.align	3
.LC117:
	.xword	.LC110
	.align	3
.LC118:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC120:
	.xword	.LC119
	.align	3
.LC122:
	.xword	.LC121
	.align	3
.LC124:
	.xword	.LC123
	.align	3
.LC125:
	.xword	.LC40
	.align	3
.LC126:
	.xword	g_EventReportFunc
	.align	3
.LC128:
	.xword	.LC127
	.align	3
.LC130:
	.xword	.LC129
	.align	3
.LC131:
	.xword	.LC115
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
	mov	x20, x0
	mov	x0, x30
	mov	x22, x1
	mov	w21, w2
	bl	_mcount
	ldr	w19, [x20, 15580]
	sub	w0, w19, #1
	cmp	w0, 510
	bls	.L732
	add	x21, x20, 20480
	add	x19, x20, 12288
	add	x23, x20, 16384
	add	x1, x19, 3368
	ldr	w0, [x21, 2768]
	bl	MP4_ClearCurPacket
	ldr	w22, [x21, 2768]
	ldr	w0, [x23, 3548]
	cmp	w0, wzr
	ble	.L736
	sub	w21, w0, #1
	add	x19, x19, 3548
	add	x21, x21, 3960
	add	x21, x20, x21, lsl 2
	.p2align 2
.L735:
	ldr	w1, [x19], 4
	mov	w0, w22
	bl	SM_ReleaseStreamSeg
	cmp	x19, x21
	bne	.L735
.L736:
	ldr	w1, [x23, 3552]
	mov	w0, -435
	str	wzr, [x23, 3548]
	and	w0, w1, w0
	str	w0, [x23, 3552]
	ldr	x3, .LC132
	mov	w1, 3367
	ldr	x2, .LC134
	mov	w0, 1
	ldr	w4, [x20, 15580]
	add	x3, x3, 1312
	bl	dprint_normal
	mov	w0, 0
.L755:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L732:
	add	x25, x20, 12288
	add	w0, w19, 1
	str	w0, [x20, 15580]
	mov	x1, x22
	mov	w2, w21
	add	x0, x29, 88
	ldrh	w22, [x25, 3544]
	add	x24, x20, 20480
	bl	BsInit
	ubfx	x22, x22, 7, 4
	add	x0, x29, 88
	add	w22, w22, 17
	mov	w1, w22
	bl	BsSkip
	ldr	w22, [x24, 772]
	ldr	w0, [x24, 776]
	add	w22, w22, 15
	add	w0, w0, 15
	lsr	w22, w22, 4
	lsr	w0, w0, 4
	mul	w22, w0, w22
	cbz	w22, .L737
	mov	w0, w22
	mov	w1, 0
	.p2align 2
.L738:
	add	w1, w1, 1
	lsr	w0, w0, 1
	sxth	w1, w1
	cbnz	w0, .L738
	add	x0, x29, 88
	uxtw	x19, w19
	bl	BsGet
	lsl	x1, x19, 3
	sub	w2, w22, #1
	sub	x1, x1, x19
	cmp	w0, w2
	add	x1, x20, x1, lsl 2
	str	w0, [x1, 1268]
	bhi	.L756
.L739:
	lsl	x22, x19, 3
	mov	w1, 5
	sub	x22, x22, x19
	add	x0, x29, 88
	add	x22, x20, x22, lsl 2
	bl	BsGet
	mov	w1, 1
	strb	w0, [x22, 1249]
	add	x0, x29, 88
	bl	BsGet
	cbz	w0, .L740
	lsl	w21, w21, 3
	.p2align 2
.L741:
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w22, w0
	add	x0, x29, 88
	bl	BsPos
	cmp	w22, wzr
	ccmp	w0, w21, 0, ne
	blt	.L741
	mov	w1, 1
	add	x23, x20, 16384
	add	x0, x29, 88
	bl	BsSkip
	ldr	w1, [x23, 3652]
	cbnz	w1, .L757
.L742:
	mov	w1, 1
	add	x0, x29, 88
	lsl	x22, x19, 3
	sub	x22, x22, x19
	bl	BsSkip
	mov	w1, 2
	add	x0, x29, 88
	add	x22, x20, x22, lsl 2
	bl	BsGet
	mov	w1, 3
	strb	w0, [x22, 1248]
	add	x0, x29, 88
	bl	BsGet
	strb	w0, [x22, 1247]
	ldrb	w1, [x22, 1248]
	cbnz	w1, .L758
.L743:
	lsl	x22, x19, 3
	ldrb	w1, [x24, 704]
	sub	x22, x22, x19
	add	x0, x29, 88
	add	x22, x20, x22, lsl 2
	strb	w1, [x22, 1245]
	ldrb	w1, [x24, 705]
	strb	w1, [x22, 1246]
	ldr	w1, [x23, 3552]
	orr	w1, w1, 16
	str	w1, [x23, 3552]
	bl	BsPos
	mov	w23, w0
	asr	w0, w0, 31
	sub	w21, w21, w23
	lsr	w0, w0, 29
	str	w21, [x22, 1252]
	add	w1, w23, w0
	add	w2, w23, 7
	ldr	w3, [x24, 1552]
	and	w1, w1, 7
	sub	w0, w1, w0
	cmp	w23, wzr
	add	w0, w3, w0
	strb	w0, [x22, 1250]
	csel	w0, w2, w23, lt
	ldr	w1, [x24, 1544]
	add	w0, w1, w0, asr 3
	str	w0, [x22, 1260]
	ldrb	w0, [x25, 3378]
	cbnz	w0, .L744
	ldrb	w0, [x25, 3466]
	cmp	w0, 1
	beq	.L759
.L744:
	lsl	x0, x19, 3
	sub	x19, x0, x19
	add	x19, x20, x19, lsl 2
	strb	wzr, [x19, 1251]
	str	wzr, [x19, 1256]
	str	wzr, [x19, 1264]
.L745:
	mov	x0, x20
	bl	MP4_Record_SlcSegID
	ldr	x25, [sp, 64]
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L740:
	ldrb	w0, [x24, 696]
	lsl	w21, w21, 3
	strb	w0, [x22, 1248]
	add	x23, x20, 16384
	ldrb	w0, [x24, 700]
	strb	w0, [x22, 1247]
	b	.L743
	.p2align 3
.L758:
	mov	w1, 3
	add	x0, x29, 88
	bl	BsSkip
	ldrb	w0, [x22, 1248]
	cmp	w0, 2
	bne	.L743
	mov	w1, 3
	add	x0, x29, 88
	bl	BsSkip
	b	.L743
	.p2align 3
.L757:
	add	x0, x29, 88
	bl	BsSkip
	b	.L742
	.p2align 3
.L759:
	ldr	w0, [x20, 15764]
	strb	wzr, [x22, 1251]
	lsl	w0, w0, 3
	str	w0, [x22, 1256]
	ldr	w0, [x20, 15760]
	str	w0, [x22, 1264]
	b	.L745
.L737:
	mov	w1, 0
	add	x0, x29, 88
	uxtw	x19, w19
	bl	BsGet
	lsl	x1, x19, 3
	sub	x1, x1, x19
	add	x1, x20, x1, lsl 2
	str	w0, [x1, 1268]
	b	.L739
.L756:
	ldr	x2, .LC136
	mov	w3, w0
	mov	w4, w22
	mov	w1, 3389
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L755
	.size	Mp4_Syntax_Slice_NotSH, .-Mp4_Syntax_Slice_NotSH
	.align	3
.LC132:
	.xword	.LANCHOR1
	.align	3
.LC134:
	.xword	.LC133
	.align	3
.LC136:
	.xword	.LC135
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
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	mov	w22, w2
	bl	_mcount
	ldr	w3, [x20, 15580]
	sub	w26, w3, #1
	cmp	w26, 510
	bls	.L761
	add	x21, x20, 20480
	add	x19, x20, 12288
	add	x23, x20, 16384
	add	x1, x19, 3368
	ldr	w0, [x21, 2768]
	bl	MP4_ClearCurPacket
	ldr	w22, [x21, 2768]
	ldr	w0, [x23, 3548]
	cmp	w0, wzr
	ble	.L765
	sub	w21, w0, #1
	add	x19, x19, 3548
	add	x21, x21, 3960
	add	x21, x20, x21, lsl 2
	.p2align 2
.L764:
	ldr	w1, [x19], 4
	mov	w0, w22
	bl	SM_ReleaseStreamSeg
	cmp	x19, x21
	bne	.L764
.L765:
	ldr	w1, [x23, 3552]
	mov	w0, -435
	str	wzr, [x23, 3548]
	and	w0, w1, w0
	str	w0, [x23, 3552]
	ldr	x3, .LC137
	mov	w1, 3481
	ldr	x2, .LC138
	mov	w0, 1
	ldr	w4, [x20, 15580]
	add	x3, x3, 1336
	bl	dprint_normal
	mov	w0, 0
.L763:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L761:
	add	x24, x20, 12288
	add	w0, w3, 1
	str	w0, [x20, 15580]
	mov	x1, x19
	mov	w2, w22
	add	x0, x29, 88
	ldrb	w19, [x24, 3544]
	uxtw	x25, w3
	bl	BsInit
	add	x23, x20, 20480
	ubfx	x19, x19, 3, 4
	add	x0, x29, 88
	add	w19, w19, 17
	mov	w1, w19
	lsl	x19, x25, 3
	sub	x19, x19, x25
	bl	BsSkip
	mov	w1, 5
	add	x0, x29, 88
	add	x19, x20, x19, lsl 2
	bl	BsGet
	ldrb	w3, [x23, 708]
	mul	w0, w3, w0
	str	w0, [x19, 1268]
	ldrh	w1, [x20, 1202]
	ldrh	w4, [x20, 1200]
	mul	w4, w1, w4
	sub	w4, w4, #1
	cmp	w0, w4
	bhi	.L778
	mov	w1, 2
	add	x0, x29, 88
	lsl	w22, w22, 3
	bl	BsSkip
	mov	w1, 5
	add	x0, x29, 88
	bl	BsGet
	strb	w0, [x19, 1249]
	add	x0, x29, 88
	ldrb	w1, [x23, 696]
	strb	w1, [x19, 1248]
	ldrb	w1, [x23, 700]
	strb	w1, [x19, 1247]
	ldrb	w1, [x23, 704]
	strb	w1, [x19, 1245]
	ldrb	w1, [x23, 705]
	strb	w1, [x19, 1246]
	bl	BsPos
	mov	w21, w0
	asr	w0, w0, 31
	sub	w22, w22, w21
	lsr	w0, w0, 29
	str	w22, [x19, 1252]
	add	w1, w21, w0
	add	w2, w21, 7
	ldr	w3, [x23, 1552]
	and	w1, w1, 7
	sub	w0, w1, w0
	cmp	w21, wzr
	add	w0, w3, w0
	strb	w0, [x19, 1250]
	csel	w0, w2, w21, lt
	add	x1, x20, 16384
	ldr	w2, [x23, 1544]
	add	w0, w2, w0, asr 3
	str	w0, [x19, 1260]
	ldr	w0, [x1, 3552]
	orr	w0, w0, 16
	str	w0, [x1, 3552]
	ldrb	w0, [x24, 3378]
	cbnz	w0, .L767
	ldrb	w0, [x24, 3466]
	cmp	w0, 1
	beq	.L779
.L767:
	lsl	x0, x25, 3
	sub	x0, x0, x25
	add	x0, x20, x0, lsl 2
	strb	wzr, [x0, 1251]
	str	wzr, [x0, 1256]
	str	wzr, [x0, 1264]
.L768:
	uxtw	x0, w26
	lsl	x1, x0, 3
	sub	x1, x1, x0
	add	x1, x20, x1, lsl 2
	ldr	w2, [x1, 1264]
	cbz	w2, .L769
	ldr	w2, [x1, 1256]
	cbnz	w2, .L780
.L769:
	lsl	x1, x0, 3
	ldrb	w2, [x24, 3544]
	sub	x0, x1, x0
	ubfx	x1, x2, 3, 4
	add	x0, x20, x0, lsl 2
	ldr	w2, [x0, 1252]
	add	w1, w2, w1
	str	w1, [x0, 1252]
.L770:
	mov	x0, x20
	bl	MP4_Record_SlcSegID
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L780:
	ldrb	w0, [x24, 3544]
	ubfx	x0, x0, 3, 4
	add	w2, w0, w2
	str	w2, [x1, 1256]
	b	.L770
	.p2align 3
.L779:
	ldr	w0, [x20, 15764]
	strb	wzr, [x19, 1251]
	lsl	w0, w0, 3
	str	w0, [x19, 1256]
	ldr	w0, [x20, 15760]
	str	w0, [x19, 1264]
	b	.L768
.L778:
	ldr	x2, .LC140
	mov	w3, w0
	mov	w1, 3503
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L763
	.size	Mp4_Syntax_Slice_SH, .-Mp4_Syntax_Slice_SH
	.align	3
.LC137:
	.xword	.LANCHOR1
	.align	3
.LC138:
	.xword	.LC133
	.align	3
.LC140:
	.xword	.LC139
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
	ldrb	w0, [x20, 3544]
	tbz	x0, 0, .L789
	tbz	x0, 2, .L790
.L787:
	mov	w2, w21
	mov	x1, x22
	mov	x0, x19
	bl	Mp4_Syntax_Slice_SH
	cmn	w0, #1
	beq	.L791
.L785:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L790:
	ldrh	w1, [x20, 3544]
	ubfx	x1, x1, 7, 4
	sub	w2, w1, #1
	cmp	w2, 6
	bhi	.L787
	bfi	w0, w1, 3, 4
	mov	w2, w21
	strb	w0, [x20, 3544]
	mov	x1, x22
	mov	x0, x19
	bl	Mp4_Syntax_Slice_SH
	cmn	w0, #1
	bne	.L785
.L791:
	add	x19, x19, 20480
	add	x1, x20, 3368
	ldr	w0, [x19, 2768]
	bl	MP4_ClearCurPacket
	ldr	x3, .LC141
	mov	w1, 3618
	ldr	x2, .LC143
	mov	w0, 1
	add	x3, x3, 1360
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L789:
	mov	x0, x19
	bl	Mp4_Check_Slice_NotSH
	cbz	w0, .L792
	mov	w1, w21
	mov	x0, x19
	bl	Mp4_Combine_SliceData
	cbz	w0, .L786
	add	x19, x19, 20480
	add	x1, x20, 3368
	ldr	w0, [x19, 2768]
	bl	MP4_ClearCurPacket
	ldr	x3, .LC141
	mov	w1, 3598
	ldr	x2, .LC143
	mov	w0, 1
	add	x3, x3, 1360
	bl	dprint_normal
	b	.L785
	.p2align 3
.L792:
	mov	w2, w21
	mov	x1, x22
	mov	x0, x19
	bl	Mp4_Syntax_Slice_NotSH
	cmn	w0, #1
	bne	.L785
	add	x19, x19, 20480
	add	x1, x20, 3368
	ldr	w0, [x19, 2768]
	bl	MP4_ClearCurPacket
	ldr	x3, .LC141
	mov	w1, 3588
	ldr	x2, .LC143
	mov	w0, 1
	add	x3, x3, 1360
	bl	dprint_normal
	b	.L785
	.p2align 3
.L786:
	mov	x0, x19
	bl	MP4_Record_SlcSegID
	b	.L785
	.size	MP4_Dec_Slice, .-MP4_Dec_Slice
	.align	3
.LC141:
	.xword	.LANCHOR1
	.align	3
.LC143:
	.xword	.LC142
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
	ldr	w1, [x20, 2044]
	cmp	w1, 62
	bgt	.L796
	add	x0, x19, x1, sxtw 2
	ldr	w4, [x19, 15680]
	add	x0, x0, 20480
	add	x3, x19, 12288
	add	w2, w1, 1
	str	w4, [x0, 1788]
	str	w2, [x20, 2044]
	ldrb	w2, [x3, 3378]
	cbnz	w2, .L793
	ldrb	w2, [x3, 3466]
	cmp	w2, 1
	beq	.L797
.L793:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L796:
	mov	x0, x19
	bl	MP4_Clean_HeadPacket
	ldr	w0, [x20, 2768]
	add	x1, x19, 12288
	add	x1, x1, 3368
	bl	MP4_ClearCurPacket
	ldr	w3, [x20, 2044]
	mov	w4, 62
	ldr	x2, .LC144
	mov	w1, 3765
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L797:
	ldr	w2, [x19, 15768]
	add	w1, w1, 2
	str	w2, [x0, 1792]
	str	w1, [x20, 2044]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP4_Record_PacketID, .-MP4_Record_PacketID
	.align	3
.LC144:
	.xword	.LC108
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
	cbz	x21, .L802
	ldr	x22, .LC147
	add	x19, x21, 20480
	add	x20, x21, 12288
	mov	x2, 176
	add	x1, x20, 3368
	add	x0, x19, 1608
	ldr	x3, [x22, 104]
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 4
	add	x1, x20, 3544
	add	x0, x19, 1784
	blr	x3
	str	w23, [x19, 2048]
	ldr	w0, [x19, 2052]
	cbz	w0, .L803
.L801:
	ldr	w0, [x19, 2056]
	add	w0, w0, 1
	str	w0, [x19, 2056]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L803:
	mov	x0, x21
	bl	MP4_Record_PacketID
	mov	w0, 1
	str	w0, [x19, 2052]
	b	.L801
	.p2align 3
.L802:
	ldr	x2, .LC146
	mov	w1, 3658
	mov	w0, 1
	bl	dprint_normal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	MP4_Record_HeadPacketInfo, .-MP4_Record_HeadPacketInfo
	.align	3
.LC146:
	.xword	.LC145
	.align	3
.LC147:
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
	mov	x23, x0
	mov	x0, x30
	mov	x24, x1
	mov	w25, w2
	bl	_mcount
	ldr	x26, .LC148
	mov	x2, 40
	mov	w1, 0
	add	x0, x29, 112
	add	x22, x23, 16384
	ldr	x3, [x26, 96]
	blr	x3
	mov	w2, w25
	mov	x1, x24
	add	x0, x29, 112
	bl	BsInit
	mov	w1, 32
	add	x0, x29, 112
	bl	BsShow
	str	wzr, [x22, 3556]
	cmp	w0, 510
	mov	w20, w0
	beq	.L936
	add	x27, x23, 12288
	ldrb	w0, [x27, 3544]
	tbz	x0, 0, .L937
.L810:
	add	x19, x23, 20480
	mov	w1, 1
	mov	w20, 196
	strb	w1, [x19, 765]
.L811:
	tbnz	x0, 1, .L812
	ldr	w0, [x22, 3552]
	mov	w21, 130
	ands	w21, w0, w21
	bne	.L938
	cmp	w20, 197
	beq	.L939
	cmp	w20, 432
	beq	.L940
	cmp	w20, 437
	beq	.L941
	and	w0, w20, -16
	cmp	w0, 288
	beq	.L942
	cmp	w20, 435
	beq	.L943
	cmp	w20, 438
	beq	.L944
	cmp	w20, 196
	beq	.L945
	cmp	w20, 434
	beq	.L946
	cmp	w20, 286
	bne	.L827
	ldr	x28, .LC149
	ldr	x4, [x28]
	cbz	x4, .L828
	ldr	w0, [x19, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 41
	blr	x4
.L828:
	ldr	w0, [x19, 2768]
	add	x1, x27, 3368
	add	x21, x24, 4
	sub	w25, w25, #4
	bl	MP4_ClearCurPacket
	ldr	w0, [x22, 3552]
	tbz	x0, 1, .L829
	orr	w0, w0, 256
	str	w0, [x22, 3552]
.L829:
	ldr	w1, [x22, 3552]
	mov	w0, 18
	and	w0, w1, w0
	cmp	w0, 18
	beq	.L830
	ldr	x4, [x28]
	cbz	x4, .L830
	ldr	w0, [x19, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 60
	blr	x4
.L830:
	ldrb	w0, [x19, 2805]
	mov	w28, 0
	cmp	w0, 1
	beq	.L860
.L836:
	ldrb	w0, [x19, 1527]
	mov	w21, w28
	cmp	w0, 1
	bne	.L910
	ldr	w0, [x19, 2064]
	mov	x2, 604
	ldr	x3, [x26, 104]
	add	x1, x22, 3584
	add	w0, w0, 1
	str	wzr, [x19, 2068]
	str	w0, [x19, 2064]
	add	x0, x19, 860
	blr	x3
	ldr	w0, [x19, 772]
	ldr	w2, [x22, 3668]
	cmp	w0, w2
	beq	.L947
.L851:
	ldrsw	x0, [x19, 2768]
	ldr	x20, .LC170
	lsl	x1, x0, 2
	sub	x1, x1, x0
	lsl	x3, x1, 5
	add	x1, x1, x3
	add	x0, x1, x0
	add	x20, x20, x0
	ldr	w0, [x20, 64]
	cbz	w0, .L948
.L853:
	ldr	x0, .LC149
	ldr	x4, [x0]
	cbz	x4, .L854
	ldr	w0, [x19, 772]
	ldr	w3, [x19, 776]
	ldr	w1, [x22, 3664]
	strh	w0, [x29, 106]
	ldr	w0, [x19, 2768]
	strh	w2, [x29, 110]
	add	x2, x29, 104
	strh	w3, [x29, 104]
	mov	w3, 8
	strh	w1, [x29, 108]
	mov	w1, 1
	blr	x4
	ldr	w2, [x22, 3668]
.L854:
	str	w2, [x19, 772]
	ldr	w0, [x22, 3664]
	str	w0, [x19, 776]
.L855:
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2788]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L857
	ldr	w0, [x19, 2768]
	ldr	x1, [x20, 168]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2768]
	ldr	x1, [x20, 176]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2768]
	ldr	x1, [x20, 184]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2768]
	ldr	x1, [x20, 192]
	bl	FreeUsdByDec
	stp	xzr, xzr, [x20, 168]
	stp	xzr, xzr, [x20, 184]
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2788]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2780]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 2768]
	bl	FSP_GetNullLogicFs
	str	w0, [x19, 2780]
	str	w0, [x19, 2788]
.L857:
	ldr	w0, [x19, 2768]
	add	x1, x19, 2160
	str	wzr, [x19, 2776]
	bl	FSP_ClearNotInVoQueue
	ldr	w2, [x19, 772]
	mov	x0, x23
	ldr	w1, [x19, 776]
	bl	MP4_FrameInit
	cbz	w0, .L856
	ldr	x2, .LC176
	mov	w1, 2101
	mov	w0, 0
	bl	dprint_normal
	b	.L856
	.p2align 3
.L938:
	orr	w0, w0, 32
	mov	w1, 1
	mov	w21, 0
	str	w0, [x22, 3552]
	str	w1, [x22, 3556]
.L910:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L812:
	mov	w2, w25
	mov	x1, x24
	mov	x0, x23
	bl	MP4_Dec_Slice
	mov	w28, w0
.L816:
	ldrb	w0, [x19, 2805]
	mov	x21, x24
	cmp	w0, 1
	beq	.L860
	cmp	w28, w25, lsl 3
	bhi	.L835
.L954:
	mov	w0, 196
	cmp	w20, 438
	ccmp	w20, w0, 4, ne
	bne	.L836
	ldr	w1, [x22, 3552]
	mov	w0, 130
	tst	w1, w0
	beq	.L836
	ldrb	w0, [x19, 765]
	cmp	w0, 2
	beq	.L949
	ldr	w1, [x19, 772]
	ldr	w0, [x19, 776]
	str	w0, [x19, 2092]
	str	w1, [x19, 2096]
	cbz	w0, .L840
	ldr	w2, [x19, 2084]
	mov	w22, 1
	cmp	w0, w2
	beq	.L840
.L841:
	ldrsw	x0, [x19, 2768]
	ldr	x20, .LC170
	lsl	x1, x0, 2
	sub	x1, x1, x0
	lsl	x2, x1, 5
	add	x1, x1, x2
	add	x0, x1, x0
	add	x20, x20, x0
	ldr	w0, [x20, 64]
	cbz	w0, .L950
.L846:
	ldr	x0, .LC149
	ldr	x4, [x0]
	cbz	x4, .L845
	ldr	w0, [x19, 2088]
	mov	w3, 8
	ldr	w1, [x19, 2084]
	add	x2, x29, 104
	strh	w0, [x29, 106]
	ldr	w0, [x19, 2096]
	strh	w1, [x29, 104]
	strh	w0, [x29, 110]
	ldr	w1, [x19, 2092]
	ldr	w0, [x19, 2768]
	strh	w1, [x29, 108]
	mov	w1, 1
	blr	x4
.L845:
	cbnz	w22, .L951
.L848:
	ldr	w1, [x19, 2092]
	ldr	w0, [x19, 2096]
	str	w1, [x19, 2084]
	str	w0, [x19, 2088]
.L839:
	ldr	x3, [x26, 104]
	add	x1, x19, 696
	mov	x2, 60
	add	x0, x19, 1464
	sub	x21, x21, x24
	blr	x3
	ldr	x2, .LC174
	mov	w1, 2057
	mov	w0, 3
	add	w21, w28, w21, lsl 3
	bl	dprint_normal
	ldr	w0, [x19, 2068]
	add	w0, w0, 1
	str	w0, [x19, 2068]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L937:
	add	x19, x23, 20480
	mov	w1, 2
	strb	w1, [x19, 765]
	lsr	w1, w20, 8
	sub	w1, w1, #128
	cmp	w1, 3
	bhi	.L811
	ldrb	w0, [x27, 3544]
	orr	w0, w0, 2
	strb	w0, [x27, 3544]
	uxtb	w0, w0
	b	.L811
	.p2align 3
.L840:
	cbz	w1, .L842
	ldr	w2, [x19, 2088]
	cmp	w1, w2
	beq	.L952
	mov	w22, 1
	cbz	w0, .L841
	ldr	w2, [x19, 2084]
	cmp	w0, w2
	bne	.L841
.L861:
	ldr	w0, [x19, 2088]
	cmp	w0, w1
	beq	.L845
	b	.L841
	.p2align 3
.L860:
	ldr	w1, [x22, 3664]
	cbz	w1, .L833
	ldr	w2, [x22, 3668]
	cbnz	w2, .L953
.L833:
	strb	wzr, [x19, 2805]
.L956:
	cmp	w28, w25, lsl 3
	bls	.L954
.L835:
	ldr	x2, .LC178
	mov	w1, 2122
	mov	w0, 3
	sub	x21, x21, x24
	lsl	w21, w21, 3
	bl	dprint_normal
	ldr	w1, [x22, 3552]
	mov	w0, -435
	and	w0, w1, w0
	str	w0, [x22, 3552]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L936:
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
	bne	.L806
	ldr	x1, .LC149
	add	x19, x23, 20480
	mov	w0, 1
	ldr	x4, [x1]
	strb	w0, [x19, 2804]
	cbz	x4, .L807
	ldr	w0, [x19, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 46
	blr	x4
.L807:
	ldr	w0, [x22, 3552]
	mov	w1, 130
	tst	w0, w1
	beq	.L808
	orr	w0, w0, 32
	mov	w1, 1
	str	w0, [x22, 3552]
	str	w1, [x22, 3556]
.L808:
	add	x1, x23, 12288
	ldr	w0, [x19, 2768]
	add	x1, x1, 3368
	mov	w21, 0
	bl	MP4_ClearCurPacket
	b	.L910
	.p2align 3
.L806:
	add	x27, x23, 12288
	ldrb	w0, [x27, 3544]
	tbnz	x0, 0, .L810
	add	x19, x23, 20480
	mov	w1, 2
	strb	w1, [x19, 765]
	b	.L811
	.p2align 3
.L827:
	ldr	w0, [x19, 2768]
	add	x1, x27, 3368
	add	x21, x24, 4
	sub	w25, w25, #4
	bl	MP4_ClearCurPacket
	b	.L830
	.p2align 3
.L940:
	ldr	x2, .LC153
	mov	w1, 1864
	mov	w0, 3
	bl	dprint_normal
	str	wzr, [x19, 2100]
	mov	x1, x24
	mov	w2, w25
	mov	x0, x23
	bl	Mp4_Syntax_Vos
	mov	w28, w0
	mov	w1, w20
	mov	x0, x23
	bl	MP4_Record_HeadPacketInfo
	b	.L816
	.p2align 3
.L944:
	ldr	x2, .LC161
	mov	w1, 1905
	mov	w0, 3
	bl	dprint_normal
	cmp	w25, 4
	beq	.L955
	mov	w2, w25
	mov	x1, x24
	mov	x0, x23
	bl	Mp4_Syntax_Vop
	mov	w28, w0
	ldr	w0, [x22, 3552]
	tbnz	x0, 1, .L823
	ldr	w0, [x19, 2768]
	add	x1, x27, 3368
	bl	MP4_ClearCurPacket
.L822:
	ldr	x2, .LC163
	mov	w3, w28
	mov	w1, 1926
	mov	w0, 8
	bl	dprint_normal
	b	.L816
	.p2align 3
.L842:
	ldr	w2, [x19, 2772]
	cmp	w2, 1
	cset	w22, ne
	cbz	w0, .L845
.L862:
	ldr	w2, [x19, 2084]
	cmp	w0, w2
	bne	.L841
	cbnz	w1, .L861
	b	.L845
	.p2align 3
.L953:
	mov	x0, x23
	bl	MP4_FrameInit
	cbz	w0, .L833
	ldr	x2, .LC169
	mov	w1, 1988
	mov	w0, 0
	bl	dprint_normal
	strb	wzr, [x19, 2805]
	b	.L956
	.p2align 3
.L947:
	ldr	w1, [x19, 776]
	ldr	w0, [x22, 3664]
	cmp	w1, w0
	bne	.L851
	ldr	w0, [x19, 2772]
	cmp	w0, 1
	bne	.L855
.L856:
	ldr	w0, [x19, 772]
	mov	w21, w28
	ldr	w1, [x19, 776]
	str	w1, [x19, 2084]
	str	w0, [x19, 2088]
	ldr	w0, [x22, 3668]
	str	w0, [x19, 772]
	ldr	w0, [x22, 3664]
	str	w0, [x19, 776]
	strb	wzr, [x19, 1527]
	b	.L910
	.p2align 3
.L948:
	ldr	x0, [x26]
	mov	w1, 1
	str	w1, [x20, 64]
	blr	x0
	str	w0, [x20, 68]
	ldr	w2, [x22, 3668]
	b	.L853
	.p2align 3
.L941:
	ldr	x2, .LC155
	mov	w1, 1872
	mov	w0, 3
	bl	dprint_normal
	mov	w0, 1
	mov	x1, x24
	str	w0, [x19, 2100]
	mov	w2, w25
	mov	x0, x23
	bl	Mp4_Syntax_Vo
	mov	w28, w0
	mov	w1, w20
	mov	x0, x23
	bl	MP4_Record_HeadPacketInfo
	b	.L816
	.p2align 3
.L942:
	ldr	x2, .LC157
	mov	w1, 1880
	mov	w0, 3
	bl	dprint_normal
	mov	w0, 2
	mov	w2, w25
	mov	x1, x24
	str	w0, [x19, 2100]
	mov	x0, x23
	bl	Mp4_Syntax_Vol
	mov	w28, w0
	mov	w1, w20
	mov	x0, x23
	bl	MP4_Record_HeadPacketInfo
	ldrb	w0, [x19, 1527]
	cmp	w0, 1
	beq	.L816
	ldrb	w21, [x19, 1528]
	cmp	w21, 1
	bne	.L816
	ldr	x3, [x26, 104]
	mov	x2, 604
	add	x1, x19, 92
	add	x0, x22, 3584
	blr	x3
	strb	w21, [x19, 1527]
	strb	w21, [x19, 757]
	b	.L816
	.p2align 3
.L939:
	ldr	x2, .LC151
	mov	w1, 1857
	mov	w0, 3
	bl	dprint_normal
	ldr	w0, [x19, 2768]
	add	x1, x27, 3368
	bl	MP4_ClearCurPacket
	b	.L910
	.p2align 3
.L943:
	ldr	x2, .LC159
	mov	w1, 1897
	mov	w0, 3
	bl	dprint_normal
	mov	w0, 3
	mov	x1, x24
	str	w0, [x19, 2100]
	mov	w2, w25
	mov	x0, x23
	bl	Mp4_Syntax_Gop
	mov	w28, w0
	mov	w1, w20
	mov	x0, x23
	bl	MP4_Record_HeadPacketInfo
	b	.L816
	.p2align 3
.L949:
	ldrb	w0, [x19, 696]
	cmp	w0, 2
	beq	.L838
	ldr	w0, [x19, 788]
	ldr	w1, [x19, 780]
	str	w0, [x19, 792]
	add	w1, w0, w1
	str	w1, [x19, 788]
	ldr	w3, [x19, 784]
	ldr	w0, [x22, 3656]
	ldr	w2, [x19, 800]
	madd	w0, w1, w0, w3
	str	w0, [x19, 796]
	str	w0, [x19, 800]
	sub	w0, w0, w2
	str	w0, [x19, 804]
	b	.L839
	.p2align 3
.L945:
	ldr	x2, .LC165
	mov	w1, 1930
	mov	w0, 3
	bl	dprint_normal
	mov	w2, w25
	mov	x1, x24
	mov	x0, x23
	bl	Mp4_Syntax_ShortHeader
	mov	w28, w0
	ldr	w0, [x22, 3552]
	tbz	x0, 1, .L933
	mov	w1, 196
	mov	x0, x23
	bl	MP4_Record_HeadPacketInfo
	b	.L816
	.p2align 3
.L946:
	ldr	x2, .LC167
	mov	w1, 1945
	mov	w0, 3
	bl	dprint_normal
	mov	w2, w25
	mov	x1, x24
	mov	x0, x23
	bl	Mp4_Syntax_UserData
	mov	w28, w0
.L933:
	ldr	w0, [x19, 2768]
	add	x1, x27, 3368
	bl	MP4_ClearCurPacket
	b	.L816
	.p2align 3
.L950:
	ldr	x0, [x26]
	mov	w1, 1
	str	w1, [x20, 64]
	blr	x0
	str	w0, [x20, 68]
	b	.L846
	.p2align 3
.L951:
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2788]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L849
	ldr	w0, [x19, 2768]
	ldr	x1, [x20, 168]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2768]
	ldr	x1, [x20, 176]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2768]
	ldr	x1, [x20, 184]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2768]
	ldr	x1, [x20, 192]
	bl	FreeUsdByDec
	stp	xzr, xzr, [x20, 168]
	stp	xzr, xzr, [x20, 184]
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2788]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2780]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 2768]
	bl	FSP_GetNullLogicFs
	str	w0, [x19, 2780]
	str	w0, [x19, 2788]
.L849:
	ldr	w0, [x19, 2768]
	add	x1, x19, 2160
	str	wzr, [x19, 2776]
	bl	FSP_ClearNotInVoQueue
	ldr	w1, [x19, 2092]
	mov	x0, x23
	ldr	w2, [x19, 2096]
	bl	MP4_FrameInit
	cbz	w0, .L848
	ldr	x2, .LC172
	mov	w1, 2047
	mov	w0, 0
	bl	dprint_normal
	b	.L848
.L823:
	mov	w1, 438
	mov	x0, x23
	bl	MP4_Record_HeadPacketInfo
	b	.L822
.L838:
	ldr	w2, [x19, 792]
	ldr	w1, [x19, 780]
	ldr	w0, [x22, 3656]
	ldr	w4, [x19, 784]
	add	w1, w2, w1
	ldr	w3, [x19, 800]
	ldr	w2, [x19, 804]
	madd	w0, w1, w0, w4
	sub	w1, w2, w3
	str	w0, [x19, 796]
	add	w0, w1, w0
	str	w0, [x19, 808]
	b	.L839
.L955:
	mov	w1, w20
	mov	x0, x23
	mov	w28, 0
	bl	MP4_Record_HeadPacketInfo
	b	.L822
.L952:
	ldr	w2, [x19, 2772]
	cmp	w2, 1
	cset	w22, ne
	cbnz	w0, .L862
	cbnz	w1, .L861
	b	.L845
	.size	Mp4_Syntax_Parse, .-Mp4_Syntax_Parse
	.align	3
.LC148:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC149:
	.xword	g_EventReportFunc
	.align	3
.LC151:
	.xword	.LC150
	.align	3
.LC153:
	.xword	.LC152
	.align	3
.LC155:
	.xword	.LC154
	.align	3
.LC157:
	.xword	.LC156
	.align	3
.LC159:
	.xword	.LC158
	.align	3
.LC161:
	.xword	.LC160
	.align	3
.LC163:
	.xword	.LC162
	.align	3
.LC165:
	.xword	.LC164
	.align	3
.LC167:
	.xword	.LC166
	.align	3
.LC169:
	.xword	.LC168
	.align	3
.LC170:
	.xword	g_VfmwChanStat
	.align	3
.LC172:
	.xword	.LC171
	.align	3
.LC174:
	.xword	.LC173
	.align	3
.LC176:
	.xword	.LC175
	.align	3
.LC178:
	.xword	.LC177
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
	ldr	x1, [x19, 22088]
	add	x0, x19, 20480
	add	x20, x0, 1608
	cbz	x1, .L970
	add	x1, x19, 12288
	ldrb	w2, [x1, 3378]
	cmp	w2, 1
	beq	.L971
	cbnz	w2, .L965
	ldrb	w2, [x1, 3466]
	cmp	w2, 1
	bne	.L965
	ldr	x4, .LC182
	mov	x2, 88
	ldr	w3, [x19, 15676]
	add	x1, x1, 3456
	ldr	w5, [x20, 20]
	add	x0, x0, 1696
	ldr	x4, [x4, 104]
	add	w3, w5, w3
	str	w3, [x20, 20]
	blr	x4
	mov	w0, 0
.L960:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L971:
	ldrb	w21, [x20, 10]
	cmp	w21, 1
	beq	.L972
	cbnz	w21, .L964
	ldrb	w0, [x20, 98]
	cmp	w0, 1
	bne	.L964
	ldr	w1, [x19, 15676]
	mov	w0, 0
	ldr	w2, [x20, 108]
	add	w1, w2, w1
	str	w1, [x20, 108]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L965:
	mov	w3, 3831
.L969:
	ldr	x2, .LC183
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L972:
	ldr	w3, [x19, 15672]
	ldr	w2, [x20, 16]
	cmp	w3, w2
	bcc	.L973
	ldr	w1, [x19, 15676]
	mov	w0, 0
	ldr	w2, [x20, 20]
	add	w1, w2, w1
	str	w1, [x20, 20]
	b	.L960
	.p2align 3
.L964:
	mov	w3, 3818
	b	.L969
	.p2align 3
.L973:
	ldr	x3, .LC182
	mov	x2, 88
	add	x1, x1, 3368
	add	x0, x0, 1696
	ldr	x3, [x3, 104]
	blr	x3
	strb	wzr, [x20, 10]
	strb	w21, [x20, 98]
	mov	w0, 0
	b	.L960
.L970:
	ldr	x1, .LC179
	ldr	x4, [x1]
	cbz	x4, .L959
	ldr	w0, [x0, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 22
	blr	x4
.L959:
	ldr	x2, .LC181
	mov	w1, 3791
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L960
	.size	MP4_Combine_HdPacket, .-MP4_Combine_HdPacket
	.align	3
.LC179:
	.xword	g_EventReportFunc
	.align	3
.LC181:
	.xword	.LC180
	.align	3
.LC182:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC183:
	.xword	.LC94
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
	beq	.L977
	mov	x0, x20
	add	x20, x20, 20480
	add	x19, x0, 12288
	bl	MP4_Record_PacketID
	ldr	x21, .LC186
	mov	x2, 176
	add	x1, x20, 1608
	add	x0, x19, 3368
	ldr	x3, [x21, 104]
	blr	x3
	ldr	x3, [x21, 104]
	mov	x2, 4
	add	x1, x20, 1784
	add	x0, x19, 3448
	blr	x3
	mov	w0, 0
.L976:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L977:
	add	x0, x20, 20480
	add	x1, x20, 12288
	add	x1, x1, 3368
	ldr	w0, [x0, 2768]
	bl	MP4_ClearCurPacket
	mov	w3, 3846
	ldr	x2, .LC185
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w0, w19
	b	.L976
	.size	MP4_Renew_CurPacket, .-MP4_Renew_CurPacket
	.align	3
.LC185:
	.xword	.LC184
	.align	3
.LC186:
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
	ldr	w1, [x20, 3384]
	str	w1, [x21, 1544]
	ldr	x1, [x19, 15656]
	str	x1, [x19, 22016]
	ldr	w2, [x20, 3388]
	str	w2, [x21, 1548]
	str	wzr, [x21, 1552]
	bl	BsInit
	mov	w1, 32
	add	x0, x29, 56
	bl	BsShow
	ldrb	w1, [x20, 3544]
	tbz	x1, 0, .L1006
	mov	w0, 1
	strb	w0, [x21, 765]
	ldrb	w0, [x20, 3544]
	tbnz	x0, 1, .L981
	ldr	w2, [x21, 2048]
	mov	w1, 196
.L985:
	mov	w0, 438
	cmp	w1, w0
	ccmp	w2, w0, 0, eq
	beq	.L1004
	mov	w0, 196
	cmp	w1, w0
	ccmp	w2, w0, 0, eq
	beq	.L1004
.L1003:
	mov	w0, 0
	b	.L989
	.p2align 3
.L1006:
	lsr	w1, w0, 8
	mov	w2, 2
	sub	w1, w1, #128
	strb	w2, [x21, 765]
	cmp	w1, 3
	mov	w1, w0
	bls	.L1007
.L980:
	ldrb	w2, [x20, 3544]
	tbz	x2, 1, .L1008
	ldr	w2, [x21, 2048]
	cmp	w0, 196
	cset	w1, eq
	cmp	w2, 438
	cset	w0, eq
	orr	w0, w1, w0
	cbnz	w0, .L1009
.L986:
	mov	x0, x19
	bl	MP4_Renew_CurPacket
.L989:
	ldr	x1, [x19, 15656]
	cbz	x1, .L993
	ldr	w1, [x19, 15672]
	cmp	w1, wzr
	csinv	w0, w0, wzr, ne
.L1002:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
.L1009:
	ldrb	w0, [x21, 1529]
	cmp	w0, 1
	cset	w0, eq
	orr	w1, w1, w0
	cbz	w1, .L986
	.p2align 2
.L981:
	mov	x0, 438
	ldr	x1, [x19, 22528]
	movk	x0, 0x1, lsl 32
	cmp	x1, x0
	bne	.L1003
	ldr	w0, [x21, 1628]
	cmp	w0, 4
	beq	.L986
	mov	w0, 0
	b	.L989
	.p2align 3
.L1007:
	ldrb	w2, [x20, 3544]
	orr	w2, w2, 2
	strb	w2, [x20, 3544]
	b	.L980
	.p2align 3
.L1004:
	ldr	w0, [x21, 2056]
	cmp	w0, 1
	ble	.L1003
.L984:
	mov	x0, x19
	bl	MP4_Clean_HeadPacket
	mov	w0, 0
	b	.L989
	.p2align 3
.L1008:
	ldr	w2, [x21, 2048]
	mov	w3, 196
	cmp	w2, 438
	ccmp	w0, w3, 4, ne
	bne	.L984
	b	.L985
	.p2align 3
.L993:
	mov	w0, -1
	b	.L1002
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
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 20480
	mov	x21, x1
	bl	_mcount
	ldr	w0, [x19, 2076]
	cbz	w0, .L1011
	ldr	w0, [x21, 20]
	cbz	w0, .L1011
	ldr	w0, [x21, 16]
	cbz	w0, .L1011
	ldr	x0, [x21]
	cbz	x0, .L1011
	ldr	x2, .LC190
	mov	w1, 2623
	mov	w0, 3
	add	x22, x20, 12288
	add	x23, x22, 3368
	bl	dprint_normal
	ldr	x2, .LC192
	mov	w1, 2624
	ldr	w3, [x21, 16]
	mov	w0, 8
	bl	dprint_normal
	ldr	x2, .LC194
	mov	w1, 2625
	ldr	w3, [x21, 20]
	mov	w0, 8
	bl	dprint_normal
	ldrb	w3, [x21, 10]
	mov	w1, 2626
	ldr	x2, .LC196
	mov	w0, 8
	bl	dprint_normal
	ldr	x2, .LC198
	mov	w1, 2627
	ldr	w3, [x21, 104]
	mov	w0, 8
	bl	dprint_normal
	ldr	x2, .LC200
	mov	w1, 2628
	ldr	w3, [x21, 108]
	mov	w0, 8
	bl	dprint_normal
	ldrb	w3, [x21, 98]
	mov	w1, 2629
	ldr	x2, .LC202
	mov	w0, 8
	bl	dprint_normal
	ldr	x2, .LC204
	mov	w1, 2631
	ldr	w3, [x21, 20]
	mov	w0, 8
	bl	dprint_normal
	ldr	x3, [x21]
	mov	w1, 2632
	ldr	x2, .LC206
	mov	w0, 8
	ldrb	w3, [x3]
	bl	dprint_normal
	ldr	x3, [x21]
	mov	w1, 2633
	ldr	x2, .LC208
	mov	w0, 8
	ldrb	w3, [x3, 1]
	bl	dprint_normal
	ldr	x3, [x21]
	mov	w1, 2634
	ldr	x2, .LC210
	mov	w0, 8
	ldrb	w3, [x3, 2]
	bl	dprint_normal
	ldr	x3, [x21]
	mov	w1, 2635
	ldr	x2, .LC212
	mov	w0, 8
	ldrb	w3, [x3, 3]
	bl	dprint_normal
	ldr	x3, .LC213
	mov	x2, 176
	mov	x1, x21
	mov	x0, x23
	ldr	x3, [x3, 104]
	blr	x3
	mov	x1, x23
	mov	x0, x20
	bl	MP4_GetScdUpMsg
	mov	x0, x20
	bl	MP4_Check_CurPacket
	cmn	w0, #1
	mov	w24, w0
	beq	.L1148
	mov	x1, x23
	mov	x0, x20
	bl	MP4_GetScdUpMsg
	ldr	w1, [x23, 16]
	str	w1, [x19, 1544]
	ldr	x1, [x20, 15656]
	str	x1, [x20, 22016]
	ldr	w0, [x19, 1604]
	ldr	w2, [x23, 20]
	str	w2, [x19, 1548]
	cmp	w0, 2
	str	wzr, [x19, 1552]
	ldr	x3, [x20, 22040]
	beq	.L1149
.L1016:
	ldr	w0, [x3, 8]
	cmp	w0, 2
	beq	.L1017
	cmp	w0, 1
	beq	.L1140
	cmp	w0, 4
	csel	w0, w0, wzr, eq
.L1140:
	str	w0, [x19, 1604]
	add	x23, x20, 16384
	ldr	w0, [x3, 856]
	cmp	w0, 1
	beq	.L1150
.L1022:
	ldr	w0, [x23, 3552]
	str	w0, [x19, 2808]
.L1023:
	mov	x0, x20
	bl	Mp4_Syntax_Parse
	lsr	w2, w0, 3
	ldr	x4, [x20, 22016]
	mov	x3, x2
	and	w0, w0, 7
	add	x2, x4, x2
	str	x2, [x20, 22016]
	str	w0, [x19, 1552]
	ldr	w2, [x19, 1544]
	ldr	w0, [x19, 1548]
	add	w2, w2, w3
	str	w2, [x19, 1544]
	sub	w0, w0, w3
	str	w0, [x19, 1548]
	ldr	x0, [x20, 22040]
	ldr	w1, [x0, 856]
	cmp	w1, 1
	beq	.L1151
.L1024:
	ldr	w1, [x23, 3552]
	mov	w0, 288
	tst	w1, w0
	beq	.L1025
	mov	w0, -435
	and	w0, w1, w0
	str	w0, [x23, 3552]
	ldr	w0, [x19, 1604]
	cmp	w0, 2
	beq	.L1152
	cmp	w0, 1
	beq	.L1153
	cmp	w0, 4
	bne	.L1071
	ldrb	w0, [x19, 1464]
	cbz	w0, .L1154
	sub	w1, w0, #2
	and	w1, w1, -3
	uxtb	w1, w1
	cbnz	w1, .L1035
	ldr	w1, [x19, 2104]
	cmp	w1, 2
	beq	.L1063
.L1035:
	cmp	w0, 1
	bne	.L1071
	str	w0, [x19, 2104]
	b	.L1071
	.p2align 3
.L1153:
	ldrb	w0, [x19, 1464]
	cmp	w0, 2
	beq	.L1027
.L1071:
	mov	x0, x20
	bl	Mp4_Frame_Atr
	cmn	w0, #1
	beq	.L1155
	ldr	w1, [x19, 2780]
	ldr	w0, [x19, 2768]
	bl	FSP_GetFsImagePtr
	mov	x25, x0
	ldr	w1, [x19, 2788]
	ldr	w0, [x19, 2768]
	bl	FSP_GetFsImagePtr
	mov	x26, x0
	cmp	x25, xzr
	cset	w24, eq
	cmp	x0, xzr
	cset	w0, eq
	orr	w24, w24, w0
	cbnz	w24, .L1156
	ldrb	w0, [x19, 763]
	and	w1, w0, -3
	cmp	w1, 1
	bne	.L1039
	cbz	x25, .L1040
	ldr	x0, [x20, 22040]
	ldr	w1, [x25, 96]
	ldr	w0, [x0]
	cmp	w1, w0
	bls	.L1042
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2796]
	bl	FSP_ClearLogicFs
	ldr	w21, [x23, 3548]
	ldr	w24, [x19, 2768]
	cmp	w21, wzr
	ble	.L1157
.L1073:
	add	x22, x22, 3548
	mov	w19, 0
	.p2align 2
.L1043:
	ldr	w1, [x22], 4
	mov	w0, w24
	add	w19, w19, 1
	bl	SM_ReleaseStreamSeg
	cmp	w19, w21
	blt	.L1043
	mov	x0, x20
	str	wzr, [x23, 3548]
	bl	MP4_Clean_HeadPacket
	cbz	x25, .L1072
.L1044:
	ldr	x4, [x20, 22040]
	mov	w1, 2745
	ldr	w3, [x25, 96]
	mov	w0, 1
	ldr	x2, .LC224
	mov	w24, -1
	ldr	w4, [x4]
	bl	dprint_normal
	mov	w0, w24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1039:
	cmp	w0, 2
	beq	.L1158
.L1042:
	ldrb	w0, [x19, 1464]
	cmp	w0, 2
	beq	.L1053
	ldr	w3, [x19, 2776]
	mov	w0, 2
	ldr	w1, [x19, 2780]
	ldr	w2, [x19, 2788]
	cmp	w3, wzr
	csinc	w0, w0, wzr, gt
	str	w0, [x19, 2776]
	cmp	w1, w2
	beq	.L1055
	ldr	w0, [x19, 2768]
	mov	w2, 0
	bl	FSP_SetRef
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2780]
	bl	FSP_GetDisplay
	cmp	w0, 3
	beq	.L1141
	ldr	w0, [x19, 2768]
	mov	w2, 0
	ldr	w1, [x19, 2780]
	bl	FSP_SetDisplay
.L1141:
	ldr	w2, [x19, 2788]
.L1055:
	str	w2, [x19, 2780]
	mov	w2, 1
	ldrb	w0, [x20, 1]
	strb	w0, [x20]
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2796]
	str	w1, [x19, 2788]
	str	w0, [x19, 2784]
	ldrb	w0, [x20, 2]
	strb	w0, [x20, 1]
	ldr	w3, [x19, 804]
	ldr	w0, [x19, 2768]
	str	w3, [x19, 2792]
	bl	FSP_SetRef
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2780]
	bl	FSP_ReleasePmv
	ldrb	w0, [x19, 1464]
	cmp	w0, 4
	bne	.L1053
	ldrb	w0, [x19, 760]
	cbz	w0, .L1159
.L1057:
	mov	w24, 0
.L1133:
	mov	w0, w24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1149:
	ldr	w0, [x3, 8]
	cmp	w0, 2
	bne	.L1160
.L1017:
	mov	w0, 2
	str	w0, [x19, 1604]
	add	x23, x20, 16384
	ldr	w0, [x3, 856]
	cmp	w0, 1
	bne	.L1022
.L1150:
	ldr	w0, [x3, 888]
	cmp	w0, 1
	bne	.L1022
	ldr	w0, [x19, 2808]
	str	w0, [x23, 3552]
	b	.L1023
	.p2align 3
.L1151:
	ldr	w0, [x0, 888]
	cbz	w0, .L1024
	b	.L1057
	.p2align 3
.L1053:
	mov	x0, x20
	mov	x2, x21
	mov	w1, 0
	bl	Mp4_Set_DecPar
	ldrb	w0, [x19, 1464]
	cbnz	w0, .L1059
	ldr	w1, [x19, 2104]
	cbnz	w1, .L1060
	mov	w1, 2
	str	w1, [x19, 2104]
.L1061:
	ldr	x2, [x20, 22040]
	add	x1, x20, 1048
	str	x1, [x20, 1040]
	ldr	w3, [x2, 880]
	cmp	w3, 1
	beq	.L1068
.L1067:
	cmp	w3, 2
	beq	.L1080
.L1068:
	strb	wzr, [x20, 1198]
	cbnz	w0, .L1057
	ldr	x0, .LC229
	ldr	x4, [x0]
	cbz	x4, .L1057
	add	x2, x29, 96
	ldr	w0, [x19, 2768]
	mov	w3, 4
	mov	w1, 8
	mov	w24, 0
	str	wzr, [x2, -8]!
	blr	x4
	b	.L1133
	.p2align 3
.L1152:
	ldrb	w0, [x19, 1464]
	cbz	w0, .L1071
.L1027:
	ldr	w0, [x23, 3548]
	ldr	w21, [x19, 2768]
	cmp	w0, wzr
	ble	.L1032
	sub	w19, w0, #1
	add	x22, x22, 3548
	add	x19, x19, 3960
	add	x19, x20, x19, lsl 2
	.p2align 2
.L1031:
	ldr	w1, [x22], 4
	mov	w0, w21
	bl	SM_ReleaseStreamSeg
	cmp	x19, x22
	bne	.L1031
.L1032:
	mov	x0, x20
	str	wzr, [x23, 3548]
	mov	w24, -1
	bl	MP4_Clean_HeadPacket
	b	.L1133
	.p2align 3
.L1154:
	ldr	w0, [x19, 2104]
	cbnz	w0, .L1034
	mov	w0, 2
	str	w0, [x19, 2104]
	b	.L1071
	.p2align 3
.L1160:
	mov	w0, 1
	str	w0, [x19, 2152]
	b	.L1016
	.p2align 3
.L1059:
	sub	w1, w0, #2
	cmp	w0, 2
	and	w1, w1, -3
	cset	w24, eq
	uxtb	w1, w1
	cbnz	w1, .L1062
	ldr	w1, [x19, 2104]
	cmp	w1, 2
	beq	.L1161
.L1062:
	cmp	w0, 1
	bne	.L1064
	str	w0, [x19, 2104]
	add	x1, x20, 1048
	str	x1, [x20, 1040]
	ldr	x2, [x20, 22040]
	ldr	w3, [x2, 880]
	cmp	w3, 1
	beq	.L1065
	cmp	w3, 2
	beq	.L1080
.L1065:
	strb	wzr, [x20, 1198]
	b	.L1057
	.p2align 3
.L1158:
	cbz	x25, .L1045
	ldr	x0, [x20, 22040]
	ldr	w1, [x25, 96]
	ldr	w0, [x0]
	cmp	w1, w0
	bhi	.L1046
	cbz	x26, .L1050
	ldr	w1, [x26, 96]
	cmp	w0, w1
	bcs	.L1042
.L1050:
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2796]
	bl	FSP_ClearLogicFs
	ldr	w21, [x19, 2768]
	ldr	w0, [x23, 3548]
	cmp	w0, wzr
	ble	.L1051
	sub	w19, w0, #1
	add	x22, x22, 3548
	add	x19, x19, 3960
	add	x19, x20, x19, lsl 2
	.p2align 2
.L1052:
	ldr	w1, [x22], 4
	mov	w0, w21
	bl	SM_ReleaseStreamSeg
	cmp	x22, x19
	bne	.L1052
.L1051:
	mov	x0, x20
	str	wzr, [x23, 3548]
	mov	w24, -1
	bl	MP4_Clean_HeadPacket
	ldr	x4, [x20, 22040]
	mov	w1, 2783
	ldr	x2, .LC233
	mov	w0, 1
	ldr	w3, [x26, 96]
	ldr	w4, [x4]
	bl	dprint_normal
	b	.L1133
	.p2align 3
.L1159:
	mov	x0, x20
	bl	MP4_PrepareNvopDecparam.part.1
	cbz	w0, .L1057
	ldr	x2, .LC228
	mov	w1, 2823
	mov	w0, 0
	bl	dprint_normal
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2796]
	bl	FSP_ClearLogicFs
	ldr	w21, [x19, 2768]
	ldr	w0, [x23, 3548]
	cmp	w0, wzr
	ble	.L1032
	sub	w19, w0, #1
	add	x22, x22, 3548
	add	x19, x19, 3960
	add	x19, x20, x19, lsl 2
	.p2align 2
.L1058:
	ldr	w1, [x22], 4
	mov	w0, w21
	bl	SM_ReleaseStreamSeg
	cmp	x19, x22
	bne	.L1058
	b	.L1032
	.p2align 3
.L1011:
	ldr	x2, .LC188
	mov	w1, 2619
	mov	w0, 1
	mov	w24, -1
	bl	dprint_normal
	mov	w0, w24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1034:
	mov	w0, 1
	str	w0, [x19, 2104]
	b	.L1071
	.p2align 3
.L1060:
	mov	w1, 1
	str	w1, [x19, 2104]
	b	.L1061
	.p2align 3
.L1046:
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2796]
	bl	FSP_ClearLogicFs
	ldr	w21, [x23, 3548]
	ldr	w24, [x19, 2768]
	cmp	w21, wzr
	ble	.L1162
.L1076:
	add	x22, x22, 3548
	mov	w19, 0
	.p2align 2
.L1048:
	ldr	w1, [x22], 4
	mov	w0, w24
	add	w19, w19, 1
	bl	SM_ReleaseStreamSeg
	cmp	w19, w21
	blt	.L1048
	mov	x0, x20
	str	wzr, [x23, 3548]
	bl	MP4_Clean_HeadPacket
	cbz	x25, .L1078
.L1049:
	ldr	x4, [x20, 22040]
	mov	w1, 2765
	ldr	x2, .LC226
	mov	w0, 1
	ldr	w3, [x25, 96]
	mov	w24, -1
	ldr	w4, [x4]
	bl	dprint_normal
	b	.L1133
	.p2align 3
.L1080:
	ldr	w2, [x2, 884]
	cmp	w2, wzr
	cset	w2, gt
	cmp	x1, xzr
	and	w24, w24, w2
	cset	w1, ne
	tst	w1, w24
	beq	.L1068
	str	xzr, [x20, 1040]
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2796]
	bl	FSP_ClearLogicFs
	ldr	x1, [x20, 22040]
	ldr	w0, [x1, 884]
	sub	w0, w0, #1
	str	w0, [x1, 884]
	ldr	w0, [x23, 3548]
	ldr	w21, [x19, 2768]
	cmp	w0, wzr
	ble	.L1032
	sub	w19, w0, #1
	add	x22, x22, 3548
	add	x19, x19, 3960
	add	x19, x20, x19, lsl 2
.L1070:
	ldr	w1, [x22], 4
	mov	w0, w21
	bl	SM_ReleaseStreamSeg
	cmp	x19, x22
	bne	.L1070
	b	.L1032
	.p2align 3
.L1064:
	ldr	x2, [x20, 22040]
	add	x1, x20, 1048
	str	x1, [x20, 1040]
	ldr	w3, [x2, 880]
	cmp	w3, 1
	bne	.L1067
	cmp	x1, xzr
	cset	w1, ne
	tst	w24, w1
	beq	.L1068
	str	xzr, [x20, 1040]
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2796]
	bl	FSP_ClearLogicFs
	ldr	w21, [x19, 2768]
	ldr	w0, [x23, 3548]
	cmp	w0, wzr
	ble	.L1032
	sub	w19, w0, #1
	add	x22, x22, 3548
	add	x19, x19, 3960
	add	x19, x20, x19, lsl 2
.L1069:
	ldr	w1, [x22], 4
	mov	w0, w21
	bl	SM_ReleaseStreamSeg
	cmp	x19, x22
	bne	.L1069
	b	.L1032
	.p2align 3
.L1040:
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2796]
	bl	FSP_ClearLogicFs
	ldr	w21, [x23, 3548]
	ldr	w24, [x19, 2768]
	cmp	w21, wzr
	bgt	.L1073
	mov	x0, x20
	str	wzr, [x23, 3548]
	bl	MP4_Clean_HeadPacket
	.p2align 2
.L1072:
	ldr	x3, .LC218
	mov	w4, 2740
.L1143:
	ldr	x2, .LC222
.L1142:
	mov	w1, w4
	add	x3, x3, 1376
	mov	w0, 1
	mov	w24, -1
	bl	dprint_normal
	b	.L1133
.L1157:
	mov	x0, x20
	str	wzr, [x23, 3548]
	bl	MP4_Clean_HeadPacket
	b	.L1044
.L1161:
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2796]
	bl	FSP_ClearLogicFs
	ldr	x0, .LC229
	ldr	x4, [x0]
	cbz	x4, .L1063
	ldr	w0, [x19, 2768]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 60
	mov	w24, -1
	blr	x4
	b	.L1133
.L1148:
	ldr	x2, .LC215
	mov	w1, 2643
	mov	w0, 1
	bl	dprint_normal
	b	.L1133
.L1025:
	ldr	x2, .LC231
	mov	w1, 2898
	mov	w0, 3
	mov	w24, -1
	bl	dprint_normal
	b	.L1133
.L1156:
	ldr	x3, .LC218
	mov	w4, 2726
	ldr	x2, .LC220
	b	.L1142
.L1155:
	ldr	x2, .LC217
	mov	w1, 2714
	mov	w0, 1
	bl	dprint_normal
	ldr	w21, [x19, 2768]
	ldr	w0, [x23, 3548]
	cmp	w0, wzr
	ble	.L1032
	sub	w19, w0, #1
	add	x22, x22, 3548
	add	x19, x19, 3960
	add	x19, x20, x19, lsl 2
	.p2align 2
.L1037:
	ldr	w1, [x22], 4
	mov	w0, w21
	bl	SM_ReleaseStreamSeg
	cmp	x22, x19
	bne	.L1037
	b	.L1032
.L1045:
	ldr	w0, [x19, 2768]
	ldr	w1, [x19, 2796]
	bl	FSP_ClearLogicFs
	ldr	w21, [x23, 3548]
	cmp	w21, wzr
	bgt	.L1163
	mov	x0, x20
	str	wzr, [x23, 3548]
	bl	MP4_Clean_HeadPacket
.L1078:
	ldr	x3, .LC218
	mov	w4, 2760
	b	.L1143
.L1063:
	mov	w24, -1
	b	.L1133
.L1163:
	ldr	w24, [x19, 2768]
	b	.L1076
.L1162:
	mov	x0, x20
	str	wzr, [x23, 3548]
	bl	MP4_Clean_HeadPacket
	b	.L1049
	.size	MPEG4DEC_Decode, .-MPEG4DEC_Decode
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
	.align	3
.LC210:
	.xword	.LC209
	.align	3
.LC212:
	.xword	.LC211
	.align	3
.LC213:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC215:
	.xword	.LC214
	.align	3
.LC217:
	.xword	.LC216
	.align	3
.LC218:
	.xword	.LANCHOR1
	.align	3
.LC220:
	.xword	.LC219
	.align	3
.LC222:
	.xword	.LC221
	.align	3
.LC224:
	.xword	.LC223
	.align	3
.LC226:
	.xword	.LC225
	.align	3
.LC228:
	.xword	.LC227
	.align	3
.LC229:
	.xword	g_EventReportFunc
	.align	3
.LC231:
	.xword	.LC230
	.align	3
.LC233:
	.xword	.LC232
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
	.type	__func__.6208, %object
	.size	__func__.6208, 14
__func__.6208:
	.string	"MP4_FrameInit"
	.zero	2
	.type	__FUNCTION__.6250, %object
	.size	__FUNCTION__.6250, 15
__FUNCTION__.6250:
	.string	"Mp4_Set_DecPar"
	.zero	1
	.type	__FUNCTION__.6371, %object
	.size	__FUNCTION__.6371, 23
__FUNCTION__.6371:
	.string	"Mp4_Syntax_Slice_NotSH"
	.zero	1
	.type	__FUNCTION__.6385, %object
	.size	__FUNCTION__.6385, 20
__FUNCTION__.6385:
	.string	"Mp4_Syntax_Slice_SH"
	.zero	4
	.type	__FUNCTION__.6400, %object
	.size	__FUNCTION__.6400, 14
__FUNCTION__.6400:
	.string	"MP4_Dec_Slice"
	.zero	2
	.type	__FUNCTION__.6278, %object
	.size	__FUNCTION__.6278, 16
__FUNCTION__.6278:
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
.LC2:
	ASCII(.string	"line: %d pCur = %p, pFwd = %p\n" )
	.zero	1
.LC4:
	ASCII(.string	"CurFs(f%d,c%d,b%d) abnormal!(%p)\n" )
	.zero	6
.LC19:
	ASCII(.string	"fatal stream error --- GOP marker_bit = 0\n" )
	.zero	5
.LC24:
	ASCII(.string	"DivX%4dBuild%4d%c" )
	.zero	6
.LC26:
	ASCII(.string	"DivX%4db%4d%c" )
	.zero	2
.LC28:
	ASCII(.string	"FFmpe%*[^b]b%4d" )
.LC30:
	ASCII(.string	"FFmpeg v%4d.%4d.%4d / libavcodec build: %d" )
	.zero	5
.LC32:
	ASCII(.string	"Lavc%d.%d.%d" )
	.zero	3
.LC34:
	ASCII(.string	"ffmpeg" )
	.zero	1
.LC36:
	ASCII(.string	"XviD%4d" )
.LC40:
	ASCII(.string	"fatal stream error --- VOP marker_bit = 0\n" )
	.zero	5
.LC43:
	ASCII(.string	"VDH doesn't support SPRITE_STATIC\n" )
	.zero	5
.LC45:
	ASCII(.string	"Unknown sprite_enable\n" )
	.zero	1
.LC47:
	ASCII(.string	"ERROR: not_8_bit !=0\n" )
	.zero	2
.LC50:
	ASCII(.string	"not support no complexity_estimation_disable\n" )
	.zero	2
.LC52:
	ASCII(.string	"not support data_partitioned\n" )
	.zero	2
.LC54:
	ASCII(.string	"not support newpred_enable\n" )
	.zero	4
.LC56:
	ASCII(.string	"not support reduced_resolution_vop_eanble\n" )
	.zero	5
.LC58:
	ASCII(.string	"not support scalability\n" )
	.zero	7
.LC62:
	ASCII(.string	"warning! profile_and_level_indication=%#x, maybe HD pic...\n" )
	.zero	4
.LC67:
	ASCII(.string	"%s arrange fs pool failed!\n" )
	.zero	4
.LC69:
	ASCII(.string	"Chan:%d dec_pts: %lld Usertag: %lld\n" )
	.zero	3
.LC72:
	ASCII(.string	"mp4 coding type %d get frame store failed!\n" )
	.zero	4
.LC76:
	ASCII(.string	"%s %d  abnormal!\n" )
	.zero	6
.LC78:
	ASCII(.string	"CurFsID(fwd%d,%d,bwd%d) abnormal!(%p,%p)\n" )
	.zero	6
.LC80:
	ASCII(.string	"MPEG4DEC Init  -----\n" )
	.zero	2
.LC83:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC85:
	ASCII(.string	"MPEG4DEC Init success -----\n" )
	.zero	3
.LC90:
	ASCII(.string	"vop_coding_type = %d is not expected!\n" )
	.zero	1
.LC92:
	ASCII(.string	" slice num %d is not extpected!\n" )
	.zero	7
.LC94:
	ASCII(.string	" line %d packet is wrong!\n" )
	.zero	5
.LC98:
	ASCII(.string	"pImg is null, pCurImg %#x pBwdImg %#x\n" )
	.zero	1
.LC101:
	ASCII(.string	"line: %d pToQueImg is null!\n" )
	.zero	3
.LC104:
	ASCII(.string	"CurImage %d is already out put\n" )
.LC106:
	ASCII(.string	"err(%d) > out_thr(%d)\n" )
	.zero	1
.LC108:
	ASCII(.string	"StreamIDNum = %d > (%d)\n" )
	.zero	7
.LC110:
	ASCII(.string	"Warning : vop slice num %d != 0\n" )
	.zero	7
.LC115:
	ASCII(.string	"warning streamIDNum %d != 0 \n" )
	.zero	2
.LC119:
	ASCII(.string	"vop ---%d\n" )
	.zero	5
.LC121:
	ASCII(.string	"parse time_module_base stream not enough\n" )
	.zero	6
.LC123:
	ASCII(.string	"module time base parse error, more than %d '1' was found!\n" )
	.zero	5
.LC127:
	ASCII(.string	"error: vop_coding_type = %d, but vop_fcode_forward = 0\n" )
.LC129:
	ASCII(.string	"error: B vop, but vop_fcode_backward = 0\n" )
	.zero	6
.LC133:
	ASCII(.string	"FUN: %s Invalid SlcNum = %d\n" )
	.zero	3
.LC135:
	ASCII(.string	" pSlcPara->mb_start_num = %d, MbCnt = %d\n" )
	.zero	6
.LC139:
	ASCII(.string	"pSlcPara->mb_start_num = %d, totalMbMin1 = %d\n" )
	.zero	1
.LC142:
	ASCII(.string	"FUN: %s MP4_ClearCurPacket\n" )
	.zero	4
.LC145:
	ASCII(.string	"pCtx is NUL!!!\n" )
.LC150:
	ASCII(.string	"Not find start code \n" )
	.zero	2
.LC152:
	ASCII(.string	"VOS beginning ~ !\n" )
	.zero	5
.LC154:
	ASCII(.string	"VO beginning ~ !\n" )
	.zero	6
.LC156:
	ASCII(.string	"VOL beginning ~ !\n" )
	.zero	5
.LC158:
	ASCII(.string	"GOP beginning ~ !\n" )
	.zero	5
.LC160:
	ASCII(.string	"VOP beginning ~ !\n" )
	.zero	5
.LC162:
	ASCII(.string	"BitUsed=%d\n" )
	.zero	4
.LC164:
	ASCII(.string	"SHVOP beginning ~ !\n" )
	.zero	3
.LC166:
	ASCII(.string	"USERDATA beginning ~ !\n" )
.LC168:
	ASCII(.string	"MPEG4 Frame_Init return err 3!\n" )
.LC171:
	ASCII(.string	"MPEG4 Frame_Init return err 1!\n" )
.LC173:
	ASCII(.string	"vop right\n" )
	.zero	5
.LC175:
	ASCII(.string	"MPEG4 Frame_Init return err 2!\n" )
.LC177:
	ASCII(.string	"bits over boundary\n" )
	.zero	4
.LC180:
	ASCII(.string	"pLastPacket->StreamPack[0].VirAddr is NULL!!\n" )
	.zero	2
.LC184:
	ASCII(.string	"line %d MP4_Combine_HdPacket failed!!\n" )
	.zero	1
.LC187:
	ASCII(.string	"bitsream para error -----\n" )
	.zero	5
.LC189:
	ASCII(.string	"MPEG4DEC Decode -----\n" )
	.zero	1
.LC191:
	ASCII(.string	"ptr_strm_para->PhyAddr0=0x%x\n" )
	.zero	2
.LC193:
	ASCII(.string	"ptr_strm_para->Length0=%d\n" )
	.zero	5
.LC195:
	ASCII(.string	"ptr_strm_para->IsLastSeg0=%d\n" )
	.zero	2
.LC197:
	ASCII(.string	"ptr_strm_para->PhyAddr1=0x%x\n" )
	.zero	2
.LC199:
	ASCII(.string	"ptr_strm_para->Length1=%d\n" )
	.zero	5
.LC201:
	ASCII(.string	"ptr_strm_para->IsLastSeg1=%d\n" )
	.zero	2
.LC203:
	ASCII(.string	"ptr_strm_para->Length0 = %d\n" )
	.zero	3
.LC205:
	ASCII(.string	"byte0: = 0x%x\n" )
	.zero	1
.LC207:
	ASCII(.string	"byte1: = 0x%x\n" )
	.zero	1
.LC209:
	ASCII(.string	"byte2: = 0x%x\n" )
	.zero	1
.LC211:
	ASCII(.string	"byte3: = 0x%x\n" )
	.zero	1
.LC214:
	ASCII(.string	"MP4_Check_CurPacket failed!\n" )
	.zero	3
.LC216:
	ASCII(.string	"Mp4_Frame_Atr return fail\n" )
	.zero	5
.LC219:
	ASCII(.string	"fuction return value is null, %s %d!!\n" )
	.zero	1
.LC221:
	ASCII(.string	"fuction return value is null,%s %d!!\n" )
	.zero	2
.LC223:
	ASCII(.string	"dec P/S frame, fwd ref err(%d) > ref_thr(%d)\n" )
	.zero	2
.LC225:
	ASCII(.string	"dec B frame, bwd ref err(%d) > ref_thr(%d)\n" )
	.zero	4
.LC227:
	ASCII(.string	"MP4_PrepareNvopDecparam failed.\n" )
	.zero	7
.LC230:
	ASCII(.string	"bits not enought\n" )
	.zero	6
.LC232:
	ASCII(.string	"dec B frame, fwd ref err(%d) > ref_thr(%d)\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
