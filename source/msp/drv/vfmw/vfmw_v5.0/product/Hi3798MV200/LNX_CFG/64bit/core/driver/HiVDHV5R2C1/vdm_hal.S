#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	VDMHAL_UpateDecParam.constprop.10, %function
VDMHAL_UpateDecParam.constprop.10:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 17
	bhi	.L1
	ldr	x0, .LC0
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx4
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx4:
	.section	.rodata
	.align	0
	.align	2
.L4:
	.byte	(.L14 - .Lrtx4) / 4
	.byte	(.L5 - .Lrtx4) / 4
	.byte	(.L6 - .Lrtx4) / 4
	.byte	(.L7 - .Lrtx4) / 4
	.byte	(.L1 - .Lrtx4) / 4
	.byte	(.L8 - .Lrtx4) / 4
	.byte	(.L9 - .Lrtx4) / 4
	.byte	(.L1 - .Lrtx4) / 4
	.byte	(.L10 - .Lrtx4) / 4
	.byte	(.L11 - .Lrtx4) / 4
	.byte	(.L12 - .Lrtx4) / 4
	.byte	(.L12 - .Lrtx4) / 4
	.byte	(.L12 - .Lrtx4) / 4
	.byte	(.L13 - .Lrtx4) / 4
	.byte	(.L1 - .Lrtx4) / 4
	.byte	(.L14 - .Lrtx4) / 4
	.byte	(.L15 - .Lrtx4) / 4
	.byte	(.L16 - .Lrtx4) / 4
	.text
	.p2align 3
.L14:
	mov	w0, 1
	strb	wzr, [x19, 4]
	strb	w0, [x19, 17]
.L1:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L15:
	mov	w0, 1
	strb	wzr, [x19]
	strb	w0, [x19, 5]
	b	.L1
	.p2align 3
.L16:
	add	x19, x19, 270336
	mov	w0, 1
	str	wzr, [x19, 2468]
	strb	w0, [x19, 2081]
	b	.L1
	.p2align 3
.L5:
	mov	w0, 1
	str	wzr, [x19, 14600]
	strb	w0, [x19, 75]
	b	.L1
	.p2align 3
.L6:
	mov	w0, 1
	str	wzr, [x19, 14672]
	strb	w0, [x19, 167]
	b	.L1
	.p2align 3
.L7:
	add	x1, x19, 45056
	mov	w0, 1
	str	wzr, [x1, 240]
	strb	w0, [x19, 144]
	b	.L1
	.p2align 3
.L8:
	mov	w0, 1
	str	wzr, [x19, 160]
	strb	w0, [x19]
	b	.L1
	.p2align 3
.L9:
	mov	w0, 1
	str	wzr, [x19, 14904]
	strb	w0, [x19, 48]
	b	.L1
	.p2align 3
.L10:
	mov	w0, 1
	str	wzr, [x19, 76]
	strb	w0, [x19]
	b	.L1
	.p2align 3
.L11:
	mov	w0, 1
	str	wzr, [x19, 72]
	strb	w0, [x19, 1]
	b	.L1
	.p2align 3
.L12:
	mov	w0, 1
	str	wzr, [x19, 264]
	strb	w0, [x19, 104]
	b	.L1
	.p2align 3
.L13:
	mov	w0, 1
	str	wzr, [x19, 3144]
	strb	w0, [x19, 2778]
	b	.L1
	.size	VDMHAL_UpateDecParam.constprop.10, .-VDMHAL_UpateDecParam.constprop.10
	.align	3
.LC0:
	.xword	.L4
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_GetHalMemSize
	.type	VDMHAL_V5R2C1_GetHalMemSize, %function
VDMHAL_V5R2C1_GetHalMemSize:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 24576
	movk	w0, 0x9, lsl 16
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V5R2C1_GetHalMemSize, .-VDMHAL_V5R2C1_GetHalMemSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_OpenHAL
	.type	VDMHAL_V5R2C1_OpenHAL, %function
VDMHAL_V5R2C1_OpenHAL:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L31
	ldp	w7, w3, [x19]
	ldr	w0, [x19, 8]
	cbz	w7, .L32
	mov	w1, 24575
	movk	w1, 0x9, lsl 16
	cmp	w3, w1
	ble	.L33
	cmp	w0, wzr
	bgt	.L34
	sxtw	x4, w0
	ldr	x19, .LC1
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
.L25:
	str	w1, [x0], 4
	add	w1, w1, 1280
	cmp	x0, x2
	bne	.L25
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
	bcc	.L26
	mov	x0, x19
	bl	H264HAL_V5R2C1_InitHal
	cmp	w0, wzr
	mov	x0, x19
	csetm	w19, ne
	bl	HEVCHAL_V5R2C1_InitHal
	cmp	w0, wzr
	csinv	w19, w19, wzr, eq
.L21:
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L34:
	ldr	x1, .LC14
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	b	.L21
.L26:
	ldr	x1, .LC16
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	b	.L21
.L32:
	ldr	x3, .LC10
.L30:
	ldr	x2, .LC6
	mov	w0, 0
	ldr	x1, .LC8
	mov	w19, -1
	bl	dprint_vfmw
	b	.L21
.L33:
	ldr	x3, .LC12
	b	.L30
.L31:
	ldr	x3, .LC5
	b	.L30
	.size	VDMHAL_V5R2C1_OpenHAL, .-VDMHAL_V5R2C1_OpenHAL
	.align	3
.LC1:
	.xword	g_HwMem
	.align	3
.LC5:
	.xword	.LC4
	.align	3
.LC6:
	.xword	.LANCHOR0
	.align	3
.LC8:
	.xword	.LC7
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
.LC16:
	.xword	.LC15
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_CloseHAL
	.type	VDMHAL_V5R2C1_CloseHAL, %function
VDMHAL_V5R2C1_CloseHAL:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V5R2C1_CloseHAL, .-VDMHAL_V5R2C1_CloseHAL
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_CalcFsSize
	.type	VDMHAL_V5R2C1_CalcFsSize, %function
VDMHAL_V5R2C1_CalcFsSize:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w25, w0
	mov	x0, x30
	mov	w26, w1
	mov	w20, w2
	mov	w23, w3
	mov	w24, w4
	mov	x22, x5
	bl	_mcount
	sub	w1, w26, #32
	mov	w0, 8160
	cmp	w1, w0
	bhi	.L37
	sub	w1, w20, #32
	mov	w6, w20
	cmp	w1, w0
	bhi	.L37
	ldr	x1, .LC21
	add	w0, w26, 15
	asr	w0, w0, 4
	add	w3, w20, 15
	asr	w3, w3, 4
	cmp	w0, 45
	ldrb	w2, [x1]
	mov	w1, 36
	ccmp	w3, w1, 0, le
	mov	w19, 32
	cset	w4, le
	mov	w1, 64
	cmp	w4, wzr
	lsl	w21, w0, 4
	csel	w19, w19, w1, eq
	cmp	w2, 1
	csel	w19, w19, w1, ne
	cmp	w24, 16
	beq	.L42
	cmp	w24, 17
	beq	.L69
	mul	w19, w0, w19
	ldr	x27, .LC23
	add	w21, w21, 255
	add	w6, w20, 31
	and	w21, w21, -256
	mul	w19, w19, w3
	ldr	x0, [x27, w25, sxtw 3]
	and	w6, w6, -32
	add	w19, w19, 143
	mov	w28, 0
	and	w19, w19, -128
	mov	w5, 0
.L45:
	ldr	w1, [x0, 1320]
	cmp	w1, 1
	beq	.L70
.L67:
	asr	w4, w19, 1
	mov	w8, 0
	mov	w7, 0
	mov	w26, 0
.L48:
	cmp	w23, 1
	mul	w23, w6, w21
	beq	.L71
	mul	w1, w28, w5
	lsl	w20, w26, 2
	lsl	w2, w1, 2
	sub	w20, w20, w26
	sub	w2, w2, w1
	lsl	w1, w23, 2
	sub	w1, w1, w23
	lsr	w1, w1, 1
	add	w1, w1, w2, lsr 1
	add	w20, w1, w20, lsr 1
.L51:
	add	x1, x0, 503808
	ldr	w1, [x1, 1968]
	cbz	w1, .L72
	add	x2, x0, 507904
	cmp	w24, 17
	lsl	w21, w21, 4
	stp	w7, w8, [x2, 220]
	str	w4, [x2, 260]
	str	w20, [x2, 1440]
	beq	.L53
.L73:
	add	x1, x0, 503808
	mov	w3, 32
	sub	w24, w24, #16
	ldr	w1, [x1, 1976]
	str	w21, [x2, 212]
	lsr	w21, w21, 1
	cmp	w1, 32
	str	w21, [x2, 216]
	csel	w1, w1, w3, le
	cmp	w24, 1
	str	w1, [x2, 264]
	add	w1, w26, w23
	str	w1, [x2, 244]
	bls	.L54
.L55:
	ldr	x0, [x27, w25, sxtw 3]
	mov	w4, 4096
	add	w1, w20, 1056
	add	x3, x0, 507904
	add	w2, w1, w19
	add	w5, w2, w4
	str	w19, [x3, 1444]
	str	w4, [x3, 1452]
	ldrsb	w0, [x0, 44]
	cmp	w0, 1
	csel	w2, w5, w2, eq
	cbz	x22, .L63
	str	w1, [x22, 4]
	mov	w0, 0
	ldr	x3, [x27, w25, sxtw 3]
	add	x3, x3, 503808
	ldr	w3, [x3, 1976]
	stp	w3, w19, [x22, 8]
	ldr	x3, [x27, w25, sxtw 3]
	add	x3, x3, 507904
	ldr	w3, [x3, 264]
	stp	w3, w4, [x22, 16]
	str	w2, [x22]
	ldr	x2, [x27, w25, sxtw 3]
	add	x2, x2, 507904
	str	w1, [x2, 1448]
.L65:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L72:
	ldr	x1, .LC22
	add	x0, x0, 507904
	mov	x2, 1248
	add	x0, x0, 208
	stp	w5, w8, [x29, 96]
	ldr	x3, [x1, 96]
	mov	w1, 0
	stp	w4, w7, [x29, 104]
	lsl	w21, w21, 4
	blr	x3
	ldr	x0, [x27, w25, sxtw 3]
	cmp	w24, 17
	ldp	w4, w7, [x29, 104]
	add	x2, x0, 507904
	ldp	w5, w8, [x29, 96]
	stp	w7, w8, [x2, 220]
	str	w4, [x2, 260]
	str	w20, [x2, 1440]
	bne	.L73
.L53:
	mov	w1, 1
	str	w21, [x2, 212]
	str	w1, [x2, 264]
	lsr	w21, w21, 1
	add	w1, w26, w23
	str	w21, [x2, 216]
	str	w1, [x2, 244]
.L54:
	ldr	w0, [x0, 1684]
	cmp	w0, 8
	ble	.L55
	lsl	w6, w23, 2
	ldr	x1, .LC25
	sub	w6, w6, w23
	lsl	w23, w26, 2
	sub	w26, w23, w26
	mov	w0, 31
	mul	w28, w28, w5
	lsr	w23, w26, 1
	lsl	w5, w5, 4
	add	w6, w23, w6, lsr 1
	str	w5, [x2, 228]
	stp	w6, w28, [x2, 236]
	bl	dprint_vfmw
	b	.L55
	.p2align 3
.L71:
	lsl	w1, w3, 6
	sub	w1, w1, w3, lsl 4
	mul	w20, w1, w21
	b	.L51
	.p2align 3
.L42:
	ldr	x27, .LC23
	mul	w19, w3, w21
	add	w21, w26, 255
	ldr	x0, [x27, w25, sxtw 3]
	add	w19, w19, 143
	and	w21, w21, -256
	and	w19, w19, -128
	ldr	w1, [x0, 1684]
	cmp	w1, 8
	ble	.L74
	ldr	w1, [x0, 1320]
	add	w28, w20, 31
	and	w28, w28, -32
	lsr	w5, w21, 2
	cmp	w1, 1
	bne	.L67
	.p2align 2
.L70:
	cmp	w20, 2159
	mov	w1, 3839
	ccmp	w24, 17, 4, le
	ccmp	w26, w1, 0, ne
	ble	.L67
	add	w2, w20, 63
	asr	w4, w19, 1
.L60:
	adds	w7, w26, 2047
	add	w26, w26, 4094
	csel	w26, w26, w7, mi
	and	w26, w26, -2048
	cmp	w26, wzr
	add	w7, w26, 127
	csel	w7, w7, w26, lt
	add	w26, w2, 63
	cmp	w2, wzr
	asr	w7, w7, 7
	csel	w2, w26, w2, lt
	lsl	w26, w7, 5
	asr	w2, w2, 6
	mul	w26, w2, w26
	mov	w8, w26
	b	.L48
	.p2align 3
.L69:
	ldr	x27, .LC23
	add	w21, w26, 255
	add	w2, w20, 63
	and	w21, w21, -256
	and	w6, w2, -64
	ldr	x0, [x27, w25, sxtw 3]
	ldr	w1, [x0, 1684]
	cmp	w1, 8
	bgt	.L58
	mov	w28, 0
	mov	w5, 0
.L46:
	ldr	w1, [x0, 1320]
	mov	w4, 64
	movk	w4, 0x12, lsl 16
	cmp	w1, 1
	beq	.L64
	mov	w19, 128
	mov	w8, 0
	mov	w7, 0
	movk	w19, 0x24, lsl 16
	mov	w26, 0
	b	.L48
	.p2align 3
.L74:
	mov	w28, 0
	mov	w5, 0
	b	.L45
	.p2align 3
.L63:
	mov	w0, 0
	b	.L65
	.p2align 3
.L58:
	add	w28, w6, 63
	lsr	w5, w21, 2
	and	w28, w28, -64
	b	.L46
	.p2align 3
.L37:
	ldr	x2, .LC19
	mov	w0, 0
	ldr	x3, .LC18
	ldr	x1, .LC20
	add	x2, x2, 24
	bl	dprint_vfmw
	mov	w0, -1
	b	.L65
	.p2align 3
.L64:
	mov	w19, 128
	movk	w19, 0x24, lsl 16
	b	.L60
	.size	VDMHAL_V5R2C1_CalcFsSize, .-VDMHAL_V5R2C1_CalcFsSize
	.align	3
.LC18:
	.xword	.LC17
	.align	3
.LC19:
	.xword	.LANCHOR0
	.align	3
.LC20:
	.xword	.LC7
	.align	3
.LC21:
	.xword	g_not_direct_8x8_inference_flag
	.align	3
.LC22:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC23:
	.xword	s_pstVfmwChan
	.align	3
.LC25:
	.xword	.LC24
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_GetRpuSize
	.type	VDMHAL_V5R2C1_GetRpuSize, %function
VDMHAL_V5R2C1_GetRpuSize:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 4096
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V5R2C1_GetRpuSize, .-VDMHAL_V5R2C1_GetRpuSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_CalcFsNum
	.type	VDMHAL_V5R2C1_CalcFsNum, %function
VDMHAL_V5R2C1_CalcFsNum:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x19, x3
	mov	x0, x30
	mov	w21, w1
	bl	_mcount
	cbz	x19, .L81
	cmp	w21, 17
	ldr	x2, .LC29
	beq	.L82
	ldr	x1, [x2, w20, sxtw 3]
	mov	w5, 32
	add	x4, x1, 503808
	add	x3, x1, 507904
	ldr	w0, [x4, 1976]
	cmp	w0, w5
	csel	w0, w0, w5, le
	str	w0, [x3, 264]
	ldr	w0, [x1, 704]
	cmp	w0, 2
	beq	.L83
.L80:
	ldr	x1, [x2, w20, sxtw 3]
	mov	w0, 0
	add	x1, x1, 503808
	ldr	w1, [x1, 1976]
	str	w1, [x19, 8]
	ldr	x1, [x2, w20, sxtw 3]
	add	x1, x1, 507904
	ldr	w1, [x1, 264]
	str	w1, [x19, 16]
.L78:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L82:
	ldr	x0, [x2, w20, sxtw 3]
	mov	w1, 1
	add	x0, x0, 507904
	str	w1, [x0, 264]
	b	.L80
	.p2align 3
.L83:
	ldr	w0, [x4, 1980]
	str	w0, [x3, 264]
	b	.L80
.L81:
	ldr	x2, .LC26
	mov	w0, 1
	ldr	x1, .LC28
	add	x2, x2, 56
	bl	dprint_vfmw
	mov	w0, -1
	b	.L78
	.size	VDMHAL_V5R2C1_CalcFsNum, .-VDMHAL_V5R2C1_CalcFsNum
	.align	3
.LC26:
	.xword	.LANCHOR0
	.align	3
.LC28:
	.xword	.LC27
	.align	3
.LC29:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_DynamicAllocFrame
	.type	VDMHAL_V5R2C1_DynamicAllocFrame, %function
VDMHAL_V5R2C1_DynamicAllocFrame:
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
	ldr	x23, .LC30
	mov	w0, w19
	ldr	x1, [x23, w19, sxtw 3]
	add	x1, x1, 503808
	add	x1, x1, 2000
	bl	DelAllFrameMemRecord
	cbnz	w0, .L104
.L85:
	ldr	x1, [x23, w19, sxtw 3]
	mov	w2, 255
	add	x0, x1, 503808
	add	x1, x1, 507904
	add	x0, x0, 2000
	add	x1, x1, 208
	.p2align 2
.L86:
	str	w2, [x0], 72
	cmp	x1, x0
	bne	.L86
	mov	w0, 1088
	cmp	w22, 1920
	ccmp	w21, w0, 0, le
	ble	.L87
	ldr	x0, [x23, w19, sxtw 3]
	ldr	w1, [x20, 8]
.L88:
	add	x2, x0, 503808
	ldr	w3, [x0, 1624]
	mov	w0, w19
	add	w1, w3, w1
	str	w1, [x2, 1980]
	bl	VCTRL_GetVidStd
	ldr	x1, [x23, w19, sxtw 3]
	ldr	w2, [x1, 704]
	cmp	w2, 2
	ccmp	w0, 17, 4, eq
	beq	.L91
	add	x1, x1, 503808
	ldr	w0, [x1, 1980]
	str	w0, [x20, 16]
	ldr	x1, [x23, w19, sxtw 3]
.L91:
	add	x0, x1, 507904
	add	x1, x1, 475136
	mov	w4, 1
	mov	w3, w21
	mov	w2, w22
	str	wzr, [x0, 1480]
	str	w4, [x1, 2360]
	str	w4, [x0, 2020]
	mov	w0, 31
	ldr	x1, .LC34
	ldr	w4, [x20, 8]
	ldr	w5, [x20, 16]
	bl	dprint_vfmw
	ldr	x0, .LC35
	ldr	x4, [x0]
	cbz	x4, .L92
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
.L92:
	ldr	x3, .LC36
	mov	x2, 528
	ldr	x0, [x23, w19, sxtw 3]
	mov	w1, 0
	ldr	x3, [x3, 96]
	add	x0, x0, 507904
	add	x0, x0, 1488
	blr	x3
	ldr	x1, [x23, w19, sxtw 3]
	mov	w0, w19
	add	x1, x1, 507904
	str	wzr, [x1, 2016]
	bl	FSP_ClearContextAll
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L87:
	ldr	x0, [x23, w19, sxtw 3]
	ldr	w1, [x0, 36]
	cmp	w1, 24
	beq	.L103
	add	x1, x0, 507904
	ldr	w1, [x1, 2076]
	cbnz	w1, .L103
	ldr	w1, [x20, 8]
	add	w1, w1, 4
	str	w1, [x20, 8]
	ldr	x0, [x23, w19, sxtw 3]
	b	.L88
.L103:
	ldr	w1, [x20, 8]
	b	.L88
.L104:
	ldr	x1, .LC32
	mov	w0, 0
	bl	dprint_vfmw
	b	.L85
	.size	VDMHAL_V5R2C1_DynamicAllocFrame, .-VDMHAL_V5R2C1_DynamicAllocFrame
	.align	3
.LC30:
	.xword	s_pstVfmwChan
	.align	3
.LC32:
	.xword	.LC31
	.align	3
.LC34:
	.xword	.LC33
	.align	3
.LC35:
	.xword	g_event_report
	.align	3
.LC36:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_DynamicAllocFrame_Only
	.type	VDMHAL_V5R2C1_DynamicAllocFrame_Only, %function
VDMHAL_V5R2C1_DynamicAllocFrame_Only:
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
	ldr	x4, .LC37
	mov	w3, w21
	ldr	w5, [x19, 8]
	mov	w2, w22
	ldr	x1, .LC39
	mov	w0, 31
	ldr	x4, [x4, w20, sxtw 3]
	add	x4, x4, 503808
	str	w5, [x4, 1980]
	ldr	w4, [x19, 8]
	ldr	w5, [x19, 16]
	bl	dprint_vfmw
	ldr	x0, .LC40
	ldr	x4, [x0]
	cbz	x4, .L105
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
.L105:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.size	VDMHAL_V5R2C1_DynamicAllocFrame_Only, .-VDMHAL_V5R2C1_DynamicAllocFrame_Only
	.align	3
.LC37:
	.xword	s_pstVfmwChan
	.align	3
.LC39:
	.xword	.LC38
	.align	3
.LC40:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_ArrangeMem_Normal
	.type	VDMHAL_V5R2C1_ArrangeMem_Normal, %function
VDMHAL_V5R2C1_ArrangeMem_Normal:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	w23, w2
	mov	w24, w3
	mov	w25, w4
	mov	w27, w5
	mov	x22, x6
	bl	_mcount
	str	xzr, [x29, 120]
	add	x0, x29, 104
	cmp	w20, 21
	stp	xzr, xzr, [x0]
	bhi	.L146
	ldr	x21, .LC45
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 503808
	ldr	w26, [x1, 1972]
	ldr	w1, [x0, 100]
	cmp	w1, 2
	beq	.L147
	and	w1, w20, -17
	cmp	w1, wzr
	ccmp	w20, 18, 4, ne
	beq	.L148
.L115:
	cmp	w20, 17
	cset	w2, eq
	mov	w1, w2
.L116:
	ldr	x4, .LC46
	sbfiz	x3, x19, 4, 32
	ldr	w5, [x0, 1332]
	str	w2, [x0, 1320]
	str	w1, [x4, x3]
	ldr	w3, [x0, 1324]
	ldr	w4, [x0, 1328]
	mov	w0, 1
	ldr	x1, .LC48
	bl	dprint_vfmw
.L114:
	mov	w2, w25
	add	x3, x29, 104
	mov	w1, w20
	mov	w0, w19
	bl	VDMHAL_V5R2C1_CalcFsNum
	mov	w25, w0
	add	x5, x29, 104
	mov	w4, w20
	mov	w3, w27
	mov	w2, w24
	mov	w1, w23
	mov	w0, w19
	bl	VDMHAL_V5R2C1_CalcFsSize
	orr	w0, w25, w0
	cbnz	w0, .L149
	ldr	x27, [x21, w19, sxtw 3]
	ldr	w20, [x29, 104]
	add	x0, x27, 503808
	cmp	w26, w20
	ldr	w25, [x0, 1976]
	ldr	w5, [x0, 1992]
	beq	.L150
.L119:
	ldr	x2, .LC43
	mov	w3, w20
	ldr	x1, .LC52
	mov	w4, w25
	add	x2, x2, 112
	mov	w0, 31
	bl	dprint_vfmw
	ldr	x0, [x21, w19, sxtw 3]
	add	x3, x29, 104
	mov	w2, w24
	add	x0, x0, 503808
	ldr	w1, [x0, 1968]
	str	w20, [x0, 1972]
	cbz	w1, .L151
	mov	w1, w23
	mov	w0, w19
	bl	VDMHAL_V5R2C1_DynamicAllocFrame_Only
.L122:
	ldr	x4, [x21, w19, sxtw 3]
	mov	w3, w25
	ldr	x1, .LC54
	mov	w2, w20
	add	x4, x4, 503808
	mov	w0, 31
	ldr	w4, [x4, 1992]
	bl	dprint_vfmw
	ldr	x19, [x21, w19, sxtw 3]
	ldr	x0, .LC55
	add	x19, x19, 507904
	ldr	x0, [x0]
	blr	x0
	str	w0, [x19, 1456]
	mov	w1, 2
.L112:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	mov	w0, w1
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L151:
	mov	w1, w23
	mov	w0, w19
	bl	VDMHAL_V5R2C1_DynamicAllocFrame
	b	.L122
	.p2align 3
.L148:
	cmp	w23, 3839
	mov	w1, 2159
	ccmp	w24, w1, 0, le
	ble	.L115
	mov	w1, 1
	mov	w2, w1
	b	.L116
	.p2align 3
.L150:
	cmp	w5, 1
	beq	.L119
	ldr	w0, [x0, 1968]
	cmp	w0, 1
	beq	.L119
	cbz	x22, .L152
	add	x26, x27, 507904
	mov	x0, x27
	add	x20, x26, 208
	ldr	w23, [x26, 1440]
	cbz	w25, .L153
.L124:
	add	x0, x0, 503808
	ldr	w2, [x0, 1980]
	cmp	w2, 30
	bgt	.L154
.L125:
	ldr	x24, .LC55
	add	x25, x26, 208
	mov	w0, 8
	str	w2, [x25, 48]
	ldr	x1, [x24, 24]
	blr	x1
	ldr	x7, [x21, w19, sxtw 3]
	add	x9, x7, 507904
	ldr	w0, [x9, 1480]
	cbz	w0, .L130
	ldp	w10, w6, [x25, 56]
	mov	x4, x25
	mov	w5, 0
	mov	w8, 1
	.p2align 2
.L129:
	uxtw	x0, w5
	add	w5, w5, 1
	lsl	x1, x0, 6
	add	x1, x1, x0, lsl 3
	add	x1, x7, x1
	add	x11, x1, 503808
	uxtw	x1, w6
	lsl	x2, x1, 2
	add	x3, x1, 20
	sub	x2, x2, x1
	add	w6, w6, 1
	ldr	w1, [x11, 2032]
	add	x2, x4, x2, lsl 2
	ldr	w12, [x11, 2012]
	add	w1, w1, 1023
	and	w1, w1, -1024
	strb	w8, [x2, 472]
	str	w1, [x2, 464]
	add	w1, w23, w1
	str	w12, [x2, 468]
	str	w1, [x4, x3, lsl 2]
	str	w6, [x4, 60]
	ldr	w1, [x11, 2004]
	cmp	w1, 255
	beq	.L127
	ldr	w1, [x4, 68]
	ldr	w12, [x11, 2048]
	add	w3, w1, 1
	uxtw	x2, w1
	lsl	x1, x2, 2
	sub	x1, x1, x2
	add	x1, x4, x1, lsl 2
	str	w12, [x1, 848]
	ldr	w0, [x11, 2016]
	str	w0, [x1, 852]
	str	w3, [x4, 68]
.L127:
	ldr	w0, [x4, 64]
	cmp	w0, w10
	bcs	.L128
	ldr	w2, [x11, 2008]
	add	x1, x27, x0, uxtw 3
	add	x1, x1, 507904
	add	w0, w0, 1
	cmp	w2, 255
	beq	.L128
	ldr	w2, [x11, 2064]
	str	w2, [x1, 416]
	strb	w8, [x1, 420]
	str	w0, [x4, 64]
.L128:
	ldr	w0, [x9, 1480]
	cmp	w5, w0
	bcc	.L129
.L130:
	ldr	x3, [x24, 104]
	mov	x2, 1232
	mov	x1, x20
	mov	x0, x22
	blr	x3
	ldr	x1, [x21, w19, sxtw 3]
	mov	w3, 1
	ldr	x2, [x24, 32]
	mov	w0, 8
	add	x1, x1, 507904
	str	w3, [x1, 1484]
	blr	x2
	mov	w1, 0
	b	.L112
	.p2align 3
.L147:
	add	x2, x0, 1280
	mov	w1, -1
	stp	wzr, wzr, [x2, 40]
	stp	w1, w1, [x2, 48]
	b	.L114
	.p2align 3
.L154:
	ldr	x1, .LC61
	mov	w0, 31
	bl	dprint_vfmw
	ldr	x0, [x21, w19, sxtw 3]
	mov	w1, 30
	mov	w2, w1
	add	x0, x0, 503808
	str	w1, [x0, 1980]
	b	.L125
	.p2align 3
.L153:
	ldr	x1, .LC59
	mov	w0, 31
	bl	dprint_vfmw
	ldr	x0, [x21, w19, sxtw 3]
	b	.L124
	.p2align 3
.L146:
	ldr	x2, .LC43
	mov	w0, 0
	ldr	x1, .LC44
	ldr	x3, .LC42
	add	x2, x2, 80
	bl	dprint_vfmw
	mov	w1, -1
	b	.L112
	.p2align 3
.L149:
	ldr	x1, .LC50
	mov	w0, 31
	bl	dprint_vfmw
	mov	w1, -1
	b	.L112
.L152:
	ldr	x2, .LC43
	mov	w0, 0
	ldr	x1, .LC44
	ldr	x3, .LC57
	add	x2, x2, 144
	bl	dprint_vfmw
	mov	w1, -1
	b	.L112
	.size	VDMHAL_V5R2C1_ArrangeMem_Normal, .-VDMHAL_V5R2C1_ArrangeMem_Normal
	.align	3
.LC42:
	.xword	.LC41
	.align	3
.LC43:
	.xword	.LANCHOR0
	.align	3
.LC44:
	.xword	.LC7
	.align	3
.LC45:
	.xword	s_pstVfmwChan
	.align	3
.LC46:
	.xword	g_VfmwCompressPara
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
.LC54:
	.xword	.LC53
	.align	3
.LC55:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC57:
	.xword	.LC56
	.align	3
.LC59:
	.xword	.LC58
	.align	3
.LC61:
	.xword	.LC60
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_ArrangeMem_Specific
	.type	VDMHAL_V5R2C1_ArrangeMem_Specific, %function
VDMHAL_V5R2C1_ArrangeMem_Specific:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w23, w0
	mov	w22, w2
	mov	x0, x30
	mov	w25, w1
	mov	w28, w3
	mov	w21, w4
	mov	w24, w5
	mov	w20, w6
	mov	w27, w7
	ldr	x19, [x29, 160]
	bl	_mcount
	cbz	w22, .L246
	sub	w1, w21, #32
	mov	w0, 8160
	cmp	w1, w0
	bhi	.L158
	sub	w1, w24, #32
	cmp	w1, w0
	bhi	.L158
	cbz	x19, .L247
	ldr	x0, .LC69
	cmp	w20, 20
	mov	x2, 1232
	mov	w1, 0
	mov	w6, 20
	ldr	x3, [x0, 96]
	mov	x0, x19
	csel	w26, w20, w6, le
	mov	w20, 32
	blr	x3
	ldr	x1, .LC70
	add	w0, w21, 15
	asr	w0, w0, 4
	add	w3, w24, 15
	cmp	w0, 45
	asr	w3, w3, 4
	ldrb	w2, [x1]
	mov	w1, 36
	ccmp	w3, w1, 0, le
	mov	w1, 64
	cset	w4, le
	cmp	w4, wzr
	csel	w20, w20, w1, eq
	cmp	w2, 1
	csel	w20, w20, w1, ne
	cmp	w25, 16
	lsl	w2, w0, 4
	beq	.L248
	cmp	w25, 17
	beq	.L166
	mul	w20, w0, w20
	mul	w20, w20, w3
	add	w20, w20, 143
	and	w20, w20, -128
	mul	w1, w26, w20
	cmp	w28, w1
	ble	.L164
	add	w2, w2, 255
	sub	w1, w28, w1
	and	w28, w2, -256
	add	w7, w22, 1023
	lsl	w0, w28, 4
	str	w0, [x19, 4]
	asr	w0, w0, 1
	and	w7, w7, -1024
	str	w0, [x19, 8]
	asr	w0, w20, 1
	str	w26, [x19, 56]
	sub	w6, w7, w22
	str	w0, [x19, 52]
	add	w2, w24, 31
	sub	w1, w1, w6
	and	w2, w2, -32
	tbnz	w23, #31, .L242
	ldr	x4, .LC73
	mov	w8, 0
	mov	w26, 0
	ldr	x0, [x4, w23, sxtw 3]
	ldr	w0, [x0, 1320]
	cmp	w0, 1
	beq	.L249
.L210:
	mov	w5, 0
	mov	w0, 0
	mov	w24, 0
.L169:
	stp	w0, w5, [x19, 12]
	ldr	w0, [x29, 144]
	cmp	w0, 1
	beq	.L250
	mul	w3, w2, w28
	mul	w5, w26, w8
	lsl	w0, w3, 2
	lsl	w21, w24, 2
	sub	w3, w0, w3
	lsl	w0, w5, 2
	sub	w0, w0, w5
	sub	w21, w21, w24
	asr	w0, w0, 1
	add	w0, w0, w3, asr 1
	add	w21, w0, w21, lsr 1
.L171:
	ldr	w0, [x29, 152]
	tbnz	w0, #31, .L172
	stp	w2, w8, [x29, 104]
	stp	w1, w6, [x29, 112]
	str	w7, [x29, 120]
	bl	VCTRL_GetChanWidth
	mov	w23, w0
	ldr	w0, [x29, 152]
	bl	VCTRL_GetChanHeight
	cmn	w23, #1
	ldr	w7, [x29, 120]
	ccmn	w0, #1, 4, ne
	ldp	w2, w8, [x29, 104]
	ldp	w1, w6, [x29, 112]
	beq	.L251
	ldr	w3, [x29, 144]
	add	w23, w23, 15
	and	w23, w23, -16
	add	w0, w0, 15
	cmp	w3, 1
	add	w3, w23, 255
	and	w0, w0, -16
	and	w11, w3, -256
	beq	.L252
	ldr	x3, .LC73
	ldr	w4, [x29, 152]
	ldr	x3, [x3, w4, sxtw 3]
	ldr	w3, [x3, 1320]
	cmp	w3, 1
	beq	.L176
	add	w3, w0, 126
	adds	w0, w0, 63
	csel	w3, w3, w0, mi
	mov	w10, 0
	asr	w3, w3, 6
.L177:
	mul	w3, w11, w3
	mul	w11, w26, w8
	lsl	w5, w3, 2
	sub	w3, w5, w3
	lsl	w0, w11, 2
	lsl	w3, w3, 6
	sub	w0, w0, w11
	asr	w0, w0, 1
	add	w0, w0, w3, asr 1
	add	w0, w0, w10
.L175:
	cmp	w21, w0
	ldr	w23, [x29, 152]
	bgt	.L253
.L172:
	mul	w28, w2, w28
	sub	w0, w25, #16
	cmp	w0, 1
	add	w0, w28, w24
	str	w0, [x19, 36]
	bls	.L254
	cbz	w27, .L181
	cmp	w25, wzr
	ccmp	w25, 3, 4, ne
	beq	.L179
	sdiv	w1, w1, w21
	cmp	w27, 32
	mov	w0, 32
	csel	w27, w27, w0, le
	cmp	w1, w27
	csel	w3, w1, w27, le
	str	w3, [x19, 48]
.L182:
	cbz	w3, .L180
	sub	w0, w3, #1
	mov	x1, 476
	mov	w2, 12
	ldr	w4, [x19, 60]
	umaddl	x2, w0, w2, x1
	add	x1, x19, 464
	mov	w0, w7
	add	x2, x19, x2
	.p2align 2
.L185:
	str	w0, [x1], 12
	add	w0, w0, w21
	cmp	x2, x1
	bne	.L185
	ldr	w0, [x29, 144]
	add	w4, w3, w4
	str	w4, [x19, 60]
	cmp	w0, 1
	beq	.L255
	madd	w6, w21, w3, w6
	add	w0, w6, w22
.L197:
	add	x2, x19, 80
	mov	w1, 0
	.p2align 2
.L189:
	add	w1, w1, 1
	str	w0, [x2], 4
	cmp	w1, w3
	add	w0, w0, 32
	bcc	.L189
.L188:
	ldr	w4, [x19, 56]
	add	w6, w6, w3, lsl 5
	add	w22, w6, w22
	cbz	w4, .L194
	sub	w2, w4, #1
	ldr	w5, [x19, 64]
	add	x2, x2, 27
	add	x1, x19, 208
	mov	w0, w22
	add	x2, x19, x2, lsl 3
	.p2align 2
.L193:
	str	w0, [x1], 8
	add	w0, w0, w20
	cmp	x2, x1
	bne	.L193
	add	w0, w4, w5
	str	w0, [x19, 64]
.L194:
	madd	w20, w4, w20, w6
	str	w20, [x19]
	tbnz	w23, #31, .L192
	ldr	x0, .LC73
	ldr	x0, [x0, w23, sxtw 3]
	cbz	x0, .L192
	add	w0, w20, w22
	cbz	w3, .L192
	sub	w4, w3, #1
	mov	w5, 12
	mov	x2, 860
	add	x1, x19, 848
	umaddl	x2, w4, w5, x2
	add	x2, x19, x2
	.p2align 2
.L195:
	str	w0, [x1], 12
	add	w0, w0, 4096
	cmp	x2, x1
	bne	.L195
.L192:
	add	w20, w20, w3, lsl 12
	mov	w0, 0
	str	w20, [x19]
.L237:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L254:
	lsl	w0, w28, 2
	lsr	w4, w24, 1
	sub	w28, w0, w28
	lsl	w0, w24, 2
	sub	w0, w0, w24
	madd	w9, w26, w8, w4
	lsr	w0, w0, 1
	lsl	w8, w8, 4
	add	w0, w0, w28, asr 1
	str	w8, [x19, 20]
	stp	w0, w9, [x19, 28]
	cbnz	w27, .L179
.L181:
	str	wzr, [x19, 48]
.L180:
	ldr	x2, .LC64
	ldr	x3, .LC79
.L243:
	ldr	x1, .LC65
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
.L179:
	cmp	w27, 32
	mov	w0, 32
	sdiv	w1, w1, w21
	csel	w27, w27, w0, le
	cmp	w27, w1
	csel	w3, w27, w1, le
	str	w3, [x19, 48]
	b	.L182
	.p2align 3
.L248:
	mul	w20, w3, w2
	add	w20, w20, 143
	and	w20, w20, -128
	mul	w1, w26, w20
	cmp	w28, w1
	ble	.L164
	add	w7, w22, 1023
	asr	w0, w20, 1
	and	w7, w7, -1024
	sub	w1, w28, w1
	stp	w0, w26, [x19, 52]
	sub	w6, w7, w22
	add	w28, w21, 255
	sub	w1, w1, w6
	and	w28, w28, -256
	mov	w2, w24
	tbnz	w23, #31, .L202
	ldr	x4, .LC73
	stp	w1, w6, [x29, 104]
	stp	w7, w3, [x29, 112]
	ldr	x0, [x4, w23, sxtw 3]
	str	x4, [x29, 120]
	add	x0, x0, 507904
	add	x0, x0, 2096
	bl	IsMain10Profile
	ldp	w1, w6, [x29, 104]
	ldp	w7, w3, [x29, 112]
	ldr	x4, [x29, 120]
	cbz	w0, .L207
	cmp	w28, wzr
	add	w8, w28, 3
	csel	w8, w8, w28, lt
	add	w9, w24, 31
	asr	w8, w8, 2
	and	w26, w9, -32
	mov	w2, w24
	b	.L168
	.p2align 3
.L250:
	lsl	w0, w3, 4
	mul	w0, w0, w28
	lsl	w21, w0, 2
	sub	w21, w21, w0
	b	.L171
.L256:
	mov	w20, 128
	movk	w20, 0x24, lsl 16
.L202:
	lsl	w0, w28, 4
	str	w0, [x19, 4]
	asr	w0, w0, 1
	str	w0, [x19, 8]
.L242:
	mov	w5, 0
	mov	w0, 0
	mov	w8, 0
	mov	w26, 0
	mov	w24, 0
	b	.L169
	.p2align 3
.L255:
	ldr	x0, .LC80
	ldr	x4, [x0]
	cbz	x4, .L187
	str	w3, [x29, 136]
	add	x2, x29, 128
	mov	w3, 12
	mov	w1, 128
	mov	w0, w23
	str	w6, [x29, 120]
	stp	w7, w21, [x29, 128]
	blr	x4
	ldr	w3, [x19, 48]
	ldr	w6, [x29, 120]
.L187:
	madd	w6, w21, w3, w6
	add	w0, w6, w22
	cbnz	w3, .L197
	b	.L188
	.p2align 3
.L166:
	lsl	w0, w26, 14
	add	w0, w0, w26, lsl 11
	add	w0, w0, w26
	lsl	w0, w0, 7
	cmp	w28, w0
	ble	.L164
	add	w7, w22, 1023
	mov	w1, 64
	movk	w1, 0x12, lsl 16
	and	w7, w7, -1024
	stp	w1, w26, [x19, 52]
	sub	w0, w28, w0
	sub	w6, w7, w22
	add	w28, w21, 255
	add	w2, w24, 63
	and	w28, w28, -256
	and	w2, w2, -64
	sub	w1, w0, w6
	tbnz	w23, #31, .L256
	ldr	x4, .LC73
	ldr	x0, [x4, w23, sxtw 3]
	ldr	w0, [x0, 1684]
	cmp	w0, 8
	ble	.L208
	cmp	w28, wzr
	add	w8, w28, 3
	csel	w8, w8, w28, lt
	add	w9, w2, 63
	mov	w20, 128
	asr	w8, w8, 2
	and	w26, w9, -64
	movk	w20, 0x24, lsl 16
.L168:
	lsl	w0, w28, 4
	str	w0, [x19, 4]
	asr	w0, w0, 1
	str	w0, [x19, 8]
	ldr	x0, [x4, w23, sxtw 3]
	ldr	w0, [x0, 1320]
	cmp	w0, 1
	bne	.L210
.L249:
	cmp	w25, 17
	mov	w0, 1920
	ccmp	w21, w0, 0, ne
	ble	.L210
	adds	w0, w21, 2047
	add	w21, w21, 4094
	csel	w0, w21, w0, mi
	and	w4, w0, -2048
	cmp	w4, wzr
	add	w0, w4, 127
	csel	w0, w0, w4, lt
	adds	w5, w24, 63
	add	w4, w24, 126
	asr	w0, w0, 7
	csel	w4, w4, w5, mi
	asr	w4, w4, 6
	lsl	w4, w4, 5
	mul	w24, w4, w0
	mov	w5, w24
	b	.L169
	.p2align 3
.L252:
	mul	w0, w0, w11
	lsl	w3, w0, 2
	sub	w0, w3, w0
	b	.L175
	.p2align 3
.L176:
	adds	w5, w0, 63
	add	w3, w0, 126
	csel	w3, w3, w5, mi
	adds	w5, w23, 2047
	add	w23, w23, 4094
	asr	w3, w3, 6
	csel	w5, w23, w5, mi
	and	w5, w5, -2048
	add	w10, w5, 127
	cmp	w5, wzr
	csel	w5, w10, w5, lt
	lsl	w10, w3, 2
	sub	w10, w10, w3
	asr	w5, w5, 7
	lsl	w10, w10, 5
	mul	w10, w5, w10
	lsr	w10, w10, 1
	b	.L177
.L207:
	mov	w2, w24
	mov	w26, 0
	mov	w8, 0
	b	.L168
.L208:
	mov	w20, 128
	mov	w26, 0
	movk	w20, 0x24, lsl 16
	mov	w8, 0
	b	.L168
.L158:
	ldr	x2, .LC64
	ldr	x3, .LC66
	b	.L243
.L164:
	ldr	x2, .LC64
	ldr	x3, .LC72
	b	.L243
.L246:
	ldr	x2, .LC64
	ldr	x3, .LC63
	b	.L243
.L251:
	ldr	x1, .LC75
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L237
.L253:
	ldr	x2, .LC64
	ldr	x3, .LC77
	b	.L243
.L247:
	ldr	x2, .LC64
	ldr	x3, .LC68
	b	.L243
	.size	VDMHAL_V5R2C1_ArrangeMem_Specific, .-VDMHAL_V5R2C1_ArrangeMem_Specific
	.align	3
.LC63:
	.xword	.LC62
	.align	3
.LC64:
	.xword	.LANCHOR0
	.align	3
.LC65:
	.xword	.LC7
	.align	3
.LC66:
	.xword	.LC17
	.align	3
.LC68:
	.xword	.LC67
	.align	3
.LC69:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC70:
	.xword	g_not_direct_8x8_inference_flag
	.align	3
.LC72:
	.xword	.LC71
	.align	3
.LC73:
	.xword	s_pstVfmwChan
	.align	3
.LC75:
	.xword	.LC74
	.align	3
.LC77:
	.xword	.LC76
	.align	3
.LC79:
	.xword	.LC78
	.align	3
.LC80:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_ArrangeMem
	.type	VDMHAL_V5R2C1_ArrangeMem, %function
VDMHAL_V5R2C1_ArrangeMem:
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
	beq	.L263
	tbnz	w19, #31, .L264
	mov	w0, w19
	bl	VCTRL_GetVidStd
	cmp	w0, 22
	mov	w1, w0
	beq	.L267
	ldr	x0, .LC83
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w0, [x0, 1616]
	cmp	w0, 1
	beq	.L268
.L262:
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
	bl	VDMHAL_V5R2C1_ArrangeMem_Specific
.L265:
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L264:
	mov	w1, 22
	b	.L262
	.p2align 3
.L263:
	mov	w1, 16
	b	.L262
	.p2align 3
.L268:
	ldr	x6, [x29, 80]
	mov	w5, w23
	mov	w4, w22
	mov	w3, w21
	mov	w2, w20
	mov	w0, w19
	bl	VDMHAL_V5R2C1_ArrangeMem_Normal
	b	.L265
.L267:
	ldr	x1, .LC82
	mov	w2, -1
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L265
	.size	VDMHAL_V5R2C1_ArrangeMem, .-VDMHAL_V5R2C1_ArrangeMem
	.align	3
.LC82:
	.xword	.LC81
	.align	3
.LC83:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_ResetVdm
	.type	VDMHAL_V5R2C1_ResetVdm, %function
VDMHAL_V5R2C1_ResetVdm:
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
	ble	.L270
	ldr	x2, .LC84
	mov	w4, 0
	ldr	x1, .LC86
	mov	w3, w21
	add	x2, x2, 224
	mov	w0, 0
	bl	dprint_vfmw
.L269:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L270:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L282
	sxtw	x22, w21
	ldr	x24, .LC89
	lsl	x0, x22, 6
	ldr	x20, .LC90
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x1, x0, x22
	ldr	x2, [x20]
	add	x0, x0, x1, lsl 2
	ldr	x0, [x24, x0]
	ldr	w25, [x0, 36]
	ldr	w23, [x2, 120]
	tbz	x23, 0, .L269
	ldr	x26, .LC91
	mov	w0, 2
	bfi	w23, w0, 8, 2
	str	w23, [x2, 120]
	mov	w19, 0
	orr	w23, w23, 64
	ldr	x0, [x26, 224]
	blr	x0
	ldr	x0, [x20]
	str	w23, [x0, 120]
	b	.L274
	.p2align 3
.L283:
	add	w19, w19, 1
	cmp	w19, 1000
	beq	.L275
.L274:
	ldr	x1, [x26, 232]
	mov	x0, 30
	blr	x1
	ldr	x0, [x20]
	ldr	w0, [x0, 372]
	tbz	x0, 2, .L283
	cmp	w19, 999
	bgt	.L275
	ldr	x2, .LC84
	mov	w3, w21
	ldr	x1, .LC95
	mov	w0, 0
	add	x2, x2, 224
	bl	dprint_vfmw
.L277:
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
.L275:
	ldr	x2, .LC84
	mov	w3, w21
	ldr	x1, .LC93
	mov	w0, 0
	add	x2, x2, 224
	bl	dprint_vfmw
	b	.L277
.L282:
	ldr	x1, .LC88
	mov	x2, 0
	bl	dprint_vfmw
	b	.L269
	.size	VDMHAL_V5R2C1_ResetVdm, .-VDMHAL_V5R2C1_ResetVdm
	.align	3
.LC84:
	.xword	.LANCHOR0
	.align	3
.LC86:
	.xword	.LC85
	.align	3
.LC88:
	.xword	.LC87
	.align	3
.LC89:
	.xword	g_HwMem
	.align	3
.LC90:
	.xword	g_pstRegCrg
	.align	3
.LC91:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC93:
	.xword	.LC92
	.align	3
.LC95:
	.xword	.LC94
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_SetSmmuPageTableAddr
	.type	VDMHAL_V5R2C1_SetSmmuPageTableAddr, %function
VDMHAL_V5R2C1_SetSmmuPageTableAddr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC96
	ldr	x3, [x0, 392]
	cbz	x3, .L284
	add	x2, x29, 60
	add	x1, x29, 56
	add	x0, x29, 52
	blr	x3
	cbnz	w19, .L286
	ldr	x0, .LC97
	ldp	w3, w2, [x29, 52]
	ldr	w1, [x29, 60]
	ldr	x0, [x0]
	add	x0, x0, 61440
	str	w3, [x0, 524]
	str	w2, [x0, 772]
	str	w1, [x0, 776]
.L284:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L286:
	ldr	x20, .LC98
	mov	w3, w19
	ldr	x21, .LC100
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
	.size	VDMHAL_V5R2C1_SetSmmuPageTableAddr, .-VDMHAL_V5R2C1_SetSmmuPageTableAddr
	.align	3
.LC96:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC97:
	.xword	g_HwMem
	.align	3
.LC98:
	.xword	.LANCHOR0
	.align	3
.LC100:
	.xword	.LC99
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_EnableSmmu
	.type	VDMHAL_V5R2C1_EnableSmmu, %function
VDMHAL_V5R2C1_EnableSmmu:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC102
	mov	w1, 8
	movk	w1, 0x3, lsl 16
	ldr	x0, [x0]
	add	x0, x0, 61440
	str	w1, [x0]
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V5R2C1_EnableSmmu, .-VDMHAL_V5R2C1_EnableSmmu
	.align	3
.LC102:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_GlbResetX
	.type	VDMHAL_V5R2C1_GlbResetX, %function
VDMHAL_V5R2C1_GlbResetX:
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
	ldr	x20, .LC103
	ldr	x0, [x20]
	ldr	w22, [x0, 120]
	tbnz	x22, 0, .L302
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L302:
	ldr	x21, .LC104
	mov	w1, 2
	bfi	w22, w1, 8, 2
	str	w22, [x0, 120]
	mov	w19, 0
	orr	w22, w22, 16
	ldr	x0, [x21, 224]
	blr	x0
	ldr	x0, [x20]
	str	w22, [x0, 120]
	b	.L294
	.p2align 3
.L303:
	add	w19, w19, 1
	cmp	w19, 1000
	beq	.L295
.L294:
	ldr	x1, [x21, 232]
	mov	x0, 30
	blr	x1
	ldr	x0, [x20]
	ldr	w0, [x0, 372]
	tbz	x0, 0, .L303
	cmp	w19, 999
	bgt	.L295
	ldr	x2, .LC105
	mov	w3, w23
	ldr	x1, .LC109
	mov	w0, 0
	add	x2, x2, 288
	bl	dprint_vfmw
.L297:
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
.L295:
	ldr	x2, .LC105
	mov	w3, w23
	ldr	x1, .LC107
	mov	w0, 0
	add	x2, x2, 288
	bl	dprint_vfmw
	b	.L297
	.size	VDMHAL_V5R2C1_GlbResetX, .-VDMHAL_V5R2C1_GlbResetX
	.align	3
.LC103:
	.xword	g_pstRegCrg
	.align	3
.LC104:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC105:
	.xword	.LANCHOR0
	.align	3
.LC107:
	.xword	.LC106
	.align	3
.LC109:
	.xword	.LC108
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_GlbReset
	.type	VDMHAL_V5R2C1_GlbReset, %function
VDMHAL_V5R2C1_GlbReset:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L307
	mov	w0, 0
	bl	VDMHAL_V5R2C1_GlbResetX
.L304:
	ldp	x29, x30, [sp], 16
	ret
.L307:
	ldr	x2, .LC110
	mov	w3, -121438208
	ldr	x1, .LC112
	add	x2, x2, 312
	bl	dprint_vfmw
	b	.L304
	.size	VDMHAL_V5R2C1_GlbReset, .-VDMHAL_V5R2C1_GlbReset
	.align	3
.LC110:
	.xword	.LANCHOR0
	.align	3
.LC112:
	.xword	.LC111
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_ClearIntState
	.type	VDMHAL_V5R2C1_ClearIntState, %function
VDMHAL_V5R2C1_ClearIntState:
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
	cbz	x0, .L318
	ldr	w22, [x0, 1352]
.L309:
	cmp	w20, wzr
	bgt	.L320
	lsl	x0, x19, 6
	ldr	x23, .LC117
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x20, x0, x19
	add	x20, x0, x20, lsl 2
	ldr	x0, [x23, x20]
	cbz	x0, .L321
.L312:
	cmp	w22, 1
	bne	.L319
	add	x19, x21, x19, lsl 6
	ldr	w1, [x19, 44]
	cmp	w1, 1
	beq	.L319
	ldr	w2, [x0, 28]
	cmp	w1, 2
	beq	.L322
	cmp	w1, 3
	bne	.L308
	mov	w1, -15
	str	w1, [x0, 32]
	b	.L308
	.p2align 3
.L320:
	ldr	x2, .LC115
	mov	w4, 0
	ldr	x1, .LC116
	mov	w3, w20
	add	x2, x2, 336
	mov	w0, 0
	bl	dprint_vfmw
.L308:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L319:
	mov	w1, -1
	str	w1, [x0, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L318:
	mov	w22, 0
	b	.L309
	.p2align 3
.L321:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L313
	str	x0, [x23, x20]
	b	.L312
	.p2align 3
.L322:
	mov	w1, -12
	str	w1, [x0, 32]
	b	.L308
.L313:
	ldr	x1, .LC119
	mov	w0, 0
	bl	dprint_vfmw
	b	.L308
	.size	VDMHAL_V5R2C1_ClearIntState, .-VDMHAL_V5R2C1_ClearIntState
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
	.xword	.LC85
	.align	3
.LC117:
	.xword	g_HwMem
	.align	3
.LC119:
	.xword	.LC118
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_ClearMMUIntState
	.type	VDMHAL_V5R2C1_ClearMMUIntState, %function
VDMHAL_V5R2C1_ClearMMUIntState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	bgt	.L328
	lsl	x3, x19, 6
	ldr	x20, .LC122
	sub	x3, x3, x19
	lsl	x3, x3, 2
	sub	x19, x3, x19
	add	x19, x3, x19, lsl 2
	ldr	x0, [x20, x19]
	cbz	x0, .L329
.L326:
	add	x0, x0, 61440
	mov	w1, 7
	str	w1, [x0, 44]
.L323:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L328:
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
.L329:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L327
	str	x0, [x20, x19]
	b	.L326
.L327:
	ldr	x1, .LC123
	mov	w0, 0
	bl	dprint_vfmw
	b	.L323
	.size	VDMHAL_V5R2C1_ClearMMUIntState, .-VDMHAL_V5R2C1_ClearMMUIntState
	.align	3
.LC120:
	.xword	.LANCHOR0
	.align	3
.LC121:
	.xword	.LC85
	.align	3
.LC122:
	.xword	g_HwMem
	.align	3
.LC123:
	.xword	.LC118
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_MaskInt
	.type	VDMHAL_V5R2C1_MaskInt, %function
VDMHAL_V5R2C1_MaskInt:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	bgt	.L335
	lsl	x3, x19, 6
	ldr	x20, .LC126
	sub	x3, x3, x19
	lsl	x3, x3, 2
	sub	x19, x3, x19
	add	x19, x3, x19, lsl 2
	ldr	x0, [x20, x19]
	cbz	x0, .L336
.L333:
	mov	w1, -1
	str	w1, [x0, 36]
.L330:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L335:
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
.L336:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L334
	str	x0, [x20, x19]
	b	.L333
.L334:
	ldr	x1, .LC127
	mov	w0, 0
	bl	dprint_vfmw
	b	.L330
	.size	VDMHAL_V5R2C1_MaskInt, .-VDMHAL_V5R2C1_MaskInt
	.align	3
.LC124:
	.xword	.LANCHOR0
	.align	3
.LC125:
	.xword	.LC85
	.align	3
.LC126:
	.xword	g_HwMem
	.align	3
.LC127:
	.xword	.LC118
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_GetIntMaskCfg
	.type	VDMHAL_V5R2C1_GetIntMaskCfg, %function
VDMHAL_V5R2C1_GetIntMaskCfg:
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
	.size	VDMHAL_V5R2C1_GetIntMaskCfg, .-VDMHAL_V5R2C1_GetIntMaskCfg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_EnableInt
	.type	VDMHAL_V5R2C1_EnableInt, %function
VDMHAL_V5R2C1_EnableInt:
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
	cbz	x1, .L348
	ldr	w20, [x1, 1352]
.L341:
	cmp	w19, wzr
	bgt	.L349
	lsl	x19, x0, 6
	ldr	x21, .LC132
	sub	x19, x19, x0
	lsl	x19, x19, 2
	sub	x0, x19, x0
	add	x19, x19, x0, lsl 2
	ldr	x0, [x21, x19]
	cbz	x0, .L350
.L344:
	mov	w1, -6
	mov	w2, -2
	cmp	w20, 1
	csel	w1, w1, w2, eq
	str	w1, [x0, 36]
.L340:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L349:
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
.L348:
	mov	w20, 0
	b	.L341
	.p2align 3
.L350:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L345
	str	x0, [x21, x19]
	b	.L344
.L345:
	ldr	x1, .LC133
	mov	w0, 0
	bl	dprint_vfmw
	b	.L340
	.size	VDMHAL_V5R2C1_EnableInt, .-VDMHAL_V5R2C1_EnableInt
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
	.xword	.LC85
	.align	3
.LC132:
	.xword	g_HwMem
	.align	3
.LC133:
	.xword	.LC118
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_CheckReg
	.type	VDMHAL_V5R2C1_CheckReg, %function
VDMHAL_V5R2C1_CheckReg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w22, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w19, wzr
	bgt	.L368
	lsl	x0, x19, 6
	ldr	x21, .LC137
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x20, x0, x19
	add	x20, x0, x20, lsl 2
	ldr	x0, [x21, x20]
	cbz	x0, .L369
.L354:
	sub	w0, w22, #1
	cmp	w0, 6
	bls	.L370
	ldr	x2, .LC134
	mov	w3, w22
	ldr	x1, .LC141
	mov	w0, 0
	add	x2, x2, 448
	bl	dprint_vfmw
	mov	w0, 0
.L367:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L370:
	ldr	x1, .LC142
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx361
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx361:
	.section	.rodata
	.align	0
	.align	2
.L361:
	.byte	(.L365 - .Lrtx361) / 4
	.byte	(.L362 - .Lrtx361) / 4
	.byte	(.L363 - .Lrtx361) / 4
	.byte	(.L364 - .Lrtx361) / 4
	.byte	(.L366 - .Lrtx361) / 4
	.byte	(.L356 - .Lrtx361) / 4
	.byte	(.L358 - .Lrtx361) / 4
	.text
	.p2align 3
.L366:
	mov	x1, 61480
.L360:
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
.L365:
	mov	x1, 28
	b	.L360
	.p2align 3
.L364:
	mov	x1, 40
	b	.L360
	.p2align 3
.L363:
	mov	x1, 36
	b	.L360
	.p2align 3
.L362:
	mov	x1, 32
	b	.L360
	.p2align 3
.L358:
	mov	x1, 62272
	b	.L360
	.p2align 3
.L356:
	mov	x1, 62304
	b	.L360
	.p2align 3
.L369:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L355
	str	x0, [x21, x20]
	b	.L354
	.p2align 3
.L368:
	ldr	x2, .LC134
	mov	w3, w19
	ldr	x1, .LC136
	mov	w0, 0
	add	x2, x2, 448
	bl	dprint_vfmw
	mov	w0, -1
	b	.L367
.L355:
	ldr	x2, .LC134
	mov	w0, 0
	ldr	x1, .LC139
	add	x2, x2, 448
	bl	dprint_vfmw
	mov	w0, 0
	b	.L367
	.size	VDMHAL_V5R2C1_CheckReg, .-VDMHAL_V5R2C1_CheckReg
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
	.xword	.L361
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_ReadMMUMask
	.type	VDMHAL_V5R2C1_ReadMMUMask, %function
VDMHAL_V5R2C1_ReadMMUMask:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	ble	.L374
	ldr	x2, .LC144
	mov	w3, w19
	ldr	x1, .LC146
	mov	w4, 1
	add	x2, x2, 472
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L374:
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
	.size	VDMHAL_V5R2C1_ReadMMUMask, .-VDMHAL_V5R2C1_ReadMMUMask
	.align	3
.LC143:
	.xword	g_HwMem
	.align	3
.LC144:
	.xword	.LANCHOR0
	.align	3
.LC146:
	.xword	.LC145
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_WriteMMUMask
	.type	VDMHAL_V5R2C1_WriteMMUMask, %function
VDMHAL_V5R2C1_WriteMMUMask:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w19, wzr
	ble	.L378
	ldr	x2, .LC148
	mov	w3, w19
	ldr	x1, .LC149
	mov	w4, 1
	add	x2, x2, 504
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L378:
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
	.size	VDMHAL_V5R2C1_WriteMMUMask, .-VDMHAL_V5R2C1_WriteMMUMask
	.align	3
.LC147:
	.xword	g_HwMem
	.align	3
.LC148:
	.xword	.LANCHOR0
	.align	3
.LC149:
	.xword	.LC99
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_PrepareDec
	.type	VDMHAL_V5R2C1_PrepareDec, %function
VDMHAL_V5R2C1_PrepareDec:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x22, x1
	mov	x0, x30
	mov	w21, w2
	mov	x19, x3
	bl	_mcount
	cbz	x22, .L398
	cmp	w21, wzr
	bgt	.L399
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
	bls	.L400
.L397:
	mov	w0, -1
	b	.L381
	.p2align 3
.L400:
	ldr	x0, .LC154
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx384
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx384:
	.section	.rodata
	.align	0
	.align	2
.L384:
	.byte	(.L394 - .Lrtx384) / 4
	.byte	(.L385 - .Lrtx384) / 4
	.byte	(.L386 - .Lrtx384) / 4
	.byte	(.L387 - .Lrtx384) / 4
	.byte	(.L397 - .Lrtx384) / 4
	.byte	(.L388 - .Lrtx384) / 4
	.byte	(.L389 - .Lrtx384) / 4
	.byte	(.L397 - .Lrtx384) / 4
	.byte	(.L390 - .Lrtx384) / 4
	.byte	(.L391 - .Lrtx384) / 4
	.byte	(.L392 - .Lrtx384) / 4
	.byte	(.L392 - .Lrtx384) / 4
	.byte	(.L392 - .Lrtx384) / 4
	.byte	(.L393 - .Lrtx384) / 4
	.byte	(.L397 - .Lrtx384) / 4
	.byte	(.L394 - .Lrtx384) / 4
	.byte	(.L395 - .Lrtx384) / 4
	.byte	(.L396 - .Lrtx384) / 4
	.text
	.p2align 3
.L394:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	H264HAL_V5R2C1_StartDec
.L381:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L395:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	HEVCHAL_V5R2C1_StartDec
	b	.L381
	.p2align 3
.L393:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	VP8HAL_V5R2C1_StartDec
	b	.L381
	.p2align 3
.L392:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	VP6HAL_V5R2C1_StartDec
	b	.L381
	.p2align 3
.L391:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	RV9HAL_V5R2C1_StartDec
	b	.L381
	.p2align 3
.L390:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	RV8HAL_V5R2C1_StartDec
	b	.L381
	.p2align 3
.L389:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	AVSHAL_V5R2C1_StartDec
	b	.L381
	.p2align 3
.L388:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	DIVX3HAL_V5R2C1_StartDec
	b	.L381
	.p2align 3
.L387:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	MP2HAL_V5R2C1_StartDec
	b	.L381
	.p2align 3
.L386:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	MP4HAL_V5R2C1_StartDec
	b	.L381
	.p2align 3
.L385:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	VC1HAL_V5R2C1_StartDec
	b	.L381
	.p2align 3
.L396:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	VP9HAL_V5R2C1_StartDec
	b	.L381
	.p2align 3
.L399:
	ldr	x2, .LC150
	mov	w3, w21
	ldr	x1, .LC153
	mov	w4, 0
	add	x2, x2, 536
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L398:
	ldr	x2, .LC150
	mov	x3, 0
	ldr	x1, .LC152
	mov	w0, 0
	add	x2, x2, 536
	bl	dprint_vfmw
	mov	w0, -1
	b	.L381
	.size	VDMHAL_V5R2C1_PrepareDec, .-VDMHAL_V5R2C1_PrepareDec
	.align	3
.LC150:
	.xword	.LANCHOR0
	.align	3
.LC152:
	.xword	.LC151
	.align	3
.LC153:
	.xword	.LC85
	.align	3
.LC154:
	.xword	.L384
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_IsVdmReady
	.type	VDMHAL_V5R2C1_IsVdmReady, %function
VDMHAL_V5R2C1_IsVdmReady:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sxtw	x0, w19
	ldr	x2, .LC155
	lsl	x1, x0, 6
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x0, x1, x0
	add	x0, x1, x0, lsl 2
	ldr	x0, [x2, x0]
	cbz	x0, .L406
	cmp	w19, wzr
	ble	.L407
	ldr	x2, .LC158
	mov	w4, 1
	ldr	x1, .LC160
	mov	w3, w19
	add	x2, x2, 568
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, 0
.L403:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L407:
	ldr	w0, [x0, 28]
	ldr	x19, [sp, 16]
	ubfx	x0, x0, 17, 1
	ldp	x29, x30, [sp], 32
	ret
.L406:
	ldr	x2, .LC158
	ldr	x3, .LC157
	ldr	x1, .LC159
	add	x2, x2, 568
	bl	dprint_vfmw
	mov	w0, -1
	b	.L403
	.size	VDMHAL_V5R2C1_IsVdmReady, .-VDMHAL_V5R2C1_IsVdmReady
	.align	3
.LC155:
	.xword	g_HwMem
	.align	3
.LC157:
	.xword	.LC156
	.align	3
.LC158:
	.xword	.LANCHOR0
	.align	3
.LC159:
	.xword	.LC7
	.align	3
.LC160:
	.xword	.LC145
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_IsVdmRun
	.type	VDMHAL_V5R2C1_IsVdmRun, %function
VDMHAL_V5R2C1_IsVdmRun:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sxtw	x0, w19
	ldr	x2, .LC161
	lsl	x1, x0, 6
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x0, x1, x0
	add	x0, x1, x0, lsl 2
	ldr	x0, [x2, x0]
	cbz	x0, .L413
	cmp	w19, wzr
	ble	.L414
	ldr	x2, .LC164
	mov	w4, 1
	ldr	x1, .LC165
	mov	w3, w19
	add	x2, x2, 600
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, 1
.L410:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L414:
	ldr	w0, [x0, 40]
	ldr	x19, [sp, 16]
	cmp	w0, 1
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L413:
	ldr	x1, .LC163
	bl	dprint_vfmw
	mov	w0, 0
	b	.L410
	.size	VDMHAL_V5R2C1_IsVdmRun, .-VDMHAL_V5R2C1_IsVdmRun
	.align	3
.LC161:
	.xword	g_HwMem
	.align	3
.LC163:
	.xword	.LC162
	.align	3
.LC164:
	.xword	.LANCHOR0
	.align	3
.LC165:
	.xword	.LC145
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_IsVdhDecOver
	.type	VDMHAL_V5R2C1_IsVdhDecOver, %function
VDMHAL_V5R2C1_IsVdhDecOver:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	sxtw	x0, w20
	ldr	x1, .LC166
	lsl	x2, x0, 6
	sub	x2, x2, x0
	lsl	x2, x2, 2
	sub	x0, x2, x0
	add	x0, x2, x0, lsl 2
	ldr	x0, [x1, x0]
	cbz	x0, .L423
	mov	w1, w20
	mov	w0, w19
	bl	VDMHAL_V5R2C1_CheckReg
	cmp	w19, 2
	beq	.L420
	cmp	w19, 3
	beq	.L420
	cmp	w19, 1
	ubfx	x0, x0, 17, 1
	beq	.L417
	ldr	x2, .LC168
	mov	w3, w19
	ldr	x1, .LC170
	mov	w0, 0
	add	x2, x2, 624
	bl	dprint_vfmw
	mov	w0, 0
.L417:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L420:
	and	w0, w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L423:
	ldr	x2, .LC168
	ldr	x3, .LC167
	ldr	x1, .LC169
	add	x2, x2, 624
	bl	dprint_vfmw
	mov	w0, -1
	b	.L417
	.size	VDMHAL_V5R2C1_IsVdhDecOver, .-VDMHAL_V5R2C1_IsVdhDecOver
	.align	3
.LC166:
	.xword	g_HwMem
	.align	3
.LC167:
	.xword	.LC156
	.align	3
.LC168:
	.xword	.LANCHOR0
	.align	3
.LC169:
	.xword	.LC7
	.align	3
.LC170:
	.xword	.LC140
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_IsVdhPartDecOver
	.type	VDMHAL_V5R2C1_IsVdhPartDecOver, %function
VDMHAL_V5R2C1_IsVdhPartDecOver:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	sxtw	x0, w20
	ldr	x1, .LC171
	lsl	x2, x0, 6
	sub	x2, x2, x0
	lsl	x2, x2, 2
	sub	x0, x2, x0
	add	x0, x2, x0, lsl 2
	ldr	x0, [x1, x0]
	cbz	x0, .L432
	mov	w1, w20
	mov	w0, w19
	bl	VDMHAL_V5R2C1_CheckReg
	cmp	w19, 1
	beq	.L428
	cmp	w19, 2
	ubfx	x0, x0, 2, 1
	bne	.L433
.L426:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L433:
	ldr	x2, .LC173
	mov	w3, w19
	ldr	x1, .LC175
	mov	w0, 0
	add	x2, x2, 656
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L428:
	ubfx	x0, x0, 19, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L432:
	ldr	x2, .LC173
	ldr	x3, .LC172
	ldr	x1, .LC174
	add	x2, x2, 656
	bl	dprint_vfmw
	mov	w0, -1
	b	.L426
	.size	VDMHAL_V5R2C1_IsVdhPartDecOver, .-VDMHAL_V5R2C1_IsVdhPartDecOver
	.align	3
.LC171:
	.xword	g_HwMem
	.align	3
.LC172:
	.xword	.LC156
	.align	3
.LC173:
	.xword	.LANCHOR0
	.align	3
.LC174:
	.xword	.LC7
	.align	3
.LC175:
	.xword	.LC140
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_UpdateHardwareInfo
	.type	VDMHAL_V5R2C1_UpdateHardwareInfo, %function
VDMHAL_V5R2C1_UpdateHardwareInfo:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w22, w0
	mov	x0, x30
	bl	_mcount
	cmp	w22, wzr
	bgt	.L435
	ldr	x4, .LC176
	add	x0, x4, 4
	add	x4, x4, 128
	ldr	w1, [x4, -128]
	cmp	w1, 1
	bne	.L439
	b	.L450
	.p2align 3
.L460:
	cmp	x0, x4
	beq	.L459
.L439:
	ldr	w1, [x0]
	add	x0, x0, 4
	cmp	w1, 1
	bne	.L460
.L450:
	mov	w19, w1
.L436:
	sxtw	x20, w22
	ldr	x24, .LC181
	lsl	x0, x20, 6
	sub	x0, x0, x20
	lsl	x0, x0, 2
	sub	x21, x0, x20
	add	x21, x0, x21, lsl 2
	ldr	x1, [x24, x21]
	cbz	x1, .L461
.L440:
	lsl	x0, x20, 2
	ldr	x21, .LC183
	sub	x4, x0, x20
	ldr	x2, .LC187
	lsl	x0, x4, 4
	ldr	w3, [x1, 12]
	sub	x0, x0, x4
	lsl	x5, x20, 6
	lsl	x0, x0, 2
	add	x4, x21, x0
	str	w3, [x21, x0]
	add	x0, x2, x5
	ldr	w3, [x1, 28]
	ldr	w0, [x0, 56]
	str	w3, [x4, 4]
	cmp	w0, 1
	beq	.L462
	cmp	w19, 1
	beq	.L463
	ldr	w5, [x1, 4096]
	ldr	w3, [x1, 4108]
	ldr	w2, [x1, 208]
	ldr	w0, [x1, 212]
	stp	w2, w0, [x4, 8]
	stp	w5, w3, [x4, 16]
	cbz	w19, .L464
.L445:
	mov	w0, 180
	add	x4, x1, 32768
	add	x1, x4, 256
	smull	x2, w22, w0
	add	x0, x2, 52
	add	x2, x2, 180
	add	x0, x21, x0
	add	x3, x21, x2
	.p2align 2
.L446:
	ldr	w2, [x1], 4
	str	w2, [x0], 4
	cmp	x3, x0
	bne	.L446
	mov	w0, 0
	cbnz	w19, .L453
	lsl	x1, x20, 2
	ldr	w3, [x4, 384]
	sub	x20, x1, x20
	ldr	w2, [x4, 388]
	lsl	x1, x20, 4
	sub	x1, x1, x20
	add	x21, x21, x1, lsl 2
	stp	w2, w3, [x21, 44]
.L453:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L464:
	ldr	w5, [x1, 176]
	ldr	w0, [x1, 180]
	stp	w5, w0, [x4, 24]
	ldr	w3, [x1, 184]
	ldr	w2, [x1, 188]
	ldr	w0, [x1, 192]
	stp	w3, w2, [x4, 32]
	str	w0, [x4, 40]
	b	.L445
	.p2align 3
.L459:
	mov	w19, 0
	b	.L436
.L462:
	ldr	w2, [x1, 4108]
	mov	w0, 0
	str	w2, [x4, 20]
	and	w2, w2, 1048575
	ldr	w1, [x1, 176]
	stp	w2, w1, [x4, 20]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L463:
	sub	x0, x5, x20
	and	w23, w3, 131071
	lsl	x0, x0, 2
	sub	x1, x0, x20
	add	x0, x0, x1, lsl 2
	add	x0, x24, x0
	ldr	w0, [x0, 56]
	bl	MEM_Phy2Vir
	cbz	x0, .L465
	sub	w1, w23, #1
	cmp	w1, 199
	bhi	.L451
	lsl	w1, w23, 2
	sub	w1, w1, #4
	lsl	x1, x1, 2
	add	x3, x1, 8
.L444:
	lsl	x2, x20, 2
	ldr	w4, [x0, x1]
	sub	x2, x2, x20
	lsl	x1, x2, 4
	sub	x2, x1, x2
	lsl	x1, x20, 6
	sub	x1, x1, x20
	add	x2, x21, x2, lsl 2
	lsl	x1, x1, 2
	str	w4, [x2, 16]
	ldr	w3, [x0, x3]
	sub	x0, x1, x20
	str	w3, [x2, 20]
	add	x1, x1, x0, lsl 2
	ldr	x1, [x24, x1]
	ldr	w3, [x1, 208]
	ldr	w0, [x1, 212]
	stp	w3, w0, [x2, 8]
	b	.L445
.L461:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L441
	str	x0, [x24, x21]
	mov	x1, x0
	b	.L440
.L451:
	mov	x3, 8
	mov	x1, 0
	b	.L444
.L435:
	ldr	x2, .LC177
	mov	w4, 0
	ldr	x1, .LC178
	mov	w3, w22
	add	x2, x2, 688
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L453
.L465:
	ldr	x2, .LC177
	ldr	x3, .LC185
	ldr	x1, .LC186
	add	x2, x2, 688
	bl	dprint_vfmw
	mov	w0, -1
	b	.L453
.L441:
	ldr	x1, .LC182
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L453
	.size	VDMHAL_V5R2C1_UpdateHardwareInfo, .-VDMHAL_V5R2C1_UpdateHardwareInfo
	.align	3
.LC176:
	.xword	g_DSPState
	.align	3
.LC177:
	.xword	.LANCHOR0
	.align	3
.LC178:
	.xword	.LC85
	.align	3
.LC181:
	.xword	g_HwMem
	.align	3
.LC182:
	.xword	.LC118
	.align	3
.LC183:
	.xword	g_BackUp
	.align	3
.LC185:
	.xword	.LC184
	.align	3
.LC186:
	.xword	.LC7
	.align	3
.LC187:
	.xword	g_VdmDrvParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_ReadMsgSlot
	.type	VDMHAL_V5R2C1_ReadMsgSlot, %function
VDMHAL_V5R2C1_ReadMsgSlot:
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
	beq	.L470
	cmp	w19, 800
	bhi	.L471
	ldr	x3, .LC192
	ubfiz	x2, x19, 2, 30
	mov	x1, x21
	mov	x0, x20
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L468:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L471:
	ldr	x1, .LC191
	mov	w2, w19
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L468
	.p2align 3
.L470:
	ldr	x1, .LC189
	mov	x3, x21
	mov	x2, x20
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L468
	.size	VDMHAL_V5R2C1_ReadMsgSlot, .-VDMHAL_V5R2C1_ReadMsgSlot
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
	.global	VDMHAL_V5R2C1_WriteMsgSlot
	.type	VDMHAL_V5R2C1_WriteMsgSlot, %function
VDMHAL_V5R2C1_WriteMsgSlot:
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
	beq	.L473
	sub	w0, w21, #1
	cmp	w0, 255
	bhi	.L473
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
.L473:
	ldr	x1, .LC194
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	VDMHAL_V5R2C1_WriteMsgSlot, .-VDMHAL_V5R2C1_WriteMsgSlot
	.align	3
.LC194:
	.xword	.LC193
	.align	3
.LC195:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_CfgRpMsg
	.type	VDMHAL_V5R2C1_CfgRpMsg, %function
VDMHAL_V5R2C1_CfgRpMsg:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x20, 64]
	bl	MEM_Phy2Vir
	mov	x20, x0
	cbz	x0, .L518
	ldr	w2, [x19, 44]
	sub	w0, w2, #1
	cmp	w0, 199
	bhi	.L519
	ldr	w3, [x19, 64]
	mov	w4, 0
	ldp	w2, w0, [x19, 28]
	ldrb	w5, [x19]
	lsl	w2, w2, w3
	lsl	w0, w0, w3
	add	w1, w2, 255
	cmp	w5, 1
	and	w1, w1, -256
	lsl	w3, w1, 4
	beq	.L520
	ldr	w2, [x19, 4]
	cmp	w2, 16
	beq	.L481
.L529:
	add	w0, w0, 31
	mov	w23, 8
	and	w0, w0, -32
	madd	w0, w0, w1, w4
.L504:
	ldr	w2, [x19, 20]
	mov	w1, w3
	str	w2, [x20]
	ldr	w2, [x19, 20]
	add	w2, w0, w2
	str	w2, [x20, 4]
	ldr	w2, [x19, 8]
	str	w2, [x20, 8]
	ldr	w2, [x19, 8]
	add	w0, w0, w2
	str	w0, [x20, 12]
	ldrb	w0, [x19, 1]
	cbnz	w0, .L521
.L483:
	str	w1, [x20, 16]
	mov	w3, 0
	str	w4, [x20, 20]
	mov	w2, 0
	ldp	w1, w0, [x19, 28]
	sub	w0, w0, #1
	sub	w1, w1, #1
	bfi	w2, w0, 0, 9
	bfi	w3, w1, 0, 9
	strh	w2, [x29, 74]
	strh	w3, [x29, 72]
	ldr	w0, [x29, 72]
	str	w0, [x20, 24]
	ldr	w0, [x19, 52]
	ldp	w21, w22, [x19, 28]
	sub	w0, w0, #1
	cmp	w0, 1
	bls	.L522
.L485:
	ldr	w0, [x19, 56]
	mov	w11, 0
	cbz	w0, .L523
.L486:
	cmp	w0, 1
	beq	.L502
.L528:
	sub	w11, w11, #1
	uxth	w11, w11
.L503:
	ldr	w3, [x19, 64]
	ldrb	w4, [x19]
	ldr	w2, [x19, 52]
	sub	w3, w3, #4
	ldrb	w1, [x29, 74]
	ldrb	w0, [x29, 75]
	and	w2, w2, 3
	bfi	w1, w4, 0, 1
	strh	w11, [x29, 72]
	bfi	w0, w3, 0, 2
	ldrb	w3, [x19, 1]
	bfi	w1, w2, 4, 2
	bfi	w0, w23, 2, 4
	bfi	w1, w2, 6, 2
	bfi	w0, w3, 6, 1
	strb	w1, [x29, 74]
	strb	w0, [x29, 75]
	mov	w0, 0
	ldr	w1, [x29, 72]
	str	w1, [x20, 28]
.L516:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L521:
	add	w0, w3, 15
	cmp	w3, wzr
	csel	w1, w0, w3, lt
	asr	w1, w1, 4
	b	.L483
	.p2align 3
.L523:
	ldr	w0, [x19, 64]
	cmp	w0, 6
	beq	.L507
	cmp	w0, 5
	beq	.L508
	cmp	w0, 4
	mov	w2, 8
	beq	.L487
	ldr	x1, .LC203
	mov	w0, 1
	bl	dprint_vfmw
	mov	w2, 1
.L487:
	ldr	w8, [x19, 44]
	cmp	w8, wzr
	ble	.L517
	mul	w12, w22, w21
	mov	w4, 0
	mov	w6, 0
	sub	w13, w12, #1
	mov	w11, 0
	sub	w9, w2, #1
	b	.L490
	.p2align 3
.L526:
	ldrsh	w6, [x10, 74]
	sub	w6, w6, #1
	add	w6, w6, w2
	udiv	w6, w6, w2
	mul	w6, w6, w2
	cmp	w0, w6
	bgt	.L493
.L492:
	add	w4, w4, 1
	cmp	w4, w8
	bge	.L524
.L501:
	cmp	w4, 199
	bgt	.L525
.L490:
	add	x10, x19, x4, sxtw 2
	cmp	w4, wzr
	ldrsh	w1, [x10, 78]
	sub	w0, w1, #1
	add	w0, w0, w2
	udiv	w0, w0, w2
	mul	w0, w0, w2
	bgt	.L526
	ccmp	w0, w6, 0, ne
	ble	.L492
.L495:
	ldrsh	w1, [x10, 76]
	cmp	w12, w0
	csel	w0, w0, w13, hi
	add	w5, w11, 1
	udiv	w1, w1, w2
	mul	w1, w1, w2
	cmp	w1, w0
	csel	w1, w1, wzr, le
	cmp	w5, 250
	bgt	.L527
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
	blt	.L501
.L524:
	ldr	w0, [x19, 56]
	cmp	w0, 1
	bne	.L528
	.p2align 2
.L502:
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
	b	.L503
	.p2align 3
.L520:
	adds	w4, w2, 2047
	add	w2, w2, 4094
	csel	w2, w2, w4, mi
	add	w5, w0, 126
	and	w2, w2, -2048
	cmp	w2, wzr
	add	w4, w2, 127
	csel	w2, w4, w2, lt
	adds	w6, w0, 63
	csel	w4, w5, w6, mi
	asr	w2, w2, 7
	asr	w4, w4, 6
	lsl	w4, w4, 5
	mul	w4, w2, w4
	ldr	w2, [x19, 4]
	cmp	w2, 16
	bne	.L529
.L481:
	madd	w0, w0, w1, w4
	mov	w23, 10
	b	.L504
	.p2align 3
.L522:
	add	w22, w22, w22, lsr 31
	asr	w22, w22, 1
	b	.L485
	.p2align 3
.L496:
	udiv	w0, w0, w2
	ldrsh	w1, [x5, 80]
	udiv	w1, w1, w2
	mul	w0, w0, w2
	mul	w1, w1, w2
	cmp	w0, w1
	add	w14, w1, 1
	bhi	.L497
	sub	w1, w4, #1
	cmp	w0, w14
	add	x1, x19, x1, sxtw 2
	beq	.L497
	ldrsh	w1, [x1, 78]
	sub	w1, w1, #1
	add	w1, w1, w2
	udiv	w1, w1, w2
	mul	w1, w1, w2
	cmp	w0, w1
	bhi	.L495
.L497:
	cmp	w7, 199
	mov	w4, w3
	bgt	.L530
	ldrsh	w1, [x5, 82]
.L493:
	add	w3, w4, 1
	add	x5, x19, x4, sxtw 2
	cmp	w8, w3
	add	w0, w9, w1
	add	w7, w3, 1
	bgt	.L496
	udiv	w0, w0, w2
	mul	w0, w0, w2
	b	.L495
.L508:
	mov	w2, 4
	b	.L487
	.p2align 3
.L530:
	add	x0, x19, x3, sxtw 2
	ldrsh	w0, [x0, 78]
	sub	w0, w0, #1
	add	w0, w0, w2
	udiv	w0, w0, w2
	mul	w0, w0, w2
	b	.L495
.L525:
	ldr	x2, .LC198
	mov	w3, 2105
	ldr	x1, .LC205
	mov	w0, 0
	add	x2, x2, 752
	bl	dprint_vfmw
.L517:
	mov	w11, 0
	ldr	w0, [x19, 56]
	b	.L486
.L507:
	mov	w2, 2
	b	.L487
.L527:
	mov	w0, 1
	str	w0, [x19, 56]
	b	.L502
.L519:
	ldr	x1, .LC201
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L516
.L518:
	ldr	x2, .LC198
	mov	w0, 0
	ldr	x3, .LC197
	ldr	x1, .LC199
	add	x2, x2, 728
	bl	dprint_vfmw
	mov	w0, -1
	b	.L516
	.size	VDMHAL_V5R2C1_CfgRpMsg, .-VDMHAL_V5R2C1_CfgRpMsg
	.align	3
.LC197:
	.xword	.LC196
	.align	3
.LC198:
	.xword	.LANCHOR0
	.align	3
.LC199:
	.xword	.LC7
	.align	3
.LC201:
	.xword	.LC200
	.align	3
.LC203:
	.xword	.LC202
	.align	3
.LC205:
	.xword	.LC204
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_CfgRpReg
	.type	VDMHAL_V5R2C1_CfgRpReg, %function
VDMHAL_V5R2C1_CfgRpReg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x0, x30
	mov	w21, w3
	mov	x22, x1
	mov	x20, x4
	bl	_mcount
	str	wzr, [x29, 60]
	cmp	w21, wzr
	bgt	.L557
	ldr	x0, [x22]
	cbz	x0, .L558
.L534:
	ldr	x19, .LC209
	ldr	w3, [x22, 64]
	ldrb	w0, [x19]
	and	w3, w3, -16
	str	w3, [x29, 60]
	cmp	w0, 1
	beq	.L559
	mov	x0, x20
	mov	w2, 16
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	mov	w3, 53763
	movk	w3, 0x2000, lsl 16
	str	w3, [x29, 60]
	cmp	w0, 1
	beq	.L560
	mov	x0, x20
	mov	w2, 12
	mov	w1, 2
	mov	w22, 3075
	movk	w22, 0x30, lsl 16
	bl	VDH_Record_RegData
	str	w22, [x29, 60]
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L561
	mov	x0, x20
	mov	w3, w22
	mov	w2, 60
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L562
	mov	x0, x20
	mov	w3, w22
	mov	w2, 64
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L563
	mov	x0, x20
	mov	w3, w22
	mov	w2, 68
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L564
	mov	x0, x20
	mov	w3, w22
	mov	w2, 72
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L565
	mov	x0, x20
	mov	w3, w22
	mov	w2, 76
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L566
	mov	x0, x20
	mov	w3, w22
	mov	w2, 80
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L567
	mov	x0, x20
	mov	w3, w22
	mov	w2, 84
	mov	w1, 2
	bl	VDH_Record_RegData
	mov	w0, 0
.L554:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L559:
	sxtw	x1, w21
	ldr	x2, .LC210
	lsl	x0, x1, 6
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x4, x0, x1
	add	x0, x0, x4, lsl 2
	ldr	x0, [x2, x0]
	str	w3, [x0, 16]
.L537:
	lsl	x0, x1, 6
	mov	w4, 53763
	sub	x0, x0, x1
	movk	w4, 0x2000, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 12]
.L539:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 60]
.L541:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 64]
.L543:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 68]
.L545:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 72]
.L547:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 76]
.L549:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 80]
.L551:
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
.L558:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L535
	str	x0, [x22]
	b	.L534
	.p2align 3
.L557:
	ldr	x2, .LC206
	mov	w4, 0
	ldr	x1, .LC207
	mov	w3, w21
	add	x2, x2, 776
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L554
.L535:
	ldr	x1, .LC208
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L554
.L564:
	ldr	x2, .LC210
	sxtw	x1, w21
	b	.L545
.L563:
	ldr	x2, .LC210
	sxtw	x1, w21
	b	.L543
.L562:
	ldr	x2, .LC210
	sxtw	x1, w21
	b	.L541
.L561:
	ldr	x2, .LC210
	sxtw	x1, w21
	b	.L539
.L566:
	ldr	x2, .LC210
	sxtw	x1, w21
	b	.L549
.L565:
	ldr	x2, .LC210
	sxtw	x1, w21
	b	.L547
.L567:
	ldr	x2, .LC210
	sxtw	x1, w21
	b	.L551
.L560:
	ldr	x2, .LC210
	sxtw	x1, w21
	b	.L537
	.size	VDMHAL_V5R2C1_CfgRpReg, .-VDMHAL_V5R2C1_CfgRpReg
	.align	3
.LC206:
	.xword	.LANCHOR0
	.align	3
.LC207:
	.xword	.LC85
	.align	3
.LC208:
	.xword	.LC118
	.align	3
.LC209:
	.xword	g_HalDisable
	.align	3
.LC210:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_MakeDecReport
	.type	VDMHAL_V5R2C1_MakeDecReport, %function
VDMHAL_V5R2C1_MakeDecReport:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L598
	ldr	x23, [x19, 8]
	ldr	w21, [x19]
	ldr	w22, [x19, 16]
	cbz	x23, .L599
	sxtw	x22, w22
	ldr	x20, .LC219
	lsl	x0, x22, 6
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x1, x0, x22
	add	x0, x0, x1, lsl 2
	ldr	x0, [x20, x0]
	cbz	x0, .L572
	ldr	x2, .LC220
	add	x0, x2, 4
	add	x2, x2, 128
	ldr	w1, [x2, -128]
	cmp	w1, 1
	bne	.L575
	b	.L587
	.p2align 3
.L601:
	cmp	x0, x2
	beq	.L600
.L575:
	ldr	w1, [x0]
	add	x0, x0, 4
	cmp	w1, 1
	bne	.L601
.L587:
	mov	w19, w1
.L573:
	ldr	x3, .LC224
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
	ldr	x4, .LC225
	add	x2, x0, x3, lsl 2
	add	x2, x20, x2
	add	x1, x4, x1, lsl 2
	ldr	w0, [x2, 40]
	str	w0, [x23, 4]
	ldr	w1, [x1, 4]
	ubfx	x0, x1, 17, 2
	cmp	w0, 1
	beq	.L588
	and	w1, w1, 131072
	cmp	w1, wzr
	ccmp	w21, 3, 0, ne
	cset	w1, ne
.L576:
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
	beq	.L602
.L577:
	cmp	w2, 200
	bhi	.L603
.L579:
	lsl	x0, x22, 6
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x1, x0, x22
	add	x0, x0, x1, lsl 2
	add	x20, x20, x0
	ldr	w21, [x20, 56]
	mov	w0, w21
	bl	MEM_Phy2Vir
	cbz	x0, .L604
	lsl	x3, x22, 2
	ldr	x19, .LC230
	sub	x3, x3, x22
	ldr	w2, [x23, 12]
	mov	x1, x0
	add	x20, x22, x3, lsl 3
	lsl	w2, w2, 2
	lsl	x24, x20, 7
	add	x0, x19, x24
	bl	VDMHAL_V5R2C1_ReadMsgSlot
	ldr	w1, [x19, x24]
	ldr	w0, [x23, 12]
	lsr	w1, w1, 31
	str	w1, [x23, 16]
	cbz	w0, .L584
	sub	w2, w0, #1
	mov	x5, 26
	add	x1, x23, 22
	mov	w0, 2
	add	x5, x5, x2, uxtw 2
	lsl	x3, x20, 5
	add	x5, x23, x5
	.p2align 2
.L583:
	sub	w2, w0, #1
	add	x4, x3, x0, uxtw
	add	x2, x3, x2
	add	w0, w0, 4
	ldr	w2, [x19, x2, lsl 2]
	strh	w2, [x1, -2]
	ldr	w2, [x19, x4, lsl 2]
	strh	w2, [x1], 4
	cmp	x5, x1
	bne	.L583
.L584:
	mov	w0, 6
	bl	IsDprintTypeEnable
	cbnz	w0, .L605
.L570:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L602:
	cmp	w19, 1
	beq	.L606
	ldr	x1, .LC226
	ldrb	w1, [x1]
	cbnz	w1, .L577
	ldrb	w0, [x0, 19]
	and	w0, w0, 3
	cmp	w0, 2
	bne	.L577
	mov	w0, 1
	strh	wzr, [x23, 20]
	str	w0, [x23, 12]
	mov	w0, 0
	strh	wzr, [x23, 22]
	b	.L570
	.p2align 3
.L600:
	mov	w19, 0
	b	.L573
	.p2align 3
.L605:
	ldr	x1, .LC232
	mov	w0, 6
	ldr	w2, [x23, 12]
	mov	w20, 0
	bl	dprint_vfmw
	mov	w2, w21
	ldr	x1, .LC234
	lsl	x21, x22, 2
	mov	w0, 6
	sub	x21, x21, x22
	bl	dprint_vfmw
	ldr	x24, .LC236
	add	x21, x22, x21, lsl 3
	lsl	x21, x21, 5
	.p2align 2
.L585:
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
	bhi	.L585
	ldr	x1, .LC238
	mov	w0, 6
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L588:
	mov	w1, 0
	b	.L576
	.p2align 3
.L603:
	ldr	x1, .LC228
	mov	w3, 200
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x23, 12]
	b	.L579
	.p2align 3
.L606:
	ldr	w0, [x0, 16]
	ubfx	x0, x0, 21, 2
	cmp	w0, 2
	bne	.L577
	strh	wzr, [x23, 20]
	mov	w0, 0
	strh	wzr, [x23, 22]
	str	w19, [x23, 12]
	b	.L570
.L604:
	ldr	x2, .LC215
	ldr	x3, .LC229
	ldr	x1, .LC216
	add	x2, x2, 800
	bl	dprint_vfmw
	mov	w0, -1
	b	.L570
.L572:
	ldr	x2, .LC215
	ldr	x3, .LC221
.L596:
	ldr	x1, .LC216
	mov	w0, 0
	add	x2, x2, 800
	bl	dprint_vfmw
	mov	w0, -1
	b	.L570
.L599:
	ldr	x2, .LC215
	ldr	x3, .LC218
	b	.L596
.L598:
	ldr	x2, .LC215
	ldr	x3, .LC214
	b	.L596
	.size	VDMHAL_V5R2C1_MakeDecReport, .-VDMHAL_V5R2C1_MakeDecReport
	.align	3
.LC214:
	.xword	.LC213
	.align	3
.LC215:
	.xword	.LANCHOR0
	.align	3
.LC216:
	.xword	.LC7
	.align	3
.LC218:
	.xword	.LC217
	.align	3
.LC219:
	.xword	g_HwMem
	.align	3
.LC220:
	.xword	g_DSPState
	.align	3
.LC221:
	.xword	.LC156
	.align	3
.LC224:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC225:
	.xword	g_BackUp
	.align	3
.LC226:
	.xword	g_not_allow_H264FullPictureRepair_flag
	.align	3
.LC228:
	.xword	.LC227
	.align	3
.LC229:
	.xword	.LC184
	.align	3
.LC230:
	.xword	g_UpMsg
	.align	3
.LC232:
	.xword	.LC231
	.align	3
.LC234:
	.xword	.LC233
	.align	3
.LC236:
	.xword	.LC235
	.align	3
.LC238:
	.xword	.LC237
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_PrepareRepair
	.type	VDMHAL_V5R2C1_PrepareRepair, %function
VDMHAL_V5R2C1_PrepareRepair:
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
	mov	x23, x1
	mov	w27, w2
	mov	x24, x4
	bl	_mcount
	ldr	x25, .LC239
	lsl	x0, x19, 6
	cmp	w19, wzr
	sub	x0, x0, x19
	mov	x21, x19
	lsl	x0, x0, 2
	sub	x20, x0, x19
	add	x20, x0, x20, lsl 2
	add	x26, x20, x25
	bgt	.L626
	ldr	x0, [x20, x25]
	cbz	x0, .L627
	cbz	w27, .L628
.L612:
	cmp	w27, 1
	mov	w0, 0
	beq	.L629
.L609:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L627:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L611
	str	x0, [x20, x25]
	cbnz	w27, .L612
	.p2align 2
.L628:
	lsl	x0, x19, 3
	ldr	x20, .LC244
	sub	x0, x0, x19
	lsl	x0, x0, 3
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	add	x0, x20, x0, lsl 3
	ldr	w1, [x0, 44]
	cmp	w1, wzr
	ble	.L613
	cmp	w22, 6
	beq	.L630
.L614:
	lsl	x2, x19, 3
	sub	x2, x2, x19
	lsl	x2, x2, 3
	sub	x2, x2, x19
	lsl	x2, x2, 2
	sub	x2, x2, x19
	lsl	x2, x2, 3
	add	x1, x20, x2
	ldr	w0, [x1, 28]
	ldr	w3, [x1, 64]
	lsl	w0, w0, w3
	cmp	w0, 1920
	bgt	.L616
	ldr	w0, [x1, 4]
	cmp	w0, 17
	beq	.L616
	mov	w0, 1
	strb	wzr, [x20, x2]
	strb	w0, [x1, 1]
	mov	x1, x23
	mov	w0, w22
	bl	VDMHAL_UpateDecParam.constprop.10
.L616:
	mov	x4, x24
	mov	w3, w21
	mov	x2, x23
	mov	x1, x26
	mov	w0, w22
	bl	VDMHAL_V5R2C1_CfgRpReg
	lsl	x0, x19, 3
	mov	w2, w21
	sub	x0, x0, x19
	mov	x1, x26
	lsl	x0, x0, 3
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	add	x0, x20, x0, lsl 3
	bl	VDMHAL_V5R2C1_CfgRpMsg
	ldr	x27, [sp, 80]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L629:
	cmp	w22, 6
	bne	.L617
	ldrb	w0, [x23, 17]
	cmp	w0, 1
	bne	.L617
	lsl	x0, x19, 3
	ldr	x2, .LC244
	sub	x0, x0, x19
	lsl	x0, x0, 3
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	lsl	x19, x19, 3
	add	x1, x2, x19
	ldr	w0, [x1, 920]
	cmp	w0, wzr
	ble	.L617
	ldr	w0, [x1, 28]
	add	x20, x19, 876
	ldr	w3, [x1, 64]
	add	x20, x20, x2
	lsl	w0, w0, w3
	cmp	w0, 1920
	mov	w0, 2
	str	w0, [x1, 928]
	bgt	.L618
	ldr	w0, [x1, 4]
	cmp	w0, 17
	beq	.L618
	strb	w27, [x1, 1]
	mov	w0, w22
	mov	x1, x23
	strb	wzr, [x2, x19]
	bl	VDMHAL_UpateDecParam.constprop.10
.L618:
	mov	x4, x24
	mov	w3, w21
	mov	x2, x23
	mov	x1, x26
	mov	w0, 6
	bl	VDMHAL_V5R2C1_CfgRpReg
	mov	w2, w21
	mov	x1, x26
	mov	x0, x20
	bl	VDMHAL_V5R2C1_CfgRpMsg
	ldr	x27, [sp, 80]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L630:
	ldrb	w1, [x23, 17]
	mov	w2, 0
	cmp	w1, 1
	csel	w1, w1, w2, eq
	str	w1, [x0, 928]
	b	.L614
	.p2align 3
.L626:
	ldr	x2, .LC240
	mov	w4, 0
	ldr	x1, .LC241
	mov	w3, w19
	add	x2, x2, 832
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L609
	.p2align 3
.L617:
	ldr	x1, .LC248
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L609
.L613:
	ldr	x1, .LC246
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L609
.L611:
	ldr	x1, .LC243
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L609
	.size	VDMHAL_V5R2C1_PrepareRepair, .-VDMHAL_V5R2C1_PrepareRepair
	.align	3
.LC239:
	.xword	g_HwMem
	.align	3
.LC240:
	.xword	.LANCHOR0
	.align	3
.LC241:
	.xword	.LC85
	.align	3
.LC243:
	.xword	.LC242
	.align	3
.LC244:
	.xword	g_RepairParam
	.align	3
.LC246:
	.xword	.LC245
	.align	3
.LC248:
	.xword	.LC247
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_StartHwRepair
	.type	VDMHAL_V5R2C1_StartHwRepair, %function
VDMHAL_V5R2C1_StartHwRepair:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	sxtw	x20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x21, .LC249
	ldrb	w4, [x21]
	cmp	w4, 1
	bne	.L655
	cmp	w20, wzr
	ble	.L656
	ldr	x22, .LC251
	mov	w3, w20
	ldr	x23, .LC252
	mov	w0, 32
	add	x2, x22, 864
	mov	x1, x23
	bl	dprint_vfmw
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L639
	mov	x0, x19
	mov	w3, -2
	mov	w2, 36
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L652
.L634:
	cbz	x19, .L657
.L648:
	ldr	x1, .LC255
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
.L631:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L656:
	sxtw	x0, w20
	ldr	x3, .LC250
	lsl	x1, x0, 6
	mov	w4, 67108864
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x2, x1, x0
	add	x1, x1, x2, lsl 2
	ldr	x1, [x3, x1]
	str	w4, [x1, 8]
.L637:
	lsl	x1, x0, 6
	mov	w2, -2
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x0, x1, x0
	add	x0, x1, x0, lsl 2
	ldr	x0, [x3, x0]
	str	w2, [x0, 36]
.L635:
	ldr	x0, .LC256
	ldr	x0, [x0, 224]
	blr	x0
	cmp	w20, wzr
	ble	.L651
	ldr	x22, .LC251
	ldr	x23, .LC252
.L644:
	add	x22, x22, 880
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
	b	.L631
	.p2align 3
.L633:
	cmp	w20, wzr
	ble	.L649
	ldr	x22, .LC251
	ldr	x23, .LC252
.L639:
	mov	w4, 1
	mov	w3, w20
	add	x2, x22, 864
	mov	x1, x23
	mov	w0, 32
	bl	dprint_vfmw
	ldrb	w0, [x21]
	cmp	w0, 1
	bne	.L634
.L652:
	ldr	x0, .LC256
	ldr	x0, [x0, 224]
	blr	x0
	b	.L644
	.p2align 3
.L655:
	mov	x0, x19
	mov	w3, 67108864
	mov	w2, 8
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L633
	mov	x0, x19
	mov	w3, -2
	mov	w2, 36
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L635
	cbnz	x19, .L648
.L657:
	ldr	x2, .LC251
	mov	x3, 0
	ldr	x1, .LC254
	mov	w0, 0
	add	x2, x2, 880
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L651:
	lsl	x0, x20, 6
	ldr	x1, .LC250
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
	b	.L631
.L649:
	ldr	x3, .LC250
	sxtw	x0, w20
	b	.L637
	.size	VDMHAL_V5R2C1_StartHwRepair, .-VDMHAL_V5R2C1_StartHwRepair
	.align	3
.LC249:
	.xword	g_HalDisable
	.align	3
.LC250:
	.xword	g_HwMem
	.align	3
.LC251:
	.xword	.LANCHOR0
	.align	3
.LC252:
	.xword	.LC99
	.align	3
.LC254:
	.xword	.LC253
	.align	3
.LC255:
	.xword	g_VdmDrvParam
	.align	3
.LC256:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_CalVdhClkSkip
	.type	VDMHAL_V5R2C1_CalVdhClkSkip, %function
VDMHAL_V5R2C1_CalVdhClkSkip:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x0, x30
	bl	_mcount
	ldr	x24, .LC258
	ldr	w28, [x24, 128]
	tbnz	w28, #31, .L690
	ldr	x25, .LC261
	add	x20, x24, 132
	ldr	x27, .LC264
	add	x24, x24, 256
	ldr	x26, .LC263
	mov	w23, 30
	mov	w22, 0
	mov	w21, 0
	add	x25, x25, 912
	mov	w19, 0
	b	.L661
	.p2align 3
.L693:
	mov	w3, w28
	mov	x2, x25
	mov	x1, x26
	mov	w0, 1
	bl	dprint_vfmw
.L663:
	cmp	x24, x20
	beq	.L691
.L680:
	ldr	w28, [x20], 4
	tbnz	w28, #31, .L692
.L661:
	mov	w0, w28
	bl	VCTRL_IsChanActive
	cbnz	w0, .L693
	mov	w0, w28
	bl	FSP_GetInst
	cbz	x0, .L664
	ldp	w1, w0, [x0, 40]
	adds	w19, w1, 15
	add	w1, w1, 30
	add	w21, w0, 30
	csel	w19, w1, w19, mi
	adds	w0, w0, 15
	asr	w19, w19, 4
	csel	w0, w21, w0, mi
	asr	w21, w0, 4
.L664:
	ldr	x1, [x27, w28, sxtw 3]
	mov	w0, w28
	ldr	w1, [x1, 1712]
	cmp	w1, 31
	csel	w23, w23, w1, lt
	bl	VCTRL_GetVidStd
	cmp	w0, 17
	bls	.L694
.L683:
	cmp	x24, x20
	mov	w22, 0
	bne	.L680
.L691:
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
.L694:
	ldr	x1, .LC265
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx667
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx667:
	.section	.rodata
	.align	0
	.align	2
.L667:
	.byte	(.L676 - .Lrtx667) / 4
	.byte	(.L676 - .Lrtx667) / 4
	.byte	(.L676 - .Lrtx667) / 4
	.byte	(.L676 - .Lrtx667) / 4
	.byte	(.L683 - .Lrtx667) / 4
	.byte	(.L676 - .Lrtx667) / 4
	.byte	(.L676 - .Lrtx667) / 4
	.byte	(.L683 - .Lrtx667) / 4
	.byte	(.L676 - .Lrtx667) / 4
	.byte	(.L676 - .Lrtx667) / 4
	.byte	(.L676 - .Lrtx667) / 4
	.byte	(.L676 - .Lrtx667) / 4
	.byte	(.L676 - .Lrtx667) / 4
	.byte	(.L676 - .Lrtx667) / 4
	.byte	(.L683 - .Lrtx667) / 4
	.byte	(.L677 - .Lrtx667) / 4
	.byte	(.L676 - .Lrtx667) / 4
	.byte	(.L676 - .Lrtx667) / 4
	.text
	.p2align 3
.L676:
	mul	w22, w19, w21
	mul	w22, w22, w23
	b	.L663
	.p2align 3
.L692:
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
.L659:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L677:
	mul	w22, w19, w21
	mul	w22, w22, w23
	lsl	w22, w22, 1
	b	.L663
.L690:
	mov	w0, 25
	b	.L659
	.size	VDMHAL_V5R2C1_CalVdhClkSkip, .-VDMHAL_V5R2C1_CalVdhClkSkip
	.align	3
.LC258:
	.xword	g_ChanCtx
	.align	3
.LC261:
	.xword	.LANCHOR0
	.align	3
.LC263:
	.xword	.LC262
	.align	3
.LC264:
	.xword	s_pstVfmwChan
	.align	3
.LC265:
	.xword	.L667
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_GetVdmClk
	.type	VDMHAL_V5R2C1_GetVdmClk, %function
VDMHAL_V5R2C1_GetVdmClk:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, 3
	bls	.L703
.L696:
	ldr	x0, .LC268
	sbfiz	x19, x19, 6, 32
	mov	w1, 500
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L703:
	ldr	x0, .LC267
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx698
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx698:
	.section	.rodata
	.align	0
	.align	2
.L698:
	.byte	(.L697 - .Lrtx698) / 4
	.byte	(.L696 - .Lrtx698) / 4
	.byte	(.L700 - .Lrtx698) / 4
	.byte	(.L701 - .Lrtx698) / 4
	.text
	.p2align 3
.L700:
	ldr	x0, .LC268
	sbfiz	x19, x19, 6, 32
	mov	w1, 540
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L697:
	ldr	x0, .LC268
	sbfiz	x19, x19, 6, 32
	mov	w1, 450
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L701:
	ldr	x0, .LC268
	sbfiz	x19, x19, 6, 32
	mov	w1, 600
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_V5R2C1_GetVdmClk, .-VDMHAL_V5R2C1_GetVdmClk
	.align	3
.LC267:
	.xword	.L698
	.align	3
.LC268:
	.xword	g_VdmDrvParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_StartHwDecode
	.type	VDMHAL_V5R2C1_StartHwDecode, %function
VDMHAL_V5R2C1_StartHwDecode:
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
	bgt	.L753
	ldr	x25, .LC271
	sxtw	x21, w20
	ldr	x24, .LC272
	mov	w26, 0
	add	x0, x25, x21, lsl 6
	ldr	w23, [x0, 8]
	ldr	x0, [x24, w23, sxtw 3]
	ldr	w1, [x0, 1700]
	cmp	w1, 1
	beq	.L754
.L707:
	ldr	x22, .LC276
	ldrb	w0, [x22]
	cmp	w0, 1
	bne	.L755
	ldr	x1, .LC277
	ldr	x2, [x1]
	ldr	w1, [x2, 120]
	ubfx	x3, x1, 8, 2
	cmp	w26, w3
	beq	.L746
	bfi	w1, w26, 8, 2
	str	w1, [x2, 120]
.L746:
	ldr	x1, .LC278
	ldrh	w1, [x1,w26,uxtw #1]
	adr	x2, .Lrtx715
	add	x1, x2, w1, sxth #2
	br	x1
.Lrtx715:
	.section	.rodata
	.align	0
	.align	2
.L715:
	.2byte	(.L714 - .Lrtx715) / 4
	.2byte	(.L716 - .Lrtx715) / 4
	.2byte	(.L717 - .Lrtx715) / 4
	.2byte	(.L718 - .Lrtx715) / 4
	.text
	.p2align 3
.L755:
	mov	x0, x19
	mov	w3, w26
	mov	w2, 0
	mov	w1, 0
	bl	VDH_Record_RegData
	ldrb	w0, [x22]
	b	.L746
	.p2align 3
.L753:
	ldr	x2, .LC269
	mov	w4, 0
	ldr	x1, .LC270
	mov	w3, w20
	add	x2, x2, 944
	mov	w0, 0
	bl	dprint_vfmw
.L704:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L754:
	ldr	w0, [x0, 672]
	cmp	w0, 17
	bne	.L707
	ldr	x0, .LC273
	ldr	x0, [x0, w23, sxtw 3]
	ldr	w1, [x0, 40]
	cmp	w1, 3839
	bgt	.L708
	ldr	w0, [x0, 44]
	cmp	w0, 2159
	ble	.L707
.L708:
	ldr	x2, .LC274
	mov	w0, 12320
	mov	w1, 65536
	movk	w0, 0xf8a2, lsl 16
	ldr	x2, [x2, 304]
	blr	x2
	ldr	x1, .LC275
	ldr	x1, [x1]
	ldr	w1, [x1, 196]
	lsr	w1, w1, 24
	cmp	w1, 3
	beq	.L739
	cmp	w1, 2
	beq	.L740
	mov	w2, 221
	mov	w3, 221
	movk	w2, 0x71, lsl 16
	movk	w3, 0x89, lsl 16
	cmp	w1, 1
	csel	w1, w2, w3, ne
.L709:
	mov	w26, 2
	str	w1, [x0]
	b	.L707
	.p2align 3
.L717:
	add	x1, x25, x21, lsl 6
	mov	w2, 540
	str	w2, [x1, 16]
.L719:
	ldr	x1, [x24, w23, sxtw 3]
	cmp	w0, 1
	ldr	w24, [x1, 1352]
	bne	.L756
.L720:
	ldr	x0, .LC277
	mov	x3, x19
	mov	w2, w20
	ldr	x0, [x0]
	ldr	w1, [x0, 120]
	and	w1, w1, -258049
	str	w1, [x0, 120]
	ldr	w1, [x0, 120]
	orr	w1, w1, 131072
	str	w1, [x0, 120]
	mov	w0, 12
	mov	w1, 3
	bl	SCD_ConfigReg
	ldrb	w0, [x22]
	cmp	w0, 1
	beq	.L757
.L732:
	mov	w1, 2
	mov	x0, x19
	mov	w3, -1431655766
	mov	w2, 156
	bl	VDH_Record_RegData
	ldr	x1, .LC279
	ldrb	w0, [x22]
	ldr	w1, [x1]
	cmp	w1, 1
	beq	.L758
.L723:
	mov	w3, 0
.L722:
	cmp	w0, 1
	beq	.L759
	mov	x0, x19
	mov	w2, 61472
	mov	w1, 2
	bl	VDH_Record_RegData
	cmp	w24, 1
	ldrb	w0, [x22]
	beq	.L760
.L726:
	mov	w3, -2
.L725:
	cmp	w0, 1
	beq	.L761
	mov	x0, x19
	mov	w2, 36
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x22]
	cmp	w0, 1
	beq	.L762
	cbz	x19, .L763
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
.L760:
	mov	w3, -6
	b	.L725
	.p2align 3
.L758:
	mov	w3, 15
	b	.L722
	.p2align 3
.L716:
	add	x1, x25, x21, lsl 6
	mov	w2, 500
	cmp	w0, 1
	str	w2, [x1, 16]
	ldr	x1, [x24, w23, sxtw 3]
	ldr	w24, [x1, 1352]
	beq	.L720
.L756:
	mov	w3, 0
	mov	w2, 1
	mov	w1, 0
	mov	x0, x19
	bl	VDH_Record_RegData
	mov	w0, 12
	mov	x3, x19
	mov	w2, w20
	mov	w1, 3
	bl	SCD_ConfigReg
	ldrb	w0, [x22]
	cmp	w0, 1
	bne	.L732
.L757:
	ldr	x2, .LC279
	lsl	x1, x21, 6
	sub	x1, x1, x21
	ldr	x26, .LC280
	lsl	x1, x1, 2
	ldr	w2, [x2]
	cmp	w2, 1
	sub	x2, x1, x21
	add	x1, x1, x2, lsl 2
	mov	w2, -1431655766
	ldr	x1, [x26, x1]
	str	w2, [x1, 156]
	bne	.L723
	mov	w3, 15
	b	.L724
	.p2align 3
.L714:
	add	x1, x25, x21, lsl 6
	mov	w2, 450
	str	w2, [x1, 16]
	b	.L719
	.p2align 3
.L718:
	add	x1, x25, x21, lsl 6
	mov	w2, 600
	str	w2, [x1, 16]
	b	.L719
	.p2align 3
.L759:
	ldr	x26, .LC280
.L724:
	lsl	x0, x21, 6
	cmp	w24, 1
	sub	x0, x0, x21
	lsl	x0, x0, 2
	sub	x1, x0, x21
	add	x0, x0, x1, lsl 2
	ldr	x0, [x26, x0]
	add	x0, x0, 61440
	str	w3, [x0, 32]
	beq	.L745
	mov	w0, 1
	b	.L726
	.p2align 3
.L761:
	ldr	x26, .LC280
.L727:
	lsl	x1, x21, 6
	ldr	x19, .LC274
	sub	x1, x1, x21
	mov	x0, 30
	lsl	x1, x1, 2
	sub	x2, x1, x21
	add	x1, x1, x2, lsl 2
	ldr	x1, [x26, x1]
	str	w3, [x1, 36]
	ldr	x1, [x19, 232]
	blr	x1
	ldr	x0, [x19, 224]
	blr	x0
.L730:
	lsl	x0, x21, 6
	mov	w2, 1
	sub	x1, x0, x21
	add	x25, x25, x0
	lsl	x0, x1, 2
	ldr	x3, .LC282
	sub	x21, x0, x21
	mov	w1, 4
	add	x21, x0, x21, lsl 2
	ldr	x0, [x26, x21]
	str	wzr, [x0]
	ldr	x0, [x26, x21]
	str	w2, [x0]
	ldr	x0, [x26, x21]
	str	wzr, [x0]
	ldr	w2, [x25, 8]
	mov	w0, w2
	ldr	w2, [x3, w2, sxtw 2]
	bl	VDEC_Lowdelay_Event_Time
	b	.L704
	.p2align 3
.L763:
	ldr	x2, .LC269
	mov	x3, 0
	ldr	x1, .LC281
	mov	w0, 0
	add	x2, x2, 944
	bl	dprint_vfmw
	b	.L704
	.p2align 3
.L745:
	mov	w3, -6
	b	.L727
.L739:
	mov	w1, 221
	movk	w1, 0x71, lsl 16
	b	.L709
.L740:
	mov	w1, 221
	movk	w1, 0x7d, lsl 16
	b	.L709
.L762:
	ldr	x19, .LC274
	mov	x0, 30
	ldr	x1, [x19, 232]
	blr	x1
	ldr	x0, [x19, 224]
	blr	x0
	ldr	x26, .LC280
	b	.L730
	.size	VDMHAL_V5R2C1_StartHwDecode, .-VDMHAL_V5R2C1_StartHwDecode
	.align	3
.LC269:
	.xword	.LANCHOR0
	.align	3
.LC270:
	.xword	.LC85
	.align	3
.LC271:
	.xword	g_VdmDrvParam
	.align	3
.LC272:
	.xword	s_pstVfmwChan
	.align	3
.LC273:
	.xword	s_pFspInst
	.align	3
.LC274:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC275:
	.xword	g_pstRegSysCtrl
	.align	3
.LC276:
	.xword	g_HalDisable
	.align	3
.LC277:
	.xword	g_pstRegCrg
	.align	3
.LC278:
	.xword	.L715
	.align	3
.LC279:
	.xword	mask_mmu_err_int
	.align	3
.LC280:
	.xword	g_HwMem
	.align	3
.LC281:
	.xword	.LC253
	.align	3
.LC282:
	.xword	g_LowDelaySeqIndex
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_GetCharacter
	.type	VDMHAL_V5R2C1_GetCharacter, %function
VDMHAL_V5R2C1_GetCharacter:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC283
	mov	w3, 15
	ldr	x0, .LC284
	mov	w1, 4
	str	w3, [x2]
	str	w1, [x0]
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V5R2C1_GetCharacter, .-VDMHAL_V5R2C1_GetCharacter
	.align	3
.LC283:
	.xword	g_VdmCharacter
	.align	3
.LC284:
	.xword	g_eVdmVersion
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R2C1_WriteBigTitle1DYuv
	.type	VDMHAL_V5R2C1_WriteBigTitle1DYuv, %function
VDMHAL_V5R2C1_WriteBigTitle1DYuv:
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
	beq	.L809
	mov	w20, 2
	cmp	w0, w20
	csinc	w20, w20, wzr, ne
.L766:
	ldr	x0, [x29, 112]
	cbz	x0, .L765
	ldr	x0, .LC286
	mov	w4, 0
	add	x3, x29, 144
	mov	w2, 4194304
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L769
	ldr	x0, .LC290
	mov	w4, 0
	add	x3, x29, 176
	mov	w2, 4194304
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L769
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
	bne	.L770
	lsr	w1, w3, 1
	lsr	w0, w19, 1
	str	w1, [x29, 120]
	add	x1, x25, 2097152
	str	w0, [x29, 104]
	str	x1, [x29, 136]
	ldr	x28, .LC291
	ldr	x20, [x29, 152]
	cbz	w3, .L772
	mov	w27, 0
	str	wzr, [x29, 132]
	.p2align 2
.L771:
	cbz	w19, .L774
	ldr	w0, [x29, 124]
	lsr	w23, w27, 4
	ldr	w24, [x29, 132]
	mov	w26, 0
	mul	w0, w23, w0
	ubfiz	x23, x27, 8, 4
	add	x23, x0, x23
	.p2align 2
.L773:
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
	bhi	.L773
.L774:
	ldr	w0, [x29, 132]
	add	w27, w27, 1
	add	w0, w0, w19
	str	w0, [x29, 132]
	ldr	w0, [x29, 128]
	cmp	w0, w27
	bne	.L771
.L772:
	ldr	w0, [x29, 128]
	ldr	x3, [x28, 88]
	ldr	x2, [x29, 112]
	mul	w1, w19, w0
	mov	x0, x20
	blr	x3
	ldr	w0, [x29, 120]
	cbz	w0, .L864
	ldr	w1, [x29, 124]
	mov	w26, 0
	mov	w24, 0
	asr	w0, w1, 1
	str	w0, [x29, 132]
	.p2align 2
.L778:
	cbz	w19, .L780
	ldr	w0, [x29, 132]
	lsr	w22, w24, 3
	uxtw	x23, w26
	mov	w27, 0
	mul	w0, w22, w0
	ubfiz	x22, x24, 8, 3
	add	x22, x0, x22
	.p2align 2
.L777:
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
	bhi	.L777
.L780:
	ldr	w0, [x29, 120]
	add	w24, w24, 1
	add	w26, w26, w19
	cmp	w0, w24
	bne	.L778
	ldr	w0, [x29, 108]
	cmp	w0, 1
	beq	.L865
.L806:
	ldr	w0, [x29, 108]
	cbnz	w0, .L783
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
.L783:
	ldr	w0, [x29, 104]
	ldr	w1, [x29, 120]
.L859:
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
.L765:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 208
	ret
	.p2align 3
.L769:
	ldr	x1, .LC288
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
.L809:
	mov	w20, 0
	b	.L766
.L770:
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
	ldr	x28, .LC291
	ldr	x20, [x29, 152]
	bls	.L788
	ldr	w27, [x29, 120]
	.p2align 2
.L790:
	cbz	w19, .L791
	ldr	w0, [x29, 124]
	lsr	w24, w27, 4
	lsr	w23, w27, 1
	mov	w26, 0
	mul	w0, w24, w0
	mul	w23, w23, w19
	ubfiz	x24, x27, 8, 4
	add	x24, x0, x24
	.p2align 2
.L789:
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
	bhi	.L789
.L791:
	ldr	w0, [x29, 128]
	add	w27, w27, 2
	cmp	w0, w27
	bhi	.L790
.L788:
	ldr	w0, [x29, 128]
	ldr	x3, [x28, 88]
	ldr	x2, [x29, 112]
	mul	w1, w19, w0
	mov	x0, x20
	lsr	w1, w1, 1
	blr	x3
	ldr	w0, [x29, 132]
	cbz	w0, .L866
	ldr	w1, [x29, 124]
	mov	w26, 0
	mov	w24, 0
	asr	w0, w1, 1
	str	w0, [x29, 128]
	.p2align 2
.L795:
	cbz	w19, .L797
	ldr	w0, [x29, 128]
	lsr	w22, w24, 3
	uxtw	x23, w26
	mov	w27, 0
	mul	w0, w22, w0
	ubfiz	x22, x24, 8, 3
	add	x22, x0, x22
	.p2align 2
.L794:
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
	bhi	.L794
.L797:
	ldr	w0, [x29, 132]
	add	w24, w24, 1
	add	w26, w26, w19
	cmp	w0, w24
	bne	.L795
	ldr	w0, [x29, 108]
	cmp	w0, 1
	beq	.L867
	ldr	w0, [x29, 108]
	cbnz	w0, .L800
	ldr	w1, [x29, 120]
	ldr	w0, [x29, 132]
	cmp	w0, w1
	bls	.L803
	.p2align 2
.L804:
	ldr	w0, [x29, 120]
	ldr	w1, [x29, 132]
	add	w0, w0, 2
	str	w0, [x29, 120]
	cmp	w1, w0
	bhi	.L804
.L803:
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
.L800:
	ldr	w0, [x29, 104]
	ldr	w1, [x29, 132]
	b	.L859
.L865:
	mov	w0, 0
	mov	w6, 0
	.p2align 2
.L782:
	ldr	w1, [x29, 104]
	mov	w5, w0
	cbz	w1, .L784
	ldr	w1, [x29, 104]
	add	w5, w1, w0
	mov	w1, 1
	.p2align 2
.L781:
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
	bne	.L781
.L784:
	ldr	w0, [x29, 120]
	add	w6, w6, 1
	add	x20, x20, x19
	cmp	w0, w6
	mov	w0, w5
	bne	.L782
	b	.L783
.L867:
	ldr	w0, [x29, 120]
	mov	w7, 0
	mul	w1, w19, w0
	lsl	w0, w19, 1
	add	x20, x20, x1
	.p2align 2
.L799:
	ldr	w3, [x29, 104]
	cbz	w3, .L801
	lsr	w1, w7, 1
	mov	w2, 1
	mul	w1, w1, w3
	add	w6, w3, w1
	.p2align 2
.L798:
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
	bne	.L798
.L801:
	ldr	w1, [x29, 132]
	add	w7, w7, 2
	add	x20, x20, x0
	cmp	w1, w7
	bhi	.L799
	b	.L800
.L866:
	ldr	w0, [x29, 108]
	cmp	w0, 1
	beq	.L800
	ldr	w0, [x29, 108]
	cbz	w0, .L803
	b	.L800
.L864:
	ldr	w0, [x29, 108]
	cmp	w0, 1
	bne	.L806
	b	.L783
	.size	VDMHAL_V5R2C1_WriteBigTitle1DYuv, .-VDMHAL_V5R2C1_WriteBigTitle1DYuv
	.align	3
.LC286:
	.xword	.LC285
	.align	3
.LC288:
	.xword	.LC287
	.align	3
.LC290:
	.xword	.LC289
	.align	3
.LC291:
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
	ldr	x0, .LC292
	ldrb	w0, [x0]
	cmp	w0, 1
	bne	.L875
	cbnz	w19, .L871
	ldr	x0, .LC293
	ldr	x1, [x0]
	ldr	w0, [x1, 120]
	ubfx	x2, x0, 8, 2
	cmp	w20, w2
	beq	.L868
	bfi	w0, w20, 8, 2
	str	w0, [x1, 120]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L871:
	cmp	w19, 1
	beq	.L876
.L868:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L875:
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
.L876:
	ldr	x0, .LC293
	ldr	x1, [x0]
	ldr	w0, [x1, 120]
	bfi	w0, w20, 12, 5
	and	w0, w0, -131073
	str	w0, [x1, 120]
	ldr	w0, [x1, 120]
	orr	w0, w0, 131072
	str	w0, [x1, 120]
	b	.L868
	.size	CRG_ConfigReg, .-CRG_ConfigReg
	.align	3
.LC292:
	.xword	g_HalDisable
	.align	3
.LC293:
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
	ldr	x0, .LC294
	ldrb	w4, [x0]
	cmp	w4, 1
	bne	.L881
	cmp	w19, wzr
	ble	.L882
	ldr	x2, .LC296
	mov	w3, w19
	ldr	x1, .LC297
	mov	w0, 32
	add	x2, x2, 864
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L882:
	lsl	x0, x19, 6
	ldr	x1, .LC295
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
.L881:
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
.LC294:
	.xword	g_HalDisable
	.align	3
.LC295:
	.xword	g_HwMem
	.align	3
.LC296:
	.xword	.LANCHOR0
	.align	3
.LC297:
	.xword	.LC99
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.18165, %object
	.size	__func__.18165, 22
__func__.18165:
	.string	"VDMHAL_V5R2C1_OpenHAL"
	.zero	2
	.type	__func__.18239, %object
	.size	__func__.18239, 25
__func__.18239:
	.string	"VDMHAL_V5R2C1_CalcFsSize"
	.zero	7
	.type	__func__.18265, %object
	.size	__func__.18265, 24
__func__.18265:
	.string	"VDMHAL_V5R2C1_CalcFsNum"
	.type	__func__.18308, %object
	.size	__func__.18308, 32
__func__.18308:
	.string	"VDMHAL_V5R2C1_ArrangeMem_Normal"
	.type	__FUNCTION__.18309, %object
	.size	__FUNCTION__.18309, 32
__FUNCTION__.18309:
	.string	"VDMHAL_V5R2C1_ArrangeMem_Normal"
	.type	__func__.18251, %object
	.size	__func__.18251, 33
__func__.18251:
	.string	"VDMHAL_V5R2C1_FillMemArrangeInfo"
	.zero	7
	.type	__func__.18391, %object
	.size	__func__.18391, 34
__func__.18391:
	.string	"VDMHAL_V5R2C1_ArrangeMem_Specific"
	.zero	6
	.type	__func__.18415, %object
	.size	__func__.18415, 23
__func__.18415:
	.string	"VDMHAL_V5R2C1_ResetVdm"
	.zero	1
	.type	__func__.18425, %object
	.size	__func__.18425, 35
__func__.18425:
	.string	"VDMHAL_V5R2C1_SetSmmuPageTableAddr"
	.zero	5
	.type	__func__.18449, %object
	.size	__func__.18449, 24
__func__.18449:
	.string	"VDMHAL_V5R2C1_GlbResetX"
	.type	__func__.18435, %object
	.size	__func__.18435, 23
__func__.18435:
	.string	"VDMHAL_V5R2C1_GlbReset"
	.zero	1
	.type	__func__.18458, %object
	.size	__func__.18458, 28
__func__.18458:
	.string	"VDMHAL_V5R2C1_ClearIntState"
	.zero	4
	.type	__func__.18464, %object
	.size	__func__.18464, 31
__func__.18464:
	.string	"VDMHAL_V5R2C1_ClearMMUIntState"
	.zero	1
	.type	__func__.18470, %object
	.size	__func__.18470, 22
__func__.18470:
	.string	"VDMHAL_V5R2C1_MaskInt"
	.zero	2
	.type	__func__.18483, %object
	.size	__func__.18483, 24
__func__.18483:
	.string	"VDMHAL_V5R2C1_EnableInt"
	.type	__func__.18492, %object
	.size	__func__.18492, 23
__func__.18492:
	.string	"VDMHAL_V5R2C1_CheckReg"
	.zero	1
	.type	__func__.18506, %object
	.size	__func__.18506, 26
__func__.18506:
	.string	"VDMHAL_V5R2C1_ReadMMUMask"
	.zero	6
	.type	__func__.18511, %object
	.size	__func__.18511, 27
__func__.18511:
	.string	"VDMHAL_V5R2C1_WriteMMUMask"
	.zero	5
	.type	__func__.18542, %object
	.size	__func__.18542, 25
__func__.18542:
	.string	"VDMHAL_V5R2C1_PrepareDec"
	.zero	7
	.type	__func__.18547, %object
	.size	__func__.18547, 25
__func__.18547:
	.string	"VDMHAL_V5R2C1_IsVdmReady"
	.zero	7
	.type	__func__.18552, %object
	.size	__func__.18552, 23
__func__.18552:
	.string	"VDMHAL_V5R2C1_IsVdmRun"
	.zero	1
	.type	__func__.18558, %object
	.size	__func__.18558, 27
__func__.18558:
	.string	"VDMHAL_V5R2C1_IsVdhDecOver"
	.zero	5
	.type	__func__.18568, %object
	.size	__func__.18568, 31
__func__.18568:
	.string	"VDMHAL_V5R2C1_IsVdhPartDecOver"
	.zero	1
	.type	__func__.18583, %object
	.size	__func__.18583, 33
__func__.18583:
	.string	"VDMHAL_V5R2C1_UpdateHardwareInfo"
	.zero	7
	.type	__func__.18656, %object
	.size	__func__.18656, 23
__func__.18656:
	.string	"VDMHAL_V5R2C1_CfgRpMsg"
	.zero	1
	.type	__func__.18633, %object
	.size	__func__.18633, 24
__func__.18633:
	.string	"VDMHAL_CfgNotFullRepair"
	.type	__func__.18667, %object
	.size	__func__.18667, 23
__func__.18667:
	.string	"VDMHAL_V5R2C1_CfgRpReg"
	.zero	1
	.type	__func__.18680, %object
	.size	__func__.18680, 28
__func__.18680:
	.string	"VDMHAL_V5R2C1_MakeDecReport"
	.zero	4
	.type	__func__.18749, %object
	.size	__func__.18749, 28
__func__.18749:
	.string	"VDMHAL_V5R2C1_PrepareRepair"
	.zero	4
	.type	__func__.18939, %object
	.size	__func__.18939, 15
__func__.18939:
	.string	"MFDE_ConfigReg"
	.zero	1
	.type	__func__.18756, %object
	.size	__func__.18756, 28
__func__.18756:
	.string	"VDMHAL_V5R2C1_StartHwRepair"
	.zero	4
	.type	__func__.18795, %object
	.size	__func__.18795, 28
__func__.18795:
	.string	"VDMHAL_V5R2C1_CalVdhClkSkip"
	.zero	4
	.type	__func__.18821, %object
	.size	__func__.18821, 28
__func__.18821:
	.string	"VDMHAL_V5R2C1_StartHwDecode"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC4:
	ASCII(.string	"pOpenParam = NULL error!" )
	.zero	7
.LC7:
	ASCII(.string	"%s: %s\n" )
.LC9:
	ASCII(.string	"MemBaseAddr = 0 error!" )
	.zero	1
.LC11:
	ASCII(.string	"VDMHAL_V5R2C1_OpenHAL: Size error!" )
	.zero	5
.LC13:
	ASCII(.string	"VdhId is wrong!!!\n" )
	.zero	5
.LC15:
	ASCII(.string	"!!!!!! HAL memory not enouph! need %d, have %d\n" )
.LC17:
	ASCII(.string	"image size out of range" )
.LC24:
	ASCII(.string	"VDMHAL ArrangeMem HEVC/VP9 10 bit\n" )
	.zero	5
.LC27:
	ASCII(.string	"%s pstVfmwFrameSizeInfo = NULL\n" )
.LC31:
	ASCII(.string	"DelAllFrameMemRecord err in VDMHAL_V5R2C1_ArrangeMem!\n" )
	.zero	1
.LC33:
	ASCII(.string	"Report arrange frame buffer: wxh %dx%d, FsNum %d, PmvNum %d\n" )
	.zero	3
.LC38:
	ASCII(.string	"Report arrange frame buffer only: wxh %dx%d, FsNum %d, PmvNum %d\n" )
	.zero	6
.LC41:
	ASCII(.string	"VidStd Invalid" )
	.zero	1
.LC47:
	ASCII(.string	"Set CompressEn %d, LossCompressEn %d, YCompRatio %d, UVCompRatio %d\n" )
	.zero	3
.LC49:
	ASCII(.string	"VDMHAL_V5R2C1_CalcFsSize err!\n" )
	.zero	1
.LC51:
	ASCII(.string	"%s, need arrange, Size: %#x, Num: %#x, RefChanged: %#x\n" )
.LC53:
	ASCII(.string	"DFS, report event. Size: 0x%x, Num: %d, RefChanged: %d\n" )
.LC56:
	ASCII(.string	"pVdmMemArrange is NULL" )
	.zero	1
.LC58:
	ASCII(.string	"DFS, no ref frame!\n" )
	.zero	4
.LC60:
	ASCII(.string	"DFS, Frame number = %d > 30, Then, Frame num = 30, \n" )
	.zero	3
.LC62:
	ASCII(.string	"VDMHAL_V5R2C1_ArrangeMem Mem addr is NULL" )
	.zero	6
.LC67:
	ASCII(.string	"'pVdmMemArrange' is NULL" )
	.zero	7
.LC71:
	ASCII(.string	"MemSize not enough for pmv slot" )
.LC74:
	ASCII(.string	"VDMHAL_V200R003_ArrangeMem get ChanWidth/ChanHeight failed!\n" )
	.zero	3
.LC76:
	ASCII(.string	"ImgSlotLen > ChanSlotLen" )
	.zero	7
.LC78:
	ASCII(.string	"cann't allocate img slot" )
	.zero	7
.LC81:
	ASCII(.string	"Chan: %d call VCTRL_GetVidStd failed\n" )
	.zero	2
.LC85:
	ASCII(.string	"%s: VdhId(%d) > %d\n" )
	.zero	4
.LC87:
	ASCII(.string	"VDMHAL_V5R2C1_ResetVdm: map vdm register fail, vir(reg) = (%p)\n" )
.LC92:
	ASCII(.string	"%s module id %d failed!\n" )
	.zero	7
.LC94:
	ASCII(.string	"%s module id %d success!\n" )
	.zero	6
.LC99:
	ASCII(.string	"%s: WR_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\n" )
	.zero	3
.LC106:
	ASCII(.string	"%s VdhId %d failed!\n" )
	.zero	3
.LC108:
	ASCII(.string	"%s VdhId %d success!\n" )
	.zero	2
.LC111:
	ASCII(.string	"%s: map vdm register 0x%x failed!\n" )
	.zero	5
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
.LC156:
	ASCII(.string	"VDM register not mapped yet!" )
	.zero	3
.LC162:
	ASCII(.string	"VDM register not mapped yet!\n" )
	.zero	2
.LC184:
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
	ASCII(.string	"can not map repair msg virtual address!" )
.LC200:
	ASCII(.string	"ValidGroupNum=%d out of range!\n" )
.LC202:
	ASCII(.string	"align_mb error\n" )
.LC204:
	ASCII(.string	"[%s][%d]sclie_num is wrong! %d \n" )
	.zero	7
.LC213:
	ASCII(.string	"'pMakeDecReport' is NULL" )
	.zero	7
.LC217:
	ASCII(.string	"'pDecReport' is NULL" )
	.zero	3
.LC227:
	ASCII(.string	"pDecReport->DecSliceNum(%d) > %d, set to 0 for full repair.\n" )
	.zero	3
.LC231:
	ASCII(.string	"\n***** UpMsg DecSliceNum=%d\n" )
	.zero	3
.LC233:
	ASCII(.string	"\n***** Up Msg (phy addr: %#8x) *****\n" )
	.zero	2
.LC235:
	ASCII(.string	"\n0x%02x 0x%08x 0x%08x 0x%08x 0x%08x\n" )
	.zero	3
.LC237:
	ASCII(.string	"\n***** Up Msg print finished *****\n" )
	.zero	4
.LC242:
	ASCII(.string	"vdm register virtual address not mapped, VDMHAL_V200R003_PrepareRepair failed!\n" )
.LC245:
	ASCII(.string	"FIRST_REPAIR Parameter Error!\n" )
	.zero	1
.LC247:
	ASCII(.string	"SECOND_REPAIR Parameter Error!\n" )
.LC253:
	ASCII(.string	"%s: pMfdeTask(%p) = NULL\n" )
	.zero	6
.LC262:
	ASCII(.string	"%s The channel %d is not active\n" )
	.zero	7
.LC285:
	ASCII(.string	"BigTile1d_y" )
	.zero	4
.LC287:
	ASCII(.string	"failed mem_allocMemBlock BigTile_yuv save!\n" )
	.zero	4
.LC289:
	ASCII(.string	"BigTile1d_uv" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
