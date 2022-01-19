#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"avs2.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	AVS2_ue_v.isra.2, %function
AVS2_ue_v.isra.2:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 32
	mov	x0, x19
	bl	BsShow
	bl	ZerosMS_32
	cmp	w0, 31
	bls	.L5
	ldr	x1, .LC1
	mov	w2, w0
	mov	w3, -4370
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, -4370
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L5:
	mov	w1, w0
	mov	x0, x19
	add	w21, w1, 1
	bl	BsSkip
	mov	w1, w21
	mov	x0, x19
	bl	BsShow
	sub	w20, w0, #1
	mov	w1, w21
	mov	x0, x19
	bl	BsSkip
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS2_ue_v.isra.2, .-AVS2_ue_v.isra.2
	.align	3
.LC1:
	.xword	.LC0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	AVS2_se_v.isra.3, %function
AVS2_se_v.isra.3:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 32
	mov	x0, x20
	bl	BsShow
	bl	ZerosMS_32
	cmp	w0, 31
	bls	.L11
	mov	w0, 2147483647
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L11:
	mov	w1, w0
	mov	x0, x20
	add	w21, w1, 1
	bl	BsSkip
	mov	w1, w21
	mov	x0, x20
	bl	BsShow
	sub	w0, w0, #1
	asr	w2, w0, 1
	and	w0, w0, 1
	cmp	w0, wzr
	mov	w1, w21
	mov	x0, x20
	neg	w19, w2
	csinc	w19, w19, w2, eq
	bl	BsSkip
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS2_se_v.isra.3, .-AVS2_se_v.isra.3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	AVS2_UpdateSceneBuf.part.8, %function
AVS2_UpdateSceneBuf.part.8:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x19, x21, 16384
	add	x20, x21, 20480
	add	x22, x21, 8192
	bl	_mcount
	add	x19, x19, 3272
	add	x20, x20, 840
	b	.L16
	.p2align 3
.L14:
	add	x19, x19, 104
	cmp	x19, x20
	beq	.L21
.L16:
	ldrb	w0, [x19, 7]
	sub	w0, w0, #5
	uxtb	w0, w0
	cmp	w0, 1
	bhi	.L14
	ldrb	w0, [x19, 6]
	and	w1, w0, 1
	tbz	x0, 1, .L14
	ldr	x0, [x22, 2952]
	cmp	x0, x19
	beq	.L14
	strb	w1, [x19, 6]
	cbnz	w1, .L14
	strb	wzr, [x19, 5]
	mov	w2, 0
	ldr	w1, [x19, 56]
	add	x19, x19, 104
	ldr	w0, [x21, 4]
	bl	FSP_SetRef
	cmp	x19, x20
	bne	.L16
.L21:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS2_UpdateSceneBuf.part.8, .-AVS2_UpdateSceneBuf.part.8
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_Vfmw_EpbRemove
	.type	AVS2_Vfmw_EpbRemove, %function
AVS2_Vfmw_EpbRemove:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	add	x23, x19, 56
	add	x24, x19, 96
	bl	_mcount
	mov	w1, 8
	mov	x0, x23
	ldr	w21, [x23, 24]
	bl	BsGet
	strb	w0, [x19, 96]
	mov	w1, 8
	mov	x0, x23
	sub	w21, w21, #3
	bl	BsGet
	strb	w0, [x19, 97]
	mov	w1, 8
	mov	x0, x23
	bl	BsGet
	strb	w0, [x19, 98]
	mov	w1, 24
	mov	x0, x23
	bl	BsShow
	mov	w3, w0
	lsr	w25, w0, 8
	cbz	w21, .L32
	mov	w22, 3
	mov	w20, 16
	b	.L28
	.p2align 3
.L24:
	add	w20, w20, 8
	orr	w25, w1, w25, lsl 8
.L25:
	cmp	w20, 23
	mov	w1, 8
	mov	x0, x23
	sub	w21, w21, #1
	lsl	w19, w3, 8
	ble	.L26
	cmp	w22, 511
	sub	w20, w20, #8
	lsr	w2, w25, w20
	bhi	.L27
	strb	w2, [x24, w22, uxtw]
	add	w22, w22, 1
.L26:
	bl	BsGet
	mov	w1, 24
	mov	x0, x23
	bl	BsShow
	uxtb	w0, w0
	orr	w3, w0, w19
	cbz	w21, .L34
.L28:
	and	w0, w3, 16777215
	and	w1, w3, 255
	cmp	w0, 2
	bne	.L24
	ubfx	x0, x3, 2, 6
	add	w20, w20, 6
	orr	w25, w0, w25, lsl 6
	b	.L25
	.p2align 3
.L27:
	mov	w1, 32
	mov	x0, x23
	bl	BsShow
	uxtb	w2, w0
	ldr	x1, .LC6
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x25, [sp, 64]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L34:
	cmp	w20, 16
	mov	w2, w22
	ble	.L23
	cmp	w22, 511
	bhi	.L27
	mov	w0, 24
	lsr	w25, w25, 16
	sub	w0, w0, w20
	lsl	w0, w25, w0
	uxtb	w0, w0
	strb	w0, [x24, w22, uxtw]
	cmp	w0, wzr
	csinc	w2, w22, w22, eq
.L23:
	mov	x1, x24
	mov	x0, x23
	bl	BsInit
	ldr	x25, [sp, 64]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L32:
	mov	w2, 3
	b	.L23
	.size	AVS2_Vfmw_EpbRemove, .-AVS2_Vfmw_EpbRemove
	.align	3
.LC6:
	.xword	.LC5
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_SkipToNextStartCode
	.type	AVS2_SkipToNextStartCode, %function
AVS2_SkipToNextStartCode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 0
	bl	_mcount
	mov	x0, x20
	bl	BsToNextByte
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w21, w1, w0, lt
	asr	w21, w21, 3
	sub	w21, w21, #3
	cmp	w21, wzr
	bgt	.L42
	b	.L39
	.p2align 3
.L45:
	bl	BsSkip
	cmp	w19, w21
	beq	.L39
.L42:
	mov	w1, 24
	mov	x0, x20
	add	w19, w19, 1
	bl	BsShow
	mov	w2, w0
	cmp	w2, 1
	mov	w1, 8
	mov	x0, x20
	bne	.L45
	mov	w0, w2
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L39:
	mov	w2, 0
	ldr	x21, [sp, 32]
	mov	w0, w2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS2_SkipToNextStartCode, .-AVS2_SkipToNextStartCode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_DumpDpbStatus
	.type	AVS2_DumpDpbStatus, %function
AVS2_DumpDpbStatus:
	sub	sp, sp, #112
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	stp	x19, x20, [sp, 48]
	stp	x21, x22, [sp, 64]
	stp	x23, x24, [sp, 80]
	str	x25, [sp, 96]
	mov	x19, x0
	mov	x0, x30
	uxtb	w21, w1
	add	x19, x19, 16384
	bl	_mcount
	mov	w25, 0
	ldr	x1, .LC12
	mov	w0, 32
	mov	w20, 0
	add	x19, x19, 3278
	bl	dprint_vfmw
	ldr	x1, .LC14
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x23, .LC17
	cmp	w21, 1
	ldr	x22, .LC10
	ldr	x24, .LC15
	cset	w21, eq
	b	.L49
	.p2align 3
.L47:
	add	w20, w20, 1
	add	x19, x19, 104
	cmp	w20, 16
	beq	.L55
.L49:
	ldrb	w4, [x19]
	cmp	w4, wzr
	cset	w0, ne
	orr	w0, w21, w0
	cbz	w0, .L47
	ldrb	w3, [x19, 1]
	mov	w2, w20
	mov	x1, x23
	mov	w0, 32
	cmp	w3, 6
	add	w25, w25, 1
	uxtb	x5, w3
	mov	x3, x22
	bhi	.L48
	ldr	x3, [x24, x5, lsl 3]
.L48:
	ldr	w8, [x19, 74]
	add	w20, w20, 1
	ldrsh	w7, [x19, -6]
	add	x19, x19, 104
	ldrb	w6, [x19, -106]
	ldrb	w5, [x19, -105]
	str	w8, [sp, 24]
	ldr	w8, [x19, -50]
	str	w8, [sp, 16]
	ldr	w8, [x19, -54]
	str	w8, [sp, 8]
	ldrsh	w8, [x19, -108]
	str	w8, [sp]
	bl	dprint_vfmw
	cmp	w20, 16
	bne	.L49
.L55:
	ldr	x1, .LC19
	mov	w2, w25
	mov	w0, 32
	bl	dprint_vfmw
	add	sp, x29, 0
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.size	AVS2_DumpDpbStatus, .-AVS2_DumpDpbStatus
	.align	3
.LC10:
	.xword	.LC9
	.align	3
.LC12:
	.xword	.LC11
	.align	3
.LC14:
	.xword	.LC13
	.align	3
.LC15:
	.xword	.LANCHOR0
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC19:
	.xword	.LC18
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_ClearPacket
	.type	AVS2_ClearPacket, %function
AVS2_ClearPacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 16384
	bl	_mcount
	ldr	w0, [x20, 4]
	ldr	w1, [x19, 3120]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x19, 3106]
	cbnz	w0, .L56
	ldrb	w0, [x19, 3194]
	cmp	w0, 1
	beq	.L61
.L56:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L61:
	ldr	w0, [x19, 3200]
	cbz	w0, .L56
	ldr	w1, [x19, 3208]
	ldr	w0, [x20, 4]
	bl	SM_ReleaseStreamSeg
	b	.L56
	.size	AVS2_ClearPacket, .-AVS2_ClearPacket
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_ClearPicSlice
	.type	AVS2_ClearPicSlice, %function
AVS2_ClearPicSlice:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w20, 0
	bl	_mcount
	ldr	w0, [x21, 1748]
	cbnz	w0, .L69
	b	.L66
	.p2align 3
.L64:
	ldr	w0, [x21, 1748]
	cmp	w0, w20
	bls	.L66
.L69:
	uxtw	x1, w20
	ldr	w0, [x21, 4]
	lsl	x19, x1, 5
	add	w20, w20, 1
	add	x19, x19, x1, lsl 2
	add	x19, x21, x19
	ldr	w1, [x19, 1780]
	bl	SM_ReleaseStreamSeg
	ldrh	w0, [x19, 1776]
	cmp	w0, 256
	bne	.L64
	ldr	w0, [x19, 1764]
	cbz	w0, .L64
	ldr	w1, [x19, 1784]
	ldr	w0, [x21, 4]
	bl	SM_ReleaseStreamSeg
	ldr	w0, [x21, 1748]
	cmp	w0, w20
	bhi	.L69
.L66:
	str	wzr, [x21, 1748]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS2_ClearPicSlice, .-AVS2_ClearPicSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_ClearDpb
	.type	AVS2_ClearDpb, %function
AVS2_ClearDpb:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x19, x21, 16384
	add	x20, x21, 20480
	bl	_mcount
	add	x19, x19, 3278
	add	x20, x20, 846
	b	.L75
	.p2align 3
.L74:
	add	x19, x19, 104
	cmp	x19, x20
	beq	.L80
.L75:
	ldrb	w0, [x19]
	cbz	w0, .L74
	ldr	w1, [x19, 50]
	mov	w2, 0
	ldr	w0, [x21, 4]
	add	x19, x19, 104
	bl	FSP_ClearLogicFs
	strb	wzr, [x19, -104]
	cmp	x19, x20
	bne	.L75
.L80:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS2_ClearDpb, .-AVS2_ClearDpb
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_SequenceDisplayExtension
	.type	AVS2_SequenceDisplayExtension, %function
AVS2_SequenceDisplayExtension:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 56
	add	x19, x19, 16384
	bl	_mcount
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1120]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1124]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1128]
	cbnz	w0, .L87
.L82:
	mov	w1, 14
	mov	x0, x20
	add	x19, x19, 1120
	bl	BsGet
	str	w0, [x19, 24]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 28]
	mov	w1, 14
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 32]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 36]
	cmp	w0, 1
	mov	w21, w0
	beq	.L88
	mov	w0, 1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L87:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1132]
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1136]
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1140]
	b	.L82
	.p2align 3
.L88:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 40]
	mov	w1, w21
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 44]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS2_SequenceDisplayExtension, .-AVS2_SequenceDisplayExtension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_CopyrightExtension
	.type	AVS2_CopyrightExtension, %function
AVS2_CopyrightExtension:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 56
	bl	_mcount
	mov	w1, 4
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 7
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 20
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 22
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 22
	mov	x0, x19
	bl	BsGet
	ldr	x19, [sp, 16]
	mov	w0, 1
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2_CopyrightExtension, .-AVS2_CopyrightExtension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_CameraParametersExtension
	.type	AVS2_CameraParametersExtension, %function
AVS2_CameraParametersExtension:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 56
	bl	_mcount
	mov	w1, 4
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 7
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 22
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 22
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 22
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 22
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 22
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 22
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 22
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 22
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 22
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 22
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	ldr	x19, [sp, 16]
	mov	w0, 1
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2_CameraParametersExtension, .-AVS2_CameraParametersExtension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_TemporalScalabilityExtension
	.type	AVS2_TemporalScalabilityExtension, %function
AVS2_TemporalScalabilityExtension:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x20, x22, 56
	add	x23, x22, 16384
	bl	_mcount
	mov	w21, 0
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 2240]
	cbz	w0, .L97
	.p2align 2
.L95:
	add	x19, x22, x21, uxtw 2
	mov	w1, 4
	add	x19, x19, 16384
	mov	x0, x20
	add	w21, w21, 1
	bl	BsGet
	mov	w1, 18
	str	w0, [x19, 2244]
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 2272]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	mov	w1, 12
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 2304]
	ldr	w0, [x23, 2240]
	cmp	w0, w21
	bhi	.L95
.L97:
	mov	w0, 1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	AVS2_TemporalScalabilityExtension, .-AVS2_TemporalScalabilityExtension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_PictureDisplayExtension
	.type	AVS2_PictureDisplayExtension, %function
AVS2_PictureDisplayExtension:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x20, x22, 56
	add	x23, x22, 12288
	bl	_mcount
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	ldr	w0, [x23, 2804]
	cmp	w0, 1
	beq	.L115
	ldr	w0, [x23, 5440]
	cbz	w0, .L100
	ldr	w0, [x23, 5448]
	cmp	w0, 1
	beq	.L103
.L101:
	mov	w0, 2
	str	w0, [x22, 15080]
.L102:
	mov	w21, 0
	.p2align 2
.L104:
	add	x19, x22, x21, sxtw 2
	mov	w1, 16
	add	x19, x19, 16384
	mov	x0, x20
	bl	BsGet
	mov	w1, 1
	str	w0, [x19, 2216]
	mov	x0, x20
	add	w21, w21, w1
	bl	BsGet
	mov	w1, 16
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 2228]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	ldr	w0, [x23, 2792]
	cmp	w0, w21
	bhi	.L104
	mov	x0, x20
	bl	AVS2_SkipToNextStartCode
	ldr	x23, [sp, 48]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L115:
	ldr	w0, [x23, 5448]
	cmp	w0, 1
	beq	.L116
.L100:
	mov	w0, 1
	str	w0, [x22, 15080]
	b	.L102
.L116:
	ldr	w0, [x23, 5444]
	cmp	w0, 1
	bne	.L101
	.p2align 2
.L103:
	mov	w0, 3
	str	w0, [x22, 15080]
	b	.L102
	.size	AVS2_PictureDisplayExtension, .-AVS2_PictureDisplayExtension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_MasteringMetadataExtension
	.type	AVS2_MasteringMetadataExtension, %function
AVS2_MasteringMetadataExtension:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 16384
	add	x19, x19, 56
	bl	_mcount
	add	x20, x21, 2340
	mov	w1, 4
	mov	x0, x19
	add	x22, x21, 2352
	bl	BsGet
.L118:
	add	x20, x20, 4
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	str	w0, [x20, -4]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	str	w0, [x20, 8]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	cmp	x20, x22
	bne	.L118
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	str	w0, [x21, 2364]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	str	w0, [x21, 2368]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	str	w0, [x21, 2372]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	str	w0, [x21, 2376]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	str	w0, [x21, 2380]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	str	w0, [x21, 2384]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	str	w1, [x21, 2332]
	str	w1, [x21, 2336]
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS2_MasteringMetadataExtension, .-AVS2_MasteringMetadataExtension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_DynamicMetadataExtension
	.type	AVS2_DynamicMetadataExtension, %function
AVS2_DynamicMetadataExtension:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x19, x22, 56
	add	x22, x22, 16384
	bl	_mcount
	mov	w1, 4
	mov	x0, x19
	bl	BsGet
	mov	w1, 4
	mov	x0, x19
	bl	BsGet
	strb	w0, [x22, 2389]
	mov	w1, 4
	mov	x0, x19
	bl	BsGet
	strb	w0, [x22, 2390]
	mov	w1, 4
	mov	x0, x19
	bl	BsGet
	strb	w0, [x22, 2391]
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x22, 2400]
	cbz	w0, .L136
	add	x20, x22, 2420
	add	x21, x22, 2426
.L123:
	add	x20, x20, 2
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	strh	w0, [x20, -2]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	strh	w0, [x20, 4]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	cmp	x20, x21
	bne	.L123
	mov	w1, 16
	mov	x0, x19
	add	x20, x22, 2440
	add	x23, x22, 2448
	bl	BsGet
	strh	w0, [x22, 2432]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	strh	w0, [x22, 2434]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	strh	w0, [x22, 2436]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	strh	w0, [x22, 2438]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
.L124:
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	strh	w0, [x20], 2
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	cmp	x23, x20
	bne	.L124
	mov	w1, 3
	mov	x0, x19
	add	x23, x22, 2388
	add	x21, x22, 2455
	bl	BsGet
	strb	w0, [x22, 2448]
	mov	w1, 8
	mov	x0, x19
	mov	w20, 0
	mov	x24, x23
	bl	BsGet
	strb	w0, [x22, 2449]
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	strb	w0, [x22, 2450]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	strb	w0, [x22, 2451]
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	strb	w0, [x22, 2452]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	strb	w0, [x22, 2453]
	mov	w1, 4
	mov	x0, x19
	bl	BsGet
	strb	w0, [x22, 2454]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	ldrb	w0, [x22, 2454]
	cbz	w0, .L129
	.p2align 2
.L131:
	mov	w1, 8
	add	x21, x21, 1
	mov	x0, x19
	add	w20, w20, 1
	bl	BsGet
	strb	w0, [x21, -1]
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	strb	w0, [x21, 9]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	ldrb	w0, [x24, 66]
	cmp	w0, w20
	ccmp	w20, 9, 0, gt
	ble	.L131
.L129:
	add	x23, x22, 2388
	mov	w1, 4
	mov	x0, x19
	bl	BsGet
	and	w1, w0, 255
	strb	w0, [x23, 87]
	cbz	w1, .L127
	add	x21, x22, 2476
	mov	w20, 0
	.p2align 2
.L130:
	mov	w1, 8
	add	x21, x21, 1
	mov	x0, x19
	add	w20, w20, 1
	bl	BsGet
	strb	w0, [x21, -1]
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	strb	w0, [x21, 5]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	ldrb	w0, [x23, 87]
	cmp	w0, w20
	ccmp	w20, 5, 0, gt
	ble	.L130
.L127:
	mov	w1, 1
	strb	w1, [x22, 2388]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L136:
	ldr	x2, .LC20
	mov	w0, 1
	ldr	x1, .LC22
	strb	wzr, [x22, 2388]
	add	x2, x2, 56
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	AVS2_DynamicMetadataExtension, .-AVS2_DynamicMetadataExtension
	.align	3
.LC20:
	.xword	.LANCHOR0
	.align	3
.LC22:
	.xword	.LC21
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_Extension
	.type	AVS2_Extension, %function
AVS2_Extension:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w21, w1
	add	x19, x20, 56
	bl	_mcount
	mov	w1, 32
	mov	x0, x19
	bl	BsGet
	mov	w1, 4
	mov	x0, x19
	bl	BsShow
	cbnz	w21, .L138
	sub	w0, w0, #2
	cmp	w0, 10
	bls	.L156
.L148:
	mov	w1, 4
	mov	x0, x19
	bl	BsSkip
	mov	w0, 0
.L147:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L138:
	sub	w0, w0, #4
	cmp	w0, 8
	bhi	.L148
	ldr	x1, .LC24
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx150
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx150:
	.section	.rodata
	.align	0
	.align	2
.L150:
	.byte	(.L149 - .Lrtx150) / 4
	.byte	(.L148 - .Lrtx150) / 4
	.byte	(.L148 - .Lrtx150) / 4
	.byte	(.L151 - .Lrtx150) / 4
	.byte	(.L148 - .Lrtx150) / 4
	.byte	(.L148 - .Lrtx150) / 4
	.byte	(.L152 - .Lrtx150) / 4
	.byte	(.L153 - .Lrtx150) / 4
	.byte	(.L155 - .Lrtx150) / 4
	.text
	.p2align 3
.L156:
	ldr	x1, .LC23
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx141
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx141:
	.section	.rodata
	.align	0
	.align	2
.L141:
	.byte	(.L140 - .Lrtx141) / 4
	.byte	(.L142 - .Lrtx141) / 4
	.byte	(.L149 - .Lrtx141) / 4
	.byte	(.L148 - .Lrtx141) / 4
	.byte	(.L148 - .Lrtx141) / 4
	.byte	(.L151 - .Lrtx141) / 4
	.byte	(.L148 - .Lrtx141) / 4
	.byte	(.L148 - .Lrtx141) / 4
	.byte	(.L145 - .Lrtx141) / 4
	.byte	(.L153 - .Lrtx141) / 4
	.byte	(.L155 - .Lrtx141) / 4
	.text
	.p2align 3
.L155:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L153:
	mov	x0, x20
	bl	AVS2_CameraParametersExtension
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L151:
	mov	x0, x20
	bl	AVS2_PictureDisplayExtension
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L149:
	mov	x0, x20
	bl	AVS2_CopyrightExtension
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L152:
	mov	x0, x20
	bl	AVS2_DynamicMetadataExtension
	b	.L147
	.p2align 3
.L140:
	mov	x0, x20
	bl	AVS2_SequenceDisplayExtension
	b	.L147
	.p2align 3
.L145:
	mov	x0, x20
	bl	AVS2_MasteringMetadataExtension
	b	.L147
	.p2align 3
.L142:
	mov	x0, x20
	bl	AVS2_TemporalScalabilityExtension
	b	.L147
	.size	AVS2_Extension, .-AVS2_Extension
	.align	3
.LC23:
	.xword	.L141
	.align	3
.LC24:
	.xword	.L150
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_User_Data
	.type	AVS2_User_Data, %function
AVS2_User_Data:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 56
	bl	_mcount
	ldr	x1, .LC26
	mov	w0, 7
	bl	dprint_vfmw
	mov	w1, 32
	mov	x0, x19
	bl	BsGet
	b	.L158
	.p2align 3
.L161:
	ldr	w4, [x19, 24]
	ldr	w3, [x19, 32]
	add	w2, w3, 8
	cmp	w2, w4, lsl 3
	bhi	.L162
	bl	BsGet
.L158:
	mov	w1, 24
	mov	x0, x19
	bl	BsShow
	cmp	w0, 1
	mov	w1, 8
	mov	x0, x19
	bne	.L161
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L162:
	ldr	x2, .LC27
	mov	w0, 1
	ldr	x1, .LC29
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2_User_Data, .-AVS2_User_Data
	.align	3
.LC26:
	.xword	.LC25
	.align	3
.LC27:
	.xword	.LANCHOR1
	.align	3
.LC29:
	.xword	.LC28
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_ConvertSLHDRMetadata
	.type	AVS2_ConvertSLHDRMetadata, %function
AVS2_ConvertSLHDRMetadata:
	stp	x29, x30, [sp, -288]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x20, .LC30
	mov	x2, 240
	mov	w1, 0
	add	x0, x29, 48
	ldr	x3, [x20, 96]
	blr	x3
	ldr	x0, [x21, 480]
	add	x6, x21, 464
	cbz	x0, .L187
	mov	w1, 1
	strb	w1, [x21, 466]
	mov	w3, 15000
	ldrb	w1, [x19, 1]
	ldrh	w2, [x19, 32]
	add	w1, w1, 1
	ldrb	w5, [x19, 2]
	ldrb	w4, [x19, 3]
	cmp	w2, w3
	stp	w1, w5, [x29, 48]
	ldrb	w1, [x19, 60]
	str	w4, [x29, 56]
	str	w1, [x29, 60]
	beq	.L169
	mov	w1, 8500
	cmp	w2, w1
	beq	.L188
	mov	w1, 13250
	cmp	w2, w1
	beq	.L189
.L169:
	mov	w1, 0
	str	wzr, [x29, 68]
.L167:
	ldr	w3, [x19, 12]
	mov	w2, 1
	mov	w4, 100
	str	w2, [x29, 64]
	stp	w2, w1, [x29, 80]
	stp	w4, wzr, [x29, 88]
	cbnz	w3, .L190
.L170:
	ldrh	w4, [x19, 52]
	ldrh	w1, [x19, 54]
	ldrh	w3, [x19, 56]
	ldrh	w2, [x19, 58]
	stp	w4, w1, [x29, 96]
	ldrb	w1, [x19, 62]
	ldrb	w4, [x19, 63]
	stp	w3, w2, [x29, 104]
	ldrb	w5, [x19, 61]
	ldrb	w3, [x19, 64]
	ldrb	w2, [x19, 65]
	stp	w1, w4, [x29, 136]
	ldrb	w1, [x19, 66]
	str	w5, [x29, 132]
	stp	w3, w2, [x29, 144]
	str	w1, [x29, 152]
	cbz	w1, .L175
	sub	w5, w1, #1
	add	x2, x29, 156
	add	x5, x5, 68
	add	x1, x19, 67
	add	x5, x19, x5
	.p2align 2
.L174:
	ldrb	w4, [x1]
	add	x1, x1, 1
	ldrb	w3, [x1, 9]
	cmp	x1, x5
	str	w4, [x2]
	add	x2, x2, 4
	str	w3, [x2, 36]
	bne	.L174
.L175:
	ldrb	w5, [x19, 87]
	str	w5, [x29, 236]
	cbz	w5, .L173
	add	x19, x19, 88
	add	x2, x29, 240
	mov	w1, 0
	.p2align 2
.L178:
	add	w1, w1, 1
	ldrb	w4, [x19]
	ldrb	w3, [x19, 6]
	cmp	w1, 5
	str	w4, [x2]
	ccmp	w5, w1, 0, ls
	str	w3, [x2, 24]
	add	x19, x19, 1
	add	x2, x2, 4
	bhi	.L178
.L173:
	ldr	w3, [x6, 4]
	cmp	w3, 239
	bhi	.L191
	ldr	x2, .LC31
	mov	x4, 240
	ldr	x1, .LC35
	mov	w0, 1
	add	x2, x2, 16
	bl	dprint_vfmw
.L163:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 288
	ret
	.p2align 3
.L190:
	ldrh	w2, [x19, 48]
	mov	w1, 34079
	movk	w1, 0x51eb, lsl 16
	ldrh	w3, [x19, 50]
	add	w2, w2, 25
	mov	w4, 35757
	add	w3, w3, 4096
	movk	w4, 0x68db, lsl 16
	smull	x2, w2, w1
	add	w3, w3, 904
	mov	w5, 10000
	lsr	x1, x2, 36
	smull	x3, w3, w4
	lsl	w4, w1, 3
	sub	w4, w4, w1
	lsr	x2, x3, 44
	str	w2, [x29, 76]
	add	w2, w1, w4, lsl 3
	sub	w1, w2, w4
	cmp	w1, w5
	csel	w1, w1, w5, le
	str	w1, [x29, 72]
	b	.L170
	.p2align 3
.L191:
	ldr	x3, [x20, 104]
	add	x1, x29, 48
	mov	x2, 240
	blr	x3
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 288
	ret
	.p2align 3
.L188:
	mov	w1, 1
	str	w1, [x29, 68]
	b	.L167
	.p2align 3
.L189:
	mov	w1, 2
	str	w1, [x29, 68]
	b	.L167
.L187:
	ldr	x2, .LC31
	mov	x3, 0
	ldr	x1, .LC33
	mov	w0, 1
	add	x2, x2, 16
	bl	dprint_vfmw
	b	.L163
	.size	AVS2_ConvertSLHDRMetadata, .-AVS2_ConvertSLHDRMetadata
	.align	3
.LC30:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC31:
	.xword	.LANCHOR1
	.align	3
.LC33:
	.xword	.LC32
	.align	3
.LC35:
	.xword	.LC34
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_ConvertHDRInfo
	.type	AVS2_ConvertHDRInfo, %function
AVS2_ConvertHDRInfo:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x21, x1
	mov	x0, x30
	mov	x20, x2
	bl	_mcount
	ldr	w0, [x21, 4]
	add	x3, x19, 496
	strb	w0, [x19, 488]
	add	x2, x20, 3656
	add	x0, x20, 3644
	ldr	w1, [x21, 12]
	strb	w1, [x19, 489]
	ldr	w1, [x21, 20]
	strb	w1, [x19, 490]
	ldr	w1, [x21, 16]
	str	w1, [x19, 492]
	ldr	w1, [x20, 3636]
	strb	w1, [x19, 464]
.L193:
	ldr	w1, [x0]
	add	x0, x0, 4
	strh	w1, [x3]
	add	x3, x3, 2
	cmp	x0, x2
	ldr	w1, [x0, 8]
	strh	w1, [x3, 4]
	bne	.L193
	ldr	w1, [x20, 3668]
	strh	w1, [x19, 508]
	ldr	w1, [x20, 3672]
	strh	w1, [x19, 510]
	ldr	w1, [x20, 3676]
	str	w1, [x19, 512]
	ldr	w1, [x20, 3680]
	str	w1, [x19, 516]
	ldr	w1, [x20, 3640]
	strb	w1, [x19, 465]
	ldr	w1, [x20, 3684]
	str	w1, [x19, 520]
	ldr	w0, [x20, 3688]
	str	w0, [x19, 524]
	ldrb	w0, [x20, 3692]
	cmp	w0, 1
	beq	.L196
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L196:
	add	x1, x20, 3692
	mov	x0, x19
	bl	AVS2_ConvertSLHDRMetadata
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS2_ConvertHDRInfo, .-AVS2_ConvertHDRInfo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_WriteSliceMsg
	.type	AVS2_WriteSliceMsg, %function
AVS2_WriteSliceMsg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w2, [x19, 1748]
	cmp	w2, 255
	bhi	.L203
	add	x20, x19, 56
	mov	w1, 24
	mov	x0, x20
	bl	BsSkip
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	cmp	w0, 143
	mov	w21, w0
	bhi	.L204
	add	x22, x19, 12288
	ldr	w2, [x22, 2872]
	mov	w0, 144
	ldr	w1, [x22, 2820]
	lsl	w0, w0, w2
	cmp	w1, w0
	bhi	.L205
.L201:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	mov	w23, w0
	ldr	w2, [x22, 2872]
	mov	w0, 255
	ldr	w1, [x22, 2812]
	lsl	w0, w0, w2
	cmp	w1, w0
	bhi	.L206
.L202:
	ldr	w1, [x19, 1748]
	mov	w0, 1
	add	x3, x19, 16384
	add	w4, w1, w0
	uxtw	x1, w1
	lsl	x2, x1, 5
	add	x1, x2, x1, lsl 2
	add	x1, x19, x1
	strh	w21, [x1, 1754]
	strh	w23, [x1, 1752]
	ldrh	w2, [x22, 5204]
	madd	w21, w2, w21, w23
	str	w21, [x1, 1756]
	ldr	w2, [x3, 3112]
	str	w2, [x1, 1760]
	ldr	w2, [x3, 3200]
	str	w2, [x1, 1764]
	ldr	w2, [x3, 3116]
	str	w2, [x1, 1768]
	ldr	w2, [x3, 3204]
	str	w2, [x1, 1772]
	ldrb	w2, [x3, 3106]
	strb	w2, [x1, 1776]
	ldrb	w2, [x3, 3194]
	strb	w2, [x1, 1777]
	ldr	w2, [x3, 3120]
	str	w2, [x1, 1780]
	ldr	w2, [x3, 3208]
	str	w2, [x1, 1784]
	str	w4, [x19, 1748]
	ldr	w1, [x19, 12]
	orr	w1, w1, 32768
	str	w1, [x19, 12]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L203:
	ldr	x1, .LC37
	mov	w3, 256
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L204:
	ldr	x1, .LC39
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L206:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	add	w23, w23, w0, lsl 8
	b	.L202
	.p2align 3
.L205:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	add	w21, w21, w0, lsl 7
	b	.L201
	.size	AVS2_WriteSliceMsg, .-AVS2_WriteSliceMsg
	.align	3
.LC37:
	.xword	.LC36
	.align	3
.LC39:
	.xword	.LC38
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_Head_GetRefConfigSet
	.type	AVS2_Head_GetRefConfigSet, %function
AVS2_Head_GetRefConfigSet:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	mov	w20, 0
	bl	_mcount
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
	str	w0, [x19]
	mov	w1, 3
	mov	x0, x21
	bl	BsGet
	str	w0, [x19, 4]
	cbz	w0, .L212
	.p2align 2
.L215:
	mov	w1, 6
	mov	x0, x21
	bl	BsGet
	add	x1, x19, x20, uxtw 2
	add	w20, w20, 1
	str	w0, [x1, 8]
	ldr	w0, [x19, 4]
	cmp	w0, w20
	bhi	.L215
.L212:
	mov	w1, 3
	mov	x0, x21
	mov	w20, 0
	bl	BsGet
	str	w0, [x19, 36]
	cbz	w0, .L210
	.p2align 2
.L214:
	mov	w1, 6
	mov	x0, x21
	bl	BsGet
	add	x1, x19, x20, uxtw 2
	add	w20, w20, 1
	str	w0, [x1, 40]
	ldr	w0, [x19, 36]
	cmp	w0, w20
	bhi	.L214
.L210:
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS2_Head_GetRefConfigSet, .-AVS2_Head_GetRefConfigSet
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_WeightQuantMatrix
	.type	AVS2_WeightQuantMatrix, %function
AVS2_WeightQuantMatrix:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	mov	x21, x1
	add	x23, x22, 16
	mov	x20, x2
	bl	_mcount
	.p2align 2
.L221:
	mov	x19, 0
	.p2align 2
.L220:
	mov	x0, x20
	bl	AVS2_ue_v.isra.2
	strb	w0, [x22, x19]
	add	x19, x19, 1
	cmp	x19, 4
	bne	.L220
	add	x22, x22, 4
	cmp	x22, x23
	bne	.L221
	add	x22, x21, 64
	.p2align 2
.L223:
	mov	x19, 0
	.p2align 2
.L222:
	mov	x0, x20
	bl	AVS2_ue_v.isra.2
	strb	w0, [x21, x19]
	add	x19, x19, 1
	cmp	x19, 8
	bne	.L222
	add	x21, x21, 8
	cmp	x21, x22
	bne	.L223
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	AVS2_WeightQuantMatrix, .-AVS2_WeightQuantMatrix
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_SetupWqMatrix84DataIdx01
	.type	AVS2_SetupWqMatrix84DataIdx01, %function
AVS2_SetupWqMatrix84DataIdx01:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x29, 56
	bl	_mcount
	ldr	x22, .LC45
	mov	x2, 6
	mov	w1, 0
	mov	x0, x21
	ldr	x3, [x22, 96]
	blr	x3
	ldr	x20, .LC44
	ldr	w0, [x19, 2716]
	cbz	w0, .L255
	cmp	w0, 1
	beq	.L256
	cmp	w0, 2
	beq	.L257
.L230:
	ldr	w0, [x19, 2720]
	cbz	w0, .L244
	cmp	w0, 1
	beq	.L258
	add	x3, x20, 272
	add	x4, x20, 208
	mov	x0, x19
	add	x7, x3, 16
	mov	x6, x19
	mov	w2, 0
	.p2align 2
.L237:
	mov	x1, 0
	b	.L240
	.p2align 3
.L238:
	ldrb	w2, [x3, x1]
.L240:
	sub	x5, x29, #4032
	add	x2, x5, x2, sxtw
	add	x5, x6, x1
	add	x1, x1, 1
	cmp	x1, 4
	ldrb	w2, [x2, 4088]
	strb	w2, [x5, 2486]
	bne	.L238
	add	x3, x3, 4
	add	x6, x6, 4
	cmp	x3, x7
	beq	.L239
	ldrb	w2, [x3]
	b	.L237
.L244:
	add	x4, x20, 48
	add	x3, x20, 112
.L236:
	mov	x0, x19
	add	x7, x3, 16
	mov	x6, x19
	mov	w2, 0
	b	.L237
	.p2align 3
.L239:
	add	x5, x4, 64
	.p2align 2
.L242:
	mov	x1, 0
	.p2align 2
.L241:
	ldrb	w2, [x4, x1]
	sub	x6, x29, #4032
	add	x3, x0, x1
	add	x1, x1, 1
	add	x2, x6, x2
	cmp	x1, 8
	ldrb	w2, [x2, 4088]
	strb	w2, [x3, 2502]
	bne	.L241
	add	x4, x4, 8
	add	x0, x0, 8
	cmp	x4, x5
	bne	.L242
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L255:
	ldr	x3, [x22, 104]
	mov	x2, 6
	mov	x0, x21
	add	x1, x20, 288
	blr	x3
	b	.L230
.L256:
	mov	x0, 0
	mov	w2, 67
	b	.L233
	.p2align 3
.L259:
	ldrb	w2, [x0, x3]
.L233:
	add	x1, x19, x0
	add	x3, x20, 296
	ldrb	w1, [x1, 2474]
	add	w1, w2, w1
	strb	w1, [x21, x0]
	add	x0, x0, 1
	cmp	x0, 6
	bne	.L259
	b	.L230
.L257:
	mov	x0, 0
	mov	w2, 64
	b	.L235
	.p2align 3
.L260:
	ldrb	w2, [x0, x3]
.L235:
	add	x1, x19, x0
	add	x3, x20, 304
	ldrb	w1, [x1, 2480]
	add	w1, w2, w1
	strb	w1, [x21, x0]
	add	x0, x0, 1
	cmp	x0, 6
	bne	.L260
	b	.L230
.L258:
	add	x4, x20, 128
	add	x3, x20, 192
	b	.L236
	.size	AVS2_SetupWqMatrix84DataIdx01, .-AVS2_SetupWqMatrix84DataIdx01
	.align	3
.LC44:
	.xword	.LANCHOR1
	.align	3
.LC45:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_SetupWqMatrix84
	.type	AVS2_SetupWqMatrix84, %function
AVS2_SetupWqMatrix84:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 2696]
	cbz	w0, .L266
	ldr	w0, [x19, 2700]
	cbz	w0, .L267
	cmp	w0, 1
	beq	.L268
.L261:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L267:
	ldr	w0, [x19, 88]
	cbnz	w0, .L265
	ldr	x21, .LC48
	mov	x2, 16
	ldr	x20, .LC49
	add	x0, x19, 2486
	ldr	x3, [x21, 104]
	add	x1, x20, 312
	blr	x3
	ldr	x3, [x21, 104]
	add	x1, x20, 328
	mov	x2, 64
	add	x0, x19, 2502
	blr	x3
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L266:
	ldr	x20, .LC48
	mov	x2, 16
	mov	w1, 64
	add	x0, x19, 2486
	ldr	x3, [x20, 96]
	blr	x3
	mov	x2, 64
	ldr	x3, [x20, 96]
	add	x0, x19, 2502
	mov	w1, w2
	blr	x3
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L265:
	ldr	x20, .LC48
	add	x1, x19, 108
	mov	x2, 16
	add	x0, x19, 2486
	ldr	x3, [x20, 104]
	blr	x3
	ldr	x3, [x20, 104]
	add	x1, x19, 124
	mov	x2, 64
	add	x0, x19, 2502
	blr	x3
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L268:
	mov	x0, x19
	bl	AVS2_SetupWqMatrix84DataIdx01
	b	.L261
	.size	AVS2_SetupWqMatrix84, .-AVS2_SetupWqMatrix84
	.align	3
.LC48:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC49:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_ALF_ParameterSet
	.type	AVS2_ALF_ParameterSet, %function
AVS2_ALF_ParameterSet:
	sub	sp, sp, #608
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	w24, [x19, 252]
	cmp	w24, 1
	beq	.L270
.L298:
	ldr	w0, [x19, 256]
	cmp	w0, 1
	beq	.L327
.L272:
	ldr	w0, [x19, 260]
	cmp	w0, 1
	beq	.L304
	mov	w0, 1
.L320:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	add	sp, sp, 608
	ret
	.p2align 3
.L304:
	mov	x0, x20
	add	x22, x19, 948
	mov	w21, 0
	bl	AVS2_se_v.isra.3
	mov	w3, w0
	str	w0, [x19, 944]
	b	.L309
	.p2align 3
.L307:
	bl	AVS2_se_v.isra.3
	add	w21, w21, 1
	str	w0, [x22], 4
	cmp	w21, 8
	mov	w3, w0
	beq	.L328
.L309:
	add	w1, w3, 64
	mov	x0, x20
	cmp	w1, 127
	bls	.L307
	ldr	x1, .LC69
	mov	w2, w21
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	b	.L320
	.p2align 3
.L327:
	mov	x0, x20
	add	x22, x19, 912
	mov	w21, 0
	bl	AVS2_se_v.isra.3
	mov	w3, w0
	str	w0, [x19, 908]
	b	.L303
	.p2align 3
.L301:
	bl	AVS2_se_v.isra.3
	add	w21, w21, 1
	str	w0, [x22], 4
	cmp	w21, 8
	mov	w3, w0
	beq	.L329
.L303:
	add	w1, w3, 64
	mov	x0, x20
	cmp	w1, 127
	bls	.L301
	ldr	x1, .LC65
	mov	w2, w21
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	b	.L320
	.p2align 3
.L270:
	mov	x0, x20
	bl	AVS2_ue_v.isra.2
	cmp	w0, 15
	str	w0, [x19, 264]
	bhi	.L273
	cmn	w0, #1
	mov	w25, 0
	beq	.L330
	str	w24, [x29, 108]
.L312:
	cmp	w25, wzr
	ccmp	w0, 15, 4, gt
	beq	.L277
	mov	x0, x20
	sxtw	x23, w25
	bl	AVS2_ue_v.isra.2
	sub	w2, w0, #1
	add	x1, x19, x23, lsl 2
	cmp	w2, 14
	str	w0, [x1, 268]
	bhi	.L331
.L279:
	mov	x0, x20
	lsl	x22, x23, 2
	add	x27, x22, x23, lsl 5
	add	x26, x29, 128
	bl	AVS2_se_v.isra.3
	mov	w3, w0
	add	x0, x29, 704
	add	x28, x27, 4
	add	x0, x0, x27
	mov	w21, 0
	sub	x0, x0, #4096
	add	x28, x26, x28
	str	w3, [x0, 3520]
	b	.L281
	.p2align 3
.L333:
	ldr	w2, [x24, 268]
	cmp	w2, 63
	bhi	.L284
	bl	AVS2_se_v.isra.3
	add	w21, w21, 1
	str	w0, [x28], 4
	cmp	w21, 8
	mov	w3, w0
	beq	.L332
.L281:
	cmn	w3, #64
	add	x24, x19, x22
	mov	x0, x20
	bge	.L333
.L284:
	ldr	x1, .LC59
	mov	w2, w21
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	b	.L320
	.p2align 3
.L277:
	cmp	w25, wzr
	sxtw	x23, w25
	ble	.L279
	add	x0, x19, x23, lsl 2
	ldr	w1, [x29, 108]
	str	w1, [x0, 268]
	b	.L279
	.p2align 3
.L273:
	ldr	x1, .LC53
	mov	w2, w0
	mov	w0, w24
	bl	dprint_vfmw
	mov	w0, 0
	b	.L320
.L331:
	ldr	x1, .LC55
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	b	.L320
.L330:
	strb	wzr, [x29, 112]
	mov	w0, 0
	add	x26, x29, 128
	sub	x21, x29, #3392
.L288:
	sxtw	x3, w0
	.p2align 2
.L296:
	add	x1, x21, x3
	add	x2, x21, x0, sxtw
	add	w0, w0, 1
	cmp	w0, 15
	ldrb	w1, [x1, 3504]
	strb	w1, [x2, 3504]
	ble	.L296
.L297:
	ldr	x23, .LC60
	add	x22, x19, 332
	add	x24, x19, 908
	mov	w0, 0
	add	x23, x23, 393
	ldr	x25, .LC61
	b	.L295
	.p2align 3
.L334:
	ldrb	w0, [x23], 1
.L295:
	add	x0, x21, x0, sxtw
	ldr	x3, [x25, 104]
	mov	x2, 36
	ldrb	w0, [x0, 3504]
	lsl	x1, x0, 5
	add	x1, x1, x0, lsl 2
	mov	x0, x22
	add	x1, x26, x1
	add	x22, x22, x2
	blr	x3
	cmp	x22, x24
	bne	.L334
	b	.L298
.L328:
	add	w0, w3, 1088
	cmp	w0, 2159
	bhi	.L305
	add	x0, x19, 944
	add	x3, x19, 976
	mov	w1, 64
	.p2align 2
.L306:
	ldr	w2, [x0], 4
	cmp	x3, x0
	sub	w1, w1, w2, lsl 1
	bne	.L306
	ldr	w2, [x19, 976]
	mov	w0, 1
	add	w1, w2, w1
	str	w1, [x19, 976]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	add	sp, sp, 608
	ret
.L332:
	cmn	w3, #1088
	blt	.L282
	ldr	w0, [x24, 268]
	cmp	w0, 1071
	bhi	.L282
	add	x0, x29, 128
	mov	w1, 64
	add	x27, x0, x27
	mov	x0, 0
	.p2align 2
.L283:
	ldr	w2, [x27, x0]
	add	x0, x0, 4
	cmp	x0, 32
	sub	w1, w1, w2, lsl 1
	bne	.L283
	lsl	x3, x23, 5
	add	x2, x29, 704
	add	x3, x3, x23, lsl 2
	ldr	w0, [x19, 264]
	add	x3, x2, x3
	add	w25, w25, 1
	sub	x3, x3, #4096
	add	w7, w0, 1
	cmp	w7, w25
	ldr	w2, [x3, 3552]
	add	w1, w2, w1
	str	w1, [x3, 3552]
	bhi	.L312
	strb	wzr, [x29, 112]
	cmp	w7, 1
	bls	.L310
	mov	w2, 0
	mov	w5, 0
	mov	w9, 1
	sub	x21, x29, #3392
	.p2align 2
.L289:
	add	x0, x19, x9, sxtw 2
	ldr	w8, [x0, 268]
	subs	w6, w8, #1
	beq	.L294
	mov	w0, w5
	mov	w1, 0
	b	.L293
	.p2align 3
.L290:
	ldrb	w2, [x4, 3504]
.L293:
	add	w0, w0, 1
	add	w1, w1, 1
	cmp	w1, w6
	add	x3, x21, x0, sxtw
	uxtb	w0, w0
	add	x4, x21, x0, sxtw
	strb	w2, [x3, 3504]
	bne	.L290
	add	w5, w5, 1
	sub	w8, w8, #2
	add	w5, w8, w5, uxtb
	uxtb	w5, w5
	add	x0, x21, x5, sxtw
	ldrb	w2, [x0, 3504]
.L294:
	add	w5, w5, 1
	add	w9, w9, 1
	add	w2, w2, 1
	cmp	w7, w9
	add	x0, x21, x5, sxtw
	uxtb	w5, w5
	strb	w2, [x0, 3504]
	beq	.L291
	add	x0, x21, x5, sxtw
	ldrb	w2, [x0, 3504]
	b	.L289
.L291:
	cmp	w5, 15
	mov	w0, w5
	ble	.L288
	b	.L297
.L329:
	add	w0, w3, 1088
	cmp	w0, 2159
	bhi	.L299
	add	x0, x19, 908
	add	x3, x19, 940
	mov	w1, 64
	.p2align 2
.L300:
	ldr	w2, [x0], 4
	cmp	x3, x0
	sub	w1, w1, w2, lsl 1
	bne	.L300
	ldr	w0, [x19, 940]
	add	w1, w0, w1
	str	w1, [x19, 940]
	b	.L272
.L299:
	ldr	x1, .LC63
	mov	w2, w3
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	b	.L320
.L305:
	ldr	x1, .LC67
	mov	w2, w3
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	b	.L320
.L310:
	mov	w0, 0
	sub	x21, x29, #3392
	b	.L288
.L282:
	ldr	x1, .LC57
	mov	w2, w3
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	b	.L320
	.size	AVS2_ALF_ParameterSet, .-AVS2_ALF_ParameterSet
	.align	3
.LC53:
	.xword	.LC52
	.align	3
.LC55:
	.xword	.LC54
	.align	3
.LC57:
	.xword	.LC56
	.align	3
.LC59:
	.xword	.LC58
	.align	3
.LC60:
	.xword	.LANCHOR1
	.align	3
.LC61:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC63:
	.xword	.LC62
	.align	3
.LC65:
	.xword	.LC64
	.align	3
.LC67:
	.xword	.LC66
	.align	3
.LC69:
	.xword	.LC68
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_DeriveMaxDpbNum
	.type	AVS2_DeriveMaxDpbNum, %function
AVS2_DeriveMaxDpbNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 4]
	cmp	w1, 34
	bls	.L344
	ldr	w0, [x19, 16]
	cmp	w1, 74
	ldr	w2, [x19, 24]
	add	w0, w0, 7
	add	w2, w2, 7
	and	w0, w0, -8
	and	w2, w2, -8
	mul	w2, w0, w2
	bhi	.L338
	mov	w0, 13369344
.L343:
	udiv	w0, w0, w2
	mov	w1, 16
	mov	w4, 7
	mov	w3, 10
	cmp	w0, w1
	csel	w0, w0, w1, ls
	cmp	w2, 2088960
	sub	w0, w0, #1
	uxtb	w1, w0
	mov	w0, 6
	csel	w4, w0, w4, hi
	mov	w0, 15
	csel	w2, w3, w0, hi
	cmp	w1, w4
	csel	w0, w1, w4, cs
	cmp	w0, w2
	csel	w0, w0, w2, ls
	strb	w0, [x19, 2412]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L338:
	cmp	w1, 90
	mov	w0, 56623104
	bls	.L343
	mov	w0, 213909504
	b	.L343
	.p2align 3
.L344:
	mov	w0, 15
	strb	w0, [x19, 2412]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2_DeriveMaxDpbNum, .-AVS2_DeriveMaxDpbNum
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_IntraPictureHeader
	.type	AVS2_IntraPictureHeader, %function
AVS2_IntraPictureHeader:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x19, x22, 16384
	add	x20, x22, 56
	bl	_mcount
	ldr	x24, .LC70
	ldr	w3, [x22, 12]
	mov	x2, 16
	mov	w1, 0
	add	x0, x19, 1436
	and	w3, w3, -262145
	str	w3, [x22, 12]
	ldr	x3, [x24, 96]
	blr	x3
	mov	x0, x22
	bl	AVS2_Vfmw_EpbRemove
	mov	w1, 32
	mov	x0, x20
	bl	BsGet
	mov	w1, 32
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1264]
	ldr	w0, [x22, 15084]
	cmp	w0, 72
	beq	.L419
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x19, 1272]
	beq	.L420
.L347:
	add	x21, x22, 12288
	ldr	w0, [x21, 2884]
	cbz	w0, .L421
	str	wzr, [x19, 1308]
.L350:
	add	x23, x19, 1168
	str	wzr, [x19, 1312]
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 148]
	ldr	w0, [x21, 2864]
	cmp	w0, 1
	beq	.L422
.L352:
	str	wzr, [x23, 152]
.L353:
	ldr	w0, [x21, 2860]
	cbnz	w0, .L354
	ldr	w1, [x19, 1308]
	cbz	w1, .L355
	ldr	w0, [x19, 1312]
	cmp	w0, 1
	beq	.L355
.L354:
	str	wzr, [x19, 1324]
.L356:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1328]
	cbz	w0, .L357
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtw	x1, w0
	lsl	x4, x1, 6
	ldr	x3, [x24, 104]
	add	x1, x4, x1, lsl 2
	str	w0, [x19, 1332]
	add	x1, x21, x1
	mov	x2, 68
	add	x1, x1, 3012
	add	x0, x19, 2148
	blr	x3
	ldr	w0, [x21, 2860]
	cmp	w0, 1
	beq	.L423
.L359:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1340]
	add	x1, x21, 2796
	ldr	w3, [x1, 8]
	cmp	w3, 1
	beq	.L424
.L360:
	ldr	w1, [x1, 12]
	cmp	w1, 1
	beq	.L425
	cbz	w0, .L364
.L362:
	mov	w0, 1
	str	w0, [x19, 1344]
.L397:
	mov	w1, 1
	add	x23, x19, 1168
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 180]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 184]
	ldr	w24, [x21, 2808]
	cmp	w24, 1
	beq	.L426
	mov	w0, 1
	str	w0, [x23, 188]
.L366:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1360]
	mov	w1, 7
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1364]
	add	x1, x21, 2796
	ldrb	w23, [x1, 2413]
	lsl	w23, w23, 3
	sub	w23, w23, #1
	cmp	w23, w0
	bcc	.L427
.L367:
	add	x23, x19, 1168
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 208]
	cbz	w0, .L428
.L369:
	add	x23, x19, 1168
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 232]
	cbz	w0, .L429
	stp	wzr, wzr, [x23, 236]
.L375:
	add	x23, x19, 1168
	mov	w0, 2
	strb	w0, [x23, 1]
	ldr	w0, [x21, 2876]
	cbnz	w0, .L430
	stp	wzr, wzr, [x23, 224]
.L382:
	ldr	w0, [x21, 3000]
	cmp	w0, 1
	beq	.L431
.L385:
	str	wzr, [x19, 1420]
	str	wzr, [x19, 1424]
	str	wzr, [x19, 1428]
.L388:
	ldr	w0, [x19, 1428]
	cbz	w0, .L391
.L392:
	mov	x1, x20
	add	x0, x19, 1168
	bl	AVS2_ALF_ParameterSet
	mov	w20, w0
	cbz	w0, .L432
.L391:
	add	x0, x19, 1168
	ldr	w1, [x0, 140]
	cbz	w1, .L433
	ldr	w1, [x0, 144]
	cmp	w1, 1
	beq	.L434
	mov	w1, 6
	str	w1, [x0, 132]
.L395:
	mov	w20, 1
	add	x0, x21, 2792
	strb	wzr, [x19, 1168]
	str	w20, [x19, 1304]
	bl	AVS2_SetupWqMatrix84
	ldr	w0, [x22, 12]
	orr	w0, w0, 262144
	str	w0, [x22, 12]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L357:
	add	x0, x19, 2148
	mov	x1, x20
	bl	AVS2_Head_GetRefConfigSet
	ldr	w0, [x21, 2860]
	cmp	w0, 1
	bne	.L359
.L423:
	mov	x0, x20
	bl	AVS2_ue_v.isra.2
	str	w0, [x19, 1336]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1340]
	add	x1, x21, 2796
	ldr	w3, [x1, 8]
	cmp	w3, 1
	bne	.L360
	.p2align 2
.L424:
	str	w3, [x19, 1340]
	ldr	w0, [x1, 12]
	cmp	w0, 1
	bne	.L362
.L361:
	ldr	x1, .LC74
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x19, 1340]
.L364:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1344]
	b	.L397
	.p2align 3
.L433:
	str	wzr, [x0, 132]
	b	.L395
	.p2align 3
.L355:
	mov	x0, x20
	bl	AVS2_ue_v.isra.2
	cmp	w0, 63
	str	w0, [x19, 1324]
	bls	.L356
	ldr	x1, .LC72
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 63
	str	w0, [x19, 1324]
	b	.L356
	.p2align 3
.L421:
	add	x23, x19, 1168
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x23, 140]
	bne	.L350
	mov	w1, w0
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 144]
	add	x23, x19, 1168
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 148]
	ldr	w0, [x21, 2864]
	cmp	w0, 1
	bne	.L352
	.p2align 2
.L422:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 152]
	b	.L353
	.p2align 3
.L430:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 224]
	cbnz	w0, .L435
	str	wzr, [x23, 228]
	ldr	w0, [x21, 3000]
	cmp	w0, 1
	bne	.L385
.L431:
	add	x23, x19, 1420
	add	x24, x19, 1432
.L386:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x23], 4
	cmp	x24, x23
	bne	.L386
	add	x0, x19, 1168
	ldr	w1, [x0, 252]
	cbnz	w1, .L392
	ldr	w0, [x0, 256]
	cbnz	w0, .L392
	b	.L388
	.p2align 3
.L429:
	mov	x0, x20
	bl	AVS2_se_v.isra.3
	add	w1, w0, 16
	cmp	w1, 32
	str	w0, [x23, 236]
	bhi	.L436
.L374:
	mov	x0, x20
	bl	AVS2_se_v.isra.3
	add	w1, w0, 16
	cmp	w1, 32
	str	w0, [x19, 1408]
	bls	.L375
	ldr	x1, .LC84
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x19, 1408]
	b	.L375
	.p2align 3
.L428:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 212]
	cbnz	w0, .L437
	stp	wzr, wzr, [x23, 216]
	b	.L369
	.p2align 3
.L427:
	ldr	x1, .LC76
	mov	w2, w0
	mov	w4, w23
	mov	w3, w23
	mov	w0, 1
	bl	dprint_vfmw
	str	w23, [x19, 1364]
	b	.L367
	.p2align 3
.L425:
	cbnz	w0, .L361
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1344]
	b	.L397
	.p2align 3
.L432:
	ldr	x2, .LC85
	mov	w0, 1
	ldr	x1, .LC87
	add	x2, x2, 408
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L419:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1280]
	mov	w1, 7
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1268]
	ldr	w1, [x19, 1264]
	orr	w0, w0, w1, lsl 7
	mov	w1, 1
	str	w0, [x19, 1264]
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x19, 1272]
	bne	.L347
	.p2align 2
.L420:
	mov	w1, 24
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1276]
	b	.L347
	.p2align 3
.L426:
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 188]
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	b	.L366
	.p2align 3
.L434:
	mov	w1, 5
	str	w1, [x0, 132]
	b	.L395
	.p2align 3
.L437:
	mov	x0, x20
	bl	AVS2_se_v.isra.3
	add	w1, w0, 8
	cmp	w1, 16
	str	w0, [x23, 216]
	bhi	.L438
.L371:
	mov	x0, x20
	bl	AVS2_se_v.isra.3
	add	w1, w0, 8
	cmp	w1, 16
	str	w0, [x19, 1388]
	bls	.L369
	ldr	x1, .LC80
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x19, 1388]
	b	.L369
	.p2align 3
.L436:
	ldr	x1, .LC82
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x23, 236]
	b	.L374
	.p2align 3
.L435:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x23, 228]
	beq	.L439
	cmp	w0, 2
	bne	.L382
	mov	x2, x20
	add	x1, x19, 1198
	add	x0, x19, 1182
	bl	AVS2_WeightQuantMatrix
	b	.L382
	.p2align 3
.L438:
	ldr	x1, .LC78
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x23, 216]
	b	.L371
	.p2align 3
.L439:
	mov	w1, w0
	mov	x0, x20
	bl	BsGet
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 244]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 248]
	ldr	w1, [x23, 244]
	cmp	w1, 1
	beq	.L440
.L379:
	cmp	w1, 2
	bne	.L382
	add	x23, x19, 1176
	add	x24, x19, 1182
	.p2align 2
.L383:
	mov	x0, x20
	bl	AVS2_se_v.isra.3
	strb	w0, [x23], 1
	cmp	x24, x23
	bne	.L383
	b	.L382
.L440:
	add	x23, x19, 1170
	add	x24, x19, 1176
	.p2align 2
.L380:
	mov	x0, x20
	bl	AVS2_se_v.isra.3
	strb	w0, [x23], 1
	cmp	x23, x24
	bne	.L380
	ldr	w1, [x19, 1412]
	b	.L379
	.size	AVS2_IntraPictureHeader, .-AVS2_IntraPictureHeader
	.align	3
.LC70:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC72:
	.xword	.LC71
	.align	3
.LC74:
	.xword	.LC73
	.align	3
.LC76:
	.xword	.LC75
	.align	3
.LC78:
	.xword	.LC77
	.align	3
.LC80:
	.xword	.LC79
	.align	3
.LC82:
	.xword	.LC81
	.align	3
.LC84:
	.xword	.LC83
	.align	3
.LC85:
	.xword	.LANCHOR1
	.align	3
.LC87:
	.xword	.LC86
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_InterPictureHeader
	.type	AVS2_InterPictureHeader, %function
AVS2_InterPictureHeader:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x20, x22, 56
	add	x19, x22, 16384
	bl	_mcount
	ldr	w1, [x22, 12]
	mov	x0, x22
	and	w1, w1, -262145
	str	w1, [x22, 12]
	bl	AVS2_Vfmw_EpbRemove
	mov	w1, 32
	mov	x0, x20
	bl	BsGet
	mov	w1, 32
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1264]
	ldr	w0, [x22, 15084]
	cmp	w0, 72
	beq	.L514
.L442:
	add	x23, x19, 1168
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 116]
	cbz	w0, .L515
	add	x21, x22, 12288
	cmp	w0, 1
	ldr	w0, [x21, 2884]
	ccmp	w0, wzr, 0, eq
	beq	.L516
	str	wzr, [x23, 120]
.L446:
	str	wzr, [x19, 1292]
	cbz	w0, .L517
.L447:
	add	x23, x19, 1168
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 148]
	ldr	w0, [x21, 2864]
	cmp	w0, 1
	beq	.L518
	str	wzr, [x23, 152]
.L449:
	ldr	w0, [x21, 2860]
	cbz	w0, .L519
	str	wzr, [x19, 1324]
.L451:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1328]
	cbnz	w0, .L520
	add	x0, x19, 2148
	mov	x1, x20
	bl	AVS2_Head_GetRefConfigSet
	ldr	w0, [x21, 2860]
	cmp	w0, 1
	beq	.L521
.L454:
	mov	w1, 1
	mov	x0, x20
	add	x23, x21, 2796
	bl	BsGet
	str	w0, [x19, 1340]
	ldr	w1, [x23, 8]
	cmp	w1, 1
	ccmp	w0, 1, 4, eq
	beq	.L455
	ldr	x1, .LC94
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 1
	str	w0, [x19, 1340]
	ldr	w0, [x23, 12]
	cmp	w0, 1
	beq	.L459
	.p2align 2
.L456:
	mov	w0, 1
	str	w0, [x19, 1344]
.L495:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1348]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1352]
	ldr	w24, [x21, 2808]
	cmp	w24, 1
	beq	.L522
.L460:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1360]
	mov	w1, 7
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1364]
	add	x1, x21, 2796
	ldrb	w23, [x1, 2413]
	lsl	w23, w23, 3
	sub	w23, w23, #1
	cmp	w23, w0
	bcc	.L523
.L461:
	ldr	w1, [x19, 1284]
	cmp	w1, 2
	bne	.L462
	ldr	w0, [x19, 1344]
	cmp	w0, 1
	beq	.L463
.L462:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1372]
.L463:
	mov	w1, 1
	add	x23, x19, 1168
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 128]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 208]
	cbz	w0, .L524
.L465:
	add	x23, x19, 1168
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 232]
	cbz	w0, .L525
	stp	wzr, wzr, [x23, 236]
.L471:
	add	x23, x19, 1168
	mov	w0, 2
	strb	w0, [x23, 1]
	ldr	w0, [x21, 2876]
	cbnz	w0, .L526
	str	wzr, [x23, 224]
.L478:
	ldr	w0, [x21, 3000]
	cmp	w0, 1
	beq	.L527
	str	wzr, [x19, 1420]
	str	wzr, [x19, 1424]
	str	wzr, [x19, 1428]
.L484:
	ldr	w0, [x19, 1428]
	cbnz	w0, .L488
.L487:
	add	x1, x19, 1168
	ldr	w0, [x1, 116]
	cmp	w0, 1
	beq	.L528
	cmp	w0, 2
	beq	.L496
	cmp	w0, 3
	bne	.L497
.L496:
	str	w0, [x1, 132]
	ldrb	w0, [x1, 984]
	strb	w0, [x19, 1168]
	sub	w0, w0, #1
	uxtb	w0, w0
	cmp	w0, 6
	bhi	.L529
.L494:
	add	x0, x21, 2792
	str	wzr, [x19, 1304]
	mov	w20, 1
	bl	AVS2_SetupWqMatrix84
	ldr	w0, [x22, 12]
	orr	w0, w0, 262144
	str	w0, [x22, 12]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L520:
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtw	x1, w0
	ldr	x3, .LC92
	lsl	x4, x1, 6
	add	x1, x4, x1, lsl 2
	str	w0, [x19, 1332]
	add	x1, x21, x1
	mov	x2, 68
	ldr	x3, [x3, 104]
	add	x1, x1, 3012
	add	x0, x19, 2148
	blr	x3
	ldr	w0, [x21, 2860]
	cmp	w0, 1
	bne	.L454
.L521:
	mov	x0, x20
	bl	AVS2_ue_v.isra.2
	str	w0, [x19, 1336]
	b	.L454
	.p2align 3
.L517:
	ldr	w0, [x19, 1284]
	cmp	w0, 2
	beq	.L447
	ldr	w0, [x19, 1288]
	cbnz	w0, .L447
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1292]
	b	.L447
	.p2align 3
.L527:
	add	x23, x19, 1420
	add	x24, x19, 1432
.L482:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x23], 4
	cmp	x23, x24
	bne	.L482
	add	x0, x19, 1168
	ldr	w1, [x0, 252]
	cbz	w1, .L485
.L488:
	mov	x1, x20
	add	x0, x19, 1168
	bl	AVS2_ALF_ParameterSet
	mov	w20, w0
	cbnz	w0, .L487
	ldr	x2, .LC107
	mov	w0, 1
	ldr	x1, .LC108
	add	x2, x2, 432
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L528:
	ldr	w2, [x1, 120]
	cbnz	w2, .L490
	str	w0, [x1, 132]
	ldr	w0, [x1, 984]
	strb	w0, [x19, 1168]
.L497:
	ldrb	w0, [x19, 1168]
.L536:
	sub	w0, w0, #1
	uxtb	w0, w0
	cmp	w0, 6
	bls	.L494
.L529:
	ldr	x2, .LC107
	mov	w3, 7
	ldr	x1, .LC110
	mov	w0, 1
	add	x2, x2, 432
	mov	w20, 0
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L455:
	ldr	w1, [x23, 12]
	cmp	w1, 1
	beq	.L530
	cbnz	w0, .L456
	.p2align 2
.L457:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1344]
	b	.L495
	.p2align 3
.L519:
	mov	x0, x20
	bl	AVS2_ue_v.isra.2
	cmp	w0, 63
	str	w0, [x19, 1324]
	bls	.L451
	ldr	x1, .LC91
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 63
	str	w0, [x19, 1324]
	b	.L451
	.p2align 3
.L526:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 224]
	cbnz	w0, .L531
	str	wzr, [x23, 228]
	b	.L478
	.p2align 3
.L525:
	mov	x0, x20
	bl	AVS2_se_v.isra.3
	add	w1, w0, 16
	cmp	w1, 32
	str	w0, [x23, 236]
	bhi	.L532
.L470:
	mov	x0, x20
	bl	AVS2_se_v.isra.3
	add	w1, w0, 16
	cmp	w1, 32
	str	w0, [x19, 1408]
	bls	.L471
	ldr	x1, .LC106
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x19, 1408]
	b	.L471
	.p2align 3
.L524:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 212]
	cbnz	w0, .L533
	stp	wzr, wzr, [x23, 216]
	b	.L465
	.p2align 3
.L523:
	ldr	x1, .LC98
	mov	w2, w0
	mov	w4, w23
	mov	w3, w23
	mov	w0, 1
	bl	dprint_vfmw
	str	w23, [x19, 1364]
	b	.L461
	.p2align 3
.L515:
	ldr	x1, .LC89
	mov	w2, 0
	mov	w0, 1
	mov	w20, 0
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L533:
	mov	x0, x20
	bl	AVS2_se_v.isra.3
	add	w1, w0, 8
	cmp	w1, 16
	str	w0, [x23, 216]
	bhi	.L534
.L467:
	mov	x0, x20
	bl	AVS2_se_v.isra.3
	add	w1, w0, 8
	cmp	w1, 16
	str	w0, [x19, 1388]
	bls	.L465
	ldr	x1, .LC102
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x19, 1388]
	b	.L465
	.p2align 3
.L531:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x23, 228]
	beq	.L535
	cmp	w0, 2
	bne	.L478
	mov	x2, x20
	add	x1, x19, 1198
	add	x0, x19, 1182
	bl	AVS2_WeightQuantMatrix
	b	.L478
	.p2align 3
.L532:
	ldr	x1, .LC104
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x23, 236]
	b	.L470
	.p2align 3
.L530:
	cbz	w0, .L457
.L459:
	ldr	x1, .LC96
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x19, 1340]
	b	.L457
	.p2align 3
.L514:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1280]
	mov	w1, 7
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1268]
	ldr	w1, [x19, 1264]
	orr	w0, w0, w1, lsl 7
	str	w0, [x19, 1264]
	b	.L442
	.p2align 3
.L522:
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 1356]
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	b	.L460
	.p2align 3
.L518:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 152]
	b	.L449
	.p2align 3
.L490:
	mov	w2, 4
	str	w2, [x1, 132]
	strb	w0, [x19, 1168]
	ldrb	w0, [x19, 1168]
	b	.L536
	.p2align 3
.L516:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 120]
	ldr	w0, [x21, 2884]
	b	.L446
	.p2align 3
.L534:
	ldr	x1, .LC100
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x23, 216]
	b	.L467
.L535:
	mov	w1, w0
	mov	x0, x20
	bl	BsGet
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 244]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	str	w0, [x23, 248]
	ldr	w1, [x23, 244]
	cmp	w1, 1
	beq	.L537
.L475:
	cmp	w1, 2
	bne	.L478
	add	x23, x19, 1176
	add	x24, x19, 1182
	.p2align 2
.L479:
	mov	x0, x20
	bl	AVS2_se_v.isra.3
	strb	w0, [x23], 1
	cmp	x23, x24
	bne	.L479
	b	.L478
.L537:
	add	x23, x19, 1170
	add	x24, x19, 1176
	.p2align 2
.L476:
	mov	x0, x20
	bl	AVS2_se_v.isra.3
	strb	w0, [x23], 1
	cmp	x23, x24
	bne	.L476
	ldr	w1, [x19, 1412]
	b	.L475
.L485:
	ldr	w0, [x0, 256]
	cbnz	w0, .L488
	b	.L484
	.size	AVS2_InterPictureHeader, .-AVS2_InterPictureHeader
	.align	3
.LC89:
	.xword	.LC88
	.align	3
.LC91:
	.xword	.LC90
	.align	3
.LC92:
	.xword	vfmw_Osal_Func_Ptr_S
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
.LC100:
	.xword	.LC99
	.align	3
.LC102:
	.xword	.LC101
	.align	3
.LC104:
	.xword	.LC103
	.align	3
.LC106:
	.xword	.LC105
	.align	3
.LC107:
	.xword	.LANCHOR1
	.align	3
.LC108:
	.xword	.LC86
	.align	3
.LC110:
	.xword	.LC109
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_SequenceHeader
	.type	AVS2_SequenceHeader, %function
AVS2_SequenceHeader:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 56
	add	x22, x20, 12288
	bl	_mcount
	add	x21, x22, 2796
	ldr	x1, .LC112
	mov	w0, 7
	bl	dprint_vfmw
	ldr	w2, [x20, 12]
	mov	w1, 32
	mov	x0, x19
	and	w2, w2, -65537
	str	w2, [x20, 12]
	bl	BsGet
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	and	w1, w0, -3
	cmp	w1, 32
	str	w0, [x20, 15084]
	ccmp	w0, 18, 4, ne
	bne	.L580
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	str	w0, [x21, 4]
	cbz	w0, .L581
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x21, 8]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x21, 12]
	ldr	w1, [x21, 8]
	cmp	w1, 1
	ccmp	w0, 1, 0, eq
	beq	.L582
.L542:
	add	x21, x22, 2796
	mov	w1, 14
	mov	x0, x19
	bl	BsGet
	str	w0, [x21, 16]
	cbz	w0, .L583
	mov	w1, 14
	mov	x0, x19
	bl	BsGet
	str	w0, [x21, 24]
	cbz	w0, .L584
	ldr	w1, [x21, 16]
	add	w2, w0, 7
	and	w2, w2, -8
	str	w0, [x21, 28]
	stp	w1, w2, [x21, 20]
	add	w1, w1, 7
	mov	x0, x19
	and	w1, w1, -8
	str	w1, [x21, 16]
	mov	w1, 2
	bl	BsGet
	cmp	w0, 1
	str	w0, [x21, 32]
	mov	w23, w0
	beq	.L545
	ldr	x1, .LC124
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L581:
	ldr	x1, .LC116
	mov	w2, 0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
.L540:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L580:
	ldr	x1, .LC114
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L584:
	ldr	x1, .LC122
	mov	w2, 0
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L583:
	ldr	x1, .LC120
	mov	w2, 0
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L545:
	mov	w1, 3
	mov	x0, x19
	bl	BsGet
	add	w0, w0, 3
	lsl	w2, w0, 1
	str	w2, [x21, 36]
	and	w1, w2, -3
	cmp	w1, 8
	bne	.L585
	ldr	w0, [x20, 15084]
	cmp	w0, 34
	beq	.L586
	strb	w1, [x21, 2413]
	mov	w2, w1
	str	wzr, [x21, 40]
.L550:
	ldr	x3, [x20, 40]
	mov	w1, 4
	mov	x0, x19
	str	w2, [x3, 1004]
	bl	BsGet
	str	w0, [x22, 2840]
	cbz	w0, .L587
.L551:
	mov	w1, 4
	mov	x0, x19
	bl	BsGet
	str	w0, [x22, 2844]
	mov	w1, w0
	cbz	w0, .L588
.L552:
	cmp	w1, 15
	bhi	.L553
	ldr	x0, .LC133
	add	x0, x0, 456
	ldr	w0, [x0, w1, uxtw 2]
	str	w0, [x22, 5212]
.L554:
	mov	w1, 18
	mov	x0, x19
	bl	BsGet
	str	w0, [x22, 2848]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x22, 2852]
	mov	w1, 12
	mov	x0, x19
	bl	BsGet
	str	w0, [x22, 2856]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x22, 2860]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x22, 2852]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x22, 2864]
	mov	w1, 18
	mov	x0, x19
	bl	BsGet
	str	w0, [x22, 2868]
	mov	w1, 3
	mov	x0, x19
	bl	BsGet
	str	w0, [x22, 2872]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	cmp	w0, 1
	str	w0, [x22, 2876]
	beq	.L589
.L556:
	add	x23, x22, 2796
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x23, 88]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x23, 92]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x23, 96]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x23, 100]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x23, 184]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x23, 188]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x23, 192]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x23, 196]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x23, 200]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x23, 204]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x23, 208]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x23, 56]
	mov	w1, 6
	mov	x0, x19
	bl	BsGet
	cmp	w0, 32
	str	w0, [x23, 212]
	bhi	.L558
	mov	w21, 0
	cbz	w0, .L563
	.p2align 2
.L574:
	uxtw	x0, w21
	mov	x1, x19
	lsl	x2, x0, 6
	add	w21, w21, 1
	add	x0, x2, x0, lsl 2
	add	x0, x23, x0
	add	x0, x0, 216
	bl	AVS2_Head_GetRefConfigSet
	ldr	w0, [x23, 212]
	cmp	w0, w21
	bhi	.L574
.L563:
	ldr	w0, [x22, 2860]
	cbz	w0, .L590
	str	wzr, [x22, 5188]
.L564:
	mov	x0, x19
	mov	w1, 1
	add	x19, x22, 2796
	bl	BsGet
	str	w0, [x22, 5192]
	mov	w1, 1
	mov	x0, x19
	ldr	w3, [x19, 76]
	ldr	w2, [x19, 16]
	lsl	w1, w1, w3
	sub	w2, w2, #1
	uxth	w1, w1
	add	w2, w1, w2
	uxth	w2, w2
	asr	w2, w2, w3
	strh	w2, [x22, 5204]
	ldr	w2, [x19, 24]
	sub	w2, w2, #1
	add	w1, w1, w2
	uxth	w1, w1
	asr	w1, w1, w3
	strh	w1, [x22, 5206]
	bl	AVS2_DeriveMaxDpbNum
	ldr	w0, [x20, 11308]
	cbz	w0, .L565
	ldr	w1, [x20, 11316]
	cbz	w1, .L565
	ldr	w2, [x19, 16]
	cmp	w0, w2
	beq	.L591
.L568:
	mov	w0, 1
	str	w0, [x20, 20]
.L567:
	ldr	w1, [x20, 12]
	mov	w0, 1
	orr	w1, w1, 65536
	str	w1, [x20, 12]
	b	.L540
	.p2align 3
.L585:
	ldr	x1, .LC126
	mov	w0, w23
	bl	dprint_vfmw
	mov	w0, 0
	b	.L540
	.p2align 3
.L565:
	str	wzr, [x20, 20]
	b	.L567
	.p2align 3
.L553:
	mov	w0, -1
	str	w0, [x22, 5212]
	b	.L554
	.p2align 3
.L582:
	ldr	x1, .LC118
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x21, 12]
	b	.L542
	.p2align 3
.L587:
	ldr	x1, .LC130
	mov	w0, 1
	bl	dprint_vfmw
	b	.L551
	.p2align 3
.L588:
	ldr	x1, .LC132
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x22, 2844]
	b	.L552
	.p2align 3
.L590:
	mov	w1, 5
	mov	x0, x19
	bl	BsGet
	str	w0, [x22, 5188]
	b	.L564
.L558:
	ldr	x1, .LC135
	mov	w2, w0
	mov	w3, 32
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	b	.L540
.L586:
	mov	w1, 3
	mov	x0, x19
	bl	BsGet
	add	w2, w0, 3
	ubfiz	w2, w2, 1, 7
	str	w0, [x21, 40]
	and	w0, w2, 252
	strb	w2, [x21, 2413]
	cmp	w0, 8
	ldr	w3, [x21, 36]
	bne	.L549
	cmp	w2, w3
	bcs	.L550
.L549:
	ldr	x1, .LC128
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	b	.L540
.L589:
	mov	w1, w0
	mov	x0, x19
	bl	BsGet
	cmp	w0, 1
	str	w0, [x22, 2880]
	bne	.L556
	mov	x2, x19
	add	x1, x22, 2916
	add	x0, x22, 2900
	bl	AVS2_WeightQuantMatrix
	b	.L556
.L591:
	ldr	w0, [x19, 24]
	cmp	w1, w0
	bne	.L568
	b	.L567
	.size	AVS2_SequenceHeader, .-AVS2_SequenceHeader
	.align	3
.LC112:
	.xword	.LC111
	.align	3
.LC114:
	.xword	.LC113
	.align	3
.LC116:
	.xword	.LC115
	.align	3
.LC118:
	.xword	.LC117
	.align	3
.LC120:
	.xword	.LC119
	.align	3
.LC122:
	.xword	.LC121
	.align	3
.LC124:
	.xword	.LC123
	.align	3
.LC126:
	.xword	.LC125
	.align	3
.LC128:
	.xword	.LC127
	.align	3
.LC130:
	.xword	.LC129
	.align	3
.LC132:
	.xword	.LC131
	.align	3
.LC133:
	.xword	.LANCHOR1
	.align	3
.LC135:
	.xword	.LC134
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_AllocateVHB
	.type	AVS2_AllocateVHB, %function
AVS2_AllocateVHB:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 12288
	bl	_mcount
	str	wzr, [x29, 88]
	add	x1, x20, 2796
	add	x0, x29, 72
	ldr	w6, [x1, 16]
	ldr	w3, [x1, 24]
	stp	xzr, xzr, [x0]
	ldr	w0, [x1, 8]
	cmp	w0, 1
	add	w0, w6, 15
	lsr	w2, w0, 4
	beq	.L625
	add	w3, w3, 31
	lsr	w3, w3, 5
	lsl	w3, w3, 1
.L594:
	sub	w0, w2, #2
	cmp	w0, 510
	bhi	.L595
	sub	w0, w3, #2
	cmp	w0, 510
	bhi	.L595
	ldr	x0, [x19, 40]
	ldr	w21, [x0, 772]
	ldr	w1, [x0, 28]
	cmp	w1, 25
	cbnz	w21, .L598
	beq	.L626
.L599:
	add	x0, x19, 16384
	mov	w22, 0
	ldrb	w23, [x0, 1112]
	add	w23, w23, 1
	mov	w21, w23
.L604:
	ldr	x3, .LC143
	mov	x2, 20
	mov	w1, 0
	add	x0, x29, 72
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x2, [x19, 40]
	ldr	w1, [x20, 2812]
	ldr	w0, [x20, 2820]
	ldr	w2, [x2, 28]
	stp	w1, w0, [x29, 84]
	add	w1, w1, 15
	add	w0, w0, 15
	and	w1, w1, -16
	and	w0, w0, -16
	cmp	w2, 24
	stp	w1, w0, [x29, 76]
	beq	.L610
	strb	w23, [x29, 73]
	sxtb	w21, w21
	strb	w22, [x29, 74]
.L615:
	ldr	w0, [x19, 4]
	add	x1, x29, 72
	strb	w21, [x29, 75]
	bl	FSP_ConfigInstance
	mov	w21, w0
	cbnz	w0, .L611
	ldr	x1, [x19, 40]
	add	x3, x29, 96
	ldr	w0, [x19, 4]
	ldr	w2, [x1, 20]
	ldr	w1, [x1, 16]
	str	wzr, [x3, -28]!
	bl	FSP_ConfigFrameBuf
	cmp	w0, 2
	beq	.L627
	cbnz	w0, .L628
	mov	w21, 1
	str	w21, [x19, 24]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L595:
	ldr	x1, .LC138
	mov	w0, 1
	mov	w21, 0
	bl	dprint_vfmw
.L619:
	mov	w0, w21
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L625:
	add	w3, w3, 15
	lsr	w3, w3, 4
	b	.L594
	.p2align 3
.L598:
	bne	.L599
	ldr	w4, [x0, 732]
	ldr	w5, [x0, 736]
	cmp	w6, w4
	ldr	w3, [x20, 2820]
	bhi	.L607
	cmp	w3, w5
	bhi	.L607
.L608:
	ldr	w2, [x0, 760]
	mov	w21, 1
	ldr	w1, [x0, 756]
	add	w23, w1, 2
	cbnz	w2, .L629
	ldrsb	w22, [x0, 780]
	b	.L604
	.p2align 3
.L611:
	ldr	x1, .LC147
	mov	w0, 0
	mov	w21, 0
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L626:
	ldr	w4, [x0, 732]
	ldr	w5, [x0, 736]
	cmp	w6, w4
	ldr	w3, [x20, 2820]
	bhi	.L601
	cmp	w3, w5
	bhi	.L601
	ldr	w21, [x19, 24]
	cmp	w21, 1
	bne	.L608
	b	.L619
	.p2align 3
.L610:
	strb	wzr, [x29, 73]
	mov	w21, 1
	strb	w22, [x29, 74]
	b	.L615
	.p2align 3
.L628:
	ldr	x1, .LC145
	mov	w0, 0
	bl	dprint_vfmw
	b	.L619
	.p2align 3
.L607:
	ldr	x1, .LC142
	mov	w2, w6
	mov	w0, 0
	mov	w21, 0
	bl	dprint_vfmw
	b	.L619
	.p2align 3
.L629:
	add	w1, w1, w21
	mov	w21, 17
	cmp	w1, w21
	ldrsb	w22, [x0, 780]
	csel	w21, w1, w21, le
	b	.L604
	.p2align 3
.L601:
	ldr	x1, .LC140
	mov	w2, w6
	mov	w0, 0
	bl	dprint_vfmw
	b	.L619
	.p2align 3
.L627:
	add	x0, x19, 16384
	mov	w21, 3
	add	x0, x0, 2488
	bl	ResetVoQueue
	b	.L619
	.size	AVS2_AllocateVHB, .-AVS2_AllocateVHB
	.align	3
.LC138:
	.xword	.LC137
	.align	3
.LC140:
	.xword	.LC139
	.align	3
.LC142:
	.xword	.LC141
	.align	3
.LC143:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC145:
	.xword	.LC144
	.align	3
.LC147:
	.xword	.LC146
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_OutputOneFrame
	.type	AVS2_OutputOneFrame, %function
AVS2_OutputOneFrame:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w20, [x20, 56]
	ldr	w0, [x19, 4]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	x21, x0
	cbz	x0, .L636
	ldr	w0, [x19, 4]
	mov	w2, 1
	mov	w1, w20
	bl	FSP_SetDisplay
	add	x3, x19, 16384
	ldr	w0, [x19, 4]
	mov	x4, x21
	add	x3, x3, 2488
	mov	x2, x19
	mov	w1, 18
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L632
	ldr	w0, [x19, 4]
	mov	w1, w20
	mov	w2, 0
	bl	FSP_SetDisplay
	ldr	x1, .LC151
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
.L632:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L636:
	ldr	x1, .LC149
	mov	w2, 2654
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS2_OutputOneFrame, .-AVS2_OutputOneFrame
	.align	3
.LC149:
	.xword	.LC148
	.align	3
.LC151:
	.xword	.LC150
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	AVS2_DisplayFrameInPOI, %function
AVS2_DisplayFrameInPOI:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x24, x0
	mov	x0, x30
	add	x2, x24, 16384
	mov	w19, w1
	mov	x20, x2
	str	x2, [x29, 112]
	bl	_mcount
	mov	w25, 0
	add	x0, x20, 3282
	mov	w2, 0
	add	x6, x24, 8192
	.p2align 2
.L640:
	cbnz	w19, .L638
	ldrsh	w3, [x0]
	ldrsh	w1, [x6, 2778]
	cmp	w3, w1
	bgt	.L639
.L638:
	ldrb	w3, [x0, -6]
	cbnz	w3, .L639
	sub	x1, x29, #3952
	add	w3, w25, 1
	add	x7, x1, x25, sxtw
	ldrb	w1, [x0, -4]
	cbz	w1, .L639
	strb	w2, [x7, 4080]
	uxtb	w25, w3
	.p2align 2
.L639:
	add	w2, w2, 1
	add	x0, x0, 104
	cmp	w2, 16
	bne	.L640
	cbz	w25, .L637
	ldr	x0, .LC152
	mov	w19, 0
	mov	w20, 0
	add	x0, x0, 520
	str	x0, [x29, 104]
	.p2align 2
.L642:
	cbz	w25, .L645
	mov	x1, 0
	mov	w7, 32767
	add	x6, x29, 128
	.p2align 2
.L644:
	ldrb	w2, [x6, x1]
	add	x1, x1, 1
	lsl	x0, x2, 3
	mov	x3, x2
	sub	x0, x0, x2
	lsl	x0, x0, 1
	sub	x0, x0, x2
	add	x0, x24, x0, lsl 3
	add	x0, x0, 16384
	ldrb	w2, [x0, 3276]
	cbnz	w2, .L643
	ldrsh	w0, [x0, 3274]
	cmp	w0, w7
	bgt	.L643
	mov	w7, w0
	mov	w20, w3
.L643:
	cmp	w25, w1
	bgt	.L644
	mov	w0, 32767
	cmp	w7, w0
	beq	.L645
	sxtw	x28, w20
	mov	w2, 1
	lsl	x0, x28, 3
	sub	x0, x0, x28
	lsl	x0, x0, x2
	sub	x0, x0, x28
	lsl	x0, x0, 3
	add	x1, x24, x0
	add	x27, x0, 16384
	add	x0, x1, 16384
	add	x27, x24, x27
	add	x1, x27, 3272
	str	x1, [x29, 120]
	strb	w2, [x0, 3276]
	ldr	w0, [x24, 4]
	ldr	w1, [x27, 3328]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	cbz	x0, .L673
	ldr	x0, [x0, 584]
	cmn	x0, #1
	beq	.L647
	ldr	x0, [x29, 112]
	add	x2, x24, 20480
	add	x27, x2, 844
	mov	x21, 0
	mov	x22, -2
	add	x26, x0, 3276
	b	.L650
	.p2align 3
.L649:
	add	x26, x26, 104
	cmp	x27, x26
	beq	.L674
.L650:
	ldrb	w0, [x26]
	cbnz	w0, .L649
	ldrb	w0, [x26, 2]
	cbz	w0, .L649
	ldr	w0, [x24, 4]
	ldr	w1, [x26, 52]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L649
	ldr	x1, [x0, 584]
	add	x26, x26, 104
	cmp	x1, xzr
	ccmp	x1, x22, 2, ne
	cset	w8, cc
	csel	x22, x22, x1, cs
	cmp	w8, wzr
	csel	x21, x21, x0, eq
	cmp	x27, x26
	bne	.L650
	.p2align 2
.L674:
	cbz	x21, .L647
	ldr	x2, [x21, 584]
	ldr	x1, [x23, 584]
	cmp	x2, x1
	bcc	.L675
.L647:
	ldr	x1, [x29, 120]
	mov	x0, x24
	bl	AVS2_OutputOneFrame
	lsl	x2, x28, 3
	ldr	x1, .LC156
	sub	x2, x2, x28
	mov	w0, 13
	lsl	x2, x2, 1
	sub	x2, x2, x28
	add	x2, x24, x2, lsl 3
	add	x2, x2, 16384
	ldrsh	w2, [x2, 3274]
	bl	dprint_vfmw
.L645:
	add	w19, w19, 1
	uxtb	w19, w19
	cmp	w25, w19
	bne	.L642
.L637:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L675:
	ldr	w0, [x24, 4]
	bl	IsPtsRewind
	cbnz	w0, .L647
	ldr	x0, [x23, 584]
	str	x0, [x21, 584]
	str	x22, [x23, 584]
	b	.L647
.L673:
	ldr	x1, .LC154
	mov	w0, 0
	ldr	x2, [x29, 104]
	bl	dprint_vfmw
	b	.L647
	.size	AVS2_DisplayFrameInPOI, .-AVS2_DisplayFrameInPOI
	.align	3
.LC152:
	.xword	.LANCHOR1
	.align	3
.LC154:
	.xword	.LC153
	.align	3
.LC156:
	.xword	.LC155
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_UpdateSceneBuf
	.type	AVS2_UpdateSceneBuf, %function
AVS2_UpdateSceneBuf:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 13892]
	sub	w0, w0, #5
	cmp	w0, 1
	bhi	.L676
	mov	x0, x19
	bl	AVS2_UpdateSceneBuf.part.8
.L676:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2_UpdateSceneBuf, .-AVS2_UpdateSceneBuf
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_UpdateRefBuf
	.type	AVS2_UpdateRefBuf, %function
AVS2_UpdateRefBuf:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x23, x0
	mov	x0, x30
	add	x25, x23, 12288
	add	x25, x25, 2452
	bl	_mcount
	ldr	x1, .LC159
	mov	w0, 13
	ldr	w2, [x25, 36]
	bl	dprint_vfmw
	ldr	w0, [x25, 36]
	cbz	w0, .L678
	ldr	x22, .LC161
	mov	w24, 0
	add	x21, x23, 8192
	add	x20, x23, 16384
	.p2align 2
.L684:
	add	x4, x25, x24, sxtw 2
	ldrh	w3, [x21, 2778]
	mov	x1, x22
	mov	w2, w24
	mov	w0, 13
	ldr	w19, [x4, 40]
	sub	w19, w3, w19
	sxth	w19, w19
	mov	w3, w19
	bl	dprint_vfmw
	add	x0, x20, 3278
	mov	w1, 0
	b	.L683
	.p2align 3
.L680:
	add	w1, w1, 1
	add	x0, x0, 104
	cmp	w1, 16
	beq	.L682
.L683:
	ldrsh	w2, [x0, -6]
	cmp	w2, w19
	bne	.L680
	ldrb	w2, [x0]
	and	w3, w2, 2
	cbz	w2, .L680
	ldrb	w2, [x0, 1]
	uxtb	w3, w3
	sub	w2, w2, #5
	uxtb	w2, w2
	cmp	w2, 1
	bhi	.L681
	strb	w3, [x0]
	cbnz	w3, .L680
.L681:
	sxtw	x1, w1
	mov	w2, 0
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 1
	sub	x0, x0, x1
	add	x0, x23, x0, lsl 3
	add	x0, x0, 16384
	strb	wzr, [x0, 3277]
	ldr	w1, [x0, 3328]
	ldr	w0, [x23, 4]
	bl	FSP_SetRef
	.p2align 2
.L682:
	ldr	w0, [x25, 36]
	add	w24, w24, 1
	cmp	w0, w24
	bhi	.L684
.L678:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	AVS2_UpdateRefBuf, .-AVS2_UpdateRefBuf
	.align	3
.LC159:
	.xword	.LC158
	.align	3
.LC161:
	.xword	.LC160
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_RefreshBuf
	.type	AVS2_RefreshBuf, %function
AVS2_RefreshBuf:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 16384
	mov	w19, 0
	bl	_mcount
	add	x20, x20, 3278
	b	.L695
	.p2align 3
.L693:
	cmp	w19, 16
	add	x20, x20, 104
	beq	.L697
.L695:
	sxtw	x1, w19
	ldrb	w2, [x20]
	lsl	x0, x1, 3
	add	w19, w19, 1
	sub	x0, x0, x1
	lsl	x0, x0, 1
	cbz	w2, .L693
	sub	x0, x0, x1
	add	x0, x21, x0, lsl 3
	add	x0, x0, 16384
	ldrh	w0, [x0, 3276]
	cmp	w0, 1
	bne	.L693
	and	w2, w2, 2
	uxtb	w2, w2
	strb	w2, [x20]
	cbnz	w2, .L693
	ldr	w1, [x20, 50]
	add	x20, x20, 104
	ldr	w0, [x21, 4]
	bl	FSP_SetRef
	cmp	w19, 16
	bne	.L695
.L697:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS2_RefreshBuf, .-AVS2_RefreshBuf
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_SetPicInfo
	.type	AVS2_SetPicInfo, %function
AVS2_SetPicInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x5, x19, 8192
	ldr	w0, [x5, 5716]
	ldr	w3, [x5, 5724]
	add	x6, x5, 3096
	ldr	w2, [x5, 5492]
	sxth	w7, w0
	add	w0, w3, w0
	sub	w0, w0, w2
	strh	w7, [x5, 2778]
	strh	w0, [x5, 2780]
	ldr	w0, [x19, 28]
	cmp	w0, wzr
	ble	.L700
	ldrsh	w0, [x5, 2776]
	cmp	w0, w7
	ble	.L700
	add	x0, x19, 16384
	add	x4, x19, 20480
	ldr	w6, [x6, 16]
	add	x0, x0, 3274
	add	x4, x4, 842
	.p2align 2
.L702:
	ldrh	w1, [x0]
	ldrh	w3, [x0, -2]
	sub	w1, w1, #256
	ldrh	w2, [x0, 8]
	sub	w3, w3, #256
	strh	w3, [x0, -2]
	sxth	w1, w1
	sub	w2, w2, #256
	strh	w1, [x0]
	lsl	w1, w1, 1
	strh	w2, [x0, 8]
	strh	w1, [x0, 6]
	cbnz	w6, .L701
	ldr	w2, [x5, 5756]
	add	w1, w1, 1
	cbnz	w2, .L701
	strh	w1, [x0, 6]
.L701:
	add	x0, x0, 104
	cmp	x0, x4
	bne	.L702
.L700:
	strh	w7, [x5, 2776]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2_SetPicInfo, .-AVS2_SetPicInfo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_VarifyDecMode
	.type	AVS2_VarifyDecMode, %function
AVS2_VarifyDecMode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x20, 40]
	ldr	w19, [x0, 8]
	cmp	w19, 2
	beq	.L707
	cmp	w19, 3
	beq	.L708
	cmp	w19, 1
	mov	w21, 1
	beq	.L723
.L706:
	str	w19, [x20, 32]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L723:
	ldr	w0, [x20, 13892]
	add	x22, x20, 12288
	mov	w21, w19
	add	x22, x22, 1472
	cmp	w0, 2
	beq	.L724
.L710:
	ldr	w0, [x20, 32]
	cmp	w0, 1
	beq	.L706
	mov	x0, x20
	bl	AVS2_ClearDpb
	str	w19, [x20, 32]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L708:
	str	w19, [x20, 32]
	mov	w21, 0
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L707:
	ldr	w0, [x20, 13896]
	str	w19, [x20, 32]
	cmp	w0, wzr
	cset	w21, ne
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L724:
	ldr	w0, [x22, 980]
	cbnz	w0, .L710
	mov	x0, x20
	mov	w1, 0
	bl	AVS2_DisplayFrameInPOI
	ldr	w0, [x22, 1016]
	cbnz	w0, .L725
.L711:
	mov	x0, x20
	mov	w21, 0
	bl	AVS2_RefreshBuf
	b	.L710
.L725:
	mov	x0, x20
	bl	AVS2_UpdateRefBuf
	b	.L711
	.size	AVS2_VarifyDecMode, .-AVS2_VarifyDecMode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_VarifyFrame
	.type	AVS2_VarifyFrame, %function
AVS2_VarifyFrame:
	sub	sp, sp, #80
	stp	x29, x30, [sp, 48]
	add	x29, sp, 48
	stp	x19, x20, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	add	x0, x20, 16384
	mov	w2, 0
	add	x0, x0, 3278
	b	.L731
	.p2align 3
.L727:
	add	w2, w2, 1
	add	x0, x0, 104
	cmp	w2, 16
	beq	.L740
.L731:
	ldrb	w3, [x0]
	cbz	w3, .L727
	ldr	w1, [x0, 50]
	ldr	w4, [x19, 56]
	cmp	w4, w1
	beq	.L728
	ldr	w5, [x0, 54]
	ldr	w6, [x19, 100]
	cmp	w6, w5
	beq	.L741
	ldr	w7, [x0, 74]
	ldr	w6, [x19, 80]
	cmp	w6, w7
	bne	.L727
	ldrb	w8, [x0, -1]
	cmp	w8, 1
	beq	.L734
	tbz	x3, 1, .L727
.L734:
	mov	w9, w6
	sxtw	x2, w2
.L730:
	lsl	x0, x2, 3
	sub	x0, x0, x2
	lsl	x0, x0, 1
	sub	x2, x0, x2
	mov	w0, 1
	add	x2, x20, x2, lsl 3
	add	x2, x2, 16384
	ldrb	w7, [x2, 3279]
	str	w9, [sp, 40]
	str	w1, [sp, 24]
	str	w5, [sp, 32]
	ldrsh	w1, [x2, 3272]
	str	w1, [sp, 16]
	str	w8, [sp, 8]
	str	w3, [sp]
	ldr	x1, .LC163
	ldrsh	w3, [x19]
	ldrb	w2, [x19, 7]
	ldr	w5, [x19, 60]
	bl	dprint_vfmw
	add	sp, x29, 0
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L740:
	add	sp, x29, 0
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L728:
	sxtw	x2, w2
	ldr	w6, [x19, 80]
	lsl	x0, x2, 3
	sub	x0, x0, x2
	lsl	x0, x0, 1
	sub	x0, x0, x2
	add	x0, x20, x0, lsl 3
	add	x0, x0, 16384
	ldrb	w8, [x0, 3277]
	ldr	w5, [x0, 3332]
	ldr	w9, [x0, 3352]
	b	.L730
.L741:
	sxtw	x2, w2
	ldr	w6, [x19, 80]
	lsl	x0, x2, 3
	sub	x0, x0, x2
	lsl	x0, x0, 1
	sub	x0, x0, x2
	add	x0, x20, x0, lsl 3
	add	x0, x0, 16384
	ldrb	w8, [x0, 3277]
	ldr	w9, [x0, 3352]
	b	.L730
	.size	AVS2_VarifyFrame, .-AVS2_VarifyFrame
	.align	3
.LC163:
	.xword	.LC162
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_ReleaseFrameBuf
	.type	AVS2_ReleaseFrameBuf, %function
AVS2_ReleaseFrameBuf:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 8192
	bl	_mcount
	add	x19, x19, 2776
	ldr	x0, [x20, 11144]
	cbz	x0, .L743
	ldr	w1, [x0, 56]
	mov	w2, 0
	ldr	w0, [x20, 4]
	bl	FSP_ClearLogicFs
	ldr	x0, [x19, 176]
	strb	wzr, [x0, 6]
.L743:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2_ReleaseFrameBuf, .-AVS2_ReleaseFrameBuf
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_SetupFrameBuf
	.type	AVS2_SetupFrameBuf, %function
AVS2_SetupFrameBuf:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	add	x22, x21, 8192
	bl	_mcount
	add	x3, x21, 16384
	ldr	w0, [x22, 5700]
	cmp	w0, 6
	beq	.L748
.L752:
	ldrb	w0, [x3, 3278]
	cbz	w0, .L787
	add	x0, x3, 3382
	mov	w19, 1
.L757:
	ldrb	w1, [x0]
	add	x0, x0, 104
	cbz	w1, .L749
	add	w19, w19, 1
	cmp	w19, 16
	bne	.L757
.L756:
	ldr	x2, .LC164
	mov	w0, 1
	ldr	x1, .LC166
	mov	w20, 0
	add	x2, x2, 544
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L787:
	mov	w19, 0
.L749:
	sxtw	x19, w19
	mov	w1, 1
	lsl	x0, x19, 3
	sub	x0, x0, x19
	lsl	x0, x0, 1
	sub	x19, x0, x19
	add	x19, x21, x19, lsl 3
	add	x19, x19, 16384
	add	x19, x19, 3272
	str	x19, [x22, 2952]
	ldr	w0, [x21, 4]
	bl	FSP_NewLogicFs
	mov	w23, w0
	cbz	x19, .L756
.L753:
	ldr	w0, [x21, 4]
	mov	w1, w23
	bl	FSP_GetLogicFs
	cmp	w23, wzr
	ccmp	x0, xzr, 4, ge
	beq	.L759
	add	x24, x22, 3096
	mov	x2, x24
	add	x1, x24, 2424
	bl	AVS2_ConvertHDRInfo
	ldr	w0, [x21, 4]
	mov	w1, w23
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L788
	str	w23, [x19, 56]
	mov	w1, w23
	ldr	w0, [x0, 112]
	str	w0, [x19, 88]
	ldr	w0, [x20, 116]
	str	w0, [x19, 92]
	ldr	w0, [x20, 140]
	str	w0, [x19, 96]
	ldp	w2, w0, [x20, 36]
	sub	w0, w0, w2
	str	w0, [x19, 84]
	ldr	w0, [x20, 36]
	str	w0, [x19, 60]
	ldr	w0, [x20, 40]
	str	w0, [x19, 64]
	ldr	w0, [x21, 4]
	bl	FSP_GetPmvAddr
	str	w0, [x19, 80]
	add	x1, x21, 12288
	mov	x3, -1
	ldr	w2, [x20, 212]
	str	w2, [x19, 100]
	ldr	w2, [x20, 144]
	str	w2, [x19, 68]
	ldr	w4, [x20, 36]
	ldr	w2, [x20, 44]
	sub	w2, w2, w4
	str	w2, [x19, 72]
	ldp	w4, w2, [x20, 44]
	sub	w2, w2, w4
	str	w2, [x19, 76]
	ldr	w2, [x21, 28]
	str	w2, [x20, 176]
	ldrb	w2, [x1, 1417]
	str	w2, [x20, 168]
	ldrb	w1, [x1, 1417]
	str	w1, [x20, 172]
	ldr	x1, [x21, 40]
	ldr	x1, [x1, 64]
	str	x1, [x20, 584]
	ldr	x1, [x21, 40]
	ldr	x1, [x1, 80]
	str	x1, [x20, 592]
	ldr	x1, [x21, 40]
	ldr	x1, [x1, 96]
	str	x1, [x20, 600]
	ldr	x1, [x21, 40]
	ldr	w1, [x1, 112]
	str	w1, [x20]
	ldr	x1, [x21, 40]
	ldr	w1, [x1, 116]
	str	w1, [x20, 4]
	ldr	x1, [x21, 40]
	ldr	w1, [x1, 120]
	str	w1, [x20, 8]
	ldr	x1, [x21, 40]
	ldr	w1, [x1, 136]
	str	w1, [x20, 12]
	ldr	w1, [x22, 5744]
	cmp	w1, wzr
	cset	w1, eq
	str	w1, [x20, 52]
	ldr	x1, [x21, 40]
	str	x3, [x1, 64]
	ldrsh	w1, [x22, 2778]
	strh	w1, [x19]
	ldrsh	w1, [x22, 2780]
	strh	w1, [x19, 2]
	ubfiz	w1, w1, 1, 16
	ldr	w2, [x22, 5700]
	strb	w2, [x19, 7]
	ldr	w2, [x22, 6548]
	strb	w2, [x19, 5]
	strb	wzr, [x19, 4]
	ldrh	w0, [x22, 2778]
	ldr	w2, [x22, 5724]
	strh	w1, [x19, 8]
	add	w0, w2, w0
	strh	w0, [x19, 10]
	ldr	w0, [x24, 16]
	cbnz	w0, .L783
	ldr	w0, [x22, 5756]
	cbz	w0, .L789
.L763:
	strb	w0, [x19, 12]
	mov	x1, x19
	mov	x0, x21
	ldr	w2, [x22, 5744]
	strb	w2, [x19, 13]
	ldr	w2, [x22, 5748]
	strb	w2, [x19, 14]
	strb	wzr, [x19, 6]
	bl	AVS2_VarifyFrame
	mov	w20, w0
	cbz	w0, .L790
	ldrb	w0, [x19, 7]
	cmp	w0, 4
	bls	.L791
	cmp	w0, 6
	beq	.L792
	mov	w0, 3
	strb	w0, [x19, 6]
.L766:
	ldr	w1, [x19, 56]
	mov	w2, 1
	ldr	w0, [x21, 4]
	mov	w20, w2
	bl	FSP_SetRef
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L789:
	add	w1, w1, 1
	strh	w1, [x19, 8]
.L783:
	ldr	w0, [x22, 5756]
	b	.L763
	.p2align 3
.L759:
	ldr	x2, .LC164
	mov	w0, 1
	ldr	x1, .LC168
	mov	w20, 0
	add	x2, x2, 544
	bl	dprint_vfmw
.L758:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L748:
	mov	w1, 0
	add	x0, x3, 3278
	b	.L754
	.p2align 3
.L751:
	add	w1, w1, 1
	add	x0, x0, 104
	cmp	w1, 16
	beq	.L752
.L754:
	ldrb	w2, [x0]
	cbz	w2, .L751
	ldrb	w2, [x0, 1]
	cmp	w2, 6
	bne	.L751
	ldrsh	w5, [x0, -6]
	ldrsh	w4, [x22, 2778]
	cmp	w5, w4
	bne	.L751
	sxtw	x1, w1
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 1
	sub	x1, x0, x1
	lsl	x0, x1, 3
	add	x19, x0, 16384
	add	x0, x21, x0
	add	x19, x21, x19
	add	x0, x0, 16384
	add	x19, x19, 3272
	str	x19, [x22, 2952]
	ldr	w23, [x0, 3328]
	cbnz	x19, .L753
	b	.L752
	.p2align 3
.L791:
	ldrb	w0, [x19, 5]
	mov	w1, 1
	strb	w1, [x19, 6]
	mov	w20, 1
	cbnz	w0, .L766
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L788:
	ldr	x2, .LC164
	mov	w0, 1
	ldr	x1, .LC170
	mov	w20, 0
	add	x2, x2, 544
	bl	dprint_vfmw
	b	.L758
	.p2align 3
.L790:
	ldrsh	w2, [x19]
	mov	w0, 1
	ldr	x1, .LC172
	bl	dprint_vfmw
	mov	x0, x21
	bl	AVS2_ReleaseFrameBuf
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L792:
	mov	w0, 2
	strb	w0, [x19, 6]
	b	.L766
	.size	AVS2_SetupFrameBuf, .-AVS2_SetupFrameBuf
	.align	3
.LC164:
	.xword	.LANCHOR1
	.align	3
.LC166:
	.xword	.LC165
	.align	3
.LC168:
	.xword	.LC167
	.align	3
.LC170:
	.xword	.LC169
	.align	3
.LC172:
	.xword	.LC171
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_SetupRefFrame
	.type	AVS2_SetupRefFrame, %function
AVS2_SetupRefFrame:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	add	x24, x19, 8192
	bl	_mcount
	add	x0, x24, 2960
	add	x1, x24, 3080
	.p2align 2
.L794:
	str	xzr, [x0], 8
	cmp	x0, x1
	bne	.L794
	add	x26, x19, 12288
	ldr	w0, [x26, 1604]
	cmp	w0, 4
	beq	.L831
	add	x23, x26, 2452
	ldr	w3, [x23, 4]
	sub	w1, w3, #1
	cmp	w1, 6
	bhi	.L799
	cbz	w3, .L800
	ldr	x20, .LC178
	mov	w21, 0
	mov	w22, 0
	add	x25, x19, 16384
	.p2align 2
.L805:
	add	x0, x23, x22, sxtw 2
	ldrsh	w2, [x24, 2778]
	ldr	w3, [x0, 8]
	sub	w3, w2, w3
	sxth	w3, w3
	cmp	w2, w3
	beq	.L801
	add	x0, x25, 3278
	mov	w1, 0
	b	.L804
	.p2align 3
.L802:
	add	w1, w1, 1
	add	x0, x0, 104
	cmp	w1, 16
	beq	.L803
.L804:
	ldrb	w4, [x0]
	tbz	x4, 0, .L802
	ldrsh	w4, [x0, -6]
	cmp	w4, w3
	bne	.L802
	ldrb	w4, [x0, -1]
	cmp	w4, 1
	bne	.L802
	ldrb	w4, [x0, 1]
	cmp	w4, 6
	beq	.L802
	cmp	w1, 15
	sxtw	x1, w1
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 1
	sub	x0, x0, x1
	add	x1, x24, x21, uxtw 3
	add	w21, w21, 1
	add	x0, x19, x0, lsl 3
	add	x0, x0, 16384
	add	x0, x0, 3272
	str	x0, [x1, 2960]
	bgt	.L803
	.p2align 2
.L801:
	ldr	w3, [x23, 4]
	add	w22, w22, 1
	cmp	w3, w22
	bhi	.L805
.L833:
	cmp	w3, w21
	bhi	.L806
	ldr	w0, [x26, 1604]
.L800:
	and	w0, w0, -3
	cmp	w0, 1
	bne	.L808
	ldr	w0, [x26, 1596]
	cmp	w0, 1
	beq	.L832
.L808:
	mov	w0, 1
.L797:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L803:
	mov	x1, x20
	mov	w0, 1
	add	w22, w22, 1
	bl	dprint_vfmw
	ldr	w3, [x23, 4]
	cmp	w3, w22
	bhi	.L805
	b	.L833
.L831:
	add	x0, x19, 16384
	mov	w1, 0
	add	x0, x0, 3278
	.p2align 2
.L798:
	ldrb	w2, [x0]
	tbz	x2, 1, .L796
	ldrb	w2, [x0, 1]
	sub	w2, w2, #5
	uxtb	w2, w2
	cmp	w2, 1
	bls	.L834
.L796:
	add	w1, w1, 1
	add	x0, x0, 104
	cmp	w1, 16
	bne	.L798
	ldr	x1, .LC176
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L806:
	ldr	x1, .LC180
	mov	w2, w21
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L832:
	sub	w0, w3, #1
	add	x1, x19, 16384
	add	x2, x19, 20480
	add	x1, x1, 3272
	add	x0, x24, x0, lsl 3
	add	x2, x2, 840
	add	x0, x0, 2952
	b	.L810
	.p2align 3
.L809:
	add	x1, x1, 104
	cmp	x2, x1
	beq	.L808
.L810:
	ldrb	w3, [x1, 6]
	tbz	x3, 1, .L809
	ldrb	w3, [x1, 7]
	sub	w3, w3, #5
	uxtb	w3, w3
	cmp	w3, 1
	bhi	.L809
	str	x1, [x0, 8]
	b	.L809
.L799:
	ldr	x2, .LC181
	mov	w4, 7
	ldr	x1, .LC183
	mov	w0, 1
	add	x2, x2, 568
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L834:
	sxtw	x1, w1
	mov	w0, 1
	lsl	x2, x1, 3
	sub	x2, x2, x1
	lsl	x2, x2, 1
	sub	x1, x2, x1
	add	x1, x19, x1, lsl 3
	add	x1, x1, 16384
	add	x1, x1, 3272
	str	x1, [x24, 2960]
	b	.L797
	.size	AVS2_SetupRefFrame, .-AVS2_SetupRefFrame
	.align	3
.LC176:
	.xword	.LC175
	.align	3
.LC178:
	.xword	.LC177
	.align	3
.LC180:
	.xword	.LC179
	.align	3
.LC181:
	.xword	.LANCHOR1
	.align	3
.LC183:
	.xword	.LC182
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_SetupHalConfig
	.type	AVS2_SetupHalConfig, %function
AVS2_SetupHalConfig:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	add	x19, x21, 608
	add	x20, x21, 8192
	bl	_mcount
	ldr	x1, [x21, 40]
	add	x0, x20, 3096
	ldr	x22, [x20, 2960]
	ldr	w3, [x1, 640]
	strb	w3, [x19, 2]
	ldr	w3, [x1, 672]
	strb	w3, [x19, 4]
	ldr	w1, [x1, 692]
	strb	w1, [x19, 1]
	ldr	x2, [x20, 2952]
	ldr	w1, [x2, 60]
	str	w1, [x19, 92]
	ldr	w1, [x2, 88]
	str	w1, [x19, 260]
	ldr	w1, [x2, 92]
	str	w1, [x19, 264]
	ldr	w1, [x2, 84]
	str	w1, [x19, 268]
	ldr	w1, [x2, 96]
	str	w1, [x19, 272]
	ldr	w1, [x2, 100]
	str	w1, [x19, 96]
	ldr	w1, [x2, 68]
	str	w1, [x19, 276]
	ldr	w1, [x2, 72]
	str	w1, [x19, 280]
	ldr	w1, [x2, 76]
	str	w1, [x19, 284]
	ldr	w1, [x20, 3116]
	str	w1, [x19, 100]
	ldr	w1, [x20, 3124]
	str	w1, [x19, 104]
	ldrh	w1, [x20, 5508]
	str	w1, [x19, 108]
	ldrh	w1, [x20, 5510]
	str	w1, [x19, 112]
	ldr	w1, [x20, 5756]
	str	w1, [x19, 120]
	ldrb	w3, [x0, 2417]
	strb	w3, [x21, 608]
	ldr	w3, [x20, 5764]
	str	w3, [x19, 124]
	ldr	w3, [x20, 5760]
	str	w3, [x19, 128]
	ldr	w3, [x20, 5700]
	str	w3, [x19, 132]
	ldr	w0, [x20, 3112]
	cmp	w0, 1
	beq	.L856
	str	wzr, [x19, 136]
.L838:
	ldr	w1, [x20, 5496]
	add	x0, x20, 3096
	str	w1, [x19, 140]
	ldr	w1, [x20, 3288]
	str	w1, [x19, 144]
	ldr	w1, [x20, 3132]
	str	w1, [x19, 148]
	ldr	w1, [x20, 3292]
	str	w1, [x19, 152]
	ldr	w1, [x20, 3192]
	str	w1, [x19, 156]
	ldr	w1, [x20, 3200]
	str	w1, [x19, 160]
	ldr	w1, [x20, 3196]
	str	w1, [x19, 164]
	ldrb	w1, [x0, 2472]
	str	w1, [x19, 168]
	ldr	w1, [x20, 3284]
	str	w1, [x19, 172]
	ldr	w1, [x20, 5824]
	ldr	w4, [x20, 5828]
	ldr	w3, [x20, 5820]
	lsl	w1, w1, 1
	orr	w1, w1, w4, lsl 2
	orr	w1, w1, w3
	str	w1, [x19, 176]
	ldr	w1, [x20, 3300]
	str	w1, [x19, 180]
	ldr	w1, [x20, 3304]
	str	w1, [x19, 184]
	ldr	w1, [x20, 3176]
	str	w1, [x19, 116]
	ldr	w1, [x20, 3296]
	str	w1, [x19, 188]
	ldr	w0, [x20, 3180]
	str	w0, [x19, 192]
	ldr	w0, [x20, 5792]
	str	w0, [x19, 208]
	ldr	w0, [x20, 5808]
	str	w0, [x19, 196]
	ldr	w0, [x20, 5804]
	str	w0, [x19, 200]
	ldr	w0, [x20, 5800]
	str	w0, [x19, 204]
	ldr	w0, [x20, 5788]
	str	w0, [x19, 212]
	ldr	w0, [x20, 5784]
	str	w0, [x19, 216]
	ldr	w0, [x20, 5780]
	str	w0, [x19, 220]
	ldr	w0, [x20, 5776]
	str	w0, [x19, 224]
	ldrb	w0, [x2, 12]
	str	w0, [x19, 228]
	ldrb	w0, [x2, 13]
	str	w0, [x19, 232]
	ldrb	w0, [x2, 14]
	str	w0, [x19, 236]
	ldr	w0, [x20, 5704]
	cbnz	w0, .L839
	add	x4, x20, 2968
	mov	x0, x21
	mov	x1, x22
	mov	w3, 7
	b	.L842
	.p2align 3
.L857:
	ldr	x1, [x4], 8
.L842:
	subs	w3, w3, #1
	cbz	x1, .L840
	ldrb	w5, [x1, 12]
	str	w5, [x0, 924]
	ldrb	w5, [x1, 13]
	str	w5, [x0, 952]
	ldrb	w5, [x1, 14]
	str	w5, [x0, 980]
	ldr	w1, [x1, 60]
	str	w1, [x0, 1008]
.L840:
	add	x0, x0, 4
	bne	.L857
	ldr	w0, [x2, 80]
	str	w0, [x19, 240]
	cbz	x22, .L843
.L859:
	ldr	w0, [x22, 80]
	str	w0, [x19, 244]
.L844:
	ldr	x23, .LC184
	add	x24, x20, 3096
	mov	x2, 576
	add	x1, x24, 2804
	add	x0, x21, 1100
	ldr	x3, [x23, 104]
	blr	x3
	ldr	x3, [x23, 104]
	mov	x2, 72
	add	x1, x24, 3380
	add	x0, x21, 1676
	blr	x3
	ldr	w0, [x20, 5704]
	cbz	w0, .L858
	ldrb	w0, [x24, 2473]
	str	w0, [x19, 248]
	ldr	w0, [x24, 212]
	str	w0, [x19, 252]
	ldr	w0, [x20, 5692]
	str	w0, [x19, 256]
.L846:
	ldr	x3, [x23, 96]
	mov	x2, 28
	mov	w1, 0
	add	x0, x21, 896
	blr	x3
.L847:
	add	x20, x20, 3096
	ldr	x3, [x23, 104]
	add	x1, x20, 2486
	mov	x2, 16
	add	x0, x21, 613
	blr	x3
	ldr	x3, [x23, 104]
	add	x1, x20, 2502
	mov	x2, 64
	add	x0, x21, 629
	blr	x3
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L839:
	ldrb	w0, [x2, 12]
	str	w0, [x19, 316]
	ldrb	w0, [x2, 13]
	str	w0, [x19, 344]
	ldrb	w0, [x2, 14]
	str	w0, [x19, 372]
	ldr	w0, [x2, 60]
	str	w0, [x19, 400]
	ldr	w0, [x2, 80]
	str	w0, [x19, 240]
	cbnz	x22, .L859
.L843:
	str	wzr, [x19, 244]
	b	.L844
	.p2align 3
.L858:
	ldr	x3, [x23, 104]
	mov	x2, 14
	add	x1, x20, 2788
	add	x0, x21, 1036
	blr	x3
	ldr	x3, [x23, 104]
	mov	x2, 14
	add	x1, x20, 2816
	add	x0, x21, 1052
	blr	x3
	ldr	x3, [x23, 104]
	mov	x2, 14
	add	x1, x20, 2802
	add	x0, x21, 1068
	blr	x3
	ldr	x3, [x23, 104]
	add	x1, x20, 2830
	mov	x2, 14
	add	x0, x21, 1084
	blr	x3
	strh	wzr, [x19, 442]
	strh	wzr, [x19, 458]
	strh	wzr, [x19, 474]
	strh	wzr, [x19, 490]
	ldrb	w1, [x24, 2473]
	ldr	w0, [x20, 5704]
	str	w1, [x19, 248]
	ldr	w1, [x24, 212]
	str	w1, [x19, 252]
	ldr	w1, [x20, 5692]
	str	w1, [x19, 256]
	cbnz	w0, .L846
	ldrb	w0, [x22, 46]
	str	w0, [x19, 288]
	ldrb	w0, [x22, 47]
	str	w0, [x19, 292]
	ldrb	w0, [x22, 48]
	str	w0, [x19, 296]
	ldrb	w0, [x22, 49]
	str	w0, [x19, 300]
	ldrb	w0, [x22, 50]
	str	w0, [x19, 304]
	ldrb	w0, [x22, 51]
	str	w0, [x19, 308]
	ldrb	w0, [x22, 52]
	str	w0, [x19, 312]
	b	.L847
	.p2align 3
.L856:
	mov	w0, 2
	cmp	w1, 1
	csel	w1, w1, w0, eq
	str	w1, [x19, 136]
	b	.L838
	.size	AVS2_SetupHalConfig, .-AVS2_SetupHalConfig
	.align	3
.LC184:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_CalDistance
	.type	AVS2_CalDistance, %function
AVS2_CalDistance:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x5, x19, 8192
	add	x1, x5, 2776
	ldr	x0, [x1, 184]
	cbz	x0, .L886
	add	x7, x19, 12288
	ldrb	w3, [x7, 1472]
	sub	w0, w3, #1
	uxtb	w0, w0
	cmp	w0, 6
	bhi	.L862
	ldr	x3, [x1, 176]
	mov	w2, 1
	mov	w1, 16384
	add	x6, x3, 18
	add	x8, x3, 32
	mov	x0, x6
.L865:
	strh	w2, [x0]
	add	x0, x0, 2
	strh	w1, [x0, 12]
	cmp	x0, x8
	bne	.L865
	ldrb	w2, [x7, 1472]
	add	x0, x7, 1472
	cbz	w2, .L866
	ldrsh	w10, [x3, 2]
	mov	w4, 0
	add	x9, x5, 2776
	mov	w12, 1
	mov	w11, 16384
	b	.L871
	.p2align 3
.L888:
	ldrsh	w0, [x3, 8]
	add	x13, x3, x2, lsl 1
	ldrsh	w1, [x1, 8]
	sub	w1, w0, w1
	add	w1, w1, 512
	asr	w0, w1, 31
	lsr	w0, w0, 23
	add	w1, w1, w0
	and	w1, w1, 511
	sub	w0, w1, w0
	mov	w1, 16384
	sxth	w0, w0
	strh	w0, [x14, 18]
	cbz	w0, .L869
.L889:
	sdiv	w0, w11, w0
	add	x2, x2, 16
	add	w4, w4, 1
	sxth	w1, w0
	strh	w1, [x3, x2, lsl 1]
	ldrb	w2, [x7, 1472]
	cmp	w2, w4
	bls	.L887
.L871:
	uxtw	x2, w4
	add	x0, x3, x2
	add	x1, x9, x2, lsl 3
	add	x14, x3, x2, lsl 1
	ldr	x1, [x1, 184]
	ldrb	w13, [x1, 12]
	strb	w13, [x0, 46]
	ldrsh	w0, [x1, 2]
	cmp	w0, w10
	blt	.L888
	ldrsh	w0, [x1, 8]
	add	x13, x3, x2, lsl 1
	ldrsh	w1, [x3, 8]
	sub	w1, w0, w1
	add	w1, w1, 512
	asr	w0, w1, 31
	lsr	w0, w0, 23
	add	w1, w1, w0
	and	w1, w1, 511
	sub	w0, w1, w0
	mov	w1, 16384
	sxth	w0, w0
	strh	w0, [x14, 18]
	cbnz	w0, .L889
.L869:
	add	x2, x2, 16
	strh	w12, [x13, 18]
	add	w4, w4, 1
	strh	w1, [x3, x2, lsl 1]
	ldrb	w2, [x7, 1472]
	cmp	w2, w4
	bhi	.L871
.L887:
	ldr	w0, [x7, 1596]
	ldr	x1, [x5, 2960]
	cmp	w0, 1
	beq	.L890
.L872:
	add	x0, x5, 2788
	add	x1, x1, 18
	.p2align 2
.L876:
	ldrsh	w2, [x6]
	add	x1, x1, 2
	strh	w2, [x0]
	add	x0, x0, 2
	add	x6, x6, 2
	ldrsh	w2, [x1, -2]
	cmp	x6, x8
	strh	w2, [x0, 26]
	ldrsh	w2, [x6, 12]
	strh	w2, [x0, 12]
	ldrsh	w2, [x1, 12]
	strh	w2, [x0, 40]
	bne	.L876
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L886:
	add	x19, x19, 12288
	ldrb	w3, [x19, 1472]
	.p2align 2
.L862:
	ldr	x2, .LC185
	mov	w4, 7
	ldr	x1, .LC187
	mov	w0, 1
	add	x2, x2, 592
	bl	dprint_vfmw
.L860:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L890:
	cmp	w2, 1
	beq	.L891
.L873:
	add	x0, x5, 2788
	add	x1, x1, 18
	.p2align 2
.L875:
	ldrsh	w3, [x6]
	add	x1, x1, 2
	strh	w3, [x0]
	add	x0, x0, 2
	add	x6, x6, 2
	ldrsh	w3, [x1, -2]
	cmp	x6, x8
	strh	w3, [x0, 26]
	ldrsh	w3, [x6, 12]
	strh	w3, [x0, 12]
	ldrsh	w3, [x1, 12]
	strh	w3, [x0, 40]
	bne	.L875
	add	x0, x19, x2, uxtb 1
	mov	w1, 16384
	add	x0, x0, 8192
	mov	w2, 1
	strh	w1, [x0, 2800]
	strh	w2, [x0, 2786]
	b	.L860
.L866:
	ldr	w0, [x0, 124]
	ldr	x1, [x5, 2960]
	cmp	w0, 1
	bne	.L872
	b	.L873
.L891:
	add	x1, x5, 2788
	add	x0, x5, 2802
	mov	w3, 16384
	.p2align 2
.L874:
	strh	w2, [x1]
	add	x1, x1, 2
	strh	w2, [x1, 26]
	strh	w3, [x1, 12]
	strh	w3, [x1, 40]
	cmp	x1, x0
	bne	.L874
	b	.L860
	.size	AVS2_CalDistance, .-AVS2_CalDistance
	.align	3
.LC185:
	.xword	.LANCHOR1
	.align	3
.LC187:
	.xword	.LC186
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_SetImgFormat
	.type	AVS2_SetImgFormat, %function
AVS2_SetImgFormat:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 8192
	bl	_mcount
	ldr	w0, [x20, 3108]
	ldr	w22, [x20, 5520]
	cmp	w0, 1
	ldr	w23, [x20, 5700]
	beq	.L900
	ldr	w0, [x20, 5740]
	cmp	w0, 1
	cset	w26, ne
.L893:
	ldr	w0, [x20, 3144]
	mov	w25, 0
	ldr	w24, [x20, 5748]
	sub	w0, w0, #1
	cmp	w0, 3
	bhi	.L894
	ldr	x1, .LC188
	add	x1, x1, 616
	ldr	w25, [x1, w0, uxtw 2]
.L894:
	ldr	x1, [x20, 2952]
	ldr	w0, [x21, 4]
	ldr	w1, [x1, 56]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L905
	mov	w3, 3
	cbnz	w26, .L906
.L897:
	ldr	w0, [x19, 64]
	mov	w1, w25
	bfi	w0, w25, 14, 3
	str	w0, [x19, 64]
	lsr	w2, w0, 8
	bfi	w0, w22, 5, 3
	bfi	w2, w24, 4, 2
	and	w0, w0, -29
	bfi	w2, w3, 2, 2
	bfi	w0, w23, 0, 2
	bfi	w2, w26, 0, 2
	strb	w0, [x19, 64]
	strb	w2, [x19, 65]
	mov	x0, x19
	ldrb	w2, [x19, 66]
	ldr	x3, [x20, 2952]
	ldrb	w3, [x3, 15]
	bfi	w2, w3, 1, 1
	strb	w2, [x19, 66]
	ldr	w2, [x20, 2784]
	str	w2, [x19, 152]
	stp	w23, w23, [x19, 56]
	bl	SetAspectRatio
	ldr	x1, [x20, 2952]
	ldrb	w1, [x1, 16]
	str	w1, [x19, 120]
	ldr	x1, [x21, 40]
	ldr	w1, [x1, 644]
	str	w1, [x19, 124]
	ldr	x1, [x21, 40]
	ldr	w1, [x1, 648]
	str	w1, [x19, 128]
	ldr	x1, [x21, 40]
	ldr	w1, [x1, 652]
	str	w1, [x19, 132]
	ldr	w1, [x20, 3116]
	str	w1, [x19, 68]
	ldr	w1, [x20, 3124]
	str	w1, [x19, 72]
	ldr	w2, [x20, 3120]
	str	w2, [x19, 76]
	ldr	w0, [x20, 3128]
	str	w0, [x19, 80]
	ldr	w0, [x20, 5516]
	str	w0, [x19, 108]
	ldr	x0, [x21, 40]
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L907
.L898:
	mov	w0, 18
	str	w0, [x19, 296]
	mov	w0, 4
	mov	w1, 8
	ldr	w3, [x20, 5744]
	mov	w2, 1
	str	w1, [x19, 300]
	cmp	w3, 1
	strb	w2, [x19, 291]
	csel	w0, w0, wzr, ne
	strb	w2, [x19, 289]
	strb	w0, [x19, 284]
	str	w1, [x19, 304]
	str	w1, [x19, 308]
.L892:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L900:
	mov	w26, 0
	b	.L893
	.p2align 3
.L907:
	ldr	w3, [x19, 112]
	add	w1, w1, 15
	lsr	w0, w1, 4
	ldr	w2, [x19, 36]
	lsl	w1, w3, 4
	ldr	x4, [x19, 504]
	add	w5, w3, w2
	mul	w1, w0, w1
	add	w0, w1, w2
	str	w0, [x19, 40]
	add	w3, w3, w0
	add	x1, x4, x1, sxtw
	stp	w2, w0, [x19, 20]
	stp	w5, w3, [x19, 28]
	str	x1, [x19, 512]
	b	.L898
	.p2align 3
.L906:
	ldr	w0, [x20, 5756]
	mov	w3, 2
	cmp	w0, 1
	csinc	w3, w3, wzr, ne
	b	.L897
	.p2align 3
.L905:
	ldr	x1, .LC190
	mov	w2, 3585
	mov	w0, 0
	bl	dprint_vfmw
	b	.L892
	.size	AVS2_SetImgFormat, .-AVS2_SetImgFormat
	.align	3
.LC188:
	.xword	.LANCHOR1
	.align	3
.LC190:
	.xword	.LC189
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_SimpleDirectProcess
	.type	AVS2_SimpleDirectProcess, %function
AVS2_SimpleDirectProcess:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x19, [x20, 11144]
	mov	w1, 1
	ldrb	w0, [x19, 7]
	strb	w1, [x19, 4]
	cmp	w0, 6
	beq	.L911
	mov	x1, x19
	mov	x0, x20
	bl	AVS2_OutputOneFrame
.L910:
	strb	wzr, [x19, 5]
	mov	w2, 0
	ldr	w1, [x19, 56]
	ldr	w0, [x20, 4]
	bl	FSP_SetRef
	strb	wzr, [x19, 6]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L911:
	ldr	w1, [x19, 56]
	mov	w2, 0
	ldr	w0, [x20, 4]
	bl	FSP_SetDisplay
	b	.L910
	.size	AVS2_SimpleDirectProcess, .-AVS2_SimpleDirectProcess
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_DispOrderProcess
	.type	AVS2_DispOrderProcess, %function
AVS2_DispOrderProcess:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 8192
	add	x1, x1, 2776
	ldr	x0, [x1, 176]
	ldrb	w2, [x0, 7]
	cmp	w2, 6
	beq	.L915
	ldrb	w2, [x19, 1]
	cbnz	w2, .L914
	ldr	x2, [x19, 40]
	ldr	w2, [x2, 12]
	cbz	w2, .L916
.L914:
	mov	x0, x19
	mov	w1, 0
	bl	AVS2_DisplayFrameInPOI
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L916:
	mov	w20, 1
	strb	w20, [x0, 4]
	mov	x0, x19
	ldr	x1, [x1, 176]
	bl	AVS2_OutputOneFrame
	strb	w20, [x19, 1]
	mov	x0, x19
	mov	w1, 0
	bl	AVS2_DisplayFrameInPOI
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L915:
	mov	w2, 1
	strb	w2, [x0, 4]
	mov	w2, 0
	ldr	x1, [x1, 176]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 56]
	bl	FSP_SetDisplay
	b	.L914
	.size	AVS2_DispOrderProcess, .-AVS2_DispOrderProcess
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_DecOrderProcess
	.type	AVS2_DecOrderProcess, %function
AVS2_DecOrderProcess:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19, 11144]
	mov	w2, 1
	ldrb	w0, [x1, 7]
	strb	w2, [x1, 4]
	cmp	w0, 6
	beq	.L920
	mov	x0, x19
	bl	AVS2_OutputOneFrame
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L920:
	ldr	w0, [x19, 4]
	mov	w2, 0
	ldr	w1, [x1, 56]
	bl	FSP_SetDisplay
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2_DecOrderProcess, .-AVS2_DecOrderProcess
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_UpdateFrameBuf
	.type	AVS2_UpdateFrameBuf, %function
AVS2_UpdateFrameBuf:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 13892]
	sub	w0, w0, #5
	cmp	w0, 1
	bls	.L923
	mov	x0, x19
	bl	AVS2_UpdateRefBuf
	mov	x0, x19
	bl	AVS2_RefreshBuf
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L923:
	mov	x0, x19
	bl	AVS2_UpdateSceneBuf.part.8
	mov	x0, x19
	bl	AVS2_UpdateRefBuf
	mov	x0, x19
	bl	AVS2_RefreshBuf
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2_UpdateFrameBuf, .-AVS2_UpdateFrameBuf
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_FlushFrameInDpb
	.type	AVS2_FlushFrameInDpb, %function
AVS2_FlushFrameInDpb:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 1
	mov	x0, x19
	bl	AVS2_DisplayFrameInPOI
	add	x1, x19, 16384
	add	x2, x19, 20480
	add	x1, x1, 3278
	add	x2, x2, 846
	b	.L926
	.p2align 3
.L925:
	add	x1, x1, 104
	cmp	x1, x2
	beq	.L928
.L926:
	ldrb	w0, [x1, -2]
	cmp	w0, 1
	bne	.L925
	ldrb	w0, [x1, -1]
	cbnz	w0, .L925
	ldrb	w0, [x1]
	add	x1, x1, 104
	and	w0, w0, 2
	strb	w0, [x1, -104]
	cmp	x1, x2
	bne	.L926
.L928:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2_FlushFrameInDpb, .-AVS2_FlushFrameInDpb
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_FlushPreSizeImg
	.type	AVS2_FlushPreSizeImg, %function
AVS2_FlushPreSizeImg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x3, x29, 48
	ldr	w0, [x19, 4]
	add	x2, x29, 40
	add	x1, x29, 36
	stp	wzr, wzr, [x29, 36]
	str	wzr, [x3, -4]!
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x19, 40]
	ldr	w0, [x0, 772]
	cmp	w0, 1
	beq	.L934
	mov	w0, 1
.L930:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L934:
	ldr	w1, [x29, 44]
	mov	w0, 0
	cmp	w1, wzr
	bgt	.L930
	ldr	w1, [x29, 40]
	cmp	w1, 32
	bgt	.L930
	ldr	x0, [x19, 48]
	cmp	x0, xzr
	cset	w0, eq
	b	.L930
	.size	AVS2_FlushPreSizeImg, .-AVS2_FlushPreSizeImg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_ArrangeFrameBuf
	.type	AVS2_ArrangeFrameBuf, %function
AVS2_ArrangeFrameBuf:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 20]
	cbz	w0, .L936
	mov	x0, x19
	bl	AVS2_FlushPreSizeImg
	cbnz	w0, .L937
.L939:
	mov	w0, 3
.L938:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L937:
	mov	x0, x19
	bl	AVS2_ClearDpb
	add	x1, x19, 16384
	ldr	w0, [x19, 4]
	add	x1, x1, 2488
	bl	FSP_ClearNotInVoQueue
	str	wzr, [x19, 20]
	.p2align 2
.L936:
	mov	x0, x19
	str	wzr, [x19, 24]
	bl	AVS2_AllocateVHB
	cmp	w0, 3
	mov	w1, w0
	beq	.L939
	mov	w0, 1
	cbnz	w1, .L938
	ldr	x1, .LC193
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2_ArrangeFrameBuf, .-AVS2_ArrangeFrameBuf
	.align	3
.LC193:
	.xword	.LC192
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_ParseHeader
	.type	AVS2_ParseHeader, %function
AVS2_ParseHeader:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 56
	bl	_mcount
	mov	w1, 32
	mov	x0, x20
	str	wzr, [x19, 8]
	bl	BsShow
	uxtb	w21, w0
	sub	w0, w21, #176
	cmp	w0, 78
	bls	.L990
.L948:
	cmp	w21, 143
	bhi	.L961
	ldr	w1, [x19, 12]
	mov	w0, 327680
	and	w0, w1, w0
	cmp	w0, 327680
	beq	.L991
.L961:
	mov	x0, x19
	mov	w20, 0
	bl	AVS2_ClearPacket
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L990:
	ldr	x1, .LC194
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx950
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx950:
	.section	.rodata
	.align	0
	.align	2
.L950:
	.byte	(.L949 - .Lrtx950) / 4
	.byte	(.L951 - .Lrtx950) / 4
	.byte	(.L989 - .Lrtx950) / 4
	.byte	(.L953 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L954 - .Lrtx950) / 4
	.byte	(.L953 - .Lrtx950) / 4
	.byte	(.L951 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L948 - .Lrtx950) / 4
	.byte	(.L955 - .Lrtx950) / 4
	.text
	.p2align 3
.L951:
	ldr	w0, [x19, 12]
	tbnz	x0, 15, .L988
	cmp	w21, 177
	beq	.L992
	ldr	x1, .LC199
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x20, .LC195
.L972:
	ldr	w0, [x20]
	tbnz	x0, 0, .L989
	mov	x0, x19
	bl	AVS2_ClearDpb
	.p2align 2
.L989:
	mov	x0, x19
	mov	w20, 1
	bl	AVS2_ClearPacket
.L957:
	mov	w0, w20
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L949:
	ldr	w0, [x19, 12]
	tbnz	x0, 15, .L988
	ldr	w0, [x19, 28]
	cmn	w0, #1
	mov	x0, x19
	beq	.L993
	bl	AVS2_FlushFrameInDpb
.L959:
	mov	x0, x19
	mov	w20, 1
	bl	AVS2_SequenceHeader
	mov	x0, x19
	bl	AVS2_ClearPacket
	b	.L957
	.p2align 3
.L953:
	ldr	w0, [x19, 12]
	tbnz	x0, 15, .L988
	tbz	x0, 16, .L961
	ldr	w0, [x19, 20]
	cmp	w0, 1
	beq	.L962
	ldr	w0, [x19, 24]
	cbnz	w0, .L963
.L962:
	mov	x0, x19
	bl	AVS2_ArrangeFrameBuf
	cmp	w0, 1
	mov	w20, w0
	beq	.L963
	cmp	w0, 3
	bne	.L987
	mov	w0, 1
	str	w0, [x19, 8]
	b	.L957
	.p2align 3
.L954:
	ldr	w0, [x19, 12]
	tbz	x0, 16, .L989
	tbnz	x0, 18, .L968
	mov	w1, 0
	mov	x0, x19
	bl	AVS2_Extension
	b	.L989
	.p2align 3
.L955:
	mov	w1, 32
	mov	x0, x20
	bl	BsSkip
	mov	w1, 32
	mov	x0, x20
	bl	BsGet
	mov	w21, w0
	mov	w1, 32
	mov	x0, x20
	bl	BsGet
	ldr	w1, [x19, 12]
	tbnz	x1, 15, .L994
	mov	w2, 20553
	mov	w1, 20036
	movk	w2, 0x4853, lsl 16
	movk	w1, 0x4345, lsl 16
	cmp	w21, w2
	ccmp	w0, w1, 0, eq
	bne	.L961
	mov	w1, -1
	mov	w0, 1
	str	w1, [x19, 28]
	strb	w0, [x19]
	b	.L989
	.p2align 3
.L988:
	mov	w20, 1
	orr	w0, w0, 16384
	stp	w20, w0, [x19, 8]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L994:
	mov	w20, 1
	orr	w1, w1, 16384
	stp	w20, w1, [x19, 8]
	b	.L957
	.p2align 3
.L968:
	mov	w1, 1
	mov	x0, x19
	bl	AVS2_Extension
	b	.L989
	.p2align 3
.L992:
	ldr	x20, .LC195
	ldr	w0, [x20]
	tbz	x0, 0, .L995
.L971:
	ldr	x1, .LC197
	mov	w0, 1
	bl	dprint_vfmw
	b	.L972
	.p2align 3
.L963:
	ldr	w0, [x19, 28]
	cmp	w21, 179
	add	w0, w0, 1
	str	w0, [x19, 28]
	mov	x0, x19
	beq	.L996
	bl	AVS2_InterPictureHeader
	b	.L989
	.p2align 3
.L993:
	bl	AVS2_ClearDpb
	b	.L959
	.p2align 3
.L991:
	mov	x0, x19
	bl	AVS2_WriteSliceMsg
	mov	w20, w0
	cbnz	w0, .L957
.L987:
	mov	x0, x19
	bl	AVS2_ClearPacket
	b	.L957
	.p2align 3
.L995:
	mov	x0, x19
	bl	AVS2_FlushFrameInDpb
	b	.L971
	.p2align 3
.L996:
	bl	AVS2_IntraPictureHeader
	b	.L989
	.size	AVS2_ParseHeader, .-AVS2_ParseHeader
	.align	3
.LC194:
	.xword	.L950
	.align	3
.LC195:
	.xword	g_StandardObedience
	.align	3
.LC197:
	.xword	.LC196
	.align	3
.LC199:
	.xword	.LC198
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_DecodeArbiter
	.type	AVS2_DecodeArbiter, %function
AVS2_DecodeArbiter:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	w0, 49152
	ldr	w20, [x19, 12]
	movk	w0, 0x5, lsl 16
	and	w0, w20, w0
	cmp	w0, 376832
	beq	.L1000
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1000:
	add	x0, x19, 8192
	add	x1, x19, 12288
	mov	x2, 3792
	add	x1, x1, 2792
	add	x0, x0, 3096
	bl	memcpy
	mov	w0, 16383
	movk	w0, 0xfffb, lsl 16
	and	w20, w20, w0
	str	w20, [x19, 12]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2_DecodeArbiter, .-AVS2_DecodeArbiter
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_PrepareDecode
	.type	AVS2_PrepareDecode, %function
AVS2_PrepareDecode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	AVS2_SetPicInfo
	ldr	w3, [x19, 1748]
	sub	w0, w3, #1
	cmp	w0, 255
	bhi	.L1016
	mov	x0, x19
	bl	AVS2_VarifyDecMode
	cbnz	w0, .L1017
.L1015:
	mov	w0, 0
.L1003:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1017:
	mov	x0, x19
	bl	AVS2_SetupFrameBuf
	cbz	w0, .L1015
	ldr	w0, [x19, 13896]
	cbnz	w0, .L1006
	mov	x0, x19
	bl	AVS2_SetupRefFrame
	cbz	w0, .L1008
	mov	x0, x19
	bl	AVS2_CalDistance
.L1006:
	mov	x0, x19
	bl	AVS2_SetupHalConfig
	cbz	w0, .L1008
	mov	w0, 1
	b	.L1003
	.p2align 3
.L1016:
	ldr	x2, .LC200
	mov	w0, 1
	ldr	x1, .LC202
	add	x2, x2, 632
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1008:
	mov	x0, x19
	bl	AVS2_ReleaseFrameBuf
	b	.L1015
	.size	AVS2_PrepareDecode, .-AVS2_PrepareDecode
	.align	3
.LC200:
	.xword	.LANCHOR1
	.align	3
.LC202:
	.xword	.LC201
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_StartDecode
	.type	AVS2_StartDecode, %function
AVS2_StartDecode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19, 40]
	add	x0, x19, 608
	str	x0, [x19, 48]
	ldr	w2, [x1, 640]
	strb	w2, [x19, 610]
	ldr	w1, [x1, 692]
	strb	w1, [x19, 609]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2_StartDecode, .-AVS2_StartDecode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_PostProcess
	.type	AVS2_PostProcess, %function
AVS2_PostProcess:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	AVS2_SetImgFormat
	ldr	x0, [x19, 40]
	ldr	w1, [x0, 8]
	cmp	w1, 2
	beq	.L1026
	ldr	w2, [x0, 24]
	cbz	w2, .L1027
	sub	w0, w2, #1
	cmp	w0, 1
	bls	.L1025
	ldr	x1, .LC204
	mov	w0, 1
	bl	dprint_vfmw
.L1025:
	mov	x0, x19
	bl	AVS2_DecOrderProcess
.L1023:
	mov	x0, x19
	bl	AVS2_UpdateFrameBuf
.L1019:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1027:
	mov	x0, x19
	bl	AVS2_DispOrderProcess
	b	.L1023
	.p2align 3
.L1026:
	mov	x0, x19
	bl	AVS2_SimpleDirectProcess
	b	.L1019
	.size	AVS2_PostProcess, .-AVS2_PostProcess
	.align	3
.LC204:
	.xword	.LC203
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2DEC_Init
	.type	AVS2DEC_Init, %function
AVS2DEC_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L1032
	ldr	x3, .LC206
	add	x21, x19, 16384
	mov	x2, 21320
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	ldr	w22, [x21, 3088]
	blr	x3
	str	w22, [x21, 3088]
	mov	x0, x19
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x19, 4]
	beq	.L1033
	add	x0, x21, 2488
	bl	ResetVoQueue
	str	x20, [x19, 40]
	str	wzr, [x20, 992]
	mov	w1, -1
	mov	w0, 1
	str	w1, [x19, 28]
.L1030:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1032:
	ldr	x1, .LC205
	mov	w2, 4114
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1033:
	ldr	x2, .LC207
	mov	w0, 0
	ldr	x1, .LC209
	add	x2, x2, 656
	bl	dprint_vfmw
	mov	w0, -20
	b	.L1030
	.size	AVS2DEC_Init, .-AVS2DEC_Init
	.align	3
.LC205:
	.xword	.LC148
	.align	3
.LC206:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC207:
	.xword	.LANCHOR1
	.align	3
.LC209:
	.xword	.LC208
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2DEC_Destroy
	.type	AVS2DEC_Destroy, %function
AVS2DEC_Destroy:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	AVS2DEC_Destroy, .-AVS2DEC_Destroy
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2_TryReleaseOldestFs
	.type	AVS2_TryReleaseOldestFs, %function
AVS2_TryReleaseOldestFs:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, -1
	bl	_mcount
	add	x6, x20, 16384
	mov	w3, 4095
	add	x0, x6, 3278
	mov	w4, 0
	mov	w1, 0
	b	.L1037
	.p2align 3
.L1036:
	add	w1, w1, 1
	add	x0, x0, 104
	cmp	w1, 16
	beq	.L1043
.L1037:
	ldrb	w2, [x0]
	cbz	w2, .L1036
	ldrb	w2, [x0, -1]
	cmp	w2, 1
	bne	.L1036
	ldrsh	w2, [x0, -6]
	add	w4, w4, 1
	cmp	w2, w3
	bge	.L1036
	ldrb	w5, [x0, -2]
	add	x0, x0, 104
	cmp	w5, 1
	csel	w19, w19, w1, ne
	add	w1, w1, 1
	csel	w3, w3, w2, ne
	cmp	w1, 16
	bne	.L1037
	.p2align 2
.L1043:
	ldrb	w0, [x6, 1112]
	add	w0, w0, 1
	cmp	w4, w0
	ccmn	w19, #1, 4, cs
	beq	.L1035
	ldr	x2, .LC210
	mov	w0, 1
	ldr	x1, .LC212
	sxtw	x19, w19
	add	x2, x2, 672
	bl	dprint_vfmw
	lsl	x0, x19, 3
	mov	w2, 0
	sub	x0, x0, x19
	lsl	x0, x0, 1
	sub	x0, x0, x19
	add	x0, x20, x0, lsl 3
	add	x0, x0, 16384
	strb	wzr, [x0, 3278]
	strb	wzr, [x0, 3277]
	ldr	w1, [x0, 3328]
	ldr	w0, [x20, 4]
	bl	FSP_SetRef
.L1035:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2_TryReleaseOldestFs, .-AVS2_TryReleaseOldestFs
	.align	3
.LC210:
	.xword	.LANCHOR1
	.align	3
.LC212:
	.xword	.LC211
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2DEC_GetImageBuffer
	.type	AVS2DEC_GetImageBuffer, %function
AVS2DEC_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1051
	ldr	w0, [x19, 4]
	bl	FSP_IsNewFsAvalible
	cmp	w0, 1
	beq	.L1046
	ldr	w0, [x19, 4]
	bl	FSP_IsNewFsAvalible
	cmn	w0, #1
	beq	.L1052
.L1047:
	mov	x0, x19
	bl	AVS2_TryReleaseOldestFs
	mov	w0, 0
.L1046:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1052:
	add	x1, x19, 16384
	ldr	w0, [x19, 4]
	add	x1, x1, 2488
	bl	FSP_ClearNotInVoQueue
	b	.L1047
	.p2align 3
.L1051:
	ldr	x1, .LC213
	mov	w2, 4188
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2DEC_GetImageBuffer, .-AVS2DEC_GetImageBuffer
	.align	3
.LC213:
	.xword	.LC148
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2DEC_Decode
	.type	AVS2DEC_Decode, %function
AVS2DEC_Decode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L1061
	ldr	w2, [x20, 20]
	add	x0, x19, 56
	ldr	x1, [x20]
	bl	BsInit
	ldr	x3, .LC215
	add	x0, x19, 16384
	mov	x2, 176
	mov	x1, x20
	add	x0, x0, 3096
	ldr	x3, [x3, 104]
	blr	x3
	ldr	w0, [x19, 12]
	str	w0, [x19, 16]
	mov	x0, x19
	bl	AVS2_ParseHeader
	cmp	w0, 3
	beq	.L1062
	mov	w20, 0
	cbz	w0, .L1055
	mov	w0, 49152
	ldr	w21, [x19, 12]
	movk	w0, 0x5, lsl 16
	and	w0, w21, w0
	cmp	w0, 376832
	beq	.L1063
.L1055:
	mov	w0, w20
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1061:
	ldr	x1, .LC214
	mov	w2, 4211
	mov	w0, 0
	mov	w20, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1062:
	ldr	w1, [x19, 16]
	mov	w20, w0
	str	w1, [x19, 12]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1063:
	add	x0, x19, 8192
	add	x1, x19, 12288
	mov	x2, 3792
	add	x1, x1, 2792
	add	x0, x0, 3096
	bl	memcpy
	mov	w0, 16383
	movk	w0, 0xfffb, lsl 16
	and	w21, w21, w0
	mov	x0, x19
	str	w21, [x19, 12]
	bl	AVS2_PrepareDecode
	cbz	w0, .L1064
	ldr	x1, [x19, 40]
	add	x0, x19, 608
	str	x0, [x19, 48]
	mov	w20, 1
	ldr	w2, [x1, 640]
	strb	w2, [x19, 610]
	ldr	w1, [x1, 692]
	strb	w1, [x19, 609]
	b	.L1055
	.p2align 3
.L1064:
	mov	x0, x19
	bl	AVS2_ClearPicSlice
	b	.L1055
	.size	AVS2DEC_Decode, .-AVS2DEC_Decode
	.align	3
.LC214:
	.xword	.LC148
	.align	3
.LC215:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2DEC_RecycleImage
	.type	AVS2DEC_RecycleImage, %function
AVS2DEC_RecycleImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L1069
	ldr	w0, [x19, 4]
	mov	w1, w20
	mov	w2, 0
	bl	FSP_SetDisplay
	ldr	w0, [x19, 4]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L1068
	ldr	w0, [x19, 4]
	ldr	x1, [x20, 544]
	bl	FreeUsdByDec
	str	xzr, [x20, 544]
	ldr	x1, [x20, 552]
	ldr	w0, [x19, 4]
	bl	FreeUsdByDec
	str	xzr, [x20, 552]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1068:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1069:
	ldr	x1, .LC216
	mov	w2, 4296
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2DEC_RecycleImage, .-AVS2DEC_RecycleImage
	.align	3
.LC216:
	.xword	.LC148
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2DEC_GetRemainImg
	.type	AVS2DEC_GetRemainImg, %function
AVS2DEC_GetRemainImg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1073
	mov	x0, x19
	bl	AVS2_FlushFrameInDpb
	add	x0, x19, 16384
	add	x0, x0, 2488
	bl	GetVoLastImageID
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1073:
	ldr	x1, .LC217
	mov	w2, 4318
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2DEC_GetRemainImg, .-AVS2DEC_GetRemainImg
	.align	3
.LC217:
	.xword	.LC148
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2DEC_ClearCurPic
	.type	AVS2DEC_ClearCurPic, %function
AVS2DEC_ClearCurPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1077
	mov	x0, x19
	bl	AVS2_ClearPicSlice
	mov	x0, x19
	bl	AVS2_ReleaseFrameBuf
	ldr	x19, [sp, 16]
	mov	w0, 1
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1077:
	ldr	x1, .LC218
	mov	w2, 4340
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS2DEC_ClearCurPic, .-AVS2DEC_ClearCurPic
	.align	3
.LC218:
	.xword	.LC148
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS2DEC_VDMPostProc
	.type	AVS2DEC_VDMPostProc, %function
AVS2DEC_VDMPostProc:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w21, w1
	mov	w22, w2
	mov	w20, w3
	bl	_mcount
	cbz	x19, .L1088
	ldr	x1, [x19, 11144]
	ldrb	w2, [x19, 611]
	strb	w2, [x1, 15]
	ldrb	w0, [x19, 610]
	strb	w0, [x1, 16]
	cbz	w22, .L1081
	ldr	x3, .LC220
	sbfiz	x20, x20, 6, 32
	add	x20, x3, x20
	ldr	w0, [x20, 44]
	cmp	w0, 3
	beq	.L1089
	cmp	w0, 1
	beq	.L1081
	ldr	x0, [x19, 40]
	ldr	w0, [x0, 4]
	cmp	w0, w21
	mov	x0, x19
	blt	.L1090
.L1084:
	bl	AVS2_PostProcess
	mov	w0, 1
.L1080:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1081:
	mov	x0, x19
	bl	AVS2_ClearPicSlice
	ldr	x0, [x19, 40]
	ldr	w0, [x0, 4]
	cmp	w0, w21
	mov	x0, x19
	bge	.L1084
.L1090:
	bl	AVS2DEC_ClearCurPic
	ldr	x3, [x19, 40]
	mov	w2, w21
	ldr	x1, .LC222
	mov	w0, 1
	ldr	w3, [x3, 4]
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1089:
	mov	x0, x19
	bl	AVS2_ClearPicSlice
	mov	w0, 1
	b	.L1080
	.p2align 3
.L1088:
	ldr	x1, .LC219
	mov	w2, 4251
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1080
	.size	AVS2DEC_VDMPostProc, .-AVS2DEC_VDMPostProc
	.align	3
.LC219:
	.xword	.LC148
	.align	3
.LC220:
	.xword	g_VdmDrvParam
	.align	3
.LC222:
	.xword	.LC221
	.global	AVS2_WqM4x4IdxModel2
	.global	AVS2_WqM4x4IdxModel1
	.global	AVS2_WqM4x4IdxModel0
	.global	AVS2_WqM8x8IdxModel2
	.global	AVS2_WqM8x8IdxModel1
	.global	AVS2_WqM8x8IdxModel0
	.global	AVS2_WQM_8x8Default
	.global	AVS2_WQM_4x4Default
	.global	AVS2_WeightQuantParamBase2
	.global	AVS2_WeightQuantParamBase1
	.global	AVS2_WeightQuantParamDefault
	.global	Avs2_AlfRegionTable
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	CSWTCH.36, %object
	.size	CSWTCH.36, 56
CSWTCH.36:
	.xword	.LC223
	.xword	.LC224
	.xword	.LC225
	.xword	.LC226
	.xword	.LC227
	.xword	.LC228
	.xword	.LC229
	.type	__func__.11702, %object
	.size	__func__.11702, 30
__func__.11702:
	.string	"AVS2_DynamicMetadataExtension"
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.11742, %object
	.size	__func__.11742, 15
__func__.11742:
	.string	"AVS2_User_Data"
	.zero	1
	.type	__func__.11755, %object
	.size	__func__.11755, 26
__func__.11755:
	.string	"AVS2_ConvertSLHDRMetadata"
	.zero	6
	.type	AVS2_WqM8x8IdxModel0, %object
	.size	AVS2_WqM8x8IdxModel0, 64
AVS2_WqM8x8IdxModel0:
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	5
	.byte	5
	.byte	0
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	1
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.type	AVS2_WqM4x4IdxModel0, %object
	.size	AVS2_WqM4x4IdxModel0, 16
AVS2_WqM4x4IdxModel0:
	.byte	0
	.byte	4
	.byte	3
	.byte	5
	.byte	4
	.byte	2
	.byte	1
	.byte	5
	.byte	3
	.byte	1
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.type	AVS2_WqM8x8IdxModel1, %object
	.size	AVS2_WqM8x8IdxModel1, 64
AVS2_WqM8x8IdxModel1:
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	0
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.type	AVS2_WqM4x4IdxModel1, %object
	.size	AVS2_WqM4x4IdxModel1, 16
AVS2_WqM4x4IdxModel1:
	.byte	0
	.byte	4
	.byte	4
	.byte	5
	.byte	3
	.byte	2
	.byte	2
	.byte	5
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.type	AVS2_WqM8x8IdxModel2, %object
	.size	AVS2_WqM8x8IdxModel2, 64
AVS2_WqM8x8IdxModel2:
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	5
	.byte	5
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.type	AVS2_WqM4x4IdxModel2, %object
	.size	AVS2_WqM4x4IdxModel2, 16
AVS2_WqM4x4IdxModel2:
	.byte	0
	.byte	4
	.byte	3
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	5
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.type	AVS2_WeightQuantParamDefault, %object
	.size	AVS2_WeightQuantParamDefault, 6
AVS2_WeightQuantParamDefault:
	.byte	64
	.byte	49
	.byte	53
	.byte	58
	.byte	58
	.byte	64
	.zero	2
	.type	AVS2_WeightQuantParamBase1, %object
	.size	AVS2_WeightQuantParamBase1, 6
AVS2_WeightQuantParamBase1:
	.byte	67
	.byte	71
	.byte	71
	.byte	80
	.byte	80
	.byte	106
	.zero	2
	.type	AVS2_WeightQuantParamBase2, %object
	.size	AVS2_WeightQuantParamBase2, 6
AVS2_WeightQuantParamBase2:
	.byte	64
	.byte	49
	.byte	53
	.byte	58
	.byte	58
	.byte	64
	.zero	2
	.type	AVS2_WQM_4x4Default, %object
	.size	AVS2_WQM_4x4Default, 16
AVS2_WQM_4x4Default:
	.byte	64
	.byte	64
	.byte	64
	.byte	68
	.byte	64
	.byte	64
	.byte	68
	.byte	72
	.byte	64
	.byte	68
	.byte	76
	.byte	80
	.byte	72
	.byte	76
	.byte	84
	.byte	96
	.type	AVS2_WQM_8x8Default, %object
	.size	AVS2_WQM_8x8Default, 64
AVS2_WQM_8x8Default:
	.byte	64
	.byte	64
	.byte	64
	.byte	64
	.byte	68
	.byte	68
	.byte	72
	.byte	76
	.byte	64
	.byte	64
	.byte	64
	.byte	68
	.byte	72
	.byte	76
	.byte	84
	.byte	92
	.byte	64
	.byte	64
	.byte	68
	.byte	72
	.byte	76
	.byte	80
	.byte	88
	.byte	100
	.byte	64
	.byte	68
	.byte	72
	.byte	80
	.byte	84
	.byte	92
	.byte	100
	.byte	112
	.byte	68
	.byte	72
	.byte	80
	.byte	84
	.byte	92
	.byte	104
	.byte	112
	.byte	-128
	.byte	76
	.byte	80
	.byte	84
	.byte	92
	.byte	104
	.byte	116
	.byte	-124
	.byte	-104
	.byte	96
	.byte	100
	.byte	104
	.byte	116
	.byte	124
	.byte	-116
	.byte	-92
	.byte	-68
	.byte	104
	.byte	108
	.byte	116
	.byte	-128
	.byte	-104
	.byte	-84
	.byte	-64
	.byte	-40
	.type	Avs2_AlfRegionTable, %object
	.size	Avs2_AlfRegionTable, 16
Avs2_AlfRegionTable:
	.byte	0
	.byte	1
	.byte	4
	.byte	5
	.byte	15
	.byte	2
	.byte	3
	.byte	6
	.byte	14
	.byte	11
	.byte	10
	.byte	7
	.byte	13
	.byte	12
	.byte	9
	.byte	8
	.type	__func__.11918, %object
	.size	__func__.11918, 24
__func__.11918:
	.string	"AVS2_IntraPictureHeader"
	.type	__func__.11936, %object
	.size	__func__.11936, 24
__func__.11936:
	.string	"AVS2_InterPictureHeader"
	.type	frame_rate_Table, %object
	.size	frame_rate_Table, 64
frame_rate_Table:
	.word	0
	.word	23976
	.word	24000
	.word	25000
	.word	29970
	.word	30000
	.word	50000
	.word	59940
	.word	60000
	.word	100000
	.word	120000
	.word	200000
	.word	240000
	.word	300000
	.word	3
	.word	3
	.type	__func__.11976, %object
	.size	__func__.11976, 17
__func__.11976:
	.string	"AVS2_ExchangePts"
	.zero	7
	.type	__func__.12090, %object
	.size	__func__.12090, 19
__func__.12090:
	.string	"AVS2_SetupFrameBuf"
	.zero	5
	.type	__func__.12109, %object
	.size	__func__.12109, 19
__func__.12109:
	.string	"AVS2_SetupRefFrame"
	.zero	5
	.type	__func__.12140, %object
	.size	__func__.12140, 17
__func__.12140:
	.string	"AVS2_CalDistance"
	.zero	7
	.type	CSWTCH.86, %object
	.size	CSWTCH.86, 16
CSWTCH.86:
	.word	5
	.word	1
	.word	2
	.word	3
	.type	__func__.12233, %object
	.size	__func__.12233, 19
__func__.12233:
	.string	"AVS2_PrepareDecode"
	.zero	5
	.type	__func__.12250, %object
	.size	__func__.12250, 13
__func__.12250:
	.string	"AVS2DEC_Init"
	.zero	3
	.type	__func__.12265, %object
	.size	__func__.12265, 24
__func__.12265:
	.string	"AVS2_TryReleaseOldestFs"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	ASCII(.string	"AVS2_ue_v ERROR: LeadingZeros (%d) >= 32, return 0x%x\n" )
	.zero	1
.LC5:
	ASCII(.string	"Stream StartCode is 0x%x Length is too Long cannot Remove DPB!!" )
.LC9:
	ASCII(.string	"Unkown" )
	.zero	1
.LC11:
	ASCII(.string	"\n" )
	.zero	6
.LC13:
	ASCII(.string	" ----> Dump Dpb Status:\n" )
	.zero	7
.LC16:
	ASCII(.string	"Pic %2d, Type %6s, Occupied %d, Ref %d, Disp %d, DOI %d, POI %d, FspID %d, FsPhy 0x%x, PmvPhy 0x%x\n" )
	.zero	4
.LC18:
	ASCII(.string	" ----> Dump End: Totoal Occupied Frame %d\n\n" )
	.zero	4
.LC21:
	ASCII(.string	"%s: Unsupport sl hdr!\n" )
	.zero	1
.LC25:
	ASCII(.string	"User Data:\n" )
	.zero	4
.LC28:
	ASCII(.string	"%s: cosume TotalPos(%d > %d)!\n" )
	.zero	1
.LC32:
	ASCII(.string	"%s pMetaData is null vir:%p\n" )
	.zero	3
.LC34:
	ASCII(.string	"%s error: metadata size(%d) < structure size(%d)\n" )
	.zero	6
.LC36:
	ASCII(.string	"Slice num out of slot: %d > %d\n" )
.LC38:
	ASCII(.string	"Stream ERROR: slice_vertical_position %d out of range [0, 0x8F].\n" )
	.zero	6
.LC52:
	ASCII(.string	"Stream ERROR: alf_filter_num_minus1 %d > 15.\n" )
	.zero	2
.LC54:
	ASCII(.string	"ALF ERROR: alf_region_distance %d out of range [1, 15].\n" )
	.zero	7
.LC56:
	ASCII(.string	"ALF ERROR: alf_coef_luma_8 %d out of range [-1088, 1071].\n" )
	.zero	5
.LC58:
	ASCII(.string	"ALF ERROR: alf_coef_luma_%d %d out of range [-64, 63].\n" )
.LC62:
	ASCII(.string	"ALF ERROR: alf_coef_chroma0_8 %d out of range [-1088, 1071].\n" )
	.zero	2
.LC64:
	ASCII(.string	"ALF ERROR: alf_coef_chroma0_%d %d out of range [-64, 63].\n" )
	.zero	5
.LC66:
	ASCII(.string	"ALF ERROR: alf_coef_chroma1_8 %d out of range [-1088, 1071].\n" )
	.zero	2
.LC68:
	ASCII(.string	"ALF ERROR: alf_coef_chroma1_%d %d out of range [-64, 63].\n" )
	.zero	5
.LC71:
	ASCII(.string	"Intra stream ERROR: picture_output_delay out of range [0, 63], force 63.\n" )
	.zero	6
.LC73:
	ASCII(.string	"Intra stream ERROR: force progressive_frame to 0 for field_coded_sequence = 1\n" )
	.zero	1
.LC75:
	ASCII(.string	"Intra stream ERROR: picture_qp %d out of range [0, %d], force %d.\n" )
	.zero	5
.LC77:
	ASCII(.string	"Intra stream ERROR: alpha_c_offset %d out of range [-8, 8], force 0.\n" )
	.zero	2
.LC79:
	ASCII(.string	"Intra stream ERROR: beta_offset %d out of range [-8, 8], force 0.\n" )
	.zero	5
.LC81:
	ASCII(.string	"Intra stream ERROR: chroma_quant_param_delta_cb %d out of range [-16, 16], force 0.\n" )
	.zero	3
.LC83:
	ASCII(.string	"Intra stream ERROR: chroma_quant_param_delta_cr %d out of range [-16, 16], force 0.\n" )
	.zero	3
.LC86:
	ASCII(.string	"%s call AVS2_alf_parameter_set failed\n" )
	.zero	1
.LC88:
	ASCII(.string	"Inter stream ERROR: picture_coding_type should not equal 0.\n" )
	.zero	3
.LC90:
	ASCII(.string	"Inter stream ERROR: picture_output_delay out of range [0, 63], force 63.\n" )
	.zero	6
.LC93:
	ASCII(.string	"Inter stream ERROR: force progressive_frame to 1 for progressive_sequence = 1\n" )
	.zero	1
.LC95:
	ASCII(.string	"Inter stream ERROR: force progressive_frame to 0 for field_coded_sequence = 1\n" )
	.zero	1
.LC97:
	ASCII(.string	"Inter stream ERROR: picture_qp %d out of range [0, %d], force %d.\n" )
	.zero	5
.LC99:
	ASCII(.string	"Inter stream ERROR: alpha_c_offset %d out of range [-8, 8], force 0.\n" )
	.zero	2
.LC101:
	ASCII(.string	"Inter stream ERROR: beta_offset %d out of range [-8, 8], force 0.\n" )
	.zero	5
.LC103:
	ASCII(.string	"Inter stream ERROR: chroma_quant_param_delta_cb %d out of range [-16, 16], force 0.\n" )
	.zero	3
.LC105:
	ASCII(.string	"Inter stream ERROR: chroma_quant_param_delta_cr %d out of range [-16, 16], force 0.\n" )
	.zero	3
.LC109:
	ASCII(.string	"%s ERROR: ucRefPicNum out of range [1, %d].\n" )
	.zero	3
.LC111:
	ASCII(.string	"Sequence Header:\n" )
	.zero	6
.LC113:
	ASCII(.string	"Stream ERROR: profile_id 0x%x unsupport.\n" )
	.zero	6
.LC115:
	ASCII(.string	"Stream ERROR: level_id should not equal 0.\n" )
	.zero	4
.LC117:
	ASCII(.string	"Stream ERROR: field_coded_sequence should be 0 when progressive_sequence = 1\n" )
	.zero	2
.LC119:
	ASCII(.string	"Stream ERROR: horizontal_size should not equal 0.\n" )
	.zero	5
.LC121:
	ASCII(.string	"Stream ERROR: vertical_size should not equal 0.\n" )
	.zero	7
.LC123:
	ASCII(.string	"Stream ERROR: chroma_format %d not support, only 4:2:0 now.\n" )
	.zero	3
.LC125:
	ASCII(.string	"Stream ERROR: sample_precision %d should equal to 8/10\n" )
.LC127:
	ASCII(.string	"AVS2 sequence ERROR: ucBitDepth %d should equal to 8/10, and not less than sample_precision %d\n" )
.LC129:
	ASCII(.string	"Stream ERROR: aspect_ratio = 0 is forbidden!\n" )
	.zero	2
.LC131:
	ASCII(.string	"Stream ERROR: frame_rate_code = 0 is forbidden!\n" )
	.zero	7
.LC134:
	ASCII(.string	"Stream ERROR: num_of_rcs %d out of range [0, %d]\n" )
	.zero	6
.LC137:
	ASCII(.string	"MbWidth = %d, MbHeight = %d, don't support!\n" )
	.zero	3
.LC139:
	ASCII(.string	"avs2 actual frame size(%dx%d) exeed max config(%dx%d)\n" )
	.zero	1
.LC141:
	ASCII(.string	"avs2 actual frame size(%dx%d) exceed max config(%dx%d)\n" )
.LC144:
	ASCII(.string	"ERROR: partition fs memory failed!\n" )
	.zero	4
.LC146:
	ASCII(.string	"ERROR: FSP_ConfigInstance failed!\n" )
	.zero	5
.LC148:
	ASCII(.string	"line: %d\n" )
	.zero	6
.LC150:
	ASCII(.string	"ERROR: AVS2_OutputOneFrame is err(%d)\n" )
	.zero	1
.LC153:
	ASCII(.string	"%s can't find pCurImage.\n" )
	.zero	6
.LC155:
	ASCII(.string	"Dump frame, POI: %d\n" )
	.zero	3
.LC158:
	ASCII(.string	"NumOfRemovedPicture: %d\n" )
	.zero	7
.LC160:
	ASCII(.string	"Target removal DOI[%d]: %d\n" )
	.zero	4
.LC162:
	ASCII(.string	"Conflict: cur frame(Type %d, DOI %d, FspID %d, FsPhy 0x%x, PmvPhy 0x%x) with frame(Type %d, Occupied %d, UsedAsRef %d, DOI %d, FspID %d, FsPhy 0x%x, PmvPhy 0x%x)\n" )
	.zero	5
.LC165:
	ASCII(.string	"%s: Can't find non-occupied frame memory buffer!!!\n" )
	.zero	4
.LC167:
	ASCII(.string	"%s ERROR: get frame store fail!\n" )
	.zero	7
.LC169:
	ASCII(.string	"%s ERROR: get image pointer fail!\n" )
	.zero	5
.LC171:
	ASCII(.string	"Varify current frame DOI %d failed!\n" )
	.zero	3
.LC175:
	ASCII(.string	"Can't find G or GB picture for the reference of S picture.\n" )
	.zero	4
.LC177:
	ASCII(.string	"CurPic Doi %d cant find ref frame TargetDoi %d\n" )
.LC179:
	ASCII(.string	"Found ref num %d < num_of_reference_picture %d\n" )
.LC182:
	ASCII(.string	"%s ERROR: num_of_reference_picture %d out of range [1, %d].\n" )
	.zero	3
.LC186:
	ASCII(.string	"%s ERROR: pstRefFrmMem[0] = NULL or ucRefPicNum %d out of range [1, %d].\n" )
	.zero	6
.LC189:
	ASCII(.string	"line: %d pImage is null\n" )
	.zero	7
.LC192:
	ASCII(.string	"ERROR: allocate vhb\n" )
	.zero	3
.LC196:
	ASCII(.string	"AVS2_VIDEO_SEQUENCE_END_CODE\n" )
	.zero	2
.LC198:
	ASCII(.string	"AVS2_VIDEO_EDIT_CODE\n" )
	.zero	2
.LC201:
	ASCII(.string	"%s SliceNum %d invalid.\n" )
	.zero	7
.LC203:
	ASCII(.string	"AVS2 unsupport output order %d, force dec order output.\n" )
	.zero	7
.LC208:
	ASCII(.string	"%s get chan id failed!\n" )
.LC211:
	ASCII(.string	"%s set fs unref with oldest Doi %d to proceed decoding for ref num %d is full.\n" )
.LC221:
	ASCII(.string	"Discard cur pic, ErrLevel(%d) > OutErrThr(%d)\n" )
	.zero	1
.LC223:
	ASCII(.string	"I_PIC" )
	.zero	2
.LC224:
	ASCII(.string	"P_PIC" )
	.zero	2
.LC225:
	ASCII(.string	"B_PIC" )
	.zero	2
.LC226:
	ASCII(.string	"F_PIC" )
	.zero	2
.LC227:
	ASCII(.string	"S_PIC" )
	.zero	2
.LC228:
	ASCII(.string	"G_PIC" )
	.zero	2
.LC229:
	ASCII(.string	"GB_PIC" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
