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
	.file	"fsp.c"
	.text
	.align	2
	.type	FSP_ClearContext, %function
FSP_ClearContext:
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
	subs	r5, r0, #0
	beq	.L5
	ldr	r6, .L6
	mov	r4, #0
	mov	r0, #8
	ldr	r3, [r6, #12]
	blx	r3
	strb	r4, [r5, #2]
	strb	r4, [r5, #4]
	mov	r1, r4
	strb	r4, [r5, #5]
	mov	r2, #20
	strb	r4, [r5, #3]
	add	r0, r5, #36
	str	r4, [r5, #12]
	str	r4, [r5, #8]
	str	r4, [r5, #16]
	str	r4, [r5, #20]
	str	r4, [r5, #24]
	str	r4, [r5, #32]
	ldr	r3, [r6, #48]
	blx	r3
	ldr	r3, [r6, #48]
	mov	r1, r4
	mov	r2, #92
	add	r0, r5, #56
	blx	r3
	add	r0, r5, #21760
	ldr	r3, [r6, #48]
	mov	r1, r4
	mov	r2, #2944
	add	r0, r0, #152
	blx	r3
	add	r0, r5, #24832
	ldr	r3, [r6, #48]
	mov	r1, r4
	mov	r2, #2944
	add	r0, r0, #24
	blx	r3
	add	r0, r5, #27648
	ldr	r3, [r6, #48]
	mov	r1, r4
	mov	r2, #256
	add	r0, r0, #152
	blx	r3
	ldr	r3, [r6, #16]
	mov	r0, #8
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L5:
	ldr	r3, .L6+4
	mov	r2, #132
	ldr	r1, .L6+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L7:
	.align	2
.L6:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC0
	.word	.LC1
	UNWIND(.fnend)
	.size	FSP_ClearContext, .-FSP_ClearContext
	.align	2
	.global	FSP_Init
	.type	FSP_Init, %function
FSP_Init:
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
	ldr	r3, .L9
	mov	r2, #128
	mov	r1, #0
	ldr	r0, .L9+4
	ldr	r3, [r3, #48]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L10:
	.align	2
.L9:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	FSP_Init, .-FSP_Init
	.align	2
	.global	FSP_ConfigAttribute
	.type	FSP_ConfigAttribute, %function
FSP_ConfigAttribute:
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
	cmp	r0, #31
	bhi	.L15
	ldr	r3, .L17
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r3, #28]
	cmp	r2, #1
	bne	.L16
	ldrb	r2, [r1]	@ zero_extendqisi2
	mov	r0, #0
	strb	r2, [r3, #1]
	ldmfd	sp, {fp, sp, pc}
.L16:
	ldr	r3, .L17+4
	movw	r2, #349
	ldr	r1, .L17+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L15:
	ldr	r3, .L17+12
	mov	r2, #348
	ldr	r1, .L17+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.word	.LC3
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	FSP_ConfigAttribute, .-FSP_ConfigAttribute
	.align	2
	.global	FSP_ClearContextAll
	.type	FSP_ClearContextAll, %function
FSP_ClearContextAll:
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
	cmp	r0, #31
	bhi	.L23
	ldr	r3, .L25
	ldr	r4, [r3, r0, asl #2]
	cmp	r4, #0
	beq	.L24
	ldr	r3, .L25+4
	movw	r2, #28056
	ldrb	r7, [r4, #3]	@ zero_extendqisi2
	mov	r1, #0
	ldrb	r6, [r4, #5]	@ zero_extendqisi2
	mov	r0, r4
	ldrb	r10, [r4]	@ zero_extendqisi2
	ldrb	r9, [r4, #1]	@ zero_extendqisi2
	ldr	r8, [r4, #28]
	ldr	r5, [r4, #32]
	ldr	r3, [r3, #48]
	blx	r3
	mov	r0, #0
	strb	r10, [r4]
	strb	r9, [r4, #1]
	str	r8, [r4, #28]
	strb	r7, [r4, #3]
	strb	r6, [r4, #5]
	str	r5, [r4, #32]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L23:
	ldr	r3, .L25+8
	movw	r2, #369
	ldr	r1, .L25+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L24:
	mov	r0, r4
	ldr	r3, .L25+16
	movw	r2, #370
	ldr	r1, .L25+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC2
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_ClearContextAll, .-FSP_ClearContextAll
	.align	2
	.global	FSP_EnableInstance
	.type	FSP_EnableInstance, %function
FSP_EnableInstance:
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
	cmp	r0, #31
	mov	r5, r0
	mov	r4, r1
	bhi	.L31
	ldr	r7, .L33
	ldr	r6, [r7, r0, asl #2]
	cmp	r6, #0
	bne	.L32
	ldr	r3, .L33+4
	movw	r2, #28056
	mov	r1, r6
	mov	r0, r4
	ldr	r3, [r3, #48]
	blx	r3
	strb	r5, [r4]
	mov	r3, #1
	str	r6, [r4, #32]
	str	r3, [r4, #28]
	mov	r0, r6
	str	r4, [r7, r5, asl #2]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L32:
	ldr	r3, .L33+8
	mov	r2, #396
	ldr	r1, .L33+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L31:
	ldr	r3, .L33+16
	movw	r2, #395
	ldr	r1, .L33+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC5
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	FSP_EnableInstance, .-FSP_EnableInstance
	.align	2
	.global	FSP_DisableInstance
	.type	FSP_DisableInstance, %function
FSP_DisableInstance:
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
	cmp	r0, #31
	bhi	.L39
	ldr	r2, .L41
	ldr	r3, [r2, r0, asl #2]
	cmp	r3, #0
	beq	.L40
	ldr	r1, [r3, #28]
	cmp	r1, #1
	moveq	r1, #0
	streq	r1, [r3, #28]
	mov	r3, #0
	str	r3, [r2, r0, asl #2]
	ldmfd	sp, {fp, sp, pc}
.L39:
	ldr	r3, .L41+4
	mov	r2, #412
	ldr	r1, .L41+8
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L40:
	mov	r0, r3
	movw	r2, #413
	ldr	r3, .L41+12
	ldr	r1, .L41+8
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L42:
	.align	2
.L41:
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_DisableInstance, .-FSP_DisableInstance
	.align	2
	.global	FSP_Exit
	.type	FSP_Exit, %function
FSP_Exit:
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
	ldr	r5, .L54
	mov	r4, #0
	b	.L45
.L44:
	add	r4, r4, #1
	cmp	r4, #32
	beq	.L53
.L45:
	ldr	r3, [r5, #4]!
	cmp	r3, #0
	beq	.L44
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L44
	mov	r0, r4
	add	r4, r4, #1
	bl	FSP_DisableInstance
	cmp	r4, #32
	bne	.L45
.L53:
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L55:
	.align	2
.L54:
	.word	.LANCHOR0-4
	UNWIND(.fnend)
	.size	FSP_Exit, .-FSP_Exit
	.align	2
	.global	FSP_ResetInstance
	.type	FSP_ResetInstance, %function
FSP_ResetInstance:
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
	cmp	r0, #31
	bhi	.L60
	ldr	r3, .L62
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L61
	bl	FSP_ClearContext
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L60:
	ldr	r3, .L62+4
	movw	r2, #431
	ldr	r1, .L62+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L61:
	ldr	r3, .L62+12
	mov	r2, #432
	ldr	r1, .L62+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L63:
	.align	2
.L62:
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_ResetInstance, .-FSP_ResetInstance
	.align	2
	.global	FSP_ConfigInstance
	.type	FSP_ConfigInstance, %function
FSP_ConfigInstance:
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
	cmp	r0, #31
	mov	r5, r0
	mov	r7, r1
	bhi	.L79
	cmp	r1, #0
	beq	.L80
	ldr	r3, .L84
	ldr	r6, [r3, r0, asl #2]
	cmp	r6, #0
	beq	.L68
	ldr	r3, [r6, #28]
	cmp	r3, #1
	bne	.L68
	mov	r3, r0, asl #3
	ldr	r4, .L84+4
	mov	r0, r0, asl #6
	ldr	r1, [r1, #4]
	add	r2, r3, r0
	add	r2, r4, r2
	ldr	ip, [r2, #36]
	cmp	ip, r1
	beq	.L81
.L70:
	add	r3, r3, r0
	ldr	r8, .L84+8
	add	r4, r4, r3
	ldr	r0, .L84+4
	add	r9, r4, #24
	ldr	r1, [r4, #24]
	cmp	r1, #0
	beq	.L82
.L71:
	ldr	r3, .L84+12
	ldr	r3, [r3, r5, asl #2]
	add	r3, r3, #471040
	ldr	r3, [r3, #1560]
	cmp	r3, #0
	beq	.L83
.L72:
	ldr	r3, [r8, #52]
	mov	r1, r7
	add	r0, r6, #36
	mov	r2, #20
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L83:
	mov	r0, r6
	bl	FSP_ClearContext
	b	.L72
.L81:
	ldr	r1, [r2, #40]
	ldr	r2, [r7, #8]
	cmp	r1, r2
	ldreq	r8, .L84+8
	bne	.L70
	b	.L71
.L82:
	add	r3, r3, #24
	mov	r2, #48
	add	r0, r0, r3
	ldr	r3, [r8, #48]
	blx	r3
	ldr	r3, [r8]
	mov	r2, #1
	str	r2, [r4, #24]
	blx	r3
	str	r0, [r4, #44]
	ldr	r3, [r6, #40]
	str	r3, [r9, #4]
	ldr	r3, [r6, #44]
	str	r3, [r4, #32]
	ldr	r3, [r7, #4]
	str	r3, [r4, #36]
	ldr	r3, [r7, #8]
	str	r3, [r4, #40]
	b	.L71
.L68:
	ldr	r3, .L84+16
	movw	r2, #570
	ldr	r1, .L84+20
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L79:
	ldr	r3, .L84+24
	movw	r2, #567
	ldr	r1, .L84+20
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L80:
	mov	r0, r1
	ldr	r3, .L84+28
	mov	r2, #568
	ldr	r1, .L84+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L85:
	.align	2
.L84:
	.word	.LANCHOR0
	.word	g_VfmwChanStat
	.word	vfmw_Osal_Func_Ptr_S
	.word	s_pstVfmwChan
	.word	.LC7
	.word	.LC1
	.word	.LC2
	.word	.LC6
	UNWIND(.fnend)
	.size	FSP_ConfigInstance, .-FSP_ConfigInstance
	.align	2
	.global	FSP_ConfigFrameBuf
	.type	FSP_ConfigFrameBuf, %function
FSP_ConfigFrameBuf:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #60)
	sub	sp, sp, #60
	mov	r10, r2
	ldr	r2, .L137
	mov	r9, r0
	ldr	r4, .L137+4
	str	r1, [fp, #-48]
	mov	r1, #0
	ldr	r5, [r2, #48]
	add	r0, r4, #128
	mov	r2, #1232
	str	r3, [fp, #-76]
	blx	r5
	cmp	r9, #31
	bhi	.L129
	ldr	r5, [r4, r9, asl #2]
	cmp	r5, #0
	beq	.L130
	ldr	r3, .L137+8
	ldr	r0, [r5, #40]
	ldr	ip, [r5, #44]
	ldr	r1, [r3, r9, asl #2]
	mul	r6, ip, r0
	ldr	r2, [r1, #148]
	ldr	r3, [r1, #152]
	mul	lr, r3, r2
	cmp	r6, lr
	bgt	.L131
	ldr	r3, [r1, #1504]
	ldrsb	r7, [r5, #37]
	cmp	r3, #1
	beq	.L132
.L91:
	add	r1, r1, #471040
	ldr	r2, .L137+12
	ldr	r3, [r1, #1568]
	ldr	r8, [r2, #64]
	cmp	r7, r3
	movne	r3, #1
	moveq	r3, #0
	str	r3, [r1, #1584]
	cmp	r8, #0
	ldrsb	r3, [r5, #37]
	str	r3, [r1, #1568]
	beq	.L95
	ldr	r6, .L137+4
	mov	r1, r10
	ldr	r3, [r5, #44]
	mov	lr, #32
	ldr	r2, [r5, #40]
	add	r10, r6, #128
	str	r9, [sp, #12]
	str	r10, [sp, #16]
	ldrsb	ip, [r5, #36]
	str	lr, [sp, #4]
	ldr	r0, [fp, #-48]
	str	ip, [sp, #8]
	ldrsb	ip, [r5, #39]
	str	ip, [sp]
	blx	r8
	ldr	r3, .L137+8
	ldr	r2, .L137+8
	ldr	r3, [r3, r9, asl #2]
	add	r3, r3, #471040
	ldr	r3, [r3, #3952]
	cmp	r3, #32
	movge	r3, #32
	strb	r3, [r5, #5]
	cmp	r0, #2
	mov	r8, r0
	beq	.L133
	cmp	r0, #0
	bne	.L98
	ldr	r3, [r6, #176]
	mov	r0, #31
	ldr	r1, .L137+16
	strb	r3, [r5, #2]
	ldr	r3, [r2, r9, asl #2]
	str	r8, [r3, #1560]
	strb	r8, [r3, #1584]
	bl	dprint_vfmw
	ldr	r3, [r6, #176]
	cmp	r7, r3
	bgt	.L134
	strb	r8, [r5, #4]
	mov	r0, #8
	ldr	r3, [r6, #176]
	cmp	r3, #32
	movge	r3, #32
	strb	r3, [r5, #3]
	ldr	r3, .L137
	ldr	r3, [r3, #12]
	blx	r3
	ldr	r3, [r6, #188]
	cmp	r3, #0
	beq	.L135
	ldr	r3, [r6, #132]
	mov	r2, r8
	ldr	r1, [r5, #16]
	mov	r0, r10
	str	r3, [fp, #-64]
	add	r3, r6, #204
	str	r3, [fp, #-48]
	ldr	r3, [r6, #136]
	str	r3, [fp, #-68]
	ldr	r3, [r6, #140]
	str	r3, [fp, #-72]
	ldr	r3, [r5, #40]
	str	r3, [fp, #-56]
	ldr	r3, [r5, #44]
	str	r3, [fp, #-60]
.L106:
	mov	r3, #92
	ldr	ip, .L137+8
	mla	r3, r3, r1, r5
	ldr	r6, [fp, #-48]
	ldr	lr, [ip, r9, asl #2]
	ldr	r10, [fp, #-64]
	add	ip, r3, #21760
	mov	r3, #0
	str	lr, [fp, #-52]
	str	r1, [ip, #156]
	ldr	r7, [r0, #464]
	str	r7, [ip, #160]
	ldr	lr, [r0, #468]
	str	lr, [ip, #164]
	ldr	lr, [r6, #4]!
	str	r10, [ip, #180]
	ldr	r10, [fp, #-52]
	str	lr, [ip, #176]
	ldr	lr, [fp, #-68]
	add	r8, r10, #475136
	str	r6, [fp, #-48]
	str	lr, [ip, #184]
	ldr	lr, [r4, #148]
	str	lr, [ip, #188]
	ldr	lr, [r4, #156]
	str	lr, [ip, #192]
	ldr	lr, [r4, #160]
	str	lr, [ip, #196]
	ldr	lr, [fp, #-72]
	str	lr, [ip, #200]
	ldr	lr, [r4, #144]
	str	lr, [ip, #204]
	ldr	lr, [fp, #-56]
	str	lr, [ip, #208]
	ldr	lr, [fp, #-60]
	str	lr, [ip, #212]
	ldr	lr, [r4, #164]
	str	lr, [ip, #216]
	ldr	r7, [r4, #168]
	ldr	lr, [r4, #172]
	strb	r3, [ip, #153]
	str	r7, [ip, #220]
	str	lr, [ip, #224]
	strb	r3, [ip, #154]
	ldr	r3, [r8, #1612]
	ldr	r7, [r4, r9, asl #2]
	cmp	r3, #0
	bne	.L103
	ldr	ip, [r8, #1608]
	cmp	ip, #0
	beq	.L103
	ldr	ip, [r7, #16]
	mov	r1, r3
	mov	r3, #92
	mov	lr, r10
	mla	r7, r3, ip, r7
	add	r3, r7, #21760
	add	r7, r3, #152
	ldr	r6, [r3, #160]
.L105:
	mov	ip, r1, asl #4
	movw	r3, #17468
	movt	r3, 7
	add	r3, ip, r3
	add	r1, r1, #1
	ldr	r3, [lr, r3]
	cmp	r6, r3
	moveq	r3, #4
	streqb	r3, [r7, #2]
	ldr	r3, [r8, #1608]
	cmp	r1, r3
	bcc	.L105
	ldr	r3, [r5, #40]
	ldr	r1, [r5, #16]
	str	r3, [fp, #-56]
	ldr	r3, [r5, #44]
	str	r3, [fp, #-60]
.L103:
	mov	r3, #92
	mov	ip, #1
	mla	r3, r3, r1, r5
	add	r1, r1, #1
	add	r2, r2, #1
	add	r0, r0, #12
	add	r3, r3, #21760
	str	ip, [r3, #240]
	str	r1, [r5, #16]
	ldr	r3, [r4, #188]
	cmp	r3, r2
	bhi	.L106
.L102:
	ldr	r3, [r4, #196]
	cmp	r3, #0
	beq	.L111
	ldr	r3, [r5, #24]
	mov	r0, #92
	ldr	r1, .L137+20
	mov	r2, #0
	add	lr, r3, #1
	mla	r3, r0, r3, r5
	add	r3, r3, #21760
	add	r3, r3, #168
.L110:
	ldr	ip, [r1, #848]
	add	r0, lr, r2
	add	r2, r2, #1
	add	r1, r1, #12
	add	r3, r3, #92
	str	ip, [r3, #-92]
	ldr	ip, [r1, #840]
	str	ip, [r3, #-88]
	str	r0, [r5, #24]
	ldr	r0, [r4, #196]
	cmp	r0, r2
	bhi	.L110
.L111:
	ldr	r3, [r4, #184]
	cmp	r3, #32
	movge	r3, #32
	strb	r3, [r5, #5]
	ldr	r3, [r4, #192]
	cmp	r3, #0
	beq	.L109
	ldr	lr, [r5, #20]
	mov	r1, #0
	ldr	r0, .L137+20
	mov	r7, r1
	add	r2, lr, #3472
	add	lr, lr, #1
	add	r2, r2, #3
	mov	r6, #1
	add	r2, r5, r2, lsl #3
.L112:
	ldr	r3, [r0, #208]
	add	ip, lr, r1
	add	r1, r1, #1
	add	r0, r0, #8
	add	r2, r2, #8
	str	r3, [r2, #-8]
	ldr	r3, [r5, #20]
	add	r3, r3, #3472
	add	r3, r3, #3
	add	r3, r5, r3, lsl #3
	strb	r7, [r3, #5]
	strb	r6, [r2, #-4]
	str	ip, [r5, #20]
	ldr	r3, [r4, #192]
	cmp	r3, r1
	bhi	.L112
.L109:
	ldr	r2, [r4, #180]
	add	r3, r5, #20480
	mov	r8, #0
	str	r8, [r5, #60]
	str	r2, [r5, #8]
	mov	r2, #1
	ldr	r3, [r3, #1440]
	ldr	ip, [r4, #136]
	ldr	r0, [r4, #148]
	str	r3, [r5, #64]
	ldr	r3, [fp, #-56]
	ldr	r1, [r4, #156]
	str	ip, [r5, #88]
	str	r3, [r5, #112]
	ldr	r3, [fp, #-60]
	ldr	lr, [r4, #164]
	str	r0, [r5, #92]
	str	r3, [r5, #116]
	ldr	r3, [r4, #160]
	ldr	r0, [r4, #168]
	str	r1, [r5, #96]
	ldr	ip, [r4, #172]
	str	r3, [r5, #100]
	ldr	r1, [r4, #132]
	ldr	r3, [r4, #128]
	str	r2, [r5, #144]
	ldr	r2, [fp, #-76]
	str	r0, [r5, #124]
	mov	r0, #8
	strb	r8, [r5, #57]
	strb	r8, [r5, #58]
	str	lr, [r5, #120]
	str	ip, [r5, #128]
	str	r1, [r5, #84]
	str	r3, [r2]
	ldr	r3, .L137
	ldr	r3, [r3, #16]
	blx	r3
	mov	r2, r8
.L124:
	mov	r0, r2
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L131:
	stmia	sp, {r0, ip}
	mov	r0, #0
	ldr	r1, .L137+24
	bl	dprint_vfmw
	ldr	r3, .L137+28
	ldr	r4, [r3]
	cmp	r4, #0
	mvneq	r2, #0
	beq	.L124
	mov	r3, #0
	mov	r0, r9
	mov	r2, r3
	mov	r1, #102
	blx	r4
	mvn	r2, #0
	mov	r0, r2
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L95:
	ldr	r3, [r1, #3952]
	mvn	r8, #0
	cmp	r3, #32
	movge	r3, #32
	strb	r3, [r5, #5]
.L98:
	ldr	r2, .L137+8
	mov	r3, #0
	strb	r3, [r5, #2]
	mov	r0, r3
	ldr	r1, .L137+32
	ldr	ip, [r2, r9, asl #2]
	mov	r2, r8
	str	r3, [ip, #1560]
	strb	r3, [ip, #1584]
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L124
.L132:
	add	r3, r1, #442368
	ldr	r3, [r3, #2208]
	bics	r2, r3, #2
	beq	.L91
	cmp	r3, #1
	moveq	r2, #0
	beq	.L124
	mov	r3, #0
	strb	r3, [r5, #2]
	ldr	r3, .L137+8
	mov	r0, #31
	ldr	r1, .L137+36
	ldr	r3, [r3, r9, asl #2]
	add	r3, r3, #442368
	ldr	r2, [r3, #2208]
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L124
.L133:
	ldr	r1, [r6, #176]
	mov	r3, r9, asl #6
	ldr	r4, .L137+40
	add	r3, r3, r9, lsl #3
	strb	r1, [r5, #2]
	add	r4, r4, r3
	ldr	r3, [r2, r9, asl #2]
	mov	r2, #1
	str	r2, [r3, #1560]
	strb	r2, [r3, #1584]
	ldr	r3, [r4, #24]
	cmp	r3, r2
	beq	.L136
.L116:
	mov	r2, r8
	mov	r0, r2
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L135:
	ldr	r3, [r5, #40]
	str	r3, [fp, #-56]
	ldr	r3, [r5, #44]
	str	r3, [fp, #-60]
	b	.L102
.L136:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L116
	ldr	r3, .L137
	ldr	r3, [r3]
	blx	r3
	str	r8, [r4, #24]
	mov	r2, r8
	str	r0, [r4, #48]
	b	.L124
.L129:
	mov	r2, #612
	ldr	r3, .L137+44
	ldr	r1, .L137+48
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L124
.L134:
	str	r3, [sp]
	mov	r2, r8
	mov	r3, r7
	mov	r0, r8
	ldr	r1, .L137+52
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L124
.L130:
	movw	r2, #613
	mov	r0, r5
	ldr	r3, .L137+56
	ldr	r1, .L137+48
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L124
.L138:
	.align	2
.L137:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	.word	g_vdm_hal_fun_ptr
	.word	.LC10
	.word	.LANCHOR0+128
	.word	.LC8
	.word	g_event_report
	.word	.LC11
	.word	.LC9
	.word	g_VfmwChanStat
	.word	.LC2
	.word	.LC1
	.word	.LC12
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_ConfigFrameBuf, .-FSP_ConfigFrameBuf
	.align	2
	.global	FSP_GetOccupiedNum
	.type	FSP_GetOccupiedNum, %function
FSP_GetOccupiedNum:
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
	cmp	r2, #31
	bhi	.L145
	cmp	r0, #1088
	bgt	.L143
	ldr	r3, .L146
	ldr	r3, [r3, r2, asl #2]
	add	r3, r3, #475136
	ldr	r3, [r3, #1668]
	cmp	r3, #0
	movne	r0, #1
	moveq	r0, #4
	ldmfd	sp, {fp, sp, pc}
.L143:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L145:
	ldr	r3, .L146+4
	mov	r2, #788
	ldr	r1, .L146+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L147:
	.align	2
.L146:
	.word	s_pstVfmwChan
	.word	.LC2
	.word	.LC1
	UNWIND(.fnend)
	.size	FSP_GetOccupiedNum, .-FSP_GetOccupiedNum
	.align	2
	.global	FSP_IsPmvAvailable
	.type	FSP_IsPmvAvailable, %function
FSP_IsPmvAvailable:
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
	ldrh	r0, [r0, #4]
	sub	r0, r0, #1
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FSP_IsPmvAvailable, .-FSP_IsPmvAvailable
	.align	2
	.global	FSP_GetPhyFsNum
	.type	FSP_GetPhyFsNum, %function
FSP_GetPhyFsNum:
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
	cmp	r0, #31
	mov	r6, r0
	mov	r4, r1
	bhi	.L159
	ldr	r7, .L162
	ldr	r0, [r7, r0, asl #2]
	cmp	r0, #0
	beq	.L160
	ldr	r8, .L162+4
	mov	r0, #3
	mov	r5, #0
	ldr	r3, [r8, #12]
	blx	r3
	ldr	ip, [r7, r6, asl #2]
	add	r3, ip, #21760
	add	ip, ip, #24832
	add	r3, r3, #240
	add	ip, ip, #112
	b	.L154
.L153:
	add	r3, r3, #92
	cmp	r3, ip
	beq	.L161
.L154:
	ldr	r2, [r3]
	cmp	r2, #1
	bne	.L153
	ldr	r2, [r3, #-76]
	add	r3, r3, #92
	cmp	r4, #0
	cmpne	r2, r4
	addeq	r5, r5, #1
	cmp	r3, ip
	bne	.L154
.L161:
	ldr	r3, [r8, #16]
	mov	r0, #3
	blx	r3
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L159:
	ldr	r3, .L162+8
	movw	r2, #1073
	ldr	r1, .L162+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L160:
	ldr	r3, .L162+16
	movw	r2, #1074
	ldr	r1, .L162+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L163:
	.align	2
.L162:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC2
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_GetPhyFsNum, .-FSP_GetPhyFsNum
	.align	2
	.global	FSP_RelsePhyFs
	.type	FSP_RelsePhyFs, %function
FSP_RelsePhyFs:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
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
	cmp	r0, #31
	mov	r5, r0
	mov	r7, r1
	bhi	.L197
	ldr	r8, .L199
	ldr	r0, [r8, r0, asl #2]
	cmp	r0, #0
	beq	.L198
	ldr	r6, .L199+4
	mov	r0, #3
	mov	r4, #0
	ldr	r3, [r6, #12]
	blx	r3
	ldr	r1, [r8, r5, asl #2]
	add	r3, r1, #21760
	add	r3, r3, #240
	b	.L171
.L168:
	add	r4, r4, #1
	add	r3, r3, #92
	cmp	r4, #32
	beq	.L195
.L171:
	ldr	r2, [r3]
	cmp	r2, #1
	bne	.L168
	ldrsb	r2, [r3, #-87]
	cmp	r2, #0
	bne	.L168
	ldrsb	r2, [r3, #-86]
	cmp	r2, #0
	bne	.L168
	ldr	r0, [r3, #-76]
	cmp	r0, r7
	beq	.L168
	mov	r0, #92
	movw	r3, #21920
	mla	r1, r0, r4, r1
	str	r2, [fp, #-76]
	add	r8, r1, #21760
	add	r8, r8, #160
	ldr	r9, [r1, r3]
	str	r1, [fp, #-72]
	mov	r0, r9
	bl	MEM_Phy2Vir
	cmp	r4, #31
	ldr	r8, [r8, #4]
	ldr	r1, [fp, #-72]
	ldr	r2, [fp, #-76]
	mov	r7, r0
	bgt	.L195
	ldr	r10, .L199+8
	movw	r3, #22000
	str	r2, [r1, r3]
	mov	r2, r8
	mov	r1, r0
	mov	r0, r9
	bl	MEM_DelMemRecord
	mov	r2, r4, asl #6
	ldr	r3, [r10, r5, asl #2]
	add	r4, r2, r4, lsl #3
	add	r3, r3, r4
	add	r2, r3, #471040
	ldr	r2, [r2, #1600]
	cmp	r2, #255
	beq	.L173
	movw	r2, #13944
	movt	r2, 7
	ldr	r3, [r3, r2]
	mov	r0, r3
	str	r3, [fp, #-72]
	bl	MEM_Phy2Vir
	ldr	r1, [r10, r5, asl #2]
	movw	r2, #13896
	ldr	r3, [fp, #-72]
	add	r4, r1, r4
	movt	r2, 7
	add	r2, r4, r2
	ldr	r2, [r2, #4]
	mov	r1, r0
	mov	r0, r3
	bl	MEM_DelMemRecord
.L173:
	ldr	r3, [r6, #16]
	mov	r0, #3
	blx	r3
	ldr	r3, [r6, #12]
	mov	r0, #8
	blx	r3
	ldr	r0, [r10, r5, asl #2]
	mov	r2, #0
	add	r3, r0, #475136
	add	r3, r3, #272
	b	.L176
.L174:
	add	r2, r2, #1
	add	r3, r3, #12
	cmp	r2, #32
	beq	.L177
.L176:
	ldrb	r1, [r3]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L174
	ldr	r1, [r3, #-8]
	cmp	r9, r1
	bne	.L174
	cmp	r2, #31
	bgt	.L177
	mov	r1, r2, asl #4
	add	r3, r0, #471040
	sub	r2, r1, r2, asl #2
	movw	r1, #4368
	add	r3, r3, r2
	mov	r2, #0
	strb	r2, [r3, r1]
.L177:
	movw	r3, #13880
	mov	r4, #0
	movt	r3, 7
	add	r3, r0, r3
	b	.L180
.L178:
	add	r4, r4, #1
	add	r3, r3, #72
	cmp	r4, #32
	beq	.L181
.L180:
	ldr	r2, [r3]
	cmp	r2, #255
	beq	.L178
	ldr	r2, [r3, #32]
	cmp	r9, r2
	bne	.L178
	cmp	r4, #31
	bgt	.L181
	ldr	r1, .L199+12
	mov	r3, r4, asl #6
	add	r3, r3, r4, lsl #3
	movw	r2, #13880
	add	r0, r0, r3
	movt	r2, 7
	ldr	r10, [r1]
	mov	r3, #255
	str	r3, [r0, r2]
	cmp	r10, #0
	beq	.L181
	mov	ip, #0
	str	r9, [fp, #-68]
	mov	r0, r5
	str	r7, [fp, #-60]
	str	r8, [fp, #-52]
	mov	r3, #24
	str	ip, [fp, #-64]
	sub	r2, fp, #68
	str	ip, [fp, #-56]
	mov	r1, #123
	str	ip, [fp, #-48]
	blx	r10
.L181:
	ldr	r3, [r6, #16]
	mov	r0, #8
	blx	r3
	cmp	r4, #31
	movle	r0, #0
	mvngt	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L195:
	ldr	r3, [r6, #16]
	mov	r0, #3
	blx	r3
	mvn	r0, #0
.L194:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L197:
	ldr	r3, .L199+16
	movw	r2, #1100
	ldr	r1, .L199+20
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L194
.L198:
	ldr	r3, .L199+24
	movw	r2, #1101
	ldr	r1, .L199+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L194
.L200:
	.align	2
.L199:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	s_pstVfmwChan
	.word	g_event_report
	.word	.LC2
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_RelsePhyFs, .-FSP_RelsePhyFs
	.align	2
	.global	FSP_RemovePmv
	.type	FSP_RemovePmv, %function
FSP_RemovePmv:
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
	cmp	r0, #31
	ldrhi	r3, .L210
	movwhi	r2, #1183
	bhi	.L207
	cmp	r1, #31
	bhi	.L208
	ldr	r3, .L210+4
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L209
	mov	r3, #680
	mla	r3, r3, r1, r0
	ldr	r2, [r3, #176]
	cmp	r2, #2
	ldmnefd	sp, {fp, sp, pc}
	ldrb	r3, [r3, #156]	@ zero_extendqisi2
	cmp	r3, #31
	bhi	.L206
	sxtb	r3, r3
	mov	r2, #0
	add	r3, r3, #3472
	add	r3, r3, #3
	add	r3, r0, r3, lsl #3
	strb	r2, [r3, #5]
.L206:
	mov	r2, #680
	mov	r3, #0
	mla	r1, r2, r1, r0
	str	r3, [r1, #176]
	ldmfd	sp, {fp, sp, pc}
.L208:
	ldr	r3, .L210+8
	mov	r2, #1184
.L207:
	ldr	r1, .L210+12
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L209:
	ldr	r3, .L210+16
	movw	r2, #1185
	ldr	r1, .L210+12
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L211:
	.align	2
.L210:
	.word	.LC2
	.word	.LANCHOR0
	.word	.LC13
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_RemovePmv, .-FSP_RemovePmv
	.align	2
	.global	FSP_SetRef
	.type	FSP_SetRef, %function
FSP_SetRef:
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
	cmp	r0, #31
	mov	r6, r2
	mov	r4, r1
	ldrhi	r3, .L246
	movwhi	r2, #1208
	bhi	.L238
	cmp	r1, #31
	bhi	.L239
	ldr	r3, .L246+4
	ldr	r5, [r3, r0, asl #2]
	cmp	r5, #0
	beq	.L240
	mov	r3, #680
	uxtb	r2, r6
	mla	r3, r3, r1, r5
	ldrsb	r1, [r3, #154]
	strb	r2, [r3, #152]
	cmp	r1, #0
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r1, [r3, #180]
	cmp	r1, #0
	beq	.L218
	ldr	r3, [r3, #172]
	ldr	r0, [r1, #76]
	cmp	r0, r3
	streqb	r2, [r1, #1]
.L218:
	mov	r2, #680
	mla	r2, r2, r4, r5
	ldrb	r3, [r2, #156]	@ zero_extendqisi2
	cmp	r3, #31
	bhi	.L219
	cmp	r6, #1
	beq	.L241
	cmp	r6, #0
	bne	.L222
	ldr	r1, [r2, #176]
	cmp	r1, #2
	beq	.L242
.L229:
	mov	r3, #680
	mla	r3, r3, r4, r5
	ldr	r3, [r3, #184]
	cmp	r3, #0
	beq	.L232
	ldrsb	r2, [r3, #2]
	cmp	r2, #1
	moveq	r2, #0
	streqb	r2, [r3, #2]
.L232:
	mov	r3, #680
	mla	r4, r3, r4, r5
	str	r6, [r4, #180]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L239:
	ldr	r3, .L246+8
	movw	r2, #1209
.L238:
	ldr	r1, .L246+12
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L241:
	ldr	r1, [r2, #176]
	cmp	r1, #1
	beq	.L243
.L221:
	mov	r3, #680
	mla	r3, r3, r4, r5
	ldr	r2, [r3, #184]
	cmp	r2, #0
	beq	.L244
.L228:
	mov	r3, #680
	ldr	r0, [r2, #76]
	mla	r3, r3, r4, r5
	ldr	r1, [r3, #172]
	cmp	r6, #1
	cmpeq	r0, r1
	beq	.L245
.L225:
	cmp	r6, #0
	beq	.L232
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L219:
	sxtb	r3, r3
	movw	r2, #1257
	ldr	r1, .L246+16
	mov	r0, #0
	bl	dprint_vfmw
	cmp	r6, #0
	beq	.L229
	b	.L221
.L243:
	sxtb	r3, r3
	mov	r1, #2
	add	r3, r3, #3472
	add	r3, r3, #3
	add	r3, r5, r3, lsl #3
	strb	r6, [r3, #5]
	str	r1, [r2, #176]
.L222:
	mov	r3, #680
	mla	r3, r3, r4, r5
	ldr	r2, [r3, #184]
	cmp	r2, #0
	bne	.L228
	b	.L225
.L242:
	sxtb	r3, r3
	add	r3, r3, #3472
	add	r3, r3, #3
	add	r3, r5, r3, lsl #3
	strb	r6, [r3, #5]
	str	r6, [r2, #160]
	str	r6, [r2, #176]
	b	.L229
.L240:
	mov	r0, r5
	ldr	r3, .L246+20
	movw	r2, #1210
	ldr	r1, .L246+12
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L245:
	ldrsb	r1, [r2, #2]
	cmp	r1, #1
	moveq	r1, #2
	streqb	r1, [r2, #2]
	streqb	r1, [r3, #153]
	b	.L225
.L244:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L247:
	.align	2
.L246:
	.word	.LC2
	.word	.LANCHOR0
	.word	.LC13
	.word	.LC1
	.word	.LC14
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_SetRef, .-FSP_SetRef
	.align	2
	.global	FSP_GetRef
	.type	FSP_GetRef, %function
FSP_GetRef:
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
	cmp	r0, #31
	bhi	.L253
	cmp	r1, #31
	bhi	.L254
	ldr	r3, .L256
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L255
	mov	r0, #680
	mla	r1, r0, r1, r3
	ldrsb	r0, [r1, #152]
	ldmfd	sp, {fp, sp, pc}
.L253:
	ldr	r3, .L256+4
	movw	r2, #1289
	ldr	r1, .L256+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L254:
	ldr	r3, .L256+12
	movw	r2, #1290
	ldr	r1, .L256+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L255:
	mov	r0, r3
	movw	r2, #1291
	ldr	r3, .L256+16
	ldr	r1, .L256+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L257:
	.align	2
.L256:
	.word	.LANCHOR0
	.word	.LC15
	.word	.LC1
	.word	.LC16
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_GetRef, .-FSP_GetRef
	.align	2
	.global	FSP_SetDisplay
	.type	FSP_SetDisplay, %function
FSP_SetDisplay:
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
	cmp	r0, #31
	mov	r7, r2
	mov	r4, r0
	mov	r6, r1
	ldrhi	r3, .L291
	movwhi	r2, #1304
	bhi	.L285
	cmp	r1, #31
	bhi	.L286
	ldr	r5, .L291+4
	ldr	r0, [r5, r0, asl #2]
	cmp	r0, #0
	beq	.L287
	ldr	r8, .L291+8
	mov	r0, #3
	ldr	r3, [r8, #12]
	blx	r3
	ldr	r9, [r5, r4, asl #2]
	mov	r5, #680
	cmp	r7, #0
	mla	r5, r5, r6, r9
	moveq	r3, #0
	movne	r3, #3
	add	ip, r5, #152
	ldrsb	r0, [ip, #2]
	strb	r3, [ip, #1]
	cmp	r0, #0
	bne	.L271
	ldr	r3, [r5, #184]
	cmp	r3, #0
	beq	.L271
	ldr	r3, [r3, #76]
	ldr	r2, [r5, #172]
	cmp	r3, r2
	bne	.L288
	cmp	r7, #0
	bne	.L266
	strb	r7, [ip, #1]
	mov	r0, r4
	ldr	r3, [r5, #184]
	strb	r7, [r3, #2]
	bl	VCTRL_GetVidStd
	cmp	r0, #17
	beq	.L289
.L268:
	mov	r1, #680
	mov	r3, #0
	mla	r6, r1, r6, r9
	str	r3, [r6, #184]
.L271:
	ldr	r3, [r8, #16]
	mov	r0, #3
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L286:
	ldr	r3, .L291+12
	movw	r2, #1305
.L285:
	ldr	r1, .L291+16
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L266:
	mov	r0, r4
	bl	VCTRL_GetVidStd
	cmp	r0, #17
	beq	.L290
.L270:
	mov	r1, #680
	mov	r3, #3
	mla	r6, r1, r6, r9
	ldr	r2, [r6, #184]
	strb	r3, [r6, #153]
	strb	r3, [r2, #2]
	b	.L271
.L288:
	ldr	r1, .L291+20
	bl	dprint_vfmw
	b	.L271
.L287:
	ldr	r3, .L291+24
	movw	r2, #1306
	ldr	r1, .L291+16
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L290:
	ldr	r3, [r5, #184]
	cmp	r3, #0
	ldrne	r2, [r3, #84]
	addne	r2, r2, #1
	strne	r2, [r3, #84]
	b	.L270
.L289:
	ldr	r3, [r5, #184]
	cmp	r3, #0
	beq	.L268
	ldr	r2, [r3, #84]
	cmp	r2, #0
	beq	.L268
	sub	r2, r2, #1
	str	r2, [r3, #84]
	ldr	r3, [r5, #184]
	ldr	r2, [r3, #84]
	cmp	r2, #0
	movne	r2, #3
	strneb	r2, [r3, #2]
	b	.L268
.L292:
	.align	2
.L291:
	.word	.LC2
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC13
	.word	.LC1
	.word	.LC17
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_SetDisplay, .-FSP_SetDisplay
	.align	2
	.global	FSP_ClearNotInVoQueue
	.type	FSP_ClearNotInVoQueue, %function
FSP_ClearNotInVoQueue:
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
	cmp	r0, #31
	mov	r5, r0
	mov	r7, r1
	bhi	.L304
	cmp	r1, #0
	beq	.L305
	ldr	r3, .L308
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	addne	r6, r0, #21760
	addne	r4, r0, #192
	addne	r6, r6, #192
	bne	.L299
	b	.L306
.L298:
	add	r4, r4, #680
	cmp	r4, r6
	beq	.L307
.L299:
	mov	r2, #0
	ldr	r1, [r4, #148]
	mov	r0, r5
	bl	FSP_SetRef
	mov	r1, r4
	mov	r0, r7
	bl	IsImageInVoQueue
	cmp	r0, #0
	beq	.L298
	ldr	r1, [r4, #148]
	mov	r2, #0
	mov	r0, r5
	add	r4, r4, #680
	bl	FSP_SetDisplay
	cmp	r4, r6
	bne	.L299
.L307:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L304:
	ldr	r3, .L308+4
	movw	r2, #501
	ldr	r1, .L308+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L306:
	ldr	r3, .L308+12
	movw	r2, #503
	ldr	r1, .L308+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L305:
	mov	r0, r1
	ldr	r3, .L308+16
	movw	r2, #502
	ldr	r1, .L308+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L309:
	.align	2
.L308:
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC1
	.word	.LC4
	.word	.LC18
	UNWIND(.fnend)
	.size	FSP_ClearNotInVoQueue, .-FSP_ClearNotInVoQueue
	.align	2
	.global	FSP_GetDisplay
	.type	FSP_GetDisplay, %function
FSP_GetDisplay:
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
	cmp	r0, #31
	bhi	.L315
	ldr	r3, .L318
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L316
	cmp	r1, #31
	bhi	.L317
	mov	r0, #680
	mla	r1, r0, r1, r3
	ldrsb	r0, [r1, #153]
	ldmfd	sp, {fp, sp, pc}
.L315:
	ldr	r3, .L318+4
	movw	r2, #1379
	ldr	r1, .L318+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L317:
	ldr	r3, .L318+12
	movw	r2, #1381
	ldr	r1, .L318+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L316:
	mov	r0, r3
	movw	r2, #1380
	ldr	r3, .L318+16
	ldr	r1, .L318+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L319:
	.align	2
.L318:
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC1
	.word	.LC13
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_GetDisplay, .-FSP_GetDisplay
	.align	2
	.global	FSP_SetStoreType
	.type	FSP_SetStoreType, %function
FSP_SetStoreType:
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
	cmp	r0, #31
	bhi	.L329
	ldr	ip, .L333
	ldr	r0, [ip, r0, asl #2]
	cmp	r0, #0
	beq	.L330
	cmp	r2, #31
	bhi	.L331
	cmp	r1, #0
	bne	.L325
	ldrsb	ip, [r0, #3]
	cmp	r2, ip
	bge	.L328
	mov	lr, #92
	movw	ip, #21992
	mla	r2, lr, r2, r0
	mov	r0, r1
	str	r3, [r2, ip]
	ldmfd	sp, {fp, sp, pc}
.L325:
	cmp	r1, #1
	beq	.L332
.L328:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L332:
	ldrsb	r1, [r0, #4]
	cmp	r2, r1
	bge	.L328
	mov	ip, #92
	movw	r1, #24936
	mla	r2, ip, r2, r0
	mov	r0, #0
	str	r3, [r2, r1]
	ldmfd	sp, {fp, sp, pc}
.L329:
	ldr	r3, .L333+4
	movw	r2, #1394
	ldr	r1, .L333+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L331:
	ldr	r3, .L333+12
	movw	r2, #1396
	ldr	r1, .L333+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L330:
	ldr	r3, .L333+16
	movw	r2, #1395
	ldr	r1, .L333+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L334:
	.align	2
.L333:
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC1
	.word	.LC19
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_SetStoreType, .-FSP_SetStoreType
	.align	2
	.global	FSP_GetStoreType
	.type	FSP_GetStoreType, %function
FSP_GetStoreType:
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
	cmp	r0, #31
	bhi	.L344
	ldr	r3, .L348
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L345
	cmp	r2, #31
	bhi	.L346
	cmp	r1, #0
	bne	.L340
	ldrsb	r3, [r0, #3]
	cmp	r2, r3
	bge	.L343
	mov	r1, #92
	movw	r3, #21992
	mla	r2, r1, r2, r0
	ldr	r0, [r2, r3]
	ldmfd	sp, {fp, sp, pc}
.L344:
	ldr	r3, .L348+4
	movw	r2, #1425
	ldr	r1, .L348+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L346:
	ldr	r3, .L348+12
	movw	r2, #1427
	ldr	r1, .L348+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L340:
	cmp	r1, #1
	beq	.L347
.L343:
	mov	r0, #2
	ldmfd	sp, {fp, sp, pc}
.L345:
	ldr	r3, .L348+16
	movw	r2, #1426
	ldr	r1, .L348+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L347:
	ldrsb	r3, [r0, #4]
	cmp	r2, r3
	bge	.L343
	mov	r1, #92
	movw	r3, #24936
	mla	r2, r1, r2, r0
	ldr	r0, [r2, r3]
	ldmfd	sp, {fp, sp, pc}
.L349:
	.align	2
.L348:
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC1
	.word	.LC19
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_GetStoreType, .-FSP_GetStoreType
	.align	2
	.global	FSP_ClearLogicFs
	.type	FSP_ClearLogicFs, %function
FSP_ClearLogicFs:
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
	cmp	r0, #31
	cmpls	r1, #31
	mov	r4, r0
	mov	r5, r1
	ldmhifd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r6, .L360
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r2, #0
	bl	FSP_SetRef
	ldr	r2, [r6, r4, asl #2]
	mov	r3, #680
	mla	r3, r3, r5, r2
	ldrsb	r3, [r3, #153]
	cmp	r3, #3
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r1, r5
	mov	r0, r4
	mov	r2, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	FSP_SetDisplay
.L361:
	.align	2
.L360:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	FSP_ClearLogicFs, .-FSP_ClearLogicFs
	.align	2
	.global	FSP_GetLogicFs
	.type	FSP_GetLogicFs, %function
FSP_GetLogicFs:
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
	cmp	r0, #31
	cmpls	r1, #31
	movls	r3, #1
	movhi	r3, #0
	bhi	.L364
	ldr	r3, .L366
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	movne	r3, #680
	mlane	r1, r3, r1, r0
	addne	r0, r1, #152
	ldmfd	sp, {fp, sp, pc}
.L364:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L367:
	.align	2
.L366:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	FSP_GetLogicFs, .-FSP_GetLogicFs
	.align	2
	.global	FSP_GetFsImagePtr
	.type	FSP_GetFsImagePtr, %function
FSP_GetFsImagePtr:
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
	cmp	r0, #31
	cmpls	r1, #31
	movls	r3, #1
	movhi	r3, #0
	bhi	.L370
	ldr	r3, .L372
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	movne	r3, #680
	mlane	r1, r3, r1, r0
	addne	r0, r1, #192
	ldmfd	sp, {fp, sp, pc}
.L370:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L373:
	.align	2
.L372:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	FSP_GetFsImagePtr, .-FSP_GetFsImagePtr
	.align	2
	.global	FSP_GetDecPhyFs
	.type	FSP_GetDecPhyFs, %function
FSP_GetDecPhyFs:
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
	cmp	r0, #31
	cmpls	r1, #31
	movls	r3, #1
	movhi	r3, #0
	bhi	.L376
	ldr	r3, .L378
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	movne	r3, #680
	mlane	r0, r3, r1, r0
	ldrne	r0, [r0, #180]
	ldmfd	sp, {fp, sp, pc}
.L376:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L379:
	.align	2
.L378:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	FSP_GetDecPhyFs, .-FSP_GetDecPhyFs
	.align	2
	.global	FSP_GetDispPhyFs
	.type	FSP_GetDispPhyFs, %function
FSP_GetDispPhyFs:
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
	cmp	r0, #31
	cmpls	r1, #31
	movls	r3, #1
	movhi	r3, #0
	bhi	.L382
	ldr	r3, .L384
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	movne	r3, #680
	mlane	r0, r3, r1, r0
	ldrne	r0, [r0, #184]
	ldmfd	sp, {fp, sp, pc}
.L382:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L385:
	.align	2
.L384:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	FSP_GetDispPhyFs, .-FSP_GetDispPhyFs
	.align	2
	.global	FSP_GetPmvAddr
	.type	FSP_GetPmvAddr, %function
FSP_GetPmvAddr:
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
	cmp	r0, #31
	cmpls	r1, #31
	movls	r3, #1
	movhi	r3, #0
	bhi	.L388
	ldr	r3, .L390
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	movne	r3, #680
	mlane	r0, r3, r1, r0
	ldrne	r0, [r0, #160]
	ldmfd	sp, {fp, sp, pc}
.L388:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L391:
	.align	2
.L390:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	FSP_GetPmvAddr, .-FSP_GetPmvAddr
	.align	2
	.global	FSP_GetDecFsAddrTab
	.type	FSP_GetDecFsAddrTab, %function
FSP_GetDecFsAddrTab:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #31
	bhi	.L403
	ldr	lr, .L405
	ldr	ip, [lr, r0, asl #2]
	cmp	ip, #0
	moveq	r0, ip
	ldreq	r3, .L405+4
	movweq	r2, #1545
	beq	.L402
	cmp	r2, #0
	moveq	r0, r2
	ldreq	r3, .L405+8
	movweq	r2, #1546
	beq	.L402
	cmp	r1, #0
	beq	.L404
	ldrsb	ip, [ip, #3]
	cmp	ip, #0
	str	ip, [r1]
	ldr	ip, [lr, r0, asl #2]
	add	ip, ip, #21760
	add	ip, ip, #152
	ldmlefd	sp, {r4, fp, sp, pc}
	sub	r2, r2, #4
	sub	r3, r3, #4
	mov	lr, #0
.L399:
	ldr	r0, [ip, #8]
	add	lr, lr, #1
	add	ip, ip, #92
	str	r0, [r2, #4]!
	ldr	r4, [ip, #-68]
	str	r4, [r3, #4]!
	ldr	r4, [r1]
	cmp	r4, lr
	bgt	.L399
	ldmfd	sp, {r4, fp, sp, pc}
.L403:
	ldr	r3, .L405+12
	movw	r2, #1544
	ldr	r1, .L405+16
	mov	r0, #0
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	dprint_vfmw
.L404:
	ldr	r3, .L405+20
	mov	r0, r1
	movw	r2, #1547
.L402:
	ldr	r1, .L405+16
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	dprint_vfmw
.L406:
	.align	2
.L405:
	.word	.LANCHOR0
	.word	.LC4
	.word	.LC20
	.word	.LC2
	.word	.LC1
	.word	.LC21
	UNWIND(.fnend)
	.size	FSP_GetDecFsAddrTab, .-FSP_GetDecFsAddrTab
	.align	2
	.global	FSP_GetPmvAddrTab
	.type	FSP_GetPmvAddrTab, %function
FSP_GetPmvAddrTab:
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
	cmp	r0, #31
	bhi	.L418
	ldr	r3, .L420
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	ldreq	r3, .L420+4
	movweq	r2, #1569
	beq	.L417
	cmp	r2, #0
	moveq	r0, r2
	ldreq	r3, .L420+8
	movweq	r2, #1570
	beq	.L417
	cmp	r1, #0
	beq	.L419
	ldrsb	r3, [r0, #5]
	str	r3, [r1]
	ldrsb	r3, [r0, #5]
	cmp	r3, #0
	ldmlefd	sp, {fp, sp, pc}
	sub	r2, r2, #4
	mov	r1, #0
.L414:
	mov	r3, r1, asl #3
	add	r1, r1, #1
	add	r3, r3, #27648
	add	r3, r3, #152
	ldr	r3, [r0, r3]
	str	r3, [r2, #4]!
	ldrsb	r3, [r0, #5]
	cmp	r3, r1
	bgt	.L414
	ldmfd	sp, {fp, sp, pc}
.L418:
	ldr	r3, .L420+12
	mov	r2, #1568
	ldr	r1, .L420+16
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L419:
	ldr	r3, .L420+20
	mov	r0, r1
	movw	r2, #1571
.L417:
	ldr	r1, .L420+16
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L421:
	.align	2
.L420:
	.word	.LANCHOR0
	.word	.LC4
	.word	.LC22
	.word	.LC2
	.word	.LC1
	.word	.LC23
	UNWIND(.fnend)
	.size	FSP_GetPmvAddrTab, .-FSP_GetPmvAddrTab
	.align	2
	.global	FSP_GetInstInfo
	.type	FSP_GetInstInfo, %function
FSP_GetInstInfo:
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
	cmp	r0, #31
	mov	ip, r1
	bhi	.L425
	ldr	r3, .L427
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L426
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	add	r4, r3, #20480
	ldr	r5, .L427+4
	add	r1, r3, #21760
	add	r1, r1, #152
	add	r0, ip, #8
	strb	r2, [ip, #2]
	mov	r2, #2944
	ldr	lr, [r4, #1532]
	ldr	r4, [r4, #1440]
	rsb	lr, r4, lr
	str	lr, [ip, #4]
	ldrb	lr, [r3, #4]	@ zero_extendqisi2
	strb	lr, [ip, #3]
	ldrb	lr, [r3]	@ zero_extendqisi2
	strb	lr, [ip]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	strb	r3, [ip, #1]
	ldr	r3, [r5, #52]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L425:
	ldr	r3, .L427+8
	movw	r2, #1588
	ldr	r1, .L427+12
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L426:
	mov	r0, r3
	movw	r2, #1589
	ldr	r3, .L427+16
	ldr	r1, .L427+12
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L428:
	.align	2
.L427:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC2
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_GetInstInfo, .-FSP_GetInstInfo
	.align	2
	.global	FSP_GetLogicIdByPhyAddr
	.type	FSP_GetLogicIdByPhyAddr, %function
FSP_GetLogicIdByPhyAddr:
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
	cmp	r0, #31
	bhi	.L440
	ldr	r3, .L442
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	movne	r3, r0
	movne	r0, #0
	beq	.L441
.L434:
	ldr	r2, [r3, #180]
	add	r3, r3, #680
	cmp	r2, #0
	beq	.L433
	ldr	r2, [r2, #8]
	cmp	r2, r1
	ldmeqfd	sp, {fp, sp, pc}
.L433:
	add	r0, r0, #1
	cmp	r0, #32
	bne	.L434
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L440:
	ldr	r3, .L442+4
	movw	r2, #1610
	ldr	r1, .L442+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L441:
	ldr	r3, .L442+12
	movw	r2, #1611
	ldr	r1, .L442+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L443:
	.align	2
.L442:
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_GetLogicIdByPhyAddr, .-FSP_GetLogicIdByPhyAddr
	.align	2
	.global	FSP_GetNullLogicFs
	.type	FSP_GetNullLogicFs, %function
FSP_GetNullLogicFs:
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
	cmp	r0, #31
	bhi	.L457
	ldr	r3, .L460
	ldr	ip, [r3, r0, asl #2]
	cmp	ip, #0
	beq	.L447
	add	r3, ip, #20992
	ldrsb	r3, [r3, #241]
	cmp	r3, #0
	addne	r2, ip, #20480
	movne	r3, #30
	addne	r2, r2, #73
	bne	.L452
	b	.L458
.L450:
	subs	r3, r3, #1
	bcc	.L459
.L452:
	ldrsb	r1, [r2]
	sub	r2, r2, #680
	cmp	r1, #0
	bne	.L450
.L451:
	mov	r2, #680
	mov	r0, r3
	mla	r3, r2, r3, ip
	mov	r2, #0
	str	r2, [r3, #180]
	str	r2, [r3, #184]
	ldmfd	sp, {fp, sp, pc}
.L459:
	mov	r3, #0
	b	.L451
.L458:
	mov	r3, #31
	b	.L451
.L457:
	ldr	r3, .L460+4
	movw	r2, #1637
	ldr	r1, .L460+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L447:
	mov	r0, ip
	ldr	r3, .L460+12
	movw	r2, #1638
	ldr	r1, .L460+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L461:
	.align	2
.L460:
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_GetNullLogicFs, .-FSP_GetNullLogicFs
	.align	2
	.global	FSP_GetFspType
	.type	FSP_GetFspType, %function
FSP_GetFspType:
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
	cmp	r0, #31
	bhi	.L466
	ldr	r3, .L468
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L467
	ldr	r0, [r0, #28]
	subs	r0, r0, #1
	mvnne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L466:
	ldr	r3, .L468+4
	movw	r2, #1659
	ldr	r1, .L468+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L467:
	ldr	r3, .L468+12
	movw	r2, #1660
	ldr	r1, .L468+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L469:
	.align	2
.L468:
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_GetFspType, .-FSP_GetFspType
	.align	2
	.global	FSP_GetTotalValidFsNum
	.type	FSP_GetTotalValidFsNum, %function
FSP_GetTotalValidFsNum:
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
	cmp	r0, #31
	bhi	.L474
	ldr	r3, .L476
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L475
	ldrsb	r0, [r0, #2]
	ldmfd	sp, {fp, sp, pc}
.L474:
	ldr	r3, .L476+4
	movw	r2, #1674
	ldr	r1, .L476+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L475:
	ldr	r3, .L476+12
	movw	r2, #1675
	ldr	r1, .L476+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L477:
	.align	2
.L476:
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_GetTotalValidFsNum, .-FSP_GetTotalValidFsNum
	.align	2
	.global	FSP_IsSpecialFrm
	.type	FSP_IsSpecialFrm, %function
FSP_IsSpecialFrm:
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
	cmp	r0, #31
	bhi	.L489
	ldr	r3, .L490
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	sub	r3, r1, #1
	cmn	r3, #3
	bhi	.L484
	add	r3, r0, #475136
	ldr	lr, [r3, #1608]
	cmp	lr, #0
	beq	.L484
	ldr	r3, [r3, #1084]
	cmp	r3, r1
	beq	.L487
	mov	r2, #0
	b	.L481
.L482:
	ldr	r3, [r0, r3]
	cmp	r3, r1
	beq	.L487
.L481:
	add	r2, r2, #1
	movw	r3, #17468
	cmp	r2, lr
	movt	r3, 7
	mov	ip, r2, asl #4
	add	r3, ip, r3
	bne	.L482
.L484:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L487:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L489:
	ldr	r3, .L490+4
	movw	r2, #1685
	ldr	r1, .L490+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L491:
	.align	2
.L490:
	.word	s_pstVfmwChan
	.word	.LC2
	.word	.LC1
	UNWIND(.fnend)
	.size	FSP_IsSpecialFrm, .-FSP_IsSpecialFrm
	.align	2
	.global	FSP_EmptyInstance
	.type	FSP_EmptyInstance, %function
FSP_EmptyInstance:
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
	cmp	r0, #31
	mov	r7, r0
	bhi	.L512
	ldr	r3, .L514
	ldr	r6, [r3, r0, asl #2]
	cmp	r6, #0
	beq	.L513
	ldr	r3, .L514+4
	mov	r2, #21760
	mov	r1, #0
	add	r0, r6, #152
	ldr	r3, [r3, #48]
	blx	r3
	ldrsb	r3, [r6, #3]
	cmp	r3, #0
	ble	.L502
	add	r4, r6, #21760
	mov	r9, #0
	add	r4, r4, #160
	mov	r5, r9
	mov	r8, #4
.L501:
	ldr	r1, [r4]
	mov	r0, r7
	bl	FSP_IsSpecialFrm
	strb	r5, [r4, #-7]
	strb	r5, [r4, #-8]
	add	r9, r9, #1
	str	r5, [r4, #68]
	add	r4, r4, #92
	cmp	r0, #1
	movne	r3, r5
	moveq	r3, r8
	strb	r3, [r4, #-98]
	ldrsb	r3, [r6, #3]
	cmp	r3, r9
	bgt	.L501
.L502:
	ldrsb	r3, [r6, #4]
	cmp	r3, #0
	ble	.L498
	add	r4, r6, #24832
	mov	r9, #0
	add	r4, r4, #32
	mov	r5, r9
	mov	r8, #4
.L507:
	ldr	r1, [r4]
	mov	r0, r7
	bl	FSP_IsSpecialFrm
	strb	r5, [r4, #-7]
	strb	r5, [r4, #-8]
	add	r9, r9, #1
	str	r5, [r4, #68]
	add	r4, r4, #92
	cmp	r0, #1
	movne	r3, r5
	moveq	r3, r8
	strb	r3, [r4, #-98]
	ldrsb	r3, [r6, #4]
	cmp	r3, r9
	bgt	.L507
.L498:
	ldrsb	r1, [r6, #5]
	cmp	r1, #0
	ble	.L504
	add	r3, r6, #27648
	mov	r2, #0
	add	r3, r3, #156
	mov	ip, r2
	mov	r0, #1
.L508:
	add	r2, r2, #1
	strb	r0, [r3]
	cmp	r2, r1
	strb	ip, [r3, #1]
	add	r3, r3, #8
	bne	.L508
.L504:
	mov	r0, #0
	str	r0, [r6, #12]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L512:
	ldr	r3, .L514+8
	movw	r2, #446
	ldr	r1, .L514+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L513:
	mov	r0, r6
	ldr	r3, .L514+16
	movw	r2, #447
	ldr	r1, .L514+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L515:
	.align	2
.L514:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC2
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_EmptyInstance, .-FSP_EmptyInstance
	.align	2
	.global	FSP_IsDecFsAvailable
	.type	FSP_IsDecFsAvailable, %function
FSP_IsDecFsAvailable:
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
	cmp	r0, #31
	bhi	.L521
	ldr	r3, [r1, #88]
	cmp	r3, #1
	beq	.L522
.L520:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L522:
	ldr	r3, [r1]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #0
	bne	.L520
	ldr	r1, [r1, #8]
	bl	FSP_IsSpecialFrm
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L521:
	ldr	r3, .L523
	mov	r2, #804
	ldr	r1, .L523+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #255
	ldmfd	sp, {fp, sp, pc}
.L524:
	.align	2
.L523:
	.word	.LC2
	.word	.LC1
	UNWIND(.fnend)
	.size	FSP_IsDecFsAvailable, .-FSP_IsDecFsAvailable
	.align	2
	.global	FSP_IfCanGetDecFs
	.type	FSP_IfCanGetDecFs, %function
FSP_IfCanGetDecFs:
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
	cmp	r0, #31
	mov	r5, r0
	bhi	.L544
	cmp	r1, #0
	beq	.L545
	ldr	r3, .L551
	ldr	r6, [r3, r0, asl #2]
	cmp	r6, #0
	addne	r4, r6, #21760
	addne	r7, r6, #24832
	addne	r4, r4, #152
	addne	r7, r7, #24
	bne	.L530
	b	.L546
.L548:
	cmp	r4, r7
	beq	.L547
.L530:
	mov	r1, r4
	mov	r0, r5
	bl	FSP_IsDecFsAvailable
	add	r4, r4, #92
	cmp	r0, #1
	bne	.L548
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L547:
	add	r2, r6, #21760
	mov	r0, #0
	add	r2, r2, #240
	mov	r3, r0
	mov	ip, #92
	b	.L532
.L531:
	add	r3, r3, #1
	cmp	r3, #32
	beq	.L549
.L532:
	ldr	r1, [r2]
	add	r2, r2, #92
	cmp	r1, #1
	bne	.L531
	mla	r1, ip, r3, r6
	add	r3, r3, #1
	add	r1, r1, #21760
	add	r1, r1, #152
	ldr	r1, [r1]
	bic	r1, r1, #-16777216
	bic	r1, r1, #255
	cmp	r1, #196608
	addeq	r0, r0, #1
	cmp	r3, #32
	bne	.L532
.L549:
	ldr	r3, [r6, #40]
	cmp	r3, #1088
	movgt	r3, #1
	ble	.L550
.L534:
	cmp	r0, r3
	movgt	r0, #0
	mvnle	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L550:
	ldr	r3, .L551+4
	ldr	r3, [r3, r5, asl #2]
	add	r3, r3, #475136
	ldr	r3, [r3, #1668]
	cmp	r3, #0
	movne	r3, #1
	moveq	r3, #4
	b	.L534
.L544:
	ldr	r3, .L551+8
	movw	r2, #529
	ldr	r1, .L551+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L546:
	mov	r0, r6
	ldr	r3, .L551+16
	movw	r2, #531
	ldr	r1, .L551+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L545:
	mov	r0, r1
	ldr	r3, .L551+20
	movw	r2, #530
	ldr	r1, .L551+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L552:
	.align	2
.L551:
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	.word	.LC2
	.word	.LC1
	.word	.LC4
	.word	.LC18
	UNWIND(.fnend)
	.size	FSP_IfCanGetDecFs, .-FSP_IfCanGetDecFs
	.align	2
	.global	FSP_IsNewFsAvalible
	.type	FSP_IsNewFsAvalible, %function
FSP_IsNewFsAvalible:
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
	cmp	r0, #31
	mov	r5, r0
	bhi	.L590
	ldr	r8, .L594
	ldr	r7, [r8, r0, asl #2]
	cmp	r7, #0
	beq	.L591
	ldrsb	r3, [r7, #3]
	cmp	r3, #0
	bne	.L557
.L564:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L557:
	bl	VCTRL_GetVidStd
	cmp	r0, #17
	beq	.L558
	ldrsb	r3, [r7, #3]
	cmp	r3, #0
	ble	.L565
	add	r4, r7, #21760
	mov	r6, #0
	add	r4, r4, #152
	b	.L561
.L592:
	add	r6, r6, #1
	cmp	r3, r6
	ble	.L565
.L561:
	mov	r1, r4
	mov	r0, r5
	bl	FSP_IsDecFsAvailable
	add	r4, r4, #92
	ldrsb	r3, [r7, #3]
	cmp	r0, #1
	bne	.L592
	cmp	r3, r6
	ble	.L565
.L569:
	mov	r0, r5
	bl	VCTRL_GetVidStd
	cmp	r0, #17
	beq	.L564
	ldrsb	r1, [r7, #5]
	cmp	r1, #0
	ble	.L570
	add	r3, r7, #27648
	ldrh	r3, [r3, #156]
	cmp	r3, #1
	beq	.L564
	mov	r2, #0
	b	.L571
.L572:
	add	r3, r7, r3, lsl #3
	ldrh	r3, [r3, #4]
	cmp	r3, #1
	beq	.L564
.L571:
	add	r2, r2, #1
	cmp	r2, r1
	add	r3, r2, #3472
	add	r3, r3, #3
	bne	.L572
.L574:
	mov	r0, r5
	bl	VCTRL_GetVidStd
	cmp	r0, #0
	beq	.L564
	mov	r0, r5
	bl	VCTRL_GetVidStd
	cmp	r0, #16
	beq	.L564
	mov	r0, r5
	bl	VCTRL_GetVidStd
	cmp	r0, #15
	beq	.L564
.L565:
	ldr	r3, [r8, r5, asl #2]
	cmp	r3, #0
	beq	.L593
.L573:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L558:
	ldr	r3, .L594+4
	add	r4, r7, #21760
	add	r4, r4, #152
	mov	r6, #0
	ldr	r3, [r3, r5, asl #2]
	add	r3, r3, #790528
	ldr	r9, [r3, #316]
	b	.L568
.L566:
	add	r6, r6, #1
	add	r4, r4, #92
	cmp	r6, #32
	beq	.L565
.L568:
	mov	r1, r4
	mov	r0, r5
	bl	FSP_IsDecFsAvailable
	cmp	r0, #1
	bne	.L566
	ldr	r3, [r4, #12]
	cmp	r3, r9
	bne	.L566
	cmp	r6, #31
	ble	.L569
	b	.L565
.L590:
	ldr	r3, .L594+8
	mov	r2, #836
	ldr	r1, .L594+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L570:
	bne	.L565
	b	.L574
.L591:
	mov	r0, r7
	ldr	r3, .L594+16
	movw	r2, #837
	ldr	r1, .L594+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L593:
	ldr	r1, .L594+20
	mov	r0, #1
	bl	dprint_vfmw
	b	.L573
.L595:
	.align	2
.L594:
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	.word	.LC2
	.word	.LC1
	.word	.LC4
	.word	.LC24
	UNWIND(.fnend)
	.size	FSP_IsNewFsAvalible, .-FSP_IsNewFsAvalible
	.align	2
	.global	FSP_NewLogicFs
	.type	FSP_NewLogicFs, %function
FSP_NewLogicFs:
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
	cmp	r0, #31
	mov	r7, r0
	mov	r10, r1
	bhi	.L635
	ldr	r5, .L643
	ldr	r0, [r5, r0, asl #2]
	cmp	r0, #0
	beq	.L636
	ldr	r8, .L643+4
	mov	r0, #3
	mov	r4, #0
	ldr	r3, [r8, #12]
	blx	r3
	ldr	r6, [r5, r7, asl #2]
	mov	r3, r6
.L602:
	ldrsb	r2, [r3, #152]
	cmp	r2, #0
	bne	.L600
	ldrsb	r9, [r3, #153]
	cmp	r9, #0
	beq	.L637
.L600:
	add	r4, r4, #1
	add	r3, r3, #680
	cmp	r4, #32
	bne	.L602
.L603:
	ldr	r1, .L643+8
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r8, #16]
	mov	r0, #3
	blx	r3
	mvn	r0, #0
.L632:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L637:
	mov	r5, #680
	mul	r5, r5, r4
	add	r3, r6, r5
	add	r5, r5, #152
	add	r1, r3, #152
	adds	r5, r6, r5
	strb	r4, [r1, #3]
	strb	r9, [r1, #2]
	beq	.L603
	cmp	r10, #0
	str	r9, [r3, #180]
	str	r9, [r3, #184]
	str	r9, [r3, #160]
	bne	.L604
	add	r2, r6, #24576
	add	ip, r6, #56
	str	ip, [r3, #180]
	mov	r0, #1
	str	ip, [r3, #184]
	ldr	r2, [r2, #3224]
	str	r2, [r3, #160]
	ldrb	r3, [r6, #5]	@ zero_extendqisi2
	strb	r0, [r1, #2]
	sub	r3, r3, #1
	strb	r3, [r1, #4]
.L605:
	mov	r0, #680
	add	r3, r5, #544
	mul	r0, r0, r4
	str	r3, [fp, #-60]
	mov	ip, #1
	mov	r2, #640
	mov	r1, #0
	add	r3, r6, r0
	add	r0, r0, #192
	add	lr, r3, #152
	add	r0, r6, r0
	strb	ip, [lr, #1]
	ldr	r10, [r3, #184]
	str	lr, [fp, #-52]
	strb	ip, [r10, #2]
	add	r10, r5, #560
	str	ip, [r3, #176]
	str	r10, [fp, #-48]
	ldr	ip, [r6, #12]
	ldr	r10, [r3, #180]
	str	ip, [r3, #172]
	str	ip, [r10, #76]
	ldr	r9, [r3, #172]
	ldr	ip, [r3, #184]
	str	r9, [ip, #76]
	ldr	ip, [r6, #12]
	add	ip, ip, #1
	str	ip, [r6, #12]
	ldr	ip, [r8, #48]
	ldr	r9, [r3, #180]
	ldr	r10, [r3, #184]
	blx	ip
	ldr	lr, [fp, #-52]
	ldrsb	r3, [lr, #3]
	str	r3, [r5, #188]
	ldr	r3, [r9, #56]
	str	r3, [r5, #108]
	ldr	r3, [r9, #60]
	str	r3, [r5, #112]
	ldr	r3, [r10, #28]
	str	r3, [r5, #152]
	ldr	r3, [r10, #32]
	str	r3, [r5, #156]
	ldr	r3, [r10, #48]
	str	r3, [r5, #176]
	ldr	r3, [r10, #52]
	str	r3, [r5, #180]
	ldr	r0, [r9, #8]
	str	r0, [r5, #76]
	bl	MEM_Phy2Vir
	ldr	r2, [fp, #-60]
	mov	r1, #0
	str	r0, [r5, #544]
	str	r1, [r2, #4]
	ldr	r3, [r9, #64]
	ldr	r0, [r5, #76]
	add	r0, r3, r0
	str	r0, [r5, #80]
	bl	MEM_Phy2Vir
	ldr	r3, [fp, #-48]
	mov	r1, #0
	add	lr, r5, #576
	str	r1, [r3, #-4]
	str	r0, [r3, #-8]
	ldr	ip, [r10, #8]
	ldr	r0, [r5, #76]
	str	ip, [r5, #60]
	ldr	r3, [r10, #64]
	add	r3, ip, r3
	str	r3, [r5, #64]
	ldr	r2, [r10, #28]
	add	r2, r2, ip
	str	r2, [r5, #68]
	ldr	r2, [r10, #32]
	add	r3, r3, r2
	str	r3, [r5, #72]
	ldr	r3, [r9, #36]
	ldr	r2, [fp, #-60]
	str	r3, [r5, #184]
	ldr	r3, [r9, #40]
	add	r3, r3, r0
	str	r3, [r5, #84]
	ldrd	r2, [r2]
	ldr	ip, [r9, #40]
	strd	r2, [fp, #-60]
	adds	r2, r2, ip
	adc	r3, r3, ip, asr #31
	strd	r2, [lr, #-8]
	ldr	r2, [r9, #44]
	ldr	r3, [r9, #40]
	add	r3, r3, r2
	add	r0, r3, r0
	str	r0, [r5, #88]
	ldr	r2, [r9, #44]
	ldr	ip, [r9, #40]
	mov	r1, r2, asr #31
	adds	r2, r2, ip
	adc	r3, r1, ip, asr #31
	ldrd	r0, [fp, #-60]
	adds	r0, r0, r2
	adc	r1, r1, r3
	mov	r2, r0
	mov	r3, r1
	strd	r2, [lr]
	ldr	r3, [r9, #24]
	str	r3, [r5, #252]
	ldr	r0, [r9, #24]
	bl	MEM_Phy2Vir
	ldr	r3, [fp, #-48]
	mov	r2, #0
	str	r0, [r5, #560]
	str	r2, [r3, #4]
	ldr	r0, [r9, #16]
	str	r0, [r5, #464]
	bl	MEM_Phy2Vir
	mov	r1, #0
	str	r1, [r5, #476]
	ldr	r2, [r8, #16]
	str	r0, [r5, #472]
	mov	r0, #3
	ldr	r3, [r9, #20]
	str	r3, [r5, #460]
	blx	r2
	ldr	r3, .L643+12
	mov	r2, r7, asl #6
	add	r7, r2, r7, lsl #3
	add	r7, r3, r7
	ldr	r3, [r7, #24]
	cmp	r3, #3
	beq	.L638
.L624:
	mov	r3, #680
	mla	r4, r3, r4, r6
	ldrsb	r0, [r4, #155]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L604:
	mov	r0, r7
	bl	VCTRL_GetVidStd
	cmp	r0, #17
	beq	.L606
	ldrsb	r3, [r6, #3]
	cmp	r3, #0
	ble	.L608
	add	r10, r6, #21760
	add	r10, r10, #152
	b	.L610
.L639:
	ldrsb	r3, [r6, #3]
	add	r10, r10, #92
	cmp	r9, r3
	bge	.L608
.L610:
	mov	r1, r10
	mov	r0, r7
	bl	FSP_IsDecFsAvailable
	add	r9, r9, #1
	cmp	r0, #1
	bne	.L639
.L634:
	str	r10, [r5, #28]
.L608:
	mov	r9, #680
	mla	r9, r9, r4, r6
	add	r10, r9, #176
	ldr	r0, [r10, #4]
	cmp	r0, #0
	beq	.L640
	ldrsb	r3, [r6, #5]
	cmp	r3, #0
	ble	.L615
	mov	r0, r7
	bl	VCTRL_GetVidStd
	cmp	r0, #17
	beq	.L616
	ldrsb	r0, [r6, #5]
	add	ip, r6, #24576
	cmp	r0, #0
	ble	.L617
	movw	r3, #3228
	ldrh	r3, [ip, r3]
	cmp	r3, #1
	beq	.L618
	mov	r3, #0
	b	.L619
.L621:
	add	r1, r6, r2, lsl #3
	ldrh	r1, [r1, #4]
	cmp	r1, #1
	beq	.L641
.L619:
	add	r3, r3, #1
	cmp	r3, r0
	add	r2, r3, #3472
	add	r2, r2, #3
	bne	.L621
.L617:
	cmp	r0, #0
	ldr	lr, [r6, #8]
	ble	.L623
.L620:
	mov	r2, #0
	mov	r1, r2
.L622:
	mov	r3, r2, asl #3
	add	r2, r2, #1
	add	r3, r3, #27648
	cmp	r2, r0
	add	r3, r3, #157
	strb	r1, [r6, r3]
	bne	.L622
.L623:
	mov	r9, #680
	mov	r3, #0
	mla	r9, r9, r4, r6
	mov	r0, r3
	ldr	r1, .L643+16
	strb	r3, [r9, #156]
	ldr	r3, [ip, #3224]
	str	lr, [r9, #164]
	str	r3, [r9, #160]
	bl	dprint_vfmw
	ldr	r0, [r9, #180]
.L615:
	mov	r3, #680
	mla	r3, r3, r4, r6
	str	r0, [r3, #184]
	b	.L605
.L638:
	ldr	r3, [r7, #56]
	cmp	r3, #0
	bne	.L624
	ldr	r3, .L643+4
	ldr	r3, [r3]
	blx	r3
	mov	r3, #4
	str	r3, [r7, #24]
	str	r0, [r7, #56]
	b	.L624
.L606:
	ldr	r2, .L643+20
	add	r10, r6, #21760
	add	r10, r10, #152
	add	r9, r6, #24832
	str	r4, [fp, #-48]
	add	r9, r9, #24
	ldr	r2, [r2, r7, asl #2]
	mov	r4, r10
	add	r2, r2, #790528
	ldr	r3, [r2, #316]
	mov	r10, r3
	b	.L613
.L612:
	add	r4, r4, #92
	cmp	r4, r9
	beq	.L642
.L613:
	mov	r1, r4
	mov	r0, r7
	bl	FSP_IsDecFsAvailable
	cmp	r0, #1
	bne	.L612
	ldr	r2, [r4, #12]
	cmp	r10, r2
	bne	.L612
	mov	r10, r4
	ldr	r4, [fp, #-48]
	b	.L634
.L642:
	ldr	r4, [fp, #-48]
	b	.L608
.L641:
	mov	r1, #680
	cmp	r3, r0
	mla	r1, r1, r4, r6
	strb	r3, [r1, #156]
	ldr	r3, [r6, r2, asl #3]
	str	r3, [r1, #160]
	ldr	lr, [r6, #8]
	str	lr, [r1, #164]
	bge	.L620
.L625:
	mov	r3, #680
	mla	r3, r3, r4, r6
	ldr	r0, [r3, #180]
	b	.L615
.L616:
	add	r3, r6, #24576
	mov	r1, #0
	strb	r1, [r9, #156]
	ldr	r3, [r3, #3224]
	str	r3, [r9, #160]
	ldr	r3, [r6, #8]
	str	r3, [r9, #164]
	ldr	r0, [r10, #4]
	b	.L615
.L635:
	ldr	r3, .L643+24
	movw	r2, #931
	ldr	r1, .L643+28
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L632
.L636:
	ldr	r3, .L643+32
	mov	r2, #932
	ldr	r1, .L643+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L632
.L618:
	mov	r2, #0
	strb	r2, [r9, #156]
	ldr	r3, [ip, #3224]
	str	r3, [r9, #160]
	ldr	r3, [r6, #8]
	str	r3, [r9, #164]
	b	.L625
.L640:
	ldr	r2, .L643+36
	ldr	r1, .L643+40
	bl	dprint_vfmw
	ldr	r3, [r8, #16]
	mov	r0, #3
	blx	r3
	mvn	r0, #0
	b	.L632
.L644:
	.align	2
.L643:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC25
	.word	g_VfmwChanStat
	.word	.LC27
	.word	s_pstVfmwChan
	.word	.LC2
	.word	.LC1
	.word	.LC4
	.word	.LANCHOR1
	.word	.LC26
	UNWIND(.fnend)
	.size	FSP_NewLogicFs, .-FSP_NewLogicFs
	.align	2
	.global	FSP_SetSingleFrameBuf
	.type	FSP_SetSingleFrameBuf, %function
FSP_SetSingleFrameBuf:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	cmp	r0, #31
	bhi	.L692
	ldr	r3, .L696
	ldr	r6, [r3, r0, asl #2]
	add	r2, r6, #471040
	add	lr, r6, #475136
	ldr	r5, [r2, #1572]
	ldr	r7, [lr, #1032]
	cmp	r5, #32
	movge	r5, #32
	str	r5, [r2, #3944]
	ldr	r3, [r1]
	cmp	r3, #255
	beq	.L665
	ldrb	r4, [lr, #272]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L649
	add	r3, lr, #284
	mov	r4, #1
	b	.L650
.L694:
	add	r4, r4, #1
	cmp	r4, #32
	beq	.L693
.L650:
	ldrb	ip, [r3]	@ zero_extendqisi2
	add	r3, r3, #12
	cmp	ip, #0
	bne	.L694
.L649:
	ldr	r3, [r1, #32]
	mov	ip, r4, asl #4
	sub	ip, ip, r4, asl #2
	movw	r8, #4360
	add	r3, r3, #1020
	add	ip, r2, ip
	add	r3, r3, #3
	add	r9, ip, #4352
	bic	r3, r3, #1020
	bic	r3, r3, #3
	str	r3, [ip, r8]
	ldr	r10, [r1, #12]
	movw	r8, #4368
	add	r3, r3, r7
	mov	r7, #1
	str	r10, [r9, #12]
	add	r9, r2, r4, lsl #2
	strb	r7, [ip, r8]
	ldr	r8, [r2, #3956]
	add	r8, r8, r7
	str	r8, [r2, #3956]
	str	r3, [r9, #3976]
	ldr	r3, [r1, #4]
	cmp	r3, #255
	beq	.L648
	ldr	r9, [r1, #48]
	movw	r8, #4744
	add	r3, ip, #4736
	str	r9, [ip, r8]
	movw	r8, #4752
	ldr	r9, [r1, #16]
	str	r9, [r3, #12]
	strb	r7, [ip, r8]
	ldr	r3, [r2, #3964]
	add	r3, r3, #1
	str	r3, [r2, #3964]
.L648:
	ldr	r3, [r1, #8]
	cmp	r3, #255
	beq	.L663
	ldrb	r3, [lr, #12]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L669
	mov	ip, #1
.L653:
	mov	lr, ip, asl #3
	add	ip, ip, #1
	add	r3, lr, #475136
	add	r3, r3, #12
	ldrb	r3, [r6, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L652
	cmp	ip, #32
	bne	.L653
.L663:
	ldr	ip, .L696+4
	mov	r3, #0
	ldr	ip, [ip, r0, asl #2]
	add	lr, ip, #20480
	strb	r5, [ip, #3]
	strb	r3, [ip, #4]
	ldrb	r7, [r2, #3952]	@ zero_extendqisi2
	strb	r7, [ip, #5]
	ldr	r6, [lr, #1520]
	cmp	r6, r3
	beq	.L667
	add	r0, ip, #22016
	mov	r3, #1
	add	r0, r0, #76
	b	.L656
.L655:
	add	r3, r3, #1
	cmp	r3, #32
	beq	.L695
.L656:
	ldr	r5, [r0]
	add	r0, r0, #92
	cmp	r5, #0
	bne	.L655
	mov	r6, r3
.L654:
	mov	r0, #92
	mov	r5, r4, asl #4
	mla	r3, r0, r3, ip
	ldr	r8, [ip, #16]
	sub	r5, r5, r4, asl #2
	sxtb	r0, r7
	add	r5, r2, r5
	str	r0, [fp, #-48]
	add	r0, r3, #21760
	add	r7, r8, #1
	movw	r8, #4360
	str	r7, [ip, #16]
	str	r6, [r0, #156]
	add	r7, r5, #4352
	ldr	r8, [r5, r8]
	movw	r6, #21920
	add	r4, r2, r4, lsl #2
	movw	r10, #21976
	str	r8, [r3, r6]
	movw	r8, #21936
	ldr	r9, [r7, #12]
	movw	r6, #21944
	str	r9, [r0, #164]
	movw	r9, #21952
	ldr	r4, [r4, #3976]
	str	r4, [r3, r8]
	ldr	r8, [r2, #3900]
	str	r8, [r0, #180]
	movw	r8, #21960
	ldr	r7, [r2, #3904]
	str	r7, [r3, r6]
	ldr	r7, [r2, #3916]
	str	r7, [r0, #188]
	movw	r7, #21968
	ldr	r5, [r2, #3924]
	str	r5, [r3, r9]
	ldr	r9, [r2, #3928]
	str	r9, [r0, #196]
	movw	r9, #21984
	ldr	r4, [r2, #3908]
	str	r4, [r3, r8]
	mov	r4, #1
	ldr	r8, [r2, #3912]
	str	r8, [r0, #204]
	movw	r8, #22000
	ldr	r6, [ip, #40]
	str	r6, [r3, r7]
	ldr	r7, [ip, #44]
	str	r7, [r0, #212]
	ldr	r5, [r2, #3932]
	str	r5, [r3, r10]
	mov	r5, #0
	ldr	r10, [r2, #3936]
	str	r10, [r0, #220]
	ldr	r10, [r2, #3940]
	str	r10, [r3, r9]
	strb	r5, [r0, #153]
	strb	r5, [r0, #154]
	str	r4, [r3, r8]
	ldr	r0, [fp, #-48]
	ldr	r3, [ip, #20]
	cmp	r3, r0
	bcs	.L658
	ldr	r0, [r1, #8]
	cmp	r0, #255
	beq	.L658
	add	r0, r3, #26
	add	r8, ip, r3, lsl #3
	add	r8, r8, #24576
	add	r3, r3, #1
	add	r0, r2, r0, lsl #3
	ldr	r0, [r0, #3896]
	strb	r5, [r8, #3229]
	strb	r4, [r8, #3228]
	str	r0, [r8, #3224]
	str	r3, [ip, #20]
.L658:
	ldr	r3, [ip, #24]
	ldr	r0, [r2, #3944]
	cmp	r3, r0
	bcs	.L659
	ldr	r1, [r1, #4]
	cmp	r1, #255
	beq	.L659
	ldr	r4, [r2, #3964]
	mov	r0, #92
	mla	r0, r0, r3, ip
	sub	r4, r4, #1
	add	r1, r3, #1
	movw	r5, #4744
	mov	r3, r4, asl #4
	movw	r8, #21928
	sub	r3, r3, r4, asl #2
	add	r4, r0, #21760
	add	r3, r2, r3
	ldr	r3, [r3, r5]
	str	r3, [r0, r8]
	ldr	r3, [r2, #3964]
	sub	r0, r3, #1
	mov	r3, r0, asl #4
	sub	r3, r3, r0, asl #2
	add	r3, r2, r3
	add	r3, r3, #4736
	add	r3, r3, #8
	ldr	r3, [r3, #4]
	str	r3, [r4, #172]
	str	r1, [ip, #24]
.L659:
	ldr	r3, [ip, #144]
	ldr	r1, [r2, #3948]
	cmp	r3, #0
	str	r1, [ip, #8]
	movne	r0, #0
	bne	.L685
	str	r3, [ip, #60]
	mov	r0, r3
	ldr	lr, [lr, #1440]
	mov	r1, #1
	str	lr, [ip, #64]
	ldr	lr, [r2, #3900]
	str	lr, [ip, #84]
	ldr	lr, [r2, #3904]
	str	r6, [ip, #112]
	str	r7, [ip, #116]
	str	lr, [ip, #88]
	ldr	lr, [r2, #3932]
	str	lr, [ip, #120]
	ldr	lr, [r2, #3936]
	str	lr, [ip, #124]
	ldr	r2, [r2, #3940]
	strb	r3, [ip, #57]
	strb	r3, [ip, #58]
	str	r2, [ip, #128]
	str	r1, [ip, #144]
.L685:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L695:
	ldr	r2, .L696+8
	mov	r0, #1
	ldr	r1, .L696+12
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L665:
	mov	r4, #0
	b	.L648
.L693:
	ldr	r2, .L696+8
	mov	r0, #1
	ldr	r1, .L696+16
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L667:
	mov	r3, r6
	b	.L654
.L692:
	ldr	r3, .L696+20
	movw	r2, #1719
	ldr	r1, .L696+24
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L685
.L669:
	mov	lr, r3
.L652:
	ldr	ip, [r1, #64]
	add	lr, r6, lr
	add	lr, lr, #475136
	mov	r3, #1
	str	ip, [lr, #8]
	strb	r3, [lr, #12]
	ldr	r3, [r2, #3960]
	add	r3, r3, #1
	str	r3, [r2, #3960]
	b	.L663
.L697:
	.align	2
.L696:
	.word	s_pstVfmwChan
	.word	.LANCHOR0
	.word	.LANCHOR1+16
	.word	.LC29
	.word	.LC28
	.word	.LC2
	.word	.LC1
	UNWIND(.fnend)
	.size	FSP_SetSingleFrameBuf, .-FSP_SetSingleFrameBuf
	.align	2
	.global	FSP_GetInst
	.type	FSP_GetInst, %function
FSP_GetInst:
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
	cmp	r0, #31
	bhi	.L701
	ldr	r3, .L702
	ldr	r0, [r3, r0, asl #2]
	ldmfd	sp, {fp, sp, pc}
.L701:
	mov	r3, r0
	ldr	r2, .L702+4
	ldr	r1, .L702+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L703:
	.align	2
.L702:
	.word	.LANCHOR0
	.word	.LANCHOR1+40
	.word	.LC30
	UNWIND(.fnend)
	.size	FSP_GetInst, .-FSP_GetInst
	.global	s_pFspInst
	.section	.rodata
	.align	2
.LANCHOR1 = . + 0
	.type	__func__.14414, %object
	.size	__func__.14414, 15
__func__.14414:
	.ascii	"FSP_NewLogicFs\000"
	.space	1
	.type	__func__.14606, %object
	.size	__func__.14606, 22
__func__.14606:
	.ascii	"FSP_SetSingleFrameBuf\000"
	.space	2
	.type	__func__.14616, %object
	.size	__func__.14616, 12
__func__.14616:
	.ascii	"FSP_GetInst\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"pFspInst = NULL\000" )
.LC1:
	ASCII(.ascii	"fsp.c,L%d: %s\012\000" )
	.space	1
.LC2:
	ASCII(.ascii	"InstID out of range\000" )
.LC3:
	ASCII(.ascii	"fsp instance not in used\000" )
	.space	3
.LC4:
	ASCII(.ascii	"fsp is not inited\000" )
	.space	2
.LC5:
	ASCII(.ascii	"fsp is already inited\000" )
	.space	2
.LC6:
	ASCII(.ascii	"pstFspInstCfg = NULL\000" )
	.space	3
.LC7:
	ASCII(.ascii	"This inst is not active\000" )
.LC8:
	ASCII(.ascii	"user set decode channel max resolution is (w=%d,h=%" )
	ASCII(.ascii	"d), this stream (w=%d,h=%d) can NOT be decoded!\012" )
	ASCII(.ascii	"\000" )
.LC9:
	ASCII(.ascii	"DFS, Wrong Partition State. State: 0x%x\012\000" )
	.space	3
.LC10:
	ASCII(.ascii	"DFS, Mem Element Fill Successed! Ready to Decode!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC11:
	ASCII(.ascii	"Fsp arrange failed, return %d\012\000" )
	.space	1
.LC12:
	ASCII(.ascii	"arrange ret %d, min = %d, actual = %d\012\000" )
	.space	1
.LC13:
	ASCII(.ascii	"LogicFrameID out of range\000" )
	.space	2
.LC14:
	ASCII(.ascii	"fsp.c, line %d: pstLogicFs->PmvIdc out of range(=%d" )
	ASCII(.ascii	")\012\000" )
	.space	2
.LC15:
	ASCII(.ascii	"FSP_GetRef: InstID out of range\000" )
.LC16:
	ASCII(.ascii	"FSP_GetRef: LogicFrameID out of range\000" )
	.space	2
.LC17:
	ASCII(.ascii	"FSP_SetDisplay: LogicTick=%d, DispTick=%d!\012\000" )
.LC18:
	ASCII(.ascii	"pstVoQue is NULL\000" )
	.space	3
.LC19:
	ASCII(.ascii	"PhyFsID out of range\000" )
	.space	3
.LC20:
	ASCII(.ascii	"DecFsAddrTab is NULL\012\000" )
	.space	2
.LC21:
	ASCII(.ascii	"DecFsNum is NULL\012\000" )
	.space	2
.LC22:
	ASCII(.ascii	"PmvAddrTab is NULL\012\000" )
.LC23:
	ASCII(.ascii	"PmvNum is NULL\012\000" )
.LC24:
	ASCII(.ascii	"FSP_IsFsLeak: fsp is not inited \012\000" )
	.space	2
.LC25:
	ASCII(.ascii	"no logic frame store!!!\012\000" )
	.space	3
.LC26:
	ASCII(.ascii	"%s no decode phy fs\012\000" )
	.space	3
.LC27:
	ASCII(.ascii	"no pmv memory\012\000" )
	.space	1
.LC28:
	ASCII(.ascii	"%s no free frame record position.\012\000" )
	.space	1
.LC29:
	ASCII(.ascii	"%s no free dec fs record position.\012\000" )
.LC30:
	ASCII(.ascii	"%s InstID %d out of range\012\000" )
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	s_pFspInst, %object
	.size	s_pFspInst, 128
s_pFspInst:
	.space	128
	.type	MemArrange.14364, %object
	.size	MemArrange.14364, 1232
MemArrange.14364:
	.space	1232
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
