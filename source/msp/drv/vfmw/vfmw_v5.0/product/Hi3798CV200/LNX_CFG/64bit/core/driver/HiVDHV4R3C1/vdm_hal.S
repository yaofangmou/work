#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_GetHalMemSize
	.type	VDMHAL_V4R3C1_GetHalMemSize, %function
VDMHAL_V4R3C1_GetHalMemSize:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 24576
	movk	w0, 0x9, lsl 16
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V4R3C1_GetHalMemSize, .-VDMHAL_V4R3C1_GetHalMemSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_OpenHAL
	.type	VDMHAL_V4R3C1_OpenHAL, %function
VDMHAL_V4R3C1_OpenHAL:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L15
	ldp	w7, w3, [x19]
	ldr	w0, [x19, 8]
	cbz	w7, .L16
	mov	w1, 24575
	movk	w1, 0x9, lsl 16
	cmp	w3, w1
	ble	.L17
	cmp	w0, wzr
	bgt	.L18
	sxtw	x4, w0
	ldr	x19, .LC0
	lsl	x2, x4, 6
	mov	w1, 1256
	sub	x2, x2, x4
	add	w5, w7, 1023
	lsl	x2, x2, 2
	and	w5, w5, -1024
	sub	x6, x2, x4
	add	w8, w7, w3
	smull	x1, w0, w1
	add	x6, x2, x6, lsl 2
	sub	w8, w8, w5
	add	x6, x19, x6
	add	x0, x1, 56
	add	x1, x1, 896
	mov	w9, 1024
	add	x2, x19, x1
	add	x0, x19, x0
	mov	w1, w5
	str	w9, [x6, 40]
	stp	w5, w8, [x6, 32]
	.p2align 2
.L8:
	str	w1, [x0], 4
	add	w1, w1, 1280
	cmp	x0, x2
	bne	.L8
	lsl	x0, x4, 6
	add	w2, w5, 266240
	sub	x0, x0, x4
	add	w2, w2, 3072
	lsl	x0, x0, 2
	add	w5, w2, 4096
	sub	x4, x0, x4
	add	w5, w5, 1024
	add	w1, w5, 32768
	mov	w6, 210
	add	x0, x0, x4, lsl 2
	add	w1, w1, 1023
	add	x19, x19, x0
	and	w1, w1, -32768
	add	w9, w1, 8192
	add	w4, w1, 45056
	add	w9, w9, 768
	add	w8, w1, 176128
	str	w6, [x19, 1080]
	add	x6, x19, 1024
	add	w8, w8, 3072
	add	w0, w1, 180224
	add	w0, w0, 3072
	add	w10, w1, 143360
	stp	w2, w1, [x6, 80]
	stp	w1, w1, [x6, 88]
	str	w9, [x19, 1132]
	add	x9, x19, 1024
	str	w5, [x19, 1124]
	add	w2, w10, 3072
	add	w6, w1, 4096
	add	w5, w1, 32768
	stp	wzr, w4, [x9, 132]
	stp	w4, w4, [x9, 140]
	str	w4, [x19, 1176]
	add	w6, w6, 2816
	str	w4, [x19, 1208]
	add	w4, w1, 81920
	str	w8, [x19, 1200]
	add	w8, w4, 3968
	cmp	w0, w8
	str	w2, [x19, 1196]
	csel	w0, w0, w8, cs
	str	w2, [x19, 1204]
	str	w2, [x19, 1220]
	sub	w2, w0, w7
	add	w5, w5, 1536
	add	w0, w4, 768
	str	w1, [x19, 1172]
	cmp	w3, w2
	str	wzr, [x19, 1184]
	str	w10, [x19, 1192]
	str	w6, [x19, 1120]
	str	w6, [x19, 1128]
	str	w5, [x19, 1136]
	str	w5, [x19, 1140]
	str	w8, [x19, 1152]
	str	w0, [x19, 1144]
	str	w0, [x19, 1148]
	bcc	.L9
	mov	x0, x19
	bl	H264HAL_V4R3C1_InitHal
	cmp	w0, wzr
	mov	x0, x19
	csetm	w19, ne
	bl	HEVCHAL_V4R3C1_InitHal
	cmp	w0, wzr
	csinv	w19, w19, wzr, eq
.L4:
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L18:
	ldr	x1, .LC13
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	b	.L4
.L9:
	ldr	x1, .LC15
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	b	.L4
.L16:
	ldr	x3, .LC9
.L13:
	ldr	x2, .LC5
	mov	w0, 0
	ldr	x1, .LC7
	mov	w19, -1
	bl	dprint_vfmw
	b	.L4
.L17:
	ldr	x3, .LC11
	b	.L13
.L15:
	ldr	x3, .LC4
	b	.L13
	.size	VDMHAL_V4R3C1_OpenHAL, .-VDMHAL_V4R3C1_OpenHAL
	.align	3
.LC0:
	.xword	g_HwMem
	.align	3
.LC4:
	.xword	.LC3
	.align	3
.LC5:
	.xword	.LANCHOR0
	.align	3
.LC7:
	.xword	.LC6
	.align	3
.LC9:
	.xword	.LC8
	.align	3
.LC11:
	.xword	.LC10
	.align	3
.LC13:
	.xword	.LC12
	.align	3
.LC15:
	.xword	.LC14
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_CloseHAL
	.type	VDMHAL_V4R3C1_CloseHAL, %function
VDMHAL_V4R3C1_CloseHAL:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V4R3C1_CloseHAL, .-VDMHAL_V4R3C1_CloseHAL
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_CalcFsSize
	.type	VDMHAL_V4R3C1_CalcFsSize, %function
VDMHAL_V4R3C1_CalcFsSize:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w23, w0
	mov	x0, x30
	mov	w26, w1
	mov	w27, w2
	mov	w24, w3
	mov	w25, w4
	mov	x22, x5
	bl	_mcount
	sub	w1, w26, #32
	mov	w0, 8160
	cmp	w1, w0
	bhi	.L21
	sub	w1, w27, #32
	mov	w21, w27
	cmp	w1, w0
	bhi	.L21
	add	w0, w26, 15
	add	w20, w27, 15
	asr	w0, w0, 4
	ldr	x1, .LC20
	mov	w2, 36
	asr	w20, w20, 4
	cmp	w0, 45
	mov	w19, 32
	ccmp	w20, w2, 0, le
	ldrb	w1, [x1]
	cset	w4, le
	mov	w2, 64
	cmp	w4, wzr
	lsl	w3, w0, 4
	csel	w19, w19, w2, eq
	cmp	w1, 1
	csel	w19, w19, w2, ne
	cmp	w25, 16
	beq	.L26
	cmp	w25, 17
	beq	.L47
	mul	w19, w0, w19
	ldr	x4, .LC22
	add	w3, w3, 255
	add	w21, w27, 31
	and	w28, w3, -256
	mul	w19, w19, w20
	ldr	x0, [x4, w23, sxtw 3]
	and	w21, w21, -32
	add	w19, w19, 143
	mov	w5, 0
	and	w19, w19, -128
	mov	w6, 0
	asr	w3, w19, 1
.L37:
	ldr	w1, [x0, 1320]
	cmp	w1, 1
	beq	.L48
.L41:
	cmp	w24, 1
	mov	w27, 0
	mov	w7, 0
	mov	w26, 0
	mul	w21, w21, w28
	beq	.L49
.L30:
	mul	w1, w5, w6
	lsl	w20, w26, 2
	lsl	w2, w1, 2
	sub	w20, w20, w26
	sub	w2, w2, w1
	lsl	w1, w21, 2
	sub	w1, w1, w21
	lsr	w1, w1, 1
	add	w1, w1, w2, lsr 1
	add	w20, w1, w20, lsr 1
.L31:
	add	x1, x0, 307200
	ldr	w1, [x1, 1832]
	cbz	w1, .L50
	add	x2, x0, 311296
	cmp	w25, 17
	str	w3, [x2, 124]
	lsl	w3, w28, 4
	stp	w7, w27, [x2, 84]
	str	w20, [x2, 1304]
	beq	.L33
.L52:
	add	x1, x0, 307200
	ldr	w1, [x1, 1840]
	str	w3, [x2, 76]
	lsr	w3, w3, 1
	cmp	w1, 32
	str	w3, [x2, 80]
	mov	w3, 32
	csel	w1, w1, w3, le
	cmp	w25, 16
	str	w1, [x2, 128]
	add	w1, w21, w26
	str	w1, [x2, 108]
	beq	.L51
.L35:
	ldr	x0, [x4, w23, sxtw 3]
	mov	w5, 4096
	add	w1, w20, 1056
	add	x3, x0, 311296
	add	w2, w1, w19
	add	w6, w2, w5
	str	w19, [x3, 1308]
	str	w5, [x3, 1316]
	ldrsb	w0, [x0, 44]
	cmp	w0, 1
	csel	w2, w6, w2, eq
	cbz	x22, .L42
	str	w1, [x22, 4]
	mov	w0, 0
	ldr	x3, [x4, w23, sxtw 3]
	add	x3, x3, 307200
	ldr	w3, [x3, 1840]
	stp	w3, w19, [x22, 8]
	ldr	x3, [x4, w23, sxtw 3]
	add	x3, x3, 311296
	ldr	w3, [x3, 128]
	stp	w3, w5, [x22, 16]
	str	w2, [x22]
	ldr	x2, [x4, w23, sxtw 3]
	add	x2, x2, 311296
	str	w1, [x2, 1312]
.L43:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L51:
	ldr	w0, [x0, 1684]
	cmp	w0, 8
	ble	.L35
	lsl	w0, w21, 2
	ldr	x1, .LC24
	sub	w21, w0, w21
	lsl	w0, w26, 2
	sub	w26, w0, w26
	mov	w0, 31
	mul	w5, w5, w6
	lsr	w26, w26, 1
	lsl	w6, w6, 5
	add	w21, w26, w21, lsr 1
	str	w6, [x2, 92]
	stp	w21, w5, [x2, 100]
	str	x4, [x29, 120]
	bl	dprint_vfmw
	ldr	x4, [x29, 120]
	b	.L35
	.p2align 3
.L50:
	ldr	x1, .LC21
	add	x0, x0, 311296
	mov	x2, 1248
	add	x0, x0, 72
	str	x4, [x29, 96]
	ldr	x8, [x1, 96]
	mov	w1, 0
	stp	w7, w6, [x29, 108]
	stp	w5, w3, [x29, 116]
	blr	x8
	ldr	x4, [x29, 96]
	cmp	w25, 17
	ldp	w5, w3, [x29, 116]
	ldp	w7, w6, [x29, 108]
	ldr	x0, [x4, w23, sxtw 3]
	add	x2, x0, 311296
	str	w3, [x2, 124]
	lsl	w3, w28, 4
	stp	w7, w27, [x2, 84]
	str	w20, [x2, 1304]
	bne	.L52
.L33:
	mov	w0, 1
	add	w21, w21, w26
	str	w0, [x2, 128]
	lsr	w0, w3, 1
	str	w3, [x2, 76]
	str	w21, [x2, 108]
	str	w0, [x2, 80]
	b	.L35
	.p2align 3
.L26:
	ldr	x4, .LC22
	mul	w19, w20, w3
	add	w3, w26, 255
	ldr	x0, [x4, w23, sxtw 3]
	add	w19, w19, 143
	and	w28, w3, -256
	and	w19, w19, -128
	ldr	w1, [x0, 1684]
	cmp	w1, 8
	ble	.L53
	ldr	w1, [x0, 1320]
	add	w5, w27, 31
	and	w5, w5, -32
	lsr	w6, w28, 2
	cmp	w1, 1
	asr	w3, w19, 1
	bne	.L41
	.p2align 2
.L48:
	adds	w1, w26, 511
	add	w26, w26, 1022
	csel	w26, w26, w1, mi
	add	w1, w27, 126
	and	w26, w26, -512
	cmp	w26, wzr
	add	w7, w26, 63
	csel	w7, w7, w26, lt
	adds	w26, w27, 63
	csel	w26, w1, w26, mi
	asr	w7, w7, 6
	asr	w26, w26, 6
	lsl	w7, w7, 1
	lsl	w26, w26, 5
	cmp	w24, 1
	mul	w21, w21, w28
	mul	w26, w26, w7
	mov	w27, w26
	bne	.L30
.L49:
	lsl	w1, w20, 6
	sub	w20, w1, w20, lsl 4
	mul	w20, w20, w28
	b	.L31
	.p2align 3
.L47:
	ldr	x4, .LC22
	add	w3, w26, 255
	add	w21, w27, 63
	and	w28, w3, -256
	mov	w19, 128
	mov	w3, 64
	and	w21, w21, -64
	movk	w3, 0x12, lsl 16
	ldr	x0, [x4, w23, sxtw 3]
	movk	w19, 0x24, lsl 16
	mov	w5, 0
	mov	w6, 0
	b	.L37
	.p2align 3
.L53:
	asr	w3, w19, 1
	mov	w5, 0
	mov	w6, 0
	b	.L37
	.p2align 3
.L42:
	mov	w0, 0
	b	.L43
	.p2align 3
.L21:
	ldr	x2, .LC18
	mov	w0, 0
	ldr	x3, .LC17
	ldr	x1, .LC19
	add	x2, x2, 24
	bl	dprint_vfmw
	mov	w0, -1
	b	.L43
	.size	VDMHAL_V4R3C1_CalcFsSize, .-VDMHAL_V4R3C1_CalcFsSize
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC18:
	.xword	.LANCHOR0
	.align	3
.LC19:
	.xword	.LC6
	.align	3
.LC20:
	.xword	g_not_direct_8x8_inference_flag
	.align	3
.LC21:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC22:
	.xword	s_pstVfmwChan
	.align	3
.LC24:
	.xword	.LC23
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_GetRpuSize
	.type	VDMHAL_V4R3C1_GetRpuSize, %function
VDMHAL_V4R3C1_GetRpuSize:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 4096
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V4R3C1_GetRpuSize, .-VDMHAL_V4R3C1_GetRpuSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_CalcFsNum
	.type	VDMHAL_V4R3C1_CalcFsNum, %function
VDMHAL_V4R3C1_CalcFsNum:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x19, x3
	mov	x0, x30
	mov	w21, w1
	bl	_mcount
	cbz	x19, .L60
	cmp	w21, 17
	ldr	x2, .LC28
	beq	.L61
	ldr	x1, [x2, w20, sxtw 3]
	mov	w5, 32
	add	x4, x1, 307200
	add	x3, x1, 311296
	ldr	w0, [x4, 1840]
	cmp	w0, w5
	csel	w0, w0, w5, le
	str	w0, [x3, 128]
	ldr	w0, [x1, 704]
	cmp	w0, 2
	beq	.L62
.L59:
	ldr	x1, [x2, w20, sxtw 3]
	mov	w0, 0
	add	x1, x1, 307200
	ldr	w1, [x1, 1840]
	str	w1, [x19, 8]
	ldr	x1, [x2, w20, sxtw 3]
	add	x1, x1, 311296
	ldr	w1, [x1, 128]
	str	w1, [x19, 16]
.L57:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L61:
	ldr	x0, [x2, w20, sxtw 3]
	mov	w1, 1
	add	x0, x0, 311296
	str	w1, [x0, 128]
	b	.L59
	.p2align 3
.L62:
	ldr	w0, [x4, 1844]
	str	w0, [x3, 128]
	b	.L59
.L60:
	ldr	x2, .LC25
	mov	w0, 1
	ldr	x1, .LC27
	add	x2, x2, 56
	bl	dprint_vfmw
	mov	w0, -1
	b	.L57
	.size	VDMHAL_V4R3C1_CalcFsNum, .-VDMHAL_V4R3C1_CalcFsNum
	.align	3
.LC25:
	.xword	.LANCHOR0
	.align	3
.LC27:
	.xword	.LC26
	.align	3
.LC28:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_DynamicAllocFrame
	.type	VDMHAL_V4R3C1_DynamicAllocFrame, %function
VDMHAL_V4R3C1_DynamicAllocFrame:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	w22, w1
	mov	w21, w2
	mov	x20, x3
	bl	_mcount
	ldr	x23, .LC29
	mov	w0, w19
	ldr	x1, [x23, w19, sxtw 3]
	add	x1, x1, 307200
	add	x1, x1, 1864
	bl	DelAllFrameMemRecord
	cbnz	w0, .L83
.L64:
	ldr	x1, [x23, w19, sxtw 3]
	mov	w2, 255
	add	x0, x1, 307200
	add	x1, x1, 311296
	add	x0, x0, 1864
	add	x1, x1, 72
	.p2align 2
.L65:
	str	w2, [x0], 72
	cmp	x1, x0
	bne	.L65
	mov	w0, 1088
	cmp	w22, 1920
	ccmp	w21, w0, 0, le
	ble	.L66
	ldr	x0, [x23, w19, sxtw 3]
	ldr	w1, [x20, 8]
.L67:
	add	x2, x0, 307200
	ldr	w3, [x0, 1624]
	mov	w0, w19
	add	w1, w3, w1
	str	w1, [x2, 1844]
	bl	VCTRL_GetVidStd
	ldr	x1, [x23, w19, sxtw 3]
	ldr	w2, [x1, 704]
	cmp	w2, 2
	ccmp	w0, 17, 4, eq
	beq	.L70
	add	x1, x1, 307200
	ldr	w0, [x1, 1844]
	str	w0, [x20, 16]
	ldr	x1, [x23, w19, sxtw 3]
.L70:
	add	x0, x1, 311296
	add	x1, x1, 278528
	mov	w4, 1
	mov	w3, w21
	mov	w2, w22
	str	wzr, [x0, 1344]
	str	w4, [x1, 2224]
	str	w4, [x0, 1884]
	mov	w0, 31
	ldr	x1, .LC33
	ldr	w4, [x20, 8]
	ldr	w5, [x20, 16]
	bl	dprint_vfmw
	ldr	x0, .LC34
	ldr	x4, [x0]
	cbz	x4, .L71
	ldp	w1, w2, [x20, 12]
	ldp	w3, w5, [x20, 4]
	ldr	w0, [x20, 20]
	stp	w2, w1, [x29, 72]
	stp	w5, w3, [x29, 64]
	stp	w0, w22, [x29, 80]
	str	w21, [x29, 88]
	mov	w3, 28
	add	x2, x29, 64
	mov	w1, 121
	mov	w0, w19
	blr	x4
.L71:
	ldr	x3, .LC35
	mov	x2, 528
	ldr	x0, [x23, w19, sxtw 3]
	mov	w1, 0
	ldr	x3, [x3, 96]
	add	x0, x0, 311296
	add	x0, x0, 1352
	blr	x3
	ldr	x1, [x23, w19, sxtw 3]
	mov	w0, w19
	add	x1, x1, 311296
	str	wzr, [x1, 1880]
	bl	FSP_ClearContextAll
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L66:
	ldr	x0, [x23, w19, sxtw 3]
	ldr	w1, [x0, 36]
	cmp	w1, 24
	beq	.L82
	add	x1, x0, 311296
	ldr	w1, [x1, 1940]
	cbnz	w1, .L82
	ldr	w1, [x20, 8]
	add	w1, w1, 4
	str	w1, [x20, 8]
	ldr	x0, [x23, w19, sxtw 3]
	b	.L67
.L82:
	ldr	w1, [x20, 8]
	b	.L67
.L83:
	ldr	x1, .LC31
	mov	w0, 0
	bl	dprint_vfmw
	b	.L64
	.size	VDMHAL_V4R3C1_DynamicAllocFrame, .-VDMHAL_V4R3C1_DynamicAllocFrame
	.align	3
.LC29:
	.xword	s_pstVfmwChan
	.align	3
.LC31:
	.xword	.LC30
	.align	3
.LC33:
	.xword	.LC32
	.align	3
.LC34:
	.xword	g_event_report
	.align	3
.LC35:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_DynamicAllocFrame_Only
	.type	VDMHAL_V4R3C1_DynamicAllocFrame_Only, %function
VDMHAL_V4R3C1_DynamicAllocFrame_Only:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x3
	mov	w22, w1
	mov	w21, w2
	bl	_mcount
	ldr	x4, .LC36
	mov	w3, w21
	ldr	w5, [x19, 8]
	mov	w2, w22
	ldr	x1, .LC38
	mov	w0, 31
	ldr	x4, [x4, w20, sxtw 3]
	add	x4, x4, 307200
	str	w5, [x4, 1844]
	ldr	w4, [x19, 8]
	ldr	w5, [x19, 16]
	bl	dprint_vfmw
	ldr	x0, .LC39
	ldr	x4, [x0]
	cbz	x4, .L84
	ldp	w1, w2, [x19, 12]
	ldp	w3, w5, [x19, 4]
	ldr	w0, [x19, 20]
	stp	w2, w1, [x29, 56]
	stp	w5, w3, [x29, 48]
	stp	w0, w22, [x29, 64]
	str	w21, [x29, 72]
	mov	w3, 28
	add	x2, x29, 48
	mov	w1, 122
	mov	w0, w20
	blr	x4
.L84:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.size	VDMHAL_V4R3C1_DynamicAllocFrame_Only, .-VDMHAL_V4R3C1_DynamicAllocFrame_Only
	.align	3
.LC36:
	.xword	s_pstVfmwChan
	.align	3
.LC38:
	.xword	.LC37
	.align	3
.LC39:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_ArrangeMem_Normal
	.type	VDMHAL_V4R3C1_ArrangeMem_Normal, %function
VDMHAL_V4R3C1_ArrangeMem_Normal:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	w19, w0
	mov	x0, x30
	mov	w22, w1
	mov	w23, w2
	mov	w24, w3
	mov	w25, w4
	mov	w27, w5
	mov	x21, x6
	bl	_mcount
	str	xzr, [x29, 120]
	add	x0, x29, 104
	cmp	w22, 21
	stp	xzr, xzr, [x0]
	bhi	.L119
	ldr	x20, .LC44
	ldr	x0, [x20, w19, sxtw 3]
	add	x1, x0, 307200
	ldr	w26, [x1, 1836]
	ldr	w1, [x0, 100]
	cmp	w1, 2
	beq	.L120
	mov	w2, 1
	ldr	w3, [x0, 1324]
	ldr	w4, [x0, 1328]
	ldr	w5, [x0, 1332]
	ldr	x1, .LC46
	str	w2, [x0, 1320]
	mov	w0, w2
	bl	dprint_vfmw
.L93:
	mov	w2, w25
	add	x3, x29, 104
	mov	w1, w22
	mov	w0, w19
	bl	VDMHAL_V4R3C1_CalcFsNum
	mov	w25, w0
	add	x5, x29, 104
	mov	w4, w22
	mov	w3, w27
	mov	w2, w24
	mov	w1, w23
	mov	w0, w19
	bl	VDMHAL_V4R3C1_CalcFsSize
	orr	w0, w25, w0
	cbnz	w0, .L121
	ldr	x27, [x20, w19, sxtw 3]
	ldr	w22, [x29, 104]
	add	x0, x27, 307200
	cmp	w26, w22
	ldr	w25, [x0, 1840]
	ldr	w5, [x0, 1856]
	beq	.L122
.L96:
	ldr	x2, .LC42
	mov	w3, w22
	ldr	x1, .LC50
	mov	w4, w25
	add	x2, x2, 112
	mov	w0, 31
	bl	dprint_vfmw
	ldr	x0, [x20, w19, sxtw 3]
	add	x3, x29, 104
	mov	w2, w24
	add	x0, x0, 307200
	ldr	w1, [x0, 1832]
	str	w22, [x0, 1836]
	cbz	w1, .L123
	mov	w1, w23
	mov	w0, w19
	bl	VDMHAL_V4R3C1_DynamicAllocFrame_Only
.L99:
	ldr	x4, [x20, w19, sxtw 3]
	mov	w3, w25
	ldr	x1, .LC52
	mov	w2, w22
	add	x4, x4, 307200
	mov	w0, 31
	ldr	w4, [x4, 1856]
	bl	dprint_vfmw
	ldr	x19, [x20, w19, sxtw 3]
	ldr	x0, .LC53
	add	x19, x19, 311296
	ldr	x0, [x0]
	blr	x0
	str	w0, [x19, 1320]
	mov	w1, 2
.L91:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	mov	w0, w1
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L123:
	mov	w1, w23
	mov	w0, w19
	bl	VDMHAL_V4R3C1_DynamicAllocFrame
	b	.L99
	.p2align 3
.L120:
	add	x2, x0, 1280
	mov	w1, -1
	stp	wzr, wzr, [x2, 40]
	stp	w1, w1, [x2, 48]
	b	.L93
	.p2align 3
.L122:
	cmp	w5, 1
	beq	.L96
	ldr	w0, [x0, 1832]
	cmp	w0, 1
	beq	.L96
	cbz	x21, .L124
	add	x26, x27, 311296
	mov	x0, x27
	add	x22, x26, 72
	ldr	w23, [x26, 1304]
	cbz	w25, .L125
.L101:
	add	x0, x0, 307200
	ldr	w2, [x0, 1844]
	cmp	w2, 30
	bgt	.L126
.L102:
	ldr	x24, .LC53
	add	x25, x26, 72
	mov	w0, 8
	str	w2, [x25, 48]
	ldr	x1, [x24, 24]
	blr	x1
	ldr	x7, [x20, w19, sxtw 3]
	add	x9, x7, 311296
	ldr	w0, [x9, 1344]
	cbz	w0, .L107
	ldp	w10, w6, [x25, 56]
	mov	x4, x25
	mov	w5, 0
	mov	w8, 1
	.p2align 2
.L106:
	uxtw	x0, w5
	add	w5, w5, 1
	lsl	x1, x0, 6
	add	x1, x1, x0, lsl 3
	add	x1, x7, x1
	add	x11, x1, 307200
	uxtw	x1, w6
	lsl	x2, x1, 2
	add	x3, x1, 20
	sub	x2, x2, x1
	add	w6, w6, 1
	ldr	w1, [x11, 1896]
	add	x2, x4, x2, lsl 2
	ldr	w12, [x11, 1876]
	add	w1, w1, 1023
	and	w1, w1, -1024
	strb	w8, [x2, 472]
	str	w1, [x2, 464]
	add	w1, w23, w1
	str	w12, [x2, 468]
	str	w1, [x4, x3, lsl 2]
	str	w6, [x4, 60]
	ldr	w1, [x11, 1868]
	cmp	w1, 255
	beq	.L104
	ldr	w1, [x4, 68]
	ldr	w12, [x11, 1912]
	add	w3, w1, 1
	uxtw	x2, w1
	lsl	x1, x2, 2
	sub	x1, x1, x2
	add	x1, x4, x1, lsl 2
	str	w12, [x1, 848]
	ldr	w0, [x11, 1880]
	str	w0, [x1, 852]
	str	w3, [x4, 68]
.L104:
	ldr	w0, [x4, 64]
	cmp	w0, w10
	bcs	.L105
	ldr	w2, [x11, 1872]
	add	x1, x27, x0, uxtw 3
	add	x1, x1, 311296
	add	w0, w0, 1
	cmp	w2, 255
	beq	.L105
	ldr	w2, [x11, 1928]
	str	w2, [x1, 280]
	strb	w8, [x1, 284]
	str	w0, [x4, 64]
.L105:
	ldr	w0, [x9, 1344]
	cmp	w5, w0
	bcc	.L106
.L107:
	ldr	x3, [x24, 104]
	mov	x2, 1232
	mov	x1, x22
	mov	x0, x21
	blr	x3
	ldr	x1, [x20, w19, sxtw 3]
	mov	w3, 1
	ldr	x2, [x24, 32]
	mov	w0, 8
	add	x1, x1, 311296
	str	w3, [x1, 1348]
	blr	x2
	mov	w1, 0
	b	.L91
	.p2align 3
.L126:
	ldr	x1, .LC59
	mov	w0, 31
	bl	dprint_vfmw
	ldr	x0, [x20, w19, sxtw 3]
	mov	w1, 30
	mov	w2, w1
	add	x0, x0, 307200
	str	w1, [x0, 1844]
	b	.L102
	.p2align 3
.L125:
	ldr	x1, .LC57
	mov	w0, 31
	bl	dprint_vfmw
	ldr	x0, [x20, w19, sxtw 3]
	b	.L101
	.p2align 3
.L119:
	ldr	x2, .LC42
	mov	w0, 0
	ldr	x1, .LC43
	ldr	x3, .LC41
	add	x2, x2, 80
	bl	dprint_vfmw
	mov	w1, -1
	b	.L91
	.p2align 3
.L121:
	ldr	x1, .LC48
	mov	w0, 31
	bl	dprint_vfmw
	mov	w1, -1
	b	.L91
.L124:
	ldr	x2, .LC42
	mov	w0, 0
	ldr	x1, .LC43
	ldr	x3, .LC55
	add	x2, x2, 144
	bl	dprint_vfmw
	mov	w1, -1
	b	.L91
	.size	VDMHAL_V4R3C1_ArrangeMem_Normal, .-VDMHAL_V4R3C1_ArrangeMem_Normal
	.align	3
.LC41:
	.xword	.LC40
	.align	3
.LC42:
	.xword	.LANCHOR0
	.align	3
.LC43:
	.xword	.LC6
	.align	3
.LC44:
	.xword	s_pstVfmwChan
	.align	3
.LC46:
	.xword	.LC45
	.align	3
.LC48:
	.xword	.LC47
	.align	3
.LC50:
	.xword	.LC49
	.align	3
.LC52:
	.xword	.LC51
	.align	3
.LC53:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC55:
	.xword	.LC54
	.align	3
.LC57:
	.xword	.LC56
	.align	3
.LC59:
	.xword	.LC58
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_ArrangeMem_Specific
	.type	VDMHAL_V4R3C1_ArrangeMem_Specific, %function
VDMHAL_V4R3C1_ArrangeMem_Specific:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w21, w0
	mov	w23, w2
	mov	x0, x30
	mov	w24, w1
	mov	w28, w3
	mov	w22, w4
	mov	w26, w5
	mov	w20, w6
	mov	w27, w7
	ldr	x19, [x29, 160]
	bl	_mcount
	cbz	w23, .L209
	sub	w1, w22, #32
	mov	w0, 8160
	cmp	w1, w0
	bhi	.L130
	sub	w1, w26, #32
	cmp	w1, w0
	bhi	.L130
	cbz	x19, .L210
	ldr	x0, .LC67
	cmp	w20, 20
	mov	w6, 20
	mov	x2, 1232
	csel	w6, w20, w6, le
	mov	w1, 0
	ldr	x3, [x0, 96]
	mov	x0, x19
	str	w6, [x29, 124]
	mov	w20, 32
	blr	x3
	ldr	x1, .LC68
	add	w0, w22, 15
	asr	w0, w0, 4
	add	w8, w26, 15
	cmp	w0, 45
	asr	w8, w8, 4
	ldrb	w2, [x1]
	mov	w1, 36
	ccmp	w8, w1, 0, le
	mov	w1, 64
	cset	w3, le
	ldr	w6, [x29, 124]
	cmp	w3, wzr
	csel	w20, w20, w1, eq
	cmp	w2, 1
	csel	w20, w20, w1, ne
	cmp	w24, 16
	lsl	w1, w0, 4
	beq	.L211
	cmp	w24, 17
	beq	.L138
	mul	w20, w0, w20
	mul	w20, w20, w8
	add	w20, w20, 143
	and	w20, w20, -128
	mul	w25, w6, w20
	cmp	w28, w25
	ble	.L136
	add	w7, w23, 1023
	add	w1, w1, 255
	and	w7, w7, -1024
	add	w9, w26, 31
	asr	w0, w20, 1
	and	w1, w1, -256
	stp	w0, w6, [x19, 52]
	and	w9, w9, -32
	add	w4, w26, 63
	mov	w11, 0
	mov	w10, 0
	sub	w6, w7, w23
.L140:
	adds	w0, w22, 511
	add	w22, w22, 1022
	csel	w0, w22, w0, mi
	ldr	w3, [x29, 144]
	and	w2, w0, -512
	cmp	w2, wzr
	add	w0, w2, 63
	csel	w0, w0, w2, lt
	cmp	w4, wzr
	add	w2, w4, 63
	asr	w0, w0, 6
	csel	w2, w2, w4, lt
	lsl	w4, w0, 6
	asr	w2, w2, 6
	lsl	w0, w0, 1
	cmp	w3, 1
	mul	w2, w4, w2
	stp	w0, w2, [x19, 12]
	lsl	w0, w1, 4
	str	w0, [x19, 4]
	asr	w0, w0, 1
	str	w0, [x19, 8]
	beq	.L212
	mul	w4, w9, w1
	mul	w5, w11, w10
	lsl	w0, w4, 2
	lsl	w22, w2, 2
	sub	w4, w0, w4
	lsl	w0, w5, 2
	sub	w0, w0, w5
	sub	w22, w22, w2
	asr	w0, w0, 1
	add	w0, w0, w4, asr 1
	add	w22, w0, w22, lsr 1
.L143:
	ldr	w0, [x29, 152]
	tbnz	w0, #31, .L144
	stp	w7, w1, [x29, 100]
	stp	w9, w10, [x29, 108]
	stp	w11, w6, [x29, 116]
	str	w2, [x29, 124]
	bl	VCTRL_GetChanWidth
	mov	w21, w0
	ldr	w0, [x29, 152]
	bl	VCTRL_GetChanHeight
	cmn	w21, #1
	ldr	w2, [x29, 124]
	ccmn	w0, #1, 4, ne
	ldp	w7, w1, [x29, 100]
	ldp	w9, w10, [x29, 108]
	ldp	w11, w6, [x29, 116]
	beq	.L213
	ldr	w3, [x29, 144]
	add	w4, w21, 15
	and	w4, w4, -16
	add	w0, w0, 15
	cmp	w3, 1
	add	w8, w4, 255
	and	w0, w0, -16
	and	w8, w8, -256
	beq	.L214
	adds	w5, w0, 63
	add	w0, w0, 126
	csel	w0, w0, w5, mi
	adds	w5, w4, 511
	add	w4, w4, 1022
	asr	w0, w0, 6
	csel	w4, w4, w5, mi
	and	w4, w4, -512
	add	w5, w4, 63
	cmp	w4, wzr
	csel	w4, w5, w4, lt
	asr	w4, w4, 6
	lsl	w5, w4, 1
	lsl	w4, w0, 2
	mul	w8, w8, w0
	sub	w0, w4, w0
	lsl	w0, w0, 5
	mul	w4, w5, w0
	mul	w5, w11, w10
	lsl	w0, w8, 2
	sub	w8, w0, w8
	lsl	w0, w5, 2
	lsl	w8, w8, 6
	sub	w0, w0, w5
	asr	w0, w0, 1
	add	w0, w0, w8, asr 1
	add	w0, w0, w4, lsr 1
.L147:
	cmp	w22, w0
	ldr	w21, [x29, 152]
	bgt	.L215
.L144:
	mul	w26, w9, w1
	cmp	w21, wzr
	str	w2, [x29, 124]
	add	w0, w26, w2
	ccmp	w24, 16, 0, ge
	str	w0, [x19, 36]
	stp	w10, w11, [x29, 116]
	bne	.L149
	ldr	x0, .LC71
	stp	w7, w6, [x29, 108]
	ldr	x0, [x0, w21, sxtw 3]
	add	x0, x0, 311296
	add	x0, x0, 1960
	bl	IsMain10Profile
	ldp	w7, w6, [x29, 108]
	ldp	w10, w11, [x29, 116]
	ldr	w2, [x29, 124]
	cbnz	w0, .L216
	.p2align 2
.L149:
	cbnz	w27, .L151
	str	wzr, [x19, 48]
.L152:
	ldr	x2, .LC62
	ldr	x3, .LC78
.L206:
	ldr	x1, .LC63
	add	x2, x2, 184
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L151:
	sub	w3, w28, w25
	cmp	w27, 32
	sub	w3, w3, w6
	mov	w0, 32
	csel	w27, w27, w0, le
	sdiv	w3, w3, w22
	cmp	w3, w27
	csel	w3, w3, w27, le
	str	w3, [x19, 48]
	cbz	w3, .L152
	sub	w0, w3, #1
	mov	x1, 476
	mov	w2, 12
	ldr	w4, [x19, 60]
	umaddl	x2, w0, w2, x1
	add	x1, x19, 464
	mov	w0, w7
	add	x2, x19, x2
	.p2align 2
.L157:
	str	w0, [x1], 12
	add	w0, w0, w22
	cmp	x2, x1
	bne	.L157
	ldr	w0, [x29, 144]
	add	w4, w3, w4
	str	w4, [x19, 60]
	cmp	w0, 1
	beq	.L217
	madd	w6, w22, w3, w6
	add	w0, w6, w23
.L168:
	add	x2, x19, 80
	mov	w1, 0
	.p2align 2
.L161:
	add	w1, w1, 1
	str	w0, [x2], 4
	cmp	w1, w3
	add	w0, w0, 32
	bcc	.L161
.L160:
	ldr	w4, [x19, 56]
	add	w6, w6, w3, lsl 5
	add	w23, w6, w23
	cbz	w4, .L166
	sub	w2, w4, #1
	ldr	w5, [x19, 64]
	add	x2, x2, 27
	add	x1, x19, 208
	mov	w0, w23
	add	x2, x19, x2, lsl 3
	.p2align 2
.L165:
	str	w0, [x1], 8
	add	w0, w0, w20
	cmp	x2, x1
	bne	.L165
	add	w0, w4, w5
	str	w0, [x19, 64]
.L166:
	madd	w20, w20, w4, w6
	str	w20, [x19]
	tbnz	w21, #31, .L164
	ldr	x0, .LC71
	ldr	x0, [x0, w21, sxtw 3]
	cbz	x0, .L164
	add	w0, w20, w23
	cbz	w3, .L164
	sub	w4, w3, #1
	mov	w5, 12
	mov	x2, 860
	add	x1, x19, 848
	umaddl	x2, w4, w5, x2
	add	x2, x19, x2
	.p2align 2
.L167:
	str	w0, [x1], 12
	add	w0, w0, 4096
	cmp	x2, x1
	bne	.L167
.L164:
	add	w20, w20, w3, lsl 12
	mov	w0, 0
	str	w20, [x19]
.L199:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L211:
	mul	w20, w8, w1
	add	w20, w20, 143
	and	w20, w20, -128
	mul	w25, w6, w20
	cmp	w28, w25
	ble	.L136
	asr	w0, w20, 1
	add	w7, w23, 1023
	stp	w0, w6, [x19, 52]
	and	w7, w7, -1024
	add	w1, w22, 255
	and	w1, w1, -256
	sub	w6, w7, w23
	tbnz	w21, #31, .L205
	ldr	x0, .LC71
	stp	w7, w1, [x29, 112]
	stp	w6, w8, [x29, 120]
	ldr	x0, [x0, w21, sxtw 3]
	add	x0, x0, 311296
	add	x0, x0, 1960
	bl	IsMain10Profile
	ldp	w7, w1, [x29, 112]
	ldp	w6, w8, [x29, 120]
	cbz	w0, .L205
	cmp	w1, wzr
	add	w10, w1, 3
	csel	w10, w10, w1, lt
	add	w11, w26, 31
	asr	w10, w10, 2
	and	w11, w11, -32
	add	w4, w26, 63
	mov	w9, w26
	b	.L140
	.p2align 3
.L212:
	lsl	w0, w8, 4
	mul	w0, w0, w1
	lsl	w22, w0, 2
	sub	w22, w22, w0
	b	.L143
	.p2align 3
.L217:
	ldr	x0, .LC79
	ldr	x4, [x0]
	cbz	x4, .L159
	stp	w6, w7, [x29, 124]
	stp	w22, w3, [x29, 132]
	add	x2, x29, 128
	mov	w3, 12
	mov	w1, 128
	mov	w0, w21
	blr	x4
	ldr	w3, [x19, 48]
	ldr	w6, [x29, 124]
.L159:
	madd	w6, w22, w3, w6
	add	w0, w6, w23
	cbnz	w3, .L168
	b	.L160
	.p2align 3
.L138:
	lsl	w3, w6, 14
	add	w3, w3, w6, lsl 11
	add	w3, w3, w6
	lsl	w25, w3, 7
	cmp	w28, w25
	ble	.L136
	add	w7, w23, 1023
	add	w4, w26, 63
	and	w7, w7, -1024
	add	w1, w22, 255
	mov	w0, 64
	mov	w20, 128
	movk	w0, 0x12, lsl 16
	and	w1, w1, -256
	stp	w0, w6, [x19, 52]
	and	w9, w4, -64
	movk	w20, 0x24, lsl 16
	mov	w11, 0
	mov	w10, 0
	sub	w6, w7, w23
	b	.L140
	.p2align 3
.L205:
	add	w4, w26, 63
	mov	w9, w26
	mov	w11, 0
	mov	w10, 0
	b	.L140
	.p2align 3
.L214:
	mul	w0, w0, w8
	lsl	w4, w0, 2
	sub	w0, w4, w0
	b	.L147
.L130:
	ldr	x2, .LC62
	ldr	x3, .LC64
	b	.L206
.L216:
	lsl	w0, w26, 2
	sub	w1, w0, w26
	lsl	w0, w2, 2
	sub	w0, w0, w2
	lsr	w2, w2, 1
	lsr	w0, w0, 1
	madd	w11, w11, w10, w2
	add	w0, w0, w1, asr 1
	ldr	x1, .LC76
	lsl	w10, w10, 5
	str	w10, [x19, 20]
	stp	w0, w11, [x19, 28]
	mov	w0, 0
	stp	w7, w6, [x29, 120]
	bl	dprint_vfmw
	ldp	w7, w6, [x29, 120]
	b	.L149
.L136:
	ldr	x2, .LC62
	ldr	x3, .LC70
	b	.L206
.L209:
	ldr	x2, .LC62
	ldr	x3, .LC61
	b	.L206
.L213:
	ldr	x1, .LC73
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L199
.L215:
	ldr	x2, .LC62
	ldr	x3, .LC75
	b	.L206
.L210:
	ldr	x2, .LC62
	ldr	x3, .LC66
	b	.L206
	.size	VDMHAL_V4R3C1_ArrangeMem_Specific, .-VDMHAL_V4R3C1_ArrangeMem_Specific
	.align	3
.LC61:
	.xword	.LC60
	.align	3
.LC62:
	.xword	.LANCHOR0
	.align	3
.LC63:
	.xword	.LC6
	.align	3
.LC64:
	.xword	.LC16
	.align	3
.LC66:
	.xword	.LC65
	.align	3
.LC67:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC68:
	.xword	g_not_direct_8x8_inference_flag
	.align	3
.LC70:
	.xword	.LC69
	.align	3
.LC71:
	.xword	s_pstVfmwChan
	.align	3
.LC73:
	.xword	.LC72
	.align	3
.LC75:
	.xword	.LC74
	.align	3
.LC76:
	.xword	.LC23
	.align	3
.LC78:
	.xword	.LC77
	.align	3
.LC79:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_ArrangeMem
	.type	VDMHAL_V4R3C1_ArrangeMem, %function
VDMHAL_V4R3C1_ArrangeMem:
	sub	sp, sp, #112
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	stp	x19, x20, [sp, 48]
	stp	x21, x22, [sp, 64]
	stp	x23, x24, [sp, 80]
	stp	x25, x26, [sp, 96]
	mov	w24, w0
	mov	x0, x30
	mov	w19, w7
	mov	w25, w1
	mov	w20, w2
	mov	w21, w3
	mov	w22, w4
	mov	w26, w5
	mov	w23, w6
	bl	_mcount
	cmn	w19, #2
	beq	.L224
	tbnz	w19, #31, .L225
	mov	w0, w19
	bl	VCTRL_GetVidStd
	cmp	w0, 22
	mov	w1, w0
	beq	.L228
	ldr	x0, .LC82
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w0, [x0, 1616]
	cmp	w0, 1
	beq	.L229
.L223:
	ldr	x0, [x29, 80]
	mov	w7, w26
	str	x0, [sp, 16]
	mov	w6, w22
	mov	w5, w21
	mov	w4, w20
	mov	w3, w25
	mov	w2, w24
	str	w23, [sp]
	mov	w0, w19
	str	w19, [sp, 8]
	bl	VDMHAL_V4R3C1_ArrangeMem_Specific
.L226:
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L225:
	mov	w1, 22
	b	.L223
	.p2align 3
.L224:
	mov	w1, 16
	b	.L223
	.p2align 3
.L229:
	ldr	x6, [x29, 80]
	mov	w5, w23
	mov	w4, w22
	mov	w3, w21
	mov	w2, w20
	mov	w0, w19
	bl	VDMHAL_V4R3C1_ArrangeMem_Normal
	b	.L226
.L228:
	ldr	x1, .LC81
	mov	w2, -1
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L226
	.size	VDMHAL_V4R3C1_ArrangeMem, .-VDMHAL_V4R3C1_ArrangeMem
	.align	3
.LC81:
	.xword	.LC80
	.align	3
.LC82:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_ResetVdm
	.type	VDMHAL_V4R3C1_ResetVdm, %function
VDMHAL_V4R3C1_ResetVdm:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	cmp	w21, wzr
	ble	.L231
	ldr	x2, .LC83
	mov	w4, 0
	ldr	x1, .LC85
	mov	w3, w21
	add	x2, x2, 224
	mov	w0, 0
	bl	dprint_vfmw
.L230:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L231:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L243
	sxtw	x22, w21
	ldr	x24, .LC88
	lsl	x0, x22, 6
	ldr	x20, .LC89
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x1, x0, x22
	ldr	x2, [x20]
	add	x0, x0, x1, lsl 2
	ldr	x0, [x24, x0]
	ldr	w25, [x0, 36]
	ldr	w23, [x2, 120]
	tbz	x23, 0, .L230
	ldr	x26, .LC90
	mov	w0, 2
	bfi	w23, w0, 8, 2
	str	w23, [x2, 120]
	mov	w19, 0
	orr	w23, w23, 64
	ldr	x0, [x26, 224]
	blr	x0
	ldr	x0, [x20]
	str	w23, [x0, 120]
	b	.L235
	.p2align 3
.L244:
	add	w19, w19, 1
	cmp	w19, 1000
	beq	.L236
.L235:
	ldr	x1, [x26, 232]
	mov	x0, 30
	blr	x1
	ldr	x0, [x20]
	ldr	w0, [x0, 372]
	tbz	x0, 2, .L244
	cmp	w19, 999
	bgt	.L236
	ldr	x2, .LC83
	mov	w3, w21
	ldr	x1, .LC94
	mov	w0, 0
	add	x2, x2, 224
	bl	dprint_vfmw
.L238:
	ldr	x0, [x20]
	and	w23, w23, -65
	str	w23, [x0, 120]
	and	w23, w23, -769
	ldr	x0, [x26, 224]
	blr	x0
	lsl	x0, x22, 6
	ldr	x1, [x20]
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x22, x0, x22
	str	w23, [x1, 120]
	add	x22, x0, x22, lsl 2
	ldr	x0, [x24, x22]
	str	w25, [x0, 36]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L236:
	ldr	x2, .LC83
	mov	w3, w21
	ldr	x1, .LC92
	mov	w0, 0
	add	x2, x2, 224
	bl	dprint_vfmw
	b	.L238
.L243:
	ldr	x1, .LC87
	mov	x2, 0
	bl	dprint_vfmw
	b	.L230
	.size	VDMHAL_V4R3C1_ResetVdm, .-VDMHAL_V4R3C1_ResetVdm
	.align	3
.LC83:
	.xword	.LANCHOR0
	.align	3
.LC85:
	.xword	.LC84
	.align	3
.LC87:
	.xword	.LC86
	.align	3
.LC88:
	.xword	g_HwMem
	.align	3
.LC89:
	.xword	g_pstRegCrg
	.align	3
.LC90:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC92:
	.xword	.LC91
	.align	3
.LC94:
	.xword	.LC93
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_SetSmmuPageTableAddr
	.type	VDMHAL_V4R3C1_SetSmmuPageTableAddr, %function
VDMHAL_V4R3C1_SetSmmuPageTableAddr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC95
	ldr	x3, [x0, 392]
	cbz	x3, .L245
	add	x2, x29, 60
	add	x1, x29, 56
	add	x0, x29, 52
	blr	x3
	cbnz	w19, .L247
	ldr	x0, .LC96
	ldp	w3, w2, [x29, 52]
	ldr	w1, [x29, 60]
	ldr	x0, [x0]
	add	x0, x0, 61440
	str	w3, [x0, 524]
	str	w2, [x0, 772]
	str	w1, [x0, 776]
.L245:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L247:
	ldr	x20, .LC97
	mov	w3, w19
	ldr	x21, .LC99
	mov	w4, 1
	add	x20, x20, 248
	mov	w0, 32
	mov	x1, x21
	mov	x2, x20
	bl	dprint_vfmw
	mov	w3, w19
	mov	x2, x20
	mov	x1, x21
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	mov	w3, w19
	mov	x2, x20
	mov	x1, x21
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.size	VDMHAL_V4R3C1_SetSmmuPageTableAddr, .-VDMHAL_V4R3C1_SetSmmuPageTableAddr
	.align	3
.LC95:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC96:
	.xword	g_HwMem
	.align	3
.LC97:
	.xword	.LANCHOR0
	.align	3
.LC99:
	.xword	.LC98
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_EnableSmmu
	.type	VDMHAL_V4R3C1_EnableSmmu, %function
VDMHAL_V4R3C1_EnableSmmu:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC101
	mov	w1, 8
	ldr	x0, [x0]
	add	x0, x0, 61440
	str	w1, [x0]
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V4R3C1_EnableSmmu, .-VDMHAL_V4R3C1_EnableSmmu
	.align	3
.LC101:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_GlbResetX
	.type	VDMHAL_V4R3C1_GlbResetX, %function
VDMHAL_V4R3C1_GlbResetX:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w23, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L264
	ldr	x20, .LC105
	ldr	x0, [x20]
	ldr	w22, [x0, 120]
	tbnz	x22, 0, .L265
.L252:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L265:
	ldr	x21, .LC106
	mov	w1, 2
	bfi	w22, w1, 8, 2
	str	w22, [x0, 120]
	mov	w19, 0
	orr	w22, w22, 16
	ldr	x0, [x21, 224]
	blr	x0
	ldr	x0, [x20]
	str	w22, [x0, 120]
	b	.L256
	.p2align 3
.L266:
	add	w19, w19, 1
	cmp	w19, 1000
	beq	.L257
.L256:
	ldr	x1, [x21, 232]
	mov	x0, 30
	blr	x1
	ldr	x0, [x20]
	ldr	w0, [x0, 372]
	tbz	x0, 0, .L266
	cmp	w19, 999
	bgt	.L257
	ldr	x2, .LC102
	mov	w3, w23
	ldr	x1, .LC110
	mov	w0, 0
	add	x2, x2, 288
	bl	dprint_vfmw
.L259:
	ldr	x0, [x20]
	and	w22, w22, -17
	str	w22, [x0, 120]
	and	w22, w22, -769
	ldr	x0, [x21, 224]
	blr	x0
	ldr	x0, [x20]
	str	w22, [x0, 120]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L257:
	ldr	x2, .LC102
	mov	w3, w23
	ldr	x1, .LC108
	mov	w0, 0
	add	x2, x2, 288
	bl	dprint_vfmw
	b	.L259
.L264:
	ldr	x2, .LC102
	mov	w3, -121438208
	ldr	x1, .LC104
	add	x2, x2, 288
	bl	dprint_vfmw
	b	.L252
	.size	VDMHAL_V4R3C1_GlbResetX, .-VDMHAL_V4R3C1_GlbResetX
	.align	3
.LC102:
	.xword	.LANCHOR0
	.align	3
.LC104:
	.xword	.LC103
	.align	3
.LC105:
	.xword	g_pstRegCrg
	.align	3
.LC106:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC108:
	.xword	.LC107
	.align	3
.LC110:
	.xword	.LC109
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_GlbReset
	.type	VDMHAL_V4R3C1_GlbReset, %function
VDMHAL_V4R3C1_GlbReset:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L270
	mov	w0, 0
	bl	VDMHAL_V4R3C1_GlbResetX
.L267:
	ldp	x29, x30, [sp], 16
	ret
.L270:
	ldr	x2, .LC111
	mov	w3, -121438208
	ldr	x1, .LC112
	add	x2, x2, 312
	bl	dprint_vfmw
	b	.L267
	.size	VDMHAL_V4R3C1_GlbReset, .-VDMHAL_V4R3C1_GlbReset
	.align	3
.LC111:
	.xword	.LANCHOR0
	.align	3
.LC112:
	.xword	.LC103
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_ClearIntState
	.type	VDMHAL_V4R3C1_ClearIntState, %function
VDMHAL_V4R3C1_ClearIntState:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	sxtw	x19, w0
	mov	x0, x30
	mov	x20, x19
	bl	_mcount
	ldr	x21, .LC114
	ldr	x0, .LC113
	add	x1, x21, x19, lsl 6
	ldrsw	x1, [x1, 8]
	ldr	x0, [x0, x1, lsl 3]
	cbz	x0, .L281
	ldr	w22, [x0, 1352]
.L272:
	cmp	w20, wzr
	bgt	.L283
	lsl	x0, x19, 6
	ldr	x23, .LC117
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x20, x0, x19
	add	x20, x0, x20, lsl 2
	ldr	x0, [x23, x20]
	cbz	x0, .L284
.L275:
	cmp	w22, 1
	bne	.L282
	add	x19, x21, x19, lsl 6
	ldr	w1, [x19, 44]
	cmp	w1, 1
	beq	.L282
	ldr	w2, [x0, 28]
	cmp	w1, 2
	beq	.L285
	cmp	w1, 3
	bne	.L271
	mov	w1, -15
	str	w1, [x0, 32]
	b	.L271
	.p2align 3
.L283:
	ldr	x2, .LC115
	mov	w4, 0
	ldr	x1, .LC116
	mov	w3, w20
	add	x2, x2, 336
	mov	w0, 0
	bl	dprint_vfmw
.L271:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L282:
	mov	w1, -1
	str	w1, [x0, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L281:
	mov	w22, 0
	b	.L272
	.p2align 3
.L284:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L276
	str	x0, [x23, x20]
	b	.L275
	.p2align 3
.L285:
	mov	w1, -12
	str	w1, [x0, 32]
	b	.L271
.L276:
	ldr	x1, .LC119
	mov	w0, 0
	bl	dprint_vfmw
	b	.L271
	.size	VDMHAL_V4R3C1_ClearIntState, .-VDMHAL_V4R3C1_ClearIntState
	.align	3
.LC113:
	.xword	s_pstVfmwChan
	.align	3
.LC114:
	.xword	g_VdmDrvParam
	.align	3
.LC115:
	.xword	.LANCHOR0
	.align	3
.LC116:
	.xword	.LC84
	.align	3
.LC117:
	.xword	g_HwMem
	.align	3
.LC119:
	.xword	.LC118
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_ClearMMUIntState
	.type	VDMHAL_V4R3C1_ClearMMUIntState, %function
VDMHAL_V4R3C1_ClearMMUIntState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	bgt	.L291
	lsl	x3, x19, 6
	ldr	x20, .LC122
	sub	x3, x3, x19
	lsl	x3, x3, 2
	sub	x19, x3, x19
	add	x19, x3, x19, lsl 2
	ldr	x0, [x20, x19]
	cbz	x0, .L292
.L289:
	add	x0, x0, 61440
	mov	w1, 7
	str	w1, [x0, 44]
.L286:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L291:
	ldr	x2, .LC120
	mov	w3, w19
	ldr	x1, .LC121
	mov	w4, 0
	add	x2, x2, 368
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L292:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L290
	str	x0, [x20, x19]
	b	.L289
.L290:
	ldr	x1, .LC123
	mov	w0, 0
	bl	dprint_vfmw
	b	.L286
	.size	VDMHAL_V4R3C1_ClearMMUIntState, .-VDMHAL_V4R3C1_ClearMMUIntState
	.align	3
.LC120:
	.xword	.LANCHOR0
	.align	3
.LC121:
	.xword	.LC84
	.align	3
.LC122:
	.xword	g_HwMem
	.align	3
.LC123:
	.xword	.LC118
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_MaskInt
	.type	VDMHAL_V4R3C1_MaskInt, %function
VDMHAL_V4R3C1_MaskInt:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	bgt	.L298
	lsl	x3, x19, 6
	ldr	x20, .LC126
	sub	x3, x3, x19
	lsl	x3, x3, 2
	sub	x19, x3, x19
	add	x19, x3, x19, lsl 2
	ldr	x0, [x20, x19]
	cbz	x0, .L299
.L296:
	mov	w1, -1
	str	w1, [x0, 36]
.L293:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L298:
	ldr	x2, .LC124
	mov	w3, w19
	ldr	x1, .LC125
	mov	w4, 0
	add	x2, x2, 400
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L299:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L297
	str	x0, [x20, x19]
	b	.L296
.L297:
	ldr	x1, .LC127
	mov	w0, 0
	bl	dprint_vfmw
	b	.L293
	.size	VDMHAL_V4R3C1_MaskInt, .-VDMHAL_V4R3C1_MaskInt
	.align	3
.LC124:
	.xword	.LANCHOR0
	.align	3
.LC125:
	.xword	.LC84
	.align	3
.LC126:
	.xword	g_HwMem
	.align	3
.LC127:
	.xword	.LC118
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_GetIntMaskCfg
	.type	VDMHAL_V4R3C1_GetIntMaskCfg, %function
VDMHAL_V4R3C1_GetIntMaskCfg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 1
	mov	w1, -6
	mov	w0, -2
	ldr	x19, [sp, 16]
	csel	w0, w1, w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_V4R3C1_GetIntMaskCfg, .-VDMHAL_V4R3C1_GetIntMaskCfg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_EnableInt
	.type	VDMHAL_V4R3C1_EnableInt, %function
VDMHAL_V4R3C1_EnableInt:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC129
	sxtw	x0, w19
	ldr	x2, .LC128
	add	x1, x1, x0, lsl 6
	ldrsw	x1, [x1, 8]
	ldr	x1, [x2, x1, lsl 3]
	cbz	x1, .L311
	ldr	w20, [x1, 1352]
.L304:
	cmp	w19, wzr
	bgt	.L312
	lsl	x19, x0, 6
	ldr	x21, .LC132
	sub	x19, x19, x0
	lsl	x19, x19, 2
	sub	x0, x19, x0
	add	x19, x19, x0, lsl 2
	ldr	x0, [x21, x19]
	cbz	x0, .L313
.L307:
	mov	w1, -6
	mov	w2, -2
	cmp	w20, 1
	csel	w1, w1, w2, eq
	str	w1, [x0, 36]
.L303:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L312:
	ldr	x2, .LC130
	mov	w3, w19
	ldr	x1, .LC131
	mov	w4, 0
	add	x2, x2, 424
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L311:
	mov	w20, 0
	b	.L304
	.p2align 3
.L313:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L308
	str	x0, [x21, x19]
	b	.L307
.L308:
	ldr	x1, .LC133
	mov	w0, 0
	bl	dprint_vfmw
	b	.L303
	.size	VDMHAL_V4R3C1_EnableInt, .-VDMHAL_V4R3C1_EnableInt
	.align	3
.LC128:
	.xword	s_pstVfmwChan
	.align	3
.LC129:
	.xword	g_VdmDrvParam
	.align	3
.LC130:
	.xword	.LANCHOR0
	.align	3
.LC131:
	.xword	.LC84
	.align	3
.LC132:
	.xword	g_HwMem
	.align	3
.LC133:
	.xword	.LC118
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_CheckReg
	.type	VDMHAL_V4R3C1_CheckReg, %function
VDMHAL_V4R3C1_CheckReg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w22, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w19, wzr
	bgt	.L331
	lsl	x0, x19, 6
	ldr	x21, .LC137
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x20, x0, x19
	add	x20, x0, x20, lsl 2
	ldr	x0, [x21, x20]
	cbz	x0, .L332
.L317:
	sub	w0, w22, #1
	cmp	w0, 6
	bls	.L333
	ldr	x2, .LC134
	mov	w3, w22
	ldr	x1, .LC141
	mov	w0, 0
	add	x2, x2, 448
	bl	dprint_vfmw
	mov	w0, 0
.L330:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L333:
	ldr	x1, .LC142
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx324
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx324:
	.section	.rodata
	.align	0
	.align	2
.L324:
	.byte	(.L328 - .Lrtx324) / 4
	.byte	(.L325 - .Lrtx324) / 4
	.byte	(.L326 - .Lrtx324) / 4
	.byte	(.L327 - .Lrtx324) / 4
	.byte	(.L329 - .Lrtx324) / 4
	.byte	(.L319 - .Lrtx324) / 4
	.byte	(.L321 - .Lrtx324) / 4
	.text
	.p2align 3
.L329:
	mov	x1, 61480
.L323:
	lsl	x0, x19, 6
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	add	x19, x0, x19, lsl 2
	ldr	x0, [x21, x19]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	w0, [x0, x1]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L328:
	mov	x1, 28
	b	.L323
	.p2align 3
.L327:
	mov	x1, 40
	b	.L323
	.p2align 3
.L326:
	mov	x1, 36
	b	.L323
	.p2align 3
.L325:
	mov	x1, 32
	b	.L323
	.p2align 3
.L321:
	mov	x1, 62272
	b	.L323
	.p2align 3
.L319:
	mov	x1, 62304
	b	.L323
	.p2align 3
.L332:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L318
	str	x0, [x21, x20]
	b	.L317
	.p2align 3
.L331:
	ldr	x2, .LC134
	mov	w3, w19
	ldr	x1, .LC136
	mov	w0, 0
	add	x2, x2, 448
	bl	dprint_vfmw
	mov	w0, -1
	b	.L330
.L318:
	ldr	x2, .LC134
	mov	w0, 0
	ldr	x1, .LC139
	add	x2, x2, 448
	bl	dprint_vfmw
	mov	w0, 0
	b	.L330
	.size	VDMHAL_V4R3C1_CheckReg, .-VDMHAL_V4R3C1_CheckReg
	.align	3
.LC134:
	.xword	.LANCHOR0
	.align	3
.LC136:
	.xword	.LC135
	.align	3
.LC137:
	.xword	g_HwMem
	.align	3
.LC139:
	.xword	.LC138
	.align	3
.LC141:
	.xword	.LC140
	.align	3
.LC142:
	.xword	.L324
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_ReadMMUMask
	.type	VDMHAL_V4R3C1_ReadMMUMask, %function
VDMHAL_V4R3C1_ReadMMUMask:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	ble	.L337
	ldr	x2, .LC144
	mov	w3, w19
	ldr	x1, .LC146
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L337:
	lsl	x0, x19, 6
	ldr	x1, .LC143
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	add	x19, x0, x19, lsl 2
	ldr	x0, [x1, x19]
	ldr	x19, [sp, 16]
	add	x0, x0, 61440
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 32]
	ret
	.size	VDMHAL_V4R3C1_ReadMMUMask, .-VDMHAL_V4R3C1_ReadMMUMask
	.align	3
.LC143:
	.xword	g_HwMem
	.align	3
.LC144:
	.xword	.LANCHOR1
	.align	3
.LC146:
	.xword	.LC145
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_WriteMMUMask
	.type	VDMHAL_V4R3C1_WriteMMUMask, %function
VDMHAL_V4R3C1_WriteMMUMask:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w19, wzr
	ble	.L341
	ldr	x2, .LC148
	mov	w3, w19
	ldr	x1, .LC149
	mov	w4, 1
	add	x2, x2, 32
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L341:
	lsl	x0, x19, 6
	ldr	x1, .LC147
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	add	x19, x0, x19, lsl 2
	ldr	x0, [x1, x19]
	add	x0, x0, 61440
	str	w20, [x0, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_V4R3C1_WriteMMUMask, .-VDMHAL_V4R3C1_WriteMMUMask
	.align	3
.LC147:
	.xword	g_HwMem
	.align	3
.LC148:
	.xword	.LANCHOR1
	.align	3
.LC149:
	.xword	.LC98
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_PrepareDec
	.type	VDMHAL_V4R3C1_PrepareDec, %function
VDMHAL_V4R3C1_PrepareDec:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x21, x1
	mov	x0, x30
	mov	w22, w2
	mov	x19, x3
	bl	_mcount
	cbz	x21, .L361
	cbnz	w22, .L362
	cmp	w20, 6
	mov	w2, 0
	cset	w1, eq
	mov	w0, 0
	mov	x3, x19
	bl	SCD_ConfigReg
	mov	x3, x19
	mov	w2, 0
	mov	w1, 1
	mov	w0, 8
	bl	SCD_ConfigReg
	cmp	w20, 17
	bls	.L363
.L360:
	mov	w0, -1
	b	.L344
	.p2align 3
.L363:
	ldr	x0, .LC155
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx347
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx347:
	.section	.rodata
	.align	0
	.align	2
.L347:
	.byte	(.L357 - .Lrtx347) / 4
	.byte	(.L348 - .Lrtx347) / 4
	.byte	(.L349 - .Lrtx347) / 4
	.byte	(.L350 - .Lrtx347) / 4
	.byte	(.L360 - .Lrtx347) / 4
	.byte	(.L351 - .Lrtx347) / 4
	.byte	(.L352 - .Lrtx347) / 4
	.byte	(.L360 - .Lrtx347) / 4
	.byte	(.L353 - .Lrtx347) / 4
	.byte	(.L354 - .Lrtx347) / 4
	.byte	(.L355 - .Lrtx347) / 4
	.byte	(.L355 - .Lrtx347) / 4
	.byte	(.L355 - .Lrtx347) / 4
	.byte	(.L356 - .Lrtx347) / 4
	.byte	(.L360 - .Lrtx347) / 4
	.byte	(.L357 - .Lrtx347) / 4
	.byte	(.L358 - .Lrtx347) / 4
	.byte	(.L359 - .Lrtx347) / 4
	.text
	.p2align 3
.L357:
	mov	x2, x19
	mov	w1, 0
	mov	x0, x21
	bl	H264HAL_V4R3C1_StartDec
.L344:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L358:
	mov	x2, x19
	mov	w1, 0
	mov	x0, x21
	bl	HEVCHAL_V4R3C1_StartDec
	b	.L344
	.p2align 3
.L356:
	mov	x2, x19
	mov	w1, 0
	mov	x0, x21
	bl	VP8HAL_V4R3C1_StartDec
	b	.L344
	.p2align 3
.L355:
	mov	x2, x19
	mov	w1, 0
	mov	x0, x21
	bl	VP6HAL_V4R3C1_StartDec
	b	.L344
	.p2align 3
.L354:
	mov	x2, x19
	mov	w1, 0
	mov	x0, x21
	bl	RV9HAL_V4R3C1_StartDec
	b	.L344
	.p2align 3
.L353:
	mov	x2, x19
	mov	w1, 0
	mov	x0, x21
	bl	RV8HAL_V4R3C1_StartDec
	b	.L344
	.p2align 3
.L352:
	mov	x2, x19
	mov	w1, 0
	mov	x0, x21
	bl	AVSHAL_V4R3C1_StartDec
	b	.L344
	.p2align 3
.L351:
	mov	x2, x19
	mov	w1, 0
	mov	x0, x21
	bl	DIVX3HAL_V4R3C1_StartDec
	b	.L344
	.p2align 3
.L350:
	mov	x2, x19
	mov	w1, 0
	mov	x0, x21
	bl	MP2HAL_V4R3C1_StartDec
	b	.L344
	.p2align 3
.L349:
	mov	x2, x19
	mov	w1, 0
	mov	x0, x21
	bl	MP4HAL_V4R3C1_StartDec
	b	.L344
	.p2align 3
.L348:
	mov	x2, x19
	mov	w1, 0
	mov	x0, x21
	bl	VC1HAL_V4R3C1_StartDec
	b	.L344
	.p2align 3
.L359:
	mov	x2, x19
	mov	w1, 0
	mov	x0, x21
	bl	VP9HAL_V4R3C1_StartDec
	b	.L344
	.p2align 3
.L362:
	ldr	x2, .LC150
	mov	w3, w22
	ldr	x1, .LC154
	mov	w0, 0
	add	x2, x2, 64
	bl	dprint_vfmw
	mov	w0, -1
	b	.L344
.L361:
	ldr	x2, .LC150
	mov	x3, 0
	ldr	x1, .LC152
	mov	w0, 0
	add	x2, x2, 64
	bl	dprint_vfmw
	mov	w0, -1
	b	.L344
	.size	VDMHAL_V4R3C1_PrepareDec, .-VDMHAL_V4R3C1_PrepareDec
	.align	3
.LC150:
	.xword	.LANCHOR1
	.align	3
.LC152:
	.xword	.LC151
	.align	3
.LC154:
	.xword	.LC153
	.align	3
.LC155:
	.xword	.L347
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_IsVdmReady
	.type	VDMHAL_V4R3C1_IsVdmReady, %function
VDMHAL_V4R3C1_IsVdmReady:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sxtw	x0, w19
	ldr	x2, .LC156
	lsl	x1, x0, 6
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x0, x1, x0
	add	x0, x1, x0, lsl 2
	ldr	x0, [x2, x0]
	cbz	x0, .L369
	cmp	w19, wzr
	ble	.L370
	ldr	x2, .LC159
	mov	w4, 1
	ldr	x1, .LC161
	mov	w3, w19
	add	x2, x2, 96
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, 0
.L366:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L370:
	ldr	w0, [x0, 28]
	ldr	x19, [sp, 16]
	ubfx	x0, x0, 17, 1
	ldp	x29, x30, [sp], 32
	ret
.L369:
	ldr	x2, .LC159
	ldr	x3, .LC158
	ldr	x1, .LC160
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L366
	.size	VDMHAL_V4R3C1_IsVdmReady, .-VDMHAL_V4R3C1_IsVdmReady
	.align	3
.LC156:
	.xword	g_HwMem
	.align	3
.LC158:
	.xword	.LC157
	.align	3
.LC159:
	.xword	.LANCHOR1
	.align	3
.LC160:
	.xword	.LC6
	.align	3
.LC161:
	.xword	.LC145
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_IsVdmRun
	.type	VDMHAL_V4R3C1_IsVdmRun, %function
VDMHAL_V4R3C1_IsVdmRun:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sxtw	x0, w19
	ldr	x2, .LC162
	lsl	x1, x0, 6
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x0, x1, x0
	add	x0, x1, x0, lsl 2
	ldr	x0, [x2, x0]
	cbz	x0, .L376
	cmp	w19, wzr
	ble	.L377
	ldr	x2, .LC165
	mov	w4, 1
	ldr	x1, .LC166
	mov	w3, w19
	add	x2, x2, 128
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, 1
.L373:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L377:
	ldr	w0, [x0, 40]
	ldr	x19, [sp, 16]
	cmp	w0, 1
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L376:
	ldr	x1, .LC164
	bl	dprint_vfmw
	mov	w0, 0
	b	.L373
	.size	VDMHAL_V4R3C1_IsVdmRun, .-VDMHAL_V4R3C1_IsVdmRun
	.align	3
.LC162:
	.xword	g_HwMem
	.align	3
.LC164:
	.xword	.LC163
	.align	3
.LC165:
	.xword	.LANCHOR1
	.align	3
.LC166:
	.xword	.LC145
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_IsVdhDecOver
	.type	VDMHAL_V4R3C1_IsVdhDecOver, %function
VDMHAL_V4R3C1_IsVdhDecOver:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	sxtw	x0, w20
	ldr	x1, .LC167
	lsl	x2, x0, 6
	sub	x2, x2, x0
	lsl	x2, x2, 2
	sub	x0, x2, x0
	add	x0, x2, x0, lsl 2
	ldr	x0, [x1, x0]
	cbz	x0, .L386
	mov	w1, w20
	mov	w0, w19
	bl	VDMHAL_V4R3C1_CheckReg
	cmp	w19, 2
	beq	.L383
	cmp	w19, 3
	beq	.L383
	cmp	w19, 1
	ubfx	x0, x0, 17, 1
	beq	.L380
	ldr	x2, .LC169
	mov	w3, w19
	ldr	x1, .LC171
	mov	w0, 0
	add	x2, x2, 152
	bl	dprint_vfmw
	mov	w0, 0
.L380:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L383:
	and	w0, w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L386:
	ldr	x2, .LC169
	ldr	x3, .LC168
	ldr	x1, .LC170
	add	x2, x2, 152
	bl	dprint_vfmw
	mov	w0, -1
	b	.L380
	.size	VDMHAL_V4R3C1_IsVdhDecOver, .-VDMHAL_V4R3C1_IsVdhDecOver
	.align	3
.LC167:
	.xword	g_HwMem
	.align	3
.LC168:
	.xword	.LC157
	.align	3
.LC169:
	.xword	.LANCHOR1
	.align	3
.LC170:
	.xword	.LC6
	.align	3
.LC171:
	.xword	.LC140
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_IsVdhPartDecOver
	.type	VDMHAL_V4R3C1_IsVdhPartDecOver, %function
VDMHAL_V4R3C1_IsVdhPartDecOver:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	sxtw	x0, w20
	ldr	x1, .LC172
	lsl	x2, x0, 6
	sub	x2, x2, x0
	lsl	x2, x2, 2
	sub	x0, x2, x0
	add	x0, x2, x0, lsl 2
	ldr	x0, [x1, x0]
	cbz	x0, .L395
	mov	w1, w20
	mov	w0, w19
	bl	VDMHAL_V4R3C1_CheckReg
	cmp	w19, 1
	beq	.L391
	cmp	w19, 2
	ubfx	x0, x0, 2, 1
	bne	.L396
.L389:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L396:
	ldr	x2, .LC174
	mov	w3, w19
	ldr	x1, .LC176
	mov	w0, 0
	add	x2, x2, 184
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L391:
	ubfx	x0, x0, 19, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L395:
	ldr	x2, .LC174
	ldr	x3, .LC173
	ldr	x1, .LC175
	add	x2, x2, 184
	bl	dprint_vfmw
	mov	w0, -1
	b	.L389
	.size	VDMHAL_V4R3C1_IsVdhPartDecOver, .-VDMHAL_V4R3C1_IsVdhPartDecOver
	.align	3
.LC172:
	.xword	g_HwMem
	.align	3
.LC173:
	.xword	.LC157
	.align	3
.LC174:
	.xword	.LANCHOR1
	.align	3
.LC175:
	.xword	.LC6
	.align	3
.LC176:
	.xword	.LC140
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_UpdateHardwareInfo
	.type	VDMHAL_V4R3C1_UpdateHardwareInfo, %function
VDMHAL_V4R3C1_UpdateHardwareInfo:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	cmp	w21, wzr
	bgt	.L398
	ldr	x4, .LC177
	ldr	w0, [x4]
	cmp	w0, 1
	beq	.L399
	add	x0, x4, 4
	add	x4, x4, 128
	b	.L402
	.p2align 3
.L438:
	cmp	x0, x4
	beq	.L437
.L402:
	ldr	w1, [x0]
	add	x0, x0, 4
	cmp	w1, 1
	bne	.L438
.L399:
	sxtw	x19, w21
	ldr	x24, .LC182
	lsl	x0, x19, 6
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x1, x0, x19
	add	x0, x0, x1, lsl 2
	ldr	x2, [x24, x0]
	cbz	x2, .L439
	lsl	x0, x19, 2
	ldr	x20, .LC183
	sub	x1, x0, x19
	ldr	w3, [x2, 12]
	lsl	x0, x1, 4
	mov	w22, 1
	sub	x0, x0, x1
	lsl	x0, x0, 2
	add	x1, x20, x0
	str	w3, [x20, x0]
	ldr	w2, [x2, 28]
	str	w2, [x1, 4]
.L405:
	lsl	x0, x19, 6
	and	w23, w2, 131071
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x1, x0, x19
	add	x0, x0, x1, lsl 2
	add	x0, x24, x0
	ldr	w0, [x0, 56]
	bl	MEM_Phy2Vir
	cbz	x0, .L440
	sub	w1, w23, #1
	cmp	w1, 199
	bhi	.L414
	lsl	w1, w23, 2
	sub	w1, w1, #4
	lsl	x1, x1, 2
	add	x3, x1, 8
.L408:
	lsl	x2, x19, 2
	ldr	w4, [x0, x1]
	sub	x2, x2, x19
	lsl	x1, x2, 4
	sub	x2, x1, x2
	lsl	x1, x19, 6
	sub	x1, x1, x19
	add	x2, x20, x2, lsl 2
	lsl	x1, x1, 2
	str	w4, [x2, 16]
	ldr	w3, [x0, x3]
	sub	x0, x1, x19
	str	w3, [x2, 20]
	add	x1, x1, x0, lsl 2
	ldr	x1, [x24, x1]
	ldr	w3, [x1, 208]
	ldr	w0, [x1, 212]
	stp	w3, w0, [x2, 8]
	b	.L409
	.p2align 3
.L437:
	sxtw	x19, w21
	ldr	x24, .LC182
	lsl	x0, x19, 6
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x1, x0, x19
	add	x0, x0, x1, lsl 2
	ldr	x1, [x24, x0]
	cbz	x1, .L441
	lsl	x0, x19, 2
	ldr	x20, .LC183
	sub	x2, x0, x19
	ldr	w3, [x1, 12]
	lsl	x0, x2, 4
	mov	w22, 0
	sub	x0, x0, x2
	lsl	x0, x0, 2
	add	x2, x20, x0
	str	w3, [x20, x0]
	ldr	w0, [x1, 28]
	str	w0, [x2, 4]
.L406:
	lsl	x0, x19, 2
	ldr	w2, [x1, 4096]
	sub	x4, x0, x19
	ldr	w5, [x1, 4116]
	lsl	x0, x4, 4
	ldr	w3, [x1, 208]
	sub	x0, x0, x4
	add	x0, x20, x0, lsl 2
	stp	w2, w5, [x0, 16]
	ldr	w2, [x1, 212]
	str	w3, [x0, 8]
	str	w2, [x0, 12]
	cbnz	w22, .L409
	ldr	w5, [x1, 176]
	ldr	w2, [x1, 180]
	stp	w5, w2, [x0, 24]
	ldr	w4, [x1, 184]
	ldr	w3, [x1, 188]
	ldr	w2, [x1, 192]
	stp	w4, w3, [x0, 32]
	str	w2, [x0, 40]
.L409:
	mov	w0, 180
	add	x4, x1, 32768
	add	x1, x4, 256
	smull	x2, w21, w0
	add	x0, x2, 52
	add	x2, x2, 180
	add	x0, x20, x0
	add	x3, x20, x2
	.p2align 2
.L410:
	ldr	w2, [x1], 4
	str	w2, [x0], 4
	cmp	x3, x0
	bne	.L410
	mov	w0, 0
	cbnz	w22, .L424
	lsl	x1, x19, 2
	ldr	w3, [x4, 384]
	sub	x19, x1, x19
	ldr	w2, [x4, 388]
	lsl	x1, x19, 4
	sub	x1, x1, x19
	add	x20, x20, x1, lsl 2
	stp	w2, w3, [x20, 44]
.L424:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L414:
	mov	x3, 8
	mov	x1, 0
	b	.L408
.L398:
	ldr	x2, .LC178
	mov	w4, 0
	ldr	x1, .LC179
	mov	w3, w21
	add	x2, x2, 216
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L424
.L441:
	mov	w22, 0
.L411:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L404
	lsl	x2, x19, 6
	lsl	x3, x19, 2
	sub	x2, x2, x19
	sub	x4, x3, x19
	lsl	x2, x2, 2
	lsl	x3, x4, 4
	sub	x1, x2, x19
	sub	x3, x3, x4
	ldr	x20, .LC183
	lsl	x3, x3, 2
	add	x2, x2, x1, lsl 2
	add	x1, x20, x3
	str	x0, [x24, x2]
	ldr	w2, [x0, 12]
	str	w2, [x20, x3]
	ldr	w2, [x0, 28]
	str	w2, [x1, 4]
	cbnz	w22, .L405
	mov	x1, x0
	b	.L406
.L439:
	mov	w22, 1
	b	.L411
.L440:
	ldr	x2, .LC178
	ldr	x3, .LC186
	ldr	x1, .LC187
	add	x2, x2, 216
	bl	dprint_vfmw
	mov	w0, -1
	b	.L424
.L404:
	ldr	x1, .LC184
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L424
	.size	VDMHAL_V4R3C1_UpdateHardwareInfo, .-VDMHAL_V4R3C1_UpdateHardwareInfo
	.align	3
.LC177:
	.xword	g_DSPState
	.align	3
.LC178:
	.xword	.LANCHOR1
	.align	3
.LC179:
	.xword	.LC84
	.align	3
.LC182:
	.xword	g_HwMem
	.align	3
.LC183:
	.xword	g_BackUp
	.align	3
.LC184:
	.xword	.LC118
	.align	3
.LC186:
	.xword	.LC185
	.align	3
.LC187:
	.xword	.LC6
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_ReadMsgSlot
	.type	VDMHAL_V4R3C1_ReadMsgSlot, %function
VDMHAL_V4R3C1_ReadMsgSlot:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	mov	w19, w2
	bl	_mcount
	cmp	x20, xzr
	ccmp	x21, xzr, 4, ne
	beq	.L446
	cmp	w19, 800
	bhi	.L447
	ldr	x3, .LC192
	ubfiz	x2, x19, 2, 30
	mov	x1, x21
	mov	x0, x20
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L444:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L447:
	ldr	x1, .LC191
	mov	w2, w19
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L444
	.p2align 3
.L446:
	ldr	x1, .LC189
	mov	x3, x21
	mov	x2, x20
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L444
	.size	VDMHAL_V4R3C1_ReadMsgSlot, .-VDMHAL_V4R3C1_ReadMsgSlot
	.align	3
.LC189:
	.xword	.LC188
	.align	3
.LC191:
	.xword	.LC190
	.align	3
.LC192:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_WriteMsgSlot
	.type	VDMHAL_V4R3C1_WriteMsgSlot, %function
VDMHAL_V4R3C1_WriteMsgSlot:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	w21, w2
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L449
	sub	w0, w21, #1
	cmp	w0, 255
	bhi	.L449
	ldr	x3, .LC195
	ubfiz	x2, x21, 2, 30
	mov	x1, x20
	mov	x0, x19
	ldr	x3, [x3, 104]
	blr	x3
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L449:
	ldr	x1, .LC194
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	VDMHAL_V4R3C1_WriteMsgSlot, .-VDMHAL_V4R3C1_WriteMsgSlot
	.align	3
.LC194:
	.xword	.LC193
	.align	3
.LC195:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_CfgRpMsg
	.type	VDMHAL_V4R3C1_CfgRpMsg, %function
VDMHAL_V4R3C1_CfgRpMsg:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L492
	ldr	w0, [x20, 64]
	bl	MEM_Phy2Vir
	mov	x20, x0
	cbz	x0, .L493
	ldr	w2, [x19, 44]
	sub	w0, w2, #1
	cmp	w0, 199
	bhi	.L494
	ldp	w2, w0, [x19, 28]
	ldr	w4, [x19, 64]
	mov	w3, 0
	ldrb	w5, [x19]
	lsl	w2, w2, w4
	lsl	w0, w0, w4
	cmp	w5, 1
	add	w1, w2, 255
	and	w1, w1, -256
	lsl	w5, w1, 4
	beq	.L495
.L457:
	ldr	w2, [x19, 4]
	cmp	w2, 16
	beq	.L458
	add	w0, w0, 31
	mov	w23, 8
	and	w0, w0, -32
	madd	w0, w0, w1, w3
.L479:
	ldr	w1, [x19, 20]
	mov	w4, 0
	str	w1, [x20]
	mov	w2, 0
	ldr	w1, [x19, 20]
	add	w1, w0, w1
	str	w1, [x20, 4]
	ldr	w1, [x19, 8]
	str	w1, [x20, 8]
	ldr	w1, [x19, 8]
	add	w0, w0, w1
	str	w0, [x20, 12]
	str	w5, [x20, 16]
	str	w3, [x20, 20]
	ldp	w1, w0, [x19, 28]
	sub	w0, w0, #1
	sub	w1, w1, #1
	bfi	w2, w0, 0, 9
	bfi	w4, w1, 0, 9
	strh	w2, [x29, 74]
	strh	w4, [x29, 72]
	ldr	w0, [x29, 72]
	str	w0, [x20, 24]
	ldr	w0, [x19, 52]
	ldp	w21, w22, [x19, 28]
	sub	w0, w0, #1
	cmp	w0, 1
	bls	.L496
.L460:
	ldr	w0, [x19, 56]
	mov	w11, 0
	cbz	w0, .L497
.L461:
	cmp	w0, 1
	beq	.L477
.L502:
	sub	w11, w11, #1
	uxth	w11, w11
.L478:
	ldrb	w4, [x19]
	ldr	w2, [x19, 52]
	ldr	w3, [x19, 64]
	ldrb	w0, [x29, 74]
	and	w2, w2, 3
	ldrb	w1, [x29, 75]
	sub	w3, w3, #4
	bfi	w0, w4, 0, 1
	strh	w11, [x29, 72]
	bfi	w0, w2, 4, 2
	bfi	w1, w3, 0, 2
	bfi	w0, w2, 6, 2
	bfi	w1, w23, 2, 4
	strb	w0, [x29, 74]
	mov	w0, 0
	strb	w1, [x29, 75]
	ldr	w1, [x29, 72]
	str	w1, [x20, 28]
.L490:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L497:
	ldr	w0, [x19, 64]
	cmp	w0, 6
	beq	.L482
	cmp	w0, 5
	beq	.L483
	cmp	w0, 4
	mov	w2, 8
	beq	.L462
	ldr	x1, .LC205
	mov	w0, 1
	bl	dprint_vfmw
	mov	w2, 1
.L462:
	ldr	w8, [x19, 44]
	cmp	w8, wzr
	ble	.L491
	mul	w12, w22, w21
	mov	w4, 0
	mov	w6, 0
	sub	w13, w12, #1
	mov	w11, 0
	sub	w9, w2, #1
	b	.L465
	.p2align 3
.L500:
	ldrsh	w6, [x10, 74]
	sub	w6, w6, #1
	add	w6, w6, w2
	udiv	w6, w6, w2
	mul	w6, w6, w2
	cmp	w0, w6
	bgt	.L468
.L467:
	add	w4, w4, 1
	cmp	w4, w8
	bge	.L498
.L476:
	cmp	w4, 199
	bgt	.L499
.L465:
	add	x10, x19, x4, sxtw 2
	cmp	w4, wzr
	ldrsh	w1, [x10, 78]
	sub	w0, w1, #1
	add	w0, w0, w2
	udiv	w0, w0, w2
	mul	w0, w0, w2
	bgt	.L500
	ccmp	w0, w6, 0, ne
	ble	.L467
.L470:
	ldrsh	w1, [x10, 76]
	cmp	w12, w0
	csel	w0, w0, w13, hi
	add	w5, w11, 1
	udiv	w1, w1, w2
	mul	w1, w1, w2
	cmp	w1, w0
	csel	w1, w1, wzr, le
	cmp	w5, 250
	bgt	.L501
	udiv	w7, w1, w21
	sxtw	x3, w11
	mov	w11, w5
	mov	w8, 0
	add	x3, x3, 6
	add	w4, w4, 1
	lsl	x3, x3, 3
	udiv	w5, w0, w21
	msub	w1, w7, w21, w1
	bfi	w8, w1, 0, 9
	mov	w1, 0
	bfi	w1, w7, 0, 9
	strh	w8, [x29, 76]
	strh	w1, [x29, 78]
	mov	w1, 0
	msub	w0, w5, w21, w0
	bfi	w1, w0, 0, 9
	mov	w0, 0
	bfi	w0, w5, 0, 9
	ldr	w5, [x29, 76]
	str	w5, [x20, x3]
	add	x3, x3, 4
	strh	w1, [x29, 76]
	strh	w0, [x29, 78]
	ldr	w0, [x29, 76]
	str	w0, [x20, x3]
	ldr	w8, [x19, 44]
	cmp	w4, w8
	blt	.L476
.L498:
	ldr	w0, [x19, 56]
	cmp	w0, 1
	bne	.L502
	.p2align 2
.L477:
	strh	wzr, [x29, 72]
	sub	w21, w21, #1
	strh	wzr, [x29, 74]
	mov	w2, 0
	sub	w22, w22, #1
	mov	w1, 0
	ldr	w3, [x29, 72]
	bfi	w2, w21, 0, 9
	bfi	w1, w22, 0, 9
	strh	w2, [x29, 72]
	strh	w1, [x29, 74]
	mov	w11, 0
	str	w0, [x19, 44]
	str	w3, [x20, 48]
	ldr	w0, [x29, 72]
	str	w0, [x20, 52]
	b	.L478
	.p2align 3
.L458:
	madd	w0, w0, w1, w3
	mov	w23, 10
	b	.L479
	.p2align 3
.L495:
	adds	w3, w2, 511
	add	w2, w2, 1022
	csel	w2, w2, w3, mi
	add	w4, w0, 126
	and	w2, w2, -512
	cmp	w2, wzr
	add	w3, w2, 63
	csel	w2, w3, w2, lt
	adds	w6, w0, 63
	csel	w3, w4, w6, mi
	asr	w2, w2, 6
	asr	w3, w3, 6
	lsl	w2, w2, 1
	lsl	w3, w3, 5
	mul	w3, w2, w3
	b	.L457
	.p2align 3
.L496:
	add	w22, w22, w22, lsr 31
	asr	w22, w22, 1
	b	.L460
	.p2align 3
.L471:
	udiv	w0, w0, w2
	ldrsh	w1, [x5, 80]
	udiv	w1, w1, w2
	mul	w0, w0, w2
	mul	w1, w1, w2
	cmp	w0, w1
	add	w14, w1, 1
	bhi	.L472
	sub	w1, w4, #1
	cmp	w0, w14
	add	x1, x19, x1, sxtw 2
	beq	.L472
	ldrsh	w1, [x1, 78]
	sub	w1, w1, #1
	add	w1, w1, w2
	udiv	w1, w1, w2
	mul	w1, w1, w2
	cmp	w0, w1
	bhi	.L470
.L472:
	cmp	w7, 199
	mov	w4, w3
	bgt	.L503
	ldrsh	w1, [x5, 82]
.L468:
	add	w3, w4, 1
	add	x5, x19, x4, sxtw 2
	cmp	w8, w3
	add	w0, w9, w1
	add	w7, w3, 1
	bgt	.L471
	udiv	w0, w0, w2
	mul	w0, w0, w2
	b	.L470
.L482:
	mov	w2, 2
	b	.L462
	.p2align 3
.L503:
	add	x0, x19, x3, sxtw 2
	ldrsh	w0, [x0, 78]
	sub	w0, w0, #1
	add	w0, w0, w2
	udiv	w0, w0, w2
	mul	w0, w0, w2
	b	.L470
.L499:
	ldr	x2, .LC200
	mov	w3, 2080
	ldr	x1, .LC207
	mov	w0, 0
	add	x2, x2, 280
	bl	dprint_vfmw
.L491:
	mov	w11, 0
	ldr	w0, [x19, 56]
	b	.L461
.L483:
	mov	w2, 4
	b	.L462
.L492:
	ldr	x1, .LC197
	mov	x3, x20
	mov	x2, x19
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L490
.L501:
	mov	w0, 1
	str	w0, [x19, 56]
	b	.L477
.L494:
	ldr	x1, .LC203
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L490
.L493:
	ldr	x2, .LC200
	mov	w0, 0
	ldr	x3, .LC199
	ldr	x1, .LC201
	add	x2, x2, 256
	bl	dprint_vfmw
	mov	w0, -1
	b	.L490
	.size	VDMHAL_V4R3C1_CfgRpMsg, .-VDMHAL_V4R3C1_CfgRpMsg
	.align	3
.LC197:
	.xword	.LC196
	.align	3
.LC199:
	.xword	.LC198
	.align	3
.LC200:
	.xword	.LANCHOR1
	.align	3
.LC201:
	.xword	.LC6
	.align	3
.LC203:
	.xword	.LC202
	.align	3
.LC205:
	.xword	.LC204
	.align	3
.LC207:
	.xword	.LC206
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_CfgRpReg
	.type	VDMHAL_V4R3C1_CfgRpReg, %function
VDMHAL_V4R3C1_CfgRpReg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x0, x30
	mov	x22, x1
	mov	x19, x2
	mov	w21, w3
	mov	x20, x4
	bl	_mcount
	cmp	x19, xzr
	str	wzr, [x29, 60]
	ccmp	x22, xzr, 4, ne
	beq	.L531
	cmp	w21, wzr
	bgt	.L532
	ldr	x0, [x22]
	cbz	x0, .L533
.L508:
	ldr	x19, .LC213
	ldr	w3, [x22, 64]
	ldrb	w0, [x19]
	and	w3, w3, -16
	str	w3, [x29, 60]
	cmp	w0, 1
	beq	.L534
	mov	w2, 16
	mov	w1, 2
	mov	x0, x20
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	mov	w3, 53763
	movk	w3, 0x2000, lsl 16
	str	w3, [x29, 60]
	cmp	w0, 1
	ldr	x2, .LC214
	sxtw	x1, w21
	beq	.L511
	mov	w2, 12
	mov	w1, 2
	mov	x0, x20
	mov	w22, 3075
	movk	w22, 0x30, lsl 16
	bl	VDH_Record_RegData
	str	w22, [x29, 60]
	ldrb	w0, [x19]
	sxtw	x1, w21
	ldr	x2, .LC214
	cmp	w0, 1
	beq	.L513
	mov	x0, x20
	mov	w3, w22
	mov	w2, 60
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L535
	mov	x0, x20
	mov	w3, w22
	mov	w2, 64
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L536
	mov	x0, x20
	mov	w3, w22
	mov	w2, 68
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L537
	mov	x0, x20
	mov	w3, w22
	mov	w2, 72
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L538
	mov	x0, x20
	mov	w3, w22
	mov	w2, 76
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L539
	mov	x0, x20
	mov	w3, w22
	mov	w2, 80
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L540
	mov	x0, x20
	mov	w3, w22
	mov	w2, 84
	mov	w1, 2
	bl	VDH_Record_RegData
	mov	w0, 0
.L528:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L534:
	sxtw	x1, w21
	ldr	x2, .LC214
	lsl	x0, x1, 6
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x4, x0, x1
	add	x0, x0, x4, lsl 2
	ldr	x0, [x2, x0]
	str	w3, [x0, 16]
.L511:
	lsl	x0, x1, 6
	mov	w4, 53763
	sub	x0, x0, x1
	movk	w4, 0x2000, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 12]
.L513:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 60]
.L515:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 64]
.L517:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 68]
.L519:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 72]
.L521:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 76]
.L523:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 80]
.L525:
	lsl	x3, x1, 6
	mov	w4, 3075
	sub	x3, x3, x1
	movk	w4, 0x30, lsl 16
	lsl	x3, x3, 2
	mov	w0, 0
	sub	x1, x3, x1
	add	x1, x3, x1, lsl 2
	ldr	x1, [x2, x1]
	str	w4, [x1, 84]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L533:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L509
	str	x0, [x22]
	b	.L508
	.p2align 3
.L532:
	ldr	x2, .LC210
	mov	w4, 0
	ldr	x1, .LC211
	mov	w3, w21
	add	x2, x2, 304
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L528
	.p2align 3
.L531:
	ldr	x1, .LC209
	mov	x3, x22
	mov	x2, x19
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L528
.L509:
	ldr	x1, .LC212
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L528
.L537:
	ldr	x2, .LC214
	sxtw	x1, w21
	b	.L519
.L536:
	ldr	x2, .LC214
	sxtw	x1, w21
	b	.L517
.L535:
	ldr	x2, .LC214
	sxtw	x1, w21
	b	.L515
.L540:
	ldr	x2, .LC214
	sxtw	x1, w21
	b	.L525
.L539:
	ldr	x2, .LC214
	sxtw	x1, w21
	b	.L523
.L538:
	ldr	x2, .LC214
	sxtw	x1, w21
	b	.L521
	.size	VDMHAL_V4R3C1_CfgRpReg, .-VDMHAL_V4R3C1_CfgRpReg
	.align	3
.LC209:
	.xword	.LC208
	.align	3
.LC210:
	.xword	.LANCHOR1
	.align	3
.LC211:
	.xword	.LC84
	.align	3
.LC212:
	.xword	.LC118
	.align	3
.LC213:
	.xword	g_HalDisable
	.align	3
.LC214:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_MakeDecReport
	.type	VDMHAL_V4R3C1_MakeDecReport, %function
VDMHAL_V4R3C1_MakeDecReport:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L571
	ldr	x23, [x19, 8]
	ldr	w21, [x19]
	ldr	w22, [x19, 16]
	cbz	x23, .L572
	sxtw	x22, w22
	ldr	x20, .LC223
	lsl	x0, x22, 6
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x1, x0, x22
	add	x0, x0, x1, lsl 2
	ldr	x0, [x20, x0]
	cbz	x0, .L545
	ldr	x2, .LC224
	add	x0, x2, 4
	add	x2, x2, 128
	ldr	w1, [x2, -128]
	cmp	w1, 1
	bne	.L548
	b	.L560
	.p2align 3
.L574:
	cmp	x0, x2
	beq	.L573
.L548:
	ldr	w1, [x0]
	add	x0, x0, 4
	cmp	w1, 1
	bne	.L574
.L560:
	mov	w19, w1
.L546:
	ldr	x3, .LC228
	mov	x2, 824
	mov	w1, 0
	mov	x0, x23
	ldr	x3, [x3, 96]
	blr	x3
	lsl	x0, x22, 6
	lsl	x1, x22, 2
	sub	x0, x0, x22
	sub	x1, x1, x22
	lsl	x0, x0, 2
	lsl	x2, x1, 4
	sub	x3, x0, x22
	sub	x1, x2, x1
	ldr	x4, .LC229
	add	x2, x0, x3, lsl 2
	add	x2, x20, x2
	add	x1, x4, x1, lsl 2
	ldr	w0, [x2, 40]
	str	w0, [x23, 4]
	ldr	w1, [x1, 4]
	ubfx	x0, x1, 17, 2
	cmp	w0, 1
	beq	.L561
	and	w1, w1, 131072
	cmp	w1, wzr
	ccmp	w21, 3, 0, ne
	cset	w1, ne
.L549:
	lsl	x0, x22, 2
	str	w1, [x23]
	sub	x0, x0, x22
	cmp	w21, wzr
	lsl	x1, x0, 4
	ccmp	w21, 15, 4, ne
	sub	x0, x1, x0
	add	x0, x4, x0, lsl 2
	ldr	w2, [x0, 4]
	and	w2, w2, 131071
	str	w2, [x23, 12]
	beq	.L575
.L550:
	cmp	w2, 200
	bhi	.L576
.L552:
	lsl	x0, x22, 6
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x1, x0, x22
	add	x0, x0, x1, lsl 2
	add	x20, x20, x0
	ldr	w21, [x20, 56]
	mov	w0, w21
	bl	MEM_Phy2Vir
	cbz	x0, .L577
	lsl	x3, x22, 2
	ldr	x19, .LC234
	sub	x3, x3, x22
	ldr	w2, [x23, 12]
	mov	x1, x0
	add	x20, x22, x3, lsl 3
	lsl	w2, w2, 2
	add	x0, x19, x20, lsl 7
	bl	VDMHAL_V4R3C1_ReadMsgSlot
	ldr	w0, [x23, 12]
	cbz	w0, .L557
	sub	w2, w0, #1
	mov	x5, 26
	add	x1, x23, 22
	mov	w0, 2
	add	x5, x5, x2, uxtw 2
	lsl	x3, x20, 5
	add	x5, x23, x5
	.p2align 2
.L556:
	sub	w2, w0, #1
	add	x4, x3, x0, uxtw
	add	x2, x3, x2
	add	w0, w0, 4
	ldr	w2, [x19, x2, lsl 2]
	strh	w2, [x1, -2]
	ldr	w2, [x19, x4, lsl 2]
	strh	w2, [x1], 4
	cmp	x5, x1
	bne	.L556
.L557:
	mov	w0, 6
	bl	IsDprintTypeEnable
	cbnz	w0, .L578
.L543:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L575:
	cmp	w19, 1
	beq	.L579
	ldr	x1, .LC230
	ldrb	w1, [x1]
	cbnz	w1, .L550
	ldrb	w0, [x0, 19]
	and	w0, w0, 3
	cmp	w0, 2
	bne	.L550
	mov	w0, 1
	strh	wzr, [x23, 20]
	str	w0, [x23, 12]
	mov	w0, 0
	strh	wzr, [x23, 22]
	b	.L543
	.p2align 3
.L573:
	mov	w19, 0
	b	.L546
	.p2align 3
.L578:
	ldr	x1, .LC236
	mov	w0, 6
	ldr	w2, [x23, 12]
	mov	w20, 0
	bl	dprint_vfmw
	mov	w2, w21
	ldr	x1, .LC238
	lsl	x21, x22, 2
	mov	w0, 6
	sub	x21, x21, x22
	bl	dprint_vfmw
	ldr	x24, .LC240
	add	x21, x22, x21, lsl 3
	lsl	x21, x21, 5
	.p2align 2
.L558:
	add	w1, w20, 3
	add	w3, w20, 2
	add	w0, w20, 1
	add	x7, x21, x20, uxtw
	add	x1, x21, x1
	add	x3, x21, x3
	add	x0, x21, x0
	mov	w2, w20
	add	w20, w20, 4
	ldr	w6, [x19, x1, lsl 2]
	mov	x1, x24
	ldr	w5, [x19, x3, lsl 2]
	ldr	w4, [x19, x0, lsl 2]
	mov	w0, 6
	ldr	w3, [x19, x7, lsl 2]
	bl	dprint_vfmw
	ldr	w0, [x23, 12]
	lsl	w0, w0, 2
	sub	w0, w0, #3
	cmp	w0, w20
	bhi	.L558
	ldr	x1, .LC242
	mov	w0, 6
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L561:
	mov	w1, 0
	b	.L549
	.p2align 3
.L576:
	ldr	x1, .LC232
	mov	w3, 200
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x23, 12]
	b	.L552
	.p2align 3
.L579:
	ldr	w0, [x0, 16]
	ubfx	x0, x0, 21, 2
	cmp	w0, 2
	bne	.L550
	strh	wzr, [x23, 20]
	mov	w0, 0
	strh	wzr, [x23, 22]
	str	w19, [x23, 12]
	b	.L543
.L577:
	ldr	x2, .LC219
	ldr	x3, .LC233
	ldr	x1, .LC220
	add	x2, x2, 328
	bl	dprint_vfmw
	mov	w0, -1
	b	.L543
.L545:
	ldr	x2, .LC219
	ldr	x3, .LC225
.L569:
	ldr	x1, .LC220
	mov	w0, 0
	add	x2, x2, 328
	bl	dprint_vfmw
	mov	w0, -1
	b	.L543
.L572:
	ldr	x2, .LC219
	ldr	x3, .LC222
	b	.L569
.L571:
	ldr	x2, .LC219
	ldr	x3, .LC218
	b	.L569
	.size	VDMHAL_V4R3C1_MakeDecReport, .-VDMHAL_V4R3C1_MakeDecReport
	.align	3
.LC218:
	.xword	.LC217
	.align	3
.LC219:
	.xword	.LANCHOR1
	.align	3
.LC220:
	.xword	.LC6
	.align	3
.LC222:
	.xword	.LC221
	.align	3
.LC223:
	.xword	g_HwMem
	.align	3
.LC224:
	.xword	g_DSPState
	.align	3
.LC225:
	.xword	.LC157
	.align	3
.LC228:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC229:
	.xword	g_BackUp
	.align	3
.LC230:
	.xword	g_not_allow_H264FullPictureRepair_flag
	.align	3
.LC232:
	.xword	.LC231
	.align	3
.LC233:
	.xword	.LC185
	.align	3
.LC234:
	.xword	g_UpMsg
	.align	3
.LC236:
	.xword	.LC235
	.align	3
.LC238:
	.xword	.LC237
	.align	3
.LC240:
	.xword	.LC239
	.align	3
.LC242:
	.xword	.LC241
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_PrepareRepair
	.type	VDMHAL_V4R3C1_PrepareRepair, %function
VDMHAL_V4R3C1_PrepareRepair:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	w22, w0
	mov	x0, x30
	sxtw	x19, w3
	mov	x26, x1
	mov	w25, w2
	mov	x23, x4
	bl	_mcount
	ldr	x24, .LC243
	lsl	x0, x19, 6
	mov	x21, x19
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x20, x0, x19
	add	x20, x0, x20, lsl 2
	add	x27, x20, x24
	cbz	x26, .L592
	cmp	w19, wzr
	bgt	.L593
	ldr	x0, [x20, x24]
	cbz	x0, .L594
	cbz	w25, .L595
.L586:
	cmp	w25, 1
	mov	w20, 0
	beq	.L596
.L582:
	mov	w0, w20
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L594:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L585
	str	x0, [x20, x24]
	cbnz	w25, .L586
	.p2align 2
.L595:
	lsl	x0, x19, 3
	ldr	x24, .LC250
	sub	x0, x0, x19
	lsl	x0, x0, 3
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	add	x0, x24, x0, lsl 3
	ldr	w1, [x0, 44]
	cmp	w1, wzr
	ble	.L587
	cmp	w22, 6
	bne	.L588
	ldrb	w1, [x26, 17]
	mov	w2, 0
	cmp	w1, 1
	csel	w1, w1, w2, eq
	str	w1, [x0, 928]
.L588:
	mov	x4, x23
	mov	w3, w21
	mov	x2, x26
	mov	x1, x27
	mov	w0, w22
	mov	w20, 0
	bl	VDMHAL_V4R3C1_CfgRpReg
	lsl	x0, x19, 3
	mov	w2, w21
	sub	x0, x0, x19
	mov	x1, x27
	lsl	x0, x0, 3
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	add	x0, x24, x0, lsl 3
	bl	VDMHAL_V4R3C1_CfgRpMsg
	ldr	x27, [sp, 80]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L596:
	cmp	w22, 6
	bne	.L590
	ldrb	w0, [x26, 17]
	cmp	w0, 1
	bne	.L590
	lsl	x0, x19, 3
	ldr	x24, .LC250
	sub	x0, x0, x19
	lsl	x0, x0, 3
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	lsl	x19, x19, 3
	add	x0, x24, x19
	ldr	w1, [x0, 920]
	cmp	w1, wzr
	ble	.L590
	mov	w1, 2
	mov	x4, x23
	mov	w3, w21
	mov	x2, x26
	str	w1, [x0, 928]
	mov	x1, x27
	mov	w0, w22
	bl	VDMHAL_V4R3C1_CfgRpReg
	add	x0, x19, 876
	mov	w2, w21
	mov	x1, x27
	add	x0, x24, x0
	bl	VDMHAL_V4R3C1_CfgRpMsg
	ldr	x27, [sp, 80]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L593:
	ldr	x2, .LC246
	mov	w4, 0
	ldr	x1, .LC247
	mov	w3, w19
	add	x2, x2, 360
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L582
	.p2align 3
.L590:
	ldr	x1, .LC254
	mov	w0, 0
	mov	w20, 0
	bl	dprint_vfmw
	b	.L582
.L592:
	ldr	x1, .LC245
	mov	x2, 0
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L582
.L587:
	ldr	x1, .LC252
	mov	w0, 0
	mov	w20, 0
	bl	dprint_vfmw
	b	.L582
.L585:
	ldr	x1, .LC249
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L582
	.size	VDMHAL_V4R3C1_PrepareRepair, .-VDMHAL_V4R3C1_PrepareRepair
	.align	3
.LC243:
	.xword	g_HwMem
	.align	3
.LC245:
	.xword	.LC244
	.align	3
.LC246:
	.xword	.LANCHOR1
	.align	3
.LC247:
	.xword	.LC84
	.align	3
.LC249:
	.xword	.LC248
	.align	3
.LC250:
	.xword	g_RepairParam
	.align	3
.LC252:
	.xword	.LC251
	.align	3
.LC254:
	.xword	.LC253
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_StartHwRepair
	.type	VDMHAL_V4R3C1_StartHwRepair, %function
VDMHAL_V4R3C1_StartHwRepair:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	sxtw	x20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x21, .LC255
	ldrb	w4, [x21]
	cmp	w4, 1
	bne	.L621
	cmp	w20, wzr
	ble	.L622
	ldr	x22, .LC257
	mov	w3, w20
	ldr	x23, .LC258
	mov	w0, 32
	add	x2, x22, 392
	mov	x1, x23
	bl	dprint_vfmw
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L605
	mov	x0, x19
	mov	w3, -2
	mov	w2, 36
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L618
.L600:
	cbz	x19, .L623
.L614:
	ldr	x1, .LC261
	sbfiz	x0, x20, 6, 32
	mov	w2, 1
	str	w2, [x19, 4]
	add	x1, x1, x0
	mov	x0, x19
	ldr	w1, [x1, 8]
	str	w1, [x19, 8]
	strb	w20, [x19]
	strb	w2, [x19, 2]
	bl	VDH_PostTask
.L597:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L622:
	sxtw	x0, w20
	ldr	x3, .LC256
	lsl	x1, x0, 6
	mov	w4, 67108864
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x2, x1, x0
	add	x1, x1, x2, lsl 2
	ldr	x1, [x3, x1]
	str	w4, [x1, 8]
.L603:
	lsl	x1, x0, 6
	mov	w2, -2
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x0, x1, x0
	add	x0, x1, x0, lsl 2
	ldr	x0, [x3, x0]
	str	w2, [x0, 36]
.L601:
	ldr	x0, .LC262
	ldr	x0, [x0, 224]
	blr	x0
	cmp	w20, wzr
	ble	.L617
	ldr	x22, .LC257
	ldr	x23, .LC258
.L610:
	add	x22, x22, 408
	mov	w3, w20
	mov	x2, x22
	mov	x1, x23
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	mov	w3, w20
	mov	x2, x22
	mov	x1, x23
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	mov	w4, 1
	mov	w3, w20
	mov	x2, x22
	mov	x1, x23
	mov	w0, 32
	bl	dprint_vfmw
	b	.L597
	.p2align 3
.L599:
	cmp	w20, wzr
	ble	.L615
	ldr	x22, .LC257
	ldr	x23, .LC258
.L605:
	mov	w4, 1
	mov	w3, w20
	add	x2, x22, 392
	mov	x1, x23
	mov	w0, 32
	bl	dprint_vfmw
	ldrb	w0, [x21]
	cmp	w0, 1
	bne	.L600
.L618:
	ldr	x0, .LC262
	ldr	x0, [x0, 224]
	blr	x0
	b	.L610
	.p2align 3
.L621:
	mov	x0, x19
	mov	w3, 67108864
	mov	w2, 8
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L599
	mov	x0, x19
	mov	w3, -2
	mov	w2, 36
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L601
	cbnz	x19, .L614
.L623:
	ldr	x2, .LC257
	mov	x3, 0
	ldr	x1, .LC260
	mov	w0, 0
	add	x2, x2, 408
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L617:
	lsl	x0, x20, 6
	ldr	x1, .LC256
	sub	x0, x0, x20
	mov	w3, 1
	lsl	x0, x0, 2
	sub	x20, x0, x20
	add	x0, x0, x20, lsl 2
	ldr	x2, [x1, x0]
	str	wzr, [x2]
	ldr	x2, [x1, x0]
	str	w3, [x2]
	ldr	x0, [x1, x0]
	str	wzr, [x0]
	b	.L597
.L615:
	ldr	x3, .LC256
	sxtw	x0, w20
	b	.L603
	.size	VDMHAL_V4R3C1_StartHwRepair, .-VDMHAL_V4R3C1_StartHwRepair
	.align	3
.LC255:
	.xword	g_HalDisable
	.align	3
.LC256:
	.xword	g_HwMem
	.align	3
.LC257:
	.xword	.LANCHOR1
	.align	3
.LC258:
	.xword	.LC98
	.align	3
.LC260:
	.xword	.LC259
	.align	3
.LC261:
	.xword	g_VdmDrvParam
	.align	3
.LC262:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_CalVdhClkSkip
	.type	VDMHAL_V4R3C1_CalVdhClkSkip, %function
VDMHAL_V4R3C1_CalVdhClkSkip:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x0, x30
	bl	_mcount
	ldr	x24, .LC264
	ldr	w28, [x24, 128]
	tbnz	w28, #31, .L656
	ldr	x25, .LC267
	add	x20, x24, 132
	ldr	x27, .LC270
	add	x24, x24, 256
	ldr	x26, .LC269
	mov	w23, 30
	mov	w22, 0
	mov	w21, 0
	add	x25, x25, 440
	mov	w19, 0
	b	.L627
	.p2align 3
.L659:
	mov	w3, w28
	mov	x2, x25
	mov	x1, x26
	mov	w0, 1
	bl	dprint_vfmw
.L629:
	cmp	x24, x20
	beq	.L657
.L646:
	ldr	w28, [x20], 4
	tbnz	w28, #31, .L658
.L627:
	mov	w0, w28
	bl	VCTRL_IsChanActive
	cbnz	w0, .L659
	mov	w0, w28
	bl	FSP_GetInst
	cbz	x0, .L630
	ldp	w1, w0, [x0, 40]
	adds	w19, w1, 15
	add	w1, w1, 30
	add	w21, w0, 30
	csel	w19, w1, w19, mi
	adds	w0, w0, 15
	asr	w19, w19, 4
	csel	w0, w21, w0, mi
	asr	w21, w0, 4
.L630:
	ldr	x1, [x27, w28, sxtw 3]
	mov	w0, w28
	ldr	w1, [x1, 1712]
	cmp	w1, 31
	csel	w23, w23, w1, lt
	bl	VCTRL_GetVidStd
	cmp	w0, 17
	bls	.L660
.L649:
	cmp	x24, x20
	mov	w22, 0
	bne	.L646
.L657:
	lsl	w0, w22, 2
	mov	w3, 23813
	sub	w22, w0, w22
	movk	w3, 0xdb4f, lsl 16
	lsl	w1, w22, 6
	mov	w0, 32
	mov	w2, 25
	umull	x1, w1, w3
	ldp	x19, x20, [sp, 16]
	lsr	x1, x1, 53
	sub	w0, w0, w1
	cmp	w0, w2
	csel	w0, w0, w2, le
	cmp	w0, wzr
	csel	w0, w0, wzr, ge
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L660:
	ldr	x1, .LC271
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx633
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx633:
	.section	.rodata
	.align	0
	.align	2
.L633:
	.byte	(.L642 - .Lrtx633) / 4
	.byte	(.L642 - .Lrtx633) / 4
	.byte	(.L642 - .Lrtx633) / 4
	.byte	(.L642 - .Lrtx633) / 4
	.byte	(.L649 - .Lrtx633) / 4
	.byte	(.L642 - .Lrtx633) / 4
	.byte	(.L642 - .Lrtx633) / 4
	.byte	(.L649 - .Lrtx633) / 4
	.byte	(.L642 - .Lrtx633) / 4
	.byte	(.L642 - .Lrtx633) / 4
	.byte	(.L642 - .Lrtx633) / 4
	.byte	(.L642 - .Lrtx633) / 4
	.byte	(.L642 - .Lrtx633) / 4
	.byte	(.L642 - .Lrtx633) / 4
	.byte	(.L649 - .Lrtx633) / 4
	.byte	(.L643 - .Lrtx633) / 4
	.byte	(.L642 - .Lrtx633) / 4
	.byte	(.L642 - .Lrtx633) / 4
	.text
	.p2align 3
.L642:
	mul	w22, w19, w21
	mul	w22, w22, w23
	b	.L629
	.p2align 3
.L658:
	lsl	w1, w22, 2
	mov	w0, 23813
	sub	w22, w1, w22
	movk	w0, 0xdb4f, lsl 16
	lsl	w22, w22, 6
	mov	w1, 32
	mov	w2, 25
	umull	x0, w22, w0
	lsr	x0, x0, 53
	sub	w0, w1, w0
	cmp	w0, w2
	csel	w0, w0, w2, le
	cmp	w0, wzr
	csel	w0, w0, wzr, ge
.L625:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L643:
	mul	w22, w19, w21
	mul	w22, w22, w23
	lsl	w22, w22, 1
	b	.L629
.L656:
	mov	w0, 25
	b	.L625
	.size	VDMHAL_V4R3C1_CalVdhClkSkip, .-VDMHAL_V4R3C1_CalVdhClkSkip
	.align	3
.LC264:
	.xword	g_ChanCtx
	.align	3
.LC267:
	.xword	.LANCHOR1
	.align	3
.LC269:
	.xword	.LC268
	.align	3
.LC270:
	.xword	s_pstVfmwChan
	.align	3
.LC271:
	.xword	.L633
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_GetVdmClk
	.type	VDMHAL_V4R3C1_GetVdmClk, %function
VDMHAL_V4R3C1_GetVdmClk:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, 3
	bls	.L669
.L662:
	ldr	x0, .LC274
	sbfiz	x19, x19, 6, 32
	mov	w1, 500
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L669:
	ldr	x0, .LC273
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx664
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx664:
	.section	.rodata
	.align	0
	.align	2
.L664:
	.byte	(.L662 - .Lrtx664) / 4
	.byte	(.L665 - .Lrtx664) / 4
	.byte	(.L666 - .Lrtx664) / 4
	.byte	(.L667 - .Lrtx664) / 4
	.text
	.p2align 3
.L666:
	ldr	x0, .LC274
	sbfiz	x19, x19, 6, 32
	mov	w1, 100
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L665:
	ldr	x0, .LC274
	sbfiz	x19, x19, 6, 32
	mov	w1, 540
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L667:
	ldr	x0, .LC274
	sbfiz	x19, x19, 6, 32
	mov	w1, 600
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_V4R3C1_GetVdmClk, .-VDMHAL_V4R3C1_GetVdmClk
	.align	3
.LC273:
	.xword	.L664
	.align	3
.LC274:
	.xword	g_VdmDrvParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_StartHwDecode
	.type	VDMHAL_V4R3C1_StartHwDecode, %function
VDMHAL_V4R3C1_StartHwDecode:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, wzr
	ble	.L671
	ldr	x2, .LC275
	mov	w4, 0
	ldr	x1, .LC276
	mov	w3, w20
	add	x2, x2, 472
	mov	w0, 0
	bl	dprint_vfmw
.L670:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L671:
	ldr	x21, .LC277
	ldrb	w0, [x21]
	cmp	w0, 1
	bne	.L705
	ldr	x1, .LC280
	ldr	x2, [x1]
	ldr	w0, [x2, 120]
	ubfx	x3, x0, 8, 2
	cbz	w3, .L676
	and	w0, w0, -769
	str	w0, [x2, 120]
.L676:
	ldr	x24, .LC278
	sxtw	x22, w20
	ldr	x2, .LC279
	mov	w3, 500
	add	x0, x24, x22, lsl 6
	ldr	w23, [x0, 8]
	str	w3, [x0, 16]
	ldr	x0, [x2, w23, sxtw 3]
	ldr	w25, [x0, 1352]
.L675:
	ldr	x0, [x1]
	ldr	w1, [x0, 120]
	and	w1, w1, -258049
	str	w1, [x0, 120]
	ldr	w1, [x0, 120]
	orr	w1, w1, 131072
	str	w1, [x0, 120]
.L677:
	mov	w0, 12
	mov	x3, x19
	mov	w2, w20
	mov	w1, 3
	bl	SCD_ConfigReg
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L706
	mov	w1, 2
	mov	x0, x19
	mov	w3, -1431655766
	mov	w2, 156
	bl	VDH_Record_RegData
	ldr	x1, .LC281
	ldrb	w0, [x21]
	ldr	w1, [x1]
	cmp	w1, 1
	beq	.L707
.L679:
	mov	w3, 0
.L678:
	cmp	w0, 1
	beq	.L708
	mov	x0, x19
	mov	w2, 61472
	mov	w1, 2
	bl	VDH_Record_RegData
	cmp	w25, 1
	ldrb	w0, [x21]
	beq	.L709
.L682:
	mov	w3, -2
.L681:
	cmp	w0, 1
	beq	.L710
	mov	x0, x19
	mov	w2, 36
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L711
	cbz	x19, .L712
	mov	w0, 1
	strb	w20, [x19]
	stp	w0, w23, [x19, 4]
	mov	x0, x19
	bl	VDH_PostTask
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L709:
	mov	w3, -6
	b	.L681
	.p2align 3
.L707:
	mov	w3, 7
	b	.L678
	.p2align 3
.L705:
	mov	w3, 0
	mov	w2, 0
	mov	w1, 0
	mov	x0, x19
	sxtw	x22, w20
	bl	VDH_Record_RegData
	ldr	x24, .LC278
	ldr	x1, .LC279
	mov	w2, 500
	add	x0, x24, x22, lsl 6
	ldrb	w3, [x21]
	cmp	w3, 1
	ldr	w23, [x0, 8]
	str	w2, [x0, 16]
	ldr	x0, [x1, w23, sxtw 3]
	ldr	w25, [x0, 1352]
	beq	.L713
	mov	w3, 0
	mov	w2, 1
	mov	w1, 0
	mov	x0, x19
	bl	VDH_Record_RegData
	b	.L677
	.p2align 3
.L706:
	ldr	x2, .LC281
	lsl	x1, x22, 6
	sub	x1, x1, x22
	ldr	x26, .LC282
	lsl	x1, x1, 2
	ldr	w2, [x2]
	cmp	w2, 1
	sub	x2, x1, x22
	add	x1, x1, x2, lsl 2
	mov	w2, -1431655766
	ldr	x1, [x26, x1]
	str	w2, [x1, 156]
	bne	.L679
	mov	w3, 7
	b	.L680
	.p2align 3
.L708:
	ldr	x26, .LC282
.L680:
	lsl	x0, x22, 6
	cmp	w25, 1
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x1, x0, x22
	add	x0, x0, x1, lsl 2
	ldr	x0, [x26, x0]
	add	x0, x0, 61440
	str	w3, [x0, 32]
	beq	.L695
	mov	w0, 1
	b	.L682
	.p2align 3
.L710:
	ldr	x26, .LC282
.L683:
	lsl	x1, x22, 6
	ldr	x19, .LC283
	sub	x1, x1, x22
	mov	x0, 30
	lsl	x1, x1, 2
	sub	x2, x1, x22
	add	x1, x1, x2, lsl 2
	ldr	x1, [x26, x1]
	str	w3, [x1, 36]
	ldr	x1, [x19, 232]
	blr	x1
	ldr	x0, [x19, 224]
	blr	x0
.L686:
	lsl	x0, x22, 6
	mov	w2, 1
	sub	x1, x0, x22
	add	x24, x24, x0
	lsl	x0, x1, 2
	ldr	x3, .LC285
	sub	x22, x0, x22
	mov	w1, 4
	add	x22, x0, x22, lsl 2
	ldr	x0, [x26, x22]
	str	wzr, [x0]
	ldr	x0, [x26, x22]
	str	w2, [x0]
	ldr	x0, [x26, x22]
	str	wzr, [x0]
	ldr	w2, [x24, 8]
	mov	w0, w2
	ldr	w2, [x3, w2, sxtw 2]
	bl	VDEC_Lowdelay_Event_Time
	b	.L670
	.p2align 3
.L712:
	ldr	x2, .LC275
	mov	x3, 0
	ldr	x1, .LC284
	mov	w0, 0
	add	x2, x2, 472
	bl	dprint_vfmw
	b	.L670
	.p2align 3
.L695:
	mov	w3, -6
	b	.L683
.L713:
	ldr	x1, .LC280
	b	.L675
.L711:
	ldr	x19, .LC283
	mov	x0, 30
	ldr	x1, [x19, 232]
	blr	x1
	ldr	x0, [x19, 224]
	blr	x0
	ldr	x26, .LC282
	b	.L686
	.size	VDMHAL_V4R3C1_StartHwDecode, .-VDMHAL_V4R3C1_StartHwDecode
	.align	3
.LC275:
	.xword	.LANCHOR1
	.align	3
.LC276:
	.xword	.LC84
	.align	3
.LC277:
	.xword	g_HalDisable
	.align	3
.LC278:
	.xword	g_VdmDrvParam
	.align	3
.LC279:
	.xword	s_pstVfmwChan
	.align	3
.LC280:
	.xword	g_pstRegCrg
	.align	3
.LC281:
	.xword	mask_mmu_err_int
	.align	3
.LC282:
	.xword	g_HwMem
	.align	3
.LC283:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC284:
	.xword	.LC259
	.align	3
.LC285:
	.xword	g_LowDelaySeqIndex
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_GetCharacter
	.type	VDMHAL_V4R3C1_GetCharacter, %function
VDMHAL_V4R3C1_GetCharacter:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC286
	mov	w3, 15
	ldr	x0, .LC287
	mov	w1, 4
	str	w3, [x2]
	str	w1, [x0]
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V4R3C1_GetCharacter, .-VDMHAL_V4R3C1_GetCharacter
	.align	3
.LC286:
	.xword	g_VdmCharacter
	.align	3
.LC287:
	.xword	g_eVdmVersion
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V4R3C1_WriteBigTitle1DYuv
	.type	VDMHAL_V4R3C1_WriteBigTitle1DYuv, %function
VDMHAL_V4R3C1_WriteBigTitle1DYuv:
	stp	x29, x30, [sp, -208]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	str	x0, [x29, 112]
	mov	x0, x30
	mov	w21, w3
	mov	x22, x1
	mov	w19, w2
	str	w4, [x29, 108]
	bl	_mcount
	ubfx	x0, x21, 29, 2
	stp	xzr, xzr, [x29, 144]
	stp	xzr, xzr, [x29, 160]
	stp	xzr, xzr, [x29, 176]
	stp	xzr, xzr, [x29, 192]
	cmp	w0, 1
	beq	.L759
	mov	w20, 2
	cmp	w0, w20
	csinc	w20, w20, wzr, ne
.L716:
	ldr	x0, [x29, 112]
	cbz	x0, .L715
	ldr	x0, .LC289
	mov	w4, 0
	add	x3, x29, 144
	mov	w2, 4194304
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L719
	ldr	x0, .LC293
	mov	w4, 0
	add	x3, x29, 176
	mov	w2, 4194304
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L719
	add	w19, w19, 15
	add	w21, w21, 15
	and	w19, w19, -16
	and	w0, w21, -16
	add	w1, w19, 255
	mov	w3, w0
	and	w1, w1, -256
	add	w0, w0, 62
	lsl	w1, w1, 4
	ldr	x25, [x29, 184]
	mov	w2, w1
	adds	w1, w3, 31
	csel	w0, w0, w1, mi
	add	w21, w2, 15
	cmp	w2, wzr
	asr	w0, w0, 5
	csel	w21, w21, w2, lt
	cmp	w20, wzr
	asr	w21, w21, 4
	ccmp	w20, 3, 4, ne
	stp	w2, w3, [x29, 124]
	mul	w21, w0, w21
	add	x21, x22, x21, sxtw
	bne	.L720
	lsr	w1, w3, 1
	lsr	w0, w19, 1
	str	w1, [x29, 120]
	add	x1, x25, 2097152
	str	w0, [x29, 104]
	str	x1, [x29, 136]
	ldr	x28, .LC294
	ldr	x20, [x29, 152]
	cbz	w3, .L722
	mov	w27, 0
	str	wzr, [x29, 132]
	.p2align 2
.L721:
	cbz	w19, .L724
	ldr	w0, [x29, 124]
	lsr	w23, w27, 4
	ldr	w24, [x29, 132]
	mov	w26, 0
	mul	w0, w23, w0
	ubfiz	x23, x27, 8, 4
	add	x23, x0, x23
	.p2align 2
.L723:
	lsr	w1, w26, 8
	add	x0, x24, x26, uxtw
	ubfiz	x1, x1, 12, 20
	ldr	x5, [x28, 104]
	add	x1, x1, x23
	mov	x2, 256
	add	x1, x22, x1
	add	x0, x20, x0
	add	w26, w26, 256
	blr	x5
	cmp	w19, w26
	bhi	.L723
.L724:
	ldr	w0, [x29, 132]
	add	w27, w27, 1
	add	w0, w0, w19
	str	w0, [x29, 132]
	ldr	w0, [x29, 128]
	cmp	w0, w27
	bne	.L721
.L722:
	ldr	w0, [x29, 128]
	ldr	x3, [x28, 88]
	ldr	x2, [x29, 112]
	mul	w1, w19, w0
	mov	x0, x20
	blr	x3
	ldr	w0, [x29, 120]
	cbz	w0, .L814
	ldr	w1, [x29, 124]
	mov	w26, 0
	mov	w24, 0
	asr	w0, w1, 1
	str	w0, [x29, 132]
	.p2align 2
.L728:
	cbz	w19, .L730
	ldr	w0, [x29, 132]
	lsr	w22, w24, 3
	uxtw	x23, w26
	mov	w27, 0
	mul	w0, w22, w0
	ubfiz	x22, x24, 8, 3
	add	x22, x0, x22
	.p2align 2
.L727:
	lsr	w1, w27, 8
	add	x0, x23, x27, uxtw
	ubfiz	x1, x1, 11, 21
	ldr	x5, [x28, 104]
	add	x1, x1, x22
	mov	x2, 256
	add	x1, x21, x1
	add	x0, x20, x0
	add	w27, w27, 256
	blr	x5
	cmp	w19, w27
	bhi	.L727
.L730:
	ldr	w0, [x29, 120]
	add	w24, w24, 1
	add	w26, w26, w19
	cmp	w0, w24
	bne	.L728
	ldr	w0, [x29, 108]
	cmp	w0, 1
	beq	.L815
.L756:
	ldr	w0, [x29, 108]
	cbnz	w0, .L733
	ldr	x3, [x28, 96]
	mov	x2, 1048576
	ldr	x0, [x29, 136]
	mov	w1, 128
	blr	x3
	ldr	x3, [x28, 96]
	mov	x2, 1048576
	mov	w1, 128
	mov	x0, x25
	blr	x3
.L733:
	ldr	w0, [x29, 104]
	ldr	w1, [x29, 120]
.L809:
	mul	w19, w0, w1
	ldr	x20, [x29, 112]
	mov	x0, x25
	ldr	x3, [x28, 88]
	mov	w1, w19
	mov	x2, x20
	blr	x3
	ldr	x3, [x28, 88]
	mov	x2, x20
	ldr	x0, [x29, 136]
	mov	w1, w19
	blr	x3
	ldr	w0, [x29, 160]
	ldr	x1, [x29, 152]
	bl	MEM_ReleaseMemBlock
	ldr	x3, [x28, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 144
	blr	x3
	ldr	w0, [x29, 192]
	ldr	x1, [x29, 184]
	bl	MEM_ReleaseMemBlock
	ldr	x3, [x28, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 176
	blr	x3
.L715:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 208
	ret
	.p2align 3
.L719:
	ldr	x1, .LC291
	mov	w0, 1
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 208
	ret
	.p2align 3
.L759:
	mov	w20, 0
	b	.L716
.L720:
	cmp	w20, 1
	ldr	w1, [x29, 128]
	cset	w0, ne
	str	w0, [x29, 120]
	cmp	w1, w0
	lsr	w0, w19, 1
	str	w0, [x29, 104]
	lsr	w0, w1, 1
	str	w0, [x29, 132]
	add	x0, x25, 2097152
	str	x0, [x29, 136]
	ldr	x28, .LC294
	ldr	x20, [x29, 152]
	bls	.L738
	ldr	w27, [x29, 120]
	.p2align 2
.L740:
	cbz	w19, .L741
	ldr	w0, [x29, 124]
	lsr	w24, w27, 4
	lsr	w23, w27, 1
	mov	w26, 0
	mul	w0, w24, w0
	mul	w23, w23, w19
	ubfiz	x24, x27, 8, 4
	add	x24, x0, x24
	.p2align 2
.L739:
	lsr	w1, w26, 8
	add	x0, x23, x26, uxtw
	ubfiz	x1, x1, 12, 20
	ldr	x5, [x28, 104]
	add	x1, x1, x24
	mov	x2, 256
	add	x1, x22, x1
	add	x0, x20, x0
	add	w26, w26, 256
	blr	x5
	cmp	w19, w26
	bhi	.L739
.L741:
	ldr	w0, [x29, 128]
	add	w27, w27, 2
	cmp	w0, w27
	bhi	.L740
.L738:
	ldr	w0, [x29, 128]
	ldr	x3, [x28, 88]
	ldr	x2, [x29, 112]
	mul	w1, w19, w0
	mov	x0, x20
	lsr	w1, w1, 1
	blr	x3
	ldr	w0, [x29, 132]
	cbz	w0, .L816
	ldr	w1, [x29, 124]
	mov	w26, 0
	mov	w24, 0
	asr	w0, w1, 1
	str	w0, [x29, 128]
	.p2align 2
.L745:
	cbz	w19, .L747
	ldr	w0, [x29, 128]
	lsr	w22, w24, 3
	uxtw	x23, w26
	mov	w27, 0
	mul	w0, w22, w0
	ubfiz	x22, x24, 8, 3
	add	x22, x0, x22
	.p2align 2
.L744:
	lsr	w1, w27, 8
	add	x0, x23, x27, uxtw
	ubfiz	x1, x1, 11, 21
	ldr	x5, [x28, 104]
	add	x1, x1, x22
	mov	x2, 256
	add	x1, x21, x1
	add	x0, x20, x0
	add	w27, w27, 256
	blr	x5
	cmp	w19, w27
	bhi	.L744
.L747:
	ldr	w0, [x29, 132]
	add	w24, w24, 1
	add	w26, w26, w19
	cmp	w0, w24
	bne	.L745
	ldr	w0, [x29, 108]
	cmp	w0, 1
	beq	.L817
	ldr	w0, [x29, 108]
	cbnz	w0, .L750
	ldr	w1, [x29, 120]
	ldr	w0, [x29, 132]
	cmp	w0, w1
	bls	.L753
	.p2align 2
.L754:
	ldr	w0, [x29, 120]
	ldr	w1, [x29, 132]
	add	w0, w0, 2
	str	w0, [x29, 120]
	cmp	w1, w0
	bhi	.L754
.L753:
	ldr	x3, [x28, 96]
	mov	x2, 1048576
	ldr	x0, [x29, 136]
	mov	w1, 128
	blr	x3
	ldr	x3, [x28, 96]
	mov	x2, 1048576
	mov	w1, 128
	mov	x0, x25
	blr	x3
.L750:
	ldr	w0, [x29, 104]
	ldr	w1, [x29, 132]
	b	.L809
.L815:
	mov	w0, 0
	mov	w6, 0
	.p2align 2
.L732:
	ldr	w1, [x29, 104]
	mov	w5, w0
	cbz	w1, .L734
	ldr	w1, [x29, 104]
	add	w5, w1, w0
	mov	w1, 1
	.p2align 2
.L731:
	sub	w3, w1, #1
	uxtw	x2, w0
	ldr	x4, [x29, 136]
	add	w0, w0, 1
	cmp	w0, w5
	ldrb	w3, [x20, x3]
	strb	w3, [x4, x2]
	ldrb	w3, [x20, w1, uxtw]
	add	w1, w1, 2
	strb	w3, [x25, x2]
	bne	.L731
.L734:
	ldr	w0, [x29, 120]
	add	w6, w6, 1
	add	x20, x20, x19
	cmp	w0, w6
	mov	w0, w5
	bne	.L732
	b	.L733
.L817:
	ldr	w0, [x29, 120]
	mov	w7, 0
	mul	w1, w19, w0
	lsl	w0, w19, 1
	add	x20, x20, x1
	.p2align 2
.L749:
	ldr	w3, [x29, 104]
	cbz	w3, .L751
	lsr	w1, w7, 1
	mov	w2, 1
	mul	w1, w1, w3
	add	w6, w3, w1
	.p2align 2
.L748:
	sub	w5, w2, #1
	uxtw	x3, w1
	ldr	x4, [x29, 136]
	add	w1, w1, 1
	cmp	w6, w1
	ldrb	w5, [x20, x5]
	strb	w5, [x4, x3]
	ldrb	w5, [x20, w2, uxtw]
	add	w2, w2, 2
	strb	w5, [x25, x3]
	bne	.L748
.L751:
	ldr	w1, [x29, 132]
	add	w7, w7, 2
	add	x20, x20, x0
	cmp	w1, w7
	bhi	.L749
	b	.L750
.L816:
	ldr	w0, [x29, 108]
	cmp	w0, 1
	beq	.L750
	ldr	w0, [x29, 108]
	cbz	w0, .L753
	b	.L750
.L814:
	ldr	w0, [x29, 108]
	cmp	w0, 1
	bne	.L756
	b	.L733
	.size	VDMHAL_V4R3C1_WriteBigTitle1DYuv, .-VDMHAL_V4R3C1_WriteBigTitle1DYuv
	.align	3
.LC289:
	.xword	.LC288
	.align	3
.LC291:
	.xword	.LC290
	.align	3
.LC293:
	.xword	.LC292
	.align	3
.LC294:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CRG_ConfigReg
	.type	CRG_ConfigReg, %function
CRG_ConfigReg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	x21, x2
	bl	_mcount
	ldr	x0, .LC295
	ldrb	w0, [x0]
	cmp	w0, 1
	bne	.L825
	cbnz	w19, .L821
	ldr	x0, .LC296
	ldr	x1, [x0]
	ldr	w0, [x1, 120]
	ubfx	x2, x0, 8, 2
	cmp	w20, w2
	beq	.L818
	bfi	w0, w20, 8, 2
	str	w0, [x1, 120]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L821:
	cmp	w19, 1
	beq	.L826
.L818:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L825:
	mov	w3, w20
	mov	w2, w19
	mov	x0, x21
	mov	w1, 0
	bl	VDH_Record_RegData
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L826:
	ldr	x0, .LC296
	ldr	x1, [x0]
	ldr	w0, [x1, 120]
	bfi	w0, w20, 12, 5
	and	w0, w0, -131073
	str	w0, [x1, 120]
	ldr	w0, [x1, 120]
	orr	w0, w0, 131072
	str	w0, [x1, 120]
	b	.L818
	.size	CRG_ConfigReg, .-CRG_ConfigReg
	.align	3
.LC295:
	.xword	g_HalDisable
	.align	3
.LC296:
	.xword	g_pstRegCrg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MFDE_ConfigReg
	.type	MFDE_ConfigReg, %function
MFDE_ConfigReg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	uxtw	x20, w0
	mov	x0, x30
	mov	w21, w1
	sxtw	x19, w2
	mov	x22, x3
	bl	_mcount
	ldr	x0, .LC297
	ldrb	w4, [x0]
	cmp	w4, 1
	bne	.L831
	cmp	w19, wzr
	ble	.L832
	ldr	x2, .LC299
	mov	w3, w19
	ldr	x1, .LC300
	mov	w0, 32
	add	x2, x2, 392
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L832:
	lsl	x0, x19, 6
	ldr	x1, .LC298
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	add	x19, x0, x19, lsl 2
	ldr	x0, [x1, x19]
	str	w21, [x0, x20]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L831:
	mov	w3, w21
	mov	w2, w20
	mov	x0, x22
	mov	w1, 2
	bl	VDH_Record_RegData
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MFDE_ConfigReg, .-MFDE_ConfigReg
	.align	3
.LC297:
	.xword	g_HalDisable
	.align	3
.LC298:
	.xword	g_HwMem
	.align	3
.LC299:
	.xword	.LANCHOR1
	.align	3
.LC300:
	.xword	.LC98
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.17866, %object
	.size	__func__.17866, 22
__func__.17866:
	.string	"VDMHAL_V4R3C1_OpenHAL"
	.zero	2
	.type	__func__.17940, %object
	.size	__func__.17940, 25
__func__.17940:
	.string	"VDMHAL_V4R3C1_CalcFsSize"
	.zero	7
	.type	__func__.17966, %object
	.size	__func__.17966, 24
__func__.17966:
	.string	"VDMHAL_V4R3C1_CalcFsNum"
	.type	__func__.18008, %object
	.size	__func__.18008, 32
__func__.18008:
	.string	"VDMHAL_V4R3C1_ArrangeMem_Normal"
	.type	__FUNCTION__.18009, %object
	.size	__FUNCTION__.18009, 32
__FUNCTION__.18009:
	.string	"VDMHAL_V4R3C1_ArrangeMem_Normal"
	.type	__func__.17952, %object
	.size	__func__.17952, 33
__func__.17952:
	.string	"VDMHAL_V4R3C1_FillMemArrangeInfo"
	.zero	7
	.type	__func__.18089, %object
	.size	__func__.18089, 34
__func__.18089:
	.string	"VDMHAL_V4R3C1_ArrangeMem_Specific"
	.zero	6
	.type	__func__.18113, %object
	.size	__func__.18113, 23
__func__.18113:
	.string	"VDMHAL_V4R3C1_ResetVdm"
	.zero	1
	.type	__func__.18123, %object
	.size	__func__.18123, 35
__func__.18123:
	.string	"VDMHAL_V4R3C1_SetSmmuPageTableAddr"
	.zero	5
	.type	__func__.18144, %object
	.size	__func__.18144, 24
__func__.18144:
	.string	"VDMHAL_V4R3C1_GlbResetX"
	.type	__func__.18133, %object
	.size	__func__.18133, 23
__func__.18133:
	.string	"VDMHAL_V4R3C1_GlbReset"
	.zero	1
	.type	__func__.18156, %object
	.size	__func__.18156, 28
__func__.18156:
	.string	"VDMHAL_V4R3C1_ClearIntState"
	.zero	4
	.type	__func__.18162, %object
	.size	__func__.18162, 31
__func__.18162:
	.string	"VDMHAL_V4R3C1_ClearMMUIntState"
	.zero	1
	.type	__func__.18168, %object
	.size	__func__.18168, 22
__func__.18168:
	.string	"VDMHAL_V4R3C1_MaskInt"
	.zero	2
	.type	__func__.18181, %object
	.size	__func__.18181, 24
__func__.18181:
	.string	"VDMHAL_V4R3C1_EnableInt"
	.type	__func__.18190, %object
	.size	__func__.18190, 23
__func__.18190:
	.string	"VDMHAL_V4R3C1_CheckReg"
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.18204, %object
	.size	__func__.18204, 26
__func__.18204:
	.string	"VDMHAL_V4R3C1_ReadMMUMask"
	.zero	6
	.type	__func__.18209, %object
	.size	__func__.18209, 27
__func__.18209:
	.string	"VDMHAL_V4R3C1_WriteMMUMask"
	.zero	5
	.type	__func__.18240, %object
	.size	__func__.18240, 25
__func__.18240:
	.string	"VDMHAL_V4R3C1_PrepareDec"
	.zero	7
	.type	__func__.18245, %object
	.size	__func__.18245, 25
__func__.18245:
	.string	"VDMHAL_V4R3C1_IsVdmReady"
	.zero	7
	.type	__func__.18250, %object
	.size	__func__.18250, 23
__func__.18250:
	.string	"VDMHAL_V4R3C1_IsVdmRun"
	.zero	1
	.type	__func__.18256, %object
	.size	__func__.18256, 27
__func__.18256:
	.string	"VDMHAL_V4R3C1_IsVdhDecOver"
	.zero	5
	.type	__func__.18266, %object
	.size	__func__.18266, 31
__func__.18266:
	.string	"VDMHAL_V4R3C1_IsVdhPartDecOver"
	.zero	1
	.type	__func__.18281, %object
	.size	__func__.18281, 33
__func__.18281:
	.string	"VDMHAL_V4R3C1_UpdateHardwareInfo"
	.zero	7
	.type	__func__.18354, %object
	.size	__func__.18354, 23
__func__.18354:
	.string	"VDMHAL_V4R3C1_CfgRpMsg"
	.zero	1
	.type	__func__.18331, %object
	.size	__func__.18331, 24
__func__.18331:
	.string	"VDMHAL_CfgNotFullRepair"
	.type	__func__.18365, %object
	.size	__func__.18365, 23
__func__.18365:
	.string	"VDMHAL_V4R3C1_CfgRpReg"
	.zero	1
	.type	__func__.18378, %object
	.size	__func__.18378, 28
__func__.18378:
	.string	"VDMHAL_V4R3C1_MakeDecReport"
	.zero	4
	.type	__func__.18417, %object
	.size	__func__.18417, 28
__func__.18417:
	.string	"VDMHAL_V4R3C1_PrepareRepair"
	.zero	4
	.type	__func__.18604, %object
	.size	__func__.18604, 15
__func__.18604:
	.string	"MFDE_ConfigReg"
	.zero	1
	.type	__func__.18424, %object
	.size	__func__.18424, 28
__func__.18424:
	.string	"VDMHAL_V4R3C1_StartHwRepair"
	.zero	4
	.type	__func__.18463, %object
	.size	__func__.18463, 28
__func__.18463:
	.string	"VDMHAL_V4R3C1_CalVdhClkSkip"
	.zero	4
	.type	__func__.18486, %object
	.size	__func__.18486, 28
__func__.18486:
	.string	"VDMHAL_V4R3C1_StartHwDecode"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC3:
	ASCII(.string	"pOpenParam = NULL error!" )
	.zero	7
.LC6:
	ASCII(.string	"%s: %s\n" )
.LC8:
	ASCII(.string	"MemBaseAddr = 0 error!" )
	.zero	1
.LC10:
	ASCII(.string	"VDMHAL_V4R3C1_OpenHAL: Size error!" )
	.zero	5
.LC12:
	ASCII(.string	"VdhId is wrong!!!\n" )
	.zero	5
.LC14:
	ASCII(.string	"!!!!!! HAL memory not enouph! need %d, have %d\n" )
.LC16:
	ASCII(.string	"image size out of range" )
.LC23:
	ASCII(.string	"VDMHAL ArrangeMem HEVC 10 bit\n" )
	.zero	1
.LC26:
	ASCII(.string	"%s pstVfmwFrameSizeInfo = NULL\n" )
.LC30:
	ASCII(.string	"DelAllFrameMemRecord err in VDMHAL_V4R3C1_ArrangeMem!\n" )
	.zero	1
.LC32:
	ASCII(.string	"Report arrange frame buffer: wxh %dx%d, FsNum %d, PmvNum %d\n" )
	.zero	3
.LC37:
	ASCII(.string	"Report arrange frame buffer only: wxh %dx%d, FsNum %d, PmvNum %d\n" )
	.zero	6
.LC40:
	ASCII(.string	"VidStd Invalid" )
	.zero	1
.LC45:
	ASCII(.string	"Set CompressEn %d, LossCompressEn %d, YCompRatio %d, UVCompRatio %d\n" )
	.zero	3
.LC47:
	ASCII(.string	"VDMHAL_V4R3C1_CalcFsSize err!\n" )
	.zero	1
.LC49:
	ASCII(.string	"%s, need arrange, Size: %#x, Num: %#x, RefChanged: %#x\n" )
.LC51:
	ASCII(.string	"DFS, report event. Size: 0x%x, Num: %d, RefChanged: %d\n" )
.LC54:
	ASCII(.string	"pVdmMemArrange is NULL" )
	.zero	1
.LC56:
	ASCII(.string	"DFS, no ref frame!\n" )
	.zero	4
.LC58:
	ASCII(.string	"DFS, Frame number = %d > 30, Then, Frame num = 30, \n" )
	.zero	3
.LC60:
	ASCII(.string	"VDMHAL_V4R3C1_ArrangeMem Mem addr is NULL" )
	.zero	6
.LC65:
	ASCII(.string	"'pVdmMemArrange' is NULL" )
	.zero	7
.LC69:
	ASCII(.string	"MemSize not enough for pmv slot" )
.LC72:
	ASCII(.string	"VDMHAL_V200R003_ArrangeMem get ChanWidth/ChanHeight failed!\n" )
	.zero	3
.LC74:
	ASCII(.string	"ImgSlotLen > ChanSlotLen" )
	.zero	7
.LC77:
	ASCII(.string	"cann't allocate img slot" )
	.zero	7
.LC80:
	ASCII(.string	"Chan: %d call VCTRL_GetVidStd failed\n" )
	.zero	2
.LC84:
	ASCII(.string	"%s: VdhId(%d) > %d\n" )
	.zero	4
.LC86:
	ASCII(.string	"VDMHAL_V4R3C1_ResetVdm: map vdm register fail, vir(reg) = (%p)\n" )
.LC91:
	ASCII(.string	"%s module id %d failed!\n" )
	.zero	7
.LC93:
	ASCII(.string	"%s module id %d success!\n" )
	.zero	6
.LC98:
	ASCII(.string	"%s: WR_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\n" )
	.zero	3
.LC103:
	ASCII(.string	"%s: map vdm register 0x%x failed!\n" )
	.zero	5
.LC107:
	ASCII(.string	"%s VdhId %d failed!\n" )
	.zero	3
.LC109:
	ASCII(.string	"%s VdhId %d success!\n" )
	.zero	2
.LC118:
	ASCII(.string	"vdm register virtual address not mapped, reset failed!\n" )
.LC135:
	ASCII(.string	"%s: VdhId(%d) Invalid!\n" )
.LC138:
	ASCII(.string	"%s: vdm register virtual address not mapped, reset failed!\n" )
	.zero	4
.LC140:
	ASCII(.string	"%s: unkown reg_id = %d\n" )
.LC145:
	ASCII(.string	"%s: RD_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\n" )
	.zero	3
.LC151:
	ASCII(.string	"%s: pDecParam(%p) = NULL\n" )
	.zero	6
.LC153:
	ASCII(.string	"%s: VdhId(%d)overgrown its limits\n" )
	.zero	5
.LC157:
	ASCII(.string	"VDM register not mapped yet!" )
	.zero	3
.LC163:
	ASCII(.string	"VDM register not mapped yet!\n" )
	.zero	2
.LC185:
	ASCII(.string	"can NOT map vir addr for up-msg" )
.LC188:
	ASCII(.string	"ReadUpMsgSlot error! pDst=%p, pSrc=%p\n" )
	.zero	1
.LC190:
	ASCII(.string	"ReadUpMsgSlot error! upmsg_size(%d) > 512\n" )
	.zero	5
.LC193:
	ASCII(.string	"WriteMsgSlot error!\n" )
	.zero	3
.LC196:
	ASCII(.string	"VDMHAL_V4R3C1_CfgRpMsg error! pRepairParam=%p, pHwMem=%p\n" )
	.zero	6
.LC198:
	ASCII(.string	"can not map repair msg virtual address!" )
.LC202:
	ASCII(.string	"ValidGroupNum=%d out of range!\n" )
.LC204:
	ASCII(.string	"align_mb error\n" )
.LC206:
	ASCII(.string	"[%s][%d]sclie_num is wrong! %d \n" )
	.zero	7
.LC208:
	ASCII(.string	"VDMHAL_V4R3C1_CfgRpReg error! pDecParam=%p, pHwMem=%p\n" )
	.zero	1
.LC217:
	ASCII(.string	"'pMakeDecReport' is NULL" )
	.zero	7
.LC221:
	ASCII(.string	"'pDecReport' is NULL" )
	.zero	3
.LC231:
	ASCII(.string	"pDecReport->DecSliceNum(%d) > %d, set to 0 for full repair.\n" )
	.zero	3
.LC235:
	ASCII(.string	"\n***** UpMsg DecSliceNum=%d\n" )
	.zero	3
.LC237:
	ASCII(.string	"\n***** Up Msg (phy addr: %#8x) *****\n" )
	.zero	2
.LC239:
	ASCII(.string	"\n0x%02x 0x%08x 0x%08x 0x%08x 0x%08x\n" )
	.zero	3
.LC241:
	ASCII(.string	"\n***** Up Msg print finished *****\n" )
	.zero	4
.LC244:
	ASCII(.string	"VDMHAL_V4R3C1_PrepareRepair error! pDecParam=%p\n" )
	.zero	7
.LC248:
	ASCII(.string	"vdm register virtual address not mapped, VDMHAL_V200R003_PrepareRepair failed!\n" )
.LC251:
	ASCII(.string	"FIRST_REPAIR Parameter Error!\n" )
	.zero	1
.LC253:
	ASCII(.string	"SECOND_REPAIR Parameter Error!\n" )
.LC259:
	ASCII(.string	"%s: pMfdeTask(%p) = NULL\n" )
	.zero	6
.LC268:
	ASCII(.string	"%s The channel %d is not active\n" )
	.zero	7
.LC288:
	ASCII(.string	"BigTile1d_y" )
	.zero	4
.LC290:
	ASCII(.string	"failed mem_allocMemBlock BigTile_yuv save!\n" )
	.zero	4
.LC292:
	ASCII(.string	"BigTile1d_uv" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
