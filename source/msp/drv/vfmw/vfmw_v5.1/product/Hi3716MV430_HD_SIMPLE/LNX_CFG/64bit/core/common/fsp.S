#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"fsp.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	FSP_IsConfigChanged, %function
FSP_IsConfigChanged:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	ldr	w1, [x20]
	cmp	w1, w0
	beq	.L10
	mov	w0, 1
.L2:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L10:
	ldrb	w2, [x20, 5]
	mov	w0, 1
	ldrb	w1, [x19, 5]
	cmp	w2, w1
	bne	.L2
	ldr	w1, [x19, 24]
	ldr	w2, [x20, 24]
	cmp	w2, w1
	bne	.L2
	ldr	w1, [x19, 28]
	ldr	w2, [x20, 28]
	cmp	w2, w1
	bne	.L2
	ldr	w1, [x19, 8]
	ldr	w2, [x20, 8]
	cmp	w2, w1
	bne	.L2
	ldr	w1, [x19, 12]
	ldr	w2, [x20, 12]
	cmp	w2, w1
	bne	.L2
	ldrb	w0, [x19, 4]
	ldrb	w1, [x20, 4]
	cmp	w1, w0
	cset	w0, ne
	b	.L2
	.size	FSP_IsConfigChanged, .-FSP_IsConfigChanged
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_GetFsRequirement, %function
FSP_GetFsRequirement:
	sub	sp, sp, #128
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	stp	x19, x20, [sp, 48]
	str	x21, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x21, .LC0
	mov	x2, 116
	mov	w1, 0
	stp	xzr, xzr, [x29, 48]
	ldr	x3, [x21, 96]
	mov	x0, x19
	stp	xzr, xzr, [x29, 64]
	stp	xzr, xzr, [x29, 80]
	blr	x3
	mov	x2, 48
	ldr	x3, [x21, 96]
	mov	w1, 0
	add	x0, x29, x2
	blr	x3
	ldrb	w2, [x20, 45]
	add	x0, x20, 40
	ldr	x3, .LC1
	ldr	w6, [x20]
	ldr	w5, [x20, 8]
	ldp	w7, w1, [x0, 8]
	ldr	w4, [x20, 40]
	stp	w5, w4, [x29, 56]
	strb	w2, [x29, 54]
	str	w6, [x29, 48]
	ldr	w2, [x0, 28]
	stp	w7, w1, [x29, 64]
	ldp	w6, w5, [x0, 16]
	ldr	w4, [x0, 24]
	ldr	w1, [x0, 32]
	ldr	x3, [x3, 112]
	str	w2, [x29, 84]
	stp	w6, w5, [x29, 72]
	str	w4, [x29, 80]
	str	w1, [x29, 88]
	cbz	x3, .L14
	ldrb	w0, [x0, 4]
	mov	x2, x19
	add	x1, x29, 48
	cmp	w0, wzr
	cset	w0, ne
	blr	x3
	cbnz	w0, .L14
	ldr	w3, [x19, 44]
	mov	w4, 32
	ldr	w2, [x19, 88]
	ldr	w1, [x19, 20]
	cmp	w3, w4
	ldr	w0, [x19, 28]
	csel	w3, w3, w4, ls
	cmp	w2, w4
	ldr	x20, .LC2
	csel	w2, w2, w4, ls
	cmp	w1, w4
	csel	w1, w1, w4, ls
	cmp	w0, w4
	csel	w0, w0, w4, ls
	ldr	w7, [x19, 36]
	ldp	w5, w6, [x19, 4]
	ldr	w4, [x19]
	str	w2, [x19, 88]
	ldr	x2, .LC6
	str	w1, [x19, 20]
	mov	w1, 1294
	str	w0, [x19, 28]
	mov	w0, 14
	str	w3, [x19, 44]
	mov	x3, x20
	bl	dprint_normal
	ldp	w3, w0, [x19, 24]
	ldr	w1, [x19, 16]
	ldp	w4, w5, [x19, 44]
	ldp	w6, w7, [x19, 88]
	str	w3, [sp, 24]
	mov	x3, x20
	str	w0, [sp, 16]
	ldr	x2, .LC8
	ldr	w0, [x19, 20]
	str	w0, [sp]
	mov	w0, 14
	str	w1, [sp, 8]
	mov	w1, 1299
	bl	dprint_normal
	ldp	w1, w0, [x19, 72]
	ldr	w3, [x19, 80]
	ldp	w4, w5, [x19, 52]
	ldp	w6, w7, [x19, 60]
	str	w3, [sp, 24]
	mov	x3, x20
	str	w0, [sp, 16]
	ldr	x2, .LC10
	ldr	w0, [x19, 68]
	str	w0, [sp]
	mov	w0, 14
	str	w1, [sp, 8]
	mov	w1, 1305
	bl	dprint_normal
	ldp	w5, w6, [x19, 56]
	ldr	w4, [x19, 96]
	mov	x3, x20
	ldr	w7, [x19, 112]
	mov	w1, 1308
	ldr	x2, .LC12
	mov	w0, 14
	bl	dprint_normal
	add	sp, x29, 0
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L14:
	ldr	x3, .LC2
	mov	w1, 1284
	ldr	x2, .LC4
	mov	w0, 1
	bl	dprint_normal
	add	sp, x29, 0
	mov	w0, -1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.size	FSP_GetFsRequirement, .-FSP_GetFsRequirement
	.align	3
.LC0:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC2:
	.xword	.LANCHOR0
	.align	3
.LC4:
	.xword	.LC3
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
	.type	FSP_MarkFsOutHanging, %function
FSP_MarkFsOutHanging:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	w0, [x19, 76]
	ldp	w2, w1, [x19, 12]
	cbz	w0, .L16
	add	x19, x19, 20480
	add	x19, x19, 1728
.L17:
	cbz	w1, .L15
	ldr	w0, [x19, 4]
	cmp	w20, w0
	beq	.L22
	mov	w2, 0
.L20:
	add	w2, w2, 1
	cmp	w2, w1
	sxtw	x3, w2
	lsl	x0, x3, 2
	beq	.L15
	sub	x0, x0, x3
	add	x0, x19, x0, lsl 5
	ldr	w3, [x0, 4]
	cmp	w20, w3
	bne	.L20
.L19:
	cbz	x0, .L15
	ldr	x3, .LC13
	mov	w1, 4
	mov	w4, 2372
	ldr	x2, .LC15
	str	w1, [x0, 84]
	mov	w5, w20
	add	x3, x3, 24
	mov	w1, w4
	mov	w0, 26
	bl	dprint_normal
.L15:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L16:
	add	x19, x19, 16384
	mov	w1, w2
	add	x19, x19, 2752
	b	.L17
	.p2align 3
.L22:
	mov	x0, x19
	b	.L19
	.size	FSP_MarkFsOutHanging, .-FSP_MarkFsOutHanging
	.align	3
.LC13:
	.xword	.LANCHOR0
	.align	3
.LC15:
	.xword	.LC14
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_UnMarkFsOutHanging, %function
FSP_UnMarkFsOutHanging:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	w0, [x19, 76]
	ldp	w1, w4, [x19, 12]
	cbz	w0, .L30
	add	x19, x19, 20480
	add	x19, x19, 1728
.L31:
	cbz	w4, .L29
	ldr	w0, [x19, 4]
	cmp	w20, w0
	beq	.L36
	mov	w2, 0
.L34:
	add	w2, w2, 1
	cmp	w2, w4
	sxtw	x3, w2
	lsl	x0, x3, 2
	beq	.L29
	sub	x0, x0, x3
	add	x0, x19, x0, lsl 5
	ldr	w1, [x0, 4]
	cmp	w20, w1
	bne	.L34
.L33:
	cbz	x0, .L29
	ldr	w1, [x0, 84]
	cmp	w1, 4
	beq	.L43
.L29:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L30:
	add	x19, x19, 16384
	mov	w4, w1
	add	x19, x19, 2752
	b	.L31
	.p2align 3
.L36:
	mov	x0, x19
	b	.L33
	.p2align 3
.L43:
	ldr	x3, .LC16
	mov	w4, 2389
	ldr	x2, .LC18
	mov	w5, w20
	add	x3, x3, 48
	mov	w1, w4
	str	wzr, [x0, 84]
	mov	w0, 26
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_UnMarkFsOutHanging, .-FSP_UnMarkFsOutHanging
	.align	3
.LC16:
	.xword	.LANCHOR0
	.align	3
.LC18:
	.xword	.LC17
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_ReleaseFs, %function
FSP_ReleaseFs:
	stp	x29, x30, [sp, -256]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w23, w0
	mov	x0, x30
	mov	w19, w1
	mov	x20, x2
	bl	_mcount
	ldr	x21, .LC19
	mov	x2, 152
	mov	w1, 0
	add	x0, x29, 104
	ldr	x3, [x21, 96]
	blr	x3
	cmp	w19, 3
	bls	.L62
	ldr	x3, .LC31
	mov	w4, w19
	ldr	x2, .LC33
	mov	w1, 1601
	add	x3, x3, 72
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 256
	ret
	.p2align 3
.L62:
	ldr	x0, .LC20
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx47
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx47:
	.section	.rodata
	.align	0
	.align	2
.L47:
	.byte	(.L46 - .Lrtx47) / 4
	.byte	(.L48 - .Lrtx47) / 4
	.byte	(.L49 - .Lrtx47) / 4
	.byte	(.L50 - .Lrtx47) / 4
	.text
	.p2align 3
.L49:
	ldr	x3, .LC28
	mov	x1, 32
	ldr	x2, .LC24
	add	x0, x29, 104
	ldr	x4, [x21, 136]
	mov	x25, 24
	ldrb	w27, [x20, 2]
	ldp	w26, w28, [x20, 8]
	blr	x4
	strb	wzr, [x29, 135]
	cmp	w27, wzr
	cset	w24, ne
.L51:
	mov	w0, w23
	ubfiz	x19, x19, 16, 8
	bl	VCTRL_GetChanUniqueID
	mov	x22, x0
	mov	w0, w26
	str	w26, [x29, 136]
	stp	w27, wzr, [x29, 152]
	str	w28, [x29, 160]
	bl	MEM_Phy2Vir
	cmp	x0, xzr
	orr	x19, x19, x22
	cset	w1, eq
	str	x0, [x29, 144]
	tst	w24, w1
	str	x19, [x29, 168]
	bne	.L63
.L53:
	ldr	w4, [x29, 136]
	add	x3, x29, 104
	ldr	x2, .LC37
	mov	w1, 1619
	ldr	w5, [x29, 160]
	mov	w0, 14
	bl	dprint_normal
	ldr	x0, .LC38
	ldr	x4, [x0]
	cbz	x4, .L54
	mov	w3, 152
	add	x2, x29, 104
	mov	w1, 62
	mov	w0, w23
	blr	x4
.L54:
	ldr	x3, [x21, 96]
	mov	x2, x25
	mov	w1, 0
	mov	x0, x20
	blr	x3
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 256
	ret
	.p2align 3
.L48:
	ldr	x3, .LC26
	ldr	x4, [x21, 136]
.L61:
	ldr	x2, .LC24
	mov	x1, 32
	add	x0, x29, 104
	ldrb	w27, [x20, 2]
	ldr	w26, [x20, 4]
	mov	x25, 96
	ldr	w28, [x20, 40]
	blr	x4
	cmp	w27, wzr
	strb	wzr, [x29, 135]
	cset	w24, ne
	b	.L51
	.p2align 3
.L46:
	ldr	x3, .LC22
	ldr	x4, [x21, 136]
	b	.L61
	.p2align 3
.L50:
	ldr	x3, .LC30
	mov	x1, 32
	ldr	x2, .LC24
	add	x0, x29, 104
	ldr	x4, [x21, 136]
	mov	w24, 1
	ldp	w26, w28, [x20, 8]
	mov	x25, 16
	mov	w27, w24
	blr	x4
	strb	wzr, [x29, 135]
	b	.L51
	.p2align 3
.L63:
	ldr	x3, .LC31
	add	x4, x29, 104
	ldr	x2, .LC35
	mov	w1, 1616
	ldr	w5, [x29, 136]
	add	x3, x3, 72
	mov	w0, 1
	bl	dprint_normal
	b	.L53
	.size	FSP_ReleaseFs, .-FSP_ReleaseFs
	.align	3
.LC19:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC20:
	.xword	.L47
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
.LC30:
	.xword	.LC29
	.align	3
.LC31:
	.xword	.LANCHOR0
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
.LC38:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_RequireFs, %function
FSP_RequireFs:
	stp	x29, x30, [sp, -224]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	mov	w23, w2
	bl	_mcount
	ldr	x21, .LC39
	mov	x2, 152
	mov	w1, 0
	add	x0, x29, 72
	ldr	w22, [x20]
	ldr	x3, [x21, 96]
	blr	x3
	cmp	w19, 3
	bls	.L83
	ldr	x3, .LC46
	mov	w4, w19
	ldr	x2, .LC47
	mov	w1, 1521
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 224
	ret
	.p2align 3
.L83:
	ldr	x0, .LC40
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx67
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx67:
	.section	.rodata
	.align	0
	.align	2
.L67:
	.byte	(.L66 - .Lrtx67) / 4
	.byte	(.L68 - .Lrtx67) / 4
	.byte	(.L69 - .Lrtx67) / 4
	.byte	(.L70 - .Lrtx67) / 4
	.text
	.p2align 3
.L69:
	ldr	w0, [x20, 88]
	mov	x1, 32
	ldr	x4, [x21, 136]
	ldr	x3, .LC44
	cmp	w0, 1
	ldr	x2, .LC42
	add	x0, x29, 72
	cset	w24, eq
	ldr	w21, [x20, 92]
	mov	w20, w24
	blr	x4
	strb	wzr, [x29, 103]
.L72:
	mov	w0, w22
	ubfiz	x19, x19, 16, 8
	bl	VCTRL_GetChanUniqueID
	orr	x0, x19, x0
	ldr	x1, .LC48
	mov	w4, w21
	ldr	x2, .LC50
	add	x3, x29, 72
	str	x0, [x29, 136]
	mov	w0, 14
	ldr	w5, [x1]
	mov	w1, 1533
	str	w21, [x29, 128]
	cmp	w5, 1
	csel	w5, w5, w24, eq
	cmp	w23, 1
	cset	w6, eq
	str	w6, [x29, 104]
	stp	w5, w20, [x29, 120]
	bl	dprint_normal
	ldr	x0, .LC51
	ldr	x4, [x0]
	cbz	x4, .L79
	add	x2, x29, 72
	mov	w3, 152
	mov	w1, 61
	mov	w0, w22
	blr	x4
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 224
	ret
	.p2align 3
.L68:
	ldr	w0, [x20, 76]
	mov	w24, 0
	cmp	w0, 1
	beq	.L84
.L73:
	ldr	x4, [x21, 136]
	mov	x1, 32
	ldr	x3, .LC43
	add	x0, x29, 72
	ldr	x2, .LC42
	ldr	w21, [x20, 168]
	mov	w20, 0
	blr	x4
	strb	wzr, [x29, 103]
	b	.L72
	.p2align 3
.L66:
	ldr	w0, [x20, 76]
	mov	w24, 0
	cbz	w0, .L85
.L71:
	ldr	x4, [x21, 136]
	mov	x1, 32
	ldr	x3, .LC41
	add	x0, x29, 72
	ldr	x2, .LC42
	ldr	w21, [x20, 124]
	blr	x4
	strb	wzr, [x29, 103]
	ldr	w0, [x20, 108]
	mov	w20, 0
	cbz	w0, .L72
	mov	w2, 1
	mov	w1, 1
	strb	w2, [x29, 152]
	stp	w1, wzr, [x29, 208]
	str	w0, [x29, 216]
	b	.L72
	.p2align 3
.L70:
	ldr	x4, [x21, 136]
	mov	x1, 32
	ldr	x3, .LC45
	add	x0, x29, 72
	ldr	x2, .LC42
	mov	w24, 1
	ldr	w21, [x20, 100]
	mov	w20, 0
	blr	x4
	strb	wzr, [x29, 103]
	b	.L72
	.p2align 3
.L85:
	mov	w0, w22
	bl	VCTRL_GetChanCrcMode
	cmp	w0, wzr
	cset	w24, ne
	b	.L71
	.p2align 3
.L79:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, 0
	ldp	x29, x30, [sp], 224
	ret
	.p2align 3
.L84:
	mov	w0, w22
	bl	VCTRL_GetChanCrcMode
	cmp	w0, wzr
	cset	w24, ne
	b	.L73
	.size	FSP_RequireFs, .-FSP_RequireFs
	.align	3
.LC39:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC40:
	.xword	.L67
	.align	3
.LC41:
	.xword	.LC21
	.align	3
.LC42:
	.xword	.LC23
	.align	3
.LC43:
	.xword	.LC25
	.align	3
.LC44:
	.xword	.LC27
	.align	3
.LC45:
	.xword	.LC29
	.align	3
.LC46:
	.xword	.LANCHOR1
	.align	3
.LC47:
	.xword	.LC32
	.align	3
.LC48:
	.xword	.LANCHOR2
	.align	3
.LC50:
	.xword	.LC49
	.align	3
.LC51:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_ReportFsRequirement, %function
FSP_ReportFsRequirement:
	sub	sp, sp, #192
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	stp	x19, x20, [sp, 48]
	stp	x21, x22, [sp, 64]
	stp	x23, x24, [sp, 80]
	stp	x25, x26, [sp, 96]
	stp	x27, x28, [sp, 112]
	mov	x19, x1
	mov	x24, x0
	mov	x0, x30
	bl	_mcount
	ldr	w21, [x19, 44]
	ldr	w20, [x19, 88]
	ldr	w22, [x19, 20]
	ldr	w23, [x19, 28]
	cmp	w21, w20
	csel	w25, w21, w20, cs
	ldr	w0, [x24, 36]
	cmp	w22, w23
	csel	w1, w22, w23, cs
	cmp	w25, w1
	csel	w25, w25, w1, ge
	cmp	w0, 1
	beq	.L115
	ldr	x27, .LC52
	ldr	x26, .LC55
.L87:
	ldr	w7, [x19, 92]
	mov	w4, w21
	str	w22, [sp]
	mov	w1, 1773
	str	w23, [sp, 16]
	add	x3, x27, 16
	ldr	x2, .LC57
	mov	w6, w20
	ldr	w0, [x19, 24]
	ldr	w5, [x19, 48]
	str	w0, [sp, 24]
	ldr	w0, [x19, 16]
	str	w0, [sp, 8]
	mov	w0, 14
	bl	dprint_normal
	ldr	w0, [x24]
	bl	VCTRL_GetChanUniqueID
	ldrb	w1, [x19, 42]
	strb	w1, [x29, 128]
	ldp	w0, w1, [x24, 48]
	stp	w0, w1, [x29, 132]
	ldp	w0, w1, [x19, 44]
	ldr	w2, [x19, 20]
	str	w0, [x29, 140]
	ldr	x4, [x26]
	ldr	w0, [x19, 16]
	str	w2, [x29, 144]
	str	w1, [x29, 148]
	str	w0, [x29, 152]
	cbz	x4, .L88
	ldr	w0, [x24]
	add	x1, x29, 128
	str	x1, [x29, 120]
	mov	w3, 16
	add	x2, x29, 112
	sxtw	x1, w0
	str	x1, [x29, 112]
	mov	w1, 65
	blr	x4
.L88:
	cmp	w25, wzr
	mov	w19, 0
	ble	.L116
	.p2align 2
.L108:
	cbnz	w22, .L117
	cbnz	w21, .L118
.L91:
	cbnz	w20, .L119
.L92:
	cbnz	w23, .L120
.L93:
	add	w19, w19, 1
	cmp	w25, w19
	bne	.L108
.L116:
	add	sp, x29, 0
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L119:
	cmp	w19, wzr
	mov	w1, 1
	cset	w2, eq
	mov	x0, x24
	sub	w20, w20, #1
	bl	FSP_RequireFs
	cbz	w23, .L93
.L120:
	cmp	w19, wzr
	mov	w1, 3
	cset	w2, eq
	mov	x0, x24
	sub	w23, w23, #1
	bl	FSP_RequireFs
	b	.L93
	.p2align 3
.L117:
	cmp	w19, wzr
	mov	w1, 2
	cset	w2, eq
	mov	x0, x24
	sub	w22, w22, #1
	bl	FSP_RequireFs
	cbz	w21, .L91
.L118:
	cmp	w19, wzr
	mov	w1, 0
	cset	w2, eq
	mov	x0, x24
	sub	w21, w21, #1
	bl	FSP_RequireFs
	cbz	w20, .L92
	b	.L119
	.p2align 3
.L115:
	mov	w5, w20
	ldr	w20, [x19, 104]
	ldp	w8, w28, [x24, 48]
	ldr	w4, [x19, 92]
	str	w20, [sp]
	mov	w7, w28
	ldr	x27, .LC52
	mov	w6, w8
	ldrb	w1, [x19, 86]
	ldr	x2, .LC54
	add	x3, x27, 16
	str	w1, [sp, 8]
	mov	w1, 1766
	str	w8, [x29, 108]
	bl	dprint_normal
	ldr	x26, .LC55
	ldr	x4, [x26]
	cbz	x4, .L96
	ldrb	w0, [x19, 86]
	mov	w3, 24
	stp	w20, w0, [x29, 144]
	ldr	w0, [x19, 92]
	add	x2, x29, 128
	str	w0, [x29, 128]
	mov	w1, 45
	ldr	w0, [x19, 88]
	mov	w20, 0
	ldr	w8, [x29, 108]
	str	w0, [x29, 132]
	ldr	w0, [x24]
	stp	w8, w28, [x29, 136]
	blr	x4
	b	.L87
.L96:
	mov	w20, 0
	b	.L87
	.size	FSP_ReportFsRequirement, .-FSP_ReportFsRequirement
	.align	3
.LC52:
	.xword	.LANCHOR1
	.align	3
.LC54:
	.xword	.LC53
	.align	3
.LC55:
	.xword	g_EventReportFunc
	.align	3
.LC57:
	.xword	.LC56
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_ArrangeAddFs, %function
FSP_ArrangeAddFs:
	sub	sp, sp, #192
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	str	x21, [sp, 48]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC58
	ldp	w4, w5, [x20, 24]
	ldr	x2, .LC60
	mov	w1, 2117
	add	x3, x21, 40
	mov	w0, 14
	bl	dprint_normal
	ldr	w0, [x19, 40]
	add	x1, x19, 40
	ldr	w4, [x20]
	cmp	w0, w4
	beq	.L139
	ldrb	w5, [x20, 5]
.L136:
	ldr	w6, [x20, 8]
.L137:
	ldrb	w0, [x20, 4]
	ldr	w7, [x20, 12]
.L124:
	ldr	x2, .LC64
	mov	w1, 2124
	str	w0, [sp]
	add	x3, x21, 40
	mov	w0, 1
	bl	dprint_normal
	mov	w1, -1
.L134:
	add	sp, x29, 0
	mov	w0, w1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L139:
	ldrb	w0, [x1, 5]
	ldrb	w5, [x20, 5]
	cmp	w0, w5
	bne	.L136
	ldr	w0, [x1, 8]
	ldr	w6, [x20, 8]
	cmp	w0, w6
	bne	.L137
	ldr	w0, [x1, 12]
	ldr	w7, [x20, 12]
	cmp	w0, w7
	ldrb	w0, [x20, 4]
	bne	.L124
	ldrb	w1, [x1, 4]
	cmp	w1, w0
	bne	.L124
	ldr	x3, .LC65
	mov	x2, 116
	mov	w1, 0
	add	x0, x29, 56
	ldr	x3, [x3, 96]
	blr	x3
	ldr	w6, [x19, 120]
	mov	w0, 32
	ldp	w5, w1, [x20, 24]
	ldr	w7, [x19, 96]
	sub	w2, w0, w6
	cmp	w2, w5
	ldr	w8, [x19, 164]
	sub	w3, w0, w7
	csel	w2, w2, w5, ls
	cmp	w1, w3
	str	w2, [x29, 100]
	csel	w3, w1, w3, ls
	ldr	w1, [x19, 76]
	str	w3, [x29, 76]
	cbnz	w1, .L131
	ldr	w1, [x19, 84]
	ldr	w0, [x29, 144]
	ldr	w9, [x19, 104]
	cbnz	w1, .L128
.L140:
	ldr	w1, [x29, 84]
.L129:
	add	w2, w6, w2
	add	w3, w7, w3
	add	w0, w8, w0
	add	w1, w9, w1
	ldr	w5, [x19, 124]
	ldr	w4, [x19, 168]
	str	w3, [x19, 96]
	str	w2, [x19, 120]
	ldr	w3, [x19, 92]
	ldr	w2, [x19, 100]
	str	w1, [x19, 104]
	add	x1, x29, 56
	str	w0, [x19, 164]
	mov	x0, x19
	str	w3, [x29, 72]
	str	w2, [x29, 80]
	str	w5, [x29, 104]
	str	w4, [x29, 148]
	bl	FSP_ReportFsRequirement
	mov	w1, 0
	cbz	w0, .L134
	ldr	x2, .LC62
	mov	w1, 2158
	add	x3, x21, 40
	mov	w0, 1
	bl	dprint_normal
	mov	w1, -1
	b	.L134
	.p2align 3
.L131:
	sub	w1, w0, w8
	ldr	w9, [x19, 104]
	cmp	w1, w5
	csel	w0, w1, w5, ls
	ldr	w1, [x19, 84]
	str	w0, [x29, 144]
	cbz	w1, .L140
.L128:
	mov	w4, 32
	sub	w4, w4, w9
	cmp	w4, w5
	csel	w1, w4, w5, ls
	str	w1, [x29, 84]
	b	.L129
	.size	FSP_ArrangeAddFs, .-FSP_ArrangeAddFs
	.align	3
.LC58:
	.xword	.LANCHOR1
	.align	3
.LC60:
	.xword	.LC59
	.align	3
.LC62:
	.xword	.LC61
	.align	3
.LC64:
	.xword	.LC63
	.align	3
.LC65:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_IsDecFsUnLinked.isra.1.part.2, %function
FSP_IsDecFsUnLinked.isra.1.part.2:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19]
	cbz	x1, .L143
	ldr	w2, [x1, 76]
	mov	w0, 0
	cmp	w2, w20
	bne	.L142
	ldr	w0, [x1, 80]
	cmp	w0, wzr
	cset	w0, le
.L142:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L143:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_IsDecFsUnLinked.isra.1.part.2, .-FSP_IsDecFsUnLinked.isra.1.part.2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_CancelFsRequirement.isra.12, %function
FSP_CancelFsRequirement.isra.12:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, w19
	bl	VCTRL_GetChanUniqueID
	mov	x3, x0
	ldr	x2, .LC67
	mov	x4, -4294901761
	mov	x20, x0
	mov	w1, 1842
	mov	w0, 14
	bl	dprint_normal
	ldr	x0, .LC68
	ldr	x4, [x0]
	cbz	x4, .L146
	mov	x0, -4294901761
	mov	w3, 16
	stp	x20, x0, [x29, 32]
	add	x2, x29, 32
	mov	w1, 64
	mov	w0, w19
	blr	x4
.L146:
	ldp	x19, x20, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 48
	ret
	.size	FSP_CancelFsRequirement.isra.12, .-FSP_CancelFsRequirement.isra.12
	.align	3
.LC67:
	.xword	.LC66
	.align	3
.LC68:
	.xword	g_EventReportFunc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_ReleaseDecFsRecord.part.13, %function
FSP_ReleaseDecFsRecord.part.13:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 0
	bl	_mcount
	ldr	w2, [x20, 12]
	cbnz	w2, .L155
	b	.L154
	.p2align 3
.L152:
	cmp	w2, w19
	bls	.L154
.L155:
	sxtw	x1, w19
	add	w19, w19, 1
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x0, x0, 5
	add	x1, x20, x0
	add	x1, x1, 16384
	ldrb	w1, [x1, 2752]
	cmp	w1, 1
	bne	.L152
	add	x2, x0, 16384
	ldr	w0, [x20]
	add	x2, x2, 2752
	mov	w1, 0
	add	x2, x20, x2
	bl	FSP_ReleaseFs
	ldr	w2, [x20, 12]
	cmp	w2, w19
	bhi	.L155
.L154:
	str	wzr, [x20, 12]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_ReleaseDecFsRecord.part.13, .-FSP_ReleaseDecFsRecord.part.13
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_ReleaseDispFsRecord.part.14, %function
FSP_ReleaseDispFsRecord.part.14:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 0
	bl	_mcount
	ldr	w2, [x20, 16]
	cbnz	w2, .L163
	b	.L162
	.p2align 3
.L160:
	cmp	w2, w19
	bls	.L162
.L163:
	sxtw	x1, w19
	add	w19, w19, 1
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x0, x0, 5
	add	x1, x20, x0
	add	x1, x1, 20480
	ldrb	w1, [x1, 1728]
	cmp	w1, 1
	bne	.L160
	add	x2, x0, 20480
	ldr	w0, [x20]
	add	x2, x2, 1728
	add	x2, x20, x2
	bl	FSP_ReleaseFs
	ldr	w2, [x20, 16]
	cmp	w2, w19
	bhi	.L163
.L162:
	str	wzr, [x20, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_ReleaseDispFsRecord.part.14, .-FSP_ReleaseDispFsRecord.part.14
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_ReleasePmvRecord.part.15, %function
FSP_ReleasePmvRecord.part.15:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 0
	bl	_mcount
	ldr	w2, [x20, 20]
	cbnz	w2, .L171
	b	.L170
	.p2align 3
.L168:
	cmp	w2, w19
	bls	.L170
.L171:
	sxtw	x1, w19
	add	w19, w19, 1
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, x20, x0
	add	x1, x1, 24576
	ldrb	w1, [x1, 704]
	cmp	w1, 1
	bne	.L168
	add	x2, x0, 24576
	ldr	w0, [x20]
	add	x2, x2, 704
	mov	w1, 2
	add	x2, x20, x2
	bl	FSP_ReleaseFs
	ldr	w2, [x20, 20]
	cmp	w2, w19
	bhi	.L171
.L170:
	str	wzr, [x20, 20]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_ReleasePmvRecord.part.15, .-FSP_ReleasePmvRecord.part.15
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_ReleaseMetadataRecord.part.16, %function
FSP_ReleaseMetadataRecord.part.16:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 0
	bl	_mcount
	ldr	w1, [x20, 24]
	cbnz	w1, .L179
	b	.L178
	.p2align 3
.L176:
	cmp	w1, w19
	bls	.L178
.L179:
	sxtw	x0, w19
	add	w19, w19, 1
	add	x0, x0, 1628
	lsl	x0, x0, 4
	add	x2, x20, x0
	ldrb	w0, [x20, x0]
	cmp	w0, 1
	bne	.L176
	ldr	w0, [x20]
	mov	w1, 3
	bl	FSP_ReleaseFs
	ldr	w1, [x20, 24]
	cmp	w1, w19
	bhi	.L179
.L178:
	str	wzr, [x20, 24]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_ReleaseMetadataRecord.part.16, .-FSP_ReleaseMetadataRecord.part.16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_VarifyWaterMark, %function
FSP_VarifyWaterMark:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	mov	w0, w20
	bl	MEM_Phy2Vir
	cbz	x0, .L185
	add	x19, x0, x19, uxtw
	mov	w6, 52445
	movk	w6, 0xaabb, lsl 16
	ldr	w5, [x19, -4]
	cmp	w5, w6
	beq	.L182
	ldr	x3, .LC69
	mov	w4, w20
	ldr	x2, .LC73
	mov	w1, 2280
	add	x3, x3, 64
	mov	w0, 32
	bl	dprint_normal
.L182:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L185:
	ldr	x3, .LC69
	mov	w5, w19
	ldr	x2, .LC71
	mov	w4, w20
	add	x3, x3, 64
	mov	w1, 2272
	mov	w0, 32
	bl	dprint_normal
	b	.L182
	.size	FSP_VarifyWaterMark, .-FSP_VarifyWaterMark
	.align	3
.LC69:
	.xword	.LANCHOR1
	.align	3
.LC71:
	.xword	.LC70
	.align	3
.LC73:
	.xword	.LC72
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_IsLogicFsMatchTargetCore.part.18, %function
FSP_IsLogicFsMatchTargetCore.part.18:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	w19, w1
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L187
	ldr	w0, [x20, 16]
	cmp	w0, 1
	cset	w0, ls
.L188:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L187:
	cmp	w19, 1
	mov	w0, 1
	bne	.L188
	ldr	w0, [x20, 16]
	ldp	x19, x20, [sp, 16]
	cmp	w0, 2
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_IsLogicFsMatchTargetCore.part.18, .-FSP_IsLogicFsMatchTargetCore.part.18
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_FindIdleDispFs.isra.20, %function
FSP_FindIdleDispFs.isra.20:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x2
	mov	x21, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	str	xzr, [x22]
	ldr	w0, [x21, 76]
	cbz	w0, .L191
	ldr	w2, [x21, 16]
	cbz	w2, .L201
	mov	w1, 0
	b	.L197
	.p2align 3
.L193:
	cmp	w1, w2
	beq	.L201
.L197:
	sxtw	x20, w1
	add	w1, w1, 1
	lsl	x19, x20, 2
	sub	x19, x19, x20
	add	x19, x21, x19, lsl 5
	add	x19, x19, 20480
	ldrh	w0, [x19, 1728]
	cmp	w0, 1
	bne	.L193
	ldr	w3, [x19, 1812]
	cbnz	w3, .L193
	ldr	w5, [x19, 1768]
	ldr	w3, [x21, 168]
	cmp	w5, w3
	bne	.L193
	ldr	w5, [x19, 1772]
	ldr	w3, [x21, 180]
	cmp	w5, w3
	bne	.L193
	ldr	w5, [x19, 1808]
	cbz	w5, .L196
	ldr	x3, .LC74
	mov	w1, 816
	ldr	x2, .LC76
	ldr	w4, [x19, 1732]
	add	x3, x3, 88
	bl	dprint_normal
	str	wzr, [x19, 1808]
.L196:
	lsl	x0, x20, 2
	sub	x0, x0, x20
	lsl	x0, x0, 5
	add	x0, x0, 20480
	add	x0, x0, 1728
	add	x21, x21, x0
	str	x21, [x22]
	cmp	x21, xzr
	csetm	w0, eq
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L191:
	str	x19, [x22]
	cmp	x19, xzr
	csetm	w0, eq
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L201:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	FSP_FindIdleDispFs.isra.20, .-FSP_FindIdleDispFs.isra.20
	.align	3
.LC74:
	.xword	.LANCHOR1
	.align	3
.LC76:
	.xword	.LC75
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_FindIdleMetadata.isra.22, %function
FSP_FindIdleMetadata.isra.22:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x2
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	str	xzr, [x21]
	ldr	w0, [x19, 84]
	cbz	w0, .L209
	cbz	x20, .L210
	ldr	w0, [x20, 36]
	cmp	w0, 31
	bhi	.L214
	sxtw	x1, w0
	mov	w0, -1
	add	x1, x1, 1628
	lsl	x1, x1, 4
	add	x2, x19, x1
	ldrh	w1, [x19, x1]
	cmp	w1, 1
	beq	.L215
.L212:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L209:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L215:
	ldr	w1, [x2, 12]
	ldr	w3, [x19, 100]
	cmp	w3, w1
	bne	.L212
	str	x2, [x21]
	cmp	x2, xzr
	csetm	w0, eq
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L214:
	ldr	x3, .LC79
	mov	w1, 887
	ldr	x4, .LC78
	mov	w0, 0
	ldr	x2, .LC81
	add	x3, x3, 112
	bl	dprint_normal
	mov	w0, -1
	b	.L212
.L210:
	mov	w0, -1
	b	.L212
	.size	FSP_FindIdleMetadata.isra.22, .-FSP_FindIdleMetadata.isra.22
	.align	3
.LC78:
	.xword	.LC77
	.align	3
.LC79:
	.xword	.LANCHOR1
	.align	3
.LC81:
	.xword	.LC80
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_FindOneGroupFs, %function
FSP_FindOneGroupFs:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	str	xzr, [x20, 24]
	mov	w3, 0
	ldr	w4, [x19, 12]
	cbnz	w4, .L238
	b	.L223
	.p2align 3
.L219:
	cmp	w4, w3
	beq	.L223
.L238:
	sxtw	x1, w3
	add	w3, w3, 1
	lsl	x0, x1, 2
	sub	x1, x0, x1
	lsl	x1, x1, 5
	add	x2, x19, x1
	add	x2, x2, 16384
	ldrh	w0, [x2, 2752]
	cmp	w0, 1
	bne	.L219
	ldr	w5, [x2, 2836]
	cbnz	w5, .L219
	ldr	w7, [x2, 2792]
	ldr	w5, [x19, 124]
	cmp	w7, w5
	bne	.L219
	ldr	w7, [x2, 2796]
	ldr	w5, [x19, 136]
	cmp	w7, w5
	bne	.L219
	add	x1, x1, 16384
	add	x1, x1, 2752
	add	x1, x19, x1
	str	x1, [x20, 24]
	cbz	x1, .L223
	ldr	w5, [x2, 2832]
	cbz	w5, .L221
	ldr	x3, .LC82
	mov	w1, 792
	ldr	w4, [x2, 2756]
	ldr	x2, .LC84
	add	x3, x3, 136
	bl	dprint_normal
	ldr	x0, [x20, 24]
	str	wzr, [x0, 80]
	ldr	x1, [x20, 24]
.L221:
	add	x2, x20, 32
	mov	x0, x19
	bl	FSP_FindIdleDispFs.isra.20
	cbnz	w0, .L223
	str	xzr, [x20, 40]
	ldr	w0, [x19, 80]
	cbz	w0, .L229
	ldr	w4, [x19, 20]
	cbz	w4, .L223
	mov	w2, 0
	ldr	w5, [x19, 92]
	b	.L230
	.p2align 3
.L224:
	cmp	w2, w4
	beq	.L223
.L230:
	sxtw	x1, w2
	add	w2, w2, 1
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, x19, x0
	add	x1, x1, 24576
	ldrh	w3, [x1, 704]
	cmp	w3, 1
	bne	.L224
	ldr	w1, [x1, 716]
	cmp	w1, w5
	bne	.L224
	add	x0, x0, 24576
	add	x0, x0, 704
	add	x0, x19, x0
	str	x0, [x20, 40]
	cbz	x0, .L223
.L229:
	ldr	x1, [x20, 32]
	add	x2, x20, 48
	mov	x0, x19
	bl	FSP_FindIdleMetadata.isra.22
	cmp	w0, wzr
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L223:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_FindOneGroupFs, .-FSP_FindOneGroupFs
	.align	3
.LC82:
	.xword	.LANCHOR1
	.align	3
.LC84:
	.xword	.LC83
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_GetOccupiedNum.part.27, %function
FSP_GetOccupiedNum.part.27:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC87
	mov	w1, 3522
	ldr	x4, .LC86
	mov	w0, 0
	ldr	x2, .LC88
	add	x3, x3, 160
	bl	dprint_normal
	mov	w0, -1
	ldp	x29, x30, [sp], 16
	ret
	.size	FSP_GetOccupiedNum.part.27, .-FSP_GetOccupiedNum.part.27
	.align	3
.LC86:
	.xword	.LC85
	.align	3
.LC87:
	.xword	.LANCHOR1
	.align	3
.LC88:
	.xword	.LC80
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_SetDisplay_Share.isra.7, %function
FSP_SetDisplay_Share.isra.7:
	sub	sp, sp, #48
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	x2, [x19, 32]
	cbz	x2, .L251
	ldr	w6, [x2, 76]
	ldr	w0, [x19, 12]
	cmp	w6, w0
	bne	.L276
	cmp	w20, 1
	beq	.L277
	ldr	w0, [x2, 80]
	cmp	w0, wzr
	ble	.L256
	sub	w0, w0, #1
	str	w0, [x2, 80]
	ldrsb	w0, [x19]
	ldr	w6, [x19, 12]
	cbnz	w0, .L257
	ldr	x2, [x19, 32]
	cbz	x2, .L257
.L263:
	ldr	w0, [x2, 76]
	cmp	w0, w6
	bne	.L257
	ldr	w0, [x2, 80]
	cmp	w0, wzr
	bgt	.L257
	ldr	x1, [x19, 24]
	ldr	x0, [x19, 48]
	cmp	x1, x2
	beq	.L258
	strb	wzr, [x2, 1]
.L258:
	str	wzr, [x2, 84]
	cbz	x0, .L259
	strb	wzr, [x0, 1]
.L259:
	ldr	w6, [x19, 12]
	str	xzr, [x19, 32]
	str	xzr, [x19, 48]
.L257:
	ldr	w0, [x19, 20]
	cbnz	w0, .L251
	add	x1, x19, 24
	mov	w0, w6
	bl	FSP_IsDecFsUnLinked.isra.1.part.2
	cmp	w0, 1
	bne	.L251
	ldp	x0, x2, [x19, 24]
	ldr	x1, [x19, 40]
	cmp	x0, x2
	strb	wzr, [x0, 1]
	beq	.L261
	str	wzr, [x0, 84]
.L261:
	cbz	x1, .L262
	ldr	w2, [x1, 20]
	ldr	w0, [x19, 12]
	cmp	w2, w0
	beq	.L278
.L262:
	str	xzr, [x19, 24]
	str	xzr, [x19, 40]
.L251:
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L276:
	ldr	x3, .LC89
	mov	w4, w20
	ldr	w5, [x2, 36]
	mov	w1, 435
	ldr	w7, [x19, 4]
	add	x3, x3, 184
	ldr	x2, .LC91
	str	w0, [sp]
	mov	w0, 1
	bl	dprint_normal
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L277:
	add	sp, x29, 0
	mov	w0, 3
	str	w0, [x2, 84]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L256:
	ldrsb	w0, [x19]
	cbnz	w0, .L257
	b	.L263
	.p2align 3
.L278:
	strb	wzr, [x1, 1]
	b	.L262
	.size	FSP_SetDisplay_Share.isra.7, .-FSP_SetDisplay_Share.isra.7
	.align	3
.LC89:
	.xword	.LANCHOR1
	.align	3
.LC91:
	.xword	.LC90
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IsLogicFsAvailable
	.type	FSP_IsLogicFsAvailable, %function
FSP_IsLogicFsAvailable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrsb	w0, [x19]
	cbnz	w0, .L281
	ldr	w0, [x19, 20]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L281:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_IsLogicFsAvailable, .-FSP_IsLogicFsAvailable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IsDecFsAvailable
	.type	FSP_IsDecFsAvailable, %function
FSP_IsDecFsAvailable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldrh	w0, [x19]
	cmp	w0, 1
	beq	.L287
	mov	w0, 0
.L283:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L287:
	ldr	w1, [x19, 84]
	mov	w0, 0
	cbnz	w1, .L283
	ldr	w1, [x20, 124]
	add	x20, x20, 116
	ldr	w2, [x19, 40]
	cmp	w2, w1
	bne	.L283
	ldr	w0, [x20, 20]
	ldr	w1, [x19, 44]
	cmp	w1, w0
	cset	w0, eq
	b	.L283
	.size	FSP_IsDecFsAvailable, .-FSP_IsDecFsAvailable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IsDispFsAvailable
	.type	FSP_IsDispFsAvailable, %function
FSP_IsDispFsAvailable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldrh	w0, [x19]
	cmp	w0, 1
	beq	.L293
	mov	w0, 0
.L289:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L293:
	ldr	w1, [x19, 84]
	mov	w0, 0
	cbnz	w1, .L289
	ldr	w1, [x20, 168]
	add	x20, x20, 160
	ldr	w2, [x19, 40]
	cmp	w2, w1
	bne	.L289
	ldr	w0, [x20, 20]
	ldr	w1, [x19, 44]
	cmp	w1, w0
	cset	w0, eq
	b	.L289
	.size	FSP_IsDispFsAvailable, .-FSP_IsDispFsAvailable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IsPmvAvailable
	.type	FSP_IsPmvAvailable, %function
FSP_IsPmvAvailable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldrh	w0, [x19]
	cmp	w0, 1
	beq	.L297
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L297:
	ldr	w0, [x19, 12]
	ldr	w1, [x20, 92]
	ldp	x19, x20, [sp, 16]
	cmp	w1, w0
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_IsPmvAvailable, .-FSP_IsPmvAvailable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IsMetadataAvailable
	.type	FSP_IsMetadataAvailable, %function
FSP_IsMetadataAvailable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldrh	w0, [x19]
	cmp	w0, 1
	beq	.L301
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L301:
	ldr	w0, [x19, 12]
	ldr	w1, [x20, 100]
	ldp	x19, x20, [sp, 16]
	cmp	w1, w0
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_IsMetadataAvailable, .-FSP_IsMetadataAvailable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_Init
	.type	FSP_Init, %function
FSP_Init:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC92
	mov	x2, 32
	ldr	x0, .LC93
	mov	w1, 0
	ldr	x3, [x3, 96]
	add	x0, x0, 8
	blr	x3
	ldp	x29, x30, [sp], 16
	ret
	.size	FSP_Init, .-FSP_Init
	.align	3
.LC92:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC93:
	.xword	.LANCHOR2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_EnableInstance
	.type	FSP_EnableInstance, %function
FSP_EnableInstance:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w21, 3
	bhi	.L307
	ldr	x20, .LC97
	add	x20, x20, 8
	ldr	x0, [x20, w21, sxtw 3]
	cbnz	x0, .L308
	ldr	x22, .LC100
	mov	w0, 3
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x3, [x22, 96]
	mov	x2, 26560
	mov	w1, 0
	mov	x0, x19
	blr	x3
	str	w21, [x19]
	mov	w0, 1
	stp	w0, wzr, [x19, 28]
	str	x19, [x20, w21, sxtw 3]
	mov	w0, 3
	ldr	x1, [x22, 32]
	blr	x1
	mov	w0, 0
.L305:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L308:
	ldr	x3, .LC95
	mov	w1, 2483
	ldr	x4, .LC99
	mov	w0, 0
	ldr	x2, .LC96
	add	x3, x3, 208
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L307:
	ldr	x3, .LC95
	mov	w1, 2482
	ldr	x4, .LC94
	mov	w0, 0
	ldr	x2, .LC96
	add	x3, x3, 208
	bl	dprint_normal
	mov	w0, -1
	b	.L305
	.size	FSP_EnableInstance, .-FSP_EnableInstance
	.align	3
.LC94:
	.xword	.LC85
	.align	3
.LC95:
	.xword	.LANCHOR1
	.align	3
.LC96:
	.xword	.LC80
	.align	3
.LC97:
	.xword	.LANCHOR2
	.align	3
.LC99:
	.xword	.LC98
	.align	3
.LC100:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_DisableInstance
	.type	FSP_DisableInstance, %function
FSP_DisableInstance:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L330
	ldr	x20, .LC105
	add	x21, x20, 8
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L331
	ldr	x22, .LC108
	mov	w0, 3
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x21, [x21, w19, sxtw 3]
	ldr	w0, [x21, 28]
	cmp	w0, 1
	beq	.L332
.L313:
	add	x20, x20, 8
	ldr	x1, [x22, 32]
	mov	w0, 3
	str	xzr, [x20, w19, sxtw 3]
	blr	x1
.L309:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L330:
	ldr	x3, .LC103
	mov	w1, 2502
	ldr	x4, .LC102
	mov	w0, 0
	ldr	x2, .LC104
	add	x3, x3, 232
	bl	dprint_normal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L332:
	ldr	w0, [x21, 12]
	cbnz	w0, .L333
.L314:
	ldr	w0, [x21, 16]
	cbnz	w0, .L334
.L315:
	ldr	w0, [x21, 20]
	cbnz	w0, .L335
.L316:
	ldr	w0, [x21, 24]
	cbnz	w0, .L336
.L317:
	ldr	x3, [x22, 96]
	mov	x2, 26560
	mov	w1, 0
	mov	x0, x21
	ldr	w23, [x21]
	blr	x3
	str	w23, [x21]
	str	wzr, [x21, 28]
	b	.L313
	.p2align 3
.L331:
	ldr	x3, .LC103
	mov	w1, 2503
	ldr	x4, .LC107
	ldr	x2, .LC104
	add	x3, x3, 232
	bl	dprint_normal
	b	.L309
	.p2align 3
.L336:
	mov	x0, x21
	bl	FSP_ReleaseMetadataRecord.part.16
	b	.L317
	.p2align 3
.L335:
	mov	x0, x21
	bl	FSP_ReleasePmvRecord.part.15
	b	.L316
	.p2align 3
.L334:
	mov	x0, x21
	bl	FSP_ReleaseDispFsRecord.part.14
	b	.L315
	.p2align 3
.L333:
	mov	x0, x21
	bl	FSP_ReleaseDecFsRecord.part.13
	b	.L314
	.size	FSP_DisableInstance, .-FSP_DisableInstance
	.align	3
.LC102:
	.xword	.LC85
	.align	3
.LC103:
	.xword	.LANCHOR1
	.align	3
.LC104:
	.xword	.LC80
	.align	3
.LC105:
	.xword	.LANCHOR2
	.align	3
.LC107:
	.xword	.LC106
	.align	3
.LC108:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_Exit
	.type	FSP_Exit, %function
FSP_Exit:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x0, x30
	mov	x19, 0
	bl	_mcount
	ldr	x20, .LC112
.L339:
	add	x0, x20, 8
	ldr	x0, [x0, x19, lsl 3]
	cbz	x0, .L338
	ldr	w0, [x0, 28]
	cbnz	w0, .L347
.L338:
	add	x19, x19, 1
	cmp	x19, 4
	bne	.L339
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L347:
	mov	w0, w19
	bl	FSP_DisableInstance
	b	.L338
	.size	FSP_Exit, .-FSP_Exit
	.align	3
.LC112:
	.xword	.LANCHOR2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ResetInstance
	.type	FSP_ResetInstance, %function
FSP_ResetInstance:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	cmp	w21, 3
	bhi	.L383
	ldr	x20, .LC120
	add	x20, x20, 8
	ldr	x0, [x20, w21, sxtw 3]
	cbz	x0, .L384
	ldr	x19, .LC122
	mov	w0, 3
	ldr	x1, [x19, 24]
	blr	x1
	ldr	x1, [x20, w21, sxtw 3]
	add	x2, x1, 16384
	add	x0, x1, 192
	add	x2, x2, 2752
	str	wzr, [x1, 4]
	.p2align 2
.L352:
	strb	wzr, [x0]
	str	wzr, [x0, 12]
	str	wzr, [x0, 20]
	stp	xzr, xzr, [x0, 24]
	stp	xzr, xzr, [x0, 40]
	add	x0, x0, 592
	cmp	x2, x0
	bne	.L352
	ldr	w4, [x1, 20]
	mov	w2, 0
	cbz	w4, .L357
	.p2align 2
.L375:
	sxtw	x3, w2
	add	w2, w2, 1
	lsl	x0, x3, 2
	cmp	w4, w2
	sub	x0, x0, x3
	add	x0, x1, x0, lsl 3
	add	x0, x0, 24576
	strb	wzr, [x0, 705]
	str	wzr, [x0, 724]
	bne	.L375
.L357:
	ldr	w4, [x1, 12]
	mov	w2, 0
	cbz	w4, .L355
	.p2align 2
.L374:
	sxtw	x3, w2
	add	w2, w2, 1
	lsl	x0, x3, 2
	sub	x0, x0, x3
	add	x0, x1, x0, lsl 5
	add	x0, x0, 16384
	ldr	w3, [x0, 2836]
	strb	wzr, [x0, 2753]
	cmp	w3, 4
	str	wzr, [x0, 2828]
	str	wzr, [x0, 2832]
	str	wzr, [x0, 2840]
	beq	.L360
	str	wzr, [x0, 2836]
.L360:
	cmp	w4, w2
	bne	.L374
.L355:
	ldr	w4, [x1, 16]
	mov	w2, 0
	cbz	w4, .L359
	.p2align 2
.L373:
	sxtw	x3, w2
	add	w2, w2, 1
	lsl	x0, x3, 2
	sub	x0, x0, x3
	add	x0, x1, x0, lsl 5
	add	x0, x0, 20480
	ldr	w3, [x0, 1812]
	strb	wzr, [x0, 1729]
	cmp	w3, 4
	str	wzr, [x0, 1804]
	str	wzr, [x0, 1808]
	str	wzr, [x0, 1816]
	beq	.L364
	str	wzr, [x0, 1812]
.L364:
	cmp	w4, w2
	bne	.L373
.L359:
	ldr	w4, [x1, 24]
	mov	w2, 0
	cbz	w4, .L363
	.p2align 2
.L372:
	add	x0, x1, x2, sxtw 4
	add	w2, w2, 1
	add	x0, x0, 24576
	cmp	w2, w4
	ldrb	w3, [x0, 1474]
	cbnz	w3, .L366
	strb	wzr, [x0, 1473]
.L366:
	bne	.L372
.L363:
	ldr	x1, [x19, 32]
	mov	w0, 3
	blr	x1
	mov	w0, 0
.L350:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L383:
	ldr	x3, .LC118
	mov	w1, 2530
	ldr	x4, .LC117
	mov	w0, 0
	ldr	x2, .LC119
	add	x3, x3, 256
	bl	dprint_normal
	mov	w0, -1
	b	.L350
.L384:
	ldr	x3, .LC118
	mov	w1, 2531
	ldr	x4, .LC121
	ldr	x2, .LC119
	add	x3, x3, 256
	bl	dprint_normal
	mov	w0, -1
	b	.L350
	.size	FSP_ResetInstance, .-FSP_ResetInstance
	.align	3
.LC117:
	.xword	.LC85
	.align	3
.LC118:
	.xword	.LANCHOR1
	.align	3
.LC119:
	.xword	.LC80
	.align	3
.LC120:
	.xword	.LANCHOR2
	.align	3
.LC121:
	.xword	.LC106
	.align	3
.LC122:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ArrangeFsPool
	.type	FSP_ArrangeFsPool, %function
FSP_ArrangeFsPool:
	sub	sp, sp, #112
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	stp	x19, x20, [sp, 48]
	stp	x21, x22, [sp, 64]
	stp	x23, x24, [sp, 80]
	stp	x25, x26, [sp, 96]
	mov	w25, w0
	mov	x0, x30
	mov	x20, x1
	mov	w24, w2
	bl	_mcount
	cmp	w25, 3
	bhi	.L481
	ldr	x23, .LC127
	sxtw	x19, w25
	add	x0, x23, 8
	ldr	x0, [x0, w25, sxtw 3]
	cbz	x0, .L482
	lsl	x22, x19, 2
	ldr	x26, .LC129
	sub	x22, x22, x19
	lsl	x0, x22, 5
	add	x22, x22, x0
	add	x22, x22, x19
	add	x22, x26, x22
	ldr	w0, [x22, 16]
	cbz	w0, .L483
.L389:
	ldp	w1, w2, [x20, 8]
	mov	w0, w25
	bl	VCTRL_IsResolutionValid
	cmp	w0, 1
	bne	.L484
	lsl	x0, x19, 2
	sub	x0, x0, x19
	lsl	x1, x0, 5
	add	x0, x0, x1
	add	x19, x0, x19
	add	x19, x26, x19
	ldr	w0, [x19, 64]
	cmp	w0, 1
	beq	.L475
	ldr	x21, .LC130
.L391:
	ldr	x1, [x21, 24]
	mov	w0, 3
	add	x23, x23, 8
	blr	x1
	ldr	x0, .LC133
	ldr	x23, [x23, w25, sxtw 3]
	ldr	x0, [x0, w25, sxtw 3]
	add	x0, x0, 221184
	ldr	w0, [x0, 104]
	str	w0, [x20, 32]
	cbz	w24, .L485
	cmp	w24, 1
	beq	.L486
	cmp	w24, 2
	beq	.L487
	ldr	x3, .LC125
	mov	w4, w24
	ldr	x2, .LC142
	mov	w1, 2591
	add	x3, x3, 280
	mov	w0, 1
	mov	w19, -1
	bl	dprint_normal
.L394:
	ldr	x1, [x21, 32]
	mov	w0, 3
	blr	x1
	mov	w0, w19
.L387:
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L483:
	ldr	x21, .LC130
	ldr	x0, [x21]
	blr	x0
	str	w0, [x22, 16]
	b	.L389
	.p2align 3
.L485:
	ldrb	w0, [x20, 4]
	mov	w1, 2052
	ldrb	w5, [x20, 5]
	add	x19, x23, 40
	ldr	w4, [x20]
	ldp	w6, w7, [x20, 24]
	str	w0, [sp, 16]
	ldr	x22, .LC125
	ldr	w0, [x20, 12]
	str	w0, [sp, 8]
	add	x24, x22, 304
	ldr	x2, .LC135
	mov	x3, x24
	ldr	w0, [x20, 8]
	str	w0, [sp]
	mov	w0, 14
	bl	dprint_normal
	mov	x1, x20
	mov	x0, x19
	bl	FSP_IsConfigChanged
	cbz	w0, .L488
	ldr	w1, [x23, 12]
	ldr	w0, [x23, 120]
	str	wzr, [x23, 32]
	cmp	w1, w0
	bcc	.L395
	ldr	w5, [x23, 16]
	ldr	w0, [x23, 164]
	cmp	w5, w0
	bcc	.L395
	ldr	w1, [x23, 20]
	ldr	w0, [x23, 96]
	cmp	w1, w0
	bcc	.L395
	ldr	w1, [x23, 24]
	ldr	w0, [x23, 104]
	cmp	w1, w0
	bcs	.L396
	.p2align 2
.L395:
	ldr	w0, [x23]
	bl	FSP_CancelFsRequirement.isra.12
	ldr	w5, [x23, 16]
.L396:
	ldr	w0, [x23, 36]
	cbz	w0, .L397
	mov	w2, 0
	cbz	w5, .L399
	.p2align 2
.L459:
	sxtw	x3, w2
	mov	w4, 0
	lsl	x0, x3, 2
	add	w2, w2, 1
	sub	x0, x0, x3
	add	x0, x23, x0, lsl 5
	add	x0, x0, 20480
	ldr	w1, [x0, 1812]
	strb	wzr, [x0, 1728]
	cmp	w1, 3
	strb	wzr, [x0, 1729]
	csel	w1, w1, w4, eq
	add	x4, x0, 1792
	cmp	w2, w5
	stp	wzr, wzr, [x4, 12]
	stp	w1, wzr, [x4, 20]
	bne	.L459
.L399:
	ldr	w0, [x23, 12]
	cbnz	w0, .L489
.L404:
	ldr	w0, [x23, 20]
	cbnz	w0, .L490
.L405:
	ldr	w0, [x23, 24]
	cbnz	w0, .L491
.L406:
	add	x1, x23, 16384
	add	x0, x23, 192
	add	x1, x1, 2752
	.p2align 2
.L407:
	strb	wzr, [x0]
	str	wzr, [x0, 12]
	str	wzr, [x0, 20]
	stp	xzr, xzr, [x0, 24]
	stp	xzr, xzr, [x0, 40]
	add	x0, x0, 592
	cmp	x0, x1
	bne	.L407
	ldr	x3, [x21, 104]
	mov	x1, x20
	mov	x0, x19
	mov	x2, 36
	add	x19, x23, 76
	blr	x3
	mov	x1, x19
	mov	x0, x23
	bl	FSP_GetFsRequirement
	cbnz	w0, .L492
	mov	x1, x19
	mov	x0, x23
	bl	FSP_ReportFsRequirement
	cbnz	w0, .L493
	ldr	w0, [x23]
	mov	w1, 1
	str	w1, [x23, 32]
	mov	w19, 2
	bl	VCTRL_SetChanWaitFsFlag
	b	.L394
	.p2align 3
.L475:
	ldr	w0, [x19, 72]
	ldr	x21, .LC130
	cbnz	w0, .L391
	ldr	x0, [x21]
	blr	x0
	str	w0, [x19, 72]
	b	.L391
	.p2align 3
.L487:
	ldrb	w0, [x20, 4]
	mov	w1, 2172
	ldrb	w5, [x20, 5]
	add	x24, x23, 40
	ldr	w4, [x20]
	add	x26, x23, 76
	ldp	w6, w7, [x20, 24]
	str	w0, [sp, 16]
	ldr	x22, .LC125
	ldr	w0, [x20, 12]
	str	w0, [sp, 8]
	add	x19, x22, 328
	ldr	x2, .LC135
	mov	x3, x19
	ldr	w0, [x20, 8]
	str	w0, [sp]
	mov	w0, 14
	bl	dprint_normal
	mov	x1, x20
	mov	x0, x24
	bl	FSP_IsConfigChanged
	cbz	w0, .L494
	ldr	w1, [x23, 12]
	ldr	w0, [x23, 120]
	str	wzr, [x23, 32]
	cmp	w1, w0
	bcc	.L413
	ldr	w4, [x23, 16]
	ldr	w0, [x23, 164]
	cmp	w4, w0
	bcc	.L413
	ldr	w1, [x23, 20]
	ldr	w0, [x23, 96]
	cmp	w1, w0
	bcc	.L413
	ldr	w1, [x23, 24]
	ldr	w0, [x23, 104]
	cmp	w1, w0
	bcc	.L413
.L414:
	ldr	w0, [x23, 36]
	cbz	w0, .L415
	mov	w2, 0
	cbz	w4, .L417
	.p2align 2
.L460:
	sxtw	x1, w2
	mov	w3, 0
	lsl	x0, x1, 2
	add	w2, w2, 1
	sub	x0, x0, x1
	add	x0, x23, x0, lsl 5
	add	x0, x0, 20480
	ldr	w1, [x0, 1812]
	strb	wzr, [x0, 1728]
	cmp	w1, 3
	strb	wzr, [x0, 1729]
	csel	w1, w1, w3, eq
	add	x3, x0, 1792
	cmp	w2, w4
	stp	wzr, wzr, [x3, 12]
	stp	w1, wzr, [x3, 20]
	bne	.L460
.L417:
	ldr	w0, [x23, 24]
	cbnz	w0, .L495
.L422:
	ldr	w0, [x23, 76]
	add	x25, x23, 16384
	cbnz	w0, .L496
	add	x19, x23, 192
	add	x25, x25, 2752
	b	.L436
	.p2align 3
.L435:
	add	x19, x19, 592
	cmp	x19, x25
	beq	.L437
.L436:
	ldr	w0, [x19, 20]
	cbz	w0, .L435
	mov	x0, x19
	mov	w1, 0
	str	wzr, [x19, 20]
	bl	FSP_SetDisplay_Share.isra.7
	b	.L435
	.p2align 3
.L486:
	mov	x1, x20
	mov	x0, x23
	bl	FSP_ArrangeAddFs
	mov	w19, w0
	b	.L394
.L488:
	ldr	x2, .LC137
	mov	x3, x24
	mov	w1, 2058
.L478:
	mov	w0, 14
	mov	w19, 0
	bl	dprint_normal
	ldr	w0, [x23]
	mov	w1, 0
	bl	VCTRL_SetChanWaitFsFlag
	b	.L394
	.p2align 3
.L413:
	ldr	w0, [x23]
	bl	FSP_CancelFsRequirement.isra.12
	ldr	w4, [x23, 16]
	b	.L414
	.p2align 3
.L437:
	ldr	x3, [x21, 104]
	mov	x1, x20
	mov	x2, 36
	mov	x0, x24
	blr	x3
	mov	x1, x26
	mov	x0, x23
	bl	FSP_GetFsRequirement
	cbnz	w0, .L497
	ldr	w1, [x23, 12]
	mov	w5, 32
	ldr	w2, [x26, 44]
	sub	w0, w5, w1
	ldr	w3, [x26, 88]
	cmp	w0, w2
	ldr	w6, [x26, 20]
	csel	w0, w0, w2, ls
	cmp	w3, w5
	csel	w3, w3, w5, ls
	str	w0, [x26, 44]
	str	w3, [x26, 88]
	mov	x1, x26
	ldr	w4, [x26, 28]
	mov	x0, x23
	ldr	w3, [x23, 20]
	sub	w2, w5, w3
	cmp	w2, w6
	csel	w2, w2, w6, ls
	cmp	w4, w5
	csel	w4, w4, w5, ls
	str	w2, [x26, 20]
	str	w4, [x26, 28]
	bl	FSP_ReportFsRequirement
	cbnz	w0, .L498
	ldr	w0, [x23, 12]
	mov	w4, 1
	ldr	w1, [x26, 44]
	mov	w19, 2
	ldr	w2, [x26, 88]
	add	w0, w1, w0
	str	w0, [x26, 44]
	ldr	w6, [x26, 20]
	mov	w1, w4
	ldr	w3, [x23, 16]
	ldr	w5, [x26, 28]
	add	w3, w2, w3
	str	w3, [x26, 88]
	ldr	w2, [x23, 20]
	add	w2, w6, w2
	str	w2, [x26, 20]
	ldr	w0, [x23, 24]
	add	w0, w5, w0
	str	w0, [x26, 28]
	str	w4, [x23, 32]
	ldr	w0, [x23]
	bl	VCTRL_SetChanWaitFsFlag
	b	.L394
	.p2align 3
.L397:
	cbz	w5, .L399
	mov	x0, x23
	bl	FSP_ReleaseDispFsRecord.part.14
	b	.L399
.L415:
	cbz	w4, .L417
	mov	x0, x23
	bl	FSP_ReleaseDispFsRecord.part.14
	b	.L417
.L491:
	mov	x0, x23
	bl	FSP_ReleaseMetadataRecord.part.16
	b	.L406
.L490:
	mov	x0, x23
	bl	FSP_ReleasePmvRecord.part.15
	b	.L405
.L489:
	mov	x0, x23
	bl	FSP_ReleaseDecFsRecord.part.13
	b	.L404
.L484:
	ldr	x3, .LC125
	mov	w1, 2565
	ldr	x2, .LC132
	mov	w0, 1
	add	x3, x3, 280
	bl	dprint_normal
	mov	w0, -1
	b	.L387
.L496:
	add	x19, x23, 216
	add	x25, x25, 2776
	b	.L432
	.p2align 3
.L429:
	ldr	w0, [x19, -8]
	sub	w0, w0, #1
	cmp	w0, 1
	bls	.L499
.L428:
	str	wzr, [x19, -4]
	str	xzr, [x19, 8]
	str	xzr, [x19, 24]
	add	x19, x19, 592
	cmp	x25, x19
	beq	.L437
.L432:
	ldr	w0, [x19, -4]
	ldr	x1, [x19]
	cbnz	w0, .L429
	ldr	x0, [x19, 8]
	cbz	x0, .L428
	str	wzr, [x0, 84]
	ldr	w0, [x19, -4]
	cbz	w0, .L428
	b	.L429
	.p2align 3
.L499:
	str	wzr, [x19, -4]
	cbz	x1, .L428
	ldr	w0, [x19, -12]
	mov	x1, x19
	bl	FSP_IsDecFsUnLinked.isra.1.part.2
	cmp	w0, 1
	bne	.L428
	ldp	x0, x2, [x19]
	ldr	x1, [x19, 16]
	cmp	x0, x2
	strb	wzr, [x0, 1]
	beq	.L430
	str	wzr, [x0, 84]
.L430:
	cbz	x1, .L431
	ldr	w2, [x1, 20]
	ldr	w0, [x19, -12]
	cmp	w2, w0
	beq	.L500
.L431:
	str	xzr, [x19]
	str	xzr, [x19, 16]
	b	.L428
.L495:
	mov	x0, x23
	bl	FSP_ReleaseMetadataRecord.part.16
	b	.L422
.L494:
	ldr	x2, .LC137
	mov	x3, x19
	mov	w1, 2178
	b	.L478
.L481:
	ldr	x3, .LC125
	mov	w1, 2555
	ldr	x4, .LC124
	mov	w0, 0
	ldr	x2, .LC126
	add	x3, x3, 280
	bl	dprint_normal
	mov	w0, -1
	b	.L387
.L500:
	strb	wzr, [x1, 1]
	b	.L431
.L492:
	ldr	x2, .LC139
	add	x3, x22, 304
	mov	w1, 2092
	mov	w0, 1
	mov	w19, -1
	bl	dprint_normal
	b	.L394
.L497:
	ldr	x2, .LC139
	add	x3, x22, 328
	mov	w1, 2217
	mov	w0, 1
	mov	w19, -1
	bl	dprint_normal
	b	.L394
.L493:
	ldr	x2, .LC140
	add	x3, x22, 304
	mov	w1, 2100
	mov	w0, 1
	mov	w19, -1
	bl	dprint_normal
	b	.L394
.L482:
	ldr	x3, .LC125
	mov	w1, 2556
	ldr	x4, .LC128
	ldr	x2, .LC126
	add	x3, x3, 280
	bl	dprint_normal
	mov	w0, -1
	b	.L387
.L498:
	ldr	x2, .LC140
	add	x3, x22, 328
	mov	w1, 2230
	mov	w0, 1
	mov	w19, -1
	bl	dprint_normal
	b	.L394
	.size	FSP_ArrangeFsPool, .-FSP_ArrangeFsPool
	.align	3
.LC124:
	.xword	.LC85
	.align	3
.LC125:
	.xword	.LANCHOR1
	.align	3
.LC126:
	.xword	.LC80
	.align	3
.LC127:
	.xword	.LANCHOR2
	.align	3
.LC128:
	.xword	.LC106
	.align	3
.LC129:
	.xword	g_VfmwChanStat
	.align	3
.LC130:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC132:
	.xword	.LC131
	.align	3
.LC133:
	.xword	s_pstVfmwChan
	.align	3
.LC135:
	.xword	.LC134
	.align	3
.LC137:
	.xword	.LC136
	.align	3
.LC139:
	.xword	.LC138
	.align	3
.LC140:
	.xword	.LC61
	.align	3
.LC142:
	.xword	.LC141
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_SetFrameBufferMode
	.type	FSP_SetFrameBufferMode, %function
FSP_SetFrameBufferMode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	w21, w1
	bl	_mcount
	ldr	x19, .LC146
	add	x19, x19, 8
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L505
	cmp	w21, 1
	bhi	.L506
	ldr	x22, .LC152
	mov	w0, 3
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x1, [x19, w20, sxtw 3]
	mov	w0, 3
	str	w21, [x1, 36]
	ldr	x1, [x22, 32]
	blr	x1
	mov	w0, 0
.L503:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L506:
	ldr	x3, .LC148
	mov	w1, 2604
	ldr	x4, .LC151
	mov	w0, 0
	ldr	x2, .LC149
	add	x3, x3, 352
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L505:
	ldr	x3, .LC148
	mov	w1, 2603
	ldr	x4, .LC147
	ldr	x2, .LC149
	add	x3, x3, 352
	bl	dprint_normal
	mov	w0, -1
	b	.L503
	.size	FSP_SetFrameBufferMode, .-FSP_SetFrameBufferMode
	.align	3
.LC146:
	.xword	.LANCHOR2
	.align	3
.LC147:
	.xword	.LC106
	.align	3
.LC148:
	.xword	.LANCHOR1
	.align	3
.LC149:
	.xword	.LC80
	.align	3
.LC151:
	.xword	.LC150
	.align	3
.LC152:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_SetDispFsNum
	.type	FSP_SetDispFsNum, %function
FSP_SetDispFsNum:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	x19, .LC154
	add	x19, x19, 8
	ldr	x0, [x19, w21, sxtw 3]
	cbz	x0, .L511
	cmp	w20, 31
	bhi	.L512
	ldr	x22, .LC160
	mov	w0, 3
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x2, [x19, w21, sxtw 3]
	mov	w0, 3
	ldr	x1, [x22, 32]
	str	w20, [x2, 164]
	blr	x1
	mov	w0, 0
.L509:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L512:
	ldr	x3, .LC156
	mov	w5, 32
	ldr	x2, .LC159
	mov	w4, w20
	add	x3, x3, 376
	mov	w1, 2624
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L509
.L511:
	ldr	x3, .LC156
	mov	w1, 2620
	ldr	x4, .LC155
	ldr	x2, .LC157
	add	x3, x3, 376
	bl	dprint_normal
	mov	w0, -1
	b	.L509
	.size	FSP_SetDispFsNum, .-FSP_SetDispFsNum
	.align	3
.LC154:
	.xword	.LANCHOR2
	.align	3
.LC155:
	.xword	.LC106
	.align	3
.LC156:
	.xword	.LANCHOR1
	.align	3
.LC157:
	.xword	.LC80
	.align	3
.LC159:
	.xword	.LC158
	.align	3
.LC160:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_BindRequireFs
	.type	FSP_BindRequireFs, %function
FSP_BindRequireFs:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	w19, w0
	mov	x22, x1
	mov	x0, x30
	bl	_mcount
	cbz	x22, .L585
	ldr	x21, .LC166
	add	x23, x21, 8
	ldr	x0, [x23, w19, sxtw 3]
	cbz	x0, .L586
	ldr	x20, .LC168
	mov	w0, 3
	ldr	x1, [x20, 24]
	blr	x1
	ldrb	w24, [x22, 66]
	ldr	w0, [x22, 48]
	ldr	x19, [x23, w19, sxtw 3]
	mov	w23, w24
	cbz	w0, .L517
	ldr	x0, [x22, 40]
	cbz	x0, .L587
.L517:
	cmp	w24, 3
	bls	.L588
.L518:
	ldr	x3, .LC164
	mov	x4, x22
	ldr	x2, .LC182
	mov	w1, 2679
	add	x3, x3, 400
	mov	w0, 1
	bl	dprint_normal
.L525:
	mov	w19, -1
.L557:
	ldr	x1, [x20, 32]
	mov	w0, 3
	blr	x1
	mov	w0, w19
.L584:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L588:
	ldr	x0, .LC170
	ldrb	w0, [x0,w23,uxtw]
	adr	x1, .Lrtx520
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx520:
	.section	.rodata
	.align	0
	.align	2
.L520:
	.byte	(.L519 - .Lrtx520) / 4
	.byte	(.L521 - .Lrtx520) / 4
	.byte	(.L522 - .Lrtx520) / 4
	.byte	(.L523 - .Lrtx520) / 4
	.text
	.p2align 3
.L587:
	ldr	x3, .LC164
	mov	x4, x22
	ldr	x2, .LC169
	mov	w1, 2657
	ldr	w5, [x22, 32]
	add	x3, x3, 400
	mov	w0, 1
	bl	dprint_normal
	cmp	w24, 3
	bhi	.L518
	b	.L588
	.p2align 3
.L522:
	ldr	w6, [x19, 92]
	ldr	w5, [x22, 56]
	cmp	w5, w6
	bne	.L589
	ldr	w4, [x19, 20]
	ldr	w5, [x19, 96]
	cmp	w4, w5
	ccmp	w4, 31, 2, cc
	bhi	.L544
	cbz	w5, .L545
	add	x0, x19, 24576
	mov	w23, 0
	ldrb	w0, [x0, 704]
	cbnz	w0, .L547
	b	.L590
	.p2align 3
.L549:
	sub	x0, x0, x1
	add	x0, x19, x0, lsl 3
	add	x0, x0, 24576
	ldrb	w0, [x0, 704]
	cbz	w0, .L548
.L547:
	add	w23, w23, 1
	cmp	w5, w23
	sxtw	x1, w23
	lsl	x0, x1, 2
	bne	.L549
.L545:
	ldr	x3, .LC164
	mov	w4, -1
	ldr	x2, .LC176
	mov	w1, 1985
	add	x3, x3, 456
	mov	w0, 1
	bl	dprint_normal
	b	.L525
	.p2align 3
.L521:
	ldr	w6, [x19, 168]
	ldr	w5, [x22, 56]
	cmp	w5, w6
	bne	.L591
	ldr	w4, [x19, 16]
	ldr	w5, [x19, 164]
	cmp	w4, 31
	ccmp	w4, w5, 2, ls
	bcs	.L537
	cbz	w5, .L538
	add	x0, x19, 20480
	mov	w23, 0
	ldrb	w0, [x0, 1728]
	cbnz	w0, .L540
	b	.L592
	.p2align 3
.L542:
	sub	x0, x0, x1
	add	x0, x19, x0, lsl 5
	add	x0, x0, 20480
	ldrb	w0, [x0, 1728]
	cbz	w0, .L541
.L540:
	add	w23, w23, 1
	cmp	w5, w23
	sxtw	x1, w23
	lsl	x0, x1, 2
	bne	.L542
.L538:
	ldr	x3, .LC164
	mov	w4, -1
	ldr	x2, .LC176
	mov	w1, 1940
	add	x3, x3, 440
	mov	w0, 1
	bl	dprint_normal
	b	.L525
	.p2align 3
.L519:
	ldr	w6, [x19, 124]
	ldr	w5, [x22, 56]
	cmp	w5, w6
	bne	.L593
	ldr	w6, [x19, 108]
	ldr	w5, [x22, 144]
	cmp	w5, w6
	bne	.L594
	ldr	w4, [x19, 12]
	ldr	w5, [x19, 120]
	cmp	w4, w5
	ccmp	w4, 31, 2, cc
	bhi	.L527
	cbz	w5, .L528
	add	x0, x19, 16384
	mov	w23, 0
	ldrb	w0, [x0, 2752]
	cbnz	w0, .L530
	b	.L595
	.p2align 3
.L532:
	sub	x0, x0, x24
	add	x0, x19, x0, lsl 5
	add	x0, x0, 16384
	ldrb	w0, [x0, 2752]
	cbz	w0, .L531
.L530:
	add	w23, w23, 1
	cmp	w23, w5
	sxtw	x24, w23
	lsl	x0, x24, 2
	bne	.L532
.L528:
	ldr	x3, .LC164
	mov	w4, -1
	ldr	x2, .LC176
	mov	w1, 1876
	add	x3, x3, 424
	mov	w0, 1
	bl	dprint_normal
	b	.L525
	.p2align 3
.L523:
	ldr	w6, [x19, 100]
	ldr	w5, [x22, 56]
	cmp	w5, w6
	bne	.L596
	ldr	w4, [x19, 24]
	ldr	w5, [x19, 104]
	cmp	w4, 31
	ccmp	w4, w5, 2, ls
	bcs	.L551
	cbz	w5, .L552
	add	x0, x19, 24576
	mov	w23, 0
	ldrb	w0, [x0, 1472]
	cbnz	w0, .L554
	b	.L597
	.p2align 3
.L556:
	lsl	x0, x0, 4
	ldrb	w0, [x19, x0]
	cbz	w0, .L555
.L554:
	add	w23, w23, 1
	cmp	w5, w23
	sxtw	x24, w23
	add	x0, x24, 1628
	bne	.L556
.L552:
	ldr	x3, .LC164
	mov	w4, -1
	ldr	x2, .LC176
	mov	w1, 2027
	add	x3, x3, 472
	mov	w0, 1
	bl	dprint_normal
	b	.L525
	.p2align 3
.L548:
	cmn	w23, #1
	beq	.L545
.L546:
	lsl	x24, x1, 2
	ldr	x3, [x20, 96]
	sub	x1, x24, x1
	mov	x2, 24
	lsl	x24, x1, 3
	mov	w1, 0
	add	x0, x24, 24576
	add	x0, x0, 704
	add	x0, x19, x0
	blr	x3
	add	x0, x19, x24
	mov	w1, 1
	add	x0, x0, 24576
	strb	wzr, [x0, 705]
	strb	w1, [x0, 704]
	str	w23, [x0, 708]
	ldr	w1, [x22, 48]
	strb	w1, [x0, 706]
	ldr	w1, [x22, 32]
	str	w1, [x0, 712]
	ldr	w1, [x22, 56]
	str	w1, [x0, 716]
	ldr	w1, [x22, 56]
	lsr	w1, w1, 1
	str	w1, [x0, 720]
	ldr	w0, [x19, 20]
	add	w0, w0, 1
	str	w0, [x19, 20]
.L535:
	ldr	w0, [x19, 32]
	cmp	w0, 2
	beq	.L560
	mov	w0, 2
	str	w0, [x19, 32]
.L560:
	ldr	x2, .LC184
	mov	x3, x22
	ldr	w4, [x22, 32]
	mov	w1, 2690
	ldr	w5, [x22, 56]
	mov	w0, 14
	mov	w19, 0
	bl	dprint_normal
	ldr	w0, [x21]
	cmp	w0, 1
	bne	.L557
	ldr	w23, [x22, 32]
	ldr	w21, [x22, 56]
	mov	w0, w23
	bl	MEM_Phy2Vir
	cbz	x0, .L598
	add	x21, x0, x21, uxtw
	mov	w0, 52445
	movk	w0, 0xaabb, lsl 16
	str	w0, [x21, -4]
	b	.L557
	.p2align 3
.L555:
	cmn	w23, #1
	beq	.L552
.L553:
	add	x0, x24, 1628
	ldr	x3, [x20, 96]
	add	x24, x19, x24, lsl 4
	mov	x2, 16
	add	x24, x24, 24576
	mov	w1, 0
	add	x0, x19, x0, lsl 4
	blr	x3
	strb	wzr, [x24, 1473]
	str	w23, [x24, 1476]
	mov	w0, 1
	strb	w0, [x24, 1472]
	ldr	w0, [x22, 32]
	str	w0, [x24, 1480]
	ldr	w0, [x22, 56]
	str	w0, [x24, 1484]
	ldr	w0, [x19, 24]
	add	w0, w0, 1
	str	w0, [x19, 24]
	b	.L535
	.p2align 3
.L541:
	cmn	w23, #1
	beq	.L538
.L539:
	lsl	x24, x1, 2
	ldr	x3, [x20, 96]
	sub	x1, x24, x1
	mov	x2, 96
	lsl	x24, x1, 5
	mov	w1, 0
	add	x0, x24, 20480
	add	x0, x0, 1728
	add	x0, x19, x0
	blr	x3
	add	x0, x19, x24
	mov	w1, 1
	add	x0, x0, 20480
	strb	w1, [x0, 1728]
	str	w23, [x0, 1764]
	ldr	w1, [x22, 48]
	strb	w1, [x0, 1730]
	ldr	w1, [x22, 32]
	str	w1, [x0, 1732]
	ldr	w1, [x22, 56]
	str	w1, [x0, 1768]
	ldr	w1, [x19, 180]
	str	w1, [x0, 1772]
	ldr	w1, [x19, 184]
	str	w1, [x0, 1776]
	ldr	w1, [x19, 172]
	str	w1, [x0, 1792]
	ldr	w1, [x19, 176]
	str	w1, [x0, 1796]
	ldr	w1, [x19, 188]
	str	w1, [x0, 1800]
	ldr	w0, [x19, 16]
	add	w0, w0, 1
	str	w0, [x19, 16]
	b	.L535
	.p2align 3
.L531:
	cmn	w23, #1
	beq	.L528
.L529:
	lsl	x25, x24, 2
	ldr	x3, [x20, 96]
	sub	x25, x25, x24
	mov	w1, 0
	lsl	x25, x25, 5
	mov	x2, 96
	add	x0, x25, 16384
	add	x0, x0, 2752
	add	x0, x19, x0
	blr	x3
	add	x1, x19, x25
	mov	w0, 1
	add	x1, x1, 16384
	strb	w0, [x1, 2752]
	str	w23, [x1, 2788]
	ldr	w0, [x22, 48]
	strb	w0, [x1, 2754]
	ldr	w0, [x22, 32]
	str	w0, [x1, 2756]
	ldrsb	w0, [x22, 80]
	cbnz	w0, .L599
.L533:
	lsl	x0, x24, 2
	ldr	w1, [x22, 56]
	sub	x0, x0, x24
	add	x0, x19, x0, lsl 5
	add	x0, x0, 16384
	str	w1, [x0, 2792]
	ldr	w1, [x19, 136]
	str	w1, [x0, 2796]
	ldr	w1, [x19, 140]
	str	w1, [x0, 2800]
	ldr	w1, [x19, 148]
	str	w1, [x0, 2804]
	ldr	w1, [x19, 152]
	str	w1, [x0, 2808]
	ldr	w1, [x19, 156]
	str	w1, [x0, 2812]
	ldr	w1, [x19, 128]
	str	w1, [x0, 2816]
	ldr	w1, [x19, 132]
	str	w1, [x0, 2820]
	ldr	w1, [x19, 144]
	str	w1, [x0, 2824]
	ldr	w0, [x19, 12]
	add	w0, w0, 1
	str	w0, [x19, 12]
	b	.L535
	.p2align 3
.L599:
	ldr	w0, [x22, 120]
	str	w0, [x1, 2768]
	bl	MEM_Phy2Vir
	cbz	x0, .L600
	ldr	x3, [x20, 96]
	mov	x2, 32
	mov	w1, 255
	blr	x3
	b	.L533
.L537:
	ldr	x3, .LC164
	mov	w6, 32
	ldr	x2, .LC174
	mov	w1, 1932
	add	x3, x3, 440
	mov	w0, 1
	bl	dprint_normal
	b	.L525
.L551:
	ldr	x3, .LC164
	mov	w6, 32
	ldr	x2, .LC174
	mov	w1, 2019
	add	x3, x3, 472
	mov	w0, 1
	bl	dprint_normal
	b	.L525
.L544:
	ldr	x3, .LC164
	mov	w6, 32
	ldr	x2, .LC180
	mov	w1, 1977
	add	x3, x3, 456
	mov	w0, 1
	bl	dprint_normal
	b	.L525
.L527:
	ldr	x3, .LC164
	mov	w6, 32
	ldr	x2, .LC174
	mov	w1, 1868
	add	x3, x3, 424
	mov	w0, 1
	bl	dprint_normal
	b	.L525
.L591:
	ldr	x3, .LC164
	mov	x4, x22
	ldr	x2, .LC172
	mov	w1, 1926
	add	x3, x3, 440
	mov	w0, 14
	bl	dprint_normal
	b	.L525
.L593:
	ldr	x3, .LC164
	mov	x4, x22
	ldr	x2, .LC172
	mov	w1, 1856
	add	x3, x3, 424
	mov	w0, 14
	bl	dprint_normal
	b	.L525
.L596:
	ldr	x3, .LC164
	mov	x4, x22
	ldr	x2, .LC172
	mov	w1, 2013
	add	x3, x3, 472
	mov	w0, 14
	bl	dprint_normal
	b	.L525
.L589:
	ldr	x3, .LC164
	mov	x4, x22
	ldr	x2, .LC172
	mov	w1, 1971
	add	x3, x3, 456
	mov	w0, 14
	bl	dprint_normal
	b	.L525
.L594:
	ldr	x3, .LC164
	add	x4, x22, 88
	ldr	x2, .LC172
	mov	w1, 1862
	add	x3, x3, 424
	mov	w0, 14
	bl	dprint_normal
	b	.L525
.L590:
	mov	x1, 0
	b	.L546
.L592:
	mov	x1, 0
	b	.L539
.L597:
	mov	x24, 0
	b	.L553
.L595:
	mov	x24, 0
	b	.L529
.L586:
	ldr	x3, .LC164
	mov	w1, 2646
	ldr	x4, .LC167
	ldr	x2, .LC165
	add	x3, x3, 400
	bl	dprint_normal
	mov	w0, -1
	b	.L584
.L598:
	ldr	x3, .LC164
	mov	w5, w21
	ldr	x2, .LC185
	mov	w4, w23
	add	x3, x3, 488
	mov	w1, 2254
	mov	w0, 32
	bl	dprint_normal
	b	.L557
.L585:
	ldr	x3, .LC164
	mov	w1, 2645
	ldr	x4, .LC163
	mov	w0, 0
	ldr	x2, .LC165
	add	x3, x3, 400
	bl	dprint_normal
	mov	w0, -1
	b	.L584
.L600:
	ldr	x3, .LC164
	mov	w1, 1898
	ldr	x2, .LC178
	mov	w0, 1
	add	x3, x3, 424
	bl	dprint_normal
	b	.L525
	.size	FSP_BindRequireFs, .-FSP_BindRequireFs
	.align	3
.LC163:
	.xword	.LC162
	.align	3
.LC164:
	.xword	.LANCHOR1
	.align	3
.LC165:
	.xword	.LC80
	.align	3
.LC166:
	.xword	.LANCHOR2
	.align	3
.LC167:
	.xword	.LC106
	.align	3
.LC168:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC169:
	.xword	.LC34
	.align	3
.LC170:
	.xword	.L520
	.align	3
.LC172:
	.xword	.LC171
	.align	3
.LC174:
	.xword	.LC173
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
.LC182:
	.xword	.LC181
	.align	3
.LC184:
	.xword	.LC183
	.align	3
.LC185:
	.xword	.LC70
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_BindExternFs
	.type	FSP_BindExternFs, %function
FSP_BindExternFs:
	sub	sp, sp, #96
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	stp	x23, x24, [sp, 64]
	str	x25, [sp, 80]
	mov	w20, w0
	mov	x24, x1
	mov	x0, x30
	bl	_mcount
	cbz	x24, .L618
	ldr	x19, .LC191
	add	x19, x19, 8
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L619
	ldr	w4, [x24, 32]
	and	w0, w4, 15
	cbnz	w0, .L620
	ldr	x25, .LC195
	mov	w0, 3
	ldr	x1, [x25, 24]
	blr	x1
	ldr	x21, [x19, w20, sxtw 3]
	ldr	w5, [x24, 56]
	ldr	w6, [x21, 168]
	cmp	w5, w6
	bne	.L621
	ldr	w4, [x21, 16]
	ldr	w5, [x21, 164]
	cmp	w4, 31
	ccmp	w4, w5, 2, ls
	bcs	.L608
	cbz	w5, .L609
	add	x0, x21, 20480
	mov	w19, 0
	ldrb	w0, [x0, 1728]
	cbnz	w0, .L611
	b	.L622
	.p2align 3
.L613:
	sub	x0, x0, x20
	add	x0, x21, x0, lsl 5
	add	x0, x0, 20480
	ldrb	w0, [x0, 1728]
	cbz	w0, .L612
.L611:
	add	w19, w19, 1
	cmp	w19, w5
	sxtw	x20, w19
	lsl	x0, x20, 2
	bne	.L613
.L609:
	ldr	x3, .LC189
	mov	w1, 2746
	ldr	x2, .LC198
	mov	w0, 1
	add	x3, x3, 512
	bl	dprint_normal
	b	.L607
	.p2align 3
.L612:
	cmn	w19, #1
	beq	.L609
.L610:
	lsl	x23, x20, 2
	ldr	x3, [x25, 96]
	sub	x23, x23, x20
	mov	x2, 96
	lsl	x23, x23, 5
	mov	w1, 0
	add	x0, x23, 20480
	add	x23, x21, x23
	add	x0, x0, 1728
	add	x22, x23, 20480
	add	x0, x21, x0
	add	x20, x21, x20, lsl 4
	add	x20, x20, 24576
	blr	x3
	str	w19, [x22, 1764]
	mov	w0, 1
	strb	w0, [x22, 1728]
	ldr	w0, [x24, 48]
	strb	w0, [x22, 1730]
	ldr	w0, [x24, 32]
	str	w0, [x22, 1732]
	ldr	x0, [x24, 40]
	str	x0, [x23, 22216]
	mov	w0, 3
	ldr	w2, [x24, 56]
	str	w2, [x22, 1768]
	ldr	w2, [x24, 184]
	str	w2, [x22, 1748]
	ldr	x2, [x24, 192]
	str	x2, [x23, 22232]
	ldr	w1, [x24, 208]
	str	w1, [x22, 1760]
	ldr	w1, [x21, 180]
	str	w1, [x22, 1772]
	ldr	w1, [x21, 184]
	str	w1, [x22, 1776]
	ldr	w1, [x21, 172]
	str	w1, [x22, 1792]
	ldr	w1, [x21, 176]
	str	w1, [x22, 1796]
	ldr	w1, [x21, 188]
	str	w1, [x22, 1800]
	ldr	w1, [x21, 16]
	add	w1, w1, 1
	str	w1, [x21, 16]
	strb	wzr, [x20, 1473]
	ldr	x1, [x25, 32]
	strb	wzr, [x20, 1474]
	blr	x1
	ldr	w0, [x22, 1760]
	mov	w1, 2780
	ldr	w4, [x21, 16]
	ldr	w5, [x22, 1732]
	ldr	w7, [x22, 1748]
	ldr	w6, [x22, 1768]
	str	w0, [sp, 8]
	ldr	x3, .LC189
	ldr	x0, [x23, 22232]
	ldr	x2, .LC200
	add	x3, x3, 512
	str	x0, [sp]
	mov	w0, 14
	bl	dprint_normal
	mov	w0, 0
.L603:
	add	sp, x29, 0
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L608:
	ldr	x3, .LC189
	mov	w6, 32
	ldr	x2, .LC197
	mov	w1, 2738
	add	x3, x3, 512
	mov	w0, 1
	bl	dprint_normal
.L607:
	ldr	x1, [x25, 32]
	mov	w0, 3
	blr	x1
	add	sp, x29, 0
	mov	w0, -1
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L620:
	ldr	x3, .LC189
	mov	w1, 2720
	ldr	x2, .LC194
	mov	w0, 1
	add	x3, x3, 512
	bl	dprint_normal
	mov	w0, -1
	b	.L603
.L621:
	ldr	x3, .LC189
	mov	x4, x24
	ldr	x2, .LC196
	mov	w1, 2731
	add	x3, x3, 512
	mov	w0, 14
	bl	dprint_normal
	b	.L607
.L622:
	mov	x20, 0
	b	.L610
.L619:
	ldr	x3, .LC189
	mov	w1, 2713
	ldr	x4, .LC192
	ldr	x2, .LC190
	add	x3, x3, 512
	bl	dprint_normal
	mov	w0, -1
	b	.L603
.L618:
	ldr	x3, .LC189
	mov	w1, 2712
	ldr	x4, .LC188
	mov	w0, 0
	ldr	x2, .LC190
	add	x3, x3, 512
	bl	dprint_normal
	mov	w0, -1
	b	.L603
	.size	FSP_BindExternFs, .-FSP_BindExternFs
	.align	3
.LC188:
	.xword	.LC187
	.align	3
.LC189:
	.xword	.LANCHOR1
	.align	3
.LC190:
	.xword	.LC80
	.align	3
.LC191:
	.xword	.LANCHOR2
	.align	3
.LC192:
	.xword	.LC106
	.align	3
.LC194:
	.xword	.LC193
	.align	3
.LC195:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC196:
	.xword	.LC171
	.align	3
.LC197:
	.xword	.LC173
	.align	3
.LC198:
	.xword	.LC175
	.align	3
.LC200:
	.xword	.LC199
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IsNewFsAvailable
	.type	FSP_IsNewFsAvailable, %function
FSP_IsNewFsAvailable:
	sub	sp, sp, #592
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L641
	ldr	x20, .LC205
	add	x20, x20, 8
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L642
	ldr	x21, .LC207
	mov	w0, 3
	ldr	x1, [x21, 24]
	blr	x1
	ldr	x0, [x20, w19, sxtw 3]
	ldr	w1, [x0, 120]
	cbz	w1, .L643
	add	x1, x0, 192
	mov	w2, 0
	b	.L631
	.p2align 3
.L628:
	add	w2, w2, 1
	add	x1, x1, 592
	cmp	w2, 32
	beq	.L630
.L631:
	ldrsb	w3, [x1]
	cbnz	w3, .L628
	ldr	w3, [x1, 20]
	cbnz	w3, .L628
	sxtw	x1, w2
	lsl	x3, x1, 5
	add	x3, x3, x1, lsl 2
	add	x1, x3, x1
	lsl	x1, x1, 4
	add	x3, x0, x1
	add	x1, x1, 192
	cmn	x0, x1
	str	w2, [x3, 196]
	beq	.L630
	add	x1, x29, 48
	bl	FSP_FindOneGroupFs
	cbz	w0, .L644
.L630:
	ldr	x1, [x21, 32]
	mov	w0, 3
	mov	w20, 0
	blr	x1
.L636:
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	add	sp, sp, 592
	ret
	.p2align 3
.L643:
	ldr	x1, [x21, 32]
	mov	w0, 3
	mov	w20, 1
	blr	x1
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	add	sp, sp, 592
	ret
	.p2align 3
.L644:
	ldr	x1, [x21, 32]
	mov	w0, 3
	mov	w20, 1
	blr	x1
	lsl	x0, x19, 2
	ldr	x2, .LC208
	sub	x0, x0, x19
	lsl	x1, x0, 5
	add	x0, x0, x1
	add	x19, x0, x19
	add	x19, x2, x19
	ldr	w0, [x19, 20]
	cbnz	w0, .L636
	ldr	x0, [x21]
	blr	x0
	str	w0, [x19, 20]
	b	.L636
.L641:
	ldr	x3, .LC203
	mov	w1, 2870
	ldr	x4, .LC202
	mov	w0, 0
	ldr	x2, .LC204
	add	x3, x3, 536
	mov	w20, -1
	bl	dprint_normal
	b	.L636
.L642:
	ldr	x3, .LC203
	mov	w1, 2871
	ldr	x4, .LC206
	mov	w20, -1
	ldr	x2, .LC204
	add	x3, x3, 536
	bl	dprint_normal
	b	.L636
	.size	FSP_IsNewFsAvailable, .-FSP_IsNewFsAvailable
	.align	3
.LC202:
	.xword	.LC85
	.align	3
.LC203:
	.xword	.LANCHOR1
	.align	3
.LC204:
	.xword	.LC80
	.align	3
.LC205:
	.xword	.LANCHOR2
	.align	3
.LC206:
	.xword	.LC106
	.align	3
.LC207:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC208:
	.xword	g_VfmwChanStat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_NewLogicFs
	.type	FSP_NewLogicFs, %function
FSP_NewLogicFs:
	sub	sp, sp, #128
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	stp	x23, x24, [sp, 64]
	stp	x25, x26, [sp, 80]
	stp	x27, x28, [sp, 96]
	sxtw	x22, w0
	mov	x0, x30
	mov	w23, w1
	bl	_mcount
	cmp	w22, 3
	bhi	.L690
	ldr	x19, .LC213
	add	x19, x19, 8
	ldr	x0, [x19, w22, sxtw 3]
	cbz	x0, .L691
	ldr	x24, .LC215
	mov	w0, 3
	ldr	x1, [x24, 24]
	blr	x1
	ldr	x20, [x19, w22, sxtw 3]
	mov	w0, w22
	ldr	w1, [x20, 76]
	cmp	w1, wzr
	ccmp	w23, 1, 0, eq
	csel	w23, w23, wzr, ne
	bl	VCTRL_IfNoGapEnable
	mov	w25, w0
	mov	w1, 0
	add	x0, x20, 192
	b	.L667
	.p2align 3
.L650:
	add	w1, w1, 1
	add	x0, x0, 592
	cmp	w1, 32
	beq	.L668
.L667:
	ldrsb	w2, [x0]
	cbnz	w2, .L650
	ldr	w2, [x0, 20]
	cbnz	w2, .L650
	sxtw	x27, w1
	lsl	x21, x27, 5
	add	x21, x21, x27, lsl 2
	add	x21, x21, x27
	lsl	x21, x21, 4
	add	x26, x20, x21
	add	x19, x21, 192
	adds	x19, x20, x19
	str	w1, [x26, 196]
	beq	.L668
	cmp	w23, 3
	beq	.L692
	mov	x1, x19
	mov	x0, x20
	bl	FSP_FindOneGroupFs
	cbnz	w0, .L693
	add	x0, x20, x21
	ldp	x2, x28, [x26, 232]
	ldp	x21, x4, [x26, 216]
	add	x0, x0, 248
.L670:
	mov	w1, 1
	str	w1, [x21, 84]
	cmp	w23, 1
	ldr	w3, [x20, 4]
	str	w3, [x21, 76]
	beq	.L694
	str	w1, [x4, 84]
	ldr	w1, [x20, 4]
	str	w1, [x4, 76]
.L671:
	cbz	x2, .L653
	ldr	w1, [x20, 4]
	str	w1, [x2, 20]
.L653:
	lsl	x26, x27, 5
	mov	w5, 1
	add	x26, x26, x27, lsl 2
	mov	w1, 0
	add	x26, x26, x27
	mov	x2, 536
	add	x19, x19, 56
	str	x4, [x29, 104]
	add	x26, x20, x26, lsl 4
	str	w23, [x26, 208]
	ldr	w3, [x20, 4]
	str	w3, [x26, 204]
	str	w5, [x26, 212]
	add	w3, w3, w5
	str	w3, [x20, 4]
	ldr	x3, [x24, 96]
	blr	x3
	ldr	w0, [x26, 196]
	str	w0, [x19, 88]
	ldr	w0, [x20, 48]
	str	w0, [x19, 32]
	ldr	w0, [x20, 52]
	str	w0, [x19, 36]
	ldr	w0, [x20, 56]
	str	w0, [x19, 40]
	ldr	w0, [x20, 60]
	str	w0, [x19, 44]
	ldr	w0, [x21, 44]
	str	w0, [x19, 372]
	ldr	w0, [x21, 48]
	str	w0, [x19, 376]
	ldr	w0, [x21, 52]
	str	w0, [x19, 388]
	ldr	w0, [x21, 64]
	str	w0, [x19, 380]
	ldr	w0, [x21, 68]
	str	w0, [x19, 384]
	ldr	w0, [x21, 4]
	str	w0, [x19, 400]
	ldr	w0, [x21, 16]
	str	w0, [x19, 404]
	ldr	w1, [x21, 4]
	ldr	w0, [x21, 72]
	add	w0, w1, w0
	str	w0, [x19, 408]
	ldr	w1, [x21, 4]
	ldr	w0, [x21, 56]
	add	w0, w1, w0
	str	w0, [x19, 412]
	ldr	w1, [x21, 4]
	ldr	w0, [x21, 60]
	add	w0, w1, w0
	str	w0, [x19, 416]
	ldrb	w0, [x20, 117]
	strb	w0, [x19, 369]
	ldr	x4, [x29, 104]
	ldrb	w0, [x20, 116]
	strb	w0, [x19, 368]
	ldr	w0, [x4, 44]
	str	w0, [x19, 424]
	ldr	w0, [x4, 48]
	str	w0, [x19, 428]
	ldr	w0, [x4, 52]
	str	w0, [x19, 440]
	ldr	w0, [x4, 64]
	str	w0, [x19, 432]
	ldr	w0, [x4, 68]
	str	w0, [x19, 436]
	ldr	w0, [x4, 4]
	str	w0, [x19, 444]
	ldr	w1, [x4, 4]
	ldr	w0, [x4, 72]
	add	w0, w1, w0
	str	w0, [x19, 452]
	ldr	w1, [x4, 4]
	ldr	w0, [x4, 56]
	add	w0, w1, w0
	str	w0, [x19, 464]
	ldr	w1, [x4, 4]
	ldr	w0, [x4, 60]
	add	w0, w1, w0
	str	w0, [x19, 468]
	ldrb	w0, [x20, 161]
	strb	w0, [x19, 420]
	ldr	w0, [x4, 20]
	str	w0, [x19, 472]
	ldr	x0, [x4, 24]
	str	x0, [x19, 480]
	ldr	w0, [x4, 32]
	str	w0, [x19, 488]
	ldrb	w0, [x19, 158]
	bfi	w0, w25, 3, 1
	strb	w0, [x19, 158]
	ldr	w1, [x20, 76]
	cbz	w1, .L663
	ldrb	w1, [x20, 162]
	str	w1, [x19, 76]
	ldrb	w1, [x20, 161]
	str	w1, [x19, 68]
	ldrb	w1, [x20, 160]
	bfi	w0, w1, 1, 1
	strb	w0, [x19, 158]
.L664:
	cbz	x28, .L665
	ldr	w0, [x28, 8]
	mov	w1, 1
	strb	w1, [x28, 1]
	str	w0, [x19, 276]
	ldr	w0, [x28, 8]
	bl	MEM_Phy2Vir
	str	x0, [x19, 280]
	ldr	w0, [x28, 12]
	str	w0, [x19, 272]
.L665:
	ldr	x1, [x24, 32]
	mov	w0, 3
	blr	x1
	lsl	x0, x27, 5
	ldr	x2, .LC231
	add	x0, x0, x27, lsl 2
	add	x27, x0, x27
	add	x20, x20, x27, lsl 4
	ldp	x1, x0, [x20, 216]
	ldr	w3, [x20, 196]
	ldr	w4, [x20, 204]
	ldr	w7, [x0, 36]
	ldr	w5, [x1, 36]
	ldr	w0, [x0, 76]
	ldr	w6, [x1, 76]
	mov	w1, 3084
	str	w0, [sp]
	mov	w0, 14
	bl	dprint_normal
	ldr	w0, [x20, 196]
	tbnz	w0, #31, .L678
	lsl	x1, x22, 2
	ldr	x19, .LC232
	sub	x1, x1, x22
	lsl	x2, x1, 5
	add	x1, x1, x2
	add	x22, x1, x22
	add	x19, x19, x22
	ldr	w1, [x19, 64]
	cbnz	w1, .L695
.L678:
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L692:
	add	x1, x20, 16384
	add	x0, x20, x21
	add	x21, x1, 2752
	add	x0, x0, 248
	mov	x4, x21
	mov	x28, 0
	stp	x21, x21, [x26, 216]
	stp	xzr, xzr, [x26, 232]
	b	.L653
	.p2align 3
.L663:
	ldrb	w1, [x20, 118]
	str	w1, [x19, 76]
	ldrb	w1, [x20, 117]
	str	w1, [x19, 68]
	ldrb	w1, [x20, 116]
	bfi	w0, w1, 1, 1
	strb	w0, [x19, 158]
	b	.L664
	.p2align 3
.L668:
	ldr	x1, [x24, 32]
	mov	w0, 3
	blr	x1
	ldr	x3, .LC211
	mov	w1, 2948
	ldr	x2, .LC217
	mov	w0, 0
	add	x3, x3, 560
	bl	dprint_normal
	add	sp, x29, 0
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L695:
	ldr	x0, [x24]
	blr	x0
	add	sp, x29, 0
	ldp	w2, w1, [x19, 68]
	stp	wzr, wzr, [x19, 64]
	sub	w3, w1, w2
	sub	w1, w0, w1
	stp	wzr, w3, [x19, 72]
	sub	w0, w0, w2
	stp	w1, w0, [x19, 80]
	ldr	w0, [x20, 196]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L694:
	ldr	w1, [x21, 80]
	add	w1, w1, 1
	str	w1, [x21, 80]
	str	w23, [x4, 84]
	ldr	w1, [x4, 80]
	ldr	w3, [x20, 4]
	add	w1, w1, 1
	stp	w3, w1, [x4, 76]
	b	.L671
	.p2align 3
.L693:
	ldr	x0, [x26, 216]
	cbz	x0, .L696
	ldr	x0, [x26, 224]
	cbz	x0, .L697
	ldr	x0, [x26, 232]
	cbz	x0, .L698
.L658:
	lsl	x21, x27, 5
	add	x21, x21, x27, lsl 2
	add	x21, x21, x27
	add	x21, x20, x21, lsl 4
	ldr	x28, [x21, 240]
	cbz	x28, .L699
.L660:
	lsl	x0, x27, 5
	add	x0, x0, x27, lsl 2
	add	x0, x0, x27
	lsl	x0, x0, 4
	add	x1, x20, x0
	add	x0, x1, 248
	ldp	x21, x4, [x1, 216]
	ldr	x2, [x1, 232]
	b	.L670
.L699:
	add	x26, x20, 24576
	ldrb	w0, [x26, 1472]
	cbz	w0, .L700
	ldr	x2, .LC229
	mov	w1, 973
	mov	w0, 1
	add	x26, x26, 1472
	mov	x28, x26
	bl	dprint_normal
	str	x26, [x21, 240]
	b	.L660
.L698:
	add	x21, x20, 24576
	ldrb	w0, [x21, 704]
	cbz	w0, .L701
	ldr	x2, .LC225
	mov	w1, 961
	mov	w0, 1
	add	x21, x21, 704
	bl	dprint_normal
	str	x21, [x26, 232]
	b	.L658
.L690:
	ldr	x3, .LC211
	mov	w1, 2926
	ldr	x4, .LC210
	mov	w0, 0
	ldr	x2, .LC212
	add	x3, x3, 560
	bl	dprint_normal
	mov	w0, -1
	b	.L678
.L691:
	ldr	x3, .LC211
	mov	w1, 2927
	ldr	x4, .LC214
	ldr	x2, .LC212
	add	x3, x3, 560
	bl	dprint_normal
	mov	w0, -1
	b	.L678
.L700:
	ldr	x2, .LC227
	mov	w1, 969
	mov	w0, 1
	bl	dprint_normal
.L656:
	ldr	x1, [x24, 32]
	mov	w0, 3
	blr	x1
	ldr	x3, .LC211
	mov	w1, 2972
	ldr	x2, .LC234
	mov	w0, 0
	add	x3, x3, 560
	bl	dprint_normal
	mov	w0, -1
	b	.L678
.L701:
	ldr	x2, .LC223
	mov	w1, 957
	mov	w0, 1
	bl	dprint_normal
	b	.L656
.L697:
	ldr	x2, .LC221
	mov	w1, 949
	mov	w0, 1
	bl	dprint_normal
	b	.L656
.L696:
	ldr	x2, .LC219
	mov	w1, 943
	mov	w0, 1
	bl	dprint_normal
	b	.L656
	.size	FSP_NewLogicFs, .-FSP_NewLogicFs
	.align	3
.LC210:
	.xword	.LC85
	.align	3
.LC211:
	.xword	.LANCHOR1
	.align	3
.LC212:
	.xword	.LC80
	.align	3
.LC213:
	.xword	.LANCHOR2
	.align	3
.LC214:
	.xword	.LC106
	.align	3
.LC215:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC217:
	.xword	.LC216
	.align	3
.LC219:
	.xword	.LC218
	.align	3
.LC221:
	.xword	.LC220
	.align	3
.LC223:
	.xword	.LC222
	.align	3
.LC225:
	.xword	.LC224
	.align	3
.LC227:
	.xword	.LC226
	.align	3
.LC229:
	.xword	.LC228
	.align	3
.LC231:
	.xword	.LC230
	.align	3
.LC232:
	.xword	g_VfmwChanStat
	.align	3
.LC234:
	.xword	.LC233
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_SetRef
	.type	FSP_SetRef, %function
FSP_SetRef:
	sub	sp, sp, #80
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	str	x23, [sp, 64]
	mov	w20, w0
	mov	x0, x30
	sxtw	x19, w1
	mov	w22, w2
	bl	_mcount
	cmp	w20, 3
	bhi	.L754
	cmp	w19, 31
	bhi	.L755
	ldr	x21, .LC241
	add	x21, x21, 8
	ldr	x0, [x21, w20, sxtw 3]
	cbz	x0, .L756
	ldr	x23, .LC243
	mov	w0, 3
	ldr	x1, [x23, 24]
	blr	x1
	ldr	x20, [x21, w20, sxtw 3]
	lsl	x0, x19, 5
	add	x0, x0, x19, lsl 2
	add	x0, x0, x19
	add	x0, x20, x0, lsl 4
	ldr	w1, [x0, 208]
	strb	w22, [x0, 192]
	cbz	w1, .L757
	sub	w1, w1, #1
	cmp	w1, 1
	bls	.L758
.L709:
	ldr	x1, [x23, 32]
	mov	w0, 3
	blr	x1
.L702:
	add	sp, x29, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L754:
	ldr	x3, .LC237
	mov	w1, 3229
	ldr	x4, .LC236
	mov	w0, 0
	ldr	x2, .LC238
	add	x3, x3, 576
	bl	dprint_normal
	add	sp, x29, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L757:
	ldr	x1, [x0, 216]
	cbz	x1, .L709
	ldr	w4, [x0, 204]
	ldr	w6, [x1, 76]
	cmp	w6, w4
	bne	.L759
	cmp	w22, 1
	ldr	x2, [x0, 232]
	beq	.L760
	ldr	x0, [x0, 224]
	strb	wzr, [x1, 1]
	cmp	x1, x0
	beq	.L716
	str	wzr, [x1, 84]
.L716:
	cbz	x2, .L717
	lsl	x0, x19, 5
	ldr	w1, [x2, 20]
	add	x0, x0, x19, lsl 2
	add	x0, x0, x19
	add	x0, x20, x0, lsl 4
	ldr	w0, [x0, 204]
	cmp	w1, w0
	beq	.L761
.L717:
	lsl	x0, x19, 5
	add	x0, x0, x19, lsl 2
	add	x0, x0, x19
	add	x0, x20, x0, lsl 4
	str	xzr, [x0, 216]
	str	xzr, [x0, 232]
	b	.L709
	.p2align 3
.L755:
	ldr	x3, .LC237
	mov	w1, 3230
	ldr	x4, .LC240
	mov	w0, 0
	ldr	x2, .LC238
	add	x3, x3, 576
	bl	dprint_normal
	add	sp, x29, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L756:
	ldr	x3, .LC237
	mov	w1, 3231
	ldr	x4, .LC242
	ldr	x2, .LC238
	add	x3, x3, 576
	bl	dprint_normal
	b	.L702
	.p2align 3
.L759:
	ldr	x3, .LC237
	ldr	w7, [x0, 196]
	mov	w0, 1
	ldr	w5, [x1, 36]
	add	x3, x3, 592
	ldr	x2, .LC245
	mov	w1, 286
	str	w4, [sp]
	mov	w4, w22
	bl	dprint_normal
	b	.L709
	.p2align 3
.L758:
	ldr	x1, [x0, 216]
	cbz	x1, .L709
	ldr	w4, [x0, 204]
	ldr	w6, [x1, 76]
	cmp	w6, w4
	bne	.L762
	cmp	w22, 1
	beq	.L763
	ldr	w0, [x1, 80]
	cmp	w0, wzr
	ble	.L723
	sub	w0, w0, #1
	str	w0, [x1, 80]
.L723:
	lsl	x21, x19, 5
	add	x21, x21, x19, lsl 2
	add	x21, x21, x19
	lsl	x21, x21, 4
	add	x1, x21, 192
	add	x1, x20, x1
	ldr	w0, [x1, 20]
	cbnz	w0, .L724
	ldr	w0, [x1, 12]
	add	x1, x1, 24
	bl	FSP_IsDecFsUnLinked.isra.1.part.2
	cmp	w0, 1
	bne	.L724
	add	x21, x20, x21
	ldp	x0, x2, [x21, 216]
	ldr	x1, [x21, 232]
	cmp	x0, x2
	strb	wzr, [x0, 1]
	beq	.L725
	str	wzr, [x0, 84]
.L725:
	cbz	x1, .L726
	lsl	x0, x19, 5
	ldr	w2, [x1, 20]
	add	x0, x0, x19, lsl 2
	add	x0, x0, x19
	add	x0, x20, x0, lsl 4
	ldr	w0, [x0, 204]
	cmp	w2, w0
	beq	.L764
.L726:
	lsl	x0, x19, 5
	add	x0, x0, x19, lsl 2
	add	x0, x0, x19
	add	x0, x20, x0, lsl 4
	str	xzr, [x0, 216]
	str	xzr, [x0, 232]
.L724:
	lsl	x0, x19, 5
	add	x0, x0, x19, lsl 2
	add	x0, x0, x19
	add	x0, x20, x0, lsl 4
	ldrsb	w1, [x0, 192]
	cbnz	w1, .L709
	ldr	x1, [x0, 224]
	cbz	x1, .L709
	ldr	w2, [x0, 204]
	ldr	w3, [x1, 76]
	cmp	w3, w2
	bne	.L709
	ldr	w2, [x1, 80]
	cmp	w2, wzr
	bgt	.L709
	ldr	x2, [x0, 216]
	ldr	x0, [x0, 240]
	cmp	x2, x1
	beq	.L727
	strb	wzr, [x1, 1]
.L727:
	str	wzr, [x1, 84]
	cbz	x0, .L728
	strb	wzr, [x0, 1]
.L728:
	lsl	x0, x19, 5
	add	x0, x0, x19, lsl 2
	add	x0, x0, x19
	add	x0, x20, x0, lsl 4
	str	xzr, [x0, 224]
	str	xzr, [x0, 240]
	b	.L709
	.p2align 3
.L761:
	strb	wzr, [x2, 1]
	b	.L717
	.p2align 3
.L760:
	strb	w22, [x1, 1]
	cbz	x2, .L720
	ldr	w0, [x0, 204]
	ldr	w3, [x2, 20]
	cmp	w3, w0
	beq	.L765
.L720:
	ldr	w0, [x20, 76]
	cbnz	w0, .L721
	ldr	w0, [x1, 84]
	cmp	w0, 1
	beq	.L721
.L722:
	lsl	x0, x19, 5
	add	x0, x0, x19, lsl 2
	add	x0, x0, x19
	add	x0, x20, x0, lsl 4
	ldr	w1, [x0, 212]
	cmp	w1, 1
	bne	.L709
	mov	w1, 2
	str	w1, [x0, 212]
	b	.L709
	.p2align 3
.L721:
	mov	w0, 2
	str	w0, [x1, 84]
	b	.L722
	.p2align 3
.L762:
	ldr	x3, .LC237
	ldr	w7, [x0, 196]
	mov	w0, 1
	ldr	w5, [x1, 36]
	add	x3, x3, 616
	ldr	x2, .LC245
	mov	w1, 334
	str	w4, [sp]
	mov	w4, w22
	bl	dprint_normal
	b	.L709
.L763:
	ldr	x2, [x0, 232]
	strb	w22, [x1, 1]
	cbz	x2, .L720
	ldr	w0, [x0, 204]
	ldr	w3, [x2, 20]
	cmp	w3, w0
	bne	.L720
	ldr	w0, [x20, 96]
	cmp	w0, 1
	cset	w0, ne
	strb	w0, [x2, 1]
	b	.L720
.L765:
	strb	w22, [x2, 1]
	b	.L720
.L764:
	strb	wzr, [x1, 1]
	b	.L726
	.size	FSP_SetRef, .-FSP_SetRef
	.align	3
.LC236:
	.xword	.LC85
	.align	3
.LC237:
	.xword	.LANCHOR1
	.align	3
.LC238:
	.xword	.LC80
	.align	3
.LC240:
	.xword	.LC239
	.align	3
.LC241:
	.xword	.LANCHOR2
	.align	3
.LC242:
	.xword	.LC106
	.align	3
.LC243:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC245:
	.xword	.LC244
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetRef
	.type	FSP_GetRef, %function
FSP_GetRef:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, 3
	bhi	.L771
	cmp	w19, 31
	bhi	.L772
	ldr	x0, .LC251
	add	x0, x0, 8
	ldr	x2, [x0, w20, sxtw 3]
	cbz	x2, .L773
	sxtw	x1, w19
	lsl	x0, x1, 5
	add	x0, x0, x1, lsl 2
	add	x1, x0, x1
	add	x1, x2, x1, lsl 4
	ldrsb	w0, [x1, 192]
.L768:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L771:
	ldr	x3, .LC248
	mov	w1, 3262
	ldr	x4, .LC247
	mov	w0, 0
	ldr	x2, .LC249
	add	x3, x3, 640
	bl	dprint_normal
	mov	w0, -1
	b	.L768
	.p2align 3
.L772:
	ldr	x3, .LC248
	mov	w1, 3263
	ldr	x4, .LC250
	mov	w0, 0
	ldr	x2, .LC249
	add	x3, x3, 640
	bl	dprint_normal
	mov	w0, -1
	b	.L768
.L773:
	ldr	x3, .LC248
	mov	w1, 3264
	ldr	x4, .LC252
	mov	w0, 0
	ldr	x2, .LC249
	add	x3, x3, 640
	bl	dprint_normal
	mov	w0, -1
	b	.L768
	.size	FSP_GetRef, .-FSP_GetRef
	.align	3
.LC247:
	.xword	.LC85
	.align	3
.LC248:
	.xword	.LANCHOR1
	.align	3
.LC249:
	.xword	.LC80
	.align	3
.LC250:
	.xword	.LC239
	.align	3
.LC251:
	.xword	.LANCHOR2
	.align	3
.LC252:
	.xword	.LC106
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_SetDisplay
	.type	FSP_SetDisplay, %function
FSP_SetDisplay:
	sub	sp, sp, #80
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	str	x23, [sp, 64]
	mov	w19, w0
	mov	x0, x30
	mov	w22, w1
	mov	w21, w2
	bl	_mcount
	cmp	w19, 3
	bhi	.L808
	cmp	w22, 31
	bhi	.L809
	ldr	x20, .LC258
	add	x20, x20, 8
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L810
	ldr	x23, .LC260
	mov	w0, 3
	ldr	x1, [x23, 24]
	blr	x1
	sxtw	x1, w22
	ldr	x4, [x20, w19, sxtw 3]
	lsl	x2, x1, 5
	cmp	w21, 1
	add	x2, x2, x1, lsl 2
	add	x2, x2, x1
	lsl	x2, x2, 4
	add	x0, x2, 192
	add	x2, x4, x2
	add	x0, x4, x0
	beq	.L779
	ldr	w3, [x2, 208]
	str	wzr, [x2, 212]
	cbz	w3, .L811
.L780:
	sub	w3, w3, #1
	cmp	w3, 1
	bls	.L812
.L785:
	ldr	x1, [x23, 32]
	mov	w0, 3
	blr	x1
.L774:
	add	sp, x29, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L808:
	ldr	x3, .LC255
	mov	w1, 3276
	ldr	x4, .LC254
	mov	w0, 0
	ldr	x2, .LC256
	add	x3, x3, 656
	bl	dprint_normal
	add	sp, x29, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L779:
	ldr	w3, [x2, 208]
	mov	w5, 3
	str	w5, [x2, 212]
	cbnz	w3, .L780
	ldr	x2, [x2, 224]
.L781:
	cbz	x2, .L785
	lsl	x0, x1, 5
	ldr	w6, [x2, 76]
	add	x0, x0, x1, lsl 2
	add	x0, x0, x1
	add	x0, x4, x0, lsl 4
	ldr	w8, [x0, 204]
	cmp	w6, w8
	bne	.L813
	cmp	w21, 1
	beq	.L814
	ldp	x3, x2, [x0, 216]
	ldr	x0, [x0, 240]
	cmp	x3, x2
	beq	.L788
	strb	wzr, [x2, 1]
.L788:
	str	wzr, [x2, 84]
	cbz	x0, .L789
	strb	wzr, [x0, 1]
.L789:
	lsl	x0, x1, 5
	add	x0, x0, x1, lsl 2
	add	x1, x0, x1
	add	x4, x4, x1, lsl 4
	str	xzr, [x4, 224]
	str	xzr, [x4, 240]
	b	.L785
	.p2align 3
.L809:
	ldr	x3, .LC255
	mov	w1, 3277
	ldr	x4, .LC257
	mov	w0, 0
	ldr	x2, .LC256
	add	x3, x3, 656
	bl	dprint_normal
	add	sp, x29, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L811:
	ldr	x2, [x2, 224]
	cbnz	w21, .L781
	ldr	x3, [x0, 24]
	ldr	w0, [x0, 12]
	cbz	x3, .L781
	ldr	w5, [x3, 76]
	cmp	w0, w5
	bne	.L781
	ldrb	w0, [x3, 1]
	cmp	w0, 1
	beq	.L781
	ldr	w0, [x3, 84]
	cbz	w0, .L781
	lsl	x0, x1, 5
	cmp	x2, x3
	add	x0, x0, x1, lsl 2
	add	x0, x0, x1
	add	x0, x4, x0, lsl 4
	ldr	x5, [x0, 232]
	strb	wzr, [x3, 1]
	beq	.L782
	str	wzr, [x3, 84]
.L782:
	cbz	x5, .L783
	lsl	x0, x1, 5
	ldr	w3, [x5, 20]
	add	x0, x0, x1, lsl 2
	add	x0, x0, x1
	add	x0, x4, x0, lsl 4
	ldr	w0, [x0, 204]
	cmp	w3, w0
	beq	.L815
.L783:
	lsl	x0, x1, 5
	add	x0, x0, x1, lsl 2
	add	x0, x0, x1
	add	x0, x4, x0, lsl 4
	str	xzr, [x0, 216]
	str	xzr, [x0, 232]
	b	.L781
	.p2align 3
.L810:
	ldr	x3, .LC255
	mov	w1, 3278
	ldr	x4, .LC259
	ldr	x2, .LC256
	add	x3, x3, 656
	bl	dprint_normal
	b	.L774
	.p2align 3
.L813:
	ldr	x3, .LC255
	mov	w4, w21
	ldr	w7, [x0, 196]
	mov	w1, 403
	ldr	w5, [x2, 36]
	add	x3, x3, 672
	ldr	x2, .LC262
	mov	w0, 1
	str	w8, [sp]
	bl	dprint_normal
	b	.L785
	.p2align 3
.L812:
	mov	w1, w21
	bl	FSP_SetDisplay_Share.isra.7
	b	.L785
	.p2align 3
.L814:
	mov	w0, 3
	str	w0, [x2, 84]
	b	.L785
.L815:
	strb	wzr, [x5, 1]
	b	.L783
	.size	FSP_SetDisplay, .-FSP_SetDisplay
	.align	3
.LC254:
	.xword	.LC85
	.align	3
.LC255:
	.xword	.LANCHOR1
	.align	3
.LC256:
	.xword	.LC80
	.align	3
.LC257:
	.xword	.LC239
	.align	3
.LC258:
	.xword	.LANCHOR2
	.align	3
.LC259:
	.xword	.LC106
	.align	3
.LC260:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC262:
	.xword	.LC261
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetDisplay
	.type	FSP_GetDisplay, %function
FSP_GetDisplay:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, 3
	bhi	.L821
	cmp	w19, 31
	bhi	.L822
	ldr	x0, .LC268
	add	x0, x0, 8
	ldr	x2, [x0, w20, sxtw 3]
	cbz	x2, .L823
	sxtw	x1, w19
	lsl	x0, x1, 5
	add	x0, x0, x1, lsl 2
	add	x1, x0, x1
	add	x1, x2, x1, lsl 4
	ldrsb	w0, [x1, 212]
.L818:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L821:
	ldr	x3, .LC265
	mov	w1, 3309
	ldr	x4, .LC264
	mov	w0, 0
	ldr	x2, .LC266
	add	x3, x3, 704
	bl	dprint_normal
	mov	w0, -1
	b	.L818
	.p2align 3
.L822:
	ldr	x3, .LC265
	mov	w1, 3310
	ldr	x4, .LC267
	mov	w0, 0
	ldr	x2, .LC266
	add	x3, x3, 704
	bl	dprint_normal
	mov	w0, -1
	b	.L818
.L823:
	ldr	x3, .LC265
	mov	w1, 3311
	ldr	x4, .LC269
	mov	w0, 0
	ldr	x2, .LC266
	add	x3, x3, 704
	bl	dprint_normal
	mov	w0, -1
	b	.L818
	.size	FSP_GetDisplay, .-FSP_GetDisplay
	.align	3
.LC264:
	.xword	.LC85
	.align	3
.LC265:
	.xword	.LANCHOR1
	.align	3
.LC266:
	.xword	.LC80
	.align	3
.LC267:
	.xword	.LC239
	.align	3
.LC268:
	.xword	.LANCHOR2
	.align	3
.LC269:
	.xword	.LC106
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetStoreType
	.type	FSP_GetStoreType, %function
FSP_GetStoreType:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	sxtw	x20, w1
	bl	_mcount
	cmp	w19, 3
	bhi	.L829
	ldr	x0, .LC274
	add	x0, x0, 8
	ldr	x2, [x0, w19, sxtw 3]
	cbz	x2, .L830
	ldr	w1, [x2, 12]
	mov	w0, 2
	cmp	w1, w20
	bhi	.L831
.L826:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L829:
	ldr	x3, .LC272
	mov	w1, 3346
	ldr	x4, .LC271
	mov	w0, 0
	ldr	x2, .LC273
	add	x3, x3, 720
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L830:
	ldr	x3, .LC272
	mov	w1, 3347
	ldr	x4, .LC275
	mov	w0, 0
	ldr	x2, .LC273
	add	x3, x3, 720
	bl	dprint_normal
	mov	w0, -1
	b	.L826
	.p2align 3
.L831:
	lsl	x1, x20, 2
	sub	x20, x1, x20
	add	x2, x2, x20, lsl 5
	add	x2, x2, 16384
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x2, 2840]
	ret
	.size	FSP_GetStoreType, .-FSP_GetStoreType
	.align	3
.LC271:
	.xword	.LC85
	.align	3
.LC272:
	.xword	.LANCHOR1
	.align	3
.LC273:
	.xword	.LC80
	.align	3
.LC274:
	.xword	.LANCHOR2
	.align	3
.LC275:
	.xword	.LC106
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetFreeDecFsSlotNum
	.type	FSP_GetFreeDecFsSlotNum, %function
FSP_GetFreeDecFsSlotNum:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	cmp	w20, 3
	bhi	.L841
	ldr	x21, .LC280
	add	x21, x21, 8
	ldr	x0, [x21, w20, sxtw 3]
	cbz	x0, .L842
	ldr	x22, .LC282
	mov	w0, 3
	mov	w19, 0
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x0, [x21, w20, sxtw 3]
	add	x1, x0, 16384
	add	x0, x0, 20480
	add	x1, x1, 2752
	add	x2, x0, 1728
	.p2align 2
.L837:
	ldrb	w0, [x1], 96
	cmp	w0, 1
	csinc	w19, w19, w19, eq
	cmp	x1, x2
	bne	.L837
	ldr	x1, [x22, 32]
	mov	w0, 3
	blr	x1
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L841:
	ldr	x3, .LC278
	mov	w1, 3460
	ldr	x4, .LC277
	mov	w0, 0
	ldr	x2, .LC279
	add	x3, x3, 744
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L842:
	ldr	x3, .LC278
	mov	w1, 3461
	ldr	x4, .LC281
	ldr	x2, .LC279
	add	x3, x3, 744
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	FSP_GetFreeDecFsSlotNum, .-FSP_GetFreeDecFsSlotNum
	.align	3
.LC277:
	.xword	.LC85
	.align	3
.LC278:
	.xword	.LANCHOR1
	.align	3
.LC279:
	.xword	.LC80
	.align	3
.LC280:
	.xword	.LANCHOR2
	.align	3
.LC281:
	.xword	.LC106
	.align	3
.LC282:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ClearNotInVoQueue
	.type	FSP_ClearNotInVoQueue, %function
FSP_ClearNotInVoQueue:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	cmp	w20, 3
	bhi	.L861
	cbz	x22, .L862
	ldr	x0, .LC289
	add	x0, x0, 8
	ldr	x19, [x0, w20, sxtw 3]
	cbz	x19, .L863
	add	x21, x19, 16384
	add	x19, x19, 248
	add	x21, x21, 2808
	b	.L851
	.p2align 3
.L849:
	add	x19, x19, 592
	cmp	x19, x21
	beq	.L864
.L851:
	ldrsb	w1, [x19, -56]
	mov	w2, 0
	mov	w0, w20
	cbnz	w1, .L848
	ldr	w1, [x19, -36]
	cbz	w1, .L849
.L848:
	ldr	w1, [x19, -52]
	bl	FSP_SetRef
	ldr	x2, [x19, -24]
	mov	x1, x19
	mov	x0, x22
	cbz	x2, .L849
	ldr	w2, [x2, 84]
	cmp	w2, 4
	beq	.L849
	bl	IsImageInVoQueue
	cbz	w0, .L849
	ldr	w1, [x19, -52]
	mov	w2, 0
	mov	w0, w20
	add	x19, x19, 592
	bl	FSP_SetDisplay
	cmp	x19, x21
	bne	.L851
	.p2align 2
.L864:
	mov	w0, 0
.L860:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L861:
	ldr	x3, .LC285
	mov	w1, 3489
	ldr	x4, .LC284
	mov	w0, 0
	ldr	x2, .LC286
	add	x3, x3, 768
	bl	dprint_normal
	mov	w0, -1
	b	.L860
.L863:
	ldr	x3, .LC285
	mov	w1, 3491
	ldr	x4, .LC290
	mov	w0, 0
	ldr	x2, .LC286
	add	x3, x3, 768
	bl	dprint_normal
	mov	w0, -1
	b	.L860
.L862:
	ldr	x3, .LC285
	mov	w1, 3490
	ldr	x4, .LC288
	mov	w0, 0
	ldr	x2, .LC286
	add	x3, x3, 768
	bl	dprint_normal
	mov	w0, -1
	b	.L860
	.size	FSP_ClearNotInVoQueue, .-FSP_ClearNotInVoQueue
	.align	3
.LC284:
	.xword	.LC85
	.align	3
.LC285:
	.xword	.LANCHOR1
	.align	3
.LC286:
	.xword	.LC80
	.align	3
.LC288:
	.xword	.LC287
	.align	3
.LC289:
	.xword	.LANCHOR2
	.align	3
.LC290:
	.xword	.LC106
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetOccupiedNum
	.type	FSP_GetOccupiedNum, %function
FSP_GetOccupiedNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w2
	bl	_mcount
	cmp	w19, 3
	bhi	.L871
	cmp	w20, 1088
	mov	w0, 1
	bgt	.L867
	ldr	x1, .LC292
	mov	w0, 4
	ldr	x1, [x1, w19, sxtw 3]
	ldr	w1, [x1, 120]
	cmp	w1, wzr
	csinc	w0, w0, wzr, eq
.L867:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L871:
	bl	FSP_GetOccupiedNum.part.27
	b	.L867
	.size	FSP_GetOccupiedNum, .-FSP_GetOccupiedNum
	.align	3
.LC292:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IfCanGetDecFs
	.type	FSP_IfCanGetDecFs, %function
FSP_IfCanGetDecFs:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L892
	cbz	x20, .L893
	ldr	x0, .LC297
	add	x0, x0, 8
	ldr	x4, [x0, w19, sxtw 3]
	cbz	x4, .L894
	add	x3, x4, 16384
	mov	w1, 0
	add	x3, x3, 2836
	mov	x5, x3
	b	.L882
	.p2align 3
.L877:
	cmp	w1, 32
	add	x5, x5, 96
	beq	.L895
.L882:
	sxtw	x2, w1
	add	w1, w1, 1
	lsl	x0, x2, 2
	sub	x0, x0, x2
	add	x0, x4, x0, lsl 5
	add	x0, x0, 16384
	ldrh	w0, [x0, 2752]
	cmp	w0, 1
	bne	.L877
	ldr	w0, [x5]
	cbnz	w0, .L877
	ldr	w0, [x4, 124]
	ldr	w6, [x5, -44]
	cmp	w6, w0
	bne	.L877
	ldr	w0, [x4, 136]
	ldr	w6, [x5, -40]
	cmp	w6, w0
	bne	.L877
	mov	w0, 0
	b	.L888
	.p2align 3
.L895:
	mov	w5, 0
	mov	w1, 0
	b	.L879
	.p2align 3
.L878:
	cmp	w1, 32
	add	x3, x3, 96
	beq	.L896
.L879:
	sxtw	x2, w1
	add	w1, w1, 1
	lsl	x0, x2, 2
	sub	x0, x0, x2
	add	x0, x4, x0, lsl 5
	add	x0, x0, 16384
	ldrh	w0, [x0, 2752]
	cmp	w0, 1
	bne	.L878
	ldr	w0, [x3]
	add	x3, x3, 96
	cmp	w0, 3
	csinc	w5, w5, w5, ne
	cmp	w1, 32
	bne	.L879
.L896:
	ldr	w0, [x4, 48]
	cmp	w0, 1088
	bgt	.L897
	ldr	x1, .LC300
	mov	w0, 4
	ldr	x1, [x1, w19, sxtw 3]
	ldr	w1, [x1, 120]
	cmp	w1, wzr
	csinc	w0, w0, wzr, eq
.L881:
	cmp	w0, w5
	csetm	w0, ge
.L888:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L897:
	mov	w0, 1
	b	.L881
.L892:
	ldr	x3, .LC294
	mov	w1, 3544
	ldr	x4, .LC293
	mov	w0, 0
	ldr	x2, .LC295
	add	x3, x3, 792
	bl	dprint_normal
	mov	w0, -1
	b	.L888
.L894:
	ldr	x3, .LC294
	mov	w1, 3546
	ldr	x4, .LC299
	mov	w0, 0
	ldr	x2, .LC295
	add	x3, x3, 792
	bl	dprint_normal
	mov	w0, -1
	b	.L888
.L893:
	ldr	x3, .LC294
	mov	w1, 3545
	ldr	x4, .LC296
	mov	w0, 0
	ldr	x2, .LC295
	add	x3, x3, 792
	bl	dprint_normal
	mov	w0, -1
	b	.L888
	.size	FSP_IfCanGetDecFs, .-FSP_IfCanGetDecFs
	.align	3
.LC293:
	.xword	.LC85
	.align	3
.LC294:
	.xword	.LANCHOR1
	.align	3
.LC295:
	.xword	.LC80
	.align	3
.LC296:
	.xword	.LC287
	.align	3
.LC297:
	.xword	.LANCHOR2
	.align	3
.LC299:
	.xword	.LC298
	.align	3
.LC300:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ClearLogicFs
	.type	FSP_ClearLogicFs, %function
FSP_ClearLogicFs:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 3
	bhi	.L907
	ldr	x0, .LC305
	add	x0, x0, 8
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L908
	cmp	w20, 31
	bls	.L909
.L898:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L909:
	mov	w2, 0
	mov	w1, w20
	mov	w0, w19
	bl	FSP_SetRef
	mov	w1, w20
	mov	w0, w19
	bl	FSP_GetDisplay
	cmp	w0, 3
	beq	.L898
	mov	w1, w20
	mov	w0, w19
	mov	w2, 0
	bl	FSP_SetDisplay
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L907:
	ldr	x3, .LC303
	mov	w1, 3608
	ldr	x4, .LC302
	mov	w0, 0
	ldr	x2, .LC304
	add	x3, x3, 816
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L908:
	ldr	x3, .LC303
	mov	w1, 3609
	ldr	x4, .LC306
	ldr	x2, .LC304
	add	x3, x3, 816
	bl	dprint_normal
	b	.L898
	.size	FSP_ClearLogicFs, .-FSP_ClearLogicFs
	.align	3
.LC302:
	.xword	.LC85
	.align	3
.LC303:
	.xword	.LANCHOR1
	.align	3
.LC304:
	.xword	.LC80
	.align	3
.LC305:
	.xword	.LANCHOR2
	.align	3
.LC306:
	.xword	.LC106
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetLogicFs
	.type	FSP_GetLogicFs, %function
FSP_GetLogicFs:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, 3
	bhi	.L915
	ldr	x0, .LC311
	add	x0, x0, 8
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L916
	cmp	w19, 31
	bhi	.L914
	sxtw	x1, w19
	lsl	x2, x1, 5
	add	x2, x2, x1, lsl 2
	add	x1, x2, x1
	add	x0, x0, x1, lsl 4
	add	x0, x0, 192
.L912:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L914:
	mov	x0, 0
	b	.L912
	.p2align 3
.L915:
	ldr	x3, .LC309
	mov	w1, 3628
	ldr	x4, .LC308
	mov	w0, 0
	ldr	x2, .LC310
	add	x3, x3, 840
	bl	dprint_normal
	mov	x0, 0
	b	.L912
.L916:
	ldr	x3, .LC309
	mov	w1, 3629
	ldr	x4, .LC312
	ldr	x2, .LC310
	add	x3, x3, 840
	bl	dprint_normal
	mov	x0, 0
	b	.L912
	.size	FSP_GetLogicFs, .-FSP_GetLogicFs
	.align	3
.LC308:
	.xword	.LC85
	.align	3
.LC309:
	.xword	.LANCHOR1
	.align	3
.LC310:
	.xword	.LC80
	.align	3
.LC311:
	.xword	.LANCHOR2
	.align	3
.LC312:
	.xword	.LC106
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_LinkLogicFs
	.type	FSP_LinkLogicFs, %function
FSP_LinkLogicFs:
	sub	sp, sp, #128
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	stp	x19, x20, [sp, 48]
	stp	x21, x22, [sp, 64]
	stp	x23, x24, [sp, 80]
	stp	x25, x26, [sp, 96]
	stp	x27, x28, [sp, 112]
	mov	w25, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w25, 3
	bhi	.L947
	cmp	w20, 31
	bhi	.L948
	ldr	x0, .LC319
	add	x0, x0, 8
	ldr	x23, [x0, w25, sxtw 3]
	cbz	x23, .L949
	ldr	w0, [x23, 76]
	cbz	w0, .L950
	ldr	x21, .LC321
	mov	w0, 3
	ldr	x1, [x21, 24]
	blr	x1
	add	x0, x23, 192
	mov	w1, 0
	b	.L936
	.p2align 3
.L923:
	add	w1, w1, 1
	add	x0, x0, 592
	cmp	w1, 32
	beq	.L934
.L936:
	ldrsb	w2, [x0]
	cbnz	w2, .L923
	ldr	w2, [x0, 20]
	cbnz	w2, .L923
	sxtw	x22, w1
	lsl	x19, x22, 5
	add	x19, x19, x22, lsl 2
	add	x19, x19, x22
	lsl	x19, x19, 4
	add	x24, x23, x19
	add	x19, x19, 192
	adds	x19, x23, x19
	str	w1, [x24, 196]
	beq	.L934
	mov	w0, w25
	mov	w1, w20
	bl	FSP_GetLogicFs
	mov	x25, x0
	cbz	x0, .L951
	ldp	x5, x6, [x0, 24]
	cbz	x5, .L928
	cbz	x6, .L928
	ldr	w0, [x0, 12]
	add	x2, x19, 32
	str	w0, [x24, 204]
	mov	x0, x23
	ldr	x1, [x25, 24]
	str	x1, [x24, 216]
	ldr	x3, [x25, 40]
	str	x3, [x24, 232]
	bl	FSP_FindIdleDispFs.isra.20
	cbnz	w0, .L952
	ldr	x1, [x19, 32]
	add	x2, x19, 48
	mov	x0, x23
	bl	FSP_FindIdleMetadata.isra.22
	cbnz	w0, .L953
	ldr	x1, [x24, 216]
	ldr	w0, [x1, 80]
	add	w0, w0, 1
	str	w0, [x1, 80]
	ldp	x1, x0, [x24, 216]
	cmp	x1, x0
	beq	.L932
	mov	w1, 1
	str	w1, [x0, 84]
	ldr	x0, [x24, 224]
	ldr	w1, [x24, 204]
	str	w1, [x0, 76]
	ldr	x1, [x24, 224]
	ldr	w0, [x1, 80]
	add	w0, w0, 1
	str	w0, [x1, 80]
.L932:
	lsl	x0, x22, 5
	mov	w1, 2
	add	x0, x0, x22, lsl 2
	ldr	x3, [x21, 104]
	add	x0, x0, x22
	mov	w28, 1
	lsl	x0, x0, 4
	mov	x2, 536
	add	x26, x23, x0
	add	x20, x19, 56
	add	x0, x26, 248
	stp	w1, w28, [x26, 208]
	add	x1, x25, 56
	ldr	x24, [x26, 224]
	ldr	x27, [x26, 240]
	blr	x3
	ldr	w0, [x26, 196]
	str	w0, [x20, 88]
	ldr	w0, [x24, 44]
	str	w0, [x20, 424]
	ldr	w0, [x24, 48]
	str	w0, [x20, 428]
	ldr	w0, [x24, 52]
	str	w0, [x20, 440]
	ldr	w0, [x24, 64]
	str	w0, [x20, 432]
	ldr	w0, [x24, 68]
	str	w0, [x20, 436]
	ldr	w0, [x24, 4]
	str	w0, [x20, 444]
	ldr	w0, [x24, 16]
	str	w0, [x20, 448]
	ldr	w1, [x24, 4]
	ldr	w0, [x24, 72]
	add	w0, w1, w0
	str	w0, [x20, 452]
	ldr	w1, [x24, 4]
	ldr	w0, [x24, 56]
	add	w0, w1, w0
	str	w0, [x20, 464]
	ldr	w1, [x24, 4]
	ldr	w0, [x24, 60]
	add	w0, w1, w0
	str	w0, [x20, 468]
	ldrb	w0, [x23, 161]
	strb	w0, [x20, 420]
	ldr	w0, [x24, 20]
	str	w0, [x20, 472]
	ldr	x0, [x24, 24]
	str	x0, [x20, 480]
	ldr	w0, [x24, 32]
	str	w0, [x20, 488]
	cbz	x27, .L933
	ldr	w0, [x27, 8]
	strb	w28, [x27, 1]
	str	w0, [x20, 276]
	ldr	w0, [x27, 8]
	bl	MEM_Phy2Vir
	str	x0, [x20, 280]
.L933:
	ldr	x1, [x21, 32]
	mov	w0, 3
	blr	x1
	lsl	x0, x22, 5
	ldr	w5, [x25, 4]
	add	x0, x0, x22, lsl 2
	ldr	w6, [x25, 12]
	add	x22, x0, x22
	ldr	x2, .LC332
	mov	w1, 3214
	mov	w0, 14
	add	x23, x23, x22, lsl 4
	ldp	x8, x9, [x23, 216]
	ldr	w3, [x23, 196]
	ldr	w4, [x23, 204]
	ldr	w10, [x9, 76]
	ldr	w7, [x8, 36]
	str	w10, [sp, 16]
	ldr	w9, [x9, 36]
	str	w9, [sp, 8]
	ldr	w8, [x8, 76]
	str	w8, [sp]
	bl	dprint_normal
	mov	x0, x19
.L944:
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L950:
	mov	w1, 0
	mov	w0, w25
	bl	FSP_NewLogicFs
	mov	w1, w0
	mov	w0, w25
	bl	FSP_GetLogicFs
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L934:
	ldr	x3, .LC315
	mov	w1, 3124
	ldr	x2, .LC322
	mov	w0, 0
	add	x3, x3, 856
	bl	dprint_normal
.L925:
	ldr	x1, [x21, 32]
	mov	w0, 3
	blr	x1
	add	sp, x29, 0
	mov	x0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L952:
	ldr	x3, .LC315
	mov	w1, 3150
	ldr	x2, .LC328
	mov	w0, 0
	add	x3, x3, 856
	bl	dprint_normal
	b	.L925
.L947:
	ldr	x3, .LC315
	mov	w1, 3104
	ldr	x4, .LC314
	mov	w0, 0
	ldr	x2, .LC316
	add	x3, x3, 856
	bl	dprint_normal
	mov	x0, 0
	b	.L944
.L948:
	ldr	x3, .LC315
	mov	w1, 3105
	ldr	x4, .LC318
	mov	w0, 0
	ldr	x2, .LC316
	add	x3, x3, 856
	bl	dprint_normal
	mov	x0, 0
	b	.L944
.L928:
	ldr	x3, .LC315
	mov	w4, w20
	ldr	x2, .LC326
	mov	w1, 3138
	add	x3, x3, 856
	mov	w0, 0
	bl	dprint_normal
	b	.L925
.L953:
	ldr	x3, .LC315
	mov	w1, 3158
	ldr	x2, .LC330
	mov	w0, 0
	add	x3, x3, 856
	bl	dprint_normal
	b	.L925
.L949:
	ldr	x3, .LC315
	mov	w1, 3106
	ldr	x4, .LC320
	mov	w0, 0
	ldr	x2, .LC316
	add	x3, x3, 856
	bl	dprint_normal
	mov	x0, 0
	b	.L944
.L951:
	ldr	x2, .LC324
	mov	w3, w20
	mov	w1, 3132
	mov	w0, 0
	bl	dprint_normal
	b	.L925
	.size	FSP_LinkLogicFs, .-FSP_LinkLogicFs
	.align	3
.LC314:
	.xword	.LC85
	.align	3
.LC315:
	.xword	.LANCHOR1
	.align	3
.LC316:
	.xword	.LC80
	.align	3
.LC318:
	.xword	.LC317
	.align	3
.LC319:
	.xword	.LANCHOR2
	.align	3
.LC320:
	.xword	.LC106
	.align	3
.LC321:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC322:
	.xword	.LC216
	.align	3
.LC324:
	.xword	.LC323
	.align	3
.LC326:
	.xword	.LC325
	.align	3
.LC328:
	.xword	.LC327
	.align	3
.LC330:
	.xword	.LC329
	.align	3
.LC332:
	.xword	.LC331
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_SetStoreType
	.type	FSP_SetStoreType, %function
FSP_SetStoreType:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	mov	w21, w2
	bl	_mcount
	mov	w1, w19
	mov	w0, w20
	bl	FSP_GetLogicFs
	cbz	x0, .L958
	ldr	x0, [x0, 24]
	cbz	x0, .L959
	str	w21, [x0, 88]
	mov	w0, 0
.L956:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L958:
	ldr	x3, .LC334
	mov	w4, w19
	ldr	x2, .LC336
	mov	w1, 3326
	add	x3, x3, 872
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L956
.L959:
	ldr	x3, .LC334
	mov	w4, w19
	ldr	x2, .LC338
	mov	w1, 3332
	add	x3, x3, 872
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L956
	.size	FSP_SetStoreType, .-FSP_SetStoreType
	.align	3
.LC334:
	.xword	.LANCHOR1
	.align	3
.LC336:
	.xword	.LC335
	.align	3
.LC338:
	.xword	.LC337
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ReleasePmv
	.type	FSP_ReleasePmv, %function
FSP_ReleasePmv:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	mov	w1, w20
	mov	w0, w19
	bl	FSP_GetLogicFs
	cbz	x0, .L966
	ldr	x1, [x0, 40]
	cbz	x1, .L960
	ldr	w0, [x0, 12]
	ldr	w2, [x1, 20]
	cmp	w2, w0
	bne	.L960
	strb	wzr, [x1, 1]
.L960:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L966:
	ldr	x3, .LC339
	mov	w1, 3587
	ldr	x2, .LC341
	mov	w0, 1
	add	x3, x3, 896
	bl	dprint_normal
	b	.L960
	.size	FSP_ReleasePmv, .-FSP_ReleasePmv
	.align	3
.LC339:
	.xword	.LANCHOR1
	.align	3
.LC341:
	.xword	.LC340
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetLogicFs_By_DecAddr
	.type	FSP_GetLogicFs_By_DecAddr, %function
FSP_GetLogicFs_By_DecAddr:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w19, w0
	mov	x0, x30
	mov	w21, w1
	mov	w22, w2
	bl	_mcount
	cmp	w19, 3
	bhi	.L991
	ldr	x0, .LC345
	add	x0, x0, 8
	ldr	x24, [x0, w19, sxtw 3]
	cbz	x24, .L992
	ldr	x25, .LC343
	add	x20, x24, 16384
	ldr	x26, .LC348
	add	x19, x24, 192
	add	x20, x20, 2752
	mov	x23, 0
	add	x25, x25, 912
	b	.L975
	.p2align 3
.L972:
	add	x19, x19, 592
	cmp	x19, x20
	beq	.L977
.L975:
	ldrsb	w1, [x19]
	cbnz	w1, .L971
	ldr	w0, [x19, 20]
	cbz	w0, .L972
.L971:
	mov	w1, w21
	mov	x0, x19
	bl	FSP_IsLogicFsMatchTargetCore.part.18
	cbz	w0, .L972
	ldr	x1, [x19, 24]
	cbz	x1, .L972
	ldr	w0, [x1, 4]
	cmp	w0, w22
	bne	.L972
	cbz	x23, .L990
	ldr	w0, [x19, 12]
	ldr	w1, [x23, 12]
	cmp	w0, w1
	bhi	.L993
.L974:
	ldr	w0, [x24, 4]
	sub	w0, w0, #1
	cmp	w1, w0
	bne	.L972
	.p2align 2
.L977:
	mov	x0, x23
.L988:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L993:
	mov	x3, x25
	mov	x2, x26
	mov	w1, 3676
	mov	w0, 1
	bl	dprint_normal
.L990:
	mov	x23, x19
	ldr	w1, [x19, 12]
	b	.L974
.L991:
	ldr	x3, .LC343
	mov	w1, 3646
	ldr	x4, .LC342
	mov	w0, 0
	ldr	x2, .LC344
	add	x3, x3, 912
	bl	dprint_normal
	mov	x0, 0
	b	.L988
.L992:
	ldr	x3, .LC343
	mov	w1, 3647
	ldr	x4, .LC346
	mov	w0, 0
	ldr	x2, .LC344
	add	x3, x3, 912
	bl	dprint_normal
	mov	x0, 0
	b	.L988
	.size	FSP_GetLogicFs_By_DecAddr, .-FSP_GetLogicFs_By_DecAddr
	.align	3
.LC342:
	.xword	.LC85
	.align	3
.LC343:
	.xword	.LANCHOR1
	.align	3
.LC344:
	.xword	.LC80
	.align	3
.LC345:
	.xword	.LANCHOR2
	.align	3
.LC346:
	.xword	.LC106
	.align	3
.LC348:
	.xword	.LC347
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetLogicFs_By_DispAddr
	.type	FSP_GetLogicFs_By_DispAddr, %function
FSP_GetLogicFs_By_DispAddr:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w21, w1
	mov	w22, w2
	bl	_mcount
	cmp	w19, 3
	bhi	.L1015
	ldr	x0, .LC354
	add	x0, x0, 8
	ldr	x19, [x0, w19, sxtw 3]
	cbz	x19, .L1016
	add	x20, x19, 16384
	add	x19, x19, 192
	add	x20, x20, 2752
	.p2align 2
.L1000:
	ldrsb	w0, [x19]
	cbnz	w0, .L998
	ldr	w0, [x19, 20]
	cbz	w0, .L999
.L998:
	mov	x0, x19
	mov	w1, w21
	bl	FSP_IsLogicFsMatchTargetCore.part.18
	cbz	w0, .L999
	ldr	x0, [x19, 32]
	cbz	x0, .L999
	ldr	w0, [x0, 4]
	cmp	w0, w22
	beq	.L1002
.L999:
	add	x19, x19, 592
	cmp	x19, x20
	bne	.L1000
	mov	x0, 0
.L1013:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1002:
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1015:
	ldr	x3, .LC352
	mov	w1, 3696
	ldr	x4, .LC351
	mov	w0, 0
	ldr	x2, .LC353
	add	x3, x3, 944
	bl	dprint_normal
	mov	x0, 0
	b	.L1013
.L1016:
	ldr	x3, .LC352
	mov	w1, 3697
	ldr	x4, .LC355
	mov	w0, 0
	ldr	x2, .LC353
	add	x3, x3, 944
	bl	dprint_normal
	mov	x0, 0
	b	.L1013
	.size	FSP_GetLogicFs_By_DispAddr, .-FSP_GetLogicFs_By_DispAddr
	.align	3
.LC351:
	.xword	.LC85
	.align	3
.LC352:
	.xword	.LANCHOR1
	.align	3
.LC353:
	.xword	.LC80
	.align	3
.LC354:
	.xword	.LANCHOR2
	.align	3
.LC355:
	.xword	.LC106
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetPairDispFs_By_DecAddr
	.type	FSP_GetPairDispFs_By_DecAddr, %function
FSP_GetPairDispFs_By_DecAddr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	w22, w1
	mov	w23, w2
	bl	_mcount
	cmp	w19, 3
	bhi	.L1048
	ldr	x0, .LC360
	add	x0, x0, 8
	ldr	x21, [x0, w19, sxtw 3]
	cbz	x21, .L1049
	add	x20, x21, 16384
	add	x19, x21, 192
	add	x20, x20, 2752
	mov	x24, 0
	b	.L1023
	.p2align 3
.L1022:
	add	x19, x19, 592
	cmp	x20, x19
	beq	.L1050
.L1023:
	ldrsb	w0, [x19]
	cbnz	w0, .L1021
	ldr	w0, [x19, 20]
	cbz	w0, .L1022
.L1021:
	mov	w1, w22
	mov	x0, x19
	bl	FSP_IsLogicFsMatchTargetCore.part.18
	cbz	w0, .L1022
	ldr	x1, [x19, 24]
	cbz	x1, .L1022
	ldr	w0, [x1, 4]
	cmp	w0, w23
	bne	.L1022
	ldr	x0, [x19, 32]
	cbz	x0, .L1030
	ldr	w2, [x0, 76]
	ldr	w1, [x1, 76]
	cmp	w2, w1
	beq	.L1031
.L1030:
	mov	x24, x19
	add	x19, x19, 592
	cmp	x20, x19
	bne	.L1023
	.p2align 2
.L1050:
	mov	x19, 0
	cbz	x24, .L1040
	cmp	w22, 2
	bne	.L1024
	ldr	w5, [x21, 16]
	ldr	w6, [x24, 12]
	cbz	w5, .L1033
	mov	w4, -1
	mov	w3, 0
	.p2align 2
.L1028:
	sxtw	x0, w3
	add	w3, w3, 1
	lsl	x1, x0, 2
	sub	x1, x1, x0
	lsl	x1, x1, 5
	add	x2, x21, x1
	add	x1, x1, 20480
	add	x2, x2, 20480
	add	x1, x1, 1728
	ldr	w2, [x2, 1804]
	sub	w2, w2, w6
	sxtw	x2, w2
	eor	x0, x2, x2, asr 63
	sub	x0, x0, x2, asr 63
	cmp	w4, w0
	bls	.L1027
	add	x19, x21, x1
	mov	w4, w0
.L1027:
	cmp	w3, w5
	bne	.L1028
.L1025:
	ldr	x2, .LC363
	mov	w1, 3780
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1031:
	mov	x19, x0
.L1040:
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1024:
	ldr	x2, .LC365
	mov	w3, w22
	mov	w1, 3784
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L1048:
	ldr	x3, .LC358
	mov	w1, 3733
	ldr	x4, .LC357
	mov	w0, 0
	ldr	x2, .LC359
	add	x3, x3, 976
	mov	x19, 0
	bl	dprint_normal
	b	.L1040
.L1033:
	mov	x19, 0
	b	.L1025
.L1049:
	ldr	x3, .LC358
	mov	w1, 3734
	ldr	x4, .LC361
	mov	w0, 0
	ldr	x2, .LC359
	add	x3, x3, 976
	mov	x19, 0
	bl	dprint_normal
	b	.L1040
	.size	FSP_GetPairDispFs_By_DecAddr, .-FSP_GetPairDispFs_By_DecAddr
	.align	3
.LC357:
	.xword	.LC85
	.align	3
.LC358:
	.xword	.LANCHOR1
	.align	3
.LC359:
	.xword	.LC80
	.align	3
.LC360:
	.xword	.LANCHOR2
	.align	3
.LC361:
	.xword	.LC106
	.align	3
.LC363:
	.xword	.LC362
	.align	3
.LC365:
	.xword	.LC364
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_MarkImageOutHanging
	.type	FSP_MarkImageOutHanging, %function
FSP_MarkImageOutHanging:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cmp	w20, 3
	bhi	.L1072
	ldr	x19, .LC370
	add	x19, x19, 8
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L1073
	ldr	x22, .LC372
	mov	w0, 3
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x19, [x19, w20, sxtw 3]
	ldr	w1, [x21, 444]
	mov	x0, x19
	bl	FSP_MarkFsOutHanging
	ldr	w1, [x21, 456]
	cbnz	w1, .L1074
	ldr	w5, [x21, 276]
	cbnz	w5, .L1075
.L1056:
	ldr	x1, [x22, 32]
	mov	w0, 3
	blr	x1
	mov	w0, 0
.L1053:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1074:
	mov	x0, x19
	bl	FSP_MarkFsOutHanging
	ldr	w5, [x21, 276]
	cbz	w5, .L1056
.L1075:
	ldr	w2, [x19, 24]
	cbz	w2, .L1056
	add	x0, x19, 24576
	add	x6, x0, 1472
	ldr	w0, [x0, 1480]
	cmp	w5, w0
	beq	.L1057
	mov	w0, 0
.L1058:
	add	w0, w0, 1
	cmp	w0, w2
	sxtw	x1, w0
	add	x1, x1, 1628
	beq	.L1057
	add	x6, x19, x1, lsl 4
	ldr	w1, [x6, 8]
	cmp	w5, w1
	bne	.L1058
.L1057:
	cbz	x6, .L1056
	ldr	x3, .LC368
	mov	w0, 1
	mov	w4, 2405
	ldr	x2, .LC374
	strb	w0, [x6, 2]
	add	x3, x3, 1032
	strb	w0, [x6, 1]
	mov	w1, w4
	mov	w0, 26
	bl	dprint_normal
	b	.L1056
	.p2align 3
.L1072:
	ldr	x3, .LC368
	mov	w1, 3796
	ldr	x4, .LC367
	mov	w0, 0
	ldr	x2, .LC369
	add	x3, x3, 1008
	bl	dprint_normal
	mov	w0, -1
	b	.L1053
.L1073:
	ldr	x3, .LC368
	mov	w1, 3797
	ldr	x4, .LC371
	ldr	x2, .LC369
	add	x3, x3, 1008
	bl	dprint_normal
	mov	w0, -1
	b	.L1053
	.size	FSP_MarkImageOutHanging, .-FSP_MarkImageOutHanging
	.align	3
.LC367:
	.xword	.LC85
	.align	3
.LC368:
	.xword	.LANCHOR1
	.align	3
.LC369:
	.xword	.LC80
	.align	3
.LC370:
	.xword	.LANCHOR2
	.align	3
.LC371:
	.xword	.LC106
	.align	3
.LC372:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC374:
	.xword	.LC373
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_UnMarkImageOutHanging
	.type	FSP_UnMarkImageOutHanging, %function
FSP_UnMarkImageOutHanging:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cmp	w20, 3
	bhi	.L1097
	ldr	x19, .LC379
	add	x19, x19, 8
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L1098
	ldr	x22, .LC381
	mov	w0, 3
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x19, [x19, w20, sxtw 3]
	ldr	w1, [x21, 444]
	mov	x0, x19
	bl	FSP_UnMarkFsOutHanging
	ldr	w1, [x21, 456]
	cbnz	w1, .L1099
	ldr	w5, [x21, 276]
	cbnz	w5, .L1100
.L1081:
	ldr	x1, [x22, 32]
	mov	w0, 3
	blr	x1
	mov	w0, 0
.L1078:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1099:
	mov	x0, x19
	bl	FSP_UnMarkFsOutHanging
	ldr	w5, [x21, 276]
	cbz	w5, .L1081
.L1100:
	ldr	w2, [x19, 24]
	cbz	w2, .L1081
	add	x0, x19, 24576
	add	x6, x0, 1472
	ldr	w0, [x0, 1480]
	cmp	w5, w0
	beq	.L1082
	mov	w0, 0
.L1083:
	add	w0, w0, 1
	cmp	w0, w2
	sxtw	x1, w0
	add	x1, x1, 1628
	beq	.L1082
	add	x6, x19, x1, lsl 4
	ldr	w1, [x6, 8]
	cmp	w5, w1
	bne	.L1083
.L1082:
	cbz	x6, .L1081
	ldrb	w0, [x6, 2]
	cmp	w0, 1
	bne	.L1081
	ldr	x3, .LC377
	mov	w4, 2422
	ldr	x2, .LC382
	mov	w1, w4
	strb	wzr, [x6, 2]
	add	x3, x3, 1096
	strb	wzr, [x6, 1]
	mov	w0, 26
	bl	dprint_normal
	b	.L1081
	.p2align 3
.L1097:
	ldr	x3, .LC377
	mov	w1, 3830
	ldr	x4, .LC376
	mov	w0, 0
	ldr	x2, .LC378
	add	x3, x3, 1064
	bl	dprint_normal
	mov	w0, -1
	b	.L1078
.L1098:
	ldr	x3, .LC377
	mov	w1, 3831
	ldr	x4, .LC380
	ldr	x2, .LC378
	add	x3, x3, 1064
	bl	dprint_normal
	mov	w0, -1
	b	.L1078
	.size	FSP_UnMarkImageOutHanging, .-FSP_UnMarkImageOutHanging
	.align	3
.LC376:
	.xword	.LC85
	.align	3
.LC377:
	.xword	.LANCHOR1
	.align	3
.LC378:
	.xword	.LC80
	.align	3
.LC379:
	.xword	.LANCHOR2
	.align	3
.LC380:
	.xword	.LC106
	.align	3
.LC381:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC382:
	.xword	.LC17
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetFsImagePtr
	.type	FSP_GetFsImagePtr, %function
FSP_GetFsImagePtr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, 3
	bhi	.L1106
	ldr	x0, .LC387
	add	x0, x0, 8
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L1107
	cmp	w19, 31
	bhi	.L1105
	sxtw	x1, w19
	lsl	x2, x1, 5
	add	x2, x2, x1, lsl 2
	add	x1, x2, x1
	add	x0, x0, x1, lsl 4
	add	x0, x0, 248
.L1103:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1105:
	mov	x0, 0
	b	.L1103
	.p2align 3
.L1106:
	ldr	x3, .LC385
	mov	w1, 3863
	ldr	x4, .LC384
	mov	w0, 0
	ldr	x2, .LC386
	add	x3, x3, 1128
	bl	dprint_normal
	mov	x0, 0
	b	.L1103
.L1107:
	ldr	x3, .LC385
	mov	w1, 3864
	ldr	x4, .LC388
	ldr	x2, .LC386
	add	x3, x3, 1128
	bl	dprint_normal
	mov	x0, 0
	b	.L1103
	.size	FSP_GetFsImagePtr, .-FSP_GetFsImagePtr
	.align	3
.LC384:
	.xword	.LC85
	.align	3
.LC385:
	.xword	.LANCHOR1
	.align	3
.LC386:
	.xword	.LC80
	.align	3
.LC387:
	.xword	.LANCHOR2
	.align	3
.LC388:
	.xword	.LC106
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetPmvAddr
	.type	FSP_GetPmvAddr, %function
FSP_GetPmvAddr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	mov	w1, w20
	mov	w0, w19
	bl	FSP_GetLogicFs
	cbz	x0, .L1112
	ldr	x0, [x0, 40]
	cbz	x0, .L1111
	ldr	w0, [x0, 8]
.L1110:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1111:
	mov	w0, 0
	b	.L1110
	.p2align 3
.L1112:
	ldr	x3, .LC390
	mov	w1, 3883
	ldr	x2, .LC391
	mov	w0, 1
	add	x3, x3, 1152
	bl	dprint_normal
	mov	w0, 0
	b	.L1110
	.size	FSP_GetPmvAddr, .-FSP_GetPmvAddr
	.align	3
.LC390:
	.xword	.LANCHOR1
	.align	3
.LC391:
	.xword	.LC340
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetDecFsAddrTab
	.type	FSP_GetDecFsAddrTab, %function
FSP_GetDecFsAddrTab:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	x19, x1
	mov	x20, x2
	bl	_mcount
	cmp	w21, 3
	bhi	.L1124
	cbz	x20, .L1125
	cbz	x19, .L1126
	ldr	x0, .LC399
	add	x0, x0, 8
	ldr	x1, [x0, w21, sxtw 3]
	cbz	x1, .L1127
	ldr	w0, [x1, 12]
	mov	w3, 0
	str	w0, [x19]
	cmp	w0, wzr
	ble	.L1113
	.p2align 2
.L1122:
	sxtw	x4, w3
	lsl	x0, x4, 2
	sub	x0, x0, x4
	add	x0, x1, x0, lsl 5
	add	x0, x0, 16384
	ldr	w0, [x0, 2756]
	str	w0, [x20, w3, sxtw 2]
	add	w3, w3, 1
	ldr	w0, [x19]
	cmp	w0, w3
	bgt	.L1122
.L1113:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1124:
	ldr	x3, .LC393
	mov	w1, 3902
	ldr	x4, .LC392
	mov	w0, 0
	ldr	x2, .LC394
	add	x3, x3, 1168
	bl	dprint_normal
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L1125:
	ldr	x3, .LC393
	mov	w1, 3903
	ldr	x4, .LC396
	mov	w0, 0
	ldr	x2, .LC394
	add	x3, x3, 1168
	bl	dprint_normal
	b	.L1113
.L1126:
	ldr	x3, .LC393
	mov	w1, 3904
	ldr	x4, .LC398
	mov	w0, 0
	ldr	x2, .LC394
	add	x3, x3, 1168
	bl	dprint_normal
	b	.L1113
.L1127:
	ldr	x3, .LC393
	mov	w1, 3905
	ldr	x4, .LC400
	mov	w0, 0
	ldr	x2, .LC394
	add	x3, x3, 1168
	bl	dprint_normal
	b	.L1113
	.size	FSP_GetDecFsAddrTab, .-FSP_GetDecFsAddrTab
	.align	3
.LC392:
	.xword	.LC85
	.align	3
.LC393:
	.xword	.LANCHOR1
	.align	3
.LC394:
	.xword	.LC80
	.align	3
.LC396:
	.xword	.LC395
	.align	3
.LC398:
	.xword	.LC397
	.align	3
.LC399:
	.xword	.LANCHOR2
	.align	3
.LC400:
	.xword	.LC106
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetPmvAddrTab
	.type	FSP_GetPmvAddrTab, %function
FSP_GetPmvAddrTab:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	x19, x1
	mov	x20, x2
	bl	_mcount
	cmp	w21, 3
	bhi	.L1139
	cbz	x20, .L1140
	cbz	x19, .L1141
	ldr	x0, .LC409
	add	x0, x0, 8
	ldr	x1, [x0, w21, sxtw 3]
	cbz	x1, .L1142
	ldr	w0, [x1, 20]
	mov	w3, 0
	str	w0, [x19]
	cmp	w0, wzr
	ble	.L1128
	.p2align 2
.L1137:
	sxtw	x4, w3
	lsl	x0, x4, 2
	sub	x0, x0, x4
	add	x0, x1, x0, lsl 3
	add	x0, x0, 24576
	ldr	w0, [x0, 712]
	str	w0, [x20, w3, sxtw 2]
	add	w3, w3, 1
	ldr	w0, [x19]
	cmp	w0, w3
	bgt	.L1137
.L1128:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1139:
	ldr	x3, .LC403
	mov	w1, 3923
	ldr	x4, .LC402
	mov	w0, 0
	ldr	x2, .LC404
	add	x3, x3, 1192
	bl	dprint_normal
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L1140:
	ldr	x3, .LC403
	mov	w1, 3924
	ldr	x4, .LC406
	mov	w0, 0
	ldr	x2, .LC404
	add	x3, x3, 1192
	bl	dprint_normal
	b	.L1128
.L1141:
	ldr	x3, .LC403
	mov	w1, 3925
	ldr	x4, .LC408
	mov	w0, 0
	ldr	x2, .LC404
	add	x3, x3, 1192
	bl	dprint_normal
	b	.L1128
.L1142:
	ldr	x3, .LC403
	mov	w1, 3926
	ldr	x4, .LC410
	mov	w0, 0
	ldr	x2, .LC404
	add	x3, x3, 1192
	bl	dprint_normal
	b	.L1128
	.size	FSP_GetPmvAddrTab, .-FSP_GetPmvAddrTab
	.align	3
.LC402:
	.xword	.LC85
	.align	3
.LC403:
	.xword	.LANCHOR1
	.align	3
.LC404:
	.xword	.LC80
	.align	3
.LC406:
	.xword	.LC405
	.align	3
.LC408:
	.xword	.LC407
	.align	3
.LC409:
	.xword	.LANCHOR2
	.align	3
.LC410:
	.xword	.LC106
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetNullLogicFs
	.type	FSP_GetNullLogicFs, %function
FSP_GetNullLogicFs:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L1152
	ldr	x0, .LC415
	add	x0, x0, 8
	ldr	x3, [x0, w19, sxtw 3]
	cbz	x3, .L1153
	add	x1, x3, 16384
	mov	w0, 31
	add	x1, x1, 2160
	b	.L1148
	.p2align 3
.L1147:
	sub	w0, w0, #1
	sub	x1, x1, #592
	cmn	w0, #1
	beq	.L1154
.L1148:
	ldrsb	w2, [x1]
	cbnz	w2, .L1147
	ldr	w2, [x1, 20]
	cbnz	w2, .L1147
.L1149:
	sxtw	x1, w0
	lsl	x2, x1, 5
	add	x2, x2, x1, lsl 2
	add	x1, x2, x1
	add	x1, x3, x1, lsl 4
	stp	xzr, xzr, [x1, 216]
.L1151:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1154:
	mov	w0, 0
	b	.L1149
.L1152:
	ldr	x3, .LC413
	mov	w1, 3945
	ldr	x4, .LC412
	mov	w0, 0
	ldr	x2, .LC414
	add	x3, x3, 1216
	bl	dprint_normal
	mov	w0, -1
	b	.L1151
.L1153:
	ldr	x3, .LC413
	mov	w1, 3946
	ldr	x4, .LC416
	mov	w0, 0
	ldr	x2, .LC414
	add	x3, x3, 1216
	bl	dprint_normal
	mov	w0, -1
	b	.L1151
	.size	FSP_GetNullLogicFs, .-FSP_GetNullLogicFs
	.align	3
.LC412:
	.xword	.LC85
	.align	3
.LC413:
	.xword	.LANCHOR1
	.align	3
.LC414:
	.xword	.LC80
	.align	3
.LC415:
	.xword	.LANCHOR2
	.align	3
.LC416:
	.xword	.LC106
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetMinAvailableDecFsNum
	.type	FSP_GetMinAvailableDecFsNum, %function
FSP_GetMinAvailableDecFsNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L1160
	ldr	x0, .LC418
	add	x0, x0, 8
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L1160
	ldr	w0, [x1, 48]
	mov	w2, 1
	cmp	w0, 1088
	bgt	.L1157
	ldr	x2, .LC419
	mov	w0, 4
	ldr	x2, [x2, w19, sxtw 3]
	ldr	w2, [x2, 120]
	cmp	w2, wzr
	csinc	w2, w0, wzr, eq
.L1157:
	ldr	w0, [x1, 76]
	cbnz	w0, .L1163
	ldr	w0, [x1, 12]
	ldr	x19, [sp, 16]
	sub	w0, w0, w2
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1163:
	ldr	w0, [x1, 12]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1160:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_GetMinAvailableDecFsNum, .-FSP_GetMinAvailableDecFsNum
	.align	3
.LC418:
	.xword	.LANCHOR2
	.align	3
.LC419:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetTotalDispFsNum
	.type	FSP_GetTotalDispFsNum, %function
FSP_GetTotalDispFsNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC421
	add	x0, x0, 8
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1167
	ldr	w1, [x0, 76]
	cbnz	w1, .L1168
	ldr	w0, [x0, 12]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1168:
	ldr	w0, [x0, 16]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1167:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_GetTotalDispFsNum, .-FSP_GetTotalDispFsNum
	.align	3
.LC421:
	.xword	.LANCHOR2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetWaitDispFsNum
	.type	FSP_GetWaitDispFsNum, %function
FSP_GetWaitDispFsNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L1179
	ldr	x0, .LC426
	add	x0, x0, 8
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L1180
	add	x4, x1, 16384
	mov	w0, 0
	add	x1, x1, 224
	add	x4, x4, 2784
	b	.L1174
	.p2align 3
.L1173:
	add	x1, x1, 592
	cmp	x1, x4
	beq	.L1171
.L1174:
	ldr	x2, [x1]
	cbz	x2, .L1173
	ldr	w3, [x1, -12]
	cmp	w3, 3
	bne	.L1173
	ldr	w2, [x2, 84]
	add	x1, x1, 592
	cmp	w2, 3
	csinc	w0, w0, w0, ne
	cmp	x1, x4
	bne	.L1174
.L1171:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1179:
	ldr	x3, .LC424
	mov	w1, 4023
	ldr	x4, .LC423
	mov	w0, 0
	ldr	x2, .LC425
	add	x3, x3, 1240
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L1180:
	ldr	x3, .LC424
	mov	w1, 4024
	ldr	x4, .LC427
	mov	w0, 0
	ldr	x2, .LC425
	add	x3, x3, 1240
	bl	dprint_normal
	mov	w0, -1
	b	.L1171
	.size	FSP_GetWaitDispFsNum, .-FSP_GetWaitDispFsNum
	.align	3
.LC423:
	.xword	.LC85
	.align	3
.LC424:
	.xword	.LANCHOR1
	.align	3
.LC425:
	.xword	.LC80
	.align	3
.LC426:
	.xword	.LANCHOR2
	.align	3
.LC427:
	.xword	.LC106
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_CheckIfFsPolluted
	.type	FSP_CheckIfFsPolluted, %function
FSP_CheckIfFsPolluted:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC429
	ldr	w0, [x19, 40]
	cbz	w0, .L1181
	ldr	w0, [x19]
	cbnz	w0, .L1210
.L1181:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1210:
	ldr	x21, .LC430
	mov	w0, 3
	ldr	x1, [x21, 24]
	blr	x1
	ldr	w2, [x19, 40]
	mov	w0, w20
	mov	w1, 0
	bl	FSP_GetLogicFs_By_DecAddr
	mov	x20, x0
	cbz	x0, .L1211
	ldr	x0, [x0, 24]
	cbz	x0, .L1184
	ldr	x1, [x20, 32]
	cbz	x1, .L1184
	ldr	x1, [x20, 40]
	cbz	x1, .L1184
.L1185:
	ldr	w1, [x0, 40]
	ldr	w0, [x0, 4]
	bl	FSP_VarifyWaterMark
.L1186:
	ldr	x0, [x20, 32]
	cbz	x0, .L1187
	ldr	w1, [x0, 40]
	ldr	w0, [x0, 4]
	bl	FSP_VarifyWaterMark
.L1187:
	ldr	x0, [x20, 40]
	cbz	x0, .L1188
	ldr	w1, [x0, 12]
	ldr	w0, [x0, 8]
	bl	FSP_VarifyWaterMark
.L1188:
	ldr	x1, [x21, 32]
	mov	w0, 3
	blr	x1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1184:
	ldr	x3, .LC431
	mov	w4, 4069
	ldr	x2, .LC435
	mov	w1, w4
	add	x3, x3, 1264
	mov	w0, 32
	bl	dprint_normal
	ldr	x0, [x20, 24]
	cbz	x0, .L1186
	b	.L1185
	.p2align 3
.L1211:
	ldr	x1, [x21, 32]
	mov	w0, 3
	blr	x1
	ldr	x3, .LC431
	mov	w1, 4063
	ldr	x2, .LC433
	mov	w0, 32
	ldr	w4, [x19, 40]
	add	x3, x3, 1264
	bl	dprint_normal
	b	.L1181
	.size	FSP_CheckIfFsPolluted, .-FSP_CheckIfFsPolluted
	.align	3
.LC429:
	.xword	.LANCHOR2
	.align	3
.LC430:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC431:
	.xword	.LANCHOR1
	.align	3
.LC433:
	.xword	.LC432
	.align	3
.LC435:
	.xword	.LC434
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetInst
	.type	FSP_GetInst, %function
FSP_GetInst:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L1214
	ldr	x0, .LC436
	add	x0, x0, 8
	ldr	x0, [x0, w19, sxtw 3]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1214:
	mov	x0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_GetInst, .-FSP_GetInst
	.align	3
.LC436:
	.xword	.LANCHOR2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_DumpState
	.type	FSP_DumpState, %function
FSP_DumpState:
	sub	sp, sp, #128
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	stp	x19, x20, [sp, 48]
	stp	x21, x22, [sp, 64]
	stp	x23, x24, [sp, 80]
	stp	x25, x26, [sp, 96]
	stp	x27, x28, [sp, 112]
	mov	w21, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w21, 3
	bls	.L1358
.L1216:
	ldr	x2, .LC448
	mov	w3, w21
	mov	w1, 4112
	mov	w0, 32
	bl	dprint_normal
.L1215:
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1358:
	ldr	x0, .LC446
	add	x0, x0, 8
	ldr	x19, [x0, w21, sxtw 3]
	cbz	x19, .L1216
	ldr	w0, [x19]
	bl	VCTRL_GetExtraFrameNum
	mov	w24, w0
	ldp	w1, w2, [x19, 48]
	ldr	w0, [x19]
	bl	VCTRL_GetOccupiedNum
	mov	w23, w0
	cbz	x20, .L1359
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	ldr	w0, [x19, 76]
	cbz	w0, .L1222
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
.L1222:
	bl	dprint_nothing
	ldr	w0, [x19, 80]
	cbz	w0, .L1360
	bl	dprint_nothing
	bl	dprint_nothing
	bl	dprint_nothing
	ldr	w0, [x19, 84]
	cbz	w0, .L1361
.L1229:
	bl	dprint_nothing
	bl	dprint_nothing
.L1234:
	bl	dprint_nothing
	bl	dprint_nothing
.L1235:
	ldr	x21, .LC568
	add	x24, x19, 192
	ldr	x28, .LC552
	mov	w22, 0
	ldr	x27, .LC554
	mov	w23, 0
	ldr	x26, .LC556
	ldr	x25, .LC558
	b	.L1244
	.p2align 3
.L1363:
	ldr	w0, [x24, 20]
	cbnz	w0, .L1236
	add	w22, w22, 1
.L1243:
	add	w23, w23, 1
	add	x24, x24, 592
	cmp	w23, 32
	beq	.L1362
.L1244:
	ldrsb	w5, [x24]
	cbz	w5, .L1363
.L1236:
	cmp	w23, w22
	beq	.L1364
	cbz	x20, .L1239
	bl	dprint_nothing
.L1379:
	add	w23, w23, 1
	add	x24, x24, 592
	cmp	w23, 32
	bne	.L1244
.L1362:
	cbz	x20, .L1365
	bl	dprint_nothing
	bl	dprint_nothing
	ldr	w0, [x19, 12]
	cbz	w0, .L1366
	bl	dprint_nothing
	bl	dprint_nothing
	ldr	w0, [x19, 12]
	cbz	w0, .L1253
.L1252:
	ldr	x22, .LC443
	mov	w23, 0
	ldr	x21, .LC586
	mov	w25, 0
	ldr	x24, .LC445
	.p2align 2
.L1251:
	sxtw	x1, w25
	lsl	x0, x1, 2
	sub	x0, x0, x1
	add	x0, x19, x0, lsl 5
	add	x0, x0, 16384
	ldrh	w2, [x0, 2752]
	cmp	w2, 1
	beq	.L1367
.L1254:
	cbz	x20, .L1368
.L1290:
	bl	dprint_nothing
.L1256:
	ldr	w5, [x19, 12]
	add	w25, w25, 1
	cmp	w5, w25
	bhi	.L1251
	cbz	x20, .L1369
.L1253:
	bl	dprint_nothing
	bl	dprint_nothing
	ldr	w0, [x19, 16]
	cbz	w0, .L1257
.L1260:
	bl	dprint_nothing
	bl	dprint_nothing
	ldr	w0, [x19, 16]
	cbz	w0, .L1262
.L1258:
	ldr	x22, .LC443
	mov	w23, 0
	ldr	x21, .LC586
	mov	w25, 0
	ldr	x24, .LC445
	.p2align 2
.L1261:
	sxtw	x1, w25
	lsl	x0, x1, 2
	sub	x0, x0, x1
	add	x0, x19, x0, lsl 5
	add	x0, x0, 20480
	ldrh	w2, [x0, 1728]
	cmp	w2, 1
	beq	.L1370
.L1263:
	cbz	x20, .L1371
.L1294:
	bl	dprint_nothing
.L1265:
	ldr	w5, [x19, 16]
	add	w25, w25, 1
	cmp	w5, w25
	bhi	.L1261
	cbz	x20, .L1372
.L1262:
	bl	dprint_nothing
	bl	dprint_nothing
	ldr	w0, [x19, 20]
	cbz	w0, .L1266
.L1269:
	bl	dprint_nothing
	bl	dprint_nothing
	ldr	w0, [x19, 20]
	cbz	w0, .L1272
.L1267:
	ldr	x23, .LC443
	mov	w22, 0
	ldr	x21, .LC602
	mov	w25, 0
	ldr	x24, .LC445
	.p2align 2
.L1271:
	sxtw	x1, w25
	lsl	x0, x1, 2
	sub	x0, x0, x1
	add	x0, x19, x0, lsl 3
	add	x0, x0, 24576
	ldrh	w2, [x0, 704]
	cmp	w2, 1
	beq	.L1373
.L1273:
	cbz	x20, .L1374
.L1298:
	bl	dprint_nothing
.L1275:
	ldr	w5, [x19, 20]
	add	w25, w25, 1
	cmp	w5, w25
	bhi	.L1271
	cbz	x20, .L1268
.L1272:
	bl	dprint_nothing
	bl	dprint_nothing
	ldr	w0, [x19, 24]
	cbz	w0, .L1215
.L1279:
	bl	dprint_nothing
	bl	dprint_nothing
	ldr	w0, [x19, 24]
	cbz	w0, .L1282
.L1277:
	ldr	x24, .LC443
	mov	w23, 0
	ldr	x22, .LC602
	mov	w21, 0
	ldr	x25, .LC445
	.p2align 2
.L1281:
	sxtw	x1, w21
	add	x0, x1, 1628
	lsl	x0, x0, 4
	ldrh	w0, [x19, x0]
	cmp	w0, 1
	beq	.L1375
.L1283:
	cbz	x20, .L1376
.L1302:
	bl	dprint_nothing
.L1285:
	ldr	w5, [x19, 24]
	add	w21, w21, 1
	cmp	w5, w21
	bhi	.L1281
	cbz	x20, .L1278
.L1282:
	bl	dprint_nothing
	bl	dprint_nothing
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1378:
	ldr	x0, .LC564
	mov	x5, x26
	str	x0, [sp, 8]
	mov	x7, x28
	ldr	x0, .LC566
	mov	x6, x27
	ldr	x3, .LC560
	mov	x4, x25
	ldr	x2, .LC562
	mov	w1, 1088
	str	x0, [sp]
	mov	w0, 32
	bl	dprint_normal
	ldrsb	w5, [x24]
	.p2align 2
.L1239:
	ldr	x0, [x24, 24]
	ldr	w3, [x24, 4]
	ldp	w4, w6, [x24, 12]
	ldr	w7, [x24, 20]
	cbz	x0, .L1308
	ldr	w1, [x0, 4]
.L1241:
	ldr	x0, [x24, 32]
	cbz	x0, .L1309
	ldr	w0, [x0, 4]
.L1242:
	str	w1, [sp]
	mov	x2, x21
	str	w0, [sp, 8]
	mov	w1, 1095
	mov	w0, 32
	bl	dprint_normal
	b	.L1243
.L1360:
	cbz	x20, .L1377
	bl	dprint_nothing
	ldr	w0, [x19, 84]
	cbnz	w0, .L1229
	b	.L1234
	.p2align 3
.L1364:
	cbz	x20, .L1378
	bl	dprint_nothing
	bl	dprint_nothing
	b	.L1379
	.p2align 3
.L1367:
	ldr	w2, [x0, 2836]
	cbnz	w2, .L1254
	ldr	w8, [x0, 2792]
	ldr	w4, [x19, 124]
	cmp	w8, w4
	bne	.L1254
	ldr	w4, [x0, 2796]
	ldr	w3, [x19, 136]
	cmp	w4, w3
	bne	.L1254
	add	w23, w23, 1
	cbnz	x20, .L1290
	ldrb	w4, [x0, 2752]
	ldrb	w6, [x0, 2753]
	ldr	w1, [x0, 2756]
	ldr	w3, [x0, 2788]
	ldr	w5, [x0, 2828]
	ldr	w7, [x0, 2832]
	mov	x0, x24
	b	.L1288
	.p2align 3
.L1368:
	lsl	x0, x1, 2
	sub	x0, x0, x1
	add	x0, x19, x0, lsl 5
	add	x0, x0, 16384
	ldrb	w4, [x0, 2752]
	ldrb	w6, [x0, 2753]
	ldr	w1, [x0, 2756]
	ldr	w3, [x0, 2788]
	ldr	w8, [x0, 2792]
	ldr	w5, [x0, 2828]
	ldr	w7, [x0, 2832]
	ldr	w2, [x0, 2836]
	mov	x0, x22
.L1288:
	str	w2, [sp]
	mov	x2, x21
	str	w1, [sp, 16]
	mov	w1, 1123
	str	x0, [sp, 24]
	mov	w0, 32
	str	w8, [sp, 8]
	bl	dprint_normal
	b	.L1256
	.p2align 3
.L1370:
	ldr	w2, [x0, 1812]
	cbnz	w2, .L1263
	ldr	w8, [x0, 1768]
	ldr	w4, [x19, 168]
	cmp	w8, w4
	bne	.L1263
	ldr	w4, [x0, 1772]
	ldr	w3, [x19, 180]
	cmp	w4, w3
	bne	.L1263
	add	w23, w23, 1
	cbnz	x20, .L1294
	ldrb	w4, [x0, 1728]
	ldrb	w6, [x0, 1729]
	ldr	w1, [x0, 1732]
	ldr	w3, [x0, 1764]
	ldr	w5, [x0, 1804]
	ldr	w7, [x0, 1808]
	mov	x0, x24
	b	.L1292
	.p2align 3
.L1371:
	lsl	x0, x1, 2
	sub	x0, x0, x1
	add	x0, x19, x0, lsl 5
	add	x0, x0, 20480
	ldrb	w4, [x0, 1728]
	ldrb	w6, [x0, 1729]
	ldr	w1, [x0, 1732]
	ldr	w3, [x0, 1764]
	ldr	w8, [x0, 1768]
	ldr	w5, [x0, 1804]
	ldr	w7, [x0, 1808]
	ldr	w2, [x0, 1812]
	mov	x0, x22
.L1292:
	str	w2, [sp]
	mov	x2, x21
	str	w1, [sp, 16]
	mov	w1, 1152
	str	x0, [sp, 24]
	mov	w0, 32
	str	w8, [sp, 8]
	bl	dprint_normal
	b	.L1265
	.p2align 3
.L1373:
	ldr	w2, [x0, 716]
	ldr	w7, [x19, 92]
	cmp	w7, w2
	bne	.L1273
	add	w22, w22, 1
	cbnz	x20, .L1298
	ldrb	w4, [x0, 704]
	ldrb	w5, [x0, 705]
	ldr	w3, [x0, 708]
	ldr	w1, [x0, 712]
	ldr	w6, [x0, 720]
	mov	x0, x24
.L1296:
	str	w1, [sp]
	mov	x2, x21
	str	x0, [sp, 8]
	mov	w1, 1180
	mov	w0, 32
	bl	dprint_normal
	b	.L1275
	.p2align 3
.L1374:
	lsl	x0, x1, 2
	sub	x0, x0, x1
	add	x0, x19, x0, lsl 3
	add	x0, x0, 24576
	add	x2, x0, 512
	ldrb	w4, [x0, 704]
	ldrb	w5, [x0, 705]
	mov	x0, x23
	ldp	w3, w1, [x2, 196]
	ldp	w7, w6, [x2, 204]
	b	.L1296
	.p2align 3
.L1375:
	add	x0, x19, x1, lsl 4
	ldr	w7, [x19, 100]
	add	x0, x0, 24576
	ldr	w2, [x0, 1484]
	cmp	w7, w2
	bne	.L1283
	add	w23, w23, 1
	cbnz	x20, .L1302
	ldrb	w4, [x0, 1472]
	ldrb	w5, [x0, 1473]
	ldrb	w6, [x0, 1474]
	ldr	w3, [x0, 1476]
	ldr	w1, [x0, 1480]
	mov	x0, x25
.L1300:
	str	w1, [sp]
	mov	x2, x22
	str	x0, [sp, 8]
	mov	w1, 1208
	mov	w0, 32
	bl	dprint_normal
	b	.L1285
	.p2align 3
.L1376:
	add	x0, x19, x1, lsl 4
	add	x0, x0, 24576
	ldrb	w4, [x0, 1472]
	ldrb	w5, [x0, 1473]
	ldrb	w6, [x0, 1474]
	ldr	w3, [x0, 1476]
	ldr	w1, [x0, 1480]
	ldr	w7, [x0, 1484]
	mov	x0, x24
	b	.L1300
	.p2align 3
.L1309:
	mov	w0, 0
	b	.L1242
	.p2align 3
.L1308:
	mov	w1, 0
	b	.L1241
.L1372:
	ldr	x22, .LC450
	ldr	x21, .LC572
.L1259:
	ldr	x3, .LC592
	mov	w4, w23
	mov	w1, 1155
	mov	x2, x21
	mov	w0, 32
	bl	dprint_normal
	mov	x2, x22
	mov	w1, 1156
	mov	w0, 32
	bl	dprint_normal
	ldr	w0, [x19, 20]
	cbnz	w0, .L1270
	.p2align 2
.L1266:
	ldr	w0, [x19, 24]
	cbz	w0, .L1215
	cbnz	x20, .L1279
.L1276:
	ldr	x2, .LC606
	mov	w1, 1197
	mov	w0, 32
	mov	w23, 0
	bl	dprint_normal
	ldr	x0, .LC582
	mov	w1, 1198
	ldr	x5, .LC598
	ldr	x7, .LC584
	ldr	x6, .LC608
	ldr	x4, .LC578
	ldr	x3, .LC560
	ldr	x2, .LC600
	str	x0, [sp]
	mov	w0, 32
	bl	dprint_normal
	ldr	w5, [x19, 24]
	cbnz	w5, .L1277
.L1278:
	ldr	x3, .LC610
	mov	w4, w23
	ldr	x2, .LC572
	mov	w1, 1211
	mov	w0, 32
	bl	dprint_normal
	ldr	x2, .LC450
	mov	w1, 1212
	mov	w0, 32
	bl	dprint_normal
	b	.L1215
	.p2align 3
.L1366:
	ldr	w0, [x19, 16]
	cbnz	w0, .L1260
.L1257:
	ldr	w0, [x19, 20]
	cbz	w0, .L1266
	cbnz	x20, .L1269
.L1270:
	ldr	x2, .LC594
	mov	w1, 1169
	mov	w0, 32
	mov	w22, 0
	bl	dprint_normal
	ldr	x0, .LC582
	mov	w1, 1170
	ldr	x5, .LC598
	ldr	x7, .LC584
	ldr	x6, .LC596
	ldr	x4, .LC578
	ldr	x3, .LC560
	ldr	x2, .LC600
	str	x0, [sp]
	mov	w0, 32
	bl	dprint_normal
	ldr	w5, [x19, 20]
	cbnz	w5, .L1267
.L1268:
	ldr	x3, .LC604
	mov	w4, w22
	ldr	x2, .LC572
	mov	w1, 1183
	mov	w0, 32
	bl	dprint_normal
	ldr	x2, .LC450
	mov	w1, 1184
	mov	w0, 32
	bl	dprint_normal
	ldr	w0, [x19, 24]
	cbnz	w0, .L1276
	b	.L1215
	.p2align 3
.L1361:
	cbnz	x20, .L1234
	ldr	x22, .LC450
	b	.L1233
	.p2align 3
.L1359:
	ldr	x22, .LC450
	mov	w1, 988
	mov	w0, 32
	mov	x2, x22
	bl	dprint_normal
	ldr	x2, .LC452
	mov	w1, 989
	ldr	w3, [x19]
	mov	w0, 32
	bl	dprint_normal
	ldr	x21, .LC456
	ldr	x3, .LC454
	mov	w1, 990
	ldr	w4, [x19, 28]
	mov	x2, x21
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC458
	mov	x2, x21
	ldr	w4, [x19, 32]
	mov	w1, 991
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC460
	mov	w4, w24
	mov	x2, x21
	mov	w1, 992
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC462
	mov	w4, w23
	mov	w1, 993
	mov	x2, x21
	mov	w0, 32
	bl	dprint_normal
	mov	x2, x22
	mov	w1, 994
	mov	w0, 32
	bl	dprint_normal
	ldr	x2, .LC464
	mov	w1, 999
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC466
	mov	x2, x21
	ldr	w4, [x19, 40]
	mov	w1, 1000
	mov	w0, 32
	bl	dprint_normal
	ldrb	w4, [x19, 45]
	mov	x2, x21
	ldr	x3, .LC468
	mov	w1, 1001
	mov	w0, 32
	bl	dprint_normal
	ldrb	w4, [x19, 44]
	mov	x2, x21
	ldr	x3, .LC470
	mov	w1, 1002
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC472
	mov	x2, x21
	ldr	w4, [x19, 48]
	mov	w1, 1003
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC474
	mov	x2, x21
	ldr	w4, [x19, 52]
	mov	w1, 1004
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC476
	mov	x2, x21
	ldr	w4, [x19, 56]
	mov	w1, 1005
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC478
	mov	x2, x21
	ldr	w4, [x19, 60]
	mov	w1, 1006
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC480
	mov	x2, x21
	ldr	w4, [x19, 64]
	mov	w1, 1007
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC482
	mov	w1, 1008
	ldr	w4, [x19, 68]
	mov	x2, x21
	mov	w0, 32
	bl	dprint_normal
	mov	x2, x22
	mov	w1, 1009
	mov	w0, 32
	bl	dprint_normal
	ldr	x2, .LC484
	mov	w1, 1014
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC486
	mov	x2, x21
	ldr	w4, [x19, 120]
	mov	w1, 1015
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC488
	mov	x2, x21
	ldr	w4, [x19, 124]
	mov	w1, 1016
	mov	w0, 32
	bl	dprint_normal
	ldrb	w4, [x19, 116]
	mov	x2, x21
	ldr	x3, .LC490
	mov	w1, 1017
	mov	w0, 32
	bl	dprint_normal
	ldrb	w4, [x19, 117]
	mov	x2, x21
	ldr	x3, .LC492
	mov	w1, 1018
	mov	w0, 32
	bl	dprint_normal
	ldrb	w4, [x19, 118]
	mov	x2, x21
	ldr	x3, .LC494
	mov	w1, 1019
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC496
	mov	x2, x21
	ldr	w4, [x19, 128]
	mov	w1, 1020
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC498
	mov	x2, x21
	ldr	w4, [x19, 132]
	mov	w1, 1021
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC500
	mov	x2, x21
	ldr	w4, [x19, 136]
	mov	w1, 1022
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC502
	mov	x2, x21
	ldr	w4, [x19, 140]
	mov	w1, 1023
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC504
	mov	x2, x21
	ldr	w4, [x19, 144]
	mov	w1, 1024
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC506
	mov	x2, x21
	ldr	w4, [x19, 148]
	mov	w1, 1025
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC508
	mov	x2, x21
	ldr	w4, [x19, 152]
	mov	w1, 1026
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC510
	mov	x2, x21
	ldr	w4, [x19, 156]
	mov	w1, 1027
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC512
	mov	x2, x21
	ldr	w4, [x19, 112]
	mov	w1, 1028
	mov	w0, 32
	bl	dprint_normal
	ldr	w0, [x19, 76]
	cmp	w0, 1
	beq	.L1380
	ldr	x4, .LC441
.L1220:
	ldr	x23, .LC516
	mov	w1, 1030
	ldr	x3, .LC514
	mov	w0, 32
	mov	x2, x23
	bl	dprint_normal
	ldr	w0, [x19, 76]
	cbnz	w0, .L1381
.L1223:
	ldr	w0, [x19, 80]
	cmp	w0, 1
	beq	.L1382
	ldr	x4, .LC441
.L1224:
	ldr	x3, .LC538
	mov	x2, x23
	mov	w1, 1046
	mov	w0, 32
	bl	dprint_normal
	ldr	w0, [x19, 80]
	cbz	w0, .L1228
	ldr	w4, [x19, 96]
	mov	x2, x21
	ldr	x3, .LC540
	mov	w1, 1050
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC542
	mov	x2, x21
	ldr	w4, [x19, 92]
	mov	w1, 1051
	mov	w0, 32
	bl	dprint_normal
	b	.L1228
.L1377:
	ldr	x22, .LC450
	ldr	x23, .LC516
.L1228:
	ldr	w0, [x19, 84]
	cmp	w0, 1
	beq	.L1383
	ldr	x4, .LC441
.L1232:
	ldr	x3, .LC544
	mov	x2, x23
	mov	w1, 1054
	mov	w0, 32
	bl	dprint_normal
	ldr	w0, [x19, 84]
	cbnz	w0, .L1384
.L1233:
	mov	x2, x22
	mov	w1, 1062
	mov	w0, 32
	bl	dprint_normal
	ldr	x2, .LC550
	mov	w1, 1073
	mov	w0, 32
	bl	dprint_normal
	b	.L1235
.L1383:
	ldr	x4, .LC439
	b	.L1232
.L1380:
	ldr	x4, .LC439
	b	.L1220
.L1365:
	ldr	x21, .LC572
	mov	w4, w22
	ldr	x3, .LC570
	mov	w5, w23
	mov	x2, x21
	mov	w1, 1098
	mov	w0, w23
	bl	dprint_normal
	ldr	x22, .LC450
	mov	w1, 1099
	mov	w0, w23
	mov	x2, x22
	bl	dprint_normal
	ldr	w0, [x19, 12]
	cbz	w0, .L1344
	ldr	x2, .LC574
	mov	w1, 1111
	mov	w0, w23
	bl	dprint_normal
	ldr	x1, .LC582
	mov	w0, w23
	str	x1, [sp, 16]
	ldr	x1, .LC584
	ldr	x5, .LC558
	str	x1, [sp, 8]
	ldr	x7, .LC576
	ldr	x1, .LC552
	ldr	x6, .LC556
	ldr	x4, .LC578
	ldr	x3, .LC560
	ldr	x2, .LC580
	str	x1, [sp]
	mov	w1, 1112
	bl	dprint_normal
	ldr	w5, [x19, 12]
	cbnz	w5, .L1252
	mov	w23, 0
	b	.L1250
	.p2align 3
.L1369:
	ldr	x22, .LC450
	ldr	x21, .LC572
.L1250:
	ldr	x3, .LC588
	mov	w1, 1126
	mov	x2, x21
	mov	w4, w23
	mov	w0, 32
	bl	dprint_normal
	mov	x2, x22
	mov	w1, 1127
	mov	w0, 32
	bl	dprint_normal
.L1344:
	ldr	w0, [x19, 16]
	cbz	w0, .L1257
	ldr	x2, .LC590
	mov	w1, 1140
	mov	w0, 32
	mov	w23, 0
	bl	dprint_normal
	ldr	x0, .LC582
	mov	w1, 1141
	str	x0, [sp, 16]
	ldr	x0, .LC584
	ldr	x5, .LC558
	str	x0, [sp, 8]
	ldr	x7, .LC576
	ldr	x0, .LC552
	ldr	x6, .LC556
	ldr	x4, .LC578
	ldr	x3, .LC560
	ldr	x2, .LC580
	str	x0, [sp]
	mov	w0, 32
	bl	dprint_normal
	ldr	w5, [x19, 16]
	cbnz	w5, .L1258
	b	.L1259
	.p2align 3
.L1382:
	ldr	x4, .LC439
	b	.L1224
.L1384:
	ldr	x21, .LC456
	mov	w1, 1058
	ldr	w4, [x19, 104]
	mov	w0, 32
	ldr	x3, .LC546
	mov	x2, x21
	bl	dprint_normal
	ldr	x3, .LC548
	mov	x2, x21
	ldr	w4, [x19, 100]
	mov	w1, 1059
	mov	w0, 32
	bl	dprint_normal
	b	.L1233
.L1381:
	ldr	w4, [x19, 164]
	mov	x2, x21
	ldr	x3, .LC518
	mov	w1, 1034
	mov	w0, 32
	bl	dprint_normal
	ldr	w4, [x19, 168]
	mov	x2, x21
	ldr	x3, .LC520
	mov	w1, 1035
	mov	w0, 32
	bl	dprint_normal
	ldrb	w4, [x19, 160]
	mov	x2, x21
	ldr	x3, .LC522
	mov	w1, 1036
	mov	w0, 32
	bl	dprint_normal
	ldrb	w4, [x19, 161]
	mov	x2, x21
	ldr	x3, .LC524
	mov	w1, 1037
	mov	w0, 32
	bl	dprint_normal
	ldrb	w4, [x19, 162]
	mov	x2, x21
	ldr	x3, .LC526
	mov	w1, 1038
	mov	w0, 32
	bl	dprint_normal
	ldr	w4, [x19, 172]
	mov	x2, x21
	ldr	x3, .LC528
	mov	w1, 1039
	mov	w0, 32
	bl	dprint_normal
	ldr	w4, [x19, 176]
	mov	x2, x21
	ldr	x3, .LC530
	mov	w1, 1040
	mov	w0, 32
	bl	dprint_normal
	ldr	w4, [x19, 180]
	mov	x2, x21
	ldr	x3, .LC532
	mov	w1, 1041
	mov	w0, 32
	bl	dprint_normal
	ldr	w4, [x19, 184]
	mov	x2, x21
	ldr	x3, .LC534
	mov	w1, 1042
	mov	w0, 32
	bl	dprint_normal
	ldr	x3, .LC536
	mov	x2, x21
	ldr	w4, [x19, 188]
	mov	w1, 1043
	mov	w0, 32
	bl	dprint_normal
	b	.L1223
	.size	FSP_DumpState, .-FSP_DumpState
	.align	3
.LC439:
	.xword	.LC438
	.align	3
.LC441:
	.xword	.LC440
	.align	3
.LC443:
	.xword	.LC442
	.align	3
.LC445:
	.xword	.LC444
	.align	3
.LC446:
	.xword	.LANCHOR2
	.align	3
.LC448:
	.xword	.LC447
	.align	3
.LC450:
	.xword	.LC449
	.align	3
.LC452:
	.xword	.LC451
	.align	3
.LC454:
	.xword	.LC453
	.align	3
.LC456:
	.xword	.LC455
	.align	3
.LC458:
	.xword	.LC457
	.align	3
.LC460:
	.xword	.LC459
	.align	3
.LC462:
	.xword	.LC461
	.align	3
.LC464:
	.xword	.LC463
	.align	3
.LC466:
	.xword	.LC465
	.align	3
.LC468:
	.xword	.LC467
	.align	3
.LC470:
	.xword	.LC469
	.align	3
.LC472:
	.xword	.LC471
	.align	3
.LC474:
	.xword	.LC473
	.align	3
.LC476:
	.xword	.LC475
	.align	3
.LC478:
	.xword	.LC477
	.align	3
.LC480:
	.xword	.LC479
	.align	3
.LC482:
	.xword	.LC481
	.align	3
.LC484:
	.xword	.LC483
	.align	3
.LC486:
	.xword	.LC485
	.align	3
.LC488:
	.xword	.LC487
	.align	3
.LC490:
	.xword	.LC489
	.align	3
.LC492:
	.xword	.LC491
	.align	3
.LC494:
	.xword	.LC493
	.align	3
.LC496:
	.xword	.LC495
	.align	3
.LC498:
	.xword	.LC497
	.align	3
.LC500:
	.xword	.LC499
	.align	3
.LC502:
	.xword	.LC501
	.align	3
.LC504:
	.xword	.LC503
	.align	3
.LC506:
	.xword	.LC505
	.align	3
.LC508:
	.xword	.LC507
	.align	3
.LC510:
	.xword	.LC509
	.align	3
.LC512:
	.xword	.LC511
	.align	3
.LC514:
	.xword	.LC513
	.align	3
.LC516:
	.xword	.LC515
	.align	3
.LC518:
	.xword	.LC517
	.align	3
.LC520:
	.xword	.LC519
	.align	3
.LC522:
	.xword	.LC521
	.align	3
.LC524:
	.xword	.LC523
	.align	3
.LC526:
	.xword	.LC525
	.align	3
.LC528:
	.xword	.LC527
	.align	3
.LC530:
	.xword	.LC529
	.align	3
.LC532:
	.xword	.LC531
	.align	3
.LC534:
	.xword	.LC533
	.align	3
.LC536:
	.xword	.LC535
	.align	3
.LC538:
	.xword	.LC537
	.align	3
.LC540:
	.xword	.LC539
	.align	3
.LC542:
	.xword	.LC541
	.align	3
.LC544:
	.xword	.LC543
	.align	3
.LC546:
	.xword	.LC545
	.align	3
.LC548:
	.xword	.LC547
	.align	3
.LC550:
	.xword	.LC549
	.align	3
.LC552:
	.xword	.LC551
	.align	3
.LC554:
	.xword	.LC553
	.align	3
.LC556:
	.xword	.LC555
	.align	3
.LC558:
	.xword	.LC557
	.align	3
.LC560:
	.xword	.LC559
	.align	3
.LC562:
	.xword	.LC561
	.align	3
.LC564:
	.xword	.LC563
	.align	3
.LC566:
	.xword	.LC565
	.align	3
.LC568:
	.xword	.LC567
	.align	3
.LC570:
	.xword	.LC569
	.align	3
.LC572:
	.xword	.LC571
	.align	3
.LC574:
	.xword	.LC573
	.align	3
.LC576:
	.xword	.LC575
	.align	3
.LC578:
	.xword	.LC577
	.align	3
.LC580:
	.xword	.LC579
	.align	3
.LC582:
	.xword	.LC581
	.align	3
.LC584:
	.xword	.LC583
	.align	3
.LC586:
	.xword	.LC585
	.align	3
.LC588:
	.xword	.LC587
	.align	3
.LC590:
	.xword	.LC589
	.align	3
.LC592:
	.xword	.LC591
	.align	3
.LC594:
	.xword	.LC593
	.align	3
.LC596:
	.xword	.LC595
	.align	3
.LC598:
	.xword	.LC597
	.align	3
.LC600:
	.xword	.LC599
	.align	3
.LC602:
	.xword	.LC601
	.align	3
.LC604:
	.xword	.LC603
	.align	3
.LC606:
	.xword	.LC605
	.align	3
.LC608:
	.xword	.LC607
	.align	3
.LC610:
	.xword	.LC609
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_UnBindExternFs
	.type	FSP_UnBindExternFs, %function
FSP_UnBindExternFs:
	sub	sp, sp, #96
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	stp	x23, x24, [sp, 64]
	str	x25, [sp, 80]
	mov	w25, w0
	mov	x21, x1
	mov	x0, x30
	bl	_mcount
	cbz	x21, .L1403
	ldr	x22, .LC615
	add	x22, x22, 8
	ldr	x0, [x22, w25, sxtw 3]
	cbz	x0, .L1404
	ldr	x20, .LC617
	mov	w19, 1
	mov	w0, 3
	str	w19, [x21, 304]
	ldr	x1, [x20, 24]
	blr	x1
	ldr	x23, [x22, w25, sxtw 3]
	ldr	w2, [x21, 32]
	add	x0, x23, 20480
	ldr	w1, [x0, 1732]
	cmp	w1, w2
	beq	.L1396
	add	x0, x0, 1828
	b	.L1392
	.p2align 3
.L1402:
	add	w19, w19, 1
	cmp	w19, 32
	beq	.L1393
.L1392:
	ldr	w1, [x0]
	add	x0, x0, 96
	cmp	w1, w2
	bne	.L1402
.L1389:
	sxtw	x24, w19
	lsl	x0, x24, 2
	sub	x0, x0, x24
	add	x0, x23, x0, lsl 5
	add	x0, x0, 20480
	ldr	w1, [x0, 1812]
	cbnz	w1, .L1395
	ldr	x22, .LC613
.L1391:
	lsl	x0, x24, 2
	add	x19, x21, 152
	sub	x0, x0, x24
	mov	x2, 96
	lsl	x0, x0, 5
	mov	w1, 0
	add	x4, x23, x0
	add	x0, x0, 20480
	add	x0, x0, 1728
	add	x0, x23, x0
	ldr	x3, [x4, 22216]
	str	x3, [x21, 40]
	add	x3, x4, 20480
	ldr	w5, [x3, 1768]
	str	w5, [x21, 56]
	ldr	w5, [x3, 1748]
	str	w5, [x19, 32]
	ldr	x4, [x4, 22232]
	str	x4, [x19, 40]
	ldr	x4, [x20, 96]
	ldr	w3, [x3, 1760]
	str	w3, [x19, 56]
	blr	x4
	ldr	w4, [x23, 16]
	cbz	w4, .L1394
	sub	w4, w4, #1
	str	w4, [x23, 16]
.L1394:
	ldr	w7, [x19, 32]
	add	x3, x22, 1288
	ldr	w8, [x19, 56]
	mov	w1, 2855
	ldr	w5, [x21, 32]
	ldr	w6, [x21, 56]
	ldr	x0, [x19, 40]
	ldr	x2, .LC620
	str	x0, [sp]
	mov	w0, 14
	str	w8, [sp, 8]
	bl	dprint_normal
	ldr	x1, [x20, 32]
	mov	w0, 3
	blr	x1
	mov	w0, 0
.L1401:
	add	sp, x29, 0
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1395:
	mov	w1, 2
	str	w1, [x21, 304]
	ldr	x22, .LC613
	mov	w1, 2820
	ldrb	w5, [x0, 1729]
	ldrb	w4, [x0, 1728]
	add	x3, x22, 1288
	ldr	w7, [x0, 1768]
	ldr	w6, [x0, 1812]
	mov	w0, 0
	ldr	x2, .LC619
	bl	dprint_normal
	cmp	w19, 31
	ble	.L1391
.L1393:
	mov	w2, 2
	mov	w0, w25
	str	w2, [x21, 304]
	mov	x1, 0
	bl	FSP_DumpState
	ldr	x1, [x20, 32]
	mov	w0, 3
	blr	x1
	add	sp, x29, 0
	mov	w0, -1
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L1396:
	mov	w19, 0
	b	.L1389
.L1404:
	ldr	x3, .LC613
	mov	w1, 2799
	ldr	x4, .LC616
	ldr	x2, .LC614
	add	x3, x3, 1288
	bl	dprint_normal
	mov	w0, -1
	b	.L1401
.L1403:
	ldr	x3, .LC613
	mov	w1, 2798
	ldr	x4, .LC612
	mov	w0, 0
	ldr	x2, .LC614
	add	x3, x3, 1288
	bl	dprint_normal
	mov	w0, -1
	b	.L1401
	.size	FSP_UnBindExternFs, .-FSP_UnBindExternFs
	.align	3
.LC612:
	.xword	.LC162
	.align	3
.LC613:
	.xword	.LANCHOR1
	.align	3
.LC614:
	.xword	.LC80
	.align	3
.LC615:
	.xword	.LANCHOR2
	.align	3
.LC616:
	.xword	.LC106
	.align	3
.LC617:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC619:
	.xword	.LC618
	.align	3
.LC620:
	.xword	.LC199
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_ResortDecFsPool, %function
FSP_ResortDecFsPool:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x23, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x23, 120]
	ldr	w20, [x23, 12]
	subs	w0, w4, w20
	str	w0, [x29, 108]
	bmi	.L1426
.L1407:
	add	x22, x23, 16384
	ldr	x27, .LC632
	add	x22, x22, 2776
	cbz	w4, .L1422
	.p2align 2
.L1436:
	mov	w26, -1
	mov	w25, 0
	mov	w24, w26
	mov	w28, w26
	sxtw	x3, w26
	mov	w1, 0
	b	.L1411
	.p2align 3
.L1428:
	beq	.L1423
	cmn	w24, #1
	csel	w24, w24, w1, ne
.L1410:
	add	w1, w1, 1
	cmp	w1, w4
	beq	.L1427
.L1411:
	sxtw	x2, w1
	cmn	w28, #1
	lsl	x0, x2, 2
	sub	x0, x0, x2
	add	x0, x23, x0, lsl 5
	add	x0, x0, 16384
	ldrb	w0, [x0, 2752]
	cbz	w0, .L1428
	mov	w26, w3
	sxtw	x3, w1
	add	w1, w1, 1
	add	w25, w25, 1
	cmp	w1, w4
	bne	.L1411
.L1427:
	cmp	w28, w3
	bge	.L1408
	cmn	w28, #1
	ccmn	w3, #1, 4, ne
	beq	.L1429
	sxtw	x2, w28
	lsl	x1, x3, 2
	lsl	x0, x2, 2
	sub	x3, x1, x3
	sub	x0, x0, x2
	lsl	x3, x3, 5
	lsl	x0, x0, 5
	add	x19, x3, 16384
	add	x4, x23, x0
	add	x21, x0, 16384
	add	x20, x4, 16384
	add	x21, x21, 2752
	add	x19, x19, 2752
	add	x21, x23, x21
	add	x19, x23, x19
	ldrb	w0, [x20, 2752]
	cbnz	w0, .L1430
	add	x3, x23, x3
	add	x3, x3, 16384
	ldrb	w0, [x3, 2752]
	cmp	w0, 1
	bne	.L1431
	ldr	x3, [x27, 104]
	mov	x2, 96
	mov	x1, x19
	mov	x0, x21
	blr	x3
	ldr	x3, [x27, 96]
	mov	x2, 96
	mov	w1, 0
	mov	x0, x19
	blr	x3
	str	w28, [x20, 2788]
	add	x0, x23, 216
	b	.L1420
	.p2align 3
.L1416:
	cmp	x21, x1
	beq	.L1432
.L1417:
	ldr	x1, [x0, 8]
	cmp	x19, x1
	beq	.L1433
.L1418:
	cmp	x21, x1
	beq	.L1434
.L1419:
	add	x0, x0, 592
	cmp	x0, x22
	beq	.L1435
.L1420:
	ldr	x1, [x0]
	cmp	x19, x1
	bne	.L1416
	ldr	x1, [x0, 8]
	str	x21, [x0]
	cmp	x19, x1
	bne	.L1418
	.p2align 2
.L1433:
	str	x21, [x0, 8]
	add	x0, x0, 592
	cmp	x0, x22
	bne	.L1420
	.p2align 2
.L1435:
	cmp	w24, w26
	bge	.L1408
	ldr	w4, [x23, 120]
	cbnz	w4, .L1436
.L1422:
	mov	w25, 0
.L1408:
	ldr	w0, [x29, 108]
	str	w25, [x23, 12]
	add	w20, w0, w25
	str	w20, [x23, 120]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1423:
	mov	w28, w1
	b	.L1410
	.p2align 3
.L1432:
	str	x19, [x0]
	b	.L1417
	.p2align 3
.L1434:
	str	x19, [x0, 8]
	b	.L1419
.L1431:
	ldr	x3, .LC626
	mov	w1, 1388
	ldr	x4, .LC631
	mov	w0, 0
	ldr	x2, .LC627
	add	x3, x3, 1312
	bl	dprint_normal
	b	.L1408
.L1429:
	ldr	x3, .LC626
	mov	w1, 1381
	ldr	x4, .LC625
	mov	w0, 0
	ldr	x2, .LC627
	add	x3, x3, 1312
	bl	dprint_normal
	b	.L1408
.L1430:
	ldr	x3, .LC626
	mov	w1, 1387
	ldr	x4, .LC629
	mov	w0, 0
	ldr	x2, .LC627
	add	x3, x3, 1312
	bl	dprint_normal
	b	.L1408
.L1426:
	ldr	x2, .LC623
	uxtw	x3, w0
	mov	w1, 1432
	mov	w0, 1
	str	wzr, [x29, 108]
	bl	dprint_normal
	ldr	w1, [x23, 12]
	ldr	w0, [x23]
	str	w1, [x23, 120]
	mov	x1, 0
	bl	FSP_DumpState
	ldr	w4, [x23, 120]
	b	.L1407
	.size	FSP_ResortDecFsPool, .-FSP_ResortDecFsPool
	.align	3
.LC623:
	.xword	.LC622
	.align	3
.LC625:
	.xword	.LC624
	.align	3
.LC626:
	.xword	.LANCHOR1
	.align	3
.LC627:
	.xword	.LC80
	.align	3
.LC629:
	.xword	.LC628
	.align	3
.LC631:
	.xword	.LC630
	.align	3
.LC632:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ReleaseUnusedOldDecFs
	.type	FSP_ReleaseUnusedOldDecFs, %function
FSP_ReleaseUnusedOldDecFs:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w22, w0
	mov	x0, x30
	bl	_mcount
	cmp	w22, 3
	bhi	.L1452
	ldr	x19, .LC636
	add	x19, x19, 8
	ldr	x0, [x19, w22, sxtw 3]
	cbz	x0, .L1453
	ldr	x24, .LC638
	mov	w0, 3
	ldr	x1, [x24, 24]
	blr	x1
	ldr	x26, [x19, w22, sxtw 3]
	ldr	w9, [x26, 12]
	cbz	w9, .L1442
	ldr	x19, .LC634
	mov	w23, 0
	ldr	x21, .LC640
	mov	w20, 0
	mov	w25, 0
	add	x19, x19, 1336
	b	.L1446
	.p2align 3
.L1455:
	bl	dprint_normal
	add	w20, w20, 1
	ldr	w9, [x26, 12]
.L1444:
	add	w25, w25, 1
	cmp	w9, w25
	bls	.L1454
.L1446:
	sxtw	x6, w25
	mov	w4, w25
	lsl	x5, x6, 2
	mov	x3, x19
	sub	x5, x5, x6
	mov	x2, x21
	lsl	x6, x5, 5
	mov	w1, 3381
	add	x5, x26, x5, lsl 5
	add	x0, x26, x6
	add	x5, x5, 16384
	add	x7, x0, 16384
	mov	w0, 1
	ldrb	w8, [x5, 2752]
	cmp	w8, w0
	bne	.L1455
	ldr	w1, [x5, 2792]
	ldr	w0, [x26, 124]
	cmp	w1, w0
	beq	.L1456
.L1445:
	ldrb	w0, [x7, 2753]
	cbnz	w0, .L1444
	ldr	w3, [x7, 2836]
	add	x2, x6, 16384
	add	x2, x2, 2752
	mov	w1, 0
	mov	w0, w22
	add	x2, x26, x2
	cbnz	w3, .L1444
	bl	FSP_ReleaseFs
	add	w25, w25, 1
	ldr	w9, [x26, 12]
	add	w23, w23, 1
	cmp	w9, w25
	bhi	.L1446
	.p2align 2
.L1454:
	orr	w20, w20, w23
	cbnz	w20, .L1457
.L1442:
	ldr	x1, [x24, 32]
	mov	w0, 3
	blr	x1
.L1437:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1456:
	ldr	w1, [x5, 2796]
	ldr	w0, [x26, 136]
	cmp	w1, w0
	bne	.L1445
	b	.L1444
	.p2align 3
.L1457:
	mov	x0, x26
	bl	FSP_ResortDecFsPool
	b	.L1442
	.p2align 3
.L1452:
	ldr	x3, .LC634
	mov	w1, 3367
	ldr	x4, .LC633
	mov	w0, 0
	ldr	x2, .LC635
	add	x3, x3, 1336
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1453:
	ldr	x3, .LC634
	mov	w1, 3368
	ldr	x4, .LC637
	ldr	x2, .LC635
	add	x3, x3, 1336
	bl	dprint_normal
	b	.L1437
	.size	FSP_ReleaseUnusedOldDecFs, .-FSP_ReleaseUnusedOldDecFs
	.align	3
.LC633:
	.xword	.LC85
	.align	3
.LC634:
	.xword	.LANCHOR1
	.align	3
.LC635:
	.xword	.LC80
	.align	3
.LC636:
	.xword	.LANCHOR2
	.align	3
.LC637:
	.xword	.LC106
	.align	3
.LC638:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC640:
	.xword	.LC639
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ReleaseUnusedCurDecFs
	.type	FSP_ReleaseUnusedCurDecFs, %function
FSP_ReleaseUnusedCurDecFs:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w23, w0
	mov	x0, x30
	bl	_mcount
	cmp	w23, 3
	bhi	.L1473
	ldr	x19, .LC646
	add	x19, x19, 8
	ldr	x0, [x19, w23, sxtw 3]
	cbz	x0, .L1474
	ldr	x24, .LC648
	mov	w0, 3
	ldr	x1, [x24, 24]
	blr	x1
	ldr	x26, [x19, w23, sxtw 3]
	ldr	w8, [x26, 12]
	cbz	w8, .L1463
	ldr	x19, .LC644
	mov	w22, 0
	ldr	x21, .LC649
	mov	w20, 0
	mov	w25, 0
	add	x19, x19, 1368
	b	.L1467
	.p2align 3
.L1476:
	bl	dprint_normal
	add	w20, w20, 1
	ldr	w8, [x26, 12]
.L1465:
	add	w25, w25, 1
	cmp	w8, w25
	bls	.L1475
.L1467:
	sxtw	x5, w25
	mov	w4, w25
	lsl	x0, x5, 2
	mov	x3, x19
	sub	x5, x0, x5
	mov	w0, 1
	lsl	x5, x5, 5
	mov	x2, x21
	add	x6, x26, x5
	mov	w1, 3428
	add	x6, x6, 16384
	ldrb	w7, [x6, 2752]
	cmp	w7, w0
	bne	.L1476
	ldrh	w0, [x6, 2752]
	cmp	w0, 1
	bne	.L1465
	ldr	w0, [x6, 2836]
	cbnz	w0, .L1465
	ldr	w2, [x6, 2792]
	ldr	w0, [x26, 124]
	cmp	w2, w0
	bne	.L1465
	ldr	w2, [x6, 2796]
	ldr	w0, [x26, 136]
	cmp	w2, w0
	bne	.L1465
	add	x2, x5, 16384
	mov	w1, 0
	add	x2, x2, 2752
	mov	w0, w23
	add	x2, x26, x2
	add	w25, w25, 1
	add	w22, w22, 1
	bl	FSP_ReleaseFs
	ldr	w8, [x26, 12]
	cmp	w8, w25
	bhi	.L1467
	.p2align 2
.L1475:
	orr	w20, w20, w22
	cbnz	w20, .L1477
.L1463:
	ldr	x1, [x24, 32]
	mov	w0, 3
	blr	x1
.L1458:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1477:
	mov	x0, x26
	bl	FSP_ResortDecFsPool
	b	.L1463
	.p2align 3
.L1473:
	ldr	x3, .LC644
	mov	w1, 3414
	ldr	x4, .LC643
	mov	w0, 0
	ldr	x2, .LC645
	add	x3, x3, 1368
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1474:
	ldr	x3, .LC644
	mov	w1, 3415
	ldr	x4, .LC647
	ldr	x2, .LC645
	add	x3, x3, 1368
	bl	dprint_normal
	b	.L1458
	.size	FSP_ReleaseUnusedCurDecFs, .-FSP_ReleaseUnusedCurDecFs
	.align	3
.LC643:
	.xword	.LC85
	.align	3
.LC644:
	.xword	.LANCHOR1
	.align	3
.LC645:
	.xword	.LC80
	.align	3
.LC646:
	.xword	.LANCHOR2
	.align	3
.LC647:
	.xword	.LC106
	.align	3
.LC648:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC649:
	.xword	.LC639
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetMemInfo
	.type	FSP_GetMemInfo, %function
FSP_GetMemInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 3
	bls	.L1482
.L1479:
	ldr	x2, .LC654
	mov	x4, x19
	mov	w3, w20
	mov	w1, 4143
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1482:
	ldr	x0, .LC652
	add	x0, x0, 8
	ldr	x1, [x0, w20, sxtw 3]
	cmp	x1, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L1479
	ldrb	w2, [x1, 45]
	mov	w0, 0
	strb	w2, [x19]
	ldr	w2, [x1, 48]
	str	w2, [x19, 4]
	ldr	w2, [x1, 52]
	str	w2, [x19, 8]
	ldr	w2, [x1, 64]
	str	w2, [x19, 12]
	ldr	w2, [x1, 68]
	str	w2, [x19, 16]
	ldr	w2, [x1, 124]
	str	w2, [x19, 20]
	ldr	w1, [x1, 92]
	str	w1, [x19, 24]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_GetMemInfo, .-FSP_GetMemInfo
	.align	3
.LC652:
	.xword	.LANCHOR2
	.align	3
.LC654:
	.xword	.LC653
	.global	g_LastDecPhyAddr
	.global	g_FsWaterMarkEnable
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.6232, %object
	.size	__func__.6232, 21
__func__.6232:
	.string	"FSP_GetFsRequirement"
	.zero	3
	.type	__func__.6492, %object
	.size	__func__.6492, 21
__func__.6492:
	.string	"FSP_MarkFsOutHanging"
	.zero	3
	.type	__func__.6498, %object
	.size	__func__.6498, 23
__func__.6498:
	.string	"FSP_UnMarkFsOutHanging"
	.zero	1
	.type	__func__.6318, %object
	.size	__func__.6318, 14
__func__.6318:
	.string	"FSP_ReleaseFs"
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.6296, %object
	.size	__func__.6296, 14
__func__.6296:
	.string	"FSP_RequireFs"
	.zero	2
	.type	__func__.6371, %object
	.size	__func__.6371, 24
__func__.6371:
	.string	"FSP_ReportFsRequirement"
	.type	__func__.6431, %object
	.size	__func__.6431, 17
__func__.6431:
	.string	"FSP_ArrangeAddFs"
	.zero	7
	.type	__func__.6452, %object
	.size	__func__.6452, 20
__func__.6452:
	.string	"FSP_VarifyWaterMark"
	.zero	4
	.type	__func__.6118, %object
	.size	__func__.6118, 19
__func__.6118:
	.string	"FSP_FindIdleDispFs"
	.zero	5
	.type	__func__.6137, %object
	.size	__func__.6137, 21
__func__.6137:
	.string	"FSP_FindIdleMetadata"
	.zero	3
	.type	__func__.6111, %object
	.size	__func__.6111, 18
__func__.6111:
	.string	"FSP_FindIdleDecFs"
	.zero	6
	.type	__func__.6737, %object
	.size	__func__.6737, 19
__func__.6737:
	.string	"FSP_GetOccupiedNum"
	.zero	5
	.type	__func__.5991, %object
	.size	__func__.5991, 21
__func__.5991:
	.string	"FSP_SetDisplay_Share"
	.zero	3
	.type	__func__.6529, %object
	.size	__func__.6529, 19
__func__.6529:
	.string	"FSP_EnableInstance"
	.zero	5
	.type	__func__.6534, %object
	.size	__func__.6534, 20
__func__.6534:
	.string	"FSP_DisableInstance"
	.zero	4
	.type	__func__.6539, %object
	.size	__func__.6539, 18
__func__.6539:
	.string	"FSP_ResetInstance"
	.zero	6
	.type	__func__.6547, %object
	.size	__func__.6547, 18
__func__.6547:
	.string	"FSP_ArrangeFsPool"
	.zero	6
	.type	__func__.6423, %object
	.size	__func__.6423, 17
__func__.6423:
	.string	"FSP_ArrangeNewFs"
	.zero	7
	.type	__func__.6439, %object
	.size	__func__.6439, 21
__func__.6439:
	.string	"FSP_ArrangeRefreshFs"
	.zero	3
	.type	__func__.6553, %object
	.size	__func__.6553, 23
__func__.6553:
	.string	"FSP_SetFrameBufferMode"
	.zero	1
	.type	__func__.6559, %object
	.size	__func__.6559, 17
__func__.6559:
	.string	"FSP_SetDispFsNum"
	.zero	7
	.type	__func__.6568, %object
	.size	__func__.6568, 18
__func__.6568:
	.string	"FSP_BindRequireFs"
	.zero	6
	.type	__func__.6394, %object
	.size	__func__.6394, 13
__func__.6394:
	.string	"FSP_AddDecFs"
	.zero	3
	.type	__func__.6402, %object
	.size	__func__.6402, 14
__func__.6402:
	.string	"FSP_AddDispFs"
	.zero	2
	.type	__func__.6409, %object
	.size	__func__.6409, 11
__func__.6409:
	.string	"FSP_AddPmv"
	.zero	5
	.type	__func__.6416, %object
	.size	__func__.6416, 16
__func__.6416:
	.string	"FSP_AddMetadata"
	.type	__func__.6445, %object
	.size	__func__.6445, 18
__func__.6445:
	.string	"FSP_FillWaterMark"
	.zero	6
	.type	__func__.6585, %object
	.size	__func__.6585, 17
__func__.6585:
	.string	"FSP_BindExternFs"
	.zero	7
	.type	__func__.6608, %object
	.size	__func__.6608, 21
__func__.6608:
	.string	"FSP_IsNewFsAvailable"
	.zero	3
	.type	__func__.6623, %object
	.size	__func__.6623, 15
__func__.6623:
	.string	"FSP_NewLogicFs"
	.zero	1
	.type	__func__.6646, %object
	.size	__func__.6646, 11
__func__.6646:
	.string	"FSP_SetRef"
	.zero	5
	.type	__func__.5966, %object
	.size	__func__.5966, 21
__func__.5966:
	.string	"FSP_SetRef_Exclusive"
	.zero	3
	.type	__func__.5974, %object
	.size	__func__.5974, 17
__func__.5974:
	.string	"FSP_SetRef_Share"
	.zero	7
	.type	__func__.6652, %object
	.size	__func__.6652, 11
__func__.6652:
	.string	"FSP_GetRef"
	.zero	5
	.type	__func__.6660, %object
	.size	__func__.6660, 15
__func__.6660:
	.string	"FSP_SetDisplay"
	.zero	1
	.type	__func__.5983, %object
	.size	__func__.5983, 25
__func__.5983:
	.string	"FSP_SetDisplay_Exclusive"
	.zero	7
	.type	__func__.6666, %object
	.size	__func__.6666, 15
__func__.6666:
	.string	"FSP_GetDisplay"
	.zero	1
	.type	__func__.6680, %object
	.size	__func__.6680, 17
__func__.6680:
	.string	"FSP_GetStoreType"
	.zero	7
	.type	__func__.6714, %object
	.size	__func__.6714, 24
__func__.6714:
	.string	"FSP_GetFreeDecFsSlotNum"
	.type	__func__.6726, %object
	.size	__func__.6726, 22
__func__.6726:
	.string	"FSP_ClearNotInVoQueue"
	.zero	2
	.type	__func__.6747, %object
	.size	__func__.6747, 18
__func__.6747:
	.string	"FSP_IfCanGetDecFs"
	.zero	6
	.type	__func__.6765, %object
	.size	__func__.6765, 17
__func__.6765:
	.string	"FSP_ClearLogicFs"
	.zero	7
	.type	__func__.6771, %object
	.size	__func__.6771, 15
__func__.6771:
	.string	"FSP_GetLogicFs"
	.zero	1
	.type	__func__.6636, %object
	.size	__func__.6636, 16
__func__.6636:
	.string	"FSP_LinkLogicFs"
	.type	__func__.6673, %object
	.size	__func__.6673, 17
__func__.6673:
	.string	"FSP_SetStoreType"
	.zero	7
	.type	__func__.6760, %object
	.size	__func__.6760, 15
__func__.6760:
	.string	"FSP_ReleasePmv"
	.zero	1
	.type	__func__.6781, %object
	.size	__func__.6781, 26
__func__.6781:
	.string	"FSP_GetLogicFs_By_DecAddr"
	.zero	6
	.type	__func__.6795, %object
	.size	__func__.6795, 27
__func__.6795:
	.string	"FSP_GetLogicFs_By_DispAddr"
	.zero	5
	.type	__func__.6810, %object
	.size	__func__.6810, 29
__func__.6810:
	.string	"FSP_GetPairDispFs_By_DecAddr"
	.zero	3
	.type	__func__.6823, %object
	.size	__func__.6823, 24
__func__.6823:
	.string	"FSP_MarkImageOutHanging"
	.type	__func__.6504, %object
	.size	__func__.6504, 27
__func__.6504:
	.string	"FSP_MarkMetadataOutHanging"
	.zero	5
	.type	__func__.6832, %object
	.size	__func__.6832, 26
__func__.6832:
	.string	"FSP_UnMarkImageOutHanging"
	.zero	6
	.type	__func__.6510, %object
	.size	__func__.6510, 29
__func__.6510:
	.string	"FSP_UnMarkMetadataOutHanging"
	.zero	3
	.type	__func__.6838, %object
	.size	__func__.6838, 18
__func__.6838:
	.string	"FSP_GetFsImagePtr"
	.zero	6
	.type	__func__.6845, %object
	.size	__func__.6845, 15
__func__.6845:
	.string	"FSP_GetPmvAddr"
	.zero	1
	.type	__func__.6853, %object
	.size	__func__.6853, 20
__func__.6853:
	.string	"FSP_GetDecFsAddrTab"
	.zero	4
	.type	__func__.6864, %object
	.size	__func__.6864, 18
__func__.6864:
	.string	"FSP_GetPmvAddrTab"
	.zero	6
	.type	__func__.6874, %object
	.size	__func__.6874, 19
__func__.6874:
	.string	"FSP_GetNullLogicFs"
	.zero	5
	.type	__func__.6895, %object
	.size	__func__.6895, 21
__func__.6895:
	.string	"FSP_GetWaitDispFsNum"
	.zero	3
	.type	__func__.6904, %object
	.size	__func__.6904, 22
__func__.6904:
	.string	"FSP_CheckIfFsPolluted"
	.zero	2
	.type	__func__.6596, %object
	.size	__func__.6596, 19
__func__.6596:
	.string	"FSP_UnBindExternFs"
	.zero	5
	.type	__func__.6263, %object
	.size	__func__.6263, 18
__func__.6263:
	.string	"FSP_ExchangeDecFs"
	.zero	6
	.type	__func__.6689, %object
	.size	__func__.6689, 26
__func__.6689:
	.string	"FSP_ReleaseUnusedOldDecFs"
	.zero	6
	.type	__func__.6702, %object
	.size	__func__.6702, 26
__func__.6702:
	.string	"FSP_ReleaseUnusedCurDecFs"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC3:
	ASCII(.string	"%s inquire mem need failed.\n" )
	.zero	3
.LC5:
	ASCII(.string	"%s: NeedDispFs %d, NeedPmv %d, NeedMetadata %d, LineNumOffset %d\n" )
	.zero	6
.LC7:
	ASCII(.string	"%s: DecFsNum %d, DecFsSize %d, DispFsNum %d, DispFsSize %d, PmvNum %d, PmvSize %d,            MetadataNum %d, MetadataSize %d\n" )
	.zero	1
.LC9:
	ASCII(.string	"%s DecInfo: HeadStride %d, HeadSize %d, YStride %d, UVStride %d, ChromOffset %d,            Stride_nbit %d, LumaOffset_nbit %d, ChromOffset_nbit %d\n" )
	.zero	3
.LC11:
	ASCII(.string	"%s DispInfo: HeadStride %d, HeadSize %d, Stride %d, ChromOffset %d\n" )
	.zero	4
.LC14:
	ASCII(.string	"%s, %d, Addr = 0x%x set in use, FsState = FS_STATE_OUT_HANGING\n" )
.LC17:
	ASCII(.string	"%s, %d, Addr = 0x%x set no use\n" )
.LC21:
	ASCII(.string	"VDEC_DecBuffer" )
	.zero	1
.LC23:
	ASCII(.string	"%s" )
	.zero	5
.LC25:
	ASCII(.string	"VDEC_DispBuffer" )
.LC27:
	ASCII(.string	"VDEC_PmvBuffer" )
	.zero	1
.LC29:
	ASCII(.string	"VDEC_MetadataBuffer" )
	.zero	4
.LC32:
	ASCII(.string	"%s unsupport type %d\n" )
	.zero	2
.LC34:
	ASCII(.string	"%s ERROR: Buf %s IsMap PhyAddr 0x%x but VirAddr=0 invalid\n" )
	.zero	5
.LC36:
	ASCII(.string	"Report to release mem %s phy 0x%x size %d\n" )
	.zero	5
.LC49:
	ASCII(.string	"Require mem %s size %d\n" )
.LC53:
	ASCII(.string	"%s require size:%d, num:%d, w:%d, h:%d s:%d bitdepth:%d\n" )
	.zero	7
.LC56:
	ASCII(.string	"%s require dec(%d/%d), disp(%d/%d), pmv(%d/%d), metadata(%d/%d).\n" )
	.zero	6
.LC59:
	ASCII(.string	"%s: ExpectDecFsNum %d, ExpectPmvNum %d\n" )
.LC61:
	ASCII(.string	"%s call FSP_ReportFsRequirement failed.\n" )
	.zero	7
.LC63:
	ASCII(.string	"%s fsp config invalid: eVidStd %d, BitDepth %d, DecFsWidth %d, DecFsHeight %d, UserDec %d\n" )
	.zero	5
.LC66:
	ASCII(.string	"Report to cancel alloc cmd UniqueID %llx, Mask %llx\n" )
	.zero	3
.LC70:
	ASCII(.string	"%s get mem(phy 0x%x/size %d) vir addr failed.\n" )
	.zero	1
.LC72:
	ASCII(.string	"%s mem 0x%x water mark 0x%x != 0x%x, it must be polluted!!!\n" )
	.zero	3
.LC75:
	ASCII(.string	"%s WARNING: DispFs PhyAddr 0x%x LinkRef %d != 0, force 0.\n" )
	.zero	5
.LC77:
	ASCII(.string	"MetadataID out of range" )
.LC80:
	ASCII(.string	"%s: %s\n" )
.LC83:
	ASCII(.string	"%s WARNING: DecFs PhyAddr 0x%x LinkRef %d != 0, force 0.\n" )
	.zero	6
.LC85:
	ASCII(.string	"InstID out of range" )
	.zero	4
.LC90:
	ASCII(.string	"%s IsWaitDisp %d confused: pDispFs %d(Tick %d) != LogicFs %d(Tick %d)!\n" )
.LC98:
	ASCII(.string	"fsp is already inited" )
	.zero	2
.LC106:
	ASCII(.string	"Fsp is not inited" )
	.zero	6
.LC131:
	ASCII(.string	"%s resolution invalid\n" )
	.zero	1
.LC134:
	ASCII(.string	"%s config: eVidStd %d, BitDepth %d, ExpectDecFsNum %d, ExpectPmvNum %d, DecFsWidth %d, DecFsHeight %d, UserDec %d\n" )
	.zero	5
.LC136:
	ASCII(.string	"%s config not changed.\n" )
.LC138:
	ASCII(.string	"%s call FSP_GetFsRequirement failed.\n" )
	.zero	2
.LC141:
	ASCII(.string	"%s unsupport Mode %d\n" )
	.zero	2
.LC150:
	ASCII(.string	"Alloc type is invalid" )
	.zero	2
.LC158:
	ASCII(.string	"%s Set Num:%d >= MAX_FRAME_NUM:%d, ignor it.\n" )
	.zero	2
.LC162:
	ASCII(.string	"pMem = NULL" )
	.zero	4
.LC171:
	ASCII(.string	"%s mem %s size %d != need %d, ignor it.\n" )
	.zero	7
.LC173:
	ASCII(.string	"%s CfgNum %d >= RequireNum %d/MAX_FRAME_NUM %d, ignor it.\n" )
	.zero	5
.LC175:
	ASCII(.string	"%s no free record position, ignor it.\n" )
	.zero	1
.LC177:
	ASCII(.string	"%s BackTunnelLineNumVirAddr is invalid\n" )
.LC179:
	ASCII(.string	"%s CfgNum %d >= RequireNum %d/MAX_PMV_NUM %d, ignor it.\n" )
	.zero	7
.LC181:
	ASCII(.string	"%s unkown buffer %s\n" )
	.zero	3
.LC183:
	ASCII(.string	"Bind mem %s phy 0x%x size %d\n" )
	.zero	2
.LC187:
	ASCII(.string	"pExternBuffer = NULL" )
	.zero	3
.LC193:
	ASCII(.string	"%s Frame buffer Address(0x%x) is not alligned!\n" )
.LC199:
	ASCII(.string	"%s CfgNum:%d Phy:0x%x size:0x%x attach phy:0x%x vir:0x%x size:0x%x\n" )
	.zero	4
.LC216:
	ASCII(.string	"%s no free logic fs.\n" )
	.zero	2
.LC218:
	ASCII(.string	"No DecFs, can't be fixed.\n" )
	.zero	5
.LC220:
	ASCII(.string	"No DispFs, can't be fixed.\n" )
	.zero	4
.LC222:
	ASCII(.string	"No Pmv, can't be fixed.\n" )
	.zero	7
.LC224:
	ASCII(.string	"No pmv, force use PmvRec[0].\n" )
	.zero	2
.LC226:
	ASCII(.string	"No metadata, can't be fixed.\n" )
	.zero	2
.LC228:
	ASCII(.string	"No metadata, force use stMetadataRec[0].\n" )
	.zero	6
.LC230:
	ASCII(.string	"New LogicFs %d(Tick %d), DecFs %d(Tick %d), DispFs %d(Tick %d).\n" )
	.zero	7
.LC233:
	ASCII(.string	"%s try fix fs failed.\n" )
	.zero	1
.LC239:
	ASCII(.string	"LogicFsID out of range" )
	.zero	1
.LC244:
	ASCII(.string	"%s IsRef %d confused: pDecFs %d(Tick %d) != LogicFs %d(Tick %d)!\n" )
	.zero	6
.LC261:
	ASCII(.string	"%s IsWaitDisp %d confused: pDecFs %d(Tick %d) != LogicFs %d(Tick %d)!\n" )
	.zero	1
.LC287:
	ASCII(.string	"pstVoQue is NULL" )
	.zero	7
.LC298:
	ASCII(.string	"fsp is not inited" )
	.zero	6
.LC317:
	ASCII(.string	"LinkFsID out of range" )
	.zero	2
.LC323:
	ASCII(.string	"%s get pLinkFs by LinkFsID %d failed!\n" )
	.zero	1
.LC325:
	ASCII(.string	"%s ERROR: LinkFsID %d with pstDecodeFs(%p)/pstDispOutFs(%p) = NULL.\n" )
	.zero	3
.LC327:
	ASCII(.string	"%s no free disp fs.\n" )
	.zero	3
.LC329:
	ASCII(.string	"%s no free metadata.\n" )
	.zero	2
.LC331:
	ASCII(.string	"Link LogicFs %d(Tick %d), LinkFs %d(Tick %d), DecFs %d(Tick %d), DispFs %d(Tick %d).\n" )
	.zero	2
.LC335:
	ASCII(.string	"%s find LogicFs %d failed!\n" )
	.zero	4
.LC337:
	ASCII(.string	"%s LogicFs %d pstDecodeFs = NULL!\n" )
	.zero	5
.LC340:
	ASCII(.string	"%s pstLogicFs = NULL!\n" )
	.zero	1
.LC347:
	ASCII(.string	"%s notice: another logic fs match, replace with latest one.\n" )
	.zero	3
.LC362:
	ASCII(.string	"Found logic fs, but its disp fs is null, take the closet one instead.\n" )
	.zero	1
.LC364:
	ASCII(.string	"Found logic fs(core %d), but its disp fs not match.\n" )
	.zero	3
.LC373:
	ASCII(.string	"%s, %d, Addr = 0x%x set in use IsOutHanging = 1\n" )
	.zero	7
.LC395:
	ASCII(.string	"pDecFsAddrTab is NULL\n" )
	.zero	1
.LC397:
	ASCII(.string	"pDecFsNum is NULL\n" )
	.zero	5
.LC405:
	ASCII(.string	"pPmvAddrTab is NULL\n" )
	.zero	3
.LC407:
	ASCII(.string	"pPmvNum is NULL\n" )
	.zero	7
.LC432:
	ASCII(.string	"%s: can not find logic fs by dec phy addr 0x%llx.\n" )
	.zero	5
.LC434:
	ASCII(.string	"%s, %d: parameter error.\n" )
	.zero	6
.LC438:
	ASCII(.string	"Yes" )
	.zero	4
.LC440:
	ASCII(.string	"No" )
	.zero	5
.LC442:
	ASCII(.string	"" )
	.zero	7
.LC444:
	ASCII(.string	"(Free)" )
	.zero	1
.LC447:
	ASCII(.string	"pFsp %d invalid\n" )
	.zero	7
.LC449:
	ASCII(.string	"\n" )
	.zero	6
.LC451:
	ASCII(.string	"----------------------------- FSP %2d --------------------------\n" )
	.zero	6
.LC453:
	ASCII(.string	"InstState" )
	.zero	6
.LC455:
	ASCII(.string	"%-40s :%d\n" )
	.zero	5
.LC457:
	ASCII(.string	"PartitionState" )
	.zero	1
.LC459:
	ASCII(.string	"ExtraFrameNum" )
	.zero	2
.LC461:
	ASCII(.string	"OccupiedFrameNum" )
	.zero	7
.LC463:
	ASCII(.string	"----------------------------- CFG -----------------------------\n" )
	.zero	7
.LC465:
	ASCII(.string	"VidStd" )
	.zero	1
.LC467:
	ASCII(.string	"BitDepth" )
	.zero	7
.LC469:
	ASCII(.string	"UserDec" )
.LC471:
	ASCII(.string	"DecFsWidth" )
	.zero	5
.LC473:
	ASCII(.string	"DecFsHeight" )
	.zero	4
.LC475:
	ASCII(.string	"DispFsWidth" )
	.zero	4
.LC477:
	ASCII(.string	"DispFsHeight" )
	.zero	3
.LC479:
	ASCII(.string	"ExpectDecFsNum" )
	.zero	1
.LC481:
	ASCII(.string	"ExpectPmvNum" )
	.zero	3
.LC483:
	ASCII(.string	"--------------------------- MEM NEED --------------------------\n" )
	.zero	7
.LC485:
	ASCII(.string	"DecFsNum" )
	.zero	7
.LC487:
	ASCII(.string	"DecFsSize" )
	.zero	6
.LC489:
	ASCII(.string	"DecLinearEn" )
	.zero	4
.LC491:
	ASCII(.string	"DecCompressEn" )
	.zero	2
.LC493:
	ASCII(.string	"DecBitDepth" )
	.zero	4
.LC495:
	ASCII(.string	"DecHeadStride" )
	.zero	2
.LC497:
	ASCII(.string	"DecHeadSize" )
	.zero	4
.LC499:
	ASCII(.string	"DecYStride" )
	.zero	5
.LC501:
	ASCII(.string	"DecUVStride" )
	.zero	4
.LC503:
	ASCII(.string	"DecChromOffset" )
	.zero	1
.LC505:
	ASCII(.string	"DecStride_nbit" )
	.zero	1
.LC507:
	ASCII(.string	"LumaOffset_nbit" )
.LC509:
	ASCII(.string	"ChromOffset_nbit" )
	.zero	7
.LC511:
	ASCII(.string	"LineNumOffset" )
	.zero	2
.LC513:
	ASCII(.string	"NeedDispFs" )
	.zero	5
.LC515:
	ASCII(.string	"%-40s :%s\n" )
	.zero	5
.LC517:
	ASCII(.string	"DispFsNum" )
	.zero	6
.LC519:
	ASCII(.string	"DispFsSize" )
	.zero	5
.LC521:
	ASCII(.string	"DispLinearEn" )
	.zero	3
.LC523:
	ASCII(.string	"DispCompressEn" )
	.zero	1
.LC525:
	ASCII(.string	"DispBitDepth" )
	.zero	3
.LC527:
	ASCII(.string	"DispHeadStride" )
	.zero	1
.LC529:
	ASCII(.string	"DispHeadSize" )
	.zero	3
.LC531:
	ASCII(.string	"DispYStride" )
	.zero	4
.LC533:
	ASCII(.string	"DispUVStride" )
	.zero	3
.LC535:
	ASCII(.string	"DispChromOffset" )
.LC537:
	ASCII(.string	"NeedPmv" )
.LC539:
	ASCII(.string	"PmvNum" )
	.zero	1
.LC541:
	ASCII(.string	"PmvSize" )
.LC543:
	ASCII(.string	"NeedMetadata" )
	.zero	3
.LC545:
	ASCII(.string	"MetadataNum" )
	.zero	4
.LC547:
	ASCII(.string	"MetadataSize" )
	.zero	3
.LC549:
	ASCII(.string	"--------------------------- LOGIC FS --------------------------\n" )
	.zero	7
.LC551:
	ASCII(.string	"FsState" )
.LC553:
	ASCII(.string	"FsType" )
	.zero	1
.LC555:
	ASCII(.string	"IsRef" )
	.zero	2
.LC557:
	ASCII(.string	"Tick" )
	.zero	3
.LC559:
	ASCII(.string	"Num" )
	.zero	4
.LC561:
	ASCII(.string	"%-10s %-10s %-10s %-10s %-10s %-10s %-10s\n" )
	.zero	5
.LC563:
	ASCII(.string	"DispPhy" )
.LC565:
	ASCII(.string	"DecPhy" )
	.zero	1
.LC567:
	ASCII(.string	"%-10d %-10d %-10d %-10d %-10d 0x%-10x 0x%-10x\n" )
	.zero	1
.LC569:
	ASCII(.string	"LogicFs(Free/Total)" )
	.zero	4
.LC571:
	ASCII(.string	"%-40s :%d/%d\n" )
	.zero	2
.LC573:
	ASCII(.string	"---------------------------- DEC FS ---------------------------\n" )
	.zero	7
.LC575:
	ASCII(.string	"LinkRef" )
.LC577:
	ASCII(.string	"IsValid" )
.LC579:
	ASCII(.string	"%-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s\n" )
	.zero	7
.LC581:
	ASCII(.string	"Address" )
.LC583:
	ASCII(.string	"Size" )
	.zero	3
.LC585:
	ASCII(.string	"%-10d %-10d %-10d %-10d %-10d %-10d %-10d 0x%-10x %s\n" )
	.zero	2
.LC587:
	ASCII(.string	"DecFs(Free/Total)" )
	.zero	6
.LC589:
	ASCII(.string	"---------------------------- DISP FS --------------------------\n" )
	.zero	7
.LC591:
	ASCII(.string	"DispFs(Free/Total)" )
	.zero	5
.LC593:
	ASCII(.string	"------------------------------ PMV ----------------------------\n" )
	.zero	7
.LC595:
	ASCII(.string	"HalfOffset" )
	.zero	5
.LC597:
	ASCII(.string	"IsInUse" )
.LC599:
	ASCII(.string	"%-10s %-10s %-10s %-10s %-10s %-10s\n" )
	.zero	3
.LC601:
	ASCII(.string	"%-10d %-10d %-10d %-10d %-10d 0x%-10x %s\n" )
	.zero	6
.LC603:
	ASCII(.string	"Pmv(Free/Total)" )
.LC605:
	ASCII(.string	"--------------------------- METADATA --------------------------\n" )
	.zero	7
.LC607:
	ASCII(.string	"IsOut" )
	.zero	2
.LC609:
	ASCII(.string	"Metadata(Free/Total)" )
	.zero	3
.LC618:
	ASCII(.string	"%s:Warning, Fs is unavailable, Valid:%d Ref:%d Status:%d Size:%d\n" )
	.zero	6
.LC622:
	ASCII(.string	"%s ERROR: LackNum %d < 0.\n" )
	.zero	5
.LC624:
	ASCII(.string	"EmptyPos or ValidPos = -1" )
	.zero	6
.LC628:
	ASCII(.string	"EmptyFs is not empty" )
	.zero	3
.LC630:
	ASCII(.string	"ValidFs is not valid" )
	.zero	3
.LC639:
	ASCII(.string	"%s WARNING: DecFsRec[%d] is invalid!\n" )
	.zero	2
.LC653:
	ASCII(.string	"pFsp %d or input Ptr pstMemNeed %p invalid!!\n" )
	.bss
	.align	3
.LANCHOR2 = . + 0
	.type	g_FsWaterMarkEnable, %object
	.size	g_FsWaterMarkEnable, 4
g_FsWaterMarkEnable:
	.zero	4
	.zero	4
	.type	s_pFspInst, %object
	.size	s_pFspInst, 32
s_pFspInst:
	.zero	32
	.type	g_LastDecPhyAddr, %object
	.size	g_LastDecPhyAddr, 4
g_LastDecPhyAddr:
	.zero	4
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
