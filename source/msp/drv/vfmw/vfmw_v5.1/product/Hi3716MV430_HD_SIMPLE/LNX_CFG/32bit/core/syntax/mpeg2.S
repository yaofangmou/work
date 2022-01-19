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
	.file	"mpeg2.c"
	.text
	.align	2
	.type	MP2_SearchStartCode.part.1, %function
MP2_SearchStartCode.part.1:
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
	add	r3, r0, #2
	add	ip, r0, r1
.L12:
	cmp	ip, r3
	bls	.L2
.L15:
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	bls	.L14
.L8:
	add	r3, r3, #3
	cmp	ip, r3
	bhi	.L15
.L2:
	sub	r0, r1, #3
	ldmfd	sp, {fp, sp, pc}
.L14:
	cmp	r2, #0
	bne	.L5
	ldrb	r2, [r3, #-1]	@ zero_extendqisi2
	cmp	r2, #0
	addeq	r3, r3, #1
	beq	.L12
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	cmp	r2, #0
	addeq	r3, r3, #2
	addne	r3, r3, #4
	b	.L12
.L5:
	cmp	r2, #1
	bne	.L12
	ldrb	r2, [r3, #-2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L8
	ldrb	r2, [r3, #-1]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L8
	rsb	r3, r0, r3
	sub	r0, r3, #2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MP2_SearchStartCode.part.1, .-MP2_SearchStartCode.part.1
	.align	2
	.global	MP2_ArrangeVHBMem
	.type	MP2_ArrangeVHBMem, %function
MP2_ArrangeVHBMem:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #44)
	sub	sp, sp, #44
	add	r6, r0, #81920
	ldr	r3, .L25
	mov	r4, r0
	ldr	r5, [r6, #48]
	mov	r2, #36
	mov	r1, #0
	sub	r0, fp, #72
	ldr	r3, [r3, #48]
	mov	r7, #3
	blx	r3
	ldr	ip, [r5, #52]
	ldr	lr, [r5, #48]
	sub	r1, fp, #72
	ldr	r3, [r4, #28]
	mov	r2, #0
	str	ip, [fp, #-52]
	mov	r5, #8
	str	lr, [fp, #-56]
	ldr	r8, [r3, #16]
	str	ip, [fp, #-60]
	cmp	r8, #24
	ldr	r0, [r4]
	str	lr, [fp, #-64]
	movne	ip, r7
	moveq	ip, #1
	str	ip, [fp, #-48]
	ldr	r3, [r3, #16]
	str	r7, [fp, #-72]
	cmp	r3, #24
	strb	r5, [fp, #-67]
	movne	r3, #2
	moveq	r3, #1
	str	r3, [fp, #-44]
	bl	FSP_ArrangeFsPool
	cmp	r0, #2
	beq	.L24
	cmp	r0, #0
	moveq	r0, #1
	beq	.L20
	ldr	r3, .L25+4
	mov	r1, #186
	ldr	r2, .L25+8
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #0
.L20:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L24:
	add	r0, r6, #56
	bl	ResetVoQueue
	mov	r0, #0
	b	.L20
.L26:
	.align	2
.L25:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC0
	UNWIND(.fnend)
	.size	MP2_ArrangeVHBMem, .-MP2_ArrangeVHBMem
	.align	2
	.global	MP2_DecodingDecide
	.type	MP2_DecodingDecide, %function
MP2_DecodingDecide:
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
	UNWIND(.pad #28)
	sub	sp, sp, #28
	add	r4, r0, #77824
	add	r7, r0, #81920
	mov	r5, r0
	ldr	r2, [r4, #2900]
	ldr	r8, [r7, #48]
	tst	r2, #8388608
	mvneq	r6, #0
	bne	.L102
.L28:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L102:
	ldrb	r3, [r8, #9]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L29
	ldr	r3, [r4, #2912]
	cmp	r3, #1
	beq	.L29
	ands	r6, r2, #255
	beq	.L31
.L105:
	ldr	r3, .L119
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L32
	mov	r3, #0
	ldr	r0, [r5]
	mov	r2, r3
	mov	r1, #22
	blx	r6
	ldr	r2, [r4, #2900]
.L32:
	ldr	r3, [r4, #2908]
	movw	r1, #485
	str	r2, [sp]
	mov	r0, #20
	ldr	r2, .L119+4
	mov	r6, #0
	bl	dprint_normal
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L31:
	ldr	r3, [r4, #2948]
	cmp	r3, #0
	beq	.L103
	ldr	r3, [r4, #2888]
	sub	r3, r3, #2
	cmp	r3, #1
	ldr	r3, [r5, #28]
	ldr	r3, [r3, #8]
	bls	.L104
.L35:
	sub	r2, r3, #1
	str	r3, [r4, #2888]
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L38
.L40:
	.word	.L39
	.word	.L41
	.word	.L42
	.word	.L43
.L29:
	ldr	r3, [r5, #4]
	ands	r6, r2, #255
	add	r3, r3, #1
	str	r3, [r5, #4]
	beq	.L31
	b	.L105
.L43:
	ldrb	r3, [r8, #22]	@ zero_extendqisi2
	cmp	r3, #1
	mov	r10, r3
	beq	.L106
	cmp	r3, #3
	beq	.L107
.L49:
	cmp	r3, #2
	beq	.L53
	mov	r10, r3
.L100:
	ldrb	r9, [r8, #9]	@ zero_extendqisi2
	mov	r3, #1
	str	r3, [fp, #-52]
.L44:
	ldr	r3, [r4, #2908]
	add	r0, r7, #408
	ldr	ip, [r4, #2952]
	ldr	r1, [r4, #2848]
	str	r3, [fp, #-48]
	add	r7, ip, r1
	bl	BsPos
	ldr	r3, [fp, #-48]
	mov	r1, #580
	str	r9, [sp, #4]
	str	r10, [sp]
	ldr	r2, .L119+8
	add	r7, r7, r0, lsr #3
	mov	r0, #16
	str	r7, [sp, #8]
	bl	dprint_normal
	ldr	r3, [r4, #2900]
	bic	r3, r3, #14155776
	str	r3, [r4, #2900]
	ldr	r3, [r5, #28]
	ldr	r0, [r3, #600]
	ldr	r3, [r4, #2940]
	cmp	r0, #1
	beq	.L108
	cmp	r3, #0
	bne	.L57
	ldrb	r2, [r8, #22]	@ zero_extendqisi2
	sub	r1, r2, #2
	cmp	r1, #1
	bls	.L109
.L58:
	cmp	r2, #3
	beq	.L110
.L55:
	ldr	r1, [r4, #2976]
	ldr	r0, [r5]
	bl	FSP_GetFsImagePtr
	ldr	r1, [r4, #2980]
	mov	r7, r0
	ldr	r0, [r5]
	bl	FSP_GetFsImagePtr
	clz	r3, r7
	mov	r3, r3, lsr #5
	clz	r2, r0
	mov	r2, r2, lsr #5
	orrs	r1, r2, r3
	bne	.L111
	ldrb	r1, [r8, #22]	@ zero_extendqisi2
	cmp	r1, #2
	beq	.L112
	cmp	r1, #3
	beq	.L113
.L63:
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	movne	r6, #1
	bne	.L28
	ldrb	r3, [r8, #9]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L69
	ldr	r3, [r4, #2912]
	cmp	r3, #0
	bne	.L28
.L69:
	ldrb	r3, [r8, #27]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L114
	ldrb	r3, [r8, #18]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L115
	ldr	r3, [r4, #3064]
	add	r3, r3, #1
	str	r3, [r4, #3064]
	mov	r3, r3, asl #1
	str	r3, [r4, #3060]
.L71:
	ldr	r2, [r4, #3056]
	ldr	r3, [r4, #2908]
	add	r2, r2, #1
	str	r2, [r4, #3056]
	add	r3, r3, #1
	str	r3, [r4, #2908]
	b	.L28
.L42:
	mov	r3, #0
	ldrb	r10, [r8, #22]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldrb	r9, [r8, #9]	@ zero_extendqisi2
	b	.L44
.L41:
	ldrb	r10, [r8, #22]	@ zero_extendqisi2
	sub	r3, r10, #2
	cmp	r3, #1
	bhi	.L100
	cmp	r10, #2
	beq	.L116
.L47:
	ldrb	r9, [r8, #9]	@ zero_extendqisi2
	cmp	r9, #3
	beq	.L117
.L50:
	ldr	r3, [r4, #2912]
	mov	r2, #0
	str	r2, [fp, #-52]
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r4, #2912]
	ldrb	r10, [r8, #22]	@ zero_extendqisi2
	ldrb	r9, [r8, #9]	@ zero_extendqisi2
	b	.L44
.L39:
	ldrb	r10, [r8, #22]	@ zero_extendqisi2
	cmp	r10, #3
	bne	.L100
	ldrb	r10, [r8, #9]	@ zero_extendqisi2
	cmp	r10, #3
	bne	.L50
	mov	r3, #0
	mov	r9, r10
	str	r3, [fp, #-52]
	b	.L44
.L57:
	cmp	r3, #1
	bhi	.L55
	ldrb	r2, [r8, #22]	@ zero_extendqisi2
	b	.L58
.L108:
	cmp	r3, #0
	bne	.L55
	ldrb	r2, [r8, #22]	@ zero_extendqisi2
	cmp	r2, #3
	beq	.L118
	cmp	r2, #2
	bne	.L55
	ldr	r2, .L119+12
	movw	r1, #595
	bl	dprint_normal
	b	.L55
.L104:
	cmp	r3, #4
	cmpne	r3, #1
	bhi	.L35
	ldr	r2, .L119+16
	movw	r1, #498
	mov	r0, #3
	bl	dprint_normal
	ldrb	r3, [r8, #22]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L97
	ldr	r3, [r4, #2900]
	ldr	r1, [r4, #2980]
	orr	r3, r3, #128
	str	r3, [r4, #2900]
	ldr	r0, [r5]
	bl	FSP_GetFsImagePtr
	subs	r9, r0, #0
	beq	.L37
	ldr	r1, [r9, #168]
	ldr	r0, [r5]
	bl	FreeUsdByDec
	ldr	r1, [r9, #176]
	ldr	r0, [r5]
	bl	FreeUsdByDec
	ldr	r1, [r9, #184]
	ldr	r0, [r5]
	bl	FreeUsdByDec
	ldr	r1, [r9, #192]
	ldr	r0, [r5]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r9, #168]
	strd	r2, [r9, #176]
	strd	r2, [r9, #184]
	strd	r2, [r9, #192]
	ldr	r1, [r4, #2980]
	ldr	r0, [r5]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #2976]
	ldr	r0, [r5]
	bl	FSP_ClearLogicFs
	str	r6, [r4, #2976]
	str	r6, [r4, #2980]
.L37:
	mov	r3, #0
	str	r3, [r4, #2940]
.L97:
	ldr	r3, [r5, #28]
	ldr	r3, [r3, #8]
	b	.L35
.L103:
	ldr	r3, [r4, #2908]
	movw	r1, #490
	ldr	r2, .L119+20
	mov	r0, #1
	bl	dprint_normal
	b	.L28
.L112:
	cmp	r3, #0
	bne	.L61
	ldr	r2, [r5, #28]
	ldr	r3, [r7, #96]
	ldr	r2, [r2]
	cmp	r3, r2
	bls	.L63
	str	r2, [sp]
	movw	r1, #631
	ldr	r2, .L119+24
	mov	r0, #1
	bl	dprint_normal
	b	.L28
.L111:
	mov	r1, #616
	ldr	r3, .L119+28
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L119+32
	bl	dprint_normal
	b	.L28
.L38:
	mov	r3, #1
	ldrb	r10, [r8, #22]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldrb	r9, [r8, #9]	@ zero_extendqisi2
	b	.L44
.L113:
	cmp	r3, #0
	ldrne	r2, [r5, #28]
	ldrne	r3, [r7, #96]
	ldrne	r1, [r2]
	bne	.L65
	ldr	r1, [r5, #28]
	ldr	r3, [r7, #96]
	ldr	r1, [r1]
	cmp	r3, r1
	bhi	.L65
	cmp	r2, #0
	ldr	r3, [r0, #96]
	bne	.L68
	cmp	r1, r3
	bcs	.L63
.L68:
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L119+36
	movw	r1, #646
	bl	dprint_normal
	b	.L28
.L114:
	ldrb	r2, [r8, #16]	@ zero_extendqisi2
	ldrb	r3, [r8, #10]	@ zero_extendqisi2
	ldr	r1, [r4, #3064]
	add	r3, r2, r3
	add	r3, r3, #1
	add	r3, r3, r1
	str	r3, [r4, #3064]
	mov	r3, r3, asl #1
	str	r3, [r4, #3060]
	b	.L71
.L65:
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L119+40
	mov	r1, #640
	bl	dprint_normal
	b	.L28
.L107:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	bne	.L100
.L52:
	ldrb	r9, [r8, #9]	@ zero_extendqisi2
	cmp	r9, #3
	bne	.L50
	mov	r3, #0
	mov	r10, r9
	str	r3, [fp, #-52]
	b	.L44
.L106:
	mov	r3, #0
	str	r3, [r5, #12]
	ldrb	r3, [r8, #22]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L49
	b	.L52
.L115:
	ldr	r2, [r4, #3064]
	ldr	r3, [r4, #3060]
	add	r2, r2, #1
	str	r2, [r4, #3064]
	ldrb	r2, [r8, #16]	@ zero_extendqisi2
	add	r2, r2, #2
	add	r3, r3, r2
	str	r3, [r4, #3060]
	b	.L71
.L53:
	mov	r9, #1
	str	r9, [r5, #12]
	str	r9, [fp, #-52]
	ldrb	r10, [r8, #22]	@ zero_extendqisi2
	ldrb	r9, [r8, #9]	@ zero_extendqisi2
	b	.L44
.L109:
	ldr	r2, .L119+44
	movw	r1, #601
	mov	r0, #1
	str	r3, [fp, #-52]
	bl	dprint_normal
	b	.L55
.L110:
	ldr	r2, .L119+48
	movw	r1, #607
	mov	r0, #1
	mov	r3, #0
	str	r3, [fp, #-52]
	bl	dprint_normal
	b	.L55
.L118:
	ldr	r2, .L119+52
	movw	r1, #589
	str	r3, [fp, #-52]
	bl	dprint_normal
	b	.L55
.L61:
	movw	r1, #626
	ldr	r3, .L119+28
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L119+56
	bl	dprint_normal
	b	.L28
.L116:
	add	r3, r5, #45056
	ldrb	r2, [r3, #281]	@ zero_extendqisi2
	cmp	r2, #3
	beq	.L47
	ldrb	r9, [r3, #280]	@ zero_extendqisi2
	cmp	r9, #1
	streq	r9, [fp, #-52]
	ldreqb	r9, [r8, #9]	@ zero_extendqisi2
	bne	.L47
	b	.L44
.L117:
	mov	r3, #0
	str	r3, [fp, #-52]
	b	.L44
.L120:
	.align	2
.L119:
	.word	g_EventReportFunc
	.word	.LC1
	.word	.LC4
	.word	.LC6
	.word	.LC3
	.word	.LC2
	.word	.LC11
	.word	.LANCHOR0+20
	.word	.LC9
	.word	.LC13
	.word	.LC12
	.word	.LC7
	.word	.LC8
	.word	.LC5
	.word	.LC10
	UNWIND(.fnend)
	.size	MP2_DecodingDecide, .-MP2_DecodingDecide
	.align	2
	.global	MP2_GetSequenceInfo
	.type	MP2_GetSequenceInfo, %function
MP2_GetSequenceInfo:
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
	UNWIND(.pad #60)
	sub	sp, sp, #60
	add	r4, r0, #77824
	add	r8, r0, #81920
	mov	r2, #0
	ldr	r3, [r4, #2936]
	mov	r5, r0
	ldr	r6, [r8, #48]
	cmp	r3, #1
	ldr	r9, [r8, #52]
	str	r2, [fp, #-64]
	str	r2, [fp, #-60]
	str	r2, [fp, #-56]
	beq	.L123
	cmp	r3, #2
	bne	.L181
	ldr	r2, [r4, #2900]
	and	r2, r2, #1769472
	cmp	r2, #589824
	beq	.L126
.L125:
	ldr	r2, .L188
	mov	r1, #948
	mov	r0, #15
	bl	dprint_normal
	ldr	r3, [r4, #2936]
	cmp	r3, #1
	beq	.L182
.L128:
	ldr	r3, [r6, #48]
	add	r3, r3, #15
	mov	r3, r3, lsr #4
	str	r3, [r6, #56]
	ldr	r2, [r4, #2936]
	cmp	r2, #2
	beq	.L183
.L129:
	ldr	r1, [r6, #52]
	add	r2, r1, #15
	mov	r2, r2, lsr #4
.L130:
	mov	r0, #0
	str	r2, [r6, #60]
	str	r0, [r6, #64]
	ldr	r0, [r4, #2936]
	cmp	r0, #2
	beq	.L184
.L131:
	ldr	r1, [r4, #2948]
	cmp	r1, #0
	beq	.L132
	ldr	r0, [r9, #56]
	cmp	r3, r0
	beq	.L185
.L132:
	ldr	r0, [r5]
	mov	r10, #100
	ldr	r7, .L188+4
	mla	r3, r10, r0, r7
	ldr	r2, [r3, #64]
	cmp	r2, #0
	beq	.L186
.L134:
	ldr	r1, [r4, #2980]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L135
	ldr	r1, [r7, #168]
	ldr	r0, [r5]
	bl	FreeUsdByDec
	ldr	r1, [r7, #176]
	ldr	r0, [r5]
	bl	FreeUsdByDec
	ldr	r1, [r7, #184]
	ldr	r0, [r5]
	bl	FreeUsdByDec
	ldr	r1, [r7, #192]
	ldr	r0, [r5]
	bl	FreeUsdByDec
	mov	r3, #0
	mov	r2, #0
	strd	r2, [r7, #168]
	strd	r2, [r7, #176]
	strd	r2, [r7, #184]
	strd	r2, [r7, #192]
	ldr	r1, [r4, #2980]
	ldr	r0, [r5]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #2976]
	ldr	r0, [r5]
	bl	FSP_ClearLogicFs
	mov	r3, #0
	str	r3, [r4, #2976]
	str	r3, [r4, #2980]
.L135:
	mov	r7, #0
	add	r1, r8, #56
	str	r7, [r4, #2940]
	ldr	r0, [r5]
	bl	FSP_ClearNotInVoQueue
	ldr	r3, [r4, #2948]
	cmp	r3, r7
	beq	.L136
	ldr	r3, [r9, #56]
	cmp	r3, r7
	beq	.L136
	ldr	r3, [r9, #60]
	cmp	r3, r7
	strne	r7, [r4, #2948]
.L136:
	sub	r3, fp, #56
	sub	r2, fp, #60
	sub	r1, fp, #64
	ldr	r0, [r5]
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r5, #28]
	ldr	r3, [r3, #696]
	cmp	r3, #1
	bne	.L178
	ldr	r2, [fp, #-56]
	cmp	r2, #0
	ble	.L187
.L139:
	mov	r3, #1
	strb	r3, [r5, #17]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L181:
	ldr	r3, [r4, #2900]
	tst	r3, #3538944
	beq	.L126
	tst	r3, #131072
	mov	r2, #2
	orreq	r3, r3, r2
	streq	r3, [r4, #2900]
	tst	r3, #1048576
	str	r2, [r4, #2936]
	orreq	r2, r3, #16
	streq	r2, [r4, #2900]
	moveq	r3, #2
	movne	r3, #2
	b	.L125
.L126:
	mov	r3, #1
	str	r3, [r4, #2936]
	b	.L125
.L178:
	ldr	r7, .L188+8
.L138:
	mov	r3, #0
	mov	r0, r5
	strb	r3, [r5, #17]
	mov	r1, r3
	str	r3, [r4, #2948]
	str	r3, [r4, #2964]
	bl	MP2_ArrangeVHBMem
	ldr	r2, .L188+12
	mov	r1, #1020
	str	r0, [r4, #2948]
	mov	r0, #1
	ldr	ip, [r6, #60]
	ldr	r3, [r6, #56]
	mov	ip, ip, asl #4
	str	ip, [sp]
	mov	r3, r3, asl #4
	bl	dprint_normal
	ldr	r7, [r7]
	cmp	r7, #0
	beq	.L179
	ldr	r1, [r9, #60]
	mov	r3, #8
	ldr	r8, [r9, #56]
	sub	r2, fp, #52
	ldr	lr, [r6, #56]
	ldr	ip, [r6, #60]
	strh	r1, [fp, #-50]	@ movhi
	mov	r1, #1
	ldr	r0, [r5]
	strh	r8, [fp, #-52]	@ movhi
	strh	lr, [fp, #-48]	@ movhi
	strh	ip, [fp, #-46]	@ movhi
	blx	r7
.L179:
	ldr	r1, [r4, #2948]
.L133:
	str	r1, [r4, #2896]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L123:
	ldr	r2, [r4, #2900]
	mov	r1, #18
	bfi	r1, r1, #16, #16
	and	r2, r2, r1
	cmp	r2, #1179648
	moveq	r3, #2
	streq	r3, [r4, #2936]
	b	.L125
.L184:
	ldrb	r0, [r6, #27]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L131
	add	r0, r1, #31
	add	r1, r1, #15
	mov	r0, r0, lsr #5
	mov	r1, r1, lsr #4
	rsb	r1, r1, r0, lsl #1
	str	r1, [r6, #64]
	b	.L131
.L183:
	ldrb	r2, [r6, #27]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L129
	ldr	r1, [r6, #52]
	add	r2, r1, #31
	mov	r2, r2, lsr #5
	mov	r2, r2, asl #1
	b	.L130
.L182:
	strb	r3, [r6, #27]
	mov	r1, #3
	strb	r3, [r6, #18]
	mov	r2, #5
	strb	r3, [r6, #11]
	strb	r3, [r6, #28]
	mov	r3, #0
	strb	r1, [r6, #9]
	str	r2, [r6, #144]
	strb	r3, [r6, #12]
	strb	r3, [r6, #13]
	strb	r3, [r6, #14]
	strb	r3, [r6, #15]
	strb	r3, [r6, #8]
	b	.L128
.L186:
	ldr	r2, .L188+16
	mov	r1, #1
	str	r1, [r3, #64]
	ldr	r3, [r5]
	ldr	r2, [r2]
	str	r3, [fp, #-72]
	blx	r2
	ldr	r3, [fp, #-72]
	mla	r7, r10, r3, r7
	str	r0, [r7, #68]
	ldr	r0, [r5]
	b	.L134
.L187:
	ldr	r2, [fp, #-60]
	cmp	r2, #32
	bgt	.L139
	ldr	r8, [r5, #32]
	cmp	r8, #0
	bne	.L139
	ldr	r2, [r5, #4]
	cmp	r2, #0
	beq	.L178
	ldr	r1, [r6, #56]
	cmp	r1, #0
	beq	.L178
	ldr	r0, [r6, #60]
	ldr	ip, [r5, #24]
	cmp	r0, ip
	beq	.L178
	ldr	lr, [r5, #20]
	cmp	r1, lr
	beq	.L178
	str	r0, [sp, #16]
	mov	r0, r3
	str	r1, [sp, #12]
	movw	r1, #1007
	stmia	sp, {r2, lr}
	str	ip, [sp, #8]
	ldr	r2, .L188+20
	ldr	r7, .L188+8
	bl	dprint_normal
	ldr	r3, [r6, #60]
	ldr	r10, [r7]
	str	r3, [r5, #24]
	ldr	r3, [r6, #56]
	cmp	r10, #0
	str	r3, [r5, #20]
	beq	.L138
	mov	r3, r8
	mov	r2, r8
	mov	r1, #48
	ldr	r0, [r5]
	blx	r10
	b	.L138
.L185:
	ldr	r3, [r9, #60]
	cmp	r2, r3
	bne	.L132
	b	.L133
.L189:
	.align	2
.L188:
	.word	.LC14
	.word	g_VfmwChanStat
	.word	g_EventReportFunc
	.word	.LC16
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC15
	UNWIND(.fnend)
	.size	MP2_GetSequenceInfo, .-MP2_GetSequenceInfo
	.global	__aeabi_idiv
	.align	2
	.global	MP2_CalcRealEncFrameRate
	.type	MP2_CalcRealEncFrameRate, %function
MP2_CalcRealEncFrameRate:
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
	add	r3, r0, #81920
	add	r4, r0, #77824
	ldr	r3, [r3, #48]
	ldr	r5, [r4, #3040]
	ldr	lr, [r4, #3052]
	ldrb	r2, [r3, #22]	@ zero_extendqisi2
	ldr	ip, [r3, #72]
	cmp	r2, #1
	ldr	r1, [r4, #3048]
	ldr	r2, [r4, #3036]
	ldr	r6, [r4, #3032]
	ldr	r0, [r4, #3044]
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	cmp	ip, #0
	add	r0, r6, r0
	add	r1, r2, r1
	movgt	r2, #1
	movle	r2, #0
	cmp	r0, #0
	andgt	r2, r2, #1
	movle	r2, #0
	cmp	r1, #0
	andgt	r2, r2, #1
	movle	r2, #0
	cmp	r2, #0
	streq	r2, [r4, #3068]
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r3, [r3, #27]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r0, r0, asl #1
	addeq	r1, r5, lr
	mul	r0, ip, r0
	bl	__aeabi_idiv
	movw	r2, #26215
	movt	r2, 26214
	mov	r3, r0, asr #31
	smull	r0, r1, r0, r2
	rsb	r3, r3, r1, asr #2
	str	r3, [r4, #3068]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MP2_CalcRealEncFrameRate, .-MP2_CalcRealEncFrameRate
	.align	2
	.global	MP2_CalcDar
	.type	MP2_CalcDar, %function
MP2_CalcDar:
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
	add	r0, r0, #81920
	ldr	r3, [r0, #48]
	ldr	r3, [r3, #84]
	sub	r3, r3, #1
	cmp	r3, #2
	ldrls	r2, .L198
	addls	r3, r2, r3, lsl #2
	ldrls	r0, [r3, #40]
	movhi	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L199:
	.align	2
.L198:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	MP2_CalcDar, .-MP2_CalcDar
	.align	2
	.global	MP2_SetImgFormat
	.type	MP2_SetImgFormat, %function
MP2_SetImgFormat:
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
	add	r9, r0, #77824
	add	r6, r0, #81920
	mov	r7, r0
	ldr	r1, [r9, #2984]
	ldr	r0, [r0]
	ldr	r5, [r6, #48]
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	beq	.L200
	ldrb	r8, [r5, #22]	@ zero_extendqisi2
	ldrb	r3, [r5, #27]	@ zero_extendqisi2
	cmp	r8, #4
	ldr	r2, [r5, #128]
	subne	r8, r8, #1
	ldrb	ip, [r4, #157]	@ zero_extendqisi2
	andne	r0, r8, #3
	moveq	r0, #0
	moveq	r10, r0
	moveq	r8, r0
	uxtbne	r10, r0
	cmp	r3, #0
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	ubfx	ip, ip, #2, #2
	str	r2, [fp, #-48]
	moveq	r2, #1
	orr	ip, r3, ip
	movne	r2, #0
	movne	r3, #1
	strne	r3, [fp, #-52]
	beq	.L215
.L203:
	ldr	r3, [r6, #48]
	ldr	r3, [r3, #84]
	str	r0, [r4, #24]
	sub	r3, r3, #1
	str	r0, [r4, #28]
	cmp	r3, #2
	mov	r0, r4
	ldrls	r1, .L217
	movhi	r1, #0
	movhi	lr, r1
	addls	r3, r1, r3, lsl #2
	ldrls	r1, [r3, #40]
	ldrb	r3, [r4, #157]	@ zero_extendqisi2
	andls	lr, r1, #7
	bfi	r3, r2, #0, #2
	ldrb	r2, [r4, #156]	@ zero_extendqisi2
	bfi	r3, ip, #2, #2
	ldr	ip, [fp, #-48]
	bfi	r2, r10, #0, #2
	and	r2, r2, #227
	bfi	r2, ip, #5, #3
	strb	r2, [r4, #156]
	ldr	r2, [fp, #-52]
	bfi	r3, r2, #4, #2
	strb	r3, [r4, #157]
	ldr	r3, [r4, #156]
	bfi	r3, lr, #14, #3
	str	r3, [r4, #156]
	bl	SetAspectRatio
	ldr	r1, [r5, #72]
	ldr	r2, [r4, #32]
	mov	r0, r7
	ldr	r3, [r4, #36]
	str	r1, [r4, #64]
	mov	r2, r2, lsr #1
	str	r2, [r4, #48]
	mov	r3, r3, lsr #1
	str	r3, [r4, #52]
	ldrb	r3, [r5, #27]	@ zero_extendqisi2
	str	r3, [r4, #500]
	ldrb	r3, [r5, #18]	@ zero_extendqisi2
	str	r3, [r4, #504]
	ldr	r3, [r5, #144]
	str	r3, [r4, #512]
	bl	MP2_CalcRealEncFrameRate
	ldr	r3, [r9, #3068]
	cmp	r8, #0
	str	r3, [r4, #508]
	ldreq	r3, [r5, #188]
	ldrne	r3, [r6, #440]
	streq	r3, [r6, #440]
	ldreq	r2, [r5, #192]
	streq	r2, [r6, #444]
	str	r3, [r4, #528]
	mov	r3, #0
	ldr	r2, [r6, #444]
	str	r2, [r4, #532]
	str	r3, [r5, #188]
	str	r3, [r5, #192]
.L200:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L215:
	cmp	r3, #3
	beq	.L216
	ldr	r1, [r9, #2912]
	cmp	r1, #0
	bne	.L205
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [fp, #-52]
	b	.L203
.L205:
	subs	r3, r3, #1
	movne	r3, #1
	str	r3, [fp, #-52]
	b	.L203
.L216:
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	and	r3, r3, #1
	str	r3, [fp, #-52]
	b	.L203
.L218:
	.align	2
.L217:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	MP2_SetImgFormat, .-MP2_SetImgFormat
	.align	2
	.global	MP2_SearchStartCode
	.type	MP2_SearchStartCode, %function
MP2_SearchStartCode:
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
	cmp	r1, #4
	ble	.L220
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MP2_SearchStartCode.part.1
.L220:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MP2_SearchStartCode, .-MP2_SearchStartCode
	.align	2
	.global	MP2_ProtocolPPSCheck
	.type	MP2_ProtocolPPSCheck, %function
MP2_ProtocolPPSCheck:
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
	add	r4, r0, #77824
	add	r2, r0, #81920
	mov	r5, r0
	ldr	r3, [r4, #2936]
	ldr	r1, [r2, #48]
	cmp	r3, #1
	beq	.L223
	cmp	r3, #2
	beq	.L224
	ldr	r3, [r4, #2900]
	orr	r3, r3, #63
	str	r3, [r4, #2900]
	ldrb	r2, [r1, #22]	@ zero_extendqisi2
.L230:
	tst	r3, #24
	beq	.L232
.L245:
	cmp	r2, #3
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L233:
	orr	r3, r3, #64
	ldr	r1, [r4, #2980]
	str	r3, [r4, #2900]
	ldr	r0, [r5]
	bl	FSP_GetFsImagePtr
	subs	r6, r0, #0
	beq	.L235
	ldr	r1, [r6, #168]
	ldr	r0, [r5]
	bl	FreeUsdByDec
	ldr	r1, [r6, #176]
	ldr	r0, [r5]
	bl	FreeUsdByDec
	ldr	r1, [r6, #184]
	ldr	r0, [r5]
	bl	FreeUsdByDec
	ldr	r1, [r6, #192]
	ldr	r0, [r5]
	bl	FreeUsdByDec
	mov	r3, #0
	mov	r2, #0
	strd	r2, [r6, #168]
	strd	r2, [r6, #176]
	strd	r2, [r6, #184]
	strd	r2, [r6, #192]
	ldr	r1, [r4, #2980]
	ldr	r0, [r5]
	bl	FSP_ClearLogicFs
	ldr	r0, [r5]
	ldr	r1, [r4, #2976]
	bl	FSP_ClearLogicFs
	mov	r3, #0
	str	r3, [r4, #2976]
	str	r3, [r4, #2980]
.L235:
	mov	r3, #0
	str	r3, [r4, #2940]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L224:
	ldr	r3, [r4, #2900]
	tst	r3, #1048576
	orreq	r3, r3, #16
	streq	r3, [r4, #2900]
	ldrb	r2, [r1, #22]	@ zero_extendqisi2
	sub	r0, r2, #1
	cmp	r0, #2
	bls	.L230
.L243:
	orr	r3, r3, #8
	str	r3, [r4, #2900]
	tst	r3, #24
	ldrb	r2, [r1, #22]	@ zero_extendqisi2
	bne	.L245
.L232:
	cmp	r2, #1
	biceq	r3, r3, #192
	streq	r3, [r4, #2900]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L223:
	ldrb	r2, [r1, #22]	@ zero_extendqisi2
	sub	r3, r2, #1
	cmp	r3, #3
	ldr	r3, [r4, #2900]
	orrhi	r3, r3, #8
	strhi	r3, [r4, #2900]
	ldrhib	r2, [r1, #22]	@ zero_extendqisi2
	sub	r0, r2, #2
	cmp	r0, #1
	bls	.L246
.L227:
	cmp	r2, #3
	beq	.L247
	tst	r3, #24
	bne	.L233
	b	.L232
.L247:
	ldrb	r2, [r1, #26]	@ zero_extendqisi2
	cmp	r2, #0
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	b	.L243
.L246:
	ldrb	r0, [r1, #24]	@ zero_extendqisi2
	cmp	r0, #0
	orreq	r3, r3, #8
	streq	r3, [r4, #2900]
	ldreqb	r2, [r1, #22]	@ zero_extendqisi2
	b	.L227
	UNWIND(.fnend)
	.size	MP2_ProtocolPPSCheck, .-MP2_ProtocolPPSCheck
	.align	2
	.global	MP2_GetImageBuffer
	.type	MP2_GetImageBuffer, %function
MP2_GetImageBuffer:
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
	mov	r1, #0
	mov	r4, r0
	ldr	r0, [r0]
	add	r6, r4, #77824
	bl	FSP_NewLogicFs
	cmp	r0, #0
	str	r0, [r6, #2984]
	blt	.L256
	mov	r1, r0
	ldr	r0, [r4]
	bl	FSP_GetLogicFs
	subs	r4, r0, #0
	beq	.L257
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L256:
	ldr	r2, .L258
	movw	r1, #1377
	mov	r0, #0
	bl	dprint_normal
	ldr	r1, [r6, #2980]
	ldr	r0, [r4]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L250
	ldr	r1, [r5, #168]
	ldr	r0, [r4]
	bl	FreeUsdByDec
	ldr	r1, [r5, #176]
	ldr	r0, [r4]
	bl	FreeUsdByDec
	ldr	r1, [r5, #184]
	ldr	r0, [r4]
	bl	FreeUsdByDec
	ldr	r1, [r5, #192]
	ldr	r0, [r4]
	bl	FreeUsdByDec
	mov	r3, #0
	mov	r2, #0
	strd	r2, [r5, #168]
	strd	r2, [r5, #176]
	strd	r2, [r5, #184]
	strd	r2, [r5, #192]
	ldr	r1, [r6, #2980]
	ldr	r0, [r4]
	bl	FSP_ClearLogicFs
	ldr	r1, [r6, #2976]
	ldr	r0, [r4]
	bl	FSP_ClearLogicFs
	mov	r3, #0
	str	r3, [r6, #2976]
	str	r3, [r6, #2980]
.L250:
	add	r1, r4, #81920
	mov	r5, #0
	add	r1, r1, #56
	str	r5, [r6, #2940]
	ldr	r0, [r4]
	bl	FSP_ClearNotInVoQueue
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L257:
	mov	r3, #1392
	ldr	r2, .L258+4
	mov	r1, r3
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L259:
	.align	2
.L258:
	.word	.LC17
	.word	.LC18
	UNWIND(.fnend)
	.size	MP2_GetImageBuffer, .-MP2_GetImageBuffer
	.align	2
	.global	MP2_GetPictureInfo
	.type	MP2_GetPictureInfo, %function
MP2_GetPictureInfo:
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
	add	r6, r0, #77824
	add	r3, r0, #81920
	mov	r4, r0
	ldr	r2, [r6, #2936]
	ldr	r5, [r3, #48]
	cmp	r2, #1
	ldr	r7, [r3, #52]
	beq	.L308
.L261:
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L262
	ldr	r2, [r6, #2912]
	ldr	r1, [r6, #2944]
	clz	r3, r2
	mov	r3, r3, lsr #5
	str	r3, [r6, #2912]
	ldr	r2, [r5, #156]
	cmp	r2, r1
	moveq	r3, #0
	andne	r3, r3, #1
	cmp	r3, #0
	bne	.L309
.L306:
	add	r8, r4, #45056
.L264:
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	strb	r3, [r8, #281]
	ldr	r3, [r5, #156]
	str	r3, [r6, #2944]
	ldr	r3, [r5, #56]
	strh	r3, [r4, #186]	@ movhi
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r3, #3
	ldr	r3, [r5, #60]
	ldreq	r2, [r5, #64]
	movne	r3, r3, lsr #1
	rsbeq	r3, r2, r3
	strh	r3, [r4, #182]	@ movhi
	ldr	r3, [r5, #60]
	strh	r3, [r4, #184]	@ movhi
	ldrb	r3, [r5, #11]	@ zero_extendqisi2
	strb	r3, [r4, #41]
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	strb	r3, [r4, #39]
	ldr	r2, [r6, #2912]
	strb	r2, [r4, #40]
	ldrb	r3, [r5, #12]	@ zero_extendqisi2
	strb	r3, [r4, #43]
	ldrb	r3, [r5, #22]	@ zero_extendqisi2
	strb	r3, [r4, #36]
	ldr	r3, [r6, #2936]
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r4, #212]
	cmp	r3, #0
	ldrneb	r3, [r5, #25]	@ zero_extendqisi2
	strneb	r3, [r4, #37]
	ldrneb	r3, [r5, #23]	@ zero_extendqisi2
	strneb	r3, [r4, #38]
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	strb	r3, [r4, #48]
	ldrb	r3, [r5, #5]	@ zero_extendqisi2
	strb	r3, [r4, #49]
	ldrb	r3, [r5, #6]	@ zero_extendqisi2
	strb	r3, [r4, #50]
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	strb	r3, [r4, #51]
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	strb	r3, [r4, #42]
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	strb	r3, [r4, #47]
	ldrb	r3, [r5, #13]	@ zero_extendqisi2
	strb	r3, [r4, #46]
	ldrb	r3, [r5, #14]	@ zero_extendqisi2
	strb	r3, [r4, #45]
	ldrb	r3, [r5, #15]	@ zero_extendqisi2
	strb	r3, [r4, #44]
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r2, #0
	cmpne	r3, #3
	bne	.L273
	mov	r1, #0
	mov	r0, r4
	bl	MP2_GetImageBuffer
	subs	r7, r0, #0
	beq	.L310
	ldr	r1, [r6, #2984]
	ldr	r0, [r4]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L276
	ldr	r3, [r4, #28]
	movw	r1, #810
	ldr	r2, .L315
	mov	r0, #24
	ldrd	r8, [r3, #32]
	strd	r8, [r7, #208]
	ldr	r3, [r4, #28]
	ldrd	r8, [r3, #48]
	strd	r8, [r7, #216]
	ldr	r3, [r4, #28]
	ldrd	r8, [r3, #64]
	strd	r8, [r7, #224]
	mvn	r8, #0
	ldr	r3, [r4, #28]
	mvn	r9, #0
	ldr	r3, [r3, #80]
	str	r3, [r7]
	ldr	r3, [r4, #28]
	ldr	r3, [r3, #84]
	str	r3, [r7, #4]
	ldr	r3, [r4, #28]
	ldr	r3, [r3, #88]
	str	r3, [r7, #8]
	ldr	r3, [r4, #28]
	ldr	r3, [r3, #104]
	str	r3, [r7, #12]
	ldr	r3, [r4, #28]
	strd	r8, [r3, #32]
	ldrd	r8, [r7, #216]
	ldr	r3, [r4]
	strd	r8, [sp, #8]
	ldrd	r8, [r7, #208]
	strd	r8, [sp]
	bl	dprint_normal
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	subs	r3, r3, #3
	movne	r3, #1
	str	r3, [r7, #20]
.L276:
	ldrb	r3, [r5, #22]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L273
	ldr	r3, [r6, #2940]
	ldr	r1, [r6, #2976]
	cmp	r3, #0
	ldr	r2, [r6, #2980]
	movne	r3, #2
	moveq	r3, #1
	cmp	r1, r2
	str	r3, [r6, #2940]
	ldr	r3, [r6, #2984]
	beq	.L280
	cmp	r1, r3
	beq	.L280
	ldr	r0, [r4]
	bl	FSP_GetDisplay
	sub	r0, r0, #1
	uxtb	r3, r0
	cmp	r3, #1
	bls	.L311
.L281:
	mov	r2, #0
	ldr	r1, [r6, #2976]
	ldr	r0, [r4]
	bl	FSP_SetRef
	ldr	r2, [r6, #2980]
	ldr	r3, [r6, #2984]
.L280:
	str	r2, [r6, #2976]
	mov	r1, r3
	str	r3, [r6, #2980]
	mov	r2, #1
	ldr	r0, [r4]
	bl	FSP_SetRef
	ldr	r1, [r6, #2976]
	ldr	r0, [r4]
	bl	FSP_ReleasePmv
.L273:
	ldr	r1, [r6, #2984]
	ldr	r0, [r4]
	bl	FSP_GetLogicFs
	ldr	r1, [r6, #2976]
	mov	r5, r0
	ldr	r0, [r4]
	bl	FSP_GetLogicFs
	ldr	r1, [r6, #2980]
	mov	r8, r0
	ldr	r0, [r4]
	bl	FSP_GetLogicFs
	cmp	r5, #0
	cmpne	r8, #0
	moveq	r3, #1
	movne	r3, #0
	cmp	r0, #0
	orreq	r3, r3, #1
	mov	r9, r0
	cmp	r3, #0
	bne	.L312
	ldr	r7, [r5, #24]
	cmp	r7, #0
	beq	.L313
	ldr	r3, [r0, #24]
	movw	r1, #873
	mov	r0, #11
	cmp	r3, #0
	ldrne	lr, [r3, #4]
	ldreq	lr, [r7, #4]
	str	lr, [r4, #216]
	ldr	r3, [r8, #24]
	cmp	r3, #0
	ldreq	r3, [r5, #24]
	ldr	ip, [r3, #4]
	str	ip, [r4, #220]
	ldr	r3, [r5, #24]
	ldr	r3, [r3, #4]
	str	r3, [r4, #224]
	ldr	r2, [r5, #24]
	ldr	r2, [r2, #12]
	str	r2, [r4, #228]
	ldrb	r2, [r5, #408]	@ zero_extendqisi2
	strb	r2, [r4, #180]
	ldr	r2, [r5, #32]
	ldr	r6, [r2, #8]
	str	r6, [r4, #264]
	ldr	r2, [r5, #24]
	ldr	r2, [r2, #4]
	str	r2, [r4, #244]
	ldr	r7, [r9, #60]
	str	r7, [r4, #236]
	ldr	r7, [r8, #60]
	str	r2, [sp]
	str	r6, [sp, #12]
	ldr	r2, .L315+4
	str	r7, [r4, #240]
	stmib	sp, {ip, lr}
	bl	dprint_normal
	ldr	r3, [r5, #24]
	add	r2, r4, #80896
	add	lr, r4, #115
	add	ip, r2, #4
	add	r1, r4, #51
	ldr	r0, [r3, #44]
	add	r2, r2, #260
	mov	r3, #0
	str	r0, [r4, #248]
	ldr	r0, [r5, #24]
	ldr	r0, [r0, #72]
	str	r0, [r4, #252]
	ldr	r0, [r5, #24]
	ldr	r0, [r0, #64]
	str	r0, [r4, #256]
	ldr	r0, [r5, #24]
	ldr	r0, [r0, #68]
	str	r0, [r4, #260]
.L288:
	ldr	r0, [ip, #4]!
	add	r3, r3, #1
	cmp	r3, #64
	strb	r0, [lr, #1]!
	ldr	r0, [r2, #4]!
	strb	r0, [r1, #1]!
	bne	.L288
	mov	r7, #1
.L275:
	mov	r0, r7
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L310:
	ldr	r3, [r6, #2908]
	mov	r1, #792
	ldr	r2, .L315+8
	bl	dprint_normal
	mov	r0, r7
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L262:
	add	r8, r4, #45056
	ldrb	r2, [r8, #281]	@ zero_extendqisi2
	cmp	r2, #3
	beq	.L267
	ldr	ip, [r6, #2912]
	cmp	ip, #0
	beq	.L314
.L267:
	mov	r3, #1
	str	r3, [r6, #2912]
	b	.L264
.L308:
	ldrb	r2, [r5, #26]	@ zero_extendqisi2
	ldrb	r3, [r5, #24]	@ zero_extendqisi2
	strb	r2, [r5, #7]
	strb	r2, [r5, #6]
	strb	r3, [r5, #5]
	strb	r3, [r5, #4]
	b	.L261
.L312:
	ldr	r1, [r6, #2984]
	mov	r7, #0
	ldr	r0, [r4]
	bl	FSP_ClearLogicFs
	movw	r3, #847
	str	r9, [sp, #8]
	mov	r1, r3
	str	r8, [sp, #4]
	mov	r0, r7
	str	r5, [sp]
	ldr	r2, .L315+12
	bl	dprint_normal
	mov	r0, r7
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L314:
	ldr	r3, [r6, #2908]
	mov	r1, #736
	str	r2, [sp, #4]
	mov	r0, #1
	str	ip, [sp]
	ldr	r2, .L315+16
	bl	dprint_normal
	ldr	r1, [r6, #2984]
	ldr	r0, [r4]
	bl	FSP_ClearLogicFs
	ldrb	r3, [r7, #22]	@ zero_extendqisi2
	cmp	r3, #3
	ldrne	r3, [r6, #2900]
	orrne	r3, r3, #192
	strne	r3, [r6, #2900]
	b	.L267
.L309:
	ldr	r3, [r6, #2908]
	mov	r1, #720
	ldr	r2, .L315+20
	mov	r0, #1
	bl	dprint_normal
	mov	r3, #0
	ldr	r1, [r6, #2984]
	str	r3, [r6, #2912]
	ldr	r0, [r4]
	bl	FSP_ClearLogicFs
	ldrb	r3, [r7, #22]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L306
	ldr	r3, [r6, #2900]
	add	r8, r4, #45056
	orr	r3, r3, #192
	str	r3, [r6, #2900]
	b	.L264
.L313:
	ldr	r2, [r6, #2976]
	movw	r1, #854
	ldr	ip, [r6, #2980]
	mov	r0, #1
	ldr	r3, [r6, #2984]
	stmia	sp, {r2, ip}
	ldr	r2, .L315+24
	bl	dprint_normal
	ldr	r1, [r6, #2984]
	ldr	r0, [r4]
	bl	FSP_ClearLogicFs
	b	.L275
.L311:
	mov	r2, #0
	ldr	r1, [r6, #2976]
	ldr	r0, [r4]
	bl	FSP_SetDisplay
	b	.L281
.L316:
	.align	2
.L315:
	.word	.LC22
	.word	.LC25
	.word	.LC21
	.word	.LC23
	.word	.LC20
	.word	.LC19
	.word	.LC24
	UNWIND(.fnend)
	.size	MP2_GetPictureInfo, .-MP2_GetPictureInfo
	.align	2
	.global	MP2_SetVDMInf
	.type	MP2_SetVDMInf, %function
MP2_SetVDMInf:
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
	add	r5, r0, #77824
	add	r3, r0, #81920
	mov	r4, r0
	add	r0, r3, #408
	ldrb	r2, [r5, #2852]	@ zero_extendqisi2
	ldr	r3, [r3, #432]
	cmp	r2, #1
	ldr	r2, [r5, #2856]
	beq	.L320
	ldr	ip, [r5, #2848]
	mov	r1, r3, lsr #3
	add	r3, r3, r2, lsl #3
	add	r2, r1, r2
	ldr	r6, [r5, #2860]
	and	r3, r3, #31
	bic	r2, r2, #3
	add	r1, r1, ip
	str	r1, [r5, #2848]
	bic	r6, r6, #3
	str	r3, [r4, #196]
	str	r2, [r4, #188]
	bl	BsResidBits
	str	r6, [r4, #192]
	str	r0, [r4, #204]
	ldr	r3, [r5, #2860]
	and	r3, r3, #3
	mov	r3, r3, asl #3
	str	r3, [r4, #200]
	ldr	r3, [r5, #2868]
	mov	r3, r3, asl #3
	str	r3, [r4, #208]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L320:
	ldr	r1, [r5, #2848]
	mov	ip, r3, lsr #3
	add	r3, r3, r2, lsl #3
	add	r2, ip, r2
	and	r3, r3, #31
	bic	r2, r2, #3
	add	r1, r1, ip
	str	r1, [r5, #2848]
	str	r3, [r4, #196]
	str	r2, [r4, #188]
	bl	BsResidBits
	mov	r3, #0
	str	r3, [r4, #192]
	str	r3, [r4, #200]
	str	r3, [r4, #208]
	str	r0, [r4, #204]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MP2_SetVDMInf, .-MP2_SetVDMInf
	.align	2
	.global	MP2_DecNewPic
	.type	MP2_DecNewPic, %function
MP2_DecNewPic:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	mov	r4, r0
	bl	MP2_SetVDMInf
	add	r3, r4, #81920
	ldr	r2, [r3, #48]
	ldrb	r3, [r2, #22]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L339
	cmp	r3, #2
	moveq	r3, #1
	streq	r3, [r4, #12]
.L323:
	ldr	ip, [r4, #28]
	add	r1, r4, #36
	str	r1, [r4, #32]
	ldr	r3, [ip, #840]
	cmp	r3, #1
	beq	.L340
	cmp	r3, #2
	beq	.L341
.L326:
	add	r1, r4, #77824
	ldr	r3, [r1, #2900]
	bic	r3, r3, #16252928
	str	r3, [r1, #2900]
	ldrb	r5, [r2, #22]	@ zero_extendqisi2
	cmp	r5, #1
	movne	r0, #1
	beq	.L342
.L324:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L342:
	ldr	r3, .L343
	ldr	r6, [r3]
	cmp	r6, #0
	moveq	r0, r5
	beq	.L324
	ldr	lr, [r4, #208]
	sub	r2, fp, #28
	ldr	ip, [r4, #204]
	mov	r3, #4
	ldr	r0, [r4]
	mov	r1, #8
	add	ip, ip, lr
	add	lr, ip, #7
	cmp	ip, #0
	movlt	ip, lr
	mov	ip, ip, asr #3
	str	ip, [r2, #-4]!
	blx	r6
	mov	r0, r5
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L339:
	ldr	r0, [r4, #12]
	cmp	r0, #0
	bne	.L323
	add	r1, r4, #77824
	ldr	r3, [r1, #2940]
	cmp	r3, #2
	beq	.L323
	ldrb	r3, [r2, #9]	@ zero_extendqisi2
	cmp	r3, #3
	ldrne	r3, [r1, #2912]
	clzne	r3, r3
	movne	r3, r3, lsr #5
	strne	r3, [r1, #2912]
	b	.L324
.L340:
	cmp	r1, #0
	beq	.L326
	ldrb	r3, [r2, #22]	@ zero_extendqisi2
	cmp	r3, #3
	moveq	r0, #0
	streq	r0, [r4, #32]
	bne	.L326
	b	.L324
.L341:
	ldr	r3, [ip, #844]
	cmp	r1, #0
	cmpne	r3, #0
	ble	.L326
	ldrb	r3, [r2, #22]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L326
	mov	r0, #0
	str	r0, [r4, #32]
	ldr	r3, [ip, #844]
	sub	r3, r3, #1
	str	r3, [ip, #844]
	b	.L324
.L344:
	.align	2
.L343:
	.word	g_EventReportFunc
	UNWIND(.fnend)
	.size	MP2_DecNewPic, .-MP2_DecNewPic
	.align	2
	.global	MP2_RecordVFMWState
	.type	MP2_RecordVFMWState, %function
MP2_RecordVFMWState:
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
	add	r3, r0, #81920
	ldr	r2, [r0, #28]
	ldr	r3, [r3, #48]
	ldr	r1, [r3, #40]
	str	r1, [r2, #544]
	ldr	r2, [r3, #44]
	ldr	r3, [r0, #28]
	str	r2, [r3, #548]
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #8]
	ldr	r1, [r0, #28]
	cmp	r3, r2
	rsbge	r3, r2, r3
	movlt	r3, #0
	str	r3, [r1, #552]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MP2_RecordVFMWState, .-MP2_RecordVFMWState
	.align	2
	.global	MP2_GetUsrData
	.type	MP2_GetUsrData, %function
MP2_GetUsrData:
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
	add	r9, r0, #81920
	add	r5, r9, #408
	mov	r8, r0
	ldr	r3, [r9, #48]
	mov	r0, r5
	str	r3, [fp, #-52]
	bl	BsToNextByte
	mov	r0, r5
	bl	BsResidBits
	add	r7, r0, #7
	cmp	r0, #0
	movlt	r0, r7
	mov	r7, r0, asr #3
	cmp	r7, #0
	ble	.L371
	mov	r6, #0
	ldr	r10, .L393
	mov	r4, r6
	b	.L353
.L390:
	bl	BsGet
	add	r4, r4, #1
	cmp	r4, r7
	strb	r0, [r10, r6]
	add	r6, r6, #1
	beq	.L349
.L353:
	mov	r1, #24
	mov	r0, r5
	bl	BsShow
	mov	r1, #8
	bic	r3, r0, #-16777216
	mov	r0, r5
	cmp	r3, #1
	beq	.L350
	cmp	r6, #1024
	blt	.L390
	mov	r1, #8
	mov	r0, r5
	add	r4, r4, #1
	bl	BsGet
	cmp	r4, r7
	bne	.L353
.L349:
	add	r7, r8, #77824
	movw	r3, #2852
	ldrsb	r10, [r7, r3]
	cmp	r10, #0
	beq	.L368
.L389:
	mov	r3, #0
	str	r3, [fp, #-48]
.L354:
	ldr	r5, [r7, #2932]
	cmp	r5, #3
	ble	.L370
.L369:
	add	r5, r8, #79872
	mov	r10, #0
	add	r4, r5, #864
	add	r5, r5, #880
.L358:
	ldr	r1, [r4, #4]!
	ldr	r0, [r8]
	bl	FreeUsdByDec
	cmp	r4, r5
	str	r10, [r4]
	mov	r2, #0
	bne	.L358
	mov	r5, r2
	str	r2, [r7, #2932]
.L370:
	ldr	r0, [r8]
	add	r5, r8, r5, lsl #2
	bl	GetUsd
	add	r5, r5, #77824
	str	r0, [r5, #2916]
	ldr	r3, [r7, #2932]
	add	r2, r8, r3, lsl #2
	add	r2, r2, #79872
	add	r2, r2, #584
	ldr	r2, [r2, #284]
	cmp	r2, #0
	beq	.L359
	ldr	r3, [r8, #28]
	add	r0, r0, #1056
	ldr	r1, .L393
	ldrd	r2, [r3, #32]
	strd	r2, [r0]
	ldr	r3, [r5, #2916]
	ldr	r2, [r7, #2904]
	str	r2, [r3, #1044]
	ldr	r3, [r5, #2916]
	str	r6, [r3, #1052]
	ldr	r2, [r9, #48]
	ldr	r3, [r5, #2916]
	ldrb	r2, [r2, #22]	@ zero_extendqisi2
	strb	r2, [r3, #1024]
	ldr	r3, [r5, #2916]
	ldr	r2, [r8, #4]
	str	r2, [r3, #1032]
	ldr	r2, [r9, #48]
	ldr	r3, [r5, #2916]
	ldrb	r2, [r2, #10]	@ zero_extendqisi2
	strb	r2, [r3, #1025]
	ldr	r3, [r7, #2900]
	tst	r3, #524288
	ldr	r3, [r5, #2916]
	movne	r2, #3
	moveq	r2, #1
	str	r2, [r3, #1040]
	ldr	r0, [r5, #2916]
	ldr	r2, [r0, #1052]
	cmp	r2, #1024
	movgt	r3, #1024
	strgt	r3, [r0, #1052]
	ldr	r3, .L393+4
	ldrgt	r0, [r5, #2916]
	ldr	r3, [r3, #52]
	ldrgt	r2, [r0, #1052]
	blx	r3
	ldr	r3, [r5, #2916]
	ldr	r2, [r3, #1052]
	cmp	r2, #5
	ble	.L364
	ldr	r1, [r3]
	movw	r2, #21572
	movt	r2, 12615
	cmp	r1, r2
	beq	.L391
.L364:
	ldr	r3, .L393+8
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L366
	ldr	r2, [r5, #2916]
	movw	r3, #1064
	ldr	r0, [r8]
	mov	r1, #5
	blx	r6
.L366:
	ldr	r3, [r7, #2932]
	add	r3, r3, #1
	str	r3, [r7, #2932]
.L388:
	ldr	r0, [fp, #-48]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L368:
	movw	r3, #2853
	ldrsb	r4, [r7, r3]
	cmp	r4, #0
	streq	r4, [fp, #-48]
	beq	.L354
	ldr	r3, [r7, #2868]
	cmp	r3, #0
	str	r3, [fp, #-48]
	beq	.L354
	ldr	r2, .L393+12
	movw	r1, #1506
	mov	r0, r10
	mov	r4, #1
	bl	dprint_normal
	ldr	ip, .L393+4
	ldr	r3, [r7, #2864]
	mov	r2, #3
	ldr	r1, [r7, #2880]
	ldr	r0, [r7, #2884]
	sub	r3, r3, #3
	add	r1, r1, r3
	ldr	r3, [ip, #52]
	sub	r0, r0, #3
	blx	r3
	ldr	r2, [r7, #2868]
	ldr	r1, [r7, #2884]
	mov	r0, r5
	ldr	r3, [r7, #2860]
	add	r2, r2, #3
	sub	r1, r1, #3
	str	r2, [r7, #2864]
	sub	r3, r3, #3
	str	r1, [r7, #2880]
	str	r3, [r7, #2856]
	strb	r4, [r7, #2852]
	strb	r10, [r7, #2853]
	str	r10, [r7, #2868]
	str	r10, [r7, #2884]
	str	r10, [r7, #2860]
	bl	BsInit
	strb	r4, [r7, #2853]
	strb	r10, [r7, #2852]
	mov	r0, r5
	bl	BsToNextByte
	mov	r0, r5
	bl	BsResidBits
	add	r4, r0, #7
	cmp	r0, #0
	movlt	r0, r4
	mov	r4, r0, asr #3
	cmp	r4, #3
	ble	.L373
	sub	r4, r4, #3
	b	.L357
.L392:
	bl	BsGet
	ldr	r3, .L393
	strb	r0, [r3, r6]
	add	r6, r6, #1
.L356:
	add	r10, r10, #1
	cmp	r10, r4
	beq	.L389
.L357:
	mov	r1, #24
	mov	r0, r5
	bl	BsShow
	mov	r1, #8
	bic	r3, r0, #-16777216
	mov	r0, r5
	cmp	r3, #1
	beq	.L374
	cmp	r6, #1024
	blt	.L392
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	b	.L356
.L350:
	add	r7, r8, #77824
	str	r3, [fp, #-48]
	ldr	r5, [r7, #2932]
	cmp	r5, #3
	bgt	.L369
	b	.L370
.L391:
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	ldr	r2, [fp, #-52]
	sub	r3, r3, #65
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r2, #188]
	cmp	r3, #0
	ldrne	r3, [r5, #2916]
	ldrneb	r3, [r3, #5]	@ zero_extendqisi2
	andne	r3, r3, #15
	strne	r3, [r2, #192]
	b	.L364
.L359:
	mov	r0, r2
	movw	r1, #1609
	ldr	r2, .L393+16
	bl	dprint_normal
	b	.L388
.L371:
	mov	r6, #0
	b	.L349
.L374:
	str	r3, [fp, #-48]
	b	.L354
.L373:
	str	r10, [fp, #-48]
	b	.L354
.L394:
	.align	2
.L393:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_EventReportFunc
	.word	.LC26
	.word	.LC27
	UNWIND(.fnend)
	.size	MP2_GetUsrData, .-MP2_GetUsrData
	.align	2
	.global	next_start_code
	.type	next_start_code, %function
next_start_code:
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
	add	r5, r0, #81920
	mov	r7, r0
	add	r5, r5, #408
	mov	r0, r5
	bl	BsToNextByte
	mov	r0, r5
	bl	BsGetNextBytePtr
	mov	r4, r0
	mov	r0, r5
	bl	BsResidBits
	add	r1, r0, #7
	cmp	r0, #0
	movlt	r0, r1
	mov	r1, r0, asr #3
	cmp	r1, #4
	movle	r1, #0
	bgt	.L420
.L396:
	mov	r0, r5
	bl	BsLongSkip
	mov	r0, r5
	bl	BsResidBits
	add	r6, r0, #7
	cmp	r0, #0
	movlt	r0, r6
	mov	r6, r0, asr #3
	cmp	r6, #3
	subgt	r6, r6, #3
	movgt	r4, #0
	bgt	.L402
	b	.L403
.L400:
	bl	BsSkip
	cmp	r4, r6
	beq	.L403
.L402:
	mov	r1, #24
	mov	r0, r5
	bl	BsShow
	add	r4, r4, #1
	mov	r1, #8
	cmp	r0, #1
	mov	r0, r5
	bne	.L400
.L405:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L403:
	add	r7, r7, #77824
	movw	r3, #2852
	ldrsb	r4, [r7, r3]
	cmp	r4, #0
	bne	.L399
	ldrb	r3, [r7, #2853]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L399
	ldr	r3, [r7, #2868]
	cmp	r3, #0
	beq	.L399
	ldr	r2, .L423
	movw	r1, #1657
	mov	r0, #8
	mov	r6, #1
	bl	dprint_normal
	ldr	ip, .L423+4
	ldr	r3, [r7, #2864]
	mov	r2, #3
	ldr	r1, [r7, #2880]
	ldr	r0, [r7, #2884]
	sub	r3, r3, #3
	add	r1, r1, r3
	ldr	r3, [ip, #52]
	sub	r0, r0, #3
	blx	r3
	ldr	r2, [r7, #2868]
	ldr	r1, [r7, #2884]
	mov	r0, r5
	ldr	r3, [r7, #2860]
	add	r2, r2, #3
	sub	r1, r1, #3
	str	r2, [r7, #2864]
	sub	r3, r3, #3
	str	r1, [r7, #2880]
	str	r3, [r7, #2856]
	strb	r6, [r7, #2852]
	strb	r4, [r7, #2853]
	str	r4, [r7, #2868]
	str	r4, [r7, #2884]
	str	r4, [r7, #2860]
	bl	BsInit
	strb	r6, [r7, #2853]
	strb	r4, [r7, #2852]
	mov	r0, r5
	bl	BsToNextByte
	mov	r0, r5
	bl	BsGetNextBytePtr
	mov	r6, r0
	mov	r0, r5
	bl	BsResidBits
	add	r1, r0, #7
	cmp	r0, #0
	movlt	r0, r1
	mov	r1, r0, asr #3
	cmp	r1, #4
	movle	r1, r4
	bgt	.L421
.L404:
	mov	r0, r5
	bl	BsLongSkip
	mov	r0, r5
	bl	BsResidBits
	add	r6, r0, #7
	cmp	r0, #0
	movlt	r0, r6
	mov	r6, r0, asr #3
	cmp	r6, #3
	ble	.L399
	sub	r6, r6, #3
	mov	r4, #0
	b	.L406
.L422:
	bl	BsSkip
	cmp	r4, r6
	beq	.L399
.L406:
	mov	r1, #24
	mov	r0, r5
	bl	BsShow
	add	r4, r4, #1
	mov	r1, #8
	cmp	r0, #1
	mov	r0, r5
	bne	.L422
	b	.L405
.L399:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L420:
	mov	r0, r4
	bl	MP2_SearchStartCode.part.1
	mov	r1, r0, asl #3
	b	.L396
.L421:
	mov	r0, r6
	bl	MP2_SearchStartCode.part.1
	mov	r1, r0, asl #3
	b	.L404
.L424:
	.align	2
.L423:
	.word	.LC26
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	next_start_code, .-next_start_code
	.align	2
	.global	GetSliceHdr
	.type	GetSliceHdr, %function
GetSliceHdr:
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
	add	r5, r0, #81920
	mov	r6, r0
	add	r5, r5, #408
	add	r7, r0, #77824
	b	.L426
.L433:
	bl	BsShow
	mov	r4, r0
	mov	r0, r5
	bl	BsPos
	sub	r3, r4, #256
	sub	r3, r3, #1
	mov	r1, #32
	cmp	r3, #174
	str	r0, [r7, #2960]
	mov	r0, r5
	bls	.L439
	bl	BsSkip
.L426:
	mov	r0, r6
	bl	next_start_code
	mov	r1, #32
	mov	r3, r0
	cmp	r3, #1
	mov	r0, r5
	beq	.L433
	cmn	r3, #1
	beq	.L428
.L434:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L428:
	ldr	r3, .L440
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L435
	mov	r3, #0
	ldr	r0, [r6]
	mov	r2, r3
	mov	r1, #42
	blx	r4
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L439:
	bl	BsResidBits
	cmp	r0, #40
	ble	.L428
	ldr	r3, [r7, #2896]
	mov	r2, #0
	str	r2, [r7, #2956]
	cmp	r3, r2
	bne	.L432
	mov	r0, r6
	bl	MP2_GetSequenceInfo
	ldr	r3, [r7, #2948]
	cmp	r3, #0
	beq	.L434
.L432:
	mov	r0, r6
	bl	MP2_ProtocolPPSCheck
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L435:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L441:
	.align	2
.L440:
	.word	g_EventReportFunc
	UNWIND(.fnend)
	.size	GetSliceHdr, .-GetSliceHdr
	.align	2
	.global	sequence_header
	.type	sequence_header, %function
sequence_header:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r3, r0, #81920
	add	r4, r0, #77824
	add	r6, r3, #408
	mov	r1, #12
	ldr	r8, [r3, #48]
	mov	r5, r0
	mov	r3, #65536
	mov	r0, r6
	str	r3, [r4, #2900]
	mov	r3, #0
	str	r3, [r4, #2896]
	bl	BsGet
	mov	r1, #12
	str	r0, [r8, #48]
	mov	r0, r6
	bl	BsGet
	mov	r1, #4
	str	r0, [r8, #52]
	mov	r0, r6
	bl	BsGet
	mov	r1, #4
	str	r0, [r8, #84]
	mov	r0, r6
	bl	BsGet
	mov	r1, #18
	str	r0, [r8, #88]
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r8, #92]
	mov	r0, r6
	bl	BsGet
	cmp	r0, #0
	ldreq	r3, [r4, #2900]
	orreq	r3, r3, #1
	streq	r3, [r4, #2900]
.L443:
	mov	r1, #10
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r8, #96]
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	strb	r0, [r8, #1]
	mov	r0, r6
	bl	BsGet
	cmp	r0, #1
	str	r0, [r8, #76]
	beq	.L450
	ldr	r3, .L457
	add	r2, r5, #80896
	add	r2, r2, #4
	add	r7, r3, #64
	mov	r0, r7
.L446:
	ldrb	r1, [r3, #1]!	@ zero_extendqisi2
	cmp	r3, r0
	str	r1, [r2, #4]!
	bne	.L446
.L445:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	cmp	r0, #1
	str	r0, [r8, #80]
	beq	.L451
	add	r2, r5, #80896
	mov	r1, #16
	add	r3, r2, #260
	add	r2, r2, #516
.L448:
	str	r1, [r3, #4]!
	cmp	r3, r2
	bne	.L448
	mov	r0, #1
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L450:
	ldr	r7, .L457+4
	add	r9, r7, #64
	mov	r10, r7
.L444:
	mov	r1, #8
	mov	r0, r6
	ldrb	r4, [r10, #1]!	@ zero_extendqisi2
	bl	BsGet
	add	r3, r4, #20224
	cmp	r10, r9
	add	r3, r3, #2
	str	r0, [r5, r3, asl #2]
	bne	.L444
	b	.L445
.L451:
	add	r8, r7, #64
.L447:
	mov	r1, #8
	mov	r0, r6
	ldrb	r4, [r7, #1]!	@ zero_extendqisi2
	bl	BsGet
	add	r3, r4, #20224
	cmp	r7, r8
	add	r3, r3, #66
	str	r0, [r5, r3, asl #2]
	bne	.L447
	mov	r0, #1
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L458:
	.align	2
.L457:
	.word	.LANCHOR2-1
	.word	.LANCHOR2+63
	UNWIND(.fnend)
	.size	sequence_header, .-sequence_header
	.align	2
	.global	group_of_pictures_header
	.type	group_of_pictures_header, %function
group_of_pictures_header:
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
	add	r3, r0, #81920
	mov	r4, r0
	add	r5, r3, #408
	mov	r1, #1
	ldr	r6, [r3, #48]
	mov	r0, r5
	bl	BsGet
	mov	r1, #5
	strb	r0, [r6, #2]
	mov	r0, r5
	bl	BsGet
	mov	r1, #6
	str	r0, [r6, #100]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #104]
	mov	r0, r5
	bl	BsSkip
	mov	r0, r5
	mov	r1, #6
	bl	BsGet
	mov	r1, #6
	str	r0, [r6, #108]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #112]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #116]
	mov	r0, r5
	bl	BsGet
	add	r3, r4, #77824
	add	lr, r3, #3024
	add	r4, r3, #3008
	add	lr, lr, #8
	add	ip, r3, #3040
	add	ip, ip, #4
	add	r4, r4, #12
	add	r7, r3, #3056
	mov	r5, #0
	str	r0, [r6, #120]
	ldmia	lr, {r0, r1, r2}
	stmia	r4, {r0, r1, r2}
	ldmia	ip, {r0, r1, r2}
	stmia	lr, {r0, r1, r2}
	ldmia	r7, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	str	r5, [r3, #3056]
	str	r5, [r3, #3064]
	str	r5, [r3, #3060]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	group_of_pictures_header, .-group_of_pictures_header
	.align	2
	.global	sequence_extension
	.type	sequence_extension, %function
sequence_extension:
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
	add	r10, r0, #77824
	add	r1, r0, #81920
	mov	r6, r0
	add	r5, r1, #408
	ldr	r2, [r10, #2900]
	ldr	r4, [r1, #48]
	mov	r0, #0
	orr	r2, r2, #131072
	mov	r1, #8
	str	r2, [r10, #2900]
	str	r0, [r10, #2896]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #124]
	mov	r0, r5
	bl	BsGet
	mov	r1, #2
	strb	r0, [r4, #27]
	mov	r0, r5
	bl	BsGet
	mov	r1, #2
	strb	r0, [r4, #28]
	mov	r0, r5
	bl	BsGet
	mov	r1, #2
	mov	r9, r0
	mov	r0, r5
	bl	BsGet
	mov	r1, #12
	mov	r8, r0
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	mov	r7, r0
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	bne	.L461
	ldr	r2, [r10, #2900]
	orr	r2, r2, #2
	str	r2, [r10, #2900]
.L460:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L461:
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [fp, #-48]
	mov	r0, r5
	bl	BsGet
	mov	r1, #2
	strb	r0, [r4, #29]
	mov	r0, r5
	bl	BsGet
	mov	r1, #5
	strb	r0, [r4, #30]
	mov	r0, r5
	bl	BsGet
	ldrb	r2, [r4, #30]	@ zero_extendqisi2
	uxtb	r1, r0
	strb	r0, [r4, #31]
	add	r1, r1, #1
	add	r0, r2, #1
	bl	__aeabi_idiv
	ldr	ip, [r4, #88]
	ldr	r1, .L485
	ldr	r2, [r4, #124]
	add	r1, r1, ip, lsl #2
	tst	r2, #128
	ldr	r1, [r1, #52]
	mul	r0, r1, r0
	str	r0, [r4, #72]
	bne	.L484
	ubfx	r1, r2, #4, #3
	and	r2, r2, #15
	str	r1, [r4, #40]
	str	r2, [r4, #44]
.L464:
	ldr	r2, [r4, #48]
	ldr	r1, [r4, #52]
	ubfx	r2, r2, #0, #12
	ubfx	r1, r1, #0, #12
	orr	r9, r2, r9, asl #12
	orr	r8, r1, r8, asl #12
	str	r9, [r4, #48]
	cmp	r8, #0
	cmpne	r9, #0
	str	r8, [r4, #52]
	ldreq	r2, [r10, #2900]
	orreq	r2, r2, #1
	streq	r2, [r10, #2900]
	ldreq	r9, [r4, #48]
	cmp	r9, #4096
	bhi	.L466
	ldr	r2, [r4, #52]
	cmp	r2, #4096
	bls	.L467
.L466:
	ldr	r1, .L485+4
	ldr	r2, [r10, #2900]
	ldr	r5, [r1]
	orr	r2, r2, #1
	str	r2, [r10, #2900]
	cmp	r5, #0
	beq	.L467
	mov	r3, #0
	mov	r1, #21
	mov	r2, r3
	ldr	r0, [r6]
	blx	r5
.L467:
	ldr	r2, [r4, #92]
	mov	r1, #400
	ldr	r3, [r4, #40]
	add	r7, r2, r7, lsl #18
	str	r7, [r4, #92]
	sub	r0, r3, #4
	ldr	r2, [r4, #96]
	mul	r7, r1, r7
	ldr	r1, [fp, #-48]
	cmp	r0, #1
	add	r10, r2, r1, lsl #10
	str	r10, [r4, #96]
	str	r7, [r4, #68]
	bls	.L469
	ldr	r2, .L485+4
	ldr	r5, [r2]
	cmp	r5, #0
	beq	.L470
	mov	r3, #0
	mov	r1, #21
	mov	r2, r3
	ldr	r0, [r6]
	blx	r5
	ldr	r3, [r4, #40]
.L470:
	ldr	r2, .L485+8
	movw	r1, #1901
	mov	r0, #1
	bl	dprint_normal
.L469:
	ldr	r3, [r4, #44]
	sub	r2, r3, #4
	cmp	r2, #6
	bls	.L460
	ldr	r2, .L485+4
	ldr	r5, [r2]
	cmp	r5, #0
	beq	.L471
	mov	r3, #0
	ldr	r0, [r6]
	mov	r2, r3
	mov	r1, #21
	blx	r5
	ldr	r3, [r4, #44]
.L471:
	ldr	r2, .L485+12
	movw	r1, #1908
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_normal
.L484:
	and	r2, r2, #15
	cmp	r2, #5
	moveq	r2, #133
	streq	r2, [r4, #40]
	moveq	r2, #8
	streq	r2, [r4, #44]
	b	.L464
.L486:
	.align	2
.L485:
	.word	.LANCHOR0
	.word	g_EventReportFunc
	.word	.LC28
	.word	.LC29
	UNWIND(.fnend)
	.size	sequence_extension, .-sequence_extension
	.align	2
	.global	sequence_display_extension
	.type	sequence_display_extension, %function
sequence_display_extension:
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
	add	r3, r0, #81920
	add	r5, r0, #77824
	add	r6, r3, #408
	mov	r1, #3
	ldr	r4, [r3, #48]
	mov	r3, #0
	mov	r0, r6
	str	r3, [r4, #148]
	str	r3, [r4, #152]
	ldr	r3, [r5, #2900]
	orr	r3, r3, #262144
	str	r3, [r5, #2900]
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #128]
	mov	r0, r6
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #132]
	bne	.L494
.L488:
	mov	r1, #14
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #148]
	mov	r0, r6
	bl	BsGet
	cmp	r0, #0
	bne	.L489
	ldr	r3, [r5, #2900]
	orr	r3, r3, #4
	str	r3, [r5, #2900]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L489:
	mov	r0, r6
	mov	r1, #14
	bl	BsGet
	str	r0, [r4, #152]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L494:
	mov	r1, #8
	mov	r0, r6
	bl	BsGet
	mov	r1, #8
	str	r0, [r4, #136]
	mov	r0, r6
	bl	BsGet
	mov	r1, #8
	str	r0, [r4, #140]
	mov	r0, r6
	bl	BsGet
	str	r0, [r4, #144]
	b	.L488
	UNWIND(.fnend)
	.size	sequence_display_extension, .-sequence_display_extension
	.align	2
	.global	quant_matrix_extension
	.type	quant_matrix_extension, %function
quant_matrix_extension:
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
	add	r3, r0, #81920
	mov	r7, r0
	add	r5, r3, #408
	mov	r1, #1
	ldr	r9, [r3, #48]
	mov	r0, r5
	bl	BsGet
	cmp	r0, #1
	str	r0, [r9, #76]
	beq	.L520
.L496:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #1
	str	r0, [r9, #80]
	ldreq	r6, .L522
	addeq	r8, r6, #64
	beq	.L498
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	beq	.L500
.L506:
	mov	r4, #64
.L501:
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	subs	r4, r4, #1
	bne	.L501
.L500:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	beq	.L521
.L502:
	mov	r4, #64
.L503:
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	subs	r4, r4, #1
	bne	.L503
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L498:
	mov	r1, #8
	mov	r0, r5
	ldrb	r4, [r6, #1]!	@ zero_extendqisi2
	bl	BsGet
	add	r3, r4, #20224
	cmp	r6, r8
	add	r3, r3, #66
	str	r0, [r7, r3, asl #2]
	bne	.L498
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	bne	.L506
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	bne	.L502
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L521:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L520:
	ldr	r6, .L522
	add	r8, r6, #64
.L497:
	mov	r1, #8
	mov	r0, r5
	ldrb	r4, [r6, #1]!	@ zero_extendqisi2
	bl	BsGet
	add	r3, r4, #20224
	cmp	r6, r8
	add	r3, r3, #2
	str	r0, [r7, r3, asl #2]
	bne	.L497
	b	.L496
.L523:
	.align	2
.L522:
	.word	.LANCHOR2+63
	UNWIND(.fnend)
	.size	quant_matrix_extension, .-quant_matrix_extension
	.align	2
	.global	sequence_scalable_extension
	.type	sequence_scalable_extension, %function
sequence_scalable_extension:
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
	add	r0, r0, #81920
	mov	r1, #32
	add	r0, r0, #408
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	BsSkip
	UNWIND(.fnend)
	.size	sequence_scalable_extension, .-sequence_scalable_extension
	.align	2
	.global	picture_display_extension
	.type	picture_display_extension, %function
picture_display_extension:
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
	add	r3, r0, #81920
	add	r8, r0, #77824
	add	r4, r3, #408
	ldr	r5, [r3, #48]
	ldr	r3, [r8, #2900]
	orr	r3, r3, #2097152
	str	r3, [r8, #2900]
	ldrb	r3, [r5, #27]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L526
	ldrb	r3, [r5, #16]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L538
.L534:
	mov	r7, #1
.L527:
	add	r5, r5, #160
	mov	r6, #0
	b	.L531
.L540:
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #12]
	mov	r0, r4
	bl	BsGet
	cmp	r0, #0
	beq	.L537
	cmp	r6, r7
	bge	.L539
.L531:
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	add	r6, r6, r1
	str	r0, [r5, #4]!
	mov	r0, r4
	bl	BsGet
	mov	r1, #16
	cmp	r0, #0
	mov	r0, r4
	bne	.L540
.L537:
	ldr	r3, [r8, #2900]
	orr	r3, r3, #32
	str	r3, [r8, #2900]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L526:
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L534
	ldrb	r3, [r5, #16]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r7, #2
	movne	r7, #3
	b	.L527
.L538:
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r7, #2
	movne	r7, #3
	b	.L527
.L539:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	picture_display_extension, .-picture_display_extension
	.align	2
	.global	picture_coding_extension
	.type	picture_coding_extension, %function
picture_coding_extension:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r10, r0, #77824
	add	r0, r0, #81920
	add	r5, r0, #408
	ldr	r7, [r0, #48]
	ldr	r3, [r10, #2900]
	add	r8, r7, #4
	add	r9, r7, #8
	orr	r3, r3, #1048576
	str	r3, [r10, #2900]
.L542:
	mov	r6, r8
	mov	r4, #0
.L544:
	mov	r1, #4
	mov	r0, r5
	bl	BsGet
	add	r4, r4, #1
	uxtb	r0, r0
	strb	r0, [r6], #1
	sub	r3, r0, #10
	cmp	r0, #0
	cmpne	r3, #4
	ldrls	r3, [r10, #2900]
	orrls	r3, r3, #16
	strls	r3, [r10, #2900]
	cmp	r4, #2
	bne	.L544
	add	r8, r8, #2
	cmp	r8, r9
	bne	.L542
	mov	r1, r4
	mov	r0, r5
	bl	BsGet
	mov	r1, r4
	strb	r0, [r7, #8]
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r7, #9]
	cmp	r0, #0
	bne	.L546
	ldr	r3, [r10, #2900]
	orr	r3, r3, #16
	str	r3, [r10, #2900]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L546:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #10]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #11]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #12]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #13]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #14]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #15]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #16]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #17]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #18]
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r7, #3]
	cmp	r0, #0
	ldmeqfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #3
	strb	r0, [r7, #19]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #20]
	mov	r0, r5
	bl	BsGet
	mov	r1, #7
	strb	r0, [r7, #21]
	mov	r0, r5
	bl	BsGet
	mov	r1, #8
	str	r0, [r7, #32]
	mov	r0, r5
	bl	BsGet
	str	r0, [r7, #36]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	picture_coding_extension, .-picture_coding_extension
	.align	2
	.global	picture_spatial_scalable_extension
	.type	picture_spatial_scalable_extension, %function
picture_spatial_scalable_extension:
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
	add	r0, r0, #81920
	mov	r1, #32
	add	r0, r0, #408
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	BsSkip
	UNWIND(.fnend)
	.size	picture_spatial_scalable_extension, .-picture_spatial_scalable_extension
	.align	2
	.global	picture_temporal_scalable_extension
	.type	picture_temporal_scalable_extension, %function
picture_temporal_scalable_extension:
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
	add	r0, r0, #81920
	mov	r1, #32
	add	r0, r0, #408
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	BsSkip
	UNWIND(.fnend)
	.size	picture_temporal_scalable_extension, .-picture_temporal_scalable_extension
	.align	2
	.global	extra_bit_information
	.type	extra_bit_information, %function
extra_bit_information:
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
	add	r4, r0, #81920
	mov	r5, #0
	add	r4, r4, #408
	b	.L558
.L560:
	bl	BsSkip
	mov	r0, r4
	bl	BsResidBits
	add	r5, r5, #1
	cmp	r0, #8
	ble	.L559
.L558:
	mov	r1, #1
	mov	r0, r4
	bl	BsGet
	mov	r1, #8
	cmp	r0, #0
	mov	r0, r4
	bne	.L560
.L559:
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	extra_bit_information, .-extra_bit_information
	.align	2
	.global	picture_header
	.type	picture_header, %function
picture_header:
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
	add	r2, r0, #77824
	mov	r6, r0
	add	r0, r0, #81920
	mov	r1, #10
	ldr	r3, [r2, #2900]
	add	r5, r0, #408
	ldr	r4, [r0, #48]
	bic	r3, r3, #3145728
	mov	r0, r5
	bic	r3, r3, #56
	orr	r3, r3, #524288
	str	r3, [r2, #2900]
	bl	BsGet
	mov	r1, #3
	str	r0, [r4, #156]
	mov	r0, r5
	bl	BsGet
	mov	r1, #16
	strb	r0, [r4, #22]
	mov	r0, r5
	bl	BsGet
	ldrb	r7, [r4, #22]	@ zero_extendqisi2
	sub	r3, r7, #2
	cmp	r3, #1
	str	r0, [r4, #160]
	bls	.L564
.L562:
	cmp	r7, #3
	beq	.L565
.L563:
	mov	r0, r6
	bl	extra_bit_information
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L565:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #25]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #26]
	b	.L563
.L564:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #3
	strb	r0, [r4, #23]
	mov	r0, r5
	bl	BsGet
	ldrb	r7, [r4, #22]	@ zero_extendqisi2
	strb	r0, [r4, #24]
	b	.L562
	UNWIND(.fnend)
	.size	picture_header, .-picture_header
	.align	2
	.global	copyright_extension
	.type	copyright_extension, %function
copyright_extension:
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
	add	r0, r0, #81920
	mov	r1, #32
	add	r0, r0, #408
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	BsSkip
	UNWIND(.fnend)
	.size	copyright_extension, .-copyright_extension
	.align	2
	.global	extension
	.type	extension, %function
extension:
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
	add	r3, r0, #81920
	mov	r2, #0
	add	r5, r3, #408
	mov	r4, r0
	ldr	r3, [r3, #48]
	mov	r1, #4
	mov	r0, r5
	str	r2, [r3, #128]
	str	r2, [r3, #132]
	str	r2, [r3, #136]
	str	r2, [r3, #140]
	str	r2, [r3, #144]
	bl	BsGet
	sub	r0, r0, #1
	cmp	r0, #9
	ldrls	pc, [pc, r0, asl #2]
	b	.L568
.L570:
	.word	.L569
	.word	.L571
	.word	.L572
	.word	.L573
	.word	.L573
	.word	.L568
	.word	.L575
	.word	.L576
	.word	.L573
	.word	.L573
.L575:
	mov	r0, r4
	bl	picture_display_extension
.L568:
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L573:
	mov	r0, r5
	mov	r1, #32
	bl	BsSkip
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L572:
	mov	r0, r4
	bl	quant_matrix_extension
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L576:
	mov	r0, r4
	bl	picture_coding_extension
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L569:
	mov	r0, r4
	bl	sequence_extension
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L571:
	mov	r0, r4
	bl	sequence_display_extension
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	extension, .-extension
	.align	2
	.global	MPEG2DEC_Init
	.type	MPEG2DEC_Init, %function
MPEG2DEC_Init:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 920
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #924)
	sub	sp, sp, #924
	ldr	r3, [r1, #596]
	mov	r7, r1
	mov	r4, r0
	cmp	r3, #1
	ldr	r10, .L588
	beq	.L585
	add	r6, r0, #77824
	add	r8, r0, #80896
	add	r5, r0, #81920
	mov	r9, #0
	str	r9, [fp, #-960]
	str	r9, [fp, #-956]
.L580:
	ldr	r3, [r5, #400]
	movw	r2, #16832
	movt	r2, 1
	mov	r1, #0
	ldr	r10, [r10, #48]
	mov	r0, r4
	str	r3, [fp, #-952]
	blx	r10
	ldr	r3, [fp, #-952]
	add	r0, r5, #56
	mov	r10, #0
	str	r3, [r5, #400]
	bl	ResetVoQueue
	add	r1, r4, #45056
	str	r7, [r4, #28]
	add	r0, r8, #680
	add	r2, r8, #876
	str	r0, [r5, #52]
	str	r2, [r5, #48]
	mov	ip, #3
	str	r10, [r4, #12]
	mov	r2, #1
	str	r2, [r6, #2912]
	mov	r0, r4
	strb	ip, [r1, #281]
	str	r10, [r6, #2956]
	ldr	r1, [r7, #8]
	str	r10, [r6, #2948]
	str	r2, [fp, #-952]
	str	r1, [r6, #2888]
	bl	VCTRL_GetChanIDByCtx
	ldr	r2, [fp, #-952]
	cmn	r0, #1
	str	r0, [r4]
	beq	.L586
	ldr	r4, [r7, #596]
	cmp	r4, #1
	movne	r4, r2
	beq	.L587
.L582:
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L587:
	ldr	r3, [r6, #2900]
	add	r0, r8, #8
	ldr	r2, [fp, #-956]
	ldr	r1, [fp, #-960]
	orr	r3, r3, #65536
	str	r3, [r6, #2900]
	ldr	r3, .L588
	str	r2, [r6, #2936]
	mov	r2, #256
	str	r1, [r6, #2948]
	sub	r1, fp, #556
	str	r9, [r6, #2896]
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, .L588
	sub	r1, fp, #300
	add	r0, r8, #264
	mov	r2, #256
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, .L588
	sub	r1, fp, #948
	mov	r2, #196
	ldr	r0, [r5, #48]
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, .L588
	ldr	r0, [r5, #52]
	mov	r2, #196
	sub	r1, fp, #752
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L585:
	add	r6, r0, #77824
	add	r8, r0, #80896
	add	r1, r8, #8
	ldr	r3, [r10, #52]
	ldr	ip, [r6, #2936]
	add	r5, r4, #81920
	mov	r2, #256
	sub	r0, fp, #556
	ldr	r9, [r6, #2896]
	str	ip, [fp, #-956]
	ldr	ip, [r6, #2948]
	str	ip, [fp, #-960]
	blx	r3
	ldr	r3, [r10, #52]
	add	r1, r8, #264
	mov	r2, #256
	sub	r0, fp, #300
	blx	r3
	ldr	r3, [r10, #52]
	ldr	r1, [r5, #48]
	mov	r2, #196
	sub	r0, fp, #948
	blx	r3
	ldr	r3, [r10, #52]
	ldr	r1, [r5, #52]
	mov	r2, #196
	sub	r0, fp, #752
	blx	r3
	b	.L580
.L586:
	mov	r0, r10
	ldr	r2, .L588+4
	movw	r1, #2299
	mvn	r4, #19
	bl	dprint_normal
	b	.L582
.L589:
	.align	2
.L588:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC30
	UNWIND(.fnend)
	.size	MPEG2DEC_Init, .-MPEG2DEC_Init
	.align	2
	.global	MPEG2DEC_RecycleImage
	.type	MPEG2DEC_RecycleImage, %function
MPEG2DEC_RecycleImage:
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
	subs	r5, r0, #0
	mov	r4, r1
	beq	.L595
	mov	r2, #0
	ldr	r0, [r5]
	bl	FSP_SetDisplay
	mov	r1, r4
	ldr	r0, [r5]
	bl	FSP_GetFsImagePtr
	cmp	r0, #0
	addne	r4, r0, #160
	addne	r8, r0, #192
	movne	r6, #0
	movne	r7, #0
	beq	.L594
.L593:
	ldr	r1, [r4, #8]!
	ldr	r0, [r5]
	bl	FreeUsdByDec
	cmp	r4, r8
	strd	r6, [r4]
	bne	.L593
.L594:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L595:
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	MPEG2DEC_RecycleImage, .-MPEG2DEC_RecycleImage
	.align	2
	.global	MPEG2DEC_FlushRemainImg
	.type	MPEG2DEC_FlushRemainImg, %function
MPEG2DEC_FlushRemainImg:
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
	ldr	r3, [r0, #28]
	mov	r4, r0
	ldr	r3, [r3, #12]
	cmp	r3, #1
	beq	.L597
	add	r5, r0, #77824
	ldr	r0, [r0]
	ldr	r1, [r5, #2980]
	bl	FSP_GetFsImagePtr
	subs	r6, r0, #0
	beq	.L597
	ldr	r1, [r5, #2980]
	ldr	r0, [r4]
	bl	FSP_GetDisplay
	cmp	r0, #2
	beq	.L613
.L597:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L613:
	mov	r0, r4
	bl	MP2_SetImgFormat
	add	ip, r4, #79872
	add	r3, ip, #864
	add	r2, r6, #168
	add	ip, ip, #880
	mov	r0, #0
.L602:
	ldr	r1, [r3, #4]!
	mov	lr, #0
	add	r2, r2, #8
	cmp	r1, lr
	strne	r0, [r2, #-4]
	strne	r1, [r2, #-8]
	cmp	r3, ip
	str	r0, [r3]
	bne	.L602
	str	lr, [r5, #2932]
	mov	r2, #1
	ldr	r1, [r6, #88]
	ldr	r0, [r4]
	bl	FSP_SetDisplay
	add	r3, r4, #81920
	ldr	r0, [r4]
	add	r3, r3, #56
	str	r6, [sp]
	mov	r2, r4
	mov	r1, #3
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L597
	ldr	r1, [r6, #88]
	mov	r0, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	MPEG2DEC_RecycleImage
	UNWIND(.fnend)
	.size	MPEG2DEC_FlushRemainImg, .-MPEG2DEC_FlushRemainImg
	.align	2
	.global	MPEG2DEC_GetImageBuffer
	.type	MPEG2DEC_GetImageBuffer, %function
MPEG2DEC_GetImageBuffer:
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
	add	r3, r0, #45056
	mov	r4, r0
	ldrb	r3, [r3, #281]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L615
	add	r3, r0, #77824
	ldr	r3, [r3, #2912]
	cmp	r3, #0
	beq	.L617
.L615:
	ldr	r0, [r4]
	bl	FSP_IsNewFsAvailable
	cmp	r0, #1
	beq	.L617
	cmn	r0, #1
	beq	.L625
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L617:
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L625:
	add	r1, r4, #81920
	ldr	r0, [r4]
	add	r1, r1, #56
	bl	FSP_ClearNotInVoQueue
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MPEG2DEC_GetImageBuffer, .-MPEG2DEC_GetImageBuffer
	.align	2
	.global	MP2_ClearCurPacket
	.type	MP2_ClearCurPacket, %function
MP2_ClearCurPacket:
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
	ldrsb	r3, [r4]
	cmp	r3, #1
	beq	.L627
	mov	r0, r5
	ldr	r1, [r4, #24]
	bl	SM_ReleaseStreamSeg
.L627:
	ldr	r3, .L631
	mov	r0, r4
	mov	r2, #36
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L632:
	.align	2
.L631:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	MP2_ClearCurPacket, .-MP2_ClearCurPacket
	.align	2
	.global	MP2_ReceivePacket
	.type	MP2_ReceivePacket, %function
MP2_ReceivePacket:
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
	subs	r4, r1, #0
	add	r3, r0, #32768
	beq	.L638
	mov	r5, #0
	str	r5, [r3, #2568]
	ldr	r1, [r4, #16]
	str	r1, [r3, #2612]
	ldr	r1, [r4, #12]
	str	r1, [r3, #2576]
	ldr	r1, [r4]
	str	r1, [r3, #2600]
	ldr	r1, [r4, #16]
	str	r1, [r3, #2584]
	ldrb	r1, [r4, #6]	@ zero_extendqisi2
	strb	r1, [r3, #2572]
	ldr	r1, [r4, #20]
	str	r1, [r3, #2592]
	ldrb	ip, [r4, #6]	@ zero_extendqisi2
	cmp	ip, #1
	beq	.L636
	ldr	r1, [r4, #92]
	str	r1, [r3, #2580]
	ldr	r1, [r4, #80]
	str	r1, [r3, #2604]
	ldr	r1, [r4, #96]
	str	r1, [r3, #2588]
	ldrb	r1, [r4, #86]	@ zero_extendqisi2
	strb	r1, [r3, #2573]
	ldr	r1, [r4, #100]
	str	r1, [r3, #2596]
	ldrb	ip, [r4, #86]	@ zero_extendqisi2
	cmp	ip, #1
	beq	.L637
	add	r1, r0, #35328
	mov	r0, r2
	add	r1, r1, #12
	bl	MP2_ClearCurPacket
	ldrb	r3, [r4, #86]	@ zero_extendqisi2
	ldr	r2, .L639
	movw	r1, #2722
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L637:
	mov	r0, ip
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L636:
	str	r5, [r3, #2580]
	mov	r0, ip
	str	r5, [r3, #2604]
	str	r5, [r3, #2588]
	strb	r5, [r3, #2573]
	str	r5, [r3, #2596]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L638:
	ldr	r2, .L639+4
	movw	r1, #2696
	ldr	r3, [r3, #2628]
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L640:
	.align	2
.L639:
	.word	.LC32
	.word	.LC31
	UNWIND(.fnend)
	.size	MP2_ReceivePacket, .-MP2_ReceivePacket
	.align	2
	.global	MP2_ClearCurPic
	.type	MP2_ClearCurPic, %function
MP2_ClearCurPic:
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
	add	r7, r0, #45056
	mov	r6, r0
	ldr	r3, [r7, #276]
	cmp	r3, #0
	movne	r4, r0
	movne	r5, #0
	bne	.L644
	b	.L645
.L643:
	ldr	r3, [r7, #276]
	add	r4, r4, #44
	cmp	r5, r3
	bcs	.L645
.L644:
	ldr	r1, [r4, #300]
	add	r5, r5, #1
	ldr	r0, [r6]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #280]
	cmp	r3, #0
	beq	.L643
	ldr	r3, [r4, #288]
	cmp	r3, #0
	beq	.L643
	ldr	r1, [r4, #304]
	add	r4, r4, #44
	ldr	r0, [r6]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r7, #276]
	cmp	r5, r3
	bcc	.L644
.L645:
	mov	r3, #0
	str	r3, [r7, #276]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MP2_ClearCurPic, .-MP2_ClearCurPic
	.align	2
	.global	MPEG2DEC_VDMPostProc
	.type	MPEG2DEC_VDMPostProc, %function
MPEG2DEC_VDMPostProc:
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
	UNWIND(.pad #44)
	sub	sp, sp, #44
	add	r2, r0, #81920
	ldr	r3, [r0, #28]
	mov	r9, r1
	ldr	r6, [r2, #48]
	mov	r4, r0
	str	r2, [fp, #-48]
	add	r5, r4, #77824
	ldr	r2, [r6, #40]
	str	r2, [r3, #544]
	ldr	r3, [r0, #28]
	ldr	r2, [r6, #44]
	str	r2, [r3, #548]
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #8]
	ldr	r1, [r0, #28]
	cmp	r3, r2
	rsbge	r3, r2, r3
	movlt	r3, #0
	str	r3, [r1, #552]
	bl	MP2_ClearCurPic
	ldr	r3, .L713
	movw	r2, #45300
	mov	r1, #0
	add	r0, r4, #36
	ldr	r3, [r3, #48]
	blx	r3
	ldrb	r2, [r6, #22]	@ zero_extendqisi2
	add	r3, r4, #45056
	strb	r2, [r3, #280]
	ldr	r1, [r5, #2984]
	ldr	r0, [r4]
	bl	FSP_GetFsImagePtr
	ldr	r1, [r5, #2980]
	mov	r7, r0
	ldr	r0, [r4]
	bl	FSP_GetFsImagePtr
	ldr	r1, [r5, #2976]
	mov	r10, r0
	ldr	r0, [r4]
	bl	FSP_GetFsImagePtr
	cmp	r7, #0
	beq	.L706
	cmp	r9, #0
	str	r9, [r7, #96]
	blt	.L658
	cmp	r9, #100
	movlt	r3, r9
	movge	r3, #100
	str	r3, [r7, #96]
	ldr	r2, [r4, #28]
	ldr	r2, [r2, #4]
	cmp	r3, r2
	bhi	.L707
.L659:
	mov	r0, r4
	bl	MP2_SetImgFormat
	ldrb	r3, [r6, #9]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L662
	ldr	r3, [r5, #2912]
	cmp	r3, #1
	beq	.L662
.L663:
	ldrb	r3, [r6, #22]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L683
	ldr	r3, [r4, #28]
	ldr	r2, [r7, #96]
	ldr	r3, [r3]
	cmp	r2, r3
	bhi	.L708
.L683:
	mov	r0, #1
.L704:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L708:
	ldr	r1, [r5, #2984]
	ldr	r0, [r4]
	bl	FSP_ClearLogicFs
	ldr	r1, [r5, #2980]
	ldr	r0, [r4]
	bl	FSP_GetFsImagePtr
	subs	r6, r0, #0
	beq	.L679
	ldr	r1, [r6, #168]
	ldr	r0, [r4]
	bl	FreeUsdByDec
	ldr	r1, [r6, #176]
	ldr	r0, [r4]
	bl	FreeUsdByDec
	ldr	r1, [r6, #184]
	ldr	r0, [r4]
	bl	FreeUsdByDec
	ldr	r1, [r6, #192]
	ldr	r0, [r4]
	bl	FreeUsdByDec
	mov	r3, #0
	mov	r2, #0
	strd	r2, [r6, #168]
	strd	r2, [r6, #176]
	strd	r2, [r6, #184]
	strd	r2, [r6, #192]
	ldr	r1, [r5, #2980]
	ldr	r0, [r4]
	bl	FSP_ClearLogicFs
	ldr	r0, [r4]
	ldr	r1, [r5, #2976]
	bl	FSP_ClearLogicFs
	mov	r3, #0
	str	r3, [r5, #2976]
	str	r3, [r5, #2980]
.L679:
	mov	r3, #0
	mov	r0, #1
	str	r3, [r5, #2940]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L707:
	ldr	ip, [r5, #2984]
	movw	r1, #2564
	str	r2, [sp]
	mov	r0, #1
	ldr	r2, .L713+4
	str	ip, [sp, #4]
	bl	dprint_normal
	mov	r2, #0
	ldr	r1, [r5, #2984]
	ldr	r0, [r4]
	bl	FSP_SetDisplay
	b	.L659
.L662:
	add	r0, r4, #79872
	ldr	r8, [fp, #-48]
	add	r3, r0, #864
	add	r2, r7, #168
	add	r0, r0, #880
	mov	ip, #0
.L661:
	ldr	r1, [r3, #4]!
	mov	lr, #0
	cmp	r1, lr
	stmneia	r2, {r1, ip}
	cmp	r3, r0
	str	ip, [r3]
	add	r2, r2, #8
	bne	.L661
	str	lr, [r5, #2932]
	ldr	r3, [r4, #28]
	str	r8, [fp, #-48]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L665
	ldrb	r3, [r6, #22]	@ zero_extendqisi2
	cmp	r3, #3
	ldrne	r1, [r5, #2976]
	strne	r1, [r5, #2988]
	bne	.L666
.L665:
	ldr	r1, [r5, #2984]
	str	r1, [r5, #2988]
.L666:
	ldr	r0, [r4]
	bl	FSP_GetDisplay
	ldr	r1, [r5, #2988]
	cmn	r1, #1
	beq	.L667
	sub	r0, r0, #1
	uxtb	r0, r0
	cmp	r0, #1
	bls	.L709
.L667:
	ldrb	r3, [r6, #27]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L710
	ldrb	r3, [r6, #18]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r5, #3064]
	addeq	r3, r3, #1
	addne	r3, r3, #1
	streq	r3, [r5, #3064]
	ldreqb	r3, [r6, #16]	@ zero_extendqisi2
	ldreq	r2, [r5, #3060]
	addeq	r3, r3, #2
	strne	r3, [r5, #3064]
	addeq	r3, r2, r3
	movne	r3, r3, asl #1
	str	r3, [r5, #3060]
.L677:
	ldr	r2, [r5, #3056]
	ldr	r3, [r5, #2908]
	add	r2, r2, #1
	str	r2, [r5, #3056]
	add	r3, r3, #1
	str	r3, [r5, #2908]
	b	.L663
.L658:
	mov	r3, #0
	str	r3, [r7, #96]
	b	.L659
.L710:
	ldrb	r2, [r6, #16]	@ zero_extendqisi2
	ldrb	r3, [r6, #10]	@ zero_extendqisi2
	ldr	r1, [r5, #3064]
	add	r3, r2, r3
	add	r3, r3, #1
	add	r3, r3, r1
	str	r3, [r5, #3064]
	mov	r3, r3, asl #1
	str	r3, [r5, #3060]
	b	.L677
.L706:
	str	r0, [sp, #4]
	mov	r3, r7
	str	r10, [sp]
	movw	r1, #2546
	ldr	r2, .L713+8
	mov	r0, r7
	bl	dprint_normal
	mov	r0, r7
	b	.L704
.L709:
	ldr	r0, [r4]
	bl	FSP_GetFsImagePtr
	subs	r3, r0, #0
	str	r3, [fp, #-52]
	beq	.L711
	ldr	r9, [r4]
	ldr	r1, [r5, #2980]
	mov	r0, r9
	bl	FSP_GetFsImagePtr
	ldr	r1, [r5, #2988]
	mov	r8, r0
	str	r0, [fp, #-56]
	mov	r0, r9
	bl	FSP_GetFsImagePtr
	cmp	r8, #0
	cmpne	r0, #0
	mov	r10, r0
	beq	.L712
	ldrd	r2, [r0, #208]
	mvn	r1, #0
	mvn	r0, #0
	cmp	r3, r1
	cmpeq	r2, r0
	beq	.L670
	ldr	r1, [r5, #2980]
	mov	r0, r9
	bl	FSP_GetDisplay
	cmp	r0, #1
	beq	.L674
	ldr	r1, [r5, #2980]
	mov	r0, r9
	bl	FSP_GetDisplay
	cmp	r0, #2
	beq	.L674
.L670:
	mov	r2, #1
	ldr	r1, [r5, #2988]
	ldr	r0, [r4]
	bl	FSP_SetDisplay
	ldr	r8, [fp, #-52]
	ldr	r3, [fp, #-48]
	mov	r2, r4
	ldr	r0, [r4]
	mov	r1, #3
	str	r8, [sp]
	add	r3, r3, #56
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L680
	mov	r3, r8
	add	r8, r8, #160
	add	r9, r3, #192
	mov	r6, #0
	mov	r7, #0
.L675:
	ldr	r1, [r8, #8]!
	ldr	r0, [r4]
	bl	FreeUsdByDec
	cmp	r8, r9
	strd	r6, [r8]
	bne	.L675
	ldr	r0, [r4]
	mov	r2, #0
	ldr	r1, [r5, #2988]
	bl	FSP_SetDisplay
	mov	r0, #0
	b	.L704
.L674:
	ldr	r1, [fp, #-56]
	ldrd	r2, [r10, #208]
	ldrd	r0, [r1, #208]
	cmp	r3, r1
	cmpeq	r2, r0
	bls	.L670
	strd	r0, [sp]
	mov	r0, r9
	bl	IsPtsRewind
	cmp	r0, #0
	bne	.L670
	ldr	r3, [fp, #-56]
	movw	r1, #2511
	mov	r0, #24
	ldrd	r2, [r3, #208]
	strd	r2, [fp, #-68]
	mov	r3, r9
	ldrd	r8, [fp, #-68]
	ldr	r2, .L713+12
	strd	r8, [sp, #8]
	ldrd	r8, [r10, #208]
	strd	r8, [sp]
	bl	dprint_normal
	ldr	ip, [fp, #-56]
	ldrd	r0, [r10, #208]
	ldrd	r2, [ip, #208]
	strd	r2, [r10, #208]
	strd	r0, [ip, #208]
	b	.L670
.L680:
	ldr	r3, [r4, #8]
	add	r3, r3, #1
	str	r3, [r4, #8]
	b	.L667
.L712:
	ldr	r2, .L713+16
	movw	r1, #2491
	mov	r0, #0
	bl	dprint_normal
	b	.L670
.L711:
	movw	r3, #2605
	ldr	r2, .L713+20
	mov	r1, r3
	bl	dprint_normal
	ldr	r0, [fp, #-52]
	b	.L704
.L714:
	.align	2
.L713:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC34
	.word	.LC33
	.word	.LC36
	.word	.LC35
	.word	.LC18
	UNWIND(.fnend)
	.size	MPEG2DEC_VDMPostProc, .-MPEG2DEC_VDMPostProc
	.align	2
	.global	MP2_WriteSliceInfo
	.type	MP2_WriteSliceInfo, %function
MP2_WriteSliceInfo:
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	add	ip, r0, #45056
	mov	r4, r0
	ldr	r3, [ip, #276]
	cmp	r3, #1024
	bcs	.L721
	mov	r2, #44
	add	r1, r0, #77824
	mla	r2, r2, r3, r0
	ldr	r0, [r1, #2856]
	mov	r4, #0
	movw	lr, #2852
	add	r0, r0, #3
	str	r4, [r2, #292]
	str	r0, [r2, #276]
	ldr	r0, [r1, #2872]
	str	r0, [r2, #300]
	ldr	r0, [r1, #2864]
	sub	r0, r0, #3
	mov	r0, r0, asl #3
	str	r0, [r2, #284]
	ldrsh	r0, [r1, lr]
	cmp	r0, #1
	beq	.L722
	cmp	r0, #256
	bne	.L720
	ldr	r0, [r1, #2860]
	str	r4, [r2, #296]
	str	r0, [r2, #280]
	ldr	r0, [r1, #2876]
	str	r0, [r2, #304]
	ldr	r1, [r1, #2868]
	mov	r1, r1, asl #3
	str	r1, [r2, #288]
.L719:
	mov	r0, #1
	add	r3, r3, r0
	str	r3, [ip, #276]
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L720:
	movw	r2, #2853
	ldrsb	r3, [r1, lr]
	ldrsb	ip, [r1, r2]
	mov	r0, #1
	movw	r1, #3124
	ldr	r2, .L723
	str	ip, [sp]
	bl	dprint_normal
	mov	r0, r4
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L722:
	str	r4, [r2, #280]
	str	r4, [r2, #296]
	str	r4, [r2, #304]
	str	r4, [r2, #288]
	b	.L719
.L721:
	ldr	r2, .L723+4
	movw	r1, #3095
	mov	r0, #1024
	str	r0, [sp]
	mov	r0, #1
	bl	dprint_normal
	mov	r0, r4
	bl	MP2_ClearCurPic
	add	r2, r4, #77824
	mov	r1, #0
	ldr	r3, [r2, #2900]
	mov	r0, r1
	str	r1, [r2, #2956]
	bic	r3, r3, #5767168
	str	r3, [r2, #2900]
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L724:
	.align	2
.L723:
	.word	.LC38
	.word	.LC37
	UNWIND(.fnend)
	.size	MP2_WriteSliceInfo, .-MP2_WriteSliceInfo
	.align	2
	.global	MP2_DecSlice
	.type	MP2_DecSlice, %function
MP2_DecSlice:
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
	mov	r5, r0
	bl	MP2_WriteSliceInfo
	cmp	r0, #1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r2, .L731
	movw	r1, #3070
	mov	r0, #1
	bl	dprint_normal
	ldr	r3, .L731+4
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L727
	mov	r3, #0
	ldr	r0, [r5]
	mov	r2, r3
	mov	r1, #60
	blx	r4
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L727:
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L732:
	.align	2
.L731:
	.word	.LC39
	.word	g_EventReportFunc
	UNWIND(.fnend)
	.size	MP2_DecSlice, .-MP2_DecSlice
	.align	2
	.global	MP2_GetHDR
	.type	MP2_GetHDR, %function
MP2_GetHDR:
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
	UNWIND(.pad #44)
	sub	sp, sp, #44
	add	r3, r0, #81920
	add	r6, r3, #408
	mov	r7, r0
	ldr	r9, [r3, #48]
	mov	r1, #32
	ldr	r10, [r3, #52]
	mov	r8, #0
	mov	r0, r6
	strb	r8, [r7, #16]
	bl	BsShow
	add	r5, r7, #77824
	ldr	r3, [r5, #2900]
	str	r3, [fp, #-80]
	mov	r4, r0
	mov	r0, r6
	bl	BsPos
	mov	r1, #32
	str	r0, [r5, #2960]
	mov	r0, r6
	bl	BsSkip
	movw	r3, #439
	cmp	r4, r3
	beq	.L801
	movw	r3, #435
	cmp	r4, r3
	cmpne	r4, #440
	bne	.L740
.L736:
	ldr	r3, [r5, #2956]
	cmp	r3, #1
	beq	.L802
.L737:
	movw	r3, #435
	cmp	r4, r3
	beq	.L742
.L805:
	cmp	r4, #436
	bcc	.L803
	movw	r3, #437
	cmp	r4, r3
	beq	.L746
	cmp	r4, #436
	bls	.L797
	movw	r3, #439
	cmp	r4, r3
	beq	.L797
	cmp	r4, #440
	bne	.L741
	ldr	r3, [r5, #2952]
	mov	r0, r6
	ldr	r4, [r5, #2848]
	add	r4, r3, r4
	bl	BsPos
	ldr	r2, .L809
	movw	r1, #291
	add	r3, r4, r0, lsr #3
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r7
	bl	group_of_pictures_header
	mov	r0, r6
	bl	BsResidBits
	cmp	r0, #0
	blt	.L804
.L797:
	mov	r6, #0
.L739:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L740:
	cmp	r4, #256
	beq	.L736
	movw	r3, #435
	cmp	r4, r3
	bne	.L805
.L742:
	ldr	r3, [r5, #2952]
	mov	r0, r6
	ldr	r4, [r5, #2848]
	add	r4, r3, r4
	bl	BsPos
	ldr	r2, .L809+4
	movw	r1, #258
	add	r3, r4, r0, lsr #3
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r7
	bl	sequence_header
	mov	r0, r6
	bl	BsResidBits
	cmp	r0, #0
	blt	.L806
	ldr	r6, [r5, #2900]
	ands	r6, r6, #7
	bne	.L751
	mov	r3, #1
	mov	r0, r10
	strb	r3, [r9]
	mov	r1, r9
	mov	r2, #196
	bl	memcpy
	ldr	r3, [r5, #2904]
	add	r3, r3, #1
	str	r3, [r5, #2904]
	b	.L739
.L803:
	cmp	r4, #256
	beq	.L744
	bcc	.L741
	cmp	r4, #432
	bls	.L741
	ldr	r3, [r5, #2952]
	mov	r0, r6
	ldr	r4, [r5, #2848]
	add	r4, r3, r4
	bl	BsPos
	ldr	r2, .L809+8
	movw	r1, #322
	add	r3, r4, r0, lsr #3
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r7
	bl	MP2_GetUsrData
	subs	r6, r0, #0
	bne	.L757
	add	r1, r7, #79872
	ldr	r0, [r7]
	add	r1, r1, #804
	bl	MP2_ClearCurPacket
	ldr	r3, .L809+12
	ldr	r4, [r3]
	cmp	r4, #0
	mvneq	r6, #0
	beq	.L739
	mov	r3, r6
	mov	r2, r6
	ldr	r0, [r7]
	mov	r1, #42
	blx	r4
	mvn	r6, #0
	b	.L739
.L744:
	ldr	r3, [r5, #2952]
	mov	r0, r6
	ldr	r4, [r5, #2848]
	add	r4, r3, r4
	bl	BsPos
	ldr	r2, .L809+16
	movw	r1, #306
	add	r3, r4, r0, lsr #3
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r7
	bl	picture_header
	mov	r0, r6
	bl	BsResidBits
	cmp	r0, #0
	bge	.L797
	ldr	r3, .L809+12
	ldr	r2, [fp, #-80]
	ldr	r4, [r3]
	str	r2, [r5, #2900]
	cmp	r4, #0
	beq	.L756
	mov	r3, #0
	mov	r1, #42
	mov	r2, r3
	ldr	r0, [r7]
	blx	r4
.L756:
	add	r1, r7, #79872
	ldr	r0, [r7]
	add	r1, r1, #804
	mvn	r6, #0
	bl	MP2_ClearCurPacket
	mov	r3, #256
	ldr	r2, .L809+20
	movw	r1, #314
	mov	r0, #1
	bl	dprint_normal
	b	.L739
.L802:
	ldr	r2, [r5, #2900]
	tst	r2, #4194304
	beq	.L737
	strb	r3, [r7, #16]
	orr	r2, r2, #8388608
	mov	r0, r7
	str	r2, [r5, #2900]
	mov	r2, #0
	str	r2, [r5, #2956]
	mov	r6, r3
	bl	MP2_ProtocolPPSCheck
	b	.L739
.L801:
	ldr	r3, .L809+24
	mov	r2, #32
	mov	r1, r6
	sub	r0, fp, #76
	ldr	r3, [r3, #52]
	blx	r3
	mov	r1, #32
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #32
	str	r0, [fp, #-84]
	sub	r0, fp, #76
	bl	BsGet
	ldr	r3, [fp, #-84]
	movw	r1, #20036
	movw	r2, #20553
	movt	r1, 17221
	movt	r2, 18515
	cmp	r0, r1
	cmpeq	r3, r2
	bne	.L736
	ldr	r6, [r5, #2956]
	cmp	r6, #1
	beq	.L807
.L738:
	mov	r3, #1
	mov	r6, #0
	strb	r3, [r7, #18]
	b	.L739
.L741:
	sub	r3, r4, #256
	sub	r3, r3, #1
	cmp	r3, #174
	bhi	.L759
	ldr	r8, [r5, #2896]
	cmp	r8, #0
	beq	.L760
.L762:
	ldr	r3, [r5, #2900]
	tst	r3, #589824
	beq	.L797
	orr	r3, r3, #4194304
	mov	r0, r7
	str	r3, [r5, #2900]
	mov	r7, #1
	mov	r1, r4
	str	r7, [r5, #2956]
	bl	MP2_DecSlice
	cmp	r0, r7
	mov	r6, r0
	beq	.L739
	mov	r3, r4
	mov	r0, r7
	ldr	r2, .L809+28
	movw	r1, #383
	bl	dprint_normal
	b	.L797
.L746:
	ldr	r3, [r5, #2952]
	mov	r0, r6
	ldr	r4, [r5, #2848]
	add	r4, r3, r4
	bl	BsPos
	ldr	r2, .L809+32
	movw	r1, #342
	add	r3, r4, r0, lsr #3
	mov	r0, #20
	bl	dprint_normal
	mov	r0, r7
	bl	extension
	mov	r0, r6
	bl	BsResidBits
	cmp	r0, #0
	bge	.L797
	ldr	r3, .L809+12
	ldr	r2, [fp, #-80]
	ldr	r4, [r3]
	str	r2, [r5, #2900]
	cmp	r4, #0
	beq	.L758
	mov	r3, #0
	mov	r1, #42
	mov	r2, r3
	ldr	r0, [r7]
	blx	r4
.L758:
	add	r1, r7, #79872
	ldr	r0, [r7]
	add	r1, r1, #804
	mvn	r6, #0
	bl	MP2_ClearCurPacket
	b	.L739
.L751:
	ldrb	r3, [r10]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L808
.L759:
	ldr	r3, .L809+12
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L797
.L796:
	mov	r3, #0
	ldr	r0, [r7]
	mov	r2, r3
	mov	r1, #42
	blx	r4
	mov	r6, #0
	b	.L739
.L757:
	ldr	r2, .L809+36
	mov	r1, #336
	mov	r0, #1
	bl	dprint_normal
	b	.L739
.L807:
	ldr	r3, [r5, #2900]
	tst	r3, #4194304
	beq	.L738
	strb	r6, [r7, #18]
	orr	r3, r3, #8388608
	strb	r6, [r7, #16]
	mov	r0, r7
	str	r3, [r5, #2900]
	str	r8, [r5, #2956]
	bl	MP2_ProtocolPPSCheck
	b	.L739
.L760:
	mov	r0, r7
	bl	MP2_GetSequenceInfo
	ldr	r6, [r5, #2948]
	cmp	r6, #0
	beq	.L739
	ldrb	r3, [r7, #17]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r6, r8
	beq	.L739
	ldr	r6, [r5, #2896]
	cmp	r6, #0
	bne	.L762
	b	.L739
.L808:
	mov	r2, #196
	mov	r1, r10
	mov	r0, r9
	bl	memcpy
	ldr	r2, .L809+12
	ldr	r3, [r5, #2900]
	ldr	r4, [r2]
	bic	r3, r3, #7
	str	r3, [r5, #2900]
	cmp	r4, #0
	bne	.L796
	b	.L797
.L804:
	ldr	r3, .L809+12
	ldr	r2, [fp, #-80]
	ldr	r4, [r3]
	str	r2, [r5, #2900]
	cmp	r4, #0
	beq	.L755
	mov	r3, #0
	mov	r1, #42
	mov	r2, r3
	ldr	r0, [r7]
	blx	r4
.L755:
	add	r1, r7, #79872
	ldr	r0, [r7]
	add	r1, r1, #804
	mvn	r6, #0
	bl	MP2_ClearCurPacket
	mov	r3, #440
	ldr	r2, .L809+40
	movw	r1, #299
	mov	r0, #1
	bl	dprint_normal
	b	.L739
.L806:
	ldr	r3, .L809+12
	ldr	r2, [fp, #-80]
	ldr	r4, [r3]
	str	r2, [r5, #2900]
	cmp	r4, #0
	beq	.L750
	mov	r3, #0
	mov	r1, #42
	mov	r2, r3
	ldr	r0, [r7]
	blx	r4
.L750:
	add	r1, r7, #79872
	ldr	r0, [r7]
	add	r1, r1, #804
	mvn	r6, #0
	bl	MP2_ClearCurPacket
	movw	r3, #435
	ldr	r2, .L809+44
	movw	r1, #266
	mov	r0, #1
	bl	dprint_normal
	b	.L739
.L810:
	.align	2
.L809:
	.word	.LC42
	.word	.LC40
	.word	.LC46
	.word	g_EventReportFunc
	.word	.LC44
	.word	.LC45
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC49
	.word	.LC48
	.word	.LC47
	.word	.LC43
	.word	.LC41
	UNWIND(.fnend)
	.size	MP2_GetHDR, .-MP2_GetHDR
	.align	2
	.global	MPEG2DEC_Decode
	.type	MPEG2DEC_Decode, %function
MPEG2DEC_Decode:
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
	ldr	r3, .L848
	add	r5, r0, #80896
	add	r6, r0, #45312
	add	r5, r5, #520
	add	r6, r6, #24
	mov	r4, r0
	ldr	r3, [r3, #52]
	mov	r2, #160
	mov	r0, r5
	blx	r3
	mov	r1, r5
	mov	r0, r6
	ldr	r2, [r4]
	bl	MP2_ReceivePacket
	cmp	r0, #1
	beq	.L812
	ldr	r2, .L848+4
	movw	r1, #2330
	mov	r0, #1
	mov	r5, #0
	bl	dprint_normal
.L813:
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L812:
	add	r7, r4, #77824
	add	r0, r4, #81920
	add	r0, r0, #408
	ldr	r2, [r7, #2864]
	ldr	r1, [r7, #2880]
	bl	BsInit
	ldr	r3, [r4, #28]
	ldr	r2, [r3, #816]
	cmp	r2, #1
	beq	.L843
.L814:
	ldr	r3, [r7, #2900]
	str	r3, [r7, #3072]
.L815:
	mov	r0, r4
	bl	MP2_GetHDR
	add	r0, r0, #1
	cmp	r0, #1
	bls	.L844
	mov	r0, r4
	bl	MP2_DecodingDecide
	subs	r5, r0, #0
	beq	.L845
	cmn	r5, #1
	beq	.L818
	mov	r0, r4
	bl	MP2_GetPictureInfo
	subs	r5, r0, #0
	bne	.L821
	add	r1, r6, #35328
	ldr	r0, [r4]
	add	r1, r1, #12
	bl	MP2_ClearCurPacket
	mov	r0, r4
	bl	MP2_ClearCurPic
	ldr	r3, .L848+8
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L822
	ldr	r0, [r4]
	mov	r3, r5
	mov	r2, r5
	mov	r1, #42
	blx	r6
.L822:
	ldr	r2, .L848+12
	movw	r1, #2383
	mov	r0, #1
	mov	r5, #0
	bl	dprint_normal
	b	.L813
.L844:
	ldr	r3, [r4, #28]
	ldr	r2, [r3, #816]
	cmp	r2, #1
	beq	.L846
.L817:
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L818
	add	r1, r6, #35328
	ldr	r0, [r4]
	add	r1, r1, #12
	mov	r5, #0
	bl	MP2_ClearCurPacket
	b	.L813
.L846:
	ldr	r3, [r3, #848]
	cmp	r3, #0
	beq	.L817
.L818:
	mov	r5, #0
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L843:
	ldr	r3, [r3, #848]
	cmp	r3, #1
	ldreq	r3, [r7, #3072]
	streq	r3, [r7, #2900]
	bne	.L814
	b	.L815
.L845:
	add	r1, r6, #35328
	ldr	r0, [r4]
	add	r1, r1, #12
	bl	MP2_ClearCurPacket
	mov	r0, r4
	bl	MP2_ClearCurPic
	ldr	r3, .L848+8
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L820
	ldr	r0, [r4]
	mov	r3, r5
	mov	r2, r5
	mov	r1, #42
	blx	r6
.L820:
	ldr	r2, .L848+16
	movw	r1, #2370
	mov	r0, #20
	mov	r5, #0
	bl	dprint_normal
	b	.L813
.L821:
	mov	r0, r4
	bl	MP2_DecNewPic
	subs	r5, r0, #0
	beq	.L847
	ldr	r5, [r7, #2848]
	ldr	r3, [r7, #2952]
	ldr	r2, [r7, #2864]
	mov	r5, r5, asl #3
	add	r3, r3, r2
	str	r3, [r7, #2952]
	b	.L813
.L847:
	ldr	r1, [r7, #2984]
	ldr	r0, [r4]
	bl	FSP_ClearLogicFs
	add	r1, r6, #35328
	add	r1, r1, #12
	ldr	r0, [r4]
	bl	MP2_ClearCurPacket
	mov	r0, r4
	bl	MP2_ClearCurPic
	ldr	r3, .L848+8
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L824
	ldr	r0, [r4]
	mov	r3, r5
	mov	r2, r5
	mov	r1, #42
	blx	r6
.L824:
	ldr	r2, .L848+20
	movw	r1, #2394
	mov	r0, #1
	bl	dprint_normal
	b	.L813
.L849:
	.align	2
.L848:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC50
	.word	g_EventReportFunc
	.word	.LC52
	.word	.LC51
	.word	.LC53
	UNWIND(.fnend)
	.size	MPEG2DEC_Decode, .-MPEG2DEC_Decode
	.align	2
	.global	MP2_GetPacketState
	.type	MP2_GetPacketState, %function
MP2_GetPacketState:
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
	ldrb	r3, [r0, #16]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r0, #2
	movne	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MP2_GetPacketState, .-MP2_GetPacketState
	.global	g_tmpusd
	.global	zigzag
	.global	default_intra_quantizer_matrix
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.8689, %object
	.size	__func__.8689, 18
__func__.8689:
	.ascii	"MP2_ArrangeVHBMem\000"
	.space	2
	.type	__FUNCTION__.8739, %object
	.size	__FUNCTION__.8739, 19
__FUNCTION__.8739:
	.ascii	"MP2_DecodingDecide\000"
	.space	1
	.type	CSWTCH.39, %object
	.size	CSWTCH.39, 12
CSWTCH.39:
	.word	5
	.word	1
	.word	2
	.type	frame_rate_Table, %object
	.size	frame_rate_Table, 64
frame_rate_Table:
	.word	0
	.word	23976
	.word	24000
	.word	25000
	.word	29970
	.word	30000
	.word	50000
	.word	59940
	.word	60000
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.data
	.align	2
.LANCHOR2 = . + 0
	.type	default_intra_quantizer_matrix, %object
	.size	default_intra_quantizer_matrix, 64
default_intra_quantizer_matrix:
	.byte	8
	.byte	16
	.byte	19
	.byte	22
	.byte	26
	.byte	27
	.byte	29
	.byte	34
	.byte	16
	.byte	16
	.byte	22
	.byte	24
	.byte	27
	.byte	29
	.byte	34
	.byte	37
	.byte	19
	.byte	22
	.byte	26
	.byte	27
	.byte	29
	.byte	34
	.byte	34
	.byte	38
	.byte	22
	.byte	22
	.byte	26
	.byte	27
	.byte	29
	.byte	34
	.byte	37
	.byte	40
	.byte	22
	.byte	26
	.byte	27
	.byte	29
	.byte	32
	.byte	35
	.byte	40
	.byte	48
	.byte	26
	.byte	27
	.byte	29
	.byte	32
	.byte	35
	.byte	40
	.byte	48
	.byte	58
	.byte	26
	.byte	27
	.byte	29
	.byte	34
	.byte	38
	.byte	46
	.byte	56
	.byte	69
	.byte	27
	.byte	29
	.byte	35
	.byte	38
	.byte	46
	.byte	56
	.byte	69
	.byte	83
	.type	zigzag, %object
	.size	zigzag, 64
zigzag:
	.byte	0
	.byte	1
	.byte	8
	.byte	16
	.byte	9
	.byte	2
	.byte	3
	.byte	10
	.byte	17
	.byte	24
	.byte	32
	.byte	25
	.byte	18
	.byte	11
	.byte	4
	.byte	5
	.byte	12
	.byte	19
	.byte	26
	.byte	33
	.byte	40
	.byte	48
	.byte	41
	.byte	34
	.byte	27
	.byte	20
	.byte	13
	.byte	6
	.byte	7
	.byte	14
	.byte	21
	.byte	28
	.byte	35
	.byte	42
	.byte	49
	.byte	56
	.byte	57
	.byte	50
	.byte	43
	.byte	36
	.byte	29
	.byte	22
	.byte	15
	.byte	23
	.byte	30
	.byte	37
	.byte	44
	.byte	51
	.byte	58
	.byte	59
	.byte	52
	.byte	45
	.byte	38
	.byte	31
	.byte	39
	.byte	46
	.byte	53
	.byte	60
	.byte	61
	.byte	54
	.byte	47
	.byte	55
	.byte	62
	.byte	63
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"%s arrange fs pool failed!\012\000" )
.LC1:
	ASCII(.ascii	"ERROR: frm %d, integrality: %#x\012\000" )
	.space	3
.LC2:
	ASCII(.ascii	"ERROR: frm %d, No Img buffer is allocated\012\000" )
	.space	1
.LC3:
	ASCII(.ascii	"----------------- mp2 Imode -> %d -----------------" )
	ASCII(.ascii	"-\012\000" )
	.space	2
.LC4:
	ASCII(.ascii	"frm %d pic type %d struct is %d total pos %#x\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"NOTE: Drop non-I, cur is B\012\000" )
.LC6:
	ASCII(.ascii	"NOTE: Drop non-I, cur is P\012\000" )
.LC7:
	ASCII(.ascii	"NOTE: Drop non-I\012\000" )
	.space	2
.LC8:
	ASCII(.ascii	"NOTE: Drop B\012\000" )
	.space	2
.LC9:
	ASCII(.ascii	"%s %d pFwdImg = NULL,  pBwdImg = NULL!!\012\000" )
	.space	3
.LC10:
	ASCII(.ascii	"fuction return value is null,%s %d !!\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"dec P frame, fwd ref err(%d) > ref_thr(%d)\012\000" )
.LC12:
	ASCII(.ascii	"dec B frame, fwd ref err(%d) > ref_thr(%d)\012\000" )
.LC13:
	ASCII(.ascii	"dec B frame, bwd ref err(%d) > ref_thr(%d)\012\000" )
.LC14:
	ASCII(.ascii	"Protocol %d\012\000" )
	.space	3
.LC15:
	ASCII(.ascii	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d" )
	ASCII(.ascii	",new w/h = %d/%d\012\000" )
	.space	3
.LC16:
	ASCII(.ascii	"new seq size %dx%d\012\000" )
.LC17:
	ASCII(.ascii	"get frame store fail!\012\000" )
	.space	1
.LC18:
	ASCII(.ascii	"line: %d, pImage is NULL!\012\000" )
	.space	1
.LC19:
	ASCII(.ascii	"ERROR: frm %d, lost one field\012\000" )
	.space	1
.LC20:
	ASCII(.ascii	"ERROR: frm %d, lost one field flg = %d, last_struct" )
	ASCII(.ascii	" = %d\012\000" )
	.space	2
.LC21:
	ASCII(.ascii	"Fatal Error: frm%d, get image buffer failed\012\000" )
	.space	3
.LC22:
	ASCII(.ascii	"Chan:%d dec_pts: %lld Usertag: %lld\012\000" )
	.space	3
.LC23:
	ASCII(.ascii	"line: %d(pCur, pFwd, pBwd)(%p, %p, %p)\012\000" )
.LC24:
	ASCII(.ascii	"pCur->pstDecodeFs = NULL, CurFsID %d, FwdFsID %d, B" )
	ASCII(.ascii	"wdFsID %d\012\000" )
	.space	2
.LC25:
	ASCII(.ascii	"dec addr: cur,cur2d,fwd,bwd,pmv = %p,%p,%p,%p,%p\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC26:
	ASCII(.ascii	"\012mpeg2 copy last 3 bytes of the first packet!\012" )
	ASCII(.ascii	"\012\000" )
.LC27:
	ASCII(.ascii	"pMp2CodecInfo->pUsrDatArray[%d] is null\012\000" )
	.space	3
.LC28:
	ASCII(.ascii	"ERROR: unsupported profile %d\012\000" )
	.space	1
.LC29:
	ASCII(.ascii	"ERROR: unsupported level %d\012\000" )
	.space	3
.LC30:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC31:
	ASCII(.ascii	"ERROR: frm %d, Invalid packet pointer!\012\000" )
.LC32:
	ASCII(.ascii	"line %d, pPacket->StreamPack[1].IsLastSeg = %d\012\000" )
.LC33:
	ASCII(.ascii	"pImg is null, pCurImg %#x pBwdImg %#x pFwdImg %#x\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC34:
	ASCII(.ascii	"image err(%d) > out_thr(%d), fs %d not display.\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC35:
	ASCII(.ascii	"ERROR,pBwdImg == NULL || pToQueImg == NULL\012\000" )
.LC36:
	ASCII(.ascii	"Chan:%d exg_pts: %lld <-> %lld\012\000" )
.LC37:
	ASCII(.ascii	"Slice num = %d >= %d\012\000" )
	.space	2
.LC38:
	ASCII(.ascii	"seg info is wrong! IsLastSeg[0] = %d, IsLastSeg[1] " )
	ASCII(.ascii	"= %d\012\000" )
	.space	3
.LC39:
	ASCII(.ascii	"MP2_WriteSliceInfo Failed!\012\000" )
.LC40:
	ASCII(.ascii	"found sh %#x\012\000" )
	.space	2
.LC41:
	ASCII(.ascii	"SEQUENCE_HEADER_CODE Bitstream is not enough!\012\000" )
	.space	1
.LC42:
	ASCII(.ascii	"found gh %#x\012\000" )
	.space	2
.LC43:
	ASCII(.ascii	"GROUP_START_CODE Bitstream is not enough!\012\000" )
	.space	1
.LC44:
	ASCII(.ascii	"found ph %#x\012\000" )
	.space	2
.LC45:
	ASCII(.ascii	"PICTURE_START_CODE Bitstream is not enough!\012\000" )
	.space	3
.LC46:
	ASCII(.ascii	"found ud %#x\012\000" )
	.space	2
.LC47:
	ASCII(.ascii	"cann't get ud pointer\012\000" )
	.space	1
.LC48:
	ASCII(.ascii	"found ext %#x\012\000" )
	.space	1
.LC49:
	ASCII(.ascii	"MP2_DecSlice is wrong!\012\000" )
.LC50:
	ASCII(.ascii	"line %d, MP2_ReceivePacket receive packet failed!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC51:
	ASCII(.ascii	"MP2 Decode Decide is wrong!\012\000" )
	.space	3
.LC52:
	ASCII(.ascii	"MP2 get picture info is wrong!\012\000" )
.LC53:
	ASCII(.ascii	"MP2 dec new pic failed!\012\000" )
	.bss
	.align	2
.LANCHOR1 = . + 0
	.type	g_tmpusd, %object
	.size	g_tmpusd, 1024
g_tmpusd:
	.space	1024
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
