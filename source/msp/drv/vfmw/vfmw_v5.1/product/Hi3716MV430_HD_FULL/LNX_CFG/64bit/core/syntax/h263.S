#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"h263.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	H263_log2bin
	.type	H263_log2bin, %function
H263_log2bin:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	cbz	w19, .L2
	.p2align 2
.L3:
	add	w0, w0, 1
	lsr	w19, w19, 1
	sxth	w0, w0
	cbnz	w19, .L3
.L2:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H263_log2bin, .-H263_log2bin
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_GetUserDataBuf
	.type	H263_GetUserDataBuf, %function
H263_GetUserDataBuf:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x1
	mov	w19, w2
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x20, w19, uxtw 3]
	cbz	x0, .L12
.L8:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L12:
	mov	w0, w21
	bl	GetUsd
	str	x0, [x20, w19, uxtw 3]
	cbz	x0, .L8
	add	w1, w19, 4
	str	w1, [x0, 1040]
	ldr	x0, [x20, w19, uxtw 3]
	b	.L8
	.size	H263_GetUserDataBuf, .-H263_GetUserDataBuf
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_ClearUsrData
	.type	H263_ClearUsrData, %function
H263_ClearUsrData:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	x19, 0
	mov	x20, x1
	bl	_mcount
.L14:
	ldr	x1, [x20, x19]
	mov	w0, w21
	bl	FreeUsdByDec
	str	xzr, [x20, x19]
	add	x19, x19, 8
	cmp	x19, 32
	bne	.L14
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	H263_ClearUsrData, .-H263_ClearUsrData
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Syntax_Init
	.type	H263_Syntax_Init, %function
H263_Syntax_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 16384
	add	x20, x20, 20480
	bl	_mcount
	ldr	x21, .LC4
	mov	x2, 24
	mov	w1, 0
	add	x0, x19, 3568
	ldr	x3, [x21, 96]
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 604
	mov	w1, 0
	add	x0, x19, 3592
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 68
	mov	w1, 0
	add	x0, x20, 704
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 776
	mov	w1, 0
	add	x0, x20, 772
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 7
	mov	w1, 0
	add	x0, x20, 1548
	blr	x3
	ldr	x3, .LC5
	mov	w1, 1
	mov	w0, 1
	strb	w1, [x20, 789]
	str	w0, [x20, 2176]
	add	x1, x19, 3680
	add	x4, x3, 256
	mov	w2, 8
	add	x0, x3, 4
	b	.L19
	.p2align 3
.L17:
	ldr	w2, [x0], 4
.L19:
	str	w2, [x1], 4
	cmp	x0, x4
	bne	.L17
	add	x0, x3, 260
	add	x1, x19, 3936
	add	x3, x3, 512
	mov	w2, 16
	b	.L18
	.p2align 3
.L21:
	ldr	w2, [x0], 4
.L18:
	str	w2, [x1], 4
	cmp	x0, x3
	bne	.L21
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	H263_Syntax_Init, .-H263_Syntax_Init
	.align	3
.LC4:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC5:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Global_Data_Init
	.type	H263_Global_Data_Init, %function
H263_Global_Data_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 20480
	bl	_mcount
	ldr	x21, .LC8
	mov	x2, 32
	mov	w1, 0
	add	x0, x19, 1592
	ldr	x3, [x21, 96]
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 24
	mov	w1, 0
	add	x0, x19, 1560
	blr	x3
	mov	x0, x20
	bl	H263_Syntax_Init
	str	xzr, [x20, 22616]
	str	xzr, [x20, 22624]
	add	x2, x19, 2048
	str	xzr, [x20, 22632]
	mov	w0, 0
	str	xzr, [x20, 22640]
	str	wzr, [x19, 1628]
	str	wzr, [x19, 2088]
	str	wzr, [x19, 2092]
	str	wzr, [x19, 2096]
	str	wzr, [x19, 2104]
	str	xzr, [x20, 22648]
	stp	wzr, wzr, [x2, 60]
	stp	wzr, wzr, [x2, 68]
	str	wzr, [x19, 2124]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	H263_Global_Data_Init, .-H263_Global_Data_Init
	.align	3
.LC8:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Frame_Init
	.type	H263_Frame_Init, %function
H263_Frame_Init:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w22, w1
	mov	w21, w2
	bl	_mcount
	add	x20, x19, 20480
	ldr	x3, .LC9
	mov	x2, 36
	mov	w1, 0
	add	x0, x29, 56
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x3, [x19, 22064]
	mov	w0, 14
	stp	w22, w21, [x29, 72]
	ldrb	w1, [x19]
	mov	w4, 4
	ldr	w2, [x3, 16]
	cmp	w1, 1
	mov	w1, 3
	csel	w4, w0, w4, eq
	cmp	w2, 24
	csinc	w0, w1, wzr, ne
	str	w0, [x29, 80]
	ldr	w0, [x20, 2792]
	mov	w2, 0
	ldr	w5, [x3, 16]
	mov	w3, 2
	str	w4, [x29, 56]
	add	x1, x29, 56
	cmp	w5, 24
	mov	w4, 8
	csinc	w3, w3, wzr, ne
	strb	w4, [x29, 61]
	stp	w22, w21, [x29, 64]
	str	w3, [x29, 84]
	bl	FSP_ArrangeFsPool
	cmp	w0, 2
	beq	.L33
	cbnz	w0, .L34
	mov	w1, 1
	mov	w0, 0
	str	w1, [x20, 2796]
.L28:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L34:
	ldr	x3, .LC10
	mov	w1, 1178
	ldr	x2, .LC12
	mov	w0, 0
	add	x3, x3, 512
	bl	dprint_normal
	str	wzr, [x20, 2796]
	mov	w0, -1
	b	.L28
.L33:
	add	x0, x20, 2184
	bl	ResetVoQueue
	str	wzr, [x20, 2796]
	mov	w0, -1
	b	.L28
	.size	H263_Frame_Init, .-H263_Frame_Init
	.align	3
.LC9:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC10:
	.xword	.LANCHOR0
	.align	3
.LC12:
	.xword	.LC11
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_RecordFrameAtr
	.type	H263_RecordFrameAtr, %function
H263_RecordFrameAtr:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 20480
	mov	w19, w1
	bl	_mcount
	ldrb	w0, [x20, 815]
	cmp	w0, 15
	beq	.L51
	sub	w2, w0, #2
	uxtb	w2, w2
	cmp	w2, 1
	bls	.L44
	sub	w2, w0, #4
	uxtb	w2, w2
	cmp	w2, 1
	bls	.L45
	mov	w22, 5
	cmp	w0, 1
	csel	w22, wzr, w22, ne
.L37:
	ldr	w0, [x20, 2792]
	mov	w1, w19
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L35
	mov	w1, w22
	bl	SetAspectRatio
	ldr	w1, [x20, 1488]
	mov	x4, -1
	ldrb	w0, [x19, 156]
	lsr	w1, w1, 1
	str	w1, [x19, 48]
	ldrb	w2, [x19, 157]
	ldr	w1, [x20, 1484]
	lsr	w1, w1, 1
	str	w1, [x19, 52]
	ldr	w1, [x20, 2092]
	str	w1, [x19, 104]
	ldr	w1, [x20, 2088]
	str	w1, [x19, 100]
	ldrb	w1, [x20, 1416]
	bfi	w0, w1, 0, 2
	strb	w0, [x19, 156]
	ldrb	w1, [x20, 793]
	bfi	w0, w1, 5, 3
	strb	w0, [x19, 156]
	mov	w1, 1310
	ldrb	w0, [x20, 822]
	and	w0, w0, 1
	bfi	w2, w0, 0, 2
	mov	w0, 24
	orr	w2, w2, 12
	strb	w2, [x19, 157]
	ldrb	w3, [x20, 1421]
	bfi	w2, w3, 4, 2
	strb	w2, [x19, 157]
	ldr	w2, [x19, 156]
	bfi	w2, w22, 14, 3
	str	w2, [x19, 156]
	ldrb	w2, [x20, 1416]
	and	w2, w2, 3
	str	w2, [x19, 24]
	ldrb	w2, [x20, 1416]
	str	wzr, [x19, 20]
	and	w2, w2, 3
	str	w2, [x19, 28]
	ldr	x2, [x21, 22616]
	str	x2, [x19, 168]
	ldr	x2, [x21, 22624]
	str	x2, [x19, 176]
	ldr	x2, [x21, 22632]
	str	x2, [x19, 184]
	ldr	x2, [x21, 22640]
	str	x2, [x19, 192]
	ldr	x3, [x21, 22064]
	ldr	x2, .LC14
	ldr	x3, [x3, 32]
	str	x3, [x19, 208]
	ldr	x3, [x21, 22064]
	ldr	x3, [x3, 48]
	str	x3, [x19, 216]
	ldr	x3, [x21, 22064]
	ldr	x3, [x3, 64]
	str	x3, [x19, 224]
	ldr	x3, [x21, 22064]
	ldr	w3, [x3, 84]
	str	w3, [x19, 4]
	ldr	x3, [x21, 22064]
	ldr	w3, [x3, 88]
	str	w3, [x19, 8]
	ldr	x3, [x21, 22064]
	ldr	w3, [x3, 104]
	str	w3, [x19, 12]
	ldr	x3, [x21, 22064]
	str	x4, [x3, 32]
	ldr	w3, [x20, 2792]
	ldp	x4, x5, [x19, 208]
	bl	dprint_normal
.L35:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L45:
	mov	w22, 2
	b	.L37
	.p2align 3
.L44:
	mov	w22, 1
	b	.L37
	.p2align 3
.L51:
	ldr	w1, [x20, 844]
	mov	w22, 0
	ldr	w0, [x20, 848]
	cmp	w1, wzr
	ccmp	w0, wzr, 4, ne
	cset	w3, eq
	cbnz	w3, .L37
	ldr	w2, [x20, 896]
	mov	w22, w3
	mul	w2, w0, w2
	cbz	w2, .L37
	ldr	w0, [x20, 892]
	lsl	w1, w1, 10
	mul	w0, w1, w0
	udiv	w0, w0, w2
	subs	w2, w0, #1365
	bmi	.L52
.L38:
	subs	w1, w0, #1820
	bmi	.L53
.L39:
	mov	w22, 2
	cmp	w2, w1
	csinc	w22, w22, wzr, ge
	b	.L37
	.p2align 3
.L52:
	mov	w2, 1365
	sub	w2, w2, w0
	b	.L38
	.p2align 3
.L53:
	mov	w1, 1820
	sub	w1, w1, w0
	b	.L39
	.size	H263_RecordFrameAtr, .-H263_RecordFrameAtr
	.align	3
.LC14:
	.xword	.LC13
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Frame_Atr
	.type	H263_Frame_Atr, %function
H263_Frame_Atr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 20480
	bl	_mcount
	mov	w1, -1
	ldrb	w0, [x19, 1416]
	strb	w0, [x20, 3]
	cmp	w0, 4
	str	w1, [x19, 2820]
	beq	.L65
	ldr	w0, [x19, 2792]
	mov	w1, 1
	bl	FSP_NewLogicFs
	mov	w1, w0
	str	w0, [x19, 2820]
.L57:
	tbnz	w1, #31, .L58
	ldr	w0, [x19, 2796]
	cbz	w0, .L58
	mov	x0, x20
	bl	H263_RecordFrameAtr
	str	wzr, [x19, 2096]
	mov	w0, 0
.L61:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L65:
	ldr	w3, [x19, 2792]
	ldr	x5, .LC15
	mov	w0, w3
	ldr	w1, [x19, 2812]
	sxtw	x2, w3
	lsl	x3, x2, 2
	sub	x3, x3, x2
	lsl	x4, x3, 5
	add	x3, x3, x4
	add	x2, x3, x2
	add	x2, x5, x2
	ldr	w3, [x2, 88]
	add	w3, w3, 1
	str	w3, [x2, 88]
	bl	FSP_LinkLogicFs
	cbz	x0, .L66
	ldr	w1, [x0, 4]
	str	w1, [x19, 2820]
	b	.L57
	.p2align 3
.L58:
	ldrb	w3, [x20, 3]
	mov	w1, 1338
	ldr	x2, .LC17
	mov	w0, 0
	bl	dprint_normal
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2812]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L60
	ldr	w0, [x19, 2792]
	ldr	x1, [x20, 168]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2792]
	ldr	x1, [x20, 176]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2792]
	ldr	x1, [x20, 184]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2792]
	ldr	x1, [x20, 192]
	bl	FreeUsdByDec
	stp	xzr, xzr, [x20, 168]
	stp	xzr, xzr, [x20, 184]
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2812]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2804]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 2792]
	bl	FSP_GetNullLogicFs
	str	w0, [x19, 2804]
	str	w0, [x19, 2812]
.L60:
	ldr	w0, [x19, 2792]
	add	x1, x19, 2184
	str	wzr, [x19, 2800]
	bl	FSP_ClearNotInVoQueue
	mov	w0, -1
	b	.L61
	.p2align 3
.L66:
	ldr	w1, [x19, 2820]
	b	.L57
	.size	H263_Frame_Atr, .-H263_Frame_Atr
	.align	3
.LC15:
	.xword	g_VfmwChanStat
	.align	3
.LC17:
	.xword	.LC16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Set_DecPar
	.type	H263_Set_DecPar, %function
H263_Set_DecPar:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 20480
	add	x20, x19, 1048
	bl	_mcount
	ldr	x3, .LC20
	mov	x2, 48
	mov	w1, 0
	add	x0, x29, 64
	ldr	x3, [x3, 96]
	blr	x3
	ldr	w3, [x21, 1488]
	add	x0, x21, 772
	add	w1, w3, 15
	lsr	w1, w1, 4
	strh	w1, [x20, 158]
	ldr	w2, [x0, 712]
	add	w1, w2, 15
	lsr	w1, w1, 4
	strh	w1, [x20, 160]
	ldrb	w1, [x0, 644]
	strb	w1, [x19, 1048]
	cmp	w1, 3
	ldrb	w1, [x0, 54]
	strb	w1, [x20, 1]
	ldrb	w1, [x0, 9]
	strb	w1, [x20, 2]
	ldrb	w1, [x0, 651]
	strb	w1, [x20, 3]
	ldrh	w1, [x0, 656]
	strh	w1, [x20, 4]
	ldrh	w1, [x0, 704]
	strh	w1, [x20, 6]
	ldrb	w1, [x0, 706]
	strb	w1, [x20, 9]
	ldrb	w1, [x0, 655]
	strb	w1, [x20, 8]
	ldr	w1, [x0, 108]
	strb	w1, [x20, 10]
	ldrb	w1, [x0, 652]
	strb	w1, [x20, 11]
	ldrb	w1, [x0, 653]
	strb	w1, [x20, 12]
	ldrb	w1, [x0, 648]
	strb	w1, [x20, 13]
	ldrb	w1, [x0, 59]
	strb	w1, [x20, 14]
	ldrb	w1, [x0, 57]
	strb	w1, [x20, 15]
	ldrb	w1, [x0, 646]
	strb	w1, [x20, 16]
	ldrb	w1, [x0, 650]
	strb	w1, [x20, 17]
	ldrb	w1, [x0, 649]
	strb	w1, [x20, 18]
	ldrb	w1, [x0, 50]
	strb	w1, [x20, 19]
	ldr	w1, [x0, 748]
	str	w1, [x20, 164]
	ldr	w1, [x0, 744]
	str	w1, [x20, 168]
	ldrb	w1, [x19]
	strb	w1, [x20, 156]
	ldrb	w1, [x0, 12]
	strb	w1, [x20, 150]
	ldrb	w1, [x0, 11]
	strb	w1, [x20, 149]
	ldrb	w1, [x0, 10]
	strb	w1, [x20, 148]
	ldrb	w1, [x0, 13]
	strb	w1, [x20, 151]
	ldrb	w1, [x0, 14]
	strb	w1, [x20, 152]
	ldrb	w1, [x0, 15]
	strb	w1, [x20, 153]
	str	w2, [x20, 14564]
	str	w3, [x20, 14568]
	ldrb	w1, [x0, 52]
	str	w1, [x20, 14572]
	ccmp	w1, 2, 0, eq
	beq	.L81
	ldrb	w0, [x0, 65]
	str	w0, [x20, 14580]
	str	wzr, [x20, 14576]
	str	wzr, [x20, 14584]
	str	wzr, [x20, 14588]
	str	wzr, [x20, 14592]
	str	wzr, [x20, 14596]
	str	wzr, [x20, 14600]
	str	wzr, [x20, 14604]
	str	wzr, [x20, 14608]
	str	wzr, [x20, 14612]
.L69:
	ldr	w1, [x21, 2820]
	ldr	w0, [x21, 2792]
	bl	FSP_GetLogicFs
	mov	x22, x0
	ldr	w1, [x21, 2804]
	ldr	w0, [x21, 2792]
	bl	FSP_GetLogicFs
	mov	x23, x0
	ldr	w1, [x21, 2812]
	ldr	w0, [x21, 2792]
	bl	FSP_GetLogicFs
	cmp	x22, xzr
	ccmp	x23, xzr, 4, ne
	ccmp	x0, xzr, 4, ne
	beq	.L82
	ldr	x1, [x22, 24]
	cbz	x1, .L83
	ldr	x1, [x22, 40]
	ldr	w1, [x1, 8]
	str	w1, [x20, 188]
	ldr	x1, [x0, 40]
	ldr	w1, [x1, 8]
	str	w1, [x20, 192]
	ldr	x0, [x0, 24]
	cbz	x0, .L84
.L79:
	ldr	w0, [x0, 4]
	str	w0, [x20, 184]
	ldr	x0, [x23, 24]
	cbz	x0, .L85
.L80:
	ldr	w0, [x0, 4]
	add	x1, x19, 1068
	str	w0, [x20, 180]
	add	x3, x21, 1156
	add	x0, x21, 900
	ldr	x2, [x22, 24]
	ldr	w2, [x2, 4]
	str	w2, [x20, 172]
	ldr	x2, [x22, 24]
	ldr	w2, [x2, 16]
	str	w2, [x20, 176]
	ldr	x2, [x22, 24]
	ldr	w2, [x2, 4]
	str	w2, [x20, 14540]
	ldr	x2, [x22, 24]
	ldr	w2, [x2, 44]
	str	w2, [x20, 14544]
	ldr	x2, [x22, 24]
	ldr	w2, [x2, 48]
	str	w2, [x20, 14548]
	ldr	x2, [x22, 24]
	ldr	w2, [x2, 72]
	str	w2, [x20, 14552]
	ldr	x2, [x22, 24]
	ldr	w2, [x2, 64]
	str	w2, [x20, 14556]
	ldr	x2, [x22, 24]
	ldr	w2, [x2, 68]
	str	w2, [x20, 14560]
	ldrb	w2, [x22, 424]
	strb	w2, [x20, 155]
	.p2align 2
.L77:
	ldr	w2, [x0]
	add	x0, x0, 4
	strb	w2, [x1]
	add	x1, x1, 1
	cmp	x0, x3
	ldr	w2, [x0, 252]
	strb	w2, [x1, 63]
	bne	.L77
	ldrh	w0, [x20, 158]
	ldrh	w1, [x20, 160]
	mul	w0, w0, w1
	str	w0, [x21, 1448]
.L67:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
.L82:
	ldr	x3, .LC21
	mov	w4, 1441
	ldr	x2, .LC23
	mov	w1, w4
	add	x3, x3, 528
	mov	w0, 0
	bl	dprint_normal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
.L85:
	ldr	x0, [x22, 24]
	b	.L80
.L84:
	ldr	x0, [x22, 24]
	b	.L79
.L81:
	ldrb	w2, [x0, 65]
	ldr	w1, [x29, 64]
	ldp	w6, w0, [x29, 80]
	ldp	w5, w4, [x29, 88]
	ldr	w3, [x29, 96]
	str	w1, [x20, 14576]
	str	w2, [x20, 14580]
	str	w0, [x20, 14588]
	ldp	w2, w1, [x29, 100]
	ldr	w0, [x29, 108]
	str	w6, [x20, 14584]
	str	w5, [x20, 14592]
	str	w4, [x20, 14596]
	str	w3, [x20, 14600]
	str	w2, [x20, 14604]
	str	w1, [x20, 14608]
	str	w0, [x20, 14612]
	b	.L69
.L83:
	ldr	x2, .LC25
	mov	x6, 0
	ldr	w3, [x21, 2804]
	mov	w1, 1447
	ldr	w5, [x21, 2812]
	mov	w0, 0
	ldr	w4, [x21, 2820]
	bl	dprint_normal
	b	.L67
	.size	H263_Set_DecPar, .-H263_Set_DecPar
	.align	3
.LC20:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC21:
	.xword	.LANCHOR0
	.align	3
.LC23:
	.xword	.LC22
	.align	3
.LC25:
	.xword	.LC24
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Get_DecMode
	.type	H263_Get_DecMode, %function
H263_Get_DecMode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 20480
	ldr	w0, [x1, 1628]
	cmp	w0, 2
	ldr	x0, [x19, 22064]
	beq	.L98
	ldr	w0, [x0, 8]
	cmp	w0, 2
	beq	.L91
.L99:
	cmp	w0, 1
	beq	.L97
	cmp	w0, 4
	csel	w0, w0, wzr, eq
.L97:
	str	w0, [x1, 1628]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L98:
	ldr	w2, [x0, 8]
	cmp	w2, 2
	beq	.L91
	mov	w2, 1
	str	w2, [x1, 2176]
	ldr	w0, [x0, 8]
	cmp	w0, 2
	bne	.L99
.L91:
	mov	w0, 2
	str	w0, [x1, 1628]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H263_Get_DecMode, .-H263_Get_DecMode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_GetTrailingOneLen
	.type	H263_GetTrailingOneLen, %function
H263_GetTrailingOneLen:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w1
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, x19, sxtw
	bl	_mcount
	mov	w2, 0
	ldrb	w1, [x19, -1]
	tbnz	x1, 0, .L102
	b	.L107
	.p2align 3
.L104:
	mov	w2, w0
.L102:
	lsr	w1, w1, 1
	add	w0, w2, 1
	tbnz	x1, 0, .L104
	add	w2, w2, 2
	cmp	w0, wzr
	csel	w0, w2, w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L107:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H263_GetTrailingOneLen, .-H263_GetTrailingOneLen
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263DEC_Init
	.type	H263DEC_Init, %function
H263DEC_Init:
	sub	sp, sp, #784
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x2, .LC27
	mov	w1, 1549
	mov	w0, 3
	bl	dprint_normal
	cmp	x19, xzr
	ccmp	x21, xzr, 4, ne
	beq	.L113
	ldr	w0, [x21, 636]
	add	x20, x19, 20480
	ldr	x22, .LC28
	cmp	w0, 1
	beq	.L116
.L111:
	ldr	x3, [x22, 96]
	mov	x2, 23320
	mov	w1, 0
	mov	x0, x19
	ldr	w23, [x20, 2784]
	blr	x3
	str	w23, [x20, 2784]
	add	x0, x20, 2184
	bl	ResetVoQueue
	str	x21, [x19, 22064]
	mov	x0, x19
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x20, 2792]
	beq	.L117
	mov	x0, x19
	bl	H263_Global_Data_Init
	mov	w23, w0
	cbnz	w0, .L113
	mov	w0, 1
	ldr	x2, .LC32
	str	w0, [x20, 2100]
	mov	w1, 1588
	str	wzr, [x20, 2128]
	mov	w0, 3
	bl	dprint_normal
	ldr	w21, [x21, 636]
	cmp	w21, 1
	beq	.L118
.L110:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, w23
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 784
	ret
	.p2align 3
.L118:
	ldr	x3, [x22, 104]
	add	x1, x29, 72
	mov	x2, 776
	add	x0, x20, 772
	add	x19, x19, 16384
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x29, 88
	mov	x2, 24
	add	x0, x19, 3568
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x29, 112
	mov	x2, 604
	add	x0, x19, 3592
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x29, 64
	mov	x2, 7
	add	x0, x20, 1548
	blr	x3
	strb	w21, [x20, 2829]
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 784
	ret
	.p2align 3
.L116:
	ldr	x3, [x22, 104]
	add	x1, x20, 772
	mov	x2, 776
	add	x0, x29, 72
	add	x23, x19, 16384
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x23, 3568
	mov	x2, 24
	add	x0, x29, 88
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x23, 3592
	mov	x2, 604
	add	x0, x29, 112
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 7
	add	x1, x20, 1548
	add	x0, x29, 64
	blr	x3
	b	.L111
	.p2align 3
.L113:
	mov	w23, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, w23
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 784
	ret
	.p2align 3
.L117:
	ldr	x2, .LC30
	mov	w1, 1576
	mov	w0, 0
	mov	w23, -20
	bl	dprint_normal
	b	.L110
	.size	H263DEC_Init, .-H263DEC_Init
	.align	3
.LC27:
	.xword	.LC26
	.align	3
.LC28:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC30:
	.xword	.LC29
	.align	3
.LC32:
	.xword	.LC31
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263DEC_Destroy
	.type	H263DEC_Destroy, %function
H263DEC_Destroy:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 20480
	bl	_mcount
	ldr	x2, .LC34
	mov	w1, 1605
	mov	w0, 3
	bl	dprint_normal
	str	wzr, [x19, 2100]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H263DEC_Destroy, .-H263DEC_Destroy
	.align	3
.LC34:
	.xword	.LC33
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263DEC_RecycleImage
	.type	H263DEC_RecycleImage, %function
H263DEC_RecycleImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L124
	add	x19, x19, 20480
	mov	w1, w20
	mov	w2, 0
	ldr	w0, [x19, 2792]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 2792]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L123
	ldr	w0, [x19, 2792]
	ldr	x1, [x20, 168]
	bl	FreeUsdByDec
	str	xzr, [x20, 168]
	ldr	x1, [x20, 176]
	ldr	w0, [x19, 2792]
	bl	FreeUsdByDec
	str	xzr, [x20, 176]
	mov	w0, 0
.L122:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L123:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L124:
	ldr	x3, .LC35
	mov	w1, 1899
	ldr	x2, .LC37
	mov	w0, 0
	add	x3, x3, 544
	bl	dprint_normal
	mov	w0, -1
	b	.L122
	.size	H263DEC_RecycleImage, .-H263DEC_RecycleImage
	.align	3
.LC35:
	.xword	.LANCHOR0
	.align	3
.LC37:
	.xword	.LC36
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_SetImgFormat
	.type	H263_SetImgFormat, %function
H263_SetImgFormat:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 20480
	ldr	w1, [x0, 2820]
	ldr	w0, [x0, 2792]
	bl	FSP_GetFsImagePtr
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H263_SetImgFormat, .-H263_SetImgFormat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263DEC_FlushRemainImg
	.type	H263DEC_FlushRemainImg, %function
H263DEC_FlushRemainImg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x20, 22064]
	ldr	w0, [x0, 12]
	cmp	w0, 1
	beq	.L126
	add	x19, x20, 20480
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2812]
	bl	FSP_GetFsImagePtr
	mov	x21, x0
	cbz	x0, .L126
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2812]
	bl	FSP_GetDisplay
	cmp	w0, 2
	beq	.L136
.L126:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L136:
	ldr	w1, [x19, 2820]
	ldr	w0, [x19, 2792]
	bl	FSP_GetFsImagePtr
	ldr	w0, [x19, 2792]
	mov	w2, 1
	ldr	w1, [x21, 88]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 2792]
	mov	x4, x21
	add	x3, x19, 2184
	mov	x2, x20
	mov	w1, 4
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L126
	ldr	w1, [x21, 88]
	mov	x0, x20
	bl	H263DEC_RecycleImage
	ldr	w0, [x19, 2792]
	ldr	x1, [x21, 168]
	bl	FreeUsdByDec
	str	xzr, [x21, 168]
	ldr	x1, [x21, 176]
	ldr	w0, [x19, 2792]
	bl	FreeUsdByDec
	str	xzr, [x21, 176]
	b	.L126
	.size	H263DEC_FlushRemainImg, .-H263DEC_FlushRemainImg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263DEC_GetImageBuffer
	.type	H263DEC_GetImageBuffer, %function
H263DEC_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x20, x20, 20480
	bl	_mcount
	ldr	w0, [x20, 2792]
	bl	FSP_IsNewFsAvailable
	cmp	w0, 1
	beq	.L139
	cmn	w0, #1
	mov	w19, 0
	beq	.L141
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L139:
	mov	w19, w0
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L141:
	ldr	w0, [x20, 2792]
	add	x1, x20, 2184
	bl	FSP_ClearNotInVoQueue
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H263DEC_GetImageBuffer, .-H263DEC_GetImageBuffer
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_GetPacketState
	.type	H263_GetPacketState, %function
H263_GetPacketState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 16384
	bl	_mcount
	mov	w0, 3
	ldr	w1, [x19, 3564]
	ldr	x19, [sp, 16]
	cmp	w1, 1
	csinv	w0, w0, wzr, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	H263_GetPacketState, .-H263_GetPacketState
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_ClearCurPacket
	.type	H263_ClearCurPacket, %function
H263_ClearCurPacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 24]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x19, 10]
	cbnz	w0, .L146
	ldrb	w0, [x19, 98]
	cmp	w0, 1
	beq	.L147
.L146:
	ldr	x3, .LC38
	mov	x2, 176
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L147:
	ldr	w1, [x19, 112]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
	b	.L146
	.size	H263_ClearCurPacket, .-H263_ClearCurPacket
	.align	3
.LC38:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_ClearCurPic
	.type	H263_ClearCurPic, %function
H263_ClearCurPic:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x22, x20, 16384
	bl	_mcount
	add	x1, x20, 20480
	ldr	w0, [x22, 3556]
	cmp	w0, wzr
	ldr	w21, [x1, 2792]
	ble	.L151
	sub	w0, w0, #1
	add	x19, x20, 12288
	add	x0, x0, 3962
	add	x19, x19, 3556
	add	x20, x20, x0, lsl 2
	.p2align 2
.L150:
	ldr	w1, [x19], 4
	mov	w0, w21
	bl	SM_ReleaseStreamSeg
	cmp	x19, x20
	bne	.L150
.L151:
	str	wzr, [x22, 3556]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	H263_ClearCurPic, .-H263_ClearCurPic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_GetScdUpMsg
	.type	H263_GetScdUpMsg, %function
H263_GetScdUpMsg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x1, [x19, 22064]
	add	x0, x19, 12288
	add	x19, x19, 20480
	add	x0, x0, 3552
	add	x19, x19, 2836
	ldr	w2, [x1, 856]
	cmp	w2, 1
	beq	.L157
.L155:
	ldr	x21, .LC39
	add	x20, x20, 80
	mov	x2, 4
	mov	x1, x20
	ldr	x3, [x21, 104]
	blr	x3
	ldr	x3, [x21, 104]
	mov	x2, 4
	mov	x1, x20
	mov	x0, x19
	blr	x3
.L154:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L157:
	ldr	w1, [x1, 888]
	cmp	w1, 1
	bne	.L155
	ldr	x3, .LC39
	mov	x2, 4
	mov	x1, x19
	ldr	x3, [x3, 104]
	blr	x3
	b	.L154
	.size	H263_GetScdUpMsg, .-H263_GetScdUpMsg
	.align	3
.LC39:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Check_Slice_NotSH
	.type	H263_Check_Slice_NotSH, %function
H263_Check_Slice_NotSH:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 16384
	add	x2, x19, 20480
	ldrb	w0, [x0, 3611]
	ldrb	w3, [x2, 704]
	cbnz	w0, .L166
	add	x19, x19, 12288
	ldrb	w0, [x19, 3552]
	tst	w0, 120
	bne	.L166
	ldrh	w0, [x19, 3552]
	cmp	w3, 3
	ubfx	x0, x0, 7, 4
	add	w0, w0, 17
	bls	.L168
	ldr	x2, .LC42
	mov	w1, 2241
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
.L159:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L168:
	ldr	x1, .LC40
	ldrb	w1, [x1,w3,uxtw]
	adr	x3, .Lrtx162
	add	x1, x3, w1, sxtb #2
	br	x1
.Lrtx162:
	.section	.rodata
	.align	0
	.align	2
.L162:
	.byte	(.L167 - .Lrtx162) / 4
	.byte	(.L163 - .Lrtx162) / 4
	.byte	(.L164 - .Lrtx162) / 4
	.byte	(.L163 - .Lrtx162) / 4
	.text
	.p2align 3
.L167:
	mov	w1, 17
.L161:
	cmp	w1, w0
	ldr	x19, [sp, 16]
	csetm	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L164:
	ldrb	w3, [x2, 713]
	ldrb	w1, [x2, 712]
	mov	w2, 18
	cmp	w1, w3, uxtb
	csel	w1, w1, w3, cs
	uxtb	w1, w1
	add	w1, w1, 16
	cmp	w1, w2
	csel	w1, w1, w2, ge
	b	.L161
	.p2align 3
.L163:
	ldrb	w1, [x2, 712]
	add	w1, w1, 16
	b	.L161
	.p2align 3
.L166:
	mov	w0, -1
	b	.L159
	.size	H263_Check_Slice_NotSH, .-H263_Check_Slice_NotSH
	.align	3
.LC40:
	.xword	.L162
	.align	3
.LC42:
	.xword	.LC41
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Combine_SliceData
	.type	H263_Combine_SliceData, %function
H263_Combine_SliceData:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	add	x0, x19, 16384
	add	x2, x19, 1248
	ldr	w4, [x19, 15584]
	ldr	w0, [x0, 3560]
	tbz	x0, 1, .L170
	add	x1, x19, 12288
	ldrb	w0, [x1, 3386]
	cmp	w0, 1
	beq	.L185
	cbnz	w0, .L178
	ldrb	w0, [x1, 3474]
	cmp	w0, 1
	bne	.L178
	sub	w3, w4, #1
	lsl	x0, x3, 3
	sub	x3, x0, x3
	add	x3, x2, x3, lsl 2
	ldr	w0, [x3, 12]
	cbnz	w0, .L180
	ldr	w0, [x3, 24]
	cbnz	w0, .L180
	ldr	w1, [x3, 8]
	add	w20, w1, w20, lsl 3
	str	w20, [x3, 8]
	ldr	w1, [x19, 15768]
	str	w1, [x3, 24]
	ldr	w1, [x19, 15772]
	lsl	w1, w1, 3
	str	w1, [x3, 12]
.L173:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L185:
	sub	w3, w4, #1
	cmp	w3, 510
	bhi	.L186
	lsl	x1, x3, 3
	sub	x1, x1, x3
	add	x3, x2, x1, lsl 2
	ldr	w1, [x3, 12]
	cbz	w1, .L174
	ldr	w2, [x3, 24]
	cbz	w2, .L174
	ldr	w4, [x19, 15680]
	cmp	w2, w4
	bhi	.L187
	add	w1, w1, w20, lsl 3
	mov	w0, 0
	str	w1, [x3, 12]
	b	.L173
	.p2align 3
.L174:
	ldr	w0, [x3, 20]
	ldr	w1, [x19, 15680]
	cmp	w1, w0
	bls	.L176
	ldr	w1, [x3, 8]
	mov	w0, 0
	add	w20, w1, w20, lsl 3
	str	w20, [x3, 8]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L176:
	lsl	w20, w20, 3
	str	w20, [x3, 12]
	mov	w0, 0
	ldr	w1, [x19, 15680]
	str	w1, [x3, 24]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L178:
	mov	w3, 2310
.L184:
	ldr	x2, .LC46
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L173
	.p2align 3
.L180:
	mov	w0, -1
	b	.L173
	.p2align 3
.L170:
	mov	w3, 2316
	b	.L184
.L186:
	ldr	x2, .LC44
	mov	w3, w4
	mov	w1, 2269
	bl	dprint_normal
	mov	w0, -1
	b	.L173
.L187:
	mov	w3, 2289
	ldr	x2, .LC46
	mov	w1, w3
	bl	dprint_normal
	mov	w0, -1
	b	.L173
	.size	H263_Combine_SliceData, .-H263_Combine_SliceData
	.align	3
.LC44:
	.xword	.LC43
	.align	3
.LC46:
	.xword	.LC45
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Check_StreamType
	.type	H263_Check_StreamType, %function
H263_Check_StreamType:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 20480
	bl	_mcount
	mov	w0, 196
	str	w0, [x20]
	mov	w2, 1
	strb	w2, [x19, 781]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H263_Check_StreamType, .-H263_Check_StreamType
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Clean_HeadPacket
	.type	H263_Clean_HeadPacket, %function
H263_Clean_HeadPacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x22, x20, 20480
	bl	_mcount
	mov	w1, 64
	ldr	w0, [x22, 2068]
	ldr	w21, [x22, 2792]
	cmp	w0, w1
	csel	w0, w0, w1, le
	cmp	w0, wzr
	ble	.L192
	sub	w0, w0, #1
	add	x19, x22, 1812
	add	x0, x0, 4096
	add	x0, x0, 1478
	add	x20, x20, x0, lsl 2
	.p2align 2
.L191:
	ldr	w1, [x19], 4
	mov	w0, w21
	bl	SM_ReleaseStreamSeg
	cmp	x19, x20
	bne	.L191
.L192:
	ldr	x3, .LC47
	mov	x2, 456
	mov	w1, 0
	add	x0, x22, 1632
	ldr	x3, [x3, 96]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	H263_Clean_HeadPacket, .-H263_Clean_HeadPacket
	.align	3
.LC47:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263DEC_VDMPostProc
	.type	H263DEC_VDMPostProc, %function
H263DEC_VDMPostProc:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x23, x0
	mov	x0, x30
	mov	w25, w1
	add	x24, x23, 16384
	bl	_mcount
	add	x20, x23, 20480
	ldr	x3, .LC48
	mov	x2, 14616
	mov	w1, 0
	add	x0, x23, 1048
	ldr	x3, [x3, 96]
	blr	x3
	ldr	w22, [x20, 2792]
	ldr	w0, [x24, 3556]
	cmp	w0, wzr
	ble	.L200
	sub	w21, w0, #1
	add	x19, x23, 12288
	add	x21, x21, 3962
	add	x19, x19, 3556
	add	x21, x23, x21, lsl 2
	.p2align 2
.L199:
	ldr	w1, [x19], 4
	mov	w0, w22
	bl	SM_ReleaseStreamSeg
	cmp	x21, x19
	bne	.L199
.L200:
	mov	x0, x23
	str	wzr, [x24, 3556]
	bl	H263_Clean_HeadPacket
	ldrb	w0, [x20, 1416]
	cmp	w0, 2
	beq	.L249
.L198:
	ldr	w1, [x20, 2820]
	ldr	w0, [x20, 2792]
	str	w25, [x20, 2096]
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	ldr	w1, [x20, 2812]
	ldr	w0, [x20, 2792]
	bl	FSP_GetFsImagePtr
	mov	x25, x0
	cbz	x24, .L250
	ldr	w0, [x20, 2096]
	add	x21, x20, 2136
	str	w0, [x24, 96]
	mov	x19, 0
	ldr	w22, [x20, 2792]
.L203:
	ldr	x1, [x21, x19]
	mov	w0, w22
	bl	FreeUsdByDec
	str	xzr, [x21, x19]
	add	x19, x19, 8
	cmp	x19, 32
	bne	.L203
	ldrb	w0, [x20, 1416]
	cmp	w0, 2
	beq	.L204
	ldr	x1, [x23, 22064]
	ldr	w0, [x20, 2096]
	ldr	w2, [x1]
	cmp	w0, w2
	bhi	.L251
.L204:
	ldr	w0, [x20, 2792]
	ldr	w1, [x20, 2820]
	str	wzr, [x20, 2176]
	bl	FSP_GetFsImagePtr
	ldr	x0, [x23, 22064]
	ldr	w0, [x0, 12]
	cbz	w0, .L252
	ldr	w1, [x20, 2820]
	ldrb	w21, [x20, 1416]
	str	w1, [x20, 2824]
.L210:
	cmn	w1, #1
	beq	.L212
	ldr	w0, [x20, 2792]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L253
	ldr	w3, [x0, 96]
	cbz	w3, .L214
	ldr	x0, [x23, 22064]
	ldr	w4, [x0, 4]
	cmp	w3, w4
	bhi	.L215
.L214:
	ldr	w0, [x20, 2792]
	ldr	w1, [x20, 2824]
	bl	FSP_GetLogicFs
	cbz	x0, .L247
	cmp	w21, 2
	beq	.L217
	ldr	w0, [x0, 20]
	cmp	w0, 2
	beq	.L217
	ldr	x2, .LC55
	mov	w1, 2112
	ldr	w3, [x20, 2824]
	mov	w0, 9
	bl	dprint_normal
	.p2align 2
.L212:
	ldr	w1, [x20, 2104]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x20, 2104]
.L246:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L252:
	ldrb	w21, [x20, 1416]
	cmp	w21, 2
	beq	.L208
	ldr	w0, [x20, 2800]
	cmp	w0, 1
	ble	.L209
	ldr	w1, [x20, 2804]
	str	w1, [x20, 2824]
	ldrb	w21, [x23, 1]
	b	.L210
	.p2align 3
.L215:
	ldr	x0, .LC51
	ldr	x5, [x0]
	cbz	x5, .L220
	ldr	w0, [x20, 2792]
	add	x2, x29, 88
	stp	w3, w4, [x29, 88]
	mov	w1, 23
	mov	w3, 8
	blr	x5
	ldr	x0, [x23, 22064]
	ldr	w3, [x19, 96]
	ldr	w4, [x0, 4]
.L220:
	ldr	x2, .LC57
	mov	w1, 2118
	mov	w0, 1
	bl	dprint_normal
	ldr	w0, [x20, 2792]
	ldr	x1, [x19, 168]
	bl	FreeUsdByDec
	str	xzr, [x19, 168]
	ldr	x1, [x19, 176]
	ldr	w0, [x20, 2792]
	bl	FreeUsdByDec
	str	xzr, [x19, 176]
	mov	w2, 0
	ldr	w0, [x20, 2792]
	ldr	w1, [x20, 2824]
	bl	FSP_SetDisplay
	b	.L212
	.p2align 3
.L217:
	ldr	w0, [x20, 2792]
	mov	w2, 1
	ldr	w1, [x20, 2824]
	bl	FSP_SetDisplay
	ldr	w0, [x20, 2792]
	mov	x4, x19
	add	x3, x20, 2184
	mov	x2, x23
	mov	w1, 4
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L212
.L247:
	ldr	w0, [x20, 2792]
	ldr	x1, [x19, 168]
	bl	FreeUsdByDec
	str	xzr, [x19, 168]
	ldr	x1, [x19, 176]
	ldr	w0, [x20, 2792]
	bl	FreeUsdByDec
	str	xzr, [x19, 176]
	mov	w2, 0
	ldr	w0, [x20, 2792]
	ldr	w1, [x20, 2824]
	bl	FSP_SetDisplay
	mov	w0, -1
	b	.L246
	.p2align 3
.L249:
	ldr	w0, [x20, 2792]
	mov	w2, 0
	ldr	w1, [x20, 2820]
	bl	FSP_SetRef
	b	.L198
	.p2align 3
.L208:
	ldr	w1, [x20, 2820]
	str	w1, [x20, 2824]
	cbz	x25, .L210
	ldr	x0, [x24, 208]
	ldr	x2, [x25, 208]
	cmp	x2, x0
	bge	.L210
	str	x2, [x24, 208]
	str	x0, [x25, 208]
	ldr	w1, [x20, 2824]
	b	.L210
.L209:
	mov	w0, -1
	str	w0, [x20, 2824]
	b	.L212
.L251:
	ldr	x2, .LC51
	ldr	x4, [x2]
	cbz	x4, .L205
	str	w0, [x29, 88]
	mov	w3, 8
	ldr	w0, [x20, 2792]
	add	x2, x29, 88
	ldr	w5, [x1]
	mov	w1, 23
	str	w5, [x29, 92]
	blr	x4
.L205:
	ldr	w0, [x20, 2792]
	mov	w2, 1
	ldr	w1, [x20, 2812]
	str	w2, [x20, 2176]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L206
	ldr	w0, [x20, 2792]
	ldr	x1, [x19, 168]
	bl	FreeUsdByDec
	ldr	w0, [x20, 2792]
	ldr	x1, [x19, 176]
	bl	FreeUsdByDec
	ldr	w0, [x20, 2792]
	ldr	x1, [x19, 184]
	bl	FreeUsdByDec
	ldr	w0, [x20, 2792]
	ldr	x1, [x19, 192]
	bl	FreeUsdByDec
	stp	xzr, xzr, [x19, 168]
	stp	xzr, xzr, [x19, 184]
	ldr	w0, [x20, 2792]
	ldr	w1, [x20, 2812]
	bl	FSP_ClearLogicFs
	ldr	w0, [x20, 2792]
	ldr	w1, [x20, 2804]
	bl	FSP_ClearLogicFs
	ldr	w0, [x20, 2792]
	bl	FSP_GetNullLogicFs
	str	w0, [x20, 2804]
	str	w0, [x20, 2812]
.L206:
	mov	w0, -1
	str	wzr, [x20, 2800]
	b	.L246
.L250:
	ldr	x2, .LC50
	mov	x4, x0
	mov	x3, 0
	mov	w1, 2015
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L246
.L253:
	mov	w3, 2078
	ldr	x2, .LC53
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L246
	.size	H263DEC_VDMPostProc, .-H263DEC_VDMPostProc
	.align	3
.LC48:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC50:
	.xword	.LC49
	.align	3
.LC51:
	.xword	g_EventReportFunc
	.align	3
.LC53:
	.xword	.LC52
	.align	3
.LC55:
	.xword	.LC54
	.align	3
.LC57:
	.xword	.LC56
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Record_SlcSegID
	.type	H263_Record_SlcSegID, %function
H263_Record_SlcSegID:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x22, x20, 16384
	bl	_mcount
	ldr	w0, [x22, 3556]
	cmp	w0, 1022
	bhi	.L261
	add	x1, x20, x0, uxtw 2
	ldr	w4, [x20, 15688]
	add	x3, x20, 12288
	add	w2, w0, 1
	str	w4, [x1, 15844]
	str	w2, [x22, 3556]
	ldrb	w1, [x3, 3386]
	cbnz	w1, .L254
	ldrb	w1, [x3, 3474]
	cmp	w1, 1
	beq	.L262
.L254:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L261:
	mov	x0, x20
	add	x23, x20, 20480
	bl	H263_Clean_HeadPacket
	ldr	w1, [x22, 3556]
	ldr	w21, [x23, 2792]
	cmp	w1, wzr
	ble	.L259
	sub	w1, w1, #1
	add	x24, x20, 12288
	add	x1, x1, 3962
	add	x19, x24, 3556
	add	x20, x20, x1, lsl 2
	.p2align 2
.L257:
	ldr	w1, [x19], 4
	mov	w0, w21
	bl	SM_ReleaseStreamSeg
	cmp	x19, x20
	bne	.L257
	ldr	w0, [x23, 2792]
.L256:
	add	x1, x24, 3376
	str	wzr, [x22, 3556]
	bl	H263_ClearCurPacket
	ldr	w3, [x22, 3556]
	mov	w4, 1022
	ldr	x2, .LC59
	mov	w1, 2586
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L262:
	add	x2, x20, x2, uxtw 2
	ldr	w1, [x20, 15776]
	add	w0, w0, 2
	str	w1, [x2, 15844]
	str	w0, [x22, 3556]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L259:
	mov	w0, w21
	add	x24, x20, 12288
	b	.L256
	.size	H263_Record_SlcSegID, .-H263_Record_SlcSegID
	.align	3
.LC59:
	.xword	.LC58
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Syntax_PicHeader
	.type	H263_Syntax_PicHeader, %function
H263_Syntax_PicHeader:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	mov	x19, x1
	mov	w22, w2
	bl	_mcount
	ldr	w3, [x21, 15584]
	cbnz	w3, .L369
.L264:
	mov	w2, w22
	mov	x1, x19
	add	x0, x29, 88
	add	x20, x21, 20480
	bl	BsInit
	ldr	x3, .LC62
	mov	x2, 68
	mov	w1, 0
	add	x0, x20, 704
	ldr	x3, [x3, 96]
	blr	x3
	mov	w1, 22
	add	x0, x29, 88
	bl	BsSkip
	mov	w1, 13
	add	x0, x29, 88
	bl	BsSkip
	mov	w1, 3
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 6
	strb	w0, [x20, 714]
	bls	.L370
	cmp	w0, 7
	bne	.L273
	mov	w1, 3
	add	x0, x29, 88
	bl	BsGet
	uxtb	w26, w0
	cmp	w26, 1
	bls	.L371
	.p2align 2
.L353:
	strb	wzr, [x20, 1553]
	add	x0, x29, 88
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC64
	ldr	x4, [x0]
	cbz	x4, .L334
	ldr	w0, [x20, 2792]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 22
	blr	x4
	mov	w0, w19
.L350:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
.L272:
	mov	w0, 352
	mov	w3, 18
	mov	w2, 1408
	mov	w1, 1152
.L358:
	strb	w3, [x20, 715]
	strh	w0, [x20, 716]
	strh	w0, [x20, 764]
	str	w1, [x20, 1484]
	str	w2, [x20, 1488]
.L273:
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	ldrb	w1, [x20, 779]
	strb	w0, [x20, 704]
	cmp	w1, 2
	beq	.L292
	ldr	w1, [x20, 2176]
	cmp	w1, 1
	ccmp	w0, wzr, 4, eq
	bne	.L292
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w1, 5
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L354
	mov	w0, 1
.L354:
	strb	w0, [x20, 711]
	mov	w1, 1
	add	x0, x29, 88
	mov	w19, 0
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	beq	.L372
.L279:
	lsl	w22, w22, 3
.L312:
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	cmp	w0, 1
	beq	.L373
	add	w19, w19, 1
	cmp	w19, 15
	bhi	.L353
	add	x24, x21, 16384
	mov	w2, 1
	strb	w2, [x20, 1553]
	add	x0, x29, 88
	add	x23, x21, 12288
	ldr	w1, [x24, 3560]
	orr	w1, w1, 2
	str	w1, [x24, 3560]
	ldr	w1, [x21, 15584]
	add	w1, w1, 1
	str	w1, [x21, 15584]
	strb	w2, [x20, 712]
	bl	BsPos
	mov	w19, w0
	asr	w0, w0, 31
	sub	w22, w22, w19
	lsr	w0, w0, 29
	str	w22, [x21, 1256]
	add	w1, w19, w0
	add	w2, w19, 7
	ldr	w3, [x20, 1576]
	and	w1, w1, 7
	sub	w0, w1, w0
	cmp	w19, wzr
	add	w0, w3, w0
	strb	w0, [x21, 1253]
	csel	w0, w2, w19, lt
	ldr	w1, [x20, 1568]
	add	w0, w1, w0, asr 3
	str	w0, [x21, 1268]
	ldrb	w0, [x23, 3386]
	cbz	w0, .L374
.L314:
	strb	wzr, [x21, 1254]
	str	wzr, [x21, 1260]
	str	wzr, [x21, 1272]
.L315:
	ldrb	w0, [x20, 704]
	strb	w0, [x21, 1251]
	ldrb	w0, [x20, 713]
	strb	w0, [x21, 1249]
	ldrb	w0, [x20, 712]
	strb	w0, [x21, 1248]
	ldrb	w0, [x20, 711]
	strb	w0, [x21, 1252]
	ldrb	w0, [x20, 708]
	strb	w0, [x21, 1250]
	ldr	w3, [x24, 3556]
	cbnz	w3, .L375
.L316:
	mov	x0, x21
	bl	H263_Record_SlcSegID
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L370:
	ldr	x1, .LC63
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx267
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx267:
	.section	.rodata
	.align	0
	.align	2
.L267:
	.byte	(.L363 - .Lrtx267) / 4
	.byte	(.L268 - .Lrtx267) / 4
	.byte	(.L269 - .Lrtx267) / 4
	.byte	(.L270 - .Lrtx267) / 4
	.byte	(.L271 - .Lrtx267) / 4
	.byte	(.L272 - .Lrtx267) / 4
	.byte	(.L363 - .Lrtx267) / 4
	.text
	.p2align 3
.L373:
	add	x0, x29, 88
	add	w19, w19, 1
	bl	BsPos
	cmp	w0, w22
	mov	w1, 8
	add	x0, x29, 88
	bgt	.L376
	bl	BsSkip
	cmp	w19, 15
	bls	.L312
	b	.L353
	.p2align 3
.L369:
	ldr	x2, .LC61
	mov	w1, 212
	mov	w0, 1
	bl	dprint_normal
	str	wzr, [x21, 15584]
	b	.L264
	.p2align 3
.L292:
	add	x0, x29, 88
	bl	BsPos
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L371:
	beq	.L377
	mov	w25, 0
	mov	w23, 0
	mov	w24, 0
.L281:
	mov	w1, 3
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x20, 704]
	bls	.L291
.L363:
	strb	wzr, [x20, 1553]
	add	x0, x29, 88
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC64
	ldr	x4, [x0]
	cbz	x4, .L334
	ldr	w0, [x20, 2792]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L374:
	ldrb	w0, [x23, 3474]
	cmp	w0, 1
	bne	.L314
	ldr	w0, [x21, 15772]
	ldr	w1, [x21, 15768]
	lsl	w0, w0, 3
	strb	wzr, [x21, 1254]
	str	w0, [x21, 1260]
	str	w1, [x21, 1272]
	b	.L315
.L270:
	mov	w0, 22
	mov	w3, 18
	mov	w2, 352
	mov	w1, 288
	b	.L358
.L271:
	mov	w0, 88
	mov	w3, 18
	mov	w2, 704
	mov	w1, 576
	b	.L358
.L268:
	mov	w0, 8
	mov	w3, 6
	mov	w2, 128
	mov	w1, 96
	b	.L358
.L269:
	mov	w0, 11
	mov	w3, 9
	mov	w2, 176
	mov	w1, 144
	b	.L358
.L372:
	mov	w1, 2
	add	x0, x29, 88
	bl	BsGet
	b	.L279
	.p2align 3
.L334:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
.L375:
	ldr	x2, .LC67
	mov	w1, 635
	mov	w0, 1
	bl	dprint_normal
	ldr	w25, [x20, 2792]
	ldr	w0, [x24, 3556]
	cmp	w0, wzr
	ble	.L319
	sub	w22, w0, #1
	add	x20, x23, 3556
	add	x22, x22, 3962
	add	x22, x21, x22, lsl 2
	.p2align 2
.L318:
	ldr	w1, [x20], 4
	mov	w0, w25
	bl	SM_ReleaseStreamSeg
	cmp	x20, x22
	bne	.L318
.L319:
	str	wzr, [x24, 3556]
	b	.L316
.L376:
	bl	BsPos
	b	.L350
.L291:
	ldrb	w1, [x20, 779]
	cmp	w1, 2
	beq	.L292
	ldr	w1, [x20, 2176]
	cmp	w1, 1
	ccmp	w0, wzr, 4, eq
	bne	.L292
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	strb	w0, [x20, 706]
	mov	w1, 3
	add	x0, x29, 88
	bl	BsGet
	uxtb	w1, w0
	cmp	w1, 1
	bne	.L353
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	beq	.L378
.L295:
	cmp	w26, 1
	beq	.L379
	cmp	w24, 1
	mov	w19, 0
	beq	.L322
.L305:
	mov	w1, 5
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L357
	mov	w0, 1
.L357:
	strb	w0, [x20, 711]
	b	.L279
.L377:
	mov	w1, 3
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 7
	strb	w0, [x20, 714]
	bhi	.L282
	ldr	x1, .LC65
	ldrh	w0, [x1,w0,uxtw #1]
	adr	x1, .Lrtx284
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx284:
	.section	.rodata
	.align	0
	.align	2
.L284:
	.2byte	(.L363 - .Lrtx284) / 4
	.2byte	(.L285 - .Lrtx284) / 4
	.2byte	(.L286 - .Lrtx284) / 4
	.2byte	(.L287 - .Lrtx284) / 4
	.2byte	(.L288 - .Lrtx284) / 4
	.2byte	(.L289 - .Lrtx284) / 4
	.2byte	(.L282 - .Lrtx284) / 4
	.2byte	(.L363 - .Lrtx284) / 4
	.text
.L289:
	mov	w0, 352
	mov	w3, 18
	mov	w2, 1408
	mov	w1, 1152
.L355:
	strb	w3, [x20, 715]
	strh	w0, [x20, 716]
	strh	w0, [x20, 764]
	str	w1, [x20, 1484]
	str	w2, [x20, 1488]
.L282:
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w24, w0
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w23, w0
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w25, w0
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	mov	w1, 4
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 8
	bne	.L353
	uxtb	w24, w24
	uxtb	w23, w23
	uxtb	w25, w25
	b	.L281
.L288:
	mov	w0, 88
	mov	w3, 18
	mov	w2, 704
	mov	w1, 576
	b	.L355
.L287:
	mov	w0, 22
	mov	w3, 18
	mov	w2, 352
	mov	w1, 288
	b	.L355
.L286:
	mov	w0, 11
	mov	w3, 9
	mov	w2, 176
	mov	w1, 144
	b	.L355
.L285:
	mov	w0, 8
	mov	w3, 6
	mov	w2, 128
	mov	w1, 96
	b	.L355
.L379:
	ldrb	w0, [x20, 714]
	mov	w19, 0
	cmp	w0, 6
	beq	.L380
.L297:
	cmp	w24, 1
	beq	.L381
.L304:
	cmp	w23, 1
	beq	.L382
.L307:
	cmp	w25, 1
	bne	.L305
	mov	w1, 2
	add	x0, x29, 88
	bl	BsGet
	b	.L305
	.p2align 3
.L378:
	mov	w1, 2
	add	x0, x29, 88
	bl	BsGet
	b	.L295
.L381:
	mov	w1, 8
	add	x0, x29, 88
	bl	BsGet
.L322:
	mov	w1, 2
	add	x0, x29, 88
	bl	BsGet
	cmp	w26, 1
	bne	.L305
	b	.L304
.L382:
	mov	w1, w23
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L307
	mov	w1, w23
	add	x0, x29, 88
	bl	BsGet
	b	.L307
.L380:
	mov	w1, 4
	add	x0, x29, 88
	bl	BsGet
	uxtb	w19, w0
	mov	w1, 9
	add	x0, x29, 88
	bl	BsGet
	add	w0, w0, 1
	lsl	w0, w0, 2
	mov	w1, w26
	str	w0, [x20, 1488]
	add	x0, x29, 88
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L353
	mov	w1, 9
	add	x0, x29, 88
	bl	BsGet
	lsl	w0, w0, 2
	cmp	w19, 15
	str	w0, [x20, 1484]
	bne	.L299
	mov	w1, 8
	add	x0, x29, 88
	bl	BsGet
	mov	w1, 8
	add	x0, x29, 88
	bl	BsGet
.L299:
	ldr	w1, [x20, 1488]
	ldr	w0, [x20, 1484]
	add	w1, w1, 15
	ubfx	x1, x1, 4, 16
	cmp	w0, 400
	strh	w1, [x20, 716]
	bhi	.L300
	add	w0, w0, 15
	strh	w1, [x20, 764]
	lsr	w0, w0, 4
	mov	w19, 0
	strb	w0, [x20, 715]
	b	.L297
.L300:
	cmp	w0, 800
	bhi	.L301
	add	w2, w0, 31
	ands	w19, w0, 31
	lsr	w0, w2, 5
	strb	w0, [x20, 715]
	ubfiz	w0, w1, 1, 15
	strh	w0, [x20, 716]
	beq	.L303
.L356:
	add	w19, w19, 15
	lsr	w19, w19, 4
	mul	w1, w1, w19
	strh	w1, [x20, 764]
	b	.L297
.L301:
	add	w2, w0, 63
	ands	w19, w0, 63
	lsr	w0, w2, 6
	strb	w0, [x20, 715]
	ubfiz	w0, w1, 2, 14
	strh	w0, [x20, 716]
	bne	.L356
.L303:
	strh	w0, [x20, 764]
	mov	w19, 0
	b	.L297
	.size	H263_Syntax_PicHeader, .-H263_Syntax_PicHeader
	.align	3
.LC61:
	.xword	.LC60
	.align	3
.LC62:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC63:
	.xword	.L267
	.align	3
.LC64:
	.xword	g_EventReportFunc
	.align	3
.LC65:
	.xword	.L284
	.align	3
.LC67:
	.xword	.LC66
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Syntax_Sorenson_PicHeader
	.type	H263_Syntax_Sorenson_PicHeader, %function
H263_Syntax_Sorenson_PicHeader:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x19, x1
	mov	w22, w2
	bl	_mcount
	ldr	w3, [x21, 15584]
	cbnz	w3, .L441
.L384:
	mov	w2, w22
	mov	x1, x19
	add	x0, x29, 72
	add	x20, x21, 20480
	bl	BsInit
	ldr	x3, .LC69
	mov	x2, 68
	mov	w1, 0
	add	x0, x20, 704
	ldr	x3, [x3, 96]
	blr	x3
	mov	w1, 17
	add	x0, x29, 72
	bl	BsSkip
	mov	w1, 5
	add	x0, x29, 72
	bl	BsGet
	strb	w0, [x20, 766]
	mov	w1, 8
	add	x0, x29, 72
	bl	BsSkip
	mov	w1, 3
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 6
	strb	w0, [x20, 714]
	bls	.L442
	strb	wzr, [x20, 1553]
	add	x0, x29, 72
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC71
	ldr	x4, [x0]
	cbz	x4, .L419
	ldr	w0, [x20, 2792]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	blr	x4
	mov	w0, w19
.L434:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L442:
	ldr	x1, .LC70
	ldrh	w0, [x1,w0,uxtw #1]
	adr	x1, .Lrtx387
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx387:
	.section	.rodata
	.align	0
	.align	2
.L387:
	.2byte	(.L386 - .Lrtx387) / 4
	.2byte	(.L388 - .Lrtx387) / 4
	.2byte	(.L389 - .Lrtx387) / 4
	.2byte	(.L390 - .Lrtx387) / 4
	.2byte	(.L391 - .Lrtx387) / 4
	.2byte	(.L392 - .Lrtx387) / 4
	.2byte	(.L393 - .Lrtx387) / 4
	.text
	.p2align 3
.L441:
	ldr	x2, .LC68
	mov	w1, 654
	mov	w0, 1
	bl	dprint_normal
	str	wzr, [x21, 15584]
	b	.L384
.L393:
	mov	w0, 10
	mov	w3, 8
	mov	w2, 160
	mov	w1, 120
.L437:
	strb	w3, [x20, 715]
	mov	w19, 0
	strh	w0, [x20, 716]
	strh	w0, [x20, 764]
	str	w1, [x20, 1484]
	str	w2, [x20, 1488]
.L394:
	mov	w1, 2
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 2
	strb	w0, [x20, 704]
	beq	.L443
.L400:
	cmp	w0, 3
	beq	.L435
.L401:
	ldrb	w0, [x20, 779]
	cmp	w0, 2
	beq	.L402
	ldr	w0, [x20, 2176]
	cmp	w0, 1
	bne	.L403
	ldrb	w0, [x20, 704]
	cbnz	w0, .L402
.L403:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	strb	w0, [x20, 768]
	mov	w1, 5
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	cbnz	w0, .L438
	mov	w0, 1
.L438:
	strb	w0, [x20, 711]
	lsl	w23, w22, 3
.L408:
	mov	w1, 1
	add	x0, x29, 72
	bl	BsGet
	cmp	w0, 1
	beq	.L444
	add	w19, w19, 1
	cmp	w19, 15
	bhi	.L435
	add	x24, x21, 16384
	mov	w2, 1
	strb	w2, [x20, 1553]
	add	x0, x29, 72
	add	x22, x21, 12288
	ldr	w1, [x24, 3560]
	orr	w1, w1, 2
	str	w1, [x24, 3560]
	ldr	w1, [x21, 15584]
	add	w1, w1, 1
	str	w1, [x21, 15584]
	strb	w2, [x20, 712]
	bl	BsPos
	mov	w19, w0
	asr	w0, w0, 31
	sub	w23, w23, w19
	lsr	w0, w0, 29
	str	w23, [x21, 1256]
	add	w1, w19, w0
	add	w2, w19, 7
	ldr	w3, [x20, 1576]
	and	w1, w1, 7
	sub	w0, w1, w0
	cmp	w19, wzr
	add	w0, w3, w0
	strb	w0, [x21, 1253]
	csel	w0, w2, w19, lt
	ldr	w1, [x20, 1568]
	add	w0, w1, w0, asr 3
	str	w0, [x21, 1268]
	ldrb	w0, [x22, 3386]
	cbnz	w0, .L410
	ldrb	w0, [x22, 3474]
	cmp	w0, 1
	beq	.L445
.L410:
	strb	wzr, [x21, 1254]
	str	wzr, [x21, 1260]
	str	wzr, [x21, 1272]
.L411:
	ldrb	w0, [x20, 704]
	strb	w0, [x21, 1251]
	ldrb	w0, [x20, 713]
	strb	w0, [x21, 1249]
	ldrb	w0, [x20, 712]
	strb	w0, [x21, 1248]
	ldrb	w0, [x20, 711]
	strb	w0, [x21, 1252]
	ldrb	w0, [x20, 708]
	strb	w0, [x21, 1250]
	ldr	w3, [x24, 3556]
	cbnz	w3, .L446
.L412:
	mov	x0, x21
	bl	H263_Record_SlcSegID
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
.L386:
	mov	w1, 8
	add	x0, x29, 72
	mov	w19, 0
	bl	BsGet
	str	w0, [x20, 1488]
	mov	w1, 8
	add	x0, x29, 72
	bl	BsGet
	add	w2, w0, 15
	ldr	w1, [x20, 1488]
	lsr	w2, w2, 4
	str	w0, [x20, 1484]
	add	w0, w1, 15
	strb	w2, [x20, 715]
	ubfx	x0, x0, 4, 16
	mov	w1, 2
	strh	w0, [x20, 716]
	strh	w0, [x20, 764]
	add	x0, x29, 72
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 2
	strb	w0, [x20, 704]
	bne	.L400
	.p2align 2
.L443:
	mov	w0, 1
	strb	w0, [x20, 767]
	strb	w0, [x20, 704]
	b	.L401
.L389:
	mov	w0, 22
	mov	w3, 18
	mov	w2, 352
	mov	w1, 288
	b	.L437
.L390:
	mov	w0, 11
	mov	w3, 9
	mov	w2, 176
	mov	w1, 144
	b	.L437
.L391:
	mov	w0, 8
	mov	w3, 6
	mov	w2, 128
	mov	w1, 96
	b	.L437
.L392:
	mov	w0, 20
	mov	w3, 15
	mov	w2, 320
	mov	w1, 240
	b	.L437
.L388:
	mov	w1, 16
	add	x0, x29, 72
	bl	BsGet
	str	w0, [x20, 1488]
	mov	w1, 16
	add	x0, x29, 72
	bl	BsGet
	cmp	w0, 400
	ldr	w1, [x20, 1488]
	str	w0, [x20, 1484]
	add	w1, w1, 15
	ubfx	x1, x1, 4, 16
	strh	w1, [x20, 716]
	bhi	.L395
	add	w0, w0, 15
	strh	w1, [x20, 764]
	lsr	w0, w0, 4
	mov	w19, 0
	strb	w0, [x20, 715]
	b	.L394
	.p2align 3
.L419:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L444:
	add	x0, x29, 72
	add	w19, w19, 1
	bl	BsPos
	cmp	w0, w23
	mov	w1, 8
	add	x0, x29, 72
	bgt	.L447
	bl	BsSkip
	cmp	w19, 15
	bls	.L408
	.p2align 2
.L435:
	strb	wzr, [x20, 1553]
	add	x0, x29, 72
	bl	BsPos
	mov	w19, w0
	ldr	x0, .LC71
	ldr	x4, [x0]
	cbz	x4, .L419
	ldr	w0, [x20, 2792]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 22
	blr	x4
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L402:
	add	x0, x29, 72
	bl	BsPos
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
.L446:
	ldr	x2, .LC72
	mov	w1, 879
	mov	w0, 1
	bl	dprint_normal
	ldr	w23, [x20, 2792]
	ldr	w0, [x24, 3556]
	cmp	w0, wzr
	ble	.L415
	sub	w0, w0, #1
	add	x20, x22, 3556
	add	x22, x0, 3962
	add	x22, x21, x22, lsl 2
	.p2align 2
.L414:
	ldr	w1, [x20], 4
	mov	w0, w23
	bl	SM_ReleaseStreamSeg
	cmp	x20, x22
	bne	.L414
.L415:
	str	wzr, [x24, 3556]
	b	.L412
.L447:
	bl	BsPos
	b	.L434
.L395:
	cmp	w0, 800
	bhi	.L396
	add	w2, w0, 31
	ubfiz	w3, w1, 1, 15
	lsr	w2, w2, 5
	strh	w3, [x20, 716]
	strb	w2, [x20, 715]
	ands	w0, w0, 31
	bne	.L436
.L398:
	strh	w3, [x20, 764]
	mov	w19, 0
	b	.L394
.L396:
	add	w2, w0, 63
	ubfiz	w3, w1, 2, 14
	lsr	w2, w2, 6
	strh	w3, [x20, 716]
	strb	w2, [x20, 715]
	ands	w0, w0, 63
	beq	.L398
.L436:
	add	w0, w0, 15
	lsr	w19, w0, 4
	mul	w1, w1, w19
	strh	w1, [x20, 764]
	b	.L394
.L445:
	ldr	w0, [x21, 15772]
	ldr	w1, [x21, 15768]
	lsl	w0, w0, 3
	strb	wzr, [x21, 1254]
	str	w0, [x21, 1260]
	str	w1, [x21, 1272]
	b	.L411
	.size	H263_Syntax_Sorenson_PicHeader, .-H263_Syntax_Sorenson_PicHeader
	.align	3
.LC68:
	.xword	.LC60
	.align	3
.LC69:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC70:
	.xword	.L387
	.align	3
.LC71:
	.xword	g_EventReportFunc
	.align	3
.LC72:
	.xword	.LC66
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Syntax_Slice_NotSH
	.type	H263_Syntax_Slice_NotSH, %function
H263_Syntax_Slice_NotSH:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	mov	w23, w2
	bl	_mcount
	ldr	w19, [x20, 15584]
	sub	w0, w19, #1
	cmp	w0, 510
	bls	.L449
	add	x21, x20, 20480
	add	x19, x20, 12288
	add	x22, x20, 16384
	add	x1, x19, 3376
	ldr	w0, [x21, 2792]
	bl	H263_ClearCurPacket
	ldr	w23, [x21, 2792]
	ldr	w0, [x22, 3556]
	cmp	w0, wzr
	ble	.L453
	sub	w21, w0, #1
	add	x19, x19, 3556
	add	x21, x21, 3962
	add	x21, x20, x21, lsl 2
	.p2align 2
.L452:
	ldr	w1, [x19], 4
	mov	w0, w23
	bl	SM_ReleaseStreamSeg
	cmp	x19, x21
	bne	.L452
.L453:
	ldr	w1, [x22, 3560]
	mov	w0, -435
	str	wzr, [x22, 3556]
	and	w0, w1, w0
	str	w0, [x22, 3560]
	ldr	x3, .LC73
	mov	w1, 2340
	ldr	x2, .LC75
	mov	w0, 1
	ldr	w4, [x20, 15584]
	bl	dprint_normal
	mov	w0, 0
.L472:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L449:
	add	x25, x20, 12288
	add	w0, w19, 1
	str	w0, [x20, 15584]
	mov	x1, x21
	mov	w2, w23
	add	x0, x29, 88
	ldrh	w21, [x25, 3552]
	add	x24, x20, 20480
	bl	BsInit
	ubfx	x21, x21, 7, 4
	add	x0, x29, 88
	add	w21, w21, 17
	mov	w1, w21
	bl	BsSkip
	ldr	w21, [x24, 1484]
	ldr	w0, [x24, 1488]
	add	w21, w21, 15
	add	w0, w0, 15
	lsr	w21, w21, 4
	lsr	w0, w0, 4
	mul	w21, w0, w21
	cbz	w21, .L454
	mov	w0, w21
	mov	w1, 0
	.p2align 2
.L455:
	add	w1, w1, 1
	lsr	w0, w0, 1
	sxth	w1, w1
	cbnz	w0, .L455
	add	x0, x29, 88
	uxtw	x19, w19
	bl	BsGet
	lsl	x1, x19, 3
	sub	w2, w21, #1
	sub	x1, x1, x19
	cmp	w0, w2
	add	x1, x20, x1, lsl 2
	str	w0, [x1, 1264]
	bhi	.L473
.L456:
	lsl	x21, x19, 3
	mov	w1, 5
	sub	x21, x21, x19
	add	x0, x29, 88
	add	x21, x20, x21, lsl 2
	bl	BsGet
	mov	w1, 1
	strb	w0, [x21, 1252]
	add	x0, x29, 88
	bl	BsGet
	cbnz	w0, .L467
	ldrb	w0, [x24, 704]
	add	x22, x20, 16384
	strb	w0, [x21, 1251]
	ldrb	w0, [x24, 708]
	strb	w0, [x21, 1250]
.L461:
	lsl	x21, x19, 3
	ldrb	w1, [x24, 712]
	sub	x21, x21, x19
	add	x0, x29, 88
	lsl	w23, w23, 3
	add	x21, x20, x21, lsl 2
	strb	w1, [x21, 1248]
	ldrb	w1, [x24, 713]
	strb	w1, [x21, 1249]
	ldr	w1, [x22, 3560]
	orr	w1, w1, 16
	str	w1, [x22, 3560]
	bl	BsPos
	mov	w22, w0
	asr	w0, w0, 31
	sub	w23, w23, w22
	lsr	w0, w0, 29
	str	w23, [x21, 1256]
	add	w1, w22, w0
	add	w2, w22, 7
	ldr	w3, [x24, 1576]
	and	w1, w1, 7
	sub	w0, w1, w0
	cmp	w22, wzr
	add	w0, w3, w0
	strb	w0, [x21, 1253]
	csel	w0, w2, w22, lt
	ldr	w1, [x24, 1568]
	add	w0, w1, w0, asr 3
	str	w0, [x21, 1268]
	ldrb	w0, [x25, 3386]
	cbnz	w0, .L463
	ldrb	w0, [x25, 3474]
	cmp	w0, 1
	beq	.L474
.L463:
	lsl	x0, x19, 3
	sub	x19, x0, x19
	add	x19, x20, x19, lsl 2
	strb	wzr, [x19, 1254]
	str	wzr, [x19, 1260]
	str	wzr, [x19, 1272]
.L464:
	mov	x0, x20
	bl	H263_Record_SlcSegID
	ldr	x25, [sp, 64]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L467:
	mov	w1, 1
	add	x0, x29, 88
	bl	BsGet
	cbnz	w0, .L467
	mov	w1, 1
	add	x22, x20, 16384
	add	x0, x29, 88
	bl	BsSkip
	ldr	w1, [x22, 3660]
	cbnz	w1, .L475
.L459:
	mov	w1, 1
	add	x0, x29, 88
	lsl	x21, x19, 3
	sub	x21, x21, x19
	bl	BsSkip
	mov	w1, 2
	add	x0, x29, 88
	add	x21, x20, x21, lsl 2
	bl	BsGet
	mov	w1, 3
	strb	w0, [x21, 1251]
	add	x0, x29, 88
	bl	BsGet
	strb	w0, [x21, 1250]
	ldrb	w1, [x21, 1251]
	cbz	w1, .L461
	mov	w1, 3
	add	x0, x29, 88
	bl	BsSkip
	ldrb	w0, [x21, 1251]
	cmp	w0, 2
	bne	.L461
	mov	w1, 3
	add	x0, x29, 88
	bl	BsSkip
	b	.L461
	.p2align 3
.L475:
	add	x0, x29, 88
	bl	BsSkip
	b	.L459
	.p2align 3
.L474:
	ldr	w0, [x20, 15772]
	strb	wzr, [x21, 1254]
	lsl	w0, w0, 3
	str	w0, [x21, 1260]
	ldr	w0, [x20, 15768]
	str	w0, [x21, 1272]
	b	.L464
.L454:
	mov	w1, 0
	add	x0, x29, 88
	uxtw	x19, w19
	bl	BsGet
	lsl	x1, x19, 3
	sub	x1, x1, x19
	add	x1, x20, x1, lsl 2
	str	w0, [x1, 1264]
	b	.L456
.L473:
	ldr	x2, .LC77
	mov	w3, w0
	mov	w4, w21
	mov	w1, 2362
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L472
	.size	H263_Syntax_Slice_NotSH, .-H263_Syntax_Slice_NotSH
	.align	3
.LC73:
	.xword	.LANCHOR1
	.align	3
.LC75:
	.xword	.LC74
	.align	3
.LC77:
	.xword	.LC76
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Syntax_Slice_SH
	.type	H263_Syntax_Slice_SH, %function
H263_Syntax_Slice_SH:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	mov	w22, w2
	bl	_mcount
	ldr	w3, [x20, 15584]
	sub	w26, w3, #1
	cmp	w26, 510
	bls	.L477
	add	x21, x20, 20480
	add	x19, x20, 12288
	add	x23, x20, 16384
	add	x1, x19, 3376
	ldr	w0, [x21, 2792]
	bl	H263_ClearCurPacket
	ldr	w22, [x21, 2792]
	ldr	w0, [x23, 3556]
	cmp	w0, wzr
	ble	.L481
	sub	w21, w0, #1
	add	x19, x19, 3556
	add	x21, x21, 3962
	add	x21, x20, x21, lsl 2
	.p2align 2
.L480:
	ldr	w1, [x19], 4
	mov	w0, w22
	bl	SM_ReleaseStreamSeg
	cmp	x19, x21
	bne	.L480
.L481:
	ldr	w1, [x23, 3560]
	mov	w0, -435
	str	wzr, [x23, 3556]
	and	w0, w1, w0
	str	w0, [x23, 3560]
	ldr	x3, .LC78
	mov	w1, 2449
	ldr	x2, .LC79
	mov	w0, 1
	ldr	w4, [x20, 15584]
	add	x3, x3, 24
	bl	dprint_normal
	mov	w0, 0
.L479:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L477:
	add	x24, x20, 12288
	add	w0, w3, 1
	str	w0, [x20, 15584]
	mov	x1, x19
	mov	w2, w22
	add	x0, x29, 88
	ldrb	w19, [x24, 3552]
	uxtw	x25, w3
	bl	BsInit
	add	x23, x20, 20480
	ubfx	x19, x19, 3, 4
	add	x0, x29, 88
	add	w19, w19, 17
	mov	w1, w19
	lsl	x19, x25, 3
	sub	x19, x19, x25
	bl	BsSkip
	mov	w1, 5
	add	x0, x29, 88
	add	x19, x20, x19, lsl 2
	bl	BsGet
	ldrh	w3, [x23, 716]
	mul	w0, w3, w0
	str	w0, [x19, 1264]
	ldrh	w1, [x20, 1208]
	ldrh	w4, [x20, 1206]
	mul	w4, w1, w4
	sub	w4, w4, #1
	cmp	w0, w4
	bhi	.L494
	mov	w1, 2
	add	x0, x29, 88
	lsl	w22, w22, 3
	bl	BsSkip
	mov	w1, 5
	add	x0, x29, 88
	bl	BsGet
	strb	w0, [x19, 1252]
	add	x0, x29, 88
	ldrb	w1, [x23, 704]
	strb	w1, [x19, 1251]
	ldrb	w1, [x23, 708]
	strb	w1, [x19, 1250]
	ldrb	w1, [x23, 712]
	strb	w1, [x19, 1248]
	ldrb	w1, [x23, 713]
	strb	w1, [x19, 1249]
	bl	BsPos
	mov	w21, w0
	asr	w0, w0, 31
	sub	w22, w22, w21
	lsr	w0, w0, 29
	str	w22, [x19, 1256]
	add	w1, w21, w0
	add	w2, w21, 7
	ldr	w3, [x23, 1576]
	and	w1, w1, 7
	sub	w0, w1, w0
	cmp	w21, wzr
	add	w0, w3, w0
	strb	w0, [x19, 1253]
	csel	w0, w2, w21, lt
	add	x1, x20, 16384
	ldr	w2, [x23, 1568]
	add	w0, w2, w0, asr 3
	str	w0, [x19, 1268]
	ldr	w0, [x1, 3560]
	orr	w0, w0, 16
	str	w0, [x1, 3560]
	ldrb	w0, [x24, 3386]
	cbnz	w0, .L483
	ldrb	w0, [x24, 3474]
	cmp	w0, 1
	beq	.L495
.L483:
	lsl	x0, x25, 3
	sub	x0, x0, x25
	add	x0, x20, x0, lsl 2
	strb	wzr, [x0, 1254]
	str	wzr, [x0, 1260]
	str	wzr, [x0, 1272]
.L484:
	uxtw	x0, w26
	lsl	x1, x0, 3
	sub	x1, x1, x0
	add	x1, x20, x1, lsl 2
	ldr	w2, [x1, 1272]
	cbz	w2, .L485
	ldr	w2, [x1, 1260]
	cbnz	w2, .L496
.L485:
	lsl	x1, x0, 3
	ldrb	w2, [x24, 3552]
	sub	x0, x1, x0
	ubfx	x1, x2, 3, 4
	add	x0, x20, x0, lsl 2
	ldr	w2, [x0, 1256]
	add	w1, w2, w1
	str	w1, [x0, 1256]
.L486:
	mov	x0, x20
	bl	H263_Record_SlcSegID
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L496:
	ldrb	w0, [x24, 3552]
	ubfx	x0, x0, 3, 4
	add	w2, w0, w2
	str	w2, [x1, 1260]
	b	.L486
	.p2align 3
.L495:
	ldr	w0, [x20, 15772]
	strb	wzr, [x19, 1254]
	lsl	w0, w0, 3
	str	w0, [x19, 1260]
	ldr	w0, [x20, 15768]
	str	w0, [x19, 1272]
	b	.L484
.L494:
	ldr	x2, .LC81
	mov	w3, w0
	mov	w1, 2470
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L479
	.size	H263_Syntax_Slice_SH, .-H263_Syntax_Slice_SH
	.align	3
.LC78:
	.xword	.LANCHOR1
	.align	3
.LC79:
	.xword	.LC74
	.align	3
.LC81:
	.xword	.LC80
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Dec_Slice
	.type	H263_Dec_Slice, %function
H263_Dec_Slice:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 12288
	mov	x22, x1
	mov	w21, w2
	bl	_mcount
	ldrb	w0, [x20, 3552]
	tbz	x0, 0, .L505
	tbz	x0, 2, .L506
.L503:
	mov	w2, w21
	mov	x1, x22
	mov	x0, x19
	bl	H263_Syntax_Slice_SH
	cmn	w0, #1
	beq	.L507
.L501:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L506:
	ldrh	w1, [x20, 3552]
	ubfx	x1, x1, 7, 4
	sub	w2, w1, #1
	cmp	w2, 6
	bhi	.L503
	bfi	w0, w1, 3, 4
	mov	w2, w21
	strb	w0, [x20, 3552]
	mov	x1, x22
	mov	x0, x19
	bl	H263_Syntax_Slice_SH
	cmn	w0, #1
	bne	.L501
.L507:
	add	x19, x19, 20480
	add	x1, x20, 3376
	ldr	w0, [x19, 2792]
	bl	H263_ClearCurPacket
	ldr	x3, .LC82
	mov	w1, 2570
	ldr	x2, .LC84
	mov	w0, 1
	add	x3, x3, 48
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L505:
	mov	x0, x19
	bl	H263_Check_Slice_NotSH
	cbz	w0, .L508
	mov	w1, w21
	mov	x0, x19
	bl	H263_Combine_SliceData
	cbz	w0, .L502
	add	x19, x19, 20480
	add	x1, x20, 3376
	ldr	w0, [x19, 2792]
	bl	H263_ClearCurPacket
	ldr	x3, .LC82
	mov	w1, 2550
	ldr	x2, .LC84
	mov	w0, 1
	add	x3, x3, 48
	bl	dprint_normal
	b	.L501
	.p2align 3
.L508:
	mov	w2, w21
	mov	x1, x22
	mov	x0, x19
	bl	H263_Syntax_Slice_NotSH
	cmn	w0, #1
	bne	.L501
	add	x19, x19, 20480
	add	x1, x20, 3376
	ldr	w0, [x19, 2792]
	bl	H263_ClearCurPacket
	ldr	x3, .LC82
	mov	w1, 2540
	ldr	x2, .LC84
	mov	w0, 1
	add	x3, x3, 48
	bl	dprint_normal
	b	.L501
	.p2align 3
.L502:
	mov	x0, x19
	bl	H263_Record_SlcSegID
	b	.L501
	.size	H263_Dec_Slice, .-H263_Dec_Slice
	.align	3
.LC82:
	.xword	.LANCHOR1
	.align	3
.LC84:
	.xword	.LC83
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Check_CurPacket
	.type	H263_Check_CurPacket, %function
H263_Check_CurPacket:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 20480
	bl	_mcount
	ldr	w1, [x19, 15680]
	add	x2, x19, 12288
	str	w1, [x20, 1568]
	add	x2, x2, 3376
	add	x0, x29, 40
	ldr	x1, [x19, 15664]
	str	x1, [x19, 22040]
	ldr	w2, [x2, 20]
	str	w2, [x20, 1572]
	str	wzr, [x20, 1576]
	bl	BsInit
	mov	w1, 32
	add	x0, x29, 40
	bl	BsShow
	ldr	w0, [x20, 2072]
	mov	w1, 1
	strb	w1, [x20, 781]
	cmp	w0, 196
	beq	.L513
.L510:
	ldr	x0, [x19, 15664]
	cbz	x0, .L512
	ldr	w0, [x19, 15680]
	cmp	w0, wzr
	csetm	w0, eq
.L511:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L513:
	ldr	w0, [x20, 2080]
	cmp	w0, 1
	ble	.L510
	mov	x0, x19
	bl	H263_Clean_HeadPacket
	b	.L510
.L512:
	mov	w0, -1
	b	.L511
	.size	H263_Check_CurPacket, .-H263_Check_CurPacket
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Record_PacketID
	.type	H263_Record_PacketID, %function
H263_Record_PacketID:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 20480
	bl	_mcount
	ldr	w1, [x20, 2068]
	cmp	w1, 62
	bgt	.L517
	add	x0, x19, x1, sxtw 2
	ldr	w4, [x19, 15688]
	add	x0, x0, 20480
	add	x3, x19, 12288
	add	w2, w1, 1
	str	w4, [x0, 1812]
	str	w2, [x20, 2068]
	ldrb	w2, [x3, 3386]
	cbnz	w2, .L514
	ldrb	w2, [x3, 3474]
	cmp	w2, 1
	beq	.L518
.L514:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L517:
	mov	x0, x19
	bl	H263_Clean_HeadPacket
	ldr	w0, [x20, 2792]
	add	x1, x19, 12288
	add	x1, x1, 3376
	bl	H263_ClearCurPacket
	ldr	w3, [x20, 2068]
	mov	w4, 62
	ldr	x2, .LC85
	mov	w1, 2718
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L518:
	ldr	w2, [x19, 15776]
	add	w1, w1, 2
	str	w2, [x0, 1816]
	str	w1, [x20, 2068]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H263_Record_PacketID, .-H263_Record_PacketID
	.align	3
.LC85:
	.xword	.LC58
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Record_HeadPacketInfo
	.type	H263_Record_HeadPacketInfo, %function
H263_Record_HeadPacketInfo:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	w23, w1
	bl	_mcount
	cbz	x21, .L523
	ldr	x22, .LC88
	add	x19, x21, 20480
	add	x20, x21, 12288
	mov	x2, 176
	add	x1, x20, 3376
	add	x0, x19, 1632
	ldr	x3, [x22, 104]
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 4
	add	x1, x20, 3552
	add	x0, x19, 1808
	blr	x3
	str	w23, [x19, 2072]
	ldr	w0, [x19, 2076]
	cbz	w0, .L524
.L522:
	ldr	w0, [x19, 2080]
	add	w0, w0, 1
	str	w0, [x19, 2080]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L524:
	mov	x0, x21
	bl	H263_Record_PacketID
	mov	w0, 1
	str	w0, [x19, 2076]
	b	.L522
	.p2align 3
.L523:
	ldr	x2, .LC87
	mov	w1, 2610
	mov	w0, 1
	bl	dprint_normal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	H263_Record_HeadPacketInfo, .-H263_Record_HeadPacketInfo
	.align	3
.LC87:
	.xword	.LC86
	.align	3
.LC88:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Syntax_Parse
	.type	H263_Syntax_Parse, %function
H263_Syntax_Parse:
	stp	x29, x30, [sp, -176]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	mov	x23, x1
	mov	w22, w2
	uxtb	w26, w3
	bl	_mcount
	ldr	x24, .LC89
	mov	x2, 40
	mov	w1, 0
	add	x0, x29, 96
	add	x20, x21, 16384
	ldr	x3, [x24, 96]
	blr	x3
	mov	w2, w22
	mov	x1, x23
	add	x0, x29, 96
	bl	BsInit
	mov	w1, 32
	add	x0, x29, 96
	bl	BsShow
	str	wzr, [x20, 3564]
	cmp	w0, 510
	beq	.L617
.L526:
	add	x19, x21, 20480
	add	x25, x21, 12288
	mov	w0, 1
	strb	w0, [x19, 781]
	ldrb	w0, [x25, 3552]
	tbnz	x0, 1, .L530
	ldr	w0, [x20, 3560]
	mov	w1, 130
	tst	w0, w1
	beq	.L531
	orr	w0, w0, 32
	mov	w1, 1
	str	w0, [x20, 3560]
	mov	w0, 0
	str	w1, [x20, 3564]
.L599:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L531:
	ldr	x2, .LC92
	mov	w1, 953
	mov	w0, 3
	bl	dprint_normal
	cmp	w26, 1
	mov	w2, w22
	mov	x1, x23
	mov	x0, x21
	beq	.L618
	bl	H263_Syntax_PicHeader
	mov	w23, w0
.L533:
	ldr	w0, [x20, 3560]
	tbnz	x0, 1, .L534
	ldr	w0, [x19, 2792]
	add	x1, x25, 3376
	bl	H263_ClearCurPacket
	ldrb	w0, [x19, 2829]
	cmp	w0, 1
	bne	.L536
.L621:
	ldr	w1, [x20, 3672]
	cbz	w1, .L538
	ldr	w2, [x20, 3676]
	cbnz	w2, .L619
.L538:
	strb	wzr, [x19, 2829]
.L627:
	cmp	w23, w22, lsl 3
	bls	.L620
.L540:
	ldr	x2, .LC103
	mov	w1, 1139
	mov	w0, 3
	bl	dprint_normal
	ldr	w2, [x20, 3560]
	mov	w1, -435
	mov	w0, 0
	and	w1, w2, w1
	str	w1, [x20, 3560]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L530:
	mov	x1, x23
	mov	w2, w22
	mov	x0, x21
	bl	H263_Dec_Slice
	mov	w23, w0
.L535:
	ldrb	w0, [x19, 2829]
	cmp	w0, 1
	beq	.L621
.L536:
	cmp	w23, w22, lsl 3
	bhi	.L540
.L620:
	ldr	w1, [x20, 3560]
	mov	w0, 130
	tst	w1, w0
	beq	.L541
	ldrb	w0, [x19, 781]
	cmp	w0, 2
	beq	.L622
	ldr	w2, [x19, 1484]
	ldr	w1, [x19, 1488]
	str	w1, [x19, 2116]
	str	w2, [x19, 2120]
	cbz	w1, .L545
	ldr	w0, [x19, 2108]
	mov	w20, 1
	cmp	w1, w0
	beq	.L545
.L546:
	ldr	x0, .LC90
	ldr	x4, [x0]
	cbz	x4, .L550
	ldr	w0, [x19, 2112]
	ldr	w3, [x19, 2108]
	strh	w0, [x29, 90]
	ldr	w0, [x19, 2792]
	strh	w1, [x29, 92]
	mov	w1, 1
	strh	w2, [x29, 94]
	add	x2, x29, 88
	strh	w3, [x29, 88]
	mov	w3, 8
	blr	x4
.L550:
	cbnz	w20, .L623
.L552:
	ldr	w1, [x19, 2116]
	ldr	w0, [x19, 2120]
	str	w1, [x19, 2108]
	str	w0, [x19, 2112]
.L544:
	ldr	x3, [x24, 104]
	add	x1, x19, 704
	mov	x2, 68
	add	x0, x19, 1416
	blr	x3
	ldr	x2, .LC98
	mov	w1, 1074
	mov	w0, 3
	bl	dprint_normal
	ldr	w1, [x19, 2092]
	mov	w0, w23
	add	w1, w1, 1
	str	w1, [x19, 2092]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L541:
	ldrb	w1, [x19, 1551]
	mov	w0, w23
	cmp	w1, 1
	bne	.L599
	ldr	w0, [x19, 2088]
	mov	x2, 604
	ldr	x3, [x24, 104]
	add	x1, x20, 3592
	add	w0, w0, 1
	str	wzr, [x19, 2092]
	str	w0, [x19, 2088]
	add	x0, x19, 812
	blr	x3
	ldr	w2, [x19, 1484]
	ldr	w0, [x20, 3676]
	ldr	w1, [x20, 3672]
	cmp	w2, w0
	beq	.L624
.L556:
	ldr	x3, .LC90
	ldr	x4, [x3]
	cbz	x4, .L558
	ldr	w3, [x19, 1488]
	strh	w0, [x29, 94]
	ldr	w0, [x19, 2792]
	strh	w1, [x29, 92]
	mov	w1, 1
	strh	w2, [x29, 90]
	add	x2, x29, 88
	strh	w3, [x29, 88]
	mov	w3, 8
	blr	x4
	ldr	w1, [x20, 3672]
	ldr	w0, [x20, 3676]
.L558:
	mov	w4, 1
	str	w0, [x19, 1484]
	str	w1, [x19, 1488]
.L559:
	ldr	w3, [x19, 2792]
	ldr	x22, .LC99
	sxtw	x0, w3
	lsl	x1, x0, 2
	sub	x1, x1, x0
	lsl	x2, x1, 5
	add	x1, x1, x2
	add	x0, x1, x0
	add	x22, x22, x0
	ldr	w0, [x22, 64]
	cbz	w0, .L625
.L561:
	ldr	w1, [x19, 2812]
	mov	w0, w3
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L562
	ldr	w0, [x19, 2792]
	ldr	x1, [x22, 168]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2792]
	ldr	x1, [x22, 176]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2792]
	ldr	x1, [x22, 184]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2792]
	ldr	x1, [x22, 192]
	bl	FreeUsdByDec
	stp	xzr, xzr, [x22, 168]
	stp	xzr, xzr, [x22, 184]
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2812]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2804]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 2792]
	bl	FSP_GetNullLogicFs
	str	w0, [x19, 2804]
	str	w0, [x19, 2812]
.L562:
	ldr	w0, [x19, 2792]
	add	x1, x19, 2184
	str	wzr, [x19, 2800]
	bl	FSP_ClearNotInVoQueue
	ldr	w2, [x19, 1484]
	mov	x0, x21
	ldr	w1, [x19, 1488]
	bl	H263_Frame_Init
	cbz	w0, .L560
	ldr	x2, .LC101
	mov	w1, 1118
	mov	w0, 0
	bl	dprint_normal
.L560:
	ldr	w1, [x19, 1484]
	ldr	w0, [x19, 1488]
	str	w0, [x19, 2112]
	mov	w0, w23
	str	w1, [x19, 2108]
	ldr	w1, [x20, 3676]
	str	w1, [x19, 1484]
	ldr	w1, [x20, 3672]
	str	w1, [x19, 1488]
	strb	wzr, [x19, 1551]
	b	.L599
	.p2align 3
.L618:
	bl	H263_Syntax_Sorenson_PicHeader
	mov	w23, w0
	b	.L533
	.p2align 3
.L545:
	cbz	w2, .L547
	ldr	w0, [x19, 2112]
	cmp	w2, w0
	beq	.L626
	mov	w20, 1
	cbz	w1, .L546
	ldr	w0, [x19, 2108]
	cmp	w1, w0
	bne	.L546
.L564:
	ldr	w0, [x19, 2112]
	cmp	w2, w0
	beq	.L550
	b	.L546
	.p2align 3
.L617:
	ldr	x3, [x24, 104]
	mov	x2, 40
	add	x1, x29, 96
	add	x0, x29, 136
	blr	x3
	mov	w1, 32
	add	x0, x29, 136
	bl	BsSkip
	mov	w1, 32
	add	x0, x29, 136
	bl	BsGet
	mov	w19, w0
	mov	w1, 32
	add	x0, x29, 136
	bl	BsGet
	mov	w2, 20553
	mov	w1, 20036
	movk	w2, 0x4853, lsl 16
	movk	w1, 0x4345, lsl 16
	cmp	w19, w2
	ccmp	w0, w1, 0, eq
	bne	.L526
	ldr	x1, .LC90
	add	x19, x21, 20480
	mov	w0, 1
	ldr	x4, [x1]
	strb	w0, [x19, 2828]
	cbz	x4, .L527
	ldr	w0, [x19, 2792]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 46
	blr	x4
.L527:
	ldr	w0, [x20, 3560]
	mov	w1, 130
	tst	w0, w1
	beq	.L528
	orr	w0, w0, 32
	mov	w1, 1
	str	w0, [x20, 3560]
	str	w1, [x20, 3564]
.L528:
	ldr	w0, [x19, 2792]
	add	x1, x21, 12288
	add	x1, x1, 3376
	bl	H263_ClearCurPacket
	mov	w0, 0
	b	.L599
	.p2align 3
.L534:
	mov	w1, 196
	mov	x0, x21
	bl	H263_Record_HeadPacketInfo
	b	.L535
	.p2align 3
.L622:
	ldrb	w0, [x19, 704]
	cmp	w0, 2
	beq	.L543
	ldr	w0, [x19, 1500]
	ldr	w1, [x19, 1492]
	str	w0, [x19, 1504]
	add	w1, w0, w1
	str	w1, [x19, 1500]
	ldr	w3, [x19, 1496]
	ldr	w0, [x20, 3664]
	ldr	w2, [x19, 1512]
	madd	w0, w1, w0, w3
	str	w0, [x19, 1508]
	str	w0, [x19, 1512]
	sub	w0, w0, w2
	str	w0, [x19, 1516]
	b	.L544
	.p2align 3
.L547:
	ldr	w0, [x19, 2796]
	cmp	w0, 1
	cset	w20, ne
	cbz	w1, .L550
.L565:
	ldr	w0, [x19, 2108]
	cmp	w1, w0
	bne	.L546
	cbnz	w2, .L564
	b	.L550
	.p2align 3
.L619:
	mov	x0, x21
	bl	H263_Frame_Init
	cbz	w0, .L538
	ldr	x2, .LC94
	mov	w1, 1007
	mov	w0, 0
	bl	dprint_normal
	strb	wzr, [x19, 2829]
	b	.L627
	.p2align 3
.L543:
	ldr	w2, [x19, 1504]
	ldr	w1, [x19, 1492]
	ldr	w0, [x20, 3664]
	ldr	w4, [x19, 1496]
	add	w1, w2, w1
	ldr	w3, [x19, 1512]
	ldr	w2, [x19, 1516]
	madd	w0, w1, w0, w4
	sub	w1, w2, w3
	str	w0, [x19, 1508]
	add	w0, w1, w0
	str	w0, [x19, 1520]
	b	.L544
	.p2align 3
.L623:
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2812]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L553
	ldr	w0, [x19, 2792]
	ldr	x1, [x20, 168]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2792]
	ldr	x1, [x20, 176]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2792]
	ldr	x1, [x20, 184]
	bl	FreeUsdByDec
	ldr	w0, [x19, 2792]
	ldr	x1, [x20, 192]
	bl	FreeUsdByDec
	stp	xzr, xzr, [x20, 168]
	stp	xzr, xzr, [x20, 184]
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2812]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2804]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 2792]
	bl	FSP_GetNullLogicFs
	str	w0, [x19, 2804]
	str	w0, [x19, 2812]
.L553:
	ldr	w0, [x19, 2792]
	add	x1, x19, 2184
	str	wzr, [x19, 2800]
	bl	FSP_ClearNotInVoQueue
	ldr	w1, [x19, 2116]
	mov	x0, x21
	ldr	w2, [x19, 2120]
	bl	H263_Frame_Init
	cbz	w0, .L552
	ldr	x2, .LC96
	mov	w1, 1064
	mov	w0, 0
	bl	dprint_normal
	b	.L552
	.p2align 3
.L626:
	ldr	w0, [x19, 2796]
	cmp	w0, 1
	cset	w20, ne
	cbnz	w1, .L565
	cbnz	w2, .L564
	b	.L550
	.p2align 3
.L624:
	ldr	w3, [x19, 1488]
	cmp	w3, w1
	bne	.L556
	ldr	w0, [x19, 2796]
	cmp	w0, 1
	cset	w4, ne
	cbz	w4, .L560
	b	.L559
.L625:
	ldr	x0, [x24]
	str	w4, [x22, 64]
	blr	x0
	str	w0, [x22, 68]
	ldr	w3, [x19, 2792]
	b	.L561
	.size	H263_Syntax_Parse, .-H263_Syntax_Parse
	.align	3
.LC89:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC90:
	.xword	g_EventReportFunc
	.align	3
.LC92:
	.xword	.LC91
	.align	3
.LC94:
	.xword	.LC93
	.align	3
.LC96:
	.xword	.LC95
	.align	3
.LC98:
	.xword	.LC97
	.align	3
.LC99:
	.xword	g_VfmwChanStat
	.align	3
.LC101:
	.xword	.LC100
	.align	3
.LC103:
	.xword	.LC102
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263DEC_Decode
	.type	H263DEC_Decode, %function
H263DEC_Decode:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 20480
	mov	x23, x1
	uxtb	w24, w2
	bl	_mcount
	ldr	w0, [x19, 2100]
	cbz	w0, .L629
	ldr	w0, [x23, 20]
	cbz	w0, .L629
	ldr	w0, [x23, 16]
	cbz	w0, .L629
	ldr	x0, [x23]
	cbz	x0, .L629
	ldr	x0, .LC106
	add	x21, x20, 12288
	strb	w24, [x20]
	add	x22, x21, 3376
	mov	x2, 176
	mov	x1, x23
	ldr	x3, [x0, 104]
	mov	x0, x22
	blr	x3
	mov	x1, x22
	mov	x0, x20
	bl	H263_GetScdUpMsg
	mov	x0, x20
	bl	H263_Check_CurPacket
	cmn	w0, #1
	mov	w25, w0
	beq	.L761
	mov	x1, x22
	mov	x0, x20
	bl	H263_GetScdUpMsg
	ldr	w1, [x22, 16]
	str	w1, [x19, 1568]
	ldr	x1, [x20, 15664]
	str	x1, [x20, 22040]
	ldr	w0, [x19, 1628]
	ldr	w2, [x22, 20]
	str	w2, [x19, 1572]
	cmp	w0, 2
	str	wzr, [x19, 1576]
	ldr	x3, [x20, 22064]
	beq	.L762
.L634:
	ldr	w0, [x3, 8]
	cmp	w0, 2
	beq	.L635
	cmp	w0, 1
	beq	.L753
	cmp	w0, 4
	csel	w0, w0, wzr, eq
.L753:
	str	w0, [x19, 1628]
	add	x22, x20, 16384
	ldr	w0, [x3, 856]
	cmp	w0, 1
	beq	.L763
.L640:
	ldr	w0, [x22, 3560]
	str	w0, [x19, 2832]
.L641:
	mov	w3, w24
	mov	x0, x20
	bl	H263_Syntax_Parse
	lsr	w2, w0, 3
	ldr	x4, [x20, 22040]
	mov	x3, x2
	and	w0, w0, 7
	add	x2, x4, x2
	str	x2, [x20, 22040]
	str	w0, [x19, 1576]
	ldr	w2, [x19, 1568]
	ldr	w0, [x19, 1572]
	add	w2, w2, w3
	str	w2, [x19, 1568]
	sub	w0, w0, w3
	str	w0, [x19, 1572]
	ldr	x0, [x20, 22064]
	ldr	w1, [x0, 856]
	cmp	w1, 1
	beq	.L764
.L642:
	ldr	w1, [x22, 3560]
	mov	w0, 288
	tst	w1, w0
	beq	.L643
	mov	w0, -435
	and	w0, w1, w0
	str	w0, [x22, 3560]
	ldr	w0, [x19, 1628]
	cmp	w0, 2
	beq	.L765
	cmp	w0, 1
	beq	.L766
	cmp	w0, 4
	bne	.L688
	ldrb	w0, [x19, 1416]
	cbz	w0, .L767
	sub	w1, w0, #2
	and	w1, w1, -3
	uxtb	w1, w1
	cbnz	w1, .L653
	ldr	w1, [x19, 2128]
	cmp	w1, 2
	beq	.L679
.L653:
	cmp	w0, 1
	bne	.L688
	str	w0, [x19, 2128]
	b	.L688
	.p2align 3
.L766:
	ldrb	w0, [x19, 1416]
	cmp	w0, 2
	beq	.L645
.L688:
	mov	x0, x20
	bl	H263_Frame_Atr
	cmn	w0, #1
	beq	.L768
	ldr	w1, [x19, 2804]
	ldr	w0, [x19, 2792]
	bl	FSP_GetFsImagePtr
	mov	x25, x0
	ldr	w1, [x19, 2812]
	ldr	w0, [x19, 2792]
	bl	FSP_GetFsImagePtr
	mov	x26, x0
	cmp	x25, xzr
	cset	w24, eq
	cmp	x0, xzr
	cset	w0, eq
	orr	w24, w24, w0
	cbnz	w24, .L769
	ldrb	w0, [x19, 779]
	and	w1, w0, -3
	cmp	w1, 1
	bne	.L657
	cbz	x25, .L658
	ldr	x0, [x20, 22064]
	ldr	w1, [x25, 96]
	ldr	w0, [x0]
	cmp	w1, w0
	bls	.L660
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2820]
	bl	FSP_ClearLogicFs
	ldr	w23, [x22, 3556]
	ldr	w24, [x19, 2792]
	cmp	w23, wzr
	ble	.L770
.L690:
	add	x21, x21, 3556
	mov	w19, 0
	.p2align 2
.L661:
	ldr	w1, [x21], 4
	mov	w0, w24
	add	w19, w19, 1
	bl	SM_ReleaseStreamSeg
	cmp	w19, w23
	blt	.L661
	mov	x0, x20
	str	wzr, [x22, 3556]
	bl	H263_Clean_HeadPacket
	cbz	x25, .L689
.L662:
	ldr	x4, [x20, 22064]
	mov	w1, 1740
	ldr	w3, [x25, 96]
	mov	w0, 1
	ldr	x2, .LC117
	mov	w25, -1
	ldr	w4, [x4]
	bl	dprint_normal
	mov	w0, w25
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L657:
	cmp	w0, 2
	beq	.L771
.L660:
	ldrb	w0, [x19, 1416]
	cmp	w0, 2
	beq	.L671
	ldr	w3, [x19, 2800]
	mov	w0, 2
	ldr	w1, [x19, 2804]
	ldr	w2, [x19, 2812]
	cmp	w3, wzr
	csinc	w0, w0, wzr, gt
	str	w0, [x19, 2800]
	cmp	w1, w2
	beq	.L673
	ldr	w0, [x19, 2792]
	mov	w2, 0
	bl	FSP_SetRef
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2804]
	bl	FSP_GetDisplay
	cmp	w0, 3
	beq	.L754
	ldr	w0, [x19, 2792]
	mov	w2, 0
	ldr	w1, [x19, 2804]
	bl	FSP_SetDisplay
.L754:
	ldr	w2, [x19, 2812]
.L673:
	str	w2, [x19, 2804]
	mov	w2, 1
	ldrb	w0, [x20, 2]
	strb	w0, [x20, 1]
	ldr	w0, [x19, 2816]
	ldr	w1, [x19, 2820]
	str	w1, [x19, 2812]
	str	w0, [x19, 2808]
	ldrb	w0, [x20, 3]
	strb	w0, [x20, 2]
	ldr	w3, [x19, 1516]
	ldr	w0, [x19, 2792]
	str	w3, [x19, 2816]
	bl	FSP_SetRef
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2804]
	bl	FSP_ReleasePmv
	ldrb	w0, [x19, 1416]
	cmp	w0, 4
	beq	.L772
.L671:
	mov	x0, x20
	mov	x2, x23
	mov	w1, 0
	bl	H263_Set_DecPar
	ldrb	w0, [x19, 1416]
	cbnz	w0, .L675
	ldr	w1, [x19, 2128]
	cbz	w1, .L773
	mov	w1, 1
	str	w1, [x19, 2128]
.L677:
	ldr	x2, [x20, 22064]
	add	x1, x20, 1048
	str	x1, [x20, 1040]
	ldr	w3, [x2, 880]
	cmp	w3, 1
	beq	.L684
.L683:
	cmp	w3, 2
	beq	.L697
.L684:
	strb	wzr, [x20, 1202]
	cbnz	w0, .L687
	ldr	x0, .LC122
	ldr	x4, [x0]
	cbz	x4, .L687
	add	x2, x29, 96
	ldr	w0, [x19, 2792]
	mov	w3, 4
	mov	w1, 8
	mov	w25, 0
	str	wzr, [x2, -8]!
	blr	x4
	mov	w0, w25
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L762:
	ldr	w0, [x3, 8]
	cmp	w0, 2
	bne	.L774
.L635:
	mov	w0, 2
	str	w0, [x19, 1628]
	add	x22, x20, 16384
	ldr	w0, [x3, 856]
	cmp	w0, 1
	bne	.L640
.L763:
	ldr	w0, [x3, 888]
	cmp	w0, 1
	bne	.L640
	ldr	w0, [x19, 2832]
	str	w0, [x22, 3560]
	b	.L641
	.p2align 3
.L764:
	ldr	w0, [x0, 888]
	cbz	w0, .L642
.L687:
	mov	w25, 0
.L746:
	mov	w0, w25
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L675:
	sub	w1, w0, #2
	cmp	w0, 2
	and	w1, w1, -3
	cset	w24, eq
	uxtb	w1, w1
	cbnz	w1, .L678
	ldr	w1, [x19, 2128]
	cmp	w1, 2
	beq	.L775
.L678:
	cmp	w0, 1
	bne	.L680
	str	w0, [x19, 2128]
	add	x1, x20, 1048
	str	x1, [x20, 1040]
	ldr	x2, [x20, 22064]
	ldr	w3, [x2, 880]
	cmp	w3, 1
	beq	.L681
	cmp	w3, 2
	beq	.L697
.L681:
	strb	wzr, [x20, 1202]
	b	.L687
	.p2align 3
.L765:
	ldrb	w0, [x19, 1416]
	cbz	w0, .L688
.L645:
	ldr	w0, [x22, 3556]
	ldr	w23, [x19, 2792]
	cmp	w0, wzr
	ble	.L650
	sub	w19, w0, #1
	add	x21, x21, 3556
	add	x19, x19, 3962
	add	x19, x20, x19, lsl 2
	.p2align 2
.L649:
	ldr	w1, [x21], 4
	mov	w0, w23
	bl	SM_ReleaseStreamSeg
	cmp	x19, x21
	bne	.L649
.L650:
	mov	x0, x20
	str	wzr, [x22, 3556]
	mov	w25, -1
	bl	H263_Clean_HeadPacket
	b	.L746
	.p2align 3
.L767:
	ldr	w0, [x19, 2128]
	cbnz	w0, .L652
	mov	w0, 2
	str	w0, [x19, 2128]
	b	.L688
	.p2align 3
.L774:
	mov	w0, 1
	str	w0, [x19, 2176]
	b	.L634
	.p2align 3
.L773:
	mov	w1, 2
	str	w1, [x19, 2128]
	b	.L677
	.p2align 3
.L771:
	cbz	x25, .L663
	ldr	x0, [x20, 22064]
	ldr	w1, [x25, 96]
	ldr	w0, [x0]
	cmp	w1, w0
	bhi	.L664
	cbz	x26, .L668
	ldr	w1, [x26, 96]
	cmp	w0, w1
	bcs	.L660
.L668:
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2820]
	bl	FSP_ClearLogicFs
	ldr	w23, [x19, 2792]
	ldr	w0, [x22, 3556]
	cmp	w0, wzr
	ble	.L669
	sub	w19, w0, #1
	add	x21, x21, 3556
	add	x19, x19, 3962
	add	x19, x20, x19, lsl 2
	.p2align 2
.L670:
	ldr	w1, [x21], 4
	mov	w0, w23
	bl	SM_ReleaseStreamSeg
	cmp	x21, x19
	bne	.L670
.L669:
	mov	x0, x20
	str	wzr, [x22, 3556]
	mov	w25, -1
	bl	H263_Clean_HeadPacket
	ldr	x4, [x20, 22064]
	mov	w1, 1778
	ldr	x2, .LC126
	mov	w0, 1
	ldr	w3, [x26, 96]
	ldr	w4, [x4]
	bl	dprint_normal
	b	.L746
	.p2align 3
.L697:
	ldr	w2, [x2, 884]
	cmp	w2, wzr
	cset	w2, gt
	cmp	x1, xzr
	and	w24, w24, w2
	cset	w1, ne
	tst	w1, w24
	beq	.L684
	str	xzr, [x20, 1040]
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2820]
	bl	FSP_ClearLogicFs
	ldr	x1, [x20, 22064]
	ldr	w0, [x1, 884]
	sub	w0, w0, #1
	str	w0, [x1, 884]
	ldr	w0, [x22, 3556]
	ldr	w23, [x19, 2792]
	cmp	w0, wzr
	ble	.L650
	sub	w19, w0, #1
	add	x21, x21, 3556
	add	x19, x19, 3962
	add	x19, x20, x19, lsl 2
.L686:
	ldr	w1, [x21], 4
	mov	w0, w23
	bl	SM_ReleaseStreamSeg
	cmp	x19, x21
	bne	.L686
	b	.L650
	.p2align 3
.L629:
	ldr	x2, .LC105
	mov	w1, 1623
	mov	w0, 1
	mov	w25, -1
	bl	dprint_normal
	mov	w0, w25
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L652:
	mov	w0, 1
	str	w0, [x19, 2128]
	b	.L688
	.p2align 3
.L680:
	ldr	x2, [x20, 22064]
	add	x1, x20, 1048
	str	x1, [x20, 1040]
	ldr	w3, [x2, 880]
	cmp	w3, 1
	bne	.L683
	cmp	x1, xzr
	cset	w1, ne
	tst	w24, w1
	beq	.L684
	str	xzr, [x20, 1040]
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2820]
	bl	FSP_ClearLogicFs
	ldr	w23, [x19, 2792]
	ldr	w0, [x22, 3556]
	cmp	w0, wzr
	ble	.L650
	sub	w19, w0, #1
	add	x21, x21, 3556
	add	x19, x19, 3962
	add	x19, x20, x19, lsl 2
.L685:
	ldr	w1, [x21], 4
	mov	w0, w23
	bl	SM_ReleaseStreamSeg
	cmp	x19, x21
	bne	.L685
	b	.L650
	.p2align 3
.L664:
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2820]
	bl	FSP_ClearLogicFs
	ldr	w23, [x22, 3556]
	ldr	w24, [x19, 2792]
	cmp	w23, wzr
	ble	.L776
.L693:
	add	x21, x21, 3556
	mov	w19, 0
	.p2align 2
.L666:
	ldr	w1, [x21], 4
	mov	w0, w24
	add	w19, w19, 1
	bl	SM_ReleaseStreamSeg
	cmp	w19, w23
	blt	.L666
	mov	x0, x20
	str	wzr, [x22, 3556]
	bl	H263_Clean_HeadPacket
	cbz	x25, .L695
.L667:
	ldr	x4, [x20, 22064]
	mov	w1, 1760
	ldr	w3, [x25, 96]
	mov	w0, 1
	ldr	x2, .LC119
	mov	w25, -1
	ldr	w4, [x4]
	bl	dprint_normal
	b	.L746
	.p2align 3
.L775:
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2820]
	bl	FSP_ClearLogicFs
	ldr	x0, .LC122
	ldr	x4, [x0]
	cbz	x4, .L679
	ldr	w0, [x19, 2792]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 60
	mov	w25, -1
	blr	x4
	b	.L746
	.p2align 3
.L658:
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2820]
	bl	FSP_ClearLogicFs
	ldr	w23, [x22, 3556]
	ldr	w24, [x19, 2792]
	cmp	w23, wzr
	bgt	.L690
	mov	x0, x20
	str	wzr, [x22, 3556]
	bl	H263_Clean_HeadPacket
	.p2align 2
.L689:
	ldr	x3, .LC111
	mov	w4, 1735
.L756:
	ldr	x2, .LC115
.L755:
	mov	w1, w4
	add	x3, x3, 64
	mov	w0, 1
	mov	w25, -1
	bl	dprint_normal
	b	.L746
.L770:
	mov	x0, x20
	str	wzr, [x22, 3556]
	bl	H263_Clean_HeadPacket
	b	.L662
.L761:
	ldr	x2, .LC108
	mov	w1, 1635
	mov	w0, 1
	bl	dprint_normal
	b	.L746
.L643:
	ldr	x2, .LC124
	mov	w1, 1883
	mov	w0, 3
	mov	w25, -1
	bl	dprint_normal
	b	.L746
.L679:
	mov	w25, -1
	b	.L746
.L769:
	ldr	x3, .LC111
	mov	w4, 1721
	ldr	x2, .LC113
	b	.L755
.L768:
	ldr	x2, .LC110
	mov	w1, 1709
	mov	w0, 1
	bl	dprint_normal
	ldr	w23, [x19, 2792]
	ldr	w0, [x22, 3556]
	cmp	w0, wzr
	ble	.L650
	sub	w19, w0, #1
	add	x21, x21, 3556
	add	x19, x19, 3962
	add	x19, x20, x19, lsl 2
	.p2align 2
.L655:
	ldr	w1, [x21], 4
	mov	w0, w23
	bl	SM_ReleaseStreamSeg
	cmp	x19, x21
	bne	.L655
	b	.L650
.L663:
	ldr	w0, [x19, 2792]
	ldr	w1, [x19, 2820]
	bl	FSP_ClearLogicFs
	ldr	w23, [x22, 3556]
	cmp	w23, wzr
	bgt	.L777
	mov	x0, x20
	str	wzr, [x22, 3556]
	bl	H263_Clean_HeadPacket
.L695:
	ldr	x3, .LC111
	mov	w4, 1755
	b	.L756
.L772:
	ldr	x2, .LC121
	mov	w1, 1814
	mov	w0, 0
	mov	w25, -1
	bl	dprint_normal
	b	.L746
.L777:
	ldr	w24, [x19, 2792]
	b	.L693
.L776:
	mov	x0, x20
	str	wzr, [x22, 3556]
	bl	H263_Clean_HeadPacket
	b	.L667
	.size	H263DEC_Decode, .-H263DEC_Decode
	.align	3
.LC105:
	.xword	.LC104
	.align	3
.LC106:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC108:
	.xword	.LC107
	.align	3
.LC110:
	.xword	.LC109
	.align	3
.LC111:
	.xword	.LANCHOR1
	.align	3
.LC113:
	.xword	.LC112
	.align	3
.LC115:
	.xword	.LC114
	.align	3
.LC117:
	.xword	.LC116
	.align	3
.LC119:
	.xword	.LC118
	.align	3
.LC121:
	.xword	.LC120
	.align	3
.LC122:
	.xword	g_EventReportFunc
	.align	3
.LC124:
	.xword	.LC123
	.align	3
.LC126:
	.xword	.LC125
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Combine_HdPacket
	.type	H263_Combine_HdPacket, %function
H263_Combine_HdPacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19, 22112]
	add	x0, x19, 20480
	add	x20, x0, 1632
	cbz	x1, .L791
	add	x1, x19, 12288
	ldrb	w2, [x1, 3386]
	cmp	w2, 1
	beq	.L792
	cbnz	w2, .L786
	ldrb	w2, [x1, 3474]
	cmp	w2, 1
	bne	.L786
	ldr	x4, .LC130
	mov	x2, 88
	ldr	w3, [x19, 15684]
	add	x1, x1, 3464
	ldr	w5, [x20, 20]
	add	x0, x0, 1720
	ldr	x4, [x4, 104]
	add	w3, w5, w3
	str	w3, [x20, 20]
	blr	x4
	mov	w0, 0
.L781:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L792:
	ldrb	w21, [x20, 10]
	cmp	w21, 1
	beq	.L793
	cbnz	w21, .L785
	ldrb	w0, [x20, 98]
	cmp	w0, 1
	bne	.L785
	ldr	w1, [x19, 15684]
	mov	w0, 0
	ldr	w2, [x20, 108]
	add	w1, w2, w1
	str	w1, [x20, 108]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L786:
	mov	w3, 2784
.L790:
	ldr	x2, .LC131
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L793:
	ldr	w3, [x19, 15680]
	ldr	w2, [x20, 16]
	cmp	w3, w2
	bcc	.L794
	ldr	w1, [x19, 15684]
	mov	w0, 0
	ldr	w2, [x20, 20]
	add	w1, w2, w1
	str	w1, [x20, 20]
	b	.L781
	.p2align 3
.L785:
	mov	w3, 2771
	b	.L790
	.p2align 3
.L794:
	ldr	x3, .LC130
	mov	x2, 88
	add	x1, x1, 3376
	add	x0, x0, 1720
	ldr	x3, [x3, 104]
	blr	x3
	strb	wzr, [x20, 10]
	strb	w21, [x20, 98]
	mov	w0, 0
	b	.L781
.L791:
	ldr	x1, .LC127
	ldr	x4, [x1]
	cbz	x4, .L780
	ldr	w0, [x0, 2792]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 22
	blr	x4
.L780:
	ldr	x2, .LC129
	mov	w1, 2744
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L781
	.size	H263_Combine_HdPacket, .-H263_Combine_HdPacket
	.align	3
.LC127:
	.xword	g_EventReportFunc
	.align	3
.LC129:
	.xword	.LC128
	.align	3
.LC130:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC131:
	.xword	.LC45
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263_Renew_CurPacket
	.type	H263_Renew_CurPacket, %function
H263_Renew_CurPacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x20
	bl	H263_Combine_HdPacket
	cmn	w0, #1
	mov	w19, w0
	beq	.L798
	mov	x0, x20
	add	x20, x20, 20480
	add	x19, x0, 12288
	bl	H263_Record_PacketID
	ldr	x21, .LC134
	mov	x2, 176
	add	x1, x20, 1632
	add	x0, x19, 3376
	ldr	x3, [x21, 104]
	blr	x3
	ldr	x3, [x21, 104]
	mov	x2, 4
	add	x1, x20, 1808
	add	x0, x19, 3456
	blr	x3
	mov	w0, 0
.L797:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L798:
	add	x0, x20, 20480
	add	x1, x20, 12288
	add	x1, x1, 3376
	ldr	w0, [x0, 2792]
	bl	H263_ClearCurPacket
	mov	w3, 2800
	ldr	x2, .LC133
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w0, w19
	b	.L797
	.size	H263_Renew_CurPacket, .-H263_Renew_CurPacket
	.align	3
.LC133:
	.xword	.LC132
	.align	3
.LC134:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263DEC_GetImageWidth
	.type	H263DEC_GetImageWidth, %function
H263DEC_GetImageWidth:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 20480
	bl	_mcount
	ldr	w0, [x19, 1488]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H263DEC_GetImageWidth, .-H263DEC_GetImageWidth
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H263DEC_GetImageHeight
	.type	H263DEC_GetImageHeight, %function
H263DEC_GetImageHeight:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 20480
	bl	_mcount
	ldr	w0, [x19, 1484]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H263DEC_GetImageHeight, .-H263DEC_GetImageHeight
	.global	h263_default_inter_matrix
	.global	h263_default_intra_matrix
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	h263_default_intra_matrix, %object
	.size	h263_default_intra_matrix, 256
h263_default_intra_matrix:
	.word	8
	.word	17
	.word	18
	.word	19
	.word	21
	.word	23
	.word	25
	.word	27
	.word	17
	.word	18
	.word	19
	.word	21
	.word	23
	.word	25
	.word	27
	.word	28
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	26
	.word	28
	.word	30
	.word	21
	.word	22
	.word	23
	.word	24
	.word	26
	.word	28
	.word	30
	.word	32
	.word	22
	.word	23
	.word	24
	.word	26
	.word	28
	.word	30
	.word	32
	.word	35
	.word	23
	.word	24
	.word	26
	.word	28
	.word	30
	.word	32
	.word	35
	.word	38
	.word	25
	.word	26
	.word	28
	.word	30
	.word	32
	.word	35
	.word	38
	.word	41
	.word	27
	.word	28
	.word	30
	.word	32
	.word	35
	.word	38
	.word	41
	.word	45
	.type	h263_default_inter_matrix, %object
	.size	h263_default_inter_matrix, 256
h263_default_inter_matrix:
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	26
	.word	27
	.word	20
	.word	21
	.word	22
	.word	23
	.word	25
	.word	26
	.word	27
	.word	28
	.word	21
	.word	22
	.word	23
	.word	24
	.word	26
	.word	27
	.word	28
	.word	30
	.word	22
	.word	23
	.word	24
	.word	26
	.word	27
	.word	28
	.word	30
	.word	31
	.word	23
	.word	24
	.word	25
	.word	27
	.word	28
	.word	30
	.word	31
	.word	33
	.type	__func__.10003, %object
	.size	__func__.10003, 16
__func__.10003:
	.string	"H263_Frame_Init"
	.type	__FUNCTION__.10045, %object
	.size	__FUNCTION__.10045, 16
__FUNCTION__.10045:
	.string	"H263_Set_DecPar"
	.type	__func__.10090, %object
	.size	__func__.10090, 21
__func__.10090:
	.string	"H263DEC_RecycleImage"
	.align	3
.LANCHOR1 = . + 0
	.type	__FUNCTION__.10176, %object
	.size	__FUNCTION__.10176, 24
__FUNCTION__.10176:
	.string	"H263_Syntax_Slice_NotSH"
	.type	__FUNCTION__.10190, %object
	.size	__FUNCTION__.10190, 21
__FUNCTION__.10190:
	.string	"H263_Syntax_Slice_SH"
	.zero	3
	.type	__FUNCTION__.10203, %object
	.size	__FUNCTION__.10203, 15
__FUNCTION__.10203:
	.string	"H263_Dec_Slice"
	.zero	1
	.type	__FUNCTION__.10083, %object
	.size	__FUNCTION__.10083, 15
__FUNCTION__.10083:
	.string	"H263DEC_Decode"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC11:
	ASCII(.string	"%s arrange fs pool failed!\n" )
	.zero	4
.LC13:
	ASCII(.string	"Chan:%d dec_pts: %lld Usertag: %lld\n" )
	.zero	3
.LC16:
	ASCII(.string	"h263 coding type %d get frame store failed!\n" )
	.zero	3
.LC22:
	ASCII(.string	"%s %d  abnormal!\n" )
	.zero	6
.LC24:
	ASCII(.string	"CurFsID(fwd%d,%d,bwd%d) abnormal!(%p,%p)\n" )
	.zero	6
.LC26:
	ASCII(.string	"H263DEC Init  -----\n" )
	.zero	3
.LC29:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC31:
	ASCII(.string	"H263DEC Init success -----\n" )
	.zero	4
.LC33:
	ASCII(.string	"H263 destroy\n" )
	.zero	2
.LC36:
	ASCII(.string	"%s pCtx = NULL\n" )
.LC41:
	ASCII(.string	"vop_coding_type = %d is not expected!\n" )
	.zero	1
.LC43:
	ASCII(.string	" slice num %d is not extpected!\n" )
	.zero	7
.LC45:
	ASCII(.string	" line %d packet is wrong!\n" )
	.zero	5
.LC49:
	ASCII(.string	"pImg is null, pCurImg %#x pBwdImg %#x\n" )
	.zero	1
.LC52:
	ASCII(.string	"line: %d pToQueImg is null!\n" )
	.zero	3
.LC54:
	ASCII(.string	"CurImage %d is already out put\n" )
.LC56:
	ASCII(.string	"err(%d) > out_thr(%d)\n" )
	.zero	1
.LC58:
	ASCII(.string	"StreamIDNum = %d > (%d)\n" )
	.zero	7
.LC60:
	ASCII(.string	"Warning : vop slice num %d != 0\n" )
	.zero	7
.LC66:
	ASCII(.string	"warning streamIDNum %d != 0 \n" )
	.zero	2
.LC74:
	ASCII(.string	"FUN: %s Invalid SlcNum = %d\n" )
	.zero	3
.LC76:
	ASCII(.string	" pSlcPara->mb_start_num = %d, MbCnt = %d\n" )
	.zero	6
.LC80:
	ASCII(.string	"pSlcPara->mb_start_num = %d, totalMbMin1 = %d\n" )
	.zero	1
.LC83:
	ASCII(.string	"FUN: %s H263_ClearCurPacket\n" )
	.zero	3
.LC86:
	ASCII(.string	"pCtx is NUL!!!\n" )
.LC91:
	ASCII(.string	"SHVOP beginning ~ !\n" )
	.zero	3
.LC93:
	ASCII(.string	"H263 Frame_Init return err 3!\n" )
	.zero	1
.LC95:
	ASCII(.string	"H263 Frame_Init return err 1!\n" )
	.zero	1
.LC97:
	ASCII(.string	"vop right\n" )
	.zero	5
.LC100:
	ASCII(.string	"H263 Frame_Init return err 2!\n" )
	.zero	1
.LC102:
	ASCII(.string	"bits over boundary\n" )
	.zero	4
.LC104:
	ASCII(.string	"bitsream para error -----\n" )
	.zero	5
.LC107:
	ASCII(.string	"H263_Check_CurPacket failed!\n" )
	.zero	2
.LC109:
	ASCII(.string	"H263_Frame_Atr return fail\n" )
	.zero	4
.LC112:
	ASCII(.string	"fuction return value is null, %s %d!!\n" )
	.zero	1
.LC114:
	ASCII(.string	"fuction return value is null,%s %d!!\n" )
	.zero	2
.LC116:
	ASCII(.string	"dec P/S frame, fwd ref err(%d) > ref_thr(%d)\n" )
	.zero	2
.LC118:
	ASCII(.string	"dec B frame, bwd ref err(%d) > ref_thr(%d)\n" )
	.zero	4
.LC120:
	ASCII(.string	"H263_PrepareNvopDecparam not expect nvop failed.\n" )
	.zero	6
.LC123:
	ASCII(.string	"bits not enought\n" )
	.zero	6
.LC125:
	ASCII(.string	"dec B frame, fwd ref err(%d) > ref_thr(%d)\n" )
	.zero	4
.LC128:
	ASCII(.string	"pLastPacket->StreamPack[0].VirAddr is NULL!!\n" )
	.zero	2
.LC132:
	ASCII(.string	"line %d H263_Combine_HdPacket failed!!\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
