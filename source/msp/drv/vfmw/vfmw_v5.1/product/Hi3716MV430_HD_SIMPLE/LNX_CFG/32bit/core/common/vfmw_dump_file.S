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
	.file	"vfmw_dump_file.c"
	.text
	.align	2
	.global	YUV_IsDumpEnable
	.type	YUV_IsDumpEnable, %function
YUV_IsDumpEnable:
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
	ldr	r3, .L7
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L6
.L4:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L6:
	ldr	r3, .L7+4
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	bne	.L4
	ldr	r3, .L7+8
	ldr	r0, [r3, r0, asl #2]
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L8:
	.align	2
.L7:
	.word	g_SaveDecYuvFileHandler
	.word	g_SaveDispYuvFileHandler
	.word	g_SaveReorderMetadataFileHandler
	UNWIND(.fnend)
	.size	YUV_IsDumpEnable, .-YUV_IsDumpEnable
	.align	2
	.global	YUV_DumpImage
	.type	YUV_DumpImage, %function
YUV_DumpImage:
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
	ldr	r4, .L32
	mov	r5, r0
	ldr	r2, .L32+4
	mov	r6, r1
	ldr	r3, [r4]
	ldr	r2, [r2]
	cmp	r3, r2
	bcc	.L30
	ldr	r2, .L32+8
	ldr	r2, [r2]
	cmp	r3, r2
	bhi	.L30
	ldr	r3, .L32+12
	ldr	r2, [r3, r0, asl #2]
	cmp	r2, #0
	beq	.L13
	ldr	r3, .L32+16
	ldr	r7, [r3, #160]
	cmp	r7, #0
	beq	.L15
	mov	r3, #0
	blx	r7
.L13:
	ldr	r3, .L32+20
	ldr	r2, [r3, r5, asl #2]
	cmp	r2, #0
	beq	.L15
	ldr	r3, .L32+16
	ldr	r7, [r3, #160]
	cmp	r7, #0
	beq	.L15
	mov	r3, #1
	mov	r1, r6
	mov	r0, r5
	blx	r7
.L15:
	ldr	r3, .L32+24
	ldr	r2, [r3, r5, asl #2]
	cmp	r2, #0
	beq	.L17
	ldr	r0, [r6, #280]
	ldr	r1, [r6, #272]
	cmp	r1, #0
	cmpne	r0, #0
	bne	.L31
.L17:
	ldr	r3, [r4]
.L30:
	add	r3, r3, #1
	mov	r0, #0
	str	r3, [r4]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L31:
	ldr	r3, .L32+28
	ldr	r3, [r3, #44]
	blx	r3
	b	.L17
.L33:
	.align	2
.L32:
	.word	g_SaveYuvCount
	.word	g_SaveYuvBegin
	.word	g_SaveYuvEnd
	.word	g_SaveDecYuvFileHandler
	.word	g_vdm_hal_fun_ptr
	.word	g_SaveDispYuvFileHandler
	.word	g_SaveReorderMetadataFileHandler
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	YUV_DumpImage, .-YUV_DumpImage
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
