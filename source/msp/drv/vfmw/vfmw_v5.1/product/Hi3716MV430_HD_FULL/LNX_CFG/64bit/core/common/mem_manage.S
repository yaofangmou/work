#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"mem_manage.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	MEM_InitMemManager
	.type	MEM_InitMemManager, %function
MEM_InitMemManager:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC0
	mov	w0, 1
	ldr	x1, [x19, 24]
	blr	x1
	ldr	x3, [x19, 96]
	mov	x2, 4096
	ldr	x0, .LC1
	mov	w1, 0
	blr	x3
	ldr	x1, [x19, 32]
	mov	w0, 1
	blr	x1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MEM_InitMemManager, .-MEM_InitMemManager
	.align	3
.LC0:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MEM_ManagerWithOperation
	.type	MEM_ManagerWithOperation, %function
MEM_ManagerWithOperation:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L2
	ldr	x0, .LC2
	ldp	x2, x1, [x19, 56]
	stp	x2, x1, [x0, -256]
.L2:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MEM_ManagerWithOperation, .-MEM_ManagerWithOperation
	.align	3
.LC2:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MEM_ManagerClearOperation
	.type	MEM_ManagerClearOperation, %function
MEM_ManagerClearOperation:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC3
	stp	xzr, xzr, [x0, -256]
	ldp	x29, x30, [sp], 16
	ret
	.size	MEM_ManagerClearOperation, .-MEM_ManagerClearOperation
	.align	3
.LC3:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MEM_AddMemRecord
	.type	MEM_AddMemRecord, %function
MEM_AddMemRecord:
	sub	sp, sp, #112
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	stp	x23, x24, [sp, 64]
	stp	x25, x26, [sp, 80]
	stp	x27, x28, [sp, 96]
	mov	w27, w0
	mov	x0, x30
	mov	x23, x1
	mov	w21, w2
	bl	_mcount
	cmp	w21, wzr
	mov	w0, 0
	ccmp	x23, xzr, 4, ne
	ccmp	w27, wzr, 4, ne
	bne	.L18
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L18:
	ldr	x22, .LC6
	mov	w0, 1
	mov	w28, -1
	mov	w19, 0
	add	w26, w27, w21
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x25, .LC8
	ldr	x24, .LC10
	ldr	x20, .LC7
	b	.L13
	.p2align 3
.L20:
	csel	w28, w28, w19, ne
.L12:
	add	w19, w19, 1
	add	x20, x20, 32
	cmp	w19, 128
	beq	.L19
.L13:
	ldr	w7, [x20, 16]
	cmn	w28, #1
	cbz	w7, .L20
	cmp	w27, w7
	bcc	.L12
	ldr	w0, [x20, 24]
	add	w0, w7, w0
	cmp	w27, w0
	bcs	.L12
	mov	w6, w19
	mov	x2, x24
	mov	w1, 69
	mov	w5, w26
	mov	w4, w27
	mov	x3, x25
	str	w0, [sp]
	mov	w0, 1
	add	w19, w19, 1
	bl	dprint_normal
	ldr	x3, [x22, 96]
	mov	x0, x20
	mov	x2, 32
	mov	w1, 0
	add	x20, x20, 32
	blr	x3
	cmp	w19, 128
	bne	.L13
.L19:
	cmn	w28, #1
	beq	.L21
	ldr	x0, .LC7
	sbfiz	x1, x28, 5, 32
	mov	w28, 0
	add	x0, x0, x1
	str	x23, [x0, 8]
	str	w27, [x0, 16]
	str	w21, [x0, 24]
.L15:
	ldr	x1, [x22, 32]
	mov	w0, 1
	blr	x1
	add	sp, x29, 0
	mov	w0, w28
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L21:
	ldr	x3, .LC8
	mov	w1, 77
	ldr	x2, .LC12
	mov	w0, 0
	bl	dprint_normal
	b	.L15
	.size	MEM_AddMemRecord, .-MEM_AddMemRecord
	.align	3
.LC6:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC7:
	.xword	.LANCHOR0
	.align	3
.LC8:
	.xword	.LANCHOR2
	.align	3
.LC10:
	.xword	.LC9
	.align	3
.LC12:
	.xword	.LC11
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MEM_DelMemRecord
	.type	MEM_DelMemRecord, %function
MEM_DelMemRecord:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	mov	w21, w2
	bl	_mcount
	cmp	x20, xzr
	mov	w0, 0
	ccmp	w21, wzr, 4, ne
	ccmp	w19, wzr, 4, ne
	bne	.L34
.L23:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L34:
	ldr	x22, .LC15
	mov	w0, 1
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x1, .LC16
	mov	w3, 0
	add	x0, x1, 24
	b	.L25
	.p2align 3
.L24:
	add	w3, w3, 1
	add	x0, x0, 32
	cmp	w3, 128
	beq	.L35
.L25:
	ldr	w4, [x0]
	cbz	w4, .L24
	ldr	w5, [x0, -8]
	cmp	w19, w5
	bne	.L24
	ldr	x5, [x0, -16]
	cmp	x5, x20
	ccmp	w21, w4, 0, eq
	bne	.L24
	sbfiz	x3, x3, 5, 32
	ldr	x2, [x22, 32]
	add	x1, x1, x3
	mov	w0, 1
	str	xzr, [x1, 8]
	str	wzr, [x1, 16]
	str	wzr, [x1, 24]
	blr	x2
	mov	w0, 0
	b	.L23
	.p2align 3
.L35:
	ldr	x1, [x22, 32]
	mov	w0, 1
	blr	x1
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MEM_DelMemRecord, .-MEM_DelMemRecord
	.align	3
.LC15:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC16:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MEM_Phy2Vir
	.type	MEM_Phy2Vir, %function
MEM_Phy2Vir:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x4, .LC17
	mov	w2, 0
	add	x0, x4, 24
	b	.L39
	.p2align 3
.L37:
	add	w2, w2, 1
	add	x0, x0, 32
	cmp	w2, 128
	beq	.L44
.L39:
	ldr	w1, [x0]
	cbz	w1, .L37
	ldr	w3, [x0, -8]
	cmp	w3, w19
	add	w1, w1, w3
	bhi	.L37
	cmp	w19, w1
	bcs	.L37
	ubfiz	x2, x2, 5, 32
	sub	w3, w19, w3
	add	x0, x4, x2
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	x0, [x0, 8]
	add	x0, x0, x3
	ret
.L44:
	mov	x0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MEM_Phy2Vir, .-MEM_Phy2Vir
	.align	3
.LC17:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MEM_Vir2Phy
	.type	MEM_Vir2Phy, %function
MEM_Vir2Phy:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x4, .LC18
	mov	w2, 0
	add	x0, x4, 24
	b	.L48
	.p2align 3
.L46:
	add	w2, w2, 1
	add	x0, x0, 32
	cmp	w2, 128
	beq	.L53
.L48:
	ldr	w1, [x0]
	cbz	w1, .L46
	ldr	x3, [x0, -16]
	cmp	x3, x19
	add	x1, x3, x1, uxtw
	bhi	.L46
	cmp	x19, x1
	bcs	.L46
	ubfiz	x2, x2, 5, 32
	sub	x3, x19, x3
	add	x0, x4, x2
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 16]
	add	w0, w0, w3
	ret
.L53:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MEM_Vir2Phy, .-MEM_Vir2Phy
	.align	3
.LC18:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MEM_WritePhyWord
	.type	MEM_WritePhyWord, %function
MEM_WritePhyWord:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	x5, .LC19
	mov	w3, 0
	add	x0, x5, 24
	b	.L58
	.p2align 3
.L55:
	add	w3, w3, 1
	add	x0, x0, 32
	cmp	w3, 128
	beq	.L54
.L58:
	ldr	w2, [x0]
	cbz	w2, .L55
	ldr	w4, [x0, -8]
	cmp	w19, w4
	add	w2, w2, w4
	bcc	.L55
	cmp	w19, w2
	bcs	.L55
	ubfiz	x3, x3, 5, 32
	sub	w4, w19, w4
	add	x0, x5, x3
	ldr	x0, [x0, 8]
	cmn	x0, x4
	beq	.L54
	str	w20, [x0, x4]
.L54:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MEM_WritePhyWord, .-MEM_WritePhyWord
	.align	3
.LC19:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MEM_ReadPhyWord
	.type	MEM_ReadPhyWord, %function
MEM_ReadPhyWord:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x4, .LC20
	mov	w2, 0
	add	x0, x4, 24
	b	.L67
	.p2align 3
.L64:
	add	w2, w2, 1
	add	x0, x0, 32
	cmp	w2, 128
	beq	.L75
.L67:
	ldr	w1, [x0]
	cbz	w1, .L64
	ldr	w3, [x0, -8]
	cmp	w19, w3
	add	w1, w1, w3
	bcc	.L64
	cmp	w19, w1
	bcs	.L64
	ubfiz	x2, x2, 5, 32
	sub	w3, w19, w3
	add	x1, x4, x2
	mov	w0, 0
	ldr	x1, [x1, 8]
	cmn	x1, x3
	beq	.L65
	ldr	w0, [x1, x3]
.L65:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L75:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MEM_ReadPhyWord, .-MEM_ReadPhyWord
	.align	3
.LC20:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MEM_AllocMemBlock
	.type	MEM_AllocMemBlock, %function
MEM_AllocMemBlock:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	w22, w2
	mov	x19, x3
	mov	w23, w4
	bl	_mcount
	cmp	x19, xzr
	ccmp	w22, wzr, 4, ne
	ccmp	x21, xzr, 4, ne
	beq	.L89
	ldr	x20, .LC24
	mov	x2, 32
	mov	w1, 0
	mov	x0, x19
	ldr	w24, [x19, 28]
	ldr	x3, [x20, 96]
	blr	x3
	ldr	x3, [x20, 96]
	mov	x2, 24
	mov	w1, 0
	add	x0, x29, 72
	blr	x3
	str	w24, [x29, 92]
	ldr	x5, [x20, 288]
	mov	w1, w22
	add	x4, x29, 72
	mov	w3, w23
	mov	w2, 4
	mov	x0, x21
	blr	x5
	ldr	x1, [x29, 80]
	cbz	x1, .L90
	ldr	w2, [x29, 92]
	mov	w0, -1
	ldp	w4, w3, [x29, 72]
	cmp	w2, 3
	bls	.L91
.L78:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L91:
	ldr	x0, .LC27
	ldrb	w0, [x0,w2,uxtw]
	adr	x2, .Lrtx81
	add	x0, x2, w0, sxtb #2
	br	x0
.Lrtx81:
	.section	.rodata
	.align	0
	.align	2
.L81:
	.byte	(.L80 - .Lrtx81) / 4
	.byte	(.L82 - .Lrtx81) / 4
	.byte	(.L82 - .Lrtx81) / 4
	.byte	(.L83 - .Lrtx81) / 4
	.text
	.p2align 3
.L82:
	cmp	w4, wzr
	ccmp	w3, wzr, 4, ne
	ccmp	x1, xzr, 4, ne
	beq	.L88
.L84:
	ldr	w0, [x29, 88]
	str	w0, [x19, 24]
	mov	w0, 0
	str	x1, [x19, 8]
	str	w3, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L80:
	cmp	w4, wzr
	ccmp	x1, xzr, 4, ne
	beq	.L88
	mov	w3, w4
	b	.L84
	.p2align 3
.L83:
	cmp	w3, wzr
	ccmp	x1, xzr, 4, ne
	bne	.L84
.L88:
	mov	w0, -1
	b	.L78
	.p2align 3
.L89:
	ldr	x3, .LC21
	mov	w4, 209
	ldr	x2, .LC23
	mov	w7, w22
	mov	x6, x19
	mov	x5, x21
	add	x3, x3, 24
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L90:
	ldr	x3, .LC21
	mov	w4, 224
	ldr	x2, .LC26
	mov	w6, w22
	mov	x5, x21
	add	x3, x3, 24
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L78
	.size	MEM_AllocMemBlock, .-MEM_AllocMemBlock
	.align	3
.LC21:
	.xword	.LANCHOR2
	.align	3
.LC23:
	.xword	.LC22
	.align	3
.LC24:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC26:
	.xword	.LC25
	.align	3
.LC27:
	.xword	.L81
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MEM_MapRegisterAddr
	.type	MEM_MapRegisterAddr, %function
MEM_MapRegisterAddr:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	w21, w1
	mov	x19, x2
	bl	_mcount
	cmp	w20, wzr
	ccmp	w21, wzr, 4, ne
	ccmp	x19, xzr, 4, ne
	beq	.L96
	ldr	x22, .LC31
	mov	x2, 32
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x22, 96]
	blr	x3
	ldr	x2, [x22, 304]
	mov	w1, w21
	mov	w0, w20
	blr	x2
	cbz	x0, .L97
	str	x0, [x19, 8]
	mov	w0, 0
	str	w20, [x19, 16]
	str	w21, [x19, 24]
.L94:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L96:
	mov	w4, 291
	ldr	x3, .LC28
	ldr	x2, .LC30
	mov	w7, w21
	mov	w6, w20
	mov	x5, x19
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L97:
	mov	w4, 302
	ldr	x3, .LC28
	ldr	x2, .LC33
	mov	w5, w20
	mov	w1, w4
	bl	dprint_normal
	mov	w0, -1
	b	.L94
	.size	MEM_MapRegisterAddr, .-MEM_MapRegisterAddr
	.align	3
.LC28:
	.xword	.LANCHOR3
	.align	3
.LC30:
	.xword	.LC29
	.align	3
.LC31:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC33:
	.xword	.LC32
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MEM_UnmapRegisterAddr
	.type	MEM_UnmapRegisterAddr, %function
MEM_UnmapRegisterAddr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, wzr
	ccmp	x19, xzr, 4, ne
	beq	.L98
	ldr	x1, .LC34
	mov	x0, x19
	ldr	x1, [x1, 312]
	blr	x1
.L98:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MEM_UnmapRegisterAddr, .-MEM_UnmapRegisterAddr
	.align	3
.LC34:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MEM_ReleaseMemBlock
	.type	MEM_ReleaseMemBlock, %function
MEM_ReleaseMemBlock:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, wzr
	ccmp	x20, xzr, 4, ne
	bne	.L109
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L109:
	ldr	x21, .LC35
	mov	x2, 24
	mov	w1, 0
	add	x0, x29, 56
	ldr	x3, [x21, 96]
	blr	x3
	str	w19, [x29, 56]
	ldr	x0, .LC36
	str	x20, [x29, 64]
	add	x3, x0, 4096
	add	x0, x0, 24
	add	x3, x3, 24
	b	.L104
	.p2align 3
.L102:
	add	x0, x0, 32
	cmp	x0, x3
	beq	.L103
.L104:
	ldr	w1, [x0]
	cbz	w1, .L102
	ldr	w2, [x0, -8]
	cmp	w19, w2
	add	w4, w1, w2
	bcc	.L102
	cmp	w19, w4
	bcs	.L102
	str	w1, [x29, 72]
.L103:
	ldr	x1, [x21, 296]
	add	x0, x29, 56
	blr	x1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
	.size	MEM_ReleaseMemBlock, .-MEM_ReleaseMemBlock
	.align	3
.LC35:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC36:
	.xword	.LANCHOR0
	.global	mem_free
	.global	mem_malloc
	.global	s_MemRecord
	.section	.rodata
	.align	3
.LANCHOR2 = . + 0
	.type	__func__.4487, %object
	.size	__func__.4487, 17
__func__.4487:
	.string	"MEM_AddMemRecord"
	.zero	7
	.type	__func__.4540, %object
	.size	__func__.4540, 18
__func__.4540:
	.string	"MEM_AllocMemBlock"
	.align	3
.LANCHOR3 = . + 0
	.type	__func__.4553, %object
	.size	__func__.4553, 20
__func__.4553:
	.string	"MEM_MapRegisterAddr"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC9:
	ASCII(.string	"%s ERROR: Phy [0x%x ~ 0x%x] overlap with Record[%d] [0x%x ~ 0x%x]\n" )
	.zero	5
.LC11:
	ASCII(.string	"%s no free record slot!\n " )
	.zero	6
.LC22:
	ASCII(.string	"%s:%d failed MemName:%p pMemRecord:%p Len:0x%x\n" )
.LC25:
	ASCII(.string	"%s:%d failed MemName:%p Len:0x%x\n" )
	.zero	6
.LC29:
	ASCII(.string	"%s:%d failed pMemRecord:%p Phy:0x%x Len:0x%x\n" )
	.zero	2
.LC32:
	ASCII(.string	"%s:%d failed RegStartPhyAddr:0x%x\n" )
	.bss
	.align	3
.LANCHOR0 = . + 0
.LANCHOR1 = . + 4352
	.type	s_MemRecord, %object
	.size	s_MemRecord, 4096
s_MemRecord:
	.zero	4096
	.type	mem_malloc, %object
	.size	mem_malloc, 8
mem_malloc:
	.zero	8
	.type	mem_free, %object
	.size	mem_free, 8
mem_free:
	.zero	8
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
