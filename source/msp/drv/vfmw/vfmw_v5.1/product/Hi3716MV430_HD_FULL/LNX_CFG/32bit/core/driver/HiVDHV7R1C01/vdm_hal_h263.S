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
	.file	"vdm_hal_h263.c"
	.text
	.align	2
	.global	H263HAL_Log2bin
	.type	H263HAL_Log2bin, %function
H263HAL_Log2bin:
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
	.size	H263HAL_Log2bin, .-H263HAL_Log2bin
	.global	__aeabi_idiv
	.align	2
	.global	H263HAL_CfgDnMsg
	.type	H263HAL_CfgDnMsg, %function
H263HAL_CfgDnMsg:
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
	ldrh	r2, [r0, #160]
	ldrh	r3, [r0, #158]
	mov	r8, r0
	mov	r6, r1
	mul	r3, r3, r2
	cmp	r3, #0
	beq	.L108
	mov	r7, #0
.L9:
	add	r7, r7, #1
	movs	r3, r3, lsr #1
	uxth	r7, r7
	bne	.L9
.L8:
	ldr	r4, .L125
	mov	r3, #1000
	mla	r3, r3, r6, r4
	ldr	r0, [r3, #32]
	bl	MEM_Phy2Vir
	subs	r5, r0, #0
	beq	.L116
	ldrb	r3, [r8, #2]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L117
	ldr	r3, [r4, #848]
	mov	r1, #126
	ldr	r2, [r4, #852]
	mov	r0, #5
	rsb	r3, r3, r5
	add	r9, r8, #12288
	cmp	r3, r2
	ldr	r2, .L125+4
	and	r7, r7, #15
	movcs	r3, #1
	movcc	r3, #0
	strcs	r3, [r4, #844]
	strcc	r3, [r5]
	mov	r3, #0
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldrb	r1, [r8, #3]	@ zero_extendqisi2
	add	r2, r5, #4
	ldr	r0, [r4, #852]
	rsb	r2, r3, r2
	ldrb	r3, [r8, #1]	@ zero_extendqisi2
	cmp	r2, r0
	and	r2, r1, #31
	ldr	r1, .L125
	mov	r0, #5
	mov	r3, r3, asl #31
	orr	r3, r3, r2, asl #26
	movcs	r2, #1
	strcc	r3, [r5, #4]
	strcs	r2, [r1, #844]
	mov	r1, #133
	ldr	r2, .L125+8
	bl	dprint_normal
	ldrb	r1, [r8]	@ zero_extendqisi2
	ldrb	r0, [r8, #19]	@ zero_extendqisi2
	cmp	r1, #2
	and	r2, r1, #3
	and	r0, r0, #1
	ldrb	r3, [r8, #17]	@ zero_extendqisi2
	moveq	ip, #0
	ldrneb	ip, [r8, #16]	@ zero_extendqisi2
	and	r3, r3, #1
	streqb	ip, [r8, #16]
	andne	ip, ip, #1
	ldr	r1, [r9, #2284]
	ldr	r10, [r9, #2288]
	movne	ip, ip, asl #3
	ldr	lr, [r9, #2292]
	and	r1, r1, #3
	and	lr, lr, #3
	orr	r1, r0, r1, asl #26
	ldrb	r0, [r8, #18]	@ zero_extendqisi2
	orr	r1, r1, r10, asl #30
	orr	r10, r1, lr, asl #28
	ldrb	r1, [r8, #15]	@ zero_extendqisi2
	and	lr, r0, #1
	ldrb	r0, [r8, #14]	@ zero_extendqisi2
	and	r1, r1, #1
	orr	lr, r10, lr, asl #1
	ldrb	r10, [r8, #11]	@ zero_extendqisi2
	orr	r3, lr, r3, asl #2
	mov	r0, r0, asl #7
	ldrb	lr, [r8, #13]	@ zero_extendqisi2
	orr	r3, r3, r1, asl #4
	orr	r1, r3, r2, asl #5
	uxtb	r0, r0
	ldrb	r3, [r8, #12]	@ zero_extendqisi2
	and	lr, lr, #7
	orr	r1, r1, r0
	and	r10, r10, #7
	ldrb	r0, [r8, #10]	@ zero_extendqisi2
	orr	r1, r1, lr, asl #8
	and	r3, r3, #7
	orr	r2, r1, r10, asl #11
	ldr	lr, [r4, #848]
	and	r0, r0, #31
	ldr	r10, [r4, #852]
	orr	r2, r2, r3, asl #14
	add	r1, r5, #8
	orr	r3, r2, r0, asl #17
	rsb	r1, lr, r1
	ldr	r2, .L125
	cmp	r1, r10
	orr	r7, r3, r7, asl #22
	orr	r3, r7, ip
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #8]
	strcs	r1, [r2, #844]
	mov	r1, #158
	ldr	r2, .L125+12
	bl	dprint_normal
	ldrb	r3, [r8]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L118
.L21:
	ldr	r0, [r4, #848]
	add	r2, r5, #16
	ldrh	r3, [r8, #158]
	rsb	r2, r0, r2
	ldr	r0, [r4, #852]
	ldrh	r1, [r8, #160]
	sub	r3, r3, #1
	cmp	r2, r0
	ldr	r2, .L125
	sub	r1, r1, #1
	uxth	r3, r3
	mov	r0, #5
	orr	r3, r3, r1, asl #16
	movcs	r1, #1
	strcc	r3, [r5, #16]
	strcs	r1, [r2, #844]
	mov	r1, #176
	ldr	r2, .L125+16
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r3, [r4, #852]
	add	r2, r5, #20
	rsb	r2, r1, r2
	ldr	r1, [r9, #2276]
	cmp	r2, r3
	ldr	r2, .L125
	ldr	r3, [r9, #2280]
	mov	r0, #5
	orr	r3, r3, r1, asl #16
	movcs	r1, #1
	strcc	r3, [r5, #20]
	strcs	r1, [r2, #844]
	mov	r1, #183
	ldr	r2, .L125+20
	bl	dprint_normal
	ldrb	r3, [r8]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L119
.L36:
	ldr	r1, [r4, #848]
	add	r3, r5, #32
	ldr	r2, [r4, #852]
	mov	r0, #5
	rsb	r3, r1, r3
	ldr	r1, .L125
	cmp	r3, r2
	ldr	r2, .L125+24
	movcs	r3, #1
	movcc	r3, #0
	strcs	r3, [r1, #844]
	mov	r1, #228
	strcc	r3, [r5, #32]
	mov	r3, #0
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r5, #36
	rsb	r3, r1, r3
	ldr	r1, .L125
	cmp	r3, r2
	mov	r0, #5
	ldr	r2, .L125+28
	movcs	r3, #1
	movcc	r3, #0
	strcs	r3, [r1, #844]
	mov	r1, #234
	strcc	r3, [r5, #36]
	mov	r3, #0
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r5, #40
	rsb	r3, r1, r3
	ldr	r1, .L125
	cmp	r3, r2
	mov	r0, #5
	ldr	r2, .L125+32
	movcs	r3, #1
	movcc	r3, #0
	strcs	r3, [r1, #844]
	mov	r1, #240
	strcc	r3, [r5, #40]
	mov	r3, #0
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r5, #44
	rsb	r3, r1, r3
	ldr	r1, .L125
	cmp	r3, r2
	mov	r0, #5
	ldr	r2, .L125+36
	movcs	r3, #1
	movcc	r3, #0
	strcs	r3, [r1, #844]
	mov	r1, #246
	strcc	r3, [r5, #44]
	mov	r3, #0
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #48
	rsb	r2, r3, r2
	ldr	r3, [r9, #2252]
	cmp	r2, r1
	ldr	r2, .L125
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #48]
	strcs	r1, [r2, #844]
	mov	r1, #254
	ldr	r2, .L125+40
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #52
	rsb	r2, r3, r2
	ldr	r3, [r8, #180]
	cmp	r2, r1
	ldr	r2, .L125
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #52]
	strcs	r1, [r2, #844]
	mov	r1, #260
	ldr	r2, .L125+44
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #56
	rsb	r2, r3, r2
	ldr	r3, [r8, #184]
	cmp	r2, r1
	ldr	r2, .L125
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #56]
	strcs	r1, [r2, #844]
	movw	r1, #266
	ldr	r2, .L125+48
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #60
	rsb	r2, r3, r2
	ldr	r3, [r8, #188]
	cmp	r2, r1
	ldr	r2, .L125
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #60]
	strcs	r1, [r2, #844]
	mov	r1, #272
	ldr	r2, .L125+52
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #64
	rsb	r2, r3, r2
	ldr	r3, [r8, #192]
	cmp	r2, r1
	ldr	r2, .L125
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #64]
	strcs	r1, [r2, #844]
	movw	r1, #278
	ldr	r2, .L125+56
	bl	dprint_normal
	mov	r2, #1000
	mla	r2, r2, r6, r4
	ldr	r0, [r4, #848]
	ldr	r1, [r4, #852]
	add	r3, r5, #68
	rsb	r3, r0, r3
	ldr	r0, .L125
	cmp	r3, r1
	mov	r1, #284
	ldr	r3, [r2, #864]
	movcs	r2, #1
	strcs	r2, [r0, #844]
	mov	r0, #5
	ldr	r2, .L125+60
	strcc	r3, [r5, #68]
	bl	dprint_normal
	mov	r2, #1000
	mla	r2, r2, r6, r4
	ldr	r0, [r4, #848]
	ldr	r1, [r4, #852]
	add	r3, r5, #72
	rsb	r3, r0, r3
	ldr	r0, .L125
	cmp	r3, r1
	movw	r1, #290
	ldr	r3, [r2, #888]
	movcs	r2, #1
	strcs	r2, [r0, #844]
	mov	r0, #5
	ldr	r2, .L125+64
	strcc	r3, [r5, #72]
	bl	dprint_normal
	ldrb	r3, [r8]	@ zero_extendqisi2
	mov	r2, #0
	strb	r2, [r8, #153]
	cmp	r3, #3
	beq	.L120
.L72:
	ldrb	r3, [r8, #149]	@ zero_extendqisi2
	and	ip, r3, #1
	strb	r3, [r8, #148]
	mov	r1, ip, asl #3
.L74:
	ldrb	r3, [r8, #152]	@ zero_extendqisi2
	add	r0, r5, #76
	ldrb	r2, [r8, #151]	@ zero_extendqisi2
	ldr	lr, [r4, #848]
	and	r3, r3, #1
	and	r2, r2, #1
	rsb	r0, lr, r0
	orr	r2, r2, r3, asl #1
	ldr	lr, [r4, #852]
	orr	r3, r2, r1
	ldr	r2, .L125
	orr	r3, r3, ip, asl #2
	cmp	r0, lr
	mov	r0, #5
	strcc	r3, [r5, #76]
	movcs	r1, #1
	strcs	r1, [r2, #844]
	ldr	r2, .L125+68
	mov	r1, #320
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #80
	rsb	r2, r3, r2
	ldr	r3, [r9, #2296]
	cmp	r2, r1
	ldr	r2, .L125
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #80]
	strcs	r1, [r2, #844]
	movw	r1, #326
	ldr	r2, .L125+72
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #84
	rsb	r2, r3, r2
	ldr	r3, [r9, #2300]
	cmp	r2, r1
	ldr	r2, .L125
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #84]
	strcs	r1, [r2, #844]
	mov	r1, #332
	ldr	r2, .L125+76
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #88
	rsb	r2, r3, r2
	ldr	r3, [r9, #2304]
	cmp	r2, r1
	ldr	r2, .L125
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #88]
	strcs	r1, [r2, #844]
	movw	r1, #338
	ldr	r2, .L125+80
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #92
	rsb	r2, r3, r2
	ldr	r3, [r9, #2308]
	cmp	r2, r1
	ldr	r2, .L125
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #92]
	strcs	r1, [r2, #844]
	mov	r1, #344
	ldr	r2, .L125+84
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #96
	rsb	r2, r3, r2
	ldr	r3, [r9, #2312]
	cmp	r2, r1
	ldr	r2, .L125
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #96]
	strcs	r1, [r2, #844]
	movw	r1, #350
	ldr	r2, .L125+88
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #100
	rsb	r2, r3, r2
	ldr	r3, [r9, #2316]
	cmp	r2, r1
	ldr	r2, .L125
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #100]
	strcs	r1, [r2, #844]
	mov	r1, #356
	ldr	r2, .L125+92
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #104
	rsb	r2, r3, r2
	ldr	r3, [r9, #2320]
	cmp	r2, r1
	ldr	r2, .L125
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #104]
	strcs	r1, [r2, #844]
	movw	r1, #362
	ldr	r2, .L125+96
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #108
	rsb	r2, r3, r2
	ldr	r3, [r9, #2324]
	cmp	r2, r1
	ldr	r2, .L125
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #108]
	strcs	r1, [r2, #844]
	mov	r1, #368
	ldr	r2, .L125+100
	bl	dprint_normal
	ldrb	r3, [r8, #2]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L121
.L93:
	ldr	r8, [r4, #848]
	ldr	lr, [r4, #852]
.L103:
	mov	r2, #1000
	add	r3, r5, #240
	mla	r2, r2, r6, r4
	rsb	r3, r8, r3
	cmp	r3, lr
	ldr	r3, .L125
	mov	r0, #5
	ldr	r2, [r2, #884]
	movcs	r2, #1
	strcc	r2, [r5, #240]
	strcs	r2, [r3, #844]
	mov	r2, #1000
	mla	r4, r2, r6, r4
	ldrcc	r8, [r3, #848]
	ldrcc	lr, [r3, #852]
	add	r3, r5, #252
	rsb	r8, r8, r3
	ldr	r2, .L125
	cmp	r8, lr
	ldr	r3, [r4, #32]
	movcs	r1, #1
	strcs	r1, [r2, #844]
	movw	r1, #386
	add	r3, r3, #256
	ldr	r2, .L125+104
	strcc	r3, [r5, #252]
	bl	dprint_normal
	mov	r0, #0
.L11:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L117:
	ldrb	r2, [r8, #156]	@ zero_extendqisi2
	and	r7, r7, #15
	ldrb	r3, [r8, #9]	@ zero_extendqisi2
	add	r9, r8, #12288
	cmp	r2, #0
	ldr	r2, [r4, #848]
	and	r3, r3, #1
	ldr	r1, [r4, #852]
	rsb	r2, r2, r5
	ldr	r0, .L125
	mov	r3, r3, asl #3
	orrne	r3, r3, #20
	orreq	r3, r3, #52
	cmp	r2, r1
	mov	r1, #102
	strcc	r3, [r5]
	movcs	r2, #1
	strcs	r2, [r0, #844]
	ldr	r2, .L125+4
	mov	r0, #5
	bl	dprint_normal
	ldrh	r1, [r8, #4]
	ldrh	r2, [r8, #6]
	add	r0, r5, #4
	ldrb	ip, [r8, #3]	@ zero_extendqisi2
	ubfx	r1, r1, #0, #9
	ldrb	r3, [r8, #8]	@ zero_extendqisi2
	ubfx	r2, r2, #0, #9
	and	ip, ip, #31
	mov	r1, r1, asl #5
	ldr	lr, [r4, #848]
	orr	r2, r1, r2, asl #14
	sub	r3, r3, #1
	ldr	r1, [r4, #852]
	orr	r2, r2, ip, asl #26
	and	r3, r3, #31
	rsb	r0, lr, r0
	orr	r3, r2, r3
	ldr	r2, .L125
	cmp	r0, r1
	mov	r0, #5
	strcc	r3, [r5, #4]
	movcs	r1, #1
	strcs	r1, [r2, #844]
	mov	r1, #111
	ldr	r2, .L125+8
	bl	dprint_normal
	ldrb	r2, [r8]	@ zero_extendqisi2
	ldrb	r3, [r8, #16]	@ zero_extendqisi2
	add	r1, r5, #8
	and	r2, r2, #3
	ldr	ip, [r4, #848]
	and	r3, r3, #1
	ldr	r0, [r4, #852]
	mov	r2, r2, asl #5
	rsb	r1, ip, r1
	orr	r3, r2, r3, asl #3
	ldr	r2, .L125
	cmp	r1, r0
	orr	r3, r3, r7, asl #22
	mov	r0, #5
	strcc	r3, [r5, #8]
	movcs	r1, #1
	strcs	r1, [r2, #844]
	ldr	r2, .L125+12
	mov	r1, #119
	bl	dprint_normal
	b	.L21
.L121:
	ldrb	r3, [r8, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L93
	add	r3, r8, #44
	ldr	r7, [r4, #848]
	ldr	lr, [r4, #852]
	add	r10, r8, #36
	add	r1, r5, #112
	mov	r9, r3
	str	r5, [fp, #-48]
	str	r8, [fp, #-52]
.L94:
	sub	r5, r10, #16
	mov	r8, r1
.L97:
	rsb	r3, r7, r8
	ldrb	ip, [r5, #48]	@ zero_extendqisi2
	cmp	r3, lr
	ldrb	r3, [r5, #32]	@ zero_extendqisi2
	ldrb	r2, [r5]	@ zero_extendqisi2
	add	r5, r5, #8
	ldrb	r0, [r5, #8]	@ zero_extendqisi2
	movcs	r3, #1
	movcc	r3, r3, asl #16
	strcs	r3, [r4, #844]
	orrcc	r3, r3, ip, asl #24
	add	r8, r8, #4
	orrcc	r2, r3, r2
	orrcc	r2, r2, r0, asl #8
	strcc	r2, [r8, #-4]
	ldrcc	r7, [r4, #848]
	ldrcc	lr, [r4, #852]
	cmp	r10, r5
	bne	.L97
	add	r10, r10, #1
	add	r1, r1, #8
	cmp	r10, r9
	bne	.L94
	ldr	r8, [fp, #-52]
	ldr	r5, [fp, #-48]
	add	r3, r8, #108
	add	r10, r8, #100
	add	r2, r5, #176
	str	r6, [fp, #-52]
	mov	r9, r3
	mov	r6, r2
.L99:
	sub	ip, r10, #16
	mov	r5, r6
.L102:
	rsb	r3, r7, r5
	ldrb	r0, [ip, #48]	@ zero_extendqisi2
	cmp	r3, lr
	ldrb	r3, [ip, #32]	@ zero_extendqisi2
	ldrb	r2, [ip]	@ zero_extendqisi2
	mov	r8, r7
	ldrb	r1, [ip, #16]	@ zero_extendqisi2
	add	ip, ip, #8
	movcc	r3, r3, asl #16
	movcs	r3, #1
	orrcc	r3, r3, r0, asl #24
	strcs	r3, [r4, #844]
	orrcc	r2, r3, r2
	add	r5, r5, #4
	orrcc	r2, r2, r1, asl #8
	strcc	r2, [r5, #-4]
	ldrcc	r7, [r4, #848]
	ldrcc	lr, [r4, #852]
	movcc	r8, r7
	cmp	r10, ip
	bne	.L102
	add	r10, r10, #1
	add	r6, r6, #8
	cmp	r10, r9
	bne	.L99
	ldr	r5, [fp, #-48]
	ldr	r6, [fp, #-52]
	b	.L103
.L120:
	ldr	r2, [r9, #2288]
	cmp	r2, #1
	beq	.L122
	bhi	.L72
	ldrb	r1, [r8, #148]	@ zero_extendqisi2
	ldrb	r3, [r8, #149]	@ zero_extendqisi2
	and	r1, r1, #1
	and	ip, r3, #1
	mov	r1, r1, asl #3
	b	.L74
.L119:
	ldr	r3, [r9, #2288]
	cmp	r3, #1
	bne	.L36
	ldrb	r7, [r8, #150]	@ zero_extendqisi2
	cmp	r7, #1
	beq	.L123
	ldr	r2, [r9, #2312]
	add	r1, r5, #24
	ldrb	r0, [r8, #15]	@ zero_extendqisi2
	movs	r2, r2, asl r0
	ldrne	r0, [r9, #2292]
	ldreq	r2, [r9, #2292]
	movne	r3, r3, asl r0
	moveq	r3, r3, asl r2
	addne	r3, r2, r3, asr #1
	moveq	r3, r3, asr #1
	subeq	r3, r3, #1
	movne	r3, r3, lsr r0
	ldr	r0, [r4, #848]
	moveq	r3, r3, lsr r2
	ldr	r2, [r4, #852]
	rsb	r1, r0, r1
	ldr	r0, .L125
	cmp	r1, r2
	mov	r1, #210
	strcc	r3, [r5, #24]
	movcs	r2, #1
	strcs	r2, [r0, #844]
	ldr	r2, .L125+108
	mov	r0, #5
	bl	dprint_normal
	ldr	r3, [r9, #2316]
	ldrb	r1, [r8, #15]	@ zero_extendqisi2
	add	r2, r5, #28
	movs	r3, r3, asl r1
	bne	.L124
	ldr	r1, [r9, #2292]
	mov	r3, #1
	mov	r3, r3, asl r1
	mov	r3, r3, asr #1
	sub	r3, r3, #1
	mov	r3, r3, lsr r1
.L47:
	ldr	r0, [r4, #848]
	ldr	r1, [r4, #852]
	rsb	r2, r0, r2
	ldr	r0, .L125
	cmp	r2, r1
	mov	r1, #217
	strcc	r3, [r5, #28]
	movcs	r2, #1
	strcs	r2, [r0, #844]
	ldr	r2, .L125+112
	mov	r0, #5
	bl	dprint_normal
	b	.L36
.L118:
	ldr	r0, [r4, #848]
	add	r2, r5, #12
	ldr	r3, [r8, #164]
	rsb	r2, r0, r2
	ldr	r0, [r4, #852]
	ldr	r1, [r8, #168]
	cmp	r2, r0
	mov	r3, r3, asl #1
	ldr	r2, .L125
	mov	r0, #5
	uxth	r3, r3
	orr	r3, r3, r1, asl #17
	movcs	r1, #1
	strcc	r3, [r5, #12]
	strcs	r1, [r2, #844]
	mov	r1, #167
	ldr	r2, .L125+116
	bl	dprint_normal
	b	.L21
.L108:
	mov	r7, r3
	b	.L8
.L122:
	ldrb	r3, [r8, #149]	@ zero_extendqisi2
	mov	r1, #8
	strb	r2, [r8, #148]
	and	ip, r3, #1
	b	.L74
.L124:
	ldr	r0, [r9, #2292]
	mov	r1, #1
	mov	r1, r1, asl r0
	add	r3, r3, r1, asr #1
	mov	r3, r3, lsr r0
	b	.L47
.L123:
	ldr	r3, [r9, #2292]
	ldrb	r1, [r8, #15]	@ zero_extendqisi2
	ldr	r0, [r9, #2312]
	rsb	r1, r1, r3
	mov	r1, r7, asl r1
	bl	__aeabi_idiv
	add	r2, r5, #24
	ldr	r1, [r4, #852]
	mov	r3, r0
	ldr	r0, [r4, #848]
	rsb	r2, r0, r2
	ldr	r0, .L125
	cmp	r2, r1
	ldr	r2, .L125+108
	strcc	r3, [r5, #24]
	mov	r1, #195
	strcs	r7, [r0, #844]
	mov	r0, #5
	bl	dprint_normal
	ldr	r3, [r9, #2292]
	ldrb	r1, [r8, #15]	@ zero_extendqisi2
	mov	r7, #1
	ldr	r0, [r9, #2316]
	rsb	r1, r1, r3
	mov	r1, r7, asl r1
	bl	__aeabi_idiv
	add	r2, r5, #28
	ldr	r1, [r4, #852]
	mov	r3, r0
	ldr	r0, [r4, #848]
	rsb	r2, r0, r2
	ldr	r0, .L125
	cmp	r2, r1
	ldr	r2, .L125+112
	strcc	r3, [r5, #28]
	mov	r1, #201
	strcs	r7, [r0, #844]
	mov	r0, #5
	bl	dprint_normal
	b	.L36
.L116:
	mov	r3, #84
	ldr	r2, .L125+120
	mov	r1, r3
	bl	dprint_normal
	mvn	r0, #0
	b	.L11
.L126:
	.align	2
.L125:
	.word	g_HwMem
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC5
	.word	.LC6
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC7
	.word	.LC8
	.word	.LC4
	.word	.LC0
	UNWIND(.fnend)
	.size	H263HAL_CfgDnMsg, .-H263HAL_CfgDnMsg
	.align	2
	.global	H263HAL_WriteSlicMsg
	.type	H263HAL_WriteSlicMsg, %function
H263HAL_WriteSlicMsg:
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
	ldr	r8, .L203
	mov	r3, #1000
	mov	r2, r0
	str	r0, [fp, #-80]
	add	r0, r0, #12288
	mla	r1, r3, r1, r8
	ldr	ip, [r2, #196]
	ldr	r3, [r0, #2248]
	mov	r7, #0
	str	r0, [fp, #-84]
	str	ip, [fp, #-76]
	str	r3, [fp, #-72]
	add	r3, r2, #200
	ldr	r5, [r1, #32]
	str	r7, [fp, #-48]
	add	r4, r5, #256
	str	r3, [fp, #-56]
	mov	r0, r4
	bl	MEM_Phy2Vir
	subs	r6, r0, #0
	beq	.L200
	ldr	r3, [fp, #-80]
	ldr	r3, [r3, #216]
	cmp	r3, #0
	beq	.L130
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-48]
	ldr	r1, [r8, #848]
	ldr	ip, [r3, #220]
	bfi	r2, r7, #0, #24
	ldr	lr, [r8, #852]
	rsb	r1, r1, r6
	and	r0, ip, #15
	ldrb	r3, [r3, #205]	@ zero_extendqisi2
	cmp	r1, lr
	mov	r1, r2, lsr #24
	add	r3, r3, r0, lsl #3
	str	r2, [fp, #-48]
	bfi	r1, r3, #0, #7
	strb	r1, [fp, #-45]
	ldrcc	r3, [fp, #-48]
	movcs	r3, #1
	ldr	r2, .L203+4
	movw	r1, #478
	strcs	r3, [r8, #844]
	mov	r0, #5
	ldrcs	r3, [fp, #-48]
	bic	r7, ip, #15
	strcc	r3, [r6]
	bl	dprint_normal
	ldr	r1, [r8, #848]
	ldr	r2, [r8, #852]
	add	r3, r6, #1
	rsb	r3, r1, r3
	ldr	r1, [fp, #-76]
	cmp	r3, r2
	ldr	r2, .L203
	rsb	r1, r1, r7
	mov	r3, #0
	mov	r0, #5
	bfi	r3, r1, #0, #24
	movcs	r1, #1
	str	r3, [fp, #-48]
	strcs	r1, [r2, #844]
	mov	r1, #484
	strcc	r3, [r6, #4]
	ldr	r2, .L203+8
	bl	dprint_normal
	ldr	r2, [fp, #-80]
	ldr	r0, [r8, #848]
	add	r3, r6, #2
	ldr	r7, [r2, #224]
	rsb	r3, r0, r3
	ldr	r0, [r8, #852]
	ldrb	r2, [r2, #206]	@ zero_extendqisi2
	and	r1, r7, #15
	cmp	r3, r0
	mov	r3, #0
	add	r2, r2, r1, lsl #3
	mov	r1, #0
	bfi	r3, r2, #0, #7
	mov	r2, r1
	bfi	r2, r1, #0, #24
	ldr	r1, .L203
	str	r2, [fp, #-48]
	mov	r0, #5
	strb	r3, [fp, #-45]
	movcs	r3, #1
	ldrcc	r3, [fp, #-48]
	strcs	r3, [r1, #844]
	movw	r1, #493
	ldrcs	r3, [fp, #-48]
	strcc	r3, [r6, #8]
	ldr	r2, .L203+12
	bl	dprint_normal
	ldr	r3, [fp, #-80]
	ldr	ip, [r8, #848]
	add	r2, r6, #3
	ldr	r0, [r8, #852]
	ldr	r1, [r3, #224]
	mov	r3, #0
	str	r3, [fp, #-48]
	rsb	r2, ip, r2
	cmp	r1, r3
	bicne	r1, r7, #15
	ldrne	r3, [fp, #-76]
	rsbne	r1, r3, r1
	ldr	r3, [fp, #-48]
	bicne	r1, r1, #-16777216
	cmp	r2, r0
	ldr	r2, .L203
	bfi	r3, r1, #0, #24
	mov	r0, #5
	str	r3, [fp, #-48]
	movcs	r1, #1
	strcc	r3, [r6, #12]
	strcs	r1, [r2, #844]
	movw	r1, #499
	ldr	r2, .L203+16
	bl	dprint_normal
	ldr	r7, [fp, #-80]
	mov	r1, #0
	str	r1, [fp, #-48]
	ldr	lr, [r8, #848]
	ldrb	r3, [r7, #204]	@ zero_extendqisi2
	ldrb	r2, [r7, #203]	@ zero_extendqisi2
	and	r3, r3, #31
	ldr	r0, [r8, #852]
	bfi	r3, r2, #5, #2
	strb	r3, [fp, #-48]
	ldrb	r3, [r7, #202]	@ zero_extendqisi2
	add	r2, r6, #4
	ldrh	r1, [fp, #-48]
	rsb	r2, lr, r2
	ldrb	ip, [r7, #200]	@ zero_extendqisi2
	cmp	r2, r0
	bfi	r1, r3, #7, #3
	strh	r1, [fp, #-48]	@ movhi
	ldr	r2, .L203
	mov	r0, #5
	mov	r3, r1, lsr #8
	ldrb	r1, [r7, #201]	@ zero_extendqisi2
	bfi	r3, ip, #2, #3
	bfi	r3, r1, #5, #3
	strb	r3, [fp, #-47]
	ldrcc	r3, [fp, #-48]
	movcs	r3, #1
	movw	r1, #509
	strcs	r3, [r2, #844]
	ldrcs	r3, [fp, #-48]
	strcc	r3, [r6, #16]
	ldr	r2, .L203+20
	bl	dprint_normal
	ldr	r2, [r8, #848]
	ldr	r1, [r8, #852]
	add	r3, r6, #5
	rsb	r3, r2, r3
	mov	r0, #5
	cmp	r3, r1
	ldr	r3, .L203
	mov	r2, #0
	movw	r1, #515
	str	r2, [fp, #-48]
	movcs	r2, #1
	strcc	r2, [r6, #20]
	strcs	r2, [r3, #844]
	mov	r3, #0
	ldr	r2, .L203+24
	bl	dprint_normal
	ldr	r0, [r8, #848]
	ldr	r2, [fp, #-80]
	add	r3, r6, #6
	ldr	r1, [r8, #852]
	rsb	r3, r0, r3
	mov	r0, #5
	cmp	r3, r1
	ldr	r2, [r2, #216]
	ldr	r1, .L203
	mov	r3, #0
	sub	r2, r2, #1
	bfi	r3, r2, #0, #20
	movcs	r2, #1
	str	r3, [fp, #-48]
	strcs	r2, [r1, #844]
	movw	r1, #522
	strcc	r3, [r6, #24]
	ldr	r2, .L203+28
	bl	dprint_normal
	ldr	r0, [r8, #848]
	ldr	r1, [r8, #852]
	add	r2, r6, #7
	rsb	r2, r0, r2
	add	r3, r5, #288
	cmp	r2, r1
	ldr	r2, .L203
	strcc	r3, [r6, #28]
	mov	r0, #5
	movcs	r1, #1
	str	r3, [fp, #-48]
	strcs	r1, [r2, #844]
	mov	r1, #528
	ldr	r2, .L203+32
	bl	dprint_normal
	mov	r3, #1
.L130:
	ldr	r2, [fp, #-72]
	cmp	r2, #0
	ble	.L183
	mov	r10, #0
	mov	r2, r3, asl #3
	add	r3, r4, r3, lsl #5
	mov	r4, r10
	str	r3, [fp, #-120]
	add	r3, r2, #1
	str	r2, [fp, #-88]
	str	r3, [fp, #-92]
	add	r3, r2, #2
	str	r3, [fp, #-96]
	add	r3, r2, #3
	str	r3, [fp, #-100]
	add	r3, r2, #4
	str	r3, [fp, #-104]
	add	r3, r2, #5
	str	r3, [fp, #-116]
	add	r3, r2, #6
	str	r3, [fp, #-112]
	add	r3, r2, #7
	str	r3, [fp, #-108]
.L182:
	mov	r3, r4, asl #2
	mov	r2, r4, asl #5
	rsb	r7, r3, r2
	str	r3, [fp, #-64]
	cmp	r4, #0
	ldr	r3, [fp, #-56]
	str	r2, [fp, #-68]
	add	r7, r3, r7
	ble	.L150
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #-12]
	cmp	r2, r3
	bls	.L151
.L150:
	ldr	r1, [fp, #-88]
	mov	r3, r4, asl #3
	ldr	r9, [r7, #20]
	add	r4, r4, #1
	add	r5, r3, r1
	ldr	r2, [r8, #848]
	ldr	r1, [r8, #852]
	and	r0, r9, #15
	str	r3, [fp, #-60]
	add	r3, r6, r5
	rsb	r2, r2, r3
	ldrb	r3, [r7, #5]	@ zero_extendqisi2
	cmp	r2, r1
	ldr	r1, [r7, #8]
	add	r3, r3, r0, lsl #3
	mov	r2, #0
	bfi	r2, r3, #0, #7
	mov	r3, #0
	bfi	r3, r1, #0, #24
	str	r3, [fp, #-48]
	strb	r2, [fp, #-45]
	movcs	r3, #1
	ldrcs	r2, .L203
	mov	r1, #548
	ldrcc	r3, [fp, #-48]
	mov	r0, #5
	bic	r9, r9, #15
	strcs	r3, [r2, #844]
	strcc	r3, [r6, r5, asl #2]
	ldrcs	r3, [fp, #-48]
	ldr	r2, .L203+4
	bl	dprint_normal
	ldr	r2, [r8, #848]
	add	r3, r5, #1
	ldr	r1, [r8, #852]
	add	r3, r6, r3
	ldr	r0, [fp, #-76]
	rsb	r2, r2, r3
	mov	r3, #0
	cmp	r2, r1
	rsb	r9, r0, r9
	bfi	r3, r9, #0, #24
	mov	r0, #5
	ldrcc	r2, [fp, #-60]
	movcs	r2, #1
	ldrcc	r1, [fp, #-92]
	ldrcs	r1, .L203
	addcc	r2, r2, r1
	str	r3, [fp, #-48]
	strcs	r2, [r1, #844]
	movw	r1, #554
	strcc	r3, [r6, r2, asl #2]
	ldr	r2, .L203+8
	bl	dprint_normal
	ldr	r9, [r7, #24]
	ldr	r1, [r8, #848]
	add	r3, r5, #2
	and	r0, r9, #15
	ldrb	r2, [r7, #6]	@ zero_extendqisi2
	ldr	ip, [r8, #852]
	add	r3, r6, r3
	rsb	r3, r1, r3
	add	r2, r2, r0, lsl #3
	cmp	r3, ip
	ldr	r0, [r7, #12]
	mov	r1, #0
	mov	r3, #0
	bfi	r1, r2, #0, #7
	bfi	r3, r0, #0, #24
	ldrcc	r2, [fp, #-60]
	mov	r0, #5
	str	r3, [fp, #-48]
	movcs	r3, #1
	strb	r1, [fp, #-45]
	ldrcc	r1, [fp, #-96]
	ldrcs	r2, .L203
	ldrcc	r3, [fp, #-48]
	addcc	r2, r2, r1
	movw	r1, #563
	strcs	r3, [r2, #844]
	strcc	r3, [r6, r2, asl #2]
	ldrcs	r3, [fp, #-48]
	ldr	r2, .L203+12
	bl	dprint_normal
	ldr	r3, [r7, #24]
	mov	r2, #0
	str	r2, [fp, #-48]
	cmp	r3, r2
	ldr	r2, [r8, #848]
	bicne	r9, r9, #15
	ldr	r1, [r8, #852]
	ldrne	r3, [fp, #-76]
	moveq	r9, r3
	mov	r0, #5
	rsbne	r9, r3, r9
	add	r3, r5, #3
	add	r3, r6, r3
	bicne	r9, r9, #-16777216
	rsb	r2, r2, r3
	ldr	r3, [fp, #-48]
	cmp	r2, r1
	bfi	r3, r9, #0, #24
	str	r3, [fp, #-48]
	ldrcc	r2, [fp, #-60]
	movcs	r2, #1
	ldrcc	r1, [fp, #-100]
	ldrcs	r1, .L203
	addcc	r2, r2, r1
	strcs	r2, [r1, #844]
	movw	r1, #569
	strcc	r3, [r6, r2, asl #2]
	ldr	r2, .L203+16
	bl	dprint_normal
	ldrb	r3, [r7, #4]	@ zero_extendqisi2
	ldrb	r2, [r7, #3]	@ zero_extendqisi2
	mov	r1, #0
	and	r3, r3, #31
	str	r1, [fp, #-48]
	ldrb	r0, [r7, #2]	@ zero_extendqisi2
	bfi	r3, r2, #5, #2
	strb	r3, [fp, #-48]
	add	r3, r5, #4
	ldrh	r1, [fp, #-48]
	add	r3, r6, r3
	ldr	r2, [r8, #848]
	bfi	r1, r0, #7, #3
	ldrb	ip, [r7]	@ zero_extendqisi2
	ldr	r0, [r8, #852]
	rsb	r3, r2, r3
	mov	r2, r1, lsr #8
	strh	r1, [fp, #-48]	@ movhi
	cmp	r3, r0
	bfi	r2, ip, #2, #3
	ldrb	r1, [r7, #1]	@ zero_extendqisi2
	mov	r0, #5
	mov	r3, r2
	ldrcc	r2, [fp, #-60]
	bfi	r3, r1, #5, #3
	ldrcc	r1, [fp, #-104]
	strb	r3, [fp, #-47]
	movcs	r3, #1
	ldrcs	r2, .L203
	addcc	r2, r2, r1
	ldrcc	r3, [fp, #-48]
	movw	r1, #579
	strcs	r3, [r2, #844]
	strcc	r3, [r6, r2, asl #2]
	ldrcs	r3, [fp, #-48]
	ldr	r2, .L203+20
	bl	dprint_normal
	ldr	r1, [r8, #848]
	add	r2, r5, #5
	ldr	r0, [r8, #852]
	add	r2, r6, r2
	mov	r3, #0
	rsb	r2, r1, r2
	ldr	r1, [r7, #16]
	cmp	r2, r0
	mov	r0, #5
	bfi	r3, r1, #0, #20
	str	r3, [fp, #-48]
	ldrcc	r2, [fp, #-60]
	movcs	r2, #1
	ldrcc	r1, [fp, #-116]
	ldrcs	r1, .L203
	addcc	r2, r2, r1
	strcs	r2, [r1, #844]
	movw	r1, #585
	strcc	r3, [r6, r2, asl #2]
	ldr	r2, .L203+24
	bl	dprint_normal
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-84]
	ldrh	r9, [r3, #158]
	ldrh	r3, [r3, #160]
	ldr	ip, [r2, #2248]
	mul	r9, r3, r9
	cmp	ip, r4
	sub	r9, r9, #1
	ble	.L165
	mov	r10, r4, asl #2
	mov	r3, r4, asl #5
	ldr	r1, [fp, #-56]
	rsb	r2, r10, r3
	ldr	lr, [r7, #16]
	add	r1, r1, r2
	ldr	r7, [r1, #16]
	cmp	lr, r7
	bcc	.L201
	ldr	r0, [fp, #-56]
	sub	r2, r2, #28
	mov	r1, r4
	add	r2, r0, r2
	b	.L168
.L171:
	ldr	r0, [r2, #44]
	cmp	lr, r0
	bcc	.L166
.L168:
	add	r1, r1, #1
	add	r2, r2, #28
	cmp	ip, r1
	bne	.L171
.L169:
	ubfx	r0, r9, #0, #20
.L184:
	cmp	lr, r7
	bcc	.L172
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-68]
	rsb	r3, r2, r3
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	b	.L174
.L176:
	ldr	r2, [r3, #44]
	cmp	r2, lr
	bhi	.L202
.L174:
	add	r4, r4, #1
	add	r3, r3, #28
	cmp	ip, r4
	bgt	.L176
	mov	r7, #0
.L175:
	cmp	ip, r4
	moveq	r7, #0
	mov	r10, r7
.L177:
	ldr	r2, [r8, #848]
	add	r3, r5, #6
	ldr	r1, [r8, #852]
	add	r3, r6, r3
	rsb	r2, r2, r3
	mov	r3, #0
	cmp	r2, r1
	bfi	r3, r0, #0, #20
	mov	r0, #5
	str	r3, [fp, #-48]
	ldrcc	r2, [fp, #-60]
	movcs	r2, #1
	ldrcc	r1, [fp, #-112]
	add	r5, r5, #7
	ldrcs	r1, .L203
	add	r5, r6, r5
	addcc	r2, r2, r1
	sub	r4, r4, #1
	strcs	r2, [r1, #844]
	movw	r1, #594
	strcc	r3, [r6, r2, asl #2]
	ldr	r2, .L203+28
	bl	dprint_normal
	ldr	r2, [r8, #848]
	ldr	r3, [r8, #852]
	mov	r1, #600
	rsb	r5, r2, r5
	mov	r0, #5
	cmp	r5, r3
	str	r7, [fp, #-48]
	ldrcc	r3, [fp, #-60]
	movcs	r3, #1
	ldrcc	r2, [fp, #-108]
	ldrcs	r2, .L203
	addcc	r3, r3, r2
	strcs	r3, [r2, #844]
	strcc	r10, [r6, r3, asl #2]
	mov	r3, r7
	ldr	r2, .L203+32
	bl	dprint_normal
.L151:
	ldr	r3, [fp, #-72]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L182
.L183:
	mov	r0, #0
.L194:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L202:
	mov	r3, r4, asl #5
.L172:
	ldr	r2, [fp, #-120]
	add	r7, r3, r2
	b	.L175
.L201:
	mov	r0, r7
	mov	r1, r4
.L166:
	sub	r0, r0, #1
	cmp	r0, r9
	movcs	r0, r9
	cmp	ip, r1
	beq	.L169
	ldr	r2, [fp, #-56]
	rsb	r10, r10, r3
	ubfx	r0, r0, #0, #20
	add	r10, r2, r10
	ldr	r7, [r10, #16]
	b	.L184
.L165:
	movne	r0, #0
	movne	r7, r0
	bne	.L175
	mov	r10, #0
	ubfx	r0, r9, #0, #20
	mov	r7, r10
	b	.L177
.L200:
	ldr	r3, .L203+36
	mov	r1, #464
	ldr	r2, .L203+40
	bl	dprint_normal
	mvn	r0, #0
	b	.L194
.L204:
	.align	2
.L203:
	.word	g_HwMem
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LANCHOR0
	.word	.LC30
	UNWIND(.fnend)
	.size	H263HAL_WriteSlicMsg, .-H263HAL_WriteSlicMsg
	.align	2
	.global	H263HAL_StartDec
	.type	H263HAL_StartDec, %function
H263HAL_StartDec:
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
	mov	r4, r0
	mov	r5, r1
	bl	H263HAL_CfgDnMsg
	subs	r6, r0, #0
	bne	.L209
	mov	r1, r5
	mov	r0, r4
	bl	H263HAL_WriteSlicMsg
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r0, r6
	ldr	r2, .L210
	mov	r1, #624
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L209:
	ldr	r2, .L210+4
	mov	r1, #616
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L211:
	.align	2
.L210:
	.word	.LC40
	.word	.LC39
	UNWIND(.fnend)
	.size	H263HAL_StartDec, .-H263HAL_StartDec
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.12942, %object
	.size	__func__.12942, 21
__func__.12942:
	.ascii	"H263HAL_WriteSlicMsg\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"line: %d ,pMsgBlock = NULL is not expected value!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC1:
	ASCII(.ascii	"D0=0x%x\012\000" )
	.space	3
.LC2:
	ASCII(.ascii	"D1=0x%x\012\000" )
	.space	3
.LC3:
	ASCII(.ascii	"D2=0x%x\012\000" )
	.space	3
.LC4:
	ASCII(.ascii	"D3=0x%x\012\000" )
	.space	3
.LC5:
	ASCII(.ascii	"D4=0x%x\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"D5=0x%x\012\000" )
	.space	3
.LC7:
	ASCII(.ascii	"D6=0x%x\012\000" )
	.space	3
.LC8:
	ASCII(.ascii	"D7=0x%x\012\000" )
	.space	3
.LC9:
	ASCII(.ascii	"D8=0x%x\012\000" )
	.space	3
.LC10:
	ASCII(.ascii	"D9=0x%x\012\000" )
	.space	3
.LC11:
	ASCII(.ascii	"D10=0x%x\012\000" )
	.space	2
.LC12:
	ASCII(.ascii	"D11=0x%x\012\000" )
	.space	2
.LC13:
	ASCII(.ascii	"D12= 0x%x\012\000" )
	.space	1
.LC14:
	ASCII(.ascii	"D13= 0x%x\012\000" )
	.space	1
.LC15:
	ASCII(.ascii	"D14= 0x%x\012\000" )
	.space	1
.LC16:
	ASCII(.ascii	"D15= 0x%x\012\000" )
	.space	1
.LC17:
	ASCII(.ascii	"D16= 0x%x\012\000" )
	.space	1
.LC18:
	ASCII(.ascii	"D17= 0x%x\012\000" )
	.space	1
.LC19:
	ASCII(.ascii	"D18= 0x%x\012\000" )
	.space	1
.LC20:
	ASCII(.ascii	"D19= 0x%x\012\000" )
	.space	1
.LC21:
	ASCII(.ascii	"D20= 0x%x\012\000" )
	.space	1
.LC22:
	ASCII(.ascii	"D21= 0x%x\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"D22= 0x%x\012\000" )
	.space	1
.LC24:
	ASCII(.ascii	"D23= 0x%x\012\000" )
	.space	1
.LC25:
	ASCII(.ascii	"D24= 0x%x\012\000" )
	.space	1
.LC26:
	ASCII(.ascii	"D25= 0x%x\012\000" )
	.space	1
.LC27:
	ASCII(.ascii	"D26= 0x%x\012\000" )
	.space	1
.LC28:
	ASCII(.ascii	"D27= 0x%x\012\000" )
	.space	1
.LC29:
	ASCII(.ascii	"D63= 0x%x\012\000" )
	.space	1
.LC30:
	ASCII(.ascii	"%s: SlcDnMsgVirAddr = NULL\012\000" )
.LC31:
	ASCII(.ascii	"D0 = %#x \012\000" )
	.space	1
.LC32:
	ASCII(.ascii	"D1 = %#x \012\000" )
	.space	1
.LC33:
	ASCII(.ascii	"D2 = %#x \012\000" )
	.space	1
.LC34:
	ASCII(.ascii	"D3 = %#x \012\000" )
	.space	1
.LC35:
	ASCII(.ascii	"D4 = %#x \012\000" )
	.space	1
.LC36:
	ASCII(.ascii	"D5 = %#x \012\000" )
	.space	1
.LC37:
	ASCII(.ascii	"D6 = %#x \012\000" )
	.space	1
.LC38:
	ASCII(.ascii	"D7 = %#x \012\000" )
	.space	1
.LC39:
	ASCII(.ascii	"H263HAL_CfgDnMsg failed!\012\000" )
	.space	2
.LC40:
	ASCII(.ascii	"H263HAL_WriteSlicMsg failed!\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
