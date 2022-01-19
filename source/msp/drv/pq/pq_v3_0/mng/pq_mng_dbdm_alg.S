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
	.file	"pq_mng_dbdm_alg.c"
	.text
	.align	2
	.type	CheckStartEndBorder.part.0, %function
CheckStartEndBorder.part.0:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #0
	ble	.L2
	add	r6, r1, r1, lsr #31
	mov	lr, r2
	mov	ip, #0
	mov	r6, r6, asr #1
	b	.L4
.L3:
	add	ip, ip, #1
	cmp	ip, r0
	beq	.L2
.L4:
	mov	r4, lr
	add	lr, lr, #1
	ldrb	r5, [r4]
	cmp	r5, #1
	bne	.L3
	cmp	r6, ip
	blt	.L3
	mov	ip, #0
	strb	ip, [r4]
	ldr	ip, [r3]
	sub	ip, ip, #1
	str	ip, [r3]
.L2:
	cmp	r0, #1
	ldmlefd	sp, {r4, r5, r6, fp, sp, pc}
	add	r1, r1, r1, lsr #31
	sub	ip, r0, #1
	add	r2, r2, ip
	mov	ip, #1
	mov	r4, r1, asr ip
	b	.L7
.L6:
	add	ip, ip, #1
	cmp	ip, r0
	beq	.L11
.L7:
	mov	r1, r2
	sub	r2, r2, #1
	ldrb	lr, [r1]
	cmp	lr, #1
	bne	.L6
	cmp	r4, ip
	blt	.L6
	mov	r2, #0
	strb	r2, [r1]
	ldr	r2, [r3]
	sub	r2, r2, #1
	str	r2, [r3]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L11:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	CheckStartEndBorder.part.0, .-CheckStartEndBorder.part.0
	.align	2
	.type	DetBorderOffsetRuler.isra.2, %function
DetBorderOffsetRuler.isra.2:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #60)
	sub	sp, sp, #60
	cmp	r1, #1
	mov	r5, r3
	str	r0, [fp, #-88]
	mov	r3, #0
	mov	r4, r2
	str	r3, [fp, #-76]
	str	r3, [fp, #-72]
	str	r3, [fp, #-68]
	str	r3, [fp, #-64]
	str	r3, [fp, #-60]
	str	r3, [fp, #-56]
	str	r3, [fp, #-52]
	str	r3, [fp, #-48]
	str	r3, [fp, #-80]
	strb	r3, [fp, #-81]
	beq	.L82
	cmp	r1, #2
	subne	r6, fp, #80
	subne	r3, fp, #81
	ldreq	r3, [fp, #4]
	ldreq	r2, [fp, #4]
	addeq	r3, r3, #8192
	strne	r3, [fp, #-92]
	addeq	r6, r2, #8640
	ldreq	r3, [r3, #440]
	addeq	r6, r6, #16
	streq	r3, [fp, #-92]
.L14:
	ldr	r3, [fp, #-88]
	cmp	r3, #4096
	bhi	.L12
	cmp	r4, #8
	beq	.L17
	sub	r1, r3, #3
	cmp	r1, #4
	bls	.L57
	ldrb	r3, [r5, #4]
	cmp	r3, #1
	beq	.L57
	add	r2, r5, #4
	mov	r10, r1
	mov	r3, #4
	b	.L19
.L31:
	ldrb	r0, [r2, #1]!
	cmp	r0, #1
	beq	.L59
.L19:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L31
.L18:
	rsb	ip, r4, r10
	cmp	ip, #3
	ble	.L36
	rsb	r2, r4, ip
	rsb	r7, r4, #0
	add	ip, r5, ip
	mov	r3, #0
	mov	lr, #1
.L35:
	add	r2, r2, r7
	strb	lr, [ip, r3]
	add	r0, r2, r4
	rsb	r3, r4, r3
	cmp	r0, #3
	bgt	.L35
.L36:
	cmp	r1, #0
	mov	r2, r1
	ble	.L34
	ldrb	r0, [r5, r1]
	add	r3, r5, r1
	cmp	r0, #1
	bne	.L37
	b	.L34
.L38:
	ldrb	r0, [r3, #-1]!
	cmp	r0, #1
	beq	.L34
.L37:
	subs	r2, r2, #1
	bne	.L38
.L34:
	add	r3, r4, r2
	cmp	r3, r1
	movcc	r0, #1
	bcs	.L43
.L42:
	strb	r0, [r5, r3]
	add	r3, r3, r4
	cmp	r3, r1
	bcc	.L42
.L43:
	cmp	r10, r2
	bgt	.L41
	add	r3, r2, #1
	str	r6, [fp, #-96]
	mov	r2, r10
	mov	r0, r10
	mov	r1, r3
	rsb	r9, r4, #0
	sub	r3, r4, #1
	add	r8, r4, #1
	mov	r7, #1
	mov	r6, r1
	b	.L45
.L46:
	mov	r2, lr
.L45:
	add	lr, r2, #1
	cmp	lr, r6
	beq	.L83
	cmp	lr, r10
	moveq	r0, r10
	beq	.L46
	ldrb	r1, [r5, lr]
	cmp	r1, #1
	bne	.L46
	add	r0, r4, r0
	rsb	r1, r0, lr
	cmp	r1, r3
	blt	.L61
	add	r1, r4, r0
	rsb	r2, r1, r2
.L47:
	add	r2, r2, r9
	strb	r7, [r5, r0]
	add	ip, r8, r2
	mov	r0, r1
	cmp	ip, r3
	add	r1, r4, r1
	bge	.L47
.L61:
	mov	r0, lr
	b	.L46
.L84:
	ldr	r1, [fp, #-76]
.L20:
	mov	r3, #0
	sub	r0, fp, #76
	mov	ip, r3
	mov	r2, r3
	b	.L54
.L24:
	ldr	r1, [r0, #4]!
.L54:
	cmp	r1, ip
	movhi	r3, r2
	add	r2, r2, #1
	movhi	ip, r1
	cmp	r2, #8
	bne	.L24
	ldr	r2, [fp, #-88]
	mov	r1, #0
	mov	r0, r5
	uxtb	r7, r3
	bl	memset
	cmp	r7, #0
	mov	r3, #0
	str	r3, [r6]
	sxtbne	r3, r7
	moveq	r3, r7
	addne	r1, r5, r3
	add	r3, r3, #7
	movne	r2, #1
	strneb	r2, [r1, #-1]
	strne	r2, [r6]
	cmp	r3, r8
	movcc	r1, #1
	bcs	.L30
.L29:
	strb	r1, [r5, r3]
	add	r3, r3, #8
	ldr	r2, [r6]
	cmp	r3, r8
	add	r2, r2, #1
	str	r2, [r6]
	bcc	.L29
.L30:
	ldr	r3, [fp, #-88]
	cmp	r3, #4096
	bgt	.L12
	mov	r3, r6
	mov	r2, r5
	mov	r1, r4
	ldr	r0, [fp, #-88]
	bl	CheckStartEndBorder.part.0
.L12:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L83:
	ldr	r6, [fp, #-96]
.L41:
	ldr	r3, [fp, #-88]
	mov	lr, #0
	str	lr, [r6]
	cmp	r3, #4
	bls	.L30
	ldr	r3, [fp, #-88]
	add	r1, r5, #3
	sub	r0, r3, #1
	ldr	r3, [fp, #4]
	add	ip, r3, #8192
	ldr	r3, [fp, #-92]
	add	r0, r3, r0
	add	r3, r3, #3
	b	.L53
.L49:
	ldrb	r2, [r3]
	sub	r7, r2, #1
	sxtb	r2, r2
	cmp	r2, #0
	strleb	lr, [r3]
	ble	.L51
.L80:
	strb	r7, [r3]
.L51:
	add	r3, r3, #1
	cmp	r3, r0
	beq	.L30
.L53:
	ldrb	r2, [r1, #1]!
	cmp	r2, #1
	bne	.L49
	ldr	r7, [r6]
	add	r7, r7, #1
	str	r7, [r6]
	strb	lr, [r1]
	strb	r2, [r1, #-1]
	ldrb	r2, [r3]
	ldrb	r7, [ip, #452]
	add	r8, r2, #1
	sxtb	r2, r2
	cmp	r2, r7
	strltb	r8, [r3]
	blt	.L51
	b	.L80
.L82:
	ldr	r3, [fp, #4]
	ldr	r2, [fp, #4]
	add	r3, r3, #8192
	add	r6, r2, #8640
	ldr	r3, [r3, #444]
	add	r6, r6, #12
	str	r3, [fp, #-92]
	b	.L14
.L17:
	ldr	r3, [fp, #-88]
	sub	r8, r3, #3
	cmp	r8, #4
	bls	.L58
	add	r2, r5, #3
	mov	r3, #4
	b	.L22
.L21:
	add	r3, r3, #1
	cmp	r3, r8
	beq	.L84
.L22:
	ldrb	r1, [r2, #1]!
	cmp	r1, #1
	bne	.L21
	and	r1, r3, #7
	sub	r0, fp, #44
	add	r1, r0, r1, lsl #2
	ldr	r0, [r1, #-32]
	add	r0, r0, #1
	str	r0, [r1, #-32]
	b	.L21
.L59:
	mov	r10, r3
	b	.L18
.L57:
	mov	r10, #4
	b	.L18
.L58:
	mov	r1, #0
	b	.L20
	UNWIND(.fnend)
	.size	DetBorderOffsetRuler.isra.2, .-DetBorderOffsetRuler.isra.2
	.global	__aeabi_uidiv
	.align	2
	.global	PQ_MNG_ALG_GetDbDetInfo
	.type	PQ_MNG_ALG_GetDbDetInfo, %function
PQ_MNG_ALG_GetDbDetInfo:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #100)
	sub	sp, sp, #100
	mov	r5, r2
	mov	r4, r0
	str	r0, [fp, #-92]
	movw	r2, #20508
	mov	r8, r1
	ldr	r0, .L299
	mov	r1, #0
	bl	memset
	mov	r1, r5
	movw	r2, #8260
	mov	r0, r4
	bl	memcpy
	ldr	r2, [r5, #48]
	ldr	r1, .L299+16
	add	r3, r2, #1
	ldr	r0, .L299+16
	strb	r2, [r1, #12]
	uxtb	r3, r3
	ldr	r2, [r5, #64]
	cmp	r3, #64
	strb	r2, [r1, #13]
	add	r2, r2, #1
	ldr	r3, [r5, #56]
	uxtb	r2, r2
	strb	r3, [r1, #14]
	add	r3, r3, #1
	ldr	r1, [r5, #44]
	uxtb	r3, r3
	str	r1, [r0]
	ldr	r1, [r5, #60]
	str	r1, [r0, #4]
	ldr	r1, [r5, #52]
	str	r1, [r0, #8]
	mvnhi	r1, #0
	strhib	r1, [r0, #12]
	cmp	r2, #64
	ldrhi	r1, .L299+16
	mvnhi	r2, #0
	strhib	r2, [r1, #13]
	cmp	r3, #64
	add	r1, r5, #576
	ldrhi	r2, .L299+16
	mvnhi	r3, #0
	strhib	r3, [r2, #14]
	ldr	r2, .L299+4
	add	ip, r2, #15360
.L89:
	ldr	r3, [r1, #4]!
	ubfx	r0, r3, #0, #11
	ubfx	r3, r3, #16, #11
	str	r0, [r2, #-4]
	str	r3, [r2], #8
	cmp	r2, ip
	bne	.L89
	mov	r7, r5
	ldr	r4, .L299
	ldr	ip, [r7, #68]!
	mov	r6, #1
	movw	lr, #3959
	movw	r9, #3969
.L90:
	add	r3, r6, #16384
	and	r2, ip, #1
	add	r3, r3, #14
	mov	r1, r6
	mov	r0, #1
	strb	r2, [r4, r3]
	b	.L93
.L91:
	cmp	r0, #32
	strb	r2, [r3]
	beq	.L288
.L93:
	add	r3, r4, r1
	cmp	r1, lr
	mov	r2, ip, lsr r0
	add	r3, r3, #16384
	add	r3, r3, #15
	and	r2, r2, #1
	add	r0, r0, #1
	add	r1, r1, #1
	bls	.L91
.L92:
	ldr	r6, .L299+8
	ldr	r1, .L299+12
	add	r3, r1, #2880
	add	r2, r1, #1920
	str	r3, [r6, #24]
	str	r1, [r6, #16]
	str	r2, [r6, #20]
	ldr	r7, [r5]
	ldr	r10, [r5, #8]
	cmp	r7, #4096
	ldr	r9, [r5, #4]
	movle	r3, #0
	movgt	r3, #1
	str	r3, [fp, #-80]
	cmp	r10, #4096
	orrgt	r3, r3, #1
	cmp	r9, #2160
	orrgt	r3, r3, #1
	cmp	r3, #0
	addne	r4, r8, #8192
	bne	.L218
	sub	r2, r7, #4
	movw	r3, #3836
	cmp	r2, r3
	bls	.L289
.L95:
	mov	r3, #0
	str	r3, [r5, #28]
.L96:
	movw	r3, #1079
	cmp	r9, r3
	cmple	r7, #1920
	movge	r3, #0
	strge	r3, [r5, #36]
	strge	r3, [r5, #40]
	cmp	r10, #960
	movge	r3, #0
	strge	r3, [r5, #36]
	ldr	r3, [r5, #32]
	cmp	r3, #1
	beq	.L290
.L99:
	add	r4, r8, #8192
	mvn	r3, #0
	strb	r3, [r8]
.L168:
	ldr	r3, [r5, #36]
	cmp	r3, #1
	beq	.L291
.L169:
	mvn	r3, #0
	strb	r3, [r8, #1]
.L193:
	ldr	r3, [r5, #40]
	cmp	r3, #1
	beq	.L292
.L194:
	mvn	r3, #0
	strb	r3, [r8, #2]
.L218:
	ldr	r3, [r8, #4]
	mov	r0, #0
	ldr	r2, [fp, #-92]
	str	r3, [r2, #44]
	ldrsb	r3, [r8]
	str	r3, [r2, #48]
	ldr	r3, [r8, #8]
	str	r3, [r2, #52]
	ldrsb	r3, [r8, #2]
	str	r3, [r2, #56]
	ldr	r3, [r8, #12]
	str	r3, [r2, #60]
	ldrsb	r3, [r8, #1]
	str	r3, [r2, #64]
	ldr	r3, [r4, #456]
	str	r3, [r2, #16]
	ldr	r3, [r4, #460]
	str	r3, [r2, #20]
	ldr	r3, [r4, #464]
	str	r3, [r2, #24]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L288:
	add	r6, r6, #32
	ldr	ip, [r7, #4]!
	cmp	r6, r9
	bne	.L90
	b	.L92
.L289:
	sub	r3, r9, #1
	cmp	r3, #2160
	bcc	.L96
	b	.L95
.L290:
	ldr	r3, [r5, #28]
	cmp	r3, #1
	bne	.L99
	add	r3, r8, #4096
	str	r3, [fp, #-84]
	mov	r2, r3
	ldr	r3, .L299+16
	ldrb	r2, [r2, #30]
	ldr	r1, [r3]
	cmp	r1, r2
	bcc	.L100
	ldrb	r2, [r3, #12]
	add	r3, r2, #1
	uxtb	r3, r3
	cmp	r3, #1
	bls	.L101
.L102:
	ldr	r3, [fp, #-84]
	add	lr, r8, #4096
	add	lr, lr, #52
	ldrb	r1, [r3, #28]
	sub	r3, r1, #1
	uxtb	r3, r3
	sxtb	r0, r3
	cmp	r0, #0
	ble	.L103
.L104:
	sxtb	r1, r3
	sub	r3, r3, #1
	ands	r3, r3, #255
	sxth	r1, r1
	mov	r2, r1, asl #3
	sub	r0, r2, #8
	add	r2, lr, r2
	add	ip, lr, r0
	ldrb	r0, [lr, r0]
	strb	r0, [lr, r1, asl #3]
	ldr	r1, [ip, #4]
	str	r1, [r2, #4]
	bne	.L104
	ldr	r3, .L299+16
	ldrb	r2, [r3, #12]
	ldr	r3, [fp, #-84]
	ldrb	r1, [r3, #28]
.L103:
	ldr	r0, [fp, #-84]
	strb	r2, [r0, #52]
	ldr	r2, .L299+16
	ldr	r3, [r0, #36]
	ldr	r2, [r2]
	cmp	r3, r1
	addcc	r3, r3, #1
	str	r2, [r0, #56]
	movcc	r2, r0
	strcc	r3, [r2, #36]
	cmp	r1, r3
	beq	.L106
	ldr	r2, .L299+16
	ldrb	r3, [r8]
	ldrb	r2, [r2, #12]
.L107:
	cmp	r2, r3
	sxtb	r2, r3
	str	r2, [fp, #-112]
	bne	.L112
	uxtb	r3, r3
	str	r3, [fp, #-96]
	add	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #1
	bls	.L113
	ldr	r2, [r6, #16]
	cmp	r7, #4096
	mov	r3, #0
	addhi	r4, r8, #8192
	str	r3, [fp, #-76]
	str	r2, [fp, #-88]
	str	r3, [fp, #-72]
	str	r3, [fp, #-68]
	str	r3, [fp, #-64]
	str	r3, [fp, #-60]
	str	r3, [fp, #-56]
	str	r3, [fp, #-52]
	str	r3, [fp, #-48]
	bhi	.L114
	ldr	r2, [fp, #-96]
	cmp	r2, #8
	beq	.L115
	sub	r0, r7, #3
	cmp	r0, #4
	bls	.L223
	ldr	r2, [fp, #-88]
	ldrb	r3, [r2, #4]
	cmp	r3, #1
	beq	.L223
	add	r3, r2, #4
	mov	r2, #4
.L117:
	add	r2, r2, #1
	str	r2, [fp, #-100]
	cmp	r2, r0
	beq	.L281
	ldrb	r1, [r3, #1]!
	cmp	r1, #1
	bne	.L117
.L281:
	str	r2, [fp, #-108]
.L116:
	ldr	r3, [fp, #-100]
	ldr	r2, [fp, #-96]
	rsb	lr, r2, r3
	cmp	lr, #4
	strgt	r7, [fp, #-104]
	ble	.L134
.L133:
	sub	r3, lr, #-1073741823
	mov	r2, #0
	mov	ip, r2
	mov	r1, r2
	add	r3, r4, r3, lsl #2
.L132:
	ldr	r7, [r3], #4
	cmp	r7, ip
	movhi	r2, r1
	add	r1, r1, #1
	movhi	ip, r7
	cmp	r1, #3
	bne	.L132
	sub	lr, lr, #1
	ldr	r3, [fp, #-96]
	add	r2, lr, r2
	mov	r1, #1
	rsb	lr, r3, r2
	ldr	r3, [fp, #-88]
	cmp	lr, #4
	strb	r1, [r3, r2]
	bgt	.L133
	ldr	r7, [fp, #-104]
.L134:
	cmp	r0, #0
	mov	r3, r0
	ble	.L282
	ldr	r2, [fp, #-88]
	ldrb	r1, [r2, r0]
	add	r2, r2, r0
	cmp	r1, #1
	bne	.L137
	b	.L282
.L138:
	ldrb	r1, [r2, #-1]!
	cmp	r1, #1
	beq	.L226
.L137:
	subs	r3, r3, #1
	bne	.L138
.L226:
	str	r3, [fp, #-104]
.L135:
	ldr	r3, [fp, #-104]
	ldr	r2, [fp, #-96]
	add	lr, r3, r2
	cmp	lr, r0
	strcc	r7, [fp, #-116]
	bcs	.L145
.L144:
	sub	r3, lr, #-1073741823
	mov	r2, #0
	mov	ip, r2
	mov	r1, r2
	add	r3, r4, r3, lsl #2
.L143:
	ldr	r7, [r3], #4
	cmp	r7, ip
	movhi	r2, r1
	add	r1, r1, #1
	movhi	ip, r7
	cmp	r1, #3
	bne	.L143
	sub	lr, lr, #1
	ldr	r3, [fp, #-96]
	add	r2, lr, r2
	mov	r1, #1
	add	lr, r2, r3
	ldr	r3, [fp, #-88]
	cmp	lr, r0
	strb	r1, [r3, r2]
	bcc	.L144
	ldr	r7, [fp, #-116]
.L145:
	ldr	r3, [fp, #-100]
	ldr	r2, [fp, #-104]
	cmp	r3, r2
	bhi	.L141
	ldr	r3, [fp, #-100]
	mov	r2, #0
	str	r7, [fp, #-116]
	str	r10, [fp, #-120]
	mov	r10, r2
	mov	r7, r3
	str	r5, [fp, #-124]
	b	.L152
.L148:
	ldr	r3, [fp, #-108]
	ldr	r2, [fp, #-104]
	add	r3, r3, #1
	str	r3, [fp, #-108]
	cmp	r3, r2
	mov	r7, r3
	bhi	.L293
.L152:
	ldr	r3, [fp, #-88]
	ldrb	r3, [r3, r7]
	cmp	r3, #1
	bne	.L148
	ldr	r2, [fp, #-100]
	cmp	r2, r7
	beq	.L227
	ldr	r2, [fp, #-96]
	cmp	r2, #0
	beq	.L148
	mov	r1, r2
	rsb	r0, r10, r7
	str	r3, [fp, #-128]
	bl	__aeabi_uidiv
	cmp	r0, #1
	mov	r5, r0
	bls	.L228
	ldr	r3, [fp, #-128]
	mov	r0, r3
.L151:
	ldr	r3, [fp, #-96]
	add	r3, r10, r3
	mov	r10, #0
	sub	r2, r3, #-1073741823
	mov	ip, r10
	mov	r1, r10
	add	r2, r4, r2, lsl #2
.L150:
	ldr	lr, [r2], #4
	cmp	lr, ip
	movhi	r10, r1
	add	r1, r1, #1
	movhi	ip, lr
	cmp	r1, #3
	bne	.L150
	sub	r3, r3, #1
	add	r0, r0, #1
	add	r10, r3, r10
	ldr	r3, [fp, #-88]
	cmp	r0, r5
	mov	r2, #1
	strb	r2, [r3, r10]
	bne	.L151
.L228:
	mov	r10, r7
	b	.L148
.L292:
	ldr	r3, [r5, #28]
	cmp	r3, #1
	bne	.L194
	add	r3, r8, #4096
	str	r3, [fp, #-84]
	mov	r2, r3
	ldr	r3, .L299+16
	ldrb	r2, [r2, #32]
	ldr	r1, [r3, #8]
	cmp	r1, r2
	bcc	.L195
	ldrb	r0, [r3, #14]
	add	r3, r0, #1
	uxtb	r3, r3
	cmp	r3, #1
	bls	.L196
.L197:
	ldr	r3, [fp, #-84]
	ldrb	r1, [r3, #28]
	add	r3, r8, #4224
	add	r3, r3, #52
	sub	r2, r1, #1
	uxtb	r2, r2
	sxtb	ip, r2
	cmp	ip, #0
	ble	.L198
.L199:
	sxtb	r0, r2
	sub	r2, r2, #1
	ands	r2, r2, #255
	sxth	r0, r0
	mov	r1, r0, asl #3
	sub	ip, r1, #8
	add	r1, r3, r1
	add	lr, r3, ip
	ldrb	ip, [r3, ip]
	strb	ip, [r3, r0, asl #3]
	ldr	r0, [lr, #4]
	str	r0, [r1, #4]
	bne	.L199
	ldr	r2, .L299+16
	ldrb	r0, [r2, #14]
	ldr	r2, [fp, #-84]
	ldrb	r1, [r2, #28]
.L198:
	ldr	ip, [fp, #-84]
	strb	r0, [ip, #180]
	ldr	r0, .L299+16
	ldr	r2, [ip, #44]
	ldr	r0, [r0, #8]
	cmp	r2, r1
	addcc	r2, r2, #1
	str	r0, [ip, #184]
	movcc	r0, ip
	strcc	r2, [r0, #44]
	cmp	r1, r2
	beq	.L201
	ldr	r2, .L299+16
	ldrb	r3, [r8, #2]
	ldrb	r2, [r2, #14]
.L202:
	cmp	r2, r3
	sxtb	r2, r3
	bne	.L207
	add	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #1
	bls	.L208
	ldr	r3, [r6, #24]
	mov	r1, #1
	str	r8, [sp]
	mov	r0, r9
	bl	DetBorderOffsetRuler.isra.2
	ldrsb	r3, [r8, #2]
	ldr	r5, .L299+8
	cmp	r3, #8
	beq	.L209
	ldrb	r3, [r4, #450]
	ldrb	r2, [r4, #451]
	cmp	r3, r2
	addcc	r3, r3, #1
	uxtbcc	r3, r3
	strccb	r3, [r4, #450]
	cmp	r2, r3
	bne	.L211
	cmp	r9, #4
	ble	.L233
	mov	r2, #0
	add	r10, r9, #1
	str	r8, [fp, #-80]
	mov	r9, r2
	mov	r3, #5
	ldr	r8, [fp, #-84]
	b	.L216
.L213:
	add	r3, r3, #1
	cmp	r3, r10
	beq	.L294
.L216:
	ldr	ip, [r8, #20]
	sub	r1, r3, #1
	ldrb	r7, [ip, r1]
	cmp	r7, #1
	bne	.L213
	ldr	r0, [r4, #444]
	sub	r6, r3, #2
	ldrb	r5, [r4, #451]
	add	r2, r2, #1
	ldrsb	lr, [r0, r1]
	cmp	lr, r5
	bge	.L213
	ldrsb	lr, [r0, r6]
	ldrsb	r0, [r0, r3]
	cmp	r5, lr
	bgt	.L215
	cmp	lr, r0
	blt	.L215
	strb	r7, [ip, r6]
	ldr	r0, [r8, #20]
	strb	r9, [r0, r1]
	b	.L213
.L291:
	ldr	r3, [r5, #28]
	cmp	r3, #1
	bne	.L169
	add	r3, r8, #4096
	str	r3, [fp, #-84]
	mov	r2, r3
	ldr	r3, .L299+16
	ldrb	r2, [r2, #31]
	ldr	r1, [r3, #4]
	cmp	r1, r2
	bcc	.L170
	ldrb	r0, [r3, #13]
	add	r3, r0, #1
	uxtb	r3, r3
	cmp	r3, #1
	bls	.L171
.L172:
	ldr	r3, [fp, #-84]
	ldrb	r2, [r3, #28]
	add	r3, r8, #4352
	add	r3, r3, #52
	sub	r1, r2, #1
	uxtb	r1, r1
	sxtb	ip, r1
	cmp	ip, #0
	ble	.L173
.L174:
	sxtb	ip, r1
	sub	r1, r1, #1
	ands	r1, r1, #255
	sxth	ip, ip
	mov	r0, ip, asl #3
	sub	r2, r0, #8
	add	r0, r3, r0
	add	lr, r3, r2
	ldrb	r2, [r3, r2]
	strb	r2, [r3, ip, asl #3]
	ldr	r2, [lr, #4]
	str	r2, [r0, #4]
	bne	.L174
	ldr	r2, .L299+16
	ldrb	r0, [r2, #13]
	ldr	r2, [fp, #-84]
	ldrb	r2, [r2, #28]
.L173:
	ldr	ip, [fp, #-84]
	strb	r0, [ip, #308]
	ldr	r0, .L299+16
	ldr	r1, [ip, #40]
	ldr	r0, [r0, #4]
	cmp	r1, r2
	addcc	r1, r1, #1
	str	r0, [ip, #312]
	movcc	r0, ip
	strcc	r1, [r0, #40]
	cmp	r2, r1
	beq	.L176
	ldr	r2, .L299+16
	ldrb	r3, [r8, #1]
	ldrb	r2, [r2, #13]
.L177:
	cmp	r2, r3
	sxtb	r2, r3
	bne	.L182
	add	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #1
	bls	.L183
	ldr	r3, [r6, #20]
	mov	r1, #2
	str	r8, [sp]
	mov	r0, r10
	bl	DetBorderOffsetRuler.isra.2
	ldrsb	r3, [r8, #1]
	ldr	r7, .L299+8
	cmp	r3, #8
	beq	.L184
	ldrb	r3, [r4, #449]
	ldrb	r2, [r4, #451]
	cmp	r3, r2
	addcc	r3, r3, #1
	uxtbcc	r3, r3
	strccb	r3, [r4, #449]
	cmp	r2, r3
	bne	.L186
	cmp	r10, #4
	ble	.L231
	add	r3, r10, #1
	str	r5, [fp, #-96]
	str	r3, [fp, #-80]
	mov	r10, #0
	mov	r3, #5
	str	r8, [fp, #-88]
	ldr	r5, [fp, #-84]
	b	.L191
.L188:
	ldr	r2, [fp, #-80]
	add	r3, r3, #1
	cmp	r3, r2
	beq	.L295
.L191:
	ldr	r0, [r5, #24]
	sub	r2, r3, #1
	ldrb	r8, [r0, r2]
	cmp	r8, #1
	bne	.L188
	ldr	r1, [r4, #440]
	sub	r7, r3, #2
	ldrb	lr, [r4, #451]
	add	r10, r10, #1
	ldrsb	ip, [r1, r2]
	cmp	ip, lr
	bge	.L188
	ldrsb	ip, [r1, r7]
	ldrsb	r1, [r1, r3]
	cmp	lr, ip
	bgt	.L190
	cmp	ip, r1
	blt	.L190
	strb	r8, [r0, r7]
	mov	r0, #0
	ldr	r1, [r5, #24]
	strb	r0, [r1, r2]
	b	.L188
.L195:
	mov	r0, #255
	mvn	r2, #0
	strb	r2, [r3, #14]
.L196:
	ldr	r2, .L299+16
	mov	r3, #100
	str	r3, [r2, #8]
	b	.L197
.L170:
	mov	r0, #255
	mvn	r2, #0
	strb	r2, [r3, #13]
.L171:
	ldr	r2, .L299+16
	mov	r3, #100
	str	r3, [r2, #4]
	b	.L172
.L100:
	mov	r2, #255
	mvn	r1, #0
	strb	r1, [r3, #12]
.L101:
	ldr	r1, .L299+16
	mov	r3, #100
	str	r3, [r1]
	b	.L102
.L207:
	mov	r2, r9
	mov	r1, #0
	ldr	r0, [r4, #444]
	bl	memset
	mov	r3, #0
	strb	r3, [r4, #450]
	b	.L218
.L201:
	ldr	r2, .L299+16
	cmp	r1, #1
	ldrb	r2, [r2, #14]
	ble	.L232
	mov	ip, #1
	sxtb	lr, r2
	mov	r0, ip
.L205:
	ldrsb	r5, [r3, #8]
	add	ip, ip, #1
	cmp	r5, lr
	bne	.L204
	ldr	r5, [fp, #-84]
	ldr	r10, [r3, #12]
	ldrb	r7, [r5, #51]
	add	r5, r0, #1
	cmp	r10, r7
	uxtbcs	r0, r5
.L204:
	cmp	ip, r1
	add	r3, r3, #8
	bne	.L205
.L203:
	ldr	r3, [fp, #-84]
	ldrb	r3, [r3, #48]
	cmp	r3, r0
	strlsb	r2, [r8, #2]
	movls	r3, r2
	ldrls	r2, .L299+16
	ldrhib	r3, [r8, #2]
	ldrlsb	r2, [r2, #14]
	b	.L202
.L298:
	ldr	r5, [fp, #-100]
	mov	r3, ip
.L147:
	str	r3, [r4, #456]
.L126:
	ldr	r3, [fp, #-80]
	cmp	r3, #0
	add	r3, r8, #8640
	add	r3, r3, #8
	bne	.L284
	ldr	r2, [fp, #-88]
	mov	r0, r7
	ldr	r1, [fp, #-112]
	bl	CheckStartEndBorder.part.0
.L284:
	ldrsb	r3, [r8]
	str	r3, [fp, #-112]
.L114:
	ldr	r3, [fp, #-112]
	cmp	r3, #8
	beq	.L159
	ldrb	r3, [r4, #448]
	ldrb	r2, [r4, #451]
	cmp	r3, r2
	addcc	r3, r3, #1
	uxtbcc	r3, r3
	strccb	r3, [r4, #448]
	cmp	r2, r3
	bne	.L159
	cmp	r7, #4
	ble	.L229
	add	r3, r7, #1
	str	r5, [fp, #-100]
	str	r3, [fp, #-80]
	mov	lr, #0
	mov	r7, #5
	str	r10, [fp, #-88]
	str	r8, [fp, #-96]
	ldr	r5, [fp, #-84]
	b	.L166
.L163:
	ldr	r3, [fp, #-80]
	add	r7, r7, #1
	cmp	r7, r3
	beq	.L296
.L166:
	ldr	r1, [r5, #16]
	sub	r3, r7, #1
	ldrb	r8, [r1, r3]
	cmp	r8, #1
	bne	.L163
	ldr	r2, [r4, #436]
	sub	r10, r7, #2
	ldrb	ip, [r4, #451]
	add	lr, lr, #1
	ldrsb	r0, [r2, r3]
	cmp	r0, ip
	bge	.L163
	ldrsb	r0, [r2, r10]
	ldrsb	r2, [r2, r7]
	cmp	ip, r0
	bgt	.L165
	cmp	r0, r2
	blt	.L165
	strb	r8, [r1, r10]
	mov	r1, #0
	ldr	r2, [r5, #16]
	strb	r1, [r2, r3]
	b	.L163
.L112:
	add	r4, r8, #8192
	mov	r2, r7
	mov	r1, #0
	ldr	r0, [r4, #436]
	bl	memset
	mov	r3, #0
	strb	r3, [r4, #448]
	b	.L168
.L182:
	mov	r2, r10
	mov	r1, #0
	ldr	r0, [r4, #440]
	bl	memset
	mov	r3, #0
	strb	r3, [r4, #449]
	b	.L193
.L176:
	ldr	r1, .L299+16
	cmp	r2, #1
	ldrb	r7, [r1, #13]
	ble	.L230
	mov	r0, #1
	sxtb	r1, r7
	str	r1, [fp, #-80]
	mov	r1, r0
	str	r2, [fp, #-88]
.L180:
	ldrsb	ip, [r3, #8]
	add	r0, r0, #1
	ldr	lr, [fp, #-80]
	cmp	ip, lr
	bne	.L179
	ldr	ip, [fp, #-84]
	ldr	r2, [r3, #12]
	ldrb	lr, [ip, #50]
	add	ip, r1, #1
	cmp	r2, lr
	uxtbcs	r1, ip
.L179:
	ldr	r2, [fp, #-88]
	add	r3, r3, #8
	cmp	r0, r2
	bne	.L180
.L178:
	ldr	r3, [fp, #-84]
	ldrb	r3, [r3, #48]
	cmp	r3, r1
	strlsb	r7, [r8, #1]
	ldrls	r2, .L299+16
	movhi	r2, r7
	ldrhib	r3, [r8, #1]
	movls	r3, r7
	ldrlsb	r2, [r2, #13]
	b	.L177
.L106:
	ldr	r3, .L299+16
	cmp	r1, #1
	ldrb	r0, [r3, #12]
	ble	.L221
	sxtb	r3, r0
	mov	ip, #1
	str	r3, [fp, #-100]
	mov	r3, r10
	mov	r2, ip
	mov	r10, r7
	mov	r7, r3
	str	r1, [fp, #-104]
.L110:
	ldrsb	r3, [lr, #8]
	add	ip, ip, #1
	ldr	r1, [fp, #-100]
	uxtb	ip, ip
	cmp	r3, r1
	sxtb	r3, ip
	str	r3, [fp, #-96]
	bne	.L109
	ldr	r1, [fp, #-84]
	add	r3, r2, #1
	str	r3, [fp, #-88]
	ldr	r3, [lr, #12]
	ldrb	r1, [r1, #49]
	cmp	r3, r1
	ldrcsb	r2, [fp, #-88]
.L109:
	ldr	r3, [fp, #-96]
	add	lr, lr, #8
	ldr	r1, [fp, #-104]
	cmp	r3, r1
	blt	.L110
	mov	r3, r7
	mov	r7, r10
	mov	r10, r3
.L108:
	ldr	r3, [fp, #-84]
	ldrb	r3, [r3, #48]
	cmp	r3, r2
	strlsb	r0, [r8]
	ldrls	r2, .L299+16
	movhi	r2, r0
	ldrhib	r3, [r8]
	movls	r3, r0
	ldrlsb	r2, [r2, #12]
	b	.L107
.L221:
	mov	r2, #1
	b	.L108
.L184:
	ldr	r3, [fp, #-84]
	mov	r2, r10
	ldr	r1, [r7, #20]
	ldr	r0, [r3, #24]
	bl	memcpy
.L192:
	ldr	r3, .L299+16
	ldr	r3, [r3, #4]
	str	r3, [r8, #12]
	b	.L193
.L183:
	ldr	r3, [fp, #-84]
	mov	r1, #0
	mov	r7, r1
	mov	r2, r10
	ldr	r0, [r3, #24]
	bl	memset
	str	r7, [r8, #12]
	mvn	r3, #0
	mov	r2, r10
	strb	r3, [r8, #1]
	mov	r1, r7
	ldr	r0, [r4, #440]
	bl	memset
	strb	r7, [r4, #449]
	str	r7, [r4, #464]
	b	.L193
.L231:
	mov	r10, #0
.L187:
	str	r10, [r4, #464]
	b	.L192
.L186:
	ldr	r3, [fp, #-84]
	mov	r2, r10
	ldr	r1, [r6, #20]
	ldr	r0, [r3, #24]
	bl	memcpy
	b	.L192
.L295:
	ldr	r8, [fp, #-88]
	ldr	r5, [fp, #-96]
	b	.L187
.L215:
	cmp	r5, r0
	cmple	lr, r0
	movlt	r0, #1
	strltb	r0, [ip, r3]
	ldrlt	r0, [r8, #20]
	strltb	r9, [r0, r1]
	b	.L213
.L230:
	mov	r1, #1
	b	.L178
.L165:
	cmp	ip, r2
	cmple	r0, r2
	movlt	r2, #1
	strltb	r2, [r1, r7]
	ldrlt	r2, [r5, #16]
	movlt	r1, #0
	strltb	r1, [r2, r3]
	b	.L163
.L232:
	mov	r0, #1
	b	.L203
.L190:
	cmp	lr, r1
	cmple	ip, r1
	movlt	r1, #1
	strltb	r1, [r0, r3]
	ldrlt	r1, [r5, #24]
	movlt	r0, #0
	strltb	r0, [r1, r2]
	b	.L188
.L294:
	ldr	r8, [fp, #-80]
.L212:
	str	r2, [r4, #460]
.L217:
	ldr	r3, .L299+16
	ldr	r3, [r3, #8]
	str	r3, [r8, #8]
	b	.L218
.L223:
	mov	r3, #4
	str	r3, [fp, #-108]
	str	r3, [fp, #-100]
	b	.L116
.L115:
	sub	r2, r7, #3
	str	r2, [fp, #-96]
	cmp	r2, #4
	bls	.L118
	ldr	r3, [fp, #-88]
	add	r0, r3, #3
	mov	r3, #4
	b	.L120
.L119:
	ldr	r2, [fp, #-96]
	add	r3, r3, #1
	cmp	r3, r2
	beq	.L297
.L120:
	ldrb	r2, [r0, #1]!
	cmp	r2, #1
	bne	.L119
	and	r2, r3, #7
	sub	r1, fp, #44
	add	r2, r1, r2, lsl #2
	ldr	r1, [r2, #-32]
	add	r1, r1, #1
	str	r1, [r2, #-32]
	b	.L119
.L227:
	ldr	r10, [fp, #-100]
	b	.L148
.L293:
	ldr	r7, [fp, #-116]
	ldr	r10, [fp, #-120]
	ldr	r5, [fp, #-124]
.L141:
	cmp	r7, #4
	addls	r4, r8, #8192
	movls	r3, #0
	bls	.L147
	ldr	r3, [fp, #-88]
	mov	ip, #0
	add	r4, r8, #8192
	str	r5, [fp, #-100]
	add	lr, r3, #3
	sub	r3, r7, #1
	str	r3, [fp, #-96]
	mov	r3, #3
	b	.L157
.L153:
	ldr	r1, [r4, #436]
	ldrb	r2, [r1, r3]
	sub	r0, r2, #1
	sxtb	r2, r2
	cmp	r2, #0
	ble	.L156
.L283:
	strb	r0, [r1, r3]
.L155:
	ldr	r2, [fp, #-96]
	add	r3, r3, #1
	cmp	r3, r2
	beq	.L298
.L157:
	ldrb	r2, [lr, #1]!
	cmp	r2, #1
	bne	.L153
	strb	r2, [lr, #-1]
	mov	r1, #0
	strb	r1, [lr]
	add	ip, ip, #1
	ldr	r1, [r4, #436]
	ldrb	r0, [r4, #452]
	ldrb	r2, [r1, r3]
	add	r5, r2, #1
	sxtb	r2, r2
	cmp	r2, r0
	movlt	r2, r5
	strltb	r2, [r1, r3]
	blt	.L155
	b	.L283
.L156:
	mov	r2, #0
	strb	r2, [r1, r3]
	b	.L155
.L282:
	str	r0, [fp, #-104]
	b	.L135
.L297:
	ldr	r3, [fp, #-76]
.L118:
	mov	r4, #0
	sub	r1, fp, #76
	mov	r0, r4
	mov	r2, r4
	b	.L220
.L300:
	.align	2
.L299:
	.word	.LANCHOR0
	.word	.LANCHOR0+4
	.word	.LANCHOR0+20480
	.word	.LANCHOR0+16399
	.word	.LANCHOR0+16384
.L122:
	ldr	r3, [r1, #4]!
.L220:
	cmp	r0, r3
	movcc	r4, r2
	add	r2, r2, #1
	movcc	r0, r3
	cmp	r2, #8
	bne	.L122
	mov	r2, r7
	mov	r1, #0
	ldr	r0, [fp, #-88]
	bl	memset
	cmp	r4, #0
	ldrne	r3, [fp, #-88]
	movne	r1, #1
	moveq	r3, r4
	addne	r2, r3, r4
	add	r4, r4, #7
	movne	r3, r1
	strneb	r1, [r2, #-1]
	ldr	r2, [fp, #-96]
	cmp	r4, r2
	bcs	.L124
	mov	r2, #1
.L125:
	ldr	r1, [fp, #-88]
	add	r3, r3, #1
	strb	r2, [r1, r4]
	add	r4, r4, #8
	ldr	r1, [fp, #-96]
	cmp	r4, r1
	bcc	.L125
.L124:
	add	r4, r8, #8192
	str	r3, [r4, #456]
	b	.L126
.L229:
	mov	lr, #0
.L162:
	str	lr, [r4, #456]
.L167:
	ldr	r3, .L299+16
	ldr	r3, [r3]
	str	r3, [r8, #4]
	b	.L168
.L233:
	mov	r2, #0
	b	.L212
.L211:
	ldr	r3, [fp, #-84]
	mov	r2, r9
	ldr	r1, [r6, #24]
	ldr	r0, [r3, #20]
	bl	memcpy
	b	.L217
.L209:
	ldr	r3, [fp, #-84]
	mov	r2, r9
	ldr	r1, [r5, #24]
	ldr	r0, [r3, #20]
	bl	memcpy
	b	.L217
.L208:
	ldr	r3, [fp, #-84]
	mov	r1, #0
	mov	r5, r1
	mov	r2, r9
	ldr	r0, [r3, #20]
	bl	memset
	str	r5, [r8, #8]
	mvn	r3, #0
	mov	r2, r9
	strb	r3, [r8, #2]
	mov	r1, r5
	ldr	r0, [r4, #444]
	bl	memset
	strb	r5, [r4, #450]
	str	r5, [r4, #460]
	b	.L218
.L113:
	ldr	r3, [fp, #-84]
	add	r4, r8, #8192
	mov	r2, r7
	mov	r1, #0
	ldr	r0, [r3, #16]
	bl	memset
	mov	r3, #0
	mov	r2, r7
	str	r3, [r8, #4]
	mov	r1, #0
	mvn	r3, #0
	strb	r3, [r8]
	ldr	r0, [r4, #436]
	bl	memset
	mov	r3, #0
	strb	r3, [r4, #448]
	mov	r3, #0
	str	r3, [r4, #456]
	b	.L168
.L296:
	ldr	r10, [fp, #-88]
	ldr	r8, [fp, #-96]
	ldr	r5, [fp, #-100]
	b	.L162
.L159:
	ldr	r3, [fp, #-84]
	mov	r2, r7
	ldr	r1, [r6, #16]
	ldr	r0, [r3, #16]
	bl	memcpy
	b	.L167
	UNWIND(.fnend)
	.size	PQ_MNG_ALG_GetDbDetInfo, .-PQ_MNG_ALG_GetDbDetInfo
	.align	2
	.global	PQ_MNG_ALG_DBCfgDetector
	.type	PQ_MNG_ALG_DBCfgDetector, %function
PQ_MNG_ALG_DBCfgDetector:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r5, r0
	ldr	ip, [r1, #8]
	ldr	r0, [r1]
	mov	r4, r2
	ldr	lr, [r1, #4]
	cmp	r0, #4096
	cmple	ip, #4096
	movgt	r2, #1
	movle	r2, #0
	cmp	lr, #2160
	orrgt	r2, r2, #1
	cmp	r2, #0
	bne	.L312
	ldr	r2, [r1, #48]
	cmp	r2, #8
	strneh	r3, [r5, #20]
	beq	.L318
.L304:
	ldr	r3, [r1, #64]
	cmp	r3, #8
	ldrneh	r3, [fp, #4]
	strneh	r3, [r5, #22]
	beq	.L319
.L306:
	movw	r3, #1079
	cmp	lr, r3
	cmple	r0, #1920
	mov	r2, #512
	mov	r3, #1
	add	r0, r5, #36
	strh	r3, [r5, #16]
	strh	r3, [r5, #18]
	mov	r1, #0
	movge	r3, #0
	add	r4, r4, #16
	strgeh	r3, [r5, #16]
	strgeh	r3, [r5, #18]
	bl	memset
	add	ip, r5, #32
	mov	lr, #0
	movw	r5, #3959
.L308:
	cmp	lr, #3968
	ldr	r2, [ip, #4]!
	beq	.L309
	mov	r0, r4
	mov	r3, #1
	ldrb	r1, [r0, lr]!
	and	r1, r1, r3
	orr	r1, r1, r2
	str	r1, [ip]
	b	.L310
.L321:
	ldrb	r2, [r0, #1]!
	and	r2, r2, #1
	orr	r1, r1, r2, asl r3
	add	r3, r3, #1
	cmp	r3, #32
	str	r1, [ip]
	beq	.L320
.L310:
	add	r2, r3, lr
	cmp	r2, r5
	bls	.L321
.L309:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L320:
	add	lr, lr, #32
	b	.L308
.L318:
	cmp	r0, #0
	add	r3, r0, #7
	movge	r3, r0
	mov	r3, r3, asr #3
	strh	r3, [r5, #20]
	b	.L304
.L319:
	add	r3, ip, #7
	cmp	ip, #0
	movlt	ip, r3
	mov	r3, ip, asr #3
	strh	r3, [r5, #22]
	b	.L306
.L312:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	PQ_MNG_ALG_DBCfgDetector, .-PQ_MNG_ALG_DBCfgDetector
	.global	__aeabi_idiv
	.align	2
	.global	PQ_MNG_ALG_UpdateDMCfg
	.type	PQ_MNG_ALG_UpdateDMCfg, %function
PQ_MNG_ALG_UpdateDMCfg:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #64)
	sub	sp, sp, #64
	ldr	lr, .L345
	mov	r5, r0
	mov	r4, r1
	cmp	r0, #0
	sub	ip, fp, #92
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	beq	.L336
	ldr	r6, [r5]
	ldr	r0, [r5, #144]
	cmp	r6, #0
	ldr	r3, [r5, #148]
	bne	.L344
	mov	r0, r6
.L324:
	ldr	r6, .L345+4
	mov	r3, #8
	mov	r2, #4
	strb	r3, [r4, #8]
	strb	r2, [r4, #7]
	strb	r3, [r4, #5]
.L326:
	ldr	r1, .L345+8
	sub	r3, fp, #28
	add	r0, r3, r0, lsl #2
	ldr	r3, [r1, #-4044]
	ldrh	r2, [r0, #-64]
	cmp	r3, #31
	addls	r0, r3, #1
	movhi	r3, #0
	add	r3, r3, #2
	movhi	r0, #1
	str	r0, [r1, #-4044]
	add	r3, r5, r3, lsl #2
	str	r2, [r3, #4]!
	cmp	r3, #0
	str	r3, [r5, #152]
	beq	.L328
	ldr	r1, [r5, #140]
	cmp	r1, #0
	beq	.L329
	movle	r0, #0
	ble	.L331
	mov	r2, #0
	add	lr, r5, #12
	mov	r0, r2
.L334:
	ldr	ip, [r3], #-4
	add	r2, r2, #1
	cmp	r3, lr
	add	r0, r0, ip
	addcc	r3, r5, #136
	cmp	r2, r1
	bne	.L334
.L331:
	bl	__aeabi_idiv
	mov	r1, #1
	uxth	r3, r0
	uxtb	r2, r0
	rsb	ip, r3, #8
	mov	r7, r3, asl #2
	mov	r0, ip, asl #6
	add	r5, r7, r3
	sub	r0, r0, ip, asl #2
	add	r5, ip, r5
	mov	r3, r3, lsr r1
	adds	ip, r0, #4
.L342:
	addmi	ip, r0, #11
	adds	lr, r7, #4
	addmi	lr, r7, #11
	mov	r1, r1, asl r3
	adds	r0, r5, #4
	rsb	r3, r3, #4
	addmi	r0, r5, #11
	cmp	r3, #2
	ubfx	ip, ip, #3, #8
	ubfx	lr, lr, #3, #8
	ubfx	r0, r0, #3, #8
	uxtb	r1, r1
	strb	ip, [r4]
	movle	r3, #2
	strb	lr, [r4, #2]
	strb	r0, [r4, #3]
	strb	r1, [r4, #1]
	ble	.L335
	cmp	r3, #4
	movge	r3, #4
	uxtb	r3, r3
.L335:
	mov	r0, #0
	strb	r3, [r4, #4]
	strb	r2, [r4, #6]
	str	r6, [r4, #12]
.L341:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L344:
	mul	r0, r3, r0
	mov	r1, r6
	mov	r0, r0, asl #4
	bl	__aeabi_idiv
	cmp	r6, #720
	usat	r0, #4, r0
	bls	.L324
	mov	r3, #12
	mov	r2, #0
	strb	r3, [r4, #8]
	mov	r3, #10
	ldr	r6, .L345+12
	strb	r2, [r4, #7]
	strb	r3, [r4, #5]
	b	.L326
.L329:
	rsb	r0, r2, #8
	mov	r7, r2, asl #2
	add	r5, r7, r2
	mov	r3, r2, lsr #1
	mov	r1, r0, asl #6
	add	r5, r0, r5
	sub	r0, r1, r0, asl #2
	uxtb	r2, r2
	adds	ip, r0, #4
	mov	r1, #1
	b	.L342
.L328:
	mov	r2, #68
	strb	r3, [r4, #2]
	strb	r3, [r4, #1]
	mov	r3, #1
	strb	r2, [r4]
	mov	r2, #255
	strb	r3, [r4, #3]
	mov	r3, #2
	b	.L335
.L336:
	mvn	r0, #0
	b	.L341
.L346:
	.align	2
.L345:
	.word	.LANCHOR2
	.word	.LANCHOR1
	.word	.LANCHOR3
	.word	.LANCHOR1+16
	UNWIND(.fnend)
	.size	PQ_MNG_ALG_UpdateDMCfg, .-PQ_MNG_ALG_UpdateDMCfg
	.global	DM_DIR_STR_LUT_HD
	.global	DM_DIR_STR_LUT
	.section	.rodata
	.align	2
.LANCHOR2 = . + 0
.LC0:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	5
	.word	6
	.word	6
	.word	7
	.word	8
	.word	8
	.word	8
	.word	8
	.word	8
	.word	8
	.data
	.align	2
.LANCHOR1 = . + 0
	.type	DM_DIR_STR_LUT, %object
	.size	DM_DIR_STR_LUT, 16
DM_DIR_STR_LUT:
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	6
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	DM_DIR_STR_LUT_HD, %object
	.size	DM_DIR_STR_LUT_HD, 16
DM_DIR_STR_LUT_HD:
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	6
	.byte	4
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.bss
	.align	2
.LANCHOR0 = . + 0
.LANCHOR3 = . + 24552
	.type	stDetStaticInfo, %object
	.size	stDetStaticInfo, 20508
stDetStaticInfo:
	.space	20508
	.type	i.4623, %object
	.size	i.4623, 4
i.4623:
	.space	4
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
