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
	.global	H264HAL_FillMixRam
	.type	H264HAL_FillMixRam, %function
H264HAL_FillMixRam:
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
	add	r3, r1, #1020
	add	r3, r3, #3
	bic	r0, r3, #1020
	bic	r0, r0, #3
	rsb	r0, r1, r0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H264HAL_FillMixRam, .-H264HAL_FillMixRam
	.align	2
	.global	H264HAL_WriteCabacTab
	.type	H264HAL_WriteCabacTab, %function
H264HAL_WriteCabacTab:
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
	beq	.L6
	ldr	r3, .L7
	mov	r2, #5120
	ldr	r1, .L7+4
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L6:
	mov	r3, #41
	ldr	r2, .L7+8
	mov	r1, r3
	mov	r0, #20
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L8:
	.align	2
.L7:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_CabacMN
	.word	.LC0
	UNWIND(.fnend)
	.size	H264HAL_WriteCabacTab, .-H264HAL_WriteCabacTab
	.align	2
	.global	H264HAL_InitHal
	.type	H264HAL_InitHal, %function
H264HAL_InitHal:
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
	ldr	r0, [r0, #856]
	bl	H264HAL_WriteCabacTab
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r2, .L14
	mov	r1, #54
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L15:
	.align	2
.L14:
	.word	.LC1
	UNWIND(.fnend)
	.size	H264HAL_InitHal, .-H264HAL_InitHal
	.align	2
	.global	H264HAL_GetVirAddr
	.type	H264HAL_GetVirAddr, %function
H264HAL_GetVirAddr:
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
	add	r0, r1, r0, lsl #2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H264HAL_GetVirAddr, .-H264HAL_GetVirAddr
	.align	2
	.global	H264HAL_GetPhyAddr
	.type	H264HAL_GetPhyAddr, %function
H264HAL_GetPhyAddr:
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
	add	r0, r1, r0, lsl #2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H264HAL_GetPhyAddr, .-H264HAL_GetPhyAddr
	.align	2
	.global	H264HAL_CutSliceChain
	.type	H264HAL_CutSliceChain, %function
H264HAL_CutSliceChain:
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
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	movne	r0, #0
	strne	r0, [r3, #252]
	beq	.L21
.L20:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L21:
	ldr	ip, .L22
	mov	r1, #79
	ldr	r3, .L22+4
	ldr	r2, .L22+8
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L20
.L23:
	.align	2
.L22:
	.word	.LC3
	.word	.LANCHOR0
	.word	.LC2
	UNWIND(.fnend)
	.size	H264HAL_CutSliceChain, .-H264HAL_CutSliceChain
	.align	2
	.global	H264HAL_Write_Qmatrix
	.type	H264HAL_Write_Qmatrix, %function
H264HAL_Write_Qmatrix:
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
	subs	r9, r1, #0
	mov	r8, r0
	mov	r10, r2
	beq	.L24
	sub	r6, r3, #4
	sub	r7, r0, #4
	mov	r4, #0
.L26:
	ldr	ip, [r7, #4]!
	mov	r3, r4
	ldr	r2, .L29
	mov	r1, #97
	mov	r0, #5
	add	r4, r4, #1
	mov	r5, r7
	str	ip, [r6, #4]!
	ldr	ip, [r5], r10
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r6]
	rsb	r3, r8, r5
	ldr	r2, .L29+4
	mov	r1, #98
	mov	r0, #5
	str	ip, [sp]
	bl	dprint_normal
	cmp	r4, r9
	bne	.L26
.L24:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L30:
	.align	2
.L29:
	.word	.LC4
	.word	.LC5
	UNWIND(.fnend)
	.size	H264HAL_Write_Qmatrix, .-H264HAL_Write_Qmatrix
	.align	2
	.global	H264HAL_SetSliceMsgStreamAddrInfo
	.type	H264HAL_SetSliceMsgStreamAddrInfo, %function
H264HAL_SetSliceMsgStreamAddrInfo:
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
	UNWIND(.pad #44)
	sub	sp, sp, #44
	ldr	r4, .L49
	add	r8, r2, #8
	mov	r6, r2
	mov	r7, r1
	mov	r9, r3
	mov	r10, r2
	mov	r5, #0
	str	r0, [fp, #-48]
.L46:
	ldr	r2, [r7, #8]
	cmp	r2, #0
	bne	.L48
	ldr	r3, [r4, #848]
	mov	r0, #5
	ldr	r1, [r4, #852]
	rsb	r3, r3, r10
	cmp	r3, r1
	strcc	r2, [r6]
	mov	r1, #136
	ldrcs	r2, .L49
	movcs	r3, #1
	strcs	r3, [r2, #844]
	mov	r3, r5
	ldr	ip, [r6]
	ldr	r2, .L49+4
	str	r9, [sp]
	str	ip, [sp, #4]
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r10, #1
	rsb	r2, r3, r2
	add	r3, r5, #1
	cmp	r2, r1
	addcc	r2, r6, #4
	ldrcs	r1, .L49
	movcs	r2, #1
	movcc	r1, #0
	strcc	r1, [r6, #4]
	strcs	r2, [r1, #844]
	addcs	r2, r6, #4
	add	r1, r9, #4
	ldr	r0, [r2]
	ldr	r2, .L49+4
	str	r1, [sp]
	mov	r1, #140
	str	r0, [sp, #4]
	mov	r0, #5
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r10, #2
	rsb	r2, r3, r2
	add	r3, r5, #2
	cmp	r2, r1
	ldrcs	r1, .L49
	movcs	r2, #1
	movcc	r2, #0
	strcc	r2, [r8]
	strcs	r2, [r1, #844]
	add	r1, r9, #8
	ldr	r0, [r8]
	ldr	r2, .L49+4
	str	r1, [sp]
	mov	r1, #144
	str	r0, [sp, #4]
	mov	r0, #5
	bl	dprint_normal
.L39:
	add	r5, r5, #3
	add	r7, r7, #4
	cmp	r5, #6
	add	r6, r6, #12
	add	r9, r9, #12
	add	r8, r8, #12
	add	r10, r10, #3
	bne	.L46
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L48:
	ldr	r3, [r7, #24]
	mov	r1, #120
	ldr	r0, [r7, #16]
	ldr	r2, .L49+8
	mov	lr, r3
	str	r3, [fp, #-60]
	add	ip, r0, lr, lsl #3
	stmib	sp, {r0, lr}
	and	r0, ip, #127
	add	r3, r5, #1
	str	r0, [fp, #-64]
	mov	ip, r0
	str	ip, [sp]
	ldr	ip, [fp, #-48]
	mov	r0, #5
	str	r3, [fp, #-52]
	ldr	ip, [ip, #592]
	str	ip, [fp, #-56]
	bl	dprint_normal
	ldr	r1, [r4, #848]
	add	r3, r10, #1
	ldr	r2, [r4, #852]
	rsb	r3, r1, r3
	add	r1, r9, #4
	cmp	r3, r2
	addcc	r3, r6, #4
	ldrcs	r2, .L49
	movcs	r3, #1
	ldrcc	r2, [fp, #-64]
	strcs	r3, [r2, #844]
	addcs	r3, r6, #4
	strcc	r2, [r6, #4]
	ldr	r0, [r3]
	ldr	r2, .L49+4
	ldr	r3, [fp, #-52]
	str	r1, [sp]
	mov	r1, #122
	str	r0, [sp, #4]
	mov	r0, #5
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r10, #2
	rsb	r3, r1, r3
	ldr	r1, [r7, #8]
	cmp	r3, r2
	add	r3, r5, #2
	ldrcs	r1, .L49
	movcs	r2, #1
	strcc	r1, [r8]
	strcs	r2, [r1, #844]
	add	r1, r9, #8
	ldr	r0, [r8]
	ldr	r2, .L49+4
	str	r1, [sp]
	mov	r1, #126
	str	r0, [sp, #4]
	mov	r0, #5
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r2, [r4, #852]
	mov	r1, #130
	rsb	r3, r3, r10
	mov	r0, #5
	cmp	r3, r2
	ldrcc	r3, [fp, #-60]
	movcs	r3, #1
	ldrcc	r2, [fp, #-56]
	ldrcs	r2, .L49
	biccc	r3, r3, #15
	biccc	r2, r2, #15
	rsbcc	r3, r2, r3
	strcc	r3, [r6]
	strcs	r3, [r2, #844]
	mov	r3, r5
	ldr	ip, [r6]
	ldr	r2, .L49+4
	str	r9, [sp]
	str	ip, [sp, #4]
	bl	dprint_normal
	b	.L39
.L50:
	.align	2
.L49:
	.word	g_HwMem
	.word	.LC7
	.word	.LC6
	UNWIND(.fnend)
	.size	H264HAL_SetSliceMsgStreamAddrInfo, .-H264HAL_SetSliceMsgStreamAddrInfo
	.align	2
	.global	H264HAL_SetSliceMsgMvAddrInfo
	.type	H264HAL_SetSliceMsgMvAddrInfo, %function
H264HAL_SetSliceMsgMvAddrInfo:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	mov	r6, r1
	ldrb	ip, [r6]	@ zero_extendqisi2
	mov	r5, r3
	ldr	r1, .L66
	mov	r7, r0
	mov	r4, r2
	add	r1, r1, ip, lsl #2
	ldr	r3, [r1, #24]
	cmp	r3, #2
	movne	ip, #0
	movne	lr, ip
	beq	.L63
.L52:
	ldr	r2, .L66+4
	add	r3, r4, #8
	ldr	r0, [r2, #848]
	ldr	r1, [r2, #852]
	rsb	r3, r0, r3
	cmp	r3, r1
	strcc	lr, [r4, #32]
	ldrcc	r0, [r2, #848]
	movcs	r3, #1
	ldrcc	r1, [r2, #852]
	strcs	r3, [r2, #844]
	add	r3, r4, #9
	rsb	r3, r0, r3
	mov	r0, #5
	cmp	r3, r1
	strcc	ip, [r4, #36]
	mov	r1, #207
	movcs	r3, #1
	strcs	r3, [r2, #844]
	ldr	ip, [r4, #32]
	add	r3, r5, #32
	ldr	r2, .L66+8
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r4, #36]
	add	r3, r5, #36
	ldr	r2, .L66+12
	mov	r1, #208
	mov	r0, #5
	str	ip, [sp]
	bl	dprint_normal
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L63:
	ldr	r3, [r6, #2788]
	mov	r1, #157
	ldr	r2, .L66+16
	mov	r0, #5
	bl	dprint_normal
	ldrb	ip, [r7]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L53
	ldrb	r3, [r6, #2778]	@ zero_extendqisi2
	cmp	r3, #3
	ldr	r3, [r6, #2788]
	beq	.L64
.L62:
	add	r3, r3, #110
	ldr	lr, [r7, r3, asl #2]
	b	.L52
.L53:
	ldr	r3, [r6, #2776]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #768
	beq	.L65
	ldrb	r3, [r6, #2776]	@ zero_extendqisi2
	mov	ip, #0
	cmp	r3, #1
	ldr	r3, [r6, #2788]
	beq	.L62
	add	r3, r3, #110
	ldr	lr, [r7, #572]
	ldr	r3, [r7, r3, asl #2]
	add	lr, r3, lr
	b	.L52
.L65:
	ldr	r3, [r6, #2788]
	mov	ip, #0
	b	.L62
.L64:
	add	r3, r3, #110
	ldr	ip, [r7, #572]
	ldr	lr, [r7, r3, asl #2]
	add	ip, lr, ip
	b	.L52
.L67:
	.align	2
.L66:
	.word	.LANCHOR0
	.word	g_HwMem
	.word	.LC9
	.word	.LC10
	.word	.LC8
	UNWIND(.fnend)
	.size	H264HAL_SetSliceMsgMvAddrInfo, .-H264HAL_SetSliceMsgMvAddrInfo
	.global	__aeabi_idiv
	.align	2
	.global	H264HAL_SetSliceMsgEndMbInSlice
	.type	H264HAL_SetSliceMsgEndMbInSlice, %function
H264HAL_SetSliceMsgEndMbInSlice:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	ldr	ip, [r1, #4056]
	cmp	ip, #0
	beq	.L77
.L70:
	ldr	r0, .L78
	add	r1, r2, #44
	ldr	lr, [r0, #848]
	ldr	ip, [r0, #852]
	rsb	r1, lr, r1
	cmp	r1, ip
	strcc	r3, [r2, #176]
	movcs	r1, #0
	movcc	r1, #0
	movcs	r3, #1
	strcs	r3, [r0, #844]
	mov	r0, r1
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L77:
	ldr	r0, [r0, #596]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	cmp	r0, #1048576
	str	r2, [fp, #-16]
	addgt	r1, r1, #1
	addle	r1, r1, #1
	movwgt	r0, #65535
	suble	r0, r0, #1
	movtgt	r0, 15
	bl	__aeabi_idiv
	ldr	r2, [fp, #-16]
	mov	r3, r0
	b	.L70
.L79:
	.align	2
.L78:
	.word	g_HwMem
	UNWIND(.fnend)
	.size	H264HAL_SetSliceMsgEndMbInSlice, .-H264HAL_SetSliceMsgEndMbInSlice
	.align	2
	.global	H264HAL_SetSliceMsgRefPicFrame
	.type	H264HAL_SetSliceMsgRefPicFrame, %function
H264HAL_SetSliceMsgRefPicFrame:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	ip, [fp, #4]
	str	r3, [fp, #-64]
	mov	r10, r0
	str	r2, [fp, #-48]
	add	r2, ip, #3
	add	r3, r1, ip, lsl #2
	str	r3, [fp, #-60]
	mov	r2, r2, asl #2
	str	r2, [fp, #-52]
	mov	r0, r3
	mov	r3, ip, asl #3
	add	r3, r3, #20
	str	r3, [fp, #-56]
	ldr	r3, [r0, #52]
	cmp	r3, #0
	beq	.L80
	mov	r4, ip, asl #10
	mov	r5, #0
	add	ip, r4, ip, lsl #7
	ldr	r9, .L104
	add	r4, r1, ip
	mov	r7, r5
	mov	r8, r5
	b	.L90
.L84:
	cmp	r6, #3
	beq	.L101
.L87:
	ldr	r3, [fp, #-60]
	add	r5, r5, #1
	add	r4, r4, #36
	ldr	r3, [r3, #52]
	cmp	r3, r5
	bls	.L102
.L90:
	ldrb	r1, [r4, #1626]	@ zero_extendqisi2
	and	r3, r5, #7
	ldr	r2, [r10, #24]
	and	r6, r5, #3
	ldr	r0, .L104+4
	add	r1, r2, r1, lsl #1
	ldrb	r2, [r4, #1627]	@ zero_extendqisi2
	add	r1, r0, r1, lsl #2
	cmp	r2, #1
	ldr	r2, [r4, #1644]
	ldr	r1, [r1, #36]
	moveq	r0, #8
	movne	r0, #0
	cmp	r3, #7
	and	r1, r1, #3
	mov	r2, r2, asl #1
	orr	r1, r0, r1
	and	r2, r2, #31
	mov	r3, r3, asl #2
	add	r0, r6, r6, lsl #2
	orr	r8, r8, r1, asl r3
	orr	r7, r7, r2, asl r0
	bne	.L84
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-48]
	ldr	r1, [r9, #848]
	add	r3, r3, r2
	ldr	r2, [r9, #852]
	rsb	r3, r1, r3
	cmp	r3, r2
	bcc	.L85
	ldr	r3, [fp, #-52]
	mov	r1, #1
	ldr	r2, [fp, #-48]
	str	r1, [r9, #844]
	mov	r3, r3, asl #2
	add	r2, r2, r3
.L86:
	ldr	r0, [r2]
	mov	r1, #251
	ldr	r8, [fp, #-52]
	ldr	r2, [fp, #-64]
	str	r0, [sp, #4]
	mov	r0, #5
	add	r2, r3, r2
	mov	r3, r8
	str	r2, [sp]
	ldr	r2, .L104+8
	bl	dprint_normal
	cmp	r6, #3
	add	r3, r8, #1
	mov	r8, #0
	str	r3, [fp, #-52]
	bne	.L87
.L101:
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-48]
	ldr	r1, [r9, #848]
	add	r3, r3, r2
	ldr	r2, [r9, #852]
	rsb	r3, r1, r3
	cmp	r3, r2
	bcc	.L88
	ldr	r3, [fp, #-56]
	mov	r1, #1
	ldr	r2, [fp, #-48]
	str	r1, [r9, #844]
	mov	r3, r3, asl #2
	add	r2, r2, r3
.L89:
	ldr	r0, [r2]
	movw	r1, #259
	ldr	r6, [fp, #-56]
	mov	r7, #0
	ldr	r2, [fp, #-64]
	str	r0, [sp, #4]
	mov	r0, #5
	add	r2, r3, r2
	mov	r3, r6
	str	r2, [sp]
	ldr	r2, .L104+8
	bl	dprint_normal
	add	r3, r6, #1
	str	r3, [fp, #-56]
	b	.L87
.L85:
	ldr	r2, [fp, #-52]
	ldr	r1, [fp, #-48]
	mov	r3, r2, asl #2
	str	r8, [r1, r2, asl #2]
	add	r2, r1, r3
	b	.L86
.L88:
	ldr	r2, [fp, #-56]
	ldr	r1, [fp, #-48]
	mov	r3, r2, asl #2
	str	r7, [r1, r2, asl #2]
	add	r2, r1, r3
	b	.L89
.L102:
	tst	r3, #7
	beq	.L80
	ldr	r4, .L104
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-48]
	ldr	r1, [r4, #848]
	add	r3, r3, r2
	ldr	r2, [r4, #852]
	rsb	r3, r1, r3
	cmp	r3, r2
	bcs	.L103
	ldr	r2, [fp, #-52]
	ldr	r1, [fp, #-48]
	mov	r3, r2, asl #2
	str	r8, [r1, r2, asl #2]
	add	r2, r1, r3
.L93:
	ldr	r0, [r2]
	mov	r1, #268
	ldr	r2, [fp, #-64]
	str	r0, [sp, #4]
	add	r2, r3, r2
	mov	r0, #5
	ldr	r3, [fp, #-52]
	str	r2, [sp]
	ldr	r2, .L104+8
	bl	dprint_normal
	ldr	r3, [fp, #-48]
	ldr	r0, [fp, #-56]
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r3, r0
	rsb	r3, r1, r3
	ldr	r1, .L104
	cmp	r3, r2
	bcc	.L94
	ldr	r3, [fp, #-48]
	mov	r2, r0, asl #2
	mov	r0, #1
	str	r0, [r1, #844]
	add	r3, r3, r2
.L95:
	ldr	r0, [r3]
	movw	r1, #270
	ldr	r3, [fp, #-64]
	str	r0, [sp, #4]
	add	r2, r2, r3
	mov	r0, #5
	str	r2, [sp]
	ldr	r3, [fp, #-56]
	ldr	r2, .L104+8
	bl	dprint_normal
.L80:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L103:
	ldr	r3, [fp, #-52]
	mov	r1, #1
	ldr	r2, [fp, #-48]
	str	r1, [r4, #844]
	mov	r3, r3, asl #2
	add	r2, r2, r3
	b	.L93
.L94:
	ldr	r3, [fp, #-56]
	ldr	r1, [fp, #-48]
	mov	r2, r3, asl #2
	str	r7, [r1, r3, asl #2]
	add	r3, r1, r2
	b	.L95
.L105:
	.align	2
.L104:
	.word	g_HwMem
	.word	.LANCHOR0
	.word	.LC11
	UNWIND(.fnend)
	.size	H264HAL_SetSliceMsgRefPicFrame, .-H264HAL_SetSliceMsgRefPicFrame
	.align	2
	.global	H264HAL_SetSliceMsgRefPicField
	.type	H264HAL_SetSliceMsgRefPicField, %function
H264HAL_SetSliceMsgRefPicField:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	ip, [fp, #4]
	str	r3, [fp, #-60]
	mov	r9, r2
	add	r8, ip, #3
	str	r0, [fp, #-64]
	add	r3, r1, ip, lsl #2
	str	r3, [fp, #-56]
	mov	r7, ip, asl #3
	mov	r8, r8, asl #2
	ldr	r3, [r3, #52]
	add	r7, r7, #20
	cmp	r3, #0
	beq	.L106
	mov	r4, ip, asl #10
	mov	r5, #0
	add	ip, r4, ip, lsl #7
	ldr	r10, .L153
	add	r4, r1, ip
	str	r5, [fp, #-52]
	str	r5, [fp, #-48]
	b	.L130
.L109:
	cmp	r3, #2
	beq	.L117
	and	r6, r5, #3
	and	r3, r5, #7
.L116:
	cmp	r3, #7
	beq	.L150
.L124:
	cmp	r6, #3
	beq	.L151
.L127:
	ldr	r3, [fp, #-56]
	add	r5, r5, #1
	add	r4, r4, #36
	ldr	r3, [r3, #52]
	cmp	r3, r5
	bls	.L152
.L130:
	ldrb	r3, [r4, #1624]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L109
	ldrb	r3, [r4, #1625]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L110
	ldr	r1, [fp, #-64]
	and	r3, r5, #7
	ldrb	r2, [r4, #1628]	@ zero_extendqisi2
	ldrb	r0, [r4, #1629]	@ zero_extendqisi2
	ldr	r1, [r1, #24]
	add	r1, r1, r2, lsl #1
.L148:
	cmp	r0, #1
	ldr	r0, .L153+4
	and	r6, r5, #3
	add	r1, r0, r1, lsl #2
	moveq	r0, #8
	movne	r0, #0
	cmp	r2, #1
	ldr	r2, [r1, #68]
	moveq	r1, #4
	movne	r1, #0
	and	r2, r2, #3
	orr	r1, r1, r0
	orr	r2, r1, r2
	ldr	r1, [fp, #-48]
	mov	r0, r3, asl #2
	cmp	r3, #7
	orr	r2, r1, r2, asl r0
	str	r2, [fp, #-48]
	ldr	r2, [r4, #1644]
	add	r1, r6, r6, lsl #2
	ldr	r0, [fp, #-52]
	mov	r2, r2, asl #1
	and	r2, r2, #31
	orr	r2, r0, r2, asl r1
	str	r2, [fp, #-52]
	bne	.L124
.L150:
	ldr	r1, [r10, #848]
	add	r3, r9, r8
	ldr	r2, [r10, #852]
	rsb	r3, r1, r3
	cmp	r3, r2
	mov	r3, r8, asl #2
	addcs	r2, r9, r3
	ldrcc	r2, [fp, #-48]
	movcs	r1, #1
	strcs	r1, [r10, #844]
	mov	r1, #324
	strcc	r2, [r9, r8, asl #2]
	addcc	r2, r9, r3
	ldr	r0, [r2]
	ldr	r2, [fp, #-60]
	str	r0, [sp, #4]
	add	r2, r3, r2
	mov	r0, #5
	mov	r3, r8
	str	r2, [sp]
	add	r8, r8, #1
	ldr	r2, .L153+8
	bl	dprint_normal
	cmp	r6, #3
	mov	r3, #0
	str	r3, [fp, #-48]
	bne	.L127
.L151:
	ldr	r1, [r10, #848]
	add	r3, r9, r7
	ldr	r2, [r10, #852]
	rsb	r3, r1, r3
	cmp	r3, r2
	mov	r3, r7, asl #2
	addcs	r2, r9, r3
	ldrcc	r2, [fp, #-52]
	movcs	r1, #1
	strcs	r1, [r10, #844]
	mov	r1, #332
	strcc	r2, [r9, r7, asl #2]
	addcc	r2, r9, r3
	ldr	r0, [r2]
	ldr	r2, [fp, #-60]
	str	r0, [sp, #4]
	add	r2, r3, r2
	mov	r0, #5
	mov	r3, r7
	str	r2, [sp]
	add	r7, r7, #1
	ldr	r2, .L153+8
	bl	dprint_normal
	mov	r3, #0
	str	r3, [fp, #-52]
	b	.L127
.L117:
	ldrb	r3, [r4, #1625]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L118
	ldr	r1, [fp, #-64]
	and	r3, r5, #7
	ldrb	r2, [r4, #1630]	@ zero_extendqisi2
	ldrb	r0, [r4, #1631]	@ zero_extendqisi2
	ldr	r1, [r1, #24]
	add	r1, r1, r2, lsl #1
.L149:
	cmp	r0, #1
	ldr	r0, .L153+4
	and	r6, r5, #3
	add	r1, r0, r1, lsl #2
	moveq	r0, #8
	movne	r0, #0
	cmp	r2, #1
	ldr	r2, [r1, #68]
	moveq	r1, #4
	movne	r1, #0
	and	r2, r2, #3
	orr	r1, r1, r0
	orr	r2, r1, r2
	ldr	r1, [fp, #-48]
	mov	r0, r3, asl #2
	orr	r2, r1, r2, asl r0
	str	r2, [fp, #-48]
	ldr	r2, [r4, #1644]
	add	r1, r6, r6, lsl #2
	ldr	r0, [fp, #-52]
	mov	r2, r2, asl #1
	and	r2, r2, #30
	orr	r2, r2, #1
	orr	r2, r0, r2, asl r1
	str	r2, [fp, #-52]
	b	.L116
.L152:
	tst	r3, #7
	beq	.L106
	ldr	r4, .L153
	add	r3, r9, r8
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	rsb	r3, r1, r3
	cmp	r3, r2
	mov	r3, r8, asl #2
	addcs	r2, r9, r3
	ldrcc	r2, [fp, #-48]
	movcs	r1, #1
	strcs	r1, [r4, #844]
	movw	r1, #341
	strcc	r2, [r9, r8, asl #2]
	addcc	r2, r9, r3
	ldr	r0, [r2]
	ldr	r2, [fp, #-60]
	str	r0, [sp, #4]
	add	r2, r3, r2
	mov	r0, #5
	mov	r3, r8
	str	r2, [sp]
	ldr	r2, .L153+8
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r9, r7
	rsb	r3, r1, r3
	ldr	r1, .L153
	cmp	r3, r2
	mov	r3, r7, asl #2
	addcs	r9, r9, r3
	ldrcc	r2, [fp, #-52]
	movcs	r2, #1
	strcs	r2, [r1, #844]
	movw	r1, #343
	strcc	r2, [r9, r7, asl #2]
	addcc	r9, r9, r3
	ldr	r2, [fp, #-60]
	ldr	r0, [r9]
	add	r2, r3, r2
	mov	r3, r7
	str	r2, [sp]
	str	r0, [sp, #4]
	mov	r0, #5
	ldr	r2, .L153+8
	bl	dprint_normal
.L106:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L110:
	ldr	r2, [fp, #-64]
	and	r3, r5, #7
	ldrb	r1, [r4, #1626]	@ zero_extendqisi2
	ldrb	r0, [r4, #1629]	@ zero_extendqisi2
	ldr	r2, [r2, #24]
	add	r1, r2, r1, lsl #1
	ldrb	r2, [r4, #1628]	@ zero_extendqisi2
	b	.L148
.L118:
	ldr	r2, [fp, #-64]
	and	r3, r5, #7
	ldrb	r1, [r4, #1626]	@ zero_extendqisi2
	ldrb	r0, [r4, #1631]	@ zero_extendqisi2
	ldr	r2, [r2, #24]
	add	r1, r2, r1, lsl #1
	ldrb	r2, [r4, #1630]	@ zero_extendqisi2
	b	.L149
.L154:
	.align	2
.L153:
	.word	g_HwMem
	.word	.LANCHOR0
	.word	.LC11
	UNWIND(.fnend)
	.size	H264HAL_SetSliceMsgRefPicField, .-H264HAL_SetSliceMsgRefPicField
	.align	2
	.global	H264HAL_SetSliceMsgRefPicInfo
	.type	H264HAL_SetSliceMsgRefPicInfo, %function
H264HAL_SetSliceMsgRefPicInfo:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldrb	ip, [r0]	@ zero_extendqisi2
	mov	r4, r0
	mov	r5, r1
	cmp	ip, #0
	mov	r6, r2
	mov	r7, r3
	bne	.L156
	str	ip, [sp]
	bl	H264HAL_SetSliceMsgRefPicFrame
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldr	r3, .L161
	add	r3, r3, r2, lsl #2
	ldr	r3, [r3, #24]
	cmp	r3, #2
	beq	.L160
.L155:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L156:
	mov	ip, #0
	str	ip, [sp]
	bl	H264HAL_SetSliceMsgRefPicField
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldr	r3, .L161
	add	r3, r3, r2, lsl #2
	ldr	r3, [r3, #24]
	cmp	r3, #2
	bne	.L155
	mov	ip, #1
	mov	r3, r7
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	str	ip, [sp]
	bl	H264HAL_SetSliceMsgRefPicField
	b	.L155
.L160:
	mov	ip, #1
	mov	r3, r7
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	str	ip, [sp]
	bl	H264HAL_SetSliceMsgRefPicFrame
	b	.L155
.L162:
	.align	2
.L161:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	H264HAL_SetSliceMsgRefPicInfo, .-H264HAL_SetSliceMsgRefPicInfo
	.align	2
	.global	H264HAL_SetSliceMsgAPCInfo
	.type	H264HAL_SetSliceMsgAPCInfo, %function
H264HAL_SetSliceMsgAPCInfo:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	mov	r5, r1
	ldr	r1, [r5, #3928]!
	mov	r7, r2
	ldr	r8, .L170
	mov	r9, r3
	and	r1, r1, #31
	mov	r4, #0
	mov	r6, #36
.L164:
	add	r4, r4, #1
	and	r3, r4, #3
	cmp	r4, #32
	add	r0, r3, r3, lsl #2
	beq	.L169
	ldr	r2, [r5, #4]!
	cmp	r3, #3
	and	r3, r2, #31
	orr	r1, r1, r3, asl r0
	bne	.L164
	ldr	r0, [r8, #848]
	mov	r2, r6, asl #2
	add	r3, r7, r6
	ldr	ip, [r8, #852]
	rsb	r3, r0, r3
	add	r0, r7, r2
	cmp	r3, ip
	mov	r3, #1
	strcc	r1, [r7, r6, asl #2]
	add	r2, r2, r9
	strcs	r3, [r8, #844]
	mov	r3, r6
	ldr	r1, [r0]
	mov	r0, #5
	str	r2, [sp]
	add	r6, r6, #1
	ldr	r2, .L170+4
	str	r1, [sp, #4]
	movw	r1, #381
	bl	dprint_normal
	mov	r1, #0
	b	.L164
.L169:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L171:
	.align	2
.L170:
	.word	g_HwMem
	.word	.LC11
	UNWIND(.fnend)
	.size	H264HAL_SetSliceMsgAPCInfo, .-H264HAL_SetSliceMsgAPCInfo
	.align	2
	.global	H264HAL_SetSliceMsgWPInfo
	.type	H264HAL_SetSliceMsgWPInfo, %function
H264HAL_SetSliceMsgWPInfo:
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
	mov	r6, r1
	ldr	r1, [r0, #276]
	mov	r5, r2
	str	r3, [fp, #-64]
	cmp	r1, #0
	beq	.L173
	ldrb	r3, [r6]	@ zero_extendqisi2
	ldr	r2, .L219
	add	r3, r2, r3, lsl #2
	str	r2, [fp, #-60]
	ldr	r3, [r3, #24]
	cmp	r3, #1
	beq	.L174
.L173:
	ldr	r3, [r0, #280]
	cmp	r3, #1
	beq	.L217
.L172:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L217:
	ldrb	r3, [r6]	@ zero_extendqisi2
	ldr	r2, .L219
	add	r3, r2, r3, lsl #2
	str	r2, [fp, #-60]
	ldr	r3, [r3, #24]
	cmp	r3, #2
	bne	.L172
.L174:
	ldr	r3, [r6, #44]
	movw	r1, #399
	ldr	r2, .L219+4
	mov	r0, #5
	ldr	r9, .L219+8
	bl	dprint_normal
	mov	r4, #0
	ldr	r3, [fp, #-64]
	mov	r7, r4
	mov	r8, r6
	add	r2, r3, #256
	str	r6, [fp, #-68]
	str	r2, [fp, #-48]
	add	r2, r3, #512
	add	r3, r3, #768
	str	r2, [fp, #-52]
	str	r3, [fp, #-56]
.L183:
	ldr	r1, [r9, #848]
	add	r3, r7, #256
	ldr	r2, [r9, #852]
	add	r3, r5, r3
	rsb	r3, r1, r3
	ldr	ip, [r8, #856]
	cmp	r3, r2
	ldr	r3, [r8, #88]
	ldr	r2, [r6, #80]
	add	r0, r4, #256
	ubfxcc	r3, r3, #0, #9
	uxtbcc	ip, ip
	ldrcs	r3, .L219+8
	add	r1, r5, r0
	movcc	r3, r3, asl #3
	andcc	r2, r2, #7
	orrcc	ip, r3, ip, asl #12
	mov	r10, #1
	orrcc	r2, ip, r2
	strcs	r10, [r3, #844]
	strcc	r2, [r5, r0]
	mov	r10, #1
	ldr	r0, [r1]
	movw	r1, #422
	ldr	r3, [fp, #-48]
	add	r8, r8, #4
	add	r2, r3, r4
	str	r0, [sp, #4]
	add	r3, r7, #64
	str	r2, [sp]
	mov	r0, #5
	ldr	r2, .L219+12
	bl	dprint_normal
	ldr	r1, [r9, #848]
	add	r3, r7, #512
	ldr	r2, [r9, #852]
	add	r3, r5, r3
	ldr	ip, [r8, #980]
	rsb	r3, r1, r3
	add	r0, r4, #512
	cmp	r3, r2
	ldr	r3, [r8, #212]
	ldr	r2, [r6, #84]
	uxtbcc	ip, ip
	ubfxcc	r3, r3, #0, #9
	ldrcs	r3, .L219+8
	add	r1, r5, r0
	andcc	r2, r2, #7
	movcc	r3, r3, asl #3
	orrcc	ip, r3, ip, asl #12
	strcs	r10, [r3, #844]
	orrcc	r2, ip, r2
	strcc	r2, [r5, r0]
	ldr	r0, [r1]
	mov	r1, #428
	ldr	r3, [fp, #-52]
	str	r0, [sp, #4]
	add	r2, r3, r4
	mov	r0, #5
	add	r3, r7, #128
	str	r2, [sp]
	ldr	r2, .L219+12
	bl	dprint_normal
	ldr	r1, [r9, #848]
	add	r3, r7, #768
	ldr	r0, [r9, #852]
	add	r3, r5, r3
	add	r2, r4, #768
	rsb	r3, r1, r3
	add	r1, r5, r2
	cmp	r3, r0
	ldr	r0, [r8, #1108]
	ldr	r3, [r8, #340]
	mov	lr, #1
	ldrcs	r3, .L219+8
	uxtbcc	r0, r0
	ubfxcc	r3, r3, #0, #9
	strcs	lr, [r3, #844]
	orrcc	r3, r3, r0, asl #9
	strcc	r3, [r5, r2]
	ldr	r0, [r1]
	movw	r1, #433
	ldr	r3, [fp, #-56]
	str	r0, [sp, #4]
	add	r2, r3, r4
	mov	r0, #5
	add	r3, r7, #192
	str	r2, [sp]
	add	r7, r7, #1
	ldr	r2, .L219+12
	add	r4, r4, #4
	bl	dprint_normal
	ldr	r3, [r6, #44]
	cmp	r7, r3
	bls	.L183
	ldr	r3, [r6, #80]
	mov	r1, #436
	ldr	r2, .L219+16
	mov	r0, #5
	bl	dprint_normal
	add	r8, r6, #84
	add	r7, r6, #852
	mov	r4, #0
.L184:
	ldr	r3, [r8, #4]!
	mov	r1, #440
	ldr	r2, .L219+20
	mov	r0, #5
	bl	dprint_normal
	ldr	r3, [r7, #4]!
	ldr	r2, .L219+24
	movw	r1, #441
	mov	r0, #5
	add	r4, r4, #1
	bl	dprint_normal
	ldr	r3, [r6, #44]
	cmp	r4, r3
	bls	.L184
	ldrb	r3, [r6]	@ zero_extendqisi2
	ldr	r2, [fp, #-60]
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #24]
	cmp	r3, #2
	beq	.L185
.L188:
	ldr	r3, [r6, #84]
	movw	r1, #453
	ldr	r2, .L219+28
	mov	r0, #5
	bl	dprint_normal
	add	r8, r6, #212
	add	r7, r6, #980
	mov	r4, #0
.L186:
	ldr	r3, [r8, #4]!
	movw	r1, #457
	ldr	r2, .L219+32
	mov	r0, #5
	bl	dprint_normal
	ldr	r3, [r7, #4]!
	ldr	r2, .L219+36
	movw	r1, #458
	mov	r0, #5
	add	r4, r4, #1
	bl	dprint_normal
	ldr	r3, [r6, #44]
	cmp	r4, r3
	bls	.L186
	ldrb	r3, [r6]	@ zero_extendqisi2
	ldr	r2, [fp, #-60]
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #24]
	cmp	r3, #2
	beq	.L218
.L189:
	add	r7, r6, #1104
	add	r8, r6, #340
	add	r7, r7, #4
	mov	r4, #0
.L191:
	ldr	r3, [r8, #4]!
	mov	r1, #472
	ldr	r2, .L219+40
	mov	r0, #5
	bl	dprint_normal
	ldr	r3, [r7, #4]!
	ldr	r2, .L219+44
	movw	r1, #473
	mov	r0, #5
	add	r4, r4, #1
	bl	dprint_normal
	ldr	r3, [r6, #44]
	cmp	r4, r3
	bls	.L191
	ldrb	r3, [r6]	@ zero_extendqisi2
	ldr	r2, [fp, #-60]
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #24]
	cmp	r3, #2
	bne	.L172
	add	r7, r6, #1488
	add	r8, r6, #724
	add	r7, r7, #4
	mov	r4, #0
.L193:
	ldr	r3, [r8, #4]!
	mov	r1, #480
	ldr	r2, .L219+48
	mov	r0, #5
	bl	dprint_normal
	ldr	r3, [r7, #4]!
	ldr	r2, .L219+52
	movw	r1, #481
	mov	r0, #5
	add	r4, r4, #1
	bl	dprint_normal
	ldr	r3, [r6, #40]
	cmp	r4, r3
	bls	.L193
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldr	r1, [fp, #-60]
	add	r2, r1, r2, lsl #2
	ldr	r2, [r2, #24]
	cmp	r2, #2
	bne	.L172
	ldr	r2, .L219+56
	mov	r1, #488
	mov	r0, #5
	add	r8, r5, #640
	bl	dprint_normal
	add	r3, r5, #896
	str	r3, [fp, #-60]
	add	r7, r5, #384
	ldr	r3, [fp, #-64]
	mov	r4, #0
	add	r10, r3, #896
	str	r10, [fp, #-56]
	ldr	r10, [fp, #-68]
	add	r2, r3, #640
	add	r3, r3, #384
	str	r2, [fp, #-48]
	str	r3, [fp, #-52]
.L200:
	ldr	r1, [r9, #848]
	add	r3, r4, #288
	ldr	r2, [r9, #852]
	add	r3, r5, r3
	rsb	r3, r1, r3
	ldr	r1, [r10, #1240]
	cmp	r3, r2
	ldr	r3, [r10, #472]
	ldr	r2, [r6, #80]
	mov	r0, #1
	ubfx	r3, r3, #0, #9
	uxtb	r1, r1
	ldrcs	r3, .L219+8
	and	r2, r2, #7
	movcc	r3, r3, asl #3
	add	r10, r10, #4
	orrcc	r3, r3, r1, asl #12
	mov	r1, #496
	strcs	r0, [r3, #844]
	orrcc	r2, r3, r2
	strcc	r2, [r7]
	add	r3, r4, #96
	ldr	ip, [r7]
	mov	r0, #5
	ldr	r2, [fp, #-52]
	add	r8, r8, #4
	add	r7, r7, #4
	str	ip, [sp, #4]
	str	r2, [sp]
	ldr	r2, .L219+12
	bl	dprint_normal
	ldr	r0, [r9, #848]
	add	r3, r4, #544
	ldr	r2, [r9, #852]
	add	r3, r5, r3
	mov	r1, #1
	rsb	r3, r0, r3
	ldr	r0, [r10, #1364]
	cmp	r3, r2
	ldr	r3, [r10, #596]
	ldr	r2, [r6, #84]
	ubfx	r3, r3, #0, #9
	uxtb	r0, r0
	ldrcs	r3, .L219+8
	and	r2, r2, #7
	movcc	r3, r3, asl #3
	orrcc	r3, r3, r0, asl #12
	mov	r0, #5
	strcs	r1, [r3, #844]
	orrcc	r2, r3, r2
	strcc	r2, [r8, #-4]
	add	r3, r4, #160
	ldr	ip, [r8, #-4]
	movw	r1, #502
	ldr	r2, [fp, #-48]
	str	ip, [sp, #4]
	str	r2, [sp]
	ldr	r2, .L219+12
	bl	dprint_normal
	ldr	r2, [r9, #848]
	add	r3, r4, #800
	ldr	r0, [r9, #852]
	add	r3, r5, r3
	mov	r1, #1
	rsb	r3, r2, r3
	ldr	r2, [r10, #1492]
	cmp	r3, r0
	ldr	r3, [r10, #724]
	mov	r0, #5
	uxtb	r2, r2
	ubfx	r3, r3, #0, #9
	ldrcs	r3, .L219+8
	orrcc	r3, r3, r2, asl #9
	ldrcc	r2, [fp, #-60]
	strcs	r1, [r3, #844]
	movw	r1, #507
	strcc	r3, [r2]
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-56]
	ldr	ip, [r3], #4
	str	r2, [sp]
	ldr	r2, .L219+12
	str	r3, [fp, #-60]
	add	r3, r4, #224
	str	ip, [sp, #4]
	add	r4, r4, #1
	bl	dprint_normal
	ldr	r3, [r6, #40]
	ldr	r2, [fp, #-56]
	cmp	r4, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, #4
	str	r2, [fp, #-56]
	add	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-52]
	add	r3, r3, #4
	str	r3, [fp, #-52]
	bls	.L200
	b	.L172
.L218:
	add	r7, r6, #1360
	add	r8, r6, #596
	add	r7, r7, #4
	mov	r4, #0
.L190:
	ldr	r3, [r8, #4]!
	movw	r1, #465
	ldr	r2, .L219+60
	mov	r0, #5
	bl	dprint_normal
	ldr	r3, [r7, #4]!
	ldr	r2, .L219+64
	movw	r1, #466
	mov	r0, #5
	add	r4, r4, #1
	bl	dprint_normal
	ldr	r3, [r6, #40]
	cmp	r4, r3
	bls	.L190
	b	.L189
.L185:
	add	r7, r6, #1232
	add	r8, r6, #468
	add	r7, r7, #4
	mov	r4, #0
.L187:
	ldr	r3, [r8, #4]!
	mov	r1, #448
	ldr	r2, .L219+68
	mov	r0, #5
	bl	dprint_normal
	ldr	r3, [r7, #4]!
	ldr	r2, .L219+72
	movw	r1, #449
	mov	r0, #5
	add	r4, r4, #1
	bl	dprint_normal
	ldr	r3, [r6, #40]
	cmp	r4, r3
	bls	.L187
	b	.L188
.L220:
	.align	2
.L219:
	.word	.LANCHOR0
	.word	.LC12
	.word	g_HwMem
	.word	.LC11
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
	.word	.LC21
	.word	.LC22
	.word	.LC17
	.word	.LC18
	UNWIND(.fnend)
	.size	H264HAL_SetSliceMsgWPInfo, .-H264HAL_SetSliceMsgWPInfo
	.align	2
	.global	H264HAL_CheckParaValid
	.type	H264HAL_CheckParaValid, %function
H264HAL_CheckParaValid:
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
	ldr	r0, [r0, #800]
	cmp	r0, #0
	movne	r0, #0
	beq	.L224
.L222:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L224:
	ldr	ip, .L225
	movw	r1, #515
	ldr	r3, .L225+4
	ldr	r2, .L225+8
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L222
.L226:
	.align	2
.L225:
	.word	.LC28
	.word	.LANCHOR0+100
	.word	.LC2
	UNWIND(.fnend)
	.size	H264HAL_CheckParaValid, .-H264HAL_CheckParaValid
	.align	2
	.global	H264HAL_FindNextSlicePara
	.type	H264HAL_FindNextSlicePara, %function
H264HAL_FindNextSlicePara:
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
	cmp	r2, r1
	ldr	lr, [r0, #48]
	str	r2, [r3]
	ldmgefd	sp, {fp, sp, pc}
	ldr	r0, [r0, #4056]
	cmp	r0, #0
	beq	.L231
	ldr	ip, [r0, #48]
	cmp	lr, ip
	ldmccfd	sp, {fp, sp, pc}
	add	r2, r2, #1
	b	.L230
.L232:
	ldr	r0, [r0, #4056]
	cmp	r0, #0
	beq	.L231
	ldr	ip, [r0, #48]
	cmp	lr, ip
	ldmccfd	sp, {fp, sp, pc}
.L230:
	cmp	r2, r1
	str	r2, [r3]
	add	r2, r2, #1
	bne	.L232
	ldmfd	sp, {fp, sp, pc}
.L231:
	movw	r3, #530
	ldr	r2, .L236
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L237:
	.align	2
.L236:
	.word	.LC29
	UNWIND(.fnend)
	.size	H264HAL_FindNextSlicePara, .-H264HAL_FindNextSlicePara
	.align	2
	.global	H264HAL_SetPicMsg
	.type	H264HAL_SetPicMsg, %function
H264HAL_SetPicMsg:
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
	UNWIND(.pad #44)
	sub	sp, sp, #44
	mov	r6, r0
	mov	r0, r2
	str	r2, [fp, #-48]
	str	r1, [fp, #-68]
	mov	r7, r3
	bl	MEM_Phy2Vir
	subs	r5, r0, #0
	beq	.L311
	ldrb	r0, [r6]	@ zero_extendqisi2
	ldr	r2, [r6, #8]
	ldr	r4, .L313
	ldr	r3, [r6, #24]
	cmp	r2, #0
	ldrb	r1, [r6, #1]	@ zero_extendqisi2
	add	r0, r3, r0, lsl #1
	ldr	r3, .L313+4
	ldr	ip, [r4, #848]
	movne	r2, #-2147483648
	add	r3, r3, r0, lsl #2
	cmp	r1, #1
	ldr	lr, [r4, #852]
	rsb	ip, ip, r5
	moveq	r1, #33554432
	movne	r1, #0
	cmp	ip, lr
	ldr	ip, [r3, #144]
	ldr	r3, [r6, #20]
	ldr	lr, [r6, #28]
	movcs	r3, #1
	ldr	r8, [r6, #32]
	ldr	r9, [r6, #36]
	ldr	r0, [r6, #12]
	strcs	r3, [r4, #844]
	bcs	.L244
	sub	r3, r3, #1
	sub	r0, r0, #1
	orr	r3, r3, r9, asl #26
	orr	r8, r3, r8, asl #27
	orr	lr, r8, lr, asl #28
	orr	r0, lr, r0, asl #16
	orr	ip, r0, ip, asl #14
	orr	ip, ip, r2
	orr	ip, ip, r1
	str	ip, [r5]
.L244:
	mov	r8, r5
	ldr	r3, [fp, #-48]
	ldr	ip, [r8], #1
	movw	r1, #565
	ldr	r2, .L313+8
	mov	r0, #5
	str	ip, [sp]
	bl	dprint_normal
	ldr	r2, [r4, #848]
	ldr	r3, [r4, #852]
	movw	r1, #570
	rsb	r8, r2, r8
	ldr	r2, [r6, #288]
	cmp	r8, r3
	ldr	r3, .L313
	mov	r0, #5
	strcc	r2, [r5, #4]
	movcs	r2, #1
	strcs	r2, [r3, #844]
	ldr	ip, [r5, #4]
	ldr	r3, [fp, #-48]
	ldr	r2, .L313+12
	add	r3, r3, #4
	str	ip, [sp]
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r5, #2
	rsb	r3, r1, r3
	ldr	r1, [r6, #40]
	cmp	r3, r2
	ldr	r3, .L313
	mov	r0, #5
	strcc	r1, [r5, #8]
	movcs	r2, #1
	strcs	r2, [r3, #844]
	movw	r1, #575
	ldr	ip, [r5, #8]
	ldr	r3, [fp, #-48]
	ldr	r2, .L313+16
	add	r3, r3, #8
	str	ip, [sp]
	bl	dprint_normal
	ldr	r2, [r6, #24]
	ldr	r0, [r4, #848]
	cmp	r2, #0
	bne	.L312
	ldr	r1, [r4, #852]
	add	r3, r5, #3
	rsb	r3, r0, r3
	ldr	ip, .L313
	cmp	r3, r1
	strcc	r2, [r5, #12]
	ldr	r8, [fp, #-48]
	ldrcc	r0, [ip, #848]
	movcs	r3, #1
	ldrcc	r1, [ip, #852]
	strcs	r3, [ip, #844]
	add	r3, r5, #4
	rsb	r3, r0, r3
	ldr	r2, .L313+20
	cmp	r3, r1
	mov	r0, #5
	movw	r1, #593
	movcs	r3, #1
	strcs	r3, [r4, #844]
	ldr	ip, [r5, #12]
	movcc	r3, #0
	strcc	r3, [r5, #16]
	add	r3, r8, #12
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #16]
	add	r3, r8, #16
	ldr	r2, .L313+24
	movw	r1, #594
	mov	r0, #5
	str	ip, [sp]
	bl	dprint_normal
.L254:
	ldr	r1, [r4, #848]
	add	r3, r5, #5
	ldr	r2, [r4, #852]
	mov	r0, #5
	rsb	r3, r1, r3
	ldr	r1, [fp, #-68]
	cmp	r3, r2
	ldr	r3, .L313
	ldr	r1, [r1, #900]
	movcs	r2, #1
	strcs	r2, [r3, #844]
	ldr	r3, [fp, #-48]
	strcc	r1, [r5, #20]
	movw	r1, #601
	ldr	ip, [r5, #20]
	add	r3, r3, #20
	ldr	r2, .L313+28
	str	ip, [sp]
	bl	dprint_normal
	ldr	r1, [r4, #848]
	add	r3, r5, #6
	ldr	r2, [r4, #852]
	rsb	r3, r1, r3
	ldr	r1, [fp, #-68]
	cmp	r3, r2
	ldr	r3, .L313
	mov	r0, #5
	ldr	r1, [r1, #904]
	movcs	r2, #1
	strcs	r2, [r3, #844]
	ldr	r3, [fp, #-48]
	strcc	r1, [r5, #24]
	movw	r1, #606
	ldr	ip, [r5, #24]
	add	r3, r3, #24
	ldr	r2, .L313+32
	str	ip, [sp]
	bl	dprint_normal
	ldrb	r3, [r6]	@ zero_extendqisi2
	ldr	r0, [r4, #848]
	cmp	r3, #2
	ldr	r3, [r6, #292]
	ldr	r1, [r4, #852]
	addeq	r3, r3, #110
	ldreq	r2, [r6, #572]
	addne	r3, r3, #110
	ldreq	r3, [r6, r3, asl #2]
	ldrne	r2, [r6, r3, asl #2]
	addeq	r2, r3, r2
	add	r3, r5, #7
	rsb	r3, r0, r3
	ldr	r0, .L313
	cmp	r3, r1
	strcc	r2, [r5, #28]
	movw	r1, #619
	ldr	r2, .L313+36
	movcs	r3, #1
	strcs	r3, [r0, #844]
	ldr	ip, [r5, #28]
	mov	r0, #5
	ldr	r3, [fp, #-48]
	str	ip, [sp]
	add	r3, r3, #28
	bl	dprint_normal
	ldr	r1, [r4, #848]
	add	r3, r5, #8
	ldr	r2, [r4, #852]
	rsb	r3, r1, r3
	ldr	r1, [fp, #-68]
	cmp	r3, r2
	ldr	r3, .L313
	mov	r0, #5
	ldr	r1, [r1, #908]
	movcs	r2, #1
	strcs	r2, [r3, #844]
	ldr	r3, [fp, #-48]
	strcc	r1, [r5, #32]
	mov	r1, #624
	ldr	ip, [r5, #32]
	add	r3, r3, #32
	ldr	r2, .L313+40
	str	ip, [sp]
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r5, #9
	rsb	r3, r1, r3
	ldr	r1, .L313
	cmp	r3, r2
	strcc	r7, [r5, #36]
	ldr	r2, .L313+44
	mov	r0, #5
	movcs	r3, #1
	strcs	r3, [r1, #844]
	ldr	ip, [r5, #36]
	movw	r1, #629
	ldr	r3, [fp, #-48]
	str	ip, [sp]
	add	r3, r3, #36
	bl	dprint_normal
	ldr	r3, [r6, #792]
	cmp	r3, #0
	beq	.L271
	add	r10, r6, #596
	add	r9, r5, #40
	mov	r8, #40
	mov	r7, #0
.L274:
	add	r3, r7, #10
	ldr	r0, [r4, #848]
	ldr	r2, [r10, #4]!
	add	r1, r5, r3
	rsb	r1, r0, r1
	ldr	r0, [r4, #852]
	mov	ip, #1
	add	r7, r7, #1
	cmp	r1, r0
	add	r2, r6, r2, lsl #2
	ldr	r2, [r2, #300]
	ldrcs	r2, .L313
	strcc	r2, [r9]
	strcs	ip, [r2, #844]
	ldr	r0, [r9], #4
	ldr	r2, [fp, #-48]
	str	r0, [sp, #4]
	add	r1, r8, r2
	mov	r0, #5
	str	r1, [sp]
	ldr	r2, .L313+48
	movw	r1, #637
	bl	dprint_normal
	ldr	r3, [r6, #792]
	add	r8, r8, #4
	cmp	r3, r7
	bhi	.L274
	cmp	r3, #15
	bhi	.L280
.L271:
	add	r7, r3, #10
	ldr	r9, .L313
	ldr	r10, [fp, #-48]
	mov	r8, r7, asl #2
.L279:
	ldr	r2, [r6, #600]
	add	r3, r5, r7
	ldr	lr, [r4, #848]
	add	r1, r5, r8
	ldr	r0, [r4, #852]
	mov	ip, #1
	add	r2, r6, r2, lsl #2
	rsb	r3, lr, r3
	cmp	r3, r0
	ldr	r3, [r2, #300]
	add	r2, r8, r10
	strcs	ip, [r9, #844]
	strcc	r3, [r5, r8]
	mov	r3, r7
	ldr	r0, [r1]
	mov	r1, #644
	str	r2, [sp]
	add	r8, r8, #4
	ldr	r2, .L313+48
	str	r0, [sp, #4]
	mov	r0, #5
	bl	dprint_normal
	sub	r3, r7, #9
	cmp	r3, #15
	add	r7, r7, #1
	bls	.L279
.L280:
	ldr	r1, [r4, #848]
	add	r3, r5, #26
	ldr	r2, [r4, #852]
	rsb	r3, r1, r3
	ldr	r1, [fp, #-68]
	cmp	r3, r2
	ldr	r3, .L313
	movcs	r2, #1
	ldr	r1, [r1, #856]
	strcs	r2, [r3, #844]
	strcc	r1, [r5, #104]
.L281:
	ldr	ip, [r5, #104]
	movw	r1, #650
	ldr	r3, [fp, #-48]
	mov	r0, #5
	ldr	r2, .L313+52
	add	r3, r3, #104
	str	ip, [sp]
	bl	dprint_normal
	ldr	r7, [r6, #792]
	cmp	r7, #0
	ldreq	r3, [fp, #-48]
	addeq	r3, r3, #108
	streq	r3, [fp, #-56]
	beq	.L283
	ldr	r3, [fp, #-48]
	mov	r8, #0
	add	r10, r5, #108
	mov	r7, r6
	str	r6, [fp, #-60]
	mov	r9, r5
	mov	r6, r8
	add	r2, r3, #108
	str	r5, [fp, #-72]
	add	r3, r3, #112
	str	r2, [fp, #-56]
	add	r2, r5, #112
	str	r3, [fp, #-64]
	str	r2, [fp, #-52]
.L288:
	ldr	r0, [r4, #848]
	add	r3, r9, #27
	ldr	r2, [r4, #852]
	mov	r1, #1
	rsb	r3, r0, r3
	mov	r5, r6, asl r1
	cmp	r3, r2
	ldr	r2, [r7, #664]
	add	r3, r5, #27
	add	r6, r6, #1
	ldrcs	r2, .L313
	add	r7, r7, #4
	strcc	r2, [r10]
	add	r10, r10, #8
	strcs	r1, [r2, #844]
	ldr	r0, [r10, #-8]
	ldr	r2, [fp, #-56]
	str	r0, [sp, #4]
	add	r1, r8, r2
	mov	r0, #5
	ldr	r2, .L313+48
	str	r1, [sp]
	movw	r1, #657
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r9, #28
	rsb	r2, r3, r2
	add	r3, r5, #28
	cmp	r2, r1
	ldr	r2, [r7, #724]
	mov	r1, #1
	add	r9, r9, #2
	ldrcc	r1, [fp, #-52]
	ldrcs	r2, .L313
	strcc	r2, [r1]
	strcs	r1, [r2, #844]
	ldr	r2, [fp, #-52]
	ldr	r0, [r2], #8
	str	r2, [fp, #-52]
	ldr	r2, [fp, #-64]
	str	r0, [sp, #4]
	mov	r0, #5
	add	r1, r2, r8
	ldr	r2, .L313+48
	str	r1, [sp]
	movw	r1, #661
	bl	dprint_normal
	ldr	r3, [fp, #-60]
	add	r8, r8, #8
	ldr	r3, [r3, #792]
	cmp	r3, r6
	bhi	.L288
	cmp	r3, #15
	ldr	r5, [fp, #-72]
	mov	r7, r3
	ldr	r6, [fp, #-60]
	bhi	.L296
.L283:
	add	r9, r7, #14
	mov	r8, r7, asl #1
	str	r6, [fp, #-52]
	add	r8, r8, #27
	ldr	r10, .L313
	mov	r9, r9, asl #3
	ldr	r6, [fp, #-56]
.L295:
	ldr	r1, [r4, #848]
	add	r3, r5, r8
	ldr	r0, [r4, #852]
	sub	r2, r9, #112
	rsb	r3, r1, r3
	add	r1, r5, r8, lsl #2
	cmp	r3, r0
	mov	r0, #1
	mov	r3, #0
	strcs	r0, [r10, #844]
	strcc	r3, [r5, r8, asl #2]
	add	r2, r2, r6
	ldr	r0, [r1]
	mov	r3, r8
	str	r2, [sp]
	mov	r1, #668
	ldr	r2, .L313+48
	add	r7, r7, #1
	str	r0, [sp, #4]
	mov	r0, #5
	bl	dprint_normal
	ldr	ip, [r4, #848]
	add	r3, r8, #1
	ldr	r0, [r4, #852]
	add	r1, r5, r9
	add	r2, r5, r3
	rsb	r2, ip, r2
	mov	ip, #1
	cmp	r2, r0
	mov	r2, #0
	strcs	ip, [r10, #844]
	add	r8, r8, #2
	strcc	r2, [r5, r9]
	ldr	r0, [r1]
	mov	r1, #672
	ldr	r2, [fp, #-48]
	str	r0, [sp, #4]
	add	ip, r9, r2
	mov	r0, #5
	ldr	r2, .L313+48
	str	ip, [sp]
	add	r9, r9, #8
	bl	dprint_normal
	cmp	r7, #15
	bls	.L295
	ldr	r6, [fp, #-52]
.L296:
	ldr	r1, [r4, #848]
	add	r3, r5, #59
	ldr	r2, [r4, #852]
	rsb	r3, r1, r3
	ldr	r1, [fp, #-68]
	cmp	r3, r2
	ldr	r3, .L313
	movcs	r2, #1
	ldr	r1, [r1, #912]
	strcs	r2, [r3, #844]
	strcc	r1, [r5, #236]
.L297:
	ldr	r2, [fp, #-48]
	add	r0, r6, #52
	add	r3, r5, #256
	mov	r1, #56
	add	r2, r2, #256
	bl	H264HAL_Write_Qmatrix
	mov	r0, #0
.L240:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L312:
	ldr	r1, [r4, #852]
	add	r2, r5, #3
	ldr	ip, [r6, #44]
	rsb	r2, r0, r2
	ldr	r3, .L313
	cmp	r2, r1
	ldr	r8, [fp, #-48]
	strcc	ip, [r5, #12]
	movcs	r2, #1
	ldrcc	r0, [r3, #848]
	strcs	r2, [r3, #844]
	ldrcc	r1, [r3, #852]
	add	r3, r5, #4
	rsb	r3, r0, r3
	ldr	r2, [r6, #48]
	cmp	r3, r1
	mov	r0, #5
	movw	r1, #585
	movcs	r3, #1
	strcs	r3, [r4, #844]
	ldr	ip, [r5, #12]
	add	r3, r8, #12
	strcc	r2, [r5, #16]
	ldr	r2, .L313+20
	str	ip, [sp]
	bl	dprint_normal
	ldr	ip, [r5, #16]
	add	r3, r8, #16
	ldr	r2, .L313+24
	movw	r1, #586
	mov	r0, #5
	str	ip, [sp]
	bl	dprint_normal
	b	.L254
.L311:
	ldr	ip, .L313+56
	movw	r1, #550
	ldr	r3, .L313+60
	ldr	r2, .L313+64
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L240
.L314:
	.align	2
.L313:
	.word	g_HwMem
	.word	.LANCHOR0
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC30
	.word	.LANCHOR0+124
	.word	.LC2
	UNWIND(.fnend)
	.size	H264HAL_SetPicMsg, .-H264HAL_SetPicMsg
	.align	2
	.global	H264HAL_SetSliceMsg
	.type	H264HAL_SetSliceMsg, %function
H264HAL_SetSliceMsg:
	UNWIND(.fnstart)
	@ args = 16, pretend = 0, frame = 8
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
	mov	r8, r0
	mov	r0, r3
	mov	r7, r3
	mov	r4, r2
	bl	MEM_Phy2Vir
	subs	r5, r0, #0
	beq	.L335
	ldr	r6, .L337
	mov	r3, r7
	mov	r2, r5
	mov	r1, r4
	mov	r0, r8
	bl	H264HAL_SetSliceMsgStreamAddrInfo
	ldr	r1, [r6, #848]
	ldr	r2, [r6, #852]
	add	r3, r5, #6
	rsb	r3, r1, r3
	ldr	r0, [r4, #32]
	cmp	r3, r2
	ldr	r1, [r4, #36]
	ldr	r3, [r4, #48]
	andcc	r1, r1, #3
	movcs	r3, #1
	ubfxcc	r2, r3, #0, #20
	orrcc	r3, r2, r0, asl #26
	strcs	r3, [r6, #844]
	orrcc	r3, r3, r1, asl #24
	strcc	r3, [r5, #24]
	ldr	ip, [r5, #24]
	add	r3, r7, #24
	ldr	r2, .L337+4
	movw	r1, #718
	mov	r0, #5
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, .L337+8
	ldrb	ip, [r4, #3]	@ zero_extendqisi2
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L321
	cmp	ip, #0
	bne	.L321
	ldr	r1, [r8, #16]
	movw	r2, #1620
	ldr	r3, [r8, #20]
	mul	r3, r3, r1
	cmp	r3, r2
	bhi	.L328
.L321:
	ldrb	r2, [r4]	@ zero_extendqisi2
	add	r3, r5, #7
	ldr	r9, .L337+12
	ldr	r0, [r6, #848]
	ldr	r1, [r6, #852]
	add	r2, r9, r2, lsl #2
	rsb	r3, r0, r3
	ldr	r10, .L337
	cmp	r3, r1
	ldr	r3, [r2, #24]
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldr	r0, [r4, #40]
	movcs	r3, #1
	ldr	r1, [r4, #44]
	str	r2, [fp, #-48]
	ldr	lr, [r4, #56]
	ldr	r2, [r4, #52]
	strcs	r3, [r10, #844]
	bcc	.L336
.L323:
	ldr	ip, [r5, #28]
	add	r3, r7, #28
	ldr	r2, .L337+16
	movw	r1, #734
	mov	r0, #5
	str	ip, [sp]
	bl	dprint_normal
	mov	r3, r7
	mov	r2, r5
	mov	r1, r4
	mov	r0, r8
	bl	H264HAL_SetSliceMsgMvAddrInfo
	ldr	r1, [r6, #848]
	ldr	r2, [r6, #852]
	add	r3, r5, #10
	rsb	r3, r1, r3
	ldr	r1, [r4, #60]
	cmp	r3, r2
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	ldr	r3, [r4, #64]
	andcc	r1, r1, #31
	ldr	r0, .L337
	movcs	r3, #1
	movcc	r2, r2, asl #16
	andcc	r3, r3, #31
	orrcc	r2, r2, r1, asl #5
	movw	r1, #746
	strcs	r3, [r0, #844]
	orrcc	r3, r2, r3
	strcc	r3, [r5, #40]
	mov	r0, #5
	ldr	ip, [r5, #40]
	add	r3, r7, #40
	ldr	r2, .L337+20
	str	ip, [sp]
	bl	dprint_normal
	ldr	r2, [r6, #848]
	ldr	r1, [r6, #852]
	add	r3, r5, #11
	rsb	r3, r2, r3
	ldr	r2, [r4, #68]
	cmp	r3, r1
	ldr	r0, [r4, #72]
	ldr	r3, .L337
	andcc	r3, r2, #15
	andcc	r2, r0, #15
	ldr	r1, [r4, #76]
	movcs	r2, #1
	mov	r0, #5
	movcc	r3, r3, asl #16
	strcs	r2, [r3, #844]
	orrcc	r2, r3, r2, asl #8
	add	r3, r7, #44
	orrcc	r2, r2, r1
	strcc	r2, [r5, #44]
	ldr	ip, [r5, #44]
	movw	r1, #755
	ldr	r2, .L337+24
	str	ip, [sp]
	bl	dprint_normal
	ldr	r3, [fp, #16]
	mov	r2, r5
	mov	r1, r4
	mov	r0, r8
	bl	H264HAL_SetSliceMsgEndMbInSlice
	cmn	r0, #1
	beq	.L328
	ldr	r1, [r6, #848]
	add	r3, r5, #63
	ldr	r2, [r6, #852]
	rsb	r3, r1, r3
	ldr	r1, .L337
	cmp	r3, r2
	ldrcc	r3, [fp, #8]
	movcs	r3, #1
	strcs	r3, [r1, #844]
	strcc	r3, [r5, #252]
	ldrb	r3, [r4]	@ zero_extendqisi2
	add	r9, r9, r3, lsl #2
	ldr	r0, [r9, #24]
	cmp	r0, #0
	beq	.L317
	mov	r3, r7
	mov	r2, r5
	mov	r1, r4
	mov	r0, r8
	bl	H264HAL_SetSliceMsgRefPicInfo
	mov	r3, r7
	mov	r2, r5
	mov	r1, r4
	mov	r0, r8
	bl	H264HAL_SetSliceMsgAPCInfo
	mov	r0, r8
	mov	r3, r7
	mov	r2, r5
	mov	r1, r4
	bl	H264HAL_SetSliceMsgWPInfo
	mov	r0, #0
.L317:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L336:
	mov	r2, r2, asl #2
	and	r0, r0, #31
	orr	r2, r2, lr, asl #8
	and	r1, r1, #31
	orr	r3, r2, r3
	orr	r3, r3, r0, asl #21
	orr	r1, r3, r1, asl #16
	ldr	r3, [fp, #-48]
	orr	r1, r1, r3, asl #15
	orr	ip, r1, ip, asl #14
	str	ip, [r5, #28]
	b	.L323
.L328:
	mvn	r0, #0
	b	.L317
.L335:
	ldr	ip, .L337+28
	mov	r1, #704
	ldr	r3, .L337+32
	ldr	r2, .L337+36
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L317
.L338:
	.align	2
.L337:
	.word	g_HwMem
	.word	.LC43
	.word	g_NotDirect_8x8_InferenceFlag
	.word	.LANCHOR0
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC3
	.word	.LANCHOR0+176
	.word	.LC2
	UNWIND(.fnend)
	.size	H264HAL_SetSliceMsg, .-H264HAL_SetSliceMsg
	.align	2
	.global	H264HAL_StartDec
	.type	H264HAL_StartDec, %function
H264HAL_StartDec:
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
	UNWIND(.pad #68)
	sub	sp, sp, #68
	ldr	r9, .L374
	mov	r2, #1000
	ldr	r3, [r0, #800]
	mov	r8, r0
	str	r1, [fp, #-88]
	mla	r2, r2, r1, r9
	cmp	r3, #0
	str	r2, [fp, #-84]
	beq	.L368
	ldr	r2, [fp, #-84]
	ldr	r3, [r2, #36]
	mov	r1, r2
	ldr	r2, [r2, #32]
	bl	H264HAL_SetPicMsg
	ldr	r10, [r8, #800]
	cmp	r10, #0
	beq	.L369
	ldr	r3, [r8, #936]
	cmp	r3, #1
	beq	.L370
	ldr	r5, [r10, #48]
	cmp	r5, #0
	streq	r5, [fp, #-92]
	bne	.L371
.L345:
	ldr	r1, [fp, #-88]
	mov	r3, #250
	mov	r2, #0
	str	r2, [fp, #-64]
	mov	r4, r2
	ldr	r2, [fp, #-92]
	mul	r3, r3, r1
	ldr	r1, [r8, #796]
	add	r0, r2, #5
	str	r0, [fp, #-60]
	str	r3, [fp, #-56]
	add	r3, r3, r2
	str	r3, [fp, #-80]
.L347:
	ldr	r3, [fp, #-60]
	cmp	r4, r1
	ldr	r2, [fp, #-56]
	add	r7, r3, r4
	ldr	r3, [fp, #-80]
	add	r2, r2, r7
	add	r3, r3, r4
	add	r2, r2, #4
	add	r3, r3, #8
	bge	.L372
	ldr	r3, [r9, r3, asl #2]
	cmp	r4, #0
	ldr	r6, [r10, #48]
	movgt	r5, #1
	movle	r5, #0
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-64]
	cmp	r6, r3
	movhi	r5, #0
	andls	r5, r5, #1
	ldr	r3, [r9, r2, asl #2]
	cmp	r5, #0
	str	r3, [fp, #-72]
	bne	.L347
	sub	r3, fp, #48
	add	r2, r4, #1
	mov	r0, r10
	bl	H264HAL_FindNextSlicePara
	str	r6, [fp, #-64]
	mov	r1, r5
	subs	r3, r0, #0
	str	r3, [fp, #-76]
	beq	.L365
	ldr	r3, [r8, #796]
	ldr	r4, [fp, #-48]
	ldr	r2, [fp, #-56]
	rsb	r3, r4, r3
	ldr	r0, [fp, #-60]
	clz	r3, r3
	add	r2, r2, r4
	add	r2, r2, r0
	ldr	r0, [fp, #-68]
	mov	r3, r3, lsr #5
	add	r2, r2, #4
	cmp	r7, #204
	movle	r7, r3
	orrgt	r7, r3, #1
	cmp	r7, #0
	ldrne	r2, [r8, #12]
	ldrne	r3, [r8, #20]
	ldreq	r1, .L374
	ldreq	r3, [fp, #-76]
	mulne	r3, r3, r2
	ldreq	r1, [r1, r2, asl #2]
	ldreq	r3, [r3, #48]
	mov	r2, r10
	strne	r5, [r10, #4056]
	sub	r3, r3, #1
	ldrne	r4, [r8, #796]
	str	r3, [sp, #12]
	str	r1, [sp, #4]
	str	r0, [sp]
	mov	r0, r8
	ldr	r3, [fp, #-72]
	str	r6, [sp, #8]
	ldr	r1, [fp, #-84]
	bl	H264HAL_SetSliceMsg
	ldr	r10, [fp, #-76]
	cmp	r0, #0
	bne	.L351
	ldr	r1, [r8, #796]
	b	.L347
.L371:
	ldr	r3, [r10, #8]
	mov	ip, #0
	ldr	lr, [fp, #-84]
	mov	r6, #1
	str	ip, [r10, #48]
	sub	r0, r5, #1
	str	r3, [fp, #-56]
	mov	r2, r10
	ldr	r3, [r10, #12]
	mov	r1, lr
	str	ip, [r10, #12]
	str	r6, [r10, #8]
	str	r3, [fp, #-60]
	ldr	r3, [r10, #16]
	str	ip, [r10, #16]
	ldr	r7, [r10, #24]
	str	r3, [fp, #-64]
	ldr	r3, [r10, #20]
	str	ip, [r10, #20]
	ldr	r4, [r10, #28]
	str	r3, [fp, #-68]
	ldr	r3, [r8, #592]
	str	ip, [r10, #28]
	str	r3, [r10, #24]
	ldr	r3, [lr, #36]
	ldr	lr, [lr, #40]
	str	ip, [sp, #8]
	ldr	ip, [r1, #32]
	str	r0, [sp, #12]
	mov	r0, r8
	str	lr, [sp, #4]
	str	ip, [sp]
	bl	H264HAL_SetSliceMsg
	cmp	r0, #0
	bne	.L373
	ldr	r3, [fp, #-56]
	str	r5, [r10, #48]
	str	r7, [r10, #24]
	str	r3, [r10, #8]
	ldr	r3, [fp, #-60]
	str	r4, [r10, #28]
	str	r6, [fp, #-92]
	str	r3, [r10, #12]
	ldr	r3, [fp, #-64]
	str	r3, [r10, #16]
	ldr	r3, [fp, #-68]
	str	r3, [r10, #20]
	ldr	r10, [r8, #800]
	b	.L345
.L372:
	cmp	r1, #0
	ble	.L353
	ldr	r0, [fp, #-92]
	mov	r3, #250
	ldr	r2, [fp, #-88]
	mla	r3, r3, r2, r0
	add	r1, r3, r1
	add	r1, r1, #8
	ldr	r0, [r9, r1, asl #2]
	bl	H264HAL_CutSliceChain
	mov	r0, #0
.L359:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L351:
	movw	r3, #917
.L364:
	ldr	r2, .L374+4
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
.L365:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L370:
	ldr	r2, [r8, #796]
	cmp	r2, #1
	ble	.L343
.L344:
	add	r3, r3, #1
	ldr	r10, [r10, #4056]
	cmp	r3, r2
	bne	.L344
.L343:
	ldr	r2, [fp, #-88]
	mov	lr, #1000
	ldr	r3, [r8, #20]
	mov	r4, #0
	ldr	ip, [r8, #12]
	mov	r0, r8
	mla	lr, lr, r2, r9
	ldr	r1, [fp, #-84]
	mul	ip, r3, ip
	mov	r2, r10
	ldr	r3, [lr, #36]
	sub	ip, ip, #1
	str	ip, [sp, #12]
	ldr	ip, [r10, #48]
	str	r4, [sp, #4]
	str	r4, [sp]
	str	ip, [sp, #8]
	bl	H264HAL_SetSliceMsg
	cmp	r0, #0
	movwne	r3, #830
	bne	.L364
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L368:
	ldr	ip, .L374+8
	mov	r0, r3
	movw	r1, #515
	ldr	r3, .L374+12
	ldr	r2, .L374+16
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L359
.L373:
	movw	r3, #863
	mov	r0, r6
	mov	r1, r3
	ldr	r2, .L374+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L359
.L353:
	ldr	r2, .L374+20
	movw	r1, #929
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L359
.L369:
	mov	r0, r10
	ldr	r2, .L374+24
	movw	r1, #809
	bl	dprint_normal
	mvn	r0, #0
	b	.L359
.L375:
	.align	2
.L374:
	.word	g_HwMem
	.word	.LC48
	.word	.LC28
	.word	.LANCHOR0+100
	.word	.LC2
	.word	.LC49
	.word	.LC47
	UNWIND(.fnend)
	.size	H264HAL_StartDec, .-H264HAL_StartDec
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.10241, %object
	.size	__func__.10241, 22
__func__.10241:
	.ascii	"H264HAL_CutSliceChain\000"
	.space	2
	.type	g_SliceTypeForPMV, %object
	.size	g_SliceTypeForPMV, 12
g_SliceTypeForPMV:
	.word	1
	.word	2
	.word	0
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
	.type	__func__.10374, %object
	.size	__func__.10374, 23
__func__.10374:
	.ascii	"H264HAL_CheckParaValid\000"
	.space	1
	.type	__func__.10397, %object
	.size	__func__.10397, 18
__func__.10397:
	.ascii	"H264HAL_SetPicMsg\000"
	.space	2
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
	.type	__func__.10431, %object
	.size	__func__.10431, 20
__func__.10431:
	.ascii	"H264HAL_SetSliceMsg\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"line: %d, p = NULL is not expected value!\012\000" )
	.space	1
.LC1:
	ASCII(.ascii	"H264HAL_InitHal return error.\012\000" )
	.space	1
.LC2:
	ASCII(.ascii	"%s: %s\012\000" )
.LC3:
	ASCII(.ascii	"can not map slice msg virtual address!\012\000" )
.LC4:
	ASCII(.ascii	"qmatrix[%d] = 0x%x\012\000" )
.LC5:
	ASCII(.ascii	"picmsg Dxx addr 0x%x = 0x%x\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"slicemsg D[%d] tmp =0x%x,bitsoffset =0x%x,bytespos " )
	ASCII(.ascii	"= 0x%x\012\000" )
	.space	1
.LC7:
	ASCII(.ascii	"slicemsg D[%d] addr 0x%x = 0x%x\012\000" )
	.space	3
.LC8:
	ASCII(.ascii	"slicemsg g_pListX[1][0]->frame_store->pmv_address_i" )
	ASCII(.ascii	"dc = %d\012\000" )
.LC9:
	ASCII(.ascii	"slicemsg D[6] addr 0x%x = 0x%x\012\000" )
.LC10:
	ASCII(.ascii	"slicemsg D[7] addr 0x%x = 0x%x\012\000" )
.LC11:
	ASCII(.ascii	"slicemsg D[%d] address 0x%x = 0x%x\012\000" )
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
	ASCII(.ascii	"point of fst slice para null\012\000" )
	.space	2
.LC29:
	ASCII(.ascii	"line %d pSlicePara is NULL!\012\000" )
	.space	3
.LC30:
	ASCII(.ascii	"can not map down msg virtual address!\012\000" )
	.space	1
.LC31:
	ASCII(.ascii	"picmsg D[0] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC32:
	ASCII(.ascii	"picmsg D[1] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC33:
	ASCII(.ascii	"picmsg D[2] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC34:
	ASCII(.ascii	"picmsg D[3] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC35:
	ASCII(.ascii	"picmsg D[4] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC36:
	ASCII(.ascii	"picmsg D[5] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC37:
	ASCII(.ascii	"picmsg D[6] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC38:
	ASCII(.ascii	"picmsg D[7] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC39:
	ASCII(.ascii	"picmsg D[8] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC40:
	ASCII(.ascii	"picmsg D[9] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC41:
	ASCII(.ascii	"picmsg D[%d] addr 0x%x = 0x%x\012\000" )
	.space	1
.LC42:
	ASCII(.ascii	"picmsg D[26] addr 0x%x = 0x%x\012\000" )
	.space	1
.LC43:
	ASCII(.ascii	"slicemsg D[4] addr 0x%x = 0x%x\012\000" )
.LC44:
	ASCII(.ascii	"slicemsg D[5] addr 0x%x = 0x%x\012\000" )
.LC45:
	ASCII(.ascii	"slicemsg D[8] addr 0x%x = 0x%x\012\000" )
.LC46:
	ASCII(.ascii	"slicemsg D[9] addr 0x%x = 0x%x\012\000" )
.LC47:
	ASCII(.ascii	"pSlicePara = NULL!\012\000" )
.LC48:
	ASCII(.ascii	"line %d Set slice msg not wrong!\012\000" )
	.space	2
.LC49:
	ASCII(.ascii	"!!! no slice to dec, add up msg report.\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
