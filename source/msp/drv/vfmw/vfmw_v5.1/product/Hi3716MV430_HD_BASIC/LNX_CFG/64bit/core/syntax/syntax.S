#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"syntax.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	InitVoQueue
	.type	InitVoQueue, %function
InitVoQueue:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC1
	mov	w1, 30
	mov	w0, 10
	bl	dprint_normal
	strh	wzr, [x19, 2]
	mov	w1, 64
	strh	w1, [x19]
	add	x1, x19, 512
	strh	wzr, [x19, 4]
	strh	wzr, [x19, 6]
	mov	w0, -1
	strh	wzr, [x19, 8]
	stp	w0, w0, [x1, 16]
	stp	w0, w0, [x1, 24]
	str	w0, [x19, 544]
	str	w0, [x19, 548]
	mov	w0, 1
	str	wzr, [x19, 572]
	str	wzr, [x19, 600]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	InitVoQueue, .-InitVoQueue
	.align	3
.LC1:
	.xword	.LC0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ResetVoQueue
	.type	ResetVoQueue, %function
ResetVoQueue:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC2
	mov	w0, 2
	ldr	x1, [x20, 24]
	blr	x1
	ldrh	w3, [x19, 6]
	ldrh	w4, [x19, 8]
	cmp	w3, w4
	beq	.L3
	ldr	x2, .LC4
	mov	w1, 62
	mov	w0, 1
	bl	dprint_normal
.L3:
	add	x4, x19, 512
	strh	wzr, [x19, 2]
	strh	wzr, [x19, 4]
	mov	w0, 64
	strh	wzr, [x19, 6]
	mov	x3, -1
	strh	w0, [x19]
	mov	w0, -1
	strh	wzr, [x19, 8]
	ldr	w1, [x19, 600]
	ldr	x2, [x20, 32]
	stp	w0, w0, [x4, 16]
	stp	w0, w0, [x4, 24]
	add	w1, w1, 100
	str	w0, [x19, 544]
	str	w0, [x19, 548]
	mov	w0, 2
	str	x3, [x19, 584]
	str	w1, [x19, 600]
	str	wzr, [x19, 572]
	str	wzr, [x19, 580]
	str	xzr, [x19, 592]
	blr	x2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ResetVoQueue, .-ResetVoQueue
	.align	3
.LC2:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC4:
	.xword	.LC3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReturnImageToSyntax
	.type	ReturnImageToSyntax, %function
ReturnImageToSyntax:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	mov	x21, x2
	bl	_mcount
	cmp	w19, 16
	bhi	.L5
	ldr	x0, .LC5
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx8
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx8:
	.section	.rodata
	.align	0
	.align	2
.L8:
	.byte	(.L7 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L9 - .Lrtx8) / 4
	.byte	(.L10 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L11 - .Lrtx8) / 4
	.text
	.p2align 3
.L9:
	ldr	w1, [x21, 88]
	mov	x0, x20
	bl	MPEG4DEC_RecycleImage
.L5:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L11:
	ldr	w1, [x21, 88]
	mov	x0, x20
	bl	HEVC_DECRecycleImage
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L10:
	ldr	w1, [x21, 88]
	mov	x0, x20
	bl	MPEG2DEC_RecycleImage
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L7:
	ldr	w1, [x21, 88]
	mov	x0, x20
	bl	H264DEC_RecycleImage
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	ReturnImageToSyntax, .-ReturnImageToSyntax
	.align	3
.LC5:
	.xword	.L8
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProduceTimeStamp
	.type	ProduceTimeStamp, %function
ProduceTimeStamp:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	mov	w19, w2
	bl	_mcount
	cmp	w19, 20
	ldr	x0, [x20, 208]
	beq	.L13
	ldr	x2, [x21, 584]
	sub	w19, w19, #8
	sub	x1, x0, x2
	cmp	x1, 5
	ccmn	x2, #1, 4, ls
	beq	.L23
	cmp	w19, 1
	mov	x0, -1
	bls	.L15
.L13:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L23:
	cmp	w19, 1
	bhi	.L13
	ldrb	w1, [x20, 156]
	and	w1, w1, 3
	cmp	w1, 2
	bne	.L13
.L15:
	mov	x0, -1
	str	x0, [x20, 200]
	b	.L13
	.size	ProduceTimeStamp, .-ProduceTimeStamp
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InsertImgToVoQueue_PtsProcess
	.type	InsertImgToVoQueue_PtsProcess, %function
InsertImgToVoQueue_PtsProcess:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	x19, x3
	mov	w20, w1
	mov	x22, x2
	bl	_mcount
	ldr	x0, .LC6
	ldrb	w1, [x19, 158]
	ldr	x5, [x19, 208]
	ldr	x0, [x0, w21, sxtw 3]
	add	x0, x0, 217088
	ldr	w0, [x0, 3156]
	str	x5, [x19, 200]
	cmp	w0, 1
	cset	w0, eq
	cmp	w20, 20
	bfi	w1, w0, 2, 1
	strb	w1, [x19, 158]
	beq	.L28
	ldr	x0, [x22, 584]
	sub	w20, w20, #8
	sub	x1, x5, x0
	cmp	x1, 5
	ccmn	x0, #1, 4, ls
	beq	.L34
	cmp	w20, 1
	bls	.L27
	mov	x4, x5
	mov	x5, -1
.L25:
	ldr	x6, [x19, 216]
	mov	w3, w21
	ldr	x2, .LC8
	mov	w1, 236
	str	x5, [x19, 208]
	mov	w0, 24
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L34:
	cmp	w20, 1
	mov	x4, x5
	bhi	.L25
	ldrb	w0, [x19, 156]
	and	w0, w0, 3
	cmp	w0, 2
	bne	.L25
.L27:
	mov	x4, -1
	str	x4, [x19, 200]
	mov	x5, x4
	b	.L25
	.p2align 3
.L28:
	mov	x4, x5
	b	.L25
	.size	InsertImgToVoQueue_PtsProcess, .-InsertImgToVoQueue_PtsProcess
	.align	3
.LC6:
	.xword	s_pstVfmwChan
	.align	3
.LC8:
	.xword	.LC7
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InsertImgToVoQueue_FillImageInfo
	.type	InsertImgToVoQueue_FillImageInfo, %function
InsertImgToVoQueue_FillImageInfo:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x19, x3
	mov	w23, w0
	mov	x0, x30
	mov	x24, x2
	bl	_mcount
	ldr	w0, [x19, 40]
	cbz	w0, .L36
	ldr	w0, [x19, 44]
	cbnz	w0, .L61
.L36:
	ldp	w1, w0, [x19, 32]
	stp	w1, w0, [x19, 40]
	lsr	w2, w1, 1
	lsr	w0, w0, 1
	str	w2, [x19, 48]
	str	w0, [x19, 52]
.L37:
	add	x20, x24, 528
	str	w1, [x20, 28]
	ldr	w3, [x20, 8]
	ldr	w0, [x19, 36]
	str	w0, [x20, 32]
	ldrb	w0, [x19, 156]
	ubfx	x0, x0, 5, 3
	str	w0, [x20, 36]
	ldr	w0, [x19, 156]
	str	w0, [x20, 40]
	ldr	w0, [x19, 88]
	add	w0, w0, 2
	str	w0, [x20, 24]
	ldrb	w27, [x19, 157]
	ldr	w2, [x19, 100]
	ldr	w0, [x19, 156]
	ubfx	x27, x27, 0, 2
	ldp	w21, w1, [x19, 44]
	ldrh	w22, [x19, 52]
	cmp	w2, w3
	ubfx	x0, x0, 14, 3
	ldrh	w3, [x19, 40]
	uxtb	w25, w27
	orr	w22, w22, w1, lsl 16
	uxtb	w26, w0
	orr	w21, w3, w21, lsl 16
	beq	.L38
	str	w2, [x20, 48]
.L38:
	ldr	w1, [x20, 44]
	add	w2, w1, 1
	str	w2, [x20, 44]
	str	w1, [x19, 104]
	ldr	w1, [x24, 528]
	cmp	w26, w1
	beq	.L39
	ldr	x2, .LC9
	ldr	x4, [x2]
	cbz	x4, .L40
	strb	w1, [x29, 104]
	mov	w3, 2
	strb	w0, [x29, 105]
	add	x2, x29, 104
	mov	w1, 6
	mov	w0, w23
	blr	x4
.L40:
	str	w26, [x24, 528]
.L39:
	ldr	w0, [x20, 4]
	cmp	w25, w0
	beq	.L41
	ldr	x0, .LC9
	ldr	x4, [x0]
	cbz	x4, .L42
	add	x2, x29, 112
	mov	w3, 1
	mov	w1, 3
	mov	w0, w23
	strb	w27, [x2, -8]!
	blr	x4
.L42:
	str	w25, [x20, 4]
.L41:
	ldr	w0, [x20, 16]
	cmp	w21, w0
	beq	.L62
.L43:
	ldr	x0, .LC9
	stp	w21, w22, [x20, 16]
	ldr	x4, [x0]
	cbz	x4, .L35
	ldp	w3, w2, [x19, 40]
	ldp	w1, w0, [x19, 48]
	strh	w3, [x29, 104]
	mov	w3, 8
	strh	w2, [x29, 106]
	add	x2, x29, 104
	strh	w1, [x29, 108]
	mov	w1, 0
	strh	w0, [x29, 110]
	mov	w0, w23
	blr	x4
.L35:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L61:
	ldr	w1, [x19, 32]
	b	.L37
	.p2align 3
.L62:
	ldr	w0, [x20, 20]
	cmp	w22, w0
	bne	.L43
	b	.L35
	.size	InsertImgToVoQueue_FillImageInfo, .-InsertImgToVoQueue_FillImageInfo
	.align	3
.LC9:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InsertImgToVoQueue
	.type	InsertImgToVoQueue, %function
InsertImgToVoQueue:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	w22, w0
	mov	x26, x4
	mov	x0, x30
	mov	w23, w1
	mov	x24, x2
	mov	x27, x3
	bl	_mcount
	cbz	x26, .L98
	ldr	x2, .LC13
	mov	w1, 416
	mov	w0, 3
	bl	dprint_normal
	ldr	x20, .LC14
	mov	w0, 2
	ldr	x1, [x20, 24]
	blr	x1
	ldrh	w19, [x27, 4]
	ldrh	w2, [x27, 8]
	and	w19, w19, 63
	cmp	w19, w2
	beq	.L70
	ldr	x25, .LC16
	mov	w21, 1000
	b	.L96
	.p2align 3
.L69:
	add	w19, w19, 1
	and	w19, w19, 63
	cmp	w19, w2
	beq	.L70
.L96:
	sxtw	x0, w19
	ldr	w1, [x26, 88]
	add	x0, x0, 2
	ldr	x0, [x27, x0, lsl 3]
	ldr	w3, [x0, 88]
	cmp	w3, w1
	bne	.L69
	mov	x2, x25
	mov	w1, 431
	mov	w0, 0
	add	w19, w19, 1
	and	w19, w19, 63
	bl	dprint_normal
	str	w21, [x26, 96]
	ldrh	w2, [x27, 8]
	cmp	w19, w2
	bne	.L96
	.p2align 2
.L70:
	ldr	w3, [x26, 96]
	cmp	w3, 100
	bhi	.L99
	ldp	w4, w5, [x26, 32]
	cmp	w4, 31
	bhi	.L100
.L72:
	ldr	x2, .LC18
	mov	w1, 438
	mov	w0, 0
	bl	dprint_normal
	ldr	w0, [x26, 96]
	cmp	w0, 1000
	beq	.L75
	mov	x2, x26
	mov	x1, x24
	mov	w0, w23
	bl	ReturnImageToSyntax
.L75:
	ldr	x1, [x20, 32]
	mov	w0, 2
	blr	x1
	mov	w0, 1
.L65:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L100:
	cmp	w5, 31
	bls	.L72
	ldr	x24, .LC19
	cmp	w23, 20
	str	w23, [x26, 148]
	ldr	x0, [x24, w22, sxtw 3]
	add	x0, x0, 217088
	beq	.L101
.L77:
	ldr	w0, [x0, 3932]
	cbnz	w0, .L78
	str	wzr, [x26, 144]
.L78:
	add	x1, x26, 264
	mov	w0, w22
	sxtw	x19, w22
	bl	VCTRL_GetHDRConfigInfo
	lsl	x21, x19, 2
	mov	w1, w23
	mov	x3, x26
	mov	x2, x27
	mov	w0, w22
	sub	x21, x21, x19
	bl	InsertImgToVoQueue_PtsProcess
	mov	w1, w23
	mov	x3, x26
	mov	x2, x27
	mov	w0, w22
	bl	InsertImgToVoQueue_FillImageInfo
	ldrh	w5, [x27, 8]
	mov	w1, 468
	ldrh	w4, [x27, 6]
	mov	w0, 10
	ldrh	w3, [x27, 4]
	ldr	x2, .LC21
	ldr	w6, [x26, 88]
	bl	dprint_normal
	ldr	x23, .LC22
	ldrh	w0, [x27, 8]
	add	w1, w0, 1
	add	x0, x0, 2
	and	w1, w1, 63
	str	x26, [x27, x0, lsl 3]
	lsl	x0, x21, 5
	strh	w1, [x27, 8]
	add	x21, x21, x0
	add	x21, x21, x19
	ldr	x1, [x24, w22, sxtw 3]
	add	x21, x23, x21
	ldr	w0, [x1, 92]
	add	w0, w0, 1
	str	w0, [x1, 92]
	ldr	w0, [x21, 32]
	cbz	w0, .L102
.L79:
	lsl	x1, x19, 2
	ldr	w4, [x26, 20]
	sub	x2, x1, x19
	ldr	x3, [x20, 32]
	lsl	x1, x2, 5
	mov	w0, 2
	add	x1, x2, x1
	add	x1, x1, x19
	add	x1, x23, x1
	str	w4, [x1, 96]
	blr	x3
	ldr	x0, .LC23
	ldr	x4, [x0]
	cbz	x4, .L80
	mov	w3, 0
	mov	x2, x26
	mov	w1, 4
	mov	w0, w22
	blr	x4
.L80:
	mov	w0, 8
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L103
.L82:
	lsl	x0, x19, 2
	ldr	x1, [x20]
	sub	x20, x0, x19
	lsl	x0, x20, 5
	add	x20, x20, x0
	add	x20, x20, x19
	add	x21, x23, x20
	ldr	w0, [x21, 4]
	add	w0, w0, 1
	str	w0, [x21, 4]
	blr	x1
	mov	w2, w0
	ldr	w1, [x23, x20]
	mov	w0, 1
	sub	w1, w2, w1
	cmp	w1, 299
	bls	.L65
	ldr	w0, [x21, 4]
	cbz	w0, .L84
	mov	w3, 10000
	mul	w0, w0, w3
	udiv	w1, w0, w1
	str	w1, [x21, 8]
.L84:
	lsl	x1, x19, 2
	mov	w0, 1
	sub	x1, x1, x19
	lsl	x3, x1, 5
	add	x1, x1, x3
	add	x19, x1, x19
	add	x1, x23, x19
	str	w2, [x23, x19]
	str	wzr, [x1, 4]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L99:
	ldp	w4, w5, [x26, 32]
	b	.L72
.L103:
	ldr	x0, [x20]
	blr	x0
	mov	w4, w0
	ldr	x3, .LC24
	ldr	x1, .LC25
	ldr	w0, [x3, w22, sxtw 2]
	ldr	w1, [x1]
	sub	w0, w4, w0
	cmp	w0, w1
	bls	.L82
	lsl	w2, w22, 24
	ldr	x0, .LC26
	add	w2, w2, 524288
	mov	w1, 523
	str	w4, [x3, w22, sxtw 2]
	bl	DBG_AddTrace
	b	.L82
.L102:
	ldr	x0, [x20]
	blr	x0
	str	w0, [x21, 32]
	b	.L79
.L101:
	ldr	w1, [x0, 3860]
	str	w1, [x26, 496]
	b	.L77
.L98:
	ldr	x2, .LC11
	mov	w1, 412
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -2
	b	.L65
	.size	InsertImgToVoQueue, .-InsertImgToVoQueue
	.align	3
.LC11:
	.xword	.LC10
	.align	3
.LC13:
	.xword	.LC12
	.align	3
.LC14:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC16:
	.xword	.LC15
	.align	3
.LC18:
	.xword	.LC17
	.align	3
.LC19:
	.xword	s_pstVfmwChan
	.align	3
.LC21:
	.xword	.LC20
	.align	3
.LC22:
	.xword	g_VfmwChanStat
	.align	3
.LC23:
	.xword	g_EventReportFunc
	.align	3
.LC24:
	.xword	.LANCHOR0
	.align	3
.LC25:
	.xword	g_TraceFramePeriod
	.align	3
.LC26:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SYNTAX_GetQueueImgNum
	.type	SYNTAX_GetQueueImgNum, %function
SYNTAX_GetQueueImgNum:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	mov	x20, x2
	bl	_mcount
	ldrh	w0, [x19, 6]
	ldrh	w3, [x19, 4]
	cmp	w0, w3
	bcc	.L105
	sub	w3, w0, w3
.L106:
	ldrh	w4, [x19, 8]
	cmp	w0, w4
	bls	.L109
	add	w4, w4, 64
.L109:
	str	w3, [x21]
	sub	w0, w4, w0
	str	w0, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L105:
	add	w1, w0, 64
	sub	w3, w1, w3
	b	.L106
	.size	SYNTAX_GetQueueImgNum, .-SYNTAX_GetQueueImgNum
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SYNTAX_GetVoQue
	.type	SYNTAX_GetVoQue, %function
SYNTAX_GetVoQue:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	cmp	w0, 16
	bls	.L118
.L117:
	mov	x0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L118:
	ldr	x1, .LC27
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx113
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx113:
	.section	.rodata
	.align	0
	.align	2
.L113:
	.byte	(.L112 - .Lrtx113) / 4
	.byte	(.L117 - .Lrtx113) / 4
	.byte	(.L114 - .Lrtx113) / 4
	.byte	(.L115 - .Lrtx113) / 4
	.byte	(.L117 - .Lrtx113) / 4
	.byte	(.L117 - .Lrtx113) / 4
	.byte	(.L117 - .Lrtx113) / 4
	.byte	(.L117 - .Lrtx113) / 4
	.byte	(.L117 - .Lrtx113) / 4
	.byte	(.L117 - .Lrtx113) / 4
	.byte	(.L117 - .Lrtx113) / 4
	.byte	(.L117 - .Lrtx113) / 4
	.byte	(.L117 - .Lrtx113) / 4
	.byte	(.L117 - .Lrtx113) / 4
	.byte	(.L117 - .Lrtx113) / 4
	.byte	(.L117 - .Lrtx113) / 4
	.byte	(.L116 - .Lrtx113) / 4
	.text
	.p2align 3
.L116:
	add	x19, x19, 8192
	add	x0, x19, 184
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L115:
	add	x19, x19, 81920
	add	x0, x19, 136
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L114:
	add	x19, x19, 20480
	add	x0, x19, 2168
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L112:
	add	x0, x19, 16
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SYNTAX_GetVoQue, .-SYNTAX_GetVoQue
	.align	3
.LC27:
	.xword	.L113
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SYNTAX_MarkImageOutHanging
	.type	SYNTAX_MarkImageOutHanging, %function
SYNTAX_MarkImageOutHanging:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x1
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x20]
	cmp	w0, 16
	bls	.L139
.L132:
	mov	w0, -2
	b	.L126
	.p2align 3
.L139:
	ldr	x1, .LC28
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx122
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx122:
	.section	.rodata
	.align	0
	.align	2
.L122:
	.byte	(.L121 - .Lrtx122) / 4
	.byte	(.L132 - .Lrtx122) / 4
	.byte	(.L123 - .Lrtx122) / 4
	.byte	(.L124 - .Lrtx122) / 4
	.byte	(.L132 - .Lrtx122) / 4
	.byte	(.L132 - .Lrtx122) / 4
	.byte	(.L132 - .Lrtx122) / 4
	.byte	(.L132 - .Lrtx122) / 4
	.byte	(.L132 - .Lrtx122) / 4
	.byte	(.L132 - .Lrtx122) / 4
	.byte	(.L132 - .Lrtx122) / 4
	.byte	(.L132 - .Lrtx122) / 4
	.byte	(.L132 - .Lrtx122) / 4
	.byte	(.L132 - .Lrtx122) / 4
	.byte	(.L132 - .Lrtx122) / 4
	.byte	(.L132 - .Lrtx122) / 4
	.byte	(.L125 - .Lrtx122) / 4
	.text
	.p2align 3
.L125:
	add	x20, x20, 8192
	add	x20, x20, 184
.L120:
	cbz	x20, .L132
	ldr	x22, .LC29
	mov	w0, 2
	ldr	x1, [x22, 24]
	blr	x1
	ldrh	w19, [x20, 4]
	ldrh	w3, [x20, 6]
	and	w19, w19, 63
	cmp	w19, w3
	beq	.L129
	.p2align 2
.L136:
	sxtw	x1, w19
	mov	w0, w21
	add	x1, x1, 2
	ldr	x2, [x20, x1, lsl 3]
	mov	x1, x2
	cbz	x2, .L128
	bl	FSP_MarkImageOutHanging
	ldrh	w3, [x20, 6]
.L128:
	add	w19, w19, 1
	and	w19, w19, 63
	cmp	w19, w3
	bne	.L136
.L129:
	ldr	x1, [x22, 32]
	mov	w0, 2
	blr	x1
	mov	w0, 1
.L126:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L124:
	add	x20, x20, 81920
	add	x20, x20, 136
	b	.L120
	.p2align 3
.L123:
	add	x20, x20, 20480
	add	x20, x20, 2168
	b	.L120
	.p2align 3
.L121:
	add	x20, x20, 16
	b	.L120
	.size	SYNTAX_MarkImageOutHanging, .-SYNTAX_MarkImageOutHanging
	.align	3
.LC28:
	.xword	.L122
	.align	3
.LC29:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SYNTAX_MarkImageEos
	.type	SYNTAX_MarkImageEos, %function
SYNTAX_MarkImageEos:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	cmp	w0, 16
	bls	.L162
.L155:
	mov	w20, -1
	b	.L161
	.p2align 3
.L162:
	ldr	x1, .LC30
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx143
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx143:
	.section	.rodata
	.align	0
	.align	2
.L143:
	.byte	(.L142 - .Lrtx143) / 4
	.byte	(.L155 - .Lrtx143) / 4
	.byte	(.L144 - .Lrtx143) / 4
	.byte	(.L145 - .Lrtx143) / 4
	.byte	(.L155 - .Lrtx143) / 4
	.byte	(.L155 - .Lrtx143) / 4
	.byte	(.L155 - .Lrtx143) / 4
	.byte	(.L155 - .Lrtx143) / 4
	.byte	(.L155 - .Lrtx143) / 4
	.byte	(.L155 - .Lrtx143) / 4
	.byte	(.L155 - .Lrtx143) / 4
	.byte	(.L155 - .Lrtx143) / 4
	.byte	(.L155 - .Lrtx143) / 4
	.byte	(.L155 - .Lrtx143) / 4
	.byte	(.L155 - .Lrtx143) / 4
	.byte	(.L155 - .Lrtx143) / 4
	.byte	(.L146 - .Lrtx143) / 4
	.text
	.p2align 3
.L146:
	add	x19, x19, 8192
	add	x19, x19, 184
.L141:
	cbz	x19, .L155
	ldr	x20, .LC31
	mov	w0, 2
	ldr	x1, [x20, 24]
	blr	x1
	ldrh	w0, [x19, 6]
	ldrh	w1, [x19, 8]
	cmp	w0, w1
	bhi	.L148
	sub	w0, w1, w0
	cmp	w0, wzr
	ble	.L150
.L164:
	mov	w0, 63
	cbz	w1, .L151
	sub	w1, w1, #1
	uxth	w0, w1
.L151:
	sxtw	x1, w0
	add	x1, x1, 2
	ldr	x1, [x19, x1, lsl 3]
	cbz	x1, .L163
	ldr	x2, [x20, 32]
	mov	w3, 1
	mov	w0, 2
	str	w3, [x1, 108]
	mov	w20, 0
	blr	x2
.L161:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L145:
	add	x19, x19, 81920
	add	x19, x19, 136
	b	.L141
	.p2align 3
.L144:
	add	x19, x19, 20480
	add	x19, x19, 2168
	b	.L141
	.p2align 3
.L142:
	add	x19, x19, 16
	b	.L141
	.p2align 3
.L148:
	add	w2, w1, 64
	sub	w0, w2, w0
	cmp	w0, wzr
	bgt	.L164
.L150:
	ldr	w1, [x19, 552]
	mov	w0, 2
	ldr	x2, [x20, 32]
	cmp	w1, w0
	csinv	w20, w1, wzr, cs
	blr	x2
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L163:
	ldr	x1, [x20, 32]
	mov	w0, 2
	mov	w20, -1
	blr	x1
	ldr	x3, .LC32
	mov	w1, 743
	ldrh	w4, [x19, 8]
	mov	w0, 1
	ldr	x2, .LC34
	add	x3, x3, 24
	bl	dprint_normal
	b	.L161
	.size	SYNTAX_MarkImageEos, .-SYNTAX_MarkImageEos
	.align	3
.LC30:
	.xword	.L143
	.align	3
.LC31:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC32:
	.xword	.LANCHOR1
	.align	3
.LC34:
	.xword	.LC33
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SYNTAX_ReceiveImage
	.type	SYNTAX_ReceiveImage, %function
SYNTAX_ReceiveImage:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L175
	ldr	w0, [x19]
	cmp	w0, 16
	bls	.L179
.L178:
	ldr	x3, .LC36
	mov	w1, 774
	ldr	x2, .LC38
	mov	w0, 1
	add	x3, x3, 48
	bl	dprint_normal
	mov	w0, -2
	b	.L166
	.p2align 3
.L179:
	ldr	x1, .LC35
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx169
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx169:
	.section	.rodata
	.align	0
	.align	2
.L169:
	.byte	(.L168 - .Lrtx169) / 4
	.byte	(.L178 - .Lrtx169) / 4
	.byte	(.L170 - .Lrtx169) / 4
	.byte	(.L171 - .Lrtx169) / 4
	.byte	(.L178 - .Lrtx169) / 4
	.byte	(.L178 - .Lrtx169) / 4
	.byte	(.L178 - .Lrtx169) / 4
	.byte	(.L178 - .Lrtx169) / 4
	.byte	(.L178 - .Lrtx169) / 4
	.byte	(.L178 - .Lrtx169) / 4
	.byte	(.L178 - .Lrtx169) / 4
	.byte	(.L178 - .Lrtx169) / 4
	.byte	(.L178 - .Lrtx169) / 4
	.byte	(.L178 - .Lrtx169) / 4
	.byte	(.L178 - .Lrtx169) / 4
	.byte	(.L178 - .Lrtx169) / 4
	.byte	(.L172 - .Lrtx169) / 4
	.text
	.p2align 3
.L172:
	add	x19, x19, 8192
	add	x19, x19, 184
.L167:
	cbz	x19, .L178
	ldr	x22, .LC39
	mov	w0, 2
	mov	w21, -3
	ldr	x1, [x22, 24]
	blr	x1
	ldrh	w0, [x19, 6]
	ldrh	w1, [x19, 8]
	cmp	w1, w0
	beq	.L174
	add	x1, x0, 2
	ldr	x3, [x22, 104]
	mov	x2, 536
	mov	x0, x20
	ldr	x21, [x20, 160]
	ldr	x1, [x19, x1, lsl 3]
	blr	x3
	str	x21, [x20, 160]
	ldr	x2, .LC41
	mov	w1, 798
	ldr	w6, [x20, 88]
	mov	w0, 10
	ldrh	w5, [x19, 8]
	mov	w21, 1
	ldrh	w4, [x19, 6]
	ldrh	w3, [x19, 4]
	bl	dprint_normal
	ldr	w1, [x20, 88]
	ldr	w0, [x19, 600]
	add	w0, w1, w0
	str	w0, [x20, 88]
	ldrh	w0, [x19, 6]
	add	w0, w0, w21
	and	w0, w0, 63
	strh	w0, [x19, 6]
.L174:
	ldr	x1, [x22, 32]
	mov	w0, 2
	blr	x1
	mov	w0, w21
.L166:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L171:
	add	x19, x19, 81920
	add	x19, x19, 136
	b	.L167
	.p2align 3
.L170:
	add	x19, x19, 20480
	add	x19, x19, 2168
	b	.L167
	.p2align 3
.L168:
	add	x19, x19, 16
	b	.L167
	.p2align 3
.L175:
	mov	w0, -2
	b	.L166
	.size	SYNTAX_ReceiveImage, .-SYNTAX_ReceiveImage
	.align	3
.LC35:
	.xword	.L169
	.align	3
.LC36:
	.xword	.LANCHOR1
	.align	3
.LC38:
	.xword	.LC37
	.align	3
.LC39:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC41:
	.xword	.LC40
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SYNTAX_ReleaseImage_RecycleImage_CheckRet
	.type	SYNTAX_ReleaseImage_RecycleImage_CheckRet, %function
SYNTAX_ReleaseImage_RecycleImage_CheckRet:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	w0, [x20]
	cbz	w0, .L183
	cmp	w0, 16
	bne	.L190
.L183:
	mov	w0, -20
	cmp	w19, wzr
	csinc	w0, w0, wzr, ne
.L184:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L190:
	cmn	w19, #2
	beq	.L187
	cmp	w19, 1
	mov	w0, -20
	csinc	w0, w0, wzr, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L187:
	mov	w0, w19
	b	.L184
	.size	SYNTAX_ReleaseImage_RecycleImage_CheckRet, .-SYNTAX_ReleaseImage_RecycleImage_CheckRet
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SYNTAX_ReleaseImage_RecycleImage
	.type	SYNTAX_ReleaseImage_RecycleImage, %function
SYNTAX_ReleaseImage_RecycleImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	w0, [x19]
	cmp	w0, 16
	bls	.L199
.L198:
	mov	w1, -2
	mov	x0, x19
	bl	SYNTAX_ReleaseImage_RecycleImage_CheckRet
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L199:
	ldr	x1, .LC42
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx194
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx194:
	.section	.rodata
	.align	0
	.align	2
.L194:
	.byte	(.L193 - .Lrtx194) / 4
	.byte	(.L198 - .Lrtx194) / 4
	.byte	(.L195 - .Lrtx194) / 4
	.byte	(.L196 - .Lrtx194) / 4
	.byte	(.L198 - .Lrtx194) / 4
	.byte	(.L198 - .Lrtx194) / 4
	.byte	(.L198 - .Lrtx194) / 4
	.byte	(.L198 - .Lrtx194) / 4
	.byte	(.L198 - .Lrtx194) / 4
	.byte	(.L198 - .Lrtx194) / 4
	.byte	(.L198 - .Lrtx194) / 4
	.byte	(.L198 - .Lrtx194) / 4
	.byte	(.L198 - .Lrtx194) / 4
	.byte	(.L198 - .Lrtx194) / 4
	.byte	(.L198 - .Lrtx194) / 4
	.byte	(.L198 - .Lrtx194) / 4
	.byte	(.L197 - .Lrtx194) / 4
	.text
	.p2align 3
.L197:
	ldr	w1, [x20, 88]
	add	x0, x19, 8
	bl	HEVC_DECRecycleImage
	mov	w1, w0
	mov	x0, x19
	bl	SYNTAX_ReleaseImage_RecycleImage_CheckRet
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L196:
	ldr	w1, [x20, 88]
	add	x0, x19, 8
	bl	MPEG2DEC_RecycleImage
	mov	w1, w0
	mov	x0, x19
	bl	SYNTAX_ReleaseImage_RecycleImage_CheckRet
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L195:
	ldr	w1, [x20, 88]
	add	x0, x19, 8
	bl	MPEG4DEC_RecycleImage
	mov	w1, w0
	mov	x0, x19
	bl	SYNTAX_ReleaseImage_RecycleImage_CheckRet
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L193:
	ldr	w1, [x20, 88]
	add	x0, x19, 8
	bl	H264DEC_RecycleImage
	mov	w1, w0
	mov	x0, x19
	bl	SYNTAX_ReleaseImage_RecycleImage_CheckRet
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SYNTAX_ReleaseImage_RecycleImage, .-SYNTAX_ReleaseImage_RecycleImage
	.align	3
.LC42:
	.xword	.L194
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SYNTAX_ReleaseImage
	.type	SYNTAX_ReleaseImage, %function
SYNTAX_ReleaseImage:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	mov	x25, x1
	bl	_mcount
	cmp	x25, xzr
	ccmp	x22, xzr, 4, ne
	beq	.L233
	ldr	w0, [x22]
	cmp	w0, 16
	bls	.L234
.L227:
	ldr	x3, .LC46
	mov	w1, 1000
	ldr	x2, .LC47
	mov	w0, 1
	add	x3, x3, 72
	bl	dprint_normal
	mov	w0, -2
	b	.L202
	.p2align 3
.L234:
	ldr	x1, .LC45
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx205
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx205:
	.section	.rodata
	.align	0
	.align	2
.L205:
	.byte	(.L204 - .Lrtx205) / 4
	.byte	(.L227 - .Lrtx205) / 4
	.byte	(.L206 - .Lrtx205) / 4
	.byte	(.L207 - .Lrtx205) / 4
	.byte	(.L227 - .Lrtx205) / 4
	.byte	(.L227 - .Lrtx205) / 4
	.byte	(.L227 - .Lrtx205) / 4
	.byte	(.L227 - .Lrtx205) / 4
	.byte	(.L227 - .Lrtx205) / 4
	.byte	(.L227 - .Lrtx205) / 4
	.byte	(.L227 - .Lrtx205) / 4
	.byte	(.L227 - .Lrtx205) / 4
	.byte	(.L227 - .Lrtx205) / 4
	.byte	(.L227 - .Lrtx205) / 4
	.byte	(.L227 - .Lrtx205) / 4
	.byte	(.L227 - .Lrtx205) / 4
	.byte	(.L208 - .Lrtx205) / 4
	.text
.L208:
	add	x21, x22, 8192
	add	x21, x21, 184
.L203:
	cbz	x21, .L227
	ldr	x23, .LC48
	mov	w0, 2
	ldr	x1, [x23, 24]
	blr	x1
	ldrh	w20, [x21, 4]
	ldrh	w1, [x21, 6]
	and	w20, w20, 63
	ldr	w4, [x21, 600]
	ldr	w3, [x25, 88]
	cmp	w20, w1
	sub	w26, w3, w4
	beq	.L218
	ldr	x24, .LC52
	b	.L228
	.p2align 3
.L214:
	add	w20, w20, 1
	and	w20, w20, 63
	cmp	w20, w1
	beq	.L235
.L228:
	sxtw	x19, w20
	add	x0, x19, 2
	ldr	x0, [x21, x0, lsl 3]
	cbz	x0, .L212
	ldr	w0, [x0, 88]
	cmp	w26, w0
	bne	.L214
	mov	w5, 1
.L213:
	ldrh	w4, [x21, 4]
	b	.L216
	.p2align 3
.L222:
	mov	w20, w1
.L216:
	cmp	w20, wzr
	sub	w0, w20, #1
	mov	w1, 63
	add	x2, x19, 2
	csel	w1, w0, w1, ne
	cmp	w20, w4
	sxtw	x0, w1
	add	x3, x0, 2
	mov	x19, x0
	ldr	x0, [x21, x3, lsl 3]
	str	x0, [x21, x2, lsl 3]
	bne	.L222
	ldr	w0, [x25, 88]
	cmp	w5, 1
	ldr	w1, [x21, 600]
	sub	w0, w0, w1
	str	w0, [x25, 88]
	ldrh	w3, [x21, 4]
	add	w3, w3, 1
	and	w3, w3, 63
	strh	w3, [x21, 4]
	beq	.L231
	ldrh	w1, [x21, 6]
	add	w20, w20, 1
	and	w20, w20, 63
	cmp	w20, w1
	bne	.L228
.L235:
	ldr	w4, [x21, 600]
	ldr	w3, [x25, 88]
.L218:
	ldr	x2, .LC50
	mov	w1, 1014
	ldr	w5, [x25, 444]
	mov	w0, 1
	mov	w19, -2
	bl	dprint_normal
.L211:
	ldr	x1, [x23, 32]
	mov	w0, 2
	blr	x1
	mov	w0, w19
.L202:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L207:
	add	x21, x22, 81920
	add	x21, x21, 136
	b	.L203
.L206:
	add	x21, x22, 20480
	add	x21, x21, 2168
	b	.L203
.L204:
	add	x21, x22, 16
	b	.L203
	.p2align 3
.L212:
	mov	w3, w20
	mov	x2, x24
	mov	w1, 1032
	mov	w0, 1
	bl	dprint_normal
	mov	w5, 2
	b	.L213
.L231:
	ldrh	w5, [x21, 8]
	mov	w1, 1058
	ldrh	w4, [x21, 6]
	mov	w0, 10
	ldr	x2, .LC54
	ldr	w6, [x25, 88]
	bl	dprint_normal
	mov	x1, x25
	mov	x0, x22
	bl	SYNTAX_ReleaseImage_RecycleImage
	cmp	w0, 1
	mov	w19, w0
	beq	.L211
	ldr	x3, .LC46
	mov	w1, 1063
	ldr	x2, .LC56
	mov	w0, 0
	add	x3, x3, 72
	bl	dprint_normal
	b	.L211
.L233:
	ldr	x2, .LC44
	mov	w1, 992
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -2
	b	.L202
	.size	SYNTAX_ReleaseImage, .-SYNTAX_ReleaseImage
	.align	3
.LC44:
	.xword	.LC43
	.align	3
.LC45:
	.xword	.L205
	.align	3
.LC46:
	.xword	.LANCHOR1
	.align	3
.LC47:
	.xword	.LC37
	.align	3
.LC48:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC50:
	.xword	.LC49
	.align	3
.LC52:
	.xword	.LC51
	.align	3
.LC54:
	.xword	.LC53
	.align	3
.LC56:
	.xword	.LC55
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SYNTAX_ReturnImage
	.type	SYNTAX_ReturnImage, %function
SYNTAX_ReturnImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	cmp	w0, 20
	bls	.L246
.L245:
	mov	w0, -2
	b	.L237
	.p2align 3
.L246:
	ldr	x1, .LC57
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx239
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx239:
	.section	.rodata
	.align	0
	.align	2
.L239:
	.byte	(.L243 - .Lrtx239) / 4
	.byte	(.L245 - .Lrtx239) / 4
	.byte	(.L240 - .Lrtx239) / 4
	.byte	(.L241 - .Lrtx239) / 4
	.byte	(.L245 - .Lrtx239) / 4
	.byte	(.L245 - .Lrtx239) / 4
	.byte	(.L245 - .Lrtx239) / 4
	.byte	(.L245 - .Lrtx239) / 4
	.byte	(.L245 - .Lrtx239) / 4
	.byte	(.L245 - .Lrtx239) / 4
	.byte	(.L245 - .Lrtx239) / 4
	.byte	(.L245 - .Lrtx239) / 4
	.byte	(.L245 - .Lrtx239) / 4
	.byte	(.L245 - .Lrtx239) / 4
	.byte	(.L245 - .Lrtx239) / 4
	.byte	(.L245 - .Lrtx239) / 4
	.byte	(.L242 - .Lrtx239) / 4
	.byte	(.L245 - .Lrtx239) / 4
	.byte	(.L245 - .Lrtx239) / 4
	.byte	(.L245 - .Lrtx239) / 4
	.byte	(.L243 - .Lrtx239) / 4
	.text
	.p2align 3
.L243:
	add	x19, x19, 16
.L244:
	ldr	x20, .LC58
	mov	w0, 2
	ldr	x1, [x20, 24]
	blr	x1
	ldrh	w1, [x19, 6]
	mov	w0, 2
	sub	w1, w1, #1
	and	w1, w1, 63
	strh	w1, [x19, 6]
	ldr	x1, [x20, 32]
	blr	x1
	mov	w0, 1
.L237:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L241:
	add	x19, x19, 81920
	add	x19, x19, 136
	b	.L244
	.p2align 3
.L242:
	add	x19, x19, 8192
	add	x19, x19, 184
	b	.L244
	.p2align 3
.L240:
	add	x19, x19, 20480
	add	x19, x19, 2168
	b	.L244
	.size	SYNTAX_ReturnImage, .-SYNTAX_ReturnImage
	.align	3
.LC57:
	.xword	.L239
	.align	3
.LC58:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_H264
	.type	DecodeStream_H264, %function
DecodeStream_H264:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x2, [x19, 8]
	add	x1, x29, 40
	ldr	x3, [x19, 40]
	mov	x0, x20
	ldrb	w5, [x19, 18]
	ldp	w7, w6, [x19, 24]
	ldr	w4, [x19, 32]
	str	x2, [x29, 48]
	str	x3, [x29, 72]
	ldrsb	w2, [x19, 17]
	ldrb	w3, [x19, 21]
	strb	w5, [x29, 40]
	stp	w7, w6, [x29, 56]
	str	w4, [x29, 64]
	strb	w3, [x29, 41]
	str	w2, [x29, 68]
	bl	H264DEC_DecodePacket
	cmn	w0, #2
	add	x1, x20, 61440
	beq	.L251
	strb	wzr, [x19, 1]
	ldr	x0, .LC59
	ldrsw	x2, [x1, 1140]
	ldr	x0, [x0, x2, lsl 3]
	add	x0, x0, 221184
	strb	wzr, [x0, 96]
	ldr	x0, [x20, 616]
	cbz	x0, .L252
.L247:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L251:
	mov	w2, 1
	strb	w2, [x19, 1]
	ldr	x0, .LC59
	ldrsw	x3, [x1, 1140]
	ldr	x0, [x0, x3, lsl 3]
	add	x0, x0, 221184
	strb	w2, [x0, 96]
	ldr	x0, [x20, 616]
	cbnz	x0, .L247
.L252:
	add	x20, x20, 12288
	ldrb	w0, [x20, 2640]
	cmp	w0, 1
	bne	.L247
	ldr	w0, [x1, 1140]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x20, 2640]
	b	.L247
	.size	DecodeStream_H264, .-DecodeStream_H264
	.align	3
.LC59:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_HEVC
	.type	DecodeStream_HEVC, %function
DecodeStream_HEVC:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldp	w6, w5, [x19, 24]
	ldrb	w4, [x19, 18]
	add	x1, x29, 32
	ldrsb	w2, [x19, 17]
	mov	x0, x20
	ldr	w3, [x19, 32]
	ldr	x7, [x19, 8]
	strb	w4, [x29, 32]
	str	x7, [x29, 40]
	stp	w6, w2, [x29, 48]
	stp	w5, w3, [x29, 56]
	bl	HEVCDEC_DecodePacket
	cmn	w0, #2
	beq	.L254
	ldrb	w0, [x20, 7]
	cbz	w0, .L255
.L254:
	mov	w1, 1
	strb	w1, [x19, 1]
	ldr	x0, .LC60
	ldrsw	x2, [x20, 248]
	ldr	x0, [x0, x2, lsl 3]
	add	x0, x0, 221184
	strb	w1, [x0, 96]
	ldr	x0, [x20, 2480]
	cbz	x0, .L261
.L253:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L255:
	strb	wzr, [x19, 1]
	ldr	x0, .LC60
	ldrsw	x1, [x20, 248]
	ldr	x0, [x0, x1, lsl 3]
	add	x0, x0, 221184
	strb	wzr, [x0, 96]
	ldr	x0, [x20, 2480]
	cbnz	x0, .L253
.L261:
	ldrb	w0, [x20, 9]
	cmp	w0, 1
	bne	.L253
	ldr	w0, [x20, 248]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x20, 9]
	b	.L253
	.size	DecodeStream_HEVC, .-DecodeStream_HEVC
	.align	3
.LC60:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SegMan
	.type	SegMan, %function
SegMan:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L263
	ldr	x0, [x19, 8]
	cbz	x0, .L263
	ldr	x1, .LC63
	ldr	x1, [x1, w20, sxtw 3]
	add	x1, x1, 221184
	ldr	w2, [x1, 48]
	cmp	w2, 1
	beq	.L283
.L266:
	ldrb	w1, [x19, 18]
	strb	wzr, [x19, 448]
	cmp	w1, 1
	beq	.L284
	cbnz	w1, .L282
	ldr	x21, .LC64
	add	x23, x19, 96
	mov	x2, 88
	add	x1, x19, 8
	mov	x0, x23
	add	x22, x19, 184
	ldr	x3, [x21, 104]
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 88
	mov	w1, 0
	mov	x0, x22
	blr	x3
	ldrb	w0, [x19, 2]
	add	w0, w0, 1
	uxtb	w0, w0
	strb	w0, [x19, 2]
	cmp	w0, 1
	bls	.L282
	ldr	w1, [x19, 120]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
	ldr	w1, [x19, 208]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
	ldr	x3, [x21, 96]
	mov	x2, 88
	mov	w1, 0
	mov	x0, x23
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 88
	mov	w1, 0
	mov	x0, x22
	blr	x3
	ldr	x2, .LC66
	mov	w1, 1976
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC67
	ldr	x4, [x0]
	cbz	x4, .L270
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	mov	w0, w20
	blr	x4
.L270:
	strb	wzr, [x19, 2]
.L282:
	mov	w0, -1
.L281:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L283:
	ldr	w1, [x1, 80]
	cmp	w1, 1
	bne	.L266
	ldrb	w1, [x19, 448]
	cmp	w1, 1
	bne	.L266
	mov	x2, 176
	add	x1, x19, 272
	add	x0, x19, 96
	bl	memcpy
	strb	wzr, [x19, 448]
	mov	w0, 0
	b	.L281
	.p2align 3
.L284:
	ldrb	w21, [x19, 2]
	cbz	w21, .L285
	cmp	w21, 1
	bne	.L282
	ldr	w2, [x19, 116]
	cmp	w2, 1023
	bhi	.L272
	ldr	x22, .LC64
	uxtw	x2, w2
	ldr	x1, [x19, 96]
	sub	x0, x0, x2
	ldr	x3, [x22, 104]
	blr	x3
	strb	w21, [x19, 106]
	ldp	w0, w1, [x19, 116]
	ldp	w2, w4, [x19, 24]
	ldr	x3, [x19, 8]
	sub	w2, w2, w0
	sub	x3, x3, x0, uxtw
	add	w0, w4, w0
	str	x3, [x19, 96]
	stp	w2, w0, [x19, 112]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
	ldr	w0, [x19, 32]
	mov	x2, 88
	ldr	x3, [x22, 96]
	mov	w1, 0
	str	w0, [x19, 120]
	add	x0, x19, 184
	blr	x3
.L273:
	mov	w0, 1
	add	x1, x19, 96
	strb	w0, [x19, 448]
	mov	x2, 176
	strb	wzr, [x19, 2]
	add	x0, x19, 272
	bl	memcpy
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L272:
	ldr	x3, .LC64
	mov	x2, 88
	add	x1, x19, 8
	add	x0, x19, 184
	ldr	x3, [x3, 104]
	blr	x3
	b	.L273
	.p2align 3
.L285:
	ldr	x20, .LC64
	mov	x2, 88
	add	x1, x19, 8
	add	x0, x19, 96
	ldr	x3, [x20, 104]
	blr	x3
	ldr	x3, [x20, 96]
	mov	x2, 88
	mov	w1, 0
	add	x0, x19, 184
	blr	x3
	strb	wzr, [x19, 2]
	mov	w0, 0
	b	.L281
	.p2align 3
.L263:
	ldr	x2, .LC62
	mov	w1, 1936
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L281
	.size	SegMan, .-SegMan
	.align	3
.LC62:
	.xword	.LC61
	.align	3
.LC63:
	.xword	s_pstVfmwChan
	.align	3
.LC64:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC66:
	.xword	.LC65
	.align	3
.LC67:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_MPEG2
	.type	DecodeStream_MPEG2, %function
DecodeStream_MPEG2:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	mov	x0, x19
	ldr	w21, [x19]
	bl	MP2_GetPacketState
	cmp	w0, 2
	beq	.L292
.L287:
	ldr	w0, [x19]
	mov	x1, x20
	bl	SegMan
	cbz	w0, .L293
	ldr	x0, [x19, 40]
	cbz	x0, .L294
.L286:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L293:
	add	x1, x20, 96
	mov	x0, x19
	bl	MPEG2DEC_Decode
	ldrb	w0, [x19, 17]
	cmp	w0, 1
	csel	w0, w0, wzr, eq
	strb	w0, [x20, 1]
	ldr	x0, [x19, 40]
	cbnz	x0, .L286
.L294:
	ldrb	w0, [x19, 18]
	cmp	w0, 1
	bne	.L286
	ldr	w0, [x19]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x19, 18]
	b	.L286
	.p2align 3
.L292:
	ldr	x0, .LC68
	ldr	x0, [x0, w21, sxtw 3]
	add	x0, x0, 221184
	ldr	w1, [x0, 48]
	cmp	w1, 1
	beq	.L295
.L288:
	add	x1, x19, 77824
	mov	x0, x19
	add	x1, x1, 3640
	bl	MPEG2DEC_Decode
	b	.L287
	.p2align 3
.L295:
	ldr	w0, [x0, 80]
	cbnz	w0, .L287
	b	.L288
	.size	DecodeStream_MPEG2, .-DecodeStream_MPEG2
	.align	3
.LC68:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_MPEG4
	.type	DecodeStream_MPEG4, %function
DecodeStream_MPEG4:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x19, x1
	add	x20, x1, 20480
	bl	_mcount
	mov	x0, x19
	ldr	w22, [x20, 2768]
	bl	MP4_GetPacketState
	cmp	w0, 3
	beq	.L301
.L297:
	ldr	w0, [x20, 2768]
	mov	x1, x21
	bl	SegMan
	cbz	w0, .L302
	ldr	x0, [x19, 1040]
	cbz	x0, .L303
.L296:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L302:
	add	x1, x21, 96
	mov	x0, x19
	bl	MPEG4DEC_Decode
	ldr	x0, [x19, 1040]
	cbnz	x0, .L296
.L303:
	ldrb	w0, [x20, 2804]
	cmp	w0, 1
	bne	.L296
	ldr	w0, [x20, 2768]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x20, 2804]
	b	.L296
	.p2align 3
.L301:
	ldr	x0, .LC69
	ldr	x0, [x0, w22, sxtw 3]
	add	x0, x0, 221184
	ldr	w1, [x0, 48]
	cmp	w1, 1
	beq	.L304
.L298:
	add	x1, x19, 12288
	mov	x0, x19
	add	x1, x1, 3368
	bl	MPEG4DEC_Decode
	b	.L297
	.p2align 3
.L304:
	ldr	w0, [x0, 80]
	cbnz	w0, .L297
	b	.L298
	.size	DecodeStream_MPEG4, .-DecodeStream_MPEG4
	.align	3
.LC69:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream
	.type	DecodeStream, %function
DecodeStream:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	mov	x21, x2
	bl	_mcount
	mov	w0, 6
	bl	VCTRL_RecordPosTime
	cmp	w19, 16
	bls	.L313
.L306:
	ldr	x3, .LC71
	mov	w4, w19
	ldr	x2, .LC73
	mov	w1, 1922
	add	x3, x3, 96
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 7
	bl	VCTRL_RecordPosTime
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L313:
	ldr	x0, .LC70
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx308
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx308:
	.section	.rodata
	.align	0
	.align	2
.L308:
	.byte	(.L307 - .Lrtx308) / 4
	.byte	(.L306 - .Lrtx308) / 4
	.byte	(.L309 - .Lrtx308) / 4
	.byte	(.L310 - .Lrtx308) / 4
	.byte	(.L306 - .Lrtx308) / 4
	.byte	(.L306 - .Lrtx308) / 4
	.byte	(.L306 - .Lrtx308) / 4
	.byte	(.L306 - .Lrtx308) / 4
	.byte	(.L306 - .Lrtx308) / 4
	.byte	(.L306 - .Lrtx308) / 4
	.byte	(.L306 - .Lrtx308) / 4
	.byte	(.L306 - .Lrtx308) / 4
	.byte	(.L306 - .Lrtx308) / 4
	.byte	(.L306 - .Lrtx308) / 4
	.byte	(.L306 - .Lrtx308) / 4
	.byte	(.L306 - .Lrtx308) / 4
	.byte	(.L311 - .Lrtx308) / 4
	.text
	.p2align 3
.L311:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_HEVC
	mov	w0, 7
	bl	VCTRL_RecordPosTime
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L310:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_MPEG2
	mov	w0, 7
	bl	VCTRL_RecordPosTime
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L309:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_MPEG4
	mov	w0, 7
	bl	VCTRL_RecordPosTime
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L307:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_H264
	mov	w0, 7
	bl	VCTRL_RecordPosTime
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	DecodeStream, .-DecodeStream
	.align	3
.LC70:
	.xword	.L308
	.align	3
.LC71:
	.xword	.LANCHOR1
	.align	3
.LC73:
	.xword	.LC72
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleasePacket
	.type	ReleasePacket, %function
ReleasePacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC75
	mov	w3, w19
	mov	x4, 0
	mov	w1, 2108
	mov	w0, 2
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ReleasePacket, .-ReleasePacket
	.align	3
.LC75:
	.xword	.LC74
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseCurPic_VPx
	.type	ReleaseCurPic_VPx, %function
ReleaseCurPic_VPx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC76
	mov	w3, w19
	mov	x4, 0
	mov	w1, 2167
	mov	w0, 2
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ReleaseCurPic_VPx, .-ReleaseCurPic_VPx
	.align	3
.LC76:
	.xword	.LC74
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseCurPic
	.type	ReleaseCurPic, %function
ReleaseCurPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 16
	bls	.L324
.L317:
	ldr	x2, .LC79
	mov	w3, w19
	mov	w1, 2333
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L324:
	ldr	x0, .LC77
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx319
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx319:
	.section	.rodata
	.align	0
	.align	2
.L319:
	.byte	(.L318 - .Lrtx319) / 4
	.byte	(.L317 - .Lrtx319) / 4
	.byte	(.L320 - .Lrtx319) / 4
	.byte	(.L321 - .Lrtx319) / 4
	.byte	(.L317 - .Lrtx319) / 4
	.byte	(.L317 - .Lrtx319) / 4
	.byte	(.L317 - .Lrtx319) / 4
	.byte	(.L317 - .Lrtx319) / 4
	.byte	(.L317 - .Lrtx319) / 4
	.byte	(.L317 - .Lrtx319) / 4
	.byte	(.L317 - .Lrtx319) / 4
	.byte	(.L317 - .Lrtx319) / 4
	.byte	(.L317 - .Lrtx319) / 4
	.byte	(.L317 - .Lrtx319) / 4
	.byte	(.L317 - .Lrtx319) / 4
	.byte	(.L317 - .Lrtx319) / 4
	.byte	(.L322 - .Lrtx319) / 4
	.text
	.p2align 3
.L322:
	mov	x0, x20
	bl	HEVC_ClearCurrPic
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L321:
	mov	x0, x20
	bl	MP2_ClearCurPic
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L320:
	mov	x0, x20
	bl	MP4_ClearCurPic
	mov	x0, x20
	bl	MP4_Clean_HeadPacket
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L318:
	mov	x0, x20
	bl	H264_ClearCurrPic
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ReleaseCurPic, .-ReleaseCurPic
	.align	3
.LC77:
	.xword	.L319
	.align	3
.LC79:
	.xword	.LC78
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckNewPicSegMpeg2
	.type	CheckNewPicSegMpeg2, %function
CheckNewPicSegMpeg2:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x2
	mov	w22, w0
	mov	x0, x30
	mov	x19, x1
	mov	x21, x3
	bl	_mcount
	ldrb	w4, [x20, 3]
	mov	w1, 179
	add	w0, w4, 73
	cmp	w4, wzr
	ccmp	w4, w1, 4, ne
	uxtb	w0, w0
	ccmp	w0, 1, 0, ne
	bls	.L333
	ldr	x1, .LC80
	mov	w0, -1
	ldr	x2, [x1, w22, sxtw 3]
	add	x2, x2, 217088
	ldr	x1, [x2, 3328]
	cmn	x1, #1
	bne	.L327
	ldr	w1, [x19]
	cbnz	w1, .L327
	add	w1, w4, w0
	uxtb	w1, w1
	cmp	w1, 174
	bls	.L334
.L327:
	cbnz	w4, .L328
	str	wzr, [x19]
.L328:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L333:
	ldr	w1, [x19]
	mov	w0, -1
	cbnz	w1, .L327
	mov	w0, 1
	str	w0, [x19]
	mov	w0, 0
	ldrb	w4, [x20, 3]
	b	.L327
	.p2align 3
.L334:
	ldr	x1, [x21, 32]
	str	x1, [x2, 3328]
	ldrb	w4, [x20, 3]
	b	.L327
	.size	CheckNewPicSegMpeg2, .-CheckNewPicSegMpeg2
	.align	3
.LC80:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckNewPicSegMpeg4
	.type	CheckNewPicSegMpeg4, %function
CheckNewPicSegMpeg4:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	mov	w21, w2
	bl	_mcount
	ldrb	w3, [x20, 3]
	mov	w1, 47
	mov	w0, 176
	cmp	w3, 254
	add	w4, w3, 75
	ccmp	w3, w1, 0, ne
	cset	w1, ls
	cmp	w3, 179
	ccmp	w3, w0, 4, ne
	uxtb	w4, w4
	cset	w0, eq
	cmp	w4, 1
	orr	w0, w1, w0
	cset	w1, ls
	orr	w0, w1, w0
	cbnz	w0, .L347
.L336:
	cmp	w21, 1
	bne	.L340
.L337:
	mov	w0, 1
	str	w0, [x19]
	mov	w0, 0
	ldrb	w3, [x20, 3]
.L338:
	cmp	w3, 182
	bne	.L339
	str	wzr, [x19]
.L339:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L347:
	ldr	w0, [x19]
	cbz	w0, .L337
	b	.L336
	.p2align 3
.L340:
	mov	w0, -1
	b	.L338
	.size	CheckNewPicSegMpeg4, .-CheckNewPicSegMpeg4
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckNewPicSegByVidStd
	.type	CheckNewPicSegByVidStd, %function
CheckNewPicSegByVidStd:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w23, w0
	mov	x0, x30
	mov	w19, w2
	mov	x20, x3
	mov	x21, x1
	mov	w22, w4
	bl	_mcount
	cmp	w19, 16
	ldr	x1, [x20]
	bls	.L356
.L355:
	mov	w0, -1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L356:
	ldr	x0, .LC81
	ldrb	w0, [x0,w19,uxtw]
	adr	x2, .Lrtx351
	add	x0, x2, w0, sxtb #2
	br	x0
.Lrtx351:
	.section	.rodata
	.align	0
	.align	2
.L351:
	.byte	(.L350 - .Lrtx351) / 4
	.byte	(.L355 - .Lrtx351) / 4
	.byte	(.L352 - .Lrtx351) / 4
	.byte	(.L353 - .Lrtx351) / 4
	.byte	(.L355 - .Lrtx351) / 4
	.byte	(.L355 - .Lrtx351) / 4
	.byte	(.L355 - .Lrtx351) / 4
	.byte	(.L355 - .Lrtx351) / 4
	.byte	(.L355 - .Lrtx351) / 4
	.byte	(.L355 - .Lrtx351) / 4
	.byte	(.L355 - .Lrtx351) / 4
	.byte	(.L355 - .Lrtx351) / 4
	.byte	(.L355 - .Lrtx351) / 4
	.byte	(.L355 - .Lrtx351) / 4
	.byte	(.L355 - .Lrtx351) / 4
	.byte	(.L355 - .Lrtx351) / 4
	.byte	(.L354 - .Lrtx351) / 4
	.text
	.p2align 3
.L354:
	mov	x0, x21
	bl	HEVC_IsNewPicNal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L353:
	mov	x3, x20
	mov	x2, x1
	mov	w0, w23
	mov	x1, x21
	bl	CheckNewPicSegMpeg2
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L352:
	mov	w2, w22
	mov	x0, x21
	bl	CheckNewPicSegMpeg4
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L350:
	mov	x0, x21
	bl	H264_IsNewPicNal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	CheckNewPicSegByVidStd, .-CheckNewPicSegByVidStd
	.align	3
.LC81:
	.xword	.L351
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsNewpicSeg
	.type	IsNewpicSeg, %function
IsNewpicSeg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w20, w2
	mov	x19, x3
	mov	x22, x1
	bl	_mcount
	cmp	w20, 2
	mov	w4, 0
	ldr	x0, [x19]
	beq	.L368
.L358:
	ldrb	w3, [x0]
	ldrb	w1, [x0, 1]
	ldrb	w5, [x0, 2]
	cbnz	w3, .L361
	cbnz	w1, .L361
	cmp	w5, 1
	bne	.L361
.L359:
	mov	x3, x19
	mov	w2, w20
	mov	x1, x22
	mov	w0, w21
	bl	CheckNewPicSegByVidStd
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L368:
	ldrb	w1, [x19, 80]
	and	w4, w1, 1
	tbz	x1, 0, .L358
	b	.L359
	.p2align 3
.L361:
	ldr	x2, .LC83
	mov	w4, w1
	mov	w0, 20
	mov	w1, 2569
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	IsNewpicSeg, .-IsNewpicSeg
	.align	3
.LC83:
	.xword	.LC82
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	OpenUsdPool_WithMem
	.type	OpenUsdPool_WithMem, %function
OpenUsdPool_WithMem:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x1, .LC86
	add	x1, x1, 16
	ldr	x0, [x1, w19, sxtw 3]
	cbz	x0, .L375
.L370:
	add	x1, x0, 204800
	str	wzr, [x0]
	add	x1, x1, 536
	add	x0, x0, 1048
	.p2align 2
.L372:
	stp	wzr, wzr, [x0, -4]
	add	x0, x0, 1064
	cmp	x0, x1
	bne	.L372
	mov	w0, 0
.L371:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L375:
	str	x20, [x1, w19, sxtw 3]
	cbz	x20, .L373
	mov	x0, x20
	b	.L370
.L373:
	mov	w0, -1
	b	.L371
	.size	OpenUsdPool_WithMem, .-OpenUsdPool_WithMem
	.align	3
.LC86:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CloseUsdPool_WithMem
	.type	CloseUsdPool_WithMem, %function
CloseUsdPool_WithMem:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC88
	add	x0, x0, 16
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L376
	str	xzr, [x0, w19, sxtw 3]
.L376:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CloseUsdPool_WithMem, .-CloseUsdPool_WithMem
	.align	3
.LC88:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InitUsdPool
	.type	InitUsdPool, %function
InitUsdPool:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC90
	add	x0, x0, 16
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L384
	add	x1, x0, 204800
	str	wzr, [x0]
	add	x1, x1, 536
	add	x0, x0, 1048
	.p2align 2
.L383:
	stp	wzr, wzr, [x0, -4]
	add	x0, x0, 1064
	cmp	x0, x1
	bne	.L383
	mov	w0, 0
.L382:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L384:
	mov	w0, -1
	b	.L382
	.size	InitUsdPool, .-InitUsdPool
	.align	3
.LC90:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetUsd
	.type	GetUsd, %function
GetUsd:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC92
	add	x0, x0, 16
	ldr	x3, [x0, w19, sxtw 3]
	cbz	x3, .L390
	add	x0, x3, 1048
	mov	w1, 0
	b	.L389
	.p2align 3
.L388:
	add	w1, w1, 1
	add	x0, x0, 1064
	cmp	w1, 192
	beq	.L390
.L389:
	ldr	w2, [x0]
	cbnz	w2, .L388
	ldr	w2, [x0, -4]
	cbnz	w2, .L388
	sxtw	x0, w1
	lsl	x1, x0, 7
	add	x1, x1, x0, lsl 2
	add	x0, x1, x0
	add	x1, x3, x0, lsl 3
	add	x0, x1, 8
	strb	wzr, [x1, 1034]
	strb	wzr, [x1, 1035]
	strb	wzr, [x1, 1036]
	strh	wzr, [x1, 1038]
	str	wzr, [x1, 1044]
	str	wzr, [x1, 1052]
	str	wzr, [x1, 1056]
	str	wzr, [x1, 1060]
	str	xzr, [x1, 1064]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L390:
	mov	x0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetUsd, .-GetUsd
	.align	3
.LC92:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FreeUsdByDec
	.type	FreeUsdByDec, %function
FreeUsdByDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L392
	str	wzr, [x19, 1040]
.L392:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FreeUsdByDec, .-FreeUsdByDec
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsImageInVoQueue
	.type	IsImageInVoQueue, %function
IsImageInVoQueue:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L409
	ldrh	w0, [x19, 4]
	ldrh	w4, [x19, 8]
	and	w0, w0, 63
	.p2align 2
.L408:
	cmp	w0, w4
	beq	.L402
	sxtw	x2, w0
	add	w0, w0, 1
	add	x2, x2, 2
	and	w0, w0, 63
	ldr	x2, [x19, x2, lsl 3]
	cbz	x2, .L408
	ldr	w3, [x2, 88]
	ldr	w2, [x20, 88]
	cmp	w3, w2
	bne	.L408
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L402:
	mov	w0, -1
.L399:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L409:
	ldr	x2, .LC94
	mov	w1, 2680
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L399
	.size	IsImageInVoQueue, .-IsImageInVoQueue
	.align	3
.LC94:
	.xword	.LC10
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SetAspectRatio
	.type	SetAspectRatio, %function
SetAspectRatio:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, 5
	bls	.L420
	ldr	x2, .LC97
	mov	w3, w20
	mov	w0, 1
	mov	w1, 2743
	stp	wzr, w0, [x19, 56]
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L420:
	ldr	x0, .LC95
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx413
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx413:
	.section	.rodata
	.align	0
	.align	2
.L413:
	.byte	(.L412 - .Lrtx413) / 4
	.byte	(.L414 - .Lrtx413) / 4
	.byte	(.L415 - .Lrtx413) / 4
	.byte	(.L416 - .Lrtx413) / 4
	.byte	(.L417 - .Lrtx413) / 4
	.byte	(.L418 - .Lrtx413) / 4
	.text
	.p2align 3
.L417:
	mov	w1, 235
	mov	w0, 100
	stp	w1, w0, [x19, 56]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L418:
	mov	w0, 2
	stp	wzr, w0, [x19, 56]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L412:
	mov	w0, 1
	stp	wzr, w0, [x19, 56]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L414:
	mov	w1, 4
	mov	w0, 3
	stp	w1, w0, [x19, 56]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L415:
	mov	w1, 16
	mov	w0, 9
	stp	w1, w0, [x19, 56]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L416:
	mov	w1, 221
	mov	w0, 100
	stp	w1, w0, [x19, 56]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SetAspectRatio, .-SetAspectRatio
	.align	3
.LC95:
	.xword	.L413
	.align	3
.LC97:
	.xword	.LC96
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetVoLastImageID
	.type	GetVoLastImageID, %function
GetVoLastImageID:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 552]
	ldr	x19, [sp, 16]
	cmp	w0, 1
	csinv	w0, w0, wzr, hi
	ldp	x29, x30, [sp], 32
	ret
	.size	GetVoLastImageID, .-GetVoLastImageID
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsMain10Profile
	.type	IsMain10Profile, %function
IsMain10Profile:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 304]
	cmp	w1, 1
	beq	.L427
	ldr	w2, [x19, 308]
	mov	w0, 0
	cmp	w2, 1
	beq	.L430
	cmp	w1, 2
	ldr	w1, [x19, 312]
	beq	.L429
	cmp	w1, 1
	cset	w0, eq
.L426:
	cmp	w1, 1
	cset	w1, eq
	orr	w0, w1, w0
.L430:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L427:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L429:
	mov	w0, 1
	b	.L426
	.size	IsMain10Profile, .-IsMain10Profile
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsPtsRewind
	.type	IsPtsRewind, %function
IsPtsRewind:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	x19, x1
	mov	x20, x2
	bl	_mcount
	sub	x19, x19, x20
	ldr	x0, .LC98
	ldr	x0, [x0, w21, sxtw 3]
	add	x0, x0, 217088
	ldr	w0, [x0, 3156]
	cbnz	w0, .L435
	mov	x0, 16000
	ldr	x21, [sp, 32]
	cmp	x19, x0
	cset	w0, hi
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L435:
	mov	x0, 9216
	ldr	x21, [sp, 32]
	movk	x0, 0xf4, lsl 16
	cmp	x19, x0
	cset	w0, hi
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	IsPtsRewind, .-IsPtsRewind
	.align	3
.LC98:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MetadataMapToSec
	.type	MetadataMapToSec, %function
MetadataMapToSec:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.size	MetadataMapToSec, .-MetadataMapToSec
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MetadataUnMapToSec
	.type	MetadataUnMapToSec, %function
MetadataUnMapToSec:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.size	MetadataUnMapToSec, .-MetadataUnMapToSec
	.global	pstVdecUsdPool
	.section	.rodata
	.align	3
.LANCHOR1 = . + 0
	.type	__FUNCTION__.7959, %object
	.size	__FUNCTION__.7959, 19
__FUNCTION__.7959:
	.string	"InsertImgToVoQueue"
	.zero	5
	.type	__func__.7995, %object
	.size	__func__.7995, 20
__func__.7995:
	.string	"SYNTAX_MarkImageEos"
	.zero	4
	.type	__func__.8002, %object
	.size	__func__.8002, 20
__func__.8002:
	.string	"SYNTAX_ReceiveImage"
	.zero	4
	.type	__func__.8034, %object
	.size	__func__.8034, 20
__func__.8034:
	.string	"SYNTAX_ReleaseImage"
	.zero	4
	.type	__func__.8085, %object
	.size	__func__.8085, 13
__func__.8085:
	.string	"DecodeStream"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	ASCII(.string	"Initializing VO queue\n" )
	.zero	1
.LC3:
	ASCII(.string	"ResetVoQueue but still remain image not output(head:%d, tail:%d).\n" )
	.zero	5
.LC7:
	ASCII(.string	"Chan:%d out_pts: %lld -> %lld Usertag %lld\n" )
	.zero	4
.LC10:
	ASCII(.string	"image point NULL\n" )
	.zero	6
.LC12:
	ASCII(.string	"call InsertVOQueue\n" )
	.zero	4
.LC15:
	ASCII(.string	"FATAL: p_image(id=%d) has already in the VoQueue!\n" )
	.zero	5
.LC17:
	ASCII(.string	"error=%d,W=%d,H=%d,not acceptable!\n" )
	.zero	4
.LC20:
	ASCII(.string	"Queue=(%02d,%02d,%02d) + F%d\n" )
	.zero	2
.LC33:
	ASCII(.string	"%s: Get image ptr err! Tail:%d\n" )
.LC37:
	ASCII(.string	"%s, pstVoQue is NULL!!!\n" )
	.zero	7
.LC40:
	ASCII(.string	"Queue=(%02d,%02d,%02d) - F%d\n" )
	.zero	2
.LC43:
	ASCII(.string	"SYNTAX_ReleaseImage p_image is null\n" )
	.zero	3
.LC49:
	ASCII(.string	"Image(id %d) not found in vo queue(magic word %d), no need to deal with.Phyaddr = 0x%x\n" )
.LC51:
	ASCII(.string	"image[%d] null\n" )
.LC53:
	ASCII(.string	"Queue=(%02d,%02d,%02d) x F%d\n" )
	.zero	2
.LC55:
	ASCII(.string	"%s call SYNTAX_ReleaseImage_RecycleImage failed.\n" )
	.zero	6
.LC61:
	ASCII(.string	"pSegMan error!\n" )
.LC65:
	ASCII(.string	"More than two packet!!!ERROR!!!\n" )
	.zero	7
.LC72:
	ASCII(.string	"%s unsupport standard %d\n" )
	.zero	6
.LC74:
	ASCII(.string	"%s not support VidStd %d, pSegMan %p not used.\n" )
.LC78:
	ASCII(.string	"VidStd=%d Error!\n" )
	.zero	6
.LC82:
	ASCII(.string	"pu8[0] = %x,pu8[1] = %x, pu8[2] = %x\n" )
	.zero	2
.LC96:
	ASCII(.string	"WARNNING: aspect ration (%d) is not expected!\n" )
	.bss
	.align	3
.LANCHOR0 = . + 0
	.type	last_rec_pos_time.7956, %object
	.size	last_rec_pos_time.7956, 16
last_rec_pos_time.7956:
	.zero	16
	.type	pstVdecUsdPool, %object
	.size	pstVdecUsdPool, 32
pstVdecUsdPool:
	.zero	32
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
