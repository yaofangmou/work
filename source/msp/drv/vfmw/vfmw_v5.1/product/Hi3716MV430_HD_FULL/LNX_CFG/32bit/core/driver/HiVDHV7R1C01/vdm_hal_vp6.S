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
	.file	"vdm_hal_vp6.c"
	.text
	.align	2
	.global	VP6HAL_CfgDnMsg
	.type	VP6HAL_CfgDnMsg, %function
VP6HAL_CfgDnMsg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	mov	r4, r0
	ldr	r0, [r1, #32]
	mov	r7, r1
	bl	MEM_Phy2Vir
	subs	r6, r0, #0
	beq	.L58
	ldr	r5, .L65
	mov	r3, #0
	ldr	r1, [r4, #64]
	mov	r2, #0
	str	r3, [fp, #-40]
	mov	r0, #5
	ldr	r3, [r5, #848]
	bfi	r2, r1, #0, #1
	ldr	r1, [r5, #852]
	rsb	r3, r3, r6
	strb	r2, [fp, #-40]
	cmp	r3, r1
	mov	r1, #41
	ldrcc	r3, [fp, #-40]
	movcs	r2, #1
	ldrcs	r3, [fp, #-40]
	strcs	r2, [r5, #844]
	strcc	r3, [r6]
	ldr	r2, .L65+4
	bl	dprint_normal
	ldrh	r2, [r4, #54]
	ldrh	r0, [r4, #56]
	add	r3, r6, #4
	ldr	ip, [r5, #848]
	sub	r2, r2, #1
	sub	r0, r0, #1
	mov	r1, #0	@ movhi
	rsb	r3, ip, r3
	ldr	ip, [r5, #852]
	bfi	r1, r2, #0, #9
	mov	r2, #0	@ movhi
	bfi	r2, r0, #0, #9
	cmp	r3, ip
	mov	r0, r1, lsr #8
	strh	r1, [fp, #-40]	@ movhi
	mov	r3, r2, lsr #8
	mov	r1, #0
	strh	r2, [fp, #-38]	@ movhi
	bfi	r3, r1, #1, #7
	bfi	r0, r1, #1, #7
	strb	r3, [fp, #-37]
	strb	r0, [fp, #-39]
	movcs	r1, #1
	ldrcc	r3, [fp, #-40]
	mov	r0, #5
	ldr	r2, .L65
	ldrcs	r3, [fp, #-40]
	strcc	r3, [r6, #4]
	strcs	r1, [r2, #844]
	mov	r1, #51
	ldr	r2, .L65+8
	bl	dprint_normal
	ldr	r3, [r4, #104]
	ldr	ip, [r4, #108]
	add	r2, r6, #8
	and	r3, r3, #31
	ldr	r0, [r4, #112]
	bfi	r3, ip, #5, #2
	ldr	ip, [r5, #848]
	ldr	r1, [r4, #76]
	ldr	lr, [r4, #72]
	rsb	r2, ip, r2
	ldr	ip, [r5, #852]
	mov	r0, r0, lsr #1
	and	r1, r1, #1
	bfi	r3, lr, #7, #1
	cmp	r2, ip
	bfi	r1, r0, #1, #1
	ldr	r2, .L65
	mov	r0, #0
	str	r0, [fp, #-40]
	strb	r1, [fp, #-39]
	movcs	r1, #1
	strb	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	bfi	r3, r0, #10, #22
	mov	r0, #5
	str	r3, [fp, #-40]
	strcs	r1, [r2, #844]
	mov	r1, #63
	strcc	r3, [r6, #8]
	ldr	r2, .L65+12
	bl	dprint_normal
	ldr	r3, [r4, #100]
	ldr	r2, [r4, #96]
	mov	r1, #0
	and	r3, r3, #31
	str	r1, [fp, #-40]
	bfi	r3, r2, #5, #3
	strb	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	add	r2, r6, #12
	ldr	r0, [r4, #92]
	ldr	ip, [r4, #88]
	bfi	r3, r0, #8, #10
	ldr	r0, [r5, #848]
	str	r3, [fp, #-40]
	rsb	r2, r0, r2
	ldr	r0, [r5, #852]
	mov	r3, r3, lsr #16
	cmp	r2, r0
	bfi	r3, ip, #2, #2
	strb	r3, [fp, #-38]
	mov	r0, #5
	ldrh	r3, [fp, #-38]
	ldr	r2, .L65
	bfi	r3, r1, #4, #12
	strh	r3, [fp, #-38]	@ movhi
	ldrcc	r3, [fp, #-40]
	movcs	r1, #1
	ldrcs	r3, [fp, #-40]
	strcs	r1, [r2, #844]
	mov	r1, #74
	strcc	r3, [r6, #12]
	ldr	r2, .L65+16
	bl	dprint_normal
	ldrb	r2, [r4]	@ zero_extendqisi2
	ldr	ip, [r4, #80]
	mov	r1, #0
	mov	r3, #0
	str	r1, [fp, #-40]
	bfi	r3, r2, #0, #4
	strb	r3, [fp, #-40]
	ldrh	r3, [fp, #-40]
	add	r2, r6, #16
	ldr	r0, [r4, #84]
	bfi	r3, ip, #4, #8
	strh	r3, [fp, #-40]	@ movhi
	ldr	r3, [fp, #-40]
	ldr	ip, [r5, #848]
	bfi	r3, r0, #12, #9
	ldr	r0, [r5, #852]
	rsb	r2, ip, r2
	str	r3, [fp, #-40]
	cmp	r2, r0
	mov	r3, r3, lsr #16
	bfi	r3, r1, #5, #11
	ldr	r2, .L65
	strh	r3, [fp, #-38]	@ movhi
	movcs	r1, #1
	ldrcc	r3, [fp, #-40]
	mov	r0, #5
	strcs	r1, [r2, #844]
	mov	r1, #84
	ldrcs	r3, [fp, #-40]
	strcc	r3, [r6, #16]
	ldr	r2, .L65+20
	bl	dprint_normal
	ldr	r3, [r5, #848]
	ldr	r1, [r5, #852]
	add	r2, r6, #32
	rsb	r2, r3, r2
	ldr	r3, [r4, #164]
	cmp	r2, r1
	ldr	r2, .L65
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r6, #32]
	strcs	r1, [r2, #844]
	mov	r1, #91
	ldr	r2, .L65+24
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	r2, [r4, #172]
	add	r3, r6, #36
	ldr	ip, [r5, #848]
	mov	r1, #0
	ldr	r0, [r5, #852]
	bfi	r1, r2, #0, #4
	rsb	r3, ip, r3
	mov	r2, #0
	str	r2, [fp, #-40]
	cmp	r3, r0
	strb	r1, [fp, #-38]
	mov	r0, #5
	ldr	r1, [r4, #168]
	ldrh	r3, [fp, #-38]
	strb	r2, [fp, #-39]
	bfi	r3, r2, #4, #12
	strb	r1, [fp, #-40]
	strh	r3, [fp, #-38]	@ movhi
	movcs	r1, #1
	ldrcc	r3, [fp, #-40]
	ldr	r2, .L65
	ldrcs	r3, [fp, #-40]
	strcc	r3, [r6, #36]
	strcs	r1, [r2, #844]
	mov	r1, #101
	ldr	r2, .L65+28
	bl	dprint_normal
	ldr	r3, [r4, #172]
	ldr	r2, [r4, #120]
	add	r1, r6, #64
	add	r3, r3, #8
	ldr	r0, [r4, #116]
	cmp	r3, r2
	ldr	ip, [r5, #848]
	addhi	r2, r2, #128
	add	r0, r3, r0
	ldrhi	r8, [r4, #124]
	rsbls	r2, r3, r2
	rsbhi	r2, r3, r2
	mov	r3, #0
	bfi	r3, r0, #0, #25
	ldr	r0, [r5, #852]
	rsb	r1, ip, r1
	ldrls	r8, [r4, #124]
	subhi	r8, r8, #16
	cmp	r1, r0
	str	r3, [fp, #-40]
	mov	r3, r3, lsr #24
	bfi	r3, r2, #1, #7
	ldr	r2, .L65
	strb	r3, [fp, #-37]
	mov	r1, #124
	ldrcc	r3, [fp, #-40]
	movcs	r3, #1
	mov	r0, #5
	strcs	r3, [r2, #844]
	ldrcs	r3, [fp, #-40]
	strcc	r3, [r6, #64]
	ldr	r2, .L65+32
	bl	dprint_normal
	ldr	r1, [r5, #848]
	ldr	r2, [r5, #852]
	add	r3, r6, #68
	rsb	r3, r1, r3
	mov	r0, #5
	cmp	r3, r2
	ldr	r3, .L65
	strcc	r8, [r6, #68]
	mov	r1, #131
	movcs	r2, #1
	str	r8, [fp, #-40]
	strcs	r2, [r3, #844]
	mov	r3, r8
	ldr	r2, .L65+36
	bl	dprint_normal
	ldr	r1, [r4, #128]
	ldr	ip, [r5, #848]
	add	r3, r6, #72
	ldr	r0, [r5, #852]
	mov	r2, #0
	rsb	r3, ip, r3
	bfi	r2, r1, #0, #25
	cmp	r3, r0
	ldr	r1, [r4, #132]
	mov	r3, r2, lsr #24
	str	r2, [fp, #-40]
	bfi	r3, r1, #1, #7
	ldr	r2, .L65
	strb	r3, [fp, #-37]
	movcs	r1, #1
	ldrcc	r3, [fp, #-40]
	mov	r0, #5
	strcs	r1, [r2, #844]
	mov	r1, #139
	ldrcs	r3, [fp, #-40]
	strcc	r3, [r6, #72]
	ldr	r2, .L65+40
	bl	dprint_normal
	ldr	r3, [r5, #848]
	ldr	r1, [r5, #852]
	add	r2, r6, #76
	rsb	r2, r3, r2
	ldr	r3, [r4, #136]
	cmp	r2, r1
	ldr	r2, .L65
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r6, #76]
	strcs	r1, [r2, #844]
	mov	r1, #146
	ldr	r2, .L65+44
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	r1, [r4, #140]
	add	r3, r6, #80
	ldr	ip, [r5, #848]
	mov	r2, #0
	ldr	r0, [r5, #852]
	bfi	r2, r1, #0, #25
	rsb	r3, ip, r3
	ldr	r1, [r4, #144]
	cmp	r3, r0
	mov	r3, r2, lsr #24
	bfi	r3, r1, #1, #7
	str	r2, [fp, #-40]
	strb	r3, [fp, #-37]
	movcs	r1, #1
	ldrcc	r3, [fp, #-40]
	mov	r0, #5
	ldr	r2, .L65
	ldrcs	r3, [fp, #-40]
	strcc	r3, [r6, #80]
	strcs	r1, [r2, #844]
	mov	r1, #154
	ldr	r2, .L65+48
	bl	dprint_normal
	ldr	r3, [r5, #848]
	ldr	r1, [r5, #852]
	add	r2, r6, #84
	rsb	r2, r3, r2
	ldr	r3, [r4, #148]
	cmp	r2, r1
	ldr	r2, .L65
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r6, #84]
	strcs	r1, [r2, #844]
	mov	r1, #161
	ldr	r2, .L65+52
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	ip, [r5, #848]
	add	r3, r6, #88
	ldr	r1, [r4, #152]
	mov	r2, #0
	ldr	r0, [r5, #852]
	rsb	r3, ip, r3
	bfi	r2, r1, #0, #25
	ldr	r1, [r4, #156]
	cmp	r3, r0
	str	r2, [fp, #-40]
	mov	r3, r2, lsr #24
	ldr	r2, .L65
	bfi	r3, r1, #1, #7
	strb	r3, [fp, #-37]
	ldrcc	r3, [fp, #-40]
	movcs	r1, #1
	ldrcs	r3, [fp, #-40]
	mov	r0, #5
	strcs	r1, [r2, #844]
	mov	r1, #169
	strcc	r3, [r6, #88]
	ldr	r2, .L65+56
	bl	dprint_normal
	ldr	r3, [r5, #848]
	ldr	r1, [r5, #852]
	add	r2, r6, #92
	rsb	r2, r3, r2
	ldr	r3, [r4, #160]
	cmp	r2, r1
	ldr	r2, .L65
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r6, #92]
	strcs	r1, [r2, #844]
	mov	r1, #176
	ldr	r2, .L65+60
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #128
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r4, #176]
	cmp	r2, r1
	ldr	r2, .L65
	movcs	r1, #1
	strcc	r3, [r6, #128]
	strcs	r1, [r2, #844]
	mov	r1, #183
	ldr	r2, .L65+64
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #136
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r4, #184]
	cmp	r2, r1
	ldr	r2, .L65
	movcs	r1, #1
	strcc	r3, [r6, #136]
	strcs	r1, [r2, #844]
	mov	r1, #190
	ldr	r2, .L65+68
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #140
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r4, #188]
	cmp	r2, r1
	ldr	r2, .L65
	movcs	r1, #1
	strcc	r3, [r6, #140]
	strcs	r1, [r2, #844]
	mov	r1, #197
	ldr	r2, .L65+72
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #144
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r7, #884]
	cmp	r2, r1
	ldr	r2, .L65
	movcs	r1, #1
	strcc	r3, [r6, #144]
	strcs	r1, [r2, #844]
	mov	r1, #203
	ldr	r2, .L65+76
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #148
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r7, #888]
	cmp	r2, r1
	ldr	r2, .L65
	movcs	r1, #1
	strcc	r3, [r6, #148]
	strcs	r1, [r2, #844]
	mov	r1, #210
	ldr	r2, .L65+80
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #152
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r7, #892]
	cmp	r2, r1
	ldr	r2, .L65
	movcs	r1, #1
	strcc	r3, [r6, #152]
	strcs	r1, [r2, #844]
	mov	r1, #217
	ldr	r2, .L65+84
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	r2, [r5, #848]
	add	r3, r6, #156
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r2, r3
	ldr	r3, [r7, #872]
	cmp	r2, r1
	ldr	r2, .L65
	movcs	r1, #1
	strcc	r3, [r6, #156]
	strcs	r1, [r2, #844]
	mov	r1, #224
	ldr	r2, .L65+88
	str	r3, [fp, #-40]
	bl	dprint_normal
	ldr	r0, [r7, #872]
	bl	MEM_Phy2Vir
	subs	r6, r0, #0
	beq	.L59
	ldr	r5, .L65+92
	mov	r2, #4096
	mov	r1, #0
	ldr	r3, [r5, #48]
	blx	r3
	ldr	r3, [r5, #52]
	mov	r2, #64
	ldr	r1, [r4, #4]
	mov	r0, r6
	blx	r3
	ldr	r3, [r5, #52]
	mov	r2, #640
	ldr	r1, [r4, #8]
	add	r0, r6, #64
	blx	r3
	ldr	r3, [r5, #52]
	add	r0, r6, #704
	mov	r2, #64
	ldr	r1, [r4, #12]
	blx	r3
	ldr	r3, [r4, #76]
	ldr	r0, [r7, #872]
	cmp	r3, #0
	beq	.L60
	bl	MEM_Phy2Vir
	mov	r6, r0
	adds	r0, r0, #768
	beq	.L61
	ldr	r3, [r5, #52]
	mov	r2, #1536
	ldr	r1, [r4, #44]
	blx	r3
	ldr	r3, [r5, #52]
	mov	r2, #128
	ldr	r1, [r4, #40]
	add	r0, r6, #2304
	blx	r3
	add	r0, r6, #2432
	ldr	r3, [r5, #52]
	mov	r2, #128
	ldr	r1, [r4, #48]
	blx	r3
.L53:
	ldr	r0, [r7, #872]
	bl	MEM_Phy2Vir
	mov	r6, r0
	adds	r0, r0, #2560
	beq	.L62
	ldr	r3, [r5, #52]
	mov	r2, #64
	ldr	r1, [r4, #16]
	blx	r3
	ldr	r3, [r5, #52]
	mov	r2, #64
	ldr	r1, [r4, #20]
	add	r0, r6, #2624
	ldr	r8, .L65+92
	blx	r3
	ldr	r3, [r5, #52]
	mov	r2, #960
	ldr	r1, [r4, #24]
	add	r0, r6, #2688
	blx	r3
	ldr	r0, [r7, #872]
	bl	MEM_Phy2Vir
	adds	r0, r0, #2816
	beq	.L63
	ldr	r3, [r8, #52]
	mov	r2, #960
	ldr	r1, [r4, #24]
	blx	r3
	mov	r0, #0
.L3:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L60:
	bl	MEM_Phy2Vir
	mov	r6, r0
	adds	r0, r0, #768
	beq	.L64
	ldr	r3, [r5, #52]
	mov	r2, #96
	ldr	r1, [r4, #28]
	blx	r3
	ldr	r3, [r5, #52]
	ldr	r1, [r4, #36]
	mov	r2, #32
	add	r0, r6, #864
	blx	r3
	add	r0, r6, #896
	ldr	r3, [r5, #52]
	mov	r2, #576
	ldr	r1, [r4, #32]
	blx	r3
	b	.L53
.L59:
	str	r6, [sp]
	mov	r1, #230
	ldr	r3, .L65+96
	ldr	r2, .L65+100
	bl	dprint_normal
	mvn	r0, #0
	b	.L3
.L62:
	movw	r3, #291
	ldr	r2, .L65+104
	mov	r1, r3
	bl	dprint_normal
	mvn	r0, #0
	b	.L3
.L63:
	movw	r3, #309
	ldr	r2, .L65+104
	mov	r1, r3
	bl	dprint_normal
	mvn	r0, #0
	b	.L3
.L61:
	mov	r3, #272
	ldr	r2, .L65+104
	mov	r1, r3
	bl	dprint_normal
	mvn	r0, #0
	b	.L3
.L64:
	mov	r3, #251
	ldr	r2, .L65+104
	mov	r1, r3
	bl	dprint_normal
	mvn	r0, #0
	b	.L3
.L58:
	ldr	ip, .L65+108
	mov	r1, #34
	ldr	r3, .L65+96
	ldr	r2, .L65+112
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L3
.L66:
	.align	2
.L65:
	.word	g_HwMem
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
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
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC24
	.word	.LC25
	.word	.LC1
	.word	.LC0
	UNWIND(.fnend)
	.size	VP6HAL_CfgDnMsg, .-VP6HAL_CfgDnMsg
	.align	2
	.global	VP6HAL_StartDec
	.type	VP6HAL_StartDec, %function
VP6HAL_StartDec:
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
	ldr	r3, .L68
	mov	r2, r1
	mov	r1, #1000
	mla	r1, r1, r2, r3
	bl	VP6HAL_CfgDnMsg
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L69:
	.align	2
.L68:
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VP6HAL_StartDec, .-VP6HAL_StartDec
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.13000, %object
	.size	__func__.13000, 16
__func__.13000:
	.ascii	"VP6HAL_CfgDnMsg\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"%s: %s\012\000" )
.LC1:
	ASCII(.ascii	"can not map down msg virtual address!\000" )
	.space	2
.LC2:
	ASCII(.ascii	"D0 = 0x%x\012\000" )
	.space	1
.LC3:
	ASCII(.ascii	"D1 = 0x%x\012\000" )
	.space	1
.LC4:
	ASCII(.ascii	"D2 = 0x%x\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"D3 = 0x%x\012\000" )
	.space	1
.LC6:
	ASCII(.ascii	"D4 = 0x%x\012\000" )
	.space	1
.LC7:
	ASCII(.ascii	"D8 = 0x%x\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"D9 = 0x%x\012\000" )
	.space	1
.LC9:
	ASCII(.ascii	"D16 = 0x%x\012\000" )
.LC10:
	ASCII(.ascii	"D17 = 0x%x\012\000" )
.LC11:
	ASCII(.ascii	"D18 = 0x%x\012\000" )
.LC12:
	ASCII(.ascii	"D19 = 0x%x\012\000" )
.LC13:
	ASCII(.ascii	"D20 = 0x%x\012\000" )
.LC14:
	ASCII(.ascii	"D21 = 0x%x\012\000" )
.LC15:
	ASCII(.ascii	"D22 = 0x%x\012\000" )
.LC16:
	ASCII(.ascii	"D23 = 0x%x\012\000" )
.LC17:
	ASCII(.ascii	"D32 = 0x%x\012\000" )
.LC18:
	ASCII(.ascii	"D34 = 0x%x\012\000" )
.LC19:
	ASCII(.ascii	"D35 = 0x%x\012\000" )
.LC20:
	ASCII(.ascii	"D36 = 0x%x\012\000" )
.LC21:
	ASCII(.ascii	"D37 = 0x%x\012\000" )
.LC22:
	ASCII(.ascii	"D38 = 0x%x\012\000" )
.LC23:
	ASCII(.ascii	"D39 = 0x%x\012\000" )
.LC24:
	ASCII(.ascii	"%s: TabBaseAddr = NULL\012\000" )
.LC25:
	ASCII(.ascii	"line: %d  NULL == TabBaseAddr.\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
