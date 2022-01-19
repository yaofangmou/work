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
	.file	"pq_mng_dm_alg.c"
	.text
	.align	2
	.global	DM_Init
	.type	DM_Init, %function
DM_Init:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r8, .L2
	mov	r5, r3
	add	r3, r3, #8
	mov	r6, #0
	mov	r7, r0
	str	r3, [r5, #140]
	mov	r0, r3
	str	r6, [r5]
	str	r6, [r5, #4]
	mov	r1, r6
	mov	r2, #128
	add	r4, r5, #4096
	bl	pq_alg_memset
	mov	r3, #1
	add	r0, r5, #146
	strb	r3, [r5, #144]
	strb	r3, [r5, #145]
	mov	r1, r8
	mov	r2, #6
	str	r2, [r5, #136]
	mov	r2, #14
	add	r10, r4, #656
	bl	pq_alg_memcpy
	add	r1, r8, #16
	add	r0, r5, #160
	mov	r2, #176
	bl	pq_alg_memcpy
	mov	r1, r6
	add	r0, r5, #336
	mov	r2, #1440
	bl	pq_alg_memset
	mov	r1, r6
	add	r0, r5, #1776
	mov	r2, #1440
	bl	pq_alg_memset
	mov	r1, r6
	add	r0, r5, #3216
	mov	r2, #1440
	bl	pq_alg_memset
	add	r0, r5, #4608
	mov	r1, r6
	add	r0, r0, #48
	mov	r2, #90
	movw	r8, #21846
	bl	pq_alg_memset
	ldr	r2, [r7, #12]
	movw	ip, #650
	movt	r8, 21845
	adds	r3, r2, #9
	add	r1, r4, #652
	addmi	r3, r2, #24
	add	r0, r5, #4736
	movw	lr, #654
	add	r5, r4, #660
	mov	r3, r3, asr #4
	strh	r3, [r4, ip]
	ldr	ip, [r7, #8]
	add	r0, r0, #44
	uxth	r3, r3
	adds	r2, ip, #33
	addmi	r2, ip, #96
	mov	ip, #5
	ubfx	r2, r2, #6, #16
	strh	r2, [r1]
	strh	ip, [r4, lr]
	add	lr, r4, #664
	mul	r3, r2, r3
	add	r1, r4, #668
	mov	r2, r2, lsr #1
	mov	r3, r3, asl #1
	smull	r8, r9, r3, r8
	add	r8, r4, #672
	sub	r3, r9, r3, asr #31
	mov	r9, #30
	strh	r9, [r10]
	movw	r10, #658
	mov	r9, #2
	strh	r9, [r4, r10]
	mov	r10, #256
	strh	r10, [r5]
	movw	r10, #662
	add	r5, r4, #676
	strh	r9, [r4, r10]
	mov	r10, #20
	strh	r10, [lr]
	movw	lr, #666
	strh	r2, [r4, lr]
	movw	lr, #670
	strh	r9, [r1]
	movw	r1, #674
	strh	r3, [r4, lr]
	movw	r3, #678
	strh	r9, [r8]
	add	r8, r4, #680
	strh	ip, [r4, r1]
	movw	lr, #682
	strh	r9, [r5]
	mov	r1, r6
	strh	r2, [r4, r3]
	mov	r2, #300
	ldr	r3, [r7, #12]
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	strh	r3, [r8]
	strh	ip, [r4, lr]
	add	r4, r4, #984
	bl	pq_alg_memset
	mov	r0, r6
	strh	r6, [r4]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	DM_Init, .-DM_Init
	.align	2
	.global	DM_InitOutputReg
	.type	DM_InitOutputReg, %function
DM_InitOutputReg:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldrh	r3, [r0, #4]
	mov	r5, r1
	mov	r4, r0
	add	r1, r0, #26
	mov	r2, #62
	add	r0, r5, #22
	strh	r3, [r5]
	ldrh	r3, [r4, #6]
	strh	r3, [r5, #2]
	ldrh	r3, [r4, #8]
	strh	r3, [r5, #4]
	ldrh	r3, [r4, #10]
	strh	r3, [r5, #6]
	ldrb	r3, [r4, #12]
	strb	r3, [r5, #8]
	ldrb	r3, [r4, #13]
	strb	r3, [r5, #9]
	ldrh	r3, [r4, #14]
	strh	r3, [r5, #10]
	ldrh	r3, [r4, #16]
	strh	r3, [r5, #12]
	ldrh	r3, [r4, #18]
	strh	r3, [r5, #14]
	ldrh	r3, [r4, #20]
	strh	r3, [r5, #16]
	ldrb	r3, [r4, #22]
	strb	r3, [r5, #18]
	ldrb	r3, [r4, #23]
	strb	r3, [r5, #19]
	ldrb	r3, [r4, #24]
	strb	r3, [r5, #20]
	bl	pq_alg_memcpy
	ldrh	r3, [r4, #88]
	ldr	ip, .L5
	add	r1, r4, #108
	add	r0, r5, #102
	mov	r2, #300
	strh	r3, [r5, #84]
	ldrh	r3, [r4, #90]
	ldr	ip, [ip, #192]
	strh	r3, [r5, #86]
	ldrb	r3, [r4, #92]
	strb	r3, [r5, #88]
	ldrb	r3, [r4, #93]
	strb	r3, [r5, #89]
	ldrb	r3, [r4, #94]
	strb	r3, [r5, #90]
	ldrh	r3, [r4, #96]
	strh	r3, [r5, #92]
	ldrh	r3, [r4, #98]
	strh	r3, [r5, #94]
	ldrh	r3, [r4, #100]
	strh	r3, [r5, #96]
	ldrh	r3, [r4, #102]
	add	r4, r4, #408
	strb	ip, [r5, #100]
	strh	r3, [r5, #98]
	bl	pq_alg_memcpy
	ldrh	r2, [r4]
	movw	r3, #402
	mov	r0, #0
	strh	r2, [r5, r3]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	DM_InitOutputReg, .-DM_InitOutputReg
	.align	2
	.global	DM_sort_cxp
	.type	DM_sort_cxp, %function
DM_sort_cxp:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	sub	r1, r1, #1
	cmp	r1, #0
	ble	.L19
	mov	r8, #0
	mov	r9, r8
.L12:
	rsb	r8, r8, r1
	cmp	r8, #0
	movgt	r3, #0
	movgt	ip, r3
	ble	.L14
.L11:
	mov	r2, ip, asl #1
	add	r3, r3, #1
	add	r4, r2, #2
	ldrh	r5, [r0, r2]
	uxth	r3, r3
	ldrh	lr, [r0, r4]
	sxth	ip, r3
	sxth	r7, r5
	sxth	r6, lr
	cmp	r7, r6
	strgth	r5, [r0, r4]
	strgth	lr, [r0, r2]
	cmp	ip, r8
	blt	.L11
.L14:
	add	r9, r9, #1
	uxth	r9, r9
	sxth	r8, r9
	cmp	r8, r1
	blt	.L12
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L19:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	DM_sort_cxp, .-DM_sort_cxp
	.align	2
	.global	DM_GetMedian
	.type	DM_GetMedian, %function
DM_GetMedian:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r5, .L21
	mov	r6, r1, asl #1
	mov	r4, r1
	mov	r7, r0
	mov	r2, r6
	mov	r1, #0
	mov	r0, r5
	bl	pq_alg_memset
	mov	r2, r6
	mov	r1, r7
	mov	r0, r5
	bl	pq_alg_memcpy
	mov	r1, r4
	and	r4, r4, #254
	mov	r0, r5
	bl	DM_sort_cxp
	ldrsh	r0, [r5, r4]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	DM_GetMedian, .-DM_GetMedian
	.align	2
	.global	DM_MvUniCheck
	.type	DM_MvUniCheck, %function
DM_MvUniCheck:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldrh	ip, [fp, #4]
	add	r0, r0, #4096
	movw	lr, #654
	ldrsh	lr, [r0, lr]
	mov	ip, ip, asl #1
	ldrsh	r1, [r1, ip]
	cmp	lr, r1
	bgt	.L27
	add	lr, r0, #656
	ldrsh	lr, [lr]
	cmp	lr, r1
	blt	.L27
	movw	lr, #658
	ldrsh	r1, [r2, ip]
	ldrsh	r2, [r0, lr]
	cmp	r1, r2
	bgt	.L27
	add	r0, r0, #660
	ldrh	r3, [r3, ip]
	ldrsh	r0, [r0]
	cmp	r3, r0
	movlt	r0, #0
	movge	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L27:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	DM_MvUniCheck, .-DM_MvUniCheck
	.global	__aeabi_idiv
	.align	2
	.global	DM_DetRoSub_1st
	.type	DM_DetRoSub_1st, %function
DM_DetRoSub_1st:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #68)
	sub	sp, sp, #68
	add	r7, r0, #4096
	mov	r3, r0
	movw	r0, #650
	ldrh	r0, [r7, r0]
	add	ip, r7, #652
	add	r8, r3, #336
	str	r1, [fp, #-104]
	ldrh	r6, [ip]
	add	ip, r3, #1776
	str	ip, [fp, #-64]
	add	ip, r3, #3216
	add	r3, r3, #4608
	mov	r4, r0
	str	r0, [fp, #-88]
	mov	r5, r2
	str	r2, [fp, #-108]
	mov	r1, #0
	mov	r2, #8192
	ldr	r0, .L41
	mov	r9, r3
	str	ip, [fp, #-80]
	bl	pq_alg_memset
	cmp	r4, #0
	add	r3, r9, #48
	str	r3, [fp, #-84]
	mov	r3, #0
	strh	r3, [r5]
	ble	.L35
	mov	r5, r3
	movw	r3, #34079
	mov	r2, r5
	mov	r1, r3
	str	r5, [fp, #-76]
	mov	r3, r6, asl #1
	str	r5, [fp, #-68]
	movt	r1, 20971
	str	r3, [fp, #-92]
	uxtb	r3, r6
	str	r3, [fp, #-96]
	mov	r3, r5
	mov	r5, r6
	mov	r6, r2
	str	r1, [fp, #-100]
.L34:
	mul	r2, r5, r2
	mov	r3, r3, asl #1
	ldr	r0, .L41
	mov	r4, r3
	str	r3, [fp, #-72]
	mov	r1, r2
	str	r2, [fp, #-60]
	add	r1, r8, r1, lsl #1
	ldr	r2, [fp, #-92]
	bl	pq_alg_memcpy
	ldr	r1, [fp, #-96]
	ldr	r0, .L41
	bl	DM_GetMedian
	ldr	r1, [fp, #-84]
	add	r3, r7, #664
	cmp	r5, #0
	strh	r0, [r1, r4]
	eor	r1, r0, r0, asr #31
	ldrsh	r3, [r3]
	sub	r1, r1, r0, asr #31
	mul	r1, r3, r1
	ldr	r3, [fp, #-100]
	add	r1, r1, #50
	smull	r2, r3, r1, r3
	mov	r1, r1, asr #31
	rsb	r1, r1, r3, asr #5
	uxth	r1, r1
	ble	.L30
	add	r3, r7, #652
	sxth	r2, r1
	mov	r4, #0
	str	r2, [fp, #-52]
	ldrsh	r1, [r3, #2]
	mov	ip, r4
	str	r4, [fp, #-48]
	str	r4, [fp, #-56]
.L32:
	uxth	r2, r4
	add	r9, r7, #656
	add	r3, r2, r6
	add	r4, r4, #1
	add	r2, r2, #1
	uxth	r3, r3
	mov	r3, r3, asl #1
	ldrsh	lr, [r8, r3]
	cmp	lr, r1
	blt	.L31
	mov	r10, r9
	ldrsh	r9, [r9]
	add	r10, r10, #2
	cmp	r9, lr
	blt	.L31
	ldrsh	r9, [r10]
	ldr	r10, [fp, #-64]
	ldr	lr, [fp, #-60]
	ldrsh	r10, [r10, r3]
	add	ip, lr, ip
	add	lr, r7, #660
	cmp	r10, r9
	mov	ip, ip, asl #1
	bgt	.L31
	ldr	r9, [fp, #-80]
	ldrsh	lr, [lr]
	ldrh	r9, [r9, r3]
	ldr	r3, [fp, #-56]
	cmp	r9, lr
	add	r3, r3, #1
	blt	.L31
	ldrsh	lr, [r8, ip]
	ldr	r9, [fp, #-52]
	rsb	ip, r0, lr
	cmp	ip, #0
	rsblt	ip, ip, #0
	cmp	ip, r9
	uxthle	r3, r3
	strle	r3, [fp, #-56]
	ldrle	ip, [fp, #-48]
	addle	ip, ip, lr
	strle	ip, [fp, #-48]
.L31:
	sxth	ip, r2
	cmp	ip, r5
	blt	.L32
	add	r3, r7, #664
	ldr	r1, [fp, #-56]
	add	r3, r3, #2
	ldr	r0, [fp, #-76]
	ldrsh	r3, [r3]
	add	r2, r1, r0
	sxth	r1, r1
	cmp	r3, r1
	uxth	r2, r2
	str	r2, [fp, #-76]
	movle	r3, #1
	movgt	r3, #0
	cmp	r1, #0
	movle	r3, #0
	cmp	r3, #0
	beq	.L30
	ldr	r3, [fp, #-48]
	add	r0, r1, r1, lsr #31
	add	r0, r3, r0, asr #1
	bl	__aeabi_idiv
	ldr	r3, [fp, #-104]
	ldr	r2, [fp, #-72]
	strh	r0, [r3, r2]
.L33:
	ldr	r3, [fp, #-68]
	add	r2, r3, #1
	add	r3, r6, r5
	uxth	r2, r2
	uxth	r6, r3
	str	r2, [fp, #-68]
	sxth	r3, r2
	ldr	r2, [fp, #-88]
	cmp	r3, r2
	mov	r2, r3
	blt	.L34
.L29:
	ldr	r3, [fp, #-108]
	ldrh	r2, [fp, #-76]
	strh	r2, [r3]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L30:
	ldr	r2, [fp, #-104]
	mov	r3, #0
	ldr	r1, [fp, #-72]
	strh	r3, [r2, r1]
	b	.L33
.L35:
	str	r3, [fp, #-76]
	b	.L29
.L42:
	.align	2
.L41:
	.word	.LANCHOR2+8
	UNWIND(.fnend)
	.size	DM_DetRoSub_1st, .-DM_DetRoSub_1st
	.align	2
	.global	DM_GetMean
	.type	DM_GetMean, %function
DM_GetMean:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #0
	beq	.L46
	mov	ip, #0
	mov	r2, ip
	mov	r3, ip
.L45:
	add	r2, r2, #1
	mov	r3, r3, asl #1
	uxth	r2, r2
	ldrh	lr, [r0, r3]
	sxth	r3, r2
	add	ip, lr, ip
	cmp	r3, r1
	uxth	ip, ip
	blt	.L45
	sxth	r0, ip
.L44:
	add	r0, r0, r1, lsr #1
	bl	__aeabi_idiv
	sxth	r0, r0
	ldmfd	sp, {fp, sp, pc}
.L46:
	mov	r0, #0
	b	.L44
	UNWIND(.fnend)
	.size	DM_GetMean, .-DM_GetMean
	.align	2
	.global	DM_GetRoSubCoordX
	.type	DM_GetRoSubCoordX, %function
DM_GetRoSubCoordX:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	add	ip, r0, #4096
	rsb	lr, r2, r3
	str	ip, [fp, #-48]
	mov	r5, ip
	add	ip, ip, #676
	mov	r10, lr
	str	lr, [fp, #-52]
	ldrsh	lr, [ip]
	add	r4, r10, #1
	add	ip, r5, #652
	cmp	r4, lr
	add	r4, r0, #336
	ldrh	lr, [ip]
	blt	.L64
	movw	r0, #674
	mov	ip, r5
	ldrsh	r0, [r5, r0]
	cmp	r10, r0
	bge	.L64
	ldr	r6, [fp, #4]
	sub	r8, lr, #1
	add	r0, ip, #664
	eor	r5, r1, r1, asr #31
	uxth	r8, r8
	mov	ip, #0
	strh	r8, [r6]
	sub	r5, r5, r1, asr #31
	ldr	r6, [fp, #8]
	cmp	lr, ip
	strh	ip, [r6]
	movw	r6, #34079
	ldrsh	r0, [r0]
	movt	r6, 20971
	mul	r0, r0, r5
	add	r0, r0, #50
	smull	r6, r7, r0, r6
	mov	r0, r0, asr #31
	rsb	r9, r0, r7, asr #5
	uxth	r0, r9
	str	r0, [fp, #-56]
	mov	r6, r0
	ble	.L50
	add	r0, r10, r10, lsr #31
	sxth	r9, r6
	str	r8, [fp, #-60]
	mov	r7, ip
	mov	r0, r0, asr #1
	mov	r10, ip
	mov	r8, r0
.L51:
	cmp	r3, r2
	blt	.L65
	mov	r0, r2
	mov	r5, #0
.L53:
	mla	ip, lr, r0, r7
	add	r0, r0, #1
	add	r6, r5, #1
	sxth	r0, r0
	mov	ip, ip, asl #1
	ldrsh	ip, [r4, ip]
	rsb	ip, r1, ip
	cmp	ip, #0
	rsblt	ip, ip, #0
	cmp	ip, r9
	uxthle	r5, r6
	cmp	r3, r0
	bge	.L53
	cmp	r8, r5
	blt	.L70
.L54:
	add	r10, r10, #1
	uxth	r10, r10
	sxth	r7, r10
	cmp	r7, lr
	blt	.L51
	ldr	r8, [fp, #-60]
.L50:
	sxth	r7, r8
	cmp	r7, #0
	blt	.L56
	ldr	r0, [fp, #-52]
	ldrsh	r9, [fp, #-56]
	add	r10, r0, r0, lsr #31
	mov	r10, r10, asr #1
.L57:
	cmp	r3, r2
	blt	.L66
	mov	r0, r2
	mov	r5, #0
.L59:
	mla	ip, lr, r0, r7
	add	r0, r0, #1
	add	r6, r5, #1
	sxth	r0, r0
	mov	ip, ip, asl #1
	ldrsh	ip, [r4, ip]
	rsb	ip, r1, ip
	cmp	ip, #0
	rsblt	ip, ip, #0
	cmp	ip, r9
	uxthle	r5, r6
	cmp	r3, r0
	bge	.L59
	cmp	r10, r5
	blt	.L71
.L60:
	sub	r8, r8, #1
	uxth	r8, r8
	sxth	r7, r8
	cmp	r7, #0
	bge	.L57
.L56:
	ldr	r3, [fp, #8]
	ldrh	r8, [r3]
.L61:
	ldr	r3, [fp, #4]
	movw	r2, #678
	ldr	r1, [fp, #-48]
	ldrsh	r0, [r3]
	sxth	r3, r8
	ldrsh	r2, [r1, r2]
	rsb	r3, r0, r3
	cmp	r3, r2
	movge	r0, #0
	mvnlt	r0, #0
.L49:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L66:
	mov	r5, #0
	cmp	r10, r5
	bge	.L60
.L71:
	ldr	r3, [fp, #8]
	strh	r8, [r3]
	b	.L61
.L65:
	mov	r5, #0
	cmp	r8, r5
	bge	.L54
.L70:
	ldr	r0, [fp, #4]
	ldr	r8, [fp, #-60]
	strh	r10, [r0]
	b	.L50
.L64:
	mvn	r0, #0
	b	.L49
	UNWIND(.fnend)
	.size	DM_GetRoSubCoordX, .-DM_GetRoSubCoordX
	.align	2
	.global	DM_CoordXY2Pix
	.type	DM_CoordXY2Pix, %function
DM_CoordXY2Pix:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	add	r6, r1, #4096
	add	ip, r6, #984
	ldrsh	r9, [fp, #20]
	ldrsh	r8, [fp, #12]
	ldrh	r5, [ip]
	ldrsh	ip, [fp, #8]
	ldrsh	r10, [fp, #4]
	mov	r4, r5, asl #3
	ldrsh	r7, [fp, #16]
	str	ip, [fp, #-48]
	mov	ip, r5, asl #1
	add	lr, ip, r4
	add	lr, r1, lr
	add	lr, lr, #4736
	strh	r9, [lr, #52]
	ldr	lr, [r0, #8]
	cmp	lr, #0
	uxthgt	r2, lr
	add	lr, ip, r4
	mulle	r2, r2, r8
	add	lr, r1, lr
	add	lr, lr, #4736
	add	lr, lr, #40
	andle	r2, r2, r2, asr #31
	uxthle	r2, r2
	strh	r2, [lr, #4]
	ldr	r2, [r0, #12]
	cmp	r2, #0
	uxthgt	r10, r2
	add	r2, ip, r4
	mulle	r10, r10, r7
	add	r2, r1, r2
	add	r2, r2, #4736
	andle	r10, r10, r10, asr #31
	uxthle	r10, r10
	strh	r10, [r2, #46]
	ldr	r2, [r0, #8]
	cmp	r2, #0
	uxthgt	r3, r2
	add	r2, ip, r4
	mlale	r3, r3, r8, r8
	add	r2, r1, r2
	add	r2, r2, #4736
	add	ip, ip, r4
	add	r1, r1, ip
	add	r1, r1, #4736
	andle	r3, r3, r3, asr #31
	uxthle	r3, r3
	strh	r3, [r2, #48]
	ldr	r3, [r0, #12]
	cmp	r3, #0
	uxthgt	r3, r3
	ldrle	r3, [fp, #-48]
	mlale	r7, r3, r7, r7
	andle	r7, r7, r7, asr #31
	uxthle	r3, r7
	cmp	r5, #28
	addls	r6, r6, #984
	strh	r3, [r1, #50]
	addls	r5, r5, #1
	strlsh	r5, [r6]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	DM_CoordXY2Pix, .-DM_CoordXY2Pix
	.align	2
	.global	DM_CheckRoSub
	.type	DM_CheckRoSub, %function
DM_CheckRoSub:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r4, r0, #4096
	add	r3, r4, #984
	ldrh	r5, [r3]
	cmp	r5, #0
	ble	.L86
	mov	lr, #0
	mov	ip, lr
	mov	r2, lr
.L84:
	mov	r3, lr, asl #3
	add	ip, ip, #1
	add	r3, r3, lr, lsl #1
	add	r3, r0, r3
	uxth	ip, ip
	add	r3, r3, #4736
	add	r3, r3, #40
	sxth	lr, ip
	ldrh	r1, [r3, #10]
	ldrh	r3, [r3, #6]
	rsb	r1, r3, r1
	cmp	r1, #0
	rsblt	r1, r1, #0
	cmp	lr, r5
	add	r2, r2, r1
	uxth	r2, r2
	blt	.L84
.L83:
	add	r3, r4, #680
	ldrsh	r3, [r3]
	cmp	r3, r2
	ldmgefd	sp, {r4, r5, fp, sp, pc}
	add	r0, r0, #4736
	add	r4, r4, #984
	mov	r2, #300
	add	r0, r0, #44
	mov	r1, #0
	bl	pq_alg_memset
	mov	r3, #0
	strh	r3, [r4]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L86:
	mov	r2, #0
	b	.L83
	UNWIND(.fnend)
	.size	DM_CheckRoSub, .-DM_CheckRoSub
	.align	2
	.global	DM_DetRoSub
	.type	DM_DetRoSub, %function
DM_DetRoSub:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #52)
	sub	sp, sp, #52
	add	r8, r1, #4096
	movw	r2, #650
	add	r3, r8, #652
	ldrh	r5, [r8, r2]
	mov	r4, #0
	str	r0, [fp, #-60]
	add	r0, r1, #4736
	ldrh	r3, [r3]
	mov	r7, r1
	str	r1, [fp, #-56]
	add	r0, r0, #44
	mov	r1, r4
	mov	r2, #300
	sub	r3, r3, #1
	mov	r6, r5, asl #1
	strh	r3, [fp, #-46]
	strh	r4, [fp, #-50]
	strh	r4, [fp, #-48]
	bl	pq_alg_memset
	add	r3, r8, #984
	mov	r2, r6
	mov	r1, r4
	ldr	r0, .L149
	strh	r4, [r3]
	bl	pq_alg_memset
	mov	r2, r6
	mov	r1, r4
	ldr	r0, .L149+4
	bl	pq_alg_memset
	sub	r2, fp, #50
	mov	r0, r7
	ldr	r1, .L149
	bl	DM_DetRoSub_1st
	movw	r3, #670
	ldrsh	r2, [r8, r3]
	ldrsh	r3, [fp, #-50]
	cmp	r2, r3
	bge	.L143
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L143:
	mov	r2, r6
	ldr	r1, .L149
	ldr	r0, .L149+4
	bl	pq_alg_memcpy
	cmp	r5, r4
	ble	.L109
	ldr	lr, .L149+8
	mov	r1, r4
	sub	r10, r5, #1
	ldr	r4, .L149+12
	mov	r3, r1
	mov	r9, r1
	mov	r6, lr
	b	.L99
.L145:
	add	r1, r6, r1, lsl #1
	ldrh	r1, [r1, #26]
	cmp	r1, #0
	beq	.L98
.L140:
	sxth	r2, r2
	add	ip, r8, #672
	sxth	r1, r1
	rsb	r1, r1, r2
	ldrsh	r2, [ip]
	cmp	r1, #0
	rsblt	r1, r1, #0
	cmp	r1, r2
	ble	.L92
.L98:
	add	r0, r4, r0
	strh	r9, [r0, #16]
.L92:
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r1, r3
	cmp	r1, r5
	bge	.L144
.L99:
	mov	r0, r1, asl #1
	add	r2, lr, r0
	ldrh	r2, [r2, #24]
	cmp	r2, #0
	beq	.L92
	cmp	r3, #0
	beq	.L145
	cmp	r1, r10
	beq	.L146
	add	ip, r6, r1, lsl #1
	ldrh	ip, [ip, #22]
	cmp	ip, #0
	bne	.L97
	add	r7, r6, r1, lsl #1
	ldrsh	r7, [r7, #26]
	cmp	r7, #0
	beq	.L98
.L97:
	add	r7, r8, #672
	sxth	r2, r2
	sxth	ip, ip
	rsb	ip, ip, r2
	ldrsh	r7, [r7]
	cmp	ip, #0
	rsblt	ip, ip, #0
	cmp	ip, r7
	ble	.L92
	add	r1, lr, r1, lsl #1
	ldrsh	r1, [r1, #26]
	rsb	r2, r1, r2
	cmp	r2, #0
	rsblt	r2, r2, #0
	cmp	r7, r2
	bge	.L92
	b	.L98
.L109:
	ldr	r0, [fp, #-56]
	bl	DM_CheckRoSub
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L144:
	sub	r2, r5, #1
	mov	r3, #0
	str	r8, [fp, #-68]
	mov	r7, r3
	mov	r9, r3
	mov	r8, r2
	b	.L108
.L147:
	add	r3, r4, r3, lsl #1
	mov	r6, #1
	ldrsh	r3, [r3, #16]
	cmp	r3, #0
	movne	r7, #0
.L101:
	uxth	r9, r6
	sxth	r3, r9
	cmp	r3, r5
	bge	.L109
.L108:
	cmp	r9, #0
	beq	.L147
	cmp	r3, r8
	beq	.L148
	add	r2, r4, r3, lsl #1
	ldrh	r2, [r2, #16]
	cmp	r2, #0
	addeq	r6, r9, #1
	beq	.L101
	ldr	r1, .L149+12
	add	r6, r9, #1
	add	ip, r1, r3, lsl #1
	ldr	r1, [fp, #-68]
	add	r3, r4, r3, lsl #1
	add	r0, r1, #680
	sxth	r1, r2
	ldrsh	r2, [ip, #14]
	add	r0, r0, #2
	ldrsh	r3, [r3, #18]
	rsb	r2, r2, r1
	ldrsh	r0, [r0]
	rsb	r3, r3, r1
	cmp	r2, #0
	rsblt	r2, r2, #0
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r2, r0
	movge	r7, r9
	cmp	r0, r3
	bgt	.L101
	rsb	r1, r7, r6
	sxth	r3, r7
	ands	r1, r1, #255
	str	r3, [fp, #-64]
	mov	r0, #0
	mov	lr, r3, asl #1
	beq	.L106
	mov	r10, #2
	mov	r3, r0
.L107:
	smlabb	r2, r3, r10, lr
	add	r3, r3, #1
	uxth	r3, r3
	add	r2, r4, r2
	sxth	ip, r3
	ldrh	r2, [r2, #16]
	cmp	ip, r1
	add	r0, r2, r0
	uxth	r0, r0
	blt	.L107
.L142:
	sxth	r0, r0
.L106:
	add	r0, r0, r1, lsr #1
	sxth	r9, r9
	bl	__aeabi_idiv
	sub	r1, fp, #46
	sub	r2, fp, #48
	str	r1, [sp, #4]
	str	r2, [sp]
	mov	r3, r9
	ldr	r2, [fp, #-64]
	sxth	r10, r0
	ldr	r0, [fp, #-56]
	mov	r1, r10
	bl	DM_GetRoSubCoordX
	cmp	r0, #0
	bne	.L101
	ldr	r0, [fp, #-64]
	mov	r1, #16
	ldrsh	r3, [fp, #-46]
	str	r1, [sp, #12]
	str	r0, [sp]
	mov	r0, #64
	ldrsh	r2, [fp, #-48]
	str	r0, [sp, #8]
	str	r10, [sp, #16]
	str	r9, [sp, #4]
	ldr	r1, [fp, #-56]
	ldr	r0, [fp, #-60]
	bl	DM_CoordXY2Pix
	b	.L101
.L148:
	add	r3, r4, r8, lsl #1
	add	r6, r9, #1
	ldrsh	r3, [r3, #16]
	cmp	r3, #0
	beq	.L101
	rsb	r1, r7, r6
	sxth	r3, r7
	ands	r1, r1, #255
	str	r3, [fp, #-64]
	mov	r0, #0
	mov	lr, r3, asl #1
	beq	.L106
	mov	r10, #2
	mov	r2, r0
.L104:
	smlabb	r3, r2, r10, lr
	add	r2, r2, #1
	uxth	r2, r2
	add	r3, r4, r3
	sxth	ip, r2
	ldrh	r3, [r3, #16]
	cmp	ip, r1
	add	r0, r3, r0
	uxth	r0, r0
	blt	.L104
	b	.L142
.L146:
	add	r1, r6, r10, lsl #1
	ldrh	r1, [r1, #22]
	cmp	r1, #0
	beq	.L98
	b	.L140
.L150:
	.align	2
.L149:
	.word	.LANCHOR3+16
	.word	.LANCHOR4+24
	.word	.LANCHOR4
	.word	.LANCHOR3
	UNWIND(.fnend)
	.size	DM_DetRoSub, .-DM_DetRoSub
	.align	2
	.global	DBM_WriteDMRoSubInfo
	.type	DBM_WriteDMRoSubInfo, %function
DBM_WriteDMRoSubInfo:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r3, r0, #5056
	movw	r2, #402
	ldrh	ip, [r3, #24]
	cmp	ip, #0
	strh	ip, [r1, r2]
	ble	.L156
	mov	r2, ip, asl #3
	add	r3, r0, #4736
	add	r2, r2, ip, lsl #1
	add	r3, r3, #52
	add	r2, r2, #4736
	add	r2, r2, #52
	add	r0, r0, r2
.L153:
	ldrh	r2, [r3]
	add	r3, r3, #10
	add	r1, r1, #10
	strh	r2, [r1, #100]
	ldrh	r2, [r3, #-14]
	strh	r2, [r1, #96]
	ldrh	r2, [r3, #-18]
	strh	r2, [r1, #92]
	ldrh	r2, [r3, #-12]
	strh	r2, [r1, #98]
	ldrh	r2, [r3, #-16]
	cmp	r3, r0
	strh	r2, [r1, #94]
	bne	.L153
.L156:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	DBM_WriteDMRoSubInfo, .-DBM_WriteDMRoSubInfo
	.align	2
	.global	DM_UpdateCfg
	.type	DM_UpdateCfg, %function
DM_UpdateCfg:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r2
	mov	r5, r3
	mov	r8, r0
	beq	.L181
	cmp	r3, #0
	cmpne	r2, #0
	moveq	r6, #1
	movne	r6, #0
	beq	.L181
	mov	r0, r1
	mov	r1, r2
	bl	DM_InitOutputReg
	ldr	r3, .L199
	ldr	r2, .L199+4
	add	r7, r5, #4096
	ldr	r1, .L199+8
	add	r0, r7, #652
	ldrb	r3, [r3]
	add	r9, r5, #160
	ldr	ip, [r2]
	sub	r2, r3, #4
	cmp	r2, #60
	ldr	r2, .L199+12
	str	ip, [r5]
	sxtbls	r3, r3
	ldrh	ip, [r1]
	ldrh	r1, [r2]
	mov	r2, #1440
	strls	r3, [r5, #4]
	movw	r3, #650
	strhi	r6, [r5, #4]
	strh	ip, [r0]
	add	r0, r5, #336
	strh	r1, [r7, r3]
	ldr	r1, .L199+16
	bl	pq_alg_memcpy
	mov	r2, #1440
	ldr	r1, .L199+20
	add	r0, r5, #1776
	bl	pq_alg_memcpy
	mov	r2, #1440
	ldr	r1, .L199+24
	add	r0, r5, #3216
	bl	pq_alg_memcpy
	ldr	r3, [r8, #8]
	cmp	r3, #720
	ble	.L197
.L161:
	ldrb	r2, [r5, #144]
.L169:
	mov	r3, #44
	smulbb	r3, r2, r3
	add	r6, r9, r3
	ldrh	r3, [r9, r3]
	strh	r3, [r4]
	ldrh	r3, [r6, #2]
	strh	r3, [r4, #2]
	ldrh	r3, [r6, #4]
	strh	r3, [r4, #4]
	ldrh	r3, [r6, #6]
	strh	r3, [r4, #6]
	ldrb	r3, [r6, #8]
	strb	r3, [r4, #8]
	ldrb	r3, [r6, #9]
	strb	r3, [r4, #9]
	ldrh	ip, [r6, #10]
	strh	ip, [r4, #10]
	ldrh	r1, [r6, #12]
	strh	r1, [r4, #12]
	ldrh	r0, [r6, #14]
	strh	r0, [r4, #14]
	ldrh	r2, [r6, #16]
	strh	r2, [r4, #16]
	ldrb	r3, [r6, #20]
	cmp	r3, #1
	beq	.L198
.L196:
	strb	r3, [r4, #18]
	ldrb	r3, [r6, #19]
	strb	r3, [r4, #19]
	ldrb	r3, [r6, #18]
	strb	r3, [r4, #20]
	ldr	r1, [r6, #40]
	cmp	r1, #0
	beq	.L176
	mov	r2, #62
	add	r0, r4, #22
	bl	pq_alg_memcpy
.L176:
	ldrh	r3, [r6, #22]
	add	r7, r7, #984
	ldr	r2, .L199+28
	mov	r0, r8
	mov	r1, r5
	strh	r3, [r4, #84]
	ldrh	r3, [r6, #24]
	ldr	r2, [r2, #192]
	strh	r3, [r4, #86]
	ldrb	r3, [r6, #26]
	strb	r3, [r4, #88]
	ldrb	r3, [r6, #27]
	strb	r3, [r4, #89]
	ldrb	r3, [r6, #28]
	strb	r3, [r4, #90]
	ldrh	r3, [r6, #30]
	strh	r3, [r4, #92]
	ldrh	r3, [r6, #32]
	strh	r3, [r4, #94]
	ldrh	r3, [r6, #34]
	strh	r3, [r4, #96]
	ldrh	r3, [r6, #36]
	strb	r2, [r4, #100]
	strh	r3, [r4, #98]
	bl	DM_DetRoSub
	ldrh	r2, [r7]
	movw	r3, #402
	cmp	r2, #0
	strh	r2, [r4, r3]
	ble	.L179
	mov	r3, r2, asl #3
	add	r1, r5, #4736
	add	r3, r3, r2, lsl #1
	add	r1, r1, #52
	add	r3, r3, #4736
	mov	r2, r4
	add	r3, r3, #52
	add	r5, r5, r3
.L178:
	ldrh	r3, [r1]
	add	r1, r1, #10
	add	r2, r2, #10
	strh	r3, [r2, #100]
	ldrh	r3, [r1, #-14]
	strh	r3, [r2, #96]
	ldrh	r3, [r1, #-18]
	strh	r3, [r2, #92]
	ldrh	r3, [r1, #-12]
	strh	r3, [r2, #98]
	ldrh	r3, [r1, #-16]
	cmp	r1, r5
	strh	r3, [r2, #94]
	bne	.L178
.L179:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L197:
	ldrb	r2, [r5, #145]
	cmp	r2, #1
	bne	.L161
	ldr	r1, .L199+32
	cmp	r3, #0
	movgt	r0, #15
	movle	r0, #0
	ldr	r3, [r1, #32]
	cmp	r3, #31
	addls	r2, r3, #1
	str	r2, [r1, #32]
	movhi	r3, #0
	add	r3, r3, #2
	str	r0, [r5, r3, asl #2]
	add	r3, r5, r3, lsl #2
	ldr	r1, [r5, #136]
	str	r3, [r5, #140]
	cmp	r1, #0
	beq	.L164
	ble	.L184
	mov	r2, #0
	add	lr, r5, #8
	mov	r0, r2
.L167:
	ldr	ip, [r3], #-4
	add	r2, r2, #1
	cmp	r3, lr
	add	r0, r0, ip
	addcc	r3, r5, #132
	cmp	r2, r1
	bne	.L167
.L165:
	bl	__aeabi_idiv
.L164:
	ldrh	r3, [r5, #146]
	uxth	r0, r0
	cmp	r3, r0
	ldrhib	r2, [r5, #154]
	bhi	.L169
	ldrh	r3, [r5, #148]
	cmp	r3, r0
	ldrhib	r2, [r5, #155]
	bhi	.L169
	ldrh	r3, [r5, #150]
	cmp	r3, r0
	ldrhib	r2, [r5, #156]
	bhi	.L169
	ldrh	r3, [r5, #152]
	cmp	r3, r0
	ldrhib	r2, [r5, #157]
	ldrlsb	r2, [r5, #158]
	b	.L169
.L181:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L198:
	sxth	ip, ip
	sxth	r0, r0
	sxth	r1, r1
	sxth	r2, r2
	cmp	r1, r2
	cmpgt	ip, r0
	movle	r3, #0
	b	.L196
.L184:
	mov	r0, #0
	b	.L165
.L200:
	.align	2
.L199:
	.word	g_s8DbDetUsingSizeHy
	.word	g_u32DbDetUsingHyCounterBorder
	.word	g_u16RgmvBlkNumW
	.word	g_u16RgmvBlkNumH
	.word	g_as16RGMVX
	.word	g_as16RGMVY
	.word	g_au16RGMVMag
	.word	.LANCHOR0
	.word	.LANCHOR5
	UNWIND(.fnend)
	.size	DM_UpdateCfg, .-DM_UpdateCfg
	.global	g_s16ColTemp
	.global	g_s16ColStaMvX
	.global	g_as16RgmvTemp
	.global	g_as16MedianTemp
	.global	g_DMParaSDSplit
	.global	g_astDMParaSD
	.global	g_stMMFLimTransBand
	.global	g_stLimitFlagLutSD
	.global	g_u32DmStr
	.data
	.align	2
.LANCHOR0 = . + 0
	.type	g_stLimitFlagLutSD, %object
	.size	g_stLimitFlagLutSD, 14
g_stLimitFlagLutSD:
	.short	2
	.short	3
	.short	13
	.short	15
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.space	1
	.space	2
	.type	g_astDMParaSD, %object
	.size	g_astDMParaSD, 176
g_astDMParaSD:
	.short	15
	.short	9
	.short	35
	.short	140
	.byte	4
	.byte	5
	.short	50
	.short	200
	.short	1
	.short	4
	.byte	1
	.byte	0
	.byte	1
	.space	1
	.short	10
	.short	40
	.byte	6
	.byte	6
	.byte	6
	.space	1
	.short	30
	.short	120
	.short	0
	.short	0
	.space	2
	.word	g_stMMFLimTransBand+62
	.short	20
	.short	18
	.short	40
	.short	160
	.byte	4
	.byte	4
	.short	50
	.short	200
	.short	0
	.short	0
	.byte	1
	.byte	0
	.byte	1
	.space	1
	.short	18
	.short	72
	.byte	7
	.byte	8
	.byte	7
	.space	1
	.short	30
	.short	120
	.short	0
	.short	0
	.space	2
	.word	g_stMMFLimTransBand+62
	.short	20
	.short	18
	.short	45
	.short	180
	.byte	4
	.byte	4
	.short	60
	.short	240
	.short	-1
	.short	-4
	.byte	1
	.byte	1
	.byte	1
	.space	1
	.short	20
	.short	80
	.byte	7
	.byte	8
	.byte	7
	.space	1
	.short	30
	.short	120
	.short	0
	.short	0
	.space	2
	.word	g_stMMFLimTransBand+62
	.short	25
	.short	18
	.short	50
	.short	200
	.byte	4
	.byte	4
	.short	60
	.short	240
	.short	0
	.short	0
	.byte	1
	.byte	1
	.byte	0
	.space	1
	.short	25
	.short	100
	.byte	8
	.byte	8
	.byte	8
	.space	1
	.short	30
	.short	120
	.short	0
	.short	0
	.space	2
	.word	g_stMMFLimTransBand+62
	.type	g_u32DmStr, %object
	.size	g_u32DmStr, 4
g_u32DmStr:
	.word	8
	.type	g_DMParaSDSplit, %object
	.size	g_DMParaSDSplit, 176
g_DMParaSDSplit:
	.short	20
	.short	18
	.short	45
	.short	180
	.byte	3
	.byte	3
	.short	60
	.short	240
	.short	-1
	.short	-4
	.byte	1
	.byte	1
	.byte	0
	.space	1
	.short	40
	.short	160
	.byte	7
	.byte	8
	.byte	7
	.space	1
	.short	30
	.short	120
	.short	0
	.short	0
	.space	2
	.word	g_stMMFLimTransBand+62
	.short	20
	.short	18
	.short	45
	.short	180
	.byte	3
	.byte	3
	.short	60
	.short	240
	.short	-1
	.short	-4
	.byte	1
	.byte	1
	.byte	0
	.space	1
	.short	40
	.short	160
	.byte	7
	.byte	8
	.byte	7
	.space	1
	.short	30
	.short	120
	.short	0
	.short	0
	.space	2
	.word	g_stMMFLimTransBand+62
	.short	20
	.short	18
	.short	45
	.short	180
	.byte	3
	.byte	3
	.short	60
	.short	240
	.short	-1
	.short	-4
	.byte	1
	.byte	1
	.byte	0
	.space	1
	.short	40
	.short	160
	.byte	7
	.byte	8
	.byte	7
	.space	1
	.short	30
	.short	120
	.short	0
	.short	0
	.space	2
	.word	g_stMMFLimTransBand+62
	.short	20
	.short	18
	.short	45
	.short	180
	.byte	3
	.byte	3
	.short	60
	.short	240
	.short	-1
	.short	-4
	.byte	1
	.byte	1
	.byte	0
	.space	1
	.short	40
	.short	160
	.byte	7
	.byte	8
	.byte	7
	.space	1
	.short	30
	.short	120
	.short	0
	.short	0
	.space	2
	.word	g_stMMFLimTransBand+62
	.type	g_stMMFLimTransBand, %object
	.size	g_stMMFLimTransBand, 124
g_stMMFLimTransBand:
	.short	0
	.short	1
	.short	2
	.short	3
	.short	4
	.short	5
	.short	6
	.short	7
	.short	8
	.short	9
	.short	10
	.short	11
	.short	12
	.short	13
	.short	14
	.short	15
	.short	16
	.short	17
	.short	18
	.short	19
	.short	20
	.short	21
	.short	22
	.short	23
	.short	24
	.short	25
	.short	26
	.short	27
	.short	28
	.short	29
	.short	30
	.short	0
	.short	2
	.short	4
	.short	6
	.short	8
	.short	10
	.short	12
	.short	14
	.short	16
	.short	18
	.short	20
	.short	22
	.short	24
	.short	26
	.short	28
	.short	30
	.short	32
	.short	34
	.short	36
	.short	38
	.short	40
	.short	42
	.short	44
	.short	46
	.short	48
	.short	50
	.short	52
	.short	54
	.short	56
	.short	58
	.short	60
	.bss
	.align	2
.LANCHOR1 = . + 0
.LANCHOR2 = . + 8184
.LANCHOR3 = . + 16368
.LANCHOR4 = . + 24552
.LANCHOR5 = . + 32736
	.type	g_as16MedianTemp, %object
	.size	g_as16MedianTemp, 8192
g_as16MedianTemp:
	.space	8192
	.type	g_as16RgmvTemp, %object
	.size	g_as16RgmvTemp, 8192
g_as16RgmvTemp:
	.space	8192
	.type	g_s16ColStaMvX, %object
	.size	g_s16ColStaMvX, 8192
g_s16ColStaMvX:
	.space	8192
	.type	g_s16ColTemp, %object
	.size	g_s16ColTemp, 8192
g_s16ColTemp:
	.space	8192
	.type	i.4543, %object
	.size	i.4543, 4
i.4543:
	.space	4
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
