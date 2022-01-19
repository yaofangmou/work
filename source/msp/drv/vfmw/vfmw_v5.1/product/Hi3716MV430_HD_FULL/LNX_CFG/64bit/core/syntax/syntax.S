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
	cmp	w19, 20
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
	.byte	(.L9 - .Lrtx8) / 4
	.byte	(.L10 - .Lrtx8) / 4
	.byte	(.L11 - .Lrtx8) / 4
	.byte	(.L12 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L13 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L14 - .Lrtx8) / 4
	.byte	(.L14 - .Lrtx8) / 4
	.byte	(.L14 - .Lrtx8) / 4
	.byte	(.L15 - .Lrtx8) / 4
	.byte	(.L12 - .Lrtx8) / 4
	.byte	(.L16 - .Lrtx8) / 4
	.byte	(.L17 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L5 - .Lrtx8) / 4
	.byte	(.L18 - .Lrtx8) / 4
	.text
	.p2align 3
.L18:
	ldr	w1, [x21, 88]
	mov	x0, x20
	bl	VCTRL_USERDEC_RecycleFrameBuffer
.L5:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L7:
	ldr	w1, [x21, 88]
	mov	x0, x20
	bl	H264DEC_RecycleImage
	b	.L5
	.p2align 3
.L9:
	ldr	w1, [x21, 88]
	mov	x0, x20
	bl	VC1DEC_RecycleImage
	b	.L5
	.p2align 3
.L10:
	ldr	w1, [x21, 88]
	mov	x0, x20
	bl	MPEG4DEC_RecycleImage
	b	.L5
	.p2align 3
.L11:
	ldr	w1, [x21, 88]
	mov	x0, x20
	bl	MPEG2DEC_RecycleImage
	b	.L5
	.p2align 3
.L12:
	ldr	w1, [x21, 88]
	mov	x0, x20
	bl	H263DEC_RecycleImage
	b	.L5
	.p2align 3
.L13:
	ldr	w1, [x21, 88]
	mov	x0, x20
	bl	AVSDEC_RecycleImage
	b	.L5
	.p2align 3
.L14:
	ldr	w1, [x21, 88]
	mov	x0, x20
	bl	VP6DEC_RecycleImage
	b	.L5
	.p2align 3
.L15:
	ldr	w1, [x21, 88]
	mov	x0, x20
	bl	VP8DEC_RecycleImage
	b	.L5
	.p2align 3
.L16:
	ldr	w1, [x21, 88]
	mov	x0, x20
	bl	MVC_DEC_RecycleImage
	b	.L5
	.p2align 3
.L17:
	ldr	w1, [x21, 88]
	mov	x0, x20
	bl	HEVC_DECRecycleImage
	b	.L5
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
	beq	.L20
	ldr	x2, [x21, 584]
	sub	w19, w19, #8
	sub	x1, x0, x2
	cmp	x1, 5
	ccmn	x2, #1, 4, ls
	beq	.L30
	cmp	w19, 1
	mov	x0, -1
	bls	.L22
.L20:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L30:
	cmp	w19, 1
	bhi	.L20
	ldrb	w1, [x20, 156]
	and	w1, w1, 3
	cmp	w1, 2
	bne	.L20
.L22:
	mov	x0, -1
	str	x0, [x20, 200]
	b	.L20
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
	beq	.L35
	ldr	x0, [x22, 584]
	sub	w20, w20, #8
	sub	x1, x5, x0
	cmp	x1, 5
	ccmn	x0, #1, 4, ls
	beq	.L41
	cmp	w20, 1
	bls	.L34
	mov	x4, x5
	mov	x5, -1
.L32:
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
.L41:
	cmp	w20, 1
	mov	x4, x5
	bhi	.L32
	ldrb	w0, [x19, 156]
	and	w0, w0, 3
	cmp	w0, 2
	bne	.L32
.L34:
	mov	x4, -1
	str	x4, [x19, 200]
	mov	x5, x4
	b	.L32
	.p2align 3
.L35:
	mov	x4, x5
	b	.L32
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
	cbz	w0, .L43
	ldr	w0, [x19, 44]
	cbnz	w0, .L68
.L43:
	ldp	w1, w0, [x19, 32]
	stp	w1, w0, [x19, 40]
	lsr	w2, w1, 1
	lsr	w0, w0, 1
	str	w2, [x19, 48]
	str	w0, [x19, 52]
.L44:
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
	beq	.L45
	str	w2, [x20, 48]
.L45:
	ldr	w1, [x20, 44]
	add	w2, w1, 1
	str	w2, [x20, 44]
	str	w1, [x19, 104]
	ldr	w1, [x24, 528]
	cmp	w26, w1
	beq	.L46
	ldr	x2, .LC9
	ldr	x4, [x2]
	cbz	x4, .L47
	strb	w1, [x29, 104]
	mov	w3, 2
	strb	w0, [x29, 105]
	add	x2, x29, 104
	mov	w1, 6
	mov	w0, w23
	blr	x4
.L47:
	str	w26, [x24, 528]
.L46:
	ldr	w0, [x20, 4]
	cmp	w25, w0
	beq	.L48
	ldr	x0, .LC9
	ldr	x4, [x0]
	cbz	x4, .L49
	add	x2, x29, 112
	mov	w3, 1
	mov	w1, 3
	mov	w0, w23
	strb	w27, [x2, -8]!
	blr	x4
.L49:
	str	w25, [x20, 4]
.L48:
	ldr	w0, [x20, 16]
	cmp	w21, w0
	beq	.L69
.L50:
	ldr	x0, .LC9
	stp	w21, w22, [x20, 16]
	ldr	x4, [x0]
	cbz	x4, .L42
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
.L42:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L68:
	ldr	w1, [x19, 32]
	b	.L44
	.p2align 3
.L69:
	ldr	w0, [x20, 20]
	cmp	w22, w0
	bne	.L50
	b	.L42
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
	cbz	x26, .L105
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
	beq	.L77
	ldr	x25, .LC16
	mov	w21, 1000
	b	.L103
	.p2align 3
.L76:
	add	w19, w19, 1
	and	w19, w19, 63
	cmp	w19, w2
	beq	.L77
.L103:
	sxtw	x0, w19
	ldr	w1, [x26, 88]
	add	x0, x0, 2
	ldr	x0, [x27, x0, lsl 3]
	ldr	w3, [x0, 88]
	cmp	w3, w1
	bne	.L76
	mov	x2, x25
	mov	w1, 431
	mov	w0, 0
	add	w19, w19, 1
	and	w19, w19, 63
	bl	dprint_normal
	str	w21, [x26, 96]
	ldrh	w2, [x27, 8]
	cmp	w19, w2
	bne	.L103
	.p2align 2
.L77:
	ldr	w3, [x26, 96]
	cmp	w3, 100
	bhi	.L106
	ldp	w4, w5, [x26, 32]
	cmp	w4, 31
	bhi	.L107
.L79:
	ldr	x2, .LC18
	mov	w1, 438
	mov	w0, 0
	bl	dprint_normal
	ldr	w0, [x26, 96]
	cmp	w0, 1000
	beq	.L82
	mov	x2, x26
	mov	x1, x24
	mov	w0, w23
	bl	ReturnImageToSyntax
.L82:
	ldr	x1, [x20, 32]
	mov	w0, 2
	blr	x1
	mov	w0, 1
.L72:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L107:
	cmp	w5, 31
	bls	.L79
	ldr	x24, .LC19
	cmp	w23, 20
	str	w23, [x26, 148]
	ldr	x0, [x24, w22, sxtw 3]
	add	x0, x0, 217088
	beq	.L108
.L84:
	ldr	w0, [x0, 3932]
	cbnz	w0, .L85
	str	wzr, [x26, 144]
.L85:
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
	cbz	w0, .L109
.L86:
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
	cbz	x4, .L87
	mov	w3, 0
	mov	x2, x26
	mov	w1, 4
	mov	w0, w22
	blr	x4
.L87:
	mov	w0, 8
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L110
.L89:
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
	bls	.L72
	ldr	w0, [x21, 4]
	cbz	w0, .L91
	mov	w3, 10000
	mul	w0, w0, w3
	udiv	w1, w0, w1
	str	w1, [x21, 8]
.L91:
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
.L106:
	ldp	w4, w5, [x26, 32]
	b	.L79
.L110:
	ldr	x0, [x20]
	blr	x0
	mov	w4, w0
	ldr	x3, .LC24
	ldr	x1, .LC25
	ldr	w0, [x3, w22, sxtw 2]
	ldr	w1, [x1]
	sub	w0, w4, w0
	cmp	w0, w1
	bls	.L89
	lsl	w2, w22, 24
	ldr	x0, .LC26
	add	w2, w2, 524288
	mov	w1, 523
	str	w4, [x3, w22, sxtw 2]
	bl	DBG_AddTrace
	b	.L89
.L109:
	ldr	x0, [x20]
	blr	x0
	str	w0, [x21, 32]
	b	.L86
.L108:
	ldr	w1, [x0, 3860]
	str	w1, [x26, 496]
	b	.L84
.L105:
	ldr	x2, .LC11
	mov	w1, 412
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -2
	b	.L72
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
	bcc	.L112
	sub	w3, w0, w3
.L113:
	ldrh	w4, [x19, 8]
	cmp	w0, w4
	bls	.L116
	add	w4, w4, 64
.L116:
	str	w3, [x21]
	sub	w0, w4, w0
	str	w0, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L112:
	add	w1, w0, 64
	sub	w3, w1, w3
	b	.L113
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
	cmp	w0, 20
	bls	.L132
.L131:
	mov	x0, 0
	b	.L118
	.p2align 3
.L132:
	ldr	x1, .LC27
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx120
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx120:
	.section	.rodata
	.align	0
	.align	2
.L120:
	.byte	(.L130 - .Lrtx120) / 4
	.byte	(.L121 - .Lrtx120) / 4
	.byte	(.L122 - .Lrtx120) / 4
	.byte	(.L123 - .Lrtx120) / 4
	.byte	(.L124 - .Lrtx120) / 4
	.byte	(.L131 - .Lrtx120) / 4
	.byte	(.L125 - .Lrtx120) / 4
	.byte	(.L131 - .Lrtx120) / 4
	.byte	(.L131 - .Lrtx120) / 4
	.byte	(.L131 - .Lrtx120) / 4
	.byte	(.L126 - .Lrtx120) / 4
	.byte	(.L126 - .Lrtx120) / 4
	.byte	(.L126 - .Lrtx120) / 4
	.byte	(.L127 - .Lrtx120) / 4
	.byte	(.L124 - .Lrtx120) / 4
	.byte	(.L128 - .Lrtx120) / 4
	.byte	(.L129 - .Lrtx120) / 4
	.byte	(.L131 - .Lrtx120) / 4
	.byte	(.L131 - .Lrtx120) / 4
	.byte	(.L131 - .Lrtx120) / 4
	.byte	(.L130 - .Lrtx120) / 4
	.text
	.p2align 3
.L130:
	add	x0, x19, 16
.L118:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L121:
	add	x19, x19, 49152
	add	x0, x19, 3688
	b	.L118
	.p2align 3
.L124:
	add	x19, x19, 20480
	add	x0, x19, 2192
	b	.L118
	.p2align 3
.L125:
	add	x19, x19, 12288
	add	x0, x19, 3928
	b	.L118
	.p2align 3
.L128:
	add	x0, x19, 920
	b	.L118
	.p2align 3
.L129:
	add	x19, x19, 8192
	add	x0, x19, 184
	b	.L118
	.p2align 3
.L126:
	add	x19, x19, 12288
	add	x0, x19, 456
	b	.L118
	.p2align 3
.L127:
	add	x19, x19, 8192
	add	x0, x19, 24
	b	.L118
	.p2align 3
.L122:
	add	x19, x19, 20480
	add	x0, x19, 2168
	b	.L118
	.p2align 3
.L123:
	add	x19, x19, 81920
	add	x0, x19, 136
	b	.L118
	.size	SYNTAX_GetVoQue, .-SYNTAX_GetVoQue
	.align	3
.LC27:
	.xword	.L120
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
	mov	w21, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	mov	x0, x19
	bl	SYNTAX_GetVoQue
	mov	x20, x0
	cbz	x0, .L139
	ldr	x22, .LC28
	mov	w0, 2
	ldr	x1, [x22, 24]
	blr	x1
	ldrh	w19, [x20, 4]
	ldrh	w3, [x20, 6]
	and	w19, w19, 63
	cmp	w19, w3
	beq	.L137
	.p2align 2
.L142:
	sxtw	x1, w19
	mov	w0, w21
	add	x1, x1, 2
	ldr	x2, [x20, x1, lsl 3]
	mov	x1, x2
	cbz	x2, .L136
	bl	FSP_MarkImageOutHanging
	ldrh	w3, [x20, 6]
.L136:
	add	w19, w19, 1
	and	w19, w19, 63
	cmp	w19, w3
	bne	.L142
.L137:
	ldr	x1, [x22, 32]
	mov	w0, 2
	blr	x1
	mov	w0, 1
.L134:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L139:
	mov	w0, -2
	b	.L134
	.size	SYNTAX_MarkImageOutHanging, .-SYNTAX_MarkImageOutHanging
	.align	3
.LC28:
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
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	mov	x0, x19
	bl	SYNTAX_GetVoQue
	mov	x19, x0
	cbz	x0, .L152
	ldr	x20, .LC29
	mov	w0, 2
	ldr	x1, [x20, 24]
	blr	x1
	ldrh	w0, [x19, 6]
	ldrh	w1, [x19, 8]
	cmp	w0, w1
	bls	.L157
	add	w2, w1, 64
	sub	w0, w2, w0
	cmp	w0, wzr
	ble	.L148
.L159:
	mov	w0, 63
	cbz	w1, .L149
	sub	w1, w1, #1
	uxth	w0, w1
.L149:
	sxtw	x1, w0
	add	x1, x1, 2
	ldr	x1, [x19, x1, lsl 3]
	cbz	x1, .L158
	ldr	x2, [x20, 32]
	mov	w3, 1
	mov	w0, 2
	str	w3, [x1, 108]
	mov	w20, 0
	blr	x2
.L156:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L157:
	sub	w0, w1, w0
	cmp	w0, wzr
	bgt	.L159
.L148:
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
	.p2align 3
.L152:
	mov	w20, -1
	b	.L156
.L158:
	ldr	x1, [x20, 32]
	mov	w0, 2
	mov	w20, -1
	blr	x1
	ldr	x3, .LC30
	mov	w1, 743
	ldrh	w4, [x19, 8]
	mov	w0, 1
	ldr	x2, .LC32
	add	x3, x3, 24
	bl	dprint_normal
	b	.L156
	.size	SYNTAX_MarkImageEos, .-SYNTAX_MarkImageEos
	.align	3
.LC29:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC30:
	.xword	.LANCHOR1
	.align	3
.LC32:
	.xword	.LC31
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
	beq	.L164
	mov	x0, x19
	bl	SYNTAX_GetVoQue
	mov	x19, x0
	cbz	x0, .L166
	ldr	x22, .LC36
	mov	w0, 2
	mov	w21, -3
	ldr	x1, [x22, 24]
	blr	x1
	ldrh	w0, [x19, 6]
	ldrh	w1, [x19, 8]
	cmp	w1, w0
	beq	.L163
	add	x1, x0, 2
	ldr	x3, [x22, 104]
	mov	x2, 536
	mov	x0, x20
	ldr	x21, [x20, 160]
	ldr	x1, [x19, x1, lsl 3]
	blr	x3
	str	x21, [x20, 160]
	ldr	x2, .LC38
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
.L163:
	ldr	x1, [x22, 32]
	mov	w0, 2
	blr	x1
	mov	w0, w21
.L161:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L164:
	mov	w0, -2
	b	.L161
.L166:
	ldr	x3, .LC33
	mov	w1, 774
	ldr	x2, .LC35
	mov	w0, 1
	add	x3, x3, 48
	bl	dprint_normal
	mov	w0, -2
	b	.L161
	.size	SYNTAX_ReceiveImage, .-SYNTAX_ReceiveImage
	.align	3
.LC33:
	.xword	.LANCHOR1
	.align	3
.LC35:
	.xword	.LC34
	.align	3
.LC36:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC38:
	.xword	.LC37
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
	cmp	w0, 16
	bls	.L181
.L168:
	cmn	w19, #2
	beq	.L179
	cmp	w19, 1
	mov	w0, -20
	csinc	w0, w0, wzr, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L181:
	ldr	x1, .LC39
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx170
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx170:
	.section	.rodata
	.align	0
	.align	2
.L170:
	.byte	(.L171 - .Lrtx170) / 4
	.byte	(.L168 - .Lrtx170) / 4
	.byte	(.L168 - .Lrtx170) / 4
	.byte	(.L168 - .Lrtx170) / 4
	.byte	(.L171 - .Lrtx170) / 4
	.byte	(.L168 - .Lrtx170) / 4
	.byte	(.L168 - .Lrtx170) / 4
	.byte	(.L168 - .Lrtx170) / 4
	.byte	(.L168 - .Lrtx170) / 4
	.byte	(.L168 - .Lrtx170) / 4
	.byte	(.L168 - .Lrtx170) / 4
	.byte	(.L168 - .Lrtx170) / 4
	.byte	(.L168 - .Lrtx170) / 4
	.byte	(.L168 - .Lrtx170) / 4
	.byte	(.L171 - .Lrtx170) / 4
	.byte	(.L171 - .Lrtx170) / 4
	.byte	(.L171 - .Lrtx170) / 4
	.text
	.p2align 3
.L171:
	mov	w0, -20
	cmp	w19, wzr
	csinc	w0, w0, wzr, ne
.L174:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L179:
	mov	w0, w19
	b	.L174
	.size	SYNTAX_ReleaseImage_RecycleImage_CheckRet, .-SYNTAX_ReleaseImage_RecycleImage_CheckRet
	.align	3
.LC39:
	.xword	.L170
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
	cmp	w0, 20
	bls	.L197
.L196:
	mov	w1, -2
	b	.L183
	.p2align 3
.L197:
	ldr	x1, .LC40
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx185
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx185:
	.section	.rodata
	.align	0
	.align	2
.L185:
	.byte	(.L184 - .Lrtx185) / 4
	.byte	(.L186 - .Lrtx185) / 4
	.byte	(.L187 - .Lrtx185) / 4
	.byte	(.L188 - .Lrtx185) / 4
	.byte	(.L189 - .Lrtx185) / 4
	.byte	(.L196 - .Lrtx185) / 4
	.byte	(.L190 - .Lrtx185) / 4
	.byte	(.L196 - .Lrtx185) / 4
	.byte	(.L196 - .Lrtx185) / 4
	.byte	(.L196 - .Lrtx185) / 4
	.byte	(.L191 - .Lrtx185) / 4
	.byte	(.L191 - .Lrtx185) / 4
	.byte	(.L191 - .Lrtx185) / 4
	.byte	(.L192 - .Lrtx185) / 4
	.byte	(.L189 - .Lrtx185) / 4
	.byte	(.L193 - .Lrtx185) / 4
	.byte	(.L194 - .Lrtx185) / 4
	.byte	(.L196 - .Lrtx185) / 4
	.byte	(.L196 - .Lrtx185) / 4
	.byte	(.L196 - .Lrtx185) / 4
	.byte	(.L195 - .Lrtx185) / 4
	.text
	.p2align 3
.L184:
	ldr	w1, [x20, 88]
	add	x0, x19, 8
	bl	H264DEC_RecycleImage
	mov	w1, w0
.L183:
	mov	x0, x19
	bl	SYNTAX_ReleaseImage_RecycleImage_CheckRet
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L186:
	ldr	w1, [x20, 88]
	add	x0, x19, 8
	bl	VC1DEC_RecycleImage
	mov	w1, w0
	b	.L183
	.p2align 3
.L187:
	ldr	w1, [x20, 88]
	add	x0, x19, 8
	bl	MPEG4DEC_RecycleImage
	mov	w1, w0
	b	.L183
	.p2align 3
.L188:
	ldr	w1, [x20, 88]
	add	x0, x19, 8
	bl	MPEG2DEC_RecycleImage
	mov	w1, w0
	b	.L183
	.p2align 3
.L189:
	ldr	w1, [x20, 88]
	add	x0, x19, 8
	bl	H263DEC_RecycleImage
	mov	w1, w0
	b	.L183
	.p2align 3
.L190:
	ldr	w1, [x20, 88]
	add	x0, x19, 8
	bl	AVSDEC_RecycleImage
	mov	w1, w0
	b	.L183
	.p2align 3
.L191:
	ldr	w1, [x20, 88]
	add	x0, x19, 8
	bl	VP6DEC_RecycleImage
	mov	w1, w0
	b	.L183
	.p2align 3
.L192:
	ldr	w1, [x20, 88]
	add	x0, x19, 8
	bl	VP8DEC_RecycleImage
	mov	w1, w0
	b	.L183
	.p2align 3
.L193:
	ldr	w1, [x20, 88]
	add	x0, x19, 8
	bl	MVC_DEC_RecycleImage
	mov	w1, w0
	b	.L183
	.p2align 3
.L194:
	ldr	w1, [x20, 88]
	add	x0, x19, 8
	bl	HEVC_DECRecycleImage
	mov	w1, w0
	b	.L183
	.p2align 3
.L195:
	ldr	w1, [x20, 88]
	add	x0, x19, 8
	bl	VCTRL_USERDEC_RecycleFrameBuffer
	mov	w1, w0
	b	.L183
	.size	SYNTAX_ReleaseImage_RecycleImage, .-SYNTAX_ReleaseImage_RecycleImage
	.align	3
.LC40:
	.xword	.L185
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
	beq	.L223
	mov	x0, x22
	bl	SYNTAX_GetVoQue
	mov	x21, x0
	cbz	x0, .L224
	ldr	x23, .LC45
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
	beq	.L210
	ldr	x24, .LC49
	b	.L218
	.p2align 3
.L206:
	add	w20, w20, 1
	and	w20, w20, 63
	cmp	w20, w1
	beq	.L225
.L218:
	sxtw	x19, w20
	add	x0, x19, 2
	ldr	x0, [x21, x0, lsl 3]
	cbz	x0, .L204
	ldr	w0, [x0, 88]
	cmp	w26, w0
	bne	.L206
	mov	w5, 1
.L205:
	ldrh	w4, [x21, 4]
	b	.L208
	.p2align 3
.L213:
	mov	w20, w1
.L208:
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
	bne	.L213
	ldr	w0, [x25, 88]
	cmp	w5, 1
	ldr	w1, [x21, 600]
	sub	w0, w0, w1
	str	w0, [x25, 88]
	ldrh	w3, [x21, 4]
	add	w3, w3, 1
	and	w3, w3, 63
	strh	w3, [x21, 4]
	beq	.L221
	ldrh	w1, [x21, 6]
	add	w20, w20, 1
	and	w20, w20, 63
	cmp	w20, w1
	bne	.L218
.L225:
	ldr	w4, [x21, 600]
	ldr	w3, [x25, 88]
.L210:
	ldr	x2, .LC47
	mov	w1, 1014
	ldr	w5, [x25, 444]
	mov	w0, 1
	mov	w19, -2
	bl	dprint_normal
.L203:
	ldr	x1, [x23, 32]
	mov	w0, 2
	blr	x1
	mov	w0, w19
.L200:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L204:
	mov	w3, w20
	mov	x2, x24
	mov	w1, 1032
	mov	w0, 1
	bl	dprint_normal
	mov	w5, 2
	b	.L205
.L221:
	ldrh	w5, [x21, 8]
	mov	w1, 1058
	ldrh	w4, [x21, 6]
	mov	w0, 10
	ldr	x2, .LC51
	ldr	w6, [x25, 88]
	bl	dprint_normal
	mov	x1, x25
	mov	x0, x22
	bl	SYNTAX_ReleaseImage_RecycleImage
	cmp	w0, 1
	mov	w19, w0
	beq	.L203
	ldr	x3, .LC43
	mov	w1, 1063
	ldr	x2, .LC53
	mov	w0, 0
	add	x3, x3, 72
	bl	dprint_normal
	b	.L203
.L223:
	ldr	x2, .LC42
	mov	w1, 992
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -2
	b	.L200
.L224:
	ldr	x3, .LC43
	mov	w1, 1000
	ldr	x2, .LC44
	mov	w0, 1
	add	x3, x3, 72
	bl	dprint_normal
	mov	w0, -2
	b	.L200
	.size	SYNTAX_ReleaseImage, .-SYNTAX_ReleaseImage
	.align	3
.LC42:
	.xword	.LC41
	.align	3
.LC43:
	.xword	.LANCHOR1
	.align	3
.LC44:
	.xword	.LC34
	.align	3
.LC45:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC47:
	.xword	.LC46
	.align	3
.LC49:
	.xword	.LC48
	.align	3
.LC51:
	.xword	.LC50
	.align	3
.LC53:
	.xword	.LC52
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
	bls	.L242
.L241:
	mov	w0, -2
	b	.L227
	.p2align 3
.L242:
	ldr	x1, .LC54
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx229
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx229:
	.section	.rodata
	.align	0
	.align	2
.L229:
	.byte	(.L239 - .Lrtx229) / 4
	.byte	(.L230 - .Lrtx229) / 4
	.byte	(.L231 - .Lrtx229) / 4
	.byte	(.L232 - .Lrtx229) / 4
	.byte	(.L233 - .Lrtx229) / 4
	.byte	(.L241 - .Lrtx229) / 4
	.byte	(.L234 - .Lrtx229) / 4
	.byte	(.L241 - .Lrtx229) / 4
	.byte	(.L241 - .Lrtx229) / 4
	.byte	(.L241 - .Lrtx229) / 4
	.byte	(.L235 - .Lrtx229) / 4
	.byte	(.L235 - .Lrtx229) / 4
	.byte	(.L235 - .Lrtx229) / 4
	.byte	(.L236 - .Lrtx229) / 4
	.byte	(.L233 - .Lrtx229) / 4
	.byte	(.L237 - .Lrtx229) / 4
	.byte	(.L238 - .Lrtx229) / 4
	.byte	(.L241 - .Lrtx229) / 4
	.byte	(.L241 - .Lrtx229) / 4
	.byte	(.L241 - .Lrtx229) / 4
	.byte	(.L239 - .Lrtx229) / 4
	.text
	.p2align 3
.L239:
	add	x19, x19, 16
	.p2align 2
.L240:
	ldr	x20, .LC55
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
.L227:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L230:
	add	x19, x19, 49152
	add	x19, x19, 3688
	b	.L240
	.p2align 3
.L233:
	add	x19, x19, 20480
	add	x19, x19, 2192
	b	.L240
	.p2align 3
.L234:
	add	x19, x19, 12288
	add	x19, x19, 3928
	b	.L240
	.p2align 3
.L237:
	add	x19, x19, 920
	b	.L240
	.p2align 3
.L238:
	add	x19, x19, 8192
	add	x19, x19, 184
	b	.L240
	.p2align 3
.L235:
	add	x19, x19, 12288
	add	x19, x19, 456
	b	.L240
	.p2align 3
.L236:
	add	x19, x19, 8192
	add	x19, x19, 24
	b	.L240
	.p2align 3
.L231:
	add	x19, x19, 20480
	add	x19, x19, 2168
	b	.L240
	.p2align 3
.L232:
	add	x19, x19, 81920
	add	x19, x19, 136
	b	.L240
	.size	SYNTAX_ReturnImage, .-SYNTAX_ReturnImage
	.align	3
.LC54:
	.xword	.L229
	.align	3
.LC55:
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
	beq	.L247
	strb	wzr, [x19, 1]
	ldr	x0, .LC56
	ldrsw	x2, [x1, 1140]
	ldr	x0, [x0, x2, lsl 3]
	add	x0, x0, 221184
	strb	wzr, [x0, 96]
	ldr	x0, [x20, 616]
	cbz	x0, .L248
.L243:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L247:
	mov	w2, 1
	strb	w2, [x19, 1]
	ldr	x0, .LC56
	ldrsw	x3, [x1, 1140]
	ldr	x0, [x0, x3, lsl 3]
	add	x0, x0, 221184
	strb	w2, [x0, 96]
	ldr	x0, [x20, 616]
	cbnz	x0, .L243
.L248:
	add	x20, x20, 12288
	ldrb	w0, [x20, 2640]
	cmp	w0, 1
	bne	.L243
	ldr	w0, [x1, 1140]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x20, 2640]
	b	.L243
	.size	DecodeStream_H264, .-DecodeStream_H264
	.align	3
.LC56:
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
	beq	.L250
	ldrb	w0, [x20, 7]
	cbz	w0, .L251
.L250:
	mov	w1, 1
	strb	w1, [x19, 1]
	ldr	x0, .LC57
	ldrsw	x2, [x20, 248]
	ldr	x0, [x0, x2, lsl 3]
	add	x0, x0, 221184
	strb	w1, [x0, 96]
	ldr	x0, [x20, 2480]
	cbz	x0, .L257
.L249:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L251:
	strb	wzr, [x19, 1]
	ldr	x0, .LC57
	ldrsw	x1, [x20, 248]
	ldr	x0, [x0, x1, lsl 3]
	add	x0, x0, 221184
	strb	wzr, [x0, 96]
	ldr	x0, [x20, 2480]
	cbnz	x0, .L249
.L257:
	ldrb	w0, [x20, 9]
	cmp	w0, 1
	bne	.L249
	ldr	w0, [x20, 248]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x20, 9]
	b	.L249
	.size	DecodeStream_HEVC, .-DecodeStream_HEVC
	.align	3
.LC57:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_MVC
	.type	DecodeStream_MVC, %function
DecodeStream_MVC:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldrb	w3, [x19, 18]
	add	x1, x29, 40
	ldp	w5, w4, [x19, 24]
	ldr	w2, [x19, 32]
	mov	x0, x20
	ldr	x6, [x19, 8]
	ldr	x7, [x19, 40]
	strb	w3, [x29, 40]
	str	x6, [x29, 48]
	stp	w5, w4, [x29, 56]
	str	w2, [x29, 64]
	str	x7, [x29, 72]
	bl	MVC_DEC_DecodePacket
	cmn	w0, #2
	beq	.L262
	strb	wzr, [x19, 1]
	ldr	x0, [x20, 232]
	cbz	x0, .L263
.L258:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L262:
	mov	w0, 1
	strb	w0, [x19, 1]
	ldr	x0, [x20, 232]
	cbnz	x0, .L258
.L263:
	ldrb	w0, [x20, 1]
	cmp	w0, 1
	bne	.L258
	ldr	w0, [x20, 120]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x20, 1]
	b	.L258
	.size	DecodeStream_MVC, .-DecodeStream_MVC
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_VC1_Smp
	.type	DecodeStream_VC1_Smp, %function
DecodeStream_VC1_Smp:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldrb	w0, [x19, 19]
	cmp	w0, 1
	beq	.L277
	ldr	x21, .LC58
	add	x22, x19, 96
	mov	x2, 88
	add	x1, x19, 8
	mov	x0, x22
	ldr	x3, [x21, 104]
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 88
	mov	w1, 0
	add	x0, x19, 184
	blr	x3
	ldr	w0, [x19, 116]
	cmp	w0, 15
	bls	.L278
	add	x2, x20, 28672
	ldr	x0, [x19, 96]
	add	x2, x2, 3728
	mov	w1, 16
	bl	Vc1SMPSeqHdr
	cbz	w0, .L269
	ldr	x2, .LC63
	mov	w1, 1401
.L276:
	mov	w0, 0
	add	x20, x20, 53248
	bl	dprint_normal
	ldr	w1, [x19, 120]
	ldr	w0, [x20, 192]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC61
	ldr	x4, [x0]
	cbz	x4, .L264
	ldr	w0, [x20, 192]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
.L264:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L278:
	ldr	x2, .LC60
	mov	w1, 1390
	b	.L276
	.p2align 3
.L269:
	ldp	w0, w3, [x19, 112]
	ldr	x2, [x19, 96]
	mov	x1, x22
	add	w0, w0, 16
	sub	w3, w3, #16
	add	x2, x2, 16
	str	x2, [x19, 96]
	stp	w0, w3, [x19, 112]
	mov	x0, x20
	bl	VC1DEC_Decode
	ldr	x3, [x21, 96]
	mov	x2, 176
	mov	w1, 0
	mov	x0, x22
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L277:
	add	x20, x20, 53248
	ldr	w0, [x20, 192]
	bl	VCTRL_OutputLastFrame
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 192]
	bl	SM_ReleaseStreamSeg
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	DecodeStream_VC1_Smp, .-DecodeStream_VC1_Smp
	.align	3
.LC58:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC60:
	.xword	.LC59
	.align	3
.LC61:
	.xword	g_EventReportFunc
	.align	3
.LC63:
	.xword	.LC62
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_VP8
	.type	DecodeStream_VP8, %function
DecodeStream_VP8:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldrb	w0, [x19, 19]
	cmp	w0, 1
	beq	.L289
	ldr	x22, .LC64
	add	x21, x19, 96
	mov	x2, 88
	add	x1, x19, 8
	mov	x0, x21
	ldr	x3, [x22, 104]
	blr	x3
	ldr	x3, [x22, 96]
	mov	x2, 88
	mov	w1, 0
	add	x0, x19, 184
	blr	x3
	mov	x1, x21
	mov	x0, x20
	bl	VP8DEC_Decode
	cmn	w0, #2
	beq	.L290
	strb	wzr, [x19, 1]
.L283:
	ldr	x0, [x20, 8]
	cbz	x0, .L291
.L279:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L290:
	mov	w0, 1
	strb	w0, [x19, 1]
	b	.L283
	.p2align 3
.L289:
	ldr	w0, [x20, 8816]
	bl	VCTRL_OutputLastFrame
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 8816]
	bl	SM_ReleaseStreamSeg
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L291:
	ldr	x3, [x22, 96]
	mov	x2, 176
	mov	w1, 0
	mov	x0, x21
	blr	x3
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 8816]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC65
	ldr	x4, [x0]
	cbz	x4, .L279
	ldr	w0, [x20, 8816]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
	b	.L279
	.size	DecodeStream_VP8, .-DecodeStream_VP8
	.align	3
.LC64:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC65:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_VP6x
	.type	DecodeStream_VP6x, %function
DecodeStream_VP6x:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldrb	w0, [x19, 19]
	cmp	w0, 1
	beq	.L302
	ldr	x22, .LC66
	add	x21, x19, 96
	mov	x2, 88
	add	x1, x19, 8
	mov	x0, x21
	ldr	x3, [x22, 104]
	blr	x3
	ldr	x3, [x22, 96]
	mov	x2, 88
	mov	w1, 0
	add	x0, x19, 184
	blr	x3
	mov	x1, x21
	mov	x0, x20
	bl	VP6DEC_Decode
	cmn	w0, #2
	beq	.L303
	strb	wzr, [x19, 1]
.L296:
	ldr	x0, [x20, 8]
	cbz	x0, .L304
.L292:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L303:
	mov	w0, 1
	strb	w0, [x19, 1]
	b	.L296
	.p2align 3
.L302:
	ldr	w0, [x20, 13344]
	bl	VCTRL_OutputLastFrame
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 13344]
	bl	SM_ReleaseStreamSeg
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L304:
	ldr	x3, [x22, 96]
	mov	x2, 176
	mov	w1, 0
	mov	x0, x21
	blr	x3
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 13344]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC67
	ldr	x4, [x0]
	cbz	x4, .L292
	ldr	w0, [x20, 13344]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	blr	x4
	b	.L292
	.size	DecodeStream_VP6x, .-DecodeStream_VP6x
	.align	3
.LC66:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC67:
	.xword	g_EventReportFunc
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
	cbz	x19, .L306
	ldr	x0, [x19, 8]
	cbz	x0, .L306
	ldr	x1, .LC70
	ldr	x1, [x1, w20, sxtw 3]
	add	x1, x1, 221184
	ldr	w2, [x1, 48]
	cmp	w2, 1
	beq	.L326
.L309:
	ldrb	w1, [x19, 18]
	strb	wzr, [x19, 448]
	cmp	w1, 1
	beq	.L327
	cbnz	w1, .L325
	ldr	x21, .LC71
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
	bls	.L325
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
	ldr	x2, .LC73
	mov	w1, 1976
	mov	w0, 1
	bl	dprint_normal
	ldr	x0, .LC74
	ldr	x4, [x0]
	cbz	x4, .L313
	mov	w3, 0
	mov	x2, 0
	mov	w1, 42
	mov	w0, w20
	blr	x4
.L313:
	strb	wzr, [x19, 2]
.L325:
	mov	w0, -1
.L324:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L326:
	ldr	w1, [x1, 80]
	cmp	w1, 1
	bne	.L309
	ldrb	w1, [x19, 448]
	cmp	w1, 1
	bne	.L309
	mov	x2, 176
	add	x1, x19, 272
	add	x0, x19, 96
	bl	memcpy
	strb	wzr, [x19, 448]
	mov	w0, 0
	b	.L324
	.p2align 3
.L327:
	ldrb	w21, [x19, 2]
	cbz	w21, .L328
	cmp	w21, 1
	bne	.L325
	ldr	w2, [x19, 116]
	cmp	w2, 1023
	bhi	.L315
	ldr	x22, .LC71
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
.L316:
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
.L315:
	ldr	x3, .LC71
	mov	x2, 88
	add	x1, x19, 8
	add	x0, x19, 184
	ldr	x3, [x3, 104]
	blr	x3
	b	.L316
	.p2align 3
.L328:
	ldr	x20, .LC71
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
	b	.L324
	.p2align 3
.L306:
	ldr	x2, .LC69
	mov	w1, 1936
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L324
	.size	SegMan, .-SegMan
	.align	3
.LC69:
	.xword	.LC68
	.align	3
.LC70:
	.xword	s_pstVfmwChan
	.align	3
.LC71:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC73:
	.xword	.LC72
	.align	3
.LC74:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_VC1_Adv
	.type	DecodeStream_VC1_Adv, %function
DecodeStream_VC1_Adv:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	mov	x0, x19
	bl	VC1_GetPacketState
	cmp	w0, 2
	beq	.L333
.L330:
	add	x21, x19, 53248
	mov	x1, x20
	ldr	w0, [x21, 192]
	bl	SegMan
	cbz	w0, .L334
	ldr	x0, [x19, 8]
	cbz	x0, .L335
.L329:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L334:
	add	x20, x20, 96
	mov	x0, x19
	mov	x1, x20
	bl	VC1DEC_Decode
	ldr	x3, .LC75
	mov	x2, 176
	mov	w1, 0
	mov	x0, x20
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x0, [x19, 8]
	cbnz	x0, .L329
.L335:
	add	x19, x19, 12288
	ldrb	w0, [x19, 2440]
	cmp	w0, 1
	bne	.L329
	ldr	w0, [x21, 192]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x19, 2440]
	b	.L329
	.p2align 3
.L333:
	add	x1, x19, 12288
	ldrsb	w0, [x1, 2439]
	cbnz	w0, .L330
	add	x1, x1, 2256
	mov	x0, x19
	bl	VC1DEC_Decode
	b	.L330
	.size	DecodeStream_VC1_Adv, .-DecodeStream_VC1_Adv
	.align	3
.LC75:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_VC1
	.type	DecodeStream_VC1, %function
DecodeStream_VC1:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19]
	ldr	w0, [x1, 572]
	cmp	w0, 1
	bhi	.L343
	ldr	w2, [x1, 576]
	cmp	w2, 8
	bgt	.L344
	add	x2, x19, 28672
	sxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x2, 3728]
	ldr	w0, [x1, 576]
	mov	x1, x19
	strb	w0, [x2, 3730]
	mov	x0, x20
	beq	.L345
	bl	DecodeStream_VC1_Smp
.L341:
	add	x19, x19, 12288
	ldrsb	w0, [x19, 2439]
	cbz	w0, .L346
	mov	w0, 1
	strb	w0, [x20, 1]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L343:
	ldr	x2, .LC77
	mov	w1, 1425
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L344:
	ldr	x2, .LC79
	mov	w1, 1432
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L346:
	strb	wzr, [x20, 1]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L345:
	bl	DecodeStream_VC1_Adv
	b	.L341
	.size	DecodeStream_VC1, .-DecodeStream_VC1
	.align	3
.LC77:
	.xword	.LC76
	.align	3
.LC79:
	.xword	.LC78
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
	beq	.L353
.L348:
	ldr	w0, [x19]
	mov	x1, x20
	bl	SegMan
	cbz	w0, .L354
	ldr	x0, [x19, 40]
	cbz	x0, .L355
.L347:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L354:
	add	x1, x20, 96
	mov	x0, x19
	bl	MPEG2DEC_Decode
	ldrb	w0, [x19, 17]
	cmp	w0, 1
	csel	w0, w0, wzr, eq
	strb	w0, [x20, 1]
	ldr	x0, [x19, 40]
	cbnz	x0, .L347
.L355:
	ldrb	w0, [x19, 18]
	cmp	w0, 1
	bne	.L347
	ldr	w0, [x19]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x19, 18]
	b	.L347
	.p2align 3
.L353:
	ldr	x0, .LC80
	ldr	x0, [x0, w21, sxtw 3]
	add	x0, x0, 221184
	ldr	w1, [x0, 48]
	cmp	w1, 1
	beq	.L356
.L349:
	add	x1, x19, 77824
	mov	x0, x19
	add	x1, x1, 3640
	bl	MPEG2DEC_Decode
	b	.L348
	.p2align 3
.L356:
	ldr	w0, [x0, 80]
	cbnz	w0, .L348
	b	.L349
	.size	DecodeStream_MPEG2, .-DecodeStream_MPEG2
	.align	3
.LC80:
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
	beq	.L362
.L358:
	ldr	w0, [x20, 2768]
	mov	x1, x21
	bl	SegMan
	cbz	w0, .L363
	ldr	x0, [x19, 1040]
	cbz	x0, .L364
.L357:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L363:
	add	x1, x21, 96
	mov	x0, x19
	bl	MPEG4DEC_Decode
	ldr	x0, [x19, 1040]
	cbnz	x0, .L357
.L364:
	ldrb	w0, [x20, 2804]
	cmp	w0, 1
	bne	.L357
	ldr	w0, [x20, 2768]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x20, 2804]
	b	.L357
	.p2align 3
.L362:
	ldr	x0, .LC81
	ldr	x0, [x0, w22, sxtw 3]
	add	x0, x0, 221184
	ldr	w1, [x0, 48]
	cmp	w1, 1
	beq	.L365
.L359:
	add	x1, x19, 12288
	mov	x0, x19
	add	x1, x1, 3368
	bl	MPEG4DEC_Decode
	b	.L358
	.p2align 3
.L365:
	ldr	w0, [x0, 80]
	cbnz	w0, .L358
	b	.L359
	.size	DecodeStream_MPEG4, .-DecodeStream_MPEG4
	.align	3
.LC81:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_AVS
	.type	DecodeStream_AVS, %function
DecodeStream_AVS:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	mov	x0, x19
	ldr	w21, [x19, 4]
	bl	AVS_GetPacketState
	cbnz	w0, .L367
	ldr	x0, .LC82
	ldr	x0, [x0, w21, sxtw 3]
	add	x0, x0, 221184
	ldr	w1, [x0, 48]
	cmp	w1, 1
	beq	.L371
	add	x1, x19, 16384
	mov	x0, x19
	add	x1, x1, 440
	bl	AVSDEC_Decode
.L367:
	ldr	w0, [x19, 4]
	mov	x1, x20
	bl	SegMan
	cbz	w0, .L372
	ldr	x0, [x19, 24]
	cbz	x0, .L373
.L366:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L371:
	ldr	w0, [x0, 80]
	cbnz	w0, .L367
	add	x1, x19, 16384
	mov	x0, x19
	add	x1, x1, 440
	bl	AVSDEC_Decode
	b	.L367
	.p2align 3
.L372:
	add	x1, x20, 96
	mov	x0, x19
	bl	AVSDEC_Decode
	ldr	x0, [x19, 24]
	cbnz	x0, .L366
.L373:
	ldrb	w0, [x19]
	cmp	w0, 1
	bne	.L366
	ldr	w0, [x19, 4]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x19]
	b	.L366
	.size	DecodeStream_AVS, .-DecodeStream_AVS
	.align	3
.LC82:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_H263
	.type	DecodeStream_H263, %function
DecodeStream_H263:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x19, x1
	add	x20, x1, 20480
	mov	w22, w2
	bl	_mcount
	mov	x0, x19
	ldr	w23, [x20, 2792]
	bl	H263_GetPacketState
	cmp	w0, 3
	beq	.L379
.L375:
	ldr	w0, [x20, 2792]
	mov	x1, x21
	bl	SegMan
	cbz	w0, .L380
	ldr	x0, [x19, 1040]
	cbz	x0, .L381
.L374:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L380:
	cmp	w22, 14
	add	x1, x21, 96
	cset	w2, eq
	mov	x0, x19
	bl	H263DEC_Decode
	ldr	x0, [x19, 1040]
	cbnz	x0, .L374
.L381:
	ldrb	w0, [x20, 2828]
	cmp	w0, 1
	bne	.L374
	ldr	w0, [x20, 2792]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x20, 2828]
	b	.L374
	.p2align 3
.L379:
	ldr	x0, .LC83
	ldr	x0, [x0, w23, sxtw 3]
	add	x0, x0, 221184
	ldr	w1, [x0, 48]
	cmp	w1, 1
	beq	.L382
.L376:
	cmp	w22, 14
	add	x1, x19, 12288
	cset	w2, eq
	add	x1, x1, 3376
	mov	x0, x19
	bl	H263DEC_Decode
	b	.L375
	.p2align 3
.L382:
	ldr	w0, [x0, 80]
	cbnz	w0, .L375
	b	.L376
	.size	DecodeStream_H263, .-DecodeStream_H263
	.align	3
.LC83:
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
	bls	.L397
.L384:
	ldr	x3, .LC85
	mov	w4, w19
	ldr	x2, .LC87
	mov	w1, 1922
	add	x3, x3, 96
	mov	w0, 1
	bl	dprint_normal
.L396:
	mov	w0, 7
	bl	VCTRL_RecordPosTime
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L397:
	ldr	x0, .LC84
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx386
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx386:
	.section	.rodata
	.align	0
	.align	2
.L386:
	.byte	(.L385 - .Lrtx386) / 4
	.byte	(.L387 - .Lrtx386) / 4
	.byte	(.L388 - .Lrtx386) / 4
	.byte	(.L389 - .Lrtx386) / 4
	.byte	(.L390 - .Lrtx386) / 4
	.byte	(.L384 - .Lrtx386) / 4
	.byte	(.L391 - .Lrtx386) / 4
	.byte	(.L384 - .Lrtx386) / 4
	.byte	(.L384 - .Lrtx386) / 4
	.byte	(.L384 - .Lrtx386) / 4
	.byte	(.L392 - .Lrtx386) / 4
	.byte	(.L392 - .Lrtx386) / 4
	.byte	(.L392 - .Lrtx386) / 4
	.byte	(.L393 - .Lrtx386) / 4
	.byte	(.L390 - .Lrtx386) / 4
	.byte	(.L394 - .Lrtx386) / 4
	.byte	(.L395 - .Lrtx386) / 4
	.text
	.p2align 3
.L395:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_HEVC
	b	.L396
	.p2align 3
.L385:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_H264
	b	.L396
	.p2align 3
.L387:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_VC1
	b	.L396
	.p2align 3
.L388:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_MPEG4
	b	.L396
	.p2align 3
.L389:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_MPEG2
	b	.L396
	.p2align 3
.L390:
	mov	w2, w19
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_H263
	b	.L396
	.p2align 3
.L391:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_AVS
	b	.L396
	.p2align 3
.L392:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_VP6x
	b	.L396
	.p2align 3
.L393:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_VP8
	b	.L396
	.p2align 3
.L394:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_MVC
	b	.L396
	.size	DecodeStream, .-DecodeStream
	.align	3
.LC84:
	.xword	.L386
	.align	3
.LC85:
	.xword	.LANCHOR1
	.align	3
.LC87:
	.xword	.LC86
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleasePacket
	.type	ReleasePacket, %function
ReleasePacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 10
	bcc	.L399
	cmp	w19, 12
	bls	.L400
	cmp	w19, 13
	bne	.L399
	ldr	x19, [x20]
	ldr	w0, [x20, 8816]
	ldr	w1, [x19, 232]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x19, 218]
	cmp	w0, 1
	beq	.L404
	ldr	x2, .LC89
	mov	w1, 2069
	mov	w0, 1
	bl	dprint_normal
.L404:
	ldr	x3, .LC90
	mov	x2, 176
	mov	w1, 0
	add	x0, x19, 208
	ldr	x3, [x3, 96]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L399:
	ldr	x2, .LC94
	mov	w3, w19
	mov	x4, 0
	mov	w1, 2108
	mov	w0, 2
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L400:
	ldr	x19, [x20]
	ldr	w0, [x20, 13344]
	ldr	w1, [x19, 232]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x19, 218]
	cmp	w0, 1
	beq	.L404
	ldr	x2, .LC92
	mov	w1, 2085
	mov	w0, 1
	bl	dprint_normal
	b	.L404
	.size	ReleasePacket, .-ReleasePacket
	.align	3
.LC89:
	.xword	.LC88
	.align	3
.LC90:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC92:
	.xword	.LC91
	.align	3
.LC94:
	.xword	.LC93
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseCurPic_VPx
	.type	ReleaseCurPic_VPx, %function
ReleaseCurPic_VPx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 10
	bcc	.L412
	cmp	w19, 12
	bls	.L413
	cmp	w19, 13
	bne	.L412
	ldr	x19, [x20]
	ldr	w0, [x20, 8816]
	ldr	w1, [x19, 232]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x19, 218]
	cmp	w0, 1
	beq	.L417
	ldr	x2, .LC95
	mov	w1, 2143
	mov	w0, 1
	bl	dprint_normal
.L417:
	ldr	x3, .LC96
	mov	x2, 176
	mov	w1, 0
	add	x0, x19, 208
	ldr	x3, [x3, 96]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L412:
	ldr	x2, .LC98
	mov	w3, w19
	mov	x4, 0
	mov	w1, 2167
	mov	w0, 2
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L413:
	ldr	x19, [x20]
	ldr	w0, [x20, 13344]
	ldr	w1, [x19, 232]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x19, 218]
	cmp	w0, 1
	beq	.L417
	ldr	x2, .LC97
	mov	w1, 2159
	mov	w0, 1
	bl	dprint_normal
	b	.L417
	.size	ReleaseCurPic_VPx, .-ReleaseCurPic_VPx
	.align	3
.LC95:
	.xword	.LC88
	.align	3
.LC96:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC97:
	.xword	.LC91
	.align	3
.LC98:
	.xword	.LC93
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
	bls	.L438
.L425:
	ldr	x2, .LC101
	mov	w3, w19
	mov	w1, 2333
	mov	w0, 0
	bl	dprint_normal
.L424:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L438:
	ldr	x0, .LC99
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx427
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx427:
	.section	.rodata
	.align	0
	.align	2
.L427:
	.byte	(.L426 - .Lrtx427) / 4
	.byte	(.L428 - .Lrtx427) / 4
	.byte	(.L429 - .Lrtx427) / 4
	.byte	(.L430 - .Lrtx427) / 4
	.byte	(.L431 - .Lrtx427) / 4
	.byte	(.L425 - .Lrtx427) / 4
	.byte	(.L432 - .Lrtx427) / 4
	.byte	(.L425 - .Lrtx427) / 4
	.byte	(.L425 - .Lrtx427) / 4
	.byte	(.L425 - .Lrtx427) / 4
	.byte	(.L433 - .Lrtx427) / 4
	.byte	(.L433 - .Lrtx427) / 4
	.byte	(.L433 - .Lrtx427) / 4
	.byte	(.L434 - .Lrtx427) / 4
	.byte	(.L431 - .Lrtx427) / 4
	.byte	(.L435 - .Lrtx427) / 4
	.byte	(.L436 - .Lrtx427) / 4
	.text
	.p2align 3
.L436:
	mov	x0, x20
	bl	HEVC_ClearCurrPic
	b	.L424
	.p2align 3
.L426:
	mov	x0, x20
	bl	H264_ClearCurrPic
	b	.L424
	.p2align 3
.L428:
	add	x1, x20, 53248
	add	x0, x20, 12288
	add	x0, x0, 2432
	ldr	w1, [x1, 192]
	bl	VC1_ClearCurPic
	b	.L424
	.p2align 3
.L429:
	mov	x0, x20
	bl	MP4_ClearCurPic
	mov	x0, x20
	bl	MP4_Clean_HeadPacket
	b	.L424
	.p2align 3
.L430:
	mov	x0, x20
	bl	MP2_ClearCurPic
	b	.L424
	.p2align 3
.L431:
	mov	x0, x20
	bl	H263_ClearCurPic
	mov	x0, x20
	bl	H263_Clean_HeadPacket
	b	.L424
	.p2align 3
.L432:
	mov	x0, x20
	bl	AVS_ClearCurPic
	b	.L424
	.p2align 3
.L433:
	mov	x1, x20
	mov	w0, w19
	bl	ReleaseCurPic_VPx
	b	.L424
	.p2align 3
.L434:
	mov	x1, x20
	mov	w0, 13
	bl	ReleaseCurPic_VPx
	b	.L424
	.p2align 3
.L435:
	mov	x0, x20
	bl	MVC_ClearCurrPic
	b	.L424
	.size	ReleaseCurPic, .-ReleaseCurPic
	.align	3
.LC99:
	.xword	.L427
	.align	3
.LC101:
	.xword	.LC100
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
	bls	.L447
	ldr	x1, .LC102
	mov	w0, -1
	ldr	x2, [x1, w22, sxtw 3]
	add	x2, x2, 217088
	ldr	x1, [x2, 3328]
	cmn	x1, #1
	bne	.L441
	ldr	w1, [x19]
	cbnz	w1, .L441
	add	w1, w4, w0
	uxtb	w1, w1
	cmp	w1, 174
	bls	.L448
.L441:
	cbnz	w4, .L442
	str	wzr, [x19]
.L442:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L447:
	ldr	w1, [x19]
	mov	w0, -1
	cbnz	w1, .L441
	mov	w0, 1
	str	w0, [x19]
	mov	w0, 0
	ldrb	w4, [x20, 3]
	b	.L441
	.p2align 3
.L448:
	ldr	x1, [x21, 32]
	str	x1, [x2, 3328]
	ldrb	w4, [x20, 3]
	b	.L441
	.size	CheckNewPicSegMpeg2, .-CheckNewPicSegMpeg2
	.align	3
.LC102:
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
	cbnz	w0, .L461
.L450:
	cmp	w21, 1
	bne	.L454
.L451:
	mov	w0, 1
	str	w0, [x19]
	mov	w0, 0
	ldrb	w3, [x20, 3]
.L452:
	cmp	w3, 182
	bne	.L453
	str	wzr, [x19]
.L453:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L461:
	ldr	w0, [x19]
	cbz	w0, .L451
	b	.L450
	.p2align 3
.L454:
	mov	w0, -1
	b	.L452
	.size	CheckNewPicSegMpeg4, .-CheckNewPicSegMpeg4
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckNewPicSegH263
	.type	CheckNewPicSegH263, %function
CheckNewPicSegH263:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w2
	mov	x21, x1
	bl	_mcount
	cmp	w19, 1
	bne	.L465
	mov	w0, 0
	str	w19, [x20]
.L463:
	ldrb	w1, [x21, 3]
	cmp	w1, 182
	bne	.L464
	str	wzr, [x20]
.L464:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L465:
	mov	w0, -1
	b	.L463
	.size	CheckNewPicSegH263, .-CheckNewPicSegH263
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckNewPicSegAVS
	.type	CheckNewPicSegAVS, %function
CheckNewPicSegAVS:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w2, [x20, 3]
	add	w0, w2, 74
	cmp	w2, 179
	cset	w3, eq
	uxtb	w0, w0
	cmp	w0, 1
	cset	w1, ls
	cmp	w2, 176
	cset	w0, eq
	orr	w0, w3, w0
	orr	w0, w1, w0
	cbz	w0, .L470
	ldr	w0, [x19]
	cbnz	w0, .L470
	mov	w0, 1
	str	w0, [x19]
	mov	w0, 0
	ldrb	w2, [x20, 3]
	cmp	w2, 179
	cset	w3, eq
.L467:
	cmp	w2, 182
	cset	w1, eq
	orr	w1, w3, w1
	cbz	w1, .L468
	str	wzr, [x19]
.L468:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L470:
	mov	w0, -1
	b	.L467
	.size	CheckNewPicSegAVS, .-CheckNewPicSegAVS
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckNewPicSegVC1
	.type	CheckNewPicSegVC1, %function
CheckNewPicSegVC1:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w2, [x20, 3]
	sub	w0, w2, #12
	uxtb	w0, w0
	cmp	w0, 3
	ccmp	w2, 10, 4, hi
	bne	.L478
	ldr	w0, [x19]
	cbnz	w0, .L478
	mov	w0, 1
	str	w0, [x19]
	mov	w0, 0
	ldrb	w2, [x20, 3]
.L475:
	cmp	w2, 13
	bne	.L476
	str	wzr, [x19]
.L476:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L478:
	mov	w0, -1
	b	.L475
	.size	CheckNewPicSegVC1, .-CheckNewPicSegVC1
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
	bls	.L498
.L492:
	mov	w0, -1
.L480:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L498:
	ldr	x0, .LC103
	ldrb	w0, [x0,w19,uxtw]
	adr	x2, .Lrtx482
	add	x0, x2, w0, sxtb #2
	br	x0
.Lrtx482:
	.section	.rodata
	.align	0
	.align	2
.L482:
	.byte	(.L481 - .Lrtx482) / 4
	.byte	(.L483 - .Lrtx482) / 4
	.byte	(.L484 - .Lrtx482) / 4
	.byte	(.L485 - .Lrtx482) / 4
	.byte	(.L486 - .Lrtx482) / 4
	.byte	(.L492 - .Lrtx482) / 4
	.byte	(.L487 - .Lrtx482) / 4
	.byte	(.L492 - .Lrtx482) / 4
	.byte	(.L492 - .Lrtx482) / 4
	.byte	(.L492 - .Lrtx482) / 4
	.byte	(.L492 - .Lrtx482) / 4
	.byte	(.L492 - .Lrtx482) / 4
	.byte	(.L492 - .Lrtx482) / 4
	.byte	(.L492 - .Lrtx482) / 4
	.byte	(.L486 - .Lrtx482) / 4
	.byte	(.L488 - .Lrtx482) / 4
	.byte	(.L489 - .Lrtx482) / 4
	.text
	.p2align 3
.L481:
	mov	x0, x21
	bl	H264_IsNewPicNal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L483:
	ldrb	w2, [x1, 3]
	mov	w0, -1
	sub	w3, w2, #12
	uxtb	w3, w3
	cmp	w3, 3
	ccmp	w2, 10, 4, hi
	cset	w3, eq
	cbnz	w3, .L499
.L491:
	cmp	w2, 13
	bne	.L480
.L497:
	str	wzr, [x21]
	b	.L480
	.p2align 3
.L484:
	mov	w2, w22
	mov	x0, x21
	bl	CheckNewPicSegMpeg4
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L485:
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
.L486:
	cmp	w22, 1
	mov	w0, -1
	beq	.L500
.L490:
	ldrb	w1, [x1, 3]
	cmp	w1, 182
	bne	.L480
	b	.L497
	.p2align 3
.L487:
	mov	x0, x21
	bl	CheckNewPicSegAVS
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L488:
	mov	x0, x21
	bl	MVC_IsNewPicNal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L489:
	mov	x0, x21
	bl	HEVC_IsNewPicNal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L499:
	ldr	w3, [x21]
	cbnz	w3, .L491
	mov	w0, 1
	str	w0, [x21]
	mov	w0, 0
	ldrb	w2, [x1, 3]
	b	.L491
	.p2align 3
.L500:
	mov	w0, 0
	str	w22, [x21]
	b	.L490
	.size	CheckNewPicSegByVidStd, .-CheckNewPicSegByVidStd
	.align	3
.LC103:
	.xword	.L482
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
	mov	w19, w2
	mov	x20, x3
	mov	x22, x1
	bl	_mcount
	cmp	w19, 2
	ldr	x0, [x20]
	beq	.L515
	cmp	w19, 4
	ccmp	w19, 14, 4, ne
	bne	.L510
	ldrb	w2, [x0, 2]
	and	w2, w2, 248
	cmp	w2, 128
	cset	w4, eq
	beq	.L511
.L504:
	ldrb	w3, [x0]
	cbnz	w3, .L516
	ldrb	w1, [x0, 1]
	ldrb	w5, [x0, 2]
	cbnz	w1, .L506
	cmp	w5, 1
	bne	.L506
.L503:
	mov	x3, x20
	mov	w2, w19
	mov	x1, x22
	mov	w0, w21
	bl	CheckNewPicSegByVidStd
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L515:
	ldrb	w1, [x20, 80]
	tbnz	x1, 0, .L511
.L510:
	mov	w4, 0
	b	.L504
	.p2align 3
.L511:
	mov	w4, 1
	b	.L503
	.p2align 3
.L516:
	ldrb	w5, [x0, 2]
	ldrb	w1, [x0, 1]
.L506:
	ldr	x2, .LC105
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
.LC105:
	.xword	.LC104
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
	ldr	x1, .LC108
	add	x1, x1, 16
	ldr	x0, [x1, w19, sxtw 3]
	cbz	x0, .L523
.L518:
	add	x1, x0, 204800
	str	wzr, [x0]
	add	x1, x1, 536
	add	x0, x0, 1048
	.p2align 2
.L520:
	stp	wzr, wzr, [x0, -4]
	add	x0, x0, 1064
	cmp	x0, x1
	bne	.L520
	mov	w0, 0
.L519:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L523:
	str	x20, [x1, w19, sxtw 3]
	cbz	x20, .L521
	mov	x0, x20
	b	.L518
.L521:
	mov	w0, -1
	b	.L519
	.size	OpenUsdPool_WithMem, .-OpenUsdPool_WithMem
	.align	3
.LC108:
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
	ldr	x0, .LC110
	add	x0, x0, 16
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L524
	str	xzr, [x0, w19, sxtw 3]
.L524:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CloseUsdPool_WithMem, .-CloseUsdPool_WithMem
	.align	3
.LC110:
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
	ldr	x0, .LC112
	add	x0, x0, 16
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L532
	add	x1, x0, 204800
	str	wzr, [x0]
	add	x1, x1, 536
	add	x0, x0, 1048
	.p2align 2
.L531:
	stp	wzr, wzr, [x0, -4]
	add	x0, x0, 1064
	cmp	x0, x1
	bne	.L531
	mov	w0, 0
.L530:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L532:
	mov	w0, -1
	b	.L530
	.size	InitUsdPool, .-InitUsdPool
	.align	3
.LC112:
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
	ldr	x0, .LC114
	add	x0, x0, 16
	ldr	x3, [x0, w19, sxtw 3]
	cbz	x3, .L538
	add	x0, x3, 1048
	mov	w1, 0
	b	.L537
	.p2align 3
.L536:
	add	w1, w1, 1
	add	x0, x0, 1064
	cmp	w1, 192
	beq	.L538
.L537:
	ldr	w2, [x0]
	cbnz	w2, .L536
	ldr	w2, [x0, -4]
	cbnz	w2, .L536
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
.L538:
	mov	x0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetUsd, .-GetUsd
	.align	3
.LC114:
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
	cbz	x19, .L540
	str	wzr, [x19, 1040]
.L540:
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
	cbz	x20, .L557
	ldrh	w0, [x19, 4]
	ldrh	w4, [x19, 8]
	and	w0, w0, 63
	.p2align 2
.L556:
	cmp	w0, w4
	beq	.L550
	sxtw	x2, w0
	add	w0, w0, 1
	add	x2, x2, 2
	and	w0, w0, 63
	ldr	x2, [x19, x2, lsl 3]
	cbz	x2, .L556
	ldr	w3, [x2, 88]
	ldr	w2, [x20, 88]
	cmp	w3, w2
	bne	.L556
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L550:
	mov	w0, -1
.L547:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L557:
	ldr	x2, .LC116
	mov	w1, 2680
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L547
	.size	IsImageInVoQueue, .-IsImageInVoQueue
	.align	3
.LC116:
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
	bls	.L568
	ldr	x2, .LC119
	mov	w3, w20
	mov	w0, 1
	mov	w1, 2743
	stp	wzr, w0, [x19, 56]
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L568:
	ldr	x0, .LC117
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx561
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx561:
	.section	.rodata
	.align	0
	.align	2
.L561:
	.byte	(.L560 - .Lrtx561) / 4
	.byte	(.L562 - .Lrtx561) / 4
	.byte	(.L563 - .Lrtx561) / 4
	.byte	(.L564 - .Lrtx561) / 4
	.byte	(.L565 - .Lrtx561) / 4
	.byte	(.L566 - .Lrtx561) / 4
	.text
	.p2align 3
.L565:
	mov	w1, 235
	mov	w0, 100
	stp	w1, w0, [x19, 56]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L566:
	mov	w0, 2
	stp	wzr, w0, [x19, 56]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L560:
	mov	w0, 1
	stp	wzr, w0, [x19, 56]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L562:
	mov	w1, 4
	mov	w0, 3
	stp	w1, w0, [x19, 56]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L563:
	mov	w1, 16
	mov	w0, 9
	stp	w1, w0, [x19, 56]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L564:
	mov	w1, 221
	mov	w0, 100
	stp	w1, w0, [x19, 56]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SetAspectRatio, .-SetAspectRatio
	.align	3
.LC117:
	.xword	.L561
	.align	3
.LC119:
	.xword	.LC118
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
	beq	.L575
	ldr	w2, [x19, 308]
	mov	w0, 0
	cmp	w2, 1
	beq	.L578
	cmp	w1, 2
	ldr	w1, [x19, 312]
	beq	.L577
	cmp	w1, 1
	cset	w0, eq
.L574:
	cmp	w1, 1
	cset	w1, eq
	orr	w0, w1, w0
.L578:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L575:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L577:
	mov	w0, 1
	b	.L574
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
	ldr	x0, .LC120
	ldr	x0, [x0, w21, sxtw 3]
	add	x0, x0, 217088
	ldr	w0, [x0, 3156]
	cbnz	w0, .L583
	mov	x0, 16000
	ldr	x21, [sp, 32]
	cmp	x19, x0
	cset	w0, hi
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L583:
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
.LC120:
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
	.type	__FUNCTION__.10569, %object
	.size	__FUNCTION__.10569, 19
__FUNCTION__.10569:
	.string	"InsertImgToVoQueue"
	.zero	5
	.type	__func__.10615, %object
	.size	__func__.10615, 20
__func__.10615:
	.string	"SYNTAX_MarkImageEos"
	.zero	4
	.type	__func__.10622, %object
	.size	__func__.10622, 20
__func__.10622:
	.string	"SYNTAX_ReceiveImage"
	.zero	4
	.type	__func__.10667, %object
	.size	__func__.10667, 20
__func__.10667:
	.string	"SYNTAX_ReleaseImage"
	.zero	4
	.type	__func__.10784, %object
	.size	__func__.10784, 13
__func__.10784:
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
.LC31:
	ASCII(.string	"%s: Get image ptr err! Tail:%d\n" )
.LC34:
	ASCII(.string	"%s, pstVoQue is NULL!!!\n" )
	.zero	7
.LC37:
	ASCII(.string	"Queue=(%02d,%02d,%02d) - F%d\n" )
	.zero	2
.LC41:
	ASCII(.string	"SYNTAX_ReleaseImage p_image is null\n" )
	.zero	3
.LC46:
	ASCII(.string	"Image(id %d) not found in vo queue(magic word %d), no need to deal with.Phyaddr = 0x%x\n" )
.LC48:
	ASCII(.string	"image[%d] null\n" )
.LC50:
	ASCII(.string	"Queue=(%02d,%02d,%02d) x F%d\n" )
	.zero	2
.LC52:
	ASCII(.string	"%s call SYNTAX_ReleaseImage_RecycleImage failed.\n" )
	.zero	6
.LC59:
	ASCII(.string	"LENTH ERROR: VC1 S/MP BS is wrong!\n" )
	.zero	4
.LC62:
	ASCII(.string	"SYNTAX ERROR: VC1 S/MP BS is wrong!\n" )
	.zero	3
.LC68:
	ASCII(.string	"pSegMan error!\n" )
.LC72:
	ASCII(.string	"More than two packet!!!ERROR!!!\n" )
	.zero	7
.LC76:
	ASCII(.string	"ERROR: Wrong PreParseInfo about Vc1 IsAdvProfile!\n" )
	.zero	5
.LC78:
	ASCII(.string	"ERROR: Wrong PreParseInfo about Vc1 CodecVersion!\n" )
	.zero	5
.LC86:
	ASCII(.string	"%s unsupport standard %d\n" )
	.zero	6
.LC88:
	ASCII(.string	"ERROR: VFMW_VP8 one packet stream, but IsLastSeg == 0\n" )
	.zero	1
.LC91:
	ASCII(.string	"ERROR: VFMW_VP6 one packet stream, but IsLastSeg == 0\n" )
	.zero	1
.LC93:
	ASCII(.string	"%s not support VidStd %d, pSegMan %p not used.\n" )
.LC100:
	ASCII(.string	"VidStd=%d Error!\n" )
	.zero	6
.LC104:
	ASCII(.string	"pu8[0] = %x,pu8[1] = %x, pu8[2] = %x\n" )
	.zero	2
.LC118:
	ASCII(.string	"WARNNING: aspect ration (%d) is not expected!\n" )
	.bss
	.align	3
.LANCHOR0 = . + 0
	.type	last_rec_pos_time.10566, %object
	.size	last_rec_pos_time.10566, 16
last_rec_pos_time.10566:
	.zero	16
	.type	pstVdecUsdPool, %object
	.size	pstVdecUsdPool, 32
pstVdecUsdPool:
	.zero	32
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
