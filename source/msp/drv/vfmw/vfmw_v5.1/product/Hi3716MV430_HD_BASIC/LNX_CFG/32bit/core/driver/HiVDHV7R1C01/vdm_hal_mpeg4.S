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
	.file	"vdm_hal_mpeg4.c"
	.text
	.align	2
	.global	MP4HAL_Log2bin
	.type	MP4HAL_Log2bin, %function
MP4HAL_Log2bin:
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
	.size	MP4HAL_Log2bin, .-MP4HAL_Log2bin
	.global	__aeabi_idiv
	.align	2
	.global	MP4HAL_CfgDnMsg
	.type	MP4HAL_CfgDnMsg, %function
MP4HAL_CfgDnMsg:
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
	ldrh	r2, [r0, #154]
	ldrh	r3, [r0, #152]
	mov	r7, r0
	str	r1, [fp, #-48]
	mul	r3, r3, r2
	cmp	r3, #0
	beq	.L106
	mov	r6, #0
.L9:
	add	r6, r6, #1
	movs	r3, r3, lsr #1
	uxth	r6, r6
	bne	.L9
.L8:
	ldr	r2, [fp, #-48]
	mov	r3, #1000
	ldr	r4, .L123
	mla	r3, r3, r2, r4
	ldr	r0, [r3, #32]
	bl	MEM_Phy2Vir
	subs	r5, r0, #0
	beq	.L114
	ldrb	r3, [r7, #2]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L115
	ldr	r3, [r4, #848]
	mov	r1, #146
	ldr	r2, [r4, #852]
	mov	r0, #5
	rsb	r3, r3, r5
	add	r8, r7, #12288
	cmp	r3, r2
	ldr	r2, .L123+4
	and	r6, r6, #15
	movcs	r3, #1
	movcc	r3, #0
	strcs	r3, [r4, #844]
	strcc	r3, [r5]
	mov	r3, #0
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldrb	r1, [r7, #3]	@ zero_extendqisi2
	add	r2, r5, #4
	ldr	r0, [r4, #852]
	rsb	r2, r3, r2
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r2, r0
	and	r2, r1, #31
	ldr	r1, .L123
	mov	r0, #5
	mov	r3, r3, asl #31
	orr	r3, r3, r2, asl #26
	movcs	r2, #1
	strcc	r3, [r5, #4]
	strcs	r2, [r1, #844]
	mov	r1, #153
	ldr	r2, .L123+8
	bl	dprint_normal
	ldrb	r1, [r7]	@ zero_extendqisi2
	ldrb	r0, [r7, #15]	@ zero_extendqisi2
	cmp	r1, #2
	and	r2, r1, #3
	and	r0, r0, #1
	ldrb	lr, [r7, #14]	@ zero_extendqisi2
	moveq	ip, #0
	ldrneb	ip, [r7, #12]	@ zero_extendqisi2
	and	lr, lr, #1
	streqb	ip, [r7, #12]
	andne	ip, ip, #1
	ldr	r1, [r8, #2276]
	ldr	r9, [r8, #2280]
	movne	ip, ip, asl #3
	ldr	r3, [r8, #2284]
	and	r1, r1, #3
	orr	r1, r0, r1, asl #26
	and	r0, r3, #3
	orr	r1, r1, r9, asl #30
	ldrb	r3, [r7, #13]	@ zero_extendqisi2
	orr	r9, r1, r0, asl #28
	ldrb	r1, [r7, #11]	@ zero_extendqisi2
	ldrb	r0, [r7, #10]	@ zero_extendqisi2
	and	r10, r3, #1
	orr	lr, r9, lr, asl #1
	and	r1, r1, #1
	orr	r3, lr, r10, asl #2
	ldrb	lr, [r7, #9]	@ zero_extendqisi2
	mov	r0, r0, asl #7
	ldrb	r9, [r7, #7]	@ zero_extendqisi2
	orr	r3, r3, r1, asl #4
	and	lr, lr, #7
	orr	r1, r3, r2, asl #5
	uxtb	r0, r0
	ldrb	r3, [r7, #8]	@ zero_extendqisi2
	orr	r1, r1, r0
	and	r9, r9, #7
	ldrb	r0, [r7, #6]	@ zero_extendqisi2
	orr	r1, r1, lr, asl #8
	and	r3, r3, #7
	orr	r2, r1, r9, asl #11
	ldr	lr, [r4, #848]
	and	r0, r0, #31
	ldr	r9, [r4, #852]
	orr	r2, r2, r3, asl #14
	add	r1, r5, #8
	rsb	r1, lr, r1
	orr	r3, r2, r0, asl #17
	ldr	r2, .L123
	cmp	r1, r9
	orr	r6, r3, r6, asl #22
	mov	r0, #5
	movcs	r1, #1
	orr	r3, r6, ip
	strcs	r1, [r2, #844]
	mov	r1, #178
	strcc	r3, [r5, #8]
	ldr	r2, .L123+12
	bl	dprint_normal
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L116
.L19:
	ldr	r0, [r4, #848]
	add	r2, r5, #16
	ldrh	r3, [r7, #152]
	rsb	r2, r0, r2
	ldr	r0, [r4, #852]
	ldrh	r1, [r7, #154]
	sub	r3, r3, #1
	cmp	r2, r0
	ldr	r2, .L123
	sub	r1, r1, #1
	uxth	r3, r3
	mov	r0, #5
	orr	r3, r3, r1, asl #16
	movcs	r1, #1
	strcc	r3, [r5, #16]
	strcs	r1, [r2, #844]
	mov	r1, #196
	ldr	r2, .L123+16
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r3, [r4, #852]
	add	r2, r5, #20
	rsb	r2, r1, r2
	ldr	r1, [r8, #2268]
	cmp	r2, r3
	ldr	r2, .L123
	ldr	r3, [r8, #2272]
	mov	r0, #5
	orr	r3, r3, r1, asl #16
	movcs	r1, #1
	strcc	r3, [r5, #20]
	strcs	r1, [r2, #844]
	mov	r1, #202
	ldr	r2, .L123+20
	bl	dprint_normal
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L117
.L34:
	ldr	r1, [r4, #848]
	add	r3, r5, #32
	ldr	r2, [r4, #852]
	mov	r0, #5
	rsb	r3, r1, r3
	ldr	r1, .L123
	cmp	r3, r2
	ldr	r2, .L123+24
	movcs	r3, #1
	movcc	r3, #0
	strcs	r3, [r1, #844]
	mov	r1, #247
	strcc	r3, [r5, #32]
	mov	r3, #0
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r5, #36
	rsb	r3, r1, r3
	ldr	r1, .L123
	cmp	r3, r2
	mov	r0, #5
	ldr	r2, .L123+28
	movcs	r3, #1
	movcc	r3, #0
	strcs	r3, [r1, #844]
	mov	r1, #253
	strcc	r3, [r5, #36]
	mov	r3, #0
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r5, #40
	rsb	r3, r1, r3
	ldr	r1, .L123
	cmp	r3, r2
	mov	r0, #5
	ldr	r2, .L123+32
	movcs	r3, #1
	movcc	r3, #0
	strcs	r3, [r1, #844]
	movw	r1, #259
	strcc	r3, [r5, #40]
	mov	r3, #0
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r5, #44
	rsb	r3, r1, r3
	ldr	r1, .L123
	cmp	r3, r2
	mov	r0, #5
	ldr	r2, .L123+36
	movcs	r3, #1
	movcc	r3, #0
	strcs	r3, [r1, #844]
	movw	r1, #265
	strcc	r3, [r5, #44]
	mov	r3, #0
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #48
	rsb	r2, r3, r2
	ldr	r3, [r7, #188]
	cmp	r2, r1
	ldr	r2, .L123
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #48]
	strcs	r1, [r2, #844]
	movw	r1, #273
	ldr	r2, .L123+40
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #52
	rsb	r2, r3, r2
	ldr	r3, [r7, #172]
	cmp	r2, r1
	ldr	r2, .L123
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #52]
	strcs	r1, [r2, #844]
	movw	r1, #279
	ldr	r2, .L123+44
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #56
	rsb	r2, r3, r2
	ldr	r3, [r7, #176]
	cmp	r2, r1
	ldr	r2, .L123
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #56]
	strcs	r1, [r2, #844]
	movw	r1, #285
	ldr	r2, .L123+48
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #60
	rsb	r2, r3, r2
	ldr	r3, [r7, #180]
	cmp	r2, r1
	ldr	r2, .L123
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #60]
	strcs	r1, [r2, #844]
	movw	r1, #291
	ldr	r2, .L123+52
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #64
	rsb	r2, r3, r2
	ldr	r3, [r7, #184]
	cmp	r2, r1
	ldr	r2, .L123
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #64]
	strcs	r1, [r2, #844]
	movw	r1, #297
	ldr	r2, .L123+56
	bl	dprint_normal
	ldr	r3, [fp, #-48]
	mov	r2, #1000
	ldr	r0, [r4, #848]
	ldr	r1, [r4, #852]
	mla	r2, r2, r3, r4
	add	r3, r5, #68
	rsb	r3, r0, r3
	ldr	r0, .L123
	cmp	r3, r1
	movw	r1, #303
	ldr	r3, [r2, #864]
	movcs	r2, #1
	strcs	r2, [r0, #844]
	mov	r0, #5
	ldr	r2, .L123+60
	strcc	r3, [r5, #68]
	bl	dprint_normal
	ldr	r3, [fp, #-48]
	mov	r2, #1000
	ldr	r0, [r4, #848]
	ldr	r1, [r4, #852]
	mla	r2, r2, r3, r4
	add	r3, r5, #72
	rsb	r3, r0, r3
	ldr	r0, .L123
	cmp	r3, r1
	movw	r1, #309
	ldr	r3, [r2, #888]
	movcs	r2, #1
	strcs	r2, [r0, #844]
	mov	r0, #5
	ldr	r2, .L123+64
	strcc	r3, [r5, #72]
	bl	dprint_normal
	ldrb	r3, [r7]	@ zero_extendqisi2
	mov	r2, #0
	strb	r2, [r7, #149]
	cmp	r3, #3
	beq	.L118
.L70:
	ldrb	r3, [r7, #145]	@ zero_extendqisi2
	and	ip, r3, #1
	strb	r3, [r7, #144]
	mov	r1, ip, asl #3
.L72:
	ldrb	r3, [r7, #148]	@ zero_extendqisi2
	add	r0, r5, #76
	ldrb	r2, [r7, #147]	@ zero_extendqisi2
	ldr	lr, [r4, #848]
	and	r3, r3, #1
	and	r2, r2, #1
	rsb	r0, lr, r0
	orr	r2, r2, r3, asl #1
	ldr	lr, [r4, #852]
	orr	r3, r2, r1
	ldr	r2, .L123
	orr	r3, r3, ip, asl #2
	cmp	r0, lr
	mov	r0, #5
	strcc	r3, [r5, #76]
	movcs	r1, #1
	strcs	r1, [r2, #844]
	ldr	r2, .L123+68
	movw	r1, #339
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #80
	rsb	r2, r3, r2
	ldr	r3, [r8, #2288]
	cmp	r2, r1
	ldr	r2, .L123
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #80]
	strcs	r1, [r2, #844]
	movw	r1, #345
	ldr	r2, .L123+72
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #84
	rsb	r2, r3, r2
	ldr	r3, [r8, #2292]
	cmp	r2, r1
	ldr	r2, .L123
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #84]
	strcs	r1, [r2, #844]
	movw	r1, #351
	ldr	r2, .L123+76
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #88
	rsb	r2, r3, r2
	ldr	r3, [r8, #2296]
	cmp	r2, r1
	ldr	r2, .L123
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #88]
	strcs	r1, [r2, #844]
	movw	r1, #357
	ldr	r2, .L123+80
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #92
	rsb	r2, r3, r2
	ldr	r3, [r8, #2300]
	cmp	r2, r1
	ldr	r2, .L123
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #92]
	strcs	r1, [r2, #844]
	movw	r1, #363
	ldr	r2, .L123+84
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #96
	rsb	r2, r3, r2
	ldr	r3, [r8, #2304]
	cmp	r2, r1
	ldr	r2, .L123
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #96]
	strcs	r1, [r2, #844]
	movw	r1, #369
	ldr	r2, .L123+88
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #100
	rsb	r2, r3, r2
	ldr	r3, [r8, #2308]
	cmp	r2, r1
	ldr	r2, .L123
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #100]
	strcs	r1, [r2, #844]
	movw	r1, #375
	ldr	r2, .L123+92
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #104
	rsb	r2, r3, r2
	ldr	r3, [r8, #2312]
	cmp	r2, r1
	ldr	r2, .L123
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #104]
	strcs	r1, [r2, #844]
	movw	r1, #381
	ldr	r2, .L123+96
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #108
	rsb	r2, r3, r2
	ldr	r3, [r8, #2316]
	cmp	r2, r1
	ldr	r2, .L123
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r5, #108]
	strcs	r1, [r2, #844]
	movw	r1, #387
	ldr	r2, .L123+100
	bl	dprint_normal
	ldrb	r3, [r7, #2]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L119
.L91:
	ldr	r7, [r4, #848]
	ldr	lr, [r4, #852]
.L101:
	add	r3, r5, #240
	ldr	r1, [fp, #-48]
	rsb	r3, r7, r3
	mov	r2, #1000
	cmp	r3, lr
	mov	r0, #5
	movcs	r3, #1
	movcc	r3, #0
	strcs	r3, [r4, #844]
	strcc	r3, [r5, #240]
	add	r3, r5, #252
	ldrcc	r7, [r4, #848]
	ldrcc	lr, [r4, #852]
	mla	r4, r2, r1, r4
	rsb	r7, r7, r3
	ldr	r2, .L123
	cmp	r7, lr
	movcs	r1, #1
	strcs	r1, [r2, #844]
	movw	r1, #406
	ldr	r3, [r4, #32]
	ldr	r2, .L123+104
	add	r3, r3, #256
	strcc	r3, [r5, #252]
	bl	dprint_normal
	mov	r0, #0
.L11:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L115:
	ldr	r2, [r4, #848]
	mov	r0, #5
	ldr	r1, [r4, #852]
	and	r6, r6, #15
	rsb	r2, r2, r5
	add	r8, r7, #12288
	cmp	r2, r1
	ldr	r2, .L123+4
	strcs	r3, [r4, #844]
	mov	r1, #124
	movcc	r3, #4
	strcc	r3, [r5]
	mov	r3, #4
	bl	dprint_normal
	ldr	ip, [r4, #848]
	ldrb	r2, [r7, #4]	@ zero_extendqisi2
	add	r1, r5, #4
	ldrb	r0, [r7, #3]	@ zero_extendqisi2
	rsb	r1, ip, r1
	ldr	ip, [r4, #852]
	and	r2, r2, #127
	ldrb	r3, [r7, #5]	@ zero_extendqisi2
	and	r0, r0, #31
	cmp	r1, ip
	ldr	r1, .L123
	mov	r2, r2, asl #5
	sub	r3, r3, #1
	orr	r2, r2, r0, asl #26
	and	r3, r3, #31
	orr	r3, r2, r3
	mov	r0, #5
	movcs	r2, #1
	strcc	r3, [r5, #4]
	strcs	r2, [r1, #844]
	mov	r1, #132
	ldr	r2, .L123+8
	bl	dprint_normal
	ldr	r0, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r5, #8
	ldrb	r3, [r7]	@ zero_extendqisi2
	rsb	r2, r0, r2
	cmp	r2, r1
	ldr	r2, .L123
	and	r3, r3, #3
	mov	r0, #5
	movcs	r1, #1
	mov	r3, r3, asl #5
	strcs	r1, [r2, #844]
	orr	r3, r3, r6, asl #22
	ldr	r2, .L123+12
	strcc	r3, [r5, #8]
	mov	r1, #139
	bl	dprint_normal
	b	.L19
.L119:
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L91
	add	r3, r7, #40
	ldr	r6, [r4, #848]
	ldr	lr, [r4, #852]
	add	r9, r7, #32
	add	r10, r5, #112
	mov	r8, r3
	str	r5, [fp, #-52]
.L92:
	sub	ip, r9, #16
	mov	r5, r10
.L95:
	rsb	r3, r6, r5
	ldrb	r0, [ip, #48]	@ zero_extendqisi2
	cmp	r3, lr
	ldrb	r3, [ip, #32]	@ zero_extendqisi2
	ldrb	r2, [ip]	@ zero_extendqisi2
	add	ip, ip, #8
	ldrb	r1, [ip, #8]	@ zero_extendqisi2
	movcs	r3, #1
	movcc	r3, r3, asl #16
	strcs	r3, [r4, #844]
	orrcc	r3, r3, r0, asl #24
	add	r5, r5, #4
	orrcc	r2, r3, r2
	orrcc	r2, r2, r1, asl #8
	strcc	r2, [r5, #-4]
	ldrcc	r6, [r4, #848]
	ldrcc	lr, [r4, #852]
	cmp	r9, ip
	bne	.L95
	add	r9, r9, #1
	add	r10, r10, #8
	cmp	r9, r8
	bne	.L92
	ldr	r5, [fp, #-52]
	add	r3, r7, #104
	add	r9, r7, #96
	add	r10, r5, #176
	mov	r8, r3
.L97:
	sub	ip, r9, #16
	mov	r5, r10
.L100:
	rsb	r3, r6, r5
	ldrb	r0, [ip, #48]	@ zero_extendqisi2
	cmp	r3, lr
	ldrb	r3, [ip, #32]	@ zero_extendqisi2
	ldrb	r2, [ip]	@ zero_extendqisi2
	mov	r7, r6
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
	ldrcc	r6, [r4, #848]
	ldrcc	lr, [r4, #852]
	movcc	r7, r6
	cmp	r9, ip
	bne	.L100
	add	r9, r9, #1
	add	r10, r10, #8
	cmp	r9, r8
	bne	.L97
	ldr	r5, [fp, #-52]
	b	.L101
.L118:
	ldr	r2, [r8, #2280]
	cmp	r2, #1
	beq	.L120
	bhi	.L70
	ldrb	r1, [r7, #144]	@ zero_extendqisi2
	ldrb	r3, [r7, #145]	@ zero_extendqisi2
	and	r1, r1, #1
	and	ip, r3, #1
	mov	r1, r1, asl #3
	b	.L72
.L117:
	ldr	r3, [r8, #2280]
	cmp	r3, #1
	bne	.L34
	ldrb	r6, [r7, #146]	@ zero_extendqisi2
	cmp	r6, #1
	beq	.L121
	ldr	r2, [r8, #2304]
	add	r1, r5, #24
	ldrb	r0, [r7, #11]	@ zero_extendqisi2
	movs	r2, r2, asl r0
	ldrne	r0, [r8, #2284]
	ldreq	r2, [r8, #2284]
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
	ldr	r0, .L123
	cmp	r1, r2
	mov	r1, #229
	strcc	r3, [r5, #24]
	movcs	r2, #1
	strcs	r2, [r0, #844]
	ldr	r2, .L123+108
	mov	r0, #5
	bl	dprint_normal
	ldr	r3, [r8, #2308]
	ldrb	r1, [r7, #11]	@ zero_extendqisi2
	add	r2, r5, #28
	movs	r3, r3, asl r1
	bne	.L122
	ldr	r1, [r8, #2284]
	mov	r3, #1
	mov	r3, r3, asl r1
	mov	r3, r3, asr #1
	sub	r3, r3, #1
	mov	r3, r3, lsr r1
.L45:
	ldr	r0, [r4, #848]
	ldr	r1, [r4, #852]
	rsb	r2, r0, r2
	ldr	r0, .L123
	cmp	r2, r1
	mov	r1, #236
	strcc	r3, [r5, #28]
	movcs	r2, #1
	strcs	r2, [r0, #844]
	ldr	r2, .L123+112
	mov	r0, #5
	bl	dprint_normal
	b	.L34
.L116:
	ldr	r0, [r4, #848]
	add	r2, r5, #12
	ldr	r3, [r7, #156]
	rsb	r2, r0, r2
	ldr	r0, [r4, #852]
	ldr	r1, [r7, #160]
	cmp	r2, r0
	mov	r3, r3, asl #1
	ldr	r2, .L123
	mov	r0, #5
	uxth	r3, r3
	orr	r3, r3, r1, asl #17
	movcs	r1, #1
	strcc	r3, [r5, #12]
	strcs	r1, [r2, #844]
	mov	r1, #187
	ldr	r2, .L123+116
	bl	dprint_normal
	b	.L19
.L106:
	mov	r6, r3
	b	.L8
.L120:
	ldrb	r3, [r7, #145]	@ zero_extendqisi2
	mov	r1, #8
	strb	r2, [r7, #144]
	and	ip, r3, #1
	b	.L72
.L122:
	ldr	r0, [r8, #2284]
	mov	r1, #1
	mov	r1, r1, asl r0
	add	r3, r3, r1, asr #1
	mov	r3, r3, lsr r0
	b	.L45
.L121:
	ldr	r3, [r8, #2284]
	ldrb	r1, [r7, #11]	@ zero_extendqisi2
	ldr	r0, [r8, #2304]
	rsb	r1, r1, r3
	mov	r1, r6, asl r1
	bl	__aeabi_idiv
	add	r2, r5, #24
	ldr	r1, [r4, #852]
	mov	r3, r0
	ldr	r0, [r4, #848]
	rsb	r2, r0, r2
	ldr	r0, .L123
	cmp	r2, r1
	ldr	r2, .L123+108
	strcc	r3, [r5, #24]
	mov	r1, #214
	strcs	r6, [r0, #844]
	mov	r0, #5
	bl	dprint_normal
	ldr	r3, [r8, #2284]
	ldrb	r1, [r7, #11]	@ zero_extendqisi2
	mov	r6, #1
	ldr	r0, [r8, #2308]
	rsb	r1, r1, r3
	mov	r1, r6, asl r1
	bl	__aeabi_idiv
	add	r2, r5, #28
	ldr	r1, [r4, #852]
	mov	r3, r0
	ldr	r0, [r4, #848]
	rsb	r2, r0, r2
	ldr	r0, .L123
	cmp	r2, r1
	ldr	r2, .L123+112
	strcc	r3, [r5, #28]
	mov	r1, #220
	strcs	r6, [r0, #844]
	mov	r0, #5
	bl	dprint_normal
	b	.L34
.L114:
	mov	r3, #112
	ldr	r2, .L123+120
	mov	r1, r3
	bl	dprint_normal
	mvn	r0, #0
	b	.L11
.L124:
	.align	2
.L123:
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
	.size	MP4HAL_CfgDnMsg, .-MP4HAL_CfgDnMsg
	.align	2
	.global	MP4HAL_WriteSlicMsg
	.type	MP4HAL_WriteSlicMsg, %function
MP4HAL_WriteSlicMsg:
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
	ldr	r8, .L201
	mov	r3, #1000
	mov	r2, r0
	str	r0, [fp, #-80]
	add	r0, r0, #12288
	mla	r1, r3, r1, r8
	ldr	ip, [r2, #192]
	ldr	r3, [r0, #2244]
	mov	r7, #0
	str	r0, [fp, #-84]
	str	ip, [fp, #-76]
	str	r3, [fp, #-72]
	add	r3, r2, #196
	ldr	r5, [r1, #32]
	str	r7, [fp, #-48]
	add	r4, r5, #256
	str	r3, [fp, #-56]
	mov	r0, r4
	bl	MEM_Phy2Vir
	subs	r6, r0, #0
	beq	.L198
	ldr	r3, [fp, #-80]
	ldr	r3, [r3, #220]
	cmp	r3, #0
	beq	.L128
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-48]
	ldr	r1, [r8, #848]
	ldr	ip, [r3, #212]
	bfi	r2, r7, #0, #24
	ldr	lr, [r8, #852]
	rsb	r1, r1, r6
	and	r0, ip, #15
	ldrb	r3, [r3, #202]	@ zero_extendqisi2
	cmp	r1, lr
	mov	r1, r2, lsr #24
	add	r3, r3, r0, lsl #3
	str	r2, [fp, #-48]
	bfi	r1, r3, #0, #7
	strb	r1, [fp, #-45]
	ldrcc	r3, [fp, #-48]
	movcs	r3, #1
	ldr	r2, .L201+4
	movw	r1, #498
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
	ldr	r2, .L201
	rsb	r1, r1, r7
	mov	r3, #0
	mov	r0, #5
	bfi	r3, r1, #0, #24
	movcs	r1, #1
	str	r3, [fp, #-48]
	strcs	r1, [r2, #844]
	mov	r1, #504
	strcc	r3, [r6, #4]
	ldr	r2, .L201+8
	bl	dprint_normal
	ldr	r2, [fp, #-80]
	ldr	r0, [r8, #848]
	add	r3, r6, #2
	ldr	r7, [r2, #216]
	rsb	r3, r0, r3
	ldr	r0, [r8, #852]
	ldrb	r2, [r2, #203]	@ zero_extendqisi2
	and	r1, r7, #15
	cmp	r3, r0
	mov	r3, #0
	add	r2, r2, r1, lsl #3
	mov	r1, #0
	bfi	r3, r2, #0, #7
	mov	r2, r1
	bfi	r2, r1, #0, #24
	ldr	r1, .L201
	str	r2, [fp, #-48]
	mov	r0, #5
	strb	r3, [fp, #-45]
	movcs	r3, #1
	ldrcc	r3, [fp, #-48]
	strcs	r3, [r1, #844]
	movw	r1, #513
	ldrcs	r3, [fp, #-48]
	strcc	r3, [r6, #8]
	ldr	r2, .L201+12
	bl	dprint_normal
	ldr	r3, [fp, #-80]
	ldr	ip, [r8, #848]
	add	r2, r6, #3
	ldr	r0, [r8, #852]
	ldr	r1, [r3, #216]
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
	ldr	r2, .L201
	bfi	r3, r1, #0, #24
	mov	r0, #5
	str	r3, [fp, #-48]
	movcs	r1, #1
	strcc	r3, [r6, #12]
	strcs	r1, [r2, #844]
	movw	r1, #519
	ldr	r2, .L201+16
	bl	dprint_normal
	ldr	r7, [fp, #-80]
	mov	r1, #0
	str	r1, [fp, #-48]
	ldr	lr, [r8, #848]
	ldrb	r3, [r7, #201]	@ zero_extendqisi2
	ldrb	r2, [r7, #200]	@ zero_extendqisi2
	and	r3, r3, #31
	ldr	r0, [r8, #852]
	bfi	r3, r2, #5, #2
	strb	r3, [fp, #-48]
	ldrb	r3, [r7, #199]	@ zero_extendqisi2
	add	r2, r6, #4
	ldrh	r1, [fp, #-48]
	rsb	r2, lr, r2
	ldrb	ip, [r7, #197]	@ zero_extendqisi2
	cmp	r2, r0
	bfi	r1, r3, #7, #3
	strh	r1, [fp, #-48]	@ movhi
	ldr	r2, .L201
	mov	r0, #5
	mov	r3, r1, lsr #8
	ldrb	r1, [r7, #198]	@ zero_extendqisi2
	bfi	r3, ip, #2, #3
	bfi	r3, r1, #5, #3
	strb	r3, [fp, #-47]
	ldrcc	r3, [fp, #-48]
	movcs	r3, #1
	movw	r1, #529
	strcs	r3, [r2, #844]
	ldrcs	r3, [fp, #-48]
	strcc	r3, [r6, #16]
	ldr	r2, .L201+20
	bl	dprint_normal
	ldr	r2, [r8, #848]
	ldr	r1, [r8, #852]
	add	r3, r6, #5
	rsb	r3, r2, r3
	mov	r0, #5
	cmp	r3, r1
	ldr	r3, .L201
	mov	r2, #0
	movw	r1, #535
	str	r2, [fp, #-48]
	movcs	r2, #1
	strcc	r2, [r6, #20]
	strcs	r2, [r3, #844]
	mov	r3, #0
	ldr	r2, .L201+24
	bl	dprint_normal
	ldr	r0, [r8, #848]
	ldr	r2, [fp, #-80]
	add	r3, r6, #6
	ldr	r1, [r8, #852]
	rsb	r3, r0, r3
	mov	r0, #5
	cmp	r3, r1
	ldr	r2, [r2, #220]
	ldr	r1, .L201
	mov	r3, #0
	sub	r2, r2, #1
	bfi	r3, r2, #0, #20
	movcs	r2, #1
	str	r3, [fp, #-48]
	strcs	r2, [r1, #844]
	movw	r1, #542
	strcc	r3, [r6, #24]
	ldr	r2, .L201+28
	bl	dprint_normal
	ldr	r0, [r8, #848]
	ldr	r1, [r8, #852]
	add	r2, r6, #7
	rsb	r2, r0, r2
	add	r3, r5, #288
	cmp	r2, r1
	ldr	r2, .L201
	strcc	r3, [r6, #28]
	mov	r0, #5
	movcs	r1, #1
	str	r3, [fp, #-48]
	strcs	r1, [r2, #844]
	mov	r1, #548
	ldr	r2, .L201+32
	bl	dprint_normal
	mov	r3, #1
.L128:
	ldr	r2, [fp, #-72]
	cmp	r2, #0
	ble	.L181
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
.L180:
	mov	r3, r4, asl #2
	mov	r2, r4, asl #5
	rsb	r7, r3, r2
	str	r3, [fp, #-64]
	cmp	r4, #0
	ldr	r3, [fp, #-56]
	str	r2, [fp, #-68]
	add	r7, r3, r7
	ble	.L148
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #-4]
	cmp	r2, r3
	bls	.L149
.L148:
	ldr	r1, [fp, #-88]
	mov	r3, r4, asl #3
	ldr	r9, [r7, #16]
	add	r4, r4, #1
	add	r5, r3, r1
	ldr	r2, [r8, #848]
	ldr	r1, [r8, #852]
	and	r0, r9, #15
	str	r3, [fp, #-60]
	add	r3, r6, r5
	rsb	r2, r2, r3
	ldrb	r3, [r7, #6]	@ zero_extendqisi2
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
	ldrcs	r2, .L201
	mov	r1, #568
	ldrcc	r3, [fp, #-48]
	mov	r0, #5
	bic	r9, r9, #15
	strcs	r3, [r2, #844]
	strcc	r3, [r6, r5, asl #2]
	ldrcs	r3, [fp, #-48]
	ldr	r2, .L201+4
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
	ldrcs	r1, .L201
	addcc	r2, r2, r1
	str	r3, [fp, #-48]
	strcs	r2, [r1, #844]
	movw	r1, #574
	strcc	r3, [r6, r2, asl #2]
	ldr	r2, .L201+8
	bl	dprint_normal
	ldr	r9, [r7, #20]
	ldr	r1, [r8, #848]
	add	r3, r5, #2
	and	r0, r9, #15
	ldrb	r2, [r7, #7]	@ zero_extendqisi2
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
	ldrcs	r2, .L201
	ldrcc	r3, [fp, #-48]
	addcc	r2, r2, r1
	movw	r1, #583
	strcs	r3, [r2, #844]
	strcc	r3, [r6, r2, asl #2]
	ldrcs	r3, [fp, #-48]
	ldr	r2, .L201+12
	bl	dprint_normal
	ldr	r3, [r7, #20]
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
	ldrcs	r1, .L201
	addcc	r2, r2, r1
	strcs	r2, [r1, #844]
	movw	r1, #589
	strcc	r3, [r6, r2, asl #2]
	ldr	r2, .L201+16
	bl	dprint_normal
	ldrb	r3, [r7, #5]	@ zero_extendqisi2
	ldrb	r2, [r7, #4]	@ zero_extendqisi2
	mov	r1, #0
	and	r3, r3, #31
	str	r1, [fp, #-48]
	ldrb	r0, [r7, #3]	@ zero_extendqisi2
	bfi	r3, r2, #5, #2
	strb	r3, [fp, #-48]
	add	r3, r5, #4
	ldrh	r1, [fp, #-48]
	add	r3, r6, r3
	ldr	r2, [r8, #848]
	bfi	r1, r0, #7, #3
	ldrb	ip, [r7, #1]	@ zero_extendqisi2
	ldr	r0, [r8, #852]
	rsb	r3, r2, r3
	mov	r2, r1, lsr #8
	strh	r1, [fp, #-48]	@ movhi
	cmp	r3, r0
	bfi	r2, ip, #2, #3
	ldrb	r1, [r7, #2]	@ zero_extendqisi2
	mov	r0, #5
	mov	r3, r2
	ldrcc	r2, [fp, #-60]
	bfi	r3, r1, #5, #3
	ldrcc	r1, [fp, #-104]
	strb	r3, [fp, #-47]
	movcs	r3, #1
	ldrcs	r2, .L201
	addcc	r2, r2, r1
	ldrcc	r3, [fp, #-48]
	movw	r1, #599
	strcs	r3, [r2, #844]
	strcc	r3, [r6, r2, asl #2]
	ldrcs	r3, [fp, #-48]
	ldr	r2, .L201+20
	bl	dprint_normal
	ldr	r1, [r8, #848]
	add	r2, r5, #5
	ldr	r0, [r8, #852]
	add	r2, r6, r2
	mov	r3, #0
	rsb	r2, r1, r2
	ldr	r1, [r7, #24]
	cmp	r2, r0
	mov	r0, #5
	bfi	r3, r1, #0, #20
	str	r3, [fp, #-48]
	ldrcc	r2, [fp, #-60]
	movcs	r2, #1
	ldrcc	r1, [fp, #-116]
	ldrcs	r1, .L201
	addcc	r2, r2, r1
	strcs	r2, [r1, #844]
	movw	r1, #605
	strcc	r3, [r6, r2, asl #2]
	ldr	r2, .L201+24
	bl	dprint_normal
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-84]
	ldrh	r9, [r3, #152]
	ldrh	r3, [r3, #154]
	ldr	ip, [r2, #2244]
	mul	r9, r3, r9
	cmp	ip, r4
	sub	r9, r9, #1
	ble	.L163
	mov	r10, r4, asl #2
	mov	r3, r4, asl #5
	ldr	r1, [fp, #-56]
	rsb	r2, r10, r3
	ldr	lr, [r7, #24]
	add	r1, r1, r2
	ldr	r7, [r1, #24]
	cmp	lr, r7
	bcc	.L199
	ldr	r0, [fp, #-56]
	sub	r2, r2, #28
	mov	r1, r4
	add	r2, r0, r2
	b	.L166
.L169:
	ldr	r0, [r2, #52]
	cmp	lr, r0
	bcc	.L164
.L166:
	add	r1, r1, #1
	add	r2, r2, #28
	cmp	ip, r1
	bne	.L169
.L167:
	ubfx	r0, r9, #0, #20
.L182:
	cmp	lr, r7
	bcc	.L170
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-68]
	rsb	r3, r2, r3
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	b	.L172
.L174:
	ldr	r2, [r3, #52]
	cmp	r2, lr
	bhi	.L200
.L172:
	add	r4, r4, #1
	add	r3, r3, #28
	cmp	ip, r4
	bgt	.L174
	mov	r7, #0
.L173:
	cmp	ip, r4
	moveq	r7, #0
	mov	r10, r7
.L175:
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
	ldrcs	r1, .L201
	add	r5, r6, r5
	addcc	r2, r2, r1
	sub	r4, r4, #1
	strcs	r2, [r1, #844]
	movw	r1, #614
	strcc	r3, [r6, r2, asl #2]
	ldr	r2, .L201+28
	bl	dprint_normal
	ldr	r2, [r8, #848]
	ldr	r3, [r8, #852]
	mov	r1, #620
	rsb	r5, r2, r5
	mov	r0, #5
	cmp	r5, r3
	str	r7, [fp, #-48]
	ldrcc	r3, [fp, #-60]
	movcs	r3, #1
	ldrcc	r2, [fp, #-108]
	ldrcs	r2, .L201
	addcc	r3, r3, r2
	strcs	r3, [r2, #844]
	strcc	r10, [r6, r3, asl #2]
	mov	r3, r7
	ldr	r2, .L201+32
	bl	dprint_normal
.L149:
	ldr	r3, [fp, #-72]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L180
.L181:
	mov	r0, #0
.L192:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L200:
	mov	r3, r4, asl #5
.L170:
	ldr	r2, [fp, #-120]
	add	r7, r3, r2
	b	.L173
.L199:
	mov	r0, r7
	mov	r1, r4
.L164:
	sub	r0, r0, #1
	cmp	r0, r9
	movcs	r0, r9
	cmp	ip, r1
	beq	.L167
	ldr	r2, [fp, #-56]
	rsb	r10, r10, r3
	ubfx	r0, r0, #0, #20
	add	r10, r2, r10
	ldr	r7, [r10, #24]
	b	.L182
.L163:
	movne	r0, #0
	movne	r7, r0
	bne	.L173
	mov	r10, #0
	ubfx	r0, r9, #0, #20
	mov	r7, r10
	b	.L175
.L198:
	ldr	r3, .L201+36
	mov	r1, #484
	ldr	r2, .L201+40
	bl	dprint_normal
	mvn	r0, #0
	b	.L192
.L202:
	.align	2
.L201:
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
	.size	MP4HAL_WriteSlicMsg, .-MP4HAL_WriteSlicMsg
	.align	2
	.global	MP4HAL_StartDec
	.type	MP4HAL_StartDec, %function
MP4HAL_StartDec:
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
	bl	MP4HAL_CfgDnMsg
	subs	r6, r0, #0
	bne	.L207
	mov	r1, r5
	mov	r0, r4
	bl	MP4HAL_WriteSlicMsg
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r0, r6
	ldr	r2, .L208
	mov	r1, #43
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L207:
	ldr	r2, .L208+4
	mov	r1, #35
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L209:
	.align	2
.L208:
	.word	.LC40
	.word	.LC39
	UNWIND(.fnend)
	.size	MP4HAL_StartDec, .-MP4HAL_StartDec
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.10354, %object
	.size	__func__.10354, 20
__func__.10354:
	.ascii	"MP4HAL_WriteSlicMsg\000"
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
	ASCII(.ascii	"MP4HAL_CfgDnMsg failed!\012\000" )
	.space	3
.LC40:
	ASCII(.ascii	"MP4HAL_WriteSlicMsg failed!\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
