#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vfmw_dump_file.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	YUV_IsDumpEnable
	.type	YUV_IsDumpEnable, %function
YUV_IsDumpEnable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC0
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L6
	mov	w0, 1
.L2:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L6:
	ldr	x1, .LC1
	mov	w0, 1
	ldr	x1, [x1, w19, sxtw 3]
	cbnz	x1, .L2
	ldr	x0, .LC2
	ldr	x0, [x0, w19, sxtw 3]
	cmp	x0, xzr
	cset	w0, ne
	b	.L2
	.size	YUV_IsDumpEnable, .-YUV_IsDumpEnable
	.align	3
.LC0:
	.xword	g_SaveDecYuvFileHandler
	.align	3
.LC1:
	.xword	g_SaveDispYuvFileHandler
	.align	3
.LC2:
	.xword	g_SaveReorderMetadataFileHandler
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	YUV_DumpImage
	.type	YUV_DumpImage, %function
YUV_DumpImage:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x19, .LC3
	ldr	x1, .LC4
	ldr	w0, [x19]
	ldr	w1, [x1]
	cmp	w0, w1
	bcc	.L29
	ldr	x1, .LC5
	ldr	w1, [x1]
	cmp	w0, w1
	bhi	.L29
	ldr	x0, .LC6
	ldr	x2, [x0, w20, sxtw 3]
	cbz	x2, .L11
	ldr	x0, .LC7
	ldr	x4, [x0, 320]
	cbz	x4, .L12
	mov	w3, 0
	mov	x1, x21
	mov	w0, w20
	blr	x4
.L11:
	ldr	x0, .LC8
	ldr	x2, [x0, w20, sxtw 3]
	cbz	x2, .L12
	ldr	x0, .LC7
	ldr	x4, [x0, 320]
	cbz	x4, .L12
	mov	w3, 1
	mov	x1, x21
	mov	w0, w20
	blr	x4
.L12:
	ldr	x0, .LC9
	ldr	x2, [x0, w20, sxtw 3]
	cbz	x2, .L13
	ldr	x0, [x21, 280]
	ldr	w1, [x21, 272]
	cmp	x0, xzr
	ccmp	w1, wzr, 4, ne
	bne	.L30
.L13:
	ldr	w0, [x19]
.L29:
	add	w0, w0, 1
	str	w0, [x19]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L30:
	ldr	x3, .LC10
	ldr	x3, [x3, 88]
	blr	x3
	ldr	w0, [x19]
	b	.L29
	.size	YUV_DumpImage, .-YUV_DumpImage
	.align	3
.LC3:
	.xword	g_SaveYuvCount
	.align	3
.LC4:
	.xword	g_SaveYuvBegin
	.align	3
.LC5:
	.xword	g_SaveYuvEnd
	.align	3
.LC6:
	.xword	g_SaveDecYuvFileHandler
	.align	3
.LC7:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC8:
	.xword	g_SaveDispYuvFileHandler
	.align	3
.LC9:
	.xword	g_SaveReorderMetadataFileHandler
	.align	3
.LC10:
	.xword	vfmw_Osal_Func_Ptr_S
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
