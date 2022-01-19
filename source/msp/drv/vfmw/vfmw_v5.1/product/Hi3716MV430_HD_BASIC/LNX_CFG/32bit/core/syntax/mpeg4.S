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
	.file	"mpeg4.c"
	.text
	.align	2
	.global	log2bin
	.type	log2bin, %function
log2bin:
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
	ldmeqfd	sp, {fp, sp, pc}
	mov	r3, #0
.L3:
	add	r3, r3, #1
	movs	r0, r0, lsr #1
	uxth	r3, r3
	bne	.L3
	sxth	r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	log2bin, .-log2bin
	.align	2
	.global	bs_get_spritetrajectory
	.type	bs_get_spritetrajectory, %function
bs_get_spritetrajectory:
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
	ldr	r6, .L13
	mov	r7, r0
	mov	r4, #0
	mov	r5, r6
.L10:
	ldrb	r1, [r5, #4]	@ zero_extendqisi2
	mov	r0, r7
	bl	BsShow
	ldr	r3, [r6, r4, asl #3]
	ldr	r2, .L13
	mov	r1, r4, asl #3
	add	r5, r5, #8
	cmp	r0, r3
	beq	.L12
	add	r4, r4, #1
	cmp	r4, #12
	bne	.L10
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L12:
	add	r2, r2, r1
	mov	r0, r7
	ldrb	r1, [r2, #4]	@ zero_extendqisi2
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	bs_get_spritetrajectory, .-bs_get_spritetrajectory
	.global	__aeabi_idiv
	.align	2
	.global	MP4_GetGMCparam
	.type	MP4_GetGMCparam, %function
MP4_GetGMCparam:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 64
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
	ldrb	r5, [r0, #129]	@ zero_extendqisi2
	mov	r2, #2
	mov	r9, r1
	mov	r3, r2, asl r5
	str	r0, [fp, #-52]
	mov	r0, #16
	rsb	r2, r5, #3
	mov	r1, r3
	str	r3, [fp, #-56]
	str	r2, [fp, #-100]
	bl	__aeabi_idiv
	ldr	r3, [fp, #-52]
	ldr	r8, [r3, #20]
	ldr	r10, [r3, #16]
	cmp	r8, #1
	mov	r2, r8, asl #4
	str	r2, [r9, #8]
	str	r2, [fp, #-64]
	ldr	r2, [r3, #16]
	mov	r2, r2, asl #4
	str	r2, [r9, #12]
	ldrb	r2, [r3, #129]	@ zero_extendqisi2
	str	r2, [r9, #4]
	ldrb	r2, [r3, #128]	@ zero_extendqisi2
	str	r2, [r9]
	str	r2, [fp, #-68]
	ldr	r2, [r3, #752]
	ldr	r1, [r3, #744]
	ldr	lr, [r3, #756]
	str	r2, [fp, #-52]
	ldr	r2, [r3, #764]
	ldr	ip, [r3, #760]
	str	r2, [fp, #-72]
	str	r0, [fp, #-48]
	ldr	r0, [r3, #748]
	ble	.L40
	mov	r5, #0
	mov	r2, #1
.L17:
	add	r5, r5, #1
	mov	r6, r2, asl r5
	cmp	r8, r6
	bgt	.L17
	mov	r2, r6, asl #4
	str	r2, [fp, #-96]
.L16:
	cmp	r10, #1
	ble	.L41
	mov	r4, #0
	mov	r2, #1
.L19:
	add	r4, r4, #1
	mov	r7, r2, asl r4
	cmp	r10, r7
	bgt	.L19
	mov	r2, r7, asl #4
	str	r2, [fp, #-104]
.L18:
	ldrb	r3, [r3, #12]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L45
	add	ip, r1, ip
	str	ip, [fp, #-76]
	ldr	ip, [fp, #-52]
	add	r2, r1, r8, lsl #1
	add	r3, r0, r10, lsl #1
	add	lr, r0, lr
	add	r2, ip, r2
	ldr	ip, [fp, #-56]
	mov	ip, ip, asr #1
	str	ip, [fp, #-52]
	ldr	ip, [fp, #-72]
	add	r3, ip, r3
	mov	ip, r3
	ldr	r3, [fp, #-52]
	mul	r1, r3, r1
	mul	r2, r2, r3
	str	r1, [fp, #-60]
	mul	r1, lr, r3
	str	r1, [fp, #-84]
	ldr	r1, [fp, #-76]
	mul	r1, r1, r3
	str	r1, [fp, #-88]
	mul	r1, ip, r3
	mul	r3, r3, r0
	str	r1, [fp, #-92]
	str	r3, [fp, #-52]
.L21:
	ldr	ip, [fp, #-48]
	ldr	r3, [fp, #-64]
	ldr	r1, [fp, #-60]
	rsb	r0, r3, #0
	mul	r3, r1, ip
	mla	r0, r2, ip, r0
	mov	r2, r8, asr #1
	str	r2, [fp, #-80]
	mov	r1, r3
	str	r3, [fp, #-72]
	rsb	r3, r6, r8
	str	r3, [fp, #-76]
	mul	r0, r6, r0
	mla	r0, r1, r3, r0
	mov	r1, r8
	cmp	r0, #0
	addgt	r0, r0, r2
	rsble	r0, r2, r0
	bl	__aeabi_idiv
	ldr	r2, [fp, #-84]
	ldr	r3, [fp, #-48]
	mov	r1, r8
	mul	lr, r2, r3
	ldr	r2, [fp, #-52]
	mul	r3, r2, r3
	mul	lr, r6, lr
	mov	r2, r3
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-76]
	mla	r3, r2, r3, lr
	ldr	r2, [fp, #-96]
	cmp	r3, #0
	add	r2, r0, r2
	str	r2, [fp, #-76]
	ldr	r2, [fp, #-80]
	addgt	r0, r3, r2
	rsble	r0, r2, r3
	bl	__aeabi_idiv
	ldr	r3, [fp, #-88]
	ldr	r2, [fp, #-48]
	mov	r1, r10, asr #1
	ldr	lr, [fp, #-92]
	mul	ip, r3, r2
	ldr	r3, [fp, #-72]
	rsb	r2, r7, r10
	mul	ip, r7, ip
	mla	ip, r2, r3, ip
	ldr	r3, [fp, #-48]
	cmp	ip, #0
	addgt	ip, ip, r1
	rsble	ip, r1, ip
	mov	r8, r0
	mov	r0, r10, asl #4
	rsb	r0, r0, #0
	mla	r0, lr, r3, r0
	mul	r3, r7, r0
	ldr	r0, [fp, #-64]
	mla	r2, r2, r0, r3
	cmp	r2, #0
	addgt	r3, r2, r1
	rsble	r3, r1, r2
	ldr	r2, [fp, #-68]
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L30
.L32:
	.word	.L42
	.word	.L33
	.word	.L34
	.word	.L35
.L42:
	mov	ip, #0
	mov	r6, ip
	mov	r3, ip
	mov	r1, ip
.L31:
	mov	r5, #0
	mov	lr, r5
.L39:
	mov	r1, r1, lsr r5
	str	r1, [r9, #32]
	ldr	r1, [fp, #-56]
	mov	r5, r3, lsr r5
	mov	r6, r6, lsr lr
	mov	r3, #0
	mov	ip, ip, lsr lr
	mov	r2, #1
	str	r5, [r9, #36]
	str	r6, [r9, #40]
	str	ip, [r9, #44]
	str	r1, [r9, #16]
	str	r1, [r9, #28]
	str	r3, [r9, #20]
	str	r3, [r9, #24]
	str	r2, [r9]
	b	.L15
.L35:
	str	r3, [fp, #-88]
	cmp	r4, r5
	ldr	r3, [fp, #-48]
	add	r2, r5, r4
	movge	r4, r5
	mov	r7, r7, lsr r4
	rsb	r3, r3, #0
	mov	r1, r3
	ldr	r3, [fp, #-60]
	str	r1, [fp, #-64]
	mul	r0, r3, r1
	ldr	r1, [fp, #-100]
	add	r2, r2, r1
	rsb	r5, r4, r2
	mov	r2, #1
	sub	r1, r5, #1
	mov	r4, r6, lsr r4
	mov	r1, r2, asl r1
	ldr	r2, [fp, #-76]
	str	r0, [fp, #-80]
	add	r2, r2, r0
	mov	r0, ip
	add	ip, r1, r3, asl r5
	str	r4, [fp, #-68]
	mul	r4, r7, r2
	mov	lr, ip
	ldr	ip, [fp, #-52]
	str	lr, [r9, #32]
	str	lr, [fp, #-72]
	add	r1, r1, ip, asl r5
	str	r1, [fp, #-76]
	str	r1, [r9, #36]
	mov	r1, r10
	bl	__aeabi_idiv
	ldr	lr, [fp, #-64]
	mov	r2, r6, asl #1
	ldr	ip, [fp, #-52]
	mov	r1, r10
	mov	r6, r6, asl #4
	mul	r2, r7, r2
	rsb	r6, r6, #0
	mul	r10, ip, lr
	ldr	lr, [fp, #-48]
	mul	r6, r7, r6
	add	ip, r5, #1
	add	r8, r8, r10
	ldr	r3, [fp, #-88]
	mul	r2, lr, r2
	ldr	lr, [fp, #-80]
	mul	r7, r7, r8
	ldr	r8, [fp, #-68]
	str	r10, [fp, #-84]
	str	r6, [fp, #-64]
	mov	r6, #1
	mov	r6, r6, asl ip
	str	r2, [fp, #-48]
	mov	ip, r6
	add	r10, r0, lr
	mov	lr, r2
	ldr	r2, [fp, #-60]
	mov	r0, r3
	mul	r10, r8, r10
	str	ip, [fp, #-60]
	add	r6, r4, r10
	mla	r6, r2, lr, r6
	ldr	lr, [fp, #-64]
	add	r6, r6, lr
	add	r6, r6, ip
	str	r6, [r9, #40]
	bl	__aeabi_idiv
	ldr	r2, [fp, #-104]
	ldr	ip, [fp, #-52]
	add	lr, r5, #2
	ldr	r1, [fp, #-72]
	ldr	r3, [fp, #-76]
	str	r10, [r9, #20]
	str	r4, [r9, #16]
	str	r7, [r9, #24]
	add	r0, r0, r2
	ldr	r2, [fp, #-84]
	add	r0, r0, r2
	mul	r0, r8, r0
	ldr	r8, [fp, #-48]
	add	r2, r7, r0
	mla	r2, ip, r8, r2
	ldr	ip, [fp, #-64]
	str	r0, [r9, #28]
	add	r2, ip, r2
	ldr	ip, [fp, #-60]
	add	ip, ip, r2
	str	ip, [r9, #44]
.L36:
	ldr	r2, [fp, #-56]
	cmp	r4, r2, asl r5
	beq	.L46
.L37:
	rsb	r5, r5, #16
	rsb	lr, lr, #16
	mov	r1, r1, asl r5
	mov	r3, r3, asl r5
	mov	r4, r4, asl r5
	mov	r10, r10, asl r5
	mov	r7, r7, asl r5
	mov	r6, r6, asl lr
	mov	r5, r0, asl r5
	mov	lr, ip, asl lr
	str	r1, [r9, #32]
	str	r3, [r9, #36]
	str	r4, [r9, #16]
	str	r10, [r9, #20]
	str	r7, [r9, #24]
	str	r5, [r9, #28]
	str	r6, [r9, #40]
	str	lr, [r9, #44]
.L15:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L34:
	ldr	r2, [fp, #-64]
	mov	r3, r6, asl #1
	ldr	ip, [fp, #-48]
	mov	r6, r6, asl #4
	rsb	r10, r8, r2
	ldr	r2, [fp, #-100]
	ldr	lr, [fp, #-60]
	rsb	r7, ip, #0
	add	r5, r5, r2
	ldr	r1, [fp, #-76]
	ldr	r2, [fp, #-52]
	mov	r0, #1
	mul	r3, ip, r3
	add	ip, r5, #1
	mla	r4, lr, r7, r1
	rsb	r1, r6, #0
	mla	r7, r2, r7, r8
	ldr	r8, [fp, #-52]
	add	r6, r10, r4
	str	r10, [r9, #20]
	add	r2, r4, r7
	str	r4, [r9, #16]
	mla	r6, lr, r3, r6
	str	r7, [r9, #24]
	mla	r3, r8, r3, r2
	mov	r2, r0, asl ip
	add	r6, r6, r1
	str	r4, [r9, #28]
	add	r6, r6, r2
	str	r6, [r9, #40]
	add	ip, r1, r3
	sub	r3, r5, #1
	add	ip, r2, ip
	ldr	r2, [fp, #-56]
	mov	r3, r0, asl r3
	str	ip, [r9, #44]
	add	r1, r3, lr, asl r5
	mov	r0, r4
	cmp	r4, r2, asl r5
	add	r3, r3, r8, asl r5
	str	r1, [r9, #32]
	add	lr, r5, #2
	str	r3, [r9, #36]
	bne	.L37
.L46:
	cmp	r10, #0
	bne	.L37
	cmp	r7, #0
	bne	.L37
	cmp	r4, r0
	bne	.L37
	b	.L39
.L33:
	ldr	r1, [fp, #-60]
	ldr	r3, [fp, #-52]
	and	r6, r1, #1
	and	ip, r3, #1
	orr	r6, r6, r1, asr #1
	orr	ip, ip, r3, asr #1
	b	.L31
.L45:
	ldr	r3, [fp, #-56]
	add	ip, r1, ip
	str	r1, [fp, #-60]
	add	lr, r0, lr
	str	ip, [fp, #-88]
	mla	r2, r8, r3, r1
	ldr	ip, [fp, #-52]
	mla	r3, r10, r3, r0
	ldr	r1, [fp, #-72]
	str	lr, [fp, #-84]
	add	r2, ip, r2
	str	r0, [fp, #-52]
	add	r3, r1, r3
	str	r3, [fp, #-92]
	b	.L21
.L30:
	add	r1, r9, #32
	mov	lr, #0
	ldr	r4, [r9, #16]
	mov	r5, lr
	ldmia	r1, {r1, r3, r6, ip}
	ldr	r10, [r9, #20]
	ldr	r7, [r9, #24]
	ldr	r0, [r9, #28]
	b	.L36
.L40:
	mov	r2, #16
	mov	r6, #1
	str	r2, [fp, #-96]
	mov	r5, #0
	b	.L16
.L41:
	mov	r2, #16
	mov	r7, #1
	str	r2, [fp, #-104]
	mov	r4, #0
	b	.L18
	UNWIND(.fnend)
	.size	MP4_GetGMCparam, .-MP4_GetGMCparam
	.align	2
	.global	Mp4_GetUserDataBuf
	.type	Mp4_GetUserDataBuf, %function
Mp4_GetUserDataBuf:
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
	ldr	r3, [r1, r2, asl #2]
	cmp	r3, #0
	beq	.L52
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L52:
	str	r2, [fp, #-20]
	str	r1, [fp, #-16]
	bl	GetUsd
	ldr	r2, [fp, #-20]
	ldr	r1, [fp, #-16]
	cmp	r0, #0
	mov	r3, r0
	str	r0, [r1, r2, asl #2]
	addne	r0, r2, #4
	strne	r0, [r3, #1040]
	ldrne	r3, [r1, r2, asl #2]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Mp4_GetUserDataBuf, .-Mp4_GetUserDataBuf
	.align	2
	.global	Mp4_ClearUsrData
	.type	Mp4_ClearUsrData, %function
Mp4_ClearUsrData:
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
	sub	r4, r1, #4
	add	r5, r1, #12
	mov	r7, r0
	mov	r6, #0
.L54:
	ldr	r1, [r4, #4]!
	mov	r0, r7
	bl	FreeUsdByDec
	cmp	r4, r5
	str	r6, [r4]
	bne	.L54
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	Mp4_ClearUsrData, .-Mp4_ClearUsrData
	.align	2
	.global	Mp4_Syntax_Init
	.type	Mp4_Syntax_Init, %function
Mp4_Syntax_Init:
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
	ldr	r5, .L61
	mov	r4, r0
	add	r0, r0, #19712
	mov	r2, #24
	mov	r1, #0
	add	r0, r0, #208
	ldr	r3, [r5, #48]
	blx	r3
	add	r0, r4, #19712
	ldr	r3, [r5, #48]
	mov	r2, #604
	mov	r1, #0
	add	r0, r0, #232
	blx	r3
	add	r0, r4, #20992
	ldr	r3, [r5, #48]
	mov	r2, #60
	mov	r1, #0
	add	r0, r0, #160
	blx	r3
	add	r0, r4, #20992
	ldr	r3, [r5, #48]
	mov	r2, #768
	mov	r1, #0
	add	r0, r0, #220
	blx	r3
	add	r0, r4, #21760
	ldr	r3, [r5, #48]
	mov	r2, #7
	mov	r1, #0
	add	r0, r0, #220
	blx	r3
	ldr	r3, .L61+4
	add	r2, r4, #19968
	add	r1, r4, #20480
	add	r2, r2, #60
	add	r0, r3, #256
	mov	ip, #1
	strb	ip, [r1, #813]
	str	ip, [r1, #2064]
.L57:
	ldr	r1, [r3, #4]!
	cmp	r3, r0
	str	r1, [r2, #4]!
	bne	.L57
	ldr	r3, .L61+8
	add	r2, r4, #20224
	add	r2, r2, #60
	add	r0, r3, #256
.L58:
	ldr	r1, [r3, #4]!
	cmp	r3, r0
	str	r1, [r2, #4]!
	bne	.L58
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L62:
	.align	2
.L61:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1-4
	.word	.LANCHOR1+252
	UNWIND(.fnend)
	.size	Mp4_Syntax_Init, .-Mp4_Syntax_Init
	.align	2
	.global	Global_Data_Init
	.type	Global_Data_Init, %function
Global_Data_Init:
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
	ldr	r5, .L64
	mov	r4, r0
	add	r0, r0, #21760
	mov	r2, #24
	mov	r1, #0
	add	r0, r0, #248
	ldr	r3, [r5, #48]
	blx	r3
	add	r0, r4, #21760
	ldr	r3, [r5, #48]
	mov	r2, #16
	mov	r1, #0
	add	r0, r0, #228
	blx	r3
	mov	r0, r4
	bl	Mp4_Syntax_Init
	add	r3, r4, #20480
	mov	r2, #0
	mov	r0, r2
	str	r2, [r3, #2044]
	str	r2, [r3, #2048]
	str	r2, [r3, #2052]
	str	r2, [r3, #2056]
	str	r2, [r3, #2016]
	str	r2, [r3, #1556]
	str	r2, [r3, #2000]
	str	r2, [r3, #2004]
	str	r2, [r3, #2008]
	str	r2, [r3, #2060]
	str	r2, [r3, #2020]
	str	r2, [r3, #2024]
	str	r2, [r3, #2028]
	str	r2, [r3, #2032]
	str	r2, [r3, #2036]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L65:
	.align	2
.L64:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	Global_Data_Init, .-Global_Data_Init
	.align	2
	.global	Bs_Get_Matrix
	.type	Bs_Get_Matrix, %function
Bs_Get_Matrix:
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
	mov	r5, #0
	mov	r8, r0
	mov	r6, r1
	mov	r4, r5
	ldr	r7, .L76
	b	.L67
.L71:
	mov	r5, r0
.L67:
	mov	r1, #8
	mov	r0, r8
	bl	BsGet
	add	ip, r4, #1
	sxth	r9, r4
	uxth	r3, ip
	add	r1, r7, r9, lsl #2
	sxth	r2, r3
	uxth	r3, r3
	ldr	r1, [r1, #512]
	mov	r4, r3
	adds	lr, r0, #0
	str	r0, [r6, r1, asl #2]
	movne	lr, #1
	cmp	r2, #63
	movgt	r2, #0
	andle	r2, lr, #1
	cmp	r2, #0
	bne	.L71
	cmp	lr, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	cmp	r9, #63
	ldmgtfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L70:
	uxth	r4, ip
	str	r5, [r6, r1, asl #2]
	add	ip, r4, #1
	sxth	r3, r4
	cmp	r3, #64
	add	r3, r7, r3, lsl #2
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r1, [r3, #512]
	b	.L70
.L77:
	.align	2
.L76:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	Bs_Get_Matrix, .-Bs_Get_Matrix
	.align	2
	.global	Mp4_Syntax_Gop
	.type	Mp4_Syntax_Gop, %function
Mp4_Syntax_Gop:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #32)
	sub	sp, sp, #32
	mov	r4, r0
	sub	r0, fp, #60
	bl	BsInit
	mov	r1, #32
	sub	r0, fp, #60
	bl	BsSkip
	mov	r1, #5
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #6
	sub	r0, fp, #60
	bl	BsGet
	sub	r0, fp, #60
	mov	r1, #1
	bl	BsGet
	subs	r6, r0, #0
	bne	.L79
	add	r4, r4, #20480
	ldr	r2, .L82
	movw	r1, #717
	mov	r0, #1
	bl	dprint_normal
	strb	r6, [r4, #1502]
	sub	r0, fp, #60
	bl	BsPos
	ldr	r3, .L82+4
	ldr	r7, [r3]
	cmp	r7, #0
	mov	r5, r0
	beq	.L80
	ldr	r0, [r4, #2424]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #22
	blx	r7
	mov	r0, r5
.L80:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L79:
	mov	r1, #6
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #1
	sub	r0, fp, #60
	add	r4, r4, #20480
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #734]
	sub	r0, fp, #60
	bl	BsGet
	mov	r3, #1
	strb	r3, [r4, #1502]
	strb	r0, [r4, #735]
	sub	r0, fp, #60
	bl	BsPos
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L83:
	.align	2
.L82:
	.word	.LC0
	.word	g_EventReportFunc
	UNWIND(.fnend)
	.size	Mp4_Syntax_Gop, .-Mp4_Syntax_Gop
	.align	2
	.global	Mp4_Syntax_UserData
	.type	Mp4_Syntax_UserData, %function
Mp4_Syntax_UserData:
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
	cmp	r2, #6
	mov	r3, #0
	mov	r4, r0
	str	r3, [fp, #-60]
	str	r3, [fp, #-56]
	str	r3, [fp, #-52]
	str	r3, [fp, #-48]
	strb	r3, [fp, #-61]
	ble	.L85
	cmp	r2, #4
	ble	.L86
	ldrb	ip, [r1, #4]!	@ zero_extendqisi2
	mov	r5, r0
	movw	r7, #1030
	mov	r0, #4
	mvn	r3, ip, asl #24
	strb	ip, [r5, #3]!
	mvn	r3, r3, lsr #24
	mov	lr, r5
	mov	r3, r3, asl #8
	b	.L87
.L92:
	ldrb	ip, [r1, #1]!	@ zero_extendqisi2
	orr	r3, r3, ip
	mov	r3, r3, asl #8
	cmp	r3, #256
	beq	.L146
	cmp	r0, r7
	strb	ip, [lr, #1]!
	beq	.L147
.L87:
	sub	r6, r0, #3
	add	r0, r0, #1
	cmp	r0, r2
	bne	.L92
.L143:
	add	r8, r4, #20480
	cmp	r6, #2
	mov	r3, #1
	mov	r10, r6
	mov	r7, r2, asl #3
	strb	r3, [r8, #1506]
	bhi	.L148
.L124:
	mov	r0, r7
.L142:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L85:
	add	r4, r0, #20480
	add	r7, r2, #1
	strb	r3, [r4, #1506]
	mov	r0, r7, asl #3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L146:
	sub	r0, r0, #2
	cmp	r2, r0
	bge	.L149
.L91:
	add	r7, r2, #1
	mov	r0, r7, asl #3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L148:
	add	r1, r4, #22272
	ldr	r2, [r8, #2036]
	add	r1, r1, #252
	ldr	r0, [r8, #2424]
	bl	Mp4_GetUserDataBuf
	ldr	r9, .L153
	cmp	r0, #0
	str	r0, [r8, #2060]
	beq	.L95
	cmn	r6, #-2147483648
	ldr	r3, [r9, #52]
	sub	r6, r6, #2
	str	r6, [r0, #1052]
	movpl	r2, #0
	ldr	r0, [r8, #2060]
	bmi	.L150
.L96:
	mov	r1, r5
	blx	r3
	ldr	r1, .L153+4
	ldr	r2, [r8, #1524]
	ldr	r3, [r8, #2060]
	ldr	r10, [r1]
	ldrd	r0, [r2, #32]
	add	r3, r3, #1056
	cmp	r10, #0
	strd	r0, [r3]
	beq	.L95
	movw	r3, #1064
	ldr	r2, [r8, #2060]
	mov	r1, #5
	ldr	r0, [r8, #2424]
	blx	r10
.L95:
	cmn	r6, #-2147483646
	movpl	r6, #0
	bmi	.L151
.L97:
	add	r6, r4, r6
	mov	r2, #0
	sub	r0, fp, #61
	sub	r3, fp, #56
	strb	r2, [r6, #3]
	sub	r2, fp, #60
	str	r0, [sp]
	mov	r0, r5
	ldr	r4, [r9, #72]
	ldr	r1, .L153+8
	blx	r4
	ldr	r2, .L153
	cmp	r0, #1
	ble	.L152
.L98:
	ldr	r3, [fp, #-56]
	cmp	r0, #3
	ldr	r2, [fp, #-60]
	str	r3, [r8, #796]
	movne	r3, #0
	ldreqsb	r3, [fp, #-61]
	str	r2, [r8, #792]
	subeq	r3, r3, #112
	clzeq	r3, r3
	moveq	r3, r3, lsr #5
	str	r3, [r8, #800]
.L99:
	ldr	r3, [r9, #72]
	sub	r2, fp, #56
	ldr	r1, .L153+12
	mov	r0, r5
	blx	r3
	ldr	r4, .L153
	cmp	r0, #1
	beq	.L101
	sub	r3, fp, #56
	sub	r6, fp, #48
	str	r3, [sp, #4]
	sub	r2, fp, #60
	ldr	r10, [r4, #72]
	sub	r3, fp, #52
	str	r6, [sp]
	mov	r0, r5
	ldr	r1, .L153+16
	blx	r10
	cmp	r0, #4
	beq	.L101
	str	r6, [sp]
	sub	r3, fp, #52
	ldr	r4, [r4, #72]
	sub	r2, fp, #60
	ldr	r1, .L153+20
	mov	r0, r5
	blx	r4
	add	r0, r0, #1
	cmp	r0, #1
	ble	.L102
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-60]
	ldr	r1, [fp, #-48]
	mov	r2, r2, asl #8
	add	r3, r2, r3, lsl #16
	add	r3, r3, r1
	str	r3, [fp, #-56]
.L102:
	cmp	r0, #4
	beq	.L101
	ldr	r3, [r9, #76]
	mov	r2, #7
	ldr	r1, .L153+24
	mov	r0, r5
	blx	r3
	cmp	r0, #0
	movweq	r3, #4600
	streq	r3, [r8, #808]
.L113:
	sub	r2, fp, #56
	ldr	r3, [r9, #72]
	ldr	r1, .L153+28
	mov	r0, r5
	blx	r3
	mov	r3, #0
	ldr	r1, [r8, #792]
	strb	r3, [r8, #745]
	strb	r3, [r8, #746]
	strb	r3, [r8, #743]
	strb	r3, [r8, #742]
	strb	r3, [r8, #744]
	cmp	r0, #1
	ldreq	r2, [fp, #-56]
	ldrne	r2, [r8, #804]
	streq	r2, [r8, #804]
	cmp	r2, #0
	beq	.L106
	cmp	r1, r3
	strne	r3, [r8, #792]
	strne	r3, [r8, #796]
	cmp	r2, #1
	mvnne	r0, #0
	movne	r1, #0
	beq	.L145
.L116:
	movw	r3, #502
	cmp	r1, r3
	bls	.L108
.L115:
	mov	r3, #1
	strb	r3, [r8, #746]
.L108:
	sub	r2, r2, #1
	cmp	r2, #11
	bhi	.L109
.L117:
	mov	r3, #1
	strb	r3, [r8, #743]
.L109:
	ldr	r3, [r8, #808]
	movw	r2, #4668
	sub	r3, r3, #1
	cmp	r3, r2
	movls	r3, #1
	strlsb	r3, [r8, #743]
	movw	r3, #498
	cmp	r0, r3
	movls	r3, #1
	strlsb	r3, [r8, #743]
	cmp	r1, #500
	bne	.L124
	ldr	r2, [r8, #796]
	movw	r3, #413
	mov	r0, r7
	cmp	r2, r3
	moveq	r3, #1
	streqb	r3, [r8, #744]
	b	.L142
.L147:
	add	r4, r4, #20480
	mov	r3, #0
	movw	r0, #8224
	strb	r3, [r4, #1506]
	b	.L142
.L101:
	ldr	r3, [fp, #-56]
	str	r3, [r8, #808]
	b	.L113
.L150:
	cmp	r10, #1024
	movlt	r2, r10
	movge	r2, #1024
	b	.L96
.L106:
	cmp	r1, #500
	subcs	r0, r1, #1
	movcs	r3, #1
	strcsb	r3, [r8, #745]
	bcs	.L116
	movw	r3, #502
	cmp	r1, r3
	sub	r0, r1, #1
	bhi	.L115
	b	.L109
.L151:
	add	r6, r6, #2
	cmp	r6, #1024
	movge	r6, #1024
	b	.L97
.L86:
	cmp	r2, #3
	ble	.L91
	add	r4, r4, #20480
	mov	r3, #1
	mov	r0, #32
	strb	r3, [r4, #1506]
	b	.L142
.L149:
	mov	r2, r0
	b	.L143
.L152:
	sub	r3, fp, #61
	ldr	r1, .L153+32
	str	r3, [sp]
	mov	r0, r5
	ldr	r4, [r2, #72]
	sub	r3, fp, #56
	sub	r2, fp, #60
	blx	r4
	cmp	r0, #1
	ble	.L99
	b	.L98
.L145:
	strb	r2, [r8, #745]
	mvn	r0, #0
	mov	r1, #0
	b	.L117
.L154:
	.align	2
.L153:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_EventReportFunc
	.word	.LC1
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC2
	UNWIND(.fnend)
	.size	Mp4_Syntax_UserData, .-Mp4_Syntax_UserData
	.align	2
	.global	Mp4_Syntax_Vo
	.type	Mp4_Syntax_Vo, %function
Mp4_Syntax_Vo:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #32)
	sub	sp, sp, #32
	add	r4, r0, #20480
	mov	r5, r0
	sub	r0, fp, #60
	mov	r7, r2
	mov	r6, #1
	bl	BsInit
	mov	r3, #0
	mov	r1, #32
	strb	r3, [r4, #812]
	strb	r3, [r4, #814]
	sub	r0, fp, #60
	strb	r3, [r4, #815]
	add	r5, r5, #16384
	strb	r3, [r4, #816]
	strb	r3, [r4, #817]
	strb	r3, [r4, #818]
	strb	r3, [r4, #819]
	str	r3, [r4, #824]
	str	r3, [r4, #828]
	str	r3, [r4, #832]
	strb	r6, [r4, #813]
	bl	BsSkip
	mov	r1, r6
	sub	r0, fp, #60
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #3536]
	cmp	r0, #0
	streqb	r6, [r5, #3537]
	bne	.L170
.L157:
	mov	r1, #4
	sub	r0, fp, #60
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r5, #3539]
	cmp	r6, #1
	beq	.L171
	mov	r7, #0
	sub	r0, fp, #60
	strb	r7, [r4, #1501]
	bl	BsPos
	ldr	r3, .L173
	ldr	r6, [r3]
	cmp	r6, r7
	mov	r5, r0
	beq	.L161
	ldr	r0, [r4, #2424]
	mov	r3, r7
	mov	r2, r7
	mov	r1, #21
	blx	r6
	mov	r0, r5
.L161:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L170:
	mov	r1, #4
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #3
	strb	r0, [r5, #3537]
	sub	r0, fp, #60
	bl	BsGet
	strb	r0, [r5, #3538]
	b	.L157
.L171:
	mov	r1, r6
	sub	r0, fp, #60
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #3540]
	cmp	r0, #0
	bne	.L172
.L160:
	mov	r3, #1
	sub	r0, fp, #60
	strb	r3, [r4, #1501]
	bl	BsPos
	cmp	r0, r7, asl #3
	bgt	.L162
	ldrb	r3, [r5, #3536]	@ zero_extendqisi2
	strb	r3, [r4, #812]
	ldrb	r3, [r5, #3537]	@ zero_extendqisi2
	strb	r3, [r4, #813]
	ldrb	r3, [r5, #3538]	@ zero_extendqisi2
	strb	r3, [r4, #814]
	ldrb	r3, [r5, #3539]	@ zero_extendqisi2
	strb	r3, [r4, #815]
	ldrb	r3, [r5, #3540]	@ zero_extendqisi2
	strb	r3, [r4, #816]
	ldrb	r3, [r5, #3541]	@ zero_extendqisi2
	strb	r3, [r4, #817]
	ldrb	r3, [r5, #3542]	@ zero_extendqisi2
	strb	r3, [r4, #818]
	ldrb	r3, [r5, #3543]	@ zero_extendqisi2
	strb	r3, [r4, #819]
	ldr	r3, [r5, #3548]
	str	r3, [r4, #824]
	ldr	r3, [r5, #3552]
	str	r3, [r4, #828]
	ldr	r3, [r5, #3556]
	str	r3, [r4, #832]
.L162:
	sub	r0, fp, #60
	bl	BsPos
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L172:
	mov	r1, #3
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, r6
	strb	r0, [r5, #3541]
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, r6
	strb	r0, [r5, #3542]
	sub	r0, fp, #60
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #3543]
	cmp	r0, #0
	beq	.L160
	mov	r1, #8
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #8
	str	r0, [r5, #3548]
	sub	r0, fp, #60
	bl	BsGet
	mov	r1, #8
	str	r0, [r5, #3552]
	sub	r0, fp, #60
	bl	BsGet
	str	r0, [r5, #3556]
	b	.L160
.L174:
	.align	2
.L173:
	.word	g_EventReportFunc
	UNWIND(.fnend)
	.size	Mp4_Syntax_Vo, .-Mp4_Syntax_Vo
	.align	2
	.global	Mp4_Syntax_Vol
	.type	Mp4_Syntax_Vol, %function
Mp4_Syntax_Vol:
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
	ldr	r9, .L325
	add	r8, r0, #19712
	mov	r7, r0
	add	r8, r8, #232
	add	r6, r7, #20480
	sub	r0, fp, #76
	add	r4, r7, #16384
	bl	BsInit
	ldr	r3, [r9, #48]
	mov	r2, #604
	mov	r1, #0
	mov	r0, r8
	strb	r1, [r6, #733]
	blx	r3
	mov	r1, #32
	sub	r0, fp, #76
	bl	BsSkip
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #8
	strb	r0, [r4, #3564]
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #3588]
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #3560]
	cmp	r0, #0
	ldreqb	r3, [r6, #813]	@ zero_extendqisi2
	streqb	r3, [r4, #3561]
	bne	.L313
.L177:
	mov	r1, #4
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #3563]
	cmp	r0, #15
	beq	.L314
.L178:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #3565]
	cmp	r0, #0
	moveq	r3, #1
	streqb	r3, [r4, #3566]
	bne	.L315
.L183:
	mov	r1, #2
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4, #3568]
	cmp	r5, #0
	subne	r0, fp, #76
	movne	r7, #0
	beq	.L316
.L311:
	strb	r7, [r6, #1503]
	bl	BsPos
	ldr	r3, .L325+4
	ldr	r5, [r3]
	cmp	r5, r7
	mov	r4, r0
	beq	.L251
	ldr	r0, [r6, #2424]
	mov	r3, r7
	mov	r2, r7
	mov	r1, #21
	blx	r5
	mov	r0, r4
.L283:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L316:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	subs	r10, r0, #0
	beq	.L317
	mov	r1, #16
	sub	r0, fp, #76
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #3632]
	beq	.L191
	subs	r0, r0, #1
	beq	.L191
	mov	r3, r0
.L193:
	add	r5, r5, #1
	movs	r3, r3, lsr #1
	uxth	r5, r5
	bne	.L193
	sxth	r5, r5
	cmp	r5, #0
	ble	.L191
.L195:
	add	r3, r3, #1
	movs	r0, r0, lsr #1
	uxth	r3, r3
	bne	.L195
	sxth	r3, r3
.L285:
	str	r3, [r4, #3628]
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	subs	r5, r0, #0
	bne	.L197
	ldr	r2, .L325+8
	movw	r1, #1514
.L297:
	mov	r0, #1
.L299:
	bl	dprint_normal
	strb	r5, [r6, #1503]
	sub	r0, fp, #76
	bl	BsPos
	ldr	r3, .L325+4
	ldr	r7, [r3]
	cmp	r7, #0
	mov	r4, r0
	beq	.L251
	ldr	r0, [r6, #2424]
	mov	r3, r5
	mov	r2, r5
	mov	r1, #22
	blx	r7
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L315:
	mov	r1, #2
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r10, r0
	strb	r10, [r4, #3566]
	cmp	r10, #1
	beq	.L180
	mov	r3, #0
	sub	r0, fp, #76
	strb	r3, [r6, #1503]
	bl	BsPos
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L313:
	mov	r1, #4
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #3
	strb	r0, [r4, #3561]
	sub	r0, fp, #76
	bl	BsGet
	strb	r0, [r4, #3562]
	b	.L177
.L317:
	ldr	r2, .L325+8
	movw	r1, #1501
	mov	r0, #1
	bl	dprint_normal
	strb	r10, [r6, #1503]
	sub	r0, fp, #76
	bl	BsPos
	ldr	r3, .L325+4
	ldr	r5, [r3]
	cmp	r5, #0
	mov	r4, r0
	beq	.L251
	ldr	r0, [r6, #2424]
	mov	r3, r10
	mov	r2, r10
	mov	r1, #22
	blx	r5
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L180:
	mov	r1, r10
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, r10
	strb	r0, [r4, #3567]
	sub	r0, fp, #76
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #3600]
	beq	.L183
	mov	r1, #15
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, r10
	str	r0, [r4, #3604]
	sub	r0, fp, #76
	bl	BsGet
	subs	r5, r0, #0
	bne	.L184
	mov	r0, r10
	ldr	r2, .L325+8
	movw	r1, #1473
	b	.L299
.L251:
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L314:
	mov	r1, #8
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #8
	str	r0, [r4, #3592]
	sub	r0, fp, #76
	bl	BsGet
	str	r0, [r4, #3596]
	b	.L178
.L191:
	mov	r3, #1
	b	.L285
.L197:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #3569]
	cmp	r0, #0
	bne	.L318
.L198:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	subs	r5, r0, #0
	beq	.L319
	mov	r1, #13
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #3640]
	sub	r0, fp, #76
	bl	BsGet
	subs	r5, r0, #0
	bne	.L200
	ldr	r2, .L325+8
	movw	r1, #1524
	b	.L297
.L319:
	ldr	r2, .L325+8
	movw	r1, #1522
	b	.L297
.L318:
	ldr	r1, [r4, #3628]
	sub	r0, fp, #76
	bl	BsGet
	str	r0, [r4, #3636]
	b	.L198
.L200:
	mov	r1, #13
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #3644]
	sub	r0, fp, #76
	bl	BsGet
	subs	r5, r0, #0
	beq	.L320
	ldr	r3, [r4, #3640]
	cmp	r3, #31
	bls	.L202
	ldr	r2, [r4, #3644]
	cmp	r2, #31
	bls	.L202
	mul	r3, r3, r2
	cmp	r3, #16777216
	bls	.L203
.L202:
	mov	r7, #0
	sub	r0, fp, #76
	strb	r7, [r6, #1503]
	bl	BsPos
	ldr	r3, .L325+4
	ldr	r5, [r3]
	cmp	r5, r7
	mov	r4, r0
	beq	.L251
	ldr	r0, [r6, #2424]
	mov	r3, r7
	mov	r2, r7
	mov	r1, #22
	blx	r5
	mov	r0, r4
	b	.L283
.L184:
	mov	r1, #15
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, r10
	str	r0, [r4, #3608]
	sub	r0, fp, #76
	bl	BsGet
	subs	r5, r0, #0
	moveq	r0, r10
	ldreq	r2, .L325+8
	movweq	r1, #1475
	beq	.L299
.L185:
	mov	r1, #15
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, r10
	str	r0, [r4, #3612]
	sub	r0, fp, #76
	bl	BsGet
	subs	r5, r0, #0
	bne	.L186
	mov	r0, r10
	ldr	r2, .L325+8
	movw	r1, #1477
	b	.L299
.L320:
	ldr	r2, .L325+8
	movw	r1, #1526
	b	.L297
.L186:
	mov	r1, #3
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #11
	str	r0, [r4, #3616]
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, r10
	str	r0, [r4, #3620]
	sub	r0, fp, #76
	bl	BsGet
	subs	r5, r0, #0
	moveq	r0, r10
	ldreq	r2, .L325+8
	movweq	r1, #1481
	beq	.L299
.L187:
	mov	r1, #15
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, r10
	str	r0, [r4, #3624]
	sub	r0, fp, #76
	bl	BsGet
	subs	r5, r0, #0
	bne	.L183
	mov	r0, r10
	ldr	r2, .L325+8
	movw	r1, #1483
	b	.L299
.L203:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #3570]
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r3, r0
	strb	r3, [r4, #3571]
	cmp	r3, #0
	bne	.L205
	ldr	r2, .L325+4
	strb	r3, [r6, #1503]
	ldr	r5, [r2]
	cmp	r5, #0
	beq	.L205
	mov	r2, r3
	mov	r1, #21
	ldr	r0, [r6, #2424]
	blx	r5
.L205:
	ldrb	r3, [r4, #3561]	@ zero_extendqisi2
	sub	r0, fp, #76
	cmp	r3, #1
	moveq	r1, #1
	movne	r1, #2
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4, #3572]
	cmp	r5, #0
	beq	.L208
	sub	r3, r5, #1
	cmp	r3, #1
	bls	.L321
	mov	r7, #0
	sub	r0, fp, #76
	strb	r7, [r6, #1503]
	bl	BsPos
	ldr	r3, .L325+4
	ldr	r5, [r3]
	cmp	r5, r7
	mov	r4, r0
	beq	.L213
	ldr	r0, [r6, #2424]
	mov	r3, r7
	mov	r2, r7
	mov	r1, #21
	blx	r5
.L213:
	ldr	r2, .L325+12
	movw	r1, #1617
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	b	.L283
.L321:
	cmp	r5, #2
	beq	.L210
	mov	r7, #0
	sub	r0, fp, #76
	strb	r7, [r6, #1503]
	bl	BsPos
	ldr	r3, .L325+4
	ldr	r5, [r3]
	cmp	r5, r7
	mov	r4, r0
	beq	.L211
	ldr	r0, [r6, #2424]
	mov	r3, r7
	mov	r2, r7
	mov	r1, #21
	blx	r5
.L211:
	ldr	r2, .L325+16
	movw	r1, #1575
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	b	.L283
.L208:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #3573]
	cmp	r0, #0
	beq	.L214
	mov	r7, #0
	sub	r0, fp, #76
	strb	r7, [r6, #1503]
	bl	BsPos
	ldr	r3, .L325+4
	ldr	r5, [r3]
	cmp	r5, r7
	mov	r4, r0
	beq	.L215
	ldr	r0, [r6, #2424]
	mov	r3, r7
	mov	r2, r7
	mov	r1, #21
	blx	r5
.L215:
	ldr	r2, .L325+20
	movw	r1, #1631
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	b	.L283
.L214:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #3574]
	cmp	r0, #0
	bne	.L322
.L217:
	ldrb	r3, [r4, #3561]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r3, #0
	streqb	r3, [r4, #3577]
	beq	.L224
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	strb	r0, [r4, #3577]
.L224:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4, #3578]
	cmp	r5, #0
	bne	.L225
	ldr	r2, .L325+24
	movw	r1, #1682
.L307:
	mov	r0, #1
	bl	dprint_normal
	strb	r5, [r6, #1503]
	sub	r0, fp, #76
	bl	BsPos
	ldr	r3, .L325+4
	ldr	r7, [r3]
	cmp	r7, #0
	mov	r4, r0
	beq	.L251
	ldr	r0, [r6, #2424]
	mov	r3, r5
	mov	r2, r5
	mov	r1, #21
	blx	r7
	mov	r0, r4
	b	.L283
.L210:
	mov	r1, #6
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, r5
	strb	r0, [r4, #3584]
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #3585]
	sub	r0, fp, #76
	bl	BsGet
	ldrb	r3, [r4, #3572]	@ zero_extendqisi2
	cmp	r3, #2
	strb	r0, [r4, #3586]
	beq	.L208
	mov	r7, #0
	sub	r0, fp, #76
	strb	r7, [r6, #1503]
	bl	BsPos
	ldr	r3, .L325+4
	ldr	r5, [r3]
	cmp	r5, r7
	mov	r4, r0
	beq	.L212
	ldr	r0, [r6, #2424]
	mov	r3, r7
	mov	r2, r7
	mov	r1, #21
	blx	r5
.L212:
	ldr	r2, .L325+16
	movw	r1, #1607
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	b	.L283
.L322:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #3575]
	cmp	r0, #0
	bne	.L323
	ldr	r3, .L325+28
	add	r2, r7, #19968
	add	r2, r2, #60
	add	r0, r3, #256
.L220:
	ldr	r1, [r3, #4]!
	cmp	r3, r0
	str	r1, [r2, #4]!
	bne	.L220
.L219:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #3576]
	cmp	r0, #0
	bne	.L232
	ldr	r3, .L325+32
	add	r2, r7, #20224
	add	r2, r2, #60
	add	r0, r3, #256
.L221:
	ldr	r1, [r3, #4]!
	cmp	r3, r0
	str	r1, [r2, #4]!
	bne	.L221
	b	.L217
.L225:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #3579]
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r10, r0
	strb	r10, [r4, #3580]
	cmp	r10, #0
	ldrne	r2, .L325+36
	movwne	r1, #1694
	bne	.L309
	ldrb	r3, [r4, #3561]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L324
	strb	r10, [r4, #3581]
	strb	r10, [r4, #3582]
.L229:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #3583]
	cmp	r0, #0
	beq	.L230
	ldr	r2, .L325+40
	movw	r1, #1735
.L309:
	mov	r0, #1
	mov	r7, #0
	bl	dprint_normal
	sub	r0, fp, #76
	b	.L311
.L324:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4, #3581]
	cmp	r5, #0
	beq	.L228
	ldr	r2, .L325+44
	movw	r1, #1707
	mov	r0, #1
	bl	dprint_normal
	strb	r10, [r6, #1503]
	sub	r0, fp, #76
	bl	BsPos
	ldr	r3, .L325+4
	ldr	r5, [r3]
	cmp	r5, #0
	mov	r4, r0
	beq	.L251
	ldr	r0, [r6, #2424]
	mov	r3, r10
	mov	r2, r10
	mov	r1, #21
	blx	r5
	mov	r0, r4
	b	.L283
.L230:
	add	r0, r7, #20480
	mov	r3, #1
	ldr	r4, [r9, #52]
	mov	r1, r8
	mov	r2, #604
	strb	r3, [r6, #1503]
	strb	r3, [r6, #733]
	add	r0, r0, #68
	strb	r3, [r6, #1504]
	blx	r4
	sub	r0, fp, #76
	bl	BsPos
	b	.L283
.L228:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #3582]
	cmp	r0, #0
	beq	.L229
	ldr	r2, .L325+48
	movw	r1, #1718
	b	.L307
.L323:
	add	r1, r7, #19968
	sub	r0, fp, #76
	add	r1, r1, #64
	bl	Bs_Get_Matrix
	b	.L219
.L232:
	add	r1, r7, #20224
	sub	r0, fp, #76
	add	r1, r1, #64
	bl	Bs_Get_Matrix
	b	.L217
.L326:
	.align	2
.L325:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_EventReportFunc
	.word	.LC8
	.word	.LC10
	.word	.LC9
	.word	.LC11
	.word	.LC12
	.word	.LANCHOR1-4
	.word	.LANCHOR1+252
	.word	.LC13
	.word	.LC16
	.word	.LC14
	.word	.LC15
	UNWIND(.fnend)
	.size	Mp4_Syntax_Vol, .-Mp4_Syntax_Vol
	.align	2
	.global	Mp4_Syntax_Vos
	.type	Mp4_Syntax_Vos, %function
Mp4_Syntax_Vos:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #32)
	sub	sp, sp, #32
	add	r5, r0, #20480
	add	r4, r0, #16384
	sub	r0, fp, #52
	bl	BsInit
	mov	r3, #0
	mov	r1, #32
	str	r3, [r5, #820]
	sub	r0, fp, #52
	bl	BsSkip
	sub	r0, fp, #52
	mov	r1, #8
	bl	BsGet
	sub	r3, r0, #240
	sub	r2, r0, #1
	cmp	r3, #5
	cmphi	r2, #2
	str	r0, [r4, #3544]
	movls	r3, #1
	movhi	r3, #0
	cmp	r0, #8
	orreq	r3, r3, #1
	cmp	r3, #0
	strne	r0, [r5, #820]
	movne	r3, #1
	strneb	r3, [r5, #1500]
	bne	.L329
	cmp	r0, #0
	beq	.L334
	ldr	r2, .L335
	strb	r3, [r5, #1500]
	ldr	r4, [r2]
	cmp	r4, #0
	beq	.L329
	ldr	r0, [r5, #2424]
	mov	r2, r3
	mov	r1, #21
	blx	r4
.L329:
	sub	r0, fp, #52
	bl	BsPos
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L334:
	mov	r3, r0
	ldr	r2, .L335+4
	movw	r1, #1781
	mov	r0, #1
	bl	dprint_normal
	mov	r3, #1
	strb	r3, [r5, #1500]
	ldr	r3, [r4, #3544]
	str	r3, [r5, #820]
	b	.L329
.L336:
	.align	2
.L335:
	.word	g_EventReportFunc
	.word	.LC17
	UNWIND(.fnend)
	.size	Mp4_Syntax_Vos, .-Mp4_Syntax_Vos
	.align	2
	.global	MP4_FrameInit
	.type	MP4_FrameInit, %function
MP4_FrameInit:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #40)
	sub	sp, sp, #40
	ldr	r3, .L347
	add	r4, r0, #20480
	mov	r5, r2
	mov	r6, r1
	mov	r2, #36
	ldr	r3, [r3, #48]
	mov	r1, #0
	mov	r7, r0
	sub	r0, fp, #64
	blx	r3
	ldr	r3, [r4, #1524]
	str	r5, [fp, #-44]
	mov	lr, #2
	str	r6, [fp, #-48]
	sub	r1, fp, #64
	ldr	r0, [r3, #16]
	mov	r2, #0
	str	r5, [fp, #-52]
	mov	ip, #8
	cmp	r0, #24
	ldr	r0, [r4, #2424]
	str	r6, [fp, #-56]
	movne	r5, #3
	moveq	r5, #1
	str	r5, [fp, #-40]
	ldr	r3, [r3, #16]
	str	lr, [fp, #-64]
	cmp	r3, #24
	strb	ip, [fp, #-59]
	movne	r3, lr
	moveq	r3, #1
	str	r3, [fp, #-36]
	bl	FSP_ArrangeFsPool
	cmp	r0, #2
	beq	.L345
	cmp	r0, #0
	moveq	r3, #1
	streq	r3, [r4, #2428]
	bne	.L346
.L341:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L346:
	ldr	r3, .L347+4
	movw	r1, #2162
	ldr	r2, .L347+8
	mov	r0, #0
	bl	dprint_normal
	mov	r3, #0
	mvn	r0, #0
	str	r3, [r4, #2428]
	b	.L341
.L345:
	add	r0, r7, #22528
	add	r0, r0, #24
	bl	ResetVoQueue
	mov	r3, #0
	mvn	r0, #0
	str	r3, [r4, #2428]
	b	.L341
.L348:
	.align	2
.L347:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+1280
	.word	.LC18
	UNWIND(.fnend)
	.size	MP4_FrameInit, .-MP4_FrameInit
	.global	__aeabi_uidiv
	.align	2
	.global	Mp4_RecordFrameAtr
	.type	Mp4_RecordFrameAtr, %function
Mp4_RecordFrameAtr:
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
	UNWIND(.pad #16)
	sub	sp, sp, #16
	add	r9, r0, #20480
	mov	r5, r0
	mov	r6, r1
	ldrb	r3, [r9, #839]	@ zero_extendqisi2
	cmp	r3, #15
	beq	.L368
	sub	r2, r3, #2
	cmp	r2, #1
	movls	r4, #1
	bls	.L351
	sub	r2, r3, #4
	cmp	r2, #1
	movls	r4, #2
	bls	.L351
	cmp	r3, #1
	moveq	r4, #5
	movne	r4, #0
.L351:
	mov	r1, r6
	ldr	r0, [r9, #2424]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L349
	mov	r1, r4
	bl	SetAspectRatio
	ldr	r3, [r9, #752]
	add	r0, r5, #22272
	ldrb	r1, [r8, #156]	@ zero_extendqisi2
	ldrb	r2, [r8, #157]	@ zero_extendqisi2
	mov	lr, #0
	mov	r3, r3, lsr #1
	str	r3, [r8, #48]
	ldr	ip, [r9, #748]
	add	r0, r0, #248
	add	r3, r8, #160
	mov	ip, ip, lsr #1
	str	ip, [r8, #52]
	ldr	r5, [r9, #2004]
	add	ip, r8, #192
	str	r5, [r8, #104]
	ldr	r5, [r9, #2000]
	str	r5, [r8, #100]
	ldrb	r5, [r9, #1440]	@ zero_extendqisi2
	bfi	r1, r5, #0, #2
	strb	r1, [r8, #156]
	ldrb	r5, [r9, #817]	@ zero_extendqisi2
	bfi	r1, r5, #5, #3
	strb	r1, [r8, #156]
	ldrb	r1, [r9, #846]	@ zero_extendqisi2
	and	r1, r1, #1
	bfi	r2, r1, #0, #2
	uxtb	r2, r2
	orr	r2, r2, #12
	strb	r2, [r8, #157]
	ldrb	r1, [r9, #1445]	@ zero_extendqisi2
	bfi	r2, r1, #4, #2
	strb	r2, [r8, #157]
	ldr	r2, [r8, #156]
	mov	r1, lr
	bfi	r2, r4, #14, #3
	str	r2, [r8, #156]
	ldrb	r2, [r9, #1440]	@ zero_extendqisi2
	and	r2, r2, #3
	str	r2, [r8, #24]
	ldrb	r2, [r9, #1440]	@ zero_extendqisi2
	str	lr, [r8, #20]
	and	r2, r2, #3
	str	r2, [r8, #28]
.L357:
	ldr	r2, [r0, #4]!
	str	r2, [r3, #8]!
	cmp	r3, ip
	str	r1, [r3, #4]
	bne	.L357
	ldr	r3, [r9, #1524]
	mvn	r4, #0
	mvn	r5, #0
	ldr	r2, .L369
	movw	r1, #2295
	mov	r0, #24
	ldrd	r6, [r3, #32]
	strd	r6, [r8, #208]
	ldr	r3, [r9, #1524]
	ldrd	r6, [r3, #48]
	strd	r6, [r8, #216]
	ldr	r3, [r9, #1524]
	ldrd	r6, [r3, #64]
	strd	r6, [r8, #224]
	ldr	r3, [r9, #1524]
	ldr	r3, [r3, #80]
	str	r3, [r8]
	ldr	r3, [r9, #1524]
	ldr	r3, [r3, #84]
	str	r3, [r8, #4]
	ldr	r3, [r9, #1524]
	ldr	r3, [r3, #88]
	str	r3, [r8, #8]
	ldr	r3, [r9, #1524]
	ldr	r3, [r3, #104]
	str	r3, [r8, #12]
	ldr	r3, [r9, #1524]
	strd	r4, [r3, #32]
	ldrd	r4, [r8, #216]
	ldr	r3, [r9, #2424]
	strd	r4, [sp, #8]
	ldrd	r4, [r8, #208]
	strd	r4, [sp]
	bl	dprint_normal
.L349:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L368:
	ldr	r2, [r9, #868]
	ldr	r1, [r9, #872]
	cmp	r2, #0
	cmpne	r1, #0
	moveq	r4, #0
	beq	.L351
	ldr	r3, [r9, #920]
	mul	r1, r3, r1
	cmp	r1, #0
	beq	.L359
	ldr	r0, [r9, #916]
	mov	r2, r2, asl #10
	mul	r0, r0, r2
	bl	__aeabi_uidiv
	movw	r3, #1364
	cmp	r0, r3
	movw	r3, #1819
	rsble	r4, r0, #1360
	subgt	r4, r0, #1360
	addle	r4, r4, #5
	subgt	r4, r4, #5
	cmp	r0, r3
	rsble	r0, r0, #1808
	subgt	r0, r0, #1808
	addle	r0, r0, #12
	subgt	r0, r0, #12
	cmp	r4, r0
	movlt	r4, #1
	movge	r4, #2
	b	.L351
.L359:
	mov	r4, r1
	b	.L351
.L370:
	.align	2
.L369:
	.word	.LC19
	UNWIND(.fnend)
	.size	Mp4_RecordFrameAtr, .-Mp4_RecordFrameAtr
	.align	2
	.global	Mp4_Frame_Atr
	.type	Mp4_Frame_Atr, %function
Mp4_Frame_Atr:
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
	add	r4, r0, #20480
	mvn	r2, #0
	mov	r5, r0
	ldrb	r3, [r4, #1440]	@ zero_extendqisi2
	cmp	r3, #4
	strb	r3, [r0, #2]
	str	r2, [r4, #2452]
	beq	.L382
	mov	r1, #1
	ldr	r0, [r4, #2424]
	bl	FSP_NewLogicFs
	mov	r1, r0
	str	r0, [r4, #2452]
.L374:
	cmp	r1, #0
	blt	.L375
	ldr	r3, [r4, #2428]
	cmp	r3, #0
	beq	.L375
	mov	r0, r5
	bl	Mp4_RecordFrameAtr
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #2008]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L382:
	ldr	r2, [r4, #2424]
	mov	ip, #100
	ldr	r3, .L383
	ldr	r1, [r4, #2444]
	mov	r0, r2
	mla	r3, ip, r2, r3
	ldr	r2, [r3, #88]
	add	r2, r2, #1
	str	r2, [r3, #88]
	bl	FSP_LinkLogicFs
	cmp	r0, #0
	ldrne	r1, [r0, #4]
	ldreq	r1, [r4, #2452]
	strne	r1, [r4, #2452]
	b	.L374
.L375:
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	movw	r1, #2323
	ldr	r2, .L383+4
	mov	r0, #0
	bl	dprint_normal
	ldr	r1, [r4, #2444]
	ldr	r0, [r4, #2424]
	bl	FSP_GetFsImagePtr
	subs	r6, r0, #0
	beq	.L377
	ldr	r1, [r6, #168]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	ldr	r1, [r6, #176]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	ldr	r1, [r6, #184]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	ldr	r1, [r6, #192]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r6, #168]
	strd	r2, [r6, #176]
	strd	r2, [r6, #184]
	strd	r2, [r6, #192]
	ldr	r1, [r4, #2444]
	ldr	r0, [r4, #2424]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #2436]
	ldr	r0, [r4, #2424]
	bl	FSP_ClearLogicFs
	ldr	r0, [r4, #2424]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #2444]
	str	r0, [r4, #2436]
.L377:
	add	r1, r5, #22528
	mov	r3, #0
	add	r1, r1, #24
	str	r3, [r4, #2432]
	ldr	r0, [r4, #2424]
	bl	FSP_ClearNotInVoQueue
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L384:
	.align	2
.L383:
	.word	g_VfmwChanStat
	.word	.LC20
	UNWIND(.fnend)
	.size	Mp4_Frame_Atr, .-Mp4_Frame_Atr
	.align	2
	.global	Mp4_Set_DecPar
	.type	Mp4_Set_DecPar, %function
Mp4_Set_DecPar:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #64)
	sub	sp, sp, #64
	ldr	r3, .L402
	add	r5, r0, #20480
	mov	r4, r0
	mov	r2, #48
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	r0, fp, #84
	blx	r3
	ldr	r2, [r5, #752]
	add	r7, r4, #1040
	add	r6, r4, #12288
	add	r3, r2, #15
	mov	r3, r3, lsr #4
	strh	r3, [r7, #152]	@ movhi
	ldr	r1, [r5, #748]
	add	r3, r1, #15
	mov	r3, r3, lsr #4
	strh	r3, [r7, #154]	@ movhi
	ldrb	r3, [r5, #1440]	@ zero_extendqisi2
	strb	r3, [r4, #1040]
	ldrb	r0, [r5, #850]	@ zero_extendqisi2
	strb	r0, [r4, #1041]
	ldrb	r0, [r5, #741]	@ zero_extendqisi2
	strb	r0, [r4, #1042]
	ldrb	r0, [r5, #1447]	@ zero_extendqisi2
	strb	r0, [r4, #1043]
	ldrb	r0, [r5, #1452]	@ zero_extendqisi2
	strb	r0, [r4, #1044]
	ldrb	r0, [r5, #1451]	@ zero_extendqisi2
	strb	r0, [r4, #1045]
	ldr	r0, [r5, #904]
	strb	r0, [r4, #1046]
	ldrb	r0, [r5, #1448]	@ zero_extendqisi2
	strb	r0, [r4, #1047]
	ldrb	r0, [r5, #1449]	@ zero_extendqisi2
	strb	r0, [r4, #1048]
	ldrb	r0, [r5, #1444]	@ zero_extendqisi2
	strb	r0, [r4, #1049]
	ldrb	r0, [r5, #855]	@ zero_extendqisi2
	strb	r0, [r4, #1050]
	ldrb	r0, [r5, #853]	@ zero_extendqisi2
	strb	r0, [r4, #1051]
	ldrb	r0, [r5, #1442]	@ zero_extendqisi2
	strb	r0, [r4, #1052]
	ldrb	r0, [r5, #1446]	@ zero_extendqisi2
	strb	r0, [r4, #1053]
	ldrb	r0, [r5, #1445]	@ zero_extendqisi2
	strb	r0, [r4, #1054]
	ldrb	r0, [r5, #846]	@ zero_extendqisi2
	strb	r0, [r4, #1055]
	ldr	r0, [r5, #784]
	str	r0, [r4, #1196]
	ldr	r0, [r5, #780]
	str	r0, [r4, #1200]
	ldrb	r0, [r5, #744]	@ zero_extendqisi2
	strb	r0, [r4, #1186]
	ldrb	r0, [r5, #743]	@ zero_extendqisi2
	strb	r0, [r4, #1185]
	ldrb	r0, [r5, #742]	@ zero_extendqisi2
	strb	r0, [r4, #1184]
	ldrb	r0, [r5, #745]	@ zero_extendqisi2
	strb	r0, [r4, #1187]
	ldrb	r0, [r5, #746]	@ zero_extendqisi2
	strb	r0, [r4, #1188]
	ldrb	r0, [r5, #747]	@ zero_extendqisi2
	strb	r0, [r4, #1189]
	str	r1, [r6, #3308]
	str	r2, [r6, #3312]
	ldrb	r2, [r5, #848]	@ zero_extendqisi2
	cmp	r2, #2
	cmpeq	r3, #3
	str	r2, [r6, #3316]
	moveq	r3, #1
	movne	r3, #0
	beq	.L399
	ldrb	r2, [r5, #861]	@ zero_extendqisi2
	str	r3, [r6, #3320]
	str	r3, [r6, #3328]
	str	r2, [r6, #3324]
	str	r3, [r6, #3332]
	str	r3, [r6, #3336]
	str	r3, [r6, #3340]
	str	r3, [r6, #3344]
	str	r3, [r6, #3348]
	str	r3, [r6, #3352]
	str	r3, [r6, #3356]
.L387:
	ldr	r1, [r5, #2452]
	ldr	r0, [r5, #2424]
	bl	FSP_GetLogicFs
	ldr	r1, [r5, #2436]
	mov	r8, r0
	ldr	r0, [r5, #2424]
	bl	FSP_GetLogicFs
	ldr	r1, [r5, #2444]
	mov	r9, r0
	ldr	r0, [r5, #2424]
	bl	FSP_GetLogicFs
	cmp	r8, #0
	cmpne	r9, #0
	moveq	r3, #1
	movne	r3, #0
	cmp	r0, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L400
	ldr	r2, [r8, #24]
	cmp	r2, #0
	beq	.L401
	ldr	r3, [r8, #32]
	add	lr, r4, #21248
	add	ip, r4, #1040
	add	r1, r4, #21504
	add	lr, lr, #152
	add	ip, ip, #15
	ldr	r3, [r3, #8]
	add	r1, r1, #152
	str	r3, [r4, #1220]
	ldr	r3, [r0, #32]
	ldr	r3, [r3, #8]
	str	r3, [r4, #1224]
	ldr	r3, [r0, #24]
	cmp	r3, #0
	ldreq	r3, [r8, #24]
	ldr	r3, [r3, #4]
	str	r3, [r4, #1216]
	ldr	r3, [r9, #24]
	cmp	r3, #0
	ldreq	r3, [r8, #24]
	ldr	r3, [r3, #4]
	str	r3, [r4, #1212]
	mov	r3, #0
	ldr	r2, [r8, #24]
	ldr	r2, [r2, #4]
	str	r3, [r4, #1208]
	str	r2, [r4, #1204]
	ldr	r2, [r8, #24]
	ldr	r2, [r2, #4]
	str	r2, [r4, #1228]
	ldr	r2, [r8, #24]
	ldr	r2, [r2, #44]
	str	r2, [r6, #3288]
	ldr	r2, [r8, #24]
	ldr	r2, [r2, #48]
	str	r2, [r6, #3292]
	ldr	r2, [r8, #24]
	ldr	r2, [r2, #72]
	str	r2, [r6, #3296]
	ldr	r2, [r8, #24]
	ldr	r2, [r2, #64]
	str	r2, [r6, #3300]
	ldr	r2, [r8, #24]
	ldr	r0, [r2, #68]
	add	r2, r4, #1104
	add	r2, r2, #15
	str	r0, [r6, #3304]
	ldrb	r0, [r8, #408]	@ zero_extendqisi2
	strb	r0, [r4, #1191]
.L395:
	ldr	r0, [lr, #4]!
	add	r3, r3, #1
	cmp	r3, #64
	strb	r0, [ip, #1]!
	ldr	r0, [r1, #4]!
	strb	r0, [r2, #1]!
	bne	.L395
	ldrh	r2, [r7, #152]
	ldrh	r3, [r7, #154]
	mul	r3, r3, r2
	str	r3, [r5, #1472]
.L385:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L400:
	movw	r1, #2422
	ldr	r3, .L402+4
	str	r1, [sp]
	mov	r0, #0
	ldr	r2, .L402+8
	bl	dprint_normal
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L399:
	add	r0, r4, #20992
	sub	r1, fp, #84
	add	r0, r0, #220
	bl	MP4_GetGMCparam
	sub	r1, fp, #68
	ldrb	ip, [r5, #861]	@ zero_extendqisi2
	ldmia	r1, {r1, r2, r3}
	ldr	r0, [fp, #-84]
	str	ip, [r6, #3324]
	ldr	ip, [fp, #-56]
	str	r0, [r6, #3320]
	str	r1, [r6, #3328]
	ldr	r0, [fp, #-52]
	ldr	r1, [fp, #-48]
	str	r2, [r6, #3332]
	str	r3, [r6, #3336]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-40]
	str	ip, [r6, #3340]
	str	r0, [r6, #3344]
	str	r1, [r6, #3348]
	str	r2, [r6, #3352]
	str	r3, [r6, #3356]
	b	.L387
.L401:
	ldr	lr, [r5, #2444]
	mov	r0, r2
	ldr	ip, [r5, #2452]
	movw	r1, #2428
	ldr	r3, [r5, #2436]
	str	r2, [sp, #8]
	stmia	sp, {ip, lr}
	ldr	r2, .L402+12
	bl	dprint_normal
	b	.L385
.L403:
	.align	2
.L402:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+1296
	.word	.LC21
	.word	.LC22
	UNWIND(.fnend)
	.size	Mp4_Set_DecPar, .-Mp4_Set_DecPar
	.align	2
	.global	Mp4_Get_DecMode
	.type	Mp4_Get_DecMode, %function
Mp4_Get_DecMode:
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
	add	r0, r0, #20480
	ldr	r3, [r0, #1556]
	cmp	r3, #2
	ldr	r3, [r0, #1524]
	beq	.L416
.L406:
	ldr	r3, [r3, #8]
	cmp	r3, #2
	beq	.L409
	cmp	r3, #1
	beq	.L415
	cmp	r3, #4
	movne	r3, #0
.L415:
	str	r3, [r0, #1556]
	ldmfd	sp, {fp, sp, pc}
.L416:
	ldr	r2, [r3, #8]
	cmp	r2, #2
	movne	r2, #1
	strne	r2, [r0, #2064]
	bne	.L406
.L409:
	mov	r3, #2
	str	r3, [r0, #1556]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Mp4_Get_DecMode, .-Mp4_Get_DecMode
	.align	2
	.global	MPEG4DEC_Init
	.type	MPEG4DEC_Init, %function
MPEG4DEC_Init:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 776
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #780)
	sub	sp, sp, #780
	ldr	r2, .L428
	mov	r4, r0
	mov	r6, r1
	mov	r0, #3
	mov	r1, #2496
	bl	dprint_normal
	cmp	r6, #0
	cmpne	r4, #0
	beq	.L422
	ldr	r3, [r6, #596]
	ldr	r7, .L428+4
	cmp	r3, #1
	beq	.L425
.L420:
	add	r5, r4, #20480
	ldr	r3, [r7, #48]
	movw	r2, #22952
	mov	r1, #0
	ldr	r7, [r5, #2416]
	mov	r0, r4
	blx	r3
	add	r0, r4, #22528
	add	r0, r0, #24
	ldr	r8, .L428+4
	str	r7, [r5, #2416]
	bl	ResetVoQueue
	str	r6, [r5, #1524]
	mov	r0, r4
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r5, #2424]
	beq	.L426
	mov	r0, r4
	bl	Global_Data_Init
	subs	r7, r0, #0
	bne	.L422
	mov	r3, #1
	str	r7, [r5, #2040]
	ldr	r2, .L428+8
	movw	r1, #2535
	str	r3, [r5, #2012]
	mov	r0, #3
	bl	dprint_normal
	ldr	r6, [r6, #596]
	cmp	r6, #1
	beq	.L427
.L419:
	mov	r0, r7
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L427:
	add	r0, r4, #20992
	ldr	r3, [r8, #52]
	sub	r1, fp, #804
	mov	r2, #768
	add	r0, r0, #220
	blx	r3
	add	r0, r4, #19712
	ldr	r3, [r8, #52]
	sub	r1, fp, #724
	mov	r2, #24
	add	r0, r0, #208
	blx	r3
	add	r0, r4, #19712
	ldr	r3, [r8, #52]
	sub	r1, fp, #700
	mov	r2, #604
	add	r0, r0, #232
	blx	r3
	add	r0, r4, #21760
	ldr	r3, [r8, #52]
	mov	r2, #7
	sub	r1, fp, #812
	add	r0, r0, #220
	blx	r3
	mov	r0, r7
	strb	r6, [r5, #2461]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L425:
	add	r1, r4, #20992
	ldr	r3, [r7, #52]
	add	r1, r1, #220
	mov	r2, #768
	sub	r0, fp, #804
	blx	r3
	add	r1, r4, #19712
	ldr	r3, [r7, #52]
	add	r1, r1, #208
	mov	r2, #24
	sub	r0, fp, #724
	blx	r3
	add	r1, r4, #19712
	ldr	r3, [r7, #52]
	add	r1, r1, #232
	mov	r2, #604
	sub	r0, fp, #700
	blx	r3
	add	r1, r4, #21760
	ldr	r3, [r7, #52]
	add	r1, r1, #220
	mov	r2, #7
	sub	r0, fp, #812
	blx	r3
	b	.L420
.L422:
	mvn	r7, #0
	mov	r0, r7
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L426:
	ldr	r2, .L428+12
	movw	r1, #2523
	mov	r0, #0
	mvn	r7, #19
	bl	dprint_normal
	b	.L419
.L429:
	.align	2
.L428:
	.word	.LC23
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC25
	.word	.LC24
	UNWIND(.fnend)
	.size	MPEG4DEC_Init, .-MPEG4DEC_Init
	.align	2
	.global	MPEG4DEC_RecycleImage
	.type	MPEG4DEC_RecycleImage, %function
MPEG4DEC_RecycleImage:
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
	cmp	r0, #0
	mov	r5, r1
	beq	.L432
	add	r4, r0, #20480
	mov	r2, #0
	ldr	r0, [r4, #2424]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #2424]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L433
	ldr	r1, [r5, #168]
	mov	r6, #0
	ldr	r0, [r4, #2424]
	mov	r7, #0
	bl	FreeUsdByDec
	strd	r6, [r5, #168]
	ldr	r1, [r5, #176]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	strd	r6, [r5, #176]
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L433:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L432:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MPEG4DEC_RecycleImage, .-MPEG4DEC_RecycleImage
	.align	2
	.global	MP4_SetImgFormat
	.type	MP4_SetImgFormat, %function
MP4_SetImgFormat:
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
	add	r0, r0, #20480
	ldr	r1, [r0, #2452]
	ldr	r0, [r0, #2424]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FSP_GetFsImagePtr
	UNWIND(.fnend)
	.size	MP4_SetImgFormat, .-MP4_SetImgFormat
	.align	2
	.global	MPEG4DEC_FlushRemainImg
	.type	MPEG4DEC_FlushRemainImg, %function
MPEG4DEC_FlushRemainImg:
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
	add	r4, r0, #20480
	mov	r5, r0
	ldr	r3, [r4, #1524]
	ldr	r3, [r3, #12]
	cmp	r3, #1
	beq	.L435
	ldr	r1, [r4, #2444]
	ldr	r0, [r4, #2424]
	bl	FSP_GetFsImagePtr
	subs	r6, r0, #0
	beq	.L435
	ldr	r1, [r4, #2444]
	ldr	r0, [r4, #2424]
	bl	FSP_GetDisplay
	cmp	r0, #2
	mov	r7, r0
	beq	.L445
.L435:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L445:
	ldr	r1, [r4, #2452]
	ldr	r0, [r4, #2424]
	bl	FSP_GetFsImagePtr
	mov	r2, #1
	ldr	r1, [r6, #88]
	ldr	r0, [r4, #2424]
	bl	FSP_SetDisplay
	add	r3, r5, #22528
	ldr	r0, [r4, #2424]
	mov	r1, r7
	str	r6, [sp]
	add	r3, r3, #24
	mov	r2, r5
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L435
	ldr	r1, [r6, #88]
	mov	r0, r5
	bl	MPEG4DEC_RecycleImage
	ldr	r1, [r6, #168]
	ldr	r0, [r4, #2424]
	mov	r8, #0
	bl	FreeUsdByDec
	mov	r9, #0
	ldr	r1, [r6, #176]
	strd	r8, [r6, #168]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	strd	r8, [r6, #176]
	b	.L435
	UNWIND(.fnend)
	.size	MPEG4DEC_FlushRemainImg, .-MPEG4DEC_FlushRemainImg
	.align	2
	.global	MPEG4DEC_GetImageBuffer
	.type	MPEG4DEC_GetImageBuffer, %function
MPEG4DEC_GetImageBuffer:
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
	add	r4, r0, #20480
	mov	r5, r0
	ldr	r0, [r4, #2424]
	bl	FSP_IsNewFsAvailable
	cmp	r0, #1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	cmn	r0, #1
	beq	.L450
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L450:
	add	r1, r5, #22528
	ldr	r0, [r4, #2424]
	add	r1, r1, #24
	bl	FSP_ClearNotInVoQueue
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MPEG4DEC_GetImageBuffer, .-MPEG4DEC_GetImageBuffer
	.align	2
	.global	MP4_GetPacketState
	.type	MP4_GetPacketState, %function
MP4_GetPacketState:
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
	add	r0, r0, #16384
	ldr	r3, [r0, #3532]
	cmp	r3, #1
	mvnne	r0, #0
	moveq	r0, #3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MP4_GetPacketState, .-MP4_GetPacketState
	.align	2
	.global	MP4_ClearCurPacket
	.type	MP4_ClearCurPacket, %function
MP4_ClearCurPacket:
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
	ldr	r1, [r1, #20]
	mov	r5, r0
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #6]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L455
	ldrb	r3, [r4, #86]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L456
.L455:
	ldr	r3, .L457
	mov	r0, r4
	mov	r2, #160
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L456:
	mov	r0, r5
	ldr	r1, [r4, #100]
	bl	SM_ReleaseStreamSeg
	b	.L455
.L458:
	.align	2
.L457:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	MP4_ClearCurPacket, .-MP4_ClearCurPacket
	.align	2
	.global	MP4_ClearCurPic
	.type	MP4_ClearCurPic, %function
MP4_ClearCurPic:
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
	add	r8, r0, #16384
	add	r3, r0, #20480
	ldr	r6, [r8, #3524]
	ldr	r7, [r3, #2424]
	cmp	r6, #0
	addgt	r5, r0, #15808
	movgt	r4, #0
	ble	.L462
.L461:
	add	r4, r4, #1
	ldr	r1, [r5, #4]!
	mov	r0, r7
	bl	SM_ReleaseStreamSeg
	cmp	r6, r4
	bne	.L461
.L462:
	mov	r3, #0
	str	r3, [r8, #3524]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	MP4_ClearCurPic, .-MP4_ClearCurPic
	.align	2
	.global	MP4_PrepareNvopDecparam
	.type	MP4_PrepareNvopDecparam, %function
MP4_PrepareNvopDecparam:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	add	r5, r0, #20480
	mov	r4, r0
	ldrb	r6, [r5, #736]	@ zero_extendqisi2
	cmp	r6, #0
	movne	r0, #0
	bne	.L466
	ldr	r1, [r5, #1524]
	ldr	r3, [r1, #840]
	cmp	r3, #1
	moveq	r2, r6
	beq	.L475
	cmp	r3, #2
	beq	.L476
.L468:
	ldr	r1, [r5, #2452]
	ldr	r0, [r5, #2424]
	bl	FSP_GetLogicFs
	ldr	r1, [r5, #2436]
	mov	r6, r0
	ldr	r0, [r5, #2424]
	bl	FSP_GetLogicFs
	cmp	r6, #0
	cmpne	r0, #0
	beq	.L477
	ldr	r2, [r6, #28]
	cmp	r2, #0
	beq	.L478
	ldr	r3, [r2, #4]
	movw	ip, #1194
	add	r2, r4, #12288
	mov	r1, #1
	add	lr, r4, #1040
	str	r3, [r4, #1228]
	ldr	r3, [r0, #28]
	movw	r0, #1192
	cmp	r3, #0
	ldreq	r3, [r6, #28]
	ldr	r3, [r3, #4]
	str	r3, [r4, #1212]
	ldr	r3, [r5, #752]
	add	r3, r3, #15
	mov	r3, r3, lsr #4
	strh	r3, [r4, r0]	@ movhi
	ldr	r3, [r5, #748]
	mov	r0, #0
	add	r3, r3, #15
	mov	r3, r3, lsr #4
	strh	r3, [r4, ip]	@ movhi
	ldr	r3, [r6, #28]
	ldr	r3, [r3, #44]
	str	r3, [r2, #3288]
	ldr	r3, [r6, #28]
	ldr	r3, [r3, #48]
	str	r3, [r2, #3292]
	ldr	r3, [r6, #28]
	ldr	r3, [r3, #72]
	str	r3, [r2, #3296]
	ldr	r3, [r6, #28]
	ldr	r3, [r3, #64]
	str	r3, [r2, #3300]
	ldr	r3, [r6, #28]
	ldr	r3, [r3, #68]
	str	r3, [r2, #3304]
	ldrb	r3, [r6, #408]	@ zero_extendqisi2
	strb	r1, [r4, #1190]
	str	lr, [r4, #1036]
	strb	r3, [r4, #1191]
.L466:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L476:
	ldr	r3, [r1, #844]
	cmp	r3, #0
	ble	.L468
	mov	r2, r6
	sub	r3, r3, #1
	str	r3, [r1, #844]
.L475:
	ldr	r1, [r5, #2452]
	ldr	r0, [r5, #2424]
	bl	FSP_SetDisplay
	mov	r0, r4
	bl	MP4_ClearCurPic
	mov	r0, r6
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L477:
	movw	r3, #2579
	str	r0, [sp, #4]
	str	r6, [sp]
	mov	r1, r3
	ldr	r2, .L479
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L466
.L478:
	ldr	lr, [r5, #2444]
	mov	r0, r2
	ldr	ip, [r5, #2452]
	movw	r1, #2585
	ldr	r3, [r5, #2436]
	str	r2, [sp, #8]
	stmia	sp, {ip, lr}
	ldr	r2, .L479+4
	bl	dprint_normal
	mvn	r0, #0
	b	.L466
.L480:
	.align	2
.L479:
	.word	.LC26
	.word	.LC27
	UNWIND(.fnend)
	.size	MP4_PrepareNvopDecparam, .-MP4_PrepareNvopDecparam
	.align	2
	.global	MP4_GetScdUpMsg
	.type	MP4_GetScdUpMsg, %function
MP4_GetScdUpMsg:
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
	add	r3, r0, #20480
	add	r5, r0, #22784
	add	r5, r5, #164
	add	r0, r0, #15808
	ldr	r3, [r3, #1524]
	ldr	r2, [r3, #816]
	cmp	r2, #1
	beq	.L483
.L482:
	ldr	r6, .L484
	add	r4, r1, #72
	mov	r2, #4
	mov	r1, r4
	ldr	r3, [r6, #52]
	blx	r3
	ldr	r3, [r6, #52]
	mov	r1, r4
	mov	r0, r5
	mov	r2, #4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3
.L483:
	ldr	r3, [r3, #848]
	cmp	r3, #1
	bne	.L482
	ldr	r3, .L484
	mov	r1, r5
	mov	r2, #4
	ldr	r3, [r3, #52]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3
.L485:
	.align	2
.L484:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	MP4_GetScdUpMsg, .-MP4_GetScdUpMsg
	.align	2
	.global	Mp4_Check_Slice_NotSH
	.type	Mp4_Check_Slice_NotSH, %function
Mp4_Check_Slice_NotSH:
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
	add	r3, r0, #16384
	add	r2, r0, #20480
	ldrb	r1, [r3, #3579]	@ zero_extendqisi2
	ldrb	r3, [r2, #672]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L494
	add	r1, r0, #12288
	ldrb	r1, [r1, #3520]	@ zero_extendqisi2
	tst	r1, #120
	bne	.L494
	add	r0, r0, #15808
	ldrh	r0, [r0]
	ubfx	r0, r0, #7, #4
	add	r0, r0, #17
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L488
.L490:
	.word	.L495
	.word	.L491
	.word	.L492
	.word	.L491
.L494:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L495:
	mov	r3, #17
.L489:
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L492:
	ldrb	r3, [r2, #681]	@ zero_extendqisi2
	ldrb	r2, [r2, #680]	@ zero_extendqisi2
	cmp	r3, r2
	movcc	r3, r2
	cmp	r3, #1
	addgt	r3, r3, #16
	movle	r3, #18
	b	.L489
.L491:
	ldrb	r3, [r2, #680]	@ zero_extendqisi2
	add	r3, r3, #16
	b	.L489
.L488:
	ldr	r2, .L498
	movw	r1, #3268
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L499:
	.align	2
.L498:
	.word	.LC28
	UNWIND(.fnend)
	.size	Mp4_Check_Slice_NotSH, .-Mp4_Check_Slice_NotSH
	.align	2
	.global	Mp4_Combine_SliceData
	.type	Mp4_Combine_SliceData, %function
Mp4_Combine_SliceData:
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
	add	r3, r0, #16384
	add	r2, r0, #12288
	add	r0, r0, #1232
	ldr	ip, [r3, #3528]
	add	r0, r0, #4
	ldr	r3, [r2, #3284]
	tst	ip, #2
	beq	.L501
	ldrb	lr, [r2, #3366]	@ zero_extendqisi2
	cmp	lr, #1
	beq	.L517
	cmp	lr, #0
	bne	.L509
	ldrb	ip, [r2, #3446]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L509
	mov	ip, r3, asl #5
	sub	r3, ip, r3, asl #2
	sub	r3, r3, #28
	add	r3, r0, r3
	ldr	r0, [r3, #12]
	cmp	r0, #0
	bne	.L516
	ldr	r0, [r3, #20]
	cmp	r0, #0
	bne	.L516
	ldr	ip, [r3, #8]
	add	r1, ip, r1, lsl #3
	str	r1, [r3, #8]
	ldr	r1, [r2, #3452]
	str	r1, [r3, #20]
	ldr	r2, [r2, #3456]
	mov	r2, r2, asl #3
	str	r2, [r3, #12]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L517:
	sub	r4, r3, #1
	movw	ip, #510
	cmp	r4, ip
	bhi	.L518
	mov	ip, r3, asl #5
	sub	r3, ip, r3, asl #2
	sub	r3, r3, #28
	add	r3, r0, r3
	ldr	r0, [r3, #12]
	cmp	r0, #0
	beq	.L505
	ldr	ip, [r3, #20]
	cmp	ip, #0
	beq	.L505
	ldr	r2, [r2, #3372]
	cmp	ip, r2
	bhi	.L519
	add	r1, r0, r1, lsl #3
	mov	r0, #0
	str	r1, [r3, #12]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L505:
	ldr	ip, [r2, #3372]
	ldr	r0, [r3, #16]
	cmp	ip, r0
	movls	r1, r1, asl #3
	strls	r1, [r3, #12]
	ldrls	r2, [r2, #3372]
	movhi	r0, #0
	ldrhi	r2, [r3, #8]
	movls	r0, #0
	addhi	r1, r2, r1, lsl #3
	strls	r2, [r3, #20]
	strhi	r1, [r3, #8]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L509:
	movw	r3, #3337
.L515:
	ldr	r2, .L520
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
.L516:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L501:
	movw	r3, #3343
	b	.L515
.L518:
	mov	r0, lr
	ldr	r2, .L520+4
	mov	r1, #3296
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L519:
	movw	r3, #3316
	mov	r0, lr
	mov	r1, r3
	ldr	r2, .L520
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L521:
	.align	2
.L520:
	.word	.LC30
	.word	.LC29
	UNWIND(.fnend)
	.size	Mp4_Combine_SliceData, .-Mp4_Combine_SliceData
	.align	2
	.global	MP4_Check_StreamType
	.type	MP4_Check_StreamType, %function
MP4_Check_StreamType:
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
	add	r2, r0, #12288
	add	r0, r0, #20480
	ldrb	r3, [r2, #3520]	@ zero_extendqisi2
	tst	r3, #1
	bne	.L523
	mov	r3, #2
	strb	r3, [r0, #741]
	ldr	r3, [r1]
	mov	r3, r3, lsr #8
	sub	r3, r3, #128
	cmp	r3, #3
	ldrlsb	r3, [r2, #3520]	@ zero_extendqisi2
	orrls	r3, r3, #2
	strlsb	r3, [r2, #3520]
.L524:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L523:
	mov	r2, #196
	mov	r3, #1
	str	r2, [r1]
	strb	r3, [r0, #741]
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MP4_Check_StreamType, .-MP4_Check_StreamType
	.align	2
	.global	MP4_Clean_HeadPacket
	.type	MP4_Clean_HeadPacket, %function
MP4_Clean_HeadPacket:
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
	add	r3, r0, #20480
	mov	r8, r0
	ldr	r6, [r3, #1980]
	ldr	r7, [r3, #2424]
	cmp	r6, #64
	movge	r6, #64
	cmp	r6, #0
	addgt	r5, r0, #22016
	movgt	r4, #0
	addgt	r5, r5, #184
	ble	.L528
.L527:
	add	r4, r4, #1
	ldr	r1, [r5, #4]!
	mov	r0, r7
	bl	SM_ReleaseStreamSeg
	cmp	r4, r6
	bne	.L527
.L528:
	ldr	r3, .L530
	add	r0, r8, #22016
	add	r0, r0, #24
	mov	r2, #440
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L531:
	.align	2
.L530:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	MP4_Clean_HeadPacket, .-MP4_Clean_HeadPacket
	.align	2
	.global	MPEG4DEC_VDMPostProc
	.type	MPEG4DEC_VDMPostProc, %function
MPEG4DEC_VDMPostProc:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	ldr	r3, .L586
	mov	r5, r0
	movw	r2, #14608
	mov	r6, r1
	add	r0, r0, #1040
	ldr	r3, [r3, #48]
	mov	r1, #0
	blx	r3
	add	r4, r5, #20480
	mov	r0, r5
	bl	MP4_ClearCurPic
	mov	r0, r5
	bl	MP4_Clean_HeadPacket
	ldrb	r3, [r4, #1440]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L579
.L533:
	str	r6, [r4, #2008]
	ldr	r1, [r4, #2452]
	ldr	r0, [r4, #2424]
	bl	FSP_GetFsImagePtr
	ldr	r1, [r4, #2444]
	mov	r6, r0
	ldr	r0, [r4, #2424]
	bl	FSP_GetFsImagePtr
	cmp	r6, #0
	mov	r7, r0
	beq	.L580
	ldr	r3, [r4, #2008]
	add	r1, r5, #22272
	add	r1, r1, #252
	str	r3, [r6, #96]
	ldr	r0, [r4, #2424]
	bl	Mp4_ClearUsrData
	ldrb	r3, [r4, #1440]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L536
	ldr	r2, [r4, #1524]
	ldr	r3, [r4, #2008]
	ldr	r1, [r2]
	cmp	r3, r1
	bhi	.L581
.L536:
	mov	r3, #0
	ldr	r1, [r4, #2452]
	str	r3, [r4, #2064]
	ldr	r0, [r4, #2424]
	bl	FSP_GetFsImagePtr
	ldr	r3, [r4, #1524]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L582
	ldr	ip, [r4, #2452]
	ldrb	r6, [r4, #1440]	@ zero_extendqisi2
	ldr	r8, [r4, #780]
	str	ip, [r4, #2456]
.L542:
	cmn	ip, #1
	beq	.L544
	mov	r1, ip
	ldr	r0, [r4, #2424]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L583
	cmp	r8, #0
	cmpeq	r6, #4
	beq	.L584
	ldr	r3, [r7, #96]
	cmp	r3, #0
	beq	.L547
	ldr	r2, [r4, #1524]
	ldr	r2, [r2, #4]
	cmp	r3, r2
	bhi	.L548
.L547:
	ldr	r1, [r4, #2456]
	ldr	r0, [r4, #2424]
	bl	FSP_GetLogicFs
	subs	r10, r0, #0
	beq	.L585
	cmp	r6, #2
	beq	.L550
	ldr	r3, [r10, #20]
	cmp	r3, #2
	beq	.L550
	ldr	r3, [r4, #2456]
	movw	r1, #3138
	ldr	r2, .L586+4
	mov	r0, #9
	bl	dprint_normal
.L544:
	ldr	r3, [r4, #2016]
	mov	r0, #0
	add	r3, r3, #1
	str	r3, [r4, #2016]
.L577:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L582:
	ldrb	lr, [r4, #1440]	@ zero_extendqisi2
	cmp	lr, #2
	beq	.L540
	ldr	r3, [r4, #2432]
	cmp	r3, #1
	ble	.L541
	ldr	ip, [r4, #2436]
	ldr	r8, [r4, #2440]
	str	ip, [r4, #2456]
	ldrb	r6, [r5]	@ zero_extendqisi2
	b	.L542
.L548:
	ldr	r1, .L586+8
	ldr	r5, [r1]
	cmp	r5, #0
	beq	.L553
	str	r3, [fp, #-52]
	mov	r1, #23
	mov	r3, #8
	str	r2, [fp, #-48]
	ldr	r0, [r4, #2424]
	sub	r2, fp, #52
	blx	r5
	ldr	r2, [r4, #1524]
	ldr	r3, [r7, #96]
	ldr	r2, [r2, #4]
.L553:
	str	r2, [sp]
	movw	r1, #3144
	ldr	r2, .L586+12
	mov	r0, #1
	bl	dprint_normal
	ldr	r1, [r7, #168]
	ldr	r0, [r4, #2424]
	mov	r8, #0
	bl	FreeUsdByDec
	mov	r9, #0
	ldr	r1, [r7, #176]
	strd	r8, [r7, #168]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	strd	r8, [r7, #176]
	mov	r2, #0
	ldr	r1, [r4, #2456]
	ldr	r0, [r4, #2424]
	bl	FSP_SetDisplay
	b	.L544
.L550:
	mov	r2, #1
	ldr	r1, [r4, #2456]
	ldr	r0, [r4, #2424]
	bl	FSP_SetDisplay
	add	r3, r5, #22528
	ldr	r0, [r4, #2424]
	add	r3, r3, #24
	str	r7, [sp]
	mov	r2, r5
	mov	r1, #2
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L544
	ldr	r1, [r7, #168]
	mov	r8, #0
	ldr	r0, [r4, #2424]
	mov	r9, #0
.L578:
	bl	FreeUsdByDec
	strd	r8, [r7, #168]
	ldr	r1, [r7, #176]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	strd	r8, [r7, #176]
	mov	r2, #0
	ldr	r0, [r4, #2424]
	ldr	r1, [r4, #2456]
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L577
.L579:
	mov	r2, #0
	ldr	r1, [r4, #2452]
	ldr	r0, [r4, #2424]
	bl	FSP_SetRef
	b	.L533
.L540:
	ldr	ip, [r4, #2452]
	cmp	r7, #0
	ldr	r8, [r4, #780]
	str	ip, [r4, #2456]
	beq	.L555
	ldrd	r0, [r7, #208]
	ldrd	r2, [r6, #208]
	cmp	r0, r2
	sbcs	r9, r1, r3
	bge	.L555
	strd	r0, [r6, #208]
	mov	r6, lr
	strd	r2, [r7, #208]
	ldr	ip, [r4, #2456]
	b	.L542
.L541:
	mvn	r3, #0
	str	r3, [r4, #2456]
	b	.L544
.L555:
	mov	r6, lr
	b	.L542
.L581:
	ldr	r1, .L586+8
	ldr	r5, [r1]
	cmp	r5, #0
	beq	.L537
	str	r3, [fp, #-52]
	mov	r1, #23
	ldr	ip, [r2]
	mov	r3, #8
	sub	r2, fp, #52
	ldr	r0, [r4, #2424]
	str	ip, [fp, #-48]
	blx	r5
.L537:
	mov	r3, #1
	ldr	r1, [r4, #2444]
	str	r3, [r4, #2064]
	ldr	r0, [r4, #2424]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L538
	ldr	r1, [r5, #168]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	ldr	r1, [r5, #176]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	ldr	r1, [r5, #184]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	ldr	r1, [r5, #192]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r5, #168]
	strd	r2, [r5, #176]
	strd	r2, [r5, #184]
	strd	r2, [r5, #192]
	ldr	r1, [r4, #2444]
	ldr	r0, [r4, #2424]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #2436]
	ldr	r0, [r4, #2424]
	bl	FSP_ClearLogicFs
	ldr	r0, [r4, #2424]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #2444]
	str	r0, [r4, #2436]
.L538:
	mov	r3, #0
	mvn	r0, #0
	str	r3, [r4, #2432]
	b	.L577
.L584:
	ldr	r3, [r4, #2424]
	mov	r1, #100
	ldr	r2, .L586+16
	mov	r8, #0
	mov	r9, #0
	mov	r0, r3
	mla	r3, r1, r3, r2
	ldr	r2, [r3, #92]
	add	r2, r2, #1
	str	r2, [r3, #92]
	ldr	r1, [r7, #168]
	b	.L578
.L580:
	str	r0, [sp]
	mov	r3, r6
	mov	r0, r6
	ldr	r2, .L586+20
	movw	r1, #3029
	bl	dprint_normal
	mvn	r0, #0
	b	.L577
.L583:
	movw	r3, #3093
	ldr	r2, .L586+24
	mov	r1, r3
	bl	dprint_normal
	mvn	r0, #0
	b	.L577
.L585:
	ldr	r1, [r7, #168]
	mov	r8, #0
	ldr	r0, [r4, #2424]
	mov	r9, #0
	bl	FreeUsdByDec
	strd	r8, [r7, #168]
	ldr	r1, [r7, #176]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	strd	r8, [r7, #176]
	mov	r2, r10
	ldr	r0, [r4, #2424]
	ldr	r1, [r4, #2456]
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L577
.L587:
	.align	2
.L586:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC33
	.word	g_EventReportFunc
	.word	.LC34
	.word	g_VfmwChanStat
	.word	.LC31
	.word	.LC32
	UNWIND(.fnend)
	.size	MPEG4DEC_VDMPostProc, .-MPEG4DEC_VDMPostProc
	.align	2
	.global	MP4_Record_SlcSegID
	.type	MP4_Record_SlcSegID, %function
MP4_Record_SlcSegID:
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	add	r5, r0, #16384
	movw	r6, #1022
	mov	r4, r0
	ldr	r3, [r5, #3524]
	cmp	r3, r6
	bhi	.L591
	add	r1, r0, #12288
	add	r4, r0, r3, lsl #2
	add	r4, r4, #12288
	add	r2, r3, #1
	ldr	r0, [r1, #3380]
	str	r0, [r4, #3524]
	str	r2, [r5, #3524]
	ldrb	r2, [r1, #3366]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L588
	ldrb	r2, [r1, #3446]	@ zero_extendqisi2
	cmp	r2, #1
	addeq	r3, r3, #2
	ldreq	r2, [r1, #3460]
	streq	r2, [r4, #3528]
	streq	r3, [r5, #3524]
.L588:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L591:
	bl	MP4_Clean_HeadPacket
	mov	r0, r4
	bl	MP4_ClearCurPic
	add	r3, r4, #20480
	add	r1, r4, #15616
	ldr	r0, [r3, #2424]
	add	r1, r1, #32
	bl	MP4_ClearCurPacket
	ldr	r3, [r5, #3524]
	movw	r1, #3634
	str	r6, [sp]
	ldr	r2, .L592
	mov	r0, #0
	bl	dprint_normal
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L593:
	.align	2
.L592:
	.word	.LC35
	UNWIND(.fnend)
	.size	MP4_Record_SlcSegID, .-MP4_Record_SlcSegID
	.align	2
	.global	Mp4_Syntax_ShortHeader
	.type	Mp4_Syntax_ShortHeader, %function
Mp4_Syntax_ShortHeader:
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
	add	r7, r0, #12288
	mov	r6, r0
	mov	r5, r1
	ldr	r3, [r7, #3284]
	mov	r4, r2
	cmp	r3, #0
	bne	.L630
.L595:
	mov	r1, r5
	mov	r2, r4
	sub	r0, fp, #76
	add	r5, r6, #20480
	bl	BsInit
	ldr	r3, .L635
	add	r0, r6, #20992
	mov	r2, #60
	mov	r1, #0
	add	r0, r0, #160
	ldr	r3, [r3, #48]
	blx	r3
	mov	r1, #22
	sub	r0, fp, #76
	bl	BsSkip
	mov	r1, #13
	sub	r0, fp, #76
	bl	BsSkip
	sub	r0, fp, #76
	mov	r1, #3
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #682]
	sub	r0, r0, #1
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L596
.L598:
	.word	.L597
	.word	.L599
	.word	.L600
	.word	.L601
.L601:
	mov	r2, #18
	mov	r3, #88
	strb	r2, [r5, #683]
	mov	r2, #704
	strb	r3, [r5, #684]
	mov	r3, #576
	str	r2, [r5, #752]
	str	r3, [r5, #748]
.L602:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	ldrb	r3, [r5, #739]	@ zero_extendqisi2
	cmp	r3, #2
	uxtb	r0, r0
	strb	r0, [r5, #672]
	beq	.L604
	adds	r0, r0, #0
	ldr	r3, [r5, #2064]
	movne	r0, #1
	cmp	r3, #1
	movne	r0, #0
	cmp	r0, #0
	bne	.L604
	mov	r1, #4
	sub	r0, fp, #76
	bl	BsSkip
	mov	r1, #5
	sub	r0, fp, #76
	mov	r9, r4, asl #3
	bl	BsGet
	mov	r1, #1
	mov	r4, #0
	uxtb	r0, r0
	cmp	r0, #0
	strneb	r0, [r5, #679]
	sub	r0, fp, #76
	moveq	r3, #1
	streqb	r3, [r5, #679]
	bl	BsSkip
.L610:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	cmp	r0, #1
	beq	.L631
	add	r4, r4, #1
	cmp	r4, #15
	bls	.L611
.L629:
	mov	r6, #0
	sub	r0, fp, #76
	strb	r6, [r5, #1505]
	bl	BsPos
	ldr	r3, .L635+4
	ldr	r4, [r3]
	cmp	r4, r6
	mov	r8, r0
	beq	.L617
	ldr	r0, [r5, #2424]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #22
	blx	r4
	mov	r0, r8
.L628:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L600:
	mov	r2, #18
	mov	r3, #22
	strb	r2, [r5, #683]
	mov	r2, #352
	strb	r3, [r5, #684]
	mov	r3, #288
	str	r2, [r5, #752]
	str	r3, [r5, #748]
	b	.L602
.L599:
	mov	r2, #9
	mov	r3, #11
	strb	r2, [r5, #683]
	mov	r2, #176
	strb	r3, [r5, #684]
	mov	r3, #144
	str	r2, [r5, #752]
	str	r3, [r5, #748]
	b	.L602
.L597:
	mov	r2, #6
	mov	r3, #8
	strb	r2, [r5, #683]
	mov	r2, #128
	strb	r3, [r5, #684]
	mov	r3, #96
	str	r2, [r5, #752]
	str	r3, [r5, #748]
	b	.L602
.L631:
	sub	r0, fp, #76
	add	r4, r4, #1
	bl	BsPos
	mov	r1, #8
	cmp	r0, r9
	sub	r0, fp, #76
	bgt	.L632
	bl	BsSkip
	cmp	r4, #15
	bls	.L610
	b	.L629
.L630:
	ldr	r2, .L635+8
	mov	r1, #740
	mov	r0, #1
	bl	dprint_normal
	mov	r3, #0
	str	r3, [r7, #3284]
	b	.L595
.L611:
	add	r10, r6, #16384
	mov	r2, #1
	strb	r2, [r5, #1505]
	sub	r0, fp, #76
	ldr	r3, [r10, #3528]
	orr	r3, r3, #2
	str	r3, [r10, #3528]
	ldr	r3, [r7, #3284]
	add	r3, r3, r2
	str	r3, [r7, #3284]
	strb	r2, [r5, #680]
	bl	BsPos
	mov	r3, r0, asr #31
	cmp	r0, #0
	add	r1, r0, #7
	rsb	r4, r0, r9
	mov	r3, r3, lsr #29
	str	r4, [r6, #1244]
	add	r2, r0, r3
	movge	r1, r0
	mov	r8, r0
	and	r2, r2, #7
	ldr	r0, [r5, #1520]
	rsb	r3, r3, r2
	add	r3, r3, r0
	strb	r3, [r6, #1242]
	ldr	r3, [r5, #1512]
	add	r3, r3, r1, asr #3
	str	r3, [r6, #1252]
	ldrb	r3, [r7, #3366]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L633
.L612:
	mov	r3, #0
	str	r3, [r6, #1248]
	strb	r3, [r6, #1243]
	str	r3, [r6, #1256]
.L613:
	ldrb	r3, [r5, #672]	@ zero_extendqisi2
	strb	r3, [r6, #1240]
	ldrb	r3, [r5, #681]	@ zero_extendqisi2
	strb	r3, [r6, #1238]
	ldrb	r3, [r5, #680]	@ zero_extendqisi2
	strb	r3, [r6, #1237]
	ldrb	r3, [r5, #679]	@ zero_extendqisi2
	strb	r3, [r6, #1241]
	ldrb	r3, [r5, #676]	@ zero_extendqisi2
	strb	r3, [r6, #1239]
	ldr	r3, [r10, #3524]
	cmp	r3, #0
	bne	.L634
.L614:
	mov	r0, r6
	bl	MP4_Record_SlcSegID
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L604:
	sub	r0, fp, #76
	bl	BsPos
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L596:
	mov	r6, #0
	sub	r0, fp, #76
	strb	r6, [r5, #1505]
	bl	BsPos
	ldr	r3, .L635+4
	ldr	r4, [r3]
	cmp	r4, r6
	mov	r8, r0
	beq	.L617
	ldr	r0, [r5, #2424]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #21
	blx	r4
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L633:
	ldrb	r2, [r7, #3446]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L612
	ldr	r2, [r7, #3456]
	strb	r3, [r6, #1243]
	mov	r3, r2, asl #3
	str	r3, [r6, #1248]
	ldr	r3, [r7, #3452]
	str	r3, [r6, #1256]
	b	.L613
.L634:
	ldr	r2, .L635+12
	movw	r1, #877
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r6
	bl	MP4_ClearCurPic
	b	.L614
.L617:
	mov	r0, r8
	b	.L628
.L632:
	bl	BsPos
	b	.L628
.L636:
	.align	2
.L635:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_EventReportFunc
	.word	.LC36
	.word	.LC37
	UNWIND(.fnend)
	.size	Mp4_Syntax_ShortHeader, .-Mp4_Syntax_ShortHeader
	.align	2
	.global	Mp4_Syntax_Vop
	.type	Mp4_Syntax_Vop, %function
Mp4_Syntax_Vop:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
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
	add	r7, r0, #12288
	mov	r5, r0
	mov	r10, r1
	ldr	r3, [r7, #3284]
	mov	r6, r2
	cmp	r3, #0
	bne	.L715
	add	r4, r5, #20480
	ldrb	r3, [r4, #733]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L639
.L716:
	mov	r0, #32
	strb	r3, [r4, #1505]
.L640:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L715:
	add	r4, r5, #20480
	ldr	r2, .L730
	movw	r1, #1165
	mov	r0, #1
	bl	dprint_normal
	mov	r3, #0
	str	r3, [r7, #3284]
	ldrb	r3, [r4, #733]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L716
.L639:
	add	r8, r5, #20992
	ldr	r9, .L730+4
	add	r8, r8, #160
	mov	r1, r10
	sub	r0, fp, #76
	mov	r2, r6
	bl	BsInit
	mov	r2, #60
	ldr	r3, [r9, #48]
	mov	r1, #0
	mov	r0, r8
	blx	r3
	mov	r3, #0
	mov	r1, #32
	strb	r3, [r4, #1505]
	sub	r0, fp, #76
	bl	BsSkip
	mov	r1, #2
	sub	r0, fp, #76
	bl	BsGet
	ldr	r2, .L730+8
	movw	r1, #1186
	uxtb	r3, r0
	strb	r0, [r4, #672]
	mov	r0, #16
	bl	dprint_normal
	ldrb	r3, [r4, #739]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L713
	cmp	r3, #2
	beq	.L643
	ldr	r3, [r4, #2064]
	cmp	r3, #1
	beq	.L713
.L642:
	mov	r6, r6, asl #3
	mov	r10, #0
	b	.L646
.L718:
	bl	BsPos
	add	r10, r10, #1
	cmp	r0, r6
	bgt	.L717
	cmp	r10, #6400
	beq	.L647
.L646:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	cmp	r0, #0
	sub	r0, fp, #76
	bne	.L718
	cmp	r10, #6400
	bcs	.L647
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	subs	r3, r0, #0
	beq	.L719
	ldr	r1, [r4, #904]
	cmp	r1, #0
	moveq	r0, r1
	bne	.L720
.L650:
	str	r10, [r4, #756]
	mov	r1, #1
	str	r0, [r4, #760]
	sub	r0, fp, #76
	bl	BsGet
	subs	r10, r0, #0
	bne	.L651
	ldr	r2, .L730+12
	movw	r1, #1250
	mov	r0, #1
	bl	dprint_normal
	strb	r10, [r4, #1505]
	sub	r0, fp, #76
	bl	BsPos
	ldr	r3, .L730+16
	ldr	r6, [r3]
	cmp	r6, #0
	mov	r5, r0
	beq	.L677
	ldr	r0, [r4, #2424]
	mov	r3, r10
	mov	r2, r10
	mov	r1, #22
	blx	r6
	mov	r0, r5
	b	.L640
.L713:
	ldrb	r3, [r4, #672]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L642
.L643:
	sub	r0, fp, #76
	bl	BsPos
	b	.L640
.L717:
	sub	r0, fp, #76
	bl	BsPos
	ldr	r2, .L730+20
	movw	r1, #1226
	mov	r4, r0
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	b	.L640
.L647:
	mov	r3, #0
	sub	r0, fp, #76
	strb	r3, [r4, #1505]
	bl	BsPos
	mov	r3, r10
	ldr	r2, .L730+24
	movw	r1, #1237
	mov	r4, r0
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	b	.L640
.L651:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #673]
	cmp	r0, #0
	beq	.L721
	ldrb	r3, [r4, #672]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L653
	cmp	r3, #3
	beq	.L722
.L654:
	mov	r3, #0
	strb	r3, [r4, #674]
.L655:
	ldrb	r3, [r4, #844]	@ zero_extendqisi2
	mov	r2, #0
	strb	r2, [r4, #675]
	cmp	r3, #2
	addeq	r10, r5, #16384
	beq	.L656
	mov	r1, #3
	sub	r0, fp, #76
	bl	BsGet
	add	r10, r5, #16384
	strb	r0, [r4, #676]
	ldrb	r3, [r10, #3570]	@ zero_extendqisi2
	cmp	r3, #0
	streqb	r3, [r4, #678]
	moveq	r3, #2
	streqb	r3, [r4, #677]
	bne	.L723
.L658:
	ldrb	r3, [r4, #848]	@ zero_extendqisi2
	sub	r3, r3, #1
	cmp	r3, #1
	bls	.L659
.L662:
	mov	r1, #5
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r0, r0
	cmp	r0, #0
	moveq	r3, #1
	streqb	r3, [r4, #679]
	strneb	r0, [r4, #679]
.L668:
	ldrb	r3, [r4, #672]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L724
.L656:
	mov	r3, #1
	strb	r3, [r4, #1505]
	ldr	r3, [r10, #3528]
	add	r0, r5, #21760
	mov	r1, r8
	mov	r2, #60
	orr	r3, r3, #2
	str	r3, [r10, #3528]
	ldr	r3, [r7, #3284]
	add	r0, r0, #160
	ldr	r9, [r9, #52]
	add	r3, r3, #1
	str	r3, [r7, #3284]
	blx	r9
	sub	r0, fp, #76
	bl	BsPos
	mov	r3, r0, asr #31
	mov	r8, r0
	add	r1, r0, #7
	rsb	r6, r0, r6
	mov	r3, r3, lsr #29
	str	r6, [r5, #1244]
	add	r2, r8, r3
	ldr	r0, [r4, #1520]
	and	r2, r2, #7
	cmp	r8, #0
	rsb	r3, r3, r2
	add	r3, r3, r0
	strb	r3, [r5, #1242]
	ldr	r3, [r4, #1512]
	movge	r1, r8
	add	r3, r3, r1, asr #3
	str	r3, [r5, #1252]
	ldrb	r3, [r7, #3366]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L672
	ldrb	r2, [r7, #3446]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L725
.L672:
	mov	r3, #0
	str	r3, [r5, #1248]
	strb	r3, [r5, #1243]
	str	r3, [r5, #1256]
.L673:
	ldrb	r3, [r4, #672]	@ zero_extendqisi2
	strb	r3, [r5, #1240]
	ldrb	r3, [r4, #681]	@ zero_extendqisi2
	strb	r3, [r5, #1238]
	ldrb	r3, [r4, #680]	@ zero_extendqisi2
	strb	r3, [r5, #1237]
	ldrb	r3, [r4, #679]	@ zero_extendqisi2
	strb	r3, [r5, #1241]
	ldrb	r3, [r4, #676]	@ zero_extendqisi2
	strb	r3, [r5, #1239]
	ldr	r3, [r10, #3524]
	cmp	r3, #0
	bne	.L726
.L674:
	mov	r0, r5
	bl	MP4_Record_SlcSegID
	mov	r0, r8
	b	.L640
.L719:
	ldr	r2, .L730+12
	movw	r1, #1241
	mov	r0, #1
	str	r3, [fp, #-80]
	bl	dprint_normal
	ldr	r3, [fp, #-80]
	sub	r0, fp, #76
	strb	r3, [r4, #1505]
	bl	BsPos
	ldr	r2, .L730+16
	ldr	r6, [r2]
	cmp	r6, #0
	mov	r5, r0
	beq	.L677
	ldr	r3, [fp, #-80]
	mov	r1, #22
	ldr	r0, [r4, #2424]
	mov	r2, r3
	blx	r6
	mov	r0, r5
	b	.L640
.L720:
	sub	r0, fp, #76
	bl	BsGet
	b	.L650
.L677:
	mov	r0, r5
	b	.L640
.L726:
	ldr	r2, .L730+28
	movw	r1, #1407
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	bl	MP4_ClearCurPic
	b	.L674
.L721:
	add	r5, r5, #16384
	mov	r3, #4
	mov	r2, #1
	strb	r3, [r4, #672]
	strb	r3, [r4, #1440]
	sub	r0, fp, #76
	strb	r2, [r4, #1505]
	ldr	r3, [r5, #3528]
	orr	r3, r3, #128
	str	r3, [r5, #3528]
	bl	BsPos
	b	.L640
.L722:
	ldrb	r3, [r4, #848]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L654
.L653:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	strb	r0, [r4, #674]
	b	.L655
.L724:
	mov	r1, #3
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r2, r0
	strb	r2, [r4, #680]
	cmp	r2, #0
	beq	.L727
	ldrb	r3, [r4, #672]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L656
	mov	r1, #3
	sub	r0, fp, #76
	bl	BsGet
	uxtb	r2, r0
	strb	r2, [r4, #681]
	cmp	r2, #0
	bne	.L656
	strb	r2, [r4, #1505]
	sub	r0, fp, #76
	str	r2, [fp, #-80]
	bl	BsPos
	ldr	r3, .L730+16
	ldr	r6, [r3]
	cmp	r6, #0
	mov	r5, r0
	beq	.L671
	ldr	r2, [fp, #-80]
	mov	r1, #22
	ldr	r0, [r4, #2424]
	mov	r3, r2
	blx	r6
.L671:
	ldr	r2, .L730+32
	movw	r1, #1366
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	b	.L640
.L723:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #677]
	sub	r0, fp, #76
	bl	BsGet
	strb	r0, [r4, #678]
	b	.L658
.L659:
	ldrb	r3, [r4, #672]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L662
	ldrb	r3, [r4, #860]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L662
	add	r3, r5, #20992
	mov	r2, #0
	add	r3, r3, #196
	str	r8, [fp, #-80]
	str	r5, [fp, #-84]
	mov	r8, r2
	mov	r5, r3
	str	r10, [fp, #-88]
	str	r6, [fp, #-92]
	b	.L667
.L663:
	ldr	r3, [r4, #792]
	cmp	r3, #500
	bne	.L664
	ldr	r2, [r4, #796]
	movw	r3, #413
	cmp	r2, r3
	beq	.L665
.L664:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsSkip
.L665:
	sub	r0, fp, #76
	bl	bs_get_spritetrajectory
	subs	r3, r0, #0
	moveq	r6, r3
	bne	.L728
.L666:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsSkip
	str	r10, [r5]
	str	r6, [r5, #4]
	add	r8, r8, #1
	ldrb	r3, [r4, #860]	@ zero_extendqisi2
	add	r5, r5, #8
	cmp	r3, r8
	bls	.L729
.L667:
	sub	r0, fp, #76
	bl	bs_get_spritetrajectory
	subs	r6, r0, #0
	moveq	r10, r6
	beq	.L663
	mov	r1, r6
	sub	r0, fp, #76
	bl	BsGet
	sub	r2, r6, #1
	movs	r3, r0, asr r2
	mov	r10, r0
	moveq	r3, #1
	moveq	r3, r3, asl r6
	subeq	r3, r3, #1
	eoreq	r10, r10, r3
	rsbeq	r10, r10, #0
	b	.L663
.L728:
	mov	r1, r3
	sub	r0, fp, #76
	str	r3, [fp, #-96]
	bl	BsGet
	ldr	r3, [fp, #-96]
	sub	r1, r3, #1
	movs	r2, r0, asr r1
	mov	r6, r0
	moveq	r2, #1
	moveq	r3, r2, asl r3
	subeq	r3, r3, #1
	eoreq	r3, r3, r0
	rsbeq	r6, r3, #0
	b	.L666
.L725:
	ldr	r2, [r7, #3456]
	strb	r3, [r5, #1243]
	mov	r3, r2, asl #3
	str	r3, [r5, #1248]
	ldr	r3, [r7, #3452]
	str	r3, [r5, #1256]
	b	.L673
.L727:
	strb	r2, [r4, #1505]
	sub	r0, fp, #76
	str	r2, [fp, #-80]
	bl	BsPos
	ldr	r3, .L730+16
	ldr	r6, [r3]
	cmp	r6, #0
	mov	r5, r0
	beq	.L670
	ldr	r2, [fp, #-80]
	mov	r1, #22
	ldr	r0, [r4, #2424]
	mov	r3, r2
	blx	r6
.L670:
	ldrb	r3, [r4, #672]	@ zero_extendqisi2
	movw	r1, #1352
	ldr	r2, .L730+36
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	b	.L640
.L729:
	ldr	r8, [fp, #-80]
	ldr	r5, [fp, #-84]
	ldr	r10, [fp, #-88]
	ldr	r6, [fp, #-92]
	b	.L662
.L731:
	.align	2
.L730:
	.word	.LC36
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC38
	.word	.LC8
	.word	g_EventReportFunc
	.word	.LC39
	.word	.LC40
	.word	.LC37
	.word	.LC42
	.word	.LC41
	UNWIND(.fnend)
	.size	Mp4_Syntax_Vop, .-Mp4_Syntax_Vop
	.align	2
	.global	Mp4_Syntax_Slice_NotSH
	.type	Mp4_Syntax_Slice_NotSH, %function
Mp4_Syntax_Slice_NotSH:
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
	UNWIND(.pad #52)
	sub	sp, sp, #52
	add	r7, r0, #12288
	mov	r4, r0
	movw	r3, #510
	ldr	r8, [r7, #3284]
	mov	r5, r2
	sub	r0, r8, #1
	cmp	r0, r3
	bhi	.L753
	add	r3, r4, #15808
	add	r0, r8, #1
	str	r0, [r7, #3284]
	add	r6, r4, #20480
	ldrh	r9, [r3]
	sub	r0, fp, #76
	bl	BsInit
	sub	r0, fp, #76
	ubfx	r9, r9, #7, #4
	add	r9, r9, #17
	mov	r1, r9
	bl	BsSkip
	ldr	r3, [r6, #748]
	ldr	r9, [r6, #752]
	add	r3, r3, #15
	add	r9, r9, #15
	mov	r3, r3, lsr #4
	mov	r9, r9, lsr #4
	mul	r9, r9, r3
	cmp	r9, #0
	beq	.L735
	mov	r3, r9
	mov	r1, #0
.L736:
	add	r1, r1, #1
	movs	r3, r3, lsr #1
	uxth	r1, r1
	bne	.L736
	sxth	r1, r1
	sub	r0, fp, #76
	bl	BsGet
	mov	r10, r8, asl #2
	mov	r8, r8, asl #5
	sub	r1, r9, #1
	rsb	r2, r10, r8
	add	r2, r4, r2
	cmp	r0, r1
	str	r0, [r2, #1260]
	bhi	.L754
.L737:
	mov	r1, #5
	sub	r0, fp, #76
	bl	BsGet
	rsb	r9, r10, r8
	add	r9, r4, r9
	mov	r1, #1
	strb	r0, [r9, #1241]
	sub	r0, fp, #76
	bl	BsGet
	cmp	r0, #0
	bne	.L755
	ldrb	r3, [r6, #672]	@ zero_extendqisi2
	mov	r5, r5, asl #3
	add	r2, r4, #16384
	strb	r3, [r9, #1240]
	ldrb	r3, [r6, #676]	@ zero_extendqisi2
	strb	r3, [r9, #1239]
.L741:
	ldrb	r1, [r6, #680]	@ zero_extendqisi2
	rsb	r3, r10, r8
	add	r3, r4, r3
	sub	r0, fp, #76
	str	r3, [fp, #-80]
	strb	r1, [r3, #1237]
	ldrb	r1, [r6, #681]	@ zero_extendqisi2
	strb	r1, [r3, #1238]
	ldr	r1, [r2, #3528]
	orr	r1, r1, #16
	str	r1, [r2, #3528]
	bl	BsPos
	ldr	r3, [fp, #-80]
	mov	r2, r0, asr #31
	mov	r9, r0
	rsb	r5, r0, r5
	str	r5, [r3, #1244]
	mov	r2, r2, lsr #29
	ldr	ip, [r6, #1520]
	add	r1, r9, r2
	cmp	r9, #0
	and	r1, r1, #7
	add	r0, r0, #7
	rsb	r2, r2, r1
	movge	r0, r9
	add	r2, r2, ip
	strb	r2, [r3, #1242]
	ldr	r2, [r6, #1512]
	add	r2, r2, r0, asr #3
	str	r2, [r3, #1252]
	ldrb	r2, [r7, #3366]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L742
	ldrb	r1, [r7, #3446]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L756
.L742:
	rsb	r8, r10, r8
	mov	r3, #0
	add	r8, r4, r8
	add	r1, r8, #1232
	str	r3, [r8, #1248]
	mov	r2, r1
	strb	r3, [r2, #11]
	str	r3, [r8, #1256]
.L743:
	mov	r0, r4
	bl	MP4_Record_SlcSegID
	mov	r0, r9
.L752:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L755:
	mov	r5, r5, asl #3
.L739:
	mov	r1, #1
	sub	r0, fp, #76
	bl	BsGet
	mov	r9, r0
	sub	r0, fp, #76
	bl	BsPos
	cmp	r9, #0
	cmpne	r0, r5
	blt	.L739
	mov	r1, #1
	sub	r0, fp, #76
	add	r2, r4, #16384
	str	r2, [fp, #-80]
	bl	BsSkip
	ldr	r2, [fp, #-80]
	ldr	r1, [r2, #3628]
	cmp	r1, #0
	bne	.L757
.L740:
	mov	r1, #1
	sub	r0, fp, #76
	str	r2, [fp, #-80]
	bl	BsSkip
	mov	r1, #2
	sub	r0, fp, #76
	bl	BsGet
	rsb	r9, r10, r8
	add	r9, r4, r9
	mov	r1, #3
	strb	r0, [r9, #1240]
	sub	r0, fp, #76
	bl	BsGet
	ldrb	r3, [r9, #1240]	@ zero_extendqisi2
	ldr	r2, [fp, #-80]
	cmp	r3, #0
	strb	r0, [r9, #1239]
	beq	.L741
	mov	r1, #3
	sub	r0, fp, #76
	bl	BsSkip
	ldrb	r3, [r9, #1240]	@ zero_extendqisi2
	ldr	r2, [fp, #-80]
	cmp	r3, #2
	bne	.L741
	mov	r1, #3
	sub	r0, fp, #76
	bl	BsSkip
	ldr	r2, [fp, #-80]
	b	.L741
.L753:
	add	r3, r4, #20480
	add	r1, r4, #15616
	add	r1, r1, #32
	ldr	r0, [r3, #2424]
	bl	MP4_ClearCurPacket
	mov	r0, r4
	add	r4, r4, #16384
	bl	MP4_ClearCurPic
	ldr	r3, .L758
	movw	r1, #3367
	ldr	ip, [r4, #3528]
	mov	r0, #1
	ldr	r2, .L758+4
	bic	ip, ip, #432
	bic	ip, ip, #2
	str	ip, [r4, #3528]
	ldr	ip, [r7, #3284]
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L757:
	sub	r0, fp, #76
	bl	BsSkip
	ldr	r2, [fp, #-80]
	b	.L740
.L756:
	ldr	r1, [r7, #3456]
	strb	r2, [r3, #1243]
	mov	r2, r1, asl #3
	str	r2, [r3, #1248]
	ldr	r2, [r7, #3452]
	str	r2, [r3, #1256]
	b	.L743
.L735:
	mov	r1, r9
	sub	r0, fp, #76
	bl	BsGet
	mov	r10, r8, asl #2
	mov	r8, r8, asl #5
	rsb	r3, r10, r8
	add	r3, r4, r3
	str	r0, [r3, #1260]
	b	.L737
.L754:
	mov	r3, r0
	str	r9, [sp]
	ldr	r2, .L758+8
	movw	r1, #3389
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L752
.L759:
	.align	2
.L758:
	.word	.LANCHOR1+1312
	.word	.LC43
	.word	.LC44
	UNWIND(.fnend)
	.size	Mp4_Syntax_Slice_NotSH, .-Mp4_Syntax_Slice_NotSH
	.align	2
	.global	Mp4_Syntax_Slice_SH
	.type	Mp4_Syntax_Slice_SH, %function
Mp4_Syntax_Slice_SH:
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
	UNWIND(.pad #52)
	sub	sp, sp, #52
	add	r6, r0, #12288
	movw	r3, #510
	mov	r5, r0
	ldr	r4, [r6, #3284]
	mov	r9, r2
	sub	r8, r4, #1
	cmp	r8, r3
	bhi	.L774
	ldrb	r7, [r6, #3520]	@ zero_extendqisi2
	add	r3, r4, #1
	sub	r0, fp, #76
	str	r3, [r6, #3284]
	ubfx	r7, r7, #3, #4
	bl	BsInit
	add	r7, r7, #17
	sub	r0, fp, #76
	add	r10, r5, #20480
	mov	r1, r7
	bl	BsSkip
	mov	r3, r4, asl #2
	mov	r1, #5
	sub	r0, fp, #76
	mov	r7, r3
	str	r3, [fp, #-80]
	bl	BsGet
	ldrb	lr, [r10, #684]	@ zero_extendqisi2
	mov	r3, r4, asl #5
	movw	ip, #1194
	movw	r1, #1192
	str	r3, [fp, #-84]
	mov	r2, r3
	rsb	r2, r7, r2
	add	r4, r5, r2
	mul	r0, lr, r0
	str	r0, [r4, #1260]
	ldrh	ip, [r5, ip]
	ldrh	r1, [r5, r1]
	mul	r1, r1, ip
	sub	r1, r1, #1
	cmp	r0, r1
	bhi	.L775
	mov	r1, #2
	sub	r0, fp, #76
	bl	BsSkip
	mov	r1, #5
	sub	r0, fp, #76
	bl	BsGet
	strb	r0, [r4, #1241]
	sub	r0, fp, #76
	ldrb	r1, [r10, #672]	@ zero_extendqisi2
	strb	r1, [r4, #1240]
	ldrb	r1, [r10, #676]	@ zero_extendqisi2
	strb	r1, [r4, #1239]
	ldrb	r1, [r10, #680]	@ zero_extendqisi2
	strb	r1, [r4, #1237]
	ldrb	r1, [r10, #681]	@ zero_extendqisi2
	strb	r1, [r4, #1238]
	bl	BsPos
	mov	r1, r0, asr #31
	cmp	r0, #0
	add	ip, r0, #7
	rsb	r9, r0, r9, lsl #3
	mov	r1, r1, lsr #29
	movge	ip, r0
	mov	r7, r0
	add	r0, r0, r1
	str	r9, [r4, #1244]
	and	r0, r0, #7
	ldr	lr, [r10, #1520]
	rsb	r1, r1, r0
	add	r0, r5, #16384
	add	r1, r1, lr
	strb	r1, [r4, #1242]
	ldr	r3, [r10, #1512]
	add	ip, r3, ip, asr #3
	str	ip, [r4, #1252]
	ldr	r3, [r0, #3528]
	orr	r3, r3, #16
	str	r3, [r0, #3528]
	ldrb	r3, [r6, #3366]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L776
.L764:
	ldr	r3, [fp, #-84]
	ldr	r2, [fp, #-80]
	rsb	r2, r2, r3
	mov	r3, #0
	add	r2, r5, r2
	add	r0, r2, #1232
	str	r3, [r2, #1248]
	mov	r1, r0
	strb	r3, [r1, #11]
	str	r3, [r2, #1256]
.L765:
	mov	r1, r8, asl #2
	mov	r3, r8, asl #5
	rsb	r2, r1, r3
	add	r2, r5, r2
	ldr	r0, [r2, #1256]
	cmp	r0, #0
	bne	.L777
.L766:
	rsb	r3, r1, r3
	ldrb	r2, [r6, #3520]	@ zero_extendqisi2
	add	r3, r5, r3
	ubfx	r2, r2, #3, #4
	ldr	r1, [r3, #1244]
	add	r2, r2, r1
	str	r2, [r3, #1244]
.L767:
	mov	r0, r5
	bl	MP4_Record_SlcSegID
	mov	r0, r7
.L762:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L777:
	ldr	r0, [r2, #1248]
	add	r2, r2, #1232
	add	r2, r2, #12
	cmp	r0, #0
	beq	.L766
	ldrb	r3, [r6, #3520]	@ zero_extendqisi2
	ubfx	r3, r3, #3, #4
	add	r3, r3, r0
	str	r3, [r2, #4]
	b	.L767
.L776:
	ldrb	r1, [r6, #3446]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L764
	ldr	r1, [r6, #3456]
	strb	r3, [r4, #1243]
	mov	r3, r1, asl #3
	str	r3, [r4, #1248]
	ldr	r3, [r6, #3452]
	str	r3, [r4, #1256]
	b	.L765
.L774:
	add	r3, r0, #20480
	add	r1, r0, #15616
	add	r1, r1, #32
	ldr	r0, [r3, #2424]
	bl	MP4_ClearCurPacket
	mov	r0, r5
	add	r5, r5, #16384
	bl	MP4_ClearCurPic
	ldr	r3, .L778
	movw	r1, #3481
	ldr	ip, [r5, #3528]
	mov	r0, #1
	ldr	r2, .L778+4
	bic	ip, ip, #432
	bic	ip, ip, #2
	str	ip, [r5, #3528]
	ldr	ip, [r6, #3284]
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L775:
	str	r1, [sp]
	mov	r3, r0
	ldr	r2, .L778+8
	movw	r1, #3503
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	b	.L762
.L779:
	.align	2
.L778:
	.word	.LANCHOR1+1336
	.word	.LC43
	.word	.LC45
	UNWIND(.fnend)
	.size	Mp4_Syntax_Slice_SH, .-Mp4_Syntax_Slice_SH
	.align	2
	.global	MP4_Dec_Slice
	.type	MP4_Dec_Slice, %function
MP4_Dec_Slice:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	add	ip, r0, #12288
	mov	r4, r0
	ldrb	r3, [ip, #3520]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L788
	tst	r3, #4
	beq	.L789
	mov	r0, r4
	bl	Mp4_Syntax_Slice_SH
	cmn	r0, #1
	beq	.L790
.L784:
	mov	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L789:
	add	r0, r0, #15808
	ldrh	r0, [r0]
	ubfx	r0, r0, #7, #4
	sub	lr, r0, #1
	cmp	lr, #6
	bfils	r3, r0, #3, #4
	mov	r0, r4
	strlsb	r3, [ip, #3520]
	bl	Mp4_Syntax_Slice_SH
	cmn	r0, #1
	bne	.L784
.L790:
	add	r3, r4, #20480
	add	r1, r4, #15616
	add	r1, r1, #32
	ldr	r0, [r3, #2424]
	bl	MP4_ClearCurPacket
	ldr	r3, .L792
	ldr	r2, .L792+4
	movw	r1, #3618
	mov	r0, #1
	bl	dprint_normal
	mov	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L788:
	str	r2, [fp, #-28]
	str	r1, [fp, #-24]
	bl	Mp4_Check_Slice_NotSH
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-28]
	cmp	r0, #0
	beq	.L791
	mov	r1, r2
	mov	r0, r4
	bl	Mp4_Combine_SliceData
	cmp	r0, #0
	beq	.L785
	add	r3, r4, #20480
	add	r1, r4, #15616
	add	r1, r1, #32
	ldr	r0, [r3, #2424]
	bl	MP4_ClearCurPacket
	ldr	r3, .L792
	ldr	r2, .L792+4
	movw	r1, #3598
	mov	r0, #1
	bl	dprint_normal
	b	.L784
.L791:
	mov	r0, r4
	bl	Mp4_Syntax_Slice_NotSH
	cmn	r0, #1
	bne	.L784
	add	r3, r4, #20480
	add	r1, r4, #15616
	add	r1, r1, #32
	ldr	r0, [r3, #2424]
	bl	MP4_ClearCurPacket
	ldr	r3, .L792
	ldr	r2, .L792+4
	movw	r1, #3588
	mov	r0, #1
	bl	dprint_normal
	b	.L784
.L785:
	mov	r0, r4
	bl	MP4_Record_SlcSegID
	b	.L784
.L793:
	.align	2
.L792:
	.word	.LANCHOR1+1356
	.word	.LC46
	UNWIND(.fnend)
	.size	MP4_Dec_Slice, .-MP4_Dec_Slice
	.align	2
	.global	MP4_Record_PacketID
	.type	MP4_Record_PacketID, %function
MP4_Record_PacketID:
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
	add	r5, r0, #20480
	mov	r4, r0
	ldr	r3, [r5, #1980]
	cmp	r3, #62
	bgt	.L797
	add	r1, r0, #12288
	add	r4, r0, r3, lsl #2
	add	r4, r4, #20480
	add	r2, r3, #1
	ldr	r0, [r1, #3380]
	str	r0, [r4, #1724]
	str	r2, [r5, #1980]
	ldrb	r2, [r1, #3366]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L794
	ldrb	r2, [r1, #3446]	@ zero_extendqisi2
	cmp	r2, #1
	addeq	r3, r3, #2
	ldreq	r2, [r1, #3460]
	streq	r2, [r4, #1728]
	streq	r3, [r5, #1980]
.L794:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L797:
	bl	MP4_Clean_HeadPacket
	add	r1, r4, #15616
	ldr	r0, [r5, #2424]
	add	r1, r1, #32
	bl	MP4_ClearCurPacket
	ldr	r3, [r5, #1980]
	mov	r1, #62
	ldr	r2, .L798
	str	r1, [sp]
	mov	r0, #0
	movw	r1, #3765
	bl	dprint_normal
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L799:
	.align	2
.L798:
	.word	.LC35
	UNWIND(.fnend)
	.size	MP4_Record_PacketID, .-MP4_Record_PacketID
	.align	2
	.global	MP4_Record_HeadPacketInfo
	.type	MP4_Record_HeadPacketInfo, %function
MP4_Record_HeadPacketInfo:
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
	subs	r4, r0, #0
	mov	r7, r1
	beq	.L803
	ldr	r6, .L805
	add	r1, r4, #15616
	add	r0, r4, #22016
	add	r1, r1, #32
	mov	r2, #160
	add	r0, r0, #24
	ldr	r3, [r6, #52]
	add	r5, r4, #20480
	blx	r3
	add	r0, r4, #22016
	ldr	r3, [r6, #52]
	add	r0, r0, #184
	mov	r2, #4
	add	r1, r4, #15808
	blx	r3
	ldr	r3, [r5, #1988]
	str	r7, [r5, #1984]
	cmp	r3, #0
	beq	.L804
.L802:
	ldr	r3, [r5, #1992]
	add	r3, r3, #1
	str	r3, [r5, #1992]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L804:
	mov	r0, r4
	bl	MP4_Record_PacketID
	mov	r3, #1
	str	r3, [r5, #1988]
	b	.L802
.L803:
	ldr	r2, .L805+4
	movw	r1, #3658
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_normal
.L806:
	.align	2
.L805:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC47
	UNWIND(.fnend)
	.size	MP4_Record_HeadPacketInfo, .-MP4_Record_HeadPacketInfo
	.align	2
	.global	Mp4_Syntax_Parse
	.type	Mp4_Syntax_Parse, %function
Mp4_Syntax_Parse:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #84)
	sub	sp, sp, #84
	ldr	r9, .L956
	mov	r6, r0
	mov	r8, r1
	mov	r4, r2
	str	r2, [fp, #-120]
	ldr	r3, [r9, #48]
	mov	r2, #32
	mov	r1, #0
	sub	r0, fp, #108
	blx	r3
	mov	r2, r4
	mov	r1, r8
	sub	r0, fp, #108
	bl	BsInit
	sub	r0, fp, #108
	mov	r1, #32
	add	r7, r6, #16384
	bl	BsShow
	movw	r3, #510
	mov	r10, #0
	str	r10, [r7, #3532]
	cmp	r0, r3
	mov	r5, r0
	beq	.L935
	add	r1, r6, #12288
	ldrb	r3, [r1, #3520]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L936
.L813:
	add	r4, r6, #20480
	mov	r5, #196
	mov	r2, #1
	strb	r2, [r4, #741]
.L814:
	and	r3, r3, #2
	ands	r3, r3, #255
	bne	.L815
	ldr	r2, [r7, #3528]
	ands	r10, r2, #130
	bne	.L937
	cmp	r5, #197
	beq	.L938
	cmp	r5, #432
	beq	.L939
	movw	r3, #437
	cmp	r5, r3
	beq	.L940
	bic	r3, r5, #15
	cmp	r3, #288
	beq	.L941
	movw	r3, #435
	cmp	r5, r3
	beq	.L942
	movw	r3, #438
	cmp	r5, r3
	beq	.L943
	cmp	r5, #196
	beq	.L944
	movw	r3, #434
	cmp	r5, r3
	beq	.L945
	movw	r3, #286
	cmp	r5, r3
	bne	.L830
	ldr	r10, .L956+4
	ldr	r3, [r10]
	subs	ip, r3, #0
	beq	.L831
	mov	r3, #0
	mov	r1, #41
	mov	r2, r3
	ldr	r0, [r4, #2424]
	blx	ip
.L831:
	ldr	r3, [fp, #-120]
	add	r1, r6, #15616
	ldr	r0, [r4, #2424]
	add	r1, r1, #32
	sub	r3, r3, #4
	str	r3, [fp, #-120]
	bl	MP4_ClearCurPacket
	ldr	r3, [r7, #3528]
	add	r2, r8, #4
	str	r2, [fp, #-124]
	tst	r3, #2
	orrne	r3, r3, #256
	strne	r3, [r7, #3528]
	ldr	r3, [r7, #3528]
	and	r3, r3, #18
	cmp	r3, #18
	beq	.L833
	ldr	r10, [r10]
	cmp	r10, #0
	beq	.L833
	mov	r3, #0
	mov	r1, #60
	mov	r2, r3
	ldr	r0, [r4, #2424]
	blx	r10
.L833:
	ldrb	r3, [r4, #2461]	@ zero_extendqisi2
	mov	r10, #0
	cmp	r3, #1
	beq	.L863
.L839:
	ldrb	r3, [r4, #1503]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L932
	ldr	r3, [r4, #2000]
	add	r1, r6, #19712
	add	r0, r6, #21248
	add	r1, r1, #232
	add	r3, r3, #1
	mov	ip, #0
	str	r3, [r4, #2000]
	add	r0, r0, #68
	ldr	r3, [r9, #52]
	mov	r2, #604
	str	ip, [r4, #2004]
	blx	r3
	ldr	r1, [r7, #3644]
	ldr	r3, [r4, #748]
	cmp	r3, r1
	beq	.L946
.L854:
	ldr	r2, [r4, #2424]
	mov	r0, #100
	ldr	r3, .L956+8
	mla	r3, r0, r2, r3
	add	r5, r3, #64
	ldr	r2, [r3, #64]
	cmp	r2, #0
	beq	.L947
.L856:
	ldr	r3, .L956+4
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L857
	ldr	r0, [r7, #3640]
	mov	r3, #8
	ldr	lr, [r4, #752]
	sub	r2, fp, #116
	ldr	ip, [r4, #748]
	strh	r1, [fp, #-110]	@ movhi
	mov	r1, #1
	strh	r0, [fp, #-112]	@ movhi
	strh	lr, [fp, #-116]	@ movhi
	strh	ip, [fp, #-114]	@ movhi
	ldr	r0, [r4, #2424]
	blx	r5
	ldr	r1, [r7, #3644]
.L857:
	str	r1, [r4, #748]
	mov	r3, #1
	ldr	r2, [r7, #3640]
	str	r2, [r4, #752]
.L855:
	cmp	r3, #0
	bne	.L948
.L859:
	ldr	r3, [r4, #748]
	mov	r2, #0
	ldr	r1, [r4, #752]
	str	r3, [r4, #2024]
	str	r1, [r4, #2020]
	ldr	r3, [r7, #3644]
	str	r3, [r4, #748]
	ldr	r3, [r7, #3640]
	strb	r2, [r4, #1503]
	str	r3, [r4, #752]
	b	.L932
.L937:
	orr	r2, r2, #32
	mov	r10, r3
	str	r2, [r7, #3528]
	mov	r3, #1
	str	r3, [r7, #3532]
.L932:
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L815:
	ldr	r2, [fp, #-120]
	mov	r1, r8
	mov	r0, r6
	bl	MP4_Dec_Slice
	mov	r10, r0
.L819:
	ldrb	r3, [r4, #2461]	@ zero_extendqisi2
	str	r8, [fp, #-124]
	cmp	r3, #1
	beq	.L863
	ldr	r3, [fp, #-120]
	cmp	r10, r3, asl #3
	bhi	.L838
.L954:
	movw	r3, #438
	cmp	r5, r3
	cmpne	r5, #196
	bne	.L839
	ldr	r3, [r7, #3528]
	tst	r3, #130
	beq	.L839
	ldrb	r3, [r4, #741]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L949
	ldr	r3, [r4, #752]
	ldr	r2, [r4, #748]
	cmp	r3, #0
	str	r3, [r4, #2028]
	str	r2, [r4, #2032]
	beq	.L843
	ldr	r1, [r4, #2020]
	cmp	r3, r1
	beq	.L843
.L871:
	mov	r7, #1
.L844:
	ldr	r2, [r4, #2424]
	mov	r1, #100
	ldr	r3, .L956+8
	mla	r3, r1, r2, r3
	add	r5, r3, #64
	ldr	r2, [r3, #64]
	cmp	r2, #0
	beq	.L950
.L849:
	ldr	r3, .L956+4
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L848
	ldr	r1, [r4, #2024]
	mov	r3, #8
	ldr	r0, [r4, #2032]
	sub	r2, fp, #116
	ldr	lr, [r4, #2020]
	ldr	ip, [r4, #2028]
	strh	r1, [fp, #-114]	@ movhi
	mov	r1, #1
	strh	r0, [fp, #-110]	@ movhi
	strh	lr, [fp, #-116]	@ movhi
	strh	ip, [fp, #-112]	@ movhi
	ldr	r0, [r4, #2424]
	blx	r5
.L848:
	cmp	r7, #0
	bne	.L951
.L851:
	ldr	r2, [r4, #2028]
	ldr	r3, [r4, #2032]
	str	r2, [r4, #2020]
	str	r3, [r4, #2024]
.L842:
	add	r1, r6, #20992
	add	r0, r6, #21760
	ldr	r3, [r9, #52]
	add	r1, r1, #160
	mov	r2, #60
	add	r0, r0, #160
	blx	r3
	ldr	r2, .L956+12
	movw	r1, #2057
	mov	r0, #3
	bl	dprint_normal
	ldr	r3, [fp, #-124]
	rsb	r8, r8, r3
	ldr	r3, [r4, #2004]
	add	r10, r10, r8, lsl #3
	add	r3, r3, #1
	str	r3, [r4, #2004]
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L936:
	mov	r2, r0, lsr #8
	add	r4, r6, #20480
	sub	r2, r2, #128
	mov	r0, #2
	cmp	r2, #3
	strb	r0, [r4, #741]
	ldrlsb	r3, [r1, #3520]	@ zero_extendqisi2
	orrls	r3, r3, r0
	strlsb	r3, [r1, #3520]
	b	.L814
.L843:
	cmp	r2, #0
	beq	.L845
	ldr	r1, [r4, #2024]
	cmp	r2, r1
	beq	.L952
	cmp	r3, #0
	beq	.L871
	ldr	r1, [r4, #2020]
	cmp	r3, r1
	bne	.L871
	mov	r7, #1
	b	.L864
.L863:
	ldr	r1, [r7, #3640]
	cmp	r1, #0
	beq	.L836
	ldr	r2, [r7, #3644]
	cmp	r2, #0
	bne	.L953
.L836:
	mov	r3, #0
	strb	r3, [r4, #2461]
	ldr	r3, [fp, #-120]
	cmp	r10, r3, asl #3
	bls	.L954
.L838:
	ldr	r2, .L956+16
	movw	r1, #2122
	mov	r0, #3
	bl	dprint_normal
	ldr	r2, [fp, #-124]
	ldr	r3, [r7, #3528]
	rsb	r8, r8, r2
	bic	r3, r3, #432
	mov	r10, r8, asl #3
	bic	r3, r3, #2
	str	r3, [r7, #3528]
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L935:
	ldr	r3, [r9, #52]
	mov	r2, #32
	sub	r1, fp, #108
	sub	r0, fp, #76
	blx	r3
	mov	r1, #32
	sub	r0, fp, #76
	bl	BsSkip
	mov	r1, #32
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #32
	mov	r4, r0
	sub	r0, fp, #76
	bl	BsGet
	movw	r2, #20036
	movw	r3, #20553
	movt	r2, 17221
	movt	r3, 18515
	cmp	r0, r2
	cmpeq	r4, r3
	bne	.L809
	ldr	r3, .L956+4
	add	r4, r6, #20480
	mov	r2, #1
	strb	r2, [r4, #2460]
	ldr	r5, [r3]
	cmp	r5, r10
	beq	.L810
	mov	r3, r10
	mov	r2, r10
	mov	r1, #46
	ldr	r0, [r4, #2424]
	blx	r5
.L810:
	ldr	r3, [r7, #3528]
	add	r1, r6, #15616
	add	r1, r1, #32
	mov	r10, #0
	tst	r3, #130
	orrne	r3, r3, #32
	strne	r3, [r7, #3528]
	movne	r2, #1
	strne	r2, [r7, #3532]
	ldr	r0, [r4, #2424]
	bl	MP4_ClearCurPacket
	b	.L932
.L809:
	add	r3, r6, #12288
	ldrb	r3, [r3, #3520]	@ zero_extendqisi2
	tst	r3, #1
	bne	.L813
	add	r4, r6, #20480
	mov	r2, #2
	strb	r2, [r4, #741]
	b	.L814
.L830:
	ldr	r3, [fp, #-120]
	add	r1, r6, #15616
	ldr	r0, [r4, #2424]
	add	r1, r1, #32
	sub	r3, r3, #4
	str	r3, [fp, #-120]
	add	r3, r8, #4
	str	r3, [fp, #-124]
	bl	MP4_ClearCurPacket
	b	.L833
.L939:
	ldr	r2, .L956+20
	movw	r1, #1864
	mov	r0, #3
	bl	dprint_normal
	str	r10, [r4, #2036]
	mov	r1, r8
	ldr	r2, [fp, #-120]
	mov	r0, r6
	bl	Mp4_Syntax_Vos
	mov	r1, r5
	mov	r10, r0
	mov	r0, r6
	bl	MP4_Record_HeadPacketInfo
	b	.L819
.L845:
	ldr	r7, [r4, #2428]
	subs	r7, r7, #1
	movne	r7, #1
	cmp	r3, #0
	beq	.L848
.L865:
	ldr	r1, [r4, #2020]
	cmp	r3, r1
	bne	.L844
.L847:
	cmp	r2, #0
	beq	.L848
.L864:
	ldr	r3, [r4, #2024]
	cmp	r3, r2
	beq	.L848
	b	.L844
.L943:
	ldr	r2, .L956+24
	movw	r1, #1905
	mov	r0, #3
	bl	dprint_normal
	ldr	r3, [fp, #-120]
	cmp	r3, #4
	beq	.L955
	ldr	r2, [fp, #-120]
	mov	r1, r8
	mov	r0, r6
	bl	Mp4_Syntax_Vop
	ldr	r3, [r7, #3528]
	tst	r3, #2
	mov	r10, r0
	bne	.L826
	add	r1, r6, #15616
	ldr	r0, [r4, #2424]
	add	r1, r1, #32
	bl	MP4_ClearCurPacket
.L825:
	mov	r3, r10
	ldr	r2, .L956+28
	movw	r1, #1926
	mov	r0, #8
	bl	dprint_normal
	b	.L819
.L946:
	ldr	r2, [r4, #752]
	ldr	r3, [r7, #3640]
	cmp	r2, r3
	bne	.L854
	ldr	r3, [r4, #2428]
	subs	r3, r3, #1
	movne	r3, #1
	b	.L855
.L940:
	ldr	r2, .L956+32
	mov	r1, #1872
	mov	r0, #3
	bl	dprint_normal
	mov	r3, #1
	mov	r1, r8
	ldr	r2, [fp, #-120]
	str	r3, [r4, #2036]
	mov	r0, r6
	bl	Mp4_Syntax_Vo
	mov	r1, r5
	mov	r10, r0
	mov	r0, r6
	bl	MP4_Record_HeadPacketInfo
	b	.L819
.L941:
	ldr	r2, .L956+36
	movw	r1, #1880
	mov	r0, #3
	bl	dprint_normal
	mov	r3, #2
	ldr	r2, [fp, #-120]
	mov	r1, r8
	str	r3, [r4, #2036]
	mov	r0, r6
	bl	Mp4_Syntax_Vol
	mov	r1, r5
	mov	r10, r0
	mov	r0, r6
	bl	MP4_Record_HeadPacketInfo
	ldrb	r3, [r4, #1503]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L819
	ldrb	r3, [r4, #1504]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L819
	add	r1, r6, #20480
	add	r0, r6, #19712
	str	r3, [fp, #-124]
	add	r1, r1, #68
	ldr	r3, [r9, #52]
	add	r0, r0, #232
	mov	r2, #604
	blx	r3
	ldr	r3, [fp, #-124]
	strb	r3, [r4, #1503]
	strb	r3, [r4, #733]
	b	.L819
.L938:
	ldr	r2, .L956+40
	movw	r1, #1857
	mov	r0, #3
	bl	dprint_normal
	add	r1, r6, #15616
	add	r1, r1, #32
	ldr	r0, [r4, #2424]
	bl	MP4_ClearCurPacket
	b	.L932
.L952:
	ldr	r7, [r4, #2428]
	subs	r7, r7, #1
	movne	r7, #1
	cmp	r3, #0
	beq	.L847
	b	.L865
.L949:
	ldrb	r3, [r4, #672]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L841
	ldr	r2, [r4, #764]
	ldr	r3, [r4, #756]
	ldr	r0, [r4, #760]
	str	r2, [r4, #768]
	add	r2, r2, r3
	str	r2, [r4, #764]
	ldr	r3, [r7, #3632]
	ldr	r1, [r4, #776]
	mla	r3, r3, r2, r0
	rsb	r2, r1, r3
	str	r2, [r4, #780]
	str	r3, [r4, #772]
	str	r3, [r4, #776]
	b	.L842
.L942:
	ldr	r2, .L956+44
	movw	r1, #1897
	mov	r0, #3
	bl	dprint_normal
	mov	r3, #3
	mov	r1, r8
	ldr	r2, [fp, #-120]
	str	r3, [r4, #2036]
	mov	r0, r6
	bl	Mp4_Syntax_Gop
	mov	r1, r5
	mov	r10, r0
	mov	r0, r6
	bl	MP4_Record_HeadPacketInfo
	b	.L819
.L953:
	mov	r0, r6
	bl	MP4_FrameInit
	cmp	r0, #0
	beq	.L836
	ldr	r2, .L956+48
	movw	r1, #1988
	mov	r0, #0
	bl	dprint_normal
	b	.L836
.L944:
	ldr	r2, .L956+52
	movw	r1, #1930
	mov	r0, #3
	bl	dprint_normal
	ldr	r2, [fp, #-120]
	mov	r1, r8
	mov	r0, r6
	bl	Mp4_Syntax_ShortHeader
	ldr	r3, [r7, #3528]
	tst	r3, #2
	mov	r10, r0
	beq	.L933
	mov	r1, #196
	mov	r0, r6
	bl	MP4_Record_HeadPacketInfo
	b	.L819
.L945:
	ldr	r2, .L956+56
	movw	r1, #1945
	mov	r0, #3
	bl	dprint_normal
	ldr	r2, [fp, #-120]
	mov	r1, r8
	mov	r0, r6
	bl	Mp4_Syntax_UserData
	mov	r10, r0
.L933:
	add	r1, r6, #15616
	ldr	r0, [r4, #2424]
	add	r1, r1, #32
	bl	MP4_ClearCurPacket
	b	.L819
.L950:
	mov	r2, #1
	str	r2, [r3, #64]
	ldr	r3, [r9]
	blx	r3
	str	r0, [r5, #4]
	b	.L849
.L947:
	mov	r1, #1
	ldr	r2, [r9]
	str	r1, [r3, #64]
	blx	r2
	ldr	r1, [r7, #3644]
	str	r0, [r5, #4]
	b	.L856
.L951:
	ldr	r1, [r4, #2444]
	ldr	r0, [r4, #2424]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L852
	ldr	r1, [r5, #168]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	ldr	r1, [r5, #176]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	ldr	r1, [r5, #184]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	ldr	r1, [r5, #192]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r5, #168]
	strd	r2, [r5, #176]
	strd	r2, [r5, #184]
	strd	r2, [r5, #192]
	ldr	r1, [r4, #2444]
	ldr	r0, [r4, #2424]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #2436]
	ldr	r0, [r4, #2424]
	bl	FSP_ClearLogicFs
	ldr	r0, [r4, #2424]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #2444]
	str	r0, [r4, #2436]
.L852:
	add	r1, r6, #22528
	mov	r5, #0
	add	r1, r1, #24
	str	r5, [r4, #2432]
	ldr	r0, [r4, #2424]
	bl	FSP_ClearNotInVoQueue
	ldr	r2, [r4, #2032]
	ldr	r1, [r4, #2028]
	mov	r0, r6
	bl	MP4_FrameInit
	cmp	r0, r5
	beq	.L851
	mov	r0, r5
	ldr	r2, .L956+60
	movw	r1, #2047
	bl	dprint_normal
	b	.L851
.L826:
	movw	r1, #438
	mov	r0, r6
	bl	MP4_Record_HeadPacketInfo
	b	.L825
.L841:
	ldr	r1, [r4, #768]
	ldr	r2, [r4, #756]
	ldr	r3, [r7, #3632]
	ldr	r0, [r4, #760]
	add	r2, r2, r1
	ldr	r1, [r4, #780]
	mla	r3, r3, r2, r0
	ldr	r2, [r4, #776]
	rsb	r2, r2, r1
	add	r2, r2, r3
	str	r2, [r4, #784]
	str	r3, [r4, #772]
	b	.L842
.L955:
	mov	r1, r5
	mov	r0, r6
	bl	MP4_Record_HeadPacketInfo
	b	.L825
.L948:
	ldr	r1, [r4, #2444]
	ldr	r0, [r4, #2424]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L860
	ldr	r1, [r5, #168]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	ldr	r1, [r5, #176]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	ldr	r1, [r5, #184]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	ldr	r1, [r5, #192]
	ldr	r0, [r4, #2424]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r5, #168]
	strd	r2, [r5, #176]
	strd	r2, [r5, #184]
	strd	r2, [r5, #192]
	ldr	r1, [r4, #2444]
	ldr	r0, [r4, #2424]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #2436]
	ldr	r0, [r4, #2424]
	bl	FSP_ClearLogicFs
	ldr	r0, [r4, #2424]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #2444]
	str	r0, [r4, #2436]
.L860:
	add	r1, r6, #22528
	mov	r5, #0
	add	r1, r1, #24
	str	r5, [r4, #2432]
	ldr	r0, [r4, #2424]
	bl	FSP_ClearNotInVoQueue
	mov	r0, r6
	ldr	r2, [r4, #748]
	ldr	r1, [r4, #752]
	bl	MP4_FrameInit
	cmp	r0, r5
	beq	.L859
	mov	r0, r5
	ldr	r2, .L956+64
	movw	r1, #2101
	bl	dprint_normal
	b	.L859
.L957:
	.align	2
.L956:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_EventReportFunc
	.word	g_VfmwChanStat
	.word	.LC59
	.word	.LC61
	.word	.LC49
	.word	.LC53
	.word	.LC54
	.word	.LC50
	.word	.LC51
	.word	.LC48
	.word	.LC52
	.word	.LC57
	.word	.LC55
	.word	.LC56
	.word	.LC58
	.word	.LC60
	UNWIND(.fnend)
	.size	Mp4_Syntax_Parse, .-Mp4_Syntax_Parse
	.align	2
	.global	MP4_Combine_HdPacket
	.type	MP4_Combine_HdPacket, %function
MP4_Combine_HdPacket:
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
	add	r5, r0, #20480
	ldr	r3, [r5, #1560]
	cmp	r3, #0
	beq	.L971
	add	r3, r0, #12288
	ldrb	r4, [r3, #3366]	@ zero_extendqisi2
	cmp	r4, #1
	beq	.L972
	cmp	r4, #0
	bne	.L966
	ldrb	r2, [r3, #3446]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L966
	ldr	ip, .L975
	add	r1, r0, #15680
	ldr	r2, [r5, #1576]
	add	r0, r0, #22016
	ldr	r3, [r3, #3376]
	add	r1, r1, #48
	ldr	r6, [ip, #52]
	add	r0, r0, #104
	add	r3, r3, r2
	mov	r2, #80
	str	r3, [r5, #1576]
	blx	r6
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L972:
	ldrb	r4, [r5, #1566]	@ zero_extendqisi2
	cmp	r4, #1
	beq	.L973
	cmp	r4, #0
	bne	.L965
	ldrb	r2, [r5, #1646]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L965
	ldr	r3, [r3, #3376]
	mov	r0, r4
	ldr	r2, [r5, #1656]
	add	r3, r3, r2
	str	r3, [r5, #1656]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L966:
	movw	r3, #3831
.L970:
	ldr	r2, .L975+4
	mov	r1, r3
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L973:
	ldr	r1, [r3, #3372]
	ldr	r2, [r5, #1572]
	cmp	r1, r2
	bcc	.L974
	ldr	r3, [r3, #3376]
	mov	r0, #0
	ldr	r2, [r5, #1576]
	add	r3, r3, r2
	str	r3, [r5, #1576]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L965:
	movw	r3, #3818
	b	.L970
.L974:
	ldr	r3, .L975
	add	r1, r0, #15616
	add	r0, r0, #22016
	add	r1, r1, #32
	mov	r2, #80
	add	r0, r0, #104
	ldr	r3, [r3, #52]
	blx	r3
	mov	r3, #0
	strb	r4, [r5, #1646]
	mov	r0, r3
	strb	r3, [r5, #1566]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L971:
	ldr	r2, .L975+8
	ldr	r4, [r2]
	cmp	r4, #0
	beq	.L960
	ldr	r0, [r5, #2424]
	mov	r2, r3
	mov	r1, #22
	blx	r4
.L960:
	ldr	r2, .L975+12
	movw	r1, #3791
	mov	r0, #1
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L976:
	.align	2
.L975:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC30
	.word	g_EventReportFunc
	.word	.LC62
	UNWIND(.fnend)
	.size	MP4_Combine_HdPacket, .-MP4_Combine_HdPacket
	.align	2
	.global	MP4_Renew_CurPacket
	.type	MP4_Renew_CurPacket, %function
MP4_Renew_CurPacket:
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
	mov	r4, r0
	bl	MP4_Combine_HdPacket
	cmn	r0, #1
	mov	r5, r0
	beq	.L980
	ldr	r5, .L981
	mov	r0, r4
	bl	MP4_Record_PacketID
	add	r1, r4, #22016
	add	r0, r4, #15616
	add	r1, r1, #24
	ldr	r3, [r5, #52]
	mov	r2, #160
	add	r0, r0, #32
	blx	r3
	add	r1, r4, #22016
	add	r0, r4, #15680
	ldr	r3, [r5, #52]
	add	r1, r1, #184
	mov	r2, #4
	add	r0, r0, #40
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L980:
	add	r3, r4, #20480
	add	r1, r4, #15616
	add	r1, r1, #32
	ldr	r0, [r3, #2424]
	bl	MP4_ClearCurPacket
	movw	r3, #3846
	mov	r1, r3
	ldr	r2, .L981+4
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L982:
	.align	2
.L981:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC63
	UNWIND(.fnend)
	.size	MP4_Renew_CurPacket, .-MP4_Renew_CurPacket
	.align	2
	.global	MP4_Check_CurPacket
	.type	MP4_Check_CurPacket, %function
MP4_Check_CurPacket:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	add	r4, r0, #12288
	add	r5, r0, #20480
	mov	r3, #0
	ldr	r2, [r4, #3372]
	mov	r6, r0
	sub	r0, fp, #60
	str	r2, [r5, #1512]
	ldr	r1, [r4, #3360]
	str	r1, [r5, #1508]
	ldr	r2, [r4, #3376]
	str	r3, [r5, #1520]
	str	r2, [r5, #1516]
	bl	BsInit
	sub	r0, fp, #60
	mov	r1, #32
	bl	BsShow
	ldrb	r3, [r4, #3520]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L1009
	mov	r3, #1
	strb	r3, [r5, #741]
	ldrb	r3, [r4, #3520]	@ zero_extendqisi2
	tst	r3, #2
	bne	.L986
	ldr	r3, [r5, #1984]
	mov	r1, #196
.L990:
	movw	r2, #438
	cmp	r1, r2
	cmpeq	r3, r2
	beq	.L997
	cmp	r1, #196
	cmpeq	r3, #196
	bne	.L1007
.L997:
	ldr	r3, [r5, #1992]
	cmp	r3, #1
	bgt	.L989
	b	.L1007
.L1009:
	mov	r3, r0, lsr #8
	mov	r2, #2
	sub	r3, r3, #128
	strb	r2, [r5, #741]
	cmp	r3, #3
	mov	r1, r0
	bls	.L1010
.L985:
	ldrb	r3, [r4, #3520]	@ zero_extendqisi2
	tst	r3, #2
	ldr	r3, [r5, #1984]
	bne	.L988
	movw	r2, #438
	cmp	r3, r2
	cmpne	r0, #196
	beq	.L990
.L989:
	mov	r0, r6
	bl	MP4_Clean_HeadPacket
.L1007:
	mov	r0, #0
.L994:
	ldr	r3, [r4, #3360]
	cmp	r3, #0
	beq	.L1000
	ldr	r3, [r4, #3372]
	cmp	r3, #0
	mvneq	r0, #0
.L1006:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L988:
	movw	r2, #438
	sub	r0, r0, #196
	rsb	r3, r2, r3
	clz	r0, r0
	clz	r3, r3
	mov	r0, r0, lsr #5
	mov	r3, r3, lsr #5
	orrs	r2, r0, r3
	beq	.L991
	ldrb	r2, [r5, #1505]	@ zero_extendqisi2
	cmp	r2, #1
	orreq	r0, r0, #1
	cmp	r0, #0
	bne	.L999
.L991:
	mov	r0, r6
	bl	MP4_Renew_CurPacket
	b	.L994
.L986:
	ldr	r3, [r5, #1984]
	movw	r2, #438
	rsb	r3, r2, r3
	clz	r3, r3
	mov	r3, r3, lsr #5
.L999:
	ldr	r2, [r5, #1988]
	cmp	r2, #1
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r3, #0
	beq	.L1007
	ldr	r3, [r5, #1576]
	cmp	r3, #4
	bne	.L1007
	b	.L991
.L1010:
	ldrb	r3, [r4, #3520]	@ zero_extendqisi2
	orr	r3, r3, r2
	strb	r3, [r4, #3520]
	b	.L985
.L1000:
	mvn	r0, #0
	b	.L1006
	UNWIND(.fnend)
	.size	MP4_Check_CurPacket, .-MP4_Check_CurPacket
	.align	2
	.global	MPEG4DEC_Decode
	.type	MPEG4DEC_Decode, %function
MPEG4DEC_Decode:
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
	UNWIND(.pad #28)
	sub	sp, sp, #28
	add	r4, r0, #20480
	mov	r6, r0
	mov	r5, r1
	ldr	r3, [r4, #2012]
	cmp	r3, #0
	beq	.L1012
	ldr	r3, [r1, #16]
	cmp	r3, #0
	beq	.L1012
	ldr	r3, [r1, #12]
	cmp	r3, #0
	beq	.L1012
	ldr	r3, [r1]
	cmp	r3, #0
	beq	.L1012
	ldr	r2, .L1110
	movw	r1, #2623
	mov	r0, #3
	add	r8, r6, #15616
	bl	dprint_normal
	ldr	r3, [r5, #12]
	ldr	r2, .L1110+4
	mov	r1, #2624
	mov	r0, #8
	add	r8, r8, #32
	bl	dprint_normal
	ldr	r3, [r5, #16]
	ldr	r2, .L1110+8
	movw	r1, #2625
	mov	r0, #8
	bl	dprint_normal
	ldrb	r3, [r5, #6]	@ zero_extendqisi2
	ldr	r2, .L1110+12
	movw	r1, #2626
	mov	r0, #8
	bl	dprint_normal
	ldr	r3, [r5, #92]
	ldr	r2, .L1110+16
	movw	r1, #2627
	mov	r0, #8
	bl	dprint_normal
	ldr	r3, [r5, #96]
	ldr	r2, .L1110+20
	movw	r1, #2628
	mov	r0, #8
	bl	dprint_normal
	ldrb	r3, [r5, #86]	@ zero_extendqisi2
	ldr	r2, .L1110+24
	movw	r1, #2629
	mov	r0, #8
	bl	dprint_normal
	ldr	r3, [r5, #16]
	ldr	r2, .L1110+28
	movw	r1, #2631
	mov	r0, #8
	bl	dprint_normal
	ldr	r3, [r5]
	ldr	r2, .L1110+32
	movw	r1, #2632
	mov	r0, #8
	ldrb	r3, [r3]	@ zero_extendqisi2
	bl	dprint_normal
	ldr	r3, [r5]
	ldr	r2, .L1110+36
	movw	r1, #2633
	mov	r0, #8
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	bl	dprint_normal
	ldr	r3, [r5]
	ldr	r2, .L1110+40
	movw	r1, #2634
	mov	r0, #8
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	bl	dprint_normal
	ldr	r3, [r5]
	ldr	r2, .L1110+44
	movw	r1, #2635
	mov	r0, #8
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	bl	dprint_normal
	ldr	r3, .L1110+48
	mov	r2, #160
	mov	r1, r5
	mov	r0, r8
	ldr	r3, [r3, #52]
	blx	r3
	mov	r1, r8
	mov	r0, r6
	bl	MP4_GetScdUpMsg
	mov	r0, r6
	bl	MP4_Check_CurPacket
	cmn	r0, #1
	mov	r7, r0
	beq	.L1097
	mov	r1, r8
	mov	r0, r6
	bl	MP4_GetScdUpMsg
	add	r3, r6, #12288
	mov	r2, #0
	mov	r0, r6
	ldr	r1, [r3, #3372]
	str	r1, [r4, #1512]
	ldr	r1, [r3, #3360]
	str	r1, [r4, #1508]
	ldr	r3, [r3, #3376]
	str	r2, [r4, #1520]
	str	r3, [r4, #1516]
	bl	Mp4_Get_DecMode
	ldr	r3, [r4, #1524]
	ldr	r2, [r3, #816]
	cmp	r2, #1
	beq	.L1098
.L1016:
	add	r7, r6, #16384
	ldr	r3, [r7, #3528]
	str	r3, [r4, #2464]
.L1017:
	ldr	r2, [r4, #1516]
	mov	r0, r6
	ldr	r1, [r4, #1508]
	bl	Mp4_Syntax_Parse
	ldr	r3, [r4, #1508]
	ldr	ip, [r4, #1524]
	ldr	r1, [r4, #1512]
	mov	r2, r0, lsr #3
	and	r0, r0, #7
	add	r3, r3, r2
	str	r3, [r4, #1508]
	ldr	r3, [r4, #1516]
	add	r1, r2, r1
	str	r0, [r4, #1520]
	rsb	r3, r2, r3
	str	r1, [r4, #1512]
	str	r3, [r4, #1516]
	ldr	r3, [ip, #816]
	cmp	r3, #1
	beq	.L1099
.L1018:
	ldr	r3, [r7, #3528]
	tst	r3, #288
	beq	.L1019
	bic	r3, r3, #432
	bic	r3, r3, #2
	str	r3, [r7, #3528]
	ldr	r3, [r4, #1556]
	cmp	r3, #2
	beq	.L1100
	cmp	r3, #1
	beq	.L1101
	cmp	r3, #4
	bne	.L1022
	ldrb	r3, [r4, #1440]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1024
	ldr	r3, [r4, #2040]
	cmp	r3, #0
	moveq	r3, #2
	movne	r3, #1
	str	r3, [r4, #2040]
.L1022:
	mov	r0, r6
	bl	Mp4_Frame_Atr
	cmn	r0, #1
	mov	r7, r0
	beq	.L1102
	ldr	r1, [r4, #2436]
	ldr	r0, [r4, #2424]
	bl	FSP_GetFsImagePtr
	ldr	r1, [r4, #2444]
	mov	r8, r0
	ldr	r0, [r4, #2424]
	bl	FSP_GetFsImagePtr
	clz	r3, r8
	mov	r3, r3, lsr #5
	clz	r1, r0
	mov	r2, r0
	mov	r1, r1, lsr #5
	orrs	r10, r1, r3
	bne	.L1103
	ldrb	r0, [r4, #739]	@ zero_extendqisi2
	and	r9, r0, #253
	cmp	r9, #1
	beq	.L1104
	cmp	r0, #2
	beq	.L1105
.L1033:
	ldrb	r3, [r4, #1440]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1037
	ldr	r3, [r4, #2432]
	ldr	r1, [r4, #2436]
	cmp	r3, #0
	ldr	r3, [r4, #2444]
	movgt	r2, #2
	movle	r2, #1
	cmp	r1, r3
	str	r2, [r4, #2432]
	beq	.L1039
	mov	r2, #0
	ldr	r0, [r4, #2424]
	bl	FSP_SetRef
	ldr	r1, [r4, #2436]
	ldr	r0, [r4, #2424]
	bl	FSP_GetDisplay
	cmp	r0, #3
	beq	.L1094
	mov	r2, #0
	ldr	r1, [r4, #2436]
	ldr	r0, [r4, #2424]
	bl	FSP_SetDisplay
.L1094:
	ldr	r3, [r4, #2444]
.L1039:
	str	r3, [r4, #2436]
	mov	r2, #1
	ldrb	r3, [r6, #1]	@ zero_extendqisi2
	strb	r3, [r6]
	ldr	r3, [r4, #2448]
	ldr	r1, [r4, #2452]
	str	r3, [r4, #2440]
	str	r1, [r4, #2444]
	ldrb	r3, [r6, #2]	@ zero_extendqisi2
	strb	r3, [r6, #1]
	ldr	r3, [r4, #780]
	ldr	r0, [r4, #2424]
	str	r3, [r4, #2448]
	bl	FSP_SetRef
	ldr	r1, [r4, #2436]
	ldr	r0, [r4, #2424]
	bl	FSP_ReleasePmv
	ldrb	r3, [r4, #1440]	@ zero_extendqisi2
	cmp	r3, #4
	beq	.L1106
.L1037:
	mov	r2, r5
	mov	r1, #0
	mov	r0, r6
	bl	Mp4_Set_DecPar
	ldrb	r7, [r4, #1440]	@ zero_extendqisi2
	cmp	r7, #0
	bne	.L1042
	ldr	r3, [r4, #2040]
	cmp	r3, #0
	moveq	r3, #2
	movne	r3, #1
	str	r3, [r4, #2040]
	add	r3, r6, #1040
	str	r3, [r6, #1036]
	ldr	r2, [r4, #1524]
	ldr	r1, [r2, #840]
	cmp	r1, #1
	bne	.L1050
.L1051:
	cmp	r7, #0
	mov	r3, #0
	strb	r3, [r6, #1190]
	bne	.L1041
	ldr	r3, .L1110+52
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L1041
	sub	r2, fp, #44
	ldr	r0, [r4, #2424]
	mov	r3, #4
	mov	r1, #8
	str	r7, [r2, #-4]!
	blx	r5
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1104:
	cmp	r3, #0
	bne	.L1031
	ldr	r3, [r4, #1524]
	ldr	r2, [r8, #96]
	ldr	r3, [r3]
	cmp	r2, r3
	bls	.L1033
	ldr	r1, [r4, #2452]
	mvn	r7, #0
	ldr	r0, [r4, #2424]
	bl	FSP_ClearLogicFs
	mov	r0, r6
	bl	MP4_ClearCurPic
	mov	r0, r6
	bl	MP4_Clean_HeadPacket
	ldr	ip, [r4, #1524]
	ldr	r3, [r8, #96]
	mov	r0, r9
	ldr	r2, .L1110+56
	movw	r1, #2745
	ldr	ip, [ip]
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1024:
	sub	r2, r3, #2
	tst	r2, #253
	bne	.L1027
	ldr	r2, [r4, #2040]
	cmp	r2, #2
	beq	.L1095
.L1027:
	cmp	r3, #1
	streq	r3, [r4, #2040]
	b	.L1022
.L1042:
	sub	r3, r7, #2
	sub	r10, r7, #2
	clz	r10, r10
	ands	r5, r3, #253
	mov	r10, r10, lsr #5
	beq	.L1107
.L1045:
	cmp	r7, #1
	beq	.L1108
	add	r3, r6, #1040
	str	r3, [r6, #1036]
	ldr	r2, [r4, #1524]
	ldr	r1, [r2, #840]
	cmp	r1, #1
	beq	.L1109
.L1050:
	cmp	r1, #2
	bne	.L1051
.L1052:
	ldr	r2, [r2, #844]
	cmp	r2, #0
	andgt	r10, r10, #1
	movle	r10, #0
	cmp	r3, #0
	moveq	r3, #0
	andne	r3, r10, #1
	cmp	r3, #0
	beq	.L1051
	mov	r3, #0
	str	r3, [r6, #1036]
	ldr	r1, [r4, #2452]
	mvn	r7, #0
	ldr	r0, [r4, #2424]
	bl	FSP_ClearLogicFs
	ldr	r2, [r4, #1524]
	mov	r0, r6
	ldr	r3, [r2, #844]
	add	r3, r3, r7
	str	r3, [r2, #844]
	bl	MP4_ClearCurPic
	mov	r0, r6
	bl	MP4_Clean_HeadPacket
	b	.L1091
.L1108:
	str	r7, [r4, #2040]
	add	r3, r6, #1040
	str	r3, [r6, #1036]
	ldr	r2, [r4, #1524]
	ldr	r1, [r2, #840]
	cmp	r1, #1
	beq	.L1048
	cmp	r1, #2
	beq	.L1052
.L1048:
	mov	r3, #0
	strb	r3, [r6, #1190]
.L1041:
	mov	r7, #0
.L1091:
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1099:
	ldr	r3, [ip, #848]
	cmp	r3, #0
	beq	.L1018
	b	.L1041
.L1098:
	ldr	r3, [r3, #848]
	cmp	r3, #1
	bne	.L1016
	ldr	r3, [r4, #2464]
	add	r7, r6, #16384
	str	r3, [r7, #3528]
	b	.L1017
.L1100:
	ldrb	r3, [r4, #1440]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1022
.L1021:
	mov	r0, r6
	mvn	r7, #0
	bl	MP4_ClearCurPic
	mov	r0, r6
	bl	MP4_Clean_HeadPacket
	b	.L1091
.L1101:
	ldrb	r3, [r4, #1440]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L1022
	b	.L1021
.L1107:
	ldr	r3, [r4, #2040]
	cmp	r3, #2
	bne	.L1045
	ldr	r1, [r4, #2452]
	ldr	r0, [r4, #2424]
	bl	FSP_ClearLogicFs
	ldr	r3, .L1110+52
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L1095
	ldr	r0, [r4, #2424]
	mov	r3, r5
	mov	r2, r5
	mov	r1, #60
	blx	r6
	mvn	r7, #0
	b	.L1091
.L1106:
	mov	r0, r6
	bl	MP4_PrepareNvopDecparam
	cmp	r0, #0
	beq	.L1041
	movw	r1, #2823
	ldr	r2, .L1110+60
	mov	r0, #0
	mvn	r7, #0
	bl	dprint_normal
	ldr	r1, [r4, #2452]
.L1096:
	ldr	r0, [r4, #2424]
	bl	FSP_ClearLogicFs
	mov	r0, r6
	bl	MP4_ClearCurPic
	mov	r0, r6
	bl	MP4_Clean_HeadPacket
	b	.L1091
.L1012:
	ldr	r2, .L1110+64
	movw	r1, #2619
	mov	r0, #1
	mvn	r7, #0
	bl	dprint_normal
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1105:
	cmp	r3, #0
	bne	.L1034
	ldr	r3, [r4, #1524]
	ldr	r0, [r8, #96]
	ldr	r3, [r3]
	cmp	r0, r3
	bhi	.L1035
	cmp	r1, #0
	bne	.L1036
	ldr	r1, [r2, #96]
	cmp	r3, r1
	bcs	.L1033
.L1036:
	ldr	r1, [r4, #2452]
	mvn	r7, #0
	ldr	r0, [r4, #2424]
	str	r2, [fp, #-56]
	bl	FSP_ClearLogicFs
	mov	r0, r6
	bl	MP4_ClearCurPic
	mov	r0, r6
	bl	MP4_Clean_HeadPacket
	ldr	ip, [r4, #1524]
	ldr	r2, [fp, #-56]
	movw	r1, #2783
	mov	r0, #1
	ldr	ip, [ip]
	ldr	r3, [r2, #96]
	ldr	r2, .L1110+68
	str	ip, [sp]
	bl	dprint_normal
	b	.L1091
.L1109:
	cmp	r3, #0
	moveq	r10, #0
	andne	r10, r10, #1
	cmp	r10, #0
	beq	.L1051
	mov	r3, #0
	mvn	r7, #0
	str	r3, [r6, #1036]
	ldr	r1, [r4, #2452]
	b	.L1096
.L1035:
	ldr	r1, [r4, #2452]
	mvn	r7, #0
	ldr	r0, [r4, #2424]
	bl	FSP_ClearLogicFs
	mov	r0, r6
	bl	MP4_ClearCurPic
	mov	r0, r6
	bl	MP4_Clean_HeadPacket
	ldr	ip, [r4, #1524]
	ldr	r3, [r8, #96]
	movw	r1, #2765
	ldr	r2, .L1110+72
	mov	r0, #1
	ldr	ip, [ip]
	str	ip, [sp]
	bl	dprint_normal
	b	.L1091
.L1103:
	movw	r1, #2726
	ldr	r3, .L1110+76
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L1110+80
	bl	dprint_normal
.L1095:
	mvn	r7, #0
	b	.L1091
.L1031:
	ldr	r1, [r4, #2452]
	mvn	r7, #0
	ldr	r0, [r4, #2424]
	bl	FSP_ClearLogicFs
	mov	r0, r6
	bl	MP4_ClearCurPic
	mov	r0, r6
	bl	MP4_Clean_HeadPacket
	movw	r1, #2740
	mov	r0, r9
	str	r1, [sp]
	ldr	r3, .L1110+76
	ldr	r2, .L1110+84
	bl	dprint_normal
	b	.L1091
.L1097:
	ldr	r2, .L1110+88
	movw	r1, #2643
	mov	r0, #1
	bl	dprint_normal
	b	.L1091
.L1019:
	ldr	r2, .L1110+92
	movw	r1, #2898
	mov	r0, #3
	mvn	r7, #0
	bl	dprint_normal
	b	.L1091
.L1102:
	ldr	r2, .L1110+96
	movw	r1, #2714
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r6
	bl	MP4_ClearCurPic
	mov	r0, r6
	bl	MP4_Clean_HeadPacket
	b	.L1091
.L1034:
	ldr	r1, [r4, #2452]
	mvn	r7, #0
	ldr	r0, [r4, #2424]
	bl	FSP_ClearLogicFs
	mov	r0, r6
	bl	MP4_ClearCurPic
	mov	r0, r6
	bl	MP4_Clean_HeadPacket
	movw	r3, #2760
	mov	r1, r3
	str	r3, [sp]
	ldr	r2, .L1110+84
	mov	r0, #1
	ldr	r3, .L1110+76
	bl	dprint_normal
	b	.L1091
.L1111:
	.align	2
.L1110:
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_EventReportFunc
	.word	.LC83
	.word	.LC80
	.word	.LC64
	.word	.LC85
	.word	.LC84
	.word	.LANCHOR1+1372
	.word	.LC79
	.word	.LC82
	.word	.LC77
	.word	.LC81
	.word	.LC78
	UNWIND(.fnend)
	.size	MPEG4DEC_Decode, .-MPEG4DEC_Decode
	.global	sprite_trajectory_len
	.global	default_inter_matrix
	.global	default_intra_matrix
	.global	scan_tables
	.section	.rodata
	.align	2
.LANCHOR1 = . + 0
	.type	default_intra_matrix, %object
	.size	default_intra_matrix, 256
default_intra_matrix:
	.word	8
	.word	17
	.word	18
	.word	19
	.word	21
	.word	23
	.word	25
	.word	27
	.word	17
	.word	18
	.word	19
	.word	21
	.word	23
	.word	25
	.word	27
	.word	28
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	26
	.word	28
	.word	30
	.word	21
	.word	22
	.word	23
	.word	24
	.word	26
	.word	28
	.word	30
	.word	32
	.word	22
	.word	23
	.word	24
	.word	26
	.word	28
	.word	30
	.word	32
	.word	35
	.word	23
	.word	24
	.word	26
	.word	28
	.word	30
	.word	32
	.word	35
	.word	38
	.word	25
	.word	26
	.word	28
	.word	30
	.word	32
	.word	35
	.word	38
	.word	41
	.word	27
	.word	28
	.word	30
	.word	32
	.word	35
	.word	38
	.word	41
	.word	45
	.type	default_inter_matrix, %object
	.size	default_inter_matrix, 256
default_inter_matrix:
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	26
	.word	27
	.word	20
	.word	21
	.word	22
	.word	23
	.word	25
	.word	26
	.word	27
	.word	28
	.word	21
	.word	22
	.word	23
	.word	24
	.word	26
	.word	27
	.word	28
	.word	30
	.word	22
	.word	23
	.word	24
	.word	26
	.word	27
	.word	28
	.word	30
	.word	31
	.word	23
	.word	24
	.word	25
	.word	27
	.word	28
	.word	30
	.word	31
	.word	33
	.type	scan_tables, %object
	.size	scan_tables, 768
scan_tables:
	.word	0
	.word	1
	.word	8
	.word	16
	.word	9
	.word	2
	.word	3
	.word	10
	.word	17
	.word	24
	.word	32
	.word	25
	.word	18
	.word	11
	.word	4
	.word	5
	.word	12
	.word	19
	.word	26
	.word	33
	.word	40
	.word	48
	.word	41
	.word	34
	.word	27
	.word	20
	.word	13
	.word	6
	.word	7
	.word	14
	.word	21
	.word	28
	.word	35
	.word	42
	.word	49
	.word	56
	.word	57
	.word	50
	.word	43
	.word	36
	.word	29
	.word	22
	.word	15
	.word	23
	.word	30
	.word	37
	.word	44
	.word	51
	.word	58
	.word	59
	.word	52
	.word	45
	.word	38
	.word	31
	.word	39
	.word	46
	.word	53
	.word	60
	.word	61
	.word	54
	.word	47
	.word	55
	.word	62
	.word	63
	.word	0
	.word	1
	.word	2
	.word	3
	.word	8
	.word	9
	.word	16
	.word	17
	.word	10
	.word	11
	.word	4
	.word	5
	.word	6
	.word	7
	.word	15
	.word	14
	.word	13
	.word	12
	.word	19
	.word	18
	.word	24
	.word	25
	.word	32
	.word	33
	.word	26
	.word	27
	.word	20
	.word	21
	.word	22
	.word	23
	.word	28
	.word	29
	.word	30
	.word	31
	.word	34
	.word	35
	.word	40
	.word	41
	.word	48
	.word	49
	.word	42
	.word	43
	.word	36
	.word	37
	.word	38
	.word	39
	.word	44
	.word	45
	.word	46
	.word	47
	.word	50
	.word	51
	.word	56
	.word	57
	.word	58
	.word	59
	.word	52
	.word	53
	.word	54
	.word	55
	.word	60
	.word	61
	.word	62
	.word	63
	.word	0
	.word	8
	.word	16
	.word	24
	.word	1
	.word	9
	.word	2
	.word	10
	.word	17
	.word	25
	.word	32
	.word	40
	.word	48
	.word	56
	.word	57
	.word	49
	.word	41
	.word	33
	.word	26
	.word	18
	.word	3
	.word	11
	.word	4
	.word	12
	.word	19
	.word	27
	.word	34
	.word	42
	.word	50
	.word	58
	.word	35
	.word	43
	.word	51
	.word	59
	.word	20
	.word	28
	.word	5
	.word	13
	.word	6
	.word	14
	.word	21
	.word	29
	.word	36
	.word	44
	.word	52
	.word	60
	.word	37
	.word	45
	.word	53
	.word	61
	.word	22
	.word	30
	.word	7
	.word	15
	.word	23
	.word	31
	.word	38
	.word	46
	.word	54
	.word	62
	.word	39
	.word	47
	.word	55
	.word	63
	.type	__func__.10153, %object
	.size	__func__.10153, 14
__func__.10153:
	.ascii	"MP4_FrameInit\000"
	.space	2
	.type	__FUNCTION__.10195, %object
	.size	__FUNCTION__.10195, 15
__FUNCTION__.10195:
	.ascii	"Mp4_Set_DecPar\000"
	.space	1
	.type	__FUNCTION__.10316, %object
	.size	__FUNCTION__.10316, 23
__FUNCTION__.10316:
	.ascii	"Mp4_Syntax_Slice_NotSH\000"
	.space	1
	.type	__FUNCTION__.10330, %object
	.size	__FUNCTION__.10330, 20
__FUNCTION__.10330:
	.ascii	"Mp4_Syntax_Slice_SH\000"
	.type	__FUNCTION__.10345, %object
	.size	__FUNCTION__.10345, 14
__FUNCTION__.10345:
	.ascii	"MP4_Dec_Slice\000"
	.space	2
	.type	__FUNCTION__.10223, %object
	.size	__FUNCTION__.10223, 16
__FUNCTION__.10223:
	.ascii	"MPEG4DEC_Decode\000"
	.data
	.align	2
.LANCHOR0 = . + 0
	.type	sprite_trajectory_len, %object
	.size	sprite_trajectory_len, 120
sprite_trajectory_len:
	.word	0
	.byte	2
	.space	3
	.word	2
	.byte	3
	.space	3
	.word	3
	.byte	3
	.space	3
	.word	4
	.byte	3
	.space	3
	.word	5
	.byte	3
	.space	3
	.word	6
	.byte	3
	.space	3
	.word	14
	.byte	4
	.space	3
	.word	30
	.byte	5
	.space	3
	.word	62
	.byte	6
	.space	3
	.word	126
	.byte	7
	.space	3
	.word	254
	.byte	8
	.space	3
	.word	510
	.byte	9
	.space	3
	.word	1022
	.byte	10
	.space	3
	.word	2046
	.byte	11
	.space	3
	.word	4094
	.byte	12
	.space	3
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"fatal stream error --- GOP marker_bit = 0\012\000" )
	.space	1
.LC1:
	ASCII(.ascii	"DivX%4dBuild%4d%c\000" )
	.space	2
.LC2:
	ASCII(.ascii	"DivX%4db%4d%c\000" )
	.space	2
.LC3:
	ASCII(.ascii	"FFmpe%*[^b]b%4d\000" )
.LC4:
	ASCII(.ascii	"FFmpeg v%4d.%4d.%4d / libavcodec build: %d\000" )
	.space	1
.LC5:
	ASCII(.ascii	"Lavc%d.%d.%d\000" )
	.space	3
.LC6:
	ASCII(.ascii	"ffmpeg\000" )
	.space	1
.LC7:
	ASCII(.ascii	"XviD%4d\000" )
.LC8:
	ASCII(.ascii	"fatal stream error --- VOP marker_bit = 0\012\000" )
	.space	1
.LC9:
	ASCII(.ascii	"VDH doesn't support SPRITE_STATIC\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"Unknown sprite_enable\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"ERROR: not_8_bit !=0\012\000" )
	.space	2
.LC12:
	ASCII(.ascii	"not support no complexity_estimation_disable\012\000" )
	.space	2
.LC13:
	ASCII(.ascii	"not support data_partitioned\012\000" )
	.space	2
.LC14:
	ASCII(.ascii	"not support newpred_enable\012\000" )
.LC15:
	ASCII(.ascii	"not support reduced_resolution_vop_eanble\012\000" )
	.space	1
.LC16:
	ASCII(.ascii	"not support scalability\012\000" )
	.space	3
.LC17:
	ASCII(.ascii	"warning! profile_and_level_indication=%#x, maybe HD" )
	ASCII(.ascii	" pic...\012\000" )
.LC18:
	ASCII(.ascii	"%s arrange fs pool failed!\012\000" )
.LC19:
	ASCII(.ascii	"Chan:%d dec_pts: %lld Usertag: %lld\012\000" )
	.space	3
.LC20:
	ASCII(.ascii	"mp4 coding type %d get frame store failed!\012\000" )
.LC21:
	ASCII(.ascii	"%s %d  abnormal!\012\000" )
	.space	2
.LC22:
	ASCII(.ascii	"CurFsID(fwd%d,%d,bwd%d) abnormal!(%p,%p)\012\000" )
	.space	2
.LC23:
	ASCII(.ascii	"MPEG4DEC Init  -----\012\000" )
	.space	2
.LC24:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC25:
	ASCII(.ascii	"MPEG4DEC Init success -----\012\000" )
	.space	3
.LC26:
	ASCII(.ascii	"line: %d pCur = %p, pFwd = %p\012\000" )
	.space	1
.LC27:
	ASCII(.ascii	"CurFs(f%d,c%d,b%d) abnormal!(%p)\012\000" )
	.space	2
.LC28:
	ASCII(.ascii	"vop_coding_type = %d is not expected!\012\000" )
	.space	1
.LC29:
	ASCII(.ascii	" slice num %d is not extpected!\012\000" )
	.space	3
.LC30:
	ASCII(.ascii	" line %d packet is wrong!\012\000" )
	.space	1
.LC31:
	ASCII(.ascii	"pImg is null, pCurImg %#x pBwdImg %#x\012\000" )
	.space	1
.LC32:
	ASCII(.ascii	"line: %d pToQueImg is null!\012\000" )
	.space	3
.LC33:
	ASCII(.ascii	"CurImage %d is already out put\012\000" )
.LC34:
	ASCII(.ascii	"err(%d) > out_thr(%d)\012\000" )
	.space	1
.LC35:
	ASCII(.ascii	"StreamIDNum = %d > (%d)\012\000" )
	.space	3
.LC36:
	ASCII(.ascii	"Warning : vop slice num %d != 0\012\000" )
	.space	3
.LC37:
	ASCII(.ascii	"warning streamIDNum %d != 0 \012\000" )
	.space	2
.LC38:
	ASCII(.ascii	"vop ---%d\012\000" )
	.space	1
.LC39:
	ASCII(.ascii	"parse time_module_base stream not enough\012\000" )
	.space	2
.LC40:
	ASCII(.ascii	"module time base parse error, more than %d '1' was " )
	ASCII(.ascii	"found!\012\000" )
	.space	1
.LC41:
	ASCII(.ascii	"error: vop_coding_type = %d, but vop_fcode_forward " )
	ASCII(.ascii	"= 0\012\000" )
.LC42:
	ASCII(.ascii	"error: B vop, but vop_fcode_backward = 0\012\000" )
	.space	2
.LC43:
	ASCII(.ascii	"FUN: %s Invalid SlcNum = %d\012\000" )
	.space	3
.LC44:
	ASCII(.ascii	" pSlcPara->mb_start_num = %d, MbCnt = %d\012\000" )
	.space	2
.LC45:
	ASCII(.ascii	"pSlcPara->mb_start_num = %d, totalMbMin1 = %d\012\000" )
	.space	1
.LC46:
	ASCII(.ascii	"FUN: %s MP4_ClearCurPacket\012\000" )
.LC47:
	ASCII(.ascii	"pCtx is NUL!!!\012\000" )
.LC48:
	ASCII(.ascii	"Not find start code \012\000" )
	.space	2
.LC49:
	ASCII(.ascii	"VOS beginning ~ !\012\000" )
	.space	1
.LC50:
	ASCII(.ascii	"VO beginning ~ !\012\000" )
	.space	2
.LC51:
	ASCII(.ascii	"VOL beginning ~ !\012\000" )
	.space	1
.LC52:
	ASCII(.ascii	"GOP beginning ~ !\012\000" )
	.space	1
.LC53:
	ASCII(.ascii	"VOP beginning ~ !\012\000" )
	.space	1
.LC54:
	ASCII(.ascii	"BitUsed=%d\012\000" )
.LC55:
	ASCII(.ascii	"SHVOP beginning ~ !\012\000" )
	.space	3
.LC56:
	ASCII(.ascii	"USERDATA beginning ~ !\012\000" )
.LC57:
	ASCII(.ascii	"MPEG4 Frame_Init return err 3!\012\000" )
.LC58:
	ASCII(.ascii	"MPEG4 Frame_Init return err 1!\012\000" )
.LC59:
	ASCII(.ascii	"vop right\012\000" )
	.space	1
.LC60:
	ASCII(.ascii	"MPEG4 Frame_Init return err 2!\012\000" )
.LC61:
	ASCII(.ascii	"bits over boundary\012\000" )
.LC62:
	ASCII(.ascii	"pLastPacket->StreamPack[0].VirAddr is NULL!!\012\000" )
	.space	2
.LC63:
	ASCII(.ascii	"line %d MP4_Combine_HdPacket failed!!\012\000" )
	.space	1
.LC64:
	ASCII(.ascii	"bitsream para error -----\012\000" )
	.space	1
.LC65:
	ASCII(.ascii	"MPEG4DEC Decode -----\012\000" )
	.space	1
.LC66:
	ASCII(.ascii	"ptr_strm_para->PhyAddr0=0x%x\012\000" )
	.space	2
.LC67:
	ASCII(.ascii	"ptr_strm_para->Length0=%d\012\000" )
	.space	1
.LC68:
	ASCII(.ascii	"ptr_strm_para->IsLastSeg0=%d\012\000" )
	.space	2
.LC69:
	ASCII(.ascii	"ptr_strm_para->PhyAddr1=0x%x\012\000" )
	.space	2
.LC70:
	ASCII(.ascii	"ptr_strm_para->Length1=%d\012\000" )
	.space	1
.LC71:
	ASCII(.ascii	"ptr_strm_para->IsLastSeg1=%d\012\000" )
	.space	2
.LC72:
	ASCII(.ascii	"ptr_strm_para->Length0 = %d\012\000" )
	.space	3
.LC73:
	ASCII(.ascii	"byte0: = 0x%x\012\000" )
	.space	1
.LC74:
	ASCII(.ascii	"byte1: = 0x%x\012\000" )
	.space	1
.LC75:
	ASCII(.ascii	"byte2: = 0x%x\012\000" )
	.space	1
.LC76:
	ASCII(.ascii	"byte3: = 0x%x\012\000" )
	.space	1
.LC77:
	ASCII(.ascii	"MP4_Check_CurPacket failed!\012\000" )
	.space	3
.LC78:
	ASCII(.ascii	"Mp4_Frame_Atr return fail\012\000" )
	.space	1
.LC79:
	ASCII(.ascii	"fuction return value is null, %s %d!!\012\000" )
	.space	1
.LC80:
	ASCII(.ascii	"MP4_PrepareNvopDecparam failed.\012\000" )
	.space	3
.LC81:
	ASCII(.ascii	"bits not enought\012\000" )
	.space	2
.LC82:
	ASCII(.ascii	"fuction return value is null,%s %d!!\012\000" )
	.space	2
.LC83:
	ASCII(.ascii	"dec P/S frame, fwd ref err(%d) > ref_thr(%d)\012\000" )
	.space	2
.LC84:
	ASCII(.ascii	"dec B frame, bwd ref err(%d) > ref_thr(%d)\012\000" )
.LC85:
	ASCII(.ascii	"dec B frame, fwd ref err(%d) > ref_thr(%d)\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
