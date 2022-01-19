#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal_hevc.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_FillMixRam
	.type	HEVCHAL_FillMixRam, %function
HEVCHAL_FillMixRam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	add	w2, w20, 1023
	mov	w0, 14336
	and	w2, w2, -1024
	movk	w0, 0x2, lsl 16
	add	w3, w2, 98304
	add	w4, w2, 86016
	add	w1, w3, 2048
	add	x3, x19, 768
	add	w5, w2, 2048
	add	w4, w4, 2048
	sub	w0, w0, w20
	stp	w1, w4, [x3, 160]
	stp	w5, w2, [x3, 168]
	add	w0, w0, w2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVCHAL_FillMixRam, .-HEVCHAL_FillMixRam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_WriteCabacTab
	.type	HEVCHAL_WriteCabacTab, %function
HEVCHAL_WriteCabacTab:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC4
	ldr	x5, .LC3
	mov	w3, 16
	mov	w0, 153
	mov	w2, 0
	mov	w8, 0
	mov	w10, w3
	mov	x9, x5
.L3:
	sxtw	x1, w8
	lsl	x7, x1, 7
	add	x7, x7, x1, lsl 5
	b	.L6
	.p2align 3
.L8:
	strb	w1, [x19, x4]
	add	w3, w3, 1
	sub	w0, w0, #16
	cmp	w3, 159
	strb	w0, [x6, 1]
	add	w2, w2, 1
	mov	x4, x5
	add	x0, x7, x3, sxtw
	bgt	.L21
.L11:
	cmp	w2, 464
	ldr	w0, [x5, x0, lsl 2]
	beq	.L7
.L6:
	asr	w1, w0, 4
	cmn	w0, #1
	sbfiz	x4, x2, 1, 32
	and	w0, w0, 15
	add	w1, w1, w1, lsl 2
	add	x6, x19, x4
	sub	w1, w1, #45
	ubfiz	w0, w0, 3, 5
	bne	.L8
	strb	wzr, [x19, x4]
	add	w3, w3, 1
	strb	wzr, [x6, 1]
	cmp	w3, 159
	add	w2, w2, 1
	mov	x4, x5
	add	x0, x7, x3, sxtw
	ble	.L11
.L21:
	add	w8, w8, 1
	cmp	w8, 3
	beq	.L22
	cmp	w8, wzr
	sxtw	x0, w8
	csel	w3, w10, wzr, eq
	lsl	x1, x0, 7
	add	x0, x1, x0, lsl 5
	cmp	w2, 463
	add	x0, x0, x3, sxtw
	mov	x4, x9
	ldr	w0, [x9, x0, lsl 2]
	ble	.L3
	.p2align 2
.L7:
	mov	w3, 157
	ldr	x2, .LC6
	add	x4, x4, 1920
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
.L19:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L22:
	mov	w0, w20
	bl	MEM_Phy2Vir
	mov	x1, x19
	add	x3, x19, 928
	cbz	x0, .L23
	.p2align 2
.L15:
	ldrsb	w2, [x1]
	add	x1, x1, 2
	strb	w2, [x0, 1]
	cmp	x3, x1
	ldrsb	w2, [x1, -1]
	strb	w2, [x0], 2
	bne	.L15
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L23:
	ldr	x3, .LC3
	mov	w1, 166
	ldr	x4, .LC8
	ldr	x2, .LC10
	add	x3, x3, 1920
	bl	dprint_normal
	mov	w0, -1
	b	.L19
	.size	HEVCHAL_WriteCabacTab, .-HEVCHAL_WriteCabacTab
	.align	3
.LC3:
	.xword	.LANCHOR0
	.align	3
.LC4:
	.xword	.LANCHOR1
	.align	3
.LC6:
	.xword	.LC5
	.align	3
.LC8:
	.xword	.LC7
	.align	3
.LC10:
	.xword	.LC9
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_InitHal
	.type	HEVCHAL_InitHal, %function
HEVCHAL_InitHal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 872]
	bl	HEVCHAL_WriteCabacTab
	cbnz	w0, .L29
.L25:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L29:
	ldr	x2, .LC13
	mov	w1, 182
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L25
	.size	HEVCHAL_InitHal, .-HEVCHAL_InitHal
	.align	3
.LC13:
	.xword	.LC12
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_GetVirAddr
	.type	HEVCHAL_GetVirAddr, %function
HEVCHAL_GetVirAddr:
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
	.size	HEVCHAL_GetVirAddr, .-HEVCHAL_GetVirAddr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_GetPhyAddr
	.type	HEVCHAL_GetPhyAddr, %function
HEVCHAL_GetPhyAddr:
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
	.size	HEVCHAL_GetPhyAddr, .-HEVCHAL_GetPhyAddr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_CutSliceChain
	.type	HEVCHAL_CutSliceChain, %function
HEVCHAL_CutSliceChain:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, w19
	bl	MEM_Phy2Vir
	cbz	x0, .L35
	str	wzr, [x0, 252]
	mov	w0, 0
.L34:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L35:
	ldr	x3, .LC16
	mov	w1, 207
	ldr	x4, .LC15
	ldr	x2, .LC17
	add	x3, x3, 1944
	bl	dprint_normal
	mov	w0, -1
	b	.L34
	.size	HEVCHAL_CutSliceChain, .-HEVCHAL_CutSliceChain
	.align	3
.LC15:
	.xword	.LC14
	.align	3
.LC16:
	.xword	.LANCHOR0
	.align	3
.LC17:
	.xword	.LC9
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_WriteQmatrix
	.type	HEVCHAL_WriteQmatrix, %function
HEVCHAL_WriteQmatrix:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w19, w1
	mov	x20, x2
	bl	_mcount
	mov	x0, 0
	cbz	w19, .L36
	.p2align 2
.L40:
	ldr	w3, [x21, x0, lsl 2]
	str	w3, [x20, x0, lsl 2]
	add	x0, x0, 1
	cmp	w19, w0
	bhi	.L40
.L36:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVCHAL_WriteQmatrix, .-HEVCHAL_WriteQmatrix
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_WriteTileInfo
	.type	HEVCHAL_WriteTileInfo, %function
HEVCHAL_WriteTileInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x20, 940]
	bl	MEM_Phy2Vir
	cbz	x0, .L43
	add	x10, x19, 1614
	add	x11, x0, 1024
	mov	x8, x0
.L44:
	add	x3, x8, 4
	add	x9, x8, 516
	mov	x2, x10
	mov	x1, 0
	b	.L48
	.p2align 3
.L60:
	ldrb	w7, [x2, 1]
	add	x3, x3, 4
	ldrb	w6, [x2]
	cmp	x9, x3
	ldrb	w5, [x2, -1]
	add	x2, x2, 4
	ldrb	w4, [x2, -6]
	lsl	w6, w6, 16
	orr	w6, w6, w7, lsl 24
	orr	w4, w4, w5, lsl 8
	orr	w4, w6, w4
	str	w4, [x8, x1]
	add	x1, x1, 4
	beq	.L59
.L48:
	add	w4, w1, 3
	cmp	w4, 255
	ble	.L60
	add	x3, x3, 4
	str	wzr, [x8, x1]
	cmp	x9, x3
	add	x1, x1, 4
	add	x2, x2, 4
	bne	.L48
.L59:
	add	x8, x8, 512
	add	x10, x10, 256
	cmp	x11, x8
	bne	.L44
	add	x3, x0, 1028
	add	x2, x19, 2128
	mov	w1, 0
	b	.L52
	.p2align 3
.L62:
	ldp	w5, w4, [x2, -4]
	add	w1, w1, 1
	add	x3, x3, 4
	cmp	w1, 20
	add	x2, x2, 8
	orr	w4, w5, w4, lsl 16
	str	w4, [x3, -8]
	beq	.L61
.L52:
	cmp	w1, 9
	ble	.L62
	add	w1, w1, 1
	str	wzr, [x3, -4]
	cmp	w1, 20
	add	x3, x3, 4
	add	x2, x2, 8
	bne	.L52
.L61:
	add	x1, x0, 1108
	add	x2, x19, 2208
	mov	w0, 0
	b	.L55
	.p2align 3
.L64:
	ldp	w4, w3, [x2, -4]
	add	w0, w0, 1
	add	x1, x1, 4
	cmp	w0, 22
	add	x2, x2, 8
	orr	w3, w4, w3, lsl 16
	str	w3, [x1, -8]
	beq	.L63
.L55:
	cmp	w0, 10
	ble	.L64
	add	w0, w0, 1
	str	wzr, [x1, -4]
	cmp	w0, 22
	add	x1, x1, 4
	add	x2, x2, 8
	bne	.L55
.L63:
	mov	w0, 0
.L45:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L43:
	ldr	x3, .LC22
	mov	w1, 238
	ldr	x4, .LC21
	mov	w0, 0
	ldr	x2, .LC23
	add	x3, x3, 1968
	bl	dprint_normal
	mov	w0, -1
	b	.L45
	.size	HEVCHAL_WriteTileInfo, .-HEVCHAL_WriteTileInfo
	.align	3
.LC21:
	.xword	.LC20
	.align	3
.LC22:
	.xword	.LANCHOR0
	.align	3
.LC23:
	.xword	.LC9
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_SetPicMsg
	.type	HEVCHAL_SetPicMsg, %function
HEVCHAL_SetPicMsg:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w2
	mov	x24, x1
	str	w3, [x29, 108]
	bl	_mcount
	mov	w0, w20
	bl	MEM_Phy2Vir
	mov	x22, x0
	cbz	x0, .L129
	ldr	x3, .LC28
	mov	x2, 256
	mov	w1, 0
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x2, .LC30
	mov	w1, 316
	mov	w0, 5
	bl	dprint_normal
	ldr	x20, .LC31
	ldrb	w0, [x19, 1]
	ldrb	w4, [x19, 2]
	ldr	w1, [x19, 8]
	ldr	w2, [x19, 16]
	lsl	w4, w4, 24
	orr	w0, w4, w0, lsl 25
	ldrb	w3, [x19, 3]
	ldrb	w4, [x19, 4]
	lsl	w2, w2, 9
	orr	w2, w2, w1, lsl 19
	ldrb	w1, [x19, 5]
	orr	w2, w2, w0
	lsl	w0, w4, 22
	orr	w0, w0, w3, lsl 23
	ldrb	w3, [x19, 12]
	orr	w2, w2, w0
	ldr	x4, [x20, 856]
	lsl	w0, w3, 18
	ldr	w3, [x19, 20]
	orr	w0, w0, w1, lsl 21
	ldr	w1, [x20, 864]
	sub	x4, x22, x4
	orr	w0, w2, w0
	cmp	x4, x1
	orr	w3, w0, w3
	blt	.L68
	mov	w0, 1
	str	w0, [x20, 852]
.L69:
	ldr	x2, .LC33
	mov	w1, 332
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x20, 856]
	add	x0, x22, 1
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	ldr	w3, [x19, 24]
	cmp	x0, x1
	blt	.L70
	mov	w0, 1
	str	w0, [x20, 852]
.L71:
	ldr	x2, .LC35
	mov	w1, 337
	mov	w0, 5
	bl	dprint_normal
	ldp	w3, w0, [x19, 40]
	ldr	w4, [x19, 32]
	ldp	w2, w1, [x19, 48]
	lsl	w3, w3, 24
	lsl	w2, w2, 18
	orr	w3, w3, w4, lsl 29
	orr	w2, w2, w0, lsl 21
	ldp	w4, w0, [x19, 56]
	orr	w3, w3, w2
	lsl	w2, w4, 12
	orr	w1, w2, w1, lsl 15
	ldp	w4, w2, [x19, 64]
	orr	w3, w3, w1
	lsl	w1, w4, 6
	ldr	x4, [x20, 856]
	orr	w0, w1, w0, lsl 9
	ldr	w1, [x19, 72]
	orr	w3, w3, w0
	ldrb	w0, [x19, 36]
	orr	w1, w1, w2, lsl 3
	add	x2, x22, 2
	orr	w1, w3, w1
	sub	x2, x2, x4
	ldrb	w3, [x19, 37]
	ldr	w4, [x20, 864]
	lsl	w3, w3, 27
	cmp	x2, x4
	orr	w0, w3, w0, lsl 28
	orr	w3, w1, w0
	blt	.L72
	mov	w0, 1
	str	w0, [x20, 852]
.L73:
	ldr	x2, .LC37
	mov	w1, 354
	mov	w0, 5
	bl	dprint_normal
	ldp	w4, w3, [x19, 84]
	ldp	w1, w2, [x19, 76]
	ldr	w0, [x19, 92]
	lsl	w3, w3, 8
	orr	w3, w3, w4, lsl 12
	lsl	w2, w2, 16
	ldr	w4, [x19, 96]
	orr	w2, w2, w1, lsl 22
	orr	w3, w3, w2
	ldr	x5, [x20, 856]
	orr	w0, w4, w0, lsl 4
	add	x1, x22, 3
	orr	w3, w3, w0
	ldr	w0, [x20, 864]
	sub	x1, x1, x5
	cmp	x1, x0
	blt	.L74
	mov	w0, 1
	str	w0, [x20, 852]
.L75:
	ldr	x2, .LC39
	mov	w1, 365
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x20, 856]
	add	x0, x22, 4
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	ldr	w3, [x24, 944]
	cmp	x0, x1
	blt	.L76
	mov	w0, 1
	str	w0, [x20, 852]
.L77:
	ldr	x2, .LC41
	mov	w1, 371
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x20, 856]
	add	x0, x22, 5
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	ldr	w3, [x24, 948]
	cmp	x0, x1
	blt	.L78
	mov	w0, 1
	str	w0, [x20, 852]
.L79:
	ldr	x2, .LC43
	mov	w1, 376
	mov	w0, 5
	bl	dprint_normal
	ldr	w1, [x19, 1288]
	add	x0, x22, 6
	ldr	x3, [x20, 856]
	ldr	w2, [x20, 864]
	sub	x0, x0, x3
	add	x1, x19, x1, lsl 2
	cmp	x0, x2
	ldr	w3, [x1, 1468]
	blt	.L80
	mov	w0, 1
	str	w0, [x20, 852]
.L81:
	ldr	x2, .LC45
	mov	w1, 380
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x20, 856]
	add	x0, x22, 7
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	ldr	w3, [x24, 952]
	cmp	x0, x1
	blt	.L82
	mov	w0, 1
	str	w0, [x20, 852]
.L83:
	ldr	x2, .LC47
	mov	w1, 384
	mov	w0, 5
	bl	dprint_normal
	ldr	w21, [x19, 2356]
	ldr	x23, .LC49
	cbz	w21, .L84
	mov	w27, 0
	mov	w26, 1
	b	.L87
	.p2align 3
.L131:
	str	w26, [x20, 852]
	mov	x2, x23
	mov	w1, 390
	mov	w0, 5
	add	w27, w27, 1
	bl	dprint_normal
	ldr	w21, [x19, 2356]
	cmp	w21, w27
	bls	.L130
.L87:
	add	x1, x19, x27, uxtw 2
	add	w0, w27, 8
	lsl	x4, x0, 2
	ldr	x2, [x20, 856]
	sub	x5, x4, x0
	mov	x3, x0
	ldr	w1, [x1, 2292]
	add	x0, x22, x0
	ldr	w6, [x20, 864]
	sub	x2, x0, x2
	add	x1, x19, x1, lsl 2
	cmp	x2, x6
	ldr	w4, [x1, 1336]
	bge	.L131
	str	w4, [x0, x5]
	mov	x2, x23
	mov	w1, 390
	mov	w0, 5
	add	w27, w27, 1
	bl	dprint_normal
	ldr	w21, [x19, 2356]
	cmp	w21, w27
	bhi	.L87
.L130:
	cmp	w21, 15
	bhi	.L93
.L84:
	mov	w26, 1
	b	.L92
	.p2align 3
.L132:
	str	w26, [x20, 852]
	mov	x2, x23
	mov	w1, 397
	mov	w0, 5
	add	w21, w21, 1
	bl	dprint_normal
	cmp	w21, 15
	bhi	.L93
.L92:
	ldr	w0, [x19, 2292]
	add	w2, w21, 8
	ldr	x1, [x20, 856]
	add	x5, x22, x2
	ldr	w6, [x20, 864]
	lsl	x4, x2, 2
	add	x0, x19, x0, lsl 2
	sub	x1, x5, x1
	cmp	x1, x6
	mov	x3, x2
	sub	x2, x4, x2
	ldr	w4, [x0, 1336]
	bge	.L132
	str	w4, [x5, x2]
	mov	w1, 397
	mov	x2, x23
	mov	w0, 5
	add	w21, w21, 1
	bl	dprint_normal
	cmp	w21, 15
	bls	.L92
.L93:
	ldr	x2, [x20, 856]
	add	x0, x22, 25
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	ldr	w3, [x24, 872]
	cmp	x0, x1
	blt	.L133
	mov	w0, 1
	str	w0, [x20, 852]
.L94:
	ldr	x2, .LC51
	mov	w1, 403
	mov	w0, 5
	add	x28, x19, 124
	add	x27, x22, 26
	add	x25, x22, 104
	bl	dprint_normal
	mov	w21, 26
	mov	w26, 1
	b	.L97
	.p2align 3
.L135:
	str	w26, [x20, 852]
.L96:
	mov	w3, w21
	mov	x2, x23
	mov	w1, 410
	mov	w0, 5
	add	w21, w21, 1
	add	x28, x28, 4
	bl	dprint_normal
	add	x27, x27, 1
	cmp	w21, 42
	add	x25, x25, 4
	beq	.L134
.L97:
	ldr	x0, [x20, 856]
	ldr	w1, [x20, 864]
	sub	x0, x27, x0
	ldr	w4, [x28]
	cmp	x0, x1
	bge	.L135
	str	w4, [x25]
	b	.L96
.L134:
	ldr	x2, [x20, 856]
	add	x0, x22, 43
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	ldr	w3, [x24, 932]
	cmp	x0, x1
	blt	.L98
	mov	w0, 1
	str	w0, [x20, 852]
.L99:
	ldr	x2, .LC53
	mov	w1, 416
	mov	w0, 5
	bl	dprint_normal
	ldr	x3, [x20, 856]
	add	x0, x22, 54
	ldr	w2, [x20, 864]
	sub	x0, x0, x3
	ldr	w1, [x19, 188]
	ldr	w3, [x19, 192]
	cmp	x0, x2
	orr	w3, w3, w1, lsl 16
	blt	.L100
	mov	w0, 1
	str	w0, [x20, 852]
.L101:
	ldr	x2, .LC55
	mov	w1, 423
	mov	w0, 5
	bl	dprint_normal
	mov	x1, x24
	mov	x0, x19
	bl	HEVCHAL_WriteTileInfo
	mov	w21, w0
	cbnz	w0, .L136
	ldr	x2, [x20, 856]
	add	x0, x22, 55
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	ldr	w3, [x24, 940]
	cmp	x0, x1
	bge	.L137
	str	w3, [x22, 220]
.L104:
	ldr	x2, .LC59
	mov	w1, 434
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x20, 856]
	add	x0, x22, 56
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	ldr	w3, [x24, 936]
	cmp	x0, x1
	blt	.L105
	mov	w0, 1
	str	w0, [x20, 852]
.L106:
	ldr	x2, .LC61
	mov	w1, 439
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x20, 856]
	add	x0, x22, 57
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	ldr	w3, [x24, 928]
	cmp	x0, x1
	blt	.L107
	mov	w0, 1
	str	w0, [x20, 852]
.L108:
	ldr	x2, .LC63
	mov	w1, 444
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x20, 856]
	add	x0, x22, 58
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	ldr	w3, [x24, 956]
	cmp	x0, x1
	blt	.L109
	mov	w0, 1
	str	w0, [x20, 852]
.L110:
	ldr	x2, .LC65
	mov	w1, 449
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x20, 856]
	add	x0, x22, 59
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	ldr	w3, [x24, 960]
	cmp	x0, x1
	blt	.L111
	mov	w0, 1
	str	w0, [x20, 852]
.L112:
	ldr	x2, .LC67
	mov	w1, 454
	mov	w0, 5
	bl	dprint_normal
	ldrb	w4, [x19, 218]
	ldrb	w0, [x19, 216]
	ldrb	w2, [x19, 219]
	ldrb	w3, [x19, 217]
	lsl	w2, w2, 21
	ldrb	w1, [x19, 220]
	lsl	w3, w3, 23
	orr	w2, w2, w4, lsl 22
	orr	w3, w3, w0, lsl 24
	ldrb	w4, [x19, 232]
	orr	w2, w2, w3
	ldrb	w3, [x19, 233]
	ldrb	w5, [x19, 221]
	lsl	w3, w3, 11
	lsl	w5, w5, 19
	orr	w3, w3, w4, lsl 12
	ldp	w4, w0, [x19, 236]
	orr	w1, w5, w1, lsl 20
	ldr	x5, [x20, 856]
	orr	w2, w2, w1
	and	w0, w0, 31
	ldr	w1, [x19, 224]
	orr	w2, w2, w0
	ldr	w0, [x19, 228]
	lsl	w0, w0, 13
	orr	w0, w0, w1, lsl 16
	ldrb	w1, [x19, 234]
	orr	w3, w3, w0
	ubfiz	w0, w4, 5, 5
	ldr	w4, [x20, 864]
	orr	w0, w0, w1, lsl 10
	add	x1, x22, 60
	sub	x1, x1, x5
	orr	w0, w3, w0
	cmp	x1, x4
	orr	w3, w2, w0
	blt	.L113
	mov	w0, 1
	str	w0, [x20, 852]
.L114:
	ldr	x2, .LC69
	mov	w1, 476
	mov	w0, 5
	bl	dprint_normal
	ldr	x3, [x20, 856]
	add	x0, x22, 61
	ldr	w2, [x20, 864]
	sub	x0, x0, x3
	ldr	w1, [x19, 244]
	ldr	w3, [x19, 248]
	cmp	x0, x2
	orr	w3, w3, w1, lsl 16
	blt	.L115
	mov	w0, 1
	str	w0, [x20, 852]
.L116:
	ldr	x2, .LC71
	mov	w1, 485
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x20, 856]
	add	x0, x22, 63
	ldr	w1, [x20, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L117
	mov	w0, 1
	str	w0, [x20, 852]
.L118:
	ldr	x2, .LC73
	mov	w1, 490
	ldr	w3, [x29, 108]
	mov	w0, 5
	add	x19, x19, 256
	bl	dprint_normal
	mov	x1, x22
	mov	w0, 64
	bl	HEVC_GetVirAddr
	mov	x1, 0
	.p2align 2
.L119:
	ldr	w2, [x19, x1]
	str	w2, [x0, x1]
	add	x1, x1, 4
	cmp	x1, 1024
	bne	.L119
.L67:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L68:
	str	w3, [x22]
	b	.L69
.L133:
	str	w3, [x22, 100]
	b	.L94
.L82:
	str	w3, [x22, 28]
	b	.L83
.L80:
	str	w3, [x22, 24]
	b	.L81
.L78:
	str	w3, [x22, 20]
	b	.L79
.L76:
	str	w3, [x22, 16]
	b	.L77
.L74:
	str	w3, [x22, 12]
	b	.L75
.L72:
	str	w3, [x22, 8]
	b	.L73
.L70:
	str	w3, [x22, 4]
	b	.L71
.L100:
	str	w3, [x22, 216]
	b	.L101
.L98:
	str	w3, [x22, 172]
	b	.L99
.L137:
	mov	w0, 1
	str	w0, [x20, 852]
	b	.L104
.L105:
	str	w3, [x22, 224]
	b	.L106
.L117:
	ldr	w0, [x29, 108]
	str	w0, [x22, 252]
	b	.L118
.L115:
	str	w3, [x22, 244]
	b	.L116
.L113:
	str	w3, [x22, 240]
	b	.L114
.L111:
	str	w3, [x22, 236]
	b	.L112
.L109:
	str	w3, [x22, 232]
	b	.L110
.L107:
	str	w3, [x22, 228]
	b	.L108
.L136:
	ldr	x2, .LC57
	mov	w1, 428
	mov	w0, 1
	mov	w21, -1
	bl	dprint_normal
	b	.L67
.L129:
	ldr	x3, .LC26
	mov	w1, 309
	ldr	x4, .LC25
	mov	w0, 0
	ldr	x2, .LC27
	add	x3, x3, 1992
	mov	w21, -1
	bl	dprint_normal
	b	.L67
	.size	HEVCHAL_SetPicMsg, .-HEVCHAL_SetPicMsg
	.align	3
.LC25:
	.xword	.LC24
	.align	3
.LC26:
	.xword	.LANCHOR0
	.align	3
.LC27:
	.xword	.LC9
	.align	3
.LC28:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC30:
	.xword	.LC29
	.align	3
.LC31:
	.xword	g_HwMem
	.align	3
.LC33:
	.xword	.LC32
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
.LC47:
	.xword	.LC46
	.align	3
.LC49:
	.xword	.LC48
	.align	3
.LC51:
	.xword	.LC50
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_SetSliceMsgStreamAddrInfo
	.type	HEVCHAL_SetSliceMsgStreamAddrInfo, %function
HEVCHAL_SetSliceMsgStreamAddrInfo:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	stp	x1, x0, [x29, 104]
	mov	x0, x30
	mov	x27, x1
	mov	x22, x2
	add	x21, x2, 8
	add	w19, w3, 8
	add	x25, x2, 4
	mov	x20, x2
	bl	_mcount
	ldr	x28, .LC77
	mov	x26, 0
	mov	w23, 0
	mov	x24, x28
.L156:
	cbz	w23, .L158
	ldr	w0, [x27]
	cbz	w0, .L142
.L140:
	ldr	x0, [x28, 856]
	mov	w8, w26
	ldr	w1, [x28, 864]
	sub	x0, x20, x0
	cmp	x0, x1
	blt	.L143
	mov	w0, 1
	str	w0, [x28, 852]
.L144:
	ldr	x2, .LC79
	mov	w3, w8
	ldr	w5, [x22]
	mov	w1, 522
	sub	w4, w19, #8
	mov	w0, 5
	str	w8, [x29, 124]
	bl	dprint_normal
	ldr	x1, [x28, 856]
	add	x0, x20, 1
	ldr	w8, [x29, 124]
	sub	x0, x0, x1
	ldr	w1, [x28, 864]
	cmp	x0, x1
	blt	.L145
	mov	w0, 1
	str	w0, [x28, 852]
.L146:
	ldr	x2, .LC79
	add	w3, w8, 1
	ldr	w5, [x25]
	mov	w1, 526
	sub	w4, w19, #4
	mov	w0, 5
	str	w8, [x29, 124]
	bl	dprint_normal
	ldr	x1, [x28, 856]
	add	x0, x20, 2
	ldr	w8, [x29, 124]
	sub	x0, x0, x1
	ldr	w1, [x28, 864]
	cmp	x0, x1
	blt	.L147
	mov	w0, 1
	str	w0, [x28, 852]
.L148:
	ldr	x2, .LC79
	add	w3, w8, 2
	ldr	w5, [x21]
	mov	w4, w19
	mov	w1, 530
	mov	w0, 5
	bl	dprint_normal
.L149:
	add	w23, w23, 1
	add	x21, x21, 12
	cmp	w23, 2
	add	x22, x22, 12
	add	w19, w19, 12
	add	x25, x25, 12
	add	x26, x26, 3
	add	x20, x20, 3
	add	x27, x27, 4
	bne	.L156
	mov	w0, 0
.L141:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L142:
	ldr	x0, [x24, 856]
	mov	w8, w26
	ldr	w1, [x24, 864]
	sub	x0, x20, x0
	cmp	x0, x1
	blt	.L150
	mov	w0, 1
	str	w0, [x24, 852]
.L151:
	ldr	x2, .LC79
	mov	w3, w8
	ldr	w5, [x22]
	mov	w1, 536
	sub	w4, w19, #8
	mov	w0, 5
	str	w8, [x29, 124]
	bl	dprint_normal
	ldr	x1, [x24, 856]
	add	x0, x20, 1
	ldr	w8, [x29, 124]
	sub	x0, x0, x1
	ldr	w1, [x24, 864]
	cmp	x0, x1
	blt	.L152
	mov	w0, 1
	str	w0, [x24, 852]
.L153:
	ldr	x2, .LC79
	add	w3, w8, 1
	ldr	w5, [x25]
	mov	w1, 540
	sub	w4, w19, #4
	mov	w0, 5
	str	w8, [x29, 124]
	bl	dprint_normal
	ldr	x1, [x24, 856]
	add	x0, x20, 2
	ldr	w8, [x29, 124]
	sub	x0, x0, x1
	ldr	w1, [x24, 864]
	cmp	x0, x1
	blt	.L154
	mov	w0, 1
	str	w0, [x24, 852]
.L155:
	ldr	x2, .LC79
	add	w3, w8, 2
	ldr	w5, [x21]
	mov	w4, w19
	mov	w1, 544
	mov	w0, 5
	bl	dprint_normal
	b	.L149
	.p2align 3
.L143:
	ldr	w0, [x27, 16]
	and	w1, w0, -16
	ldr	x0, [x29, 112]
	ldr	w0, [x0, 1324]
	and	w0, w0, -16
	sub	w0, w1, w0
	str	w0, [x22]
	b	.L144
	.p2align 3
.L154:
	str	wzr, [x21]
	b	.L155
	.p2align 3
.L152:
	str	wzr, [x25]
	b	.L153
	.p2align 3
.L150:
	str	wzr, [x22]
	b	.L151
	.p2align 3
.L147:
	ldr	w0, [x27]
	str	w0, [x21]
	b	.L148
	.p2align 3
.L145:
	ldr	w0, [x27, 16]
	ldr	w1, [x27, 8]
	add	w0, w1, w0, lsl 3
	and	w0, w0, 127
	str	w0, [x25]
	b	.L146
.L158:
	ldr	x0, [x29, 104]
	ldr	w0, [x0]
	cbnz	w0, .L140
	ldr	x3, .LC74
	mov	w1, 511
	ldr	x2, .LC76
	add	x3, x3, 2016
	bl	dprint_normal
	mov	w0, -1
	b	.L141
	.size	HEVCHAL_SetSliceMsgStreamAddrInfo, .-HEVCHAL_SetSliceMsgStreamAddrInfo
	.align	3
.LC74:
	.xword	.LANCHOR0
	.align	3
.LC76:
	.xword	.LC75
	.align	3
.LC77:
	.xword	g_HwMem
	.align	3
.LC79:
	.xword	.LC78
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_SetSliceMsgAPCIndex
	.type	HEVCHAL_SetSliceMsgAPCIndex, %function
HEVCHAL_SetSliceMsgAPCIndex:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	w4, [x19, 68]
	cbz	w4, .L169
	ldr	x8, .LC83
	mov	w1, 15
	mov	w5, 0
	mov	w2, 0
	mov	w9, 1
	mov	x7, x8
	b	.L168
	.p2align 3
.L163:
	cmp	w6, w2
	beq	.L178
.L166:
	add	w2, w2, 1
	cmp	w4, w2
	bls	.L169
.L168:
	add	x3, x19, x2, uxtw 2
	and	w0, w2, 7
	cmp	w0, 7
	lsl	w0, w0, 2
	sub	w6, w4, #1
	ldr	w3, [x3, 372]
	lsl	w0, w3, w0
	orr	w5, w5, w0
	bne	.L163
	ldr	x4, [x7, 856]
	add	x0, x20, x1, sxtw
	ldr	w3, [x7, 864]
	sub	x0, x0, x4
	cmp	x0, x3
	blt	.L164
	str	w9, [x7, 852]
.L165:
	ldr	w4, [x19, 68]
	add	w2, w2, 1
	add	w1, w1, 1
	mov	w5, 0
	cmp	w4, w2
	bhi	.L168
.L169:
	ldr	w4, [x19, 72]
	cbz	w4, .L159
	ldr	x8, .LC83
	mov	w1, 17
	mov	w5, 0
	mov	w2, 0
	mov	w9, 1
	mov	x7, x8
	b	.L175
	.p2align 3
.L170:
	cmp	w6, w2
	beq	.L179
.L173:
	add	w2, w2, 1
	cmp	w4, w2
	bls	.L159
.L175:
	add	x3, x19, x2, uxtw 2
	and	w0, w2, 7
	cmp	w0, 7
	lsl	w0, w0, 2
	sub	w6, w4, #1
	ldr	w3, [x3, 436]
	lsl	w0, w3, w0
	orr	w5, w5, w0
	bne	.L170
	ldr	x4, [x7, 856]
	add	x0, x20, x1, sxtw
	ldr	w3, [x7, 864]
	sub	x0, x0, x4
	cmp	x0, x3
	blt	.L171
	str	w9, [x7, 852]
.L172:
	ldr	w4, [x19, 72]
	add	w2, w2, 1
	add	w1, w1, 1
	mov	w5, 0
	cmp	w4, w2
	bhi	.L175
.L159:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L178:
	ldr	x4, [x8, 856]
	add	x0, x20, x1, sxtw
	ldr	w3, [x8, 864]
	sub	x0, x0, x4
	cmp	x0, x3
	blt	.L167
	str	w9, [x8, 852]
	ldr	w4, [x19, 68]
	b	.L166
	.p2align 3
.L164:
	str	w5, [x20, w1, sxtw 2]
	b	.L165
	.p2align 3
.L167:
	str	w5, [x20, w1, sxtw 2]
	ldr	w4, [x19, 68]
	b	.L166
	.p2align 3
.L179:
	ldr	x4, [x8, 856]
	add	x0, x20, x1, sxtw
	ldr	w3, [x8, 864]
	sub	x0, x0, x4
	cmp	x0, x3
	blt	.L174
	str	w9, [x8, 852]
	ldr	w4, [x19, 72]
	b	.L173
	.p2align 3
.L171:
	str	w5, [x20, w1, sxtw 2]
	b	.L172
	.p2align 3
.L174:
	str	w5, [x20, w1, sxtw 2]
	ldr	w4, [x19, 72]
	b	.L173
	.size	HEVCHAL_SetSliceMsgAPCIndex, .-HEVCHAL_SetSliceMsgAPCIndex
	.align	3
.LC83:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_SetSliceMsgWPInfo
	.type	HEVCHAL_SetSliceMsgWPInfo, %function
HEVCHAL_SetSliceMsgWPInfo:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	mov	x21, x2
	mov	x19, x1
	bl	_mcount
	mov	x1, x21
	mov	w0, 64
	bl	HEVC_GetVirAddr
	mov	x20, x0
	mov	x1, x21
	mov	w0, 128
	bl	HEVC_GetVirAddr
	ldrb	w1, [x22, 37]
	cbz	w1, .L181
	ldr	w1, [x19, 76]
	cmp	w1, 1
	beq	.L182
.L181:
	ldrb	w1, [x22, 36]
	cmp	w1, 1
	beq	.L212
.L180:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L212:
	ldr	w1, [x19, 76]
	cbnz	w1, .L180
	ldr	w1, [x19, 68]
	mov	w4, 0
	cbz	w1, .L201
.L200:
	ldr	x2, .LC87
	mov	w9, 1
	b	.L192
	.p2align 3
.L214:
	add	x7, x0, x1
	str	w9, [x2, 852]
	sub	x10, x7, x3
	lsl	x6, x1, 2
	cmp	x10, x5
	add	x8, x19, x1, lsl 3
	sub	x6, x6, x1
	blt	.L188
.L215:
	add	w6, w4, 32
	str	w9, [x2, 852]
	add	x8, x0, x6
	lsl	x7, x6, 2
	sub	x3, x8, x3
	add	x1, x19, x1, lsl 3
	cmp	x3, x5
	sub	x6, x7, x6
	blt	.L190
.L216:
	str	w9, [x2, 852]
	add	w4, w4, 1
	ldr	w1, [x19, 68]
	cmp	w1, w4
	bls	.L213
.L192:
	uxtw	x1, w4
	ldr	x3, [x2, 856]
	add	x7, x20, x1
	ldr	w5, [x2, 864]
	sub	x8, x7, x3
	lsl	x6, x1, 2
	cmp	x8, x5
	add	x10, x19, x6
	sub	x6, x6, x1
	bge	.L214
	ldrb	w8, [x10, 716]
	ldr	w5, [x10, 588]
	ldr	w3, [x19, 580]
	ubfiz	w5, w5, 3, 9
	orr	w5, w5, w8, lsl 12
	and	w3, w3, 7
	orr	w3, w5, w3
	str	w3, [x7, x6]
	add	x7, x0, x1
	lsl	x6, x1, 2
	ldr	x3, [x2, 856]
	add	x8, x19, x1, lsl 3
	ldr	w5, [x2, 864]
	sub	x6, x6, x1
	sub	x10, x7, x3
	cmp	x10, x5
	bge	.L215
.L188:
	ldr	w5, [x8, 844]
	add	x1, x19, x1, lsl 3
	ldrb	w8, [x8, 1100]
	ldr	w3, [x19, 584]
	ubfiz	w5, w5, 3, 9
	orr	w5, w5, w8, lsl 12
	and	w3, w3, 7
	orr	w3, w5, w3
	str	w3, [x7, x6]
	add	w6, w4, 32
	ldr	x3, [x2, 856]
	add	x8, x0, x6
	ldr	w5, [x2, 864]
	lsl	x7, x6, 2
	sub	x3, x8, x3
	sub	x6, x7, x6
	cmp	x3, x5
	bge	.L216
.L190:
	ldrb	w3, [x1, 1104]
	add	w4, w4, 1
	ldr	w1, [x1, 848]
	and	w1, w1, 511
	orr	w1, w1, w3, lsl 9
	str	w1, [x8, x6]
	ldr	w1, [x19, 68]
	cmp	w1, w4
	bhi	.L192
.L213:
	ldr	w1, [x19, 76]
	cbnz	w1, .L180
.L201:
	ldr	w1, [x19, 72]
	cbz	w1, .L180
	ldr	x2, .LC87
	mov	w3, 0
	mov	w9, 1
	b	.L199
	.p2align 3
.L217:
	lsl	x6, x1, 2
	str	w9, [x2, 852]
	sub	x6, x6, x1
	add	x1, x0, x1
	sub	x7, x1, x4
	add	x8, x19, x3, uxtw 3
	cmp	x7, x5
	blt	.L195
.L218:
	add	w1, w3, 48
	str	w9, [x2, 852]
	add	x7, x0, x1
	lsl	x6, x1, 2
	sub	x4, x7, x4
	add	x8, x19, x3, uxtw 3
	cmp	x4, x5
	sub	x1, x6, x1
	blt	.L197
.L219:
	str	w9, [x2, 852]
.L198:
	ldr	w1, [x19, 72]
	add	w3, w3, 1
	cmp	w1, w3
	bls	.L180
.L199:
	add	w1, w3, 16
	ldr	x4, [x2, 856]
	lsl	x5, x1, 2
	add	x7, x20, x1
	sub	x6, x5, x1
	ldr	w5, [x2, 864]
	sub	x8, x7, x4
	add	x10, x19, x3, uxtw 2
	cmp	x8, x5
	bge	.L217
	ldrb	w8, [x10, 780]
	ldr	w4, [x10, 652]
	ubfiz	w4, w4, 3, 9
	orr	w5, w4, w8, lsl 12
	ldr	w4, [x19, 580]
	add	x8, x19, x3, uxtw 3
	and	w4, w4, 7
	orr	w4, w5, w4
	str	w4, [x7, x6]
	lsl	x6, x1, 2
	ldr	x4, [x2, 856]
	sub	x6, x6, x1
	ldr	w5, [x2, 864]
	add	x1, x0, x1
	sub	x7, x1, x4
	cmp	x7, x5
	bge	.L218
.L195:
	ldrb	w7, [x8, 1228]
	ldr	w4, [x8, 972]
	add	x8, x19, x3, uxtw 3
	ubfiz	w4, w4, 3, 9
	orr	w5, w4, w7, lsl 12
	ldr	w4, [x19, 584]
	and	w4, w4, 7
	orr	w4, w5, w4
	str	w4, [x1, x6]
	add	w1, w3, 48
	ldr	x4, [x2, 856]
	add	x7, x0, x1
	ldr	w5, [x2, 864]
	lsl	x6, x1, 2
	sub	x4, x7, x4
	sub	x1, x6, x1
	cmp	x4, x5
	bge	.L219
.L197:
	ldrb	w5, [x8, 1232]
	ldr	w4, [x8, 976]
	and	w4, w4, 511
	orr	w4, w4, w5, lsl 9
	str	w4, [x7, x1]
	b	.L198
	.p2align 3
.L182:
	ldr	w1, [x19, 68]
	mov	w4, 0
	cbnz	w1, .L200
	b	.L180
	.size	HEVCHAL_SetSliceMsgWPInfo, .-HEVCHAL_SetSliceMsgWPInfo
	.align	3
.LC87:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_SetSliceMsg
	.type	HEVCHAL_SetSliceMsg, %function
HEVCHAL_SetSliceMsg:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	mov	w27, w3
	mov	x24, x2
	mov	w22, w4
	mov	w26, w5
	mov	w25, w6
	mov	w23, w7
	bl	_mcount
	ldr	x19, .LC88
	mov	w0, w27
	ldr	x1, [x19, 2056]
	str	x1, [x29, 96]
	ldr	w1, [x19, 2064]
	str	w1, [x29, 104]
	bl	MEM_Phy2Vir
	mov	x20, x0
	cbz	x0, .L264
	ldr	x1, .LC92
	mov	x2, 1024
	ldr	x3, [x1, 96]
	mov	w1, 0
	blr	x3
	ldr	x2, .LC94
	mov	w1, 699
	mov	w0, 5
	bl	dprint_normal
	mov	w3, w27
	mov	x2, x20
	mov	x1, x24
	mov	x0, x21
	bl	HEVCHAL_SetSliceMsgStreamAddrInfo
	cmn	w0, #1
	beq	.L222
	ldrb	w3, [x24, 24]
	ldrb	w1, [x24, 25]
	ldr	w0, [x24, 28]
	lsl	w1, w1, 26
	ldr	x19, .LC95
	orr	w1, w1, w3, lsl 27
	ubfiz	w3, w0, 19, 7
	ldrb	w0, [x24, 32]
	ldr	w2, [x24, 36]
	orr	w0, w3, w0, lsl 18
	orr	w1, w1, w2
	orr	w3, w1, w0
	ldr	x1, [x19, 856]
	add	x0, x20, 6
	sub	x0, x0, x1
	ldr	w1, [x19, 864]
	cmp	x0, x1
	bge	.L265
	str	w3, [x20, 24]
.L224:
	ldr	x2, .LC96
	mov	w1, 721
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x24, 60]
	add	x1, x29, 112
	ldr	w2, [x24, 72]
	ldr	w4, [x24, 44]
	lsl	w2, w2, 8
	orr	w5, w2, w0, lsl 16
	ldr	w0, [x24, 76]
	add	x0, x1, x0, lsl 2
	ldr	w1, [x24, 56]
	lsl	w1, w1, 20
	ldr	w3, [x0, -16]
	orr	w1, w1, w4, lsl 24
	ldr	w0, [x24, 68]
	orr	w2, w5, w1
	ldrb	w1, [x24, 52]
	ldr	x4, [x19, 856]
	orr	w0, w3, w0, lsl 2
	orr	w3, w2, w0
	ldrb	w2, [x24, 64]
	lsl	w2, w2, 15
	orr	w0, w2, w1, lsl 27
	ldr	w1, [x24, 40]
	orr	w2, w3, w0
	ldrb	w3, [x24, 65]
	lsl	w3, w3, 14
	orr	w0, w3, w1, lsl 28
	ldr	w1, [x19, 864]
	orr	w3, w2, w0
	add	x0, x20, 7
	sub	x0, x0, x4
	cmp	x0, x1
	blt	.L225
	mov	w0, 1
	str	w0, [x19, 852]
.L226:
	ldr	x2, .LC97
	mov	w1, 736
	mov	w0, 5
	bl	dprint_normal
	ldr	x1, [x19, 856]
	add	x0, x20, 8
	sub	x0, x0, x1
	ldr	w1, [x19, 864]
	cmp	x0, x1
	blt	.L227
	mov	w0, 1
	str	w0, [x19, 852]
.L228:
	ldr	x2, .LC99
	mov	w3, w26
	mov	w1, 741
	mov	w0, 5
	bl	dprint_normal
	ldr	w0, [x21, 20]
	ldr	x1, [x19, 856]
	add	w0, w0, 1
	udiv	w3, w26, w0
	msub	w0, w3, w0, w26
	orr	w3, w0, w3, lsl 16
	add	x0, x20, 9
	sub	x0, x0, x1
	ldr	w1, [x19, 864]
	cmp	x0, x1
	blt	.L229
	mov	w0, 1
	str	w0, [x19, 852]
.L230:
	ldr	x2, .LC101
	mov	w1, 750
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x20, 10
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L231
	mov	w0, 1
	str	w0, [x19, 852]
.L232:
	ldr	x2, .LC103
	mov	w3, w25
	mov	w1, 755
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x20, 11
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x24, 96]
	cmp	x0, x1
	ldr	w0, [x24, 100]
	ubfiz	w3, w3, 8, 5
	and	w0, w0, 31
	orr	w3, w3, w0
	blt	.L233
	mov	w0, 1
	str	w0, [x19, 852]
.L234:
	ldr	x2, .LC105
	mov	w1, 763
	mov	w0, 5
	bl	dprint_normal
	ldp	w3, w2, [x24, 104]
	ldrb	w0, [x24, 113]
	ldrb	w1, [x24, 112]
	ubfiz	w2, w2, 8, 4
	ldr	x4, [x19, 856]
	ubfiz	w3, w3, 16, 4
	orr	w3, w3, w2
	lsl	w1, w1, 2
	add	x2, x20, 12
	orr	w1, w1, w0, lsl 3
	sub	x2, x2, x4
	ldrb	w0, [x24, 114]
	ldr	w4, [x19, 864]
	orr	w1, w3, w1
	ldrb	w3, [x24, 115]
	cmp	x2, x4
	orr	w0, w3, w0, lsl 1
	orr	w3, w1, w0
	blt	.L235
	mov	w0, 1
	str	w0, [x19, 852]
.L236:
	ldr	x2, .LC107
	mov	w1, 775
	mov	w0, 5
	bl	dprint_normal
	ldr	w4, [x24, 68]
	cbz	w4, .L260
	add	x2, x24, 116
	mov	w3, 0
	mov	w0, 0
	.p2align 2
.L238:
	ldr	w1, [x2], 4
	lsl	w1, w1, w0
	add	w0, w0, 1
	cmp	w0, w4
	orr	w3, w3, w1
	bne	.L238
.L237:
	ldr	x2, [x19, 856]
	add	x0, x20, 13
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L239
	mov	w0, 1
	str	w0, [x19, 852]
.L240:
	ldr	x2, .LC109
	mov	w1, 786
	mov	w0, 5
	bl	dprint_normal
	ldr	w4, [x24, 72]
	cbz	w4, .L261
	add	x2, x24, 180
	mov	w3, 0
	mov	w0, 0
	.p2align 2
.L242:
	ldr	w1, [x2], 4
	lsl	w1, w1, w0
	add	w0, w0, 1
	cmp	w0, w4
	orr	w3, w3, w1
	bne	.L242
.L241:
	ldr	x2, [x19, 856]
	add	x0, x20, 14
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L243
	mov	w0, 1
	str	w0, [x19, 852]
.L244:
	ldr	x2, .LC111
	mov	w1, 795
	mov	w0, 5
	bl	dprint_normal
	mov	x1, x20
	mov	x0, x24
	bl	HEVCHAL_SetSliceMsgAPCIndex
	ldr	x2, [x19, 856]
	add	x0, x20, 23
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	ldr	w3, [x24, 564]
	cmp	x0, x1
	blt	.L245
	mov	w0, 1
	str	w0, [x19, 852]
.L246:
	ldr	x2, .LC113
	mov	w1, 802
	mov	w0, 5
	bl	dprint_normal
	ldr	x0, [x19, 856]
	add	x1, x20, 24
	ldr	w3, [x21, 80]
	ldr	w2, [x19, 864]
	sub	x1, x1, x0
	lsr	w0, w3, 1
	mov	w3, 16394
	cmp	x1, x2
	orr	w3, w3, w0, lsl 8
	blt	.L247
	mov	w0, 1
	str	w0, [x19, 852]
.L248:
	ldr	x2, .LC115
	mov	w1, 810
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x20, 25
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L249
	mov	w0, 1
	str	w0, [x19, 852]
.L250:
	ldr	x2, .LC116
	mov	w1, 946
	mov	w3, 0
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x20, 37
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L251
	mov	w0, 1
	str	w0, [x19, 852]
.L252:
	ldr	x2, .LC118
	mov	w1, 951
	mov	w3, 134217728
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x20, 43
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L253
	mov	w0, 1
	str	w0, [x19, 852]
.L254:
	ldr	x2, .LC119
	mov	w1, 956
	mov	w3, w23
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x20, 44
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L255
	mov	w0, 1
	str	w0, [x19, 852]
.L256:
	ldr	x2, .LC121
	mov	w1, 960
	ldr	w3, [x29, 112]
	mov	w0, 5
	bl	dprint_normal
	ldr	x2, [x19, 856]
	add	x0, x20, 63
	ldr	w1, [x19, 864]
	sub	x0, x0, x2
	cmp	x0, x1
	blt	.L257
	mov	w0, 1
	str	w0, [x19, 852]
.L258:
	ldr	x2, .LC122
	mov	w3, w22
	mov	w1, 994
	mov	w0, 5
	bl	dprint_normal
	mov	x0, x21
	mov	x2, x20
	mov	x1, x24
	bl	HEVCHAL_SetSliceMsgWPInfo
	mov	w0, 0
.L222:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L265:
	mov	w0, 1
	str	w0, [x19, 852]
	b	.L224
	.p2align 3
.L239:
	str	w3, [x20, 52]
	b	.L240
	.p2align 3
.L227:
	str	w26, [x20, 32]
	b	.L228
	.p2align 3
.L225:
	str	w3, [x20, 28]
	b	.L226
	.p2align 3
.L235:
	str	w3, [x20, 48]
	b	.L236
	.p2align 3
.L233:
	str	w3, [x20, 44]
	b	.L234
	.p2align 3
.L231:
	str	w25, [x20, 40]
	b	.L232
	.p2align 3
.L229:
	str	w3, [x20, 36]
	b	.L230
	.p2align 3
.L257:
	str	w22, [x20, 252]
	b	.L258
	.p2align 3
.L255:
	ldr	w0, [x29, 112]
	str	w0, [x20, 176]
	b	.L256
	.p2align 3
.L253:
	str	w23, [x20, 172]
	b	.L254
	.p2align 3
.L251:
	mov	w0, 134217728
	str	w0, [x20, 148]
	b	.L252
	.p2align 3
.L249:
	str	wzr, [x20, 100]
	b	.L250
	.p2align 3
.L247:
	str	w3, [x20, 96]
	b	.L248
	.p2align 3
.L245:
	str	w3, [x20, 92]
	b	.L246
	.p2align 3
.L243:
	str	w3, [x20, 56]
	b	.L244
.L260:
	mov	w3, 0
	b	.L237
.L261:
	mov	w3, 0
	b	.L241
.L264:
	ldr	x4, .LC90
	add	x3, x19, 2072
	ldr	x2, .LC91
	mov	w1, 694
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L222
	.size	HEVCHAL_SetSliceMsg, .-HEVCHAL_SetSliceMsg
	.align	3
.LC88:
	.xword	.LANCHOR0
	.align	3
.LC90:
	.xword	.LC89
	.align	3
.LC91:
	.xword	.LC9
	.align	3
.LC92:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC94:
	.xword	.LC93
	.align	3
.LC95:
	.xword	g_HwMem
	.align	3
.LC96:
	.xword	.LC44
	.align	3
.LC97:
	.xword	.LC46
	.align	3
.LC99:
	.xword	.LC98
	.align	3
.LC101:
	.xword	.LC100
	.align	3
.LC103:
	.xword	.LC102
	.align	3
.LC105:
	.xword	.LC104
	.align	3
.LC107:
	.xword	.LC106
	.align	3
.LC109:
	.xword	.LC108
	.align	3
.LC111:
	.xword	.LC110
	.align	3
.LC113:
	.xword	.LC112
	.align	3
.LC115:
	.xword	.LC114
	.align	3
.LC116:
	.xword	.LC50
	.align	3
.LC118:
	.xword	.LC117
	.align	3
.LC119:
	.xword	.LC52
	.align	3
.LC121:
	.xword	.LC120
	.align	3
.LC122:
	.xword	.LC72
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_CheckParaValid
	.type	HEVCHAL_CheckParaValid, %function
HEVCHAL_CheckParaValid:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 2356]
	cmp	w0, 16
	bhi	.L269
	mov	w0, 0
.L267:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L269:
	ldr	x3, .LC125
	mov	w1, 1004
	ldr	x4, .LC124
	mov	w0, 0
	ldr	x2, .LC126
	add	x3, x3, 2096
	bl	dprint_normal
	mov	w0, -1
	b	.L267
	.size	HEVCHAL_CheckParaValid, .-HEVCHAL_CheckParaValid
	.align	3
.LC124:
	.xword	.LC123
	.align	3
.LC125:
	.xword	.LANCHOR0
	.align	3
.LC126:
	.xword	.LC9
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_CheckSlicePara
	.type	HEVCHAL_CheckSlicePara, %function
HEVCHAL_CheckSlicePara:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w21, w1
	mov	w20, w2
	bl	_mcount
	cbz	x19, .L275
	ldr	w3, [x19, 92]
	mov	w0, 0
	cmp	w3, w20
	ccmp	w21, wzr, 4, cc
	cset	w1, gt
	cbnz	w1, .L276
.L272:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L276:
	ldr	x2, .LC131
	mov	w4, w20
	mov	w1, 1019
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L272
.L275:
	ldr	x3, .LC127
	mov	w4, w21
	ldr	x2, .LC129
	mov	w1, 1013
	add	x3, x3, 2120
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L272
	.size	HEVCHAL_CheckSlicePara, .-HEVCHAL_CheckSlicePara
	.align	3
.LC127:
	.xword	.LANCHOR0
	.align	3
.LC129:
	.xword	.LC128
	.align	3
.LC131:
	.xword	.LC130
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_FindNextSlicePara
	.type	HEVCHAL_FindNextSlicePara, %function
HEVCHAL_FindNextSlicePara:
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
	ldr	w1, [x19, 92]
	cmp	w20, w21
	str	w20, [x22]
	bge	.L278
	ldr	x19, [x19, 1360]
	cbz	x19, .L281
	ldr	w0, [x19, 92]
	cmp	w1, w0
	bcc	.L278
	add	w2, w20, 1
	b	.L280
	.p2align 3
.L282:
	ldr	x19, [x19, 1360]
	cbz	x19, .L281
	ldr	w0, [x19, 92]
	cmp	w1, w0
	bcc	.L278
.L280:
	cmp	w2, w21
	str	w2, [x22]
	add	w2, w2, 1
	bne	.L282
.L278:
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L281:
	mov	x19, 0
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVCHAL_FindNextSlicePara, .-HEVCHAL_FindNextSlicePara
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_CheckSliceAddrValid
	.type	HEVCHAL_CheckSliceAddrValid, %function
HEVCHAL_CheckSliceAddrValid:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w21, w1
	mov	w19, w2
	bl	_mcount
	cmp	w21, w19
	ldr	w4, [x20, 572]
	bgt	.L288
	cmp	w19, w4
	blt	.L288
	ldr	w3, [x20, 92]
	mov	w0, 0
	cmp	w3, w4
	bhi	.L292
.L290:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L288:
	ldr	x2, .LC133
	mov	w5, w19
	mov	w3, w21
	mov	w1, 1051
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L290
	.p2align 3
.L292:
	ldr	x2, .LC135
	mov	w1, 1057
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L290
	.size	HEVCHAL_CheckSliceAddrValid, .-HEVCHAL_CheckSliceAddrValid
	.align	3
.LC133:
	.xword	.LC132
	.align	3
.LC135:
	.xword	.LC134
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_SetSliceMsgSedOnly
	.type	HEVCHAL_SetSliceMsgSedOnly, %function
HEVCHAL_SetSliceMsgSedOnly:
	sub	sp, sp, #80
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	stp	x23, x24, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	mov	x23, x1
	bl	_mcount
	ldr	w3, [x22, 2360]
	ldr	x1, [x22, 2368]
	cmp	w3, wzr
	ble	.L294
	mov	w0, 0
	mov	w24, 0
	mov	x19, 0
	.p2align 2
.L296:
	ldrb	w2, [x1, 25]
	cmp	w2, wzr
	csel	w24, w24, w0, ne
	add	w0, w0, 1
	csel	x19, x19, x1, ne
	cmp	w0, w3
	ldr	x1, [x1, 1360]
	bne	.L296
	cbz	x19, .L294
	sub	w0, w0, w24
	mov	w20, 0
	cmp	w0, wzr
	mov	w21, 198
	bgt	.L307
	b	.L303
	.p2align 3
.L313:
	ldr	x2, [x19, 1360]
	ldrb	w8, [x22, 221]
	ldr	w4, [x1, 24]
	ldr	w0, [x2, 92]
	sub	w0, w0, #1
	mov	w7, w0
	cbz	w8, .L300
	ldr	w7, [x2, 568]
.L300:
	str	w0, [sp]
	mov	x2, x19
	mov	x1, x23
	mov	x0, x22
	add	w20, w20, 1
	bl	HEVCHAL_SetSliceMsg
	cbnz	w0, .L312
.L301:
	ldr	w0, [x22, 2360]
	ldr	x19, [x19, 1360]
	sub	w0, w0, w24
	cmp	w0, w20
	ble	.L303
.L307:
	add	w1, w20, 6
	sub	w0, w0, #1
	cmp	w0, w20
	mov	w0, w1
	add	w2, w20, 7
	ccmp	w20, w21, 0, gt
	add	x0, x23, x0, sxtw 2
	mov	w1, w2
	mov	w4, 0
	ldr	w5, [x19, 80]
	add	x1, x23, x1, sxtw 2
	ldr	w6, [x19, 92]
	ldr	w3, [x0, 24]
	ble	.L313
	ldp	w1, w0, [x22, 16]
	mov	x2, x19
	add	w20, w20, 1
	madd	w0, w1, w0, w0
	add	w0, w0, w1
	mov	x1, x23
	mov	w7, w0
	str	w0, [sp]
	mov	x0, x22
	bl	HEVCHAL_SetSliceMsg
	cbz	w0, .L301
.L312:
	ldr	x3, .LC136
	mov	w1, 1127
	ldr	x2, .LC140
	mov	w0, 1
	add	x3, x3, 2144
	bl	dprint_normal
	add	sp, x29, 0
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L303:
	mov	w0, 0
.L298:
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L294:
	ldr	x3, .LC136
	mov	w1, 1092
	ldr	x2, .LC138
	mov	w0, 1
	add	x3, x3, 2144
	bl	dprint_normal
	mov	w0, -1
	b	.L298
	.size	HEVCHAL_SetSliceMsgSedOnly, .-HEVCHAL_SetSliceMsgSedOnly
	.align	3
.LC136:
	.xword	.LANCHOR0
	.align	3
.LC138:
	.xword	.LC137
	.align	3
.LC140:
	.xword	.LC139
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCHAL_StartDec
	.type	HEVCHAL_StartDec, %function
HEVCHAL_StartDec:
	sub	sp, sp, #160
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	stp	x23, x24, [sp, 64]
	stp	x25, x26, [sp, 80]
	stp	x27, x28, [sp, 96]
	sxtw	x1, w1
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	str	x1, [x29, 104]
	lsl	x24, x19, 7
	bl	_mcount
	sub	x24, x24, x19
	ldr	w0, [x20, 2356]
	cmp	w0, 16
	ldr	x0, .LC141
	add	x0, x0, x24, lsl 3
	str	x0, [x29, 112]
	bhi	.L362
	ldr	x0, [x29, 112]
	mov	x1, x0
	ldr	w2, [x0, 40]
	ldr	w3, [x0, 48]
	mov	x0, x20
	bl	HEVCHAL_SetPicMsg
	ldr	x19, [x20, 2368]
	cbz	x19, .L363
	ldr	w0, [x20, 4932]
	cmp	w0, 1
	beq	.L364
	ldr	w21, [x19, 92]
	cbnz	w21, .L365
	mov	x28, x19
	str	wzr, [x29, 100]
.L318:
	ldp	w21, w0, [x20, 16]
	ldr	w1, [x20, 2360]
	madd	w0, w21, w0, w0
	cmp	w1, wzr
	add	w21, w0, w21
	ble	.L321
	ldr	w0, [x29, 100]
	mov	w2, 0
	mov	w22, 0
	mov	w19, 0
	add	w1, w0, 6
	add	w0, w0, 2
	stp	w0, w1, [x29, 128]
	ldr	x1, [x29, 104]
	lsl	x25, x1, 7
	sub	x25, x25, x1
	lsl	x1, x25, 1
	str	x1, [x29, 120]
	.p2align 2
.L336:
	ldr	w0, [x29, 132]
	mov	w1, w19
	ldr	x4, [x29, 120]
	add	w3, w19, w0
	mov	x0, x28
	add	x3, x4, x3, sxtw
	ldr	x4, .LC141
	add	x3, x4, x3, lsl 2
	ldr	w23, [x3, 24]
	bl	HEVCHAL_CheckSlicePara
	cmn	w0, #1
	beq	.L334
	ldr	w2, [x20, 2360]
	add	w0, w19, 1
	ldr	w27, [x28, 80]
	cmp	w2, w0
	ldr	w6, [x28, 92]
	ble	.L341
	ldr	x24, [x28, 1360]
	cbnz	x24, .L360
	b	.L324
	.p2align 3
.L366:
	add	w0, w0, 1
	cmp	w2, w0
	ble	.L323
	ldr	x24, [x24, 1360]
	cbz	x24, .L324
.L360:
	ldr	w1, [x24, 92]
	cmp	w6, w1
	bcs	.L366
.L329:
	cmp	w2, w0
	beq	.L330
	ldr	w1, [x29, 128]
	add	w19, w1, w19
	add	w19, w19, 1
	cmp	w19, 201
	bgt	.L330
	ldr	w3, [x24, 92]
	ldrb	w1, [x20, 221]
	sub	w26, w3, #1
	mov	w7, w26
	cbz	w1, .L333
	ldr	w7, [x24, 568]
.L333:
	ldr	w1, [x29, 132]
	mov	w19, w0
	mov	w2, w21
	add	w1, w1, w0
	ldr	x0, [x29, 120]
	stp	w6, w7, [x29, 136]
	add	x0, x0, x1, sxtw
	ldr	x1, .LC141
	add	x0, x1, x0, lsl 2
	mov	w1, w7
	ldr	w25, [x0, 24]
	mov	x0, x28
	str	w26, [x28, 572]
	bl	HEVCHAL_CheckSliceAddrValid
	cmn	w0, #1
	beq	.L334
.L370:
	ldp	w6, w7, [x29, 136]
	ldr	x1, [x29, 112]
	mov	w3, w23
	mov	w5, w27
	mov	w4, w25
	mov	x2, x28
	mov	x0, x20
	str	w26, [sp]
	bl	HEVCHAL_SetSliceMsg
	mov	w23, w0
	cbnz	w0, .L367
	ldr	w0, [x20, 2360]
	add	w22, w22, 1
	ldr	w2, [x28, 572]
	cmp	w19, w0
	bge	.L368
	mov	x28, x24
	b	.L336
.L365:
	ldrb	w0, [x20, 221]
	sub	w1, w21, #1
	mov	w7, w1
	cbz	w0, .L319
	ldr	w7, [x19, 568]
.L319:
	ldr	x2, [x29, 104]
	mov	w22, 1
	ldp	w9, w8, [x19]
	lsl	x0, x2, 7
	mov	w6, 0
	stp	w22, wzr, [x19]
	ldp	w28, w27, [x19, 8]
	sub	x0, x0, x2
	ldr	x2, .LC141
	stp	wzr, wzr, [x19, 8]
	add	x0, x2, x0, lsl 3
	mov	w5, 0
	ldr	w2, [x20, 1324]
	ldp	w25, w23, [x19, 16]
	stp	w2, wzr, [x19, 16]
	mov	x2, x19
	ldp	w3, w4, [x0, 48]
	str	w1, [sp]
	mov	x0, x20
	ldr	x1, [x29, 112]
	stp	w9, w8, [x29, 136]
	bl	HEVCHAL_SetSliceMsg
	ldp	w9, w8, [x29, 136]
	cbnz	w0, .L369
	stp	w9, w8, [x19]
	stp	w28, w27, [x19, 8]
	stp	w25, w23, [x19, 16]
	str	w21, [x19, 92]
	str	w22, [x29, 100]
	ldr	x28, [x20, 2368]
	b	.L318
	.p2align 3
.L330:
	str	xzr, [x28, 1360]
	mov	w7, w21
	mov	w26, w21
	mov	w2, w21
	ldr	w19, [x20, 2360]
	mov	w1, w7
	mov	x0, x28
	str	w26, [x28, 572]
	stp	w6, w7, [x29, 136]
	bl	HEVCHAL_CheckSliceAddrValid
	cmn	w0, #1
	mov	w25, 0
	bne	.L370
.L334:
	mov	w23, -1
.L358:
	add	sp, x29, 0
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
.L341:
	mov	x24, x28
	.p2align 2
.L323:
	cbnz	x24, .L329
	.p2align 2
.L324:
	ldr	x3, .LC143
	mov	w1, 1248
	ldr	x2, .LC149
	mov	w0, 1
	add	x3, x3, 2176
	mov	w23, -1
	bl	dprint_normal
	b	.L358
.L362:
	ldr	x3, .LC143
	mov	w1, 1004
	ldr	x4, .LC142
	mov	w0, 0
	ldr	x2, .LC144
	add	x3, x3, 2096
	mov	w23, -1
	bl	dprint_normal
	b	.L358
.L367:
	ldr	x3, .LC143
	mov	w1, 1279
	ldr	x2, .LC151
	mov	w0, 1
	add	x3, x3, 2176
	mov	w23, -1
	bl	dprint_normal
	b	.L358
.L368:
	cmp	w0, wzr
	ccmp	w22, wzr, 4, gt
	ble	.L321
	ldr	w1, [x29, 100]
	ldr	x2, [x29, 104]
	add	w0, w1, w0
	lsl	x1, x2, 7
	add	w0, w0, 5
	sub	x1, x1, x2
	lsl	x1, x1, 1
	add	x0, x1, x0, sxtw
	ldr	x1, .LC141
	add	x26, x1, x0, lsl 2
	ldr	w0, [x26, 24]
	bl	HEVCHAL_CutSliceChain
	b	.L358
.L364:
	ldr	x1, [x29, 112]
	mov	x0, x20
	bl	HEVCHAL_SetSliceMsgSedOnly
	mov	w23, w0
	b	.L358
.L321:
	ldr	x2, .LC153
	mov	w1, 1294
	mov	w0, 1
	mov	w23, -1
	bl	dprint_normal
	b	.L358
.L369:
	ldr	x3, .LC143
	mov	w1, 1210
	ldr	x2, .LC147
	mov	w0, w22
	add	x3, x3, 2176
	mov	w23, -1
	bl	dprint_normal
	b	.L358
.L363:
	ldr	x3, .LC143
	mov	w1, 1171
	ldr	x2, .LC146
	mov	w0, 0
	add	x3, x3, 2176
	mov	w23, -1
	bl	dprint_normal
	b	.L358
	.size	HEVCHAL_StartDec, .-HEVCHAL_StartDec
	.align	3
.LC141:
	.xword	g_HwMem
	.align	3
.LC142:
	.xword	.LC123
	.align	3
.LC143:
	.xword	.LANCHOR0
	.align	3
.LC144:
	.xword	.LC9
	.align	3
.LC146:
	.xword	.LC145
	.align	3
.LC147:
	.xword	.LC139
	.align	3
.LC149:
	.xword	.LC148
	.align	3
.LC151:
	.xword	.LC150
	.align	3
.LC153:
	.xword	.LC152
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	s_InitValue, %object
	.size	s_InitValue, 1920
s_InitValue:
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	153
	.word	200
	.word	139
	.word	141
	.word	157
	.word	154
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	184
	.word	-1
	.word	-1
	.word	-1
	.word	184
	.word	63
	.word	94
	.word	138
	.word	182
	.word	154
	.word	111
	.word	141
	.word	154
	.word	154
	.word	139
	.word	139
	.word	138
	.word	153
	.word	136
	.word	167
	.word	152
	.word	152
	.word	110
	.word	110
	.word	124
	.word	125
	.word	140
	.word	153
	.word	125
	.word	127
	.word	140
	.word	109
	.word	111
	.word	143
	.word	127
	.word	111
	.word	79
	.word	108
	.word	123
	.word	63
	.word	110
	.word	110
	.word	124
	.word	125
	.word	140
	.word	153
	.word	125
	.word	127
	.word	140
	.word	109
	.word	111
	.word	143
	.word	127
	.word	111
	.word	79
	.word	108
	.word	123
	.word	63
	.word	91
	.word	171
	.word	134
	.word	141
	.word	140
	.word	92
	.word	137
	.word	138
	.word	140
	.word	152
	.word	138
	.word	139
	.word	153
	.word	74
	.word	149
	.word	92
	.word	139
	.word	107
	.word	122
	.word	152
	.word	140
	.word	179
	.word	166
	.word	182
	.word	140
	.word	227
	.word	122
	.word	197
	.word	111
	.word	111
	.word	125
	.word	110
	.word	110
	.word	94
	.word	124
	.word	108
	.word	124
	.word	107
	.word	125
	.word	141
	.word	179
	.word	153
	.word	125
	.word	107
	.word	125
	.word	141
	.word	179
	.word	153
	.word	125
	.word	107
	.word	125
	.word	141
	.word	179
	.word	153
	.word	125
	.word	140
	.word	139
	.word	182
	.word	182
	.word	152
	.word	136
	.word	152
	.word	136
	.word	153
	.word	136
	.word	139
	.word	111
	.word	136
	.word	139
	.word	111
	.word	-1
	.word	153
	.word	138
	.word	138
	.word	-1
	.word	-1
	.word	79
	.word	110
	.word	122
	.word	95
	.word	79
	.word	63
	.word	31
	.word	31
	.word	153
	.word	153
	.word	168
	.word	140
	.word	198
	.word	-1
	.word	-1
	.word	-1
	.word	153
	.word	185
	.word	107
	.word	139
	.word	126
	.word	154
	.word	197
	.word	185
	.word	201
	.word	149
	.word	154
	.word	139
	.word	154
	.word	154
	.word	154
	.word	152
	.word	149
	.word	107
	.word	167
	.word	154
	.word	153
	.word	111
	.word	154
	.word	154
	.word	139
	.word	139
	.word	107
	.word	167
	.word	91
	.word	122
	.word	107
	.word	167
	.word	125
	.word	110
	.word	94
	.word	110
	.word	95
	.word	79
	.word	125
	.word	111
	.word	110
	.word	78
	.word	110
	.word	111
	.word	111
	.word	95
	.word	94
	.word	108
	.word	123
	.word	108
	.word	125
	.word	110
	.word	94
	.word	110
	.word	95
	.word	79
	.word	125
	.word	111
	.word	110
	.word	78
	.word	110
	.word	111
	.word	111
	.word	95
	.word	94
	.word	108
	.word	123
	.word	108
	.word	121
	.word	140
	.word	61
	.word	154
	.word	154
	.word	196
	.word	196
	.word	167
	.word	154
	.word	152
	.word	167
	.word	182
	.word	182
	.word	134
	.word	149
	.word	136
	.word	153
	.word	121
	.word	136
	.word	137
	.word	169
	.word	194
	.word	166
	.word	167
	.word	154
	.word	167
	.word	137
	.word	182
	.word	155
	.word	154
	.word	139
	.word	153
	.word	139
	.word	123
	.word	123
	.word	63
	.word	153
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	170
	.word	153
	.word	123
	.word	123
	.word	107
	.word	121
	.word	107
	.word	121
	.word	167
	.word	151
	.word	183
	.word	140
	.word	151
	.word	183
	.word	140
	.word	-1
	.word	124
	.word	138
	.word	94
	.word	-1
	.word	-1
	.word	79
	.word	154
	.word	137
	.word	95
	.word	79
	.word	63
	.word	31
	.word	31
	.word	153
	.word	153
	.word	168
	.word	169
	.word	198
	.word	-1
	.word	-1
	.word	-1
	.word	153
	.word	160
	.word	107
	.word	139
	.word	126
	.word	154
	.word	197
	.word	185
	.word	201
	.word	134
	.word	154
	.word	139
	.word	154
	.word	154
	.word	183
	.word	152
	.word	149
	.word	92
	.word	167
	.word	154
	.word	153
	.word	111
	.word	154
	.word	154
	.word	139
	.word	139
	.word	107
	.word	167
	.word	91
	.word	107
	.word	107
	.word	167
	.word	125
	.word	110
	.word	124
	.word	110
	.word	95
	.word	94
	.word	125
	.word	111
	.word	111
	.word	79
	.word	125
	.word	126
	.word	111
	.word	111
	.word	79
	.word	108
	.word	123
	.word	93
	.word	125
	.word	110
	.word	124
	.word	110
	.word	95
	.word	94
	.word	125
	.word	111
	.word	111
	.word	79
	.word	125
	.word	126
	.word	111
	.word	111
	.word	79
	.word	108
	.word	123
	.word	93
	.word	121
	.word	140
	.word	61
	.word	154
	.word	154
	.word	196
	.word	167
	.word	167
	.word	154
	.word	152
	.word	167
	.word	182
	.word	182
	.word	134
	.word	149
	.word	136
	.word	153
	.word	121
	.word	136
	.word	122
	.word	169
	.word	208
	.word	166
	.word	167
	.word	154
	.word	152
	.word	167
	.word	182
	.word	170
	.word	154
	.word	139
	.word	153
	.word	139
	.word	123
	.word	123
	.word	63
	.word	124
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	170
	.word	153
	.word	138
	.word	138
	.word	122
	.word	121
	.word	122
	.word	121
	.word	167
	.word	151
	.word	183
	.word	140
	.word	151
	.word	183
	.word	140
	.word	-1
	.word	224
	.word	167
	.word	122
	.word	-1
	.word	-1
	.type	__func__.10159, %object
	.size	__func__.10159, 22
__func__.10159:
	.string	"HEVCHAL_WriteCabacTab"
	.zero	2
	.type	__func__.10186, %object
	.size	__func__.10186, 22
__func__.10186:
	.string	"HEVCHAL_CutSliceChain"
	.zero	2
	.type	__func__.10204, %object
	.size	__func__.10204, 22
__func__.10204:
	.string	"HEVCHAL_WriteTileInfo"
	.zero	2
	.type	__func__.10235, %object
	.size	__func__.10235, 18
__func__.10235:
	.string	"HEVCHAL_SetPicMsg"
	.zero	6
	.type	__func__.10255, %object
	.size	__func__.10255, 34
__func__.10255:
	.string	"HEVCHAL_SetSliceMsgStreamAddrInfo"
	.zero	6
.LC0:
	.word	2
	.word	1
	.word	0
	.zero	4
	.type	__func__.10315, %object
	.size	__func__.10315, 20
__func__.10315:
	.string	"HEVCHAL_SetSliceMsg"
	.zero	4
	.type	__func__.10325, %object
	.size	__func__.10325, 23
__func__.10325:
	.string	"HEVCHAL_CheckParaValid"
	.zero	1
	.type	__func__.10331, %object
	.size	__func__.10331, 23
__func__.10331:
	.string	"HEVCHAL_CheckSlicePara"
	.zero	1
	.type	__func__.10365, %object
	.size	__func__.10365, 27
__func__.10365:
	.string	"HEVCHAL_SetSliceMsgSedOnly"
	.zero	5
	.type	__func__.10394, %object
	.size	__func__.10394, 17
__func__.10394:
	.string	"HEVCHAL_StartDec"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC5:
	ASCII(.string	"line %d func %s\tHEVCWriteCabacTab return error.\n" )
	.zero	7
.LC7:
	ASCII(.string	"can not map mn virtual address!\n" )
	.zero	7
.LC9:
	ASCII(.string	"%s: %s\n" )
.LC12:
	ASCII(.string	"HEVCWriteCabacTab return error.\n" )
	.zero	7
.LC14:
	ASCII(.string	"can not map slice msg virtual address!\n" )
.LC20:
	ASCII(.string	"can not map slice segment info virtual address!\n" )
	.zero	7
.LC24:
	ASCII(.string	"can not map down msg virtual address!\n" )
	.zero	1
.LC29:
	ASCII(.string	"pic msg burst0:\n" )
	.zero	7
.LC32:
	ASCII(.string	"D0 = 0x%x\n" )
	.zero	5
.LC34:
	ASCII(.string	"D1 = 0x%x\n" )
	.zero	5
.LC36:
	ASCII(.string	"D2 = 0x%x\n" )
	.zero	5
.LC38:
	ASCII(.string	"D3 = 0x%x\n" )
	.zero	5
.LC40:
	ASCII(.string	"D4 = 0x%x\n" )
	.zero	5
.LC42:
	ASCII(.string	"D5 = 0x%x\n" )
	.zero	5
.LC44:
	ASCII(.string	"D6 = 0x%x\n" )
	.zero	5
.LC46:
	ASCII(.string	"D7 = 0x%x\n" )
	.zero	5
.LC48:
	ASCII(.string	"D%d = 0x%x\n" )
	.zero	4
.LC50:
	ASCII(.string	"D25 = 0x%x\n" )
	.zero	4
.LC52:
	ASCII(.string	"D43 = 0x%x\n" )
	.zero	4
.LC54:
	ASCII(.string	"D54 = 0x%x\n" )
	.zero	4
.LC56:
	ASCII(.string	"HEVC_WriteTileInfo return error.\n" )
	.zero	6
.LC58:
	ASCII(.string	"D55 = 0x%x\n" )
	.zero	4
.LC60:
	ASCII(.string	"D56 = 0x%x\n" )
	.zero	4
.LC62:
	ASCII(.string	"D57 = 0x%x\n" )
	.zero	4
.LC64:
	ASCII(.string	"D58 = 0x%x\n" )
	.zero	4
.LC66:
	ASCII(.string	"D59 = 0x%x\n" )
	.zero	4
.LC68:
	ASCII(.string	"D60 = 0x%x\n" )
	.zero	4
.LC70:
	ASCII(.string	"D61 = 0x%x\n" )
	.zero	4
.LC72:
	ASCII(.string	"D63 = 0x%x\n" )
	.zero	4
.LC75:
	ASCII(.string	"%s FATAL: i=0, valid_bitlen=0\n" )
	.zero	1
.LC78:
	ASCII(.string	"slicemsg D[%d] addr 0x%x = 0x%x\n" )
	.zero	7
.LC89:
	ASCII(.string	"HEVCHAL_SetSliceMsg can not map slice msg virtual address!\n" )
	.zero	4
.LC93:
	ASCII(.string	"slice msg info:\n" )
	.zero	7
.LC98:
	ASCII(.string	"D8 = 0x%x\n" )
	.zero	5
.LC100:
	ASCII(.string	"D9 = 0x%x\n" )
	.zero	5
.LC102:
	ASCII(.string	"D10 = 0x%x\n" )
	.zero	4
.LC104:
	ASCII(.string	"D11 = 0x%x\n" )
	.zero	4
.LC106:
	ASCII(.string	"D12 = 0x%x\n" )
	.zero	4
.LC108:
	ASCII(.string	"D13 = 0x%x\n" )
	.zero	4
.LC110:
	ASCII(.string	"D14 = 0x%x\n" )
	.zero	4
.LC112:
	ASCII(.string	"D23 = 0x%x\n" )
	.zero	4
.LC114:
	ASCII(.string	"D24 = 0x%x\n" )
	.zero	4
.LC117:
	ASCII(.string	"D37 = 0x%x\n" )
	.zero	4
.LC120:
	ASCII(.string	"D44 = 0x%x\n" )
	.zero	4
.LC123:
	ASCII(.string	"FATAL: ApcSize > 16\n" )
	.zero	3
.LC128:
	ASCII(.string	"%s: i = %d, pSlicePara = NULL!\n" )
.LC130:
	ASCII(.string	"SliceSegmentTileAddress %d < prevEndCtbInSliceTile %d\n" )
	.zero	1
.LC132:
	ASCII(.string	"end_ctb_in_slice_raster(%d)/end_ctb_in_slice_tile(%d) > pic_max_ctb(%d)\n" )
	.zero	7
.LC134:
	ASCII(.string	"SliceSegmentTileAddress %d > end_ctb_in_slice_tile %d\n" )
	.zero	1
.LC137:
	ASCII(.string	"%s : pTargetSlicePara == NULL\n" )
	.zero	1
.LC139:
	ASCII(.string	"%s 0: set slice msg failed!\n" )
	.zero	3
.LC145:
	ASCII(.string	"%s pFirstSlice = NULL!\n" )
.LC148:
	ASCII(.string	"%s pTargetSlicePara is NULL!\n" )
	.zero	2
.LC150:
	ASCII(.string	"%s 1: set slice msg failed!\n" )
	.zero	3
.LC152:
	ASCII(.string	"No slice to dec, add up msg report.\n" )
	.bss
	.align	3
.LANCHOR1 = . + 0
	.type	s_CabacMN, %object
	.size	s_CabacMN, 928
s_CabacMN:
	.zero	928
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
