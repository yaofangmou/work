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
	mov	ip, r2, asl #6
	ldr	r2, .L87
	sub	ip, ip, r5, asl #4
	moveq	lr, #1
	movne	lr, #0
	str	lr, [fp, #-128]
	bics	lr, r4, #16
	mov	r6, r1
	add	r2, r2, ip
	moveq	r1, #1
	movne	r1, #0
	str	r1, [fp, #-116]
	cmp	r0, #1
	orrls	r1, r1, #1
	mov	r7, r3
	ldr	r3, [r2, #8]
	mov	r0, r1
	sub	r1, r4, #3
	clz	r1, r1
	clz	r10, r4
	cmp	r0, #0
	str	r3, [fp, #-124]
	mov	r1, r1, lsr #5
	mov	r10, r10, lsr #5
	str	r1, [fp, #-120]
	beq	.L82
	ldr	r3, .L87+4
	mov	r2, #64
	mov	r1, #0
	sub	r0, fp, #108
	ldr	r3, [r3, #48]
	blx	r3
	cmp	r4, #16
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
	.word	.L9
.L9:
	ldr	r2, [r6, #1284]
	add	r1, r6, #4096
	ldr	r3, [r6, #16]
	ldr	r0, [r6, #20]
	add	r2, r2, #332
	add	r2, r2, #2
	add	r3, r3, #1
	ldr	ip, [r6, r2, asl #2]
	mla	r3, r0, r3, r3
	ldrb	r2, [r6, #2]	@ zero_extendqisi2
	ldr	r0, [r6, #192]
	str	ip, [fp, #-96]
	strb	r2, [fp, #-53]
	mov	r2, #1
	str	r0, [fp, #-108]
	str	r2, [fp, #-80]
	ldr	r0, [r6, #1332]
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldr	ip, [r6, #1312]
	strb	r0, [fp, #-54]
	strb	r2, [fp, #-56]
	ldr	r0, [r6, #1324]
	ldr	r2, [r6, #1608]
	str	ip, [fp, #-76]
	str	r0, [fp, #-100]
	str	r2, [fp, #-60]
	ldr	r0, [r6, #1292]
	ldr	r2, [r6, #1300]
	str	r0, [fp, #-88]
	str	r2, [fp, #-84]
	ldr	r0, [r6, #1308]
	ldr	r2, [r6, #1604]
	str	r0, [fp, #-92]
	str	r2, [fp, #-64]
	ldr	r0, [r6, #1320]
	ldr	r2, [r6, #1316]
	str	r0, [fp, #-68]
	str	r2, [fp, #-72]
	str	r3, [fp, #-104]
	ldr	r2, [r1, #828]
	str	r2, [fp, #-48]
.L42:
	sub	r2, r4, #11
	cmp	r4, #17
	cmpne	r2, #1
	bls	.L21
	ldr	r2, [fp, #-48]
	cmp	r2, #1
	movne	r2, #1
	strne	r2, [fp, #-112]
	beq	.L21
	cmp	r4, #16
	mov	r8, #0
	beq	.L83
.L15:
	sub	r9, r4, #6
	cmp	r4, #6
	cmpne	r4, #18
	clz	r9, r9
	mov	r9, r9, lsr #5
	bne	.L23
.L24:
	orr	r8, r8, #1073741824
.L25:
	ldr	r2, [fp, #-116]
	cmp	r2, #0
	beq	.L26
	ldr	r2, [fp, #-48]
	cmp	r2, #0
	orrne	r8, r8, #201326592
.L26:
	ldr	r2, [fp, #-128]
	cmp	r4, #14
	orreq	r2, r2, #1
	cmp	r2, #0
	orrne	r8, r8, #33554432
	orrs	r1, r9, r10
	bne	.L28
	sub	r1, r4, #15
	cmp	r1, #1
	bls	.L28
	ldr	r0, [fp, #-120]
	sub	r1, r4, #8
	cmp	r1, #1
	orrls	r0, r0, #1
	cmp	r0, #0
	bne	.L28
	cmp	r4, #1
	bne	.L29
.L28:
	orr	r8, r8, #16777216
.L29:
	cmp	r9, #0
	bne	.L30
	ldr	r1, [fp, #-120]
	orrs	r2, r2, r1
	bne	.L30
.L31:
	sub	r2, r3, #1
	mov	r0, #8
	bfi	r8, r2, #0, #20
	mov	r3, r7
	mov	r2, r5
	mov	r6, #0
	mov	r1, r8
	bl	MFDE_ConfigReg
	mov	r3, r8
	ldr	r2, .L87+8
	mov	r1, #119
	mov	r0, #4
	bl	dprint_normal
	cmp	r4, #18
	ldr	r2, .L87+12
	ldrls	r3, .L87+16
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
	bne	.L36
	cmp	r9, #0
	orreq	r6, r6, #32768
	bne	.L84
.L36:
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
	ldr	r6, .L87+20
	mov	r1, #219
	ldr	r2, .L87+24
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
	ldr	r2, .L87+28
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
	ldr	r2, .L87+28
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
	ldr	r2, .L87+32
	mov	r1, #252
	mov	r0, #4
	bl	dprint_normal
	ldr	r3, [fp, #-108]
	cmp	r3, #1920
	movls	r4, #0
	andhi	r4, r4, #1
	cmp	r4, #0
	beq	.L38
	ldr	r2, [fp, #-52]
	cmp	r2, #0
	bne	.L85
.L38:
	cmp	r3, #4096
	mov	r2, r5
	mov	r3, r7
	mov	r0, #4
	movhi	r4, #0
	movls	r4, #1
	mov	r1, r4
	bl	SCD_ConfigReg
	mov	r3, r4
	ldr	r2, .L87+36
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
	ldr	r2, .L87+40
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
	ldr	r2, .L87+44
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
	ldr	r2, .L87+48
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
	ldr	r2, .L87+52
	mov	r1, #312
	mov	r0, #4
	bl	dprint_normal
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	bne	.L86
	ldr	r1, [fp, #-112]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #128
	bl	MFDE_ConfigReg
	ldr	r3, .L87+56
	ldr	r2, .L87+60
	movw	r1, #357
	mov	r0, #4
	ldr	r3, [r3]
	bl	dprint_normal
.L40:
	ldr	r3, [fp, #-80]
	cmp	r3, #0
	beq	.L41
	ldr	r4, [fp, #-76]
	mov	r3, r7
	mov	r2, r5
	mov	r0, #116
	mov	r1, r4
	bl	MFDE_ConfigReg
	mov	r3, r4
	ldr	r2, .L87+64
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
	ldr	r2, .L87+68
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
	ldr	r2, .L87+72
	movw	r1, #379
	mov	r0, #4
	bl	dprint_normal
.L41:
	mov	r3, r7
	mov	r2, r5
	mvn	r1, #0
	mov	r0, #32
	bl	MFDE_ConfigReg
	mvn	r3, #0
	ldr	r2, .L87+76
	movw	r1, #321
	mov	r0, #4
	bl	dprint_normal
	mov	r0, #0
.L3:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
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
	ldr	r3, [r6, #932]
	ldr	r1, [r6, #428]
	str	r2, [fp, #-100]
	str	r3, [fp, #-52]
	ldr	r2, [r6, #432]
	ldr	r3, [r6, #576]
	strb	r0, [fp, #-54]
	str	r1, [fp, #-64]
	ldr	r0, [r6, #296]
	str	r2, [fp, #-60]
	ldr	r1, [r6, #588]
	str	r3, [fp, #-88]
	ldr	r2, [r6, #936]
	ldr	r3, [r6, #596]
	str	r0, [fp, #-84]
	str	r1, [fp, #-92]
	str	r3, [fp, #-104]
	str	r2, [fp, #-48]
.L10:
	sub	r2, r4, #1
	cmp	r4, #10
	cmpne	r2, #1
	bhi	.L42
.L21:
	cmp	r4, #16
	mov	r2, #0
	mov	r8, #0
	str	r2, [fp, #-112]
	bne	.L15
.L83:
	ldrb	r2, [fp, #-53]	@ zero_extendqisi2
	mov	r9, r8
	bfi	r8, r2, #30, #1
.L23:
	sub	r2, r4, #14
	cmp	r2, #1
	bls	.L24
	cmp	r4, #4
	bhi	.L25
	b	.L24
.L7:
	add	r9, r6, #12288
	ldrb	r3, [r6, #151]	@ zero_extendqisi2
	ldr	r8, [r9, #2244]
	strb	r3, [fp, #-56]
	cmp	r8, #0
	beq	.L43
	mov	lr, #0
	add	r0, r6, #208
	mov	ip, lr
.L12:
	mov	r1, r0
	mov	r3, #2
	str	r0, [fp, #-112]
.L14:
	ldr	r2, [r1, #4]!
	cmp	r2, #0
	beq	.L13
	ldr	r0, [r1, #-8]
	bic	r2, r2, #15
	cmp	r0, #0
	beq	.L13
	cmp	ip, #0
	cmpne	r2, ip
	movls	ip, r2
.L13:
	subs	r3, r3, #1
	bne	.L14
	add	lr, lr, #1
	ldr	r0, [fp, #-112]
	cmp	lr, r8
	add	r0, r0, #28
	bne	.L12
.L11:
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
	b	.L15
.L8:
	add	r3, r6, #45056
	ldrb	r2, [r6, #144]	@ zero_extendqisi2
	ldr	r8, [r3, #240]
	strb	r2, [fp, #-56]
	cmp	r8, #0
	beq	.L44
	mov	lr, #0
	add	ip, r6, #236
	mov	r0, lr
.L17:
	mov	r1, ip
	mov	r2, #2
.L19:
	ldr	r3, [r1, #4]!
	cmp	r3, #0
	beq	.L18
	ldr	r9, [r1, #8]
	bic	r3, r3, #15
	cmp	r9, #0
	ble	.L18
	cmp	r0, #0
	cmpne	r3, r0
	movls	r0, r3
.L18:
	subs	r2, r2, #1
	bne	.L19
	add	lr, lr, #1
	add	ip, ip, #44
	cmp	lr, r8
	bne	.L17
.L16:
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
	b	.L42
.L4:
	ldr	r3, [fp, #-104]
	b	.L10
.L30:
	orr	r8, r8, #4194304
	b	.L31
.L86:
	ldr	r4, .L87+56
	mov	r3, r7
	mov	r2, r5
	mov	r0, #128
	ldr	r1, [r4]
	bl	MFDE_ConfigReg
	ldr	r3, [r4]
	ldr	r2, .L87+60
	mov	r1, #348
	mov	r0, #4
	bl	dprint_normal
	mov	r3, r7
	mov	r2, r5
	ldr	r1, [fp, #-60]
	mov	r0, #132
	bl	MFDE_ConfigReg
	ldr	r3, [fp, #-60]
	ldr	r2, .L87+80
	movw	r1, #351
	mov	r0, #4
	bl	dprint_normal
	b	.L40
.L84:
	ldrb	r2, [fp, #-55]	@ zero_extendqisi2
	cmp	r2, #3
	cmpne	r2, #1
	movls	r2, #1
	movhi	r2, #0
	bfi	r6, r2, #15, #1
	b	.L36
.L43:
	mov	ip, r8
	b	.L11
.L44:
	mov	r0, r8
	b	.L16
.L82:
	ldr	r2, .L87+84
	movw	r1, #998
	bl	dprint_normal
	mvn	r0, #0
	b	.L3
.L85:
	ldr	r2, .L87+88
	movw	r1, #263
	mov	r0, #1
	bl	dprint_normal
	ldr	r2, .L87+92
	movw	r1, #1039
	mov	r0, #0
	bl	dprint_normal
	mvn	r0, #0
	b	.L3
.L88:
	.align	2
.L87:
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
