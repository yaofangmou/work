#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal_dump_yuv.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	YUV_DumpDecYuv, %function
YUV_DumpDecYuv:
	sub	sp, sp, #208
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	stp	x19, x20, [sp, 48]
	stp	x21, x22, [sp, 64]
	stp	x23, x24, [sp, 80]
	str	x25, [sp, 96]
	mov	x19, x0
	mov	x0, x30
	mov	x22, x1
	mov	x25, x2
	mov	x23, x3
	bl	_mcount
	add	x1, x29, 120
	ldr	x0, .LC0
	ldr	x21, .LC1
	ldr	x2, .LC2
	stp	xzr, xzr, [x1]
	add	x1, x29, 136
	ldr	x0, [x0, 8]
	ldrb	w3, [x22, 156]
	ldr	w4, [x22, 392]
	stp	xzr, xzr, [x1]
	add	x1, x0, 2609152
	tst	w3, 28
	add	x1, x1, 2048
	add	x3, x0, 2088960
	stp	x3, x1, [x21]
	ldr	w1, [x2]
	add	x2, x0, 6266880
	cset	w5, eq
	str	x2, [x21, 16]
	cmp	w4, 10
	add	x2, x0, 3133440
	str	xzr, [x29, 168]
	stp	x2, x3, [x29, 96]
	ldp	w20, w24, [x22, 32]
	ldr	w6, [x22, 372]
	beq	.L44
	str	x0, [x29, 88]
	add	x0, x0, 5222400
	str	x0, [x29, 112]
	mov	w2, 8
	ldr	w0, [x22, 388]
	str	x25, [x29, 120]
	str	x23, [x29, 136]
	str	w6, [x29, 164]
	str	w0, [x29, 168]
	cbnz	w4, .L3
.L4:
	str	w5, [sp, 8]
	cmp	w2, w1
	mov	w3, 8
	mov	w4, w20
	ldrb	w0, [x22, 158]
	csel	w1, w1, w3, ge
	str	w2, [sp, 16]
	mov	w5, w24
	eor	x0, x0, 2
	ldr	x3, .LC3
	ubfx	x0, x0, 1, 1
	str	wzr, [sp]
	stp	w2, w1, [x29, 152]
	ldr	x2, .LC5
	mov	w7, w0
	mov	w1, 172
	str	w0, [x29, 160]
	str	w0, [sp, 24]
	mov	w0, 32
	bl	dprint_normal
	add	x0, x29, 120
	mov	w4, 0
	add	x3, x29, 88
	mov	w2, w24
	mov	w1, w20
	bl	IMAGE_ConvertTo2D
	ldr	w0, [x29, 152]
	cmp	w0, 10
	beq	.L45
	mul	w22, w20, w24
	ldr	x0, [x29, 88]
.L10:
	ldr	x23, .LC6
	mov	x2, x19
	mov	w1, w22
	ldr	x3, [x23, 88]
	blr	x3
.L11:
	ldr	w1, [x29, 152]
	cmp	w1, 10
	beq	.L46
	lsr	w24, w24, 1
	ldr	x3, [x29, 104]
	cbz	w24, .L18
.L16:
	ldp	x0, x6, [x21]
	lsr	w8, w20, 1
	ubfiz	x12, x20, 1, 31
	mov	w10, 0
	mov	w9, 0
	uxtw	x11, w20
	.p2align 2
.L26:
	cmp	w1, 10
	beq	.L19
	cbz	w8, .L21
	lsr	w1, w10, 1
	mov	w2, 1
	add	w7, w8, w1
	.p2align 2
.L25:
	sub	w5, w2, #1
	uxtw	x4, w1
	add	w1, w1, 1
	cmp	w7, w1
	ldrb	w5, [x3, x5]
	strb	w5, [x6, x4]
	ldrb	w5, [x3, w2, uxtw]
	add	w2, w2, 2
	strb	w5, [x0, x4]
	bne	.L25
	ldr	w1, [x29, 152]
.L21:
	add	x3, x3, x11
.L24:
	add	w9, w9, 1
	add	w10, w10, w20
	cmp	w9, w24
	bcc	.L26
.L17:
	cmp	w1, 10
	beq	.L47
.L27:
	lsr	w22, w22, 2
.L42:
	ldr	x3, [x23, 88]
	mov	x2, x19
	mov	w1, w22
	blr	x3
	ldr	x3, [x23, 88]
	mov	x2, x19
	ldr	x0, [x21, 8]
	mov	w1, w22
	blr	x3
	add	sp, x29, 0
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L19:
	cbz	w8, .L22
	and	w5, w10, -2
	mov	w4, 2
	mov	w2, 0
	.p2align 2
.L23:
	ubfiz	x7, x2, 2, 30
	uxtw	x1, w5
	add	w2, w2, 1
	add	w5, w5, 2
	cmp	w2, w8
	ldrh	w7, [x3, x7]
	strh	w7, [x6, x1]
	ldrh	w7, [x3, w4, uxtw]
	add	w4, w4, 4
	strh	w7, [x0, x1]
	bne	.L23
	ldr	w1, [x29, 152]
.L22:
	add	x3, x3, x12
	b	.L24
.L44:
	str	x0, [x29, 88]
	add	x0, x0, 5222400
	ldr	w3, [x22, 400]
	ldr	w2, [x22, 412]
	str	x0, [x29, 112]
	ldr	w0, [x22, 416]
	sub	w2, w2, w3
	add	x2, x25, x2
	str	x23, [x29, 136]
	sub	w0, w0, w3
	str	w6, [x29, 164]
	stp	x25, x2, [x29, 120]
	add	x25, x25, x0
	ldr	w0, [x22, 388]
	str	x25, [x29, 144]
	str	w0, [x29, 168]
.L3:
	mov	w2, w4
	b	.L4
.L47:
	lsr	w22, w22, 1
	b	.L42
.L46:
	ldr	x3, [x21, 16]
	cbz	w22, .L14
	mov	w0, 0
	.p2align 2
.L15:
	ldp	x1, x2, [x29, 104]
	ubfx	x4, x0, 2, 30
	add	w8, w0, 1
	add	w7, w0, 2
	add	w6, w0, 3
	ldrb	w1, [x1, w0, uxtw]
	ldrb	w5, [x2, x4]
	ubfiz	w2, w1, 2, 14
	and	w1, w5, 3
	add	w1, w1, w2
	strh	w1, [x3, w0, uxtw 1]
	add	w0, w0, 4
	ldp	x1, x2, [x29, 104]
	cmp	w0, w22
	ldrb	w2, [x2, x4]
	ldrb	w1, [x1, w8, uxtw]
	ubfx	x2, x2, 2, 2
	ubfiz	w1, w1, 2, 14
	add	w1, w2, w1
	strh	w1, [x3, w8, uxtw 1]
	ldp	x1, x2, [x29, 104]
	ldrb	w2, [x2, x4]
	ldrb	w1, [x1, w7, uxtw]
	ubfx	x2, x2, 4, 2
	ubfiz	w1, w1, 2, 14
	add	w1, w2, w1
	strh	w1, [x3, w7, uxtw 1]
	ldp	x1, x2, [x29, 104]
	ldrb	w1, [x1, w6, uxtw]
	ldrb	w2, [x2, x4]
	ubfiz	w1, w1, 2, 14
	add	w1, w1, w2, lsr 6
	strh	w1, [x3, w6, uxtw 1]
	bcc	.L15
	ldr	w1, [x29, 152]
.L14:
	lsr	w24, w24, 1
	cbnz	w24, .L16
	ldr	x0, [x21]
	b	.L17
	.p2align 3
.L45:
	mul	w22, w20, w24
	cbz	w22, .L48
	ldr	x0, [x21, 16]
	mov	w1, 0
	.p2align 2
.L9:
	ldp	x2, x3, [x29, 88]
	ubfx	x4, x1, 2, 30
	add	w8, w1, 1
	add	w7, w1, 2
	add	w6, w1, 3
	ldrb	w2, [x2, w1, uxtw]
	ldrb	w5, [x3, x4]
	ubfiz	w3, w2, 2, 14
	and	w2, w5, 3
	add	w2, w2, w3
	strh	w2, [x0, w1, uxtw 1]
	add	w1, w1, 4
	ldp	x2, x3, [x29, 88]
	cmp	w1, w22
	ldrb	w3, [x3, x4]
	ldrb	w2, [x2, w8, uxtw]
	ubfx	x3, x3, 2, 2
	ubfiz	w2, w2, 2, 14
	add	w2, w3, w2
	strh	w2, [x0, w8, uxtw 1]
	ldp	x2, x3, [x29, 88]
	ldrb	w3, [x3, x4]
	ldrb	w2, [x2, w7, uxtw]
	ubfx	x3, x3, 4, 2
	ubfiz	w2, w2, 2, 14
	add	w2, w3, w2
	strh	w2, [x0, w7, uxtw 1]
	ldp	x2, x3, [x29, 88]
	ldrb	w2, [x2, w6, uxtw]
	ldrb	w3, [x3, x4]
	ubfiz	w2, w2, 2, 14
	add	w2, w2, w3, lsr 6
	strh	w2, [x0, w6, uxtw 1]
	bcc	.L9
	ldr	w1, [x29, 152]
	mov	x3, x0
	cmp	w1, 10
	bne	.L10
.L8:
	ldr	x23, .LC6
	mov	x0, x3
	mov	x2, x19
	lsl	w1, w22, 1
	ldr	x3, [x23, 88]
	blr	x3
	b	.L11
.L18:
	ldr	x0, [x21]
	b	.L27
.L48:
	ldr	x3, [x21, 16]
	b	.L8
	.size	YUV_DumpDecYuv, .-YUV_DumpDecYuv
	.align	3
.LC0:
	.xword	g_SaveMemRecord
	.align	3
.LC1:
	.xword	.LANCHOR0
	.align	3
.LC2:
	.xword	g_SaveYUVBitDepth
	.align	3
.LC3:
	.xword	.LANCHOR1
	.align	3
.LC5:
	.xword	.LC4
	.align	3
.LC6:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_DumpYuv
	.type	VDMHAL_DumpYuv, %function
VDMHAL_DumpYuv:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x0, x30
	mov	x19, x1
	mov	x24, x2
	bl	_mcount
	ldr	x0, .LC7
	ldr	x1, [x0, 8]
	cbz	x1, .L50
	ldr	w0, [x0, 24]
	cbz	w0, .L50
	ldr	w22, [x19, 400]
	mov	w23, 0
	ldr	w21, [x19, 408]
	mov	w0, w22
	stp	xzr, xzr, [x29, 64]
	stp	xzr, xzr, [x29, 80]
	bl	MEM_Phy2Vir
	mov	x20, x0
	mov	w0, w21
	bl	MEM_Phy2Vir
	cmp	x20, xzr
	ccmp	x0, xzr, 4, ne
	cset	w1, eq
	cbnz	w1, .L64
.L53:
	ldrb	w1, [x19, 369]
	cbnz	w1, .L65
	mov	x3, x0
	mov	x1, x19
	mov	x2, x20
	mov	x0, x24
	mov	w19, 0
	bl	YUV_DumpDecYuv
	cbnz	w23, .L66
.L52:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L65:
	ldr	x3, .LC8
	mov	w1, 111
	ldr	x2, .LC15
	mov	w0, 32
	add	x3, x3, 32
	mov	w19, 0
	bl	dprint_normal
	cbz	w23, .L52
.L66:
	ldr	x1, .LC11
	mov	x0, x20
	ldr	x1, [x1, 328]
	blr	x1
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L64:
	ldr	x1, .LC11
	add	x0, x29, 64
	str	w22, [x29, 80]
	ldr	x1, [x1, 320]
	blr	x1
	mov	x20, x0
	cbz	x0, .L67
	sub	w21, w21, w22
	mov	w23, 1
	add	x0, x0, x21
	b	.L53
	.p2align 3
.L50:
	ldr	x3, .LC8
	mov	w1, 633
	ldr	x2, .LC10
	mov	w0, 32
	add	x3, x3, 16
	mov	w19, -1
	bl	dprint_normal
	b	.L52
.L67:
	ldr	x2, .LC13
	mov	w1, 548
	mov	w0, 32
	mov	w19, -1
	bl	dprint_normal
	b	.L52
	.size	VDMHAL_DumpYuv, .-VDMHAL_DumpYuv
	.align	3
.LC7:
	.xword	g_SaveMemRecord
	.align	3
.LC8:
	.xword	.LANCHOR1
	.align	3
.LC10:
	.xword	.LC9
	.align	3
.LC11:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC13:
	.xword	.LC12
	.align	3
.LC15:
	.xword	.LC14
	.section	.rodata
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.5986, %object
	.size	__func__.5986, 15
__func__.5986:
	.string	"YUV_DumpDecYuv"
	.zero	1
	.type	__func__.6005, %object
	.size	__func__.6005, 15
__func__.6005:
	.string	"VDMHAL_DumpYuv"
	.zero	1
	.type	__func__.5967, %object
	.size	__func__.5967, 18
__func__.5967:
	.string	"YUV_DumpDecCmpYuv"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC4:
	ASCII(.string	"%s: Width=%d, Height=%d, Stride=%d, Is1D=%d, PicStructure=%d, ChromaIDC=%d, RealBitDepth=%d, Is1D=%d\n" )
	.zero	2
.LC9:
	ASCII(.string	"%s save mem not ready!\n" )
.LC12:
	ASCII(.string	"Map pLumaVirAddr return error\n" )
	.zero	1
.LC14:
	ASCII(.string	"%s not support now.\n" )
	.bss
	.align	3
.LANCHOR0 = . + 0
	.type	g_pDumpMem_U, %object
	.size	g_pDumpMem_U, 8
g_pDumpMem_U:
	.zero	8
	.type	g_pDumpMem_V, %object
	.size	g_pDumpMem_V, 8
g_pDumpMem_V:
	.zero	8
	.type	g_pPixelArray, %object
	.size	g_pPixelArray, 8
g_pPixelArray:
	.zero	8
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
