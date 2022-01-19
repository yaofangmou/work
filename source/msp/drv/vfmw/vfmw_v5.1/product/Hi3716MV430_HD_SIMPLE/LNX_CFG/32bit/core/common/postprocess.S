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
	beq	.L144
	cmp	r0, #1
	beq	.L148
	cmp	r0, #2
	beq	.L148
	cmp	r0, #3
	bne	.L141
.L144:
	mov	r0, #0
	str	r0, [r3, #40]
.L141:
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
.L148:
	str	r0, [r3, #40]
	b	.L141
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
	ldr	lr, .L151
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
.L152:
	.align	2
.L151:
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
	ldr	r3, .L154
	ldr	r2, .L154+4
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L155:
	.align	2
.L154:
	.word	.LANCHOR0+24
	.word	.LC5
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
	ldr	r3, .L157
	ldr	r2, .L157+4
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L158:
	.align	2
.L157:
	.word	.LANCHOR0+52
	.word	.LC5
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
	ldr	r3, .L160
	ldr	r2, .L160+4
	bl	dprint_normal
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L161:
	.align	2
.L160:
	.word	.LANCHOR0+80
	.word	.LC5
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
	b	.L163
.L165:
	.word	.L164
	.word	.L163
	.word	.L166
	.word	.L167
	.word	.L163
	.word	.L163
	.word	.L168
	.word	.L163
	.word	.L169
	.word	.L169
	.word	.L170
	.word	.L170
	.word	.L170
	.word	.L170
	.word	.L163
	.word	.L163
	.word	.L163
	.word	.L170
	.word	.L168
.L170:
	str	r0, [sp]
	movw	r1, #1734
	ldr	r3, .L186
	mov	r0, #0
	ldr	r2, .L186+4
	bl	dprint_normal
.L171:
	mov	r5, #0
	str	r5, [r6, #12]
	ldr	lr, [r4, #32]
	ldr	r3, [r4, #16]
	ldr	r1, [r4, #20]
	cmp	lr, r5
	mul	r1, r1, r3
	beq	.L178
	mov	r2, r4
	mov	ip, r5
.L173:
	ldr	r3, [r2, #60]
	add	ip, ip, #1
	ldr	r0, [r2, #56]
	cmp	ip, lr
	add	r3, r3, #1
	add	r2, r2, #8
	rsb	r3, r0, r3
	add	r5, r5, r3
	bne	.L173
.L172:
	ldr	lr, [r4, #1688]
	cmp	lr, #0
	beq	.L174
	mov	r2, r4
	mov	ip, #0
.L175:
	ldr	r3, [r2, #1716]
	add	ip, ip, #1
	ldr	r0, [r2, #1712]
	cmp	ip, lr
	add	r3, r3, #1
	add	r2, r2, #8
	rsb	r3, r0, r3
	add	r5, r5, r3
	bne	.L175
.L174:
	cmp	r1, #0
	moveq	r0, r1
	moveq	r3, #1
	beq	.L176
	mov	r0, #100
	mul	r0, r0, r5
	bl	__aeabi_uidiv
	cmp	r0, #100
	movcs	r0, #100
	clz	r3, r0
	mov	r3, r3, lsr #5
.L176:
	cmp	r5, #2
	movls	r5, #0
	andhi	r5, r3, #1
	cmp	r5, #0
	movne	r0, #1
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L164:
	mov	r1, r2
	mov	r0, r4
	mov	r2, r6
	bl	PostPro_GetH264RepairParam
	b	.L171
.L166:
	mov	r1, r2
	mov	r0, r4
	mov	r2, r6
	bl	PostPro_GetMPEG4RepairParam
	b	.L171
.L167:
	mov	r1, r2
	mov	r0, r4
	mov	r2, r6
	bl	PostPro_GetMPEG2RepairParam
	b	.L171
.L168:
	str	r0, [sp]
	movw	r1, #1757
	ldr	r3, .L186+8
	mov	r0, #0
	ldr	r2, .L186+4
	bl	dprint_normal
	b	.L171
.L169:
	str	r0, [sp]
	movw	r1, #1780
	ldr	r3, .L186+12
	mov	r0, #0
	ldr	r2, .L186+4
	bl	dprint_normal
	b	.L171
.L163:
	str	r0, [sp]
	movw	r1, #1864
	ldr	r3, .L186+16
	mov	r0, #0
	ldr	r2, .L186+20
	bl	dprint_normal
	b	.L171
.L178:
	mov	r5, lr
	b	.L172
.L187:
	.align	2
.L186:
	.word	.LANCHOR0+24
	.word	.LC5
	.word	.LANCHOR0+52
	.word	.LANCHOR0+80
	.word	.LANCHOR0+112
	.word	.LC6
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
	ldr	r3, .L189
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
.L190:
	.align	2
.L189:
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
	beq	.L196
	ldr	ip, .L197
	mov	r2, #12
	mov	r1, #0
	sub	r0, fp, #48
	ldr	r5, [r3]
	ldr	r4, [ip, #48]
	ldr	r7, [r3, #4]
	ldr	r8, [r3, #8]
	blx	r4
	ldr	r1, .L197+4
	mov	r4, #820
	ldr	r2, .L197+8
	mov	r3, #3312
	ldr	r6, .L197+12
	mla	r4, r4, r5, r1
	ldr	r2, [r2, #136]
	str	r7, [fp, #-48]
	cmp	r2, #0
	str	r5, [fp, #-40]
	mla	r6, r3, r5, r6
	str	r4, [fp, #-44]
	beq	.L194
	sub	r0, fp, #48
	blx	r2
.L195:
	str	r5, [sp]
	mov	r3, r4
	mov	r2, r8
	mov	r1, r6
	mov	r0, r7
	bl	PostPro_GetRepairParam
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L194:
	movw	r3, #1945
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L197+16
	bl	dprint_normal
	b	.L195
.L196:
	ldr	r2, .L197+20
	movw	r1, #1927
	bl	dprint_normal
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L198:
	.align	2
.L197:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_DecReport
	.word	g_vdm_hal_fun_ptr
	.word	g_RepairParam
	.word	.LC8
	.word	.LC7
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
	beq	.L203
	cmp	r2, #0
	bne	.L204
	ldr	ip, .L205
	mov	r2, r4
	ldr	r4, .L205+4
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
.L201:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L204:
	str	r2, [sp]
	movw	r1, #1967
	ldr	r3, .L205+8
	mov	r0, #0
	ldr	r2, .L205+12
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L203:
	ldr	r3, .L205+8
	movw	r1, #1961
	ldr	r2, .L205+16
	mov	r0, r4
	bl	dprint_normal
	mov	r0, r4
	b	.L201
.L206:
	.align	2
.L205:
	.word	g_DecReport
	.word	g_RepairParam
	.word	.LANCHOR0+136
	.word	.LC10
	.word	.LC9
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
	beq	.L210
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L210:
	ldr	r3, .L211
	movw	r1, #1988
	ldr	r2, .L211+4
	bl	dprint_normal
	mov	r0, #2
	ldmfd	sp, {fp, sp, pc}
.L212:
	.align	2
.L211:
	.word	.LANCHOR0+160
	.word	.LC9
	UNWIND(.fnend)
	.size	PostPro_GetRepairStratage, .-PostPro_GetRepairStratage
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.8882, %object
	.size	__func__.8882, 23
__func__.8882:
	.ascii	"PostPro_GetMp24MbGroup\000"
	.space	1
	.type	__func__.8984, %object
	.size	__func__.8984, 27
__func__.8984:
	.ascii	"PostProc_GetVPxRepairParam\000"
	.space	1
	.type	__func__.8993, %object
	.size	__func__.8993, 28
__func__.8993:
	.ascii	"PostProc_GetAVSxRepairParam\000"
	.type	__func__.9002, %object
	.size	__func__.9002, 29
__func__.9002:
	.ascii	"PostProc_GetREALxRepairParam\000"
	.space	3
	.type	__func__.9025, %object
	.size	__func__.9025, 23
__func__.9025:
	.ascii	"PostPro_GetRepairParam\000"
	.space	1
	.type	__func__.9051, %object
	.size	__func__.9051, 22
__func__.9051:
	.ascii	"PostPro_SetFullRepair\000"
	.space	2
	.type	__func__.9057, %object
	.size	__func__.9057, 26
__func__.9057:
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
	ASCII(.ascii	"%s VidStd %d not belong here!\012\000" )
	.space	1
.LC6:
	ASCII(.ascii	"%s VidStd %d Err!\012\000" )
	.space	1
.LC7:
	ASCII(.ascii	"PostPro_GetErrRatio: pParam = NULL\012\000" )
.LC8:
	ASCII(.ascii	"VDMHAL_NULL_FUN_PRINT,L%d\012\000" )
	.space	1
.LC9:
	ASCII(.ascii	"%s pDecParam is null\012\000" )
	.space	2
.LC10:
	ASCII(.ascii	"%s VdhId %d invalid!\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
