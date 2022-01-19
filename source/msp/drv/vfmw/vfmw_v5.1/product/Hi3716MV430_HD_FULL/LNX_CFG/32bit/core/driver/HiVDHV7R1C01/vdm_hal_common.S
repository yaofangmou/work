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
	.file	"vdm_hal_common.c"
	.text
	.align	2
	.global	HAL_CfgVdmReg
	.type	HAL_CfgVdmReg, %function
HAL_CfgVdmReg:
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
	mov	r5, r2
	mov	ip, r5, asl #6
	ldr	r2, .L130
	sub	ip, ip, r5, asl #4
	mov	r7, r3
	add	r2, r2, ip
	cmp	r0, #4
	mov	r4, r0
	mov	r6, r1
	ldr	r3, [r2, #8]
	str	r3, [fp, #-116]
	bls	.L2
	bic	r3, r0, #8
	cmp	r3, #6
	beq	.L2
	sub	r3, r0, #10
	sub	r0, r0, #15
	cmp	r0, #1
	cmphi	r3, #3
	movls	r0, #1
	movhi	r0, #0
	bhi	.L123
.L2:
	ldr	r3, .L130+4
	mov	r2, #64
	mov	r1, #0
	sub	r0, fp, #108
	ldr	r3, [r3, #48]
	blx	r3
	cmp	r4, #16
	ldrls	pc, [pc, r4, asl #2]
	b	.L4
.L6:
	.word	.L5
	.word	.L7
	.word	.L8
	.word	.L9
	.word	.L10
	.word	.L4
	.word	.L11
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L13
	.word	.L10
	.word	.L5
	.word	.L14
.L5:
	ldr	r3, [r6, #284]
	ldrb	r1, [r6, #2]	@ zero_extendqisi2
	ldr	r2, [r6, #20]
	add	r3, r6, r3, lsl #2
	ldrb	ip, [r6, #4]	@ zero_extendqisi2
	ldr	r0, [r6, #592]
	ldr	r3, [r3, #300]
	mov	r2, r2, asl #4
	strb	r1, [fp, #-54]
	str	r2, [fp, #-108]
	ldr	r1, [r6, #932]
	ldr	r2, [r6, #428]
	str	r3, [fp, #-96]
	ldr	r3, [r6, #432]
	strb	ip, [fp, #-56]
	str	r0, [fp, #-100]
	ldr	ip, [r6, #576]
	str	r1, [fp, #-52]
	ldr	r0, [r6, #296]
	str	r2, [fp, #-64]
	ldr	r1, [r6, #588]
	str	r3, [fp, #-60]
	ldr	r2, [r6, #936]
	ldr	r3, [r6, #596]
	str	ip, [fp, #-88]
	str	r0, [fp, #-84]
	str	r1, [fp, #-92]
	str	r3, [fp, #-104]
	str	r2, [fp, #-48]
.L15:
	sub	r2, r4, #1
	cmp	r4, #10
	cmpne	r2, #1
	bhi	.L59
.L20:
	cmp	r4, #16
	mov	r2, #0
	mov	r8, #0
	str	r2, [fp, #-112]
	beq	.L124
.L40:
	sub	r10, r4, #6
	cmp	r4, #6
	cmpne	r4, #18
	clz	r10, r10
	mov	r10, r10, lsr #5
	bne	.L125
.L42:
	mov	r8, #1073741824
.L41:
	bics	r2, r4, #16
	clz	r9, r4
	moveq	r2, #1
	movne	r2, #0
	cmp	r2, #0
	str	r2, [fp, #-120]
	mov	r9, r9, lsr #5
	beq	.L43
	ldr	r2, [fp, #-48]
	cmp	r2, #0
	orrne	r8, r8, #201326592
.L43:
	sub	r2, r4, #14
	sub	r1, r4, #2
	clz	r2, r2
	bics	r0, r1, #2
	mov	r2, r2, lsr #5
	orreq	r0, r2, #1
	movne	r0, r2
	cmp	r0, #0
	orrne	r8, r8, #33554432
	orrs	r0, r10, r9
	bne	.L45
	sub	r0, r4, #15
	cmp	r0, #1
	bls	.L45
	sub	r0, r4, #8
	cmp	r0, #1
	bls	.L45
	bic	r0, r4, #2
	cmp	r0, #1
	bne	.L46
.L45:
	orr	r8, r8, #16777216
.L46:
	cmp	r10, #0
	bne	.L47
	cmp	r1, #2
	orrls	r2, r2, #1
	cmp	r2, #0
	bne	.L47
.L48:
	sub	r2, r3, #1
	mov	r0, #8
	bfi	r8, r2, #0, #20
	mov	r3, r7
	mov	r2, r5
	mov	r6, #0
	mov	r1, r8
	bl	MFDE_ConfigReg
	mov	r3, r8
	ldr	r2, .L130+8
	mov	r1, #119
	mov	r0, #4
	sub	r8, r4, #15
	bl	dprint_normal
	cmp	r4, #18
	clz	r8, r8
	ldr	r2, .L130+12
	ldrls	r3, .L130+16
	movhi	r3, #15
	mov	r8, r8, lsr #5
	ldrls	r3, [r3, r4, asl #2]
	andls	r3, r3, #15
	bfi	r6, r3, #0, #4
	ldr	r3, [fp, #-120]
	orrs	r3, r3, r8
	ldr	r3, [fp, #-116]
	ldr	r3, [r2, r3, asl #2]
	add	r3, r3, #204800
	ldr	r2, [r3, #3296]
	bfi	r6, r2, #12, #1
	ldrneb	r2, [fp, #-54]	@ zero_extendqisi2
	orreq	r6, r6, #16384
	bfine	r6, r2, #14, #1
	cmp	r4, #3
	bfceq	r6, #15, #1
	bfceq	r6, #8, #1
	bfceq	r6, #9, #1
	beq	.L53
	cmp	r10, #0
	orreq	r6, r6, #32768
	bne	.L126
.L53:
	ldr	r2, [r3, #3244]
	mov	r3, #3
	bfi	r6, r3, #16, #12
	ldrb	r1, [fp, #-56]	@ zero_extendqisi2
	bfc	r6, #28, #1
	mov	r3, r7
	bfi	r6, r2, #30, #1
	mov	r0, #12
	bfi	r6, r1, #29, #1
	mov	r2, r5
	ldr	r4, .L130+20
	orr	r9, r8, r9
	mov	r1, r6
	bl	MFDE_ConfigReg
	mov	r3, r6
	ldr	r2, .L130+24
	mov	r1, #219
	mov	r0, #4
	bl	dprint_normal
	mov	r1, #1000
	mla	r4, r1, r5, r4
	mov	r3, r7
	mov	r2, r5
	mov	r0, #16
	ldr	r6, [r4, #32]
	mov	r1, r6
	bl	MFDE_ConfigReg
	mov	r3, r6
	ldr	r2, .L130+28
	mov	r1, #230
	mov	r0, #4
	bl	dprint_normal
	ldr	r4, [r4, #16]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #20
	mov	r1, r4
	bl	MFDE_ConfigReg
	mov	r3, r4
	ldr	r2, .L130+28
	mov	r1, #241
	mov	r0, #4
	bl	dprint_normal
	ldr	r4, [fp, #-100]
	mov	r3, r7
	mov	r2, r5
	bic	r4, r4, #15
	mov	r0, #24
	mov	r1, r4
	bl	MFDE_ConfigReg
	mov	r3, r4
	ldr	r2, .L130+32
	mov	r1, #252
	mov	r0, #4
	bl	dprint_normal
	ldr	r3, [fp, #-108]
	cmp	r3, #1920
	movls	r9, #0
	andhi	r9, r9, #1
	cmp	r9, #0
	beq	.L55
	ldr	r2, [fp, #-52]
	cmp	r2, #0
	bne	.L127
.L55:
	cmp	r3, #4096
	mov	r2, r5
	mov	r3, r7
	mov	r0, #4
	movhi	r4, #0
	movls	r4, #1
	mov	r1, r4
	bl	SCD_ConfigReg
	mov	r3, r4
	ldr	r2, .L130+36
	movw	r1, #270
	mov	r0, #4
	bl	dprint_normal
	ldr	r4, [fp, #-96]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #96
	mov	r1, r4
	bl	MFDE_ConfigReg
	mov	r3, r4
	ldr	r2, .L130+40
	movw	r1, #281
	mov	r0, #4
	bl	dprint_normal
	ldr	r4, [fp, #-88]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #100
	mov	r1, r4
	bl	MFDE_ConfigReg
	mov	r3, r4
	ldr	r2, .L130+44
	movw	r1, #291
	mov	r0, #4
	bl	dprint_normal
	ldr	r4, [fp, #-84]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #104
	mov	r1, r4
	bl	MFDE_ConfigReg
	mov	r3, r4
	ldr	r2, .L130+48
	movw	r1, #301
	mov	r0, #4
	bl	dprint_normal
	ldr	r4, [fp, #-92]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #108
	mov	r1, r4
	bl	MFDE_ConfigReg
	mov	r3, r4
	ldr	r2, .L130+52
	mov	r1, #312
	mov	r0, #4
	bl	dprint_normal
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	bne	.L128
	ldr	r1, [fp, #-112]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #128
	bl	MFDE_ConfigReg
	ldr	r3, .L130+56
	ldr	r2, .L130+60
	movw	r1, #357
	mov	r0, #4
	ldr	r3, [r3]
	bl	dprint_normal
.L57:
	ldr	r3, [fp, #-80]
	cmp	r3, #0
	beq	.L58
	ldr	r4, [fp, #-76]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #116
	mov	r1, r4
	bl	MFDE_ConfigReg
	mov	r3, r4
	ldr	r2, .L130+64
	movw	r1, #371
	mov	r0, #4
	bl	dprint_normal
	ldr	r4, [fp, #-72]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #120
	mov	r1, r4
	bl	MFDE_ConfigReg
	mov	r3, r4
	ldr	r2, .L130+68
	movw	r1, #375
	mov	r0, #4
	bl	dprint_normal
	ldr	r4, [fp, #-68]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #124
	mov	r1, r4
	bl	MFDE_ConfigReg
	mov	r3, r4
	ldr	r2, .L130+72
	movw	r1, #379
	mov	r0, #4
	bl	dprint_normal
.L58:
	mov	r3, r7
	mov	r2, r5
	mvn	r1, #0
	mov	r0, #32
	bl	MFDE_ConfigReg
	mvn	r3, #0
	ldr	r2, .L130+76
	movw	r1, #321
	mov	r0, #4
	bl	dprint_normal
	mov	r0, #0
.L116:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L7:
	ldrb	r1, [r6, #4]	@ zero_extendqisi2
	ldrb	r3, [r6, #71]	@ zero_extendqisi2
	ldr	r2, [r6, #196]
	cmp	r1, #2
	strb	r3, [fp, #-56]
	str	r2, [r6, #152]
	beq	.L129
.L16:
	ldrh	r3, [r6, #78]
	bic	r2, r2, #15
	ldr	lr, [r6, #176]
	ldr	ip, [r6, #180]
	mov	r3, r3, asl #4
	ldr	r0, [r6, #156]
	str	r2, [r6, #152]
	str	r2, [fp, #-100]
	str	r3, [fp, #-108]
	ldr	r1, [r6, #164]
	ldr	r2, [r6, #172]
	ldr	r3, [r6, #148]
	str	lr, [fp, #-96]
	str	ip, [fp, #-60]
	str	r0, [fp, #-88]
	str	r1, [fp, #-84]
	str	r2, [fp, #-92]
	str	r3, [fp, #-104]
	b	.L20
.L8:
	add	r8, r6, #12288
	ldrb	r3, [r6, #151]	@ zero_extendqisi2
	ldr	r9, [r8, #2244]
	strb	r3, [fp, #-56]
	cmp	r9, #0
	beq	.L60
	mov	lr, #0
	add	r0, r6, #208
	mov	ip, lr
.L22:
	mov	r1, r0
	mov	r3, #2
.L24:
	ldr	r2, [r1, #4]!
	cmp	r2, #0
	beq	.L23
	ldr	r10, [r1, #-8]
	bic	r2, r2, #15
	cmp	r10, #0
	beq	.L23
	cmp	ip, #0
	cmpne	r2, ip
	movls	ip, r2
.L23:
	subs	r3, r3, #1
	bne	.L24
	add	lr, lr, #1
	add	r0, r0, #28
	cmp	lr, r9
	bne	.L22
.L21:
	ldrh	r2, [r6, #152]
	ldrh	r3, [r6, #154]
	str	ip, [r6, #192]
	ldr	r0, [r8, #2248]
	mul	r3, r3, r2
	ldr	r1, [r8, #2256]
	str	ip, [fp, #-100]
	mov	r2, r2, asl #4
	ldr	ip, [r8, #2264]
	str	r0, [fp, #-88]
	str	r1, [fp, #-84]
	ldr	r0, [r6, #164]
	ldr	r1, [r6, #168]
	str	ip, [fp, #-92]
	str	r3, [fp, #-104]
	str	r2, [fp, #-108]
	str	r0, [fp, #-96]
	str	r1, [fp, #-60]
	b	.L20
.L9:
	add	r3, r6, #45056
	ldrb	r2, [r6, #144]	@ zero_extendqisi2
	ldr	r9, [r3, #240]
	strb	r2, [fp, #-56]
	cmp	r9, #0
	beq	.L61
	mov	lr, #0
	add	ip, r6, #236
	mov	r0, lr
.L26:
	mov	r1, ip
	mov	r2, #2
.L28:
	ldr	r3, [r1, #4]!
	cmp	r3, #0
	beq	.L27
	ldr	r8, [r1, #8]
	bic	r3, r3, #15
	cmp	r8, #0
	ble	.L27
	cmp	r0, #0
	cmpne	r3, r0
	movls	r0, r3
.L27:
	subs	r2, r2, #1
	bne	.L28
	add	lr, lr, #1
	add	ip, ip, #44
	cmp	lr, r9
	bne	.L26
.L25:
	ldrh	r3, [r6, #150]
	ldrh	r2, [r6, #146]
	str	r0, [r6, #196]
	mov	r1, r3, asl #4
	str	r0, [fp, #-100]
	mul	r3, r2, r3
	ldr	r2, [r6, #188]
	str	r1, [fp, #-108]
	ldr	ip, [r6, #192]
	str	r2, [fp, #-96]
	ldr	r0, [r6, #212]
	ldr	r1, [r6, #216]
	ldr	r2, [r6, #224]
.L121:
	str	r3, [fp, #-104]
	str	ip, [fp, #-60]
	str	r0, [fp, #-88]
	str	r1, [fp, #-84]
	str	r2, [fp, #-92]
	b	.L59
.L11:
	ldr	r9, [r6, #108]
	ldrb	r2, [r6, #20]	@ zero_extendqisi2
	ldrb	r3, [r6, #52]	@ zero_extendqisi2
	cmp	r9, #0
	strb	r2, [fp, #-55]
	strb	r3, [fp, #-56]
	ble	.L63
	mov	lr, #0
	add	ip, r6, #556
	mov	r0, lr
.L35:
	mov	r1, ip
	mov	r2, #2
.L37:
	ldr	r3, [r1, #4]!
	cmp	r3, #0
	beq	.L36
	ldr	r8, [r1, #8]
	bic	r3, r3, #15
	cmp	r8, #0
	ble	.L36
	cmp	r0, #0
	cmpne	r3, r0
	movls	r0, r3
.L36:
	subs	r2, r2, #1
	bne	.L37
	add	lr, lr, #1
	add	ip, ip, #28
	cmp	lr, r9
	bne	.L35
.L34:
	ldrh	r3, [r6, #64]
	ldrh	r2, [r6, #66]
	str	r0, [r6, #72]
	mov	r1, r3, asl #4
	str	r0, [fp, #-100]
	mul	r3, r2, r3
	ldr	r2, [r6, #124]
	str	r1, [fp, #-108]
	ldr	ip, [r6, #16]
	str	r2, [fp, #-96]
	ldr	r0, [r6, #528]
	ldr	r1, [r6, #532]
	ldr	r2, [r6, #540]
	b	.L121
.L10:
	add	r8, r6, #12288
	ldrb	r3, [r6, #155]	@ zero_extendqisi2
	ldr	r9, [r8, #2248]
	strb	r3, [fp, #-56]
	cmp	r9, #0
	beq	.L62
	mov	lr, #0
	add	r0, r6, #216
	mov	ip, lr
.L31:
	mov	r1, r0
	mov	r3, #2
.L33:
	ldr	r2, [r1, #4]!
	cmp	r2, #0
	beq	.L32
	ldr	r10, [r1, #-12]
	bic	r2, r2, #15
	cmp	r10, #0
	beq	.L32
	cmp	ip, #0
	cmpne	r2, ip
	movls	ip, r2
.L32:
	subs	r3, r3, #1
	bne	.L33
	add	lr, lr, #1
	add	r0, r0, #28
	cmp	lr, r9
	bne	.L31
.L30:
	ldrh	r2, [r6, #158]
	ldrh	r3, [r6, #160]
	str	ip, [r6, #196]
	ldr	r0, [r8, #2256]
	mul	r3, r3, r2
	ldr	r1, [r8, #2264]
	str	ip, [fp, #-100]
	mov	r2, r2, asl #4
	ldr	ip, [r8, #2272]
	str	r0, [fp, #-88]
	str	r1, [fp, #-84]
	ldr	r0, [r6, #172]
	ldr	r1, [r6, #176]
	str	ip, [fp, #-92]
	str	r3, [fp, #-104]
	str	r2, [fp, #-108]
	str	r0, [fp, #-96]
	str	r1, [fp, #-60]
	b	.L15
.L13:
	ldr	r2, [r6, #2788]
	ldrb	r1, [r6, #2778]	@ zero_extendqisi2
	ldr	r3, [r6, #2792]
	ldr	r0, [r6, #2816]
	strb	r1, [fp, #-56]
	mul	r3, r3, r2
	ldr	r1, [r6, #3120]
	mov	r2, r2, asl #4
	ldr	ip, [r6, #3124]
	str	r2, [fp, #-108]
	str	r0, [fp, #-100]
	str	r1, [fp, #-96]
	ldr	r0, [r6, #2796]
	ldr	r1, [r6, #3148]
	ldr	r2, [r6, #3156]
	str	r3, [fp, #-104]
	str	ip, [fp, #-60]
	str	r0, [fp, #-88]
	str	r1, [fp, #-84]
	str	r2, [fp, #-92]
.L59:
	sub	r2, r4, #11
	cmp	r4, #17
	cmpne	r2, #1
	bls	.L20
	ldr	r2, [fp, #-48]
	cmp	r2, #1
	movne	r2, #1
	strne	r2, [fp, #-112]
	beq	.L20
	cmp	r4, #16
	mov	r8, #0
	bne	.L40
.L124:
	ldrb	r2, [fp, #-53]	@ zero_extendqisi2
	mov	r10, r8
	bfi	r8, r2, #30, #1
	b	.L41
.L12:
	ldrh	r2, [r6, #54]
	ldrb	r1, [r6, #52]	@ zero_extendqisi2
	ldrh	r3, [r6, #56]
	ldr	r0, [r6, #60]
	strb	r1, [fp, #-56]
	mul	r3, r3, r2
	ldr	r1, [r6, #176]
	mov	r2, r2, asl #4
	ldr	ip, [r6, #180]
	str	r2, [fp, #-108]
	str	r0, [fp, #-100]
	str	r1, [fp, #-96]
	ldr	r0, [r6, #192]
	ldr	r1, [r6, #200]
	ldr	r2, [r6, #208]
	str	r3, [fp, #-104]
	str	ip, [fp, #-60]
	str	r0, [fp, #-88]
	str	r1, [fp, #-84]
	str	r2, [fp, #-92]
	b	.L15
.L14:
	ldr	r2, [r6, #1284]
	add	r1, r6, #4096
	ldr	r3, [r6, #16]
	ldr	r0, [r6, #20]
	add	r2, r2, #332
	add	r2, r2, #2
	add	r3, r3, #1
	ldr	ip, [r6, r2, asl #2]
	mla	r3, r0, r3, r3
	ldrb	r2, [r6, #2]	@ zero_extendqisi2
	ldr	r0, [r6, #192]
	str	ip, [fp, #-96]
	strb	r2, [fp, #-53]
	mov	r2, #1
	str	r0, [fp, #-108]
	str	r2, [fp, #-80]
	ldr	r0, [r6, #1332]
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldr	ip, [r6, #1312]
	strb	r0, [fp, #-54]
	strb	r2, [fp, #-56]
	ldr	r0, [r6, #1324]
	ldr	r2, [r6, #1608]
	str	ip, [fp, #-76]
	str	r0, [fp, #-100]
	str	r2, [fp, #-60]
	ldr	r0, [r6, #1292]
	ldr	r2, [r6, #1300]
	str	r0, [fp, #-88]
	str	r2, [fp, #-84]
	ldr	r0, [r6, #1308]
	ldr	r2, [r6, #1604]
	str	r0, [fp, #-92]
	str	r2, [fp, #-64]
	ldr	r0, [r6, #1320]
	ldr	r2, [r6, #1316]
	str	r0, [fp, #-68]
	str	r2, [fp, #-72]
	str	r3, [fp, #-104]
	ldr	r2, [r1, #828]
	str	r2, [fp, #-48]
	b	.L59
.L4:
	ldr	r3, [fp, #-104]
	b	.L15
.L47:
	orr	r8, r8, #4194304
	b	.L48
.L125:
	sub	r2, r4, #14
	cmp	r2, #1
	bls	.L42
	cmp	r4, #4
	bhi	.L41
	b	.L42
.L128:
	ldr	r4, .L130+56
	mov	r3, r7
	mov	r2, r5
	mov	r0, #128
	ldr	r1, [r4]
	bl	MFDE_ConfigReg
	ldr	r3, [r4]
	ldr	r2, .L130+60
	mov	r1, #348
	mov	r0, #4
	bl	dprint_normal
	mov	r3, r7
	mov	r2, r5
	ldr	r1, [fp, #-60]
	mov	r0, #132
	bl	MFDE_ConfigReg
	ldr	r3, [fp, #-60]
	ldr	r2, .L130+80
	movw	r1, #351
	mov	r0, #4
	bl	dprint_normal
	b	.L57
.L126:
	ldrb	r2, [fp, #-55]	@ zero_extendqisi2
	cmp	r2, #3
	cmpne	r2, #1
	movls	r2, #1
	movhi	r2, #0
	bfi	r6, r2, #15, #1
	b	.L53
.L123:
	ldr	r2, .L130+84
	movw	r1, #998
	bl	dprint_normal
	mvn	r0, #0
	b	.L116
.L129:
	ldrb	ip, [r6, #70]	@ zero_extendqisi2
	cmp	ip, #0
	ble	.L16
	mov	r3, r6
	mov	r1, #0
.L19:
	ldr	r0, [r3, #188]
	cmp	r0, #0
	beq	.L17
	ldr	r0, [r3, #212]
	cmp	r0, r2
	strcc	r0, [r6, #152]
	movcc	r2, r0
	bcc	.L18
.L17:
	ldr	r0, [r3, #196]
	cmp	r0, r2
	strcc	r0, [r6, #152]
	movcc	r2, r0
.L18:
	add	r1, r1, #1
	add	r3, r3, #48
	cmp	r1, ip
	bne	.L19
	b	.L16
.L62:
	mov	ip, r9
	b	.L30
.L63:
	mov	r0, #0
	b	.L34
.L61:
	mov	r0, r9
	b	.L25
.L60:
	mov	ip, r9
	b	.L21
.L127:
	ldr	r2, .L130+88
	movw	r1, #263
	mov	r0, #1
	bl	dprint_normal
	ldr	r2, .L130+92
	movw	r1, #1039
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L116
.L131:
	.align	2
.L130:
	.word	g_VdmDrvParam
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC1
	.word	s_pstVfmwChan
	.word	.LANCHOR0
	.word	g_HwMem
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	g_BackTunnelCtrl
	.word	.LC12
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC13
	.word	.LC0
	.word	.LC5
	.word	.LC6
	UNWIND(.fnend)
	.size	HAL_CfgVdmReg, .-HAL_CfgVdmReg
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	CSWTCH.13, %object
	.size	CSWTCH.13, 76
CSWTCH.13:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	2
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	10
	.word	10
	.word	12
	.word	2
	.word	0
	.word	13
	.word	14
	.word	15
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"Protrol Not Support!\012\000" )
	.space	2
.LC1:
	ASCII(.ascii	"BASIC_CFG0 = 0x%x\012\000" )
	.space	1
.LC2:
	ASCII(.ascii	"BASIC_CFG1 = 0x%x\012\000" )
	.space	1
.LC3:
	ASCII(.ascii	"VAM_ADDR = 0x%x\012\000" )
	.space	3
.LC4:
	ASCII(.ascii	"VREG_STREAM_BASE_ADDR = 0x%x\012\000" )
	.space	2
.LC5:
	ASCII(.ascii	"ERROR: not support H264 MBAFF(pic_width %d) ext ram" )
	ASCII(.ascii	", for it needs double size!!\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"Configure EMAR FAILed!\012\000" )
.LC7:
	ASCII(.ascii	"REG_EMAR_ID = 0x%x\012\000" )
.LC8:
	ASCII(.ascii	"YSTADDR_1D = 0x%x\012\000" )
	.space	1
.LC9:
	ASCII(.ascii	"YSTRIDE_1D = 0x%x\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"UVOFFSET_1D = 0x%x\012\000" )
.LC11:
	ASCII(.ascii	"VREG_HEAD_INF_OFFSET = 0x%x\012\000" )
	.space	3
.LC12:
	ASCII(.ascii	"VREG_BACKTUNL_CTRL = 0x%x\012\000" )
	.space	1
.LC13:
	ASCII(.ascii	"VREG_BACKTUNL_ADDR = 0x%x\012\000" )
	.space	1
.LC14:
	ASCII(.ascii	"VREG_YSTRIDE_2BIT = 0x%x\012\000" )
	.space	2
.LC15:
	ASCII(.ascii	"VREG_YOFFSET_2BIT = 0x%x\012\000" )
	.space	2
.LC16:
	ASCII(.ascii	"VREG_UVOFFSET_2BIT = 0x%x\012\000" )
	.space	1
.LC17:
	ASCII(.ascii	"VREG_INT_STATE = 0x%x\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
