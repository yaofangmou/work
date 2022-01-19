#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"avs.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	avs_u_v
	.type	avs_u_v, %function
avs_u_v:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x2
	mov	w20, w1
	bl	_mcount
	mov	w1, w20
	mov	x0, x19
	bl	BsGet
	mov	w19, w0
	ldr	x2, .LC1
	mov	w5, w20
	mov	w4, w0
	mov	x3, x21
	mov	w1, 167
	mov	w0, 8
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	avs_u_v, .-avs_u_v
	.align	3
.LC1:
	.xword	.LC0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	avs_f_v
	.type	avs_f_v, %function
avs_f_v:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x2
	mov	w20, w1
	bl	_mcount
	mov	w1, w20
	mov	x0, x19
	bl	BsGet
	mov	w19, w0
	ldr	x2, .LC2
	mov	w5, w20
	mov	w4, w0
	mov	x3, x21
	mov	w1, 177
	mov	w0, 8
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	avs_f_v, .-avs_f_v
	.align	3
.LC2:
	.xword	.LC0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	avs_ue_v
	.type	avs_ue_v, %function
avs_ue_v:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	mov	w1, 32
	mov	x0, x21
	bl	BsShow
	bl	ZerosMS_32
	cmp	w0, 31
	mov	w19, w0
	bls	.L7
	mov	w20, -1
	mov	w5, 32
.L4:
	ldr	x2, .LC3
	mov	w4, w20
	mov	x3, x22
	mov	w1, 204
	mov	w0, 8
	bl	dprint_normal
	ldr	x23, [sp, 48]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L7:
	mov	w1, w0
	mov	x0, x21
	add	w23, w19, 1
	bl	BsSkip
	mov	w1, w23
	mov	x0, x21
	bl	BsShow
	sub	w20, w0, #1
	mov	w1, w23
	mov	x0, x21
	bl	BsSkip
	lsl	w5, w19, 1
	add	w5, w5, 1
	b	.L4
	.size	avs_ue_v, .-avs_ue_v
	.align	3
.LC3:
	.xword	.LC0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	avs_se_v
	.type	avs_se_v, %function
avs_se_v:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	mov	w1, 32
	mov	x0, x20
	bl	BsShow
	bl	ZerosMS_32
	cmp	w0, 31
	mov	w19, w0
	bls	.L13
	mov	w20, 2147483647
	mov	w5, 32
.L9:
	ldr	x2, .LC4
	mov	w4, w20
	mov	x3, x21
	mov	w1, 235
	mov	w0, 8
	bl	dprint_normal
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L13:
	mov	w1, w0
	mov	x0, x20
	add	w22, w19, 1
	bl	BsSkip
	mov	w1, w22
	mov	x0, x20
	bl	BsShow
	sub	w0, w0, #1
	and	w1, w0, 1
	asr	w2, w0, 1
	cmp	w1, wzr
	mov	x0, x20
	mov	w1, w22
	neg	w20, w2
	csinc	w20, w20, w2, eq
	bl	BsSkip
	lsl	w5, w19, 1
	add	w5, w5, 1
	b	.L9
	.size	avs_se_v, .-avs_se_v
	.align	3
.LC4:
	.xword	.LC0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_next_start_code
	.type	AVS_next_start_code, %function
AVS_next_start_code:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 0
	bl	_mcount
	mov	x0, x20
	bl	BsToNextByte
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w21, w1, w0, lt
	asr	w21, w21, 3
	sub	w21, w21, #3
	cmp	w21, wzr
	bgt	.L21
	b	.L18
	.p2align 3
.L24:
	bl	BsSkip
	cmp	w19, w21
	beq	.L18
.L21:
	mov	w1, 24
	mov	x0, x20
	add	w19, w19, 1
	bl	BsShow
	mov	w2, w0
	cmp	w2, 1
	mov	w1, 8
	mov	x0, x20
	bne	.L24
	mov	w0, w2
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L18:
	mov	w2, 0
	ldr	x21, [sp, 32]
	mov	w0, w2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS_next_start_code, .-AVS_next_start_code
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_sequence_header
	.type	AVS_sequence_header, %function
AVS_sequence_header:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x23, x0
	mov	x0, x30
	add	x21, x23, 12288
	mov	x19, x1
	bl	_mcount
	ldr	x2, .LC6
	mov	w1, 32
	ldr	x20, [x21, 3168]
	ldr	w4, [x21, 2772]
	mov	x0, x20
	and	w4, w4, -65537
	str	w4, [x21, 2772]
	bl	avs_f_v
	ldr	x2, .LC8
	mov	w1, 8
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 16]
	ldr	x2, .LC10
	mov	w1, 8
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 20]
	ldr	x2, .LC12
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 15]
	ldr	x2, .LC14
	mov	w1, 14
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 24]
	ldr	x2, .LC16
	mov	w1, 14
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 28]
	ldr	x2, .LC18
	mov	w1, 2
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 11]
	ldr	x2, .LC20
	mov	w1, 3
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 12]
	ldr	x2, .LC22
	mov	w1, 4
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 13]
	ldr	x2, .LC24
	mov	w1, 4
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 14]
	ldr	x2, .LC26
	mov	w1, 18
	mov	x0, x20
	bl	avs_u_v
	ldr	x22, .LC28
	mov	w1, 1
	str	w0, [x19, 32]
	mov	x2, x22
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 10]
	ldr	x2, .LC30
	mov	w1, 12
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 36]
	ldr	x2, .LC32
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 9]
	mov	x2, x22
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 10]
	ldr	x2, .LC34
	mov	w1, 18
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 40]
	ldr	x2, .LC36
	mov	w1, 3
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 8]
	ldp	w4, w5, [x19, 24]
	cmp	w4, 1920
	bhi	.L27
	cmp	w5, 1088
	bhi	.L27
	ldrb	w0, [x19, 14]
	cmp	w0, 15
	bhi	.L30
	ldr	x1, .LC37
	add	x1, x1, 24
	ldr	w0, [x1, w0, sxtw 2]
	str	w0, [x19, 44]
	ldr	w1, [x21, 2812]
	cmp	w4, w1
	beq	.L39
.L32:
	ldrsw	x0, [x23, 4]
	ldr	x22, .LC40
	lsl	x1, x0, 2
	sub	x1, x1, x0
	lsl	x2, x1, 5
	add	x1, x1, x2
	add	x0, x1, x0
	add	x0, x22, x0
	ldr	w1, [x0, 64]
	cbz	w1, .L40
.L34:
	ldr	x0, .LC42
	mov	w1, 1
	str	w1, [x21, 2784]
	ldr	x4, [x0]
	cbz	x4, .L33
	ldp	w3, w2, [x19, 24]
	ldr	w6, [x21, 2812]
	ldr	w5, [x21, 2816]
	ldr	w0, [x23, 4]
	strh	w3, [x29, 76]
	mov	w3, 8
	strh	w2, [x29, 78]
	add	x2, x29, 72
	strh	w6, [x29, 72]
	strh	w5, [x29, 74]
	blr	x4
.L33:
	mov	x1, x19
	mov	x2, 376
	add	x0, x21, 2788
	bl	memcpy
	ldr	w1, [x21, 2772]
	mov	w0, 1
	ldr	w2, [x21, 2780]
	str	w0, [x21, 2776]
	orr	w1, w1, 65536
	add	w2, w2, w0
	str	w1, [x21, 2772]
	str	w2, [x21, 2780]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L27:
	ldr	x3, .LC37
	mov	w1, 516
	ldr	x2, .LC39
	mov	w0, 0
	bl	dprint_normal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, 0
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L30:
	mov	w0, -1
	str	w0, [x19, 44]
	ldr	w1, [x21, 2812]
	cmp	w4, w1
	bne	.L32
.L39:
	ldr	w0, [x21, 2816]
	cmp	w5, w0
	bne	.L32
	b	.L33
	.p2align 3
.L40:
	ldr	x1, .LC41
	mov	w2, 1
	str	w2, [x0, 64]
	ldr	x0, [x1]
	ldr	w20, [x23, 4]
	blr	x0
	sxtw	x1, w20
	lsl	x2, x1, 2
	sub	x2, x2, x1
	lsl	x3, x2, 5
	add	x2, x2, x3
	add	x1, x2, x1
	add	x1, x22, x1
	str	w0, [x1, 68]
	b	.L34
	.size	AVS_sequence_header, .-AVS_sequence_header
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
.LC37:
	.xword	.LANCHOR0
	.align	3
.LC39:
	.xword	.LC38
	.align	3
.LC40:
	.xword	g_VfmwChanStat
	.align	3
.LC41:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC42:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_i_picture_header
	.type	AVS_i_picture_header, %function
AVS_i_picture_header:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x3, .LC46
	mov	x2, 272
	mov	w1, 0
	add	x0, x19, 80
	ldr	x20, [x21, 520]
	ldr	x3, [x3, 96]
	blr	x3
	ldr	w3, [x21, 124]
	mov	w1, 32
	ldr	x2, .LC48
	mov	x0, x20
	and	w3, w3, -262145
	str	w3, [x21, 124]
	bl	avs_f_v
	ldr	x2, .LC50
	mov	w1, 16
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 96]
	ldr	w1, [x19, 16]
	ldr	x22, .LC51
	cmp	w1, 72
	beq	.L75
	ldr	x2, .LC55
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 90]
	beq	.L76
.L43:
	mov	x2, x22
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 108]
	ldr	x2, .LC59
	mov	w1, 8
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 112]
	ldrb	w1, [x19, 9]
	cmp	w1, 1
	beq	.L77
.L44:
	ldr	x2, .LC63
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	uxtb	w0, w0
	ldrb	w1, [x19, 15]
	strb	w0, [x19, 80]
	cmp	w1, 1
	beq	.L78
	cbz	w0, .L79
.L46:
	mov	w0, 1
	strb	w0, [x19, 81]
.L47:
	ldr	x2, .LC67
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 82]
	ldr	x2, .LC69
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 83]
	ldr	x2, .LC71
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 84]
	ldr	x2, .LC73
	mov	w1, 6
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 85]
	ldrh	w1, [x19, 80]
	cbz	w1, .L80
.L48:
	ldr	x2, .LC76
	mov	w1, 4
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 87]
	ldr	x2, .LC78
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	uxtb	w0, w0
	stp	wzr, wzr, [x19, 120]
	strb	w0, [x19, 88]
	cbz	w0, .L81
.L50:
	ldr	w0, [x19, 16]
	cmp	w0, 72
	beq	.L82
.L52:
	str	wzr, [x19, 348]
	mov	w0, 1
	strb	w0, [x19, 93]
	ldr	w0, [x21, 124]
	orr	w0, w0, 262144
	str	w0, [x21, 124]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L79:
	ldr	x2, .LC65
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 81]
	b	.L47
	.p2align 3
.L81:
	ldr	x2, .LC80
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	uxtb	w0, w0
	strb	w0, [x19, 89]
	cbz	w0, .L50
	ldr	x1, .LC82
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x19, 120]
	ldr	x1, .LC84
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x19, 124]
	b	.L50
	.p2align 3
.L80:
	ldr	x2, .LC75
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 86]
	b	.L48
	.p2align 3
.L78:
	strb	w1, [x19, 80]
	b	.L46
	.p2align 3
.L82:
	ldr	x2, .LC86
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 128]
	cbnz	w0, .L53
.L61:
	ldr	x2, .LC88
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 332]
	b	.L52
	.p2align 3
.L75:
	mov	w1, 1
	mov	x2, x22
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 108]
	ldr	x2, .LC53
	mov	w1, 7
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 100]
	ldr	w1, [x19, 96]
	mov	w2, 1
	strb	w2, [x19]
	ldr	x2, .LC55
	orr	w0, w0, w1, lsl 7
	mov	w1, 1
	str	w0, [x19, 96]
	mov	x0, x20
	bl	avs_u_v
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 90]
	bne	.L43
	.p2align 2
.L76:
	ldr	x2, .LC57
	mov	w1, 24
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 104]
	b	.L43
	.p2align 3
.L77:
	ldr	x1, .LC61
	mov	x0, x20
	bl	avs_ue_v
	str	w0, [x19, 116]
	b	.L44
	.p2align 3
.L53:
	ldr	x2, .LC90
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 132]
	ldr	x2, .LC92
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 136]
	cbz	w0, .L83
.L54:
	ldr	x2, .LC98
	mov	w1, 2
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 148]
	ldr	x2, .LC100
	mov	w1, 2
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 152]
	ldr	w1, [x19, 148]
	cmp	w1, 1
	beq	.L55
	ldr	w0, [x19, 132]
	cmp	w0, wzr
	ccmp	w1, 3, 0, eq
	beq	.L55
	cmp	w1, 2
	add	x22, x19, 180
	bne	.L61
.L60:
	ldr	x23, .LC104
	add	x24, x19, 204
	.p2align 2
.L59:
	mov	x1, x23
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x22], 4
	cmp	x22, x24
	bne	.L59
	b	.L61
	.p2align 3
.L83:
	ldr	x1, .LC94
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x19, 140]
	ldr	x1, .LC96
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x19, 144]
	b	.L54
	.p2align 3
.L55:
	ldr	x24, .LC102
	add	x23, x19, 156
	add	x22, x19, 180
	.p2align 2
.L57:
	mov	x1, x24
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x23], 4
	cmp	x23, x22
	bne	.L57
	ldr	w0, [x19, 148]
	cmp	w0, 2
	beq	.L60
	ldr	w1, [x19, 132]
	cmp	w1, wzr
	ccmp	w0, 3, 0, eq
	beq	.L60
	b	.L61
	.size	AVS_i_picture_header, .-AVS_i_picture_header
	.align	3
.LC46:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC48:
	.xword	.LC47
	.align	3
.LC50:
	.xword	.LC49
	.align	3
.LC51:
	.xword	.LC27
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
.LC76:
	.xword	.LC35
	.align	3
.LC78:
	.xword	.LC77
	.align	3
.LC80:
	.xword	.LC79
	.align	3
.LC82:
	.xword	.LC81
	.align	3
.LC84:
	.xword	.LC83
	.align	3
.LC86:
	.xword	.LC85
	.align	3
.LC88:
	.xword	.LC87
	.align	3
.LC90:
	.xword	.LC89
	.align	3
.LC92:
	.xword	.LC91
	.align	3
.LC94:
	.xword	.LC93
	.align	3
.LC96:
	.xword	.LC95
	.align	3
.LC98:
	.xword	.LC97
	.align	3
.LC100:
	.xword	.LC99
	.align	3
.LC102:
	.xword	.LC101
	.align	3
.LC104:
	.xword	.LC103
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_pb_picture_header
	.type	AVS_pb_picture_header, %function
AVS_pb_picture_header:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x3, .LC105
	mov	x2, 272
	mov	w1, 0
	add	x0, x19, 80
	ldr	x20, [x21, 520]
	ldr	x3, [x3, 96]
	blr	x3
	ldr	w3, [x21, 124]
	mov	w1, 32
	ldr	x2, .LC107
	mov	x0, x20
	and	w3, w3, -262145
	str	w3, [x21, 124]
	bl	avs_f_v
	ldr	x2, .LC108
	mov	w1, 16
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 96]
	ldr	w1, [x19, 16]
	cmp	w1, 72
	beq	.L129
.L85:
	ldr	x2, .LC112
	mov	w1, 2
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 91]
	ldr	x2, .LC113
	mov	w1, 8
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 112]
	ldrb	w1, [x19, 9]
	cmp	w1, 1
	beq	.L130
.L86:
	ldr	x2, .LC115
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	uxtb	w0, w0
	strb	w0, [x19, 80]
	cbz	w0, .L131
	mov	w0, 1
	strb	w0, [x19, 81]
.L88:
	ldr	x2, .LC119
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 82]
	ldr	x2, .LC120
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 83]
	ldr	x2, .LC121
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 84]
	ldr	x2, .LC122
	mov	w1, 6
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 85]
	ldrb	w1, [x19, 91]
	cmp	w1, 2
	beq	.L132
.L89:
	ldr	x2, .LC124
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 93]
.L91:
	ldr	x2, .LC126
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	str	wzr, [x19, 340]
	ldrb	w1, [x19, 91]
	strb	w0, [x19, 94]
	cmp	w1, 2
	str	wzr, [x19, 344]
	beq	.L133
	ldr	x2, .LC130
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 340]
.L93:
	ldrb	w0, [x19, 81]
	cmp	w0, 1
	beq	.L94
	ldr	w0, [x19, 16]
	cmp	w0, 72
	beq	.L95
.L94:
	str	wzr, [x19, 340]
	str	wzr, [x19, 344]
.L95:
	ldr	x2, .LC131
	mov	w1, 2
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 87]
	ldr	x2, .LC132
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 86]
	ldr	x2, .LC133
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	uxtb	w0, w0
	stp	wzr, wzr, [x19, 120]
	strb	w0, [x19, 88]
	cbz	w0, .L134
.L97:
	ldr	w0, [x19, 16]
	cmp	w0, 72
	beq	.L135
.L99:
	ldrb	w0, [x19, 91]
	cmp	w0, 1
	beq	.L128
	mov	w0, 2
.L128:
	str	w0, [x19, 348]
	ldr	w0, [x21, 124]
	orr	w0, w0, 262144
	str	w0, [x21, 124]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L132:
	ldrb	w0, [x19, 81]
	cmp	w0, 1
	bne	.L89
	strb	w0, [x19, 93]
	b	.L91
	.p2align 3
.L131:
	ldr	x2, .LC116
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	uxtb	w0, w0
	strb	w0, [x19, 81]
	cbnz	w0, .L88
	ldr	x2, .LC118
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	strb	w0, [x19, 92]
	b	.L88
	.p2align 3
.L134:
	ldr	x2, .LC134
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	uxtb	w0, w0
	strb	w0, [x19, 89]
	cbz	w0, .L97
	ldr	x1, .LC135
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x19, 120]
	ldr	x1, .LC136
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x19, 124]
	b	.L97
	.p2align 3
.L133:
	ldr	x2, .LC128
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 344]
	b	.L93
	.p2align 3
.L135:
	ldr	x2, .LC137
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	cmp	w0, 1
	str	w0, [x19, 128]
	mov	w22, w0
	beq	.L100
.L108:
	ldr	x2, .LC138
	mov	w1, 1
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 332]
	b	.L99
	.p2align 3
.L129:
	ldr	x2, .LC109
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 108]
	ldr	x2, .LC110
	mov	w1, 7
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 100]
	ldr	w1, [x19, 96]
	mov	w2, 1
	strb	w2, [x19]
	orr	w0, w0, w1, lsl 7
	str	w0, [x19, 96]
	b	.L85
	.p2align 3
.L130:
	ldr	x1, .LC114
	mov	x0, x20
	bl	avs_ue_v
	str	w0, [x19, 116]
	b	.L86
	.p2align 3
.L100:
	ldr	x2, .LC139
	mov	w1, w0
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 132]
	ldr	x2, .LC140
	mov	w1, w22
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 136]
	cbz	w0, .L136
.L101:
	ldr	x2, .LC143
	mov	w1, 2
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 148]
	ldr	x2, .LC144
	mov	w1, 2
	mov	x0, x20
	bl	avs_u_v
	str	w0, [x19, 152]
	ldr	w1, [x19, 148]
	cmp	w1, 1
	beq	.L102
	ldr	w0, [x19, 132]
	cmp	w0, wzr
	ccmp	w1, 3, 0, eq
	beq	.L102
	cmp	w1, 2
	add	x22, x19, 180
	bne	.L108
.L107:
	ldr	x23, .LC146
	add	x24, x19, 204
	.p2align 2
.L106:
	mov	x1, x23
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x22], 4
	cmp	x22, x24
	bne	.L106
	b	.L108
.L102:
	ldr	x24, .LC145
	add	x23, x19, 156
	add	x22, x19, 180
	.p2align 2
.L104:
	mov	x1, x24
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x23], 4
	cmp	x23, x22
	bne	.L104
	ldr	w0, [x19, 148]
	cmp	w0, 2
	beq	.L107
	ldr	w1, [x19, 132]
	cmp	w1, wzr
	ccmp	w0, 3, 0, eq
	beq	.L107
	b	.L108
.L136:
	ldr	x1, .LC141
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x19, 140]
	ldr	x1, .LC142
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x19, 144]
	b	.L101
	.size	AVS_pb_picture_header, .-AVS_pb_picture_header
	.align	3
.LC105:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC107:
	.xword	.LC106
	.align	3
.LC108:
	.xword	.LC49
	.align	3
.LC109:
	.xword	.LC27
	.align	3
.LC110:
	.xword	.LC52
	.align	3
.LC112:
	.xword	.LC111
	.align	3
.LC113:
	.xword	.LC58
	.align	3
.LC114:
	.xword	.LC60
	.align	3
.LC115:
	.xword	.LC62
	.align	3
.LC116:
	.xword	.LC64
	.align	3
.LC118:
	.xword	.LC117
	.align	3
.LC119:
	.xword	.LC66
	.align	3
.LC120:
	.xword	.LC68
	.align	3
.LC121:
	.xword	.LC70
	.align	3
.LC122:
	.xword	.LC72
	.align	3
.LC124:
	.xword	.LC123
	.align	3
.LC126:
	.xword	.LC125
	.align	3
.LC128:
	.xword	.LC127
	.align	3
.LC130:
	.xword	.LC129
	.align	3
.LC131:
	.xword	.LC35
	.align	3
.LC132:
	.xword	.LC74
	.align	3
.LC133:
	.xword	.LC77
	.align	3
.LC134:
	.xword	.LC79
	.align	3
.LC135:
	.xword	.LC81
	.align	3
.LC136:
	.xword	.LC83
	.align	3
.LC137:
	.xword	.LC85
	.align	3
.LC138:
	.xword	.LC87
	.align	3
.LC139:
	.xword	.LC89
	.align	3
.LC140:
	.xword	.LC91
	.align	3
.LC141:
	.xword	.LC93
	.align	3
.LC142:
	.xword	.LC95
	.align	3
.LC143:
	.xword	.LC97
	.align	3
.LC144:
	.xword	.LC99
	.align	3
.LC145:
	.xword	.LC101
	.align	3
.LC146:
	.xword	.LC103
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_user_data
	.type	AVS_user_data, %function
AVS_user_data:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 12288
	mov	w22, w1
	add	x20, x21, 2648
	bl	_mcount
	ldr	x2, .LC148
	mov	w1, 32
	ldr	x0, [x20, 520]
	bl	avs_f_v
	ldr	w0, [x20, 124]
	orr	w0, w0, 1048576
	str	w0, [x20, 124]
	cbnz	w22, .L138
	ldr	x1, [x20, 824]
	cbz	x1, .L139
	ldr	w0, [x19, 4]
	bl	FreeUsdByDec
	str	xzr, [x20, 824]
.L139:
	ldr	w0, [x19, 4]
	bl	GetUsd
	str	x0, [x21, 3472]
	add	x1, x21, 2648
	cbz	x0, .L149
	ldr	x3, [x19, 16]
	mov	w2, 10
	add	x20, x19, 16384
	ldr	x3, [x3, 32]
	str	x3, [x0, 1056]
	ldr	x0, [x1, 824]
	str	w2, [x0, 1040]
	ldr	x0, [x1, 824]
	ldr	w2, [x1, 132]
	str	w2, [x0, 1044]
	ldr	x2, [x1, 824]
	ldr	w0, [x20, 460]
	sub	w0, w0, #4
	str	w0, [x2, 1052]
	ldr	x0, [x1, 824]
	ldr	w2, [x0, 1052]
	cmp	w2, 1024
	ble	.L142
	mov	w2, 1024
	str	w2, [x0, 1052]
	ldr	x0, [x1, 824]
	ldr	w2, [x0, 1052]
.L142:
	ldr	x22, .LC149
	sxtw	x2, w2
	ldr	x1, [x19, 16824]
	ldr	x3, [x22, 104]
	add	x1, x1, 4
	blr	x3
	ldrb	w0, [x20, 450]
	cbnz	w0, .L144
	ldr	x2, [x21, 3472]
	ldr	w0, [x20, 548]
	ldr	w3, [x2, 1052]
	add	w0, w3, w0
	str	w0, [x2, 1052]
	ldr	x3, [x21, 3472]
	ldr	w2, [x3, 1052]
	cmp	w2, 1024
	ble	.L145
	mov	w0, 1024
	str	w0, [x3, 1052]
	ldr	x3, [x21, 3472]
	ldr	w2, [x3, 1052]
.L145:
	ldr	w1, [x20, 460]
	sub	w2, w2, w1
	cmn	w2, #4
	beq	.L144
	uxtw	x1, w1
	ldr	x4, [x22, 104]
	sub	x0, x1, #4
	ldr	x1, [x19, 16912]
	add	w2, w2, 4
	add	x0, x3, x0
	blr	x4
.L144:
	ldr	x0, .LC150
	ldr	x4, [x0]
	cbz	x4, .L174
	ldr	x2, [x21, 3472]
	mov	w3, 1064
	ldr	w0, [x19, 4]
	mov	w1, 5
	blr	x4
.L174:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L138:
	ldr	x1, [x20, 832]
	cbz	x1, .L148
	ldr	w0, [x19, 4]
	bl	FreeUsdByDec
	str	xzr, [x20, 832]
.L148:
	ldr	w0, [x19, 4]
	bl	GetUsd
	str	x0, [x21, 3480]
	cbz	x0, .L149
	ldr	x3, [x19, 16]
	mov	w2, 11
	add	x20, x19, 16384
	ldr	x3, [x3, 32]
	str	x3, [x0, 1056]
	ldr	x0, [x21, 3480]
	str	w2, [x0, 1040]
	ldr	x0, [x21, 3480]
	ldr	w2, [x21, 2780]
	str	w2, [x0, 1044]
	ldr	x2, [x21, 3480]
	ldr	w0, [x20, 460]
	sub	w0, w0, #4
	str	w0, [x2, 1052]
	ldr	x0, [x21, 3480]
	ldr	w2, [x0, 1052]
	cmp	w2, 1024
	ble	.L150
	mov	w2, 1024
	str	w2, [x0, 1052]
	ldr	x0, [x21, 3480]
	ldr	w2, [x0, 1052]
.L150:
	ldr	x22, .LC149
	sxtw	x2, w2
	ldr	x1, [x19, 16824]
	ldr	x3, [x22, 104]
	add	x1, x1, 4
	blr	x3
	ldrb	w0, [x20, 450]
	cbnz	w0, .L152
	ldr	x2, [x21, 3480]
	ldr	w0, [x20, 548]
	ldr	w3, [x2, 1052]
	add	w0, w3, w0
	str	w0, [x2, 1052]
	ldr	x3, [x21, 3480]
	ldr	w2, [x3, 1052]
	cmp	w2, 1024
	ble	.L153
	mov	w0, 1024
	str	w0, [x3, 1052]
	ldr	x3, [x21, 3480]
	ldr	w2, [x3, 1052]
.L153:
	ldr	w1, [x20, 460]
	sub	w2, w2, w1
	cmn	w2, #4
	beq	.L152
	uxtw	x1, w1
	ldr	x4, [x22, 104]
	sub	x0, x1, #4
	ldr	x1, [x19, 16912]
	add	w2, w2, 4
	add	x0, x3, x0
	blr	x4
.L152:
	ldr	x0, .LC150
	ldr	x4, [x0]
	cbz	x4, .L174
	ldr	x2, [x21, 3480]
	mov	w3, 1064
	ldr	w0, [x19, 4]
	mov	w1, 5
	blr	x4
	b	.L174
	.p2align 3
.L149:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS_user_data, .-AVS_user_data
	.align	3
.LC148:
	.xword	.LC147
	.align	3
.LC149:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC150:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_sequence_display_extension
	.type	AVS_sequence_display_extension, %function
AVS_sequence_display_extension:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x19, [x21, 520]
	mov	w1, 4
	ldr	x2, .LC152
	mov	x0, x19
	bl	avs_u_v
	ldr	x2, .LC154
	mov	w1, 3
	mov	x0, x19
	bl	avs_u_v
	strb	w0, [x20, 50]
	ldr	x2, .LC156
	mov	w1, 1
	mov	x0, x19
	bl	avs_u_v
	strb	w0, [x20, 51]
	ldr	x2, .LC158
	mov	w1, 1
	mov	x0, x19
	bl	avs_u_v
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x20, 52]
	beq	.L178
.L177:
	ldr	x2, .LC166
	mov	w1, 14
	mov	x0, x19
	bl	avs_u_v
	str	w0, [x20, 68]
	ldr	x2, .LC167
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	strb	w0, [x20, 49]
	ldr	x2, .LC169
	mov	w1, 14
	mov	x0, x19
	bl	avs_u_v
	str	w0, [x20, 72]
	ldr	x2, .LC170
	mov	w1, 2
	mov	x0, x19
	bl	avs_u_v
	strb	w0, [x20, 48]
	mov	x0, x19
	bl	AVS_next_start_code
	ldr	w1, [x21, 124]
	mov	w0, 1
	orr	w1, w1, 131072
	str	w1, [x21, 124]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L178:
	ldr	x2, .LC160
	mov	w1, 8
	mov	x0, x19
	bl	avs_u_v
	str	w0, [x20, 56]
	ldr	x2, .LC162
	mov	w1, 8
	mov	x0, x19
	bl	avs_u_v
	str	w0, [x20, 60]
	ldr	x2, .LC164
	mov	w1, 8
	mov	x0, x19
	bl	avs_u_v
	str	w0, [x20, 64]
	b	.L177
	.size	AVS_sequence_display_extension, .-AVS_sequence_display_extension
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
.LC158:
	.xword	.LC157
	.align	3
.LC160:
	.xword	.LC159
	.align	3
.LC162:
	.xword	.LC161
	.align	3
.LC164:
	.xword	.LC163
	.align	3
.LC166:
	.xword	.LC165
	.align	3
.LC167:
	.xword	.LC27
	.align	3
.LC169:
	.xword	.LC168
	.align	3
.LC170:
	.xword	.LC35
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_copyright_extension
	.type	AVS_copyright_extension, %function
AVS_copyright_extension:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x19, [x20, 520]
	mov	w1, 4
	ldr	x2, .LC171
	mov	x0, x19
	bl	avs_u_v
	ldr	x2, .LC173
	mov	w1, 1
	mov	x0, x19
	bl	avs_u_v
	ldr	x2, .LC175
	mov	w1, 8
	mov	x0, x19
	bl	avs_u_v
	ldr	x2, .LC177
	mov	w1, 1
	mov	x0, x19
	bl	avs_u_v
	ldr	x2, .LC178
	mov	w1, 7
	mov	x0, x19
	bl	avs_u_v
	ldr	x21, .LC179
	mov	w1, 1
	mov	x0, x19
	mov	x2, x21
	bl	avs_f_v
	ldr	x2, .LC181
	mov	w1, 20
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x21
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC183
	mov	w1, 22
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x21
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC185
	mov	w1, 22
	mov	x0, x19
	bl	avs_u_v
	mov	x0, x19
	bl	AVS_next_start_code
	ldr	w1, [x20, 124]
	mov	w0, 1
	orr	w1, w1, 2097152
	str	w1, [x20, 124]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS_copyright_extension, .-AVS_copyright_extension
	.align	3
.LC171:
	.xword	.LC151
	.align	3
.LC173:
	.xword	.LC172
	.align	3
.LC175:
	.xword	.LC174
	.align	3
.LC177:
	.xword	.LC176
	.align	3
.LC178:
	.xword	.LC35
	.align	3
.LC179:
	.xword	.LC27
	.align	3
.LC181:
	.xword	.LC180
	.align	3
.LC183:
	.xword	.LC182
	.align	3
.LC185:
	.xword	.LC184
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_camera_parameters_extension
	.type	AVS_camera_parameters_extension, %function
AVS_camera_parameters_extension:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	ldr	x19, [x21, 520]
	mov	w1, 4
	ldr	x2, .LC186
	mov	x0, x19
	bl	avs_u_v
	ldr	x22, .LC187
	mov	w1, 1
	mov	x0, x19
	mov	x2, x22
	bl	avs_u_v
	ldr	x2, .LC189
	mov	w1, 7
	mov	x0, x19
	bl	avs_u_v
	ldr	x20, .LC190
	mov	w1, 1
	mov	x0, x19
	mov	x2, x20
	bl	avs_f_v
	ldr	x2, .LC192
	mov	w1, 22
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC194
	mov	w1, 22
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC196
	mov	w1, 22
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC198
	mov	w1, 22
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC200
	mov	w1, 16
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC202
	mov	w1, 16
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC204
	mov	w1, 16
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC206
	mov	w1, 16
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC208
	mov	w1, 16
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC210
	mov	w1, 16
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC212
	mov	w1, 22
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC214
	mov	w1, 22
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC216
	mov	w1, 22
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC218
	mov	w1, 22
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC220
	mov	w1, 22
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC222
	mov	w1, 22
	mov	x0, x19
	bl	avs_u_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x22
	mov	w1, 32
	mov	x0, x19
	bl	avs_u_v
	mov	x0, x19
	bl	AVS_next_start_code
	ldr	w1, [x21, 124]
	mov	w0, 1
	orr	w1, w1, 4194304
	str	w1, [x21, 124]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS_camera_parameters_extension, .-AVS_camera_parameters_extension
	.align	3
.LC186:
	.xword	.LC151
	.align	3
.LC187:
	.xword	.LC35
	.align	3
.LC189:
	.xword	.LC188
	.align	3
.LC190:
	.xword	.LC27
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
.LC214:
	.xword	.LC213
	.align	3
.LC216:
	.xword	.LC215
	.align	3
.LC218:
	.xword	.LC217
	.align	3
.LC220:
	.xword	.LC219
	.align	3
.LC222:
	.xword	.LC221
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_picture_display_extension
	.type	AVS_picture_display_extension, %function
AVS_picture_display_extension:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x26, x0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	ldr	x19, [x26, 520]
	mov	w1, 4
	ldr	x2, .LC223
	mov	x0, x19
	bl	avs_u_v
	ldrb	w0, [x22, 15]
	cmp	w0, 1
	beq	.L198
	ldrb	w0, [x22, 81]
	cbnz	w0, .L199
.L183:
	mov	w0, 1
	str	w0, [x22, 4]
.L185:
	ldr	x25, .LC225
	mov	w20, 0
	ldr	x23, .LC226
	ldr	x24, .LC228
	.p2align 2
.L187:
	add	x21, x22, x20, sxtw 2
	mov	x2, x25
	mov	w1, 16
	mov	x0, x19
	add	w20, w20, 1
	bl	avs_u_v
	str	w0, [x21, 352]
	mov	w1, 1
	mov	x2, x23
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x24
	mov	w1, 16
	mov	x0, x19
	bl	avs_u_v
	str	w0, [x21, 364]
	mov	x2, x23
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	w0, [x22, 4]
	cmp	w0, w20
	bgt	.L187
	mov	x0, x19
	bl	AVS_next_start_code
	ldr	w0, [x26, 124]
	orr	w0, w0, 524288
	str	w0, [x26, 124]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L199:
	ldrb	w0, [x22, 83]
	cmp	w0, 1
	beq	.L186
.L184:
	mov	w0, 2
	str	w0, [x22, 4]
	b	.L185
	.p2align 3
.L198:
	ldrb	w0, [x22, 83]
	cmp	w0, 1
	bne	.L183
	ldrb	w0, [x22, 82]
	cmp	w0, 1
	bne	.L184
	.p2align 2
.L186:
	mov	w0, 3
	str	w0, [x22, 4]
	b	.L185
	.size	AVS_picture_display_extension, .-AVS_picture_display_extension
	.align	3
.LC223:
	.xword	.LC151
	.align	3
.LC225:
	.xword	.LC224
	.align	3
.LC226:
	.xword	.LC27
	.align	3
.LC228:
	.xword	.LC227
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_extension
	.type	AVS_extension, %function
AVS_extension:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x19, [x20, 520]
	mov	w1, 32
	ldr	x2, .LC230
	mov	x0, x19
	bl	avs_f_v
	mov	w1, 4
	mov	x0, x19
	bl	BsShow
	sub	w0, w0, #2
	cmp	w0, 9
	bls	.L208
.L201:
	mov	w1, 4
	mov	x0, x19
	bl	BsSkip
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L208:
	ldr	x1, .LC231
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx203
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx203:
	.section	.rodata
	.align	0
	.align	2
.L203:
	.byte	(.L202 - .Lrtx203) / 4
	.byte	(.L201 - .Lrtx203) / 4
	.byte	(.L204 - .Lrtx203) / 4
	.byte	(.L201 - .Lrtx203) / 4
	.byte	(.L201 - .Lrtx203) / 4
	.byte	(.L205 - .Lrtx203) / 4
	.byte	(.L201 - .Lrtx203) / 4
	.byte	(.L201 - .Lrtx203) / 4
	.byte	(.L201 - .Lrtx203) / 4
	.byte	(.L206 - .Lrtx203) / 4
	.text
	.p2align 3
.L206:
	mov	x1, x21
	mov	x0, x20
	bl	AVS_camera_parameters_extension
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L205:
	mov	x1, x21
	mov	x0, x20
	bl	AVS_picture_display_extension
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L204:
	mov	x1, x21
	mov	x0, x20
	bl	AVS_copyright_extension
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L202:
	mov	x1, x21
	mov	x0, x20
	bl	AVS_sequence_display_extension
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS_extension, .-AVS_extension
	.align	3
.LC230:
	.xword	.LC229
	.align	3
.LC231:
	.xword	.L203
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_AllocateVHB
	.type	AVS_AllocateVHB, %function
AVS_AllocateVHB:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC232
	mov	x2, 36
	mov	w1, 0
	add	x0, x29, 56
	ldr	w21, [x19, 15100]
	ldr	x3, [x3, 96]
	ldr	w20, [x19, 15104]
	blr	x3
	ldr	x4, [x19, 16]
	mov	w3, 4
	stp	w21, w20, [x29, 72]
	mov	w5, 6
	str	w5, [x29, 56]
	ldr	w6, [x4, 16]
	mov	w2, 0
	ldr	w0, [x19, 4]
	add	x1, x29, 56
	cmp	w6, 24
	csinc	w5, w3, wzr, ne
	str	w5, [x29, 80]
	mov	w5, 8
	strb	w5, [x29, 61]
	ldr	w4, [x4, 16]
	stp	w21, w20, [x29, 64]
	cmp	w4, 24
	csinc	w3, w3, wzr, ne
	str	w3, [x29, 84]
	bl	FSP_ArrangeFsPool
	cmp	w0, 2
	beq	.L217
	cbnz	w0, .L218
	mov	w0, 1
	str	w0, [x19, 8]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L217:
	add	x0, x19, 12288
	add	x0, x0, 3920
	bl	ResetVoQueue
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	mov	w0, 3
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L218:
	ldr	x3, .LC233
	mov	w1, 1262
	ldr	x2, .LC235
	mov	w0, 0
	bl	dprint_normal
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 96
	ret
	.size	AVS_AllocateVHB, .-AVS_AllocateVHB
	.align	3
.LC232:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC233:
	.xword	.LANCHOR1
	.align	3
.LC235:
	.xword	.LC234
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_StartDecode
	.type	AVS_StartDecode, %function
AVS_StartDecode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	add	x19, x22, 32
	add	x21, x22, 16384
	bl	_mcount
	add	x20, x21, 616
	ldr	w0, [x22, 4]
	str	w0, [x19, 76]
	ldr	w1, [x21, 616]
	strb	w1, [x22, 32]
	ldr	w1, [x20, 4]
	strb	w1, [x19, 1]
	ldr	w1, [x20, 8]
	strb	w1, [x19, 2]
	ldr	w1, [x20, 12]
	strb	w1, [x19, 3]
	ldr	w1, [x20, 16]
	strb	w1, [x19, 4]
	ldr	w1, [x20, 28]
	str	w1, [x19, 8]
	ldr	w1, [x20, 32]
	str	w1, [x19, 80]
	ldr	w1, [x20, 52]
	str	w1, [x19, 12]
	ldr	w1, [x20, 56]
	str	w1, [x19, 16]
	ldr	w1, [x20, 184]
	str	w1, [x19, 92]
	ldr	w1, [x20, 196]
	str	w1, [x19, 96]
	ldr	w1, [x20, 188]
	str	w1, [x19, 100]
	ldr	w1, [x20, 200]
	str	w1, [x19, 104]
	ldr	w1, [x20, 192]
	str	w1, [x19, 108]
	ldr	w1, [x20, 204]
	str	w1, [x19, 112]
	ldr	w1, [x20, 64]
	strh	w1, [x19, 72]
	ldr	w1, [x20, 60]
	strh	w1, [x19, 74]
	ldr	w1, [x20, 68]
	strb	w1, [x19, 43]
	ldr	w1, [x20, 72]
	strb	w1, [x19, 44]
	ldr	w1, [x20, 108]
	strb	w1, [x19, 20]
	ldr	w1, [x20, 112]
	strb	w1, [x19, 21]
	ldr	w1, [x20, 76]
	strb	w1, [x19, 22]
	ldr	w1, [x20, 80]
	strb	w1, [x19, 23]
	ldr	w1, [x20, 88]
	strb	w1, [x19, 24]
	ldr	w1, [x20, 92]
	strb	w1, [x19, 25]
	ldr	w1, [x20, 96]
	strb	w1, [x19, 26]
	ldr	w1, [x20, 100]
	strb	w1, [x19, 27]
	ldr	w1, [x20, 104]
	strb	w1, [x19, 28]
	ldr	w1, [x20, 116]
	strb	w1, [x19, 29]
	ldr	w1, [x20, 120]
	strb	w1, [x19, 30]
	ldr	w1, [x20, 124]
	strb	w1, [x19, 31]
	ldr	w1, [x20, 128]
	strb	w1, [x19, 32]
	ldr	w1, [x20, 132]
	strb	w1, [x19, 33]
	ldr	w1, [x20, 176]
	strb	w1, [x19, 34]
	ldr	w1, [x20, 84]
	strb	w1, [x19, 35]
	ldr	w1, [x20, 140]
	strb	w1, [x19, 36]
	ldr	w1, [x20, 136]
	strb	w1, [x19, 37]
	ldr	w1, [x20, 156]
	strb	w1, [x19, 38]
	ldr	w1, [x20, 152]
	strb	w1, [x19, 39]
	ldr	w1, [x20, 148]
	strb	w1, [x19, 40]
	ldr	w1, [x20, 144]
	strb	w1, [x19, 41]
	ldr	w1, [x20, 180]
	strb	w1, [x19, 42]
	ldr	w1, [x20, 160]
	str	w1, [x19, 120]
	ldr	w1, [x20, 164]
	str	w1, [x19, 124]
	ldr	w1, [x20, 168]
	str	w1, [x19, 128]
	ldr	w1, [x20, 236]
	str	w1, [x19, 136]
	ldr	w1, [x20, 248]
	str	w1, [x19, 140]
	ldr	x1, [x22, 15016]
	ldr	w1, [x1, 4]
	bl	FSP_GetLogicFs
	cbz	x0, .L233
	ldr	x4, [x0, 24]
	add	x2, x21, 1000
	add	x1, x22, 312
	add	x3, x22, 568
	ldr	w4, [x4, 44]
	str	w4, [x19, 536]
	ldr	x4, [x0, 24]
	ldr	w4, [x4, 72]
	str	w4, [x19, 540]
	ldr	x4, [x0, 24]
	ldr	w4, [x4, 64]
	str	w4, [x19, 544]
	ldr	x4, [x0, 24]
	ldr	w4, [x4, 68]
	str	w4, [x19, 548]
	ldrb	w0, [x0, 424]
	strb	w0, [x19, 52]
	ldr	w0, [x20, 52]
	str	w0, [x19, 132]
	ldr	w0, [x20, 172]
	str	w0, [x19, 144]
	ldr	w0, [x20, 380]
	str	w0, [x19, 148]
	ldr	w0, [x20, 208]
	strb	w0, [x19, 45]
	ldr	w0, [x20, 212]
	strb	w0, [x19, 46]
	ldr	w0, [x20, 220]
	strb	w0, [x19, 47]
	ldr	w0, [x20, 216]
	strb	w0, [x19, 48]
	ldr	w0, [x20, 224]
	strb	w0, [x19, 49]
	ldr	w0, [x20, 228]
	strb	w0, [x19, 50]
	ldr	w0, [x20, 232]
	strb	w0, [x19, 51]
	.p2align 2
.L222:
	ldrsh	w0, [x2], 2
	str	w0, [x1], 4
	cmp	x1, x3
	bne	.L222
	ldr	w0, [x21, 652]
	add	x3, x21, 996
	str	w0, [x19, 552]
	add	x0, x21, 868
	ldr	w2, [x21, 656]
	str	w2, [x19, 556]
	ldr	w2, [x21, 660]
	str	w2, [x19, 560]
	ldr	w1, [x21, 664]
	str	w1, [x19, 564]
	.p2align 2
.L223:
	sub	x1, x0, #16384
	ldr	w2, [x0]
	sub	x1, x1, #684
	add	x0, x0, 4
	cmp	x0, x3
	str	w2, [x1]
	bne	.L223
	ldr	w0, [x22, 15752]
	ldr	x1, [x22, 16]
	add	w0, w0, 1
	str	x19, [x22, 24]
	str	w0, [x22, 15752]
	ldr	w0, [x1, 880]
	cmp	w0, 1
	beq	.L234
	cmp	w0, 2
	beq	.L235
.L226:
	mov	w0, 1
.L221:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L235:
	ldr	w0, [x1, 884]
	cmp	w0, wzr
	ccmp	x19, xzr, 4, gt
	beq	.L226
	ldr	x1, [x22, 15016]
	mov	w0, 1
	ldrb	w2, [x1, 1]
	cmp	w2, 2
	bne	.L221
	str	xzr, [x22, 24]
	mov	w2, 0
	ldr	w0, [x22, 4]
	ldr	w1, [x1, 4]
	bl	FSP_SetDisplay
	ldr	x2, [x22, 16]
	mov	w0, 0
	ldr	w1, [x2, 884]
	sub	w1, w1, #1
	str	w1, [x2, 884]
	b	.L221
.L234:
	cbz	x19, .L221
	ldr	x1, [x22, 15016]
	ldrb	w2, [x1, 1]
	cmp	w2, 2
	bne	.L221
	str	xzr, [x22, 24]
	mov	w2, 0
	ldr	w0, [x22, 4]
	ldr	w1, [x1, 4]
	bl	FSP_SetDisplay
	mov	w0, 0
	b	.L221
.L233:
	mov	w3, 1645
	ldr	x2, .LC239
	mov	w1, w3
	bl	dprint_normal
	mov	w0, 0
	b	.L221
	.size	AVS_StartDecode, .-AVS_StartDecode
	.align	3
.LC239:
	.xword	.LC238
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_SetImgFormat
	.type	AVS_SetImgFormat, %function
AVS_SetImgFormat:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	add	x23, x19, 12288
	bl	_mcount
	ldrb	w1, [x23, 2803]
	ldrb	w22, [x23, 2838]
	cmp	w1, 1
	ldr	w24, [x23, 3136]
	beq	.L241
	ldrb	w0, [x23, 2868]
	cmp	w0, 1
	cset	w21, ne
.L237:
	ldrb	w0, [x23, 2801]
	mov	w25, 0
	ldrb	w20, [x23, 2870]
	sub	w0, w0, #1
	uxtb	w0, w0
	cmp	w0, 3
	bhi	.L238
	ldr	x1, .LC240
	add	x0, x1, x0, uxtb 2
	ldr	w25, [x0, 16]
.L238:
	add	x26, x23, 2648
	ldr	x1, [x26, 80]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L243
	ldrb	w1, [x0, 156]
	ldrb	w2, [x0, 157]
	bfi	w1, w24, 0, 2
	bfi	w2, w21, 0, 2
	and	w1, w1, -29
	orr	w2, w2, 12
	bfi	w1, w22, 5, 3
	bfi	w2, w20, 4, 2
	strb	w1, [x0, 156]
	strb	w2, [x0, 157]
	mov	w1, w25
	ldr	w2, [x0, 156]
	bfi	w2, w25, 14, 3
	str	w2, [x0, 156]
	ldr	w2, [x26, 808]
	str	w2, [x0, 96]
	stp	w24, w24, [x0, 24]
	bl	SetAspectRatio
	ldr	w0, [x23, 2832]
	str	w0, [x19, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L241:
	mov	w21, 0
	b	.L237
	.p2align 3
.L243:
	mov	w3, 1752
	ldr	x2, .LC242
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	AVS_SetImgFormat, .-AVS_SetImgFormat
	.align	3
.LC240:
	.xword	.LANCHOR1
	.align	3
.LC242:
	.xword	.LC241
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_GetImageBuffer
	.type	AVS_GetImageBuffer, %function
AVS_GetImageBuffer:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 12288
	bl	_mcount
	ldr	w0, [x20, 16180]
	cmp	w0, 2
	beq	.L245
	ldr	w19, [x21, 3180]
	add	x2, x21, 2648
	add	w1, w19, 1
	sxtw	x19, w19
	asr	w3, w1, 31
	lsl	x0, x19, 2
	lsr	w3, w3, 30
	sub	x19, x0, x19
	add	w1, w1, w3
	and	w1, w1, 3
	add	x19, x2, x19, lsl 2
	sub	w1, w1, w3
	add	x19, x19, 20
	str	w1, [x21, 3180]
	str	x19, [x21, 2728]
	mov	w1, 0
	ldr	w0, [x20, 4]
	bl	FSP_NewLogicFs
	str	w0, [x19, 4]
	ldr	x0, [x21, 2728]
	ldr	w1, [x0, 4]
	tbnz	w1, #31, .L254
.L247:
	ldr	w0, [x20, 4]
	bl	FSP_GetLogicFs
	cbz	x0, .L255
	str	wzr, [x0, 152]
	mov	w0, 1
.L249:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L245:
	add	x19, x21, 2716
	str	x19, [x21, 2728]
	mov	w1, 0
	ldr	w0, [x20, 4]
	bl	FSP_NewLogicFs
	str	w0, [x19, 4]
	ldr	x0, [x21, 2728]
	ldr	w1, [x0, 4]
	tbz	w1, #31, .L247
.L254:
	ldr	x2, .LC244
	mov	w1, 1796
	mov	w0, 0
	bl	dprint_normal
	ldr	x1, [x21, 2736]
	ldr	w0, [x20, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L248
	ldr	x1, [x21, 2728]
	add	x23, x21, 2656
	ldr	w0, [x20, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x21, 2736]
	ldr	w0, [x20, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x21, 2744]
	ldr	w0, [x20, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x21, 2752]
	ldr	w0, [x20, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	w0, [x20, 4]
	ldr	x1, [x19, 168]
	bl	FreeUsdByDec
	ldr	w0, [x20, 4]
	ldr	x1, [x19, 176]
	bl	FreeUsdByDec
	ldr	w0, [x20, 4]
	ldr	x1, [x19, 184]
	bl	FreeUsdByDec
	ldr	w0, [x20, 4]
	ldr	x1, [x19, 192]
	bl	FreeUsdByDec
	add	x0, x21, 2560
	stp	xzr, xzr, [x19, 168]
	stp	xzr, xzr, [x19, 184]
	stp	x23, x23, [x0, 168]
	stp	x23, x23, [x0, 184]
	ldr	w0, [x20, 4]
	bl	FSP_GetNullLogicFs
	str	w0, [x23, 4]
.L248:
	str	wzr, [x21, 3452]
	add	x1, x21, 3920
	ldr	w0, [x20, 4]
	bl	FSP_ClearNotInVoQueue
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L255:
	mov	w3, 1810
	ldr	x2, .LC245
	mov	w1, w3
	bl	dprint_normal
	mov	w0, 0
	b	.L249
	.size	AVS_GetImageBuffer, .-AVS_GetImageBuffer
	.align	3
.LC244:
	.xword	.LC243
	.align	3
.LC245:
	.xword	.LC238
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_OutputOneFrame
	.type	AVS_OutputOneFrame, %function
AVS_OutputOneFrame:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 4]
	ldr	w1, [x20, 4]
	bl	FSP_GetFsImagePtr
	mov	x21, x0
	cbz	x0, .L262
	ldr	w0, [x19, 4]
	mov	w2, 1
	ldr	w1, [x20, 4]
	bl	FSP_SetDisplay
	add	x3, x19, 12288
	ldr	w0, [x19, 4]
	mov	x4, x21
	add	x3, x3, 3920
	mov	x2, x19
	mov	w1, 6
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L258
	ldr	w0, [x19, 4]
	mov	w2, 0
	ldr	w1, [x20, 4]
	bl	FSP_SetDisplay
	ldr	x2, .LC249
	mov	w1, 1835
	ldr	w3, [x20, 4]
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
.L258:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L262:
	mov	w3, 1828
	ldr	x2, .LC247
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS_OutputOneFrame, .-AVS_OutputOneFrame
	.align	3
.LC247:
	.xword	.LC246
	.align	3
.LC249:
	.xword	.LC248
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_UpdateTableIdx2Dist
	.type	AVS_UpdateTableIdx2Dist, %function
AVS_UpdateTableIdx2Dist:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 221]
	cmp	w0, 1
	ldr	w0, [x19, 488]
	beq	.L275
	cbnz	w0, .L269
	ldr	x0, [x19, 88]
	ldr	w0, [x0, 8]
	lsl	w0, w0, 1
	str	w0, [x19, 576]
.L268:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L269:
	cmp	w0, 1
	bne	.L270
	ldr	x0, [x19, 96]
	add	x1, x19, 8
	cmp	x0, x1
	beq	.L276
	ldr	w0, [x0, 8]
	lsl	w0, w0, 1
	str	w0, [x19, 572]
.L272:
	ldp	x2, x1, [x19, 80]
	add	w0, w0, 1
	str	w0, [x19, 568]
	ldr	w1, [x1, 8]
	str	w0, [x19, 588]
	lsl	w0, w1, 1
	str	w0, [x19, 564]
	add	w1, w0, 1
	str	w0, [x19, 584]
	str	w1, [x19, 560]
	str	w1, [x19, 580]
	ldr	w0, [x2, 8]
	lsl	w0, w0, 1
	str	w0, [x19, 576]
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L275:
	cmp	w0, 1
	beq	.L277
	cmp	w0, 2
	bne	.L268
	ldr	x0, [x19, 96]
	add	x1, x19, 8
	cmp	x0, x1
	beq	.L267
	ldr	w0, [x0, 8]
	lsl	w0, w0, 1
	str	w0, [x19, 560]
.L267:
	ldr	x0, [x19, 88]
	ldr	w0, [x0, 8]
	lsl	w0, w0, 1
	str	w0, [x19, 568]
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L270:
	cmp	w0, 2
	bne	.L268
	ldr	x0, [x19, 96]
	add	x1, x19, 8
	cmp	x0, x1
	beq	.L278
	ldr	w1, [x0, 8]
	lsl	w1, w1, 1
	str	w1, [x19, 564]
.L274:
	ldr	x0, [x19, 88]
	add	w2, w1, 1
	str	w2, [x19, 560]
	ldr	w0, [x0, 8]
	str	w1, [x19, 580]
	lsl	w0, w0, 1
	str	w2, [x19, 576]
	str	w0, [x19, 568]
	add	w1, w0, 1
	str	w0, [x19, 584]
	mov	w0, 1
	str	w1, [x19, 572]
	str	w1, [x19, 588]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L277:
	ldp	x0, x1, [x19, 88]
	add	x2, x19, 8
	cmp	x1, x2
	ldr	w0, [x0, 8]
	lsl	w0, w0, 1
	str	w0, [x19, 560]
	beq	.L268
	ldr	w0, [x1, 8]
	lsl	w0, w0, 1
	str	w0, [x19, 564]
	b	.L268
	.p2align 3
.L276:
	ldr	w0, [x19, 572]
	b	.L272
	.p2align 3
.L278:
	ldr	w1, [x19, 564]
	b	.L274
	.size	AVS_UpdateTableIdx2Dist, .-AVS_UpdateTableIdx2Dist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_UpdateTableMvEScale
	.type	AVS_UpdateTableMvEScale, %function
AVS_UpdateTableMvEScale:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 221]
	cmp	w0, 1
	beq	.L339
	ldr	w5, [x19, 488]
	cbz	w5, .L340
	cmp	w5, 1
	bne	.L292
	ldr	x12, [x19, 80]
	mov	w9, 0
	mov	w7, 4
	mov	w11, 0
	mov	w10, 512
.L297:
	ldr	w6, [x12, 8]
	lsl	w5, w9, 2
	sub	w5, w5, w9
	mov	w8, w9
	add	w6, w11, w6, lsl 1
.L293:
	add	x0, x19, x8, sxtw 2
	mov	w1, w9
	ldr	w4, [x0, 560]
	sub	w4, w6, w4
	and	w4, w4, 511
.L295:
	add	x0, x19, x1, sxtw 2
	add	w3, w5, w1
	mov	w2, 1
	add	x3, x19, x3, sxtw 2
	add	w1, w1, w2
	ldr	w0, [x0, 560]
	sub	w0, w6, w0
	ands	w0, w0, 511
	beq	.L294
	sdiv	w2, w10, w0
.L294:
	mul	w2, w4, w2
	cmp	w1, w7
	str	w2, [x3, 592]
	bne	.L295
	add	w8, w8, 1
	add	w5, w5, 4
	cmp	w8, w7
	bne	.L293
	add	w11, w11, 1
	add	w7, w7, 4
	cmp	w11, 2
	add	w9, w9, 4
	bne	.L297
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L340:
	mov	w0, 512
	str	w0, [x19, 656]
.L284:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L339:
	ldr	x1, [x19, 80]
	ldr	w2, [x19, 488]
	ldr	w1, [x1, 8]
	cmp	w2, 1
	lsl	w1, w1, 1
	beq	.L341
	cmp	w2, 2
	bne	.L284
	ldr	w2, [x19, 560]
	sub	w2, w1, w2
	ands	w2, w2, 511
	beq	.L289
	mov	w0, 512
	sdiv	w0, w0, w2
.L289:
	ldr	w3, [x19, 568]
	mul	w0, w2, w0
	sub	w1, w3, w1
	str	w0, [x19, 592]
	ands	w1, w1, 511
	mov	w0, 1
	beq	.L290
	mov	w0, 512
	sdiv	w0, w0, w1
.L290:
	mul	w1, w1, w0
	str	w1, [x19, 608]
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L292:
	cmp	w5, 2
	bne	.L284
	ldr	x9, [x19, 80]
	add	x4, x19, 572
	mov	w7, 9
	mov	w6, 0
	mov	w8, 512
.L307:
	ldr	w1, [x9, 8]
	lsl	w10, w6, 2
	lsl	w3, w6, 3
	add	w1, w6, w1, lsl 1
.L298:
	add	x11, x19, x10, sxtw 2
	ldr	w2, [x4, -12]
	mov	w12, 1
	add	x13, x19, x3, sxtw 2
	sub	w2, w1, w2
	ldr	w0, [x11, 560]
	ands	w2, w2, 511
	mov	w11, w12
	sub	w0, w1, w0
	and	w0, w0, 511
	beq	.L300
	sdiv	w11, w8, w2
.L300:
	mul	w11, w11, w0
	str	w11, [x13, 592]
	ldr	w2, [x4, -8]
	sub	w2, w1, w2
	ands	w2, w2, 511
	beq	.L301
	sdiv	w12, w8, w2
.L301:
	add	w2, w3, 1
	add	w10, w10, 1
	mul	w0, w0, w12
	add	x2, x19, x2, sxtw 2
	cmp	w5, w10
	add	w3, w3, 2
	str	w0, [x2, 592]
	bne	.L298
	sub	w10, w7, #4
	mov	w12, w5
.L299:
	add	x11, x19, x12, sxtw 2
	ldr	w2, [x4, -4]
	sub	w3, w10, #1
	mov	w13, 1
	sub	w2, w2, w1
	ldr	w0, [x11, 560]
	ands	w2, w2, 511
	add	x3, x19, x3, sxtw 2
	mov	w11, w13
	sub	w0, w0, w1
	and	w0, w0, 511
	beq	.L304
	sdiv	w11, w8, w2
.L304:
	mul	w11, w11, w0
	str	w11, [x3, 592]
	ldr	w2, [x4]
	sub	w2, w2, w1
	ands	w2, w2, 511
	beq	.L305
	sdiv	w13, w8, w2
.L305:
	add	x2, x19, x10, sxtw 2
	add	w10, w10, 2
	mul	w0, w0, w13
	cmp	w10, w7
	add	w12, w12, 1
	str	w0, [x2, 592]
	bne	.L299
	add	w6, w6, 1
	add	w7, w7, 8
	cmp	w6, 2
	add	x4, x4, 16
	add	w5, w5, 4
	bne	.L307
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L341:
	add	x5, x19, 560
	add	x3, x19, 596
	add	x7, x19, 628
	mov	w8, 512
.L283:
	ldr	w2, [x19, 560]
	mov	w6, 1
	ldr	w0, [x5]
	mov	w4, w6
	sub	w2, w1, w2
	ands	w2, w2, 511
	sub	w0, w1, w0
	and	w0, w0, 511
	beq	.L285
	sdiv	w4, w8, w2
.L285:
	mul	w4, w4, w0
	str	w4, [x3, -4]
	ldr	w2, [x19, 564]
	sub	w2, w1, w2
	ands	w2, w2, 511
	beq	.L286
	sdiv	w6, w8, w2
.L286:
	mul	w0, w0, w6
	str	w0, [x3], 16
	add	x5, x5, 4
	cmp	x7, x3
	bne	.L283
	b	.L284
	.size	AVS_UpdateTableMvEScale, .-AVS_UpdateTableMvEScale
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_UpdateTableDirectScale
	.type	AVS_UpdateTableDirectScale, %function
AVS_UpdateTableDirectScale:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 221]
	cmp	w0, 1
	beq	.L365
	ldr	x7, [x19, 88]
	add	x5, x19, 8
	add	x3, x19, 720
	mov	w1, 1
	mov	w2, 0
	mov	w9, 16384
	ldr	w6, [x7, 8]
	mov	w8, 32
	lsl	w6, w6, 1
.L349:
	sub	w0, w1, #1
	and	w4, w1, 1
	add	w0, w0, w0, lsr 31
	asr	w0, w0, 1
	add	w0, w0, 1
	add	x0, x19, x0, sxtw 3
	ldr	x0, [x0, 88]
	cmp	x0, x5
	beq	.L347
	ldr	w2, [x0, 8]
	add	w2, w4, w2, lsl 1
	sub	w0, w6, w2
	ands	w0, w0, 511
	bne	.L348
	str	w8, [x3]
.L347:
	add	w1, w1, 1
	add	x3, x3, 4
	cmp	w1, 5
	bne	.L349
	ldr	w9, [x19, 848]
	ldr	w8, [x7, 8]
	lsl	w8, w8, 1
	cbz	w9, .L366
	add	x6, x19, 736
	mov	w3, 1
	mov	w4, 0
	mov	w10, 32
	mov	w11, 16384
	.p2align 2
.L359:
	cbz	w9, .L352
	add	w0, w4, w4, lsr 31
	asr	w0, w0, 1
	add	w0, w0, 1
	add	x0, x19, x0, sxtw 3
	ldr	x0, [x0, 88]
	cmp	x0, x5
	beq	.L353
	ldr	w2, [x0, 8]
	and	w0, w3, 1
	add	w2, w0, w2, lsl 1
	sub	w1, w8, w2
	add	w1, w1, 512
	asr	w0, w1, 31
	lsr	w7, w0, 23
	add	w1, w1, w7
	and	w0, w1, 511
	subs	w0, w0, w7
	bne	.L354
	str	w10, [x6, -16]
.L355:
	str	w10, [x6]
.L358:
	add	w3, w3, 1
	add	w4, w4, 1
	cmp	w3, 5
	add	x6, x6, 4
	bne	.L359
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L352:
	add	w0, w3, w3, lsr 31
	asr	w0, w0, 1
	add	x0, x19, x0, sxtw 3
	ldr	x0, [x0, 88]
	cmp	x0, x5
	beq	.L353
	ldr	w2, [x0, 8]
	and	w0, w4, 1
	add	w2, w0, w2, lsl 1
.L353:
	sub	w1, w8, w2
	add	w1, w1, 512
	asr	w0, w1, 31
	lsr	w7, w0, 23
	add	w1, w1, w7
	and	w0, w1, 511
	subs	w0, w0, w7
	beq	.L355
	sdiv	w0, w11, w0
	str	w0, [x6]
	b	.L358
	.p2align 3
.L348:
	sdiv	w0, w9, w0
	str	w0, [x3]
	b	.L347
	.p2align 3
.L354:
	sdiv	w0, w11, w0
	str	w0, [x6, -16]
	str	w0, [x6]
	b	.L358
	.p2align 3
.L366:
	add	w8, w8, 1
	add	x6, x19, 736
	mov	w3, 1
	mov	w4, 0
	mov	w10, 32
	mov	w11, 16384
	b	.L359
	.p2align 3
.L365:
	ldr	x0, [x19, 88]
	add	x4, x19, 8
	add	x2, x19, 96
	add	x1, x19, 720
	mov	w6, 16384
	mov	w5, 32
	ldr	w3, [x0, 8]
	add	x19, x19, 728
	lsl	w3, w3, 1
.L346:
	ldr	x0, [x2]
	cmp	x0, x4
	beq	.L344
	ldr	w0, [x0, 8]
	sub	w0, w3, w0, lsl 1
	ands	w0, w0, 511
	bne	.L345
	str	w5, [x1]
.L344:
	add	x1, x1, 4
	add	x2, x2, 8
	cmp	x19, x1
	bne	.L346
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L345:
	sdiv	w0, w6, w0
	str	w0, [x1]
	b	.L344
	.size	AVS_UpdateTableDirectScale, .-AVS_UpdateTableDirectScale
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_UpdateTableSymScale
	.type	AVS_UpdateTableSymScale, %function
AVS_UpdateTableSymScale:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19, 96]
	add	x0, x19, 8
	cmp	x1, x0
	beq	.L374
	ldrb	w0, [x19, 221]
	cmp	w0, 1
	beq	.L369
	ldr	x12, [x19, 80]
	mov	w6, 0
	mov	w11, 512
.L372:
	ldr	w5, [x12, 8]
	lsl	w8, w6, 2
	lsl	w10, w6, 1
	mov	x2, 0
	add	w9, w8, 3
	add	w5, w6, w5, lsl 1
.L371:
	add	w3, w8, w2
	sub	w4, w9, w2
	add	w1, w2, w10
	mov	w7, 1
	add	x3, x19, x3, sxtw 2
	add	x4, x19, x4, sxtw 2
	add	x2, x2, 1
	add	x1, x19, x1, sxtw 2
	ldr	w3, [x3, 560]
	ldr	w0, [x4, 560]
	sub	w3, w5, w3
	ands	w3, w3, 511
	sub	w0, w0, w5
	and	w0, w0, 511
	beq	.L370
	sdiv	w7, w11, w3
.L370:
	mul	w0, w0, w7
	cmp	x2, 2
	str	w0, [x1, 752]
	bne	.L371
	add	w6, w6, 1
	cmp	w6, 2
	bne	.L372
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L369:
	ldp	x4, x2, [x19, 80]
	ldr	w3, [x1, 8]
	ldr	w1, [x4, 8]
	ldr	w2, [x2, 8]
	lsl	w4, w1, 1
	lsl	w1, w2, 1
	sub	w2, w4, w3, lsl 1
	ands	w2, w2, 511
	sub	w1, w1, w4
	and	w1, w1, 511
	bne	.L381
.L373:
	mul	w1, w1, w0
	str	w1, [x19, 752]
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L381:
	mov	w0, 512
	sdiv	w0, w0, w2
	b	.L373
	.p2align 3
.L374:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS_UpdateTableSymScale, .-AVS_UpdateTableSymScale
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_UpdateTabBBlkDist
	.type	AVS_UpdateTabBBlkDist, %function
AVS_UpdateTabBBlkDist:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19, 96]
	add	x0, x19, 8
	cmp	x1, x0
	beq	.L385
	ldrb	w0, [x19, 221]
	cmp	w0, 1
	beq	.L386
	ldr	x7, [x19, 80]
	add	x0, x19, 512
	ldr	w5, [x19, 576]
	ldr	w4, [x19, 584]
	ldp	w3, w1, [x0, 56]
	ldp	w6, w2, [x0, 48]
	ldr	w0, [x7, 8]
	lsl	w0, w0, 1
	sub	w3, w3, w0
	sub	w2, w0, w2
	sub	w6, w0, w6
	sub	w0, w1, w0
	and	w1, w3, 511
	and	w6, w6, 511
	str	w1, [x19, 776]
	and	w0, w0, 511
	str	w6, [x19, 768]
	and	w1, w2, 511
	str	w0, [x19, 780]
	mov	w0, 1
	str	w1, [x19, 772]
	ldr	w3, [x19, 580]
	ldr	w1, [x7, 8]
	ldr	w2, [x19, 588]
	lsl	w1, w1, 1
	add	w1, w1, w0
	sub	w3, w1, w3
	sub	w5, w1, w5
	sub	w4, w4, w1
	sub	w1, w2, w1
	and	w2, w3, 511
	add	x3, x19, 768
	and	w5, w5, 511
	and	w4, w4, 511
	and	w1, w1, 511
	stp	w5, w2, [x3, 16]
	stp	w4, w1, [x3, 24]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L386:
	ldp	x3, x4, [x19, 80]
	ldr	w2, [x1, 8]
	ldr	w3, [x3, 8]
	ldr	w1, [x4, 8]
	lsl	w3, w3, 1
	lsl	w1, w1, 1
	sub	w2, w3, w2, lsl 1
	sub	w1, w1, w3
	and	w2, w2, 511
	and	w1, w1, 511
	str	w2, [x19, 768]
	str	w1, [x19, 776]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L385:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS_UpdateTabBBlkDist, .-AVS_UpdateTabBBlkDist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_UpdatePmvTable
	.type	AVS_UpdatePmvTable, %function
AVS_UpdatePmvTable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x20, 488]
	cmp	w1, 1
	beq	.L389
	cbz	w1, .L390
	cmp	w1, 2
	beq	.L391
	mov	w19, 0
.L388:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L391:
	mov	x0, x20
	mov	w19, 1
	bl	AVS_UpdateTableIdx2Dist
	mov	x0, x20
	bl	AVS_UpdateTableMvEScale
	mov	x0, x20
	bl	AVS_UpdateTableDirectScale
	mov	x0, x20
	bl	AVS_UpdateTabBBlkDist
	mov	x0, x20
	bl	AVS_UpdateTableSymScale
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L390:
	ldrb	w0, [x20, 221]
	mov	w19, 1
	cmp	w0, w19
	beq	.L388
	mov	x0, x20
	bl	AVS_UpdateTableIdx2Dist
	mov	x0, x20
	bl	AVS_UpdateTableMvEScale
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L389:
	mov	x0, x20
	mov	w19, w1
	bl	AVS_UpdateTableIdx2Dist
	mov	x0, x20
	bl	AVS_UpdateTableMvEScale
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS_UpdatePmvTable, .-AVS_UpdatePmvTable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_GetStreamInf
	.type	AVS_GetStreamInf, %function
AVS_GetStreamInf:
	sub	sp, sp, #96
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	stp	x23, x24, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 12288
	bl	_mcount
	ldr	w1, [x20, 2784]
	ldrb	w2, [x20, 2800]
	cmp	w1, 1
	str	w2, [x20, 3492]
	beq	.L398
	ldr	w0, [x19, 8]
	cmp	w0, 1
	beq	.L399
.L398:
	ldr	x2, .LC253
	mov	w1, 1288
	mov	w0, 20
	bl	dprint_normal
	add	x3, x29, 80
	ldr	w0, [x19, 4]
	add	x2, x29, 72
	add	x1, x29, 68
	stp	wzr, wzr, [x29, 68]
	str	wzr, [x3, -4]!
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x19, 16]
	ldr	w3, [x0, 736]
	cmp	w3, 1
	beq	.L477
.L401:
	add	x1, x20, 2788
	add	x2, x20, 2648
	ldr	w0, [x1, 24]
	add	w0, w0, 15
	lsr	w0, w0, 4
	str	w0, [x2, 116]
	ldrb	w0, [x1, 15]
	cmp	w0, 1
	ldr	w0, [x1, 28]
	beq	.L478
	add	w0, w0, 31
	lsr	w0, w0, 5
	lsl	w0, w0, 1
	str	w0, [x2, 120]
.L407:
	add	x22, x20, 2648
	ldr	x1, [x22, 88]
	ldr	w0, [x19, 4]
	add	x21, x20, 2656
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	cbz	x0, .L409
	ldr	x1, [x22, 80]
	add	x21, x20, 2656
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x22, 88]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x22, 96]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x22, 104]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 4]
	ldr	x1, [x23, 168]
	bl	FreeUsdByDec
	ldr	w0, [x19, 4]
	ldr	x1, [x23, 176]
	bl	FreeUsdByDec
	ldr	w0, [x19, 4]
	ldr	x1, [x23, 184]
	bl	FreeUsdByDec
	ldr	w0, [x19, 4]
	ldr	x1, [x23, 192]
	bl	FreeUsdByDec
	stp	xzr, xzr, [x23, 168]
	stp	xzr, xzr, [x23, 184]
	stp	x21, x21, [x22, 80]
	stp	x21, x21, [x22, 96]
	ldr	w0, [x19, 4]
	bl	FSP_GetNullLogicFs
	str	w0, [x20, 2660]
.L409:
	add	x22, x20, 2648
	str	wzr, [x22, 804]
	add	x1, x20, 3920
	mov	w23, 3
	ldr	w0, [x19, 4]
	bl	FSP_ClearNotInVoQueue
	str	wzr, [x22, 136]
	mov	x0, x19
	stp	x21, x21, [x22, 80]
	stp	x21, x21, [x22, 96]
	bl	AVS_AllocateVHB
	cmp	w0, w23
	beq	.L404
	cbz	w0, .L479
	str	wzr, [x22, 136]
.L399:
	add	x21, x20, 2788
	add	x22, x20, 2648
	ldrb	w2, [x21, 11]
	mov	x0, x19
	ldr	x1, [x22, 80]
	str	w2, [x22, 840]
	ldrb	w2, [x21, 81]
	strb	w2, [x1]
	bl	AVS_GetImageBuffer
	mov	w23, w0
	cbz	w0, .L480
	ldr	x1, [x22, 80]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	mov	x3, x0
	cbz	x0, .L481
	ldr	x4, [x19, 16]
	mov	x5, -1
	ldr	x2, .LC263
	mov	w1, 1374
	mov	w0, 24
	ldr	x4, [x4, 32]
	str	x4, [x3, 208]
	ldr	x4, [x19, 16]
	ldr	x4, [x4, 48]
	str	x4, [x3, 216]
	ldr	x4, [x19, 16]
	ldr	x4, [x4, 64]
	str	x4, [x3, 224]
	ldr	x4, [x19, 16]
	ldr	w4, [x4, 80]
	str	w4, [x3]
	ldr	x4, [x19, 16]
	ldr	w4, [x4, 84]
	str	w4, [x3, 4]
	ldr	x4, [x19, 16]
	ldr	w4, [x4, 88]
	str	w4, [x3, 8]
	ldr	x4, [x19, 16]
	ldr	w4, [x4, 104]
	str	w4, [x3, 12]
	ldrb	w4, [x21, 81]
	cmp	w4, wzr
	cset	w4, eq
	str	w4, [x3, 20]
	ldr	x4, [x19, 16]
	str	x5, [x4, 32]
	ldp	x4, x5, [x3, 208]
	ldr	w3, [x19, 4]
	bl	dprint_normal
	ldr	x0, [x22, 80]
	mov	w1, 1
	ldr	w2, [x21, 112]
	str	w2, [x0, 8]
	ldr	x0, [x22, 80]
	ldrb	w2, [x21, 81]
	strb	w2, [x0]
	ldr	x0, [x22, 80]
	ldr	w2, [x21, 348]
	strb	w2, [x0, 1]
	ldrb	w0, [x21, 81]
	ldr	x2, [x22, 80]
	cbz	w0, .L413
	ldrsb	w1, [x21, 82]
.L413:
	strb	w1, [x2, 2]
	ldrb	w1, [x20, 2869]
	cbz	w1, .L482
.L414:
	add	x22, x20, 2788
	add	x23, x20, 2648
	ldr	w1, [x22, 344]
	mov	x0, x23
	str	w1, [x20, 3496]
	add	x21, x19, 16384
	bl	AVS_UpdatePmvTable
	ldr	w4, [x20, 2764]
	add	x1, x21, 616
	ldr	w3, [x20, 2768]
	mov	w2, 1
	mul	w0, w4, w3
	sub	w0, w0, #1
	str	w0, [x21, 616]
	stp	wzr, w2, [x1, 4]
	ldr	w2, [x20, 3192]
	stp	w3, w4, [x1, 60]
	cmp	w2, wzr
	add	w0, w2, 63
	csel	w0, w0, w2, lt
	mov	w2, 6
	asr	w0, w0, 6
	mov	w3, 3
	stp	w0, w2, [x1, 12]
	add	x0, x20, 2992
	add	x2, x20, 3120
	ldr	w4, [x20, 3492]
	str	w4, [x1, 68]
	ldr	w4, [x20, 3488]
	str	w4, [x1, 72]
	ldrb	w4, [x22, 94]
	str	w4, [x1, 76]
	ldrb	w4, [x22, 93]
	str	w4, [x1, 80]
	ldrb	w4, [x22, 92]
	str	w4, [x1, 84]
	ldrb	w4, [x22, 86]
	str	w4, [x1, 88]
	ldrb	w4, [x22, 85]
	str	w4, [x1, 92]
	ldrb	w4, [x22, 84]
	str	w4, [x1, 96]
	ldrb	w4, [x22, 83]
	str	w4, [x1, 100]
	ldrb	w4, [x22, 82]
	str	w4, [x1, 104]
	ldr	w4, [x22, 348]
	str	w4, [x1, 108]
	ldrb	w4, [x22, 81]
	cmp	w4, wzr
	csinc	w3, w3, wzr, ne
	str	w3, [x1, 112]
	ldrb	w3, [x22, 80]
	str	w3, [x1, 116]
	ldr	w3, [x22, 124]
	str	w3, [x1, 120]
	ldr	w3, [x22, 120]
	str	w3, [x1, 124]
	ldrb	w3, [x22, 89]
	str	w3, [x1, 128]
	ldrb	w3, [x22, 88]
	str	w3, [x1, 132]
	ldr	w3, [x22, 128]
	str	w3, [x1, 208]
	ldr	w3, [x22, 136]
	str	w3, [x1, 212]
	ldr	w3, [x22, 140]
	str	w3, [x1, 220]
	ldr	w3, [x22, 144]
	str	w3, [x1, 216]
	.p2align 2
.L417:
	ldrh	w1, [x0]
	add	x0, x0, 2
	cmp	x2, x0
	strh	w1, [x0, 2102]
	bne	.L417
	add	x22, x21, 616
	ldr	w1, [x20, 3120]
	add	x23, x20, 2648
	str	w1, [x22, 224]
	ldr	w1, [x20, 3132]
	str	w1, [x22, 232]
	ldr	w0, [x20, 3128]
	str	w0, [x22, 228]
	ldp	x0, x1, [x23, 80]
	ldrb	w0, [x0, 1]
	ldr	w1, [x1, 4]
	cmp	w0, 2
	ldr	w0, [x19, 4]
	beq	.L483
	bl	FSP_GetFsImagePtr
	cbz	x0, .L484
	ldr	x1, [x23, 88]
	mov	w24, 3
	ldrb	w2, [x1]
	cmp	w2, 1
	csinc	w2, w24, wzr, eq
	str	w2, [x22, 136]
	ldrsb	w2, [x1, 2]
	str	w2, [x22, 140]
	ldr	w2, [x0, 400]
	str	w2, [x22, 160]
	ldrb	w2, [x1]
	cmp	w2, 1
	csinc	w2, w24, wzr, eq
	str	w2, [x22, 152]
	ldrsb	w1, [x1, 2]
	str	w1, [x22, 156]
	ldr	w0, [x0, 400]
	str	w0, [x22, 164]
	ldr	x1, [x23, 96]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L485
	ldr	x1, [x23, 96]
.L476:
	ldrb	w2, [x1]
	add	x23, x20, 2648
	cmp	w2, 1
	csinc	w24, w24, wzr, eq
	str	w24, [x22, 144]
	ldrsb	w1, [x1, 2]
	str	w1, [x22, 148]
	ldr	w0, [x0, 400]
	str	w0, [x22, 168]
	ldr	x1, [x23, 88]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L486
	add	x22, x21, 616
	ldr	w0, [x0, 20]
	str	w0, [x22, 36]
	ldr	x1, [x23, 96]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L487
	ldr	w0, [x0, 20]
	str	w0, [x22, 40]
	ldr	x1, [x23, 104]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L488
	ldr	w0, [x0, 20]
	str	w0, [x22, 44]
	ldr	x1, [x23, 80]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L489
	ldr	w2, [x0, 20]
	mov	w1, 3
	str	w2, [x22, 48]
	ldr	w2, [x0, 400]
	str	w2, [x22, 52]
	ldr	w2, [x0, 400]
	str	w2, [x22, 172]
	ldr	w0, [x0, 404]
	str	w0, [x22, 56]
	ldr	x2, [x23, 88]
	ldrb	w0, [x2]
	cmp	w0, 1
	csinc	w0, w1, wzr, eq
	str	w0, [x22, 176]
	ldrb	w0, [x2, 1]
	cmp	w0, wzr
	cset	w0, ne
	str	w0, [x22, 180]
	ldr	x1, [x23, 80]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetPmvAddr
	str	w0, [x22, 236]
	ldr	x1, [x23, 88]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetPmvAddr
	str	w0, [x22, 248]
	mov	w6, 4
	mov	w4, 8
	ldr	w5, [x20, 3136]
	mov	w1, 16
	mov	w3, 32
	mov	w2, 0
	cmp	w5, 2
	add	x0, x20, 3240
	csel	w6, w6, wzr, eq
	csel	w4, w4, wzr, eq
	csel	w3, w1, w3, eq
	.p2align 2
.L438:
	ldr	w1, [x0]
	add	x0, x0, 4
	add	w2, w2, 1
	and	w1, w1, 262143
	cmp	w3, w2
	str	w1, [x0, 1720]
	bgt	.L438
	cbz	w4, .L443
	add	x2, x20, 3368
	add	w4, w4, 16
	mov	w0, 16
	add	x5, x21, 616
	.p2align 2
.L442:
	add	x3, x5, x0, sxtw 2
	ldr	w1, [x2], 4
	add	w0, w0, 1
	and	w1, w1, 32767
	cmp	w4, w0
	str	w1, [x3, 252]
	bne	.L442
.L443:
	cbz	w6, .L441
	lsl	w8, w6, 1
	mov	w4, 24
	mov	w2, 0
	add	x7, x21, 616
	.p2align 2
.L444:
	add	w0, w2, 1
	add	x1, x20, 2648
	add	x3, x1, x2, sxtw 2
	add	x5, x7, x4, sxtw 2
	add	x1, x1, x0, sxtw 2
	add	w2, w2, 2
	cmp	w2, w8
	add	w4, w4, 1
	ldr	w0, [x3, 768]
	ldr	w3, [x1, 768]
	and	w1, w0, 511
	ubfiz	w0, w3, 9, 9
	orr	w0, w0, w1
	str	w0, [x5, 252]
	bne	.L444
	add	x2, x20, 3400
	add	w4, w6, 28
	mov	w0, 28
	add	x5, x21, 616
	.p2align 2
.L445:
	add	x3, x5, x0, sxtw 2
	ldr	w1, [x2], 4
	add	w0, w0, 1
	and	w1, w1, 262143
	cmp	w4, w0
	str	w1, [x3, 252]
	bne	.L445
.L441:
	ldr	w0, [x20, 3188]
	mov	w23, 1
	str	w0, [x21, 996]
.L404:
	add	sp, x29, 0
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L477:
	ldr	w0, [x29, 76]
	cmp	w0, wzr
	ble	.L490
.L402:
	add	sp, x29, 0
	mov	w23, 3
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L478:
	add	w0, w0, 15
	lsr	w0, w0, 4
	str	w0, [x2, 120]
	b	.L407
.L482:
	ldr	w0, [x20, 3136]
	cbnz	w0, .L414
	ldr	x1, [x20, 2728]
	mov	w2, 1
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_SetRef
	ldr	x0, [x20, 2752]
	add	x1, x20, 2656
	cmp	x0, x1
	beq	.L415
	ldr	w1, [x0, 4]
	mov	w2, 0
	ldr	w0, [x19, 4]
	bl	FSP_SetRef
.L415:
	ldr	x2, [x20, 2736]
	ldr	x3, [x20, 2744]
	ldr	x1, [x20, 2728]
	str	x1, [x20, 2736]
	str	x2, [x20, 2744]
	str	x3, [x20, 2752]
	b	.L414
.L483:
	bl	FSP_GetFsImagePtr
	cbz	x0, .L491
	ldr	x1, [x23, 88]
	mov	w24, 3
	ldrb	w2, [x1]
	cmp	w2, 1
	csinc	w2, w24, wzr, eq
	str	w2, [x22, 136]
	ldrsb	w1, [x1, 2]
	str	w1, [x22, 140]
	ldr	w0, [x0, 400]
	str	w0, [x22, 160]
	ldr	x1, [x23, 96]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L492
	ldr	x1, [x23, 96]
	ldrb	w2, [x1]
	cmp	w2, 1
	csinc	w2, w24, wzr, eq
	str	w2, [x22, 152]
	ldrsb	w1, [x1, 2]
	str	w1, [x22, 156]
	ldr	w0, [x0, 400]
	str	w0, [x22, 164]
	ldr	x1, [x23, 104]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L493
	ldr	x1, [x23, 104]
	b	.L476
	.p2align 3
.L480:
	ldr	x2, .LC260
	mov	w1, 1357
	mov	w0, 1
	bl	dprint_normal
	add	sp, x29, 0
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L479:
	ldr	x2, .LC258
	mov	w1, 1343
	mov	w0, 1
	mov	w23, 0
	bl	dprint_normal
	b	.L404
.L490:
	ldr	w0, [x29, 72]
	cmp	w0, 32
	bgt	.L402
	ldr	x0, [x19, 24]
	cbnz	x0, .L402
	ldr	w4, [x19, 15068]
	cmp	w4, 1
	bls	.L401
	ldr	w7, [x19, 15856]
	cbz	w7, .L401
	add	x21, x19, 16384
	ldr	w6, [x21, 1128]
	cmp	w7, w6
	beq	.L401
	ldr	w0, [x19, 15860]
	ldr	w5, [x21, 1132]
	cmp	w0, w5
	beq	.L401
	ldr	x2, .LC255
	mov	w1, 1308
	str	w0, [sp]
	mov	w0, w3
	bl	dprint_normal
	ldr	w0, [x19, 15856]
	ldr	x1, .LC256
	str	w0, [x21, 1128]
	ldr	x4, [x1]
	ldr	w0, [x19, 15860]
	str	w0, [x21, 1132]
	cbz	x4, .L401
	ldr	w0, [x19, 4]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 48
	blr	x4
	b	.L401
	.p2align 3
.L481:
	mov	w3, 1362
	ldr	x2, .LC261
	mov	w1, w3
	mov	w0, 0
	mov	w23, 0
	bl	dprint_normal
	b	.L404
.L486:
	mov	w3, 1481
	ldr	x2, .LC261
	mov	w1, w3
	mov	w23, 0
	bl	dprint_normal
	b	.L404
.L487:
	mov	w3, 1485
	ldr	x2, .LC261
	mov	w1, w3
	mov	w23, 0
	bl	dprint_normal
	b	.L404
.L488:
	mov	w3, 1489
	ldr	x2, .LC261
	mov	w1, w3
	mov	w23, 0
	bl	dprint_normal
	b	.L404
.L484:
	mov	w3, 1465
	ldr	x2, .LC261
	mov	w1, w3
	mov	w23, 0
	bl	dprint_normal
	b	.L404
.L485:
	mov	w3, 1474
	ldr	x2, .LC261
	mov	w1, w3
	mov	w23, 0
	bl	dprint_normal
	b	.L404
.L489:
	mov	w3, 1493
	ldr	x2, .LC261
	mov	w1, w3
	mov	w23, 0
	bl	dprint_normal
	b	.L404
.L493:
	mov	w3, 1457
	ldr	x2, .LC261
	mov	w1, w3
	mov	w23, 0
	bl	dprint_normal
	b	.L404
.L492:
	mov	w3, 1451
	ldr	x2, .LC261
	mov	w1, w3
	mov	w23, 0
	bl	dprint_normal
	b	.L404
.L491:
	mov	w3, 1445
	ldr	x2, .LC261
	mov	w1, w3
	mov	w23, 0
	bl	dprint_normal
	b	.L404
	.size	AVS_GetStreamInf, .-AVS_GetStreamInf
	.align	3
.LC253:
	.xword	.LC252
	.align	3
.LC255:
	.xword	.LC254
	.align	3
.LC256:
	.xword	g_EventReportFunc
	.align	3
.LC258:
	.xword	.LC257
	.align	3
.LC260:
	.xword	.LC259
	.align	3
.LC261:
	.xword	.LC246
	.align	3
.LC263:
	.xword	.LC262
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_PrepareDecode
	.type	AVS_PrepareDecode, %function
AVS_PrepareDecode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	AVS_GetStreamInf
	cmp	w0, 3
	beq	.L495
	cmp	w0, wzr
	cset	w0, ne
.L495:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS_PrepareDecode, .-AVS_PrepareDecode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_VerifyMemPara
	.type	AVS_VerifyMemPara, %function
AVS_VerifyMemPara:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	AVS_VerifyMemPara, .-AVS_VerifyMemPara
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVSDEC_Init
	.type	AVSDEC_Init, %function
AVSDEC_Init:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x22, xzr, 4, ne
	beq	.L502
	ldr	x24, .LC265
	add	x21, x20, 16384
	mov	x2, 17520
	mov	w1, 0
	mov	x0, x20
	add	x19, x20, 12288
	ldr	x3, [x24, 96]
	add	x23, x19, 3920
	ldr	w25, [x21, 424]
	blr	x3
	str	w25, [x21, 424]
	mov	x0, x23
	add	x21, x19, 2648
	add	x25, x19, 3504
	bl	ResetVoQueue
	str	x22, [x20, 16]
	mov	x0, x20
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x20, 4]
	beq	.L503
	ldr	x3, [x24, 96]
	mov	x2, 856
	mov	w1, 0
	mov	x0, x21
	add	x19, x19, 2656
	blr	x3
	str	x25, [x21, 520]
	mov	w0, 1024
	str	x23, [x21, 552]
	str	w0, [x21, 544]
	mov	w0, 1
	stp	x19, x19, [x21, 80]
	stp	x19, x19, [x21, 96]
.L500:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L502:
	mov	w3, 2318
	ldr	x2, .LC264
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldr	x25, [sp, 64]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L503:
	ldr	x2, .LC267
	mov	w1, 2337
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -20
	b	.L500
	.size	AVSDEC_Init, .-AVSDEC_Init
	.align	3
.LC264:
	.xword	.LC246
	.align	3
.LC265:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC267:
	.xword	.LC266
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVSDEC_RecycleImage
	.type	AVSDEC_RecycleImage, %function
AVSDEC_RecycleImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L506
	ldr	w0, [x19, 4]
	mov	w1, w20
	mov	w2, 0
	bl	FSP_SetDisplay
	ldr	w0, [x19, 4]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L507
	ldr	w0, [x19, 4]
	ldr	x1, [x20, 168]
	bl	FreeUsdByDec
	str	xzr, [x20, 168]
	ldr	x1, [x20, 176]
	ldr	w0, [x19, 4]
	bl	FreeUsdByDec
	str	xzr, [x20, 176]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L506:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L507:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVSDEC_RecycleImage, .-AVSDEC_RecycleImage
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVSDEC_FlushRemainImg
	.type	AVSDEC_FlushRemainImg, %function
AVSDEC_FlushRemainImg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x20, 16]
	ldr	w0, [x0, 12]
	cmp	w0, 1
	beq	.L508
	add	x3, x20, 12288
	add	x19, x3, 2752
	add	x23, x3, 2728
	add	x22, x3, 3920
.L513:
	ldr	x1, [x19]
	ldr	w0, [x20, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	mov	x21, x0
	cbz	x0, .L511
	ldr	x1, [x19]
	ldr	w0, [x20, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetDisplay
	cmp	w0, 2
	beq	.L519
.L511:
	sub	x19, x19, #8
	cmp	x19, x23
	bne	.L513
.L508:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L519:
	mov	x0, x20
	bl	AVS_SetImgFormat
	ldr	x1, [x19]
	mov	w2, 1
	ldr	w0, [x20, 4]
	ldr	w1, [x1, 4]
	bl	FSP_SetDisplay
	ldr	w0, [x20, 4]
	mov	x4, x21
	mov	x3, x22
	mov	x2, x20
	mov	w1, 6
	bl	InsertImgToVoQueue
	cmp	w0, 1
	mov	x0, x20
	beq	.L511
	ldr	w1, [x21, 88]
	bl	AVSDEC_RecycleImage
	ldr	w0, [x20, 4]
	ldr	x1, [x21, 168]
	bl	FreeUsdByDec
	str	xzr, [x21, 168]
	ldr	x1, [x21, 176]
	ldr	w0, [x20, 4]
	bl	FreeUsdByDec
	str	xzr, [x21, 176]
	b	.L511
	.size	AVSDEC_FlushRemainImg, .-AVSDEC_FlushRemainImg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVSDEC_GetImageBuffer
	.type	AVSDEC_GetImageBuffer, %function
AVSDEC_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L525
	ldr	w0, [x20, 4]
	bl	FSP_IsNewFsAvailable
	cmp	w0, 1
	beq	.L523
	cmn	w0, #1
	mov	w19, 0
	beq	.L526
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L523:
	mov	w19, w0
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L526:
	add	x1, x20, 12288
	ldr	w0, [x20, 4]
	add	x1, x1, 3920
	bl	FSP_ClearNotInVoQueue
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L525:
	mov	w3, 2625
	ldr	x2, .LC268
	mov	w1, w3
	mov	w0, 0
	mov	w19, 0
	bl	dprint_normal
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVSDEC_GetImageBuffer, .-AVSDEC_GetImageBuffer
	.align	3
.LC268:
	.xword	.LC246
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ClearSlice
	.type	ClearSlice, %function
ClearSlice:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w22, w0
	mov	x0, x30
	mov	x20, x1
	add	x19, x1, 8
	add	x21, x1, 16
	bl	_mcount
.L529:
	ldr	w0, [x19]
	cmp	w0, wzr
	ble	.L528
	ldr	w0, [x19, -8]
	cbnz	w0, .L534
.L528:
	str	wzr, [x19, -8]
	add	x19, x19, 4
	str	wzr, [x19, -4]
	cmp	x19, x21
	str	wzr, [x20, 16]
	bne	.L529
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L534:
	ldr	w1, [x19, 12]
	mov	w0, w22
	bl	SM_ReleaseStreamSeg
	b	.L528
	.size	ClearSlice, .-ClearSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_ClearCurPic
	.type	AVS_ClearCurPic, %function
AVS_ClearCurPic:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 32
	bl	_mcount
	cmp	x21, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L536
	ldr	w0, [x20, 116]
	mov	w19, 0
	cmp	w0, wzr
	ble	.L540
	.p2align 2
.L541:
	sxtw	x2, w19
	ldr	w0, [x21, 4]
	lsl	x1, x2, 3
	add	w19, w19, 1
	sub	x1, x1, x2
	add	x1, x20, x1, lsl 2
	add	x1, x1, 568
	bl	ClearSlice
	ldr	w0, [x20, 116]
	cmp	w0, w19
	bgt	.L541
.L540:
	str	wzr, [x20, 116]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L536:
	mov	w3, 2666
	ldr	x2, .LC269
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS_ClearCurPic, .-AVS_ClearCurPic
	.align	3
.LC269:
	.xword	.LC246
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	AVS_DecodeArbiter.part.5, %function
AVS_DecodeArbiter.part.5:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x20, 16]
	ldr	w0, [x0, 8]
	cmp	w0, 4
	bls	.L566
.L558:
	add	x19, x20, 12288
	mov	w1, 1
	str	w0, [x19, 3448]
	cbz	w1, .L567
.L551:
	ldr	w0, [x19, 3892]
	cmp	w0, 1
	beq	.L568
.L554:
	cmp	w0, 2
	bne	.L556
	ldr	w0, [x19, 3452]
	cmp	w0, 1
	ble	.L555
.L556:
	add	x1, x19, 3544
	mov	x2, 376
	add	x0, x19, 2788
	bl	memcpy
	ldrb	w5, [x19, 2869]
	mov	w1, 1224
	ldr	w4, [x19, 3136]
	mov	w0, 16
	ldr	w3, [x19, 3464]
	ldr	x2, .LC273
	bl	dprint_normal
	ldr	w2, [x19, 2772]
	mov	w1, 16383
	movk	w1, 0xfffb, lsl 16
	mov	w0, 1
	and	w1, w2, w1
	str	w1, [x19, 2772]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L566:
	ldr	x1, .LC270
	ldrb	w1, [x1,w0,uxtw]
	adr	x2, .Lrtx546
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx546:
	.section	.rodata
	.align	0
	.align	2
.L546:
	.byte	(.L545 - .Lrtx546) / 4
	.byte	(.L547 - .Lrtx546) / 4
	.byte	(.L548 - .Lrtx546) / 4
	.byte	(.L558 - .Lrtx546) / 4
	.byte	(.L545 - .Lrtx546) / 4
	.text
	.p2align 3
.L567:
	mov	x0, x20
	bl	AVS_ClearCurPic
	ldr	x2, .LC271
	mov	w0, 16383
	ldr	w1, [x19, 2772]
	movk	w0, 0xfffb, lsl 16
	ldr	x4, [x2]
	and	w0, w1, w0
	str	w0, [x19, 2772]
	cbz	x4, .L564
.L563:
	ldr	w0, [x20, 4]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L564:
	mov	w0, 0
.L571:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L548:
	add	x19, x20, 12288
	ldr	w1, [x19, 3892]
	str	w0, [x19, 3448]
	cmp	w1, wzr
	cset	w1, eq
	cbnz	w1, .L551
	b	.L567
	.p2align 3
.L547:
	add	x19, x20, 12288
	ldr	w2, [x19, 3448]
	cmp	w2, 2
	beq	.L569
.L550:
	ldr	w1, [x19, 3892]
	str	w0, [x19, 3448]
	cmp	w1, 2
	cset	w1, ne
	cbnz	w1, .L551
	b	.L567
	.p2align 3
.L545:
	add	x19, x20, 12288
	ldr	w2, [x19, 3448]
	cmp	w2, 2
	beq	.L570
	str	w0, [x19, 3448]
.L572:
	ldr	w0, [x19, 3892]
	cmp	w0, 1
	bne	.L554
.L568:
	ldr	w0, [x19, 3452]
	cmp	w0, wzr
	bgt	.L556
.L555:
	mov	x0, x20
	bl	AVS_ClearCurPic
	ldr	x1, .LC271
	mov	w0, 16383
	ldr	w2, [x19, 2772]
	movk	w0, 0xfffb, lsl 16
	ldr	x4, [x1]
	and	w0, w2, w0
	str	w0, [x19, 2772]
	cbnz	x4, .L563
	mov	w0, 0
	b	.L571
	.p2align 3
.L570:
	str	wzr, [x19, 3452]
	str	w0, [x19, 3448]
	b	.L572
	.p2align 3
.L569:
	str	wzr, [x19, 3452]
	b	.L550
	.size	AVS_DecodeArbiter.part.5, .-AVS_DecodeArbiter.part.5
	.align	3
.LC270:
	.xword	.L546
	.align	3
.LC271:
	.xword	g_EventReportFunc
	.align	3
.LC273:
	.xword	.LC272
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_DecodeArbiter
	.type	AVS_DecodeArbiter, %function
AVS_DecodeArbiter:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	w0, 49152
	ldr	w1, [x19, 15060]
	movk	w0, 0x5, lsl 16
	and	w0, w1, w0
	cmp	w0, 376832
	beq	.L576
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L576:
	mov	x0, x19
	bl	AVS_DecodeArbiter.part.5
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS_DecodeArbiter, .-AVS_DecodeArbiter
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVSDEC_VDMPostProc
	.type	AVSDEC_VDMPostProc, %function
AVSDEC_VDMPostProc:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	w21, w1
	add	x20, x19, 12288
	bl	_mcount
	add	x22, x20, 2788
	mov	x0, x19
	bl	AVS_ClearCurPic
	ldr	x3, .LC274
	mov	x2, 14904
	mov	w1, 0
	add	x0, x19, 32
	ldr	x3, [x3, 96]
	blr	x3
	ldr	w0, [x22, 348]
	cbnz	w0, .L578
	str	w21, [x20, 3456]
	mov	w3, w21
	ldr	x0, [x19, 16]
	ldr	w4, [x0]
	cmp	w3, w4
	bgt	.L628
.L583:
	mov	x0, x19
	add	x21, x20, 2648
	bl	AVS_SetImgFormat
	ldr	x1, [x21, 80]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L629
	ldr	x1, [x21, 824]
	cbz	x1, .L586
	str	x1, [x0, 168]
.L586:
	ldr	x2, [x20, 3480]
	str	xzr, [x20, 3472]
	cbz	x2, .L587
	str	x2, [x0, 176]
.L587:
	add	x21, x20, 2648
	str	xzr, [x21, 832]
	ldr	w0, [x20, 3136]
	cmp	w0, 1
	bls	.L630
	ldr	x21, [x21, 80]
.L593:
	ldr	w0, [x19, 4]
	ldr	w1, [x21, 4]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L631
	add	x0, x20, 2656
	add	x20, x20, 2648
	cmp	x21, x0
	beq	.L598
	ldr	x0, [x19, 16]
	ldr	w3, [x20, 808]
	ldr	w4, [x0, 4]
	cmp	w4, w3
	bge	.L596
	ldr	x2, .LC279
	mov	w1, 2585
	mov	w0, 1
	bl	dprint_normal
	ldr	w1, [x21, 4]
	mov	w2, 0
	ldr	w0, [x19, 4]
	bl	FSP_SetDisplay
	ldr	x1, [x22, 168]
	cbnz	x1, .L632
.L597:
	ldr	x1, [x22, 176]
	cbnz	x1, .L633
.L598:
	mov	w20, 1
.L581:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L596:
	mov	x1, x19
	mov	x0, x21
	bl	AVS_OutputOneFrame
	mov	w20, w0
	cbnz	w0, .L598
	ldr	x1, [x22, 168]
	cbnz	x1, .L634
.L599:
	ldr	x1, [x22, 176]
	cbz	x1, .L581
	ldr	w0, [x19, 4]
	bl	FreeUsdByDec
	str	xzr, [x22, 176]
	b	.L581
	.p2align 3
.L578:
	add	x23, x20, 2648
	ldr	x1, [x23, 88]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	mov	w3, 2517
	cbz	x0, .L627
	ldr	x2, [x23, 96]
	ldr	w24, [x0, 96]
	ldr	w0, [x19, 4]
	ldr	w1, [x2, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L635
	ldr	w3, [x0, 96]
	mov	w0, 100
	add	w3, w24, w3
	add	w3, w3, w21
	cmp	w3, w0
	csel	w3, w3, w0, le
	str	w3, [x23, 808]
	ldr	w0, [x22, 348]
	cmp	w0, 2
	beq	.L583
	ldr	x0, [x19, 16]
	ldr	w4, [x0]
	cmp	w3, w4
	ble	.L583
	.p2align 2
.L628:
	ldr	x2, .LC277
	mov	w1, 2532
	mov	w0, 1
	bl	dprint_normal
	str	wzr, [x20, 3452]
	ldr	x0, [x20, 2736]
	ldr	w1, [x0, 4]
	ldr	w0, [x19, 4]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L584
	ldr	x1, [x20, 2728]
	add	x23, x20, 2656
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x20, 2736]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x20, 2744]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x20, 2752]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 4]
	ldr	x1, [x22, 168]
	bl	FreeUsdByDec
	ldr	w0, [x19, 4]
	ldr	x1, [x22, 176]
	bl	FreeUsdByDec
	ldr	w0, [x19, 4]
	ldr	x1, [x22, 184]
	bl	FreeUsdByDec
	ldr	w0, [x19, 4]
	ldr	x1, [x22, 192]
	bl	FreeUsdByDec
	add	x0, x20, 2560
	stp	xzr, xzr, [x22, 168]
	stp	xzr, xzr, [x22, 184]
	stp	x23, x23, [x0, 168]
	stp	x23, x23, [x0, 184]
	ldr	w0, [x19, 4]
	bl	FSP_GetNullLogicFs
	str	w0, [x23, 4]
.L584:
	str	wzr, [x20, 3452]
	mov	w20, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L633:
	ldr	w0, [x19, 4]
	mov	w20, 1
	bl	FreeUsdByDec
	str	xzr, [x22, 176]
	b	.L581
	.p2align 3
.L630:
	ldr	w2, [x21, 804]
	cmp	w2, 1
	csinc	w2, w2, w2, gt
	str	w2, [x21, 804]
	ldrb	w1, [x20, 2869]
	cmp	w1, 1
	ccmp	w0, wzr, 0, ne
	beq	.L590
	ldr	x1, [x21, 80]
	mov	w2, 1
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_SetRef
	ldr	x0, [x21, 104]
	add	x1, x20, 2656
	cmp	x0, x1
	beq	.L591
	ldr	w1, [x0, 4]
	mov	w2, 0
	ldr	w0, [x19, 4]
	bl	FSP_SetRef
.L591:
	ldr	x2, [x20, 2736]
	ldr	x3, [x20, 2744]
	ldr	x1, [x20, 2728]
	str	x1, [x20, 2736]
	str	x2, [x20, 2744]
	str	x3, [x20, 2752]
.L590:
	ldr	x0, [x19, 16]
	ldr	w0, [x0, 12]
	cbnz	w0, .L592
	ldr	x21, [x20, 2744]
	b	.L593
	.p2align 3
.L592:
	ldr	x21, [x20, 2728]
	b	.L593
	.p2align 3
.L632:
	ldr	w0, [x19, 4]
	bl	FreeUsdByDec
	str	xzr, [x22, 168]
	b	.L597
	.p2align 3
.L631:
	mov	w3, 2577
.L627:
	ldr	x2, .LC275
	mov	w1, w3
	mov	w0, 0
	mov	w20, 0
	bl	dprint_normal
	b	.L581
	.p2align 3
.L634:
	ldr	w0, [x19, 4]
	bl	FreeUsdByDec
	str	xzr, [x22, 168]
	b	.L599
	.p2align 3
.L629:
	mov	w3, 2543
	ldr	x2, .LC275
	mov	w1, w3
	mov	w20, 0
	bl	dprint_normal
	b	.L581
	.p2align 3
.L635:
	mov	w3, 2521
	ldr	x2, .LC275
	mov	w1, w3
	mov	w20, 0
	bl	dprint_normal
	b	.L581
	.size	AVSDEC_VDMPostProc, .-AVSDEC_VDMPostProc
	.align	3
.LC274:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC275:
	.xword	.LC246
	.align	3
.LC277:
	.xword	.LC276
	.align	3
.LC279:
	.xword	.LC278
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ClearPacket
	.type	ClearPacket, %function
ClearPacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 16384
	bl	_mcount
	ldr	w0, [x20, 4]
	ldr	w1, [x19, 464]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x19, 450]
	cbnz	w0, .L637
	ldrb	w0, [x19, 538]
	cmp	w0, 1
	beq	.L641
.L637:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L641:
	ldr	w0, [x19, 544]
	cbz	w0, .L637
	ldr	w1, [x19, 552]
	ldr	w0, [x20, 4]
	bl	SM_ReleaseStreamSeg
	b	.L637
	.size	ClearPacket, .-ClearPacket
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	WriteAvsSliceMsg
	.type	WriteAvsSliceMsg, %function
WriteAvsSliceMsg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x2, x19, 32
	ldr	w3, [x2, 116]
	cmp	w3, 511
	bgt	.L651
	cmp	w3, wzr
	ble	.L645
	sub	w1, w3, #1
	ldr	x5, [x19, 16824]
	ldr	w0, [x19, 15856]
	sxtw	x1, w1
	lsl	x4, x1, 3
	add	w0, w0, 15
	sub	x1, x4, x1
	ldrb	w4, [x5, 3]
	lsr	w0, w0, 4
	add	x1, x2, x1, lsl 2
	mul	w0, w0, w4
	ldr	w4, [x1, 584]
	cmp	w0, w4
	bls	.L652
.L645:
	sxtw	x7, w3
	add	x4, x19, 16384
	lsl	x1, x7, 3
	sub	x1, x1, x7
	ldr	w0, [x4, 456]
	add	x1, x2, x1, lsl 2
	str	w0, [x1, 568]
	ldr	w0, [x4, 464]
	str	w0, [x1, 588]
	ldr	w0, [x4, 460]
	str	w0, [x1, 576]
	cbnz	w3, .L646
	str	wzr, [x2, 584]
.L647:
	ldrb	w0, [x4, 450]
	cmp	w0, 1
	lsl	x0, x7, 3
	beq	.L653
	sub	x7, x0, x7
	ldr	w1, [x4, 544]
	add	x7, x2, x7, lsl 2
	str	w1, [x7, 572]
	ldr	w0, [x4, 552]
	str	w0, [x7, 592]
	ldr	w0, [x4, 548]
	str	w0, [x7, 580]
.L649:
	add	w3, w3, 1
	str	w3, [x2, 116]
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L646:
	ldr	x6, [x19, 16824]
	ldr	w0, [x19, 15856]
	ldrb	w6, [x6, 3]
	add	w0, w0, 15
	lsr	w0, w0, 4
	mul	w6, w0, w6
	str	w6, [x1, 584]
	mov	w0, 0
	ldr	w1, [x19, 15100]
	ldr	w8, [x19, 15104]
	add	w1, w1, 15
	add	w8, w8, 15
	lsr	w5, w1, 4
	lsr	w1, w8, 4
	mul	w1, w5, w1
	sub	w1, w1, #1
	cmp	w6, w1
	bls	.L647
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L651:
	ldr	x2, .LC281
	mov	w4, 512
	mov	w1, 2705
	mov	w0, 1
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L652:
	ldr	x2, .LC283
	mov	w3, w0
	mov	w1, 2715
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x19
	bl	ClearPacket
	ldr	x19, [sp, 16]
	mov	w0, 1
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L653:
	sub	x7, x0, x7
	add	x7, x2, x7, lsl 2
	str	wzr, [x7, 572]
	str	wzr, [x7, 580]
	str	wzr, [x7, 592]
	b	.L649
	.size	WriteAvsSliceMsg, .-WriteAvsSliceMsg
	.align	3
.LC281:
	.xword	.LC280
	.align	3
.LC283:
	.xword	.LC282
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_GetPacketState
	.type	AVS_GetPacketState, %function
AVS_GetPacketState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L657
	add	x19, x19, 16384
	ldr	w0, [x19, 432]
	cmp	w0, 1
	cset	w0, ne
.L656:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L657:
	mov	w3, 2766
	ldr	x2, .LC284
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	b	.L656
	.size	AVS_GetPacketState, .-AVS_GetPacketState
	.align	3
.LC284:
	.xword	.LC246
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Avs_Vfmw_WQMatrix
	.type	Avs_Vfmw_WQMatrix, %function
Avs_Vfmw_WQMatrix:
	stp	x29, x30, [sp, -352]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	str	xzr, [x29, 40]
	ldr	w8, [x19, 148]
	str	wzr, [x29, 48]
	cmp	w8, 1
	str	xzr, [x29, 56]
	str	wzr, [x29, 64]
	ldr	w6, [x19, 132]
	beq	.L660
	cmp	w8, 3
	ccmp	w6, wzr, 0, eq
	beq	.L660
	cmp	w8, 2
	beq	.L731
.L664:
	cbz	w6, .L666
	mov	w0, 128
	strh	w0, [x29, 72]
	strh	w0, [x29, 74]
	strh	w0, [x29, 76]
	strh	w0, [x29, 78]
	strh	w0, [x29, 80]
	strh	w0, [x29, 82]
	strh	w0, [x29, 84]
	strh	w0, [x29, 86]
	strh	w0, [x29, 88]
	strh	w0, [x29, 90]
	strh	w0, [x29, 92]
	strh	w0, [x29, 94]
	cbnz	w8, .L732
	ldr	x3, .LC285
	add	x1, x29, 84
	add	x0, x3, 12
	add	x3, x3, 24
	.p2align 2
.L680:
	ldrh	w2, [x0], 2
	strh	w2, [x1], 2
	cmp	x0, x3
	bne	.L680
.L675:
	add	x3, x19, 204
	add	x2, x19, 332
	mov	x0, x3
	mov	w1, 128
	.p2align 2
.L672:
	strh	w1, [x0], 2
	cmp	x0, x2
	bne	.L672
	ldr	w0, [x19, 128]
	cbz	w0, .L684
	ldr	x6, .LC286
	mov	w9, 0
	ldr	w0, [x19, 152]
	add	x6, x6, 32
	add	x6, x6, x0, lsl 6
.L685:
	uxtw	x5, w9
	mov	w1, 0
	lsl	x0, x5, 2
	lsl	x7, x5, 6
	sub	x5, x0, x5
	lsl	x5, x5, 1
	.p2align 2
.L693:
	add	w4, w1, 8
	.p2align 2
.L691:
	uxtw	x0, w1
	add	x10, x29, 352
	add	x2, x7, x0
	add	w1, w1, 1
	cmp	w1, w4
	ldrb	w0, [x6, x0]
	add	x2, x10, x2, lsl 1
	add	x0, x5, x0
	add	x0, x10, x0, lsl 1
	sub	x0, x0, #4096
	ldrh	w0, [x0, 3816]
	strh	w0, [x2, -256]
	bne	.L691
	cmp	w1, 64
	bne	.L693
	add	w9, w9, 1
	cmp	w9, 2
	bne	.L685
	cbnz	w8, .L694
.L736:
	add	x0, x29, 224
	add	x2, x29, 352
	.p2align 2
.L695:
	ldrh	w1, [x0], 2
	strh	w1, [x3], 2
	cmp	x2, x0
	bne	.L695
.L658:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 352
	ret
.L666:
	ldr	x0, .LC285
	mov	x1, 0
	add	x4, x29, 72
	.p2align 2
.L669:
	ldrh	w2, [x0, x1]
	strh	w2, [x4, x1]
	add	x1, x1, 2
	cmp	x1, 12
	bne	.L669
	add	x6, x4, 12
	add	x1, x0, 12
	mov	x2, x6
	add	x0, x0, 24
	.p2align 2
.L670:
	ldrh	w3, [x1], 2
	strh	w3, [x2], 2
	cmp	x1, x0
	bne	.L670
	cbz	w8, .L675
	cmp	w8, 1
	beq	.L733
	cmp	w8, 2
	beq	.L734
	cmp	w8, 3
	bne	.L675
	mov	x0, 0
	add	x5, x29, 40
.L678:
	ldrh	w1, [x5, x0]
	strh	w1, [x4, x0]
	add	x0, x0, 2
	cmp	x0, 12
	bne	.L678
	mov	x0, 0
	add	x5, x29, 56
.L679:
	ldrh	w1, [x5, x0]
	add	x0, x0, 2
	strh	w1, [x6], 2
	cmp	x0, 12
	bne	.L679
	b	.L675
.L732:
	cmp	w8, 1
	beq	.L735
	cmp	w8, 2
	bne	.L675
	add	x1, x29, 84
	mov	x0, 0
	add	x5, x29, 56
.L683:
	ldrh	w2, [x5, x0]
	add	x0, x0, 2
	strh	w2, [x1], 2
	cmp	x0, 12
	bne	.L683
	b	.L675
	.p2align 3
.L684:
	mov	w6, 0
	mov	w5, 128
.L688:
	mov	w0, 0
	ubfiz	x4, x6, 6, 32
	.p2align 2
.L690:
	add	w2, w0, 8
	.p2align 2
.L686:
	add	x1, x4, x0, uxtw
	add	x7, x29, 352
	add	w0, w0, 1
	add	x1, x7, x1, lsl 1
	cmp	w2, w0
	strh	w5, [x1, -256]
	bne	.L686
	cmp	w2, 64
	mov	w0, w2
	bne	.L690
	add	w6, w6, 1
	cmp	w6, 2
	bne	.L688
	cbz	w8, .L736
.L694:
	cmp	w8, 1
	beq	.L737
	cmp	w8, 2
	bne	.L658
	add	x0, x29, 224
	add	x2, x29, 352
	.p2align 2
.L699:
	ldrh	w1, [x0], 2
	strh	w1, [x3], 2
	cmp	x2, x0
	bne	.L699
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 352
	ret
.L660:
	ldr	x0, .LC285
	add	x3, x19, 156
	mov	x1, 0
	add	x5, x29, 40
	.p2align 2
.L662:
	ldrh	w2, [x0, x1]
	ldr	w4, [x3], 4
	add	w2, w4, w2
	strh	w2, [x5, x1]
	add	x1, x1, 2
	cmp	x1, 12
	bne	.L662
	cmp	w8, 2
	beq	.L663
	cmp	w8, 3
	ccmp	w6, wzr, 0, eq
	bne	.L664
.L663:
	add	x3, x19, 180
	add	x0, x0, 12
	mov	x1, 0
	add	x5, x29, 56
	.p2align 2
.L665:
	ldr	w4, [x3], 4
	ldrh	w2, [x0], 2
	add	w2, w4, w2
	strh	w2, [x5, x1]
	add	x1, x1, 2
	cmp	x1, 12
	bne	.L665
	b	.L664
.L731:
	ldr	x0, .LC285
	b	.L663
.L735:
	mov	x0, 0
	add	x5, x29, 40
	add	x4, x29, 72
.L682:
	ldrh	w1, [x5, x0]
	strh	w1, [x4, x0]
	add	x0, x0, 2
	cmp	x0, 12
	bne	.L682
	b	.L675
.L733:
	mov	x0, 0
	add	x5, x29, 40
.L674:
	ldrh	w1, [x5, x0]
	strh	w1, [x4, x0]
	add	x0, x0, 2
	cmp	x0, 12
	bne	.L674
	b	.L675
.L737:
	add	x0, x29, 96
	add	x2, x0, 128
	.p2align 2
.L697:
	ldrh	w1, [x0], 2
	strh	w1, [x3], 2
	cmp	x2, x0
	bne	.L697
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 352
	ret
.L734:
	mov	x0, 0
	add	x5, x29, 56
.L677:
	ldrh	w1, [x5, x0]
	add	x0, x0, 2
	strh	w1, [x6], 2
	cmp	x0, 12
	bne	.L677
	b	.L675
	.size	Avs_Vfmw_WQMatrix, .-Avs_Vfmw_WQMatrix
	.align	3
.LC285:
	.xword	.LANCHOR2
	.align	3
.LC286:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_ParseHeader
	.type	AVS_ParseHeader, %function
AVS_ParseHeader:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 12288
	add	x21, x20, 16384
	add	x23, x19, 2648
	bl	_mcount
	mov	w1, 32
	add	x24, x19, 3544
	ldr	x22, [x23, 520]
	str	wzr, [x21, 432]
	mov	x0, x22
	bl	BsShow
	uxtb	w0, w0
	sub	w1, w0, #176
	cmp	w1, 78
	bls	.L788
.L739:
	cmp	w0, 175
	bhi	.L782
	ldr	w1, [x19, 2772]
	mov	w0, 327680
	add	x19, x19, 2648
	and	w0, w1, w0
	cmp	w0, 327680
	beq	.L789
.L782:
	mov	x0, x20
	bl	ClearPacket
.L781:
	mov	w0, 1
.L751:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L788:
	ldr	x2, .LC289
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx741
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx741:
	.section	.rodata
	.align	0
	.align	2
.L741:
	.byte	(.L740 - .Lrtx741) / 4
	.byte	(.L742 - .Lrtx741) / 4
	.byte	(.L743 - .Lrtx741) / 4
	.byte	(.L744 - .Lrtx741) / 4
	.byte	(.L782 - .Lrtx741) / 4
	.byte	(.L746 - .Lrtx741) / 4
	.byte	(.L747 - .Lrtx741) / 4
	.byte	(.L748 - .Lrtx741) / 4
	.byte	(.L782 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L739 - .Lrtx741) / 4
	.byte	(.L749 - .Lrtx741) / 4
	.text
	.p2align 3
.L744:
	add	x19, x19, 2648
	ldr	w0, [x19, 124]
	tbnz	x0, 15, .L779
	tbz	x0, 18, .L754
	mov	w2, 16383
	mov	x1, x24
	movk	w2, 0xfffb, lsl 16
	and	w2, w0, w2
	mov	x0, x23
	str	w2, [x19, 124]
	bl	AVS_i_picture_header
	b	.L785
	.p2align 3
.L746:
	ldr	w1, [x19, 2772]
	mov	w0, 327680
	tst	w1, w0
	beq	.L786
	mov	x1, x24
	mov	x0, x23
	bl	AVS_extension
	mov	x0, x20
	bl	ClearPacket
	mov	w0, 1
	b	.L751
	.p2align 3
.L747:
	add	x19, x19, 2648
	ldr	w0, [x19, 124]
	tbnz	x0, 15, .L779
	tbz	x0, 18, .L756
	mov	w2, 16383
	mov	x1, x24
	movk	w2, 0xfffb, lsl 16
	and	w2, w0, w2
	mov	x0, x23
	str	w2, [x19, 124]
	bl	AVS_pb_picture_header
.L785:
	mov	x0, x24
	bl	Avs_Vfmw_WQMatrix
.L786:
	mov	x0, x20
	bl	ClearPacket
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L748:
	add	x19, x19, 2648
	ldr	w1, [x19, 124]
	tbnz	x1, 15, .L783
	mov	w0, 327680
	tst	w1, w0
	beq	.L781
.L787:
	mov	w2, 16383
	mov	x0, x20
	movk	w2, 0xfffb, lsl 16
	and	w1, w1, w2
	str	w1, [x19, 124]
	bl	ClearPacket
	mov	w0, 0
	b	.L751
	.p2align 3
.L742:
	add	x19, x19, 2648
	ldr	w1, [x19, 124]
	tbnz	x1, 15, .L783
	mov	w0, 327680
	tst	w1, w0
	beq	.L782
	b	.L787
	.p2align 3
.L740:
	add	x19, x19, 2648
	ldr	w2, [x19, 124]
	tbnz	x2, 15, .L790
	tbz	x2, 16, .L752
	mov	w0, 16383
	mov	x1, x24
	movk	w0, 0xfffb, lsl 16
	and	w2, w2, w0
	mov	x0, x20
	str	w2, [x19, 124]
	bl	AVS_sequence_header
	mov	x0, x20
	bl	ClearPacket
	mov	w0, 0
	b	.L751
	.p2align 3
.L749:
	mov	w1, 32
	mov	x0, x22
	bl	BsSkip
	mov	w1, 32
	mov	x0, x22
	bl	BsGet
	mov	w23, w0
	mov	w1, 32
	mov	x0, x22
	bl	BsGet
	mov	w2, 20553
	mov	w1, 20036
	movk	w2, 0x4853, lsl 16
	movk	w1, 0x4345, lsl 16
	cmp	w23, w2
	ccmp	w0, w1, 0, eq
	bne	.L786
	add	x2, x19, 2648
	mov	w0, 1
	strb	w0, [x20]
	mov	w19, 1
	str	w19, [x21, 432]
	mov	x0, x20
	ldr	w1, [x2, 124]
	orr	w1, w1, 16384
	str	w1, [x2, 124]
	bl	ClearPacket
	mov	w0, w19
	b	.L751
	.p2align 3
.L743:
	ldr	w0, [x19, 2772]
	mov	w1, 1
	tbnz	x0, 18, .L780
	tbz	x0, 16, .L786
	mov	w1, 0
.L780:
	mov	x0, x20
	bl	AVS_user_data
	b	.L782
	.p2align 3
.L783:
	mov	w0, 1
	str	w0, [x21, 432]
	orr	w1, w1, 16384
	str	w1, [x19, 124]
	b	.L751
	.p2align 3
.L756:
	mov	x1, x24
	mov	x0, x23
	bl	AVS_pb_picture_header
.L784:
	mov	x0, x24
	bl	Avs_Vfmw_WQMatrix
	mov	x0, x20
	bl	ClearPacket
	mov	w0, 1
	b	.L751
	.p2align 3
.L754:
	mov	x1, x24
	mov	x0, x23
	bl	AVS_i_picture_header
	b	.L784
	.p2align 3
.L752:
	mov	x1, x24
	mov	x0, x20
	bl	AVS_sequence_header
	mov	x0, x20
	bl	ClearPacket
	mov	w0, 1
	b	.L751
.L789:
	orr	w1, w1, 32768
	mov	x0, x20
	str	w1, [x19, 124]
	bl	WriteAvsSliceMsg
	cbnz	w0, .L781
	b	.L786
	.p2align 3
.L779:
	mov	w20, 1
	str	w20, [x21, 432]
	orr	w1, w0, 16384
	mov	x0, x24
	str	w1, [x19, 124]
	bl	Avs_Vfmw_WQMatrix
	mov	w0, w20
	b	.L751
	.p2align 3
.L790:
	mov	w0, 1
	str	w0, [x21, 432]
	orr	w2, w2, 16384
	str	w2, [x19, 124]
	b	.L751
	.size	AVS_ParseHeader, .-AVS_ParseHeader
	.align	3
.LC289:
	.xword	.L741
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVSDEC_Decode
	.type	AVSDEC_Decode, %function
AVSDEC_Decode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x21, xzr, 4, ne
	beq	.L806
	add	x19, x20, 12288
	ldr	w2, [x21, 20]
	ldr	x1, [x21]
	add	x0, x19, 3504
	add	x19, x19, 2648
	bl	BsInit
	ldr	x3, .LC291
	add	x0, x20, 16384
	mov	x1, x21
	mov	x2, 176
	add	x0, x0, 440
	ldr	x3, [x3, 104]
	blr	x3
	ldr	w0, [x19, 124]
	str	w0, [x19, 852]
	mov	x0, x20
	bl	AVS_ParseHeader
	mov	w21, w0
	cbz	w0, .L807
	mov	w0, 49152
	ldr	w1, [x19, 124]
	movk	w0, 0x5, lsl 16
	and	w0, w1, w0
	cmp	w0, 376832
	beq	.L795
.L796:
	mov	w21, 0
.L793:
	mov	w0, w21
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L806:
	mov	w3, 2368
	ldr	x2, .LC290
	mov	w1, w3
	mov	w0, 0
	mov	w21, 0
	bl	dprint_normal
	mov	w0, w21
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L807:
	ldr	x2, .LC293
	mov	w1, 2382
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x20
	bl	AVS_ClearCurPic
	mov	w0, w21
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L795:
	mov	x0, x20
	bl	AVS_DecodeArbiter.part.5
	cbz	w0, .L796
	mov	x0, x20
	bl	AVS_GetStreamInf
	cmp	w0, 3
	beq	.L797
	cbz	w0, .L808
	mov	x0, x20
	bl	AVS_StartDecode
	mov	w21, w0
	cbz	w0, .L809
	mov	w21, 1
	b	.L793
	.p2align 3
.L808:
	ldr	x2, .LC295
	mov	w1, 2404
	mov	w0, 1
	mov	w21, 0
	bl	dprint_normal
	mov	x0, x20
	bl	AVS_ClearCurPic
	b	.L793
	.p2align 3
.L797:
	ldr	w1, [x19, 852]
	mov	w21, w0
	str	w1, [x19, 124]
	b	.L793
	.p2align 3
.L809:
	ldr	x2, .LC297
	mov	w1, 2413
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x20
	bl	AVS_ClearCurPic
	b	.L793
	.size	AVSDEC_Decode, .-AVSDEC_Decode
	.align	3
.LC290:
	.xword	.LC246
	.align	3
.LC291:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC293:
	.xword	.LC292
	.align	3
.LC295:
	.xword	.LC294
	.align	3
.LC297:
	.xword	.LC296
	.global	wq_param_default
	.global	g_AvsCfg
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.9943, %object
	.size	__func__.9943, 20
__func__.9943:
	.string	"AVS_sequence_header"
	.zero	4
	.type	frame_rate_Table, %object
	.size	frame_rate_Table, 64
frame_rate_Table:
	.word	0
	.word	23976
	.word	24000
	.word	25000
	.word	29970
	.word	30000
	.word	50000
	.word	59940
	.word	60000
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.10034, %object
	.size	__func__.10034, 16
__func__.10034:
	.string	"AVS_AllocateVHB"
	.type	CSWTCH.51, %object
	.size	CSWTCH.51, 16
CSWTCH.51:
	.word	5
	.word	1
	.word	2
	.word	3
	.type	WeightQuantModel, %object
	.size	WeightQuantModel, 256
WeightQuantModel:
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	5
	.byte	5
	.byte	0
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	1
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	0
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	5
	.byte	5
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.byte	5
	.byte	5
	.byte	5
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	1
	.byte	1
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.data
	.align	3
.LANCHOR2 = . + 0
	.type	wq_param_default, %object
	.size	wq_param_default, 24
wq_param_default:
	.hword	135
	.hword	143
	.hword	143
	.hword	160
	.hword	160
	.hword	213
	.hword	128
	.hword	98
	.hword	106
	.hword	116
	.hword	116
	.hword	128
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	ASCII(.string	"%-40s     %#-8x(%db)\n" )
	.zero	2
.LC5:
	ASCII(.string	"video_sequence_start_code" )
	.zero	6
.LC7:
	ASCII(.string	"profile_id" )
	.zero	5
.LC9:
	ASCII(.string	"level_id" )
	.zero	7
.LC11:
	ASCII(.string	"progressive_sequence" )
	.zero	3
.LC13:
	ASCII(.string	"horizontal_size" )
.LC15:
	ASCII(.string	"vertical_size" )
	.zero	2
.LC17:
	ASCII(.string	"chroma_format" )
	.zero	2
.LC19:
	ASCII(.string	"sample_precision" )
	.zero	7
.LC21:
	ASCII(.string	"aspect_ratio" )
	.zero	3
.LC23:
	ASCII(.string	"frame_rate_code" )
.LC25:
	ASCII(.string	"bit_rate_lower" )
	.zero	1
.LC27:
	ASCII(.string	"marker_bit" )
	.zero	5
.LC29:
	ASCII(.string	"bit_rate_upper" )
	.zero	1
.LC31:
	ASCII(.string	"low_delay" )
	.zero	6
.LC33:
	ASCII(.string	"bbv_buffer_size" )
.LC35:
	ASCII(.string	"reserved_bits" )
	.zero	2
.LC38:
	ASCII(.string	"%s: not support solution(w = %d, h = %d)\n" )
	.zero	6
.LC47:
	ASCII(.string	"i_picture_start_code" )
	.zero	3
.LC49:
	ASCII(.string	"bbv_delay" )
	.zero	6
.LC52:
	ASCII(.string	"bbv_delay_extension" )
	.zero	4
.LC54:
	ASCII(.string	"time_code_flag" )
	.zero	1
.LC56:
	ASCII(.string	"time_code" )
	.zero	6
.LC58:
	ASCII(.string	"picture_distance" )
	.zero	7
.LC60:
	ASCII(.string	"bbv_check_times" )
.LC62:
	ASCII(.string	"progressive_frame" )
	.zero	6
.LC64:
	ASCII(.string	"picture_structure" )
	.zero	6
.LC66:
	ASCII(.string	"top_field_first" )
.LC68:
	ASCII(.string	"repeat_first_field" )
	.zero	5
.LC70:
	ASCII(.string	"fixed_picture_qp" )
	.zero	7
.LC72:
	ASCII(.string	"picture_qp" )
	.zero	5
.LC74:
	ASCII(.string	"skip_mode_flag" )
	.zero	1
.LC77:
	ASCII(.string	"loop_filter_disable" )
	.zero	4
.LC79:
	ASCII(.string	"loop_filter_parameter_flag" )
	.zero	5
.LC81:
	ASCII(.string	"alpha_c_offset" )
	.zero	1
.LC83:
	ASCII(.string	"beta_offset" )
	.zero	4
.LC85:
	ASCII(.string	"weighting_quant_flag" )
	.zero	3
.LC87:
	ASCII(.string	"aec_enable" )
	.zero	5
.LC89:
	ASCII(.string	"mb_adapt_weighting_quant_disable" )
	.zero	7
.LC91:
	ASCII(.string	"chroma_quant_param_disable" )
	.zero	5
.LC93:
	ASCII(.string	"chroma_quant_param_delta_u" )
	.zero	5
.LC95:
	ASCII(.string	"chroma_quant_param_delta_v" )
	.zero	5
.LC97:
	ASCII(.string	"weighting_quant_param_index" )
	.zero	4
.LC99:
	ASCII(.string	"weighting_quant_model" )
	.zero	2
.LC101:
	ASCII(.string	"weighting_quant_param_deltal1" )
	.zero	2
.LC103:
	ASCII(.string	"weighting_quant_param_deltal2" )
	.zero	2
.LC106:
	ASCII(.string	"pb_picture_start_code" )
	.zero	2
.LC111:
	ASCII(.string	"picture_coding_type" )
	.zero	4
.LC117:
	ASCII(.string	"advanced_pred_mode_disable" )
	.zero	5
.LC123:
	ASCII(.string	"picture_reference_flag" )
	.zero	1
.LC125:
	ASCII(.string	"no_forward_reference_flag" )
	.zero	6
.LC127:
	ASCII(.string	"b_filed_enhanced_flag" )
	.zero	2
.LC129:
	ASCII(.string	"p_filed_enhanced_flag" )
	.zero	2
.LC147:
	ASCII(.string	"user_data_start_code" )
	.zero	3
.LC151:
	ASCII(.string	"extension_ID" )
	.zero	3
.LC153:
	ASCII(.string	"video_format" )
	.zero	3
.LC155:
	ASCII(.string	"sample_range" )
	.zero	3
.LC157:
	ASCII(.string	"colour_description" )
	.zero	5
.LC159:
	ASCII(.string	"colour_primaries" )
	.zero	7
.LC161:
	ASCII(.string	"transfer_characteristics" )
	.zero	7
.LC163:
	ASCII(.string	"matrix_coefficients" )
	.zero	4
.LC165:
	ASCII(.string	"display_horizontal_size" )
.LC168:
	ASCII(.string	"display_vertical_size" )
	.zero	2
.LC172:
	ASCII(.string	"copyright_flag" )
	.zero	1
.LC174:
	ASCII(.string	"copyright_id" )
	.zero	3
.LC176:
	ASCII(.string	"original_or_copy" )
	.zero	7
.LC180:
	ASCII(.string	"copyright_number_1" )
	.zero	5
.LC182:
	ASCII(.string	"copyright_number_2" )
	.zero	5
.LC184:
	ASCII(.string	"copyright_number_3" )
	.zero	5
.LC188:
	ASCII(.string	"camera_id" )
	.zero	6
.LC191:
	ASCII(.string	"height_of_image_device" )
	.zero	1
.LC193:
	ASCII(.string	"focal_length" )
	.zero	3
.LC195:
	ASCII(.string	"f_number" )
	.zero	7
.LC197:
	ASCII(.string	"vertical_angle_of_view" )
	.zero	1
.LC199:
	ASCII(.string	"camera_position_x_upper" )
.LC201:
	ASCII(.string	"camera_position_x_lower" )
.LC203:
	ASCII(.string	"camera_position_y_upper" )
.LC205:
	ASCII(.string	"camera_position_y_lower" )
.LC207:
	ASCII(.string	"camera_position_z_upper" )
.LC209:
	ASCII(.string	"camera_position_z_lower" )
.LC211:
	ASCII(.string	"camera_direction_x" )
	.zero	5
.LC213:
	ASCII(.string	"camera_direction_y" )
	.zero	5
.LC215:
	ASCII(.string	"camera_direction_z" )
	.zero	5
.LC217:
	ASCII(.string	"image_plane_vertical_x" )
	.zero	1
.LC219:
	ASCII(.string	"image_plane_vertical_y" )
	.zero	1
.LC221:
	ASCII(.string	"image_plane_vertical_z" )
	.zero	1
.LC224:
	ASCII(.string	"frame_centre_horizontal_offset" )
	.zero	1
.LC227:
	ASCII(.string	"frame_centre_vertical_offset" )
	.zero	3
.LC229:
	ASCII(.string	"extension_start_code" )
	.zero	3
.LC234:
	ASCII(.string	"%s arrange fs pool failed!\n" )
	.zero	4
.LC238:
	ASCII(.string	"line: %d, pImage is NULL!\n" )
	.zero	5
.LC241:
	ASCII(.string	"line: %d pImage is null\n" )
	.zero	7
.LC243:
	ASCII(.string	"ERROR: get frame store fail!\n" )
	.zero	2
.LC246:
	ASCII(.string	"line: %d\n" )
	.zero	6
.LC248:
	ASCII(.string	"ERROR: AVS_OutputOneFrame is err(%d)\n" )
	.zero	2
.LC252:
	ASCII(.string	"size change\n" )
	.zero	3
.LC254:
	ASCII(.string	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d,new w/h = %d/%d\n" )
	.zero	3
.LC257:
	ASCII(.string	"ERROR: allocate vhb\n" )
	.zero	3
.LC259:
	ASCII(.string	"ERROR: get img buf err\n" )
.LC262:
	ASCII(.string	"Chan:%d dec_pts: %lld Usertag = %lld\n" )
	.zero	2
.LC266:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC272:
	ASCII(.string	"-----Pic %5d, type %d, struct %d-----\n" )
	.zero	1
.LC276:
	ASCII(.string	"ERROR: err_level(%d) over ref_thr(%d)\n" )
	.zero	1
.LC278:
	ASCII(.string	"ERROR: err_level(%d) over out_thr(%d)\n" )
	.zero	1
.LC280:
	ASCII(.string	"SlcNum %d > %d Write slice msg failed\n" )
	.zero	1
.LC282:
	ASCII(.string	"This slice's start mbn %d <= LastSliceFirstMb %d, Write slice msg failed\n" )
	.zero	6
.LC292:
	ASCII(.string	"ERROR: paseHeader err\n" )
	.zero	1
.LC294:
	ASCII(.string	"ERROR: AVS_PrepareDecode err\n" )
	.zero	2
.LC296:
	ASCII(.string	"ERROR: AVS_StartDecode err\n" )
	.bss
	.align	3
	.type	g_AvsCfg, %object
	.size	g_AvsCfg, 512
g_AvsCfg:
	.zero	512
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
