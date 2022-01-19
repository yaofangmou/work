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
	.global	PostPro_GetMVCRepairParam
	.type	PostPro_GetMVCRepairParam, %function
PostPro_GetMVCRepairParam:
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
	beq	.L140
	ldr	r3, [r4, #868]
	cmp	r3, ip
	addne	r2, r4, #868
	movne	r3, #0
	bne	.L143
	b	.L177
.L144:
	ldr	r0, [r2, #4]!
	cmp	r0, ip
	beq	.L141
.L143:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L144
.L140:
	ldr	r2, [r4, #24]
	ldrsb	r3, [r4, #2]
	cmp	r2, #0
	ldrneb	r2, [r4]	@ zero_extendqisi2
	clzne	r2, r2
	movne	r2, r2, lsr #5
	cmp	r3, #0
	streq	r3, [r1, #12]
	bne	.L178
	ldr	r0, [r5, #8]
	ldr	r3, [r5, #12]
	cmp	r0, r3
	beq	.L179
.L148:
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L157
	cmp	r3, #1
	beq	.L175
	cmp	r3, #2
	beq	.L175
	cmp	r3, #3
	bne	.L154
.L157:
	mov	r3, #0
	str	r3, [r5, #40]
.L154:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	mov	r1, #4
	mov	r2, #8
	str	r1, [r5, #48]
	strb	r2, [r5, #1]
	strb	r3, [r5]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L175:
	str	r3, [r5, #40]
	b	.L154
.L177:
	mov	r3, #0
.L141:
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #804]
	str	r3, [r5, #36]
	b	.L140
.L178:
	mov	r0, r5
	bl	PostPro_GetH264MbGroup
	ldr	r0, [r5, #8]
	ldr	r3, [r5, #12]
	cmp	r0, r3
	bne	.L148
.L179:
	ldr	ip, [r4, #436]
	cmp	ip, #0
	beq	.L148
	ldr	r2, [r4, #300]
	cmp	r0, r2
	addeq	r1, r4, #300
	moveq	r3, #0
	bne	.L149
.L151:
	add	r3, r3, #1
	cmp	r3, ip
	beq	.L148
	ldr	r2, [r1, #4]!
	cmp	r0, r2
	beq	.L151
.L149:
	str	r2, [r5, #12]
	b	.L148
	UNWIND(.fnend)
	.size	PostPro_GetMVCRepairParam, .-PostPro_GetMVCRepairParam
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
	ldr	r2, .L202
	mov	ip, r3, asl #6
	sub	ip, ip, r3, asl #4
	mov	r6, #0
	add	r2, r2, ip
	str	r6, [r0, #32]
	str	r6, [r0, #44]
	mov	r7, r1
	ldr	r1, [r2, #8]
	mov	r5, r0
	ldr	r2, .L202+4
	ldr	r3, [r0, #16]
	ldr	r4, [r0, #20]
	ldr	r0, [r2, r1, asl #2]
	add	r0, r0, #207872
	add	r0, r0, #488
	mul	r4, r4, r3
	bl	HEVC_CalcTileMap
	ldr	r9, [r7, #12]
	cmp	r9, r6
	beq	.L181
	mov	lr, r6
	ldr	r8, .L202+8
	ldr	r6, .L202+12
	mov	ip, r7
	mov	r1, #1
.L184:
	ldrh	r2, [ip, #16]
	ldrh	r0, [ip, #18]
	cmp	r2, r0
	mov	r3, r2
	bls	.L183
	b	.L182
.L201:
	ldrh	r2, [ip, #16]
.L183:
	cmp	r4, r2
	blt	.L185
	cmp	r4, r0
	ldrge	r2, [r6, r3, asl #2]
	strgeb	r1, [r8, r2]
	ldrgeh	r0, [ip, #18]
.L185:
	add	r3, r3, #1
	cmp	r0, r3
	bcs	.L201
	ldr	r9, [r7, #12]
.L182:
	add	lr, lr, #1
	add	ip, ip, #4
	cmp	r9, lr
	bhi	.L184
.L181:
	ldr	lr, .L202+8
	mov	ip, #0
.L191:
	cmp	ip, r4
	bcs	.L192
	ldrb	r3, [lr, ip]	@ zero_extendqisi2
	cmp	r3, #1
	addeq	ip, ip, #1
	ldreq	r0, [r5, #32]
	beq	.L187
	add	r1, ip, lr
	mov	r2, ip
	b	.L189
.L188:
	ldrb	r0, [r1, #1]!	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L190
	mov	r2, r3
.L189:
	add	r3, r2, #1
	cmp	r4, r3
	bhi	.L188
.L190:
	ldr	r1, [r5, #32]
	add	r0, r1, #1
	add	r1, r5, r1, lsl #3
	str	ip, [r1, #56]
	mov	ip, r3
	str	r2, [r1, #60]
	str	r0, [r5, #32]
.L187:
	cmp	r0, #199
	ble	.L191
	ldr	r2, .L202+16
	movw	r1, #595
	mov	r0, #1
	sub	r4, r4, #1
	bl	dprint_normal
	mov	r3, #0
	str	r4, [r5, #60]
	str	r3, [r5, #56]
	mov	r3, #1
	str	r3, [r5, #32]
.L192:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L203:
	.align	2
.L202:
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
	ldr	r2, .L222
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
	ldr	r2, .L222+4
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
	b	.L213
.L220:
	cmp	r0, r1
	movlt	r1, r7
	add	r2, r1, #1
	cmp	r0, r2
	ble	.L207
	ldr	r2, [r5, #32]
	cmp	r2, #199
	bgt	.L217
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
.L207:
	ldr	r2, [r6, #12]
	sub	r1, r2, #1
	cmp	ip, r1
	beq	.L218
.L215:
	add	ip, ip, #1
	mov	r1, lr
	cmp	ip, r2
	mov	r7, r0
	add	r3, r3, #4
	bhi	.L219
.L213:
	ldrh	r0, [r3, #16]
	ldrh	lr, [r3, #18]
	cmp	r0, r4
	cmple	lr, r4
	movgt	r2, #1
	movle	r2, #0
	cmp	r0, lr
	orrgt	r2, r2, #1
	cmp	r2, #0
	beq	.L220
	ldr	r2, [r6, #12]
	add	ip, ip, #1
	add	r3, r3, #4
	cmp	ip, r2
	bls	.L213
.L219:
	mov	r0, #0
.L209:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L218:
	ldrh	r1, [r3, #18]
	cmp	r1, r8
	bge	.L215
	ldr	r3, [r5, #32]
	cmp	r3, #199
	bgt	.L221
	add	r2, r5, r3, lsl #3
	mov	r0, #0
	add	r3, r3, #1
	str	r1, [r2, #56]
	str	r8, [r2, #60]
	str	r3, [r5, #32]
	b	.L209
.L217:
	str	r2, [sp]
	movw	r1, #643
	ldr	r3, .L222+8
	mov	r0, #1
	ldr	r2, .L222+12
	bl	dprint_normal
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L221:
	str	r3, [sp]
	mov	r1, #664
	ldr	r3, .L222+8
	mov	r0, #1
	ldr	r2, .L222+16
	bl	dprint_normal
	mov	r0, #1
	b	.L209
.L223:
	.align	2
.L222:
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
	bhi	.L229
	ldr	ip, [r0, #52]
	cmp	ip, #0
	bne	.L230
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	PostPro_GetHevcMbGroupOfNoTile
.L230:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	PostPro_GetHevcMbGroupOfTile
.L229:
	mov	r3, ip
	ldr	r2, .L231
	movw	r1, #687
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L232:
	.align	2
.L231:
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
	bne	.L246
.L235:
	ldr	r1, [r5, #8]
	ldr	r3, [r5, #12]
	cmp	r1, r3
	beq	.L247
.L236:
	mov	r3, #0
	str	r3, [r5, #40]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L247:
	ldr	r0, [r4, #1464]
	cmp	r0, #0
	beq	.L236
	ldr	r2, [r4, #1336]
	cmp	r1, r2
	addeq	r4, r4, #1328
	moveq	r3, #0
	addeq	r4, r4, #8
	bne	.L237
.L239:
	add	r3, r3, #1
	cmp	r3, r0
	beq	.L236
	ldr	r2, [r4, #4]!
	cmp	r1, r2
	beq	.L239
.L237:
	str	r2, [r5, #12]
	b	.L236
.L246:
	mov	r1, r2
	mov	r2, r4
	bl	PostPro_GetHevcMbGroup
	b	.L235
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
	beq	.L253
	cmp	r0, #1
	beq	.L257
	cmp	r0, #2
	beq	.L257
	cmp	r0, #3
	bne	.L250
.L253:
	mov	r0, #0
	str	r0, [r3, #40]
.L250:
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
.L257:
	str	r0, [r3, #40]
	b	.L250
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
	ldr	lr, .L260
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
.L261:
	.align	2
.L260:
	.word	g_RepairParam
	UNWIND(.fnend)
	.size	PostPro_PrepairMpeg4CopyParam, .-PostPro_PrepairMpeg4CopyParam
	.align	2
	.global	PostPro_GetAvsMbGroup
	.type	PostPro_GetAvsMbGroup, %function
PostPro_GetAvsMbGroup:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	ldr	r3, [r1, #12]
	sub	r2, r3, #1
	cmp	r2, #199
	bhi	.L273
	ldr	lr, [r0, #16]
	mov	r3, #0
	ldr	r4, [r0, #20]
	mvn	r8, #0
	str	r3, [r0, #44]
	mov	ip, r3
	ldr	r2, [r1, #12]
	mov	r10, r3
	mul	r4, r4, lr
	mov	r5, r8
	add	r9, r1, r2, lsl #2
	mov	r3, r1
	mov	r7, r0
	add	lr, r4, r8
	str	lr, [fp, #-48]
	add	r6, r4, r4, lsr #31
	uxth	lr, r4
	strh	lr, [r9, #18]	@ movhi
	mov	r6, r6, asr #1
	strh	lr, [r9, #16]	@ movhi
	add	r2, r6, r8
	str	r6, [fp, #-56]
	str	r2, [fp, #-52]
	b	.L269
.L276:
	cmp	r2, r8
	movlt	r8, r5
	add	r8, r8, #1
	cmp	r2, r8
	ble	.L267
	ldr	r8, [r7, #32]
	add	r5, r5, r5, lsr #31
	sub	r6, r2, #1
	rsb	r5, r10, r5
	rsb	r6, r10, r6
	add	r9, r7, r8, lsl #3
	add	r8, r8, #1
	str	r5, [r9, #56]
	str	r6, [r9, #60]
	ldr	r5, [r7, #24]
	str	r8, [r7, #32]
	cmp	r5, #0
	bne	.L267
	ldr	r5, [fp, #-52]
	cmp	r2, r5
	addge	r7, r0, #1648
	ldrge	r10, [fp, #-56]
	addge	r7, r7, #8
.L267:
	ldr	r6, [r1, #12]
	sub	r5, r6, #1
	cmp	r5, ip
	beq	.L274
.L271:
	add	ip, ip, #1
	mov	r8, lr
	cmp	ip, r6
	mov	r5, r2
	add	r3, r3, #4
	bhi	.L275
.L269:
	ldrh	r2, [r3, #16]
	ldrh	lr, [r3, #18]
	cmp	r2, r4
	cmple	lr, r4
	movgt	r6, #1
	movle	r6, #0
	cmp	r2, lr
	orrgt	r6, r6, #1
	cmp	r6, #0
	beq	.L276
	ldr	r6, [r1, #12]
	add	ip, ip, #1
	add	r3, r3, #4
	cmp	ip, r6
	bls	.L269
.L275:
	mov	r3, #0
.L264:
	mov	r0, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L274:
	add	r5, r1, ip, lsl #2
	ldr	r8, [fp, #-48]
	ldrh	r5, [r5, #18]
	cmp	r5, r8
	bge	.L271
	ldr	r2, [r0, #32]
	mov	r3, #0
	add	r1, r2, #1
	add	r2, r0, r2, lsl #3
	str	r5, [r2, #56]
	str	r8, [r2, #60]
	str	r1, [r0, #32]
	b	.L264
.L273:
	ldr	r2, .L277
	movw	r1, #955
	mov	r0, #0
	bl	dprint_normal
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L278:
	.align	2
.L277:
	.word	.LC3
	UNWIND(.fnend)
	.size	PostPro_GetAvsMbGroup, .-PostPro_GetAvsMbGroup
	.align	2
	.global	PostPro_GetAVSRepairParam
	.type	PostPro_GetAVSRepairParam, %function
PostPro_GetAVSRepairParam:
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
	ldr	r7, [r1, #124]
	mov	r3, r0
	mov	lr, #0
	str	r7, [r0, #8]
	ldr	r4, [r1, #116]
	str	r4, [r0, #12]
	ldrh	r5, [r1, #64]
	str	r5, [r0, #16]
	ldrh	r6, [r1, #66]
	str	r6, [r0, #20]
	ldrb	r0, [r1, #21]	@ zero_extendqisi2
	str	lr, [r3, #28]
	sub	r0, r0, #3
	clz	r0, r0
	mov	r0, r0, lsr #5
	str	r0, [r3, #24]
	ldr	ip, [r2, #4]
	str	r0, [r3, #1680]
	str	r6, [r3, #1676]
	add	r0, ip, r7
	str	r5, [r3, #1672]
	str	r0, [r3, #1664]
	str	r4, [r3, #1668]
	str	lr, [r3, #1684]
	ldrb	r0, [r1, #21]	@ zero_extendqisi2
	cmp	r0, #3
	streq	lr, [r3, #40]
	beq	.L281
	cmp	r0, #1
	streq	r0, [r3, #40]
.L281:
	ldrb	ip, [r1, #52]	@ zero_extendqisi2
	mov	r0, #4
	mov	r1, r2
	str	r0, [r3, #48]
	mov	r2, #8
	mov	r0, r3
	strb	ip, [r3]
	strb	r2, [r3, #1]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	PostPro_GetAvsMbGroup
	UNWIND(.fnend)
	.size	PostPro_GetAVSRepairParam, .-PostPro_GetAVSRepairParam
	.align	2
	.global	PostPro_GetVc1MbGroup
	.type	PostPro_GetVc1MbGroup, %function
PostPro_GetVc1MbGroup:
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
	ldr	r3, [r1, #12]
	sub	r3, r3, #1
	cmp	r3, #199
	bhi	.L296
	ldr	r2, [r0, #16]
	mov	r3, #0
	ldr	r5, [r0, #20]
	mvn	r6, #0
	str	r3, [r0, #32]
	mov	lr, r3
	str	r3, [r0, #44]
	mov	r7, r6
	mul	r5, r5, r2
	ldr	r2, [r1, #12]
	mov	r3, r1
	add	r4, r1, r2, lsl #2
	add	r8, r5, r6
	uxth	ip, r5
	mov	r2, r4
	strh	ip, [r4, #18]	@ movhi
	strh	ip, [r4, #16]	@ movhi
	b	.L291
.L300:
	cmp	ip, r6
	movlt	r6, r7
	add	r6, r6, #1
	cmp	r6, ip
	beq	.L287
	add	r7, r7, r7, lsr #31
	sub	r6, ip, #1
	cmp	r7, r6
	bge	.L287
	ldr	r2, [r0, #32]
	cmp	r2, #199
	bgt	.L297
	add	r9, r0, r2, lsl #3
	add	r2, r2, #1
	str	r7, [r9, #56]
	str	r6, [r9, #60]
	str	r2, [r0, #32]
.L287:
	ldr	r2, [r1, #12]
	sub	r6, r2, #1
	cmp	r6, lr
	beq	.L298
.L293:
	add	lr, lr, #1
	mov	r6, r4
	cmp	lr, r2
	mov	r7, ip
	add	r3, r3, #4
	bhi	.L299
.L291:
	ldrh	ip, [r3, #16]
	ldrh	r4, [r3, #18]
	cmp	ip, r5
	cmple	r4, r5
	movgt	r2, #1
	movle	r2, #0
	cmp	ip, r4
	orrgt	r2, r2, #1
	cmp	r2, #0
	beq	.L300
	ldr	r2, [r1, #12]
	add	lr, lr, #1
	add	r3, r3, #4
	cmp	lr, r2
	bls	.L291
.L299:
	mov	r3, #0
.L284:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L298:
	add	r6, r1, lr, lsl #2
	ldrh	r6, [r6, #18]
	cmp	r6, r8
	bge	.L293
	ldr	r3, [r0, #32]
	cmp	r3, #199
	bgt	.L301
	add	r1, r0, r3, lsl #3
	add	r2, r3, #1
	mov	r3, #0
	str	r6, [r1, #56]
	str	r8, [r1, #60]
	str	r2, [r0, #32]
	b	.L284
.L296:
	ldr	r2, .L302
	movw	r1, #1172
	mov	r0, #0
	bl	dprint_normal
	mov	r3, #1
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L297:
	movw	r3, #1207
.L295:
	mov	r1, r3
	ldr	r2, .L302+4
	mov	r0, #20
	bl	dprint_normal
	mov	r3, #1
	b	.L284
.L301:
	movw	r3, #1223
	b	.L295
.L303:
	.align	2
.L302:
	.word	.LC8
	.word	.LC4
	UNWIND(.fnend)
	.size	PostPro_GetVc1MbGroup, .-PostPro_GetVc1MbGroup
	.align	2
	.global	PostPro_GetVC1RepairParam
	.type	PostPro_GetVC1RepairParam, %function
PostPro_GetVC1RepairParam:
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
	ldr	r3, [r1, #176]
	mov	r5, r1
	mov	r6, #0
	mov	r4, r0
	mov	r1, r2
	str	r3, [r0, #8]
	ldr	r3, [r5, #100]
	str	r3, [r0, #12]
	ldrh	r3, [r5, #78]
	add	r3, r3, #1
	str	r3, [r0, #16]
	ldrh	r3, [r5, #80]
	add	r3, r3, #1
	str	r3, [r0, #20]
	ldrb	r3, [r5, #5]	@ zero_extendqisi2
	str	r6, [r0, #28]
	tst	r3, #253
	moveq	r3, #1
	movne	r3, r6
	str	r3, [r0, #24]
	bl	PostPro_GetVc1MbGroup
	ldr	r2, [r4, #24]
	ldrb	r3, [r5, #68]	@ zero_extendqisi2
	cmp	r2, #1
	streq	r6, [r4, #40]
	and	r3, r3, #3
	str	r3, [r4, #36]
	beq	.L306
	ldrb	r3, [r5, #5]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L308
.L306:
	mov	r3, #8
	mov	r2, #4
	strb	r3, [r4, #1]
	str	r2, [r4, #48]
	ldrb	r3, [r5, #71]	@ zero_extendqisi2
	strb	r3, [r4]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L308:
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r4, #40]
	beq	.L306
	cmp	r3, #1
	moveq	r3, #2
	streq	r3, [r4, #40]
	b	.L306
	UNWIND(.fnend)
	.size	PostPro_GetVC1RepairParam, .-PostPro_GetVC1RepairParam
	.align	2
	.global	PostPro_PrepairVc1CopyParam
	.type	PostPro_PrepairVc1CopyParam, %function
PostPro_PrepairVc1CopyParam:
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
	mov	r3, #3312
	ldr	r6, .L310
	mul	r1, r3, r1
	ldr	r2, [r0, #176]
	mov	lr, #1
	mov	r4, #0
	mov	r8, #4
	add	r3, r6, r1
	add	r7, r3, #24
	str	r2, [r3, #8]
	ldr	r2, [r0, #100]
	str	r2, [r3, #12]
	ldrh	r2, [r0, #78]
	add	r5, r2, lr
	str	r5, [r3, #16]
	ldrh	ip, [r0, #80]
	str	r8, [r3, #48]
	add	r2, ip, lr
	str	r2, [r3, #20]
	str	r4, [r3, #28]
	mov	ip, #8
	mul	r2, r2, r5
	str	r4, [r3, #40]
	str	r4, [r3, #36]
	str	lr, [r3, #24]
	ldrb	r0, [r0, #71]	@ zero_extendqisi2
	sub	r2, r2, #1
	str	lr, [r3, #32]
	str	r2, [r3, #60]
	strb	r0, [r6, r1]
	str	r4, [r3, #56]
	str	lr, [r3, #44]
	strb	lr, [r3, #2]
	strb	ip, [r3, #1]
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L311:
	.align	2
.L310:
	.word	g_RepairParam
	UNWIND(.fnend)
	.size	PostPro_PrepairVc1CopyParam, .-PostPro_PrepairVc1CopyParam
	.align	2
	.global	PostPro_GetVp6MbGroup
	.type	PostPro_GetVp6MbGroup, %function
PostPro_GetVp6MbGroup:
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
	ldr	r3, [r1, #12]
	sub	r3, r3, #1
	cmp	r3, #199
	bhi	.L326
	ldr	r2, [r0, #16]
	mov	r3, #0
	ldr	r5, [r0, #20]
	mvn	r6, #0
	str	r3, [r0, #32]
	mov	lr, r3
	str	r3, [r0, #44]
	mov	r7, r6
	mul	r5, r5, r2
	ldr	r2, [r1, #12]
	mov	r3, r1
	add	r4, r1, r2, lsl #2
	add	r8, r5, r6
	uxth	ip, r5
	mov	r2, r4
	strh	ip, [r4, #18]	@ movhi
	strh	ip, [r4, #16]	@ movhi
	b	.L321
.L330:
	cmp	ip, r6
	movlt	r6, r7
	add	r6, r6, #1
	cmp	r6, ip
	beq	.L317
	add	r7, r7, r7, lsr #31
	sub	r6, ip, #1
	cmp	r7, r6
	bge	.L317
	ldr	r2, [r0, #32]
	cmp	r2, #199
	bgt	.L327
	add	r9, r0, r2, lsl #3
	add	r2, r2, #1
	str	r7, [r9, #56]
	str	r6, [r9, #60]
	str	r2, [r0, #32]
.L317:
	ldr	r2, [r1, #12]
	sub	r6, r2, #1
	cmp	r6, lr
	beq	.L328
.L323:
	add	lr, lr, #1
	mov	r6, r4
	cmp	lr, r2
	mov	r7, ip
	add	r3, r3, #4
	bhi	.L329
.L321:
	ldrh	ip, [r3, #16]
	ldrh	r4, [r3, #18]
	cmp	ip, r5
	cmple	r4, r5
	movgt	r2, #1
	movle	r2, #0
	cmp	ip, r4
	orrgt	r2, r2, #1
	cmp	r2, #0
	beq	.L330
	ldr	r2, [r1, #12]
	add	lr, lr, #1
	add	r3, r3, #4
	cmp	lr, r2
	bls	.L321
.L329:
	mov	r3, #0
.L314:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L328:
	add	r6, r1, lr, lsl #2
	ldrh	r6, [r6, #18]
	cmp	r6, r8
	bge	.L323
	ldr	r3, [r0, #32]
	cmp	r3, #199
	bgt	.L331
	add	r1, r0, r3, lsl #3
	add	r2, r3, #1
	mov	r3, #0
	str	r6, [r1, #56]
	str	r8, [r1, #60]
	str	r2, [r0, #32]
	b	.L314
.L326:
	ldr	r2, .L332
	movw	r1, #1442
	mov	r0, #0
	bl	dprint_normal
	mov	r3, #1
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L327:
	movw	r3, #1477
.L325:
	mov	r1, r3
	ldr	r2, .L332+4
	mov	r0, #20
	bl	dprint_normal
	mov	r3, #1
	b	.L314
.L331:
	movw	r3, #1493
	b	.L325
.L333:
	.align	2
.L332:
	.word	.LC8
	.word	.LC4
	UNWIND(.fnend)
	.size	PostPro_GetVp6MbGroup, .-PostPro_GetVp6MbGroup
	.align	2
	.global	PostPro_GetVP6RepairParam
	.type	PostPro_GetVP6RepairParam, %function
PostPro_GetVP6RepairParam:
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
	ldr	r6, [r1, #176]
	mov	ip, r1
	mov	r5, #1
	mov	r1, r2
	mov	r4, #4
	mov	r2, #0
	str	r6, [r0, #8]
	mov	lr, #8
	ldr	r6, [ip, #188]
	str	r6, [r0, #12]
	ldrh	r6, [ip, #54]
	str	r6, [r0, #16]
	ldrh	r6, [ip, #56]
	str	r6, [r0, #20]
	ldrb	ip, [ip, #52]	@ zero_extendqisi2
	str	r5, [r0, #24]
	str	r4, [r0, #48]
	strb	ip, [r0]
	strb	lr, [r0, #1]
	str	r2, [r0, #28]
	str	r2, [r0, #36]
	str	r2, [r0, #40]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	PostPro_GetVp6MbGroup
	UNWIND(.fnend)
	.size	PostPro_GetVP6RepairParam, .-PostPro_GetVP6RepairParam
	.align	2
	.global	PostPro_PrepairVp6CopyParam
	.type	PostPro_PrepairVp6CopyParam, %function
PostPro_PrepairVp6CopyParam:
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
	mov	r3, #3312
	ldr	lr, .L336
	mul	r1, r3, r1
	ldr	r2, [r0, #176]
	mov	ip, #0
	mov	r8, #4
	mov	r7, #8
	add	r3, lr, r1
	add	r6, r3, #24
	add	r5, r3, #32
	str	r2, [r3, #8]
	ldr	r2, [r0, #188]
	str	r2, [r3, #12]
	ldrh	r2, [r0, #54]
	str	r2, [r3, #16]
	ldrh	r4, [r0, #56]
	mul	r2, r4, r2
	str	r4, [r3, #20]
	ldrb	r0, [r0, #52]	@ zero_extendqisi2
	str	r8, [r3, #48]
	sub	r2, r2, #1
	strb	r7, [r3, #1]
	strb	r0, [lr, r1]
	mov	r1, #1
	str	r2, [r3, #60]
	str	ip, [r3, #28]
	str	ip, [r3, #40]
	str	ip, [r3, #56]
	str	ip, [r3, #36]
	str	r1, [r3, #24]
	str	r1, [r3, #32]
	str	r1, [r3, #44]
	strb	r1, [r3, #2]
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L337:
	.align	2
.L336:
	.word	g_RepairParam
	UNWIND(.fnend)
	.size	PostPro_PrepairVp6CopyParam, .-PostPro_PrepairVp6CopyParam
	.align	2
	.global	PostPro_GetVp8MbGroup
	.type	PostPro_GetVp8MbGroup, %function
PostPro_GetVp8MbGroup:
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
	ldr	r3, [r1, #12]
	sub	r3, r3, #1
	cmp	r3, #199
	bhi	.L352
	ldr	r2, [r0, #16]
	mov	r3, #0
	ldr	r5, [r0, #20]
	mvn	r6, #0
	str	r3, [r0, #32]
	mov	lr, r3
	str	r3, [r0, #44]
	mov	r7, r6
	mul	r5, r5, r2
	ldr	r2, [r1, #12]
	mov	r3, r1
	add	r4, r1, r2, lsl #2
	add	r8, r5, r6
	uxth	ip, r5
	mov	r2, r4
	strh	ip, [r4, #18]	@ movhi
	strh	ip, [r4, #16]	@ movhi
	b	.L347
.L356:
	cmp	ip, r6
	movlt	r6, r7
	add	r6, r6, #1
	cmp	r6, ip
	beq	.L343
	add	r7, r7, r7, lsr #31
	sub	r6, ip, #1
	cmp	r7, r6
	bge	.L343
	ldr	r2, [r0, #32]
	cmp	r2, #199
	bgt	.L353
	add	r9, r0, r2, lsl #3
	add	r2, r2, #1
	str	r7, [r9, #56]
	str	r6, [r9, #60]
	str	r2, [r0, #32]
.L343:
	ldr	r2, [r1, #12]
	sub	r6, r2, #1
	cmp	r6, lr
	beq	.L354
.L349:
	add	lr, lr, #1
	mov	r6, r4
	cmp	lr, r2
	mov	r7, ip
	add	r3, r3, #4
	bhi	.L355
.L347:
	ldrh	ip, [r3, #16]
	ldrh	r4, [r3, #18]
	cmp	ip, r5
	cmple	r4, r5
	movgt	r2, #1
	movle	r2, #0
	cmp	ip, r4
	orrgt	r2, r2, #1
	cmp	r2, #0
	beq	.L356
	ldr	r2, [r1, #12]
	add	lr, lr, #1
	add	r3, r3, #4
	cmp	lr, r2
	bls	.L347
.L355:
	mov	r3, #0
.L340:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L354:
	add	r6, r1, lr, lsl #2
	ldrh	r6, [r6, #18]
	cmp	r6, r8
	bge	.L349
	ldr	r3, [r0, #32]
	cmp	r3, #199
	bgt	.L357
	add	r1, r0, r3, lsl #3
	add	r2, r3, #1
	mov	r3, #0
	str	r6, [r1, #56]
	str	r8, [r1, #60]
	str	r2, [r0, #32]
	b	.L340
.L352:
	ldr	r2, .L358
	movw	r1, #1564
	mov	r0, #0
	bl	dprint_normal
	mov	r3, #1
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L353:
	movw	r3, #1599
.L351:
	mov	r1, r3
	ldr	r2, .L358+4
	mov	r0, #20
	bl	dprint_normal
	mov	r3, #1
	b	.L340
.L357:
	movw	r3, #1615
	b	.L351
.L359:
	.align	2
.L358:
	.word	.LC8
	.word	.LC4
	UNWIND(.fnend)
	.size	PostPro_GetVp8MbGroup, .-PostPro_GetVp8MbGroup
	.align	2
	.global	PostPro_GetVP8RepairParam
	.type	PostPro_GetVP8RepairParam, %function
PostPro_GetVP8RepairParam:
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
	ldr	r4, [r1, #3120]
	mov	ip, r1
	mov	r1, r2
	mov	lr, #0
	mov	r6, #1
	mov	r5, #4
	str	r4, [r0, #8]
	mov	r4, #8
	ldr	r2, [ip, #3136]
	str	r2, [r0, #12]
	ldr	r2, [ip, #2788]
	str	r2, [r0, #16]
	ldr	r2, [ip, #2792]
	str	r6, [r0, #24]
	str	lr, [r0, #28]
	str	r2, [r0, #20]
	str	lr, [r0, #40]
	ldrb	r2, [ip, #2778]	@ zero_extendqisi2
	str	r5, [r0, #48]
	strb	r4, [r0, #1]
	strb	r2, [r0]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	PostPro_GetVp8MbGroup
	UNWIND(.fnend)
	.size	PostPro_GetVP8RepairParam, .-PostPro_GetVP8RepairParam
	.align	2
	.global	PostPro_GetH263RepairParam
	.type	PostPro_GetH263RepairParam, %function
PostPro_GetH263RepairParam:
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
	ldr	r4, [r1, #172]
	mov	ip, r1
	mov	r1, r2
	mov	lr, #0
	mov	r6, #1
	mov	r5, #4
	str	r4, [r0, #8]
	mov	r4, #8
	ldr	r2, [ip, #180]
	str	r2, [r0, #12]
	ldrh	r2, [ip, #158]
	str	r2, [r0, #16]
	ldrh	r2, [ip, #160]
	str	r6, [r0, #24]
	str	lr, [r0, #28]
	str	r2, [r0, #20]
	str	lr, [r0, #40]
	ldrb	r2, [ip, #155]	@ zero_extendqisi2
	str	r5, [r0, #48]
	strb	r4, [r0, #1]
	strb	r2, [r0]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	PostPro_GetMp24MbGroup
	UNWIND(.fnend)
	.size	PostPro_GetH263RepairParam, .-PostPro_GetH263RepairParam
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
	cmp	r0, #10
	mov	ip, r1
	mov	r1, r2
	bcc	.L363
	cmp	r0, #12
	bls	.L364
	cmp	r0, #13
	bne	.L363
	mov	r2, r3
	mov	r0, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	PostPro_GetVP8RepairParam
.L363:
	str	r0, [sp]
	movw	r1, #1734
	ldr	r3, .L366
	mov	r0, #0
	ldr	r2, .L366+4
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L364:
	mov	r2, r3
	mov	r0, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	PostPro_GetVP6RepairParam
.L367:
	.align	2
.L366:
	.word	.LANCHOR0+56
	.word	.LC9
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
	cmp	r0, #6
	mov	ip, r1
	mov	r1, r2
	beq	.L372
	str	r0, [sp]
	movw	r1, #1757
	ldr	r3, .L373
	mov	r0, #0
	ldr	r2, .L373+4
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L372:
	mov	r2, r3
	mov	r0, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	PostPro_GetAVSRepairParam
.L374:
	.align	2
.L373:
	.word	.LANCHOR0+84
	.word	.LC9
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
	ldr	r3, .L376
	ldr	r2, .L376+4
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L377:
	.align	2
.L376:
	.word	.LANCHOR0+112
	.word	.LC9
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
	b	.L379
.L381:
	.word	.L380
	.word	.L382
	.word	.L383
	.word	.L384
	.word	.L385
	.word	.L379
	.word	.L386
	.word	.L379
	.word	.L387
	.word	.L387
	.word	.L388
	.word	.L388
	.word	.L388
	.word	.L388
	.word	.L385
	.word	.L389
	.word	.L390
	.word	.L388
	.word	.L386
.L390:
	mov	r1, r2
	ldr	r3, [fp, #4]
	mov	r2, r6
	mov	r0, r4
	bl	PostPro_GetHEVCRepairParam
.L391:
	mov	r5, #0
	str	r5, [r6, #12]
	ldr	lr, [r4, #32]
	ldr	r3, [r4, #16]
	ldr	r1, [r4, #20]
	cmp	lr, r5
	mul	r1, r1, r3
	beq	.L398
	mov	r2, r4
	mov	ip, r5
.L393:
	ldr	r3, [r2, #60]
	add	ip, ip, #1
	ldr	r0, [r2, #56]
	cmp	ip, lr
	add	r3, r3, #1
	add	r2, r2, #8
	rsb	r3, r0, r3
	add	r5, r5, r3
	bne	.L393
.L392:
	ldr	lr, [r4, #1688]
	cmp	lr, #0
	beq	.L394
	mov	r2, r4
	mov	ip, #0
.L395:
	ldr	r3, [r2, #1716]
	add	ip, ip, #1
	ldr	r0, [r2, #1712]
	cmp	ip, lr
	add	r3, r3, #1
	add	r2, r2, #8
	rsb	r3, r0, r3
	add	r5, r5, r3
	bne	.L395
.L394:
	cmp	r1, #0
	moveq	r0, r1
	moveq	r3, #1
	beq	.L396
	mov	r0, #100
	mul	r0, r0, r5
	bl	__aeabi_uidiv
	cmp	r0, #100
	movcs	r0, #100
	clz	r3, r0
	mov	r3, r3, lsr #5
.L396:
	cmp	r5, #2
	movls	r5, #0
	andhi	r5, r3, #1
	cmp	r5, #0
	movne	r0, #1
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L380:
	mov	r1, r2
	mov	r0, r4
	mov	r2, r6
	bl	PostPro_GetH264RepairParam
	b	.L391
.L382:
	mov	r1, r2
	mov	r0, r4
	mov	r2, r6
	bl	PostPro_GetVC1RepairParam
	b	.L391
.L383:
	mov	r1, r2
	mov	r0, r4
	mov	r2, r6
	bl	PostPro_GetMPEG4RepairParam
	b	.L391
.L384:
	mov	r1, r2
	mov	r0, r4
	mov	r2, r6
	bl	PostPro_GetMPEG2RepairParam
	b	.L391
.L385:
	mov	r1, r2
	mov	r0, r4
	mov	r2, r6
	bl	PostPro_GetH263RepairParam
	b	.L391
.L386:
	mov	r3, r6
	bl	PostProc_GetAVSxRepairParam
	b	.L391
.L387:
	str	r0, [sp]
	movw	r1, #1780
	ldr	r3, .L406
	mov	r0, #0
	ldr	r2, .L406+4
	bl	dprint_normal
	b	.L391
.L388:
	mov	r3, r6
	bl	PostProc_GetVPxRepairParam
	b	.L391
.L389:
	mov	r1, r2
	mov	r0, r4
	mov	r2, r6
	bl	PostPro_GetMVCRepairParam
	b	.L391
.L379:
	str	r0, [sp]
	movw	r1, #1864
	ldr	r3, .L406+8
	mov	r0, #0
	ldr	r2, .L406+12
	bl	dprint_normal
	b	.L391
.L398:
	mov	r5, lr
	b	.L392
.L407:
	.align	2
.L406:
	.word	.LANCHOR0+112
	.word	.LC9
	.word	.LANCHOR0+144
	.word	.LC10
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
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L412
	mov	r4, r2
	mov	r6, r0
	mov	r5, r1
	mov	r0, r2
	mov	r1, #0
	ldr	r3, [r3, #48]
	mov	r2, #820
	blx	r3
	cmp	r6, #6
	mov	r3, #1
	str	r3, [r4, #12]
	bne	.L409
	ldrb	r3, [r5, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L411
.L409:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L411:
	mov	r3, #2
	str	r3, [r4, #12]
	ldrh	r2, [r5, #64]
	mov	r0, #0
	ldrh	r3, [r5, #66]
	mul	r3, r3, r2
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	strh	r3, [r4, #20]	@ movhi
	ldrh	r2, [r5, #64]
	ldrh	r3, [r5, #66]
	mul	r3, r3, r2
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	strh	r3, [r4, #22]	@ movhi
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L413:
	.align	2
.L412:
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
	beq	.L419
	ldr	ip, .L420
	mov	r2, #12
	mov	r1, #0
	sub	r0, fp, #48
	ldr	r5, [r3]
	ldr	r4, [ip, #48]
	ldr	r7, [r3, #4]
	ldr	r8, [r3, #8]
	blx	r4
	ldr	r1, .L420+4
	mov	r4, #820
	ldr	r2, .L420+8
	mov	r3, #3312
	ldr	r6, .L420+12
	mla	r4, r4, r5, r1
	ldr	r2, [r2, #136]
	str	r7, [fp, #-48]
	cmp	r2, #0
	str	r5, [fp, #-40]
	mla	r6, r3, r5, r6
	str	r4, [fp, #-44]
	beq	.L417
	sub	r0, fp, #48
	blx	r2
.L418:
	str	r5, [sp]
	mov	r3, r4
	mov	r2, r8
	mov	r1, r6
	mov	r0, r7
	bl	PostPro_GetRepairParam
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L417:
	movw	r3, #1945
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L420+16
	bl	dprint_normal
	b	.L418
.L419:
	ldr	r2, .L420+20
	movw	r1, #1927
	bl	dprint_normal
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L421:
	.align	2
.L420:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_DecReport
	.word	g_vdm_hal_fun_ptr
	.word	g_RepairParam
	.word	.LC12
	.word	.LC11
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
	beq	.L426
	cmp	r2, #0
	bne	.L427
	ldr	ip, .L428
	mov	r2, r4
	ldr	r4, .L428+4
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
.L424:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L427:
	str	r2, [sp]
	movw	r1, #1967
	ldr	r3, .L428+8
	mov	r0, #0
	ldr	r2, .L428+12
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L426:
	ldr	r3, .L428+8
	movw	r1, #1961
	ldr	r2, .L428+16
	mov	r0, r4
	bl	dprint_normal
	mov	r0, r4
	b	.L424
.L429:
	.align	2
.L428:
	.word	g_DecReport
	.word	g_RepairParam
	.word	.LANCHOR0+168
	.word	.LC14
	.word	.LC13
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
	beq	.L433
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L433:
	ldr	r3, .L434
	movw	r1, #1988
	ldr	r2, .L434+4
	bl	dprint_normal
	mov	r0, #2
	ldmfd	sp, {fp, sp, pc}
.L435:
	.align	2
.L434:
	.word	.LANCHOR0+192
	.word	.LC13
	UNWIND(.fnend)
	.size	PostPro_GetRepairStratage, .-PostPro_GetRepairStratage
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.12764, %object
	.size	__func__.12764, 23
__func__.12764:
	.ascii	"PostPro_GetMp24MbGroup\000"
	.space	1
	.type	__func__.12888, %object
	.size	__func__.12888, 31
__func__.12888:
	.ascii	"PostPro_GetHevcMbGroupOfNoTile\000"
	.space	1
	.type	__func__.13051, %object
	.size	__func__.13051, 27
__func__.13051:
	.ascii	"PostProc_GetVPxRepairParam\000"
	.space	1
	.type	__func__.13061, %object
	.size	__func__.13061, 28
__func__.13061:
	.ascii	"PostProc_GetAVSxRepairParam\000"
	.type	__func__.13069, %object
	.size	__func__.13069, 29
__func__.13069:
	.ascii	"PostProc_GetREALxRepairParam\000"
	.space	3
	.type	__func__.13097, %object
	.size	__func__.13097, 23
__func__.13097:
	.ascii	"PostPro_GetRepairParam\000"
	.space	1
	.type	__func__.13125, %object
	.size	__func__.13125, 22
__func__.13125:
	.ascii	"PostPro_SetFullRepair\000"
	.space	2
	.type	__func__.13131, %object
	.size	__func__.13131, 26
__func__.13131:
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
	ASCII(.ascii	"DecSliceNum out of range!\012\000" )
	.space	1
.LC9:
	ASCII(.ascii	"%s VidStd %d not belong here!\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"%s VidStd %d Err!\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"PostPro_GetErrRatio: pParam = NULL\012\000" )
.LC12:
	ASCII(.ascii	"VDMHAL_NULL_FUN_PRINT,L%d\012\000" )
	.space	1
.LC13:
	ASCII(.ascii	"%s pDecParam is null\012\000" )
	.space	2
.LC14:
	ASCII(.ascii	"%s VdhId %d invalid!\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
