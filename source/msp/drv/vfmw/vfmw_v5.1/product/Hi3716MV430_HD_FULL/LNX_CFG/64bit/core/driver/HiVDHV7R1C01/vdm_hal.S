#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	VDMHAL_CfgNotFullRepair, %function
VDMHAL_CfgNotFullRepair:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x22, x1
	mov	w21, w2
	mov	w23, w3
	mov	x19, x4
	bl	_mcount
	ldr	w0, [x20, 48]
	cmp	w0, 6
	beq	.L20
	cmp	w0, 5
	beq	.L21
	cmp	w0, 4
	mov	w7, 8
	beq	.L2
	ldr	x2, .LC1
	mov	w1, 1653
	mov	w0, 1
	bl	dprint_normal
	mov	w7, 1
.L2:
	ldr	w8, [x20, 32]
	mov	w12, 0
	cmp	w8, wzr
	ble	.L4
	mul	w14, w21, w23
	mov	w5, 0
	mov	w4, 0
	mov	w12, 0
	sub	w15, w14, #1
	ldr	x13, .LC5
	neg	w6, w7
	mov	x17, 52
	mov	w16, 1
	sub	w9, w7, #1
	mov	w10, 199
	b	.L5
	.p2align 3
.L30:
	ldr	w4, [x11, 52]
	sub	w4, w4, #1
	add	w4, w4, w7
	udiv	w4, w4, w7
	mul	w4, w4, w7
	cmp	w2, w4
	bhi	.L9
.L8:
	add	w5, w5, 1
	cmp	w8, w5
	ble	.L4
.L19:
	cmp	w5, 199
	bgt	.L29
.L5:
	add	x11, x20, x5, sxtw 3
	cmp	w5, wzr
	ldr	w1, [x11, 60]
	sub	w0, w1, #1
	add	w0, w0, w7
	udiv	w2, w0, w7
	mul	w2, w2, w7
	bgt	.L30
	cmp	w2, w4
	and	w0, w6, w0
	ccmp	w5, wzr, 4, ls
	beq	.L11
	add	w5, w5, 1
	cmp	w8, w5
	bgt	.L19
.L4:
	str	w12, [x19]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L10:
	ldr	w1, [x3, 64]
	and	w1, w6, w1
	cmp	w0, w1
	add	w18, w1, 1
	bhi	.L12
	sub	w1, w5, #1
	cmp	w0, w18
	add	x1, x20, x1, sxtw 3
	beq	.L12
	ldr	w1, [x1, 60]
	sub	w1, w1, #1
	add	w1, w1, w7
	and	w1, w1, w6
	cmp	w0, w1
	bhi	.L11
.L12:
	ldr	w1, [x3, 68]
	mov	w5, w2
.L9:
	add	w2, w5, 1
	add	w0, w9, w1
	cmp	w2, w8
	add	x3, x20, x5, sxtw 3
	ccmp	w2, w10, 0, lt
	and	w0, w0, w6
	ble	.L10
	add	w0, w9, w1
	and	w0, w0, w6
.L11:
	ldr	w2, [x11, 56]
	cmp	w14, w0
	csel	w0, w15, w0, ls
	add	w11, w12, 1
	udiv	w2, w2, w7
	mul	w2, w2, w7
	cmp	w2, w0
	csel	w2, w2, wzr, ls
	cmp	w11, 250
	bgt	.L31
	udiv	w8, w2, w21
	lsl	w1, w12, 1
	ldr	x30, [x13, 856]
	mov	w23, 0
	sxtw	x1, w1
	ldr	w18, [x13, 864]
	add	x3, x1, 12
	mov	w24, 0
	add	x3, x22, x3
	bfi	w24, w8, 0, 9
	sub	x3, x3, x30
	strh	w24, [x29, 78]
	cmp	x3, x18
	msub	w2, w8, w21, w2
	bfi	w23, w2, 0, 9
	strh	w23, [x29, 76]
	blt	.L16
	str	w16, [x13, 852]
.L17:
	udiv	w2, w0, w21
	add	x1, x1, 13
	mov	w8, 0
	add	x1, x22, x1
	bfi	w8, w2, 0, 9
	mov	w3, 0
	sub	x1, x1, x30
	strh	w8, [x29, 78]
	cmp	x1, x18
	msub	w2, w2, w21, w0
	bfi	w3, w2, 0, 9
	strh	w3, [x29, 76]
	blt	.L18
	str	w16, [x13, 852]
	mov	w12, w11
	ldr	w8, [x20, 32]
	b	.L8
	.p2align 3
.L16:
	sxtw	x2, w12
	ldr	w3, [x29, 76]
	add	x2, x2, 6
	lsl	x2, x2, 3
	str	w3, [x22, x2]
	ldr	w18, [x13, 864]
	ldr	x30, [x13, 856]
	b	.L17
	.p2align 3
.L18:
	add	x0, x17, x12, sxtw 3
	ldr	w1, [x29, 76]
	mov	w12, w11
	str	w1, [x22, x0]
	ldr	w8, [x20, 32]
	b	.L8
.L29:
	mov	w4, 1676
	ldr	x3, .LC2
	ldr	x2, .LC4
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L20:
	mov	w7, 2
	b	.L2
.L21:
	mov	w7, 4
	b	.L2
.L31:
	mov	w0, 1
	mov	w12, w11
	str	w0, [x20, 44]
	b	.L4
	.size	VDMHAL_CfgNotFullRepair, .-VDMHAL_CfgNotFullRepair
	.align	3
.LC1:
	.xword	.LC0
	.align	3
.LC2:
	.xword	.LANCHOR0
	.align	3
.LC4:
	.xword	.LC3
	.align	3
.LC5:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VDMHAL_FillMixExtRam, %function
VDMHAL_FillMixExtRam:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w22, w1
	bl	_mcount
	add	w0, w22, 1023
	mov	w1, w22
	and	w19, w0, -1024
	mov	x0, x21
	str	w19, [x21, 880]
	str	w19, [x21, 884]
	str	w19, [x21, 888]
	sub	w19, w19, w22
	add	w19, w19, 32768
	bl	H264HAL_FillMixRam
	mov	w20, w0
	mov	w1, w22
	mov	x0, x21
	bl	HEVCHAL_FillMixRam
	cmp	w20, w0
	csel	w0, w20, w0, cs
	cmp	w19, w0
	csel	w0, w19, w0, cs
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VDMHAL_FillMixExtRam, .-VDMHAL_FillMixExtRam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_GetHalMemSize
	.type	VDMHAL_GetHalMemSize, %function
VDMHAL_GetHalMemSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L39
	mov	w1, 15360
	ldr	x0, .LC9
	mov	w2, 1024
	movk	w1, 0x3, lsl 16
	.p2align 2
.L37:
	str	w2, [x0], 4
	add	w2, w2, 1024
	cmp	w2, w1
	bne	.L37
	ldr	x20, .LC10
	mov	w1, 21504
	mov	w4, 14336
	mov	w3, 20480
	movk	w4, 0x3, lsl 16
	movk	w3, 0x3, lsl 16
	str	w4, [x20, 848]
	movk	w1, 0x3, lsl 16
	str	w2, [x20, 868]
	mov	x0, x20
	str	w3, [x20, 872]
	bl	VDMHAL_FillMixExtRam
	mov	w19, w0
	ldr	x3, .LC16
	mov	x0, x20
	mov	x2, 1016
	mov	w1, 0
	ldr	x3, [x3, 96]
	blr	x3
	add	w0, w19, 217088
	add	w0, w0, 1023
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L39:
	ldr	x3, .LC13
	mov	w4, w19
	ldr	x2, .LC15
	mov	w1, 213
	add	x3, x3, 24
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_GetHalMemSize, .-VDMHAL_GetHalMemSize
	.align	3
.LC9:
	.xword	g_HwMem+24
	.align	3
.LC10:
	.xword	g_HwMem
	.align	3
.LC13:
	.xword	.LANCHOR0
	.align	3
.LC15:
	.xword	.LC14
	.align	3
.LC16:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_OpenHAL
	.type	VDMHAL_OpenHAL, %function
VDMHAL_OpenHAL:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L49
	ldr	w25, [x20]
	cbz	w25, .L50
	ldr	w19, [x20, 8]
	cmp	w19, wzr
	bgt	.L51
	ldr	w24, [x20, 4]
	cmp	w24, wzr
	ble	.L52
	sxtw	x22, w19
	ldr	x20, .LC29
	lsl	x0, x22, 7
	ldr	x26, .LC17
	sub	x0, x0, x22
	mov	x2, 1016
	lsl	x23, x0, 3
	ldr	x3, [x20, 96]
	add	x21, x26, x23
	mov	w1, 0
	mov	x0, x21
	blr	x3
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	str	x0, [x26, x23]
	mov	w0, 53248
	movk	w0, 0xf8c3, lsl 16
	bl	MEM_Phy2Vir
	str	x0, [x21, 8]
	mov	w2, 1016
	add	w1, w25, 1023
	and	w0, w1, -1024
	smaddl	x1, w19, w2, x26
	add	w5, w0, 208896
	stp	w25, w24, [x21, 16]
	add	x1, x1, 24
	add	w2, w5, 2048
	.p2align 2
.L46:
	str	w0, [x1], 4
	add	w0, w0, 1024
	cmp	w0, w2
	bne	.L46
	lsl	x0, x22, 7
	add	w1, w5, 2048
	sub	x0, x0, x22
	add	w2, w1, 4096
	add	w2, w2, 1024
	mov	w3, 14336
	add	x19, x26, x0, lsl 3
	movk	w3, 0x3, lsl 16
	add	w23, w2, 1024
	mov	x0, x21
	str	w3, [x19, 848]
	str	w1, [x21, 868]
	mov	w1, w23
	str	w2, [x21, 872]
	bl	VDMHAL_FillMixExtRam
	sub	w3, w23, w25
	add	w3, w3, w0
	cmp	w24, w3
	bcc	.L53
	ldr	w0, [x19, 40]
	bl	MEM_Phy2Vir
	str	x0, [x19, 856]
	mov	w1, 10240
	mov	x0, x21
	movk	w1, 0x3, lsl 16
	str	w1, [x19, 864]
	bl	H264HAL_InitHal
	mov	w19, w0
	mov	x0, x21
	bl	HEVCHAL_InitHal
	ldr	x21, .LC32
	lsl	x1, x22, 2
	ldr	x3, [x20, 96]
	sub	x1, x1, x22
	orr	w19, w19, w0
	lsl	x1, x1, 2
	mov	x2, 44
	sub	x22, x1, x22
	mov	w1, 0
	add	x0, x21, x22, lsl 2
	blr	x3
	mov	w1, 4
	mov	w0, w19
	str	w1, [x21]
.L42:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L51:
	ldr	x3, .LC20
	mov	w1, 240
	ldr	x4, .LC26
	mov	w0, 0
	ldr	x2, .LC22
	add	x3, x3, 48
	bl	dprint_normal
	mov	w0, -1
	b	.L42
.L53:
	ldr	x2, .LC31
	mov	w4, w24
	mov	w1, 260
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L42
.L50:
	ldr	x3, .LC20
	mov	w1, 237
	ldr	x4, .LC24
	mov	w0, 0
	ldr	x2, .LC22
	add	x3, x3, 48
	bl	dprint_normal
	mov	w0, -1
	b	.L42
.L52:
	ldr	x3, .LC20
	mov	w1, 243
	ldr	x4, .LC28
	mov	w0, 0
	ldr	x2, .LC22
	add	x3, x3, 48
	bl	dprint_normal
	mov	w0, -1
	b	.L42
.L49:
	ldr	x3, .LC20
	mov	w1, 234
	ldr	x4, .LC19
	mov	w0, 0
	ldr	x2, .LC22
	add	x3, x3, 48
	bl	dprint_normal
	mov	w0, -1
	b	.L42
	.size	VDMHAL_OpenHAL, .-VDMHAL_OpenHAL
	.align	3
.LC17:
	.xword	g_HwMem
	.align	3
.LC19:
	.xword	.LC18
	.align	3
.LC20:
	.xword	.LANCHOR0
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
.LC29:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC31:
	.xword	.LC30
	.align	3
.LC32:
	.xword	g_VdmExtParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_CloseHAL
	.type	VDMHAL_CloseHAL, %function
VDMHAL_CloseHAL:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L54
	ldr	x0, .LC33
	ldr	x1, [x0, 136]
	cbz	x1, .L56
	mov	w0, w19
	blr	x1
.L54:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L56:
	mov	w3, 293
	ldr	x2, .LC35
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_CloseHAL, .-VDMHAL_CloseHAL
	.align	3
.LC33:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC35:
	.xword	.LC34
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_DeriveDecCmpHeadInfo
	.type	VDMHAL_DeriveDecCmpHeadInfo, %function
VDMHAL_DeriveDecCmpHeadInfo:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x22, x2
	mov	x21, x3
	mov	w19, w1
	bl	_mcount
	add	w0, w20, 2047
	add	w19, w19, 63
	and	w0, w0, -2048
	and	w19, w19, -64
	lsr	w0, w0, 7
	lsr	w19, w19, 1
	str	w0, [x22]
	mul	w19, w19, w0
	str	w19, [x21]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VDMHAL_DeriveDecCmpHeadInfo, .-VDMHAL_DeriveDecCmpHeadInfo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_DeriveMetadataInfo
	.type	VDMHAL_DeriveMetadataInfo, %function
VDMHAL_DeriveMetadataInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 8]
	cbz	w0, .L63
	ldr	x1, .LC36
	mov	w0, 4096
	ldr	w2, [x20, 12]
	ldr	w1, [x1]
	tst	w2, -17
	csel	w0, w0, wzr, eq
	str	w0, [x19, 24]
	cmp	w1, 1
	beq	.L67
.L63:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L67:
	add	w0, w0, 4
	str	w0, [x19, 24]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_DeriveMetadataInfo, .-VDMHAL_DeriveMetadataInfo
	.align	3
.LC36:
	.xword	g_FsWaterMarkEnable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_DeriveMemSize
	.type	VDMHAL_DeriveMemSize, %function
VDMHAL_DeriveMemSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldp	w5, w6, [x20, 12]
	ldr	w1, [x20, 20]
	mov	w4, 32
	sub	w5, w5, #16
	mov	w0, 64
	cmp	w5, 2
	mov	w2, -32
	csel	w0, w4, w0, hi
	mov	w3, -64
	ldrb	w9, [x20, 6]
	sub	w4, w1, #1
	csel	w3, w2, w3, hi
	add	w0, w4, w0
	add	w2, w6, 63
	and	w0, w0, w3
	and	w2, w2, -64
	cmp	w9, 8
	ldrb	w10, [x20, 4]
	lsl	w7, w2, 4
	mul	w5, w2, w0
	bls	.L104
	lsr	w2, w2, 2
	cmp	w10, 1
	lsl	w4, w2, 5
	mul	w0, w0, w2
	beq	.L120
.L105:
	mov	w1, 0
	mov	w6, 0
.L71:
	add	w2, w5, w0
	ldr	w8, [x19]
	add	w2, w2, w1
	lsl	w3, w2, 2
	sub	w2, w3, w2
	lsr	w2, w2, 1
	add	w11, w2, 1024
	cbnz	w8, .L72
	mov	w3, 32
	stp	w3, wzr, [x19, 32]
.L72:
	add	w3, w5, w1
	ldr	w5, [x20, 40]
	cmp	w5, wzr
	lsr	w5, w7, 1
	cset	w12, ne
	strb	w12, [x19, 40]
	cmp	w9, 8
	ldrb	w9, [x20, 6]
	strb	w9, [x19, 42]
	strb	w10, [x19, 41]
	stp	w6, w1, [x19, 52]
	stp	w7, w5, [x19, 60]
	str	w3, [x19, 68]
	bls	.L73
	lsl	w1, w3, 2
	sub	w3, w1, w3
	lsr	w3, w3, 1
	stp	w4, w3, [x19, 72]
	add	w3, w0, w3
	str	w3, [x19, 80]
.L74:
	ldr	x0, .LC37
	str	w11, [x19, 48]
	ldr	w3, [x0]
	cmp	w3, 1
	bne	.L75
	add	w2, w2, 1028
	str	w2, [x19, 48]
.L75:
	ldp	w1, w2, [x20, 12]
	ldr	w7, [x20, 20]
	cbz	w8, .L106
	ldrsb	w4, [x20, 7]
	tbnz	w4, #31, .L121
	ldrb	w5, [x20, 5]
	sub	w6, w1, #16
	mov	w0, 64
	mov	w1, 32
	cmp	w6, 2
	csel	w0, w1, w0, hi
	cbz	w5, .L122
	add	w2, w2, 63
	sub	w7, w7, #1
	add	w7, w7, w0
	and	w2, w2, -64
	neg	w0, w0
	lsr	w8, w2, 1
	and	w0, w7, w0
	cmp	w4, 8
	mul	w6, w8, w0
	lsr	w6, w6, 3
	add	w6, w6, 1023
	and	w6, w6, -1024
	beq	.L123
	cmp	w4, 10
	bne	.L88
	mul	w1, w2, w0
	mov	w7, 0
	lsl	w1, w1, 1
	add	w1, w1, 1023
	and	w1, w1, -1024
	add	w1, w1, w6
.L86:
	cmp	w5, wzr
	strb	w4, [x19, 86]
	cset	w0, eq
	strb	w5, [x19, 85]
	strb	w0, [x19, 84]
	cmp	w3, 1
	add	w0, w1, 1024
	str	wzr, [x19, 36]
	stp	w0, w8, [x19, 92]
	stp	w6, w2, [x19, 100]
	stp	w2, w7, [x19, 108]
	bne	.L119
	add	w1, w1, 1028
	str	w1, [x19, 92]
.L119:
	ldp	w4, w2, [x20, 12]
	ldr	w7, [x20, 20]
.L76:
	ldr	w0, [x19, 4]
	cbz	w0, .L96
	add	w1, w2, 15
	add	w5, w7, 15
	lsr	w1, w1, 4
	mov	w0, 36
	lsr	w5, w5, 4
	cmp	w1, 45
	ccmp	w5, w0, 2, ls
	mov	w0, 32
	cset	w6, ls
	cmp	w6, wzr
	ldr	x6, .LC45
	ldrb	w8, [x6]
	mov	w6, 64
	csel	w0, w0, w6, eq
	cmp	w8, 1
	csel	w0, w0, w6, ne
	and	w6, w4, -3
	cmp	w6, 16
	mov	w6, 16
	csel	w0, w0, w6, ne
	cmp	w4, 18
	beq	.L93
	mul	w1, w1, w5
	mul	w0, w1, w0
	add	w0, w0, 47
	and	w0, w0, -32
.L94:
	add	w1, w0, 256
	cmp	w3, 1
	str	w1, [x19, 16]
	beq	.L124
.L118:
	ldr	w4, [x20, 12]
.L96:
	ldr	w0, [x19, 8]
	cbz	w0, .L101
	tst	w4, -17
	mov	w0, 4096
	csel	w0, w0, wzr, eq
	cmp	w3, 1
	beq	.L100
	str	w0, [x19, 24]
.L101:
	mov	w0, 0
.L115:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L73:
	stp	wzr, wzr, [x19, 72]
	str	wzr, [x19, 80]
	b	.L74
	.p2align 3
.L104:
	cmp	w10, 1
	mov	w0, 0
	mov	w4, 0
	bne	.L105
.L120:
	add	w6, w6, 2047
	add	w1, w1, 63
	and	w6, w6, -2048
	and	w1, w1, -64
	lsr	w6, w6, 7
	lsr	w1, w1, 1
	mul	w1, w1, w6
	b	.L71
	.p2align 3
.L122:
	cmp	w4, 8
	beq	.L125
	cmp	w4, 10
	beq	.L126
	cmp	w4, 16
	bne	.L84
	add	w2, w2, 63
	and	w2, w2, -64
	lsl	w2, w2, 1
.L82:
	ldr	w1, [x20, 44]
	cmp	w1, 1
	beq	.L127
	sub	w7, w7, #1
	neg	w1, w0
	add	w0, w7, w0
	mov	w6, 0
	and	w0, w0, w1
	mov	w8, 0
	mul	w7, w0, w2
.L117:
	lsl	w1, w7, 2
	sub	w1, w1, w7
	lsr	w1, w1, 1
	add	w1, w1, 1023
	and	w1, w1, -1024
	b	.L86
	.p2align 3
.L124:
	add	w0, w0, 260
	str	w0, [x19, 16]
	b	.L118
	.p2align 3
.L106:
	mov	w4, w1
	b	.L76
	.p2align 3
.L100:
	add	w1, w0, 4
	str	w1, [x19, 24]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L126:
	add	w2, w2, 63
	and	w2, w2, -64
	add	w2, w2, w2, lsl 2
	lsr	w2, w2, 2
	b	.L82
	.p2align 3
.L93:
	add	w2, w2, 63
	add	w0, w7, 63
	and	w2, w2, -64
	and	w0, w0, -64
	lsr	w2, w2, 4
	lsr	w0, w0, 4
	mul	w0, w2, w0
	lsl	w0, w0, 4
	b	.L94
	.p2align 3
.L125:
	add	w2, w2, 63
	and	w2, w2, -64
	b	.L82
	.p2align 3
.L123:
	lsl	w1, w2, 2
	mov	w7, 0
	sub	w1, w1, w2
	mul	w1, w1, w0
	lsr	w1, w1, 1
	add	w1, w1, 1023
	and	w1, w1, -1024
	add	w1, w1, w6
	b	.L86
	.p2align 3
.L127:
	ldr	w7, [x20, 28]
	mov	w6, 0
	mov	w8, 0
	mul	w7, w2, w7
	b	.L117
.L88:
	ldr	x19, .LC38
	mov	w1, 577
	ldr	x2, .LC44
	mov	w0, 1
	add	x3, x19, 64
	bl	dprint_normal
.L78:
	ldr	x2, .LC47
	add	x3, x19, 88
	mov	w1, 754
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L115
.L84:
	ldr	x19, .LC38
	mov	w1, 544
	ldr	x2, .LC42
	mov	w0, 1
	add	x3, x19, 64
	bl	dprint_normal
	b	.L78
.L121:
	ldr	x19, .LC38
	mov	w1, 515
	ldr	x2, .LC40
	mov	w0, 1
	add	x3, x19, 64
	bl	dprint_normal
	b	.L78
	.size	VDMHAL_DeriveMemSize, .-VDMHAL_DeriveMemSize
	.align	3
.LC37:
	.xword	g_FsWaterMarkEnable
	.align	3
.LC38:
	.xword	.LANCHOR0
	.align	3
.LC40:
	.xword	.LC39
	.align	3
.LC42:
	.xword	.LC41
	.align	3
.LC44:
	.xword	.LC43
	.align	3
.LC45:
	.xword	g_NotDirect_8x8_InferenceFlag
	.align	3
.LC47:
	.xword	.LC46
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_InquireMemNeed
	.type	VDMHAL_InquireMemNeed, %function
VDMHAL_InquireMemNeed:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w21, w0
	mov	x0, x30
	mov	x19, x1
	mov	x20, x2
	bl	_mcount
	cbz	w21, .L130
	cmp	w21, 1
	beq	.L131
	ldr	x3, .LC53
	mov	w4, w21
	ldr	x2, .LC59
	mov	w1, 840
	add	x3, x3, 168
	mov	w0, 1
	bl	dprint_normal
	mov	w2, -1
.L147:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, w2
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L131:
	ldp	w1, w0, [x19, 16]
	ldr	w3, [x19, 32]
	mov	w2, 0
	add	w1, w1, 15
	add	w0, w0, 31
	lsr	w1, w1, 4
	lsr	w0, w0, 5
	mul	w0, w1, w0
	lsl	w1, w0, 2
	sub	w0, w1, w0
	lsl	w0, w0, 9
	stp	w3, w0, [x20, 44]
	mov	w0, w2
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L130:
	ldr	w21, [x19]
	ldp	w1, w2, [x19, 16]
	mov	w0, w21
	bl	VCTRL_GetOccupiedNum
	mov	w22, w0
	mov	w0, w21
	bl	VCTRL_GetExtraFrameNum
	add	w0, w22, w0
	ldr	w1, [x19, 32]
	str	wzr, [x20]
	add	w0, w0, w1
	str	wzr, [x20, 88]
	str	w0, [x20, 44]
	ldr	w1, [x19, 12]
	tst	w1, -17
	beq	.L159
.L132:
	str	wzr, [x20, 8]
	str	wzr, [x20, 28]
.L133:
	ldr	x23, .LC48
	mov	w0, 1
	str	w0, [x20, 4]
	ldr	x0, [x23, w21, sxtw 3]
	add	x0, x0, 217088
	ldr	w0, [x0, 3300]
	cmp	w0, 2
	beq	.L160
	ldr	w0, [x19, 36]
	str	w0, [x20, 20]
.L135:
	ldr	w24, [x19]
	ldp	w5, w6, [x19, 12]
	ldr	w7, [x19, 20]
	ldr	x0, [x23, w24, sxtw 3]
	add	x22, x0, 217088
	ldr	w4, [x22, 3128]
	cmp	w4, 1
	beq	.L148
	cbz	w4, .L138
	cmp	w4, 3
	mov	w21, 0
	bne	.L137
	ldr	x2, .LC50
	mov	w1, 345
	mov	w0, 0
	str	w5, [x29, 76]
	stp	w7, w6, [x29, 68]
	bl	dprint_normal
	mov	w21, 0
	ldr	x0, [x23, w24, sxtw 3]
	ldp	w7, w6, [x29, 68]
	ldr	w5, [x29, 76]
.L137:
	add	x0, x0, 217088
	str	w21, [x22, 3900]
	ldr	x2, .LC52
	mov	w4, w21
	mov	w1, 352
	ldr	w3, [x0, 3128]
	mov	w0, 1
	bl	dprint_normal
	ldr	w0, [x20]
	cbnz	w0, .L143
	str	w21, [x22, 3896]
.L143:
	ldr	w0, [x22, 3900]
	strb	w0, [x19, 4]
	ldr	w0, [x19]
	ldr	w1, [x22, 3896]
	strb	w1, [x19, 5]
	ldrb	w2, [x19, 6]
	ldr	x1, [x23, w0, sxtw 3]
	add	x1, x1, 217088
	ldr	w3, [x1, 3212]
	cbnz	w3, .L144
	cmp	w2, 9
	beq	.L151
	sxtb	w2, w2
.L145:
	strb	w2, [x19, 7]
	bl	VCTRL_IfNoGapEnable
	str	w0, [x19, 44]
	mov	x1, x20
	mov	x0, x19
	bl	VDMHAL_DeriveMemSize
	mov	w2, 0
	cbz	w0, .L147
	ldr	x3, .LC53
	mov	w1, 797
	ldr	x2, .LC57
	mov	w0, 1
	add	x3, x3, 136
	bl	dprint_normal
	mov	w2, -1
	b	.L147
	.p2align 3
.L159:
	ldr	w1, [x19, 8]
	cmp	w1, 1
	bne	.L132
	str	w1, [x20, 8]
	str	w0, [x20, 28]
	b	.L133
	.p2align 3
.L138:
	and	w1, w5, -17
	cmp	w1, wzr
	ccmp	w5, 18, 4, ne
	mul	w1, w6, w7
	beq	.L161
.L141:
	cmp	w5, 17
	cset	w4, eq
.L142:
	mov	w2, 16383
	movk	w2, 0x1fa, lsl 16
	cmp	w1, w2
	csel	w21, w4, wzr, ls
	b	.L137
	.p2align 3
.L144:
	cmp	w3, 1
	beq	.L152
	cmp	w3, 2
	beq	.L162
	mov	w2, -1
	b	.L145
	.p2align 3
.L148:
	mov	w21, w4
	b	.L137
	.p2align 3
.L160:
	ldr	w0, [x20, 44]
	str	w0, [x20, 20]
	b	.L135
	.p2align 3
.L161:
	mov	w2, 36863
	mov	w4, 1
	movk	w2, 0x7e, lsl 16
	cmp	w1, w2
	bhi	.L142
	b	.L141
	.p2align 3
.L162:
	ldr	w1, [x1, 3896]
	cmp	w1, 1
	ccmp	w2, 8, 0, eq
	bhi	.L163
	mov	w3, 8
	mov	w1, 16
	cmp	w2, 9
	csel	w2, w3, w1, cc
	b	.L145
	.p2align 3
.L151:
	mov	w2, 10
	b	.L145
	.p2align 3
.L152:
	mov	w2, 8
	b	.L145
.L163:
	ldr	x3, .LC53
	mov	w1, 383
	ldr	x2, .LC55
	mov	w0, 1
	add	x3, x3, 112
	bl	dprint_normal
	mov	w2, -1
	ldr	w0, [x19]
	b	.L145
	.size	VDMHAL_InquireMemNeed, .-VDMHAL_InquireMemNeed
	.align	3
.LC48:
	.xword	s_pstVfmwChan
	.align	3
.LC50:
	.xword	.LC49
	.align	3
.LC52:
	.xword	.LC51
	.align	3
.LC53:
	.xword	.LANCHOR0
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
	.global	VDMHAL_ResetVdm
	.type	VDMHAL_ResetVdm, %function
VDMHAL_ResetVdm:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	str	wzr, [x29, 92]
	cmp	w21, wzr
	ble	.L165
	ldr	x3, .LC60
	mov	w5, 0
	ldr	x2, .LC62
	mov	w4, w21
	add	x3, x3, 192
	mov	w1, 905
	mov	w0, 0
	bl	dprint_normal
.L164:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L165:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L180
	sxtw	x23, w21
	ldr	x20, .LC65
	lsl	x26, x23, 7
	sub	x26, x26, x23
	lsl	x26, x26, 3
	ldr	x0, [x20, x26]
	add	x1, x0, 61440
	ldr	w24, [x0, 36]
	ldr	w0, [x1, 2052]
	str	w0, [x29, 92]
	and	w0, w0, 3
	cbz	w0, .L164
	ldr	x25, .LC66
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
	b	.L170
	.p2align 3
.L181:
	add	w19, w19, 1
	cmp	w19, 1000
	beq	.L171
.L170:
	ldr	x1, [x25, 232]
	mov	x0, 30
	blr	x1
	ldr	x0, [x20, x22]
	add	x0, x0, 61440
	ldr	w0, [x0, 2064]
	str	w0, [x29, 92]
	tbz	x0, 1, .L181
	cmp	w19, 999
	bgt	.L171
	ldr	x3, .LC60
	mov	w4, w21
	ldr	x2, .LC70
	mov	w1, 952
	add	x3, x3, 192
	mov	w0, 0
	bl	dprint_normal
.L173:
	lsl	x0, x23, 7
	ldr	x2, [x25, 224]
	sub	x23, x0, x23
	lsl	x23, x23, 3
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
.L171:
	ldr	x3, .LC60
	mov	w4, w21
	ldr	x2, .LC68
	mov	w1, 948
	add	x3, x3, 192
	mov	w0, 0
	bl	dprint_normal
	b	.L173
.L180:
	ldr	x2, .LC64
	mov	x3, 0
	mov	w1, 915
	bl	dprint_normal
	b	.L164
	.size	VDMHAL_ResetVdm, .-VDMHAL_ResetVdm
	.align	3
.LC60:
	.xword	.LANCHOR0
	.align	3
.LC62:
	.xword	.LC61
	.align	3
.LC64:
	.xword	.LC63
	.align	3
.LC65:
	.xword	g_HwMem
	.align	3
.LC66:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC68:
	.xword	.LC67
	.align	3
.LC70:
	.xword	.LC69
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_SetSmmuPageTableAddr
	.type	VDMHAL_SetSmmuPageTableAddr, %function
VDMHAL_SetSmmuPageTableAddr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC71
	ldr	x3, [x0, 376]
	cbz	x3, .L182
	add	x2, x29, 60
	add	x1, x29, 56
	add	x0, x29, 52
	blr	x3
	cbnz	w19, .L184
	ldr	x0, .LC72
	ldp	w3, w2, [x29, 52]
	ldr	w1, [x29, 60]
	ldr	x0, [x0]
	add	x0, x0, 61440
	str	w3, [x0, 524]
	str	w2, [x0, 772]
	str	w1, [x0, 776]
.L182:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L184:
	ldr	x20, .LC73
	mov	w4, w19
	ldr	x21, .LC75
	mov	w5, 1
	add	x20, x20, 208
	mov	w1, 972
	mov	x2, x21
	mov	x3, x20
	mov	w0, 32
	bl	dprint_normal
	mov	w4, w19
	mov	x3, x20
	mov	x2, x21
	mov	w5, 1
	mov	w1, 973
	mov	w0, 32
	bl	dprint_normal
	mov	w4, w19
	mov	x3, x20
	mov	x2, x21
	mov	w5, 1
	mov	w1, 974
	mov	w0, 32
	bl	dprint_normal
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.size	VDMHAL_SetSmmuPageTableAddr, .-VDMHAL_SetSmmuPageTableAddr
	.align	3
.LC71:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC72:
	.xword	g_HwMem
	.align	3
.LC73:
	.xword	.LANCHOR0
	.align	3
.LC75:
	.xword	.LC74
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_EnableSmmu
	.type	VDMHAL_EnableSmmu, %function
VDMHAL_EnableSmmu:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC77
	mov	w1, 8
	ldr	x0, [x0]
	add	x0, x0, 61440
	str	w1, [x0]
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_EnableSmmu, .-VDMHAL_EnableSmmu
	.align	3
.LC77:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_GlbReset
	.type	VDMHAL_GlbReset, %function
VDMHAL_GlbReset:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L194
	ldr	x0, .LC81
	ldr	x1, [x0, 152]
	cbz	x1, .L192
	mov	w0, 0
	blr	x1
.L189:
	ldp	x29, x30, [sp], 16
	ret
	.p2align 3
.L192:
	mov	w3, 1001
	ldr	x2, .LC82
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldp	x29, x30, [sp], 16
	ret
.L194:
	ldr	x3, .LC78
	mov	w4, -121438208
	ldr	x2, .LC80
	mov	w1, 995
	add	x3, x3, 240
	bl	dprint_normal
	b	.L189
	.size	VDMHAL_GlbReset, .-VDMHAL_GlbReset
	.align	3
.LC78:
	.xword	.LANCHOR0
	.align	3
.LC80:
	.xword	.LC79
	.align	3
.LC81:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC82:
	.xword	.LC34
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_GlbResetX
	.type	VDMHAL_GlbResetX, %function
VDMHAL_GlbResetX:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	str	wzr, [x29, 76]
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L214
	cmp	w19, wzr
	ble	.L215
	ldr	x21, .LC83
	mov	w5, 1
	ldr	x24, .LC87
	mov	w4, w19
	add	x23, x21, 256
	mov	w1, 1021
	mov	x2, x24
	mov	x3, x23
	mov	w0, 32
	bl	dprint_normal
	ldrb	w20, [x29, 76]
	and	w20, w20, 3
	cmp	w20, 1
	beq	.L216
.L195:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L215:
	sxtw	x20, w19
	ldr	x21, .LC85
	lsl	x0, x20, 7
	sub	x20, x0, x20
	lsl	x20, x20, 3
	ldr	x0, [x21, x20]
	add	x0, x0, 61440
	ldr	w0, [x0, 2052]
	str	w0, [x29, 76]
	and	w0, w0, 3
	cmp	w0, 1
	bne	.L195
	ldr	x22, .LC88
	ldr	x0, [x22, 224]
	blr	x0
	ldr	x0, [x21, x20]
	ldr	x21, .LC83
	add	x0, x0, 61440
	ldr	w1, [x0, 2060]
	str	w1, [x29, 76]
	orr	w1, w1, 1
	strb	w1, [x29, 76]
	ldr	w1, [x29, 76]
	str	w1, [x0, 2060]
	b	.L210
	.p2align 3
.L216:
	ldr	x22, .LC88
	ldr	x0, [x22, 224]
	blr	x0
	mov	w5, w20
	mov	w4, w19
	mov	x3, x23
	mov	x2, x24
	mov	w1, 1027
	mov	w0, 32
	bl	dprint_normal
	ldrb	w6, [x29, 76]
	mov	w5, w20
	ldr	x2, .LC93
	mov	w4, w19
	orr	w6, w6, 1
	mov	x3, x23
	mov	w1, 1029
	mov	w0, 32
	strb	w6, [x29, 76]
	bl	dprint_normal
.L210:
	sxtw	x0, w19
	ldr	x1, .LC85
	lsl	x24, x0, 7
	ldr	x23, .LC87
	sub	x0, x24, x0
	mov	w20, 0
	add	x24, x1, x0, lsl 3
	b	.L205
	.p2align 3
.L202:
	bl	dprint_normal
	ldrb	w0, [x29, 76]
	tbnz	x0, 0, .L204
.L217:
	add	w20, w20, 1
	cmp	w20, 1000
	beq	.L206
.L205:
	ldr	x1, [x22, 232]
	mov	x0, 30
	blr	x1
	cmp	w19, wzr
	mov	w5, 1
	mov	w4, w19
	add	x3, x21, 256
	mov	x2, x23
	mov	w1, 1035
	mov	w0, 32
	bgt	.L202
	ldr	x0, [x24]
	add	x0, x0, 61440
	ldr	w0, [x0, 2064]
	str	w0, [x29, 76]
	ldrb	w0, [x29, 76]
	tbz	x0, 0, .L217
.L204:
	cmp	w20, 999
	bgt	.L206
	ldr	x2, .LC92
	mov	w4, w19
	add	x3, x21, 256
	mov	w1, 1049
	mov	w0, 0
	bl	dprint_normal
.L208:
	cmp	w19, wzr
	ble	.L218
	add	x21, x21, 256
	ldr	x2, .LC87
	mov	w4, w19
	mov	x3, x21
	mov	w5, 1
	mov	w1, 1052
	mov	w0, 32
	bl	dprint_normal
	ldr	x2, .LC93
	mov	w4, w19
	mov	x3, x21
	mov	w5, 1
	mov	w1, 1054
	mov	w0, 32
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L206:
	ldr	x2, .LC90
	mov	w4, w19
	add	x3, x21, 256
	mov	w1, 1045
	mov	w0, 0
	bl	dprint_normal
	b	.L208
	.p2align 3
.L218:
	lsl	x0, x19, 7
	ldr	x1, .LC85
	sub	x0, x0, x19
	ldr	x0, [x1, x0, lsl 3]
	add	x0, x0, 61440
	ldr	w1, [x0, 2060]
	str	w1, [x29, 76]
	and	w1, w1, -2
	strb	w1, [x29, 76]
	ldr	w1, [x29, 76]
	str	w1, [x0, 2060]
	b	.L195
	.p2align 3
.L214:
	ldr	x3, .LC83
	mov	w4, -121438208
	ldr	x2, .LC84
	mov	w1, 1017
	add	x3, x3, 256
	bl	dprint_normal
	b	.L195
	.size	VDMHAL_GlbResetX, .-VDMHAL_GlbResetX
	.align	3
.LC83:
	.xword	.LANCHOR0
	.align	3
.LC84:
	.xword	.LC79
	.align	3
.LC85:
	.xword	g_HwMem
	.align	3
.LC87:
	.xword	.LC86
	.align	3
.LC88:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC90:
	.xword	.LC89
	.align	3
.LC92:
	.xword	.LC91
	.align	3
.LC93:
	.xword	.LC74
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_ClearIntState
	.type	VDMHAL_ClearIntState, %function
VDMHAL_ClearIntState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	bgt	.L222
	lsl	x4, x19, 7
	ldr	x0, .LC97
	sub	x19, x4, x19
	mov	w1, -1
	ldr	x0, [x0, x19, lsl 3]
	str	w1, [x0, 32]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L222:
	ldr	x3, .LC95
	mov	w4, w19
	ldr	x2, .LC96
	mov	w5, 0
	add	x3, x3, 280
	mov	w1, 1069
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_ClearIntState, .-VDMHAL_ClearIntState
	.align	3
.LC95:
	.xword	.LANCHOR0
	.align	3
.LC96:
	.xword	.LC61
	.align	3
.LC97:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_ClearMMUIntState
	.type	VDMHAL_ClearMMUIntState, %function
VDMHAL_ClearMMUIntState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	bgt	.L228
	lsl	x4, x19, 7
	ldr	x20, .LC100
	sub	x19, x4, x19
	lsl	x19, x19, 3
	ldr	x0, [x20, x19]
	cbz	x0, .L229
.L226:
	add	x0, x0, 61440
	mov	w1, 7
	str	w1, [x0, 44]
.L223:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L228:
	ldr	x3, .LC98
	mov	w4, w19
	ldr	x2, .LC99
	mov	w5, 0
	add	x3, x3, 304
	mov	w1, 1121
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L229:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L227
	str	x0, [x20, x19]
	b	.L226
.L227:
	ldr	x2, .LC102
	mov	w1, 1135
	mov	w0, 0
	bl	dprint_normal
	b	.L223
	.size	VDMHAL_ClearMMUIntState, .-VDMHAL_ClearMMUIntState
	.align	3
.LC98:
	.xword	.LANCHOR0
	.align	3
.LC99:
	.xword	.LC61
	.align	3
.LC100:
	.xword	g_HwMem
	.align	3
.LC102:
	.xword	.LC101
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_MaskInt
	.type	VDMHAL_MaskInt, %function
VDMHAL_MaskInt:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	bgt	.L235
	lsl	x4, x19, 7
	ldr	x20, .LC105
	sub	x19, x4, x19
	lsl	x19, x19, 3
	ldr	x0, [x20, x19]
	cbz	x0, .L236
.L233:
	mov	w1, -1
	str	w1, [x0, 36]
.L230:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L235:
	ldr	x3, .LC103
	mov	w4, w19
	ldr	x2, .LC104
	mov	w5, 0
	add	x3, x3, 328
	mov	w1, 1156
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L236:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L234
	str	x0, [x20, x19]
	b	.L233
.L234:
	ldr	x2, .LC106
	mov	w1, 1170
	mov	w0, 0
	bl	dprint_normal
	b	.L230
	.size	VDMHAL_MaskInt, .-VDMHAL_MaskInt
	.align	3
.LC103:
	.xword	.LANCHOR0
	.align	3
.LC104:
	.xword	.LC61
	.align	3
.LC105:
	.xword	g_HwMem
	.align	3
.LC106:
	.xword	.LC101
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_GetIntMaskCfg
	.type	VDMHAL_GetIntMaskCfg, %function
VDMHAL_GetIntMaskCfg:
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
	.size	VDMHAL_GetIntMaskCfg, .-VDMHAL_GetIntMaskCfg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_EnableInt
	.type	VDMHAL_EnableInt, %function
VDMHAL_EnableInt:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	bgt	.L243
	lsl	x4, x19, 7
	ldr	x0, .LC109
	sub	x19, x4, x19
	mov	w1, -2
	ldr	x0, [x0, x19, lsl 3]
	str	w1, [x0, 36]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L243:
	ldr	x3, .LC107
	mov	w4, w19
	ldr	x2, .LC108
	mov	w5, 0
	add	x3, x3, 344
	mov	w1, 1226
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_EnableInt, .-VDMHAL_EnableInt
	.align	3
.LC107:
	.xword	.LANCHOR0
	.align	3
.LC108:
	.xword	.LC61
	.align	3
.LC109:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_CheckReg
	.type	VDMHAL_CheckReg, %function
VDMHAL_CheckReg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w19, wzr
	bgt	.L259
	sub	w0, w20, #1
	cmp	w0, 6
	bls	.L260
	ldr	x3, .LC110
	mov	w4, w20
	ldr	x2, .LC115
	mov	w1, 1290
	add	x3, x3, 368
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
.L258:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L260:
	ldr	x1, .LC113
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx249
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx249:
	.section	.rodata
	.align	0
	.align	2
.L249:
	.byte	(.L256 - .Lrtx249) / 4
	.byte	(.L250 - .Lrtx249) / 4
	.byte	(.L257 - .Lrtx249) / 4
	.byte	(.L252 - .Lrtx249) / 4
	.byte	(.L253 - .Lrtx249) / 4
	.byte	(.L254 - .Lrtx249) / 4
	.byte	(.L255 - .Lrtx249) / 4
	.text
	.p2align 3
.L257:
	mov	x0, 36
.L248:
	lsl	x1, x19, 7
	ldr	x2, .LC116
	sub	x19, x1, x19
	ldr	x1, [x2, x19, lsl 3]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x1, x0]
	ret
	.p2align 3
.L256:
	mov	x0, 28
	b	.L248
	.p2align 3
.L254:
	mov	x0, 62304
	b	.L248
	.p2align 3
.L253:
	mov	x0, 61480
	b	.L248
	.p2align 3
.L252:
	mov	x0, 40
	b	.L248
	.p2align 3
.L250:
	mov	x0, 32
	b	.L248
	.p2align 3
.L255:
	mov	x0, 62272
	b	.L248
	.p2align 3
.L259:
	ldr	x3, .LC110
	mov	w4, w19
	ldr	x2, .LC112
	mov	w1, 1243
	add	x3, x3, 368
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L258
	.size	VDMHAL_CheckReg, .-VDMHAL_CheckReg
	.align	3
.LC110:
	.xword	.LANCHOR0
	.align	3
.LC112:
	.xword	.LC111
	.align	3
.LC113:
	.xword	.L249
	.align	3
.LC115:
	.xword	.LC114
	.align	3
.LC116:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_ReadMMUMask
	.type	VDMHAL_ReadMMUMask, %function
VDMHAL_ReadMMUMask:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	ble	.L264
	ldr	x3, .LC118
	mov	w4, w19
	ldr	x2, .LC119
	mov	w5, 1
	mov	w1, 1303
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L264:
	lsl	x4, x19, 7
	ldr	x0, .LC117
	sub	x19, x4, x19
	ldr	x0, [x0, x19, lsl 3]
	ldr	x19, [sp, 16]
	add	x0, x0, 61440
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 32]
	ret
	.size	VDMHAL_ReadMMUMask, .-VDMHAL_ReadMMUMask
	.align	3
.LC117:
	.xword	g_HwMem
	.align	3
.LC118:
	.xword	.LANCHOR1
	.align	3
.LC119:
	.xword	.LC86
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_WriteMMUMask
	.type	VDMHAL_WriteMMUMask, %function
VDMHAL_WriteMMUMask:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w19, wzr
	ble	.L268
	ldr	x3, .LC121
	mov	w4, w19
	ldr	x2, .LC122
	mov	w5, 1
	add	x3, x3, 24
	mov	w1, 1310
	mov	w0, 32
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L268:
	lsl	x1, x19, 7
	ldr	x0, .LC120
	sub	x19, x1, x19
	ldr	x0, [x0, x19, lsl 3]
	add	x0, x0, 61440
	str	w20, [x0, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_WriteMMUMask, .-VDMHAL_WriteMMUMask
	.align	3
.LC120:
	.xword	g_HwMem
	.align	3
.LC121:
	.xword	.LANCHOR1
	.align	3
.LC122:
	.xword	.LC74
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_PrepareDec
	.type	VDMHAL_PrepareDec, %function
VDMHAL_PrepareDec:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w19, w2
	mov	x22, x1
	mov	x20, x3
	bl	_mcount
	cmp	w19, wzr
	bgt	.L289
	cbz	x22, .L290
	cmp	w21, 6
	mov	w2, 0
	cset	w1, eq
	mov	w0, 0
	mov	x3, x20
	bl	SCD_ConfigReg
	mov	x3, x20
	mov	w2, 0
	mov	w1, 1
	mov	w0, 8
	bl	SCD_ConfigReg
	mov	x3, x20
	mov	w2, w19
	mov	x1, x22
	mov	w0, w21
	bl	HAL_CfgVdmReg
	cbnz	w0, .L291
	cmp	w21, 16
	bls	.L292
.L288:
	ldr	x3, .LC123
	mov	w1, 1442
	ldr	x4, .LC132
	mov	w0, 0
	ldr	x2, .LC127
	add	x3, x3, 48
	bl	dprint_normal
	mov	w0, -1
	b	.L271
	.p2align 3
.L292:
	ldr	x0, .LC130
	ldrb	w0, [x0,w21,uxtw]
	adr	x1, .Lrtx276
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx276:
	.section	.rodata
	.align	0
	.align	2
.L276:
	.byte	(.L284 - .Lrtx276) / 4
	.byte	(.L277 - .Lrtx276) / 4
	.byte	(.L278 - .Lrtx276) / 4
	.byte	(.L279 - .Lrtx276) / 4
	.byte	(.L280 - .Lrtx276) / 4
	.byte	(.L288 - .Lrtx276) / 4
	.byte	(.L281 - .Lrtx276) / 4
	.byte	(.L288 - .Lrtx276) / 4
	.byte	(.L288 - .Lrtx276) / 4
	.byte	(.L288 - .Lrtx276) / 4
	.byte	(.L282 - .Lrtx276) / 4
	.byte	(.L282 - .Lrtx276) / 4
	.byte	(.L282 - .Lrtx276) / 4
	.byte	(.L283 - .Lrtx276) / 4
	.byte	(.L280 - .Lrtx276) / 4
	.byte	(.L284 - .Lrtx276) / 4
	.byte	(.L285 - .Lrtx276) / 4
	.text
	.p2align 3
.L284:
	mov	x2, x20
	mov	w1, w19
	mov	x0, x22
	bl	H264HAL_StartDec
.L274:
	cbnz	w0, .L288
	sxtw	x1, w19
	ldr	x3, .LC133
	lsl	x2, x1, 7
	sub	x1, x2, x1
	add	x1, x3, x1, lsl 3
	ldr	w2, [x1, 852]
	str	wzr, [x1, 852]
	cmp	w2, 1
	beq	.L293
.L271:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L283:
	mov	x2, x20
	mov	w1, w19
	mov	x0, x22
	bl	VP8HAL_StartDec
	b	.L274
	.p2align 3
.L282:
	mov	x2, x20
	mov	w1, w19
	mov	x0, x22
	bl	VP6HAL_StartDec
	b	.L274
	.p2align 3
.L281:
	mov	x2, x20
	mov	w1, w19
	mov	x0, x22
	bl	AVSHAL_StartDec
	b	.L274
	.p2align 3
.L280:
	mov	x2, x20
	mov	w1, w19
	mov	x0, x22
	bl	H263HAL_StartDec
	b	.L274
	.p2align 3
.L279:
	mov	x2, x20
	mov	w1, w19
	mov	x0, x22
	bl	MP2HAL_StartDec
	b	.L274
	.p2align 3
.L278:
	mov	x2, x20
	mov	w1, w19
	mov	x0, x22
	bl	MP4HAL_StartDec
	b	.L274
	.p2align 3
.L277:
	mov	x2, x20
	mov	w1, w19
	mov	x0, x22
	bl	VC1HAL_StartDec
	b	.L274
	.p2align 3
.L285:
	mov	x2, x20
	mov	w1, w19
	mov	x0, x22
	bl	HEVCHAL_StartDec
	b	.L274
	.p2align 3
.L289:
	ldr	x3, .LC123
	mov	w5, 0
	ldr	x2, .LC124
	mov	w4, w19
	add	x3, x3, 48
	mov	w1, 1427
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L271
	.p2align 3
.L291:
	ldr	x3, .LC123
	mov	w1, 1439
	ldr	x4, .LC129
	mov	w0, 0
	ldr	x2, .LC127
	add	x3, x3, 48
	bl	dprint_normal
	mov	w0, -1
	b	.L271
.L290:
	ldr	x3, .LC123
	mov	w1, 1431
	ldr	x4, .LC126
	mov	w0, 0
	ldr	x2, .LC127
	add	x3, x3, 48
	bl	dprint_normal
	mov	w0, -1
	b	.L271
.L293:
	ldr	x3, .LC123
	mov	w6, 0
	ldr	x2, .LC135
	mov	w5, w19
	mov	w4, w21
	add	x3, x3, 48
	mov	w1, 1450
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L271
	.size	VDMHAL_PrepareDec, .-VDMHAL_PrepareDec
	.align	3
.LC123:
	.xword	.LANCHOR1
	.align	3
.LC124:
	.xword	.LC61
	.align	3
.LC126:
	.xword	.LC125
	.align	3
.LC127:
	.xword	.LC21
	.align	3
.LC129:
	.xword	.LC128
	.align	3
.LC130:
	.xword	.L276
	.align	3
.LC132:
	.xword	.LC131
	.align	3
.LC133:
	.xword	g_HwMem
	.align	3
.LC135:
	.xword	.LC134
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_IsVdmReady
	.type	VDMHAL_IsVdmReady, %function
VDMHAL_IsVdmReady:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	ble	.L297
	ldr	x3, .LC137
	mov	w4, w19
	ldr	x2, .LC138
	mov	w5, 1
	add	x3, x3, 72
	mov	w1, 1461
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L297:
	lsl	x4, x19, 7
	ldr	x0, .LC136
	sub	x19, x4, x19
	ldr	x0, [x0, x19, lsl 3]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 28]
	ubfx	x0, x0, 17, 1
	ret
	.size	VDMHAL_IsVdmReady, .-VDMHAL_IsVdmReady
	.align	3
.LC136:
	.xword	g_HwMem
	.align	3
.LC137:
	.xword	.LANCHOR1
	.align	3
.LC138:
	.xword	.LC86
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_IsVdmRun
	.type	VDMHAL_IsVdmRun, %function
VDMHAL_IsVdmRun:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	ble	.L301
	ldr	x3, .LC140
	mov	w4, w19
	ldr	x2, .LC141
	mov	w5, 1
	add	x3, x3, 96
	mov	w1, 1473
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, 1
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L301:
	lsl	x4, x19, 7
	ldr	x0, .LC139
	sub	x19, x4, x19
	ldr	x0, [x0, x19, lsl 3]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 40]
	cmp	w0, 1
	cset	w0, ne
	ret
	.size	VDMHAL_IsVdmRun, .-VDMHAL_IsVdmRun
	.align	3
.LC139:
	.xword	g_HwMem
	.align	3
.LC140:
	.xword	.LANCHOR1
	.align	3
.LC141:
	.xword	.LC86
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_IsVdhDecOver
	.type	VDMHAL_IsVdhDecOver, %function
VDMHAL_IsVdhDecOver:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	x0, .LC142
	ldr	x2, [x0, 192]
	cbz	x2, .L309
	mov	w1, w20
	mov	w0, w19
	blr	x2
.L303:
	cmp	w19, 2
	beq	.L306
	cmp	w19, 3
	beq	.L306
	cmp	w19, 1
	ubfx	x0, x0, 17, 1
	beq	.L308
	ldr	x3, .LC143
	mov	w4, w19
	ldr	x2, .LC144
	mov	w1, 1503
	add	x3, x3, 112
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
.L308:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L306:
	and	w0, w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L309:
	mov	w0, 0
	b	.L303
	.size	VDMHAL_IsVdhDecOver, .-VDMHAL_IsVdhDecOver
	.align	3
.LC142:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC143:
	.xword	.LANCHOR1
	.align	3
.LC144:
	.xword	.LC114
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_IsVdhPartDecOver
	.type	VDMHAL_IsVdhPartDecOver, %function
VDMHAL_IsVdhPartDecOver:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	x0, .LC145
	ldr	x2, [x0, 192]
	cbz	x2, .L317
	mov	w1, w20
	mov	w0, w19
	blr	x2
.L312:
	cmp	w19, 1
	beq	.L314
	cmp	w19, 2
	ubfx	x0, x0, 2, 1
	bne	.L320
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L320:
	ldr	x3, .LC146
	mov	w4, w19
	ldr	x2, .LC147
	mov	w1, 1523
	add	x3, x3, 136
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L314:
	ubfx	x0, x0, 19, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L317:
	mov	w0, 0
	b	.L312
	.size	VDMHAL_IsVdhPartDecOver, .-VDMHAL_IsVdhPartDecOver
	.align	3
.LC145:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC146:
	.xword	.LANCHOR1
	.align	3
.LC147:
	.xword	.LC114
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_GetRepairRequire
	.type	VDMHAL_GetRepairRequire, %function
VDMHAL_GetRepairRequire:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L321
	str	wzr, [x19]
.L321:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_GetRepairRequire, .-VDMHAL_GetRepairRequire
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_UpdateHardwareInfo
	.type	VDMHAL_UpdateHardwareInfo, %function
VDMHAL_UpdateHardwareInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	bgt	.L332
	sxtw	x4, w19
	ldr	x2, .LC150
	lsl	x1, x4, 7
	lsl	x0, x4, 2
	sub	x1, x1, x4
	sub	x0, x0, x4
	lsl	x0, x0, 3
	lsl	x3, x4, 3
	sub	x3, x3, x4
	sub	x0, x0, x4
	ldr	x2, [x2, x1, lsl 3]
	lsl	x0, x0, 3
	ldr	x5, .LC152
	ldr	x6, .LC151
	add	x5, x5, x3, lsl 3
	ldr	w1, [x2, 12]
	add	x3, x6, x0
	str	w1, [x6, x0]
	ldr	w0, [x5, 48]
	ldr	w1, [x2, 28]
	cmp	w0, 1
	str	w1, [x3, 4]
	beq	.L333
	ldr	w7, [x2, 4096]
	ldr	w5, [x2, 4108]
	ldr	w1, [x2, 208]
	ldr	w0, [x2, 212]
	stp	w7, w5, [x3, 16]
	stp	w1, w0, [x3, 8]
	mov	w7, 184
	add	x5, x2, 32768
	ldr	w0, [x2, 176]
	add	x1, x5, 256
	str	w0, [x3, 24]
	smull	x19, w19, w7
	ldr	w8, [x2, 180]
	ldr	w7, [x2, 184]
	add	x0, x19, 52
	stp	w8, w7, [x3, 28]
	add	x19, x19, 180
	ldr	w7, [x2, 188]
	ldr	w2, [x2, 192]
	add	x0, x0, x6
	stp	w7, w2, [x3, 36]
	add	x3, x19, x6
	.p2align 2
.L330:
	ldr	w2, [x1], 4
	str	w2, [x0], 4
	cmp	x0, x3
	bne	.L330
	lsl	x0, x4, 2
	ldr	w3, [x5, 384]
	sub	x0, x0, x4
	ldr	w2, [x5, 388]
	lsl	x1, x0, 3
	mov	w0, 0
	sub	x4, x1, x4
	add	x1, x6, x4, lsl 3
	stp	w2, w3, [x1, 44]
.L328:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L333:
	ldr	w1, [x2, 4108]
	mov	w0, 0
	str	w1, [x3, 20]
	and	w1, w1, 65535
	ldr	w2, [x2, 176]
	stp	w1, w2, [x3, 20]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L332:
	ldr	x3, .LC148
	mov	w5, 0
	ldr	x2, .LC149
	mov	w4, w19
	add	x3, x3, 160
	mov	w1, 1543
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L328
	.size	VDMHAL_UpdateHardwareInfo, .-VDMHAL_UpdateHardwareInfo
	.align	3
.LC148:
	.xword	.LANCHOR1
	.align	3
.LC149:
	.xword	.LC61
	.align	3
.LC150:
	.xword	g_HwMem
	.align	3
.LC151:
	.xword	g_BackUp
	.align	3
.LC152:
	.xword	g_VdmDrvParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_ReadMsgSlot
	.type	VDMHAL_ReadMsgSlot, %function
VDMHAL_ReadMsgSlot:
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
	beq	.L338
	cmp	w19, 800
	bhi	.L339
	ldr	x3, .LC157
	ubfiz	x2, x19, 2, 30
	mov	x1, x21
	mov	x0, x20
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L336:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L339:
	ldr	x2, .LC156
	mov	w4, 800
	mov	w3, w19
	mov	w1, 1595
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L336
	.p2align 3
.L338:
	ldr	x2, .LC154
	mov	x4, x21
	mov	x3, x20
	mov	w1, 1589
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L336
	.size	VDMHAL_ReadMsgSlot, .-VDMHAL_ReadMsgSlot
	.align	3
.LC154:
	.xword	.LC153
	.align	3
.LC156:
	.xword	.LC155
	.align	3
.LC157:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_CfgDecRpMsg
	.type	VDMHAL_CfgDecRpMsg, %function
VDMHAL_CfgDecRpMsg:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x1
	mov	x21, x0
	mov	x0, x30
	mov	w19, w2
	bl	_mcount
	str	wzr, [x29, 92]
	ldr	w0, [x20, 40]
	bl	MEM_Phy2Vir
	mov	x20, x0
	cbz	x0, .L383
	ldr	w0, [x21, 32]
	sub	w0, w0, #1
	cmp	w0, 199
	bhi	.L384
	sxtw	x2, w19
	ldr	x3, .LC165
	lsl	x0, x2, 3
	ldr	x1, .LC164
	sub	x2, x0, x2
	ldrb	w7, [x21, 1]
	add	x2, x3, x2, lsl 3
	and	w22, w7, 15
	ldrsw	x0, [x2, 8]
	ldr	x0, [x1, x0, lsl 3]
	add	x0, x0, 217088
	ldr	w23, [x0, 3900]
	cbz	w7, .L385
.L344:
	ldr	w4, [x21, 4]
	mov	w0, -32
	ldp	w1, w2, [x21, 16]
	ldr	w5, [x21, 48]
	sub	w4, w4, #16
	cmp	w4, 2
	mov	w3, -64
	lsl	w2, w2, w5
	lsl	w5, w1, w5
	csel	w1, w0, w3, hi
	mov	w0, 32
	mov	w3, 64
	sub	w4, w2, #1
	csel	w3, w0, w3, hi
	add	w0, w5, 63
	add	w3, w4, w3
	and	w0, w0, -64
	and	w3, w3, w1
	cmp	w23, 1
	mov	w9, 0
	lsl	w6, w0, 4
	mul	w4, w0, w3
	beq	.L386
.L346:
	cmp	w7, 8
	add	w4, w4, w9
	bhi	.L387
	ldr	x19, .LC166
	mov	w2, 0
	mov	w3, 0
	mov	w8, 0
	ldr	w7, [x21, 12]
	ldr	x1, [x19, 856]
	ldr	w0, [x19, 864]
	sub	x5, x20, x1
	cmp	x5, x0
	blt	.L348
.L391:
	mov	w5, 1
	add	x7, x20, 1
	str	w5, [x19, 852]
	sub	x7, x7, x1
	cmp	x7, x0
	ldr	w5, [x21, 12]
	add	w5, w4, w5
	blt	.L350
.L392:
	add	x7, x20, 2
	mov	w5, 1
	sub	x7, x7, x1
	str	w5, [x19, 852]
	cmp	x7, x0
	ldr	w5, [x21, 8]
	blt	.L352
.L393:
	mov	w5, 1
	add	x7, x20, 3
	str	w5, [x19, 852]
	sub	x7, x7, x1
	cmp	x7, x0
	ldr	w7, [x21, 8]
	add	w4, w4, w7
	blt	.L354
.L394:
	mov	w4, 1
	str	w4, [x19, 852]
	add	x4, x20, 4
	sub	x4, x4, x1
	cmp	x4, x0
	blt	.L356
.L395:
	mov	w4, 1
	str	w4, [x19, 852]
	add	x4, x20, 5
	sub	x4, x4, x1
	cmp	x4, x0
	blt	.L358
.L396:
	mov	w4, 1
	str	w4, [x19, 852]
.L359:
	ldp	w5, w4, [x21, 16]
	add	x7, x20, 6
	sub	x7, x7, x1
	sub	w5, w5, #1
	cmp	x7, x0
	mov	w7, 0
	bfi	w7, w5, 0, 9
	sub	w4, w4, #1
	mov	w5, 0
	strh	w7, [x29, 88]
	bfi	w5, w4, 0, 9
	strh	w5, [x29, 90]
	blt	.L360
	mov	w4, 1
	str	w4, [x19, 852]
.L361:
	add	x4, x20, 8
	sub	x4, x4, x1
	cmp	x4, x0
	mov	w4, 0
	bfi	w4, w2, 0, 20
	blt	.L362
	mov	w2, 1
	str	w2, [x19, 852]
.L363:
	add	x2, x20, 9
	sub	x2, x2, x1
	cmp	x2, x0
	blt	.L364
	mov	w2, 1
	str	w2, [x19, 852]
.L365:
	add	x2, x20, 10
	str	w3, [x29, 88]
	sub	x2, x2, x1
	cmp	x2, x0
	blt	.L366
	mov	w2, 1
	str	w2, [x19, 852]
.L367:
	ldr	w3, [x29, 88]
	add	x2, x20, 11
	lsr	w6, w6, 1
	sub	x1, x2, x1
	bfi	w3, w6, 0, 18
	cmp	x1, x0
	str	w3, [x29, 88]
	blt	.L368
	mov	w0, 1
	str	w0, [x19, 852]
	ldr	w0, [x21, 40]
	ldp	w25, w24, [x21, 16]
	sub	w0, w0, #1
	cmp	w0, 1
	bls	.L388
.L371:
	ldr	w0, [x21, 44]
	cbz	w0, .L389
.L372:
	cmp	w0, 1
	beq	.L373
.L397:
	ldr	w3, [x29, 92]
	ldr	w6, [x19, 864]
	sub	w3, w3, #1
	ldr	x7, [x19, 856]
	uxth	w3, w3
.L374:
	ldr	w0, [x21, 40]
	mov	w1, 0
	ldr	w4, [x21, 48]
	bfi	w1, w23, 0, 1
	and	w0, w0, 3
	ldrb	w5, [x21]
	bfi	w1, w0, 4, 2
	sub	w4, w4, #4
	bfi	w1, w0, 6, 2
	mov	w0, 0
	add	x2, x20, 7
	bfi	w0, w4, 0, 2
	sub	x2, x2, x7
	bfi	w0, w22, 2, 4
	bfi	w0, w5, 6, 1
	strh	w3, [x29, 88]
	cmp	x2, x6
	strb	w1, [x29, 90]
	strb	w0, [x29, 91]
	bge	.L390
	ldr	w1, [x29, 88]
	mov	w0, 0
	str	w1, [x20, 28]
.L342:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L387:
	ldr	x19, .LC166
	lsr	w0, w0, 2
	lsl	w2, w0, 5
	lsl	w8, w4, 2
	mul	w3, w3, w0
	ldr	x1, [x19, 856]
	sub	w8, w8, w4
	ldr	w0, [x19, 864]
	lsr	w8, w8, 1
	sub	x5, x20, x1
	and	w2, w2, 1048575
	cmp	x5, x0
	ldr	w7, [x21, 12]
	bge	.L391
.L348:
	str	w7, [x20]
	add	x7, x20, 1
	ldr	x1, [x19, 856]
	ldr	w0, [x19, 864]
	sub	x7, x7, x1
	ldr	w5, [x21, 12]
	cmp	x7, x0
	add	w5, w4, w5
	bge	.L392
.L350:
	str	w5, [x20, 4]
	add	x7, x20, 2
	ldr	x1, [x19, 856]
	ldr	w0, [x19, 864]
	sub	x7, x7, x1
	ldr	w5, [x21, 8]
	cmp	x7, x0
	bge	.L393
.L352:
	str	w5, [x20, 8]
	add	x7, x20, 3
	ldr	x1, [x19, 856]
	ldr	w0, [x19, 864]
	sub	x7, x7, x1
	cmp	x7, x0
	ldr	w7, [x21, 8]
	add	w4, w4, w7
	bge	.L394
.L354:
	str	w4, [x20, 12]
	add	x4, x20, 4
	ldr	x1, [x19, 856]
	ldr	w0, [x19, 864]
	sub	x4, x4, x1
	cmp	x4, x0
	bge	.L395
.L356:
	str	w6, [x20, 16]
	add	x4, x20, 5
	ldr	x1, [x19, 856]
	ldr	w0, [x19, 864]
	sub	x4, x4, x1
	cmp	x4, x0
	bge	.L396
.L358:
	str	w9, [x20, 20]
	ldr	w0, [x19, 864]
	ldr	x1, [x19, 856]
	b	.L359
	.p2align 3
.L385:
	mov	w22, 8
	mov	w7, w22
	b	.L344
	.p2align 3
.L368:
	str	w3, [x20, 44]
	ldr	w0, [x21, 40]
	ldp	w25, w24, [x21, 16]
	sub	w0, w0, #1
	cmp	w0, 1
	bhi	.L371
.L388:
	ldr	w0, [x21, 44]
	add	w24, w24, w24, lsr 31
	asr	w24, w24, 1
	cbnz	w0, .L372
.L389:
	add	x4, x29, 92
	mov	w3, w24
	mov	w2, w25
	mov	x1, x20
	mov	x0, x21
	bl	VDMHAL_CfgNotFullRepair
	ldr	w0, [x21, 44]
	cmp	w0, 1
	bne	.L397
.L373:
	str	w0, [x21, 32]
	add	x1, x20, 12
	strh	wzr, [x29, 88]
	ldr	x7, [x19, 856]
	ldr	w6, [x19, 864]
	sub	x1, x1, x7
	strh	wzr, [x29, 90]
	cmp	x1, x6
	bge	.L398
	ldr	w0, [x29, 88]
	str	w0, [x20, 48]
	ldr	w6, [x19, 864]
	ldr	x7, [x19, 856]
.L376:
	add	x0, x20, 13
	sub	w25, w25, #1
	mov	w2, 0
	sub	w24, w24, #1
	mov	w1, 0
	sub	x0, x0, x7
	bfi	w2, w25, 0, 9
	bfi	w1, w24, 0, 9
	strh	w2, [x29, 88]
	cmp	x0, x6
	strh	w1, [x29, 90]
	blt	.L377
	mov	w0, 1
	mov	w3, 0
	str	w0, [x19, 852]
	b	.L374
	.p2align 3
.L366:
	str	w3, [x20, 40]
	ldr	w0, [x19, 864]
	ldr	x1, [x19, 856]
	b	.L367
	.p2align 3
.L364:
	str	w8, [x20, 36]
	ldr	w0, [x19, 864]
	ldr	x1, [x19, 856]
	b	.L365
	.p2align 3
.L362:
	str	w4, [x20, 32]
	ldr	w0, [x19, 864]
	ldr	x1, [x19, 856]
	b	.L363
	.p2align 3
.L360:
	ldr	w0, [x29, 88]
	str	w0, [x20, 24]
	ldr	w0, [x19, 864]
	ldr	x1, [x19, 856]
	b	.L361
	.p2align 3
.L390:
	mov	w1, 1
	str	w1, [x19, 852]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L386:
	add	w5, w5, 2047
	add	w2, w2, 63
	and	w5, w5, -2048
	and	w2, w2, -64
	lsr	w5, w5, 7
	lsr	w2, w2, 1
	mul	w9, w5, w2
	b	.L346
	.p2align 3
.L398:
	str	w0, [x19, 852]
	b	.L376
	.p2align 3
.L377:
	ldr	w0, [x29, 88]
	mov	w3, 0
	str	w0, [x20, 52]
	ldr	w6, [x19, 864]
	ldr	x7, [x19, 856]
	b	.L374
	.p2align 3
.L384:
	ldr	x3, .LC160
	mov	w1, 1747
	ldr	x4, .LC163
	mov	w0, 0
	ldr	x2, .LC161
	add	x3, x3, 192
	bl	dprint_normal
	mov	w0, -1
	b	.L342
.L383:
	ldr	x3, .LC160
	mov	w1, 1745
	ldr	x4, .LC159
	mov	w0, 0
	ldr	x2, .LC161
	add	x3, x3, 192
	bl	dprint_normal
	mov	w0, -1
	b	.L342
	.size	VDMHAL_CfgDecRpMsg, .-VDMHAL_CfgDecRpMsg
	.align	3
.LC159:
	.xword	.LC158
	.align	3
.LC160:
	.xword	.LANCHOR1
	.align	3
.LC161:
	.xword	.LC21
	.align	3
.LC163:
	.xword	.LC162
	.align	3
.LC164:
	.xword	s_pstVfmwChan
	.align	3
.LC165:
	.xword	g_VdmDrvParam
	.align	3
.LC166:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_CfgDispRpMsg
	.type	VDMHAL_CfgDispRpMsg, %function
VDMHAL_CfgDispRpMsg:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	mov	w19, w2
	mov	x20, x1
	bl	_mcount
	str	wzr, [x29, 124]
	sxtw	x2, w19
	ldr	x3, .LC167
	lsl	x0, x2, 3
	sub	x2, x0, x2
	ldr	w0, [x20, 40]
	add	x2, x3, x2, lsl 3
	ldr	w19, [x2, 8]
	bl	MEM_Phy2Vir
	mov	x20, x0
	cbz	x0, .L452
	ldr	w0, [x21, 32]
	sub	w0, w0, #1
	cmp	w0, 199
	bhi	.L453
	ldrb	w0, [x21, 2]
	mov	w1, 2
	ldr	w2, [x21, 12]
	cbz	w0, .L454
	mov	w0, w19
	bl	FSP_GetLogicFs_By_DispAddr
	mov	x23, x0
	cbz	x0, .L455
	ldr	w2, [x21, 8]
	mov	w1, 1
	mov	w0, w19
	bl	FSP_GetLogicFs_By_DispAddr
	cbz	x0, .L456
	add	x22, x23, 56
	ldr	w1, [x23, 124]
	ldr	w3, [x0, 124]
	ldr	w2, [x22, 444]
	cmp	w3, w1
	ldr	w23, [x22, 452]
	ccmp	w1, wzr, 0, ne
	ldr	w27, [x22, 424]
	ldp	w28, w25, [x21, 8]
	ldr	w24, [x22, 432]
	sub	w23, w23, w2
	ldr	w26, [x22, 436]
	beq	.L457
.L406:
	ldr	x19, .LC181
	ldr	x2, [x19, 856]
	ldr	w1, [x19, 864]
	sub	x0, x20, x2
	cmp	x0, x1
	blt	.L414
.L464:
	mov	w0, 1
	str	w0, [x19, 852]
	add	x0, x20, 1
	add	w25, w25, w23
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L416
.L465:
	mov	w0, 1
	str	w0, [x19, 852]
	add	x0, x20, 2
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L418
.L466:
	mov	w0, 1
	str	w0, [x19, 852]
	add	x0, x20, 3
	add	w23, w28, w23
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L420
.L467:
	mov	w0, 1
	str	w0, [x19, 852]
	add	x0, x20, 4
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L422
.L468:
	mov	w0, 1
	str	w0, [x19, 852]
	add	x0, x20, 5
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L424
.L469:
	mov	w0, 1
	str	w0, [x19, 852]
.L425:
	ldp	w4, w3, [x21, 16]
	add	x0, x20, 6
	mov	w5, 0
	sub	x0, x0, x2
	sub	w4, w4, #1
	cmp	x0, x1
	sub	w3, w3, #1
	mov	w0, 0
	bfi	w5, w4, 0, 9
	bfi	w0, w3, 0, 9
	strh	w5, [x29, 120]
	strh	w0, [x29, 122]
	blt	.L426
	mov	w0, 1
	str	w0, [x19, 852]
.L427:
	add	x0, x20, 8
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L428
	mov	w0, 1
	str	w0, [x19, 852]
.L429:
	add	x0, x20, 9
	str	wzr, [x29, 120]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L430
	mov	w0, 1
	str	w0, [x19, 852]
.L431:
	add	x0, x20, 10
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L432
	mov	w0, 1
	str	w0, [x19, 852]
.L433:
	ldrh	w3, [x29, 122]
	add	x0, x20, 11
	sub	x2, x0, x2
	bfi	w3, w24, 2, 14
	strh	w3, [x29, 122]
	cmp	x2, x1
	ldr	w0, [x29, 120]
	and	w0, w0, -262144
	str	w0, [x29, 120]
	blt	.L434
	mov	w0, 1
	str	w0, [x19, 852]
	ldr	w0, [x21, 40]
	ldp	w24, w23, [x21, 16]
	sub	w0, w0, #1
	cmp	w0, 1
	bls	.L458
.L437:
	ldr	w0, [x21, 44]
	cbz	w0, .L459
.L438:
	cmp	w0, 1
	beq	.L439
.L470:
	ldr	w0, [x29, 124]
	ldr	w5, [x19, 864]
	sub	w0, w0, #1
	ldr	x6, [x19, 856]
	uxth	w0, w0
.L440:
	ldr	w4, [x22, 76]
	mov	w2, 0
	cmp	w4, 8
	beq	.L460
.L444:
	ldr	w3, [x22, 68]
	mov	w1, 0
	strh	w0, [x29, 120]
	cmp	w4, 16
	and	w3, w3, 1
	bfi	w1, w4, 2, 4
	mov	w0, w3
	ldr	w4, [x21, 48]
	bfi	w0, w3, 1, 1
	ldr	w3, [x21, 40]
	cset	w7, eq
	bfi	w0, w2, 2, 1
	and	w3, w3, 3
	sub	w4, w4, #4
	bfi	w0, w7, 3, 1
	add	x2, x20, 7
	bfi	w1, w4, 0, 2
	sub	x2, x2, x6
	bfi	w0, w3, 4, 2
	orr	w1, w1, 64
	bfi	w0, w3, 6, 2
	cmp	x2, x5
	strb	w0, [x29, 122]
	strb	w1, [x29, 123]
	bge	.L461
	ldr	w1, [x29, 120]
	mov	w0, 0
	str	w1, [x20, 28]
.L401:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L454:
	mov	w0, w19
	bl	FSP_GetPairDispFs_By_DecAddr
	mov	x24, x0
	cbz	x0, .L462
	ldr	w2, [x21, 8]
	mov	w1, 0
	mov	w0, w19
	bl	FSP_GetLogicFs_By_DecAddr
	cbz	x0, .L463
	ldr	x19, .LC181
	add	x22, x0, 56
	ldr	w28, [x22, 444]
	ldr	w23, [x22, 452]
	ldr	x2, [x19, 856]
	ldr	w1, [x19, 864]
	sub	w23, w23, w28
	sub	x0, x20, x2
	ldr	w25, [x24, 4]
	cmp	x0, x1
	ldr	w27, [x22, 424]
	ldr	w26, [x22, 436]
	ldr	w24, [x22, 432]
	bge	.L464
.L414:
	str	w25, [x20]
	add	x0, x20, 1
	add	w25, w25, w23
	ldr	x2, [x19, 856]
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	bge	.L465
.L416:
	str	w25, [x20, 4]
	add	x0, x20, 2
	ldr	x2, [x19, 856]
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	bge	.L466
.L418:
	str	w28, [x20, 8]
	add	x0, x20, 3
	add	w23, w28, w23
	ldr	x2, [x19, 856]
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	bge	.L467
.L420:
	str	w23, [x20, 12]
	add	x0, x20, 4
	ldr	x2, [x19, 856]
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	bge	.L468
.L422:
	str	w27, [x20, 16]
	add	x0, x20, 5
	ldr	x2, [x19, 856]
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	bge	.L469
.L424:
	str	w26, [x20, 20]
	ldr	w1, [x19, 864]
	ldr	x2, [x19, 856]
	b	.L425
	.p2align 3
.L434:
	str	w0, [x20, 44]
	ldr	w0, [x21, 40]
	ldp	w24, w23, [x21, 16]
	sub	w0, w0, #1
	cmp	w0, 1
	bhi	.L437
.L458:
	ldr	w0, [x21, 44]
	add	w23, w23, w23, lsr 31
	asr	w23, w23, 1
	cbnz	w0, .L438
.L459:
	add	x4, x29, 124
	mov	w3, w23
	mov	w2, w24
	mov	x1, x20
	mov	x0, x21
	bl	VDMHAL_CfgNotFullRepair
	ldr	w0, [x21, 44]
	cmp	w0, 1
	bne	.L470
.L439:
	str	w0, [x21, 32]
	add	x1, x20, 12
	strh	wzr, [x29, 120]
	ldr	x6, [x19, 856]
	ldr	w5, [x19, 864]
	sub	x1, x1, x6
	strh	wzr, [x29, 122]
	cmp	x1, x5
	str	w0, [x29, 124]
	bge	.L471
	ldr	w0, [x29, 120]
	str	w0, [x20, 48]
	ldr	w5, [x19, 864]
	ldr	x6, [x19, 856]
.L442:
	add	x0, x20, 13
	sub	w24, w24, #1
	mov	w2, 0
	sub	w23, w23, #1
	sub	x0, x0, x6
	mov	w1, 0
	bfi	w2, w24, 0, 9
	bfi	w1, w23, 0, 9
	strh	w2, [x29, 120]
	cmp	x0, x5
	strh	w1, [x29, 122]
	blt	.L443
	mov	w1, 1
	str	w1, [x19, 852]
	mov	w0, 0
	mov	w2, 0
	ldr	w4, [x22, 76]
	cmp	w4, 8
	bne	.L444
	.p2align 2
.L460:
	ldr	w1, [x22, 392]
	mov	w2, 1
	cmp	w1, 8
	bhi	.L444
	ldr	w1, [x22, 396]
	cmp	w1, 8
	cset	w2, hi
	b	.L444
	.p2align 3
.L432:
	str	wzr, [x20, 40]
	ldr	w1, [x19, 864]
	ldr	x2, [x19, 856]
	b	.L433
	.p2align 3
.L430:
	str	wzr, [x20, 36]
	ldr	w1, [x19, 864]
	ldr	x2, [x19, 856]
	b	.L431
	.p2align 3
.L428:
	str	wzr, [x20, 32]
	ldr	w1, [x19, 864]
	ldr	x2, [x19, 856]
	b	.L429
	.p2align 3
.L426:
	ldr	w0, [x29, 120]
	str	w0, [x20, 24]
	ldr	w1, [x19, 864]
	ldr	x2, [x19, 856]
	b	.L427
	.p2align 3
.L461:
	mov	w1, 1
	str	w1, [x19, 852]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L471:
	str	w0, [x19, 852]
	b	.L442
	.p2align 3
.L443:
	ldr	w1, [x29, 120]
	mov	w0, 0
	str	w1, [x20, 52]
	ldr	w5, [x19, 864]
	ldr	x6, [x19, 856]
	b	.L440
	.p2align 3
.L457:
	add	x19, x0, 56
	ldr	w4, [x19, 76]
	mov	w5, -32
	mov	w1, -64
	mov	w6, 32
	ldr	w0, [x19, 148]
	sub	w0, w0, #16
	cmp	w0, 2
	mov	w0, 64
	csel	w5, w5, w1, hi
	csel	w6, w6, w0, hi
	cmp	w4, 8
	beq	.L472
	cmp	w4, 10
	beq	.L473
	cmp	w4, 16
	beq	.L474
	ldr	x3, .LC169
	mov	w1, 879
	ldr	x2, .LC180
	mov	w0, 1
	add	x3, x3, 240
	stp	w5, w6, [x29, 104]
	bl	dprint_normal
	ldp	w5, w6, [x29, 104]
	mov	w0, 0
.L411:
	ldr	w1, [x19, 36]
	add	x2, x19, 256
	strb	wzr, [x19, 420]
	sub	w1, w1, #1
	str	wzr, [x19, 68]
	add	w6, w1, w6
	ldr	w1, [x19, 444]
	and	w5, w6, w5
	stp	w0, w0, [x2, 168]
	stp	wzr, wzr, [x2, 176]
	madd	w0, w5, w0, w1
	str	w0, [x19, 452]
	ldrb	w0, [x19, 158]
	orr	w0, w0, 2
	strb	w0, [x19, 158]
	b	.L406
	.p2align 3
.L474:
	ldr	w0, [x19, 32]
	add	w0, w0, 63
	and	w0, w0, -64
	lsl	w0, w0, 1
	b	.L411
	.p2align 3
.L472:
	ldr	w0, [x19, 32]
	add	w0, w0, 63
	and	w0, w0, w1
	b	.L411
	.p2align 3
.L453:
	ldr	x3, .LC169
	mov	w1, 1879
	ldr	x4, .LC171
	mov	w0, 0
	ldr	x2, .LC170
	add	x3, x3, 216
	bl	dprint_normal
	mov	w0, -1
	b	.L401
	.p2align 3
.L473:
	ldr	w0, [x19, 32]
	add	w0, w0, 63
	and	w0, w0, -64
	add	w0, w0, w0, lsl 2
	lsr	w0, w0, 2
	b	.L411
.L462:
	ldr	x3, .LC169
	mov	w1, 1891
	ldr	x2, .LC173
	mov	w0, 0
	ldr	w4, [x21, 12]
	add	x3, x3, 216
	bl	dprint_normal
	mov	w0, -1
	b	.L401
.L455:
	ldr	x3, .LC169
	mov	w1, 1921
	ldr	x2, .LC177
	mov	w0, 0
	ldr	w4, [x21, 12]
	add	x3, x3, 216
	bl	dprint_normal
	mov	w0, -1
	b	.L401
.L452:
	ldr	x3, .LC169
	mov	w1, 1877
	ldr	x4, .LC168
	mov	w0, 0
	ldr	x2, .LC170
	add	x3, x3, 216
	bl	dprint_normal
	mov	w0, -1
	b	.L401
.L463:
	ldr	x3, .LC169
	mov	w1, 1899
	ldr	x2, .LC175
	ldr	w4, [x21, 8]
	add	x3, x3, 216
	bl	dprint_normal
	mov	w0, -1
	b	.L401
.L456:
	ldr	x3, .LC169
	mov	w1, 1929
	ldr	x2, .LC179
	ldr	w4, [x21, 8]
	add	x3, x3, 216
	bl	dprint_normal
	mov	w0, -1
	b	.L401
	.size	VDMHAL_CfgDispRpMsg, .-VDMHAL_CfgDispRpMsg
	.align	3
.LC167:
	.xword	g_VdmDrvParam
	.align	3
.LC168:
	.xword	.LC158
	.align	3
.LC169:
	.xword	.LANCHOR1
	.align	3
.LC170:
	.xword	.LC21
	.align	3
.LC171:
	.xword	.LC162
	.align	3
.LC173:
	.xword	.LC172
	.align	3
.LC175:
	.xword	.LC174
	.align	3
.LC177:
	.xword	.LC176
	.align	3
.LC179:
	.xword	.LC178
	.align	3
.LC180:
	.xword	.LC41
	.align	3
.LC181:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_CfgRpReg
	.type	VDMHAL_CfgRpReg, %function
VDMHAL_CfgRpReg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	ldr	w1, [x20, 40]
	cmp	w19, wzr
	str	w1, [x29, 60]
	ble	.L478
	ldr	x20, .LC183
	mov	w4, w19
	ldr	x21, .LC184
	mov	w5, 1
	add	x20, x20, 272
	mov	w1, 2390
	mov	x2, x21
	mov	x3, x20
	mov	w0, 32
	bl	dprint_normal
	mov	w4, w19
	mov	x3, x20
	mov	x2, x21
	mov	w5, 1
	mov	w1, 2390
	mov	w0, 32
	bl	dprint_normal
	mov	w4, w19
	mov	x3, x20
	mov	x2, x21
	mov	w5, 1
	mov	w1, 2390
	mov	w0, 32
	bl	dprint_normal
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L478:
	lsl	x0, x19, 7
	ldr	x2, .LC182
	sub	x19, x0, x19
	mov	w4, 7
	lsl	x19, x19, 3
	mov	w3, 49667
	movk	w3, 0x2000, lsl 16
	ldr	x0, [x2, x19]
	str	w1, [x0, 16]
	ldr	x0, [x2, x19]
	str	w4, [x0, 36]
	ldr	x0, [x2, x19]
	str	w3, [x0, 12]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	VDMHAL_CfgRpReg, .-VDMHAL_CfgRpReg
	.align	3
.LC182:
	.xword	g_HwMem
	.align	3
.LC183:
	.xword	.LANCHOR1
	.align	3
.LC184:
	.xword	.LC74
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_GetUvMOSParam
	.type	VDMHAL_GetUvMOSParam, %function
VDMHAL_GetUvMOSParam:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, -1
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_GetUvMOSParam, .-VDMHAL_GetUvMOSParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_MakeDecReport
	.type	VDMHAL_MakeDecReport, %function
VDMHAL_MakeDecReport:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L500
	ldr	x22, [x19, 8]
	ldr	w20, [x19]
	ldr	w21, [x19, 16]
	cbz	x22, .L501
	ldr	x3, .LC194
	mov	w1, 0
	mov	x2, 820
	mov	x0, x22
	sxtw	x24, w21
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x23, .LC195
	lsl	x0, x24, 2
	mov	w1, 1024
	sub	x0, x0, x24
	str	w1, [x22, 4]
	lsl	x0, x0, 3
	sub	x0, x0, x24
	add	x0, x23, x0, lsl 3
	ldr	w0, [x0, 4]
	ubfx	x1, x0, 17, 2
	cmp	w1, 1
	beq	.L493
	and	w0, w0, 131072
	cmp	w0, wzr
	ccmp	w20, 3, 0, ne
	cset	w1, ne
.L484:
	lsl	x0, x24, 2
	str	w1, [x22]
	sub	x0, x0, x24
	cmp	w20, wzr
	lsl	x0, x0, 3
	ccmp	w20, 15, 4, ne
	sub	x0, x0, x24
	add	x0, x23, x0, lsl 3
	ldr	w3, [x0, 4]
	and	w3, w3, 131071
	str	w3, [x22, 12]
	beq	.L502
.L485:
	cmp	w3, 200
	bhi	.L503
.L486:
	lsl	x0, x24, 7
	ldr	x1, .LC199
	sub	x0, x0, x24
	add	x0, x1, x0, lsl 3
	ldr	w21, [x0, 24]
	mov	w0, w21
	bl	MEM_Phy2Vir
	cbz	x0, .L504
	lsl	x3, x24, 2
	mov	x1, x0
	sub	x3, x3, x24
	ldr	x19, .LC202
	lsl	x3, x3, 3
	sub	x0, x3, x24
	add	x20, x3, x24
	add	x23, x23, x0, lsl 3
	add	x0, x19, x20, lsl 7
	str	w21, [x23, 180]
	ldr	w2, [x22, 12]
	lsl	w2, w2, 2
	bl	VDMHAL_ReadMsgSlot
	ldr	w0, [x22, 12]
	cbz	w0, .L491
	sub	w2, w0, #1
	mov	x5, 22
	add	x1, x22, 18
	mov	w0, 2
	add	x5, x5, x2, uxtw 2
	lsl	x3, x20, 5
	add	x5, x22, x5
	.p2align 2
.L490:
	sub	w2, w0, #1
	add	x4, x3, x0, uxtw
	add	x2, x3, x2
	add	w0, w0, 4
	ldr	w2, [x19, x2, lsl 2]
	strh	w2, [x1, -2]
	ldr	w2, [x19, x4, lsl 2]
	strh	w2, [x1], 4
	cmp	x1, x5
	bne	.L490
.L491:
	mov	w0, 7
	bl	IsDprintTypeEnable
	cbnz	w0, .L505
.L482:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L502:
	ldr	x1, .LC196
	ldrb	w1, [x1]
	cbnz	w1, .L485
	ldrb	w0, [x0, 19]
	and	w0, w0, 3
	cmp	w0, 2
	bne	.L485
	mov	w0, 1
	strh	wzr, [x22, 16]
	str	w0, [x22, 12]
	mov	w0, 0
	strh	wzr, [x22, 18]
	b	.L482
	.p2align 3
.L505:
	ldr	x2, .LC204
	mov	w1, 2143
	ldr	w3, [x22, 12]
	mov	w0, 7
	mov	w20, 0
	bl	dprint_normal
	ldr	x2, .LC206
	mov	w3, w21
	mov	w1, 2144
	mov	w0, 7
	bl	dprint_normal
	ldr	x23, .LC208
	lsl	x0, x24, 2
	sub	x0, x0, x24
	add	x21, x24, x0, lsl 3
	lsl	x21, x21, 5
	.p2align 2
.L492:
	add	w2, w20, 3
	add	w1, w20, 2
	add	w0, w20, 1
	add	x2, x21, x2
	add	x1, x21, x1
	add	x0, x21, x0
	add	x4, x21, x20, uxtw
	mov	w3, w20
	ldr	w7, [x19, x2, lsl 2]
	mov	x2, x23
	ldr	w6, [x19, x1, lsl 2]
	mov	w1, 2149
	ldr	w5, [x19, x0, lsl 2]
	mov	w0, 7
	ldr	w4, [x19, x4, lsl 2]
	add	w20, w20, 4
	bl	dprint_normal
	ldr	w0, [x22, 12]
	lsl	w0, w0, 2
	sub	w0, w0, #3
	cmp	w0, w20
	bhi	.L492
	ldr	x2, .LC210
	mov	w1, 2152
	mov	w0, 7
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L493:
	mov	w1, 0
	b	.L484
	.p2align 3
.L503:
	ldr	x2, .LC198
	mov	w4, 200
	mov	w1, 2119
	mov	w0, 1
	bl	dprint_normal
	str	wzr, [x22, 12]
	b	.L486
.L504:
	ldr	x3, .LC190
	mov	w1, 2126
	ldr	x4, .LC201
	ldr	x2, .LC191
	add	x3, x3, 288
	bl	dprint_normal
	mov	w0, -1
	b	.L482
.L501:
	ldr	x3, .LC190
	mov	w1, 2088
	ldr	x4, .LC193
	mov	w0, 0
	ldr	x2, .LC191
	add	x3, x3, 288
	bl	dprint_normal
	mov	w0, -1
	b	.L482
.L500:
	ldr	x3, .LC190
	mov	w1, 2081
	ldr	x4, .LC189
	mov	w0, 0
	ldr	x2, .LC191
	add	x3, x3, 288
	bl	dprint_normal
	mov	w0, -1
	b	.L482
	.size	VDMHAL_MakeDecReport, .-VDMHAL_MakeDecReport
	.align	3
.LC189:
	.xword	.LC188
	.align	3
.LC190:
	.xword	.LANCHOR1
	.align	3
.LC191:
	.xword	.LC21
	.align	3
.LC193:
	.xword	.LC192
	.align	3
.LC194:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC195:
	.xword	g_BackUp
	.align	3
.LC196:
	.xword	g_H264FullPictureRepairDisable
	.align	3
.LC198:
	.xword	.LC197
	.align	3
.LC199:
	.xword	g_HwMem
	.align	3
.LC201:
	.xword	.LC200
	.align	3
.LC202:
	.xword	g_UpMsg
	.align	3
.LC204:
	.xword	.LC203
	.align	3
.LC206:
	.xword	.LC205
	.align	3
.LC208:
	.xword	.LC207
	.align	3
.LC210:
	.xword	.LC209
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_PrepareRepair
	.type	VDMHAL_PrepareRepair, %function
VDMHAL_PrepareRepair:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x0, x30
	mov	w22, w3
	mov	w19, w2
	mov	x20, x4
	bl	_mcount
	sxtw	x5, w22
	ldr	x0, .LC211
	lsl	x4, x5, 3
	lsl	x21, x5, 7
	sub	x4, x4, x5
	sub	x1, x21, x5
	lsl	x4, x4, 1
	ldr	x21, .LC212
	sub	x4, x4, x5
	cmp	w22, wzr
	lsl	x4, x4, 4
	add	x21, x21, x1, lsl 3
	sub	x2, x4, x5
	add	x0, x0, x2, lsl 4
	bgt	.L516
	cmp	w19, 3
	bne	.L513
	mov	w2, w22
	mov	x1, x21
	bl	VDMHAL_CfgDecRpMsg
	cbnz	w0, .L517
	mov	x0, x21
	mov	x2, x20
	mov	w1, w22
	bl	VDMHAL_CfgRpReg
	mov	w0, 0
.L508:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L516:
	ldr	x3, .LC213
	mov	w5, 0
	ldr	x2, .LC214
	mov	w4, w22
	add	x3, x3, 312
	mov	w1, 2167
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L508
	.p2align 3
.L513:
	ldr	x3, .LC213
	mov	w4, w19
	ldr	x2, .LC216
	mov	w1, 2178
	add	x3, x3, 312
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L508
	.p2align 3
.L517:
	ldr	x3, .LC213
	mov	w4, w19
	ldr	x2, .LC218
	mov	w1, 2184
	add	x3, x3, 312
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L508
	.size	VDMHAL_PrepareRepair, .-VDMHAL_PrepareRepair
	.align	3
.LC211:
	.xword	g_RepairParam
	.align	3
.LC212:
	.xword	g_HwMem
	.align	3
.LC213:
	.xword	.LANCHOR1
	.align	3
.LC214:
	.xword	.LC61
	.align	3
.LC216:
	.xword	.LC215
	.align	3
.LC218:
	.xword	.LC217
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_StartHwRepair
	.type	VDMHAL_StartHwRepair, %function
VDMHAL_StartHwRepair:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	ble	.L521
	ldr	x20, .LC221
	mov	w4, w19
	ldr	x21, .LC222
	mov	w5, 1
	add	x22, x20, 272
	mov	w1, 2390
	mov	x2, x21
	mov	x3, x22
	mov	w0, 32
	add	x20, x20, 336
	bl	dprint_normal
	mov	w4, w19
	mov	x3, x22
	mov	x2, x21
	mov	w5, 1
	mov	w1, 2390
	mov	w0, 32
	bl	dprint_normal
	ldr	x0, .LC220
	ldr	x0, [x0, 224]
	blr	x0
	mov	w4, w19
	mov	x3, x20
	mov	x2, x21
	mov	w5, 1
	mov	w1, 2237
	mov	w0, 32
	bl	dprint_normal
	mov	w4, w19
	mov	x3, x20
	mov	x2, x21
	mov	w5, 1
	mov	w1, 2238
	mov	w0, 32
	bl	dprint_normal
	mov	w4, w19
	mov	x3, x20
	mov	x2, x21
	mov	w5, 1
	mov	w1, 2239
	mov	w0, 32
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L521:
	lsl	x0, x19, 7
	ldr	x20, .LC219
	sub	x19, x0, x19
	mov	w3, 67108864
	lsl	x19, x19, 3
	ldr	x0, .LC220
	mov	w2, -2
	ldr	x1, [x20, x19]
	str	w3, [x1, 8]
	ldr	x1, [x20, x19]
	str	w2, [x1, 36]
	ldr	x0, [x0, 224]
	blr	x0
	ldr	x0, [x20, x19]
	mov	w1, 1
	str	wzr, [x0]
	ldr	x0, [x20, x19]
	str	w1, [x0]
	ldr	x0, [x20, x19]
	str	wzr, [x0]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VDMHAL_StartHwRepair, .-VDMHAL_StartHwRepair
	.align	3
.LC219:
	.xword	g_HwMem
	.align	3
.LC220:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC221:
	.xword	.LANCHOR1
	.align	3
.LC222:
	.xword	.LC74
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_StartHwDecode
	.type	VDMHAL_StartHwDecode, %function
VDMHAL_StartHwDecode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cmp	w20, wzr
	bgt	.L529
	ldr	x3, .LC229
	sxtw	x19, w20
	ldr	x2, .LC228
	lsl	x0, x19, 3
	ldr	x1, .LC227
	sub	x0, x0, x19
	ldr	x5, [x3]
	ldr	w2, [x2]
	add	x0, x1, x0, lsl 3
	ldr	w3, [x5, 120]
	cmp	w2, 4
	csel	w2, w2, wzr, cc
	ldr	w22, [x0, 8]
	ubfx	x1, x3, 8, 2
	cmp	w2, w1
	beq	.L526
	bfi	w3, w2, 8, 2
	str	w3, [x5, 120]
.L526:
	ldr	w0, [x5, 120]
	mov	x3, x21
	mov	w2, w20
	mov	w1, 2
	and	w0, w0, -258049
	str	w0, [x5, 120]
	mov	w0, 12
	ldr	w4, [x5, 120]
	orr	w4, w4, 131072
	str	w4, [x5, 120]
	bl	SCD_ConfigReg
	ldr	x20, .LC230
	lsl	x0, x19, 7
	mov	w5, -1431655766
	sub	x19, x0, x19
	ldr	x0, .LC231
	lsl	x19, x19, 3
	ldr	x21, .LC232
	mov	w3, -6
	mov	w1, -2
	ldr	x2, [x0, w22, sxtw 3]
	mov	x0, 30
	ldr	x4, [x20, x19]
	add	x2, x2, 217088
	str	w5, [x4, 156]
	ldr	w4, [x2, 3932]
	ldr	x2, [x20, x19]
	cmp	w4, 1
	csel	w1, w1, w3, ne
	str	w1, [x2, 36]
	ldr	x1, [x21, 232]
	blr	x1
	ldr	x0, [x21, 224]
	blr	x0
	ldr	x0, [x20, x19]
	mov	w1, 1
	str	wzr, [x0]
	ldr	x0, [x20, x19]
	str	w1, [x0]
	ldr	x0, [x20, x19]
	str	wzr, [x0]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L529:
	ldr	x3, .LC225
	mov	w4, w20
	ldr	x2, .LC226
	mov	w5, 0
	add	x3, x3, 360
	mov	w1, 2258
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VDMHAL_StartHwDecode, .-VDMHAL_StartHwDecode
	.align	3
.LC225:
	.xword	.LANCHOR1
	.align	3
.LC226:
	.xword	.LC61
	.align	3
.LC227:
	.xword	g_VdmDrvParam
	.align	3
.LC228:
	.xword	g_ClkSelect
	.align	3
.LC229:
	.xword	g_pstRegCrg
	.align	3
.LC230:
	.xword	g_HwMem
	.align	3
.LC231:
	.xword	s_pstVfmwChan
	.align	3
.LC232:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CRG_ConfigReg
	.type	CRG_ConfigReg, %function
CRG_ConfigReg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbnz	w19, .L531
	ldr	x0, .LC233
	ldr	x1, [x0]
	ldr	w0, [x1, 120]
	ubfx	x2, x0, 8, 2
	cmp	w2, w20
	beq	.L530
	bfi	w0, w20, 8, 2
	str	w0, [x1, 120]
.L530:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L531:
	cmp	w19, 1
	bne	.L530
	ldr	x0, .LC233
	ldr	x1, [x0]
	ldr	w0, [x1, 120]
	bfi	w0, w20, 12, 5
	and	w0, w0, -131073
	str	w0, [x1, 120]
	ldr	w0, [x1, 120]
	orr	w0, w0, 131072
	str	w0, [x1, 120]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CRG_ConfigReg, .-CRG_ConfigReg
	.align	3
.LC233:
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
	str	x21, [sp, 32]
	uxtw	x20, w0
	mov	x0, x30
	sxtw	x19, w2
	mov	w21, w1
	bl	_mcount
	cmp	w19, wzr
	ble	.L538
	ldr	x3, .LC235
	mov	w4, w19
	ldr	x2, .LC236
	mov	w5, 1
	add	x3, x3, 272
	mov	w1, 2390
	mov	w0, 32
	bl	dprint_normal
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L538:
	lsl	x4, x19, 7
	ldr	x0, .LC234
	sub	x19, x4, x19
	ldr	x0, [x0, x19, lsl 3]
	str	w21, [x0, x20]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MFDE_ConfigReg, .-MFDE_ConfigReg
	.align	3
.LC234:
	.xword	g_HwMem
	.align	3
.LC235:
	.xword	.LANCHOR1
	.align	3
.LC236:
	.xword	.LC74
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.15152, %object
	.size	__func__.15152, 24
__func__.15152:
	.string	"VDMHAL_CfgNotFullRepair"
	.type	__func__.14794, %object
	.size	__func__.14794, 21
__func__.14794:
	.string	"VDMHAL_GetHalMemSize"
	.zero	3
	.type	__func__.14804, %object
	.size	__func__.14804, 15
__func__.14804:
	.string	"VDMHAL_OpenHAL"
	.zero	1
	.type	__func__.14885, %object
	.size	__func__.14885, 22
__func__.14885:
	.string	"VDMHAL_DeriveDispInfo"
	.zero	2
	.type	__func__.14915, %object
	.size	__func__.14915, 21
__func__.14915:
	.string	"VDMHAL_DeriveMemSize"
	.zero	3
	.type	__func__.14837, %object
	.size	__func__.14837, 22
__func__.14837:
	.string	"VDMHAL_DeriveBitDepth"
	.zero	2
	.type	__func__.14921, %object
	.size	__func__.14921, 29
__func__.14921:
	.string	"VDMHAL_InquireSelfDecMemNeed"
	.zero	3
	.type	__func__.14939, %object
	.size	__func__.14939, 22
__func__.14939:
	.string	"VDMHAL_InquireMemNeed"
	.zero	2
	.type	__func__.14955, %object
	.size	__func__.14955, 16
__func__.14955:
	.string	"VDMHAL_ResetVdm"
	.type	__func__.14965, %object
	.size	__func__.14965, 28
__func__.14965:
	.string	"VDMHAL_SetSmmuPageTableAddr"
	.zero	4
	.type	__func__.14975, %object
	.size	__func__.14975, 16
__func__.14975:
	.string	"VDMHAL_GlbReset"
	.type	__func__.14985, %object
	.size	__func__.14985, 17
__func__.14985:
	.string	"VDMHAL_GlbResetX"
	.zero	7
	.type	__func__.14993, %object
	.size	__func__.14993, 21
__func__.14993:
	.string	"VDMHAL_ClearIntState"
	.zero	3
	.type	__func__.14999, %object
	.size	__func__.14999, 24
__func__.14999:
	.string	"VDMHAL_ClearMMUIntState"
	.type	__func__.15005, %object
	.size	__func__.15005, 15
__func__.15005:
	.string	"VDMHAL_MaskInt"
	.zero	1
	.type	__func__.15015, %object
	.size	__func__.15015, 17
__func__.15015:
	.string	"VDMHAL_EnableInt"
	.zero	7
	.type	__func__.15022, %object
	.size	__func__.15022, 16
__func__.15022:
	.string	"VDMHAL_CheckReg"
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.15036, %object
	.size	__func__.15036, 19
__func__.15036:
	.string	"VDMHAL_ReadMMUMask"
	.zero	5
	.type	__func__.15041, %object
	.size	__func__.15041, 20
__func__.15041:
	.string	"VDMHAL_WriteMMUMask"
	.zero	4
	.type	__func__.15072, %object
	.size	__func__.15072, 18
__func__.15072:
	.string	"VDMHAL_PrepareDec"
	.zero	6
	.type	__func__.15077, %object
	.size	__func__.15077, 18
__func__.15077:
	.string	"VDMHAL_IsVdmReady"
	.zero	6
	.type	__func__.15082, %object
	.size	__func__.15082, 16
__func__.15082:
	.string	"VDMHAL_IsVdmRun"
	.type	__func__.15092, %object
	.size	__func__.15092, 20
__func__.15092:
	.string	"VDMHAL_IsVdhDecOver"
	.zero	4
	.type	__func__.15101, %object
	.size	__func__.15101, 24
__func__.15101:
	.string	"VDMHAL_IsVdhPartDecOver"
	.type	__func__.15110, %object
	.size	__func__.15110, 26
__func__.15110:
	.string	"VDMHAL_UpdateHardwareInfo"
	.zero	6
	.type	__func__.15187, %object
	.size	__func__.15187, 19
__func__.15187:
	.string	"VDMHAL_CfgDecRpMsg"
	.zero	5
	.type	__func__.15208, %object
	.size	__func__.15208, 20
__func__.15208:
	.string	"VDMHAL_CfgDispRpMsg"
	.zero	4
	.type	__func__.14947, %object
	.size	__func__.14947, 28
__func__.14947:
	.string	"VDMHAL_AmendImageLinearInfo"
	.zero	4
	.type	__func__.15283, %object
	.size	__func__.15283, 15
__func__.15283:
	.string	"MFDE_ConfigReg"
	.zero	1
	.type	__func__.15233, %object
	.size	__func__.15233, 21
__func__.15233:
	.string	"VDMHAL_MakeDecReport"
	.zero	3
	.type	__func__.15251, %object
	.size	__func__.15251, 21
__func__.15251:
	.string	"VDMHAL_PrepareRepair"
	.zero	3
	.type	__func__.15260, %object
	.size	__func__.15260, 21
__func__.15260:
	.string	"VDMHAL_StartHwRepair"
	.zero	3
	.type	__func__.15270, %object
	.size	__func__.15270, 21
__func__.15270:
	.string	"VDMHAL_StartHwDecode"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	ASCII(.string	"align_mb error\n" )
.LC3:
	ASCII(.string	"[%s][%d]sclie_num is wrong! %d \n" )
	.zero	7
.LC14:
	ASCII(.string	"%s VdhId %d invalid!\n" )
	.zero	2
.LC18:
	ASCII(.string	"pOpenParam = NULL error!" )
	.zero	7
.LC21:
	ASCII(.string	"%s: %s\n" )
.LC23:
	ASCII(.string	"MemBaseAddr = 0 error!" )
	.zero	1
.LC25:
	ASCII(.string	"VdhId invalid!" )
	.zero	1
.LC27:
	ASCII(.string	"Size invalid!" )
	.zero	2
.LC30:
	ASCII(.string	"!!!!!! HAL memory not enouph! need %d, have %d\n" )
.LC34:
	ASCII(.string	"VDMHAL_NULL_FUN_PRINT,L%d\n" )
	.zero	5
.LC39:
	ASCII(.string	"%s derive bit depth failed.\n" )
	.zero	3
.LC41:
	ASCII(.string	"%s linear not support bit depth %d.\n" )
	.zero	3
.LC43:
	ASCII(.string	"%s AFBC not support bit depth %d.\n" )
	.zero	5
.LC46:
	ASCII(.string	"%s derive disp info failed.\n" )
	.zero	3
.LC49:
	ASCII(.string	"Compress Strategy invalid\n" )
	.zero	5
.LC51:
	ASCII(.string	"CompressStrategy: %d, DecCompressFlag: %d, VidStd: %d, Width: %d, Height: %d\n" )
	.zero	2
.LC54:
	ASCII(.string	"%s 16bit expand only support linear!\n" )
	.zero	2
.LC56:
	ASCII(.string	"%s derive mem size failed.\n" )
	.zero	4
.LC58:
	ASCII(.string	"%s unsupport eMemType %d\n" )
	.zero	6
.LC61:
	ASCII(.string	"%s: VdhId(%d) > %d\n" )
	.zero	4
.LC63:
	ASCII(.string	"VDMDRV_ResetVdm: map vdm register fail, vir(reg) = (%p)\n" )
	.zero	7
.LC67:
	ASCII(.string	"%s module id %d failed!\n" )
	.zero	7
.LC69:
	ASCII(.string	"%s module id %d success!\n" )
	.zero	6
.LC74:
	ASCII(.string	"%s: WR_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\n" )
	.zero	3
.LC79:
	ASCII(.string	"%s: map vdm register 0x%x failed!\n" )
	.zero	5
.LC86:
	ASCII(.string	"%s: RD_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\n" )
	.zero	3
.LC89:
	ASCII(.string	"%s VdhId %d failed!\n" )
	.zero	3
.LC91:
	ASCII(.string	"%s VdhId %d success!\n" )
	.zero	2
.LC101:
	ASCII(.string	"vdm register virtual address not mapped, reset failed!\n" )
.LC111:
	ASCII(.string	"%s: VdhId(%d) Invalid!\n" )
.LC114:
	ASCII(.string	"%s: unkown reg_id = %d\n" )
.LC125:
	ASCII(.string	"pDecParam is null\n" )
	.zero	5
.LC128:
	ASCII(.string	"HAL_V5R6C1_CfgVdmReg failed\n" )
	.zero	3
.LC131:
	ASCII(.string	"VDMHAL_StartDec failed\n" )
.LC134:
	ASCII(.string	"%s: after StartDec, VidStd(%d), VdhId(%d) down message polluted!!!\n" )
	.zero	4
.LC153:
	ASCII(.string	"ReadUpMsgSlot error! pDst=%p, pSrc=%p\n" )
	.zero	1
.LC155:
	ASCII(.string	"ReadUpMsgSlot error! upmsg_size(%d) > UP_MSG_SIZE(%d)\n" )
	.zero	1
.LC158:
	ASCII(.string	"Can not map repair msg virtual address!" )
.LC162:
	ASCII(.string	"ValidGroupNum out of range!" )
	.zero	4
.LC172:
	ASCII(.string	"%s: find src disp fs by dec addr 0x%x failed.\n" )
	.zero	1
.LC174:
	ASCII(.string	"%s: find dst logic fs by dec addr 0x%x failed.\n" )
.LC176:
	ASCII(.string	"%s: find src logic fs by disp addr 0x%x failed.\n" )
	.zero	7
.LC178:
	ASCII(.string	"%s: find dst logic fs by disp addr 0x%x failed.\n" )
	.zero	7
.LC188:
	ASCII(.string	"pMakeDecReport is NULL" )
	.zero	1
.LC192:
	ASCII(.string	"pDecReport is NULL" )
	.zero	5
.LC197:
	ASCII(.string	"pDecReport->DecSliceNum(%d) > %d, set to 0 for full repair.\n" )
	.zero	3
.LC200:
	ASCII(.string	"can NOT map vir addr for up-msg" )
.LC203:
	ASCII(.string	"\n***** UpMsg DecSliceNum=%d\n" )
	.zero	3
.LC205:
	ASCII(.string	"\n***** Up Msg (phy addr: %#8x) *****\n" )
	.zero	2
.LC207:
	ASCII(.string	"\n0x%02x 0x%08x 0x%08x 0x%08x 0x%08x\n" )
	.zero	3
.LC209:
	ASCII(.string	"\n***** Up Msg print finished *****\n" )
	.zero	4
.LC215:
	ASCII(.string	"%s: unkown RepairState %d\n" )
	.zero	5
.LC217:
	ASCII(.string	"%s: RepairState %d config message failed!\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
