#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vp8.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	VP8_init_frame.part.0, %function
VP8_init_frame.part.0:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC0
	ldr	x21, .LC1
	mov	x2, 38
	add	x0, x19, 2374
	ldr	x3, [x20, 104]
	mov	x1, x21
	blr	x3
	ldr	x3, [x20, 104]
	add	x1, x21, 40
	mov	x2, 1056
	add	x0, x19, 1318
	blr	x3
	ldr	x21, .LC2
	ldr	x3, [x20, 104]
	mov	x2, 4
	mov	x1, x21
	add	x0, x19, 1310
	blr	x3
	ldr	x3, [x20, 104]
	add	x1, x21, 8
	mov	x2, 3
	add	x0, x19, 1314
	blr	x3
	ldr	x3, [x20, 96]
	mov	x2, 8
	mov	w1, 0
	add	x0, x19, 22
	blr	x3
	strb	wzr, [x19, 17]
	mov	x2, 4
	mov	w1, 0
	ldr	x3, [x20, 96]
	add	x0, x19, 32
	blr	x3
	ldr	x3, [x20, 96]
	mov	x2, 4
	mov	w1, 0
	add	x0, x19, 36
	blr	x3
	strb	wzr, [x19, 43]
	strb	wzr, [x19, 44]
	mov	w0, 1
	strb	wzr, [x19, 48]
	strb	w0, [x19, 41]
	strb	w0, [x19, 42]
	strb	wzr, [x19, 49]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VP8_init_frame.part.0, .-VP8_init_frame.part.0
	.align	3
.LC0:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1:
	.xword	.LANCHOR0
	.align	3
.LC2:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Vp8_Vfmw_StartBoolDecode
	.type	Vp8_Vfmw_StartBoolDecode, %function
Vp8_Vfmw_StartBoolDecode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	mov	w1, 255
	mov	w0, 16
	str	w1, [x19]
	mov	w1, 24
	str	w0, [x19, 8]
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 4]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	Vp8_Vfmw_StartBoolDecode, .-Vp8_Vfmw_StartBoolDecode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Vp8_Vfmw_DecodeBool
	.type	Vp8_Vfmw_DecodeBool, %function
Vp8_Vfmw_DecodeBool:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	uxtb	w19, w2
	mov	x23, x1
	bl	_mcount
	mov	w24, 0
	ldp	w3, w0, [x22]
	ldr	w25, [x22, 8]
	sub	w1, w3, #1
	mul	w1, w1, w19
	lsr	w1, w1, 8
	add	w1, w1, 1
	lsl	w2, w1, 16
	cmp	w0, w2
	bcc	.L4
	sub	w1, w3, w1
	sub	w0, w0, w2
	mov	w24, 1
.L4:
	ldr	x2, .LC3
	add	x2, x2, 1096
	ldrb	w20, [x2, w1, uxtw]
	subs	w25, w25, w20
	lsl	w21, w1, w20
	lsl	w20, w0, w20
	bmi	.L10
.L5:
	stp	w21, w20, [x22]
	str	w25, [x22, 8]
	mov	w0, w24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L10:
	mov	w0, 8
	subs	w26, w0, w25
	bmi	.L5
	mov	w19, w26
	.p2align 2
.L6:
	mov	w1, 8
	mov	x0, x23
	bl	BsGet
	lsl	w0, w0, w19
	subs	w19, w19, #8
	orr	w20, w20, w0
	bpl	.L6
	add	w25, w25, 8
	and	w0, w26, -8
	add	w25, w0, w25
	b	.L5
	.size	Vp8_Vfmw_DecodeBool, .-Vp8_Vfmw_DecodeBool
	.align	3
.LC3:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Vp8_Vfmw_DecodeValue
	.type	Vp8_Vfmw_DecodeValue, %function
Vp8_Vfmw_DecodeValue:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w19, w2
	mov	x22, x1
	bl	_mcount
	mov	w20, 0
	subs	w19, w19, #1
	bmi	.L12
	.p2align 2
.L13:
	mov	w2, -128
	mov	x1, x22
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	lsl	w0, w0, w19
	sub	w19, w19, #1
	orr	w20, w0, w20
	cmn	w19, #1
	bne	.L13
.L12:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	Vp8_Vfmw_DecodeValue, .-Vp8_Vfmw_DecodeValue
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP8_SetImgFormat
	.type	VP8_SetImgFormat, %function
VP8_SetImgFormat:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 3240
	bl	_mcount
	ldr	w1, [x19, 8192]
	ldr	w0, [x19, 8816]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L16
	ldr	w2, [x20, 4956]
	mov	w5, 5
	ldrb	w3, [x0, 156]
	mov	w4, 1
	ldrb	w1, [x0, 157]
	bfi	w3, w2, 0, 2
	and	w2, w2, 3
	and	w1, w1, -4
	and	w3, w3, -29
	orr	w1, w1, 12
	bfi	w3, w5, 5, 3
	bfi	w1, w4, 4, 2
	strb	w3, [x0, 156]
	strb	w1, [x0, 157]
	mov	w1, 0
	stp	w2, w2, [x0, 24]
	ldr	w3, [x0, 156]
	and	w2, w3, -114689
	str	w2, [x0, 156]
	bl	SetAspectRatio
	ldp	w1, w0, [x19, 32]
	lsr	w1, w1, 1
	lsr	w0, w0, 1
	stp	w1, w0, [x19, 48]
.L16:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VP8_SetImgFormat, .-VP8_SetImgFormat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP8DEC_VDMPostProc
	.type	VP8DEC_VDMPostProc, %function
VP8DEC_VDMPostProc:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	w21, w1
	add	x19, x20, 3240
	bl	_mcount
	mov	w0, 13
	mov	x1, x20
	bl	ReleasePacket
	ldr	w0, [x19, 4916]
	cmp	w0, 2
	beq	.L88
.L22:
	ldr	w0, [x20, 3308]
	cmp	w0, wzr
	cset	w23, eq
.L23:
	ldr	w1, [x19, 4952]
	ldr	w0, [x20, 8816]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L89
	tbnz	w21, #31, .L26
	cmp	w21, 100
	mov	w3, 100
	csel	w3, w21, w3, le
	str	w3, [x0, 96]
	ldr	x0, [x20]
	ldr	w4, [x0]
	cmp	w3, w4
	bhi	.L90
.L27:
	mov	x0, x20
	bl	VP8_SetImgFormat
	cbz	w23, .L91
.L28:
	ldr	w0, [x19, 4920]
	add	x21, x20, 3248
	ldr	w1, [x19, 4956]
	add	w0, w0, 1
	str	w0, [x19, 4920]
	ldr	w22, [x19, 4948]
	cbnz	w1, .L92
	ldr	w0, [x19, 4940]
	cmp	w22, w0
	beq	.L34
.L32:
	ldr	w0, [x19, 4944]
	cmp	w22, w0
	beq	.L34
	ldr	w1, [x19, 4952]
	cmp	w22, w1
	cset	w24, ne
.L33:
	str	w1, [x19, 4948]
	mov	w2, 1
	ldr	w0, [x20, 8816]
	bl	FSP_SetRef
.L31:
	ldrb	w0, [x21, 44]
	cmp	w0, 1
	beq	.L93
	cmp	w0, 2
	beq	.L94
.L37:
	ldrb	w0, [x21, 43]
	cmp	w0, 1
	beq	.L95
	cmp	w0, 2
	beq	.L96
.L42:
	ldr	w0, [x19, 4956]
	cbz	w0, .L45
	ldrb	w0, [x21, 41]
	cbz	w0, .L46
.L45:
	ldr	w3, [x19, 4940]
	ldr	w0, [x19, 4948]
	cmp	w3, w0
	beq	.L86
	ldr	w0, [x19, 4944]
	cmp	w3, w0
	beq	.L86
	ldr	w1, [x19, 4952]
	cmp	w3, w1
	beq	.L48
	ldr	w0, [x20, 8816]
	mov	w2, 0
	mov	w1, w3
	bl	FSP_SetRef
.L86:
	ldr	w1, [x19, 4952]
.L48:
	str	w1, [x19, 4940]
	mov	w2, 1
	ldr	w0, [x20, 8816]
	bl	FSP_SetRef
.L46:
	ldr	w0, [x21, 56]
	cbz	w0, .L50
	ldrb	w0, [x21, 42]
	cbz	w0, .L51
.L50:
	ldr	w3, [x19, 4944]
	ldr	w0, [x19, 4948]
	cmp	w3, w0
	beq	.L87
	ldr	w0, [x19, 4940]
	cmp	w3, w0
	beq	.L87
	ldr	w1, [x19, 4952]
	cmp	w3, w1
	beq	.L53
	ldr	w0, [x20, 8816]
	mov	w2, 0
	mov	w1, w3
	bl	FSP_SetRef
.L87:
	ldr	w1, [x19, 4952]
.L53:
	str	w1, [x19, 4944]
	mov	w2, 1
	ldr	w0, [x20, 8816]
	bl	FSP_SetRef
.L51:
	cbnz	w24, .L97
.L55:
	mov	w21, 1
	cbz	w23, .L75
	ldr	w1, [x19, 4952]
	mov	w2, 0
	ldr	w0, [x20, 8816]
	bl	FSP_SetDisplay
.L75:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L92:
	ldrb	w0, [x21, 40]
	mov	w24, 0
	cbz	w0, .L31
	ldr	w0, [x19, 4940]
	cmp	w22, w0
	bne	.L32
	.p2align 2
.L34:
	mov	w24, 0
	ldr	w1, [x19, 4952]
	b	.L33
	.p2align 3
.L88:
	ldr	w0, [x19, 4956]
	mov	w23, 1
	cbnz	w0, .L23
	b	.L22
	.p2align 3
.L91:
	ldr	w1, [x19, 4952]
	ldr	w0, [x20, 8816]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L98
	ldr	w1, [x19, 4952]
	mov	w2, 1
	ldr	w0, [x20, 8816]
	bl	FSP_SetDisplay
	add	x3, x20, 8192
	ldr	w0, [x20, 8816]
	mov	x4, x22
	add	x3, x3, 16
	mov	x2, x20
	mov	w1, 13
	bl	InsertImgToVoQueue
	cmp	w0, 1
	mov	w21, w0
	beq	.L28
	ldr	w0, [x20, 8816]
	ldr	x1, [x22, 168]
	bl	FreeUsdByDec
	str	xzr, [x22, 168]
	ldr	x1, [x22, 176]
	ldr	w0, [x20, 8816]
	bl	FreeUsdByDec
	str	xzr, [x22, 176]
	mov	w2, 0
	ldr	w1, [x19, 4952]
	ldr	w0, [x20, 8816]
	bl	FSP_SetDisplay
	ldr	x2, .LC12
	mov	w1, 587
	mov	w0, 0
	bl	dprint_normal
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L26:
	str	wzr, [x0, 96]
	b	.L27
	.p2align 3
.L95:
	ldr	w1, [x19, 4940]
	ldr	w0, [x19, 4948]
	cmp	w1, w0
	beq	.L41
	ldr	w0, [x19, 4944]
	cmp	w0, w1
	ccmp	w22, w1, 4, ne
	beq	.L41
	ldr	w0, [x20, 8816]
	mov	w2, 0
	bl	FSP_SetRef
.L41:
	str	w22, [x19, 4940]
	mov	w2, 1
	mov	w1, w22
	mov	w24, 0
	ldr	w0, [x20, 8816]
	bl	FSP_SetRef
	b	.L42
	.p2align 3
.L93:
	ldr	w1, [x19, 4944]
	ldr	w0, [x19, 4948]
	cmp	w1, w0
	beq	.L36
	ldr	w0, [x19, 4940]
	cmp	w0, w1
	ccmp	w22, w1, 4, ne
	beq	.L36
	ldr	w0, [x20, 8816]
	mov	w2, 0
	bl	FSP_SetRef
.L36:
	str	w22, [x19, 4944]
	mov	w2, 1
	mov	w1, w22
	mov	w24, 0
	ldr	w0, [x20, 8816]
	bl	FSP_SetRef
	b	.L37
	.p2align 3
.L96:
	ldr	w3, [x19, 4940]
	ldr	w0, [x19, 4948]
	ldr	w1, [x19, 4944]
	cmp	w3, w0
	beq	.L44
	cmp	w3, w1
	beq	.L44
	ldr	w0, [x20, 8816]
	mov	w1, w3
	mov	w2, 0
	bl	FSP_SetRef
	ldr	w1, [x19, 4944]
.L44:
	str	w1, [x19, 4940]
	mov	w2, 1
	ldr	w0, [x20, 8816]
	bl	FSP_SetRef
	b	.L42
	.p2align 3
.L94:
	ldr	w3, [x19, 4944]
	ldr	w0, [x19, 4948]
	ldr	w1, [x19, 4940]
	cmp	w3, w0
	beq	.L39
	cmp	w3, w1
	beq	.L39
	ldr	w0, [x20, 8816]
	mov	w1, w3
	mov	w2, 0
	bl	FSP_SetRef
	ldr	w1, [x19, 4940]
.L39:
	str	w1, [x19, 4944]
	mov	w2, 1
	ldr	w0, [x20, 8816]
	bl	FSP_SetRef
	b	.L37
	.p2align 3
.L97:
	ldr	w0, [x20, 8816]
	mov	w2, 0
	mov	w1, w22
	bl	FSP_SetRef
	b	.L55
	.p2align 3
.L90:
	ldr	x2, .LC8
	mov	w1, 557
	mov	w0, 1
	mov	w21, -1
	bl	dprint_normal
	ldr	w1, [x19, 4940]
	ldr	w0, [x20, 8816]
	bl	FSP_ClearLogicFs
	ldr	w1, [x19, 4944]
	ldr	w0, [x20, 8816]
	bl	FSP_ClearLogicFs
	ldr	w1, [x19, 4948]
	ldr	w0, [x20, 8816]
	bl	FSP_ClearLogicFs
	ldr	w0, [x20, 8816]
	bl	FSP_GetNullLogicFs
	str	wzr, [x19, 4920]
	str	w0, [x19, 4940]
	str	w0, [x19, 4944]
	str	w0, [x19, 4948]
	b	.L75
.L89:
	ldr	x2, .LC6
	mov	w1, 549
	mov	w21, -1
	bl	dprint_normal
	b	.L75
.L98:
	mov	w3, 572
	ldr	x2, .LC10
	mov	w1, w3
	mov	w0, 0
	mov	w21, -1
	bl	dprint_normal
	b	.L75
	.size	VP8DEC_VDMPostProc, .-VP8DEC_VDMPostProc
	.align	3
.LC6:
	.xword	.LC5
	.align	3
.LC8:
	.xword	.LC7
	.align	3
.LC10:
	.xword	.LC9
	.align	3
.LC12:
	.xword	.LC11
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP8DEC_Init
	.type	VP8DEC_Init, %function
VP8DEC_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x3, .LC13
	mov	x2, 8832
	mov	w1, 0
	mov	x0, x19
	ldr	w21, [x19, 8808]
	ldr	x3, [x3, 96]
	blr	x3
	str	w21, [x19, 8808]
	add	x0, x19, 8192
	add	x0, x0, 16
	bl	ResetVoQueue
	mov	x0, x19
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x19, 8816]
	beq	.L102
	mov	w2, 3
	str	x20, [x19]
	str	wzr, [x19, 8164]
	mov	w3, 1024
	str	w2, [x19, 8168]
	mov	w0, 1
	str	w3, [x19, 8152]
	str	wzr, [x19, 8172]
	str	w2, [x19, 8200]
	ldr	w2, [x20, 8]
	str	w2, [x19, 8156]
	ldr	w2, [x20, 20]
	str	w2, [x19, 8176]
.L101:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L102:
	ldr	x3, .LC14
	mov	w1, 708
	ldr	x2, .LC16
	mov	w0, 0
	add	x3, x3, 1352
	bl	dprint_normal
	mov	w0, -20
	b	.L101
	.size	VP8DEC_Init, .-VP8DEC_Init
	.align	3
.LC13:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC14:
	.xword	.LANCHOR0
	.align	3
.LC16:
	.xword	.LC15
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP8_setup_version
	.type	VP8_setup_version, %function
VP8_setup_version:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 64]
	cmp	w0, 3
	bls	.L113
.L104:
	stp	wzr, wzr, [x19, 76]
	stp	wzr, wzr, [x19, 84]
	str	wzr, [x19, 92]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L113:
	ldr	x1, .LC17
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx106
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx106:
	.section	.rodata
	.align	0
	.align	2
.L106:
	.byte	(.L104 - .Lrtx106) / 4
	.byte	(.L107 - .Lrtx106) / 4
	.byte	(.L108 - .Lrtx106) / 4
	.byte	(.L109 - .Lrtx106) / 4
	.text
	.p2align 3
.L108:
	mov	w0, 1
	stp	w0, wzr, [x19, 76]
	stp	w0, wzr, [x19, 84]
.L111:
	mov	w0, 1
	str	w0, [x19, 92]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L107:
	mov	w0, 1
	stp	wzr, w0, [x19, 76]
	stp	w0, wzr, [x19, 84]
	b	.L111
	.p2align 3
.L109:
	mov	w0, 1
	stp	w0, w0, [x19, 76]
	stp	w0, w0, [x19, 84]
	b	.L111
	.size	VP8_setup_version, .-VP8_setup_version
	.align	3
.LC17:
	.xword	.L106
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	read_mvcontexts
	.type	read_mvcontexts, %function
read_mvcontexts:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x23, x0
	mov	x0, x30
	mov	x22, x1
	mov	x28, x2
	bl	_mcount
	ldr	x27, .LC20
	mov	x26, 0
.L119:
	add	x24, x27, x26
	add	x25, x28, x26
	mov	x21, 0
	.p2align 2
.L118:
	ldrb	w2, [x24, x21]
	mov	x1, x22
	mov	x0, x23
	bl	Vp8_Vfmw_DecodeBool
	cbz	w0, .L115
	mov	w20, 0
	mov	w19, 6
	.p2align 2
.L116:
	mov	w2, -128
	mov	x1, x22
	mov	x0, x23
	bl	Vp8_Vfmw_DecodeBool
	lsl	w0, w0, w19
	sub	w19, w19, #1
	orr	w20, w0, w20
	cmn	w19, #1
	bne	.L116
	uxtb	w20, w20
	mov	w0, 1
	ubfiz	w1, w20, 1, 7
	cmp	w20, wzr
	csel	w0, w1, w0, ne
	strb	w0, [x25, x21]
.L115:
	add	x21, x21, 1
	cmp	x21, 19
	bne	.L118
	add	x26, x26, 19
	cmp	x26, 38
	bne	.L119
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.size	read_mvcontexts, .-read_mvcontexts
	.align	3
.LC20:
	.xword	.LANCHOR2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP8_mb_mode_mv_init
	.type	VP8_mb_mode_mv_init, %function
VP8_mb_mode_mv_init:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x23, x0
	mov	x0, x30
	mov	x19, x1
	mov	x20, x2
	bl	_mcount
	ldr	w0, [x23, 56]
	cbz	w0, .L128
	mov	w22, 0
	mov	w21, 7
	.p2align 2
.L130:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x19
	bl	Vp8_Vfmw_DecodeBool
	lsl	w0, w0, w21
	sub	w21, w21, #1
	orr	w22, w0, w22
	cmn	w21, #1
	bne	.L130
	strb	w22, [x23, 50]
	mov	w21, 7
	mov	w22, 0
	.p2align 2
.L131:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x19
	bl	Vp8_Vfmw_DecodeBool
	lsl	w0, w0, w21
	sub	w21, w21, #1
	orr	w22, w0, w22
	cmn	w21, #1
	bne	.L131
	strb	w22, [x23, 51]
	mov	w21, 7
	mov	w22, 0
	.p2align 2
.L132:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x19
	bl	Vp8_Vfmw_DecodeBool
	lsl	w0, w0, w21
	sub	w21, w21, #1
	orr	w22, w0, w22
	cmn	w21, #1
	bne	.L132
	strb	w22, [x23, 52]
	mov	w2, -128
	mov	x1, x20
	mov	x0, x19
	bl	Vp8_Vfmw_DecodeBool
	cmp	w0, 1
	beq	.L133
	mov	w2, -128
	mov	x1, x20
	mov	x0, x19
	bl	Vp8_Vfmw_DecodeBool
	cbz	w0, .L135
.L134:
	add	x24, x23, 1314
	add	x25, x23, 1317
.L140:
	mov	w22, 0
	mov	w21, 7
	.p2align 2
.L139:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x19
	bl	Vp8_Vfmw_DecodeBool
	lsl	w0, w0, w21
	sub	w21, w21, #1
	orr	w22, w0, w22
	cmn	w21, #1
	bne	.L139
	strb	w22, [x24], 1
	cmp	x25, x24
	bne	.L140
.L135:
	add	x2, x23, 2374
	mov	x1, x20
	mov	x0, x19
	bl	read_mvcontexts
.L128:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L133:
	add	x24, x23, 1310
	add	x25, x23, 1314
.L137:
	mov	w22, 0
	mov	w21, 7
	.p2align 2
.L136:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x19
	bl	Vp8_Vfmw_DecodeBool
	lsl	w0, w0, w21
	sub	w21, w21, #1
	orr	w22, w0, w22
	cmn	w21, #1
	bne	.L136
	strb	w22, [x24], 1
	cmp	x24, x25
	bne	.L137
	mov	w2, -128
	mov	x1, x20
	mov	x0, x19
	bl	Vp8_Vfmw_DecodeBool
	cbnz	w0, .L134
	b	.L135
	.size	VP8_mb_mode_mv_init, .-VP8_mb_mode_mv_init
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	get_delta_q
	.type	get_delta_q, %function
get_delta_q:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x22, x1
	mov	w23, w2
	mov	x24, x3
	bl	_mcount
	mov	w2, -128
	mov	x1, x22
	mov	x0, x21
	mov	w19, 0
	bl	Vp8_Vfmw_DecodeBool
	cbz	w0, .L152
	mov	w20, 3
.L153:
	mov	w2, -128
	mov	x1, x22
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	lsl	w0, w0, w20
	sub	w20, w20, #1
	orr	w19, w0, w19
	cmn	w20, #1
	bne	.L153
	mov	w2, -128
	mov	x1, x22
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	cmp	w0, wzr
	csneg	w19, w19, w19, eq
.L152:
	cmp	w19, w23
	beq	.L154
	mov	w0, 1
	str	w0, [x24]
.L154:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	get_delta_q, .-get_delta_q
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP8_init_frame
	.type	VP8_init_frame, %function
VP8_init_frame:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 56]
	cbnz	w0, .L160
	mov	x0, x19
	bl	VP8_init_frame.part.0
.L160:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VP8_init_frame, .-VP8_init_frame
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP8_GetPictureHeader
	.type	VP8_GetPictureHeader, %function
VP8_GetPictureHeader:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	x27, x1
	mov	w23, w2
	bl	_mcount
	add	x25, x27, 2460
	mov	w2, 7
	mov	w1, 8
	str	w2, [x29, 136]
	mov	x0, x20
	mov	w2, 6
	str	w2, [x29, 140]
	bl	BsGet
	mov	w19, w0
	mov	w1, 8
	mov	x0, x20
	uxtb	w21, w19
	bl	BsGet
	mov	w22, w0
	mov	w1, 8
	mov	x0, x20
	ubfiz	w22, w22, 8, 8
	bl	BsGet
	ubfiz	w0, w0, 16, 8
	and	w1, w19, 1
	orr	w0, w22, w0
	and	w19, w19, 255
	str	w1, [x25, 56]
	orr	w0, w0, w19
	str	w1, [x27, 4956]
	asr	w0, w0, 5
	ubfx	x1, x21, 1, 3
	cmp	w0, w23
	ubfx	x21, x21, 4, 1
	str	w0, [x25, 68]
	stp	w21, w1, [x25, 60]
	bhi	.L257
	mov	x0, x25
	bl	VP8_setup_version
	ldr	w0, [x25, 56]
	cbz	w0, .L258
.L166:
	add	x21, x27, 2600
	mov	w0, 255
	str	w0, [x27, 2600]
	mov	w2, 16
	mov	w1, 24
	mov	x0, x20
	str	w2, [x21, 8]
	bl	BsGet
	str	w0, [x21, 4]
	ldr	w0, [x25, 56]
	cbz	w0, .L259
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	uxtb	w0, w0
	strb	w0, [x25, 14]
	cbnz	w0, .L170
.L178:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	mov	w22, 0
	mov	w19, 5
	bl	Vp8_Vfmw_DecodeBool
	str	w0, [x25, 136]
.L171:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	lsl	w0, w0, w19
	sub	w19, w19, #1
	orr	w22, w0, w22
	cmn	w19, #1
	bne	.L171
	strb	w22, [x25, 10]
	mov	w19, 2
	mov	w22, 0
.L182:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	lsl	w0, w0, w19
	sub	w19, w19, #1
	orr	w22, w0, w22
	cmn	w19, #1
	bne	.L182
	strb	w22, [x25, 11]
	mov	w2, -128
	strb	wzr, [x25, 1]
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	uxtb	w0, w0
	strb	w0, [x25, 2]
	cbnz	w0, .L183
.L185:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	mov	w22, 0
	mov	w19, 6
	bl	Vp8_Vfmw_DecodeBool
	mov	w23, w0
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	orr	w0, w0, w23, lsl 1
	strb	w0, [x25, 13]
.L184:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	lsl	w0, w0, w19
	sub	w19, w19, #1
	orr	w22, w0, w22
	cmn	w19, #1
	bne	.L184
	add	x19, x29, 144
	ldrsb	w2, [x25, 5]
	mov	x1, x20
	strb	w22, [x25, 3]
	mov	x0, x21
	str	wzr, [x19, -12]!
	mov	x3, x19
	bl	get_delta_q
	strb	w0, [x25, 5]
	ldrsb	w2, [x25, 6]
	mov	x3, x19
	mov	x1, x20
	mov	x0, x21
	bl	get_delta_q
	strb	w0, [x25, 6]
	ldrsb	w2, [x25, 7]
	mov	x3, x19
	mov	x1, x20
	mov	x0, x21
	bl	get_delta_q
	strb	w0, [x25, 7]
	ldrsb	w2, [x25, 8]
	mov	x3, x19
	mov	x1, x20
	mov	x0, x21
	bl	get_delta_q
	strb	w0, [x25, 8]
	ldrsb	w2, [x25, 9]
	mov	x1, x20
	mov	x3, x19
	mov	x0, x21
	bl	get_delta_q
	strb	w0, [x25, 9]
	ldr	w1, [x25, 56]
	cbnz	w1, .L260
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	uxtb	w0, w0
	strb	w0, [x25, 45]
	cbz	w0, .L261
.L199:
	ldr	w0, [x25, 56]
	cbnz	w0, .L200
.L263:
	mov	w0, 1
	strb	w0, [x25, 40]
.L201:
	ldr	x28, .LC29
	add	x0, x27, 1056
	mov	w2, 255
	str	x0, [x29, 104]
	str	x27, [x29, 112]
	add	x0, x28, 304
	str	x0, [x29, 120]
.L202:
	ldp	x26, x0, [x29, 112]
	sub	x24, x0, #231
	.p2align 2
.L211:
	sub	x22, x24, #33
	mov	x23, x26
.L209:
	mov	x19, 0
	b	.L207
	.p2align 3
.L203:
	add	x19, x19, 1
	cmp	x19, 11
	beq	.L262
.L205:
	ldrb	w2, [x22, x19]
.L207:
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	cmp	w0, 1
	bne	.L203
	mov	w27, 0
	mov	w28, 7
	.p2align 2
.L204:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	lsl	w0, w0, w28
	sub	w28, w28, #1
	orr	w27, w0, w27
	cmn	w28, #1
	bne	.L204
	add	x0, x23, x19
	add	x19, x19, 1
	cmp	x19, 11
	strb	w27, [x0, 3778]
	bne	.L205
.L262:
	add	x22, x22, 11
	add	x23, x23, 11
	cmp	x22, x24
	beq	.L206
	ldrb	w2, [x22]
	b	.L209
.L261:
	ldr	x3, .LC28
	mov	x2, 1149
	add	x1, x27, 3761
	add	x0, x27, 2612
	ldr	x3, [x3, 104]
	blr	x3
	ldr	w0, [x25, 56]
	cbz	w0, .L263
	b	.L200
	.p2align 3
.L260:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	strb	w0, [x25, 41]
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	strb	wzr, [x25, 43]
	ldrb	w2, [x25, 41]
	uxtb	w1, w0
	strb	w1, [x25, 42]
	cbnz	w2, .L197
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	mov	w19, w0
	mov	x1, x20
	mov	w2, -128
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	orr	w0, w0, w19, lsl 1
	ldrb	w1, [x25, 42]
	strb	w0, [x25, 43]
.L197:
	strb	wzr, [x25, 44]
	cbnz	w1, .L198
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	mov	w19, w0
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	orr	w0, w0, w19, lsl 1
	strb	w0, [x25, 44]
.L198:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	strb	w0, [x25, 48]
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	strb	w0, [x25, 49]
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	uxtb	w0, w0
	strb	w0, [x25, 45]
	cbnz	w0, .L199
	b	.L261
	.p2align 3
.L183:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	uxtb	w0, w0
	strb	w0, [x25, 1]
	cbz	w0, .L185
	add	x22, x27, 2492
	add	x19, x27, 2496
	b	.L190
.L187:
	add	x22, x22, 1
	cmp	x19, x22
	beq	.L264
.L190:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x25, 30]
	bne	.L187
	mov	w24, 0
	mov	w23, 5
.L188:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	lsl	w0, w0, w23
	sub	w23, w23, #1
	orr	w24, w0, w24
	cmn	w23, #1
	bne	.L188
	strb	w24, [x22]
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x25, 12]
	bne	.L187
	ldrb	w0, [x22]
	add	x22, x22, 1
	neg	w0, w0
	strb	w0, [x22, -1]
	cmp	x19, x22
	bne	.L190
.L264:
	add	x24, x27, 2500
	b	.L195
	.p2align 3
.L192:
	add	x19, x19, 1
	cmp	x24, x19
	beq	.L185
.L195:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x25, 31]
	bne	.L192
	mov	w23, 0
	mov	w22, 5
.L193:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	lsl	w0, w0, w22
	sub	w22, w22, #1
	orr	w23, w0, w23
	cmn	w22, #1
	bne	.L193
	strb	w23, [x19]
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	cbz	w0, .L192
	ldrb	w0, [x19]
	neg	w0, w0
	strb	w0, [x19]
	b	.L192
	.p2align 3
.L170:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	strb	w0, [x25, 15]
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	uxtb	w0, w0
	strb	w0, [x25, 16]
	cbnz	w0, .L265
.L172:
	ldrb	w0, [x25, 15]
	cbz	w0, .L178
	ldr	x3, .LC28
	add	x0, x27, 2478
	mov	x2, 3
	mov	w1, 255
	mov	x19, x0
	add	x24, x27, 2481
	ldr	x3, [x3, 96]
	blr	x3
	b	.L181
	.p2align 3
.L179:
	add	x19, x19, 1
	cmp	x24, x19
	beq	.L178
.L181:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x25, 21]
	bne	.L179
	mov	w23, 0
	mov	w22, 7
.L180:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	lsl	w0, w0, w22
	sub	w22, w22, #1
	orr	w23, w0, w23
	cmn	w22, #1
	bne	.L180
	strb	w23, [x19]
	b	.L179
	.p2align 3
.L259:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	str	w0, [x25, 128]
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	str	w0, [x25, 132]
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	uxtb	w0, w0
	strb	w0, [x25, 14]
	cbz	w0, .L178
	b	.L170
	.p2align 3
.L200:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	strb	w0, [x25, 40]
	b	.L201
	.p2align 3
.L206:
	ldr	x0, [x29, 120]
	add	x26, x26, 33
	cmp	x24, x0
	beq	.L208
	ldrb	w2, [x24], 33
	b	.L211
.L208:
	ldp	x1, x0, [x29, 104]
	add	x0, x0, 264
	str	x0, [x29, 112]
	cmp	x1, x0
	beq	.L210
	ldr	x0, [x29, 120]
	ldrb	w2, [x0]
	add	x0, x0, 264
	str	x0, [x29, 120]
	b	.L202
.L210:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	str	w0, [x25, 72]
	cbz	w0, .L212
	mov	w22, 0
	mov	w19, 7
.L213:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	lsl	w0, w0, w19
	sub	w19, w19, #1
	orr	w22, w0, w22
	cmn	w19, #1
	bne	.L213
	strb	w22, [x25, 53]
.L214:
	mov	x0, x25
	mov	x2, x20
	mov	x1, x21
	bl	VP8_mb_mode_mv_init
	ldr	w0, [x25, 56]
	cbz	w0, .L215
	ldr	w1, [x25, 40]
	mov	w0, 1
	tst	w1, 16776960
	beq	.L164
.L215:
	ldrb	w1, [x25, 3]
	mov	w0, 1
	strb	w1, [x25, 4]
.L164:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
.L257:
	ldr	x2, .LC25
	mov	w1, 914
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
.L212:
	strb	wzr, [x25, 53]
	b	.L214
.L258:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	mov	w19, w0
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	mov	w21, w0
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	uxtb	w2, w0
	uxtb	w1, w19
	uxtb	w3, w21
	cmp	w1, 157
	mov	w1, 42
	ccmp	w3, 1, 0, eq
	ccmp	w2, w1, 0, eq
	beq	.L167
	ldr	x2, .LC27
	uxtb	w5, w0
	mov	w4, w3
	mov	w1, 931
	uxtb	w3, w19
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
.L167:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	mov	w21, w0
	mov	w1, 8
	mov	x0, x20
	and	w21, w21, 255
	bl	BsGet
	mov	w22, w0
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	mov	w19, w0
	mov	w1, 8
	mov	x0, x20
	and	w19, w19, 255
	bl	BsGet
	ubfiz	w1, w0, 8, 6
	ubfiz	w2, w22, 8, 6
	orr	w1, w1, w19
	orr	w2, w2, w21
	add	w3, w1, 15
	add	w4, w2, 15
	lsr	w3, w3, 4
	lsr	w4, w4, 4
	ldr	w5, [x25, 56]
	ubfx	x22, x22, 6, 2
	ubfx	x0, x0, 6, 2
	mul	w6, w4, w3
	stp	w4, w3, [x25, 96]
	stp	w2, w1, [x25, 104]
	stp	w22, w0, [x25, 112]
	str	w6, [x25, 120]
	cbnz	w5, .L166
	mov	x0, x25
	bl	VP8_init_frame.part.0
	b	.L166
.L265:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	mov	x23, x27
	mov	x24, 0
	bl	Vp8_Vfmw_DecodeBool
	strb	w0, [x25, 17]
	ldr	x3, .LC28
	mov	x2, 8
	mov	w1, 0
	add	x0, x27, 2482
	ldr	x3, [x3, 96]
	blr	x3
.L173:
	add	x26, x23, 4
.L177:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	mov	w28, 0
	bl	Vp8_Vfmw_DecodeBool
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x25]
	beq	.L266
.L174:
	strb	w28, [x23, 2482]
	add	x23, x23, 1
	cmp	x26, x23
	bne	.L177
	add	x24, x24, 4
	cmp	x24, 8
	bne	.L173
	b	.L172
	.p2align 3
.L266:
	add	x0, x29, 136
	mov	w19, 0
	ldr	w22, [x24, x0]
	subs	w22, w22, #1
	bmi	.L175
.L176:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	lsl	w0, w0, w22
	sub	w22, w22, #1
	orr	w19, w0, w19
	cmn	w22, #1
	bne	.L176
	sxtb	w28, w19
.L175:
	mov	w2, -128
	mov	x1, x20
	mov	x0, x21
	bl	Vp8_Vfmw_DecodeBool
	cbz	w0, .L174
	neg	w19, w19
	sxtb	w28, w19
	b	.L174
	.size	VP8_GetPictureHeader, .-VP8_GetPictureHeader
	.align	3
.LC25:
	.xword	.LC24
	.align	3
.LC27:
	.xword	.LC26
	.align	3
.LC28:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC29:
	.xword	.LANCHOR2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP8_ArrangeVHBMem
	.type	VP8_ArrangeVHBMem, %function
VP8_ArrangeVHBMem:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC30
	mov	x2, 36
	mov	w1, 0
	add	x0, x29, 40
	ldr	x3, [x3, 96]
	blr	x3
	ldr	w6, [x19, 5804]
	mov	w3, 4
	ldr	w5, [x19, 5808]
	mov	w8, 13
	ldr	x4, [x19]
	mov	w2, 0
	stp	w6, w5, [x29, 56]
	ldr	w0, [x19, 8816]
	add	x1, x29, 40
	ldr	w7, [x4, 16]
	stp	w6, w5, [x29, 48]
	cmp	w7, 24
	mov	w6, 8
	csinc	w7, w3, wzr, ne
	str	w7, [x29, 64]
	str	w8, [x29, 40]
	ldr	w4, [x4, 16]
	strb	w6, [x29, 45]
	cmp	w4, 24
	csinc	w3, w3, wzr, ne
	str	w3, [x29, 68]
	bl	FSP_ArrangeFsPool
	cmp	w0, 2
	beq	.L275
	cbnz	w0, .L276
	mov	w0, 1
	str	w0, [x19, 8164]
.L271:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L276:
	ldr	x3, .LC31
	mov	w1, 1216
	ldr	x2, .LC33
	mov	w0, 0
	add	x3, x3, 1096
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L275:
	add	x0, x19, 8192
	add	x0, x0, 16
	bl	ResetVoQueue
	mov	w0, 0
	b	.L271
	.size	VP8_ArrangeVHBMem, .-VP8_ArrangeVHBMem
	.align	3
.LC30:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC31:
	.xword	.LANCHOR2
	.align	3
.LC33:
	.xword	.LC32
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP8_DecodeDecide
	.type	VP8_DecodeDecide, %function
VP8_DecodeDecide:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 3240
	bl	_mcount
	ldr	w0, [x19, 4924]
	cbz	w0, .L305
	ldr	w0, [x19, 4916]
	sub	w0, w0, #2
	cmp	w0, 1
	ldr	x0, [x20]
	ldr	w3, [x0, 8]
	bls	.L306
.L281:
	cmp	w3, 4
	str	w3, [x19, 4916]
	bls	.L307
	ldr	x2, .LC45
	mov	w1, 1280
	mov	w0, 1
	bl	dprint_normal
.L284:
	mov	w0, 0
.L298:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L307:
	ldr	x0, .LC51
	ldrb	w0, [x0,w3,uxtw]
	adr	x1, .Lrtx287
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx287:
	.section	.rodata
	.align	0
	.align	2
.L287:
	.byte	(.L285 - .Lrtx287) / 4
	.byte	(.L285 - .Lrtx287) / 4
	.byte	(.L282 - .Lrtx287) / 4
	.byte	(.L284 - .Lrtx287) / 4
	.byte	(.L285 - .Lrtx287) / 4
	.text
	.p2align 3
.L306:
	cmp	w3, 1
	ccmp	w3, 4, 4, hi
	bne	.L281
	ldr	x2, .LC37
	mov	w1, 1243
	mov	w0, 3
	bl	dprint_normal
	ldr	w1, [x19, 4940]
	ldr	w0, [x20, 8816]
	bl	FSP_ClearLogicFs
	ldr	w1, [x19, 4944]
	ldr	w0, [x20, 8816]
	bl	FSP_ClearLogicFs
	ldr	w1, [x19, 4948]
	ldr	w0, [x20, 8816]
	bl	FSP_ClearLogicFs
	ldr	w0, [x20, 8816]
	bl	FSP_GetNullLogicFs
	str	wzr, [x19, 4920]
	str	w0, [x19, 4940]
	str	w0, [x19, 4944]
	str	w0, [x19, 4948]
	ldr	x0, [x20]
	ldr	w3, [x0, 8]
	b	.L281
	.p2align 3
.L305:
	ldr	x2, .LC35
	mov	w1, 1235
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L282:
	ldr	w3, [x19, 4956]
	cbnz	w3, .L308
.L283:
	ldr	w1, [x19, 4948]
	ldr	w0, [x20, 8816]
	bl	FSP_GetFsImagePtr
	mov	x1, x0
	cbz	x0, .L309
	ldr	w2, [x19, 4956]
	mov	w0, 1
	cbz	w2, .L298
	ldr	x2, [x20]
	ldr	w3, [x1, 96]
	ldr	w4, [x2]
	cmp	w3, w4
	bls	.L298
	ldr	x2, .LC50
	mov	w1, 1298
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L285:
	ldr	w0, [x19, 4956]
	cbz	w0, .L283
	ldr	w0, [x19, 4920]
	cbnz	w0, .L283
	ldr	x3, .LC41
	mov	w4, 0
	ldr	x2, .LC43
	mov	w1, 1272
	mov	w0, 16
	bl	dprint_normal
	b	.L284
	.p2align 3
.L308:
	ldr	x2, .LC39
	mov	w1, 1260
	mov	w0, 16
	bl	dprint_normal
	b	.L284
	.p2align 3
.L309:
	ldr	x3, .LC46
	mov	w4, 1290
	ldr	x2, .LC48
	mov	w1, w4
	add	x3, x3, 1120
	mov	w0, 20
	bl	dprint_normal
	mov	w0, 0
	b	.L298
	.size	VP8_DecodeDecide, .-VP8_DecodeDecide
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
	.align	3
.LC46:
	.xword	.LANCHOR2
	.align	3
.LC48:
	.xword	.LC47
	.align	3
.LC50:
	.xword	.LC49
	.align	3
.LC51:
	.xword	.L287
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP8_GetImageBuffer
	.type	VP8_GetImageBuffer, %function
VP8_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 8816]
	mov	w1, 0
	bl	FSP_NewLogicFs
	str	w0, [x19, 8192]
	mov	w1, w0
	tbnz	w0, #31, .L314
	ldr	w0, [x19, 8816]
	bl	FSP_GetLogicFs
	mov	w1, 1
	cbz	x0, .L315
.L312:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L314:
	ldr	x2, .LC53
	mov	w1, 1328
	mov	w0, 0
	bl	dprint_normal
	ldr	w1, [x19, 8180]
	ldr	w0, [x19, 8816]
	bl	FSP_ClearLogicFs
	ldr	w1, [x19, 8184]
	ldr	w0, [x19, 8816]
	bl	FSP_ClearLogicFs
	ldr	w1, [x19, 8188]
	ldr	w0, [x19, 8816]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 8816]
	bl	FSP_GetNullLogicFs
	str	w0, [x19, 8180]
	str	w0, [x19, 8184]
	add	x1, x19, 8192
	str	w0, [x19, 8188]
	add	x1, x1, 16
	ldr	w0, [x19, 8816]
	str	wzr, [x19, 8160]
	bl	FSP_ClearNotInVoQueue
	mov	w1, 0
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L315:
	mov	w3, 1341
	ldr	x2, .LC55
	mov	w1, w3
	mov	w0, 20
	bl	dprint_normal
	mov	w1, 0
	b	.L312
	.size	VP8_GetImageBuffer, .-VP8_GetImageBuffer
	.align	3
.LC53:
	.xword	.LC52
	.align	3
.LC55:
	.xword	.LC54
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP8_Set_DecParam
	.type	VP8_Set_DecParam, %function
VP8_Set_DecParam:
	stp	x29, x30, [sp, -176]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x24, x0
	mov	x0, x30
	add	x1, x24, 4096
	str	x1, [x29, 104]
	mov	x20, x1
	add	x21, x24, 16
	bl	_mcount
	ldr	x28, .LC56
	ldr	x3, [x24, 3192]
	mov	x2, 3160
	str	x3, [x29, 96]
	mov	w1, 0
	ldr	x3, [x28, 96]
	mov	x0, x21
	add	x19, x24, 3240
	blr	x3
	ldr	w1, [x20, 1660]
	add	x0, x20, 1604
	str	w1, [x21, 2800]
	ldr	w1, [x19, 4960]
	str	w1, [x21, 2804]
	ldr	w1, [x0, 96]
	str	w1, [x21, 2788]
	ldr	w1, [x0, 100]
	str	w1, [x21, 2792]
	ldr	w1, [x0, 84]
	str	w1, [x21, 2808]
	ldr	w1, [x0, 88]
	str	w1, [x21, 2812]
	ldrb	w1, [x0, 53]
	strb	w1, [x21, 2752]
	ldr	w1, [x0, 72]
	strb	w1, [x21, 2753]
	ldrb	w1, [x0, 13]
	strb	w1, [x21, 2754]
	ldrb	w1, [x0, 14]
	strb	w1, [x21, 2755]
	ldrb	w1, [x0, 15]
	strb	w1, [x21, 2756]
	ldrb	w1, [x0, 17]
	strb	w1, [x21, 2757]
	ldrb	w1, [x0, 2]
	strb	w1, [x21, 2758]
	ldr	w1, [x0, 136]
	strb	w1, [x21, 2760]
	ldrb	w1, [x0, 10]
	strb	w1, [x21, 2762]
	ldrb	w1, [x0, 11]
	strb	w1, [x21, 2763]
	ldr	w1, [x19, 4928]
	strb	w1, [x21, 2761]
	ldr	w1, [x19, 4932]
	strb	w1, [x21, 2764]
	ldrb	w1, [x0, 3]
	strb	w1, [x21, 2759]
	ldrsb	x1, [x0, 5]
	lsr	w2, w1, 31
	strb	w2, [x21, 2765]
	eor	x2, x1, x1, asr 63
	sub	x2, x2, x1, asr 63
	strb	w2, [x21, 2766]
	ldrsb	x1, [x0, 6]
	lsr	w2, w1, 31
	strb	w2, [x21, 2767]
	eor	x2, x1, x1, asr 63
	sub	x2, x2, x1, asr 63
	strb	w2, [x21, 2768]
	ldrsb	x1, [x0, 7]
	lsr	w2, w1, 31
	strb	w2, [x21, 2769]
	eor	x2, x1, x1, asr 63
	sub	x2, x2, x1, asr 63
	strb	w2, [x21, 2770]
	ldrsb	x1, [x0, 8]
	lsr	w2, w1, 31
	strb	w2, [x21, 2771]
	eor	x2, x1, x1, asr 63
	sub	x2, x2, x1, asr 63
	strb	w2, [x21, 2772]
	ldrsb	x1, [x0, 9]
	lsr	w2, w1, 31
	strb	w2, [x21, 2773]
	eor	x2, x1, x1, asr 63
	sub	x2, x2, x1, asr 63
	strb	w2, [x21, 2774]
	ldrb	w1, [x0, 50]
	strb	w1, [x21, 2775]
	ldrb	w1, [x0, 51]
	strb	w1, [x21, 2776]
	ldrb	w1, [x0, 52]
	strb	w1, [x21, 2777]
	ldr	w1, [x0, 144]
	str	w1, [x21, 2784]
	ldr	w1, [x0, 140]
	strb	w1, [x21, 2779]
	ldr	w0, [x0, 148]
	strb	w0, [x21, 2780]
	ldr	w0, [x19, 4936]
	str	w0, [x21, 3144]
	ldr	w1, [x19, 4952]
	ldr	w0, [x24, 8816]
	bl	FSP_GetLogicFs
	mov	x20, x0
	ldr	w1, [x19, 4940]
	ldr	w0, [x24, 8816]
	bl	FSP_GetLogicFs
	mov	x22, x0
	ldr	w1, [x19, 4944]
	ldr	w0, [x24, 8816]
	bl	FSP_GetLogicFs
	mov	x23, x0
	ldr	w1, [x19, 4948]
	ldr	w0, [x24, 8816]
	bl	FSP_GetLogicFs
	cmp	x20, xzr
	ccmp	x22, xzr, 4, ne
	beq	.L317
	cmp	x23, xzr
	ccmp	x0, xzr, 4, ne
	beq	.L317
	ldr	x1, [x20, 24]
	cbz	x1, .L356
	ldr	w1, [x1, 4]
	str	w1, [x21, 3120]
	ldr	x1, [x20, 24]
	ldr	w1, [x1, 16]
	str	w1, [x21, 3124]
	ldr	x1, [x20, 40]
	ldr	w1, [x1, 8]
	str	w1, [x21, 3140]
	ldr	x1, [x22, 24]
	cbz	x1, .L357
.L352:
	ldr	w1, [x1, 4]
	str	w1, [x21, 3132]
	ldr	x1, [x23, 24]
	cbz	x1, .L358
.L353:
	ldr	w1, [x1, 4]
	str	w1, [x21, 3128]
	ldr	x0, [x0, 24]
	cbz	x0, .L359
.L354:
	ldr	w0, [x0, 4]
	add	x3, x24, 3072
	str	w0, [x21, 3136]
	ldr	x0, [x29, 104]
	ldr	x2, [x20, 24]
	add	x1, x0, 1626
	add	x0, x24, 3056
	ldr	w2, [x2, 44]
	str	w2, [x19, 4912]
	str	w2, [x21, 2796]
	ldr	x2, [x20, 24]
	ldr	w2, [x2, 72]
	str	w2, [x21, 3148]
	ldr	x2, [x20, 24]
	ldr	w2, [x2, 64]
	str	w2, [x21, 3152]
	ldr	x2, [x20, 24]
	ldr	w2, [x2, 68]
	str	w2, [x21, 3156]
	ldrb	w2, [x20, 424]
	strb	w2, [x21, 2778]
.L327:
	add	x0, x0, 4
	ldrsb	w2, [x1]
	add	x1, x1, 1
	cmp	x3, x0
	str	w2, [x0, -4]
	ldrsb	w2, [x1, 3]
	str	w2, [x0, 12]
	ldrsb	w2, [x1, 9]
	str	w2, [x0, 28]
	ldrsb	w2, [x1, 13]
	str	w2, [x0, 44]
	ldrb	w2, [x1, 23]
	str	w2, [x0, 60]
	bne	.L327
	ldr	x20, [x29, 104]
	mov	x2, 16
	ldr	x3, [x28, 96]
	mov	w1, 0
	add	x19, x20, 1604
	mov	x0, x21
	mov	w25, 1152
	add	x26, x20, 2922
	blr	x3
	ldrb	w0, [x19, 53]
	mov	x2, 16
	strb	w0, [x24, 16]
	mov	w1, 0
	add	x0, x24, 32
	ldrb	w3, [x19, 18]
	strb	w3, [x24, 17]
	ldrb	w3, [x19, 19]
	strb	w3, [x24, 18]
	ldrb	w3, [x19, 20]
	strb	w3, [x24, 19]
	ldrb	w3, [x19, 50]
	strb	w3, [x24, 20]
	ldrb	w3, [x19, 51]
	strb	w3, [x24, 21]
	ldrb	w3, [x19, 52]
	strb	w3, [x24, 22]
	ldr	x3, [x28, 96]
	blr	x3
	ldrb	w0, [x19, 1310]
	mov	x2, 16
	strb	w0, [x24, 32]
	mov	w1, 0
	add	x0, x24, 48
	ldrb	w3, [x19, 1311]
	strb	w3, [x24, 33]
	ldrb	w3, [x19, 1312]
	strb	w3, [x24, 34]
	ldrb	w3, [x19, 1313]
	strb	w3, [x24, 35]
	ldrb	w3, [x19, 1314]
	strb	w3, [x24, 36]
	ldrb	w3, [x19, 1315]
	strb	w3, [x24, 37]
	ldrb	w3, [x19, 1316]
	strb	w3, [x24, 38]
	ldr	x3, [x28, 96]
	blr	x3
	ldr	x3, [x28, 96]
	mov	x2, 16
	mov	w1, 0
	add	x0, x24, 64
	blr	x3
	ldr	x3, [x28, 96]
	mov	x2, 16
	mov	w1, 0
	add	x0, x24, 720
	blr	x3
	ldrb	w0, [x19, 2375]
	mov	x2, 16
	strb	w0, [x24, 720]
	mov	w1, 0
	ldr	x3, [x28, 96]
	ldrb	w0, [x19, 2374]
	strb	w0, [x24, 721]
	ldrb	w0, [x19, 2376]
	strb	w0, [x24, 722]
	ldrb	w0, [x19, 2377]
	strb	w0, [x24, 723]
	ldrb	w0, [x19, 2378]
	strb	w0, [x24, 724]
	ldrb	w0, [x19, 2379]
	strb	w0, [x24, 725]
	ldrb	w0, [x19, 2380]
	strb	w0, [x24, 726]
	ldrb	w0, [x19, 2381]
	strb	w0, [x24, 727]
	ldrb	w0, [x19, 2382]
	strb	w0, [x24, 728]
	add	x0, x24, 736
	blr	x3
	ldrb	w0, [x19, 2375]
	mov	x2, 16
	strb	w0, [x24, 736]
	mov	w1, 0
	ldr	x3, [x28, 96]
	ldrb	w0, [x19, 2383]
	strb	w0, [x24, 737]
	ldrb	w0, [x19, 2384]
	strb	w0, [x24, 738]
	ldrb	w0, [x19, 2385]
	strb	w0, [x24, 739]
	ldrb	w0, [x19, 2386]
	strb	w0, [x24, 740]
	ldrb	w0, [x19, 2387]
	strb	w0, [x24, 741]
	ldrb	w0, [x19, 2388]
	strb	w0, [x24, 742]
	ldrb	w0, [x19, 2389]
	strb	w0, [x24, 743]
	ldrb	w0, [x19, 2390]
	strb	w0, [x24, 744]
	ldrb	w0, [x19, 2391]
	strb	w0, [x24, 745]
	ldrb	w0, [x19, 2392]
	strb	w0, [x24, 746]
	add	x0, x24, 752
	blr	x3
	ldrb	w0, [x19, 2394]
	mov	x2, 16
	strb	w0, [x24, 752]
	mov	w1, 0
	ldr	x3, [x28, 96]
	ldrb	w0, [x19, 2393]
	strb	w0, [x24, 753]
	ldrb	w0, [x19, 2395]
	strb	w0, [x24, 754]
	ldrb	w0, [x19, 2396]
	strb	w0, [x24, 755]
	ldrb	w0, [x19, 2397]
	strb	w0, [x24, 756]
	ldrb	w0, [x19, 2398]
	strb	w0, [x24, 757]
	ldrb	w0, [x19, 2399]
	strb	w0, [x24, 758]
	ldrb	w0, [x19, 2400]
	strb	w0, [x24, 759]
	ldrb	w0, [x19, 2401]
	strb	w0, [x24, 760]
	add	x0, x24, 768
	blr	x3
	ldrb	w0, [x19, 2394]
	strb	w0, [x24, 768]
	ldrb	w0, [x19, 2402]
	strb	w0, [x24, 769]
	ldrb	w0, [x19, 2403]
	strb	w0, [x24, 770]
	ldrb	w0, [x19, 2404]
	strb	w0, [x24, 771]
	ldrb	w0, [x19, 2405]
	strb	w0, [x24, 772]
	ldrb	w0, [x19, 2406]
	strb	w0, [x24, 773]
	ldrb	w0, [x19, 2407]
	strb	w0, [x24, 774]
	ldrb	w0, [x19, 2408]
	strb	w0, [x24, 775]
	ldrb	w0, [x19, 2409]
	strb	w0, [x24, 776]
	ldrb	w0, [x19, 2410]
	strb	w0, [x24, 777]
	ldrb	w0, [x19, 2411]
	strb	w0, [x24, 778]
.L328:
	sub	w19, w25, #384
	mov	x23, x26
	.p2align 2
.L332:
	add	w22, w19, 48
	mov	x20, x23
.L329:
	add	x27, x21, x19, uxtw
	ldr	x5, [x28, 96]
	mov	x2, 16
	mov	w1, 0
	mov	x0, x27
	add	w19, w19, 16
	blr	x5
	ldr	x5, [x28, 104]
	mov	x1, x20
	mov	x2, 11
	mov	x0, x27
	add	x20, x20, x2
	blr	x5
	cmp	w19, w22
	bne	.L329
	cmp	w25, w19
	add	x23, x23, 33
	bne	.L332
	add	w25, w25, 384
	add	x26, x26, 264
	cmp	w25, 2688
	bne	.L328
	ldr	x0, [x29, 104]
	ldr	w0, [x0, 1660]
	cbnz	w0, .L344
	mov	x19, 10
	mov	w20, w19
.L333:
	ldr	x26, [x29, 96]
	add	x25, x24, 3200
	ldr	x0, [x29, 104]
	ldr	w1, [x26, 8]
	add	x27, x0, 1604
	mov	x0, x25
	and	w1, w1, -16
	sub	w1, w1, #16
	str	w1, [x21, 2816]
	ldr	w22, [x27, 68]
	bl	BsPos
	add	w22, w20, w22
	lsl	w22, w22, 3
	sub	w0, w22, w0
	str	w0, [x21, 2820]
	mov	x0, x25
	ldr	w23, [x26, 8]
	bl	BsPos
	mov	w22, w0
	cmp	w22, wzr
	add	w1, w22, 7
	csel	w1, w1, w22, lt
	and	w23, w23, 15
	mov	x0, x25
	add	w22, w23, 16
	add	w22, w22, w1, asr 3
	bl	BsPos
	asr	w2, w0, 31
	lsr	w2, w2, 29
	ubfiz	w3, w22, 3, 4
	add	w1, w0, w2
	and	w22, w22, -16
	and	w1, w1, 7
	sub	w0, w1, w2
	add	x2, x21, 2816
	add	w0, w3, w0
	mov	w1, 1
	stp	w0, w22, [x2, 8]
	stp	wzr, wzr, [x2, 16]
	str	wzr, [x21, 2840]
	ldrb	w2, [x27, 13]
	ldr	w9, [x27, 68]
	lsl	w1, w1, w2
	ldr	w3, [x26, 12]
	and	w7, w1, 255
	ldr	x0, [x26]
	uxtb	w1, w1
	str	w7, [x21, 2844]
	cmp	w1, 1
	add	x19, x19, x9, uxtw
	sub	w3, w3, w20
	add	x0, x0, x19
	bls	.L345
	sub	w5, w7, #1
	lsl	w1, w5, 2
	sub	w5, w1, w5
	add	x5, x0, x5, sxtw
.L334:
	cbz	w7, .L343
	mov	w2, 1
	sub	w8, w7, #1
	sub	w4, w2, w7
	mov	x1, 0
	lsl	w2, w4, 2
	sub	w2, w2, w4
	add	x4, x29, 144
	sub	w2, w2, w9
	add	w10, w2, w3
	.p2align 2
.L338:
	cmp	w8, w1
	ble	.L336
	ldrb	w2, [x0, 1]
	ldrb	w6, [x0]
	ldrb	w3, [x0, 2]
	add	w2, w6, w2, lsl 8
	add	w2, w2, w3, lsl 16
.L337:
	str	w2, [x4, x1, lsl 2]
	add	x1, x1, 1
	cmp	w7, w1
	add	x0, x0, 3
	add	x5, x5, x2, uxtw
	bgt	.L338
	ldr	x0, [x29, 96]
	add	w20, w20, w8, lsl 2
	sub	w8, w20, w8
	mov	x2, x4
	add	x3, x29, 112
	mov	w4, 0
	ldr	w1, [x0, 8]
	add	x0, x24, 2864
	and	w1, w1, 15
	add	w9, w1, w9
	add	w8, w9, w8
	.p2align 2
.L342:
	cbz	w4, .L360
	ldr	w1, [x2, -4]
	ldr	w5, [x3, -4]
	add	w1, w5, w1
	str	w1, [x3]
.L341:
	ldr	w6, [x2], 4
	and	w5, w1, -16
	add	w4, w4, 1
	ubfiz	w1, w1, 3, 4
	lsl	w6, w6, 3
	str	w1, [x0, 32]
	str	w6, [x0]
	add	w1, w5, 16
	str	wzr, [x0, 96]
	cmp	w7, w4
	str	wzr, [x0, 128]
	add	x3, x3, 4
	str	wzr, [x0, 160]
	add	x0, x0, 4
	str	w1, [x0, 60]
	bne	.L342
.L343:
	str	x21, [x24, 8]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L317:
	ldr	x2, .LC58
	mov	w1, 1427
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
.L350:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 176
	ret
.L344:
	mov	x19, 3
	mov	w20, w19
	b	.L333
.L345:
	mov	x5, x0
	b	.L334
.L359:
	ldr	x0, [x20, 24]
	b	.L354
.L358:
	ldr	x1, [x20, 24]
	b	.L353
.L357:
	ldr	x1, [x20, 24]
	b	.L352
.L356:
	ldr	x2, .LC60
	mov	w1, 1433
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	b	.L350
.L336:
	sub	x2, x0, x5
	add	w2, w10, w2
	b	.L337
.L360:
	str	w8, [x29, 112]
	ldr	w1, [x3]
	b	.L341
	.size	VP8_Set_DecParam, .-VP8_Set_DecParam
	.align	3
.LC56:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC58:
	.xword	.LC57
	.align	3
.LC60:
	.xword	.LC59
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP8_Update_PictHeader
	.type	VP8_Update_PictHeader, %function
VP8_Update_PictHeader:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 2460
	add	x22, x19, 8
	bl	_mcount
	ldr	x21, .LC61
	ldrb	w0, [x20, 45]
	cbnz	w0, .L362
	ldr	x3, [x21, 104]
	mov	x2, 1149
	add	x1, x19, 2612
	add	x0, x19, 3761
	blr	x3
.L362:
	ldr	x3, [x21, 104]
	mov	x1, x20
	mov	x2, 2452
	mov	x0, x22
	blr	x3
	ldr	w0, [x20, 56]
	str	w0, [x19, 4960]
	ldr	w0, [x20, 136]
	str	w0, [x19, 4928]
	ldrb	w0, [x20, 11]
	str	w0, [x19, 4932]
	ldrb	w0, [x20, 40]
	strb	w0, [x19]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VP8_Update_PictHeader, .-VP8_Update_PictHeader
	.align	3
.LC61:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP8DEC_Decode
	.type	VP8DEC_Decode, %function
VP8DEC_Decode:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x20]
	str	x1, [x19, 3176]
	ldr	w0, [x20, 16]
	str	w0, [x19, 3184]
	ldr	w2, [x20, 20]
	str	w2, [x19, 3188]
	cmp	w2, 2
	ble	.L399
	add	x21, x19, 3200
	add	x20, x19, 3240
	mov	x0, x21
	bl	BsInit
	add	x0, x19, 3176
	ldr	w2, [x19, 3188]
	str	x0, [x19, 3192]
	mov	x1, x20
	mov	x0, x21
	bl	VP8_GetPictureHeader
	cmp	w0, 1
	bne	.L400
	ldr	w0, [x20, 4924]
	cbnz	w0, .L401
.L369:
	ldr	x22, .LC66
	add	x21, x29, 56
	ldr	x4, [x22]
	cbz	x4, .L371
	ldr	w3, [x19, 3348]
	add	x21, x29, 56
	ldr	w2, [x19, 5796]
	ldr	w1, [x19, 5800]
	ldr	w5, [x19, 3344]
	ldr	w0, [x19, 8816]
	strh	w3, [x29, 58]
	mov	w3, 8
	strh	w2, [x29, 60]
	mov	x2, x21
	strh	w1, [x29, 62]
	mov	w1, 1
	strh	w5, [x29, 56]
	blr	x4
.L371:
	ldr	w0, [x19, 8816]
	mov	x3, x21
	add	x2, x29, 52
	add	x1, x29, 48
	stp	wzr, wzr, [x29, 48]
	str	wzr, [x29, 56]
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x19]
	ldr	w3, [x0, 736]
	cmp	w3, 1
	beq	.L402
.L373:
	ldr	w0, [x19, 8816]
	ldr	w1, [x20, 4940]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 8816]
	ldr	w1, [x20, 4944]
	bl	FSP_ClearLogicFs
	ldr	w1, [x20, 4948]
	ldr	w0, [x19, 8816]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 8816]
	bl	FSP_GetNullLogicFs
	str	wzr, [x20, 4920]
	str	w0, [x20, 4940]
	add	x1, x19, 8192
	str	w0, [x20, 4944]
	add	x1, x1, 16
	str	w0, [x20, 4948]
	ldr	w0, [x19, 8816]
	bl	FSP_ClearNotInVoQueue
	mov	x0, x19
	bl	VP8_ArrangeVHBMem
	cmp	w0, 1
	bne	.L403
.L370:
	mov	x0, x19
	bl	VP8_DecodeDecide
	cmp	w0, 1
	mov	w21, w0
	beq	.L377
	ldr	x2, .LC72
	mov	w1, 1748
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L400:
	ldr	x2, .LC65
	mov	w1, 1696
	mov	w0, 3
	bl	dprint_normal
	mov	w0, 0
.L367:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L399:
	ldr	x2, .LC63
	mov	w1, 1684
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L401:
	ldr	w3, [x19, 3344]
	add	x0, x19, 4096
	ldr	w2, [x19, 5796]
	add	x0, x0, 1604
	cmp	w3, w2
	bne	.L369
	ldr	w0, [x0, 100]
	ldr	w1, [x19, 3348]
	cmp	w1, w0
	bne	.L369
	b	.L370
	.p2align 3
.L402:
	ldr	w0, [x29, 56]
	cmp	w0, wzr
	bgt	.L374
	ldr	w0, [x29, 52]
	cmp	w0, 32
	bgt	.L374
	ldr	x0, [x19, 8]
	cbnz	x0, .L374
	ldr	w4, [x19, 3344]
	cbz	w4, .L373
	ldr	w7, [x19, 5800]
	add	x21, x19, 4096
	ldr	w1, [x19, 8820]
	add	x21, x21, 1604
	cmp	w7, w1
	beq	.L373
	ldr	w1, [x19, 8824]
	ldr	w6, [x21, 96]
	cmp	w6, w1
	beq	.L373
	ldr	x2, .LC68
	mov	w0, w3
	ldr	w5, [x19, 3348]
	mov	w1, 1723
	bl	dprint_normal
	ldr	w0, [x21, 100]
	str	w0, [x19, 8820]
	ldr	x4, [x22]
	ldr	w0, [x21, 96]
	str	w0, [x19, 8824]
	cbz	x4, .L373
	ldr	w0, [x19, 8816]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 48
	blr	x4
	b	.L373
	.p2align 3
.L403:
	ldr	x2, .LC70
	mov	w1, 1739
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L377:
	mov	x0, x19
	bl	VP8_GetImageBuffer
	cmp	w0, 1
	beq	.L378
	ldr	x2, .LC74
	mov	w1, 1756
	mov	w0, w21
	bl	dprint_normal
	mov	w0, 0
	b	.L367
	.p2align 3
.L374:
	mov	w0, -2
	b	.L367
	.p2align 3
.L378:
	ldr	w0, [x19, 8816]
	ldr	w1, [x20, 4952]
	bl	FSP_GetFsImagePtr
	mov	x3, x0
	cbz	x0, .L404
	ldr	x4, [x19]
	mov	x5, -1
	ldr	x2, .LC77
	mov	w1, 1779
	mov	w0, 24
	ldr	x4, [x4, 32]
	str	x4, [x3, 208]
	ldr	x4, [x19]
	ldr	x4, [x4, 48]
	str	x4, [x3, 216]
	ldr	x4, [x19]
	ldr	x4, [x4, 64]
	str	x4, [x3, 224]
	ldr	x4, [x19]
	ldr	w4, [x4, 80]
	str	w4, [x3]
	ldr	x4, [x19]
	ldr	w4, [x4, 84]
	str	w4, [x3, 4]
	ldr	x4, [x19]
	ldr	w4, [x4, 88]
	str	w4, [x3, 8]
	ldr	x4, [x19]
	ldr	w4, [x4, 104]
	str	w4, [x3, 12]
	str	wzr, [x3, 20]
	ldr	x4, [x19]
	str	x5, [x4, 32]
	ldr	x4, [x3, 216]
	ldr	x3, [x3, 208]
	bl	dprint_normal
	ldr	w0, [x20, 4956]
	cbnz	w0, .L380
	ldr	w1, [x20, 4944]
	ldr	w0, [x20, 4952]
	cmp	w1, w0
	beq	.L381
	ldr	w0, [x19, 8816]
	mov	w2, 0
	bl	FSP_SetRef
	ldr	w0, [x20, 4952]
.L381:
	ldr	w1, [x20, 4948]
	cmp	w1, w0
	beq	.L382
	ldr	w0, [x19, 8816]
	mov	w2, 0
	bl	FSP_SetRef
	ldr	w0, [x20, 4952]
.L382:
	ldr	w1, [x20, 4940]
	cmp	w1, w0
	beq	.L383
	ldr	w0, [x19, 8816]
	mov	w2, 0
	bl	FSP_SetRef
.L383:
	str	wzr, [x20, 4920]
.L380:
	mov	x0, x19
	bl	VP8_Set_DecParam
	mov	x0, x20
	bl	VP8_Update_PictHeader
	mov	w0, 0
	b	.L367
.L404:
	mov	w3, 1765
	ldr	x2, .LC75
	mov	w1, w3
	mov	w0, 20
	bl	dprint_normal
	mov	w0, 0
	b	.L367
	.size	VP8DEC_Decode, .-VP8DEC_Decode
	.align	3
.LC63:
	.xword	.LC62
	.align	3
.LC65:
	.xword	.LC64
	.align	3
.LC66:
	.xword	g_EventReportFunc
	.align	3
.LC68:
	.xword	.LC67
	.align	3
.LC70:
	.xword	.LC69
	.align	3
.LC72:
	.xword	.LC71
	.align	3
.LC74:
	.xword	.LC73
	.align	3
.LC75:
	.xword	.LC54
	.align	3
.LC77:
	.xword	.LC76
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP8DEC_RecycleImage
	.type	VP8DEC_RecycleImage, %function
VP8DEC_RecycleImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L407
	ldr	w0, [x19, 8816]
	mov	w1, w20
	mov	w2, 0
	bl	FSP_SetDisplay
	ldr	w0, [x19, 8816]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L408
	ldr	w0, [x19, 8816]
	ldr	x1, [x20, 168]
	bl	FreeUsdByDec
	str	xzr, [x20, 168]
	ldr	x1, [x20, 176]
	ldr	w0, [x19, 8816]
	bl	FreeUsdByDec
	str	xzr, [x20, 176]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L407:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L408:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VP8DEC_RecycleImage, .-VP8DEC_RecycleImage
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VP8DEC_GetImageBuffer
	.type	VP8DEC_GetImageBuffer, %function
VP8DEC_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x20, 8816]
	bl	FSP_IsNewFsAvailable
	cmp	w0, 1
	beq	.L411
	cmn	w0, #1
	mov	w19, 0
	beq	.L413
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L411:
	mov	w19, w0
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L413:
	add	x1, x20, 8192
	ldr	w0, [x20, 8816]
	add	x1, x1, 16
	bl	FSP_ClearNotInVoQueue
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VP8DEC_GetImageBuffer, .-VP8DEC_GetImageBuffer
	.global	default_uv_mode_prob
	.global	default_ymode_prob
	.global	VP8_VFMWBITREADER_NORM
	.global	vp8_mv_update_probs
	.global	vp8_default_mv_context
	.global	vp8_coef_update_probs
	.global	default_coef_probs
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	vp8_default_mv_context, %object
	.size	vp8_default_mv_context, 38
vp8_default_mv_context:
	.byte	-94
	.byte	-128
	.byte	-31
	.byte	-110
	.byte	-84
	.byte	-109
	.byte	-42
	.byte	39
	.byte	-100
	.byte	-128
	.byte	-127
	.byte	-124
	.byte	75
	.byte	-111
	.byte	-78
	.byte	-50
	.byte	-17
	.byte	-2
	.byte	-2
	.byte	-92
	.byte	-128
	.byte	-52
	.byte	-86
	.byte	119
	.byte	-21
	.byte	-116
	.byte	-26
	.byte	-28
	.byte	-128
	.byte	-126
	.byte	-126
	.byte	74
	.byte	-108
	.byte	-76
	.byte	-53
	.byte	-20
	.byte	-2
	.byte	-2
	.zero	2
	.type	default_coef_probs, %object
	.size	default_coef_probs, 1056
default_coef_probs:
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-3
	.byte	-120
	.byte	-2
	.byte	-1
	.byte	-28
	.byte	-37
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-67
	.byte	-127
	.byte	-14
	.byte	-1
	.byte	-29
	.byte	-43
	.byte	-1
	.byte	-37
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	106
	.byte	126
	.byte	-29
	.byte	-4
	.byte	-42
	.byte	-47
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	98
	.byte	-8
	.byte	-1
	.byte	-20
	.byte	-30
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-75
	.byte	-123
	.byte	-18
	.byte	-2
	.byte	-35
	.byte	-22
	.byte	-1
	.byte	-102
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	78
	.byte	-122
	.byte	-54
	.byte	-9
	.byte	-58
	.byte	-76
	.byte	-1
	.byte	-37
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-71
	.byte	-7
	.byte	-1
	.byte	-13
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-72
	.byte	-106
	.byte	-9
	.byte	-1
	.byte	-20
	.byte	-32
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	77
	.byte	110
	.byte	-40
	.byte	-1
	.byte	-20
	.byte	-26
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	101
	.byte	-5
	.byte	-1
	.byte	-15
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-86
	.byte	-117
	.byte	-15
	.byte	-4
	.byte	-20
	.byte	-47
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	37
	.byte	116
	.byte	-60
	.byte	-13
	.byte	-28
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-52
	.byte	-2
	.byte	-1
	.byte	-11
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-49
	.byte	-96
	.byte	-6
	.byte	-1
	.byte	-18
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	102
	.byte	103
	.byte	-25
	.byte	-1
	.byte	-45
	.byte	-85
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-104
	.byte	-4
	.byte	-1
	.byte	-16
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-79
	.byte	-121
	.byte	-13
	.byte	-1
	.byte	-22
	.byte	-31
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	80
	.byte	-127
	.byte	-45
	.byte	-1
	.byte	-62
	.byte	-32
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-10
	.byte	1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-58
	.byte	35
	.byte	-19
	.byte	-33
	.byte	-63
	.byte	-69
	.byte	-94
	.byte	-96
	.byte	-111
	.byte	-101
	.byte	62
	.byte	-125
	.byte	45
	.byte	-58
	.byte	-35
	.byte	-84
	.byte	-80
	.byte	-36
	.byte	-99
	.byte	-4
	.byte	-35
	.byte	1
	.byte	68
	.byte	47
	.byte	-110
	.byte	-48
	.byte	-107
	.byte	-89
	.byte	-35
	.byte	-94
	.byte	-1
	.byte	-33
	.byte	-128
	.byte	1
	.byte	-107
	.byte	-15
	.byte	-1
	.byte	-35
	.byte	-32
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-72
	.byte	-115
	.byte	-22
	.byte	-3
	.byte	-34
	.byte	-36
	.byte	-1
	.byte	-57
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	81
	.byte	99
	.byte	-75
	.byte	-14
	.byte	-80
	.byte	-66
	.byte	-7
	.byte	-54
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	1
	.byte	-127
	.byte	-24
	.byte	-3
	.byte	-42
	.byte	-59
	.byte	-14
	.byte	-60
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	99
	.byte	121
	.byte	-46
	.byte	-6
	.byte	-55
	.byte	-58
	.byte	-1
	.byte	-54
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	23
	.byte	91
	.byte	-93
	.byte	-14
	.byte	-86
	.byte	-69
	.byte	-9
	.byte	-46
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	1
	.byte	-56
	.byte	-10
	.byte	-1
	.byte	-22
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	109
	.byte	-78
	.byte	-15
	.byte	-1
	.byte	-25
	.byte	-11
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	44
	.byte	-126
	.byte	-55
	.byte	-3
	.byte	-51
	.byte	-64
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-124
	.byte	-17
	.byte	-5
	.byte	-37
	.byte	-47
	.byte	-1
	.byte	-91
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	94
	.byte	-120
	.byte	-31
	.byte	-5
	.byte	-38
	.byte	-66
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	22
	.byte	100
	.byte	-82
	.byte	-11
	.byte	-70
	.byte	-95
	.byte	-1
	.byte	-57
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-74
	.byte	-7
	.byte	-1
	.byte	-24
	.byte	-21
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	124
	.byte	-113
	.byte	-15
	.byte	-1
	.byte	-29
	.byte	-22
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	35
	.byte	77
	.byte	-75
	.byte	-5
	.byte	-63
	.byte	-45
	.byte	-1
	.byte	-51
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-99
	.byte	-9
	.byte	-1
	.byte	-20
	.byte	-25
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	121
	.byte	-115
	.byte	-21
	.byte	-1
	.byte	-31
	.byte	-29
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	45
	.byte	99
	.byte	-68
	.byte	-5
	.byte	-61
	.byte	-39
	.byte	-1
	.byte	-32
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	1
	.byte	-5
	.byte	-1
	.byte	-43
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-53
	.byte	1
	.byte	-8
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-119
	.byte	1
	.byte	-79
	.byte	-1
	.byte	-32
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-3
	.byte	9
	.byte	-8
	.byte	-5
	.byte	-49
	.byte	-48
	.byte	-1
	.byte	-64
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-81
	.byte	13
	.byte	-32
	.byte	-13
	.byte	-63
	.byte	-71
	.byte	-7
	.byte	-58
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	73
	.byte	17
	.byte	-85
	.byte	-35
	.byte	-95
	.byte	-77
	.byte	-20
	.byte	-89
	.byte	-1
	.byte	-22
	.byte	-128
	.byte	1
	.byte	95
	.byte	-9
	.byte	-3
	.byte	-44
	.byte	-73
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-17
	.byte	90
	.byte	-12
	.byte	-6
	.byte	-45
	.byte	-47
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-101
	.byte	77
	.byte	-61
	.byte	-8
	.byte	-68
	.byte	-61
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	24
	.byte	-17
	.byte	-5
	.byte	-38
	.byte	-37
	.byte	-1
	.byte	-51
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-55
	.byte	51
	.byte	-37
	.byte	-1
	.byte	-60
	.byte	-70
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	69
	.byte	46
	.byte	-66
	.byte	-17
	.byte	-55
	.byte	-38
	.byte	-1
	.byte	-28
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-65
	.byte	-5
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-33
	.byte	-91
	.byte	-7
	.byte	-1
	.byte	-43
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-115
	.byte	124
	.byte	-8
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	16
	.byte	-8
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-66
	.byte	36
	.byte	-26
	.byte	-1
	.byte	-20
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-107
	.byte	1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-30
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-9
	.byte	-64
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-16
	.byte	-128
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-122
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-43
	.byte	62
	.byte	-6
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	55
	.byte	93
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-54
	.byte	24
	.byte	-43
	.byte	-21
	.byte	-70
	.byte	-65
	.byte	-36
	.byte	-96
	.byte	-16
	.byte	-81
	.byte	-1
	.byte	126
	.byte	38
	.byte	-74
	.byte	-24
	.byte	-87
	.byte	-72
	.byte	-28
	.byte	-82
	.byte	-1
	.byte	-69
	.byte	-128
	.byte	61
	.byte	46
	.byte	-118
	.byte	-37
	.byte	-105
	.byte	-78
	.byte	-16
	.byte	-86
	.byte	-1
	.byte	-40
	.byte	-128
	.byte	1
	.byte	112
	.byte	-26
	.byte	-6
	.byte	-57
	.byte	-65
	.byte	-9
	.byte	-97
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-90
	.byte	109
	.byte	-28
	.byte	-4
	.byte	-45
	.byte	-41
	.byte	-1
	.byte	-82
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	39
	.byte	77
	.byte	-94
	.byte	-24
	.byte	-84
	.byte	-76
	.byte	-11
	.byte	-78
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	1
	.byte	52
	.byte	-36
	.byte	-10
	.byte	-58
	.byte	-57
	.byte	-7
	.byte	-36
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	124
	.byte	74
	.byte	-65
	.byte	-13
	.byte	-73
	.byte	-63
	.byte	-6
	.byte	-35
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	24
	.byte	71
	.byte	-126
	.byte	-37
	.byte	-102
	.byte	-86
	.byte	-13
	.byte	-74
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	1
	.byte	-74
	.byte	-31
	.byte	-7
	.byte	-37
	.byte	-16
	.byte	-1
	.byte	-32
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-107
	.byte	-106
	.byte	-30
	.byte	-4
	.byte	-40
	.byte	-51
	.byte	-1
	.byte	-85
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	28
	.byte	108
	.byte	-86
	.byte	-14
	.byte	-73
	.byte	-62
	.byte	-2
	.byte	-33
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	1
	.byte	81
	.byte	-26
	.byte	-4
	.byte	-52
	.byte	-53
	.byte	-1
	.byte	-64
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	123
	.byte	102
	.byte	-47
	.byte	-9
	.byte	-68
	.byte	-60
	.byte	-1
	.byte	-23
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	20
	.byte	95
	.byte	-103
	.byte	-13
	.byte	-92
	.byte	-83
	.byte	-1
	.byte	-53
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	-34
	.byte	-8
	.byte	-1
	.byte	-40
	.byte	-43
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-88
	.byte	-81
	.byte	-10
	.byte	-4
	.byte	-21
	.byte	-51
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	47
	.byte	116
	.byte	-41
	.byte	-1
	.byte	-45
	.byte	-44
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	121
	.byte	-20
	.byte	-3
	.byte	-44
	.byte	-42
	.byte	-1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-115
	.byte	84
	.byte	-43
	.byte	-4
	.byte	-55
	.byte	-54
	.byte	-1
	.byte	-37
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	42
	.byte	80
	.byte	-96
	.byte	-16
	.byte	-94
	.byte	-71
	.byte	-1
	.byte	-51
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	1
	.byte	1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-12
	.byte	1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-18
	.byte	1
	.byte	-1
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.type	VP8_VFMWBITREADER_NORM, %object
	.size	VP8_VFMWBITREADER_NORM, 256
VP8_VFMWBITREADER_NORM:
	.byte	0
	.byte	7
	.byte	6
	.byte	6
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	__func__.9877, %object
	.size	__func__.9877, 12
__func__.9877:
	.string	"VP8DEC_Init"
	.align	3
.LANCHOR2 = . + 0
	.type	vp8_mv_update_probs, %object
	.size	vp8_mv_update_probs, 38
vp8_mv_update_probs:
	.byte	-19
	.byte	-10
	.byte	-3
	.byte	-3
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-6
	.byte	-6
	.byte	-4
	.byte	-2
	.byte	-2
	.byte	-25
	.byte	-13
	.byte	-11
	.byte	-3
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-5
	.byte	-5
	.byte	-2
	.byte	-2
	.byte	-2
	.zero	2
	.type	vp8_coef_update_probs, %object
	.size	vp8_coef_update_probs, 1056
vp8_coef_update_probs:
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-80
	.byte	-10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-33
	.byte	-15
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-7
	.byte	-3
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-12
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-22
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-10
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-17
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-8
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-5
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-5
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-3
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-6
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-39
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-31
	.byte	-4
	.byte	-15
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-22
	.byte	-6
	.byte	-15
	.byte	-6
	.byte	-3
	.byte	-1
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-33
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-18
	.byte	-3
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-8
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-7
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-9
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-70
	.byte	-5
	.byte	-6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-22
	.byte	-5
	.byte	-12
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-5
	.byte	-5
	.byte	-13
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-20
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-5
	.byte	-3
	.byte	-3
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-6
	.byte	-2
	.byte	-4
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-8
	.byte	-2
	.byte	-7
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-10
	.byte	-3
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-4
	.byte	-2
	.byte	-5
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-8
	.byte	-2
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-2
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-5
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-11
	.byte	-5
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-5
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-4
	.byte	-3
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-7
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-3
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.type	__func__.9981, %object
	.size	__func__.9981, 18
__func__.9981:
	.string	"VP8_ArrangeVHBMem"
	.zero	6
	.type	__FUNCTION__.9995, %object
	.size	__FUNCTION__.9995, 17
__FUNCTION__.9995:
	.string	"VP8_DecodeDecide"
	.data
	.align	3
.LANCHOR1 = . + 0
	.type	default_ymode_prob, %object
	.size	default_ymode_prob, 4
default_ymode_prob:
	.byte	112
	.byte	86
	.byte	-116
	.byte	37
	.zero	4
	.type	default_uv_mode_prob, %object
	.size	default_uv_mode_prob, 3
default_uv_mode_prob:
	.byte	-94
	.byte	101
	.byte	-52
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC5:
	ASCII(.string	"pCurImg is null\n" )
	.zero	7
.LC7:
	ASCII(.string	"err_level(%d) over ref_thr(%d)\n" )
.LC9:
	ASCII(.string	"line: %d pToQueImg is null\n" )
	.zero	4
.LC11:
	ASCII(.string	"insert img to Voqueue failed!\n" )
	.zero	1
.LC15:
	ASCII(.string	"%s get ChanID = -1!\n\n" )
	.zero	2
.LC24:
	ASCII(.string	"Error!partition 0 length > streamlength!\n" )
	.zero	6
.LC26:
	ASCII(.string	"Invalid frame sync code,data[0-1]:%02x,%02x,%02x\n" )
	.zero	6
.LC32:
	ASCII(.string	"%s arrange fs pool failed!\n" )
	.zero	4
.LC34:
	ASCII(.string	"ERROR: No Img buffer is allocated\n" )
	.zero	5
.LC36:
	ASCII(.string	"----------------- vp8 Imode -> %d ------------------\n" )
	.zero	2
.LC38:
	ASCII(.string	"-----I_MODE, but FrameType is %d-----\n" )
	.zero	1
.LC40:
	ASCII(.string	"P-frm" )
	.zero	2
.LC42:
	ASCII(.string	"-----cur framtype is %s, but refnum=%d-----\n" )
	.zero	3
.LC44:
	ASCII(.string	"error: DecMode illegal\n" )
.LC47:
	ASCII(.string	"%s %d NULL == pFwdImg!!\n" )
	.zero	7
.LC49:
	ASCII(.string	"dec P frame, fwd ref err(%d) > ref_thr(%d)\n" )
	.zero	4
.LC52:
	ASCII(.string	"get frame store fail!\n" )
	.zero	1
.LC54:
	ASCII(.string	"line: %d, pImage is NULL!\n" )
	.zero	5
.LC57:
	ASCII(.string	"VP8_Set_DecParam but logic fs is null!\n" )
.LC59:
	ASCII(.string	"VP8_Set_DecParam but cur logic pstDecodeFs is null!\n" )
	.zero	3
.LC62:
	ASCII(.string	"Error!Truncated packet\n" )
.LC64:
	ASCII(.string	"VP8_CB_GetPictureHeader Error!\n" )
.LC67:
	ASCII(.string	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d,new w/h = %d/%d\n" )
	.zero	3
.LC69:
	ASCII(.string	"VP8_ArrangeVHBMem error\n" )
	.zero	7
.LC71:
	ASCII(.string	"VP8_DecodeDecide err\n" )
	.zero	2
.LC73:
	ASCII(.string	"VP8_GetBufFromQueue err\n" )
	.zero	7
.LC76:
	ASCII(.string	"dec_pts: %lld Usertag = %lld\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
