#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"bitplane.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	BPD_CfgReg
	.type	BPD_CfgReg, %function
BPD_CfgReg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	mov	x20, x2
	bl	_mcount
	str	wzr, [x29, 60]
	ldr	x5, .LC0
	mov	w1, -1
	mov	w0, -2
	add	x7, x19, 16384
	ldr	x8, [x5, 8]
	str	w1, [x8, 68]
	str	w0, [x8, 68]
	ldp	w2, w9, [x21, 28]
	ldrsb	w3, [x7, 1296]
	sub	w1, w2, w9
	ubfx	x0, x9, 3, 29
	ubfx	x1, x1, 3, 2
	ldr	x4, [x21]
	add	x1, x1, x0
	add	x0, x4, x1
	cbz	w3, .L2
	ldrb	w1, [x20, 374]
	cbnz	w1, .L29
.L3:
	ldrb	w1, [x29, 61]
	orr	w1, w1, 16
	strb	w1, [x29, 61]
	ldrb	w1, [x20, 197]
	cmp	w1, 1
	beq	.L30
.L5:
	ldrb	w1, [x20, 361]
	mov	w2, 3
	ldrb	w3, [x29, 61]
	cmp	w1, 4
	and	w1, w1, w2
	csel	w1, w1, w2, ne
	ldr	w2, [x20, 404]
	bfi	w3, w1, 6, 2
	ldrb	w1, [x29, 62]
	cmp	w2, 3
	strb	w3, [x29, 61]
	bfi	w1, w2, 0, 2
	ldrb	w2, [x20, 16]
	bfi	w1, w2, 2, 2
	strb	w1, [x29, 62]
	bne	.L8
	ldr	w4, [x19, 3108]
	mov	w2, 21846
	movk	w2, 0x5555, lsl 16
	add	w4, w4, 1
	add	w4, w4, w4, lsr 31
	asr	w3, w4, 1
	smull	x2, w3, w2
	lsr	x2, x2, 32
	sub	w4, w2, w4, asr 31
	add	w3, w3, w4
	and	w3, w3, 3
	b	.L12
	.p2align 3
.L2:
	ldrb	w1, [x20, 259]
	cbnz	w1, .L31
.L9:
	ldrb	w1, [x29, 61]
	orr	w1, w1, 16
	strb	w1, [x29, 61]
.L10:
	ldrb	w4, [x20, 251]
	mov	w2, 3
	ldrb	w3, [x29, 61]
	and	w1, w4, w2
	cmp	w4, 4
	csel	w2, w1, w2, ne
	ldrb	w1, [x29, 62]
	bfi	w3, w2, 6, 2
	ldrb	w2, [x20]
	and	w1, w1, 252
	strb	w3, [x29, 61]
	bfi	w1, w2, 2, 2
	strb	w1, [x29, 62]
.L8:
	ldr	w1, [x19, 3108]
	mov	w3, 21846
	movk	w3, 0x5555, lsl 16
	smull	x3, w1, w3
	lsr	x3, x3, 32
	sub	w3, w3, w1, asr 31
	add	w1, w3, w1
	and	w3, w1, 3
.L12:
	ldrb	w2, [x29, 61]
	mov	w1, 21846
	ldr	w4, [x19, 3316]
	movk	w1, 0x5555, lsl 16
	bfi	w2, w3, 2, 2
	ldr	x3, [x19, 3296]
	ldr	w6, [x19, 3104]
	and	w9, w9, 7
	sub	x3, x0, x3
	add	x3, x3, x4
	and	w3, w3, 15
	smull	x1, w6, w1
	add	w3, w9, w3, lsl 3
	strb	w3, [x29, 60]
	ldrb	w3, [x29, 62]
	lsr	x1, x1, 32
	sub	w1, w1, w6, asr 31
	and	w3, w3, -49
	strb	w3, [x29, 62]
	lsl	w3, w1, 2
	sub	w1, w3, w1
	sub	w6, w6, w1
	bfi	w2, w6, 0, 2
	strb	w2, [x29, 61]
	ldr	w1, [x29, 60]
	str	w1, [x8, 4]
	ldr	x3, [x19, 3296]
	ldr	x1, [x5, 8]
	ldr	w2, [x19, 3316]
	sub	x0, x0, x3
	add	w0, w2, w0
	str	w0, [x1, 8]
	ldrsb	w0, [x7, 1296]
	cbz	w0, .L13
	ldr	w0, [x20, 404]
	cmp	w0, 3
	beq	.L32
.L13:
	ldr	w0, [x19, 3108]
	sub	w0, w0, #1
	uxth	w0, w0
.L14:
	ldr	w1, [x19, 3104]
	mov	w4, 3
	strh	w0, [x29, 62]
	mov	w6, 0
	ldr	x2, [x5, 8]
	sub	w0, w1, #1
	strh	w0, [x29, 60]
	bfi	w6, w4, 4, 4
	mov	w0, 0
	ldr	w1, [x29, 60]
	str	w1, [x2, 12]
	str	wzr, [x29, 60]
	ldr	w2, [x19, 3104]
	ldr	x1, [x5, 8]
	add	w3, w2, 254
	adds	w2, w2, 127
	csel	w2, w3, w2, mi
	ubfx	x2, x2, 7, 12
	ubfiz	w2, w2, 4, 8
	strh	w2, [x29, 60]
	ldr	w2, [x29, 60]
	str	w2, [x1, 16]
	str	wzr, [x29, 60]
	ldr	w2, [x19, 3208]
	str	w2, [x1, 20]
	strb	w6, [x29, 60]
	ldr	w3, [x19, 3212]
	str	w3, [x1, 24]
	strb	w4, [x29, 61]
	ldr	w3, [x19, 3216]
	str	w3, [x1, 28]
	ldr	w2, [x29, 60]
	ldr	w3, [x19, 3220]
	str	w3, [x1, 32]
	ldr	w3, [x19, 3224]
	str	w3, [x1, 36]
	ldr	w3, [x19, 3228]
	str	w3, [x1, 40]
	ldr	w3, [x19, 3232]
	str	w3, [x1, 44]
	str	w2, [x1, 48]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L29:
	ldrh	w1, [x20, 374]
	cmp	w1, 4
	beq	.L3
	ldrb	w1, [x20, 197]
	cmp	w1, 1
	bne	.L5
.L30:
	ldr	w1, [x20, 476]
	cmp	w1, 8
	bgt	.L5
	ldrb	w1, [x29, 61]
	orr	w1, w1, 32
	strb	w1, [x29, 61]
	b	.L5
	.p2align 3
.L31:
	ldr	x1, [x20, 256]
	mov	x2, 67108864
	and	x1, x1, 1099494850560
	cmp	x1, x2
	bne	.L10
	b	.L9
	.p2align 3
.L32:
	ldr	w0, [x19, 3108]
	add	w0, w0, 1
	add	w0, w0, w0, lsr 31
	asr	w0, w0, 1
	sub	w0, w0, #1
	uxth	w0, w0
	b	.L14
	.size	BPD_CfgReg, .-BPD_CfgReg
	.align	3
.LC0:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BPD_Reset
	.type	BPD_Reset, %function
BPD_Reset:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	bl	_mcount
	mov	w0, 53248
	movk	w0, 0xf8c3, lsl 16
	bl	MEM_Phy2Vir
	cbz	x0, .L41
	ldr	x20, .LC3
	mov	w19, 0
	ldr	x21, .LC4
	ldr	x0, [x20]
	add	x0, x0, 61440
	ldr	w1, [x0, 2060]
	str	w1, [x29, 60]
	orr	w1, w1, 8
	strb	w1, [x29, 60]
	ldr	w1, [x29, 60]
	str	w1, [x0, 2060]
	b	.L37
	.p2align 3
.L42:
	add	w19, w19, 1
	cmp	w19, 1000
	beq	.L38
.L37:
	ldr	x1, [x21, 232]
	mov	x0, 30
	blr	x1
	ldr	x0, [x20]
	add	x0, x0, 61440
	ldr	w1, [x0, 2064]
	str	w1, [x29, 60]
	tbz	x1, 3, .L42
	cmp	w19, 999
	bgt	.L38
.L39:
	ldr	w1, [x0, 2060]
	mov	w3, -2
	str	w1, [x29, 60]
	and	w1, w1, -9
	strb	w1, [x29, 60]
	ldr	x2, [x20, 8]
	ldr	w1, [x29, 60]
	str	w1, [x0, 2060]
	str	w3, [x2, 52]
.L33:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L38:
	ldr	x2, .LC6
	mov	w1, 164
	mov	w0, 0
	bl	dprint_normal
	ldr	x0, [x20]
	add	x0, x0, 61440
	b	.L39
.L41:
	ldr	x2, .LC2
	mov	x3, 0
	mov	w1, 142
	bl	dprint_normal
	b	.L33
	.size	BPD_Reset, .-BPD_Reset
	.align	3
.LC2:
	.xword	.LC1
	.align	3
.LC3:
	.xword	g_HwMem
	.align	3
.LC4:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC6:
	.xword	.LC5
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BPD_Start
	.type	BPD_Start, %function
BPD_Start:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC7
	mov	w2, 1
	ldr	x1, [x0, 8]
	str	wzr, [x1]
	ldr	x1, [x0, 8]
	str	w2, [x1]
	ldr	x0, [x0, 8]
	str	wzr, [x0]
	ldp	x29, x30, [sp], 16
	ret
	.size	BPD_Start, .-BPD_Start
	.align	3
.LC7:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsBpd_Ready
	.type	IsBpd_Ready, %function
IsBpd_Ready:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC8
	ldp	x29, x30, [sp], 16
	ldr	x0, [x0, 8]
	ldr	w0, [x0, 64]
	and	w0, w0, 1
	ret
	.size	IsBpd_Ready, .-IsBpd_Ready
	.align	3
.LC8:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BPDDRV_WaitBpdReadyIfNoIsr
	.type	BPDDRV_WaitBpdReadyIfNoIsr, %function
BPDDRV_WaitBpdReadyIfNoIsr:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC9
	ldr	x0, [x20]
	blr	x0
	ldr	x21, .LC10
	mov	w19, w0
	ldr	x0, [x21, 8]
	ldr	w0, [x0, 64]
	tbz	x0, 0, .L48
	b	.L46
	.p2align 3
.L50:
	ldr	x0, [x21, 8]
	ldr	w0, [x0, 64]
	tbnz	x0, 0, .L46
.L48:
	ldr	x0, [x20]
	blr	x0
	cmp	w0, w19
	csel	w19, w19, wzr, cs
	sub	w0, w0, w19
	cmp	w0, 3999
	bls	.L50
	ldr	x2, .LC12
	mov	w1, 233
	mov	w0, 0
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L46:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	BPDDRV_WaitBpdReadyIfNoIsr, .-BPDDRV_WaitBpdReadyIfNoIsr
	.align	3
.LC9:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC10:
	.xword	g_HwMem
	.align	3
.LC12:
	.xword	.LC11
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BPD_GetParam
	.type	BPD_GetParam, %function
BPD_GetParam:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x20, x2
	mov	x19, x1
	bl	_mcount
	ldr	x0, .LC13
	ldr	w4, [x20, 24]
	ldr	w3, [x20, 32]
	ldr	x2, [x0, 8]
	lsl	w0, w4, 3
	sub	w0, w0, w3
	ldr	w1, [x2, 80]
	ldr	w5, [x2, 84]
	cmp	w1, w0
	bcs	.L59
	add	x21, x21, 16384
	ldrsb	w0, [x21, 1296]
	cbnz	w0, .L60
	and	w2, w5, 15
	ubfx	x0, x5, 8, 4
	str	w2, [x19, 340]
	ubfx	x5, x5, 4, 4
	str	w0, [x19, 344]
	str	w5, [x19, 348]
.L58:
	mov	x0, x20
	bl	BsLongSkip
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L60:
	ubfx	x0, x5, 12, 4
	ubfx	x7, x5, 0, 4
	ubfx	x6, x5, 16, 4
	ubfx	x4, x5, 20, 4
	ubfx	x3, x5, 8, 4
	ubfx	x2, x5, 24, 4
	strb	w0, [x19, 397]
	ubfx	x0, x5, 4, 4
	strb	w7, [x19, 394]
	ubfx	x5, x5, 28, 2
	strb	w6, [x19, 398]
	strb	w4, [x19, 399]
	strb	w3, [x19, 395]
	strb	w2, [x19, 400]
	strb	w0, [x19, 396]
	strb	w5, [x19, 390]
	b	.L58
	.p2align 3
.L59:
	ldr	x2, .LC15
	sub	w4, w4, w3
	mov	w0, 0
	mov	w3, w1
	mov	w1, 252
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	BPD_GetParam, .-BPD_GetParam
	.align	3
.LC13:
	.xword	g_HwMem
	.align	3
.LC15:
	.xword	.LC14
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	BPD_Drv
	.type	BPD_Drv, %function
BPD_Drv:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x1
	mov	x22, x0
	mov	x0, x30
	mov	w20, w3
	mov	x21, x2
	bl	_mcount
	ldr	w4, [x19, 3108]
	ldr	w3, [x19, 3104]
	cmp	w4, 2
	ble	.L63
	sub	w1, w3, #3
	mov	w0, 128
	cmp	w1, 125
	ccmp	w4, w0, 0, ls
	ble	.L64
.L63:
	ldr	x2, .LC17
	lsl	w4, w4, 4
	lsl	w3, w3, 4
	mov	w1, 300
	mov	w0, 0
	bl	dprint_normal
	ldr	w0, [x19, 3104]
	cmp	w0, 128
	ble	.L73
.L65:
	ldr	x0, .LC18
	ldr	x4, [x0]
	cbz	x4, .L72
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	mov	w0, w20
	blr	x4
	mov	w0, 1
.L66:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L73:
	ldr	w0, [x19, 3108]
	cmp	w0, 128
	bgt	.L65
.L72:
	mov	w0, 1
.L74:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L64:
	bl	BPD_Reset
	ldr	x20, .LC19
	mov	x2, x21
	mov	x1, x22
	mov	x3, x20
	mov	x0, x19
	bl	BPD_CfgReg
	cbnz	w0, .L68
	ldr	x0, [x20, 8]
	mov	w1, 1
	str	wzr, [x0]
	ldr	x0, [x20, 8]
	str	w1, [x0]
	ldr	x0, [x20, 8]
	str	wzr, [x0]
	bl	BPDDRV_WaitBpdReadyIfNoIsr
	cbnz	w0, .L72
	mov	x2, x22
	mov	x1, x21
	mov	x0, x19
	bl	BPD_GetParam
	cmp	w0, wzr
	cset	w0, ne
	b	.L66
	.p2align 3
.L68:
	ldr	x2, .LC21
	mov	w1, 342
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 1
	b	.L74
	.size	BPD_Drv, .-BPD_Drv
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC18:
	.xword	g_EventReportFunc
	.align	3
.LC19:
	.xword	g_HwMem
	.align	3
.LC21:
	.xword	.LC20
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC1:
	ASCII(.string	"VDMHAL_ResetBPD: map BPD register fail, vir(reg) = (%p)\n" )
	.zero	7
.LC5:
	ASCII(.string	"Reset BPD Failed!\n" )
	.zero	5
.LC11:
	ASCII(.string	"BPD TimeOut!\n" )
	.zero	2
.LC14:
	ASCII(.string	" BPD ERROR: EAT TOO MUCH BS %#x, but available bs num %#x!!!\n" )
	.zero	2
.LC16:
	ASCII(.string	"NOT SUPPORT SIZE %d*%d\n" )
.LC20:
	ASCII(.string	"BPD error: no map reg!\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
