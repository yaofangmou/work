#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal_h264.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	H264HAL_FillMixRam
	.type	H264HAL_FillMixRam, %function
H264HAL_FillMixRam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	w0, w19, 1023
	and	w0, w0, -1024
	sub	w0, w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H264HAL_FillMixRam, .-H264HAL_FillMixRam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_WriteCabacTab
	.type	H264HAL_WriteCabacTab, %function
H264HAL_WriteCabacTab:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, w19
	bl	MEM_Phy2Vir
	cbz	x0, .L6
	ldr	x3, .LC2
	mov	x2, 5120
	ldr	x1, .LC3
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L4:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L6:
	mov	w3, 41
	ldr	x2, .LC1
	mov	w1, w3
	mov	w0, 20
	bl	dprint_normal
	mov	w0, -1
	b	.L4
	.size	H264HAL_WriteCabacTab, .-H264HAL_WriteCabacTab
	.align	3
.LC1:
	.xword	.LC0
	.align	3
.LC2:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC3:
	.xword	g_CabacMN
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_InitHal
	.type	H264HAL_InitHal, %function
H264HAL_InitHal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 868]
	bl	H264HAL_WriteCabacTab
	cbnz	w0, .L12
.L8:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L12:
	ldr	x2, .LC5
	mov	w1, 54
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L8
	.size	H264HAL_InitHal, .-H264HAL_InitHal
	.align	3
.LC5:
	.xword	.LC4
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_GetVirAddr
	.type	H264HAL_GetVirAddr, %function
H264HAL_GetVirAddr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	add	x0, x19, x20, uxtw 2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H264HAL_GetVirAddr, .-H264HAL_GetVirAddr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_GetPhyAddr
	.type	H264HAL_GetPhyAddr, %function
H264HAL_GetPhyAddr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	w0, w19, w20, lsl 2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H264HAL_GetPhyAddr, .-H264HAL_GetPhyAddr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_CutSliceChain
	.type	H264HAL_CutSliceChain, %function
H264HAL_CutSliceChain:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, w19
	bl	MEM_Phy2Vir
	cbz	x0, .L18
	str	wzr, [x0, 252]
	mov	w0, 0
.L17:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L18:
	ldr	x4, .LC7
	mov	w1, 79
	ldr	x3, .LC8
	ldr	x2, .LC10
	bl	dprint_normal
	mov	w0, -1
	b	.L17
	.size	H264HAL_CutSliceChain, .-H264HAL_CutSliceChain
	.align	3
.LC7:
	.xword	.LC6
	.align	3
.LC8:
	.xword	.LANCHOR0
	.align	3
.LC10:
	.xword	.LC9
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_Write_Qmatrix
	.type	H264HAL_Write_Qmatrix, %function
H264HAL_Write_Qmatrix:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x21, x0
	mov	w23, w1
	mov	x0, x30
	mov	w20, w2
	mov	x22, x3
	bl	_mcount
	cbz	w23, .L19
	sub	w23, w23, #1
	ldr	x25, .LC14
	ldr	x24, .LC16
	add	x23, x23, 1
	mov	x19, 0
	.p2align 2
.L21:
	ldr	w0, [x21, x19, lsl 2]
	mov	w3, w19
	str	w0, [x22, x19, lsl 2]
	mov	x2, x25
	mov	w1, 97
	mov	w0, 5
	ldr	w4, [x21, x19, lsl 2]
	bl	dprint_normal
	ldr	w4, [x22, x19, lsl 2]
	mov	w3, w20
	mov	x2, x24
	mov	w1, 98
	mov	w0, 5
	add	x19, x19, 1
	add	w20, w20, 4
	bl	dprint_normal
	cmp	x19, x23
	bne	.L21
.L19:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	H264HAL_Write_Qmatrix, .-H264HAL_Write_Qmatrix
	.align	3
.LC14:
	.xword	.LC13
	.align	3
.LC16:
	.xword	.LC15
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_SetSliceMsgStreamAddrInfo
	.type	H264HAL_SetSliceMsgStreamAddrInfo, %function
H264HAL_SetSliceMsgStreamAddrInfo:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	str	x0, [x29, 120]
	mov	x0, x30
	mov	w20, w3
	mov	x19, x2
	add	x22, x1, 8
	add	x24, x2, 8
	mov	x21, x2
	bl	_mcount
	ldr	x28, .LC19
	mov	x23, 0
	ldr	x25, .LC21
.L39:
	ldr	w0, [x22]
	cbnz	w0, .L41
	ldr	x0, [x28, 856]
	mov	w26, w23
	ldr	w1, [x28, 864]
	sub	x0, x21, x0
	cmp	x0, x1
	blt	.L33
	mov	w0, 1
	str	w0, [x28, 852]
.L34:
	ldr	w5, [x19]
	mov	x2, x25
	mov	w1, 136
	mov	w4, w20
	mov	w3, w26
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x28, 856]
	add	x0, x21, 1
	ldr	w1, [x28, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L35
	mov	w0, 1
	str	w0, [x28, 852]
	add	x0, x19, 4
.L36:
	ldr	w5, [x0]
	mov	x2, x25
	mov	w1, 140
	add	w4, w20, 4
	add	w3, w26, 1
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x28, 856]
	add	x0, x21, 2
	ldr	w1, [x28, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L37
	mov	w0, 1
	str	w0, [x28, 852]
.L38:
	ldr	w5, [x24]
	add	w4, w20, 8
	add	w3, w26, 2
	mov	x2, x25
	mov	w1, 144
	mov	w0, 5
	bl	dprint_normal
.L32:
	add	x23, x23, 3
	add	x22, x22, 4
	cmp	x23, 6
	add	x19, x19, 12
	add	w20, w20, 12
	add	x24, x24, 12
	add	x21, x21, 3
	bne	.L39
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L37:
	str	wzr, [x24]
	b	.L38
	.p2align 3
.L35:
	add	x0, x19, 4
	str	wzr, [x19, 4]
	b	.L36
	.p2align 3
.L33:
	str	wzr, [x19]
	b	.L34
	.p2align 3
.L41:
	ldr	w26, [x22, 16]
	add	w9, w23, 1
	ldr	w0, [x22, 8]
	mov	w3, w9
	ldr	x7, [x29, 120]
	mov	w1, 120
	mov	w5, w0
	add	w0, w0, w26, lsl 3
	and	w8, w0, 127
	ldr	x2, .LC18
	ldr	w7, [x7, 592]
	mov	w4, w8
	mov	w6, w26
	mov	w0, 5
	stp	w7, w9, [x29, 108]
	str	w8, [x29, 116]
	bl	dprint_normal
	ldr	x1, [x28, 856]
	add	x0, x21, 1
	mov	w27, w23
	sub	x0, x0, x1
	ldr	w1, [x28, 864]
	ldp	w9, w8, [x29, 112]
	cmp	x0, x1
	bge	.L42
	add	x0, x19, 4
	str	w8, [x19, 4]
.L27:
	ldr	w5, [x0]
	mov	w1, 122
	mov	w3, w9
	add	w4, w20, 4
	mov	x2, x25
	mov	w0, 5
	bl	dprint_normal
	ldr	x1, [x28, 856]
	add	x0, x21, 2
	sub	x0, x0, x1
	ldr	w1, [x28, 864]
	cmp	x0, x1
	blt	.L28
	mov	w0, 1
	str	w0, [x28, 852]
.L29:
	ldr	w5, [x24]
	mov	w1, 126
	add	w4, w20, 8
	add	w3, w27, 2
	mov	x2, x25
	mov	w0, 5
	bl	dprint_normal
	ldr	x0, [x28, 856]
	ldr	w1, [x28, 864]
	sub	x0, x21, x0
	cmp	x0, x1
	blt	.L30
	mov	w0, 1
	str	w0, [x28, 852]
.L31:
	ldr	w5, [x19]
	mov	w3, w27
	mov	w4, w20
	mov	x2, x25
	mov	w1, 130
	mov	w0, 5
	bl	dprint_normal
	b	.L32
	.p2align 3
.L42:
	mov	w0, 1
	str	w0, [x28, 852]
	add	x0, x19, 4
	b	.L27
	.p2align 3
.L30:
	ldr	w0, [x29, 108]
	and	w26, w26, -16
	and	w0, w0, -16
	sub	w26, w26, w0
	str	w26, [x19]
	b	.L31
	.p2align 3
.L28:
	ldr	w0, [x22]
	str	w0, [x24]
	b	.L29
	.size	H264HAL_SetSliceMsgStreamAddrInfo, .-H264HAL_SetSliceMsgStreamAddrInfo
	.align	3
.LC18:
	.xword	.LC17
	.align	3
.LC19:
	.xword	g_HwMem
	.align	3
.LC21:
	.xword	.LC20
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_SetSliceMsgMvAddrInfo
	.type	H264HAL_SetSliceMsgMvAddrInfo, %function
H264HAL_SetSliceMsgMvAddrInfo:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	mov	x21, x1
	mov	x19, x2
	mov	w20, w3
	bl	_mcount
	ldr	x0, .LC23
	ldrb	w1, [x21]
	add	x0, x0, 24
	ldr	w0, [x0, w1, sxtw 2]
	cmp	w0, 2
	beq	.L56
	mov	w4, 0
	mov	w5, 0
.L44:
	ldr	x1, .LC26
	add	x0, x19, 8
	ldr	x3, [x1, 856]
	ldr	w2, [x1, 864]
	sub	x0, x0, x3
	cmp	x0, x2
	blt	.L49
	mov	w0, 1
	str	w0, [x1, 852]
	add	x0, x19, 9
	sub	x0, x0, x3
	cmp	x0, x2
	bge	.L57
.L51:
	str	w4, [x19, 36]
.L52:
	ldr	w4, [x19, 32]
	add	w3, w20, 32
	ldr	x2, .LC28
	mov	w1, 207
	mov	w0, 5
	bl	dprint_normal
	ldr	w4, [x19, 36]
	add	w3, w20, 36
	ldr	x2, .LC30
	mov	w1, 208
	mov	w0, 5
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L49:
	str	w5, [x19, 32]
	add	x0, x19, 9
	ldr	x3, [x1, 856]
	ldr	w2, [x1, 864]
	sub	x0, x0, x3
	cmp	x0, x2
	blt	.L51
.L57:
	mov	w0, 1
	str	w0, [x1, 852]
	b	.L52
	.p2align 3
.L56:
	ldr	x2, .LC25
	mov	w1, 157
	ldr	w3, [x21, 2788]
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x22]
	cbnz	w0, .L45
	ldrb	w0, [x21, 2778]
	cmp	w0, 3
	ldr	w0, [x21, 2788]
	beq	.L58
.L55:
	add	x22, x22, x0, lsl 2
	mov	w4, 0
	ldr	w5, [x22, 440]
	b	.L44
	.p2align 3
.L45:
	ldr	w0, [x21, 2776]
	and	w0, w0, 16776960
	cmp	w0, 768
	beq	.L54
	ldrb	w0, [x21, 2776]
	cmp	w0, 1
	beq	.L54
	ldr	w1, [x21, 2788]
	mov	w4, 0
	ldr	w0, [x22, 572]
	add	x22, x22, x1, lsl 2
	ldr	w5, [x22, 440]
	add	w5, w5, w0
	b	.L44
	.p2align 3
.L54:
	ldr	w0, [x21, 2788]
	b	.L55
	.p2align 3
.L58:
	ldr	w4, [x22, 572]
	add	x22, x22, x0, lsl 2
	ldr	w5, [x22, 440]
	add	w4, w5, w4
	b	.L44
	.size	H264HAL_SetSliceMsgMvAddrInfo, .-H264HAL_SetSliceMsgMvAddrInfo
	.align	3
.LC23:
	.xword	.LANCHOR0
	.align	3
.LC25:
	.xword	.LC24
	.align	3
.LC26:
	.xword	g_HwMem
	.align	3
.LC28:
	.xword	.LC27
	.align	3
.LC30:
	.xword	.LC29
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_SetSliceMsgEndMbInSlice
	.type	H264HAL_SetSliceMsgEndMbInSlice, %function
H264HAL_SetSliceMsgEndMbInSlice:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x1
	mov	x22, x0
	mov	x0, x30
	mov	x20, x2
	mov	w19, w3
	bl	_mcount
	ldr	x0, [x21, 4056]
	cbz	x0, .L68
.L61:
	ldr	x1, .LC32
	add	x0, x20, 44
	ldr	x3, [x1, 856]
	ldr	w2, [x1, 864]
	sub	x0, x0, x3
	cmp	x0, x2
	bge	.L69
	str	w19, [x20, 176]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L69:
	mov	w2, 1
	str	w2, [x1, 852]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L68:
	ldr	w3, [x22, 596]
	ldrb	w0, [x21, 1]
	cmp	w3, 1048576
	ble	.L63
	add	w19, w0, 1
	mov	w1, 1048575
	sdiv	w19, w1, w19
	b	.L61
	.p2align 3
.L63:
	sub	w3, w3, #1
	add	w19, w0, 1
	sdiv	w19, w3, w19
	b	.L61
	.size	H264HAL_SetSliceMsgEndMbInSlice, .-H264HAL_SetSliceMsgEndMbInSlice
	.align	3
.LC32:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_SetSliceMsgRefPicFrame
	.type	H264HAL_SetSliceMsgRefPicFrame, %function
H264HAL_SetSliceMsgRefPicFrame:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	mov	w22, w4
	mov	x20, x1
	str	w3, [x29, 100]
	str	x2, [x29, 104]
	bl	_mcount
	uxtw	x0, w22
	add	w9, w22, 3
	lsl	w8, w22, 3
	lsl	w23, w9, 2
	add	x22, x20, x0, lsl 2
	add	w27, w8, 20
	ldr	w1, [x22, 52]
	cbz	w1, .L70
	lsl	x19, x0, 10
	mov	w28, 0
	mov	w26, 0
	ldr	x24, .LC34
	add	x19, x19, x0, lsl 7
	mov	w25, 0
	b	.L80
	.p2align 3
.L74:
	cmp	w12, 3
	beq	.L91
.L77:
	ldr	w0, [x22, 52]
	add	w28, w28, 1
	cmp	w0, w28
	bls	.L92
.L80:
	uxtw	x0, w28
	ldr	x2, .LC33
	lsl	x1, x0, 5
	ldr	w15, [x21, 24]
	add	x0, x1, x0, lsl 2
	add	x5, x2, 40
	add	x0, x0, x19
	mov	w1, 8
	add	x0, x20, x0
	and	w12, w28, 3
	and	w13, w28, 7
	lsl	w4, w13, 2
	add	w14, w12, w12, lsl 2
	ldrb	w3, [x0, 1626]
	ldrb	w16, [x0, 1627]
	ldr	w2, [x0, 1644]
	add	x3, x15, x3, lsl 1
	cmp	w16, 1
	csel	w1, wzr, w1, ne
	ubfiz	w2, w2, 1, 4
	cmp	w13, 7
	lsl	w2, w2, w14
	ldr	w0, [x5, x3, lsl 2]
	orr	w26, w26, w2
	and	w0, w0, 3
	orr	w0, w0, w1
	lsl	w0, w0, w4
	orr	w25, w25, w0
	bne	.L74
	ldr	x0, [x29, 104]
	uxtw	x2, w23
	ldr	x3, [x24, 856]
	lsl	x1, x2, 2
	add	x4, x0, x2
	ldr	w0, [x24, 864]
	sub	x3, x4, x3
	cmp	x3, x0
	sub	x0, x1, x2
	blt	.L75
	mov	w1, 1
	add	x0, x4, x0
	str	w1, [x24, 852]
.L76:
	ldr	w5, [x0]
	mov	w3, w23
	ldr	w0, [x29, 100]
	mov	w1, 251
	ldr	x2, .LC36
	mov	w25, 0
	add	w4, w0, w23, lsl 2
	mov	w0, 5
	str	w12, [x29, 96]
	add	w23, w23, 1
	bl	dprint_normal
	ldr	w12, [x29, 96]
	cmp	w12, 3
	bne	.L77
.L91:
	ldr	x0, .LC34
	uxtw	x2, w27
	lsl	x1, x2, 2
	ldr	x3, [x0, 856]
	ldr	x0, [x29, 104]
	add	x4, x0, x2
	ldr	x0, .LC34
	sub	x3, x4, x3
	ldr	w0, [x0, 864]
	cmp	x3, x0
	sub	x0, x1, x2
	blt	.L78
	ldr	x2, .LC34
	mov	w1, 1
	add	x0, x4, x0
	str	w1, [x2, 852]
.L79:
	ldr	w5, [x0]
	mov	w3, w27
	ldr	w0, [x29, 100]
	mov	w1, 259
	ldr	x2, .LC36
	add	w28, w28, 1
	add	w4, w0, w27, lsl 2
	mov	w0, 5
	mov	w26, 0
	add	w27, w27, 1
	bl	dprint_normal
	ldr	w0, [x22, 52]
	cmp	w0, w28
	bhi	.L80
.L92:
	and	w0, w0, 7
	cbz	w0, .L70
	ldr	x19, .LC34
	uxtw	x2, w23
	ldr	x0, [x29, 104]
	lsl	x1, x2, 2
	add	x3, x0, x2
	sub	x0, x1, x2
	ldr	x1, [x19, 856]
	ldr	w2, [x19, 864]
	sub	x1, x3, x1
	cmp	x1, x2
	bge	.L93
	str	w25, [x3, x0]
	add	x0, x3, x0
.L83:
	ldr	x20, .LC36
	mov	w3, w23
	ldr	w5, [x0]
	mov	w1, 268
	ldr	w0, [x29, 100]
	mov	x2, x20
	add	w4, w0, w23, lsl 2
	mov	w0, 5
	bl	dprint_normal
	ldr	x0, [x29, 104]
	uxtw	x2, w27
	ldr	x1, [x19, 856]
	add	x23, x0, x2
	ldr	w3, [x19, 864]
	sub	x1, x23, x1
	lsl	x0, x2, 2
	cmp	x1, x3
	sub	x0, x0, x2
	blt	.L84
	mov	w1, 1
	add	x23, x23, x0
	str	w1, [x19, 852]
.L85:
	ldr	w0, [x29, 100]
	mov	w3, w27
	ldr	w5, [x23]
	mov	x2, x20
	add	w4, w0, w27, lsl 2
	mov	w1, 270
	mov	w0, 5
	bl	dprint_normal
.L70:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L75:
	str	w25, [x4, x0]
	add	x0, x4, x0
	b	.L76
	.p2align 3
.L78:
	str	w26, [x4, x0]
	add	x0, x4, x0
	b	.L79
	.p2align 3
.L93:
	mov	w1, 1
	add	x0, x3, x0
	str	w1, [x19, 852]
	b	.L83
	.p2align 3
.L84:
	str	w26, [x23, x0]
	add	x23, x23, x0
	b	.L85
	.size	H264HAL_SetSliceMsgRefPicFrame, .-H264HAL_SetSliceMsgRefPicFrame
	.align	3
.LC33:
	.xword	.LANCHOR0
	.align	3
.LC34:
	.xword	g_HwMem
	.align	3
.LC36:
	.xword	.LC35
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_SetSliceMsgRefPicField
	.type	H264HAL_SetSliceMsgRefPicField, %function
H264HAL_SetSliceMsgRefPicField:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	uxtw	x21, w4
	str	x0, [x29, 104]
	mov	x0, x30
	mov	x19, x1
	add	x22, x1, x21, lsl 2
	str	w3, [x29, 116]
	str	x2, [x29, 120]
	bl	_mcount
	add	w9, w21, 3
	lsl	w8, w21, 3
	ldr	w0, [x22, 52]
	lsl	w26, w9, 2
	add	w28, w8, 20
	cbz	w0, .L94
	ldr	x24, .LC42
	mov	w23, 0
	mov	w27, 0
	mov	w25, 0
	mov	x20, x24
	b	.L118
	.p2align 3
.L97:
	cmp	w1, 2
	beq	.L105
	and	w15, w23, 3
	and	w1, w23, 7
.L104:
	cmp	w1, 7
	beq	.L138
.L112:
	cmp	w15, 3
	beq	.L139
.L115:
	ldr	w0, [x22, 52]
	add	w23, w23, 1
	cmp	w0, w23
	bls	.L140
.L118:
	uxtw	x2, w23
	lsl	x0, x21, 10
	lsl	x3, x2, 5
	add	x1, x0, x21, lsl 7
	add	x0, x3, x2, lsl 2
	add	x0, x0, x1
	add	x0, x19, x0
	ldrb	w1, [x0, 1624]
	cmp	w1, 1
	bne	.L97
	ldrb	w1, [x0, 1625]
	cmp	w1, 3
	beq	.L98
	ldrb	w1, [x0, 1628]
	ldrb	w0, [x0, 1629]
	sbfiz	x3, x1, 1, 32
	cmp	w0, 1
	ldr	x0, [x29, 104]
	ldr	w0, [x0, 24]
	add	x0, x3, x0
	ldr	x3, .LC41
	add	x3, x3, 72
	ldr	w0, [x3, x0, lsl 2]
	and	w3, w0, 3
	mov	w0, 8
	csel	w0, wzr, w0, ne
	cmp	w1, 1
.L136:
	mov	w1, 4
	and	w15, w23, 3
	csel	w1, wzr, w1, ne
	orr	w0, w0, w1
	and	w1, w23, 7
	orr	w0, w3, w0
	lsl	w3, w1, 2
	lsl	w0, w0, w3
	lsl	x3, x2, 5
	orr	w25, w25, w0
	lsl	x0, x21, 10
	add	x2, x3, x2, lsl 2
	add	x0, x0, x21, lsl 7
	add	x2, x2, x0
	add	w3, w15, w15, lsl 2
	add	x2, x19, x2
	cmp	w1, 7
	ldr	w0, [x2, 1644]
	ubfiz	w0, w0, 1, 4
	lsl	w0, w0, w3
	orr	w27, w27, w0
	bne	.L112
.L138:
	uxtw	x2, w26
	ldr	x0, [x29, 120]
	lsl	x1, x2, 2
	add	x3, x0, x2
	sub	x0, x1, x2
	ldr	x1, [x24, 856]
	ldr	w2, [x24, 864]
	sub	x1, x3, x1
	cmp	x1, x2
	blt	.L113
	mov	w1, 1
	add	x0, x3, x0
	str	w1, [x24, 852]
.L114:
	ldr	w5, [x0]
	mov	w3, w26
	ldr	w0, [x29, 116]
	mov	w1, 324
	ldr	x2, .LC43
	mov	w25, 0
	add	w4, w0, w26, lsl 2
	mov	w0, 5
	str	w15, [x29, 112]
	add	w26, w26, 1
	bl	dprint_normal
	ldr	w15, [x29, 112]
	cmp	w15, 3
	bne	.L115
.L139:
	uxtw	x3, w28
	ldr	x0, [x29, 120]
	lsl	x1, x3, 2
	ldr	x2, [x20, 856]
	add	x4, x0, x3
	sub	x0, x1, x3
	ldr	w1, [x20, 864]
	sub	x2, x4, x2
	cmp	x2, x1
	blt	.L116
	mov	w1, 1
	add	x0, x4, x0
	str	w1, [x20, 852]
.L117:
	ldr	w5, [x0]
	mov	w3, w28
	ldr	w0, [x29, 116]
	mov	w1, 332
	ldr	x2, .LC43
	add	w23, w23, 1
	add	w4, w0, w28, lsl 2
	mov	w0, 5
	mov	w27, 0
	add	w28, w28, 1
	bl	dprint_normal
	ldr	w0, [x22, 52]
	cmp	w0, w23
	bhi	.L118
.L140:
	and	w0, w0, 7
	cbz	w0, .L94
	ldr	x20, .LC42
	uxtw	x2, w26
	ldr	x0, [x29, 120]
	lsl	x1, x2, 2
	add	x3, x0, x2
	sub	x0, x1, x2
	ldr	x1, [x20, 856]
	ldr	w2, [x20, 864]
	sub	x1, x3, x1
	cmp	x1, x2
	bge	.L141
	str	w25, [x3, x0]
	add	x0, x3, x0
.L121:
	ldr	x22, .LC43
	mov	w3, w26
	ldr	w5, [x0]
	mov	w1, 341
	ldr	w0, [x29, 116]
	mov	x2, x22
	add	w4, w0, w26, lsl 2
	mov	w0, 5
	bl	dprint_normal
	ldr	x0, [x29, 120]
	uxtw	x2, w28
	ldr	x1, [x20, 856]
	add	x19, x0, x2
	ldr	w3, [x20, 864]
	sub	x1, x19, x1
	lsl	x0, x2, 2
	cmp	x1, x3
	sub	x0, x0, x2
	blt	.L122
	mov	w1, 1
	add	x19, x19, x0
	str	w1, [x20, 852]
.L123:
	ldr	w0, [x29, 116]
	mov	w3, w28
	ldr	w5, [x19]
	mov	x2, x22
	add	w4, w0, w28, lsl 2
	mov	w1, 343
	mov	w0, 5
	bl	dprint_normal
.L94:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L105:
	ldrb	w1, [x0, 1625]
	cmp	w1, 3
	beq	.L106
	ldrb	w1, [x0, 1630]
	ldrb	w0, [x0, 1631]
	sbfiz	x3, x1, 1, 32
	cmp	w0, 1
	ldr	x0, [x29, 104]
	ldr	w0, [x0, 24]
	add	x0, x3, x0
	ldr	x3, .LC41
	add	x3, x3, 72
	ldr	w0, [x3, x0, lsl 2]
	and	w3, w0, 3
	mov	w0, 8
	csel	w0, wzr, w0, ne
	cmp	w1, 1
.L137:
	mov	w1, 4
	and	w15, w23, 3
	csel	w1, wzr, w1, ne
	orr	w0, w0, w1
	and	w1, w23, 7
	orr	w0, w3, w0
	lsl	w3, w1, 2
	lsl	w0, w0, w3
	orr	w25, w25, w0
	lsl	x0, x2, 5
	add	x2, x0, x2, lsl 2
	lsl	x0, x21, 10
	add	x0, x0, x21, lsl 7
	add	x2, x2, x0
	add	x2, x19, x2
	ldr	w0, [x2, 1644]
	add	w2, w15, w15, lsl 2
	ubfiz	w0, w0, 1, 4
	orr	w0, w0, 1
	lsl	w0, w0, w2
	orr	w27, w27, w0
	b	.L104
	.p2align 3
.L116:
	str	w27, [x4, x0]
	add	x0, x4, x0
	b	.L117
	.p2align 3
.L113:
	str	w25, [x3, x0]
	add	x0, x3, x0
	b	.L114
	.p2align 3
.L98:
	ldr	x3, [x29, 104]
	ldrb	w1, [x0, 1626]
	ldrb	w4, [x0, 1628]
	ldr	w3, [x3, 24]
	add	x1, x3, x1, lsl 1
	ldrb	w3, [x0, 1629]
	ldr	x0, .LC41
	cmp	w3, 1
	add	x0, x0, 72
	ldr	w0, [x0, x1, lsl 2]
	and	w3, w0, 3
	mov	w0, 8
	csel	w0, wzr, w0, ne
	cmp	w4, 1
	b	.L136
	.p2align 3
.L106:
	ldr	x3, [x29, 104]
	ldrb	w1, [x0, 1626]
	ldrb	w4, [x0, 1630]
	ldr	w3, [x3, 24]
	add	x1, x3, x1, lsl 1
	ldrb	w3, [x0, 1631]
	ldr	x0, .LC41
	cmp	w3, 1
	add	x0, x0, 72
	ldr	w0, [x0, x1, lsl 2]
	and	w3, w0, 3
	mov	w0, 8
	csel	w0, wzr, w0, ne
	cmp	w4, 1
	b	.L137
	.p2align 3
.L141:
	mov	w1, 1
	add	x0, x3, x0
	str	w1, [x20, 852]
	b	.L121
	.p2align 3
.L122:
	str	w27, [x19, x0]
	add	x19, x19, x0
	b	.L123
	.size	H264HAL_SetSliceMsgRefPicField, .-H264HAL_SetSliceMsgRefPicField
	.align	3
.LC41:
	.xword	.LANCHOR0
	.align	3
.LC42:
	.xword	g_HwMem
	.align	3
.LC43:
	.xword	.LC35
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_SetSliceMsgRefPicInfo
	.type	H264HAL_SetSliceMsgRefPicInfo, %function
H264HAL_SetSliceMsgRefPicInfo:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	x21, x2
	mov	w22, w3
	bl	_mcount
	ldrb	w0, [x19]
	mov	w4, 0
	mov	w3, w22
	mov	x2, x21
	mov	x1, x20
	cbnz	w0, .L143
	mov	x0, x19
	bl	H264HAL_SetSliceMsgRefPicFrame
	ldr	x0, .LC48
	ldrb	w1, [x20]
	add	x0, x0, 24
	ldr	w0, [x0, w1, sxtw 2]
	cmp	w0, 2
	beq	.L147
.L142:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L143:
	mov	x0, x19
	bl	H264HAL_SetSliceMsgRefPicField
	ldr	x0, .LC48
	ldrb	w1, [x20]
	add	x0, x0, 24
	ldr	w0, [x0, w1, sxtw 2]
	cmp	w0, 2
	bne	.L142
	mov	w4, 1
	mov	w3, w22
	mov	x2, x21
	mov	x1, x20
	mov	x0, x19
	bl	H264HAL_SetSliceMsgRefPicField
	b	.L142
	.p2align 3
.L147:
	mov	w4, 1
	mov	w3, w22
	mov	x2, x21
	mov	x1, x20
	mov	x0, x19
	bl	H264HAL_SetSliceMsgRefPicFrame
	b	.L142
	.size	H264HAL_SetSliceMsgRefPicInfo, .-H264HAL_SetSliceMsgRefPicInfo
	.align	3
.LC48:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_SetSliceMsgAPCInfo
	.type	H264HAL_SetSliceMsgAPCInfo, %function
H264HAL_SetSliceMsgAPCInfo:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x19, x1
	mov	x0, x30
	mov	x23, x2
	mov	w22, w3
	bl	_mcount
	add	x20, x19, 3932
	ldr	w2, [x19, 3928]
	mov	w19, 0
	add	w19, w19, 1
	mov	w25, 36
	and	w1, w19, 3
	cmp	w19, 32
	ldr	x26, .LC50
	mov	w24, 1
	ldr	x21, .LC51
	and	w2, w2, 31
	add	w3, w1, w1, lsl 2
	beq	.L154
	.p2align 2
.L153:
	ldr	w0, [x20]
	cmp	w1, 3
	and	w0, w0, 31
	lsl	w0, w0, w3
	orr	w2, w2, w0
	beq	.L155
	add	x20, x20, 4
.L156:
	add	w19, w19, 1
	and	w1, w19, 3
	cmp	w19, 32
	add	w3, w1, w1, lsl 2
	bne	.L153
.L154:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L155:
	uxtw	x1, w25
	ldr	x3, [x26, 856]
	add	x4, x23, x1
	ldr	w5, [x26, 864]
	sub	x3, x4, x3
	lsl	x0, x1, 2
	cmp	x3, x5
	sub	x0, x0, x1
	add	x1, x4, x0
	blt	.L151
	str	w24, [x26, 852]
.L152:
	ldr	w5, [x1]
	add	w4, w22, w25, lsl 2
	mov	w3, w25
	mov	x2, x21
	mov	w0, 5
	mov	w1, 381
	add	w25, w25, 1
	add	x20, x20, 4
	bl	dprint_normal
	mov	w2, 0
	b	.L156
	.p2align 3
.L151:
	str	w2, [x4, x0]
	b	.L152
	.size	H264HAL_SetSliceMsgAPCInfo, .-H264HAL_SetSliceMsgAPCInfo
	.align	3
.LC50:
	.xword	g_HwMem
	.align	3
.LC51:
	.xword	.LC35
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_SetSliceMsgWPInfo
	.type	H264HAL_SetSliceMsgWPInfo, %function
H264HAL_SetSliceMsgWPInfo:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	mov	x22, x2
	str	w3, [x29, 100]
	bl	_mcount
	ldr	w0, [x20, 276]
	cbz	w0, .L158
	ldr	x0, .LC55
	ldrb	w1, [x19]
	str	x0, [x29, 104]
	add	x0, x0, 24
	ldr	w0, [x0, w1, sxtw 2]
	cmp	w0, 1
	beq	.L159
.L158:
	ldr	w0, [x20, 280]
	cmp	w0, 1
	beq	.L200
.L157:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L200:
	ldr	x0, .LC55
	ldrb	w1, [x19]
	str	x0, [x29, 104]
	add	x0, x0, 24
	ldr	w0, [x0, w1, sxtw 2]
	cmp	w0, 2
	bne	.L157
.L159:
	ldr	x2, .LC57
	mov	w1, 399
	ldr	w3, [x19, 44]
	mov	w0, 5
	add	x24, x22, 256
	add	x25, x22, 512
	mov	w27, 0
	add	x22, x22, 768
	bl	dprint_normal
	ldr	x20, .LC58
	ldr	w0, [x29, 100]
	ldr	x23, .LC59
	add	w21, w0, 768
	b	.L168
	.p2align 3
.L202:
	mov	w0, 1
	str	w0, [x20, 852]
	add	x0, x24, x28
.L163:
	ldr	w5, [x0]
	sub	w4, w21, #512
	add	w3, w27, 64
	mov	x2, x23
	mov	w1, 422
	mov	w0, 5
	bl	dprint_normal
	ldr	x4, [x20, 856]
	add	x0, x25, x26
	ldr	w3, [x20, 864]
	add	x2, x19, x26, lsl 2
	sub	x0, x0, x4
	add	x1, x25, x28
	cmp	x0, x3
	blt	.L164
	mov	w0, 1
	str	w0, [x20, 852]
.L165:
	ldr	w5, [x1]
	add	w3, w27, 128
	mov	x2, x23
	mov	w1, 428
	sub	w4, w21, #256
	mov	w0, 5
	bl	dprint_normal
	ldr	x3, [x20, 856]
	add	x6, x22, x26
	ldr	w2, [x20, 864]
	add	x1, x19, x26, lsl 2
	sub	x6, x6, x3
	add	x0, x22, x28
	cmp	x6, x2
	blt	.L166
	mov	w0, 1
	str	w0, [x20, 852]
	add	x0, x22, x28
.L167:
	ldr	w5, [x0]
	mov	w4, w21
	add	w3, w27, 192
	mov	x2, x23
	mov	w1, 433
	mov	w0, 5
	add	w27, w27, 1
	add	w21, w21, 4
	bl	dprint_normal
	ldr	w0, [x19, 44]
	cmp	w27, w0
	bhi	.L201
.L168:
	uxtw	x26, w27
	ldr	x4, [x20, 856]
	add	x1, x24, x26
	ldr	w3, [x20, 864]
	sub	x1, x1, x4
	lsl	x0, x26, 2
	cmp	x1, x3
	add	x2, x19, x0
	mov	x28, x0
	add	x0, x24, x0
	bge	.L202
	ldr	w1, [x2, 88]
	ldrb	w3, [x2, 856]
	ubfiz	w1, w1, 3, 9
	orr	w2, w1, w3, lsl 12
	ldr	w1, [x19, 80]
	and	w1, w1, 7
	orr	w1, w2, w1
	str	w1, [x24, w27, uxtw 2]
	b	.L163
	.p2align 3
.L166:
	ldrb	w2, [x1, 1112]
	ldr	w1, [x1, 344]
	and	w1, w1, 511
	orr	w1, w1, w2, lsl 9
	str	w1, [x22, x28]
	b	.L167
	.p2align 3
.L164:
	ldr	w0, [x2, 216]
	ldrb	w3, [x2, 984]
	ubfiz	w0, w0, 3, 9
	orr	w2, w0, w3, lsl 12
	ldr	w0, [x19, 84]
	and	w0, w0, 7
	orr	w0, w2, w0
	str	w0, [x25, x28]
	b	.L165
	.p2align 3
.L201:
	ldr	x2, .LC61
	mov	w1, 436
	ldr	w3, [x19, 80]
	mov	w0, 5
	mov	w27, 0
	bl	dprint_normal
	ldr	x26, .LC63
	ldr	x21, .LC65
	.p2align 2
.L169:
	add	x28, x19, x27, uxtw 2
	mov	x2, x26
	mov	w1, 440
	mov	w0, 5
	add	w27, w27, 1
	ldr	w3, [x28, 88]
	bl	dprint_normal
	ldr	w3, [x28, 856]
	mov	x2, x21
	mov	w1, 441
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x19, 44]
	cmp	w27, w0
	bls	.L169
	ldr	x0, [x29, 104]
	ldrb	w1, [x19]
	add	x0, x0, 24
	ldr	w0, [x0, w1, sxtw 2]
	cmp	w0, 2
	beq	.L170
.L173:
	ldr	x2, .LC67
	mov	w1, 453
	ldr	w3, [x19, 84]
	mov	w0, 5
	mov	w27, 0
	bl	dprint_normal
	ldr	x26, .LC73
	ldr	x21, .LC75
	.p2align 2
.L171:
	add	x28, x19, x27, uxtw 2
	mov	x2, x26
	mov	w1, 457
	mov	w0, 5
	add	w27, w27, 1
	ldr	w3, [x28, 216]
	bl	dprint_normal
	ldr	w3, [x28, 984]
	mov	x2, x21
	mov	w1, 458
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x19, 44]
	cmp	w27, w0
	bls	.L171
	ldr	x0, [x29, 104]
	ldrb	w1, [x19]
	add	x0, x0, 24
	ldr	w0, [x0, w1, sxtw 2]
	cmp	w0, 2
	beq	.L174
.L177:
	ldr	x26, .LC81
	mov	w27, 0
	ldr	x21, .LC83
	.p2align 2
.L175:
	add	x28, x19, x27, uxtw 2
	mov	x2, x26
	mov	w1, 472
	mov	w0, 5
	add	w27, w27, 1
	ldr	w3, [x28, 344]
	bl	dprint_normal
	ldr	w3, [x28, 1112]
	mov	x2, x21
	mov	w1, 473
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x19, 44]
	cmp	w27, w0
	bls	.L175
	ldr	x0, [x29, 104]
	ldrb	w1, [x19]
	add	x0, x0, 24
	ldr	w0, [x0, w1, sxtw 2]
	cmp	w0, 2
	bne	.L157
	ldr	x26, .LC85
	mov	w21, 0
	ldr	x28, .LC87
	.p2align 2
.L178:
	add	x27, x19, x21, uxtw 2
	mov	x2, x26
	mov	w1, 480
	mov	w0, 5
	add	w21, w21, 1
	ldr	w3, [x27, 728]
	bl	dprint_normal
	ldr	w3, [x27, 1496]
	mov	x2, x28
	mov	w1, 481
	mov	w0, 5
	bl	dprint_normal
	ldr	w3, [x19, 40]
	cmp	w21, w3
	bls	.L178
	ldr	x0, [x29, 104]
	add	x28, x0, 24
	ldrb	w0, [x19]
	ldr	w0, [x28, w0, sxtw 2]
	cmp	w0, 2
	bne	.L157
	ldr	w0, [x29, 100]
	mov	w1, 488
	ldr	x2, .LC89
	mov	w28, 0
	add	w27, w0, 896
	mov	w0, 5
	bl	dprint_normal
	b	.L185
	.p2align 3
.L203:
	mov	w0, 1
	str	w0, [x20, 852]
	add	x0, x24, x26
.L180:
	ldr	w5, [x0]
	add	w3, w28, 96
	mov	x2, x23
	mov	w1, 496
	sub	w4, w27, #512
	mov	w0, 5
	str	x6, [x29, 104]
	bl	dprint_normal
	ldr	x2, [x20, 856]
	add	x0, x25, x21
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	ldr	x6, [x29, 104]
	cmp	x0, x1
	add	x3, x19, x6, lsl 2
	blt	.L181
	mov	w0, 1
	str	w0, [x20, 852]
	add	x0, x25, x26
.L182:
	ldr	w5, [x0]
	mov	w1, 502
	sub	w4, w27, #256
	add	w3, w28, 160
	mov	x2, x23
	mov	w0, 5
	str	x6, [x29, 104]
	add	x21, x22, x21
	bl	dprint_normal
	ldr	x1, [x20, 856]
	add	x0, x22, x26
	ldr	x6, [x29, 104]
	sub	x21, x21, x1
	ldr	w1, [x20, 864]
	cmp	x21, x1
	add	x6, x19, x6, lsl 2
	blt	.L183
	mov	w1, 1
	str	w1, [x20, 852]
.L184:
	ldr	w5, [x0]
	mov	w4, w27
	add	w3, w28, 224
	mov	x2, x23
	mov	w1, 507
	mov	w0, 5
	add	w28, w28, 1
	add	w27, w27, 4
	bl	dprint_normal
	ldr	w0, [x19, 40]
	cmp	w28, w0
	bhi	.L157
.L185:
	uxtw	x6, w28
	ldr	x2, [x20, 856]
	add	x21, x6, 32
	ldr	w1, [x20, 864]
	add	x0, x24, x21
	add	x3, x19, x6, lsl 2
	sub	x0, x0, x2
	lsl	x26, x21, 2
	cmp	x0, x1
	bge	.L203
	ldrb	w2, [x3, 1240]
	lsl	x26, x21, 2
	ldr	w0, [x3, 472]
	ubfiz	w0, w0, 3, 9
	orr	w1, w0, w2, lsl 12
	ldr	w0, [x19, 80]
	and	w0, w0, 7
	orr	w0, w1, w0
	str	w0, [x24, x21, lsl 2]
	add	x0, x24, x26
	b	.L180
	.p2align 3
.L174:
	ldr	x26, .LC77
	mov	w21, 0
	ldr	x28, .LC79
	.p2align 2
.L176:
	add	x27, x19, x21, uxtw 2
	mov	x2, x26
	mov	w1, 465
	mov	w0, 5
	add	w21, w21, 1
	ldr	w3, [x27, 600]
	bl	dprint_normal
	ldr	w3, [x27, 1368]
	mov	x2, x28
	mov	w1, 466
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x19, 40]
	cmp	w21, w0
	bls	.L176
	b	.L177
	.p2align 3
.L170:
	ldr	x26, .LC69
	mov	w27, 0
	ldr	x21, .LC71
	.p2align 2
.L172:
	add	x28, x19, x27, uxtw 2
	mov	x2, x26
	mov	w1, 448
	mov	w0, 5
	add	w27, w27, 1
	ldr	w3, [x28, 472]
	bl	dprint_normal
	ldr	w3, [x28, 1240]
	mov	x2, x21
	mov	w1, 449
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x19, 40]
	cmp	w27, w0
	bls	.L172
	b	.L173
	.p2align 3
.L183:
	ldrb	w1, [x6, 1496]
	ldr	w0, [x6, 728]
	and	w0, w0, 511
	orr	w0, w0, w1, lsl 9
	str	w0, [x22, x26]
	add	x0, x22, x26
	b	.L184
	.p2align 3
.L181:
	ldrb	w2, [x3, 1368]
	ldr	w0, [x3, 600]
	ubfiz	w0, w0, 3, 9
	orr	w1, w0, w2, lsl 12
	ldr	w0, [x19, 84]
	and	w0, w0, 7
	orr	w0, w1, w0
	str	w0, [x25, x26]
	add	x0, x25, x26
	b	.L182
	.size	H264HAL_SetSliceMsgWPInfo, .-H264HAL_SetSliceMsgWPInfo
	.align	3
.LC55:
	.xword	.LANCHOR0
	.align	3
.LC57:
	.xword	.LC56
	.align	3
.LC58:
	.xword	g_HwMem
	.align	3
.LC59:
	.xword	.LC35
	.align	3
.LC61:
	.xword	.LC60
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
	.align	3
.LC71:
	.xword	.LC70
	.align	3
.LC73:
	.xword	.LC72
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
.LC81:
	.xword	.LC80
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
.LC89:
	.xword	.LC88
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_CheckParaValid
	.type	H264HAL_CheckParaValid, %function
H264HAL_CheckParaValid:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 800]
	cbz	x0, .L207
	mov	w0, 0
.L205:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L207:
	ldr	x3, .LC94
	mov	w1, 515
	ldr	x4, .LC93
	ldr	x2, .LC95
	add	x3, x3, 104
	bl	dprint_normal
	mov	w0, -1
	b	.L205
	.size	H264HAL_CheckParaValid, .-H264HAL_CheckParaValid
	.align	3
.LC93:
	.xword	.LC92
	.align	3
.LC94:
	.xword	.LANCHOR0
	.align	3
.LC95:
	.xword	.LC9
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_FindNextSlicePara
	.type	H264HAL_FindNextSlicePara, %function
H264HAL_FindNextSlicePara:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x22, x3
	mov	x0, x30
	mov	w20, w2
	mov	w21, w1
	bl	_mcount
	ldr	w1, [x19, 48]
	cmp	w20, w21
	str	w20, [x22]
	bge	.L209
	ldr	x19, [x19, 4056]
	cbz	x19, .L212
	ldr	w0, [x19, 48]
	cmp	w1, w0
	bcc	.L209
	add	w2, w20, 1
	b	.L211
	.p2align 3
.L213:
	ldr	x19, [x19, 4056]
	cbz	x19, .L212
	ldr	w0, [x19, 48]
	cmp	w1, w0
	bcc	.L209
.L211:
	cmp	w21, w2
	str	w2, [x22]
	add	w2, w2, 1
	bne	.L213
.L209:
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L212:
	mov	w3, 530
	ldr	x2, .LC97
	mov	w1, w3
	mov	w0, 1
	mov	x19, 0
	bl	dprint_normal
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	H264HAL_FindNextSlicePara, .-H264HAL_FindNextSlicePara
	.align	3
.LC97:
	.xword	.LC96
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_SetPicMsg
	.type	H264HAL_SetPicMsg, %function
H264HAL_SetPicMsg:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	mov	w23, w2
	mov	w22, w3
	add	w24, w2, 112
	str	x1, [x29, 96]
	bl	_mcount
	mov	w0, w23
	bl	MEM_Phy2Vir
	mov	x19, x0
	cbz	x0, .L291
	ldr	w1, [x21, 8]
	mov	w0, -2147483648
	ldr	x20, .LC102
	ldrb	w2, [x21, 1]
	cmp	w1, wzr
	csel	w1, w1, w0, eq
	mov	w0, 33554432
	cmp	w2, 1
	ldr	x2, [x20, 856]
	csel	w0, wzr, w0, ne
	orr	w0, w1, w0
	ldr	w1, [x20, 864]
	sub	x2, x19, x2
	cmp	x2, x1
	bge	.L292
	ldp	w3, w2, [x21, 20]
	ldr	w1, [x21, 36]
	sub	w3, w3, #1
	ldr	w4, [x21, 28]
	orr	w5, w3, w1, lsl 26
	ldrb	w1, [x21]
	add	x2, x2, x1, lsl 1
	ldr	x1, .LC100
	add	x1, x1, 152
	ldr	w2, [x1, x2, lsl 2]
	ldr	w1, [x21, 32]
	lsl	w1, w1, 27
	orr	w1, w1, w4, lsl 28
	orr	w3, w5, w1
	ldr	w1, [x21, 12]
	sub	w1, w1, #1
	lsl	w1, w1, 16
	orr	w1, w1, w2, lsl 14
	orr	w1, w3, w1
	orr	w0, w1, w0
	str	w0, [x19]
.L223:
	mov	x25, x19
	ldr	x2, .LC104
	mov	w1, 565
	mov	w3, w23
	mov	w0, 5
	ldr	w4, [x25], 1
	bl	dprint_normal
	ldr	x1, [x20, 856]
	ldr	w0, [x20, 864]
	sub	x25, x25, x1
	cmp	x25, x0
	blt	.L224
	mov	w0, 1
	str	w0, [x20, 852]
.L225:
	ldr	x2, .LC106
	mov	w1, 570
	ldr	w4, [x19, 4]
	add	w3, w23, 4
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x20, 856]
	add	x0, x19, 2
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L226
	mov	w0, 1
	str	w0, [x20, 852]
.L227:
	ldr	x2, .LC108
	add	w3, w23, 8
	ldr	w4, [x19, 8]
	mov	w1, 575
	mov	w0, 5
	bl	dprint_normal
	ldr	x3, [x20, 856]
	add	x1, x19, 3
	ldr	w0, [x21, 24]
	ldr	w2, [x20, 864]
	sub	x1, x1, x3
	cmp	x1, x2
	cbz	w0, .L228
	blt	.L229
	mov	w0, 1
	str	w0, [x20, 852]
.L230:
	add	x0, x19, 4
	sub	x0, x0, x3
	cmp	x0, x2
	blt	.L231
	mov	w0, 1
	str	w0, [x20, 852]
.L232:
	ldr	x2, .LC110
	add	w3, w23, 12
	ldr	w4, [x19, 12]
	mov	w1, 585
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, .LC112
	add	w3, w23, 16
	ldr	w4, [x19, 16]
	mov	w1, 586
	mov	w0, 5
	bl	dprint_normal
.L233:
	ldr	x2, [x20, 856]
	add	x0, x19, 5
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L238
	mov	w0, 1
	str	w0, [x20, 852]
.L239:
	ldr	x2, .LC114
	mov	w1, 601
	ldr	w4, [x19, 20]
	add	w3, w23, 20
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x20, 856]
	add	x0, x19, 6
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L240
	mov	w0, 1
	str	w0, [x20, 852]
.L241:
	ldr	x2, .LC116
	add	w3, w23, 24
	ldr	w4, [x19, 24]
	mov	w1, 606
	mov	w0, 5
	bl	dprint_normal
	ldrb	w0, [x21]
	cmp	w0, 2
	beq	.L242
	ldr	w0, [x21, 292]
	add	x0, x21, x0, lsl 2
	ldr	w1, [x0, 440]
.L243:
	ldr	x2, [x20, 856]
	add	x0, x19, 7
	sub	x0, x0, x2
	ldr	w2, [x20, 864]
	cmp	x0, x2
	blt	.L244
	mov	w0, 1
	str	w0, [x20, 852]
.L245:
	ldr	x2, .LC118
	mov	w1, 619
	ldr	w4, [x19, 28]
	add	w3, w23, 28
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x20, 856]
	add	x0, x19, 8
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L246
	mov	w0, 1
	str	w0, [x20, 852]
.L247:
	ldr	x2, .LC120
	mov	w1, 624
	ldr	w4, [x19, 32]
	add	w3, w23, 32
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x20, 856]
	add	x0, x19, 9
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L248
	mov	w0, 1
	str	w0, [x20, 852]
.L249:
	ldr	x2, .LC122
	add	w3, w23, 36
	ldr	w4, [x19, 36]
	mov	w1, 629
	mov	w0, 5
	bl	dprint_normal
	ldr	w27, [x21, 792]
	ldr	x22, .LC124
	cbz	w27, .L250
	add	w26, w23, 40
	mov	w28, 0
	mov	w25, 1
	b	.L253
	.p2align 3
.L294:
	str	w25, [x20, 852]
.L252:
	ldr	w5, [x5]
	mov	w4, w26
	add	w3, w28, 10
	mov	x2, x22
	mov	w1, 637
	mov	w0, 5
	add	w28, w28, 1
	add	w26, w26, 4
	bl	dprint_normal
	ldr	w27, [x21, 792]
	cmp	w27, w28
	bls	.L293
.L253:
	uxtw	x0, w28
	ldr	x4, [x20, 856]
	add	x1, x0, 10
	ldr	w3, [x20, 864]
	add	x2, x19, x1
	add	x0, x21, x0, lsl 2
	sub	x2, x2, x4
	add	x5, x19, x1, lsl 2
	cmp	x2, x3
	bge	.L294
	ldr	w0, [x0, 600]
	add	x0, x21, x0, lsl 2
	ldr	w0, [x0, 300]
	str	w0, [x19, x1, lsl 2]
	b	.L252
	.p2align 3
.L292:
	mov	w0, 1
	str	w0, [x20, 852]
	b	.L223
	.p2align 3
.L293:
	cmp	w27, 15
	bhi	.L259
.L250:
	add	w3, w27, 10
	mov	w25, 1
	add	w28, w23, w3, lsl 2
	b	.L258
	.p2align 3
.L295:
	str	w25, [x20, 852]
.L257:
	ldr	w5, [x2]
	mov	w4, w28
	mov	w1, 644
	mov	w0, 5
	mov	x2, x22
	add	w27, w27, 1
	add	w28, w28, 4
	bl	dprint_normal
	cmp	w27, 15
	add	w3, w27, 10
	bhi	.L259
.L258:
	uxtw	x0, w27
	ldr	x2, [x20, 856]
	add	x0, x0, 10
	ldr	w4, [x20, 864]
	add	x1, x19, x0
	sub	x1, x1, x2
	add	x2, x19, x0, lsl 2
	cmp	x1, x4
	bge	.L295
	ldr	w1, [x21, 600]
	add	x1, x21, x1, lsl 2
	ldr	w1, [x1, 300]
	str	w1, [x19, x0, lsl 2]
	b	.L257
	.p2align 3
.L259:
	ldr	x2, [x20, 856]
	add	x0, x19, 26
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L296
	mov	w0, 1
	str	w0, [x20, 852]
.L260:
	ldr	x2, .LC126
	add	w3, w23, 104
	ldr	w4, [x19, 104]
	mov	w1, 650
	mov	w0, 5
	bl	dprint_normal
	ldr	w27, [x21, 792]
	add	w0, w23, 108
	str	w0, [x29, 108]
	cbz	w27, .L262
	mov	w28, w24
	mov	w26, 27
	mov	w25, 0
	b	.L267
	.p2align 3
.L298:
	mov	w0, 1
	str	w0, [x20, 852]
.L264:
	ldr	w5, [x19, w26, uxtw 2]
	mov	w3, w26
	mov	x2, x22
	mov	w1, 657
	sub	w4, w28, #4
	mov	w0, 5
	bl	dprint_normal
	add	x6, x27, 28
	ldr	x2, [x20, 856]
	add	x0, x19, x6
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	add	x3, x21, x25, uxtw 2
	cmp	x0, x1
	blt	.L265
	mov	w0, 1
	str	w0, [x20, 852]
.L266:
	add	w5, w26, 1
	mov	w4, w28
	mov	w3, w5
	mov	x2, x22
	mov	w1, 661
	mov	w0, 5
	ldr	w5, [x19, w5, uxtw 2]
	add	w25, w25, 1
	add	w28, w28, 8
	add	w26, w26, 2
	bl	dprint_normal
	ldr	w27, [x21, 792]
	cmp	w27, w25
	bls	.L297
.L267:
	ubfiz	x27, x25, 1, 31
	ldr	x3, [x20, 856]
	add	x1, x27, 27
	ldr	w2, [x20, 864]
	add	x0, x19, x1
	add	x4, x21, x25, uxtw 2
	sub	x0, x0, x3
	cmp	x0, x2
	bge	.L298
	ldr	w0, [x4, 664]
	str	w0, [x19, x1, lsl 2]
	b	.L264
	.p2align 3
.L265:
	ldr	w0, [x3, 728]
	str	w0, [x19, x6, lsl 2]
	b	.L266
	.p2align 3
.L297:
	cmp	w27, 15
	bhi	.L275
.L262:
	ldr	w0, [x29, 108]
	lsl	w28, w27, 1
	add	w26, w0, w27, lsl 3
	b	.L274
	.p2align 3
.L299:
	mov	w0, 1
	str	w0, [x20, 852]
.L271:
	add	w5, w28, 27
	mov	x2, x22
	mov	w3, w5
	mov	w1, 668
	mov	w4, w26
	mov	w0, 5
	ldr	w5, [x19, w5, uxtw 2]
	add	x25, x25, 28
	bl	dprint_normal
	ldr	x2, [x20, 856]
	add	x0, x19, x25
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L272
	mov	w0, 1
	str	w0, [x20, 852]
.L273:
	add	w0, w28, 28
	ldr	w1, [x29, 108]
	mov	w3, w0
	mov	x2, x22
	sub	w4, w26, w1
	mov	w1, 672
	ldr	w5, [x19, w0, uxtw 2]
	add	w4, w4, w24
	mov	w0, 5
	add	w27, w27, 1
	add	w28, w28, 2
	add	w26, w26, 8
	bl	dprint_normal
	cmp	w27, 15
	bhi	.L275
.L274:
	uxtw	x25, w28
	ldr	x3, [x20, 856]
	add	x1, x25, 27
	ldr	w2, [x20, 864]
	add	x0, x19, x1
	sub	x0, x0, x3
	cmp	x0, x2
	bge	.L299
	str	wzr, [x19, x1, lsl 2]
	b	.L271
	.p2align 3
.L272:
	str	wzr, [x19, x25, lsl 2]
	b	.L273
	.p2align 3
.L275:
	ldr	x2, [x20, 856]
	add	x0, x19, 59
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L300
	mov	w0, 1
	str	w0, [x20, 852]
.L276:
	add	x0, x21, 52
	add	x3, x19, 256
	add	w2, w23, 256
	mov	w1, 56
	bl	H264HAL_Write_Qmatrix
	mov	w0, 0
.L219:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L296:
	ldr	x0, [x29, 96]
	ldr	w0, [x0, 868]
	str	w0, [x19, 104]
	b	.L260
	.p2align 3
.L244:
	str	w1, [x19, 28]
	b	.L245
	.p2align 3
.L240:
	ldr	x0, [x29, 96]
	ldr	w0, [x0, 916]
	str	w0, [x19, 24]
	b	.L241
	.p2align 3
.L238:
	ldr	x0, [x29, 96]
	ldr	w0, [x0, 912]
	str	w0, [x19, 20]
	b	.L239
	.p2align 3
.L300:
	ldr	x0, [x29, 96]
	ldr	w0, [x0, 924]
	str	w0, [x19, 236]
	b	.L276
	.p2align 3
.L224:
	ldr	w0, [x21, 288]
	str	w0, [x19, 4]
	b	.L225
	.p2align 3
.L248:
	str	w22, [x19, 36]
	b	.L249
	.p2align 3
.L246:
	ldr	x0, [x29, 96]
	ldr	w0, [x0, 920]
	str	w0, [x19, 32]
	b	.L247
	.p2align 3
.L228:
	blt	.L234
	mov	w0, 1
	str	w0, [x20, 852]
.L235:
	add	x0, x19, 4
	sub	x0, x0, x3
	cmp	x0, x2
	blt	.L236
	mov	w0, 1
	str	w0, [x20, 852]
.L237:
	ldr	w4, [x19, 12]
	add	w3, w23, 12
	ldr	x2, .LC110
	mov	w1, 593
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, .LC112
	add	w3, w23, 16
	ldr	w4, [x19, 16]
	mov	w1, 594
	mov	w0, 5
	bl	dprint_normal
	b	.L233
	.p2align 3
.L226:
	ldr	w0, [x21, 40]
	str	w0, [x19, 8]
	b	.L227
	.p2align 3
.L242:
	ldr	w1, [x21, 292]
	ldr	w0, [x21, 572]
	add	x1, x21, x1, lsl 2
	ldr	w1, [x1, 440]
	add	w1, w1, w0
	b	.L243
	.p2align 3
.L236:
	str	wzr, [x19, 16]
	b	.L237
	.p2align 3
.L234:
	str	wzr, [x19, 12]
	ldr	w2, [x20, 864]
	ldr	x3, [x20, 856]
	b	.L235
	.p2align 3
.L231:
	ldr	w0, [x21, 48]
	str	w0, [x19, 16]
	b	.L232
	.p2align 3
.L229:
	ldr	w0, [x21, 44]
	str	w0, [x19, 12]
	ldr	w2, [x20, 864]
	ldr	x3, [x20, 856]
	b	.L230
.L291:
	ldr	x3, .LC100
	mov	w1, 550
	ldr	x4, .LC99
	mov	w0, 0
	ldr	x2, .LC101
	add	x3, x3, 128
	bl	dprint_normal
	mov	w0, -1
	b	.L219
	.size	H264HAL_SetPicMsg, .-H264HAL_SetPicMsg
	.align	3
.LC99:
	.xword	.LC98
	.align	3
.LC100:
	.xword	.LANCHOR0
	.align	3
.LC101:
	.xword	.LC9
	.align	3
.LC102:
	.xword	g_HwMem
	.align	3
.LC104:
	.xword	.LC103
	.align	3
.LC106:
	.xword	.LC105
	.align	3
.LC108:
	.xword	.LC107
	.align	3
.LC110:
	.xword	.LC109
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_SetSliceMsg
	.type	H264HAL_SetSliceMsg, %function
H264HAL_SetSliceMsg:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x23, x0
	mov	x0, x30
	mov	w22, w3
	mov	x21, x2
	mov	w25, w5
	mov	w24, w7
	bl	_mcount
	mov	w0, w22
	bl	MEM_Phy2Vir
	mov	x19, x0
	cbz	x0, .L331
	mov	x2, x0
	mov	x1, x21
	mov	x0, x23
	mov	w3, w22
	bl	H264HAL_SetSliceMsgStreamAddrInfo
	ldr	x20, .LC131
	add	x0, x19, 6
	ldr	x2, [x20, 856]
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	bge	.L332
	ldr	w1, [x21, 48]
	ldp	w2, w0, [x21, 32]
	and	w1, w1, 1048575
	orr	w1, w1, w2, lsl 26
	ubfiz	w0, w0, 24, 2
	orr	w0, w1, w0
	str	w0, [x19, 24]
.L305:
	ldr	x2, .LC133
	mov	w1, 718
	ldr	w4, [x19, 24]
	add	w3, w22, 24
	mov	w0, 5
	bl	dprint_normal
	ldr	x0, .LC134
	ldrb	w1, [x21, 3]
	ldrb	w0, [x0]
	cbnz	w0, .L307
	cbnz	w1, .L307
	ldp	w2, w0, [x23, 16]
	mul	w0, w0, w2
	cmp	w0, 1620
	bhi	.L333
.L307:
	ldr	x2, [x20, 856]
	add	x0, x19, 7
	sub	x0, x0, x2
	ldr	w2, [x20, 864]
	cmp	x0, x2
	blt	.L308
	mov	w0, 1
	str	w0, [x20, 852]
.L309:
	ldr	x2, .LC136
	add	w3, w22, 28
	ldr	w4, [x19, 28]
	mov	w1, 734
	mov	w0, 5
	bl	dprint_normal
	mov	x2, x19
	mov	x1, x21
	mov	x0, x23
	mov	w3, w22
	bl	H264HAL_SetSliceMsgMvAddrInfo
	ldr	x2, [x20, 856]
	add	x0, x19, 10
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L310
	mov	w0, 1
	str	w0, [x20, 852]
.L311:
	ldr	x2, .LC138
	mov	w1, 746
	ldr	w4, [x19, 40]
	add	w3, w22, 40
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x20, 856]
	add	x0, x19, 11
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L312
	mov	w0, 1
	str	w0, [x20, 852]
	ldr	x2, .LC140
	add	w3, w22, 44
	ldr	w4, [x19, 44]
	mov	w1, 755
	mov	w0, 5
	bl	dprint_normal
	ldr	x0, [x21, 4056]
	cbz	x0, .L334
.L315:
	ldr	x3, [x20, 856]
	add	x1, x19, 44
	ldr	w2, [x20, 864]
	sub	x1, x1, x3
	cmp	x1, x2
	blt	.L318
	mov	w0, 1
	str	w0, [x20, 852]
.L319:
	add	x0, x19, 63
	sub	x0, x0, x3
	cmp	x0, x2
	blt	.L335
	mov	w0, 1
	str	w0, [x20, 852]
.L320:
	ldr	x0, .LC129
	mov	w20, 0
	ldrb	w1, [x21]
	add	x0, x0, 24
	ldr	w0, [x0, w1, sxtw 2]
	cbz	w0, .L326
	mov	w3, w22
	mov	x2, x19
	mov	x1, x21
	mov	x0, x23
	bl	H264HAL_SetSliceMsgRefPicInfo
	mov	w3, w22
	mov	x2, x19
	mov	x1, x21
	mov	x0, x23
	bl	H264HAL_SetSliceMsgAPCInfo
	mov	w3, w22
	mov	x2, x19
	mov	x1, x21
	mov	x0, x23
	bl	H264HAL_SetSliceMsgWPInfo
.L326:
	mov	w0, w20
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L332:
	mov	w0, 1
	str	w0, [x20, 852]
	b	.L305
	.p2align 3
.L312:
	ldp	w0, w1, [x21, 68]
	ldr	w2, [x21, 76]
	add	w3, w22, 44
	ubfiz	w1, w1, 8, 4
	ubfiz	w0, w0, 16, 4
	orr	w0, w0, w1
	mov	w1, 755
	orr	w0, w0, w2
	str	w0, [x19, 44]
	ldr	x2, .LC140
	mov	w0, 5
	ldr	w4, [x19, 44]
	bl	dprint_normal
	ldr	x0, [x21, 4056]
	cbnz	x0, .L315
.L334:
	ldr	w0, [x23, 596]
	ldrb	w24, [x21, 1]
	cmp	w0, 1048576
	ble	.L317
	add	w24, w24, 1
	mov	w0, 1048575
	sdiv	w24, w0, w24
	b	.L315
	.p2align 3
.L310:
	ldp	w1, w0, [x21, 60]
	ldrb	w2, [x21, 4]
	ubfiz	w1, w1, 5, 5
	and	w0, w0, 31
	orr	w1, w1, w2, lsl 16
	orr	w0, w1, w0
	str	w0, [x19, 40]
	b	.L311
	.p2align 3
.L308:
	ldr	x0, .LC129
	ldrb	w2, [x21]
	add	x0, x0, 24
	ldr	w3, [x21, 44]
	ubfiz	w3, w3, 16, 5
	ldr	w2, [x0, w2, sxtw 2]
	ldr	w0, [x21, 52]
	orr	w4, w3, w2
	ldr	w2, [x21, 56]
	lsl	w0, w0, 2
	orr	w0, w0, w2, lsl 8
	ldrb	w2, [x21, 2]
	orr	w3, w4, w0
	ldr	w0, [x21, 40]
	ubfiz	w0, w0, 21, 5
	orr	w0, w0, w2, lsl 15
	orr	w0, w3, w0
	orr	w1, w0, w1, lsl 14
	str	w1, [x19, 28]
	b	.L309
	.p2align 3
.L335:
	str	w25, [x19, 252]
	b	.L320
	.p2align 3
.L318:
	str	w24, [x19, 176]
	ldr	w2, [x20, 864]
	ldr	x3, [x20, 856]
	b	.L319
	.p2align 3
.L317:
	sub	w0, w0, #1
	add	w24, w24, 1
	sdiv	w24, w0, w24
	b	.L315
.L333:
	mov	w20, -1
	b	.L326
.L331:
	ldr	x3, .LC129
	mov	w1, 704
	ldr	x4, .LC128
	mov	w0, 0
	ldr	x2, .LC130
	add	x3, x3, 184
	mov	w20, -1
	bl	dprint_normal
	b	.L326
	.size	H264HAL_SetSliceMsg, .-H264HAL_SetSliceMsg
	.align	3
.LC128:
	.xword	.LC6
	.align	3
.LC129:
	.xword	.LANCHOR0
	.align	3
.LC130:
	.xword	.LC9
	.align	3
.LC131:
	.xword	g_HwMem
	.align	3
.LC133:
	.xword	.LC132
	.align	3
.LC134:
	.xword	g_NotDirect_8x8_InferenceFlag
	.align	3
.LC136:
	.xword	.LC135
	.align	3
.LC138:
	.xword	.LC137
	.align	3
.LC140:
	.xword	.LC139
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264HAL_StartDec
	.type	H264HAL_StartDec, %function
H264HAL_StartDec:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	sxtw	x1, w1
	mov	x25, x0
	mov	x19, x1
	mov	x0, x30
	lsl	x23, x19, 7
	str	x1, [x29, 104]
	sub	x23, x23, x19
	bl	_mcount
	ldr	x22, .LC142
	ldr	x0, [x25, 800]
	add	x1, x22, x23, lsl 3
	str	x1, [x29, 112]
	cbz	x0, .L366
	ldr	x0, [x29, 112]
	mov	x1, x0
	ldp	w2, w3, [x0, 40]
	mov	x0, x25
	bl	H264HAL_SetPicMsg
	ldr	x26, [x25, 800]
	cbz	x26, .L367
	ldr	w0, [x25, 940]
	cmp	w0, 1
	beq	.L368
	ldr	w19, [x26, 48]
	mov	w21, 0
	cbnz	w19, .L369
.L342:
	ldr	x0, [x29, 104]
	mov	w27, 0
	ldr	w1, [x25, 796]
	mov	w19, 0
	lsl	x20, x0, 7
	sub	x20, x20, x0
	lsl	x20, x20, 1
	.p2align 2
.L344:
	cmp	w19, w1
	bge	.L370
.L350:
	ldr	w6, [x26, 48]
	cmp	w19, wzr
	ccmp	w6, w27, 2, gt
	bls	.L344
	add	w4, w21, 4
	add	w23, w21, 5
	add	w4, w4, w19
	add	w24, w19, w23
	add	x3, x29, 140
	add	w2, w19, 1
	add	x4, x20, x4, sxtw
	add	x9, x20, x24, sxtw
	mov	x0, x26
	mov	w27, w6
	add	x4, x22, x4, lsl 2
	add	x9, x22, x9, lsl 2
	ldr	w4, [x4, 24]
	ldr	w28, [x9, 24]
	stp	w6, w4, [x29, 120]
	bl	H264HAL_FindNextSlicePara
	mov	x9, x0
	mov	w5, 0
	add	w0, w24, 1
	cbz	x9, .L364
	ldr	w1, [x25, 796]
	ldr	w19, [x29, 140]
	ldp	w6, w4, [x29, 120]
	cmp	w1, w19
	beq	.L346
	add	w7, w23, w19
	cmp	w0, 205
	add	x7, x20, x7, sxtw
	bgt	.L346
	ldr	x0, .LC142
	mov	x2, x26
	ldr	w1, [x9, 48]
	mov	w3, w28
	add	x0, x0, x7, lsl 2
	mov	x26, x9
	sub	w7, w1, #1
	ldr	x1, [x29, 112]
	ldr	w5, [x0, 24]
	mov	x0, x25
	bl	H264HAL_SetSliceMsg
	cbnz	w0, .L349
.L371:
	ldr	w1, [x25, 796]
	cmp	w19, w1
	blt	.L350
.L370:
	cmp	w1, wzr
	ble	.L351
	ldr	x2, [x29, 104]
	add	w1, w1, 4
	add	w1, w1, w21
	lsl	x0, x2, 7
	sub	x0, x0, x2
	lsl	x0, x0, 1
	add	x0, x0, x1, sxtw
	add	x22, x22, x0, lsl 2
	ldr	w0, [x22, 24]
	bl	H264HAL_CutSliceChain
	mov	w0, 0
.L357:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L346:
	ldr	w0, [x25, 20]
	mov	x2, x26
	ldr	w7, [x25, 12]
	mov	w3, w28
	ldr	x1, [x29, 112]
	str	xzr, [x26, 4056]
	mov	x26, x9
	mul	w7, w0, w7
	mov	x0, x25
	ldr	w19, [x25, 796]
	sub	w7, w7, #1
	bl	H264HAL_SetSliceMsg
	cbz	w0, .L371
.L349:
	mov	w3, 917
.L363:
	ldr	x2, .LC149
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
.L364:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, -1
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L369:
	ldp	w10, w9, [x26, 8]
	str	wzr, [x26, 48]
	mov	w21, 1
	ldp	w28, w27, [x26, 16]
	stp	w21, wzr, [x26, 8]
	stp	wzr, wzr, [x26, 16]
	ldp	w23, w20, [x26, 24]
	ldr	w0, [x25, 592]
	sub	w7, w19, #1
	stp	w0, wzr, [x26, 24]
	ldr	x0, [x29, 112]
	mov	w6, 0
	mov	x2, x26
	mov	x1, x0
	ldp	w4, w3, [x0, 40]
	ldr	w5, [x0, 48]
	mov	x0, x25
	stp	w10, w9, [x29, 120]
	bl	H264HAL_SetSliceMsg
	ldp	w10, w9, [x29, 120]
	cbnz	w0, .L372
	stp	w10, w9, [x26, 8]
	stp	w28, w27, [x26, 16]
	stp	w23, w20, [x26, 24]
	str	w19, [x26, 48]
	ldr	x26, [x25, 800]
	b	.L342
	.p2align 3
.L368:
	ldr	w1, [x25, 796]
	cmp	w1, 1
	ble	.L340
	.p2align 2
.L341:
	add	w0, w0, 1
	ldr	x26, [x26, 4056]
	cmp	w0, w1
	bne	.L341
.L340:
	ldr	w1, [x25, 20]
	mov	w5, 0
	ldr	w7, [x25, 12]
	mov	w4, 0
	ldr	w6, [x26, 48]
	mul	w7, w1, w7
	ldp	x2, x1, [x29, 104]
	sub	w7, w7, #1
	lsl	x0, x2, 7
	sub	x24, x0, x2
	mov	x2, x26
	mov	x0, x25
	add	x22, x22, x24, lsl 3
	ldr	w3, [x22, 44]
	bl	H264HAL_SetSliceMsg
	mov	w3, 830
	cbnz	w0, .L363
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
.L366:
	ldr	x3, .LC144
	mov	w1, 515
	ldr	x4, .LC143
	ldr	x2, .LC145
	add	x3, x3, 104
	bl	dprint_normal
	mov	w0, -1
	b	.L357
.L372:
	mov	w3, 863
	ldr	x2, .LC149
	mov	w1, w3
	mov	w0, w21
	bl	dprint_normal
	mov	w0, -1
	b	.L357
.L351:
	ldr	x2, .LC151
	mov	w1, 929
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L357
.L367:
	ldr	x2, .LC147
	mov	w1, 809
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L357
	.size	H264HAL_StartDec, .-H264HAL_StartDec
	.align	3
.LC142:
	.xword	g_HwMem
	.align	3
.LC143:
	.xword	.LC92
	.align	3
.LC144:
	.xword	.LANCHOR0
	.align	3
.LC145:
	.xword	.LC9
	.align	3
.LC147:
	.xword	.LC146
	.align	3
.LC149:
	.xword	.LC148
	.align	3
.LC151:
	.xword	.LC150
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.10172, %object
	.size	__func__.10172, 22
__func__.10172:
	.string	"H264HAL_CutSliceChain"
	.zero	2
	.type	g_SliceTypeForPMV, %object
	.size	g_SliceTypeForPMV, 12
g_SliceTypeForPMV:
	.word	1
	.word	2
	.word	0
	.zero	4
	.type	g_ListStructFrame, %object
	.size	g_ListStructFrame, 32
g_ListStructFrame:
	.word	0
	.word	1
	.word	3
	.word	3
	.word	3
	.word	3
	.word	2
	.word	2
	.type	g_ListStructField, %object
	.size	g_ListStructField, 32
g_ListStructField:
	.word	0
	.word	1
	.word	2
	.word	2
	.word	2
	.word	2
	.word	2
	.word	2
	.type	__func__.10305, %object
	.size	__func__.10305, 23
__func__.10305:
	.string	"H264HAL_CheckParaValid"
	.zero	1
	.type	__func__.10328, %object
	.size	__func__.10328, 18
__func__.10328:
	.string	"H264HAL_SetPicMsg"
	.zero	6
	.type	g_StructTrans, %object
	.size	g_StructTrans, 32
g_StructTrans:
	.word	0
	.word	3
	.word	1
	.word	1
	.word	2
	.word	2
	.word	3
	.word	3
	.type	__func__.10362, %object
	.size	__func__.10362, 20
__func__.10362:
	.string	"H264HAL_SetSliceMsg"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	ASCII(.string	"line: %d, p = NULL is not expected value!\n" )
	.zero	5
.LC4:
	ASCII(.string	"H264HAL_InitHal return error.\n" )
	.zero	1
.LC6:
	ASCII(.string	"can not map slice msg virtual address!\n" )
.LC9:
	ASCII(.string	"%s: %s\n" )
.LC13:
	ASCII(.string	"qmatrix[%d] = 0x%x\n" )
	.zero	4
.LC15:
	ASCII(.string	"picmsg Dxx addr 0x%x = 0x%x\n" )
	.zero	3
.LC17:
	ASCII(.string	"slicemsg D[%d] tmp =0x%x,bitsoffset =0x%x,bytespos = 0x%x\n" )
	.zero	5
.LC20:
	ASCII(.string	"slicemsg D[%d] addr 0x%x = 0x%x\n" )
	.zero	7
.LC24:
	ASCII(.string	"slicemsg g_pListX[1][0]->frame_store->pmv_address_idc = %d\n" )
	.zero	4
.LC27:
	ASCII(.string	"slicemsg D[6] addr 0x%x = 0x%x\n" )
.LC29:
	ASCII(.string	"slicemsg D[7] addr 0x%x = 0x%x\n" )
.LC35:
	ASCII(.string	"slicemsg D[%d] address 0x%x = 0x%x\n" )
	.zero	4
.LC56:
	ASCII(.string	"slicemsg burst1 D0~D31, burst2 D0~31, burst3 D0~D31 list0size = %d\n" )
	.zero	4
.LC60:
	ASCII(.string	"luma_lg = %d\n" )
	.zero	2
.LC62:
	ASCII(.string	"wp_weight_l0_y = %d\n" )
	.zero	3
.LC64:
	ASCII(.string	"wp_offset_l0_y = %d\n" )
	.zero	3
.LC66:
	ASCII(.string	"chroma_lg = %d\n" )
.LC68:
	ASCII(.string	"wp_weight_l1_y = %d\n" )
	.zero	3
.LC70:
	ASCII(.string	"wp_offset_l1_y = %d\n" )
	.zero	3
.LC72:
	ASCII(.string	"wp_weight_l0_u = %d\n" )
	.zero	3
.LC74:
	ASCII(.string	"wp_offset_l0_u = %d\n" )
	.zero	3
.LC76:
	ASCII(.string	"wp_weight_l1_u = %d\n" )
	.zero	3
.LC78:
	ASCII(.string	"wp_offset_l1_u = %d\n" )
	.zero	3
.LC80:
	ASCII(.string	"wp_weight_l0_v = %d\n" )
	.zero	3
.LC82:
	ASCII(.string	"wp_offset_l0_v = %d\n" )
	.zero	3
.LC84:
	ASCII(.string	"wp_weight_l1_v = %d\n" )
	.zero	3
.LC86:
	ASCII(.string	"wp_offset_l1_v = %d\n" )
	.zero	3
.LC88:
	ASCII(.string	"slicemsg burst1 D32~D63, burst2 D32~63, burst3 D32~D63 list1size = %d\n" )
	.zero	1
.LC92:
	ASCII(.string	"point of fst slice para null\n" )
	.zero	2
.LC96:
	ASCII(.string	"line %d pSlicePara is NULL!\n" )
	.zero	3
.LC98:
	ASCII(.string	"can not map down msg virtual address!\n" )
	.zero	1
.LC103:
	ASCII(.string	"picmsg D[0] addr 0x%x = 0x%x\n" )
	.zero	2
.LC105:
	ASCII(.string	"picmsg D[1] addr 0x%x = 0x%x\n" )
	.zero	2
.LC107:
	ASCII(.string	"picmsg D[2] addr 0x%x = 0x%x\n" )
	.zero	2
.LC109:
	ASCII(.string	"picmsg D[3] addr 0x%x = 0x%x\n" )
	.zero	2
.LC111:
	ASCII(.string	"picmsg D[4] addr 0x%x = 0x%x\n" )
	.zero	2
.LC113:
	ASCII(.string	"picmsg D[5] addr 0x%x = 0x%x\n" )
	.zero	2
.LC115:
	ASCII(.string	"picmsg D[6] addr 0x%x = 0x%x\n" )
	.zero	2
.LC117:
	ASCII(.string	"picmsg D[7] addr 0x%x = 0x%x\n" )
	.zero	2
.LC119:
	ASCII(.string	"picmsg D[8] addr 0x%x = 0x%x\n" )
	.zero	2
.LC121:
	ASCII(.string	"picmsg D[9] addr 0x%x = 0x%x\n" )
	.zero	2
.LC123:
	ASCII(.string	"picmsg D[%d] addr 0x%x = 0x%x\n" )
	.zero	1
.LC125:
	ASCII(.string	"picmsg D[26] addr 0x%x = 0x%x\n" )
	.zero	1
.LC132:
	ASCII(.string	"slicemsg D[4] addr 0x%x = 0x%x\n" )
.LC135:
	ASCII(.string	"slicemsg D[5] addr 0x%x = 0x%x\n" )
.LC137:
	ASCII(.string	"slicemsg D[8] addr 0x%x = 0x%x\n" )
.LC139:
	ASCII(.string	"slicemsg D[9] addr 0x%x = 0x%x\n" )
.LC146:
	ASCII(.string	"pSlicePara = NULL!\n" )
	.zero	4
.LC148:
	ASCII(.string	"line %d Set slice msg not wrong!\n" )
	.zero	6
.LC150:
	ASCII(.string	"!!! no slice to dec, add up msg report." )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
