#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"dsp_util.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	VolumedB2Coef, %function
VolumedB2Coef:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	and	w2, w19, 255
	cmp	w2, 138
	bhi	.L5
	mov	w3, 139
	mov	w0, 0
	sub	w3, w3, w2
	cmp	w3, 98
	bhi	.L2
	cmp	w20, wzr
	beq	.L8
	ble	.L4
	mov	w0, 138
	ldr	x1, .LC0
	sub	w2, w0, w2
	ldr	w3, [x1, w3, uxtw 2]
	ldr	w0, [x1, w2, uxtw 2]
	sub	w0, w0, w3
	mul	w1, w0, w20
	add	w0, w3, w1, lsr 3
.L2:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L5:
	mov	w0, 48505
	movk	w0, 0x3f8, lsl 16
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L4:
	mov	w0, 140
	ldr	x1, .LC0
	sub	w2, w0, w2
	ldr	w3, [x1, w3, uxtw 2]
	ldr	w0, [x1, w2, uxtw 2]
	sub	w0, w0, w3
	mul	w1, w0, w20
	sub	w0, w3, w1, lsr 3
	b	.L2
	.p2align 3
.L8:
	ldr	x0, .LC0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, w3, uxtw 2]
	ret
	.size	VolumedB2Coef, .-VolumedB2Coef
	.align	3
.LC0:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	AOE_FMUL_16_Q15.part.0, %function
AOE_FMUL_16_Q15.part.0:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	sxth	w0, w19
	cmp	w20, 8388608
	smull	x0, w0, w20
	asr	x0, x0, 23
	bls	.L13
	asr	w2, w0, 31
	eor	w1, w2, 32767
	cmp	w2, w0, asr 15
	csel	w0, w0, w1, eq
.L13:
	sxth	w0, w0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AOE_FMUL_16_Q15.part.0, .-AOE_FMUL_16_Q15.part.0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	Volume16BitPro_Coef, %function
Volume16BitPro_Coef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w22, w1
	mov	x20, x0
	mov	x0, x30
	mov	w21, w2
	sub	w19, w1, #1
	bl	_mcount
	cbz	w22, .L14
	.p2align 2
.L20:
	mov	w1, w21
	sub	w19, w19, #1
	ldrsh	w0, [x20]
	mov	w3, 0
	cbz	w21, .L16
	bl	AOE_FMUL_16_Q15.part.0
	sxth	w3, w0
.L16:
	strh	w3, [x20], 2
	cmn	w19, #1
	bne	.L20
.L14:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	Volume16BitPro_Coef, .-Volume16BitPro_Coef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	AOE_FMUL_24_Q15.part.1, %function
AOE_FMUL_24_Q15.part.1:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	lsr	w19, w19, 8
	bl	_mcount
	smull	x1, w19, w20
	ldp	x19, x20, [sp, 16]
	asr	x1, x1, 23
	asr	w2, w1, 31
	eor	w0, w2, 8388607
	cmp	w2, w1, asr 23
	csel	w0, w1, w0, eq
	lsl	w0, w0, 8
	ldp	x29, x30, [sp], 32
	ret
	.size	AOE_FMUL_24_Q15.part.1, .-AOE_FMUL_24_Q15.part.1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	Volume24BitPro_Coef, %function
Volume24BitPro_Coef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w22, w1
	mov	x21, x0
	mov	x0, x30
	mov	w20, w2
	sub	w19, w1, #1
	bl	_mcount
	cbnz	w22, .L32
	b	.L25
	.p2align 3
.L35:
	lsr	x0, x2, 23
.L27:
	sub	w19, w19, #1
	str	w0, [x21], 4
	cmn	w19, #1
	beq	.L25
.L32:
	cmp	w20, 8388608
	mov	w0, 0
	ldr	w2, [x21]
	cbz	w20, .L27
	mov	w0, w2
	mov	w1, w20
	smull	x2, w2, w20
	bls	.L35
	bl	AOE_FMUL_24_Q15.part.1
	sub	w19, w19, #1
	str	w0, [x21], 4
	cmn	w19, #1
	bne	.L32
.L25:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	Volume24BitPro_Coef, .-Volume24BitPro_Coef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UTIL_CalcFrameSize
	.type	UTIL_CalcFrameSize, %function
UTIL_CalcFrameSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, 16
	lsl	w0, w19, 1
	lsl	w19, w19, 2
	csel	w0, w19, w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	UTIL_CalcFrameSize, .-UTIL_CalcFrameSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UTIL_LatencyMs2ByteSize
	.type	UTIL_LatencyMs2ByteSize, %function
UTIL_LatencyMs2ByteSize:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w19, w2
	mov	w20, w1
	bl	_mcount
	mul	w19, w19, w21
	mov	w0, 19923
	ldr	x21, [sp, 32]
	movk	w0, 0x1062, lsl 16
	umull	x0, w19, w0
	lsr	x0, x0, 38
	madd	w0, w20, w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	UTIL_LatencyMs2ByteSize, .-UTIL_LatencyMs2ByteSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UTIL_LatencyMs
	.type	UTIL_LatencyMs, %function
UTIL_LatencyMs:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	w21, w2
	mov	w19, w1
	bl	_mcount
	lsl	w0, w20, 6
	sub	w0, w0, w20
	lsl	w0, w0, 1
	mul	w19, w19, w21
	sub	w0, w0, w20
	ldr	x21, [sp, 32]
	lsl	w0, w0, 3
	udiv	w0, w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	UTIL_LatencyMs, .-UTIL_LatencyMs
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UTIL_LRLinearGainProcess
	.type	UTIL_LRLinearGainProcess, %function
UTIL_LRLinearGainProcess:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	sxth	w22, w3
	sxth	w23, w4
	mov	x21, x1
	mov	w19, w2
	bl	_mcount
	cmp	w22, w23
	beq	.L42
	cmp	w19, wzr
	ble	.L41
	lsl	w4, w23, 16
	lsl	w3, w22, 16
	mov	x6, 0
	mov	w5, 0
	b	.L48
	.p2align 3
.L51:
	smull	x0, w0, w4
	add	w5, w5, 1
	asr	x0, x0, 32
	cmp	w19, w5
	lsl	w0, w0, 1
	strh	w0, [x21, x6]
	add	x6, x6, 2
	beq	.L41
.L48:
	ldrsh	w0, [x20, x6]
	tbnz	x5, 0, .L51
	smull	x0, w0, w3
	add	w5, w5, 1
	asr	x0, x0, 32
	cmp	w19, w5
	lsl	w0, w0, 1
	strh	w0, [x21, x6]
	add	x6, x6, 2
	bne	.L48
.L41:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L42:
	cmp	w19, wzr
	ble	.L41
	lsl	w1, w22, 16
	mov	x3, 0
	.p2align 2
.L45:
	ldrsh	w0, [x20, x3, lsl 1]
	smull	x0, w0, w1
	asr	x0, x0, 32
	lsl	w0, w0, 1
	strh	w0, [x21, x3, lsl 1]
	add	x3, x3, 1
	cmp	w19, w3
	bgt	.L45
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	UTIL_LRLinearGainProcess, .-UTIL_LRLinearGainProcess
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UTIL_UpmixPcmData
	.type	UTIL_UpmixPcmData, %function
UTIL_UpmixPcmData:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x2
	mov	w19, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	w0, [x20, 16]
	cmp	w0, 24
	beq	.L93
	cmp	w0, 16
	beq	.L94
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L94:
	ldr	w2, [x20, 12]
	ldr	x5, [x20]
	cbz	w2, .L95
	sub	w8, w19, #1
	mov	x7, x21
	add	x8, x8, 1
	mov	w4, 0
	lsl	x8, x8, 1
	mov	w6, 0
	.p2align 2
.L71:
	add	x3, x7, 2
	mov	w0, 0
	cbnz	w19, .L80
	b	.L75
	.p2align 3
.L97:
	ldrh	w4, [x5], 2
	add	w0, w0, 1
	strh	w4, [x3, -2]
	cmp	w19, w0
	add	x3, x3, 2
	beq	.L96
.L80:
	ldr	w2, [x20, 20]
	cmp	w2, w0
	bhi	.L97
	add	w0, w0, 1
	strh	w4, [x3, -2]
	cmp	w19, w0
	add	x3, x3, 2
	bne	.L80
.L96:
	ldr	w2, [x20, 12]
	add	x7, x7, x8
.L75:
	add	w6, w6, 1
	cmp	w2, w6
	bhi	.L71
	ldr	w0, [x20, 16]
	str	x21, [x20]
	cmp	w0, 16
	str	w19, [x20, 20]
	beq	.L72
.L88:
	lsl	w19, w19, 2
.L76:
	mul	w2, w19, w2
	str	w2, [x20, 8]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L93:
	ldr	w2, [x20, 12]
	ldr	x5, [x20]
	cbz	w2, .L98
	sub	w8, w19, #1
	mov	x7, x21
	add	x8, x8, 1
	mov	w4, 0
	lsl	x8, x8, 2
	mov	w6, 0
	.p2align 2
.L59:
	add	x3, x7, 4
	mov	w0, 0
	cbnz	w19, .L79
	b	.L63
	.p2align 3
.L100:
	ldr	w4, [x5], 4
	add	w0, w0, 1
	str	w4, [x3, -4]
	cmp	w19, w0
	add	x3, x3, 4
	beq	.L99
.L79:
	ldr	w2, [x20, 20]
	cmp	w2, w0
	bhi	.L100
	add	w0, w0, 1
	str	w4, [x3, -4]
	cmp	w19, w0
	add	x3, x3, 4
	bne	.L79
.L99:
	ldr	w2, [x20, 12]
	add	x7, x7, x8
.L63:
	add	w6, w6, 1
	cmp	w2, w6
	bhi	.L59
	ldr	w0, [x20, 16]
	str	x21, [x20]
	cmp	w0, 16
	str	w19, [x20, 20]
	bne	.L88
	b	.L72
.L95:
	str	x21, [x20]
	str	w19, [x20, 20]
.L72:
	lsl	w19, w19, 1
	b	.L76
.L98:
	str	x21, [x20]
	str	w19, [x20, 20]
	b	.L88
	.size	UTIL_UpmixPcmData, .-UTIL_UpmixPcmData
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UTIL_DownmixPcmData
	.type	UTIL_DownmixPcmData, %function
UTIL_DownmixPcmData:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x2
	mov	w19, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	w0, [x20, 16]
	cmp	w0, 24
	beq	.L140
	cmp	w0, 16
	beq	.L141
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L141:
	ldr	w5, [x20, 12]
	ldr	x6, [x20]
	cbz	w5, .L142
	sub	w7, w19, #1
	mov	x4, x21
	add	x7, x7, 1
	mov	w2, 0
	lsl	x7, x7, 1
	.p2align 2
.L118:
	add	x3, x6, 2
	mov	w0, 0
	cbz	w19, .L122
	.p2align 2
.L127:
	cmp	w19, w0
	add	w0, w0, 1
	bls	.L116
	ldrh	w5, [x3, -2]
	strh	w5, [x4], 2
.L116:
	cmp	w19, w0
	add	x3, x3, 2
	bne	.L127
	ldr	w5, [x20, 12]
	add	x6, x6, x7
.L122:
	add	w2, w2, 1
	cmp	w5, w2
	bhi	.L118
	ldr	w0, [x20, 16]
	str	x21, [x20]
	cmp	w0, 16
	str	w19, [x20, 20]
	beq	.L119
.L135:
	lsl	w19, w19, 2
.L123:
	mul	w5, w19, w5
	str	w5, [x20, 8]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L140:
	ldr	w5, [x20, 12]
	ldr	x6, [x20]
	cbz	w5, .L143
	sub	w7, w19, #1
	mov	x4, x21
	add	x7, x7, 1
	mov	w2, 0
	lsl	x7, x7, 2
	.p2align 2
.L107:
	add	x3, x6, 4
	mov	w0, 0
	cbz	w19, .L111
	.p2align 2
.L126:
	cmp	w19, w0
	add	w0, w0, 1
	bls	.L105
	ldr	w5, [x3, -4]
	str	w5, [x4], 4
.L105:
	cmp	w19, w0
	add	x3, x3, 4
	bne	.L126
	ldr	w5, [x20, 12]
	add	x6, x6, x7
.L111:
	add	w2, w2, 1
	cmp	w5, w2
	bhi	.L107
	ldr	w0, [x20, 16]
	str	x21, [x20]
	cmp	w0, 16
	str	w19, [x20, 20]
	bne	.L135
	b	.L119
.L142:
	str	x21, [x20]
	str	w19, [x20, 20]
.L119:
	lsl	w19, w19, 1
	b	.L123
.L143:
	str	x21, [x20]
	str	w19, [x20, 20]
	b	.L135
	.size	UTIL_DownmixPcmData, .-UTIL_DownmixPcmData
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UTIL_UnifyBitDepthPcmData
	.type	UTIL_UnifyBitDepthPcmData, %function
UTIL_UnifyBitDepthPcmData:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x2
	mov	w21, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	w0, [x19, 12]
	cmp	w21, 16
	ldr	w3, [x19, 20]
	mul	w3, w0, w3
	beq	.L157
	cmp	w21, 24
	beq	.L158
.L144:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L158:
	ldr	w0, [x19, 16]
	cmp	w0, 16
	bne	.L144
	mov	x0, 0
	ldr	x1, [x19]
	cbz	w3, .L152
	.p2align 2
.L154:
	ldrh	w4, [x1, x0, lsl 1]
	lsl	w4, w4, 16
	str	w4, [x20, x0, lsl 2]
	add	x0, x0, 1
	cmp	w3, w0
	bhi	.L154
.L152:
	ldr	w0, [x19, 8]
	mov	w1, 24
	str	x20, [x19]
	str	w1, [x19, 16]
	lsl	w0, w0, 1
	str	w0, [x19, 8]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L157:
	ldr	w0, [x19, 16]
	cmp	w0, 24
	bne	.L144
	mov	x0, 0
	ldr	x2, [x19]
	cbz	w3, .L149
	.p2align 2
.L153:
	ldr	w1, [x2, x0, lsl 2]
	lsr	w1, w1, 16
	strh	w1, [x20, x0, lsl 1]
	add	x0, x0, 1
	cmp	w3, w0
	bhi	.L153
.L149:
	ldr	w0, [x19, 8]
	mov	w1, 16
	str	x20, [x19]
	lsr	w0, w0, 1
	str	w1, [x19, 16]
	str	w0, [x19, 8]
	b	.L144
	.size	UTIL_UnifyBitDepthPcmData, .-UTIL_UnifyBitDepthPcmData
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UTILS_GainBalanceCoef
	.type	UTILS_GainBalanceCoef, %function
UTILS_GainBalanceCoef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w2
	mov	x21, x1
	bl	_mcount
	cmp	w19, wzr
	beq	.L159
	blt	.L165
	ldr	w3, [x20]
	mov	w1, 50
	sub	w2, w1, w19
	mov	w0, 34079
	movk	w0, 0x51eb, lsl 16
	mul	w2, w2, w3
	umull	x0, w2, w0
	lsr	x0, x0, 36
	str	w0, [x20]
.L159:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L165:
	ldr	w1, [x21]
	add	w2, w19, 50
	mov	w0, 34079
	movk	w0, 0x51eb, lsl 16
	mul	w2, w2, w1
	umull	x0, w2, w0
	lsr	x0, x0, 36
	str	w0, [x21]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	UTILS_GainBalanceCoef, .-UTILS_GainBalanceCoef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UTIL_LRGainProcess
	.type	UTIL_LRGainProcess, %function
UTIL_LRGainProcess:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x19, x2
	mov	x0, x30
	mov	w24, w1
	bl	_mcount
	ldr	w22, [x20, 12]
	ldr	w1, [x19]
	ldr	w0, [x20, 20]
	cmp	w1, 1
	mul	w22, w22, w0
	beq	.L224
	ldr	w1, [x19, 12]
	ldr	w0, [x19, 4]
	bl	VolumedB2Coef
	mov	w21, w0
	ldr	w1, [x19, 16]
	ldr	w0, [x19, 8]
	bl	VolumedB2Coef
	mov	w23, w0
	cmp	w24, wzr
	bne	.L225
.L184:
	mov	w0, 8388608
	cmp	w23, w0
	ccmp	w21, w0, 0, eq
	beq	.L166
	ldr	w0, [x20, 16]
	cmp	w0, 16
	beq	.L186
	cmp	w0, 24
	bne	.L166
	cmp	w21, w23
	ldr	x19, [x20]
	beq	.L195
	sub	w20, w22, #1
	cbnz	w22, .L211
	b	.L166
	.p2align 3
.L226:
	cbz	w21, .L201
	cmp	w21, 8388608
	bhi	.L199
	smull	x0, w0, w21
	lsr	x1, x0, 23
	.p2align 2
.L201:
	sub	w20, w20, #1
	str	w1, [x19]
	cmn	w20, #1
	add	x19, x19, 4
	beq	.L166
.L211:
	mov	w1, 0
	ldr	w0, [x19]
	tbnz	x20, 0, .L226
	cbz	w23, .L201
	cmp	w23, 8388608
	bhi	.L202
	smull	x0, w0, w23
	sub	w20, w20, #1
	add	x19, x19, 4
	lsr	x1, x0, 23
	cmn	w20, #1
	str	w1, [x19, -4]
	bne	.L211
.L166:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L225:
	blt	.L227
	mov	w1, 50
	mov	w2, 34079
	sub	w1, w1, w24
	movk	w2, 0x51eb, lsl 16
	mul	w21, w1, w21
	umull	x21, w21, w2
	lsr	x21, x21, 32
	lsr	w21, w21, 4
	b	.L184
	.p2align 3
.L186:
	cmp	w21, w23
	ldr	x19, [x20]
	beq	.L188
	sub	w20, w22, #1
	cbnz	w22, .L210
	b	.L166
	.p2align 3
.L228:
	mov	w1, w21
	mov	w2, 0
	cbz	w21, .L193
.L223:
	bl	AOE_FMUL_16_Q15.part.0
	sxth	w2, w0
.L193:
	sub	w20, w20, #1
	strh	w2, [x19]
	cmn	w20, #1
	add	x19, x19, 2
	beq	.L166
.L210:
	ldrsh	w0, [x19]
	tbnz	x20, 0, .L228
	mov	w1, w23
	mov	w2, 0
	cbz	w23, .L193
	b	.L223
	.p2align 3
.L224:
	ldr	w0, [x20, 16]
	cmp	w0, 16
	beq	.L169
	cmp	w0, 24
	bne	.L166
	ldrsh	w3, [x19, 4]
	ldrsh	w4, [x19, 8]
	ldr	x2, [x20]
	cmp	w3, w4
	beq	.L178
	cmp	w22, wzr
	ble	.L166
	lsl	w4, w4, 16
	lsl	w3, w3, 16
	mov	w1, 0
	b	.L183
	.p2align 3
.L229:
	smull	x0, w0, w4
	asr	x0, x0, 32
	lsl	w0, w0, 1
.L182:
	add	w1, w1, 1
	str	w0, [x2], 4
	cmp	w22, w1
	beq	.L166
.L183:
	ldr	w0, [x2]
	tbnz	x1, 0, .L229
	smull	x0, w0, w3
	asr	x0, x0, 32
	lsl	w0, w0, 1
	b	.L182
	.p2align 3
.L169:
	ldrsh	w3, [x19, 4]
	ldrsh	w4, [x19, 8]
	ldr	x2, [x20]
	cmp	w3, w4
	beq	.L171
	cmp	w22, wzr
	ble	.L166
	lsl	w4, w4, 16
	lsl	w3, w3, 16
	mov	w1, 0
	b	.L177
	.p2align 3
.L230:
	smull	x0, w0, w4
	asr	x0, x0, 32
	lsl	w0, w0, 1
.L176:
	add	w1, w1, 1
	strh	w0, [x2], 2
	cmp	w22, w1
	beq	.L166
.L177:
	ldrsh	w0, [x2]
	tbnz	x1, 0, .L230
	smull	x0, w0, w3
	asr	x0, x0, 32
	lsl	w0, w0, 1
	b	.L176
	.p2align 3
.L202:
	mov	w1, w23
	bl	AOE_FMUL_24_Q15.part.1
	mov	w1, w0
	b	.L201
	.p2align 3
.L199:
	mov	w1, w21
	bl	AOE_FMUL_24_Q15.part.1
	mov	w1, w0
	b	.L201
	.p2align 3
.L188:
	mov	w2, w21
	mov	w1, w22
	mov	x0, x19
	bl	Volume16BitPro_Coef
	b	.L166
	.p2align 3
.L195:
	mov	w2, w21
	mov	w1, w22
	mov	x0, x19
	bl	Volume24BitPro_Coef
	b	.L166
	.p2align 3
.L227:
	add	w1, w24, 50
	mov	w0, 34079
	movk	w0, 0x51eb, lsl 16
	mul	w23, w1, w23
	umull	x23, w23, w0
	lsr	x23, x23, 32
	lsr	w23, w23, 4
	b	.L184
	.p2align 3
.L171:
	cmp	w22, wzr
	ble	.L166
	lsl	w3, w3, 16
	mov	x1, 0
	.p2align 2
.L174:
	ldrsh	w0, [x2, x1, lsl 1]
	smull	x0, w0, w3
	asr	x0, x0, 32
	lsl	w0, w0, 1
	strh	w0, [x2, x1, lsl 1]
	add	x1, x1, 1
	cmp	w22, w1
	bgt	.L174
	b	.L166
	.p2align 3
.L178:
	cmp	w22, wzr
	ble	.L166
	lsl	w3, w3, 16
	mov	x1, 0
	.p2align 2
.L180:
	ldr	w0, [x2, x1, lsl 2]
	smull	x0, w0, w3
	asr	x0, x0, 32
	lsl	w0, w0, 1
	str	w0, [x2, x1, lsl 2]
	add	x1, x1, 1
	cmp	w22, w1
	bgt	.L180
	b	.L166
	.size	UTIL_LRGainProcess, .-UTIL_LRGainProcess
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UTIL_LRFadeGainProcess
	.type	UTIL_LRFadeGainProcess, %function
UTIL_LRFadeGainProcess:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x2
	mov	x27, x0
	mov	x0, x30
	mov	x20, x3
	str	w1, [x29, 108]
	bl	_mcount
	ldr	w1, [x19, 12]
	ldr	w0, [x19, 4]
	bl	VolumedB2Coef
	mov	w19, w0
	ldr	w1, [x20, 12]
	ldr	w0, [x20, 4]
	bl	VolumedB2Coef
	sub	w0, w0, w19
	ldr	w2, [x27, 12]
	ldr	x22, [x27]
	sdiv	w28, w0, w2
	cbz	w2, .L231
	ldr	w5, [x29, 108]
	mov	w21, 50
	mov	x23, x22
	mov	w20, 0
	add	w24, w5, w21
	sub	w21, w21, w5
	mul	w3, w28, w24
	mul	w26, w28, w21
	mul	w24, w24, w19
	mul	w21, w19, w21
	b	.L243
	.p2align 3
.L258:
	mov	w0, 34079
	movk	w0, 0x51eb, lsl 16
	blt	.L255
	umull	x1, w21, w0
	mov	w25, w19
	lsr	x1, x1, 32
	lsr	w1, w1, 4
.L233:
	ldr	w0, [x27, 16]
	cmp	w0, 16
	beq	.L256
.L235:
	cmp	w0, 24
	beq	.L257
.L238:
	add	w20, w20, 1
	add	w19, w19, w28
	cmp	w2, w20
	add	w24, w24, w3
	add	w21, w21, w26
	bls	.L231
.L243:
	cmp	w5, wzr
	bne	.L258
	ldr	w0, [x27, 16]
	mov	w25, w19
	mov	w1, w19
	cmp	w0, 16
	bne	.L235
.L256:
	ldrsh	w0, [x23]
	mov	w2, 0
	cbz	w1, .L236
	stp	w5, w3, [x29, 104]
	bl	AOE_FMUL_16_Q15.part.0
	sxth	w2, w0
	ldp	w5, w3, [x29, 104]
.L236:
	strh	w2, [x23]
	mov	w1, 0
	ldrsh	w0, [x23, 2]
	cbz	w25, .L237
	mov	w1, w25
	stp	w5, w3, [x29, 104]
	bl	AOE_FMUL_16_Q15.part.0
	sxth	w1, w0
	ldp	w5, w3, [x29, 104]
.L237:
	strh	w1, [x23, 2]
	add	w20, w20, 1
	add	x23, x23, 4
	add	w19, w19, w28
	ldr	w2, [x27, 12]
	add	w24, w24, w3
	add	w21, w21, w26
	cmp	w2, w20
	bhi	.L243
.L231:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L257:
	mov	w0, 0
	ldr	w2, [x22]
	cbz	w1, .L239
	cmp	w1, 8388608
	bhi	.L240
	smull	x0, w2, w1
	lsr	x0, x0, 23
.L239:
	str	w0, [x22]
	mov	w0, 0
	ldr	w2, [x22, 4]
	cbz	w25, .L241
	cmp	w25, 8388608
	bhi	.L242
	smull	x0, w2, w25
	lsr	x0, x0, 23
.L241:
	str	w0, [x22, 4]
	add	x22, x22, 8
	ldr	w2, [x27, 12]
	b	.L238
	.p2align 3
.L255:
	umull	x25, w24, w0
	mov	w1, w19
	lsr	x25, x25, 32
	lsr	w25, w25, 4
	b	.L233
	.p2align 3
.L240:
	mov	w0, w2
	stp	w5, w3, [x29, 104]
	bl	AOE_FMUL_24_Q15.part.1
	ldp	w5, w3, [x29, 104]
	b	.L239
	.p2align 3
.L242:
	mov	w1, w25
	mov	w0, w2
	stp	w5, w3, [x29, 104]
	bl	AOE_FMUL_24_Q15.part.1
	ldp	w5, w3, [x29, 104]
	b	.L241
	.size	UTIL_LRFadeGainProcess, .-UTIL_LRFadeGainProcess
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UTIL_MixerPro
	.type	UTIL_MixerPro, %function
UTIL_MixerPro:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	mov	w20, w2
	mov	w22, w3
	bl	_mcount
	cmp	x19, xzr
	ccmp	x21, xzr, 4, ne
	ccmp	w20, wzr, 4, ne
	beq	.L259
	cmp	w22, 16
	beq	.L276
	cmp	w22, 24
	beq	.L277
.L259:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L276:
	cbz	w20, .L259
	mov	x3, 0
	.p2align 2
.L264:
	ldrsh	w1, [x19, x3, lsl 1]
	ldrsh	w0, [x21, x3, lsl 1]
	add	w0, w1, w0
	asr	w4, w0, 31
	cmp	w4, w0, asr 15
	eor	w4, w4, 32767
	csel	w0, w4, w0, ne
	strh	w0, [x19, x3, lsl 1]
	add	x3, x3, 1
	cmp	w20, w3
	bhi	.L264
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L277:
	cbz	w20, .L259
	mov	x3, 0
	mov	w6, -2147483648
	mov	w5, 2147483647
	b	.L266
	.p2align 3
.L265:
	str	w0, [x19, x3, lsl 2]
	add	x3, x3, 1
	cmp	w20, w3
	bls	.L259
.L266:
	ldr	w4, [x19, x3, lsl 2]
	ldr	w0, [x21, x3, lsl 2]
	eor	w1, w4, w0
	add	w0, w4, w0
	eor	w2, w4, w0
	tbnz	w1, #31, .L265
	tbz	w2, #31, .L265
	cmp	w4, wzr
	csel	w0, w6, w5, lt
	b	.L265
	.size	UTIL_MixerPro, .-UTIL_MixerPro
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UTIL_ChannelModeProcess
	.type	UTIL_ChannelModeProcess, %function
UTIL_ChannelModeProcess:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	mov	w21, w2
	bl	_mcount
	sub	w1, w19, #1
	ldr	w0, [x20, 12]
	ldr	w3, [x20, 20]
	cmp	w1, 6
	mul	w0, w0, w3
	bhi	.L278
	ldr	x2, .LC5
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx281
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx281:
	.section	.rodata
	.align	0
	.align	2
.L281:
	.byte	(.L280 - .Lrtx281) / 4
	.byte	(.L282 - .Lrtx281) / 4
	.byte	(.L283 - .Lrtx281) / 4
	.byte	(.L284 - .Lrtx281) / 4
	.byte	(.L285 - .Lrtx281) / 4
	.byte	(.L286 - .Lrtx281) / 4
	.byte	(.L287 - .Lrtx281) / 4
	.text
.L287:
	cbz	w0, .L278
	cmp	w21, 16
	ldr	x2, [x20]
	beq	.L382
	cmp	w21, 24
	beq	.L383
.L278:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L285:
	cbz	w0, .L278
	cmp	w21, 16
	ldr	x1, [x20]
	beq	.L384
	cmp	w21, 24
	bne	.L278
	lsr	w0, w0, 1
	cbz	w0, .L278
	sub	w0, w0, #1
	add	x0, x0, 1
	add	x0, x1, x0, lsl 3
	.p2align 2
.L306:
	str	wzr, [x1], 8
	cmp	x1, x0
	bne	.L306
	b	.L278
	.p2align 3
.L286:
	cbz	w0, .L278
	cmp	w21, 16
	ldr	x3, [x20]
	beq	.L385
	cmp	w21, 24
	bne	.L278
	lsr	w1, w0, 1
	cbz	w1, .L278
	sub	w1, w1, #1
	mov	x0, 12
	add	x2, x3, 4
	add	x1, x0, x1, uxtw 3
	add	x0, x3, x1
	.p2align 2
.L309:
	str	wzr, [x2], 8
	cmp	x0, x2
	bne	.L309
	b	.L278
	.p2align 3
.L280:
	cbz	w0, .L278
	cmp	w21, 16
	ldr	x1, [x20]
	beq	.L386
	cmp	w21, 24
	bne	.L278
	lsr	w0, w0, 1
	cbz	w0, .L278
	sub	w0, w0, #1
	mov	w7, -2147483648
	add	x0, x0, 1
	mov	w6, 2147483647
	add	x0, x1, x0, lsl 3
	b	.L294
	.p2align 3
.L293:
	stp	w2, w2, [x1]
	add	x1, x1, 8
	cmp	x1, x0
	beq	.L278
.L294:
	ldp	w3, w2, [x1]
	eor	w4, w3, w2
	add	w2, w3, w2
	eor	w5, w3, w2
	tbnz	w4, #31, .L293
	tbz	w5, #31, .L293
	cmp	w3, wzr
	csel	w2, w7, w6, lt
	b	.L293
	.p2align 3
.L282:
	cbz	w0, .L278
	cmp	w21, 16
	ldr	x1, [x20]
	beq	.L387
	cmp	w21, 24
	bne	.L278
	lsr	w0, w0, 1
	cbz	w0, .L278
	sub	w0, w0, #1
	add	x0, x0, 1
	add	x0, x1, x0, lsl 3
	.p2align 2
.L297:
	ldr	w2, [x1]
	add	x1, x1, 8
	cmp	x0, x1
	str	w2, [x1, -4]
	bne	.L297
	b	.L278
	.p2align 3
.L283:
	cbz	w0, .L278
	cmp	w21, 16
	ldr	x1, [x20]
	beq	.L388
	cmp	w21, 24
	bne	.L278
	lsr	w0, w0, 1
	cbz	w0, .L278
	sub	w0, w0, #1
	add	x0, x0, 1
	add	x0, x1, x0, lsl 3
	.p2align 2
.L300:
	ldr	w2, [x1, 4]
	str	w2, [x1], 8
	cmp	x1, x0
	bne	.L300
	b	.L278
	.p2align 3
.L284:
	cbz	w0, .L278
	cmp	w21, 16
	ldr	x1, [x20]
	beq	.L389
	cmp	w21, 24
	bne	.L278
	lsr	w0, w0, 1
	cbz	w0, .L278
	sub	w0, w0, #1
	add	x0, x0, 1
	add	x0, x1, x0, lsl 3
	.p2align 2
.L303:
	ldp	w2, w3, [x1]
	stp	w3, w2, [x1]
	add	x1, x1, 8
	cmp	x0, x1
	bne	.L303
	b	.L278
	.p2align 3
.L383:
	mov	x1, 0
	.p2align 2
.L312:
	str	wzr, [x2, x1, lsl 2]
	add	x1, x1, 1
	cmp	w0, w1
	bhi	.L312
	b	.L278
	.p2align 3
.L384:
	lsr	w0, w0, 1
	cbz	w0, .L278
	sub	w0, w0, #1
	add	x0, x0, 1
	add	x0, x1, x0, lsl 2
	.p2align 2
.L305:
	strh	wzr, [x1], 4
	cmp	x0, x1
	bne	.L305
	b	.L278
	.p2align 3
.L386:
	lsr	w0, w0, 1
	cbz	w0, .L278
	sub	w0, w0, #1
	add	x0, x0, 1
	add	x0, x1, x0, lsl 2
	.p2align 2
.L292:
	ldrsh	w3, [x1]
	add	x1, x1, 4
	ldrsh	w2, [x1, -2]
	add	w2, w3, w2
	asr	w3, w2, 31
	cmp	w3, w2, asr 15
	eor	w3, w3, 32767
	csel	w2, w3, w2, ne
	cmp	x0, x1
	sxth	w2, w2
	strh	w2, [x1, -4]
	strh	w2, [x1, -2]
	bne	.L292
	b	.L278
	.p2align 3
.L385:
	lsr	w1, w0, 1
	cbz	w1, .L278
	sub	w1, w1, #1
	mov	x0, 6
	add	x2, x3, 2
	add	x1, x0, x1, uxtw 2
	add	x0, x3, x1
	.p2align 2
.L308:
	strh	wzr, [x2], 4
	cmp	x2, x0
	bne	.L308
	b	.L278
	.p2align 3
.L382:
	mov	x1, 0
	.p2align 2
.L311:
	strh	wzr, [x2, x1, lsl 1]
	add	x1, x1, 1
	cmp	w0, w1
	bhi	.L311
	b	.L278
	.p2align 3
.L389:
	lsr	w0, w0, 1
	cbz	w0, .L278
	sub	w0, w0, #1
	add	x0, x0, 1
	add	x0, x1, x0, lsl 2
	.p2align 2
.L302:
	ldrsh	w2, [x1]
	add	x1, x1, 4
	ldrh	w3, [x1, -2]
	strh	w3, [x1, -4]
	strh	w2, [x1, -2]
	cmp	x1, x0
	bne	.L302
	b	.L278
	.p2align 3
.L388:
	lsr	w0, w0, 1
	cbz	w0, .L278
	sub	w0, w0, #1
	add	x0, x0, 1
	add	x0, x1, x0, lsl 2
	.p2align 2
.L299:
	ldrh	w2, [x1, 2]
	strh	w2, [x1], 4
	cmp	x1, x0
	bne	.L299
	b	.L278
	.p2align 3
.L387:
	lsr	w0, w0, 1
	cbz	w0, .L278
	sub	w0, w0, #1
	add	x0, x0, 1
	add	x0, x1, x0, lsl 2
	.p2align 2
.L296:
	ldrh	w2, [x1]
	add	x1, x1, 4
	cmp	x0, x1
	strh	w2, [x1, -2]
	bne	.L296
	b	.L278
	.size	UTIL_ChannelModeProcess, .-UTIL_ChannelModeProcess
	.align	3
.LC5:
	.xword	.L281
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FADE_Create
	.type	FADE_Create, %function
FADE_Create:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	mov	w22, w2
	mov	w21, w3
	bl	_mcount
	mov	w0, 60927
	sub	w1, w20, #1
	movk	w0, 0x2, lsl 16
	str	xzr, [x19]
	cmp	w1, w0
	bhi	.L390
	and	w0, w22, -9
	cmp	w0, 16
	bne	.L390
	sub	w0, w21, #1
	cmp	w0, 1
	ccmp	w21, 8, 4, hi
	beq	.L397
.L390:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L397:
	mov	w1, 36
	mov	w0, 26
	bl	HI_ADSP_MALLOC
	mov	x23, x0
	cbz	x0, .L390
	ldr	x3, .LC6
	mov	x2, 36
	mov	w1, 0
	ldr	x3, [x3, 40]
	blr	x3
	str	w20, [x23, 8]
	stp	w22, w21, [x23]
	str	wzr, [x23, 32]
	str	x23, [x19]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	FADE_Create, .-FADE_Create
	.align	3
.LC6:
	.xword	g_AdspOsalFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FADE_Flush
	.type	FADE_Flush, %function
FADE_Flush:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	mov	w22, w2
	mov	w21, w3
	bl	_mcount
	mov	w0, 60927
	sub	w1, w20, #1
	movk	w0, 0x2, lsl 16
	cmp	w1, w0
	bhi	.L398
	and	w0, w22, -9
	cmp	w0, 16
	bne	.L398
	sub	w0, w21, #1
	cmp	w0, 1
	ccmp	w21, 8, 4, hi
	cset	w1, ne
	cmp	x19, xzr
	cset	w0, ne
	cmp	w1, w0
	bcs	.L398
	ldp	w1, w0, [x19]
	cmp	w21, w0
	beq	.L409
.L402:
	stp	w22, w21, [x19]
	str	w20, [x19, 8]
	ldr	w0, [x19, 12]
	ldr	w2, [x19, 32]
	cbz	x19, .L398
	str	wzr, [x19, 20]
	cbnz	w0, .L403
	str	wzr, [x19, 24]
.L404:
	cmp	w2, 1
	beq	.L410
	cmp	w2, 2
	beq	.L411
.L398:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L409:
	ldr	w0, [x19, 8]
	cmp	w20, w0
	bne	.L402
	cmp	w22, w1
	beq	.L398
	b	.L402
	.p2align 3
.L403:
	mul	w20, w20, w0
	mov	w0, 18849
	movk	w0, 0xcf20, lsl 16
	umull	x0, w20, w0
	lsr	x0, x0, 48
	add	w0, w0, 1
	str	w0, [x19, 24]
	b	.L404
	.p2align 3
.L411:
	mov	w0, 18
	str	w0, [x19, 16]
	b	.L398
	.p2align 3
.L410:
	mov	w0, 99
	str	wzr, [x19, 28]
	str	w0, [x19, 16]
	b	.L398
	.size	FADE_Flush, .-FADE_Flush
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FADE_Destroy
	.type	FADE_Destroy, %function
FADE_Destroy:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L412
	mov	x1, x19
	mov	w0, 26
	bl	HI_ADSP_FREE
.L412:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FADE_Destroy, .-FADE_Destroy
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FADE_Active
	.type	FADE_Active, %function
FADE_Active:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w21, w1
	mov	w19, w2
	bl	_mcount
	cbz	x20, .L417
	str	w19, [x20, 12]
	str	wzr, [x20, 20]
	str	w21, [x20, 32]
	cbz	w19, .L424
	ldr	w2, [x20, 8]
	mov	w0, 18849
	movk	w0, 0xcf20, lsl 16
	cmp	w21, 1
	mul	w19, w19, w2
	umull	x0, w19, w0
	lsr	x0, x0, 48
	add	w0, w0, 1
	str	w0, [x20, 24]
	beq	.L425
.L422:
	cmp	w21, 2
	bne	.L417
	mov	w0, 18
	str	w0, [x20, 16]
.L417:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L424:
	str	wzr, [x20, 24]
	cmp	w21, 1
	bne	.L422
.L425:
	str	wzr, [x20, 28]
	mov	w0, 99
	str	w0, [x20, 16]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	FADE_Active, .-FADE_Active
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FADE_InProcess
	.type	FADE_InProcess, %function
FADE_InProcess:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	mov	w25, w2
	bl	_mcount
	cbz	x20, .L426
	ldr	w0, [x20, 32]
	cbz	w0, .L426
	ldr	w3, [x20, 4]
	mov	w22, w3
	cbz	w25, .L426
	sxtw	x21, w3
	ldr	x26, .LC7
	lsl	x23, x21, 1
	sub	w25, w25, #1
	lsl	x21, x21, 2
	mov	w24, 1
	.p2align 2
.L442:
	ldr	w0, [x20, 28]
	ldr	w1, [x20]
	cbnz	w0, .L429
	cbnz	w3, .L434
	b	.L430
	.p2align 3
.L431:
	cmp	w1, 24
	beq	.L460
.L433:
	cmp	w3, w0
	beq	.L430
.L434:
	cmp	w1, 16
	add	w0, w0, 1
	bne	.L431
	ldrsh	w2, [x19]
	cbz	w2, .L433
.L432:
	str	w24, [x20, 28]
.L429:
	ldr	w0, [x20, 16]
	cmp	w1, 16
	ldr	w2, [x26, x0, lsl 2]
	beq	.L439
	cmp	w1, 24
	bne	.L440
	mov	x0, x19
	mov	w1, w22
	add	x19, x19, x21
	bl	Volume24BitPro_Coef
.L440:
	ldp	w0, w1, [x20, 20]
	add	w0, w0, 1
	str	w0, [x20, 20]
	cmp	w0, w1
	beq	.L461
.L438:
	sub	w0, w25, #1
	cbz	w25, .L426
.L462:
	mov	w25, w0
	ldr	w3, [x20, 4]
	b	.L442
	.p2align 3
.L460:
	ldr	w2, [x19]
	cbnz	w2, .L432
	cmp	w3, w0
	bne	.L434
.L430:
	cmp	w1, 16
	beq	.L435
	add	x0, x19, x21
	cmp	w1, 24
	csel	x19, x19, x0, ne
	sub	w0, w25, #1
	cbnz	w25, .L462
.L426:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L439:
	mov	x0, x19
	mov	w1, w22
	add	x19, x19, x23
	bl	Volume16BitPro_Coef
	ldp	w0, w1, [x20, 20]
	add	w0, w0, 1
	str	w0, [x20, 20]
	cmp	w0, w1
	bne	.L438
.L461:
	ldr	w0, [x20, 32]
	str	wzr, [x20, 20]
	cmp	w0, 1
	bne	.L438
	ldr	w0, [x20, 16]
	sub	w0, w0, #1
	str	w0, [x20, 16]
	cmp	w0, 18
	bne	.L438
	str	wzr, [x20, 32]
	b	.L438
	.p2align 3
.L435:
	add	x19, x19, x23
	b	.L438
	.size	FADE_InProcess, .-FADE_InProcess
	.align	3
.LC7:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FADE_OutProcess
	.type	FADE_OutProcess, %function
FADE_OutProcess:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	mov	w20, w2
	bl	_mcount
	cbz	x19, .L463
	ldr	w22, [x19, 4]
	cbz	w20, .L463
	sxtw	x24, w22
	ldr	x23, .LC8
	lsl	x25, x24, 1
	lsl	x24, x24, 2
	.p2align 2
.L472:
	ldr	w0, [x19]
	ldr	w1, [x19, 16]
	cmp	w0, 16
	ldr	w2, [x23, x1, lsl 2]
	beq	.L467
	cmp	w0, 24
	mov	w1, w22
	mov	x0, x21
	bne	.L466
	add	x21, x21, x24
	bl	Volume24BitPro_Coef
.L466:
	ldp	w0, w1, [x19, 20]
	sub	w20, w20, #1
	add	w0, w0, 1
	str	w0, [x19, 20]
	cmp	w0, w1
	beq	.L477
.L470:
	cbnz	w20, .L472
.L463:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L477:
	ldr	w0, [x19, 32]
	str	wzr, [x19, 20]
	cmp	w0, 2
	bne	.L470
	ldr	w0, [x19, 16]
	add	w0, w0, 1
	str	w0, [x19, 16]
	cmp	w0, 99
	bne	.L470
	str	wzr, [x19, 32]
	cbnz	w20, .L472
	b	.L463
	.p2align 3
.L467:
	mov	x0, x21
	mov	w1, w22
	add	x21, x21, x25
	bl	Volume16BitPro_Coef
	b	.L466
	.size	FADE_OutProcess, .-FADE_OutProcess
	.align	3
.LC8:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Util_sqrt
	.type	Util_sqrt, %function
Util_sqrt:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	cbz	w19, .L479
	tbnz	x19, 0, .L488
	mov	w0, 1
	.p2align 2
.L482:
	lsr	w1, w19, w0
	tbnz	x1, 0, .L490
	add	w0, w0, 1
	cmp	w0, 16
	bne	.L482
	mov	w0, 8
.L480:
	lsl	w0, w1, w0
	udiv	w1, w19, w0
	b	.L483
	.p2align 3
.L491:
	cmp	w3, 1
	add	w1, w1, w0
	cset	w2, hi
	cbz	w2, .L479
.L486:
	lsr	w0, w1, 1
	udiv	w1, w19, w0
.L483:
	cmp	w1, w0
	sub	w2, w0, w1
	sub	w3, w1, w0
	bhi	.L491
	cmp	w2, 1
	add	w1, w1, w0
	cset	w2, hi
	cbnz	w2, .L486
.L479:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L490:
	lsr	w0, w0, 1
	b	.L480
.L488:
	mov	w1, w19
	mov	w0, 0
	b	.L480
	.size	Util_sqrt, .-Util_sqrt
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UTIL_DRE_16BIT_Process
	.type	UTIL_DRE_16BIT_Process, %function
UTIL_DRE_16BIT_Process:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	w1, [x20, 24]
	mov	w9, 19923
	movk	w9, 0x1062, lsl 16
	ldr	w13, [x20, 12]
	lsl	w0, w1, 6
	ldr	w14, [x19, 16]
	sub	w0, w0, w1
	subs	w8, w13, #1
	lsl	w0, w0, 1
	ldr	x10, [x20]
	sub	w0, w0, w1
	lsl	w0, w0, 3
	ldp	w6, w5, [x19]
	umull	x9, w0, w9
	lsr	x9, x9, 32
	lsr	w9, w9, 6
	bmi	.L512
	mov	x4, x10
	mov	w7, w8
	mov	w1, 0
	mov	w11, 0
	mov	w12, -32768
	mov	w3, 32767
	b	.L498
	.p2align 3
.L494:
	add	w6, w6, 512
.L495:
	ldrsh	w0, [x4, 2]
	add	x4, x4, 4
	madd	w11, w2, w2, w11
	sub	w0, w0, w5, lsr 16
	cmn	w0, #32768
	csel	w0, w0, w12, ge
	cmp	w0, w3
	csel	w0, w0, w3, le
	tbnz	w0, #31, .L515
	subs	w7, w7, #1
	add	w5, w5, 512
	madd	w1, w0, w0, w1
	bmi	.L493
.L498:
	ldrsh	w2, [x4]
	sub	w2, w2, w6, lsr 16
	cmn	w2, #32768
	csel	w2, w2, w12, ge
	cmp	w2, w3
	csel	w2, w2, w3, le
	tbz	w2, #31, .L494
	sub	w6, w6, #512
	b	.L495
	.p2align 3
.L515:
	subs	w7, w7, #1
	sub	w5, w5, #512
	madd	w1, w0, w0, w1
	bpl	.L498
.L493:
	udiv	w11, w11, w13
	stp	w6, w5, [x19]
	cmp	w14, w11
	bls	.L499
	ldr	w0, [x19, 8]
	cmp	w9, w0
	bhi	.L516
.L500:
	udiv	w1, w1, w13
	cmp	w14, w1
	bls	.L501
	ldr	w0, [x19, 12]
	cmp	w9, w0
	bhi	.L517
.L502:
	ldr	w2, [x19, 20]
	ldr	w0, [x20, 16]
	cmp	w0, w2
	bls	.L492
	ldr	w0, [x19, 8]
	cmp	w9, w0
	bhi	.L505
	tbnz	w8, #31, .L492
	mov	w16, 26125
	mov	w15, 62303
	mov	x12, x10
	mov	w11, w8
	add	x0, x19, 24
	mov	w14, 32
	movk	w16, 0x19, lsl 16
	movk	w15, 0x3c6e, lsl 16
	mov	x13, 1
	b	.L507
	.p2align 3
.L518:
	ldr	w2, [x19, 20]
.L507:
	ldp	w6, w4, [x0, 8]
	ldp	w5, w17, [x0]
	cmp	w2, 32
	ldrsh	w1, [x12]
	csel	w2, w2, w14, ls
	sub	w7, w5, w17
	madd	w18, w4, w16, w15
	sub	w3, w14, w2
	add	w6, w7, w6
	sub	w7, w2, #1
	add	w6, w6, w1
	lsr	w4, w4, w3
	lsl	x7, x13, x7
	lsr	w3, w18, w3
	sub	w1, w7, w4
	add	w4, w3, w6
	lsl	x3, x13, x2
	neg	w3, w3
	add	w4, w1, w4
	and	w1, w4, w3
	add	w5, w5, w5, lsr 31
	sub	w6, w6, w1
	asr	w3, w5, 1
	stp	w17, w18, [x0, 8]
	stp	w6, w3, [x0]
	lsr	w1, w1, w2
	subs	w11, w11, #1
	strh	w1, [x12], 4
	bpl	.L518
	ldr	w1, [x19, 12]
	cmp	w1, w9
	bcc	.L492
	add	x10, x10, 2
	ldr	w2, [x19, 20]
	b	.L510
	.p2align 3
.L505:
	ldr	w0, [x19, 12]
	cmp	w9, w0
	bls	.L519
.L492:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L501:
	str	wzr, [x19, 12]
	b	.L502
	.p2align 3
.L499:
	str	wzr, [x19, 8]
	b	.L500
	.p2align 3
.L517:
	add	w0, w13, w0
	str	w0, [x19, 12]
	b	.L502
	.p2align 3
.L516:
	add	w0, w13, w0
	str	w0, [x19, 8]
	b	.L500
	.p2align 3
.L519:
	add	x10, x10, 2
	tbnz	w8, #31, .L492
	add	x0, x19, 24
.L510:
	mov	w14, 26125
	mov	w13, 62303
	mov	w12, 32
	movk	w14, 0x19, lsl 16
	movk	w13, 0x3c6e, lsl 16
	mov	x11, 1
	b	.L509
	.p2align 3
.L520:
	ldr	w2, [x19, 20]
.L509:
	ldp	w6, w4, [x0, 8]
	ldp	w5, w16, [x0]
	cmp	w2, 32
	ldrsh	w7, [x10]
	csel	w1, w2, w12, ls
	sub	w2, w5, w16
	madd	w15, w4, w14, w13
	sub	w3, w12, w1
	add	w6, w2, w6
	sub	w9, w1, #1
	add	w6, w6, w7
	lsr	w4, w4, w3
	lsl	x9, x11, x9
	lsr	w3, w15, w3
	sub	w7, w9, w4
	add	w4, w3, w6
	lsl	x3, x11, x1
	add	w4, w7, w4
	neg	w3, w3
	and	w2, w4, w3
	add	w5, w5, w5, lsr 31
	sub	w6, w6, w2
	asr	w5, w5, 1
	stp	w16, w15, [x0, 8]
	stp	w6, w5, [x0]
	lsr	w2, w2, w1
	subs	w8, w8, #1
	strh	w2, [x10], 4
	bpl	.L520
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L512:
	mov	w1, 0
	mov	w11, 0
	b	.L493
	.size	UTIL_DRE_16BIT_Process, .-UTIL_DRE_16BIT_Process
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	g_u32VolCoef, %object
	.size	g_u32VolCoef, 400
g_u32VolCoef:
	.word	66633081
	.word	59386796
	.word	52928538
	.word	47172609
	.word	42042632
	.word	37470535
	.word	33395649
	.word	29763904
	.word	26527107
	.word	23642309
	.word	21071230
	.word	18779754
	.word	16737473
	.word	14917288
	.word	13295047
	.word	11849223
	.word	10560631
	.word	9412172
	.word	8388608
	.word	7476354
	.word	6663308
	.word	5938679
	.word	5292853
	.word	4717260
	.word	4204263
	.word	3747053
	.word	3339564
	.word	2976390
	.word	2652710
	.word	2364230
	.word	2107123
	.word	1877975
	.word	1673747
	.word	1491728
	.word	1329504
	.word	1184922
	.word	1056063
	.word	941217
	.word	838860
	.word	747635
	.word	666330
	.word	593867
	.word	529285
	.word	471726
	.word	420426
	.word	374705
	.word	333956
	.word	297639
	.word	265271
	.word	236423
	.word	210712
	.word	187797
	.word	167374
	.word	149172
	.word	132950
	.word	118492
	.word	105606
	.word	94121
	.word	83886
	.word	74763
	.word	66633
	.word	59386
	.word	52928
	.word	47172
	.word	42042
	.word	37470
	.word	33395
	.word	29763
	.word	26527
	.word	23642
	.word	21071
	.word	18779
	.word	16737
	.word	14917
	.word	13295
	.word	11849
	.word	10560
	.word	9412
	.word	8388
	.word	7476
	.word	6663
	.word	5938
	.word	5292
	.word	4717
	.word	4204
	.word	3747
	.word	3339
	.word	2976
	.word	2652
	.word	2364
	.word	2107
	.word	1877
	.word	1673
	.word	1491
	.word	1329
	.word	1184
	.word	1056
	.word	941
	.word	838
	.word	0
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
