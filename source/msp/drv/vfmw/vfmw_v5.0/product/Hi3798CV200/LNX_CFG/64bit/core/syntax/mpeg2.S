#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"mpeg2.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	MP2_SearchStartCode.part.3, %function
MP2_SearchStartCode.part.3:
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
	.size	MP2_SearchStartCode.part.3, .-MP2_SearchStartCode.part.3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_ArrangeVHBMem
	.type	MP2_ArrangeVHBMem, %function
MP2_ArrangeVHBMem:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 86016
	bl	_mcount
	ldr	x0, [x20, 2768]
	ldp	w2, w3, [x0, 56]
	cmp	w2, 31
	bls	.L18
	mov	w1, 8160
	sub	w4, w3, #32
	mov	w0, 8192
	cmp	w4, w1
	ccmp	w2, w0, 2, ls
	bhi	.L18
	ldr	x0, [x19]
	ldr	w1, [x0, 28]
	cmp	w1, 25
	beq	.L48
	mov	w22, w2
	mov	w21, w3
	mov	w24, 5
	mov	w23, 2
	mov	w25, 3
.L27:
	ldr	x0, .LC5
	mov	w1, 0
	mov	x2, 20
	ldr	x3, [x0, 96]
	add	x0, x29, 88
	blr	x3
	ldr	x0, [x19]
	stp	w22, w21, [x29, 92]
	stp	w22, w21, [x29, 100]
	ldr	w1, [x0, 28]
	cmp	w1, 24
	beq	.L32
	strb	w25, [x29, 89]
	sxtb	w1, w23
	strb	w24, [x29, 90]
.L38:
	ldr	w2, [x0, 732]
	ldr	w3, [x0, 736]
	strb	w1, [x29, 91]
	mul	w0, w22, w21
	mul	w1, w2, w3
	cmp	w0, w1
	ble	.L33
	ldr	x1, .LC7
	mov	w4, w22
	mov	w5, w21
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x0, .LC8
	ldr	x4, [x0]
	cbz	x4, .L41
	ldr	w0, [x20, 3392]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
	mov	w0, -1
	b	.L42
	.p2align 3
.L18:
	ldr	x1, .LC2
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
.L42:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L33:
	ldr	w0, [x20, 3392]
	add	x1, x29, 88
	bl	FSP_ConfigInstance
	cbnz	w0, .L34
	ldr	x1, [x19]
	add	x3, x29, 84
	ldr	w0, [x20, 3392]
	ldr	w2, [x1, 20]
	ldr	w1, [x1, 16]
	bl	FSP_ConfigFrameBuf
	cmp	w0, 2
	mov	w1, w0
	beq	.L49
	mov	w0, 1
	cbz	w1, .L42
.L36:
	ldr	x1, .LC10
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L42
	.p2align 3
.L48:
	ldr	w1, [x0, 772]
	cbz	w1, .L50
	ldr	w4, [x0, 732]
	ldr	w5, [x0, 736]
	cmp	w2, w4
	bhi	.L29
	cmp	w3, w5
	bhi	.L29
	ldr	w4, [x0, 760]
	mov	w22, w2
	ldr	w1, [x0, 756]
	mov	w21, w3
	mov	w23, 1
	add	w25, w1, 2
	cbz	w4, .L31
.L46:
	add	w1, w1, w23
	mov	w23, 17
	cmp	w1, w23
	csel	w23, w1, w23, le
.L31:
	ldrsb	w24, [x0, 780]
	b	.L27
	.p2align 3
.L34:
	ldr	x1, .LC12
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L42
	.p2align 3
.L50:
	ldr	w22, [x0, 732]
	cmp	w2, w22
	bhi	.L51
	ldr	w21, [x0, 736]
	cmp	w3, w21
	bhi	.L52
	ldr	w2, [x0, 760]
	mov	w23, 1
	ldr	w1, [x0, 756]
	add	w25, w1, 2
	cbnz	w2, .L46
	ldrsb	w24, [x0, 780]
	b	.L27
	.p2align 3
.L32:
	mov	w1, 1
	strb	w24, [x29, 90]
	strb	w1, [x29, 89]
	mov	w1, 1
	b	.L38
	.p2align 3
.L29:
	ldr	x1, .LC4
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L42
	.p2align 3
.L41:
	mov	w0, -1
	b	.L42
.L52:
	mov	w5, w21
.L24:
	ldr	x1, .LC4
	mov	w4, w22
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L42
.L51:
	ldr	w5, [x0, 736]
	b	.L24
.L49:
	add	x0, x20, 2784
	bl	ResetVoQueue
	b	.L36
	.size	MP2_ArrangeVHBMem, .-MP2_ArrangeVHBMem
	.align	3
.LC2:
	.xword	.LC1
	.align	3
.LC4:
	.xword	.LC3
	.align	3
.LC5:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC7:
	.xword	.LC6
	.align	3
.LC8:
	.xword	g_event_report
	.align	3
.LC10:
	.xword	.LC9
	.align	3
.LC12:
	.xword	.LC11
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_DecodingDecide
	.type	MP2_DecodingDecide, %function
MP2_DecodingDecide:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x23, x0
	mov	x0, x30
	add	x19, x23, 45056
	mov	w20, -1
	bl	_mcount
	add	x0, x19, 264
	add	x0, x0, 40960
	ldr	w3, [x0, 1100]
	tbnz	x3, 23, .L146
.L54:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L146:
	add	x25, x23, 86016
	ldr	x21, [x25, 2768]
	ldrb	w1, [x21, 17]
	cmp	w1, 3
	beq	.L55
	ldr	w0, [x0, 1112]
	cmp	w0, 1
	beq	.L55
	ands	w20, w3, 255
	bne	.L147
.L57:
	add	x22, x19, 264
	add	x22, x22, 40960
	ldr	w0, [x22, 1168]
	cbz	w0, .L148
	ldr	w0, [x22, 1088]
	ldr	x3, [x23]
	sub	w0, w0, #2
	cmp	w0, 1
	ldr	w2, [x3, 8]
	bls	.L149
.L61:
	add	x0, x19, 264
	sub	w1, w2, #1
	add	x0, x0, 40960
	cmp	w1, 4
	str	w2, [x0, 1088]
	bls	.L150
	ldrb	w27, [x21, 30]
	mov	w24, 1
	ldrb	w28, [x21, 17]
	.p2align 2
.L73:
	add	x22, x19, 264
	add	x22, x22, 40960
	ldr	w0, [x22, 1032]
	ldr	w26, [x22, 1172]
	ldr	w2, [x22, 1108]
	add	w26, w26, w0
	add	x0, x25, 1640
	str	w2, [x29, 108]
	bl	BsPos
	add	w5, w26, w0, lsr 3
	ldr	x1, .LC22
	mov	w4, w28
	ldr	w2, [x29, 108]
	mov	w3, w27
	mov	w0, 18
	bl	dprint_vfmw
	ldr	w1, [x22, 1100]
	mov	w0, -14155777
	and	w0, w1, w0
	str	w0, [x22, 1100]
	ldr	x0, [x23]
	ldr	w0, [x0, 668]
	cmp	w0, 1
	beq	.L151
	ldr	w0, [x22, 1160]
	cbz	w0, .L152
	cmp	w0, 1
	bls	.L153
.L88:
	add	x22, x19, 264
	ldr	w0, [x25, 3392]
	add	x22, x22, 40960
	ldr	w1, [x22, 1196]
	bl	FSP_GetFsImagePtr
	mov	x26, x0
	ldr	w1, [x22, 1200]
	ldr	w0, [x25, 3392]
	bl	FSP_GetFsImagePtr
	cmp	x26, xzr
	ccmp	x0, xzr, 4, ne
	beq	.L154
	ldrb	w1, [x21, 30]
	cmp	w1, 2
	beq	.L155
	cmp	w1, 3
	beq	.L156
.L96:
	cbnz	w24, .L110
	ldrb	w0, [x21, 17]
	cmp	w0, 3
	beq	.L102
	add	x0, x19, 264
	add	x0, x0, 40960
	ldr	w0, [x0, 1112]
	cbnz	w0, .L54
.L102:
	ldrb	w0, [x21, 35]
	cmp	w0, 1
	beq	.L157
	ldrb	w0, [x21, 26]
	cmp	w0, 1
	beq	.L158
	add	x1, x19, 264
	add	x1, x1, 40960
	ldr	w0, [x1, 1284]
	add	w0, w0, 1
	str	w0, [x1, 1284]
	lsl	w0, w0, 1
	str	w0, [x1, 1280]
.L104:
	ldr	w0, [x25, 1540]
	add	x19, x19, 264
	add	x19, x19, 40960
	add	w0, w0, 1
	str	w0, [x25, 1540]
	ldr	w0, [x19, 1108]
	add	w0, w0, 1
	str	w0, [x19, 1108]
	b	.L54
	.p2align 3
.L147:
	ldr	x0, .LC13
	ldr	x4, [x0]
	cbz	x4, .L58
	ldr	w0, [x25, 3392]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 103
	blr	x4
	add	x0, x19, 264
	add	x0, x0, 40960
	ldr	w3, [x0, 1100]
.L58:
	add	x19, x19, 264
	ldr	x1, .LC15
	add	x19, x19, 40960
	mov	w0, 22
	mov	w20, 0
	ldr	w2, [x19, 1108]
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L55:
	ldr	w0, [x25, 3396]
	ands	w20, w3, 255
	add	w0, w0, 1
	str	w0, [x25, 3396]
	beq	.L57
	b	.L147
	.p2align 3
.L150:
	ldr	x0, .LC20
	ldrb	w0, [x0,w1,uxtw]
	adr	x1, .Lrtx68
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx68:
	.section	.rodata
	.align	0
	.align	2
.L68:
	.byte	(.L67 - .Lrtx68) / 4
	.byte	(.L69 - .Lrtx68) / 4
	.byte	(.L140 - .Lrtx68) / 4
	.byte	(.L71 - .Lrtx68) / 4
	.byte	(.L72 - .Lrtx68) / 4
	.text
	.p2align 3
.L152:
	ldrb	w1, [x21, 30]
	sub	w0, w1, #2
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L159
.L91:
	cmp	w1, 3
	bne	.L88
	ldr	x1, .LC30
	mov	w0, 1
	mov	w24, 0
	bl	dprint_vfmw
	b	.L88
	.p2align 3
.L156:
	cbz	x26, .L160
	ldr	x1, [x23]
	ldr	w2, [x26, 152]
	ldr	w3, [x1]
	cmp	w2, w3
	bhi	.L98
	ldr	w2, [x0, 152]
	cbz	x0, .L101
	cmp	w3, w2
	bcs	.L96
.L101:
	ldr	x1, .LC41
	mov	w0, 1
	bl	dprint_vfmw
	b	.L54
	.p2align 3
.L140:
	ldrb	w27, [x21, 30]
	mov	w24, 0
	ldrb	w28, [x21, 17]
	b	.L73
	.p2align 3
.L69:
	ldrb	w27, [x21, 30]
	sub	w0, w27, #2
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L161
.L142:
	ldrb	w28, [x21, 17]
	mov	w24, 1
	b	.L73
	.p2align 3
.L67:
	ldrb	w27, [x21, 30]
	cmp	w27, 3
	bne	.L142
	ldrb	w27, [x21, 17]
	cmp	w27, 3
	beq	.L162
.L83:
	add	x0, x19, 264
	mov	w24, 0
	add	x0, x0, 40960
	ldr	w1, [x0, 1112]
	cmp	w1, wzr
	cset	w1, eq
	str	w1, [x0, 1112]
	ldrb	w27, [x21, 30]
	ldrb	w28, [x21, 17]
	b	.L73
	.p2align 3
.L72:
	ldrb	w27, [x21, 30]
	cmp	w27, 1
	beq	.L163
	cmp	w27, 2
	beq	.L164
.L78:
	ldrb	w0, [x21, 17]
	cmp	w0, 3
	beq	.L79
	add	x0, x19, 264
	add	x0, x0, 40960
	ldr	w1, [x0, 1112]
	cmp	w1, wzr
	cset	w1, eq
	str	w1, [x0, 1112]
.L79:
	ldr	w0, [x3, 1028]
	cmp	w0, 1
	bne	.L140
	mov	w0, 2
	str	w0, [x3, 1028]
	mov	w24, 0
	ldrb	w27, [x21, 30]
	ldrb	w28, [x21, 17]
	b	.L73
	.p2align 3
.L71:
	ldrb	w0, [x21, 30]
	cmp	w0, 1
	mov	w27, w0
	beq	.L165
	cmp	w0, 3
	beq	.L166
.L82:
	cmp	w0, 2
	beq	.L86
	mov	w27, w0
	b	.L142
	.p2align 3
.L151:
	ldr	w1, [x22, 1160]
	cbnz	w1, .L88
	ldrb	w1, [x21, 30]
	cmp	w1, 3
	beq	.L167
	cmp	w1, 2
	bne	.L88
	ldr	x1, .LC26
	bl	dprint_vfmw
	b	.L88
	.p2align 3
.L149:
	cmp	w2, 1
	ccmp	w2, 4, 4, hi
	bne	.L61
	ldr	x1, .LC19
	mov	w0, 2
	bl	dprint_vfmw
	ldrb	w0, [x21, 30]
	cmp	w0, 1
	beq	.L137
	ldr	w0, [x22, 1100]
	ldr	w1, [x22, 1200]
	orr	w0, w0, 128
	str	w0, [x22, 1100]
	ldr	w0, [x25, 3392]
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	cbz	x0, .L64
	ldr	w0, [x25, 3392]
	ldr	x1, [x24, 544]
	bl	FreeUsdByDec
	ldr	w0, [x25, 3392]
	ldr	x1, [x24, 552]
	bl	FreeUsdByDec
	ldr	w0, [x25, 3392]
	ldr	x1, [x24, 560]
	bl	FreeUsdByDec
	ldr	w0, [x25, 3392]
	ldr	x1, [x24, 568]
	bl	FreeUsdByDec
	add	x0, x24, 512
	mov	w2, 1
	stp	xzr, xzr, [x0, 32]
	stp	xzr, xzr, [x0, 48]
	ldr	w1, [x22, 1200]
	ldr	w0, [x25, 3392]
	bl	FSP_ClearLogicFs
	ldr	w0, [x25, 3392]
	mov	w2, 1
	ldr	w1, [x22, 1196]
	bl	FSP_ClearLogicFs
	str	wzr, [x22, 1196]
	str	wzr, [x22, 1200]
	ldr	w0, [x25, 3392]
	bl	FSP_GetFspType
	cbnz	w0, .L168
.L64:
	add	x0, x19, 264
	add	x0, x0, 40960
	str	wzr, [x0, 1160]
.L137:
	ldr	x3, [x23]
	ldr	w2, [x3, 8]
	b	.L61
	.p2align 3
.L148:
	ldr	x1, .LC17
	mov	w0, 1
	ldr	w2, [x22, 1108]
	bl	dprint_vfmw
	b	.L54
	.p2align 3
.L155:
	cbz	x26, .L94
	ldr	x0, [x23]
	ldr	w2, [x26, 152]
	ldr	w3, [x0]
	cmp	w2, w3
	bls	.L96
	ldr	x1, .LC37
	mov	w0, 1
	bl	dprint_vfmw
	b	.L54
	.p2align 3
.L110:
	mov	w20, 1
	b	.L54
	.p2align 3
.L154:
	ldr	x2, .LC31
	mov	w3, 869
	ldr	x1, .LC33
	mov	w0, 1
	bl	dprint_vfmw
	b	.L54
.L157:
	add	x0, x19, 264
	ldrb	w1, [x21, 18]
	add	x0, x0, 40960
	ldrb	w2, [x21, 24]
	add	w2, w2, w1
	ldr	w1, [x0, 1284]
	add	w2, w2, 1
	add	w1, w2, w1
	str	w1, [x0, 1284]
	lsl	w1, w1, 1
	str	w1, [x0, 1280]
	b	.L104
.L160:
	ldr	x0, [x23]
	ldr	w2, [x26, 152]
	ldr	w3, [x0]
.L98:
	ldr	x1, .LC39
	mov	w0, 1
	bl	dprint_vfmw
	b	.L54
.L158:
	add	x0, x19, 264
	add	x0, x0, 40960
	ldr	w2, [x0, 1284]
	ldr	w1, [x0, 1280]
	add	w2, w2, 1
	str	w2, [x0, 1284]
	ldrb	w2, [x21, 24]
	add	w2, w2, 2
	add	w1, w2, w1
	str	w1, [x0, 1280]
	b	.L104
.L159:
	ldr	x1, .LC28
	mov	w0, 1
	mov	w24, 0
	bl	dprint_vfmw
	b	.L88
.L163:
	ldr	w0, [x3, 1028]
	cbnz	w0, .L78
	ldrb	w28, [x21, 17]
	mov	w24, w27
	b	.L73
.L165:
	str	wzr, [x25, 3404]
	ldrb	w0, [x21, 30]
	cmp	w0, 3
	bne	.L82
.L85:
	ldrb	w28, [x21, 17]
	cmp	w28, 3
	bne	.L83
	mov	w27, w28
	mov	w24, 0
	b	.L73
.L161:
	cmp	w27, 2
	beq	.L169
.L76:
	ldrb	w28, [x21, 17]
	cmp	w28, 3
	bne	.L83
	mov	w24, 0
	b	.L73
.L164:
	ldrb	w0, [x19, 265]
	cmp	w0, 3
	beq	.L78
	ldrb	w24, [x19, 264]
	cmp	w24, 1
	bne	.L78
	ldrb	w28, [x21, 17]
	b	.L73
.L86:
	mov	w24, 1
	str	w24, [x25, 3404]
	ldrb	w27, [x21, 30]
	ldrb	w28, [x21, 17]
	b	.L73
.L166:
	ldr	w0, [x25, 3404]
	cbnz	w0, .L142
	b	.L85
.L94:
	ldr	x2, .LC31
	mov	w3, 879
	ldr	x1, .LC35
	mov	w0, 1
	bl	dprint_vfmw
	b	.L54
.L167:
	ldr	x1, .LC24
	mov	w24, 0
	bl	dprint_vfmw
	b	.L88
.L162:
	mov	w28, w27
	mov	w24, 0
	b	.L73
.L169:
	ldrb	w0, [x19, 265]
	cmp	w0, 3
	beq	.L76
	ldrb	w24, [x19, 264]
	cmp	w24, 1
	bne	.L76
	ldrb	w28, [x21, 17]
	b	.L73
.L168:
	ldr	w0, [x25, 3392]
	bl	FSP_GetNullLogicFs
	str	w0, [x22, 1196]
	str	w0, [x22, 1200]
	b	.L64
.L153:
	ldrb	w1, [x21, 30]
	b	.L91
	.size	MP2_DecodingDecide, .-MP2_DecodingDecide
	.align	3
.LC13:
	.xword	g_event_report
	.align	3
.LC15:
	.xword	.LC14
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC19:
	.xword	.LC18
	.align	3
.LC20:
	.xword	.L68
	.align	3
.LC22:
	.xword	.LC21
	.align	3
.LC24:
	.xword	.LC23
	.align	3
.LC26:
	.xword	.LC25
	.align	3
.LC28:
	.xword	.LC27
	.align	3
.LC30:
	.xword	.LC29
	.align	3
.LC31:
	.xword	.LANCHOR0
	.align	3
.LC33:
	.xword	.LC32
	.align	3
.LC35:
	.xword	.LC34
	.align	3
.LC37:
	.xword	.LC36
	.align	3
.LC39:
	.xword	.LC38
	.align	3
.LC41:
	.xword	.LC40
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_EstimatePicQp
	.type	MP2_EstimatePicQp, %function
MP2_EstimatePicQp:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC42
	mov	x2, 128
	add	x0, x29, 32
	add	x1, x1, 24
	bl	memcpy
	add	x1, x19, 86016
	ldr	w0, [x19, 292]
	ldr	w2, [x1, 1420]
	cmp	w2, 1
	beq	.L171
	ldr	x1, [x1, 2768]
	ldrb	w1, [x1, 21]
	cbnz	w1, .L176
	lsl	w0, w0, 1
.L171:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L176:
	add	x1, x29, 160
	ldr	x19, [sp, 16]
	add	x0, x1, x0, sxtw 2
	ldr	w0, [x0, -128]
	ldp	x29, x30, [sp], 160
	ret
	.size	MP2_EstimatePicQp, .-MP2_EstimatePicQp
	.align	3
.LC42:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_GetSequenceInfo
	.type	MP2_GetSequenceInfo, %function
MP2_GetSequenceInfo:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x24, x0
	mov	x0, x30
	add	x19, x24, 45056
	add	x20, x24, 86016
	bl	_mcount
	str	wzr, [x29, 100]
	add	x0, x19, 264
	add	x0, x0, 40960
	ldr	x21, [x20, 2768]
	stp	wzr, wzr, [x29, 92]
	ldr	x25, [x20, 2776]
	ldr	w2, [x0, 1156]
	cmp	w2, 1
	beq	.L179
	cmp	w2, 2
	bne	.L246
	ldr	w1, [x0, 1100]
	mov	w0, 1769472
	and	w0, w1, w0
	cmp	w0, 589824
	beq	.L182
.L181:
	ldr	x1, .LC44
	mov	w0, 17
	bl	dprint_vfmw
	add	x0, x19, 264
	add	x0, x0, 40960
	ldr	w0, [x0, 1156]
	cmp	w0, 1
	beq	.L247
.L184:
	ldr	w0, [x21, 56]
	add	x2, x19, 264
	add	x2, x2, 40960
	add	w0, w0, 15
	lsr	w0, w0, 4
	str	w0, [x21, 64]
	ldr	w1, [x2, 1156]
	cmp	w1, 2
	beq	.L248
	ldr	w3, [x21, 60]
	add	w1, w3, 15
	lsr	w1, w1, 4
	stp	w1, wzr, [x21, 68]
	ldr	w2, [x2, 1156]
	cmp	w2, 2
	beq	.L249
.L187:
	add	x2, x19, 264
	add	x2, x2, 40960
	ldr	w2, [x2, 1168]
	cbz	w2, .L189
	ldr	w3, [x25, 64]
	cmp	w0, w3
	beq	.L250
.L189:
	add	x22, x19, 264
	ldr	w0, [x20, 3392]
	add	x22, x22, 40960
	ldr	w1, [x22, 1200]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	cbz	x0, .L192
	ldr	w0, [x20, 3392]
	ldr	x1, [x23, 544]
	bl	FreeUsdByDec
	ldr	w0, [x20, 3392]
	ldr	x1, [x23, 552]
	bl	FreeUsdByDec
	ldr	w0, [x20, 3392]
	ldr	x1, [x23, 560]
	bl	FreeUsdByDec
	ldr	w0, [x20, 3392]
	ldr	x1, [x23, 568]
	bl	FreeUsdByDec
	add	x0, x23, 512
	mov	w2, 1
	stp	xzr, xzr, [x0, 32]
	stp	xzr, xzr, [x0, 48]
	ldr	w0, [x20, 3392]
	ldr	w1, [x22, 1200]
	bl	FSP_ClearLogicFs
	ldr	w0, [x20, 3392]
	mov	w2, 1
	ldr	w1, [x22, 1196]
	bl	FSP_ClearLogicFs
	str	wzr, [x22, 1196]
	str	wzr, [x22, 1200]
	ldr	w0, [x20, 3392]
	bl	FSP_GetFspType
	cbnz	w0, .L251
.L192:
	add	x22, x19, 264
	add	x1, x20, 2784
	add	x22, x22, 40960
	str	wzr, [x22, 1160]
	ldr	w0, [x20, 3392]
	bl	FSP_ClearNotInVoQueue
	ldr	x0, [x24]
	ldr	w1, [x0, 772]
	cbnz	w1, .L194
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L252
.L194:
	add	x0, x19, 264
	add	x0, x0, 40960
	ldr	w1, [x0, 1168]
	cbz	w1, .L196
	ldr	w1, [x25, 64]
	cbz	w1, .L196
	ldr	w1, [x25, 68]
	cbnz	w1, .L253
	.p2align 2
.L196:
	ldr	w0, [x20, 3392]
	bl	FSP_GetFspType
	cbz	w0, .L237
	ldr	x23, .LC49
.L197:
	add	x22, x19, 264
	mov	w1, 0
	add	x22, x22, 40960
	mov	x0, x24
	str	wzr, [x22, 1168]
	str	wzr, [x22, 1184]
	bl	MP2_ArrangeVHBMem
	str	w0, [x22, 1168]
	ldr	x1, .LC51
	mov	w0, 1
	ldp	w2, w3, [x21, 64]
	lsl	w3, w3, 4
	lsl	w2, w2, 4
	bl	dprint_vfmw
.L195:
	ldr	x4, [x23]
	cbz	x4, .L244
	ldp	w2, w1, [x21, 64]
	ldp	w5, w3, [x25, 64]
	ldr	w0, [x20, 3392]
	strh	w2, [x29, 108]
	add	x2, x29, 104
	strh	w1, [x29, 110]
	mov	w1, 2
	strh	w3, [x29, 106]
	mov	w3, 8
	strh	w5, [x29, 104]
	blr	x4
.L244:
	add	x0, x19, 264
	add	x0, x0, 40960
	ldr	w2, [x0, 1168]
.L190:
	add	x19, x19, 264
	add	x19, x19, 40960
	str	w2, [x19, 1096]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L246:
	ldr	w1, [x0, 1100]
	mov	w2, 3538944
	tst	w1, w2
	beq	.L182
	mov	w2, 2
	str	w2, [x0, 1156]
	tbnz	x1, 17, .L183
	orr	w1, w1, w2
	str	w1, [x0, 1100]
.L183:
	mov	w2, 2
	tbnz	x1, 20, .L181
	add	x0, x19, 264
	orr	w1, w1, 16
	add	x0, x0, 40960
	str	w1, [x0, 1100]
	b	.L181
	.p2align 3
.L182:
	add	x0, x19, 264
	mov	w1, 1
	add	x0, x0, 40960
	mov	w2, w1
	str	w1, [x0, 1156]
	mov	w0, 17
	ldr	x1, .LC44
	bl	dprint_vfmw
	add	x0, x19, 264
	add	x0, x0, 40960
	ldr	w0, [x0, 1156]
	cmp	w0, 1
	bne	.L184
.L247:
	mov	w2, 3
	mov	w1, 5
	strb	w0, [x21, 35]
	strb	w0, [x21, 26]
	strb	w2, [x21, 17]
	strb	w0, [x21, 19]
	strb	w0, [x21, 36]
	strb	wzr, [x21, 20]
	strb	wzr, [x21, 21]
	strb	wzr, [x21, 22]
	strb	wzr, [x21, 23]
	strb	wzr, [x21, 16]
	str	w1, [x21, 152]
	b	.L184
	.p2align 3
.L237:
	ldr	w0, [x20, 3392]
	add	x2, x29, 96
	add	x3, x29, 100
	add	x1, x29, 92
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x24]
	ldr	w2, [x0, 772]
	cmp	w2, 1
	beq	.L254
.L242:
	ldr	x23, .LC49
.L199:
	strb	wzr, [x20, 3409]
	b	.L197
	.p2align 3
.L179:
	mov	w1, 18
	ldr	w3, [x0, 1100]
	movk	w1, 0x12, lsl 16
	and	w1, w3, w1
	cmp	w1, 1179648
	bne	.L181
	mov	w2, 2
	str	w2, [x0, 1156]
	b	.L181
	.p2align 3
.L248:
	ldrb	w1, [x21, 35]
	cbnz	w1, .L186
	ldr	w3, [x21, 60]
	add	w1, w3, 31
	lsr	w1, w1, 5
	lsl	w1, w1, 1
	stp	w1, wzr, [x21, 68]
	ldr	w2, [x2, 1156]
	cmp	w2, 2
	bne	.L187
	add	w2, w3, 15
	mov	w3, w1
	lsr	w2, w2, 4
	b	.L188
	.p2align 3
.L249:
	ldrb	w2, [x21, 35]
	cbnz	w2, .L187
	add	w3, w3, 31
	mov	w2, w1
	lsr	w3, w3, 5
	lsl	w3, w3, 1
.L188:
	sub	w2, w3, w2
	str	w2, [x21, 72]
	b	.L187
	.p2align 3
.L186:
	ldr	w1, [x21, 60]
	add	w1, w1, 15
	lsr	w1, w1, 4
	stp	w1, wzr, [x21, 68]
	b	.L187
	.p2align 3
.L254:
	ldr	w0, [x29, 100]
	cmp	w0, wzr
	ble	.L255
.L200:
	mov	w0, 1
	strb	w0, [x20, 3409]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L253:
	ldr	x1, .LC46
	str	wzr, [x0, 1168]
	mov	w0, 1
	bl	dprint_vfmw
	b	.L196
	.p2align 3
.L250:
	ldr	w0, [x25, 68]
	cmp	w0, w1
	bne	.L189
	b	.L190
	.p2align 3
.L251:
	ldr	w0, [x20, 3392]
	bl	FSP_GetNullLogicFs
	str	w0, [x22, 1196]
	str	w0, [x22, 1200]
	b	.L192
	.p2align 3
.L252:
	ldr	w0, [x22, 1168]
	cbz	w0, .L256
	ldr	x23, .LC49
	b	.L195
	.p2align 3
.L256:
	mov	w1, 0
	mov	x0, x24
	bl	MP2_ArrangeVHBMem
	str	wzr, [x22, 1184]
	str	w0, [x22, 1168]
	ldr	x23, .LC49
	b	.L195
	.p2align 3
.L255:
	ldr	w0, [x29, 96]
	cmp	w0, 32
	bgt	.L200
	ldr	x0, [x24, 8]
	cbnz	x0, .L200
	ldr	w3, [x20, 3396]
	cbz	w3, .L242
	ldr	w6, [x21, 64]
	cbz	w6, .L242
	ldr	w5, [x20, 3416]
	ldr	w7, [x21, 68]
	cmp	w7, w5
	beq	.L242
	ldr	w4, [x20, 3412]
	ldr	x23, .LC49
	cmp	w6, w4
	beq	.L199
	ldr	x1, .LC48
	mov	w0, w2
	bl	dprint_vfmw
	ldr	w0, [x21, 68]
	str	w0, [x20, 3416]
	ldr	x4, [x23]
	ldr	w0, [x21, 64]
	str	w0, [x20, 3412]
	cbz	x4, .L199
	ldr	w0, [x20, 3392]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 120
	blr	x4
	strb	wzr, [x20, 3409]
	b	.L197
	.size	MP2_GetSequenceInfo, .-MP2_GetSequenceInfo
	.align	3
.LC44:
	.xword	.LC43
	.align	3
.LC46:
	.xword	.LC45
	.align	3
.LC48:
	.xword	.LC47
	.align	3
.LC49:
	.xword	g_event_report
	.align	3
.LC51:
	.xword	.LC50
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
	add	x0, x19, 86016
	ldr	x3, [x0, 2768]
	ldrb	w0, [x3, 30]
	cmp	w0, 1
	beq	.L262
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L262:
	add	x19, x19, 45056
	ldr	w5, [x3, 80]
	add	x2, x19, 264
	add	x2, x2, 40960
	ldr	w0, [x2, 1252]
	ldr	w1, [x2, 1264]
	ldr	w6, [x2, 1256]
	ldr	w4, [x2, 1268]
	add	w0, w0, w1
	cmp	w0, wzr
	add	w4, w6, w4
	ccmp	w5, wzr, 4, gt
	ccmp	w4, wzr, 4, gt
	ble	.L259
	ldrb	w1, [x3, 35]
	cmp	w1, 1
	beq	.L263
	lsl	w1, w0, 1
	mul	w0, w1, w5
	sdiv	w0, w0, w4
.L261:
	lsl	w2, w0, 2
	mov	w1, 19923
	sub	w2, w2, w0
	movk	w1, 0x1062, lsl 16
	lsl	w3, w2, 5
	add	x19, x19, 264
	add	w2, w2, w3
	add	x19, x19, 40960
	add	w0, w2, w0
	smull	x1, w0, w1
	asr	x1, x1, 38
	sub	w0, w1, w0, asr 31
	str	w0, [x19, 1288]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L259:
	str	wzr, [x2, 1288]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L263:
	ldr	w3, [x2, 1260]
	ldr	w1, [x2, 1272]
	mul	w0, w0, w5
	add	w1, w3, w1
	sdiv	w0, w0, w1
	b	.L261
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
	add	x19, x19, 86016
	bl	_mcount
	ldr	x0, [x19, 2768]
	ldr	w0, [x0, 92]
	sub	w0, w0, #1
	cmp	w0, 2
	bhi	.L266
	ldr	x1, .LC52
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x1, w0, uxtw 2]
	ret
	.p2align 3
.L266:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_CalcDar, .-MP2_CalcDar
	.align	3
.LC52:
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
	mov	x24, x0
	mov	x0, x30
	add	x21, x24, 45056
	add	x22, x24, 86016
	bl	_mcount
	add	x1, x21, 264
	add	x1, x1, 40960
	ldr	w0, [x22, 3392]
	ldr	x20, [x22, 2768]
	ldr	w1, [x1, 1204]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L267
	ldrb	w23, [x20, 30]
	cmp	w23, 4
	beq	.L280
	sub	w23, w23, #1
	and	w0, w23, 3
	mov	w5, w0
	uxtb	w4, w0
.L269:
	ldrb	w0, [x20, 35]
	mov	w3, 1
	ldrb	w2, [x19, 65]
	ldrb	w1, [x20, 17]
	cmp	w0, wzr
	ubfx	x2, x2, 2, 2
	cset	w8, eq
	orr	w2, w1, w2
	ldr	w7, [x20, 136]
	cbnz	w0, .L270
	cmp	w1, 3
	beq	.L287
	add	x0, x21, 264
	cmp	w1, 1
	add	x0, x0, 40960
	cset	w3, eq
	ldr	w0, [x0, 1112]
	cbz	w0, .L270
	cset	w3, ne
.L270:
	ldr	x0, [x22, 2768]
	ldr	w0, [x0, 92]
	sub	w0, w0, #1
	cmp	w0, 2
	bhi	.L282
.L289:
	ldr	x1, .LC53
	ldr	w1, [x1, w0, uxtw 2]
	and	w6, w1, 7
.L273:
	ldrb	w0, [x19, 65]
	bfi	w0, w8, 0, 2
	bfi	w0, w2, 2, 2
	bfi	w0, w3, 4, 2
	strb	w0, [x19, 65]
	ldrb	w0, [x19, 64]
	bfi	w0, w4, 0, 2
	and	w0, w0, -29
	bfi	w0, w7, 5, 3
	strb	w0, [x19, 64]
	mov	x0, x19
	ldr	w2, [x19, 64]
	bfi	w2, w6, 14, 3
	str	w2, [x19, 64]
	lsr	w2, w2, 16
	ldrb	w3, [x20, 4]
	bfi	w2, w3, 1, 1
	strb	w2, [x19, 66]
	ldr	w2, [x20, 8]
	str	w2, [x19, 120]
	stp	w5, w5, [x19, 56]
	bl	SetAspectRatio
	mov	w0, 3
	str	w0, [x19, 296]
	mov	w0, 4
	mov	w2, 1
	ldrb	w1, [x20, 17]
	strb	w2, [x19, 291]
	cmp	w1, 3
	csel	w0, w0, wzr, ne
	strb	w0, [x19, 284]
	ldr	x0, [x24, 8]
	cbz	x0, .L275
	ldrb	w0, [x0, 145]
	str	w0, [x19, 300]
.L276:
	str	w0, [x19, 304]
	str	w0, [x19, 308]
	mov	w0, 1
	strb	w0, [x19, 289]
	ldr	w0, [x20, 80]
	str	w0, [x19, 108]
	ldr	w2, [x20, 56]
	str	w2, [x19, 68]
	ldr	w1, [x20, 60]
	str	w1, [x19, 72]
	ldr	x0, [x24]
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L288
.L277:
	lsr	w3, w2, 1
	lsr	w0, w1, 1
	stp	w3, w0, [x19, 84]
	add	x21, x21, 264
	mov	x0, x24
	ldr	w3, [x20, 156]
	add	x21, x21, 40960
	str	w3, [x19, 92]
	ldr	w3, [x20, 160]
	str	w3, [x19, 96]
	stp	w2, w1, [x19, 76]
	ldrb	w1, [x20, 35]
	str	w1, [x19, 396]
	ldrb	w1, [x20, 26]
	str	w1, [x19, 400]
	ldr	w1, [x20, 152]
	str	w1, [x19, 408]
	bl	MP2_CalcRealEncFrameRate
	ldr	w0, [x21, 1288]
	str	w0, [x19, 404]
	cbz	w23, .L278
	ldrb	w1, [x22, 3420]
	and	w1, w1, 1
.L279:
	ldrb	w0, [x19, 636]
	bfi	w0, w1, 0, 1
	strb	w0, [x19, 636]
	ldrb	w1, [x22, 3420]
	ubfx	x1, x1, 1, 4
	bfi	w0, w1, 1, 4
	strb	w0, [x19, 636]
	ldrb	w0, [x20, 196]
	and	w0, w0, -32
	strb	w0, [x20, 196]
.L267:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L282:
	mov	w1, 0
	mov	w6, 0
	b	.L273
	.p2align 3
.L278:
	ldrb	w1, [x20, 196]
	ldrb	w0, [x22, 3420]
	and	w1, w1, 1
	bfi	w0, w1, 0, 1
	strb	w0, [x22, 3420]
	ldrb	w2, [x20, 196]
	ubfx	x2, x2, 1, 4
	bfi	w0, w2, 1, 4
	strb	w0, [x22, 3420]
	b	.L279
	.p2align 3
.L280:
	mov	w5, 0
	mov	w4, 0
	mov	w23, 0
	b	.L269
	.p2align 3
.L288:
	ldr	w3, [x19, 112]
	add	w0, w1, 15
	lsr	w0, w0, 4
	ldr	w4, [x19, 36]
	lsl	w5, w3, 4
	mul	w0, w0, w5
	ldr	x5, [x19, 504]
	add	x5, x5, x0, sxtw
	add	w0, w0, w4
	str	x5, [x19, 512]
	stp	w4, w0, [x19, 20]
	str	w0, [x19, 40]
	add	w4, w3, w4
	add	w3, w3, w0
	stp	w4, w3, [x19, 28]
	b	.L277
	.p2align 3
.L275:
	mov	w0, 32
	strb	wzr, [x19, 291]
	str	w0, [x19, 300]
	b	.L276
	.p2align 3
.L287:
	ldr	x0, [x22, 2768]
	ldrb	w3, [x20, 18]
	ldr	w0, [x0, 92]
	and	w3, w3, 1
	sub	w0, w0, #1
	cmp	w0, 2
	bhi	.L282
	b	.L289
	.size	MP2_SetImgFormat, .-MP2_SetImgFormat
	.align	3
.LC53:
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
	ble	.L291
	mov	w1, w19
	mov	x0, x20
	bl	MP2_SearchStartCode.part.3
.L291:
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
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 45056
	add	x19, x19, 86016
	bl	_mcount
	add	x1, x20, 264
	add	x1, x1, 40960
	ldr	x3, [x19, 2768]
	ldr	w0, [x1, 1156]
	cmp	w0, 1
	beq	.L295
	cmp	w0, 2
	beq	.L296
	ldr	w0, [x1, 1100]
	orr	w0, w0, 63
	str	w0, [x1, 1100]
	ldrb	w2, [x3, 30]
.L302:
	tst	w0, 24
	beq	.L304
.L320:
	cmp	w2, 3
	bne	.L305
.L293:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L296:
	ldr	w0, [x1, 1100]
	tbnz	x0, 20, .L303
	orr	w0, w0, 16
	str	w0, [x1, 1100]
.L303:
	ldrb	w2, [x3, 30]
	sub	w1, w2, #1
	uxtb	w1, w1
	cmp	w1, 2
	bls	.L302
.L318:
	add	x1, x20, 264
	orr	w0, w0, 8
	add	x1, x1, 40960
	tst	w0, 24
	str	w0, [x1, 1100]
	ldrb	w2, [x3, 30]
	bne	.L320
.L304:
	cmp	w2, 1
	bne	.L293
	add	x20, x20, 264
	and	w0, w0, -193
	add	x20, x20, 40960
	str	w0, [x20, 1100]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L295:
	ldrb	w2, [x3, 30]
	sub	w0, w2, #1
	uxtb	w0, w0
	cmp	w0, 3
	ldr	w0, [x1, 1100]
	bhi	.L321
.L298:
	sub	w1, w2, #2
	uxtb	w1, w1
	cmp	w1, 1
	bls	.L322
.L299:
	cmp	w2, 3
	beq	.L323
	tst	w0, 24
	beq	.L304
.L305:
	add	x21, x20, 264
	orr	w0, w0, 64
	add	x21, x21, 40960
	str	w0, [x21, 1100]
	ldr	w1, [x21, 1200]
	ldr	w0, [x19, 3392]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L308
	ldr	w0, [x19, 3392]
	ldr	x1, [x22, 544]
	bl	FreeUsdByDec
	ldr	w0, [x19, 3392]
	ldr	x1, [x22, 552]
	bl	FreeUsdByDec
	ldr	w0, [x19, 3392]
	ldr	x1, [x22, 560]
	bl	FreeUsdByDec
	ldr	w0, [x19, 3392]
	ldr	x1, [x22, 568]
	bl	FreeUsdByDec
	add	x0, x22, 512
	mov	w2, 1
	stp	xzr, xzr, [x0, 32]
	stp	xzr, xzr, [x0, 48]
	ldr	w0, [x19, 3392]
	ldr	w1, [x21, 1200]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 3392]
	mov	w2, 1
	ldr	w1, [x21, 1196]
	bl	FSP_ClearLogicFs
	str	wzr, [x21, 1196]
	str	wzr, [x21, 1200]
	ldr	w0, [x19, 3392]
	bl	FSP_GetFspType
	cbnz	w0, .L324
.L308:
	add	x20, x20, 264
	add	x20, x20, 40960
	str	wzr, [x20, 1160]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L321:
	orr	w0, w0, 8
	str	w0, [x1, 1100]
	ldrb	w2, [x3, 30]
	b	.L298
	.p2align 3
.L324:
	ldr	w0, [x19, 3392]
	bl	FSP_GetNullLogicFs
	str	w0, [x21, 1196]
	str	w0, [x21, 1200]
	b	.L308
	.p2align 3
.L323:
	ldrb	w1, [x3, 34]
	cbnz	w1, .L293
	b	.L318
	.p2align 3
.L322:
	ldrb	w1, [x3, 32]
	cbnz	w1, .L299
	add	x1, x20, 264
	orr	w0, w0, 8
	add	x1, x1, 40960
	str	w0, [x1, 1100]
	ldrb	w2, [x3, 30]
	b	.L299
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
	mov	x1, x0
	mov	x0, x30
	add	x21, x1, 86016
	add	x19, x1, 45056
	add	x20, x19, 264
	bl	_mcount
	add	x20, x20, 40960
	mov	w1, 1
	ldr	w0, [x21, 3392]
	bl	FSP_NewLogicFs
	str	w0, [x20, 1204]
	mov	w1, w0
	tbnz	w0, #31, .L337
	ldr	w0, [x21, 3392]
	bl	FSP_GetLogicFs
	mov	x19, x0
	cbz	x0, .L338
	ldr	x1, .LC59
	mov	w0, 18
	ldr	w2, [x20, 1204]
	bl	dprint_vfmw
	ldr	x0, [x19, 32]
	cbz	x0, .L333
	ldr	x1, [x19, 40]
	cbz	x1, .L333
	ldr	w2, [x0, 8]
	mov	w0, 18
	ldr	w3, [x1, 8]
	ldr	x1, .LC61
	bl	dprint_vfmw
	mov	w0, 1
.L330:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L337:
	ldr	x1, .LC55
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w1, [x20, 1200]
	ldr	w0, [x21, 3392]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L328
	ldr	w0, [x21, 3392]
	ldr	x1, [x22, 544]
	bl	FreeUsdByDec
	ldr	w0, [x21, 3392]
	ldr	x1, [x22, 552]
	bl	FreeUsdByDec
	ldr	w0, [x21, 3392]
	ldr	x1, [x22, 560]
	bl	FreeUsdByDec
	ldr	w0, [x21, 3392]
	ldr	x1, [x22, 568]
	bl	FreeUsdByDec
	add	x0, x22, 512
	mov	w2, 1
	stp	xzr, xzr, [x0, 32]
	stp	xzr, xzr, [x0, 48]
	ldr	w1, [x20, 1200]
	ldr	w0, [x21, 3392]
	bl	FSP_ClearLogicFs
	ldr	w0, [x21, 3392]
	mov	w2, 1
	ldr	w1, [x20, 1196]
	bl	FSP_ClearLogicFs
	str	wzr, [x20, 1196]
	str	wzr, [x20, 1200]
	ldr	w0, [x21, 3392]
	bl	FSP_GetFspType
	cbnz	w0, .L339
.L328:
	add	x19, x19, 264
	add	x1, x21, 2784
	add	x19, x19, 40960
	str	wzr, [x19, 1160]
	ldr	w0, [x21, 3392]
	bl	FSP_ClearNotInVoQueue
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L333:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L339:
	ldr	w0, [x21, 3392]
	bl	FSP_GetNullLogicFs
	str	w0, [x20, 1196]
	str	w0, [x20, 1200]
	b	.L328
	.p2align 3
.L338:
	ldr	x1, .LC57
	mov	w2, 1852
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L330
	.size	MP2_GetImageBuffer, .-MP2_GetImageBuffer
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_GetPictureInfo
	.type	MP2_GetPictureInfo, %function
MP2_GetPictureInfo:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x23, x0
	mov	x0, x30
	add	x22, x23, 45056
	add	x19, x23, 86016
	bl	_mcount
	add	x0, x22, 264
	add	x0, x0, 40960
	ldr	x20, [x19, 2768]
	ldr	x24, [x19, 2776]
	ldr	w0, [x0, 1156]
	cmp	w0, 1
	beq	.L387
.L341:
	ldrb	w0, [x20, 17]
	cmp	w0, 3
	beq	.L342
	add	x21, x22, 264
	add	x21, x21, 40960
	ldr	w0, [x21, 1112]
	ldr	w1, [x21, 1164]
	cmp	w0, wzr
	cset	w0, eq
	str	w0, [x21, 1112]
	ldr	w2, [x20, 164]
	cmp	w2, w1
	cset	w1, ne
	tst	w0, w1
	bne	.L388
.L344:
	ldrb	w2, [x20, 17]
	add	x0, x22, 264
	strb	w2, [x22, 265]
	add	x1, x0, 40960
	add	x21, x23, 16
	ldr	w0, [x20, 164]
	str	w0, [x1, 1164]
	ldr	w0, [x20, 64]
	strh	w0, [x21, 150]
	ldrb	w0, [x20, 17]
	cmp	w0, 3
	ldr	w0, [x20, 68]
	beq	.L349
	lsr	w0, w0, 1
	strh	w0, [x21, 146]
	ldr	w0, [x20, 68]
	strh	w0, [x21, 148]
.L350:
	ldrb	w1, [x20, 19]
	add	x0, x22, 264
	strb	w1, [x21, 5]
	add	x0, x0, 40960
	ldrb	w1, [x20, 17]
	strb	w1, [x21, 3]
	ldr	w1, [x0, 1112]
	strb	w1, [x21, 4]
	ldrb	w2, [x20, 20]
	strb	w2, [x21, 7]
	ldrb	w2, [x20, 30]
	strb	w2, [x23, 16]
	ldr	w0, [x0, 1156]
	cmp	w0, 1
	cset	w2, eq
	str	w2, [x21, 176]
	beq	.L389
.L351:
	ldrb	w0, [x20, 12]
	strb	w0, [x21, 12]
	ldrb	w0, [x20, 13]
	strb	w0, [x21, 13]
	ldrb	w0, [x20, 14]
	strb	w0, [x21, 14]
	ldrb	w0, [x20, 15]
	strb	w0, [x21, 15]
	ldrb	w0, [x20, 18]
	strb	w0, [x21, 6]
	ldrb	w0, [x20, 16]
	strb	w0, [x21, 11]
	ldrb	w0, [x20, 21]
	strb	w0, [x21, 10]
	ldrb	w0, [x20, 22]
	strb	w0, [x21, 9]
	ldrb	w0, [x20, 23]
	strb	w0, [x21, 8]
	ldrb	w0, [x20, 17]
	cmp	w0, 3
	ccmp	w1, wzr, 4, ne
	bne	.L353
	mov	x1, 0
	mov	x0, x23
	bl	MP2_GetImageBuffer
	mov	w25, w0
	cbz	w0, .L390
	add	x1, x22, 264
	ldr	w0, [x19, 3392]
	add	x1, x1, 40960
	ldr	w1, [x1, 1204]
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	cbz	x0, .L356
	ldr	x2, [x23]
	mov	x3, -1
	ldr	x1, .LC72
	mov	w0, 29
	ldr	x2, [x2, 64]
	str	x2, [x24, 584]
	ldr	x2, [x23]
	ldr	x2, [x2, 80]
	str	x2, [x24, 592]
	ldr	x2, [x23]
	ldr	x2, [x2, 96]
	str	x2, [x24, 600]
	ldr	x2, [x23]
	ldr	w2, [x2, 112]
	str	w2, [x24]
	ldr	x2, [x23]
	ldr	w2, [x2, 116]
	str	w2, [x24, 4]
	ldr	x2, [x23]
	ldr	w2, [x2, 120]
	str	w2, [x24, 8]
	ldr	x2, [x23]
	ldr	w2, [x2, 136]
	str	w2, [x24, 12]
	ldr	w2, [x20, 144]
	strb	w2, [x24, 441]
	ldr	w2, [x20, 152]
	strb	w2, [x24, 442]
	ldr	w2, [x20, 148]
	str	w2, [x24, 444]
	ldr	x2, [x23]
	str	x3, [x2, 64]
	ldr	x2, [x24, 584]
	ldr	x3, [x24, 592]
	bl	dprint_vfmw
	ldrb	w0, [x20, 17]
	cmp	w0, 3
	cset	w0, ne
	str	w0, [x24, 52]
.L356:
	ldrb	w0, [x20, 30]
	cmp	w0, 3
	beq	.L353
	add	x20, x22, 264
	mov	w0, 2
	add	x20, x20, 40960
	ldr	w1, [x20, 1160]
	ldr	w2, [x20, 1196]
	ldr	w3, [x20, 1200]
	cmp	w1, wzr
	csinc	w0, w0, wzr, ne
	str	w0, [x20, 1160]
	cmp	w2, w3
	ldr	w0, [x20, 1204]
	beq	.L360
	cmp	w2, w0
	beq	.L360
	ldr	x1, .LC74
	mov	w0, 13
	bl	dprint_vfmw
	ldr	w0, [x19, 3392]
	mov	w2, 0
	ldr	w1, [x20, 1196]
	bl	FSP_SetRef
	ldr	w3, [x20, 1200]
	ldr	w0, [x20, 1204]
.L360:
	add	x20, x22, 264
	mov	w1, w0
	add	x20, x20, 40960
	mov	w2, 1
	str	w3, [x20, 1196]
	str	w0, [x20, 1200]
	ldr	w0, [x19, 3392]
	bl	FSP_SetRef
	ldr	w0, [x19, 3392]
	ldr	w1, [x20, 1196]
	bl	FSP_RemovePmv
	ldr	x1, .LC76
	mov	w0, 13
	ldr	w2, [x20, 1204]
	bl	dprint_vfmw
.L353:
	add	x20, x22, 264
	ldr	w0, [x19, 3392]
	add	x20, x20, 40960
	ldr	w1, [x20, 1204]
	bl	FSP_GetLogicFs
	mov	x24, x0
	ldr	w1, [x20, 1196]
	ldr	w0, [x19, 3392]
	bl	FSP_GetLogicFs
	mov	x26, x0
	ldr	w1, [x20, 1200]
	ldr	w0, [x19, 3392]
	bl	FSP_GetLogicFs
	mov	x27, x0
	cmp	x24, xzr
	ccmp	x26, xzr, 4, ne
	ccmp	x0, xzr, 4, ne
	beq	.L391
	ldr	x1, [x24, 32]
	cbz	x1, .L362
	ldr	x0, [x24, 40]
	cbz	x0, .L362
	ldr	x0, [x27, 32]
	cbz	x0, .L364
	ldr	w5, [x0, 8]
.L365:
	str	w5, [x21, 180]
	ldr	x0, [x26, 32]
	cbz	x0, .L392
.L386:
	ldr	w4, [x0, 8]
	str	w4, [x21, 184]
	ldr	x1, .LC82
	ldr	x0, [x24, 32]
	ldr	w2, [x0, 8]
	str	w2, [x21, 188]
	ldr	w6, [x24, 8]
	str	w6, [x21, 224]
	ldr	x0, [x24, 40]
	ldr	w3, [x0, 8]
	str	w3, [x21, 200]
	ldr	w0, [x27, 100]
	str	w0, [x21, 192]
	ldr	w0, [x26, 100]
	str	w0, [x21, 196]
	mov	w0, 13
	bl	dprint_vfmw
	ldr	x2, [x24, 40]
	add	x0, x19, 1680
	add	x1, x23, 96
	add	x3, x19, 1936
	ldr	w2, [x2, 28]
	str	w2, [x21, 208]
	ldr	x2, [x24, 40]
	ldr	w2, [x2, 64]
	str	w2, [x21, 212]
	ldr	x2, [x24, 40]
	ldr	w2, [x2, 48]
	str	w2, [x21, 216]
	ldr	x2, [x24, 40]
	ldr	w2, [x2, 52]
	str	w2, [x21, 220]
	.p2align 2
.L368:
	ldr	w2, [x0]
	add	x0, x0, 4
	strb	w2, [x1]
	add	x1, x1, 1
	cmp	x0, x3
	ldr	w2, [x0, 252]
	strb	w2, [x1, -65]
	bne	.L368
	mov	x0, x23
	mov	w25, 1
	bl	MP2_EstimatePicQp
	strb	w0, [x21, 145]
.L355:
	mov	w0, w25
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
.L390:
	add	x2, x22, 264
	ldr	x1, .LC70
	add	x2, x2, 40960
	ldr	w2, [x2, 1108]
	bl	dprint_vfmw
	ldr	x27, [sp, 80]
	mov	w0, w25
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
.L389:
	ldrb	w0, [x20, 33]
	strb	w0, [x21, 1]
	ldrb	w0, [x20, 31]
	strb	w0, [x21, 2]
	b	.L351
.L349:
	ldr	w1, [x20, 72]
	sub	w0, w0, w1
	strh	w0, [x21, 146]
	ldr	w0, [x20, 68]
	strh	w0, [x21, 148]
	b	.L350
.L342:
	ldrb	w4, [x22, 265]
	add	x0, x22, 264
	cmp	w4, 3
	beq	.L347
	add	x21, x0, 40960
	ldr	w0, [x21, 1112]
	cbz	w0, .L393
.L347:
	add	x0, x22, 264
	mov	w1, 1
	add	x0, x0, 40960
	str	w1, [x0, 1112]
	b	.L344
.L387:
	ldrb	w1, [x20, 34]
	ldrb	w0, [x20, 32]
	strb	w1, [x20, 15]
	strb	w1, [x20, 14]
	strb	w0, [x20, 13]
	strb	w0, [x20, 12]
	b	.L341
.L391:
	ldr	w0, [x19, 3392]
	mov	w2, 1
	ldr	w1, [x20, 1204]
	mov	w25, 0
	bl	FSP_ClearLogicFs
	ldr	x1, .LC78
	mov	x5, x27
	mov	x4, x26
	mov	x3, x24
	mov	w2, 1168
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x27, [sp, 80]
	mov	w0, w25
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
.L393:
	ldr	x1, .LC68
	mov	w3, 0
	ldr	w2, [x21, 1108]
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x19, 3392]
	mov	w2, 1
	ldr	w1, [x21, 1204]
	bl	FSP_ClearLogicFs
	ldrb	w0, [x24, 30]
	cmp	w0, 3
	beq	.L347
	ldr	w0, [x21, 1100]
	orr	w0, w0, 192
	str	w0, [x21, 1100]
	b	.L347
.L362:
	add	x22, x22, 264
	ldr	w0, [x19, 3392]
	add	x19, x22, 40960
	mov	w2, 1
	mov	w25, 0
	ldr	w1, [x19, 1204]
	bl	FSP_ClearLogicFs
	ldr	x1, .LC80
	mov	w0, 0
	ldr	w2, [x19, 1196]
	ldr	w4, [x19, 1200]
	ldr	w3, [x19, 1204]
	ldp	x5, x6, [x24, 32]
	bl	dprint_vfmw
	b	.L355
.L392:
	ldr	x0, [x24, 32]
	b	.L386
.L364:
	ldr	w5, [x1, 8]
	b	.L365
.L388:
	ldr	x1, .LC66
	mov	w0, 1
	ldr	w2, [x21, 1108]
	bl	dprint_vfmw
	str	wzr, [x21, 1112]
	ldr	w1, [x21, 1204]
	mov	w2, 1
	ldr	w0, [x19, 3392]
	bl	FSP_ClearLogicFs
	ldrb	w0, [x24, 30]
	cmp	w0, 3
	beq	.L344
	ldr	w0, [x21, 1100]
	orr	w0, w0, 192
	str	w0, [x21, 1100]
	b	.L344
	.size	MP2_GetPictureInfo, .-MP2_GetPictureInfo
	.align	3
.LC66:
	.xword	.LC65
	.align	3
.LC68:
	.xword	.LC67
	.align	3
.LC70:
	.xword	.LC69
	.align	3
.LC72:
	.xword	.LC71
	.align	3
.LC74:
	.xword	.LC73
	.align	3
.LC76:
	.xword	.LC75
	.align	3
.LC78:
	.xword	.LC77
	.align	3
.LC80:
	.xword	.LC79
	.align	3
.LC82:
	.xword	.LC81
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
	mov	x20, 20744
	mov	x19, x0
	mov	x0, x30
	movk	x20, 0x1, lsl 16
	add	x20, x19, x20
	bl	_mcount
	add	x0, x19, 86016
	add	x0, x0, 1640
	ldrsb	w1, [x20, 1040]
	ldr	w3, [x20, 1032]
	cmp	w1, 1
	ldr	w4, [x0, 32]
	ldr	w1, [x20, 1044]
	lsr	w2, w4, 3
	beq	.L397
	add	w3, w3, w2
	add	w2, w1, w2
	str	w3, [x20, 1032]
	add	w1, w4, w1, lsl 3
	ldr	w21, [x20, 1048]
	and	w2, w2, -4
	and	w1, w1, 31
	str	w2, [x19, 168]
	str	w1, [x19, 176]
	and	w21, w21, -4
	bl	BsResidBits
	str	w21, [x19, 172]
	str	w0, [x19, 184]
	ldr	w0, [x20, 1048]
	ubfiz	w0, w0, 3, 2
	str	w0, [x19, 180]
	ldr	w0, [x20, 1056]
	lsl	w0, w0, 3
	str	w0, [x19, 188]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L397:
	add	w3, w3, w2
	add	w2, w1, w2
	str	w3, [x20, 1032]
	add	w1, w4, w1, lsl 3
	and	w2, w2, -4
	and	w1, w1, 31
	str	w2, [x19, 168]
	str	w1, [x19, 176]
	bl	BsResidBits
	str	wzr, [x19, 172]
	stp	wzr, w0, [x19, 180]
	str	wzr, [x19, 188]
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
	ldr	x1, [x19]
	add	x2, x19, 45056
	add	x0, x19, 86016
	ldr	w3, [x1, 640]
	str	w3, [x2, 256]
	ldr	w3, [x1, 692]
	str	w3, [x2, 260]
	ldr	x2, [x0, 2768]
	ldrb	w3, [x2, 30]
	cmp	w3, 3
	beq	.L416
	cmp	w3, 2
	beq	.L417
.L400:
	add	x4, x19, 16
	str	x4, [x19, 8]
	ldr	w3, [x1, 984]
	cmp	w3, 1
	beq	.L418
.L402:
	cmp	w3, 2
	beq	.L419
.L403:
	ldr	w1, [x0, 1364]
	mov	w20, 1
	and	w1, w1, -16252929
	str	w1, [x0, 1364]
	ldrb	w1, [x2, 30]
	cmp	w1, w20
	beq	.L420
.L401:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L417:
	mov	w3, 1
	str	w3, [x0, 3404]
	add	x4, x19, 16
	str	x4, [x19, 8]
	ldr	w3, [x1, 984]
	cmp	w3, 1
	bne	.L402
.L418:
	cbz	x4, .L403
	ldrb	w1, [x2, 30]
	cmp	w1, 3
	bne	.L403
	mov	w20, 0
	str	xzr, [x19, 8]
	b	.L401
	.p2align 3
.L420:
	ldr	x1, .LC83
	ldr	x5, [x1]
	cbz	x5, .L401
	ldp	w4, w1, [x19, 184]
	add	x2, x29, 48
	ldr	w0, [x0, 3392]
	add	w4, w4, w1
	mov	w3, 4
	cmp	w4, wzr
	add	w1, w4, 7
	csel	w4, w1, w4, lt
	mov	w1, 20
	asr	w4, w4, 3
	str	w4, [x2, -8]!
	blr	x5
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L416:
	ldr	w3, [x0, 3404]
	cbnz	w3, .L400
	ldr	w3, [x0, 1424]
	cmp	w3, 2
	beq	.L400
	ldrb	w1, [x2, 17]
	cmp	w1, 3
	beq	.L404
	ldr	w1, [x0, 1376]
	mov	w20, 0
	cmp	w1, wzr
	cset	w1, eq
	str	w1, [x0, 1376]
	b	.L401
	.p2align 3
.L419:
	ldr	w3, [x1, 988]
	cmp	w3, wzr
	ccmp	x4, xzr, 4, gt
	beq	.L403
	ldrb	w3, [x2, 30]
	cmp	w3, 3
	bne	.L403
	str	xzr, [x19, 8]
	mov	w20, 0
	ldr	w0, [x1, 988]
	sub	w0, w0, #1
	str	w0, [x1, 988]
	b	.L401
	.p2align 3
.L404:
	mov	w20, 0
	b	.L401
	.size	MP2_DecNewPic, .-MP2_DecNewPic
	.align	3
.LC83:
	.xword	g_event_report
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
	add	x0, x19, 86016
	ldr	x2, [x19]
	ldr	x1, [x0, 2768]
	ldr	w3, [x1, 48]
	str	w3, [x2, 616]
	ldr	x2, [x19]
	ldr	w1, [x1, 52]
	str	w1, [x2, 620]
	ldr	w2, [x0, 3396]
	ldr	w1, [x0, 3400]
	ldr	x3, [x19]
	sub	w0, w2, w1
	cmp	w2, w1
	csel	w0, w0, wzr, ge
	str	w0, [x3, 624]
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
	mov	x24, x0
	mov	x0, x30
	add	x23, x24, 86016
	bl	_mcount
	add	x20, x23, 1640
	mov	x0, x20
	ldr	x25, [x23, 2768]
	bl	BsToNextByte
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w22, w1, w0, lt
	asr	w22, w22, 3
	cmp	w22, wzr
	ble	.L446
	ldr	x26, .LC86
	mov	w21, 0
	mov	w19, 0
	b	.L429
	.p2align 3
.L466:
	bl	BsGet
	add	w19, w19, 1
	strb	w0, [x26, w21, sxtw]
	cmp	w22, w19
	add	w21, w21, 1
	beq	.L425
.L429:
	mov	w1, 24
	mov	x0, x20
	bl	BsShow
	and	w2, w0, 16777215
	cmp	w2, 1
	mov	w1, 8
	mov	x0, x20
	beq	.L447
	cmp	w21, 1023
	ble	.L466
	mov	w1, 8
	mov	x0, x20
	add	w19, w19, 1
	bl	BsGet
	cmp	w22, w19
	bne	.L429
.L425:
	add	x22, x24, 45056
	add	x26, x22, 264
	add	x26, x26, 40960
	ldrsb	w0, [x26, 1040]
	cbz	w0, .L445
.L465:
	mov	w19, 0
.L426:
	add	x0, x22, 264
	add	x0, x0, 40960
	ldr	w20, [x0, 1152]
	cmp	w20, 3
	ble	.L434
	add	x20, x23, 1384
	add	x26, x23, 1416
.L435:
	ldr	x1, [x20]
	ldr	w0, [x23, 3392]
	bl	FreeUsdByDec
	str	xzr, [x20], 8
	cmp	x20, x26
	bne	.L435
	add	x0, x22, 264
	mov	w20, 0
	add	x0, x0, 40960
	str	wzr, [x0, 1152]
.L434:
	ldr	w0, [x23, 3392]
	add	x20, x24, x20, uxtw 3
	add	x20, x20, 86016
	bl	GetUsd
	add	x3, x22, 264
	str	x0, [x20, 1384]
	add	x4, x3, 40960
	ldr	w2, [x4, 1152]
	sxtw	x1, w2
	add	x1, x1, 4096
	add	x1, x1, 1164
	ldr	x1, [x3, x1, lsl 3]
	cbz	x1, .L436
	ldr	x1, [x24]
	ldr	x1, [x1, 64]
	str	x1, [x0, 1056]
	ldr	x0, [x20, 1384]
	ldr	w1, [x4, 1104]
	str	w1, [x0, 1044]
	ldr	x0, [x20, 1384]
	str	w21, [x0, 1052]
	ldr	x1, [x23, 2768]
	ldr	x0, [x20, 1384]
	ldrb	w1, [x1, 30]
	strb	w1, [x0, 1024]
	ldr	x0, [x20, 1384]
	ldr	w1, [x23, 3396]
	str	w1, [x0, 1032]
	ldr	x1, [x23, 2768]
	ldr	x0, [x20, 1384]
	ldrb	w1, [x1, 18]
	strb	w1, [x0, 1025]
	ldr	w0, [x4, 1100]
	tbz	x0, 19, .L437
	ldr	x0, [x20, 1384]
	mov	w1, 3
	str	w1, [x0, 1040]
.L438:
	ldr	x0, [x20, 1384]
	ldr	w2, [x0, 1052]
	cmp	w2, 1024
	ble	.L439
	mov	w1, 1024
	str	w1, [x0, 1052]
	ldr	x0, [x20, 1384]
	ldr	w2, [x0, 1052]
.L439:
	ldr	x3, .LC89
	sxtw	x2, w2
	ldr	x1, .LC86
	ldr	x3, [x3, 104]
	blr	x3
	ldr	x0, [x20, 1384]
	ldr	w1, [x0, 1052]
	cmp	w1, 5
	ble	.L441
	mov	w1, 21572
	ldr	w2, [x0]
	movk	w1, 0x3147, lsl 16
	cmp	w2, w1
	beq	.L467
.L441:
	ldr	x0, .LC90
	ldr	x4, [x0]
	cbz	x4, .L443
	ldr	w0, [x23, 3392]
	mov	w3, 1064
	ldr	x2, [x20, 1384]
	mov	w1, 6
	blr	x4
.L443:
	add	x22, x22, 264
	add	x22, x22, 40960
	ldr	w0, [x22, 1152]
	add	w0, w0, 1
	str	w0, [x22, 1152]
.L464:
	mov	w0, w19
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L445:
	ldrsb	w0, [x26, 1041]
	mov	w19, 0
	cbz	w0, .L426
	ldr	w19, [x26, 1056]
	cbz	w19, .L426
	ldr	x1, .LC88
	mov	w0, 0
	mov	w19, 1
	bl	dprint_vfmw
	ldrsw	x0, [x26, 1052]
	ldr	x2, .LC89
	ldr	x1, [x26, 1072]
	sub	x0, x0, #3
	add	x1, x1, x0
	ldr	x0, [x26, 1080]
	ldr	x3, [x2, 104]
	mov	x2, 3
	sub	x0, x0, #3
	blr	x3
	strb	w19, [x26, 1040]
	add	x3, x26, 1024
	ldr	w0, [x26, 1048]
	ldr	w2, [x26, 1056]
	ldr	x1, [x26, 1080]
	sub	w0, w0, #3
	strb	wzr, [x26, 1041]
	add	w2, w2, 3
	stp	w0, wzr, [x3, 20]
	stp	w2, wzr, [x3, 28]
	sub	x1, x1, #3
	mov	x0, x20
	str	x1, [x26, 1072]
	str	xzr, [x26, 1080]
	bl	BsInit
	strb	w19, [x26, 1041]
	strb	wzr, [x26, 1040]
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
	ble	.L465
	ldr	x27, .LC86
	mov	w26, 0
	b	.L432
	.p2align 3
.L468:
	bl	BsGet
	strb	w0, [x27, w21, sxtw]
	add	w21, w21, 1
.L431:
	add	w26, w26, 1
	cmp	w19, w26
	beq	.L465
.L432:
	mov	w1, 24
	mov	x0, x20
	bl	BsShow
	and	w2, w0, 16777215
	cmp	w2, 1
	mov	w1, 8
	mov	x0, x20
	beq	.L450
	cmp	w21, 1023
	ble	.L468
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	b	.L431
	.p2align 3
.L447:
	mov	w19, w2
	add	x22, x24, 45056
	b	.L426
	.p2align 3
.L437:
	ldr	x0, [x20, 1384]
	mov	w1, 1
	str	w1, [x0, 1040]
	b	.L438
	.p2align 3
.L467:
	ldrb	w1, [x0, 4]
	ldrb	w0, [x25, 196]
	cmp	w1, 65
	cset	w1, eq
	bfi	w0, w1, 0, 1
	strb	w0, [x25, 196]
	tbz	x0, 0, .L441
	ldr	x1, [x20, 1384]
	ldrb	w1, [x1, 5]
	bfi	w0, w1, 1, 4
	strb	w0, [x25, 196]
	b	.L441
.L436:
	ldr	x1, .LC92
	mov	w0, 0
	bl	dprint_vfmw
	b	.L464
.L446:
	mov	w21, 0
	b	.L425
.L450:
	mov	w19, w2
	b	.L426
	.size	MP2_GetUsrData, .-MP2_GetUsrData
	.align	3
.LC86:
	.xword	.LANCHOR2
	.align	3
.LC88:
	.xword	.LC87
	.align	3
.LC89:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC90:
	.xword	g_event_report
	.align	3
.LC92:
	.xword	.LC91
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
	add	x20, x22, 86016
	bl	_mcount
	add	x20, x20, 1640
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
	bgt	.L495
.L470:
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
	bgt	.L489
	b	.L477
	.p2align 3
.L474:
	bl	BsSkip
	cmp	w19, w21
	beq	.L477
.L489:
	mov	w1, 24
	mov	x0, x20
	add	w19, w19, 1
	bl	BsShow
	cmp	w0, 1
	mov	w1, 8
	mov	x0, x20
	bne	.L474
.L479:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L477:
	mov	x0, 20744
	movk	x0, 0x1, lsl 16
	add	x22, x22, x0
	ldrsb	w0, [x22, 1040]
	cbnz	w0, .L473
	ldrsb	w0, [x22, 1041]
	cbz	w0, .L473
	ldr	w0, [x22, 1056]
	cbz	w0, .L473
	ldr	x1, .LC93
	mov	w0, 7
	mov	w19, 1
	bl	dprint_vfmw
	ldr	x3, .LC94
	mov	x2, 3
	ldrsw	x1, [x22, 1052]
	ldr	x4, [x22, 1072]
	ldr	x0, [x22, 1080]
	sub	x1, x1, #3
	ldr	x3, [x3, 104]
	add	x1, x4, x1
	sub	x0, x0, #3
	blr	x3
	strb	w19, [x22, 1040]
	add	x6, x22, 1024
	ldr	x4, [x22, 1080]
	ldr	w5, [x22, 1048]
	mov	x0, x20
	ldr	w3, [x22, 1056]
	sub	x4, x4, #3
	strb	wzr, [x22, 1041]
	sub	w5, w5, #3
	add	w3, w3, 3
	mov	x1, x4
	stp	w5, wzr, [x6, 20]
	stp	w3, wzr, [x6, 28]
	mov	w2, w3
	str	x4, [x22, 1072]
	str	xzr, [x22, 1080]
	bl	BsInit
	strb	w19, [x22, 1041]
	strb	wzr, [x22, 1040]
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
	bgt	.L496
.L478:
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
	ble	.L473
	mov	w19, 0
	b	.L480
	.p2align 3
.L497:
	bl	BsSkip
	cmp	w19, w21
	beq	.L473
.L480:
	mov	w1, 24
	mov	x0, x20
	add	w19, w19, 1
	bl	BsShow
	cmp	w0, 1
	mov	w1, 8
	mov	x0, x20
	bne	.L497
	b	.L479
	.p2align 3
.L473:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L495:
	mov	w1, w2
	mov	x0, x19
	bl	MP2_SearchStartCode.part.3
	lsl	w1, w0, 3
	b	.L470
.L496:
	mov	w1, w2
	mov	x0, x19
	bl	MP2_SearchStartCode.part.3
	lsl	w1, w0, 3
	b	.L478
	.size	next_start_code, .-next_start_code
	.align	3
.LC93:
	.xword	.LC87
	.align	3
.LC94:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetSliceHdr
	.type	GetSliceHdr, %function
GetSliceHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, 20744
	mov	x21, x0
	mov	x0, x30
	add	x23, x21, 86016
	movk	x22, 0x1, lsl 16
	add	x20, x23, 1640
	bl	_mcount
	add	x22, x21, x22
	b	.L499
	.p2align 3
.L506:
	bl	BsShow
	mov	w19, w0
	mov	x0, x20
	sub	w19, w19, #257
	bl	BsPos
	str	w0, [x22, 1180]
	cmp	w19, 174
	mov	w1, 32
	mov	x0, x20
	bls	.L514
	bl	BsSkip
.L499:
	mov	x0, x21
	bl	next_start_code
	mov	w2, w0
	cmp	w2, 1
	mov	w1, 32
	mov	x0, x20
	beq	.L506
	cmn	w2, #1
	mov	w19, w2
	beq	.L501
.L504:
	mov	w0, w19
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L508:
	mov	w19, -1
.L501:
	ldr	x0, .LC95
	ldr	x4, [x0]
	cbz	x4, .L504
	ldr	w0, [x23, 3392]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	ldr	x23, [sp, 48]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L514:
	bl	BsResidBits
	cmp	w0, 40
	ble	.L508
	ldr	w0, [x22, 1096]
	str	wzr, [x22, 1176]
	cbnz	w0, .L505
	mov	x0, x21
	mov	w19, 0
	bl	MP2_GetSequenceInfo
	ldr	w0, [x22, 1168]
	cbz	w0, .L504
.L505:
	mov	x0, x21
	mov	w19, 1
	bl	MP2_ProtocolPPSCheck
	ldr	x23, [sp, 48]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	GetSliceHdr, .-GetSliceHdr
	.align	3
.LC95:
	.xword	g_event_report
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
	stp	x25, x26, [sp, 64]
	mov	x19, 20744
	mov	x21, x0
	movk	x19, 0x1, lsl 16
	mov	x0, x30
	add	x23, x21, 86016
	add	x19, x21, x19
	bl	_mcount
	add	x20, x23, 1640
	mov	w2, 65536
	mov	w1, 12
	ldr	x24, [x23, 2768]
	mov	x0, x20
	str	w2, [x19, 1100]
	str	wzr, [x19, 1096]
	bl	BsGet
	str	w0, [x24, 56]
	mov	w1, 12
	mov	x0, x20
	bl	BsGet
	str	w0, [x24, 60]
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	str	w0, [x24, 92]
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	str	w0, [x24, 96]
	mov	w1, 18
	mov	x0, x20
	bl	BsGet
	str	w0, [x24, 100]
	mov	w1, 2
	mov	x0, x20
	str	w1, [x24, 152]
	mov	w1, 1
	bl	BsGet
	cbnz	w0, .L516
	ldr	w0, [x19, 1100]
	orr	w0, w0, 1
	str	w0, [x19, 1100]
.L516:
	mov	w1, 10
	mov	x0, x20
	bl	BsGet
	str	w0, [x24, 104]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x24, 1]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x24, 84]
	ldr	x22, .LC98
	beq	.L533
	add	x0, x22, 64
	add	x1, x23, 1680
	add	x3, x0, 64
	.p2align 2
.L521:
	ldrb	w2, [x0], 1
	str	w2, [x1], 4
	cmp	x0, x3
	bne	.L521
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x24, 88]
	beq	.L534
.L530:
	add	x0, x23, 1936
	mov	w1, 16
	add	x23, x23, 2192
	.p2align 2
.L524:
	str	w1, [x0], 4
	cmp	x0, x23
	bne	.L524
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L533:
	mov	x26, x22
	add	x25, x22, 64
	.p2align 2
.L518:
	ldrb	w19, [x26], 1
	mov	w1, 8
	mov	x0, x20
	add	x19, x19, 20480
	add	x19, x19, 1444
	bl	BsGet
	cmp	x26, x25
	str	w0, [x21, x19, lsl 2]
	bne	.L518
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x24, 88]
	bne	.L530
.L534:
	add	x23, x22, 64
	.p2align 2
.L523:
	ldrb	w19, [x22], 1
	mov	w1, 8
	mov	x0, x20
	add	x19, x19, 20480
	add	x19, x19, 1508
	bl	BsGet
	cmp	x22, x23
	str	w0, [x21, x19, lsl 2]
	bne	.L523
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	sequence_header, .-sequence_header
	.align	3
.LC98:
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
	add	x19, x19, 86016
	add	x20, x19, 1640
	bl	_mcount
	mov	w1, 1
	mov	x0, x20
	ldr	x21, [x19, 2768]
	bl	BsGet
	mov	w1, 5
	strb	w0, [x21, 2]
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 108]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 112]
	mov	w1, 1
	mov	x0, x20
	bl	BsSkip
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 116]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 120]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 124]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 128]
	add	x1, x19, 1516
	add	x2, x19, 1540
	ldr	x3, [x19, 1528]
	ldr	x4, [x1]
	str	x4, [x19, 1504]
	ldr	w4, [x19, 1524]
	str	w4, [x19, 1512]
	str	x3, [x1]
	ldr	w3, [x19, 1536]
	str	w3, [x19, 1524]
	ldr	x1, [x2]
	str	x1, [x19, 1528]
	ldr	w1, [x19, 1548]
	str	wzr, [x19, 1540]
	str	wzr, [x19, 1544]
	str	w1, [x19, 1536]
	str	wzr, [x19, 1548]
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
	mov	x22, x0
	mov	x0, x30
	add	x23, x22, 45056
	add	x22, x22, 86016
	add	x21, x23, 264
	bl	_mcount
	add	x21, x21, 40960
	add	x20, x22, 1640
	ldr	x19, [x22, 2768]
	mov	w1, 8
	mov	x0, x20
	ldr	w2, [x21, 1100]
	str	wzr, [x21, 1096]
	orr	w2, w2, 131072
	str	w2, [x21, 1100]
	bl	BsGet
	str	w0, [x19, 132]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 35]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 36]
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
	cbnz	w0, .L537
	ldr	w0, [x21, 1100]
	orr	w0, w0, 2
	str	w0, [x21, 1100]
.L536:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L537:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	mov	w21, w0
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 37]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 38]
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	and	w2, w0, 255
	ldrb	w1, [x19, 38]
	add	w2, w2, 1
	strb	w0, [x19, 39]
	add	w0, w1, 1
	ldr	x1, .LC101
	sdiv	w0, w0, w2
	add	x1, x1, 16
	ldr	w2, [x19, 96]
	ldr	w2, [x1, x2, lsl 2]
	ldr	w1, [x19, 132]
	mul	w0, w0, w2
	str	w0, [x19, 80]
	tbnz	x1, 7, .L560
	ubfx	x0, x1, 4, 3
	and	w1, w1, 15
	stp	w0, w1, [x19, 48]
.L540:
	ldp	w0, w1, [x19, 56]
	and	w1, w1, 4095
	and	w0, w0, 4095
	orr	w26, w1, w26, lsl 12
	orr	w25, w0, w25, lsl 12
	cmp	w26, wzr
	ccmp	w25, wzr, 4, ne
	stp	w25, w26, [x19, 56]
	bne	.L541
	add	x0, x23, 264
	add	x0, x0, 40960
	ldr	w1, [x0, 1100]
	orr	w1, w1, 1
	str	w1, [x0, 1100]
	ldr	w25, [x19, 56]
.L541:
	cmp	w25, 8192
	bhi	.L542
	ldr	w0, [x19, 60]
	cmp	w0, 8192
	bls	.L543
.L542:
	add	x23, x23, 264
	ldr	x0, .LC102
	add	x23, x23, 40960
	ldr	x4, [x0]
	ldr	w0, [x23, 1100]
	orr	w0, w0, 1
	str	w0, [x23, 1100]
	cbz	x4, .L543
	ldr	w0, [x22, 3392]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
.L543:
	ldp	w0, w3, [x19, 100]
	mov	w1, 400
	ldr	w2, [x19, 48]
	add	w24, w0, w24, lsl 18
	add	w21, w3, w21, lsl 10
	sub	w0, w2, #4
	stp	w24, w21, [x19, 100]
	mul	w24, w24, w1
	cmp	w0, 1
	str	w24, [x19, 76]
	bls	.L545
	ldr	x0, .LC102
	ldr	x4, [x0]
	cbz	x4, .L546
	ldr	w0, [x22, 3392]
	mov	x2, 0
	mov	w3, 0
	mov	w1, 102
	blr	x4
	ldr	w2, [x19, 48]
.L546:
	ldr	x1, .LC104
	mov	w0, 1
	bl	dprint_vfmw
.L545:
	ldr	w2, [x19, 52]
	sub	w0, w2, #4
	cmp	w0, 6
	bls	.L536
	ldr	x0, .LC102
	ldr	x4, [x0]
	cbz	x4, .L547
	ldr	w0, [x22, 3392]
	mov	x2, 0
	mov	w3, 0
	mov	w1, 102
	blr	x4
	ldr	w2, [x19, 52]
.L547:
	ldr	x1, .LC106
	mov	w0, 1
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L560:
	and	w1, w1, 15
	cmp	w1, 5
	bne	.L540
	mov	w1, 133
	mov	w0, 8
	stp	w1, w0, [x19, 48]
	b	.L540
	.size	sequence_extension, .-sequence_extension
	.align	3
.LC101:
	.xword	.LANCHOR1
	.align	3
.LC102:
	.xword	g_event_report
	.align	3
.LC104:
	.xword	.LC103
	.align	3
.LC106:
	.xword	.LC105
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
	add	x19, x19, 86016
	bl	_mcount
	add	x20, x19, 1640
	add	x2, x21, 264
	mov	w3, 2
	ldr	x19, [x19, 2768]
	add	x2, x2, 40960
	mov	w1, 3
	mov	x0, x20
	stp	wzr, wzr, [x19, 136]
	stp	wzr, wzr, [x19, 144]
	stp	w3, wzr, [x19, 152]
	str	wzr, [x19, 160]
	ldr	w3, [x2, 1100]
	orr	w3, w3, 262144
	str	w3, [x2, 1100]
	bl	BsGet
	str	w0, [x19, 136]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 140]
	cbnz	w0, .L568
.L562:
	mov	w1, 14
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 156]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cbnz	w0, .L563
	add	x21, x21, 264
	add	x21, x21, 40960
	ldr	w0, [x21, 1100]
	orr	w0, w0, 4
	str	w0, [x21, 1100]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L563:
	mov	w1, 14
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 160]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L568:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 144]
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 148]
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 152]
	b	.L562
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
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	add	x2, x21, 86016
	mov	w1, 1
	add	x20, x2, 1640
	mov	x0, x20
	ldr	x24, [x2, 2768]
	bl	BsGet
	cmp	w0, 1
	str	w0, [x24, 84]
	beq	.L570
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x24, 88]
	beq	.L588
.L572:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cbz	w0, .L576
	mov	w19, 64
	.p2align 2
.L580:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	subs	w19, w19, #1
	bne	.L580
.L576:
	mov	w1, 1
	mov	x0, x20
	mov	w19, 64
	bl	BsGet
	cbz	w0, .L569
	.p2align 2
.L582:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	subs	w19, w19, #1
	bne	.L582
.L569:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L570:
	ldr	x22, .LC108
	add	x23, x22, 64
	.p2align 2
.L573:
	ldrb	w19, [x22], 1
	mov	w1, 8
	mov	x0, x20
	add	x19, x19, 20480
	add	x19, x19, 1444
	bl	BsGet
	cmp	x22, x23
	str	w0, [x21, x19, lsl 2]
	bne	.L573
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x24, 88]
	bne	.L572
.L588:
	ldr	x22, .LC108
	add	x23, x22, 64
	.p2align 2
.L577:
	ldrb	w19, [x22], 1
	mov	w1, 8
	mov	x0, x20
	add	x19, x19, 20480
	add	x19, x19, 1508
	bl	BsGet
	cmp	x23, x22
	str	w0, [x21, x19, lsl 2]
	bne	.L577
	b	.L572
	.size	quant_matrix_extension, .-quant_matrix_extension
	.align	3
.LC108:
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
	add	x19, x19, 86016
	bl	_mcount
	add	x20, x19, 1640
	add	x0, x23, 264
	add	x0, x0, 40960
	ldr	x19, [x19, 2768]
	ldr	w1, [x0, 1100]
	orr	w1, w1, 2097152
	str	w1, [x0, 1100]
	ldrb	w0, [x19, 35]
	cbz	w0, .L590
	ldrb	w0, [x19, 24]
	mov	w22, 1
	cbnz	w0, .L603
.L591:
	add	x19, x19, 172
	mov	w21, 0
	b	.L595
	.p2align 3
.L604:
	mov	w1, 16
	mov	x0, x20
	add	x19, x19, 4
	bl	BsGet
	mov	w1, 1
	str	w0, [x19, 8]
	mov	x0, x20
	bl	BsGet
	cbz	w0, .L602
	cmp	w21, w22
	bge	.L589
.L595:
	mov	w1, 16
	mov	x0, x20
	add	w21, w21, 1
	bl	BsGet
	str	w0, [x19]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cbnz	w0, .L604
.L602:
	add	x0, x23, 264
	add	x0, x0, 40960
	ldr	w1, [x0, 1100]
	orr	w1, w1, 32
	str	w1, [x0, 1100]
.L589:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L590:
	ldrb	w0, [x19, 17]
	mov	w22, 1
	cmp	w0, 3
	bne	.L591
	ldrb	w1, [x19, 24]
	mov	w22, 2
	cmp	w1, wzr
	csel	w22, w22, w0, eq
	b	.L591
	.p2align 3
.L603:
	ldrb	w1, [x19, 18]
	mov	w0, 2
	mov	w22, 3
	cmp	w1, wzr
	csel	w22, w0, w22, eq
	b	.L591
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
	add	x19, x19, 86016
	bl	_mcount
	add	x20, x19, 1640
	add	x1, x22, 264
	add	x1, x1, 40960
	ldr	x21, [x19, 2768]
	mov	x23, x1
	mov	x25, x21
	add	x24, x21, 4
	ldr	w0, [x1, 1100]
	orr	w0, w0, 1048576
	str	w0, [x1, 1100]
.L606:
	mov	x19, 0
.L608:
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	sub	w2, w0, #10
	add	x1, x25, x19
	add	x19, x19, 1
	uxtb	w2, w2
	cmp	w2, 4
	strb	w0, [x1, 12]
	ccmp	w0, wzr, 4, hi
	bne	.L607
	ldr	w0, [x23, 1100]
	orr	w0, w0, 16
	str	w0, [x23, 1100]
.L607:
	cmp	x19, 2
	bne	.L608
	add	x25, x25, 2
	cmp	x25, x24
	bne	.L606
	mov	w1, w19
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 16]
	mov	w1, w19
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x21, 17]
	cbnz	w0, .L610
	add	x22, x22, 264
	add	x22, x22, 40960
	ldr	w0, [x22, 1100]
	orr	w0, w0, 16
	str	w0, [x22, 1100]
.L605:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L610:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 18]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 19]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 20]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 21]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 22]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 23]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 24]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 25]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 26]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x21, 3]
	cbz	w0, .L605
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 27]
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 28]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 29]
	mov	w1, 7
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 40]
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 44]
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
	add	x19, x19, 86016
	mov	w20, 0
	bl	_mcount
	add	x19, x19, 1640
	b	.L620
	.p2align 3
.L622:
	mov	w1, 8
	mov	x0, x19
	add	w20, w20, 1
	bl	BsSkip
	mov	x0, x19
	bl	BsResidBits
	cmp	w0, 8
	ble	.L621
.L620:
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	cbnz	w0, .L622
.L621:
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
	mov	x3, 20744
	add	x4, x21, 86016
	movk	x3, 0x1, lsl 16
	add	x20, x4, 1640
	add	x3, x21, x3
	mov	w1, 10
	ldr	x19, [x4, 2768]
	mov	x0, x20
	ldr	w2, [x3, 1100]
	and	w2, w2, -3670073
	orr	w2, w2, 524288
	str	w2, [x3, 1100]
	bl	BsGet
	str	w0, [x19, 164]
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 30]
	mov	w1, 16
	mov	x0, x20
	bl	BsGet
	ldrb	w22, [x19, 30]
	str	w0, [x19, 168]
	sub	w0, w22, #2
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L626
.L624:
	cmp	w22, 3
	beq	.L627
	mov	x0, x21
	bl	extra_bit_information
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L627:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 33]
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 34]
	mov	x0, x21
	bl	extra_bit_information
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L626:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 31]
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	ldrb	w22, [x19, 30]
	strb	w0, [x19, 32]
	b	.L624
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
	add	x0, x19, 86016
	mov	w1, 32
	add	x0, x0, 1640
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
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 86016
	bl	_mcount
	add	x19, x19, 1640
	mov	w1, 4
	mov	x0, x19
	bl	BsGet
	sub	w0, w0, #1
	cmp	w0, 9
	bhi	.L633
	ldr	x1, .LC110
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx635
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx635:
	.section	.rodata
	.align	0
	.align	2
.L635:
	.byte	(.L634 - .Lrtx635) / 4
	.byte	(.L636 - .Lrtx635) / 4
	.byte	(.L637 - .Lrtx635) / 4
	.byte	(.L638 - .Lrtx635) / 4
	.byte	(.L638 - .Lrtx635) / 4
	.byte	(.L633 - .Lrtx635) / 4
	.byte	(.L640 - .Lrtx635) / 4
	.byte	(.L641 - .Lrtx635) / 4
	.byte	(.L638 - .Lrtx635) / 4
	.byte	(.L638 - .Lrtx635) / 4
	.text
	.p2align 3
.L638:
	mov	w1, 32
	mov	x0, x19
	bl	BsSkip
.L633:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L637:
	mov	x0, x20
	bl	quant_matrix_extension
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L641:
	mov	x0, x20
	bl	picture_coding_extension
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L640:
	mov	x0, x20
	bl	picture_display_extension
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L634:
	mov	x0, x20
	bl	sequence_extension
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L636:
	mov	x0, x20
	bl	sequence_display_extension
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	extension, .-extension
	.align	3
.LC110:
	.xword	.L635
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
	str	x27, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x21, xzr, 4, ne
	beq	.L651
	ldr	w0, [x21, 664]
	ldr	x27, .LC113
	cmp	w0, 1
	beq	.L652
	mov	w24, 0
	mov	w25, 0
	mov	w26, 0
	add	x22, x20, 45056
	add	x19, x20, 86016
.L647:
	ldr	x3, [x27, 96]
	mov	x2, 23904
	mov	w1, 0
	movk	x2, 0x1, lsl 16
	mov	x0, x20
	ldr	w23, [x19, 3384]
	blr	x3
	str	w23, [x19, 3384]
	add	x0, x19, 2784
	mov	w23, 1
	bl	ResetVoQueue
	str	x21, [x20]
	add	x1, x22, 264
	str	wzr, [x19, 3404]
	add	x22, x1, 40960
	add	x0, x19, 2368
	add	x2, x19, 2568
	str	x0, [x19, 2776]
	str	x2, [x19, 2768]
	mov	w2, 3
	str	w23, [x22, 1112]
	mov	x0, x20
	strb	w2, [x1, 1]
	str	wzr, [x22, 1176]
	ldr	w1, [x21, 8]
	str	w1, [x22, 1088]
	str	wzr, [x22, 1168]
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x19, 3392]
	beq	.L653
	ldr	w20, [x21, 664]
	cmp	w20, 1
	beq	.L654
	mov	w20, w23
.L646:
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	add	sp, sp, 912
	ret
	.p2align 3
.L654:
	ldr	w0, [x22, 1100]
	add	x1, x29, 496
	ldr	x3, [x27, 104]
	mov	x2, 256
	orr	w0, w0, 65536
	str	w24, [x22, 1096]
	str	w0, [x22, 1100]
	add	x0, x19, 1680
	str	w26, [x22, 1156]
	str	w25, [x22, 1168]
	blr	x3
	ldr	x3, [x27, 104]
	add	x1, x29, 752
	mov	x2, 256
	add	x0, x19, 1936
	blr	x3
	ldr	x3, [x27, 104]
	add	x1, x29, 96
	ldr	x0, [x19, 2768]
	mov	x2, 200
	blr	x3
	ldr	x0, [x19, 2776]
	mov	x2, 200
	ldr	x3, [x27, 104]
	add	x1, x29, 296
	blr	x3
	b	.L646
	.p2align 3
.L652:
	add	x22, x20, 45056
	add	x19, x20, 86016
	add	x3, x22, 264
	ldr	x4, [x27, 104]
	add	x3, x3, 40960
	add	x1, x19, 1680
	mov	x2, 256
	add	x0, x29, 496
	ldr	w24, [x3, 1096]
	ldr	w26, [x3, 1156]
	ldr	w25, [x3, 1168]
	blr	x4
	ldr	x3, [x27, 104]
	add	x1, x19, 1936
	mov	x2, 256
	add	x0, x29, 752
	blr	x3
	ldr	x1, [x19, 2768]
	mov	x2, 200
	ldr	x3, [x27, 104]
	add	x0, x29, 96
	blr	x3
	ldr	x1, [x19, 2776]
	mov	x2, 200
	ldr	x3, [x27, 104]
	add	x0, x29, 296
	blr	x3
	b	.L647
	.p2align 3
.L651:
	ldr	x1, .LC112
	mov	w0, 0
	mov	w20, -2
	bl	dprint_vfmw
	b	.L646
.L653:
	ldr	x1, .LC115
	mov	w0, 0
	mov	w20, -20
	bl	dprint_vfmw
	b	.L646
	.size	MPEG2DEC_Init, .-MPEG2DEC_Init
	.align	3
.LC112:
	.xword	.LC111
	.align	3
.LC113:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC115:
	.xword	.LC114
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG2DEC_Destroy
	.type	MPEG2DEC_Destroy, %function
MPEG2DEC_Destroy:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L658
	mov	x0, 20744
	ldr	x1, .LC121
	movk	x0, 0x1, lsl 16
	add	x2, x19, x0
	mov	w0, 2
	ldr	w2, [x2, 1108]
	bl	dprint_vfmw
	mov	w0, 1
.L657:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L658:
	ldr	x3, .LC117
	mov	w2, 2980
	ldr	x1, .LC119
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L657
	.size	MPEG2DEC_Destroy, .-MPEG2DEC_Destroy
	.align	3
.LC117:
	.xword	.LC116
	.align	3
.LC119:
	.xword	.LC118
	.align	3
.LC121:
	.xword	.LC120
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
	cbz	x20, .L665
	cmp	w19, 31
	bhi	.L668
	add	x20, x20, 86016
	mov	w1, w19
	mov	w2, 0
	ldr	w0, [x20, 3392]
	bl	FSP_SetDisplay
	ldr	w0, [x20, 3392]
	mov	w1, w19
	bl	FSP_GetFsImagePtr
	add	x19, x0, 544
	add	x21, x0, 576
	cbz	x0, .L664
.L666:
	ldr	x1, [x19]
	ldr	w0, [x20, 3392]
	bl	FreeUsdByDec
	str	xzr, [x19], 8
	cmp	x19, x21
	bne	.L666
.L664:
	mov	w0, 1
.L660:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L665:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L668:
	ldr	x3, .LC123
	mov	w2, 3112
	ldr	x1, .LC124
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L660
	.size	MPEG2DEC_RecycleImage, .-MPEG2DEC_RecycleImage
	.align	3
.LC123:
	.xword	.LC122
	.align	3
.LC124:
	.xword	.LC118
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG2DEC_GetRemainImg
	.type	MPEG2DEC_GetRemainImg, %function
MPEG2DEC_GetRemainImg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L690
	ldr	x0, [x19]
	add	x20, x19, 86016
	ldr	w0, [x0, 24]
	cmp	w0, 1
	beq	.L672
	add	x23, x19, 45056
	add	x20, x19, 86016
	add	x21, x23, 264
	add	x21, x21, 40960
	ldr	w0, [x20, 3392]
	ldr	w1, [x21, 1200]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L672
	ldr	w0, [x20, 3392]
	ldr	w1, [x21, 1200]
	bl	FSP_GetDisplay
	cmp	w0, 2
	beq	.L691
.L672:
	add	x21, x20, 2784
.L677:
	mov	x0, x21
	bl	GetVoLastImageID
.L685:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L691:
	mov	x0, x19
	bl	MP2_SetImgFormat
	add	x1, x20, 1384
	add	x0, x22, 544
	add	x3, x22, 576
.L674:
	ldr	x2, [x1]
	cbz	x2, .L673
	str	x2, [x0]
.L673:
	add	x0, x0, 8
	str	xzr, [x1], 8
	cmp	x0, x3
	bne	.L674
	add	x23, x23, 264
	mov	w0, 1
	add	x23, x23, 40960
	mov	w2, w0
	add	x21, x20, 2784
	str	wzr, [x23, 1152]
	str	w0, [x22, 180]
	ldr	w1, [x22, 148]
	ldr	w0, [x20, 3392]
	bl	FSP_SetDisplay
	ldr	w0, [x20, 3392]
	mov	x4, x22
	mov	x3, x21
	mov	x2, x19
	mov	w1, 3
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L675
	ldr	w1, [x22, 148]
	mov	x0, x19
	bl	MPEG2DEC_RecycleImage
	b	.L677
	.p2align 3
.L675:
	ldr	w0, [x22, 152]
	cmp	w0, 100
	bhi	.L672
	ldr	w0, [x22, 68]
	cmp	w0, 31
	bls	.L672
	ldr	w1, [x22, 72]
	mov	w0, 0
	cmp	w1, 31
	bhi	.L685
	b	.L677
	.p2align 3
.L690:
	ldr	x3, .LC125
	mov	w2, 3140
	ldr	x1, .LC126
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L685
	.size	MPEG2DEC_GetRemainImg, .-MPEG2DEC_GetRemainImg
	.align	3
.LC125:
	.xword	.LC116
	.align	3
.LC126:
	.xword	.LC118
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
	cbz	x19, .L704
	add	x0, x19, 45056
	add	x0, x0, 264
	ldrb	w1, [x0, 1]
	cmp	w1, 3
	beq	.L695
	add	x0, x0, 40960
	ldr	w0, [x0, 1112]
	cbz	w0, .L696
.L695:
	add	x19, x19, 86016
	ldr	w0, [x19, 3392]
	bl	FSP_IsNewFsAvalible
	cmp	w0, 1
	beq	.L696
	ldr	w0, [x19, 3392]
	mov	w20, 0
	bl	FSP_IsNewFsAvalible
	cmn	w0, #1
	bne	.L694
	ldr	w0, [x19, 3392]
	add	x1, x19, 2784
	bl	FSP_ClearNotInVoQueue
	b	.L694
	.p2align 3
.L696:
	mov	w20, 1
.L694:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L704:
	ldr	x3, .LC127
	mov	w2, 3429
	ldr	x1, .LC128
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L694
	.size	MPEG2DEC_GetImageBuffer, .-MPEG2DEC_GetImageBuffer
	.align	3
.LC127:
	.xword	.LC116
	.align	3
.LC128:
	.xword	.LC118
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_ClearCurPacket
	.type	MP2_ClearCurPacket, %function
MP2_ClearCurPacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L712
	ldr	w1, [x19, 20]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
	ldrsb	w0, [x19]
	cmp	w0, 1
	beq	.L708
	ldr	w1, [x19, 24]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
.L708:
	ldr	x3, .LC132
	mov	x2, 48
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L712:
	ldr	x3, .LC130
	mov	w2, 3504
	ldr	x1, .LC131
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_ClearCurPacket, .-MP2_ClearCurPacket
	.align	3
.LC130:
	.xword	.LC129
	.align	3
.LC131:
	.xword	.LC118
	.align	3
.LC132:
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
	cbz	x20, .L719
	add	x1, x19, 40960
	str	wzr, [x1, 1032]
	ldr	w0, [x20, 20]
	str	w0, [x1, 1092]
	ldr	w0, [x20, 16]
	str	w0, [x1, 1044]
	ldr	x0, [x20]
	str	x0, [x1, 1072]
	ldr	w0, [x20, 20]
	str	w0, [x1, 1052]
	ldrb	w0, [x20, 9]
	strb	w0, [x1, 1040]
	ldr	w0, [x20, 24]
	str	w0, [x1, 1060]
	ldrb	w21, [x20, 9]
	cmp	w21, 1
	beq	.L716
	ldr	w0, [x20, 104]
	mov	w21, 1
	str	w0, [x1, 1048]
	ldr	x0, [x20, 88]
	str	x0, [x1, 1080]
	ldr	w0, [x20, 108]
	str	w0, [x1, 1056]
	ldrb	w0, [x20, 97]
	strb	w0, [x1, 1041]
	ldr	w0, [x20, 112]
	str	w0, [x1, 1064]
	ldrb	w0, [x20, 97]
	cmp	w0, w21
	beq	.L715
	add	x1, x1, 1040
	mov	w0, w22
	bl	MP2_ClearCurPacket
	ldrb	w2, [x20, 97]
	mov	w0, w21
	ldr	x1, .LC136
	mov	w21, 0
	bl	dprint_vfmw
.L715:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L716:
	strb	wzr, [x1, 1041]
	mov	w0, w21
	str	wzr, [x1, 1048]
	str	wzr, [x1, 1056]
	str	wzr, [x1, 1064]
	str	xzr, [x1, 1080]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L719:
	add	x19, x19, 40960
	ldr	x1, .LC134
	mov	w0, 1
	mov	w21, 0
	ldr	w2, [x19, 1108]
	bl	dprint_vfmw
	b	.L715
	.size	MP2_ReceivePacket, .-MP2_ReceivePacket
	.align	3
.LC134:
	.xword	.LC133
	.align	3
.LC136:
	.xword	.LC135
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
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	cbz	x21, .L721
	add	x22, x21, 16
	mov	w20, 0
	add	x0, x22, 45056
	add	x21, x21, 86016
	mov	x23, x0
	ldr	w0, [x0, 236]
	cbnz	w0, .L731
	b	.L726
	.p2align 3
.L724:
	ldr	w0, [x23, 236]
	cmp	w0, w20
	bls	.L726
.L731:
	sxtw	x19, w20
	ldr	w0, [x21, 3392]
	lsl	x1, x19, 2
	add	w20, w20, 1
	sub	x1, x1, x19
	lsl	x1, x1, 2
	sub	x19, x1, x19
	add	x19, x22, x19, lsl 2
	ldr	w1, [x19, 260]
	bl	SM_ReleaseStreamSeg
	ldr	w0, [x19, 240]
	cbz	w0, .L724
	ldr	w0, [x19, 248]
	cbz	w0, .L724
	ldr	w1, [x19, 264]
	ldr	w0, [x21, 3392]
	bl	SM_ReleaseStreamSeg
	ldr	w0, [x23, 236]
	cmp	w0, w20
	bhi	.L731
	.p2align 2
.L726:
	add	x22, x22, 45056
	str	wzr, [x22, 236]
.L720:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L721:
	ldr	x3, .LC137
	mov	w2, 3525
	ldr	x1, .LC138
	mov	w0, 0
	bl	dprint_vfmw
	b	.L720
	.size	MP2_ClearCurPic, .-MP2_ClearCurPic
	.align	3
.LC137:
	.xword	.LC116
	.align	3
.LC138:
	.xword	.LC118
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
	str	x27, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	w23, w1
	bl	_mcount
	cbz	x20, .L803
	add	x21, x20, 45056
	add	x19, x20, 86016
	add	x22, x21, 264
	ldrb	w0, [x20, 161]
	add	x22, x22, 40960
	ldr	x1, .LC142
	mov	w2, w23
	ldr	x24, [x19, 2768]
	add	x25, x20, 16
	strb	w0, [x22, 1300]
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x0, [x20, 8]
	ldr	x1, [x19, 2768]
	ldrb	w2, [x0, 144]
	add	x0, x0, 45056
	strb	w2, [x1, 4]
	ldr	w0, [x0, 240]
	str	w0, [x1, 8]
	ldr	x0, [x19, 2768]
	ldr	x1, [x20]
	ldr	w2, [x0, 48]
	str	w2, [x1, 616]
	ldr	x1, [x20]
	ldr	w0, [x0, 52]
	str	w0, [x1, 620]
	ldr	w1, [x19, 3400]
	ldr	w0, [x19, 3396]
	ldr	x2, [x20]
	cmp	w0, w1
	sub	w0, w0, w1
	csel	w1, w0, wzr, ge
	mov	x0, x20
	str	w1, [x2, 624]
	bl	MP2_ClearCurPic
	ldr	x3, .LC143
	mov	x2, 45304
	mov	w1, 0
	mov	x0, x25
	ldr	x3, [x3, 96]
	blr	x3
	ldr	w1, [x22, 1204]
	ldr	w0, [x19, 3392]
	bl	FSP_GetFsImagePtr
	mov	x25, x0
	ldr	w1, [x22, 1200]
	ldr	w0, [x19, 3392]
	bl	FSP_GetFsImagePtr
	mov	x26, x0
	ldr	w1, [x22, 1196]
	ldr	w0, [x19, 3392]
	bl	FSP_GetFsImagePtr
	cbz	x25, .L804
	ldrb	w0, [x24, 30]
	strb	w0, [x21, 264]
	tbnz	w23, #31, .L773
	mov	w0, 100
	cmp	w23, w0
	csel	w23, w23, w0, le
.L740:
	ldr	x1, .LC147
	mov	w0, 22
	str	w23, [x25, 152]
	bl	dprint_vfmw
	mov	x0, x20
	bl	MP2_SetImgFormat
	ldrb	w0, [x24, 17]
	cmp	w0, 3
	beq	.L741
	add	x0, x21, 264
	add	x0, x0, 40960
	ldr	w0, [x0, 1112]
	cmp	w0, 1
	beq	.L741
	ldrb	w0, [x24, 30]
	cmp	w0, 3
	beq	.L774
.L809:
	ldr	x0, [x20]
	mov	w20, 1
	ldr	w1, [x25, 152]
	ldr	w0, [x0]
	cmp	w1, w0
	bhi	.L805
.L737:
	mov	w0, w20
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L805:
	add	x22, x21, 264
	ldr	w0, [x19, 3392]
	add	x22, x22, 40960
	mov	w2, w20
	ldr	w1, [x22, 1204]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 3392]
	ldr	w1, [x22, 1200]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	cbz	x0, .L770
	ldr	w0, [x19, 3392]
	ldr	x1, [x23, 544]
	bl	FreeUsdByDec
	ldr	w0, [x19, 3392]
	ldr	x1, [x23, 552]
	bl	FreeUsdByDec
	ldr	w0, [x19, 3392]
	ldr	x1, [x23, 560]
	bl	FreeUsdByDec
	ldr	w0, [x19, 3392]
	ldr	x1, [x23, 568]
	bl	FreeUsdByDec
	add	x0, x23, 512
	mov	w2, w20
	stp	xzr, xzr, [x0, 32]
	stp	xzr, xzr, [x0, 48]
	ldr	w0, [x19, 3392]
	ldr	w1, [x22, 1200]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 3392]
	mov	w2, w20
	ldr	w1, [x22, 1196]
	bl	FSP_ClearLogicFs
	str	wzr, [x22, 1196]
	str	wzr, [x22, 1200]
	ldr	w0, [x19, 3392]
	bl	FSP_GetFspType
	cbnz	w0, .L806
.L770:
	add	x21, x21, 264
	mov	w20, 1
	add	x21, x21, 40960
	mov	w0, w20
	str	wzr, [x21, 1160]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L741:
	add	x1, x19, 1384
	add	x0, x25, 544
	add	x3, x25, 576
.L744:
	ldr	x2, [x1]
	cbz	x2, .L743
	str	x2, [x0]
.L743:
	add	x0, x0, 8
	str	xzr, [x1], 8
	cmp	x0, x3
	bne	.L744
	add	x0, x21, 264
	add	x0, x0, 40960
	str	wzr, [x0, 1152]
	ldr	x1, [x20]
	ldr	w1, [x1, 24]
	cbnz	w1, .L745
	ldrb	w1, [x24, 30]
	cmp	w1, 3
	beq	.L745
	ldr	w1, [x0, 1196]
	str	w1, [x0, 1208]
	cmn	w1, #1
	beq	.L748
.L810:
	ldr	w0, [x19, 3392]
	bl	FSP_GetDisplay
	cmp	w0, 1
	beq	.L752
	add	x1, x21, 264
	ldr	w0, [x19, 3392]
	add	x1, x1, 40960
	ldr	w1, [x1, 1208]
	bl	FSP_GetDisplay
	cmp	w0, 2
	beq	.L752
.L748:
	ldrb	w0, [x24, 35]
	cmp	w0, 1
	beq	.L807
	ldrb	w0, [x24, 26]
	cmp	w0, 1
	beq	.L808
	add	x1, x21, 264
	add	x1, x1, 40960
	ldr	w0, [x1, 1284]
	add	w0, w0, 1
	str	w0, [x1, 1284]
	lsl	w0, w0, 1
	str	w0, [x1, 1280]
.L767:
	ldr	w1, [x19, 1540]
	add	x0, x21, 264
	add	x0, x0, 40960
	add	w1, w1, 1
	str	w1, [x19, 1540]
	ldr	w1, [x0, 1108]
	add	w1, w1, 1
	str	w1, [x0, 1108]
	ldrb	w0, [x24, 30]
	cmp	w0, 3
	bne	.L809
.L774:
	mov	w20, 1
	ldr	x27, [sp, 80]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L745:
	add	x0, x21, 264
	add	x0, x0, 40960
	ldr	w1, [x0, 1204]
	str	w1, [x0, 1208]
	cmn	w1, #1
	bne	.L810
	b	.L748
	.p2align 3
.L803:
	ldr	x3, .LC139
	mov	w2, 3248
	ldr	x1, .LC140
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	ldr	x27, [sp, 80]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L808:
	add	x0, x21, 264
	add	x0, x0, 40960
	ldr	w1, [x0, 1284]
	ldr	w2, [x0, 1280]
	add	w1, w1, 1
	str	w1, [x0, 1284]
	ldrb	w1, [x24, 24]
	add	w1, w1, 2
	add	w1, w1, w2
	str	w1, [x0, 1280]
	b	.L767
	.p2align 3
.L752:
	add	x1, x21, 264
	ldr	w0, [x19, 3392]
	add	x1, x1, 40960
	ldr	w1, [x1, 1208]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L811
	ldr	w2, [x0, 152]
	cbz	w2, .L754
	ldr	x0, [x20]
	ldr	w3, [x0, 4]
	cmp	w2, w3
	bhi	.L755
.L754:
	add	x23, x21, 264
	ldr	w0, [x19, 3392]
	add	x23, x23, 40960
	ldr	w26, [x23, 1208]
	mov	w1, w26
	bl	FSP_GetRef
	mov	w3, w0
	ldr	x1, .LC150
	mov	w2, w26
	mov	w0, 12
	bl	dprint_vfmw
	ldr	w1, [x23, 1208]
	mov	w2, 1
	ldr	w0, [x19, 3392]
	bl	FSP_SetDisplay
	ldr	w23, [x19, 3392]
	ldr	w1, [x19, 1464]
	mov	w0, w23
	bl	FSP_GetFsImagePtr
	mov	x27, x0
	ldr	w1, [x19, 1472]
	mov	w0, w23
	bl	FSP_GetFsImagePtr
	mov	x26, x0
	cmp	x27, xzr
	ccmp	x0, xzr, 4, ne
	beq	.L812
	ldr	x0, [x0, 584]
	cmn	x0, #1
	beq	.L757
	ldr	w1, [x19, 1464]
	mov	w0, w23
	bl	FSP_GetDisplay
	cmp	w0, 1
	beq	.L762
	ldr	w1, [x19, 1464]
	mov	w0, w23
	bl	FSP_GetDisplay
	cmp	w0, 2
	bne	.L757
.L762:
	ldr	x1, [x26, 584]
	ldr	x2, [x27, 584]
	cmp	x1, x2
	bls	.L757
	mov	w0, w23
	bl	IsPtsRewind
	cbnz	w0, .L757
	ldr	x1, .LC154
	mov	w0, 29
	ldr	x2, [x26, 584]
	ldr	x3, [x27, 584]
	bl	dprint_vfmw
	ldr	x1, [x27, 584]
	ldr	x0, [x26, 584]
	str	x1, [x26, 584]
	str	x0, [x27, 584]
	.p2align 2
.L757:
	ldr	w0, [x19, 3392]
	mov	x4, x22
	add	x3, x19, 2784
	mov	x2, x20
	mov	w1, 3
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L763
	add	x20, x22, 544
	add	x22, x22, 576
.L764:
	ldr	x1, [x20]
	ldr	w0, [x19, 3392]
	bl	FreeUsdByDec
	str	xzr, [x20], 8
	cmp	x20, x22
	bne	.L764
	add	x1, x21, 264
	ldr	w0, [x19, 3392]
	add	x1, x1, 40960
	mov	w2, 0
	mov	w20, 0
	ldr	w1, [x1, 1208]
	bl	FSP_SetDisplay
	b	.L737
	.p2align 3
.L773:
	mov	w23, 0
	b	.L740
	.p2align 3
.L807:
	add	x0, x21, 264
	ldrb	w2, [x24, 24]
	add	x0, x0, 40960
	ldrb	w1, [x24, 18]
	add	w1, w2, w1
	ldr	w2, [x0, 1284]
	add	w1, w1, 1
	add	w1, w1, w2
	str	w1, [x0, 1284]
	lsl	w1, w1, 1
	str	w1, [x0, 1280]
	b	.L767
	.p2align 3
.L806:
	ldr	w0, [x19, 3392]
	bl	FSP_GetNullLogicFs
	str	w0, [x22, 1196]
	str	w0, [x22, 1200]
	b	.L770
	.p2align 3
.L763:
	ldr	x1, [x20]
	str	w0, [x1, 1028]
	ldr	w0, [x19, 3400]
	add	w0, w0, 1
	str	w0, [x19, 3400]
	b	.L748
	.p2align 3
.L755:
	ldr	x1, .LC156
	mov	w0, 1
	add	x23, x22, 544
	add	x22, x22, 576
	bl	dprint_vfmw
.L765:
	ldr	x1, [x23]
	ldr	w0, [x19, 3392]
	bl	FreeUsdByDec
	str	xzr, [x23], 8
	cmp	x22, x23
	bne	.L765
	add	x1, x21, 264
	ldr	w0, [x19, 3392]
	add	x1, x1, 40960
	mov	w2, 0
	ldr	w1, [x1, 1208]
	bl	FSP_SetDisplay
	b	.L748
	.p2align 3
.L804:
	ldr	x1, .LC145
	mov	x4, x0
	mov	x3, x26
	mov	x2, 0
	mov	w0, 0
	mov	w20, 0
	bl	dprint_vfmw
	b	.L737
.L812:
	ldr	x1, .LC152
	mov	w0, 0
	bl	dprint_vfmw
	b	.L757
.L811:
	ldr	x1, .LC148
	mov	w2, 3345
	mov	w0, 0
	mov	w20, 0
	bl	dprint_vfmw
	b	.L737
	.size	MPEG2DEC_VDMPostProc, .-MPEG2DEC_VDMPostProc
	.align	3
.LC139:
	.xword	.LC116
	.align	3
.LC140:
	.xword	.LC118
	.align	3
.LC142:
	.xword	.LC141
	.align	3
.LC143:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC145:
	.xword	.LC144
	.align	3
.LC147:
	.xword	.LC146
	.align	3
.LC148:
	.xword	.LC56
	.align	3
.LC150:
	.xword	.LC149
	.align	3
.LC152:
	.xword	.LC151
	.align	3
.LC154:
	.xword	.LC153
	.align	3
.LC156:
	.xword	.LC155
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_u_v
	.type	MP2_u_v, %function
MP2_u_v:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x22, x2
	mov	w21, w1
	bl	_mcount
	mov	w1, w21
	mov	x0, x20
	bl	BsShow
	mov	w19, w0
	mov	w1, w21
	mov	x0, x20
	bl	BsSkip
	ldr	x1, .LC158
	mov	w3, w19
	mov	x2, x22
	mov	w0, 2
	bl	dprint_vfmw
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MP2_u_v, .-MP2_u_v
	.align	3
.LC158:
	.xword	.LC157
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_DecSliceHeader
	.type	MP2_DecSliceHeader, %function
MP2_DecSliceHeader:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x20, 4]
	mov	w1, 1
	str	wzr, [x20, 24]
	mov	w4, 0
	cmp	w0, 175
	str	w1, [x20, 16]
	ldr	x19, [x20, 56]
	bls	.L815
	ldr	w0, [x20]
	cbz	w0, .L826
.L815:
	ldr	w3, [x20, 20]
	mov	w1, 5
	ldr	w5, [x20, 8]
	mov	x0, x19
	sub	w3, w3, #1
	ldr	x2, .LC162
	add	w4, w3, w4
	mul	w3, w4, w5
	cmp	w3, wzr
	cset	w4, ne
	sub	w3, w3, w4
	str	w3, [x20, 28]
	bl	MP2_u_v
	str	wzr, [x20, 32]
	str	w0, [x20, 44]
	mov	w1, 1
	mov	x0, x19
	bl	BsShow
	cbnz	w0, .L817
	ldr	x20, .LC164
.L819:
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	MP2_u_v
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L817:
	ldr	x2, .LC166
	mov	w1, 1
	mov	x0, x19
	bl	MP2_u_v
	ldr	x2, .LC168
	mov	w1, 1
	mov	x0, x19
	bl	MP2_u_v
	str	w0, [x20, 32]
	ldr	x2, .LC170
	mov	w1, 7
	mov	x0, x19
	bl	MP2_u_v
	ldr	x20, .LC164
	ldr	x21, .LC172
	b	.L818
	.p2align 3
.L827:
	bl	BsShow
	cbz	w0, .L819
	mov	w1, 1
	mov	x2, x20
	mov	x0, x19
	bl	MP2_u_v
	mov	x2, x21
	mov	w1, 8
	mov	x0, x19
	bl	MP2_u_v
.L818:
	mov	x0, x19
	bl	BsResidBits
	cmp	w0, wzr
	mov	w1, 1
	mov	x0, x19
	bgt	.L827
	b	.L819
	.p2align 3
.L826:
	ldr	x2, .LC160
	mov	w1, 3
	mov	x0, x19
	bl	MP2_u_v
	lsl	w4, w0, 7
	str	w0, [x20, 24]
	b	.L815
	.size	MP2_DecSliceHeader, .-MP2_DecSliceHeader
	.align	3
.LC160:
	.xword	.LC159
	.align	3
.LC162:
	.xword	.LC161
	.align	3
.LC164:
	.xword	.LC163
	.align	3
.LC166:
	.xword	.LC165
	.align	3
.LC168:
	.xword	.LC167
	.align	3
.LC170:
	.xword	.LC169
	.align	3
.LC172:
	.xword	.LC171
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_ExitMb
	.type	MP2_ExitMb, %function
MP2_ExitMb:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	str	wzr, [x19, 16]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_ExitMb, .-MP2_ExitMb
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_WriteSliceInfo
	.type	MP2_WriteSliceInfo, %function
MP2_WriteSliceInfo:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 16
	bl	_mcount
	add	x2, x21, 45056
	add	x0, x20, 86016
	ldr	w2, [x2, 236]
	ldr	w4, [x0, 1608]
	cmp	w2, 1023
	uxtw	x3, w2
	lsl	x19, x3, 2
	sub	x19, x19, x3
	lsl	x19, x19, 2
	sub	x19, x19, x3
	add	x19, x21, x19, lsl 2
	str	w4, [x19, 272]
	ldr	w3, [x0, 1620]
	str	w3, [x19, 276]
	ldr	w1, [x0, 1616]
	str	w1, [x19, 268]
	bhi	.L835
	mov	x1, 20744
	add	x0, x0, 1640
	movk	x1, 0x1, lsl 16
	add	x20, x20, x1
	ldr	w1, [x0, 32]
	ldr	w2, [x20, 1044]
	and	w3, w1, 7
	str	w3, [x19, 252]
	add	w1, w2, w1, lsr 3
	str	w1, [x19, 236]
	ldr	w1, [x20, 1060]
	str	w1, [x19, 260]
	bl	BsResidBits
	str	w0, [x19, 244]
	ldrsh	w0, [x20, 1040]
	cmp	w0, 1
	beq	.L836
	cmp	w0, 256
	bne	.L834
	ldr	w0, [x20, 1048]
	str	w0, [x19, 240]
	str	wzr, [x19, 256]
	ldr	w0, [x20, 1064]
	str	w0, [x19, 264]
	ldr	w0, [x20, 1056]
	lsl	w0, w0, 3
	str	w0, [x19, 248]
.L833:
	add	x21, x21, 45056
	mov	w0, 1
	ldr	w1, [x21, 236]
	add	w1, w1, w0
	str	w1, [x21, 236]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L835:
	ldr	x1, .LC174
	mov	w3, 1024
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x20
	bl	MP2_ClearCurPic
	mov	x0, 20744
	mov	w1, -5767169
	movk	x0, 0x1, lsl 16
	add	x20, x20, x0
	mov	w0, 0
	ldr	w2, [x20, 1100]
	str	wzr, [x20, 1176]
	and	w1, w2, w1
	str	w1, [x20, 1100]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L836:
	str	wzr, [x19, 240]
	str	wzr, [x19, 248]
	str	wzr, [x19, 256]
	str	wzr, [x19, 264]
	b	.L833
	.p2align 3
.L834:
	ldrsb	w3, [x20, 1041]
	mov	w0, 1
	ldrsb	w2, [x20, 1040]
	ldr	x1, .LC176
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	MP2_WriteSliceInfo, .-MP2_WriteSliceInfo
	.align	3
.LC174:
	.xword	.LC173
	.align	3
.LC176:
	.xword	.LC175
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_MbAddrInc
	.type	MP2_MbAddrInc, %function
MP2_MbAddrInc:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 4
	mov	x0, x21
	bl	BsShow
	ldr	x20, .LC177
	ubfiz	x0, x0, 3, 32
	add	x1, x20, 80
	add	x2, x1, x0
	ldr	w19, [x1, x0]
	ldr	w1, [x2, 4]
	cmp	w19, 6
	bls	.L841
	cmp	w19, 9
	beq	.L842
	mov	w1, 11
	mov	x0, x21
	add	x20, x20, 208
	bl	BsShow
	and	w0, w0, 127
	sub	w1, w0, #24
	ldr	x2, .LC179
	lsl	x1, x1, 3
	mov	x0, x21
	add	x3, x20, x1
	ldr	w19, [x20, x1]
	ldr	w1, [x3, 4]
	bl	MP2_u_v
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L841:
	ldr	x2, .LC179
	mov	x0, x21
	bl	MP2_u_v
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L842:
	ldr	x2, .LC179
	mov	x0, x21
	bl	MP2_u_v
	ldr	x21, [sp, 32]
	sub	w0, w19, w0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	MP2_MbAddrInc, .-MP2_MbAddrInc
	.align	3
.LC177:
	.xword	.LANCHOR1
	.align	3
.LC179:
	.xword	.LC178
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_InitMb
	.type	MP2_InitMb, %function
MP2_InitMb:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	mov	w20, 0
	bl	_mcount
	ldr	x21, .LC185
	ldr	x19, [x22, 56]
	b	.L844
	.p2align 3
.L848:
	cmp	w0, 15
	beq	.L845
	cmp	w0, 8
	add	w20, w20, 33
	bne	.L857
.L845:
	mov	w1, 11
	mov	x2, x21
	mov	x0, x19
	bl	MP2_u_v
	mov	x0, x19
	bl	BsPos
	ldr	w1, [x19, 24]
	cmp	w0, w1, lsl 3
	bge	.L858
.L844:
	mov	w1, 11
	mov	x0, x19
	bl	BsShow
	cmp	w0, 23
	bls	.L848
	mov	x0, x19
	bl	MP2_MbAddrInc
	ldr	w1, [x22, 16]
	cbz	w1, .L849
	ldr	w2, [x22, 28]
	add	w0, w20, w0
	cbnz	w2, .L859
	sub	w2, w0, #1
.L851:
	ldr	w3, [x22, 12]
	mov	w0, 1
	str	w2, [x22, 40]
	sub	w3, w3, #1
	cmp	w2, w3
	bls	.L847
	ldr	x1, .LC189
	bl	dprint_vfmw
	mov	w0, 0
	b	.L847
	.p2align 3
.L858:
	ldr	x1, .LC187
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
.L847:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L857:
	ldr	x1, .LC183
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L859:
	add	w2, w0, w2
	b	.L851
.L849:
	ldr	x1, .LC191
	mov	w2, 0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MP2_InitMb, .-MP2_InitMb
	.align	3
.LC183:
	.xword	.LC182
	.align	3
.LC185:
	.xword	.LC184
	.align	3
.LC187:
	.xword	.LC186
	.align	3
.LC189:
	.xword	.LC188
	.align	3
.LC191:
	.xword	.LC190
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_GetFirstMbInSlice
	.type	MP2_GetFirstMbInSlice, %function
MP2_GetFirstMbInSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	MP2_DecSliceHeader
	mov	x0, x19
	bl	MP2_InitMb
	str	wzr, [x19, 16]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_GetFirstMbInSlice, .-MP2_GetFirstMbInSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_DecSlice
	.type	MP2_DecSlice, %function
MP2_DecSlice:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	w23, w1
	add	x20, x21, 86016
	bl	_mcount
	add	x19, x20, 1576
	mov	x0, 20744
	movk	x0, 0x1, lsl 16
	ldr	x3, [x20, 2768]
	add	x0, x21, x0
	ldr	x1, [x0, 1072]
	str	x1, [x19, 48]
	ldr	w1, [x0, 1052]
	str	w1, [x19, 36]
	ldr	w0, [x0, 1156]
	cmp	w0, 1
	cset	w0, eq
	str	w0, [x20, 1576]
	ldr	w0, [x3, 68]
	str	w0, [x19, 4]
	ldr	w0, [x3, 64]
	str	w0, [x19, 8]
	ldp	w2, w0, [x3, 56]
	add	w2, w2, 15
	add	w0, w0, 15
	lsr	w2, w2, 4
	lsr	w0, w0, 4
	mul	w0, w2, w0
	str	w0, [x19, 12]
	ldrb	w1, [x3, 17]
	cmp	w1, 3
	beq	.L862
	lsr	w0, w0, 1
	str	w0, [x19, 12]
.L862:
	add	x1, x20, 1640
	mov	x0, x19
	str	x1, [x20, 1632]
	and	w23, w23, 255
	str	w23, [x20, 1596]
	bl	MP2_DecSliceHeader
	mov	x0, x19
	bl	MP2_InitMb
	str	wzr, [x20, 1592]
	cmp	w0, 1
	mov	w19, w0
	beq	.L863
	ldr	x1, .LC193
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC194
	ldr	x4, [x0]
	cbz	x4, .L876
.L877:
	ldr	w0, [x20, 3392]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
.L876:
	mov	w0, 0
.L865:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L863:
	mov	x0, x21
	bl	MP2_WriteSliceInfo
	cmp	w0, 1
	beq	.L865
	ldr	x1, .LC196
	mov	w0, w19
	bl	dprint_vfmw
	ldr	x0, .LC194
	ldr	x4, [x0]
	cbnz	x4, .L877
	b	.L876
	.size	MP2_DecSlice, .-MP2_DecSlice
	.align	3
.LC193:
	.xword	.LC192
	.align	3
.LC194:
	.xword	g_event_report
	.align	3
.LC196:
	.xword	.LC195
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
	stp	x27, x28, [sp, 80]
	mov	x27, x0
	mov	x0, x30
	add	x20, x27, 86016
	add	x23, x27, 45056
	bl	_mcount
	add	x21, x20, 1640
	mov	w1, 32
	mov	x0, x21
	strb	wzr, [x20, 3408]
	add	x22, x23, 264
	add	x22, x22, 40960
	ldr	x24, [x20, 2768]
	ldr	x25, [x20, 2776]
	bl	BsShow
	mov	w19, w0
	mov	x0, x21
	ldr	w26, [x22, 1100]
	bl	BsPos
	str	w0, [x22, 1180]
	mov	w1, 32
	mov	x0, x21
	bl	BsSkip
	cmp	w19, 439
	beq	.L950
	mov	w0, 440
	cmp	w19, 435
	ccmp	w19, w0, 4, ne
	bne	.L885
.L881:
	add	x0, x23, 264
	add	x0, x0, 40960
	ldr	w1, [x0, 1176]
	cmp	w1, 1
	beq	.L951
.L882:
	cmp	w19, 435
	beq	.L887
.L954:
	ble	.L952
	cmp	w19, 437
	beq	.L891
	blt	.L908
	cmp	w19, 439
	beq	.L908
	cmp	w19, 440
	bne	.L886
	add	x19, x23, 264
	mov	x0, x21
	add	x19, x19, 40960
	ldr	w1, [x19, 1032]
	ldr	w22, [x19, 1172]
	add	w22, w22, w1
	bl	BsPos
	ldr	x1, .LC204
	add	w2, w22, w0, lsr 3
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x27
	bl	group_of_pictures_header
	mov	x0, x21
	bl	BsResidBits
	tbnz	w0, #31, .L953
.L908:
	mov	w21, 0
.L884:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L885:
	mov	w0, 439
	cmp	w19, 256
	ccmp	w19, w0, 4, ne
	beq	.L881
	cmp	w19, 435
	bne	.L954
.L887:
	add	x19, x23, 264
	add	x19, x19, 40960
	ldr	w0, [x19, 1032]
	ldr	w22, [x19, 1172]
	add	w22, w22, w0
	mov	x0, x21
	bl	BsPos
	add	w2, w22, w0, lsr 3
	ldr	x1, .LC199
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x27
	bl	sequence_header
	mov	x0, x21
	bl	BsResidBits
	tbnz	w0, #31, .L955
	ldr	w0, [x19, 1100]
	and	w0, w0, 7
	cbnz	w0, .L896
	mov	w0, 1
	mov	x2, 200
	strb	w0, [x24]
	mov	x1, x24
	mov	x0, x25
	mov	w21, 0
	bl	memcpy
	ldr	w0, [x19, 1104]
	add	w0, w0, 1
	str	w0, [x19, 1104]
	b	.L884
	.p2align 3
.L952:
	cmp	w19, 256
	beq	.L889
	blt	.L886
	cmp	w19, 433
	blt	.L886
	add	x23, x23, 264
	mov	x0, x21
	add	x23, x23, 40960
	ldr	w1, [x23, 1032]
	ldr	w19, [x23, 1172]
	add	w19, w19, w1
	bl	BsPos
	ldr	x1, .LC212
	add	w2, w19, w0, lsr 3
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x27
	bl	MP2_GetUsrData
	mov	w21, w0
	cbnz	w0, .L902
	ldr	w0, [x20, 3392]
	add	x1, x23, 1040
	bl	MP2_ClearCurPacket
	ldr	x0, .LC200
	ldr	x4, [x0]
	cbz	x4, .L909
	ldr	w0, [x20, 3392]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	mov	w21, -1
	blr	x4
	b	.L884
	.p2align 3
.L889:
	add	x19, x23, 264
	mov	x0, x21
	add	x19, x19, 40960
	ldr	w1, [x19, 1032]
	ldr	w22, [x19, 1172]
	add	w22, w22, w1
	bl	BsPos
	ldr	x1, .LC208
	add	w2, w22, w0, lsr 3
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x27
	bl	picture_header
	mov	x0, x21
	bl	BsResidBits
	tbz	w0, #31, .L908
	ldr	x0, .LC200
	str	w26, [x19, 1100]
	ldr	x4, [x0]
	cbz	x4, .L901
	ldr	w0, [x20, 3392]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L901:
	ldr	w0, [x20, 3392]
	mov	x1, 42264
	add	x1, x23, x1
	mov	w21, -1
	bl	MP2_ClearCurPacket
	ldr	x1, .LC210
	mov	w2, 256
	mov	w0, 1
	bl	dprint_vfmw
	b	.L884
	.p2align 3
.L951:
	ldr	w2, [x0, 1100]
	tbz	x2, 22, .L882
	strb	w1, [x20, 3408]
	orr	w2, w2, 8388608
	str	wzr, [x0, 1176]
	mov	w21, w1
	str	w2, [x0, 1100]
	mov	x0, x27
	bl	MP2_ProtocolPPSCheck
	b	.L884
	.p2align 3
.L950:
	ldr	x0, .LC197
	mov	x2, 40
	mov	x1, x21
	ldr	x3, [x0, 104]
	add	x0, x29, 104
	blr	x3
	mov	w1, 32
	add	x0, x29, 104
	bl	BsGet
	mov	w28, w0
	mov	w1, 32
	add	x0, x29, 104
	bl	BsGet
	mov	w1, 20553
	movk	w1, 0x4853, lsl 16
	cmp	w28, w1
	mov	w1, 20036
	movk	w1, 0x4345, lsl 16
	ccmp	w0, w1, 0, eq
	bne	.L881
	ldr	w21, [x22, 1176]
	cmp	w21, 1
	beq	.L956
.L883:
	mov	w0, 1
	mov	w21, 0
	strb	w0, [x20, 3410]
	b	.L884
	.p2align 3
.L886:
	sub	w0, w19, #257
	cmp	w0, 174
	bhi	.L904
	add	x22, x23, 264
	add	x22, x22, 40960
	ldr	w0, [x22, 1096]
	cbz	w0, .L905
.L907:
	add	x23, x23, 264
	mov	w1, 589824
	add	x23, x23, 40960
	ldr	w0, [x23, 1100]
	tst	w0, w1
	beq	.L908
	orr	w0, w0, 4194304
	mov	w20, 1
	str	w0, [x23, 1100]
	mov	w1, w19
	str	w20, [x23, 1176]
	mov	x0, x27
	bl	MP2_DecSlice
	cmp	w0, w20
	mov	w21, w0
	beq	.L884
	ldr	x1, .LC218
	mov	w2, w19
	mov	w0, w20
	mov	w21, 0
	bl	dprint_vfmw
	b	.L884
	.p2align 3
.L891:
	add	x19, x23, 264
	mov	x0, x21
	add	x19, x19, 40960
	ldr	w1, [x19, 1032]
	ldr	w22, [x19, 1172]
	add	w22, w22, w1
	bl	BsPos
	ldr	x1, .LC216
	add	w2, w22, w0, lsr 3
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x27
	bl	extension
	mov	x0, x21
	bl	BsResidBits
	tbz	w0, #31, .L908
	ldr	x0, .LC200
	str	w26, [x19, 1100]
	ldr	x4, [x0]
	cbz	x4, .L903
	ldr	w0, [x20, 3392]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L903:
	mov	x1, 42264
	ldr	w0, [x20, 3392]
	add	x1, x23, x1
	mov	w21, -1
	bl	MP2_ClearCurPacket
	b	.L884
	.p2align 3
.L896:
	ldrb	w0, [x25]
	cmp	w0, 1
	beq	.L957
.L904:
	ldr	x0, .LC200
	ldr	x4, [x0]
	cbz	x4, .L908
.L946:
	ldr	w0, [x20, 3392]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	mov	w21, 0
	blr	x4
	b	.L884
	.p2align 3
.L902:
	ldr	x1, .LC214
	mov	w0, 1
	bl	dprint_vfmw
	b	.L884
	.p2align 3
.L956:
	ldr	w0, [x22, 1100]
	tbz	x0, 22, .L883
	strb	w21, [x20, 3410]
	orr	w0, w0, 8388608
	strb	w21, [x20, 3408]
	str	w0, [x22, 1100]
	mov	x0, x27
	str	wzr, [x22, 1176]
	bl	MP2_ProtocolPPSCheck
	b	.L884
	.p2align 3
.L909:
	mov	w21, -1
	b	.L884
	.p2align 3
.L905:
	mov	x0, x27
	mov	w21, 0
	bl	MP2_GetSequenceInfo
	ldr	w0, [x22, 1168]
	cbz	w0, .L884
	ldrb	w0, [x20, 3409]
	cmp	w0, 1
	beq	.L884
	ldr	w0, [x22, 1096]
	cbnz	w0, .L907
	b	.L884
	.p2align 3
.L957:
	mov	x1, x25
	mov	x2, 200
	mov	x0, x24
	bl	memcpy
	ldr	x1, .LC200
	ldr	w0, [x19, 1100]
	ldr	x4, [x1]
	and	w0, w0, -8
	str	w0, [x19, 1100]
	cbnz	x4, .L946
	b	.L908
.L953:
	ldr	x0, .LC200
	str	w26, [x19, 1100]
	ldr	x4, [x0]
	cbz	x4, .L900
	ldr	w0, [x20, 3392]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L900:
	ldr	w0, [x20, 3392]
	mov	x1, 42264
	add	x1, x23, x1
	mov	w21, -1
	bl	MP2_ClearCurPacket
	ldr	x1, .LC206
	mov	w2, 440
	mov	w0, 1
	bl	dprint_vfmw
	b	.L884
.L955:
	ldr	x0, .LC200
	str	w26, [x19, 1100]
	ldr	x4, [x0]
	cbz	x4, .L895
	ldr	w0, [x20, 3392]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L895:
	ldr	w0, [x20, 3392]
	mov	x1, 42264
	add	x1, x23, x1
	mov	w21, -1
	bl	MP2_ClearCurPacket
	ldr	x1, .LC202
	mov	w2, 435
	mov	w0, 1
	bl	dprint_vfmw
	b	.L884
	.size	MP2_GetHDR, .-MP2_GetHDR
	.align	3
.LC197:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC199:
	.xword	.LC198
	.align	3
.LC200:
	.xword	g_event_report
	.align	3
.LC202:
	.xword	.LC201
	.align	3
.LC204:
	.xword	.LC203
	.align	3
.LC206:
	.xword	.LC205
	.align	3
.LC208:
	.xword	.LC207
	.align	3
.LC210:
	.xword	.LC209
	.align	3
.LC212:
	.xword	.LC211
	.align	3
.LC214:
	.xword	.LC213
	.align	3
.LC216:
	.xword	.LC215
	.align	3
.LC218:
	.xword	.LC217
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
	mov	x21, x1
	bl	_mcount
	cbz	x19, .L992
	cbz	x21, .L993
	ldr	x3, .LC223
	add	x20, x19, 86016
	add	x22, x20, 2192
	mov	x1, x21
	mov	x2, 176
	mov	x0, x22
	ldr	x3, [x3, 104]
	add	x23, x19, 45056
	add	x21, x23, 264
	blr	x3
	ldr	w2, [x20, 3392]
	mov	x1, x22
	mov	x0, x21
	bl	MP2_ReceivePacket
	cmp	w0, 1
	beq	.L962
	ldr	x1, .LC225
	mov	w0, 1
	mov	w21, 0
	bl	dprint_vfmw
.L960:
	mov	w0, w21
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L962:
	add	x21, x21, 40960
	add	x0, x20, 1640
	ldr	x1, [x21, 1072]
	ldr	w2, [x21, 1052]
	bl	BsInit
	ldr	x0, [x19]
	ldr	w1, [x0, 936]
	cmp	w1, 1
	beq	.L994
.L963:
	ldr	w0, [x20, 1364]
	str	w0, [x20, 1568]
.L964:
	mov	x0, x19
	bl	MP2_GetHDR
	add	w0, w0, 1
	cmp	w0, 1
	bls	.L995
	mov	x0, x19
	bl	MP2_DecodingDecide
	cbz	w0, .L996
	cmn	w0, #1
	beq	.L967
	mov	x0, x19
	bl	MP2_GetPictureInfo
	cbnz	w0, .L970
	ldr	w0, [x20, 3392]
	mov	x1, 42264
	add	x1, x23, x1
	bl	MP2_ClearCurPacket
	mov	x0, x19
	bl	MP2_ClearCurPic
	ldr	x0, .LC226
	ldr	x4, [x0]
	cbz	x4, .L971
	ldr	w0, [x20, 3392]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L971:
	ldr	x1, .LC230
	mov	w0, 1
	mov	w21, 0
	bl	dprint_vfmw
	b	.L960
	.p2align 3
.L995:
	ldr	x0, [x19]
	ldr	w1, [x0, 936]
	cmp	w1, 1
	beq	.L997
.L966:
	ldrb	w0, [x20, 3409]
	cmp	w0, 1
	beq	.L967
	mov	x1, 42264
	ldr	w0, [x20, 3392]
	add	x1, x23, x1
	mov	w21, 0
	bl	MP2_ClearCurPacket
	b	.L960
	.p2align 3
.L997:
	ldr	w0, [x0, 992]
	cbz	w0, .L966
.L967:
	mov	w21, 0
	ldr	x23, [sp, 48]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L994:
	ldr	w0, [x0, 992]
	cmp	w0, 1
	bne	.L963
	ldr	w0, [x20, 1568]
	str	w0, [x20, 1364]
	b	.L964
	.p2align 3
.L996:
	ldr	w0, [x20, 3392]
	mov	x1, 42264
	add	x1, x23, x1
	bl	MP2_ClearCurPacket
	mov	x0, x19
	bl	MP2_ClearCurPic
	ldr	x0, .LC226
	ldr	x4, [x0]
	cbz	x4, .L969
	ldr	w0, [x20, 3392]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L969:
	ldr	x1, .LC228
	mov	w0, 22
	mov	w21, 0
	bl	dprint_vfmw
	b	.L960
	.p2align 3
.L970:
	mov	x0, x19
	bl	MP2_DecNewPic
	mov	w21, w0
	cbz	w0, .L998
	add	x0, x23, 264
	add	x0, x0, 40960
	ldr	w2, [x0, 1172]
	ldr	w21, [x0, 1032]
	ldr	w1, [x0, 1052]
	lsl	w21, w21, 3
	add	w1, w2, w1
	str	w1, [x0, 1172]
	b	.L960
	.p2align 3
.L998:
	add	x22, x23, 264
	ldr	w0, [x20, 3392]
	add	x22, x22, 40960
	mov	w2, 1
	ldr	w1, [x22, 1204]
	bl	FSP_ClearLogicFs
	ldr	w0, [x20, 3392]
	add	x1, x22, 1040
	bl	MP2_ClearCurPacket
	mov	x0, x19
	bl	MP2_ClearCurPic
	ldr	x0, .LC226
	ldr	x4, [x0]
	cbz	x4, .L973
	ldr	w0, [x20, 3392]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L973:
	ldr	x1, .LC232
	mov	w0, 1
	bl	dprint_vfmw
	b	.L960
.L993:
	ldr	x3, .LC222
	mov	w2, 3003
	ldr	x1, .LC220
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L960
.L992:
	ldr	x3, .LC219
	mov	w2, 3002
	ldr	x1, .LC220
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L960
	.size	MPEG2DEC_Decode, .-MPEG2DEC_Decode
	.align	3
.LC219:
	.xword	.LC116
	.align	3
.LC220:
	.xword	.LC118
	.align	3
.LC222:
	.xword	.LC221
	.align	3
.LC223:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC225:
	.xword	.LC224
	.align	3
.LC226:
	.xword	g_event_report
	.align	3
.LC228:
	.xword	.LC227
	.align	3
.LC230:
	.xword	.LC229
	.align	3
.LC232:
	.xword	.LC231
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
	cbz	x19, .L1003
	add	x19, x19, 86016
	mov	w0, 2
	ldrb	w1, [x19, 3408]
	cmp	w1, 1
	csel	w0, wzr, w0, ne
.L1001:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1003:
	ldr	x3, .LC233
	mov	w2, 3854
	ldr	x1, .LC234
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1001
	.size	MP2_GetPacketState, .-MP2_GetPacketState
	.align	3
.LC233:
	.xword	.LC116
	.align	3
.LC234:
	.xword	.LC118
	.global	g_tmpusd
	.global	zigzag
	.global	default_intra_quantizer_matrix
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__FUNCTION__.11154, %object
	.size	__FUNCTION__.11154, 19
__FUNCTION__.11154:
	.string	"MP2_DecodingDecide"
	.zero	5
.LC0:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	10
	.word	12
	.word	14
	.word	16
	.word	18
	.word	20
	.word	22
	.word	24
	.word	28
	.word	32
	.word	36
	.word	40
	.word	44
	.word	48
	.word	52
	.word	56
	.word	64
	.word	72
	.word	80
	.word	88
	.word	96
	.word	104
	.word	112
	.align	3
.LANCHOR1 = . + 0
	.type	CSWTCH.49, %object
	.size	CSWTCH.49, 12
CSWTCH.49:
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
	.type	tab_for_first_4bit, %object
	.size	tab_for_first_4bit, 128
tab_for_first_4bit:
	.word	8
	.word	4
	.word	9
	.word	5
	.word	5
	.word	4
	.word	4
	.word	4
	.word	3
	.word	3
	.word	3
	.word	3
	.word	2
	.word	3
	.word	2
	.word	3
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.type	tab_for_last_7bit, %object
	.size	tab_for_last_7bit, 832
tab_for_last_7bit:
	.word	33
	.word	11
	.word	32
	.word	11
	.word	31
	.word	11
	.word	30
	.word	11
	.word	29
	.word	11
	.word	28
	.word	11
	.word	27
	.word	11
	.word	26
	.word	11
	.word	25
	.word	11
	.word	24
	.word	11
	.word	23
	.word	11
	.word	22
	.word	11
	.word	21
	.word	10
	.word	21
	.word	10
	.word	20
	.word	10
	.word	20
	.word	10
	.word	19
	.word	10
	.word	19
	.word	10
	.word	18
	.word	10
	.word	18
	.word	10
	.word	17
	.word	10
	.word	17
	.word	10
	.word	16
	.word	10
	.word	16
	.word	10
	.word	15
	.word	8
	.word	15
	.word	8
	.word	15
	.word	8
	.word	15
	.word	8
	.word	15
	.word	8
	.word	15
	.word	8
	.word	15
	.word	8
	.word	15
	.word	8
	.word	14
	.word	8
	.word	14
	.word	8
	.word	14
	.word	8
	.word	14
	.word	8
	.word	14
	.word	8
	.word	14
	.word	8
	.word	14
	.word	8
	.word	14
	.word	8
	.word	13
	.word	8
	.word	13
	.word	8
	.word	13
	.word	8
	.word	13
	.word	8
	.word	13
	.word	8
	.word	13
	.word	8
	.word	13
	.word	8
	.word	13
	.word	8
	.word	12
	.word	8
	.word	12
	.word	8
	.word	12
	.word	8
	.word	12
	.word	8
	.word	12
	.word	8
	.word	12
	.word	8
	.word	12
	.word	8
	.word	12
	.word	8
	.word	11
	.word	8
	.word	11
	.word	8
	.word	11
	.word	8
	.word	11
	.word	8
	.word	11
	.word	8
	.word	11
	.word	8
	.word	11
	.word	8
	.word	11
	.word	8
	.word	10
	.word	8
	.word	10
	.word	8
	.word	10
	.word	8
	.word	10
	.word	8
	.word	10
	.word	8
	.word	10
	.word	8
	.word	10
	.word	8
	.word	10
	.word	8
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
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
.LC1:
	ASCII(.string	"image size abnormal(%dx%d)\n" )
	.zero	4
.LC3:
	ASCII(.string	"mp2 actual frame size(%dx%d) exeed max config(%dx%d)\n" )
	.zero	2
.LC6:
	ASCII(.string	"user set decode channel max resolution is (w=%d,h=%d), this stream (w=%d,h=%d) can NOT be decoded!\n" )
	.zero	4
.LC9:
	ASCII(.string	"partition fs memory fail!\n" )
	.zero	5
.LC11:
	ASCII(.string	"FSP_ConfigInstance fail!\n" )
	.zero	6
.LC14:
	ASCII(.string	"ERROR: frm %d, integrality: %#x\n" )
	.zero	7
.LC16:
	ASCII(.string	"ERROR: frm %d, No Img buffer is allocated\n" )
	.zero	5
.LC18:
	ASCII(.string	"----------------- mp2 Imode -> %d ------------------\n" )
	.zero	2
.LC21:
	ASCII(.string	"frm %d pic type %d struct is %d total pos %#x\n" )
	.zero	1
.LC23:
	ASCII(.string	"NOTE: Drop non-I, cur is B\n" )
	.zero	4
.LC25:
	ASCII(.string	"NOTE: Drop non-I, cur is P\n" )
	.zero	4
.LC27:
	ASCII(.string	"NOTE: Drop non-I\n" )
	.zero	6
.LC29:
	ASCII(.string	"NOTE: Drop B\n" )
	.zero	2
.LC32:
	ASCII(.string	"%s %d pFwdImg = NULL,  pBwdImg = NULL!!\n" )
	.zero	7
.LC34:
	ASCII(.string	"fuction return value is null,%s %d !!\n" )
	.zero	1
.LC36:
	ASCII(.string	"dec P frame, fwd ref err(%d) > ref_thr(%d)\n" )
	.zero	4
.LC38:
	ASCII(.string	"dec B frame, bwd ref err(%d) > ref_thr(%d)\n" )
	.zero	4
.LC40:
	ASCII(.string	"dec B frame, fwd ref err(%d) > ref_thr(%d)\n" )
	.zero	4
.LC43:
	ASCII(.string	"Protocol %d\n" )
	.zero	3
.LC45:
	ASCII(.string	"seq size change, call vpss to release all frames.\n" )
	.zero	5
.LC47:
	ASCII(.string	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d,new w/h = %d/%d\n" )
	.zero	3
.LC50:
	ASCII(.string	"new seq size %dx%d\n" )
	.zero	4
.LC54:
	ASCII(.string	"get frame store fail!\n" )
	.zero	1
.LC56:
	ASCII(.string	"line: %d, pImage is NULL!\n" )
	.zero	5
.LC58:
	ASCII(.string	"get image buffer ok: LogicFsID = %d\n" )
	.zero	3
.LC60:
	ASCII(.string	"decode %p, disp %p, tf %p\n" )
	.zero	5
.LC65:
	ASCII(.string	"ERROR: frm %d, lost one field\n" )
	.zero	1
.LC67:
	ASCII(.string	"ERROR: frm %d, lost one field flg = %d, last_struct = %d\n" )
	.zero	6
.LC69:
	ASCII(.string	"Fatal Error: frm%d, get image buffer failed\n" )
	.zero	3
.LC71:
	ASCII(.string	"dec_pts: %lld Usertag: %lld\n" )
	.zero	3
.LC73:
	ASCII(.string	"---------- unref %d\n" )
	.zero	3
.LC75:
	ASCII(.string	"++++++++++ ref %d\n" )
	.zero	5
.LC77:
	ASCII(.string	"line: %d(pCur, pFwd, pBwd)(%p, %p, %p)\n" )
.LC79:
	ASCII(.string	"CurFsID(fwd%d,%d,bwd%d) abnormal!(%p,%p,%p)\n" )
	.zero	3
.LC81:
	ASCII(.string	"dec addr: cur,cur2d,fwd,bwd,pmv = %p,%p,%p,%p,%p\n" )
	.zero	6
.LC87:
	ASCII(.string	"\nmpeg2 copy last 3 bytes of the first packet!\n\n" )
.LC91:
	ASCII(.string	"pMp2CodecInfo->pUsrDatArray[%d] is null\n" )
	.zero	7
.LC103:
	ASCII(.string	"ERROR: unsupported profile %d\n" )
	.zero	1
.LC105:
	ASCII(.string	"ERROR: unsupported level %d\n" )
	.zero	3
.LC111:
	ASCII(.string	"pCtx or pstExtraData is NULL! \n" )
.LC114:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC116:
	ASCII(.string	"pCtx is NULL!" )
	.zero	2
.LC118:
	ASCII(.string	"mpeg2.c,L%d: %s\n" )
	.zero	7
.LC120:
	ASCII(.string	"Decoding quits at frm %d\n" )
	.zero	6
.LC122:
	ASCII(.string	"img_id out of range" )
	.zero	4
.LC129:
	ASCII(.string	"pMp2Packet is NULL!" )
	.zero	4
.LC133:
	ASCII(.string	"ERROR: frm %d, Invalid packet pointer!\n" )
.LC135:
	ASCII(.string	"line %d, pPacket->StreamPack[1].IsLastSeg = %d\n" )
.LC141:
	ASCII(.string	"ErrRatio = %d\n" )
	.zero	1
.LC144:
	ASCII(.string	"pImg is null, pCurImg %#x pBwdImg %#x pFwdImg %#x\n" )
	.zero	5
.LC146:
	ASCII(.string	"DEBUG: DEC over\n" )
	.zero	7
.LC149:
	ASCII(.string	"insert buf %d ref %d\n" )
	.zero	2
.LC151:
	ASCII(.string	"ERROR,pBwdImg == NULL || pToQueImg == NULL\n" )
	.zero	4
.LC153:
	ASCII(.string	"exg_pts: %lld <-> %lld\n" )
.LC155:
	ASCII(.string	"err(%d) > out_thr(%d)\n" )
	.zero	1
.LC157:
	ASCII(.string	"%-40s%20d\n" )
	.zero	5
.LC159:
	ASCII(.string	"slice_vertical_position" )
.LC161:
	ASCII(.string	"quantiser_scale_code" )
	.zero	3
.LC163:
	ASCII(.string	"extra_bit_slice" )
.LC165:
	ASCII(.string	"intra_slice_flag" )
	.zero	7
.LC167:
	ASCII(.string	"intra_slice" )
	.zero	4
.LC169:
	ASCII(.string	"reserved_bits" )
	.zero	2
.LC171:
	ASCII(.string	"extra_infrmation_slice" )
	.zero	1
.LC173:
	ASCII(.string	"Slice num = %d >= %d\n" )
	.zero	2
.LC175:
	ASCII(.string	"seg info is wrong! IsLastSeg[0] = %d, IsLastSeg[1] = %d\n" )
	.zero	7
.LC178:
	ASCII(.string	"macroblock_address_increment" )
	.zero	3
.LC182:
	ASCII(.string	"macroblock_escape ERROR\n" )
	.zero	7
.LC184:
	ASCII(.string	"macroblock_escape" )
	.zero	6
.LC186:
	ASCII(.string	"macroblock_escape ERROR, overflow\n" )
	.zero	5
.LC188:
	ASCII(.string	"SlcStartMbNum = %d > PicEndMum = %d\n" )
	.zero	3
.LC190:
	ASCII(.string	"FirstMbInSliceFlag = %d\n" )
	.zero	7
.LC192:
	ASCII(.string	"MP2_GetFirstMbInSlice Failed!\n" )
	.zero	1
.LC195:
	ASCII(.string	"MP2_WriteSliceInfo Failed!\n" )
	.zero	4
.LC198:
	ASCII(.string	"found sh %#x\n" )
	.zero	2
.LC201:
	ASCII(.string	"SEQUENCE_HEADER_CODE Bitstream is not enough!\n" )
	.zero	1
.LC203:
	ASCII(.string	"found gh %#x\n" )
	.zero	2
.LC205:
	ASCII(.string	"GROUP_START_CODE Bitstream is not enough!\n" )
	.zero	5
.LC207:
	ASCII(.string	"found ph %#x\n" )
	.zero	2
.LC209:
	ASCII(.string	"PICTURE_START_CODE Bitstream is not enough!\n" )
	.zero	3
.LC211:
	ASCII(.string	"found ud %#x\n" )
	.zero	2
.LC213:
	ASCII(.string	"cann't get ud pointer\n" )
	.zero	1
.LC215:
	ASCII(.string	"found ext %#x\n" )
	.zero	1
.LC217:
	ASCII(.string	"MP2_DecSlice is wrong!\n" )
.LC221:
	ASCII(.string	"pPacket is NULL!" )
	.zero	7
.LC224:
	ASCII(.string	"line %d, MP2_ReceivePacket receive packet failed!\n" )
	.zero	5
.LC227:
	ASCII(.string	"MP2 Decode Decide is wrong!\n" )
	.zero	3
.LC229:
	ASCII(.string	"MP2 get picture info is wrong!\n" )
.LC231:
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
