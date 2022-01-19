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
	.file	"mem_manage.c"
	.text
	.align	2
	.global	MEM_InitMemManager
	.type	MEM_InitMemManager, %function
MEM_InitMemManager:
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
	ldr	r4, .L2
	mov	r0, #1
	ldr	r3, [r4, #12]
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #3072
	mov	r1, #0
	ldr	r0, .L2+4
	blx	r3
	ldr	r3, [r4, #16]
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L3:
	.align	2
.L2:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	MEM_InitMemManager, .-MEM_InitMemManager
	.align	2
	.global	MEM_ManagerWithOperation
	.type	MEM_ManagerWithOperation, %function
MEM_ManagerWithOperation:
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
	cmp	r0, #0
	ldrne	r3, .L9
	ldrne	r1, [r0, #52]
	ldrne	r2, [r0, #56]
	strne	r1, [r3, #3072]
	strne	r2, [r3, #3076]
	ldmfd	sp, {fp, sp, pc}
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	MEM_ManagerWithOperation, .-MEM_ManagerWithOperation
	.align	2
	.global	MEM_ManagerClearOperation
	.type	MEM_ManagerClearOperation, %function
MEM_ManagerClearOperation:
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
	ldr	r3, .L12
	mov	r2, #0
	str	r2, [r3, #3072]
	str	r2, [r3, #3076]
	ldmfd	sp, {fp, sp, pc}
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	MEM_ManagerClearOperation, .-MEM_ManagerClearOperation
	.align	2
	.global	MEM_AddMemRecord
	.type	MEM_AddMemRecord, %function
MEM_AddMemRecord:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	cmp	r2, #0
	cmpne	r1, #0
	mov	r8, r0
	str	r1, [fp, #-48]
	moveq	r5, #1
	movne	r5, #0
	cmp	r0, #0
	orreq	r5, r5, #1
	mov	r9, r2
	cmp	r5, #0
	movne	r0, #0
	beq	.L24
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L24:
	ldr	r10, .L28
	mov	r0, #1
	ldr	r2, .L28+4
	mvn	r6, #0
	add	r7, r2, #3072
	ldr	r3, [r10, #12]
	blx	r3
	sub	r4, r7, #3072
	b	.L18
.L26:
	cmn	r6, #1
	moveq	r6, r5
.L17:
	add	r4, r4, #24
	add	r5, r5, #1
	cmp	r4, r7
	beq	.L25
.L18:
	ldr	r3, [r4, #8]
	cmp	r3, #0
	beq	.L26
	cmp	r8, r3
	bcc	.L17
	ldr	r2, [r4, #16]
	add	r2, r3, r2
	cmp	r8, r2
	bcs	.L17
	str	r2, [sp, #16]
	mov	r1, #69
	add	r2, r8, r9
	str	r3, [sp, #12]
	str	r5, [sp, #8]
	mov	r0, #1
	str	r2, [sp, #4]
	add	r5, r5, #1
	ldr	r3, .L28+8
	ldr	r2, .L28+12
	str	r8, [sp]
	bl	dprint_normal
	mov	r0, r4
	ldr	r3, [r10, #48]
	mov	r2, #24
	mov	r1, #0
	add	r4, r4, #24
	blx	r3
	cmp	r4, r7
	bne	.L18
.L25:
	cmn	r6, #1
	beq	.L27
	ldr	r2, .L28+4
	mov	r3, r6, asl #5
	sub	r3, r3, r6, asl #3
	mov	r4, #0
	add	r3, r2, r3
	ldr	r2, [fp, #-48]
	str	r8, [r3, #8]
	str	r2, [r3, #4]
	str	r9, [r3, #16]
.L20:
	ldr	r3, [r10, #16]
	mov	r0, #1
	blx	r3
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L27:
	ldr	r3, .L28+8
	mov	r1, #77
	ldr	r2, .L28+16
	mov	r0, #0
	mov	r4, r6
	bl	dprint_normal
	b	.L20
.L29:
	.align	2
.L28:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LC0
	.word	.LC1
	UNWIND(.fnend)
	.size	MEM_AddMemRecord, .-MEM_AddMemRecord
	.align	2
	.global	MEM_DelMemRecord
	.type	MEM_DelMemRecord, %function
MEM_DelMemRecord:
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
	cmp	r2, #0
	cmpne	r1, #0
	mov	r6, r1
	mov	r7, r2
	mov	r5, r0
	moveq	r4, #1
	movne	r4, #0
	cmp	r0, #0
	orreq	r4, r4, #1
	cmp	r4, #0
	beq	.L42
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L42:
	ldr	r8, .L44
	mov	r0, #1
	ldr	r3, [r8, #12]
	blx	r3
	ldr	r2, .L44+4
	mov	r0, r4
	mov	r3, r2
	b	.L33
.L32:
	add	r0, r0, #1
	add	r3, r3, #24
	cmp	r0, #128
	beq	.L43
.L33:
	ldr	ip, [r3, #16]
	cmp	ip, #0
	beq	.L32
	ldr	lr, [r3, #8]
	cmp	lr, r5
	bne	.L32
	ldr	lr, [r3, #4]
	cmp	r6, lr
	cmpeq	r7, ip
	bne	.L32
	mov	r3, r0, asl #5
	mov	r4, #0
	sub	r0, r3, r0, asl #3
	ldr	r1, [r8, #16]
	add	r2, r2, r0
	mov	r0, #1
	str	r4, [r2, #16]
	str	r4, [r2, #8]
	str	r4, [r2, #4]
	blx	r1
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L43:
	ldr	r3, [r8, #16]
	mov	r0, #1
	blx	r3
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L45:
	.align	2
.L44:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	MEM_DelMemRecord, .-MEM_DelMemRecord
	.align	2
	.global	MEM_Phy2Vir
	.type	MEM_Phy2Vir, %function
MEM_Phy2Vir:
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
	ldr	lr, .L55
	mov	r1, #0
	mov	r3, lr
	b	.L49
.L47:
	add	r1, r1, #1
	add	r3, r3, #24
	cmp	r1, #128
	beq	.L54
.L49:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L47
	ldr	ip, [r3, #8]
	cmp	ip, r0
	add	r2, ip, r2
	bhi	.L47
	cmp	r0, r2
	bcs	.L47
	mov	r3, r1, asl #5
	rsb	r0, ip, r0
	sub	r1, r3, r1, asl #3
	add	lr, lr, r1
	ldr	r3, [lr, #4]
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L54:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L56:
	.align	2
.L55:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	MEM_Phy2Vir, .-MEM_Phy2Vir
	.align	2
	.global	MEM_Vir2Phy
	.type	MEM_Vir2Phy, %function
MEM_Vir2Phy:
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
	ldr	lr, .L66
	mov	r1, #0
	mov	r3, lr
	b	.L60
.L58:
	add	r1, r1, #1
	add	r3, r3, #24
	cmp	r1, #128
	beq	.L65
.L60:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L58
	ldr	ip, [r3, #4]
	cmp	ip, r0
	add	r2, ip, r2
	bhi	.L58
	cmp	r0, r2
	bcs	.L58
	mov	r3, r1, asl #5
	rsb	r0, ip, r0
	sub	r1, r3, r1, asl #3
	add	lr, lr, r1
	ldr	r3, [lr, #8]
	add	r0, r0, r3
	ldmfd	sp, {fp, sp, pc}
.L65:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L67:
	.align	2
.L66:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	MEM_Vir2Phy, .-MEM_Vir2Phy
	.align	2
	.global	MEM_WritePhyWord
	.type	MEM_WritePhyWord, %function
MEM_WritePhyWord:
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
	mov	r4, r1
	bl	MEM_Phy2Vir
	cmp	r0, #0
	strne	r4, [r0]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MEM_WritePhyWord, .-MEM_WritePhyWord
	.align	2
	.global	MEM_ReadPhyWord
	.type	MEM_ReadPhyWord, %function
MEM_ReadPhyWord:
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
	bl	MEM_Phy2Vir
	cmp	r0, #0
	ldrne	r0, [r0]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MEM_ReadPhyWord, .-MEM_ReadPhyWord
	.align	2
	.global	MEM_AllocMemBlock
	.type	MEM_AllocMemBlock, %function
MEM_AllocMemBlock:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 24
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
	cmp	r2, #0
	cmpne	r3, #0
	mov	r5, r3
	mov	r8, r2
	moveq	r4, #1
	movne	r4, #0
	cmp	r0, #0
	orreq	r4, r4, #1
	mov	r7, r0
	cmp	r4, #0
	bne	.L89
	ldr	r6, .L91
	sub	r9, fp, #68
	ldr	r10, [r3, #20]
	mov	r2, #24
	mov	r1, r4
	mov	r0, r3
	ldr	r3, [r6, #48]
	blx	r3
	ldr	r3, [r6, #48]
	mov	r2, #24
	mov	r1, r4
	mov	r0, r9
	blx	r3
	str	r9, [sp]
	ldr	r3, [fp, #4]
	mov	r2, #4
	mov	r1, r8
	str	r10, [fp, #-48]
	ldr	r6, [r6, #144]
	mov	r0, r7
	blx	r6
	ldrd	r2, [fp, #-60]
	orrs	r1, r2, r3
	beq	.L90
	ldr	r1, [fp, #-48]
	ldr	r0, [fp, #-68]
	ldr	ip, [fp, #-64]
	ldr	lr, [fp, #-52]
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L88
.L81:
	.word	.L80
	.word	.L82
	.word	.L82
	.word	.L83
.L83:
	cmp	ip, #0
	cmpne	r2, #0
	beq	.L88
.L84:
	mov	r0, #0
	str	ip, [r5, #8]
	str	r2, [r5, #4]
	str	lr, [r5, #16]
.L78:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L82:
	cmp	r0, #0
	cmpne	ip, #0
	moveq	r0, #1
	movne	r0, #0
	cmp	r2, #0
	orreq	r0, r0, #1
	cmp	r0, #0
	beq	.L84
.L88:
	mvn	r0, #0
	b	.L78
.L80:
	cmp	r0, #0
	cmpne	r2, #0
	beq	.L88
	mov	ip, r0
	b	.L84
.L89:
	mov	r3, #209
	str	r2, [sp, #12]
	mov	r1, r3
	str	r0, [sp, #4]
	str	r3, [sp]
	mov	r0, #0
	str	r5, [sp, #8]
	ldr	r3, .L91+4
	ldr	r2, .L91+8
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L90:
	mov	r1, #224
	stmib	sp, {r7, r8}
	mov	r0, r4
	str	r1, [sp]
	ldr	r3, .L91+4
	ldr	r2, .L91+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L78
.L92:
	.align	2
.L91:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+20
	.word	.LC2
	.word	.LC3
	UNWIND(.fnend)
	.size	MEM_AllocMemBlock, .-MEM_AllocMemBlock
	.align	2
	.global	MEM_MapRegisterAddr
	.type	MEM_MapRegisterAddr, %function
MEM_MapRegisterAddr:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	cmp	r1, #0
	cmpne	r0, #0
	mov	r6, r0
	mov	r7, r1
	moveq	r4, #1
	movne	r4, #0
	cmp	r2, #0
	orreq	r4, r4, #1
	mov	r5, r2
	cmp	r4, #0
	bne	.L97
	ldr	r8, .L99
	mov	r2, #24
	mov	r1, r4
	mov	r0, r5
	ldr	r3, [r8, #48]
	blx	r3
	ldr	r3, [r8, #152]
	mov	r1, r7
	mov	r0, r6
	blx	r3
	subs	r3, r0, #0
	beq	.L98
	mov	r0, r4
	stmib	r5, {r3, r6}
	str	r7, [r5, #16]
.L95:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L97:
	movw	r3, #291
	str	r1, [sp, #12]
	str	r0, [sp, #8]
	mov	r1, r3
	str	r2, [sp, #4]
	mov	r0, #0
	str	r3, [sp]
	ldr	r2, .L99+4
	ldr	r3, .L99+8
	bl	dprint_normal
	mvn	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L98:
	movw	r1, #302
	ldr	r3, .L99+8
	stmia	sp, {r1, r6}
	ldr	r2, .L99+12
	bl	dprint_normal
	mvn	r0, #0
	b	.L95
.L100:
	.align	2
.L99:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC4
	.word	.LANCHOR1+40
	.word	.LC5
	UNWIND(.fnend)
	.size	MEM_MapRegisterAddr, .-MEM_MapRegisterAddr
	.align	2
	.global	MEM_UnmapRegisterAddr
	.type	MEM_UnmapRegisterAddr, %function
MEM_UnmapRegisterAddr:
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
	cmp	r1, #0
	cmpne	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r3, .L103
	mov	r0, r1
	ldr	r3, [r3, #156]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3	@ indirect register sibling call
.L104:
	.align	2
.L103:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	MEM_UnmapRegisterAddr, .-MEM_UnmapRegisterAddr
	.align	2
	.global	MEM_ReleaseMemBlock
	.type	MEM_ReleaseMemBlock, %function
MEM_ReleaseMemBlock:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #24)
	sub	sp, sp, #24
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r7, r1
	moveq	r5, #1
	movne	r5, #0
	bne	.L114
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L114:
	ldr	r6, .L115
	mov	r2, #24
	mov	r1, r5
	sub	r0, fp, #52
	ldr	r3, [r6, #48]
	blx	r3
	ldr	r3, .L115+4
	str	r4, [fp, #-52]
	add	r0, r3, #3072
	str	r7, [fp, #-44]
	str	r5, [fp, #-40]
	b	.L109
.L107:
	add	r3, r3, #24
	cmp	r3, r0
	beq	.L108
.L109:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L107
	ldr	r1, [r3, #8]
	cmp	r4, r1
	add	ip, r1, r2
	bcc	.L107
	cmp	r4, ip
	bcs	.L107
	str	r2, [fp, #-36]
.L108:
	ldr	r3, [r6, #148]
	sub	r0, fp, #52
	blx	r3
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L116:
	.align	2
.L115:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	MEM_ReleaseMemBlock, .-MEM_ReleaseMemBlock
	.global	mem_free
	.global	mem_malloc
	.global	s_MemRecord
	.section	.rodata
	.align	2
.LANCHOR1 = . + 0
	.type	__func__.7156, %object
	.size	__func__.7156, 17
__func__.7156:
	.ascii	"MEM_AddMemRecord\000"
	.space	3
	.type	__func__.7209, %object
	.size	__func__.7209, 18
__func__.7209:
	.ascii	"MEM_AllocMemBlock\000"
	.space	2
	.type	__func__.7222, %object
	.size	__func__.7222, 20
__func__.7222:
	.ascii	"MEM_MapRegisterAddr\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"%s ERROR: Phy [0x%x ~ 0x%x] overlap with Record[%d]" )
	ASCII(.ascii	" [0x%x ~ 0x%x]\012\000" )
	.space	1
.LC1:
	ASCII(.ascii	"%s no free record slot!\012 \000" )
	.space	2
.LC2:
	ASCII(.ascii	"%s:%d failed MemName:%p pMemRecord:%p Len:0x%x\012\000" )
.LC3:
	ASCII(.ascii	"%s:%d failed MemName:%p Len:0x%x\012\000" )
	.space	2
.LC4:
	ASCII(.ascii	"%s:%d failed pMemRecord:%p Phy:0x%x Len:0x%x\012\000" )
	.space	2
.LC5:
	ASCII(.ascii	"%s:%d failed RegStartPhyAddr:0x%x\012\000" )
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	s_MemRecord, %object
	.size	s_MemRecord, 3072
s_MemRecord:
	.space	3072
	.type	mem_malloc, %object
	.size	mem_malloc, 4
mem_malloc:
	.space	4
	.type	mem_free, %object
	.size	mem_free, 4
mem_free:
	.space	4
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
