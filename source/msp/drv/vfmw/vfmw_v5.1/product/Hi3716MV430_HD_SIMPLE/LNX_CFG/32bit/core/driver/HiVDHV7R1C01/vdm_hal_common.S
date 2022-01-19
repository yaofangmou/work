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
	.file	"vdm_hal_common.c"
	.text
	.align	2
	.global	HAL_CfgVdmReg
	.type	HAL_CfgVdmReg, %function
HAL_CfgVdmReg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #92)
	sub	sp, sp, #92
	mov	r4, r0
	sub	r0, r0, #2
	mov	r5, r2
	bics	ip, r0, #2
	ldr	ip, .L89
	clz	r10, r4
	mov	r7, r3
	moveq	r2, #1
	movne	r2, #0
	str	r2, [fp, #-128]
	bics	r2, r4, #16
	mov	r2, r5, asl #6
	mov	r10, r10, lsr #5
	sub	r2, r2, r5, asl #4
	moveq	lr, #1
	add	r2, ip, r2
	movne	lr, #0
	cmp	r0, #1
	movhi	r0, r10
	orrls	r0, r10, #1
	str	lr, [fp, #-116]
	ldr	r3, [r2, #8]
	sub	lr, r4, #3
	clz	lr, lr
	cmp	r0, #0
	mov	r6, r1
	mov	lr, lr, lsr #5
	str	r3, [fp, #-124]
	str	lr, [fp, #-120]
	beq	.L81
	ldr	r3, .L89+4
	mov	r2, #64
	mov	r1, #0
	sub	r0, fp, #108
	ldr	r3, [r3, #48]
	blx	r3
	cmp	r4, #15
	ldrls	pc, [pc, r4, asl #2]
	b	.L4
.L6:
	.word	.L5
	.word	.L4
	.word	.L7
	.word	.L8
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L5
.L8:
	add	r3, r6, #45056
	ldrb	r2, [r6, #144]	@ zero_extendqisi2
	ldr	r8, [r3, #240]
	strb	r2, [fp, #-56]
	cmp	r8, #0
	beq	.L42
	mov	lr, #0
	add	ip, r6, #236
	mov	r0, lr
.L16:
	mov	r1, ip
	mov	r2, #2
.L18:
	ldr	r3, [r1, #4]!
	cmp	r3, #0
	beq	.L17
	ldr	r9, [r1, #8]
	bic	r3, r3, #15
	cmp	r9, #0
	ble	.L17
	cmp	r0, #0
	cmpne	r3, r0
	movls	r0, r3
.L17:
	subs	r2, r2, #1
	bne	.L18
	add	lr, lr, #1
	add	ip, ip, #44
	cmp	lr, r8
	bne	.L16
.L15:
	ldrh	r3, [r6, #150]
	ldrh	r2, [r6, #146]
	str	r0, [r6, #196]
	mov	r1, r3, asl #4
	str	r0, [fp, #-100]
	mul	r3, r2, r3
	ldr	r2, [r6, #188]
	ldr	ip, [r6, #192]
	str	r1, [fp, #-108]
	ldr	r0, [r6, #212]
	str	r2, [fp, #-96]
	ldr	r1, [r6, #216]
	ldr	r2, [r6, #224]
	str	r3, [fp, #-104]
	str	ip, [fp, #-60]
	str	r0, [fp, #-88]
	str	r1, [fp, #-84]
	str	r2, [fp, #-92]
.L19:
	ldr	r2, [fp, #-48]
	cmp	r2, #1
	movne	r2, #1
	strne	r2, [fp, #-112]
	beq	.L20
	cmp	r4, #16
	mov	r8, #0
	bne	.L14
.L83:
	ldrb	r2, [fp, #-53]	@ zero_extendqisi2
	mov	r9, r8
	bfi	r8, r2, #30, #1
	b	.L24
.L7:
	add	r9, r6, #12288
	ldrb	r3, [r6, #151]	@ zero_extendqisi2
	ldr	r8, [r9, #2244]
	strb	r3, [fp, #-56]
	cmp	r8, #0
	beq	.L41
	mov	lr, #0
	add	r0, r6, #208
	mov	ip, lr
.L11:
	mov	r1, r0
	mov	r3, #2
	str	r0, [fp, #-112]
.L13:
	ldr	r2, [r1, #4]!
	cmp	r2, #0
	beq	.L12
	ldr	r0, [r1, #-8]
	bic	r2, r2, #15
	cmp	r0, #0
	beq	.L12
	cmp	ip, #0
	cmpne	r2, ip
	movls	ip, r2
.L12:
	subs	r3, r3, #1
	bne	.L13
	add	lr, lr, #1
	ldr	r0, [fp, #-112]
	cmp	lr, r8
	add	r0, r0, #28
	bne	.L11
.L10:
	ldrh	r2, [r6, #152]
	mov	r8, #0
	ldrh	r3, [r6, #154]
	str	ip, [r6, #192]
	ldr	r0, [r9, #2248]
	mul	r3, r3, r2
	ldr	r1, [r9, #2256]
	str	ip, [fp, #-100]
	mov	r2, r2, asl #4
	ldr	ip, [r9, #2264]
	str	r0, [fp, #-88]
	str	r1, [fp, #-84]
	ldr	r0, [r6, #164]
	ldr	r1, [r6, #168]
	str	ip, [fp, #-92]
	str	r3, [fp, #-104]
	str	r2, [fp, #-108]
	str	r0, [fp, #-96]
	str	r8, [fp, #-112]
	str	r1, [fp, #-60]
	b	.L14
.L5:
	ldr	r3, [r6, #284]
	ldr	r2, [r6, #20]
	ldrb	r1, [r6, #4]	@ zero_extendqisi2
	add	r3, r6, r3, lsl #2
	ldrb	r0, [r6, #2]	@ zero_extendqisi2
	mov	r2, r2, asl #4
	str	r2, [fp, #-108]
	ldr	r3, [r3, #300]
	ldr	r2, [r6, #592]
	strb	r1, [fp, #-56]
	str	r3, [fp, #-96]
	str	r2, [fp, #-100]
	ldr	r3, [r6, #932]
	ldr	r2, [r6, #432]
	ldr	r1, [r6, #428]
	str	r3, [fp, #-52]
	str	r2, [fp, #-60]
	ldr	r3, [r6, #576]
	ldr	r2, [r6, #936]
	strb	r0, [fp, #-54]
	str	r1, [fp, #-64]
	ldr	r0, [r6, #296]
	ldr	r1, [r6, #588]
	str	r3, [fp, #-88]
	str	r2, [fp, #-48]
	sub	r2, r4, #1
	ldr	r3, [r6, #596]
	cmp	r4, #10
	cmpne	r2, #1
	str	r0, [fp, #-84]
	str	r1, [fp, #-92]
	str	r3, [fp, #-104]
	bhi	.L82
.L20:
	cmp	r4, #16
	mov	r2, #0
	mov	r8, #0
	str	r2, [fp, #-112]
	beq	.L83
.L14:
	sub	r9, r4, #6
	cmp	r4, #6
	cmpne	r4, #18
	clz	r9, r9
	mov	r9, r9, lsr #5
	bne	.L84
.L23:
	mov	r8, #1073741824
.L24:
	ldr	r2, [fp, #-116]
	cmp	r2, #0
	beq	.L25
	ldr	r2, [fp, #-48]
	cmp	r2, #0
	orrne	r8, r8, #201326592
.L25:
	ldr	r2, [fp, #-128]
	cmp	r4, #14
	orreq	r2, r2, #1
	cmp	r2, #0
	orrne	r8, r8, #33554432
	orrs	r1, r9, r10
	bne	.L27
	sub	r1, r4, #15
	cmp	r1, #1
	bls	.L27
	ldr	r0, [fp, #-120]
	sub	r1, r4, #8
	cmp	r1, #1
	orrls	r0, r0, #1
	cmp	r0, #0
	beq	.L85
.L27:
	orr	r8, r8, #16777216
.L28:
	cmp	r9, #0
	bne	.L29
	ldr	r1, [fp, #-120]
	orrs	r2, r1, r2
	bne	.L29
.L30:
	sub	r2, r3, #1
	mov	r0, #8
	bfi	r8, r2, #0, #20
	mov	r3, r7
	mov	r2, r5
	mov	r6, #0
	mov	r1, r8
	bl	MFDE_ConfigReg
	mov	r3, r8
	ldr	r2, .L89+8
	mov	r1, #119
	mov	r0, #4
	bl	dprint_normal
	cmp	r4, #18
	ldr	r2, .L89+12
	ldrls	r3, .L89+16
	movhi	r3, #15
	ldr	r1, [fp, #-116]
	ldrls	r3, [r3, r4, asl #2]
	sub	r4, r4, #15
	clz	r4, r4
	andls	r3, r3, #15
	bfi	r6, r3, #0, #4
	ldr	r3, [fp, #-124]
	mov	r4, r4, lsr #5
	orrs	r1, r1, r4
	ldr	r3, [r2, r3, asl #2]
	add	r3, r3, #204800
	ldr	r2, [r3, #3296]
	bfi	r6, r2, #12, #1
	ldrneb	r2, [fp, #-54]	@ zero_extendqisi2
	orreq	r6, r6, #16384
	bfine	r6, r2, #14, #1
	ldr	r2, [fp, #-120]
	cmp	r2, #0
	bfcne	r6, #15, #1
	bfcne	r6, #8, #1
	bfcne	r6, #9, #1
	bne	.L35
	cmp	r9, #0
	orreq	r6, r6, #32768
	bne	.L86
.L35:
	ldr	r2, [r3, #3244]
	mov	r3, #3
	bfi	r6, r3, #16, #12
	ldrb	r1, [fp, #-56]	@ zero_extendqisi2
	bfc	r6, #28, #1
	mov	r3, r7
	bfi	r6, r2, #30, #1
	mov	r0, #12
	bfi	r6, r1, #29, #1
	mov	r2, r5
	orr	r4, r4, r10
	mov	r1, r6
	bl	MFDE_ConfigReg
	mov	r3, r6
	ldr	r6, .L89+20
	mov	r1, #219
	ldr	r2, .L89+24
	mov	r0, #4
	bl	dprint_normal
	mov	r1, #1000
	mla	r6, r1, r5, r6
	mov	r3, r7
	mov	r2, r5
	mov	r0, #16
	ldr	r8, [r6, #32]
	mov	r1, r8
	bl	MFDE_ConfigReg
	mov	r3, r8
	ldr	r2, .L89+28
	mov	r1, #230
	mov	r0, #4
	bl	dprint_normal
	ldr	r6, [r6, #16]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #20
	mov	r1, r6
	bl	MFDE_ConfigReg
	mov	r3, r6
	ldr	r2, .L89+28
	mov	r1, #241
	mov	r0, #4
	bl	dprint_normal
	ldr	r6, [fp, #-100]
	mov	r3, r7
	mov	r2, r5
	bic	r6, r6, #15
	mov	r0, #24
	mov	r1, r6
	bl	MFDE_ConfigReg
	mov	r3, r6
	ldr	r2, .L89+32
	mov	r1, #252
	mov	r0, #4
	bl	dprint_normal
	ldr	r3, [fp, #-108]
	cmp	r3, #1920
	movls	r4, #0
	andhi	r4, r4, #1
	cmp	r4, #0
	beq	.L37
	ldr	r2, [fp, #-52]
	cmp	r2, #0
	bne	.L87
.L37:
	cmp	r3, #4096
	mov	r2, r5
	mov	r3, r7
	mov	r0, #4
	movhi	r4, #0
	movls	r4, #1
	mov	r1, r4
	bl	SCD_ConfigReg
	mov	r3, r4
	ldr	r2, .L89+36
	movw	r1, #270
	mov	r0, #4
	bl	dprint_normal
	ldr	r4, [fp, #-96]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #96
	mov	r1, r4
	bl	MFDE_ConfigReg
	mov	r3, r4
	ldr	r2, .L89+40
	movw	r1, #281
	mov	r0, #4
	bl	dprint_normal
	ldr	r4, [fp, #-88]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #100
	mov	r1, r4
	bl	MFDE_ConfigReg
	mov	r3, r4
	ldr	r2, .L89+44
	movw	r1, #291
	mov	r0, #4
	bl	dprint_normal
	ldr	r4, [fp, #-84]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #104
	mov	r1, r4
	bl	MFDE_ConfigReg
	mov	r3, r4
	ldr	r2, .L89+48
	movw	r1, #301
	mov	r0, #4
	bl	dprint_normal
	ldr	r4, [fp, #-92]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #108
	mov	r1, r4
	bl	MFDE_ConfigReg
	mov	r3, r4
	ldr	r2, .L89+52
	mov	r1, #312
	mov	r0, #4
	bl	dprint_normal
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	bne	.L88
	ldr	r1, [fp, #-112]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #128
	bl	MFDE_ConfigReg
	ldr	r3, .L89+56
	ldr	r2, .L89+60
	movw	r1, #357
	mov	r0, #4
	ldr	r3, [r3]
	bl	dprint_normal
.L39:
	ldr	r3, [fp, #-80]
	cmp	r3, #0
	beq	.L40
	ldr	r4, [fp, #-76]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #116
	mov	r1, r4
	bl	MFDE_ConfigReg
	mov	r3, r4
	ldr	r2, .L89+64
	movw	r1, #371
	mov	r0, #4
	bl	dprint_normal
	ldr	r4, [fp, #-72]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #120
	mov	r1, r4
	bl	MFDE_ConfigReg
	mov	r3, r4
	ldr	r2, .L89+68
	movw	r1, #375
	mov	r0, #4
	bl	dprint_normal
	ldr	r4, [fp, #-68]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #124
	mov	r1, r4
	bl	MFDE_ConfigReg
	mov	r3, r4
	ldr	r2, .L89+72
	movw	r1, #379
	mov	r0, #4
	bl	dprint_normal
.L40:
	mov	r3, r7
	mov	r2, r5
	mvn	r1, #0
	mov	r0, #32
	bl	MFDE_ConfigReg
	mvn	r3, #0
	ldr	r2, .L89+76
	movw	r1, #321
	mov	r0, #4
	bl	dprint_normal
	mov	r0, #0
.L3:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4:
	sub	r2, r4, #1
	ldr	r3, [fp, #-104]
	cmp	r4, #10
	cmpne	r2, #1
	bls	.L20
.L82:
	sub	r2, r4, #11
	cmp	r4, #17
	cmpne	r2, #1
	bls	.L20
	b	.L19
.L29:
	orr	r8, r8, #4194304
	b	.L30
.L88:
	ldr	r4, .L89+56
	mov	r3, r7
	mov	r2, r5
	mov	r0, #128
	ldr	r1, [r4]
	bl	MFDE_ConfigReg
	ldr	r3, [r4]
	ldr	r2, .L89+60
	mov	r1, #348
	mov	r0, #4
	bl	dprint_normal
	mov	r3, r7
	mov	r2, r5
	ldr	r1, [fp, #-60]
	mov	r0, #132
	bl	MFDE_ConfigReg
	ldr	r3, [fp, #-60]
	ldr	r2, .L89+80
	movw	r1, #351
	mov	r0, #4
	bl	dprint_normal
	b	.L39
.L84:
	sub	r2, r4, #14
	cmp	r2, #1
	bls	.L23
	cmp	r4, #4
	bhi	.L24
	b	.L23
.L85:
	cmp	r4, #1
	bne	.L28
	b	.L27
.L86:
	ldrb	r2, [fp, #-55]	@ zero_extendqisi2
	cmp	r2, #3
	cmpne	r2, #1
	movls	r2, #1
	movhi	r2, #0
	bfi	r6, r2, #15, #1
	b	.L35
.L41:
	mov	ip, r8
	b	.L10
.L42:
	mov	r0, r8
	b	.L15
.L81:
	ldr	r2, .L89+84
	movw	r1, #998
	bl	dprint_normal
	mvn	r0, #0
	b	.L3
.L87:
	ldr	r2, .L89+88
	movw	r1, #263
	mov	r0, #1
	bl	dprint_normal
	ldr	r2, .L89+92
	movw	r1, #1039
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L3
.L90:
	.align	2
.L89:
	.word	g_VdmDrvParam
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC1
	.word	s_pstVfmwChan
	.word	.LANCHOR0
	.word	g_HwMem
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	g_BackTunnelCtrl
	.word	.LC12
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC13
	.word	.LC0
	.word	.LC5
	.word	.LC6
	UNWIND(.fnend)
	.size	HAL_CfgVdmReg, .-HAL_CfgVdmReg
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	CSWTCH.10, %object
	.size	CSWTCH.10, 76
CSWTCH.10:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	2
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	10
	.word	10
	.word	12
	.word	2
	.word	0
	.word	13
	.word	14
	.word	15
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"Protrol Not Support!\012\000" )
	.space	2
.LC1:
	ASCII(.ascii	"BASIC_CFG0 = 0x%x\012\000" )
	.space	1
.LC2:
	ASCII(.ascii	"BASIC_CFG1 = 0x%x\012\000" )
	.space	1
.LC3:
	ASCII(.ascii	"VAM_ADDR = 0x%x\012\000" )
	.space	3
.LC4:
	ASCII(.ascii	"VREG_STREAM_BASE_ADDR = 0x%x\012\000" )
	.space	2
.LC5:
	ASCII(.ascii	"ERROR: not support H264 MBAFF(pic_width %d) ext ram" )
	ASCII(.ascii	", for it needs double size!!\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"Configure EMAR FAILed!\012\000" )
.LC7:
	ASCII(.ascii	"REG_EMAR_ID = 0x%x\012\000" )
.LC8:
	ASCII(.ascii	"YSTADDR_1D = 0x%x\012\000" )
	.space	1
.LC9:
	ASCII(.ascii	"YSTRIDE_1D = 0x%x\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"UVOFFSET_1D = 0x%x\012\000" )
.LC11:
	ASCII(.ascii	"VREG_HEAD_INF_OFFSET = 0x%x\012\000" )
	.space	3
.LC12:
	ASCII(.ascii	"VREG_BACKTUNL_CTRL = 0x%x\012\000" )
	.space	1
.LC13:
	ASCII(.ascii	"VREG_BACKTUNL_ADDR = 0x%x\012\000" )
	.space	1
.LC14:
	ASCII(.ascii	"VREG_YSTRIDE_2BIT = 0x%x\012\000" )
	.space	2
.LC15:
	ASCII(.ascii	"VREG_YOFFSET_2BIT = 0x%x\012\000" )
	.space	2
.LC16:
	ASCII(.ascii	"VREG_UVOFFSET_2BIT = 0x%x\012\000" )
	.space	1
.LC17:
	ASCII(.ascii	"VREG_INT_STATE = 0x%x\012\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
