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
	.file	"vdm_hal_vp8.c"
	.text
	.align	2
	.global	VP8HAL_CfgDnMsg
	.type	VP8HAL_CfgDnMsg, %function
VP8HAL_CfgDnMsg:
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
	mov	r5, r0
	ldr	r0, [r1, #32]
	mov	r6, r1
	bl	MEM_Phy2Vir
	subs	r7, r0, #0
	beq	.L78
	ldr	r4, .L80
	mov	r3, #0
	str	r3, [fp, #-48]
	ldr	r3, [r5, #2800]
	ldr	r2, [r4, #848]
	ldr	r0, [r4, #852]
	and	r3, r3, #1
	rsb	r2, r2, r7
	ldr	r1, [r5, #2804]
	cmp	r2, r0
	mov	r0, #5
	bfi	r3, r1, #1, #2
	strb	r3, [fp, #-48]
	ldrcc	r3, [fp, #-48]
	movcs	r2, #1
	ldrcs	r3, [fp, #-48]
	mov	r1, #39
	strcs	r2, [r4, #844]
	strcc	r3, [r7]
	ldr	r2, .L80+4
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r0, [r4, #852]
	add	r2, r7, #4
	ldr	r1, [r5, #2812]
	rsb	r2, r3, r2
	cmp	r2, r0
	ldr	r3, [r5, #2808]
	ldr	r2, .L80
	mov	r0, #5
	rsb	r3, r3, r1, lsl #1
	movcs	r1, #1
	add	r3, r3, #1
	strcc	r3, [r7, #4]
	strcs	r1, [r2, #844]
	mov	r1, #45
	ldr	r2, .L80+8
	str	r3, [fp, #-48]
	bl	dprint_normal
	ldr	r2, [r4, #848]
	add	r3, r7, #8
	ldr	r0, [r4, #852]
	ldr	r1, [r5, #2788]
	rsb	r3, r2, r3
	ldr	r2, [r5, #2792]
	cmp	r3, r0
	sub	r1, r1, #1
	mov	r0, #0	@ movhi
	sub	r3, r2, #1
	bfi	r0, r1, #0, #9
	mov	r2, #0	@ movhi
	strh	r0, [fp, #-48]	@ movhi
	bfi	r2, r3, #0, #9
	ldr	r1, .L80
	strh	r2, [fp, #-46]	@ movhi
	mov	r0, #5
	ldrcc	r3, [fp, #-48]
	movcs	r2, #1
	ldrcs	r3, [fp, #-48]
	strcs	r2, [r1, #844]
	mov	r1, #53
	strcc	r3, [r7, #8]
	ldr	r2, .L80+12
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r0, [r4, #852]
	add	r3, r7, #12
	ldrb	r2, [r5, #2753]	@ zero_extendqisi2
	rsb	r3, r1, r3
	ldrb	r1, [r5, #2752]	@ zero_extendqisi2
	cmp	r3, r0
	ldrb	r0, [r5, #2754]	@ zero_extendqisi2
	and	r3, r2, #1
	mov	r2, #0
	str	r2, [fp, #-48]
	bfi	r3, r0, #1, #2
	strb	r1, [fp, #-48]
	strb	r3, [fp, #-47]
	movcs	r1, #1
	ldrcc	r3, [fp, #-48]
	mov	r0, #5
	ldr	r2, .L80
	ldrcs	r3, [fp, #-48]
	strcc	r3, [r7, #12]
	strcs	r1, [r2, #844]
	mov	r1, #62
	ldr	r2, .L80+16
	bl	dprint_normal
	ldrb	r3, [r5, #2755]	@ zero_extendqisi2
	ldrb	r1, [r5, #2756]	@ zero_extendqisi2
	add	r2, r7, #16
	ldr	ip, [r4, #848]
	and	r3, r3, #1
	ldr	r0, [r4, #852]
	bfi	r3, r1, #1, #1
	ldrb	r1, [r5, #2757]	@ zero_extendqisi2
	rsb	r2, ip, r2
	cmp	r2, r0
	mov	r2, #0
	bfi	r3, r1, #2, #1
	ldrb	r1, [r5, #2758]	@ zero_extendqisi2
	str	r2, [fp, #-48]
	mov	r0, #5
	bfi	r3, r1, #3, #1
	ldr	r2, .L80
	strb	r3, [fp, #-48]
	movcs	r1, #1
	ldrcc	r3, [fp, #-48]
	strcs	r1, [r2, #844]
	mov	r1, #72
	ldrcs	r3, [fp, #-48]
	strcc	r3, [r7, #16]
	ldr	r2, .L80+20
	bl	dprint_normal
	ldrb	r3, [r5, #2760]	@ zero_extendqisi2
	ldrb	r2, [r5, #2761]	@ zero_extendqisi2
	mov	r1, #0
	and	r3, r3, #1
	str	r1, [fp, #-48]
	ldrb	r0, [r5, #2762]	@ zero_extendqisi2
	bfi	r3, r2, #1, #2
	strb	r3, [fp, #-48]
	add	r2, r7, #20
	ldrh	r1, [fp, #-48]
	ldr	r3, [r4, #848]
	bfi	r1, r0, #3, #6
	ldr	r0, [r4, #852]
	ldrb	ip, [r5, #2763]	@ zero_extendqisi2
	rsb	r2, r3, r2
	cmp	r2, r0
	strh	r1, [fp, #-48]	@ movhi
	mov	r3, r1, lsr #8
	ldrb	r1, [r5, #2764]	@ zero_extendqisi2
	bfi	r3, ip, #1, #3
	ldr	r2, .L80
	bfi	r3, r1, #4, #3
	strb	r3, [fp, #-47]
	ldrcc	r3, [fp, #-48]
	movcs	r1, #1
	ldrcs	r3, [fp, #-48]
	mov	r0, #5
	strcs	r1, [r2, #844]
	mov	r1, #83
	strcc	r3, [r7, #20]
	ldr	r2, .L80+24
	bl	dprint_normal
	ldrb	r3, [r5, #2765]	@ zero_extendqisi2
	ldrb	r0, [r5, #2766]	@ zero_extendqisi2
	mov	r2, #0
	ldrb	r1, [r5, #2767]	@ zero_extendqisi2
	and	r3, r3, #1
	bfi	r3, r0, #1, #4
	str	r2, [fp, #-48]
	ldrb	ip, [r5, #2768]	@ zero_extendqisi2
	bfi	r3, r1, #5, #1
	strb	r3, [fp, #-48]
	add	r2, r7, #24
	ldrh	r0, [fp, #-48]
	ldrb	r3, [r5, #2772]	@ zero_extendqisi2
	ldrb	r1, [fp, #-46]	@ zero_extendqisi2
	bfi	r0, ip, #6, #4
	ldrb	ip, [r5, #2769]	@ zero_extendqisi2
	bfi	r1, r3, #0, #4
	mov	r3, r0, lsr #8
	bfi	r3, ip, #2, #1
	ldrb	ip, [r5, #2773]	@ zero_extendqisi2
	ldr	lr, [r4, #848]
	bfi	r1, ip, #4, #1
	ldrb	ip, [r5, #2770]	@ zero_extendqisi2
	strb	r1, [fp, #-46]
	rsb	r2, lr, r2
	ldr	r1, [r4, #852]
	bfi	r3, ip, #3, #4
	ldrb	ip, [r5, #2771]	@ zero_extendqisi2
	cmp	r2, r1
	ldrb	r1, [r5, #2774]	@ zero_extendqisi2
	ldrh	r2, [fp, #-46]
	bfi	r3, ip, #7, #1
	strh	r0, [fp, #-48]	@ movhi
	mov	r0, #5
	bfi	r2, r1, #5, #4
	strb	r3, [fp, #-47]
	strh	r2, [fp, #-46]	@ movhi
	movcs	r1, #1
	ldrcc	r3, [fp, #-48]
	ldr	r2, .L80
	ldrcs	r3, [fp, #-48]
	strcc	r3, [r7, #24]
	strcs	r1, [r2, #844]
	mov	r1, #99
	ldr	r2, .L80+28
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r7, #28
	rsb	r3, r1, r3
	ldrb	r1, [r5, #2759]	@ zero_extendqisi2
	cmp	r3, r2
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-48]
	bfi	r3, r1, #0, #7
	ldr	r2, .L80
	strb	r3, [fp, #-48]
	movcs	r1, #1
	ldrcc	r3, [fp, #-48]
	mov	r0, #5
	strcs	r1, [r2, #844]
	mov	r1, #106
	ldrcs	r3, [fp, #-48]
	strcc	r3, [r7, #28]
	ldr	r2, .L80+32
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r7, #32
	rsb	r2, r3, r2
	ldr	r3, [r5, #2784]
	cmp	r2, r1
	ldr	r2, .L80
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r7, #32]
	strcs	r1, [r2, #844]
	mov	r1, #113
	ldr	r2, .L80+36
	str	r3, [fp, #-48]
	bl	dprint_normal
	ldr	r2, [r4, #848]
	add	r3, r7, #36
	ldr	r1, [r4, #852]
	rsb	r3, r2, r3
	ldrb	r2, [r5, #2779]	@ zero_extendqisi2
	cmp	r3, r1
	ldrb	r0, [r5, #2780]	@ zero_extendqisi2
	mov	r1, #0
	mov	r3, #0
	str	r1, [fp, #-48]
	bfi	r3, r0, #0, #6
	strb	r2, [fp, #-48]
	mov	r0, #5
	strb	r3, [fp, #-46]
	movcs	r2, #1
	ldrcc	r3, [fp, #-48]
	ldr	r1, .L80
	ldrcs	r3, [fp, #-48]
	strcc	r3, [r7, #36]
	strcs	r2, [r1, #844]
	mov	r1, #121
	ldr	r2, .L80+40
	bl	dprint_normal
	ldrb	r2, [r5, #2780]	@ zero_extendqisi2
	ldr	r3, [r5, #2824]
	add	r1, r7, #64
	ldr	r0, [r5, #2820]
	cmp	r2, r3
	ldr	ip, [r4, #848]
	add	r0, r2, r0
	addhi	r3, r3, #128
	ldrhi	r8, [r5, #2828]
	rsbls	r2, r2, r3
	rsbhi	r2, r2, r3
	mov	r3, #0
	bfi	r3, r0, #0, #25
	ldr	r0, [r4, #852]
	rsb	r1, ip, r1
	ldrls	r8, [r5, #2828]
	subhi	r8, r8, #16
	cmp	r1, r0
	str	r3, [fp, #-48]
	mov	r3, r3, lsr #24
	bfi	r3, r2, #1, #7
	ldr	r2, .L80
	strb	r3, [fp, #-45]
	mov	r1, #143
	ldrcc	r3, [fp, #-48]
	movcs	r3, #1
	mov	r0, #5
	strcs	r3, [r2, #844]
	ldrcs	r3, [fp, #-48]
	strcc	r3, [r7, #64]
	ldr	r2, .L80+44
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r7, #68
	rsb	r2, r3, r2
	mov	r0, #5
	cmp	r2, r1
	ldr	r2, .L80
	mov	r3, #0
	bfi	r3, r8, #0, #24
	movcs	r1, #1
	str	r3, [fp, #-48]
	strcs	r1, [r2, #844]
	mov	r1, #150
	strcc	r3, [r7, #68]
	ldr	r2, .L80+48
	bl	dprint_normal
	ldr	ip, [r4, #848]
	ldr	r1, [r5, #2832]
	add	r3, r7, #72
	ldr	r0, [r4, #852]
	rsb	r3, ip, r3
	mov	r2, #0
	bfi	r2, r1, #0, #25
	cmp	r3, r0
	ldr	r1, [r5, #2836]
	mov	r3, r2, lsr #24
	str	r2, [fp, #-48]
	bfi	r3, r1, #1, #7
	ldr	r2, .L80
	strb	r3, [fp, #-45]
	movcs	r1, #1
	ldrcc	r3, [fp, #-48]
	mov	r0, #5
	strcs	r1, [r2, #844]
	mov	r1, #158
	ldrcs	r3, [fp, #-48]
	strcc	r3, [r7, #72]
	ldr	r2, .L80+52
	bl	dprint_normal
	ldr	r2, [r4, #848]
	ldr	r1, [r4, #852]
	add	r3, r7, #76
	rsb	r3, r2, r3
	ldr	r2, [r5, #2840]
	cmp	r3, r1
	ldr	r1, .L80
	mov	r3, #0
	mov	r0, #5
	bfi	r3, r2, #0, #24
	movcs	r2, #1
	str	r3, [fp, #-48]
	strcs	r2, [r1, #844]
	mov	r1, #165
	strcc	r3, [r7, #76]
	ldr	r2, .L80+56
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r7, #80
	rsb	r3, r1, r3
	ldr	r0, [r5, #3040]
	cmp	r3, r2
	ldr	r1, [r5, #3044]
	ldr	r3, [r5, #3052]
	ldr	r2, [r5, #3048]
	strb	r1, [fp, #-47]
	movcs	r1, #1
	strb	r0, [fp, #-48]
	mov	r0, #5
	strb	r2, [fp, #-46]
	strb	r3, [fp, #-45]
	ldr	r2, .L80
	ldrcc	r3, [fp, #-48]
	ldrcs	r3, [fp, #-48]
	strcs	r1, [r2, #844]
	mov	r1, #175
	strcc	r3, [r7, #80]
	ldr	r2, .L80+60
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r7, #84
	rsb	r3, r1, r3
	ldr	r0, [r5, #3056]
	cmp	r3, r2
	ldr	r1, [r5, #3060]
	ldr	r3, [r5, #3068]
	ldr	r2, [r5, #3064]
	strb	r1, [fp, #-47]
	movcs	r1, #1
	strb	r0, [fp, #-48]
	mov	r0, #5
	strb	r2, [fp, #-46]
	strb	r3, [fp, #-45]
	ldr	r2, .L80
	ldrcc	r3, [fp, #-48]
	ldrcs	r3, [fp, #-48]
	strcs	r1, [r2, #844]
	mov	r1, #185
	strcc	r3, [r7, #84]
	ldr	r2, .L80+64
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r7, #88
	rsb	r3, r1, r3
	ldr	r0, [r5, #3072]
	cmp	r3, r2
	ldr	r1, [r5, #3076]
	ldr	r3, [r5, #3084]
	ldr	r2, [r5, #3080]
	strb	r1, [fp, #-47]
	movcs	r1, #1
	strb	r0, [fp, #-48]
	mov	r0, #5
	strb	r2, [fp, #-46]
	strb	r3, [fp, #-45]
	ldr	r2, .L80
	ldrcc	r3, [fp, #-48]
	ldrcs	r3, [fp, #-48]
	strcs	r1, [r2, #844]
	mov	r1, #195
	strcc	r3, [r7, #88]
	ldr	r2, .L80+68
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r7, #92
	rsb	r3, r1, r3
	ldr	r0, [r5, #3088]
	cmp	r3, r2
	ldr	r1, [r5, #3092]
	ldr	r3, [r5, #3100]
	ldr	r2, [r5, #3096]
	strb	r1, [fp, #-47]
	movcs	r1, #1
	strb	r0, [fp, #-48]
	mov	r0, #5
	strb	r2, [fp, #-46]
	strb	r3, [fp, #-45]
	ldr	r2, .L80
	ldrcc	r3, [fp, #-48]
	ldrcs	r3, [fp, #-48]
	strcs	r1, [r2, #844]
	mov	r1, #205
	strcc	r3, [r7, #92]
	ldr	r2, .L80+72
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r7, #96
	rsb	r3, r1, r3
	ldr	r0, [r5, #3104]
	cmp	r3, r2
	ldr	r1, [r5, #3108]
	ldr	r3, [r5, #3116]
	ldr	r2, [r5, #3112]
	strb	r1, [fp, #-47]
	movcs	r1, #1
	strb	r0, [fp, #-48]
	mov	r0, #5
	strb	r2, [fp, #-46]
	strb	r3, [fp, #-45]
	ldr	r2, .L80
	ldrcc	r3, [fp, #-48]
	ldrcs	r3, [fp, #-48]
	strcs	r1, [r2, #844]
	mov	r1, #215
	strcc	r3, [r7, #96]
	ldr	r2, .L80+76
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	add	r2, r7, #100
	rsb	r2, r3, r2
	ldr	r3, [r5, #3144]
	cmp	r2, r1
	ldr	r2, .L80
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r7, #100]
	strcs	r1, [r2, #844]
	mov	r1, #221
	ldr	r2, .L80+80
	str	r3, [fp, #-48]
	bl	dprint_normal
	ldr	r3, [r4, #848]
	add	r2, r7, #128
	ldr	r1, [r4, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r5, #3120]
	cmp	r2, r1
	ldr	r2, .L80
	movcs	r1, #1
	strcc	r3, [r7, #128]
	strcs	r1, [r2, #844]
	mov	r1, #228
	ldr	r2, .L80+84
	str	r3, [fp, #-48]
	bl	dprint_normal
	ldr	r3, [r4, #848]
	add	r2, r7, #132
	ldr	r1, [r4, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r5, #3128]
	cmp	r2, r1
	ldr	r2, .L80
	movcs	r1, #1
	strcc	r3, [r7, #132]
	strcs	r1, [r2, #844]
	mov	r1, #235
	ldr	r2, .L80+88
	str	r3, [fp, #-48]
	bl	dprint_normal
	ldr	r3, [r4, #848]
	add	r2, r7, #136
	ldr	r1, [r4, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r5, #3132]
	cmp	r2, r1
	ldr	r2, .L80
	movcs	r1, #1
	strcc	r3, [r7, #136]
	strcs	r1, [r2, #844]
	mov	r1, #242
	ldr	r2, .L80+92
	str	r3, [fp, #-48]
	bl	dprint_normal
	ldr	r3, [r4, #848]
	add	r2, r7, #140
	ldr	r1, [r4, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r5, #3136]
	cmp	r2, r1
	ldr	r2, .L80
	movcs	r1, #1
	strcc	r3, [r7, #140]
	strcs	r1, [r2, #844]
	mov	r1, #249
	ldr	r2, .L80+96
	str	r3, [fp, #-48]
	bl	dprint_normal
	ldr	r3, [r4, #848]
	add	r2, r7, #144
	ldr	r1, [r4, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r6, #884]
	cmp	r2, r1
	ldr	r2, .L80
	movcs	r1, #1
	strcc	r3, [r7, #144]
	strcs	r1, [r2, #844]
	mov	r1, #256
	ldr	r2, .L80+100
	str	r3, [fp, #-48]
	bl	dprint_normal
	ldr	r3, [r4, #848]
	add	r2, r7, #148
	ldr	r1, [r4, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r6, #888]
	cmp	r2, r1
	ldr	r2, .L80
	movcs	r1, #1
	strcc	r3, [r7, #148]
	strcs	r1, [r2, #844]
	movw	r1, #263
	ldr	r2, .L80+104
	str	r3, [fp, #-48]
	bl	dprint_normal
	ldr	r3, [r4, #848]
	add	r2, r7, #152
	ldr	r1, [r4, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r6, #892]
	cmp	r2, r1
	ldr	r2, .L80
	movcs	r1, #1
	strcc	r3, [r7, #152]
	strcs	r1, [r2, #844]
	movw	r1, #270
	ldr	r2, .L80+108
	str	r3, [fp, #-48]
	bl	dprint_normal
	ldr	r3, [r4, #848]
	add	r2, r7, #156
	ldr	r1, [r4, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r6, #876]
	cmp	r2, r1
	ldr	r2, .L80
	movcs	r1, #1
	strcc	r3, [r7, #156]
	strcs	r1, [r2, #844]
	movw	r1, #277
	ldr	r2, .L80+112
	str	r3, [fp, #-48]
	bl	dprint_normal
	ldr	r0, [r6, #876]
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L79
	ldr	r3, .L80+116
	mov	r2, #2752
	mov	r1, r5
	ldr	r9, .L80
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	add	r3, r7, #160
	rsb	r3, r1, r3
	ldr	r8, [r6, #896]
	cmp	r3, r2
	ldr	r3, .L80
	movw	r1, #294
	mov	r0, #5
	movcs	r2, #1
	strcc	r8, [r7, #160]
	strcs	r2, [r3, #844]
	mov	r3, r8
	ldr	r2, .L80+120
	add	r6, r7, #252
	str	r8, [fp, #-48]
	bl	dprint_normal
	mov	r0, r7
	bl	MEM_Vir2Phy
	ldr	r3, [r4, #848]
	ldr	r2, [r4, #852]
	rsb	r3, r3, r6
	ldr	r1, .L80
	cmp	r3, r2
	ldr	r2, .L80+124
	movcs	r3, #1
	strcs	r3, [r1, #844]
	mov	r3, r8
	mov	r1, #300
	add	r8, r5, #2832
	add	r8, r8, #12
	addcc	r0, r0, #256
	strcc	r0, [r7, #252]
	mov	r0, #5
	mov	r7, #0
	bl	dprint_normal
	b	.L75
.L76:
	mov	r6, r10
.L75:
	ldr	ip, [r8, #4]!
	add	r3, r6, #4
	ldr	r1, [r4, #848]
	mov	r2, #0
	ldr	r0, [r4, #852]
	bfi	r2, ip, #0, #25
	rsb	r3, r1, r3
	ldr	r1, [r5, #2880]
	cmp	r3, r0
	mov	r3, r2, lsr #24
	bfi	r3, r1, #1, #7
	str	r2, [fp, #-48]
	strb	r3, [fp, #-45]
	movcs	r2, #1
	ldrcc	r3, [fp, #-48]
	movw	r1, #310
	ldrcs	r3, [fp, #-48]
	mov	r0, #5
	strcs	r2, [r9, #844]
	add	r10, r6, #16
	strcc	r3, [r6, #4]
	add	r5, r5, #4
	str	r3, [sp]
	add	r3, r7, #64
	ldr	r2, .L80+128
	bl	dprint_normal
	ldr	r2, [r4, #848]
	ldr	r1, [r4, #852]
	add	r3, r6, #8
	rsb	r3, r2, r3
	ldr	r2, [r5, #2908]
	cmp	r3, r1
	mov	r0, #5
	mov	r1, #316
	mov	r3, #0
	bfi	r3, r2, #0, #24
	movcs	r2, #1
	str	r3, [fp, #-48]
	strcs	r2, [r9, #844]
	strcc	r3, [r6, #8]
	ldr	r2, .L80+128
	str	r3, [sp]
	add	r3, r7, #65
	bl	dprint_normal
	ldr	r1, [r5, #2940]
	ldr	ip, [r4, #848]
	add	r3, r6, #12
	ldr	r0, [r4, #852]
	mov	r2, #0
	rsb	r3, ip, r3
	bfi	r2, r1, #0, #25
	cmp	r3, r0
	ldr	r1, [r5, #2972]
	mov	r3, r2, lsr #24
	str	r2, [fp, #-48]
	bfi	r3, r1, #1, #7
	strb	r3, [fp, #-45]
	ldrcc	r3, [fp, #-48]
	movcs	r2, #1
	ldrcs	r3, [fp, #-48]
	movw	r1, #323
	strcs	r2, [r9, #844]
	mov	r0, #5
	strcc	r3, [r6, #12]
	ldr	r2, .L80+128
	str	r3, [sp]
	add	r3, r7, #66
	bl	dprint_normal
	ldr	r2, [r4, #848]
	ldr	r0, [r4, #852]
	mov	r3, #0
	rsb	r2, r2, r10
	ldr	r1, [r5, #3004]
	cmp	r2, r0
	mov	r0, #5
	bfi	r3, r1, #0, #24
	movw	r1, #329
	movcs	r2, #1
	str	r3, [fp, #-48]
	strcs	r2, [r9, #844]
	strcc	r3, [r6, #16]
	ldr	r2, .L80+128
	str	r3, [sp]
	add	r3, r7, #67
	add	r7, r7, #4
	bl	dprint_normal
	cmp	r7, #32
	bne	.L76
	mov	r0, #0
.L3:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L79:
	ldr	r3, .L80+132
	movw	r1, #283
	ldr	r2, .L80+136
	bl	dprint_normal
	mvn	r0, #0
	b	.L3
.L78:
	ldr	ip, .L80+140
	mov	r1, #31
	ldr	r3, .L80+132
	ldr	r2, .L80+144
	str	ip, [sp]
	bl	dprint_normal
	mvn	r0, #0
	b	.L3
.L81:
	.align	2
.L80:
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
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LANCHOR0
	.word	.LC30
	.word	.LC1
	.word	.LC0
	UNWIND(.fnend)
	.size	VP8HAL_CfgDnMsg, .-VP8HAL_CfgDnMsg
	.align	2
	.global	VP8HAL_StartDec
	.type	VP8HAL_StartDec, %function
VP8HAL_StartDec:
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
	ldr	r3, .L83
	mov	r2, r1
	mov	r1, #1000
	mla	r1, r1, r2, r3
	bl	VP8HAL_CfgDnMsg
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L84:
	.align	2
.L83:
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VP8HAL_StartDec, .-VP8HAL_StartDec
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.13020, %object
	.size	__func__.13020, 16
__func__.13020:
	.ascii	"VP8HAL_CfgDnMsg\000"
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
	ASCII(.ascii	"D5 = 0x%x\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"D6 = 0x%x\012\000" )
	.space	1
.LC9:
	ASCII(.ascii	"D7 = 0x%x\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"D8 = 0x%x\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"D9 = 0x%x\012\000" )
	.space	1
.LC12:
	ASCII(.ascii	"D16 = 0x%x\012\000" )
.LC13:
	ASCII(.ascii	"D17 = 0x%x\012\000" )
.LC14:
	ASCII(.ascii	"D18 = 0x%x\012\000" )
.LC15:
	ASCII(.ascii	"D19 = 0x%x\012\000" )
.LC16:
	ASCII(.ascii	"D20 = 0x%x\012\000" )
.LC17:
	ASCII(.ascii	"D21 = 0x%x\012\000" )
.LC18:
	ASCII(.ascii	"D22 = 0x%x\012\000" )
.LC19:
	ASCII(.ascii	"D23 = 0x%x\012\000" )
.LC20:
	ASCII(.ascii	"D24 = 0x%x\012\000" )
.LC21:
	ASCII(.ascii	"D25 = 0x%x\012\000" )
.LC22:
	ASCII(.ascii	"D32 = 0x%x\012\000" )
.LC23:
	ASCII(.ascii	"D33 = 0x%x\012\000" )
.LC24:
	ASCII(.ascii	"D34 = 0x%x\012\000" )
.LC25:
	ASCII(.ascii	"D35 = 0x%x\012\000" )
.LC26:
	ASCII(.ascii	"D36 = 0x%x\012\000" )
.LC27:
	ASCII(.ascii	"D37 = 0x%x\012\000" )
.LC28:
	ASCII(.ascii	"D38 = 0x%x\012\000" )
.LC29:
	ASCII(.ascii	"D39 = 0x%x\012\000" )
.LC30:
	ASCII(.ascii	"%s: u8Tmp = NULL\012\000" )
	.space	2
.LC31:
	ASCII(.ascii	"D40 = 0x%x\012\000" )
.LC32:
	ASCII(.ascii	"D63 = 0x%x\012\000" )
.LC33:
	ASCII(.ascii	"D%d = 0x%x\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
