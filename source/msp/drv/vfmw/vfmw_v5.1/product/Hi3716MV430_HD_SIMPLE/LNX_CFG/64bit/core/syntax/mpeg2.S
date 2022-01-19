#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"mpeg2.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	MP2_SearchStartCode.part.2, %function
MP2_SearchStartCode.part.2:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	x4, x20, x19, sxtw
	add	x2, x20, 2
	.p2align 2
.L12:
	cmp	x4, x2
	bls	.L2
.L15:
	ldrb	w3, [x2]
	cmp	w3, 1
	bls	.L14
.L8:
	add	x2, x2, 3
	cmp	x4, x2
	bhi	.L15
.L2:
	sub	w0, w19, #3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L14:
	cbnz	w3, .L5
	ldrb	w3, [x2, -1]
	cbnz	w3, .L6
	add	x2, x2, 1
	b	.L12
	.p2align 3
.L5:
	bne	.L12
	ldrb	w0, [x2, -2]
	cbnz	w0, .L8
	ldrb	w0, [x2, -1]
	cbnz	w0, .L8
	sub	x2, x2, x20
	sub	w0, w2, #2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L6:
	ldrb	w1, [x2, 1]
	add	x0, x2, 2
	add	x2, x2, 4
	cmp	w1, wzr
	csel	x2, x2, x0, ne
	b	.L12
	.size	MP2_SearchStartCode.part.2, .-MP2_SearchStartCode.part.2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	MP2_DecSlice.part.5, %function
MP2_DecSlice.part.5:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC1
	mov	w1, 3070
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC2
	ldr	x4, [x0]
	cbz	x4, .L17
	ldr	w0, [x19]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 60
	blr	x4
.L17:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_DecSlice.part.5, .-MP2_DecSlice.part.5
	.align	3
.LC1:
	.xword	.LC0
	.align	3
.LC2:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_ArrangeVHBMem
	.type	MP2_ArrangeVHBMem, %function
MP2_ArrangeVHBMem:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 81920
	bl	_mcount
	ldr	x3, .LC3
	mov	x2, 36
	mov	w1, 0
	ldr	x20, [x21, 112]
	add	x0, x29, 56
	ldr	x3, [x3, 96]
	blr	x3
	ldp	w7, w5, [x20, 48]
	ldr	x6, [x19, 32]
	mov	w3, 3
	stp	w7, w5, [x29, 72]
	str	w3, [x29, 56]
	mov	w4, 2
	ldr	w8, [x6, 16]
	mov	w2, 0
	ldr	w0, [x19]
	add	x1, x29, 56
	cmp	w8, 24
	mov	w8, 8
	csinc	w3, w3, wzr, ne
	str	w3, [x29, 80]
	stp	w7, w5, [x29, 64]
	ldr	w3, [x6, 16]
	strb	w8, [x29, 61]
	cmp	w3, 24
	csinc	w3, w4, wzr, ne
	str	w3, [x29, 84]
	bl	FSP_ArrangeFsPool
	cmp	w0, 2
	beq	.L30
	mov	w1, 1
	cbz	w0, .L25
	ldr	x3, .LC4
	mov	w1, 186
	ldr	x2, .LC6
	mov	w0, 0
	bl	dprint_normal
	mov	w1, 0
.L25:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	mov	w0, w1
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L30:
	add	x0, x21, 128
	bl	ResetVoQueue
	mov	w1, 0
	b	.L25
	.size	MP2_ArrangeVHBMem, .-MP2_ArrangeVHBMem
	.align	3
.LC3:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC4:
	.xword	.LANCHOR0
	.align	3
.LC6:
	.xword	.LC5
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_DecodingDecide
	.type	MP2_DecodingDecide, %function
MP2_DecodingDecide:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 45056
	mov	w21, -1
	bl	_mcount
	add	x0, x19, 296
	add	x0, x0, 32768
	ldr	w4, [x0, 2636]
	tbnz	x4, 23, .L109
.L32:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L109:
	add	x25, x20, 81920
	ldr	x23, [x25, 112]
	ldrb	w1, [x23, 9]
	cmp	w1, 3
	beq	.L33
	ldr	w0, [x0, 2648]
	cmp	w0, 1
	beq	.L33
	ands	w21, w4, 255
	bne	.L110
.L35:
	add	x22, x19, 296
	add	x22, x22, 32768
	ldr	w0, [x22, 2704]
	cbz	w0, .L111
	ldr	w0, [x22, 2624]
	sub	w0, w0, #2
	cmp	w0, 1
	ldr	x0, [x20, 32]
	ldr	w3, [x0, 8]
	bls	.L112
.L39:
	add	x0, x19, 296
	sub	w1, w3, #1
	add	x0, x0, 32768
	cmp	w1, 3
	str	w3, [x0, 2624]
	bls	.L113
	ldrb	w26, [x23, 22]
	mov	w24, 1
	ldrb	w27, [x23, 9]
.L48:
	add	x22, x19, 296
	add	x0, x25, 736
	add	x22, x22, 32768
	ldr	w1, [x22, 2568]
	ldr	w25, [x22, 2708]
	ldr	w28, [x22, 2644]
	add	w25, w25, w1
	bl	BsPos
	ldr	x2, .LC16
	add	w6, w25, w0, lsr 3
	mov	w1, 580
	mov	w5, w27
	mov	w4, w26
	mov	w3, w28
	mov	w0, 16
	bl	dprint_normal
	ldr	w1, [x22, 2636]
	mov	w0, -14155777
	and	w0, w1, w0
	str	w0, [x22, 2636]
	ldr	x0, [x20, 32]
	ldr	w0, [x0, 640]
	cmp	w0, 1
	beq	.L114
	ldr	w0, [x22, 2696]
	cbz	w0, .L115
	cmp	w0, 1
	bls	.L116
.L59:
	add	x22, x19, 296
	ldr	w0, [x20]
	add	x22, x22, 32768
	ldr	w1, [x22, 2732]
	bl	FSP_GetFsImagePtr
	mov	x25, x0
	ldr	w1, [x22, 2736]
	ldr	w0, [x20]
	bl	FSP_GetFsImagePtr
	cmp	x25, xzr
	ccmp	x0, xzr, 4, ne
	beq	.L117
	ldrb	w1, [x23, 22]
	cmp	w1, 2
	beq	.L118
	cmp	w1, 3
	beq	.L119
.L67:
	cbnz	w24, .L81
	ldrb	w0, [x23, 9]
	cmp	w0, 3
	beq	.L73
	add	x0, x19, 296
	add	x0, x0, 32768
	ldr	w0, [x0, 2648]
	cbnz	w0, .L32
.L73:
	ldrb	w0, [x23, 27]
	cmp	w0, 1
	beq	.L120
	ldrb	w0, [x23, 18]
	cmp	w0, 1
	beq	.L121
	add	x1, x19, 296
	add	x1, x1, 32768
	ldr	w0, [x1, 2820]
	add	w0, w0, 1
	str	w0, [x1, 2820]
	lsl	w0, w0, 1
	str	w0, [x1, 2816]
.L75:
	add	x20, x20, 77824
	add	x19, x19, 296
	add	x19, x19, 32768
	ldr	w0, [x20, 3108]
	add	w0, w0, 1
	str	w0, [x20, 3108]
	ldr	w0, [x19, 2644]
	add	w0, w0, 1
	str	w0, [x19, 2644]
	b	.L32
	.p2align 3
.L110:
	ldr	x0, .LC7
	ldr	x5, [x0]
	cbz	x5, .L36
	ldr	w0, [x20]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 22
	blr	x5
	add	x0, x19, 296
	add	x0, x0, 32768
	ldr	w4, [x0, 2636]
.L36:
	add	x19, x19, 296
	ldr	x2, .LC9
	add	x19, x19, 32768
	mov	w1, 485
	mov	w0, 20
	mov	w21, 0
	ldr	w3, [x19, 2644]
	bl	dprint_normal
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L33:
	ldr	w0, [x20, 4]
	ands	w21, w4, 255
	add	w0, w0, 1
	str	w0, [x20, 4]
	beq	.L35
	b	.L110
	.p2align 3
.L113:
	ldr	x0, .LC14
	ldrb	w0, [x0,w1,uxtw]
	adr	x1, .Lrtx44
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx44:
	.section	.rodata
	.align	0
	.align	2
.L44:
	.byte	(.L43 - .Lrtx44) / 4
	.byte	(.L45 - .Lrtx44) / 4
	.byte	(.L46 - .Lrtx44) / 4
	.byte	(.L47 - .Lrtx44) / 4
	.text
	.p2align 3
.L115:
	ldrb	w1, [x23, 22]
	sub	w0, w1, #2
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L122
.L62:
	cmp	w1, 3
	bne	.L59
	ldr	x2, .LC24
	mov	w1, 607
	mov	w0, 1
	mov	w24, 0
	bl	dprint_normal
	b	.L59
	.p2align 3
.L119:
	cbz	x25, .L123
	ldr	x1, [x20, 32]
	ldr	w3, [x25, 96]
	ldr	w4, [x1]
	cmp	w3, w4
	bhi	.L69
	ldr	w3, [x0, 96]
	cbz	x0, .L72
	cmp	w4, w3
	bcs	.L67
.L72:
	ldr	x2, .LC35
	mov	w1, 646
	mov	w0, 1
	bl	dprint_normal
	b	.L32
	.p2align 3
.L46:
	ldrb	w26, [x23, 22]
	mov	w24, 0
	ldrb	w27, [x23, 9]
	b	.L48
	.p2align 3
.L45:
	ldrb	w26, [x23, 22]
	sub	w0, w26, #2
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L124
.L106:
	ldrb	w27, [x23, 9]
	mov	w24, 1
	b	.L48
	.p2align 3
.L43:
	ldrb	w26, [x23, 22]
	cmp	w26, 3
	bne	.L106
	ldrb	w26, [x23, 9]
	cmp	w26, 3
	beq	.L125
.L54:
	add	x0, x19, 296
	mov	w24, 0
	add	x0, x0, 32768
	ldr	w1, [x0, 2648]
	cmp	w1, wzr
	cset	w1, eq
	str	w1, [x0, 2648]
	ldrb	w26, [x23, 22]
	ldrb	w27, [x23, 9]
	b	.L48
	.p2align 3
.L47:
	ldrb	w0, [x23, 22]
	cmp	w0, 1
	mov	w26, w0
	beq	.L126
	cmp	w0, 3
	beq	.L127
.L53:
	cmp	w0, 2
	beq	.L57
	mov	w26, w0
	b	.L106
	.p2align 3
.L114:
	ldr	w1, [x22, 2696]
	cbnz	w1, .L59
	ldrb	w1, [x23, 22]
	cmp	w1, 3
	beq	.L128
	cmp	w1, 2
	bne	.L59
	ldr	x2, .LC20
	mov	w1, 595
	bl	dprint_normal
	b	.L59
	.p2align 3
.L112:
	cmp	w3, 1
	ccmp	w3, 4, 4, hi
	bne	.L39
	ldr	x2, .LC13
	mov	w1, 498
	mov	w0, 3
	bl	dprint_normal
	ldrb	w0, [x23, 22]
	cmp	w0, 1
	beq	.L102
	ldr	w0, [x22, 2636]
	ldr	w1, [x22, 2736]
	orr	w0, w0, 128
	str	w0, [x22, 2636]
	ldr	w0, [x20]
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	cbz	x0, .L41
	ldr	w0, [x20]
	ldr	x1, [x24, 168]
	bl	FreeUsdByDec
	ldr	w0, [x20]
	ldr	x1, [x24, 176]
	bl	FreeUsdByDec
	ldr	w0, [x20]
	ldr	x1, [x24, 184]
	bl	FreeUsdByDec
	ldr	w0, [x20]
	ldr	x1, [x24, 192]
	bl	FreeUsdByDec
	stp	xzr, xzr, [x24, 168]
	stp	xzr, xzr, [x24, 184]
	ldr	w0, [x20]
	ldr	w1, [x22, 2736]
	bl	FSP_ClearLogicFs
	ldr	w0, [x20]
	ldr	w1, [x22, 2732]
	bl	FSP_ClearLogicFs
	str	wzr, [x22, 2732]
	str	wzr, [x22, 2736]
.L41:
	add	x0, x19, 296
	add	x0, x0, 32768
	str	wzr, [x0, 2696]
.L102:
	ldr	x0, [x20, 32]
	ldr	w3, [x0, 8]
	b	.L39
	.p2align 3
.L111:
	ldr	x2, .LC11
	mov	w1, 490
	ldr	w3, [x22, 2644]
	mov	w0, 1
	bl	dprint_normal
	b	.L32
	.p2align 3
.L118:
	cbz	x25, .L65
	ldr	x0, [x20, 32]
	ldr	w3, [x25, 96]
	ldr	w4, [x0]
	cmp	w3, w4
	bls	.L67
	ldr	x2, .LC31
	mov	w1, 631
	mov	w0, 1
	bl	dprint_normal
	b	.L32
	.p2align 3
.L81:
	mov	w21, 1
	b	.L32
	.p2align 3
.L117:
	ldr	x3, .LC25
	mov	w4, 616
	ldr	x2, .LC27
	mov	w1, w4
	add	x3, x3, 24
	mov	w0, 1
	bl	dprint_normal
	b	.L32
.L120:
	add	x0, x19, 296
	ldrb	w1, [x23, 10]
	add	x0, x0, 32768
	ldrb	w2, [x23, 16]
	add	w2, w2, w1
	ldr	w1, [x0, 2820]
	add	w2, w2, 1
	add	w1, w2, w1
	str	w1, [x0, 2820]
	lsl	w1, w1, 1
	str	w1, [x0, 2816]
	b	.L75
.L123:
	ldr	x0, [x20, 32]
	ldr	w3, [x25, 96]
	ldr	w4, [x0]
.L69:
	ldr	x2, .LC33
	mov	w1, 640
	mov	w0, 1
	bl	dprint_normal
	b	.L32
.L126:
	str	wzr, [x20, 12]
	ldrb	w0, [x23, 22]
	cmp	w0, 3
	bne	.L53
.L56:
	ldrb	w27, [x23, 9]
	cmp	w27, 3
	bne	.L54
	mov	w26, w27
	mov	w24, 0
	b	.L48
.L124:
	cmp	w26, 2
	beq	.L129
.L51:
	ldrb	w27, [x23, 9]
	cmp	w27, 3
	bne	.L54
	mov	w24, 0
	b	.L48
.L121:
	add	x0, x19, 296
	add	x0, x0, 32768
	ldr	w2, [x0, 2820]
	ldr	w1, [x0, 2816]
	add	w2, w2, 1
	str	w2, [x0, 2820]
	ldrb	w2, [x23, 16]
	add	w2, w2, 2
	add	w1, w2, w1
	str	w1, [x0, 2816]
	b	.L75
.L57:
	mov	w24, 1
	str	w24, [x20, 12]
	ldrb	w26, [x23, 22]
	ldrb	w27, [x23, 9]
	b	.L48
.L122:
	ldr	x2, .LC22
	mov	w1, 601
	mov	w0, 1
	mov	w24, 0
	bl	dprint_normal
	b	.L59
.L127:
	ldr	w0, [x20, 12]
	cbnz	w0, .L106
	b	.L56
.L128:
	ldr	x2, .LC18
	mov	w1, 589
	mov	w24, 0
	bl	dprint_normal
	b	.L59
.L65:
	ldr	x3, .LC25
	mov	w4, 626
	ldr	x2, .LC29
	mov	w1, w4
	add	x3, x3, 24
	mov	w0, 1
	bl	dprint_normal
	b	.L32
.L125:
	mov	w27, w26
	mov	w24, 0
	b	.L48
.L129:
	ldrb	w0, [x19, 297]
	cmp	w0, 3
	beq	.L51
	ldrb	w24, [x19, 296]
	cmp	w24, 1
	bne	.L51
	ldrb	w27, [x23, 9]
	b	.L48
.L116:
	ldrb	w1, [x23, 22]
	b	.L62
	.size	MP2_DecodingDecide, .-MP2_DecodingDecide
	.align	3
.LC7:
	.xword	g_EventReportFunc
	.align	3
.LC9:
	.xword	.LC8
	.align	3
.LC11:
	.xword	.LC10
	.align	3
.LC13:
	.xword	.LC12
	.align	3
.LC14:
	.xword	.L44
	.align	3
.LC16:
	.xword	.LC15
	.align	3
.LC18:
	.xword	.LC17
	.align	3
.LC20:
	.xword	.LC19
	.align	3
.LC22:
	.xword	.LC21
	.align	3
.LC24:
	.xword	.LC23
	.align	3
.LC25:
	.xword	.LANCHOR0
	.align	3
.LC27:
	.xword	.LC26
	.align	3
.LC29:
	.xword	.LC28
	.align	3
.LC31:
	.xword	.LC30
	.align	3
.LC33:
	.xword	.LC32
	.align	3
.LC35:
	.xword	.LC34
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_GetSequenceInfo
	.type	MP2_GetSequenceInfo, %function
MP2_GetSequenceInfo:
	sub	sp, sp, #128
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	stp	x23, x24, [sp, 64]
	str	x25, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 45056
	add	x23, x19, 81920
	bl	_mcount
	str	wzr, [x29, 100]
	add	x0, x21, 296
	add	x0, x0, 32768
	stp	wzr, wzr, [x29, 92]
	ldp	x20, x24, [x23, 112]
	ldr	w3, [x0, 2692]
	cmp	w3, 1
	beq	.L132
	cmp	w3, 2
	bne	.L191
	ldr	w1, [x0, 2636]
	mov	w0, 1769472
	and	w0, w1, w0
	cmp	w0, 589824
	beq	.L135
.L134:
	ldr	x2, .LC37
	mov	w1, 948
	mov	w0, 15
	bl	dprint_normal
	add	x0, x21, 296
	add	x0, x0, 32768
	ldr	w0, [x0, 2692]
	cmp	w0, 1
	beq	.L192
.L137:
	ldr	w0, [x20, 48]
	add	x1, x21, 296
	add	x1, x1, 32768
	add	w0, w0, 15
	lsr	w0, w0, 4
	str	w0, [x20, 56]
	ldr	w2, [x1, 2692]
	cmp	w2, 2
	beq	.L193
	ldr	w3, [x20, 52]
	add	w2, w3, 15
	lsr	w2, w2, 4
	stp	w2, wzr, [x20, 60]
	ldr	w1, [x1, 2692]
	cmp	w1, 2
	beq	.L194
.L140:
	add	x1, x21, 296
	add	x1, x1, 32768
	ldr	w1, [x1, 2704]
	cbz	w1, .L142
	ldr	w3, [x24, 56]
	cmp	w0, w3
	beq	.L195
.L142:
	ldr	w0, [x19]
	ldr	x25, .LC38
	sxtw	x1, w0
	lsl	x2, x1, 2
	sub	x2, x2, x1
	lsl	x3, x2, 5
	add	x2, x2, x3
	add	x1, x2, x1
	add	x1, x25, x1
	ldr	w2, [x1, 64]
	cbz	w2, .L196
.L144:
	add	x22, x21, 296
	add	x22, x22, 32768
	ldr	w1, [x22, 2736]
	bl	FSP_GetFsImagePtr
	mov	x25, x0
	cbz	x0, .L145
	ldr	w0, [x19]
	ldr	x1, [x25, 168]
	bl	FreeUsdByDec
	ldr	w0, [x19]
	ldr	x1, [x25, 176]
	bl	FreeUsdByDec
	ldr	w0, [x19]
	ldr	x1, [x25, 184]
	bl	FreeUsdByDec
	ldr	w0, [x19]
	ldr	x1, [x25, 192]
	bl	FreeUsdByDec
	stp	xzr, xzr, [x25, 168]
	stp	xzr, xzr, [x25, 184]
	ldr	w0, [x19]
	ldr	w1, [x22, 2736]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19]
	ldr	w1, [x22, 2732]
	bl	FSP_ClearLogicFs
	str	wzr, [x22, 2732]
	str	wzr, [x22, 2736]
.L145:
	add	x22, x21, 296
	add	x1, x23, 128
	add	x22, x22, 32768
	str	wzr, [x22, 2696]
	ldr	w0, [x19]
	bl	FSP_ClearNotInVoQueue
	ldr	w0, [x22, 2704]
	cbz	w0, .L146
	ldr	w0, [x24, 56]
	cbz	w0, .L146
	ldr	w0, [x24, 60]
	cbnz	w0, .L197
	.p2align 2
.L146:
	ldr	w0, [x19]
	add	x3, x29, 100
	add	x2, x29, 96
	add	x1, x29, 92
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x19, 32]
	ldr	w3, [x0, 736]
	cmp	w3, 1
	bne	.L188
	ldr	w0, [x29, 100]
	cmp	w0, wzr
	ble	.L198
.L149:
	add	sp, x29, 0
	mov	w0, 1
	strb	w0, [x19, 17]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L191:
	ldr	w1, [x0, 2636]
	mov	w2, 3538944
	tst	w1, w2
	beq	.L135
	mov	w2, 2
	str	w2, [x0, 2692]
	tbnz	x1, 17, .L136
	orr	w1, w1, w2
	str	w1, [x0, 2636]
.L136:
	mov	w3, 2
	tbnz	x1, 20, .L134
	add	x0, x21, 296
	orr	w1, w1, 16
	add	x0, x0, 32768
	str	w1, [x0, 2636]
	b	.L134
	.p2align 3
.L135:
	add	x0, x21, 296
	mov	w1, 1
	add	x0, x0, 32768
	mov	w3, w1
	str	w1, [x0, 2692]
	b	.L134
	.p2align 3
.L188:
	ldr	x23, .LC42
.L148:
	add	x22, x21, 296
	strb	wzr, [x19, 17]
	add	x22, x22, 32768
	mov	w1, 0
	mov	x0, x19
	str	wzr, [x22, 2704]
	str	wzr, [x22, 2720]
	bl	MP2_ArrangeVHBMem
	str	w0, [x22, 2704]
	ldr	x2, .LC44
	mov	w1, 1020
	ldp	w3, w4, [x20, 56]
	mov	w0, 1
	lsl	w4, w4, 4
	lsl	w3, w3, 4
	bl	dprint_normal
	ldr	x4, [x23]
	cbz	x4, .L189
	ldp	w2, w1, [x20, 56]
	ldp	w5, w3, [x24, 56]
	ldr	w0, [x19]
	strh	w2, [x29, 108]
	add	x2, x29, 104
	strh	w1, [x29, 110]
	mov	w1, 1
	strh	w3, [x29, 106]
	mov	w3, 8
	strh	w5, [x29, 104]
	blr	x4
.L189:
	ldr	w1, [x22, 2704]
.L143:
	add	x21, x21, 296
	add	sp, x29, 0
	add	x21, x21, 32768
	str	w1, [x21, 2632]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L132:
	mov	w1, 18
	ldr	w2, [x0, 2636]
	movk	w1, 0x12, lsl 16
	and	w1, w2, w1
	cmp	w1, 1179648
	bne	.L134
	mov	w3, 2
	str	w3, [x0, 2692]
	b	.L134
	.p2align 3
.L193:
	ldrb	w2, [x20, 27]
	cbnz	w2, .L139
	ldr	w3, [x20, 52]
	add	w2, w3, 31
	lsr	w2, w2, 5
	lsl	w2, w2, 1
	stp	w2, wzr, [x20, 60]
	ldr	w1, [x1, 2692]
	cmp	w1, 2
	bne	.L140
	add	w1, w3, 15
	mov	w3, w2
	lsr	w1, w1, 4
	b	.L141
	.p2align 3
.L192:
	mov	w2, 3
	mov	w1, 5
	strb	w0, [x20, 27]
	strb	w0, [x20, 18]
	strb	w2, [x20, 9]
	strb	w0, [x20, 11]
	strb	w0, [x20, 28]
	strb	wzr, [x20, 12]
	strb	wzr, [x20, 13]
	strb	wzr, [x20, 14]
	strb	wzr, [x20, 15]
	strb	wzr, [x20, 8]
	str	w1, [x20, 144]
	b	.L137
	.p2align 3
.L196:
	ldr	x0, .LC39
	mov	w2, 1
	str	w2, [x1, 64]
	ldr	x0, [x0]
	ldr	w22, [x19]
	blr	x0
	sxtw	x1, w22
	lsl	x2, x1, 2
	sub	x2, x2, x1
	lsl	x3, x2, 5
	add	x2, x2, x3
	add	x1, x2, x1
	add	x1, x25, x1
	str	w0, [x1, 68]
	ldr	w0, [x19]
	b	.L144
	.p2align 3
.L194:
	ldrb	w1, [x20, 27]
	cbnz	w1, .L140
	add	w3, w3, 31
	mov	w1, w2
	lsr	w3, w3, 5
	lsl	w3, w3, 1
.L141:
	sub	w1, w3, w1
	str	w1, [x20, 64]
	b	.L140
	.p2align 3
.L139:
	ldr	w2, [x20, 52]
	add	w2, w2, 15
	lsr	w2, w2, 4
	stp	w2, wzr, [x20, 60]
	b	.L140
	.p2align 3
.L197:
	str	wzr, [x22, 2704]
	b	.L146
	.p2align 3
.L198:
	ldr	w0, [x29, 96]
	cmp	w0, 32
	bgt	.L149
	ldr	x0, [x19, 40]
	cbnz	x0, .L149
	ldr	w4, [x19, 4]
	cbz	w4, .L188
	ldr	w7, [x20, 56]
	cbz	w7, .L188
	ldr	w6, [x19, 24]
	ldr	w0, [x20, 60]
	cmp	w0, w6
	beq	.L188
	ldr	w5, [x19, 20]
	cmp	w7, w5
	beq	.L188
	ldr	x2, .LC41
	mov	w1, 1007
	str	w0, [sp]
	mov	w0, w3
	bl	dprint_normal
	ldr	x23, .LC42
	ldr	w0, [x20, 60]
	str	w0, [x19, 24]
	ldr	x4, [x23]
	ldr	w0, [x20, 56]
	str	w0, [x19, 20]
	cbz	x4, .L148
	ldr	w0, [x19]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 48
	blr	x4
	b	.L148
	.p2align 3
.L195:
	ldr	w0, [x24, 60]
	cmp	w0, w2
	bne	.L142
	b	.L143
	.size	MP2_GetSequenceInfo, .-MP2_GetSequenceInfo
	.align	3
.LC37:
	.xword	.LC36
	.align	3
.LC38:
	.xword	g_VfmwChanStat
	.align	3
.LC39:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC41:
	.xword	.LC40
	.align	3
.LC42:
	.xword	g_EventReportFunc
	.align	3
.LC44:
	.xword	.LC43
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_CalcRealEncFrameRate
	.type	MP2_CalcRealEncFrameRate, %function
MP2_CalcRealEncFrameRate:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 81920
	ldr	x3, [x0, 112]
	ldrb	w0, [x3, 22]
	cmp	w0, 1
	beq	.L204
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L204:
	add	x19, x19, 45056
	ldr	w5, [x3, 72]
	add	x2, x19, 296
	add	x2, x2, 32768
	ldr	w0, [x2, 2788]
	ldr	w1, [x2, 2800]
	ldr	w6, [x2, 2792]
	ldr	w4, [x2, 2804]
	add	w0, w0, w1
	cmp	w0, wzr
	add	w4, w6, w4
	ccmp	w5, wzr, 4, gt
	ccmp	w4, wzr, 4, gt
	ble	.L201
	ldrb	w1, [x3, 27]
	cmp	w1, 1
	beq	.L205
	lsl	w1, w0, 1
	mul	w0, w1, w5
	sdiv	w0, w0, w4
.L203:
	lsl	w2, w0, 2
	mov	w1, 19923
	sub	w2, w2, w0
	movk	w1, 0x1062, lsl 16
	lsl	w3, w2, 5
	add	x19, x19, 296
	add	w2, w2, w3
	add	x19, x19, 32768
	add	w0, w2, w0
	smull	x1, w0, w1
	asr	x1, x1, 38
	sub	w0, w1, w0, asr 31
	str	w0, [x19, 2824]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L201:
	str	wzr, [x2, 2824]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L205:
	ldr	w3, [x2, 2796]
	ldr	w1, [x2, 2808]
	mul	w0, w0, w5
	add	w1, w3, w1
	sdiv	w0, w0, w1
	b	.L203
	.size	MP2_CalcRealEncFrameRate, .-MP2_CalcRealEncFrameRate
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_CalcDar
	.type	MP2_CalcDar, %function
MP2_CalcDar:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 81920
	bl	_mcount
	ldr	x0, [x19, 112]
	ldr	w0, [x0, 84]
	sub	w0, w0, #1
	cmp	w0, 2
	bhi	.L208
	ldr	x1, .LC45
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x1, w0, uxtw 2]
	ret
	.p2align 3
.L208:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_CalcDar, .-MP2_CalcDar
	.align	3
.LC45:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_SetImgFormat
	.type	MP2_SetImgFormat, %function
MP2_SetImgFormat:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x21, x22, 45056
	add	x23, x22, 81920
	bl	_mcount
	add	x1, x21, 296
	ldr	w0, [x22]
	add	x1, x1, 32768
	ldr	x20, [x23, 112]
	ldr	w1, [x1, 2740]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L209
	ldrb	w24, [x20, 22]
	cmp	w24, 4
	beq	.L218
	sub	w24, w24, #1
	and	w0, w24, 3
	mov	w3, w0
	uxtb	w5, w0
.L211:
	ldrb	w0, [x20, 27]
	mov	w4, 1
	ldrb	w2, [x19, 157]
	ldrb	w1, [x20, 9]
	cmp	w0, wzr
	ubfx	x2, x2, 2, 2
	cset	w8, eq
	orr	w2, w1, w2
	ldr	w7, [x20, 128]
	cbnz	w0, .L212
	cmp	w1, 3
	beq	.L224
	add	x0, x21, 296
	cmp	w1, 1
	add	x0, x0, 32768
	cset	w4, eq
	ldr	w0, [x0, 2648]
	cbz	w0, .L212
	cset	w4, ne
.L212:
	ldr	x0, [x23, 112]
	ldr	w0, [x0, 84]
	sub	w0, w0, #1
	cmp	w0, 2
	bhi	.L220
.L225:
	ldr	x1, .LC46
	ldr	w1, [x1, w0, uxtw 2]
	and	w6, w1, 7
.L215:
	ldrb	w0, [x19, 157]
	add	x21, x21, 296
	stp	w3, w3, [x19, 24]
	bfi	w0, w8, 0, 2
	add	x21, x21, 32768
	bfi	w0, w2, 2, 2
	bfi	w0, w4, 4, 2
	strb	w0, [x19, 157]
	ldrb	w0, [x19, 156]
	bfi	w0, w5, 0, 2
	and	w0, w0, -29
	bfi	w0, w7, 5, 3
	strb	w0, [x19, 156]
	mov	x0, x19
	ldr	w2, [x19, 156]
	bfi	w2, w6, 14, 3
	str	w2, [x19, 156]
	bl	SetAspectRatio
	ldp	w1, w0, [x19, 32]
	ldr	w2, [x20, 72]
	str	w2, [x19, 64]
	lsr	w1, w1, 1
	lsr	w0, w0, 1
	stp	w1, w0, [x19, 48]
	mov	x0, x22
	ldrb	w1, [x20, 27]
	str	w1, [x19, 500]
	ldrb	w1, [x20, 18]
	str	w1, [x19, 504]
	ldr	w1, [x20, 144]
	str	w1, [x19, 512]
	bl	MP2_CalcRealEncFrameRate
	ldr	w0, [x21, 2824]
	str	w0, [x19, 508]
	cbz	w24, .L216
	ldr	w0, [x23, 776]
.L217:
	str	w0, [x19, 528]
	ldr	w0, [x23, 780]
	str	w0, [x19, 532]
	stp	wzr, wzr, [x20, 188]
.L209:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L220:
	mov	w1, 0
	mov	w6, 0
	b	.L215
	.p2align 3
.L216:
	ldr	w0, [x20, 188]
	str	w0, [x23, 776]
	ldr	w1, [x20, 192]
	str	w1, [x23, 780]
	b	.L217
	.p2align 3
.L218:
	mov	w3, 0
	mov	w5, 0
	mov	w24, 0
	b	.L211
	.p2align 3
.L224:
	ldr	x0, [x23, 112]
	ldrb	w4, [x20, 10]
	ldr	w0, [x0, 84]
	and	w4, w4, 1
	sub	w0, w0, #1
	cmp	w0, 2
	bhi	.L220
	b	.L225
	.size	MP2_SetImgFormat, .-MP2_SetImgFormat
	.align	3
.LC46:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_SearchStartCode
	.type	MP2_SearchStartCode, %function
MP2_SearchStartCode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w19, 4
	mov	w0, 0
	ble	.L227
	mov	w1, w19
	mov	x0, x20
	bl	MP2_SearchStartCode.part.2
.L227:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_SearchStartCode, .-MP2_SearchStartCode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_ProtocolPPSCheck
	.type	MP2_ProtocolPPSCheck, %function
MP2_ProtocolPPSCheck:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 45056
	bl	_mcount
	add	x1, x19, 296
	add	x2, x20, 81920
	add	x1, x1, 32768
	ldr	x3, [x2, 112]
	ldr	w0, [x1, 2692]
	cmp	w0, 1
	beq	.L231
	cmp	w0, 2
	beq	.L232
	ldr	w0, [x1, 2636]
	orr	w0, w0, 63
	str	w0, [x1, 2636]
	ldrb	w2, [x3, 22]
.L238:
	tst	w0, 24
	beq	.L240
.L254:
	cmp	w2, 3
	bne	.L241
.L229:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L232:
	ldr	w0, [x1, 2636]
	tbnz	x0, 20, .L239
	orr	w0, w0, 16
	str	w0, [x1, 2636]
.L239:
	ldrb	w2, [x3, 22]
	sub	w1, w2, #1
	uxtb	w1, w1
	cmp	w1, 2
	bls	.L238
.L252:
	add	x1, x19, 296
	orr	w0, w0, 8
	add	x1, x1, 32768
	tst	w0, 24
	str	w0, [x1, 2636]
	ldrb	w2, [x3, 22]
	bne	.L254
.L240:
	cmp	w2, 1
	bne	.L229
	add	x19, x19, 296
	and	w0, w0, -193
	add	x19, x19, 32768
	str	w0, [x19, 2636]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L231:
	ldrb	w2, [x3, 22]
	sub	w0, w2, #1
	uxtb	w0, w0
	cmp	w0, 3
	ldr	w0, [x1, 2636]
	bhi	.L255
.L234:
	sub	w1, w2, #2
	uxtb	w1, w1
	cmp	w1, 1
	bls	.L256
.L235:
	cmp	w2, 3
	beq	.L257
	tst	w0, 24
	beq	.L240
.L241:
	add	x21, x19, 296
	orr	w0, w0, 64
	add	x21, x21, 32768
	str	w0, [x21, 2636]
	ldr	w1, [x21, 2736]
	ldr	w0, [x20]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L243
	ldr	w0, [x20]
	ldr	x1, [x22, 168]
	bl	FreeUsdByDec
	ldr	w0, [x20]
	ldr	x1, [x22, 176]
	bl	FreeUsdByDec
	ldr	w0, [x20]
	ldr	x1, [x22, 184]
	bl	FreeUsdByDec
	ldr	w0, [x20]
	ldr	x1, [x22, 192]
	bl	FreeUsdByDec
	stp	xzr, xzr, [x22, 168]
	stp	xzr, xzr, [x22, 184]
	ldr	w0, [x20]
	ldr	w1, [x21, 2736]
	bl	FSP_ClearLogicFs
	ldr	w0, [x20]
	ldr	w1, [x21, 2732]
	bl	FSP_ClearLogicFs
	str	wzr, [x21, 2732]
	str	wzr, [x21, 2736]
.L243:
	add	x19, x19, 296
	add	x19, x19, 32768
	str	wzr, [x19, 2696]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L255:
	orr	w0, w0, 8
	str	w0, [x1, 2636]
	ldrb	w2, [x3, 22]
	b	.L234
	.p2align 3
.L257:
	ldrb	w1, [x3, 26]
	cbnz	w1, .L229
	b	.L252
	.p2align 3
.L256:
	ldrb	w1, [x3, 24]
	cbnz	w1, .L235
	add	x1, x19, 296
	orr	w0, w0, 8
	add	x1, x1, 32768
	str	w0, [x1, 2636]
	ldrb	w2, [x3, 22]
	b	.L235
	.size	MP2_ProtocolPPSCheck, .-MP2_ProtocolPPSCheck
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_GetImageBuffer
	.type	MP2_GetImageBuffer, %function
MP2_GetImageBuffer:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 45056
	bl	_mcount
	add	x20, x21, 296
	add	x20, x20, 32768
	ldr	w0, [x19]
	mov	w1, 0
	bl	FSP_NewLogicFs
	str	w0, [x20, 2740]
	mov	w1, w0
	tbnz	w0, #31, .L266
	ldr	w0, [x19]
	bl	FSP_GetLogicFs
	mov	w1, 1
	cbz	x0, .L267
.L261:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L266:
	ldr	x2, .LC48
	mov	w1, 1377
	mov	w0, 0
	bl	dprint_normal
	ldr	w0, [x19]
	ldr	w1, [x20, 2736]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L260
	ldr	w0, [x19]
	ldr	x1, [x22, 168]
	bl	FreeUsdByDec
	ldr	w0, [x19]
	ldr	x1, [x22, 176]
	bl	FreeUsdByDec
	ldr	w0, [x19]
	ldr	x1, [x22, 184]
	bl	FreeUsdByDec
	ldr	w0, [x19]
	ldr	x1, [x22, 192]
	bl	FreeUsdByDec
	stp	xzr, xzr, [x22, 168]
	stp	xzr, xzr, [x22, 184]
	ldr	w0, [x19]
	ldr	w1, [x20, 2736]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19]
	ldr	w1, [x20, 2732]
	bl	FSP_ClearLogicFs
	str	wzr, [x20, 2732]
	str	wzr, [x20, 2736]
.L260:
	add	x21, x21, 296
	add	x1, x19, 81920
	add	x21, x21, 32768
	add	x1, x1, 128
	str	wzr, [x21, 2696]
	ldr	w0, [x19]
	bl	FSP_ClearNotInVoQueue
	mov	w1, 0
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L267:
	mov	w3, 1392
	ldr	x2, .LC50
	mov	w1, w3
	bl	dprint_normal
	mov	w1, 0
	b	.L261
	.size	MP2_GetImageBuffer, .-MP2_GetImageBuffer
	.align	3
.LC48:
	.xword	.LC47
	.align	3
.LC50:
	.xword	.LC49
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_GetPictureInfo
	.type	MP2_GetPictureInfo, %function
MP2_GetPictureInfo:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	add	x22, x19, 45056
	bl	_mcount
	add	x0, x22, 296
	add	x1, x19, 81920
	add	x0, x0, 32768
	ldp	x20, x23, [x1, 112]
	ldr	w0, [x0, 2692]
	cmp	w0, 1
	beq	.L312
	ldrb	w0, [x20, 9]
	cmp	w0, 3
	beq	.L270
.L320:
	add	x21, x22, 296
	add	x21, x21, 32768
	ldr	w0, [x21, 2648]
	ldr	w1, [x21, 2700]
	cmp	w0, wzr
	cset	w0, eq
	str	w0, [x21, 2648]
	ldr	w2, [x20, 156]
	cmp	w2, w1
	cset	w1, ne
	tst	w0, w1
	bne	.L313
.L272:
	ldrb	w2, [x20, 9]
	add	x0, x22, 296
	strb	w2, [x22, 297]
	add	x1, x0, 32768
	add	x21, x19, 48
	ldr	w0, [x20, 156]
	str	w0, [x1, 2700]
	ldr	w0, [x20, 56]
	strh	w0, [x21, 150]
	ldrb	w0, [x20, 9]
	cmp	w0, 3
	ldr	w0, [x20, 60]
	beq	.L277
	lsr	w0, w0, 1
	strh	w0, [x21, 146]
	ldr	w0, [x20, 60]
	strh	w0, [x21, 148]
.L278:
	ldrb	w1, [x20, 11]
	add	x0, x22, 296
	strb	w1, [x21, 5]
	add	x0, x0, 32768
	ldrb	w1, [x20, 9]
	strb	w1, [x21, 3]
	ldr	w1, [x0, 2648]
	strb	w1, [x21, 4]
	ldrb	w2, [x20, 12]
	strb	w2, [x21, 7]
	ldrb	w2, [x20, 22]
	strb	w2, [x19, 48]
	ldr	w0, [x0, 2692]
	cmp	w0, 1
	cset	w2, eq
	str	w2, [x21, 176]
	beq	.L314
.L279:
	ldrb	w0, [x20, 4]
	strb	w0, [x21, 12]
	ldrb	w0, [x20, 5]
	strb	w0, [x21, 13]
	ldrb	w0, [x20, 6]
	strb	w0, [x21, 14]
	ldrb	w0, [x20, 7]
	strb	w0, [x21, 15]
	ldrb	w0, [x20, 10]
	strb	w0, [x21, 6]
	ldrb	w0, [x20, 8]
	strb	w0, [x21, 11]
	ldrb	w0, [x20, 13]
	strb	w0, [x21, 10]
	ldrb	w0, [x20, 14]
	strb	w0, [x21, 9]
	ldrb	w0, [x20, 15]
	strb	w0, [x21, 8]
	ldrb	w0, [x20, 9]
	cmp	w0, 3
	ccmp	w1, wzr, 4, ne
	bne	.L281
	mov	x1, 0
	mov	x0, x19
	bl	MP2_GetImageBuffer
	mov	w23, w0
	cbz	w0, .L315
	add	x1, x22, 296
	ldr	w0, [x19]
	add	x1, x1, 32768
	ldr	w1, [x1, 2740]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	cbz	x0, .L284
	ldr	x3, [x19, 32]
	mov	x4, -1
	ldr	x2, .LC61
	mov	w1, 810
	mov	w0, 24
	ldr	x3, [x3, 32]
	str	x3, [x23, 208]
	ldr	x3, [x19, 32]
	ldr	x3, [x3, 48]
	str	x3, [x23, 216]
	ldr	x3, [x19, 32]
	ldr	x3, [x3, 64]
	str	x3, [x23, 224]
	ldr	x3, [x19, 32]
	ldr	w3, [x3, 80]
	str	w3, [x23]
	ldr	x3, [x19, 32]
	ldr	w3, [x3, 84]
	str	w3, [x23, 4]
	ldr	x3, [x19, 32]
	ldr	w3, [x3, 88]
	str	w3, [x23, 8]
	ldr	x3, [x19, 32]
	ldr	w3, [x3, 104]
	str	w3, [x23, 12]
	ldr	x3, [x19, 32]
	str	x4, [x3, 32]
	ldr	w3, [x19]
	ldp	x4, x5, [x23, 208]
	bl	dprint_normal
	ldrb	w0, [x20, 9]
	cmp	w0, 3
	cset	w0, ne
	str	w0, [x23, 20]
.L284:
	ldrb	w0, [x20, 22]
	cmp	w0, 3
	beq	.L281
	add	x20, x22, 296
	mov	w0, 2
	add	x20, x20, 32768
	ldr	w2, [x20, 2696]
	ldr	w1, [x20, 2732]
	ldr	w3, [x20, 2736]
	cmp	w2, wzr
	csinc	w0, w0, wzr, ne
	str	w0, [x20, 2696]
	cmp	w1, w3
	ldr	w0, [x20, 2740]
	beq	.L288
	cmp	w1, w0
	beq	.L288
	ldr	w0, [x19]
	bl	FSP_GetDisplay
	sub	w0, w0, #1
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L316
.L289:
	add	x20, x22, 296
	ldr	w0, [x19]
	add	x20, x20, 32768
	mov	w2, 0
	ldr	w1, [x20, 2732]
	bl	FSP_SetRef
	ldr	w3, [x20, 2736]
	ldr	w0, [x20, 2740]
.L288:
	add	x20, x22, 296
	mov	w1, w0
	add	x20, x20, 32768
	mov	w2, 1
	str	w3, [x20, 2732]
	str	w0, [x20, 2736]
	ldr	w0, [x19]
	bl	FSP_SetRef
	ldr	w0, [x19]
	ldr	w1, [x20, 2732]
	bl	FSP_ReleasePmv
.L281:
	add	x20, x22, 296
	ldr	w0, [x19]
	add	x20, x20, 32768
	ldr	w1, [x20, 2740]
	bl	FSP_GetLogicFs
	mov	x22, x0
	ldr	w1, [x20, 2732]
	ldr	w0, [x19]
	bl	FSP_GetLogicFs
	mov	x24, x0
	ldr	w1, [x20, 2736]
	ldr	w0, [x19]
	bl	FSP_GetLogicFs
	mov	x25, x0
	cmp	x22, xzr
	ccmp	x24, xzr, 4, ne
	ccmp	x0, xzr, 4, ne
	beq	.L317
	ldr	x1, [x22, 24]
	cbz	x1, .L318
	ldr	x0, [x0, 24]
	cbz	x0, .L292
	ldr	w6, [x0, 4]
.L293:
	str	w6, [x21, 180]
	ldr	x0, [x24, 24]
	cbz	x0, .L319
.L311:
	ldr	w5, [x0, 4]
	mov	w1, 873
	str	w5, [x21, 184]
	ldr	x2, .LC67
	ldr	x0, [x22, 24]
	ldr	w3, [x0, 4]
	str	w3, [x21, 188]
	ldr	x0, [x22, 24]
	ldr	w0, [x0, 16]
	str	w0, [x21, 192]
	ldrb	w0, [x22, 424]
	strb	w0, [x21, 144]
	ldr	x0, [x22, 40]
	ldr	w7, [x0, 8]
	str	w7, [x21, 228]
	ldr	x0, [x22, 24]
	ldr	w4, [x0, 4]
	str	w4, [x21, 208]
	ldr	w0, [x25, 76]
	str	w0, [x21, 200]
	ldr	w0, [x24, 76]
	str	w0, [x21, 204]
	mov	w0, 11
	bl	dprint_normal
	ldr	x2, [x22, 24]
	add	x3, x19, 77824
	add	x0, x3, 3128
	add	x1, x19, 128
	add	x3, x3, 3384
	ldr	w2, [x2, 44]
	str	w2, [x21, 212]
	ldr	x2, [x22, 24]
	ldr	w2, [x2, 72]
	str	w2, [x21, 216]
	ldr	x2, [x22, 24]
	ldr	w2, [x2, 64]
	str	w2, [x21, 220]
	ldr	x2, [x22, 24]
	ldr	w2, [x2, 68]
	str	w2, [x21, 224]
	.p2align 2
.L296:
	ldr	w2, [x0]
	add	x0, x0, 4
	strb	w2, [x1]
	add	x1, x1, 1
	cmp	x0, x3
	ldr	w2, [x0, 252]
	strb	w2, [x1, -65]
	bne	.L296
	mov	w23, 1
.L283:
	mov	w0, w23
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L315:
	add	x3, x22, 296
	ldr	x2, .LC59
	add	x3, x3, 32768
	mov	w1, 792
	ldr	w3, [x3, 2644]
	bl	dprint_normal
	ldr	x25, [sp, 64]
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L312:
	ldrb	w0, [x20, 24]
	strb	w0, [x20, 5]
	strb	w0, [x20, 4]
	ldrb	w0, [x20, 9]
	ldrb	w1, [x20, 26]
	strb	w1, [x20, 7]
	cmp	w0, 3
	strb	w1, [x20, 6]
	bne	.L320
.L270:
	ldrb	w5, [x22, 297]
	add	x0, x22, 296
	cmp	w5, 3
	beq	.L275
	add	x21, x0, 32768
	ldr	w0, [x21, 2648]
	cbz	w0, .L321
.L275:
	add	x0, x22, 296
	mov	w1, 1
	add	x0, x0, 32768
	str	w1, [x0, 2648]
	b	.L272
.L314:
	ldrb	w0, [x20, 25]
	strb	w0, [x21, 1]
	ldrb	w0, [x20, 23]
	strb	w0, [x21, 2]
	b	.L279
.L277:
	ldr	w1, [x20, 64]
	sub	w0, w0, w1
	strh	w0, [x21, 146]
	ldr	w0, [x20, 60]
	strh	w0, [x21, 148]
	b	.L278
.L317:
	ldr	w0, [x19]
	mov	w23, 0
	ldr	w1, [x20, 2740]
	bl	FSP_ClearLogicFs
	mov	w3, 847
	ldr	x2, .LC63
	mov	x6, x25
	mov	x5, x24
	mov	x4, x22
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldr	x25, [sp, 64]
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L292:
	ldr	w6, [x1, 4]
	b	.L293
.L321:
	ldr	x2, .LC57
	mov	w4, 0
	ldr	w3, [x21, 2644]
	mov	w1, 736
	mov	w0, 1
	bl	dprint_normal
	ldr	w0, [x19]
	ldr	w1, [x21, 2740]
	bl	FSP_ClearLogicFs
	ldrb	w0, [x23, 22]
	cmp	w0, 3
	beq	.L275
	ldr	w0, [x21, 2636]
	orr	w0, w0, 192
	str	w0, [x21, 2636]
	b	.L275
.L319:
	ldr	x0, [x22, 24]
	b	.L311
.L313:
	ldr	x2, .LC55
	mov	w1, 720
	ldr	w3, [x21, 2644]
	mov	w0, 1
	bl	dprint_normal
	str	wzr, [x21, 2648]
	ldr	w1, [x21, 2740]
	ldr	w0, [x19]
	bl	FSP_ClearLogicFs
	ldrb	w0, [x23, 22]
	cmp	w0, 3
	beq	.L272
	ldr	w0, [x21, 2636]
	orr	w0, w0, 192
	str	w0, [x21, 2636]
	b	.L272
.L318:
	ldr	x2, .LC65
	mov	w1, 854
	ldr	w4, [x20, 2732]
	mov	w0, 1
	ldr	w5, [x20, 2736]
	mov	w23, 0
	ldr	w3, [x20, 2740]
	bl	dprint_normal
	ldr	w0, [x19]
	ldr	w1, [x20, 2740]
	bl	FSP_ClearLogicFs
	b	.L283
.L316:
	ldr	w0, [x19]
	mov	w2, 0
	ldr	w1, [x20, 2732]
	bl	FSP_SetDisplay
	b	.L289
	.size	MP2_GetPictureInfo, .-MP2_GetPictureInfo
	.align	3
.LC55:
	.xword	.LC54
	.align	3
.LC57:
	.xword	.LC56
	.align	3
.LC59:
	.xword	.LC58
	.align	3
.LC61:
	.xword	.LC60
	.align	3
.LC63:
	.xword	.LC62
	.align	3
.LC65:
	.xword	.LC64
	.align	3
.LC67:
	.xword	.LC66
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_SetVDMInf
	.type	MP2_SetVDMInf, %function
MP2_SetVDMInf:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, 12584
	mov	x19, x0
	mov	x0, x30
	movk	x20, 0x1, lsl 16
	add	x20, x19, x20
	bl	_mcount
	add	x0, x19, 81920
	add	x0, x0, 736
	ldrsb	w1, [x20, 2576]
	ldr	w3, [x20, 2568]
	cmp	w1, 1
	ldr	w4, [x0, 32]
	ldr	w1, [x20, 2580]
	lsr	w2, w4, 3
	beq	.L325
	add	w3, w3, w2
	add	w2, w1, w2
	str	w3, [x20, 2568]
	add	w1, w4, w1, lsl 3
	ldr	w21, [x20, 2584]
	and	w2, w2, -4
	and	w1, w1, 31
	str	w2, [x19, 200]
	str	w1, [x19, 208]
	and	w21, w21, -4
	bl	BsResidBits
	str	w21, [x19, 204]
	str	w0, [x19, 216]
	ldr	w0, [x20, 2584]
	ubfiz	w0, w0, 3, 2
	str	w0, [x19, 212]
	ldr	w0, [x20, 2592]
	lsl	w0, w0, 3
	str	w0, [x19, 220]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L325:
	add	w3, w3, w2
	add	w2, w1, w2
	str	w3, [x20, 2568]
	add	w1, w4, w1, lsl 3
	and	w2, w2, -4
	and	w1, w1, 31
	str	w2, [x19, 200]
	str	w1, [x19, 208]
	bl	BsResidBits
	str	wzr, [x19, 204]
	stp	wzr, w0, [x19, 212]
	str	wzr, [x19, 220]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MP2_SetVDMInf, .-MP2_SetVDMInf
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_DecNewPic
	.type	MP2_DecNewPic, %function
MP2_DecNewPic:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	MP2_SetVDMInf
	add	x0, x19, 81920
	ldr	x1, [x0, 112]
	ldrb	w0, [x1, 22]
	cmp	w0, 3
	beq	.L344
	cmp	w0, 2
	beq	.L345
.L328:
	ldr	x3, [x19, 32]
	add	x2, x19, 48
	str	x2, [x19, 40]
	ldr	w0, [x3, 880]
	cmp	w0, 1
	beq	.L346
.L330:
	cmp	w0, 2
	beq	.L347
.L331:
	add	x2, x19, 77824
	mov	w20, 1
	ldr	w0, [x2, 2932]
	and	w0, w0, -16252929
	str	w0, [x2, 2932]
	ldrb	w0, [x1, 22]
	cmp	w0, w20
	beq	.L348
.L329:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L345:
	ldr	x3, [x19, 32]
	mov	w0, 1
	add	x2, x19, 48
	str	w0, [x19, 12]
	str	x2, [x19, 40]
	ldr	w0, [x3, 880]
	cmp	w0, 1
	bne	.L330
.L346:
	cbz	x2, .L331
	ldrb	w0, [x1, 22]
	cmp	w0, 3
	bne	.L331
	mov	w20, 0
	str	xzr, [x19, 40]
	b	.L329
	.p2align 3
.L348:
	ldr	x0, .LC68
	ldr	x5, [x0]
	cbz	x5, .L329
	ldp	w4, w1, [x19, 216]
	add	x2, x29, 48
	ldr	w0, [x19]
	add	w4, w4, w1
	mov	w3, 4
	cmp	w4, wzr
	add	w1, w4, 7
	csel	w4, w1, w4, lt
	mov	w1, 8
	asr	w4, w4, 3
	str	w4, [x2, -8]!
	blr	x5
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L344:
	ldr	w0, [x19, 12]
	cbnz	w0, .L328
	add	x0, x19, 77824
	ldr	w2, [x0, 2992]
	cmp	w2, 2
	beq	.L328
	ldrb	w1, [x1, 9]
	cmp	w1, 3
	beq	.L332
	ldr	w1, [x0, 2944]
	mov	w20, 0
	cmp	w1, wzr
	cset	w1, eq
	str	w1, [x0, 2944]
	b	.L329
	.p2align 3
.L347:
	ldr	w0, [x3, 884]
	cmp	w0, wzr
	ccmp	x2, xzr, 4, gt
	beq	.L331
	ldrb	w0, [x1, 22]
	cmp	w0, 3
	bne	.L331
	str	xzr, [x19, 40]
	mov	w20, 0
	ldr	w0, [x3, 884]
	sub	w0, w0, #1
	str	w0, [x3, 884]
	b	.L329
	.p2align 3
.L332:
	mov	w20, 0
	b	.L329
	.size	MP2_DecNewPic, .-MP2_DecNewPic
	.align	3
.LC68:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_RecordVFMWState
	.type	MP2_RecordVFMWState, %function
MP2_RecordVFMWState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 81920
	ldr	x1, [x19, 32]
	ldr	x0, [x0, 112]
	ldr	w2, [x0, 40]
	str	w2, [x1, 584]
	ldr	x1, [x19, 32]
	ldr	w0, [x0, 44]
	str	w0, [x1, 588]
	ldp	w2, w1, [x19, 4]
	ldr	x3, [x19, 32]
	sub	w0, w2, w1
	cmp	w2, w1
	csel	w0, w0, wzr, ge
	str	w0, [x3, 592]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_RecordVFMWState, .-MP2_RecordVFMWState
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_GetUsrData
	.type	MP2_GetUsrData, %function
MP2_GetUsrData:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x23, x0
	mov	x0, x30
	add	x24, x23, 81920
	bl	_mcount
	add	x20, x24, 736
	mov	x0, x20
	ldr	x25, [x24, 112]
	bl	BsToNextByte
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w22, w1, w0, lt
	asr	w22, w22, 3
	cmp	w22, wzr
	ble	.L374
	ldr	x26, .LC71
	mov	w21, 0
	mov	w19, 0
	b	.L357
	.p2align 3
.L391:
	bl	BsGet
	add	w19, w19, 1
	strb	w0, [x26, w21, sxtw]
	cmp	w22, w19
	add	w21, w21, 1
	beq	.L353
.L357:
	mov	w1, 24
	mov	x0, x20
	bl	BsShow
	and	w2, w0, 16777215
	cmp	w2, 1
	mov	w1, 8
	mov	x0, x20
	beq	.L375
	cmp	w21, 1023
	ble	.L391
	mov	w1, 8
	mov	x0, x20
	add	w19, w19, 1
	bl	BsGet
	cmp	w22, w19
	bne	.L357
.L353:
	add	x22, x23, 45056
	add	x26, x22, 296
	add	x26, x26, 32768
	ldrsb	w0, [x26, 2576]
	cbz	w0, .L373
.L390:
	mov	w19, 0
.L354:
	add	x0, x22, 296
	add	x0, x0, 32768
	ldr	w20, [x0, 2688]
	cmp	w20, 3
	ble	.L362
	add	x26, x23, 77824
	add	x20, x26, 2952
	add	x26, x26, 2984
.L363:
	ldr	x1, [x20]
	ldr	w0, [x23]
	bl	FreeUsdByDec
	str	xzr, [x20], 8
	cmp	x20, x26
	bne	.L363
	add	x0, x22, 296
	mov	w20, 0
	add	x0, x0, 32768
	str	wzr, [x0, 2688]
.L362:
	ldr	w0, [x23]
	add	x20, x23, x20, uxtw 3
	add	x20, x20, 77824
	bl	GetUsd
	add	x2, x22, 296
	str	x0, [x20, 2952]
	add	x4, x2, 32768
	ldr	w3, [x4, 2688]
	sxtw	x1, w3
	add	x1, x1, 4096
	add	x1, x1, 332
	ldr	x1, [x2, x1, lsl 3]
	cbz	x1, .L364
	ldr	x1, [x23, 32]
	ldr	x1, [x1, 32]
	str	x1, [x0, 1056]
	ldr	x0, [x20, 2952]
	ldr	w1, [x4, 2640]
	str	w1, [x0, 1044]
	ldr	x0, [x20, 2952]
	str	w21, [x0, 1052]
	ldr	x1, [x24, 112]
	ldr	x0, [x20, 2952]
	ldrb	w1, [x1, 22]
	strb	w1, [x0, 1024]
	ldr	x0, [x20, 2952]
	ldr	w1, [x23, 4]
	str	w1, [x0, 1032]
	ldr	x1, [x24, 112]
	ldr	x0, [x20, 2952]
	ldrb	w1, [x1, 10]
	strb	w1, [x0, 1025]
	ldr	w0, [x4, 2636]
	tbz	x0, 19, .L365
	ldr	x0, [x20, 2952]
	mov	w1, 3
	str	w1, [x0, 1040]
.L366:
	ldr	x0, [x20, 2952]
	ldr	w2, [x0, 1052]
	cmp	w2, 1024
	ble	.L367
	mov	w1, 1024
	str	w1, [x0, 1052]
	ldr	x0, [x20, 2952]
	ldr	w2, [x0, 1052]
.L367:
	ldr	x3, .LC74
	sxtw	x2, w2
	ldr	x1, .LC71
	ldr	x3, [x3, 104]
	blr	x3
	ldr	x0, [x20, 2952]
	ldr	w1, [x0, 1052]
	cmp	w1, 5
	ble	.L369
	mov	w1, 21572
	ldr	w2, [x0]
	movk	w1, 0x3147, lsl 16
	cmp	w2, w1
	beq	.L392
.L369:
	ldr	x0, .LC75
	ldr	x4, [x0]
	cbz	x4, .L371
	ldr	w0, [x23]
	mov	w3, 1064
	ldr	x2, [x20, 2952]
	mov	w1, 5
	blr	x4
.L371:
	add	x22, x22, 296
	add	x22, x22, 32768
	ldr	w0, [x22, 2688]
	add	w0, w0, 1
	str	w0, [x22, 2688]
.L389:
	mov	w0, w19
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L373:
	ldrsb	w0, [x26, 2577]
	mov	w19, 0
	cbz	w0, .L354
	ldr	w19, [x26, 2592]
	cbz	w19, .L354
	ldr	x2, .LC73
	mov	w1, 1506
	mov	w0, 0
	mov	w19, 1
	bl	dprint_normal
	ldrsw	x0, [x26, 2588]
	ldr	x2, .LC74
	ldr	x1, [x26, 2608]
	sub	x0, x0, #3
	add	x1, x1, x0
	ldr	x0, [x26, 2616]
	ldr	x3, [x2, 104]
	mov	x2, 3
	sub	x0, x0, #3
	blr	x3
	strb	w19, [x26, 2576]
	add	x3, x26, 2560
	ldr	w0, [x26, 2584]
	ldr	w2, [x26, 2592]
	ldr	x1, [x26, 2616]
	sub	w0, w0, #3
	strb	wzr, [x26, 2577]
	add	w2, w2, 3
	stp	w0, wzr, [x3, 20]
	stp	w2, wzr, [x3, 28]
	sub	x1, x1, #3
	mov	x0, x20
	str	x1, [x26, 2608]
	str	xzr, [x26, 2616]
	bl	BsInit
	strb	w19, [x26, 2577]
	strb	wzr, [x26, 2576]
	mov	x0, x20
	bl	BsToNextByte
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w19, w1, w0, lt
	asr	w19, w19, 3
	sub	w19, w19, #3
	cmp	w19, wzr
	ble	.L390
	ldr	x27, .LC71
	mov	w26, 0
	b	.L360
	.p2align 3
.L393:
	bl	BsGet
	strb	w0, [x27, w21, sxtw]
	add	w21, w21, 1
.L359:
	add	w26, w26, 1
	cmp	w19, w26
	beq	.L390
.L360:
	mov	w1, 24
	mov	x0, x20
	bl	BsShow
	and	w2, w0, 16777215
	cmp	w2, 1
	mov	w1, 8
	mov	x0, x20
	beq	.L378
	cmp	w21, 1023
	ble	.L393
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	b	.L359
	.p2align 3
.L375:
	mov	w19, w2
	add	x22, x23, 45056
	b	.L354
	.p2align 3
.L365:
	ldr	x0, [x20, 2952]
	mov	w1, 1
	str	w1, [x0, 1040]
	b	.L366
	.p2align 3
.L392:
	ldrb	w0, [x0, 4]
	cmp	w0, 65
	cset	w1, eq
	str	w1, [x25, 188]
	bne	.L369
	ldr	x0, [x20, 2952]
	ldrb	w0, [x0, 5]
	and	w0, w0, 15
	str	w0, [x25, 192]
	b	.L369
.L364:
	ldr	x2, .LC77
	mov	w1, 1609
	mov	w0, 0
	bl	dprint_normal
	b	.L389
.L374:
	mov	w21, 0
	b	.L353
.L378:
	mov	w19, w2
	b	.L354
	.size	MP2_GetUsrData, .-MP2_GetUsrData
	.align	3
.LC71:
	.xword	.LANCHOR2
	.align	3
.LC73:
	.xword	.LC72
	.align	3
.LC74:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC75:
	.xword	g_EventReportFunc
	.align	3
.LC77:
	.xword	.LC76
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	next_start_code
	.type	next_start_code, %function
next_start_code:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	add	x20, x22, 81920
	bl	_mcount
	add	x20, x20, 736
	mov	x0, x20
	bl	BsToNextByte
	mov	x0, x20
	bl	BsGetNextBytePtr
	mov	x19, x0
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w2, w1, w0, lt
	mov	w1, 0
	asr	w2, w2, 3
	cmp	w2, 4
	bgt	.L420
.L395:
	mov	x0, x20
	mov	w19, 0
	bl	BsLongSkip
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w21, w1, w0, lt
	asr	w21, w21, 3
	sub	w21, w21, #3
	cmp	w21, wzr
	bgt	.L414
	b	.L402
	.p2align 3
.L399:
	bl	BsSkip
	cmp	w19, w21
	beq	.L402
.L414:
	mov	w1, 24
	mov	x0, x20
	add	w19, w19, 1
	bl	BsShow
	cmp	w0, 1
	mov	w1, 8
	mov	x0, x20
	bne	.L399
.L404:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L402:
	mov	x0, 12584
	movk	x0, 0x1, lsl 16
	add	x22, x22, x0
	ldrsb	w0, [x22, 2576]
	cbnz	w0, .L398
	ldrsb	w0, [x22, 2577]
	cbz	w0, .L398
	ldr	w0, [x22, 2592]
	cbz	w0, .L398
	ldr	x2, .LC78
	mov	w1, 1657
	mov	w0, 8
	mov	w19, 1
	bl	dprint_normal
	ldr	x3, .LC79
	mov	x2, 3
	ldrsw	x1, [x22, 2588]
	ldr	x4, [x22, 2608]
	ldr	x0, [x22, 2616]
	sub	x1, x1, #3
	ldr	x3, [x3, 104]
	add	x1, x4, x1
	sub	x0, x0, #3
	blr	x3
	strb	w19, [x22, 2576]
	add	x6, x22, 2560
	ldr	x4, [x22, 2616]
	ldr	w5, [x22, 2584]
	mov	x0, x20
	ldr	w3, [x22, 2592]
	sub	x4, x4, #3
	strb	wzr, [x22, 2577]
	sub	w5, w5, #3
	add	w3, w3, 3
	mov	x1, x4
	stp	w5, wzr, [x6, 20]
	stp	w3, wzr, [x6, 28]
	mov	w2, w3
	str	x4, [x22, 2608]
	str	xzr, [x22, 2616]
	bl	BsInit
	strb	w19, [x22, 2577]
	strb	wzr, [x22, 2576]
	mov	x0, x20
	bl	BsToNextByte
	mov	x0, x20
	bl	BsGetNextBytePtr
	mov	x19, x0
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w2, w1, w0, lt
	mov	w1, 0
	asr	w2, w2, 3
	cmp	w2, 4
	bgt	.L421
.L403:
	mov	x0, x20
	bl	BsLongSkip
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w21, w1, w0, lt
	asr	w21, w21, 3
	sub	w21, w21, #3
	cmp	w21, wzr
	ble	.L398
	mov	w19, 0
	b	.L405
	.p2align 3
.L422:
	bl	BsSkip
	cmp	w19, w21
	beq	.L398
.L405:
	mov	w1, 24
	mov	x0, x20
	add	w19, w19, 1
	bl	BsShow
	cmp	w0, 1
	mov	w1, 8
	mov	x0, x20
	bne	.L422
	b	.L404
	.p2align 3
.L398:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L420:
	mov	w1, w2
	mov	x0, x19
	bl	MP2_SearchStartCode.part.2
	lsl	w1, w0, 3
	b	.L395
.L421:
	mov	w1, w2
	mov	x0, x19
	bl	MP2_SearchStartCode.part.2
	lsl	w1, w0, 3
	b	.L403
	.size	next_start_code, .-next_start_code
	.align	3
.LC78:
	.xword	.LC72
	.align	3
.LC79:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetSliceHdr
	.type	GetSliceHdr, %function
GetSliceHdr:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, 12584
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 81920
	movk	x22, 0x1, lsl 16
	add	x20, x20, 736
	bl	_mcount
	add	x22, x21, x22
	b	.L424
	.p2align 3
.L431:
	bl	BsShow
	mov	w19, w0
	mov	x0, x20
	sub	w19, w19, #257
	bl	BsPos
	str	w0, [x22, 2716]
	cmp	w19, 174
	mov	w1, 32
	mov	x0, x20
	bls	.L439
	bl	BsSkip
.L424:
	mov	x0, x21
	bl	next_start_code
	mov	w2, w0
	cmp	w2, 1
	mov	w1, 32
	mov	x0, x20
	beq	.L431
	cmn	w2, #1
	mov	w19, w2
	beq	.L426
.L429:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L433:
	mov	w19, -1
.L426:
	ldr	x0, .LC80
	ldr	x4, [x0]
	cbz	x4, .L429
	ldr	w0, [x21]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L439:
	bl	BsResidBits
	cmp	w0, 40
	ble	.L433
	ldr	w0, [x22, 2632]
	str	wzr, [x22, 2712]
	cbnz	w0, .L430
	mov	x0, x21
	mov	w19, 0
	bl	MP2_GetSequenceInfo
	ldr	w0, [x22, 2704]
	cbz	w0, .L429
.L430:
	mov	x0, x21
	mov	w19, 1
	bl	MP2_ProtocolPPSCheck
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	GetSliceHdr, .-GetSliceHdr
	.align	3
.LC80:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	sequence_header
	.type	sequence_header, %function
sequence_header:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x19, 12584
	bl	_mcount
	movk	x19, 0x1, lsl 16
	add	x2, x20, 81920
	add	x19, x20, x19
	add	x21, x2, 736
	mov	w3, 65536
	mov	w1, 12
	mov	x0, x21
	ldr	x23, [x2, 112]
	str	w3, [x19, 2636]
	str	wzr, [x19, 2632]
	bl	BsGet
	str	w0, [x23, 48]
	mov	w1, 12
	mov	x0, x21
	bl	BsGet
	str	w0, [x23, 52]
	mov	w1, 4
	mov	x0, x21
	bl	BsGet
	str	w0, [x23, 84]
	mov	w1, 4
	mov	x0, x21
	bl	BsGet
	str	w0, [x23, 88]
	mov	w1, 18
	mov	x0, x21
	bl	BsGet
	str	w0, [x23, 92]
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
	cbnz	w0, .L441
	ldr	w0, [x19, 2636]
	orr	w0, w0, 1
	str	w0, [x19, 2636]
.L441:
	mov	w1, 10
	mov	x0, x21
	bl	BsGet
	str	w0, [x23, 96]
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
	strb	w0, [x23, 1]
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
	cmp	w0, 1
	str	w0, [x23, 76]
	ldr	x22, .LC83
	beq	.L458
	add	x1, x20, 77824
	add	x0, x22, 64
	add	x1, x1, 3128
	add	x3, x0, 64
	.p2align 2
.L446:
	ldrb	w2, [x0], 1
	str	w2, [x1], 4
	cmp	x0, x3
	bne	.L446
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
	cmp	w0, 1
	str	w0, [x23, 80]
	beq	.L459
.L455:
	add	x1, x20, 77824
	mov	w2, 16
	add	x0, x1, 3384
	add	x1, x1, 3640
	.p2align 2
.L449:
	str	w2, [x0], 4
	cmp	x0, x1
	bne	.L449
	mov	w0, 1
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L458:
	mov	x24, x22
	add	x25, x22, 64
	.p2align 2
.L443:
	ldrb	w19, [x24], 1
	mov	w1, 8
	mov	x0, x21
	add	x19, x20, x19, sxtw 2
	bl	BsGet
	add	x19, x19, 65536
	cmp	x24, x25
	str	w0, [x19, 15416]
	bne	.L443
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
	cmp	w0, 1
	str	w0, [x23, 80]
	bne	.L455
.L459:
	add	x23, x22, 64
	.p2align 2
.L448:
	ldrb	w19, [x22], 1
	mov	w1, 8
	mov	x0, x21
	add	x19, x20, x19, sxtw 2
	bl	BsGet
	add	x19, x19, 65536
	cmp	x22, x23
	str	w0, [x19, 15672]
	bne	.L448
	mov	w0, 1
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.size	sequence_header, .-sequence_header
	.align	3
.LC83:
	.xword	.LANCHOR3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	group_of_pictures_header
	.type	group_of_pictures_header, %function
group_of_pictures_header:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x2, x19, 81920
	mov	w1, 1
	add	x20, x2, 736
	mov	x0, x20
	ldr	x21, [x2, 112]
	bl	BsGet
	mov	w1, 5
	strb	w0, [x21, 2]
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 100]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 104]
	mov	w1, 1
	mov	x0, x20
	bl	BsSkip
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 108]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 112]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 116]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 120]
	add	x1, x19, 77824
	add	x2, x1, 3084
	add	x3, x1, 3108
	ldr	x4, [x1, 3096]
	ldr	x5, [x2]
	str	x5, [x1, 3072]
	ldr	w5, [x1, 3092]
	str	w5, [x1, 3080]
	str	x4, [x2]
	ldr	w4, [x1, 3104]
	str	w4, [x1, 3092]
	ldr	x2, [x3]
	str	x2, [x1, 3096]
	ldr	w2, [x1, 3116]
	str	wzr, [x1, 3108]
	str	wzr, [x1, 3112]
	str	w2, [x1, 3104]
	str	wzr, [x1, 3116]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	group_of_pictures_header, .-group_of_pictures_header
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	sequence_extension
	.type	sequence_extension, %function
sequence_extension:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x23, x0
	mov	x0, x30
	add	x22, x23, 45056
	add	x21, x22, 296
	bl	_mcount
	add	x21, x21, 32768
	add	x3, x23, 81920
	add	x20, x3, 736
	mov	w1, 8
	mov	x0, x20
	ldr	w2, [x21, 2636]
	ldr	x19, [x3, 112]
	orr	w2, w2, 131072
	str	wzr, [x21, 2632]
	str	w2, [x21, 2636]
	bl	BsGet
	str	w0, [x19, 124]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 27]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 28]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	mov	w25, w0
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	mov	w26, w0
	mov	w1, 12
	mov	x0, x20
	bl	BsGet
	mov	w24, w0
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cbnz	w0, .L462
	ldr	w0, [x21, 2636]
	orr	w0, w0, 2
	str	w0, [x21, 2636]
.L461:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L462:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	mov	w21, w0
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 29]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 30]
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	and	w2, w0, 255
	ldrb	w1, [x19, 30]
	add	w2, w2, 1
	strb	w0, [x19, 31]
	add	w0, w1, 1
	ldr	x1, .LC86
	sdiv	w0, w0, w2
	add	x1, x1, 16
	ldr	w2, [x19, 88]
	ldr	w2, [x1, x2, lsl 2]
	ldr	w1, [x19, 124]
	mul	w0, w0, w2
	str	w0, [x19, 72]
	tbnz	x1, 7, .L485
	ubfx	x0, x1, 4, 3
	and	w1, w1, 15
	stp	w0, w1, [x19, 40]
.L465:
	ldp	w0, w1, [x19, 48]
	and	w1, w1, 4095
	and	w0, w0, 4095
	orr	w26, w1, w26, lsl 12
	orr	w25, w0, w25, lsl 12
	cmp	w26, wzr
	ccmp	w25, wzr, 4, ne
	stp	w25, w26, [x19, 48]
	bne	.L466
	add	x0, x22, 296
	add	x0, x0, 32768
	ldr	w1, [x0, 2636]
	orr	w1, w1, 1
	str	w1, [x0, 2636]
	ldr	w25, [x19, 48]
.L466:
	cmp	w25, 4096
	bhi	.L467
	ldr	w0, [x19, 52]
	cmp	w0, 4096
	bls	.L468
.L467:
	add	x22, x22, 296
	ldr	x0, .LC87
	add	x22, x22, 32768
	ldr	x4, [x0]
	ldr	w0, [x22, 2636]
	orr	w0, w0, 1
	str	w0, [x22, 2636]
	cbz	x4, .L468
	ldr	w0, [x23]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
.L468:
	ldp	w0, w2, [x19, 92]
	mov	w1, 400
	ldr	w3, [x19, 40]
	add	w24, w0, w24, lsl 18
	add	w21, w2, w21, lsl 10
	sub	w0, w3, #4
	stp	w24, w21, [x19, 92]
	mul	w24, w24, w1
	cmp	w0, 1
	str	w24, [x19, 68]
	bls	.L470
	ldr	x0, .LC87
	ldr	x4, [x0]
	cbz	x4, .L471
	ldr	w0, [x23]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
	ldr	w3, [x19, 40]
.L471:
	ldr	x2, .LC89
	mov	w1, 1901
	mov	w0, 1
	bl	dprint_normal
.L470:
	ldr	w3, [x19, 44]
	sub	w0, w3, #4
	cmp	w0, 6
	bls	.L461
	ldr	x0, .LC87
	ldr	x4, [x0]
	cbz	x4, .L472
	ldr	w0, [x23]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
	ldr	w3, [x19, 44]
.L472:
	ldr	x2, .LC91
	mov	w1, 1908
	mov	w0, 1
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L485:
	and	w1, w1, 15
	cmp	w1, 5
	bne	.L465
	mov	w1, 133
	mov	w0, 8
	stp	w1, w0, [x19, 40]
	b	.L465
	.size	sequence_extension, .-sequence_extension
	.align	3
.LC86:
	.xword	.LANCHOR1
	.align	3
.LC87:
	.xword	g_EventReportFunc
	.align	3
.LC89:
	.xword	.LC88
	.align	3
.LC91:
	.xword	.LC90
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	sequence_display_extension
	.type	sequence_display_extension, %function
sequence_display_extension:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 45056
	add	x19, x19, 81920
	bl	_mcount
	add	x20, x19, 736
	add	x2, x21, 296
	mov	w1, 3
	ldr	x19, [x19, 112]
	add	x2, x2, 32768
	mov	x0, x20
	stp	wzr, wzr, [x19, 148]
	ldr	w3, [x2, 2636]
	orr	w3, w3, 262144
	str	w3, [x2, 2636]
	bl	BsGet
	str	w0, [x19, 128]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 132]
	cbnz	w0, .L493
.L487:
	mov	w1, 14
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 148]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cbnz	w0, .L488
	add	x21, x21, 296
	add	x21, x21, 32768
	ldr	w0, [x21, 2636]
	orr	w0, w0, 4
	str	w0, [x21, 2636]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L488:
	mov	w1, 14
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 152]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L493:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 136]
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 140]
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 144]
	b	.L487
	.size	sequence_display_extension, .-sequence_display_extension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	quant_matrix_extension
	.type	quant_matrix_extension, %function
quant_matrix_extension:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	bl	_mcount
	add	x2, x22, 81920
	mov	w1, 1
	add	x20, x2, 736
	mov	x0, x20
	ldr	x24, [x2, 112]
	bl	BsGet
	cmp	w0, 1
	str	w0, [x24, 76]
	beq	.L495
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x24, 80]
	beq	.L513
.L497:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cbz	w0, .L501
	mov	w19, 64
	.p2align 2
.L505:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	subs	w19, w19, #1
	bne	.L505
.L501:
	mov	w1, 1
	mov	x0, x20
	mov	w19, 64
	bl	BsGet
	cbz	w0, .L494
	.p2align 2
.L507:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	subs	w19, w19, #1
	bne	.L507
.L494:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L495:
	ldr	x21, .LC93
	add	x23, x21, 64
	.p2align 2
.L498:
	ldrb	w19, [x21], 1
	mov	w1, 8
	mov	x0, x20
	add	x19, x22, x19, sxtw 2
	bl	BsGet
	add	x19, x19, 65536
	cmp	x21, x23
	str	w0, [x19, 15416]
	bne	.L498
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x24, 80]
	bne	.L497
.L513:
	ldr	x21, .LC93
	add	x23, x21, 64
	.p2align 2
.L502:
	ldrb	w19, [x21], 1
	mov	w1, 8
	mov	x0, x20
	add	x19, x22, x19, sxtw 2
	bl	BsGet
	add	x19, x19, 65536
	cmp	x23, x21
	str	w0, [x19, 15672]
	bne	.L502
	b	.L497
	.size	quant_matrix_extension, .-quant_matrix_extension
	.align	3
.LC93:
	.xword	.LANCHOR3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	picture_display_extension
	.type	picture_display_extension, %function
picture_display_extension:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x23, x19, 45056
	add	x19, x19, 81920
	bl	_mcount
	add	x20, x19, 736
	add	x0, x23, 296
	add	x0, x0, 32768
	ldr	x19, [x19, 112]
	ldr	w1, [x0, 2636]
	orr	w1, w1, 2097152
	str	w1, [x0, 2636]
	ldrb	w0, [x19, 27]
	cbz	w0, .L515
	ldrb	w0, [x19, 16]
	mov	w22, 1
	cbnz	w0, .L528
.L516:
	add	x19, x19, 164
	mov	w21, 0
	b	.L520
	.p2align 3
.L529:
	mov	w1, 16
	mov	x0, x20
	add	x19, x19, 4
	bl	BsGet
	mov	w1, 1
	str	w0, [x19, 8]
	mov	x0, x20
	bl	BsGet
	cbz	w0, .L527
	cmp	w21, w22
	bge	.L514
.L520:
	mov	w1, 16
	mov	x0, x20
	add	w21, w21, 1
	bl	BsGet
	str	w0, [x19]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cbnz	w0, .L529
.L527:
	add	x0, x23, 296
	add	x0, x0, 32768
	ldr	w1, [x0, 2636]
	orr	w1, w1, 32
	str	w1, [x0, 2636]
.L514:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L515:
	ldrb	w0, [x19, 9]
	mov	w22, 1
	cmp	w0, 3
	bne	.L516
	ldrb	w1, [x19, 16]
	mov	w22, 2
	cmp	w1, wzr
	csel	w22, w22, w0, eq
	b	.L516
	.p2align 3
.L528:
	ldrb	w1, [x19, 10]
	mov	w0, 2
	mov	w22, 3
	cmp	w1, wzr
	csel	w22, w0, w22, eq
	b	.L516
	.size	picture_display_extension, .-picture_display_extension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	picture_coding_extension
	.type	picture_coding_extension, %function
picture_coding_extension:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	add	x22, x19, 45056
	add	x19, x19, 81920
	bl	_mcount
	add	x20, x19, 736
	add	x1, x22, 296
	add	x1, x1, 32768
	ldr	x21, [x19, 112]
	mov	x23, x1
	mov	x25, x21
	add	x24, x21, 4
	ldr	w0, [x1, 2636]
	orr	w0, w0, 1048576
	str	w0, [x1, 2636]
.L531:
	mov	x19, 0
.L533:
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	sub	w2, w0, #10
	add	x1, x25, x19
	add	x19, x19, 1
	uxtb	w2, w2
	cmp	w2, 4
	strb	w0, [x1, 4]
	ccmp	w0, wzr, 4, hi
	bne	.L532
	ldr	w0, [x23, 2636]
	orr	w0, w0, 16
	str	w0, [x23, 2636]
.L532:
	cmp	x19, 2
	bne	.L533
	add	x25, x25, 2
	cmp	x25, x24
	bne	.L531
	mov	w1, w19
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 8]
	mov	w1, w19
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x21, 9]
	cbnz	w0, .L535
	add	x22, x22, 296
	add	x22, x22, 32768
	ldr	w0, [x22, 2636]
	orr	w0, w0, 16
	str	w0, [x22, 2636]
.L530:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L535:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 10]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 11]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 12]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 13]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 14]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 15]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 16]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 17]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 18]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x21, 3]
	cbz	w0, .L530
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 19]
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 20]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 21]
	mov	w1, 7
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 32]
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 36]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	picture_coding_extension, .-picture_coding_extension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	extra_bit_information
	.type	extra_bit_information, %function
extra_bit_information:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 81920
	mov	w20, 0
	bl	_mcount
	add	x19, x19, 736
	b	.L545
	.p2align 3
.L547:
	mov	w1, 8
	mov	x0, x19
	add	w20, w20, 1
	bl	BsSkip
	mov	x0, x19
	bl	BsResidBits
	cmp	w0, 8
	ble	.L546
.L545:
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	cbnz	w0, .L547
.L546:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	extra_bit_information, .-extra_bit_information
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	picture_header
	.type	picture_header, %function
picture_header:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	mov	x3, 12584
	add	x4, x21, 81920
	movk	x3, 0x1, lsl 16
	add	x20, x4, 736
	add	x3, x21, x3
	mov	w1, 10
	ldr	x19, [x4, 112]
	mov	x0, x20
	ldr	w2, [x3, 2636]
	and	w2, w2, -3670073
	orr	w2, w2, 524288
	str	w2, [x3, 2636]
	bl	BsGet
	str	w0, [x19, 156]
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 22]
	mov	w1, 16
	mov	x0, x20
	bl	BsGet
	ldrb	w22, [x19, 22]
	str	w0, [x19, 160]
	sub	w0, w22, #2
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L551
.L549:
	cmp	w22, 3
	beq	.L552
	mov	x0, x21
	bl	extra_bit_information
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L552:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 25]
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 26]
	mov	x0, x21
	bl	extra_bit_information
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L551:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 23]
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	ldrb	w22, [x19, 22]
	strb	w0, [x19, 24]
	b	.L549
	.size	picture_header, .-picture_header
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	copyright_extension
	.type	copyright_extension, %function
copyright_extension:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 81920
	mov	w1, 32
	add	x0, x0, 736
	bl	BsSkip
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	copyright_extension, .-copyright_extension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	picture_temporal_scalable_extension
	.type	picture_temporal_scalable_extension, %function
picture_temporal_scalable_extension:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	copyright_extension
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	picture_temporal_scalable_extension, .-picture_temporal_scalable_extension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	picture_spatial_scalable_extension
	.type	picture_spatial_scalable_extension, %function
picture_spatial_scalable_extension:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	copyright_extension
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	picture_spatial_scalable_extension, .-picture_spatial_scalable_extension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	sequence_scalable_extension
	.type	sequence_scalable_extension, %function
sequence_scalable_extension:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	copyright_extension
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	sequence_scalable_extension, .-sequence_scalable_extension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	extension
	.type	extension, %function
extension:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x2, x19, 81920
	mov	w1, 4
	add	x20, x2, 736
	mov	x0, x20
	ldr	x2, [x2, 112]
	stp	wzr, wzr, [x2, 128]
	stp	wzr, wzr, [x2, 136]
	str	wzr, [x2, 144]
	bl	BsGet
	sub	w0, w0, #1
	cmp	w0, 9
	bhi	.L558
	ldr	x1, .LC95
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx560
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx560:
	.section	.rodata
	.align	0
	.align	2
.L560:
	.byte	(.L559 - .Lrtx560) / 4
	.byte	(.L561 - .Lrtx560) / 4
	.byte	(.L562 - .Lrtx560) / 4
	.byte	(.L563 - .Lrtx560) / 4
	.byte	(.L563 - .Lrtx560) / 4
	.byte	(.L558 - .Lrtx560) / 4
	.byte	(.L565 - .Lrtx560) / 4
	.byte	(.L566 - .Lrtx560) / 4
	.byte	(.L563 - .Lrtx560) / 4
	.byte	(.L563 - .Lrtx560) / 4
	.text
	.p2align 3
.L563:
	mov	w1, 32
	mov	x0, x20
	bl	BsSkip
.L558:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L562:
	mov	x0, x19
	bl	quant_matrix_extension
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L566:
	mov	x0, x19
	bl	picture_coding_extension
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L565:
	mov	x0, x19
	bl	picture_display_extension
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L559:
	mov	x0, x19
	bl	sequence_extension
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L561:
	mov	x0, x19
	bl	sequence_display_extension
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	extension, .-extension
	.align	3
.LC95:
	.xword	.L560
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG2DEC_Init
	.type	MPEG2DEC_Init, %function
MPEG2DEC_Init:
	sub	sp, sp, #912
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x22, x1
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x27, .LC96
	ldr	w0, [x22, 636]
	cmp	w0, 1
	beq	.L575
	mov	w24, 0
	mov	w25, 0
	mov	w26, 0
	add	x21, x19, 45056
	add	x23, x19, 77824
	add	x20, x19, 81920
.L570:
	ldr	x3, [x27, 96]
	mov	x2, 17168
	movk	x2, 0x1, lsl 16
	mov	w1, 0
	mov	x0, x19
	ldr	w28, [x20, 728]
	blr	x3
	str	w28, [x20, 728]
	add	x0, x20, 128
	mov	w28, 1
	bl	ResetVoQueue
	str	x22, [x19, 32]
	add	x0, x21, 296
	add	x1, x23, 3816
	add	x21, x0, 32768
	str	x1, [x20, 120]
	add	x1, x23, 4012
	str	x1, [x20, 112]
	str	wzr, [x19, 12]
	mov	w1, 3
	str	w28, [x21, 2648]
	strb	w1, [x0, 1]
	mov	x0, x19
	str	wzr, [x21, 2712]
	ldr	w1, [x22, 8]
	str	w1, [x21, 2624]
	str	wzr, [x21, 2704]
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x19]
	beq	.L576
	ldr	w19, [x22, 636]
	cmp	w19, 1
	beq	.L577
	mov	w19, w28
.L572:
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	add	sp, sp, 912
	ret
	.p2align 3
.L577:
	ldr	w0, [x21, 2636]
	add	x1, x29, 496
	ldr	x3, [x27, 104]
	mov	x2, 256
	orr	w0, w0, 65536
	str	w24, [x21, 2632]
	str	w0, [x21, 2636]
	add	x0, x23, 3128
	str	w26, [x21, 2692]
	str	w25, [x21, 2704]
	blr	x3
	ldr	x3, [x27, 104]
	add	x1, x29, 752
	mov	x2, 256
	add	x0, x23, 3384
	blr	x3
	ldr	x3, [x27, 104]
	add	x1, x29, 96
	ldr	x0, [x20, 112]
	mov	x2, 196
	blr	x3
	ldr	x0, [x20, 120]
	mov	x2, 196
	ldr	x3, [x27, 104]
	add	x1, x29, 296
	blr	x3
	b	.L572
	.p2align 3
.L575:
	add	x21, x19, 45056
	ldr	x4, [x27, 104]
	add	x3, x21, 296
	add	x23, x19, 77824
	add	x3, x3, 32768
	add	x1, x23, 3128
	mov	x2, 256
	add	x0, x29, 496
	add	x20, x19, 81920
	ldr	w24, [x3, 2632]
	ldr	w26, [x3, 2692]
	ldr	w25, [x3, 2704]
	blr	x4
	ldr	x3, [x27, 104]
	add	x1, x23, 3384
	mov	x2, 256
	add	x0, x29, 752
	blr	x3
	ldr	x1, [x20, 112]
	mov	x2, 196
	ldr	x3, [x27, 104]
	add	x0, x29, 96
	blr	x3
	ldr	x1, [x20, 120]
	mov	x2, 196
	ldr	x3, [x27, 104]
	add	x0, x29, 296
	blr	x3
	b	.L570
.L576:
	ldr	x2, .LC98
	mov	w1, 2299
	mov	w0, 0
	mov	w19, -20
	bl	dprint_normal
	b	.L572
	.size	MPEG2DEC_Init, .-MPEG2DEC_Init
	.align	3
.LC96:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC98:
	.xword	.LC97
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG2DEC_RecycleImage
	.type	MPEG2DEC_RecycleImage, %function
MPEG2DEC_RecycleImage:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cbz	x20, .L583
	ldr	w0, [x20]
	mov	w1, w19
	mov	w2, 0
	bl	FSP_SetDisplay
	ldr	w0, [x20]
	mov	w1, w19
	bl	FSP_GetFsImagePtr
	add	x19, x0, 168
	add	x21, x0, 200
	cbz	x0, .L582
.L584:
	ldr	x1, [x19]
	ldr	w0, [x20]
	bl	FreeUsdByDec
	str	xzr, [x19], 8
	cmp	x19, x21
	bne	.L584
.L582:
	mov	w0, 1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L583:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	MPEG2DEC_RecycleImage, .-MPEG2DEC_RecycleImage
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG2DEC_FlushRemainImg
	.type	MPEG2DEC_FlushRemainImg, %function
MPEG2DEC_FlushRemainImg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 32]
	ldr	w0, [x0, 12]
	cmp	w0, 1
	beq	.L586
	add	x21, x19, 45056
	ldr	w0, [x19]
	add	x20, x21, 296
	add	x20, x20, 32768
	ldr	w1, [x20, 2736]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L586
	ldr	w0, [x19]
	ldr	w1, [x20, 2736]
	bl	FSP_GetDisplay
	cmp	w0, 2
	beq	.L602
.L586:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L602:
	mov	x0, x19
	bl	MP2_SetImgFormat
	add	x1, x19, 77824
	add	x0, x22, 168
	add	x1, x1, 2952
	add	x3, x22, 200
.L591:
	ldr	x2, [x1]
	cbz	x2, .L590
	str	x2, [x0]
.L590:
	add	x0, x0, 8
	str	xzr, [x1], 8
	cmp	x0, x3
	bne	.L591
	add	x21, x21, 296
	mov	w2, 1
	add	x21, x21, 32768
	str	wzr, [x21, 2688]
	ldr	w0, [x19]
	ldr	w1, [x22, 88]
	bl	FSP_SetDisplay
	add	x3, x19, 81920
	ldr	w0, [x19]
	mov	x4, x22
	add	x3, x3, 128
	mov	x2, x19
	mov	w1, 3
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L586
	ldr	w1, [x22, 88]
	mov	x0, x19
	bl	MPEG2DEC_RecycleImage
	b	.L586
	.size	MPEG2DEC_FlushRemainImg, .-MPEG2DEC_FlushRemainImg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG2DEC_GetImageBuffer
	.type	MPEG2DEC_GetImageBuffer, %function
MPEG2DEC_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 45056
	add	x0, x0, 296
	ldrb	w1, [x0, 1]
	cmp	w1, 3
	beq	.L604
	add	x0, x0, 32768
	ldr	w0, [x0, 2648]
	cbz	w0, .L606
.L604:
	ldr	w0, [x19]
	bl	FSP_IsNewFsAvailable
	cmp	w0, 1
	beq	.L606
	cmn	w0, #1
	mov	w20, 0
	beq	.L614
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L606:
	mov	w20, 1
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L614:
	add	x1, x19, 81920
	ldr	w0, [x19]
	add	x1, x1, 128
	bl	FSP_ClearNotInVoQueue
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MPEG2DEC_GetImageBuffer, .-MPEG2DEC_GetImageBuffer
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_ClearCurPacket
	.type	MP2_ClearCurPacket, %function
MP2_ClearCurPacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 20]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
	ldrsb	w0, [x19]
	cmp	w0, 1
	beq	.L616
	ldr	w1, [x19, 24]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
.L616:
	ldr	x3, .LC99
	mov	x2, 48
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_ClearCurPacket, .-MP2_ClearCurPacket
	.align	3
.LC99:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_ReceivePacket
	.type	MP2_ReceivePacket, %function
MP2_ReceivePacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x20, x1
	mov	x0, x30
	mov	w22, w2
	bl	_mcount
	cbz	x20, .L626
	add	x1, x19, 32768
	str	wzr, [x1, 2568]
	ldr	w0, [x20, 20]
	str	w0, [x1, 2628]
	ldr	w0, [x20, 16]
	str	w0, [x1, 2580]
	ldr	x0, [x20]
	str	x0, [x1, 2608]
	ldr	w0, [x20, 20]
	str	w0, [x1, 2588]
	ldrb	w0, [x20, 10]
	strb	w0, [x1, 2576]
	ldr	w0, [x20, 24]
	str	w0, [x1, 2596]
	ldrb	w21, [x20, 10]
	cmp	w21, 1
	beq	.L623
	ldr	w0, [x20, 104]
	mov	w21, 1
	str	w0, [x1, 2584]
	ldr	x0, [x20, 88]
	str	x0, [x1, 2616]
	ldr	w0, [x20, 108]
	str	w0, [x1, 2592]
	ldrb	w0, [x20, 98]
	strb	w0, [x1, 2577]
	ldr	w0, [x20, 112]
	str	w0, [x1, 2600]
	ldrb	w0, [x20, 98]
	cmp	w0, w21
	beq	.L622
	add	x1, x1, 2576
	mov	w0, w22
	bl	MP2_ClearCurPacket
	ldrb	w3, [x20, 98]
	mov	w0, w21
	ldr	x2, .LC103
	mov	w1, 2722
	mov	w21, 0
	bl	dprint_normal
.L622:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L623:
	strb	wzr, [x1, 2577]
	mov	w0, w21
	str	wzr, [x1, 2584]
	str	wzr, [x1, 2592]
	str	wzr, [x1, 2600]
	str	xzr, [x1, 2616]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L626:
	add	x19, x19, 32768
	ldr	x2, .LC101
	mov	w1, 2696
	mov	w0, 1
	mov	w21, 0
	ldr	w3, [x19, 2644]
	bl	dprint_normal
	b	.L622
	.size	MP2_ReceivePacket, .-MP2_ReceivePacket
	.align	3
.LC101:
	.xword	.LC100
	.align	3
.LC103:
	.xword	.LC102
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_ClearCurPic
	.type	MP2_ClearCurPic, %function
MP2_ClearCurPic:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x21, x22, 48
	mov	w20, 0
	bl	_mcount
	add	x0, x21, 45056
	mov	x23, x0
	ldr	w0, [x0, 240]
	cbnz	w0, .L636
	b	.L631
	.p2align 3
.L629:
	ldr	w0, [x23, 240]
	cmp	w0, w20
	bls	.L631
.L636:
	sxtw	x19, w20
	ldr	w0, [x22]
	lsl	x1, x19, 2
	add	w20, w20, 1
	sub	x1, x1, x19
	lsl	x1, x1, 2
	sub	x19, x1, x19
	add	x19, x21, x19, lsl 2
	ldr	w1, [x19, 264]
	bl	SM_ReleaseStreamSeg
	ldr	w0, [x19, 244]
	cbz	w0, .L629
	ldr	w0, [x19, 252]
	cbz	w0, .L629
	ldr	w1, [x19, 268]
	ldr	w0, [x22]
	bl	SM_ReleaseStreamSeg
	ldr	w0, [x23, 240]
	cmp	w0, w20
	bhi	.L636
.L631:
	add	x21, x21, 45056
	str	wzr, [x21, 240]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	MP2_ClearCurPic, .-MP2_ClearCurPic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG2DEC_VDMPostProc
	.type	MPEG2DEC_VDMPostProc, %function
MPEG2DEC_VDMPostProc:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x23, x19, 81920
	mov	w22, w1
	bl	_mcount
	add	x20, x19, 45056
	ldr	x1, [x19, 32]
	mov	x0, x19
	ldr	x21, [x23, 112]
	add	x24, x20, 296
	add	x24, x24, 32768
	ldr	w2, [x21, 40]
	str	w2, [x1, 584]
	ldr	x1, [x19, 32]
	ldr	w2, [x21, 44]
	str	w2, [x1, 588]
	ldp	w1, w2, [x19, 4]
	ldr	x3, [x19, 32]
	cmp	w1, w2
	sub	w1, w1, w2
	csel	w1, w1, wzr, ge
	str	w1, [x3, 592]
	bl	MP2_ClearCurPic
	ldr	x3, .LC104
	mov	x2, 45300
	mov	w1, 0
	add	x0, x19, 48
	ldr	x3, [x3, 96]
	blr	x3
	ldrb	w0, [x21, 22]
	strb	w0, [x20, 296]
	ldr	w1, [x24, 2740]
	ldr	w0, [x19]
	bl	FSP_GetFsImagePtr
	mov	x25, x0
	ldr	w1, [x24, 2736]
	ldr	w0, [x19]
	bl	FSP_GetFsImagePtr
	mov	x26, x0
	ldr	w1, [x24, 2732]
	ldr	w0, [x19]
	bl	FSP_GetFsImagePtr
	cbz	x25, .L693
	str	w22, [x25, 96]
	tbnz	w22, #31, .L645
	cmp	w22, 100
	mov	w3, 100
	csel	w3, w22, w3, le
	str	w3, [x25, 96]
	ldr	x0, [x19, 32]
	ldr	w4, [x0, 4]
	cmp	w3, w4
	bhi	.L694
.L646:
	mov	x0, x19
	bl	MP2_SetImgFormat
	ldrb	w0, [x21, 9]
	cmp	w0, 3
	beq	.L647
.L696:
	add	x0, x20, 296
	add	x0, x0, 32768
	ldr	w0, [x0, 2648]
	cmp	w0, 1
	beq	.L647
	ldrb	w0, [x21, 22]
	cmp	w0, 3
	beq	.L669
.L700:
	ldr	x1, [x19, 32]
	mov	w0, 1
	ldr	w2, [x25, 96]
	ldr	w1, [x1]
	cmp	w2, w1
	bhi	.L695
.L683:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L695:
	add	x21, x20, 296
	ldr	w0, [x19]
	add	x21, x21, 32768
	ldr	w1, [x21, 2740]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19]
	ldr	w1, [x21, 2736]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L667
	ldr	w0, [x19]
	ldr	x1, [x22, 168]
	bl	FreeUsdByDec
	ldr	w0, [x19]
	ldr	x1, [x22, 176]
	bl	FreeUsdByDec
	ldr	w0, [x19]
	ldr	x1, [x22, 184]
	bl	FreeUsdByDec
	ldr	w0, [x19]
	ldr	x1, [x22, 192]
	bl	FreeUsdByDec
	stp	xzr, xzr, [x22, 168]
	stp	xzr, xzr, [x22, 184]
	ldr	w0, [x19]
	ldr	w1, [x21, 2736]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19]
	ldr	w1, [x21, 2732]
	bl	FSP_ClearLogicFs
	str	wzr, [x21, 2732]
	str	wzr, [x21, 2736]
.L667:
	add	x20, x20, 296
	mov	w0, 1
	add	x20, x20, 32768
	str	wzr, [x20, 2696]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L694:
	ldr	w5, [x24, 2740]
	mov	w1, 2564
	ldr	x2, .LC108
	mov	w0, 1
	bl	dprint_normal
	ldr	w0, [x19]
	mov	w2, 0
	ldr	w1, [x24, 2740]
	bl	FSP_SetDisplay
	mov	x0, x19
	bl	MP2_SetImgFormat
	ldrb	w0, [x21, 9]
	cmp	w0, 3
	bne	.L696
	.p2align 2
.L647:
	add	x22, x19, 77824
	add	x0, x25, 168
	add	x1, x22, 2952
	add	x3, x25, 200
.L650:
	ldr	x2, [x1]
	cbz	x2, .L649
	str	x2, [x0]
.L649:
	add	x0, x0, 8
	str	xzr, [x1], 8
	cmp	x0, x3
	bne	.L650
	add	x0, x20, 296
	add	x0, x0, 32768
	str	wzr, [x0, 2688]
	ldr	x1, [x19, 32]
	ldr	w1, [x1, 12]
	cbnz	w1, .L651
	ldrb	w1, [x21, 22]
	cmp	w1, 3
	beq	.L651
	ldr	w1, [x0, 2732]
	str	w1, [x0, 2744]
	b	.L652
	.p2align 3
.L651:
	add	x0, x20, 296
	add	x0, x0, 32768
	ldr	w1, [x0, 2740]
	str	w1, [x0, 2744]
.L652:
	ldr	w0, [x19]
	bl	FSP_GetDisplay
	add	x1, x20, 296
	add	x1, x1, 32768
	ldr	w1, [x1, 2744]
	cmn	w1, #1
	beq	.L653
	sub	w0, w0, #1
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L697
.L653:
	ldrb	w0, [x21, 27]
	cmp	w0, 1
	beq	.L698
	ldrb	w0, [x21, 18]
	cmp	w0, 1
	beq	.L699
	add	x1, x20, 296
	add	x1, x1, 32768
	ldr	w0, [x1, 2820]
	add	w0, w0, 1
	str	w0, [x1, 2820]
	lsl	w0, w0, 1
	str	w0, [x1, 2816]
.L665:
	ldr	w1, [x22, 3108]
	add	x0, x20, 296
	add	x0, x0, 32768
	add	w1, w1, 1
	str	w1, [x22, 3108]
	ldr	w1, [x0, 2644]
	add	w1, w1, 1
	str	w1, [x0, 2644]
	ldrb	w0, [x21, 22]
	cmp	w0, 3
	bne	.L700
.L669:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L645:
	str	wzr, [x25, 96]
	b	.L646
	.p2align 3
.L698:
	add	x0, x20, 296
	ldrb	w2, [x21, 16]
	add	x0, x0, 32768
	ldrb	w1, [x21, 10]
	add	w1, w2, w1
	ldr	w2, [x0, 2820]
	add	w1, w1, 1
	add	w1, w1, w2
	str	w1, [x0, 2820]
	lsl	w1, w1, 1
	str	w1, [x0, 2816]
	b	.L665
	.p2align 3
.L699:
	add	x0, x20, 296
	add	x0, x0, 32768
	ldr	w1, [x0, 2820]
	ldr	w2, [x0, 2816]
	add	w1, w1, 1
	str	w1, [x0, 2820]
	ldrb	w1, [x21, 16]
	add	w1, w1, 2
	add	w1, w1, w2
	str	w1, [x0, 2816]
	b	.L665
	.p2align 3
.L693:
	ldr	x2, .LC106
	mov	x5, x0
	mov	x4, x26
	mov	x3, 0
	mov	w1, 2546
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	b	.L683
	.p2align 3
.L697:
	ldr	w0, [x19]
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	cbz	x0, .L701
	ldr	w26, [x19]
	ldr	w1, [x22, 3032]
	mov	w0, w26
	bl	FSP_GetFsImagePtr
	mov	x28, x0
	ldr	w1, [x22, 3040]
	mov	w0, w26
	bl	FSP_GetFsImagePtr
	mov	x27, x0
	cmp	x28, xzr
	ccmp	x0, xzr, 4, ne
	beq	.L702
	ldr	x0, [x0, 208]
	cmn	x0, #1
	beq	.L656
	ldr	w1, [x22, 3032]
	mov	w0, w26
	bl	FSP_GetDisplay
	cmp	w0, 1
	beq	.L661
	ldr	w1, [x22, 3032]
	mov	w0, w26
	bl	FSP_GetDisplay
	cmp	w0, 2
	beq	.L661
	.p2align 2
.L656:
	add	x1, x20, 296
	ldr	w0, [x19]
	add	x1, x1, 32768
	mov	w2, 1
	ldr	w1, [x1, 2744]
	bl	FSP_SetDisplay
	ldr	w0, [x19]
	mov	x4, x24
	add	x3, x23, 128
	mov	x2, x19
	mov	w1, 3
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L662
	add	x21, x24, 168
	add	x24, x24, 200
.L663:
	ldr	x1, [x21]
	ldr	w0, [x19]
	bl	FreeUsdByDec
	str	xzr, [x21], 8
	cmp	x24, x21
	bne	.L663
	add	x1, x20, 296
	ldr	w0, [x19]
	add	x1, x1, 32768
	mov	w2, 0
	ldr	w1, [x1, 2744]
	bl	FSP_SetDisplay
	mov	w0, 0
	b	.L683
.L661:
	ldr	x1, [x27, 208]
	ldr	x2, [x28, 208]
	cmp	x1, x2
	bls	.L656
	mov	w0, w26
	bl	IsPtsRewind
	cbnz	w0, .L656
	ldr	x2, .LC113
	mov	w1, 2511
	ldr	x4, [x27, 208]
	mov	w3, w26
	ldr	x5, [x28, 208]
	mov	w0, 24
	bl	dprint_normal
	ldr	x1, [x28, 208]
	ldr	x0, [x27, 208]
	str	x1, [x27, 208]
	str	x0, [x28, 208]
	b	.L656
.L662:
	ldr	w0, [x19, 8]
	add	w0, w0, 1
	str	w0, [x19, 8]
	b	.L653
.L702:
	ldr	x2, .LC111
	mov	w1, 2491
	mov	w0, 0
	bl	dprint_normal
	b	.L656
.L701:
	mov	w3, 2605
	ldr	x2, .LC109
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	b	.L683
	.size	MPEG2DEC_VDMPostProc, .-MPEG2DEC_VDMPostProc
	.align	3
.LC104:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC106:
	.xword	.LC105
	.align	3
.LC108:
	.xword	.LC107
	.align	3
.LC109:
	.xword	.LC49
	.align	3
.LC111:
	.xword	.LC110
	.align	3
.LC113:
	.xword	.LC112
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_WriteSliceInfo
	.type	MP2_WriteSliceInfo, %function
MP2_WriteSliceInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x4, x19, 48
	add	x0, x4, 45056
	ldr	w3, [x0, 240]
	cmp	w3, 1023
	bhi	.L709
	uxtw	x2, w3
	mov	x0, 12584
	lsl	x1, x2, 2
	movk	x0, 0x1, lsl 16
	sub	x1, x1, x2
	add	x0, x19, x0
	lsl	x1, x1, 2
	sub	x1, x1, x2
	ldr	w2, [x0, 2580]
	add	x1, x4, x1, lsl 2
	add	w2, w2, 3
	str	wzr, [x1, 256]
	str	w2, [x1, 240]
	ldr	w2, [x0, 2596]
	str	w2, [x1, 264]
	ldr	w2, [x0, 2588]
	sub	w2, w2, #3
	lsl	w2, w2, 3
	str	w2, [x1, 248]
	ldrsh	w2, [x0, 2576]
	cmp	w2, 1
	beq	.L710
	cmp	w2, 256
	bne	.L708
	ldr	w2, [x0, 2584]
	str	w2, [x1, 244]
	str	wzr, [x1, 260]
	ldr	w2, [x0, 2600]
	str	w2, [x1, 268]
	ldr	w0, [x0, 2592]
	lsl	w0, w0, 3
	str	w0, [x1, 252]
.L707:
	add	x4, x4, 45056
	add	w3, w3, 1
	mov	w0, 1
	str	w3, [x4, 240]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L708:
	ldrsb	w4, [x0, 2577]
	mov	w1, 3124
	ldrsb	w3, [x0, 2576]
	mov	w0, 1
	ldr	x2, .LC117
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L710:
	str	wzr, [x1, 244]
	str	wzr, [x1, 252]
	str	wzr, [x1, 260]
	str	wzr, [x1, 268]
	b	.L707
	.p2align 3
.L709:
	ldr	x2, .LC115
	mov	w4, 1024
	mov	w1, 3095
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x19
	bl	MP2_ClearCurPic
	mov	x0, 12584
	mov	w1, -5767169
	movk	x0, 0x1, lsl 16
	add	x19, x19, x0
	mov	w0, 0
	ldr	w2, [x19, 2636]
	str	wzr, [x19, 2712]
	and	w1, w2, w1
	str	w1, [x19, 2636]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_WriteSliceInfo, .-MP2_WriteSliceInfo
	.align	3
.LC115:
	.xword	.LC114
	.align	3
.LC117:
	.xword	.LC116
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_DecSlice
	.type	MP2_DecSlice, %function
MP2_DecSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	MP2_WriteSliceInfo
	cmp	w0, 1
	beq	.L712
	mov	x0, x19
	bl	MP2_DecSlice.part.5
.L712:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_DecSlice, .-MP2_DecSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_GetHDR
	.type	MP2_GetHDR, %function
MP2_GetHDR:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x22, x0
	mov	x0, x30
	add	x23, x22, 45056
	bl	_mcount
	add	x21, x23, 296
	add	x2, x22, 81920
	mov	w1, 32
	add	x20, x2, 736
	add	x21, x21, 32768
	mov	x0, x20
	ldp	x24, x25, [x2, 112]
	strb	wzr, [x22, 16]
	bl	BsShow
	mov	w19, w0
	mov	x0, x20
	ldr	w26, [x21, 2636]
	bl	BsPos
	str	w0, [x21, 2716]
	mov	w1, 32
	mov	x0, x20
	bl	BsSkip
	cmp	w19, 439
	beq	.L790
	mov	w0, 440
	cmp	w19, 435
	ccmp	w19, w0, 4, ne
	bne	.L723
.L719:
	add	x0, x23, 296
	add	x0, x0, 32768
	ldr	w1, [x0, 2712]
	cmp	w1, 1
	beq	.L791
.L720:
	cmp	w19, 435
	beq	.L725
.L794:
	ble	.L792
	cmp	w19, 437
	beq	.L729
	blt	.L748
	cmp	w19, 439
	beq	.L748
	cmp	w19, 440
	bne	.L724
	add	x19, x23, 296
	mov	x0, x20
	add	x19, x19, 32768
	ldr	w1, [x19, 2568]
	ldr	w21, [x19, 2708]
	add	w21, w21, w1
	bl	BsPos
	ldr	x2, .LC125
	add	w3, w21, w0, lsr 3
	mov	w1, 291
	mov	w0, 20
	bl	dprint_normal
	mov	x0, x22
	bl	group_of_pictures_header
	mov	x0, x20
	bl	BsResidBits
	tbnz	w0, #31, .L793
.L748:
	mov	w20, 0
.L722:
	mov	w0, w20
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L723:
	mov	w0, 439
	cmp	w19, 256
	ccmp	w19, w0, 4, ne
	beq	.L719
	cmp	w19, 435
	bne	.L794
.L725:
	add	x19, x23, 296
	mov	x0, x20
	add	x19, x19, 32768
	ldr	w1, [x19, 2568]
	ldr	w21, [x19, 2708]
	add	w21, w21, w1
	bl	BsPos
	ldr	x2, .LC120
	add	w3, w21, w0, lsr 3
	mov	w1, 258
	mov	w0, 20
	bl	dprint_normal
	mov	x0, x22
	bl	sequence_header
	mov	x0, x20
	bl	BsResidBits
	tbnz	w0, #31, .L795
	ldr	w0, [x19, 2636]
	and	w0, w0, 7
	cbnz	w0, .L734
	mov	w0, 1
	mov	x2, 196
	strb	w0, [x24]
	mov	x1, x24
	mov	x0, x25
	mov	w20, 0
	bl	memcpy
	ldr	w0, [x19, 2640]
	add	w0, w0, 1
	str	w0, [x19, 2640]
	b	.L722
	.p2align 3
.L792:
	cmp	w19, 256
	beq	.L727
	blt	.L724
	cmp	w19, 433
	blt	.L724
	add	x23, x23, 296
	mov	x0, x20
	add	x23, x23, 32768
	ldr	w1, [x23, 2568]
	ldr	w19, [x23, 2708]
	add	w19, w19, w1
	bl	BsPos
	ldr	x2, .LC133
	add	w3, w19, w0, lsr 3
	mov	w1, 322
	mov	w0, 20
	bl	dprint_normal
	mov	x0, x22
	bl	MP2_GetUsrData
	mov	w20, w0
	cbnz	w0, .L740
	ldr	w0, [x22]
	add	x1, x23, 2576
	bl	MP2_ClearCurPacket
	ldr	x0, .LC121
	ldr	x4, [x0]
	cbz	x4, .L749
	ldr	w0, [x22]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	mov	w20, -1
	blr	x4
	b	.L722
	.p2align 3
.L727:
	add	x19, x23, 296
	mov	x0, x20
	add	x19, x19, 32768
	ldr	w1, [x19, 2568]
	ldr	w21, [x19, 2708]
	add	w21, w21, w1
	bl	BsPos
	ldr	x2, .LC129
	add	w3, w21, w0, lsr 3
	mov	w1, 306
	mov	w0, 20
	bl	dprint_normal
	mov	x0, x22
	bl	picture_header
	mov	x0, x20
	bl	BsResidBits
	tbz	w0, #31, .L748
	ldr	x0, .LC121
	str	w26, [x19, 2636]
	ldr	x4, [x0]
	cbz	x4, .L739
	ldr	w0, [x22]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L739:
	ldr	w0, [x22]
	mov	x1, 35640
	add	x1, x23, x1
	mov	w20, -1
	bl	MP2_ClearCurPacket
	ldr	x2, .LC131
	mov	w3, 256
	mov	w1, 314
	mov	w0, 1
	bl	dprint_normal
	b	.L722
	.p2align 3
.L791:
	ldr	w2, [x0, 2636]
	tbz	x2, 22, .L720
	strb	w1, [x22, 16]
	orr	w2, w2, 8388608
	str	wzr, [x0, 2712]
	mov	w20, w1
	str	w2, [x0, 2636]
	mov	x0, x22
	bl	MP2_ProtocolPPSCheck
	b	.L722
	.p2align 3
.L790:
	ldr	x0, .LC118
	mov	x2, 40
	mov	x1, x20
	ldr	x3, [x0, 104]
	add	x0, x29, 104
	blr	x3
	mov	w1, 32
	add	x0, x29, 104
	bl	BsGet
	mov	w27, w0
	mov	w1, 32
	add	x0, x29, 104
	bl	BsGet
	mov	w1, 20553
	movk	w1, 0x4853, lsl 16
	cmp	w27, w1
	mov	w1, 20036
	movk	w1, 0x4345, lsl 16
	ccmp	w0, w1, 0, eq
	bne	.L719
	ldr	w20, [x21, 2712]
	cmp	w20, 1
	beq	.L796
.L721:
	mov	w0, 1
	mov	w20, 0
	strb	w0, [x22, 18]
	b	.L722
	.p2align 3
.L724:
	sub	w0, w19, #257
	cmp	w0, 174
	bhi	.L742
	add	x21, x23, 296
	add	x21, x21, 32768
	ldr	w0, [x21, 2632]
	cbz	w0, .L743
.L745:
	add	x23, x23, 296
	mov	w1, 589824
	add	x23, x23, 32768
	ldr	w0, [x23, 2636]
	tst	w0, w1
	beq	.L748
	orr	w0, w0, 4194304
	mov	w20, 1
	str	w0, [x23, 2636]
	mov	x0, x22
	str	w20, [x23, 2712]
	bl	MP2_WriteSliceInfo
	cmp	w0, w20
	beq	.L747
	mov	x0, x22
	bl	MP2_DecSlice.part.5
	cmp	w0, 1
	beq	.L747
	ldr	x2, .LC139
	mov	w3, w19
	mov	w1, 383
	mov	w0, w20
	mov	w20, 0
	bl	dprint_normal
	b	.L722
	.p2align 3
.L729:
	add	x19, x23, 296
	mov	x0, x20
	add	x19, x19, 32768
	ldr	w1, [x19, 2568]
	ldr	w21, [x19, 2708]
	add	w21, w21, w1
	bl	BsPos
	ldr	x2, .LC137
	add	w3, w21, w0, lsr 3
	mov	w1, 342
	mov	w0, 20
	bl	dprint_normal
	mov	x0, x22
	bl	extension
	mov	x0, x20
	bl	BsResidBits
	tbz	w0, #31, .L748
	ldr	x0, .LC121
	str	w26, [x19, 2636]
	ldr	x4, [x0]
	cbz	x4, .L741
	ldr	w0, [x22]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L741:
	mov	x1, 35640
	ldr	w0, [x22]
	add	x1, x23, x1
	mov	w20, -1
	bl	MP2_ClearCurPacket
	b	.L722
	.p2align 3
.L734:
	ldrb	w0, [x25]
	cmp	w0, 1
	beq	.L797
.L742:
	ldr	x0, .LC121
	ldr	x4, [x0]
	cbz	x4, .L748
.L786:
	ldr	w0, [x22]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	mov	w20, 0
	blr	x4
	b	.L722
	.p2align 3
.L740:
	ldr	x2, .LC135
	mov	w1, 336
	mov	w0, 1
	bl	dprint_normal
	b	.L722
	.p2align 3
.L796:
	ldr	w0, [x21, 2636]
	tbz	x0, 22, .L721
	strb	w20, [x22, 18]
	orr	w0, w0, 8388608
	strb	w20, [x22, 16]
	str	w0, [x21, 2636]
	mov	x0, x22
	str	wzr, [x21, 2712]
	bl	MP2_ProtocolPPSCheck
	b	.L722
	.p2align 3
.L749:
	mov	w20, -1
	b	.L722
	.p2align 3
.L743:
	mov	x0, x22
	mov	w20, 0
	bl	MP2_GetSequenceInfo
	ldr	w0, [x21, 2704]
	cbz	w0, .L722
	ldrb	w0, [x22, 17]
	cmp	w0, 1
	beq	.L722
	ldr	w0, [x21, 2632]
	cbnz	w0, .L745
	b	.L722
	.p2align 3
.L797:
	mov	x1, x25
	mov	x2, 196
	mov	x0, x24
	bl	memcpy
	ldr	x1, .LC121
	ldr	w0, [x19, 2636]
	ldr	x4, [x1]
	and	w0, w0, -8
	str	w0, [x19, 2636]
	cbnz	x4, .L786
	b	.L748
.L747:
	mov	w20, 1
	b	.L722
.L793:
	ldr	x0, .LC121
	str	w26, [x19, 2636]
	ldr	x4, [x0]
	cbz	x4, .L738
	ldr	w0, [x22]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L738:
	ldr	w0, [x22]
	mov	x1, 35640
	add	x1, x23, x1
	mov	w20, -1
	bl	MP2_ClearCurPacket
	ldr	x2, .LC127
	mov	w3, 440
	mov	w1, 299
	mov	w0, 1
	bl	dprint_normal
	b	.L722
.L795:
	ldr	x0, .LC121
	str	w26, [x19, 2636]
	ldr	x4, [x0]
	cbz	x4, .L733
	ldr	w0, [x22]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L733:
	ldr	w0, [x22]
	mov	x1, 35640
	add	x1, x23, x1
	mov	w20, -1
	bl	MP2_ClearCurPacket
	ldr	x2, .LC123
	mov	w3, 435
	mov	w1, 266
	mov	w0, 1
	bl	dprint_normal
	b	.L722
	.size	MP2_GetHDR, .-MP2_GetHDR
	.align	3
.LC118:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC120:
	.xword	.LC119
	.align	3
.LC121:
	.xword	g_EventReportFunc
	.align	3
.LC123:
	.xword	.LC122
	.align	3
.LC125:
	.xword	.LC124
	.align	3
.LC127:
	.xword	.LC126
	.align	3
.LC129:
	.xword	.LC128
	.align	3
.LC131:
	.xword	.LC130
	.align	3
.LC133:
	.xword	.LC132
	.align	3
.LC135:
	.xword	.LC134
	.align	3
.LC137:
	.xword	.LC136
	.align	3
.LC139:
	.xword	.LC138
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG2DEC_Decode
	.type	MPEG2DEC_Decode, %function
MPEG2DEC_Decode:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	add	x22, x19, 77824
	bl	_mcount
	add	x21, x22, 3640
	ldr	x3, .LC140
	mov	x1, x20
	mov	x2, 176
	mov	x0, x21
	add	x23, x19, 45056
	ldr	x3, [x3, 104]
	add	x20, x23, 296
	blr	x3
	ldr	w2, [x19]
	mov	x1, x21
	mov	x0, x20
	bl	MP2_ReceivePacket
	cmp	w0, 1
	beq	.L799
	ldr	x2, .LC142
	mov	w1, 2330
	mov	w0, 1
	mov	w20, 0
	bl	dprint_normal
.L800:
	mov	w0, w20
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L799:
	add	x20, x20, 32768
	add	x0, x19, 81920
	add	x0, x0, 736
	ldr	x1, [x20, 2608]
	ldr	w2, [x20, 2588]
	bl	BsInit
	ldr	x0, [x19, 32]
	ldr	w1, [x0, 856]
	cmp	w1, 1
	beq	.L830
.L801:
	ldr	w0, [x22, 2932]
	str	w0, [x22, 3124]
.L802:
	mov	x0, x19
	bl	MP2_GetHDR
	add	w0, w0, 1
	cmp	w0, 1
	bls	.L831
	mov	x0, x19
	bl	MP2_DecodingDecide
	cbz	w0, .L832
	cmn	w0, #1
	beq	.L805
	mov	x0, x19
	bl	MP2_GetPictureInfo
	cbnz	w0, .L808
	ldr	w0, [x19]
	mov	x1, 35640
	add	x1, x23, x1
	bl	MP2_ClearCurPacket
	mov	x0, x19
	bl	MP2_ClearCurPic
	ldr	x0, .LC143
	ldr	x4, [x0]
	cbz	x4, .L809
	ldr	w0, [x19]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L809:
	ldr	x2, .LC147
	mov	w1, 2383
	mov	w0, 1
	mov	w20, 0
	bl	dprint_normal
	b	.L800
	.p2align 3
.L831:
	ldr	x0, [x19, 32]
	ldr	w1, [x0, 856]
	cmp	w1, 1
	beq	.L833
.L804:
	ldrb	w0, [x19, 17]
	cmp	w0, 1
	beq	.L805
	mov	x1, 35640
	ldr	w0, [x19]
	add	x1, x23, x1
	mov	w20, 0
	bl	MP2_ClearCurPacket
	b	.L800
	.p2align 3
.L833:
	ldr	w0, [x0, 888]
	cbz	w0, .L804
.L805:
	mov	w20, 0
	ldr	x23, [sp, 48]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L830:
	ldr	w0, [x0, 888]
	cmp	w0, 1
	bne	.L801
	ldr	w0, [x22, 3124]
	str	w0, [x22, 2932]
	b	.L802
	.p2align 3
.L832:
	ldr	w0, [x19]
	mov	x1, 35640
	add	x1, x23, x1
	bl	MP2_ClearCurPacket
	mov	x0, x19
	bl	MP2_ClearCurPic
	ldr	x0, .LC143
	ldr	x4, [x0]
	cbz	x4, .L807
	ldr	w0, [x19]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L807:
	ldr	x2, .LC145
	mov	w1, 2370
	mov	w0, 20
	mov	w20, 0
	bl	dprint_normal
	b	.L800
	.p2align 3
.L808:
	mov	x0, x19
	bl	MP2_DecNewPic
	mov	w20, w0
	cbz	w0, .L834
	add	x0, x23, 296
	add	x0, x0, 32768
	ldr	w2, [x0, 2708]
	ldr	w20, [x0, 2568]
	ldr	w1, [x0, 2588]
	lsl	w20, w20, 3
	add	w1, w2, w1
	str	w1, [x0, 2708]
	b	.L800
	.p2align 3
.L834:
	add	x21, x23, 296
	ldr	w0, [x19]
	add	x21, x21, 32768
	ldr	w1, [x21, 2740]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19]
	add	x1, x21, 2576
	bl	MP2_ClearCurPacket
	mov	x0, x19
	bl	MP2_ClearCurPic
	ldr	x0, .LC143
	ldr	x4, [x0]
	cbz	x4, .L811
	ldr	w0, [x19]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L811:
	ldr	x2, .LC149
	mov	w1, 2394
	mov	w0, 1
	bl	dprint_normal
	b	.L800
	.size	MPEG2DEC_Decode, .-MPEG2DEC_Decode
	.align	3
.LC140:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC142:
	.xword	.LC141
	.align	3
.LC143:
	.xword	g_EventReportFunc
	.align	3
.LC145:
	.xword	.LC144
	.align	3
.LC147:
	.xword	.LC146
	.align	3
.LC149:
	.xword	.LC148
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_GetPacketState
	.type	MP2_GetPacketState, %function
MP2_GetPacketState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w1, [x19, 16]
	mov	w0, 2
	ldr	x19, [sp, 16]
	cmp	w1, 1
	csel	w0, w0, wzr, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_GetPacketState, .-MP2_GetPacketState
	.global	g_tmpusd
	.global	zigzag
	.global	default_intra_quantizer_matrix
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.6020, %object
	.size	__func__.6020, 18
__func__.6020:
	.string	"MP2_ArrangeVHBMem"
	.zero	6
	.type	__FUNCTION__.6070, %object
	.size	__FUNCTION__.6070, 19
__FUNCTION__.6070:
	.string	"MP2_DecodingDecide"
	.align	3
.LANCHOR1 = . + 0
	.type	CSWTCH.38, %object
	.size	CSWTCH.38, 12
CSWTCH.38:
	.word	5
	.word	1
	.word	2
	.zero	4
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
	.align	3
.LANCHOR3 = . + 0
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
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	ASCII(.string	"MP2_WriteSliceInfo Failed!\n" )
	.zero	4
.LC5:
	ASCII(.string	"%s arrange fs pool failed!\n" )
	.zero	4
.LC8:
	ASCII(.string	"ERROR: frm %d, integrality: %#x\n" )
	.zero	7
.LC10:
	ASCII(.string	"ERROR: frm %d, No Img buffer is allocated\n" )
	.zero	5
.LC12:
	ASCII(.string	"----------------- mp2 Imode -> %d ------------------\n" )
	.zero	2
.LC15:
	ASCII(.string	"frm %d pic type %d struct is %d total pos %#x\n" )
	.zero	1
.LC17:
	ASCII(.string	"NOTE: Drop non-I, cur is B\n" )
	.zero	4
.LC19:
	ASCII(.string	"NOTE: Drop non-I, cur is P\n" )
	.zero	4
.LC21:
	ASCII(.string	"NOTE: Drop non-I\n" )
	.zero	6
.LC23:
	ASCII(.string	"NOTE: Drop B\n" )
	.zero	2
.LC26:
	ASCII(.string	"%s %d pFwdImg = NULL,  pBwdImg = NULL!!\n" )
	.zero	7
.LC28:
	ASCII(.string	"fuction return value is null,%s %d !!\n" )
	.zero	1
.LC30:
	ASCII(.string	"dec P frame, fwd ref err(%d) > ref_thr(%d)\n" )
	.zero	4
.LC32:
	ASCII(.string	"dec B frame, fwd ref err(%d) > ref_thr(%d)\n" )
	.zero	4
.LC34:
	ASCII(.string	"dec B frame, bwd ref err(%d) > ref_thr(%d)\n" )
	.zero	4
.LC36:
	ASCII(.string	"Protocol %d\n" )
	.zero	3
.LC40:
	ASCII(.string	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d,new w/h = %d/%d\n" )
	.zero	3
.LC43:
	ASCII(.string	"new seq size %dx%d\n" )
	.zero	4
.LC47:
	ASCII(.string	"get frame store fail!\n" )
	.zero	1
.LC49:
	ASCII(.string	"line: %d, pImage is NULL!\n" )
	.zero	5
.LC54:
	ASCII(.string	"ERROR: frm %d, lost one field\n" )
	.zero	1
.LC56:
	ASCII(.string	"ERROR: frm %d, lost one field flg = %d, last_struct = %d\n" )
	.zero	6
.LC58:
	ASCII(.string	"Fatal Error: frm%d, get image buffer failed\n" )
	.zero	3
.LC60:
	ASCII(.string	"Chan:%d dec_pts: %lld Usertag: %lld\n" )
	.zero	3
.LC62:
	ASCII(.string	"line: %d(pCur, pFwd, pBwd)(%p, %p, %p)\n" )
.LC64:
	ASCII(.string	"pCur->pstDecodeFs = NULL, CurFsID %d, FwdFsID %d, BwdFsID %d\n" )
	.zero	2
.LC66:
	ASCII(.string	"dec addr: cur,cur2d,fwd,bwd,pmv = %p,%p,%p,%p,%p\n" )
	.zero	6
.LC72:
	ASCII(.string	"\nmpeg2 copy last 3 bytes of the first packet!\n\n" )
.LC76:
	ASCII(.string	"pMp2CodecInfo->pUsrDatArray[%d] is null\n" )
	.zero	7
.LC88:
	ASCII(.string	"ERROR: unsupported profile %d\n" )
	.zero	1
.LC90:
	ASCII(.string	"ERROR: unsupported level %d\n" )
	.zero	3
.LC97:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC100:
	ASCII(.string	"ERROR: frm %d, Invalid packet pointer!\n" )
.LC102:
	ASCII(.string	"line %d, pPacket->StreamPack[1].IsLastSeg = %d\n" )
.LC105:
	ASCII(.string	"pImg is null, pCurImg %#x pBwdImg %#x pFwdImg %#x\n" )
	.zero	5
.LC107:
	ASCII(.string	"image err(%d) > out_thr(%d), fs %d not display.\n" )
	.zero	7
.LC110:
	ASCII(.string	"ERROR,pBwdImg == NULL || pToQueImg == NULL\n" )
	.zero	4
.LC112:
	ASCII(.string	"Chan:%d exg_pts: %lld <-> %lld\n" )
.LC114:
	ASCII(.string	"Slice num = %d >= %d\n" )
	.zero	2
.LC116:
	ASCII(.string	"seg info is wrong! IsLastSeg[0] = %d, IsLastSeg[1] = %d\n" )
	.zero	7
.LC119:
	ASCII(.string	"found sh %#x\n" )
	.zero	2
.LC122:
	ASCII(.string	"SEQUENCE_HEADER_CODE Bitstream is not enough!\n" )
	.zero	1
.LC124:
	ASCII(.string	"found gh %#x\n" )
	.zero	2
.LC126:
	ASCII(.string	"GROUP_START_CODE Bitstream is not enough!\n" )
	.zero	5
.LC128:
	ASCII(.string	"found ph %#x\n" )
	.zero	2
.LC130:
	ASCII(.string	"PICTURE_START_CODE Bitstream is not enough!\n" )
	.zero	3
.LC132:
	ASCII(.string	"found ud %#x\n" )
	.zero	2
.LC134:
	ASCII(.string	"cann't get ud pointer\n" )
	.zero	1
.LC136:
	ASCII(.string	"found ext %#x\n" )
	.zero	1
.LC138:
	ASCII(.string	"MP2_DecSlice is wrong!\n" )
.LC141:
	ASCII(.string	"line %d, MP2_ReceivePacket receive packet failed!\n" )
	.zero	5
.LC144:
	ASCII(.string	"MP2 Decode Decide is wrong!\n" )
	.zero	3
.LC146:
	ASCII(.string	"MP2 get picture info is wrong!\n" )
.LC148:
	ASCII(.string	"MP2 dec new pic failed!\n" )
	.bss
	.align	3
.LANCHOR2 = . + 0
	.type	g_tmpusd, %object
	.size	g_tmpusd, 1024
g_tmpusd:
	.zero	1024
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
