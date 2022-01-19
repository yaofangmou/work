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
	.file	"bitstream.c"
	.text
	.align	2
	.global	ZerosMS_32
	.type	ZerosMS_32, %function
ZerosMS_32:
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
	ldr	ip, .L10
	mov	r2, r0
	ldrb	r0, [ip, r0, lsr #24]	@ zero_extendqisi2
	cmp	r0, #8
	moveq	r2, r2, asl #8
	moveq	r1, #3
	bne	.L9
.L4:
	ldrb	r3, [ip, r2, lsr #24]	@ zero_extendqisi2
	mov	r2, r2, asl #8
	cmp	r3, #8
	add	r0, r0, r3
	ldmnefd	sp, {fp, sp, pc}
	subs	r1, r1, #1
	bne	.L4
	ldmfd	sp, {fp, sp, pc}
.L9:
	ldmfd	sp, {fp, sp, pc}
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	ZerosMS_32, .-ZerosMS_32
	.align	2
	.global	BsInit
	.type	BsInit, %function
BsInit:
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
	bic	r3, r1, #3
	str	r2, [r0, #16]
	add	lr, r3, #8
	str	r3, [r0]
	str	lr, [r0, #4]
	and	r1, r1, #3
	ldr	r2, [r3]
	mov	ip, #0
	mov	r1, r1, asl #3
	rev	r2, r2
	str	r2, [r0, #8]
	ldr	r3, [r3, #4]
	str	r1, [r0, #20]
	rev	r3, r3
	str	ip, [r0, #24]
	str	r3, [r0, #12]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	BsInit, .-BsInit
	.align	2
	.global	BsPos
	.type	BsPos, %function
BsPos:
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
	ldr	r0, [r0, #24]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	BsPos, .-BsPos
	.align	2
	.global	BsGet
	.type	BsGet, %function
BsGet:
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
	clz	r3, r1
	ldr	lr, [r0, #20]
	mov	r2, r0
	mov	r3, r3, lsr #5
	add	r4, r1, lr
	cmp	r1, #32
	orrgt	r3, r3, #1
	cmp	lr, #31
	orrhi	r3, r3, #1
	cmp	r3, #0
	movne	r0, #0
	bne	.L15
	cmp	r4, #32
	ldr	ip, [r2, #8]
	ble	.L16
	ldr	r0, [r2, #12]
	cmp	lr, #0
	rsbne	r3, lr, #32
	mov	ip, ip, asl lr
	moveq	r0, lr
	movne	r0, r0, lsr r3
	rsb	r3, r1, #32
	orr	r0, r0, ip
	mov	r0, r0, lsr r3
.L15:
	ldr	ip, [r2, #24]
	ldr	r3, [r2, #16]
	add	r1, r1, ip
	str	r1, [r2, #24]
	cmp	r1, r3, asl #3
	ldmcsfd	sp, {r4, fp, sp, pc}
	cmp	r4, #31
	strle	r4, [r2, #20]
	subgt	r4, r4, #32
	strgt	r4, [r2, #20]
	ldrgt	r1, [r2, #12]
	ldrgt	r3, [r2, #4]
	strgt	r1, [r2, #8]
	ldrgt	r1, [r3], #4
	revgt	r1, r1
	strgt	r3, [r2, #4]
	strgt	r1, [r2, #12]
	ldmfd	sp, {r4, fp, sp, pc}
.L16:
	mov	r3, ip, asl lr
	rsb	r0, r1, #32
	mov	r0, r3, lsr r0
	b	.L15
	UNWIND(.fnend)
	.size	BsGet, .-BsGet
	.align	2
	.global	BsShow
	.type	BsShow, %function
BsShow:
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
	clz	r3, r1
	ldr	ip, [r0, #20]
	mov	r3, r3, lsr #5
	cmp	r1, #32
	orrgt	r3, r3, #1
	cmp	ip, #31
	orrhi	r3, r3, #1
	cmp	r3, #0
	bne	.L28
	add	r3, ip, r1
	ldr	r2, [r0, #8]
	cmp	r3, #32
	ble	.L25
	ldr	r0, [r0, #12]
	cmp	ip, #0
	rsbne	r3, ip, #32
	mov	r2, r2, asl ip
	moveq	r0, ip
	rsb	r1, r1, #32
	movne	r0, r0, lsr r3
	orr	r0, r0, r2
	mov	r0, r0, lsr r1
	ldmfd	sp, {fp, sp, pc}
.L28:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L25:
	mov	r3, r2, asl ip
	rsb	r1, r1, #32
	mov	r0, r3, lsr r1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	BsShow, .-BsShow
	.align	2
	.global	BsSkip
	.type	BsSkip, %function
BsSkip:
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
	ldr	r2, [r0, #24]
	ldr	r0, [r0, #16]
	add	r2, r1, r2
	ldr	ip, [r3, #20]
	str	r2, [r3, #24]
	cmp	r2, r0, asl #3
	bcs	.L31
	add	r2, ip, r1
	cmp	r2, #31
	strle	r2, [r3, #20]
	subgt	r2, r2, #32
	strgt	r2, [r3, #20]
	ldrgt	ip, [r3, #12]
	ldrgt	r0, [r3, #4]
	strgt	ip, [r3, #8]
	ldrgt	r2, [r0], #4
	revgt	r2, r2
	strgt	r0, [r3, #4]
	strgt	r2, [r3, #12]
.L31:
	mov	r0, r1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	BsSkip, .-BsSkip
	.align	2
	.global	BsBack
	.type	BsBack, %function
BsBack:
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
	ldr	r2, [r0, #24]
	mov	r3, r0
	ldr	r0, [r0, #20]
	mov	ip, r1
	cmp	r1, r2
	movhi	r1, r2
	movhi	ip, r2
	subs	r0, r0, r1
	rsb	r2, ip, r2
	strpl	r0, [r3, #20]
	str	r2, [r3, #24]
	bpl	.L36
	ldr	r2, [r3, #4]
	add	r0, r0, #32
	ldr	ip, [r3, #8]
	sub	lr, r2, #4
	str	lr, [r3, #4]
	str	ip, [r3, #12]
	ldr	r2, [r2, #-12]
	str	r0, [r3, #20]
	rev	r2, r2
	str	r2, [r3, #8]
.L36:
	mov	r0, r1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	BsBack, .-BsBack
	.align	2
	.global	BsBitsToNextByte
	.type	BsBitsToNextByte, %function
BsBitsToNextByte:
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
	ldr	r0, [r0, #24]
	add	r3, r0, #7
	bic	r3, r3, #7
	rsb	r0, r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	BsBitsToNextByte, .-BsBitsToNextByte
	.align	2
	.global	BsToNextByte
	.type	BsToNextByte, %function
BsToNextByte:
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
	ldr	ip, [r0, #24]
	ldr	lr, [r0, #16]
	add	r2, ip, #7
	ldr	r1, [r0, #20]
	bic	r3, r2, #7
	str	r3, [r0, #24]
	cmp	r3, lr, asl #3
	rsb	r3, ip, r3
	bcs	.L39
	add	r2, r3, r1
	cmp	r2, #31
	strle	r2, [r0, #20]
	subgt	r2, r2, #32
	strgt	r2, [r0, #20]
	ldrgt	ip, [r0, #12]
	ldrgt	r1, [r0, #4]
	strgt	ip, [r0, #8]
	ldrgt	r2, [r1], #4
	revgt	r2, r2
	strgt	r1, [r0, #4]
	strgt	r2, [r0, #12]
.L39:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	BsToNextByte, .-BsToNextByte
	.align	2
	.global	BsResidBits
	.type	BsResidBits, %function
BsResidBits:
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
	ldr	r2, [r0, #16]
	ldr	r0, [r0, #24]
	rsb	r0, r0, r2, lsl #3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	BsResidBits, .-BsResidBits
	.align	2
	.global	BsIsByteAligned
	.type	BsIsByteAligned, %function
BsIsByteAligned:
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
	ldr	r3, [r0, #24]
	tst	r3, #7
	moveq	r0, #1
	movne	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	BsIsByteAligned, .-BsIsByteAligned
	.align	2
	.global	BsLongSkip
	.type	BsLongSkip, %function
BsLongSkip:
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
	cmp	r1, #0
	beq	.L44
	cmp	r1, #64
	bgt	.L45
	ldr	r2, [r0, #16]
	cmp	r1, #32
	ldr	r3, [r0, #24]
	ldr	ip, [r0, #20]
	mov	r2, r2, asl #3
	bgt	.L56
.L47:
	add	r3, r1, r3
	str	r3, [r0, #24]
	cmp	r2, r3
	bls	.L44
	add	ip, r1, ip
	cmp	ip, #31
	strle	ip, [r0, #20]
	subgt	ip, ip, #32
	strgt	ip, [r0, #20]
	ldrgt	r2, [r0, #12]
	ldrgt	r3, [r0, #4]
	strgt	r2, [r0, #8]
	ldrgt	r2, [r3], #4
	revgt	r2, r2
	strgt	r3, [r0, #4]
	strgt	r2, [r0, #12]
.L44:
	mov	r0, r1
	ldmfd	sp, {r4, fp, sp, pc}
.L45:
	ldr	r3, [r0, #20]
	mov	ip, #0
	str	ip, [r0, #20]
	rsb	r2, r3, #32
	ldr	r3, [r0, #24]
	rsb	r1, r2, r1
	ldr	lr, [r0, #4]
	cmp	r1, #0
	add	ip, r1, #31
	add	r3, r2, r3
	str	r3, [r0, #24]
	movlt	r2, ip
	movge	r2, r1
	mov	r2, r2, asr #5
	ands	r4, r1, #31
	sub	ip, r2, #-1073741823
	add	r3, r3, r2, lsl #5
	add	r2, lr, ip, lsl #2
	str	r2, [r0, #4]
	ldr	ip, [lr, ip, asl #2]
	add	lr, r2, #4
	str	lr, [r0, #4]
	add	lr, r2, #8
	rev	ip, ip
	str	ip, [r0, #8]
	ldr	r2, [r2, #4]
	str	lr, [r0, #4]
	rev	r2, r2
	streq	r3, [r0, #24]
	str	r2, [r0, #12]
	beq	.L44
	ldr	r2, [r0, #16]
	add	r3, r3, r4
	str	r3, [r0, #24]
	cmp	r3, r2, asl #3
	strcc	r4, [r0, #20]
	b	.L44
.L56:
	add	r3, r3, #32
	str	r3, [r0, #24]
	cmp	r3, r2
	bcs	.L48
	add	lr, ip, #32
	cmp	lr, #31
	strle	lr, [r0, #20]
	ldrgt	r4, [r0, #12]
	movle	ip, lr
	ldrgt	lr, [r0, #4]
	strgt	r4, [r0, #8]
	ldrgt	r4, [lr], #4
	revgt	r4, r4
	strgt	lr, [r0, #4]
	strgt	r4, [r0, #12]
.L48:
	sub	r1, r1, #32
	b	.L47
	UNWIND(.fnend)
	.size	BsLongSkip, .-BsLongSkip
	.align	2
	.global	BsGetNextBytePtr
	.type	BsGetNextBytePtr, %function
BsGetNextBytePtr:
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
	ldr	r3, [r0, #20]
	ldr	r0, [r0, #4]
	rsb	r3, r3, #32
	add	r2, r3, #7
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #3
	add	r3, r3, #4
	rsb	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	BsGetNextBytePtr, .-BsGetNextBytePtr
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	CalcZeroNum, %object
	.size	CalcZeroNum, 256
CalcZeroNum:
	.byte	8
	.byte	7
	.byte	6
	.byte	6
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
