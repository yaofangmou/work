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
	.file	"vdm_hal_vc1.c"
	.text
	.align	2
	.global	VC1HAL_CfgSliceMsg
	.type	VC1HAL_CfgSliceMsg, %function
VC1HAL_CfgSliceMsg:
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
	ldr	r3, [r1, #36]
	mov	r10, r0
	mov	r0, r3
	str	r3, [fp, #-60]
	bl	MEM_Phy2Vir
	subs	ip, r0, #0
	beq	.L79
	ldrb	r3, [r10, #4]	@ zero_extendqisi2
	ldrb	lr, [r10, #70]	@ zero_extendqisi2
	cmp	r3, #2
	add	r3, r10, #184
	beq	.L80
	cmp	lr, #0
	str	r3, [fp, #-56]
	ble	.L1
	ldr	r4, .L82
	mov	r5, #0
	add	r6, ip, #252
	add	ip, ip, #63
	mov	r2, r5
	mov	r9, r5
	mov	r7, r10
.L57:
	cmp	r9, #0
	bne	.L33
	cmp	lr, #1
	ldr	r5, [r10, #208]
	beq	.L67
	ble	.L35
	ldr	r3, [r10, #256]
	cmp	r5, r3
	blt	.L35
	ldr	r3, [fp, #-56]
	mov	r2, #1
	b	.L36
.L38:
	ldr	r1, [r3, #72]
	cmp	r5, r1
	blt	.L60
.L36:
	add	r2, r2, #1
	add	r3, r3, #48
	cmp	r2, lr
	bne	.L38
.L76:
	mov	r3, #0
	str	r3, [fp, #-48]
.L39:
	mov	r3, #0
	str	r3, [fp, #-52]
.L34:
	ldr	r3, [r4, #848]
	sub	r0, ip, #63
	ldr	r1, [r4, #852]
	add	r9, r9, #1
	rsb	r0, r3, r0
	ldr	lr, [r7, #196]
	cmp	r0, r1
	ldr	r0, [r10, #152]
	ldr	r8, [r7, #200]
	add	r6, r6, #256
	rsb	r0, r0, lr
	ldrcc	r3, .L82
	ldr	lr, [r7, #204]
	movcs	r8, #1
	ldrcc	r1, .L82
	addcc	r8, r8, r0, lsl #3
	ldrcs	lr, .L82
	add	r7, r7, #48
	addcc	r8, lr, r8, lsl #25
	strcc	r8, [r6, #-508]
	ldrcc	r3, [r3, #848]
	ldrcc	r1, [r1, #852]
	strcs	r8, [lr, #844]
	sub	lr, ip, #62
	rsb	lr, r3, lr
	cmp	lr, r1
	biccc	r0, r0, #15
	strcc	r0, [r6, #-504]
	ldrcc	r3, [r4, #848]
	movcs	r0, #1
	ldrcc	r1, [r4, #852]
	strcs	r0, [r4, #844]
	sub	r0, ip, #61
	rsb	r0, r3, r0
	cmp	r0, r1
	movcc	r3, #0
	strcc	r3, [r6, #-500]
	ldrcc	r3, [r4, #848]
	movcs	r0, #1
	ldrcc	r1, [r4, #852]
	strcs	r0, [r4, #844]
	sub	r0, ip, #60
	rsb	r0, r3, r0
	cmp	r0, r1
	movcc	r3, #0
	strcc	r3, [r6, #-496]
	ldrcc	r3, [r4, #848]
	movcs	r0, #1
	ldrcc	r1, [r4, #852]
	strcs	r0, [r4, #844]
	sub	r0, ip, #59
	rsb	r0, r3, r0
	cmp	r0, r1
	ldrcc	r3, [fp, #-52]
	movcs	r0, #1
	strcs	r0, [r4, #844]
	addcc	r3, r3, r5, lsl #16
	strcc	r3, [r6, #-492]
	ldrcc	r3, [r4, #848]
	ldrcc	r1, [r4, #852]
	rsb	r3, r3, ip
	add	ip, ip, #64
	cmp	r3, r1
	ldrcc	r3, [fp, #-48]
	movcs	r3, #1
	strcs	r3, [r4, #844]
	strcc	r3, [r6, #-256]
	ldrb	lr, [r10, #70]	@ zero_extendqisi2
	cmp	lr, r9
	bgt	.L57
.L1:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L33:
	ldr	r1, [fp, #-56]
	mov	r3, r2, asl #6
	add	r0, r2, #1
	sub	r3, r3, r2, asl #4
	add	r3, r1, r3
	cmp	r0, lr
	ldr	r1, [r3, #24]
	bge	.L40
	ldr	r8, [r3, #72]
	cmp	r1, r8
	bge	.L41
	b	.L40
.L43:
	ldr	r8, [r3, #72]
	cmp	r1, r8
	blt	.L77
.L41:
	add	r0, r0, #1
	add	r3, r3, #48
	cmp	r0, lr
	bne	.L43
.L69:
	mov	r3, #0
	str	r3, [fp, #-48]
.L44:
	add	r3, r5, #1
	mov	r5, r1
	str	r3, [fp, #-52]
	b	.L34
.L40:
	cmp	r0, lr
	beq	.L69
.L77:
	ldr	r3, [fp, #-60]
	mov	r2, r0
	add	r3, r3, r0, lsl #8
	str	r3, [fp, #-48]
	b	.L44
.L35:
	cmp	lr, #1
	beq	.L68
	mov	r2, #1
.L60:
	ldr	r3, [fp, #-60]
	add	r3, r3, r2, lsl #8
	str	r3, [fp, #-48]
	b	.L39
.L67:
	str	r9, [fp, #-52]
	str	r9, [fp, #-48]
	b	.L34
.L80:
	cmp	lr, #0
	str	r3, [fp, #-76]
	ble	.L1
	add	r3, ip, #252
	ldr	r4, .L82
	mov	r6, #0
	add	r8, ip, #63
	mov	r9, r10
	str	r10, [fp, #-52]
	mov	r7, r6
	mov	r10, r3
	str	r6, [fp, #-48]
.L31:
	ldr	r3, [fp, #-52]
	ldr	r1, [r9, #188]
	ldr	r0, [r9, #200]
	ldr	r2, [r3, #152]
	cmp	r1, #0
	ldr	r3, [r9, #196]
	rsb	r3, r2, r3
	and	ip, r3, #15
	bic	r3, r3, #15
	str	r3, [fp, #-56]
	add	ip, r0, ip, lsl #3
	ldr	r3, [r9, #204]
	beq	.L62
	ldr	r0, [r9, #212]
	ldr	r1, [r9, #216]
	rsb	r2, r2, r0
	ldr	r0, [r9, #220]
	bic	r5, r2, #15
	str	r5, [fp, #-64]
	add	r2, r1, r2, lsl #3
	add	r2, r0, r2, lsl #25
	str	r2, [fp, #-68]
.L6:
	ldr	r2, [fp, #-48]
	cmp	r2, #0
	bne	.L7
	ldr	r2, [fp, #-52]
	cmp	lr, #1
	ldr	r6, [r2, #208]
	beq	.L63
	ble	.L9
	ldr	r2, [r2, #256]
	cmp	r6, r2
	blt	.L74
	ldr	r2, [fp, #-76]
	mov	r7, #1
	b	.L11
.L12:
	ldr	r1, [r2, #72]
	cmp	r6, r1
	blt	.L81
.L11:
	add	r7, r7, #1
	add	r2, r2, #48
	cmp	r7, lr
	bne	.L12
	mov	r5, #0
.L13:
	mov	r2, #0
	str	r2, [fp, #-72]
.L8:
	ldr	r1, [r4, #848]
	sub	r2, r8, #63
	ldr	r0, [r4, #852]
	add	r3, r3, ip, lsl #25
	rsb	r2, r1, r2
	add	r9, r9, #48
	cmp	r2, r0
	mov	r0, #5
	strcc	r3, [r10, #-252]
	add	r10, r10, #256
	ldrcs	r1, .L82
	movcs	r2, #1
	strcs	r2, [r1, #844]
	mov	r1, #106
	ldr	r2, .L82+4
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	sub	r3, r8, #62
	rsb	r3, r1, r3
	mov	r0, #5
	cmp	r3, r2
	mov	r1, #110
	ldrcs	r2, .L82
	movcs	r3, #1
	ldrcc	r3, [fp, #-56]
	strcs	r3, [r2, #844]
	strcc	r3, [r10, #-504]
	ldr	r2, .L82+8
	ldr	r3, [fp, #-56]
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	sub	r3, r8, #61
	rsb	r3, r1, r3
	mov	r0, #5
	cmp	r3, r2
	mov	r1, #114
	ldrcs	r2, .L82
	movcs	r3, #1
	ldrcc	r3, [fp, #-68]
	strcs	r3, [r2, #844]
	strcc	r3, [r10, #-500]
	ldr	r2, .L82+12
	ldr	r3, [fp, #-68]
	bl	dprint_normal
	ldr	r1, [r4, #848]
	ldr	r2, [r4, #852]
	sub	r3, r8, #60
	rsb	r3, r1, r3
	mov	r0, #5
	cmp	r3, r2
	mov	r1, #118
	ldrcs	r2, .L82
	movcs	r3, #1
	ldrcc	r3, [fp, #-64]
	strcs	r3, [r2, #844]
	strcc	r3, [r10, #-496]
	ldr	r2, .L82+16
	ldr	r3, [fp, #-64]
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r1, [r4, #852]
	sub	r2, r8, #59
	rsb	r2, r3, r2
	ldr	r3, [fp, #-72]
	cmp	r2, r1
	mov	r0, #5
	add	r3, r3, r6, lsl #16
	strcc	r3, [r10, #-492]
	ldrcs	r1, .L82
	movcs	r2, #1
	strcs	r2, [r1, #844]
	mov	r1, #122
	ldr	r2, .L82+20
	bl	dprint_normal
	ldr	r3, [r4, #848]
	ldr	r2, [r4, #852]
	mov	r1, #126
	rsb	r3, r3, r8
	mov	r0, #5
	cmp	r3, r2
	strcc	r5, [r10, #-256]
	add	r8, r8, #64
	ldrcs	r2, .L82
	movcs	r3, #1
	strcs	r3, [r2, #844]
	mov	r3, r5
	ldr	r2, .L82+24
	bl	dprint_normal
	ldr	r3, [fp, #-52]
	ldrb	lr, [r3, #70]	@ zero_extendqisi2
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
	cmp	lr, r3
	bgt	.L31
	b	.L1
.L7:
	ldr	r1, [fp, #-76]
	mov	r2, r7, asl #6
	add	r5, r7, #1
	sub	r2, r2, r7, asl #4
	add	r2, r1, r2
	cmp	r5, lr
	ldr	r1, [r2, #24]
	bge	.L14
	ldr	r0, [r2, #72]
	cmp	r1, r0
	bge	.L15
	b	.L14
.L17:
	ldr	r0, [r2, #72]
	cmp	r1, r0
	blt	.L75
.L15:
	add	r5, r5, #1
	add	r2, r2, #48
	cmp	r5, lr
	bne	.L17
.L66:
	mov	r5, #0
.L18:
	add	r2, r6, #1
	mov	r6, r1
	str	r2, [fp, #-72]
	b	.L8
.L14:
	cmp	r5, lr
	beq	.L66
.L75:
	ldr	r2, [fp, #-60]
	mov	r7, r5
	add	r5, r2, r5, lsl #8
	b	.L18
.L81:
	mov	r5, r7, asl #8
.L58:
	ldr	r2, [fp, #-60]
	add	r5, r5, r2
	b	.L13
.L62:
	str	r1, [fp, #-68]
	str	r1, [fp, #-64]
	b	.L6
.L63:
	ldr	r2, [fp, #-48]
	str	r2, [fp, #-72]
	mov	r5, r2
	b	.L8
.L74:
	mov	r5, #256
	mov	r7, #1
	b	.L58
.L79:
	ldr	r3, .L82+28
	mov	r1, #233
	ldr	r2, .L82+32
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_normal
.L9:
	bne	.L74
	mov	r7, lr
	ldr	r5, [fp, #-48]
	b	.L13
.L68:
	mov	r2, lr
	b	.L76
.L83:
	.align	2
.L82:
	.word	g_HwMem
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LANCHOR0
	.word	.LC0
	UNWIND(.fnend)
	.size	VC1HAL_CfgSliceMsg, .-VC1HAL_CfgSliceMsg
	.align	2
	.global	VC1HAL_CfgDnMsg
	.type	VC1HAL_CfgDnMsg, %function
VC1HAL_CfgDnMsg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	mov	r4, r0
	ldr	r0, [r1, #32]
	mov	r7, r1
	bl	MEM_Phy2Vir
	subs	r6, r0, #0
	beq	.L162
	ldr	r5, .L164
	mov	r3, #0
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	mov	r0, #0
	ldrb	ip, [r4, #3]	@ zero_extendqisi2
	ldr	r2, [r5, #848]
	bfi	r3, r1, #4, #2
	ldr	r1, [r5, #852]
	bfi	r3, ip, #0, #2
	rsb	r2, r2, r6
	str	r0, [fp, #-32]
	cmp	r2, r1
	ldrb	r1, [r4, #5]	@ zero_extendqisi2
	strb	r3, [fp, #-32]
	mov	r2, #0
	bfi	r2, r1, #6, #2
	strb	r2, [fp, #-31]
	ldrcc	r3, [fp, #-32]
	movcs	r2, #1
	ldrcs	r3, [fp, #-32]
	movw	r1, #267
	strcs	r2, [r5, #844]
	mov	r0, #5
	strcc	r3, [r6]
	ldr	r2, .L164+4
	bl	dprint_normal
	ldr	r2, [r5, #848]
	ldr	r0, [r5, #852]
	add	r3, r6, #1
	ldrh	r1, [r4, #80]
	rsb	r3, r2, r3
	ldrh	r2, [r4, #78]
	cmp	r3, r0
	mov	r3, #0
	ldr	r0, .L164
	str	r3, [fp, #-32]
	strb	r2, [fp, #-32]
	movcs	r2, #1
	strb	r1, [fp, #-30]
	movw	r1, #273
	ldrcc	r3, [fp, #-32]
	strcs	r2, [r0, #844]
	mov	r0, #5
	ldrcs	r3, [fp, #-32]
	strcc	r3, [r6, #4]
	ldr	r2, .L164+8
	bl	dprint_normal
	ldrb	r2, [r4, #8]	@ zero_extendqisi2
	ldrb	ip, [r4, #6]	@ zero_extendqisi2
	mov	r3, #0
	bfi	r3, r2, #2, #1
	ldrb	r1, [r4, #9]	@ zero_extendqisi2
	bfi	r3, ip, #0, #1
	ldr	ip, [r5, #848]
	ldrb	r0, [r4, #7]	@ zero_extendqisi2
	add	r2, r6, #2
	rsb	r2, ip, r2
	bfi	r3, r1, #3, #1
	ldr	ip, [r5, #852]
	bfi	r3, r0, #1, #1
	ldrb	r1, [r4, #10]	@ zero_extendqisi2
	mov	r0, #0
	cmp	r2, ip
	str	r0, [fp, #-32]
	bfi	r3, r1, #4, #2
	ldrb	r1, [r4, #11]	@ zero_extendqisi2
	ldr	r2, .L164
	mov	r0, #5
	bfi	r3, r1, #6, #2
	strb	r3, [fp, #-32]
	ldrcc	r3, [fp, #-32]
	movcs	r1, #1
	ldrcs	r3, [fp, #-32]
	strcs	r1, [r2, #844]
	movw	r1, #283
	strcc	r3, [r6, #8]
	ldr	r2, .L164+12
	bl	dprint_normal
	ldrb	r2, [r4, #15]	@ zero_extendqisi2
	ldrb	r0, [r4, #13]	@ zero_extendqisi2
	mov	r3, #0
	ldr	ip, [r5, #848]
	bfi	r3, r2, #4, #2
	ldrb	r1, [r4, #14]	@ zero_extendqisi2
	bfi	r3, r0, #1, #1
	add	r2, r6, #3
	ldr	r0, [r5, #852]
	rsb	r2, ip, r2
	bfi	r3, r1, #2, #1
	cmp	r2, r0
	ldrb	r1, [r4, #12]	@ zero_extendqisi2
	mov	r2, #0
	str	r2, [fp, #-32]
	bfi	r3, r1, #0, #1
	ldr	r2, .L164
	strb	r3, [fp, #-32]
	movcs	r1, #1
	ldrcc	r3, [fp, #-32]
	mov	r0, #5
	strcs	r1, [r2, #844]
	movw	r1, #291
	ldrcs	r3, [fp, #-32]
	strcc	r3, [r6, #12]
	ldr	r2, .L164+16
	bl	dprint_normal
	ldr	r1, [r5, #848]
	ldr	r2, [r5, #852]
	add	r3, r6, #4
	rsb	r3, r1, r3
	ldrb	ip, [r4, #18]	@ zero_extendqisi2
	cmp	r3, r2
	ldrb	r1, [r4, #16]	@ zero_extendqisi2
	ldrb	r2, [r4, #19]	@ zero_extendqisi2
	mov	r3, #0
	ldrb	r0, [r4, #17]	@ zero_extendqisi2
	bfi	r3, ip, #0, #5
	strb	r3, [fp, #-30]
	mov	r3, #0
	bfi	r3, r2, #0, #1
	mov	r2, #0
	strb	r3, [fp, #-29]
	bfi	r2, r0, #0, #5
	mov	r3, #0
	strb	r2, [fp, #-31]
	bfi	r3, r1, #0, #5
	ldr	r2, .L164
	strb	r3, [fp, #-32]
	movcs	r1, #1
	ldrcc	r3, [fp, #-32]
	mov	r0, #5
	strcs	r1, [r2, #844]
	movw	r1, #299
	ldrcs	r3, [fp, #-32]
	strcc	r3, [r6, #16]
	ldr	r2, .L164+20
	bl	dprint_normal
	ldrb	r1, [r4, #24]	@ zero_extendqisi2
	ldrb	r0, [r4, #23]	@ zero_extendqisi2
	mov	r3, #0
	ldr	ip, [r5, #848]
	bfi	r3, r1, #4, #1
	ldrb	r2, [r4, #20]	@ zero_extendqisi2
	add	r1, r6, #5
	rsb	r1, ip, r1
	bfi	r3, r0, #0, #2
	ldrb	ip, [r4, #22]	@ zero_extendqisi2
	and	r2, r2, #1
	ldr	r0, [r5, #852]
	ldrb	lr, [r4, #25]	@ zero_extendqisi2
	bfi	r2, ip, #2, #2
	cmp	r1, r0
	ldrb	ip, [r4, #21]	@ zero_extendqisi2
	ldrb	r0, [r4, #26]	@ zero_extendqisi2
	bfi	r3, lr, #6, #1
	bfi	r2, ip, #1, #1
	mov	r1, #0
	str	r1, [fp, #-32]
	bfi	r1, r0, #0, #4
	strb	r3, [fp, #-31]
	mov	r0, #5
	strb	r1, [fp, #-30]
	movcs	r1, #1
	strb	r2, [fp, #-32]
	ldr	r2, .L164
	ldrcc	r3, [fp, #-32]
	ldrcs	r3, [fp, #-32]
	strcs	r1, [r2, #844]
	movw	r1, #310
	strcc	r3, [r6, #20]
	ldr	r2, .L164+24
	bl	dprint_normal
	ldr	r1, [r5, #848]
	ldr	r0, [r5, #852]
	add	r3, r6, #6
	ldrb	r2, [r4, #27]	@ zero_extendqisi2
	rsb	r3, r1, r3
	cmp	r3, r0
	ldrb	r1, [r4, #28]	@ zero_extendqisi2
	and	r3, r2, #7
	mov	r2, #0
	bfi	r3, r1, #4, #2
	str	r2, [fp, #-32]
	strb	r3, [fp, #-32]
	movcs	r1, #1
	ldrcc	r3, [fp, #-32]
	mov	r0, #5
	ldr	r2, .L164
	ldrcs	r3, [fp, #-32]
	strcc	r3, [r6, #24]
	strcs	r1, [r2, #844]
	mov	r1, #316
	ldr	r2, .L164+28
	bl	dprint_normal
	ldrb	r1, [r4, #30]	@ zero_extendqisi2
	ldrb	r2, [r4, #29]	@ zero_extendqisi2
	mov	r3, #0
	ldrb	r0, [r4, #34]	@ zero_extendqisi2
	bfi	r3, r1, #1, #1
	bfi	r3, r2, #0, #1
	ldrb	r2, [r4, #33]	@ zero_extendqisi2
	mov	r1, #0
	bfi	r1, r0, #6, #1
	ldr	r0, [r5, #848]
	bfi	r1, r2, #4, #2
	add	r2, r6, #7
	ldrb	ip, [r4, #31]	@ zero_extendqisi2
	rsb	r2, r0, r2
	ldr	r0, [r5, #852]
	bfi	r3, ip, #2, #2
	mov	ip, #0
	cmp	r2, r0
	str	ip, [fp, #-32]
	ldrb	r2, [r4, #32]	@ zero_extendqisi2
	mov	r0, #5
	strb	r1, [fp, #-31]
	strb	r3, [fp, #-32]
	ldrh	r3, [fp, #-32]
	ldr	r1, .L164
	bfi	r3, r2, #4, #5
	strh	r3, [fp, #-32]	@ movhi
	ldrcc	r3, [fp, #-32]
	movcs	r2, #1
	ldrcs	r3, [fp, #-32]
	strcs	r2, [r1, #844]
	movw	r1, #326
	strcc	r3, [r6, #28]
	ldr	r2, .L164+32
	bl	dprint_normal
	ldrb	r3, [r4, #35]	@ zero_extendqisi2
	ldrb	r0, [r4, #36]	@ zero_extendqisi2
	add	r2, r6, #8
	ldrb	r1, [r4, #37]	@ zero_extendqisi2
	and	r3, r3, #1
	ldr	ip, [r5, #848]
	bfi	r3, r0, #1, #1
	bfi	r3, r1, #2, #1
	ldrb	r0, [r4, #38]	@ zero_extendqisi2
	ldr	r1, [r5, #852]
	rsb	r2, ip, r2
	bfi	r3, r0, #4, #2
	ldrb	r0, [r4, #39]	@ zero_extendqisi2
	cmp	r2, r1
	ldrb	r1, [r4, #40]	@ zero_extendqisi2
	bfi	r3, r0, #6, #2
	mov	r2, #0
	str	r2, [fp, #-32]
	bfi	r2, r1, #0, #2
	strb	r3, [fp, #-32]
	mov	r0, #5
	strb	r2, [fp, #-31]
	movcs	r2, #1
	ldrcc	r3, [fp, #-32]
	ldr	r1, .L164
	ldrcs	r3, [fp, #-32]
	strcc	r3, [r6, #32]
	strcs	r2, [r1, #844]
	mov	r1, #336
	ldr	r2, .L164+36
	bl	dprint_normal
	ldrb	r2, [r4, #46]	@ zero_extendqisi2
	ldrb	r0, [r4, #42]	@ zero_extendqisi2
	mov	r3, #0
	ldrb	ip, [r4, #44]	@ zero_extendqisi2
	bfi	r3, r2, #5, #1
	bfi	r3, r0, #1, #1
	ldrb	r1, [r4, #41]	@ zero_extendqisi2
	bfi	r3, ip, #3, #1
	ldr	ip, [r5, #848]
	ldrb	r0, [r4, #43]	@ zero_extendqisi2
	add	r2, r6, #9
	rsb	r2, ip, r2
	bfi	r3, r1, #0, #1
	ldr	ip, [r5, #852]
	bfi	r3, r0, #2, #1
	ldrb	r1, [r4, #47]	@ zero_extendqisi2
	mov	r0, #0
	cmp	r2, ip
	str	r0, [fp, #-32]
	bfi	r3, r1, #6, #1
	ldrb	r1, [r4, #45]	@ zero_extendqisi2
	ldr	r2, .L164
	mov	r0, #5
	bfi	r3, r1, #4, #1
	strb	r3, [fp, #-32]
	ldrcc	r3, [fp, #-32]
	movcs	r1, #1
	ldrcs	r3, [fp, #-32]
	strcs	r1, [r2, #844]
	movw	r1, #347
	strcc	r3, [r6, #36]
	ldr	r2, .L164+40
	bl	dprint_normal
	ldr	r2, [r5, #848]
	ldr	r1, [r5, #852]
	add	r3, r6, #10
	rsb	r3, r2, r3
	ldrb	r0, [r4, #49]	@ zero_extendqisi2
	cmp	r3, r1
	ldrb	r2, [r4, #50]	@ zero_extendqisi2
	ldrb	r1, [r4, #48]	@ zero_extendqisi2
	mov	r3, #0
	bfi	r3, r2, #0, #7
	mov	r2, #0
	str	r2, [fp, #-32]
	bfi	r2, r0, #0, #3
	strb	r3, [fp, #-30]
	mov	r3, #0
	strb	r2, [fp, #-31]
	bfi	r3, r1, #0, #3
	ldr	r2, .L164
	movcs	r1, #1
	strb	r3, [fp, #-32]
	mov	r0, #5
	ldrcc	r3, [fp, #-32]
	strcs	r1, [r2, #844]
	movw	r1, #354
	ldrcs	r3, [fp, #-32]
	strcc	r3, [r6, #40]
	ldr	r2, .L164+44
	bl	dprint_normal
	ldr	r2, [r5, #848]
	ldr	r0, [r5, #852]
	add	r3, r6, #11
	ldrb	r1, [r4, #53]	@ zero_extendqisi2
	rsb	r3, r2, r3
	ldrb	r2, [r4, #51]	@ zero_extendqisi2
	cmp	r3, r0
	ldrb	ip, [r4, #54]	@ zero_extendqisi2
	and	r1, r1, #3
	ldrb	r0, [r4, #52]	@ zero_extendqisi2
	and	r3, r2, #7
	bfi	r1, ip, #4, #1
	mov	r2, #0
	bfi	r3, r0, #4, #2
	str	r2, [fp, #-32]
	strb	r1, [fp, #-31]
	mov	r0, #5
	strb	r3, [fp, #-32]
	movcs	r1, #1
	ldrcc	r3, [fp, #-32]
	ldr	r2, .L164
	ldrcs	r3, [fp, #-32]
	strcc	r3, [r6, #44]
	strcs	r1, [r2, #844]
	movw	r1, #362
	ldr	r2, .L164+48
	bl	dprint_normal
	ldr	r3, [r5, #848]
	ldr	r1, [r5, #852]
	add	r2, r6, #12
	rsb	r2, r3, r2
	ldr	r3, [r4, #84]
	cmp	r2, r1
	ldr	r2, .L164
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r6, #48]
	strcs	r1, [r2, #844]
	movw	r1, #367
	ldr	r2, .L164+52
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #13
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r4, #88]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #52]
	strcs	r1, [r2, #844]
	mov	r1, #372
	ldr	r2, .L164+56
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #14
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r4, #92]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #56]
	strcs	r1, [r2, #844]
	movw	r1, #377
	ldr	r2, .L164+60
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #15
	ldrb	r0, [r4, #55]	@ zero_extendqisi2
	ldr	ip, [r5, #852]
	rsb	r2, r3, r2
	ldrh	lr, [r4, #72]
	mov	r3, #0
	ldrb	r1, [r4, #57]	@ zero_extendqisi2
	cmp	r2, ip
	bfi	r3, r0, #4, #1
	ldrb	ip, [r4, #56]	@ zero_extendqisi2
	ldrb	r0, [r4, #58]	@ zero_extendqisi2
	and	r2, r1, #1
	strh	lr, [fp, #-32]	@ movhi
	bfi	r3, ip, #5, #3
	bfi	r2, r0, #1, #3
	strb	r3, [fp, #-30]
	strb	r2, [fp, #-29]
	movcs	r1, #1
	ldrcc	r3, [fp, #-32]
	mov	r0, #5
	ldr	r2, .L164
	ldrcs	r3, [fp, #-32]
	strcc	r3, [r6, #60]
	strcs	r1, [r2, #844]
	movw	r1, #386
	ldr	r2, .L164+64
	bl	dprint_normal
	ldr	r3, [r5, #848]
	ldr	r1, [r5, #852]
	add	r2, r6, #16
	rsb	r2, r3, r2
	ldr	r3, [r4, #96]
	cmp	r2, r1
	ldr	r2, .L164
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r6, #64]
	strcs	r1, [r2, #844]
	movw	r1, #391
	ldr	r2, .L164+68
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #17
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r4, #100]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #68]
	strcs	r1, [r2, #844]
	mov	r1, #396
	ldr	r2, .L164+72
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #18
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r4, #104]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #72]
	strcs	r1, [r2, #844]
	movw	r1, #401
	ldr	r2, .L164+76
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #19
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r4, #108]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #76]
	strcs	r1, [r2, #844]
	movw	r1, #406
	ldr	r2, .L164+80
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #20
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r4, #112]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #80]
	strcs	r1, [r2, #844]
	movw	r1, #411
	ldr	r2, .L164+84
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #21
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r7, #884]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #84]
	strcs	r1, [r2, #844]
	movw	r1, #417
	ldr	r2, .L164+88
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #22
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r7, #888]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #88]
	strcs	r1, [r2, #844]
	movw	r1, #422
	ldr	r2, .L164+92
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #23
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r7, #864]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #92]
	strcs	r1, [r2, #844]
	movw	r1, #427
	ldr	r2, .L164+96
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #24
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r7, #896]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #96]
	strcs	r1, [r2, #844]
	mov	r1, #432
	ldr	r2, .L164+100
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #26
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r7, #868]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #104]
	strcs	r1, [r2, #844]
	movw	r1, #437
	ldr	r2, .L164+104
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r2, [r5, #848]
	add	r3, r6, #27
	ldr	r0, [r5, #852]
	rsb	r3, r2, r3
	ldrh	r1, [r4, #74]
	ldrh	r2, [r4, #76]
	cmp	r3, r0
	ldr	r0, .L164
	strh	r1, [fp, #-32]	@ movhi
	movw	r1, #443
	strh	r2, [fp, #-30]	@ movhi
	movcs	r2, #1
	ldrcc	r3, [fp, #-32]
	strcs	r2, [r0, #844]
	mov	r0, #5
	ldrcs	r3, [fp, #-32]
	strcc	r3, [r6, #108]
	ldr	r2, .L164+108
	bl	dprint_normal
	ldrb	r2, [r4, #59]	@ zero_extendqisi2
	ldr	ip, [r5, #848]
	mov	r3, #0
	bfi	r3, r2, #4, #1
	add	r2, r6, #28
	ldrb	r1, [r4, #60]	@ zero_extendqisi2
	rsb	r2, ip, r2
	ldrb	r0, [r4, #63]	@ zero_extendqisi2
	ldr	ip, [r5, #852]
	bfi	r3, r1, #5, #1
	ldrb	r1, [r4, #61]	@ zero_extendqisi2
	cmp	r2, ip
	mov	r2, #0
	bfi	r2, r0, #1, #3
	ldrb	r0, [r4, #62]	@ zero_extendqisi2
	bfi	r3, r1, #6, #1
	mov	r1, #0
	bfi	r2, r0, #0, #1
	str	r1, [fp, #-32]
	strb	r2, [fp, #-29]
	mov	r0, #5
	strb	r3, [fp, #-30]
	movcs	r2, #1
	ldrcc	r3, [fp, #-32]
	ldr	r1, .L164
	ldrcs	r3, [fp, #-32]
	strcc	r3, [r6, #112]
	strcs	r2, [r1, #844]
	mov	r1, #452
	ldr	r2, .L164+112
	bl	dprint_normal
	ldr	r3, [r5, #848]
	ldr	r1, [r5, #852]
	add	r2, r6, #29
	rsb	r2, r3, r2
	ldr	r3, [r4, #116]
	cmp	r2, r1
	ldr	r2, .L164
	mov	r0, #5
	movcs	r1, #1
	strcc	r3, [r6, #116]
	strcs	r1, [r2, #844]
	movw	r1, #457
	ldr	r2, .L164+116
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #30
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r4, #120]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #120]
	strcs	r1, [r2, #844]
	movw	r1, #462
	ldr	r2, .L164+120
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #31
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r4, #124]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #124]
	strcs	r1, [r2, #844]
	movw	r1, #467
	ldr	r2, .L164+124
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #32
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r4, #128]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #128]
	strcs	r1, [r2, #844]
	mov	r1, #472
	ldr	r2, .L164+128
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #33
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r4, #132]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #132]
	strcs	r1, [r2, #844]
	movw	r1, #477
	ldr	r2, .L164+132
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #34
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r4, #136]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #136]
	strcs	r1, [r2, #844]
	movw	r1, #482
	ldr	r2, .L164+136
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #35
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r4, #140]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #140]
	strcs	r1, [r2, #844]
	movw	r1, #487
	ldr	r2, .L164+140
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r3, [r5, #848]
	add	r2, r6, #36
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r3, r2
	ldr	r3, [r4, #144]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #144]
	strcs	r1, [r2, #844]
	mov	r1, #492
	ldr	r2, .L164+144
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r2, [r5, #848]
	add	r3, r6, #63
	ldr	r1, [r5, #852]
	mov	r0, #5
	rsb	r2, r2, r3
	ldr	r3, [r7, #36]
	cmp	r2, r1
	ldr	r2, .L164
	movcs	r1, #1
	strcc	r3, [r6, #252]
	strcs	r1, [r2, #844]
	movw	r1, #497
	ldr	r2, .L164+148
	str	r3, [fp, #-32]
	bl	dprint_normal
	ldr	r0, [r7, #868]
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L163
	ldr	r3, .L164+152
	mov	r2, #3072
	ldr	r1, [r4, #64]
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
.L86:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L163:
	ldr	r3, .L164+156
	movw	r1, #503
	ldr	r2, .L164+160
	bl	dprint_normal
	mvn	r0, #0
	b	.L86
.L162:
	ldr	r3, .L164+156
	movw	r1, #258
	ldr	r2, .L164+164
	bl	dprint_normal
	mvn	r0, #0
	b	.L86
.L165:
	.align	2
.L164:
	.word	g_HwMem
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
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
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC6
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+20
	.word	.LC38
	.word	.LC0
	UNWIND(.fnend)
	.size	VC1HAL_CfgDnMsg, .-VC1HAL_CfgDnMsg
	.align	2
	.global	VC1HAL_StartDec
	.type	VC1HAL_StartDec, %function
VC1HAL_StartDec:
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
	ldr	r4, .L167
	mov	r3, #1000
	mov	r5, r0
	mla	r4, r3, r1, r4
	mov	r1, r4
	bl	VC1HAL_CfgSliceMsg
	mov	r1, r4
	mov	r0, r5
	bl	VC1HAL_CfgDnMsg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L168:
	.align	2
.L167:
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VC1HAL_StartDec, .-VC1HAL_StartDec
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.13261, %object
	.size	__func__.13261, 19
__func__.13261:
	.ascii	"VC1HAL_CfgSliceMsg\000"
	.space	1
	.type	__func__.13269, %object
	.size	__func__.13269, 16
__func__.13269:
	.ascii	"VC1HAL_CfgDnMsg\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"%s: pMsgBase = NULL\012\000" )
	.space	3
.LC1:
	ASCII(.ascii	"D0 = 0x%08x\012\000" )
	.space	3
.LC2:
	ASCII(.ascii	"D1 = 0x%08x\012\000" )
	.space	3
.LC3:
	ASCII(.ascii	"D2 = 0x%08x\012\000" )
	.space	3
.LC4:
	ASCII(.ascii	"D3 = 0x%08x\012\000" )
	.space	3
.LC5:
	ASCII(.ascii	"D4 = 0x%08x\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"D63 = 0x%08x\012\000" )
	.space	2
.LC7:
	ASCII(.ascii	"D5 = 0x%08x\012\000" )
	.space	3
.LC8:
	ASCII(.ascii	"D6 = 0x%08x\012\000" )
	.space	3
.LC9:
	ASCII(.ascii	"D7 = 0x%08x\012\000" )
	.space	3
.LC10:
	ASCII(.ascii	"D8 = 0x%08x\012\000" )
	.space	3
.LC11:
	ASCII(.ascii	"D9 = 0x%08x\012\000" )
	.space	3
.LC12:
	ASCII(.ascii	"D10 = 0x%08x\012\000" )
	.space	2
.LC13:
	ASCII(.ascii	"D11 = 0x%08x\012\000" )
	.space	2
.LC14:
	ASCII(.ascii	"D12 = 0x%08x\012\000" )
	.space	2
.LC15:
	ASCII(.ascii	"D13 = 0x%08x\012\000" )
	.space	2
.LC16:
	ASCII(.ascii	"D14 = 0x%08x\012\000" )
	.space	2
.LC17:
	ASCII(.ascii	"D15 = 0x%08x\012\000" )
	.space	2
.LC18:
	ASCII(.ascii	"D16 = 0x%08x\012\000" )
	.space	2
.LC19:
	ASCII(.ascii	"D17 = 0x%08x\012\000" )
	.space	2
.LC20:
	ASCII(.ascii	"D18 = 0x%08x\012\000" )
	.space	2
.LC21:
	ASCII(.ascii	"D19 = 0x%08x\012\000" )
	.space	2
.LC22:
	ASCII(.ascii	"D20 = 0x%08x\012\000" )
	.space	2
.LC23:
	ASCII(.ascii	"D21 = 0x%08x\012\000" )
	.space	2
.LC24:
	ASCII(.ascii	"D22 = 0x%08x\012\000" )
	.space	2
.LC25:
	ASCII(.ascii	"D23 = 0x%08x\012\000" )
	.space	2
.LC26:
	ASCII(.ascii	"D24 = 0x%08x\012\000" )
	.space	2
.LC27:
	ASCII(.ascii	"D26 = 0x%08x\012\000" )
	.space	2
.LC28:
	ASCII(.ascii	"D27 = 0x%08x\012\000" )
	.space	2
.LC29:
	ASCII(.ascii	"D28 = 0x%08x\012\000" )
	.space	2
.LC30:
	ASCII(.ascii	"D29 = 0x%08x\012\000" )
	.space	2
.LC31:
	ASCII(.ascii	"D30 = 0x%08x\012\000" )
	.space	2
.LC32:
	ASCII(.ascii	"D31 = 0x%08x\012\000" )
	.space	2
.LC33:
	ASCII(.ascii	"D32 = 0x%08x\012\000" )
	.space	2
.LC34:
	ASCII(.ascii	"D33 = 0x%08x\012\000" )
	.space	2
.LC35:
	ASCII(.ascii	"D34 = 0x%08x\012\000" )
	.space	2
.LC36:
	ASCII(.ascii	"D35 = 0x%08x\012\000" )
	.space	2
.LC37:
	ASCII(.ascii	"D36 = 0x%08x\012\000" )
	.space	2
.LC38:
	ASCII(.ascii	"%s: u8Tmp = NULL\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
