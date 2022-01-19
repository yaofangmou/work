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
	.file	"vdm_hal_mpeg2.c"
	.text
	.align	2
	.global	MP2HAL_WriteSliceMsg
	.type	MP2HAL_WriteSliceMsg, %function
MP2HAL_WriteSliceMsg:
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
	add	r3, r0, #45056
	mov	r8, #0
	str	r1, [fp, #-64]
	ldr	r3, [r3, #240]
	str	r2, [fp, #-68]
	cmp	r3, r8
	ldr	r10, [r0, #196]
	str	r3, [fp, #-56]
	str	r8, [fp, #-48]
	ble	.L20
	ldr	r5, .L22
	add	r4, r0, #256
	mov	r7, r1
	mov	r6, r1
	sub	r3, r3, #1
	str	r3, [fp, #-60]
	mov	r9, r5
.L16:
	ldr	r3, [r4, #-16]
	mov	r0, #0
	ldr	r2, [r5, #848]
	add	r4, r4, #44
	ldr	ip, [r5, #852]
	and	r1, r3, #15
	ldr	r3, [r4, #-44]
	rsb	r2, r2, r6
	cmp	r2, ip
	ldr	r2, .L22+4
	add	r3, r3, r1, lsl #3
	ldr	r1, [r4, #-52]
	bfi	r0, r3, #0, #7
	mov	r3, #0
	bfi	r3, r1, #0, #24
	str	r3, [fp, #-48]
	strb	r0, [fp, #-45]
	movcs	r3, #1
	ldrcc	r3, [fp, #-48]
	mov	r1, #32
	strcs	r3, [r9, #844]
	mov	r0, #5
	ldrcs	r3, [fp, #-48]
	strcc	r3, [r7]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	ldr	r2, [r4, #-60]
	add	r1, r6, #1
	ldr	r0, [r5, #852]
	rsb	r1, r3, r1
	bic	r2, r2, #15
	mov	r3, #0
	cmp	r1, r0
	rsb	r2, r10, r2
	bfi	r3, r2, #0, #24
	mov	r1, #39
	str	r3, [fp, #-48]
	movcs	r2, #1
	strcc	r3, [r7, #4]
	mov	r0, #5
	strcs	r2, [r9, #844]
	ldr	r2, .L22+8
	bl	dprint_normal
	ldr	r2, [r4, #-56]
	ldr	r0, [r5, #848]
	add	r3, r6, #2
	ldr	ip, [r5, #852]
	and	r1, r2, #15
	rsb	r3, r0, r3
	ldr	r2, [r4, #-40]
	cmp	r3, ip
	ldr	r0, [r4, #-48]
	add	r2, r2, r1, lsl #3
	mov	r3, #0
	mov	r1, #0
	bfi	r3, r2, #0, #7
	bfi	r1, r0, #0, #24
	str	r1, [fp, #-48]
	strb	r3, [fp, #-45]
	mov	r1, #47
	ldrcc	r3, [fp, #-48]
	movcs	r3, #1
	ldr	r2, .L22+12
	mov	r0, #5
	strcs	r3, [r9, #844]
	strcc	r3, [r7, #8]
	ldrcs	r3, [fp, #-48]
	bl	dprint_normal
	ldr	r3, [r4, #-56]
	mov	r2, #0
	ldr	r1, [r5, #848]
	cmp	r3, r2
	mov	r0, #5
	bicne	r3, r3, #15
	streq	r3, [fp, #-48]
	rsbne	r3, r10, r3
	bfine	r2, r3, #0, #24
	add	r3, r6, #3
	strne	r2, [fp, #-48]
	rsb	r3, r1, r3
	ldr	r2, [r5, #852]
	mov	r1, #63
	cmp	r3, r2
	ldr	r2, .L22+16
	ldrcc	r3, [fp, #-48]
	movcs	r3, #1
	strcs	r3, [r9, #844]
	ldrcs	r3, [fp, #-48]
	strcc	r3, [r7, #12]
	bl	dprint_normal
	ldr	r3, [fp, #-60]
	ldr	r0, [r5, #848]
	cmp	r8, r3
	ldr	r1, [r5, #852]
	add	r8, r8, #1
	ldrne	r3, [fp, #-68]
	moveq	r3, #0
	ldrne	r2, [fp, #-64]
	rsbne	r3, r2, r3
	add	r2, r6, #7
	rsb	r2, r0, r2
	addne	r3, r3, r7
	cmp	r2, r1
	mov	r0, #5
	strcc	r3, [r7, #28]
	mov	r1, #78
	movcs	r2, #1
	strcs	r2, [r9, #844]
	ldr	r2, .L22+20
	add	r6, r6, #8
	str	r3, [fp, #-48]
	bl	dprint_normal
	ldr	r3, [fp, #-56]
	add	r7, r7, #32
	cmp	r3, r8
	bne	.L16
.L20:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L23:
	.align	2
.L22:
	.word	g_HwMem
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	UNWIND(.fnend)
	.size	MP2HAL_WriteSliceMsg, .-MP2HAL_WriteSliceMsg
	.align	2
	.global	MP2HAL_CfgDnMsg
	.type	MP2HAL_CfgDnMsg, %function
MP2HAL_CfgDnMsg:
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
	subs	r5, r0, #0
	str	r1, [fp, #-60]
	mov	r3, #0
	ldreq	ip, .L61
	moveq	r1, #92
	str	r3, [fp, #-48]
	beq	.L58
	ldr	r3, [fp, #-60]
	ldr	r0, [r3, #32]
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	str	r3, [fp, #-56]
	beq	.L59
	ldr	r4, .L61+4
	ldrh	r2, [r5, #146]
	ldrh	r3, [fp, #-46]
	sub	r2, r2, #1
	ldr	r0, [r4, #848]
	bfi	r3, r2, #0, #9
	ldr	r2, [fp, #-56]
	ldr	ip, [r4, #852]
	rsb	r2, r0, r2
	ldr	r1, [r5, #176]
	cmp	r2, ip
	strh	r3, [fp, #-46]	@ movhi
	ldrh	r2, [r5, #150]
	mov	r3, r3, lsr #8
	bfi	r3, r1, #1, #1
	strb	r3, [fp, #-45]
	ldrh	r3, [fp, #-48]
	sub	r2, r2, #1
	bfi	r3, r2, #0, #9
	ldrcc	r2, [fp, #-56]
	strh	r3, [fp, #-48]	@ movhi
	movcs	r3, #1
	ldrcc	r3, [fp, #-48]
	strcs	r3, [r4, #844]
	strcc	r3, [r2]
	ldr	r2, [fp, #-56]
	ldrcc	r0, [r4, #848]
	ldrb	r3, [r5]	@ zero_extendqisi2
	add	r2, r2, #1
	ldrcc	ip, [r4, #852]
	rsb	r2, r0, r2
	ldrb	lr, [r5, #2]	@ zero_extendqisi2
	and	r3, r3, #7
	ldrb	r1, [r5, #3]	@ zero_extendqisi2
	cmp	r2, ip
	ldrb	r6, [r5, #1]	@ zero_extendqisi2
	bfi	r3, lr, #3, #1
	ldrb	r7, [r5, #4]	@ zero_extendqisi2
	and	r2, r1, #3
	ldrb	lr, [r5, #5]	@ zero_extendqisi2
	bfi	r3, r6, #4, #1
	ldrb	r1, [r5, #7]	@ zero_extendqisi2
	bfi	r2, r7, #2, #1
	strb	r3, [fp, #-45]
	mov	r3, #0
	strb	r2, [fp, #-47]
	bfi	r3, r1, #0, #1
	mov	r2, #0
	strb	r3, [fp, #-46]
	bfi	r2, lr, #0, #1
	strb	r2, [fp, #-48]
	ldrcc	r2, [fp, #-56]
	movcs	r3, #1
	ldrcc	r3, [fp, #-48]
	strcs	r3, [r4, #844]
	strcc	r3, [r2, #4]
	ldr	r3, [fp, #-56]
	ldrcc	r0, [r4, #848]
	ldrcc	ip, [r4, #852]
	add	r3, r3, #2
	ldrb	r2, [r5, #12]	@ zero_extendqisi2
	rsb	r3, r0, r3
	cmp	r3, ip
	ldrb	r7, [r5, #6]	@ zero_extendqisi2
	ldrb	r6, [r5, #15]	@ zero_extendqisi2
	and	r3, r2, #15
	ldrb	lr, [r5, #14]	@ zero_extendqisi2
	bfi	r3, r7, #7, #1
	ldrb	r1, [r5, #13]	@ zero_extendqisi2
	mov	r2, #0
	strb	r3, [fp, #-45]
	bfi	r2, lr, #0, #4
	mov	r3, #0
	strb	r2, [fp, #-47]
	bfi	r3, r6, #0, #4
	ldrcc	r2, [fp, #-56]
	strb	r3, [fp, #-48]
	mov	r3, #0
	bfi	r3, r1, #0, #4
	strb	r3, [fp, #-46]
	ldrcc	r3, [fp, #-48]
	movcs	r3, #1
	strcs	r3, [r4, #844]
	mov	r7, r5
	mov	r6, #16
	strcc	r3, [r2, #8]
	ldr	r3, [fp, #-56]
	ldrcc	r0, [r4, #848]
	ldrcc	ip, [r4, #852]
	add	r3, r3, #3
	ldrb	r2, [r5, #10]	@ zero_extendqisi2
	rsb	r3, r0, r3
	ldrb	lr, [r5, #11]	@ zero_extendqisi2
	cmp	r3, ip
	ldrb	r1, [r5, #9]	@ zero_extendqisi2
	mov	r3, #0
	bfi	r3, lr, #0, #2
	strb	r3, [fp, #-48]
	mov	r3, #0
	bfi	r3, r2, #0, #1
	ldrb	r2, [r5, #8]	@ zero_extendqisi2
	strb	r3, [fp, #-47]
	mov	r3, #0
	bfi	r3, r1, #0, #1
	strb	r3, [fp, #-46]
	mov	r3, #0
	bfi	r3, r2, #0, #1
	ldrcc	r2, [fp, #-56]
	strb	r3, [fp, #-45]
	movcs	r3, #1
	ldrcc	r3, [fp, #-48]
	strcs	r3, [r4, #844]
	strcc	r3, [r2, #12]
	ldrcc	r0, [r4, #848]
	ldrcc	ip, [r4, #852]
	ldr	r3, [fp, #-56]
	ldr	r2, [r5, #180]
	add	r3, r3, #4
	str	r5, [fp, #-64]
	rsb	r3, r0, r3
	cmp	r3, ip
	ldrcc	r3, [fp, #-56]
	movcs	r3, #1
	strcs	r3, [r4, #844]
	strcc	r2, [r3, #16]
	ldr	r3, [fp, #-56]
	ldrcc	r0, [r4, #848]
	ldrcc	ip, [r4, #852]
	add	r3, r3, #5
	rsb	r3, r0, r3
	ldr	r2, [r5, #184]
	cmp	r3, ip
	ldrcc	r3, [fp, #-56]
	movcs	r3, #1
	strcs	r3, [r4, #844]
	strcc	r2, [r3, #20]
	ldr	r3, [fp, #-56]
	ldrcc	r0, [r4, #848]
	ldrcc	ip, [r4, #852]
	add	r3, r3, #6
	rsb	r3, r0, r3
	ldr	r2, [r5, #208]
	cmp	r3, ip
	ldrcc	r3, [fp, #-56]
	movcs	r3, #1
	strcs	r3, [r4, #844]
	strcc	r2, [r3, #24]
	ldr	r3, [fp, #-56]
	ldrcc	r0, [r4, #848]
	ldrcc	ip, [r4, #852]
	add	r3, r3, #7
	rsb	r3, r0, r3
	ldr	r2, [r5, #228]
	cmp	r3, ip
	ldrcc	r3, [fp, #-56]
	movcs	r3, #1
	strcs	r3, [r4, #844]
	str	r2, [fp, #-48]
	strcc	r2, [r3, #28]
	ldr	r3, [fp, #-56]
	ldrcc	r0, [r4, #848]
	ldrcc	ip, [r4, #852]
	add	r10, r3, #128
.L55:
	ldr	r3, [fp, #-56]
	add	r9, r7, #16
	mov	lr, r10
	add	r1, r3, r6
	mov	r3, r7
.L48:
	ldrb	r2, [r3, #80]	@ zero_extendqisi2
	rsb	r5, r0, r1
	cmp	r5, ip
	ldrb	r8, [r3, #96]	@ zero_extendqisi2
	ldrb	r5, [r3, #112]	@ zero_extendqisi2
	add	r3, r3, #8
	strb	r2, [fp, #-48]
	add	lr, lr, #4
	ldrb	r2, [r3, #120]	@ zero_extendqisi2
	strb	r8, [fp, #-47]
	strb	r5, [fp, #-46]
	strb	r2, [fp, #-45]
	movcs	r2, #1
	ldrcc	r2, [fp, #-48]
	strcs	r2, [r4, #844]
	strcc	r2, [lr, #-68]
	add	r2, r1, #16
	ldrb	r5, [r3, #8]	@ zero_extendqisi2
	add	r1, r1, #1
	ldrcc	r0, [r4, #848]
	ldrcc	ip, [r4, #852]
	rsb	r2, r0, r2
	ldrb	r8, [r3, #24]	@ zero_extendqisi2
	cmp	r2, ip
	strb	r5, [fp, #-48]
	ldrb	r2, [r3, #40]	@ zero_extendqisi2
	ldrb	r5, [r3, #56]	@ zero_extendqisi2
	strb	r8, [fp, #-47]
	strb	r2, [fp, #-46]
	movcs	r2, #1
	strb	r5, [fp, #-45]
	ldrcc	r2, [fp, #-48]
	strcs	r2, [r4, #844]
	strcc	r2, [lr, #-4]
	ldrcc	r0, [r4, #848]
	ldrcc	ip, [r4, #852]
	cmp	r3, r9
	bne	.L48
	add	r6, r6, #2
	add	r7, r7, #1
	cmp	r6, #32
	add	r10, r10, #8
	bne	.L55
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-60]
	add	r3, r3, #48
	ldr	r5, [fp, #-64]
	rsb	r0, r0, r3
	cmp	r0, ip
	ldr	r2, [r2, #888]
	ldrcc	r3, [fp, #-56]
	movcs	r3, #1
	strcs	r3, [r4, #844]
	str	r2, [fp, #-48]
	strcc	r2, [r3, #192]
	ldr	r3, [fp, #-60]
	ldr	r6, [r3, #32]
	bic	r6, r6, #15
	add	r6, r6, #256
	mov	r0, r6
	bl	MEM_Phy2Vir
	subs	r1, r0, #0
	beq	.L60
	ldr	r3, [fp, #-56]
	ldr	r0, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r3, #63
	rsb	r3, r0, r3
	mov	r0, r5
	cmp	r3, r2
	ldr	r3, .L61+4
	str	r6, [fp, #-48]
	ldrcc	r3, [fp, #-56]
	movcs	r2, #1
	strcs	r2, [r3, #844]
	mov	r2, r6
	strcc	r6, [r3, #252]
	bl	MP2HAL_WriteSliceMsg
	mov	r0, #0
.L57:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L59:
	ldr	ip, .L61+8
	mov	r1, #95
.L58:
	ldr	r3, .L61+12
	ldr	r2, .L61+16
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L57
.L60:
	ldr	r2, .L61+20
	mov	r1, #173
	bl	dprint_normal
	mvn	r0, #0
	b	.L57
.L62:
	.align	2
.L61:
	.word	.LC6
	.word	g_HwMem
	.word	.LC7
	.word	.LANCHOR0
	.word	.LC5
	.word	.LC8
	UNWIND(.fnend)
	.size	MP2HAL_CfgDnMsg, .-MP2HAL_CfgDnMsg
	.align	2
	.global	MP2HAL_StartDec
	.type	MP2HAL_StartDec, %function
MP2HAL_StartDec:
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
	ldr	r3, .L64
	mov	r2, r1
	mov	r1, #1000
	mla	r1, r1, r2, r3
	bl	MP2HAL_CfgDnMsg
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L65:
	.align	2
.L64:
	.word	g_HwMem
	UNWIND(.fnend)
	.size	MP2HAL_StartDec, .-MP2HAL_StartDec
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.12963, %object
	.size	__func__.12963, 16
__func__.12963:
	.ascii	"MP2HAL_CfgDnMsg\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"D0 = %#x \012\000" )
	.space	1
.LC1:
	ASCII(.ascii	"D1 = %#x \012\000" )
	.space	1
.LC2:
	ASCII(.ascii	"D2 = %#x \012\000" )
	.space	1
.LC3:
	ASCII(.ascii	"D3 = %#x \012\000" )
	.space	1
.LC4:
	ASCII(.ascii	"D7 = %#x \012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"%s: %s\012\000" )
.LC6:
	ASCII(.ascii	"pDecParam is null!\012\000" )
.LC7:
	ASCII(.ascii	"can not map down msg virtual address!\000" )
	.space	2
.LC8:
	ASCII(.ascii	"Map SlcDnMsgPhyAddr to SlcDnMsgVirAddr is NULL \012" )
	ASCII(.ascii	"\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
