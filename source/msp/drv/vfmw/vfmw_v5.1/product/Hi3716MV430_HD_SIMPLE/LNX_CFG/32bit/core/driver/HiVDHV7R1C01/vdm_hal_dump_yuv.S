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
	.file	"vdm_hal_dump_yuv.c"
	.text
	.align	2
	.global	VDMHAL_DumpYuv
	.type	VDMHAL_DumpYuv, %function
VDMHAL_DumpYuv:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #140)
	sub	sp, sp, #140
	ldr	r5, .L62
	mov	r4, r1
	str	r2, [fp, #-132]
	ldr	r3, [r5, #4]
	cmp	r3, #0
	beq	.L2
	ldr	r3, [r5, #16]
	cmp	r3, #0
	beq	.L2
	ldr	r7, [r1, #400]
	mov	r3, #0
	ldr	r6, [r1, #408]
	str	r3, [fp, #-104]
	mov	r0, r7
	str	r3, [fp, #-100]
	str	r3, [fp, #-96]
	str	r3, [fp, #-92]
	str	r3, [fp, #-88]
	str	r3, [fp, #-84]
	bl	MEM_Phy2Vir
	mov	r8, r0
	str	r0, [fp, #-128]
	mov	r0, r6
	bl	MEM_Phy2Vir
	mov	r3, r8
	cmp	r8, #0
	cmpne	r0, #0
	movne	r3, #0
	moveq	r3, #1
	strne	r3, [fp, #-136]
	beq	.L55
.L5:
	ldrb	r2, [r4, #369]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L56
	ldrb	r3, [r4, #156]	@ zero_extendqisi2
	ldr	ip, [r4, #392]
	tst	r3, #28
	ldr	r7, .L62+4
	ldr	r3, [r5, #4]
	str	r2, [fp, #-76]
	moveq	r8, #1
	str	r2, [fp, #-68]
	movne	r8, #0
	ldr	r2, .L62+8
	cmp	ip, #10
	add	r6, r3, #2080768
	add	r5, r3, #2605056
	add	lr, r3, #6225920
	add	r1, r3, #3129344
	add	r5, r5, #6144
	add	lr, lr, #40960
	str	r5, [r2, #8]
	add	r6, r6, #8192
	str	lr, [r2, #16]
	add	r1, r1, #4096
	str	r3, [r2]
	str	r6, [r2, #4]
	str	r1, [r2, #12]
	ldr	r5, [r4, #32]
	ldr	r2, [r7]
	ldr	r9, [r4, #36]
	ldr	lr, [r4, #372]
	beq	.L57
	str	r3, [fp, #-120]
	add	r3, r3, #5177344
	add	r3, r3, #45056
	ldr	r7, [r4, #388]
	cmp	ip, #0
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-128]
	moveq	ip, #8
	str	r6, [fp, #-112]
	str	r1, [fp, #-116]
	str	r3, [fp, #-80]
	str	r0, [fp, #-72]
	str	lr, [fp, #-52]
	str	r7, [fp, #-48]
.L12:
	ldrb	r3, [r4, #158]	@ zero_extendqisi2
	cmp	r2, ip
	mov	r4, #0
	str	ip, [sp, #24]
	eor	r3, r3, #2
	movgt	r2, #8
	ubfx	r3, r3, #1, #1
	str	lr, [sp, #8]
	str	r3, [sp, #28]
	mov	r1, #172
	str	r3, [sp, #12]
	mov	r0, #32
	str	r3, [fp, #-56]
	str	r2, [fp, #-60]
	ldr	r3, .L62+12
	ldr	r2, .L62+16
	str	r8, [sp, #20]
	stmia	sp, {r5, r9}
	str	r4, [sp, #16]
	str	ip, [fp, #-64]
	bl	dprint_normal
	sub	r3, fp, #120
	str	r4, [sp]
	mov	r2, r9
	mov	r1, r5
	sub	r0, fp, #80
	bl	IMAGE_ConvertTo2D
	ldr	r3, [fp, #-64]
	cmp	r3, #10
	beq	.L58
	mul	r3, r5, r9
	ldr	r0, [fp, #-120]
	str	r3, [fp, #-144]
.L18:
	ldr	r3, .L62+20
	ldr	r2, [fp, #-132]
	ldr	r1, [fp, #-144]
	str	r3, [fp, #-148]
	ldr	r3, [r3, #44]
	blx	r3
.L19:
	ldr	r3, [fp, #-64]
	cmp	r3, #10
	beq	.L59
	movs	r9, r9, lsr #1
	ldr	r8, [fp, #-112]
	beq	.L26
.L24:
	ldr	r2, .L62+8
	mov	r7, #0
	mov	r4, r5, lsr #1
	mov	r6, r7
	ldr	r0, [r2, #4]
	ldr	r10, [r2, #8]
	mov	r2, r5, asl #1
	str	r2, [fp, #-140]
.L34:
	cmp	r3, #10
	beq	.L27
	cmp	r4, #0
	beq	.L29
	mov	r1, r7, lsr #1
	add	r2, r8, #1
	add	lr, r4, r1
	add	r3, r10, r1
	add	lr, r10, lr
	add	r1, r0, r1
.L33:
	ldrb	ip, [r2, #-1]	@ zero_extendqisi2
	strb	ip, [r3], #1
	cmp	r3, lr
	ldrb	ip, [r2], #2	@ zero_extendqisi2
	strb	ip, [r1], #1
	bne	.L33
	ldr	r3, [fp, #-64]
.L29:
	add	r8, r8, r5
.L32:
	add	r6, r6, #1
	add	r7, r7, r5
	cmp	r6, r9
	bcc	.L34
.L25:
	cmp	r3, #10
	ldreq	r3, [fp, #-144]
	moveq	r4, r3, lsr #1
	beq	.L53
.L35:
	ldr	r3, [fp, #-144]
	mov	r4, r3, lsr #2
.L53:
	ldr	r5, [fp, #-148]
	mov	r1, r4
	ldr	r6, [fp, #-132]
	ldr	r3, [r5, #44]
	mov	r2, r6
	blx	r3
	ldr	r0, .L62+8
	ldr	r3, [r5, #44]
	mov	r1, r4
	mov	r2, r6
	ldr	r0, [r0, #8]
	blx	r3
	ldr	r3, [fp, #-136]
	cmp	r3, #1
	movne	r0, #0
	bne	.L4
.L60:
	ldr	r3, .L62+20
	ldr	r0, [fp, #-128]
	ldr	r3, [r3, #164]
	blx	r3
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L56:
	ldr	r3, .L62+24
	mov	r1, #111
	ldr	r2, .L62+28
	mov	r0, #32
	bl	dprint_normal
	ldr	r3, [fp, #-136]
	cmp	r3, #1
	movne	r0, #0
	beq	.L60
.L4:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L27:
	cmp	r4, #0
	beq	.L30
	bic	r1, r7, #1
	add	r2, r8, #2
	add	ip, r10, r1
	add	r1, r0, r1
	mov	r3, #0
.L31:
	ldrh	lr, [r2, #-2]
	add	r3, r3, #1
	cmp	r3, r4
	strh	lr, [ip], #2	@ movhi
	ldrh	lr, [r2], #4
	strh	lr, [r1], #2	@ movhi
	bne	.L31
	ldr	r3, [fp, #-64]
.L30:
	ldr	r2, [fp, #-140]
	add	r8, r8, r2
	b	.L32
.L55:
	ldr	r3, .L62+20
	sub	r0, fp, #104
	str	r7, [fp, #-96]
	ldr	r3, [r3, #160]
	blx	r3
	subs	r3, r0, #0
	str	r3, [fp, #-128]
	beq	.L61
	mov	r3, #1
	str	r3, [fp, #-136]
	ldr	r3, [fp, #-128]
	rsb	r0, r7, r6
	add	r0, r3, r0
	b	.L5
.L59:
	ldr	r2, [fp, #-144]
	cmp	r2, #0
	ldreq	r2, .L62+8
	ldreq	r8, [r2, #16]
	beq	.L22
	ldr	r3, .L62+8
	ldr	r0, [fp, #-144]
	ldr	r8, [r3, #16]
	mov	r3, #0
	mov	r1, r8
.L23:
	ldr	r2, [fp, #-108]
	add	r1, r1, #8
	ldr	ip, [fp, #-112]
	ldrb	r2, [r2, r3, lsr #2]	@ zero_extendqisi2
	ldrb	ip, [ip, r3]	@ zero_extendqisi2
	and	r2, r2, #3
	add	r2, r2, ip, lsl #2
	strh	r2, [r1, #-8]	@ movhi
	ldr	ip, [fp, #-112]
	ldr	r2, [fp, #-108]
	add	ip, ip, r3
	ldrb	r2, [r2, r3, lsr #2]	@ zero_extendqisi2
	ldrb	ip, [ip, #1]	@ zero_extendqisi2
	ubfx	r2, r2, #2, #2
	add	r2, r2, ip, lsl #2
	strh	r2, [r1, #-6]	@ movhi
	ldr	ip, [fp, #-112]
	ldr	r2, [fp, #-108]
	add	ip, ip, r3
	ldrb	r2, [r2, r3, lsr #2]	@ zero_extendqisi2
	ldrb	ip, [ip, #2]	@ zero_extendqisi2
	ubfx	r2, r2, #4, #2
	add	r2, r2, ip, lsl #2
	strh	r2, [r1, #-4]	@ movhi
	ldr	ip, [fp, #-112]
	ldr	r2, [fp, #-108]
	add	ip, ip, r3
	ldrb	r2, [r2, r3, lsr #2]	@ zero_extendqisi2
	add	r3, r3, #4
	ldrb	ip, [ip, #3]	@ zero_extendqisi2
	cmp	r3, r0
	mov	r2, r2, lsr #6
	add	r2, r2, ip, lsl #2
	strh	r2, [r1, #-2]	@ movhi
	bcc	.L23
	ldr	r3, [fp, #-64]
.L22:
	movs	r9, r9, lsr #1
	ldreq	r2, .L62+8
	ldreq	r0, [r2, #4]
	bne	.L24
	b	.L25
.L58:
	mul	r3, r5, r9
	cmp	r3, r4
	str	r3, [fp, #-144]
	ldr	r3, .L62+8
	ldrne	r2, [fp, #-144]
	ldr	r0, [r3, #16]
	movne	r1, r0
	beq	.L16
.L17:
	ldr	r3, [fp, #-116]
	add	r1, r1, #8
	ldr	ip, [fp, #-120]
	ldrb	r3, [r3, r4, lsr #2]	@ zero_extendqisi2
	ldrb	ip, [ip, r4]	@ zero_extendqisi2
	and	r3, r3, #3
	add	r3, r3, ip, lsl #2
	strh	r3, [r1, #-8]	@ movhi
	ldr	ip, [fp, #-120]
	ldr	r3, [fp, #-116]
	add	ip, ip, r4
	ldrb	r3, [r3, r4, lsr #2]	@ zero_extendqisi2
	ldrb	ip, [ip, #1]	@ zero_extendqisi2
	ubfx	r3, r3, #2, #2
	add	r3, r3, ip, lsl #2
	strh	r3, [r1, #-6]	@ movhi
	ldr	ip, [fp, #-120]
	ldr	r3, [fp, #-116]
	add	ip, ip, r4
	ldrb	r3, [r3, r4, lsr #2]	@ zero_extendqisi2
	ldrb	ip, [ip, #2]	@ zero_extendqisi2
	ubfx	r3, r3, #4, #2
	add	r3, r3, ip, lsl #2
	strh	r3, [r1, #-4]	@ movhi
	ldr	ip, [fp, #-120]
	ldr	r3, [fp, #-116]
	add	ip, ip, r4
	ldrb	r3, [r3, r4, lsr #2]	@ zero_extendqisi2
	add	r4, r4, #4
	ldrb	ip, [ip, #3]	@ zero_extendqisi2
	cmp	r4, r2
	mov	r3, r3, lsr #6
	add	r3, r3, ip, lsl #2
	strh	r3, [r1, #-2]	@ movhi
	bcc	.L17
	ldr	r3, [fp, #-64]
	cmp	r3, #10
	bne	.L18
.L16:
	ldr	r3, .L62+20
	ldr	r1, [fp, #-144]
	ldr	r2, [fp, #-132]
	str	r3, [fp, #-148]
	mov	r1, r1, asl #1
	ldr	r3, [r3, #44]
	blx	r3
	b	.L19
.L57:
	ldr	r10, [r4, #400]
	add	r7, r3, #5177344
	str	r3, [fp, #-120]
	add	r7, r7, #45056
	ldr	r3, [r4, #412]
	str	r7, [fp, #-108]
	str	r6, [fp, #-112]
	rsb	r3, r10, r3
	ldr	r7, [r4, #416]
	ldr	r6, [fp, #-128]
	str	r1, [fp, #-116]
	add	r6, r6, r3
	ldr	r1, [fp, #-128]
	rsb	r3, r10, r7
	ldr	r7, [r4, #388]
	add	r3, r1, r3
	str	r0, [fp, #-72]
	str	r1, [fp, #-80]
	str	lr, [fp, #-52]
	str	r6, [fp, #-76]
	str	r3, [fp, #-68]
	str	r7, [fp, #-48]
	b	.L12
.L2:
	ldr	r3, .L62+32
	movw	r1, #633
	ldr	r2, .L62+36
	mov	r0, #32
	bl	dprint_normal
	mvn	r0, #0
	b	.L4
.L26:
	ldr	r3, .L62+8
	ldr	r0, [r3, #4]
	b	.L35
.L61:
	ldr	r2, .L62+40
	mov	r1, #548
	mov	r0, #32
	bl	dprint_normal
	mvn	r0, #0
	b	.L4
.L63:
	.align	2
.L62:
	.word	g_SaveMemRecord
	.word	g_SaveYUVBitDepth
	.word	.LANCHOR1
	.word	.LANCHOR0+36
	.word	.LC3
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+16
	.word	.LC2
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_DumpYuv, .-VDMHAL_DumpYuv
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.8674, %object
	.size	__func__.8674, 15
__func__.8674:
	.ascii	"VDMHAL_DumpYuv\000"
	.space	1
	.type	__func__.8636, %object
	.size	__func__.8636, 18
__func__.8636:
	.ascii	"YUV_DumpDecCmpYuv\000"
	.space	2
	.type	__func__.8655, %object
	.size	__func__.8655, 15
__func__.8655:
	.ascii	"YUV_DumpDecYuv\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"%s save mem not ready!\012\000" )
.LC1:
	ASCII(.ascii	"Map pLumaVirAddr return error\012\000" )
	.space	1
.LC2:
	ASCII(.ascii	"%s not support now.\012\000" )
	.space	3
.LC3:
	ASCII(.ascii	"%s: Width=%d, Height=%d, Stride=%d, Is1D=%d, PicStr" )
	ASCII(.ascii	"ucture=%d, ChromaIDC=%d, RealBitDepth=%d, Is1D=%d\012" )
	ASCII(.ascii	"\000" )
	.bss
	.align	2
.LANCHOR1 = . + 0
	.type	g_pDumpMem_Y, %object
	.size	g_pDumpMem_Y, 4
g_pDumpMem_Y:
	.space	4
	.type	g_pDumpMem_U, %object
	.size	g_pDumpMem_U, 4
g_pDumpMem_U:
	.space	4
	.type	g_pDumpMem_V, %object
	.size	g_pDumpMem_V, 4
g_pDumpMem_V:
	.space	4
	.type	g_pDumpMem_2bit, %object
	.size	g_pDumpMem_2bit, 4
g_pDumpMem_2bit:
	.space	4
	.type	g_pPixelArray, %object
	.size	g_pPixelArray, 4
g_pPixelArray:
	.space	4
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
