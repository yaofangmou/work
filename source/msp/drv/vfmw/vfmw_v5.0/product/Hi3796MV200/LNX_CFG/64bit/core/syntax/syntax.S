#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"syntax.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
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
	bls	.L21
.L19:
	mov	x0, 0
	b	.L2
	.p2align 3
.L21:
	ldr	x1, .LC0
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx4
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx4:
	.section	.rodata
	.align	0
	.align	2
.L4:
	.byte	(.L18 - .Lrtx4) / 4
	.byte	(.L5 - .Lrtx4) / 4
	.byte	(.L6 - .Lrtx4) / 4
	.byte	(.L7 - .Lrtx4) / 4
	.byte	(.L19 - .Lrtx4) / 4
	.byte	(.L8 - .Lrtx4) / 4
	.byte	(.L9 - .Lrtx4) / 4
	.byte	(.L19 - .Lrtx4) / 4
	.byte	(.L10 - .Lrtx4) / 4
	.byte	(.L11 - .Lrtx4) / 4
	.byte	(.L12 - .Lrtx4) / 4
	.byte	(.L12 - .Lrtx4) / 4
	.byte	(.L12 - .Lrtx4) / 4
	.byte	(.L13 - .Lrtx4) / 4
	.byte	(.L19 - .Lrtx4) / 4
	.byte	(.L14 - .Lrtx4) / 4
	.byte	(.L15 - .Lrtx4) / 4
	.byte	(.L16 - .Lrtx4) / 4
	.byte	(.L17 - .Lrtx4) / 4
	.byte	(.L19 - .Lrtx4) / 4
	.byte	(.L18 - .Lrtx4) / 4
	.text
	.p2align 3
.L18:
	add	x0, x19, 16
.L2:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L5:
	add	x19, x19, 53248
	add	x0, x19, 304
	b	.L2
	.p2align 3
.L10:
	add	x19, x19, 53248
	add	x0, x19, 1728
	b	.L2
	.p2align 3
.L11:
	add	x19, x19, 53248
	add	x0, x19, 1704
	b	.L2
	.p2align 3
.L6:
	add	x19, x19, 20480
	add	x0, x19, 2248
	b	.L2
	.p2align 3
.L7:
	add	x19, x19, 86016
	add	x0, x19, 2792
	b	.L2
	.p2align 3
.L8:
	add	x19, x19, 40960
	add	x0, x19, 1672
	b	.L2
	.p2align 3
.L9:
	add	x19, x19, 12288
	add	x0, x19, 3984
	b	.L2
	.p2align 3
.L14:
	add	x0, x19, 920
	b	.L2
	.p2align 3
.L15:
	add	x19, x19, 4096
	add	x0, x19, 2856
	b	.L2
	.p2align 3
.L16:
	add	x19, x19, 274432
	add	x0, x19, 4048
	b	.L2
	.p2align 3
.L17:
	add	x19, x19, 16384
	add	x0, x19, 2496
	b	.L2
	.p2align 3
.L12:
	add	x19, x19, 12288
	add	x0, x19, 480
	b	.L2
	.p2align 3
.L13:
	add	x19, x19, 8192
	add	x0, x19, 48
	b	.L2
	.size	SYNTAX_GetVoQue, .-SYNTAX_GetVoQue
	.align	3
.LC0:
	.xword	.L4
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PrintVoQueue
	.type	PrintVoQueue, %function
PrintVoQueue:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L29
	ldr	x1, .LC5
	mov	w0, 1
	ldrh	w4, [x20, 8]
	ldrh	w3, [x20, 4]
	ldrh	w2, [x20, 6]
	bl	dprint_vfmw
	ldr	x22, .LC7
	ldrh	w0, [x20, 4]
	ldrh	w1, [x20, 8]
	and	w19, w0, 63
	cmp	w19, w1
	beq	.L27
	ldr	x21, .LC9
	b	.L28
	.p2align 3
.L26:
	uxtw	x2, w19
	mov	x1, x21
	add	x2, x2, 2
	mov	w0, 1
	ldr	x2, [x20, x2, lsl 3]
	ldr	w2, [x2, 148]
	bl	dprint_vfmw
	add	w0, w19, 1
	ldrh	w1, [x20, 8]
	and	w19, w0, 63
	cmp	w19, w1
	beq	.L27
.L28:
	and	w0, w0, 7
	cbnz	w0, .L26
	mov	x1, x22
	mov	w0, 1
	bl	dprint_vfmw
	b	.L26
	.p2align 3
.L27:
	mov	x1, x22
	mov	w0, 1
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L29:
	ldr	x2, .LC1
	mov	w3, 78
	ldr	x1, .LC3
	mov	w0, 1
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	PrintVoQueue, .-PrintVoQueue
	.align	3
.LC1:
	.xword	.LANCHOR0
	.align	3
.LC3:
	.xword	.LC2
	.align	3
.LC5:
	.xword	.LC4
	.align	3
.LC7:
	.xword	.LC6
	.align	3
.LC9:
	.xword	.LC8
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
	cbz	x19, .L36
	ldr	x20, .LC12
	mov	w0, 2
	ldr	x1, [x20, 24]
	blr	x1
	ldrh	w2, [x19, 6]
	ldrh	w3, [x19, 4]
	ldrh	w4, [x19, 8]
	cmp	w2, w3
	beq	.L37
.L34:
	ldr	x1, .LC14
	mov	w0, 1
	bl	dprint_vfmw
.L35:
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
	.p2align 3
.L37:
	cmp	w2, w4
	bne	.L34
	b	.L35
	.p2align 3
.L36:
	ldr	x2, .LC10
	mov	w3, 107
	ldr	x1, .LC11
	mov	w0, 1
	add	x2, x2, 16
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ResetVoQueue, .-ResetVoQueue
	.align	3
.LC10:
	.xword	.LANCHOR0
	.align	3
.LC11:
	.xword	.LC2
	.align	3
.LC12:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC14:
	.xword	.LC13
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
	mov	w21, w0
	mov	x0, x30
	mov	x19, x1
	mov	x20, x2
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L57
	cmp	w21, 20
	bls	.L58
.L38:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L58:
	ldr	x0, .LC17
	ldrb	w0, [x0,w21,uxtw]
	adr	x1, .Lrtx42
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx42:
	.section	.rodata
	.align	0
	.align	2
.L42:
	.byte	(.L41 - .Lrtx42) / 4
	.byte	(.L43 - .Lrtx42) / 4
	.byte	(.L44 - .Lrtx42) / 4
	.byte	(.L45 - .Lrtx42) / 4
	.byte	(.L38 - .Lrtx42) / 4
	.byte	(.L46 - .Lrtx42) / 4
	.byte	(.L47 - .Lrtx42) / 4
	.byte	(.L38 - .Lrtx42) / 4
	.byte	(.L48 - .Lrtx42) / 4
	.byte	(.L49 - .Lrtx42) / 4
	.byte	(.L50 - .Lrtx42) / 4
	.byte	(.L50 - .Lrtx42) / 4
	.byte	(.L50 - .Lrtx42) / 4
	.byte	(.L51 - .Lrtx42) / 4
	.byte	(.L38 - .Lrtx42) / 4
	.byte	(.L52 - .Lrtx42) / 4
	.byte	(.L53 - .Lrtx42) / 4
	.byte	(.L54 - .Lrtx42) / 4
	.byte	(.L55 - .Lrtx42) / 4
	.byte	(.L38 - .Lrtx42) / 4
	.byte	(.L56 - .Lrtx42) / 4
	.text
	.p2align 3
.L57:
	ldr	x2, .LC15
	mov	w3, 151
	ldr	x1, .LC16
	mov	w0, 1
	add	x2, x2, 32
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L56:
	ldr	w1, [x20, 148]
	mov	x0, x19
	bl	USERDEC_RecycleImage
	b	.L38
	.p2align 3
.L41:
	ldr	w1, [x20, 148]
	mov	x0, x19
	bl	H264DEC_RecycleImage
	b	.L38
	.p2align 3
.L43:
	ldr	w1, [x20, 148]
	mov	x0, x19
	bl	VC1DEC_RecycleImage
	b	.L38
	.p2align 3
.L44:
	ldr	w1, [x20, 148]
	mov	x0, x19
	bl	MPEG4DEC_RecycleImage
	b	.L38
	.p2align 3
.L45:
	ldr	w1, [x20, 148]
	mov	x0, x19
	bl	MPEG2DEC_RecycleImage
	b	.L38
	.p2align 3
.L46:
	ldr	w1, [x20, 148]
	mov	x0, x19
	bl	DIVX3DEC_RecycleImage
	b	.L38
	.p2align 3
.L47:
	ldr	w1, [x20, 148]
	mov	x0, x19
	bl	AVSDEC_RecycleImage
	b	.L38
	.p2align 3
.L48:
	ldr	w1, [x20, 148]
	mov	x0, x19
	bl	REAL8DEC_RecycleImage
	b	.L38
	.p2align 3
.L49:
	ldr	w1, [x20, 148]
	mov	x0, x19
	bl	REAL9DEC_RecycleImage
	b	.L38
	.p2align 3
.L50:
	ldr	w1, [x20, 148]
	mov	x0, x19
	bl	VP6DEC_RecycleImage
	b	.L38
	.p2align 3
.L51:
	ldr	w1, [x20, 148]
	mov	x0, x19
	bl	VP8DEC_RecycleImage
	b	.L38
	.p2align 3
.L52:
	ldr	w1, [x20, 148]
	mov	x0, x19
	bl	MVC_DEC_RecycleImage
	b	.L38
	.p2align 3
.L53:
	ldr	w1, [x20, 148]
	mov	x0, x19
	bl	HEVC_DECRecycleImage
	b	.L38
	.p2align 3
.L54:
	ldr	w1, [x20, 148]
	mov	x0, x19
	bl	VP9DEC_RecycleImage
	b	.L38
	.p2align 3
.L55:
	ldr	w1, [x20, 148]
	mov	x0, x19
	bl	AVS2DEC_RecycleImage
	b	.L38
	.size	ReturnImageToSyntax, .-ReturnImageToSyntax
	.align	3
.LC15:
	.xword	.LANCHOR0
	.align	3
.LC16:
	.xword	.LC2
	.align	3
.LC17:
	.xword	.L42
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InsertImgToVoQueue
	.type	InsertImgToVoQueue, %function
InsertImgToVoQueue:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w21, w0
	mov	x0, x30
	mov	w24, w1
	mov	x22, x2
	mov	x27, x3
	mov	x26, x4
	bl	_mcount
	cmp	w21, 31
	bhi	.L129
	cmp	x22, xzr
	ccmp	x27, xzr, 4, ne
	beq	.L130
	cbz	x26, .L131
	ldr	x1, .LC23
	mov	w0, 2
	bl	dprint_vfmw
	ldr	x20, .LC24
	mov	w0, 2
	ldr	x1, [x20, 24]
	blr	x1
	ldrh	w19, [x27, 4]
	ldrh	w3, [x27, 8]
	and	w19, w19, 63
	cmp	w19, w3
	beq	.L68
	ldr	x25, .LC26
	mov	w23, 1000
	b	.L126
	.p2align 3
.L67:
	add	w19, w19, 1
	and	w19, w19, 63
	cmp	w19, w3
	beq	.L68
.L126:
	sxtw	x0, w19
	ldr	w1, [x26, 148]
	add	x0, x0, 2
	ldr	x0, [x27, x0, lsl 3]
	ldr	w2, [x0, 148]
	cmp	w2, w1
	bne	.L67
	mov	x1, x25
	mov	w0, 0
	add	w19, w19, 1
	bl	dprint_vfmw
	str	w23, [x26, 152]
	and	w19, w19, 63
	ldrh	w3, [x27, 8]
	cmp	w19, w3
	bne	.L126
	.p2align 2
.L68:
	ldr	w2, [x26, 152]
	cmp	w2, 100
	bhi	.L132
	ldp	w3, w4, [x26, 68]
	cmp	w3, 31
	bhi	.L133
.L70:
	ldr	x1, .LC28
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x26, 152]
	cmp	w0, 1000
	beq	.L73
	mov	x2, x26
	mov	x1, x22
	mov	w0, w24
	bl	ReturnImageToSyntax
.L73:
	ldr	x1, [x20, 32]
	mov	w0, 2
	blr	x1
	mov	w0, 1
.L61:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L133:
	cmp	w4, 31
	bls	.L70
	add	x1, x26, 416
	mov	w0, w21
	str	w24, [x26, 216]
	bl	VCTRL_GetHDRConfigInfo
	ldr	x23, .LC29
	ldrb	w0, [x26, 66]
	ldr	x3, [x26, 584]
	ldr	x1, [x23, w21, sxtw 3]
	ldr	w1, [x1, 128]
	str	x3, [x26, 576]
	cmp	w1, 1
	cset	w1, eq
	cmp	w24, 20
	bfi	w0, w1, 2, 1
	strb	w0, [x26, 66]
	beq	.L93
	add	x19, x27, 528
	ldr	x0, [x19, 56]
	sub	w24, w24, #8
	sub	x1, x3, x0
	cmp	x1, 5
	ccmn	x0, #1, 4, ls
	beq	.L134
	cmp	w24, 1
	bls	.L76
	mov	x2, x3
	mov	x3, -1
.L74:
	ldr	x1, .LC31
	mov	w0, 29
	ldr	x4, [x26, 592]
	str	x3, [x26, 584]
	bl	dprint_vfmw
	ldr	w0, [x26, 76]
	cbz	w0, .L77
	ldr	w0, [x26, 80]
	cbz	w0, .L77
	ldr	w1, [x26, 68]
.L78:
	str	w1, [x19, 28]
	ldr	w2, [x19, 8]
	ldr	w0, [x26, 72]
	str	w0, [x19, 32]
	ldrb	w0, [x26, 64]
	ubfx	x0, x0, 5, 3
	str	w0, [x19, 36]
	ldr	w0, [x26, 64]
	str	w0, [x19, 40]
	ldr	w0, [x26, 148]
	add	w0, w0, 2
	str	w0, [x19, 24]
	ldrh	w1, [x26, 76]
	ldp	w22, w25, [x26, 80]
	ldrb	w5, [x26, 65]
	ldr	w0, [x26, 64]
	orr	w22, w1, w22, lsl 16
	ldr	w1, [x26, 156]
	ubfx	x5, x5, 0, 2
	ubfx	x0, x0, 14, 3
	cmp	w1, w2
	ldrh	w2, [x26, 88]
	uxtb	w28, w5
	uxtb	w4, w0
	orr	w25, w2, w25, lsl 16
	beq	.L79
	str	w1, [x19, 48]
.L79:
	ldr	w1, [x19, 44]
	ldr	x24, .LC32
	add	w2, w1, 1
	str	w2, [x19, 44]
	str	w1, [x26, 160]
	ldr	w1, [x27, 528]
	cmp	w4, w1
	beq	.L80
	ldr	x6, [x24]
	cbz	x6, .L81
	strb	w1, [x29, 120]
	mov	w3, 2
	strb	w0, [x29, 121]
	add	x2, x29, 120
	mov	w1, 7
	mov	w0, w21
	stp	w5, w4, [x29, 104]
	blr	x6
	ldp	w5, w4, [x29, 104]
.L81:
	str	w4, [x27, 528]
.L80:
	ldr	w0, [x19, 4]
	cmp	w28, w0
	beq	.L82
	ldr	x4, [x24]
	cbz	x4, .L83
	add	x2, x29, 128
	mov	w3, 1
	mov	w1, 4
	mov	w0, w21
	strb	w5, [x2, -8]!
	blr	x4
.L83:
	str	w28, [x19, 4]
.L82:
	ldr	w0, [x19, 16]
	cmp	w22, w0
	beq	.L135
.L84:
	ldr	x4, [x24]
	stp	w22, w25, [x19, 16]
	cbz	x4, .L85
	ldp	w2, w0, [x26, 76]
	ldr	w1, [x26, 84]
	mov	w3, 8
	strh	w0, [x29, 122]
	ldr	w0, [x26, 88]
	strh	w2, [x29, 120]
	add	x2, x29, 120
	strh	w1, [x29, 124]
	mov	w1, 1
	strh	w0, [x29, 126]
	mov	w0, w21
	blr	x4
.L85:
	ldp	w3, w2, [x26, 112]
	ldp	w1, w0, [x26, 36]
	stp	w1, w0, [x26, 20]
	add	w1, w3, w1
	add	w0, w2, w0
	stp	w1, w0, [x26, 28]
	ldr	w5, [x26, 148]
	mov	w0, 12
	ldr	x1, .LC34
	sxtw	x19, w21
	ldrh	w4, [x27, 8]
	ldrh	w3, [x27, 6]
	ldrh	w2, [x27, 4]
	bl	dprint_vfmw
	ldr	x22, .LC35
	ldrh	w0, [x27, 8]
	add	w1, w0, 1
	add	x0, x0, 2
	and	w1, w1, 63
	str	x26, [x27, x0, lsl 3]
	lsl	x0, x19, 6
	strh	w1, [x27, 8]
	add	x0, x0, x19, lsl 3
	ldr	x1, [x23, w21, sxtw 3]
	add	x23, x22, x0
	add	x0, x1, 507904
	ldr	w1, [x0, 2072]
	add	w1, w1, 1
	str	w1, [x0, 2072]
	str	wzr, [x26, 264]
	ldr	w0, [x23, 24]
	cmp	w0, 6
	beq	.L136
.L87:
	lsl	x2, x19, 6
	ldr	w3, [x26, 52]
	add	x2, x2, x19, lsl 3
	mov	w1, 5
	add	x2, x22, x2
	mov	w0, w21
	str	w3, [x2, 20]
	ldr	w2, [x26, 160]
	bl	VDEC_Lowdelay_Event_Time
	ldr	x3, .LC36
	mov	w0, 2
	ldr	w1, [x26, 160]
	ldr	x2, [x20, 32]
	add	w1, w1, 1
	str	w1, [x3, w21, sxtw 2]
	blr	x2
	ldr	x4, [x24]
	cbz	x4, .L88
	mov	w3, 640
	mov	x2, x26
	mov	w1, 5
	mov	w0, w21
	blr	x4
.L88:
	mov	w0, 8
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L137
.L90:
	lsl	x0, x19, 6
	ldr	x1, [x20]
	add	x20, x0, x19, lsl 3
	add	x21, x22, x20
	ldr	w0, [x21, 4]
	add	w0, w0, 1
	str	w0, [x21, 4]
	blr	x1
	mov	w2, w0
	ldr	w1, [x22, x20]
	mov	w0, 1
	sub	w1, w2, w1
	cmp	w1, 299
	bls	.L61
	ldr	w0, [x21, 4]
	cbz	w0, .L92
	mov	w3, 10000
	mul	w0, w0, w3
	udiv	w1, w0, w1
	str	w1, [x21, 8]
.L92:
	lsl	x1, x19, 6
	mov	w0, 1
	add	x19, x1, x19, lsl 3
	add	x1, x22, x19
	str	w2, [x22, x19]
	str	wzr, [x1, 4]
	b	.L61
	.p2align 3
.L132:
	ldp	w3, w4, [x26, 68]
	b	.L70
.L134:
	cmp	w24, 1
	mov	x2, x3
	bhi	.L74
	ldrb	w0, [x26, 64]
	and	w0, w0, 3
	cmp	w0, 2
	bne	.L74
.L76:
	mov	x2, -1
	str	x2, [x26, 576]
	mov	x3, x2
	b	.L74
.L77:
	ldp	w1, w0, [x26, 68]
	stp	w1, w0, [x26, 76]
	lsr	w2, w1, 1
	lsr	w0, w0, 1
	str	w2, [x26, 84]
	str	w0, [x26, 88]
	b	.L78
.L137:
	ldr	x0, [x20]
	blr	x0
	mov	w4, w0
	ldr	x3, .LC37
	ldr	x1, .LC38
	ldr	w0, [x3, w21, sxtw 2]
	ldr	w1, [x1]
	sub	w0, w4, w0
	cmp	w0, w1
	bls	.L90
	ldr	x0, .LC18
	lsl	w2, w21, 24
	add	w2, w2, 524288
	mov	w1, 522
	add	x0, x0, 80
	str	w4, [x3, w21, sxtw 2]
	bl	DBG_AddTrace
	b	.L90
.L135:
	ldr	w0, [x19, 20]
	cmp	w25, w0
	bne	.L84
	b	.L85
.L136:
	ldr	w0, [x23, 68]
	cbnz	w0, .L87
	ldr	x0, [x20]
	blr	x0
	str	wzr, [x23, 24]
	str	w0, [x23, 68]
	b	.L87
.L93:
	mov	x2, x3
	add	x19, x27, 528
	b	.L74
.L129:
	ldr	x2, .LC18
	mov	w3, 396
	ldr	x1, .LC19
	mov	w0, 1
	add	x2, x2, 56
	bl	dprint_vfmw
	mov	w0, -2
	b	.L61
.L130:
	ldr	x2, .LC18
	mov	w3, 397
	ldr	x1, .LC19
	mov	w0, 1
	add	x2, x2, 56
	bl	dprint_vfmw
	mov	w0, -2
	b	.L61
.L131:
	ldr	x1, .LC21
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -2
	b	.L61
	.size	InsertImgToVoQueue, .-InsertImgToVoQueue
	.align	3
.LC18:
	.xword	.LANCHOR0
	.align	3
.LC19:
	.xword	.LC2
	.align	3
.LC21:
	.xword	.LC20
	.align	3
.LC23:
	.xword	.LC22
	.align	3
.LC24:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC26:
	.xword	.LC25
	.align	3
.LC28:
	.xword	.LC27
	.align	3
.LC29:
	.xword	s_pstVfmwChan
	.align	3
.LC31:
	.xword	.LC30
	.align	3
.LC32:
	.xword	g_event_report
	.align	3
.LC34:
	.xword	.LC33
	.align	3
.LC35:
	.xword	g_VfmwChanStat
	.align	3
.LC36:
	.xword	g_LowDelaySeqIndex
	.align	3
.LC37:
	.xword	.LANCHOR1
	.align	3
.LC38:
	.xword	g_TraceFramePeriod
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetQueueImgNum
	.type	GetQueueImgNum, %function
GetQueueImgNum:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	mov	x20, x2
	bl	_mcount
	cmp	x21, xzr
	ccmp	x20, xzr, 4, ne
	ccmp	x19, xzr, 4, ne
	beq	.L146
	ldrh	w0, [x19, 6]
	ldrh	w3, [x19, 4]
	cmp	w0, w3
	bcs	.L147
	add	w1, w0, 64
	sub	w3, w1, w3
.L142:
	ldrh	w4, [x19, 8]
	cmp	w0, w4
	bls	.L145
	add	w4, w4, 64
.L145:
	str	w3, [x21]
	sub	w0, w4, w0
	str	w0, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L147:
	sub	w3, w0, w3
	b	.L142
	.p2align 3
.L146:
	ldr	x2, .LC39
	mov	w3, 563
	ldr	x1, .LC40
	mov	w0, 1
	add	x2, x2, 104
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	GetQueueImgNum, .-GetQueueImgNum
	.align	3
.LC39:
	.xword	.LANCHOR0
	.align	3
.LC40:
	.xword	.LC2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SYNTAX_ReceiveImage
	.type	SYNTAX_ReceiveImage, %function
SYNTAX_ReceiveImage:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L154
	mov	x0, x19
	bl	SYNTAX_GetVoQue
	mov	x19, x0
	cbz	x0, .L155
	ldr	x22, .LC45
	mov	w0, 2
	mov	w21, -3
	ldr	x1, [x22, 24]
	blr	x1
	ldrh	w1, [x19, 6]
	ldrh	w0, [x19, 8]
	cmp	w0, w1
	beq	.L152
	add	x1, x1, 2
	ldr	x3, [x22, 104]
	mov	x2, 640
	mov	x0, x20
	ldr	x23, [x20, 496]
	mov	w21, 1
	ldr	x1, [x19, x1, lsl 3]
	blr	x3
	str	x23, [x20, 496]
	ldr	x1, .LC47
	mov	w0, 12
	ldr	w5, [x20, 148]
	ldrh	w4, [x19, 8]
	ldrh	w3, [x19, 6]
	ldrh	w2, [x19, 4]
	bl	dprint_vfmw
	ldr	w1, [x20, 148]
	ldr	w0, [x19, 600]
	add	w0, w1, w0
	str	w0, [x20, 148]
	ldrh	w0, [x19, 6]
	add	w0, w0, w21
	and	w0, w0, 63
	strh	w0, [x19, 6]
.L152:
	ldr	x1, [x22, 32]
	mov	w0, 2
	blr	x1
	mov	w0, w21
.L150:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L154:
	ldr	x2, .LC41
	mov	w3, 678
	ldr	x1, .LC42
	mov	w0, 1
	add	x2, x2, 120
	bl	dprint_vfmw
	mov	w0, -2
	b	.L150
.L155:
	ldr	x2, .LC41
	mov	w0, 1
	ldr	x1, .LC44
	add	x2, x2, 120
	bl	dprint_vfmw
	mov	w0, -2
	b	.L150
	.size	SYNTAX_ReceiveImage, .-SYNTAX_ReceiveImage
	.align	3
.LC41:
	.xword	.LANCHOR0
	.align	3
.LC42:
	.xword	.LC2
	.align	3
.LC44:
	.xword	.LC43
	.align	3
.LC45:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC47:
	.xword	.LC46
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
	mov	x21, x0
	mov	x0, x30
	mov	x24, x1
	bl	_mcount
	cmp	x24, xzr
	ccmp	x21, xzr, 4, ne
	beq	.L207
	mov	x0, x21
	bl	SYNTAX_GetVoQue
	mov	x25, x0
	cbz	x0, .L208
	ldr	x22, .LC52
	mov	w0, 2
	ldr	x1, [x22, 24]
	blr	x1
	ldrh	w20, [x25, 4]
	ldrh	w1, [x25, 6]
	and	w20, w20, 63
	ldr	w26, [x24, 148]
	ldr	w0, [x25, 600]
	cmp	w1, w20
	sub	w26, w26, w0
	beq	.L191
	ldr	x23, .LC56
	b	.L205
	.p2align 3
.L164:
	add	w20, w20, 1
	and	w20, w20, 63
	cmp	w20, w1
	beq	.L191
.L205:
	sxtw	x19, w20
	add	x0, x19, 2
	ldr	x0, [x25, x0, lsl 3]
	cbz	x0, .L162
	ldr	w0, [x0, 148]
	cmp	w26, w0
	bne	.L164
	mov	w5, 1
.L163:
	ldrh	w4, [x25, 4]
	b	.L166
	.p2align 3
.L195:
	mov	w20, w1
.L166:
	cmp	w20, wzr
	sub	w0, w20, #1
	mov	w1, 63
	add	x2, x19, 2
	csel	w1, w0, w1, ne
	cmp	w20, w4
	sxtw	x0, w1
	add	x3, x0, 2
	mov	x19, x0
	ldr	x0, [x25, x3, lsl 3]
	str	x0, [x25, x2, lsl 3]
	bne	.L195
	ldr	w0, [x24, 148]
	cmp	w5, 1
	ldr	w1, [x25, 600]
	sub	w0, w0, w1
	str	w0, [x24, 148]
	ldrh	w2, [x25, 4]
	add	w2, w2, 1
	and	w2, w2, 63
	strh	w2, [x25, 4]
	beq	.L204
	ldrh	w1, [x25, 6]
	add	w20, w20, 1
	and	w20, w20, 63
	cmp	w20, w1
	bne	.L205
.L191:
	ldr	x1, .LC54
	mov	w2, w26
	mov	w0, 1
	mov	w19, -2
	bl	dprint_vfmw
.L161:
	ldr	x1, [x22, 32]
	mov	w0, 2
	blr	x1
	mov	w0, w19
.L158:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L162:
	mov	w2, w20
	mov	x1, x23
	mov	w0, 1
	bl	dprint_vfmw
	mov	w5, 2
	b	.L163
.L204:
	ldr	x1, .LC58
	mov	w0, 12
	ldrh	w4, [x25, 8]
	ldrh	w3, [x25, 6]
	ldr	w5, [x24, 148]
	bl	dprint_vfmw
	ldr	w1, [x21]
	cmp	w1, 20
	bls	.L209
.L197:
	mov	w0, -2
.L167:
	cmp	w1, 17
	bls	.L210
.L184:
	cmn	w0, #2
	beq	.L201
	mov	w19, -20
	cmp	w0, 1
	csinc	w19, w19, wzr, ne
	b	.L161
.L209:
	ldr	x0, .LC59
	ldrb	w0, [x0,w1,uxtw]
	adr	x2, .Lrtx169
	add	x0, x2, w0, sxtb #2
	br	x0
.Lrtx169:
	.section	.rodata
	.align	0
	.align	2
.L169:
	.byte	(.L168 - .Lrtx169) / 4
	.byte	(.L170 - .Lrtx169) / 4
	.byte	(.L171 - .Lrtx169) / 4
	.byte	(.L172 - .Lrtx169) / 4
	.byte	(.L197 - .Lrtx169) / 4
	.byte	(.L173 - .Lrtx169) / 4
	.byte	(.L174 - .Lrtx169) / 4
	.byte	(.L197 - .Lrtx169) / 4
	.byte	(.L175 - .Lrtx169) / 4
	.byte	(.L176 - .Lrtx169) / 4
	.byte	(.L177 - .Lrtx169) / 4
	.byte	(.L177 - .Lrtx169) / 4
	.byte	(.L177 - .Lrtx169) / 4
	.byte	(.L178 - .Lrtx169) / 4
	.byte	(.L197 - .Lrtx169) / 4
	.byte	(.L179 - .Lrtx169) / 4
	.byte	(.L180 - .Lrtx169) / 4
	.byte	(.L181 - .Lrtx169) / 4
	.byte	(.L182 - .Lrtx169) / 4
	.byte	(.L197 - .Lrtx169) / 4
	.byte	(.L183 - .Lrtx169) / 4
	.text
.L183:
	ldr	w1, [x24, 148]
	add	x0, x21, 8
	bl	USERDEC_RecycleImage
	ldr	w1, [x21]
	b	.L167
.L182:
	ldr	w1, [x24, 148]
	add	x0, x21, 8
	bl	AVS2DEC_RecycleImage
	ldr	w1, [x21]
	b	.L167
.L181:
	ldr	w1, [x24, 148]
	add	x0, x21, 8
	bl	VP9DEC_RecycleImage
	ldr	w1, [x21]
	b	.L167
.L180:
	ldr	w1, [x24, 148]
	add	x0, x21, 8
	bl	HEVC_DECRecycleImage
	ldr	w1, [x21]
	b	.L167
.L179:
	ldr	w1, [x24, 148]
	add	x0, x21, 8
	bl	MVC_DEC_RecycleImage
	ldr	w1, [x21]
	b	.L167
.L178:
	ldr	w1, [x24, 148]
	add	x0, x21, 8
	bl	VP8DEC_RecycleImage
	ldr	w1, [x21]
	b	.L167
.L177:
	ldr	w1, [x24, 148]
	add	x0, x21, 8
	bl	VP6DEC_RecycleImage
	ldr	w1, [x21]
	b	.L167
.L176:
	ldr	w1, [x24, 148]
	add	x0, x21, 8
	bl	REAL9DEC_RecycleImage
	ldr	w1, [x21]
	b	.L167
.L175:
	ldr	w1, [x24, 148]
	add	x0, x21, 8
	bl	REAL8DEC_RecycleImage
	ldr	w1, [x21]
	b	.L167
.L174:
	ldr	w1, [x24, 148]
	add	x0, x21, 8
	bl	AVSDEC_RecycleImage
	ldr	w1, [x21]
	b	.L167
.L173:
	ldr	w1, [x24, 148]
	add	x0, x21, 8
	bl	DIVX3DEC_RecycleImage
	ldr	w1, [x21]
	b	.L167
.L172:
	ldr	w1, [x24, 148]
	add	x0, x21, 8
	bl	MPEG2DEC_RecycleImage
	ldr	w1, [x21]
	b	.L167
.L171:
	ldr	w1, [x24, 148]
	add	x0, x21, 8
	bl	MPEG4DEC_RecycleImage
	ldr	w1, [x21]
	b	.L167
.L170:
	ldr	w1, [x24, 148]
	add	x0, x21, 8
	bl	VC1DEC_RecycleImage
	ldr	w1, [x21]
	b	.L167
.L168:
	ldr	w1, [x24, 148]
	add	x0, x21, 8
	bl	H264DEC_RecycleImage
	ldr	w1, [x21]
	b	.L167
.L210:
	ldr	x2, .LC60
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx186
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx186:
	.section	.rodata
	.align	0
	.align	2
.L186:
	.byte	(.L185 - .Lrtx186) / 4
	.byte	(.L184 - .Lrtx186) / 4
	.byte	(.L184 - .Lrtx186) / 4
	.byte	(.L184 - .Lrtx186) / 4
	.byte	(.L184 - .Lrtx186) / 4
	.byte	(.L184 - .Lrtx186) / 4
	.byte	(.L184 - .Lrtx186) / 4
	.byte	(.L184 - .Lrtx186) / 4
	.byte	(.L184 - .Lrtx186) / 4
	.byte	(.L184 - .Lrtx186) / 4
	.byte	(.L184 - .Lrtx186) / 4
	.byte	(.L184 - .Lrtx186) / 4
	.byte	(.L184 - .Lrtx186) / 4
	.byte	(.L184 - .Lrtx186) / 4
	.byte	(.L184 - .Lrtx186) / 4
	.byte	(.L189 - .Lrtx186) / 4
	.byte	(.L189 - .Lrtx186) / 4
	.byte	(.L189 - .Lrtx186) / 4
	.text
.L189:
	mov	w19, -20
	cmp	w0, wzr
	csinc	w19, w19, wzr, ne
	b	.L161
.L185:
	mov	w19, -20
	cmp	w0, wzr
	csinc	w19, w19, wzr, ne
	b	.L161
.L207:
	ldr	x1, .LC49
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -2
	b	.L158
.L208:
	ldr	x2, .LC50
	mov	w0, 1
	ldr	x1, .LC51
	add	x2, x2, 144
	bl	dprint_vfmw
	mov	w0, -2
	b	.L158
.L201:
	mov	w19, w0
	b	.L161
	.size	SYNTAX_ReleaseImage, .-SYNTAX_ReleaseImage
	.align	3
.LC49:
	.xword	.LC48
	.align	3
.LC50:
	.xword	.LANCHOR0
	.align	3
.LC51:
	.xword	.LC43
	.align	3
.LC52:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC54:
	.xword	.LC53
	.align	3
.LC56:
	.xword	.LC55
	.align	3
.LC58:
	.xword	.LC57
	.align	3
.LC59:
	.xword	.L169
	.align	3
.LC60:
	.xword	.L186
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
	cbz	x19, .L232
	ldr	w0, [x19]
	cmp	w0, 20
	bls	.L233
.L231:
	mov	w0, -2
	b	.L213
	.p2align 3
.L233:
	ldr	x1, .LC63
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx215
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx215:
	.section	.rodata
	.align	0
	.align	2
.L215:
	.byte	(.L229 - .Lrtx215) / 4
	.byte	(.L216 - .Lrtx215) / 4
	.byte	(.L217 - .Lrtx215) / 4
	.byte	(.L218 - .Lrtx215) / 4
	.byte	(.L231 - .Lrtx215) / 4
	.byte	(.L219 - .Lrtx215) / 4
	.byte	(.L220 - .Lrtx215) / 4
	.byte	(.L231 - .Lrtx215) / 4
	.byte	(.L221 - .Lrtx215) / 4
	.byte	(.L222 - .Lrtx215) / 4
	.byte	(.L223 - .Lrtx215) / 4
	.byte	(.L223 - .Lrtx215) / 4
	.byte	(.L223 - .Lrtx215) / 4
	.byte	(.L224 - .Lrtx215) / 4
	.byte	(.L231 - .Lrtx215) / 4
	.byte	(.L225 - .Lrtx215) / 4
	.byte	(.L226 - .Lrtx215) / 4
	.byte	(.L227 - .Lrtx215) / 4
	.byte	(.L228 - .Lrtx215) / 4
	.byte	(.L231 - .Lrtx215) / 4
	.byte	(.L229 - .Lrtx215) / 4
	.text
	.p2align 3
.L229:
	add	x19, x19, 16
	.p2align 2
.L230:
	ldr	x20, .LC64
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
.L213:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L227:
	add	x19, x19, 274432
	add	x19, x19, 4048
	b	.L230
	.p2align 3
.L226:
	add	x19, x19, 4096
	add	x19, x19, 2856
	b	.L230
	.p2align 3
.L225:
	add	x19, x19, 920
	b	.L230
	.p2align 3
.L224:
	add	x19, x19, 8192
	add	x19, x19, 48
	b	.L230
	.p2align 3
.L223:
	add	x19, x19, 12288
	add	x19, x19, 480
	b	.L230
	.p2align 3
.L222:
	add	x19, x19, 53248
	add	x19, x19, 1704
	b	.L230
	.p2align 3
.L228:
	add	x19, x19, 16384
	add	x19, x19, 2496
	b	.L230
	.p2align 3
.L217:
	add	x19, x19, 20480
	add	x19, x19, 2248
	b	.L230
	.p2align 3
.L216:
	add	x19, x19, 53248
	add	x19, x19, 304
	b	.L230
	.p2align 3
.L221:
	add	x19, x19, 53248
	add	x19, x19, 1728
	b	.L230
	.p2align 3
.L220:
	add	x19, x19, 12288
	add	x19, x19, 3984
	b	.L230
	.p2align 3
.L219:
	add	x19, x19, 40960
	add	x19, x19, 1672
	b	.L230
	.p2align 3
.L218:
	add	x19, x19, 86016
	add	x19, x19, 2792
	b	.L230
.L232:
	ldr	x2, .LC61
	mov	w3, 955
	ldr	x1, .LC62
	mov	w0, 1
	add	x2, x2, 168
	bl	dprint_vfmw
	mov	w0, -2
	b	.L213
	.size	SYNTAX_ReturnImage, .-SYNTAX_ReturnImage
	.align	3
.LC61:
	.xword	.LANCHOR0
	.align	3
.LC62:
	.xword	.LC2
	.align	3
.LC63:
	.xword	.L215
	.align	3
.LC64:
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
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L240
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
	add	x0, x20, 65536
	beq	.L241
	strb	wzr, [x19, 1]
	ldr	x1, .LC67
	ldrsw	x2, [x0, 1980]
	ldr	x1, [x1, x2, lsl 3]
	strb	wzr, [x1, 1696]
.L238:
	ldr	x1, [x20, 616]
	cbz	x1, .L242
.L234:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L240:
	ldr	x2, .LC65
	mov	w3, 1058
	ldr	x1, .LC66
	mov	w0, 1
	add	x2, x2, 192
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L241:
	mov	w1, 1
	strb	w1, [x19, 1]
	ldr	x2, .LC67
	ldrsw	x3, [x0, 1980]
	ldr	x2, [x2, x3, lsl 3]
	strb	w1, [x2, 1696]
	b	.L238
	.p2align 3
.L242:
	add	x20, x20, 12288
	ldrb	w1, [x20, 2640]
	cmp	w1, 1
	bne	.L234
	ldr	w0, [x0, 1980]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x20, 2640]
	b	.L234
	.size	DecodeStream_H264, .-DecodeStream_H264
	.align	3
.LC65:
	.xword	.LANCHOR0
	.align	3
.LC66:
	.xword	.LC2
	.align	3
.LC67:
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
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L253
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
	beq	.L246
	ldrb	w0, [x20, 9]
	cbnz	w0, .L246
	strb	wzr, [x19, 1]
	ldr	x0, .LC70
	ldrsw	x1, [x20, 276]
	ldr	x0, [x0, x1, lsl 3]
	strb	wzr, [x0, 1696]
.L248:
	ldr	x0, [x20, 3056]
	cbz	x0, .L254
.L243:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L246:
	mov	w0, 1
	strb	w0, [x19, 1]
	ldr	x1, .LC70
	ldrsw	x2, [x20, 276]
	ldr	x1, [x1, x2, lsl 3]
	strb	w0, [x1, 1696]
	b	.L248
	.p2align 3
.L253:
	ldr	x2, .LC68
	mov	w3, 1098
	ldr	x1, .LC69
	mov	w0, 1
	add	x2, x2, 216
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L254:
	ldrb	w0, [x20, 11]
	cmp	w0, 1
	bne	.L243
	ldr	w0, [x20, 276]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x20, 11]
	b	.L243
	.size	DecodeStream_HEVC, .-DecodeStream_HEVC
	.align	3
.LC68:
	.xword	.LANCHOR0
	.align	3
.LC69:
	.xword	.LC2
	.align	3
.LC70:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_VP9
	.type	DecodeStream_VP9, %function
DecodeStream_VP9:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L271
	ldrb	w0, [x19, 19]
	cmp	w0, 1
	beq	.L272
	ldr	x23, .LC73
	add	x22, x19, 96
	mov	x2, 88
	add	x1, x19, 8
	mov	x0, x22
	add	x21, x20, 311296
	ldr	x3, [x23, 104]
	blr	x3
	ldr	x3, [x23, 96]
	mov	x2, 88
	mov	w1, 0
	add	x0, x19, 184
	blr	x3
	mov	x1, x22
	mov	x0, x20
	bl	VP9DEC_DecodePacket
	ldr	w0, [x21, 3172]
	cbz	w0, .L259
	ldr	w0, [x21, 3208]
	ldr	w1, [x21, 3212]
	cmp	w1, w0
	beq	.L259
.L260:
	mov	w0, 1
	strb	w0, [x19, 1]
.L255:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L259:
	ldr	w0, [x21, 3168]
	cbnz	w0, .L260
	strb	wzr, [x19, 1]
	ldr	x0, [x20, 8]
	cbnz	x0, .L255
	add	x20, x20, 262144
	ldrb	w0, [x20, 1044]
	cbnz	w0, .L255
	ldr	x3, [x23, 96]
	mov	x2, 176
	mov	w1, 0
	mov	x0, x22
	blr	x3
	ldr	w1, [x19, 32]
	ldr	w0, [x21, 3272]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC74
	ldr	x4, [x0]
	cbz	x4, .L255
	ldr	w0, [x21, 3272]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	b	.L255
	.p2align 3
.L271:
	ldr	x2, .LC71
	mov	w3, 1134
	ldr	x1, .LC72
	mov	w0, 1
	add	x2, x2, 240
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L272:
	add	x20, x20, 311296
	ldr	w0, [x20, 3272]
	bl	VCTRL_OutputLastFrame
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 3272]
	bl	SM_ReleaseStreamSeg
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	DecodeStream_VP9, .-DecodeStream_VP9
	.align	3
.LC71:
	.xword	.LANCHOR0
	.align	3
.LC72:
	.xword	.LC2
	.align	3
.LC73:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC74:
	.xword	g_event_report
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
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L279
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
	beq	.L280
	strb	wzr, [x19, 1]
.L277:
	ldr	x0, [x20, 232]
	cbz	x0, .L281
.L273:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L279:
	ldr	x2, .LC75
	mov	w3, 1176
	ldr	x1, .LC76
	mov	w0, 1
	add	x2, x2, 264
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L280:
	mov	w0, 1
	strb	w0, [x19, 1]
	b	.L277
	.p2align 3
.L281:
	ldrb	w0, [x20, 1]
	cmp	w0, 1
	bne	.L273
	ldr	w0, [x20, 120]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x20, 1]
	b	.L273
	.size	DecodeStream_MVC, .-DecodeStream_MVC
	.align	3
.LC75:
	.xword	.LANCHOR0
	.align	3
.LC76:
	.xword	.LC2
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
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L296
	ldrb	w0, [x19, 19]
	cmp	w0, 1
	beq	.L297
	ldr	x21, .LC79
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
	bhi	.L286
	ldr	x1, .LC81
.L295:
	mov	w0, 0
	add	x20, x20, 53248
	bl	dprint_vfmw
	ldr	w1, [x19, 120]
	ldr	w0, [x20, 904]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC82
	ldr	x4, [x0]
	cbz	x4, .L282
	ldr	w0, [x20, 904]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L282:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L286:
	add	x2, x20, 16384
	ldr	x0, [x19, 96]
	add	x2, x2, 1528
	mov	w1, 16
	bl	Vc1SMPSeqHdr
	cbz	w0, .L298
	ldr	x1, .LC84
	b	.L295
	.p2align 3
.L296:
	ldr	x2, .LC77
	mov	w3, 1242
	ldr	x1, .LC78
	mov	w0, 1
	add	x2, x2, 288
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L298:
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
.L297:
	add	x20, x20, 53248
	ldr	w0, [x20, 904]
	bl	VCTRL_OutputLastFrame
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 904]
	bl	SM_ReleaseStreamSeg
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	DecodeStream_VC1_Smp, .-DecodeStream_VC1_Smp
	.align	3
.LC77:
	.xword	.LANCHOR0
	.align	3
.LC78:
	.xword	.LC2
	.align	3
.LC79:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC81:
	.xword	.LC80
	.align	3
.LC82:
	.xword	g_event_report
	.align	3
.LC84:
	.xword	.LC83
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_REAL8
	.type	DecodeStream_REAL8, %function
DecodeStream_REAL8:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L310
	ldrb	w0, [x19, 19]
	cmp	w0, 1
	beq	.L311
	ldr	x22, .LC87
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
	bl	REAL8DEC_Decode
	cmn	w0, #2
	beq	.L312
	strb	wzr, [x19, 1]
.L304:
	ldr	x0, [x20, 8]
	cbz	x0, .L313
.L299:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L310:
	ldr	x2, .LC85
	mov	w3, 1481
	ldr	x1, .LC86
	mov	w0, 1
	add	x2, x2, 312
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L312:
	mov	w0, 1
	strb	w0, [x19, 1]
	b	.L304
	.p2align 3
.L311:
	add	x20, x20, 53248
	ldr	w0, [x20, 2328]
	bl	VCTRL_OutputLastFrame
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 2328]
	bl	SM_ReleaseStreamSeg
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L313:
	ldr	x3, [x22, 96]
	mov	x2, 176
	mov	w1, 0
	mov	x0, x21
	add	x20, x20, 53248
	blr	x3
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 2328]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC88
	ldr	x4, [x0]
	cbz	x4, .L299
	ldr	w0, [x20, 2328]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	b	.L299
	.size	DecodeStream_REAL8, .-DecodeStream_REAL8
	.align	3
.LC85:
	.xword	.LANCHOR0
	.align	3
.LC86:
	.xword	.LC2
	.align	3
.LC87:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC88:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_REAL9
	.type	DecodeStream_REAL9, %function
DecodeStream_REAL9:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L325
	ldrb	w0, [x19, 19]
	cmp	w0, 1
	beq	.L326
	ldr	x22, .LC91
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
	bl	REAL9DEC_Decode
	cmn	w0, #2
	beq	.L327
	strb	wzr, [x19, 1]
.L319:
	ldr	x0, [x20, 8]
	cbz	x0, .L328
.L314:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L325:
	ldr	x2, .LC89
	mov	w3, 1518
	ldr	x1, .LC90
	mov	w0, 1
	add	x2, x2, 336
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L327:
	mov	w0, 1
	strb	w0, [x19, 1]
	b	.L319
	.p2align 3
.L326:
	add	x20, x20, 53248
	ldr	w0, [x20, 2304]
	bl	VCTRL_OutputLastFrame
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 2304]
	bl	SM_ReleaseStreamSeg
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L328:
	ldr	x3, [x22, 96]
	mov	x2, 176
	mov	w1, 0
	mov	x0, x21
	add	x20, x20, 53248
	blr	x3
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 2304]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC92
	ldr	x4, [x0]
	cbz	x4, .L314
	ldr	w0, [x20, 2304]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	b	.L314
	.size	DecodeStream_REAL9, .-DecodeStream_REAL9
	.align	3
.LC89:
	.xword	.LANCHOR0
	.align	3
.LC90:
	.xword	.LC2
	.align	3
.LC91:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC92:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_DIVX3
	.type	DecodeStream_DIVX3, %function
DecodeStream_DIVX3:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L340
	ldrb	w0, [x19, 19]
	cmp	w0, 1
	beq	.L341
	ldr	x22, .LC95
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
	bl	DIVX3DEC_Decode
	cmn	w0, #2
	beq	.L342
	strb	wzr, [x19, 1]
.L334:
	ldr	x0, [x20, 8]
	cbz	x0, .L343
.L329:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L340:
	ldr	x2, .LC93
	mov	w3, 1560
	ldr	x1, .LC94
	mov	w0, 1
	add	x2, x2, 360
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L342:
	mov	w0, 1
	strb	w0, [x19, 1]
	b	.L334
	.p2align 3
.L341:
	add	x20, x20, 40960
	ldr	w0, [x20, 2272]
	bl	VCTRL_OutputLastFrame
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 2272]
	bl	SM_ReleaseStreamSeg
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L343:
	ldr	x3, [x22, 96]
	mov	x2, 176
	mov	w1, 0
	mov	x0, x21
	add	x20, x20, 40960
	blr	x3
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 2272]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC96
	ldr	x4, [x0]
	cbz	x4, .L329
	ldr	w0, [x20, 2272]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	b	.L329
	.size	DecodeStream_DIVX3, .-DecodeStream_DIVX3
	.align	3
.LC93:
	.xword	.LANCHOR0
	.align	3
.LC94:
	.xword	.LC2
	.align	3
.LC95:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC96:
	.xword	g_event_report
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
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L355
	ldrb	w0, [x19, 19]
	cmp	w0, 1
	beq	.L356
	ldr	x22, .LC99
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
	beq	.L357
	strb	wzr, [x19, 1]
.L349:
	ldr	x0, [x20, 8]
	cbz	x0, .L358
.L344:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L355:
	ldr	x2, .LC97
	mov	w3, 1602
	ldr	x1, .LC98
	mov	w0, 1
	add	x2, x2, 384
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L357:
	mov	w0, 1
	strb	w0, [x19, 1]
	b	.L349
	.p2align 3
.L356:
	ldr	w0, [x20, 8840]
	bl	VCTRL_OutputLastFrame
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 8840]
	bl	SM_ReleaseStreamSeg
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L358:
	ldr	x3, [x22, 96]
	mov	x2, 176
	mov	w1, 0
	mov	x0, x21
	blr	x3
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 8840]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC100
	ldr	x4, [x0]
	cbz	x4, .L344
	ldr	w0, [x20, 8840]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	b	.L344
	.size	DecodeStream_VP8, .-DecodeStream_VP8
	.align	3
.LC97:
	.xword	.LANCHOR0
	.align	3
.LC98:
	.xword	.LC2
	.align	3
.LC99:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC100:
	.xword	g_event_report
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
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L370
	ldrb	w0, [x19, 19]
	cmp	w0, 1
	beq	.L371
	ldr	x22, .LC103
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
	beq	.L372
	strb	wzr, [x19, 1]
.L364:
	ldr	x0, [x20, 8]
	cbz	x0, .L373
.L359:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L370:
	ldr	x2, .LC101
	mov	w3, 1643
	ldr	x1, .LC102
	mov	w0, 1
	add	x2, x2, 408
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L372:
	mov	w0, 1
	strb	w0, [x19, 1]
	b	.L364
	.p2align 3
.L371:
	ldr	w0, [x20, 13368]
	bl	VCTRL_OutputLastFrame
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 13368]
	bl	SM_ReleaseStreamSeg
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L373:
	ldr	x3, [x22, 96]
	mov	x2, 176
	mov	w1, 0
	mov	x0, x21
	blr	x3
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 13368]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC104
	ldr	x4, [x0]
	cbz	x4, .L359
	ldr	w0, [x20, 13368]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	b	.L359
	.size	DecodeStream_VP6x, .-DecodeStream_VP6x
	.align	3
.LC101:
	.xword	.LANCHOR0
	.align	3
.LC102:
	.xword	.LC2
	.align	3
.LC103:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC104:
	.xword	g_event_report
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
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 31
	bhi	.L396
	cbz	x19, .L377
	ldr	x0, [x19, 8]
	cbz	x0, .L377
	ldr	x1, .LC109
	ldr	x1, [x1, w20, sxtw 3]
	ldr	w2, [x1, 1616]
	cmp	w2, 1
	beq	.L397
.L379:
	ldrb	w1, [x19, 18]
	strb	wzr, [x19, 448]
	cmp	w1, 1
	beq	.L398
	cbnz	w1, .L395
	ldr	x21, .LC110
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
	bls	.L395
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
	ldr	x1, .LC112
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC113
	ldr	x4, [x0]
	cbz	x4, .L383
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	mov	w0, w20
	blr	x4
.L383:
	strb	wzr, [x19, 2]
.L395:
	mov	w0, -1
.L394:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L397:
	ldr	w1, [x1, 1672]
	cmp	w1, 1
	bne	.L379
	ldrb	w1, [x19, 448]
	cmp	w1, 1
	bne	.L379
	mov	x2, 176
	add	x1, x19, 272
	add	x0, x19, 96
	bl	memcpy
	strb	wzr, [x19, 448]
	mov	w0, 0
	b	.L394
	.p2align 3
.L398:
	ldrb	w21, [x19, 2]
	cbz	w21, .L399
	cmp	w21, 1
	bne	.L395
	ldr	w2, [x19, 116]
	cmp	w2, 1023
	bhi	.L385
	ldr	x22, .LC110
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
.L386:
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
.L385:
	ldr	x3, .LC110
	mov	x2, 88
	add	x1, x19, 8
	add	x0, x19, 184
	ldr	x3, [x3, 104]
	blr	x3
	b	.L386
	.p2align 3
.L399:
	ldr	x20, .LC110
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
	b	.L394
	.p2align 3
.L396:
	ldr	x2, .LC105
	mov	w3, 1775
	ldr	x1, .LC106
	mov	w0, 1
	add	x2, x2, 432
	bl	dprint_vfmw
	mov	w0, -1
	b	.L394
	.p2align 3
.L377:
	ldr	x1, .LC108
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L394
	.size	SegMan, .-SegMan
	.align	3
.LC105:
	.xword	.LANCHOR0
	.align	3
.LC106:
	.xword	.LC2
	.align	3
.LC108:
	.xword	.LC107
	.align	3
.LC109:
	.xword	s_pstVfmwChan
	.align	3
.LC110:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC112:
	.xword	.LC111
	.align	3
.LC113:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_VC1_Adv
	.type	DecodeStream_VC1_Adv, %function
DecodeStream_VC1_Adv:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L406
	add	x21, x19, 53248
	mov	x0, x19
	ldr	w22, [x21, 904]
	bl	VC1_GetPacketState
	cmp	w0, 2
	beq	.L407
.L403:
	ldr	w0, [x21, 904]
	mov	x1, x20
	bl	SegMan
	cbz	w0, .L408
.L405:
	ldr	x0, [x19, 8]
	cbz	x0, .L409
.L400:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L406:
	ldr	x2, .LC114
	mov	w3, 1209
	ldr	x1, .LC115
	mov	w0, 1
	add	x2, x2, 440
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L408:
	add	x20, x20, 96
	mov	x0, x19
	mov	x1, x20
	bl	VC1DEC_Decode
	ldr	x3, .LC117
	mov	x2, 176
	mov	w1, 0
	mov	x0, x20
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x0, [x19, 8]
	cbnz	x0, .L400
	b	.L409
	.p2align 3
.L407:
	ldr	x0, .LC116
	ldr	x0, [x0, w22, sxtw 3]
	ldr	w1, [x0, 1616]
	cmp	w1, 1
	bne	.L404
	ldr	w0, [x0, 1672]
	cbnz	w0, .L403
.L404:
	add	x1, x19, 12288
	mov	x0, x19
	add	x1, x1, 2344
	bl	VC1DEC_Decode
	ldr	w0, [x21, 904]
	mov	x1, x20
	bl	SegMan
	cbnz	w0, .L405
	b	.L408
	.p2align 3
.L409:
	add	x19, x19, 12288
	ldrb	w0, [x19, 2527]
	cmp	w0, 1
	bne	.L400
	ldr	w0, [x21, 904]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x19, 2527]
	b	.L400
	.size	DecodeStream_VC1_Adv, .-DecodeStream_VC1_Adv
	.align	3
.LC114:
	.xword	.LANCHOR0
	.align	3
.LC115:
	.xword	.LC2
	.align	3
.LC116:
	.xword	s_pstVfmwChan
	.align	3
.LC117:
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
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L416
	ldrb	w2, [x19, 18]
	mov	w0, 22
	ldr	x1, .LC121
	bl	dprint_vfmw
	ldr	x1, .LC123
	mov	w0, 22
	ldr	w2, [x19, 24]
	bl	dprint_vfmw
	ldr	x1, .LC125
	mov	w0, 22
	ldr	w2, [x19, 28]
	bl	dprint_vfmw
	ldr	x1, [x20]
	ldr	w0, [x1, 604]
	cmp	w0, 1
	bhi	.L417
	ldr	w2, [x1, 608]
	cmp	w2, 8
	bgt	.L418
	add	x2, x20, 16384
	sxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x2, 1528]
	ldr	w0, [x1, 608]
	mov	x1, x20
	strb	w0, [x2, 1530]
	mov	x0, x19
	beq	.L419
	bl	DecodeStream_VC1_Smp
.L410:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L417:
	ldr	x1, .LC127
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L416:
	ldr	x2, .LC118
	mov	w3, 1293
	ldr	x1, .LC119
	mov	w0, 1
	add	x2, x2, 464
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L418:
	ldr	x1, .LC129
	mov	w0, 0
	bl	dprint_vfmw
	b	.L410
	.p2align 3
.L419:
	bl	DecodeStream_VC1_Adv
	b	.L410
	.size	DecodeStream_VC1, .-DecodeStream_VC1
	.align	3
.LC118:
	.xword	.LANCHOR0
	.align	3
.LC119:
	.xword	.LC2
	.align	3
.LC121:
	.xword	.LC120
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_MPEG2
	.type	DecodeStream_MPEG2, %function
DecodeStream_MPEG2:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L427
	add	x21, x19, 86016
	mov	x0, x19
	ldr	w22, [x21, 3392]
	bl	MP2_GetPacketState
	cmp	w0, 2
	beq	.L428
.L423:
	ldr	w0, [x21, 3392]
	mov	x1, x20
	bl	SegMan
	cbz	w0, .L429
.L425:
	ldr	x0, [x19, 8]
	cbz	x0, .L430
.L420:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L427:
	ldr	x2, .LC130
	mov	w3, 1333
	ldr	x1, .LC131
	mov	w0, 1
	add	x2, x2, 488
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L429:
	add	x1, x20, 96
	mov	x0, x19
	bl	MPEG2DEC_Decode
	ldrb	w0, [x21, 3409]
	cmp	w0, 1
	csel	w0, w0, wzr, eq
	strb	w0, [x20, 1]
	ldr	x0, [x19, 8]
	cbnz	x0, .L420
	b	.L430
	.p2align 3
.L428:
	ldr	x0, .LC132
	ldr	x0, [x0, w22, sxtw 3]
	ldr	w1, [x0, 1616]
	cmp	w1, 1
	bne	.L424
	ldr	w0, [x0, 1672]
	cbnz	w0, .L423
.L424:
	add	x1, x21, 2192
	mov	x0, x19
	bl	MPEG2DEC_Decode
	ldr	w0, [x21, 3392]
	mov	x1, x20
	bl	SegMan
	cbnz	w0, .L425
	b	.L429
	.p2align 3
.L430:
	ldrb	w0, [x21, 3410]
	cmp	w0, 1
	bne	.L420
	ldr	w0, [x21, 3392]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x21, 3410]
	b	.L420
	.size	DecodeStream_MPEG2, .-DecodeStream_MPEG2
	.align	3
.LC130:
	.xword	.LANCHOR0
	.align	3
.LC131:
	.xword	.LC2
	.align	3
.LC132:
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
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L437
	add	x21, x19, 20480
	mov	x0, x19
	ldr	w22, [x21, 2848]
	bl	MP4_GetPacketState
	cmp	w0, 3
	beq	.L438
.L434:
	ldr	w0, [x21, 2848]
	mov	x1, x20
	bl	SegMan
	cbz	w0, .L439
.L436:
	ldr	x0, [x19, 1040]
	cbz	x0, .L440
.L431:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L437:
	ldr	x2, .LC133
	mov	w3, 1378
	ldr	x1, .LC134
	mov	w0, 1
	add	x2, x2, 512
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L439:
	add	x1, x20, 96
	mov	x0, x19
	bl	MPEG4DEC_Decode
	ldr	x0, [x19, 1040]
	cbnz	x0, .L431
	b	.L440
	.p2align 3
.L438:
	ldr	x0, .LC135
	ldr	x0, [x0, w22, sxtw 3]
	ldr	w1, [x0, 1616]
	cmp	w1, 1
	bne	.L435
	ldr	w0, [x0, 1672]
	cbnz	w0, .L434
.L435:
	add	x1, x19, 12288
	mov	x0, x19
	add	x1, x1, 3440
	bl	MPEG4DEC_Decode
	ldr	w0, [x21, 2848]
	mov	x1, x20
	bl	SegMan
	cbnz	w0, .L436
	b	.L439
	.p2align 3
.L440:
	ldrb	w0, [x21, 2884]
	cmp	w0, 1
	bne	.L431
	ldr	w0, [x21, 2848]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x21, 2884]
	b	.L431
	.size	DecodeStream_MPEG4, .-DecodeStream_MPEG4
	.align	3
.LC133:
	.xword	.LANCHOR0
	.align	3
.LC134:
	.xword	.LC2
	.align	3
.LC135:
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
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L447
	mov	x0, x19
	ldr	w21, [x19, 4]
	bl	AVS_GetPacketState
	cbnz	w0, .L444
	ldr	x0, .LC138
	ldr	x0, [x0, w21, sxtw 3]
	ldr	w1, [x0, 1616]
	cmp	w1, 1
	beq	.L448
.L445:
	add	x1, x19, 16384
	mov	x0, x19
	add	x1, x1, 496
	bl	AVSDEC_Decode
.L444:
	ldr	w0, [x19, 4]
	mov	x1, x20
	bl	SegMan
	cbz	w0, .L449
	ldr	x0, [x19, 24]
	cbz	x0, .L450
.L441:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L447:
	ldr	x2, .LC136
	mov	w3, 1414
	ldr	x1, .LC137
	mov	w0, 1
	add	x2, x2, 536
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L449:
	add	x1, x20, 96
	mov	x0, x19
	bl	AVSDEC_Decode
	ldr	x0, [x19, 24]
	cbnz	x0, .L441
	b	.L450
	.p2align 3
.L448:
	ldr	w0, [x0, 1672]
	cbnz	w0, .L444
	b	.L445
	.p2align 3
.L450:
	ldrb	w0, [x19]
	cmp	w0, 1
	bne	.L441
	ldr	w0, [x19, 4]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x19]
	b	.L441
	.size	DecodeStream_AVS, .-DecodeStream_AVS
	.align	3
.LC136:
	.xword	.LANCHOR0
	.align	3
.LC137:
	.xword	.LC2
	.align	3
.LC138:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_AVS2
	.type	DecodeStream_AVS2, %function
DecodeStream_AVS2:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L457
	ldr	w0, [x19, 4]
	mov	x1, x20
	bl	SegMan
	cbz	w0, .L458
	ldr	w0, [x19, 8]
	cmp	w0, 1
	csel	w0, w0, wzr, eq
	strb	w0, [x20, 1]
	ldr	x0, [x19, 48]
	cbz	x0, .L459
.L451:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L457:
	ldr	x2, .LC139
	mov	w3, 1449
	ldr	x1, .LC140
	mov	w0, 1
	add	x2, x2, 560
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L458:
	add	x1, x20, 96
	mov	x0, x19
	bl	AVS2DEC_Decode
	ldr	w0, [x19, 8]
	cmp	w0, 1
	csel	w0, w0, wzr, eq
	strb	w0, [x20, 1]
	ldr	x0, [x19, 48]
	cbnz	x0, .L451
.L459:
	ldrb	w0, [x19]
	cmp	w0, 1
	bne	.L451
	ldr	w0, [x19, 4]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x19]
	b	.L451
	.size	DecodeStream_AVS2, .-DecodeStream_AVS2
	.align	3
.LC139:
	.xword	.LANCHOR0
	.align	3
.LC140:
	.xword	.LC2
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
	mov	x19, x0
	mov	x0, x30
	mov	x20, x2
	mov	w21, w1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L480
	mov	w0, 6
	bl	VCTRL_RecordPosTime
	cmp	w21, 18
	bls	.L481
.L463:
	ldr	x2, .LC141
	mov	w3, 1763
	ldr	x1, .LC145
	mov	w0, 32
	add	x2, x2, 584
	bl	dprint_vfmw
.L479:
	mov	w0, 7
	bl	VCTRL_RecordPosTime
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L481:
	ldr	x0, .LC143
	ldrb	w0, [x0,w21,uxtw]
	adr	x1, .Lrtx465
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx465:
	.section	.rodata
	.align	0
	.align	2
.L465:
	.byte	(.L464 - .Lrtx465) / 4
	.byte	(.L466 - .Lrtx465) / 4
	.byte	(.L467 - .Lrtx465) / 4
	.byte	(.L468 - .Lrtx465) / 4
	.byte	(.L463 - .Lrtx465) / 4
	.byte	(.L469 - .Lrtx465) / 4
	.byte	(.L470 - .Lrtx465) / 4
	.byte	(.L463 - .Lrtx465) / 4
	.byte	(.L471 - .Lrtx465) / 4
	.byte	(.L472 - .Lrtx465) / 4
	.byte	(.L473 - .Lrtx465) / 4
	.byte	(.L473 - .Lrtx465) / 4
	.byte	(.L473 - .Lrtx465) / 4
	.byte	(.L474 - .Lrtx465) / 4
	.byte	(.L463 - .Lrtx465) / 4
	.byte	(.L475 - .Lrtx465) / 4
	.byte	(.L476 - .Lrtx465) / 4
	.byte	(.L477 - .Lrtx465) / 4
	.byte	(.L478 - .Lrtx465) / 4
	.text
	.p2align 3
.L480:
	ldr	x2, .LC141
	mov	w3, 1683
	ldr	x1, .LC142
	mov	w0, 1
	add	x2, x2, 584
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L464:
	mov	x1, x20
	mov	x0, x19
	bl	DecodeStream_H264
	b	.L479
	.p2align 3
.L466:
	mov	x1, x20
	mov	x0, x19
	bl	DecodeStream_VC1
	b	.L479
	.p2align 3
.L467:
	mov	x1, x20
	mov	x0, x19
	bl	DecodeStream_MPEG4
	b	.L479
	.p2align 3
.L468:
	mov	x1, x20
	mov	x0, x19
	bl	DecodeStream_MPEG2
	b	.L479
	.p2align 3
.L469:
	mov	x1, x20
	mov	x0, x19
	bl	DecodeStream_DIVX3
	b	.L479
	.p2align 3
.L470:
	mov	x1, x20
	mov	x0, x19
	bl	DecodeStream_AVS
	b	.L479
	.p2align 3
.L471:
	mov	x1, x20
	mov	x0, x19
	bl	DecodeStream_REAL8
	b	.L479
	.p2align 3
.L472:
	mov	x1, x20
	mov	x0, x19
	bl	DecodeStream_REAL9
	b	.L479
	.p2align 3
.L473:
	mov	x1, x20
	mov	x0, x19
	bl	DecodeStream_VP6x
	b	.L479
	.p2align 3
.L474:
	mov	x1, x20
	mov	x0, x19
	bl	DecodeStream_VP8
	b	.L479
	.p2align 3
.L475:
	mov	x1, x20
	mov	x0, x19
	bl	DecodeStream_MVC
	b	.L479
	.p2align 3
.L476:
	mov	x1, x20
	mov	x0, x19
	bl	DecodeStream_HEVC
	b	.L479
	.p2align 3
.L477:
	mov	x1, x20
	mov	x0, x19
	bl	DecodeStream_VP9
	b	.L479
	.p2align 3
.L478:
	mov	x1, x20
	mov	x0, x19
	bl	DecodeStream_AVS2
	b	.L479
	.size	DecodeStream, .-DecodeStream
	.align	3
.LC141:
	.xword	.LANCHOR0
	.align	3
.LC142:
	.xword	.LC2
	.align	3
.LC143:
	.xword	.L465
	.align	3
.LC145:
	.xword	.LC144
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleasePacket
	.type	ReleasePacket, %function
ReleasePacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L508
	sub	w0, w20, #5
	cmp	w0, 12
	bls	.L509
.L485:
	ldr	x1, .LC157
	mov	w2, w20
	mov	w0, 0
	bl	dprint_vfmw
.L482:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L509:
	ldr	x1, .LC148
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx487
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx487:
	.section	.rodata
	.align	0
	.align	2
.L487:
	.byte	(.L486 - .Lrtx487) / 4
	.byte	(.L485 - .Lrtx487) / 4
	.byte	(.L485 - .Lrtx487) / 4
	.byte	(.L488 - .Lrtx487) / 4
	.byte	(.L489 - .Lrtx487) / 4
	.byte	(.L490 - .Lrtx487) / 4
	.byte	(.L490 - .Lrtx487) / 4
	.byte	(.L490 - .Lrtx487) / 4
	.byte	(.L491 - .Lrtx487) / 4
	.byte	(.L485 - .Lrtx487) / 4
	.byte	(.L485 - .Lrtx487) / 4
	.byte	(.L485 - .Lrtx487) / 4
	.byte	(.L492 - .Lrtx487) / 4
	.text
	.p2align 3
.L492:
	ldr	x20, [x19]
	add	x19, x19, 311296
	ldr	w1, [x20, 264]
	ldr	w0, [x19, 3272]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x20, 250]
	cmp	w0, 1
	beq	.L498
	ldr	x1, .LC155
	mov	w0, 1
	bl	dprint_vfmw
.L498:
	ldr	x3, .LC149
	mov	x2, 176
	mov	w1, 0
	add	x0, x20, 240
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L491:
	ldr	x20, [x19]
	ldr	w0, [x19, 8840]
	ldr	w1, [x20, 264]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x20, 250]
	cmp	w0, 1
	beq	.L498
	ldr	x1, .LC151
	mov	w0, 1
	bl	dprint_vfmw
	b	.L498
	.p2align 3
.L490:
	ldr	x20, [x19]
	ldr	w0, [x19, 13368]
	ldr	w1, [x20, 264]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x20, 250]
	cmp	w0, 1
	beq	.L498
	ldr	x1, .LC153
	mov	w0, 1
	bl	dprint_vfmw
	b	.L498
	.p2align 3
.L489:
	ldr	x20, [x19]
	ldrb	w1, [x20, 250]
	cmp	w1, 1
	bne	.L498
	add	x19, x19, 53248
	ldr	w1, [x20, 264]
	ldr	w0, [x19, 2304]
	bl	SM_ReleaseStreamSeg
	b	.L498
	.p2align 3
.L488:
	ldr	x20, [x19]
	ldrb	w1, [x20, 250]
	cmp	w1, 1
	bne	.L498
	add	x19, x19, 53248
	ldr	w1, [x20, 264]
	ldr	w0, [x19, 2328]
	bl	SM_ReleaseStreamSeg
	b	.L498
	.p2align 3
.L486:
	ldr	x20, [x19]
	ldrb	w1, [x20, 250]
	cmp	w1, 1
	bne	.L498
	add	x19, x19, 40960
	ldr	w1, [x20, 264]
	ldr	w0, [x19, 2272]
	bl	SM_ReleaseStreamSeg
	b	.L498
	.p2align 3
.L508:
	ldr	x2, .LC146
	mov	w3, 1862
	ldr	x1, .LC147
	mov	w0, 1
	add	x2, x2, 600
	bl	dprint_vfmw
	b	.L482
	.size	ReleasePacket, .-ReleasePacket
	.align	3
.LC146:
	.xword	.LANCHOR0
	.align	3
.LC147:
	.xword	.LC2
	.align	3
.LC148:
	.xword	.L487
	.align	3
.LC149:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC151:
	.xword	.LC150
	.align	3
.LC153:
	.xword	.LC152
	.align	3
.LC155:
	.xword	.LC154
	.align	3
.LC157:
	.xword	.LC156
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseCurPic_VPx
	.type	ReleaseCurPic_VPx, %function
ReleaseCurPic_VPx:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L529
	sub	w0, w19, #10
	cmp	w0, 7
	bls	.L530
.L510:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L530:
	ldr	x1, .LC160
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx514
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx514:
	.section	.rodata
	.align	0
	.align	2
.L514:
	.byte	(.L513 - .Lrtx514) / 4
	.byte	(.L513 - .Lrtx514) / 4
	.byte	(.L513 - .Lrtx514) / 4
	.byte	(.L515 - .Lrtx514) / 4
	.byte	(.L510 - .Lrtx514) / 4
	.byte	(.L510 - .Lrtx514) / 4
	.byte	(.L510 - .Lrtx514) / 4
	.byte	(.L516 - .Lrtx514) / 4
	.text
	.p2align 3
.L516:
	ldr	x19, [x20]
	add	x20, x20, 311296
	ldr	w1, [x19, 264]
	ldr	w0, [x20, 3272]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x19, 250]
	cmp	w0, 1
	beq	.L519
	ldr	x1, .LC161
	mov	w0, 1
	bl	dprint_vfmw
.L519:
	ldr	x3, .LC162
	mov	x2, 176
	mov	w1, 0
	add	x0, x19, 240
	ldr	x3, [x3, 96]
	blr	x3
.L531:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L515:
	ldr	x19, [x20]
	ldr	w0, [x20, 8840]
	ldr	w1, [x19, 264]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x19, 250]
	cmp	w0, 1
	beq	.L519
	ldr	x1, .LC163
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x3, .LC162
	mov	x2, 176
	mov	w1, 0
	add	x0, x19, 240
	ldr	x3, [x3, 96]
	blr	x3
	b	.L531
	.p2align 3
.L513:
	ldr	x19, [x20]
	ldr	w0, [x20, 13368]
	ldr	w1, [x19, 264]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x19, 250]
	cmp	w0, 1
	beq	.L519
	ldr	x1, .LC164
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x3, .LC162
	mov	x2, 176
	mov	w1, 0
	add	x0, x19, 240
	ldr	x3, [x3, 96]
	blr	x3
	b	.L531
	.p2align 3
.L529:
	ldr	x2, .LC158
	mov	w3, 1972
	ldr	x1, .LC159
	mov	w0, 1
	add	x2, x2, 616
	bl	dprint_vfmw
	b	.L510
	.size	ReleaseCurPic_VPx, .-ReleaseCurPic_VPx
	.align	3
.LC158:
	.xword	.LANCHOR0
	.align	3
.LC159:
	.xword	.LC2
	.align	3
.LC160:
	.xword	.L514
	.align	3
.LC161:
	.xword	.LC154
	.align	3
.LC162:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC163:
	.xword	.LC150
	.align	3
.LC164:
	.xword	.LC152
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseCurPic_Realx
	.type	ReleaseCurPic_Realx, %function
ReleaseCurPic_Realx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L539
	cmp	w20, 8
	beq	.L535
	cmp	w20, 9
	bne	.L532
	ldr	x20, [x19]
	ldrb	w1, [x20, 250]
	cmp	w1, 1
	beq	.L540
.L538:
	ldr	x3, .LC167
	mov	x2, 176
	mov	w1, 0
	add	x0, x20, 240
	ldr	x3, [x3, 96]
	blr	x3
.L532:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L535:
	ldr	x20, [x19]
	ldrb	w1, [x20, 250]
	cmp	w1, 1
	bne	.L538
	add	x19, x19, 53248
	ldr	w1, [x20, 264]
	ldr	w0, [x19, 2328]
	bl	SM_ReleaseStreamSeg
	b	.L538
	.p2align 3
.L539:
	ldr	x2, .LC165
	mov	w3, 2029
	ldr	x1, .LC166
	mov	w0, 1
	add	x2, x2, 640
	bl	dprint_vfmw
	b	.L532
	.p2align 3
.L540:
	add	x19, x19, 53248
	ldr	w1, [x20, 264]
	ldr	w0, [x19, 2304]
	bl	SM_ReleaseStreamSeg
	b	.L538
	.size	ReleaseCurPic_Realx, .-ReleaseCurPic_Realx
	.align	3
.LC165:
	.xword	.LANCHOR0
	.align	3
.LC166:
	.xword	.LC2
	.align	3
.LC167:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseCurPic_DIVX3
	.type	ReleaseCurPic_DIVX3, %function
ReleaseCurPic_DIVX3:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L545
	ldr	x20, [x19]
	ldrb	w1, [x20, 250]
	cmp	w1, 1
	beq	.L546
.L544:
	ldr	x3, .LC170
	mov	x2, 176
	mov	w1, 0
	add	x0, x20, 240
	ldr	x3, [x3, 96]
	blr	x3
.L541:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L546:
	add	x19, x19, 40960
	ldr	w1, [x20, 264]
	ldr	w0, [x19, 2272]
	bl	SM_ReleaseStreamSeg
	b	.L544
	.p2align 3
.L545:
	ldr	x2, .LC168
	mov	w3, 2071
	ldr	x1, .LC169
	mov	w0, 1
	add	x2, x2, 664
	bl	dprint_vfmw
	b	.L541
	.size	ReleaseCurPic_DIVX3, .-ReleaseCurPic_DIVX3
	.align	3
.LC168:
	.xword	.LANCHOR0
	.align	3
.LC169:
	.xword	.LC2
	.align	3
.LC170:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseCurPic
	.type	ReleaseCurPic, %function
ReleaseCurPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L566
	cmp	w20, 18
	bls	.L567
.L550:
	ldr	x1, .LC174
	mov	w2, w20
	mov	w0, 0
	bl	dprint_vfmw
.L547:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L567:
	ldr	x0, .LC173
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx552
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx552:
	.section	.rodata
	.align	0
	.align	2
.L552:
	.byte	(.L551 - .Lrtx552) / 4
	.byte	(.L553 - .Lrtx552) / 4
	.byte	(.L554 - .Lrtx552) / 4
	.byte	(.L555 - .Lrtx552) / 4
	.byte	(.L550 - .Lrtx552) / 4
	.byte	(.L556 - .Lrtx552) / 4
	.byte	(.L557 - .Lrtx552) / 4
	.byte	(.L550 - .Lrtx552) / 4
	.byte	(.L558 - .Lrtx552) / 4
	.byte	(.L559 - .Lrtx552) / 4
	.byte	(.L560 - .Lrtx552) / 4
	.byte	(.L560 - .Lrtx552) / 4
	.byte	(.L560 - .Lrtx552) / 4
	.byte	(.L561 - .Lrtx552) / 4
	.byte	(.L550 - .Lrtx552) / 4
	.byte	(.L562 - .Lrtx552) / 4
	.byte	(.L563 - .Lrtx552) / 4
	.byte	(.L564 - .Lrtx552) / 4
	.byte	(.L565 - .Lrtx552) / 4
	.text
	.p2align 3
.L565:
	mov	x0, x19
	bl	AVS2DEC_ClearCurPic
	b	.L547
	.p2align 3
.L564:
	mov	x1, x19
	mov	w0, 17
	bl	ReleaseCurPic_VPx
	b	.L547
	.p2align 3
.L563:
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	b	.L547
	.p2align 3
.L562:
	mov	x0, x19
	bl	MVC_ClearCurrPic
	b	.L547
	.p2align 3
.L561:
	mov	x1, x19
	mov	w0, 13
	bl	ReleaseCurPic_VPx
	b	.L547
	.p2align 3
.L560:
	mov	x1, x19
	mov	w0, w20
	bl	ReleaseCurPic_VPx
	b	.L547
	.p2align 3
.L559:
	mov	x1, x19
	mov	w0, 9
	bl	ReleaseCurPic_Realx
	b	.L547
	.p2align 3
.L558:
	mov	x1, x19
	mov	w0, 8
	bl	ReleaseCurPic_Realx
	b	.L547
	.p2align 3
.L557:
	mov	x0, x19
	bl	AVS_ClearCurPic
	b	.L547
	.p2align 3
.L556:
	mov	x1, x19
	mov	w0, 5
	bl	ReleaseCurPic_DIVX3
	b	.L547
	.p2align 3
.L555:
	mov	x0, x19
	bl	MP2_ClearCurPic
	b	.L547
	.p2align 3
.L554:
	mov	x0, x19
	bl	MP4_ClearCurPic
	mov	x0, x19
	bl	MP4_Clean_HeadPacket
	b	.L547
	.p2align 3
.L553:
	add	x1, x19, 53248
	add	x0, x19, 12288
	add	x0, x0, 2520
	ldr	w1, [x1, 904]
	bl	VC1_ClearCurPic
	b	.L547
	.p2align 3
.L551:
	mov	x0, x19
	bl	H264_ClearCurrPic
	b	.L547
	.p2align 3
.L566:
	ldr	x2, .LC171
	mov	w3, 2087
	ldr	x1, .LC172
	mov	w0, 1
	add	x2, x2, 688
	bl	dprint_vfmw
	b	.L547
	.size	ReleaseCurPic, .-ReleaseCurPic
	.align	3
.LC171:
	.xword	.LANCHOR0
	.align	3
.LC172:
	.xword	.LC2
	.align	3
.LC173:
	.xword	.L552
	.align	3
.LC174:
	.xword	.LC156
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
	mov	w22, w0
	mov	x0, x30
	mov	x19, x1
	mov	x20, x3
	mov	w21, w2
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L627
	cmp	w21, 2
	mov	w0, 0
	ldr	x1, [x20]
	beq	.L628
.L571:
	ldrb	w2, [x1]
	ldrb	w3, [x1, 1]
	ldrb	w4, [x1, 2]
	cbnz	w2, .L574
	cbnz	w3, .L574
	cmp	w4, 1
	bne	.L574
	cmp	w21, 18
	bls	.L629
.L594:
	mov	w0, -1
.L570:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L629:
	ldr	x2, .LC179
	ldrb	w2, [x2,w21,uxtw]
	adr	x3, .Lrtx578
	add	x2, x3, w2, sxtb #2
	br	x2
.Lrtx578:
	.section	.rodata
	.align	0
	.align	2
.L578:
	.byte	(.L577 - .Lrtx578) / 4
	.byte	(.L579 - .Lrtx578) / 4
	.byte	(.L572 - .Lrtx578) / 4
	.byte	(.L580 - .Lrtx578) / 4
	.byte	(.L594 - .Lrtx578) / 4
	.byte	(.L594 - .Lrtx578) / 4
	.byte	(.L581 - .Lrtx578) / 4
	.byte	(.L594 - .Lrtx578) / 4
	.byte	(.L594 - .Lrtx578) / 4
	.byte	(.L594 - .Lrtx578) / 4
	.byte	(.L594 - .Lrtx578) / 4
	.byte	(.L594 - .Lrtx578) / 4
	.byte	(.L594 - .Lrtx578) / 4
	.byte	(.L594 - .Lrtx578) / 4
	.byte	(.L594 - .Lrtx578) / 4
	.byte	(.L582 - .Lrtx578) / 4
	.byte	(.L583 - .Lrtx578) / 4
	.byte	(.L594 - .Lrtx578) / 4
	.byte	(.L584 - .Lrtx578) / 4
	.text
	.p2align 3
.L628:
	ldrb	w2, [x20, 80]
	and	w0, w2, 1
	tbz	x2, 0, .L571
.L572:
	ldrb	w2, [x1, 3]
	mov	w5, 176
	mov	w3, 47
	cmp	w2, 179
	add	w4, w2, 75
	ccmp	w2, w5, 4, ne
	cset	w5, eq
	cmp	w2, 254
	ccmp	w2, w3, 0, ne
	uxtb	w4, w4
	cset	w3, ls
	cmp	w4, 1
	orr	w3, w5, w3
	cset	w4, ls
	orr	w3, w4, w3
	cbz	w3, .L587
	ldr	w3, [x19]
	cbnz	w3, .L587
.L588:
	mov	w0, 1
	str	w0, [x19]
	mov	w0, 0
	ldrb	w2, [x1, 3]
.L589:
	cmp	w2, 182
	bne	.L570
.L620:
	str	wzr, [x19]
.L631:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L580:
	ldrb	w2, [x1, 3]
	mov	w3, 179
	add	w0, w2, 73
	cmp	w2, wzr
	ccmp	w2, w3, 4, ne
	uxtb	w0, w0
	ccmp	w0, 1, 0, ne
	bls	.L630
	ldr	x3, .LC180
	mov	w0, -1
	ldr	x4, [x3, w22, sxtw 3]
	ldr	x3, [x4, 752]
	cmn	x3, #1
	bne	.L586
	ldr	w3, [x19]
	cbnz	w3, .L586
	add	w3, w2, w0
	uxtb	w3, w3
	cmp	w3, 174
	bhi	.L586
	ldr	x2, [x20, 32]
	str	x2, [x4, 752]
	ldrb	w2, [x1, 3]
.L586:
	cbnz	w2, .L570
.L625:
	str	wzr, [x19]
	b	.L631
	.p2align 3
.L584:
	ldrb	w2, [x1, 3]
	add	w3, w2, 80
	add	w0, w2, 74
	cmp	w2, 179
	uxtb	w3, w3
	cset	w4, eq
	uxtb	w0, w0
	cmp	w3, 1
	ccmp	w0, 1, 0, hi
	cset	w0, ls
	orr	w0, w4, w0
	cbz	w0, .L606
.L624:
	ldr	w0, [x19]
	cbnz	w0, .L606
	mov	w0, 1
	str	w0, [x19]
	mov	w0, 0
	ldrb	w2, [x1, 3]
	cmp	w2, 179
	cset	w4, eq
.L591:
	cmp	w2, 182
	cset	w1, eq
	orr	w1, w4, w1
	cbz	w1, .L570
	str	wzr, [x19]
	b	.L631
	.p2align 3
.L582:
	mov	x0, x19
	bl	MVC_IsNewPicNal
	b	.L570
	.p2align 3
.L581:
	ldrb	w2, [x1, 3]
	add	w3, w2, 74
	cmp	w2, 179
	cset	w4, eq
	cmp	w2, 176
	uxtb	w3, w3
	cset	w0, eq
	cmp	w3, 1
	orr	w0, w4, w0
	cset	w3, ls
	orr	w0, w3, w0
	cbnz	w0, .L624
.L606:
	mov	w0, -1
	b	.L591
	.p2align 3
.L579:
	ldrb	w2, [x1, 3]
	mov	w0, -1
	sub	w3, w2, #12
	uxtb	w3, w3
	cmp	w3, 3
	ccmp	w2, 10, 4, hi
	cset	w3, eq
	cbnz	w3, .L632
.L592:
	cmp	w2, 13
	bne	.L570
	b	.L620
	.p2align 3
.L577:
	mov	x0, x19
	bl	H264_IsNewPicNal
	b	.L570
	.p2align 3
.L583:
	mov	x0, x19
	bl	HEVC_IsNewPicNal
	b	.L570
	.p2align 3
.L587:
	cbnz	w0, .L588
	mov	w0, -1
	b	.L589
	.p2align 3
.L574:
	ldr	x1, .LC178
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L632:
	ldr	w3, [x19]
	cbnz	w3, .L592
	mov	w0, 1
	str	w0, [x19]
	mov	w0, 0
	ldrb	w2, [x1, 3]
	b	.L592
	.p2align 3
.L630:
	ldr	w3, [x19]
	mov	w0, -1
	cbnz	w3, .L586
	mov	w0, 1
	str	w0, [x19]
	mov	w0, 0
	ldrb	w2, [x1, 3]
	cbz	w2, .L625
	b	.L570
	.p2align 3
.L627:
	ldr	x2, .LC175
	mov	w3, 2363
	ldr	x1, .LC176
	mov	w0, 1
	add	x2, x2, 704
	bl	dprint_vfmw
	mov	w0, -1
	b	.L570
	.size	IsNewpicSeg, .-IsNewpicSeg
	.align	3
.LC175:
	.xword	.LANCHOR0
	.align	3
.LC176:
	.xword	.LC2
	.align	3
.LC178:
	.xword	.LC177
	.align	3
.LC179:
	.xword	.L578
	.align	3
.LC180:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CloseUsdPool
	.type	CloseUsdPool, %function
CloseUsdPool:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	cmp	w20, 31
	bhi	.L639
	ldr	x19, .LC183
	add	x19, x19, 128
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L633
	ldr	x1, .LC184
	ldr	x1, [x1, 440]
	blr	x1
	str	xzr, [x19, w20, sxtw 3]
.L633:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L639:
	ldr	x2, .LC181
	mov	w3, 2421
	ldr	x1, .LC182
	mov	w0, 1
	add	x2, x2, 720
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CloseUsdPool, .-CloseUsdPool
	.align	3
.LC181:
	.xword	.LANCHOR0
	.align	3
.LC182:
	.xword	.LC2
	.align	3
.LC183:
	.xword	.LANCHOR1
	.align	3
.LC184:
	.xword	vfmw_Osal_Func_Ptr_S
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
	cmp	w19, 31
	bhi	.L646
	ldr	x0, .LC188
	add	x0, x0, 128
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L640
	str	xzr, [x0, w19, sxtw 3]
.L640:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L646:
	ldr	x2, .LC186
	mov	w3, 2453
	ldr	x1, .LC187
	mov	w0, 1
	add	x2, x2, 736
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CloseUsdPool_WithMem, .-CloseUsdPool_WithMem
	.align	3
.LC186:
	.xword	.LANCHOR0
	.align	3
.LC187:
	.xword	.LC2
	.align	3
.LC188:
	.xword	.LANCHOR1
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
	cmp	w19, 31
	bhi	.L653
	ldr	x0, .LC194
	add	x0, x0, 128
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L651
	add	x1, x0, 204800
	str	wzr, [x0]
	add	x1, x1, 536
	add	x0, x0, 1048
	.p2align 2
.L650:
	stp	wzr, wzr, [x0, -4]
	add	x0, x0, 1064
	cmp	x0, x1
	bne	.L650
	mov	w0, 0
.L649:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L653:
	ldr	x2, .LC192
	mov	w3, 2471
	ldr	x1, .LC193
	mov	w0, 1
	add	x2, x2, 760
	bl	dprint_vfmw
	mov	w0, -1
	b	.L649
.L651:
	mov	w0, -1
	b	.L649
	.size	InitUsdPool, .-InitUsdPool
	.align	3
.LC192:
	.xword	.LANCHOR0
	.align	3
.LC193:
	.xword	.LC2
	.align	3
.LC194:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	OpenUsdPool
	.type	OpenUsdPool, %function
OpenUsdPool:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L658
	ldr	x20, .LC198
	add	x20, x20, 128
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L659
.L657:
	mov	w0, w19
	bl	InitUsdPool
.L656:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L659:
	ldr	x1, .LC199
	mov	w0, 7688
	movk	w0, 0x3, lsl 16
	ldr	x1, [x1, 432]
	blr	x1
	str	x0, [x20, w19, sxtw 3]
	b	.L657
	.p2align 3
.L658:
	ldr	x2, .LC196
	mov	w3, 2406
	ldr	x1, .LC197
	mov	w0, 1
	add	x2, x2, 776
	bl	dprint_vfmw
	mov	w0, -1
	b	.L656
	.size	OpenUsdPool, .-OpenUsdPool
	.align	3
.LC196:
	.xword	.LANCHOR0
	.align	3
.LC197:
	.xword	.LC2
	.align	3
.LC198:
	.xword	.LANCHOR1
	.align	3
.LC199:
	.xword	vfmw_Osal_Func_Ptr_S
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
	cmp	w19, 31
	bhi	.L665
	cbz	x20, .L666
	ldr	x0, .LC203
	add	x0, x0, 128
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L667
.L664:
	mov	w0, w19
	bl	InitUsdPool
.L662:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L667:
	str	x20, [x0, w19, sxtw 3]
	b	.L664
	.p2align 3
.L665:
	ldr	x2, .LC201
	mov	w3, 2438
	ldr	x1, .LC202
	mov	w0, 1
	add	x2, x2, 792
	bl	dprint_vfmw
	mov	w0, -1
	b	.L662
.L666:
	ldr	x2, .LC201
	mov	w3, 2439
	ldr	x1, .LC202
	mov	w0, 1
	add	x2, x2, 792
	bl	dprint_vfmw
	mov	w0, -1
	b	.L662
	.size	OpenUsdPool_WithMem, .-OpenUsdPool_WithMem
	.align	3
.LC201:
	.xword	.LANCHOR0
	.align	3
.LC202:
	.xword	.LC2
	.align	3
.LC203:
	.xword	.LANCHOR1
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
	cmp	w19, 31
	bhi	.L675
	ldr	x0, .LC207
	add	x0, x0, 128
	ldr	x3, [x0, w19, sxtw 3]
	cbz	x3, .L673
	add	x0, x3, 1048
	mov	w1, 0
	b	.L672
	.p2align 3
.L671:
	add	w1, w1, 1
	add	x0, x0, 1064
	cmp	w1, 192
	beq	.L673
.L672:
	ldr	w2, [x0]
	cbnz	w2, .L671
	ldr	w2, [x0, -4]
	cbnz	w2, .L671
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
.L670:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L673:
	mov	x0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L675:
	ldr	x2, .LC205
	mov	w3, 2501
	ldr	x1, .LC206
	mov	w0, 1
	add	x2, x2, 816
	bl	dprint_vfmw
	mov	x0, 0
	b	.L670
	.size	GetUsd, .-GetUsd
	.align	3
.LC205:
	.xword	.LANCHOR0
	.align	3
.LC206:
	.xword	.LC2
	.align	3
.LC207:
	.xword	.LANCHOR1
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
	cbz	x19, .L676
	str	wzr, [x19, 1040]
.L676:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FreeUsdByDec, .-FreeUsdByDec
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MarkUsdByDnr
	.type	MarkUsdByDnr, %function
MarkUsdByDnr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L684
	mov	w0, 1
	str	w0, [x19, 1036]
.L681:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L684:
	ldr	x2, .LC209
	mov	w3, 2544
	ldr	x1, .LC210
	mov	w0, 1
	add	x2, x2, 824
	bl	dprint_vfmw
	b	.L681
	.size	MarkUsdByDnr, .-MarkUsdByDnr
	.align	3
.LC209:
	.xword	.LANCHOR0
	.align	3
.LC210:
	.xword	.LC2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UnMarkUsdByDnr
	.type	UnMarkUsdByDnr, %function
UnMarkUsdByDnr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L688
	str	wzr, [x19, 1036]
.L685:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L688:
	ldr	x2, .LC211
	mov	w3, 2554
	ldr	x1, .LC212
	mov	w0, 1
	add	x2, x2, 840
	bl	dprint_vfmw
	b	.L685
	.size	UnMarkUsdByDnr, .-UnMarkUsdByDnr
	.align	3
.LC211:
	.xword	.LANCHOR0
	.align	3
.LC212:
	.xword	.LC2
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
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cbz	x19, .L702
	cbz	x20, .L703
	ldrh	w0, [x19, 4]
	ldrh	w4, [x19, 8]
	and	w0, w0, 63
	.p2align 2
.L701:
	cmp	w0, w4
	beq	.L695
	sxtw	x2, w0
	add	w0, w0, 1
	add	x2, x2, 2
	and	w0, w0, 63
	ldr	x2, [x19, x2, lsl 3]
	cbz	x2, .L701
	ldr	w3, [x2, 148]
	ldr	w2, [x20, 148]
	cmp	w3, w2
	bne	.L701
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L695:
	mov	w0, -1
.L691:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L703:
	ldr	x1, .LC215
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L691
.L702:
	ldr	x2, .LC213
	mov	w3, 2566
	ldr	x1, .LC214
	mov	w0, 1
	add	x2, x2, 856
	bl	dprint_vfmw
	mov	w0, -1
	b	.L691
	.size	IsImageInVoQueue, .-IsImageInVoQueue
	.align	3
.LC213:
	.xword	.LANCHOR0
	.align	3
.LC214:
	.xword	.LC2
	.align	3
.LC215:
	.xword	.LC20
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsVoQueueEmpty
	.type	IsVoQueueEmpty, %function
IsVoQueueEmpty:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L708
	ldrh	w2, [x19, 6]
	mov	w0, 0
	ldrh	w1, [x19, 8]
	cmp	w1, w2
	beq	.L709
.L706:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L709:
	ldrh	w0, [x19, 4]
	ldr	x19, [sp, 16]
	cmp	w0, w1
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L708:
	ldr	x2, .LC216
	mov	w0, 0
	ldr	x1, .LC218
	add	x2, x2, 880
	bl	dprint_vfmw
	mov	w0, 0
	b	.L706
	.size	IsVoQueueEmpty, .-IsVoQueueEmpty
	.align	3
.LC216:
	.xword	.LANCHOR0
	.align	3
.LC218:
	.xword	.LC217
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
	cbz	x19, .L721
	cmp	w20, 5
	bls	.L722
	ldr	x1, .LC223
	mov	w0, 1
	mov	w2, w20
	stp	wzr, w0, [x19, 100]
	bl	dprint_vfmw
.L710:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L722:
	ldr	x0, .LC221
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx715
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx715:
	.section	.rodata
	.align	0
	.align	2
.L715:
	.byte	(.L714 - .Lrtx715) / 4
	.byte	(.L716 - .Lrtx715) / 4
	.byte	(.L717 - .Lrtx715) / 4
	.byte	(.L718 - .Lrtx715) / 4
	.byte	(.L719 - .Lrtx715) / 4
	.byte	(.L720 - .Lrtx715) / 4
	.text
	.p2align 3
.L719:
	mov	w1, 235
	mov	w0, 100
	stp	w1, w0, [x19, 100]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L718:
	mov	w1, 221
	mov	w0, 100
	stp	w1, w0, [x19, 100]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L717:
	mov	w1, 16
	mov	w0, 9
	stp	w1, w0, [x19, 100]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L716:
	mov	w1, 4
	mov	w0, 3
	stp	w1, w0, [x19, 100]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L714:
	mov	w0, 1
	stp	wzr, w0, [x19, 100]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L720:
	mov	w0, 2
	stp	wzr, w0, [x19, 100]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L721:
	ldr	x2, .LC219
	mov	w3, 2614
	ldr	x1, .LC220
	mov	w0, 1
	add	x2, x2, 896
	bl	dprint_vfmw
	b	.L710
	.size	SetAspectRatio, .-SetAspectRatio
	.align	3
.LC219:
	.xword	.LANCHOR0
	.align	3
.LC220:
	.xword	.LC2
	.align	3
.LC221:
	.xword	.L715
	.align	3
.LC223:
	.xword	.LC222
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
	cbz	x19, .L727
	ldr	w0, [x19, 552]
	ldr	x19, [sp, 16]
	cmp	w0, 1
	csinv	w0, w0, wzr, hi
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L727:
	ldr	x2, .LC224
	mov	w3, 2662
	ldr	x1, .LC225
	mov	w0, 1
	add	x2, x2, 912
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
	.size	GetVoLastImageID, .-GetVoLastImageID
	.align	3
.LC224:
	.xword	.LANCHOR0
	.align	3
.LC225:
	.xword	.LC2
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
	cbz	x19, .L737
	ldr	w1, [x19, 332]
	cmp	w1, 1
	beq	.L732
	ldr	w2, [x19, 336]
	mov	w0, 0
	cmp	w2, 1
	beq	.L735
	cmp	w1, 2
	ldr	w1, [x19, 340]
	beq	.L734
	cmp	w1, 1
	cset	w0, eq
.L731:
	cmp	w1, 1
	cset	w1, eq
	orr	w0, w1, w0
.L735:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L732:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L734:
	mov	w0, 1
	b	.L731
	.p2align 3
.L737:
	ldr	x2, .LC226
	mov	w3, 2677
	ldr	x1, .LC227
	mov	w0, 1
	add	x2, x2, 936
	bl	dprint_vfmw
	mov	w0, 0
	b	.L735
	.size	IsMain10Profile, .-IsMain10Profile
	.align	3
.LC226:
	.xword	.LANCHOR0
	.align	3
.LC227:
	.xword	.LC2
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
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	mov	x21, x2
	bl	_mcount
	cmp	w20, 31
	bhi	.L742
	ldr	x0, .LC230
	sub	x19, x19, x21
	ldr	x0, [x0, w20, sxtw 3]
	ldr	w0, [x0, 128]
	cbnz	w0, .L743
	cmp	x19, 1000
	ldr	x21, [sp, 32]
	cset	w0, hi
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L743:
	mov	x0, 16960
	ldr	x21, [sp, 32]
	movk	x0, 0xf, lsl 16
	cmp	x19, x0
	cset	w0, hi
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L742:
	ldr	x2, .LC228
	mov	w3, 2702
	ldr	x1, .LC229
	mov	w0, 1
	add	x2, x2, 952
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	IsPtsRewind, .-IsPtsRewind
	.align	3
.LC228:
	.xword	.LANCHOR0
	.align	3
.LC229:
	.xword	.LC2
	.align	3
.LC230:
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
.LANCHOR0 = . + 0
	.type	__func__.12282, %object
	.size	__func__.12282, 13
__func__.12282:
	.string	"PrintVoQueue"
	.zero	3
	.type	__func__.12288, %object
	.size	__func__.12288, 13
__func__.12288:
	.string	"ResetVoQueue"
	.zero	3
	.type	__func__.12294, %object
	.size	__func__.12294, 20
__func__.12294:
	.string	"ReturnImageToSyntax"
	.zero	4
	.type	__func__.12359, %object
	.size	__func__.12359, 19
__func__.12359:
	.string	"InsertImgToVoQueue"
	.zero	5
	.type	__FUNCTION__.12362, %object
	.size	__FUNCTION__.12362, 19
__FUNCTION__.12362:
	.string	"InsertImgToVoQueue"
	.zero	5
	.type	__func__.12370, %object
	.size	__func__.12370, 15
__func__.12370:
	.string	"GetQueueImgNum"
	.zero	1
	.type	__func__.12400, %object
	.size	__func__.12400, 20
__func__.12400:
	.string	"SYNTAX_ReceiveImage"
	.zero	4
	.type	__func__.12447, %object
	.size	__func__.12447, 20
__func__.12447:
	.string	"SYNTAX_ReleaseImage"
	.zero	4
	.type	__func__.12456, %object
	.size	__func__.12456, 19
__func__.12456:
	.string	"SYNTAX_ReturnImage"
	.zero	5
	.type	__func__.12482, %object
	.size	__func__.12482, 18
__func__.12482:
	.string	"DecodeStream_H264"
	.zero	6
	.type	__func__.12489, %object
	.size	__func__.12489, 18
__func__.12489:
	.string	"DecodeStream_HEVC"
	.zero	6
	.type	__func__.12494, %object
	.size	__func__.12494, 17
__func__.12494:
	.string	"DecodeStream_VP9"
	.zero	7
	.type	__func__.12501, %object
	.size	__func__.12501, 17
__func__.12501:
	.string	"DecodeStream_MVC"
	.zero	7
	.type	__func__.12514, %object
	.size	__func__.12514, 21
__func__.12514:
	.string	"DecodeStream_VC1_Smp"
	.zero	3
	.type	__func__.12553, %object
	.size	__func__.12553, 19
__func__.12553:
	.string	"DecodeStream_REAL8"
	.zero	5
	.type	__func__.12559, %object
	.size	__func__.12559, 19
__func__.12559:
	.string	"DecodeStream_REAL9"
	.zero	5
	.type	__func__.12565, %object
	.size	__func__.12565, 19
__func__.12565:
	.string	"DecodeStream_DIVX3"
	.zero	5
	.type	__func__.12571, %object
	.size	__func__.12571, 17
__func__.12571:
	.string	"DecodeStream_VP8"
	.zero	7
	.type	__func__.12577, %object
	.size	__func__.12577, 18
__func__.12577:
	.string	"DecodeStream_VP6x"
	.zero	6
	.type	__func__.12607, %object
	.size	__func__.12607, 7
__func__.12607:
	.string	"SegMan"
	.zero	1
	.type	__func__.12508, %object
	.size	__func__.12508, 21
__func__.12508:
	.string	"DecodeStream_VC1_Adv"
	.zero	3
	.type	__func__.12519, %object
	.size	__func__.12519, 17
__func__.12519:
	.string	"DecodeStream_VC1"
	.zero	7
	.type	__func__.12526, %object
	.size	__func__.12526, 19
__func__.12526:
	.string	"DecodeStream_MPEG2"
	.zero	5
	.type	__func__.12533, %object
	.size	__func__.12533, 19
__func__.12533:
	.string	"DecodeStream_MPEG4"
	.zero	5
	.type	__func__.12540, %object
	.size	__func__.12540, 17
__func__.12540:
	.string	"DecodeStream_AVS"
	.zero	7
	.type	__func__.12547, %object
	.size	__func__.12547, 18
__func__.12547:
	.string	"DecodeStream_AVS2"
	.zero	6
	.type	__func__.12583, %object
	.size	__func__.12583, 13
__func__.12583:
	.string	"DecodeStream"
	.zero	3
	.type	__func__.12613, %object
	.size	__func__.12613, 14
__func__.12613:
	.string	"ReleasePacket"
	.zero	2
	.type	__func__.12629, %object
	.size	__func__.12629, 18
__func__.12629:
	.string	"ReleaseCurPic_VPx"
	.zero	6
	.type	__func__.12642, %object
	.size	__func__.12642, 20
__func__.12642:
	.string	"ReleaseCurPic_Realx"
	.zero	4
	.type	__func__.12652, %object
	.size	__func__.12652, 20
__func__.12652:
	.string	"ReleaseCurPic_DIVX3"
	.zero	4
	.type	__func__.12657, %object
	.size	__func__.12657, 14
__func__.12657:
	.string	"ReleaseCurPic"
	.zero	2
	.type	__func__.12737, %object
	.size	__func__.12737, 12
__func__.12737:
	.string	"IsNewpicSeg"
	.zero	4
	.type	__func__.12747, %object
	.size	__func__.12747, 13
__func__.12747:
	.string	"CloseUsdPool"
	.zero	3
	.type	__func__.12757, %object
	.size	__func__.12757, 21
__func__.12757:
	.string	"CloseUsdPool_WithMem"
	.zero	3
	.type	__func__.12763, %object
	.size	__func__.12763, 12
__func__.12763:
	.string	"InitUsdPool"
	.zero	4
	.type	__func__.12743, %object
	.size	__func__.12743, 12
__func__.12743:
	.string	"OpenUsdPool"
	.zero	4
	.type	__func__.12753, %object
	.size	__func__.12753, 20
__func__.12753:
	.string	"OpenUsdPool_WithMem"
	.zero	4
	.type	__func__.12773, %object
	.size	__func__.12773, 7
__func__.12773:
	.string	"GetUsd"
	.zero	1
	.type	__func__.12785, %object
	.size	__func__.12785, 13
__func__.12785:
	.string	"MarkUsdByDnr"
	.zero	3
	.type	__func__.12790, %object
	.size	__func__.12790, 15
__func__.12790:
	.string	"UnMarkUsdByDnr"
	.zero	1
	.type	__func__.12796, %object
	.size	__func__.12796, 17
__func__.12796:
	.string	"IsImageInVoQueue"
	.zero	7
	.type	__func__.12802, %object
	.size	__func__.12802, 15
__func__.12802:
	.string	"IsVoQueueEmpty"
	.zero	1
	.type	__func__.12807, %object
	.size	__func__.12807, 15
__func__.12807:
	.string	"SetAspectRatio"
	.zero	1
	.type	__func__.12820, %object
	.size	__func__.12820, 17
__func__.12820:
	.string	"GetVoLastImageID"
	.zero	7
	.type	__func__.12825, %object
	.size	__func__.12825, 16
__func__.12825:
	.string	"IsMain10Profile"
	.type	__func__.12832, %object
	.size	__func__.12832, 12
__func__.12832:
	.string	"IsPtsRewind"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC2:
	ASCII(.string	"[%s %d]assert warning\n" )
	.zero	1
.LC4:
	ASCII(.string	"VoQueue state: head(%d) history(%d) tail(%d)" )
	.zero	3
.LC6:
	ASCII(.string	"\n" )
	.zero	6
.LC8:
	ASCII(.string	"%d " )
	.zero	4
.LC13:
	ASCII(.string	"ResetVoQueue but queue not empty: head(%d) history(%d) tail(%d)\n" )
	.zero	7
.LC20:
	ASCII(.string	"image point NULL\n" )
	.zero	6
.LC22:
	ASCII(.string	"call InsertVOQueue\n" )
	.zero	4
.LC25:
	ASCII(.string	"FATAL: p_image(id=%d) has already in the VoQueue!\n" )
	.zero	5
.LC27:
	ASCII(.string	"error=%d,W=%d,H=%d,not acceptable!\n" )
	.zero	4
.LC30:
	ASCII(.string	"out_pts: %lld -> %lld Usertag %lld\n" )
	.zero	4
.LC33:
	ASCII(.string	"Queue=(%02d,%02d,%02d) + F%d\n" )
	.zero	2
.LC43:
	ASCII(.string	"%s, pstVoQue is NULL!!!\n" )
	.zero	7
.LC46:
	ASCII(.string	"Queue=(%02d,%02d,%02d) - F%d\n" )
	.zero	2
.LC48:
	ASCII(.string	"SYNTAX_ReleaseImage p_image is null\n" )
	.zero	3
.LC53:
	ASCII(.string	"Image %d not found in vo queue.\n" )
	.zero	7
.LC55:
	ASCII(.string	"image[%d] null\n" )
.LC57:
	ASCII(.string	"Queue=(%02d,%02d,%02d) x F%d\n" )
	.zero	2
.LC80:
	ASCII(.string	"LENTH ERROR: VC1 S/MP BS is wrong!\n" )
	.zero	4
.LC83:
	ASCII(.string	"SYNTAX ERROR: VC1 S/MP BS is wrong!\n" )
	.zero	3
.LC107:
	ASCII(.string	"pSegMan error!\n" )
.LC111:
	ASCII(.string	"More than two packet!!!ERROR!!!\n" )
	.zero	7
.LC120:
	ASCII(.string	"pSegMan->CurrSeg.IsLastSeg=%d\n" )
	.zero	1
.LC122:
	ASCII(.string	"pSegMan->CurrSeg.PhyAddr=%#x\n" )
	.zero	2
.LC124:
	ASCII(.string	"pSegMan->CurrSeg.LenInByte=%#x\n" )
.LC126:
	ASCII(.string	"ERROR: Wrong PreParseInfo about Vc1 IsAdvProfile!\n" )
	.zero	5
.LC128:
	ASCII(.string	"ERROR: Wrong PreParseInfo about Vc1 CodecVersion!\n" )
	.zero	5
.LC144:
	ASCII(.string	"Func: %s, Line: %d\n" )
	.zero	4
.LC150:
	ASCII(.string	"ERROR: VFMW_VP8 one packet stream, but IsLastSeg == 0\n" )
	.zero	1
.LC152:
	ASCII(.string	"ERROR: VFMW_VP6 one packet stream, but IsLastSeg == 0\n" )
	.zero	1
.LC154:
	ASCII(.string	"ERROR: VFMW_VP9 one packet stream, but IsLastSeg == 0\n" )
	.zero	1
.LC156:
	ASCII(.string	"VidStd=%d Error!\n" )
	.zero	6
.LC177:
	ASCII(.string	"pu8[0] = %x,pu8[1] = %x, pu8[2] = %x\n" )
	.zero	2
.LC217:
	ASCII(.string	"%s pstVoQue NULL\n" )
	.zero	6
.LC222:
	ASCII(.string	"WARNNING: aspect ration (%d) is not expected!\n" )
	.bss
	.align	3
.LANCHOR1 = . + 0
	.type	last_rec_pos_time.12358, %object
	.size	last_rec_pos_time.12358, 128
last_rec_pos_time.12358:
	.zero	128
	.type	pstVdecUsdPool, %object
	.size	pstVdecUsdPool, 256
pstVdecUsdPool:
	.zero	256
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
