#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"scd_drv.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	SCDDRV_SaveStreamSeg.part.2, %function
SCDDRV_SaveStreamSeg.part.2:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x19, .LC1
	mov	w0, 0
	ldr	x1, [x19, 32]
	blr	x1
	ldr	x2, .LC2
	ldr	x3, [x19, 88]
	ldr	w1, [x20, 20]
	ldr	x2, [x2, w21, sxtw 3]
	ldr	x0, [x20]
	blr	x3
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	SCDDRV_SaveStreamSeg.part.2, .-SCDDRV_SaveStreamSeg.part.2
	.align	3
.LC1:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC2:
	.xword	g_SaveSegFileHandler
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_IsSCDByPass
	.type	SCDDRV_IsSCDByPass, %function
SCDDRV_IsSCDByPass:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	tst	w19, -17
	beq	.L6
	sub	w0, w19, #2
	cmp	w0, 2
	bls	.L6
	and	w1, w19, -9
	mov	w0, 0
	cmp	w1, 6
	ccmp	w19, 18, 4, ne
	cset	w1, eq
	cbnz	w1, .L3
	cmp	w19, 1
	beq	.L10
.L4:
	cmp	w19, 15
	cset	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L6:
	mov	w0, 0
.L3:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L10:
	ldr	w1, [x20]
	cbz	w1, .L4
	b	.L3
	.size	SCDDRV_IsSCDByPass, .-SCDDRV_IsSCDByPass
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FillEopRawStream
	.type	FillEopRawStream, %function
FillEopRawStream:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	sbfiz	x20, x20, 4, 32
	bl	_mcount
	str	xzr, [x29, 152]
	add	x9, x29, 72
	add	x0, x29, 40
	ldr	x2, .LC3
	mov	w1, 1
	mov	w6, 80
	mov	w5, 73
	stp	xzr, xzr, [x9]
	add	x9, x29, 88
	mov	w4, 67
	stp	xzr, xzr, [x0]
	add	x0, x29, 56
	mov	w8, 72
	stp	xzr, xzr, [x9]
	add	x9, x29, 104
	mov	w7, 83
	stp	xzr, xzr, [x0]
	mov	w0, 30
	mov	w3, 69
	stp	xzr, xzr, [x9]
	add	x9, x29, 120
	strb	w0, [x29, 43]
	strb	w0, [x29, 55]
	mov	w0, 68
	strb	w6, [x29, 46]
	stp	xzr, xzr, [x9]
	add	x9, x29, 136
	strb	w5, [x29, 47]
	strb	w4, [x29, 48]
	strb	w6, [x29, 66]
	stp	xzr, xzr, [x9]
	strb	w5, [x29, 67]
	mov	w9, -2
	strb	w4, [x29, 68]
	ldr	x10, [x2, x20]
	mov	w2, 78
	strb	w1, [x29, 42]
	strb	w8, [x29, 44]
	strb	w7, [x29, 45]
	strb	w3, [x29, 49]
	strb	w1, [x29, 54]
	strb	w1, [x29, 62]
	strb	w8, [x29, 64]
	strb	w7, [x29, 65]
	strb	w3, [x29, 69]
	strb	w2, [x29, 50]
	strb	w2, [x29, 70]
	strb	w0, [x29, 51]
	strb	w0, [x29, 71]
	strb	w9, [x29, 63]
	strb	w1, [x29, 74]
	strb	w6, [x29, 86]
	strb	w5, [x29, 87]
	strb	w4, [x29, 88]
	strb	w6, [x29, 106]
	strb	w5, [x29, 107]
	strb	w4, [x29, 108]
	strb	w6, [x29, 127]
	mov	w6, 96
	strb	w5, [x29, 128]
	mov	w5, -1
	strb	w4, [x29, 129]
	mov	w4, -70
	strb	w1, [x29, 82]
	strb	w9, [x29, 83]
	strb	w9, [x29, 95]
	strb	w8, [x29, 84]
	strb	w7, [x29, 85]
	strb	w3, [x29, 89]
	strb	w2, [x29, 90]
	strb	w0, [x29, 91]
	strb	w1, [x29, 94]
	strb	w1, [x29, 98]
	strb	w1, [x29, 102]
	strb	w8, [x29, 104]
	strb	w8, [x29, 125]
	strb	w7, [x29, 105]
	strb	w3, [x29, 109]
	strb	w2, [x29, 110]
	strb	w0, [x29, 111]
	strb	w1, [x29, 114]
	strb	w1, [x29, 122]
	strb	w7, [x29, 126]
	strb	w4, [x29, 103]
	strb	w4, [x29, 115]
	strb	w6, [x29, 123]
	strb	w3, [x29, 130]
	strb	w2, [x29, 131]
	strb	w0, [x29, 132]
	strb	w1, [x29, 135]
	strb	w5, [x29, 136]
	cbz	x19, .L26
	ldr	w4, [x10, 20]
	cmp	w4, 18
	bls	.L27
.L14:
	ldr	x3, .LC4
	mov	w1, 138
	ldr	x2, .LC9
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -7
.L24:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L27:
	ldr	x0, .LC7
	ldrb	w0, [x0,w4,uxtw]
	adr	x1, .Lrtx16
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx16:
	.section	.rodata
	.align	0
	.align	2
.L16:
	.byte	(.L15 - .Lrtx16) / 4
	.byte	(.L17 - .Lrtx16) / 4
	.byte	(.L17 - .Lrtx16) / 4
	.byte	(.L17 - .Lrtx16) / 4
	.byte	(.L17 - .Lrtx16) / 4
	.byte	(.L17 - .Lrtx16) / 4
	.byte	(.L22 - .Lrtx16) / 4
	.byte	(.L14 - .Lrtx16) / 4
	.byte	(.L17 - .Lrtx16) / 4
	.byte	(.L17 - .Lrtx16) / 4
	.byte	(.L17 - .Lrtx16) / 4
	.byte	(.L17 - .Lrtx16) / 4
	.byte	(.L17 - .Lrtx16) / 4
	.byte	(.L17 - .Lrtx16) / 4
	.byte	(.L17 - .Lrtx16) / 4
	.byte	(.L17 - .Lrtx16) / 4
	.byte	(.L19 - .Lrtx16) / 4
	.byte	(.L14 - .Lrtx16) / 4
	.byte	(.L22 - .Lrtx16) / 4
	.text
	.p2align 3
.L22:
	mov	w20, 15
	add	x1, x29, 60
.L18:
	ldr	w4, [x19, 8]
	ldr	w6, [x19, 80]
	add	w0, w4, w20
	cmp	w0, w6
	bls	.L25
.L20:
	ldr	x3, .LC4
	mov	w5, w20
	ldr	x2, .LC11
	mov	w1, 144
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -7
	b	.L24
	.p2align 3
.L25:
	ldr	x3, .LC12
	and	x2, x20, 31
	ldr	x0, [x19, 40]
	ldr	x3, [x3, 104]
	add	x0, x0, x4, sxtw
	blr	x3
	ldr	w5, [x19, 8]
	mov	w0, 0
	add	w20, w5, w20
	str	w20, [x19, 8]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L19:
	mov	w20, 16
	add	x1, x29, 120
	b	.L18
	.p2align 3
.L17:
	ldr	w4, [x19, 8]
	mov	w0, 0
	ldr	w6, [x19, 80]
	cmp	w4, w6
	bls	.L24
	mov	w20, 0
	b	.L20
	.p2align 3
.L15:
	mov	w20, 15
	add	x1, x29, 40
	b	.L18
.L26:
	ldr	x3, .LC4
	mov	w1, 99
	ldr	x2, .LC6
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -7
	b	.L24
	.size	FillEopRawStream, .-FillEopRawStream
	.align	3
.LC3:
	.xword	.LANCHOR0
	.align	3
.LC4:
	.xword	.LANCHOR1
	.align	3
.LC6:
	.xword	.LC5
	.align	3
.LC7:
	.xword	.L16
	.align	3
.LC9:
	.xword	.LC8
	.align	3
.LC11:
	.xword	.LC10
	.align	3
.LC12:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FillEosRawStream
	.type	FillEosRawStream, %function
FillEosRawStream:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	sbfiz	x19, x19, 4, 32
	bl	_mcount
	ldr	x1, .LC14
	mov	x2, 100
	ldr	x3, .LC13
	add	x0, x29, 40
	add	x1, x1, 24
	ldr	x19, [x3, x19]
	bl	memcpy
	cbz	x20, .L48
	ldr	w4, [x19, 20]
	cmp	w4, 18
	bls	.L49
.L31:
	ldr	x3, .LC15
	mov	w1, 256
	ldr	x2, .LC18
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -7
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L49:
	ldr	x0, .LC17
	ldrb	w0, [x0,w4,uxtw]
	adr	x1, .Lrtx33
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx33:
	.section	.rodata
	.align	0
	.align	2
.L33:
	.byte	(.L32 - .Lrtx33) / 4
	.byte	(.L34 - .Lrtx33) / 4
	.byte	(.L35 - .Lrtx33) / 4
	.byte	(.L36 - .Lrtx33) / 4
	.byte	(.L35 - .Lrtx33) / 4
	.byte	(.L46 - .Lrtx33) / 4
	.byte	(.L43 - .Lrtx33) / 4
	.byte	(.L31 - .Lrtx33) / 4
	.byte	(.L46 - .Lrtx33) / 4
	.byte	(.L46 - .Lrtx33) / 4
	.byte	(.L46 - .Lrtx33) / 4
	.byte	(.L46 - .Lrtx33) / 4
	.byte	(.L46 - .Lrtx33) / 4
	.byte	(.L46 - .Lrtx33) / 4
	.byte	(.L35 - .Lrtx33) / 4
	.byte	(.L32 - .Lrtx33) / 4
	.byte	(.L38 - .Lrtx33) / 4
	.byte	(.L46 - .Lrtx33) / 4
	.byte	(.L43 - .Lrtx33) / 4
	.text
	.p2align 3
.L32:
	mov	w19, 15
	add	x1, x29, 40
.L37:
	ldr	w5, [x20, 8]
	cmp	w19, w5
	bls	.L50
	ldr	x3, .LC15
	mov	w4, w19
	ldr	x2, .LC20
	mov	w1, 263
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -7
	b	.L44
	.p2align 3
.L50:
	ldr	x3, .LC21
	and	x2, x19, 31
	ldr	x0, [x20, 40]
	ldr	x3, [x3, 104]
	blr	x3
	str	w19, [x20, 8]
.L46:
	mov	w0, 0
.L44:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L34:
	ldr	w0, [x19, 36]
	cmp	w0, 1
	bne	.L46
.L43:
	mov	w19, 15
	add	x1, x29, 60
	b	.L37
	.p2align 3
.L38:
	mov	w19, 16
	add	x1, x29, 120
	b	.L37
	.p2align 3
.L36:
	mov	w19, 16
	add	x1, x29, 100
	b	.L37
	.p2align 3
.L35:
	mov	w19, 19
	add	x1, x29, 80
	b	.L37
.L48:
	ldr	x3, .LC15
	mov	w1, 196
	ldr	x2, .LC16
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -7
	b	.L44
	.size	FillEosRawStream, .-FillEosRawStream
	.align	3
.LC13:
	.xword	.LANCHOR0
	.align	3
.LC14:
	.xword	.LANCHOR1
	.align	3
.LC15:
	.xword	.LANCHOR2
	.align	3
.LC16:
	.xword	.LC5
	.align	3
.LC17:
	.xword	.L33
	.align	3
.LC18:
	.xword	.LC8
	.align	3
.LC20:
	.xword	.LC19
	.align	3
.LC21:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FillVC1ExtraData
	.type	FillVC1ExtraData, %function
FillVC1ExtraData:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	w0, [x20, 36]
	cmp	w0, 1
	beq	.L63
	ldr	w0, [x19, 76]
	tbnz	x0, 7, .L64
	add	x20, x20, 184320
	ldr	w2, [x19, 8]
	ldr	w5, [x19, 80]
	ldr	w0, [x20, 332]
	add	w4, w2, w0
	cmp	w4, w5
	bhi	.L65
	ldr	x1, [x19, 40]
	sxtw	x2, w2
	ldr	x22, .LC25
	mov	w21, 0
	add	x0, x1, x0, uxtw
.L62:
	ldr	x3, [x22, 112]
	blr	x3
	ldr	w2, [x20, 332]
	add	x1, x20, 336
	ldr	x0, [x19, 40]
	ldr	x3, [x22, 104]
	blr	x3
	ldr	w1, [x19, 8]
	ldr	w0, [x20, 332]
	add	w0, w1, w0
	str	w0, [x19, 8]
.L55:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L64:
	ldr	w2, [x19, 8]
	ldr	w5, [x19, 80]
	add	w4, w2, 12
	cmp	w4, 256
	ccmp	w4, w5, 2, le
	bhi	.L66
	ldr	x22, .LC25
	sxtw	x2, w2
	ldr	x1, [x19, 40]
	add	x20, x20, 184320
	mov	w21, 0
	ldr	x3, [x22, 112]
	add	x0, x1, 8
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x19, 84
	ldr	x0, [x19, 40]
	mov	x2, 4
	blr	x3
	ldr	x0, [x19, 40]
	mov	x2, 4
	ldr	x3, [x22, 104]
	add	x1, x19, 88
	add	x0, x0, x2
	blr	x3
	ldr	x0, [x19, 40]
	mov	x2, 4
	ldr	x3, [x22, 96]
	mov	w1, 0
	add	x0, x0, 12
	blr	x3
	mov	w1, 16
	str	w1, [x19, 8]
	str	w1, [x20, 332]
	add	x0, x20, 336
	ldr	x3, [x22, 104]
	ldrsw	x2, [x19, 8]
	ldr	x1, [x19, 40]
	blr	x3
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L63:
	ldr	w1, [x19, 76]
	tbnz	x1, 7, .L67
	ldrb	w1, [x19, 72]
	mov	w21, 0
	cbz	w1, .L55
	add	x20, x20, 184320
	ldr	w2, [x19, 8]
	ldr	w5, [x19, 80]
	ldr	w3, [x20, 332]
	add	w4, w2, w3
	cmp	w4, w5
	bhi	.L68
	ldr	x1, [x19, 40]
	sxtw	x2, w2
	ldr	x22, .LC25
	add	x0, x1, x3, uxtw
	b	.L62
	.p2align 3
.L67:
	ldr	w4, [x19, 8]
	cmp	w4, 255
	bhi	.L69
	add	x20, x20, 184320
	ldr	x1, .LC25
	add	x0, x20, 336
	mov	w21, 0
	str	w4, [x20, 332]
	ldr	x3, [x1, 104]
	ldr	w2, [x19, 8]
	ldr	x1, [x19, 40]
	blr	x3
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L66:
	ldr	x3, .LC22
	mov	w6, 256
	ldr	x2, .LC29
	mov	w1, 317
	add	x3, x3, 24
	mov	w0, 1
	mov	w21, -2
	bl	dprint_normal
	b	.L55
	.p2align 3
.L65:
	ldr	x3, .LC22
	mov	w1, 336
	ldr	x2, .LC27
	mov	w0, 1
	add	x3, x3, 24
	mov	w21, -2
	bl	dprint_normal
	b	.L55
.L69:
	ldr	x3, .LC22
	mov	w5, 256
	ldr	x2, .LC24
	mov	w1, 285
	add	x3, x3, 24
	mov	w21, -2
	bl	dprint_normal
	b	.L55
.L68:
	ldr	x3, .LC22
	mov	w1, 299
	ldr	x2, .LC27
	mov	w21, -2
	add	x3, x3, 24
	bl	dprint_normal
	b	.L55
	.size	FillVC1ExtraData, .-FillVC1ExtraData
	.align	3
.LC22:
	.xword	.LANCHOR2
	.align	3
.LC24:
	.xword	.LC23
	.align	3
.LC25:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC27:
	.xword	.LC26
	.align	3
.LC29:
	.xword	.LC28
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FillDIVX3ExtraData
	.type	FillDIVX3ExtraData, %function
FillDIVX3ExtraData:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	ldr	w2, [x19, 8]
	ldr	w5, [x19, 80]
	add	w4, w2, 8
	cmp	w4, w5
	bhi	.L73
	ldr	x20, .LC33
	sxtw	x2, w2
	ldr	x1, [x19, 40]
	ldr	x3, [x20, 112]
	add	x0, x1, 8
	blr	x3
	ldr	x3, [x20, 104]
	mov	x2, 4
	ldr	x0, [x19, 40]
	add	x1, x19, 84
	blr	x3
	ldr	x0, [x19, 40]
	mov	x2, 4
	ldr	x3, [x20, 104]
	add	x1, x19, 88
	add	x0, x0, x2
	blr	x3
	ldr	w1, [x19, 8]
	mov	w0, 0
	add	w1, w1, 8
	str	w1, [x19, 8]
.L72:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L73:
	ldr	x3, .LC30
	mov	w1, 356
	ldr	x2, .LC32
	mov	w0, 1
	add	x3, x3, 48
	bl	dprint_normal
	mov	w0, -2
	b	.L72
	.size	FillDIVX3ExtraData, .-FillDIVX3ExtraData
	.align	3
.LC30:
	.xword	.LANCHOR2
	.align	3
.LC32:
	.xword	.LC31
	.align	3
.LC33:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FillREAL8ExtraData
	.type	FillREAL8ExtraData, %function
FillREAL8ExtraData:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 76]
	tbz	x0, 7, .L75
	ldr	w4, [x19, 8]
	cmp	w4, 255
	bhi	.L79
	add	x20, x20, 184320
	ldr	x1, .LC36
	add	x0, x20, 336
	str	w4, [x20, 332]
	ldr	x3, [x1, 104]
	ldr	w2, [x19, 8]
	ldr	x1, [x19, 40]
	blr	x3
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L75:
	add	x20, x20, 184320
	ldr	w2, [x19, 8]
	ldr	w5, [x19, 80]
	ldr	w0, [x20, 332]
	add	w4, w2, w0
	cmp	w4, w5
	bhi	.L80
	ldr	x21, .LC36
	sxtw	x2, w2
	ldr	x1, [x19, 40]
	ldr	x3, [x21, 112]
	add	x0, x1, x0, uxtw
	blr	x3
	ldr	w2, [x20, 332]
	add	x1, x20, 336
	ldr	x0, [x19, 40]
	ldr	x3, [x21, 104]
	blr	x3
	ldr	w2, [x19, 8]
	mov	w0, 0
	ldr	w1, [x20, 332]
	add	w1, w2, w1
	str	w1, [x19, 8]
.L77:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L80:
	ldr	x3, .LC34
	mov	w1, 392
	ldr	x2, .LC38
	mov	w0, 1
	add	x3, x3, 72
	bl	dprint_normal
	mov	w0, -2
	b	.L77
	.p2align 3
.L79:
	ldr	x3, .LC34
	mov	w5, 256
	ldr	x2, .LC35
	mov	w1, 378
	add	x3, x3, 72
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -2
	b	.L77
	.size	FillREAL8ExtraData, .-FillREAL8ExtraData
	.align	3
.LC34:
	.xword	.LANCHOR2
	.align	3
.LC35:
	.xword	.LC23
	.align	3
.LC36:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC38:
	.xword	.LC37
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FillExtraData
	.type	FillExtraData, %function
FillExtraData:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L92
	cbz	x20, .L93
	ldr	w4, [x20, 8]
	cmp	w4, wzr
	ble	.L94
	ldr	x0, .LC44
	sbfiz	x19, x19, 4, 32
	ldr	x0, [x0, x19]
	ldr	w1, [x0, 20]
	cmp	w1, 5
	beq	.L86
	cmp	w1, 8
	beq	.L87
	cmp	w1, 1
	beq	.L95
	mov	w0, 0
.L83:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L87:
	mov	x1, x20
	bl	FillREAL8ExtraData
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L95:
	mov	x1, x20
	bl	FillVC1ExtraData
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L86:
	mov	x1, x20
	bl	FillDIVX3ExtraData
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L92:
	ldr	x3, .LC39
	mov	w4, 414
.L91:
	ldr	x2, .LC41
	mov	w1, w4
	add	x3, x3, 96
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L83
.L94:
	ldr	x3, .LC39
	mov	w1, 419
	ldr	x2, .LC43
	mov	w0, 1
	add	x3, x3, 96
	bl	dprint_normal
	mov	w0, -1
	b	.L83
.L93:
	ldr	x3, .LC39
	mov	w4, 415
	b	.L91
	.size	FillExtraData, .-FillExtraData
	.align	3
.LC39:
	.xword	.LANCHOR2
	.align	3
.LC41:
	.xword	.LC40
	.align	3
.LC43:
	.xword	.LC42
	.align	3
.LC44:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseRawStreamData
	.type	ReleaseRawStreamData, %function
ReleaseRawStreamData:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	sxtw	x21, w0
	mov	x0, x30
	mov	x24, x1
	mov	x22, x21
	bl	_mcount
	ldr	x23, .LC45
	lsl	x0, x21, 4
	ldr	x20, [x23, x0]
	cbz	x20, .L103
	mov	w0, w21
	bl	VCTRL_GetStreamInterface
	cbz	x0, .L98
	ldr	x1, [x0, 16]
	cbz	x1, .L98
	ldr	x19, .LC48
	mov	x1, x0
	mov	x2, 24
	add	x0, x29, 72
	ldr	x3, [x19, 104]
	blr	x3
	mov	x2, 96
	ldr	x3, [x19, 104]
	mov	x1, x24
	add	x0, x29, x2
	blr	x3
	ldr	w0, [x20, 60]
	cmp	w0, 1
	beq	.L110
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	ldr	x2, [x19, 48]
	mov	w1, w21
	mov	w0, 1
	blr	x2
	ldr	x2, [x29, 88]
	add	x1, x29, 96
	ldr	w0, [x29, 72]
	blr	x2
	mov	w20, w0
	ldr	x2, [x19, 56]
	mov	w0, 1
	mov	w1, w21
	blr	x2
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
.L101:
	lsl	x21, x21, 4
	mov	w19, -7
	cmp	w20, wzr
	csel	w0, w20, w19, eq
	ldr	x1, [x23, x21]
	cbz	x1, .L111
.L97:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L110:
	ldr	w0, [x29, 72]
	add	x1, x29, 96
	ldr	x2, [x29, 88]
	blr	x2
	mov	w20, w0
	b	.L101
	.p2align 3
.L98:
	ldr	x2, .LC47
	mov	w3, w22
	mov	w1, 605
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -7
	b	.L97
	.p2align 3
.L103:
	mov	w0, -7
	b	.L97
.L111:
	ldr	x3, .LC49
	mov	w4, w22
	ldr	x2, .LC51
	mov	w1, 634
	add	x3, x3, 112
	mov	w0, 0
	bl	dprint_normal
	mov	w0, w19
	b	.L97
	.size	ReleaseRawStreamData, .-ReleaseRawStreamData
	.align	3
.LC45:
	.xword	.LANCHOR0
	.align	3
.LC47:
	.xword	.LC46
	.align	3
.LC48:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC49:
	.xword	.LANCHOR2
	.align	3
.LC51:
	.xword	.LC50
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReadRawStreamData
	.type	ReadRawStreamData, %function
ReadRawStreamData:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	sxtw	x21, w0
	mov	x0, x30
	mov	x22, x1
	mov	x20, x21
	bl	_mcount
	ldr	x24, .LC52
	lsl	x0, x21, 4
	ldr	x19, [x24, x0]
	cbz	x19, .L143
	mov	w0, w21
	bl	VCTRL_GetStreamInterface
	cbz	x0, .L115
	ldr	x1, [x0, 8]
	cbz	x1, .L115
	ldr	x23, .LC55
	mov	x1, x0
	mov	x2, 24
	add	x0, x29, 88
	ldr	x3, [x23, 104]
	blr	x3
	ldr	w0, [x19, 60]
	cmp	w0, 1
	beq	.L144
	ldr	x25, .LC56
	ldr	x0, [x25, w21, sxtw 3]
	cbz	x0, .L130
	ldr	w26, [x0, 116]
.L119:
	ldr	x1, [x23, 32]
	mov	w0, 0
	blr	x1
	ldr	x0, [x25, w20, sxtw 3]
	cbz	x0, .L120
	ldr	w0, [x0, 116]
	cmp	w26, w0
	bne	.L145
.L120:
	ldr	w0, [x29, 88]
	mov	x1, x22
	ldr	x2, [x29, 96]
	blr	x2
	mov	w25, w0
	ldr	x1, [x23, 24]
	mov	w0, 0
	blr	x1
.L118:
	cbnz	w25, .L143
	lsl	x21, x21, 4
	ldr	x0, [x24, x21]
	cbz	x0, .L146
	ldrb	w21, [x22, 1]
	cmp	w21, 1
	beq	.L147
	ldr	w0, [x19, 60]
	cmp	w0, 1
	beq	.L148
.L126:
	add	x19, x19, 49152
	ldr	w1, [x22, 8]
	mov	w0, 0
	ldr	w2, [x19, 108]
	add	w1, w2, w1
	str	w1, [x19, 108]
.L114:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L147:
	mov	x1, x22
	mov	w0, w20
	bl	FillEosRawStream
	cbz	w0, .L125
	ldr	x2, .LC60
	mov	w3, w20
	mov	w1, 706
	mov	w0, 0
	bl	dprint_normal
.L123:
	mov	x1, x22
	mov	w0, w20
	bl	ReleaseRawStreamData
	cbz	w0, .L143
	ldr	x3, .LC57
	mov	w1, 737
	ldr	x2, .LC64
	mov	w0, 0
	add	x3, x3, 136
	bl	dprint_normal
.L143:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	mov	w0, -7
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L148:
	mov	x1, x22
	mov	w0, w20
	bl	FillExtraData
	cbnz	w0, .L149
	add	x0, x19, 184320
	ldr	w0, [x0, 328]
	cbz	w0, .L126
	ldrb	w0, [x22]
	cbnz	w0, .L126
	mov	x1, x22
	mov	w0, w20
	bl	FillEopRawStream
	b	.L126
	.p2align 3
.L144:
	ldr	w0, [x29, 88]
	mov	x1, x22
	ldr	x2, [x29, 96]
	blr	x2
	mov	w25, w0
	b	.L118
	.p2align 3
.L130:
	mov	w26, 0
	b	.L119
	.p2align 3
.L146:
	ldr	x3, .LC57
	mov	w4, w20
	ldr	x2, .LC58
	mov	w1, 698
	add	x3, x3, 136
	bl	dprint_normal
	b	.L123
	.p2align 3
.L125:
	mov	w1, w21
	mov	w0, w20
	bl	VCTRL_SetLastFrameState
	b	.L126
	.p2align 3
.L149:
	ldr	x2, .LC62
	mov	w3, w20
	mov	w1, 718
	mov	w0, 0
	bl	dprint_normal
	b	.L123
	.p2align 3
.L145:
	ldr	x1, [x23, 24]
	mov	w0, 0
	blr	x1
	mov	w0, -7
	b	.L114
	.p2align 3
.L115:
	ldr	x2, .LC54
	mov	w3, w20
	mov	w1, 658
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -7
	b	.L114
	.size	ReadRawStreamData, .-ReadRawStreamData
	.align	3
.LC52:
	.xword	.LANCHOR0
	.align	3
.LC54:
	.xword	.LC53
	.align	3
.LC55:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC56:
	.xword	s_pstVfmwChan
	.align	3
.LC57:
	.xword	.LANCHOR2
	.align	3
.LC58:
	.xword	.LC50
	.align	3
.LC60:
	.xword	.LC59
	.align	3
.LC62:
	.xword	.LC61
	.align	3
.LC64:
	.xword	.LC63
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_SaveStreamSeg
	.type	SCDDRV_SaveStreamSeg, %function
SCDDRV_SaveStreamSeg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, .LC65
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L150
	ldrsb	w0, [x20, 9]
	cmp	w0, 2
	beq	.L150
	mov	x1, x20
	mov	w0, w19
	bl	SCDDRV_SaveStreamSeg.part.2
.L150:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_SaveStreamSeg, .-SCDDRV_SaveStreamSeg
	.align	3
.LC65:
	.xword	g_SaveSegFileHandler
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_SaveRawStream
	.type	SCDDRV_SaveRawStream, %function
SCDDRV_SaveRawStream:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	w23, w0
	mov	x0, x30
	mov	x20, x1
	mov	x19, x2
	bl	_mcount
	ldr	x22, .LC66
	ldr	x0, [x22, w23, sxtw 3]
	cbz	x0, .L158
	ldr	x21, .LC67
	mov	w0, 0
	ldr	w25, [x20, 20]
	add	x24, x20, 184320
	ldr	x1, [x21, 32]
	blr	x1
	ldrb	w0, [x19, 2]
	cbz	w0, .L171
.L160:
	ldr	x1, [x21, 24]
	mov	w0, 0
	blr	x1
	ldr	x2, .LC71
	mov	w1, 796
	ldr	w4, [x19, 8]
	mov	w0, 0
	ldr	w3, [x24, 324]
	bl	dprint_normal
.L158:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L171:
	add	x1, x20, 36
	mov	w0, w25
	bl	SCDDRV_IsSCDByPass
	uxtb	w0, w0
	cbz	w0, .L161
	cmp	w25, 17
	bne	.L162
	ldr	w0, [x24, 324]
	cmp	w0, 1
	beq	.L172
.L163:
	ldr	x2, [x22, w23, sxtw 3]
	mov	w1, 12
	ldr	x3, [x21, 88]
	add	x0, x19, 8
	blr	x3
.L161:
	ldr	x2, [x22, w23, sxtw 3]
	ldr	w1, [x19, 8]
	ldr	x0, [x19, 40]
	ldr	x3, [x21, 88]
	blr	x3
	b	.L160
	.p2align 3
.L162:
	ldr	x2, [x22, w23, sxtw 3]
	mov	w1, 4
	ldr	x3, [x21, 88]
	add	x0, x19, 8
	blr	x3
	ldr	x2, [x22, w23, sxtw 3]
	ldr	w1, [x19, 8]
	ldr	x0, [x19, 40]
	ldr	x3, [x21, 88]
	blr	x3
	b	.L160
	.p2align 3
.L172:
	ldr	x2, [x22, w23, sxtw 3]
	mov	w1, 32
	ldr	x3, [x21, 88]
	ldr	x0, .LC69
	blr	x3
	b	.L163
	.size	SCDDRV_SaveRawStream, .-SCDDRV_SaveRawStream
	.align	3
.LC66:
	.xword	g_SaveRawFileHandler
	.align	3
.LC67:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC69:
	.xword	.LC68
	.align	3
.LC71:
	.xword	.LC70
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetInstIDByRawArray
	.type	GetInstIDByRawArray, %function
GetInstIDByRawArray:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC74
	mov	x0, 0
.L176:
	lsl	x1, x0, 4
	ldr	x1, [x3, x1]
	add	x2, x1, 88
	cmp	x19, x2
	cbz	x1, .L174
	beq	.L175
.L174:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L176
	mov	w0, -1
.L175:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetInstIDByRawArray, .-GetInstIDByRawArray
	.align	3
.LC74:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_IsScdIdle
	.type	SCDDRV_IsScdIdle, %function
SCDDRV_IsScdIdle:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L185
	ldr	x0, .LC78
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 120]
	cmp	w0, wzr
	cset	w0, eq
	ret
	.p2align 3
.L185:
	ldr	x3, .LC75
	mov	w4, 822
	ldr	x2, .LC77
	mov	w5, w19
	add	x3, x3, 160
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_IsScdIdle, .-SCDDRV_IsScdIdle
	.align	3
.LC75:
	.xword	.LANCHOR2
	.align	3
.LC77:
	.xword	.LC76
	.align	3
.LC78:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_SetStateIdle
	.type	SCDDRV_SetStateIdle, %function
SCDDRV_SetStateIdle:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L189
	ldr	x1, .LC83
	mov	w0, 1
	ldr	x2, .LC82
	ldr	x1, [x1, 256]
	str	wzr, [x2, 120]
	blr	x1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L189:
	ldr	x3, .LC79
	mov	w4, 833
	ldr	x2, .LC81
	mov	w1, w4
	add	x3, x3, 184
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_SetStateIdle, .-SCDDRV_SetStateIdle
	.align	3
.LC79:
	.xword	.LANCHOR2
	.align	3
.LC81:
	.xword	.LC80
	.align	3
.LC82:
	.xword	.LANCHOR0
	.align	3
.LC83:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_SetStateWork
	.type	SCDDRV_SetStateWork, %function
SCDDRV_SetStateWork:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L193
	ldr	x0, .LC86
	mov	w1, 1
	str	w1, [x0, 120]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L193:
	ldr	x3, .LC84
	mov	w4, 841
	ldr	x2, .LC85
	mov	w1, w4
	add	x3, x3, 208
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_SetStateWork, .-SCDDRV_SetStateWork
	.align	3
.LC84:
	.xword	.LANCHOR2
	.align	3
.LC85:
	.xword	.LC80
	.align	3
.LC86:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ResetSCD
	.type	ResetSCD, %function
ResetSCD:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	str	wzr, [x29, 76]
	cbnz	w19, .L204
	ldr	x22, .LC89
	mov	w1, 3
	ldr	w0, [x22, 136]
	add	w0, w0, 2176
	bl	MEM_WritePhyWord
	ldr	w0, [x22, 136]
	add	w0, w0, 2076
	bl	MEM_ReadPhyWord
	ldr	x20, .LC90
	mov	w23, w0
	ldr	x0, [x20]
	add	x0, x0, 61440
	ldr	w1, [x0, 2052]
	str	w1, [x29, 76]
	and	w1, w1, 3
	cbnz	w1, .L197
	ldr	x2, .LC92
	mov	w3, 0
	mov	w1, 861
	mov	w0, 21
	bl	dprint_normal
	mov	w0, 1
.L203:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L197:
	ldr	w1, [x0, 2060]
	mov	w19, 0
	str	w1, [x29, 76]
	orr	w1, w1, 4
	strb	w1, [x29, 76]
	ldr	x21, .LC93
	ldr	w1, [x29, 76]
	str	w1, [x0, 2060]
	b	.L199
	.p2align 3
.L205:
	add	w19, w19, 1
	cmp	w19, 1000
	beq	.L200
.L199:
	ldr	x1, [x21, 232]
	mov	x0, 30
	blr	x1
	ldr	x2, [x20]
	add	x2, x2, 61440
	ldr	w0, [x2, 2064]
	tbz	x0, 2, .L205
	cmp	w19, 999
	bhi	.L200
.L201:
	ldr	w3, [x2, 2060]
	and	w1, w23, 1
	str	w3, [x29, 76]
	and	w3, w3, -5
	strb	w3, [x29, 76]
	ldr	w0, [x22, 136]
	ldr	w3, [x29, 76]
	str	w3, [x2, 2060]
	add	w0, w0, 2076
	bl	MEM_WritePhyWord
	ldr	w0, [x22, 136]
	mov	w1, 2
	add	w0, w0, 2176
	bl	MEM_WritePhyWord
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, 1
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L200:
	ldr	x2, .LC95
	mov	w3, 0
	mov	w1, 884
	mov	w0, 0
	bl	dprint_normal
	ldr	x2, [x20]
	add	x2, x2, 61440
	b	.L201
.L204:
	ldr	x3, .LC87
	mov	w4, 852
	ldr	x2, .LC88
	mov	w1, w4
	add	x3, x3, 232
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -2
	b	.L203
	.size	ResetSCD, .-ResetSCD
	.align	3
.LC87:
	.xword	.LANCHOR2
	.align	3
.LC88:
	.xword	.LC40
	.align	3
.LC89:
	.xword	.LANCHOR0
	.align	3
.LC90:
	.xword	g_HwMem
	.align	3
.LC92:
	.xword	.LC91
	.align	3
.LC93:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC95:
	.xword	.LC94
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_ResetSCD
	.type	SCDDRV_ResetSCD, %function
SCDDRV_ResetSCD:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC96
	add	x19, x19, 64
	ldr	w0, [x19, 52]
	cmp	w20, w0
	beq	.L208
.L206:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L208:
	mov	w0, 0
	bl	ResetSCD
	str	wzr, [x19, 56]
	ldr	x1, .LC97
	mov	w0, 1
	ldr	x1, [x1, 256]
	blr	x1
	b	.L206
	.size	SCDDRV_ResetSCD, .-SCDDRV_ResetSCD
	.align	3
.LC96:
	.xword	.LANCHOR0
	.align	3
.LC97:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_IsRawArrayFull
	.type	SCDDRV_IsRawArrayFull, %function
SCDDRV_IsRawArrayFull:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 49152
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldp	w0, w2, [x1, 4]
	add	w0, w0, 1
	asr	w1, w0, 31
	lsr	w1, w1, 23
	add	w0, w0, w1
	and	w0, w0, 511
	sub	w0, w0, w1
	cmp	w0, w2
	cset	w0, eq
	ret
	.size	SCDDRV_IsRawArrayFull, .-SCDDRV_IsRawArrayFull
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_InsertRawPacket
	.type	SCDDRV_InsertRawPacket, %function
SCDDRV_InsertRawPacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x1
	mov	w19, w0
	mov	x0, x30
	sbfiz	x19, x19, 4, 32
	bl	_mcount
	ldr	x0, .LC99
	ldr	w1, [x20, 4]
	ldr	x0, [x0, x19]
	cbz	w1, .L216
	cbz	x0, .L217
	add	x0, x0, 88
	add	x19, x0, 49152
	ldp	w3, w1, [x19, 4]
	add	w2, w3, 1
	asr	w4, w2, 31
	lsr	w4, w4, 23
	add	w2, w2, w4
	and	w2, w2, 511
	sub	w2, w2, w4
	cmp	w2, w1
	beq	.L214
	sxtw	x3, w3
	ldr	x5, .LC102
	lsl	x4, x3, 2
	mov	x2, 96
	sub	x3, x4, x3
	mov	x1, x20
	ldr	x4, [x5, 104]
	add	x0, x0, x3, lsl 5
	blr	x4
	ldr	w1, [x19, 4]
	mov	w0, 0
	add	w1, w1, 1
	asr	w2, w1, 31
	lsr	w2, w2, 23
	add	w1, w1, w2
	and	w1, w1, 511
	sub	w1, w1, w2
	str	w1, [x19, 4]
.L212:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L214:
	mov	w0, -4
	b	.L212
	.p2align 3
.L216:
	ldr	x3, .LC100
	mov	w4, 934
.L215:
	ldr	x2, .LC101
	mov	w1, w4
	add	x3, x3, 248
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L212
.L217:
	ldr	x3, .LC100
	mov	w4, 935
	b	.L215
	.size	SCDDRV_InsertRawPacket, .-SCDDRV_InsertRawPacket
	.align	3
.LC99:
	.xword	.LANCHOR0
	.align	3
.LC100:
	.xword	.LANCHOR2
	.align	3
.LC101:
	.xword	.LC40
	.align	3
.LC102:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetRawState
	.type	GetRawState, %function
GetRawState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L224
	ldr	x0, .LC105
	sbfiz	x19, x19, 4, 32
	ldr	x0, [x0, x19]
	cbz	x0, .L225
	add	x2, x0, 88
	mov	w0, -4
	add	x2, x2, 49152
	ldp	w1, w3, [x2, 4]
	add	w1, w1, 1
	asr	w2, w1, 31
	lsr	w2, w2, 23
	add	w1, w1, w2
	and	w1, w1, 511
	sub	w1, w1, w2
	cmp	w1, w3
	csel	w0, w0, wzr, eq
.L220:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L224:
	ldr	x3, .LC103
	mov	w4, 956
.L223:
	ldr	x2, .LC104
	mov	w1, w4
	add	x3, x3, 272
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -4
	b	.L220
.L225:
	ldr	x3, .LC103
	mov	w4, 957
	b	.L223
	.size	GetRawState, .-GetRawState
	.align	3
.LC103:
	.xword	.LANCHOR2
	.align	3
.LC104:
	.xword	.LC40
	.align	3
.LC105:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ShowRawPacket
	.type	ShowRawPacket, %function
ShowRawPacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 49152
	mov	x21, x1
	bl	_mcount
	ldr	w0, [x19, 16]
	cmp	w0, 511
	bhi	.L229
	ldr	w1, [x19, 4]
	cmp	w0, w1
	beq	.L229
	sxtw	x0, w0
	ldr	x1, .LC106
	lsl	x3, x0, 2
	mov	x2, 96
	sub	x3, x3, x0
	mov	x0, x21
	ldr	x4, [x1, 104]
	add	x1, x20, x3, lsl 5
	blr	x4
	ldr	w1, [x19, 16]
	mov	w0, 0
	add	w1, w1, 1
	asr	w2, w1, 31
	lsr	w2, w2, 23
	add	w1, w1, w2
	and	w1, w1, 511
	sub	w1, w1, w2
	str	w1, [x19, 16]
.L227:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L229:
	mov	w0, -3
	b	.L227
	.size	ShowRawPacket, .-ShowRawPacket
	.align	3
.LC106:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetFirstOffset
	.type	GetFirstOffset, %function
GetFirstOffset:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L234
	add	x0, x19, 49152
	ldp	w2, w1, [x0]
	cmp	w2, w1
	beq	.L233
	ldr	w1, [x0, 12]
	mov	w0, 0
	str	w1, [x20]
.L232:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L234:
	ldr	x3, .LC107
	mov	w4, 989
	ldr	x2, .LC108
	mov	w1, w4
	add	x3, x3, 288
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L232
	.p2align 3
.L233:
	mov	w0, -3
	b	.L232
	.size	GetFirstOffset, .-GetFirstOffset
	.align	3
.LC107:
	.xword	.LANCHOR2
	.align	3
.LC108:
	.xword	.LC40
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetFirstRawPacket
	.type	GetFirstRawPacket, %function
GetFirstRawPacket:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x24, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cbz	x24, .L240
	add	x20, x24, 49152
	ldp	w1, w0, [x20]
	cmp	w1, w0
	beq	.L239
	ldr	w23, [x20, 12]
	mov	w22, w23
	sxtw	x21, w23
.L237:
	cmp	w1, 511
	str	w1, [x20, 16]
	bhi	.L238
	ldr	w0, [x20, 4]
	cmp	w0, w1
	beq	.L238
	sxtw	x1, w1
	ldr	x3, .LC111
	lsl	x0, x1, 2
	mov	x2, 96
	sub	x1, x0, x1
	mov	x0, x19
	ldr	x3, [x3, 104]
	add	x1, x24, x1, lsl 5
	blr	x3
	ldr	w0, [x20, 16]
	add	w0, w0, 1
	asr	w1, w0, 31
	lsr	w1, w1, 23
	add	w0, w0, w1
	and	w0, w0, 511
	sub	w0, w0, w1
	str	w0, [x20, 16]
.L238:
	ldp	w2, w0, [x19, 4]
	ldr	x1, [x19, 40]
	add	w2, w2, w22
	sub	w0, w0, w23
	add	x1, x1, x21
	str	x1, [x19, 40]
	stp	w2, w0, [x19, 4]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L239:
	mov	x21, 0
	mov	w22, 0
	mov	w23, 0
	b	.L237
	.p2align 3
.L240:
	ldr	x3, .LC109
	mov	w4, 989
	ldr	x2, .LC110
	mov	w1, w4
	add	x3, x3, 288
	mov	w0, 32
	mov	x21, 0
	mov	w22, 0
	bl	dprint_normal
	mov	w23, 0
	mov	x0, 49152
	mov	x20, x0
	ldr	w1, [x0]
	b	.L237
	.size	GetFirstRawPacket, .-GetFirstRawPacket
	.align	3
.LC109:
	.xword	.LANCHOR2
	.align	3
.LC110:
	.xword	.LC40
	.align	3
.LC111:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SetFirstOffset
	.type	SetFirstOffset, %function
SetFirstOffset:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L246
	add	x3, x19, 49152
	ldp	w0, w2, [x3]
	cmp	w0, w2
	beq	.L244
	sxtw	x0, w0
	ldr	w4, [x3, 12]
	lsl	x2, x0, 2
	sub	x0, x2, x0
	add	w1, w20, w4
	add	x0, x19, x0, lsl 5
	ldr	w0, [x0, 8]
	cmp	w1, w0
	bge	.L245
	mov	w0, 0
	str	w1, [x3, 12]
.L243:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L245:
	mov	w0, -1
	b	.L243
	.p2align 3
.L244:
	mov	w0, -3
	b	.L243
.L246:
	ldr	x3, .LC112
	mov	w4, 1019
	ldr	x2, .LC113
	mov	w1, w4
	add	x3, x3, 304
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L243
	.size	SetFirstOffset, .-SetFirstOffset
	.align	3
.LC112:
	.xword	.LANCHOR2
	.align	3
.LC113:
	.xword	.LC40
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DeleteRawPacket
	.type	DeleteRawPacket, %function
DeleteRawPacket:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	w21, w1
	bl	_mcount
	cbz	x20, .L271
	cbz	w21, .L262
	ldr	x27, .LC116
	mov	x0, 0
.L252:
	lsl	x1, x0, 4
	mov	w28, w0
	ldr	x1, [x27, x1]
	add	x2, x1, 88
	cmp	x20, x2
	cbz	x1, .L250
	beq	.L251
.L250:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L252
.L253:
	mov	w3, 1056
	ldr	x2, .LC118
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L268
	.p2align 3
.L251:
	cmp	w0, 3
	bhi	.L253
	add	x24, x20, 49152
	ldp	w25, w3, [x24]
	cmp	w25, w3
	ble	.L270
	add	w3, w3, 512
.L270:
	sub	w3, w3, w25
	cmp	w21, w3
	bhi	.L272
	ldr	x22, .LC114
	mov	w26, 0
	ldr	x23, .LC122
	sbfiz	x28, x28, 4, 32
	add	x22, x22, 320
	.p2align 2
.L257:
	uxtw	x19, w25
	mov	x2, x23
	lsl	x0, x19, 2
	mov	w1, 1074
	sub	x19, x0, x19
	mov	x3, x22
	mov	w0, 21
	add	w26, w26, 1
	add	x19, x20, x19, lsl 5
	add	w25, w25, 1
	and	w25, w25, 511
	ldp	w4, w5, [x19, 4]
	bl	dprint_normal
	ldr	x1, [x27, x28]
	ldr	w2, [x19, 8]
	add	x1, x1, 49152
	ldr	w0, [x1, 108]
	subs	w0, w0, w2
	csel	w0, w0, wzr, pl
	cmp	w21, w26
	str	w0, [x1, 108]
	bne	.L257
	ldr	w0, [x24]
	add	w21, w21, w0
	cmp	w21, 511
	ble	.L258
	sub	w21, w21, #512
	str	w21, [x24]
.L259:
	mov	w0, 0
	str	wzr, [x24, 12]
.L268:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L258:
	str	w21, [x24]
	b	.L259
.L262:
	mov	w0, -1
	b	.L268
	.p2align 3
.L272:
	ldr	x2, .LC120
	mov	w4, w21
	mov	w1, 1066
	mov	w0, 21
	bl	dprint_normal
	mov	w0, -1
	b	.L268
.L271:
	ldr	x3, .LC114
	mov	w4, 1045
	ldr	x2, .LC115
	mov	w1, w4
	add	x3, x3, 320
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L268
	.size	DeleteRawPacket, .-DeleteRawPacket
	.align	3
.LC114:
	.xword	.LANCHOR2
	.align	3
.LC115:
	.xword	.LC40
	.align	3
.LC116:
	.xword	.LANCHOR0
	.align	3
.LC118:
	.xword	.LC117
	.align	3
.LC120:
	.xword	.LC119
	.align	3
.LC122:
	.xword	.LC121
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DeleteRawPacketInBuffer
	.type	DeleteRawPacketInBuffer, %function
DeleteRawPacketInBuffer:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w24, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w24, 3
	bhi	.L291
	sxtw	x28, w24
	ldr	x26, .LC126
	lsl	x0, x28, 4
	ldr	x22, [x26, x0]
	cbz	x22, .L290
	cbz	w19, .L292
.L276:
	adds	x23, x22, 88
	beq	.L293
	add	x0, x23, 49152
	ldr	w21, [x0]
	ldr	w20, [x0, 8]
	cmp	w21, w20
	blt	.L294
.L288:
	sub	w21, w21, w20
	cbz	w21, .L290
	ldr	x25, .LC124
	mov	w27, 0
	lsl	x28, x28, 4
	add	x25, x25, 336
	b	.L281
	.p2align 3
.L296:
	beq	.L295
.L281:
	uxtw	x19, w20
	ldr	x2, .LC127
	lsl	x0, x19, 2
	mov	x3, x25
	sub	x19, x0, x19
	mov	w1, 1134
	lsl	x19, x19, 5
	mov	w0, 21
	add	x4, x22, x19
	add	w27, w27, 1
	add	w20, w20, 1
	and	w20, w20, 511
	ldr	w5, [x4, 96]
	ldr	w4, [x4, 92]
	bl	dprint_normal
	add	x1, x23, x19
	mov	w0, w24
	bl	ReleaseRawStreamData
	ldr	x0, [x26, x28]
	cmp	w27, w21
	cbnz	x0, .L296
	mov	w0, -7
.L275:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L292:
	add	x0, x22, 184320
	ldr	w0, [x0, 256]
	cbnz	w0, .L276
.L290:
	mov	w0, -1
	b	.L275
	.p2align 3
.L294:
	add	w21, w21, 512
	b	.L288
	.p2align 3
.L295:
	add	x23, x23, 49152
	ldr	w20, [x23, 8]
	add	w20, w20, w27
	cmp	w20, 511
	ble	.L297
	sub	w20, w20, #512
	str	w20, [x23, 8]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L297:
	str	w20, [x23, 8]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L291:
	ldr	x3, .LC124
	mov	w4, 1103
.L289:
	ldr	x2, .LC125
	mov	w1, w4
	add	x3, x3, 336
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L275
.L293:
	ldr	x3, .LC124
	mov	w4, 1118
	b	.L289
	.size	DeleteRawPacketInBuffer, .-DeleteRawPacketInBuffer
	.align	3
.LC124:
	.xword	.LANCHOR2
	.align	3
.LC125:
	.xword	.LC40
	.align	3
.LC126:
	.xword	.LANCHOR0
	.align	3
.LC127:
	.xword	.LC121
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DeleteLastSendRaw
	.type	DeleteLastSendRaw, %function
DeleteLastSendRaw:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L302
	ldr	x0, .LC131
	ubfiz	x19, x19, 4, 32
	ldr	x0, [x0, x19]
	cbz	x0, .L303
	add	x19, x0, 184320
	ldr	w1, [x19, 168]
	cmp	w1, wzr
	ble	.L298
	add	x0, x0, 88
	bl	DeleteRawPacket
	str	wzr, [x19, 168]
.L298:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L302:
	ldr	x3, .LC129
	mov	w4, 1241
	ldr	x2, .LC130
	mov	w1, w4
	add	x3, x3, 360
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L303:
	mov	w3, 1247
	ldr	x2, .LC133
	mov	w1, w3
	bl	dprint_normal
	b	.L298
	.size	DeleteLastSendRaw, .-DeleteLastSendRaw
	.align	3
.LC129:
	.xword	.LANCHOR2
	.align	3
.LC130:
	.xword	.LC80
	.align	3
.LC131:
	.xword	.LANCHOR0
	.align	3
.LC133:
	.xword	.LC132
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetRawStreamSize
	.type	GetRawStreamSize, %function
GetRawStreamSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cbz	x19, .L310
	cbz	x20, .L311
	add	x19, x19, 49152
	mov	w0, 0
	ldr	w2, [x19, 20]
	str	w2, [x20]
	ldr	w1, [x19, 12]
	sub	w2, w2, w1
	str	w2, [x20]
	tbnz	w2, #31, .L312
.L306:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L312:
	ldr	x3, .LC134
	mov	w4, 1267
.L309:
	ldr	x2, .LC135
	mov	w1, w4
	add	x3, x3, 384
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L306
.L311:
	ldr	x3, .LC134
	mov	w4, 1263
	b	.L309
.L310:
	ldr	x3, .LC134
	mov	w4, 1262
	b	.L309
	.size	GetRawStreamSize, .-GetRawStreamSize
	.align	3
.LC134:
	.xword	.LANCHOR2
	.align	3
.LC135:
	.xword	.LC40
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetRawStreamNum
	.type	GetRawStreamNum, %function
GetRawStreamNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cbz	x19, .L319
	cbz	x20, .L320
	add	x19, x19, 49152
	ldp	w1, w0, [x19]
	subs	w0, w0, w1
	bmi	.L317
	str	w0, [x20]
	mov	w0, 0
.L315:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L317:
	add	w2, w0, 512
	str	w2, [x20]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L320:
	ldr	x3, .LC136
	mov	w4, 1275
.L318:
	ldr	x2, .LC137
	mov	w1, w4
	add	x3, x3, 408
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L315
.L319:
	ldr	x3, .LC136
	mov	w4, 1274
	b	.L318
	.size	GetRawStreamNum, .-GetRawStreamNum
	.align	3
.LC136:
	.xword	.LANCHOR2
	.align	3
.LC137:
	.xword	.LC40
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetRawNumOffset
	.type	GetRawNumOffset, %function
GetRawNumOffset:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x24, x0
	mov	x0, x30
	mov	w23, w1
	mov	x19, x2
	mov	x21, x3
	mov	x20, x4
	bl	_mcount
	str	wzr, [x29, 92]
	cmp	x24, xzr
	ccmp	w23, wzr, 1, ne
	blt	.L332
	cmp	x21, xzr
	ccmp	x20, xzr, 4, ne
	ccmp	x19, xzr, 4, ne
	beq	.L333
	add	x25, x24, 49152
	add	x1, x29, 92
	mov	x0, x24
	ldrsw	x3, [x25]
	lsl	x2, x3, 2
	sub	x2, x2, x3
	ldr	w3, [x25, 12]
	add	x2, x24, x2, lsl 5
	ldr	w22, [x2, 8]
	sub	w22, w22, w3
	bl	GetRawStreamNum
	ldr	w6, [x25]
	cmp	w23, w22
	ldr	w5, [x29, 92]
	mov	w0, w6
	add	w5, w6, w5
	ccmp	w5, w6, 0, ge
	bls	.L329
	mov	w2, w6
	b	.L326
	.p2align 3
.L330:
	mov	w22, w1
.L326:
	add	w2, w2, 1
	asr	w0, w2, 31
	lsr	w1, w0, 23
	add	w0, w2, w1
	and	w0, w0, 511
	sub	w0, w0, w1
	sxtw	x3, w0
	lsl	x1, x3, 2
	sub	x1, x1, x3
	add	x1, x24, x1, lsl 5
	ldr	w1, [x1, 8]
	add	w1, w22, w1
	cmp	w23, w1
	cset	w4, lt
	cmp	w5, w2
	cset	w3, ls
	orr	w3, w4, w3
	cbz	w3, .L330
	cmp	w6, w2
	beq	.L325
	sub	w22, w23, w22
	str	w22, [x21]
.L328:
	str	w0, [x20]
	mov	w0, 0
	ldr	w1, [x25]
	sub	w2, w2, w1
	str	w2, [x19]
.L323:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
.L329:
	mov	w2, w6
	.p2align 2
.L325:
	str	w23, [x21]
	b	.L328
.L333:
	ldr	x3, .LC138
	mov	w4, 1164
.L331:
	ldr	x2, .LC139
	mov	w1, w4
	add	x3, x3, 424
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L323
.L332:
	ldr	x3, .LC138
	mov	w4, 1163
	b	.L331
	.size	GetRawNumOffset, .-GetRawNumOffset
	.align	3
.LC138:
	.xword	.LANCHOR2
	.align	3
.LC139:
	.xword	.LC40
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DeleteRawLen
	.type	DeleteRawLen, %function
DeleteRawLen:
	sub	sp, sp, #64
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	x19, xzr
	ccmp	w20, wzr, 1, ne
	blt	.L339
	add	x1, x29, 32
	mov	x0, x19
	stp	wzr, wzr, [x29, 36]
	bl	GetRawStreamSize
	cbnz	w0, .L336
	ldr	w0, [x29, 32]
	cmp	w20, w0
	bgt	.L338
	add	x4, x29, 44
	add	x3, x29, 40
	add	x2, x29, 36
	mov	w1, w20
	mov	x0, x19
	bl	GetRawNumOffset
	add	x0, x19, 49152
	mov	w3, 1229
	ldp	w6, w5, [x29, 36]
	ldr	x2, .LC143
	mov	w1, w3
	ldr	w7, [x0]
	mov	w4, w6
	add	w7, w6, w7
	asr	w0, w7, 31
	lsr	w0, w0, 23
	add	w7, w7, w0
	and	w7, w7, 511
	sub	w0, w7, w0
	str	w0, [x29, 44]
	sxtw	x0, w0
	lsl	x7, x0, 2
	sub	x0, x7, x0
	add	x0, x19, x0, lsl 5
	ldr	w7, [x0, 8]
	ldrb	w0, [x0, 2]
	str	w0, [sp]
	mov	w0, 21
	bl	dprint_normal
	ldr	w1, [x29, 36]
	mov	x0, x19
	bl	DeleteRawPacket
	ldr	w1, [x29, 40]
	mov	x0, x19
	bl	SetFirstOffset
.L336:
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L338:
	mov	w0, -1
	b	.L336
	.p2align 3
.L339:
	ldr	x3, .LC140
	mov	w4, 1208
	ldr	x2, .LC141
	mov	w1, w4
	add	x3, x3, 440
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L336
	.size	DeleteRawLen, .-DeleteRawLen
	.align	3
.LC140:
	.xword	.LANCHOR2
	.align	3
.LC141:
	.xword	.LC40
	.align	3
.LC143:
	.xword	.LC142
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ConfigStreamSegArray
	.type	ConfigStreamSegArray, %function
ConfigStreamSegArray:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	mov	x21, x2
	mov	w22, w3
	bl	_mcount
	cbz	x19, .L346
	cmp	w20, wzr
	ccmp	x21, xzr, 4, ne
	beq	.L347
	mov	w0, 262143
	cmp	w22, w0
	bls	.L348
	ldr	x3, .LC146
	mov	x2, 4152
	mov	w1, 0
	movk	x2, 0x2, lsl 16
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x19, 135168
	mov	w0, 0
	str	w20, [x1, 24]
	str	x21, [x19]
	stp	w22, w20, [x1, 28]
	str	w20, [x1, 36]
.L342:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L348:
	ldr	x3, .LC144
	mov	w4, 1291
.L345:
	ldr	x2, .LC145
	mov	w1, w4
	add	x3, x3, 456
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L342
	.p2align 3
.L347:
	ldr	x3, .LC144
	mov	w4, 1290
	b	.L345
.L346:
	ldr	x3, .LC144
	mov	w4, 1289
	b	.L345
	.size	ConfigStreamSegArray, .-ConfigStreamSegArray
	.align	3
.LC144:
	.xword	.LANCHOR2
	.align	3
.LC145:
	.xword	.LC40
	.align	3
.LC146:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ResetStreamSegArray
	.type	ResetStreamSegArray, %function
ResetStreamSegArray:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L352
	ldr	x3, .LC149
	mov	x2, 4096
	movk	x2, 0x2, lsl 16
	mov	w1, 0
	add	x0, x19, 8
	ldr	x3, [x3, 96]
	blr	x3
	add	x0, x19, 135168
	ldr	w1, [x0, 24]
	stp	wzr, wzr, [x0, 8]
	str	wzr, [x0, 16]
	stp	w1, w1, [x0, 32]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L352:
	ldr	x3, .LC147
	mov	w4, 1306
	ldr	x2, .LC148
	mov	w1, w4
	add	x3, x3, 480
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ResetStreamSegArray, .-ResetStreamSegArray
	.align	3
.LC147:
	.xword	.LANCHOR2
	.align	3
.LC148:
	.xword	.LC80
	.align	3
.LC149:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetSegBufFreeSize
	.type	GetSegBufFreeSize, %function
GetSegBufFreeSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L357
	add	x1, x19, 135168
	ldp	w0, w2, [x1, 32]
	cmp	w2, w0
	sub	w0, w0, #1
	bhi	.L358
	sub	w0, w0, w2
	bcc	.L354
	ldr	w0, [x1, 28]
	sub	w0, w0, #1
.L354:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L358:
	ldr	w1, [x1, 28]
	ldr	x19, [sp, 16]
	add	w0, w0, w1
	sub	w0, w0, w2
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L357:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetSegBufFreeSize, .-GetSegBufFreeSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckData
	.type	CheckData, %function
CheckData:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	uxtb	w20, w1
	bl	_mcount
	cbz	x19, .L368
	and	w0, w20, 31
	sub	w1, w0, #30
	sub	w2, w0, #1
	uxtb	w1, w1
	cmp	w1, 1
	ccmp	w0, 19, 4, hi
	ccmp	w2, 12, 0, ne
	bhi	.L362
	ldr	w0, [x19, 60]
	add	w0, w0, 1
	str	w0, [x19, 60]
.L362:
	sub	w2, w20, #1
	add	w0, w20, 79
	uxtb	w2, w2
	uxtb	w0, w0
	cmp	w2, 183
	ccmp	w0, 4, 0, ls
	bhi	.L369
.L363:
	ldr	w0, [x19, 64]
	add	w0, w0, 1
	str	w0, [x19, 64]
.L359:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L369:
	add	w20, w20, 73
	uxtb	w20, w20
	cmp	w20, 3
	bls	.L363
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L368:
	ldr	x3, .LC150
	mov	w4, 1341
	ldr	x2, .LC151
	mov	w1, w4
	add	x3, x3, 504
	mov	w0, 32
	bl	dprint_normal
	b	.L359
	.size	CheckData, .-CheckData
	.align	3
.LC150:
	.xword	.LANCHOR2
	.align	3
.LC151:
	.xword	.LC80
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckStartCodeCnt
	.type	CheckStartCodeCnt, %function
CheckStartCodeCnt:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	uxtb	w20, w1
	bl	_mcount
	cbz	x19, .L382
	ldr	w0, [x19, 68]
	cmp	w0, 2
	ble	.L370
	and	w20, w20, 31
	cbz	w20, .L370
	ldp	w1, w0, [x19, 76]
	sub	w2, w0, w1
	cmp	w2, 1
	beq	.L383
.L373:
	cmp	w0, w1
	beq	.L384
.L370:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L384:
	ldr	w1, [x19, 72]
	cmp	w0, w1
	bne	.L370
.L374:
	cmp	w0, 20
	ccmp	w0, 1, 4, ne
	beq	.L370
	ldr	w0, [x19, 60]
	cmp	w0, wzr
	ble	.L375
	sub	w0, w0, #1
	str	w0, [x19, 60]
.L375:
	ldr	w0, [x19, 64]
	add	w0, w0, 1
	str	w0, [x19, 64]
	b	.L370
	.p2align 3
.L383:
	ldr	w2, [x19, 72]
	sub	w2, w1, w2
	cmp	w2, 1
	bne	.L373
	b	.L374
	.p2align 3
.L382:
	ldr	x3, .LC152
	mov	w4, 1370
	ldr	x2, .LC153
	mov	w1, w4
	add	x3, x3, 520
	mov	w0, 32
	bl	dprint_normal
	b	.L370
	.size	CheckStartCodeCnt, .-CheckStartCodeCnt
	.align	3
.LC152:
	.xword	.LANCHOR2
	.align	3
.LC153:
	.xword	.LC80
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckStream
	.type	CheckStream, %function
CheckStream:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x21, .L406
	cmp	w20, 3
	bhi	.L407
	ldr	x0, .LC156
	ldr	x19, [x0, w20, sxtw 3]
	cbz	x19, .L385
	ldr	w0, [x19, 128]
	cmp	w0, wzr
	ccmp	w0, 3, 4, ne
	bne	.L385
	ldr	w0, [x19, 68]
	cmp	w0, 199
	bgt	.L385
	ldrb	w1, [x21]
	cbnz	w1, .L395
	ldrb	w1, [x21, 1]
	cbnz	w1, .L395
	ldrb	w1, [x21, 2]
	cmp	w1, 1
	beq	.L408
	.p2align 2
.L395:
	mov	w3, 0
	mov	w21, 0
.L391:
	ldp	w2, w1, [x19, 76]
	add	w0, w0, 1
	stp	w1, w3, [x19, 76]
	stp	w0, w2, [x19, 68]
	mov	w1, w21
	mov	x0, x19
	bl	CheckData
	mov	x0, x19
	mov	w1, w21
	bl	CheckStartCodeCnt
	ldr	w0, [x19, 68]
	cmp	w0, 199
	ble	.L385
	ldp	w1, w0, [x19, 60]
	sub	w2, w1, w0
	cmp	w2, 49
	ble	.L392
	ldr	w2, [x19, 128]
	cmp	w2, 3
	beq	.L409
.L392:
	sub	w0, w0, w1
	cmp	w0, 49
	ble	.L385
	ldr	w0, [x19, 128]
	cbnz	w0, .L385
	ldr	x0, .LC157
	ldr	x4, [x0]
	cbz	x4, .L385
	mov	w3, 0
	mov	x2, 0
	mov	w1, 49
	mov	w0, w20
	blr	x4
.L385:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L407:
	ldr	x3, .LC154
	mov	w4, 1395
.L405:
	ldr	x2, .LC155
	mov	w1, w4
	add	x3, x3, 544
	mov	w0, 32
	bl	dprint_normal
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L408:
	ldrb	w21, [x21, 3]
	and	w3, w21, 31
	b	.L391
	.p2align 3
.L406:
	ldr	x3, .LC154
	mov	w4, 1394
	b	.L405
	.p2align 3
.L409:
	ldr	x0, .LC157
	ldr	x4, [x0]
	cbz	x4, .L385
	mov	w1, 49
	mov	w3, 0
	mov	x2, 0
	mov	w0, w20
	blr	x4
	ldp	w1, w0, [x19, 60]
	b	.L392
	.size	CheckStream, .-CheckStream
	.align	3
.LC154:
	.xword	.LANCHOR2
	.align	3
.LC155:
	.xword	.LC80
	.align	3
.LC156:
	.xword	s_pstVfmwChan
	.align	3
.LC157:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InsertStreamSeg
	.type	InsertStreamSeg, %function
InsertStreamSeg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	mov	x23, x1
	mov	w20, w2
	bl	_mcount
	cmp	x22, xzr
	ccmp	x23, xzr, 4, ne
	beq	.L418
	add	x19, x22, 135168
	mov	w21, 43691
	movk	w21, 0x2aaa, lsl 16
	ldp	w1, w0, [x19, 8]
	add	w4, w0, 1
	smull	x0, w4, w21
	asr	x0, x0, 40
	sub	w0, w0, w4, asr 31
	lsl	w3, w0, 2
	sub	w0, w3, w0
	sub	w0, w4, w0, lsl 9
	cmp	w0, w1
	beq	.L414
	ldr	x0, [x23]
	mov	w1, w20
	bl	CheckStream
	ldrsw	x0, [x19, 12]
	mov	x2, 88
	ldr	x3, .LC160
	mov	x1, x23
	lsl	x20, x0, 2
	sub	x20, x20, x0
	lsl	x20, x20, 2
	ldr	x3, [x3, 104]
	sub	x20, x20, x0
	add	x20, x22, x20, lsl 3
	add	x0, x20, 8
	blr	x3
	ldr	w2, [x19, 12]
	mov	w4, 1
	add	w3, w2, 1
	sxtw	x1, w2
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	smull	x21, w3, w21
	add	x22, x22, x0, lsl 3
	asr	x21, x21, 40
	sub	w21, w21, w3, asr 31
	lsl	w1, w21, 2
	strb	w4, [x22, 16]
	sub	w21, w1, w21
	str	w2, [x20, 32]
	sub	w21, w3, w21, lsl 9
	str	w21, [x19, 12]
	ldrsb	w0, [x23, 9]
	cmp	w0, 2
	beq	.L413
	ldp	w1, w2, [x23, 16]
	ldp	w0, w3, [x19, 40]
	add	w2, w1, w2
	str	w2, [x19, 36]
	ldr	w1, [x23, 20]
	add	w1, w0, w1
	str	w1, [x19, 40]
	ldr	w0, [x23, 20]
	add	w0, w3, w0
	str	w0, [x19, 44]
.L413:
	ldr	w1, [x19, 48]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 48]
.L412:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L414:
	mov	w0, -4
	b	.L412
	.p2align 3
.L418:
	ldr	x3, .LC158
	mov	w4, 1448
	ldr	x2, .LC159
	mov	w1, w4
	add	x3, x3, 560
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L412
	.size	InsertStreamSeg, .-InsertStreamSeg
	.align	3
.LC158:
	.xword	.LANCHOR2
	.align	3
.LC159:
	.xword	.LC40
	.align	3
.LC160:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_GetStreamSeg
	.type	SCDDRV_GetStreamSeg, %function
SCDDRV_GetStreamSeg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x24, x1
	bl	_mcount
	cmp	x21, xzr
	ccmp	x24, xzr, 4, ne
	beq	.L441
	add	x22, x21, 135168
	ldr	w19, [x22, 8]
	tbnz	w19, #31, .L422
	ldr	w2, [x22, 12]
	tbnz	w2, #31, .L422
	cmp	w19, w2
	beq	.L432
	sxtw	x20, w19
	mov	w3, 43691
	lsl	x0, x20, 2
	movk	w3, 0x2aaa, lsl 16
	sub	x0, x0, x20
	lsl	x0, x0, 2
	sub	x0, x0, x20
	add	x0, x21, x0, lsl 3
	ldrsb	w0, [x0, 16]
	cmp	w0, 1
	bne	.L426
	b	.L424
	.p2align 3
.L439:
	sub	x0, x0, x20
	lsl	x0, x0, 2
	sub	x0, x0, x20
	add	x0, x21, x0, lsl 3
	ldrsb	w0, [x0, 16]
	cmp	w0, 1
	beq	.L424
.L426:
	add	w1, w19, 1
	smull	x19, w1, w3
	asr	x19, x19, 40
	sub	w19, w19, w1, asr 31
	lsl	w0, w19, 2
	sub	w19, w0, w19
	sub	w19, w1, w19, lsl 9
	cmp	w2, w19
	sxtw	x20, w19
	lsl	x0, x20, 2
	bne	.L439
.L432:
	mov	w0, -3
.L421:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L424:
	lsl	x23, x20, 2
	sub	x23, x23, x20
	lsl	x23, x23, 2
	sub	x23, x23, x20
	add	x23, x21, x23, lsl 3
	adds	x1, x23, 8
	beq	.L432
	ldr	x3, .LC163
	mov	x2, 88
	mov	x0, x24
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 88
	mov	w1, 2
	smaddl	x19, w19, w0, x21
	ldrsb	w0, [x19, 17]
	strb	w1, [x19, 16]
	cmp	w0, 2
	ldr	w2, [x22, 44]
	ldr	w4, [x23, 28]
	beq	.L430
	sub	w2, w2, w4
.L430:
	lsl	x0, x20, 2
	ldr	w1, [x22, 48]
	sub	x0, x0, x20
	cmp	w2, wzr
	lsl	x0, x0, 2
	csel	w2, w2, wzr, ge
	sub	x20, x0, x20
	subs	w1, w1, #1
	csel	w1, w1, wzr, pl
	mov	w0, 21
	add	x21, x21, x20, lsl 3
	stp	w2, w1, [x22, 44]
	ldr	x2, .LC165
	mov	w1, 1517
	ldrb	w5, [x19, 18]
	ldr	w3, [x21, 24]
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L422:
	ldr	x3, .LC161
	mov	w4, 1482
.L440:
	ldr	x2, .LC162
	mov	w1, w4
	add	x3, x3, 576
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L421
.L441:
	ldr	x3, .LC161
	mov	w4, 1481
	b	.L440
	.size	SCDDRV_GetStreamSeg, .-SCDDRV_GetStreamSeg
	.align	3
.LC161:
	.xword	.LANCHOR2
	.align	3
.LC162:
	.xword	.LC40
	.align	3
.LC163:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC165:
	.xword	.LC164
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseStreamSeg
	.type	ReleaseStreamSeg, %function
ReleaseStreamSeg:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x23, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x23, .L477
	sub	w0, w20, #1536
	cmn	w0, #1538
	bls	.L478
	cmn	w20, #1
	add	x22, x23, 135168
	beq	.L479
	ldp	w0, w3, [x22, 8]
	cmp	w0, w3
	beq	.L464
	cmp	w20, w0
	mov	w4, 43691
	movk	w4, 0xaaaa, lsl 16
	bne	.L450
	b	.L448
	.p2align 3
.L473:
	cmp	w20, w0
	beq	.L448
.L450:
	add	w1, w0, 1
	umull	x0, w1, w4
	lsr	x0, x0, 32
	lsr	w0, w0, 10
	lsl	w2, w0, 2
	sub	w0, w2, w0
	sub	w0, w1, w0, lsl 9
	cmp	w0, w3
	bne	.L473
.L464:
	mov	w0, -3
.L468:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L448:
	uxtw	x1, w0
	mov	w0, -3
	lsl	x24, x1, 2
	sub	x24, x24, x1
	lsl	x24, x24, 2
	sub	x1, x24, x1
	add	x1, x23, x1, lsl 3
	add	x24, x1, 8
	ldrsb	w2, [x1, 16]
	cmp	w2, 2
	bne	.L468
.L447:
	mov	w0, -3
	cbz	x24, .L468
	ldrb	w5, [x24, 10]
	mov	w6, w20
	ldr	x2, .LC169
	mov	w1, 1573
	ldp	w3, w4, [x24, 16]
	strb	wzr, [x24, 8]
	mov	w0, 21
	bl	dprint_normal
	ldr	w19, [x22, 8]
	cmp	w20, w19
	beq	.L480
.L452:
	ldrsb	w0, [x24, 9]
	cmp	w0, 2
	beq	.L475
	ldr	w0, [x22, 40]
	ldr	w1, [x24, 20]
	sub	w1, w0, w1
.L456:
	cmp	w1, wzr
	mov	w0, 0
	csel	w1, w1, wzr, ge
	str	w1, [x22, 40]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L479:
	ldp	w20, w0, [x22, 8]
	cmp	w20, w0
	beq	.L464
	sxtw	x24, w20
	lsl	x0, x24, 2
	sub	x0, x0, x24
	lsl	x0, x0, 2
	sub	x24, x0, x24
	add	x24, x23, x24, lsl 3
	add	x24, x24, 8
	b	.L447
	.p2align 3
.L475:
	ldr	w1, [x22, 40]
	b	.L456
	.p2align 3
.L480:
	ldr	x20, .LC166
	mov	w25, 43691
	ldr	x21, .LC171
	movk	w25, 0xaaaa, lsl 16
	add	x20, x20, 624
	b	.L457
	.p2align 3
.L453:
	ldr	w2, [x22, 12]
	lsl	x0, x0, 2
	sub	x0, x0, x1
	cmp	w19, w2
	add	x0, x23, x0, lsl 3
	beq	.L459
	ldrsb	w1, [x0, 16]
	cbnz	w1, .L481
.L454:
	add	w0, w19, 1
	umull	x19, w0, w25
	lsr	x19, x19, 32
	lsr	w19, w19, 10
	lsl	w1, w19, 2
	sub	w19, w1, w19
	sub	w19, w0, w19, lsl 9
.L457:
	uxtw	x1, w19
	cmp	w19, 1535
	lsl	x0, x1, 2
	sub	x0, x0, x1
	bls	.L453
	mov	x2, x21
	mov	x3, x20
	mov	w1, 1581
	mov	w0, 1
	bl	dprint_normal
	ldr	w2, [x22, 12]
	cmp	w19, w2
	bne	.L454
	.p2align 2
.L459:
	ldr	w0, [x22, 36]
	str	w2, [x22, 8]
	str	w0, [x22, 32]
	b	.L452
	.p2align 3
.L481:
	str	w19, [x22, 8]
	ldrsb	w1, [x24, 9]
	cmp	w1, 2
	beq	.L475
	ldr	w0, [x0, 24]
	str	w0, [x22, 32]
	b	.L452
.L478:
	ldr	x3, .LC166
	mov	w4, 1534
.L476:
	ldr	x2, .LC167
	mov	w1, w4
	add	x3, x3, 600
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L468
.L477:
	ldr	x3, .LC166
	mov	w4, 1533
	b	.L476
	.size	ReleaseStreamSeg, .-ReleaseStreamSeg
	.align	3
.LC166:
	.xword	.LANCHOR2
	.align	3
.LC167:
	.xword	.LC40
	.align	3
.LC169:
	.xword	.LC168
	.align	3
.LC171:
	.xword	.LC170
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetSegStreamSize
	.type	GetSegStreamSize, %function
GetSegStreamSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cbz	x19, .L487
	cbz	x20, .L488
	add	x19, x19, 135168
	mov	w0, 0
	ldr	w1, [x19, 40]
	str	w1, [x20]
.L484:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L487:
	ldr	x3, .LC173
	mov	w4, 1620
.L486:
	ldr	x2, .LC174
	mov	w1, w4
	add	x3, x3, 648
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L484
.L488:
	ldr	x3, .LC173
	mov	w4, 1621
	b	.L486
	.size	GetSegStreamSize, .-GetSegStreamSize
	.align	3
.LC173:
	.xword	.LANCHOR2
	.align	3
.LC174:
	.xword	.LC40
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetSegStreamNum
	.type	GetSegStreamNum, %function
GetSegStreamNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L491
	add	x19, x19, 135168
	mov	w0, 43691
	movk	w0, 0xaaaa, lsl 16
	ldp	w2, w1, [x19, 8]
	ldr	x19, [sp, 16]
	add	w1, w1, 1536
	sub	w1, w1, w2
	ldp	x29, x30, [sp], 32
	umull	x0, w1, w0
	lsr	x0, x0, 32
	lsr	w0, w0, 10
	lsl	w2, w0, 2
	sub	w0, w2, w0
	sub	w0, w1, w0, lsl 9
	ret
	.p2align 3
.L491:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetSegStreamNum, .-GetSegStreamNum
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetFreshSegStream
	.type	GetFreshSegStream, %function
GetFreshSegStream:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	x21, x2
	bl	_mcount
	cbz	x19, .L498
	cbz	x20, .L499
	cbz	x21, .L500
	add	x19, x19, 135168
	ldr	w0, [x19, 48]
	str	w0, [x20]
	ldr	w0, [x19, 44]
	str	w0, [x21]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L498:
	ldr	x3, .LC175
	mov	w4, 1640
.L497:
	ldr	x2, .LC176
	mov	w1, w4
	add	x3, x3, 672
	mov	w0, 32
	bl	dprint_normal
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L499:
	ldr	x3, .LC175
	mov	w4, 1641
	b	.L497
	.p2align 3
.L500:
	ldr	x3, .LC175
	mov	w4, 1642
	b	.L497
	.size	GetFreshSegStream, .-GetFreshSegStream
	.align	3
.LC175:
	.xword	.LANCHOR2
	.align	3
.LC176:
	.xword	.LC80
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_PrepareSleep
	.type	SCDDRV_PrepareSleep, %function
SCDDRV_PrepareSleep:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L506
	ldr	x1, .LC179
	ldr	w0, [x1, 144]
	cbnz	w0, .L505
	ldr	w0, [x1, 120]
	cbz	w0, .L507
	mov	w2, 1
	mov	w0, 0
	str	w2, [x1, 144]
.L503:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L507:
	mov	w2, 2
	str	w2, [x1, 144]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L505:
	mov	w0, -1
	b	.L503
	.p2align 3
.L506:
	ldr	x3, .LC177
	mov	w4, 1650
	ldr	x2, .LC178
	mov	w1, w4
	add	x3, x3, 696
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L503
	.size	SCDDRV_PrepareSleep, .-SCDDRV_PrepareSleep
	.align	3
.LC177:
	.xword	.LANCHOR2
	.align	3
.LC178:
	.xword	.LC40
	.align	3
.LC179:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_GetSleepStage
	.type	SCDDRV_GetSleepStage, %function
SCDDRV_GetSleepStage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, 3
	cbz	w19, .L511
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L511:
	ldr	x0, .LC180
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 144]
	ret
	.size	SCDDRV_GetSleepStage, .-SCDDRV_GetSleepStage
	.align	3
.LC180:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_ForceSleep
	.type	SCDDRV_ForceSleep, %function
SCDDRV_ForceSleep:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L518
	ldr	x0, .LC183
	ldr	w1, [x0, 144]
	cmp	w1, 2
	beq	.L512
	mov	w1, 2
	str	w1, [x0, 144]
.L512:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L518:
	ldr	x3, .LC181
	mov	w4, 1681
	ldr	x2, .LC182
	mov	w1, w4
	add	x3, x3, 720
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_ForceSleep, .-SCDDRV_ForceSleep
	.align	3
.LC181:
	.xword	.LANCHOR2
	.align	3
.LC182:
	.xword	.LC80
	.align	3
.LC183:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_ExitSleep
	.type	SCDDRV_ExitSleep, %function
SCDDRV_ExitSleep:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L522
	ldr	x0, .LC186
	str	wzr, [x0, 144]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L522:
	ldr	x3, .LC184
	mov	w4, 1691
	ldr	x2, .LC185
	mov	w1, w4
	add	x3, x3, 744
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_ExitSleep, .-SCDDRV_ExitSleep
	.align	3
.LC184:
	.xword	.LANCHOR2
	.align	3
.LC185:
	.xword	.LC80
	.align	3
.LC186:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ResetLastUnfinishedSegInfo
	.type	ResetLastUnfinishedSegInfo, %function
ResetLastUnfinishedSegInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L526
	add	x0, x19, 184320
	ldr	x4, .LC189
	add	x6, x0, 512
	mov	w3, -1
	mov	w5, 1
	mov	x2, 88
	strh	w3, [x0, 596]
	mov	w1, 0
	strh	w3, [x0, 604]
	add	x0, x0, 640
	str	w3, [x0, -40]
	ldr	x4, [x4, 96]
	stp	w3, wzr, [x6, 96]
	stp	w5, wzr, [x6, 104]
	str	wzr, [x0, -16]
	str	wzr, [x0, -12]
	str	wzr, [x0, -8]
	blr	x4
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L526:
	ldr	x3, .LC187
	mov	w4, 1698
	ldr	x2, .LC188
	mov	w1, w4
	add	x3, x3, 768
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ResetLastUnfinishedSegInfo, .-ResetLastUnfinishedSegInfo
	.align	3
.LC187:
	.xword	.LANCHOR2
	.align	3
.LC188:
	.xword	.LC80
	.align	3
.LC189:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_ClearInst
	.type	SM_ClearInst, %function
SM_ClearInst:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L530
	ldr	x20, .LC193
	sbfiz	x19, x19, 4, 32
	ldr	x3, .LC192
	mov	x2, 62168
	movk	x2, 0x2, lsl 16
	mov	w1, 0
	ldr	x0, [x20, x19]
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x0, [x20, x19]
	bl	ResetLastUnfinishedSegInfo
	ldr	x1, [x20, x19]
	mov	x2, -1
	mov	w0, 0
	add	x1, x1, 184320
	str	x2, [x1, 280]
.L529:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L530:
	ldr	x3, .LC190
	mov	w4, 1796
	ldr	x2, .LC191
	mov	w1, w4
	add	x3, x3, 800
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L529
	.size	SM_ClearInst, .-SM_ClearInst
	.align	3
.LC190:
	.xword	.LANCHOR2
	.align	3
.LC191:
	.xword	.LC40
	.align	3
.LC192:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC193:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_InstInit
	.type	SM_InstInit, %function
SM_InstInit:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	mov	x19, 0
	bl	_mcount
	ldr	x21, .LC194
	ldr	x20, .LC195
.L532:
	ldr	x3, [x21, 96]
	add	x0, x20, x19
	mov	x2, 16
	mov	w1, 0
	add	x19, x19, x2
	blr	x3
	cmp	x19, 64
	bne	.L532
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	SM_InstInit, .-SM_InstInit
	.align	3
.LC194:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC195:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_OpenSCDDrv
	.type	SM_OpenSCDDrv, %function
SM_OpenSCDDrv:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w22, w1
	mov	w20, w2
	bl	_mcount
	cbz	w19, .L544
	cmp	w22, wzr
	ble	.L545
	cbnz	w20, .L546
	ldr	x21, .LC198
	mov	w1, 49152
	movk	w1, 0xf8c3, lsl 16
	add	x20, x21, 64
	ldr	w0, [x20, 48]
	str	w1, [x21, 136]
	cmp	w0, 1
	beq	.L542
	ldr	x3, .LC199
	mov	x2, 72
	mov	w1, 0
	mov	x0, x20
	ldr	x3, [x3, 96]
	blr	x3
	str	wzr, [x21, 144]
	ldr	x2, .LC200
	add	w1, w19, 1023
	and	w1, w1, -1024
	ldr	w3, [x21, 136]
	mov	w0, w1
	str	w1, [x20, 12]
	stp	w19, w22, [x20, 4]
	str	w3, [x21, 64]
	sub	w21, w1, w19
	str	wzr, [x2, 56]
	mov	w1, 6144
	str	w1, [x20, 24]
	add	w19, w19, 4096
	add	w19, w19, 2048
	bl	MEM_Phy2Vir
	str	x0, [x20, 16]
	cbz	x0, .L547
	add	w19, w21, w19
	mov	w1, 18432
	mov	w0, w19
	str	w19, [x20, 28]
	str	w1, [x20, 40]
	bl	MEM_Phy2Vir
	str	x0, [x20, 32]
	add	w4, w21, 24576
	cbz	x0, .L548
	cmp	w22, w4
	blt	.L549
	mov	w1, 1
	mov	w0, 0
	str	w1, [x20, 48]
.L536:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L542:
	mov	w0, -7
	b	.L536
	.p2align 3
.L544:
	ldr	x3, .LC196
	mov	w4, 1821
.L543:
	ldr	x2, .LC197
	mov	w1, w4
	add	x3, x3, 816
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L536
	.p2align 3
.L546:
	ldr	x3, .LC196
	mov	w4, 1823
	b	.L543
	.p2align 3
.L549:
	ldr	x3, .LC196
	mov	w5, w22
	ldr	x2, .LC206
	mov	w1, 1866
	add	x3, x3, 816
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -7
	b	.L536
.L547:
	ldr	x3, .LC196
	mov	w1, 1849
	ldr	x2, .LC202
	add	x3, x3, 816
	bl	dprint_normal
	mov	w0, -7
	b	.L536
.L545:
	ldr	x3, .LC196
	mov	w4, 1822
	b	.L543
.L548:
	ldr	x3, .LC196
	mov	w1, 1860
	ldr	x2, .LC204
	add	x3, x3, 816
	bl	dprint_normal
	mov	w0, -7
	b	.L536
	.size	SM_OpenSCDDrv, .-SM_OpenSCDDrv
	.align	3
.LC196:
	.xword	.LANCHOR2
	.align	3
.LC197:
	.xword	.LC40
	.align	3
.LC198:
	.xword	.LANCHOR0
	.align	3
.LC199:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC200:
	.xword	g_VfmwGlobalStat
	.align	3
.LC202:
	.xword	.LC201
	.align	3
.LC204:
	.xword	.LC203
	.align	3
.LC206:
	.xword	.LC205
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_Config
	.type	SM_Config, %function
SM_Config:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w21, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w21, 3
	bhi	.L566
	cbz	x19, .L567
	ldr	x1, .LC210
	sbfiz	x0, x21, 4, 32
	ldr	x20, [x1, x0]
	cbz	x20, .L565
	add	x22, x20, 184320
	ldr	w0, [x19, 48]
	str	w0, [x22, 328]
	ldr	w0, [x19, 16]
	ldr	w2, [x20, 24]
	cmp	w2, w0
	beq	.L568
	cbz	w0, .L569
	ldr	x0, [x19]
	cbz	x0, .L570
	ldp	w5, w3, [x1, 88]
	ldr	w2, [x1, 76]
	ldr	x0, [x1, 80]
	stp	w5, w2, [x22, 200]
	str	x0, [x22, 192]
	ldr	x2, [x1, 96]
	ldr	w0, [x1, 104]
	str	x2, [x22, 208]
	str	w0, [x22, 220]
	mov	w0, 1536
	str	w3, [x22, 216]
	str	w0, [x22, 224]
	add	x0, x20, 49152
	add	x0, x0, 112
	ldr	w3, [x19, 16]
	ldr	x6, [x19]
	add	w1, w3, 3
	and	w1, w1, -4
	sub	w5, w1, w3
	add	w1, w1, 4096
	str	w1, [x22, 228]
	sxtw	x2, w5
	add	x2, x2, 4096
	add	x2, x6, x2
	str	x2, [x22, 184]
	ldr	w3, [x19, 20]
	sub	w3, w3, w5
	sub	w3, w3, #4096
	sub	w3, w3, #1024
	str	w3, [x22, 232]
	bl	ConfigStreamSegArray
	cbnz	w0, .L560
	ldr	x23, .LC211
	add	x20, x20, 8
	mov	x2, 80
	mov	x1, x19
	mov	x0, x20
	ldr	x3, [x23, 104]
	blr	x3
	str	wzr, [x22, 244]
.L555:
	ldr	x3, [x23, 104]
	mov	x1, x19
	mov	x2, 80
	mov	x0, x20
	blr	x3
	mov	w0, 2
	str	w0, [x22, 316]
	ldr	w1, [x19, 12]
	sub	w0, w1, #2
	and	w0, w0, -3
	cmp	w0, wzr
	ccmp	w1, 14, 4, ne
	bne	.L558
	mov	w0, 3
	str	w0, [x22, 316]
.L558:
	mov	w0, 0
	str	w21, [x22, 240]
.L552:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L568:
	add	x20, x20, 8
	ldr	x23, .LC211
	b	.L555
	.p2align 3
.L560:
	mov	w0, -2
	b	.L552
	.p2align 3
.L566:
	ldr	x3, .LC208
	mov	w4, 1903
.L564:
	ldr	x2, .LC209
	mov	w1, w4
	add	x3, x3, 832
	mov	w0, 32
	bl	dprint_normal
.L565:
	mov	w0, -1
	b	.L552
	.p2align 3
.L569:
	ldr	x3, .LC208
	mov	w4, 1918
	b	.L564
.L570:
	ldr	x3, .LC208
	mov	w4, 1919
	b	.L564
.L567:
	ldr	x3, .LC208
	mov	w4, 1904
	b	.L564
	.size	SM_Config, .-SM_Config
	.align	3
.LC208:
	.xword	.LANCHOR2
	.align	3
.LC209:
	.xword	.LC40
	.align	3
.LC210:
	.xword	.LANCHOR0
	.align	3
.LC211:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_CfgBuf
	.type	SM_CfgBuf, %function
SM_CfgBuf:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 3
	bhi	.L579
	cbnz	w20, .L580
	ldr	x1, .LC217
	sbfiz	x19, x19, 4, 32
	ldr	x2, [x1, x19]
	cbz	x2, .L575
	add	x2, x2, 184320
	ldr	w0, [x2, 244]
	cbz	w0, .L573
	add	x0, x1, 64
	ldr	w7, [x0, 12]
	ldr	x6, [x0, 16]
	ldr	x3, [x0, 32]
	ldp	w5, w4, [x0, 24]
	ldr	w0, [x0, 40]
	stp	w4, w0, [x2, 216]
	mov	w0, 1536
	str	x6, [x2, 192]
	str	w0, [x2, 224]
	mov	w0, 0
	stp	w5, w7, [x2, 200]
	str	x3, [x2, 208]
	str	wzr, [x2, 244]
.L573:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L579:
	mov	w3, 1973
	ldr	x2, .LC214
	mov	w4, w19
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L573
	.p2align 3
.L580:
	mov	w3, 1980
	ldr	x2, .LC216
	mov	w4, w20
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L573
.L575:
	mov	w0, -1
	b	.L573
	.size	SM_CfgBuf, .-SM_CfgBuf
	.align	3
.LC214:
	.xword	.LC213
	.align	3
.LC216:
	.xword	.LC215
	.align	3
.LC217:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_Start
	.type	SM_Start, %function
SM_Start:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L587
	ldr	x0, .LC221
	sbfiz	x19, x19, 4, 32
	ldr	x0, [x0, x19]
	cbz	x0, .L586
	ldr	w1, [x0, 28]
	cbz	w1, .L586
	add	x1, x0, 184320
	ldr	w0, [x1, 256]
	cbnz	w0, .L586
	mov	w2, 1
	str	w2, [x1, 256]
.L583:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L586:
	mov	w0, -7
	b	.L583
	.p2align 3
.L587:
	ldr	x3, .LC219
	mov	w4, 2015
	ldr	x2, .LC220
	mov	w1, w4
	add	x3, x3, 848
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L583
	.size	SM_Start, .-SM_Start
	.align	3
.LC219:
	.xword	.LANCHOR2
	.align	3
.LC220:
	.xword	.LC40
	.align	3
.LC221:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_Stop
	.type	SM_Stop, %function
SM_Stop:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L596
	ldr	x0, .LC224
	sbfiz	x19, x19, 4, 32
	ldr	x0, [x0, x19]
	cbz	x0, .L591
	add	x1, x0, 184320
	ldr	w0, [x1, 256]
	cbz	w0, .L590
	ldr	w0, [x1, 244]
	cmp	w0, wzr
	bgt	.L592
	mov	w0, 0
	str	wzr, [x1, 256]
.L590:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L592:
	mov	w0, -7
	b	.L590
	.p2align 3
.L591:
	mov	w0, 0
	b	.L590
	.p2align 3
.L596:
	ldr	x3, .LC222
	mov	w4, 2036
	ldr	x2, .LC223
	mov	w1, w4
	add	x3, x3, 864
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L590
	.size	SM_Stop, .-SM_Stop
	.align	3
.LC222:
	.xword	.LANCHOR2
	.align	3
.LC223:
	.xword	.LC40
	.align	3
.LC224:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_Reset
	.type	SM_Reset, %function
SM_Reset:
	stp	x29, x30, [sp, -432]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	str	wzr, [x29, 92]
	cmp	w20, 3
	bhi	.L610
	ldr	x0, .LC227
	sbfiz	x1, x20, 4, 32
	ldr	x21, [x0, x1]
	cbz	x21, .L600
	add	x0, x0, 64
	ldr	w1, [x0, 52]
	ldr	x22, .LC230
	cmp	w20, w1
	bne	.L602
	ldr	x1, [x22, 256]
	str	wzr, [x0, 56]
	mov	w0, 1
	blr	x1
	ldr	x3, .LC225
	mov	w4, 1745
	ldr	x2, .LC234
	mov	w1, w4
	add	x3, x3, 888
	mov	w0, 20
	bl	dprint_normal
.L602:
	ldr	x3, [x22, 104]
	mov	x2, 80
	add	x1, x21, 8
	add	x0, x29, 96
	add	x19, x21, 184320
	add	x25, x21, 88
	blr	x3
	add	x24, x19, 336
	ldr	x3, [x22, 104]
	mov	x1, x24
	mov	x2, 256
	add	x0, x29, 176
	ldr	w23, [x19, 256]
	ldr	w26, [x19, 332]
	blr	x3
	mov	w0, w20
	bl	SM_Stop
	add	x1, x29, 92
	mov	x0, x25
	bl	GetRawStreamNum
	cbnz	w0, .L611
.L603:
	ldr	w1, [x29, 92]
	mov	x0, x25
	sub	w23, w23, #1
	bl	DeleteRawPacket
	mov	w1, 1
	mov	w0, w20
	bl	DeleteRawPacketInBuffer
	ldrsb	w25, [x19, 240]
	ldr	x3, [x22, 96]
	mov	x2, 62168
	movk	x2, 0x2, lsl 16
	mov	w1, 0
	mov	x0, x21
	blr	x3
	mov	x0, x21
	bl	ResetLastUnfinishedSegInfo
	str	w25, [x19, 240]
	mov	x1, -1
	mov	w0, 2
	str	x1, [x19, 280]
	add	x1, x29, 96
	str	w0, [x19, 316]
	mov	w0, w20
	bl	SM_Config
	cmp	w23, 1
	bls	.L612
	str	wzr, [x19, 256]
.L605:
	ldr	x3, [x22, 104]
	mov	x2, 256
	add	x1, x29, 176
	mov	x0, x24
	str	w26, [x19, 332]
	blr	x3
	mov	w0, 0
.L609:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 432
	ret
	.p2align 3
.L611:
	ldr	x3, .LC225
	mov	w4, 1762
	ldr	x2, .LC232
	mov	w1, w4
	add	x3, x3, 888
	mov	w0, 20
	bl	dprint_normal
	b	.L603
	.p2align 3
.L612:
	mov	w0, 1
	str	w0, [x19, 256]
	b	.L605
	.p2align 3
.L610:
	ldr	x3, .LC225
	mov	w4, 1728
	ldr	x2, .LC226
	mov	w1, w4
	add	x3, x3, 872
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L609
.L600:
	mov	w3, 1734
	ldr	x2, .LC229
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L609
	.size	SM_Reset, .-SM_Reset
	.align	3
.LC225:
	.xword	.LANCHOR2
	.align	3
.LC226:
	.xword	.LC40
	.align	3
.LC227:
	.xword	.LANCHOR0
	.align	3
.LC229:
	.xword	.LC228
	.align	3
.LC230:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC232:
	.xword	.LC231
	.align	3
.LC234:
	.xword	.LC233
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_CloseSCDDrv
	.type	SM_CloseSCDDrv, %function
SM_CloseSCDDrv:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L616
	mov	w0, 0
	bl	SM_Stop
	mov	w0, 1
	bl	SM_Stop
	mov	w0, 2
	bl	SM_Stop
	mov	w0, 3
	bl	SM_Stop
	ldr	x3, .LC239
	mov	x2, 72
	ldr	x4, .LC238
	mov	w1, 0
	ldr	x0, .LC240
	ldr	x3, [x3, 96]
	add	x0, x0, 64
	str	wzr, [x4, 56]
	blr	x3
	mov	w0, 0
.L615:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L616:
	ldr	x3, .LC236
	mov	w4, 1879
	ldr	x2, .LC237
	mov	w1, w4
	add	x3, x3, 904
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L615
	.size	SM_CloseSCDDrv, .-SM_CloseSCDDrv
	.align	3
.LC236:
	.xword	.LANCHOR2
	.align	3
.LC237:
	.xword	.LC40
	.align	3
.LC238:
	.xword	g_VfmwGlobalStat
	.align	3
.LC239:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC240:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_GetInfo
	.type	SM_GetInfo, %function
SM_GetInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 3
	bhi	.L625
	cbz	x19, .L626
	ldr	x0, .LC243
	sbfiz	x20, x20, 4, 32
	ldr	x3, [x0, x20]
	cbz	x3, .L627
	add	x1, x3, 184320
	add	x0, x3, 49152
	adds	x0, x0, 112
	ldr	w2, [x1, 256]
	strb	w2, [x19]
	ldr	w1, [x1, 308]
	str	w1, [x19, 20]
	beq	.L623
	add	x4, x0, 135168
	mov	w2, 43691
	movk	w2, 0xaaaa, lsl 16
	ldr	w1, [x4, 12]
	ldr	w4, [x4, 8]
	add	w1, w1, 1536
	sub	w1, w1, w4
	umull	x2, w1, w2
	lsr	x2, x2, 32
	lsr	w2, w2, 10
	lsl	w4, w2, 2
	sub	w2, w4, w2
	sub	w2, w1, w2, lsl 9
.L622:
	str	w2, [x19, 8]
	add	x1, x19, 16
	add	x20, x3, 88
	bl	GetSegStreamSize
	add	x1, x19, 4
	mov	x0, x20
	bl	GetRawStreamNum
	add	x1, x19, 12
	mov	x0, x20
	bl	GetRawStreamSize
	mov	w0, 0
.L619:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L627:
	strb	wzr, [x19]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L623:
	mov	w2, 0
	b	.L622
	.p2align 3
.L625:
	ldr	x3, .LC241
	mov	w4, 2061
.L624:
	ldr	x2, .LC242
	mov	w1, w4
	add	x3, x3, 920
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L619
.L626:
	ldr	x3, .LC241
	mov	w4, 2062
	b	.L624
	.size	SM_GetInfo, .-SM_GetInfo
	.align	3
.LC241:
	.xword	.LANCHOR2
	.align	3
.LC242:
	.xword	.LC40
	.align	3
.LC243:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetRawNumInFrame
	.type	GetRawNumInFrame, %function
GetRawNumInFrame:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	mov	x21, x2
	bl	_mcount
	add	x2, x20, 49152
	mov	w3, 1
	ldr	w0, [x2]
	uxtw	x5, w0
	lsl	x1, x5, 2
	sub	x1, x1, x5
	add	x1, x20, x1, lsl 5
	ldr	w1, [x1, 8]
	str	w1, [x21]
	str	w3, [x19]
	b	.L629
	.p2align 3
.L631:
	ldr	w3, [x19]
	add	w3, w3, 1
	str	w3, [x19]
	ldr	w1, [x21]
	ldr	w3, [x4, 8]
	add	w3, w1, w3
	str	w3, [x21]
	ldr	w1, [x2, 4]
	cmp	w0, w1
	beq	.L633
	ldr	w1, [x19]
	cmp	w1, 512
	bhi	.L633
.L629:
	lsl	x3, x5, 2
	add	w0, w0, 1
	sub	x3, x3, x5
	and	w0, w0, 511
	lsl	x3, x3, 5
	uxtw	x5, w0
	lsl	x4, x5, 2
	ldrb	w1, [x20, x3]
	sub	x4, x4, x5
	add	x4, x20, x4, lsl 5
	cbnz	w1, .L631
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L633:
	mov	w0, -4
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	GetRawNumInFrame, .-GetRawNumInFrame
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AdjustRawPacketVP6A
	.type	AdjustRawPacketVP6A, %function
AdjustRawPacketVP6A:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x23, x1
	mov	x22, x0
	mov	x0, x30
	mov	x19, x4
	mov	x21, x2
	mov	x20, x3
	bl	_mcount
	add	x0, x22, 49152
	ldr	w4, [x23]
	ldr	w5, [x0]
	cbz	w4, .L639
	uxtw	x7, w5
	lsl	x0, x7, 2
	sub	x0, x0, x7
	add	x0, x22, x0, lsl 5
	ldr	w6, [x0, 8]
	cmp	w6, 2
	bgt	.L640
	mov	w0, w6
	mov	w3, 3
	mov	w2, 0
	b	.L637
	.p2align 3
.L638:
	uxtw	x7, w5
	lsl	x0, x7, 2
	sub	x0, x0, x7
	add	x0, x22, x0, lsl 5
	ldr	w0, [x0, 8]
	add	w6, w6, w0
	cmp	w6, 2
	bgt	.L642
.L637:
	add	w2, w2, 1
	add	w5, w5, 1
	cmp	w2, w4
	sub	w3, w3, w0
	and	w5, w5, 511
	bne	.L638
.L639:
	mov	w0, -4
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L642:
	sxtw	x3, w3
.L636:
	lsl	x0, x7, 2
	sub	w2, w4, w2
	sub	x7, x0, x7
	str	w2, [x23]
	sub	w6, w6, #3
	mov	w0, 0
	add	x22, x22, x7, lsl 5
	ldr	x1, [x22, 40]
	add	x3, x1, x3
	str	x3, [x21]
	str	w6, [x20]
	str	w5, [x19]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L640:
	mov	x3, 3
	mov	w2, 0
	b	.L636
	.size	AdjustRawPacketVP6A, .-AdjustRawPacketVP6A
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_CopyRawToSeg
	.type	SM_CopyRawToSeg, %function
SM_CopyRawToSeg:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w19, w0
	mov	x0, x30
	mov	x26, x1
	str	w19, [x29, 108]
	bl	_mcount
	ldr	x1, .LC244
	sbfiz	x0, x19, 4, 32
	ldr	x24, [x1, x0]
	cbz	x24, .L684
	add	x22, x24, 88
	add	x27, x24, 49152
	add	x0, x27, 112
	cmp	x22, xzr
	ccmp	x0, xzr, 4, ne
	str	x0, [x29, 112]
	ccmp	x26, xzr, 4, ne
	beq	.L685
	add	x0, x22, 49152
	ldp	w23, w4, [x0]
	cmp	w4, w23
	beq	.L681
	uxtw	x1, w23
	mov	w0, w23
	lsl	x2, x1, 2
	mov	x3, x1
	sub	x2, x2, x1
	mov	w21, 1
	add	x1, x22, x2, lsl 5
	ldr	w25, [x1, 8]
	b	.L648
	.p2align 3
.L650:
	add	w21, w21, 1
	ldr	w1, [x2, 8]
	cmp	w21, 512
	ccmp	w4, w0, 4, ls
	add	w25, w25, w1
	beq	.L681
.L648:
	lsl	x2, x3, 2
	add	w0, w0, 1
	sub	x1, x2, x3
	and	w0, w0, 511
	lsl	x1, x1, 5
	uxtw	x3, w0
	lsl	x2, x3, 2
	ldrb	w1, [x22, x1]
	sub	x2, x2, x3
	add	x2, x22, x2, lsl 5
	cbnz	w1, .L650
	ldr	x0, [x29, 112]
	bl	ResetStreamSegArray
	add	x0, x27, 112
	add	x0, x0, 135168
	ldr	w1, [x0, 28]
	cmp	w1, w25
	blt	.L686
	sxtw	x19, w23
	ldr	w1, [x24, 20]
	lsl	x2, x19, 2
	ldr	x24, [x27, 112]
	sub	x2, x2, x19
	cmp	w1, 12
	add	x1, x22, 49152
	ldr	w0, [x0, 24]
	add	x2, x22, x2, lsl 5
	ldr	w23, [x1]
	ldr	w27, [x2, 8]
	ldr	x28, [x2, 40]
	ccmp	w27, wzr, 4, eq
	beq	.L652
	cbz	w21, .L681
	uxtw	x20, w23
	lsl	x1, x20, 2
	sub	x1, x1, x20
	add	x1, x22, x1, lsl 5
	ldr	w27, [x1, 8]
	cmp	w27, 2
	bgt	.L664
	mov	w7, 3
	mov	w2, 0
	mov	w5, w27
	b	.L655
	.p2align 3
.L656:
	uxtw	x20, w23
	lsl	x1, x20, 2
	sub	x1, x1, x20
	add	x1, x22, x1, lsl 5
	ldr	w5, [x1, 8]
	add	w27, w27, w5
	cmp	w27, 2
	bgt	.L687
.L655:
	add	w2, w2, 1
	add	w23, w23, 1
	cmp	w2, w21
	sub	w7, w7, w5
	and	w23, w23, 511
	bne	.L656
	.p2align 2
.L681:
	mov	w0, -4
.L677:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
.L687:
	sxtw	x7, w7
.L653:
	lsl	x1, x20, 2
	sub	w21, w21, w2
	sub	x1, x1, x20
	sub	w27, w27, #3
	add	x1, x22, x1, lsl 5
	ldr	x28, [x1, 40]
	add	x28, x28, x7
	.p2align 2
.L652:
	str	w0, [x26, 16]
	bl	MEM_Phy2Vir
	str	x0, [x26]
	lsl	x1, x19, 2
	sub	x2, x24, x0
	sub	x1, x1, x19
	str	w2, [x26, 20]
	mov	w3, 1
	add	x1, x22, x1, lsl 5
	ldr	x2, [x1, 64]
	str	x2, [x26, 32]
	ldr	x2, [x1, 64]
	str	x2, [x26, 40]
	ldr	x2, [x1, 48]
	str	x2, [x26, 48]
	strb	w3, [x26, 10]
	ldr	x2, [x1, 56]
	str	x2, [x26, 56]
	ldr	w2, [x1, 20]
	str	w2, [x26, 64]
	ldr	w2, [x1, 24]
	str	w2, [x26, 68]
	ldr	w2, [x1, 28]
	str	w2, [x26, 72]
	ldr	w1, [x1, 32]
	str	w1, [x26, 76]
	cbz	w21, .L657
	cmp	x28, xzr
	mov	w19, 0
	ccmp	x24, xzr, 4, ne
	uxtw	x20, w23
	bne	.L659
	b	.L681
	.p2align 3
.L660:
	cmp	x28, xzr
	ccmp	x24, xzr, 4, ne
	beq	.L681
.L659:
	sxtw	x2, w27
	mov	w0, 2
	str	x2, [x29, 120]
	add	w23, w23, 1
	bl	VCTRL_RecordPosTime
	and	w23, w23, 511
	ldr	x0, .LC251
	mov	x1, x28
	ldr	x2, [x29, 120]
	add	w19, w19, 1
	ldr	x6, [x0, 104]
	mov	x0, x24
	add	x24, x24, x2
	blr	x6
	mov	w0, 3
	bl	VCTRL_RecordPosTime
	mov	w1, w27
	mov	w0, 0
	bl	VCTRL_RecordData
	lsl	x2, x20, 2
	ldr	w1, [x26, 20]
	sub	x2, x2, x20
	uxtw	x20, w23
	lsl	x0, x20, 2
	add	w27, w1, w27
	add	x2, x22, x2, lsl 5
	sub	x0, x0, x20
	cmp	w21, w19
	add	x0, x22, x0, lsl 5
	ldrb	w1, [x2, 1]
	strb	w1, [x26, 11]
	str	w27, [x26, 20]
	ldr	w27, [x0, 8]
	ldr	x28, [x0, 40]
	bne	.L660
	ldr	x0, [x26]
.L657:
	cbz	x0, .L688
	ldr	w2, [x29, 108]
	mov	x1, x26
	ldr	x0, [x29, 112]
	bl	InsertStreamSeg
	mov	w1, w25
	mov	x0, x22
	bl	DeleteRawLen
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L686:
	ldr	x2, .LC248
	mov	w1, 2196
	mov	w3, w25
	mov	w0, 0
	bl	dprint_normal
	mov	w1, w25
	mov	x0, x22
	bl	DeleteRawLen
	cbz	w0, .L681
	mov	w3, 2200
	ldr	x2, .LC250
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -4
	b	.L677
.L685:
	ldr	x3, .LC245
	mov	w4, 2176
.L680:
	ldr	x2, .LC246
	mov	w1, w4
	add	x3, x3, 936
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L677
.L664:
	mov	x7, 3
	mov	w2, 0
	b	.L653
.L684:
	ldr	x3, .LC245
	mov	w4, 2171
	b	.L680
.L688:
	ldr	x3, .LC245
	mov	w4, 2261
	ldr	x2, .LC253
	mov	w1, w4
	add	x3, x3, 936
	mov	w0, 1
	bl	dprint_normal
	b	.L681
	.size	SM_CopyRawToSeg, .-SM_CopyRawToSeg
	.align	3
.LC244:
	.xword	.LANCHOR0
	.align	3
.LC245:
	.xword	.LANCHOR2
	.align	3
.LC246:
	.xword	.LC40
	.align	3
.LC248:
	.xword	.LC247
	.align	3
.LC250:
	.xword	.LC249
	.align	3
.LC251:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC253:
	.xword	.LC252
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_ReadSegStream
	.type	SM_ReadSegStream, %function
SM_ReadSegStream:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	cmp	w21, 3
	bhi	.L706
	cbz	x22, .L707
	ldr	x1, .LC256
	sbfiz	x0, x21, 4, 32
	ldr	x19, [x1, x0]
	cbz	x19, .L708
	ldr	w0, [x19, 20]
	add	x1, x19, 36
	bl	SCDDRV_IsSCDByPass
	uxtb	w0, w0
	cbz	w0, .L694
	mov	x1, x22
	mov	w0, w21
	bl	SM_CopyRawToSeg
	cbnz	w0, .L709
.L694:
	add	x0, x19, 49152
	mov	x1, x22
	add	x0, x0, 112
	add	x19, x19, 184320
	bl	SCDDRV_GetStreamSeg
	cbnz	w0, .L695
	ldr	x0, .LC259
	str	wzr, [x19, 308]
	ldr	x0, [x0, w21, sxtw 3]
	cbz	x0, .L696
	ldrsb	w0, [x22, 9]
	mov	w20, 0
	cmp	w0, 2
	beq	.L691
	mov	x1, x22
	mov	w0, w21
	bl	SCDDRV_SaveStreamSeg.part.2
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L695:
	mov	w20, w0
	ldr	w0, [x19, 308]
	add	w0, w0, 1
	str	w0, [x19, 308]
.L691:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L709:
	ldr	x2, .LC258
	add	x19, x19, 184320
	mov	w1, 2292
	mov	w0, 21
	mov	w20, -7
	bl	dprint_normal
	ldr	w0, [x19, 308]
	add	w0, w0, 1
	str	w0, [x19, 308]
	b	.L691
	.p2align 3
.L696:
	mov	w20, 0
	b	.L691
	.p2align 3
.L706:
	ldr	x3, .LC254
	mov	w4, 2279
.L705:
	ldr	x2, .LC255
	mov	w1, w4
	add	x3, x3, 952
	mov	w0, 32
	mov	w20, -1
	bl	dprint_normal
	b	.L691
.L708:
	ldr	x3, .LC254
	mov	w4, 2283
	b	.L705
.L707:
	ldr	x3, .LC254
	mov	w4, 2280
	b	.L705
	.size	SM_ReadSegStream, .-SM_ReadSegStream
	.align	3
.LC254:
	.xword	.LANCHOR2
	.align	3
.LC255:
	.xword	.LC40
	.align	3
.LC256:
	.xword	.LANCHOR0
	.align	3
.LC258:
	.xword	.LC257
	.align	3
.LC259:
	.xword	g_SaveSegFileHandler
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_ReleaseStreamSeg
	.type	SM_ReleaseStreamSeg, %function
SM_ReleaseStreamSeg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 3
	bhi	.L715
	ldr	x0, .LC262
	sbfiz	x19, x19, 4, 32
	ldr	x0, [x0, x19]
	cbz	x0, .L716
	add	x0, x0, 49152
	mov	w1, w20
	add	x0, x0, 112
	bl	ReleaseStreamSeg
.L712:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L715:
	ldr	x3, .LC260
	mov	w4, 2319
.L714:
	ldr	x2, .LC261
	mov	w1, w4
	add	x3, x3, 976
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L712
.L716:
	ldr	x3, .LC260
	mov	w4, 2322
	b	.L714
	.size	SM_ReleaseStreamSeg, .-SM_ReleaseStreamSeg
	.align	3
.LC260:
	.xword	.LANCHOR2
	.align	3
.LC261:
	.xword	.LC40
	.align	3
.LC262:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_GiveThreadEvent
	.type	SM_GiveThreadEvent, %function
SM_GiveThreadEvent:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC263
	mov	w0, 0
	ldr	x1, [x1, 256]
	blr	x1
	ldp	x29, x30, [sp], 16
	ret
	.size	SM_GiveThreadEvent, .-SM_GiveThreadEvent
	.align	3
.LC263:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CalcInstBlockTime
	.type	CalcInstBlockTime, %function
CalcInstBlockTime:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	x0, .LC264
	ldr	x0, [x0]
	blr	x0
	mov	w3, w0
	add	x1, x19, 184320
	cbnz	w20, .L722
	ldr	w2, [x1, 272]
	cmp	w0, w2
	bhi	.L723
	str	wzr, [x1, 268]
	mov	w0, 0
	str	w3, [x1, 272]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L723:
	sub	w0, w0, w2
	str	w0, [x1, 268]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L722:
	str	wzr, [x1, 268]
	mov	w0, 0
	str	w3, [x1, 272]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CalcInstBlockTime, .-CalcInstBlockTime
	.align	3
.LC264:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_IsChanDec
	.type	SCDDRV_IsChanDec, %function
SCDDRV_IsChanDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC265
	add	x0, x0, 64
	ldr	w1, [x0, 56]
	cmp	w1, 1
	beq	.L727
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L727:
	ldr	w0, [x0, 52]
	cmp	w0, w19
	ldr	x19, [sp, 16]
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_IsChanDec, .-SCDDRV_IsChanDec
	.align	3
.LC265:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_GetRawStreamStatus
	.type	SCDDRV_GetRawStreamStatus, %function
SCDDRV_GetRawStreamStatus:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x2
	mov	x21, x1
	bl	_mcount
	mov	x1, x21
	mov	x0, x19
	bl	GetRawStreamSize
	mov	x1, x20
	mov	x0, x19
	bl	GetRawStreamNum
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	SCDDRV_GetRawStreamStatus, .-SCDDRV_GetRawStreamStatus
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetFreeSegBufSize
	.type	GetFreeSegBufSize, %function
GetFreeSegBufSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L737
	add	x0, x19, 135168
	str	wzr, [x20]
	ldp	w2, w3, [x0, 32]
	cmp	w3, w2
	sub	w2, w2, #1
	bls	.L732
	ldr	w0, [x0, 28]
	add	w2, w0, w2
	sub	w2, w2, w3
.L733:
	cmp	w2, w0
	bgt	.L738
.L735:
	str	w2, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L732:
	bcs	.L734
	ldr	w0, [x0, 28]
	sub	w2, w2, w3
	cmp	w2, w0
	ble	.L735
.L738:
	ldr	x3, .LC267
	mov	w4, 2395
	b	.L736
	.p2align 3
.L737:
	ldr	x3, .LC267
	mov	w4, 2378
.L736:
	ldr	x2, .LC268
	mov	w1, w4
	add	x3, x3, 1000
	mov	w0, 32
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L734:
	ldr	w0, [x0, 28]
	sub	w2, w0, #1
	b	.L733
	.size	GetFreeSegBufSize, .-GetFreeSegBufSize
	.align	3
.LC267:
	.xword	.LANCHOR2
	.align	3
.LC268:
	.xword	.LC80
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_GetSegStreamStatus
	.type	SCDDRV_GetSegStreamStatus, %function
SCDDRV_GetSegStreamStatus:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x4
	mov	x21, x0
	mov	x0, x30
	mov	x20, x2
	mov	w19, w1
	mov	x23, x3
	bl	_mcount
	str	wzr, [x22]
	mov	x1, x20
	mov	x0, x21
	bl	GetFreeSegBufSize
	ldr	w0, [x20]
	add	w1, w19, 79
	mov	w2, 0
	cmp	w0, w1
	bcc	.L740
	sub	w0, w0, w19
	sub	w2, w0, #79
.L740:
	add	x4, x21, 135168
	str	w2, [x20]
	ldr	w1, [x4, 28]
	lsl	w0, w1, 3
	sub	w0, w0, w1
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w0, w1, w0, lt
	cmp	w19, w0, asr 3
	bcc	.L741
	add	w19, w2, w19
	str	w19, [x20]
	mov	w0, 1
	str	w0, [x22]
.L741:
	cbz	x21, .L744
	ldp	w1, w2, [x4, 8]
	mov	w4, 1536
	mov	w0, 43691
	add	w2, w2, w4
	movk	w0, 0xaaaa, lsl 16
	sub	w1, w2, w1
	umull	x0, w1, w0
	lsr	x0, x0, 32
	lsr	w0, w0, 10
	lsl	w2, w0, 2
	sub	w0, w2, w0
	sub	w1, w1, w0, lsl 9
	sub	w1, w4, w1
	str	w1, [x23]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L744:
	mov	w1, 1536
	str	w1, [x23]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	SCDDRV_GetSegStreamStatus, .-SCDDRV_GetSegStreamStatus
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_IsRawStreamNotEnough
	.type	SCDDRV_IsRawStreamNotEnough, %function
SCDDRV_IsRawStreamNotEnough:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, wzr
	ccmp	w19, 3, 0, ne
	cset	w0, ls
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_IsRawStreamNotEnough, .-SCDDRV_IsRawStreamNotEnough
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_IsFreeSegSlotNotEnough
	.type	SCDDRV_IsFreeSegSlotNotEnough, %function
SCDDRV_IsFreeSegSlotNotEnough:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 384
	ldr	x19, [sp, 16]
	cset	w0, ls
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_IsFreeSegSlotNotEnough, .-SCDDRV_IsFreeSegSlotNotEnough
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_IsFreeSegBufNotEnough
	.type	SCDDRV_IsFreeSegBufNotEnough, %function
SCDDRV_IsFreeSegBufNotEnough:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, w20, lsr 3
	cset	w0, ls
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SCDDRV_IsFreeSegBufNotEnough, .-SCDDRV_IsFreeSegBufNotEnough
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_CheckConditionOfStartSCD
	.type	SCDDRV_CheckConditionOfStartSCD, %function
SCDDRV_CheckConditionOfStartSCD:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	add	x20, x29, 96
	mov	x21, x3
	mov	w25, w2
	mov	x24, x4
	mov	x23, x5
	mov	x26, x6
	mov	x19, x1
	bl	_mcount
	mov	x1, x21
	mov	x0, x22
	str	wzr, [x20, -4]!
	bl	GetRawStreamSize
	mov	x1, x20
	mov	x0, x22
	bl	GetRawStreamNum
	ldr	w1, [x21]
	ldr	w0, [x29, 92]
	cmp	w1, 3
	ccmp	w0, wzr, 4, hi
	beq	.L750
	mov	x0, x19
	mov	x4, x26
	mov	x3, x23
	mov	x2, x24
	mov	w1, w25
	bl	SCDDRV_GetSegStreamStatus
	ldr	w0, [x23]
	cmp	w0, 384
	bls	.L751
	add	x19, x19, 135168
	ldr	w1, [x24]
	mov	w0, -6
	ldr	w2, [x19, 28]
	cmp	w1, w2, lsr 3
	csel	w0, w0, wzr, ls
.L749:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L750:
	mov	w0, -5
	b	.L749
	.p2align 3
.L751:
	mov	w0, -6
	b	.L749
	.size	SCDDRV_CheckConditionOfStartSCD, .-SCDDRV_CheckConditionOfStartSCD
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_SetCtrlReg
	.type	SCDDRV_SetCtrlReg, %function
SCDDRV_SetCtrlReg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	w2, [x20, 20]
	cmp	w2, 18
	beq	.L763
	cmp	w2, 6
	cset	w5, eq
	cmp	w2, 1
	cset	w4, eq
	cmp	w2, 15
	cset	w0, eq
	mov	w6, w5
	orr	w4, w4, w0
.L754:
	add	x1, x20, 184320
	mov	w0, 1
	strb	w0, [x19, 2]
	mov	x0, 53360
	movk	x0, 0x2, lsl 16
	ldr	w3, [x1, 204]
	add	x0, x20, x0
	str	w3, [x19, 4]
	ldr	x3, [x1, 192]
	str	x3, [x19, 8]
	ldr	w3, [x1, 216]
	str	w3, [x19, 24]
	ldr	w7, [x1, 224]
	ldr	w3, [x1, 316]
	mul	w3, w3, w7
	str	w3, [x19, 28]
	ldr	w3, [x0, 24]
	str	w3, [x19, 32]
	ldp	w7, w3, [x0, 24]
	add	w3, w7, w3
	str	w3, [x19, 36]
	ldr	w3, [x1, 616]
	cmp	w3, 1
	beq	.L766
	ldr	w0, [x1, 612]
	str	w0, [x19, 40]
.L756:
	mov	w0, 1
	str	wzr, [x19, 52]
	strb	w0, [x19]
	str	w6, [x19, 68]
	cbnz	w4, .L764
	cmp	w2, 3
	cset	w0, eq
	orr	w5, w5, w0
	cbz	w5, .L767
.L758:
	mov	w0, 1
	cmp	w2, 4
	strb	w0, [x19, 1]
	beq	.L768
.L760:
	cmp	w2, 14
	beq	.L762
	str	w2, [x19, 44]
	mov	w0, 1
	stp	wzr, wzr, [x19, 56]
	str	w0, [x19, 48]
	ldr	w0, [x1, 592]
	str	w0, [x19, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L764:
	mov	w2, 0
	strb	wzr, [x19, 1]
.L769:
	cmp	w2, 4
	bne	.L760
.L768:
	mov	w0, 2
	str	w0, [x19, 44]
	stp	wzr, wzr, [x19, 56]
	mov	w0, 1
	str	w0, [x19, 48]
	ldr	w0, [x1, 592]
	str	w0, [x19, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L762:
	mov	w0, 4
	str	w0, [x19, 44]
	stp	wzr, wzr, [x19, 56]
	mov	w0, 1
	str	w0, [x19, 48]
	ldr	w0, [x1, 592]
	str	w0, [x19, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L763:
	mov	w5, 1
	mov	w4, 0
	mov	w6, w5
	mov	w2, 6
	b	.L754
	.p2align 3
.L766:
	ldr	w0, [x0, 36]
	add	w0, w0, 3
	and	w0, w0, -4
	str	w0, [x19, 40]
	b	.L756
.L767:
	sub	w0, w2, #2
	tst	w0, -3
	beq	.L758
	strb	wzr, [x19, 1]
	b	.L769
	.size	SCDDRV_SetCtrlReg, .-SCDDRV_SetCtrlReg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_RecordStartState
	.type	SCDDRV_RecordStartState, %function
SCDDRV_RecordStartState:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 184320
	mov	w22, w1
	mov	w21, w2
	bl	_mcount
	cmp	w22, w21
	str	w22, [x19, 288]
	str	w21, [x19, 292]
	bls	.L773
	strb	wzr, [x20, 2]
.L772:
	mov	w1, 1
	ldr	x0, .LC269
	str	w1, [x19, 248]
	strb	wzr, [x20, 3]
	ldr	x0, [x0]
	blr	x0
	str	w0, [x19, 312]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L773:
	mov	w0, 1
	strb	w0, [x20, 2]
	b	.L772
	.size	SCDDRV_RecordStartState, .-SCDDRV_RecordStartState
	.align	3
.LC269:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCD_ConfigReg
	.type	SCD_ConfigReg, %function
SCD_ConfigReg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w21, w0
	mov	x0, x30
	mov	w20, w2
	mov	w22, w1
	bl	_mcount
	ldr	x23, .LC270
	cmp	w21, 4
	sxtw	x19, w20
	beq	.L779
.L775:
	add	x19, x23, x19, lsl 2
	mov	w1, w22
	ldr	w0, [x19, 136]
	add	w0, w21, w0
	bl	MEM_WritePhyWord
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L779:
	add	x0, x23, x19, lsl 2
	ldr	w0, [x0, 136]
	add	w0, w0, 4
	cbz	w22, .L780
	bl	MEM_ReadPhyWord
	mov	w22, w0
	b	.L775
	.p2align 3
.L780:
	bl	MEM_ReadPhyWord
	and	w22, w0, -196609
	b	.L775
	.size	SCD_ConfigReg, .-SCD_ConfigReg
	.align	3
.LC270:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	WriteScdVtrlReg
	.type	WriteScdVtrlReg, %function
WriteScdVtrlReg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	sxtw	x22, w0
	mov	x0, x30
	sxtw	x20, w2
	mov	x19, x1
	bl	_mcount
	mov	w0, w20
	bl	ResetSCD
	ldr	x23, .LC271
	ldr	w1, [x19, 4]
	add	x21, x23, x20, lsl 2
	ldr	w0, [x21, 136]
	add	w0, w0, 2052
	bl	MEM_WritePhyWord
	ldr	w0, [x21, 136]
	ldr	w1, [x19, 24]
	add	w0, w0, 2056
	bl	MEM_WritePhyWord
	ldr	w0, [x21, 136]
	ldr	w1, [x19, 28]
	add	w0, w0, 2060
	bl	MEM_WritePhyWord
	ldr	w0, [x21, 136]
	ldr	w1, [x19, 32]
	add	w0, w0, 2064
	bl	MEM_WritePhyWord
	ldr	w0, [x21, 136]
	ldr	w1, [x19, 36]
	add	w0, w0, 2068
	bl	MEM_WritePhyWord
	ldr	w0, [x21, 136]
	ldr	w1, [x19, 40]
	add	w0, w0, 2072
	bl	MEM_WritePhyWord
	lsl	x0, x22, 4
	ldr	x0, [x23, x0]
	add	x0, x0, 184320
	ldr	w1, [x0, 616]
	cmp	w1, 1
	beq	.L785
	mov	w2, 3
	ldr	w1, [x0, 600]
	movk	w2, 0x300, lsl 16
	cmp	w1, w2
	beq	.L786
.L784:
	add	x21, x23, x20, lsl 2
	lsl	x22, x22, 4
	ldr	w0, [x21, 136]
	add	w0, w0, 2108
	bl	MEM_WritePhyWord
	ldr	x1, [x23, x22]
	ldr	w0, [x21, 136]
	add	x1, x1, 184320
	add	w0, w0, 2116
	ldrh	w1, [x1, 596]
	bl	MEM_WritePhyWord
.L783:
	add	x20, x23, x20, lsl 2
	ldr	w0, [x19, 60]
	ldp	w1, w3, [x19, 52]
	ldr	w2, [x19, 44]
	ldrb	w4, [x19, 1]
	lsl	w1, w1, 8
	and	w2, w2, 15
	orr	w5, w1, w0, lsl 9
	orr	w2, w2, w3, lsl 13
	ldr	w0, [x20, 136]
	ubfiz	w3, w4, 4, 1
	orr	w1, w5, w2
	orr	w1, w1, w3
	add	w0, w0, 2080
	bl	MEM_WritePhyWord
	ldr	w0, [x20, 136]
	mov	w1, 0
	add	w0, w0, 2076
	bl	MEM_WritePhyWord
	ldrsb	w19, [x19, 2]
	ldr	w0, [x20, 136]
	mov	w1, 0
	add	w0, w0, 2048
	bl	MEM_WritePhyWord
	ldr	w0, [x20, 136]
	and	w1, w19, 1
	add	w0, w0, 2048
	bl	MEM_WritePhyWord
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L786:
	ldrh	w0, [x0, 596]
	cbnz	w0, .L784
	ldr	w0, [x21, 136]
	mov	w1, 3
	add	w0, w0, 2108
	bl	MEM_WritePhyWord
	ldr	w0, [x21, 136]
	mov	w1, 0
	add	w0, w0, 2116
	bl	MEM_WritePhyWord
	b	.L783
	.p2align 3
.L785:
	ldr	w0, [x21, 136]
	mov	w1, -1
	add	w0, w0, 2108
	bl	MEM_WritePhyWord
	ldr	w0, [x21, 136]
	mov	w1, -1
	add	w0, w0, 2116
	bl	MEM_WritePhyWord
	b	.L783
	.size	WriteScdVtrlReg, .-WriteScdVtrlReg
	.align	3
.LC271:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	WriteScdMsg
	.type	WriteScdMsg, %function
WriteScdMsg:
	stp	x29, x30, [sp, -240]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w26, w0
	mov	x21, x3
	mov	x0, x30
	mov	x24, x4
	sxtw	x3, w26
	mov	x27, x1
	mov	x19, x3
	mov	w22, w2
	stp	w5, w2, [x29, 128]
	stp	x3, x21, [x29, 112]
	bl	_mcount
	ldr	x1, .LC274
	lsl	x0, x19, 4
	ldr	x10, .LC275
	mov	x2, 8192
	stp	xzr, xzr, [x29, 144]
	ldr	x0, [x1, x0]
	mov	w1, 0
	ldr	x3, [x10, 96]
	add	x0, x0, 184320
	str	x0, [x29, 104]
	add	x20, x0, 728
	add	x19, x0, 608
	stp	xzr, xzr, [x29, 160]
	stp	xzr, xzr, [x29, 176]
	stp	xzr, xzr, [x29, 192]
	stp	xzr, xzr, [x29, 208]
	stp	xzr, xzr, [x29, 224]
	add	x28, x0, 604
	mov	x0, x20
	str	x10, [x29, 136]
	blr	x3
	add	x1, x29, 144
	mov	x0, x21
	bl	GetFirstRawPacket
	ldr	w26, [x29, 152]
	stp	wzr, wzr, [x24]
	str	wzr, [x24, 8]
	cmp	w26, w22
	str	wzr, [x27, 4]
	bgt	.L788
	ldr	x10, [x29, 136]
	mov	w23, 0
	mov	w22, 0
	mov	w25, 0
	mov	w2, w26
	add	x21, x21, 49152
	.p2align 2
.L793:
	cmp	w2, wzr
	ubfiz	x1, x23, 4, 32
	add	x11, x24, x22, sxtw 2
	add	x12, x20, x1
	add	w25, w25, 1
	ble	.L789
	ldr	w0, [x29, 148]
	add	w23, w23, 1
	str	w0, [x24, w22, sxtw 2]
	add	w22, w22, 3
	sub	w0, w0, #1
	ldr	x13, [x29, 184]
	add	w0, w0, w2
	ldr	w2, [x29, 128]
	add	w2, w2, w22, lsl 2
	stp	w0, w2, [x11, 4]
	str	x13, [x20, x1]
	ldr	x0, [x29, 184]
	ldrsw	x1, [x29, 152]
	sub	x0, x0, #1
	add	x0, x0, x1
	str	x0, [x12, 8]
	str	wzr, [x29, 152]
.L789:
	str	w26, [x27, 4]
	ldr	w11, [x21, 16]
	cmp	w11, 511
	bhi	.L843
	sxtw	x12, w11
	ldr	x3, [x29, 120]
	lsl	x1, x12, 2
	mov	x2, 96
	sub	x1, x1, x12
	ldr	w12, [x21, 4]
	add	x0, x29, 144
	cmp	w11, w12
	add	x1, x3, x1, lsl 5
	beq	.L843
	ldr	x11, [x10, 104]
	str	x10, [x29, 136]
	blr	x11
	ldr	w0, [x21, 16]
	ldr	w2, [x29, 152]
	add	w0, w0, 1
	ldr	w3, [x29, 132]
	asr	w1, w0, 31
	add	w26, w26, w2
	lsr	w1, w1, 23
	cmp	w3, w26
	add	w0, w0, w1
	mov	w3, 511
	and	w0, w0, w3
	ccmp	w25, w3, 0, ge
	sub	w0, w0, w1
	str	w0, [x21, 16]
	ldr	x10, [x29, 136]
	ble	.L793
	cbnz	w2, .L845
	.p2align 2
.L794:
	cbz	w25, .L812
	cmp	w22, wzr
	ble	.L797
	add	x3, x24, x22, sxtw 2
	str	wzr, [x3, -4]
.L797:
	ldr	x0, [x29, 112]
	mov	w2, 6
	ldr	w4, [x27, 4]
	lsl	x26, x0, 4
	ldr	x0, .LC274
	cmp	w4, w2
	csel	w4, w4, w2, le
	ldr	x0, [x0, x26]
	cmp	w4, 5
	add	x0, x0, 184320
	ldr	w1, [x0, 608]
	str	w1, [x0, 600]
	ldrh	w1, [x0, 604]
	strh	w1, [x0, 596]
	bls	.L846
.L814:
	mov	w9, 2
	mov	w8, 4
.L798:
	cmp	w23, wzr
	mov	w7, w23
	mov	x10, -16
	ble	.L807
	.p2align 2
.L829:
	add	x0, x10, x7, sxtw 4
	add	x1, x20, x0
	ldr	x3, [x20, x0]
	ldr	x2, [x1, 8]
	add	w0, w2, 1
	sub	w3, w0, w3
	cmp	w3, w8
	csel	w4, w3, w8, ls
	cbz	w8, .L803
	cbz	w4, .L806
	mov	x0, 0
	.p2align 2
.L805:
	neg	x1, x0
	ldrb	w1, [x1, x2]
	strb	w1, [x19, x0]
	add	x0, x0, 1
	cmp	w4, w0
	bhi	.L805
	sub	w0, w4, #1
	subs	w8, w8, w4
	add	x0, x0, 1
	add	x19, x19, x0
	beq	.L803
.L806:
	subs	w7, w7, #1
	bne	.L829
	.p2align 2
.L807:
	mov	w0, 1
	str	w25, [x27]
	str	w0, [x27, 8]
	mov	w0, 0
.L842:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 240
	ret
	.p2align 3
.L843:
	ldr	w2, [x29, 152]
	cbz	w2, .L794
	b	.L845
	.p2align 3
.L803:
	cbz	w9, .L807
	sub	w1, w3, w4
	sub	x2, x2, x4, uxtw
	cmp	w1, w9
	csel	w1, w1, w9, ls
	cbz	w1, .L844
	mov	x0, 0
	.p2align 2
.L809:
	neg	x3, x0
	ldrb	w3, [x3, x2]
	strb	w3, [x28, x0]
	add	x0, x0, 1
	cmp	w1, w0
	bhi	.L809
	sub	w0, w1, #1
	subs	w9, w9, w1
	add	x0, x0, 1
	add	x28, x28, x0
	beq	.L807
.L844:
	mov	w8, 0
	b	.L806
.L846:
	cmp	w4, 1
	beq	.L847
	mov	x0, 3
	sub	w8, w4, #2
	sub	x8, x0, x8
	subs	w2, w2, w4
	ldr	x0, [x29, 104]
	add	x11, x0, 605
	beq	.L814
	mov	w0, 0
	mov	w10, 2
	.p2align 2
.L800:
	uxtw	x1, w0
	sub	w2, w2, #1
	sub	x3, x8, x1
	sub	x1, x11, x1
	add	w0, w0, 1
	cmp	w2, wzr
	ccmp	w0, 1, 2, ne
	sub	w9, w10, w0
	ldrb	w3, [x19, x3]
	strb	w3, [x1]
	bls	.L800
	mov	w8, 4
	cbnz	w9, .L798
	ldr	x0, [x29, 104]
	add	x24, x0, 611
	mov	x0, 3
	sub	x4, x0, x4, uxtw
	cbz	w2, .L798
	mov	w1, 0
	.p2align 2
.L801:
	uxtw	x0, w1
	add	w1, w1, 1
	sub	x3, x4, x0
	sub	x0, x24, x0
	cmp	w2, w1
	ldrb	w3, [x19, x3]
	strb	w3, [x0]
	bne	.L801
	mov	w8, 4
	sub	w8, w8, w2
	b	.L798
	.p2align 3
.L845:
	ldr	w0, [x27, 4]
.L811:
	ldr	w3, [x29, 132]
	sub	w1, w3, #16
	cmp	w1, w0
	ble	.L794
	cmp	w3, w26
	mov	w1, 511
	ccmp	w25, w1, 0, lt
	bgt	.L794
	sub	w0, w3, w0
	cmp	w0, w2
	bgt	.L794
	ldr	w1, [x29, 148]
	add	w25, w25, 1
	str	w1, [x24, w22, sxtw 2]
	sub	w1, w1, #1
	str	w0, [x29, 152]
	add	w0, w1, w0
	add	x1, x24, x22, sxtw 2
	add	w22, w22, 3
	str	w0, [x1, 4]
	ldr	w0, [x29, 128]
	add	w0, w0, w22, lsl 2
	str	w0, [x1, 8]
	ubfiz	x0, x23, 4, 32
	ldr	x1, [x29, 184]
	add	w23, w23, 1
	str	x1, [x20, x0]
	add	x0, x20, x0
	ldr	x1, [x29, 184]
	sub	x2, x1, #1
	ldrsw	x1, [x29, 152]
	add	x1, x2, x1
	str	x1, [x0, 8]
	ldr	w1, [x27, 4]
	ldr	w0, [x29, 152]
	add	w0, w1, w0
	str	w0, [x27, 4]
	b	.L794
.L847:
	ldr	x2, [x29, 104]
	mov	w9, 0
	mov	w8, w4
	ldrb	w0, [x2, 611]
	ldrb	w1, [x2, 604]
	strb	w0, [x2, 604]
	ldrb	w0, [x2, 609]
	strb	w1, [x2, 605]
	ldrb	w1, [x2, 610]
	strb	w0, [x2, 610]
	ldrb	w0, [x2, 608]
	strb	w1, [x2, 611]
	strb	w0, [x2, 609]
	b	.L798
.L788:
	cbz	w26, .L812
	mov	w2, w26
	mov	w0, 0
	mov	w23, 0
	mov	w22, 0
	mov	w25, 0
	b	.L811
.L812:
	mov	w0, -6
	b	.L842
	.size	WriteScdMsg, .-WriteScdMsg
	.align	3
.LC274:
	.xword	.LANCHOR0
	.align	3
.LC275:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_StartSCD
	.type	SCDDRV_StartSCD, %function
SCDDRV_StartSCD:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	add	x19, x1, 184320
	mov	x24, x0
	mov	x0, x30
	mov	x20, x1
	mov	w25, w2
	mov	w23, w3
	bl	_mcount
	add	x21, x19, 168
	ldr	w0, [x19, 240]
	add	x20, x20, 88
	ldr	w27, [x19, 204]
	ldr	x26, [x19, 192]
	bl	VCTRL_IfEsBufEnable
	cbz	w0, .L852
	ldr	x22, .LC278
	mov	x2, 12
	mov	w1, 0
	mov	x0, x21
	ldr	x3, [x22, 96]
	blr	x3
	ldr	w0, [x19, 240]
	mov	x3, x20
	mov	w5, w27
	mov	x4, x26
	mov	w2, w25
	mov	x1, x21
	bl	WriteScdMsg
	mov	w20, w0
	cbnz	w0, .L850
	ldr	x0, [x22]
	blr	x0
	sxtw	x3, w23
	ldr	x4, .LC279
	lsl	x1, x3, 4
	mov	w2, w23
	sub	x3, x1, x3
	mov	x1, x24
	add	x3, x4, x3, lsl 2
	str	w0, [x3, 48]
	ldr	w0, [x19, 240]
	bl	WriteScdVtrlReg
.L850:
	mov	w0, w20
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L852:
	ldr	x2, .LC277
	mov	w1, 2898
	ldr	w3, [x19, 240]
	mov	w0, 1
	mov	w20, -7
	bl	dprint_normal
	b	.L850
	.size	SCDDRV_StartSCD, .-SCDDRV_StartSCD
	.align	3
.LC277:
	.xword	.LC276
	.align	3
.LC278:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC279:
	.xword	g_VfmwGlobalStat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CutStreamWithSCD
	.type	CutStreamWithSCD, %function
CutStreamWithSCD:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w22, w1
	add	x21, x20, 184320
	bl	_mcount
	str	wzr, [x29, 64]
	add	x6, x29, 144
	add	x1, x20, 49152
	ldr	w2, [x21, 624]
	add	x5, x29, 60
	add	x4, x29, 64
	add	x3, x29, 56
	str	wzr, [x6, -76]!
	add	x1, x1, 112
	add	x0, x20, 88
	stp	wzr, wzr, [x29, 56]
	bl	SCDDRV_CheckConditionOfStartSCD
	mov	w19, w0
	cbnz	w0, .L864
	ldr	w0, [x29, 68]
	cbnz	w0, .L865
.L856:
	ldr	w0, [x21, 240]
	mov	w1, w22
	bl	SM_CfgBuf
	mov	w19, w0
	cbnz	w0, .L866
	ldr	w3, [x21, 316]
	mov	x0, x20
	ldr	w2, [x29, 60]
	add	x1, x29, 72
	str	w2, [x21, 224]
	mul	w2, w2, w3
	lsl	w2, w2, 2
	str	w2, [x21, 220]
	bl	SCDDRV_SetCtrlReg
	ldr	w2, [x29, 64]
	mov	w3, w22
	mov	x1, x20
	add	x0, x29, 72
	bl	SCDDRV_StartSCD
	mov	w3, w0
	cbnz	w0, .L855
	ldr	w1, [x29, 56]
	ldr	w0, [x29, 64]
	str	w1, [x21, 288]
	cmp	w1, w0
	str	w0, [x21, 292]
	bls	.L867
	strb	wzr, [x20, 2]
.L859:
	mov	w1, 1
	ldr	x0, .LC284
	str	w1, [x21, 248]
	strb	wzr, [x20, 3]
	ldr	x0, [x0]
	blr	x0
	str	w0, [x21, 312]
	mov	w3, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, w3
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L866:
	ldr	x2, .LC283
	mov	w3, w0
	mov	w1, 2945
	mov	w0, 21
	bl	dprint_normal
	mov	w3, w19
.L855:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, w3
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L865:
	mov	x0, x20
	bl	ResetLastUnfinishedSegInfo
	b	.L856
	.p2align 3
.L864:
	ldr	x2, .LC281
	mov	w3, w0
	mov	w1, 2931
	mov	w0, 21
	bl	dprint_normal
	mov	w3, w19
	ldp	x21, x22, [sp, 32]
	ldp	x19, x20, [sp, 16]
	mov	w0, w3
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L867:
	mov	w0, 1
	strb	w0, [x20, 2]
	b	.L859
	.size	CutStreamWithSCD, .-CutStreamWithSCD
	.align	3
.LC281:
	.xword	.LC280
	.align	3
.LC283:
	.xword	.LC282
	.align	3
.LC284:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReadScdStateReg
	.type	ReadScdStateReg, %function
ReadScdStateReg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x1, .LC285
	add	x19, x1, x19, sxtw 2
	ldr	w0, [x19, 136]
	add	w0, w0, 2112
	bl	MEM_ReadPhyWord
	and	w0, w0, 1
	str	w0, [x20]
	ldr	w0, [x19, 136]
	add	w0, w0, 2124
	bl	MEM_ReadPhyWord
	lsr	w0, w0, 22
	ldr	w1, [x19, 136]
	str	w0, [x20, 8]
	add	w0, w1, 2124
	bl	MEM_ReadPhyWord
	and	w0, w0, 4194303
	ldr	w1, [x19, 136]
	str	w0, [x20, 12]
	add	w0, w1, 2128
	bl	MEM_ReadPhyWord
	str	w0, [x20, 16]
	ldr	w1, [x19, 136]
	add	w0, w1, 2132
	bl	MEM_ReadPhyWord
	str	w0, [x20, 20]
	ldr	w1, [x19, 136]
	add	w0, w1, 2060
	bl	MEM_ReadPhyWord
	str	w0, [x20, 24]
	ldr	w1, [x19, 136]
	add	w0, w1, 2140
	bl	MEM_ReadPhyWord
	str	w0, [x20, 28]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ReadScdStateReg, .-ReadScdStateReg
	.align	3
.LC285:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ParseMpeg4UniqueUpMsg
	.type	ParseMpeg4UniqueUpMsg, %function
ParseMpeg4UniqueUpMsg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	x19, x1
	mov	x20, x2
	bl	_mcount
	cmp	w21, 1
	ldrb	w0, [x19]
	beq	.L872
	orr	w0, w0, 1
	strb	w0, [x19]
.L871:
	ldr	w1, [x20, 4]
	ldrb	w0, [x19]
	lsr	w1, w1, 30
	bfi	w0, w1, 1, 1
	strb	w0, [x19]
	ldrh	w1, [x20, 10]
	bfi	w0, w1, 2, 1
	strb	w0, [x19]
	ldr	w1, [x20, 8]
	ubfx	x1, x1, 4, 3
	bfi	w0, w1, 3, 4
	strb	w0, [x19]
	ldr	w0, [x20, 8]
	ldrh	w1, [x19]
	and	w0, w0, 7
	bfi	w1, w0, 7, 4
	strh	w1, [x19]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L872:
	and	w0, w0, -2
	strb	w0, [x19]
	b	.L871
	.size	ParseMpeg4UniqueUpMsg, .-ParseMpeg4UniqueUpMsg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ConvertByteOrder
	.type	ConvertByteOrder, %function
ConvertByteOrder:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	ldr	x19, [sp, 16]
	rev	w0, w0
	ldp	x29, x30, [sp], 32
	ret
	.size	ConvertByteOrder, .-ConvertByteOrder
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckSegValid
	.type	CheckSegValid, %function
CheckSegValid:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	mov	w21, w2
	bl	_mcount
	cbz	x20, .L885
	ldr	w0, [x20, 16]
	cbz	w0, .L886
	ldr	x0, [x20]
	cbz	x0, .L887
	cbz	x19, .L882
	add	x1, x19, 135168
	ldp	w5, w0, [x1, 32]
	cmp	w0, w5
	sub	w5, w5, #1
	bhi	.L888
	sub	w5, w5, w0
	bcc	.L879
	ldr	w5, [x1, 28]
	sub	w5, w5, #1
.L879:
	ldr	w4, [x20, 20]
	mov	w0, 0
	cmp	w4, w5
	bhi	.L889
.L876:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L888:
	ldr	w1, [x1, 28]
	add	w5, w5, w1
	sub	w5, w5, w0
	b	.L879
	.p2align 3
.L882:
	mov	w5, 0
	b	.L879
	.p2align 3
.L886:
	ldr	x3, .LC286
	mov	w4, 3011
.L884:
	ldr	x2, .LC287
	mov	w1, w4
	add	x3, x3, 1024
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -7
	b	.L876
	.p2align 3
.L889:
	ldr	x2, .LC289
	mov	w3, w21
	mov	w1, 3018
	bl	dprint_normal
	mov	w0, -7
	b	.L876
.L885:
	ldr	x3, .LC286
	mov	w4, 3010
	ldr	x2, .LC287
	mov	w1, w4
	add	x3, x3, 1024
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L876
.L887:
	ldr	x3, .LC286
	mov	w4, 3012
	b	.L884
	.size	CheckSegValid, .-CheckSegValid
	.align	3
.LC286:
	.xword	.LANCHOR2
	.align	3
.LC287:
	.xword	.LC40
	.align	3
.LC289:
	.xword	.LC288
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetSegPts
	.type	GetSegPts, %function
GetSegPts:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x3
	mov	x21, x2
	mov	w23, w1
	mov	w22, w4
	bl	_mcount
	add	x4, x29, 80
	add	x2, x29, 68
	mov	w1, w23
	add	x3, x29, 72
	mov	x0, x20
	str	wzr, [x4, -4]!
	stp	wzr, wzr, [x29, 68]
	bl	GetRawNumOffset
	ldr	w1, [x29, 76]
	lsl	x0, x1, 2
	sub	x0, x0, x1
	add	x0, x20, x0, lsl 5
	ldr	x1, [x0, 64]
	str	x1, [x19, 32]
	ldr	x2, [x0, 48]
	str	x2, [x19, 48]
	ldr	x2, [x0, 64]
	str	x2, [x19, 40]
	ldr	x2, [x0, 56]
	str	x2, [x19, 56]
	ldr	w2, [x0, 20]
	str	w2, [x19, 64]
	ldr	w2, [x0, 24]
	str	w2, [x19, 68]
	ldr	w2, [x0, 28]
	str	w2, [x19, 72]
	ldr	w2, [x0, 32]
	str	w2, [x19, 76]
	ldrb	w0, [x0, 92]
	strb	w0, [x19, 12]
	ldr	x0, [x21]
	cmp	x1, x0
	beq	.L893
.L891:
	str	x1, [x21]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L893:
	ldr	x0, .LC290
	ldr	x0, [x0, w22, sxtw 3]
	ldr	w0, [x0, 120]
	cbnz	w0, .L891
	mov	x0, -1
	str	x0, [x19, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.size	GetSegPts, .-GetSegPts
	.align	3
.LC290:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsVopHeader
	.type	IsVopHeader, %function
IsVopHeader:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 1
	beq	.L899
	cmp	w19, 2
	mov	w0, 0
	beq	.L900
	mov	w1, -33488896
	cmp	w20, w1
	csinc	w0, w0, wzr, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L899:
	mov	w0, -1241448448
	mov	w1, -33488896
	cmp	w20, w0
	cset	w0, eq
	cmp	w20, w1
	csinc	w0, w0, wzr, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L900:
	ubfx	x0, x20, 16, 8
	mov	w1, -33488896
	sub	w0, w0, #128
	cmp	w0, 4
	cset	w0, ls
	cmp	w20, w1
	csinc	w0, w0, wzr, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	IsVopHeader, .-IsVopHeader
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetNextVop
	.type	GetNextVop, %function
GetNextVop:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w19, w2
	mov	x20, x1
	bl	_mcount
	add	x6, x21, 184320
	add	x0, x21, 49152
	adds	x5, x0, 112
	ldr	w2, [x6, 316]
	beq	.L910
	add	x5, x5, 135168
	mov	w3, 1536
	mov	w1, 43691
	movk	w1, 0xaaaa, lsl 16
	ldp	w10, w4, [x5, 8]
	add	w4, w4, w3
	sub	w4, w4, w10
	umull	x1, w4, w1
	lsr	x1, x1, 32
	lsr	w1, w1, 10
	lsl	w10, w1, 2
	sub	w10, w10, w1
	sub	w10, w4, w10, lsl 9
	sub	w10, w3, w10
.L902:
	sub	w3, w19, #1
	mov	w5, w3
	tbnz	w3, #31, .L911
	add	x1, x0, 112
	ldr	x7, [x0, 112]
	add	x0, x1, 135168
	mov	w8, -33488896
	mul	w4, w3, w2
	mov	w11, -1241448448
	ldr	w6, [x6, 260]
	ldr	w1, [x0, 24]
	b	.L909
	.p2align 3
.L904:
	cmp	w6, 2
	beq	.L913
	cmp	w0, w8
	beq	.L907
.L908:
	sub	w5, w5, #1
	mov	w19, w3
	cmn	w5, #1
	sub	w4, w4, w2
	beq	.L911
.L914:
	sub	w3, w3, #1
.L909:
	ldr	w0, [x20, w4, uxtw 2]
	cmp	w6, 1
	sub	w0, w0, w1
	ldr	w0, [x7, x0]
	bne	.L904
	cmp	w0, w11
	cset	w9, eq
.L905:
	cmp	w0, w8
	beq	.L907
	cbz	w9, .L908
	.p2align 2
.L907:
	cmp	w3, w10
	mov	w19, w3
	bls	.L911
	sub	w5, w5, #1
	sub	w3, w3, #1
	cmn	w5, #1
	mov	w19, w3
	sub	w4, w4, w2
	bne	.L914
.L911:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L913:
	ubfx	x9, x0, 16, 8
	sub	w9, w9, #128
	cmp	w9, 4
	cset	w9, ls
	b	.L905
.L910:
	mov	w10, 1536
	b	.L902
	.size	GetNextVop, .-GetNextVop
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CorrectRollPhyAddr
	.type	CorrectRollPhyAddr, %function
CorrectRollPhyAddr:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	w21, w2
	bl	_mcount
	cmp	w20, w21
	mov	w0, w19
	bcs	.L916
	sub	w0, w20, w21
	add	w0, w0, w19
.L916:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	CorrectRollPhyAddr, .-CorrectRollPhyAddr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CorrectSegNextAddr
	.type	CorrectSegNextAddr, %function
CorrectSegNextAddr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, w19
	csel	w0, w20, w19, cs
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CorrectSegNextAddr, .-CorrectSegNextAddr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SetLastUnfinishedSegInfo
	.type	SetLastUnfinishedSegInfo, %function
SetLastUnfinishedSegInfo:
	stp	x29, x30, [sp, -176]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	mov	w20, w1
	mov	x22, x2
	bl	_mcount
	add	x19, x21, 184320
	add	x0, x29, 88
	add	x1, x29, 120
	str	xzr, [x29, 168]
	add	x24, x19, 640
	ldr	x23, [x19, 208]
	mov	x3, x24
	stp	xzr, xzr, [x0]
	add	x0, x29, 104
	ldr	w4, [x19, 240]
	stp	xzr, xzr, [x1]
	add	x1, x29, 136
	add	x2, x19, 280
	stp	xzr, xzr, [x0]
	ldr	w0, [x19, 316]
	add	x25, x21, 49152
	stp	xzr, xzr, [x1]
	add	x1, x29, 152
	mul	w20, w0, w20
	mov	w0, 65531
	stp	xzr, xzr, [x1]
	add	w1, w20, 1
	movk	w0, 0x3fff, lsl 16
	ldr	w1, [x23, w1, uxtw 2]
	and	w1, w1, 1073741823
	cmp	w1, w0
	add	x0, x21, 88
	csel	w1, w1, wzr, ls
	bl	GetSegPts
	ldr	x0, .LC291
	mov	x2, 88
	mov	x1, x24
	ldr	x3, [x0, 104]
	add	x0, x29, x2
	blr	x3
	ldr	w5, [x23, w20, uxtw 2]
	add	x23, x25, 112
	add	x1, x23, 135168
	str	w5, [x19, 620]
	ldr	w0, [x22, 28]
	ldr	w4, [x1, 24]
	cmp	w0, w4
	csel	w0, w0, w4, cs
	str	w0, [x19, 612]
	cmp	w5, w0
	bls	.L921
	mov	w1, 1
	str	w1, [x19, 628]
	ldr	w2, [x22, 28]
	ldr	w1, [x22, 16]
	cmp	w4, w2
	bls	.L922
	add	w1, w1, w2
	sub	w1, w1, w4
.L922:
	sub	w20, w0, w4
	sub	w6, w1, w5
	str	w1, [x19, 632]
	add	w1, w6, w20
	str	w1, [x19, 624]
	ldr	w0, [x21, 52]
	cmp	w0, 1
	beq	.L934
.L924:
	str	wzr, [x19, 616]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L921:
	sub	w3, w0, w5
	str	wzr, [x19, 628]
	str	w3, [x19, 624]
	str	wzr, [x19, 632]
	ldr	w0, [x21, 52]
	cmp	w0, 1
	ccmp	w3, 3, 0, eq
	bls	.L924
	ldr	x6, [x25, 112]
	sub	w4, w5, w4
	ldr	w2, [x19, 240]
	mov	w7, 1
	add	x4, x6, x4
	add	x1, x29, 88
	mov	w6, 2
	mov	x0, x23
	strb	w7, [x29, 98]
	strb	w6, [x29, 97]
	str	x4, [x29, 88]
	stp	w5, w3, [x29, 104]
	bl	InsertStreamSeg
	b	.L924
	.p2align 3
.L934:
	cbz	x23, .L925
	add	x7, x25, 112
	mov	w8, 1536
	add	x7, x7, 135168
	mov	w0, 43691
	movk	w0, 0xaaaa, lsl 16
	ldp	w2, w3, [x7, 8]
	add	w3, w3, w8
	sub	w2, w3, w2
	umull	x0, w2, w0
	lsr	x0, x0, 32
	lsr	w0, w0, 10
	lsl	w3, w0, 2
	sub	w0, w3, w0
	sub	w2, w2, w0, lsl 9
	sub	w2, w8, w2
	cmp	w2, 3
	cset	w0, hi
.L925:
	cmp	w1, 3
	cset	w1, hi
	tst	w0, w1
	beq	.L924
	ldr	x0, [x25, 112]
	sub	w4, w5, w4
	ldr	w2, [x19, 240]
	add	x21, x25, 112
	add	x4, x0, x4
	add	x1, x29, 88
	add	x21, x21, 135168
	mov	x0, x23
	mov	w22, 2
	str	x4, [x29, 88]
	stp	w5, w6, [x29, 104]
	strb	wzr, [x29, 98]
	strb	w22, [x29, 97]
	bl	InsertStreamSeg
	ldr	w4, [x21, 24]
	mov	w3, 1
	ldr	x5, [x25, 112]
	add	x1, x29, 88
	ldr	w2, [x19, 240]
	mov	x0, x23
	strb	w3, [x29, 98]
	strb	w22, [x29, 97]
	str	x5, [x29, 88]
	stp	w4, w20, [x29, 104]
	bl	InsertStreamSeg
	b	.L924
	.size	SetLastUnfinishedSegInfo, .-SetLastUnfinishedSegInfo
	.align	3
.LC291:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessSegRoll
	.type	ProcessSegRoll, %function
ProcessSegRoll:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x22, x0
	mov	x0, x30
	add	x25, x22, 184320
	add	x22, x22, 49152
	mov	w26, w2
	mov	x19, x1
	sxtb	w21, w4
	add	x24, x22, 112
	sxtb	w20, w3
	bl	_mcount
	add	x5, x24, 135168
	ldr	x0, [x25, 208]
	ldr	w1, [x25, 620]
	ldr	w27, [x5, 24]
	sub	w26, w26, w1
	ldr	w23, [x0]
	sub	w23, w23, w27
	add	w4, w26, w23
	cbz	x24, .L936
	ldp	w3, w0, [x5, 8]
	str	w1, [x19, 16]
	cmp	w4, 3
	add	w0, w0, 1536
	sub	w0, w0, w3
	mov	w3, 43691
	movk	w3, 0xaaaa, lsl 16
	ldr	w2, [x5, 24]
	umull	x3, w0, w3
	sub	w1, w1, w2
	ldr	x2, [x22, 112]
	lsr	x3, x3, 32
	str	w4, [x19, 20]
	lsr	w3, w3, 10
	add	x1, x2, x1
	str	x1, [x19]
	lsl	w1, w3, 2
	sub	w3, w1, w3
	sub	w0, w0, w3, lsl 9
	mov	w3, 1536
	sub	w0, w3, w0
	bls	.L942
	cmp	w0, 2
	bls	.L940
.L939:
	mov	w2, 3236
	mov	x1, x24
	mov	x0, x19
	bl	CheckSegValid
	mov	w28, w0
	cbnz	w0, .L940
	str	w26, [x19, 20]
	cbz	w23, .L944
	strb	wzr, [x19, 10]
	mov	x1, x19
	strb	w20, [x19, 9]
	mov	x0, x24
	ldr	w2, [x25, 240]
	bl	InsertStreamSeg
	str	w27, [x19, 16]
	add	x1, x22, 112
	mov	w3, 1
	add	x1, x1, 135168
	ldr	x2, [x22, 112]
	mov	x0, x24
	ldr	w1, [x1, 24]
	strb	w21, [x19, 9]
	sub	w27, w27, w1
	strb	w3, [x19, 10]
	str	w23, [x19, 20]
	add	x27, x2, x27
	str	x27, [x19]
	mov	x1, x19
	ldr	w2, [x25, 240]
	bl	InsertStreamSeg
	mov	w0, w28
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L944:
	strb	w20, [x19, 9]
	mov	w0, 1
	strb	w0, [x19, 10]
	mov	x1, x19
	mov	x0, x24
	ldr	w2, [x25, 240]
	bl	InsertStreamSeg
	mov	w0, w28
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L936:
	str	w1, [x19, 16]
	cmp	w4, 3
	ldr	w0, [x5, 24]
	sub	w1, w1, w0
	ldr	x0, [x22, 112]
	str	w4, [x19, 20]
	add	x1, x0, x1
	str	x1, [x19]
	bhi	.L939
.L942:
	mov	w3, 3231
	ldr	x2, .LC293
	mov	w1, w3
	mov	w0, 0
	mov	w28, 0
	bl	dprint_normal
	mov	w0, w28
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L940:
	mov	w28, -4
	mov	w0, w28
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.size	ProcessSegRoll, .-ProcessSegRoll
	.align	3
.LC293:
	.xword	.LC292
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessLastUnfinishedSeg
	.type	ProcessLastUnfinishedSeg, %function
ProcessLastUnfinishedSeg:
	stp	x29, x30, [sp, -176]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 184320
	mov	x21, x2
	mov	w24, w1
	bl	_mcount
	add	x22, x20, 49152
	ldr	x1, [x19, 208]
	add	x0, x22, 112
	add	x0, x0, 135168
	ldr	w3, [x21, 28]
	ldr	w23, [x21, 16]
	ldr	w25, [x1]
	add	x1, x29, 88
	ldr	w0, [x0, 24]
	str	xzr, [x29, 168]
	stp	xzr, xzr, [x1]
	add	x1, x29, 104
	cmp	w0, w3
	stp	xzr, xzr, [x1]
	add	x1, x29, 120
	stp	xzr, xzr, [x1]
	add	x1, x29, 136
	stp	xzr, xzr, [x1]
	add	x1, x29, 152
	stp	xzr, xzr, [x1]
	bls	.L946
	add	w3, w23, w3
	sub	w23, w3, w0
.L946:
	cbnz	w24, .L947
	ldr	w1, [x19, 292]
	ldr	w2, [x19, 288]
	cmp	w2, w1
	cset	w1, gt
	strb	w1, [x20]
	ldr	w3, [x19, 620]
	cbz	w3, .L958
	ldr	w2, [x19, 624]
	ldr	w1, [x19, 172]
	ldr	w4, [x19, 628]
	add	w2, w2, w1
	str	w2, [x19, 624]
	cbnz	w4, .L950
	ldr	w2, [x21, 28]
	cmp	w3, w2
	bls	.L950
	mov	w2, 1
	str	w23, [x19, 632]
	str	w2, [x19, 628]
.L950:
	str	wzr, [x19, 616]
	ldr	w2, [x21, 28]
	cmp	w2, w0
	csel	w0, w2, w0, cs
	str	w0, [x19, 612]
.L949:
	add	x0, x20, 88
	bl	DeleteRawLen
	mov	w21, w0
.L951:
	mov	w0, w21
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L947:
	strb	wzr, [x20]
	mov	w21, 0
	ldr	w0, [x19, 620]
	cbz	w0, .L951
	ldr	x0, .LC294
	mov	x2, 88
	add	x1, x19, 640
	ldr	x3, [x0, 104]
	add	x0, x29, x2
	blr	x3
	ldr	w3, [x19, 628]
	cmp	w3, 1
	beq	.L959
	ldr	w0, [x19, 620]
	cmp	w25, w0
	bcc	.L953
	add	x20, x22, 112
	ldr	x2, [x22, 112]
	add	x3, x20, 135168
	sub	w4, w25, w0
	stp	w0, w4, [x29, 104]
	mov	w1, 1
	cmp	w4, 3
	ldr	w3, [x3, 24]
	strb	w1, [x29, 98]
	sub	w0, w0, w3
	strb	w1, [x29, 97]
	add	x0, x2, x0
	str	x0, [x29, 88]
	bls	.L960
	mov	w2, 3328
	mov	x1, x20
	add	x0, x29, 88
	bl	CheckSegValid
	cbnz	w0, .L956
	ldr	w2, [x19, 240]
	add	x1, x29, 88
	mov	x0, x20
	bl	InsertStreamSeg
	mov	w21, w0
	b	.L951
	.p2align 3
.L958:
	ldr	w1, [x19, 172]
	b	.L949
	.p2align 3
.L953:
	mov	w4, 0
	mov	w3, 1
	mov	w2, w23
	add	x1, x29, 88
	mov	x0, x20
	bl	ProcessSegRoll
	mov	w21, w0
	b	.L951
	.p2align 3
.L960:
	mov	w3, 3323
	ldr	x2, .LC295
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L951
	.p2align 3
.L959:
	ldr	w2, [x19, 632]
	mov	w4, w3
	add	x1, x29, 88
	mov	x0, x20
	bl	ProcessSegRoll
	mov	w21, w0
	b	.L951
.L956:
	mov	w21, -4
	b	.L951
	.size	ProcessLastUnfinishedSeg, .-ProcessLastUnfinishedSeg
	.align	3
.LC294:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC295:
	.xword	.LC292
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SetPushRawOverState
	.type	SetPushRawOverState, %function
SetPushRawOverState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	w0, [x19, 8]
	str	w20, [x19, 8]
	cmp	w0, 3
	mov	w0, -7
	ccmp	w20, 2, 0, eq
	beq	.L963
	mov	w0, 0
.L963:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SetPushRawOverState, .-SetPushRawOverState
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessExceptionalStartCodeNum
	.type	ProcessExceptionalStartCodeNum, %function
ProcessExceptionalStartCodeNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	mov	w3, 3362
	ldr	x2, .LC297
	mov	w4, w20
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w1, 1
	add	x0, x19, 88
	bl	DeleteRawPacket
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ProcessExceptionalStartCodeNum, .-ProcessExceptionalStartCodeNum
	.align	3
.LC297:
	.xword	.LC296
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetValidStartCodeNum
	.type	GetValidStartCodeNum, %function
GetValidStartCodeNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	w2, [x19, 24]
	ldr	w0, [x19, 12]
	udiv	w1, w2, w20
	ldp	x19, x20, [sp, 16]
	cmp	w1, w0
	csel	w0, w1, w0, ls
	ldp	x29, x30, [sp], 32
	ret
	.size	GetValidStartCodeNum, .-GetValidStartCodeNum
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessNotMpeg4ScdUpMsg
	.type	ProcessNotMpeg4ScdUpMsg, %function
ProcessNotMpeg4ScdUpMsg:
	stp	x29, x30, [sp, -240]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	str	w1, [x29, 140]
	mov	x28, x2
	str	x19, [x29, 104]
	bl	_mcount
	add	x1, x29, 168
	add	x22, x19, 184320
	add	x0, x29, 152
	add	x20, x19, 49152
	add	x20, x20, 112
	mov	w25, 1
	stp	xzr, xzr, [x1]
	add	x1, x29, 184
	mov	w27, 0
	stp	xzr, xzr, [x0]
	ldr	w0, [x22, 316]
	mov	x24, x20
	stp	xzr, xzr, [x1]
	add	x1, x29, 200
	str	w0, [x29, 132]
	add	x21, x20, 135168
	sub	w0, w0, #1
	ldr	x26, [x22, 208]
	stp	xzr, xzr, [x1]
	add	x1, x29, 216
	str	xzr, [x29, 232]
	str	w0, [x29, 136]
	stp	xzr, xzr, [x1]
	add	x1, x19, 88
	str	x1, [x29, 112]
	b	.L967
	.p2align 3
.L991:
	ldr	w1, [x21, 24]
	sub	w4, w4, w0
	ldr	x3, [x24]
	mov	w2, 1
	sub	w1, w0, w1
	strb	w2, [x29, 162]
	stp	w0, w4, [x29, 168]
	cmp	w4, 3
	add	x0, x3, x1
	str	x0, [x29, 152]
	bhi	.L969
	mov	w3, 3404
	ldr	x2, .LC298
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
.L970:
	ldr	w0, [x29, 132]
	mov	w27, w23
	add	w25, w25, w0
.L967:
	ldr	w0, [x29, 140]
	cmp	w27, w0
	beq	.L975
	ldr	w1, [x29, 136]
	sub	w0, w25, #1
	add	w23, w27, 1
	add	w1, w1, w25
	ldr	w0, [x26, w0, uxtw 2]
	ldr	w4, [x26, w1, uxtw 2]
	cmp	w0, w4
	bls	.L991
	ldr	w1, [x21, 24]
	ldr	w3, [x28, 16]
	sub	w5, w4, w1
	sub	w3, w3, w0
	add	w4, w3, w5
	cbz	x20, .L976
	ldr	x2, [x24]
	sub	w1, w0, w1
	cmp	w4, 3
	add	x1, x2, x1
	str	x1, [x29, 152]
	stp	w0, w4, [x29, 168]
	ldr	w2, [x21, 12]
	ldr	w1, [x21, 8]
	bls	.L986
	add	w2, w2, 1536
	mov	w0, 43691
	sub	w1, w2, w1
	movk	w0, 0xaaaa, lsl 16
	mov	w4, 1536
	umull	x0, w1, w0
	lsr	x0, x0, 32
	lsr	w0, w0, 10
	lsl	w2, w0, 2
	sub	w0, w2, w0
	sub	w1, w1, w0, lsl 9
	sub	w1, w4, w1
	cmp	w1, 2
	bls	.L975
.L987:
	add	x19, x29, 152
	mov	w2, 3440
	mov	x1, x20
	mov	x0, x19
	stp	w5, w3, [x29, 124]
	bl	CheckSegValid
	cbnz	w0, .L975
	ldp	w5, w3, [x29, 124]
	cbnz	w5, .L978
	str	w3, [x29, 172]
	mov	w0, 1
	strb	wzr, [x29, 161]
	mov	w5, 65531
	strb	w0, [x29, 162]
	movk	w5, 0x3fff, lsl 16
	ldr	x0, [x29, 112]
	add	x2, x22, 280
	ldr	w1, [x26, w25, uxtw 2]
	mov	x3, x19
	ldr	w4, [x22, 240]
	and	w1, w1, 1073741823
	cmp	w1, w5
	csel	w1, w1, wzr, ls
	bl	GetSegPts
	ldr	w2, [x22, 240]
	mov	x1, x19
	mov	x0, x20
	bl	InsertStreamSeg
	b	.L970
	.p2align 3
.L969:
	add	x19, x29, 152
	mov	w2, 3408
	mov	x1, x20
	mov	x0, x19
	bl	CheckSegValid
	cbnz	w0, .L975
	strb	wzr, [x29, 161]
	mov	w5, 65531
	movk	w5, 0x3fff, lsl 16
	ldr	x0, [x29, 112]
	ldr	w1, [x26, w25, uxtw 2]
	add	x2, x22, 280
	ldr	w4, [x22, 240]
	mov	x3, x19
	and	w1, w1, 1073741823
	cmp	w1, w5
	csel	w1, w1, wzr, ls
	bl	GetSegPts
	ldr	w2, [x22, 240]
	mov	x1, x19
	mov	x0, x20
	bl	InsertStreamSeg
	cbz	w0, .L970
	.p2align 2
.L975:
	cmp	w27, wzr
	ble	.L992
	ldr	w0, [x28, 12]
	sub	w0, w0, #1
	cmp	w27, w0
	bcc	.L993
.L982:
	cmp	w27, w0
	beq	.L994
.L985:
	ldr	x0, [x29, 104]
	mov	x2, x28
	mov	w1, 0
	bl	SetLastUnfinishedSegInfo
.L966:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 240
	ret
	.p2align 3
.L978:
	str	w3, [x29, 172]
	mov	w7, 65531
	strb	wzr, [x29, 162]
	movk	w7, 0x3fff, lsl 16
	strb	wzr, [x29, 161]
	mov	x3, x19
	ldr	w4, [x22, 240]
	add	x2, x22, 280
	ldr	w1, [x26, w25, uxtw 2]
	ldr	x0, [x29, 112]
	and	w1, w1, 1073741823
	str	w5, [x29, 128]
	cmp	w1, w7
	csel	w1, w1, wzr, ls
	bl	GetSegPts
	ldr	w2, [x22, 240]
	mov	x1, x19
	mov	x0, x20
	bl	InsertStreamSeg
	strb	wzr, [x29, 161]
	ldr	w7, [x21, 24]
	mov	w3, 1
	ldr	w5, [x29, 128]
	mov	x1, x19
	ldr	x4, [x24]
	mov	x0, x20
	ldr	w2, [x22, 240]
	strb	w3, [x29, 162]
	str	x4, [x29, 152]
	stp	w7, w5, [x29, 168]
	bl	InsertStreamSeg
	b	.L970
	.p2align 3
.L976:
	sub	w1, w0, w1
	cmp	w4, 3
	stp	w0, w4, [x29, 168]
	ldr	x0, [x24]
	add	x1, x0, x1
	str	x1, [x29, 152]
	bhi	.L987
	.p2align 2
.L986:
	mov	w3, 3436
	ldr	x2, .LC298
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L970
	.p2align 3
.L993:
	ldr	w0, [x29, 132]
	mov	w2, 65531
	movk	w2, 0x3fff, lsl 16
	mul	w1, w0, w27
	ldr	x0, [x29, 104]
	add	w1, w1, 1
	ldr	w1, [x26, w1, uxtw 2]
	and	w1, w1, 1073741823
	cmp	w1, w2
	csel	w19, w1, wzr, ls
	bl	ResetLastUnfinishedSegInfo
	ldr	x0, [x29, 112]
	mov	w1, w19
	bl	DeleteRawLen
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 240
	ret
	.p2align 3
.L992:
	blt	.L985
	ldr	w0, [x28, 12]
	sub	w0, w0, #1
	b	.L982
.L994:
	ldr	x0, [x29, 104]
	mov	w1, w27
	mov	x2, x28
	ldr	w19, [x22, 172]
	bl	SetLastUnfinishedSegInfo
	ldr	x0, [x29, 112]
	mov	w1, w19
	bl	DeleteRawLen
	b	.L966
	.size	ProcessNotMpeg4ScdUpMsg, .-ProcessNotMpeg4ScdUpMsg
	.align	3
.LC298:
	.xword	.LC292
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetMpeg4ModeFlag
	.type	GetMpeg4ModeFlag, %function
GetMpeg4ModeFlag:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	add	x28, x0, 184320
	mov	w19, w1
	mov	x0, x30
	mov	w26, 0
	mov	w27, 0
	bl	_mcount
	ldr	w21, [x28, 316]
	ldr	x20, [x28, 208]
	cbz	w19, .L995
	ldr	x25, .LC302
	mov	w22, 288
	mov	w24, 2
	mov	w23, 1
	b	.L1009
	.p2align 3
.L1015:
	cmp	w1, 32768
	str	w23, [x28, 260]
	str	wzr, [x28, 264]
	beq	.L1013
.L1001:
	add	w27, w27, 1
	add	w26, w26, w21
	cmp	w27, w19
	beq	.L995
.L1009:
	ldr	w0, [x20, w26, uxtw 2]
	bl	MEM_Phy2Vir
	cbz	x0, .L1014
	ldr	w1, [x0]
	rev	w1, w1
	cmp	w1, 438
	ccmp	w1, w22, 4, ne
	and	w1, w1, -2048
	beq	.L1015
	cmp	w1, 32768
	bne	.L1001
	ldr	w0, [x28, 260]
	cmp	w0, 1
	beq	.L1016
.L1003:
	str	w24, [x28, 260]
.L1017:
	add	w27, w27, 1
	add	w26, w26, w21
	cmp	w27, w19
	bne	.L1009
.L995:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1013:
	str	w23, [x28, 264]
	b	.L1001
	.p2align 3
.L1014:
	ldr	x3, .LC299
	mov	w4, 3505
	ldr	x2, .LC301
	mov	w1, w4
	add	x3, x3, 1040
	mov	w0, 1
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L1016:
	ldr	w0, [x28, 264]
	add	w0, w0, 1
	str	w0, [x28, 264]
	cmp	w0, 30
	bls	.L1001
	ldr	x4, [x25]
	cbz	x4, .L1003
	ldr	w0, [x28, 240]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
	str	w24, [x28, 260]
	b	.L1017
	.size	GetMpeg4ModeFlag, .-GetMpeg4ModeFlag
	.align	3
.LC299:
	.xword	.LANCHOR2
	.align	3
.LC301:
	.xword	.LC300
	.align	3
.LC302:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessMpeg4ScdUpMsg
	.type	ProcessMpeg4ScdUpMsg, %function
ProcessMpeg4ScdUpMsg:
	stp	x29, x30, [sp, -320]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x22, x0
	mov	x0, x30
	add	x19, x22, 184320
	mov	x25, x2
	stp	x22, x2, [x29, 104]
	mov	w23, w1
	str	w1, [x29, 100]
	bl	_mcount
	ldr	x28, [x19, 208]
	ldr	w1, [x19, 316]
	add	x20, x22, 49152
	ldr	w0, [x19, 136]
	add	x20, x20, 112
	mov	w24, w1
	add	x1, x29, 232
	str	w24, [x29, 136]
	mov	w27, 0
	stp	xzr, xzr, [x29, 144]
	stp	xzr, xzr, [x1]
	add	x1, x29, 248
	str	xzr, [x29, 224]
	stp	xzr, xzr, [x29, 160]
	stp	xzr, xzr, [x29, 176]
	stp	xzr, xzr, [x1]
	add	x1, x29, 264
	str	xzr, [x29, 312]
	stp	xzr, xzr, [x29, 192]
	stp	xzr, xzr, [x29, 208]
	stp	xzr, xzr, [x1]
	add	x1, x29, 280
	mov	x26, x20
	stp	xzr, xzr, [x1]
	add	x1, x29, 296
	stp	xzr, xzr, [x1]
	bl	MEM_Phy2Vir
	mov	x21, x0
	mov	x0, x25
	add	x1, x22, 88
	str	x1, [x29, 128]
	mov	w25, 1
	ldr	w0, [x0, 16]
	bl	MEM_Phy2Vir
	sub	w3, w24, #1
	str	w3, [x29, 140]
	ldr	x3, .LC303
	mov	x2, 4
	mov	x1, x21
	ldr	x3, [x3, 104]
	blr	x3
	mov	x0, x22
	mov	w1, w23
	bl	GetMpeg4ModeFlag
	mov	x0, x22
	mov	w2, w23
	mov	x1, x28
	add	x22, x20, 135168
	bl	GetNextVop
	mov	w24, w0
	b	.L1019
	.p2align 3
.L1060:
	ldr	w0, [x29, 248]
	cbz	w0, .L1021
	ldr	w3, [x29, 252]
	mov	w2, 3576
	mov	x1, x20
	add	x0, x29, 232
	add	w4, w3, w4
	str	w4, [x29, 252]
	bl	CheckSegValid
	cbnz	w0, .L1025
	ldr	w2, [x19, 240]
	add	x1, x29, 232
	mov	x0, x20
	strb	wzr, [x29, 241]
	bl	InsertStreamSeg
	mov	w23, w0
	ldr	x0, .LC303
	mov	x2, 88
	mov	w1, 0
	ldr	x4, [x0, 96]
	add	x0, x29, 232
	blr	x4
	cbnz	w23, .L1025
.L1026:
	ldr	w0, [x29, 136]
	mov	w27, w21
	add	w25, w25, w0
.L1019:
	cmp	w27, w24
	beq	.L1025
	ldr	w1, [x29, 140]
	sub	w0, w25, #1
	add	w21, w27, 1
	add	w1, w1, w25
	add	x23, x28, x0, uxtw 2
	ldr	w3, [x28, w0, uxtw 2]
	ldr	w0, [x28, w1, uxtw 2]
	sub	w4, w0, w3
	cmp	w4, 3
	bgt	.L1060
	sub	w1, w4, #1
	cmp	w1, 2
	bls	.L1061
	ldr	x1, [x29, 112]
	ldr	w10, [x1, 16]
	ldr	w1, [x22, 24]
	sub	w10, w10, w3
	sub	w9, w0, w1
	add	w4, w10, w9
	cbz	x20, .L1037
	ldr	x0, [x26]
	sub	w1, w3, w1
	cmp	w4, 3
	ldr	w2, [x22, 12]
	add	x1, x0, x1
	str	x1, [x29, 144]
	stp	w3, w4, [x29, 160]
	ldr	w1, [x22, 8]
	bls	.L1051
	add	w2, w2, 1536
	mov	w0, 43691
	sub	w1, w2, w1
	movk	w0, 0xaaaa, lsl 16
	mov	w3, 1536
	umull	x0, w1, w0
	lsr	x0, x0, 32
	lsr	w0, w0, 10
	lsl	w2, w0, 2
	sub	w0, w2, w0
	sub	w1, w1, w0, lsl 9
	sub	w1, w3, w1
	cmp	w1, 2
	bls	.L1025
.L1052:
	mov	w2, 3654
	mov	x1, x20
	add	x0, x29, 144
	stp	w9, w10, [x29, 120]
	bl	CheckSegValid
	cbnz	w0, .L1025
	ldp	w9, w10, [x29, 120]
	ldr	w0, [x19, 260]
	cmp	w0, 1
	ldrb	w0, [x29, 224]
	cbnz	w9, .L1039
	beq	.L1062
	orr	w0, w0, 1
	strb	w0, [x29, 224]
.L1041:
	ldr	w1, [x23, 4]
	mov	w2, 1
	ldrb	w0, [x29, 224]
	mov	w8, 65531
	lsr	w1, w1, 30
	movk	w8, 0x3fff, lsl 16
	bfi	w0, w1, 1, 1
	strb	w0, [x29, 224]
	add	x3, x29, 144
	ldrh	w1, [x23, 10]
	bfi	w0, w1, 2, 1
	strb	w0, [x29, 224]
	ldr	w1, [x23, 8]
	ubfx	x1, x1, 4, 3
	bfi	w0, w1, 3, 4
	strb	w0, [x29, 224]
	ldr	w0, [x23, 8]
	ldrh	w1, [x29, 224]
	and	w0, w0, 7
	strb	w2, [x29, 154]
	strb	wzr, [x29, 153]
	bfi	w1, w0, 7, 4
	str	w10, [x29, 164]
	add	x2, x19, 280
	strh	w1, [x29, 224]
	ldr	x0, [x29, 128]
	ldr	w1, [x28, w25, uxtw 2]
	ldr	w4, [x19, 240]
	and	w1, w1, 1073741823
	cmp	w1, w8
	csel	w1, w1, wzr, ls
	bl	GetSegPts
	ldr	w2, [x19, 240]
	add	x1, x29, 144
	mov	x0, x20
	bl	InsertStreamSeg
	b	.L1026
	.p2align 3
.L1021:
	ldr	w9, [x22, 24]
	mov	w2, 3597
	ldr	x10, [x26]
	mov	x1, x20
	sub	w9, w3, w9
	add	x0, x29, 144
	add	x9, x10, x9
	mov	w10, 1
	str	x9, [x29, 144]
	strb	w10, [x29, 154]
	stp	w3, w4, [x29, 160]
	bl	CheckSegValid
	cbnz	w0, .L1025
	ldr	w0, [x19, 260]
	cmp	w0, 1
	ldrb	w0, [x29, 224]
	beq	.L1063
	orr	w0, w0, 1
	strb	w0, [x29, 224]
.L1028:
	ldr	w1, [x23, 4]
	mov	w10, 65531
	ldrb	w0, [x29, 224]
	movk	w10, 0x3fff, lsl 16
	lsr	w1, w1, 30
	ldr	w4, [x19, 240]
	bfi	w0, w1, 1, 1
	strb	w0, [x29, 224]
	add	x2, x19, 280
	add	x3, x29, 144
	ldrh	w1, [x23, 10]
	bfi	w0, w1, 2, 1
	strb	w0, [x29, 224]
	mov	w1, w0
	ldr	x0, [x29, 128]
	ldr	w9, [x23, 8]
	ubfx	x9, x9, 4, 3
	bfi	w1, w9, 3, 4
	strb	w1, [x29, 224]
	ldr	w1, [x23, 8]
	ldrh	w7, [x29, 224]
	and	w1, w1, 7
	bfi	w7, w1, 7, 4
	strh	w7, [x29, 224]
	ldr	w1, [x28, w25, uxtw 2]
	and	w1, w1, 1073741823
	cmp	w1, w10
	csel	w1, w1, wzr, ls
	bl	GetSegPts
	strb	wzr, [x29, 153]
	ldr	w2, [x19, 240]
	add	x1, x29, 144
	mov	x0, x20
	bl	InsertStreamSeg
	cbz	w0, .L1026
	.p2align 2
.L1025:
	cmp	w27, wzr
	ble	.L1024
	ldr	x0, [x29, 112]
	ldr	w0, [x0, 12]
	sub	w0, w0, #1
	cmp	w27, w0
	bcs	.L1047
	ldr	w0, [x29, 136]
	mov	w2, 65531
	movk	w2, 0x3fff, lsl 16
	mul	w1, w0, w27
	ldr	x0, [x29, 104]
	add	w1, w1, 1
	ldr	w1, [x28, w1, uxtw 2]
	and	w1, w1, 1073741823
	cmp	w1, w2
	csel	w19, w1, wzr, ls
	bl	ResetLastUnfinishedSegInfo
	ldr	x0, [x29, 128]
	mov	w1, w19
	bl	DeleteRawLen
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 320
	ret
	.p2align 3
.L1061:
	stp	w4, w3, [x29, 120]
	bl	MEM_Phy2Vir
	ldp	w4, w3, [x29, 120]
	cbz	x0, .L1064
	ldr	w0, [x0]
	and	w0, w0, 16777215
	cmp	w0, 65536
	beq	.L1026
	ldr	w0, [x19, 260]
	cmp	w0, 1
	ldrb	w0, [x29, 312]
	beq	.L1065
	orr	w0, w0, 1
	strb	w0, [x29, 312]
.L1035:
	ldr	w1, [x23, 4]
	ldrb	w0, [x29, 312]
	lsr	w1, w1, 30
	bfi	w0, w1, 1, 1
	strb	w0, [x29, 312]
	ldr	w1, [x22, 24]
	ldrh	w2, [x23, 10]
	sub	w1, w3, w1
	bfi	w0, w2, 2, 1
	ldr	x2, [x26]
	strb	w0, [x29, 312]
	add	x1, x2, x1
	str	x1, [x29, 232]
	ldr	w1, [x23, 8]
	mov	w2, 65531
	movk	w2, 0x3fff, lsl 16
	ubfx	x1, x1, 4, 3
	bfi	w0, w1, 3, 4
	strb	w0, [x29, 312]
	mov	w1, 1
	ldr	w0, [x23, 8]
	strb	w1, [x29, 242]
	ldrh	w1, [x29, 312]
	and	w0, w0, 7
	stp	w3, w4, [x29, 248]
	bfi	w1, w0, 7, 4
	ldr	w4, [x19, 240]
	strh	w1, [x29, 312]
	add	x3, x29, 232
	ldr	x0, [x29, 128]
	ldr	w1, [x28, w25, uxtw 2]
	and	w1, w1, 1073741823
	cmp	w1, w2
	add	x2, x19, 280
	csel	w1, w1, wzr, ls
	bl	GetSegPts
	b	.L1026
	.p2align 3
.L1039:
	beq	.L1066
	orr	w0, w0, 1
	strb	w0, [x29, 224]
.L1044:
	ldr	w1, [x23, 4]
	mov	w8, 65531
	ldrb	w0, [x29, 224]
	movk	w8, 0x3fff, lsl 16
	lsr	w1, w1, 30
	ldr	w4, [x19, 240]
	bfi	w0, w1, 1, 1
	strb	w0, [x29, 224]
	add	x3, x29, 144
	add	x2, x19, 280
	ldrh	w1, [x23, 10]
	str	w9, [x29, 124]
	bfi	w0, w1, 2, 1
	strb	w0, [x29, 224]
	ldr	w1, [x23, 8]
	ubfx	x1, x1, 4, 3
	bfi	w0, w1, 3, 4
	strb	w0, [x29, 224]
	ldr	w0, [x23, 8]
	ldrh	w1, [x29, 224]
	and	w0, w0, 7
	str	w10, [x29, 164]
	strb	wzr, [x29, 154]
	bfi	w1, w0, 7, 4
	strb	wzr, [x29, 153]
	strh	w1, [x29, 224]
	ldr	x0, [x29, 128]
	ldr	w1, [x28, w25, uxtw 2]
	and	w1, w1, 1073741823
	cmp	w1, w8
	csel	w1, w1, wzr, ls
	bl	GetSegPts
	ldr	w2, [x19, 240]
	add	x1, x29, 144
	mov	x0, x20
	bl	InsertStreamSeg
	strb	wzr, [x29, 153]
	ldr	w3, [x22, 24]
	add	x1, x29, 144
	ldr	w9, [x29, 124]
	mov	x0, x20
	ldr	x4, [x26]
	ldr	w2, [x19, 240]
	stp	w3, w9, [x29, 160]
	mov	w3, 1
	str	x4, [x29, 144]
	strb	w3, [x29, 154]
	bl	InsertStreamSeg
	b	.L1026
	.p2align 3
.L1037:
	ldr	x0, [x26]
	sub	w1, w3, w1
	cmp	w4, 3
	add	x1, x0, x1
	str	x1, [x29, 144]
	stp	w3, w4, [x29, 160]
	bhi	.L1052
	.p2align 2
.L1051:
	mov	w3, 3650
	ldr	x2, .LC306
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L1026
	.p2align 3
.L1063:
	and	w0, w0, -2
	strb	w0, [x29, 224]
	b	.L1028
	.p2align 3
.L1062:
	and	w0, w0, -2
	strb	w0, [x29, 224]
	b	.L1041
	.p2align 3
.L1066:
	and	w0, w0, -2
	strb	w0, [x29, 224]
	b	.L1044
	.p2align 3
.L1047:
	beq	.L1067
.L1024:
	ldr	w0, [x29, 100]
	cmp	w0, 1024
	ccmp	w24, wzr, 0, hi
	beq	.L1068
.L1050:
	ldr	x0, [x29, 104]
	bl	ResetLastUnfinishedSegInfo
.L1018:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 320
	ret
	.p2align 3
.L1065:
	and	w0, w0, -2
	strb	w0, [x29, 312]
	b	.L1035
.L1068:
	ldr	x2, .LC308
	mov	x3, x0
	mov	w1, 3703
	mov	w0, 0
	bl	dprint_normal
	ldr	x0, [x29, 128]
	mov	w1, 1
	bl	DeleteRawPacket
	b	.L1050
.L1067:
	ldp	x0, x2, [x29, 104]
	mov	w1, w27
	ldr	w19, [x19, 172]
	bl	SetLastUnfinishedSegInfo
	ldr	x0, [x29, 128]
	mov	w1, w19
	bl	DeleteRawLen
	b	.L1018
.L1064:
	mov	w3, 3619
	ldr	x2, .LC305
	mov	w1, w3
	bl	dprint_normal
	b	.L1018
	.size	ProcessMpeg4ScdUpMsg, .-ProcessMpeg4ScdUpMsg
	.align	3
.LC303:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC305:
	.xword	.LC304
	.align	3
.LC306:
	.xword	.LC292
	.align	3
.LC308:
	.xword	.LC307
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessH263ScdUpMsg
	.type	ProcessH263ScdUpMsg, %function
ProcessH263ScdUpMsg:
	sub	sp, sp, #336
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	stp	x23, x24, [sp, 64]
	stp	x25, x26, [sp, 80]
	stp	x27, x28, [sp, 96]
	mov	x24, x0
	mov	x0, x30
	mov	x22, x2
	str	w1, [x29, 112]
	str	x2, [x29, 128]
	add	x20, x24, 184320
	str	x24, [x29, 104]
	bl	_mcount
	add	x2, x29, 232
	str	xzr, [x29, 224]
	ldr	w0, [x20, 136]
	add	x21, x24, 49152
	ldr	x26, [x20, 208]
	add	x21, x21, 112
	stp	xzr, xzr, [x2]
	add	x2, x29, 248
	ldr	w25, [x20, 316]
	stp	xzr, xzr, [x29, 144]
	stp	xzr, xzr, [x29, 160]
	stp	xzr, xzr, [x2]
	add	x2, x29, 264
	str	xzr, [x29, 312]
	stp	xzr, xzr, [x29, 176]
	stp	xzr, xzr, [x29, 192]
	stp	xzr, xzr, [x2]
	add	x2, x29, 280
	mov	w27, 0
	stp	xzr, xzr, [x29, 208]
	mov	x23, x21
	stp	xzr, xzr, [x2]
	add	x2, x29, 296
	stp	xzr, xzr, [x2]
	bl	MEM_Phy2Vir
	mov	x19, x0
	mov	x0, x22
	add	x2, x24, 88
	str	x2, [x29, 136]
	add	x22, x21, 135168
	ldr	w0, [x0, 16]
	bl	MEM_Phy2Vir
	ldr	x28, .LC309
	mov	x1, x19
	mov	x2, 4
	ldr	x3, [x28, 104]
	blr	x3
	ldr	w19, [x29, 112]
	mov	x0, x24
	mov	w1, w19
	bl	GetMpeg4ModeFlag
	mov	w2, w19
	mov	x1, x26
	mov	x0, x24
	bl	GetNextVop
	mov	w19, w0
	.p2align 2
.L1070:
	cmp	w19, w27
	bls	.L1073
	mul	w3, w25, w27
	add	w27, w27, 1
	add	w0, w3, 1
	ldr	w0, [x26, w0, uxtw 2]
	tbz	x0, 30, .L1071
	add	w0, w3, 2
	ldr	w0, [x26, w0, uxtw 2]
	orr	w0, w0, w0, lsr 4
	and	w0, w0, 7
	cbnz	w0, .L1070
.L1071:
	cmp	w19, w27
	bcc	.L1073
	add	w0, w25, w3
	add	w4, w0, 1
	add	w2, w0, 2
	add	w1, w25, w0
	ldr	w5, [x26, w0, uxtw 2]
	ldr	w4, [x26, w4, uxtw 2]
	ldr	w2, [x26, w2, uxtw 2]
	lsr	w0, w2, 4
	tbz	x4, 30, .L1075
.L1121:
	orr	w0, w2, w0
	add	w4, w1, 1
	and	w0, w0, 7
	add	w6, w1, 2
	cbz	w0, .L1075
	add	w27, w27, 1
	cmp	w19, w27
	bcc	.L1075
	ldr	w4, [x26, w4, uxtw 2]
	ldr	w2, [x26, w6, uxtw 2]
	ldr	w5, [x26, w1, uxtw 2]
	add	w1, w1, w25
	lsr	w0, w2, 4
	tbnz	x4, 30, .L1121
	.p2align 2
.L1075:
	cbz	w5, .L1073
	ldr	w24, [x26, w3, uxtw 2]
	sub	w3, w5, w24
	cmp	w3, 3
	ble	.L1078
	ldr	w0, [x29, 248]
	cbz	w0, .L1079
	ldr	w4, [x29, 252]
	mov	w2, 3784
	mov	x1, x21
	add	x0, x29, 232
	add	w3, w4, w3
	str	w3, [x29, 252]
	bl	CheckSegValid
	cbnz	w0, .L1073
	ldr	w2, [x20, 240]
	add	x1, x29, 232
	mov	x0, x21
	strb	wzr, [x29, 241]
	bl	InsertStreamSeg
	mov	w24, w0
	ldr	x4, [x28, 96]
	mov	x2, 88
	mov	w1, 0
	add	x0, x29, 232
	blr	x4
	cbz	w24, .L1070
	.p2align 2
.L1073:
	cmp	w27, wzr
	ble	.L1101
	ldr	x0, [x29, 128]
	ldr	w0, [x0, 12]
	sub	w0, w0, #1
	cmp	w0, w27
	bls	.L1102
	mul	w1, w25, w27
	mov	w2, 65531
	ldr	x0, [x29, 104]
	add	w1, w1, 1
	movk	w2, 0x3fff, lsl 16
	ldr	w1, [x26, w1, uxtw 2]
	and	w1, w1, 1073741823
	cmp	w1, w2
	csel	w19, w1, wzr, ls
	bl	ResetLastUnfinishedSegInfo
	ldr	x0, [x29, 136]
	mov	w1, w19
	bl	DeleteRawLen
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 320
	ret
	.p2align 3
.L1078:
	sub	w0, w3, #1
	cmp	w0, 2
	bls	.L1129
	ldr	x0, [x29, 128]
	ldr	w3, [x0, 16]
	ldr	w0, [x22, 24]
	sub	w11, w3, w24
	sub	w6, w5, w0
	sub	w0, w24, w0
	add	w4, w11, w6
	stp	w24, w4, [x29, 160]
	cmp	w4, 3
	cbz	x21, .L1089
	ldr	x12, [x23]
	ldp	w1, w2, [x22, 8]
	add	x0, x12, x0
	str	x0, [x29, 144]
	bls	.L1106
	add	w2, w2, 1536
	mov	w0, 43691
	sub	w1, w2, w1
	movk	w0, 0xaaaa, lsl 16
	mov	w4, 1536
	umull	x0, w1, w0
	lsr	x0, x0, 32
	lsr	w0, w0, 10
	lsl	w2, w0, 2
	sub	w0, w2, w0
	sub	w1, w1, w0, lsl 9
	sub	w1, w4, w1
	cmp	w1, 2
	bls	.L1091
.L1107:
	mov	w2, 3862
	mov	x1, x21
	add	x0, x29, 144
	str	w5, [x29, 124]
	stp	w6, w11, [x29, 116]
	bl	CheckSegValid
	ldp	w6, w11, [x29, 116]
	ldr	w5, [x29, 124]
	cbnz	w0, .L1130
	ldr	w0, [x20, 260]
	ldrb	w1, [x29, 224]
	cmp	w0, 1
	mul	w0, w25, w27
	add	x2, x26, x0, uxtw 2
	cbnz	w6, .L1093
	beq	.L1131
	orr	w1, w1, 1
	strb	w1, [x29, 224]
.L1095:
	ldr	w3, [x2, 4]
	add	w1, w0, 1
	ldrb	w0, [x29, 224]
	mov	w5, 1
	lsr	w3, w3, 30
	ldr	w4, [x20, 240]
	bfi	w0, w3, 1, 1
	strb	w0, [x29, 224]
	ldrh	w3, [x2, 10]
	bfi	w0, w3, 2, 1
	strb	w0, [x29, 224]
	ldr	w3, [x2, 8]
	ubfx	x3, x3, 4, 3
	bfi	w0, w3, 3, 4
	strb	w0, [x29, 224]
	add	x3, x29, 144
	ldr	w0, [x2, 8]
	ldrh	w2, [x29, 224]
	and	w0, w0, 7
	strb	w5, [x29, 154]
	strb	wzr, [x29, 153]
	bfi	w2, w0, 7, 4
	str	w11, [x29, 164]
	mov	w0, 65531
	strh	w2, [x29, 224]
	movk	w0, 0x3fff, lsl 16
	add	x2, x20, 280
	ldr	w1, [x26, w1, uxtw 2]
	and	w1, w1, 1073741823
	cmp	w1, w0
	ldr	x0, [x29, 136]
	csel	w1, w1, wzr, ls
	bl	GetSegPts
	ldr	w2, [x20, 240]
	add	x1, x29, 144
	mov	x0, x21
	bl	InsertStreamSeg
	b	.L1070
	.p2align 3
.L1079:
	ldr	w4, [x22, 24]
	mov	w2, 3805
	ldr	x5, [x23]
	mov	x1, x21
	sub	w4, w24, w4
	add	x0, x29, 144
	add	x4, x5, x4
	mov	w5, 1
	str	x4, [x29, 144]
	strb	w5, [x29, 154]
	stp	w24, w3, [x29, 160]
	bl	CheckSegValid
	cbnz	w0, .L1073
	ldr	w0, [x20, 260]
	mul	w1, w25, w27
	cmp	w0, 1
	ldrb	w0, [x29, 224]
	add	x6, x26, x1, uxtw 2
	beq	.L1132
	orr	w0, w0, 1
	strb	w0, [x29, 224]
.L1081:
	ldr	w2, [x6, 4]
	add	w5, w1, 1
	ldrb	w0, [x29, 224]
	add	x3, x29, 144
	lsr	w1, w2, 30
	ldr	w4, [x20, 240]
	bfi	w0, w1, 1, 1
	strb	w0, [x29, 224]
	add	x2, x20, 280
	ldrh	w1, [x6, 10]
	bfi	w0, w1, 2, 1
	strb	w0, [x29, 224]
	mov	w1, w0
	ldr	x0, [x29, 136]
	ldr	w7, [x6, 8]
	ubfx	x7, x7, 4, 3
	bfi	w1, w7, 3, 4
	strb	w1, [x29, 224]
	ldr	w1, [x6, 8]
	ldrh	w6, [x29, 224]
	and	w1, w1, 7
	bfi	w6, w1, 7, 4
	strh	w6, [x29, 224]
	ldr	w1, [x26, w5, uxtw 2]
	mov	w5, 65531
	movk	w5, 0x3fff, lsl 16
	and	w1, w1, 1073741823
	cmp	w1, w5
	csel	w1, w1, wzr, ls
	bl	GetSegPts
	strb	wzr, [x29, 153]
	ldr	w2, [x20, 240]
	add	x1, x29, 144
	mov	x0, x21
	bl	InsertStreamSeg
	cbz	w0, .L1070
	b	.L1073
	.p2align 3
.L1129:
	mov	w0, w5
	str	w3, [x29, 124]
	bl	MEM_Phy2Vir
	ldr	w3, [x29, 124]
	cbz	x0, .L1133
	ldr	w0, [x0]
	and	w0, w0, 16777215
	cmp	w0, 65536
	beq	.L1070
	ldr	w0, [x20, 260]
	ldrb	w1, [x29, 312]
	cmp	w0, 1
	mul	w0, w25, w27
	add	x2, x26, x0, uxtw 2
	beq	.L1134
	orr	w1, w1, 1
	strb	w1, [x29, 312]
.L1087:
	ldr	w1, [x2, 4]
	add	w4, w0, 1
	ldrb	w0, [x29, 312]
	lsr	w1, w1, 30
	bfi	w0, w1, 1, 1
	strb	w0, [x29, 312]
	ldr	w1, [x22, 24]
	ldrh	w5, [x2, 10]
	sub	w1, w24, w1
	bfi	w0, w5, 2, 1
	ldr	x5, [x23]
	strb	w0, [x29, 312]
	add	x1, x5, x1
	str	x1, [x29, 232]
	ldr	w1, [x2, 8]
	ubfx	x1, x1, 4, 3
	bfi	w0, w1, 3, 4
	strb	w0, [x29, 312]
	ldr	w0, [x2, 8]
	add	x2, x20, 280
	ldrh	w1, [x29, 312]
	and	w0, w0, 7
	bfi	w1, w0, 7, 4
	mov	w0, 1
	strh	w1, [x29, 312]
	strb	w0, [x29, 242]
	mov	w0, 65531
	stp	w24, w3, [x29, 248]
	movk	w0, 0x3fff, lsl 16
	add	x3, x29, 232
	ldr	w1, [x26, w4, uxtw 2]
	ldr	w4, [x20, 240]
	and	w1, w1, 1073741823
	cmp	w1, w0
	ldr	x0, [x29, 136]
	csel	w1, w1, wzr, ls
	bl	GetSegPts
	b	.L1070
	.p2align 3
.L1093:
	beq	.L1135
	orr	w1, w1, 1
	strb	w1, [x29, 224]
.L1098:
	ldr	w3, [x2, 4]
	add	w1, w0, 1
	ldrb	w0, [x29, 224]
	lsr	w3, w3, 30
	ldr	w4, [x20, 240]
	bfi	w0, w3, 1, 1
	strb	w0, [x29, 224]
	str	w6, [x29, 124]
	ldrh	w3, [x2, 10]
	bfi	w0, w3, 2, 1
	strb	w0, [x29, 224]
	add	x3, x29, 144
	ldr	w5, [x2, 8]
	ubfx	x5, x5, 4, 3
	bfi	w0, w5, 3, 4
	strb	w0, [x29, 224]
	ldr	w0, [x2, 8]
	ldrh	w2, [x29, 224]
	and	w0, w0, 7
	str	w11, [x29, 164]
	strb	wzr, [x29, 154]
	bfi	w2, w0, 7, 4
	strb	wzr, [x29, 153]
	mov	w0, 65531
	strh	w2, [x29, 224]
	movk	w0, 0x3fff, lsl 16
	add	x2, x20, 280
	ldr	w1, [x26, w1, uxtw 2]
	and	w1, w1, 1073741823
	cmp	w1, w0
	ldr	x0, [x29, 136]
	csel	w1, w1, wzr, ls
	bl	GetSegPts
	ldr	w2, [x20, 240]
	add	x1, x29, 144
	mov	x0, x21
	bl	InsertStreamSeg
	strb	wzr, [x29, 153]
	ldr	w3, [x22, 24]
	mov	w0, 1
	ldr	w6, [x29, 124]
	add	x1, x29, 144
	stp	w3, w6, [x29, 160]
	ldr	w2, [x20, 240]
	ldr	x3, [x23]
	strb	w0, [x29, 154]
	mov	x0, x21
	str	x3, [x29, 144]
	bl	InsertStreamSeg
	b	.L1070
	.p2align 3
.L1089:
	ldr	x1, [x23]
	add	x0, x1, x0
	str	x0, [x29, 144]
	bhi	.L1107
	.p2align 2
.L1106:
	mov	w3, 3858
	ldr	x2, .LC311
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L1070
	.p2align 3
.L1132:
	and	w0, w0, -2
	strb	w0, [x29, 224]
	b	.L1081
	.p2align 3
.L1102:
	beq	.L1136
.L1101:
	ldr	w0, [x29, 112]
	cmp	w0, 1024
	ccmp	w19, wzr, 0, hi
	beq	.L1137
.L1105:
	ldr	x0, [x29, 104]
	bl	ResetLastUnfinishedSegInfo
.L1069:
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 320
	ret
	.p2align 3
.L1135:
	and	w1, w1, -2
	strb	w1, [x29, 224]
	b	.L1098
	.p2align 3
.L1131:
	and	w1, w1, -2
	strb	w1, [x29, 224]
	b	.L1095
	.p2align 3
.L1134:
	and	w1, w1, -2
	strb	w1, [x29, 312]
	b	.L1087
.L1137:
	ldr	x2, .LC315
	mov	x3, x0
	mov	w1, 3912
	mov	w0, 0
	bl	dprint_normal
	ldr	x0, [x29, 136]
	mov	w1, 1
	bl	DeleteRawPacket
	b	.L1105
.L1136:
	ldr	x0, [x29, 104]
	mov	w1, w27
	ldr	x2, [x29, 128]
	ldr	w19, [x20, 172]
	bl	SetLastUnfinishedSegInfo
	ldr	x0, [x29, 136]
	mov	w1, w19
	bl	DeleteRawLen
	b	.L1069
.L1130:
	ldr	x0, [x29, 128]
	ldr	w3, [x0, 16]
.L1091:
	str	w3, [sp]
	mov	w4, 3864
	ldr	x3, .LC312
	mov	w7, w24
	ldr	x2, .LC314
	mov	w6, w27
	str	w5, [sp, 8]
	mov	w1, w4
	add	x3, x3, 1064
	mov	w5, w27
	mov	w0, 32
	bl	dprint_normal
	b	.L1073
.L1133:
	mov	w3, 3827
	ldr	x2, .LC310
	mov	w1, w3
	bl	dprint_normal
	b	.L1069
	.size	ProcessH263ScdUpMsg, .-ProcessH263ScdUpMsg
	.align	3
.LC309:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC310:
	.xword	.LC304
	.align	3
.LC311:
	.xword	.LC292
	.align	3
.LC312:
	.xword	.LANCHOR2
	.align	3
.LC314:
	.xword	.LC313
	.align	3
.LC315:
	.xword	.LC307
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	ProcessScdReturn.part.22, %function
ProcessScdReturn.part.22:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	mov	w1, w19
	add	x0, x29, 32
	bl	ReadScdStateReg
	mov	w0, 34464
	ldr	w1, [x29, 44]
	movk	w0, 0x1, lsl 16
	cmp	w1, w0
	bls	.L1139
	ldr	w0, [x20, 20]
	cbz	w0, .L1145
.L1139:
	add	x2, x20, 184320
	ldr	w0, [x29, 56]
	ldr	w19, [x2, 316]
	udiv	w19, w0, w19
	cmp	w19, w1
	csel	w19, w19, w1, ls
	cmp	w1, w19
	bhi	.L1146
.L1141:
	mov	w1, w19
	add	x2, x29, 32
	mov	x0, x20
	bl	ProcessLastUnfinishedSeg
	cmp	w0, wzr
	ccmp	w19, wzr, 4, eq
	cset	w1, eq
	cbnz	w1, .L1140
	ldr	w0, [x20, 20]
	add	x2, x29, 32
	sub	w1, w19, #1
	cmp	w0, 2
	ccmp	w0, 14, 4, ne
	beq	.L1147
	cmp	w0, 4
	mov	x0, x20
	beq	.L1148
	bl	ProcessNotMpeg4ScdUpMsg
	mov	w0, 0
.L1140:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1146:
	ldrsb	w0, [x20, 2]
	cmp	w0, 1
	bne	.L1141
	strb	wzr, [x20, 2]
	b	.L1141
	.p2align 3
.L1147:
	mov	x0, x20
	bl	ProcessMpeg4ScdUpMsg
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1148:
	bl	ProcessH263ScdUpMsg
	mov	w0, 0
	b	.L1140
.L1145:
	mov	x0, x20
	bl	ProcessExceptionalStartCodeNum
	mov	w0, -7
	b	.L1140
	.size	ProcessScdReturn.part.22, .-ProcessScdReturn.part.22
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessScdReturn
	.type	ProcessScdReturn, %function
ProcessScdReturn:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	add	x2, x19, 184320
	add	x2, x2, 168
	ldr	w0, [x2, 8]
	cmp	w0, 3
	beq	.L1152
	mov	w0, 2
	mov	w1, w20
	str	w0, [x2, 8]
	mov	x0, x19
	bl	ProcessScdReturn.part.22
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1152:
	mov	w1, 2
	str	w1, [x2, 8]
	mov	w0, -7
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ProcessScdReturn, .-ProcessScdReturn
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	NeedReadStream
	.type	NeedReadStream, %function
NeedReadStream:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 60]
	cbnz	w0, .L1154
	ldr	w1, [x19, 64]
	mov	w0, 1
	cbz	w1, .L1155
.L1154:
	add	x19, x19, 184320
	mov	w0, 0
	ldr	w1, [x19, 160]
	cmp	w1, 8
	bgt	.L1155
	ldr	x0, .LC316
	ldr	x0, [x0, w20, sxtw 3]
	ldr	w0, [x0, 120]
	cmp	w0, 1
	ccmp	w1, wzr, 4, eq
	cset	w0, le
.L1155:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	NeedReadStream, .-NeedReadStream
	.align	3
.LC316:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FillRawData
	.type	FillRawData, %function
FillRawData:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	sxtw	x22, w0
	mov	x0, x30
	mov	x21, x22
	bl	_mcount
	ldr	x26, .LC317
	lsl	x3, x22, 4
	ldr	x24, .LC318
	mov	x2, 96
	mov	w1, 0
	add	x0, x29, x2
	ldr	x20, [x26, x3]
	ldr	x3, [x24, 96]
	blr	x3
	cbz	x20, .L1159
	ldr	w0, [x20, 20]
	cmp	w0, 20
	beq	.L1159
	lsl	x0, x22, 2
	ldr	x23, .LC322
	sub	x0, x0, x22
	ldr	x25, .LC319
	lsl	x1, x0, 5
	lsl	w27, w22, 24
	add	x0, x0, x1
	add	x0, x0, x22
	add	x23, x23, x0
	.p2align 2
.L1174:
	ldr	w0, [x20, 60]
	cbnz	w0, .L1161
	ldr	w0, [x20, 64]
	cbz	w0, .L1162
.L1161:
	add	x0, x20, 184320
	ldr	w0, [x0, 160]
	cmp	w0, 8
	bgt	.L1159
	ldr	x1, [x25, x22, lsl 3]
	ldr	w1, [x1, 120]
	cmp	w1, 1
	ccmp	w0, wzr, 4, eq
	ble	.L1162
.L1159:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1162:
	mov	w0, w21
	bl	GetRawState
	cbnz	w0, .L1192
	add	x1, x29, 96
	mov	w0, w21
	bl	ReadRawStreamData
	cbnz	w0, .L1159
	add	x19, x20, 184320
	ldr	w0, [x29, 104]
	ldr	x3, [x24]
	ldr	w2, [x19, 296]
	ldr	w4, [x19, 320]
	ldr	w1, [x19, 324]
	add	w2, w2, w0
	add	w0, w4, w0
	str	w2, [x19, 296]
	add	w1, w1, 1
	str	w0, [x19, 320]
	str	w1, [x19, 324]
	blr	x3
	ldr	w1, [x23, 12]
	cbnz	w1, .L1166
	str	w0, [x23, 12]
.L1166:
	ldr	w1, [x19, 300]
	cbnz	w1, .L1167
	str	w0, [x19, 300]
.L1168:
	ldr	x2, .LC324
	mov	w1, 4053
	ldr	x3, [x29, 160]
	mov	w0, 24
	bl	dprint_normal
	ldr	x2, .LC326
	mov	w1, 4054
	ldp	w3, w4, [x29, 100]
	mov	w0, 21
	bl	dprint_normal
	ldr	x1, [x29, 160]
	mov	x0, 4294967295
	cmp	x1, x0
	beq	.L1193
	add	x1, x29, 96
	mov	w0, w21
	bl	SCDDRV_InsertRawPacket
	cbnz	w0, .L1194
.L1170:
	mov	w1, 1
	strb	w1, [x20, 3]
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L1195
.L1172:
	mov	w0, w21
	add	x2, x29, 96
	mov	x1, x20
	bl	SCDDRV_SaveRawStream
	ldr	x0, .LC319
	ldr	x0, [x0, x22, lsl 3]
	ldr	w0, [x0, 120]
	cmp	w0, 1
	bne	.L1174
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1167:
	sub	w1, w0, w1
	cmp	w1, 2000
	bls	.L1168
	ldr	w2, [x19, 296]
	str	w0, [x19, 300]
	lsl	w0, w2, 3
	str	wzr, [x19, 296]
	udiv	w1, w0, w1
	lsl	w0, w1, 6
	sub	w0, w0, w1
	lsl	w0, w0, 1
	sub	w1, w0, w1
	ubfx	x1, x1, 7, 22
	str	w1, [x19, 304]
	b	.L1168
	.p2align 3
.L1195:
	ldr	x0, [x24]
	blr	x0
	add	x2, x26, 152
	ldr	x3, .LC329
	ldr	w1, [x2, x22, lsl 2]
	ldr	w3, [x3]
	sub	w1, w0, w1
	cmp	w1, w3
	bls	.L1172
	str	w0, [x2, x22, lsl 2]
	mov	w1, 4086
	ldr	x0, .LC330
	mov	w2, w27
	add	x0, x0, 1088
	bl	DBG_AddTrace
	b	.L1172
	.p2align 3
.L1193:
	mov	x0, -1
	add	x1, x29, 96
	str	x0, [x29, 160]
	mov	w0, w21
	bl	SCDDRV_InsertRawPacket
	cbz	w0, .L1170
.L1194:
	ldr	x2, .LC328
	mov	w1, 4063
	mov	w0, 0
	bl	dprint_normal
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1192:
	ldr	x2, .LC321
	mov	w3, w21
	mov	w1, 4015
	mov	w0, 23
	bl	dprint_normal
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 192
	ret
	.size	FillRawData, .-FillRawData
	.align	3
.LC317:
	.xword	.LANCHOR0
	.align	3
.LC318:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC319:
	.xword	s_pstVfmwChan
	.align	3
.LC321:
	.xword	.LC320
	.align	3
.LC322:
	.xword	g_VfmwChanStat
	.align	3
.LC324:
	.xword	.LC323
	.align	3
.LC326:
	.xword	.LC325
	.align	3
.LC328:
	.xword	.LC327
	.align	3
.LC329:
	.xword	g_TraceBsPeriod
	.align	3
.LC330:
	.xword	.LANCHOR2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseSegArrayPackets
	.type	ReleaseSegArrayPackets, %function
ReleaseSegArrayPackets:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	mov	w21, w2
	bl	_mcount
	cmp	w19, 1536
	beq	.L1196
	cmp	w19, w21
	beq	.L1196
	mov	w22, 43691
	add	x24, x20, 135168
	mov	w23, 2
	movk	w22, 0x2aaa, lsl 16
	.p2align 2
.L1199:
	sxtw	x3, w19
	mov	w1, w19
	lsl	x2, x3, 2
	mov	x0, x20
	sub	x2, x2, x3
	lsl	x2, x2, 2
	sub	x2, x2, x3
	add	x2, x20, x2, lsl 3
	strb	w23, [x2, 16]
	ldr	w4, [x2, 28]
	ldp	w3, w2, [x24, 44]
	subs	w3, w3, w4
	csel	w3, w3, wzr, pl
	subs	w2, w2, #1
	csel	w2, w2, wzr, pl
	stp	w3, w2, [x24, 44]
	bl	ReleaseStreamSeg
	add	w0, w19, 1
	smull	x19, w0, w22
	asr	x19, x19, 40
	sub	w19, w19, w0, asr 31
	lsl	w1, w19, 2
	sub	w19, w1, w19
	sub	w19, w0, w19, lsl 9
	cmp	w21, w19
	bne	.L1199
.L1196:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	ReleaseSegArrayPackets, .-ReleaseSegArrayPackets
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_SeekPtsInSegArray
	.type	SM_SeekPtsInSegArray, %function
SM_SeekPtsInSegArray:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	add	x21, x0, 135168
	mov	x26, x0
	mov	x0, x30
	mov	x23, x1
	mov	w20, 43691
	bl	_mcount
	movk	w20, 0x2aaa, lsl 16
	ldp	w25, w4, [x21, 8]
	ldp	x22, x24, [x23]
	str	w25, [x21, 16]
	.p2align 2
.L1202:
	sxtw	x19, w25
	cmp	w25, w4
	lsl	x3, x19, 2
	mov	w1, w25
	sub	x3, x3, x19
	mov	x0, x26
	lsl	x3, x3, 2
	sub	x19, x3, x19
	beq	.L1214
	add	x19, x26, x19, lsl 3
	ldrsb	w2, [x19, 16]
	cmp	w2, 1
	bne	.L1205
	ldr	x0, [x19, 48]
	cmn	x0, #1
	beq	.L1215
	add	w1, w25, 1
	cmp	x22, x0
	smull	x2, w1, w20
	bls	.L1208
	asr	x2, x2, 40
	str	w25, [x21, 16]
	sub	w25, w2, w1, asr 31
	lsl	w2, w25, 2
	sub	w25, w2, w25
	sub	w25, w1, w25, lsl 9
	b	.L1202
	.p2align 3
.L1205:
	bl	ReleaseStreamSeg
	ldr	w4, [x21, 12]
	add	w0, w25, 1
.L1212:
	smull	x25, w0, w20
	asr	x25, x25, 40
	sub	w25, w25, w0, asr 31
	lsl	w2, w25, 2
	sub	w25, w2, w25
	sub	w25, w0, w25, lsl 9
	b	.L1202
	.p2align 3
.L1208:
	beq	.L1216
	bcs	.L1202
	ldr	w2, [x21, 16]
	sxtw	x1, w2
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	add	x0, x26, x0, lsl 3
	ldr	x0, [x0, 48]
	cmn	x0, #1
	beq	.L1213
	cmp	x22, x0
	bls	.L1211
	sub	x22, x22, x0
	cmp	x24, x22
	bcs	.L1211
.L1213:
	mov	w2, w25
	str	w25, [x21, 16]
.L1211:
	ldr	w1, [x21, 8]
	mov	x0, x26
	bl	ReleaseSegArrayPackets
	ldrsw	x2, [x21, 16]
	mov	w0, 0
	lsl	x1, x2, 2
	sub	x1, x1, x2
	lsl	x1, x1, 2
	sub	x1, x1, x2
	add	x26, x26, x1, lsl 3
	ldr	x1, [x26, 48]
	str	x1, [x23]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1215:
	add	w0, w25, 1
	b	.L1212
	.p2align 3
.L1214:
	ldr	w1, [x21, 8]
	mov	w2, w25
	bl	ReleaseSegArrayPackets
	mov	w0, -2
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L1216:
	ldr	w1, [x21, 8]
	mov	w2, w25
	mov	x0, x26
	bl	ReleaseSegArrayPackets
	ldr	x0, [x19, 48]
	str	x0, [x23]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	SM_SeekPtsInSegArray, .-SM_SeekPtsInSegArray
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_SeekPtsInRawArray
	.type	SM_SeekPtsInRawArray, %function
SM_SeekPtsInRawArray:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w2
	mov	x21, x1
	mov	w22, w3
	bl	_mcount
	ldr	x1, .LC332
	sbfiz	x0, x19, 4, 32
	ldr	x9, [x1, x0]
	cbz	x9, .L1252
	add	x7, x20, 49152
	ldr	w1, [x7]
	tbnz	w1, #31, .L1220
	ldr	w6, [x7, 4]
	tbnz	w6, #31, .L1220
	cmp	w22, 1
	mov	w3, w1
	mov	w10, 0
	ldp	x8, x11, [x21]
	beq	.L1253
.L1222:
	mov	w1, w3
	str	w3, [x7, 8]
	.p2align 2
.L1223:
	sxtw	x5, w1
	add	w0, w1, 1
	asr	w4, w0, 31
	lsl	x2, x5, 2
	sub	x2, x2, x5
	lsr	w4, w4, 23
	cmp	w1, w6
	add	w0, w0, w4
	add	x2, x20, x2, lsl 5
	and	w0, w0, 511
	beq	.L1254
	ldr	x2, [x2, 64]
	cmn	x2, #1
	beq	.L1255
	cmp	x8, x2
	bls	.L1229
	str	w1, [x7, 8]
	sub	w1, w0, w4
	b	.L1223
	.p2align 3
.L1255:
	add	w0, w1, 1
	asr	w1, w0, 31
	lsr	w1, w1, 23
	add	w0, w0, w1
	and	w0, w0, 511
	sub	w1, w0, w1
	b	.L1223
	.p2align 3
.L1254:
	cmp	w3, w1
	bgt	.L1256
.L1247:
	sub	w1, w1, w3
	str	w3, [x7, 8]
	mov	x0, x20
	bl	DeleteRawPacket
	mov	w1, 0
	mov	w0, w19
	bl	DeleteRawPacketInBuffer
	mov	w0, -2
.L1219:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1256:
	add	w1, w1, 512
	b	.L1247
	.p2align 3
.L1229:
	beq	.L1257
	ldr	w0, [x7, 8]
	sxtw	x4, w0
	lsl	x2, x4, 2
	sub	x2, x2, x4
	add	x2, x20, x2, lsl 5
	ldr	x2, [x2, 64]
	cmn	x2, #1
	beq	.L1249
	cmp	x8, x2
	bls	.L1235
	sub	x8, x8, x2
	cmp	x11, x8
	bcs	.L1235
.L1249:
	mov	w0, w1
	str	w1, [x7, 8]
.L1235:
	cmp	w3, w0
	sub	w1, w0, w3
	bgt	.L1258
.L1237:
	cmp	w22, 1
	beq	.L1259
.L1238:
	sxtw	x2, w0
	mov	x0, x20
	lsl	x3, x2, 2
	sub	x2, x3, x2
	add	x20, x20, x2, lsl 5
.L1251:
	ldr	x2, [x20, 64]
	str	x2, [x21]
	ldr	w2, [x7]
	str	w2, [x7, 8]
	bl	DeleteRawPacket
	mov	w1, 0
	mov	w0, w19
	bl	DeleteRawPacketInBuffer
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1253:
	add	x0, x9, 184320
	ldr	w10, [x0, 176]
	cmp	w10, 1
	bne	.L1222
	mov	w1, 3
	str	w1, [x0, 176]
	ldp	w3, w6, [x7]
	b	.L1222
	.p2align 3
.L1258:
	add	w1, w0, 512
	sub	w1, w1, w3
	b	.L1237
.L1257:
	cmp	w1, w3
	bge	.L1248
	add	w1, w1, 512
.L1248:
	cmp	w22, 1
	sub	w1, w1, w3
	beq	.L1260
.L1233:
	lsl	x0, x5, 2
	sub	x5, x0, x5
	mov	x0, x20
	add	x20, x20, x5, lsl 5
	b	.L1251
.L1259:
	add	x9, x9, 184320
	ldr	w2, [x9, 168]
	cmp	w1, w2
	ccmp	w10, 1, 0, le
	bne	.L1238
	str	w10, [x9, 176]
	ldr	w0, [x7, 8]
	b	.L1238
.L1260:
	add	x9, x9, 184320
	ldr	w0, [x9, 168]
	cmp	w1, w0
	ccmp	w10, 1, 0, le
	bne	.L1233
	str	w10, [x9, 176]
	b	.L1233
.L1220:
	ldr	x3, .LC333
	mov	w4, 4201
.L1250:
	ldr	x2, .LC334
	mov	w1, w4
	add	x3, x3, 1104
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L1219
.L1252:
	ldr	x3, .LC333
	mov	w4, 4200
	b	.L1250
	.size	SM_SeekPtsInRawArray, .-SM_SeekPtsInRawArray
	.align	3
.LC332:
	.xword	.LANCHOR0
	.align	3
.LC333:
	.xword	.LANCHOR2
	.align	3
.LC334:
	.xword	.LC40
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_SeekPtsAfterFillNewRaw
	.type	SM_SeekPtsAfterFillNewRaw, %function
SM_SeekPtsAfterFillNewRaw:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w2
	mov	x21, x1
	bl	_mcount
	mov	w1, 0
	mov	w0, w19
	bl	DeleteRawPacketInBuffer
	mov	w0, w19
	bl	FillRawData
	mov	w2, w19
	mov	x1, x21
	mov	w3, 0
	mov	x0, x20
	bl	SM_SeekPtsInRawArray
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	SM_SeekPtsAfterFillNewRaw, .-SM_SeekPtsAfterFillNewRaw
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_SeekPts
	.type	SM_SeekPts, %function
SM_SeekPts:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w22, w0
	mov	x0, x30
	mov	x23, x1
	bl	_mcount
	cmp	w22, 3
	bhi	.L1287
	cbz	x23, .L1288
	ldr	x1, .LC337
	sbfiz	x0, x22, 4, 32
	ldr	x20, [x1, x0]
	cbz	x20, .L1289
	add	x0, x20, 49152
	mov	x1, x23
	add	x0, x0, 112
	bl	SM_SeekPtsInSegArray
	cbnz	w0, .L1267
.L1268:
	mov	w0, 0
.L1264:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1267:
	mov	w1, 0
	mov	w0, w22
	add	x20, x20, 88
	bl	DeleteRawPacketInBuffer
	mov	w3, 1
	mov	w2, w22
	mov	x1, x23
	mov	x0, x20
	bl	SM_SeekPtsInRawArray
	cbz	w0, .L1268
	add	x1, x20, 49152
	ldp	w4, w0, [x1]
	cmp	w4, w0
	bgt	.L1290
.L1285:
	sub	w4, w0, w4
	ldr	x3, [x23, 16]
	sxtw	x4, w4
	cmp	x4, x3
	bcs	.L1291
	sub	x4, x3, x4
	and	x0, x4, 511
	lsr	x21, x4, 9
	cbnz	x0, .L1292
.L1273:
	add	w21, w21, 1
	mov	w19, 0
	cmp	w21, wzr
	bgt	.L1281
	b	.L1276
	.p2align 3
.L1293:
	cmp	w19, w21
	beq	.L1276
.L1281:
	mov	w2, w22
	mov	x1, x23
	mov	x0, x20
	add	w19, w19, 1
	bl	SM_SeekPtsAfterFillNewRaw
	cbnz	w0, .L1293
	b	.L1268
	.p2align 3
.L1290:
	add	w0, w0, 512
	b	.L1285
	.p2align 3
.L1292:
	add	w21, w21, 1
	b	.L1273
	.p2align 3
.L1276:
	mov	w0, -2
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L1287:
	ldr	x3, .LC335
	mov	w4, 4314
.L1286:
	ldr	x2, .LC336
	mov	w1, w4
	add	x3, x3, 1128
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L1264
.L1289:
	ldr	x3, .LC335
	mov	w4, 4318
	b	.L1286
.L1291:
	ldr	x2, .LC339
	mov	w1, 4349
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -2
	b	.L1264
.L1288:
	ldr	x3, .LC335
	mov	w4, 4315
	b	.L1286
	.size	SM_SeekPts, .-SM_SeekPts
	.align	3
.LC335:
	.xword	.LANCHOR2
	.align	3
.LC336:
	.xword	.LC40
	.align	3
.LC337:
	.xword	.LANCHOR0
	.align	3
.LC339:
	.xword	.LC338
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_MoveRawData
	.type	SM_MoveRawData, %function
SM_MoveRawData:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x24, x20, 49152
	bl	_mcount
	ldr	w5, [x20, 72]
	ldr	w0, [x24, 92]
	add	w1, w0, 511
	subs	w22, w0, #1
	csel	w22, w1, w22, mi
	add	w1, w0, 510
	subs	w0, w0, #2
	csel	w0, w1, w0, mi
	sxtw	x2, w22
	lsl	x1, x2, 2
	sxtw	x0, w0
	sub	x1, x1, x2
	lsl	x21, x0, 2
	lsl	x1, x1, 5
	sub	x0, x21, x0
	add	x23, x20, x1
	add	x19, x23, 88
	add	x21, x20, x0, lsl 5
	ldr	w4, [x23, 96]
	ldr	w3, [x21, 96]
	add	w0, w3, w4
	cmp	w0, w5
	bgt	.L1297
	ldr	x1, .LC340
	sxtw	x2, w4
	ldr	x0, [x21, 128]
	add	x20, x20, 184320
	add	x0, x0, x3, sxtw
	ldr	x3, [x1, 104]
	ldr	x1, [x23, 128]
	blr	x3
	ldr	w2, [x21, 96]
	mov	x1, x19
	ldr	w0, [x23, 96]
	add	w0, w2, w0
	str	w0, [x21, 96]
	ldr	w0, [x20, 240]
	bl	ReleaseRawStreamData
	str	w22, [x24, 92]
	mov	w0, 0
.L1298:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1297:
	ldr	x2, .LC342
	mov	w1, 4397
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -7
	b	.L1298
	.size	SM_MoveRawData, .-SM_MoveRawData
	.align	3
.LC340:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC342:
	.xword	.LC341
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_ProcessSegFull
	.type	SCDDRV_ProcessSegFull, %function
SCDDRV_ProcessSegFull:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	add	x19, x21, 49152
	bl	_mcount
	add	x19, x19, 112
	add	x2, x29, 80
	mov	x0, x19
	add	x1, x29, 72
	str	wzr, [x29, 72]
	add	x22, x19, 135168
	str	wzr, [x2, -4]!
	bl	GetFreshSegStream
	ldr	w20, [x22, 28]
	ldrsb	w0, [x21, 1]
	cbnz	w0, .L1300
	add	w20, w20, w20, lsr 31
	ldr	w0, [x29, 76]
	cmp	w0, w20, asr 1
	bge	.L1299
	ldr	w0, [x29, 72]
	cmp	w0, 127
	ble	.L1314
.L1299:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1300:
	ldr	x0, .LC343
	ldr	x0, [x0]
	blr	x0
	add	x1, x21, 184320
	ldr	w3, [x1, 272]
	cmp	w0, w3
	bls	.L1304
	sub	w3, w0, w3
	mov	w0, 5000
	cmp	w3, w0
	str	w3, [x1, 268]
	ble	.L1299
	cmp	w20, wzr
	add	w0, w20, 3
	csel	w20, w0, w20, lt
	ldr	w2, [x29, 76]
	cmp	w2, w20, asr 2
	bge	.L1299
	ldr	w0, [x29, 72]
	cmp	w0, 63
	bgt	.L1299
	cbnz	w2, .L1306
	ldr	w0, [x1, 624]
	cbz	w0, .L1306
	cbz	x19, .L1309
	ldp	w1, w0, [x22, 8]
	mov	w24, 43691
	add	w0, w0, 1536
	movk	w24, 0xaaaa, lsl 16
	sub	w3, w0, w1
	umull	x0, w3, w24
	lsr	x0, x0, 32
	lsr	w0, w0, 10
	lsl	w2, w0, 2
	sub	w0, w2, w0
	sub	w0, w3, w0, lsl 9
	umull	x24, w0, w24
	lsr	x24, x24, 32
	lsr	w24, w24, 1
	cbz	w24, .L1309
	mov	w23, 0
	mov	x20, x22
	b	.L1310
	.p2align 3
.L1315:
	ldr	w1, [x20, 8]
.L1310:
	add	w1, w1, w23
	mov	x0, x19
	add	w23, w23, 1
	bl	ReleaseStreamSeg
	cmp	w24, w23
	bne	.L1315
.L1309:
	ldr	x2, .LC345
	mov	w1, 4441
	mov	w0, 0
	bl	dprint_normal
.L1308:
	strb	wzr, [x21, 1]
	strb	wzr, [x21]
	b	.L1299
	.p2align 3
.L1304:
	str	wzr, [x1, 268]
	str	w0, [x1, 272]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1314:
	ldr	x0, .LC343
	mov	w1, 1
	strb	w1, [x21, 1]
	add	x21, x21, 184320
	ldr	x0, [x0]
	blr	x0
	str	wzr, [x21, 268]
	str	w0, [x21, 272]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1306:
	ldr	x2, .LC347
	mov	w1, 4445
	mov	w0, 0
	bl	dprint_normal
	mov	w1, -1
	mov	x0, x19
	bl	ReleaseStreamSeg
	b	.L1308
	.size	SCDDRV_ProcessSegFull, .-SCDDRV_ProcessSegFull
	.align	3
.LC343:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC345:
	.xword	.LC344
	.align	3
.LC347:
	.xword	.LC346
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_CanNotSelectInst
	.type	SCDDRV_CanNotSelectInst, %function
SCDDRV_CanNotSelectInst:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	sbfiz	x19, x19, 4, 32
	bl	_mcount
	ldr	x0, .LC348
	ldr	x1, [x0, x19]
	cbz	x1, .L1319
	add	x0, x1, 184320
	ldr	w2, [x0, 256]
	cbz	w2, .L1319
	ldr	w0, [x0, 248]
	cmp	w0, 1
	beq	.L1319
	ldr	w0, [x1, 20]
	ldr	x2, [x1, 36]
	ldr	w1, [x1, 44]
	cmp	w0, 19
	str	x2, [x29, 32]
	str	w1, [x29, 40]
	beq	.L1319
	add	x1, x29, 32
	bl	SCDDRV_IsSCDByPass
	uxtb	w0, w0
	cmp	w0, wzr
	ldr	x19, [sp, 16]
	cset	w0, ne
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1319:
	ldr	x19, [sp, 16]
	mov	w0, 1
	ldp	x29, x30, [sp], 48
	ret
	.size	SCDDRV_CanNotSelectInst, .-SCDDRV_CanNotSelectInst
	.align	3
.LC348:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	SM_DoNextInstance.part.23, %function
SM_DoNextInstance.part.23:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w21, w0
	mov	x0, x30
	mov	x25, x1
	mov	w20, 4
	bl	_mcount
	ldr	x22, .LC349
	sxtw	x0, w21
	ldr	x23, .LC350
	lsl	x1, x0, 6
	ldr	x24, .LC351
	add	x0, x1, x0, lsl 3
	add	x0, x22, x0
	ldr	w19, [x0, 116]
.L1337:
	add	w0, w19, 1
	mov	w1, w21
	asr	w19, w0, 31
	lsr	w19, w19, 30
	add	w0, w0, w19
	and	w0, w0, 3
	sub	w19, w0, w19
	mov	w0, w19
	bl	SCDDRV_CanNotSelectInst
	uxtb	w0, w0
	cbz	w0, .L1343
.L1330:
	subs	w20, w20, #1
	bne	.L1337
	mov	w0, -3
.L1336:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1343:
	sxtw	x27, w19
	ldr	x0, [x23]
	lsl	x1, x27, 4
	ldr	x26, [x22, x1]
	blr	x0
	add	x28, x26, 184320
	ldr	w1, [x28, 312]
	subs	w1, w0, w1
	bmi	.L1344
	ldrsh	w2, [x26, 2]
	cmp	w2, 1
	beq	.L1345
.L1332:
	str	w0, [x28, 312]
	ldrsb	w0, [x26]
	cmp	w0, 1
	beq	.L1346
.L1334:
	strb	wzr, [x26, 1]
.L1335:
	ldr	x0, [x24, x27, lsl 3]
	mov	w1, w21
	ldr	w0, [x0, 84]
	str	w0, [x28, 592]
	mov	x0, x26
	bl	CutStreamWithSCD
	cmn	w0, #6
	cset	w1, eq
	strb	w1, [x26]
	cbnz	w0, .L1330
	ldr	x3, .LC352
	add	x2, x22, 168
	str	w19, [x25]
	mov	w1, 1
	mov	w0, w19
	mov	w4, 4561
	add	x3, x3, 1144
	add	x2, x2, x27, lsl 2
	str	w1, [x28, 256]
	bl	RecordPOS
	mov	w0, 0
	b	.L1336
	.p2align 3
.L1344:
	str	w0, [x28, 312]
	ldrsh	w1, [x26, 2]
	cmp	w1, 1
	beq	.L1330
	str	w0, [x28, 312]
	ldrsb	w0, [x26]
	cmp	w0, 1
	bne	.L1334
.L1346:
	mov	x0, x26
	bl	SCDDRV_ProcessSegFull
	b	.L1335
	.p2align 3
.L1345:
	cmp	w1, 499
	bhi	.L1332
	b	.L1330
	.size	SM_DoNextInstance.part.23, .-SM_DoNextInstance.part.23
	.align	3
.LC349:
	.xword	.LANCHOR0
	.align	3
.LC350:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC351:
	.xword	s_pstVfmwChan
	.align	3
.LC352:
	.xword	.LANCHOR2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_DoNextInstance
	.type	SM_DoNextInstance, %function
SM_DoNextInstance:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x2, .LC354
	add	x2, x2, x19, sxtw 2
	ldr	w0, [x2, 144]
	cbz	w0, .L1348
	cmp	w0, 1
	mov	w0, -3
	beq	.L1351
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1348:
	mov	x1, x20
	mov	w0, w19
	bl	SM_DoNextInstance.part.23
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1351:
	mov	w1, 2
	str	w1, [x2, 144]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SM_DoNextInstance, .-SM_DoNextInstance
	.align	3
.LC354:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_RecordGlobalState
	.type	SCDDRV_RecordGlobalState, %function
SCDDRV_RecordGlobalState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC355
	ldr	x0, [x0]
	blr	x0
	sxtw	x2, w19
	ldr	x5, .LC356
	lsl	x1, x2, 4
	sub	x1, x1, x2
	add	x1, x5, x1, lsl 2
	ldr	w3, [x1, 48]
	cbz	w3, .L1352
	ldr	w6, [x1, 44]
	add	w4, w6, 49152
	add	w4, w4, 848
	cmp	w3, w4
	bhi	.L1355
	ldr	w4, [x1, 52]
.L1356:
	lsl	x1, x2, 4
	sub	w3, w0, w3
	sub	x2, x1, x2
	sub	w0, w0, w6
	add	w3, w3, w4
	cmp	w0, 999
	add	x2, x5, x2, lsl 2
	stp	wzr, w3, [x2, 48]
	bls	.L1352
	lsl	w1, w3, 6
	str	wzr, [x2, 44]
	sub	w1, w1, w3
	lsl	w1, w1, 1
	sub	w3, w1, w3
	lsl	w3, w3, 3
	udiv	w0, w3, w0
	str	w0, [x2, 56]
.L1352:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1355:
	mov	w6, w3
	mov	w4, 0
	str	w3, [x1, 44]
	b	.L1356
	.size	SCDDRV_RecordGlobalState, .-SCDDRV_RecordGlobalState
	.align	3
.LC355:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC356:
	.xword	g_VfmwGlobalStat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_MoveRawByOmxPath
	.type	SCDDRV_MoveRawByOmxPath, %function
SCDDRV_MoveRawByOmxPath:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	sbfiz	x19, x19, 4, 32
	bl	_mcount
	str	wzr, [x29, 44]
	ldr	x0, .LC357
	ldr	x19, [x0, x19]
	ldr	w20, [x19, 60]
	cmp	w20, 1
	beq	.L1369
.L1358:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1369:
	add	x1, x29, 44
	add	x0, x19, 88
	bl	GetRawStreamNum
	cbnz	w0, .L1370
.L1361:
	ldrsb	w20, [x19, 2]
	cmp	w20, 1
	bne	.L1358
	ldr	w1, [x19, 68]
	ldr	w0, [x29, 44]
	cmp	w1, w0
	bne	.L1358
	mov	x0, x19
	bl	SM_MoveRawData
	cbz	w0, .L1358
	ldr	x2, .LC361
	mov	w1, 4619
	mov	w0, w20
	add	x19, x19, 184320
	bl	dprint_normal
	ldr	w0, [x19, 240]
	bl	SM_Reset
	b	.L1358
	.p2align 3
.L1370:
	ldr	x2, .LC359
	mov	w1, 4611
	mov	w0, w20
	bl	dprint_normal
	b	.L1361
	.size	SCDDRV_MoveRawByOmxPath, .-SCDDRV_MoveRawByOmxPath
	.align	3
.LC357:
	.xword	.LANCHOR0
	.align	3
.LC359:
	.xword	.LC358
	.align	3
.LC361:
	.xword	.LC360
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_SCDIntServeProc
	.type	SM_SCDIntServeProc, %function
SM_SCDIntServeProc:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L1386
	ldr	x19, .LC364
	mov	w0, 0
	ldr	x1, [x19, 24]
	blr	x1
	ldr	x20, .LC365
	ldr	w0, [x20, 136]
	add	w0, w0, 2112
	bl	MEM_ReadPhyWord
	tbnz	x0, 0, .L1387
.L1374:
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1386:
	ldr	x3, .LC362
	mov	w4, 4634
	ldr	x2, .LC363
	mov	w1, w4
	add	x3, x3, 1168
	mov	w0, 32
	bl	dprint_normal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1387:
	ldr	w0, [x20, 136]
	mov	w1, 1
	add	x21, x20, 64
	add	w0, w0, 2084
	bl	MEM_WritePhyWord
	ldp	w1, w22, [x21, 48]
	sbfiz	x0, x22, 4, 32
	cmp	w1, wzr
	ldr	x23, [x20, x0]
	ccmp	x23, xzr, 4, ne
	beq	.L1388
	ldr	x3, .LC362
	mov	w4, 4654
	add	x2, x20, 184
	mov	w1, 2
	add	x3, x3, 1168
	mov	w0, w22
	bl	RecordPOS
	mov	w0, 0
	bl	SCDDRV_RecordGlobalState
	ldr	w0, [x21, 56]
	cmp	w0, 1
	beq	.L1389
.L1376:
	ldr	x1, [x19, 256]
	mov	w0, 1
	blr	x1
	ldr	x1, [x19, 256]
	mov	w0, 0
	blr	x1
	b	.L1374
	.p2align 3
.L1388:
	ldr	x1, [x19, 256]
	mov	w0, 1
	str	wzr, [x21, 56]
	blr	x1
	b	.L1374
	.p2align 3
.L1389:
	add	x21, x23, 184320
	ldr	w0, [x21, 256]
	cmp	w0, 1
	beq	.L1390
.L1377:
	ldr	w0, [x20, 144]
	str	wzr, [x21, 248]
	cbz	w0, .L1380
	cmp	w0, 1
	beq	.L1391
.L1381:
	ldr	x1, [x19, 256]
	mov	w0, 1
	str	wzr, [x20, 120]
	blr	x1
	b	.L1376
.L1380:
	add	x1, x29, 76
	mov	w0, 0
	bl	SM_DoNextInstance.part.23
	cbnz	w0, .L1381
	ldr	w2, [x29, 76]
	mov	w1, 1
	ldr	x0, [x19]
	stp	w2, w1, [x20, 116]
	blr	x0
	str	w0, [x20, 124]
	b	.L1376
.L1390:
	add	x0, x21, 168
	ldr	w1, [x0, 8]
	cmp	w1, 3
	beq	.L1392
	mov	w2, 2
	mov	w1, 0
	str	w2, [x0, 8]
	mov	x0, x23
	bl	ProcessScdReturn.part.22
.L1379:
	mov	w0, w22
	bl	SCDDRV_MoveRawByOmxPath
	b	.L1377
.L1391:
	mov	w0, 2
	str	w0, [x20, 144]
	b	.L1381
.L1392:
	mov	w1, 2
	str	w1, [x0, 8]
	b	.L1379
	.size	SM_SCDIntServeProc, .-SM_SCDIntServeProc
	.align	3
.LC362:
	.xword	.LANCHOR2
	.align	3
.LC363:
	.xword	.LC80
	.align	3
.LC364:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC365:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_CheckDevice
	.type	SCDDRV_CheckDevice, %function
SCDDRV_CheckDevice:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L1403
	ldr	x24, .LC369
	mov	w4, 4706
	ldr	x23, .LC367
	mov	w5, 0
	add	x19, x24, 64
	ldr	x22, .LC371
	add	x21, x23, 1192
	ldr	w6, [x19, 56]
	mov	x3, x21
	mov	x2, x22
	mov	w1, w4
	mov	w0, 21
	bl	dprint_normal
	ldr	w20, [x19, 56]
	cbz	w20, .L1404
	mov	w4, 4715
	mov	w6, w20
	mov	w5, 0
	mov	x3, x21
	mov	x2, x22
	mov	w1, w4
	mov	w0, 21
	bl	dprint_normal
	ldr	x20, .LC374
	ldr	x0, [x20]
	blr	x0
	ldr	w5, [x19, 60]
	cmp	w0, w5
	bcs	.L1397
	str	w0, [x19, 60]
.L1398:
	mov	w4, 4753
	ldr	x2, .LC376
	mov	w5, 0
	add	x3, x23, 1192
	mov	w1, w4
	mov	w0, 21
	mov	w20, 1
	bl	dprint_normal
.L1402:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1397:
	sub	w5, w0, w5
	mov	w0, 5000
	cmp	w5, w0
	bls	.L1398
	ldr	x2, .LC378
	mov	w4, 0
	ldr	w3, [x19, 52]
	mov	w1, 4727
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	bl	ResetSCD
	str	wzr, [x19, 56]
	ldr	x1, [x20, 256]
	mov	w0, 1
	blr	x1
	ldr	w0, [x19, 52]
	sbfiz	x1, x0, 4, 32
	ldr	x1, [x24, x1]
	cbz	x1, .L1400
	add	x1, x1, 184320
	str	wzr, [x1, 248]
.L1400:
	bl	DeleteLastSendRaw
	mov	w20, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1404:
	mov	w4, 4710
	ldr	x2, .LC373
	mov	x3, x21
	mov	w5, 0
	mov	w1, w4
	mov	w0, 21
	bl	dprint_normal
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1403:
	ldr	x3, .LC367
	mov	w4, 4703
	ldr	x2, .LC368
	mov	w1, w4
	add	x3, x3, 1192
	mov	w0, 32
	mov	w20, -1
	bl	dprint_normal
	b	.L1402
	.size	SCDDRV_CheckDevice, .-SCDDRV_CheckDevice
	.align	3
.LC367:
	.xword	.LANCHOR2
	.align	3
.LC368:
	.xword	.LC40
	.align	3
.LC369:
	.xword	.LANCHOR0
	.align	3
.LC371:
	.xword	.LC370
	.align	3
.LC373:
	.xword	.LC372
	.align	3
.LC374:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC376:
	.xword	.LC375
	.align	3
.LC378:
	.xword	.LC377
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SCDDRV_ActivateSCD
	.type	SCDDRV_ActivateSCD, %function
SCDDRV_ActivateSCD:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L1412
	ldr	x19, .LC383
	ldr	w0, [x19, 144]
	cbz	w0, .L1408
	cmp	w0, 1
	beq	.L1413
.L1405:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1408:
	add	x1, x29, 44
	mov	w0, 0
	bl	SM_DoNextInstance.part.23
	cbnz	w0, .L1405
	ldr	x0, .LC384
	mov	w1, 1
	ldr	w2, [x29, 44]
	stp	w2, w1, [x19, 116]
	ldr	x0, [x0]
	blr	x0
	str	w0, [x19, 124]
	ldr	x3, .LC381
	mov	w4, 4772
	ldr	x2, .LC386
	mov	w1, w4
	add	x3, x3, 1216
	mov	w0, 21
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1412:
	ldr	x3, .LC381
	mov	w4, 4763
	ldr	x2, .LC382
	mov	w1, w4
	add	x3, x3, 1216
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1413:
	mov	w0, 2
	str	w0, [x19, 144]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	SCDDRV_ActivateSCD, .-SCDDRV_ActivateSCD
	.align	3
.LC381:
	.xword	.LANCHOR2
	.align	3
.LC382:
	.xword	.LC80
	.align	3
.LC383:
	.xword	.LANCHOR0
	.align	3
.LC384:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC386:
	.xword	.LC385
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SM_Wakeup
	.type	SM_Wakeup, %function
SM_Wakeup:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x0, x30
	mov	x19, 0
	bl	_mcount
	ldr	x20, .LC388
.L1416:
	lsl	x0, x19, 4
	ldr	x0, [x20, x0]
	add	x1, x0, 184320
	cbz	x0, .L1415
	ldr	w0, [x1, 256]
	cmp	w0, 1
	beq	.L1423
.L1415:
	add	x19, x19, 1
	cmp	x19, 4
	bne	.L1416
	ldr	x19, .LC389
	mov	w5, 1
	ldr	x2, .LC391
	mov	w4, 0
	add	x19, x19, 1240
	mov	w1, 4792
	mov	x3, x19
	mov	w0, 21
	bl	dprint_normal
	mov	w0, 0
	bl	SCDDRV_CheckDevice
	cbz	w0, .L1417
	mov	w4, 4801
	ldr	x2, .LC393
	mov	x3, x19
	mov	w5, 0
	mov	w1, w4
	mov	w0, 21
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1417:
	mov	w4, 4796
	ldr	x2, .LC395
	mov	x3, x19
	mov	w5, 0
	mov	w1, w4
	mov	w0, 21
	bl	dprint_normal
	mov	w0, 0
	bl	SCDDRV_ActivateSCD
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1423:
	mov	w0, w19
	bl	FillRawData
	b	.L1415
	.size	SM_Wakeup, .-SM_Wakeup
	.align	3
.LC388:
	.xword	.LANCHOR0
	.align	3
.LC389:
	.xword	.LANCHOR2
	.align	3
.LC391:
	.xword	.LC390
	.align	3
.LC393:
	.xword	.LC392
	.align	3
.LC395:
	.xword	.LC394
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PrintScdRawState
	.type	PrintScdRawState, %function
PrintScdRawState:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	str	wzr, [x29, 108]
	cmp	w19, 3
	bhi	.L1439
	mov	w0, 21
	bl	IsDprintTypeEnable
	cbnz	w0, .L1440
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1439:
	ldr	x3, .LC397
	mov	w4, 4813
	ldr	x2, .LC398
	mov	w1, w4
	add	x3, x3, 1256
	mov	w0, 32
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1440:
	ldr	x5, .LC399
	sbfiz	x4, x19, 4, 32
	ldr	x2, .LC401
	mov	w3, w19
	mov	w1, 4818
	mov	w0, 21
	ldr	x22, [x5, x4]
	bl	dprint_normal
	add	x21, x22, 88
	ldr	x2, .LC403
	add	x23, x21, 49152
	mov	w1, 4820
	mov	w0, 21
	ldr	w3, [x23]
	bl	dprint_normal
	ldr	x2, .LC405
	mov	w1, 4821
	ldr	w3, [x23, 4]
	mov	w0, 21
	bl	dprint_normal
	ldr	x2, .LC407
	mov	w1, 4822
	ldr	w3, [x23, 8]
	mov	w0, 21
	bl	dprint_normal
	ldr	x2, .LC409
	mov	w1, 4823
	ldr	w3, [x23, 12]
	mov	w0, 21
	bl	dprint_normal
	ldr	x2, .LC411
	mov	w1, 4824
	ldr	w3, [x23, 16]
	mov	w0, 21
	bl	dprint_normal
	cmp	w20, 1
	beq	.L1428
.L1430:
	ldr	x2, .LC413
	mov	w3, w19
	mov	w1, 4844
	mov	w0, 21
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1428:
	add	x1, x29, 108
	mov	x0, x21
	bl	GetRawStreamNum
	cbnz	w0, .L1441
.L1429:
	ldr	w1, [x29, 108]
	add	x0, x21, 49152
	cmp	w1, wzr
	ldr	w23, [x0]
	ble	.L1430
	ldr	x27, .LC417
	mov	w28, 0
	ldr	x26, .LC419
	ldr	x25, .LC421
	.p2align 2
.L1431:
	add	w20, w28, w23
	mov	x2, x27
	mov	w1, 4837
	add	w28, w28, 1
	sxtw	x20, w20
	lsl	x0, x20, 2
	sub	x20, x0, x20
	mov	w0, 21
	lsl	x20, x20, 5
	add	x24, x22, x20
	add	x20, x21, x20
	ldr	w3, [x24, 92]
	bl	dprint_normal
	ldr	x3, [x20, 40]
	mov	x2, x26
	mov	w1, 4838
	mov	w0, 21
	bl	dprint_normal
	ldr	w3, [x24, 96]
	mov	x2, x25
	mov	w1, 4839
	mov	w0, 21
	bl	dprint_normal
	ldr	x2, .LC423
	mov	w1, 4840
	ldr	x3, [x20, 64]
	mov	w0, 21
	bl	dprint_normal
	ldr	w0, [x29, 108]
	cmp	w0, w28
	bgt	.L1431
	b	.L1430
.L1441:
	ldr	x3, .LC397
	mov	w4, 4830
	ldr	x2, .LC415
	mov	w1, w4
	add	x3, x3, 1280
	mov	w0, 20
	bl	dprint_normal
	b	.L1429
	.size	PrintScdRawState, .-PrintScdRawState
	.align	3
.LC397:
	.xword	.LANCHOR2
	.align	3
.LC398:
	.xword	.LC80
	.align	3
.LC399:
	.xword	.LANCHOR0
	.align	3
.LC401:
	.xword	.LC400
	.align	3
.LC403:
	.xword	.LC402
	.align	3
.LC405:
	.xword	.LC404
	.align	3
.LC407:
	.xword	.LC406
	.align	3
.LC409:
	.xword	.LC408
	.align	3
.LC411:
	.xword	.LC410
	.align	3
.LC413:
	.xword	.LC412
	.align	3
.LC415:
	.xword	.LC414
	.align	3
.LC417:
	.xword	.LC416
	.align	3
.LC419:
	.xword	.LC418
	.align	3
.LC421:
	.xword	.LC420
	.align	3
.LC423:
	.xword	.LC422
	.global	s_ScdRegPhyBaseAddr
	.global	g_ScdDrvParam
	.global	s_SmIIS
	.section	.rodata
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.9478, %object
	.size	__func__.9478, 17
__func__.9478:
	.string	"FillEopRawStream"
	.zero	7
.LC0:
	.byte	0
	.byte	0
	.byte	1
	.byte	11
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-73
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	-73
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	98
	.byte	0
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.align	3
.LANCHOR2 = . + 0
	.type	__func__.9506, %object
	.size	__func__.9506, 17
__func__.9506:
	.string	"FillEosRawStream"
	.zero	7
	.type	__func__.9531, %object
	.size	__func__.9531, 17
__func__.9531:
	.string	"FillVC1ExtraData"
	.zero	7
	.type	__func__.9536, %object
	.size	__func__.9536, 19
__func__.9536:
	.string	"FillDIVX3ExtraData"
	.zero	5
	.type	__func__.9541, %object
	.size	__func__.9541, 19
__func__.9541:
	.string	"FillREAL8ExtraData"
	.zero	5
	.type	__func__.9549, %object
	.size	__func__.9549, 14
__func__.9549:
	.string	"FillExtraData"
	.zero	2
	.type	__func__.9564, %object
	.size	__func__.9564, 21
__func__.9564:
	.string	"ReleaseRawStreamData"
	.zero	3
	.type	__func__.9574, %object
	.size	__func__.9574, 18
__func__.9574:
	.string	"ReadRawStreamData"
	.zero	6
	.type	__func__.9603, %object
	.size	__func__.9603, 17
__func__.9603:
	.string	"SCDDRV_IsScdIdle"
	.zero	7
	.type	__func__.9607, %object
	.size	__func__.9607, 20
__func__.9607:
	.string	"SCDDRV_SetStateIdle"
	.zero	4
	.type	__func__.9611, %object
	.size	__func__.9611, 20
__func__.9611:
	.string	"SCDDRV_SetStateWork"
	.zero	4
	.type	__func__.9618, %object
	.size	__func__.9618, 9
__func__.9618:
	.string	"ResetSCD"
	.zero	7
	.type	__func__.9640, %object
	.size	__func__.9640, 23
__func__.9640:
	.string	"SCDDRV_InsertRawPacket"
	.zero	1
	.type	__func__.9645, %object
	.size	__func__.9645, 12
__func__.9645:
	.string	"GetRawState"
	.zero	4
	.type	__func__.9654, %object
	.size	__func__.9654, 15
__func__.9654:
	.string	"GetFirstOffset"
	.zero	1
	.type	__func__.9666, %object
	.size	__func__.9666, 15
__func__.9666:
	.string	"SetFirstOffset"
	.zero	1
	.type	__func__.9675, %object
	.size	__func__.9675, 16
__func__.9675:
	.string	"DeleteRawPacket"
	.type	__func__.9689, %object
	.size	__func__.9689, 24
__func__.9689:
	.string	"DeleteRawPacketInBuffer"
	.type	__func__.9724, %object
	.size	__func__.9724, 18
__func__.9724:
	.string	"DeleteLastSendRaw"
	.zero	6
	.type	__func__.9729, %object
	.size	__func__.9729, 17
__func__.9729:
	.string	"GetRawStreamSize"
	.zero	7
	.type	__func__.9734, %object
	.size	__func__.9734, 16
__func__.9734:
	.string	"GetRawStreamNum"
	.type	__func__.9705, %object
	.size	__func__.9705, 16
__func__.9705:
	.string	"GetRawNumOffset"
	.type	__func__.9718, %object
	.size	__func__.9718, 13
__func__.9718:
	.string	"DeleteRawLen"
	.zero	3
	.type	__func__.9741, %object
	.size	__func__.9741, 21
__func__.9741:
	.string	"ConfigStreamSegArray"
	.zero	3
	.type	__func__.9745, %object
	.size	__func__.9745, 20
__func__.9745:
	.string	"ResetStreamSegArray"
	.zero	4
	.type	__func__.9754, %object
	.size	__func__.9754, 10
__func__.9754:
	.string	"CheckData"
	.zero	6
	.type	__func__.9759, %object
	.size	__func__.9759, 18
__func__.9759:
	.string	"CheckStartCodeCnt"
	.zero	6
	.type	__func__.9766, %object
	.size	__func__.9766, 12
__func__.9766:
	.string	"CheckStream"
	.zero	4
	.type	__func__.9774, %object
	.size	__func__.9774, 16
__func__.9774:
	.string	"InsertStreamSeg"
	.type	__func__.9782, %object
	.size	__func__.9782, 20
__func__.9782:
	.string	"SCDDRV_GetStreamSeg"
	.zero	4
	.type	__func__.9791, %object
	.size	__func__.9791, 17
__func__.9791:
	.string	"ReleaseStreamSeg"
	.zero	7
	.type	__FUNCTION__.9794, %object
	.size	__FUNCTION__.9794, 17
__FUNCTION__.9794:
	.string	"ReleaseStreamSeg"
	.zero	7
	.type	__func__.9801, %object
	.size	__func__.9801, 17
__func__.9801:
	.string	"GetSegStreamSize"
	.zero	7
	.type	__func__.9810, %object
	.size	__func__.9810, 18
__func__.9810:
	.string	"GetFreshSegStream"
	.zero	6
	.type	__func__.9814, %object
	.size	__func__.9814, 20
__func__.9814:
	.string	"SCDDRV_PrepareSleep"
	.zero	4
	.type	__func__.9821, %object
	.size	__func__.9821, 18
__func__.9821:
	.string	"SCDDRV_ForceSleep"
	.zero	6
	.type	__func__.9825, %object
	.size	__func__.9825, 17
__func__.9825:
	.string	"SCDDRV_ExitSleep"
	.zero	7
	.type	__func__.9829, %object
	.size	__func__.9829, 27
__func__.9829:
	.string	"ResetLastUnfinishedSegInfo"
	.zero	5
	.type	__func__.9850, %object
	.size	__func__.9850, 13
__func__.9850:
	.string	"SM_ClearInst"
	.zero	3
	.type	__func__.9865, %object
	.size	__func__.9865, 14
__func__.9865:
	.string	"SM_OpenSCDDrv"
	.zero	2
	.type	__func__.9886, %object
	.size	__func__.9886, 10
__func__.9886:
	.string	"SM_Config"
	.zero	6
	.type	__func__.9898, %object
	.size	__func__.9898, 9
__func__.9898:
	.string	"SM_Start"
	.zero	7
	.type	__func__.9903, %object
	.size	__func__.9903, 8
__func__.9903:
	.string	"SM_Stop"
	.type	__func__.9842, %object
	.size	__func__.9842, 9
__func__.9842:
	.string	"SM_Reset"
	.zero	7
	.type	__FUNCTION__.9843, %object
	.size	__FUNCTION__.9843, 9
__FUNCTION__.9843:
	.string	"SM_Reset"
	.zero	7
	.type	__func__.9870, %object
	.size	__func__.9870, 15
__func__.9870:
	.string	"SM_CloseSCDDrv"
	.zero	1
	.type	__func__.9910, %object
	.size	__func__.9910, 11
__func__.9910:
	.string	"SM_GetInfo"
	.zero	5
	.type	__func__.9952, %object
	.size	__func__.9952, 16
__func__.9952:
	.string	"SM_CopyRawToSeg"
	.type	__func__.9964, %object
	.size	__func__.9964, 17
__func__.9964:
	.string	"SM_ReadSegStream"
	.zero	7
	.type	__func__.9970, %object
	.size	__func__.9970, 20
__func__.9970:
	.string	"SM_ReleaseStreamSeg"
	.zero	4
	.type	__func__.9992, %object
	.size	__func__.9992, 18
__func__.9992:
	.string	"GetFreeSegBufSize"
	.zero	6
	.type	__func__.10143, %object
	.size	__func__.10143, 14
__func__.10143:
	.string	"CheckSegValid"
	.zero	2
	.type	__func__.10284, %object
	.size	__func__.10284, 17
__func__.10284:
	.string	"GetMpeg4ModeFlag"
	.zero	7
	.type	__func__.10356, %object
	.size	__func__.10356, 20
__func__.10356:
	.string	"ProcessH263ScdUpMsg"
	.zero	4
	.type	__FUNCTION__.10381, %object
	.size	__FUNCTION__.10381, 12
__FUNCTION__.10381:
	.string	"FillRawData"
	.zero	4
	.type	__func__.10414, %object
	.size	__func__.10414, 21
__func__.10414:
	.string	"SM_SeekPtsInRawArray"
	.zero	3
	.type	__func__.10430, %object
	.size	__func__.10430, 11
__func__.10430:
	.string	"SM_SeekPts"
	.zero	5
	.type	__FUNCTION__.10480, %object
	.size	__FUNCTION__.10480, 18
__FUNCTION__.10480:
	.string	"SM_DoNextInstance"
	.zero	6
	.type	__func__.10503, %object
	.size	__func__.10503, 19
__func__.10503:
	.string	"SM_SCDIntServeProc"
	.zero	5
	.type	__func__.10511, %object
	.size	__func__.10511, 19
__func__.10511:
	.string	"SCDDRV_CheckDevice"
	.zero	5
	.type	__func__.10517, %object
	.size	__func__.10517, 19
__func__.10517:
	.string	"SCDDRV_ActivateSCD"
	.zero	5
	.type	__func__.10526, %object
	.size	__func__.10526, 10
__func__.10526:
	.string	"SM_Wakeup"
	.zero	6
	.type	__func__.10538, %object
	.size	__func__.10538, 17
__func__.10538:
	.string	"PrintScdRawState"
	.zero	7
	.type	__FUNCTION__.10539, %object
	.size	__FUNCTION__.10539, 17
__FUNCTION__.10539:
	.string	"PrintScdRawState"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC5:
	ASCII(.string	"%s: pRawPacket = NULL!\n" )
.LC8:
	ASCII(.string	"%s: unkown standard type = %d!\n" )
.LC10:
	ASCII(.string	"%s: Length(%d)+FlagLen(%d) > BufLen(%d)\n" )
	.zero	7
.LC19:
	ASCII(.string	"%s: FlagLen(%d) > RawPacketLength(%d)\n" )
	.zero	1
.LC23:
	ASCII(.string	"Func: %s, buffer has no enough space,(act: %d, header_buf: %d)\n" )
.LC26:
	ASCII(.string	"Func: %s, buffer has no enough space,(act: %d, str_buf: %d)\n" )
	.zero	3
.LC28:
	ASCII(.string	"Func: %s, buffer has no enough space,(act:%d, str_buf: %d, header_buf: %d)\n" )
	.zero	4
.LC31:
	ASCII(.string	"Func: %s, buffer has no enough space, (act: %d, str_buf: %d)\n" )
	.zero	2
.LC37:
	ASCII(.string	"Func: %s, buffer has no enough space,(act:%d, str_buf:%d)\n" )
	.zero	5
.LC40:
	ASCII(.string	"%s %d: ASSERT return!\n" )
	.zero	1
.LC42:
	ASCII(.string	"%s: RawPacket Length %d <= 0\n" )
	.zero	2
.LC46:
	ASCII(.string	"Chan %d has been destroyed or the function pointer -- ReleaseRawStreamData pStreamIntf is NULL!" )
.LC50:
	ASCII(.string	"%s FATAL: inst %d been destroyed after unlock!\n" )
.LC53:
	ASCII(.string	"Chan %d has been destroyed or the function pointer -- ReadRawStreamData pStreamIntf is NULL!" )
	.zero	3
.LC59:
	ASCII(.string	"Chan %d FillEosRawStream failed!\n" )
	.zero	6
.LC61:
	ASCII(.string	"Chan %d FillExtraData failed!\n" )
	.zero	1
.LC63:
	ASCII(.string	"%s release this packet failed!\n" )
.LC68:
	ASCII(.string	"DKIF" )
	.zero	3
.LC70:
	ASCII(.string	"Save num:%d size:%d\n" )
	.zero	3
.LC76:
	ASCII(.string	"%s line %d ScdId %d overrun\n" )
	.zero	3
.LC80:
	ASCII(.string	"%s %d: ASSERT!\n" )
.LC91:
	ASCII(.string	"Ignore the reset request when the SCD[%d] clock is closed.\n" )
	.zero	4
.LC94:
	ASCII(.string	"SCD[%d]   ResetSCD ERROR!!!\n" )
	.zero	3
.LC117:
	ASCII(.string	"line: %d Get SmID fail!" )
.LC119:
	ASCII(.string	"DelRaw err PacketNum = %d, DelNum = %d\n" )
.LC121:
	ASCII(.string	"%s release RawPhyAddr = 0x%x, Len = %d\n" )
.LC132:
	ASCII(.string	"line: %d pSmInstArray is NULL!\n" )
.LC142:
	ASCII(.string	"line: %d DelNum = %d,RawPacketOffSet = %d,DelNum = %d,Next Length = %d,is_extern_eop_flag = %d\n\n" )
	.zero	7
.LC164:
	ASCII(.string	"Read_seg SegPacket.PhyAddr=0x%x, LenByte=%d, IsLastSeg=%d\n" )
	.zero	5
.LC168:
	ASCII(.string	"Release SegPacket.PhyAddr=0x%x,LenByte=%d,IsLastSeg=%d StreamID=%d\n" )
	.zero	4
.LC170:
	ASCII(.string	"Array out of bound in function %s\n" )
	.zero	5
.LC201:
	ASCII(.string	"%s: pDownMsgMemVirAddr = NULL\n" )
	.zero	1
.LC203:
	ASCII(.string	"%s: pUpMsgMemVirAddr = NULL\n" )
	.zero	3
.LC205:
	ASCII(.string	"%s: need size %d > alloc size %d\n" )
	.zero	6
.LC213:
	ASCII(.string	"line: %d, SmID = %d is not expected!\n" )
	.zero	2
.LC215:
	ASCII(.string	"line: %d, SmID = %d, ScdId = %d is not expected!\n" )
	.zero	6
.LC228:
	ASCII(.string	"line: %d, pScdInstance is NULL!\n" )
	.zero	7
.LC231:
	ASCII(.string	"%s %d FMW_OK !=  GetRawStreamNum !!\n" )
	.zero	3
.LC233:
	ASCII(.string	"%s %d force to clear SCDState = 0\n" )
	.zero	5
.LC247:
	ASCII(.string	"Raw packet TOO BIG! Can't copy to seg! Len: 0x%x\n" )
	.zero	6
.LC249:
	ASCII(.string	"line: %d, delet raw failed!\n" )
	.zero	3
.LC252:
	ASCII(.string	"[%s %d] VirAddr is null!!\n" )
	.zero	5
.LC257:
	ASCII(.string	"copy raw to seg fail\n" )
	.zero	2
.LC276:
	ASCII(.string	"InstID = %d EsRelease!\n" )
.LC280:
	ASCII(.string	"Cann't Start SCD, Ret = %d\n" )
	.zero	4
.LC282:
	ASCII(.string	"SM_CfgBuf Err! ret =%d\n" )
.LC288:
	ASCII(.string	"%d, pSegPacket->LenInByte = %d, SegBufFreeSize = %d\n" )
	.zero	3
.LC292:
	ASCII(.string	"Line: %d, The length of seg packet is invalid: %d\n" )
	.zero	5
.LC296:
	ASCII(.string	"Line: %d, start code num from scd state reg: %d, release raw packet anyway!\n" )
	.zero	3
.LC300:
	ASCII(.string	"[%s %d] pCurrentStartCodeVirAddr is null!!\n" )
	.zero	4
.LC304:
	ASCII(.string	"Line: %d, pNextStartCodeVirAddr is null!\n" )
	.zero	6
.LC307:
	ASCII(.string	"ValidSegNum = %d, FilteredSegNum = 0, release raw packet anyway!\n" )
	.zero	6
.LC313:
	ASCII(.string	"%s, %d, i = %d, j = %d, CurrentStartCodePhyAddr = 0x%x, pSmStateReg->ScdRollAddr = 0x%x, NextStartCodePhyAddr = 0x%x\n" )
	.zero	2
.LC320:
	ASCII(.string	"Chan%d raw full\n" )
	.zero	7
.LC323:
	ASCII(.string	"raw_pts: %lld\n" )
	.zero	1
.LC325:
	ASCII(.string	"Get RawPhyAddr=0x%x,Len=%d\n" )
	.zero	4
.LC327:
	ASCII(.string	"!!!push raw err!!!\n" )
	.zero	4
.LC338:
	ASCII(.string	"RawNum %lld <= RawNumInVfmw %lld\n" )
	.zero	6
.LC341:
	ASCII(.string	"No space for raw move, total:%d+%d > max:%d!\n" )
	.zero	2
.LC344:
	ASCII(.string	"scd buffer is full, reset scd!\n" )
.LC346:
	ASCII(.string	"(%d ms) not release stream seg, release anyway!\n" )
	.zero	7
.LC358:
	ASCII(.string	"SCD GetRawStreamNum Fail.\n" )
	.zero	5
.LC360:
	ASCII(.string	"Move raw data failed, force to reset scd.\n" )
	.zero	5
.LC370:
	ASCII(.string	"%s,%d,SCD(ID = %d) SCDState = %d\n" )
	.zero	6
.LC372:
	ASCII(.string	"%s,%d,SCD(ID = %d) return Idle!\n" )
	.zero	7
.LC375:
	ASCII(.string	"%s,%d,SCD(ID = %d) really busy!\n" )
	.zero	7
.LC377:
	ASCII(.string	"Chan %d SCD[%d] Time Out(%d ms), Reset it!\n" )
	.zero	4
.LC385:
	ASCII(.string	"%s,%d, active scd Success!\n" )
	.zero	4
.LC390:
	ASCII(.string	"%s prepare to check SCD(%d)/(MAX_SCD_NUM = %d)\n" )
.LC392:
	ASCII(.string	"%s,%d,SCD(ID = %d) return BUSY!!\n" )
	.zero	6
.LC394:
	ASCII(.string	"%s,%d,find idle SCD(ID = %d)\n" )
	.zero	2
.LC400:
	ASCII(.string	"********** SmID [%d] RawState begin **********\n" )
.LC402:
	ASCII(.string	"RawHead=%d\n" )
	.zero	4
.LC404:
	ASCII(.string	"RawTail=%d\n" )
	.zero	4
.LC406:
	ASCII(.string	"RawHistory=%d\n" )
	.zero	1
.LC408:
	ASCII(.string	"RawFirstPacketOffset=%d\n" )
	.zero	7
.LC410:
	ASCII(.string	"CurShowIndex=%d\n" )
	.zero	7
.LC412:
	ASCII(.string	"********** SmID [%d] RawState end   **********\n" )
.LC414:
	ASCII(.string	"%s %d FMW_OK !=  GetRawStreamNum!!\n" )
	.zero	4
.LC416:
	ASCII(.string	"RawPhyAddr=0x%x\n" )
	.zero	7
.LC418:
	ASCII(.string	"RawVirAddr=0x%x\n" )
	.zero	7
.LC420:
	ASCII(.string	"RawLength=%d\n" )
	.zero	2
.LC422:
	ASCII(.string	"RawPts=%ld\n" )
	.bss
	.align	3
.LANCHOR0 = . + 0
	.type	s_SmIIS, %object
	.size	s_SmIIS, 64
s_SmIIS:
	.zero	64
	.type	g_ScdDrvParam, %object
	.size	g_ScdDrvParam, 72
g_ScdDrvParam:
	.zero	72
	.type	s_ScdRegPhyBaseAddr, %object
	.size	s_ScdRegPhyBaseAddr, 4
s_ScdRegPhyBaseAddr:
	.zero	4
	.zero	4
	.type	s_eScdDrvSleepStage, %object
	.size	s_eScdDrvSleepStage, 4
s_eScdDrvSleepStage:
	.zero	4
	.zero	4
	.type	last_rec_pos_time.10376, %object
	.size	last_rec_pos_time.10376, 16
last_rec_pos_time.10376:
	.zero	16
	.type	LastRecPosTime.10477, %object
	.size	LastRecPosTime.10477, 16
LastRecPosTime.10477:
	.zero	16
	.type	last_rec_pos_time.10502, %object
	.size	last_rec_pos_time.10502, 16
last_rec_pos_time.10502:
	.zero	16
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
