#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	VDMHAL_V5R6C1_CfgRpReg.isra.9, %function
VDMHAL_V5R6C1_CfgRpReg.isra.9:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w21, w2
	mov	x22, x1
	mov	x20, x3
	bl	_mcount
	cmp	w21, wzr
	str	wzr, [x29, 60]
	bgt	.L28
	ldr	x0, [x19]
	cbz	x0, .L29
.L4:
	ldr	x19, .LC5
	ldr	w3, [x22]
	ldrb	w0, [x19]
	and	w3, w3, -16
	str	w3, [x29, 60]
	cmp	w0, 1
	beq	.L30
	mov	x0, x20
	mov	w2, 16
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	mov	w3, 53763
	movk	w3, 0x2000, lsl 16
	str	w3, [x29, 60]
	cmp	w0, 1
	beq	.L31
	mov	x0, x20
	mov	w2, 12
	mov	w1, 2
	mov	w22, 3075
	movk	w22, 0x30, lsl 16
	bl	VDH_Record_RegData
	str	w22, [x29, 60]
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L32
	mov	x0, x20
	mov	w3, w22
	mov	w2, 60
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L33
	mov	x0, x20
	mov	w3, w22
	mov	w2, 64
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L34
	mov	x0, x20
	mov	w3, w22
	mov	w2, 68
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L35
	mov	x0, x20
	mov	w3, w22
	mov	w2, 72
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L36
	mov	x0, x20
	mov	w3, w22
	mov	w2, 76
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L37
	mov	x0, x20
	mov	w3, w22
	mov	w2, 80
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L38
	mov	x0, x20
	mov	w3, w22
	mov	w2, 84
	mov	w1, 2
	bl	VDH_Record_RegData
	mov	w0, 0
.L24:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L30:
	sxtw	x2, w21
	ldr	x1, .LC6
	lsl	x0, x2, 6
	sub	x0, x0, x2
	lsl	x0, x0, 2
	sub	x4, x0, x2
	add	x0, x0, x4, lsl 2
	ldr	x0, [x1, x0]
	str	w3, [x0, 16]
.L7:
	lsl	x0, x2, 6
	mov	w4, 53763
	sub	x0, x0, x2
	movk	w4, 0x2000, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x2
	add	x0, x0, x3, lsl 2
	ldr	x0, [x1, x0]
	str	w4, [x0, 12]
.L9:
	lsl	x0, x2, 6
	mov	w4, 3075
	sub	x0, x0, x2
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x2
	add	x0, x0, x3, lsl 2
	ldr	x0, [x1, x0]
	str	w4, [x0, 60]
.L11:
	lsl	x0, x2, 6
	mov	w4, 3075
	sub	x0, x0, x2
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x2
	add	x0, x0, x3, lsl 2
	ldr	x0, [x1, x0]
	str	w4, [x0, 64]
.L13:
	lsl	x0, x2, 6
	mov	w4, 3075
	sub	x0, x0, x2
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x2
	add	x0, x0, x3, lsl 2
	ldr	x0, [x1, x0]
	str	w4, [x0, 68]
.L15:
	lsl	x0, x2, 6
	mov	w4, 3075
	sub	x0, x0, x2
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x2
	add	x0, x0, x3, lsl 2
	ldr	x0, [x1, x0]
	str	w4, [x0, 72]
.L17:
	lsl	x0, x2, 6
	mov	w4, 3075
	sub	x0, x0, x2
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x2
	add	x0, x0, x3, lsl 2
	ldr	x0, [x1, x0]
	str	w4, [x0, 76]
.L19:
	lsl	x0, x2, 6
	mov	w4, 3075
	sub	x0, x0, x2
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x2
	add	x0, x0, x3, lsl 2
	ldr	x0, [x1, x0]
	str	w4, [x0, 80]
.L21:
	lsl	x3, x2, 6
	mov	w4, 3075
	sub	x3, x3, x2
	movk	w4, 0x30, lsl 16
	lsl	x3, x3, 2
	mov	w0, 0
	sub	x2, x3, x2
	add	x2, x3, x2, lsl 2
	ldr	x1, [x1, x2]
	str	w4, [x1, 84]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L29:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L5
	str	x0, [x19]
	b	.L4
	.p2align 3
.L28:
	ldr	x2, .LC0
	mov	w4, 0
	ldr	x1, .LC2
	mov	w3, w21
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L24
.L5:
	ldr	x1, .LC4
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L24
.L35:
	ldr	x1, .LC6
	sxtw	x2, w21
	b	.L15
.L34:
	ldr	x1, .LC6
	sxtw	x2, w21
	b	.L13
.L33:
	ldr	x1, .LC6
	sxtw	x2, w21
	b	.L11
.L32:
	ldr	x1, .LC6
	sxtw	x2, w21
	b	.L9
.L37:
	ldr	x1, .LC6
	sxtw	x2, w21
	b	.L19
.L36:
	ldr	x1, .LC6
	sxtw	x2, w21
	b	.L17
.L38:
	ldr	x1, .LC6
	sxtw	x2, w21
	b	.L21
.L31:
	ldr	x1, .LC6
	sxtw	x2, w21
	b	.L7
	.size	VDMHAL_V5R6C1_CfgRpReg.isra.9, .-VDMHAL_V5R6C1_CfgRpReg.isra.9
	.align	3
.LC0:
	.xword	.LANCHOR0
	.align	3
.LC2:
	.xword	.LC1
	.align	3
.LC4:
	.xword	.LC3
	.align	3
.LC5:
	.xword	g_HalDisable
	.align	3
.LC6:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_GetHalMemSize
	.type	VDMHAL_V5R6C1_GetHalMemSize, %function
VDMHAL_V5R6C1_GetHalMemSize:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 24576
	movk	w0, 0x9, lsl 16
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V5R6C1_GetHalMemSize, .-VDMHAL_V5R6C1_GetHalMemSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_OpenHAL
	.type	VDMHAL_V5R6C1_OpenHAL, %function
VDMHAL_V5R6C1_OpenHAL:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L52
	ldp	w7, w3, [x19]
	ldr	w0, [x19, 8]
	cbz	w7, .L53
	mov	w1, 24575
	movk	w1, 0x9, lsl 16
	cmp	w3, w1
	ble	.L54
	cmp	w0, wzr
	bgt	.L55
	sxtw	x4, w0
	ldr	x19, .LC7
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
.L46:
	str	w1, [x0], 4
	add	w1, w1, 1280
	cmp	x0, x2
	bne	.L46
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
	bcc	.L47
	mov	x0, x19
	bl	H264HAL_V5R6C1_InitHal
	cmp	w0, wzr
	mov	x0, x19
	csetm	w19, ne
	bl	HEVCHAL_V5R6C1_InitHal
	cmp	w0, wzr
	csinv	w19, w19, wzr, eq
.L42:
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L55:
	ldr	x1, .LC20
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	b	.L42
.L47:
	ldr	x1, .LC22
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	b	.L42
.L53:
	ldr	x2, .LC12
	ldr	x3, .LC16
.L51:
	ldr	x1, .LC14
	add	x2, x2, 24
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	b	.L42
.L54:
	ldr	x2, .LC12
	ldr	x3, .LC18
	b	.L51
.L52:
	ldr	x2, .LC12
	ldr	x3, .LC11
	b	.L51
	.size	VDMHAL_V5R6C1_OpenHAL, .-VDMHAL_V5R6C1_OpenHAL
	.align	3
.LC7:
	.xword	g_HwMem
	.align	3
.LC11:
	.xword	.LC10
	.align	3
.LC12:
	.xword	.LANCHOR0
	.align	3
.LC14:
	.xword	.LC13
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_CloseHAL
	.type	VDMHAL_V5R6C1_CloseHAL, %function
VDMHAL_V5R6C1_CloseHAL:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V5R6C1_CloseHAL, .-VDMHAL_V5R6C1_CloseHAL
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_CalcFsSize
	.type	VDMHAL_V5R6C1_CalcFsSize, %function
VDMHAL_V5R6C1_CalcFsSize:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w22, w0
	mov	x0, x30
	mov	w25, w1
	mov	w26, w2
	mov	w23, w3
	mov	w24, w4
	mov	x21, x5
	bl	_mcount
	sub	w1, w25, #32
	mov	w0, 8160
	cmp	w1, w0
	bhi	.L58
	sub	w1, w26, #32
	mov	w7, w26
	cmp	w1, w0
	bhi	.L58
	add	w0, w25, 15
	add	w20, w26, 15
	asr	w0, w0, 4
	ldr	x1, .LC27
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
	cmp	w24, 16
	beq	.L63
	cmp	w24, 17
	beq	.L89
	mul	w19, w0, w19
	sub	w0, w24, #17
	cmp	w0, 1
	mul	w19, w19, w20
	add	w19, w19, 143
	and	w19, w19, -128
	asr	w4, w19, 1
	bls	.L64
	ldr	x27, .LC28
	add	w3, w3, 255
	add	w7, w26, 31
	and	w28, w3, -256
	and	w7, w7, -32
	mov	w5, 0
	ldr	x0, [x27, w22, sxtw 3]
	mov	w6, 0
.L66:
	ldr	w1, [x0, 1320]
	cmp	w1, 1
	beq	.L90
	mov	w26, 0
	mov	w3, 0
	mov	w25, 0
.L67:
	cmp	w23, 1
	mul	w23, w7, w28
	beq	.L91
	mul	w1, w5, w6
	lsl	w20, w25, 2
	lsl	w2, w1, 2
	sub	w20, w20, w25
	sub	w2, w2, w1
	lsl	w1, w23, 2
	sub	w1, w1, w23
	lsr	w1, w1, 1
	add	w1, w1, w2, lsr 1
	add	w20, w1, w20, lsr 1
.L69:
	add	x1, x0, 503808
	ldr	w1, [x1, 1968]
	cbz	w1, .L92
.L70:
	add	x2, x0, 507904
	cmp	w24, 17
	stp	w3, w26, [x2, 220]
	str	w4, [x2, 260]
	str	w20, [x2, 1440]
	beq	.L71
	add	x1, x0, 503808
	ldr	w3, [x1, 1976]
	mov	w1, 32
	cmp	w3, 32
	csel	w1, w3, w1, le
	str	w1, [x2, 264]
	ldr	w1, [x0, 704]
	cmp	w1, 2
	beq	.L93
.L72:
	lsl	w3, w28, 4
	sub	w24, w24, #16
	add	w1, w25, w23
	str	w3, [x2, 212]
	cmp	w24, 2
	lsr	w3, w3, 1
	str	w1, [x2, 244]
	str	w3, [x2, 216]
	bls	.L73
.L74:
	ldr	x0, [x27, w22, sxtw 3]
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
	cbz	x21, .L84
	str	w1, [x21, 4]
	mov	w0, 0
	ldr	x3, [x27, w22, sxtw 3]
	add	x3, x3, 503808
	ldr	w3, [x3, 1976]
	stp	w3, w19, [x21, 8]
	ldr	x3, [x27, w22, sxtw 3]
	add	x3, x3, 507904
	ldr	w3, [x3, 264]
	stp	w3, w4, [x21, 16]
	str	w2, [x21]
	ldr	x2, [x27, w22, sxtw 3]
	add	x2, x2, 507904
	str	w1, [x2, 1448]
.L85:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L71:
	lsl	w3, w28, 4
	mov	w1, 1
	str	w3, [x2, 212]
	lsr	w3, w3, 1
	str	w1, [x2, 264]
	add	w1, w25, w23
	str	w3, [x2, 216]
	str	w1, [x2, 244]
.L73:
	ldr	w0, [x0, 1684]
	cmp	w0, 8
	ble	.L74
	lsl	w0, w23, 2
	ldr	x1, .LC31
	sub	w23, w0, w23
	lsl	w0, w25, 2
	sub	w25, w0, w25
	mov	w0, 31
	mul	w5, w5, w6
	lsr	w25, w25, 1
	lsl	w6, w6, 5
	add	w23, w25, w23, lsr 1
	str	w6, [x2, 228]
	stp	w23, w5, [x2, 236]
	bl	dprint_vfmw
	b	.L74
	.p2align 3
.L92:
	ldr	x1, .LC29
	add	x0, x0, 507904
	add	x0, x0, 208
	mov	x2, 1248
	stp	w4, w3, [x29, 96]
	ldr	x7, [x1, 96]
	mov	w1, 0
	stp	w6, w5, [x29, 104]
	blr	x7
	ldr	x0, [x27, w22, sxtw 3]
	ldp	w4, w3, [x29, 96]
	ldp	w6, w5, [x29, 104]
	b	.L70
	.p2align 3
.L91:
	lsl	w1, w20, 6
	sub	w20, w1, w20, lsl 4
	mul	w20, w20, w28
	b	.L69
	.p2align 3
.L90:
	adds	w3, w25, 2047
	add	w25, w25, 4094
	csel	w25, w25, w3, mi
	add	w1, w26, 126
	and	w25, w25, -2048
	cmp	w25, wzr
	add	w3, w25, 127
	csel	w3, w3, w25, lt
	adds	w25, w26, 63
	csel	w25, w1, w25, mi
	asr	w3, w3, 7
	asr	w25, w25, 6
	lsl	w25, w25, 5
	mul	w25, w25, w3
	mov	w26, w25
	b	.L67
	.p2align 3
.L63:
	ldr	x27, .LC28
	mul	w19, w20, w3
	add	w3, w25, 255
	ldr	x0, [x27, w22, sxtw 3]
	add	w19, w19, 143
	and	w28, w3, -256
	and	w19, w19, -128
	ldr	w1, [x0, 1684]
	cmp	w1, 8
	ble	.L94
	add	w5, w26, 31
	lsr	w6, w28, 2
	and	w5, w5, -32
	asr	w4, w19, 1
	b	.L66
	.p2align 3
.L89:
	mov	w4, 64
	mov	w19, 128
	movk	w4, 0x12, lsl 16
	movk	w19, 0x24, lsl 16
.L64:
	ldr	x27, .LC28
	add	w3, w25, 255
	add	w7, w26, 63
	and	w28, w3, -256
	and	w7, w7, -64
	ldr	x0, [x27, w22, sxtw 3]
	ldr	w1, [x0, 1684]
	cmp	w1, 8
	ble	.L82
	lsr	w6, w28, 2
	mov	w5, w7
	b	.L66
	.p2align 3
.L94:
	asr	w4, w19, 1
	mov	w5, 0
	mov	w6, 0
	b	.L66
	.p2align 3
.L93:
	add	w3, w3, 1
	str	w3, [x2, 264]
	b	.L72
	.p2align 3
.L84:
	mov	w0, 0
	b	.L85
	.p2align 3
.L82:
	mov	w5, 0
	mov	w6, 0
	b	.L66
	.p2align 3
.L58:
	ldr	x2, .LC25
	mov	w0, 0
	ldr	x3, .LC24
	ldr	x1, .LC26
	add	x2, x2, 48
	bl	dprint_vfmw
	mov	w0, -1
	b	.L85
	.size	VDMHAL_V5R6C1_CalcFsSize, .-VDMHAL_V5R6C1_CalcFsSize
	.align	3
.LC24:
	.xword	.LC23
	.align	3
.LC25:
	.xword	.LANCHOR0
	.align	3
.LC26:
	.xword	.LC13
	.align	3
.LC27:
	.xword	g_not_direct_8x8_inference_flag
	.align	3
.LC28:
	.xword	s_pstVfmwChan
	.align	3
.LC29:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC31:
	.xword	.LC30
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_GetRpuSize
	.type	VDMHAL_V5R6C1_GetRpuSize, %function
VDMHAL_V5R6C1_GetRpuSize:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 4096
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V5R6C1_GetRpuSize, .-VDMHAL_V5R6C1_GetRpuSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_CalcFsNum
	.type	VDMHAL_V5R6C1_CalcFsNum, %function
VDMHAL_V5R6C1_CalcFsNum:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x19, x3
	mov	x0, x30
	mov	w21, w1
	bl	_mcount
	cbz	x19, .L101
	cmp	w21, 17
	ldr	x1, .LC35
	beq	.L102
	ldr	x2, [x1, w20, sxtw 3]
	mov	w3, 32
	add	x0, x2, 503808
	add	x4, x2, 507904
	ldr	w0, [x0, 1976]
	cmp	w0, w3
	csel	w3, w0, w3, le
	str	w3, [x4, 264]
	ldr	w2, [x2, 704]
	cmp	w2, 2
	beq	.L103
.L100:
	str	w0, [x19, 8]
	mov	w0, 0
	ldr	x1, [x1, w20, sxtw 3]
	add	x1, x1, 507904
	ldr	w1, [x1, 264]
	str	w1, [x19, 16]
.L98:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L102:
	ldr	x0, [x1, w20, sxtw 3]
	mov	w3, 1
	add	x2, x0, 507904
	add	x0, x0, 503808
	str	w3, [x2, 264]
	ldr	w0, [x0, 1976]
	b	.L100
	.p2align 3
.L103:
	add	w2, w0, 1
	str	w2, [x4, 264]
	b	.L100
.L101:
	ldr	x2, .LC32
	mov	w0, 1
	ldr	x1, .LC34
	add	x2, x2, 80
	bl	dprint_vfmw
	mov	w0, -1
	b	.L98
	.size	VDMHAL_V5R6C1_CalcFsNum, .-VDMHAL_V5R6C1_CalcFsNum
	.align	3
.LC32:
	.xword	.LANCHOR0
	.align	3
.LC34:
	.xword	.LC33
	.align	3
.LC35:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_DynamicAllocFrame
	.type	VDMHAL_V5R6C1_DynamicAllocFrame, %function
VDMHAL_V5R6C1_DynamicAllocFrame:
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
	ldr	x23, .LC36
	mov	w0, w19
	ldr	x1, [x23, w19, sxtw 3]
	add	x1, x1, 503808
	add	x1, x1, 2000
	bl	DelAllFrameMemRecord
	cbnz	w0, .L126
.L105:
	ldr	x1, [x23, w19, sxtw 3]
	mov	w2, 255
	add	x0, x1, 503808
	add	x1, x1, 507904
	add	x0, x0, 2000
	add	x1, x1, 208
	.p2align 2
.L106:
	str	w2, [x0], 72
	cmp	x1, x0
	bne	.L106
	ldr	x0, [x23, w19, sxtw 3]
	add	x1, x0, 507904
	ldr	w2, [x1, 2080]
	cbnz	w2, .L125
	mov	w2, 1088
	cmp	w22, 1920
	ccmp	w21, w2, 0, le
	ble	.L127
.L125:
	ldr	w1, [x20, 8]
.L108:
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
	beq	.L112
	add	x1, x1, 503808
	ldr	w0, [x1, 1980]
	str	w0, [x20, 16]
	ldr	x1, [x23, w19, sxtw 3]
.L112:
	add	x0, x1, 507904
	add	x1, x1, 475136
	mov	w4, 1
	mov	w3, w21
	mov	w2, w22
	str	wzr, [x0, 1480]
	str	w4, [x1, 2360]
	str	w4, [x0, 2020]
	mov	w0, 31
	ldr	x1, .LC40
	ldr	w4, [x20, 8]
	ldr	w5, [x20, 16]
	bl	dprint_vfmw
	ldr	x0, .LC41
	ldr	x4, [x0]
	cbz	x4, .L113
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
.L113:
	ldr	x3, .LC42
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
.L127:
	ldr	w2, [x0, 36]
	cmp	w2, 24
	beq	.L125
	ldr	w1, [x1, 2076]
	cbnz	w1, .L125
	ldr	w1, [x20, 8]
	add	w1, w1, 4
	str	w1, [x20, 8]
	ldr	x0, [x23, w19, sxtw 3]
	b	.L108
.L126:
	ldr	x1, .LC38
	mov	w0, 0
	bl	dprint_vfmw
	b	.L105
	.size	VDMHAL_V5R6C1_DynamicAllocFrame, .-VDMHAL_V5R6C1_DynamicAllocFrame
	.align	3
.LC36:
	.xword	s_pstVfmwChan
	.align	3
.LC38:
	.xword	.LC37
	.align	3
.LC40:
	.xword	.LC39
	.align	3
.LC41:
	.xword	g_event_report
	.align	3
.LC42:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_DynamicAllocFrame_Only
	.type	VDMHAL_V5R6C1_DynamicAllocFrame_Only, %function
VDMHAL_V5R6C1_DynamicAllocFrame_Only:
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
	ldr	x4, .LC43
	mov	w3, w21
	ldr	w5, [x19, 8]
	mov	w2, w22
	ldr	x1, .LC45
	mov	w0, 31
	ldr	x4, [x4, w20, sxtw 3]
	add	x4, x4, 503808
	str	w5, [x4, 1980]
	ldr	w4, [x19, 8]
	ldr	w5, [x19, 16]
	bl	dprint_vfmw
	ldr	x0, .LC46
	ldr	x4, [x0]
	cbz	x4, .L128
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
.L128:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.size	VDMHAL_V5R6C1_DynamicAllocFrame_Only, .-VDMHAL_V5R6C1_DynamicAllocFrame_Only
	.align	3
.LC43:
	.xword	s_pstVfmwChan
	.align	3
.LC45:
	.xword	.LC44
	.align	3
.LC46:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_ArrangeMem_Normal
	.type	VDMHAL_V5R6C1_ArrangeMem_Normal, %function
VDMHAL_V5R6C1_ArrangeMem_Normal:
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
	bhi	.L173
	bl	PDT_Is3716MV450
	cbz	w0, .L136
	mul	w1, w23, w24
	mov	w0, 36863
	movk	w0, 0x7e, lsl 16
	cmp	w1, w0
	bgt	.L174
.L136:
	ldr	x21, .LC53
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 503808
	ldr	w26, [x1, 1972]
	ldr	w1, [x0, 100]
	cmp	w1, 2
	beq	.L175
	and	w1, w20, -17
	cmp	w1, wzr
	ccmp	w20, 18, 4, ne
	beq	.L176
.L139:
	cmp	w20, 17
	cset	w2, eq
	mov	w1, w2
.L140:
	ldr	x4, .LC54
	sbfiz	x3, x19, 4, 32
	ldr	w5, [x0, 1332]
	str	w2, [x0, 1320]
	str	w1, [x4, x3]
	ldr	w3, [x0, 1324]
	ldr	w4, [x0, 1328]
	mov	w0, 1
	ldr	x1, .LC56
	bl	dprint_vfmw
.L138:
	mov	w2, w25
	add	x3, x29, 104
	mov	w1, w20
	mov	w0, w19
	bl	VDMHAL_V5R6C1_CalcFsNum
	mov	w25, w0
	add	x5, x29, 104
	mov	w4, w20
	mov	w3, w27
	mov	w2, w24
	mov	w1, w23
	mov	w0, w19
	bl	VDMHAL_V5R6C1_CalcFsSize
	orr	w0, w25, w0
	cbnz	w0, .L177
	ldr	x27, [x21, w19, sxtw 3]
	ldr	w20, [x29, 104]
	add	x0, x27, 503808
	cmp	w26, w20
	ldr	w25, [x0, 1976]
	ldr	w5, [x0, 1992]
	beq	.L178
.L143:
	ldr	x2, .LC49
	mov	w3, w20
	ldr	x1, .LC60
	mov	w4, w25
	add	x2, x2, 136
	mov	w0, 31
	bl	dprint_vfmw
	ldr	x0, [x21, w19, sxtw 3]
	add	x3, x29, 104
	mov	w2, w24
	add	x0, x0, 503808
	ldr	w1, [x0, 1968]
	str	w20, [x0, 1972]
	cbz	w1, .L179
	mov	w1, w23
	mov	w0, w19
	bl	VDMHAL_V5R6C1_DynamicAllocFrame_Only
.L146:
	ldr	x4, [x21, w19, sxtw 3]
	mov	w3, w25
	ldr	x1, .LC62
	mov	w2, w20
	add	x4, x4, 503808
	mov	w0, 31
	ldr	w4, [x4, 1992]
	bl	dprint_vfmw
	ldr	x19, [x21, w19, sxtw 3]
	ldr	x0, .LC63
	add	x19, x19, 507904
	ldr	x0, [x0]
	blr	x0
	str	w0, [x19, 1456]
	mov	w1, 2
.L135:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	mov	w0, w1
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L179:
	mov	w1, w23
	mov	w0, w19
	bl	VDMHAL_V5R6C1_DynamicAllocFrame
	b	.L146
	.p2align 3
.L176:
	cmp	w23, 3839
	mov	w1, 2159
	ccmp	w24, w1, 0, le
	ble	.L139
	mov	w1, 1
	mov	w2, w1
	b	.L140
	.p2align 3
.L178:
	cmp	w5, 1
	beq	.L143
	ldr	w0, [x0, 1968]
	cmp	w0, 1
	beq	.L143
	cbz	x22, .L180
	add	x26, x27, 507904
	mov	x0, x27
	add	x20, x26, 208
	ldr	w23, [x26, 1440]
	cbz	w25, .L181
.L148:
	add	x0, x0, 503808
	ldr	w2, [x0, 1980]
	cmp	w2, 30
	bgt	.L182
.L149:
	ldr	x24, .LC63
	add	x25, x26, 208
	mov	w0, 8
	str	w2, [x25, 48]
	ldr	x1, [x24, 24]
	blr	x1
	ldr	x7, [x21, w19, sxtw 3]
	add	x9, x7, 507904
	ldr	w0, [x9, 1480]
	cbz	w0, .L154
	ldp	w10, w6, [x25, 56]
	mov	x4, x25
	mov	w5, 0
	mov	w8, 1
	.p2align 2
.L153:
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
	beq	.L151
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
.L151:
	ldr	w0, [x4, 64]
	cmp	w0, w10
	bcs	.L152
	ldr	w2, [x11, 2008]
	add	x1, x27, x0, uxtw 3
	add	x1, x1, 507904
	add	w0, w0, 1
	cmp	w2, 255
	beq	.L152
	ldr	w2, [x11, 2064]
	str	w2, [x1, 416]
	strb	w8, [x1, 420]
	str	w0, [x4, 64]
.L152:
	ldr	w0, [x9, 1480]
	cmp	w5, w0
	bcc	.L153
.L154:
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
	b	.L135
	.p2align 3
.L175:
	add	x2, x0, 1280
	mov	w1, -1
	stp	wzr, wzr, [x2, 40]
	stp	w1, w1, [x2, 48]
	b	.L138
	.p2align 3
.L182:
	ldr	x1, .LC69
	mov	w0, 31
	bl	dprint_vfmw
	ldr	x0, [x21, w19, sxtw 3]
	mov	w1, 30
	mov	w2, w1
	add	x0, x0, 503808
	str	w1, [x0, 1980]
	b	.L149
	.p2align 3
.L181:
	ldr	x1, .LC67
	mov	w0, 31
	bl	dprint_vfmw
	ldr	x0, [x21, w19, sxtw 3]
	b	.L148
	.p2align 3
.L173:
	ldr	x2, .LC49
	mov	w0, 0
	ldr	x1, .LC50
	ldr	x3, .LC48
	add	x2, x2, 104
	bl	dprint_vfmw
	mov	w1, -1
	b	.L135
	.p2align 3
.L177:
	ldr	x1, .LC58
	mov	w0, 31
	bl	dprint_vfmw
	mov	w1, -1
	b	.L135
	.p2align 3
.L174:
	bl	PDT_Is3716MV450
	mov	w2, w0
	ldr	x1, .LC52
	mov	w0, 31
	bl	dprint_vfmw
	mov	w1, -1
	b	.L135
.L180:
	ldr	x2, .LC49
	mov	w0, 0
	ldr	x1, .LC50
	ldr	x3, .LC65
	add	x2, x2, 168
	bl	dprint_vfmw
	mov	w1, -1
	b	.L135
	.size	VDMHAL_V5R6C1_ArrangeMem_Normal, .-VDMHAL_V5R6C1_ArrangeMem_Normal
	.align	3
.LC48:
	.xword	.LC47
	.align	3
.LC49:
	.xword	.LANCHOR0
	.align	3
.LC50:
	.xword	.LC13
	.align	3
.LC52:
	.xword	.LC51
	.align	3
.LC53:
	.xword	s_pstVfmwChan
	.align	3
.LC54:
	.xword	g_VfmwCompressPara
	.align	3
.LC56:
	.xword	.LC55
	.align	3
.LC58:
	.xword	.LC57
	.align	3
.LC60:
	.xword	.LC59
	.align	3
.LC62:
	.xword	.LC61
	.align	3
.LC63:
	.xword	vfmw_Osal_Func_Ptr_S
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
	.global	VDMHAL_V5R6C1_ArrangeMem_Specific
	.type	VDMHAL_V5R6C1_ArrangeMem_Specific, %function
VDMHAL_V5R6C1_ArrangeMem_Specific:
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
	cbz	w22, .L277
	sub	w1, w21, #32
	mov	w0, 8160
	cmp	w1, w0
	bhi	.L186
	sub	w1, w24, #32
	cmp	w1, w0
	bhi	.L186
	cbz	x19, .L278
	ldr	x0, .LC77
	cmp	w20, 20
	mov	x2, 1232
	mov	w1, 0
	mov	w6, 20
	ldr	x3, [x0, 96]
	mov	x0, x19
	csel	w26, w20, w6, le
	mov	w20, 32
	blr	x3
	ldr	x1, .LC78
	add	w0, w21, 15
	asr	w0, w0, 4
	add	w2, w24, 15
	cmp	w0, 45
	asr	w2, w2, 4
	ldrb	w3, [x1]
	mov	w1, 36
	ccmp	w2, w1, 0, le
	mov	w1, 64
	cset	w4, le
	cmp	w4, wzr
	csel	w20, w20, w1, eq
	cmp	w3, 1
	csel	w20, w20, w1, ne
	cmp	w25, 16
	lsl	w1, w0, 4
	beq	.L279
	cmp	w25, 17
	beq	.L235
	mul	w20, w0, w20
	mul	w20, w20, w2
	add	w20, w20, 143
	and	w20, w20, -128
.L194:
	mul	w3, w26, w20
	cmp	w28, w3
	ble	.L192
	sub	w0, w25, #17
	add	w7, w22, 1023
	and	w7, w7, -1024
	cmp	w0, 1
	asr	w0, w20, 1
	sub	w3, w28, w3
	stp	w0, w26, [x19, 52]
	sub	w6, w7, w22
	sub	w3, w3, w6
	bls	.L280
	add	w28, w1, 255
	add	w1, w24, 31
	and	w28, w28, -256
	and	w1, w1, -32
	lsl	w0, w28, 4
	str	w0, [x19, 4]
	asr	w0, w0, 1
	str	w0, [x19, 8]
	tbnz	w23, #31, .L272
	ldr	x4, .LC81
	mov	w8, 0
	mov	w26, 0
	ldr	x0, [x4, w23, sxtw 3]
	ldr	w0, [x0, 1320]
	cmp	w0, 1
	beq	.L281
.L240:
	mov	w5, 0
	mov	w0, 0
	mov	w24, 0
.L197:
	stp	w0, w5, [x19, 12]
	ldr	w0, [x29, 144]
	cmp	w0, 1
	beq	.L282
	mul	w2, w1, w28
	mul	w5, w26, w8
	lsl	w0, w2, 2
	lsl	w21, w24, 2
	sub	w2, w0, w2
	lsl	w0, w5, 2
	sub	w0, w0, w5
	sub	w21, w21, w24
	asr	w0, w0, 1
	add	w0, w0, w2, asr 1
	add	w21, w0, w21, lsr 1
.L199:
	ldr	w0, [x29, 152]
	tbnz	w0, #31, .L200
	stp	w7, w1, [x29, 104]
	stp	w8, w6, [x29, 112]
	str	w3, [x29, 120]
	bl	VCTRL_GetChanWidth
	mov	w23, w0
	ldr	w0, [x29, 152]
	bl	VCTRL_GetChanHeight
	cmn	w23, #1
	ldr	w3, [x29, 120]
	ccmn	w0, #1, 4, ne
	ldp	w7, w1, [x29, 104]
	ldp	w8, w6, [x29, 112]
	beq	.L283
	ldr	w2, [x29, 144]
	add	w23, w23, 15
	and	w23, w23, -16
	add	w0, w0, 15
	cmp	w2, 1
	add	w2, w23, 255
	and	w0, w0, -16
	and	w11, w2, -256
	beq	.L284
	ldr	x2, .LC81
	ldr	w4, [x29, 152]
	ldr	x2, [x2, w4, sxtw 3]
	ldr	w2, [x2, 1320]
	cmp	w2, 1
	beq	.L204
	add	w2, w0, 126
	adds	w0, w0, 63
	csel	w2, w2, w0, mi
	mov	w10, 0
	asr	w2, w2, 6
.L205:
	mul	w2, w11, w2
	mul	w11, w26, w8
	lsl	w5, w2, 2
	sub	w2, w5, w2
	lsl	w0, w11, 2
	lsl	w2, w2, 6
	sub	w0, w0, w11
	asr	w0, w0, 1
	add	w0, w0, w2, asr 1
	add	w0, w0, w10
.L203:
	cmp	w21, w0
	ldr	w23, [x29, 152]
	bgt	.L285
.L200:
	mul	w28, w1, w28
	sub	w0, w25, #16
	cmp	w0, 1
	add	w0, w28, w24
	str	w0, [x19, 36]
	bls	.L286
	cbz	w27, .L209
	cmp	w25, wzr
	ccmp	w25, 3, 4, ne
	beq	.L207
	sdiv	w3, w3, w21
	cmp	w27, 32
	mov	w0, 32
	csel	w27, w27, w0, le
	cmp	w3, w27
	csel	w3, w3, w27, le
	str	w3, [x19, 48]
.L210:
	cbz	w3, .L208
	sub	w0, w3, #1
	mov	x1, 476
	mov	w2, 12
	ldr	w4, [x19, 60]
	umaddl	x2, w0, w2, x1
	add	x1, x19, 464
	mov	w0, w7
	add	x2, x19, x2
	.p2align 2
.L213:
	str	w0, [x1], 12
	add	w0, w0, w21
	cmp	x2, x1
	bne	.L213
	ldr	w0, [x29, 144]
	add	w4, w3, w4
	str	w4, [x19, 60]
	cmp	w0, 1
	beq	.L287
	madd	w6, w21, w3, w6
	add	w0, w6, w22
.L225:
	add	x2, x19, 80
	mov	w1, 0
	.p2align 2
.L217:
	add	w1, w1, 1
	str	w0, [x2], 4
	cmp	w1, w3
	add	w0, w0, 32
	bcc	.L217
.L216:
	ldr	w4, [x19, 56]
	add	w6, w6, w3, lsl 5
	add	w22, w6, w22
	cbz	w4, .L222
	sub	w2, w4, #1
	ldr	w5, [x19, 64]
	add	x2, x2, 27
	add	x1, x19, 208
	mov	w0, w22
	add	x2, x19, x2, lsl 3
	.p2align 2
.L221:
	str	w0, [x1], 8
	add	w0, w0, w20
	cmp	x2, x1
	bne	.L221
	add	w0, w4, w5
	str	w0, [x19, 64]
.L222:
	madd	w20, w20, w4, w6
	str	w20, [x19]
	tbnz	w23, #31, .L220
	ldr	x0, .LC81
	ldr	x0, [x0, w23, sxtw 3]
	cbz	x0, .L220
	add	w0, w20, w22
	cbz	w3, .L220
	sub	w4, w3, #1
	mov	w5, 12
	mov	x2, 860
	add	x1, x19, 848
	umaddl	x2, w4, w5, x2
	add	x2, x19, x2
	.p2align 2
.L223:
	str	w0, [x1], 12
	add	w0, w0, 4096
	cmp	x2, x1
	bne	.L223
.L220:
	add	w20, w20, w3, lsl 12
	mov	w0, 0
	str	w20, [x19]
.L266:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L286:
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
	cbnz	w27, .L207
.L209:
	str	wzr, [x19, 48]
.L208:
	ldr	x2, .LC72
	ldr	x3, .LC87
.L273:
	ldr	x1, .LC73
	add	x2, x2, 208
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
.L207:
	cmp	w27, 32
	mov	w0, 32
	sdiv	w3, w3, w21
	csel	w27, w27, w0, le
	cmp	w27, w3
	csel	w3, w27, w3, le
	str	w3, [x19, 48]
	b	.L210
	.p2align 3
.L279:
	mul	w20, w2, w1
	add	w20, w20, 143
	and	w20, w20, -128
	mul	w3, w26, w20
	cmp	w28, w3
	ble	.L192
	add	w7, w22, 1023
	asr	w0, w20, 1
	and	w7, w7, -1024
	sub	w3, w28, w3
	stp	w0, w26, [x19, 52]
	sub	w6, w7, w22
	add	w28, w21, 255
	sub	w3, w3, w6
	and	w28, w28, -256
	mov	w1, w24
	tbnz	w23, #31, .L196
	ldr	x4, .LC81
	stp	w7, w6, [x29, 104]
	stp	w3, w2, [x29, 112]
	ldr	x0, [x4, w23, sxtw 3]
	str	x4, [x29, 120]
	add	x0, x0, 507904
	add	x0, x0, 2096
	bl	IsMain10Profile
	ldp	w7, w6, [x29, 104]
	ldp	w3, w2, [x29, 112]
	ldr	x4, [x29, 120]
	cbz	w0, .L236
	cmp	w28, wzr
	add	w8, w28, 3
	csel	w8, w8, w28, lt
	add	w9, w24, 31
	asr	w8, w8, 2
	and	w26, w9, -32
	mov	w1, w24
.L195:
	lsl	w0, w28, 4
	str	w0, [x19, 4]
	asr	w0, w0, 1
	str	w0, [x19, 8]
	ldr	x0, [x4, w23, sxtw 3]
	ldr	w0, [x0, 1320]
	cmp	w0, 1
	bne	.L240
.L281:
	cmp	w25, 17
	mov	w0, 1920
	ccmp	w21, w0, 0, ne
	ble	.L240
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
	b	.L197
	.p2align 3
.L282:
	lsl	w0, w2, 4
	mul	w0, w0, w28
	lsl	w21, w0, 2
	sub	w21, w21, w0
	b	.L199
	.p2align 3
.L196:
	lsl	w0, w28, 4
	str	w0, [x19, 4]
	asr	w0, w0, 1
	str	w0, [x19, 8]
.L272:
	mov	w5, 0
	mov	w0, 0
	mov	w8, 0
	mov	w26, 0
	mov	w24, 0
	b	.L197
	.p2align 3
.L287:
	ldr	x0, .LC88
	ldr	x4, [x0]
	cbz	x4, .L215
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
.L215:
	madd	w6, w21, w3, w6
	add	w0, w6, w22
	cbnz	w3, .L225
	b	.L216
	.p2align 3
.L235:
	mov	w20, 128
	movk	w20, 0x24, lsl 16
	b	.L194
	.p2align 3
.L280:
	add	w28, w21, 255
	add	w1, w24, 63
	and	w28, w28, -256
	and	w1, w1, -64
	tbnz	w23, #31, .L196
	ldr	x4, .LC81
	ldr	x0, [x4, w23, sxtw 3]
	ldr	w0, [x0, 1684]
	cmp	w0, 8
	ble	.L237
	cmp	w28, wzr
	add	w8, w28, 3
	csel	w8, w8, w28, lt
	mov	w26, w1
	asr	w8, w8, 2
	b	.L195
	.p2align 3
.L284:
	mul	w0, w0, w11
	lsl	w2, w0, 2
	sub	w0, w2, w0
	b	.L203
	.p2align 3
.L204:
	adds	w5, w0, 63
	add	w2, w0, 126
	csel	w2, w2, w5, mi
	adds	w5, w23, 2047
	add	w23, w23, 4094
	asr	w2, w2, 6
	csel	w5, w23, w5, mi
	and	w5, w5, -2048
	add	w10, w5, 127
	cmp	w5, wzr
	csel	w5, w10, w5, lt
	lsl	w10, w2, 2
	sub	w10, w10, w2
	asr	w5, w5, 7
	lsl	w10, w10, 5
	mul	w10, w5, w10
	lsr	w10, w10, 1
	b	.L205
.L236:
	mov	w1, w24
	mov	w26, 0
	mov	w8, 0
	b	.L195
.L237:
	mov	w26, 0
	mov	w8, 0
	b	.L195
.L186:
	ldr	x2, .LC72
	ldr	x3, .LC74
	b	.L273
.L192:
	ldr	x2, .LC72
	ldr	x3, .LC80
	b	.L273
.L277:
	ldr	x2, .LC72
	ldr	x3, .LC71
	b	.L273
.L283:
	ldr	x1, .LC83
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L266
.L285:
	ldr	x2, .LC72
	ldr	x3, .LC85
	b	.L273
.L278:
	ldr	x2, .LC72
	ldr	x3, .LC76
	b	.L273
	.size	VDMHAL_V5R6C1_ArrangeMem_Specific, .-VDMHAL_V5R6C1_ArrangeMem_Specific
	.align	3
.LC71:
	.xword	.LC70
	.align	3
.LC72:
	.xword	.LANCHOR0
	.align	3
.LC73:
	.xword	.LC13
	.align	3
.LC74:
	.xword	.LC23
	.align	3
.LC76:
	.xword	.LC75
	.align	3
.LC77:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC78:
	.xword	g_not_direct_8x8_inference_flag
	.align	3
.LC80:
	.xword	.LC79
	.align	3
.LC81:
	.xword	s_pstVfmwChan
	.align	3
.LC83:
	.xword	.LC82
	.align	3
.LC85:
	.xword	.LC84
	.align	3
.LC87:
	.xword	.LC86
	.align	3
.LC88:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_ArrangeMem
	.type	VDMHAL_V5R6C1_ArrangeMem, %function
VDMHAL_V5R6C1_ArrangeMem:
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
	beq	.L294
	tbnz	w19, #31, .L295
	mov	w0, w19
	bl	VCTRL_GetVidStd
	cmp	w0, 22
	mov	w1, w0
	beq	.L298
	ldr	x0, .LC91
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w0, [x0, 1616]
	cmp	w0, 1
	beq	.L299
.L293:
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
	bl	VDMHAL_V5R6C1_ArrangeMem_Specific
.L296:
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L295:
	mov	w1, 22
	b	.L293
	.p2align 3
.L294:
	mov	w1, 16
	b	.L293
	.p2align 3
.L299:
	ldr	x6, [x29, 80]
	mov	w5, w23
	mov	w4, w22
	mov	w3, w21
	mov	w2, w20
	mov	w0, w19
	bl	VDMHAL_V5R6C1_ArrangeMem_Normal
	b	.L296
.L298:
	ldr	x1, .LC90
	mov	w2, -1
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L296
	.size	VDMHAL_V5R6C1_ArrangeMem, .-VDMHAL_V5R6C1_ArrangeMem
	.align	3
.LC90:
	.xword	.LC89
	.align	3
.LC91:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_ResetVdm
	.type	VDMHAL_V5R6C1_ResetVdm, %function
VDMHAL_V5R6C1_ResetVdm:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	cmp	w21, wzr
	ble	.L301
	ldr	x2, .LC92
	mov	w4, 0
	ldr	x1, .LC93
	mov	w3, w21
	add	x2, x2, 248
	mov	w0, 0
	bl	dprint_vfmw
.L300:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L301:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L316
	sxtw	x23, w21
	ldr	x20, .LC96
	lsl	x0, x23, 6
	sub	x0, x0, x23
	lsl	x0, x0, 2
	sub	x26, x0, x23
	add	x26, x0, x26, lsl 2
	ldr	x0, [x20, x26]
	add	x1, x0, 61440
	ldr	w24, [x0, 36]
	ldr	w1, [x1, 2052]
	str	w1, [x29, 92]
	and	w1, w1, 3
	cbz	w1, .L300
	ldr	x25, .LC97
	mov	w19, 0
	mov	x22, x26
	ldr	x0, [x25, 224]
	blr	x0
	ldr	x0, [x20, x26]
	add	x0, x0, 61440
	ldr	w1, [x0, 2060]
	str	w1, [x29, 92]
	orr	w1, w1, 2
	strb	w1, [x29, 92]
	ldr	w1, [x29, 92]
	str	w1, [x0, 2060]
	b	.L306
	.p2align 3
.L317:
	add	w19, w19, 1
	cmp	w19, 1000
	beq	.L307
.L306:
	ldr	x1, [x25, 232]
	mov	x0, 30
	blr	x1
	ldr	x0, [x20, x22]
	add	x0, x0, 61440
	ldr	w0, [x0, 2064]
	str	w0, [x29, 92]
	tbz	x0, 1, .L317
	cmp	w19, 999
	bgt	.L307
	ldr	x2, .LC92
	mov	w3, w21
	ldr	x1, .LC101
	mov	w0, 0
	add	x2, x2, 248
	bl	dprint_vfmw
.L309:
	lsl	x0, x23, 6
	ldr	x2, [x25, 224]
	sub	x0, x0, x23
	lsl	x0, x0, 2
	sub	x23, x0, x23
	add	x23, x0, x23, lsl 2
	ldr	x0, [x20, x23]
	add	x0, x0, 61440
	ldr	w1, [x0, 2060]
	str	w1, [x29, 92]
	and	w1, w1, -3
	strb	w1, [x29, 92]
	ldr	w1, [x29, 92]
	str	w1, [x0, 2060]
	blr	x2
	ldr	x0, [x20, x23]
	str	w24, [x0, 36]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L307:
	ldr	x2, .LC92
	mov	w3, w21
	ldr	x1, .LC99
	mov	w0, 0
	add	x2, x2, 248
	bl	dprint_vfmw
	b	.L309
.L316:
	ldr	x1, .LC95
	mov	x2, 0
	bl	dprint_vfmw
	b	.L300
	.size	VDMHAL_V5R6C1_ResetVdm, .-VDMHAL_V5R6C1_ResetVdm
	.align	3
.LC92:
	.xword	.LANCHOR0
	.align	3
.LC93:
	.xword	.LC1
	.align	3
.LC95:
	.xword	.LC94
	.align	3
.LC96:
	.xword	g_HwMem
	.align	3
.LC97:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC99:
	.xword	.LC98
	.align	3
.LC101:
	.xword	.LC100
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_SetSmmuPageTableAddr
	.type	VDMHAL_V5R6C1_SetSmmuPageTableAddr, %function
VDMHAL_V5R6C1_SetSmmuPageTableAddr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC102
	ldr	x3, [x0, 392]
	cbz	x3, .L318
	add	x2, x29, 60
	add	x1, x29, 56
	add	x0, x29, 52
	blr	x3
	cbnz	w19, .L320
	ldr	x0, .LC103
	ldp	w3, w2, [x29, 52]
	ldr	w1, [x29, 60]
	ldr	x0, [x0]
	add	x0, x0, 61440
	str	w3, [x0, 524]
	str	w2, [x0, 772]
	str	w1, [x0, 776]
.L318:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L320:
	ldr	x20, .LC104
	mov	w3, w19
	ldr	x21, .LC106
	mov	w4, 1
	add	x20, x20, 272
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
	.size	VDMHAL_V5R6C1_SetSmmuPageTableAddr, .-VDMHAL_V5R6C1_SetSmmuPageTableAddr
	.align	3
.LC102:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC103:
	.xword	g_HwMem
	.align	3
.LC104:
	.xword	.LANCHOR0
	.align	3
.LC106:
	.xword	.LC105
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_EnableSmmu
	.type	VDMHAL_V5R6C1_EnableSmmu, %function
VDMHAL_V5R6C1_EnableSmmu:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC108
	mov	w1, 8
	movk	w1, 0x3, lsl 16
	ldr	x0, [x0]
	add	x0, x0, 61440
	str	w1, [x0]
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V5R6C1_EnableSmmu, .-VDMHAL_V5R6C1_EnableSmmu
	.align	3
.LC108:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_GlbResetX
	.type	VDMHAL_V5R6C1_GlbResetX, %function
VDMHAL_V5R6C1_GlbResetX:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	str	wzr, [x29, 92]
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L344
	cmp	w19, wzr
	ble	.L345
	ldr	x22, .LC109
	mov	w4, 1
	ldr	x23, .LC114
	mov	w3, w19
	add	x21, x22, 312
	mov	w0, 32
	mov	x1, x23
	mov	x2, x21
	bl	dprint_vfmw
	ldrb	w20, [x29, 92]
	and	w20, w20, 3
	cmp	w20, 1
	beq	.L346
.L325:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L345:
	sxtw	x0, w19
	ldr	x21, .LC112
	lsl	x20, x0, 6
	sub	x20, x20, x0
	lsl	x20, x20, 2
	sub	x0, x20, x0
	add	x20, x20, x0, lsl 2
	ldr	x0, [x21, x20]
	add	x0, x0, 61440
	ldr	w0, [x0, 2052]
	str	w0, [x29, 92]
	and	w0, w0, 3
	cmp	w0, 1
	bne	.L325
	ldr	x24, .LC115
	ldr	x0, [x24, 224]
	blr	x0
	ldr	x22, .LC109
	ldr	x0, [x21, x20]
	add	x0, x0, 61440
	ldr	w1, [x0, 2060]
	str	w1, [x29, 92]
	orr	w1, w1, 1
	strb	w1, [x29, 92]
	ldr	w1, [x29, 92]
	str	w1, [x0, 2060]
	b	.L340
	.p2align 3
.L346:
	ldr	x24, .LC115
	ldr	x0, [x24, 224]
	blr	x0
	mov	w4, w20
	mov	w3, w19
	mov	x2, x21
	mov	x1, x23
	mov	w0, 32
	bl	dprint_vfmw
	ldrb	w5, [x29, 92]
	mov	w4, w20
	ldr	x1, .LC120
	mov	w3, w19
	orr	w5, w5, 1
	mov	x2, x21
	mov	w0, 32
	strb	w5, [x29, 92]
	bl	dprint_vfmw
.L340:
	sxtw	x23, w19
	ldr	x25, .LC114
	lsl	x21, x23, 6
	ldr	x26, .LC112
	sub	x21, x21, x23
	mov	w20, 0
	lsl	x21, x21, 2
	sub	x21, x21, x23
	b	.L335
	.p2align 3
.L332:
	bl	dprint_vfmw
	ldrb	w0, [x29, 92]
	tbnz	x0, 0, .L334
.L347:
	add	w20, w20, 1
	cmp	w20, 1000
	beq	.L336
.L335:
	ldr	x1, [x24, 232]
	mov	x0, 30
	blr	x1
	cmp	w19, wzr
	add	x0, x21, x21, lsl 2
	add	x5, x0, x23
	mov	w4, 1
	mov	w3, w19
	add	x2, x22, 312
	mov	x1, x25
	mov	w0, 32
	bgt	.L332
	ldr	x0, [x26, x5]
	add	x0, x0, 61440
	ldr	w0, [x0, 2064]
	str	w0, [x29, 92]
	ldrb	w0, [x29, 92]
	tbz	x0, 0, .L347
.L334:
	cmp	w20, 999
	bgt	.L336
	ldr	x1, .LC119
	mov	w3, w19
	add	x2, x22, 312
	mov	w0, 0
	bl	dprint_vfmw
.L338:
	cmp	w19, wzr
	ble	.L348
	add	x22, x22, 312
	ldr	x1, .LC114
	mov	w3, w19
	mov	x2, x22
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x1, .LC120
	mov	w3, w19
	mov	x2, x22
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L336:
	ldr	x1, .LC117
	mov	w3, w19
	add	x2, x22, 312
	mov	w0, 0
	bl	dprint_vfmw
	b	.L338
	.p2align 3
.L348:
	lsl	x0, x19, 6
	ldr	x1, .LC112
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	add	x0, x0, x19, lsl 2
	ldr	x0, [x1, x0]
	add	x0, x0, 61440
	ldr	w1, [x0, 2060]
	str	w1, [x29, 92]
	and	w1, w1, -2
	strb	w1, [x29, 92]
	ldr	w1, [x29, 92]
	str	w1, [x0, 2060]
	b	.L325
	.p2align 3
.L344:
	ldr	x2, .LC109
	mov	w3, -121438208
	ldr	x1, .LC111
	add	x2, x2, 312
	bl	dprint_vfmw
	b	.L325
	.size	VDMHAL_V5R6C1_GlbResetX, .-VDMHAL_V5R6C1_GlbResetX
	.align	3
.LC109:
	.xword	.LANCHOR0
	.align	3
.LC111:
	.xword	.LC110
	.align	3
.LC112:
	.xword	g_HwMem
	.align	3
.LC114:
	.xword	.LC113
	.align	3
.LC115:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC117:
	.xword	.LC116
	.align	3
.LC119:
	.xword	.LC118
	.align	3
.LC120:
	.xword	.LC105
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_GlbReset
	.type	VDMHAL_V5R6C1_GlbReset, %function
VDMHAL_V5R6C1_GlbReset:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L352
	mov	w0, 0
	bl	VDMHAL_V5R6C1_GlbResetX
.L349:
	ldp	x29, x30, [sp], 16
	ret
.L352:
	ldr	x2, .LC122
	mov	w3, -121438208
	ldr	x1, .LC123
	add	x2, x2, 336
	bl	dprint_vfmw
	b	.L349
	.size	VDMHAL_V5R6C1_GlbReset, .-VDMHAL_V5R6C1_GlbReset
	.align	3
.LC122:
	.xword	.LANCHOR0
	.align	3
.LC123:
	.xword	.LC110
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_ClearIntState
	.type	VDMHAL_V5R6C1_ClearIntState, %function
VDMHAL_V5R6C1_ClearIntState:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	sxtw	x19, w0
	mov	x0, x30
	mov	x20, x19
	bl	_mcount
	ldr	x21, .LC125
	ldr	x0, .LC124
	add	x1, x21, x19, lsl 6
	ldrsw	x1, [x1, 8]
	ldr	x0, [x0, x1, lsl 3]
	cbz	x0, .L363
	ldr	w22, [x0, 1352]
.L354:
	cmp	w20, wzr
	bgt	.L365
	lsl	x0, x19, 6
	ldr	x23, .LC128
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x20, x0, x19
	add	x20, x0, x20, lsl 2
	ldr	x0, [x23, x20]
	cbz	x0, .L366
.L357:
	cmp	w22, 1
	bne	.L364
	add	x19, x21, x19, lsl 6
	ldr	w1, [x19, 44]
	cmp	w1, 1
	beq	.L364
	ldr	w2, [x0, 28]
	cmp	w1, 2
	beq	.L367
	cmp	w1, 3
	bne	.L353
	mov	w1, -15
	str	w1, [x0, 32]
	b	.L353
	.p2align 3
.L365:
	ldr	x2, .LC126
	mov	w4, 0
	ldr	x1, .LC127
	mov	w3, w20
	add	x2, x2, 360
	mov	w0, 0
	bl	dprint_vfmw
.L353:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L364:
	mov	w1, -1
	str	w1, [x0, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L363:
	mov	w22, 0
	b	.L354
	.p2align 3
.L366:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L358
	str	x0, [x23, x20]
	b	.L357
	.p2align 3
.L367:
	mov	w1, -12
	str	w1, [x0, 32]
	b	.L353
.L358:
	ldr	x1, .LC129
	mov	w0, 0
	bl	dprint_vfmw
	b	.L353
	.size	VDMHAL_V5R6C1_ClearIntState, .-VDMHAL_V5R6C1_ClearIntState
	.align	3
.LC124:
	.xword	s_pstVfmwChan
	.align	3
.LC125:
	.xword	g_VdmDrvParam
	.align	3
.LC126:
	.xword	.LANCHOR0
	.align	3
.LC127:
	.xword	.LC1
	.align	3
.LC128:
	.xword	g_HwMem
	.align	3
.LC129:
	.xword	.LC3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_ClearMMUIntState
	.type	VDMHAL_V5R6C1_ClearMMUIntState, %function
VDMHAL_V5R6C1_ClearMMUIntState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	bgt	.L373
	lsl	x3, x19, 6
	ldr	x20, .LC132
	sub	x3, x3, x19
	lsl	x3, x3, 2
	sub	x19, x3, x19
	add	x19, x3, x19, lsl 2
	ldr	x0, [x20, x19]
	cbz	x0, .L374
.L371:
	add	x0, x0, 61440
	mov	w1, 7
	str	w1, [x0, 44]
.L368:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L373:
	ldr	x2, .LC130
	mov	w3, w19
	ldr	x1, .LC131
	mov	w4, 0
	add	x2, x2, 392
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L374:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L372
	str	x0, [x20, x19]
	b	.L371
.L372:
	ldr	x1, .LC133
	mov	w0, 0
	bl	dprint_vfmw
	b	.L368
	.size	VDMHAL_V5R6C1_ClearMMUIntState, .-VDMHAL_V5R6C1_ClearMMUIntState
	.align	3
.LC130:
	.xword	.LANCHOR0
	.align	3
.LC131:
	.xword	.LC1
	.align	3
.LC132:
	.xword	g_HwMem
	.align	3
.LC133:
	.xword	.LC3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_MaskInt
	.type	VDMHAL_V5R6C1_MaskInt, %function
VDMHAL_V5R6C1_MaskInt:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	bgt	.L380
	lsl	x3, x19, 6
	ldr	x20, .LC136
	sub	x3, x3, x19
	lsl	x3, x3, 2
	sub	x19, x3, x19
	add	x19, x3, x19, lsl 2
	ldr	x0, [x20, x19]
	cbz	x0, .L381
.L378:
	mov	w1, -1
	str	w1, [x0, 36]
.L375:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L380:
	ldr	x2, .LC134
	mov	w3, w19
	ldr	x1, .LC135
	mov	w4, 0
	add	x2, x2, 424
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L381:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L379
	str	x0, [x20, x19]
	b	.L378
.L379:
	ldr	x1, .LC137
	mov	w0, 0
	bl	dprint_vfmw
	b	.L375
	.size	VDMHAL_V5R6C1_MaskInt, .-VDMHAL_V5R6C1_MaskInt
	.align	3
.LC134:
	.xword	.LANCHOR0
	.align	3
.LC135:
	.xword	.LC1
	.align	3
.LC136:
	.xword	g_HwMem
	.align	3
.LC137:
	.xword	.LC3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_GetIntMaskCfg
	.type	VDMHAL_V5R6C1_GetIntMaskCfg, %function
VDMHAL_V5R6C1_GetIntMaskCfg:
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
	.size	VDMHAL_V5R6C1_GetIntMaskCfg, .-VDMHAL_V5R6C1_GetIntMaskCfg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_EnableInt
	.type	VDMHAL_V5R6C1_EnableInt, %function
VDMHAL_V5R6C1_EnableInt:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC139
	sxtw	x0, w19
	ldr	x2, .LC138
	add	x1, x1, x0, lsl 6
	ldrsw	x1, [x1, 8]
	ldr	x1, [x2, x1, lsl 3]
	cbz	x1, .L393
	ldr	w20, [x1, 1352]
.L386:
	cmp	w19, wzr
	bgt	.L394
	lsl	x19, x0, 6
	ldr	x21, .LC142
	sub	x19, x19, x0
	lsl	x19, x19, 2
	sub	x0, x19, x0
	add	x19, x19, x0, lsl 2
	ldr	x0, [x21, x19]
	cbz	x0, .L395
.L389:
	mov	w1, -6
	mov	w2, -2
	cmp	w20, 1
	csel	w1, w1, w2, eq
	str	w1, [x0, 36]
.L385:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L394:
	ldr	x2, .LC140
	mov	w3, w19
	ldr	x1, .LC141
	mov	w4, 0
	add	x2, x2, 448
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L393:
	mov	w20, 0
	b	.L386
	.p2align 3
.L395:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L390
	str	x0, [x21, x19]
	b	.L389
.L390:
	ldr	x1, .LC143
	mov	w0, 0
	bl	dprint_vfmw
	b	.L385
	.size	VDMHAL_V5R6C1_EnableInt, .-VDMHAL_V5R6C1_EnableInt
	.align	3
.LC138:
	.xword	s_pstVfmwChan
	.align	3
.LC139:
	.xword	g_VdmDrvParam
	.align	3
.LC140:
	.xword	.LANCHOR0
	.align	3
.LC141:
	.xword	.LC1
	.align	3
.LC142:
	.xword	g_HwMem
	.align	3
.LC143:
	.xword	.LC3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_CheckReg
	.type	VDMHAL_V5R6C1_CheckReg, %function
VDMHAL_V5R6C1_CheckReg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w22, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w19, wzr
	bgt	.L413
	lsl	x0, x19, 6
	ldr	x21, .LC147
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x20, x0, x19
	add	x20, x0, x20, lsl 2
	ldr	x0, [x21, x20]
	cbz	x0, .L414
.L399:
	sub	w0, w22, #1
	cmp	w0, 6
	bls	.L415
	ldr	x2, .LC144
	mov	w3, w22
	ldr	x1, .LC151
	mov	w0, 0
	add	x2, x2, 472
	bl	dprint_vfmw
	mov	w0, 0
.L412:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L415:
	ldr	x1, .LC152
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx406
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx406:
	.section	.rodata
	.align	0
	.align	2
.L406:
	.byte	(.L410 - .Lrtx406) / 4
	.byte	(.L407 - .Lrtx406) / 4
	.byte	(.L408 - .Lrtx406) / 4
	.byte	(.L409 - .Lrtx406) / 4
	.byte	(.L411 - .Lrtx406) / 4
	.byte	(.L401 - .Lrtx406) / 4
	.byte	(.L403 - .Lrtx406) / 4
	.text
	.p2align 3
.L411:
	mov	x1, 61480
.L405:
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
.L410:
	mov	x1, 28
	b	.L405
	.p2align 3
.L409:
	mov	x1, 40
	b	.L405
	.p2align 3
.L408:
	mov	x1, 36
	b	.L405
	.p2align 3
.L407:
	mov	x1, 32
	b	.L405
	.p2align 3
.L403:
	mov	x1, 62272
	b	.L405
	.p2align 3
.L401:
	mov	x1, 62304
	b	.L405
	.p2align 3
.L414:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L400
	str	x0, [x21, x20]
	b	.L399
	.p2align 3
.L413:
	ldr	x2, .LC144
	mov	w3, w19
	ldr	x1, .LC146
	mov	w0, 0
	add	x2, x2, 472
	bl	dprint_vfmw
	mov	w0, -1
	b	.L412
.L400:
	ldr	x2, .LC144
	mov	w0, 0
	ldr	x1, .LC149
	add	x2, x2, 472
	bl	dprint_vfmw
	mov	w0, 0
	b	.L412
	.size	VDMHAL_V5R6C1_CheckReg, .-VDMHAL_V5R6C1_CheckReg
	.align	3
.LC144:
	.xword	.LANCHOR0
	.align	3
.LC146:
	.xword	.LC145
	.align	3
.LC147:
	.xword	g_HwMem
	.align	3
.LC149:
	.xword	.LC148
	.align	3
.LC151:
	.xword	.LC150
	.align	3
.LC152:
	.xword	.L406
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_ReadMMUMask
	.type	VDMHAL_V5R6C1_ReadMMUMask, %function
VDMHAL_V5R6C1_ReadMMUMask:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	ble	.L419
	ldr	x2, .LC154
	mov	w3, w19
	ldr	x1, .LC155
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L419:
	lsl	x0, x19, 6
	ldr	x1, .LC153
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
	.size	VDMHAL_V5R6C1_ReadMMUMask, .-VDMHAL_V5R6C1_ReadMMUMask
	.align	3
.LC153:
	.xword	g_HwMem
	.align	3
.LC154:
	.xword	.LANCHOR1
	.align	3
.LC155:
	.xword	.LC113
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_WriteMMUMask
	.type	VDMHAL_V5R6C1_WriteMMUMask, %function
VDMHAL_V5R6C1_WriteMMUMask:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w19, wzr
	ble	.L423
	ldr	x2, .LC157
	mov	w3, w19
	ldr	x1, .LC158
	mov	w4, 1
	add	x2, x2, 32
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L423:
	lsl	x0, x19, 6
	ldr	x1, .LC156
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
	.size	VDMHAL_V5R6C1_WriteMMUMask, .-VDMHAL_V5R6C1_WriteMMUMask
	.align	3
.LC156:
	.xword	g_HwMem
	.align	3
.LC157:
	.xword	.LANCHOR1
	.align	3
.LC158:
	.xword	.LC105
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_PrepareDec
	.type	VDMHAL_V5R6C1_PrepareDec, %function
VDMHAL_V5R6C1_PrepareDec:
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
	cbz	x22, .L444
	cmp	w21, wzr
	bgt	.L445
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
	cmp	w20, 18
	bls	.L446
.L443:
	mov	w0, -1
	b	.L426
	.p2align 3
.L446:
	ldr	x0, .LC163
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx429
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx429:
	.section	.rodata
	.align	0
	.align	2
.L429:
	.byte	(.L439 - .Lrtx429) / 4
	.byte	(.L430 - .Lrtx429) / 4
	.byte	(.L431 - .Lrtx429) / 4
	.byte	(.L432 - .Lrtx429) / 4
	.byte	(.L443 - .Lrtx429) / 4
	.byte	(.L433 - .Lrtx429) / 4
	.byte	(.L434 - .Lrtx429) / 4
	.byte	(.L443 - .Lrtx429) / 4
	.byte	(.L435 - .Lrtx429) / 4
	.byte	(.L436 - .Lrtx429) / 4
	.byte	(.L437 - .Lrtx429) / 4
	.byte	(.L437 - .Lrtx429) / 4
	.byte	(.L437 - .Lrtx429) / 4
	.byte	(.L438 - .Lrtx429) / 4
	.byte	(.L443 - .Lrtx429) / 4
	.byte	(.L439 - .Lrtx429) / 4
	.byte	(.L440 - .Lrtx429) / 4
	.byte	(.L441 - .Lrtx429) / 4
	.byte	(.L442 - .Lrtx429) / 4
	.text
	.p2align 3
.L439:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	H264HAL_V5R6C1_StartDec
.L426:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L441:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	VP9HAL_V5R6C1_StartDec
	b	.L426
	.p2align 3
.L440:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	HEVCHAL_V5R6C1_StartDec
	b	.L426
	.p2align 3
.L438:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	VP8HAL_V5R6C1_StartDec
	b	.L426
	.p2align 3
.L437:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	VP6HAL_V5R6C1_StartDec
	b	.L426
	.p2align 3
.L436:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	RV9HAL_V5R6C1_StartDec
	b	.L426
	.p2align 3
.L435:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	RV8HAL_V5R6C1_StartDec
	b	.L426
	.p2align 3
.L434:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	AVSHAL_V5R6C1_StartDec
	b	.L426
	.p2align 3
.L433:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	DIVX3HAL_V5R6C1_StartDec
	b	.L426
	.p2align 3
.L432:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	MP2HAL_V5R6C1_StartDec
	b	.L426
	.p2align 3
.L431:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	MP4HAL_V5R6C1_StartDec
	b	.L426
	.p2align 3
.L430:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	VC1HAL_V5R6C1_StartDec
	b	.L426
	.p2align 3
.L442:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	AVS2HAL_V5R6C1_StartDec
	b	.L426
	.p2align 3
.L445:
	ldr	x2, .LC159
	mov	w3, w21
	ldr	x1, .LC162
	mov	w4, 0
	add	x2, x2, 64
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L444:
	ldr	x2, .LC159
	mov	x3, 0
	ldr	x1, .LC161
	mov	w0, 0
	add	x2, x2, 64
	bl	dprint_vfmw
	mov	w0, -1
	b	.L426
	.size	VDMHAL_V5R6C1_PrepareDec, .-VDMHAL_V5R6C1_PrepareDec
	.align	3
.LC159:
	.xword	.LANCHOR1
	.align	3
.LC161:
	.xword	.LC160
	.align	3
.LC162:
	.xword	.LC1
	.align	3
.LC163:
	.xword	.L429
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_IsVdmReady
	.type	VDMHAL_V5R6C1_IsVdmReady, %function
VDMHAL_V5R6C1_IsVdmReady:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sxtw	x0, w19
	ldr	x2, .LC164
	lsl	x1, x0, 6
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x0, x1, x0
	add	x0, x1, x0, lsl 2
	ldr	x0, [x2, x0]
	cbz	x0, .L452
	cmp	w19, wzr
	ble	.L453
	ldr	x2, .LC167
	mov	w4, 1
	ldr	x1, .LC169
	mov	w3, w19
	add	x2, x2, 96
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, 0
.L449:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L453:
	ldr	w0, [x0, 28]
	ldr	x19, [sp, 16]
	ubfx	x0, x0, 17, 1
	ldp	x29, x30, [sp], 32
	ret
.L452:
	ldr	x2, .LC167
	ldr	x3, .LC166
	ldr	x1, .LC168
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L449
	.size	VDMHAL_V5R6C1_IsVdmReady, .-VDMHAL_V5R6C1_IsVdmReady
	.align	3
.LC164:
	.xword	g_HwMem
	.align	3
.LC166:
	.xword	.LC165
	.align	3
.LC167:
	.xword	.LANCHOR1
	.align	3
.LC168:
	.xword	.LC13
	.align	3
.LC169:
	.xword	.LC113
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_IsVdmRun
	.type	VDMHAL_V5R6C1_IsVdmRun, %function
VDMHAL_V5R6C1_IsVdmRun:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sxtw	x0, w19
	ldr	x2, .LC170
	lsl	x1, x0, 6
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x0, x1, x0
	add	x0, x1, x0, lsl 2
	ldr	x0, [x2, x0]
	cbz	x0, .L459
	cmp	w19, wzr
	ble	.L460
	ldr	x2, .LC173
	mov	w4, 1
	ldr	x1, .LC174
	mov	w3, w19
	add	x2, x2, 128
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, 1
.L456:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L460:
	ldr	w0, [x0, 40]
	ldr	x19, [sp, 16]
	cmp	w0, 1
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L459:
	ldr	x1, .LC172
	bl	dprint_vfmw
	mov	w0, 0
	b	.L456
	.size	VDMHAL_V5R6C1_IsVdmRun, .-VDMHAL_V5R6C1_IsVdmRun
	.align	3
.LC170:
	.xword	g_HwMem
	.align	3
.LC172:
	.xword	.LC171
	.align	3
.LC173:
	.xword	.LANCHOR1
	.align	3
.LC174:
	.xword	.LC113
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_IsVdhDecOver
	.type	VDMHAL_V5R6C1_IsVdhDecOver, %function
VDMHAL_V5R6C1_IsVdhDecOver:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	sxtw	x0, w20
	ldr	x1, .LC175
	lsl	x2, x0, 6
	sub	x2, x2, x0
	lsl	x2, x2, 2
	sub	x0, x2, x0
	add	x0, x2, x0, lsl 2
	ldr	x0, [x1, x0]
	cbz	x0, .L469
	mov	w1, w20
	mov	w0, w19
	bl	VDMHAL_V5R6C1_CheckReg
	cmp	w19, 2
	beq	.L466
	cmp	w19, 3
	beq	.L466
	cmp	w19, 1
	ubfx	x0, x0, 17, 1
	beq	.L463
	ldr	x2, .LC177
	mov	w3, w19
	ldr	x1, .LC179
	mov	w0, 0
	add	x2, x2, 152
	bl	dprint_vfmw
	mov	w0, 0
.L463:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L466:
	and	w0, w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L469:
	ldr	x2, .LC177
	ldr	x3, .LC176
	ldr	x1, .LC178
	add	x2, x2, 152
	bl	dprint_vfmw
	mov	w0, -1
	b	.L463
	.size	VDMHAL_V5R6C1_IsVdhDecOver, .-VDMHAL_V5R6C1_IsVdhDecOver
	.align	3
.LC175:
	.xword	g_HwMem
	.align	3
.LC176:
	.xword	.LC165
	.align	3
.LC177:
	.xword	.LANCHOR1
	.align	3
.LC178:
	.xword	.LC13
	.align	3
.LC179:
	.xword	.LC150
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_IsVdhPartDecOver
	.type	VDMHAL_V5R6C1_IsVdhPartDecOver, %function
VDMHAL_V5R6C1_IsVdhPartDecOver:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	sxtw	x0, w20
	ldr	x1, .LC180
	lsl	x2, x0, 6
	sub	x2, x2, x0
	lsl	x2, x2, 2
	sub	x0, x2, x0
	add	x0, x2, x0, lsl 2
	ldr	x0, [x1, x0]
	cbz	x0, .L478
	mov	w1, w20
	mov	w0, w19
	bl	VDMHAL_V5R6C1_CheckReg
	cmp	w19, 1
	beq	.L474
	cmp	w19, 2
	ubfx	x0, x0, 2, 1
	bne	.L479
.L472:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L479:
	ldr	x2, .LC182
	mov	w3, w19
	ldr	x1, .LC184
	mov	w0, 0
	add	x2, x2, 184
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L474:
	ubfx	x0, x0, 19, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L478:
	ldr	x2, .LC182
	ldr	x3, .LC181
	ldr	x1, .LC183
	add	x2, x2, 184
	bl	dprint_vfmw
	mov	w0, -1
	b	.L472
	.size	VDMHAL_V5R6C1_IsVdhPartDecOver, .-VDMHAL_V5R6C1_IsVdhPartDecOver
	.align	3
.LC180:
	.xword	g_HwMem
	.align	3
.LC181:
	.xword	.LC165
	.align	3
.LC182:
	.xword	.LANCHOR1
	.align	3
.LC183:
	.xword	.LC13
	.align	3
.LC184:
	.xword	.LC150
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_UpdateHardwareInfo
	.type	VDMHAL_V5R6C1_UpdateHardwareInfo, %function
VDMHAL_V5R6C1_UpdateHardwareInfo:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w22, w0
	mov	x0, x30
	bl	_mcount
	cmp	w22, wzr
	bgt	.L481
	ldr	x4, .LC185
	add	x0, x4, 4
	add	x4, x4, 128
	ldr	w1, [x4, -128]
	cmp	w1, 1
	bne	.L485
	b	.L496
	.p2align 3
.L506:
	cmp	x0, x4
	beq	.L505
.L485:
	ldr	w1, [x0]
	add	x0, x0, 4
	cmp	w1, 1
	bne	.L506
.L496:
	mov	w19, w1
.L482:
	sxtw	x20, w22
	ldr	x24, .LC190
	lsl	x0, x20, 6
	sub	x0, x0, x20
	lsl	x0, x0, 2
	sub	x21, x0, x20
	add	x21, x0, x21, lsl 2
	ldr	x1, [x24, x21]
	cbz	x1, .L507
.L486:
	lsl	x0, x20, 2
	ldr	x21, .LC192
	sub	x4, x0, x20
	ldr	x2, .LC196
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
	beq	.L508
	cmp	w19, 1
	beq	.L509
	ldr	w5, [x1, 4096]
	ldr	w3, [x1, 4108]
	ldr	w2, [x1, 208]
	ldr	w0, [x1, 212]
	stp	w2, w0, [x4, 8]
	stp	w5, w3, [x4, 16]
	cbz	w19, .L510
.L491:
	mov	w0, 180
	add	x4, x1, 32768
	add	x1, x4, 256
	smull	x2, w22, w0
	add	x0, x2, 52
	add	x2, x2, 180
	add	x0, x21, x0
	add	x3, x21, x2
	.p2align 2
.L492:
	ldr	w2, [x1], 4
	str	w2, [x0], 4
	cmp	x3, x0
	bne	.L492
	mov	w0, 0
	cbnz	w19, .L499
	lsl	x1, x20, 2
	ldr	w3, [x4, 384]
	sub	x20, x1, x20
	ldr	w2, [x4, 388]
	lsl	x1, x20, 4
	sub	x1, x1, x20
	add	x21, x21, x1, lsl 2
	stp	w2, w3, [x21, 44]
.L499:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L510:
	ldr	w5, [x1, 176]
	ldr	w0, [x1, 180]
	stp	w5, w0, [x4, 24]
	ldr	w3, [x1, 184]
	ldr	w2, [x1, 188]
	ldr	w0, [x1, 192]
	stp	w3, w2, [x4, 32]
	str	w0, [x4, 40]
	b	.L491
	.p2align 3
.L505:
	mov	w19, 0
	b	.L482
.L508:
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
.L509:
	sub	x0, x5, x20
	and	w23, w3, 131071
	lsl	x0, x0, 2
	sub	x1, x0, x20
	add	x0, x0, x1, lsl 2
	add	x0, x24, x0
	ldr	w0, [x0, 56]
	bl	MEM_Phy2Vir
	cbz	x0, .L511
	sub	w1, w23, #1
	cmp	w1, 199
	bhi	.L497
	lsl	w1, w23, 2
	sub	w1, w1, #4
	lsl	x1, x1, 2
	add	x3, x1, 8
.L490:
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
	b	.L491
.L507:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L487
	str	x0, [x24, x21]
	mov	x1, x0
	b	.L486
.L497:
	mov	x3, 8
	mov	x1, 0
	b	.L490
.L481:
	ldr	x2, .LC186
	mov	w4, 0
	ldr	x1, .LC187
	mov	w3, w22
	add	x2, x2, 216
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L499
.L511:
	ldr	x2, .LC186
	ldr	x3, .LC194
	ldr	x1, .LC195
	add	x2, x2, 216
	bl	dprint_vfmw
	mov	w0, -1
	b	.L499
.L487:
	ldr	x1, .LC191
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L499
	.size	VDMHAL_V5R6C1_UpdateHardwareInfo, .-VDMHAL_V5R6C1_UpdateHardwareInfo
	.align	3
.LC185:
	.xword	g_DSPState
	.align	3
.LC186:
	.xword	.LANCHOR1
	.align	3
.LC187:
	.xword	.LC1
	.align	3
.LC190:
	.xword	g_HwMem
	.align	3
.LC191:
	.xword	.LC3
	.align	3
.LC192:
	.xword	g_BackUp
	.align	3
.LC194:
	.xword	.LC193
	.align	3
.LC195:
	.xword	.LC13
	.align	3
.LC196:
	.xword	g_VdmDrvParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_ReadMsgSlot
	.type	VDMHAL_V5R6C1_ReadMsgSlot, %function
VDMHAL_V5R6C1_ReadMsgSlot:
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
	beq	.L516
	cmp	w19, 800
	bhi	.L517
	ldr	x3, .LC201
	ubfiz	x2, x19, 2, 30
	mov	x1, x21
	mov	x0, x20
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L514:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L517:
	ldr	x1, .LC200
	mov	w2, w19
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L514
	.p2align 3
.L516:
	ldr	x1, .LC198
	mov	x3, x21
	mov	x2, x20
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L514
	.size	VDMHAL_V5R6C1_ReadMsgSlot, .-VDMHAL_V5R6C1_ReadMsgSlot
	.align	3
.LC198:
	.xword	.LC197
	.align	3
.LC200:
	.xword	.LC199
	.align	3
.LC201:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_WriteMsgSlot
	.type	VDMHAL_V5R6C1_WriteMsgSlot, %function
VDMHAL_V5R6C1_WriteMsgSlot:
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
	beq	.L519
	sub	w0, w21, #1
	cmp	w0, 255
	bhi	.L519
	ldr	x3, .LC204
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
.L519:
	ldr	x1, .LC203
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	VDMHAL_V5R6C1_WriteMsgSlot, .-VDMHAL_V5R6C1_WriteMsgSlot
	.align	3
.LC203:
	.xword	.LC202
	.align	3
.LC204:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_CfgRpMsg
	.type	VDMHAL_V5R6C1_CfgRpMsg, %function
VDMHAL_V5R6C1_CfgRpMsg:
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
	cbz	x0, .L569
	ldr	w2, [x19, 44]
	sub	w0, w2, #1
	cmp	w0, 199
	bhi	.L570
	ldr	w3, [x19, 64]
	ldp	w0, w2, [x19, 28]
	ldr	w6, [x19, 4]
	lsl	w0, w0, w3
	lsl	w2, w2, w3
	add	w1, w0, 255
	cmp	w0, 1920
	and	w1, w1, -256
	lsl	w3, w1, 4
	bgt	.L566
	cmp	w6, 17
	beq	.L566
	strb	wzr, [x19]
	mov	w4, 0
	strb	wzr, [x19, 1]
.L529:
	cmp	w6, 16
	beq	.L530
.L574:
	add	w0, w2, 31
	mov	w23, 8
	and	w0, w0, -32
	madd	w0, w0, w1, w4
.L553:
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
	cbnz	w0, .L571
.L532:
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
	bls	.L572
.L534:
	ldr	w0, [x19, 56]
	mov	w11, 0
	cbz	w0, .L573
.L535:
	cmp	w0, 1
	beq	.L551
.L579:
	sub	w11, w11, #1
	uxth	w11, w11
.L552:
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
.L565:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L566:
	ldrb	w4, [x19]
	strb	wzr, [x19, 1]
	cmp	w4, 1
	mov	w4, 0
	bne	.L529
	adds	w4, w0, 2047
	add	w0, w0, 4094
	csel	w0, w0, w4, mi
	add	w5, w2, 126
	and	w0, w0, -2048
	cmp	w0, wzr
	add	w4, w0, 127
	csel	w0, w4, w0, lt
	adds	w7, w2, 63
	csel	w4, w5, w7, mi
	asr	w0, w0, 7
	asr	w4, w4, 6
	cmp	w6, 16
	lsl	w4, w4, 5
	mul	w4, w0, w4
	bne	.L574
.L530:
	madd	w0, w2, w1, w4
	mov	w23, 10
	b	.L553
	.p2align 3
.L571:
	add	w0, w3, 15
	cmp	w3, wzr
	csel	w1, w0, w3, lt
	asr	w1, w1, 4
	b	.L532
	.p2align 3
.L573:
	ldr	w0, [x19, 64]
	cmp	w0, 6
	beq	.L556
	cmp	w0, 5
	beq	.L557
	cmp	w0, 4
	mov	w2, 8
	beq	.L536
	ldr	x1, .LC212
	mov	w0, 1
	bl	dprint_vfmw
	mov	w2, 1
.L536:
	ldr	w8, [x19, 44]
	cmp	w8, wzr
	ble	.L567
	mul	w12, w22, w21
	mov	w4, 0
	mov	w6, 0
	sub	w13, w12, #1
	mov	w11, 0
	sub	w9, w2, #1
	b	.L539
	.p2align 3
.L577:
	ldrsh	w6, [x10, 74]
	sub	w6, w6, #1
	add	w6, w6, w2
	udiv	w6, w6, w2
	mul	w6, w6, w2
	cmp	w0, w6
	bgt	.L542
.L541:
	add	w4, w4, 1
	cmp	w4, w8
	bge	.L575
.L550:
	cmp	w4, 199
	bgt	.L576
.L539:
	add	x10, x19, x4, sxtw 2
	cmp	w4, wzr
	ldrsh	w1, [x10, 78]
	sub	w0, w1, #1
	add	w0, w0, w2
	udiv	w0, w0, w2
	mul	w0, w0, w2
	bgt	.L577
	ccmp	w0, w6, 0, ne
	ble	.L541
.L544:
	ldrsh	w1, [x10, 76]
	cmp	w12, w0
	csel	w0, w0, w13, hi
	add	w5, w11, 1
	udiv	w1, w1, w2
	mul	w1, w1, w2
	cmp	w1, w0
	csel	w1, w1, wzr, le
	cmp	w5, 250
	bgt	.L578
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
	blt	.L550
.L575:
	ldr	w0, [x19, 56]
	cmp	w0, 1
	bne	.L579
	.p2align 2
.L551:
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
	b	.L552
	.p2align 3
.L572:
	add	w22, w22, w22, lsr 31
	asr	w22, w22, 1
	b	.L534
	.p2align 3
.L545:
	udiv	w0, w0, w2
	ldrsh	w1, [x5, 80]
	udiv	w1, w1, w2
	mul	w0, w0, w2
	mul	w1, w1, w2
	cmp	w0, w1
	add	w14, w1, 1
	bhi	.L546
	sub	w1, w4, #1
	cmp	w0, w14
	add	x1, x19, x1, sxtw 2
	beq	.L546
	ldrsh	w1, [x1, 78]
	sub	w1, w1, #1
	add	w1, w1, w2
	udiv	w1, w1, w2
	mul	w1, w1, w2
	cmp	w0, w1
	bhi	.L544
.L546:
	cmp	w7, 199
	mov	w4, w3
	bgt	.L580
	ldrsh	w1, [x5, 82]
.L542:
	add	w3, w4, 1
	add	x5, x19, x4, sxtw 2
	cmp	w8, w3
	add	w0, w9, w1
	add	w7, w3, 1
	bgt	.L545
	udiv	w0, w0, w2
	mul	w0, w0, w2
	b	.L544
.L557:
	mov	w2, 4
	b	.L536
	.p2align 3
.L580:
	add	x0, x19, x3, sxtw 2
	ldrsh	w0, [x0, 78]
	sub	w0, w0, #1
	add	w0, w0, w2
	udiv	w0, w0, w2
	mul	w0, w0, w2
	b	.L544
.L576:
	ldr	x2, .LC207
	mov	w3, 2123
	ldr	x1, .LC214
	mov	w0, 0
	add	x2, x2, 280
	bl	dprint_vfmw
.L567:
	mov	w11, 0
	ldr	w0, [x19, 56]
	b	.L535
.L556:
	mov	w2, 2
	b	.L536
.L578:
	mov	w0, 1
	str	w0, [x19, 56]
	b	.L551
.L570:
	ldr	x1, .LC210
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L565
.L569:
	ldr	x2, .LC207
	mov	w0, 0
	ldr	x3, .LC206
	ldr	x1, .LC208
	add	x2, x2, 256
	bl	dprint_vfmw
	mov	w0, -1
	b	.L565
	.size	VDMHAL_V5R6C1_CfgRpMsg, .-VDMHAL_V5R6C1_CfgRpMsg
	.align	3
.LC206:
	.xword	.LC205
	.align	3
.LC207:
	.xword	.LANCHOR1
	.align	3
.LC208:
	.xword	.LC13
	.align	3
.LC210:
	.xword	.LC209
	.align	3
.LC212:
	.xword	.LC211
	.align	3
.LC214:
	.xword	.LC213
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_MakeDecReport
	.type	VDMHAL_V5R6C1_MakeDecReport, %function
VDMHAL_V5R6C1_MakeDecReport:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L611
	ldr	x23, [x19, 8]
	ldr	w21, [x19]
	ldr	w22, [x19, 16]
	cbz	x23, .L612
	sxtw	x22, w22
	ldr	x20, .LC223
	lsl	x0, x22, 6
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x1, x0, x22
	add	x0, x0, x1, lsl 2
	ldr	x0, [x20, x0]
	cbz	x0, .L585
	ldr	x2, .LC224
	add	x0, x2, 4
	add	x2, x2, 128
	ldr	w1, [x2, -128]
	cmp	w1, 1
	bne	.L588
	b	.L600
	.p2align 3
.L614:
	cmp	x0, x2
	beq	.L613
.L588:
	ldr	w1, [x0]
	add	x0, x0, 4
	cmp	w1, 1
	bne	.L614
.L600:
	mov	w19, w1
.L586:
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
	beq	.L601
	and	w1, w1, 131072
	cmp	w1, wzr
	ccmp	w21, 3, 0, ne
	cset	w1, ne
.L589:
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
	beq	.L615
.L590:
	cmp	w2, 200
	bhi	.L616
.L592:
	lsl	x0, x22, 6
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x1, x0, x22
	add	x0, x0, x1, lsl 2
	add	x20, x20, x0
	ldr	w21, [x20, 56]
	mov	w0, w21
	bl	MEM_Phy2Vir
	cbz	x0, .L617
	lsl	x3, x22, 2
	ldr	x19, .LC234
	sub	x3, x3, x22
	ldr	w2, [x23, 12]
	mov	x1, x0
	add	x20, x22, x3, lsl 3
	lsl	w2, w2, 2
	lsl	x24, x20, 7
	add	x0, x19, x24
	bl	VDMHAL_V5R6C1_ReadMsgSlot
	ldr	w1, [x19, x24]
	ldr	w0, [x23, 12]
	lsr	w1, w1, 31
	str	w1, [x23, 16]
	cbz	w0, .L597
	sub	w2, w0, #1
	mov	x5, 26
	add	x1, x23, 22
	mov	w0, 2
	add	x5, x5, x2, uxtw 2
	lsl	x3, x20, 5
	add	x5, x23, x5
	.p2align 2
.L596:
	sub	w2, w0, #1
	add	x4, x3, x0, uxtw
	add	x2, x3, x2
	add	w0, w0, 4
	ldr	w2, [x19, x2, lsl 2]
	strh	w2, [x1, -2]
	ldr	w2, [x19, x4, lsl 2]
	strh	w2, [x1], 4
	cmp	x5, x1
	bne	.L596
.L597:
	mov	w0, 6
	bl	IsDprintTypeEnable
	cbnz	w0, .L618
.L583:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L615:
	cmp	w19, 1
	beq	.L619
	ldr	x1, .LC230
	ldrb	w1, [x1]
	cbnz	w1, .L590
	ldrb	w0, [x0, 19]
	and	w0, w0, 3
	cmp	w0, 2
	bne	.L590
	mov	w0, 1
	strh	wzr, [x23, 20]
	str	w0, [x23, 12]
	mov	w0, 0
	strh	wzr, [x23, 22]
	b	.L583
	.p2align 3
.L613:
	mov	w19, 0
	b	.L586
	.p2align 3
.L618:
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
.L598:
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
	bhi	.L598
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
.L601:
	mov	w1, 0
	b	.L589
	.p2align 3
.L616:
	ldr	x1, .LC232
	mov	w3, 200
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x23, 12]
	b	.L592
	.p2align 3
.L619:
	ldr	w0, [x0, 16]
	ubfx	x0, x0, 21, 2
	cmp	w0, 2
	bne	.L590
	strh	wzr, [x23, 20]
	mov	w0, 0
	strh	wzr, [x23, 22]
	str	w19, [x23, 12]
	b	.L583
.L617:
	ldr	x2, .LC219
	ldr	x3, .LC233
	ldr	x1, .LC220
	add	x2, x2, 304
	bl	dprint_vfmw
	mov	w0, -1
	b	.L583
.L585:
	ldr	x2, .LC219
	ldr	x3, .LC225
.L609:
	ldr	x1, .LC220
	mov	w0, 0
	add	x2, x2, 304
	bl	dprint_vfmw
	mov	w0, -1
	b	.L583
.L612:
	ldr	x2, .LC219
	ldr	x3, .LC222
	b	.L609
.L611:
	ldr	x2, .LC219
	ldr	x3, .LC218
	b	.L609
	.size	VDMHAL_V5R6C1_MakeDecReport, .-VDMHAL_V5R6C1_MakeDecReport
	.align	3
.LC218:
	.xword	.LC217
	.align	3
.LC219:
	.xword	.LANCHOR1
	.align	3
.LC220:
	.xword	.LC13
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
	.xword	.LC165
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
	.xword	.LC193
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
	.global	VDMHAL_V5R6C1_PrepareRepair
	.type	VDMHAL_V5R6C1_PrepareRepair, %function
VDMHAL_V5R6C1_PrepareRepair:
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
	mov	x24, x1
	mov	w26, w2
	mov	x23, x4
	bl	_mcount
	ldr	x25, .LC243
	lsl	x0, x19, 6
	cmp	w19, wzr
	sub	x0, x0, x19
	mov	x21, x19
	lsl	x0, x0, 2
	sub	x20, x0, x19
	add	x20, x0, x20, lsl 2
	add	x27, x20, x25
	bgt	.L631
	ldr	x0, [x20, x25]
	cbz	x0, .L632
	cbz	w26, .L633
.L625:
	cmp	w26, 1
	mov	w20, 0
	beq	.L634
.L622:
	mov	w0, w20
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L632:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L624
	str	x0, [x20, x25]
	cbnz	w26, .L625
	.p2align 2
.L633:
	lsl	x0, x19, 3
	ldr	x25, .LC248
	sub	x0, x0, x19
	lsl	x0, x0, 3
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	add	x0, x25, x0, lsl 3
	ldr	w1, [x0, 44]
	cmp	w1, wzr
	ble	.L626
	cmp	w22, 6
	bne	.L627
	ldrb	w1, [x24, 17]
	mov	w2, 0
	cmp	w1, 1
	csel	w1, w1, w2, eq
	str	w1, [x0, 928]
.L627:
	mov	x3, x23
	mov	w2, w21
	add	x1, x27, 64
	mov	x0, x27
	mov	w20, 0
	bl	VDMHAL_V5R6C1_CfgRpReg.isra.9
	lsl	x0, x19, 3
	mov	w2, w21
	sub	x0, x0, x19
	mov	x1, x27
	lsl	x0, x0, 3
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	add	x0, x25, x0, lsl 3
	bl	VDMHAL_V5R6C1_CfgRpMsg
	ldr	x27, [sp, 80]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L634:
	cmp	w22, 6
	bne	.L629
	ldrb	w0, [x24, 17]
	cmp	w0, 1
	bne	.L629
	lsl	x0, x19, 3
	ldr	x22, .LC248
	sub	x0, x0, x19
	lsl	x0, x0, 3
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	lsl	x19, x19, 3
	add	x0, x22, x19
	ldr	w1, [x0, 920]
	cmp	w1, wzr
	ble	.L629
	mov	w4, 2
	mov	x3, x23
	str	w4, [x0, 928]
	mov	w2, w21
	add	x1, x27, 64
	mov	x0, x27
	bl	VDMHAL_V5R6C1_CfgRpReg.isra.9
	add	x0, x19, 876
	mov	w2, w21
	mov	x1, x27
	add	x0, x22, x0
	bl	VDMHAL_V5R6C1_CfgRpMsg
	ldr	x27, [sp, 80]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L631:
	ldr	x2, .LC244
	mov	w4, 0
	ldr	x1, .LC245
	mov	w3, w19
	add	x2, x2, 336
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L622
	.p2align 3
.L629:
	ldr	x1, .LC252
	mov	w0, 0
	mov	w20, 0
	bl	dprint_vfmw
	b	.L622
.L626:
	ldr	x1, .LC250
	mov	w0, 0
	mov	w20, 0
	bl	dprint_vfmw
	b	.L622
.L624:
	ldr	x1, .LC247
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L622
	.size	VDMHAL_V5R6C1_PrepareRepair, .-VDMHAL_V5R6C1_PrepareRepair
	.align	3
.LC243:
	.xword	g_HwMem
	.align	3
.LC244:
	.xword	.LANCHOR1
	.align	3
.LC245:
	.xword	.LC1
	.align	3
.LC247:
	.xword	.LC246
	.align	3
.LC248:
	.xword	g_RepairParam
	.align	3
.LC250:
	.xword	.LC249
	.align	3
.LC252:
	.xword	.LC251
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_StartHwRepair
	.type	VDMHAL_V5R6C1_StartHwRepair, %function
VDMHAL_V5R6C1_StartHwRepair:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	sxtw	x20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x21, .LC253
	ldrb	w4, [x21]
	cmp	w4, 1
	bne	.L659
	cmp	w20, wzr
	ble	.L660
	ldr	x22, .LC255
	mov	w3, w20
	ldr	x23, .LC256
	mov	w0, 32
	add	x2, x22, 368
	mov	x1, x23
	bl	dprint_vfmw
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L643
	mov	x0, x19
	mov	w3, -2
	mov	w2, 36
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L656
.L638:
	cbz	x19, .L661
.L652:
	ldr	x1, .LC259
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
.L635:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L660:
	sxtw	x0, w20
	ldr	x3, .LC254
	lsl	x1, x0, 6
	mov	w4, 67108864
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x2, x1, x0
	add	x1, x1, x2, lsl 2
	ldr	x1, [x3, x1]
	str	w4, [x1, 8]
.L641:
	lsl	x1, x0, 6
	mov	w2, -2
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x0, x1, x0
	add	x0, x1, x0, lsl 2
	ldr	x0, [x3, x0]
	str	w2, [x0, 36]
.L639:
	ldr	x0, .LC260
	ldr	x0, [x0, 224]
	blr	x0
	cmp	w20, wzr
	ble	.L655
	ldr	x22, .LC255
	ldr	x23, .LC256
.L648:
	add	x22, x22, 384
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
	b	.L635
	.p2align 3
.L637:
	cmp	w20, wzr
	ble	.L653
	ldr	x22, .LC255
	ldr	x23, .LC256
.L643:
	mov	w4, 1
	mov	w3, w20
	add	x2, x22, 368
	mov	x1, x23
	mov	w0, 32
	bl	dprint_vfmw
	ldrb	w0, [x21]
	cmp	w0, 1
	bne	.L638
.L656:
	ldr	x0, .LC260
	ldr	x0, [x0, 224]
	blr	x0
	b	.L648
	.p2align 3
.L659:
	mov	x0, x19
	mov	w3, 67108864
	mov	w2, 8
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L637
	mov	x0, x19
	mov	w3, -2
	mov	w2, 36
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L639
	cbnz	x19, .L652
.L661:
	ldr	x2, .LC255
	mov	x3, 0
	ldr	x1, .LC258
	mov	w0, 0
	add	x2, x2, 384
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L655:
	lsl	x0, x20, 6
	ldr	x1, .LC254
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
	b	.L635
.L653:
	ldr	x3, .LC254
	sxtw	x0, w20
	b	.L641
	.size	VDMHAL_V5R6C1_StartHwRepair, .-VDMHAL_V5R6C1_StartHwRepair
	.align	3
.LC253:
	.xword	g_HalDisable
	.align	3
.LC254:
	.xword	g_HwMem
	.align	3
.LC255:
	.xword	.LANCHOR1
	.align	3
.LC256:
	.xword	.LC105
	.align	3
.LC258:
	.xword	.LC257
	.align	3
.LC259:
	.xword	g_VdmDrvParam
	.align	3
.LC260:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_CalVdhClkSkip
	.type	VDMHAL_V5R6C1_CalVdhClkSkip, %function
VDMHAL_V5R6C1_CalVdhClkSkip:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x0, x30
	bl	_mcount
	ldr	x24, .LC262
	ldr	w28, [x24, 128]
	tbnz	w28, #31, .L694
	ldr	x25, .LC265
	add	x20, x24, 132
	ldr	x27, .LC268
	add	x24, x24, 256
	ldr	x26, .LC267
	mov	w23, 30
	mov	w22, 0
	mov	w21, 0
	add	x25, x25, 416
	mov	w19, 0
	b	.L665
	.p2align 3
.L697:
	mov	w3, w28
	mov	x2, x25
	mov	x1, x26
	mov	w0, 1
	bl	dprint_vfmw
.L667:
	cmp	x24, x20
	beq	.L695
.L684:
	ldr	w28, [x20], 4
	tbnz	w28, #31, .L696
.L665:
	mov	w0, w28
	bl	VCTRL_IsChanActive
	cbnz	w0, .L697
	mov	w0, w28
	bl	FSP_GetInst
	cbz	x0, .L668
	ldp	w1, w0, [x0, 40]
	adds	w19, w1, 15
	add	w1, w1, 30
	add	w21, w0, 30
	csel	w19, w1, w19, mi
	adds	w0, w0, 15
	asr	w19, w19, 4
	csel	w0, w21, w0, mi
	asr	w21, w0, 4
.L668:
	ldr	x1, [x27, w28, sxtw 3]
	mov	w0, w28
	ldr	w1, [x1, 1712]
	cmp	w1, 31
	csel	w23, w23, w1, lt
	bl	VCTRL_GetVidStd
	cmp	w0, 17
	bls	.L698
.L687:
	cmp	x24, x20
	mov	w22, 0
	bne	.L684
.L695:
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
.L698:
	ldr	x1, .LC269
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx671
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx671:
	.section	.rodata
	.align	0
	.align	2
.L671:
	.byte	(.L680 - .Lrtx671) / 4
	.byte	(.L680 - .Lrtx671) / 4
	.byte	(.L680 - .Lrtx671) / 4
	.byte	(.L680 - .Lrtx671) / 4
	.byte	(.L687 - .Lrtx671) / 4
	.byte	(.L680 - .Lrtx671) / 4
	.byte	(.L680 - .Lrtx671) / 4
	.byte	(.L687 - .Lrtx671) / 4
	.byte	(.L680 - .Lrtx671) / 4
	.byte	(.L680 - .Lrtx671) / 4
	.byte	(.L680 - .Lrtx671) / 4
	.byte	(.L680 - .Lrtx671) / 4
	.byte	(.L680 - .Lrtx671) / 4
	.byte	(.L680 - .Lrtx671) / 4
	.byte	(.L687 - .Lrtx671) / 4
	.byte	(.L681 - .Lrtx671) / 4
	.byte	(.L680 - .Lrtx671) / 4
	.byte	(.L680 - .Lrtx671) / 4
	.text
	.p2align 3
.L680:
	mul	w22, w19, w21
	mul	w22, w22, w23
	b	.L667
	.p2align 3
.L696:
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
.L663:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L681:
	mul	w22, w19, w21
	mul	w22, w22, w23
	lsl	w22, w22, 1
	b	.L667
.L694:
	mov	w0, 25
	b	.L663
	.size	VDMHAL_V5R6C1_CalVdhClkSkip, .-VDMHAL_V5R6C1_CalVdhClkSkip
	.align	3
.LC262:
	.xword	g_ChanCtx
	.align	3
.LC265:
	.xword	.LANCHOR1
	.align	3
.LC267:
	.xword	.LC266
	.align	3
.LC268:
	.xword	s_pstVfmwChan
	.align	3
.LC269:
	.xword	.L671
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_GetVdmClk
	.type	VDMHAL_V5R6C1_GetVdmClk, %function
VDMHAL_V5R6C1_GetVdmClk:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, 3
	bls	.L707
.L700:
	ldr	x0, .LC272
	sbfiz	x19, x19, 6, 32
	mov	w1, 500
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L707:
	ldr	x0, .LC271
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx702
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx702:
	.section	.rodata
	.align	0
	.align	2
.L702:
	.byte	(.L700 - .Lrtx702) / 4
	.byte	(.L703 - .Lrtx702) / 4
	.byte	(.L704 - .Lrtx702) / 4
	.byte	(.L705 - .Lrtx702) / 4
	.text
	.p2align 3
.L704:
	ldr	x0, .LC272
	sbfiz	x19, x19, 6, 32
	mov	w1, 100
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L703:
	ldr	x0, .LC272
	sbfiz	x19, x19, 6, 32
	mov	w1, 540
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L705:
	ldr	x0, .LC272
	sbfiz	x19, x19, 6, 32
	mov	w1, 600
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_V5R6C1_GetVdmClk, .-VDMHAL_V5R6C1_GetVdmClk
	.align	3
.LC271:
	.xword	.L702
	.align	3
.LC272:
	.xword	g_VdmDrvParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_StartHwDecode
	.type	VDMHAL_V5R6C1_StartHwDecode, %function
VDMHAL_V5R6C1_StartHwDecode:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	mov	w0, 8
	cmp	w20, wzr
	str	w0, [x29, 92]
	ble	.L709
	ldr	x2, .LC273
	mov	w4, 0
	ldr	x1, .LC274
	mov	w3, w20
	add	x2, x2, 448
	mov	w0, 0
	bl	dprint_vfmw
.L708:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L709:
	add	x0, x29, 92
	bl	HI_DRV_SYS_GetChipPackageType
	ldr	x22, .LC275
	ldr	w0, [x29, 92]
	ldrb	w1, [x22]
	cmp	w0, wzr
	cset	w21, ne
	cmp	w1, 1
	bne	.L748
	ldr	x0, .LC276
	ldr	x2, [x0]
	ldr	w0, [x2, 120]
	ubfx	x3, x0, 8, 2
	cmp	w3, w21
	beq	.L741
	bfi	w0, w21, 8, 2
	str	w0, [x2, 120]
.L741:
	ldr	x0, .LC277
	ldr	x23, .LC278
	ldrb	w0, [x0,w21,uxtw]
	adr	x2, .Lrtx716
	add	x0, x2, w0, sxtb #2
	br	x0
.Lrtx716:
	.section	.rodata
	.align	0
	.align	2
.L716:
	.byte	(.L715 - .Lrtx716) / 4
	.byte	(.L717 - .Lrtx716) / 4
	.byte	(.L718 - .Lrtx716) / 4
	.byte	(.L719 - .Lrtx716) / 4
	.text
	.p2align 3
.L718:
	sxtw	x21, w20
	mov	w2, 100
	add	x0, x23, x21, lsl 6
	str	w2, [x0, 16]
.L720:
	add	x0, x23, x21, lsl 6
	ldr	x2, .LC279
	cmp	w1, 1
	ldr	w24, [x0, 8]
	ldr	x0, [x2, w24, sxtw 3]
	ldr	w25, [x0, 1352]
	bne	.L749
	ldr	x0, .LC276
	ldr	x0, [x0]
	ldr	w1, [x0, 120]
	and	w1, w1, -258049
	str	w1, [x0, 120]
	ldr	w1, [x0, 120]
	orr	w1, w1, 131072
	str	w1, [x0, 120]
.L722:
	mov	w0, 12
	mov	x3, x19
	mov	w2, w20
	mov	w1, 3
	bl	SCD_ConfigReg
	ldrb	w0, [x22]
	cmp	w0, 1
	beq	.L750
	mov	w1, 2
	mov	x0, x19
	mov	w3, -1431655766
	mov	w2, 156
	bl	VDH_Record_RegData
	ldr	x1, .LC280
	ldrb	w0, [x22]
	ldr	w1, [x1]
	cmp	w1, 1
	beq	.L751
.L724:
	mov	w3, 0
.L723:
	cmp	w0, 1
	beq	.L752
	mov	x0, x19
	mov	w2, 61472
	mov	w1, 2
	bl	VDH_Record_RegData
	cmp	w25, 1
	ldrb	w0, [x22]
	beq	.L753
.L727:
	mov	w3, -2
.L726:
	cmp	w0, 1
	beq	.L754
	mov	x0, x19
	mov	w2, 36
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x22]
	cmp	w0, 1
	beq	.L755
	cbz	x19, .L756
	mov	w0, 1
	strb	w20, [x19]
	stp	w0, w24, [x19, 4]
	mov	x0, x19
	bl	VDH_PostTask
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L753:
	mov	w3, -6
	b	.L726
	.p2align 3
.L751:
	mov	w3, 15
	b	.L723
	.p2align 3
.L717:
	sxtw	x21, w20
	mov	w2, 540
	add	x0, x23, x21, lsl 6
	str	w2, [x0, 16]
	b	.L720
	.p2align 3
.L715:
	sxtw	x21, w20
	mov	w2, 500
	add	x0, x23, x21, lsl 6
	str	w2, [x0, 16]
	b	.L720
	.p2align 3
.L719:
	sxtw	x21, w20
	mov	w2, 600
	add	x0, x23, x21, lsl 6
	str	w2, [x0, 16]
	b	.L720
	.p2align 3
.L748:
	mov	w1, 0
	mov	w3, w21
	mov	w2, 0
	mov	x0, x19
	bl	VDH_Record_RegData
	ldrb	w1, [x22]
	b	.L741
	.p2align 3
.L749:
	mov	w3, 0
	mov	w2, 1
	mov	w1, 0
	mov	x0, x19
	bl	VDH_Record_RegData
	b	.L722
	.p2align 3
.L750:
	ldr	x2, .LC280
	lsl	x1, x21, 6
	sub	x1, x1, x21
	ldr	x26, .LC281
	lsl	x1, x1, 2
	ldr	w2, [x2]
	cmp	w2, 1
	sub	x2, x1, x21
	add	x1, x1, x2, lsl 2
	mov	w2, -1431655766
	ldr	x1, [x26, x1]
	str	w2, [x1, 156]
	bne	.L724
	mov	w3, 15
	b	.L725
	.p2align 3
.L754:
	ldr	x26, .LC281
.L728:
	lsl	x1, x21, 6
	ldr	x19, .LC282
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
.L731:
	lsl	x0, x21, 6
	mov	w2, 1
	sub	x1, x0, x21
	add	x23, x23, x0
	lsl	x0, x1, 2
	ldr	x3, .LC284
	sub	x21, x0, x21
	mov	w1, 4
	add	x21, x0, x21, lsl 2
	ldr	x0, [x26, x21]
	str	wzr, [x0]
	ldr	x0, [x26, x21]
	str	w2, [x0]
	ldr	x0, [x26, x21]
	str	wzr, [x0]
	ldr	w2, [x23, 8]
	mov	w0, w2
	ldr	w2, [x3, w2, sxtw 2]
	bl	VDEC_Lowdelay_Event_Time
	b	.L708
	.p2align 3
.L752:
	ldr	x26, .LC281
.L725:
	lsl	x0, x21, 6
	cmp	w25, 1
	sub	x0, x0, x21
	lsl	x0, x0, 2
	sub	x1, x0, x21
	add	x0, x0, x1, lsl 2
	ldr	x0, [x26, x0]
	add	x0, x0, 61440
	str	w3, [x0, 32]
	beq	.L740
	mov	w0, 1
	b	.L727
	.p2align 3
.L756:
	ldr	x2, .LC273
	mov	x3, 0
	ldr	x1, .LC283
	mov	w0, 0
	add	x2, x2, 448
	bl	dprint_vfmw
	b	.L708
	.p2align 3
.L740:
	mov	w3, -6
	b	.L728
.L755:
	ldr	x19, .LC282
	mov	x0, 30
	ldr	x1, [x19, 232]
	blr	x1
	ldr	x0, [x19, 224]
	blr	x0
	ldr	x26, .LC281
	b	.L731
	.size	VDMHAL_V5R6C1_StartHwDecode, .-VDMHAL_V5R6C1_StartHwDecode
	.align	3
.LC273:
	.xword	.LANCHOR1
	.align	3
.LC274:
	.xword	.LC1
	.align	3
.LC275:
	.xword	g_HalDisable
	.align	3
.LC276:
	.xword	g_pstRegCrg
	.align	3
.LC277:
	.xword	.L716
	.align	3
.LC278:
	.xword	g_VdmDrvParam
	.align	3
.LC279:
	.xword	s_pstVfmwChan
	.align	3
.LC280:
	.xword	mask_mmu_err_int
	.align	3
.LC281:
	.xword	g_HwMem
	.align	3
.LC282:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC283:
	.xword	.LC257
	.align	3
.LC284:
	.xword	g_LowDelaySeqIndex
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_GetCharacter
	.type	VDMHAL_V5R6C1_GetCharacter, %function
VDMHAL_V5R6C1_GetCharacter:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC285
	mov	w3, 15
	ldr	x0, .LC286
	mov	w1, 4
	str	w3, [x2]
	str	w1, [x0]
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V5R6C1_GetCharacter, .-VDMHAL_V5R6C1_GetCharacter
	.align	3
.LC285:
	.xword	g_VdmCharacter
	.align	3
.LC286:
	.xword	g_eVdmVersion
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V5R6C1_WriteBigTitle1DYuv
	.type	VDMHAL_V5R6C1_WriteBigTitle1DYuv, %function
VDMHAL_V5R6C1_WriteBigTitle1DYuv:
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
	beq	.L802
	mov	w20, 2
	cmp	w0, w20
	csinc	w20, w20, wzr, ne
.L759:
	ldr	x0, [x29, 112]
	cbz	x0, .L758
	ldr	x0, .LC288
	mov	w4, 0
	add	x3, x29, 144
	mov	w2, 4194304
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L762
	ldr	x0, .LC292
	mov	w4, 0
	add	x3, x29, 176
	mov	w2, 4194304
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L762
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
	bne	.L763
	lsr	w1, w3, 1
	lsr	w0, w19, 1
	str	w1, [x29, 120]
	add	x1, x25, 2097152
	str	w0, [x29, 104]
	str	x1, [x29, 136]
	ldr	x28, .LC293
	ldr	x20, [x29, 152]
	cbz	w3, .L765
	mov	w27, 0
	str	wzr, [x29, 132]
	.p2align 2
.L764:
	cbz	w19, .L767
	ldr	w0, [x29, 124]
	lsr	w23, w27, 4
	ldr	w24, [x29, 132]
	mov	w26, 0
	mul	w0, w23, w0
	ubfiz	x23, x27, 8, 4
	add	x23, x0, x23
	.p2align 2
.L766:
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
	bhi	.L766
.L767:
	ldr	w0, [x29, 132]
	add	w27, w27, 1
	add	w0, w0, w19
	str	w0, [x29, 132]
	ldr	w0, [x29, 128]
	cmp	w0, w27
	bne	.L764
.L765:
	ldr	w0, [x29, 128]
	ldr	x3, [x28, 88]
	ldr	x2, [x29, 112]
	mul	w1, w19, w0
	mov	x0, x20
	blr	x3
	ldr	w0, [x29, 120]
	cbz	w0, .L857
	ldr	w1, [x29, 124]
	mov	w26, 0
	mov	w24, 0
	asr	w0, w1, 1
	str	w0, [x29, 132]
	.p2align 2
.L771:
	cbz	w19, .L773
	ldr	w0, [x29, 132]
	lsr	w22, w24, 3
	uxtw	x23, w26
	mov	w27, 0
	mul	w0, w22, w0
	ubfiz	x22, x24, 8, 3
	add	x22, x0, x22
	.p2align 2
.L770:
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
	bhi	.L770
.L773:
	ldr	w0, [x29, 120]
	add	w24, w24, 1
	add	w26, w26, w19
	cmp	w0, w24
	bne	.L771
	ldr	w0, [x29, 108]
	cmp	w0, 1
	beq	.L858
.L799:
	ldr	w0, [x29, 108]
	cbnz	w0, .L776
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
.L776:
	ldr	w0, [x29, 104]
	ldr	w1, [x29, 120]
.L852:
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
.L758:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 208
	ret
	.p2align 3
.L762:
	ldr	x1, .LC290
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
.L802:
	mov	w20, 0
	b	.L759
.L763:
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
	ldr	x28, .LC293
	ldr	x20, [x29, 152]
	bls	.L781
	ldr	w27, [x29, 120]
	.p2align 2
.L783:
	cbz	w19, .L784
	ldr	w0, [x29, 124]
	lsr	w24, w27, 4
	lsr	w23, w27, 1
	mov	w26, 0
	mul	w0, w24, w0
	mul	w23, w23, w19
	ubfiz	x24, x27, 8, 4
	add	x24, x0, x24
	.p2align 2
.L782:
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
	bhi	.L782
.L784:
	ldr	w0, [x29, 128]
	add	w27, w27, 2
	cmp	w0, w27
	bhi	.L783
.L781:
	ldr	w0, [x29, 128]
	ldr	x3, [x28, 88]
	ldr	x2, [x29, 112]
	mul	w1, w19, w0
	mov	x0, x20
	lsr	w1, w1, 1
	blr	x3
	ldr	w0, [x29, 132]
	cbz	w0, .L859
	ldr	w1, [x29, 124]
	mov	w26, 0
	mov	w24, 0
	asr	w0, w1, 1
	str	w0, [x29, 128]
	.p2align 2
.L788:
	cbz	w19, .L790
	ldr	w0, [x29, 128]
	lsr	w22, w24, 3
	uxtw	x23, w26
	mov	w27, 0
	mul	w0, w22, w0
	ubfiz	x22, x24, 8, 3
	add	x22, x0, x22
	.p2align 2
.L787:
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
	bhi	.L787
.L790:
	ldr	w0, [x29, 132]
	add	w24, w24, 1
	add	w26, w26, w19
	cmp	w0, w24
	bne	.L788
	ldr	w0, [x29, 108]
	cmp	w0, 1
	beq	.L860
	ldr	w0, [x29, 108]
	cbnz	w0, .L793
	ldr	w1, [x29, 120]
	ldr	w0, [x29, 132]
	cmp	w0, w1
	bls	.L796
	.p2align 2
.L797:
	ldr	w0, [x29, 120]
	ldr	w1, [x29, 132]
	add	w0, w0, 2
	str	w0, [x29, 120]
	cmp	w1, w0
	bhi	.L797
.L796:
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
.L793:
	ldr	w0, [x29, 104]
	ldr	w1, [x29, 132]
	b	.L852
.L858:
	mov	w0, 0
	mov	w6, 0
	.p2align 2
.L775:
	ldr	w1, [x29, 104]
	mov	w5, w0
	cbz	w1, .L777
	ldr	w1, [x29, 104]
	add	w5, w1, w0
	mov	w1, 1
	.p2align 2
.L774:
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
	bne	.L774
.L777:
	ldr	w0, [x29, 120]
	add	w6, w6, 1
	add	x20, x20, x19
	cmp	w0, w6
	mov	w0, w5
	bne	.L775
	b	.L776
.L860:
	ldr	w0, [x29, 120]
	mov	w7, 0
	mul	w1, w19, w0
	lsl	w0, w19, 1
	add	x20, x20, x1
	.p2align 2
.L792:
	ldr	w3, [x29, 104]
	cbz	w3, .L794
	lsr	w1, w7, 1
	mov	w2, 1
	mul	w1, w1, w3
	add	w6, w3, w1
	.p2align 2
.L791:
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
	bne	.L791
.L794:
	ldr	w1, [x29, 132]
	add	w7, w7, 2
	add	x20, x20, x0
	cmp	w1, w7
	bhi	.L792
	b	.L793
.L859:
	ldr	w0, [x29, 108]
	cmp	w0, 1
	beq	.L793
	ldr	w0, [x29, 108]
	cbz	w0, .L796
	b	.L793
.L857:
	ldr	w0, [x29, 108]
	cmp	w0, 1
	bne	.L799
	b	.L776
	.size	VDMHAL_V5R6C1_WriteBigTitle1DYuv, .-VDMHAL_V5R6C1_WriteBigTitle1DYuv
	.align	3
.LC288:
	.xword	.LC287
	.align	3
.LC290:
	.xword	.LC289
	.align	3
.LC292:
	.xword	.LC291
	.align	3
.LC293:
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
	ldr	x0, .LC294
	ldrb	w0, [x0]
	cmp	w0, 1
	bne	.L868
	cbnz	w19, .L864
	ldr	x0, .LC295
	ldr	x1, [x0]
	ldr	w0, [x1, 120]
	ubfx	x2, x0, 8, 2
	cmp	w20, w2
	beq	.L861
	bfi	w0, w20, 8, 2
	str	w0, [x1, 120]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L864:
	cmp	w19, 1
	beq	.L869
.L861:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L868:
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
.L869:
	ldr	x0, .LC295
	ldr	x1, [x0]
	ldr	w0, [x1, 120]
	bfi	w0, w20, 12, 5
	and	w0, w0, -131073
	str	w0, [x1, 120]
	ldr	w0, [x1, 120]
	orr	w0, w0, 131072
	str	w0, [x1, 120]
	b	.L861
	.size	CRG_ConfigReg, .-CRG_ConfigReg
	.align	3
.LC294:
	.xword	g_HalDisable
	.align	3
.LC295:
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
	ldr	x0, .LC296
	ldrb	w4, [x0]
	cmp	w4, 1
	bne	.L874
	cmp	w19, wzr
	ble	.L875
	ldr	x2, .LC298
	mov	w3, w19
	ldr	x1, .LC299
	mov	w0, 32
	add	x2, x2, 368
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L875:
	lsl	x0, x19, 6
	ldr	x1, .LC297
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
.L874:
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
.LC296:
	.xword	g_HalDisable
	.align	3
.LC297:
	.xword	g_HwMem
	.align	3
.LC298:
	.xword	.LANCHOR1
	.align	3
.LC299:
	.xword	.LC105
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.20680, %object
	.size	__func__.20680, 23
__func__.20680:
	.string	"VDMHAL_V5R6C1_CfgRpReg"
	.zero	1
	.type	__func__.20180, %object
	.size	__func__.20180, 22
__func__.20180:
	.string	"VDMHAL_V5R6C1_OpenHAL"
	.zero	2
	.type	__func__.20253, %object
	.size	__func__.20253, 25
__func__.20253:
	.string	"VDMHAL_V5R6C1_CalcFsSize"
	.zero	7
	.type	__func__.20279, %object
	.size	__func__.20279, 24
__func__.20279:
	.string	"VDMHAL_V5R6C1_CalcFsNum"
	.type	__func__.20322, %object
	.size	__func__.20322, 32
__func__.20322:
	.string	"VDMHAL_V5R6C1_ArrangeMem_Normal"
	.type	__FUNCTION__.20323, %object
	.size	__FUNCTION__.20323, 32
__FUNCTION__.20323:
	.string	"VDMHAL_V5R6C1_ArrangeMem_Normal"
	.type	__func__.20265, %object
	.size	__func__.20265, 33
__func__.20265:
	.string	"VDMHAL_V5R6C1_FillMemArrangeInfo"
	.zero	7
	.type	__func__.20405, %object
	.size	__func__.20405, 34
__func__.20405:
	.string	"VDMHAL_V5R6C1_ArrangeMem_Specific"
	.zero	6
	.type	__func__.20428, %object
	.size	__func__.20428, 23
__func__.20428:
	.string	"VDMHAL_V5R6C1_ResetVdm"
	.zero	1
	.type	__func__.20438, %object
	.size	__func__.20438, 35
__func__.20438:
	.string	"VDMHAL_V5R6C1_SetSmmuPageTableAddr"
	.zero	5
	.type	__func__.20458, %object
	.size	__func__.20458, 24
__func__.20458:
	.string	"VDMHAL_V5R6C1_GlbResetX"
	.type	__func__.20448, %object
	.size	__func__.20448, 23
__func__.20448:
	.string	"VDMHAL_V5R6C1_GlbReset"
	.zero	1
	.type	__func__.20470, %object
	.size	__func__.20470, 28
__func__.20470:
	.string	"VDMHAL_V5R6C1_ClearIntState"
	.zero	4
	.type	__func__.20476, %object
	.size	__func__.20476, 31
__func__.20476:
	.string	"VDMHAL_V5R6C1_ClearMMUIntState"
	.zero	1
	.type	__func__.20482, %object
	.size	__func__.20482, 22
__func__.20482:
	.string	"VDMHAL_V5R6C1_MaskInt"
	.zero	2
	.type	__func__.20495, %object
	.size	__func__.20495, 24
__func__.20495:
	.string	"VDMHAL_V5R6C1_EnableInt"
	.type	__func__.20504, %object
	.size	__func__.20504, 23
__func__.20504:
	.string	"VDMHAL_V5R6C1_CheckReg"
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.20518, %object
	.size	__func__.20518, 26
__func__.20518:
	.string	"VDMHAL_V5R6C1_ReadMMUMask"
	.zero	6
	.type	__func__.20523, %object
	.size	__func__.20523, 27
__func__.20523:
	.string	"VDMHAL_V5R6C1_WriteMMUMask"
	.zero	5
	.type	__func__.20555, %object
	.size	__func__.20555, 25
__func__.20555:
	.string	"VDMHAL_V5R6C1_PrepareDec"
	.zero	7
	.type	__func__.20560, %object
	.size	__func__.20560, 25
__func__.20560:
	.string	"VDMHAL_V5R6C1_IsVdmReady"
	.zero	7
	.type	__func__.20565, %object
	.size	__func__.20565, 23
__func__.20565:
	.string	"VDMHAL_V5R6C1_IsVdmRun"
	.zero	1
	.type	__func__.20571, %object
	.size	__func__.20571, 27
__func__.20571:
	.string	"VDMHAL_V5R6C1_IsVdhDecOver"
	.zero	5
	.type	__func__.20581, %object
	.size	__func__.20581, 31
__func__.20581:
	.string	"VDMHAL_V5R6C1_IsVdhPartDecOver"
	.zero	1
	.type	__func__.20596, %object
	.size	__func__.20596, 33
__func__.20596:
	.string	"VDMHAL_V5R6C1_UpdateHardwareInfo"
	.zero	7
	.type	__func__.20669, %object
	.size	__func__.20669, 23
__func__.20669:
	.string	"VDMHAL_V5R6C1_CfgRpMsg"
	.zero	1
	.type	__func__.20646, %object
	.size	__func__.20646, 24
__func__.20646:
	.string	"VDMHAL_CfgNotFullRepair"
	.type	__func__.20693, %object
	.size	__func__.20693, 28
__func__.20693:
	.string	"VDMHAL_V5R6C1_MakeDecReport"
	.zero	4
	.type	__func__.20732, %object
	.size	__func__.20732, 28
__func__.20732:
	.string	"VDMHAL_V5R6C1_PrepareRepair"
	.zero	4
	.type	__func__.20920, %object
	.size	__func__.20920, 15
__func__.20920:
	.string	"MFDE_ConfigReg"
	.zero	1
	.type	__func__.20739, %object
	.size	__func__.20739, 28
__func__.20739:
	.string	"VDMHAL_V5R6C1_StartHwRepair"
	.zero	4
	.type	__func__.20778, %object
	.size	__func__.20778, 28
__func__.20778:
	.string	"VDMHAL_V5R6C1_CalVdhClkSkip"
	.zero	4
	.type	__func__.20802, %object
	.size	__func__.20802, 28
__func__.20802:
	.string	"VDMHAL_V5R6C1_StartHwDecode"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC1:
	ASCII(.string	"%s: VdhId(%d) > %d\n" )
	.zero	4
.LC3:
	ASCII(.string	"vdm register virtual address not mapped, reset failed!\n" )
.LC10:
	ASCII(.string	"pOpenParam = NULL error!" )
	.zero	7
.LC13:
	ASCII(.string	"%s: %s\n" )
.LC15:
	ASCII(.string	"MemBaseAddr = 0 error!" )
	.zero	1
.LC17:
	ASCII(.string	"VDMHAL_V5R6C1_OpenHAL: Size error!" )
	.zero	5
.LC19:
	ASCII(.string	"VdhId is wrong!!!\n" )
	.zero	5
.LC21:
	ASCII(.string	"!!!!!! HAL memory not enouph! need %d, have %d\n" )
.LC23:
	ASCII(.string	"image size out of range" )
.LC30:
	ASCII(.string	"VDMHAL ArrangeMem HEVC/VP9/AVS2 10 bit\n" )
.LC33:
	ASCII(.string	"%s pstVfmwFrameSizeInfo = NULL\n" )
.LC37:
	ASCII(.string	"DelAllFrameMemRecord err in VDMHAL_V5R6C1_ArrangeMem!\n" )
	.zero	1
.LC39:
	ASCII(.string	"Report arrange frame buffer: wxh %dx%d, FsNum %d, PmvNum %d\n" )
	.zero	3
.LC44:
	ASCII(.string	"Report arrange frame buffer only: wxh %dx%d, FsNum %d, PmvNum %d\n" )
	.zero	6
.LC47:
	ASCII(.string	"VidStd Invalid" )
	.zero	1
.LC51:
	ASCII(.string	"decoder not support, ISMV450 = %d\n" )
	.zero	5
.LC55:
	ASCII(.string	"Set CompressEn %d, LossCompressEn %d, YCompRatio %d, UVCompRatio %d\n" )
	.zero	3
.LC57:
	ASCII(.string	"VDMHAL_V5R6C1_CalcFsSize err!\n" )
	.zero	1
.LC59:
	ASCII(.string	"%s, need arrange, Size: %#x, Num: %#x, RefChanged: %#x\n" )
.LC61:
	ASCII(.string	"DFS, report event. Size: 0x%x, Num: %d, RefChanged: %d\n" )
.LC64:
	ASCII(.string	"pVdmMemArrange is NULL" )
	.zero	1
.LC66:
	ASCII(.string	"DFS, no ref frame!\n" )
	.zero	4
.LC68:
	ASCII(.string	"DFS, Frame number = %d > 30, Then, Frame num = 30, \n" )
	.zero	3
.LC70:
	ASCII(.string	"VDMHAL_V5R6C1_ArrangeMem Mem addr is NULL" )
	.zero	6
.LC75:
	ASCII(.string	"'pVdmMemArrange' is NULL" )
	.zero	7
.LC79:
	ASCII(.string	"MemSize not enough for pmv slot" )
.LC82:
	ASCII(.string	"VDMHAL_V200R003_ArrangeMem get ChanWidth/ChanHeight failed!\n" )
	.zero	3
.LC84:
	ASCII(.string	"ImgSlotLen > ChanSlotLen" )
	.zero	7
.LC86:
	ASCII(.string	"cann't allocate img slot" )
	.zero	7
.LC89:
	ASCII(.string	"Chan: %d call VCTRL_GetVidStd failed\n" )
	.zero	2
.LC94:
	ASCII(.string	"VDMHAL_V5R6C1_ResetVdm: map vdm register fail, vir(reg) = (%p)\n" )
.LC98:
	ASCII(.string	"%s module id %d failed!\n" )
	.zero	7
.LC100:
	ASCII(.string	"%s module id %d success!\n" )
	.zero	6
.LC105:
	ASCII(.string	"%s: WR_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\n" )
	.zero	3
.LC110:
	ASCII(.string	"%s: map vdm register 0x%x failed!\n" )
	.zero	5
.LC113:
	ASCII(.string	"%s: RD_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\n" )
	.zero	3
.LC116:
	ASCII(.string	"%s VdhId %d failed!\n" )
	.zero	3
.LC118:
	ASCII(.string	"%s VdhId %d success!\n" )
	.zero	2
.LC145:
	ASCII(.string	"%s: VdhId(%d) Invalid!\n" )
.LC148:
	ASCII(.string	"%s: vdm register virtual address not mapped, reset failed!\n" )
	.zero	4
.LC150:
	ASCII(.string	"%s: unkown reg_id = %d\n" )
.LC160:
	ASCII(.string	"%s: pDecParam(%p) = NULL\n" )
	.zero	6
.LC165:
	ASCII(.string	"VDM register not mapped yet!" )
	.zero	3
.LC171:
	ASCII(.string	"VDM register not mapped yet!\n" )
	.zero	2
.LC193:
	ASCII(.string	"can NOT map vir addr for up-msg" )
.LC197:
	ASCII(.string	"ReadUpMsgSlot error! pDst=%p, pSrc=%p\n" )
	.zero	1
.LC199:
	ASCII(.string	"ReadUpMsgSlot error! upmsg_size(%d) > 512\n" )
	.zero	5
.LC202:
	ASCII(.string	"WriteMsgSlot error!\n" )
	.zero	3
.LC205:
	ASCII(.string	"can not map repair msg virtual address!" )
.LC209:
	ASCII(.string	"ValidGroupNum=%d out of range!\n" )
.LC211:
	ASCII(.string	"align_mb error\n" )
.LC213:
	ASCII(.string	"[%s][%d]sclie_num is wrong! %d \n" )
	.zero	7
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
.LC246:
	ASCII(.string	"vdm register virtual address not mapped, VDMHAL_V200R003_PrepareRepair failed!\n" )
.LC249:
	ASCII(.string	"FIRST_REPAIR Parameter Error!\n" )
	.zero	1
.LC251:
	ASCII(.string	"SECOND_REPAIR Parameter Error!\n" )
.LC257:
	ASCII(.string	"%s: pMfdeTask(%p) = NULL\n" )
	.zero	6
.LC266:
	ASCII(.string	"%s The channel %d is not active\n" )
	.zero	7
.LC287:
	ASCII(.string	"BigTile1d_y" )
	.zero	4
.LC289:
	ASCII(.string	"failed mem_allocMemBlock BigTile_yuv save!\n" )
	.zero	4
.LC291:
	ASCII(.string	"BigTile1d_uv" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
