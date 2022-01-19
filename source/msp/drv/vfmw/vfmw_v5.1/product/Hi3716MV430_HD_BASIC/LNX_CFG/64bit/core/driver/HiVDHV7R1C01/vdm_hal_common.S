#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal_common.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	HAL_CfgVdmReg
	.type	HAL_CfgVdmReg, %function
HAL_CfgVdmReg:
	stp	x29, x30, [sp, -176]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w26, w0
	mov	x0, x30
	sxtw	x21, w2
	mov	x27, x1
	mov	x20, x3
	bl	_mcount
	lsl	x0, x21, 3
	sub	w1, w26, #2
	ldr	x2, .LC2
	sub	x0, x0, x21
	tst	w1, -3
	mov	x19, x21
	add	x0, x2, x0, lsl 3
	cset	w28, eq
	ands	w3, w26, -17
	cset	w22, eq
	cmp	w26, wzr
	cset	w23, eq
	cmp	w26, 3
	ldr	w24, [x0, 8]
	cset	w0, eq
	cmp	w1, 1
	str	w0, [x29, 104]
	cset	w0, ls
	orr	w0, w22, w0
	cbz	w0, .L81
	ldr	x0, .LC5
	mov	x2, 64
	mov	w1, 0
	str	w3, [x29, 108]
	ldr	x4, [x0, 96]
	add	x0, x29, 112
	blr	x4
	cmp	w26, 16
	ldr	w3, [x29, 108]
	bls	.L82
.L4:
	ldr	w0, [x29, 116]
.L10:
	sub	w1, w26, #1
	cmp	w1, 1
	ccmp	w26, 10, 4, hi
	bne	.L83
.L23:
	str	wzr, [x29, 108]
.L24:
	cmp	w26, 16
	mov	w25, 0
	beq	.L84
.L16:
	cmp	w26, 6
	cset	w27, eq
	cmp	w26, 18
	cset	w1, eq
	orr	w1, w27, w1
	cbz	w1, .L25
.L26:
	orr	w25, w25, 1073741824
.L27:
	cbnz	w3, .L28
	ldr	w1, [x29, 172]
	cmp	w1, wzr
	orr	w1, w25, 201326592
	csel	w25, w1, w25, ne
.L28:
	cmp	w26, 14
	orr	w2, w23, w27
	cset	w1, eq
	orr	w28, w28, w1
	orr	w25, w25, w28, lsl 25
	cbnz	w2, .L30
	sub	w1, w26, #15
	cmp	w1, 1
	bls	.L30
	sub	w1, w26, #8
	ldr	w2, [x29, 104]
	cmp	w1, 1
	cset	w1, ls
	orr	w1, w2, w1
	cbnz	w1, .L30
	cmp	w26, 1
	beq	.L30
	cbnz	w27, .L32
	.p2align 2
.L90:
	ldr	w1, [x29, 104]
	orr	w28, w1, w28
	cbnz	w28, .L32
.L33:
	sub	w0, w0, #1
	mov	w2, w19
	bfi	w25, w0, 0, 20
	mov	x3, x20
	mov	w1, w25
	mov	w0, 8
	bl	MFDE_ConfigReg
	ldr	x2, .LC8
	mov	w3, w25
	mov	w1, 119
	mov	w0, 4
	mov	w25, 0
	bl	dprint_normal
	cmp	w26, 18
	mov	w0, 15
	bhi	.L34
	ldr	x0, .LC9
	ldr	w0, [x0, w26, uxtw 2]
	and	w0, w0, 15
.L34:
	bfi	w25, w0, 0, 4
	ldr	x0, .LC10
	cmp	w26, 15
	ldr	x0, [x0, w24, sxtw 3]
	cset	w24, eq
	orr	w22, w24, w22
	add	x0, x0, 217088
	ldr	w1, [x0, 3952]
	bfi	w25, w1, 12, 1
	cbnz	w22, .L85
	cmp	w26, 3
	orr	w25, w25, 16384
	beq	.L86
.L37:
	cbnz	w27, .L87
	orr	w25, w25, 32768
.L38:
	ldr	w1, [x0, 3900]
	mov	w0, 3
	bfi	w25, w0, 16, 13
	ldrb	w0, [x29, 164]
	bfi	w25, w1, 30, 1
	mov	w2, w19
	bfi	w25, w0, 29, 1
	mov	x3, x20
	mov	w1, w25
	mov	w0, 12
	orr	w23, w23, w24
	bl	MFDE_ConfigReg
	ldr	x2, .LC12
	mov	w3, w25
	mov	w1, 219
	mov	w0, 4
	bl	dprint_normal
	lsl	x0, x21, 7
	ldr	x1, .LC13
	sub	x21, x0, x21
	mov	x3, x20
	mov	w2, w19
	mov	w0, 16
	add	x21, x1, x21, lsl 3
	ldr	w25, [x21, 40]
	mov	w1, w25
	bl	MFDE_ConfigReg
	ldr	x22, .LC15
	mov	w3, w25
	mov	w1, 230
	mov	x2, x22
	mov	w0, 4
	bl	dprint_normal
	ldr	w21, [x21, 24]
	mov	x3, x20
	mov	w2, w19
	mov	w1, w21
	mov	w0, 20
	bl	MFDE_ConfigReg
	mov	w3, w21
	mov	x2, x22
	mov	w1, 241
	mov	w0, 4
	bl	dprint_normal
	ldr	w21, [x29, 120]
	mov	w2, w19
	mov	w0, 24
	and	w21, w21, -16
	mov	x3, x20
	mov	w1, w21
	bl	MFDE_ConfigReg
	ldr	x2, .LC17
	mov	w3, w21
	mov	w1, 252
	mov	w0, 4
	bl	dprint_normal
	ldr	w3, [x29, 112]
	cmp	w3, 1920
	cset	w0, hi
	tst	w0, w23
	beq	.L40
	ldr	w0, [x29, 168]
	cbnz	w0, .L88
.L40:
	cmp	w3, 4096
	mov	w2, w19
	cset	w21, ls
	mov	w0, 4
	mov	w1, w21
	mov	x3, x20
	bl	SCD_ConfigReg
	ldr	x2, .LC23
	mov	w3, w21
	mov	w1, 270
	mov	w0, 4
	bl	dprint_normal
	ldr	w21, [x29, 124]
	mov	w2, w19
	mov	w0, 96
	mov	w1, w21
	mov	x3, x20
	bl	MFDE_ConfigReg
	ldr	x2, .LC25
	mov	w3, w21
	mov	w1, 281
	mov	w0, 4
	bl	dprint_normal
	ldr	w21, [x29, 132]
	mov	w2, w19
	mov	w0, 100
	mov	w1, w21
	mov	x3, x20
	bl	MFDE_ConfigReg
	ldr	x2, .LC27
	mov	w3, w21
	mov	w1, 291
	mov	w0, 4
	bl	dprint_normal
	ldr	w21, [x29, 136]
	mov	w2, w19
	mov	w0, 104
	mov	w1, w21
	mov	x3, x20
	bl	MFDE_ConfigReg
	ldr	x2, .LC29
	mov	w3, w21
	mov	w1, 301
	mov	w0, 4
	bl	dprint_normal
	ldr	w21, [x29, 128]
	mov	w2, w19
	mov	w0, 108
	mov	x3, x20
	mov	w1, w21
	bl	MFDE_ConfigReg
	ldr	x2, .LC31
	mov	w3, w21
	mov	w1, 312
	mov	w0, 4
	bl	dprint_normal
	ldr	w0, [x29, 108]
	cbnz	w0, .L89
	mov	x3, x20
	mov	w2, w19
	mov	w1, 0
	mov	w0, 128
	bl	MFDE_ConfigReg
	ldr	x3, .LC32
	mov	w1, 357
	ldr	x2, .LC34
	mov	w0, 4
	ldr	w3, [x3]
	bl	dprint_normal
.L42:
	ldr	w0, [x29, 140]
	cbz	w0, .L43
	ldr	w21, [x29, 144]
	mov	w2, w19
	mov	w0, 116
	mov	x3, x20
	mov	w1, w21
	bl	MFDE_ConfigReg
	ldr	x2, .LC38
	mov	w3, w21
	mov	w1, 371
	mov	w0, 4
	bl	dprint_normal
	ldr	w21, [x29, 148]
	mov	w2, w19
	mov	w0, 120
	mov	w1, w21
	mov	x3, x20
	bl	MFDE_ConfigReg
	ldr	x2, .LC40
	mov	w3, w21
	mov	w1, 375
	mov	w0, 4
	bl	dprint_normal
	ldr	w21, [x29, 152]
	mov	w2, w19
	mov	w0, 124
	mov	x3, x20
	mov	w1, w21
	bl	MFDE_ConfigReg
	ldr	x2, .LC42
	mov	w3, w21
	mov	w1, 379
	mov	w0, 4
	bl	dprint_normal
.L43:
	mov	x3, x20
	mov	w2, w19
	mov	w1, -1
	mov	w0, 32
	bl	MFDE_ConfigReg
	ldr	x2, .LC44
	mov	w3, -1
	mov	w1, 321
	mov	w0, 4
	bl	dprint_normal
	mov	w0, 0
.L3:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L82:
	ldr	x0, .LC6
	ldrh	w0, [x0,w26,uxtw #1]
	adr	x1, .Lrtx6
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx6:
	.section	.rodata
	.align	0
	.align	2
.L6:
	.2byte	(.L5 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L7 - .Lrtx6) / 4
	.2byte	(.L8 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L5 - .Lrtx6) / 4
	.2byte	(.L9 - .Lrtx6) / 4
	.text
	.p2align 3
.L84:
	ldrb	w1, [x29, 167]
	mov	w27, 0
	bfi	w25, w1, 30, 1
.L25:
	sub	w1, w26, #14
	cmp	w1, 1
	bls	.L26
	cmp	w26, 4
	bhi	.L27
	orr	w25, w25, 1073741824
	b	.L27
	.p2align 3
.L8:
	add	x0, x27, 45056
	mov	w4, 0
	mov	w5, 0
	mov	w9, 44
	mov	x8, 240
	ldr	w7, [x0, 240]
	ldrb	w0, [x27, 144]
	strb	w0, [x29, 164]
	cbz	w7, .L18
	.p2align 2
.L68:
	smaddl	x0, w4, w9, x8
	mov	w2, 0
	add	x0, x27, x0
.L20:
	ldr	w1, [x0]
	add	w2, w2, 1
	cbz	w1, .L19
	ldr	w6, [x0, 8]
	and	w1, w1, -16
	cmp	w6, wzr
	ble	.L19
	cmp	w1, w5
	ccmp	w5, wzr, 4, hi
	csel	w5, w5, w1, ne
.L19:
	cmp	w2, 2
	add	x0, x0, 4
	bne	.L20
	add	w4, w4, 1
	cmp	w4, w7
	bne	.L68
.L18:
	ldrh	w1, [x27, 150]
	ldrh	w0, [x27, 146]
	str	w5, [x27, 196]
	str	w5, [x29, 120]
	mul	w0, w0, w1
	lsl	w1, w1, 4
	stp	w1, w0, [x29, 112]
	ldr	w1, [x27, 188]
	str	w1, [x29, 124]
	ldr	w1, [x27, 192]
	str	w1, [x29, 160]
	ldr	w1, [x27, 212]
	str	w1, [x29, 132]
	ldr	w1, [x27, 216]
	str	w1, [x29, 136]
	ldr	w1, [x27, 224]
	str	w1, [x29, 128]
.L44:
	ldr	w1, [x29, 172]
	cmp	w1, 1
	mov	w1, 1
	str	w1, [x29, 108]
	bne	.L24
	b	.L23
	.p2align 3
.L7:
	ldrb	w0, [x27, 151]
	mov	w4, 0
	ldr	w7, [x27, 14532]
	mov	w5, 0
	strb	w0, [x29, 164]
	mov	w9, 28
	mov	x8, 212
	cbz	w7, .L12
	.p2align 2
.L67:
	smaddl	x0, w4, w9, x8
	mov	w2, 2
	add	x0, x27, x0
.L14:
	ldr	w1, [x0]
	cbz	w1, .L13
	ldr	w6, [x0, -8]
	and	w1, w1, -16
	cmp	w1, w5
	ccmp	w5, wzr, 4, hi
	cbz	w6, .L13
	csel	w5, w5, w1, ne
.L13:
	subs	w2, w2, #1
	add	x0, x0, 4
	bne	.L14
	add	w4, w4, 1
	cmp	w4, w7
	bne	.L67
.L12:
	ldrh	w1, [x27, 152]
	mov	w25, 0
	ldrh	w0, [x27, 154]
	str	w5, [x27, 192]
	mul	w0, w0, w1
	lsl	w1, w1, 4
	stp	wzr, w1, [x29, 108]
	ldr	w1, [x27, 164]
	str	w1, [x29, 124]
	ldr	w1, [x27, 168]
	str	w1, [x29, 160]
	ldr	w1, [x27, 14536]
	str	w1, [x29, 132]
	ldr	w1, [x27, 14544]
	str	w1, [x29, 136]
	ldr	w1, [x27, 14552]
	stp	w0, w5, [x29, 116]
	str	w1, [x29, 128]
	b	.L16
	.p2align 3
.L5:
	ldr	w0, [x27, 284]
	ldr	w1, [x27, 940]
	str	w1, [x29, 172]
	add	x0, x27, x0, lsl 2
	ldr	w0, [x0, 300]
	str	w0, [x29, 124]
	ldr	w0, [x27, 20]
	lsl	w0, w0, 4
	str	w0, [x29, 112]
	ldrb	w0, [x27, 2]
	strb	w0, [x29, 166]
	ldrb	w0, [x27, 4]
	strb	w0, [x29, 164]
	ldr	w0, [x27, 592]
	str	w0, [x29, 120]
	ldr	w0, [x27, 936]
	str	w0, [x29, 168]
	ldr	w0, [x27, 428]
	str	w0, [x29, 156]
	ldr	w0, [x27, 432]
	str	w0, [x29, 160]
	ldr	w0, [x27, 576]
	str	w0, [x29, 132]
	ldr	w0, [x27, 296]
	str	w0, [x29, 136]
	ldr	w0, [x27, 588]
	str	w0, [x29, 128]
	ldr	w0, [x27, 596]
	str	w0, [x29, 116]
	b	.L10
	.p2align 3
.L9:
	ldr	w0, [x27, 1284]
	ldr	w1, [x27, 16]
	add	x0, x27, x0, lsl 2
	ldr	w0, [x0, 1336]
	str	w0, [x29, 124]
	ldr	w0, [x27, 20]
	add	w0, w0, 1
	madd	w0, w1, w0, w0
	ldr	w1, [x27, 192]
	str	w1, [x29, 112]
	ldrb	w1, [x27, 2]
	strb	w1, [x29, 167]
	ldr	w1, [x27, 1332]
	strb	w1, [x29, 166]
	ldrb	w1, [x27]
	strb	w1, [x29, 164]
	ldr	w1, [x27, 1324]
	str	w1, [x29, 120]
	ldr	w1, [x27, 1608]
	str	w1, [x29, 160]
	ldr	w1, [x27, 1292]
	str	w1, [x29, 132]
	ldr	w1, [x27, 1300]
	str	w1, [x29, 136]
	ldr	w1, [x27, 1308]
	str	w1, [x29, 128]
	ldr	w1, [x27, 1604]
	str	w1, [x29, 156]
	ldr	w1, [x27, 1312]
	str	w1, [x29, 144]
	ldr	w1, [x27, 1320]
	str	w1, [x29, 152]
	ldr	w1, [x27, 1316]
	str	w1, [x29, 148]
	mov	w1, 1
	str	w1, [x29, 140]
	str	w0, [x29, 116]
	ldr	w1, [x27, 4932]
	str	w1, [x29, 172]
	b	.L44
	.p2align 3
.L83:
	sub	w1, w26, #11
	cmp	w1, 1
	ccmp	w26, 17, 4, hi
	beq	.L23
	b	.L44
	.p2align 3
.L30:
	orr	w25, w25, 16777216
	cbz	w27, .L90
.L32:
	orr	w25, w25, 4194304
	b	.L33
	.p2align 3
.L85:
	ldrb	w1, [x29, 166]
	cmp	w26, 3
	bfi	w25, w1, 14, 1
	bne	.L37
.L86:
	and	w25, w25, -32769
	and	w25, w25, -769
	b	.L38
	.p2align 3
.L89:
	ldr	x21, .LC32
	mov	x3, x20
	mov	w2, w19
	mov	w0, 128
	ldr	w1, [x21]
	bl	MFDE_ConfigReg
	ldr	w3, [x21]
	mov	w1, 348
	ldr	x2, .LC34
	mov	w0, 4
	bl	dprint_normal
	ldr	w1, [x29, 160]
	mov	x3, x20
	mov	w2, w19
	mov	w0, 132
	bl	MFDE_ConfigReg
	ldr	x2, .LC36
	mov	w1, 351
	ldr	w3, [x29, 160]
	mov	w0, 4
	bl	dprint_normal
	b	.L42
.L88:
	ldr	x2, .LC19
	mov	w1, 263
	mov	w0, 1
	bl	dprint_normal
	ldr	x2, .LC21
	mov	w1, 1039
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L87:
	ldrb	w1, [x29, 165]
	cmp	w1, 1
	ccmp	w1, 3, 4, hi
	cset	w1, eq
	bfi	w25, w1, 15, 1
	b	.L38
.L81:
	ldr	x2, .LC4
	mov	w1, 998
	bl	dprint_normal
	mov	w0, -1
	b	.L3
	.size	HAL_CfgVdmReg, .-HAL_CfgVdmReg
	.align	3
.LC2:
	.xword	g_VdmDrvParam
	.align	3
.LC4:
	.xword	.LC3
	.align	3
.LC5:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC6:
	.xword	.L6
	.align	3
.LC8:
	.xword	.LC7
	.align	3
.LC9:
	.xword	.LANCHOR0
	.align	3
.LC10:
	.xword	s_pstVfmwChan
	.align	3
.LC12:
	.xword	.LC11
	.align	3
.LC13:
	.xword	g_HwMem
	.align	3
.LC15:
	.xword	.LC14
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC19:
	.xword	.LC18
	.align	3
.LC21:
	.xword	.LC20
	.align	3
.LC23:
	.xword	.LC22
	.align	3
.LC25:
	.xword	.LC24
	.align	3
.LC27:
	.xword	.LC26
	.align	3
.LC29:
	.xword	.LC28
	.align	3
.LC31:
	.xword	.LC30
	.align	3
.LC32:
	.xword	g_BackTunnelCtrl
	.align	3
.LC34:
	.xword	.LC33
	.align	3
.LC36:
	.xword	.LC35
	.align	3
.LC38:
	.xword	.LC37
	.align	3
.LC40:
	.xword	.LC39
	.align	3
.LC42:
	.xword	.LC41
	.align	3
.LC44:
	.xword	.LC43
	.section	.rodata
	.align	3
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
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC3:
	ASCII(.string	"Protrol Not Support!\n" )
	.zero	2
.LC7:
	ASCII(.string	"BASIC_CFG0 = 0x%x\n" )
	.zero	5
.LC11:
	ASCII(.string	"BASIC_CFG1 = 0x%x\n" )
	.zero	5
.LC14:
	ASCII(.string	"VAM_ADDR = 0x%x\n" )
	.zero	7
.LC16:
	ASCII(.string	"VREG_STREAM_BASE_ADDR = 0x%x\n" )
	.zero	2
.LC18:
	ASCII(.string	"ERROR: not support H264 MBAFF(pic_width %d) ext ram, for it needs double size!!\n" )
	.zero	7
.LC20:
	ASCII(.string	"Configure EMAR FAILed!\n" )
.LC22:
	ASCII(.string	"REG_EMAR_ID = 0x%x\n" )
	.zero	4
.LC24:
	ASCII(.string	"YSTADDR_1D = 0x%x\n" )
	.zero	5
.LC26:
	ASCII(.string	"YSTRIDE_1D = 0x%x\n" )
	.zero	5
.LC28:
	ASCII(.string	"UVOFFSET_1D = 0x%x\n" )
	.zero	4
.LC30:
	ASCII(.string	"VREG_HEAD_INF_OFFSET = 0x%x\n" )
	.zero	3
.LC33:
	ASCII(.string	"VREG_BACKTUNL_CTRL = 0x%x\n" )
	.zero	5
.LC35:
	ASCII(.string	"VREG_BACKTUNL_ADDR = 0x%x\n" )
	.zero	5
.LC37:
	ASCII(.string	"VREG_YSTRIDE_2BIT = 0x%x\n" )
	.zero	6
.LC39:
	ASCII(.string	"VREG_YOFFSET_2BIT = 0x%x\n" )
	.zero	6
.LC41:
	ASCII(.string	"VREG_UVOFFSET_2BIT = 0x%x\n" )
	.zero	5
.LC43:
	ASCII(.string	"VREG_INT_STATE = 0x%x\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
