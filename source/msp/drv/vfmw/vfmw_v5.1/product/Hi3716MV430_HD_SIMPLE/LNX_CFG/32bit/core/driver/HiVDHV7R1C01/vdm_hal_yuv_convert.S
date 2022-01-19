#include "hi_asm_define.h"
	.arch armv7-a
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"vdm_hal_yuv_convert.c"
	.text
	.align	2
	.global	IMAGE_DEC_TileTo2D
	.type	IMAGE_DEC_TileTo2D, %function
IMAGE_DEC_TileTo2D:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #44)
	sub	sp, sp, #44
	mov	r9, r3
	ldr	r3, [r0, #28]
	cmp	r2, #0
	mov	r5, r0
	str	r2, [fp, #-76]
	str	r1, [fp, #-48]
	str	r3, [fp, #-80]
	ldr	r3, [r0, #32]
	beq	.L1
	ldr	r8, .L27
	mov	r2, #0
	mov	r10, r2
	mov	r3, r3, lsr #5
	str	r2, [fp, #-56]
	str	r3, [fp, #-72]
	mov	r3, r1, lsr #2
	str	r2, [fp, #-60]
	str	r3, [fp, #-68]
.L3:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L7
	ldr	r1, [fp, #-60]
	mov	r4, #0
	ldr	r0, [fp, #-72]
	and	r2, r1, #1
	mov	r3, r1, lsr #1
	mov	r6, r1, lsr #4
	and	r7, r6, #1
	and	r1, r1, #15
	mul	r3, r0, r3
	ldr	r0, [fp, #-80]
	mov	r7, r7, asl #2
	str	r1, [fp, #-52]
	add	r3, r3, r2, lsl #3
	str	r3, [fp, #-64]
	mul	r6, r0, r6
	b	.L5
.L4:
	mov	r1, r4, lsr #6
	ldr	r0, [r9]
	add	r3, r10, r4
	and	r2, r1, #3
	add	r0, r0, r3
	add	r2, r7, r2
	ldr	r3, [fp, #-52]
	add	r4, r4, #64
	ldr	ip, .L27+4
	add	r2, r3, r2, lsl #4
	ldr	lr, [r5]
	ldr	r3, [r8, #52]
	ldr	ip, [ip, r2, asl #2]
	mov	r2, #64
	add	ip, r6, ip, lsl #6
	add	r1, ip, r1, lsl #10
	add	r1, lr, r1
	blx	r3
	ldr	r3, [fp, #-48]
	cmp	r3, r4
	bls	.L7
.L5:
	ldr	r3, [r5, #16]
	cmp	r3, #10
	bne	.L4
	ldr	r2, [fp, #-64]
	mov	r3, r4, lsr #2
	ldr	r0, [fp, #-56]
	add	ip, r3, r2
	ldr	r1, [r5, #4]
	ldr	r2, [r9, #4]
	add	r0, r3, r0
	add	r1, r1, ip, lsl #1
	ldr	r3, [r8, #52]
	add	r0, r2, r0
	mov	r2, #16
	blx	r3
	b	.L4
.L7:
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-60]
	add	r10, r10, r2
	ldr	r2, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-60]
	cmp	r3, r2
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-68]
	add	r3, r3, r2
	str	r3, [fp, #-56]
	bne	.L3
	ldr	r3, [fp, #-60]
	movs	r3, r3, lsr #1
	str	r3, [fp, #-76]
	beq	.L1
	ldr	r2, [fp, #-80]
	mov	r3, #0
	ldr	r10, .L27
	mov	r8, r3
	str	r3, [fp, #-56]
	mov	r2, r2, lsr #1
	str	r3, [fp, #-60]
	str	r2, [fp, #-80]
.L8:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L11
	ldr	r1, [fp, #-60]
	mov	r4, #0
	ldr	r0, [fp, #-72]
	and	r2, r1, #1
	mov	r3, r1, lsr #1
	mov	r6, r1, lsr #3
	and	r7, r6, #1
	and	r1, r1, #7
	mul	r3, r3, r0
	ldr	r0, [fp, #-80]
	mov	r7, r7, asl #2
	str	r1, [fp, #-52]
	add	r3, r3, r2, lsl #3
	str	r3, [fp, #-64]
	mul	r6, r0, r6
	b	.L10
.L9:
	mov	r1, r4, lsr #6
	ldr	r0, [r9, #8]
	add	r3, r8, r4
	and	ip, r1, #3
	add	r0, r0, r3
	add	ip, r7, ip
	ldr	r3, [fp, #-52]
	add	r4, r4, #64
	ldr	r2, .L27+4
	add	ip, r3, ip, lsl #3
	ldr	lr, [r5, #8]
	ldr	r3, [r10, #52]
	add	ip, r2, ip, lsl #2
	mov	r2, #64
	ldr	ip, [ip, #512]
	add	ip, r6, ip, lsl #6
	add	r1, ip, r1, lsl #9
	add	r1, lr, r1
	blx	r3
	ldr	r3, [fp, #-48]
	cmp	r3, r4
	bls	.L11
.L10:
	ldr	r3, [r5, #16]
	cmp	r3, #10
	bne	.L9
	ldr	r2, [fp, #-64]
	mov	r3, r4, lsr #2
	ldr	r0, [fp, #-56]
	add	ip, r3, r2
	ldr	r1, [r5, #12]
	ldr	r2, [r9, #12]
	add	r0, r0, r3
	add	r1, r1, ip, lsl #1
	ldr	r3, [r10, #52]
	add	r0, r2, r0
	mov	r2, #16
	blx	r3
	b	.L9
.L11:
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-60]
	add	r8, r8, r2
	ldr	r2, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-60]
	cmp	r3, r2
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-68]
	add	r3, r3, r2
	str	r3, [fp, #-56]
	bne	.L8
.L1:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L28:
	.align	2
.L27:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	IMAGE_DEC_TileTo2D, .-IMAGE_DEC_TileTo2D
	.align	2
	.global	IMAGE_DEC_LinearTo2D
	.type	IMAGE_DEC_LinearTo2D, %function
IMAGE_DEC_LinearTo2D:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #28)
	sub	sp, sp, #28
	mov	r7, r3
	ldr	r3, [r0, #32]
	cmp	r2, #0
	mov	r5, r0
	str	r2, [fp, #-56]
	mov	r6, r1
	str	r3, [fp, #-68]
	beq	.L29
	mov	r4, #0
	mov	r3, r1, lsr #2
	ldr	r8, .L57
	mov	r10, r4
	str	r3, [fp, #-60]
	str	r4, [fp, #-52]
	b	.L32
.L34:
	ldr	r1, [r5, #28]
	mov	r2, r6
	ldr	ip, [r5]
	ldr	lr, [fp, #-52]
	ldr	r3, [fp, #-60]
	mov	r1, r1, lsr #4
	ldr	r0, [r7]
	mla	r1, r1, r10, ip
	add	r0, r0, lr
	add	r4, r4, r3
	ldr	r3, [r8, #52]
	add	lr, lr, r6
	str	lr, [fp, #-52]
	blx	r3
	ldr	r3, [fp, #-56]
	add	r10, r10, #1
	cmp	r10, r3
	beq	.L56
.L32:
	ldr	r2, [r5, #16]
	cmp	r2, #10
	bne	.L34
	cmp	r6, #0
	beq	.L34
	ldr	r1, [fp, #-68]
	mov	r3, r10, lsr #5
	and	r2, r10, #31
	str	r10, [fp, #-64]
	mov	r9, #0
	mul	r3, r1, r3
	mov	r10, r2
	str	r3, [fp, #-48]
	mov	r3, r7
	mov	r7, r6
	mov	r6, r5
	mov	r5, r3
.L35:
	mov	lr, r9, lsr #6
	ldr	r3, .L57+4
	and	r1, lr, #3
	ldr	ip, [r6, #4]
	ldr	r0, [r5, #4]
	add	r2, r4, r9, lsr #2
	add	r1, r10, r1, lsl #5
	add	r9, r9, #64
	add	r0, r0, r2
	mov	r2, #16
	add	r1, r3, r1, lsl #2
	ldr	r3, [fp, #-48]
	ldr	r1, [r1, #768]
	add	r1, r1, lr, lsl #5
	mov	r1, r1, asl #6
	add	r1, r3, r1, lsr #2
	ldr	r3, [r8, #52]
	add	r1, ip, r1
	blx	r3
	cmp	r7, r9
	bhi	.L35
	mov	r3, r5
	ldr	r10, [fp, #-64]
	mov	r5, r6
	mov	r6, r7
	mov	r7, r3
	b	.L34
.L29:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L56:
	movs	r3, r10, lsr #1
	str	r3, [fp, #-64]
	beq	.L29
	ldr	r3, [fp, #-68]
	mov	r9, #0
	str	r9, [fp, #-56]
	str	r9, [fp, #-52]
	mov	r3, r3, lsr #1
	str	r3, [fp, #-68]
	b	.L38
.L39:
	ldr	r3, [fp, #-60]
	mov	r2, r6
	ldr	r1, [r5, #28]
	ldr	r0, [r7, #8]
	add	r9, r9, r3
	ldr	r3, [fp, #-56]
	ldr	ip, [r5, #8]
	mov	r1, r1, lsr #4
	add	r0, r0, r3
	add	r3, r3, r6
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-52]
	ldr	r4, [r8, #52]
	mla	r1, r1, r3, ip
	add	r3, r3, #1
	str	r3, [fp, #-52]
	mov	r10, r3
	blx	r4
	ldr	r2, [fp, #-64]
	cmp	r10, r2
	beq	.L29
.L38:
	ldr	r2, [r5, #16]
	cmp	r2, #10
	bne	.L39
	cmp	r6, #0
	beq	.L39
	ldr	r2, [fp, #-52]
	mov	r4, #0
	and	r10, r2, #15
	mov	r3, r2, lsr #4
	ldr	r2, [fp, #-68]
	mul	r3, r2, r3
	str	r3, [fp, #-48]
	ldr	r3, .L57+4
	add	r10, r3, r10, lsl #2
.L40:
	ldr	r2, [r10, #1280]
	mov	r1, r4, lsr #6
	ldr	r3, [fp, #-48]
	add	r0, r9, r4, lsr #2
	add	r1, r2, r1, lsl #4
	ldr	ip, [r5, #12]
	ldr	r2, [r7, #12]
	add	r4, r4, #64
	mov	r1, r1, asl #6
	add	r0, r2, r0
	mov	r2, #16
	add	r1, r3, r1, lsr #2
	ldr	r3, [r8, #52]
	add	r1, ip, r1
	blx	r3
	cmp	r6, r4
	bhi	.L40
	b	.L39
.L58:
	.align	2
.L57:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	IMAGE_DEC_LinearTo2D, .-IMAGE_DEC_LinearTo2D
	.align	2
	.global	IMAGE_DISP_LinearTo2D
	.type	IMAGE_DISP_LinearTo2D, %function
IMAGE_DISP_LinearTo2D:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #28)
	sub	sp, sp, #28
	mov	r4, r3
	subs	r3, r2, #0
	str	r3, [fp, #-64]
	ldr	r3, [r4, #12]
	mov	r5, r1
	ldr	r1, [r0, #28]
	add	r3, r3, #1044480
	str	r3, [fp, #-60]
	ldr	r3, [r4]
	str	r0, [fp, #-52]
	str	r1, [fp, #-56]
	ldr	r9, [r0]
	str	r3, [fp, #-48]
	beq	.L59
	add	r3, r5, r5, lsl #2
	mov	r7, #0
	mov	r6, r5, lsr #2
	mov	r8, r7
	mov	r3, r3, lsr #2
	mov	r10, #1
	str	r3, [fp, #-68]
	b	.L67
.L61:
	mov	r2, r5
	mov	r1, r9
	ldr	r0, [fp, #-48]
	blx	r3
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-48]
	add	r9, r9, r2
	add	r3, r3, r5
	str	r3, [fp, #-48]
.L63:
	ldr	r3, [fp, #-64]
	add	r8, r8, #1
	add	r10, r10, r5
	add	r7, r7, r6
	cmp	r8, r3
	beq	.L83
.L67:
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #16]
	cmp	r3, #10
	ldr	r3, .L84
	ldr	r3, [r3, #52]
	bne	.L61
	ldr	r2, [fp, #-68]
	mov	r1, r9
	ldr	r0, [fp, #-60]
	blx	r3
	cmp	r5, #0
	beq	.L66
	ldr	r3, [fp, #-60]
	mov	r0, r10
	mov	ip, #0
	add	r3, r3, #4
.L65:
	ldrb	r2, [r3, #-4]	@ zero_extendqisi2
	cmp	ip, r6
	ldr	r1, [r4]
	ldrb	lr, [r3, #-3]	@ zero_extendqisi2
	add	r1, r1, r0
	mov	r2, r2, lsr #2
	add	r2, r2, lr, lsl #6
	strb	r2, [r1, #-1]
	ldrb	r2, [r3, #-3]	@ zero_extendqisi2
	ldrb	lr, [r3, #-2]	@ zero_extendqisi2
	ldr	r1, [r4]
	mov	r2, r2, lsr #4
	add	r2, r2, lr, lsl #4
	strb	r2, [r1, r0]
	ldrb	r2, [r3, #-2]	@ zero_extendqisi2
	ldr	r1, [r4]
	ldrb	lr, [r3, #-1]	@ zero_extendqisi2
	add	r1, r1, r0
	mov	r2, r2, lsr #6
	add	r2, r2, lr, lsl #2
	strb	r2, [r1, #1]
	ldr	r2, [r4]
	ldrb	r1, [r3]	@ zero_extendqisi2
	add	r2, r2, r0
	add	r0, r0, #4
	strb	r1, [r2, #2]
	bcs	.L64
	ldrb	lr, [r3, #-3]	@ zero_extendqisi2
	ldrb	r1, [r3, #-4]	@ zero_extendqisi2
	ldrb	r2, [r3, #-2]	@ zero_extendqisi2
	and	lr, lr, #12
	and	r1, r1, #3
	add	r1, lr, r1
	and	r2, r2, #48
	ldr	lr, [r4, #4]
	add	r1, r1, r2
	ldrb	r2, [r3, #-1]	@ zero_extendqisi2
	add	lr, lr, r7
	and	r2, r2, #192
	add	r1, r1, r2
	strb	r1, [lr, ip]
.L64:
	add	ip, ip, #1
	add	r3, r3, #5
	cmp	r5, ip, asl #2
	bhi	.L65
.L66:
	ldr	r3, [fp, #-56]
	add	r9, r9, r3
	b	.L63
.L59:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L83:
	movs	r3, r8, lsr #1
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-52]
	ldr	r9, [r3, #8]
	ldr	r3, [r4, #8]
	str	r3, [fp, #-48]
	beq	.L59
	mov	r7, #0
	mov	r10, #1
	mov	r8, r7
	b	.L75
.L69:
	mov	r2, r5
	mov	r1, r9
	ldr	r0, [fp, #-48]
	blx	r3
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-48]
	add	r9, r9, r2
	add	r3, r3, r5
	str	r3, [fp, #-48]
.L71:
	ldr	r3, [fp, #-64]
	add	r8, r8, #1
	add	r10, r10, r5
	add	r7, r7, r6
	cmp	r8, r3
	beq	.L59
.L75:
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #16]
	cmp	r3, #10
	ldr	r3, .L84
	ldr	r3, [r3, #52]
	bne	.L69
	ldr	r2, [fp, #-68]
	mov	r1, r9
	ldr	r0, [fp, #-60]
	blx	r3
	cmp	r5, #0
	beq	.L74
	ldr	r3, [fp, #-60]
	mov	r0, r10
	mov	ip, #0
	add	r3, r3, #4
.L73:
	ldrb	r2, [r3, #-4]	@ zero_extendqisi2
	cmp	ip, r6
	ldr	r1, [r4, #8]
	ldrb	lr, [r3, #-3]	@ zero_extendqisi2
	add	r1, r1, r0
	mov	r2, r2, lsr #2
	add	r2, r2, lr, lsl #6
	strb	r2, [r1, #-1]
	ldrb	r2, [r3, #-3]	@ zero_extendqisi2
	ldrb	lr, [r3, #-2]	@ zero_extendqisi2
	ldr	r1, [r4, #8]
	mov	r2, r2, lsr #4
	add	r2, r2, lr, lsl #4
	strb	r2, [r1, r0]
	ldrb	r2, [r3, #-2]	@ zero_extendqisi2
	ldr	r1, [r4, #8]
	ldrb	lr, [r3, #-1]	@ zero_extendqisi2
	add	r1, r1, r0
	mov	r2, r2, lsr #6
	add	r2, r2, lr, lsl #2
	strb	r2, [r1, #1]
	ldr	r2, [r4, #8]
	ldrb	r1, [r3]	@ zero_extendqisi2
	add	r2, r2, r0
	add	r0, r0, #4
	strb	r1, [r2, #2]
	bcs	.L72
	ldrb	lr, [r3, #-3]	@ zero_extendqisi2
	ldrb	r1, [r3, #-4]	@ zero_extendqisi2
	ldrb	r2, [r3, #-2]	@ zero_extendqisi2
	and	lr, lr, #12
	and	r1, r1, #3
	add	r1, lr, r1
	and	r2, r2, #48
	ldr	lr, [r4, #12]
	add	r1, r1, r2
	ldrb	r2, [r3, #-1]	@ zero_extendqisi2
	add	lr, lr, r7
	and	r2, r2, #192
	add	r1, r1, r2
	strb	r1, [lr, ip]
.L72:
	add	ip, ip, #1
	add	r3, r3, #5
	cmp	r5, ip, asl #2
	bhi	.L73
.L74:
	ldr	r3, [fp, #-56]
	add	r9, r9, r3
	b	.L71
.L85:
	.align	2
.L84:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	IMAGE_DISP_LinearTo2D, .-IMAGE_DISP_LinearTo2D
	.align	2
	.global	IMAGE_ConvertTo2D
	.type	IMAGE_ConvertTo2D, %function
IMAGE_ConvertTo2D:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldrb	ip, [fp, #4]	@ zero_extendqisi2
	cmp	ip, #1
	beq	.L89
	ldr	ip, [r0, #24]
	cmp	ip, #1
	beq	.L90
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	IMAGE_DEC_LinearTo2D
.L90:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	IMAGE_DEC_TileTo2D
.L89:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	IMAGE_DISP_LinearTo2D
	UNWIND(.fnend)
	.size	IMAGE_ConvertTo2D, .-IMAGE_ConvertTo2D
	.global	g_RowMapTable_UV_2b
	.global	g_RowMapTable_Y_2b
	.global	g_RowMapTable_UV
	.global	g_RowMapTable_Y
	.data
	.align	2
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
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
