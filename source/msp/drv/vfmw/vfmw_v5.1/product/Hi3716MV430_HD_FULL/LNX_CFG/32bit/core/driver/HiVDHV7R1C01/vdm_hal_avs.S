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
	.file	"vdm_hal_avs.c"
	.text
	.align	2
	.type	AVSHAL_StartDec_ConfigWQMatrix.part.0, %function
AVSHAL_StartDec_ConfigWQMatrix.part.0:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	ldr	r4, .L11
	mov	lr, #1
	add	r1, r1, #1
	mov	r6, lr
	mov	r5, r4
.L7:
	tst	lr, #1
	add	lr, lr, #1
	add	r0, r0, #16
	ldrneb	r7, [r0, #272]	@ zero_extendqisi2
	ldreqb	r7, [r0, #260]	@ zero_extendqisi2
	ldrneb	r3, [r0, #280]	@ zero_extendqisi2
	ldreqb	r3, [r0, #268]	@ zero_extendqisi2
	movne	r7, r7, asl #16
	ldrneb	ip, [r0, #256]	@ zero_extendqisi2
	moveq	r7, r7, asl #16
	ldreqb	ip, [r0, #244]	@ zero_extendqisi2
	orr	r3, r7, r3, asl #24
	ldrneb	r8, [r0, #264]	@ zero_extendqisi2
	ldreqb	r8, [r0, #252]	@ zero_extendqisi2
	orr	r3, r3, ip
	ldr	ip, [r4, #848]
	ldr	r7, [r4, #852]
	rsb	ip, ip, r2
	orr	r3, r3, r8, asl #8
	cmp	ip, r7
	strcc	r3, [r2]
	strcs	r6, [r5, #844]
	cmp	lr, r1
	add	r2, r2, #4
	bne	.L7
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	g_HwMem
	UNWIND(.fnend)
	.size	AVSHAL_StartDec_ConfigWQMatrix.part.0, .-AVSHAL_StartDec_ConfigWQMatrix.part.0
	.align	2
	.global	AVSHAL_StartDec_ConfigWQMatrix
	.type	AVSHAL_StartDec_ConfigWQMatrix, %function
AVSHAL_StartDec_ConfigWQMatrix:
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
	ldrb	r3, [r0, #45]	@ zero_extendqisi2
	cmp	r3, #1
	ldmnefd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVSHAL_StartDec_ConfigWQMatrix.part.0
	UNWIND(.fnend)
	.size	AVSHAL_StartDec_ConfigWQMatrix, .-AVSHAL_StartDec_ConfigWQMatrix
	.align	2
	.global	AVSHAL_WriteSliceMsg
	.type	AVSHAL_WriteSliceMsg, %function
AVSHAL_WriteSliceMsg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #52)
	sub	sp, sp, #52
	ldr	r5, .L83
	mov	r3, #1000
	mov	r6, r0
	ldr	r2, [r6, #72]
	mla	r1, r3, r1, r5
	str	r0, [fp, #-56]
	add	r0, r0, #560
	str	r0, [fp, #-52]
	str	r2, [fp, #-68]
	ldr	r4, [r1, #32]
	add	r3, r4, #320
	str	r3, [fp, #-76]
	mov	r0, r4
	bl	MEM_Phy2Vir
	ldr	r2, [r6, #576]
	ldrh	r3, [r6, #64]
	ldrh	r1, [r6, #66]
	cmp	r2, #0
	mul	r3, r1, r3
	add	r10, r0, #320
	beq	.L67
	ldr	r2, [fp, #-56]
	ldr	r1, [r5, #848]
	ldr	r6, .L83
	ldr	ip, [r2, #560]
	rsb	r7, r1, r10
	ldr	r2, [fp, #-68]
	add	ip, ip, #4
	rsb	ip, r2, ip
	ldr	r2, [r5, #852]
	and	lr, ip, #15
	bic	ip, ip, #15
	mov	lr, lr, asl #3
	cmp	lr, #7
	addls	lr, lr, #120
	subhi	lr, lr, #8
	subls	ip, ip, #4
	cmp	r7, r2
	movcc	r2, lr, asl #25
	orrcc	r2, r2, #8
	movcs	lr, #1
	strcc	r2, [r0, #320]
	strcs	lr, [r6, #844]
	add	lr, r0, #320
	ldrcc	r1, [r6, #848]
	add	lr, lr, #1
	ldrcc	r2, [r6, #852]
	rsb	lr, r1, lr
	cmp	lr, r2
	strcc	ip, [r0, #324]
	movcs	ip, #1
	ldrcc	r1, [r5, #848]
	strcs	ip, [r5, #844]
	add	ip, r0, #320
	ldrcc	r2, [r5, #852]
	add	ip, ip, #2
	rsb	ip, r1, ip
	cmp	ip, r2
	movcc	r2, #0
	movcs	ip, #1
	strcc	r2, [r0, #328]
	strcs	ip, [r5, #844]
	add	ip, r0, #320
	ldrcc	r1, [r5, #848]
	add	ip, ip, #3
	ldrcc	r2, [r5, #852]
	rsb	ip, r1, ip
	cmp	ip, r2
	movcs	ip, #1
	strcs	ip, [r5, #844]
	ldr	ip, [fp, #-56]
	movcc	r2, #0
	strcc	r2, [r0, #332]
	ldrcc	r2, [r5, #852]
	ldr	lr, [ip, #576]
	sub	ip, r3, #1
	ldrcc	r1, [r5, #848]
	sub	lr, lr, #1
	cmp	lr, ip
	movcs	r6, #1
	movcc	r6, #0
	str	r6, [fp, #-48]
	add	r6, r0, #324
	rsb	r6, r1, r6
	movcs	lr, ip
	movcc	ip, #1
	movcs	ip, #0
	cmp	r6, r2
	movcc	lr, lr, asl #16
	strcc	lr, [r0, #336]
	movcs	lr, #1
	strcs	lr, [r5, #844]
	ldr	lr, [fp, #-48]
	ldrcc	r2, [r5, #852]
	ldrcc	r1, [r5, #848]
	cmp	lr, #1
	add	lr, r0, #380
	addne	r4, r4, #576
	add	lr, lr, #3
	moveq	r4, #0
	rsb	r1, r1, lr
	cmp	r1, r2
	strcc	r4, [r0, #572]
	movcs	r2, #1
	movcc	r2, #1
	strcs	r2, [r5, #844]
	str	r2, [fp, #-80]
.L16:
	ldr	r2, [fp, #-56]
	ldr	r0, [r2, #108]
	cmp	r0, #0
	andgt	ip, ip, #1
	movle	ip, #0
	cmp	ip, #0
	beq	.L15
	mov	r2, r3, lsr #1
	mov	ip, #0
	sub	r3, r3, #1
	str	r2, [fp, #-84]
	str	r3, [fp, #-60]
	mov	r8, ip
	sub	r3, r2, #1
	str	r3, [fp, #-88]
	mov	r3, ip
	b	.L65
.L79:
	ldr	r3, [fp, #-48]
	clz	r2, r3
	mov	r2, r2, lsr #5
.L34:
	sub	r3, ip, #1
.L37:
	add	r3, r3, #1
	cmp	r0, r3
	movle	r2, #0
	andgt	r2, r2, #1
	cmp	r2, #0
	beq	.L15
.L65:
	cmp	r8, #255
	bgt	.L79
	ldr	r1, [fp, #-52]
	mov	r6, r3, asl #2
	mov	r4, r3, asl #5
	cmp	r3, #0
	rsb	r2, r6, r4
	add	r2, r1, r2
	ldr	r1, [r2, #16]
	ble	.L36
	ldr	lr, [r2, #-12]
	cmp	r1, lr
	bls	.L78
.L36:
	ldr	lr, [fp, #-60]
	cmp	lr, r1
	str	lr, [fp, #-64]
	bcc	.L78
	ldr	r0, [r2]
	ldr	r1, [fp, #-68]
	ldr	ip, [r2, #8]
	add	r0, r0, #4
	ldr	r9, [r2, #4]
	rsb	r0, r1, r0
	and	lr, r0, #15
	sub	ip, ip, #4
	cmp	r9, #0
	bic	r0, r0, #15
	mov	ip, ip, asl #3
	mov	lr, lr, asl #3
	beq	.L76
	ldr	r1, [fp, #-56]
	rsb	r4, r6, r4
	add	r4, r1, r4
	ldr	r1, [r4, #572]
	cmp	r1, #0
	ble	.L71
	ldr	r1, [fp, #-68]
	cmp	ip, #0
	ldr	r7, [r2, #12]
	rsb	r9, r1, r9
	and	r4, r9, #15
	bic	r1, r9, #15
	mov	r6, r4, asl #3
	mov	r4, r7, asl #3
	bne	.L80
	mov	r9, #0
	mov	ip, r4
	mov	lr, r6
	mov	r0, r1
.L76:
	str	r9, [fp, #-72]
.L39:
	ldr	r6, [r5, #848]
	mov	r1, r3, asl #6
	ldr	r4, [r5, #852]
	add	r7, r10, r1
	cmp	lr, #7
	rsb	r7, r6, r7
	add	ip, ip, #8
	subls	r0, r0, #4
	addls	lr, lr, #120
	subhi	lr, lr, #8
	cmp	r7, r4
	biccc	ip, ip, #-33554432
	orrcc	ip, ip, lr, asl #25
	ldrcs	ip, .L83
	strcc	ip, [r10, r3, asl #8]
	movcs	lr, #1
	ldrcc	ip, .L83
	strcs	lr, [ip, #844]
	ldrcc	r6, [ip, #848]
	ldrcc	r4, [ip, #852]
	add	ip, r1, #1
	add	ip, r10, ip
	rsb	ip, r6, ip
	cmp	ip, r4
	movcc	ip, r3, asl #8
	addcc	ip, ip, #4
	movcs	r0, #1
	strcs	r0, [r5, #844]
	strcc	r0, [r10, ip]
	add	r0, r1, #2
	ldrcc	r6, [r5, #848]
	add	r0, r10, r0
	ldrcc	r4, [r5, #852]
	rsb	r0, r6, r0
	cmp	r0, r4
	movcc	r0, r3, asl #8
	ldrcc	ip, [fp, #-72]
	addcc	r0, r0, #8
	movcs	r0, #1
	strcs	r0, [r5, #844]
	strcc	ip, [r10, r0]
	add	r0, r1, #3
	ldrcc	r6, [r5, #848]
	add	r0, r10, r0
	ldrcc	r4, [r5, #852]
	add	ip, r3, #1
	rsb	r6, r6, r0
	cmp	r6, r4
	movcc	r0, r3, asl #8
	addcc	r0, r0, #12
	movcs	r0, #1
	strcs	r0, [r5, #844]
	strcc	r9, [r10, r0]
	ldr	r0, [fp, #-56]
	ldr	r4, [r0, #108]
	cmp	ip, r4
	bge	.L50
	mov	lr, ip, asl #5
	ldr	r7, [fp, #-52]
	sub	lr, lr, ip, asl #2
	ldr	r0, [r2, #16]
	add	r6, r7, lr
	ldr	r6, [r6, #16]
	cmp	r0, r6
	bcc	.L50
	sub	lr, lr, #28
	add	lr, r7, lr
	b	.L51
.L53:
	ldr	r6, [lr, #44]
	cmp	r6, r0
	bhi	.L55
.L51:
	add	ip, ip, #1
	add	lr, lr, #28
	cmp	ip, r4
	bne	.L53
.L54:
	mov	r2, #0
	mov	lr, #1
	mov	ip, r4
	mov	r7, r2
	str	lr, [fp, #-48]
	b	.L56
.L78:
	ldr	r2, [fp, #-48]
	clz	r2, r2
	mov	r2, r2, lsr #5
	b	.L37
.L50:
	cmp	ip, r4
	beq	.L81
.L55:
	ldr	r0, [fp, #-56]
	mov	r6, ip, asl #5
	ldr	lr, [fp, #-52]
	sub	r6, r6, ip, asl #2
	ldrb	r0, [r0, #21]	@ zero_extendqisi2
	add	r6, lr, r6
	cmp	r0, #1
	ldr	lr, [r6, #16]
	sub	lr, lr, #1
	beq	.L82
.L77:
	ldr	r0, [r2, #16]
.L58:
	ldr	r2, [fp, #-60]
	cmp	lr, r2
	bcs	.L73
	ldr	r2, [fp, #-80]
	str	lr, [fp, #-64]
	add	r7, ip, r2
	ldr	r2, [fp, #-48]
	ldr	lr, [fp, #-76]
	clz	r2, r2
	add	r7, lr, r7, lsl #8
	mov	r2, r2, lsr #5
.L56:
	add	lr, r1, #4
	ldr	r6, [r5, #848]
	add	lr, r10, lr
	ldr	r4, [r5, #852]
	rsb	lr, r6, lr
	cmp	lr, r4
	bcc	.L61
	ldr	r0, .L83
	mov	lr, #1
	str	lr, [r0, #844]
.L62:
	add	r1, r1, #63
	add	r8, r8, #1
	add	r1, r10, r1
	rsb	r1, r6, r1
	cmp	r1, r4
	movcc	r3, r3, asl #8
	addcc	r3, r3, #252
	movcs	r3, #1
	strcs	r3, [r5, #844]
	strcc	r7, [r10, r3]
	ldr	r3, [fp, #-56]
	ldr	r0, [r3, #108]
	b	.L34
.L15:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L61:
	ldr	r4, [fp, #-64]
	mov	lr, r3, asl #8
	add	lr, lr, #16
	uxth	r0, r0
	orr	r0, r0, r4, asl #16
	str	r0, [r10, lr]
	ldr	r0, .L83
	ldr	r6, [r0, #848]
	ldr	r4, [r0, #852]
	b	.L62
.L73:
	mov	r2, #0
	mov	lr, #1
	mov	r7, r2
	str	lr, [fp, #-48]
	b	.L56
.L67:
	str	r2, [fp, #-48]
	mov	ip, #1
	str	r2, [fp, #-80]
	b	.L16
.L80:
	bic	r4, r4, #-33554432
	mov	r9, r1
	orr	r1, r4, r6, asl #25
	str	r1, [fp, #-72]
	b	.L39
.L82:
	ldr	r0, [fp, #-84]
	cmp	lr, r0
	bcc	.L59
	ldr	r0, [r2, #16]
	ldr	r4, [fp, #-84]
	cmp	r4, r0
	strhi	r4, [r6, #16]
	ldrhi	lr, [fp, #-88]
	ldrhi	r0, [r2, #16]
	b	.L58
.L71:
	mov	r9, #0
	str	r9, [fp, #-72]
	b	.L39
.L59:
	add	r0, ip, #1
	cmp	r0, r4
	ldreq	r0, [fp, #-84]
	ldreq	lr, [fp, #-88]
	streq	r0, [r6, #16]
	b	.L77
.L81:
	ldr	r0, [r2, #16]
	b	.L54
.L84:
	.align	2
.L83:
	.word	g_HwMem
	UNWIND(.fnend)
	.size	AVSHAL_WriteSliceMsg, .-AVSHAL_WriteSliceMsg
	.align	2
	.global	AVSHAL_StartDec
	.type	AVSHAL_StartDec, %function
AVSHAL_StartDec:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #16)
	sub	sp, sp, #16
	ldr	r4, .L148
	mov	r3, #1000
	mov	r5, r0
	mov	r7, r1
	mla	r3, r3, r1, r4
	ldr	r0, [r3, #32]
	bl	MEM_Phy2Vir
	subs	r6, r0, #0
	beq	.L145
	ldrh	r3, [r5, #66]
	ldrh	r1, [r5, #64]
	ldrh	r0, [fp, #-38]
	sub	r3, r3, #1
	ldrh	r2, [fp, #-40]
	sub	r1, r1, #1
	bfi	r0, r3, #0, #9
	ldrb	ip, [r5, #44]	@ zero_extendqisi2
	bfi	r2, r1, #0, #9
	ldr	r1, [r4, #848]
	strh	r0, [fp, #-38]	@ movhi
	mov	r3, r0, lsr #8
	ldr	r0, [r4, #852]
	bfi	r3, ip, #1, #2
	rsb	r1, r1, r6
	ldrb	ip, [r5, #43]	@ zero_extendqisi2
	cmp	r1, r0
	strh	r2, [fp, #-40]	@ movhi
	bfi	r3, ip, #3, #2
	mov	r2, r2, lsr #8
	bfc	r3, #5, #3
	bfc	r2, #1, #7
	strb	r3, [fp, #-37]
	mov	r1, #81
	strb	r2, [fp, #-39]
	mov	r0, #5
	ldrcc	r3, [fp, #-40]
	movcs	r2, #1
	ldrcs	r3, [fp, #-40]
	strcs	r2, [r4, #844]
	strcc	r3, [r6]
	ldr	r2, .L148+4
	bl	dprint_normal
	ldr	r3, [r5, #108]
	ldrb	r0, [r5, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L146
.L144:
	and	r0, r0, #3
.L91:
	ldrb	r3, [r5, #29]	@ zero_extendqisi2
	mov	r1, #0
	ldrb	ip, [r5, #20]	@ zero_extendqisi2
	mov	r9, #1
	ldrb	r2, [r5, #23]	@ zero_extendqisi2
	and	r3, r3, #1
	bfi	r3, r0, #1, #2
	ldrb	r0, [r5, #22]	@ zero_extendqisi2
	bfi	r3, ip, #3, #2
	and	r2, r2, #1
	ldrb	ip, [r5, #28]	@ zero_extendqisi2
	bfi	r2, r0, #1, #1
	ldrb	r0, [r5, #25]	@ zero_extendqisi2
	ldrb	lr, [r5, #24]	@ zero_extendqisi2
	bfi	r3, ip, #5, #1
	ldrb	ip, [r5, #27]	@ zero_extendqisi2
	uxtb	r2, r2
	ldr	r8, [r4, #848]
	and	r0, r0, #63
	str	r1, [fp, #-40]
	bfi	r0, lr, #6, #1
	orr	r2, r2, #4
	ldr	lr, [r4, #852]
	strb	r2, [fp, #-38]
	bfi	r3, ip, #6, #1
	add	r2, r6, #4
	ldrb	ip, [r5, #26]	@ zero_extendqisi2
	rsb	r2, r8, r2
	add	r8, r5, #268
	cmp	r2, lr
	bfi	r3, ip, #7, #1
	ldrb	r2, [r5, #35]	@ zero_extendqisi2
	ldrh	ip, [fp, #-38]
	strb	r3, [fp, #-40]
	mov	r3, r0
	bfi	ip, r1, #3, #13
	bfi	r3, r2, #7, #1
	strh	ip, [fp, #-38]	@ movhi
	movcs	r1, #1
	strb	r3, [fp, #-39]
	mov	r0, #5
	ldrcc	r3, [fp, #-40]
	ldr	r2, .L148
	ldrcs	r3, [fp, #-40]
	strcc	r3, [r6, #4]
	strcs	r1, [r2, #844]
	mov	r1, #105
	ldr	r2, .L148+8
	bl	dprint_normal
	ldrb	r3, [r5, #33]	@ zero_extendqisi2
	ldrb	r1, [r5, #32]	@ zero_extendqisi2
	add	r2, r6, #8
	ldr	ip, [r4, #848]
	and	r3, r3, #1
	ldrb	r0, [r5, #31]	@ zero_extendqisi2
	bfi	r3, r1, #1, #1
	ldr	r1, [r4, #852]
	rsb	r2, ip, r2
	bfi	r3, r0, #2, #5
	mov	r0, #0
	cmp	r2, r1
	str	r0, [fp, #-40]
	ldrb	r2, [r5, #30]	@ zero_extendqisi2
	mov	r0, #5
	strb	r3, [fp, #-40]
	ldrh	r3, [fp, #-40]
	ldr	r1, .L148
	bfi	r3, r2, #7, #5
	strh	r3, [fp, #-40]	@ movhi
	ldrcc	r3, [fp, #-40]
	movcs	r2, #1
	ldrcs	r3, [fp, #-40]
	strcs	r2, [r1, #844]
	mov	r1, #115
	strcc	r3, [r6, #8]
	ldr	r2, .L148+12
	bl	dprint_normal
	ldrb	r3, [r5, #38]	@ zero_extendqisi2
	ldrb	r2, [r5, #39]	@ zero_extendqisi2
	mov	r1, #0
	ldrb	ip, [r5, #40]	@ zero_extendqisi2
	and	r3, r3, #1
	ldrb	r0, [r5, #41]	@ zero_extendqisi2
	bfi	r3, r2, #1, #2
	bfi	r3, ip, #3, #1
	ldrb	ip, [r5, #36]	@ zero_extendqisi2
	bfi	r3, r0, #4, #2
	str	r1, [fp, #-40]
	ldrb	r0, [r5, #37]	@ zero_extendqisi2
	bfi	r3, ip, #6, #1
	strb	r3, [fp, #-40]
	add	r2, r6, #12
	ldrh	r3, [fp, #-40]
	ldr	ip, [r4, #848]
	bfi	r3, r0, #7, #2
	ldr	r0, [r4, #852]
	rsb	r2, ip, r2
	strh	r3, [fp, #-40]	@ movhi
	cmp	r2, r0
	ldr	r2, .L148
	ldr	r3, [fp, #-40]
	mov	r0, #5
	bfi	r3, r1, #9, #23
	movcs	r1, #1
	str	r3, [fp, #-40]
	strcs	r1, [r2, #844]
	mov	r1, #128
	strcc	r3, [r6, #12]
	ldr	r2, .L148+16
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r6, #16
	rsb	r2, r3, r2
	ldr	r3, [r5, #112]
	cmp	r2, r1
	ldr	r2, .L148
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r6, #16]
	strcs	r1, [r2, #844]
	mov	r1, #135
	ldr	r2, .L148+20
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	r3, [r4, #848]
	add	r2, r6, #20
	ldr	r1, [r4, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r5, #116]
	cmp	r2, r1
	ldr	r2, .L148
	movcs	r1, #1
	strcc	r3, [r6, #20]
	strcs	r1, [r2, #844]
	mov	r1, #142
	ldr	r2, .L148+24
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	r3, [r4, #848]
	add	r2, r6, #24
	ldr	r1, [r4, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r5, #120]
	cmp	r2, r1
	ldr	r2, .L148
	movcs	r1, #1
	strcc	r3, [r6, #24]
	strcs	r1, [r2, #844]
	mov	r1, #149
	ldr	r2, .L148+28
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	r3, [r4, #848]
	add	r2, r6, #28
	ldr	r1, [r4, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r5, #136]
	cmp	r2, r1
	ldr	r2, .L148
	movcs	r1, #1
	strcc	r3, [r6, #28]
	strcs	r1, [r2, #844]
	mov	r1, #156
	ldr	r2, .L148+32
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	r1, [r4, #848]
	add	r3, r6, #32
	ldr	r2, [r4, #852]
	rsb	r3, r1, r3
	ldrb	r0, [r5, #42]	@ zero_extendqisi2
	cmp	r3, r2
	ldrb	r1, [r5, #34]	@ zero_extendqisi2
	mov	r3, #0
	mov	r2, #0
	str	r3, [fp, #-40]
	bfi	r2, r0, #0, #1
	bfi	r3, r1, #0, #2
	strb	r2, [fp, #-40]
	strb	r3, [fp, #-37]
	movcs	r1, #1
	ldrcc	r3, [fp, #-40]
	mov	r0, #5
	ldr	r2, .L148
	ldrcs	r3, [fp, #-40]
	strcc	r3, [r6, #32]
	strcs	r1, [r2, #844]
	mov	r1, #164
	ldr	r2, .L148+36
	bl	dprint_normal
	ldr	r2, [r4, #848]
	ldr	r1, [r4, #852]
	add	r3, r6, #36
	rsb	r3, r2, r3
	mov	r2, #1
	cmp	r3, r1
	strh	r2, [fp, #-40]	@ movhi
	mov	r3, #6
	ldr	r1, .L148
	strh	r3, [fp, #-38]	@ movhi
	mov	r0, #5
	ldrcc	r3, [fp, #-40]
	strcs	r2, [r1, #844]
	mov	r1, #172
	ldrcs	r3, [fp, #-40]
	strcc	r3, [r6, #36]
	ldr	r2, .L148+40
	bl	dprint_normal
	ldr	r2, [r4, #848]
	ldr	r1, [r4, #852]
	add	r3, r6, #40
	rsb	r3, r2, r3
	mov	r2, #25
	cmp	r3, r1
	strh	r2, [fp, #-40]	@ movhi
	mov	r3, #8
	ldr	r2, .L148
	strh	r3, [fp, #-38]	@ movhi
	movcs	r1, #1
	ldrcc	r3, [fp, #-40]
	mov	r0, #5
	strcs	r1, [r2, #844]
	mov	r1, #180
	ldrcs	r3, [fp, #-40]
	strcc	r3, [r6, #40]
	ldr	r2, .L148+44
	bl	dprint_normal
	ldr	r2, [r4, #848]
	ldr	r1, [r4, #852]
	add	r3, r6, #44
	rsb	r3, r2, r3
	mov	r2, #4
	cmp	r3, r1
	strh	r2, [fp, #-40]	@ movhi
	mov	r3, #3
	ldr	r2, .L148
	strh	r3, [fp, #-38]	@ movhi
	movcs	r1, #1
	ldrcc	r3, [fp, #-40]
	mov	r0, #5
	strcs	r1, [r2, #844]
	mov	r1, #188
	ldrcs	r3, [fp, #-40]
	strcc	r3, [r6, #44]
	ldr	r2, .L148+48
	bl	dprint_normal
	ldrb	r2, [r5, #45]	@ zero_extendqisi2
	ldrb	r0, [r5, #46]	@ zero_extendqisi2
	add	r1, r6, #48
	ldr	ip, [r4, #848]
	and	r2, r2, #1
	ldrb	r3, [r5, #47]	@ zero_extendqisi2
	bfi	r2, r0, #1, #1
	rsb	r1, ip, r1
	ldr	r0, [r4, #852]
	ldrb	ip, [r5, #49]	@ zero_extendqisi2
	and	r3, r3, #63
	cmp	r1, r0
	ldrb	lr, [r5, #48]	@ zero_extendqisi2
	ldrb	r0, [r5, #51]	@ zero_extendqisi2
	bfi	r3, ip, #6, #1
	ldrb	ip, [r5, #50]	@ zero_extendqisi2
	bfi	r2, lr, #2, #6
	mov	r1, #0
	str	r1, [fp, #-40]
	bfi	r3, ip, #7, #1
	bfi	r1, r0, #0, #1
	strb	r2, [fp, #-40]
	mov	r0, #5
	strb	r1, [fp, #-38]
	movcs	r1, #1
	strb	r3, [fp, #-39]
	ldr	r2, .L148
	ldrcc	r3, [fp, #-40]
	ldrcs	r3, [fp, #-40]
	strcs	r1, [r2, #844]
	mov	r1, #201
	strcc	r3, [r6, #48]
	ldr	r2, .L148+52
	bl	dprint_normal
	mov	r2, #1000
	mla	r2, r2, r7, r4
	ldr	r0, [r4, #848]
	ldr	r1, [r4, #852]
	add	r3, r6, #52
	rsb	r3, r0, r3
	ldr	r0, .L148
	cmp	r3, r1
	mov	r1, #208
	ldr	r3, [r2, #888]
	movcs	r2, #1
	strcs	r2, [r0, #844]
	mov	r0, #5
	ldr	r2, .L148+56
	strcc	r3, [r6, #52]
	str	r3, [fp, #-40]
	bl	dprint_normal
	mov	r2, #1000
	ldr	r0, [r4, #848]
	mla	r2, r2, r7, r4
	ldr	r1, [r4, #852]
	add	r3, r6, #56
	rsb	r3, r0, r3
	ldr	r0, .L148
	cmp	r3, r1
	mov	r1, #215
	ldr	r3, [r2, #892]
	movcs	r2, #1
	strcs	r2, [r0, #844]
	mov	r0, #5
	ldr	r2, .L148+60
	strcc	r3, [r6, #56]
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	r3, [r4, #848]
	add	r2, r6, #64
	ldr	r1, [r4, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r5, #132]
	cmp	r2, r1
	ldr	r2, .L148
	movcs	r1, #1
	strcc	r3, [r6, #64]
	strcs	r1, [r2, #844]
	mov	r1, #225
	ldr	r2, .L148+64
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	ip, [r4, #848]
	add	r1, r5, #140
	ldr	r0, [r4, #852]
	add	r2, r6, #68
.L125:
	rsb	r3, ip, r2
	ldr	lr, [r1, #4]!
	cmp	r3, r0
	strcs	r9, [r4, #844]
	add	r2, r2, #4
	strcc	lr, [r2, #-4]
	ldrcc	ip, [r4, #848]
	ldrcc	r0, [r4, #852]
	cmp	r1, r8
	bne	.L125
	add	r2, r6, #196
	ldr	r3, [r5, #128]
	rsb	ip, ip, r2
	mov	r1, #240
	cmp	ip, r0
	mov	r0, #5
	strcc	r3, [r6, #196]
	movcs	r2, #1
	strcs	r2, [r4, #844]
	ldr	r2, .L148+68
	str	r3, [fp, #-40]
	bl	dprint_normal
	mov	r2, #1000
	ldr	r0, [r4, #848]
	mla	r2, r2, r7, r4
	ldr	r1, [r4, #852]
	add	r3, r6, #200
	rsb	r3, r0, r3
	ldr	r0, .L148
	cmp	r3, r1
	mov	r1, #247
	ldr	r3, [r2, #896]
	movcs	r2, #1
	strcs	r2, [r0, #844]
	mov	r0, #5
	ldr	r2, .L148+72
	strcc	r3, [r6, #200]
	str	r3, [fp, #-40]
	bl	dprint_normal
	mov	r2, #1000
	ldr	r0, [r4, #848]
	mla	r2, r2, r7, r4
	ldr	r1, [r4, #852]
	add	r3, r6, #228
	rsb	r3, r0, r3
	ldr	r0, .L148
	cmp	r3, r1
	mov	r1, #255
	ldr	r3, [r2, #884]
	movcs	r2, #1
	strcs	r2, [r0, #844]
	mov	r0, #5
	ldr	r2, .L148+76
	strcc	r3, [r6, #228]
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	r2, [r4, #848]
	add	r3, r6, #232
	ldr	r1, [r4, #852]
	mov	r0, #5
	rsb	r3, r2, r3
	mvn	r2, #0
	cmp	r3, r1
	strh	r2, [fp, #-40]	@ movhi
	strh	r2, [fp, #-38]	@ movhi
	ldr	r2, .L148
	movcs	r1, #1
	ldrcc	r3, [fp, #-40]
	ldrcs	r3, [fp, #-40]
	strcs	r1, [r2, #844]
	movw	r1, #263
	strcc	r3, [r6, #232]
	ldr	r2, .L148+80
	bl	dprint_normal
	ldr	r2, [r4, #848]
	ldr	r1, [r4, #852]
	add	r3, r6, #236
	rsb	r3, r2, r3
	mvn	r2, #0
	cmp	r3, r1
	strh	r2, [fp, #-40]	@ movhi
	mov	r3, #1
	ldr	r2, .L148
	strh	r3, [fp, #-38]	@ movhi
	movw	r1, #271
	ldrcc	r3, [fp, #-40]
	mov	r0, #5
	strcs	r3, [r2, #844]
	ldrcs	r3, [fp, #-40]
	strcc	r3, [r6, #236]
	ldr	r2, .L148+84
	bl	dprint_normal
	ldr	r2, [r4, #848]
	ldr	r1, [r4, #852]
	add	r3, r6, #240
	rsb	r3, r2, r3
	mov	r2, #7
	cmp	r3, r1
	strh	r2, [fp, #-40]	@ movhi
	mov	r3, #65
	ldr	r2, .L148
	strh	r3, [fp, #-38]	@ movhi
	movcs	r1, #1
	ldrcc	r3, [fp, #-40]
	mov	r0, #5
	strcs	r1, [r2, #844]
	movw	r1, #279
	ldrcs	r3, [fp, #-40]
	strcc	r3, [r6, #240]
	ldr	r2, .L148+88
	bl	dprint_normal
	ldr	r2, [r4, #848]
	ldr	r1, [r4, #852]
	add	r3, r6, #244
	rsb	r3, r2, r3
	mov	r2, #0
	cmp	r3, r1
	str	r2, [fp, #-40]
	mvn	r3, #61440
	ldr	r2, .L148
	strh	r3, [fp, #-40]	@ movhi
	movcs	r1, #1
	ldrcc	r3, [fp, #-40]
	mov	r0, #5
	strcs	r1, [r2, #844]
	movw	r1, #286
	ldrcs	r3, [fp, #-40]
	strcc	r3, [r6, #244]
	ldr	r2, .L148+92
	bl	dprint_normal
	mov	r3, #1000
	mla	r3, r3, r7, r4
	ldr	r0, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r6, #252
	rsb	r2, r0, r2
	ldr	r0, .L148
	cmp	r2, r1
	movw	r1, #293
	ldr	r3, [r3, #32]
	movcs	r2, #1
	strcs	r2, [r0, #844]
	mov	r0, #5
	add	r3, r3, #320
	ldr	r2, .L148+96
	strcc	r3, [r6, #252]
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldrb	r3, [r5, #45]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L147
.L142:
	mov	r0, r5
	mov	r1, r7
	bl	AVSHAL_WriteSliceMsg
	mov	r0, #0
.L87:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L146:
	cmp	r0, #1
	bne	.L144
	mov	r0, #3
	strb	r0, [r5, #21]
	b	.L91
.L147:
	add	r2, r6, #256
	mov	r1, #16
	mov	r0, r5
	bl	AVSHAL_StartDec_ConfigWQMatrix.part.0
	b	.L142
.L145:
	ldr	ip, .L148+100
	mov	r1, #70
	ldr	r3, .L148+104
	ldr	r2, .L148+108
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L87
.L149:
	.align	2
.L148:
	.word	g_HwMem
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC1
	.word	.LANCHOR0
	.word	.LC0
	UNWIND(.fnend)
	.size	AVSHAL_StartDec, .-AVSHAL_StartDec
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.12978, %object
	.size	__func__.12978, 16
__func__.12978:
	.ascii	"AVSHAL_StartDec\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"%s: %s\012\000" )
.LC1:
	ASCII(.ascii	"can not map down msg virtual address!\000" )
	.space	2
.LC2:
	ASCII(.ascii	"D0 = 0x%x\012\000" )
	.space	1
.LC3:
	ASCII(.ascii	"D1 = 0x%x\012\000" )
	.space	1
.LC4:
	ASCII(.ascii	"D2 = 0x%x\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"D3 = 0x%x\012\000" )
	.space	1
.LC6:
	ASCII(.ascii	"D4 = 0x%x\012\000" )
	.space	1
.LC7:
	ASCII(.ascii	"D5 = 0x%x\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"D6 = 0x%x\012\000" )
	.space	1
.LC9:
	ASCII(.ascii	"D7 = 0x%x\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"D8 = 0x%x\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"D9 = 0x%x\012\000" )
	.space	1
.LC12:
	ASCII(.ascii	"D10 = 0x%x\012\000" )
.LC13:
	ASCII(.ascii	"D11 = 0x%x\012\000" )
.LC14:
	ASCII(.ascii	"D12 = 0x%x\012\000" )
.LC15:
	ASCII(.ascii	"D13 = 0x%x\012\000" )
.LC16:
	ASCII(.ascii	"D14 = 0x%x\012\000" )
.LC17:
	ASCII(.ascii	"D16 = 0x%x\012\000" )
.LC18:
	ASCII(.ascii	"D49 = 0x%x\012\000" )
.LC19:
	ASCII(.ascii	"D50 = 0x%x\012\000" )
.LC20:
	ASCII(.ascii	"D51 = 0x%x\012\000" )
.LC21:
	ASCII(.ascii	"D58 = 0x%x\012\000" )
.LC22:
	ASCII(.ascii	"D59 = 0x%x\012\000" )
.LC23:
	ASCII(.ascii	"D60 = 0x%x\012\000" )
.LC24:
	ASCII(.ascii	"D61 = 0x%x\012\000" )
.LC25:
	ASCII(.ascii	"D63 = 0x%x\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
