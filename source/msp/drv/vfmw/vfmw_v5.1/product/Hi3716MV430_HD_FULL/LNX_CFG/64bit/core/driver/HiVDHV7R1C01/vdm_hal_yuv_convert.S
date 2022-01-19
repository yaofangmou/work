#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal_yuv_convert.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	IMAGE_DEC_TileTo2D
	.type	IMAGE_DEC_TileTo2D, %function
IMAGE_DEC_TileTo2D:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x28, x0
	mov	x0, x30
	mov	w21, w2
	mov	w19, w1
	mov	x20, x3
	str	w2, [x29, 104]
	bl	_mcount
	ldr	w0, [x28, 44]
	str	w0, [x29, 100]
	ldr	w0, [x28, 48]
	cbz	w21, .L1
	lsr	w0, w0, 5
	ldr	x27, .LC0
	ldr	x25, .LC1
	lsr	w1, w19, 2
	lsl	w0, w0, 1
	str	w0, [x29, 108]
	stp	w1, wzr, [x29, 128]
	stp	wzr, wzr, [x29, 136]
	.p2align 2
.L6:
	cbz	w19, .L8
	ldr	w2, [x29, 140]
	mov	w26, 0
	ldr	w3, [x29, 108]
	lsr	w0, w2, 1
	lsr	w21, w2, 4
	ubfiz	w1, w2, 4, 1
	ldr	w24, [x29, 132]
	mul	w0, w0, w3
	ldr	w3, [x29, 100]
	uxtw	x1, w1
	add	x0, x0, x1
	and	x22, x2, 15
	mul	w23, w3, w21
	ldr	w3, [x29, 136]
	ubfiz	x21, x21, 2, 1
	stp	x0, x3, [x29, 112]
	b	.L5
	.p2align 3
.L4:
	lsr	w0, w26, 6
	ldr	x1, [x20]
	and	x4, x0, 3
	ubfiz	x3, x0, 10, 22
	add	x4, x21, x4
	add	x0, x24, x26, uxtw
	add	x0, x1, x0
	ldr	x8, [x28]
	add	x4, x22, x4, lsl 4
	ldr	x7, [x27, 104]
	mov	x2, 64
	add	w26, w26, 64
	ldr	w1, [x25, x4, lsl 2]
	ubfiz	x1, x1, 6, 26
	add	x1, x1, x23
	add	x1, x1, x3
	add	x1, x8, x1
	blr	x7
	cmp	w19, w26
	bls	.L8
.L5:
	ldr	w0, [x28, 32]
	cmp	w0, 10
	bne	.L4
	lsr	w2, w26, 2
	ldr	x0, [x29, 112]
	ubfiz	x1, x2, 1, 30
	ldr	x4, [x20, 8]
	add	x1, x1, x0
	ldr	x0, [x29, 120]
	ldr	x7, [x28, 8]
	add	x0, x2, x0
	ldr	x3, [x27, 104]
	add	x1, x7, x1
	mov	x2, 16
	add	x0, x4, x0
	blr	x3
	b	.L4
	.p2align 3
.L8:
	ldr	w1, [x29, 132]
	ldr	w0, [x29, 140]
	add	w1, w1, w19
	str	w1, [x29, 132]
	ldr	w1, [x29, 104]
	add	w0, w0, 1
	str	w0, [x29, 140]
	cmp	w1, w0
	ldr	w0, [x29, 136]
	ldr	w1, [x29, 128]
	add	w0, w0, w1
	str	w0, [x29, 136]
	bne	.L6
	ldr	w1, [x29, 104]
	lsr	w0, w1, 1
	str	w0, [x29, 104]
	cbz	w0, .L1
	ldr	w1, [x29, 100]
	ldr	x27, .LC0
	ldr	x25, .LC1
	lsr	w0, w1, 1
	stp	wzr, wzr, [x29, 132]
	str	w0, [x29, 100]
	str	wzr, [x29, 140]
	.p2align 2
.L12:
	cbz	w19, .L13
	ldr	w2, [x29, 140]
	mov	w26, 0
	ldr	w3, [x29, 108]
	lsr	w0, w2, 1
	lsr	w21, w2, 3
	ubfiz	w1, w2, 4, 1
	ldr	w24, [x29, 132]
	mul	w0, w0, w3
	ldr	w3, [x29, 100]
	uxtw	x1, w1
	add	x0, x0, x1
	and	x22, x2, 7
	mul	w23, w21, w3
	ldr	w3, [x29, 136]
	ubfiz	x21, x21, 2, 1
	stp	x0, x3, [x29, 112]
	b	.L11
	.p2align 3
.L10:
	lsr	w1, w26, 6
	add	x10, x25, 512
	and	x4, x1, 3
	ubfiz	x3, x1, 9, 23
	add	x4, x21, x4
	ldr	x1, [x20, 16]
	add	x0, x24, x26, uxtw
	ldr	x8, [x28, 16]
	add	x4, x22, x4, lsl 3
	add	x0, x1, x0
	ldr	x7, [x27, 104]
	mov	x2, 64
	add	w26, w26, 64
	ldr	w1, [x10, x4, lsl 2]
	ubfiz	x1, x1, 6, 26
	add	x1, x1, x23
	add	x1, x1, x3
	add	x1, x8, x1
	blr	x7
	cmp	w19, w26
	bls	.L13
.L11:
	ldr	w0, [x28, 32]
	cmp	w0, 10
	bne	.L10
	lsr	w2, w26, 2
	ldr	x0, [x29, 112]
	ubfiz	x1, x2, 1, 30
	ldr	x4, [x20, 24]
	add	x1, x1, x0
	ldr	x0, [x29, 120]
	ldr	x7, [x28, 24]
	add	x0, x2, x0
	ldr	x3, [x27, 104]
	add	x1, x7, x1
	mov	x2, 16
	add	x0, x4, x0
	blr	x3
	b	.L10
	.p2align 3
.L13:
	ldr	w1, [x29, 132]
	ldr	w0, [x29, 140]
	add	w1, w1, w19
	str	w1, [x29, 132]
	ldr	w1, [x29, 104]
	add	w0, w0, 1
	str	w0, [x29, 140]
	cmp	w0, w1
	ldr	w0, [x29, 136]
	ldr	w1, [x29, 128]
	add	w0, w0, w1
	str	w0, [x29, 136]
	bne	.L12
.L1:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.size	IMAGE_DEC_TileTo2D, .-IMAGE_DEC_TileTo2D
	.align	3
.LC0:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IMAGE_DEC_LinearTo2D
	.type	IMAGE_DEC_LinearTo2D, %function
IMAGE_DEC_LinearTo2D:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x25, x0
	mov	x0, x30
	mov	w21, w2
	mov	w19, w1
	mov	x20, x3
	str	w2, [x29, 108]
	bl	_mcount
	ldr	w0, [x25, 48]
	str	w0, [x29, 104]
	cbz	w21, .L27
	uxtw	x0, w19
	mov	w23, 0
	str	x0, [x29, 112]
	mov	w21, 0
	lsr	w0, w19, 2
	ldr	x28, .LC3
	str	wzr, [x29, 124]
	str	w0, [x29, 120]
	b	.L30
	.p2align 3
.L32:
	ldr	w1, [x25, 44]
	ldp	w6, w5, [x29, 120]
	lsr	w1, w1, 4
	ldr	x0, [x20]
	ldr	x4, [x25]
	add	w5, w5, w6
	mul	w1, w1, w21
	ldr	x3, [x28, 104]
	add	x0, x0, x23, uxtw
	ldr	x2, [x29, 112]
	add	x1, x4, x1
	str	w5, [x29, 124]
	add	w21, w21, 1
	add	w23, w23, w19
	blr	x3
	ldr	w0, [x29, 108]
	cmp	w0, w21
	beq	.L54
.L30:
	ldr	w0, [x25, 32]
	cmp	w0, 10
	bne	.L32
	cbz	w19, .L32
	ldr	w0, [x29, 104]
	lsr	w22, w21, 5
	ldr	w26, [x29, 124]
	mov	w27, 0
	and	x24, x21, 31
	mul	w22, w22, w0
	.p2align 2
.L33:
	lsr	w3, w27, 6
	ldr	x0, .LC4
	ubfiz	x7, x3, 5, 2
	ldr	x9, [x20, 8]
	add	x10, x0, 768
	add	x7, x7, x24
	ubfx	x0, x27, 2, 30
	ldr	x1, [x25, 8]
	add	x0, x0, x26
	ldr	x8, [x28, 104]
	ldr	w7, [x10, x7, lsl 2]
	mov	x2, 16
	add	x0, x9, x0
	add	w27, w27, 64
	add	w3, w7, w3, lsl 5
	ubfiz	x3, x3, 4, 26
	add	x3, x3, x22
	add	x1, x1, x3
	blr	x8
	cmp	w19, w27
	bhi	.L33
	b	.L32
	.p2align 3
.L27:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L54:
	ldr	w1, [x29, 108]
	lsr	w0, w1, 1
	str	w0, [x29, 108]
	cbz	w0, .L27
	ldr	w1, [x29, 104]
	mov	w23, 0
	mov	w21, 0
	str	wzr, [x29, 124]
	lsr	w0, w1, 1
	str	w0, [x29, 104]
	b	.L36
	.p2align 3
.L37:
	ldr	w1, [x25, 44]
	ldp	w6, w5, [x29, 120]
	lsr	w1, w1, 4
	ldr	x0, [x20, 16]
	ldr	x4, [x25, 16]
	add	w5, w5, w6
	mul	w1, w1, w21
	ldr	x3, [x28, 104]
	add	x0, x0, x23, uxtw
	ldr	x2, [x29, 112]
	add	x1, x4, x1
	str	w5, [x29, 124]
	add	w21, w21, 1
	add	w23, w23, w19
	blr	x3
	ldr	w0, [x29, 108]
	cmp	w21, w0
	beq	.L27
.L36:
	ldr	w0, [x25, 32]
	cmp	w0, 10
	bne	.L37
	cbz	w19, .L37
	ldr	w0, [x29, 104]
	lsr	w22, w21, 4
	ldr	w26, [x29, 124]
	mov	w27, 0
	and	x24, x21, 15
	mul	w22, w22, w0
	.p2align 2
.L38:
	ldr	x0, .LC4
	lsr	w3, w27, 6
	ldr	x9, [x20, 24]
	mov	x2, 16
	add	x1, x0, 1280
	ldr	x8, [x25, 24]
	ubfx	x0, x27, 2, 30
	ldr	x7, [x28, 104]
	add	x0, x0, x26
	add	w27, w27, 64
	ldr	w1, [x1, x24, lsl 2]
	add	x0, x9, x0
	add	w1, w1, w3, lsl 4
	ubfiz	x1, x1, 4, 26
	add	x1, x1, x22
	add	x1, x8, x1
	blr	x7
	cmp	w19, w27
	bhi	.L38
	b	.L37
	.size	IMAGE_DEC_LinearTo2D, .-IMAGE_DEC_LinearTo2D
	.align	3
.LC3:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC4:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IMAGE_DISP_LinearTo2D
	.type	IMAGE_DISP_LinearTo2D, %function
IMAGE_DISP_LinearTo2D:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x3
	mov	x27, x0
	mov	x0, x30
	mov	w25, w1
	mov	w22, w2
	str	w2, [x29, 124]
	bl	_mcount
	ldr	x19, [x20, 24]
	ldr	w21, [x27, 44]
	ldr	x9, [x20]
	add	x19, x19, 1044480
	ldr	x6, [x27]
	cbz	w22, .L55
	add	w22, w25, w25, lsl 2
	lsr	w26, w25, 2
	ubfx	x0, x22, 2, 30
	uxtw	x21, w21
	str	x0, [x29, 104]
	mov	w24, 0
	uxtw	x0, w25
	ldr	x28, .LC7
	mov	w23, 1
	mov	w22, 0
	str	x0, [x29, 112]
	b	.L62
	.p2align 3
.L57:
	ldr	x4, [x29, 112]
	mov	x1, x6
	ldr	x3, [x28, 104]
	add	x6, x6, x21
	mov	x0, x9
	mov	x2, x4
	add	x9, x9, x4
	add	w22, w22, 1
	stp	x6, x9, [x29, 128]
	blr	x3
	add	w23, w23, w25
	ldr	w0, [x29, 124]
	add	w24, w24, w26
	ldp	x6, x9, [x29, 128]
	cmp	w0, w22
	beq	.L79
.L62:
	ldr	w0, [x27, 32]
	cmp	w0, 10
	bne	.L57
	ldr	x3, [x28, 104]
	mov	x1, x6
	ldr	x2, [x29, 104]
	mov	x0, x19
	stp	x9, x6, [x29, 128]
	blr	x3
	ldp	x9, x6, [x29, 128]
	cbz	w25, .L61
	mov	w1, w23
	mov	w2, 0
	mov	w0, 0
	.p2align 2
.L58:
	add	w14, w0, 1
	uxtw	x15, w0
	ldr	x18, [x20]
	sub	w17, w1, #1
	add	w13, w0, 2
	add	w16, w0, 3
	ldrb	w12, [x19, x14]
	add	w10, w1, 1
	ldrb	w11, [x19, x15]
	add	w4, w0, 4
	add	w3, w1, 2
	cmp	w2, w26
	lsr	w11, w11, 2
	add	w0, w0, 5
	add	w11, w11, w12, lsl 6
	strb	w11, [x18, x17]
	add	w12, w2, w24
	add	w2, w2, 1
	ldrb	w17, [x19, x13]
	ldrb	w11, [x19, x14]
	ldr	x18, [x20]
	lsr	w11, w11, 4
	add	w11, w11, w17, lsl 4
	strb	w11, [x18, w1, uxtw]
	add	w1, w1, 4
	ldrb	w17, [x19, x16]
	ldrb	w11, [x19, x13]
	ldr	x18, [x20]
	lsr	w11, w11, 6
	add	w11, w11, w17, lsl 2
	strb	w11, [x18, x10]
	ldr	x10, [x20]
	ldrb	w4, [x19, x4]
	strb	w4, [x10, x3]
	bcs	.L60
	ldrb	w4, [x19, x13]
	ldrb	w11, [x19, x16]
	ldrb	w10, [x19, x15]
	and	w4, w4, 48
	ldrb	w3, [x19, x14]
	and	w11, w11, 192
	ldr	x13, [x20, 8]
	and	w10, w10, 3
	and	w3, w3, 12
	add	w10, w11, w10
	add	w3, w3, w4
	add	w3, w10, w3
	strb	w3, [x13, x12]
.L60:
	cmp	w25, w2, lsl 2
	bhi	.L58
.L61:
	ldr	w0, [x29, 124]
	add	w22, w22, 1
	add	x6, x6, x21
	add	w23, w23, w25
	cmp	w0, w22
	add	w24, w24, w26
	bne	.L62
.L79:
	lsr	w0, w0, 1
	str	w0, [x29, 124]
	ldr	x9, [x20, 16]
	ldr	x7, [x27, 16]
	cbz	w0, .L55
	uxtw	x0, w25
	mov	w24, 0
	mov	w23, 1
	mov	w22, 0
	str	x0, [x29, 112]
	b	.L69
	.p2align 3
.L64:
	ldr	x4, [x29, 112]
	mov	x1, x7
	ldr	x3, [x28, 104]
	add	x7, x7, x21
	mov	x0, x9
	mov	x2, x4
	add	x9, x9, x4
	add	w22, w22, 1
	stp	x7, x9, [x29, 128]
	blr	x3
	add	w23, w23, w25
	ldr	w0, [x29, 124]
	add	w24, w24, w26
	ldp	x7, x9, [x29, 128]
	cmp	w22, w0
	beq	.L55
.L69:
	ldr	w0, [x27, 32]
	cmp	w0, 10
	bne	.L64
	ldr	x3, [x28, 104]
	mov	x1, x7
	ldr	x2, [x29, 104]
	mov	x0, x19
	stp	x9, x7, [x29, 128]
	blr	x3
	ldp	x9, x7, [x29, 128]
	cbz	w25, .L68
	mov	w1, w23
	mov	w2, 0
	mov	w0, 0
	.p2align 2
.L65:
	add	w14, w0, 1
	uxtw	x15, w0
	ldr	x18, [x20, 16]
	sub	w17, w1, #1
	add	w13, w0, 2
	add	w16, w0, 3
	ldrb	w12, [x19, x14]
	add	w10, w1, 1
	ldrb	w11, [x19, x15]
	add	w4, w0, 4
	add	w3, w1, 2
	cmp	w2, w26
	lsr	w11, w11, 2
	add	w0, w0, 5
	add	w11, w11, w12, lsl 6
	strb	w11, [x18, x17]
	add	w12, w2, w24
	add	w2, w2, 1
	ldrb	w17, [x19, x13]
	ldrb	w11, [x19, x14]
	ldr	x18, [x20, 16]
	lsr	w11, w11, 4
	add	w11, w11, w17, lsl 4
	strb	w11, [x18, w1, uxtw]
	add	w1, w1, 4
	ldrb	w17, [x19, x16]
	ldrb	w11, [x19, x13]
	ldr	x18, [x20, 16]
	lsr	w11, w11, 6
	add	w11, w11, w17, lsl 2
	strb	w11, [x18, x10]
	ldr	x10, [x20, 16]
	ldrb	w4, [x19, x4]
	strb	w4, [x10, x3]
	bcs	.L67
	ldrb	w4, [x19, x13]
	ldrb	w11, [x19, x16]
	ldrb	w10, [x19, x15]
	and	w4, w4, 48
	ldrb	w3, [x19, x14]
	and	w11, w11, 192
	ldr	x13, [x20, 24]
	and	w10, w10, 3
	and	w3, w3, 12
	add	w10, w11, w10
	add	w3, w3, w4
	add	w3, w10, w3
	strb	w3, [x13, x12]
.L67:
	cmp	w25, w2, lsl 2
	bhi	.L65
.L68:
	ldr	w0, [x29, 124]
	add	w22, w22, 1
	add	x7, x7, x21
	add	w23, w23, w25
	cmp	w22, w0
	add	w24, w24, w26
	bne	.L69
.L55:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.size	IMAGE_DISP_LinearTo2D, .-IMAGE_DISP_LinearTo2D
	.align	3
.LC7:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IMAGE_ConvertTo2D
	.type	IMAGE_ConvertTo2D, %function
IMAGE_ConvertTo2D:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	uxtb	w20, w4
	mov	w21, w1
	mov	w22, w2
	mov	x23, x3
	bl	_mcount
	cmp	w20, 1
	beq	.L84
	ldr	w0, [x19, 40]
	mov	x3, x23
	mov	w2, w22
	mov	w1, w21
	cmp	w0, 1
	mov	x0, x19
	beq	.L85
	bl	IMAGE_DEC_LinearTo2D
.L80:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L85:
	bl	IMAGE_DEC_TileTo2D
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L84:
	mov	x3, x23
	mov	w2, w22
	mov	w1, w21
	mov	x0, x19
	bl	IMAGE_DISP_LinearTo2D
	b	.L80
	.size	IMAGE_ConvertTo2D, .-IMAGE_ConvertTo2D
	.global	g_RowMapTable_UV_2b
	.global	g_RowMapTable_Y_2b
	.global	g_RowMapTable_UV
	.global	g_RowMapTable_Y
	.data
	.align	3
.LANCHOR0 = . + 0
	.type	g_RowMapTable_Y, %object
	.size	g_RowMapTable_Y, 512
g_RowMapTable_Y:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.word	12
	.word	13
	.word	14
	.word	15
	.word	8
	.word	9
	.word	10
	.word	11
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	12
	.word	13
	.word	14
	.word	15
	.word	8
	.word	9
	.word	10
	.word	11
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.word	12
	.word	13
	.word	14
	.word	15
	.word	8
	.word	9
	.word	10
	.word	11
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	12
	.word	13
	.word	14
	.word	15
	.word	8
	.word	9
	.word	10
	.word	11
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.type	g_RowMapTable_UV, %object
	.size	g_RowMapTable_UV, 256
g_RowMapTable_UV:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.type	g_RowMapTable_Y_2b, %object
	.size	g_RowMapTable_Y_2b, 512
g_RowMapTable_Y_2b:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	26
	.word	27
	.word	28
	.word	29
	.word	30
	.word	31
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	26
	.word	27
	.word	28
	.word	29
	.word	30
	.word	31
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	26
	.word	27
	.word	28
	.word	29
	.word	30
	.word	31
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	26
	.word	27
	.word	28
	.word	29
	.word	30
	.word	31
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.type	g_RowMapTable_UV_2b, %object
	.size	g_RowMapTable_UV_2b, 64
g_RowMapTable_UV_2b:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
