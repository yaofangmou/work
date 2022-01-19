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
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w19, w0
	mov	x0, x30
	sxtw	x23, w2
	mov	x20, x1
	mov	x22, x3
	bl	_mcount
	lsl	x0, x23, 3
	ldr	x1, .LC3
	sub	x0, x0, x23
	cmp	w19, 4
	mov	x21, x23
	add	x0, x1, x0, lsl 3
	ldr	w24, [x0, 8]
	bls	.L2
	and	w0, w19, -9
	cmp	w0, 6
	beq	.L2
	sub	w1, w19, #10
	sub	w0, w19, #15
	cmp	w1, 3
	ccmp	w0, 1, 0, hi
	bhi	.L126
.L2:
	ldr	x3, .LC6
	mov	x2, 64
	mov	w1, 0
	add	x0, x29, 96
	ldr	x3, [x3, 96]
	blr	x3
	cmp	w19, 16
	bls	.L127
.L4:
	ldr	w0, [x29, 100]
.L15:
	sub	w1, w19, #1
	cmp	w1, 1
	ccmp	w19, 10, 4, hi
	bne	.L128
.L42:
	cmp	w19, 16
	mov	w26, 0
	mov	w20, 0
	beq	.L129
.L44:
	cmp	w19, 6
	cset	w27, eq
	cmp	w19, 18
	cset	w1, eq
	orr	w1, w27, w1
	cbz	w1, .L130
.L46:
	mov	w20, 1073741824
.L45:
	ands	w1, w19, -17
	cset	w28, eq
	cmp	w19, wzr
	cset	w25, eq
	cbnz	w1, .L47
	ldr	w1, [x29, 156]
	cmp	w1, wzr
	orr	w1, w20, 201326592
	csel	w20, w1, w20, ne
.L47:
	cmp	w19, 14
	sub	w3, w19, #2
	cset	w2, eq
	tst	w3, -3
	cset	w1, eq
	orr	w1, w2, w1
	orr	w20, w20, w1, lsl 25
	orr	w1, w27, w25
	cbnz	w1, .L49
	sub	w1, w19, #15
	cmp	w1, 1
	bls	.L49
	sub	w1, w19, #8
	cmp	w1, 1
	bls	.L49
	and	w1, w19, -3
	cmp	w1, 1
	beq	.L49
	cbnz	w27, .L51
	.p2align 2
.L136:
	cmp	w3, 2
	cset	w1, ls
	orr	w2, w2, w1
	cbnz	w2, .L51
.L52:
	sub	w0, w0, #1
	mov	w2, w21
	bfi	w20, w0, 0, 20
	mov	x3, x22
	mov	w1, w20
	mov	w0, 8
	bl	MFDE_ConfigReg
	ldr	x2, .LC9
	mov	w3, w20
	mov	w1, 119
	mov	w0, 4
	mov	w20, 0
	bl	dprint_normal
	cmp	w19, 18
	mov	w0, 15
	bhi	.L53
	ldr	x0, .LC10
	ldr	w0, [x0, w19, uxtw 2]
	and	w0, w0, 15
.L53:
	bfi	w20, w0, 0, 4
	ldr	x0, .LC11
	cmp	w19, 15
	ldr	x0, [x0, w24, sxtw 3]
	cset	w24, eq
	orr	w1, w24, w28
	add	x0, x0, 217088
	ldr	w2, [x0, 3952]
	bfi	w20, w2, 12, 1
	cbnz	w1, .L131
	cmp	w19, 3
	orr	w20, w20, 16384
	beq	.L132
.L56:
	cbnz	w27, .L133
	orr	w20, w20, 32768
.L57:
	ldr	w1, [x0, 3900]
	mov	w0, 3
	bfi	w20, w0, 16, 13
	ldrb	w0, [x29, 148]
	bfi	w20, w1, 30, 1
	mov	w2, w21
	bfi	w20, w0, 29, 1
	mov	x3, x22
	mov	w1, w20
	mov	w0, 12
	orr	w25, w24, w25
	bl	MFDE_ConfigReg
	ldr	x2, .LC13
	mov	w3, w20
	mov	w1, 219
	mov	w0, 4
	bl	dprint_normal
	lsl	x0, x23, 7
	ldr	x1, .LC14
	sub	x23, x0, x23
	mov	x3, x22
	mov	w2, w21
	mov	w0, 16
	add	x23, x1, x23, lsl 3
	ldr	w20, [x23, 40]
	mov	w1, w20
	bl	MFDE_ConfigReg
	ldr	x19, .LC16
	mov	w3, w20
	mov	w1, 230
	mov	x2, x19
	mov	w0, 4
	bl	dprint_normal
	ldr	w20, [x23, 24]
	mov	x3, x22
	mov	w2, w21
	mov	w0, 20
	mov	w1, w20
	bl	MFDE_ConfigReg
	mov	x2, x19
	mov	w3, w20
	mov	w1, 241
	mov	w0, 4
	bl	dprint_normal
	ldr	w19, [x29, 104]
	mov	w2, w21
	mov	w0, 24
	and	w19, w19, -16
	mov	x3, x22
	mov	w1, w19
	bl	MFDE_ConfigReg
	ldr	x2, .LC18
	mov	w3, w19
	mov	w1, 252
	mov	w0, 4
	bl	dprint_normal
	ldr	w3, [x29, 96]
	cmp	w3, 1920
	cset	w0, hi
	tst	w0, w25
	beq	.L59
	ldr	w0, [x29, 152]
	cbnz	w0, .L134
.L59:
	cmp	w3, 4096
	mov	w2, w21
	cset	w19, ls
	mov	w0, 4
	mov	w1, w19
	mov	x3, x22
	bl	SCD_ConfigReg
	ldr	x2, .LC24
	mov	w3, w19
	mov	w1, 270
	mov	w0, 4
	bl	dprint_normal
	ldr	w19, [x29, 108]
	mov	w2, w21
	mov	w0, 96
	mov	w1, w19
	mov	x3, x22
	bl	MFDE_ConfigReg
	ldr	x2, .LC26
	mov	w3, w19
	mov	w1, 281
	mov	w0, 4
	bl	dprint_normal
	ldr	w19, [x29, 116]
	mov	w2, w21
	mov	w0, 100
	mov	w1, w19
	mov	x3, x22
	bl	MFDE_ConfigReg
	ldr	x2, .LC28
	mov	w3, w19
	mov	w1, 291
	mov	w0, 4
	bl	dprint_normal
	ldr	w19, [x29, 120]
	mov	w2, w21
	mov	w0, 104
	mov	w1, w19
	mov	x3, x22
	bl	MFDE_ConfigReg
	ldr	x2, .LC30
	mov	w3, w19
	mov	w1, 301
	mov	w0, 4
	bl	dprint_normal
	ldr	w19, [x29, 112]
	mov	w2, w21
	mov	w0, 108
	mov	x3, x22
	mov	w1, w19
	bl	MFDE_ConfigReg
	ldr	x2, .LC32
	mov	w3, w19
	mov	w1, 312
	mov	w0, 4
	bl	dprint_normal
	cbnz	w26, .L135
	mov	x3, x22
	mov	w2, w21
	mov	w1, 0
	mov	w0, 128
	bl	MFDE_ConfigReg
	ldr	x3, .LC33
	mov	w1, 357
	ldr	x2, .LC35
	mov	w0, 4
	ldr	w3, [x3]
	bl	dprint_normal
.L61:
	ldr	w0, [x29, 124]
	cbz	w0, .L62
	ldr	w19, [x29, 128]
	mov	w2, w21
	mov	w0, 116
	mov	x3, x22
	mov	w1, w19
	bl	MFDE_ConfigReg
	ldr	x2, .LC39
	mov	w3, w19
	mov	w1, 371
	mov	w0, 4
	bl	dprint_normal
	ldr	w19, [x29, 132]
	mov	w2, w21
	mov	w0, 120
	mov	w1, w19
	mov	x3, x22
	bl	MFDE_ConfigReg
	ldr	x2, .LC41
	mov	w3, w19
	mov	w1, 375
	mov	w0, 4
	bl	dprint_normal
	ldr	w19, [x29, 136]
	mov	w2, w21
	mov	w0, 124
	mov	x3, x22
	mov	w1, w19
	bl	MFDE_ConfigReg
	ldr	x2, .LC43
	mov	w3, w19
	mov	w1, 379
	mov	w0, 4
	bl	dprint_normal
.L62:
	mov	x3, x22
	mov	w2, w21
	mov	w1, -1
	mov	w0, 32
	bl	MFDE_ConfigReg
	ldr	x2, .LC45
	mov	w3, -1
	mov	w1, 321
	mov	w0, 4
	bl	dprint_normal
	mov	w0, 0
.L122:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L127:
	ldr	x0, .LC7
	ldrh	w0, [x0,w19,uxtw #1]
	adr	x1, .Lrtx6
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx6:
	.section	.rodata
	.align	0
	.align	2
.L6:
	.2byte	(.L5 - .Lrtx6) / 4
	.2byte	(.L7 - .Lrtx6) / 4
	.2byte	(.L8 - .Lrtx6) / 4
	.2byte	(.L9 - .Lrtx6) / 4
	.2byte	(.L10 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L11 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L12 - .Lrtx6) / 4
	.2byte	(.L12 - .Lrtx6) / 4
	.2byte	(.L12 - .Lrtx6) / 4
	.2byte	(.L13 - .Lrtx6) / 4
	.2byte	(.L10 - .Lrtx6) / 4
	.2byte	(.L5 - .Lrtx6) / 4
	.2byte	(.L14 - .Lrtx6) / 4
	.text
	.p2align 3
.L130:
	sub	w1, w19, #14
	cmp	w1, 1
	bls	.L46
	cmp	w19, 4
	bls	.L46
	b	.L45
	.p2align 3
.L128:
	sub	w1, w19, #11
	cmp	w1, 1
	ccmp	w19, 17, 4, hi
	beq	.L42
	b	.L63
	.p2align 3
.L49:
	orr	w20, w20, 16777216
	cbz	w27, .L136
.L51:
	orr	w20, w20, 4194304
	b	.L52
	.p2align 3
.L12:
	ldrh	w1, [x20, 106]
	ldrh	w0, [x20, 108]
	ldrb	w3, [x20, 104]
	ldr	w2, [x20, 112]
	strb	w3, [x29, 148]
	ldr	w3, [x20, 228]
	mul	w0, w0, w1
	stp	w2, w3, [x29, 104]
	lsl	w1, w1, 4
	ldr	w2, [x20, 232]
	stp	w1, w0, [x29, 96]
	ldr	w3, [x20, 244]
	ldr	w1, [x20, 260]
	str	w2, [x29, 144]
	ldr	w2, [x20, 252]
	stp	w1, w3, [x29, 112]
	str	w2, [x29, 120]
	b	.L15
	.p2align 3
.L11:
	ldr	w0, [x20, 116]
	mov	w4, 0
	ldrb	w2, [x20, 20]
	ldrb	w1, [x20, 52]
	cmp	w0, wzr
	strb	w2, [x29, 149]
	strb	w1, [x29, 148]
	ble	.L38
	sub	w0, w0, #1
	mov	w6, 28
	mov	x1, 596
	add	x3, x20, 568
	mov	w4, 0
	umaddl	x6, w0, w6, x1
	add	x6, x20, x6
	.p2align 2
.L41:
	mov	x0, x3
	mov	w2, 2
.L40:
	ldr	w1, [x0]
	cbz	w1, .L39
	ldr	w5, [x0, 8]
	and	w1, w1, -16
	cmp	w5, wzr
	ble	.L39
	cmp	w1, w4
	ccmp	w4, wzr, 4, hi
	csel	w4, w4, w1, ne
.L39:
	subs	w2, w2, #1
	add	x0, x0, 4
	bne	.L40
	add	x3, x3, 28
	cmp	x6, x3
	bne	.L41
.L38:
	ldrh	w0, [x20, 72]
	ldrh	w2, [x20, 74]
	lsl	w1, w0, 4
	ldr	w3, [x20, 132]
	stp	w4, w3, [x29, 104]
	mul	w0, w2, w0
	stp	w1, w0, [x29, 96]
	ldr	w1, [x20, 16]
	ldr	w2, [x20, 540]
	ldr	w3, [x20, 536]
	str	w1, [x29, 144]
	ldr	w1, [x20, 548]
	str	w4, [x20, 80]
	str	w2, [x29, 120]
	str	w3, [x29, 116]
	str	w1, [x29, 112]
.L63:
	ldr	w1, [x29, 156]
	mov	w26, 1
	cmp	w1, w26
	beq	.L42
	cmp	w19, 16
	mov	w20, 0
	bne	.L44
.L129:
	ldrb	w1, [x29, 151]
	mov	w27, 0
	bfi	w20, w1, 30, 1
	b	.L45
	.p2align 3
.L10:
	ldrb	w0, [x20, 155]
	mov	w3, 0
	ldr	w6, [x20, 14536]
	mov	w4, 0
	strb	w0, [x29, 148]
	mov	w8, 28
	mov	x7, 220
	cbz	w6, .L33
	.p2align 2
.L100:
	smaddl	x0, w3, w8, x7
	mov	w2, 2
	add	x0, x20, x0
.L35:
	ldr	w1, [x0]
	cbz	w1, .L34
	ldr	w5, [x0, -12]
	and	w1, w1, -16
	cmp	w1, w4
	ccmp	w4, wzr, 4, hi
	cbz	w5, .L34
	csel	w4, w4, w1, ne
.L34:
	subs	w2, w2, #1
	add	x0, x0, 4
	bne	.L35
	add	w3, w3, 1
	cmp	w3, w6
	bne	.L100
.L33:
	ldrh	w0, [x20, 158]
	ldrh	w2, [x20, 160]
	lsl	w1, w0, 4
	ldr	w3, [x20, 172]
	stp	w4, w3, [x29, 104]
	mul	w0, w2, w0
	stp	w1, w0, [x29, 96]
	ldr	w1, [x20, 176]
	ldr	w2, [x20, 14552]
	ldr	w3, [x20, 14544]
	str	w1, [x29, 144]
	ldr	w1, [x20, 14560]
	str	w4, [x20, 196]
	str	w2, [x29, 120]
	str	w3, [x29, 116]
	str	w1, [x29, 112]
	b	.L15
	.p2align 3
.L9:
	add	x0, x20, 45056
	ldrb	w1, [x20, 144]
	strb	w1, [x29, 148]
	mov	w3, 0
	mov	w4, 0
	mov	w8, 44
	ldr	w6, [x0, 240]
	mov	x7, 240
	cbz	w6, .L27
	.p2align 2
.L99:
	smaddl	x0, w3, w8, x7
	mov	w2, 2
	add	x0, x20, x0
.L29:
	ldr	w1, [x0]
	cbz	w1, .L28
	ldr	w5, [x0, 8]
	and	w1, w1, -16
	cmp	w5, wzr
	ble	.L28
	cmp	w1, w4
	ccmp	w4, wzr, 4, hi
	csel	w4, w4, w1, ne
.L28:
	subs	w2, w2, #1
	add	x0, x0, 4
	bne	.L29
	add	w3, w3, 1
	cmp	w3, w6
	bne	.L99
.L27:
	ldrh	w0, [x20, 150]
	ldrh	w2, [x20, 146]
	lsl	w1, w0, 4
	ldr	w3, [x20, 188]
	stp	w4, w3, [x29, 104]
	mul	w0, w2, w0
	stp	w1, w0, [x29, 96]
	ldr	w1, [x20, 192]
	ldr	w2, [x20, 216]
	ldr	w3, [x20, 212]
	str	w1, [x29, 144]
	ldr	w1, [x20, 224]
	str	w4, [x20, 196]
	str	w2, [x29, 120]
	str	w3, [x29, 116]
	str	w1, [x29, 112]
	b	.L63
	.p2align 3
.L8:
	ldrb	w0, [x20, 151]
	mov	w3, 0
	ldr	w6, [x20, 14532]
	mov	w4, 0
	strb	w0, [x29, 148]
	mov	w8, 28
	mov	x7, 212
	cbz	w6, .L22
	.p2align 2
.L98:
	smaddl	x0, w3, w8, x7
	mov	w2, 2
	add	x0, x20, x0
.L24:
	ldr	w1, [x0]
	cbz	w1, .L23
	ldr	w5, [x0, -8]
	and	w1, w1, -16
	cmp	w1, w4
	ccmp	w4, wzr, 4, hi
	cbz	w5, .L23
	csel	w4, w4, w1, ne
.L23:
	subs	w2, w2, #1
	add	x0, x0, 4
	bne	.L24
	add	w3, w3, 1
	cmp	w3, w6
	bne	.L98
.L22:
	ldrh	w0, [x20, 152]
	ldrh	w2, [x20, 154]
	lsl	w1, w0, 4
	ldr	w3, [x20, 164]
	stp	w4, w3, [x29, 104]
	mul	w0, w2, w0
	stp	w1, w0, [x29, 96]
	ldr	w1, [x20, 168]
	ldr	w2, [x20, 14544]
	ldr	w3, [x20, 14536]
	str	w1, [x29, 144]
	ldr	w1, [x20, 14552]
	str	w4, [x20, 192]
	str	w2, [x29, 120]
	str	w3, [x29, 116]
	str	w1, [x29, 112]
.L20:
	mov	w20, 0
	mov	w26, 0
	b	.L44
	.p2align 3
.L7:
	ldrb	w0, [x20, 4]
	ldrb	w2, [x20, 75]
	ldr	w1, [x20, 212]
	cmp	w0, 2
	strb	w2, [x29, 148]
	str	w1, [x20, 156]
	beq	.L137
.L16:
	ldrh	w0, [x20, 82]
	and	w1, w1, -16
	ldp	w5, w4, [x20, 180]
	lsl	w0, w0, 4
	ldr	w3, [x20, 160]
	ldr	w2, [x20, 168]
	str	w1, [x20, 156]
	str	w0, [x29, 96]
	stp	w1, w5, [x29, 104]
	ldr	w0, [x20, 152]
	ldr	w1, [x20, 176]
	stp	w3, w2, [x29, 116]
	str	w4, [x29, 144]
	str	w0, [x29, 100]
	str	w1, [x29, 112]
	b	.L20
	.p2align 3
.L5:
	ldr	w0, [x20, 284]
	ldr	w1, [x20, 20]
	ldrb	w3, [x20, 2]
	add	x0, x20, x0, lsl 2
	lsl	w1, w1, 4
	ldrb	w2, [x20, 4]
	str	w1, [x29, 96]
	ldr	w1, [x20, 936]
	ldr	w0, [x0, 300]
	strb	w3, [x29, 150]
	strb	w2, [x29, 148]
	ldr	w3, [x20, 592]
	ldr	w2, [x20, 428]
	str	w1, [x29, 152]
	ldr	w1, [x20, 432]
	stp	w3, w0, [x29, 104]
	ldr	w4, [x20, 940]
	str	w2, [x29, 140]
	ldr	w3, [x20, 576]
	ldr	w2, [x20, 296]
	ldr	w0, [x20, 596]
	str	w1, [x29, 144]
	ldr	w1, [x20, 588]
	str	w4, [x29, 156]
	str	w0, [x29, 100]
	stp	w3, w2, [x29, 116]
	str	w1, [x29, 112]
	b	.L15
	.p2align 3
.L14:
	ldr	w1, [x20, 1284]
	ldr	w3, [x20, 192]
	str	w3, [x29, 96]
	add	x1, x20, x1, lsl 2
	ldrb	w3, [x20, 2]
	strb	w3, [x29, 151]
	ldr	w3, [x20, 1332]
	ldr	w1, [x1, 1336]
	strb	w3, [x29, 150]
	ldrb	w3, [x20]
	str	w1, [x29, 108]
	strb	w3, [x29, 148]
	ldr	w1, [x20, 1608]
	ldr	w3, [x20, 1324]
	ldp	w2, w0, [x20, 16]
	str	w3, [x29, 104]
	str	w1, [x29, 144]
	add	w0, w0, 1
	ldr	w3, [x20, 1292]
	ldr	w1, [x20, 1300]
	stp	w3, w1, [x29, 116]
	ldr	w3, [x20, 1308]
	ldr	w1, [x20, 1604]
	str	w3, [x29, 112]
	mov	w3, 1
	str	w1, [x29, 140]
	ldr	w1, [x20, 1312]
	stp	w3, w1, [x29, 124]
	ldr	w1, [x20, 1316]
	ldr	w3, [x20, 1320]
	stp	w1, w3, [x29, 132]
	madd	w0, w2, w0, w0
	str	w0, [x29, 100]
	ldr	w1, [x20, 4932]
	str	w1, [x29, 156]
	b	.L63
	.p2align 3
.L13:
	ldr	w1, [x20, 2788]
	ldr	w0, [x20, 2792]
	ldrb	w3, [x20, 2778]
	ldr	w2, [x20, 2816]
	strb	w3, [x29, 148]
	ldr	w3, [x20, 3120]
	mul	w0, w1, w0
	stp	w2, w3, [x29, 104]
	lsl	w1, w1, 4
	ldr	w2, [x20, 3124]
	stp	w1, w0, [x29, 96]
	ldr	w3, [x20, 2796]
	ldr	w1, [x20, 3156]
	str	w2, [x29, 144]
	ldr	w2, [x20, 3148]
	stp	w1, w3, [x29, 112]
	str	w2, [x29, 120]
	b	.L63
	.p2align 3
.L131:
	ldrb	w1, [x29, 150]
	cmp	w19, 3
	bfi	w20, w1, 14, 1
	bne	.L56
.L132:
	and	w20, w20, -32769
	and	w20, w20, -769
	b	.L57
	.p2align 3
.L135:
	ldr	x19, .LC33
	mov	x3, x22
	mov	w2, w21
	mov	w0, 128
	ldr	w1, [x19]
	bl	MFDE_ConfigReg
	ldr	w3, [x19]
	mov	w1, 348
	ldr	x2, .LC35
	mov	w0, 4
	bl	dprint_normal
	ldr	w1, [x29, 144]
	mov	x3, x22
	mov	w2, w21
	mov	w0, 132
	bl	MFDE_ConfigReg
	ldr	x2, .LC37
	mov	w1, 351
	ldr	w3, [x29, 144]
	mov	w0, 4
	bl	dprint_normal
	b	.L61
	.p2align 3
.L133:
	ldrb	w1, [x29, 149]
	cmp	w1, 1
	ccmp	w1, 3, 4, hi
	cset	w1, eq
	bfi	w20, w1, 15, 1
	b	.L57
.L134:
	ldr	x2, .LC20
	mov	w1, 263
	mov	w0, 1
	bl	dprint_normal
	ldr	x2, .LC22
	mov	w1, 1039
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L137:
	ldrb	w0, [x20, 74]
	cbz	w0, .L16
	sub	w2, w0, #1
	mov	w4, 56
	mov	x3, 256
	add	x0, x20, 200
	umaddl	x3, w2, w4, x3
	add	x3, x20, x3
	.p2align 2
.L19:
	ldr	x2, [x0]
	cbz	x2, .L17
	ldr	w2, [x0, 28]
	cmp	w1, w2
	bhi	.L123
.L17:
	ldr	w2, [x0, 12]
	cmp	w1, w2
	bls	.L18
.L123:
	mov	w1, w2
	str	w2, [x20, 156]
.L18:
	add	x0, x0, 56
	cmp	x3, x0
	bne	.L19
	b	.L16
.L126:
	ldr	x2, .LC5
	mov	w1, 998
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L122
	.size	HAL_CfgVdmReg, .-HAL_CfgVdmReg
	.align	3
.LC3:
	.xword	g_VdmDrvParam
	.align	3
.LC5:
	.xword	.LC4
	.align	3
.LC6:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC7:
	.xword	.L6
	.align	3
.LC9:
	.xword	.LC8
	.align	3
.LC10:
	.xword	.LANCHOR0
	.align	3
.LC11:
	.xword	s_pstVfmwChan
	.align	3
.LC13:
	.xword	.LC12
	.align	3
.LC14:
	.xword	g_HwMem
	.align	3
.LC16:
	.xword	.LC15
	.align	3
.LC18:
	.xword	.LC17
	.align	3
.LC20:
	.xword	.LC19
	.align	3
.LC22:
	.xword	.LC21
	.align	3
.LC24:
	.xword	.LC23
	.align	3
.LC26:
	.xword	.LC25
	.align	3
.LC28:
	.xword	.LC27
	.align	3
.LC30:
	.xword	.LC29
	.align	3
.LC32:
	.xword	.LC31
	.align	3
.LC33:
	.xword	g_BackTunnelCtrl
	.align	3
.LC35:
	.xword	.LC34
	.align	3
.LC37:
	.xword	.LC36
	.align	3
.LC39:
	.xword	.LC38
	.align	3
.LC41:
	.xword	.LC40
	.align	3
.LC43:
	.xword	.LC42
	.align	3
.LC45:
	.xword	.LC44
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	CSWTCH.13, %object
	.size	CSWTCH.13, 76
CSWTCH.13:
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
.LC4:
	ASCII(.string	"Protrol Not Support!\n" )
	.zero	2
.LC8:
	ASCII(.string	"BASIC_CFG0 = 0x%x\n" )
	.zero	5
.LC12:
	ASCII(.string	"BASIC_CFG1 = 0x%x\n" )
	.zero	5
.LC15:
	ASCII(.string	"VAM_ADDR = 0x%x\n" )
	.zero	7
.LC17:
	ASCII(.string	"VREG_STREAM_BASE_ADDR = 0x%x\n" )
	.zero	2
.LC19:
	ASCII(.string	"ERROR: not support H264 MBAFF(pic_width %d) ext ram, for it needs double size!!\n" )
	.zero	7
.LC21:
	ASCII(.string	"Configure EMAR FAILed!\n" )
.LC23:
	ASCII(.string	"REG_EMAR_ID = 0x%x\n" )
	.zero	4
.LC25:
	ASCII(.string	"YSTADDR_1D = 0x%x\n" )
	.zero	5
.LC27:
	ASCII(.string	"YSTRIDE_1D = 0x%x\n" )
	.zero	5
.LC29:
	ASCII(.string	"UVOFFSET_1D = 0x%x\n" )
	.zero	4
.LC31:
	ASCII(.string	"VREG_HEAD_INF_OFFSET = 0x%x\n" )
	.zero	3
.LC34:
	ASCII(.string	"VREG_BACKTUNL_CTRL = 0x%x\n" )
	.zero	5
.LC36:
	ASCII(.string	"VREG_BACKTUNL_ADDR = 0x%x\n" )
	.zero	5
.LC38:
	ASCII(.string	"VREG_YSTRIDE_2BIT = 0x%x\n" )
	.zero	6
.LC40:
	ASCII(.string	"VREG_YOFFSET_2BIT = 0x%x\n" )
	.zero	6
.LC42:
	ASCII(.string	"VREG_UVOFFSET_2BIT = 0x%x\n" )
	.zero	5
.LC44:
	ASCII(.string	"VREG_INT_STATE = 0x%x\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
