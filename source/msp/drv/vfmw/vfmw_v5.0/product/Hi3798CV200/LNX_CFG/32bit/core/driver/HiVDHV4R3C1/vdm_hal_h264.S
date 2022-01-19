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
	.file	"vdm_hal_h264.c"
	.text
	.align	2
	.type	H264HAL_SetSliceMsgRefPicFrame.isra.2, %function
H264HAL_SetSliceMsgRefPicFrame.isra.2:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 16
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
	ldr	ip, [fp, #4]
	str	r3, [fp, #-60]
	mov	r10, r0
	str	r2, [fp, #-56]
	add	r2, ip, #3
	add	r9, r1, ip, lsl #2
	mov	r3, ip, asl #3
	add	r3, r3, #20
	str	r3, [fp, #-52]
	ldr	r3, [r9, #52]
	mov	r2, r2, asl #2
	str	r2, [fp, #-48]
	cmp	r3, #0
	beq	.L1
	mov	r4, ip, asl #10
	mov	r7, #0
	add	ip, r4, ip, lsl #7
	mov	r8, r7
	add	r4, r1, ip
	mov	r5, r7
	b	.L7
.L5:
	cmp	r6, #3
	beq	.L15
.L6:
	ldr	r3, [r9, #52]
	cmp	r5, r3
	bcs	.L16
.L7:
	ldrb	r1, [r4, #1626]	@ zero_extendqisi2
	and	r3, r5, #7
	ldr	r2, [r10]
	and	r6, r5, #3
	ldr	ip, .L18
	add	r4, r4, #36
	add	r1, r2, r1, lsl #1
	ldrb	r0, [r4, #1591]	@ zero_extendqisi2
	ldr	r2, [r4, #1608]
	add	r5, r5, #1
	ldr	r1, [ip, r1, asl #2]
	cmp	r0, #1
	and	r1, r1, #3
	mov	r2, r2, asl #1
	moveq	r0, #8
	movne	r0, #0
	and	r2, r2, #31
	orr	r1, r0, r1
	cmp	r3, #7
	add	r0, r6, r6, lsl #2
	mov	r3, r3, asl #2
	orr	r7, r7, r2, asl r0
	orr	r8, r8, r1, asl r3
	bne	.L5
	ldr	lr, [fp, #-48]
	ldr	r1, [fp, #-56]
	ldr	r0, [fp, #-60]
	mov	r2, lr
	str	r8, [r1, lr, asl #2]
	add	r3, r0, lr, lsl #2
	ldr	ip, [r1, lr, asl #2]
	mov	r0, #4
	ldr	r1, .L18+4
	add	lr, lr, #1
	str	lr, [fp, #-48]
	mov	r8, #0
	str	ip, [sp]
	bl	dprint_vfmw
	cmp	r6, #3
	bne	.L6
.L15:
	ldr	lr, [fp, #-52]
	ldr	r1, [fp, #-56]
	ldr	r0, [fp, #-60]
	mov	r2, lr
	str	r7, [r1, lr, asl #2]
	add	r3, r0, lr, lsl #2
	ldr	ip, [r1, lr, asl #2]
	mov	r0, #4
	ldr	r1, .L18+4
	add	lr, lr, #1
	str	lr, [fp, #-52]
	mov	r7, #0
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r9, #52]
	cmp	r5, r3
	bcc	.L7
.L16:
	tst	r3, #7
	bne	.L17
.L1:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L17:
	ldr	r4, [fp, #-56]
	mov	r0, #4
	ldr	r2, [fp, #-48]
	ldr	r5, [fp, #-60]
	ldr	r1, .L18+4
	str	r8, [r4, r2, asl #2]
	add	r3, r5, r2, lsl #2
	ldr	ip, [r4, r2, asl #2]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r2, [fp, #-52]
	ldr	r1, .L18+4
	mov	r0, #4
	str	r7, [r4, r2, asl #2]
	add	r3, r5, r2, lsl #2
	ldr	ip, [r4, r2, asl #2]
	str	ip, [fp, #4]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.word	.LC0
	UNWIND(.fnend)
	.size	H264HAL_SetSliceMsgRefPicFrame.isra.2, .-H264HAL_SetSliceMsgRefPicFrame.isra.2
	.align	2
	.type	H264HAL_SetSliceMsgRefPicField.isra.3, %function
H264HAL_SetSliceMsgRefPicField.isra.3:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 16
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
	ldr	ip, [fp, #4]
	str	r2, [fp, #-56]
	add	r2, ip, #3
	str	r3, [fp, #-60]
	add	r10, r1, ip, lsl #2
	mov	r9, ip, asl #3
	mov	r3, r2, asl #2
	str	r3, [fp, #-52]
	ldr	r3, [r10, #52]
	add	r9, r9, #20
	str	r0, [fp, #-48]
	cmp	r3, #0
	beq	.L20
	mov	r4, ip, asl #10
	mov	r7, #0
	add	ip, r4, ip, lsl #7
	mov	r8, r7
	add	r4, r1, ip
	mov	r5, r7
	b	.L40
.L23:
	cmp	r3, #2
	beq	.L31
	and	r6, r5, #3
	and	r3, r5, #7
.L30:
	cmp	r3, #7
	beq	.L56
.L38:
	cmp	r6, #3
	beq	.L57
.L39:
	ldr	r3, [r10, #52]
	add	r5, r5, #1
	add	r4, r4, #36
	cmp	r5, r3
	bcs	.L58
.L40:
	ldrb	r3, [r4, #1624]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L23
	ldrb	r3, [r4, #1625]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L24
	ldr	r1, [fp, #-48]
	and	r3, r5, #7
	ldrb	r2, [r4, #1628]	@ zero_extendqisi2
	ldrb	r0, [r4, #1629]	@ zero_extendqisi2
	ldr	r1, [r1]
	add	r1, r1, r2, lsl #1
.L54:
	cmp	r0, #1
	ldr	r0, .L60
	and	r6, r5, #3
	add	r1, r0, r1, lsl #2
	moveq	r0, #8
	movne	r0, #0
	cmp	r2, #1
	ldr	r2, [r1, #32]
	moveq	r1, #4
	movne	r1, #0
	and	r2, r2, #3
	orr	r1, r1, r0
	orr	r2, r1, r2
	mov	r0, r3, asl #2
	cmp	r3, #7
	add	r1, r6, r6, lsl #2
	orr	r8, r8, r2, asl r0
	ldr	r2, [r4, #1644]
	mov	r2, r2, asl #1
	and	r2, r2, #31
	orr	r7, r7, r2, asl r1
	bne	.L38
.L56:
	ldr	lr, [fp, #-52]
	ldr	r1, [fp, #-56]
	ldr	r0, [fp, #-60]
	mov	r2, lr
	str	r8, [r1, lr, asl #2]
	add	r3, r0, lr, lsl #2
	ldr	ip, [r1, lr, asl #2]
	mov	r0, #4
	ldr	r1, .L60+4
	add	lr, lr, #1
	str	lr, [fp, #-52]
	mov	r8, #0
	str	ip, [sp]
	bl	dprint_vfmw
	cmp	r6, #3
	bne	.L39
.L57:
	ldr	r2, [fp, #-56]
	mov	r0, #4
	ldr	r3, [fp, #-60]
	ldr	r1, .L60+4
	str	r7, [r2, r9, asl #2]
	add	r3, r3, r9, lsl #2
	ldr	ip, [r2, r9, asl #2]
	mov	r2, r9
	mov	r7, #0
	add	r9, r9, #1
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L39
.L31:
	ldrb	r3, [r4, #1625]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L32
	ldr	r1, [fp, #-48]
	and	r3, r5, #7
	ldrb	r2, [r4, #1630]	@ zero_extendqisi2
	ldrb	r0, [r4, #1631]	@ zero_extendqisi2
	ldr	r1, [r1]
	add	r1, r1, r2, lsl #1
.L55:
	cmp	r0, #1
	ldr	r0, .L60
	and	r6, r5, #3
	add	r1, r0, r1, lsl #2
	moveq	r0, #8
	movne	r0, #0
	cmp	r2, #1
	ldr	r2, [r1, #32]
	moveq	r1, #4
	movne	r1, #0
	and	r2, r2, #3
	orr	r1, r1, r0
	orr	r2, r1, r2
	mov	r0, r3, asl #2
	add	r1, r6, r6, lsl #2
	orr	r8, r8, r2, asl r0
	ldr	r2, [r4, #1644]
	mov	r2, r2, asl #1
	and	r2, r2, #30
	orr	r2, r2, #1
	orr	r7, r7, r2, asl r1
	b	.L30
.L58:
	tst	r3, #7
	bne	.L59
.L20:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L24:
	ldr	r2, [fp, #-48]
	and	r3, r5, #7
	ldrb	r1, [r4, #1626]	@ zero_extendqisi2
	ldrb	r0, [r4, #1629]	@ zero_extendqisi2
	ldr	r2, [r2]
	add	r1, r2, r1, lsl #1
	ldrb	r2, [r4, #1628]	@ zero_extendqisi2
	b	.L54
.L32:
	ldr	r2, [fp, #-48]
	and	r3, r5, #7
	ldrb	r1, [r4, #1626]	@ zero_extendqisi2
	ldrb	r0, [r4, #1631]	@ zero_extendqisi2
	ldr	r2, [r2]
	add	r1, r2, r1, lsl #1
	ldrb	r2, [r4, #1630]	@ zero_extendqisi2
	b	.L55
.L59:
	ldr	r4, [fp, #-56]
	mov	r0, #4
	ldr	r2, [fp, #-52]
	ldr	r5, [fp, #-60]
	ldr	r1, .L60+4
	str	r8, [r4, r2, asl #2]
	add	r3, r5, r2, lsl #2
	ldr	ip, [r4, r2, asl #2]
	str	ip, [sp]
	bl	dprint_vfmw
	str	r7, [r4, r9, asl #2]
	ldr	ip, [r4, r9, asl #2]
	add	r3, r5, r9, lsl #2
	mov	r2, r9
	ldr	r1, .L60+4
	mov	r0, #4
	str	ip, [fp, #4]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L61:
	.align	2
.L60:
	.word	.LANCHOR0
	.word	.LC0
	UNWIND(.fnend)
	.size	H264HAL_SetSliceMsgRefPicField.isra.3, .-H264HAL_SetSliceMsgRefPicField.isra.3
	.global	__aeabi_idiv
	.align	2
	.type	H264HAL_V4R3C1_SetSliceMsg.isra.7, %function
H264HAL_V4R3C1_SetSliceMsg.isra.7:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 32
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
	str	r0, [fp, #-48]
	mov	r0, r2
	mov	r9, r2
	mov	r4, r1
	str	r3, [fp, #-72]
	bl	MEM_Phy2Vir
	subs	r10, r0, #0
	beq	.L127
	add	r3, r4, #4
	mov	r2, r10
	add	r8, r9, #4
	add	r6, r10, #4
	str	r10, [fp, #-60]
	mov	r5, #0
	str	r4, [fp, #-64]
	mov	r10, r3
	mov	r4, r2
	str	r9, [fp, #-68]
.L67:
	ldr	r7, [r10, #4]!
	add	ip, r5, #1
	sub	r3, r8, #4
	mov	r2, r5
	cmp	r7, #0
	ldr	r1, .L135
	mov	r0, #4
	str	ip, [fp, #-52]
	beq	.L65
	ldr	r7, [r10, #16]
	mov	r2, ip
	ldr	r3, [r10, #8]
	ldr	r1, [fp, #-48]
	add	r9, r3, r7, lsl #3
	and	r9, r9, #127
	ldr	ip, [r1, #736]
	str	r7, [sp, #4]
	bic	r7, r7, #15
	str	r3, [sp]
	bic	r3, ip, #15
	ldr	r1, .L135+4
	str	r3, [fp, #-56]
	mov	r3, r9
	bl	dprint_vfmw
	str	r9, [r6]
	ldr	ip, [r4, #4]
	mov	r3, r8
	ldr	r2, [fp, #-52]
	mov	r0, #4
	ldr	r1, .L135
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	ip, [r10]
	add	r3, r8, #4
	add	r2, r5, #2
	ldr	r1, .L135
	mov	r0, #4
	str	ip, [r6, #4]
	ldr	ip, [r6, #4]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [fp, #-56]
	mov	r2, r5
	ldr	r1, .L135
	rsb	r7, r3, r7
	str	r7, [r4]
	ldr	ip, [r6, #-4]
	sub	r3, r8, #4
	mov	r0, #4
	str	ip, [sp]
	bl	dprint_vfmw
.L66:
	add	r5, r5, #3
	add	r6, r6, #12
	cmp	r5, #6
	add	r4, r4, #12
	add	r8, r8, #12
	bne	.L67
	ldr	r4, [fp, #-64]
	mov	r0, #4
	ldr	r10, [fp, #-60]
	ldr	r9, [fp, #-68]
	ldr	r1, [r4, #48]
	ldr	r3, [r4, #32]
	add	r2, r9, #24
	ldr	ip, [r4, #36]
	ubfx	r1, r1, #0, #20
	and	ip, ip, #3
	orr	r3, r1, r3, asl #26
	ldr	r1, .L135+8
	orr	r3, r3, ip, asl #24
	str	r3, [r10, #24]
	ldr	r3, [r10, #24]
	bl	dprint_vfmw
	ldr	r3, .L135+12
	ldrb	lr, [r4, #3]	@ zero_extendqisi2
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L69
	cmp	lr, #0
	beq	.L128
.L69:
	ldr	r1, [r4, #56]
	add	r2, r9, #28
	ldr	ip, [r4, #52]
	mov	r0, #4
	ldrb	r5, [r4]	@ zero_extendqisi2
	ldr	r3, [r4, #40]
	mov	r6, r1, asl #8
	ldr	r8, .L135+16
	orr	r1, r6, ip, asl #2
	ldr	ip, [r4, #44]
	and	r3, r3, #31
	add	r5, r8, r5, lsl #2
	and	ip, ip, #31
	orr	r1, r1, r3, asl #21
	ldr	r5, [r5, #92]
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	orr	r1, r1, ip, asl #16
	orr	ip, r1, r5
	ldr	r1, .L135+20
	orr	r3, ip, r3, asl #15
	orr	r3, r3, lr, asl #14
	str	r3, [r10, #28]
	ldr	r3, [r10, #28]
	bl	dprint_vfmw
	ldrb	r3, [r4]	@ zero_extendqisi2
	add	r3, r8, r3, lsl #2
	ldr	r3, [r3, #92]
	cmp	r3, #2
	movne	r3, #0
	movne	r2, r3
	beq	.L129
.L70:
	str	r2, [r10, #32]
	mov	r0, #4
	add	r2, r9, #32
	str	r3, [r10, #36]
	ldr	r1, .L135+24
	ldr	r3, [r10, #32]
	bl	dprint_vfmw
	ldr	r3, [r10, #36]
	add	r2, r9, #36
	ldr	r1, .L135+28
	mov	r0, #4
	bl	dprint_vfmw
	ldr	r0, [r4, #60]
	ldrb	lr, [r4, #4]	@ zero_extendqisi2
	add	r2, r9, #40
	and	r0, r0, #31
	ldr	r3, [r4, #64]
	ldr	r1, .L135+32
	mov	r0, r0, asl #5
	and	ip, r3, #31
	orr	r3, r0, lr, asl #16
	mov	r0, #4
	orr	r3, r3, ip
	str	r3, [r10, #40]
	ldr	r3, [r10, #40]
	bl	dprint_vfmw
	ldr	r0, [r4, #72]
	ldr	r3, [r4, #68]
	add	r2, r9, #44
	and	r0, r0, #15
	ldr	ip, [r4, #76]
	and	r3, r3, #15
	ldr	r1, .L135+36
	mov	r0, r0, asl #8
	orr	r3, r0, r3, asl #16
	mov	r0, #4
	orr	r3, r3, ip
	str	r3, [r10, #44]
	ldr	r3, [r10, #44]
	bl	dprint_vfmw
	ldr	r3, [r4, #4056]
	ldrb	r1, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L121
	ldr	r0, [fp, #4]
.L76:
	ldr	r3, [fp, #-72]
	str	r0, [r10, #176]
	bic	r3, r3, #15
	str	r3, [r10, #252]
	ldrb	r3, [r4]	@ zero_extendqisi2
	ldr	r5, .L135+16
	add	r3, r8, r3, lsl #2
	ldr	r3, [r3, #92]
	cmp	r3, #0
	bne	.L79
.L89:
	mov	r0, #0
.L122:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L65:
	str	r7, [r4]
	ldr	ip, [r6, #-4]
	str	ip, [sp]
	bl	dprint_vfmw
	str	r7, [r6]
	ldr	ip, [r4, #4]
	mov	r3, r8
	add	r2, r5, #1
	ldr	r1, .L135
	mov	r0, #4
	str	ip, [sp]
	bl	dprint_vfmw
	str	r7, [r6, #4]
	ldr	ip, [r6, #4]
	add	r3, r8, #4
	add	r2, r5, #2
	ldr	r1, .L135
	mov	r0, #4
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L66
.L128:
	ldr	r3, [fp, #-48]
	movw	r2, #1620
	ldr	r1, [r3, #40]
	ldr	r3, [r3, #44]
	mul	r3, r3, r1
	cmp	r3, r2
	mvnhi	r0, #0
	bls	.L69
	b	.L122
.L79:
	ldr	r3, [fp, #-48]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L130
	ldr	r3, [fp, #-48]
	mov	r2, #0
	mov	r1, r4
	str	r2, [sp]
	add	r6, r3, #48
	mov	r2, r10
	mov	r3, r9
	mov	r0, r6
	bl	H264HAL_SetSliceMsgRefPicField.isra.3
	ldrb	r3, [r4]	@ zero_extendqisi2
	add	r5, r5, r3, lsl #2
	ldr	r3, [r5, #92]
	cmp	r3, #2
	beq	.L131
.L82:
	mov	r6, r4
	mov	r5, #0
	ldr	r1, [r6, #3928]!
	mov	r7, #36
	and	r1, r1, #31
.L84:
	add	r5, r5, #1
	and	r3, r5, #3
	cmp	r5, #32
	add	r0, r3, r3, lsl #2
	beq	.L132
	ldr	r2, [r6, #4]!
	cmp	r3, #3
	and	r3, r2, #31
	orr	r1, r1, r3, asl r0
	bne	.L84
	str	r1, [r10, r7, asl #2]
	add	r3, r9, r7, lsl #2
	ldr	ip, [r10, r7, asl #2]
	mov	r2, r7
	ldr	r1, .L135+40
	mov	r0, #4
	add	r7, r7, #1
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r1, #0
	b	.L84
.L130:
	ldr	r2, [fp, #-48]
	mov	r1, r4
	str	r3, [sp]
	mov	r3, r9
	add	r6, r2, #48
	mov	r2, r10
	mov	r0, r6
	bl	H264HAL_SetSliceMsgRefPicFrame.isra.2
	ldrb	r3, [r4]	@ zero_extendqisi2
	add	r5, r5, r3, lsl #2
	ldr	r3, [r5, #92]
	cmp	r3, #2
	bne	.L82
	mov	r2, #1
	mov	r0, r6
	str	r2, [sp]
	mov	r3, r9
	mov	r2, r10
	mov	r1, r4
	bl	H264HAL_SetSliceMsgRefPicFrame.isra.2
	b	.L82
.L132:
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #300]
	cmp	r3, #0
	beq	.L87
	ldrb	r3, [r4]	@ zero_extendqisi2
	add	r3, r8, r3, lsl #2
	ldr	r3, [r3, #92]
	cmp	r3, #1
	beq	.L88
.L87:
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #304]
	cmp	r3, #1
	bne	.L89
	ldrb	r3, [r4]	@ zero_extendqisi2
	add	r3, r8, r3, lsl #2
	ldr	r3, [r3, #92]
	cmp	r3, #2
	bne	.L89
.L88:
	ldr	r2, [r4, #44]
	mov	r0, #4
	ldr	r1, .L135+44
	add	r3, r10, #256
	str	r3, [fp, #-52]
	bl	dprint_vfmw
	add	r2, r10, #512
	add	r1, r10, #768
	mov	r7, r9
	str	r10, [fp, #-56]
	mov	r5, r4
	ldr	r10, [fp, #-52]
	mov	r6, #0
	str	r9, [fp, #-52]
	mov	r9, r2
	str	r1, [fp, #-48]
	str	r4, [fp, #-60]
.L90:
	ldr	r0, [r5, #88]
	add	r3, r7, #256
	ldrb	r1, [r5, #856]	@ zero_extendqisi2
	add	r2, r6, #64
	ubfx	lr, r0, #0, #9
	ldr	r0, [r4, #80]
	add	r5, r5, #4
	mov	r1, r1, asl #12
	and	ip, r0, #7
	orr	r0, r1, lr, asl #3
	ldr	r1, .L135+40
	orr	r0, r0, ip
	str	r0, [r10]
	ldr	ip, [r10], #4
	mov	r0, #4
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r0, [r5, #212]
	ldrb	r1, [r5, #980]	@ zero_extendqisi2
	add	r3, r7, #512
	ubfx	lr, r0, #0, #9
	ldr	r0, [r4, #84]
	add	r2, r6, #128
	mov	r1, r1, asl #12
	and	ip, r0, #7
	orr	r0, r1, lr, asl #3
	ldr	r1, .L135+40
	orr	r0, r0, ip
	str	r0, [r9]
	ldr	ip, [r9], #4
	mov	r0, #4
	str	ip, [sp]
	bl	dprint_vfmw
	ldrb	r0, [r5, #1108]	@ zero_extendqisi2
	ldr	r1, [r5, #340]
	add	r3, r7, #768
	add	r2, r6, #192
	add	r6, r6, #1
	ubfx	r1, r1, #0, #9
	orr	r1, r1, r0, asl #9
	ldr	r0, [fp, #-48]
	str	r1, [r0]
	ldr	ip, [r0], #4
	ldr	r1, .L135+40
	str	r0, [fp, #-48]
	mov	r0, #4
	str	ip, [sp]
	add	r7, r7, r0
	bl	dprint_vfmw
	ldr	r3, [r4, #44]
	cmp	r6, r3
	bls	.L90
	ldr	r2, [r4, #80]
	mov	r0, #4
	ldr	r1, .L135+48
	add	r6, r4, #84
	ldr	r10, [fp, #-56]
	add	r5, r4, #852
	ldr	r9, [fp, #-52]
	bl	dprint_vfmw
	mov	r7, #0
.L91:
	ldr	r2, [r6, #4]!
	mov	r0, #4
	ldr	r1, .L135+52
	add	r7, r7, #1
	bl	dprint_vfmw
	ldr	r2, [r5, #4]!
	ldr	r1, .L135+56
	mov	r0, #4
	bl	dprint_vfmw
	ldr	r3, [r4, #44]
	cmp	r7, r3
	bls	.L91
	ldrb	r3, [r4]	@ zero_extendqisi2
	add	r3, r8, r3, lsl #2
	ldr	r3, [r3, #92]
	cmp	r3, #2
	beq	.L92
.L95:
	ldr	r2, [r4, #84]
	mov	r0, #4
	ldr	r1, .L135+60
	add	r6, r4, #212
	bl	dprint_vfmw
	add	r5, r4, #980
	mov	r7, #0
.L93:
	ldr	r2, [r6, #4]!
	mov	r0, #4
	ldr	r1, .L135+64
	add	r7, r7, #1
	bl	dprint_vfmw
	ldr	r2, [r5, #4]!
	ldr	r1, .L135+68
	mov	r0, #4
	bl	dprint_vfmw
	ldr	r3, [r4, #44]
	cmp	r7, r3
	bls	.L93
	ldrb	r3, [r4]	@ zero_extendqisi2
	add	r3, r8, r3, lsl #2
	ldr	r3, [r3, #92]
	cmp	r3, #2
	beq	.L133
.L96:
	add	r6, r4, #1104
	add	r7, r4, #340
	add	r6, r6, #4
	mov	r5, #0
.L98:
	ldr	r2, [r7, #4]!
	mov	r0, #4
	ldr	r1, .L135+72
	add	r5, r5, #1
	bl	dprint_vfmw
	ldr	r2, [r6, #4]!
	ldr	r1, .L135+76
	mov	r0, #4
	bl	dprint_vfmw
	ldr	r3, [r4, #44]
	cmp	r5, r3
	bls	.L98
	ldrb	r3, [r4]	@ zero_extendqisi2
	add	r3, r8, r3, lsl #2
	ldr	r3, [r3, #92]
	cmp	r3, #2
	bne	.L89
	add	r6, r4, #1488
	add	r7, r4, #724
	add	r6, r6, #4
	mov	r5, #0
.L100:
	ldr	r2, [r7, #4]!
	mov	r0, #4
	ldr	r1, .L135+80
	add	r5, r5, #1
	bl	dprint_vfmw
	ldr	r2, [r6, #4]!
	ldr	r1, .L135+84
	mov	r0, #4
	bl	dprint_vfmw
	ldr	r2, [r4, #40]
	cmp	r5, r2
	bls	.L100
	ldrb	r3, [r4]	@ zero_extendqisi2
	add	r8, r8, r3, lsl #2
	ldr	r3, [r8, #92]
	cmp	r3, #2
	bne	.L89
	ldr	r1, .L135+88
	mov	r0, #4
	mov	r6, r9
	bl	dprint_vfmw
	add	r8, r10, #384
	add	r7, r10, #640
	add	r9, r10, #896
	ldr	r10, [fp, #-60]
	mov	r5, #0
.L101:
	ldr	r0, [r10, #472]
	add	r3, r6, #384
	ldrb	r1, [r10, #1240]	@ zero_extendqisi2
	add	r2, r5, #96
	ubfx	lr, r0, #0, #9
	ldr	r0, [r4, #80]
	add	r10, r10, #4
	mov	r1, r1, asl #12
	and	ip, r0, #7
	orr	r0, r1, lr, asl #3
	ldr	r1, .L135+40
	orr	r0, r0, ip
	str	r0, [r8]
	ldr	ip, [r8], #4
	mov	r0, #4
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r0, [r10, #596]
	ldrb	r1, [r10, #1364]	@ zero_extendqisi2
	add	r3, r6, #640
	ubfx	lr, r0, #0, #9
	ldr	r0, [r4, #84]
	add	r2, r5, #160
	mov	r1, r1, asl #12
	and	ip, r0, #7
	orr	r0, r1, lr, asl #3
	ldr	r1, .L135+40
	orr	r0, r0, ip
	str	r0, [r7]
	ldr	ip, [r7], #4
	mov	r0, #4
	str	ip, [sp]
	bl	dprint_vfmw
	ldrb	r0, [r10, #1492]	@ zero_extendqisi2
	ldr	r1, [r10, #724]
	add	r3, r6, #896
	add	r2, r5, #224
	add	r5, r5, #1
	ubfx	r1, r1, #0, #9
	orr	r1, r1, r0, asl #9
	str	r1, [r9]
	ldr	ip, [r9], #4
	mov	r0, #4
	ldr	r1, .L135+40
	add	r6, r6, r0
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r4, #40]
	cmp	r5, r3
	bls	.L101
	b	.L89
.L129:
	ldr	r2, [r4, #2788]
	mov	r0, #4
	ldr	r1, .L135+92
	bl	dprint_vfmw
	ldr	r3, [fp, #-48]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L71
	ldrb	r2, [r4, #2778]	@ zero_extendqisi2
	cmp	r2, #3
	ldr	r2, [r4, #2788]
	beq	.L134
.L124:
	ldr	r1, [fp, #-48]
	add	r2, r2, #146
	ldr	r2, [r1, r2, asl #2]
	bic	r2, r2, #15
	b	.L70
.L121:
	ldr	r3, [fp, #-48]
	ldr	r0, [r3, #740]
	cmp	r0, #262144
	addgt	r1, r1, #1
	addle	r1, r1, #1
	movwgt	r0, #65535
	suble	r0, r0, #1
	movtgt	r0, 3
	bl	__aeabi_idiv
	b	.L76
.L71:
	ldr	r3, [r4, #2776]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #768
	beq	.L125
	ldrb	r3, [r4, #2776]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L125
	ldr	r1, [r4, #2788]
	mov	r3, #0
	ldr	r2, [fp, #-48]
	add	r1, r1, #146
	ldr	r0, [r2, #716]
	ldr	r2, [r2, r1, asl #2]
	add	r2, r2, r0
	bic	r2, r2, #15
	b	.L70
.L131:
	mov	r2, #1
	mov	r0, r6
	str	r2, [sp]
	mov	r3, r9
	mov	r2, r10
	mov	r1, r4
	bl	H264HAL_SetSliceMsgRefPicField.isra.3
	b	.L82
.L125:
	ldr	r2, [r4, #2788]
	mov	r3, #0
	b	.L124
.L134:
	ldr	r1, [fp, #-48]
	add	r2, r2, #146
	ldr	r3, [r1, #716]
	ldr	r2, [r1, r2, asl #2]
	add	r3, r2, r3
	bic	r2, r2, #15
	bic	r3, r3, #15
	b	.L70
.L133:
	add	r6, r4, #1360
	add	r7, r4, #596
	add	r6, r6, #4
	mov	r5, #0
.L97:
	ldr	r2, [r7, #4]!
	mov	r0, #4
	ldr	r1, .L135+96
	add	r5, r5, #1
	bl	dprint_vfmw
	ldr	r2, [r6, #4]!
	ldr	r1, .L135+100
	mov	r0, #4
	bl	dprint_vfmw
	ldr	r3, [r4, #40]
	cmp	r5, r3
	bls	.L97
	b	.L96
.L92:
	add	r6, r4, #1232
	add	r7, r4, #468
	add	r6, r6, #4
	mov	r5, #0
.L94:
	ldr	r2, [r7, #4]!
	mov	r0, #4
	ldr	r1, .L135+104
	add	r5, r5, #1
	bl	dprint_vfmw
	ldr	r2, [r6, #4]!
	ldr	r1, .L135+108
	mov	r0, #4
	bl	dprint_vfmw
	ldr	r3, [r4, #40]
	cmp	r5, r3
	bls	.L94
	b	.L95
.L127:
	ldr	r3, .L135+112
	ldr	r2, .L135+116
	ldr	r1, .L135+120
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L122
.L136:
	.align	2
.L135:
	.word	.LC4
	.word	.LC3
	.word	.LC5
	.word	g_not_direct_8x8_inference_flag
	.word	.LANCHOR0
	.word	.LC6
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC0
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC19
	.word	.LC20
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC7
	.word	.LC21
	.word	.LC22
	.word	.LC17
	.word	.LC18
	.word	.LC1
	.word	.LANCHOR0+64
	.word	.LC2
	UNWIND(.fnend)
	.size	H264HAL_V4R3C1_SetSliceMsg.isra.7, .-H264HAL_V4R3C1_SetSliceMsg.isra.7
	.align	2
	.global	H264HAL_V4R3C1_InitHal
	.type	H264HAL_V4R3C1_InitHal, %function
H264HAL_V4R3C1_InitHal:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r0, [r0, #1088]
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L140
	ldr	r3, .L141
	mov	r2, #5120
	ldr	r1, .L141+4
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L140:
	mov	r2, #58
	ldr	r1, .L141+8
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r1, .L141+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L142:
	.align	2
.L141:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_CabacMN
	.word	.LC28
	.word	.LC29
	UNWIND(.fnend)
	.size	H264HAL_V4R3C1_InitHal, .-H264HAL_V4R3C1_InitHal
	.align	2
	.global	H264HAL_V4R3C1_StartDec
	.type	H264HAL_V4R3C1_StartDec, %function
H264HAL_V4R3C1_StartDec:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	subs	r3, r1, #0
	mov	r5, r2
	str	r3, [fp, #-56]
	mov	r4, r0
	bgt	.L247
	cmp	r0, #0
	beq	.L248
	ldr	r3, [r0, #44]
	cmp	r3, #512
	bhi	.L148
	ldr	r3, [r0, #36]
	cmp	r3, #512
	bhi	.L148
	ldr	r0, [r0, #944]
	cmp	r0, #0
	beq	.L249
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	beq	.L214
	cmp	r3, #1
	moveq	r0, #0
	movteq	r0, 63941
	beq	.L151
	ldr	r1, .L262
	mov	r0, #0
	bl	dprint_vfmw
.L153:
	mvn	r0, #0
.L235:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L214:
	mov	r0, #0
	movt	r0, 63683
.L151:
	ldr	r3, [fp, #-56]
	movw	r6, #1228
	mul	r6, r6, r3
	ldr	r3, .L262+4
	ldr	r3, [r3, r6]
	cmp	r3, #0
	beq	.L250
.L152:
	ldr	r3, .L262+8
	mov	r0, #3
	ldr	r1, .L262+12
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
	bl	dprint_vfmw
	ldr	r0, [fp, #-56]
	ldr	r2, .L262+16
	ldr	r1, .L262+20
	mov	r3, r0, asl #6
	ldrb	r2, [r2]	@ zero_extendqisi2
	sub	r3, r3, r0, asl #3
	add	r3, r1, r3
	subs	r2, r2, #1
	ldr	r1, [r3, #8]
	movne	r2, #1
	cmp	r5, #0
	movne	r3, #0
	andeq	r3, r2, #1
	cmp	r3, #0
	bne	.L251
	ldr	r3, .L262+24
	mov	r0, #8
	ldr	r10, [fp, #-56]
	mov	r9, #1
	ldr	r6, [r3, r1, asl #2]
	cmp	r6, #0
	ldrne	r8, [r6, #1240]
	moveq	r3, r6
	moveq	r8, r6
	uxtbne	r3, r8
	andne	r6, r3, #1
	cmp	r2, #0
	strneb	r3, [r5, #1]
	mov	r3, #0
	ldr	ip, [r4, #740]
	mov	r2, r10
	str	r3, [fp, #-48]
	mov	r3, r5
	cmp	ip, #262144
	ldr	r1, [fp, #-48]
	suble	ip, ip, #1
	movwgt	ip, #65535
	ubfxle	ip, ip, #0, #20
	movtgt	ip, 3
	bfi	r1, ip, #0, #20
	str	r1, [fp, #-48]
	mov	ip, r1, lsr #24
	mov	r1, r1, lsr #16
	and	ip, ip, #62
	and	r1, r1, #191
	orr	ip, ip, #65
	bfc	r1, #7, #1
	bfc	ip, #1, #1
	strb	r1, [fp, #-46]
	strb	ip, [fp, #-45]
	ldr	r7, [fp, #-48]
	mov	r1, r7
	str	r7, [r4, #956]
	bl	MFDE_ConfigReg
	mov	r2, r7
	ldr	r1, .L262+28
	mov	r0, #3
	bl	dprint_vfmw
	ldrb	r2, [r4, #16]	@ zero_extendqisi2
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	mov	r3, #0
	bfi	r3, r2, #4, #1
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	bfi	r3, r0, #6, #1
	mov	r2, #0
	bfi	r2, r6, #4, #1
	strh	r9, [fp, #-46]	@ movhi
	and	r2, r2, #223
	mvn	r3, r3, asl #25
	bfi	r2, r1, #6, #1
	mvn	r3, r3, lsr #25
	mov	r1, #0
	strb	r3, [fp, #-47]
	bfi	r2, r1, #7, #1
	mov	r3, #0
	strb	r2, [fp, #-45]
	bfi	r3, r1, #0, #4
	strb	r3, [fp, #-48]
	mov	r2, r10
	ldr	r6, [fp, #-48]
	mov	r3, r5
	mov	r0, #12
	movw	r7, #1228
	mov	r1, r6
	str	r6, [r4, #960]
	bl	MFDE_ConfigReg
	mov	r2, r6
	ldr	r1, .L262+32
	mov	r0, #3
	bl	dprint_vfmw
	ldr	r2, .L262+4
	mov	r3, r5
	mov	r0, #16
	mla	r7, r7, r10, r2
	mov	r2, r10
	ldr	r6, [r7, #56]
	bic	r6, r6, #15
	str	r6, [r4, #964]
	mov	r1, r6
	bl	MFDE_ConfigReg
	mov	r2, r6
	ldr	r1, .L262+36
	mov	r0, #3
	bl	dprint_vfmw
	ldr	r6, [r7, #40]
	mov	r3, r5
	mov	r2, r10
	bic	r6, r6, #15
	mov	r0, #20
	str	r6, [r4, #968]
	mov	r1, r6
	bl	MFDE_ConfigReg
	mov	r2, r6
	ldr	r1, .L262+40
	mov	r0, #3
	bl	dprint_vfmw
	ldr	r6, [r4, #736]
	mov	r3, r5
	mov	r2, r10
	bic	r6, r6, #15
	mov	r0, #24
	str	r6, [r4, #972]
	mov	r1, r6
	str	r6, [fp, #-48]
	bl	MFDE_ConfigReg
	mov	r2, r6
	ldr	r1, .L262+44
	mov	r0, #3
	bl	dprint_vfmw
	ldr	r2, [r4, #44]
	cmp	r2, #120
	bhi	.L252
.L157:
	ldr	r7, [fp, #-56]
	cmp	r2, #256
	movw	r6, #3075
	mov	r3, r5
	movhi	r1, #0
	movls	r1, #1
	movt	r6, 48
	mov	r2, r7
	mov	r0, #4
	bl	SCD_ConfigReg
	mov	r1, r6
	mov	r3, r5
	mov	r2, r7
	mov	r0, #60
	str	r6, [fp, #-48]
	bl	MFDE_ConfigReg
	mov	r3, r5
	mov	r2, r7
	mov	r1, r6
	mov	r0, #64
	bl	MFDE_ConfigReg
	mov	r3, r5
	mov	r2, r7
	mov	r1, r6
	mov	r0, #68
	bl	MFDE_ConfigReg
	mov	r3, r5
	mov	r2, r7
	mov	r1, r6
	mov	r0, #72
	bl	MFDE_ConfigReg
	mov	r3, r5
	mov	r2, r7
	mov	r1, r6
	mov	r0, #76
	bl	MFDE_ConfigReg
	mov	r3, r5
	mov	r2, r7
	mov	r1, r6
	mov	r0, #80
	bl	MFDE_ConfigReg
	mov	r3, r5
	mov	r2, r7
	mov	r1, r6
	mov	r0, #84
	bl	MFDE_ConfigReg
	cmp	r8, #1
	beq	.L253
.L159:
	ldr	r1, [r4, #308]
	mov	r3, r5
	ldr	r9, [fp, #-56]
	mov	r0, #96
	movw	r8, #1228
	mov	r6, #0
	add	r1, r4, r1, lsl #2
	mov	r2, r9
	ldr	r7, [r1, #324]
	bic	r7, r7, #15
	str	r7, [r4, #1008]
	mov	r1, r7
	bl	MFDE_ConfigReg
	mov	r2, r7
	ldr	r1, .L262+48
	mov	r0, #3
	bl	dprint_vfmw
	ldr	r7, [r4, #720]
	mov	r3, r5
	mov	r2, r9
	mov	r0, #100
	mov	r1, r7
	str	r7, [r4, #1012]
	bl	MFDE_ConfigReg
	mov	r2, r7
	ldr	r1, .L262+52
	mov	r0, #3
	bl	dprint_vfmw
	ldr	r7, [r4, #320]
	mov	r3, r5
	mov	r2, r9
	mov	r0, #104
	mov	r1, r7
	str	r7, [r4, #1016]
	bl	MFDE_ConfigReg
	mov	r2, r7
	ldr	r1, .L262+56
	mov	r0, #3
	bl	dprint_vfmw
	ldr	r7, [r4, #732]
	mov	r3, r5
	mov	r2, r9
	mov	r0, #108
	mov	r1, r7
	bl	MFDE_ConfigReg
	mov	r2, r7
	ldr	r1, .L262+60
	mov	r0, #3
	bl	dprint_vfmw
	ldr	r2, .L262+4
	mov	r3, r5
	mov	r0, #128
	mla	r8, r8, r9, r2
	mov	r2, r9
	ldr	r7, [r8, #1164]
	bic	r7, r7, #15
	str	r7, [r4, #1032]
	mov	r1, r7
	bl	MFDE_ConfigReg
	mov	r2, r7
	ldr	r1, .L262+64
	mov	r0, #3
	bl	dprint_vfmw
	ldr	r1, [r8, #1168]
	str	r6, [fp, #-48]
	mov	r3, r5
	mov	r2, r9
	mov	r0, #132
	strh	r1, [fp, #-48]	@ movhi
	ldr	r7, [fp, #-48]
	mov	r1, r7
	str	r7, [r4, #1036]
	bl	MFDE_ConfigReg
	ldr	r1, .L262+68
	mov	r2, r7
	mov	r0, #3
	bl	dprint_vfmw
	add	r1, r4, #1040
	add	r1, r1, #8
	mov	r3, r6
.L160:
	ldr	r2, [r1, #4]!
	and	r2, r2, #3
	orr	r6, r6, r2, asl r3
	add	r3, r3, #2
	cmp	r3, #32
	bne	.L160
	mov	r3, r5
	mov	r1, r6
	ldr	r2, [fp, #-56]
	mov	r0, #148
	str	r6, [fp, #-48]
	bl	MFDE_ConfigReg
	ldr	r1, .L262+72
	mov	r2, r6
	mov	r0, #3
	ldr	r6, .L262+76
	bl	dprint_vfmw
	ldrb	r2, [r4]	@ zero_extendqisi2
	ldr	r3, [r4, #48]
	mov	r0, #152
	ldr	r8, [fp, #-56]
	add	r3, r3, r2, lsl #1
	add	r3, r6, r3, lsl #2
	mov	r2, r8
	ldr	r3, [r3, #156]
	cmp	r3, #0
	mov	r3, r5
	movne	r1, #0
	moveq	r1, #2
	mov	r7, r1
	bl	MFDE_ConfigReg
	mov	r2, r7
	ldr	r1, .L262+80
	mov	r0, #3
	bl	dprint_vfmw
	mov	r3, r5
	mov	r2, r8
	mvn	r1, #0
	mov	r0, #32
	bl	MFDE_ConfigReg
	ldr	r1, .L262+4
	movw	r3, #1228
	mla	r3, r3, r8, r1
	ldr	r2, [r3, #56]
	ldr	r5, [r3, #60]
	mov	r0, r2
	str	r2, [fp, #-64]
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	str	r3, [fp, #-60]
	beq	.L254
	ldrb	ip, [r4]	@ zero_extendqisi2
	ldr	r3, [r4, #52]
	ldr	r0, [r4, #48]
	ldr	r1, [r4, #56]
	add	ip, r0, ip, lsl #1
	mov	r3, r3, asl #28
	ldr	r0, [r4, #60]
	orr	r3, r3, r1, asl #27
	ldr	r1, [r4, #44]
	add	r6, r6, ip, lsl #2
	ldrb	lr, [r4, #1]	@ zero_extendqisi2
	orr	r0, r3, r0, asl #26
	sub	r1, r1, #1
	ldr	r3, [r4, #36]
	orr	r1, r0, r1
	ldr	r0, [r4, #32]
	ldr	ip, [r6, #156]
	sub	r3, r3, #1
	cmp	r0, #0
	ldr	r6, [fp, #-60]
	ldr	r7, [fp, #-64]
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #14
	movne	r0, #-2147483648
	cmp	lr, #1
	orr	r3, r3, r0
	mov	r2, r7
	ldr	r1, .L262+84
	moveq	ip, #33554432
	movne	ip, #0
	mov	r0, #4
	orr	r3, r3, ip
	str	r3, [r6]
	ldr	r3, [r6]
	bl	dprint_vfmw
	ldr	r3, [r4, #312]
	add	r2, r7, #4
	ldr	r1, .L262+88
	bic	r3, r3, #15
	mov	r0, #4
	str	r3, [r6, #4]
	ldr	r3, [r6, #4]
	bl	dprint_vfmw
	ldr	r3, [r4, #64]
	add	r2, r7, #8
	ldr	r1, .L262+92
	mov	r0, #4
	str	r3, [r6, #8]
	ldr	r3, [r6, #8]
	bl	dprint_vfmw
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L255
	ldr	r6, [fp, #-60]
	mov	r0, #4
	ldr	r7, [fp, #-64]
	ldr	r1, .L262+96
	str	r3, [r6, #12]
	add	r2, r7, #12
	str	r3, [r6, #16]
	ldr	r3, [r6, #12]
	bl	dprint_vfmw
	ldr	r3, [r6, #16]
.L242:
	add	r2, r7, #16
	ldr	r1, .L262+100
	mov	r0, #4
	bic	r5, r5, #15
	bl	dprint_vfmw
	ldr	r1, [fp, #-56]
	ldr	r0, .L262+4
	movw	r3, #1228
	ldr	r7, [fp, #-60]
	ldr	r8, [fp, #-64]
	mla	r3, r3, r1, r0
	add	r2, r8, #20
	ldr	r1, .L262+104
	mov	r0, #4
	add	r6, r3, #1136
	ldr	r3, [r3, #1144]
	bic	r3, r3, #15
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bl	dprint_vfmw
	ldr	r3, [r6, #12]
	add	r2, r8, #24
	ldr	r1, .L262+108
	bic	r3, r3, #15
	mov	r0, #4
	str	r3, [r7, #24]
	ldr	r3, [r7, #24]
	bl	dprint_vfmw
	ldrb	r3, [r4]	@ zero_extendqisi2
	ldr	r6, [fp, #-60]
	mov	r0, #4
	cmp	r3, #2
	ldr	r7, [fp, #-64]
	ldreq	r2, [r4, #316]
	ldrne	r3, [r4, #316]
	ldreq	r1, [r4, #716]
	addne	r3, r3, #146
	ldrne	r3, [r4, r3, asl #2]
	addeq	r2, r2, #146
	ldreq	r3, [r4, r2, asl #2]
	add	r2, r7, #28
	addeq	r3, r3, r1
	ldr	r1, .L262+112
	bic	r3, r3, #15
	str	r3, [r6, #28]
	ldr	r3, [r6, #28]
	bl	dprint_vfmw
	ldr	r2, [fp, #-56]
	ldr	r1, .L262+4
	movw	r3, #1228
	mov	r0, #4
	mla	r3, r3, r2, r1
	add	r2, r7, #32
	ldr	r1, .L262+116
	ldr	r3, [r3, #1152]
	bic	r3, r3, #15
	str	r3, [r6, #32]
	ldr	r3, [r6, #32]
	bl	dprint_vfmw
	str	r5, [r6, #36]
	add	r2, r7, #36
	ldr	r1, .L262+120
	mov	r0, #4
	ldr	r3, [r6, #36]
	bl	dprint_vfmw
	ldr	r5, [r4, #936]
	cmp	r5, #0
	beq	.L256
	ldr	r3, [fp, #-60]
	add	r8, r4, #740
	ldr	r2, [fp, #-64]
	mov	r6, #0
	add	r7, r3, #40
	rsb	r10, r3, r2
.L171:
	ldr	r0, [r8, #4]!
	mov	r3, r7
	add	r2, r6, #10
	ldr	r1, .L262+124
	add	r6, r6, #1
	add	r0, r4, r0, lsl #2
	ldr	lr, [r0, #324]
	mov	r0, #4
	bic	lr, lr, #15
	str	lr, [r3], r10
	ldr	ip, [r7]
	add	r7, r7, r0
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r5, [r4, #936]
	cmp	r6, r5
	bcc	.L171
	cmp	r5, #15
	bhi	.L175
.L170:
	add	r2, r5, #10
	ldr	r3, [fp, #-60]
	add	r6, r3, r2, lsl #2
.L174:
	ldr	lr, [r4, #744]
	mov	r3, r6
	add	r5, r5, #1
	mov	r0, #4
	ldr	r1, .L262+124
	add	lr, r4, lr, lsl #2
	ldr	lr, [lr, #324]
	bic	lr, lr, #15
	str	lr, [r3], r10
	ldr	ip, [r6]
	add	r6, r6, r0
	str	ip, [sp]
	bl	dprint_vfmw
	cmp	r5, #15
	add	r2, r5, #10
	bls	.L174
.L175:
	ldr	r1, [fp, #-56]
	movw	r3, #1228
	ldr	r0, .L262+4
	ldr	ip, [fp, #-60]
	ldr	r2, [fp, #-64]
	mla	r3, r3, r1, r0
	add	r2, r2, #104
	ldr	r1, .L262+128
	mov	r0, #4
	ldr	r3, [r3, #1088]
	bic	r3, r3, #15
	str	r3, [ip, #104]
	ldr	r3, [ip, #104]
	bl	dprint_vfmw
	ldr	r6, [r4, #936]
	cmp	r6, #0
	beq	.L257
	ldr	r3, [fp, #-64]
	add	r9, r4, #804
	mov	r5, #0
	add	r3, r3, #108
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-60]
	add	r8, r3, #108
	add	r7, r3, #112
.L177:
	ldr	r0, [r9, #4]!
	mov	r3, r8
	mov	r6, r5, asl #1
	ldr	r1, .L262+124
	add	r2, r6, #27
	add	r5, r5, #1
	str	r0, [r3], r10
	mov	r0, #4
	ldr	ip, [r7, #-4]
	add	r8, r8, #8
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	ip, [r9, #64]
	mov	r3, r7
	add	r2, r6, #28
	ldr	r1, .L262+124
	mov	r0, #4
	str	ip, [r3], r10
	add	r7, r7, #8
	ldr	ip, [r8, #-4]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r6, [r4, #936]
	cmp	r5, r6
	bcc	.L177
	cmp	r6, #15
	bhi	.L180
.L176:
	ldr	r2, [fp, #-68]
	mov	r7, r6, asl #1
	ldr	r3, [fp, #-60]
	add	r7, r7, #27
	str	r4, [fp, #-68]
	mov	r8, #0
	rsb	r9, r3, r2
	ldr	r2, [fp, #-64]
	add	r5, r3, r6, lsl #3
	mov	r4, r3
	add	r10, r2, #112
.L179:
	str	r8, [r5, #108]
	add	r3, r9, r5
	ldr	ip, [r5, #108]
	mov	r2, r7
	ldr	r1, .L262+124
	mov	r0, #4
	add	r6, r6, #1
	str	ip, [sp]
	bl	dprint_vfmw
	str	r8, [r5, #112]
	ldr	ip, [r5, #112]
	rsb	r3, r4, r10
	add	r3, r3, r5
	add	r2, r7, #1
	ldr	r1, .L262+124
	mov	r0, #4
	str	ip, [sp]
	add	r5, r5, #8
	bl	dprint_vfmw
	cmp	r6, #15
	add	r7, r7, #2
	bls	.L179
	ldr	r4, [fp, #-68]
.L180:
	ldr	r2, [fp, #-64]
	movw	r3, #1228
	ldr	r1, .L262+4
	add	r6, r4, #76
	add	r8, r2, #256
	ldr	r2, [fp, #-56]
	mov	r5, #0
	mla	r3, r3, r2, r1
	ldr	r2, [fp, #-60]
	add	r7, r2, #256
	ldr	r3, [r3, #1160]
	bic	r3, r3, #15
	str	r3, [r2, #236]
.L178:
	ldr	r3, [r6]
	mov	r2, r5
	ldr	r1, .L262+132
	mov	r0, #4
	add	r5, r5, #1
	str	r3, [r7]
	ldr	r3, [r6], #4
	bl	dprint_vfmw
	mov	r2, r8
	mov	r0, #4
	ldr	r3, [r7], #4
	ldr	r1, .L262+136
	add	r8, r8, r0
	bl	dprint_vfmw
	cmp	r5, #56
	bne	.L178
.L163:
	ldr	r7, [r4, #944]
	cmp	r7, #0
	beq	.L258
	ldr	r10, [r7, #48]
	cmp	r10, #0
	bne	.L259
.L183:
	ldr	r3, [fp, #-56]
	movw	r9, #307
	ldr	r1, [r4, #940]
	mov	r8, #0
	mov	r6, r8
	mul	r9, r9, r3
.L185:
	cmp	r6, r1
	bge	.L260
.L198:
	ldr	r0, [r7, #48]
	add	ip, r10, #5
	add	lr, ip, r6
	cmp	r0, r8
	add	r3, r9, lr
	add	r3, r3, #10
	movhi	r2, #0
	movls	r2, #1
	cmp	r6, #0
	movle	r2, #0
	cmp	r2, #0
	ldr	r2, .L262+4
	ldr	r2, [r2, r3, asl #2]
	bne	.L185
	add	r6, r6, #1
	mov	r8, r0
	cmp	r6, r1
	bge	.L187
	ldr	r5, [r7, #4056]
	cmp	r5, #0
	beq	.L188
	ldr	r3, [r5, #48]
	cmp	r0, r3
	bcs	.L192
	b	.L204
.L193:
	ldr	r5, [r5, #4056]
	cmp	r5, #0
	beq	.L188
	ldr	r3, [r5, #48]
	cmp	r0, r3
	bcc	.L204
.L192:
	add	r6, r6, #1
	cmp	r6, r1
	bne	.L193
	cmp	r5, #0
	beq	.L153
.L205:
	ldr	ip, [r4, #36]
	mov	r0, #0
	ldr	r1, [r4, #44]
	mov	r3, r0
	str	r0, [r7, #4056]
	ldr	r6, [r4, #940]
	mul	r1, r1, ip
	sub	r1, r1, #1
.L196:
	str	r1, [sp]
	mov	r0, r4
	mov	r1, r7
	bl	H264HAL_V4R3C1_SetSliceMsg.isra.7
	cmp	r0, #0
	bne	.L197
	ldr	r1, [r4, #940]
	mov	r7, r5
	cmp	r6, r1
	blt	.L198
.L260:
	cmp	r1, #0
	ble	.L199
	ldr	r2, [fp, #-56]
	movw	r3, #307
	mla	r3, r3, r2, r10
	ldr	r2, .L262+4
	add	r3, r3, r1
	add	r3, r3, #14
	ldr	r0, [r2, r3, asl #2]
	bl	MEM_Phy2Vir
	subs	r4, r0, #0
	movne	r0, #0
	strne	r0, [r4, #252]
	bne	.L235
	ldr	r3, .L262+140
	ldr	r2, .L262+144
	ldr	r1, .L262+148
	bl	dprint_vfmw
	mov	r0, r4
	b	.L235
.L252:
	ldr	r3, [r4, #1180]
	cmp	r3, #0
	beq	.L157
	mov	r0, r9
	ldr	r1, .L262+152
	bl	dprint_vfmw
	b	.L153
.L255:
	ldr	r6, [fp, #-60]
	mov	r0, #4
	ldr	r3, [r4, #68]
	ldr	r7, [fp, #-64]
	ldr	r1, .L262+96
	str	r3, [r6, #12]
	add	r2, r7, #12
	ldr	ip, [r4, #72]
	ldr	r3, [r6, #12]
	str	ip, [r6, #16]
	bl	dprint_vfmw
	ldr	r3, [r6, #16]
	b	.L242
.L187:
	cmp	r7, #0
	beq	.L153
	mov	r5, r7
.L204:
	cmp	lr, #140
	cmpne	r6, r1
	beq	.L205
	add	r3, r9, ip
	ldr	r0, .L262+4
	add	r3, r3, r6
	ldr	r1, [r5, #48]
	add	r3, r3, #10
	sub	r1, r1, #1
	ldr	r3, [r0, r3, asl #2]
	b	.L196
.L188:
	mov	r2, #820
	ldr	r1, .L262+156
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L259:
	ldr	r3, [fp, #-56]
	movw	r2, #1228
	ldr	r1, .L262+4
	mov	r6, #1
	ldr	r9, [r7, #8]
	sub	ip, r10, #1
	str	r6, [r7, #8]
	mov	r0, r4
	mla	r2, r2, r3, r1
	ldr	r3, [r7, #12]
	ldr	r1, [r7, #20]
	ldr	r8, [r7, #28]
	str	r3, [fp, #-60]
	ldr	r3, [r7, #16]
	ldr	r5, [r7, #24]
	str	r1, [fp, #-68]
	mov	r1, r7
	str	r3, [fp, #-64]
	mov	r3, #0
	str	r3, [r7, #48]
	str	r3, [r7, #12]
	str	r3, [r7, #16]
	str	r3, [r7, #20]
	ldr	lr, [r4, #736]
	str	r3, [r7, #28]
	str	lr, [r7, #24]
	ldr	r3, [r2, #64]
	ldr	r2, [r2, #60]
	str	ip, [sp]
	bl	H264HAL_V4R3C1_SetSliceMsg.isra.7
	cmp	r0, #0
	bne	.L261
	ldr	r3, [fp, #-60]
	str	r10, [r7, #48]
	mov	r10, r6
	str	r9, [r7, #8]
	str	r3, [r7, #12]
	ldr	r3, [fp, #-64]
	str	r5, [r7, #24]
	str	r8, [r7, #28]
	str	r3, [r7, #16]
	ldr	r3, [fp, #-68]
	str	r3, [r7, #20]
	ldr	r7, [r4, #944]
	b	.L183
.L197:
	movw	r2, #1191
	ldr	r1, .L262+160
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L235
.L253:
	ldr	r1, .L262+164
	mov	r3, r5
	ldr	r7, [fp, #-56]
	mov	r0, #92
	ldr	r6, [r1]
	mov	r2, r7
	mov	r1, r6
	bl	MFDE_ConfigReg
	mov	r2, r6
	ldr	r1, .L262+168
	mov	r0, #3
	bl	dprint_vfmw
	ldr	r1, [r4, #308]
	mov	r2, r7
	mov	r3, r5
	mov	r0, #112
	add	r1, r4, r1, lsl #2
	ldr	r6, [r1, #452]
	mov	r1, r6
	bl	MFDE_ConfigReg
	mov	r2, r6
	ldr	r1, .L262+172
	mov	r0, #3
	bl	dprint_vfmw
	b	.L159
.L257:
	ldr	r3, [fp, #-64]
	add	r3, r3, #108
	str	r3, [fp, #-68]
	b	.L176
.L256:
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-60]
	rsb	r10, r2, r3
	b	.L170
.L250:
	bl	MEM_Phy2Vir
	ldr	r2, .L262+4
	cmp	r0, #0
	str	r0, [r6, r2]
	bne	.L152
	ldr	r1, .L262+176
	bl	dprint_vfmw
	b	.L153
.L247:
	mov	r0, #0
	ldr	r2, .L262+180
	str	r0, [sp]
	ldr	r1, .L262+184
	bl	dprint_vfmw
	b	.L153
.L148:
	ldr	r3, .L262+188
	mov	r0, #0
	ldr	r2, .L262+180
	ldr	r1, .L262+148
	bl	dprint_vfmw
	b	.L153
.L199:
	ldr	r1, .L262+192
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L235
.L261:
	mov	r0, r6
	movw	r2, #1138
	ldr	r1, .L262+160
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L235
.L249:
	ldr	r3, .L262+196
	ldr	r2, .L262+180
	ldr	r1, .L262+148
	bl	dprint_vfmw
	b	.L153
.L258:
	mov	r0, r7
	ldr	r1, .L262+200
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L235
.L248:
	ldr	r3, .L262+204
	ldr	r2, .L262+180
	ldr	r1, .L262+148
	bl	dprint_vfmw
	b	.L153
.L251:
	mov	r3, r5
	ldr	r2, .L262+208
	ldr	r1, .L262+212
	mov	r0, #0
	bl	dprint_vfmw
	b	.L153
.L254:
	ldr	r3, .L262+216
	ldr	r2, .L262+220
	ldr	r1, .L262+148
	bl	dprint_vfmw
	b	.L163
.L263:
	.align	2
.L262:
	.word	.LC34
	.word	g_HwMem
	.word	.LANCHOR1
	.word	.LC72
	.word	g_HalDisable
	.word	g_VdmDrvParam
	.word	s_pstVfmwChan
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LANCHOR0
	.word	.LC52
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC1
	.word	.LANCHOR0+216
	.word	.LC2
	.word	.LC42
	.word	.LC70
	.word	.LC69
	.word	g_TunnelLineNumber
	.word	.LC43
	.word	.LC44
	.word	.LC35
	.word	.LANCHOR0+104
	.word	.LC30
	.word	.LC32
	.word	.LC71
	.word	.LC33
	.word	.LC68
	.word	.LC31
	.word	.LANCHOR0+128
	.word	.LC36
	.word	.LC53
	.word	.LANCHOR0+188
	UNWIND(.fnend)
	.size	H264HAL_V4R3C1_StartDec, .-H264HAL_V4R3C1_StartDec
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	g_ListStructFrame, %object
	.size	g_ListStructFrame, 32
g_ListStructFrame:
	.word	0
	.word	1
	.word	3
	.word	3
	.word	3
	.word	3
	.word	2
	.word	2
	.type	g_ListStructField, %object
	.size	g_ListStructField, 32
g_ListStructField:
	.word	0
	.word	1
	.word	2
	.word	2
	.word	2
	.word	2
	.word	2
	.word	2
	.type	__func__.14259, %object
	.size	__func__.14259, 27
__func__.14259:
	.ascii	"H264HAL_V4R3C1_SetSliceMsg\000"
	.space	1
	.type	g_SliceTypeForPMV, %object
	.size	g_SliceTypeForPMV, 12
g_SliceTypeForPMV:
	.word	1
	.word	2
	.word	0
	.type	__func__.14182, %object
	.size	__func__.14182, 23
__func__.14182:
	.ascii	"H264HAL_CheckParaValid\000"
	.space	1
	.type	__func__.14203, %object
	.size	__func__.14203, 25
__func__.14203:
	.ascii	"H264HAL_V4R3C1_CfgVdmReg\000"
	.space	3
	.type	g_StructTrans, %object
	.size	g_StructTrans, 32
g_StructTrans:
	.word	0
	.word	3
	.word	1
	.word	1
	.word	2
	.word	2
	.word	3
	.word	3
	.type	__func__.14229, %object
	.size	__func__.14229, 25
__func__.14229:
	.ascii	"H264HAL_V4R3C1_SetPicMsg\000"
	.space	3
	.type	__func__.14048, %object
	.size	__func__.14048, 29
__func__.14048:
	.ascii	"H264HAL_V4R3C1_CutSliceChain\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"slicemsg D[%d] address 0x%x = 0x%x\012\000" )
.LC1:
	ASCII(.ascii	"can not map slice msg virtual address!\012\000" )
.LC2:
	ASCII(.ascii	"%s: %s\012\000" )
.LC3:
	ASCII(.ascii	"Before slicemsg D[%d] tmp =0x%x,bitsoffset =0x%x,by" )
	ASCII(.ascii	"tespos = 0x%x\012\000" )
	.space	2
.LC4:
	ASCII(.ascii	"slicemsg D[%d] addr 0x%x = 0x%x\012\000" )
	.space	3
.LC5:
	ASCII(.ascii	"slicemsg D[4] addr 0x%x = 0x%x\012\000" )
.LC6:
	ASCII(.ascii	"slicemsg D[5] addr 0x%x = 0x%x\012\000" )
.LC7:
	ASCII(.ascii	"slicemsg g_pListX[1][0]->frame_store->pmv_address_i" )
	ASCII(.ascii	"dc = %d\012\000" )
.LC8:
	ASCII(.ascii	"slicemsg D[6] addr 0x%x = 0x%x\012\000" )
.LC9:
	ASCII(.ascii	"slicemsg D[7] addr 0x%x = 0x%x\012\000" )
.LC10:
	ASCII(.ascii	"slicemsg D[8] addr 0x%x = 0x%x\012\000" )
.LC11:
	ASCII(.ascii	"slicemsg D[9] addr 0x%x = 0x%x\012\000" )
.LC12:
	ASCII(.ascii	"slicemsg burst1 D0~D31, burst2 D0~31, burst3 D0~D31" )
	ASCII(.ascii	" list0size = %d\012\000" )
.LC13:
	ASCII(.ascii	"luma_lg = %d\012\000" )
	.space	2
.LC14:
	ASCII(.ascii	"wp_weight_l0_y = %d\012\000" )
	.space	3
.LC15:
	ASCII(.ascii	"wp_offset_l0_y = %d\012\000" )
	.space	3
.LC16:
	ASCII(.ascii	"chroma_lg = %d\012\000" )
.LC17:
	ASCII(.ascii	"wp_weight_l1_y = %d\012\000" )
	.space	3
.LC18:
	ASCII(.ascii	"wp_offset_l1_y = %d\012\000" )
	.space	3
.LC19:
	ASCII(.ascii	"wp_weight_l0_u = %d\012\000" )
	.space	3
.LC20:
	ASCII(.ascii	"wp_offset_l0_u = %d\012\000" )
	.space	3
.LC21:
	ASCII(.ascii	"wp_weight_l1_u = %d\012\000" )
	.space	3
.LC22:
	ASCII(.ascii	"wp_offset_l1_u = %d\012\000" )
	.space	3
.LC23:
	ASCII(.ascii	"wp_weight_l0_v = %d\012\000" )
	.space	3
.LC24:
	ASCII(.ascii	"wp_offset_l0_v = %d\012\000" )
	.space	3
.LC25:
	ASCII(.ascii	"wp_weight_l1_v = %d\012\000" )
	.space	3
.LC26:
	ASCII(.ascii	"wp_offset_l1_v = %d\012\000" )
	.space	3
.LC27:
	ASCII(.ascii	"slicemsg burst1 D32~D63, burst2 D32~63, burst3 D32~" )
	ASCII(.ascii	"D63 list1size = %d\012\000" )
	.space	1
.LC28:
	ASCII(.ascii	"line: %d, p = NULL is not expected value!\012\000" )
	.space	1
.LC29:
	ASCII(.ascii	"H264HAL_V4R3C1_InitHal return error.\012\000" )
	.space	2
.LC30:
	ASCII(.ascii	"%s: VdhId(%d) > %d\012\000" )
.LC31:
	ASCII(.ascii	"point of picture para null\012\000" )
.LC32:
	ASCII(.ascii	"picture width out of range\012\000" )
.LC33:
	ASCII(.ascii	"point of fst slice para null\012\000" )
	.space	2
.LC34:
	ASCII(.ascii	"VdhId is wrong! H264HAL_StartDec\012\000" )
	.space	2
.LC35:
	ASCII(.ascii	"vdm register virtual address not mapped, reset fail" )
	ASCII(.ascii	"ed!\012\000" )
.LC36:
	ASCII(.ascii	"%s: pMfdeTask(%p) = NULL\012\000" )
	.space	2
.LC37:
	ASCII(.ascii	"BASIC_V4R3C1_CFG0 = 0x%x\012\000" )
	.space	2
.LC38:
	ASCII(.ascii	"BASIC_V4R3C1_CFG1 = 0x%x\012\000" )
	.space	2
.LC39:
	ASCII(.ascii	"AVM_V4R3C1_ADDR = 0x%x\012\000" )
.LC40:
	ASCII(.ascii	"VAM_V4R3C1_ADDR = 0x%x\012\000" )
.LC41:
	ASCII(.ascii	"STREAM_V4R3C1_BASE_ADDR = 0x%x\012\000" )
.LC42:
	ASCII(.ascii	"ERROR: not support H264 MBAFF(pic_width_in_mb %d) e" )
	ASCII(.ascii	"xt ram, for it needs double size!!\012\000" )
	.space	1
.LC43:
	ASCII(.ascii	"VREG_PART_DEC_OVER_INT_LEVEL=0x%x\012\000" )
	.space	1
.LC44:
	ASCII(.ascii	"VREG_LINE_NUM_STADDR = 0x%x\012\000" )
	.space	3
.LC45:
	ASCII(.ascii	"YSTADDR_V4R3C1_1D = 0x%x\012\000" )
	.space	2
.LC46:
	ASCII(.ascii	"YSTRIDE_V4R3C1_1D = 0x%x\012\000" )
	.space	2
.LC47:
	ASCII(.ascii	"UVOFFSET_V4R3C1_1D = 0x%x\012\000" )
	.space	1
.LC48:
	ASCII(.ascii	"HEAD_INF_OFFSET_V4R3C1_1D = 0x%x\012\000" )
	.space	2
.LC49:
	ASCII(.ascii	"PPFD_V4R3C1_BUF_ADDR = 0x%x\012\000" )
	.space	3
.LC50:
	ASCII(.ascii	"PPFD_V4R3C1_BUF_LEN = 0x%x\012\000" )
.LC51:
	ASCII(.ascii	"REF_V4R3C1_PIC_TYPE = 0x%x\012\000" )
.LC52:
	ASCII(.ascii	"FF_V4R3C1_APT_EN = 0x%x\012\000" )
	.space	3
.LC53:
	ASCII(.ascii	"can not map down msg virtual address!\012\000" )
	.space	1
.LC54:
	ASCII(.ascii	"picmsg D[0] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC55:
	ASCII(.ascii	"picmsg D[1] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC56:
	ASCII(.ascii	"picmsg D[2] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC57:
	ASCII(.ascii	"picmsg D[3] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC58:
	ASCII(.ascii	"picmsg D[4] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC59:
	ASCII(.ascii	"picmsg D[5] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC60:
	ASCII(.ascii	"picmsg D[6] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC61:
	ASCII(.ascii	"picmsg D[7] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC62:
	ASCII(.ascii	"picmsg D[8] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC63:
	ASCII(.ascii	"picmsg D[9] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC64:
	ASCII(.ascii	"picmsg D[%d] addr 0x%x = 0x%x\012\000" )
	.space	1
.LC65:
	ASCII(.ascii	"picmsg D[26] addr 0x%x = 0x%x\012\000" )
	.space	1
.LC66:
	ASCII(.ascii	"qmatrix[%d] = 0x%x\012\000" )
.LC67:
	ASCII(.ascii	"picmsg Dxx addr 0x%x = 0x%x\012\000" )
	.space	3
.LC68:
	ASCII(.ascii	"pSlicePara = NULL!\012\000" )
.LC69:
	ASCII(.ascii	"line %d Set slice msg not wrong!\012\000" )
	.space	2
.LC70:
	ASCII(.ascii	"line %d pSlicePara is NULL!\012\000" )
	.space	3
.LC71:
	ASCII(.ascii	"!!! no slice to dec, add up msg report.\000" )
.LC72:
	ASCII(.ascii	"\012\012***********************H264HAL_StartDec is " )
	ASCII(.ascii	"Now %d***********************\012\000" )
	.bss
	.align	2
.LANCHOR1 = . + 0
	.type	StartCnt.14281, %object
	.size	StartCnt.14281, 4
StartCnt.14281:
	.space	4
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
