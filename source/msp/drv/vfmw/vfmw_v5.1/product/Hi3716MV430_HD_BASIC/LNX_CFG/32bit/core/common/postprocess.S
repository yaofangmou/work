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
	.file	"postprocess.c"
	.text
	.align	2
	.global	PostPro_BubbleSort
	.type	PostPro_BubbleSort, %function
PostPro_BubbleSort:
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
	ldr	r8, [r0, #12]
	cmp	r8, #1
	bls	.L14
	mov	r7, #1
.L6:
	mov	r4, #0
	rsb	lr, r7, r8
	mov	r2, r4
	mov	r3, r0
	b	.L7
.L5:
	ldrh	r1, [r3, #16]
	ldrh	ip, [r3, #20]
	cmp	r1, ip
	bls	.L4
	ldrh	r6, [r3, #18]
	mov	r4, #1
	ldrh	r5, [r3, #22]
	strh	ip, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	strh	r6, [r3, #22]	@ movhi
	strh	r5, [r3, #18]	@ movhi
.L4:
	add	r3, r3, #4
.L7:
	cmp	r2, lr
	add	r2, r2, #1
	bne	.L5
	cmp	r4, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	add	r7, r7, #1
	cmp	r8, r7
	movls	r4, #0
	andhi	r4, r4, #1
	cmp	r4, #0
	bne	.L6
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L14:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	PostPro_BubbleSort, .-PostPro_BubbleSort
	.align	2
	.global	PostPro_GetMp24MbGroup
	.type	PostPro_GetMp24MbGroup, %function
PostPro_GetMp24MbGroup:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r3, [r1, #12]
	sub	r3, r3, #1
	cmp	r3, #199
	ldrhi	r2, .L42
	movhi	r3, #61
	bhi	.L35
	ldr	r2, [r0, #16]
	mov	r3, #0
	ldr	r5, [r0, #20]
	str	r3, [r0, #32]
	str	r3, [r0, #44]
	mul	r5, r5, r2
	ldr	r3, [r1, #12]
	cmp	r3, #0
	add	lr, r1, r3, lsl #2
	uxth	r2, r5
	strh	r2, [lr, #16]	@ movhi
	strh	r2, [lr, #18]	@ movhi
	bne	.L36
.L18:
	mvn	r7, #0
	mov	r3, r1
	mov	r6, r7
	mov	ip, #0
	add	r8, r5, r7
	b	.L27
.L40:
	cmp	r2, lr
	movle	r4, #0
	movgt	r4, #1
	cmp	r2, r6
	orrlt	r4, r4, #1
	cmp	r4, #0
	bne	.L19
	cmp	r2, r7
	movlt	r7, r6
	add	r9, r7, #1
	cmp	r9, r2
	beq	.L23
	add	r6, r6, r6, lsr #31
	sub	r10, r2, #1
	cmp	r6, r10
	bge	.L23
	ldr	r9, [r0, #32]
	cmp	r9, #199
	bgt	.L37
	add	r4, r0, r9, lsl #3
	sub	r7, r7, #100
	cmp	r7, r6
	add	r9, r9, #1
	str	r6, [r4, #56]
	str	r10, [r4, #60]
	strhi	r7, [r4, #56]
	str	r9, [r0, #32]
.L23:
	ldr	r4, [r1, #12]
	sub	r6, r4, #1
	cmp	r6, ip
	beq	.L38
.L29:
	add	ip, ip, #1
	mov	r7, lr
	cmp	ip, r4
	mov	r6, r2
	add	r3, r3, #4
	bhi	.L39
.L27:
	ldrh	r2, [r3, #16]
	ldrh	lr, [r3, #18]
	cmp	lr, r5
	cmple	r2, r5
	ble	.L40
.L19:
	ldr	r4, [r1, #12]
	add	ip, ip, #1
	add	r3, r3, #4
	cmp	ip, r4
	bls	.L27
.L39:
	mov	r3, #0
.L34:
	mov	r0, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L38:
	add	r6, r1, ip, lsl #2
	ldrh	r6, [r6, #18]
	cmp	r6, r8
	bge	.L29
	ldr	r3, [r0, #32]
	cmp	r3, #199
	bgt	.L41
	add	r1, r0, r3, lsl #3
	add	r2, r3, #1
	mov	r3, #0
	str	r6, [r1, #56]
	str	r8, [r1, #60]
	str	r2, [r0, #32]
	b	.L34
.L36:
	sub	r3, r3, #1
	sub	ip, r5, #10
	add	r3, r1, r3, lsl #2
	ldrh	lr, [r3, #18]
	cmp	lr, ip
	subge	r2, r2, #1
	strgeh	r2, [r3, #18]	@ movhi
	b	.L18
.L41:
	ldr	r2, .L42+4
	mov	r3, #118
.L35:
	mov	r1, r3
	str	r3, [sp]
	str	r2, [sp, #4]
	mov	r0, #0
	ldr	r3, .L42+8
	ldr	r2, .L42+12
	bl	dprint_normal
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L37:
	ldr	r2, .L42+4
	mov	r1, #101
	ldr	r3, .L42+8
	mov	r0, r4
	str	r1, [sp]
	str	r2, [sp, #4]
	ldr	r2, .L42+12
	bl	dprint_normal
	mov	r3, #1
	b	.L34
.L43:
	.align	2
.L42:
	.word	.LC1
	.word	.LC2
	.word	.LANCHOR0
	.word	.LC0
	UNWIND(.fnend)
	.size	PostPro_GetMp24MbGroup, .-PostPro_GetMp24MbGroup
	.global	__aeabi_uidivmod
	.global	__aeabi_uidiv
	.align	2
	.global	PostPro_GetH264MbOfMBAFF
	.type	PostPro_GetH264MbOfMBAFF, %function
PostPro_GetH264MbOfMBAFF:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 832
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #836)
	sub	sp, sp, #836
	ldr	r2, [r1, #12]
	mov	r3, r1
	str	r1, [fp, #-856]
	cmp	r2, #0
	ldr	r1, [r0, #16]
	mov	lr, r2
	str	r2, [fp, #-864]
	ldr	r2, [r0, #20]
	mov	r8, r0
	str	r1, [fp, #-868]
	str	r2, [fp, #-872]
	beq	.L58
	sub	r7, fp, #844
	mov	r2, r3
	mov	r1, #0
	mov	r3, r7
.L46:
	ldrh	ip, [r2, #16]
	add	r1, r1, #1
	ldrh	r0, [r2, #18]
	cmp	r1, lr
	add	r2, r2, #4
	add	r3, r3, #4
	strh	ip, [r3, #-4]	@ movhi
	strh	r0, [r3, #-2]	@ movhi
	bne	.L46
	sub	r3, fp, #844
	mov	r10, #0
	add	r6, r3, #2
	str	r10, [fp, #-852]
	ldr	r4, [fp, #-868]
	b	.L53
.L68:
	ldrh	r9, [r6, #-2]
	mov	r1, r4
	mov	r0, r9
	bl	__aeabi_uidivmod
	ldrh	r3, [r7, #2]
	cmp	r1, #1
	mov	r5, r1
	bls	.L48
	mov	r1, r4
	mov	r0, r3
	str	r3, [fp, #-848]
	bl	__aeabi_uidivmod
	mov	r2, r1
	sub	r1, r4, #2
	cmp	r1, r2
	bls	.L49
	mov	r0, r9
	mov	r1, r4
	str	r2, [fp, #-860]
	bl	__aeabi_uidiv
	mov	r1, r4
	mov	r5, r5, lsr #1
	mov	r9, r0
	ldr	r0, [fp, #-848]
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-860]
	mov	r2, r2, lsr #1
	cmp	r9, r0
	beq	.L50
	add	r1, r10, #3
	cmp	r1, #199
	bhi	.L64
	uxth	r4, r4
	ldr	r3, [fp, #-856]
	uxth	r2, r2
	smulbb	r9, r9, r4
	add	ip, r3, r10, lsl #2
	smulbb	r0, r0, r4
	mov	r10, r1
	uxth	r9, r9
	add	r5, r9, r5
	uxth	r0, r0
	uxth	r5, r5
	strh	r5, [ip, #16]	@ movhi
	ldr	r1, [r8, #16]
	add	r4, r2, r0
	sub	r1, r1, #1
	add	r9, r9, r1
	strh	r9, [ip, #18]	@ movhi
	ldr	r1, [r8, #16]
	strh	r4, [ip, #22]	@ movhi
	add	r5, r5, r1
	strh	r5, [ip, #20]	@ movhi
	ldr	r1, [r8, #16]
	add	r0, r0, r1
	uxth	r0, r0
	strh	r0, [ip, #24]	@ movhi
	add	r2, r0, r2
	strh	r2, [ip, #26]	@ movhi
.L51:
	ldr	r3, [fp, #-852]
	add	r7, r7, #4
	ldr	r2, [fp, #-864]
	add	r6, r6, #4
	add	r3, r3, #1
	str	r3, [fp, #-852]
	cmp	r3, r2
	beq	.L57
	ldr	r4, [r8, #16]
.L53:
	ldrh	r2, [r6, #-2]
	movs	r4, r4, asl #1
	bic	r2, r2, #1
	strh	r2, [r6, #-2]	@ movhi
	ldrh	r2, [r7, #2]
	orr	r2, r2, #1
	strh	r2, [r7, #2]	@ movhi
	bne	.L68
.L57:
	ldr	r3, [fp, #-856]
	ldr	r0, [fp, #-856]
	str	r10, [r3, #12]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	PostPro_BubbleSort
.L48:
	mov	r0, r3
	mov	r1, r4
	str	r3, [fp, #-848]
	bl	__aeabi_uidivmod
	sub	r2, r4, #2
	ldr	r3, [fp, #-848]
	cmp	r2, r1
	mov	r5, r1
	bls	.L52
	add	r2, r10, #2
	cmp	r2, #199
	bls	.L69
.L64:
	ldr	r1, [fp, #-868]
	mov	r3, #1
	ldr	r2, [fp, #-872]
	ldr	r0, [fp, #-856]
	mul	r2, r2, r1
	ldr	r1, [fp, #-856]
	str	r3, [r1, #12]
	mov	r3, #0
	strh	r3, [r1, #16]	@ movhi
	sub	r3, r2, #1
	strh	r3, [r1, #18]	@ movhi
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	PostPro_BubbleSort
.L49:
	add	r2, r10, #2
	cmp	r2, #199
	bhi	.L64
	mov	r1, r4
	mov	r0, r9
	str	r2, [fp, #-860]
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-856]
	ldr	r2, [fp, #-860]
	add	r1, r3, r10, lsl #2
	ldr	r3, [fp, #-848]
	mov	r10, r2
	smulbb	r0, r0, r4
	uxth	r0, r0
	add	r5, r0, r5, lsr #1
	uxth	r5, r5
	strh	r5, [r1, #16]	@ movhi
	ldr	r4, [r8, #16]
	sub	r4, r4, #1
	add	r0, r0, r4
	strh	r0, [r1, #18]	@ movhi
	ldr	r2, [r8, #16]
	strh	r3, [r1, #22]	@ movhi
	add	r5, r5, r2
	strh	r5, [r1, #20]	@ movhi
	b	.L51
.L52:
	add	r2, r10, #1
	cmp	r2, #199
	bhi	.L64
	ldr	r1, [fp, #-856]
	add	r0, r1, r10, lsl #2
	mov	r10, r2
	strh	r9, [r0, #16]	@ movhi
	strh	r3, [r0, #18]	@ movhi
	b	.L51
.L50:
	add	lr, r10, #2
	cmp	lr, #199
	bhi	.L64
	smulbb	r4, r9, r4
	ldr	r3, [fp, #-856]
	add	ip, r3, r10, lsl #2
	mov	r10, lr
	uxth	r4, r4
	add	r5, r4, r5
	add	r2, r4, r2
	uxth	r5, r5
	uxth	r2, r2
	strh	r5, [ip, #16]	@ movhi
	strh	r2, [ip, #18]	@ movhi
	ldr	r0, [r8, #16]
	add	r5, r5, r0
	strh	r5, [ip, #20]	@ movhi
	ldr	r0, [r8, #16]
	add	r2, r2, r0
	strh	r2, [ip, #22]	@ movhi
	b	.L51
.L69:
	str	r2, [fp, #-860]
	mov	r0, r3
	ldr	r2, [fp, #-856]
	mov	r1, r4
	ubfx	r5, r5, #1, #16
	add	r2, r2, r10, lsl #2
	str	r2, [fp, #-848]
	strh	r9, [r2, #16]	@ movhi
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-860]
	ldr	r3, [fp, #-848]
	ldr	r1, [fp, #-856]
	add	r1, r1, r10, lsl #2
	mov	r10, r2
	smulbb	r0, r0, r4
	uxth	r0, r0
	add	r2, r5, r0
	strh	r2, [r3, #18]	@ movhi
	ldr	r2, [r8, #16]
	add	r2, r0, r2
	uxth	r2, r2
	strh	r2, [r3, #20]	@ movhi
	add	r5, r2, r5
	strh	r5, [r1, #22]	@ movhi
	b	.L51
.L58:
	ldr	r10, [fp, #-864]
	b	.L57
	UNWIND(.fnend)
	.size	PostPro_GetH264MbOfMBAFF, .-PostPro_GetH264MbOfMBAFF
	.align	2
	.global	PostPro_GetH264MbGroup
	.type	PostPro_GetH264MbGroup, %function
PostPro_GetH264MbGroup:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r1, #12]
	mov	r5, r1
	mov	r6, r0
	sub	ip, r3, #1
	cmp	ip, #199
	bhi	.L89
	ldr	r3, [r0, #16]
	cmp	r2, #0
	ldr	r4, [r0, #20]
	mul	r4, r4, r3
	bne	.L90
.L73:
	mov	r0, #0
	str	r0, [r6, #32]
	str	r0, [r6, #44]
	mvn	lr, #0
	ldr	r3, [r5, #12]
	uxth	r1, r4
	add	r8, r4, lr
	mov	r7, lr
	add	ip, r5, r3, lsl #2
	mov	r3, r5
	mov	r2, ip
	strh	r1, [ip, #18]	@ movhi
	strh	r1, [ip, #16]	@ movhi
	b	.L81
.L94:
	cmp	r1, lr
	movlt	lr, r7
	add	r2, lr, #1
	cmp	r1, r2
	ble	.L76
	ldr	r2, [r6, #32]
	cmp	r2, #199
	bgt	.L91
	add	r9, r6, r2, lsl #3
	add	r7, r7, r7, lsr #31
	sub	lr, lr, #100
	sub	r10, r1, #1
	str	r7, [r9, #56]
	cmp	lr, r7
	str	r10, [r9, #60]
	add	r2, r2, #1
	strhi	lr, [r9, #56]
	str	r2, [r6, #32]
.L76:
	ldr	r2, [r5, #12]
	sub	lr, r2, #1
	cmp	lr, r0
	beq	.L92
.L83:
	add	r0, r0, #1
	mov	lr, ip
	cmp	r0, r2
	mov	r7, r1
	add	r3, r3, #4
	bhi	.L93
.L81:
	ldrh	r1, [r3, #16]
	ldrh	ip, [r3, #18]
	cmp	r1, r4
	cmple	ip, r4
	movgt	r2, #1
	movle	r2, #0
	cmp	r1, ip
	orrgt	r2, r2, #1
	cmp	r2, #0
	beq	.L94
	ldr	r2, [r5, #12]
	add	r0, r0, #1
	add	r3, r3, #4
	cmp	r0, r2
	bls	.L81
.L93:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L92:
	add	lr, r5, r0, lsl #2
	ldrh	lr, [lr, #18]
	cmp	lr, r8
	bge	.L83
	ldr	r3, [r6, #32]
	cmp	r3, #199
	bgt	.L95
	add	r2, r6, r3, lsl #3
	mov	r0, #0
	add	r3, r3, #1
	str	lr, [r2, #56]
	str	r8, [r2, #60]
	str	r3, [r6, #32]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L90:
	bl	PostPro_GetH264MbOfMBAFF
	b	.L73
.L89:
	ldr	r2, .L96
	movw	r1, #303
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #1
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L91:
	movw	r3, #351
.L88:
	ldr	r2, .L96+4
	mov	r1, r3
	mov	r0, #20
	bl	dprint_normal
	mov	r0, #1
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L95:
	mov	r3, #372
	b	.L88
.L97:
	.align	2
.L96:
	.word	.LC3
	.word	.LC4
	UNWIND(.fnend)
	.size	PostPro_GetH264MbGroup, .-PostPro_GetH264MbGroup
	.align	2
	.global	PostPro_GetH264RepairParam
	.type	PostPro_GetH264RepairParam, %function
PostPro_GetH264RepairParam:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r1, #284]
	mov	r4, r1
	mov	r5, r0
	mov	r1, r2
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #300]
	str	r3, [r0, #8]
	ldr	r3, [r4, #800]
	ldr	ip, [r3, #1640]
	add	r3, r4, ip, lsl #2
	ldr	r3, [r3, #300]
	str	r3, [r0, #12]
	ldr	r3, [r4, #20]
	str	r3, [r0, #16]
	ldr	r3, [r4, #12]
	str	r3, [r0, #20]
	ldrb	r3, [r4]	@ zero_extendqisi2
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r0, #24]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r0, #28]
	ldr	lr, [r4, #792]
	cmp	lr, #0
	beq	.L99
	ldr	r3, [r4, #868]
	cmp	r3, ip
	addne	r2, r4, #868
	movne	r3, #0
	bne	.L102
	b	.L136
.L103:
	ldr	r0, [r2, #4]!
	cmp	r0, ip
	beq	.L100
.L102:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L103
.L99:
	ldr	r2, [r4, #24]
	ldrsb	r3, [r4, #2]
	cmp	r2, #0
	ldrneb	r2, [r4]	@ zero_extendqisi2
	clzne	r2, r2
	movne	r2, r2, lsr #5
	cmp	r3, #0
	streq	r3, [r1, #12]
	bne	.L137
	ldr	r0, [r5, #8]
	ldr	r3, [r5, #12]
	cmp	r0, r3
	beq	.L138
.L107:
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L116
	cmp	r3, #1
	beq	.L134
	cmp	r3, #2
	beq	.L134
	cmp	r3, #3
	bne	.L113
.L116:
	mov	r3, #0
	str	r3, [r5, #40]
.L113:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	mov	r1, #4
	mov	r2, #8
	str	r1, [r5, #48]
	strb	r2, [r5, #1]
	strb	r3, [r5]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L134:
	str	r3, [r5, #40]
	b	.L113
.L136:
	mov	r3, #0
.L100:
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #804]
	str	r3, [r5, #36]
	b	.L99
.L137:
	mov	r0, r5
	bl	PostPro_GetH264MbGroup
	ldr	r0, [r5, #8]
	ldr	r3, [r5, #12]
	cmp	r0, r3
	bne	.L107
.L138:
	ldr	ip, [r4, #436]
	cmp	ip, #0
	beq	.L107
	ldr	r2, [r4, #300]
	cmp	r0, r2
	addeq	r1, r4, #300
	moveq	r3, #0
	bne	.L108
.L110:
	add	r3, r3, #1
	cmp	r3, ip
	beq	.L107
	ldr	r2, [r1, #4]!
	cmp	r0, r2
	beq	.L110
.L108:
	str	r2, [r5, #12]
	b	.L107
	UNWIND(.fnend)
	.size	PostPro_GetH264RepairParam, .-PostPro_GetH264RepairParam
	.align	2
	.global	PostPro_GetHevcMbGroupOfTile
	.type	PostPro_GetHevcMbGroupOfTile, %function
PostPro_GetHevcMbGroupOfTile:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r2, .L161
	mov	ip, r3, asl #6
	sub	ip, ip, r3, asl #4
	mov	r6, #0
	add	r2, r2, ip
	str	r6, [r0, #32]
	str	r6, [r0, #44]
	mov	r7, r1
	ldr	r1, [r2, #8]
	mov	r5, r0
	ldr	r2, .L161+4
	ldr	r3, [r0, #16]
	ldr	r4, [r0, #20]
	ldr	r0, [r2, r1, asl #2]
	add	r0, r0, #207872
	add	r0, r0, #488
	mul	r4, r4, r3
	bl	HEVC_CalcTileMap
	ldr	r9, [r7, #12]
	cmp	r9, r6
	beq	.L140
	mov	lr, r6
	ldr	r8, .L161+8
	ldr	r6, .L161+12
	mov	ip, r7
	mov	r1, #1
.L143:
	ldrh	r2, [ip, #16]
	ldrh	r0, [ip, #18]
	cmp	r2, r0
	mov	r3, r2
	bls	.L142
	b	.L141
.L160:
	ldrh	r2, [ip, #16]
.L142:
	cmp	r4, r2
	blt	.L144
	cmp	r4, r0
	ldrge	r2, [r6, r3, asl #2]
	strgeb	r1, [r8, r2]
	ldrgeh	r0, [ip, #18]
.L144:
	add	r3, r3, #1
	cmp	r0, r3
	bcs	.L160
	ldr	r9, [r7, #12]
.L141:
	add	lr, lr, #1
	add	ip, ip, #4
	cmp	r9, lr
	bhi	.L143
.L140:
	ldr	lr, .L161+8
	mov	ip, #0
.L150:
	cmp	ip, r4
	bcs	.L151
	ldrb	r3, [lr, ip]	@ zero_extendqisi2
	cmp	r3, #1
	addeq	ip, ip, #1
	ldreq	r0, [r5, #32]
	beq	.L146
	add	r1, ip, lr
	mov	r2, ip
	b	.L148
.L147:
	ldrb	r0, [r1, #1]!	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L149
	mov	r2, r3
.L148:
	add	r3, r2, #1
	cmp	r4, r3
	bhi	.L147
.L149:
	ldr	r1, [r5, #32]
	add	r0, r1, #1
	add	r1, r5, r1, lsl #3
	str	ip, [r1, #56]
	mov	ip, r3
	str	r2, [r1, #60]
	str	r0, [r5, #32]
.L146:
	cmp	r0, #199
	ble	.L150
	ldr	r2, .L161+16
	movw	r1, #595
	mov	r0, #1
	sub	r4, r4, #1
	bl	dprint_normal
	mov	r3, #0
	str	r4, [r5, #60]
	str	r3, [r5, #56]
	mov	r3, #1
	str	r3, [r5, #32]
.L151:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L162:
	.align	2
.L161:
	.word	g_VdmDrvParam
	.word	s_pstVfmwChan
	.word	g_IsDeced
	.word	g_TsToRsMap
	.word	.LC5
	UNWIND(.fnend)
	.size	PostPro_GetHevcMbGroupOfTile, .-PostPro_GetHevcMbGroupOfTile
	.align	2
	.global	PostPro_GetHevcMbGroupOfNoTile
	.type	PostPro_GetHevcMbGroupOfNoTile, %function
PostPro_GetHevcMbGroupOfNoTile:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r2, .L181
	mov	ip, r3, asl #6
	mov	r7, #0
	sub	ip, ip, r3, asl #4
	str	r7, [r0, #32]
	add	r2, r2, ip
	str	r7, [r0, #44]
	mov	r6, r1
	ldr	r3, [r0, #16]
	ldr	r1, [r2, #8]
	mov	r5, r0
	ldr	r2, .L181+4
	ldr	r4, [r0, #20]
	ldr	r0, [r2, r1, asl #2]
	mul	r4, r4, r3
	add	r0, r0, #207872
	add	r0, r0, #488
	bl	HEVC_CalcTileMap
	ldr	r2, [r6, #12]
	mvn	r1, #0
	mov	ip, r7
	mov	r3, r6
	add	r8, r4, r1
	add	lr, r6, r2, lsl #2
	uxth	r0, r4
	mov	r7, r1
	mov	r2, lr
	strh	r0, [lr, #18]	@ movhi
	strh	r0, [lr, #16]	@ movhi
	b	.L172
.L179:
	cmp	r0, r1
	movlt	r1, r7
	add	r2, r1, #1
	cmp	r0, r2
	ble	.L166
	ldr	r2, [r5, #32]
	cmp	r2, #199
	bgt	.L176
	add	r9, r5, r2, lsl #3
	add	r7, r7, r7, lsr #31
	sub	r1, r1, #100
	sub	r10, r0, #1
	str	r7, [r9, #56]
	cmp	r1, r7
	str	r10, [r9, #60]
	add	r2, r2, #1
	strhi	r1, [r9, #56]
	str	r2, [r5, #32]
.L166:
	ldr	r2, [r6, #12]
	sub	r1, r2, #1
	cmp	ip, r1
	beq	.L177
.L174:
	add	ip, ip, #1
	mov	r1, lr
	cmp	ip, r2
	mov	r7, r0
	add	r3, r3, #4
	bhi	.L178
.L172:
	ldrh	r0, [r3, #16]
	ldrh	lr, [r3, #18]
	cmp	r0, r4
	cmple	lr, r4
	movgt	r2, #1
	movle	r2, #0
	cmp	r0, lr
	orrgt	r2, r2, #1
	cmp	r2, #0
	beq	.L179
	ldr	r2, [r6, #12]
	add	ip, ip, #1
	add	r3, r3, #4
	cmp	ip, r2
	bls	.L172
.L178:
	mov	r0, #0
.L168:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L177:
	ldrh	r1, [r3, #18]
	cmp	r1, r8
	bge	.L174
	ldr	r3, [r5, #32]
	cmp	r3, #199
	bgt	.L180
	add	r2, r5, r3, lsl #3
	mov	r0, #0
	add	r3, r3, #1
	str	r1, [r2, #56]
	str	r8, [r2, #60]
	str	r3, [r5, #32]
	b	.L168
.L176:
	str	r2, [sp]
	movw	r1, #643
	ldr	r3, .L181+8
	mov	r0, #1
	ldr	r2, .L181+12
	bl	dprint_normal
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L180:
	str	r3, [sp]
	mov	r1, #664
	ldr	r3, .L181+8
	mov	r0, #1
	ldr	r2, .L181+16
	bl	dprint_normal
	mov	r0, #1
	b	.L168
.L182:
	.align	2
.L181:
	.word	g_VdmDrvParam
	.word	s_pstVfmwChan
	.word	.LANCHOR0+24
	.word	.LC6
	.word	.LC7
	UNWIND(.fnend)
	.size	PostPro_GetHevcMbGroupOfNoTile, .-PostPro_GetHevcMbGroupOfNoTile
	.align	2
	.global	PostPro_GetHevcMbGroup
	.type	PostPro_GetHevcMbGroup, %function
PostPro_GetHevcMbGroup:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	ip, [r1, #12]
	mov	r4, r0
	sub	lr, ip, #1
	cmp	lr, #199
	bhi	.L188
	ldr	ip, [r0, #52]
	cmp	ip, #0
	bne	.L189
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	PostPro_GetHevcMbGroupOfNoTile
.L189:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	PostPro_GetHevcMbGroupOfTile
.L188:
	mov	r3, ip
	ldr	r2, .L190
	movw	r1, #687
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L191:
	.align	2
.L190:
	.word	.LC3
	UNWIND(.fnend)
	.size	PostPro_GetHevcMbGroup, .-PostPro_GetHevcMbGroup
	.align	2
	.global	PostPro_GetHEVCRepairParam
	.type	PostPro_GetHEVCRepairParam, %function
PostPro_GetHEVCRepairParam:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r4, r1
	ldr	r1, [r1, #1284]
	mov	r6, #1
	mov	r5, r0
	add	r1, r1, #332
	add	r1, r1, #2
	ldr	r1, [r4, r1, asl #2]
	str	r1, [r0, #8]
	ldr	r1, [r4, #2364]
	ldr	r1, [r1, #372]
	add	r1, r1, #332
	add	r1, r1, #2
	ldr	r1, [r4, r1, asl #2]
	str	r1, [r0, #12]
	ldr	r1, [r4, #72]
	mov	ip, r6, asl r1
	str	r1, [r0, #48]
	ldrb	lr, [r4]	@ zero_extendqisi2
	strb	lr, [r0]
	ldr	lr, [r4, #92]
	ldr	r7, [r4, #96]
	cmp	lr, r7
	movcc	lr, r7
	strb	lr, [r0, #1]
	ldr	lr, [r4, #192]
	sub	lr, lr, #1
	add	lr, lr, ip
	mov	lr, lr, lsr r1
	str	lr, [r0, #16]
	ldr	lr, [r4, #188]
	sub	lr, lr, #1
	add	ip, lr, ip
	mov	ip, ip, lsr r1
	str	ip, [r0, #20]
	ldrb	r1, [r4, #221]	@ zero_extendqisi2
	str	r6, [r0, #24]
	str	r1, [r0, #52]
	ldr	r1, [r4, #8]
	clz	r1, r1
	mov	r1, r1, lsr #5
	str	r1, [r0, #28]
	ldr	r1, [r4, #1332]
	cmp	r1, #0
	streq	r1, [r2, #12]
	bne	.L205
.L194:
	ldr	r1, [r5, #8]
	ldr	r3, [r5, #12]
	cmp	r1, r3
	beq	.L206
.L195:
	mov	r3, #0
	str	r3, [r5, #40]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L206:
	ldr	r0, [r4, #1464]
	cmp	r0, #0
	beq	.L195
	ldr	r2, [r4, #1336]
	cmp	r1, r2
	addeq	r4, r4, #1328
	moveq	r3, #0
	addeq	r4, r4, #8
	bne	.L196
.L198:
	add	r3, r3, #1
	cmp	r3, r0
	beq	.L195
	ldr	r2, [r4, #4]!
	cmp	r1, r2
	beq	.L198
.L196:
	str	r2, [r5, #12]
	b	.L195
.L205:
	mov	r1, r2
	mov	r2, r4
	bl	PostPro_GetHevcMbGroup
	b	.L194
	UNWIND(.fnend)
	.size	PostPro_GetHEVCRepairParam, .-PostPro_GetHEVCRepairParam
	.align	2
	.global	PostPro_GetMPEG2RepairParam
	.type	PostPro_GetMPEG2RepairParam, %function
PostPro_GetMPEG2RepairParam:
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
	mov	r3, r0
	ldr	r0, [r1, #188]
	mov	ip, #0
	str	r0, [r3, #8]
	ldr	r0, [r1, #184]
	str	r0, [r3, #12]
	ldrh	r0, [r1, #150]
	str	r0, [r3, #16]
	ldrh	r0, [r1, #146]
	str	r0, [r3, #20]
	ldrb	r0, [r1, #3]	@ zero_extendqisi2
	str	ip, [r3, #28]
	sub	r0, r0, #3
	clz	r0, r0
	mov	r0, r0, lsr #5
	str	r0, [r3, #24]
	ldrb	r0, [r1, #3]	@ zero_extendqisi2
	cmp	r0, ip
	beq	.L212
	cmp	r0, #1
	beq	.L216
	cmp	r0, #2
	beq	.L216
	cmp	r0, #3
	bne	.L209
.L212:
	mov	r0, #0
	str	r0, [r3, #40]
.L209:
	ldrb	ip, [r1, #144]	@ zero_extendqisi2
	mov	r0, #4
	mov	r1, r2
	str	r0, [r3, #48]
	mov	r2, #8
	mov	r0, r3
	strb	ip, [r3]
	strb	r2, [r3, #1]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	PostPro_GetMp24MbGroup
.L216:
	str	r0, [r3, #40]
	b	.L209
	UNWIND(.fnend)
	.size	PostPro_GetMPEG2RepairParam, .-PostPro_GetMPEG2RepairParam
	.align	2
	.global	PostPro_GetMPEG4RepairParam
	.type	PostPro_GetMPEG4RepairParam, %function
PostPro_GetMPEG4RepairParam:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, [r1, #164]
	mov	ip, r1
	mov	r1, r2
	mov	lr, #0
	mov	r6, #1
	mov	r5, #4
	str	r4, [r0, #8]
	mov	r4, #8
	ldr	r2, [ip, #172]
	str	r2, [r0, #12]
	ldrh	r2, [ip, #152]
	str	r2, [r0, #16]
	ldrh	r2, [ip, #154]
	str	r6, [r0, #24]
	str	lr, [r0, #28]
	str	r2, [r0, #20]
	str	lr, [r0, #40]
	ldrb	r2, [ip, #151]	@ zero_extendqisi2
	str	r5, [r0, #48]
	strb	r4, [r0, #1]
	strb	r2, [r0]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	PostPro_GetMp24MbGroup
	UNWIND(.fnend)
	.size	PostPro_GetMPEG4RepairParam, .-PostPro_GetMPEG4RepairParam
	.align	2
	.global	PostPro_PrepairMpeg4CopyParam
	.type	PostPro_PrepairMpeg4CopyParam, %function
PostPro_PrepairMpeg4CopyParam:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r3, #3312
	ldr	lr, .L219
	mul	r1, r3, r1
	ldr	r2, [r0, #188]
	mov	ip, #0
	mov	r7, #4
	mov	r6, #8
	add	r3, lr, r1
	add	r5, r3, #24
	str	r2, [r3, #8]
	ldr	r2, [r0, #172]
	str	r2, [r3, #12]
	ldrh	r2, [r0, #152]
	str	r2, [r3, #16]
	ldrh	r4, [r0, #154]
	mul	r2, r4, r2
	str	r4, [r3, #20]
	ldrb	r0, [r0, #151]	@ zero_extendqisi2
	str	r7, [r3, #48]
	sub	r2, r2, #1
	strb	r6, [r3, #1]
	strb	r0, [lr, r1]
	mov	r1, #1
	str	r2, [r3, #60]
	str	ip, [r3, #28]
	str	ip, [r3, #40]
	str	ip, [r3, #56]
	str	r1, [r3, #24]
	str	r1, [r3, #32]
	str	r1, [r3, #44]
	strb	r1, [r3, #2]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L220:
	.align	2
.L219:
	.word	g_RepairParam
	UNWIND(.fnend)
	.size	PostPro_PrepairMpeg4CopyParam, .-PostPro_PrepairMpeg4CopyParam
	.align	2
	.global	PostProc_GetVPxRepairParam
	.type	PostProc_GetVPxRepairParam, %function
PostProc_GetVPxRepairParam:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	movw	r1, #1734
	str	r0, [sp]
	mov	r0, #0
	ldr	r3, .L222
	ldr	r2, .L222+4
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L223:
	.align	2
.L222:
	.word	.LANCHOR0+56
	.word	.LC8
	UNWIND(.fnend)
	.size	PostProc_GetVPxRepairParam, .-PostProc_GetVPxRepairParam
	.align	2
	.global	PostProc_GetAVSxRepairParam
	.type	PostProc_GetAVSxRepairParam, %function
PostProc_GetAVSxRepairParam:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	movw	r1, #1757
	str	r0, [sp]
	mov	r0, #0
	ldr	r3, .L225
	ldr	r2, .L225+4
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L226:
	.align	2
.L225:
	.word	.LANCHOR0+84
	.word	.LC8
	UNWIND(.fnend)
	.size	PostProc_GetAVSxRepairParam, .-PostProc_GetAVSxRepairParam
	.align	2
	.global	PostProc_GetREALxRepairParam
	.type	PostProc_GetREALxRepairParam, %function
PostProc_GetREALxRepairParam:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	movw	r1, #1780
	str	r0, [sp]
	mov	r0, #0
	ldr	r3, .L228
	ldr	r2, .L228+4
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L229:
	.align	2
.L228:
	.word	.LANCHOR0+112
	.word	.LC8
	UNWIND(.fnend)
	.size	PostProc_GetREALxRepairParam, .-PostProc_GetREALxRepairParam
	.align	2
	.global	PostPro_GetRepairParam
	.type	PostPro_GetRepairParam, %function
PostPro_GetRepairParam:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	mov	r6, r3
	mov	r4, r1
	mov	r3, #0
	str	r0, [r1, #4]
	str	r3, [r1, #32]
	str	r3, [r1, #1688]
	cmp	r0, #18
	ldrls	pc, [pc, r0, asl #2]
	b	.L231
.L233:
	.word	.L232
	.word	.L231
	.word	.L234
	.word	.L235
	.word	.L231
	.word	.L231
	.word	.L236
	.word	.L231
	.word	.L237
	.word	.L237
	.word	.L238
	.word	.L238
	.word	.L238
	.word	.L238
	.word	.L231
	.word	.L231
	.word	.L239
	.word	.L238
	.word	.L236
.L239:
	mov	r1, r2
	ldr	r3, [fp, #4]
	mov	r2, r6
	mov	r0, r4
	bl	PostPro_GetHEVCRepairParam
.L240:
	mov	r5, #0
	str	r5, [r6, #12]
	ldr	lr, [r4, #32]
	ldr	r3, [r4, #16]
	ldr	r1, [r4, #20]
	cmp	lr, r5
	mul	r1, r1, r3
	beq	.L247
	mov	r2, r4
	mov	ip, r5
.L242:
	ldr	r3, [r2, #60]
	add	ip, ip, #1
	ldr	r0, [r2, #56]
	cmp	ip, lr
	add	r3, r3, #1
	add	r2, r2, #8
	rsb	r3, r0, r3
	add	r5, r5, r3
	bne	.L242
.L241:
	ldr	lr, [r4, #1688]
	cmp	lr, #0
	beq	.L243
	mov	r2, r4
	mov	ip, #0
.L244:
	ldr	r3, [r2, #1716]
	add	ip, ip, #1
	ldr	r0, [r2, #1712]
	cmp	ip, lr
	add	r3, r3, #1
	add	r2, r2, #8
	rsb	r3, r0, r3
	add	r5, r5, r3
	bne	.L244
.L243:
	cmp	r1, #0
	moveq	r0, r1
	moveq	r3, #1
	beq	.L245
	mov	r0, #100
	mul	r0, r0, r5
	bl	__aeabi_uidiv
	cmp	r0, #100
	movcs	r0, #100
	clz	r3, r0
	mov	r3, r3, lsr #5
.L245:
	cmp	r5, #2
	movls	r5, #0
	andhi	r5, r3, #1
	cmp	r5, #0
	movne	r0, #1
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L232:
	mov	r1, r2
	mov	r0, r4
	mov	r2, r6
	bl	PostPro_GetH264RepairParam
	b	.L240
.L234:
	mov	r1, r2
	mov	r0, r4
	mov	r2, r6
	bl	PostPro_GetMPEG4RepairParam
	b	.L240
.L235:
	mov	r1, r2
	mov	r0, r4
	mov	r2, r6
	bl	PostPro_GetMPEG2RepairParam
	b	.L240
.L236:
	str	r0, [sp]
	movw	r1, #1757
	ldr	r3, .L255
	mov	r0, #0
	ldr	r2, .L255+4
	bl	dprint_normal
	b	.L240
.L237:
	str	r0, [sp]
	movw	r1, #1780
	ldr	r3, .L255+8
	mov	r0, #0
	ldr	r2, .L255+4
	bl	dprint_normal
	b	.L240
.L238:
	str	r0, [sp]
	movw	r1, #1734
	ldr	r3, .L255+12
	mov	r0, #0
	ldr	r2, .L255+4
	bl	dprint_normal
	b	.L240
.L231:
	str	r0, [sp]
	movw	r1, #1864
	ldr	r3, .L255+16
	mov	r0, #0
	ldr	r2, .L255+20
	bl	dprint_normal
	b	.L240
.L247:
	mov	r5, lr
	b	.L241
.L256:
	.align	2
.L255:
	.word	.LANCHOR0+84
	.word	.LC8
	.word	.LANCHOR0+112
	.word	.LANCHOR0+56
	.word	.LANCHOR0+144
	.word	.LC9
	UNWIND(.fnend)
	.size	PostPro_GetRepairParam, .-PostPro_GetRepairParam
	.align	2
	.global	PostPro_SetDecReport
	.type	PostPro_SetDecReport, %function
PostPro_SetDecReport:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L258
	mov	r4, r2
	mov	r0, r2
	mov	r1, #0
	mov	r2, #820
	ldr	r3, [r3, #48]
	blx	r3
	mov	r3, #1
	mov	r0, #0
	str	r3, [r4, #12]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L259:
	.align	2
.L258:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	PostPro_SetDecReport, .-PostPro_SetDecReport
	.align	2
	.global	PostPro_GetErrRatio
	.type	PostPro_GetErrRatio, %function
PostPro_GetErrRatio:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #28)
	sub	sp, sp, #28
	subs	r3, r0, #0
	beq	.L265
	ldr	ip, .L266
	mov	r2, #12
	mov	r1, #0
	sub	r0, fp, #48
	ldr	r5, [r3]
	ldr	r4, [ip, #48]
	ldr	r7, [r3, #4]
	ldr	r8, [r3, #8]
	blx	r4
	ldr	r1, .L266+4
	mov	r4, #820
	ldr	r2, .L266+8
	mov	r3, #3312
	ldr	r6, .L266+12
	mla	r4, r4, r5, r1
	ldr	r2, [r2, #136]
	str	r7, [fp, #-48]
	cmp	r2, #0
	str	r5, [fp, #-40]
	mla	r6, r3, r5, r6
	str	r4, [fp, #-44]
	beq	.L263
	sub	r0, fp, #48
	blx	r2
.L264:
	str	r5, [sp]
	mov	r3, r4
	mov	r2, r8
	mov	r1, r6
	mov	r0, r7
	bl	PostPro_GetRepairParam
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L263:
	movw	r3, #1945
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L266+16
	bl	dprint_normal
	b	.L264
.L265:
	ldr	r2, .L266+20
	movw	r1, #1927
	bl	dprint_normal
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L267:
	.align	2
.L266:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_DecReport
	.word	g_vdm_hal_fun_ptr
	.word	g_RepairParam
	.word	.LC11
	.word	.LC10
	UNWIND(.fnend)
	.size	PostPro_GetErrRatio, .-PostPro_GetErrRatio
	.align	2
	.global	PostPro_SetFullRepair
	.type	PostPro_SetFullRepair, %function
PostPro_SetFullRepair:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	subs	r4, r1, #0
	mov	r1, r2
	beq	.L272
	cmp	r2, #0
	bne	.L273
	ldr	ip, .L274
	mov	r2, r4
	ldr	r4, .L274+4
	mov	r5, #1
	str	r1, [sp]
	str	r1, [ip, #12]
	mov	r3, ip
	mov	r1, r4
	str	r5, [ip]
	bl	PostPro_GetRepairParam
	mov	r0, #100
	str	r5, [r4, #44]
	str	r5, [r4, #32]
.L270:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L273:
	str	r2, [sp]
	movw	r1, #1967
	ldr	r3, .L274+8
	mov	r0, #0
	ldr	r2, .L274+12
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L272:
	ldr	r3, .L274+8
	movw	r1, #1961
	ldr	r2, .L274+16
	mov	r0, r4
	bl	dprint_normal
	mov	r0, r4
	b	.L270
.L275:
	.align	2
.L274:
	.word	g_DecReport
	.word	g_RepairParam
	.word	.LANCHOR0+168
	.word	.LC13
	.word	.LC12
	UNWIND(.fnend)
	.size	PostPro_SetFullRepair, .-PostPro_SetFullRepair
	.align	2
	.global	PostPro_GetRepairStratage
	.type	PostPro_GetRepairStratage, %function
PostPro_GetRepairStratage:
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
	subs	r0, r2, #0
	beq	.L279
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L279:
	ldr	r3, .L280
	movw	r1, #1988
	ldr	r2, .L280+4
	bl	dprint_normal
	mov	r0, #2
	ldmfd	sp, {fp, sp, pc}
.L281:
	.align	2
.L280:
	.word	.LANCHOR0+192
	.word	.LC12
	UNWIND(.fnend)
	.size	PostPro_GetRepairStratage, .-PostPro_GetRepairStratage
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.10158, %object
	.size	__func__.10158, 23
__func__.10158:
	.ascii	"PostPro_GetMp24MbGroup\000"
	.space	1
	.type	__func__.10267, %object
	.size	__func__.10267, 31
__func__.10267:
	.ascii	"PostPro_GetHevcMbGroupOfNoTile\000"
	.space	1
	.type	__func__.10327, %object
	.size	__func__.10327, 27
__func__.10327:
	.ascii	"PostProc_GetVPxRepairParam\000"
	.space	1
	.type	__func__.10336, %object
	.size	__func__.10336, 28
__func__.10336:
	.ascii	"PostProc_GetAVSxRepairParam\000"
	.type	__func__.10345, %object
	.size	__func__.10345, 29
__func__.10345:
	.ascii	"PostProc_GetREALxRepairParam\000"
	.space	3
	.type	__func__.10369, %object
	.size	__func__.10369, 23
__func__.10369:
	.ascii	"PostPro_GetRepairParam\000"
	.space	1
	.type	__func__.10395, %object
	.size	__func__.10395, 22
__func__.10395:
	.ascii	"PostPro_SetFullRepair\000"
	.space	2
	.type	__func__.10401, %object
	.size	__func__.10401, 26
__func__.10401:
	.ascii	"PostPro_GetRepairStratage\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"%s %d: %s\012\000" )
	.space	1
.LC1:
	ASCII(.ascii	"DecSliceNum out of range!\000" )
	.space	2
.LC2:
	ASCII(.ascii	"ValidGroupNum out of range.\000" )
.LC3:
	ASCII(.ascii	"DecSliceNum(=%d) out of range!\012\000" )
.LC4:
	ASCII(.ascii	"line:%d! pRepairParam->ValidGroupNum > (MAX_UP_MSG_" )
	ASCII(.ascii	"SLICE_NUM - 1)\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"pRepairParam->ValidGroupNum >(MAX_UP_MSG_SLICE_NUM " )
	ASCII(.ascii	"- 1)\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"%s:0 pRepairParam->ValidGroupNum(%d) > (MAX_UP_MSG_" )
	ASCII(.ascii	"SLICE_NUM - 1)\012\000" )
	.space	1
.LC7:
	ASCII(.ascii	"%s:1 pRepairParam->ValidGroupNum(%d) > (MAX_UP_MSG_" )
	ASCII(.ascii	"SLICE_NUM - 1)\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"%s VidStd %d not belong here!\012\000" )
	.space	1
.LC9:
	ASCII(.ascii	"%s VidStd %d Err!\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"PostPro_GetErrRatio: pParam = NULL\012\000" )
.LC11:
	ASCII(.ascii	"VDMHAL_NULL_FUN_PRINT,L%d\012\000" )
	.space	1
.LC12:
	ASCII(.ascii	"%s pDecParam is null\012\000" )
	.space	2
.LC13:
	ASCII(.ascii	"%s VdhId %d invalid!\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
