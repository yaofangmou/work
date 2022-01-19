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
	.file	"bitplane.c"
	.text
	.align	2
	.global	BPD_CfgReg
	.type	BPD_CfgReg, %function
BPD_CfgReg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	lr, .L34
	add	ip, r0, #12288
	mvn	r4, #0
	mov	r3, r0
	mvn	r0, #1
	ldr	r6, [lr, #4]
	mov	r5, #0
	str	r5, [fp, #-48]
	str	r4, [r6, #68]
	str	r0, [r6, #68]
	ldr	r7, [r1, #24]
	ldr	r4, [r1, #20]
	ldrb	r5, [ip, #3308]	@ zero_extendqisi2
	rsb	r4, r7, r4
	ldr	r0, [r1]
	cmp	r5, #0
	ubfx	r1, r4, #3, #2
	add	r1, r1, r7, lsr #3
	add	r0, r0, r1
	beq	.L2
	ldrb	r1, [r2, #362]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L29
.L3:
	ldrb	r1, [fp, #-47]	@ zero_extendqisi2
	orr	r1, r1, #16
	strb	r1, [fp, #-47]
	ldrb	r1, [r2, #197]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L30
.L5:
	ldrb	r1, [r2, #349]	@ zero_extendqisi2
	ldr	r5, [r2, #392]
	cmp	r1, #4
	ldrb	r8, [r2, #16]	@ zero_extendqisi2
	andne	r4, r1, #3
	ldrb	r1, [fp, #-46]	@ zero_extendqisi2
	moveq	r4, #3
	cmp	r5, #3
	bfi	r1, r5, #0, #2
	ldrb	r5, [fp, #-47]	@ zero_extendqisi2
	bfi	r1, r8, #2, #2
	strb	r1, [fp, #-46]
	bfi	r5, r4, #6, #2
	strb	r5, [fp, #-47]
	beq	.L31
.L8:
	ldr	r1, [r3, #3100]
	movw	r4, #21846
	movt	r4, 21845
	smull	r4, r5, r1, r4
	sub	r8, r5, r1, asr #31
	add	r8, r8, r8, lsl #1
	rsb	r8, r8, r1
	and	r8, r8, #3
.L12:
	ldr	r9, [r3, #3096]
	movw	r4, #21846
	movt	r4, 21845
	ldr	r1, [r3, #3272]
	ldr	r10, [r3, #3284]
	and	r7, r7, #7
	smull	r4, r5, r9, r4
	rsb	r1, r1, r0
	add	r10, r1, r10
	ldrb	r4, [fp, #-47]	@ zero_extendqisi2
	sub	r1, r5, r9, asr #31
	ldrb	r5, [fp, #-46]	@ zero_extendqisi2
	and	r10, r10, #15
	bfi	r4, r8, #2, #2
	add	r1, r1, r1, lsl #1
	and	r5, r5, #239
	rsb	r9, r1, r9
	add	r7, r7, r10, lsl #3
	bfi	r4, r9, #0, #2
	strb	r7, [fp, #-48]
	strb	r4, [fp, #-47]
	bfc	r5, #5, #1
	strb	r5, [fp, #-46]
	ldr	r1, [fp, #-48]
	str	r1, [r6, #4]
	ldr	r1, [lr, #4]
	ldr	r4, [r3, #3272]
	ldr	lr, [r3, #3284]
	rsb	r0, r4, r0
	add	r0, r0, lr
	str	r0, [r1, #8]
	ldrb	r0, [ip, #3308]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L13
	ldr	r2, [r2, #392]
	cmp	r2, #3
	beq	.L32
.L13:
	ldr	r2, [r3, #3100]
	sub	r2, r2, #1
	uxth	r2, r2
.L14:
	ldr	r0, [r3, #3096]
	mov	r4, #3
	strh	r2, [fp, #-46]	@ movhi
	mov	ip, #0
	sub	r2, r0, #1
	strh	r2, [fp, #-48]	@ movhi
	ldr	r2, [fp, #-48]
	mov	r0, ip
	str	ip, [fp, #-48]
	mov	r5, #0
	bfi	r5, r4, #4, #4
	str	r2, [r1, #12]
	ldr	lr, [r3, #3096]
	adds	r2, lr, #127
	addmi	r2, lr, #254
	mov	r2, r2, lsr r4
	and	r2, r2, #4080
	strh	r2, [fp, #-48]	@ movhi
	ldr	r2, [fp, #-48]
	str	ip, [fp, #-48]
	strb	r5, [fp, #-48]
	str	r2, [r1, #16]
	ldr	ip, [r3, #3200]
	strb	r4, [fp, #-47]
	ldr	r2, [fp, #-48]
	str	ip, [r1, #20]
	ldr	ip, [r3, #3204]
	str	ip, [r1, #24]
	ldr	ip, [r3, #3208]
	str	ip, [r1, #28]
	ldr	ip, [r3, #3212]
	str	ip, [r1, #32]
	ldr	ip, [r3, #3216]
	str	ip, [r1, #36]
	ldr	ip, [r3, #3220]
	str	ip, [r1, #40]
	ldr	r3, [r3, #3224]
	str	r3, [r1, #44]
	str	r2, [r1, #48]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2:
	ldrb	r1, [r2, #259]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L33
.L9:
	ldrb	r1, [fp, #-47]	@ zero_extendqisi2
	orr	r1, r1, #16
	strb	r1, [fp, #-47]
.L10:
	ldrb	r1, [r2, #251]	@ zero_extendqisi2
	ldrb	r5, [fp, #-47]	@ zero_extendqisi2
	cmp	r1, #4
	ldrb	r8, [r2]	@ zero_extendqisi2
	andne	r4, r1, #3
	ldrb	r1, [fp, #-46]	@ zero_extendqisi2
	moveq	r4, #3
	bfi	r5, r4, #6, #2
	and	r1, r1, #252
	strb	r5, [fp, #-47]
	bfi	r1, r8, #2, #2
	strb	r1, [fp, #-46]
	b	.L8
.L33:
	cmp	r1, #4
	bne	.L10
	ldrb	r1, [r2, #260]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L10
	b	.L9
.L29:
	movw	r1, #362
	ldrh	r1, [r2, r1]
	cmp	r1, #4
	beq	.L3
	ldrb	r1, [r2, #197]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L5
.L30:
	ldr	r1, [r2, #464]
	cmp	r1, #8
	ldrleb	r1, [fp, #-47]	@ zero_extendqisi2
	orrle	r1, r1, #32
	strleb	r1, [fp, #-47]
	b	.L5
.L31:
	ldr	r1, [r3, #3100]
	movw	r4, #21846
	movt	r4, 21845
	add	r1, r1, #1
	add	r1, r1, r1, lsr #31
	mov	r8, r1, asr #1
	smull	r4, r5, r8, r4
	sub	r1, r5, r1, asr #31
	add	r1, r1, r1, lsl #1
	rsb	r1, r1, r8
	and	r8, r1, #3
	b	.L12
.L32:
	ldr	r2, [r3, #3100]
	add	r2, r2, #1
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	sub	r2, r2, #1
	uxth	r2, r2
	b	.L14
.L35:
	.align	2
.L34:
	.word	g_HwMem
	UNWIND(.fnend)
	.size	BPD_CfgReg, .-BPD_CfgReg
	.align	2
	.global	BPD_Reset
	.type	BPD_Reset, %function
BPD_Reset:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	mov	r0, #53248
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L43
	ldr	r5, .L45
	mov	r4, #0
	ldr	r6, .L45+4
	ldr	r3, [r5]
	add	r3, r3, #61440
	ldr	r1, [r3, #2060]
	uxtb	r2, r1
	str	r1, [fp, #-32]
	orr	r2, r2, #8
	strb	r2, [fp, #-32]
	ldr	r2, [fp, #-32]
	str	r2, [r3, #2060]
	b	.L39
.L44:
	add	r4, r4, #1
	cmp	r4, #1000
	beq	.L40
.L39:
	ldr	r3, [r6, #116]
	mov	r0, #30
	blx	r3
	ldr	r3, [r5]
	add	r3, r3, #61440
	ldr	r2, [r3, #2064]
	tst	r2, #8
	str	r2, [fp, #-32]
	beq	.L44
	cmp	r4, #1000
	bge	.L40
.L41:
	ldr	r2, [r3, #2060]
	mvn	r0, #1
	ldr	r1, [r5, #4]
	str	r2, [fp, #-32]
	bfc	r2, #3, #1
	strb	r2, [fp, #-32]
	ldr	r2, [fp, #-32]
	str	r2, [r3, #2060]
	str	r0, [r1, #52]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L40:
	ldr	r2, .L45+8
	mov	r1, #164
	mov	r0, #0
	bl	dprint_normal
	ldr	r3, [r5]
	add	r3, r3, #61440
	b	.L41
.L43:
	ldr	r2, .L45+12
	mov	r1, #142
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	dprint_normal
.L46:
	.align	2
.L45:
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC1
	.word	.LC0
	UNWIND(.fnend)
	.size	BPD_Reset, .-BPD_Reset
	.align	2
	.global	BPD_Start
	.type	BPD_Start, %function
BPD_Start:
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
	ldr	r3, .L48
	mov	r2, #0
	mov	r0, #1
	ldr	r1, [r3, #4]
	str	r2, [r1]
	ldr	r1, [r3, #4]
	str	r0, [r1]
	ldr	r3, [r3, #4]
	str	r2, [r3]
	ldmfd	sp, {fp, sp, pc}
.L49:
	.align	2
.L48:
	.word	g_HwMem
	UNWIND(.fnend)
	.size	BPD_Start, .-BPD_Start
	.align	2
	.global	IsBpd_Ready
	.type	IsBpd_Ready, %function
IsBpd_Ready:
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
	ldr	r3, .L51
	ldr	r3, [r3, #4]
	ldr	r0, [r3, #64]
	and	r0, r0, #1
	ldmfd	sp, {fp, sp, pc}
.L52:
	.align	2
.L51:
	.word	g_HwMem
	UNWIND(.fnend)
	.size	IsBpd_Ready, .-IsBpd_Ready
	.align	2
	.global	BPDDRV_WaitBpdReadyIfNoIsr
	.type	BPDDRV_WaitBpdReadyIfNoIsr, %function
BPDDRV_WaitBpdReadyIfNoIsr:
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
	ldr	r5, .L62
	ldr	r6, .L62+4
	ldr	r3, [r5]
	blx	r3
	ldr	r3, [r6, #4]
	ldr	r3, [r3, #64]
	tst	r3, #1
	mov	r4, r0
	beq	.L56
	b	.L54
.L58:
	ldr	r3, [r6, #4]
	ldr	r3, [r3, #64]
	tst	r3, #1
	bne	.L54
.L56:
	ldr	r3, [r5]
	blx	r3
	cmp	r0, r4
	movcc	r4, #0
	rsb	r0, r4, r0
	cmp	r0, #4000
	bcc	.L58
	ldr	r2, .L62+8
	mov	r1, #233
	mov	r0, #0
	bl	dprint_normal
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L54:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L63:
	.align	2
.L62:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_HwMem
	.word	.LC2
	UNWIND(.fnend)
	.size	BPDDRV_WaitBpdReadyIfNoIsr, .-BPDDRV_WaitBpdReadyIfNoIsr
	.align	2
	.global	BPD_GetParam
	.type	BPD_GetParam, %function
BPD_GetParam:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r3, .L71
	ldr	lr, [r2, #16]
	ldr	r4, [r2, #24]
	ldr	ip, [r3, #4]
	rsb	r5, r4, lr, lsl #3
	ldr	r3, [ip, #80]
	ldr	ip, [ip, #84]
	cmp	r3, r5
	bcs	.L69
	add	r0, r0, #15552
	ldrsb	r0, [r0, #44]
	cmp	r0, #0
	bne	.L70
	and	lr, ip, #15
	ubfx	r0, ip, #8, #4
	str	lr, [r1, #328]
	ubfx	ip, ip, #4, #4
	str	r0, [r1, #332]
	str	ip, [r1, #336]
.L68:
	mov	r1, r3
	mov	r0, r2
	bl	BsLongSkip
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L70:
	ubfx	r0, ip, #0, #4
	ubfx	lr, ip, #12, #4
	strb	r0, [r1, #382]
	ubfx	r0, ip, #16, #4
	strb	lr, [r1, #385]
	ubfx	lr, ip, #20, #4
	strb	r0, [r1, #386]
	ubfx	r0, ip, #8, #4
	strb	lr, [r1, #387]
	ubfx	lr, ip, #24, #4
	strb	r0, [r1, #383]
	ubfx	r0, ip, #4, #4
	strb	lr, [r1, #388]
	ubfx	ip, ip, #28, #2
	strb	r0, [r1, #384]
	strb	ip, [r1, #378]
	b	.L68
.L69:
	rsb	lr, r4, lr
	mov	r1, #252
	str	lr, [sp]
	mov	r0, #0
	ldr	r2, .L71+4
	bl	dprint_normal
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L72:
	.align	2
.L71:
	.word	g_HwMem
	.word	.LC3
	UNWIND(.fnend)
	.size	BPD_GetParam, .-BPD_GetParam
	.align	2
	.global	BPD_Drv
	.type	BPD_Drv, %function
BPD_Drv:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	mov	r4, r1
	ldr	r1, [r1, #3100]
	mov	r6, r3
	mov	r8, r0
	mov	r7, r2
	cmp	r1, #2
	ldr	r3, [r4, #3096]
	ble	.L75
	cmp	r1, #128
	sub	r5, r3, #3
	movle	r2, #0
	movgt	r2, #1
	cmp	r5, #125
	movls	r5, r2
	orrhi	r5, r2, #1
	cmp	r5, #0
	beq	.L76
.L75:
	mov	r1, r1, asl #4
	mov	r3, r3, asl #4
	str	r1, [sp]
	mov	r0, #0
	mov	r1, #300
	ldr	r2, .L86
	bl	dprint_normal
	ldr	r3, [r4, #3096]
	cmp	r3, #128
	ble	.L85
.L77:
	ldr	r3, .L86+4
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L84
	mov	r3, #0
	mov	r0, r6
	mov	r2, r3
	mov	r1, #21
	blx	r4
	mov	r0, #1
.L78:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L85:
	ldr	r3, [r4, #3100]
	cmp	r3, #128
	bgt	.L77
.L84:
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L76:
	ldr	r6, .L86+8
	bl	BPD_Reset
	mov	r2, r7
	mov	r1, r8
	mov	r0, r4
	mov	r3, r6
	bl	BPD_CfgReg
	cmp	r0, #0
	bne	.L80
	ldr	r3, [r6, #4]
	mov	r2, #1
	str	r0, [r3]
	ldr	r3, [r6, #4]
	str	r2, [r3]
	ldr	r3, [r6, #4]
	str	r0, [r3]
	bl	BPDDRV_WaitBpdReadyIfNoIsr
	cmp	r0, #0
	bne	.L84
	mov	r2, r8
	mov	r1, r7
	mov	r0, r4
	bl	BPD_GetParam
	adds	r0, r0, #0
	movne	r0, #1
	b	.L78
.L80:
	mov	r0, r5
	ldr	r2, .L86+12
	movw	r1, #342
	bl	dprint_normal
	b	.L84
.L87:
	.align	2
.L86:
	.word	.LC4
	.word	g_EventReportFunc
	.word	g_HwMem
	.word	.LC5
	UNWIND(.fnend)
	.size	BPD_Drv, .-BPD_Drv
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"VDMHAL_ResetBPD: map BPD register fail, vir(reg) = " )
	ASCII(.ascii	"(%p)\012\000" )
	.space	3
.LC1:
	ASCII(.ascii	"Reset BPD Failed!\012\000" )
	.space	1
.LC2:
	ASCII(.ascii	"BPD TimeOut!\012\000" )
	.space	2
.LC3:
	ASCII(.ascii	" BPD ERROR: EAT TOO MUCH BS %#x, but available bs n" )
	ASCII(.ascii	"um %#x!!!\012\000" )
	.space	2
.LC4:
	ASCII(.ascii	"NOT SUPPORT SIZE %d*%d\012\000" )
.LC5:
	ASCII(.ascii	"BPD error: no map reg!\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
