#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vfmw_ctrl.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetStatisticsEnable, %function
VfmwProc_SetStatisticsEnable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	mov	w1, 6032
	ldr	x5, .LC0
	mov	w0, 32
	ldr	x2, .LC2
	mov	w3, w4
	str	w4, [x5]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetStatisticsEnable, .-VfmwProc_SetStatisticsEnable
	.align	3
.LC0:
	.xword	.LANCHOR0
	.align	3
.LC2:
	.xword	.LC1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetStandardObedience, %function
VfmwProc_SetStandardObedience:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	mov	w1, 6022
	ldr	x5, .LC3
	mov	w0, 32
	ldr	x2, .LC5
	mov	w3, w4
	str	w4, [x5, 4]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetStandardObedience, .-VfmwProc_SetStandardObedience
	.align	3
.LC3:
	.xword	.LANCHOR0
	.align	3
.LC5:
	.xword	.LC4
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetClkSelect, %function
VfmwProc_SetClkSelect:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	cmp	w4, 4
	bhi	.L4
	ldr	x0, .LC6
	str	w4, [x0]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L4:
	ldr	x3, .LC6
	mov	w1, 6011
	ldr	x2, .LC8
	mov	w0, 32
	ldr	w3, [x3]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetClkSelect, .-VfmwProc_SetClkSelect
	.align	3
.LC6:
	.xword	.LANCHOR1
	.align	3
.LC8:
	.xword	.LC7
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetTraceImgPeriod, %function
VfmwProc_SetTraceImgPeriod:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	mov	w1, 5869
	ldr	x5, .LC9
	mov	w0, 32
	ldr	x2, .LC11
	mov	w3, w4
	str	w4, [x5]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetTraceImgPeriod, .-VfmwProc_SetTraceImgPeriod
	.align	3
.LC9:
	.xword	g_TraceImgPeriod
	.align	3
.LC11:
	.xword	.LC10
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetTraceFramePeriod, %function
VfmwProc_SetTraceFramePeriod:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	mov	w1, 5859
	ldr	x5, .LC12
	mov	w0, 32
	ldr	x2, .LC14
	mov	w3, w4
	str	w4, [x5]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetTraceFramePeriod, .-VfmwProc_SetTraceFramePeriod
	.align	3
.LC12:
	.xword	g_TraceFramePeriod
	.align	3
.LC14:
	.xword	.LC13
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetTraceBSPeriod, %function
VfmwProc_SetTraceBSPeriod:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	mov	w1, 5849
	ldr	x5, .LC15
	mov	w0, 32
	ldr	x2, .LC17
	mov	w3, w4
	str	w4, [x5]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetTraceBSPeriod, .-VfmwProc_SetTraceBSPeriod
	.align	3
.LC15:
	.xword	g_TraceBsPeriod
	.align	3
.LC17:
	.xword	.LC16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetTraceCtrl, %function
VfmwProc_SetTraceCtrl:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	mov	w1, 5839
	ldr	x5, .LC18
	mov	w0, 32
	ldr	x2, .LC20
	mov	w3, w4
	str	w4, [x5]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetTraceCtrl, .-VfmwProc_SetTraceCtrl
	.align	3
.LC18:
	.xword	g_TraceCtrl
	.align	3
.LC20:
	.xword	.LC19
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_TestStopDec, %function
VfmwProc_TestStopDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	mov	w1, 5829
	ldr	x5, .LC21
	mov	w0, 32
	ldr	x2, .LC23
	mov	w3, w4
	str	w4, [x5, 8]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestStopDec, .-VfmwProc_TestStopDec
	.align	3
.LC21:
	.xword	.LANCHOR0
	.align	3
.LC23:
	.xword	.LC22
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_TestTimeSequence, %function
VfmwProc_TestTimeSequence:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	mov	w1, 5819
	ldr	x5, .LC24
	mov	w0, 32
	ldr	x2, .LC26
	mov	w3, w4
	str	w4, [x5, 12]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestTimeSequence, .-VfmwProc_TestTimeSequence
	.align	3
.LC24:
	.xword	.LANCHOR0
	.align	3
.LC26:
	.xword	.LC25
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetSaveYuvEnd, %function
VfmwProc_SetSaveYuvEnd:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC27
	ldr	w5, [x19]
	ldr	w3, [x0, 16]
	cmp	w5, w3
	bcc	.L16
	ldr	x6, .LC30
	mov	w4, w5
	ldr	x2, .LC32
	mov	w1, 5738
	mov	w0, 32
	str	w5, [x6, 4]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L16:
	ldr	x2, .LC29
	mov	w4, w5
	mov	w1, 5733
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetSaveYuvEnd, .-VfmwProc_SetSaveYuvEnd
	.align	3
.LC27:
	.xword	.LANCHOR0
	.align	3
.LC29:
	.xword	.LC28
	.align	3
.LC30:
	.xword	.LANCHOR1
	.align	3
.LC32:
	.xword	.LC31
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetSaveYuvBegin, %function
VfmwProc_SetSaveYuvBegin:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC33
	ldr	w5, [x19]
	ldr	w4, [x0, 4]
	cmp	w5, w4
	bhi	.L20
	ldr	x6, .LC36
	mov	w3, w5
	ldr	x2, .LC38
	mov	w1, 5721
	mov	w0, 32
	str	w5, [x6, 16]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L20:
	ldr	x2, .LC35
	mov	w3, w5
	mov	w1, 5716
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetSaveYuvBegin, .-VfmwProc_SetSaveYuvBegin
	.align	3
.LC33:
	.xword	.LANCHOR1
	.align	3
.LC35:
	.xword	.LC34
	.align	3
.LC36:
	.xword	.LANCHOR0
	.align	3
.LC38:
	.xword	.LC37
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetSaveYuvBitDepth, %function
VfmwProc_SetSaveYuvBitDepth:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	and	w0, w4, -3
	cmp	w0, 8
	bne	.L24
	ldr	x5, .LC41
	mov	w3, w4
	ldr	x2, .LC43
	mov	w1, 5704
	mov	w0, 32
	str	w4, [x5, 8]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L24:
	ldr	x2, .LC40
	mov	w3, w4
	mov	w1, 5699
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetSaveYuvBitDepth, .-VfmwProc_SetSaveYuvBitDepth
	.align	3
.LC40:
	.xword	.LC39
	.align	3
.LC41:
	.xword	.LANCHOR1
	.align	3
.LC43:
	.xword	.LC42
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetSaveRawAfterReset, %function
VfmwProc_SetSaveRawAfterReset:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	cmp	w4, 1
	bls	.L28
	ldr	x2, .LC48
	mov	w3, w4
	mov	w1, 5687
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L28:
	ldr	x5, .LC44
	mov	w3, w4
	ldr	x2, .LC46
	mov	w1, 5683
	mov	w0, 32
	str	w4, [x5, 20]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetSaveRawAfterReset, .-VfmwProc_SetSaveRawAfterReset
	.align	3
.LC44:
	.xword	.LANCHOR0
	.align	3
.LC46:
	.xword	.LC45
	.align	3
.LC48:
	.xword	.LC47
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SaveEL, %function
VfmwProc_SaveEL:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	cmp	w19, 3
	bhi	.L29
	ldr	x0, .LC49
	add	x20, x0, 24
	ldr	x1, [x20, w19, uxtw 3]
	cbz	x1, .L34
	ldr	x2, .LC59
	mov	w1, 5668
	mov	w0, 32
	bl	dprint_normal
	ldr	x1, .LC50
	ldr	x0, [x20, w19, uxtw 3]
	ldr	x1, [x1, 72]
	blr	x1
	str	xzr, [x20, w19, uxtw 3]
.L29:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L34:
	ldr	x21, .LC50
	ldr	w1, [x0, 56]
	ldr	x3, .LC51
	mov	w4, w1
	ldr	x2, .LC53
	add	w1, w1, 1
	ldr	x5, [x21, 136]
	str	w1, [x0, 56]
	add	x3, x3, 16
	mov	x1, 50
	add	x0, x29, 56
	blr	x5
	strb	wzr, [x29, 105]
	ldr	x3, [x21, 64]
	mov	w2, 0
	mov	w1, 578
	add	x0, x29, 56
	blr	x3
	str	x0, [x20, w19, uxtw 3]
	cbz	x0, .L32
	ldr	x2, .LC55
	mov	w4, w19
	add	x3, x29, 56
	mov	w1, 5659
	mov	w0, 32
	bl	dprint_normal
	b	.L29
	.p2align 3
.L32:
	ldr	x2, .LC57
	add	x3, x29, 56
	mov	w1, 5663
	mov	w0, 32
	bl	dprint_normal
	b	.L29
	.size	VfmwProc_SaveEL, .-VfmwProc_SaveEL
	.align	3
.LC49:
	.xword	.LANCHOR0
	.align	3
.LC50:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC51:
	.xword	.LANCHOR1
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SaveDecYUV, %function
VfmwProc_SaveDecYUV:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC61
	mov	w1, 5563
	ldr	x2, .LC63
	mov	w0, 32
	bl	dprint_normal
	ldp	x29, x30, [sp], 16
	ret
	.size	VfmwProc_SaveDecYUV, .-VfmwProc_SaveDecYUV
	.align	3
.LC61:
	.xword	.LANCHOR2
	.align	3
.LC63:
	.xword	.LC62
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetCurProcChan, %function
VfmwProc_SetCurProcChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	cmp	w4, 4
	bhi	.L39
	ldr	x5, .LC66
	mov	w3, w4
	ldr	x2, .LC68
	mov	w1, 5389
	mov	w0, 32
	str	w4, [x5, 60]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L39:
	ldr	x2, .LC65
	mov	w3, w4
	mov	w1, 5384
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetCurProcChan, .-VfmwProc_SetCurProcChan
	.align	3
.LC65:
	.xword	.LC64
	.align	3
.LC66:
	.xword	.LANCHOR0
	.align	3
.LC68:
	.xword	.LC67
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetUSE_FF_APT_EN, %function
VfmwProc_SetUSE_FF_APT_EN:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	cmp	w4, 1
	bls	.L43
	ldr	x2, .LC73
	mov	w3, w4
	mov	w1, 5372
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L43:
	ldr	x5, .LC69
	mov	w3, w4
	ldr	x2, .LC71
	mov	w1, 5368
	mov	w0, 32
	str	w4, [x5]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetUSE_FF_APT_EN, .-VfmwProc_SetUSE_FF_APT_EN
	.align	3
.LC69:
	.xword	g_Use_FFAPT_Enable
	.align	3
.LC71:
	.xword	.LC70
	.align	3
.LC73:
	.xword	.LC72
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetFsWaterMark, %function
VfmwProc_SetFsWaterMark:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	cmp	w4, 1
	bls	.L47
	ldr	x2, .LC78
	mov	w3, w4
	mov	w1, 5355
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L47:
	ldr	x5, .LC74
	mov	w3, w4
	ldr	x2, .LC76
	mov	w1, 5351
	mov	w0, 32
	str	w4, [x5]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetFsWaterMark, .-VfmwProc_SetFsWaterMark
	.align	3
.LC74:
	.xword	g_FsWaterMarkEnable
	.align	3
.LC76:
	.xword	.LC75
	.align	3
.LC78:
	.xword	.LC77
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetDefaultOutputOrder, %function
VfmwProc_SetDefaultOutputOrder:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	cmp	w19, 7
	bhi	.L51
	ldr	x2, .LC82
	mov	w3, w19
	mov	w1, 5279
	mov	w0, 32
	bl	dprint_normal
	ldr	x0, .LC83
	str	w19, [x0, 80]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L51:
	ldr	x2, .LC80
	mov	w3, w19
	mov	w1, 5275
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetDefaultOutputOrder, .-VfmwProc_SetDefaultOutputOrder
	.align	3
.LC80:
	.xword	.LC79
	.align	3
.LC82:
	.xword	.LC81
	.align	3
.LC83:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetPrintLevel, %function
VfmwProc_SetPrintLevel:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	mov	w1, 5178
	ldr	x5, .LC84
	mov	w0, 32
	ldr	x2, .LC86
	mov	w3, w4
	str	w4, [x5]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetPrintLevel, .-VfmwProc_SetPrintLevel
	.align	3
.LC84:
	.xword	g_PrintEnable
	.align	3
.LC86:
	.xword	.LC85
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Isr_0
	.type	VCTRL_Isr_0, %function
VCTRL_Isr_0:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	bl	VDMDRV_IsrProcess
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_Isr_0, .-VCTRL_Isr_0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Scd_Isr
	.type	VCTRL_Scd_Isr, %function
VCTRL_Scd_Isr:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	bl	SM_SCDIntServeProc
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_Scd_Isr, .-VCTRL_Scd_Isr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_HandleAllocMemEvent, %function
VCTRL_HandleAllocMemEvent:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, 152
	beq	.L56
	ldr	x3, .LC87
	mov	x5, 152
	ldr	x2, .LC89
	mov	w4, w20
	add	x3, x3, 24
	mov	w1, 717
	mov	w0, 1
	bl	dprint_normal
.L55:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L56:
	ldr	x20, .LC90
	mov	x2, 144
	mov	w1, 0
	add	x0, x29, 48
	ldr	x3, [x20, 96]
	blr	x3
	ldr	x21, .LC92
	ldr	x4, [x20, 136]
	mov	x3, x19
	mov	x2, x21
	mov	x1, 32
	add	x0, x29, 48
	blr	x4
	strb	wzr, [x29, 79]
	ldp	w4, w3, [x19, 48]
	ldr	w2, [x19, 56]
	ldr	x1, [x19, 64]
	ldrsb	w0, [x19, 80]
	str	w2, [x29, 92]
	stp	wzr, w4, [x29, 104]
	str	w3, [x29, 112]
	str	x1, [x29, 184]
	cbnz	w0, .L65
.L58:
	ldr	w1, [x19, 32]
	add	x2, x29, 48
	mov	w0, 0
	cmp	w1, 1
	cset	w1, eq
	bl	VMM_SendCommand
	cbz	w0, .L55
	ldr	x3, .LC87
	add	x4, x29, 48
	ldr	w5, [x29, 92]
	mov	w1, 752
	ldr	x2, .LC94
	add	x3, x3, 24
	mov	w0, 1
	bl	dprint_normal
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L65:
	mov	w0, 1
	ldr	x4, [x20, 136]
	strb	w0, [x29, 120]
	mov	x2, x21
	mov	x1, 32
	add	x3, x19, 88
	add	x0, x29, 128
	blr	x4
	strb	wzr, [x29, 159]
	ldp	w1, w0, [x19, 136]
	ldr	w2, [x19, 144]
	stp	w2, w1, [x29, 172]
	str	w0, [x29, 180]
	b	.L58
	.size	VCTRL_HandleAllocMemEvent, .-VCTRL_HandleAllocMemEvent
	.align	3
.LC87:
	.xword	.LANCHOR2
	.align	3
.LC89:
	.xword	.LC88
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
	.type	VCTRL_HandleReleaseMemEvent, %function
VCTRL_HandleReleaseMemEvent:
	stp	x29, x30, [sp, -176]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, 152
	beq	.L67
	ldr	x3, .LC95
	mov	x5, 152
	ldr	x2, .LC96
	mov	w4, w20
	add	x3, x3, 56
	mov	w1, 766
	mov	w0, 1
	bl	dprint_normal
.L66:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L67:
	ldr	x20, .LC97
	mov	x2, 144
	mov	w1, 0
	add	x0, x29, 32
	ldr	x3, [x20, 96]
	blr	x3
	mov	x1, 32
	ldr	x2, .LC98
	ldr	x4, [x20, 136]
	mov	x3, x19
	add	x0, x29, x1
	blr	x4
	strb	wzr, [x29, 63]
	ldp	w7, w6, [x19, 48]
	ldr	x3, [x19, 40]
	add	x2, x29, 32
	ldr	w8, [x19, 32]
	mov	w1, 0
	ldr	w5, [x19, 56]
	mov	w0, 1
	ldr	x4, [x19, 64]
	str	x3, [x29, 64]
	mov	w3, 2
	stp	w8, w5, [x29, 72]
	stp	wzr, w7, [x29, 88]
	str	w6, [x29, 96]
	str	x4, [x29, 168]
	str	w3, [x29, 100]
	bl	VMM_SendCommand
	cbz	w0, .L66
	ldr	x3, .LC95
	add	x4, x29, 32
	ldr	w5, [x29, 72]
	mov	w1, 795
	ldr	x2, .LC100
	add	x3, x3, 56
	mov	w0, 1
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 176
	ret
	.size	VCTRL_HandleReleaseMemEvent, .-VCTRL_HandleReleaseMemEvent
	.align	3
.LC95:
	.xword	.LANCHOR2
	.align	3
.LC96:
	.xword	.LC88
	.align	3
.LC97:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC98:
	.xword	.LC91
	.align	3
.LC100:
	.xword	.LC99
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_HandleAllocPreProcessEvent, %function
VCTRL_HandleAllocPreProcessEvent:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	str	xzr, [x29, 184]
	add	x0, x29, 40
	cmp	w19, 16
	stp	xzr, xzr, [x0]
	add	x0, x29, 56
	stp	xzr, xzr, [x0]
	add	x0, x29, 72
	stp	xzr, xzr, [x0]
	add	x0, x29, 88
	stp	xzr, xzr, [x0]
	add	x0, x29, 104
	stp	xzr, xzr, [x0]
	add	x0, x29, 120
	stp	xzr, xzr, [x0]
	add	x0, x29, 136
	stp	xzr, xzr, [x0]
	add	x0, x29, 152
	stp	xzr, xzr, [x0]
	add	x0, x29, 168
	stp	xzr, xzr, [x0]
	bne	.L81
	ldr	x3, [x20]
	cmp	w3, 3
	bhi	.L82
	ldr	x1, [x20, 8]
	cbz	x1, .L83
	ldr	x4, .LC109
	mov	w19, 1
	ldr	x0, .LC110
	mov	x2, 28
	add	x4, x4, 64
	str	w19, [x29, 40]
	ldr	x5, [x0, 104]
	add	x0, x29, 64
	ldr	x3, [x4, w3, sxtw 3]
	add	x4, x3, 24576
	ldr	x3, [x3, 26904]
	str	x3, [x29, 56]
	ldr	w3, [x4, 2320]
	str	w3, [x29, 48]
	blr	x5
	add	x1, x29, 40
	mov	w0, 10
	bl	VMM_SendCommandBlock
	cbnz	w0, .L84
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L81:
	ldr	x3, .LC101
	mov	w4, w19
	ldr	x2, .LC102
	mov	x5, 16
	add	x3, x3, 88
	mov	w1, 866
	mov	w0, 1
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L82:
	ldr	x3, .LC101
	mov	w4, 873
	ldr	x5, .LC104
.L80:
	ldr	x2, .LC106
	add	x3, x3, 88
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L84:
	ldr	x3, .LC101
	mov	w1, 886
	ldr	w4, [x29, 40]
	mov	w0, w19
	ldr	x2, .LC112
	add	x3, x3, 88
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L83:
	ldr	x3, .LC101
	mov	w4, 874
	ldr	x5, .LC108
	b	.L80
	.size	VCTRL_HandleAllocPreProcessEvent, .-VCTRL_HandleAllocPreProcessEvent
	.align	3
.LC101:
	.xword	.LANCHOR2
	.align	3
.LC102:
	.xword	.LC88
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
.LC109:
	.xword	.LANCHOR0
	.align	3
.LC110:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC112:
	.xword	.LC111
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_EventReport
	.type	VCTRL_EventReport, %function
VCTRL_EventReport:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	x22, x2
	mov	w21, w3
	bl	_mcount
	cmp	w19, 3
	bhi	.L115
	ldr	x2, .LC118
	add	x0, x2, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L116
	sub	w5, w20, #61
	cmp	w5, 4
	bls	.L117
	ldr	w4, [x0, 144]
	cbz	w4, .L102
	cmp	w4, 1
	bne	.L118
	ldr	x3, [x2, 288]
	cbz	x3, .L119
.L105:
	mov	x2, x22
	mov	w1, w20
	mov	w0, w19
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L117:
	ldr	x0, .LC121
	ldrb	w0, [x0,w5,uxtw]
	adr	x1, .Lrtx91
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx91:
	.section	.rodata
	.align	0
	.align	2
.L91:
	.byte	(.L90 - .Lrtx91) / 4
	.byte	(.L92 - .Lrtx91) / 4
	.byte	(.L93 - .Lrtx91) / 4
	.byte	(.L94 - .Lrtx91) / 4
	.byte	(.L95 - .Lrtx91) / 4
	.text
	.p2align 3
.L118:
	ldr	x3, .LC116
	mov	w5, w21
	ldr	x2, .LC132
	mov	w1, 968
	add	x3, x3, 128
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
.L112:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L102:
	ldr	x3, [x2, 280]
	cbnz	x3, .L105
	ldr	x2, .LC128
	mov	w1, 946
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L112
	.p2align 3
.L94:
	add	x0, x29, 56
	cmp	w21, 16
	str	xzr, [x29, 72]
	stp	xzr, xzr, [x0]
	beq	.L99
	ldr	x3, .LC116
	mov	x5, 16
	ldr	x2, .LC122
	mov	w4, w21
	add	x3, x3, 192
	mov	w1, 836
	mov	w0, 1
	bl	dprint_normal
.L96:
	mov	w0, 0
.L120:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L93:
	add	x0, x29, 56
	cmp	w21, 16
	stp	xzr, xzr, [x0]
	beq	.L97
	ldr	x3, .LC116
	mov	x5, 16
	ldr	x2, .LC122
	mov	w4, w21
	add	x3, x3, 152
	mov	w1, 809
	mov	w0, 1
	bl	dprint_normal
	mov	w0, 0
	b	.L120
	.p2align 3
.L92:
	mov	x0, x22
	mov	w1, w21
	bl	VCTRL_HandleReleaseMemEvent
	mov	w0, 0
	b	.L120
	.p2align 3
.L90:
	mov	x0, x22
	mov	w1, w21
	bl	VCTRL_HandleAllocMemEvent
	mov	w0, 0
	b	.L120
	.p2align 3
.L95:
	mov	x0, x22
	mov	w1, w21
	bl	VCTRL_HandleAllocPreProcessEvent
	mov	w0, 0
	b	.L120
	.p2align 3
.L99:
	ldp	x3, x2, [x22]
	add	x1, x29, 56
	mov	w0, 9
	stp	x3, x2, [x29, 64]
	bl	VMM_SendCommandBlock
	cbz	w0, .L96
	ldr	x3, .LC116
	mov	w1, 850
	ldr	x2, .LC126
	mov	w0, 1
	ldr	w4, [x29, 56]
	add	x3, x3, 192
	bl	dprint_normal
	mov	w0, 0
	b	.L120
	.p2align 3
.L97:
	ldp	x4, x3, [x22]
	add	x2, x29, 56
	mov	w1, 0
	mov	w0, 2
	stp	x4, x3, [x29, 56]
	bl	VMM_SendCommand
	cbz	w0, .L96
	ldr	x3, .LC116
	mov	w1, 822
	ldr	x2, .LC124
	mov	w0, 1
	add	x3, x3, 152
	bl	dprint_normal
	mov	w0, 0
	b	.L120
	.p2align 3
.L115:
	ldr	x3, .LC116
	mov	w4, 929
	ldr	x5, .LC115
	mov	w1, w4
	ldr	x2, .LC117
	add	x3, x3, 128
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L112
.L116:
	ldr	x3, .LC116
	mov	w4, 930
	ldr	x5, .LC120
	mov	w1, w4
	ldr	x2, .LC117
	add	x3, x3, 128
	bl	dprint_normal
	mov	w0, -1
	b	.L112
.L119:
	ldr	x2, .LC130
	mov	w1, 958
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L112
	.size	VCTRL_EventReport, .-VCTRL_EventReport
	.align	3
.LC115:
	.xword	.LC114
	.align	3
.LC116:
	.xword	.LANCHOR2
	.align	3
.LC117:
	.xword	.LC105
	.align	3
.LC118:
	.xword	.LANCHOR0
	.align	3
.LC120:
	.xword	.LC119
	.align	3
.LC121:
	.xword	.L91
	.align	3
.LC122:
	.xword	.LC88
	.align	3
.LC124:
	.xword	.LC123
	.align	3
.LC126:
	.xword	.LC125
	.align	3
.LC128:
	.xword	.LC127
	.align	3
.LC130:
	.xword	.LC129
	.align	3
.LC132:
	.xword	.LC131
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SaveReorderMetadata, %function
VfmwProc_SaveReorderMetadata:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	cmp	w19, 3
	bhi	.L121
	ldr	x21, .LC134
	add	x20, x21, 312
	ldr	x0, [x20, w19, uxtw 3]
	cbz	x0, .L126
	ldr	x2, .LC142
	mov	w1, 5632
	mov	w0, 32
	bl	dprint_normal
	ldr	x1, .LC135
	ldr	x0, [x20, w19, uxtw 3]
	ldr	x1, [x1, 72]
	blr	x1
	str	xzr, [x20, w19, uxtw 3]
.L121:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L126:
	ldr	x22, .LC135
	mov	w0, 25
	ldr	x23, [x22, 136]
	bl	VFMW_GetString
	ldr	w1, [x21, 344]
	mov	x2, x0
	ldr	x3, .LC136
	add	x0, x29, 72
	mov	w4, w1
	add	w1, w1, 1
	add	x3, x3, 16
	str	w1, [x21, 344]
	mov	x1, 50
	blr	x23
	strb	wzr, [x29, 121]
	ldr	x3, [x22, 64]
	mov	w2, 0
	mov	w1, 578
	add	x0, x29, 72
	blr	x3
	str	x0, [x20, w19, uxtw 3]
	cbz	x0, .L124
	ldr	x2, .LC138
	mov	w4, w19
	add	x3, x29, 72
	mov	w1, 5623
	mov	w0, 32
	bl	dprint_normal
	b	.L121
	.p2align 3
.L124:
	ldr	x2, .LC140
	add	x3, x29, 72
	mov	w1, 5627
	mov	w0, 32
	bl	dprint_normal
	b	.L121
	.size	VfmwProc_SaveReorderMetadata, .-VfmwProc_SaveReorderMetadata
	.align	3
.LC134:
	.xword	.LANCHOR0
	.align	3
.LC135:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC136:
	.xword	.LANCHOR1
	.align	3
.LC138:
	.xword	.LC137
	.align	3
.LC140:
	.xword	.LC139
	.align	3
.LC142:
	.xword	.LC141
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SaveMetadata, %function
VfmwProc_SaveMetadata:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	cmp	w19, 3
	bhi	.L127
	ldr	x21, .LC144
	add	x20, x21, 352
	ldr	x0, [x20, w19, uxtw 3]
	cbz	x0, .L132
	ldr	x2, .LC151
	mov	w1, 5595
	mov	w0, 32
	bl	dprint_normal
	ldr	x1, .LC145
	ldr	x0, [x20, w19, uxtw 3]
	ldr	x1, [x1, 72]
	blr	x1
	str	xzr, [x20, w19, uxtw 3]
.L127:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L132:
	ldr	x22, .LC145
	mov	w0, 24
	ldr	x23, [x22, 136]
	bl	VFMW_GetString
	ldr	w1, [x21, 384]
	mov	x2, x0
	ldr	x3, .LC146
	add	x0, x29, 72
	mov	w4, w1
	add	w1, w1, 1
	add	x3, x3, 16
	str	w1, [x21, 384]
	mov	x1, 50
	blr	x23
	strb	wzr, [x29, 121]
	ldr	x3, [x22, 64]
	mov	w2, 0
	mov	w1, 578
	add	x0, x29, 72
	blr	x3
	str	x0, [x20, w19, uxtw 3]
	cbz	x0, .L130
	ldr	x2, .LC148
	mov	w4, w19
	add	x3, x29, 72
	mov	w1, 5586
	mov	w0, 32
	bl	dprint_normal
	b	.L127
	.p2align 3
.L130:
	ldr	x2, .LC150
	add	x3, x29, 72
	mov	w1, 5590
	mov	w0, 32
	bl	dprint_normal
	b	.L127
	.size	VfmwProc_SaveMetadata, .-VfmwProc_SaveMetadata
	.align	3
.LC144:
	.xword	.LANCHOR0
	.align	3
.LC145:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC146:
	.xword	.LANCHOR1
	.align	3
.LC148:
	.xword	.LC147
	.align	3
.LC150:
	.xword	.LC149
	.align	3
.LC151:
	.xword	.LC141
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SaveSeg, %function
VfmwProc_SaveSeg:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	cmp	w19, 3
	bhi	.L133
	ldr	x21, .LC153
	add	x20, x21, 392
	ldr	x0, [x20, w19, uxtw 3]
	cbz	x0, .L138
	ldr	x2, .LC161
	mov	w1, 5486
	mov	w0, 32
	bl	dprint_normal
	ldr	x1, .LC154
	ldr	x0, [x20, w19, uxtw 3]
	ldr	x1, [x1, 72]
	blr	x1
	str	xzr, [x20, w19, uxtw 3]
.L133:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L138:
	ldr	x22, .LC154
	mov	w0, 21
	ldr	x23, [x22, 136]
	bl	VFMW_GetString
	ldr	w1, [x21, 424]
	mov	x2, x0
	ldr	x3, .LC155
	add	x0, x29, 72
	mov	w4, w1
	add	w1, w1, 1
	add	x3, x3, 16
	str	w1, [x21, 424]
	mov	x1, 50
	blr	x23
	strb	wzr, [x29, 121]
	ldr	x3, [x22, 64]
	mov	w2, 0
	mov	w1, 578
	add	x0, x29, 72
	blr	x3
	str	x0, [x20, w19, uxtw 3]
	cbz	x0, .L136
	ldr	x2, .LC157
	mov	w4, w19
	add	x3, x29, 72
	mov	w1, 5477
	mov	w0, 32
	bl	dprint_normal
	b	.L133
	.p2align 3
.L136:
	ldr	x2, .LC159
	add	x3, x29, 72
	mov	w1, 5481
	mov	w0, 32
	bl	dprint_normal
	b	.L133
	.size	VfmwProc_SaveSeg, .-VfmwProc_SaveSeg
	.align	3
.LC153:
	.xword	.LANCHOR0
	.align	3
.LC154:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC155:
	.xword	.LANCHOR1
	.align	3
.LC157:
	.xword	.LC156
	.align	3
.LC159:
	.xword	.LC158
	.align	3
.LC161:
	.xword	.LC160
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SaveRaw, %function
VfmwProc_SaveRaw:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	cmp	w19, 3
	bhi	.L139
	ldr	x21, .LC163
	add	x20, x21, 432
	ldr	x0, [x20, w19, uxtw 3]
	cbz	x0, .L144
	ldr	x2, .LC171
	mov	w1, 5449
	mov	w0, 32
	bl	dprint_normal
	ldr	x1, .LC164
	ldr	x0, [x20, w19, uxtw 3]
	ldr	x1, [x1, 72]
	blr	x1
	str	xzr, [x20, w19, uxtw 3]
.L139:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L144:
	ldr	x22, .LC164
	mov	w0, 20
	ldr	x23, [x22, 136]
	bl	VFMW_GetString
	ldr	w1, [x21, 464]
	mov	x2, x0
	ldr	x3, .LC165
	add	x0, x29, 72
	mov	w4, w1
	add	w1, w1, 1
	add	x3, x3, 16
	str	w1, [x21, 464]
	mov	x1, 50
	blr	x23
	strb	wzr, [x29, 121]
	ldr	x3, [x22, 64]
	mov	w2, 0
	mov	w1, 578
	add	x0, x29, 72
	blr	x3
	str	x0, [x20, w19, uxtw 3]
	cbz	x0, .L142
	ldr	x2, .LC167
	mov	w4, w19
	add	x3, x29, 72
	mov	w1, 5440
	mov	w0, 32
	bl	dprint_normal
	b	.L139
	.p2align 3
.L142:
	ldr	x2, .LC169
	add	x3, x29, 72
	mov	w1, 5444
	mov	w0, 32
	bl	dprint_normal
	b	.L139
	.size	VfmwProc_SaveRaw, .-VfmwProc_SaveRaw
	.align	3
.LC163:
	.xword	.LANCHOR0
	.align	3
.LC164:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC165:
	.xword	.LANCHOR1
	.align	3
.LC167:
	.xword	.LC166
	.align	3
.LC169:
	.xword	.LC168
	.align	3
.LC171:
	.xword	.LC170
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SaveDispYUV, %function
VfmwProc_SaveDispYUV:
	stp	x29, x30, [sp, -176]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	cmp	w19, 3
	bls	.L154
.L145:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L154:
	mov	w0, 22
	bl	VFMW_GetString
	ldr	x20, .LC173
	ldr	x22, .LC174
	add	x21, x20, 472
	ldr	x1, [x21, w19, uxtw 3]
	cbz	x1, .L147
	mov	x0, x1
	ldr	x1, [x22, 72]
	add	x20, x20, 504
	blr	x1
	str	xzr, [x21, w19, uxtw 3]
	ldr	w0, [x20, 16]
	cbz	w0, .L148
	ldr	x1, [x20, 8]
	bl	MEM_ReleaseMemBlock
	ldr	x3, [x22, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x20
	blr	x3
.L148:
	ldr	x2, .LC176
	mov	w1, 5522
	mov	w0, 32
	bl	dprint_normal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L147:
	ldr	w1, [x20, 536]
	mov	x2, x0
	ldr	x3, .LC177
	add	x0, x29, 72
	mov	w4, w1
	ldr	x5, [x22, 136]
	add	w1, w1, 1
	add	x3, x3, 16
	str	w1, [x20, 536]
	mov	x1, 100
	blr	x5
	strb	wzr, [x29, 171]
	ldr	x3, [x22, 64]
	mov	w2, 0
	mov	w1, 578
	add	x0, x29, 72
	blr	x3
	str	x0, [x21, w19, uxtw 3]
	cbz	x0, .L155
	ldr	x3, [x22, 96]
	add	x23, x20, 504
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	str	wzr, [x20, 532]
	mov	w0, 19
	bl	VFMW_GetString
	mov	w2, 24576
	mov	w4, 0
	mov	x3, x23
	movk	w2, 0x9f, lsl 16
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L156
	ldr	x2, .LC183
	mov	w4, w19
	add	x3, x29, 72
	mov	w1, 5556
	mov	w0, 32
	str	wzr, [x20, 540]
	bl	dprint_normal
	b	.L145
	.p2align 3
.L156:
	ldr	x0, [x21, w19, uxtw 3]
	ldr	x1, [x22, 72]
	blr	x1
	str	xzr, [x21, w19, uxtw 3]
	mov	w3, 24576
	ldr	x2, .LC181
	movk	w3, 0x9f, lsl 16
	mov	w1, 5551
	mov	w0, 1
	bl	dprint_normal
	b	.L145
.L155:
	ldr	x2, .LC179
	add	x3, x29, 72
	mov	w1, 5533
	mov	w0, 32
	bl	dprint_normal
	b	.L145
	.size	VfmwProc_SaveDispYUV, .-VfmwProc_SaveDispYUV
	.align	3
.LC173:
	.xword	.LANCHOR0
	.align	3
.LC174:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC176:
	.xword	.LC175
	.align	3
.LC177:
	.xword	.LANCHOR1
	.align	3
.LC179:
	.xword	.LC178
	.align	3
.LC181:
	.xword	.LC180
	.align	3
.LC183:
	.xword	.LC182
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetScdPrint, %function
VfmwProc_SetScdPrint:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC186
	ldr	w0, [x20]
	mov	w2, 2097152
	mov	w1, 1
	ldr	w20, [x19]
	str	w2, [x19]
	bl	PrintScdRawState
	str	w20, [x19]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetScdPrint, .-VfmwProc_SetScdPrint
	.align	3
.LC186:
	.xword	g_PrintEnable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_PrintTracer, %function
VfmwProc_PrintTracer:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC188
	mov	w1, 5398
	mov	w0, 32
	bl	dprint_normal
	bl	DBG_PrintTracer
	ldp	x29, x30, [sp], 16
	ret
	.size	VfmwProc_PrintTracer, .-VfmwProc_PrintTracer
	.align	3
.LC188:
	.xword	.LC187
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetSedOnlyEnable, %function
VfmwProc_SetSedOnlyEnable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	ldr	x3, .LC189
	cbz	w0, .L162
	ldr	x2, .LC193
	mov	w4, 1
	mov	w1, 5930
	mov	w0, 32
	str	w4, [x3, 84]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L162:
	ldr	x2, .LC191
	mov	w1, 5925
	mov	w0, 32
	str	wzr, [x3, 84]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetSedOnlyEnable, .-VfmwProc_SetSedOnlyEnable
	.align	3
.LC189:
	.xword	.LANCHOR1
	.align	3
.LC191:
	.xword	.LC190
	.align	3
.LC193:
	.xword	.LC192
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_CloseModuleLowly, %function
VfmwProc_CloseModuleLowly:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	cmp	w4, 3
	bhi	.L166
	ldr	x5, .LC196
	mov	w3, w4
	ldr	x2, .LC198
	mov	w1, 5901
	add	x5, x5, 64
	mov	w0, 32
	ldr	x4, [x5, w4, uxtw 3]
	add	x4, x4, 217088
	str	wzr, [x4, 3932]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L166:
	ldr	x2, .LC195
	mov	w1, 5896
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_CloseModuleLowly, .-VfmwProc_CloseModuleLowly
	.align	3
.LC195:
	.xword	.LC194
	.align	3
.LC196:
	.xword	.LANCHOR0
	.align	3
.LC198:
	.xword	.LC197
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_OpenModuleLowly, %function
VfmwProc_OpenModuleLowly:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	cmp	w4, 3
	bhi	.L170
	ldr	x5, .LC201
	mov	w3, w4
	ldr	x2, .LC202
	mov	w6, 1
	add	x5, x5, 64
	mov	w1, 5885
	mov	w0, 32
	ldr	x4, [x5, w4, uxtw 3]
	add	x4, x4, 217088
	str	w6, [x4, 3932]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L170:
	ldr	x2, .LC200
	mov	w1, 5880
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_OpenModuleLowly, .-VfmwProc_OpenModuleLowly
	.align	3
.LC200:
	.xword	.LC194
	.align	3
.LC201:
	.xword	.LANCHOR0
	.align	3
.LC202:
	.xword	.LC197
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_SetLastFrameState.part.19, %function
VCTRL_SetLastFrameState.part.19:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w4, 6193
	ldr	x5, .LC204
	ldr	x3, .LC205
	mov	w1, w4
	ldr	x2, .LC206
	mov	w0, 0
	bl	dprint_normal
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_SetLastFrameState.part.19, .-VCTRL_SetLastFrameState.part.19
	.align	3
.LC204:
	.xword	.LC103
	.align	3
.LC205:
	.xword	.LANCHOR3
	.align	3
.LC206:
	.xword	.LC105
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Suspend
	.type	VCTRL_Suspend, %function
VCTRL_Suspend:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC207
	ldr	x0, [x21]
	blr	x0
	ldr	x25, .LC208
	mov	w23, w0
	ldr	x1, [x25]
	cbz	x1, .L173
	mov	w0, 0
	blr	x1
.L175:
	mov	w0, 0
	mov	w20, 32
	mov	w24, 0
	mov	w19, 0
	bl	SCDDRV_PrepareSleep
	mov	w0, 0
	bl	VDMDRV_PrepareSleep
	ldr	x0, [x21]
	blr	x0
	mov	w26, w0
	b	.L174
	.p2align 3
.L176:
	bl	VDMDRV_GetSleepStage
	cmp	w0, 2
	mov	w19, 1
	mov	w22, w19
	beq	.L179
.L210:
	tst	w24, w22
	mov	w0, 10
	bne	.L179
	subs	w20, w20, #1
	beq	.L211
	ldr	x1, [x21, 240]
	blr	x1
	cmp	w19, 1
	ccmp	w24, 1, 0, eq
	beq	.L179
.L174:
	mov	w0, 0
	bl	SCDDRV_GetSleepStage
	cmp	w0, 2
	mov	w0, 0
	beq	.L176
	bl	VDMDRV_GetSleepStage
	cmp	w0, 2
	mov	w22, w19
	bne	.L210
	mov	w24, 1
	b	.L210
	.p2align 3
.L211:
	ldr	x0, [x21]
	blr	x0
	cmp	w26, w0
	sub	w3, w0, w26
	bls	.L182
	mvn	w26, w26
	add	w3, w26, w0
.L182:
	ldr	x2, .LC212
	mov	w5, w24
	mov	w4, w19
	mov	w1, 270
	mov	w0, 0
	bl	dprint_normal
	cbnz	w19, .L197
	ldr	x2, .LC217
	mov	w3, 0
	mov	w1, 276
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	bl	SCDDRV_ForceSleep
.L197:
	cbnz	w24, .L179
	ldr	x2, .LC219
	mov	w3, 0
	mov	w1, 285
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	bl	VDMDRV_ForceSleep
.L179:
	ldr	x1, [x25, 64]
	cbz	x1, .L186
	mov	w0, 0
	blr	x1
.L186:
	ldr	x1, [x25, 48]
	cbz	x1, .L212
	mov	w0, 0
	blr	x1
	ldr	x1, [x25, 16]
	cbz	x1, .L213
.L189:
	mov	w0, 0
	blr	x1
.L190:
	ldr	x20, .LC213
	ldr	w1, [x20, 96]
	cmp	w1, 1
	bne	.L191
	ldr	w1, [x20, 100]
	mov	w2, 2
	str	w2, [x20, 104]
	cmp	w1, 1
	beq	.L193
	ldr	x1, [x21, 240]
	mov	w0, 10
	mov	w19, 49
	blr	x1
	b	.L194
	.p2align 3
.L214:
	ldr	x1, [x21, 240]
	blr	x1
	subs	w19, w19, #1
	beq	.L193
.L194:
	ldr	w1, [x20, 100]
	mov	w0, 10
	cmp	w1, 1
	bne	.L214
.L193:
	str	wzr, [x20, 104]
.L191:
	ldr	x0, [x21]
	blr	x0
	cmp	w23, w0
	sub	w3, w0, w23
	bls	.L196
	mvn	w23, w23
	add	w3, w23, w0
.L196:
	ldr	x2, .LC215
	mov	w1, 363
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L212:
	mov	w3, 320
	ldr	x2, .LC210
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldr	x1, [x25, 16]
	cbnz	x1, .L189
	.p2align 2
.L213:
	mov	w3, 325
	ldr	x2, .LC210
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L190
	.p2align 3
.L173:
	mov	w3, 343
	ldr	x2, .LC210
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L175
	.size	VCTRL_Suspend, .-VCTRL_Suspend
	.align	3
.LC207:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC208:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC210:
	.xword	.LC209
	.align	3
.LC212:
	.xword	.LC211
	.align	3
.LC213:
	.xword	.LANCHOR0
	.align	3
.LC215:
	.xword	.LC214
	.align	3
.LC217:
	.xword	.LC216
	.align	3
.LC219:
	.xword	.LC218
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_TestSuspend, %function
VfmwProc_TestSuspend:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC222
	mov	x3, x19
	mov	w1, 5747
	mov	w0, 20
	bl	dprint_normal
	bl	VCTRL_Suspend
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestSuspend, .-VfmwProc_TestSuspend
	.align	3
.LC222:
	.xword	.LC221
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Resume
	.type	VCTRL_Resume, %function
VCTRL_Resume:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC223
	ldr	x0, [x21]
	blr	x0
	ldr	x19, .LC224
	mov	w22, w0
	ldr	x1, [x19, 8]
	cbz	x1, .L236
	mov	w0, 0
	blr	x1
	ldr	x1, [x19, 40]
	cbz	x1, .L237
.L219:
	mov	w0, 0
	blr	x1
.L220:
	ldr	x1, [x19, 56]
	cbz	x1, .L221
	mov	w0, 0
	blr	x1
.L221:
	mov	w0, 0
	bl	SCDDRV_ExitSleep
	mov	w0, 0
	bl	VDMDRV_ExitSleep
	ldr	x20, .LC226
	ldr	w0, [x20, 96]
	cmp	w0, 1
	bne	.L222
	ldr	w2, [x20, 100]
	str	w0, [x20, 104]
	cmp	w2, 2
	beq	.L224
	ldr	x1, [x21, 240]
	mov	w0, 10
	mov	w19, 49
	blr	x1
	b	.L225
	.p2align 3
.L238:
	ldr	x1, [x21, 240]
	blr	x1
	subs	w19, w19, #1
	beq	.L224
.L225:
	ldr	w1, [x20, 100]
	mov	w0, 10
	cmp	w1, 2
	bne	.L238
.L224:
	str	wzr, [x20, 104]
.L222:
	ldr	x0, [x21]
	blr	x0
	cmp	w22, w0
	sub	w3, w0, w22
	bls	.L227
	mvn	w3, w22
	add	w3, w3, w0
.L227:
	ldr	x2, .LC228
	mov	w1, 426
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L236:
	mov	w3, 383
	ldr	x2, .LC225
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldr	x1, [x19, 40]
	cbnz	x1, .L219
	.p2align 2
.L237:
	mov	w3, 388
	ldr	x2, .LC225
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L220
	.size	VCTRL_Resume, .-VCTRL_Resume
	.align	3
.LC223:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC224:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC225:
	.xword	.LC209
	.align	3
.LC226:
	.xword	.LANCHOR0
	.align	3
.LC228:
	.xword	.LC227
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_TestResume, %function
VfmwProc_TestResume:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC230
	mov	x3, x19
	mov	w1, 5756
	mov	w0, 20
	bl	dprint_normal
	bl	VCTRL_Resume
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestResume, .-VfmwProc_TestResume
	.align	3
.LC230:
	.xword	.LC221
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_RecordData
	.type	VCTRL_RecordData, %function
VCTRL_RecordData:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	uxtw	x19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 1
	bhi	.L245
	ldr	x3, .LC234
	ldrb	w0, [x3, x19]
	cmp	w0, 14
	bhi	.L244
	add	w4, w0, 1
	uxtb	w4, w4
.L243:
	lsl	x2, x19, 4
	ldr	x1, .LC235
	sub	x2, x2, x19
	strb	w4, [x3, x19]
	add	x0, x2, x0, sxtw
	str	w20, [x1, x0, lsl 2]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L244:
	mov	w4, 1
	mov	w0, 0
	b	.L243
	.p2align 3
.L245:
	ldr	x3, .LC231
	mov	w4, 565
	ldr	x2, .LC233
	mov	w5, w19
	add	x3, x3, 24
	mov	w1, w4
	mov	w0, 32
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_RecordData, .-VCTRL_RecordData
	.align	3
.LC231:
	.xword	.LANCHOR3
	.align	3
.LC233:
	.xword	.LC232
	.align	3
.LC234:
	.xword	g_DataRecId
	.align	3
.LC235:
	.xword	g_DataTable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_MMU_ISR
	.type	VCTRL_MMU_ISR, %function
VCTRL_MMU_ISR:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	bl	VDMDRV_MMUIntServeProc
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_MMU_ISR, .-VCTRL_MMU_ISR
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_InformVdmFree
	.type	VCTRL_InformVdmFree, %function
VCTRL_InformVdmFree:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC236
	mov	w0, 0
	ldr	x1, [x1, 256]
	blr	x1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_InformVdmFree, .-VCTRL_InformVdmFree
	.align	3
.LC236:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ExtraWakeUpThread
	.type	VCTRL_ExtraWakeUpThread, %function
VCTRL_ExtraWakeUpThread:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC237
	mov	w0, 0
	ldr	x1, [x1, 256]
	blr	x1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_ExtraWakeUpThread, .-VCTRL_ExtraWakeUpThread
	.align	3
.LC237:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetCallBack
	.type	VCTRL_SetCallBack, %function
VCTRL_SetCallBack:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L257
	cbz	w19, .L253
	cmp	w19, 1
	beq	.L254
	ldr	x3, .LC240
	mov	w4, w19
	ldr	x2, .LC244
	mov	w1, 991
	add	x3, x3, 48
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
.L251:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L254:
	ldr	x1, .LC242
	mov	w0, 0
	str	x20, [x1, 288]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L253:
	ldr	x1, .LC242
	mov	w0, 0
	str	x20, [x1, 280]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L257:
	ldr	x3, .LC240
	mov	w4, 978
	ldr	x5, .LC239
	mov	w1, w4
	ldr	x2, .LC241
	add	x3, x3, 48
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L251
	.size	VCTRL_SetCallBack, .-VCTRL_SetCallBack
	.align	3
.LC239:
	.xword	.LC238
	.align	3
.LC240:
	.xword	.LANCHOR3
	.align	3
.LC241:
	.xword	.LC105
	.align	3
.LC242:
	.xword	.LANCHOR0
	.align	3
.LC244:
	.xword	.LC243
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_InitChanCtx
	.type	VCTRL_InitChanCtx, %function
VCTRL_InitChanCtx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC246
	ldr	x0, .LC245
	mov	x2, 48
	mov	w1, 0
	ldr	x3, [x0, 96]
	mov	x0, x19
	blr	x3
	mov	w0, -1
	stp	w0, w0, [x19, 16]
	stp	w0, w0, [x19, 24]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_InitChanCtx, .-VCTRL_InitChanCtx
	.align	3
.LC245:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC246:
	.xword	g_ChanCtx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetStreamInterface
	.type	VCTRL_SetStreamInterface, %function
VCTRL_SetStreamInterface:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L265
	ldr	x0, .LC250
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L266
	cbz	x20, .L267
	ldr	x3, .LC254
	add	x0, x0, 24576
	mov	x2, 24
	mov	x1, x20
	add	x0, x0, 2264
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L261:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L265:
	ldr	x3, .LC248
	mov	w4, 1154
	ldr	x5, .LC247
.L264:
	ldr	x2, .LC249
	add	x3, x3, 72
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L261
.L267:
	ldr	x3, .LC248
	mov	w4, 1156
	ldr	x5, .LC253
	b	.L264
.L266:
	ldr	x3, .LC248
	mov	w4, 1155
	ldr	x5, .LC251
	mov	w1, w4
	ldr	x2, .LC249
	add	x3, x3, 72
	bl	dprint_normal
	mov	w0, -1
	b	.L261
	.size	VCTRL_SetStreamInterface, .-VCTRL_SetStreamInterface
	.align	3
.LC247:
	.xword	.LC103
	.align	3
.LC248:
	.xword	.LANCHOR3
	.align	3
.LC249:
	.xword	.LC105
	.align	3
.LC250:
	.xword	.LANCHOR0
	.align	3
.LC251:
	.xword	.LC119
	.align	3
.LC253:
	.xword	.LC252
	.align	3
.LC254:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetStreamInterface
	.type	VCTRL_GetStreamInterface, %function
VCTRL_GetStreamInterface:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L271
	ldr	x0, .LC256
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L271
	add	x0, x0, 24576
	ldr	x19, [sp, 16]
	add	x0, x0, 2264
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L271:
	mov	x0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetStreamInterface, .-VCTRL_GetStreamInterface
	.align	3
.LC256:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetDeiMemQueryInterface
	.type	VCTRL_SetDeiMemQueryInterface, %function
VCTRL_SetDeiMemQueryInterface:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L278
	ldr	x0, .LC261
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L279
	cbz	x20, .L280
	ldr	x3, .LC265
	add	x0, x0, 24576
	mov	x2, 16
	mov	x1, x20
	add	x0, x0, 2320
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L274:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L278:
	ldr	x3, .LC259
	mov	w4, 1176
	ldr	x5, .LC258
.L277:
	ldr	x2, .LC260
	add	x3, x3, 104
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L274
.L280:
	ldr	x3, .LC259
	mov	w4, 1178
	ldr	x5, .LC264
	b	.L277
.L279:
	ldr	x3, .LC259
	mov	w4, 1177
	ldr	x5, .LC262
	mov	w1, w4
	ldr	x2, .LC260
	add	x3, x3, 104
	bl	dprint_normal
	mov	w0, -1
	b	.L274
	.size	VCTRL_SetDeiMemQueryInterface, .-VCTRL_SetDeiMemQueryInterface
	.align	3
.LC258:
	.xword	.LC103
	.align	3
.LC259:
	.xword	.LANCHOR3
	.align	3
.LC260:
	.xword	.LC105
	.align	3
.LC261:
	.xword	.LANCHOR0
	.align	3
.LC262:
	.xword	.LC119
	.align	3
.LC264:
	.xword	.LC263
	.align	3
.LC265:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanMemInfo
	.type	VCTRL_GetChanMemInfo, %function
VCTRL_GetChanMemInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	mov	x1, x20
	mov	w0, w19
	bl	FSP_GetMemInfo
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetChanMemInfo, .-VCTRL_GetChanMemInfo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetStreamSize
	.type	VCTRL_GetStreamSize, %function
VCTRL_GetStreamSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L288
	ldr	x0, .LC270
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L289
	ldr	w2, [x0, 16]
	cmp	w2, 1
	bne	.L290
	mov	x2, 10648
	mov	x1, x20
	movk	x2, 0x1, lsl 16
	add	x0, x0, x2
	bl	GetSegStreamSize
.L284:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L290:
	ldr	x3, .LC268
	mov	w4, 1197
	ldr	x5, .LC273
.L287:
	ldr	x2, .LC269
	add	x3, x3, 136
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L288:
	ldr	x3, .LC268
	mov	w4, 1195
	ldr	x5, .LC267
	b	.L287
.L289:
	ldr	x3, .LC268
	mov	w4, 1196
	ldr	x5, .LC271
	mov	w1, w4
	ldr	x2, .LC269
	add	x3, x3, 136
	bl	dprint_normal
	mov	w0, -1
	b	.L284
	.size	VCTRL_GetStreamSize, .-VCTRL_GetStreamSize
	.align	3
.LC267:
	.xword	.LC103
	.align	3
.LC268:
	.xword	.LANCHOR3
	.align	3
.LC269:
	.xword	.LC105
	.align	3
.LC270:
	.xword	.LANCHOR0
	.align	3
.LC271:
	.xword	.LC119
	.align	3
.LC273:
	.xword	.LC272
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CheckFreshRaw
	.type	VCTRL_CheckFreshRaw, %function
VCTRL_CheckFreshRaw:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	stp	wzr, wzr, [x29, 40]
	bhi	.L300
	ldr	x0, .LC278
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L301
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L302
	add	x0, x0, 24576
	add	x1, x29, 40
	add	x19, x0, 2432
	mov	x0, x19
	bl	GetRawStreamNum
	cbnz	w0, .L299
	add	x1, x29, 44
	mov	x0, x19
	bl	GetRawStreamSize
	cbnz	w0, .L299
	ldr	x2, .LC283
	mov	w1, 1218
	ldp	w3, w4, [x29, 40]
	mov	w0, 20
	bl	dprint_normal
	ldr	w0, [x29, 40]
	cmp	w0, wzr
	ble	.L299
	ldr	w0, [x29, 44]
	cmp	w0, 3
	csetm	w0, le
.L293:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L302:
	ldr	x3, .LC276
	mov	w4, 1211
	ldr	x5, .LC281
.L298:
	ldr	x2, .LC277
	add	x3, x3, 160
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L299:
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L300:
	ldr	x3, .LC276
	mov	w4, 1209
	ldr	x5, .LC275
	b	.L298
.L301:
	ldr	x3, .LC276
	mov	w4, 1210
	ldr	x5, .LC280
	mov	w1, w4
	ldr	x2, .LC277
	add	x3, x3, 160
	bl	dprint_normal
	mov	w0, -1
	b	.L293
	.size	VCTRL_CheckFreshRaw, .-VCTRL_CheckFreshRaw
	.align	3
.LC275:
	.xword	.LC103
	.align	3
.LC276:
	.xword	.LANCHOR3
	.align	3
.LC277:
	.xword	.LC105
	.align	3
.LC278:
	.xword	.LANCHOR0
	.align	3
.LC280:
	.xword	.LC279
	.align	3
.LC281:
	.xword	.LC272
	.align	3
.LC283:
	.xword	.LC282
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CheckFreshSeg
	.type	VCTRL_CheckFreshSeg, %function
VCTRL_CheckFreshSeg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	stp	wzr, wzr, [x29, 40]
	bhi	.L309
	ldr	x0, .LC288
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L310
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L311
	mov	x3, 10648
	add	x2, x29, 44
	movk	x3, 0x1, lsl 16
	add	x1, x29, 40
	add	x0, x0, x3
	bl	GetFreshSegStream
	ldr	x2, .LC292
	mov	w1, 1241
	ldp	w3, w4, [x29, 40]
	mov	w0, 20
	bl	dprint_normal
	ldr	w0, [x29, 40]
	cmp	w0, wzr
	csetm	w0, le
.L305:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L311:
	ldr	x3, .LC286
	mov	w4, 1236
	ldr	x5, .LC290
.L308:
	ldr	x2, .LC287
	add	x3, x3, 184
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L309:
	ldr	x3, .LC286
	mov	w4, 1234
	ldr	x5, .LC285
	b	.L308
.L310:
	ldr	x3, .LC286
	mov	w4, 1235
	ldr	x5, .LC289
	mov	w1, w4
	ldr	x2, .LC287
	add	x3, x3, 184
	bl	dprint_normal
	mov	w0, -1
	b	.L305
	.size	VCTRL_CheckFreshSeg, .-VCTRL_CheckFreshSeg
	.align	3
.LC285:
	.xword	.LC103
	.align	3
.LC286:
	.xword	.LANCHOR3
	.align	3
.LC287:
	.xword	.LC105
	.align	3
.LC288:
	.xword	.LANCHOR0
	.align	3
.LC289:
	.xword	.LC279
	.align	3
.LC290:
	.xword	.LC272
	.align	3
.LC292:
	.xword	.LC291
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetDiscardPicParam
	.type	VCTRL_SetDiscardPicParam, %function
VCTRL_SetDiscardPicParam:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cmp	w20, 3
	bhi	.L319
	ldr	x19, .LC297
	add	x19, x19, 64
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L320
	cbz	x21, .L321
	ldr	x3, .LC301
	add	x0, x0, 221184
	mov	x1, x21
	mov	x2, 8
	add	x0, x0, 72
	ldr	x3, [x3, 104]
	blr	x3
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	ldr	w1, [x0, 72]
	sub	w1, w1, #1
	cmp	w1, 1
	bls	.L317
	str	wzr, [x0, 72]
	mov	w0, 0
.L314:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L317:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L319:
	ldr	x3, .LC295
	mov	w4, 1253
	ldr	x5, .LC294
.L318:
	ldr	x2, .LC296
	add	x3, x3, 208
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L314
.L321:
	ldr	x3, .LC295
	mov	w4, 1255
	ldr	x5, .LC300
	b	.L318
.L320:
	ldr	x3, .LC295
	mov	w4, 1254
	ldr	x5, .LC298
	mov	w1, w4
	ldr	x2, .LC296
	add	x3, x3, 208
	bl	dprint_normal
	mov	w0, -1
	b	.L314
	.size	VCTRL_SetDiscardPicParam, .-VCTRL_SetDiscardPicParam
	.align	3
.LC294:
	.xword	.LC103
	.align	3
.LC295:
	.xword	.LANCHOR3
	.align	3
.LC296:
	.xword	.LC105
	.align	3
.LC297:
	.xword	.LANCHOR0
	.align	3
.LC298:
	.xword	.LC119
	.align	3
.LC300:
	.xword	.LC299
	.align	3
.LC301:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_UnInstallChan
	.type	VCTRL_UnInstallChan, %function
VCTRL_UnInstallChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, w19
	bl	FSP_DisableInstance
	mov	w0, w19
	bl	CloseUsdPool_WithMem
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_UnInstallChan, .-VCTRL_UnInstallChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_FreeChanResource
	.type	VCTRL_FreeChanResource, %function
VCTRL_FreeChanResource:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L341
	ldr	x20, [x19, 16]
	cbz	x20, .L342
	ldr	w0, [x20, 16]
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	bl	MEM_DelMemRecord
	ldr	w0, [x19]
	cmp	w0, 1
	beq	.L343
.L327:
	ldr	x20, [x19, 24]
	cbz	x20, .L344
.L328:
	ldr	w0, [x20, 16]
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	bl	MEM_DelMemRecord
	ldr	w0, [x19, 4]
	cmp	w0, 1
	beq	.L345
.L329:
	ldr	x20, [x19, 32]
	cbz	x20, .L346
.L330:
	ldr	w0, [x20, 16]
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	bl	MEM_DelMemRecord
	ldr	w0, [x19, 8]
	cmp	w0, 1
	beq	.L347
.L331:
	ldr	x1, .LC312
	ldr	x0, [x20, 8]
	ldr	x1, [x1, 328]
	blr	x1
	mov	w0, 0
.L325:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L347:
	ldr	w0, [x20, 16]
	cbz	w0, .L331
	ldr	x1, [x20, 8]
	bl	MEM_ReleaseMemBlock
	mov	w0, 0
	b	.L325
	.p2align 3
.L345:
	ldr	w0, [x20, 16]
	cbz	w0, .L329
	ldr	x1, [x20, 8]
	bl	MEM_ReleaseMemBlock
	ldr	x20, [x19, 32]
	cbnz	x20, .L330
.L346:
	ldr	x3, .LC303
	mov	w1, 1566
	ldr	x2, .LC311
	mov	w0, 0
	add	x3, x3, 312
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L343:
	ldr	w0, [x20, 16]
	cbz	w0, .L327
	ldr	x1, [x20, 8]
	bl	MEM_ReleaseMemBlock
	ldr	x20, [x19, 24]
	cbnz	x20, .L328
	.p2align 2
.L344:
	ldr	x3, .LC303
	mov	w1, 1544
	ldr	x2, .LC309
	mov	w0, 0
	add	x3, x3, 288
	bl	dprint_normal
	b	.L329
	.p2align 3
.L342:
	ldr	x3, .LC303
	mov	w1, 1522
	ldr	x2, .LC307
	mov	w0, 0
	add	x3, x3, 264
	bl	dprint_normal
	b	.L327
.L341:
	ldr	x3, .LC303
	mov	w1, 1588
	ldr	x2, .LC305
	mov	w0, 0
	add	x3, x3, 240
	bl	dprint_normal
	mov	w0, -1
	b	.L325
	.size	VCTRL_FreeChanResource, .-VCTRL_FreeChanResource
	.align	3
.LC303:
	.xword	.LANCHOR3
	.align	3
.LC305:
	.xword	.LC304
	.align	3
.LC307:
	.xword	.LC306
	.align	3
.LC309:
	.xword	.LC308
	.align	3
.LC311:
	.xword	.LC310
	.align	3
.LC312:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanCtxSize
	.type	VCTRL_GetChanCtxSize, %function
VCTRL_GetChanCtxSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	mov	w0, 51600
	movk	w0, 0x7, lsl 16
	str	w0, [x19]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetChanCtxSize, .-VCTRL_GetChanCtxSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanHalSize
	.type	VCTRL_GetChanHalSize, %function
VCTRL_GetChanHalSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	str	wzr, [x19]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetChanHalSize, .-VCTRL_GetChanHalSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanCfg
	.type	VCTRL_GetChanCfg, %function
VCTRL_GetChanCfg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L356
	ldr	x0, .LC316
	add	x0, x0, 64
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L357
	cbz	x20, .L358
	ldr	x3, .LC320
	add	x1, x1, 217088
	mov	x2, 156
	add	x1, x1, 3072
	mov	x0, x20
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L352:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L356:
	ldr	x3, .LC314
	mov	w4, 2387
	ldr	x5, .LC313
.L355:
	ldr	x2, .LC315
	add	x3, x3, 336
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L352
.L358:
	ldr	x3, .LC314
	mov	w4, 2389
	ldr	x5, .LC319
	b	.L355
.L357:
	ldr	x3, .LC314
	mov	w4, 2388
	ldr	x5, .LC317
	b	.L355
	.size	VCTRL_GetChanCfg, .-VCTRL_GetChanCfg
	.align	3
.LC313:
	.xword	.LC103
	.align	3
.LC314:
	.xword	.LANCHOR3
	.align	3
.LC315:
	.xword	.LC105
	.align	3
.LC316:
	.xword	.LANCHOR0
	.align	3
.LC317:
	.xword	.LC119
	.align	3
.LC319:
	.xword	.LC318
	.align	3
.LC320:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CheckCommonParameter
	.type	VCTRL_CheckCommonParameter, %function
VCTRL_CheckCommonParameter:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x0, .LC322
	ldr	w1, [x19, 8]
	add	x0, x0, 64
	ldr	x0, [x0, w20, sxtw 3]
	add	x0, x0, 217088
	ldr	w2, [x0, 3080]
	cmp	w2, w1
	bne	.L372
	ldr	w2, [x0, 3100]
	ldr	w1, [x19, 28]
	cmp	w2, w1
	bne	.L372
	ldr	w2, [x0, 3096]
	ldr	w1, [x19, 24]
	cmp	w2, w1
	bne	.L372
	ldr	w2, [x0, 3104]
	ldr	w1, [x19, 32]
	cmp	w2, w1
	bne	.L372
	ldr	w2, [x0, 3108]
	ldr	w1, [x19, 36]
	cmp	w2, w1
	bne	.L372
	ldr	w2, [x0, 3112]
	ldr	w1, [x19, 40]
	cmp	w2, w1
	bne	.L372
	ldr	w2, [x0, 3128]
	ldr	w1, [x19, 56]
	cmp	w2, w1
	bne	.L372
	ldr	w2, [x0, 3212]
	ldr	w1, [x19, 140]
	cmp	w2, w1
	bne	.L372
	ldr	w2, [x0, 3140]
	ldr	w1, [x19, 68]
	cmp	w2, w1
	bne	.L372
	ldr	w2, [x0, 3136]
	ldr	w1, [x19, 64]
	cmp	w2, w1
	bne	.L372
	ldr	w2, [x0, 3132]
	ldr	w1, [x19, 60]
	cmp	w2, w1
	bne	.L372
	ldr	w2, [x0, 3144]
	ldr	w1, [x19, 72]
	cmp	w2, w1
	bne	.L372
	ldr	w1, [x0, 3204]
	ldr	w0, [x19, 132]
	ldp	x19, x20, [sp, 16]
	cmp	w1, w0
	csetm	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L372:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_CheckCommonParameter, .-VCTRL_CheckCommonParameter
	.align	3
.LC322:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CmpConfigParameter
	.type	VCTRL_CmpConfigParameter, %function
VCTRL_CmpConfigParameter:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x0, .LC324
	add	x0, x0, 64
	ldr	x19, [x0, w20, sxtw 3]
	ldr	w0, [x19, 128]
	cmp	w0, 22
	beq	.L378
	mov	x1, x21
	mov	w0, w20
	bl	VCTRL_CheckCommonParameter
	cbnz	w0, .L378
	add	x19, x19, 217088
	ldr	w1, [x19, 3080]
	cmp	w1, 1
	beq	.L379
	sub	w1, w1, #10
	cmp	w1, 2
	bhi	.L374
	ldr	w0, [x21, 12]
	ldr	w1, [x19, 3084]
	cmp	w1, w0
	csetm	w0, ne
.L374:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L379:
	ldr	w1, [x19, 3084]
	ldr	w0, [x21, 12]
	cmp	w1, w0
	bne	.L378
	ldr	w0, [x21, 16]
	ldr	w1, [x19, 3088]
	ldr	x21, [sp, 32]
	cmp	w1, w0
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L378:
	mov	w0, -1
	b	.L374
	.size	VCTRL_CmpConfigParameter, .-VCTRL_CmpConfigParameter
	.align	3
.LC324:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ConfigChanCompress
	.type	VCTRL_ConfigChanCompress, %function
VCTRL_ConfigChanCompress:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, .LC326
	mov	w2, -1
	ldr	w3, [x20, 56]
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	add	x0, x0, 217088
	str	w3, [x0, 3128]
	str	wzr, [x0, 3904]
	str	w2, [x0, 3908]
	str	w2, [x0, 3912]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_ConfigChanCompress, .-VCTRL_ConfigChanCompress
	.align	3
.LC326:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ConfigChanMaxWH
	.type	VCTRL_ConfigChanMaxWH, %function
VCTRL_ConfigChanMaxWH:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 104]
	cmp	w0, wzr
	ble	.L382
	ldr	w1, [x19, 108]
	cmp	w1, wzr
	ble	.L382
	ldr	x1, .LC328
	add	x1, x1, 64
	ldr	x1, [x1, w20, sxtw 3]
	add	x1, x1, 217088
	str	w0, [x1, 3176]
	ldr	w0, [x19, 108]
	str	w0, [x1, 3180]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L382:
	ldr	x0, .LC328
	mov	w2, 1920
	mov	w1, 1088
	add	x0, x0, 64
	ldr	x0, [x0, w20, sxtw 3]
	add	x0, x0, 217088
	str	w2, [x0, 3176]
	str	w1, [x0, 3180]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_ConfigChanMaxWH, .-VCTRL_ConfigChanMaxWH
	.align	3
.LC328:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SeekPts
	.type	VCTRL_SeekPts, %function
VCTRL_SeekPts:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L390
	ldr	x0, .LC333
	add	x0, x0, 64
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L391
	add	x1, x1, 128
	mov	w0, 3
	bl	PDT_GetAttribute
	cbnz	w0, .L388
	mov	x1, x20
	mov	w0, w19
	bl	SM_SeekPts
	cmp	w0, wzr
	csetm	w0, ne
.L386:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L388:
	mov	w0, -1
	b	.L386
	.p2align 3
.L390:
	ldr	x3, .LC331
	mov	w4, 2758
	ldr	x5, .LC330
.L389:
	ldr	x2, .LC332
	add	x3, x3, 360
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L386
.L391:
	ldr	x3, .LC331
	mov	w4, 2759
	ldr	x5, .LC335
	b	.L389
	.size	VCTRL_SeekPts, .-VCTRL_SeekPts
	.align	3
.LC330:
	.xword	.LC103
	.align	3
.LC331:
	.xword	.LANCHOR3
	.align	3
.LC332:
	.xword	.LC105
	.align	3
.LC333:
	.xword	.LANCHOR0
	.align	3
.LC335:
	.xword	.LC334
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_InitSyntaxCtx
	.type	VCTRL_InitSyntaxCtx, %function
VCTRL_InitSyntaxCtx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC337
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L400
	ldr	w1, [x0, 128]
	cmp	w1, 16
	bls	.L401
.L392:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L401:
	ldr	x2, .LC341
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx396
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx396:
	.section	.rodata
	.align	0
	.align	2
.L396:
	.byte	(.L395 - .Lrtx396) / 4
	.byte	(.L392 - .Lrtx396) / 4
	.byte	(.L397 - .Lrtx396) / 4
	.byte	(.L398 - .Lrtx396) / 4
	.byte	(.L392 - .Lrtx396) / 4
	.byte	(.L392 - .Lrtx396) / 4
	.byte	(.L392 - .Lrtx396) / 4
	.byte	(.L392 - .Lrtx396) / 4
	.byte	(.L392 - .Lrtx396) / 4
	.byte	(.L392 - .Lrtx396) / 4
	.byte	(.L392 - .Lrtx396) / 4
	.byte	(.L392 - .Lrtx396) / 4
	.byte	(.L392 - .Lrtx396) / 4
	.byte	(.L392 - .Lrtx396) / 4
	.byte	(.L392 - .Lrtx396) / 4
	.byte	(.L392 - .Lrtx396) / 4
	.byte	(.L399 - .Lrtx396) / 4
	.text
	.p2align 3
.L399:
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	HEVCDEC_Init
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L398:
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	MPEG2DEC_Init
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L397:
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	MPEG4DEC_Init
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L395:
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	H264DEC_Init
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L400:
	ldr	x3, .LC339
	mov	w4, 2780
	ldr	x5, .LC338
	mov	w1, w4
	ldr	x2, .LC340
	add	x3, x3, 376
	bl	dprint_normal
	b	.L392
	.size	VCTRL_InitSyntaxCtx, .-VCTRL_InitSyntaxCtx
	.align	3
.LC337:
	.xword	.LANCHOR0
	.align	3
.LC338:
	.xword	.LC119
	.align	3
.LC339:
	.xword	.LANCHOR3
	.align	3
.LC340:
	.xword	.LC105
	.align	3
.LC341:
	.xword	.L396
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ReleaseStream
	.type	VCTRL_ReleaseStream, %function
VCTRL_ReleaseStream:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L406
	ldr	x0, .LC347
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L407
	mov	w0, w19
	bl	SM_Reset
	cmp	w0, wzr
	csetm	w0, ne
.L404:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L406:
	ldr	x3, .LC345
	mov	w4, 2895
	ldr	x5, .LC344
	mov	w1, w4
	ldr	x2, .LC346
	add	x3, x3, 400
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L404
.L407:
	ldr	x3, .LC345
	mov	w4, 2896
	ldr	x5, .LC349
	mov	w1, w4
	ldr	x2, .LC346
	add	x3, x3, 400
	bl	dprint_normal
	mov	w0, -1
	b	.L404
	.size	VCTRL_ReleaseStream, .-VCTRL_ReleaseStream
	.align	3
.LC344:
	.xword	.LC343
	.align	3
.LC345:
	.xword	.LANCHOR3
	.align	3
.LC346:
	.xword	.LC105
	.align	3
.LC347:
	.xword	.LANCHOR0
	.align	3
.LC349:
	.xword	.LC348
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanUniqueID
	.type	VCTRL_GetChanUniqueID, %function
VCTRL_GetChanUniqueID:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L411
	ldr	x0, .LC351
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L411
	ldr	x0, [x0, 8]
.L409:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L411:
	mov	x0, -1
	b	.L409
	.size	VCTRL_GetChanUniqueID, .-VCTRL_GetChanUniqueID
	.align	3
.LC351:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanImage
	.type	VCTRL_GetChanImage, %function
VCTRL_GetChanImage:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L429
	ldr	x22, .LC356
	add	x23, x22, 64
	ldr	x0, [x23, w19, sxtw 3]
	cbz	x0, .L430
	ldr	w0, [x0, 16]
	cmp	w0, 1
	bne	.L431
	cbz	x20, .L432
	ldr	x21, .LC362
	mov	w0, 4
	ldr	x1, [x21, 24]
	blr	x1
	ldr	x0, [x23, w19, sxtw 3]
	cbz	x0, .L418
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L418
	add	x0, x0, 221184
	mov	x1, x20
	add	x0, x0, 112
	bl	SYNTAX_ReceiveImage
	mov	w23, w0
	mov	w0, 9
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L433
.L421:
	cmp	w23, 1
	beq	.L434
.L423:
	ldr	x1, [x21, 32]
	mov	w0, 4
	blr	x1
	cmp	w23, 1
	csetm	w0, ne
.L414:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L433:
	ldr	x0, [x21]
	blr	x0
	mov	w4, w0
	add	x3, x22, 544
	ldr	x1, .LC363
	ldr	w0, [x3, w19, sxtw 2]
	ldr	w1, [x1]
	sub	w0, w4, w0
	cmp	w0, w1
	bls	.L421
	lsl	w2, w19, 24
	ldr	x0, .LC354
	cmp	w23, 1
	add	w2, w2, 589824
	csinc	w2, w2, w2, ne
	mov	w1, 3197
	add	x0, x0, 448
	str	w4, [x3, w19, sxtw 2]
	bl	DBG_AddTrace
	b	.L421
	.p2align 3
.L434:
	add	x2, x22, 64
	sxtw	x0, w19
	lsl	x1, x0, 2
	ldr	w4, [x20, 156]
	sub	x1, x1, x0
	add	x22, x22, 560
	ldr	x3, [x2, w19, sxtw 3]
	lsl	x2, x1, 5
	add	x1, x1, x2
	add	x2, x3, 24576
	add	x0, x1, x0
	add	x22, x22, x0
	str	w4, [x2, 2336]
	ldr	w0, [x20, 152]
	str	w0, [x3, 136]
	ldr	w0, [x22, 36]
	cbz	w0, .L435
.L424:
	ldr	x3, .LC354
	mov	w4, 3211
	ldr	x2, .LC365
	mov	w1, w4
	ldr	w7, [x20, 88]
	add	x3, x3, 424
	ldr	w6, [x20, 276]
	mov	w0, 26
	ldr	w5, [x20, 444]
	bl	dprint_normal
	b	.L423
	.p2align 3
.L435:
	ldr	x0, [x21]
	blr	x0
	str	w0, [x22, 36]
	b	.L424
	.p2align 3
.L418:
	ldr	x1, [x21, 32]
	mov	w0, 4
	blr	x1
	ldr	x23, [sp, 48]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L431:
	ldr	x3, .LC354
	mov	w4, 3156
	ldr	x5, .LC359
.L428:
	ldr	x2, .LC355
	add	x3, x3, 424
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L414
	.p2align 3
.L429:
	ldr	x3, .LC354
	mov	w4, 3154
	ldr	x5, .LC353
	b	.L428
.L432:
	ldr	x3, .LC354
	mov	w4, 3157
	ldr	x5, .LC361
	b	.L428
.L430:
	ldr	x3, .LC354
	mov	w4, 3155
	ldr	x5, .LC357
	mov	w1, w4
	ldr	x2, .LC355
	add	x3, x3, 424
	bl	dprint_normal
	mov	w0, -1
	b	.L414
	.size	VCTRL_GetChanImage, .-VCTRL_GetChanImage
	.align	3
.LC353:
	.xword	.LC103
	.align	3
.LC354:
	.xword	.LANCHOR3
	.align	3
.LC355:
	.xword	.LC105
	.align	3
.LC356:
	.xword	.LANCHOR0
	.align	3
.LC357:
	.xword	.LC119
	.align	3
.LC359:
	.xword	.LC358
	.align	3
.LC361:
	.xword	.LC360
	.align	3
.LC362:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC363:
	.xword	g_TraceImgPeriod
	.align	3
.LC365:
	.xword	.LC364
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ReleaseChanImage
	.type	VCTRL_ReleaseChanImage, %function
VCTRL_ReleaseChanImage:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L453
	ldr	x23, .LC372
	add	x22, x23, 64
	ldr	x0, [x22, w19, sxtw 3]
	cbz	x0, .L454
	ldr	w0, [x0, 16]
	cmp	w0, 1
	bne	.L455
	cbz	x20, .L456
	ldr	x21, .LC376
	mov	w0, 4
	ldr	x1, [x21, 24]
	blr	x1
	ldr	x0, [x22, w19, sxtw 3]
	cbz	x0, .L457
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L458
	add	x0, x0, 221184
	mov	x1, x20
	add	x0, x0, 112
	bl	SYNTAX_ReleaseImage
	mov	w22, w0
	mov	w0, 10
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L459
.L451:
	ldr	x24, .LC370
.L445:
	cmp	w22, 1
	beq	.L447
	mov	w4, 3282
	ldr	x2, .LC383
	ldr	w5, [x20, 444]
	mov	w1, w4
	add	x3, x24, 472
	mov	w0, 26
	bl	dprint_normal
	mov	x1, x20
	mov	w0, w19
	bl	FSP_UnMarkImageOutHanging
.L448:
	ldr	x1, [x21, 32]
	mov	w0, 4
	blr	x1
	cmp	w22, 1
	csetm	w0, ne
.L438:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L459:
	ldr	x0, [x21]
	add	x23, x23, 960
	blr	x0
	mov	w3, w0
	ldr	x1, .LC381
	ldr	w0, [x23, w19, sxtw 2]
	ldr	w1, [x1]
	sub	w0, w3, w0
	cmp	w0, w1
	bls	.L451
	lsl	w2, w19, 24
	ldr	x24, .LC370
	cmp	w22, 1
	add	w2, w2, 655360
	csinc	w2, w2, w2, ne
	mov	w1, 3275
	add	x0, x24, 496
	str	w3, [x23, w19, sxtw 2]
	bl	DBG_AddTrace
	b	.L445
	.p2align 3
.L447:
	mov	w4, 3287
	ldr	x2, .LC385
	ldr	w6, [x20, 88]
	add	x3, x24, 472
	ldr	w5, [x20, 444]
	mov	w1, w4
	mov	w0, 26
	bl	dprint_normal
	b	.L448
	.p2align 3
.L458:
	ldr	x1, [x21, 32]
	mov	w0, 4
	blr	x1
	mov	w3, 3243
	ldr	x2, .LC380
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L438
	.p2align 3
.L455:
	ldr	x3, .LC370
	mov	w4, 3227
	ldr	x5, .LC374
.L452:
	ldr	x2, .LC371
	add	x3, x3, 472
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L438
	.p2align 3
.L453:
	ldr	x3, .LC370
	mov	w4, 3225
	ldr	x5, .LC369
	b	.L452
.L456:
	ldr	x3, .LC370
	mov	w4, 3228
	ldr	x5, .LC375
	b	.L452
.L454:
	ldr	x3, .LC370
	mov	w4, 3226
	ldr	x5, .LC373
	mov	w1, w4
	ldr	x2, .LC371
	add	x3, x3, 472
	bl	dprint_normal
	mov	w0, -1
	b	.L438
.L457:
	ldr	x1, [x21, 32]
	mov	w0, 4
	blr	x1
	mov	w3, 3235
	ldr	x2, .LC378
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L438
	.size	VCTRL_ReleaseChanImage, .-VCTRL_ReleaseChanImage
	.align	3
.LC369:
	.xword	.LC103
	.align	3
.LC370:
	.xword	.LANCHOR3
	.align	3
.LC371:
	.xword	.LC105
	.align	3
.LC372:
	.xword	.LANCHOR0
	.align	3
.LC373:
	.xword	.LC119
	.align	3
.LC374:
	.xword	.LC358
	.align	3
.LC375:
	.xword	.LC360
	.align	3
.LC376:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC378:
	.xword	.LC377
	.align	3
.LC380:
	.xword	.LC379
	.align	3
.LC381:
	.xword	g_TraceImgPeriod
	.align	3
.LC383:
	.xword	.LC382
	.align	3
.LC385:
	.xword	.LC384
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetVidStd
	.type	VCTRL_GetVidStd, %function
VCTRL_GetVidStd:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L461
	ldr	x0, .LC388
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L461
	ldr	w1, [x0, 16]
	cmp	w1, 1
	beq	.L464
	mov	w3, 3307
	ldr	x2, .LC392
	mov	w4, w19
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, 22
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L461:
	mov	w3, 3301
	ldr	x2, .LC390
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, 22
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L464:
	ldr	w0, [x0, 128]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetVidStd, .-VCTRL_GetVidStd
	.align	3
.LC388:
	.xword	.LANCHOR0
	.align	3
.LC390:
	.xword	.LC389
	.align	3
.LC392:
	.xword	.LC391
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetHDRConfigInfo
	.type	VCTRL_GetHDRConfigInfo, %function
VCTRL_GetHDRConfigInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 3
	bhi	.L471
	ldr	x0, .LC397
	add	x0, x0, 64
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L472
	cbz	x19, .L473
	add	x0, x0, 217088
	ldrb	w1, [x0, 3072]
	strb	w1, [x19, 65]
	ldrb	w1, [x0, 3074]
	strb	w1, [x19, 66]
	ldr	w1, [x0, 3184]
	str	w1, [x19, 76]
	ldr	w1, [x0, 3188]
	str	w1, [x19, 68]
	ldr	w0, [x0, 3192]
	str	w0, [x19, 72]
.L465:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L471:
	ldr	x3, .LC395
	mov	w4, 3316
	ldr	x5, .LC394
.L470:
	ldr	x2, .LC396
	add	x3, x3, 520
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L472:
	ldr	x3, .LC395
	mov	w4, 3317
	ldr	x5, .LC398
	mov	w1, w4
	ldr	x2, .LC396
	add	x3, x3, 520
	bl	dprint_normal
	b	.L465
	.p2align 3
.L473:
	ldr	x3, .LC395
	mov	w4, 3318
	ldr	x5, .LC400
	b	.L470
	.size	VCTRL_GetHDRConfigInfo, .-VCTRL_GetHDRConfigInfo
	.align	3
.LC394:
	.xword	.LC103
	.align	3
.LC395:
	.xword	.LANCHOR3
	.align	3
.LC396:
	.xword	.LC105
	.align	3
.LC397:
	.xword	.LANCHOR0
	.align	3
.LC398:
	.xword	.LC119
	.align	3
.LC400:
	.xword	.LC399
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetDecParam
	.type	VCTRL_GetDecParam, %function
VCTRL_GetDecParam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L486
	ldr	x0, .LC402
	add	x0, x0, 64
	ldr	x20, [x0, w19, sxtw 3]
	cbz	x20, .L486
	ldr	x2, [x20, 16]
	mov	x0, 4294967297
	mov	x1, 0
	cmp	x2, x0
	bne	.L475
	ldr	w4, [x20, 128]
	cmp	w4, 16
	bls	.L487
.L476:
	ldr	x3, .LC404
	mov	w1, 3461
	ldr	x2, .LC406
	mov	w0, 0
	add	x3, x3, 544
	bl	dprint_normal
	mov	x1, 0
	mov	x0, x1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L486:
	mov	x1, 0
.L475:
	mov	x0, x1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L487:
	ldr	x0, .LC403
	ldrb	w0, [x0,w4,uxtw]
	adr	x1, .Lrtx478
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx478:
	.section	.rodata
	.align	0
	.align	2
.L478:
	.byte	(.L477 - .Lrtx478) / 4
	.byte	(.L476 - .Lrtx478) / 4
	.byte	(.L479 - .Lrtx478) / 4
	.byte	(.L480 - .Lrtx478) / 4
	.byte	(.L476 - .Lrtx478) / 4
	.byte	(.L476 - .Lrtx478) / 4
	.byte	(.L476 - .Lrtx478) / 4
	.byte	(.L476 - .Lrtx478) / 4
	.byte	(.L476 - .Lrtx478) / 4
	.byte	(.L476 - .Lrtx478) / 4
	.byte	(.L476 - .Lrtx478) / 4
	.byte	(.L476 - .Lrtx478) / 4
	.byte	(.L476 - .Lrtx478) / 4
	.byte	(.L476 - .Lrtx478) / 4
	.byte	(.L476 - .Lrtx478) / 4
	.byte	(.L476 - .Lrtx478) / 4
	.byte	(.L481 - .Lrtx478) / 4
	.text
	.p2align 3
.L481:
	add	x0, x20, 221184
	ldr	x19, [x0, 2600]
.L482:
	cbz	x19, .L486
	ldr	x0, .LC407
	ldr	x0, [x0]
	blr	x0
	str	w0, [x20, 40]
	mov	x1, x19
	mov	x0, x1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L480:
	add	x0, x20, 221184
	ldr	x19, [x0, 160]
	b	.L482
	.p2align 3
.L479:
	add	x0, x20, 221184
	ldr	x19, [x0, 1160]
	b	.L482
	.p2align 3
.L477:
	add	x0, x20, 221184
	ldr	x19, [x0, 736]
	b	.L482
	.size	VCTRL_GetDecParam, .-VCTRL_GetDecParam
	.align	3
.LC402:
	.xword	.LANCHOR0
	.align	3
.LC403:
	.xword	.L478
	.align	3
.LC404:
	.xword	.LANCHOR3
	.align	3
.LC406:
	.xword	.LC405
	.align	3
.LC407:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IsSedOnlyMode
	.type	VCTRL_IsSedOnlyMode, %function
VCTRL_IsSedOnlyMode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L496
	cbz	w20, .L491
	cmp	w20, 16
	beq	.L492
	mov	w0, 0
.L490:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L492:
	ldr	w0, [x19, 4932]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	uxtb	w0, w0
	ret
	.p2align 3
.L491:
	ldrb	w0, [x19, 940]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L496:
	ldr	x2, .LC410
	mov	w1, 3480
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	b	.L490
	.size	VCTRL_IsSedOnlyMode, .-VCTRL_IsSedOnlyMode
	.align	3
.LC410:
	.xword	.LC409
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ChanDecparamInValidFlag
	.type	VCTRL_ChanDecparamInValidFlag, %function
VCTRL_ChanDecparamInValidFlag:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L498
	ldr	x20, .LC411
	add	x20, x20, 64
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L498
	ldr	x1, [x0, 16]
	mov	x0, 4294967297
	cmp	x1, x0
	beq	.L501
	ldr	x2, .LC415
	mov	w3, w19
	mov	w1, 3519
	mov	w0, 20
	mov	w21, 0
	bl	dprint_normal
.L500:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L501:
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbz	x0, .L506
	ldr	x0, [x20, w19, sxtw 3]
	mov	w21, 0
	stp	wzr, wzr, [x0, 108]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L498:
	mov	w3, 3513
	ldr	x2, .LC413
	mov	w4, w19
	mov	w1, w3
	mov	w0, 20
	mov	w21, 0
	bl	dprint_normal
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L506:
	ldr	x22, [x20, w19, sxtw 3]
	ldr	x0, .LC416
	ldr	w21, [x22, 108]
	cbz	w21, .L507
	ldr	x0, [x0]
	blr	x0
	ldr	x1, [x20, w19, sxtw 3]
	ldr	w2, [x1, 112]
	cmp	w0, w2
	bls	.L504
	sub	w0, w0, w2
	mov	w21, 0
	cmp	w0, 40
	bls	.L500
.L504:
	mov	w21, 1
	stp	wzr, wzr, [x1, 108]
	b	.L500
.L507:
	ldr	x0, [x0]
	mov	w1, 1
	str	w1, [x22, 108]
	blr	x0
	str	w0, [x22, 112]
	b	.L500
	.size	VCTRL_ChanDecparamInValidFlag, .-VCTRL_ChanDecparamInValidFlag
	.align	3
.LC411:
	.xword	.LANCHOR0
	.align	3
.LC413:
	.xword	.LC412
	.align	3
.LC415:
	.xword	.LC414
	.align	3
.LC416:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ClearDecparam
	.type	VCTRL_ClearDecparam, %function
VCTRL_ClearDecparam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L518
	ldr	x0, .LC422
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L519
	ldr	w4, [x0, 128]
	cmp	w4, 16
	bls	.L520
.L512:
	ldr	x3, .LC420
	mov	w1, 3989
	ldr	x2, .LC426
	mov	w0, 1
	add	x3, x3, 568
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L520:
	ldr	x1, .LC424
	ldrb	w1, [x1,w4,uxtw]
	adr	x2, .Lrtx514
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx514:
	.section	.rodata
	.align	0
	.align	2
.L514:
	.byte	(.L513 - .Lrtx514) / 4
	.byte	(.L512 - .Lrtx514) / 4
	.byte	(.L515 - .Lrtx514) / 4
	.byte	(.L516 - .Lrtx514) / 4
	.byte	(.L512 - .Lrtx514) / 4
	.byte	(.L512 - .Lrtx514) / 4
	.byte	(.L512 - .Lrtx514) / 4
	.byte	(.L512 - .Lrtx514) / 4
	.byte	(.L512 - .Lrtx514) / 4
	.byte	(.L512 - .Lrtx514) / 4
	.byte	(.L512 - .Lrtx514) / 4
	.byte	(.L512 - .Lrtx514) / 4
	.byte	(.L512 - .Lrtx514) / 4
	.byte	(.L512 - .Lrtx514) / 4
	.byte	(.L512 - .Lrtx514) / 4
	.byte	(.L512 - .Lrtx514) / 4
	.byte	(.L517 - .Lrtx514) / 4
	.text
	.p2align 3
.L518:
	ldr	x3, .LC420
	mov	w4, 3887
	ldr	x5, .LC419
	mov	w1, w4
	ldr	x2, .LC421
	add	x3, x3, 568
	mov	w0, 0
	bl	dprint_normal
.L508:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L517:
	add	x0, x0, 221184
	str	xzr, [x0, 2600]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L516:
	add	x0, x0, 221184
	str	xzr, [x0, 160]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L515:
	add	x0, x0, 221184
	str	xzr, [x0, 1160]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L513:
	add	x0, x0, 221184
	str	xzr, [x0, 736]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L519:
	ldr	x3, .LC420
	mov	w4, 3888
	ldr	x5, .LC423
	mov	w1, w4
	ldr	x2, .LC421
	add	x3, x3, 568
	bl	dprint_normal
	b	.L508
	.size	VCTRL_ClearDecparam, .-VCTRL_ClearDecparam
	.align	3
.LC419:
	.xword	.LC418
	.align	3
.LC420:
	.xword	.LANCHOR3
	.align	3
.LC421:
	.xword	.LC105
	.align	3
.LC422:
	.xword	.LANCHOR0
	.align	3
.LC423:
	.xword	.LC348
	.align	3
.LC424:
	.xword	.L514
	.align	3
.LC426:
	.xword	.LC425
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_VdmProcSedOnly
	.type	VCTRL_VdmProcSedOnly, %function
VCTRL_VdmProcSedOnly:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	w21, w1
	bl	_mcount
	cmp	w20, 3
	bhi	.L532
	ldr	x19, .LC431
	add	x19, x19, 64
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L533
	ldr	w0, [x0, 20]
	cmp	w0, 1
	beq	.L525
	ldr	x3, .LC429
	mov	w4, 4016
	ldr	x5, .LC434
.L531:
	ldr	x2, .LC430
	add	x3, x3, 592
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L521:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L525:
	mov	w0, w20
	bl	VCTRL_GetDecParam
	cbz	x0, .L521
	ldr	x0, [x19, w20, sxtw 3]
	ldr	w1, [x0, 128]
	cbz	w1, .L526
	cmp	w1, 16
	bne	.L521
	add	x0, x0, 221184
	mov	w1, w21
	add	x0, x0, 120
	bl	HEVCDEC_VDMProcSedOnly
	b	.L521
	.p2align 3
.L532:
	ldr	x3, .LC429
	mov	w4, 4014
	ldr	x5, .LC428
	b	.L531
	.p2align 3
.L526:
	add	x0, x0, 221184
	mov	w1, w21
	add	x0, x0, 120
	bl	H264DEC_VDMProcSedOnly
	b	.L521
	.p2align 3
.L533:
	ldr	x3, .LC429
	mov	w4, 4015
	ldr	x5, .LC432
	mov	w1, w4
	ldr	x2, .LC430
	add	x3, x3, 592
	bl	dprint_normal
	b	.L521
	.size	VCTRL_VdmProcSedOnly, .-VCTRL_VdmProcSedOnly
	.align	3
.LC428:
	.xword	.LC418
	.align	3
.LC429:
	.xword	.LANCHOR3
	.align	3
.LC430:
	.xword	.LC105
	.align	3
.LC431:
	.xword	.LANCHOR0
	.align	3
.LC432:
	.xword	.LC358
	.align	3
.LC434:
	.xword	.LC433
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetImageBuffer
	.type	VCTRL_GetImageBuffer, %function
VCTRL_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L546
	ldr	x0, .LC439
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L547
	ldr	w1, [x0, 20]
	cmp	w1, 1
	bne	.L548
	ldr	w4, [x0, 128]
	cmp	w4, 16
	bls	.L549
.L539:
	ldr	x3, .LC437
	mov	w1, 4160
	ldr	x2, .LC444
	mov	w0, 0
	add	x3, x3, 616
	bl	dprint_normal
	mov	w0, 0
.L536:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L549:
	ldr	x1, .LC442
	ldrb	w1, [x1,w4,uxtw]
	adr	x2, .Lrtx541
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx541:
	.section	.rodata
	.align	0
	.align	2
.L541:
	.byte	(.L540 - .Lrtx541) / 4
	.byte	(.L539 - .Lrtx541) / 4
	.byte	(.L542 - .Lrtx541) / 4
	.byte	(.L543 - .Lrtx541) / 4
	.byte	(.L539 - .Lrtx541) / 4
	.byte	(.L539 - .Lrtx541) / 4
	.byte	(.L539 - .Lrtx541) / 4
	.byte	(.L539 - .Lrtx541) / 4
	.byte	(.L539 - .Lrtx541) / 4
	.byte	(.L539 - .Lrtx541) / 4
	.byte	(.L539 - .Lrtx541) / 4
	.byte	(.L539 - .Lrtx541) / 4
	.byte	(.L539 - .Lrtx541) / 4
	.byte	(.L539 - .Lrtx541) / 4
	.byte	(.L539 - .Lrtx541) / 4
	.byte	(.L539 - .Lrtx541) / 4
	.byte	(.L544 - .Lrtx541) / 4
	.text
	.p2align 3
.L544:
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	HEVCDEC_GetImageBuffer
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L543:
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	MPEG2DEC_GetImageBuffer
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L542:
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	MPEG4DEC_GetImageBuffer
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L540:
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	H264DEC_GetImageBuffer
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L548:
	ldr	x3, .LC437
	mov	w4, 4053
	ldr	x5, .LC441
.L545:
	ldr	x2, .LC438
	add	x3, x3, 616
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L536
	.p2align 3
.L546:
	ldr	x3, .LC437
	mov	w4, 4051
	ldr	x5, .LC436
	b	.L545
.L547:
	ldr	x3, .LC437
	mov	w4, 4052
	ldr	x5, .LC440
	mov	w1, w4
	ldr	x2, .LC438
	add	x3, x3, 616
	bl	dprint_normal
	mov	w0, -1
	b	.L536
	.size	VCTRL_GetImageBuffer, .-VCTRL_GetImageBuffer
	.align	3
.LC436:
	.xword	.LC103
	.align	3
.LC437:
	.xword	.LANCHOR3
	.align	3
.LC438:
	.xword	.LC105
	.align	3
.LC439:
	.xword	.LANCHOR0
	.align	3
.LC440:
	.xword	.LC334
	.align	3
.LC441:
	.xword	.LC433
	.align	3
.LC442:
	.xword	.L541
	.align	3
.LC444:
	.xword	.LC443
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ConfigFFFBSpeed
	.type	VCTRL_ConfigFFFBSpeed, %function
VCTRL_ConfigFFFBSpeed:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L557
	ldr	x0, .LC449
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L558
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L559
	cbz	x20, .L560
	add	x2, x0, 217088
	ldr	w1, [x20]
	mov	w0, 0
	str	w1, [x2, 3920]
.L552:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L559:
	ldr	x3, .LC447
	mov	w4, 4171
	ldr	x5, .LC452
.L556:
	ldr	x2, .LC448
	add	x3, x3, 640
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L552
	.p2align 3
.L557:
	ldr	x3, .LC447
	mov	w4, 4169
	ldr	x5, .LC446
	b	.L556
.L558:
	ldr	x3, .LC447
	mov	w4, 4170
	ldr	x5, .LC450
	mov	w1, w4
	ldr	x2, .LC448
	add	x3, x3, 640
	bl	dprint_normal
	mov	w0, -1
	b	.L552
.L560:
	ldr	x3, .LC447
	mov	w4, 4172
	ldr	x5, .LC454
	b	.L556
	.size	VCTRL_ConfigFFFBSpeed, .-VCTRL_ConfigFFFBSpeed
	.align	3
.LC446:
	.xword	.LC103
	.align	3
.LC447:
	.xword	.LANCHOR3
	.align	3
.LC448:
	.xword	.LC105
	.align	3
.LC449:
	.xword	.LANCHOR0
	.align	3
.LC450:
	.xword	.LC334
	.align	3
.LC452:
	.xword	.LC451
	.align	3
.LC454:
	.xword	.LC453
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ConfigPVRInfo
	.type	VCTRL_ConfigPVRInfo, %function
VCTRL_ConfigPVRInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L568
	ldr	x0, .LC459
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L569
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L570
	cbz	x20, .L571
	ldr	x3, .LC463
	add	x0, x0, 217088
	mov	x2, 24
	mov	x1, x20
	add	x0, x0, 3956
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L563:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L570:
	ldr	x3, .LC457
	mov	w4, 4183
	ldr	x5, .LC461
.L567:
	ldr	x2, .LC458
	add	x3, x3, 664
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L563
	.p2align 3
.L568:
	ldr	x3, .LC457
	mov	w4, 4181
	ldr	x5, .LC456
	b	.L567
.L571:
	ldr	x3, .LC457
	mov	w4, 4184
	ldr	x5, .LC462
	b	.L567
.L569:
	ldr	x3, .LC457
	mov	w4, 4182
	ldr	x5, .LC460
	mov	w1, w4
	ldr	x2, .LC458
	add	x3, x3, 664
	bl	dprint_normal
	mov	w0, -1
	b	.L563
	.size	VCTRL_ConfigPVRInfo, .-VCTRL_ConfigPVRInfo
	.align	3
.LC456:
	.xword	.LC103
	.align	3
.LC457:
	.xword	.LANCHOR3
	.align	3
.LC458:
	.xword	.LC105
	.align	3
.LC459:
	.xword	.LANCHOR0
	.align	3
.LC460:
	.xword	.LC334
	.align	3
.LC461:
	.xword	.LC451
	.align	3
.LC462:
	.xword	.LC453
	.align	3
.LC463:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IsChanActive
	.type	VCTRL_IsChanActive, %function
VCTRL_IsChanActive:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L579
	ldr	x0, .LC468
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L578
	ldr	w1, [x0, 16]
	cbz	w1, .L578
	ldr	w1, [x0, 20]
	cbz	w1, .L578
	ldr	w1, [x0, 28]
	cbz	w1, .L578
	ldr	w0, [x0, 128]
	cmp	w0, 22
	csetm	w0, eq
.L574:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L578:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L579:
	ldr	x3, .LC466
	mov	w4, 4193
	ldr	x5, .LC465
	mov	w1, w4
	ldr	x2, .LC467
	add	x3, x3, 688
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L574
	.size	VCTRL_IsChanActive, .-VCTRL_IsChanActive
	.align	3
.LC465:
	.xword	.LC103
	.align	3
.LC466:
	.xword	.LANCHOR3
	.align	3
.LC467:
	.xword	.LC105
	.align	3
.LC468:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_GetActiveChanNum, %function
VCTRL_GetActiveChanNum:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x22, x1
	mov	x0, x30
	mov	x19, 0
	bl	_mcount
	str	wzr, [x21]
	ldr	x23, .LC472
	str	wzr, [x22]
.L585:
	mov	w0, w19
	bl	VCTRL_IsChanActive
	cbz	w0, .L587
.L582:
	add	x19, x19, 1
	cmp	x19, 4
	bne	.L585
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L587:
	add	x2, x23, 64
	add	x1, x29, 76
	mov	w0, 3
	ldr	x20, [x2, x19, lsl 3]
	ldr	w2, [x20, 128]
	str	w2, [x29, 76]
	bl	PDT_GetAttribute
	cbnz	w0, .L583
	ldr	w0, [x21]
	add	w0, w0, 1
	str	w0, [x21]
.L583:
	ldr	w0, [x20, 128]
	cmp	w0, 1
	bne	.L582
	ldr	w0, [x22]
	add	w0, w0, 1
	str	w0, [x22]
	b	.L582
	.size	VCTRL_GetActiveChanNum, .-VCTRL_GetActiveChanNum
	.align	3
.LC472:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_VarifyOption
	.type	VCTRL_VarifyOption, %function
VCTRL_VarifyOption:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 28]
	tbnz	w0, #31, .L589
	ldr	w1, [x19, 44]
	mov	w0, 262143
	cmp	w1, w0
	ble	.L589
	ldr	w1, [x19, 36]
	mov	w0, 0
	cmp	w1, 1
	beq	.L593
.L590:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L593:
	ldr	w1, [x19, 20]
	cmp	w1, wzr
	ble	.L589
	ldr	w1, [x19, 24]
	cmp	w1, wzr
	bgt	.L590
	.p2align 2
.L589:
	ldr	x3, .LC474
	mov	w1, 4217
	ldr	x2, .LC476
	mov	w0, 1
	add	x3, x3, 712
	bl	dprint_normal
	mov	w0, -1
	b	.L590
	.size	VCTRL_VarifyOption, .-VCTRL_VarifyOption
	.align	3
.LC474:
	.xword	.LANCHOR3
	.align	3
.LC476:
	.xword	.LC475
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetMemSize_onDecode
	.type	VCTRL_GetMemSize_onDecode, %function
VCTRL_GetMemSize_onDecode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	mov	x20, x2
	bl	_mcount
	ldr	w0, [x19, 44]
	mov	w1, 51600
	movk	w1, 0x7, lsl 16
	add	w0, w0, 1039
	and	w0, w0, -1024
	stp	w0, w1, [x20, 4]
	ldr	w0, [x19, 36]
	cbz	w0, .L598
	ldr	w5, [x19, 12]
	cmp	w5, wzr
	ble	.L599
	sxtw	x3, w5
	lsl	x0, x3, 7
	sub	x0, x0, x3
	lsl	x3, x0, 5
.L596:
	ldp	w1, w4, [x19, 20]
	mov	w2, 2208
	mov	w0, 4000
	str	w5, [x19, 12]
	mov	w5, 46660
	smull	x2, w4, w2
	smaddl	x2, w1, w0, x2
	movk	w5, 0x9, lsl 16
	ldr	w1, [x20, 8]
	add	x0, x2, x3
	cmp	w0, w5
	csel	w0, w0, w5, cs
	add	w0, w0, w1
	str	w0, [x20, 8]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L598:
	mov	w0, 32724
	movk	w0, 0x11, lsl 16
	str	w0, [x20, 8]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L599:
	mov	x3, 28416
	mov	w5, 136
	movk	x3, 0x8, lsl 16
	b	.L596
	.size	VCTRL_GetMemSize_onDecode, .-VCTRL_GetMemSize_onDecode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanMemSize
	.type	VCTRL_GetChanMemSize, %function
VCTRL_GetChanMemSize:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x1
	mov	x0, x30
	mov	x20, x2
	mov	w21, w3
	bl	_mcount
	cbz	x19, .L616
	cbz	x20, .L617
	cmp	w21, 2
	beq	.L604
	ldr	x0, .LC483
	mov	w2, 16
	ldr	w3, [x19, 28]
	ldr	w5, [x19, 48]
	ldr	w4, [x0, 976]
	ldr	w6, [x0, 980]
	add	w0, w3, w4
	cmp	w0, w2
	add	w1, w5, w6
	csel	w0, w0, w2, le
	cmp	w0, wzr
	ccmp	w1, wzr, 1, ge
	blt	.L618
	str	w0, [x19, 28]
	str	w1, [x19, 48]
.L604:
	mov	x0, x19
	bl	VCTRL_VarifyOption
	cbnz	w0, .L609
	ldr	w1, [x19, 44]
	mov	w2, 51600
	movk	w2, 0x7, lsl 16
	add	w1, w1, 1039
	and	w1, w1, -1024
	stp	w1, w2, [x20, 4]
	ldr	w1, [x19, 36]
	cbz	w1, .L610
	ldr	w6, [x19, 12]
	cmp	w6, wzr
	ble	.L611
	sxtw	x2, w6
	lsl	x1, x2, 7
	sub	x1, x1, x2
	lsl	x2, x1, 5
.L607:
	ldp	w3, w5, [x19, 20]
	mov	w4, 2208
	mov	w1, 4000
	str	w6, [x19, 12]
	mov	w6, 46660
	smull	x4, w5, w4
	smaddl	x4, w3, w1, x4
	movk	w6, 0x9, lsl 16
	ldr	w3, [x20, 8]
	add	x1, x4, x2
	cmp	w1, w6
	csel	w1, w1, w6, cs
	add	w1, w1, w3
.L606:
	str	w1, [x20, 8]
.L602:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L610:
	mov	w1, 32724
	movk	w1, 0x11, lsl 16
	b	.L606
	.p2align 3
.L611:
	mov	x2, 28416
	mov	w6, 136
	movk	x2, 0x8, lsl 16
	b	.L607
	.p2align 3
.L609:
	mov	w0, -1
	b	.L602
	.p2align 3
.L618:
	ldr	x2, .LC485
	mov	w1, 4291
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L602
.L617:
	ldr	x3, .LC479
	mov	w4, 4282
	ldr	x5, .LC482
.L615:
	ldr	x2, .LC480
	add	x3, x3, 736
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L602
.L616:
	ldr	x3, .LC479
	mov	w4, 4281
	ldr	x5, .LC478
	b	.L615
	.size	VCTRL_GetChanMemSize, .-VCTRL_GetChanMemSize
	.align	3
.LC478:
	.xword	.LC477
	.align	3
.LC479:
	.xword	.LANCHOR3
	.align	3
.LC480:
	.xword	.LC105
	.align	3
.LC482:
	.xword	.LC481
	.align	3
.LC483:
	.xword	.LANCHOR0
	.align	3
.LC485:
	.xword	.LC484
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_RegisterInterrupt
	.type	VCTRL_RegisterInterrupt, %function
VCTRL_RegisterInterrupt:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC486
	ldr	x22, .LC487
	mov	w0, 0
	ldr	x23, [x21, 400]
	ldrsw	x20, [x22, 88]
	bl	VFMW_GetString
	ldr	x19, .LC488
	mov	x3, x0
	mov	x2, x20
	ldr	x1, .LC489
	add	x20, x19, 984
	mov	w0, 127
	mov	x4, x20
	blr	x23
	cbnz	w0, .L623
	add	x19, x19, 96
	mov	w0, 4
	ldrsw	x23, [x22, 88]
	ldr	x22, [x21, 400]
	mov	w21, 1
	str	w21, [x19, 200]
	bl	VFMW_GetString
	ldr	x1, .LC492
	mov	x3, x0
	mov	x4, x20
	mov	x2, x23
	mov	w0, 136
	blr	x22
	cbnz	w0, .L624
	str	w21, [x19, 204]
.L621:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L623:
	ldr	x2, .LC491
	mov	w3, 127
	mov	w1, 4314
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L621
	.p2align 3
.L624:
	ldr	x2, .LC491
	mov	w3, 136
	mov	w1, 4322
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L621
	.size	VCTRL_RegisterInterrupt, .-VCTRL_RegisterInterrupt
	.align	3
.LC486:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC487:
	.xword	.LANCHOR1
	.align	3
.LC488:
	.xword	.LANCHOR0
	.align	3
.LC489:
	.xword	VCTRL_Isr_0
	.align	3
.LC491:
	.xword	.LC490
	.align	3
.LC492:
	.xword	VCTRL_Scd_Isr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_UnregisterInterrupt
	.type	VCTRL_UnregisterInterrupt, %function
VCTRL_UnregisterInterrupt:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC495
	ldr	w0, [x19, 296]
	cmp	w0, 1
	beq	.L628
.L626:
	ldr	w0, [x19, 300]
	cmp	w0, 1
	beq	.L629
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L629:
	ldr	x1, .LC496
	mov	w0, 4
	ldr	x21, [x1, 408]
	bl	VFMW_GetString
	add	x2, x19, 984
	mov	x1, x0
	mov	w0, 136
	blr	x21
	str	wzr, [x19, 300]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L628:
	ldr	x1, .LC496
	mov	w0, 0
	ldr	x21, [x1, 408]
	bl	VFMW_GetString
	add	x2, x19, 984
	mov	x1, x0
	mov	w0, 127
	blr	x21
	str	wzr, [x19, 296]
	b	.L626
	.size	VCTRL_UnregisterInterrupt, .-VCTRL_UnregisterInterrupt
	.align	3
.LC495:
	.xword	.LANCHOR0
	.align	3
.LC496:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_MapVdmRegister
	.type	VCTRL_MapVdmRegister, %function
VCTRL_MapVdmRegister:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 88
	bl	_mcount
	mov	x2, x19
	mov	w1, 65536
	mov	w0, -121438208
	bl	MEM_MapRegisterAddr
	mov	w20, w0
	cbnz	w0, .L633
	ldr	w0, [x19, 16]
	ldr	w2, [x19, 24]
	ldr	x1, [x19, 8]
	bl	MEM_AddMemRecord
.L632:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L633:
	ldr	x2, .LC499
	mov	w3, -121438208
	mov	w1, 4377
	mov	w0, 0
	mov	w20, -1
	bl	dprint_normal
	b	.L632
	.size	VCTRL_MapVdmRegister, .-VCTRL_MapVdmRegister
	.align	3
.LC499:
	.xword	.LC498
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_UnmapVdmRegister
	.type	VCTRL_UnmapVdmRegister, %function
VCTRL_UnmapVdmRegister:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 88
	bl	_mcount
	ldr	w20, [x19, 24]
	ldr	w21, [x19, 16]
	ldr	x22, [x19, 8]
	cbz	w20, .L635
	mov	x1, x22
	mov	w0, w21
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC500
	mov	x2, 32
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
.L635:
	mov	w2, w20
	mov	x1, x22
	mov	w0, w21
	bl	MEM_DelMemRecord
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VCTRL_UnmapVdmRegister, .-VCTRL_UnmapVdmRegister
	.align	3
.LC500:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_InitVdmHal
	.type	VCTRL_InitVdmHal, %function
VCTRL_InitVdmHal:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC501
	mov	w0, 15
	ldr	x20, [x21, 136]
	bl	VFMW_GetString
	mov	x1, 20
	mov	x2, x0
	mov	w3, 0
	add	x0, x29, 48
	blr	x20
	ldr	x20, .LC502
	strb	wzr, [x29, 67]
	ldr	x1, [x20, 88]
	cbz	x1, .L640
	mov	w0, 0
	blr	x1
	cmp	w0, wzr
	mov	w2, w0
	ble	.L640
	mov	w4, 0
	mov	x3, x19
	mov	w1, 0
	add	x0, x29, 48
	str	wzr, [x19, 28]
	bl	MEM_AllocMemBlock
	cbnz	w0, .L641
	ldr	w2, [x19, 24]
	ldr	x1, [x19, 8]
	ldr	w0, [x19, 16]
	bl	MEM_AddMemRecord
	ldr	x3, [x21, 96]
	mov	x2, 20
	mov	w1, 0
	add	x0, x29, 72
	blr	x3
	str	wzr, [x29, 80]
	ldr	w2, [x19, 16]
	ldr	w0, [x19, 24]
	ldr	x1, [x20, 96]
	stp	w2, w0, [x29, 72]
	cbz	x1, .L642
	add	x0, x29, 72
	blr	x1
	mov	w19, w0
	cbnz	w0, .L642
	bl	VDMDRV_Init
.L643:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L640:
	ldr	x2, .LC504
	mov	w3, 0
	mov	w1, 4482
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L642:
	ldr	x2, .LC508
	mov	w3, 0
	mov	w1, 4510
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L643
	.p2align 3
.L641:
	ldr	x2, .LC506
	mov	w3, 0
	mov	w1, 4496
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L643
	.size	VCTRL_InitVdmHal, .-VCTRL_InitVdmHal
	.align	3
.LC501:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC502:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC504:
	.xword	.LC503
	.align	3
.LC506:
	.xword	.LC505
	.align	3
.LC508:
	.xword	.LC507
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DeinitVdmHal
	.type	VCTRL_DeinitVdmHal, %function
VCTRL_DeinitVdmHal:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 64]
	cbz	w0, .L658
	ldr	w0, [x19, 80]
	cmp	w0, wzr
	cset	w23, ne
.L651:
	ldr	w20, [x19, 24]
	ldr	w21, [x19, 16]
	ldr	x22, [x19, 8]
	cbz	w20, .L652
	ldr	x0, .LC509
	ldr	x1, [x0, 104]
	cbz	x1, .L664
	mov	w0, 0
	blr	x1
	cbz	w23, .L655
.L656:
	ldr	x3, .LC510
	mov	x2, 32
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
.L652:
	mov	w2, w20
	mov	x1, x22
	mov	w0, w21
	bl	MEM_DelMemRecord
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L664:
	mov	w3, 4550
	ldr	x2, .LC511
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	cbnz	w23, .L656
	.p2align 2
.L655:
	ldr	w0, [x19, 16]
	ldr	x1, [x19, 8]
	bl	MEM_ReleaseMemBlock
	b	.L656
	.p2align 3
.L658:
	mov	w23, 0
	b	.L651
	.size	VCTRL_DeinitVdmHal, .-VCTRL_DeinitVdmHal
	.align	3
.LC509:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC510:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC511:
	.xword	.LC209
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_InitScdHal
	.type	VCTRL_InitScdHal, %function
VCTRL_InitScdHal:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC512
	mov	w0, 17
	ldr	x20, [x1, 136]
	bl	VFMW_GetString
	mov	w3, 0
	mov	x2, x0
	mov	x1, 20
	add	x0, x29, 40
	blr	x20
	str	wzr, [x19, 60]
	mov	w4, 0
	add	x3, x19, 32
	mov	w2, 25600
	mov	w1, 0
	add	x0, x29, 40
	strb	wzr, [x29, 59]
	bl	MEM_AllocMemBlock
	cbnz	w0, .L666
	ldr	w2, [x19, 56]
	ldr	x1, [x19, 40]
	ldr	w0, [x19, 48]
	bl	MEM_AddMemRecord
	ldr	w0, [x19, 48]
	mov	w2, 0
	ldr	w1, [x19, 56]
	bl	SM_OpenSCDDrv
	mov	w19, w0
	cbnz	w0, .L667
	bl	SM_InstInit
.L668:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L666:
	ldr	x2, .LC514
	mov	w3, 0
	mov	w1, 4592
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L668
	.p2align 3
.L667:
	ldr	x2, .LC516
	mov	w3, 0
	mov	w1, 4600
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L668
	.size	VCTRL_InitScdHal, .-VCTRL_InitScdHal
	.align	3
.LC512:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC514:
	.xword	.LC513
	.align	3
.LC516:
	.xword	.LC515
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DeinitScdHal
	.type	VCTRL_DeinitScdHal, %function
VCTRL_DeinitScdHal:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 64]
	cbz	w0, .L670
	ldr	w0, [x19, 80]
	cbz	w0, .L670
	ldr	w20, [x19, 56]
	ldr	w22, [x19, 48]
	ldr	x21, [x19, 40]
	cbz	w20, .L674
	mov	w0, 0
	add	x23, x19, 32
	bl	SM_CloseSCDDrv
.L672:
	ldr	x3, .LC517
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	ldr	x3, [x3, 96]
	blr	x3
.L674:
	mov	w2, w20
	mov	x1, x21
	mov	w0, w22
	bl	MEM_DelMemRecord
	bl	SM_InstInit
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L670:
	ldr	w20, [x19, 56]
	ldr	w22, [x19, 48]
	ldr	x21, [x19, 40]
	cbz	w20, .L674
	mov	w0, 0
	add	x23, x19, 32
	bl	SM_CloseSCDDrv
	ldr	w0, [x19, 48]
	ldr	x1, [x19, 40]
	bl	MEM_ReleaseMemBlock
	b	.L672
	.size	VCTRL_DeinitScdHal, .-VCTRL_DeinitScdHal
	.align	3
.LC517:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetNextDecodeMode
	.type	VCTRL_GetNextDecodeMode, %function
VCTRL_GetNextDecodeMode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w19, w2
	mov	w22, w1
	bl	_mcount
	add	w20, w19, 7
	mov	w0, 21846
	lsl	w4, w19, 1
	movk	w0, 0x5555, lsl 16
	cmp	w19, wzr
	csel	w20, w20, w19, lt
	ldr	x2, .LC519
	smull	x0, w4, w0
	asr	w20, w20, 3
	mov	w6, w22
	lsr	x0, x0, 32
	mov	w5, w19
	sub	w4, w0, w4, asr 31
	mov	w3, w20
	mov	w1, 4656
	mov	w0, 25
	bl	dprint_normal
	cmp	w21, 3
	beq	.L687
	cmp	w19, w22
	mov	w19, w21
	blt	.L688
.L684:
	ldr	x2, .LC525
	mov	w4, w19
	mov	w3, w21
	mov	w1, 4675
	mov	w0, 25
	bl	dprint_normal
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L688:
	ldr	x2, .LC523
	mov	w1, 4670
	mov	w0, 25
	mov	w19, 3
	bl	dprint_normal
	b	.L684
	.p2align 3
.L687:
	cmp	w20, w22
	mov	w19, w21
	ble	.L684
	ldr	x2, .LC521
	mov	w1, 4662
	mov	w0, 25
	mov	w19, 0
	bl	dprint_normal
	b	.L684
	.size	VCTRL_GetNextDecodeMode, .-VCTRL_GetNextDecodeMode
	.align	3
.LC519:
	.xword	.LC518
	.align	3
.LC521:
	.xword	.LC520
	.align	3
.LC523:
	.xword	.LC522
	.align	3
.LC525:
	.xword	.LC524
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanPriorityTab
	.type	VCTRL_GetChanPriorityTab, %function
VCTRL_GetChanPriorityTab:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC528
	mov	x0, 0
.L692:
	add	x1, x2, 64
	ldr	x1, [x1, x0, lsl 3]
	cbz	x1, .L690
	ldr	w1, [x1, 28]
	str	w1, [x19, x0, lsl 2]
.L691:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L692
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L690:
	str	wzr, [x19, x0, lsl 2]
	b	.L691
	.size	VCTRL_GetChanPriorityTab, .-VCTRL_GetChanPriorityTab
	.align	3
.LC528:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanIDByCtx
	.type	VCTRL_GetChanIDByCtx, %function
VCTRL_GetChanIDByCtx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L704
	ldr	x3, .LC534
	mov	x0, 0
.L698:
	add	x1, x3, 64
	ldr	x2, [x1, x0, lsl 3]
	add	x1, x2, 221184
	add	x1, x1, 120
	cbz	x2, .L697
	cmp	x19, x1
	beq	.L696
.L697:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L698
	mov	w0, -1
.L696:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L704:
	ldr	x3, .LC532
	mov	w4, 4703
	ldr	x5, .LC531
	mov	w1, w4
	ldr	x2, .LC533
	add	x3, x3, 760
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L696
	.size	VCTRL_GetChanIDByCtx, .-VCTRL_GetChanIDByCtx
	.align	3
.LC531:
	.xword	.LC530
	.align	3
.LC532:
	.xword	.LANCHOR3
	.align	3
.LC533:
	.xword	.LC105
	.align	3
.LC534:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DecChanProcessPts
	.type	VCTRL_DecChanProcessPts, %function
VCTRL_DecChanProcessPts:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x21, .LC536
	add	x22, x21, 64
	ldr	x6, [x22, w20, sxtw 3]
	add	x6, x6, 217088
	ldr	w2, [x6, 3080]
	cmp	w2, 6
	sub	w0, w2, #2
	ccmp	w2, 18, 4, ne
	ccmp	w0, 1, 0, ne
	bls	.L728
	ldr	x4, [x19, 40]
	cmn	x4, #1
	beq	.L729
	str	x4, [x6, 3320]
.L716:
	ldr	x5, [x19, 56]
	mov	w3, w20
	str	x5, [x6, 3336]
	mov	w1, 4824
	ldr	x2, .LC542
	ldr	x0, [x19, 64]
	str	x0, [x6, 3352]
	mov	w0, 24
	ldr	w7, [x19, 72]
	str	w7, [x6, 3368]
	ldr	w7, [x19, 76]
	str	w7, [x6, 3372]
	ldr	w7, [x19, 80]
	str	w7, [x6, 3376]
	ldr	w7, [x19, 84]
	str	w7, [x6, 3392]
	ldrb	w7, [x19, 20]
	strb	w7, [x6, 3316]
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L729:
	ldr	x4, [x6, 3320]
	b	.L716
	.p2align 3
.L728:
	add	x3, x19, 8
	add	x1, x6, 3856
	mov	w0, w20
	bl	IsNewpicSeg
	cbnz	w0, .L707
	ldr	x0, [x22, w20, sxtw 3]
	add	x0, x0, 217088
	ldr	w1, [x0, 3080]
	cmp	w1, 3
	ldr	x1, [x0, 3328]
	beq	.L726
	cmn	x1, #1
	beq	.L709
.L726:
	str	x1, [x0, 3320]
.L709:
	ldr	x3, [x0, 3344]
	mov	x2, -1
	ldr	x1, [x0, 3360]
	str	x2, [x0, 3328]
	str	x3, [x0, 3336]
	str	x1, [x0, 3352]
	cbnz	x1, .L710
	ldr	x1, [x19, 64]
	str	x1, [x0, 3352]
.L710:
	ldr	w2, [x0, 3384]
	add	x21, x21, 64
	ldr	w3, [x0, 3388]
	ldr	w1, [x0, 3396]
	ldr	w5, [x0, 3380]
	str	w2, [x0, 3372]
	ldr	x4, [x0, 3320]
	ldr	x2, .LC538
	str	w3, [x0, 3376]
	mov	w3, w20
	str	w1, [x0, 3392]
	mov	w1, 4778
	str	w5, [x0, 3368]
	mov	w0, 24
	bl	dprint_normal
	ldr	x0, [x21, w20, sxtw 3]
	add	x0, x0, 217088
	ldr	w1, [x0, 3080]
	cmp	w1, 3
	beq	.L730
.L711:
	ldr	x1, [x19, 40]
	cmn	x1, #1
	beq	.L713
.L727:
	str	x1, [x0, 3328]
.L713:
	ldr	x1, [x19, 56]
	str	x1, [x0, 3344]
	ldr	x1, [x19, 64]
	str	x1, [x0, 3360]
	ldr	w1, [x19, 72]
	str	w1, [x0, 3380]
	ldr	w1, [x19, 76]
	str	w1, [x0, 3384]
	ldr	w1, [x19, 80]
	str	w1, [x0, 3388]
	ldr	w1, [x19, 84]
	str	w1, [x0, 3396]
.L712:
	ldr	x4, [x0, 3336]
	mov	w3, w20
	ldr	x2, .LC540
	mov	w1, 4807
	mov	w0, 24
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L707:
	ldr	x0, [x22, w20, sxtw 3]
	add	x0, x0, 217088
	ldr	w1, [x0, 3080]
	cmp	w1, 3
	bne	.L711
	b	.L712
	.p2align 3
.L730:
	ldr	x1, [x19, 40]
	b	.L727
	.size	VCTRL_DecChanProcessPts, .-VCTRL_DecChanProcessPts
	.align	3
.LC536:
	.xword	.LANCHOR0
	.align	3
.LC538:
	.xword	.LC537
	.align	3
.LC540:
	.xword	.LC539
	.align	3
.LC542:
	.xword	.LC541
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DecChanCheckDecParam
	.type	VCTRL_DecChanCheckDecParam, %function
VCTRL_DecChanCheckDecParam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC544
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w0, [x0, 128]
	cmp	w0, 20
	beq	.L732
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbnz	x0, .L734
.L732:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L734:
	mov	w0, -2
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_DecChanCheckDecParam, .-VCTRL_DecChanCheckDecParam
	.align	3
.LC544:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DecChanSyntax
	.type	VCTRL_DecChanSyntax, %function
VCTRL_DecChanSyntax:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L763
	ldr	x22, .LC549
	add	x21, x22, 64
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L764
	ldr	w1, [x0, 20]
	cmp	w1, 1
	bne	.L765
	ldr	w20, [x0, 32]
	cbnz	w20, .L766
	mov	w0, w19
	bl	IsPrintStateAllow
	mov	w23, w0
	ldr	x0, [x21, w19, sxtw 3]
	ldr	w0, [x0, 128]
	cmp	w0, 20
	beq	.L744
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbnz	x0, .L767
.L744:
	mov	w0, w19
	bl	VCTRL_GetImageBuffer
	cmp	w0, 1
	beq	.L768
	cmp	w23, 1
	mov	w20, -3
	beq	.L769
.L756:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L767:
	cmp	w23, 1
	beq	.L747
	mov	w20, -2
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L768:
	add	x0, x22, 64
	ldr	x0, [x0, w19, sxtw 3]
	add	x21, x0, 217088
	add	x24, x21, 3400
	ldrb	w1, [x24, 1]
	cbnz	w1, .L746
	add	x0, x0, 221184
	ldr	w0, [x0, 80]
	cbz	w0, .L770
.L746:
	ldr	x4, [x21, 3440]
	mov	w3, w19
	ldr	x5, [x21, 3456]
	mov	w1, 4896
	ldr	x2, .LC561
	mov	w0, 24
	add	x22, x22, 64
	bl	dprint_normal
	mov	x1, x24
	mov	w0, w19
	bl	VCTRL_DecChanProcessPts
	ldr	x1, [x22, w19, sxtw 3]
	mov	x0, x24
	add	x2, x1, 221184
	ldr	w1, [x1, 128]
	add	x2, x2, 120
	bl	DecodeStream
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L747:
	ldr	x2, .LC555
	mov	w3, w19
	mov	w1, 4862
	mov	w0, 23
	mov	w20, -2
	bl	dprint_normal
	b	.L756
	.p2align 3
.L769:
	ldr	x2, .LC557
	mov	w3, w19
	mov	w1, 4873
	mov	w0, 23
	bl	dprint_normal
	b	.L756
	.p2align 3
.L765:
	ldr	x3, .LC547
	mov	w4, 4852
	ldr	x5, .LC551
.L760:
	ldr	x2, .LC548
	add	x3, x3, 784
	mov	w1, w4
	mov	w0, 0
	mov	w20, -1
	bl	dprint_normal
	b	.L756
	.p2align 3
.L766:
	ldr	x3, .LC547
	mov	w4, 4853
	ldr	x5, .LC553
	b	.L760
	.p2align 3
.L770:
	add	x1, x21, 3408
	mov	w0, w19
	bl	SM_ReadSegStream
	cbz	w0, .L746
	cmp	w23, 1
	mov	w20, -4
	bne	.L756
	ldr	x2, .LC559
	mov	w3, w19
	mov	w1, 4888
	mov	w0, 23
	bl	dprint_normal
	b	.L756
	.p2align 3
.L763:
	ldr	x3, .LC547
	mov	w4, 4850
	ldr	x5, .LC546
	b	.L760
.L764:
	ldr	x3, .LC547
	mov	w4, 4851
	ldr	x5, .LC550
	mov	w1, w4
	ldr	x2, .LC548
	add	x3, x3, 784
	mov	w20, -1
	bl	dprint_normal
	b	.L756
	.size	VCTRL_DecChanSyntax, .-VCTRL_DecChanSyntax
	.align	3
.LC546:
	.xword	.LC103
	.align	3
.LC547:
	.xword	.LANCHOR3
	.align	3
.LC548:
	.xword	.LC105
	.align	3
.LC549:
	.xword	.LANCHOR0
	.align	3
.LC550:
	.xword	.LC358
	.align	3
.LC551:
	.xword	.LC433
	.align	3
.LC553:
	.xword	.LC552
	.align	3
.LC555:
	.xword	.LC554
	.align	3
.LC557:
	.xword	.LC556
	.align	3
.LC559:
	.xword	.LC558
	.align	3
.LC561:
	.xword	.LC560
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DecSyntax
	.type	VCTRL_DecSyntax, %function
VCTRL_DecSyntax:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC563
	mov	x0, 0
.L774:
	add	x1, x19, 64
	add	x2, x19, 992
	ldr	x1, [x1, x0, lsl 3]
	cbz	x1, .L772
	ldr	w1, [x1, 28]
	str	w1, [x2, x0, lsl 2]
.L773:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L774
	ldr	x24, .LC564
	mov	w21, -1
	.p2align 2
.L775:
	ldr	w1, [x19, 992]
	mov	w20, 1
	ldr	w0, [x19, 996]
	cmp	w1, w0
	blt	.L776
	mov	w0, w1
	mov	w20, 0
.L776:
	ldr	w1, [x19, 1000]
	cmp	w0, w1
	bge	.L803
	ldr	w0, [x19, 1004]
	mov	w20, 2
	cmp	w1, w0
	bge	.L804
.L792:
	mov	w20, 3
	add	x3, x19, 992
	add	x1, x19, 96
	add	w2, w20, 1
	cmp	w0, wzr
	sxtw	x23, w20
	str	wzr, [x3, w20, sxtw 2]
	str	w2, [x1, 28]
	ble	.L779
.L807:
	add	x0, x19, 64
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L775
	ldr	w1, [x0, 20]
	cmp	w1, 1
	bne	.L775
	add	x0, x0, 217088
	ldr	w1, [x0, 3104]
	cmp	w1, wzr
	ble	.L781
	ldr	w0, [x0, 3108]
	cbz	w0, .L805
.L781:
	mov	w22, 500
	b	.L789
	.p2align 3
.L784:
	cbnz	w21, .L806
	ldr	x0, [x0, x23, lsl 3]
	add	x0, x0, 221184
	ldr	w1, [x0, 100]
	cmp	w1, 1
	beq	.L787
	subs	w22, w22, #1
	beq	.L775
.L789:
	mov	w0, w20
	bl	VCTRL_DecChanSyntax
	mov	w21, w0
	cmn	w21, #1
	add	x0, x19, 64
	bne	.L784
	ldr	x4, [x19, 1008]
	cbz	x4, .L785
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	mov	w0, w20
	blr	x4
.L785:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L803:
	mov	w1, w0
	ldr	w0, [x19, 1004]
	cmp	w1, w0
	blt	.L792
.L804:
	mov	w0, w1
	add	x3, x19, 992
	add	x1, x19, 96
	add	w2, w20, 1
	cmp	w0, wzr
	sxtw	x23, w20
	str	wzr, [x3, w20, sxtw 2]
	str	w2, [x1, 28]
	bgt	.L807
.L779:
	str	wzr, [x1, 28]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L806:
	add	x0, x19, 64
	ldr	x0, [x0, x23, lsl 3]
	add	x0, x0, 221184
.L787:
	str	wzr, [x0, 100]
	b	.L775
	.p2align 3
.L772:
	add	x1, x19, 992
	str	wzr, [x1, x0, lsl 2]
	b	.L773
	.p2align 3
.L805:
	add	x1, x29, 72
	mov	w0, w20
	bl	SM_GetInfo
	cbnz	w0, .L808
.L782:
	add	x22, x19, 64
	ldr	w1, [x29, 84]
	ldr	x21, [x22, x23, lsl 3]
	add	x21, x21, 217088
	ldr	w2, [x21, 3104]
	ldr	w0, [x21, 3296]
	bl	VCTRL_GetNextDecodeMode
	str	w0, [x21, 3296]
	ldr	x1, [x22, x23, lsl 3]
	add	x0, x1, 217088
	ldr	w1, [x0, 3296]
	cbz	w1, .L783
	str	wzr, [x0, 3288]
	str	wzr, [x0, 3292]
	b	.L781
.L783:
	ldr	w1, [x0, 3100]
	str	w1, [x0, 3288]
	str	w1, [x0, 3292]
	b	.L781
.L808:
	ldr	x3, [x24, 96]
	mov	x2, 24
	mov	w1, 0
	add	x0, x29, 72
	blr	x3
	b	.L782
	.size	VCTRL_DecSyntax, .-VCTRL_DecSyntax
	.align	3
.LC563:
	.xword	.LANCHOR0
	.align	3
.LC564:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanVoQue
	.type	VCTRL_GetChanVoQue, %function
VCTRL_GetChanVoQue:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L819
	ldr	x0, .LC568
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L819
	ldr	w1, [x0, 128]
	cmp	w1, 20
	bls	.L820
.L819:
	mov	x0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L820:
	ldr	x2, .LC569
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx812
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx812:
	.section	.rodata
	.align	0
	.align	2
.L812:
	.byte	(.L816 - .Lrtx812) / 4
	.byte	(.L819 - .Lrtx812) / 4
	.byte	(.L813 - .Lrtx812) / 4
	.byte	(.L814 - .Lrtx812) / 4
	.byte	(.L819 - .Lrtx812) / 4
	.byte	(.L819 - .Lrtx812) / 4
	.byte	(.L819 - .Lrtx812) / 4
	.byte	(.L819 - .Lrtx812) / 4
	.byte	(.L819 - .Lrtx812) / 4
	.byte	(.L819 - .Lrtx812) / 4
	.byte	(.L819 - .Lrtx812) / 4
	.byte	(.L819 - .Lrtx812) / 4
	.byte	(.L819 - .Lrtx812) / 4
	.byte	(.L819 - .Lrtx812) / 4
	.byte	(.L819 - .Lrtx812) / 4
	.byte	(.L819 - .Lrtx812) / 4
	.byte	(.L815 - .Lrtx812) / 4
	.byte	(.L819 - .Lrtx812) / 4
	.byte	(.L819 - .Lrtx812) / 4
	.byte	(.L819 - .Lrtx812) / 4
	.byte	(.L816 - .Lrtx812) / 4
	.text
	.p2align 3
.L816:
	add	x0, x0, 221184
	ldr	x19, [sp, 16]
	add	x0, x0, 128
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L815:
	add	x0, x0, 229376
	ldr	x19, [sp, 16]
	add	x0, x0, 296
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L814:
	add	x0, x0, 303104
	ldr	x19, [sp, 16]
	add	x0, x0, 248
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L813:
	add	x0, x0, 241664
	ldr	x19, [sp, 16]
	add	x0, x0, 2280
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetChanVoQue, .-VCTRL_GetChanVoQue
	.align	3
.LC568:
	.xword	.LANCHOR0
	.align	3
.LC569:
	.xword	.L812
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanImgNum
	.type	VCTRL_GetChanImgNum, %function
VCTRL_GetChanImgNum:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	x23, x1
	mov	x21, x2
	mov	x22, x3
	bl	_mcount
	cmp	w19, 3
	bhi	.L835
	ldr	x20, .LC574
	add	x20, x20, 64
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L836
	cbz	x23, .L837
	cbz	x21, .L838
	cbz	x22, .L839
	mov	w0, w19
	bl	VCTRL_GetChanVoQue
	cbz	x0, .L828
	mov	x2, x22
	mov	x1, x21
	bl	SYNTAX_GetQueueImgNum
	ldr	x0, [x20, w19, sxtw 3]
	ldr	w4, [x0, 128]
	cbz	w4, .L840
	cmp	w4, 16
	beq	.L841
	cmp	w4, 17
	beq	.L842
	cmp	w4, 15
	beq	.L843
	cmp	w4, 18
	beq	.L844
	mov	w0, 2
	str	w0, [x23]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L835:
	ldr	x3, .LC572
	mov	w4, 5107
	ldr	x5, .LC571
.L834:
	ldr	x2, .LC573
	add	x3, x3, 808
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L821:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L828:
	str	wzr, [x22]
	str	wzr, [x21]
	str	wzr, [x23]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L840:
	add	x0, x0, 245760
	ldr	w0, [x0, 3824]
	str	w0, [x23]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L841:
	add	x0, x0, 221184
	ldr	x0, [x0, 2504]
	ldr	w0, [x0, 184]
	str	w0, [x23]
	b	.L821
	.p2align 3
.L843:
	ldr	x3, .LC572
	mov	w1, 5148
	ldr	x2, .LC583
	mov	w0, 32
	add	x3, x3, 808
	bl	dprint_normal
	b	.L821
	.p2align 3
.L836:
	ldr	x3, .LC572
	mov	w4, 5108
	ldr	x5, .LC575
	mov	w1, w4
	ldr	x2, .LC573
	add	x3, x3, 808
	bl	dprint_normal
	b	.L821
	.p2align 3
.L837:
	ldr	x3, .LC572
	mov	w4, 5109
	ldr	x5, .LC577
	b	.L834
	.p2align 3
.L838:
	ldr	x3, .LC572
	mov	w4, 5110
	ldr	x5, .LC579
	b	.L834
	.p2align 3
.L839:
	ldr	x3, .LC572
	mov	w4, 5111
	ldr	x5, .LC581
	b	.L834
	.p2align 3
.L844:
	ldr	x3, .LC572
	mov	w1, 5156
	ldr	x2, .LC583
	mov	w0, 32
	add	x3, x3, 808
	bl	dprint_normal
	b	.L821
	.p2align 3
.L842:
	ldr	x3, .LC572
	mov	w1, 5140
	ldr	x2, .LC583
	mov	w0, 32
	add	x3, x3, 808
	bl	dprint_normal
	b	.L821
	.size	VCTRL_GetChanImgNum, .-VCTRL_GetChanImgNum
	.align	3
.LC571:
	.xword	.LC103
	.align	3
.LC572:
	.xword	.LANCHOR3
	.align	3
.LC573:
	.xword	.LC105
	.align	3
.LC574:
	.xword	.LANCHOR0
	.align	3
.LC575:
	.xword	.LC334
	.align	3
.LC577:
	.xword	.LC576
	.align	3
.LC579:
	.xword	.LC578
	.align	3
.LC581:
	.xword	.LC580
	.align	3
.LC583:
	.xword	.LC582
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanState
	.type	VCTRL_GetChanState, %function
VCTRL_GetChanState:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 3
	bhi	.L851
	ldr	x22, .LC588
	sxtw	x21, w20
	add	x23, x22, 64
	ldr	x0, [x23, w20, sxtw 3]
	cbz	x0, .L852
	cbz	x19, .L853
	ldr	x0, .LC592
	mov	x2, 100
	mov	w1, 0
	str	wzr, [x29, 84]
	stp	wzr, wzr, [x29, 76]
	ldr	x3, [x0, 96]
	mov	x0, x19
	add	x22, x22, 560
	blr	x3
	ldr	x1, [x23, w20, sxtw 3]
	mov	w0, w20
	add	x1, x1, 217088
	ldr	w2, [x1, 3872]
	str	w2, [x19, 32]
	ldr	w2, [x1, 3876]
	str	w2, [x19, 36]
	ldr	w1, [x1, 3880]
	str	w1, [x19, 44]
	bl	FSP_GetWaitDispFsNum
	str	w0, [x19, 84]
	mov	w0, w20
	bl	FSP_GetTotalDispFsNum
	str	w0, [x19, 92]
	add	x3, x29, 84
	add	x2, x29, 80
	add	x1, x29, 76
	mov	w0, w20
	bl	VCTRL_GetChanImgNum
	lsl	x0, x21, 2
	sub	x0, x0, x21
	lsl	x2, x0, 5
	add	x0, x0, x2
	ldp	w3, w1, [x29, 80]
	add	x21, x0, x21
	add	x21, x22, x21
	add	w0, w3, w1
	str	w0, [x19, 48]
	add	x1, x29, 88
	mov	w0, w20
	ldr	w2, [x21, 96]
	str	w2, [x19, 96]
	ldr	w2, [x21, 8]
	str	w2, [x19, 20]
	bl	SM_GetInfo
	ldp	w2, w4, [x29, 104]
	ldr	x3, [x23, w20, sxtw 3]
	mov	x0, 36984
	movk	x0, 0x3, lsl 16
	ldr	w1, [x29, 96]
	add	x0, x3, x0
	cmp	w4, 10
	stp	w2, w1, [x19, 52]
	cset	w1, gt
	str	w1, [x19, 80]
	ldrb	w0, [x0, 3544]
	and	w0, w0, 1
	str	w0, [x19, 88]
.L845:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L851:
	ldr	x3, .LC586
	mov	w4, 1273
	ldr	x5, .LC585
.L850:
	ldr	x2, .LC587
	add	x3, x3, 832
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L853:
	ldr	x3, .LC586
	mov	w4, 1275
	ldr	x5, .LC591
	b	.L850
	.p2align 3
.L852:
	ldr	x3, .LC586
	mov	w4, 1274
	ldr	x5, .LC589
	mov	w1, w4
	ldr	x2, .LC587
	add	x3, x3, 832
	bl	dprint_normal
	b	.L845
	.size	VCTRL_GetChanState, .-VCTRL_GetChanState
	.align	3
.LC585:
	.xword	.LC343
	.align	3
.LC586:
	.xword	.LANCHOR3
	.align	3
.LC587:
	.xword	.LC105
	.align	3
.LC588:
	.xword	.LANCHOR0
	.align	3
.LC589:
	.xword	.LC348
	.align	3
.LC591:
	.xword	.LC590
	.align	3
.LC592:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetVfmwProcHandler
	.type	VCTRL_GetVfmwProcHandler, %function
VCTRL_GetVfmwProcHandler:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbz	w19, .L858
	ldr	x5, .LC597
	mov	w3, 1
	ldr	x0, .LC595
	add	x5, x5, 856
	b	.L856
	.p2align 3
.L857:
	lsl	x1, x2, 2
	add	w4, w3, 1
	sub	x1, x1, x2
	lsl	x2, x4, 2
	lsl	x1, x1, 4
	sub	x2, x2, x4
	mov	x3, x4
	add	x2, x5, x2, lsl 4
	ldr	w1, [x5, x1]
	cmp	w1, w19
	beq	.L855
	ldr	x0, [x2, 8]
.L856:
	uxtw	x2, w3
	cbnz	x0, .L857
.L855:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L858:
	ldr	x0, .LC596
	b	.L855
	.size	VCTRL_GetVfmwProcHandler, .-VCTRL_GetVfmwProcHandler
	.align	3
.LC595:
	.xword	VfmwProc_SetErrorThreshold
	.align	3
.LC596:
	.xword	VfmwProc_SetPrintLevel
	.align	3
.LC597:
	.xword	.LANCHOR3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ShowProcCommand
	.type	VCTRL_ShowProcCommand, %function
VCTRL_ShowProcCommand:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x21, x1
	mov	x0, x30
	mov	w20, w2
	bl	_mcount
	cbz	x21, .L863
	cmp	w19, 40
	bhi	.L862
	uxtw	x0, w19
	ldr	x3, .LC601
	lsl	x1, x0, 2
	ldr	x5, .LC603
	sub	x0, x1, x0
	add	x3, x3, 856
	lsl	x0, x0, 4
	ldr	x2, .LC605
	add	x4, x0, 16
	ldr	x5, [x5, 136]
	add	x4, x3, x4
	uxtw	x1, w20
	ldr	w3, [x3, x0]
	sub	w20, w20, #1
	mov	x0, x21
	blr	x5
	strb	wzr, [x21, x20]
	mov	w0, 0
.L861:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L862:
	mov	w0, -1
	b	.L861
.L863:
	ldr	x3, .LC601
	mov	w4, 6148
	ldr	x5, .LC600
	mov	w1, w4
	ldr	x2, .LC602
	add	x3, x3, 2872
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L861
	.size	VCTRL_ShowProcCommand, .-VCTRL_ShowProcCommand
	.align	3
.LC600:
	.xword	.LC599
	.align	3
.LC601:
	.xword	.LANCHOR3
	.align	3
.LC602:
	.xword	.LC105
	.align	3
.LC603:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC605:
	.xword	.LC604
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetDbgOption
	.type	VCTRL_SetDbgOption, %function
VCTRL_SetDbgOption:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L874
	cbz	w19, .L871
	ldr	x6, .LC609
	mov	w4, 1
	ldr	x7, .LC607
	add	x6, x6, 856
	b	.L867
	.p2align 3
.L872:
	lsl	x0, x2, 2
	add	w5, w4, 1
	sub	x0, x0, x2
	lsl	x2, x5, 2
	lsl	x0, x0, 4
	sub	x2, x2, x5
	mov	x4, x5
	add	x2, x6, x2, lsl 4
	ldr	w0, [x6, x0]
	cmp	w19, w0
	beq	.L866
	ldr	x7, [x2, 8]
.L867:
	uxtw	x2, w4
	cbnz	x7, .L872
	ldr	x2, .LC611
	mov	w3, w19
	mov	w1, 6179
	mov	w0, 32
	bl	dprint_normal
.L874:
	mov	w0, -2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L871:
	ldr	x7, .LC608
.L866:
	mov	x0, x20
	blr	x7
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetDbgOption, .-VCTRL_SetDbgOption
	.align	3
.LC607:
	.xword	VfmwProc_SetErrorThreshold
	.align	3
.LC608:
	.xword	VfmwProc_SetPrintLevel
	.align	3
.LC609:
	.xword	.LANCHOR3
	.align	3
.LC611:
	.xword	.LC610
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetLastFrameState
	.type	VCTRL_SetLastFrameState, %function
VCTRL_SetLastFrameState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 3
	bhi	.L881
	ldr	x0, .LC613
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L875
	str	w20, [x0, 140]
.L875:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L881:
	bl	VCTRL_SetLastFrameState.part.19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetLastFrameState, .-VCTRL_SetLastFrameState
	.align	3
.LC613:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ReportLastFrame
	.type	VCTRL_ReportLastFrame, %function
VCTRL_ReportLastFrame:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	w20, w1
	mov	x0, x30
	bl	_mcount
	cbz	w20, .L889
	cmp	w20, 1
	mov	w0, 3
	mov	w1, 4
	csel	w0, w0, w1, eq
	cmp	w19, 3
	bhi	.L896
.L886:
	ldr	x1, .LC615
	add	x2, x1, 64
	ldr	x2, [x2, w19, sxtw 3]
	cbz	x2, .L887
	str	w0, [x2, 140]
.L887:
	ldr	x4, [x1, 1008]
	cbz	x4, .L882
	add	x2, x29, 48
	mov	w3, 4
	mov	w1, 44
	mov	w0, w19
	str	w20, [x2, -8]!
	blr	x4
.L882:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L889:
	cmp	w19, 3
	mov	w0, 2
	bls	.L886
.L896:
	bl	VCTRL_SetLastFrameState.part.19
	ldr	x1, .LC615
	b	.L887
	.size	VCTRL_ReportLastFrame, .-VCTRL_ReportLastFrame
	.align	3
.LC615:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_OutputLastFrame
	.type	VCTRL_OutputLastFrame, %function
VCTRL_OutputLastFrame:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	cmp	w20, 3
	bhi	.L912
	ldr	x19, .LC620
	add	x0, x19, 64
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L913
	add	x0, x0, 221184
	ldr	w1, [x0, 112]
	cmp	w1, 16
	bls	.L914
.L901:
	add	x1, x0, 112
	mov	w0, w20
	bl	SYNTAX_MarkImageEos
	cmn	w0, #1
	mov	w19, w0
	beq	.L908
	cbz	w0, .L909
	mov	w1, w0
	mov	w0, w20
	bl	VCTRL_ReportLastFrame
	ldr	x2, .LC628
	sub	w3, w19, #2
	mov	w1, 6332
	mov	w0, 3
	bl	dprint_normal
	mov	w0, w19
.L899:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L914:
	ldr	x2, .LC622
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx903
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx903:
	.section	.rodata
	.align	0
	.align	2
.L903:
	.byte	(.L902 - .Lrtx903) / 4
	.byte	(.L901 - .Lrtx903) / 4
	.byte	(.L904 - .Lrtx903) / 4
	.byte	(.L905 - .Lrtx903) / 4
	.byte	(.L901 - .Lrtx903) / 4
	.byte	(.L901 - .Lrtx903) / 4
	.byte	(.L901 - .Lrtx903) / 4
	.byte	(.L901 - .Lrtx903) / 4
	.byte	(.L901 - .Lrtx903) / 4
	.byte	(.L901 - .Lrtx903) / 4
	.byte	(.L901 - .Lrtx903) / 4
	.byte	(.L901 - .Lrtx903) / 4
	.byte	(.L901 - .Lrtx903) / 4
	.byte	(.L901 - .Lrtx903) / 4
	.byte	(.L901 - .Lrtx903) / 4
	.byte	(.L901 - .Lrtx903) / 4
	.byte	(.L906 - .Lrtx903) / 4
	.text
	.p2align 3
.L909:
	mov	w0, w20
	mov	w1, 0
	bl	VCTRL_ReportLastFrame
	ldr	x2, .LC626
	mov	w1, 6327
	mov	w0, 3
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L908:
	mov	w0, w20
	mov	w1, 1
	bl	VCTRL_ReportLastFrame
	ldr	x2, .LC624
	mov	w1, 6322
	mov	w0, 3
	bl	dprint_normal
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L906:
	add	x0, x0, 120
	add	x19, x19, 64
	bl	HEVCDEC_FlushRemainImg
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	b	.L901
	.p2align 3
.L905:
	add	x0, x0, 120
	add	x19, x19, 64
	bl	MPEG2DEC_FlushRemainImg
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	b	.L901
	.p2align 3
.L904:
	add	x0, x0, 120
	add	x19, x19, 64
	bl	MPEG4DEC_FlushRemainImg
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	b	.L901
	.p2align 3
.L902:
	add	x0, x0, 120
	add	x19, x19, 64
	bl	H264DEC_FlushRemainImg
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	b	.L901
	.p2align 3
.L912:
	ldr	x3, .LC618
	mov	w4, 6232
	ldr	x5, .LC617
	mov	w1, w4
	ldr	x2, .LC619
	add	x3, x3, 2896
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L899
.L913:
	ldr	x3, .LC618
	mov	w4, 6233
	ldr	x5, .LC621
	mov	w1, w4
	ldr	x2, .LC619
	add	x3, x3, 2896
	bl	dprint_normal
	mov	w0, -1
	b	.L899
	.size	VCTRL_OutputLastFrame, .-VCTRL_OutputLastFrame
	.align	3
.LC617:
	.xword	.LC418
	.align	3
.LC618:
	.xword	.LANCHOR3
	.align	3
.LC619:
	.xword	.LC105
	.align	3
.LC620:
	.xword	.LANCHOR0
	.align	3
.LC621:
	.xword	.LC348
	.align	3
.LC622:
	.xword	.L903
	.align	3
.LC624:
	.xword	.LC623
	.align	3
.LC626:
	.xword	.LC625
	.align	3
.LC628:
	.xword	.LC627
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_PostProc
	.type	VCTRL_PostProc, %function
VCTRL_PostProc:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w20, w0
	mov	x0, x30
	mov	w23, w3
	mov	w21, w1
	mov	x22, x2
	bl	_mcount
	ldr	x3, .LC630
	add	x0, x3, 64
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L927
	ldr	w1, [x0, 128]
	cmp	w1, 16
	bls	.L928
.L915:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L928:
	ldr	x2, .LC634
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx919
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx919:
	.section	.rodata
	.align	0
	.align	2
.L919:
	.byte	(.L918 - .Lrtx919) / 4
	.byte	(.L915 - .Lrtx919) / 4
	.byte	(.L920 - .Lrtx919) / 4
	.byte	(.L921 - .Lrtx919) / 4
	.byte	(.L915 - .Lrtx919) / 4
	.byte	(.L915 - .Lrtx919) / 4
	.byte	(.L915 - .Lrtx919) / 4
	.byte	(.L915 - .Lrtx919) / 4
	.byte	(.L915 - .Lrtx919) / 4
	.byte	(.L915 - .Lrtx919) / 4
	.byte	(.L915 - .Lrtx919) / 4
	.byte	(.L915 - .Lrtx919) / 4
	.byte	(.L915 - .Lrtx919) / 4
	.byte	(.L915 - .Lrtx919) / 4
	.byte	(.L915 - .Lrtx919) / 4
	.byte	(.L915 - .Lrtx919) / 4
	.byte	(.L922 - .Lrtx919) / 4
	.text
	.p2align 3
.L922:
	add	x0, x0, 221184
	add	x19, x3, 64
	mov	w1, w21
	mov	w5, w23
	mov	w4, 0
	mov	x3, x22
	mov	w2, 1
	add	x0, x0, 120
	bl	HEVCDEC_VDMPostProc
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	ldrb	w1, [x0, 129]
	cmp	w1, 1
	beq	.L929
	str	xzr, [x0, 2600]
.L934:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L921:
	add	x0, x0, 221184
	add	x19, x3, 64
	mov	w1, w21
	add	x0, x0, 120
	bl	MPEG2DEC_VDMPostProc
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	ldrb	w1, [x0, 138]
	cmp	w1, 1
	beq	.L930
	str	xzr, [x0, 160]
.L933:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L920:
	add	x0, x0, 221184
	add	x19, x3, 64
	mov	w1, w21
	mov	x2, x22
	add	x0, x0, 120
	bl	MPEG4DEC_VDMPostProc
	ldr	x0, [x19, w20, sxtw 3]
	add	x1, x0, 241664
	ldrb	w1, [x1, 2924]
	cmp	w1, 1
	beq	.L931
.L926:
	add	x0, x0, 221184
	str	xzr, [x0, 1160]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L918:
	add	x0, x0, 221184
	add	x19, x3, 64
	mov	w1, w21
	mov	w5, w23
	mov	w4, 0
	mov	x3, x22
	mov	w2, 1
	add	x0, x0, 120
	bl	H264DEC_VDMPostProc
	ldr	x0, [x19, w20, sxtw 3]
	add	x1, x0, 233472
	ldrb	w1, [x1, 2760]
	cmp	w1, 1
	beq	.L932
.L923:
	add	x0, x0, 221184
	str	xzr, [x0, 736]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L930:
	mov	w0, w20
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	strb	wzr, [x0, 138]
	str	xzr, [x0, 160]
	b	.L933
	.p2align 3
.L929:
	mov	w0, w20
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	strb	wzr, [x0, 129]
	str	xzr, [x0, 2600]
	b	.L934
	.p2align 3
.L927:
	ldr	x3, .LC632
	mov	w4, 3750
	ldr	x5, .LC631
	mov	w1, w4
	ldr	x2, .LC633
	add	x3, x3, 2920
	bl	dprint_normal
	b	.L915
	.p2align 3
.L931:
	mov	w0, w20
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x19, w20, sxtw 3]
	add	x1, x0, 241664
	strb	wzr, [x1, 2924]
	b	.L926
	.p2align 3
.L932:
	mov	w0, w20
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x19, w20, sxtw 3]
	add	x1, x0, 233472
	strb	wzr, [x1, 2760]
	b	.L923
	.size	VCTRL_PostProc, .-VCTRL_PostProc
	.align	3
.LC630:
	.xword	.LANCHOR0
	.align	3
.LC631:
	.xword	.LC119
	.align	3
.LC632:
	.xword	.LANCHOR3
	.align	3
.LC633:
	.xword	.LC105
	.align	3
.LC634:
	.xword	.L919
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_VdmPostProc
	.type	VCTRL_VdmPostProc, %function
VCTRL_VdmPostProc:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	x21, x2
	mov	w22, w3
	bl	_mcount
	cmp	w19, 3
	bhi	.L944
	ldr	x0, .LC639
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L945
	ldr	w0, [x0, 20]
	cmp	w0, 1
	beq	.L939
	ldr	x3, .LC637
	mov	w4, 4000
	ldr	x5, .LC641
.L943:
	ldr	x2, .LC638
	add	x3, x3, 2936
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L935:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L939:
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbz	x0, .L935
	mov	w3, w22
	mov	x2, x21
	mov	w1, w20
	mov	w0, w19
	bl	VCTRL_PostProc
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L944:
	ldr	x3, .LC637
	mov	w4, 3998
	ldr	x5, .LC636
	b	.L943
	.p2align 3
.L945:
	ldr	x3, .LC637
	mov	w4, 3999
	ldr	x5, .LC640
	mov	w1, w4
	ldr	x2, .LC638
	add	x3, x3, 2936
	bl	dprint_normal
	b	.L935
	.size	VCTRL_VdmPostProc, .-VCTRL_VdmPostProc
	.align	3
.LC636:
	.xword	.LC103
	.align	3
.LC637:
	.xword	.LANCHOR3
	.align	3
.LC638:
	.xword	.LC105
	.align	3
.LC639:
	.xword	.LANCHOR0
	.align	3
.LC640:
	.xword	.LC119
	.align	3
.LC641:
	.xword	.LC433
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ResetHardware
	.type	VCTRL_ResetHardware, %function
VCTRL_ResetHardware:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, w19
	bl	SCDDRV_ResetSCD
	mov	w0, w19
	bl	VDMDRV_ResetVDH
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_ResetHardware, .-VCTRL_ResetHardware
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_OpenHardware
	.type	VCTRL_OpenHardware, %function
VCTRL_OpenHardware:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L965
	ldr	x0, .LC647
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L966
	ldr	w1, [x0, 16]
	cmp	w1, 1
	beq	.L951
	ldr	x3, .LC645
	mov	w4, 6528
	ldr	x5, .LC651
.L964:
	ldr	x2, .LC646
	add	x3, x3, 2960
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L947:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L951:
	add	x1, x29, 48
	ldr	w19, [x0, 128]
	mov	w0, 3
	str	w19, [x1, -4]!
	bl	PDT_GetAttribute
	cbnz	w0, .L947
	add	x0, x29, 36
	add	x1, x29, 40
	bl	VCTRL_GetActiveChanNum
	ldr	w0, [x29, 36]
	cbz	w0, .L967
.L953:
	ldr	w0, [x29, 40]
	cmp	w0, wzr
	ccmp	w19, 1, 0, eq
	bne	.L947
	ldr	x0, .LC652
	ldr	x1, [x0, 56]
	cbz	x1, .L947
	mov	w0, 0
	blr	x1
	b	.L947
	.p2align 3
.L965:
	ldr	x3, .LC645
	mov	w4, 6524
	ldr	x5, .LC644
	b	.L964
	.p2align 3
.L966:
	ldr	x3, .LC645
	mov	w4, 6527
	ldr	x5, .LC649
	mov	w1, w4
	ldr	x2, .LC646
	add	x3, x3, 2960
	bl	dprint_normal
	b	.L947
	.p2align 3
.L967:
	ldr	x20, .LC652
	ldr	x1, [x20, 8]
	cbz	x1, .L968
	mov	w0, 0
	blr	x1
.L955:
	ldr	x1, [x20, 40]
	cbz	x1, .L969
	mov	w0, 0
	blr	x1
	b	.L953
.L968:
	mov	w3, 6402
	ldr	x2, .LC653
	mov	w1, w3
	bl	dprint_normal
	b	.L955
.L969:
	mov	w3, 6449
	ldr	x2, .LC653
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L953
	.size	VCTRL_OpenHardware, .-VCTRL_OpenHardware
	.align	3
.LC644:
	.xword	.LC643
	.align	3
.LC645:
	.xword	.LANCHOR3
	.align	3
.LC646:
	.xword	.LC105
	.align	3
.LC647:
	.xword	.LANCHOR0
	.align	3
.LC649:
	.xword	.LC648
	.align	3
.LC651:
	.xword	.LC650
	.align	3
.LC652:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC653:
	.xword	.LC209
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_StartChan
	.type	VCTRL_StartChan, %function
VCTRL_StartChan:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L982
	ldr	x20, .LC658
	add	x22, x20, 64
	ldr	x0, [x22, w19, sxtw 3]
	cbz	x0, .L983
	ldr	w21, [x0, 16]
	cmp	w21, 1
	bne	.L984
	ldr	w0, [x0, 128]
	cmp	w0, 22
	beq	.L985
	mov	w0, w19
	bl	SM_Start
	ldr	x0, [x22, w19, sxtw 3]
	str	w21, [x0, 24]
	str	wzr, [x0, 32]
	str	w21, [x0, 124]
	ldr	x0, [x22, w19, sxtw 3]
	ldr	w1, [x0, 28]
	cbnz	w1, .L976
	ldr	x4, .LC663
	mov	x3, x20
	str	w21, [x0, 28]
	mov	x0, 0
.L979:
	add	x1, x20, 64
	add	x2, x3, 1016
	ldr	x1, [x1, x0, lsl 3]
	cbz	x1, .L977
	ldr	w1, [x1, 28]
	str	w1, [x2, x0, lsl 2]
	str	w1, [x4, x0, lsl 2]
.L978:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L979
	add	x0, x20, 1016
	bl	VDMDRV_SetPriority
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
.L976:
	mov	w0, w19
	add	x20, x20, 64
	bl	VDMDRV_ClearChanIsDec
	mov	w0, w19
	bl	VCTRL_OpenHardware
	ldr	x21, .LC664
	ldr	x0, .LC665
	mov	x2, 12
	mov	w1, 0
	ldr	x3, [x21, 96]
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 720
	ldr	x0, .LC666
	mov	w1, 0
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 2
	ldr	x0, .LC667
	mov	w1, 0
	blr	x3
	ldr	x0, .LC668
	mov	x2, 120
	ldr	x3, [x21, 96]
	mov	w1, 0
	blr	x3
	ldr	x1, [x20, w19, sxtw 3]
	mov	w2, 1
	mov	w0, 0
	str	w2, [x1, 20]
.L972:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L977:
	add	x1, x3, 1016
	str	wzr, [x4, x0, lsl 2]
	str	wzr, [x1, x0, lsl 2]
	b	.L978
	.p2align 3
.L984:
	ldr	x3, .LC656
	mov	w4, 2274
	ldr	x5, .LC660
.L981:
	ldr	x2, .LC657
	add	x3, x3, 2984
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L972
.L982:
	ldr	x3, .LC656
	mov	w4, 2272
	ldr	x5, .LC655
	b	.L981
.L985:
	ldr	x3, .LC656
	mov	w4, 2275
	ldr	x5, .LC662
	b	.L981
.L983:
	ldr	x3, .LC656
	mov	w4, 2273
	ldr	x5, .LC659
	mov	w1, w4
	ldr	x2, .LC657
	add	x3, x3, 2984
	bl	dprint_normal
	mov	w0, -1
	b	.L972
	.size	VCTRL_StartChan, .-VCTRL_StartChan
	.align	3
.LC655:
	.xword	.LC103
	.align	3
.LC656:
	.xword	.LANCHOR3
	.align	3
.LC657:
	.xword	.LC105
	.align	3
.LC658:
	.xword	.LANCHOR0
	.align	3
.LC659:
	.xword	.LC279
	.align	3
.LC660:
	.xword	.LC451
	.align	3
.LC662:
	.xword	.LC661
	.align	3
.LC663:
	.xword	g_ChanCtx
	.align	3
.LC664:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC665:
	.xword	g_TimeRecId
	.align	3
.LC666:
	.xword	g_TimeRecTable
	.align	3
.LC667:
	.xword	g_DataRecId
	.align	3
.LC668:
	.xword	g_DataTable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_TestStartChan, %function
VfmwProc_TestStartChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	mov	w0, w19
	bl	VCTRL_StartChan
	mov	w4, w0
	ldr	x2, .LC672
	mov	w3, w19
	mov	w1, 5793
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestStartChan, .-VfmwProc_TestStartChan
	.align	3
.LC672:
	.xword	.LC671
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CloseHardware
	.type	VCTRL_CloseHardware, %function
VCTRL_CloseHardware:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L999
	ldr	x0, .LC676
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1000
	ldr	w1, [x0, 16]
	cmp	w1, 1
	beq	.L991
	ldr	x3, .LC674
	mov	w4, 6570
	ldr	x5, .LC678
.L998:
	ldr	x2, .LC675
	add	x3, x3, 3000
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L987:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L991:
	add	x1, x29, 48
	ldr	w20, [x0, 128]
	mov	w0, 3
	str	w20, [x1, -4]!
	bl	PDT_GetAttribute
	cbnz	w0, .L987
	add	x0, x29, 36
	add	x1, x29, 40
	bl	VCTRL_GetActiveChanNum
	ldr	w0, [x29, 36]
	cbz	w0, .L1001
.L993:
	ldr	w0, [x29, 40]
	cmp	w0, wzr
	ccmp	w20, 1, 0, eq
	bne	.L987
	ldr	x0, .LC679
	ldr	x1, [x0, 64]
	cbz	x1, .L987
	mov	w0, 0
	blr	x1
	b	.L987
	.p2align 3
.L999:
	ldr	x3, .LC674
	mov	w4, 6566
	ldr	x5, .LC673
	b	.L998
	.p2align 3
.L1000:
	ldr	x3, .LC674
	mov	w4, 6569
	ldr	x5, .LC677
	mov	w1, w4
	ldr	x2, .LC675
	add	x3, x3, 3000
	bl	dprint_normal
	b	.L987
	.p2align 3
.L1001:
	mov	w0, w19
	bl	SCDDRV_ResetSCD
	mov	w0, w19
	bl	VDMDRV_ResetVDH
	b	.L993
	.size	VCTRL_CloseHardware, .-VCTRL_CloseHardware
	.align	3
.LC673:
	.xword	.LC643
	.align	3
.LC674:
	.xword	.LANCHOR3
	.align	3
.LC675:
	.xword	.LC105
	.align	3
.LC676:
	.xword	.LANCHOR0
	.align	3
.LC677:
	.xword	.LC648
	.align	3
.LC678:
	.xword	.LC650
	.align	3
.LC679:
	.xword	g_vdm_hal_fun_ptr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_StopChan
	.type	VCTRL_StopChan, %function
VCTRL_StopChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 3
	bhi	.L1008
	ldr	x20, .LC684
	add	x20, x20, 64
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1009
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L1007
	str	wzr, [x0, 20]
	str	w1, [x0, 32]
	mov	w0, w19
	bl	SM_Stop
	cbnz	w0, .L1007
	mov	w1, 0
	mov	w0, w19
	bl	DeleteRawPacketInBuffer
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	ldr	x1, [x20, w19, sxtw 3]
	mov	w0, w19
	str	wzr, [x1, 32]
	bl	VCTRL_CloseHardware
	mov	w0, 0
.L1004:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1007:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1008:
	ldr	x3, .LC682
	mov	w4, 2357
	ldr	x5, .LC681
	mov	w1, w4
	ldr	x2, .LC683
	add	x3, x3, 3024
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1004
.L1009:
	ldr	x3, .LC682
	mov	w4, 2358
	ldr	x5, .LC686
	mov	w1, w4
	ldr	x2, .LC683
	add	x3, x3, 3024
	bl	dprint_normal
	mov	w0, -1
	b	.L1004
	.size	VCTRL_StopChan, .-VCTRL_StopChan
	.align	3
.LC681:
	.xword	.LC103
	.align	3
.LC682:
	.xword	.LANCHOR3
	.align	3
.LC683:
	.xword	.LC105
	.align	3
.LC684:
	.xword	.LANCHOR0
	.align	3
.LC686:
	.xword	.LC685
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_StopChanWithCheck
	.type	VCTRL_StopChanWithCheck, %function
VCTRL_StopChanWithCheck:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w22, w0
	mov	x0, x30
	mov	w20, 0
	bl	_mcount
	ldr	x19, .LC688
	b	.L1012
	.p2align 3
.L1016:
	ldr	x1, [x19, 240]
	mov	w0, 10
	add	w20, w20, 1
	blr	x1
	cmp	w20, 50
	beq	.L1014
.L1012:
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
	mov	w0, w22
	bl	VCTRL_StopChan
	mov	w21, w0
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	cbnz	w21, .L1016
	cmp	w20, 49
	bgt	.L1014
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1014:
	ldr	x2, .LC690
	mov	w1, 2346
	mov	w0, 0
	mov	w21, -1
	bl	dprint_normal
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VCTRL_StopChanWithCheck, .-VCTRL_StopChanWithCheck
	.align	3
.LC688:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC690:
	.xword	.LC689
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ResetChanWithOption
	.type	VCTRL_ResetChanWithOption, %function
VCTRL_ResetChanWithOption:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	sxtw	x19, w0
	mov	x0, x30
	mov	x24, x1
	bl	_mcount
	ldr	x20, .LC691
	ldr	x0, [x20]
	blr	x0
	mov	w22, w0
	cmp	w19, 3
	bhi	.L1038
	ldr	x21, .LC695
	add	x26, x21, 64
	ldr	x0, [x26, w19, sxtw 3]
	cbz	x0, .L1039
	ldr	x23, .LC693
	mov	w4, 2966
	ldr	x2, .LC698
	mov	w1, w4
	add	x3, x23, 3040
	mov	w0, 26
	add	x27, x23, 3072
	bl	dprint_normal
	ldr	x1, [x26, w19, sxtw 3]
	mov	w0, w19
	ldr	w25, [x1, 20]
	bl	VCTRL_StopChan
	ldr	x1, [x20, 24]
	mov	w0, 4
	blr	x1
	ldr	x1, [x26, w19, sxtw 3]
	cbz	x1, .L1040
	add	x1, x1, 221184
	mov	w0, w19
	add	x1, x1, 112
	bl	SYNTAX_MarkImageOutHanging
.L1022:
	add	x26, x21, 64
	mov	w0, w19
	bl	FSP_ResetInstance
	ldr	x0, [x26, w19, sxtw 3]
	ldr	w1, [x24, 4]
	add	x0, x0, 217088
	str	w1, [x0, 3924]
	mov	w0, w19
	bl	VCTRL_InitSyntaxCtx
	ldr	x0, [x26, w19, sxtw 3]
	mov	x2, 456
	ldr	x3, [x20, 96]
	mov	w1, 0
	add	x0, x0, 217088
	add	x0, x0, 3400
	blr	x3
	ldr	x1, [x26, w19, sxtw 3]
	mov	x2, -1
	add	x0, x1, 217088
	str	x2, [x0, 3320]
	str	x2, [x0, 3328]
	add	x2, x1, 221184
	str	wzr, [x0, 3856]
	mov	w0, w19
	str	wzr, [x2, 80]
	str	wzr, [x1, 52]
	stp	wzr, wzr, [x1, 60]
	str	wzr, [x1, 68]
	stp	wzr, wzr, [x1, 108]
	bl	InitUsdPool
	ldr	x1, [x20, 32]
	mov	w0, 4
	blr	x1
	ldr	w0, [x24]
	cbz	w0, .L1041
.L1023:
	ldr	w0, [x21, 20]
	cbnz	w0, .L1042
.L1024:
	cbnz	w25, .L1043
.L1028:
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	mov	w4, 3019
	ldr	x2, .LC701
	mov	w1, w4
	add	x3, x23, 3040
	mov	w0, 26
	bl	dprint_normal
	ldr	x0, [x20]
	blr	x0
	sub	w22, w0, w22
	lsl	x1, x19, 2
	mov	w0, 0
	sub	x1, x1, x19
	lsl	x2, x1, 5
	add	x1, x1, x2
	add	x19, x1, x19
	add	x19, x21, x19
	str	w22, [x19, 620]
.L1019:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1042:
	add	x24, x21, 432
	str	w19, [x29, 108]
	ldr	x0, [x24, w19, sxtw 3]
	cbz	x0, .L1024
	mov	w0, 512
	add	x1, x29, 108
	bl	VCTRL_SetDbgOption
	ldr	x0, [x24, w19, sxtw 3]
	cbz	x0, .L1024
	add	x1, x29, 108
	mov	w0, 512
	bl	VCTRL_SetDbgOption
	cbz	w25, .L1028
.L1043:
	mov	w0, w19
	bl	VCTRL_StartChan
	b	.L1028
	.p2align 3
.L1041:
	mov	w0, w19
	bl	SM_Reset
	b	.L1023
	.p2align 3
.L1040:
	mov	w4, 2916
	ldr	x5, .LC699
	ldr	x2, .LC694
	mov	x3, x27
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	b	.L1022
	.p2align 3
.L1038:
	ldr	x3, .LC693
	mov	w4, 2963
	ldr	x5, .LC692
	mov	w1, w4
	ldr	x2, .LC694
	add	x3, x3, 3040
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1019
.L1039:
	ldr	x3, .LC693
	mov	w4, 2964
	ldr	x5, .LC696
	mov	w1, w4
	ldr	x2, .LC694
	add	x3, x3, 3040
	bl	dprint_normal
	mov	w0, -1
	b	.L1019
	.size	VCTRL_ResetChanWithOption, .-VCTRL_ResetChanWithOption
	.align	3
.LC691:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC692:
	.xword	.LC343
	.align	3
.LC693:
	.xword	.LANCHOR3
	.align	3
.LC694:
	.xword	.LC105
	.align	3
.LC695:
	.xword	.LANCHOR0
	.align	3
.LC696:
	.xword	.LC348
	.align	3
.LC698:
	.xword	.LC697
	.align	3
.LC699:
	.xword	.LC119
	.align	3
.LC701:
	.xword	.LC700
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ResetChan
	.type	VCTRL_ResetChan, %function
VCTRL_ResetChan:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC705
	mov	x2, 12
	mov	w1, 0
	add	x0, x29, 32
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 32
	mov	w0, w19
	bl	VCTRL_ResetChanWithOption
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	VCTRL_ResetChan, .-VCTRL_ResetChan
	.align	3
.LC705:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CreateChan
	.type	VCTRL_CreateChan, %function
VCTRL_CreateChan:
	stp	x29, x30, [sp, -304]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	w27, w0
	mov	x0, x30
	mov	x20, x1
	mov	w19, w2
	bl	_mcount
	ldr	x21, .LC706
	ldr	x0, [x21]
	blr	x0
	mov	w24, w0
	ldr	x4, [x21, 96]
	mov	x2, 40
	mov	w1, 0
	add	x0, x29, 168
	blr	x4
	ldr	x4, [x21, 96]
	mov	x2, 96
	mov	w1, 0
	add	x0, x29, 208
	blr	x4
	ldr	x4, [x21, 96]
	mov	x2, 12
	mov	w1, 0
	add	x0, x29, 104
	blr	x4
	ldr	x4, [x21, 96]
	mov	x2, 12
	mov	w1, 0
	add	x0, x29, 120
	blr	x4
	cbz	x20, .L1116
	ldr	w0, [x20, 28]
	tbnz	w0, #31, .L1048
	ldr	w1, [x20, 44]
	mov	w0, 262143
	cmp	w1, w0
	ble	.L1048
	ldr	w0, [x20, 36]
	cmp	w0, 1
	beq	.L1117
.L1049:
	ldr	w0, [x20, 160]
	cmp	w0, 1
	bls	.L1050
	str	wzr, [x20, 160]
.L1050:
	mov	w3, w19
	add	x2, x29, 120
	mov	x1, x20
	mov	w0, w27
	stp	wzr, wzr, [x20, 172]
	bl	VCTRL_GetChanMemSize
	cbnz	w0, .L1118
	ldr	x25, .LC713
	add	x0, x25, 64
	ldr	x1, [x25, 64]
	cbz	x1, .L1119
	ldr	x1, [x0, 8]
	cbz	x1, .L1090
	ldr	x1, [x0, 16]
	cbz	x1, .L1091
	ldr	x0, [x0, 24]
	cbz	x0, .L1092
	ldr	x2, .LC715
	mov	w3, 4
	mov	w1, 2047
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
.L1107:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
	.p2align 3
.L1117:
	ldr	w0, [x20, 20]
	cmp	w0, wzr
	ble	.L1048
	ldr	w0, [x20, 24]
	cmp	w0, wzr
	bgt	.L1049
	.p2align 2
.L1048:
	ldr	x3, .LC709
	mov	w1, 1777
	ldr	x2, .LC710
	mov	w0, 1
	add	x3, x3, 3104
	bl	dprint_normal
.L1047:
	mov	w0, -1
	b	.L1107
	.p2align 3
.L1119:
	mov	w22, 0
	mov	w26, 0
.L1081:
	ldr	x0, [x21]
	add	x19, x20, 64
	blr	x0
	ldr	x3, [x21, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 136
	blr	x3
	ldr	x0, [x19, 56]
	cbz	x0, .L1053
	ldr	w0, [x19, 64]
	cbnz	w0, .L1054
.L1053:
	mov	w0, 7
	str	wzr, [x29, 164]
	bl	VFMW_GetString
	ldr	w2, [x29, 128]
	mov	w4, 1
	add	x3, x29, 136
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1120
	ldr	w0, [x29, 152]
	ldr	w2, [x29, 160]
	ldr	x1, [x29, 144]
	bl	MEM_AddMemRecord
	ldr	w0, [x29, 152]
	str	w0, [x29, 256]
	ldr	x0, [x29, 144]
	str	x0, [x29, 264]
	ldr	w0, [x29, 160]
	str	w0, [x29, 272]
	mov	w0, 1
	str	w0, [x29, 112]
.L1057:
	ldr	x3, [x21, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 136
	blr	x3
	ldr	x0, [x19, 8]
	cbz	x0, .L1086
	ldr	w0, [x19, 16]
	cbnz	w0, .L1059
.L1086:
	ldr	w0, [x20, 160]
	cmp	w0, 1
	beq	.L1060
	mov	w0, 8
	str	wzr, [x29, 164]
	bl	VFMW_GetString
	ldr	w2, [x29, 120]
	mov	w4, 0
	add	x3, x29, 136
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1121
	ldr	w0, [x29, 152]
	ldr	w2, [x29, 160]
	ldr	x1, [x29, 144]
	bl	MEM_AddMemRecord
	ldr	w0, [x29, 152]
	str	w0, [x29, 208]
	ldr	x0, [x29, 144]
	str	x0, [x29, 216]
	ldr	w0, [x29, 160]
	str	w0, [x29, 224]
	mov	w0, 1
	str	w0, [x29, 104]
.L1064:
	ldr	x3, [x21, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 136
	blr	x3
	ldr	x0, [x19, 32]
	cbz	x0, .L1088
	ldr	w0, [x19, 40]
	cbnz	w0, .L1068
.L1088:
	mov	w0, 9
	str	wzr, [x29, 164]
	bl	VFMW_GetString
	ldr	w2, [x29, 124]
	add	x3, x29, 136
	mov	w4, 0
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1122
	ldr	x1, [x29, 144]
	ldr	w0, [x29, 152]
	ldr	w2, [x29, 160]
	bl	MEM_AddMemRecord
	ldr	w1, [x29, 152]
	ldr	x0, [x29, 144]
	str	w1, [x29, 232]
	ldr	w1, [x29, 160]
	str	x0, [x29, 240]
	mov	w0, 1
	str	w1, [x29, 248]
	str	w0, [x29, 108]
.L1108:
	ldr	x0, [x21]
	blr	x0
	ldr	x1, [x21, 24]
	mov	w0, 0
	blr	x1
	ldr	x19, [x29, 264]
	add	x0, x25, 64
	ldr	w2, [x29, 272]
	ldr	x3, [x21, 96]
	mov	w1, 0
	add	x23, x19, 217088
	str	x19, [x0, w22, sxtw 3]
	mov	w0, 41864
	movk	w0, 0x4, lsl 16
	cmp	w2, w0
	csel	w2, w2, w0, ls
	mov	x0, x19
	blr	x3
	ldr	x3, [x21, 104]
	mov	x1, x20
	mov	x2, 184
	add	x0, x23, 3984
	blr	x3
	mov	w0, 51600
	add	x1, x19, 221184
	movk	w0, 0x7, lsl 16
	str	w0, [x23, 3884]
	str	w27, [x19, 148]
	mov	w0, 22
	str	w27, [x23, 3304]
	str	wzr, [x23, 3916]
	sxtw	x23, w22
	str	w22, [x19, 4]
	ldr	w2, [x20]
	str	w2, [x19, 144]
	add	x2, x19, 24576
	str	w0, [x19, 128]
	add	x2, x2, 2344
	str	w0, [x1, 112]
	str	wzr, [x19, 36]
	ldr	x1, .LC728
	ldr	w0, [x20, 180]
	str	w0, [x19, 84]
	lsl	x0, x23, 4
	str	x2, [x1, x0]
	add	x1, x19, 280
	ldr	w0, [x20, 172]
	str	w0, [x2, 76]
	mov	w0, w22
	ldr	w3, [x20, 176]
	str	w3, [x2, 80]
	bl	FSP_EnableInstance
	cbnz	w0, .L1123
	mov	w0, w22
	bl	VCTRL_ResetChan
	ldr	w0, [x29, 104]
	str	w0, [x19, 152]
	ldr	w0, [x29, 108]
	str	w0, [x19, 156]
	ldr	w0, [x29, 112]
	str	w0, [x19, 160]
	ldr	w5, [x29, 232]
	ldr	w0, [x20, 160]
	str	w0, [x19, 56]
	add	w4, w5, 1039
	ldr	w0, [x29, 248]
	str	w5, [x19, 164]
	str	w5, [x19, 264]
	add	w5, w5, w0
	str	w0, [x19, 272]
	sub	w0, w0, #16
	add	w4, w4, w0
	ldr	w1, [x29, 256]
	and	w4, w4, -1024
	str	wzr, [x19, 176]
	stp	w0, w4, [x19, 168]
	ldr	x0, [x29, 264]
	cmp	w4, w5
	str	x0, [x19, 192]
	ldr	w0, [x29, 272]
	str	w0, [x19, 208]
	ldr	w0, [x29, 208]
	str	w0, [x19, 232]
	ldr	x0, [x29, 216]
	str	x0, [x19, 224]
	ldr	w0, [x29, 224]
	str	w0, [x19, 240]
	ldr	x0, [x29, 240]
	str	w1, [x19, 200]
	str	x0, [x19, 256]
	bhi	.L1124
	add	x1, x19, 208896
	str	w22, [x19, 4]
	stp	w22, w22, [x19, 44]
	mov	w0, w22
	uxth	x26, w26
	str	w22, [x1, 2584]
	add	x25, x25, 560
	bl	SM_ClearInst
	ldr	x1, [x19, 192]
	mov	w0, w22
	add	x1, x1, 303104
	add	x1, x1, 2952
	bl	OpenUsdPool_WithMem
	mov	w1, 1
	mov	w0, w22
	str	w1, [x19, 16]
	bl	VDMDRV_ClearChanIsDec
	bl	VDMDRV_ParamInit
	ldr	x0, [x21]
	blr	x0
	str	w0, [x19, 116]
	add	x0, x26, x0, lsl 32
	str	x0, [x19, 8]
	str	wzr, [x19, 124]
	mov	w0, 0
	ldr	x1, [x21, 32]
	blr	x1
	ldr	x0, [x21]
	blr	x0
	mov	w19, w0
	lsl	x0, x23, 2
	ldr	x3, [x21, 96]
	sub	x0, x0, x23
	mov	x2, 100
	lsl	x1, x0, 5
	sub	w24, w19, w24
	add	x0, x0, x1
	mov	w1, 0
	add	x23, x0, x23
	add	x23, x25, x23
	mov	x0, x23
	blr	x3
	stp	w24, wzr, [x23, 44]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
	.p2align 3
.L1060:
	str	wzr, [x29, 104]
	str	wzr, [x29, 208]
	str	xzr, [x29, 216]
	str	wzr, [x29, 224]
	b	.L1064
	.p2align 3
.L1054:
	ldr	x3, [x21, 104]
	mov	x2, 24
	add	x1, x20, 112
	add	x0, x29, 256
	blr	x3
	ldr	w0, [x29, 128]
	ldr	w2, [x29, 272]
	cmp	w2, w0
	blt	.L1125
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_AddMemRecord
	b	.L1057
	.p2align 3
.L1068:
	ldr	x3, [x21, 104]
	add	x1, x20, 88
	add	x0, x29, 232
	mov	x2, 24
	blr	x3
	ldr	x1, [x29, 240]
	cbz	x1, .L1073
	ldr	w0, [x29, 124]
	ldr	w2, [x29, 248]
	cmp	w2, w0
	blt	.L1073
	ldr	w0, [x29, 232]
	bl	MEM_AddMemRecord
	b	.L1108
	.p2align 3
.L1059:
	ldr	x3, [x21, 104]
	mov	x2, 24
	mov	x1, x19
	add	x0, x29, 208
	blr	x3
	ldr	w0, [x20, 160]
	ldr	w4, [x29, 224]
	cmp	w0, 1
	beq	.L1066
	ldr	w5, [x29, 120]
	cmp	w4, w5
	blt	.L1126
.L1066:
	ldr	w0, [x29, 208]
	mov	w2, w4
	ldr	x1, [x29, 216]
	bl	MEM_AddMemRecord
	b	.L1064
	.p2align 3
.L1122:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L1127
.L1070:
	ldr	w0, [x29, 104]
	cmp	w0, 1
	beq	.L1128
.L1071:
	mov	w3, 1817
	ldr	x2, .LC725
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1107
	.p2align 3
.L1121:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L1129
.L1062:
	mov	w3, 1881
	ldr	x2, .LC721
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1107
	.p2align 3
.L1123:
	ldr	x2, .LC730
	mov	w3, w22
	mov	w1, 2086
	mov	w0, 1
	bl	dprint_normal
.L1078:
	mov	w0, w22
	add	x25, x25, 64
	bl	FSP_DisableInstance
	mov	w0, w22
	bl	CloseUsdPool_WithMem
	str	xzr, [x25, w22, sxtw 3]
	ldr	w3, [x19, 160]
	mov	w0, w22
	ldp	w2, w1, [x19, 152]
	stp	w2, w1, [x29, 168]
	add	x2, x19, 216
	add	x1, x19, 248
	str	w3, [x29, 176]
	add	x19, x19, 184
	stp	x2, x1, [x29, 184]
	str	x19, [x29, 200]
	bl	VDMDRV_ClearChanIsDec
	ldr	x1, [x21, 32]
	mov	w0, 0
	blr	x1
	add	x1, x29, 168
	mov	w0, w22
	bl	VCTRL_FreeChanResource
	mov	w0, -1
	b	.L1107
	.p2align 3
.L1124:
	ldr	x2, .LC732
	mov	w3, w22
	mov	w1, 2118
	mov	w0, 1
	bl	dprint_normal
	b	.L1078
	.p2align 3
.L1090:
	mov	w22, 1
	mov	w26, w22
	b	.L1081
	.p2align 3
.L1091:
	mov	w22, 2
	mov	w26, w22
	b	.L1081
	.p2align 3
.L1092:
	mov	w22, 3
	mov	w26, w22
	b	.L1081
	.p2align 3
.L1120:
	mov	w3, 1938
	ldr	x2, .LC717
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	b	.L1047
	.p2align 3
.L1073:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L1130
.L1075:
	ldr	w0, [x29, 104]
	cmp	w0, 1
	beq	.L1131
.L1076:
	mov	w3, 1845
	ldr	x2, .LC727
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	b	.L1047
	.p2align 3
.L1118:
	mov	w3, 2033
	ldr	x2, .LC712
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1107
	.p2align 3
.L1128:
	ldr	w0, [x29, 208]
	ldr	x1, [x29, 216]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 208]
	ldr	w2, [x29, 224]
	ldr	x1, [x29, 216]
	bl	MEM_DelMemRecord
	b	.L1071
.L1127:
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 256]
	ldr	w2, [x29, 272]
	ldr	x1, [x29, 264]
	bl	MEM_DelMemRecord
	b	.L1070
.L1129:
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 256]
	ldr	w2, [x29, 272]
	ldr	x1, [x29, 264]
	bl	MEM_DelMemRecord
	b	.L1062
.L1125:
	mov	w3, 1954
	ldr	x2, .LC719
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	b	.L1047
.L1126:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L1132
.L1067:
	mov	w3, 1912
	ldr	x2, .LC723
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	b	.L1047
.L1131:
	ldr	w0, [x29, 208]
	ldr	x1, [x29, 216]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 208]
	ldr	w2, [x29, 224]
	ldr	x1, [x29, 216]
	bl	MEM_DelMemRecord
	b	.L1076
.L1130:
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 256]
	ldr	w2, [x29, 272]
	ldr	x1, [x29, 264]
	bl	MEM_DelMemRecord
	b	.L1075
.L1116:
	ldr	x2, .LC708
	mov	w1, 1757
	mov	w0, 0
	bl	dprint_normal
	b	.L1047
.L1132:
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 256]
	ldr	w2, [x29, 272]
	ldr	x1, [x29, 264]
	bl	MEM_DelMemRecord
	ldr	w5, [x29, 120]
	ldr	w4, [x29, 224]
	b	.L1067
	.size	VCTRL_CreateChan, .-VCTRL_CreateChan
	.align	3
.LC706:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC708:
	.xword	.LC707
	.align	3
.LC709:
	.xword	.LANCHOR3
	.align	3
.LC710:
	.xword	.LC475
	.align	3
.LC712:
	.xword	.LC711
	.align	3
.LC713:
	.xword	.LANCHOR0
	.align	3
.LC715:
	.xword	.LC714
	.align	3
.LC717:
	.xword	.LC716
	.align	3
.LC719:
	.xword	.LC718
	.align	3
.LC721:
	.xword	.LC720
	.align	3
.LC723:
	.xword	.LC722
	.align	3
.LC725:
	.xword	.LC724
	.align	3
.LC727:
	.xword	.LC726
	.align	3
.LC728:
	.xword	s_SmIIS
	.align	3
.LC730:
	.xword	.LC729
	.align	3
.LC732:
	.xword	.LC731
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ConfigChan
	.type	VCTRL_ConfigChan, %function
VCTRL_ConfigChan:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w22, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w22, 3
	bhi	.L1181
	ldr	x20, .LC738
	add	x0, x20, 64
	ldr	x0, [x0, w22, sxtw 3]
	cbz	x0, .L1182
	ldr	w0, [x0, 16]
	cmp	w0, 1
	bne	.L1183
	cbz	x19, .L1184
	add	x21, x20, 1032
	mov	w0, 0
	mov	x1, x21
	bl	PDT_GetAttribute
	ldr	w21, [x19, 8]
	ldr	w0, [x20, 1052]
	cmp	w0, 21
	bhi	.L1140
	cmp	w0, w21
	beq	.L1141
	add	x0, x20, 1056
	add	x2, x20, 1180
	.p2align 2
.L1143:
	ldr	w1, [x0]
	add	x0, x0, 4
	cmp	w1, 21
	bhi	.L1140
	cmp	w1, w21
	beq	.L1141
	cmp	x2, x0
	bne	.L1143
.L1141:
	mov	x1, x19
	mov	w0, w22
	bl	VCTRL_CmpConfigParameter
	cbz	w0, .L1185
	add	x24, x20, 64
	ldr	x23, .LC750
	mov	x2, 80
	mov	w1, 0
	add	x0, x29, 64
	ldr	x3, [x24, w22, sxtw 3]
	str	w21, [x3, 128]
	ldr	w4, [x19, 24]
	str	w4, [x3, 28]
	ldr	x3, [x24, w22, sxtw 3]
	ldrsb	w4, [x19, 1]
	strb	w4, [x3]
	ldr	x3, [x23, 96]
	blr	x3
	ldr	x0, [x24, w22, sxtw 3]
	ldr	w0, [x0, 164]
	str	w0, [x29, 80]
	bl	MEM_Phy2Vir
	str	x0, [x29, 64]
	ldr	x1, [x24, w22, sxtw 3]
	mov	w0, 49152
	ldr	w2, [x19, 84]
	movk	w0, 0xf8c3, lsl 16
	ldr	w3, [x19, 8]
	ldr	w4, [x1, 168]
	cmp	w2, 1
	ldr	w5, [x19, 24]
	strb	w5, [x29, 72]
	str	w3, [x29, 76]
	str	w4, [x29, 84]
	str	w0, [x29, 88]
	beq	.L1186
	str	wzr, [x1, 120]
.L1145:
	ldr	w0, [x19, 88]
	cbz	w0, .L1146
	mov	w0, 1
	str	w0, [x29, 120]
.L1146:
	ldr	w1, [x19, 80]
	ldr	w0, [x19, 8]
	str	w1, [x29, 112]
	cbz	w0, .L1178
	cmp	w0, 16
	mov	w0, 0
	bne	.L1148
.L1178:
	ldr	w0, [x19, 52]
.L1148:
	str	w0, [x29, 108]
	mov	w1, 0
	mov	x0, 0
.L1150:
	add	x2, x20, 64
	ldr	x2, [x0, x2]
	add	x0, x0, 8
	cmp	x2, xzr
	csinc	w1, w1, w1, eq
	cmp	x0, 32
	bne	.L1150
	cmp	w1, 1
	ldr	x24, .LC751
	ble	.L1187
.L1151:
	str	wzr, [x29, 108]
.L1153:
	ldrsb	w0, [x19]
	cmp	w0, 1
	beq	.L1154
	ldr	w0, [x29, 108]
.L1155:
	str	w0, [x19, 52]
	add	x21, x19, 12
	mov	x2, 12
	mov	x1, x21
	ldr	x3, [x23, 104]
	add	x0, x29, 92
	blr	x3
	add	x1, x29, 64
	mov	w0, w22
	bl	SM_Config
	add	x0, x20, 64
	ldr	w2, [x24, 80]
	cmp	w2, 7
	ldr	x1, [x0, w22, sxtw 3]
	add	x0, x1, 217088
	ldr	w3, [x1, 200]
	str	w3, [x0, 3888]
	ldr	w3, [x1, 208]
	str	w3, [x0, 3892]
	ldr	w3, [x1, 172]
	str	w3, [x0, 3308]
	ldr	w3, [x1, 176]
	str	w3, [x0, 3312]
	ldr	w3, [x19, 28]
	str	w3, [x0, 3292]
	ldr	w3, [x19, 28]
	str	w3, [x0, 3288]
	ldr	w3, [x19, 36]
	str	w3, [x0, 3296]
	beq	.L1188
.L1156:
	str	w2, [x0, 3300]
	add	x1, x1, 221184
	add	x2, x0, 3288
	mov	w3, -1
	ldr	w4, [x19, 72]
	cmp	w4, 1
	cset	w4, eq
	str	w4, [x0, 3928]
	ldr	w4, [x19, 76]
	str	w4, [x0, 3932]
	ldr	w4, [x19, 48]
	str	w4, [x0, 3936]
	ldr	w4, [x19, 52]
	str	w4, [x0, 3940]
	ldr	w4, [x19, 132]
	str	w4, [x0, 3944]
	str	wzr, [x1, 80]
	str	wzr, [x1, 92]
	str	wzr, [x0, 3948]
	str	wzr, [x0, 3952]
	ldr	w4, [x19, 152]
	str	w4, [x1, 104]
	ldr	w1, [x19, 56]
	str	w1, [x0, 3128]
	str	wzr, [x2, 616]
	str	w3, [x2, 620]
	str	w3, [x2, 624]
	ldr	w1, [x19, 104]
	cmp	w1, wzr
	ble	.L1157
	ldr	w2, [x19, 108]
	cmp	w2, wzr
	ble	.L1157
	str	w1, [x0, 3176]
	ldr	w1, [x19, 108]
	str	w1, [x0, 3180]
.L1158:
	add	x24, x20, 64
	ldr	x3, [x23, 104]
	mov	x2, 156
	mov	x1, x19
	ldr	x0, [x24, w22, sxtw 3]
	add	x0, x0, 217088
	add	x0, x0, 3072
	blr	x3
	ldr	x0, [x24, w22, sxtw 3]
	mov	x2, 12
	ldr	x3, [x23, 104]
	mov	x1, x21
	add	x0, x0, 217088
	add	x0, x0, 3860
	blr	x3
	ldr	x1, [x24, w22, sxtw 3]
	add	x0, x1, 221184
	ldr	w2, [x1, 128]
	ldr	w3, [x0, 112]
	cmp	w3, w2
	beq	.L1159
	mov	w0, w22
	bl	VCTRL_ResetChan
	ldr	x1, [x24, w22, sxtw 3]
	add	x0, x1, 221184
	ldr	w2, [x1, 128]
.L1159:
	add	x5, x1, 217088
	str	w2, [x0, 112]
	ldr	x4, .LC752
	mov	x3, x20
	mov	x0, 0
	ldrsb	w2, [x5, 3072]
	str	w2, [x1, 288]
.L1162:
	add	x1, x20, 64
	add	x2, x3, 1184
	ldr	x1, [x1, x0, lsl 3]
	cbz	x1, .L1160
	ldr	w1, [x1, 28]
	str	w1, [x2, x0, lsl 2]
	str	w1, [x4, x0, lsl 2]
.L1161:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L1162
	add	x0, x20, 1184
	bl	VDMDRV_SetPriority
	mov	w0, w22
	bl	VDMDRV_ClearChanIsDec
	mov	w0, 0
.L1175:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1185:
	ldr	x3, .LC736
	mov	w1, 2680
	ldr	x2, .LC749
	add	x3, x3, 3128
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1160:
	add	x1, x3, 1184
	str	wzr, [x4, x0, lsl 2]
	str	wzr, [x1, x0, lsl 2]
	b	.L1161
	.p2align 3
.L1140:
	ldr	x2, .LC745
	mov	w3, w21
	mov	w1, 2476
	mov	w0, 0
	bl	dprint_normal
	ldr	x3, .LC736
	mov	w1, 2672
	ldr	x2, .LC747
	mov	w0, 0
	add	x3, x3, 3128
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1157:
	mov	w2, 1920
	mov	w1, 1088
	str	w2, [x0, 3176]
	str	w1, [x0, 3180]
	b	.L1158
	.p2align 3
.L1154:
	mov	w0, 0
	str	wzr, [x29, 108]
	b	.L1155
	.p2align 3
.L1186:
	ldp	w4, w3, [x19, 92]
	ldr	w0, [x19, 136]
	str	w0, [x1, 120]
	str	w2, [x29, 116]
	stp	w4, w3, [x29, 124]
	b	.L1145
	.p2align 3
.L1187:
	ldr	w0, [x24, 84]
	cbz	w0, .L1151
	cmp	w0, 1
	bne	.L1153
	str	w0, [x29, 108]
	b	.L1153
	.p2align 3
.L1188:
	ldr	w2, [x19, 40]
	b	.L1156
.L1183:
	ldr	x3, .LC736
	mov	w4, 2663
	ldr	x5, .LC741
.L1179:
	ldr	x2, .LC737
	add	x3, x3, 3128
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1175
.L1181:
	ldr	x3, .LC736
	mov	w4, 2661
	ldr	x5, .LC735
	b	.L1179
.L1184:
	ldr	x3, .LC736
	mov	w4, 2664
	ldr	x5, .LC743
	b	.L1179
.L1182:
	ldr	x3, .LC736
	mov	w4, 2662
	ldr	x5, .LC739
	mov	w1, w4
	ldr	x2, .LC737
	add	x3, x3, 3128
	bl	dprint_normal
	mov	w0, -1
	b	.L1175
	.size	VCTRL_ConfigChan, .-VCTRL_ConfigChan
	.align	3
.LC735:
	.xword	.LC103
	.align	3
.LC736:
	.xword	.LANCHOR3
	.align	3
.LC737:
	.xword	.LC105
	.align	3
.LC738:
	.xword	.LANCHOR0
	.align	3
.LC739:
	.xword	.LC119
	.align	3
.LC741:
	.xword	.LC740
	.align	3
.LC743:
	.xword	.LC742
	.align	3
.LC745:
	.xword	.LC744
	.align	3
.LC747:
	.xword	.LC746
	.align	3
.LC749:
	.xword	.LC748
	.align	3
.LC750:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC751:
	.xword	.LANCHOR1
	.align	3
.LC752:
	.xword	g_ChanCtx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetUvmosEnable, %function
VfmwProc_SetUvmosEnable:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	mov	w1, 5230
	ldr	x2, .LC758
	mov	w0, 32
	lsr	w20, w4, 24
	and	w19, w4, 16777215
	mov	w4, w19
	mov	w3, w20
	bl	dprint_normal
	ldr	x3, .LC759
	mov	w1, 0
	mov	x2, 156
	add	x0, x29, 32
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 32
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbz	w0, .L1192
	ldr	x2, .LC761
	mov	w3, w20
	mov	w1, 5240
	mov	w0, 32
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1192:
	add	x1, x29, 32
	mov	w0, w20
	str	w19, [x29, 164]
	bl	VCTRL_ConfigChan
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetUvmosEnable, .-VfmwProc_SetUvmosEnable
	.align	3
.LC758:
	.xword	.LC757
	.align	3
.LC759:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC761:
	.xword	.LC760
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetDropStreamThreshold, %function
VfmwProc_SetDropStreamThreshold:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	mov	w1, 5318
	ldr	x2, .LC763
	mov	w0, 32
	lsr	w20, w4, 24
	and	w19, w4, 16777215
	mov	w4, w19
	mov	w3, w20
	bl	dprint_normal
	ldr	x3, .LC764
	mov	w1, 0
	mov	x2, 156
	add	x0, x29, 32
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 32
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1193
	add	x1, x29, 32
	mov	w0, w20
	str	w19, [x29, 64]
	bl	VCTRL_ConfigChan
.L1193:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetDropStreamThreshold, .-VfmwProc_SetDropStreamThreshold
	.align	3
.LC763:
	.xword	.LC762
	.align	3
.LC764:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetDecMode, %function
VfmwProc_SetDecMode:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	mov	w1, 5294
	ldr	x2, .LC766
	mov	w0, 32
	lsr	w20, w4, 24
	and	w19, w4, 7
	mov	w4, w19
	mov	w3, w20
	bl	dprint_normal
	ldr	x3, .LC767
	mov	w1, 0
	mov	x2, 156
	add	x0, x29, 32
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 32
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbz	w0, .L1198
	ldr	x2, .LC769
	mov	w3, w20
	mov	w1, 5304
	mov	w0, 32
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1198:
	add	x1, x29, 32
	mov	w0, w20
	str	w19, [x29, 68]
	bl	VCTRL_ConfigChan
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetDecMode, .-VfmwProc_SetDecMode
	.align	3
.LC766:
	.xword	.LC765
	.align	3
.LC767:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC769:
	.xword	.LC768
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetDecOrderOutput, %function
VfmwProc_SetDecOrderOutput:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	mov	w1, 5254
	ldr	x2, .LC771
	mov	w0, 32
	lsr	w20, w4, 24
	and	w19, w4, 3
	mov	w4, w19
	mov	w3, w20
	bl	dprint_normal
	ldr	x3, .LC772
	mov	w1, 0
	mov	x2, 156
	add	x0, x29, 32
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 32
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1199
	add	x1, x29, 32
	mov	w0, w20
	str	w19, [x29, 72]
	bl	VCTRL_ConfigChan
.L1199:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetDecOrderOutput, .-VfmwProc_SetDecOrderOutput
	.align	3
.LC771:
	.xword	.LC770
	.align	3
.LC772:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetErrorThreshold, %function
VfmwProc_SetErrorThreshold:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19]
	mov	w1, 5210
	ldr	x2, .LC774
	mov	w0, 32
	lsr	w20, w4, 24
	and	w19, w4, 16777215
	mov	w4, w19
	mov	w3, w20
	bl	dprint_normal
	ldr	x3, .LC775
	mov	w1, 0
	mov	x2, 156
	add	x0, x29, 32
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 32
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1201
	add	x1, x29, 32
	mov	w0, w20
	str	w19, [x29, 60]
	bl	VCTRL_ConfigChan
.L1201:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetErrorThreshold, .-VfmwProc_SetErrorThreshold
	.align	3
.LC774:
	.xword	.LC773
	.align	3
.LC775:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_TestResetChan, %function
VfmwProc_TestResetChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	mov	w0, w19
	bl	VCTRL_ResetChan
	mov	w4, w0
	ldr	x2, .LC777
	mov	w3, w19
	mov	w1, 5781
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestResetChan, .-VfmwProc_TestResetChan
	.align	3
.LC777:
	.xword	.LC776
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DestroyChan
	.type	VCTRL_DestroyChan, %function
VCTRL_DestroyChan:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC778
	ldr	x0, [x20]
	blr	x0
	mov	w23, w0
	ldr	x1, [x20, 24]
	mov	w0, 0
	blr	x1
	cmp	w19, 3
	bhi	.L1215
	ldr	x22, .LC783
	add	x0, x22, 64
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L1216
	ldr	w21, [x1, 16]
	cmp	w21, 1
	bne	.L1217
	str	wzr, [x1, 20]
	mov	w0, 0
	ldr	x1, [x20, 32]
	blr	x1
	mov	w0, w19
	bl	SCDDRV_IsChanDec
	cbnz	w0, .L1218
.L1209:
	ldr	x1, [x20, 24]
	mov	w0, 0
	blr	x1
	ldr	x1, [x20, 24]
	mov	w0, 4
	blr	x1
	mov	w0, w19
	bl	VCTRL_StopChan
	ldr	x1, [x20, 32]
	cbnz	w0, .L1219
	mov	w0, 4
	sxtw	x21, w19
	blr	x1
	mov	w0, w19
	bl	VCTRL_ResetChan
	ldr	x1, [x20, 24]
	mov	w0, 4
	blr	x1
	mov	w0, w19
	bl	FSP_DisableInstance
	mov	w0, w19
	bl	CloseUsdPool_WithMem
	add	x2, x22, 64
	ldr	x4, .LC788
	lsl	x3, x21, 4
	mov	w0, w19
	add	x22, x22, 560
	ldr	x1, [x2, w19, sxtw 3]
	str	xzr, [x4, x3]
	str	xzr, [x2, w19, sxtw 3]
	add	x3, x1, 248
	add	x2, x1, 184
	add	x4, x1, 216
	str	x2, [x29, 120]
	stp	x4, x3, [x29, 104]
	ldr	w2, [x1, 152]
	ldr	w3, [x1, 160]
	ldr	w1, [x1, 156]
	str	w3, [x29, 96]
	stp	w2, w1, [x29, 88]
	bl	VDMDRV_ClearChanIsDec
	mov	w0, w19
	bl	SCDDRV_ResetSCD
	mov	w0, w19
	bl	VDMDRV_ResetVDH
	ldr	x1, [x20, 32]
	mov	w0, 4
	blr	x1
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	ldr	x2, [x20, 48]
	mov	w1, w19
	mov	w0, 1
	blr	x2
	ldr	x0, [x20]
	blr	x0
	mov	w25, w0
	add	x1, x29, 88
	mov	w0, w19
	bl	VCTRL_FreeChanResource
	ldr	x0, [x20]
	blr	x0
	mov	w24, w0
	ldr	x2, [x20, 56]
	mov	w1, w19
	mov	w0, 1
	sub	w24, w24, w25
	blr	x2
	ldr	x0, [x20]
	blr	x0
	sub	w23, w0, w23
	lsl	x1, x21, 2
	mov	w0, 0
	sub	x1, x1, x21
	lsl	x2, x1, 5
	add	x1, x1, x2
	add	x21, x1, x21
	add	x21, x22, x21
	stp	w23, w24, [x21, 52]
.L1206:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L1218:
	mov	w0, w19
	ldr	x24, [x20, 264]
	bl	SCDDRV_IsChanDec
	cmp	w0, wzr
	mov	w2, 500
	cset	w1, eq
	mov	w0, w21
	blr	x24
	b	.L1209
	.p2align 3
.L1217:
	ldr	x3, .LC780
	mov	w4, 2196
	ldr	x5, .LC787
.L1214:
	ldr	x2, .LC782
	mov	w1, w4
	add	x3, x3, 3152
	mov	w0, 0
	bl	dprint_normal
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, -1
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L1219:
	mov	w0, 4
	blr	x1
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	mov	w0, -1
	b	.L1206
	.p2align 3
.L1215:
	ldr	x3, .LC780
	mov	w4, 2182
	ldr	x5, .LC779
	b	.L1214
.L1216:
	ldr	x3, .LC780
	mov	w4, 2189
	ldr	x5, .LC785
	b	.L1214
	.size	VCTRL_DestroyChan, .-VCTRL_DestroyChan
	.align	3
.LC778:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC779:
	.xword	.LC103
	.align	3
.LC780:
	.xword	.LANCHOR3
	.align	3
.LC782:
	.xword	.LC781
	.align	3
.LC783:
	.xword	.LANCHOR0
	.align	3
.LC785:
	.xword	.LC784
	.align	3
.LC787:
	.xword	.LC786
	.align	3
.LC788:
	.xword	s_SmIIS
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_TestRestartChan, %function
VfmwProc_TestRestartChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	mov	w0, w19
	bl	VCTRL_StopChan
	mov	w4, w0
	ldr	x2, .LC792
	mov	w3, w19
	mov	w1, 5805
	mov	w0, 32
	bl	dprint_normal
	mov	w0, w19
	bl	VCTRL_ResetChan
	mov	w4, w0
	ldr	x2, .LC793
	mov	w3, w19
	mov	w1, 5807
	mov	w0, 32
	bl	dprint_normal
	mov	w0, w19
	bl	VCTRL_StartChan
	mov	w4, w0
	ldr	x2, .LC794
	mov	w3, w19
	mov	w1, 5809
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestRestartChan, .-VfmwProc_TestRestartChan
	.align	3
.LC792:
	.xword	.LC791
	.align	3
.LC793:
	.xword	.LC776
	.align	3
.LC794:
	.xword	.LC671
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_TestStopChan, %function
VfmwProc_TestStopChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	mov	w0, w19
	bl	VCTRL_StopChan
	mov	w4, w0
	ldr	x2, .LC795
	mov	w3, w19
	mov	w1, 5770
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestStopChan, .-VfmwProc_TestStopChan
	.align	3
.LC795:
	.xword	.LC791
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_EnableEsBuf
	.type	VCTRL_EnableEsBuf, %function
VCTRL_EnableEsBuf:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC796
	mov	w1, 1
	add	x0, x0, 1200
	str	w1, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_EnableEsBuf, .-VCTRL_EnableEsBuf
	.align	3
.LC796:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DisableEsBuf
	.type	VCTRL_DisableEsBuf, %function
VCTRL_DisableEsBuf:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC798
	add	x0, x0, 1200
	str	wzr, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_DisableEsBuf, .-VCTRL_DisableEsBuf
	.align	3
.LC798:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IfNoGapEnable
	.type	VCTRL_IfNoGapEnable, %function
VCTRL_IfNoGapEnable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC800
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	ldr	x19, [sp, 16]
	add	x0, x0, 217088
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 3156]
	cmp	w0, 1
	cset	w0, eq
	ret
	.size	VCTRL_IfNoGapEnable, .-VCTRL_IfNoGapEnable
	.align	3
.LC800:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IfEsBufEnable
	.type	VCTRL_IfEsBufEnable, %function
VCTRL_IfEsBufEnable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC802
	add	x0, x0, 1200
	ldr	w0, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_IfEsBufEnable, .-VCTRL_IfEsBufEnable
	.align	3
.LC802:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanCrcMode
	.type	VCTRL_GetChanCrcMode, %function
VCTRL_GetChanCrcMode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC804
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	ldr	x19, [sp, 16]
	add	x0, x0, 217088
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 3116]
	ret
	.size	VCTRL_GetChanCrcMode, .-VCTRL_GetChanCrcMode
	.align	3
.LC804:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetChanWaitFsFlag
	.type	VCTRL_SetChanWaitFsFlag, %function
VCTRL_SetChanWaitFsFlag:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x0, .LC806
	add	x0, x0, 64
	ldr	x0, [x0, w20, sxtw 3]
	add	x0, x0, 221184
	str	w19, [x0, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetChanWaitFsFlag, .-VCTRL_SetChanWaitFsFlag
	.align	3
.LC806:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_BindRequireMem
	.type	VCTRL_BindRequireMem, %function
VCTRL_BindRequireMem:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cmp	w20, 3
	bhi	.L1236
	ldr	x19, .LC811
	add	x19, x19, 64
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L1237
	cbz	x21, .L1238
	ldr	x4, [x21, 64]
	ldr	x5, [x0, 8]
	and	x0, x4, -4294901761
	cmp	x0, x5
	bne	.L1239
	mov	x1, x21
	mov	w0, w20
	bl	FSP_BindRequireFs
	mov	w21, w0
	cbz	w0, .L1240
.L1234:
	cmp	w21, wzr
	csetm	w0, ne
.L1230:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1240:
	ldr	x1, [x19, w20, sxtw 3]
	ldr	w1, [x1, 124]
	cmp	w1, 1
	bne	.L1234
	ldr	x1, .LC817
	ldr	x1, [x1, 256]
	blr	x1
	ldr	x0, [x19, w20, sxtw 3]
	str	wzr, [x0, 124]
	b	.L1234
	.p2align 3
.L1239:
	ldr	x3, .LC809
	mov	w1, 6654
	ldr	x2, .LC816
	mov	w0, 1
	add	x3, x3, 3176
	bl	dprint_normal
	mov	w0, -1
	b	.L1230
	.p2align 3
.L1236:
	ldr	x3, .LC809
	mov	w4, 6644
	ldr	x5, .LC808
.L1235:
	ldr	x2, .LC810
	add	x3, x3, 3176
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1230
.L1238:
	ldr	x3, .LC809
	mov	w4, 6646
	ldr	x5, .LC814
	b	.L1235
.L1237:
	ldr	x3, .LC809
	mov	w4, 6645
	ldr	x5, .LC812
	mov	w1, w4
	ldr	x2, .LC810
	add	x3, x3, 3176
	bl	dprint_normal
	mov	w0, -1
	b	.L1230
	.size	VCTRL_BindRequireMem, .-VCTRL_BindRequireMem
	.align	3
.LC808:
	.xword	.LC418
	.align	3
.LC809:
	.xword	.LANCHOR3
	.align	3
.LC810:
	.xword	.LC105
	.align	3
.LC811:
	.xword	.LANCHOR0
	.align	3
.LC812:
	.xword	.LC348
	.align	3
.LC814:
	.xword	.LC813
	.align	3
.LC816:
	.xword	.LC815
	.align	3
.LC817:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetFrameBufferMode
	.type	VCTRL_SetFrameBufferMode, %function
VCTRL_SetFrameBufferMode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 3
	bhi	.L1245
	ldr	x0, .LC822
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1246
	mov	w1, w20
	mov	w0, w19
	bl	FSP_SetFrameBufferMode
	cmp	w0, wzr
	csetm	w0, ne
.L1243:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1245:
	ldr	x3, .LC820
	mov	w4, 6676
	ldr	x5, .LC819
	mov	w1, w4
	ldr	x2, .LC821
	add	x3, x3, 3200
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1243
.L1246:
	ldr	x3, .LC820
	mov	w4, 6677
	ldr	x5, .LC823
	mov	w1, w4
	ldr	x2, .LC821
	add	x3, x3, 3200
	bl	dprint_normal
	mov	w0, -1
	b	.L1243
	.size	VCTRL_SetFrameBufferMode, .-VCTRL_SetFrameBufferMode
	.align	3
.LC819:
	.xword	.LC418
	.align	3
.LC820:
	.xword	.LANCHOR3
	.align	3
.LC821:
	.xword	.LC105
	.align	3
.LC822:
	.xword	.LANCHOR0
	.align	3
.LC823:
	.xword	.LC358
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_BindExternBuffer
	.type	VCTRL_BindExternBuffer, %function
VCTRL_BindExternBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 3
	bhi	.L1259
	ldr	x0, .LC828
	add	x0, x0, 64
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L1260
	cbz	x19, .L1261
	mov	w0, w20
	mov	x1, x19
	bl	FSP_BindExternFs
	mov	w20, w0
	cbz	w0, .L1262
.L1253:
	cmp	w20, wzr
	csetm	w0, ne
.L1249:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1262:
	ldr	w0, [x19, 32]
	add	x19, x19, 152
	ldr	w2, [x19, -96]
	ldr	x1, [x19, -112]
	bl	MEM_AddMemRecord
	ldr	w3, [x19, 32]
	cbz	w3, .L1253
	ldr	x0, [x19, 40]
	cbnz	x0, .L1253
	ldr	x2, .LC833
	mov	w1, 6705
	bl	dprint_normal
	b	.L1253
	.p2align 3
.L1259:
	ldr	x3, .LC826
	mov	w4, 6690
	ldr	x5, .LC825
.L1258:
	ldr	x2, .LC827
	add	x3, x3, 3232
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1249
.L1261:
	ldr	x3, .LC826
	mov	w4, 6692
	ldr	x5, .LC831
	b	.L1258
.L1260:
	ldr	x3, .LC826
	mov	w4, 6691
	ldr	x5, .LC829
	mov	w1, w4
	ldr	x2, .LC827
	add	x3, x3, 3232
	bl	dprint_normal
	mov	w0, -1
	b	.L1249
	.size	VCTRL_BindExternBuffer, .-VCTRL_BindExternBuffer
	.align	3
.LC825:
	.xword	.LC418
	.align	3
.LC826:
	.xword	.LANCHOR3
	.align	3
.LC827:
	.xword	.LC105
	.align	3
.LC828:
	.xword	.LANCHOR0
	.align	3
.LC829:
	.xword	.LC358
	.align	3
.LC831:
	.xword	.LC830
	.align	3
.LC833:
	.xword	.LC832
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_UnBindExternBuffer
	.type	VCTRL_UnBindExternBuffer, %function
VCTRL_UnBindExternBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 3
	bhi	.L1273
	ldr	x0, .LC838
	add	x0, x0, 64
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L1274
	cbz	x19, .L1275
	mov	x1, x19
	mov	w0, w20
	add	x19, x19, 152
	bl	FSP_UnBindExternFs
	mov	w20, w0
	ldr	w2, [x19, -96]
	ldr	w0, [x19, -120]
	ldr	x1, [x19, -112]
	bl	MEM_DelMemRecord
	ldr	w3, [x19, 32]
	cbnz	w3, .L1276
.L1268:
	cmp	w20, wzr
	csetm	w0, ne
.L1265:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1276:
	ldr	x0, [x19, 40]
	cbnz	x0, .L1268
	ldr	x2, .LC841
	mov	w1, 6731
	bl	dprint_normal
	b	.L1268
	.p2align 3
.L1273:
	ldr	x3, .LC836
	mov	w4, 6718
	ldr	x5, .LC835
.L1272:
	ldr	x2, .LC837
	add	x3, x3, 3256
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1265
.L1275:
	ldr	x3, .LC836
	mov	w4, 6720
	ldr	x5, .LC840
	b	.L1272
.L1274:
	ldr	x3, .LC836
	mov	w4, 6719
	ldr	x5, .LC839
	mov	w1, w4
	ldr	x2, .LC837
	add	x3, x3, 3256
	bl	dprint_normal
	mov	w0, -1
	b	.L1265
	.size	VCTRL_UnBindExternBuffer, .-VCTRL_UnBindExternBuffer
	.align	3
.LC835:
	.xword	.LC418
	.align	3
.LC836:
	.xword	.LANCHOR3
	.align	3
.LC837:
	.xword	.LC105
	.align	3
.LC838:
	.xword	.LANCHOR0
	.align	3
.LC839:
	.xword	.LC358
	.align	3
.LC840:
	.xword	.LC830
	.align	3
.LC841:
	.xword	.LC832
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetFrameBufferNum
	.type	VCTRL_SetFrameBufferNum, %function
VCTRL_SetFrameBufferNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 3
	bhi	.L1280
	mov	w1, w20
	mov	w0, w19
	bl	FSP_SetDispFsNum
	cmp	w0, wzr
	csetm	w0, ne
.L1279:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1280:
	ldr	x3, .LC844
	mov	w4, 6741
	ldr	x5, .LC843
	mov	w1, w4
	ldr	x2, .LC845
	add	x3, x3, 3288
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1279
	.size	VCTRL_SetFrameBufferNum, .-VCTRL_SetFrameBufferNum
	.align	3
.LC843:
	.xword	.LC418
	.align	3
.LC844:
	.xword	.LANCHOR3
	.align	3
.LC845:
	.xword	.LC105
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetOccupiedNum
	.type	VCTRL_GetOccupiedNum, %function
VCTRL_GetOccupiedNum:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w21, w1
	mov	w20, w2
	bl	_mcount
	ldr	x3, .LC846
	add	x1, x29, 56
	mov	w0, 2
	add	x3, x3, 64
	ldr	x2, [x3, w19, sxtw 3]
	ldr	w4, [x2, 128]
	ldr	w3, [x2, 148]
	ldr	w2, [x2, 120]
	stp	w2, w21, [x29, 56]
	stp	w20, w4, [x29, 64]
	str	w3, [x29, 72]
	bl	PDT_GetAttribute
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.size	VCTRL_GetOccupiedNum, .-VCTRL_GetOccupiedNum
	.align	3
.LC846:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetExtraFrameNum
	.type	VCTRL_GetExtraFrameNum, %function
VCTRL_GetExtraFrameNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC848
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	ldr	x19, [sp, 16]
	add	x0, x0, 217088
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 3172]
	ret
	.size	VCTRL_GetExtraFrameNum, .-VCTRL_GetExtraFrameNum
	.align	3
.LC848:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IsSupport4KStd
	.type	VCTRL_IsSupport4KStd, %function
VCTRL_IsSupport4KStd:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sub	w0, w19, #16
	cmp	w0, 2
	bls	.L1285
	cmp	w19, wzr
	ldr	x19, [sp, 16]
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1285:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_IsSupport4KStd, .-VCTRL_IsSupport4KStd
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IsResolutionValid
	.type	VCTRL_IsResolutionValid, %function
VCTRL_IsResolutionValid:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	w21, w2
	bl	_mcount
	cmp	w19, 3
	bhi	.L1297
	ldr	x0, .LC853
	add	x0, x0, 64
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L1298
	mul	w0, w20, w21
	cmp	w0, 1023
	ble	.L1299
	add	x2, x1, 217088
	ldr	w3, [x2, 3176]
	cmp	w3, wzr
	ble	.L1291
	ldr	w4, [x2, 3180]
	cmp	w4, wzr
	ble	.L1291
	mul	w2, w3, w4
	cmp	w0, w2
	bgt	.L1300
.L1291:
	cmp	w0, 2088960
	mov	w0, 1
	ble	.L1288
	ldr	w3, [x1, 128]
	and	w1, w3, -3
	cmp	w1, 16
	beq	.L1288
	cmp	w3, 17
	ccmp	w3, wzr, 4, ne
	beq	.L1288
	ldr	x2, .LC860
	mov	w5, w21
	mov	w4, w20
	mov	w1, 6804
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
.L1288:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1297:
	ldr	x3, .LC851
	mov	w4, 6780
	ldr	x5, .LC850
.L1296:
	ldr	x2, .LC852
	add	x3, x3, 3312
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1298:
	ldr	x3, .LC851
	mov	w4, 6781
	ldr	x5, .LC854
	b	.L1296
	.p2align 3
.L1299:
	mov	w4, 32
	ldr	x2, .LC856
	mov	w6, w21
	mov	w5, w20
	mov	w3, w4
	mov	w1, 6788
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	b	.L1288
	.p2align 3
.L1300:
	ldr	x2, .LC858
	mov	w6, w21
	mov	w5, w20
	mov	w1, 6796
	mov	w0, 32
	bl	dprint_normal
	mov	w0, 0
	b	.L1288
	.size	VCTRL_IsResolutionValid, .-VCTRL_IsResolutionValid
	.align	3
.LC850:
	.xword	.LC418
	.align	3
.LC851:
	.xword	.LANCHOR3
	.align	3
.LC852:
	.xword	.LC105
	.align	3
.LC853:
	.xword	.LANCHOR0
	.align	3
.LC854:
	.xword	.LC358
	.align	3
.LC856:
	.xword	.LC855
	.align	3
.LC858:
	.xword	.LC857
	.align	3
.LC860:
	.xword	.LC859
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_RecordPosTime
	.type	VCTRL_RecordPosTime, %function
VCTRL_RecordPosTime:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC862
	ldr	w1, [x0]
	cmp	w1, 1
	beq	.L1307
.L1301:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1307:
	cmp	w19, 11
	bhi	.L1308
	ldr	x22, .LC866
	uxtw	x21, w19
	ldrb	w1, [x22, x21]
	cmp	w1, 14
	mov	w20, w1
	bhi	.L1309
.L1305:
	cmp	w19, 10
	beq	.L1310
.L1306:
	ldr	x0, .LC867
	ldr	x0, [x0, 8]
	blr	x0
	lsl	x1, x21, 4
	ldr	x3, .LC868
	sub	x1, x1, x21
	ldrb	w2, [x22, x21]
	add	x1, x1, x20, sxtw
	add	w2, w2, 1
	strb	w2, [x22, x21]
	str	w0, [x3, x1, lsl 2]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1309:
	strb	wzr, [x22, x21]
	mov	w20, 0
	b	.L1305
	.p2align 3
.L1310:
	mov	w1, 1
	strb	w1, [x0, 1216]
	b	.L1306
	.p2align 3
.L1308:
	ldr	x3, .LC863
	mov	w4, 6876
	ldr	x2, .LC865
	mov	w5, w19
	add	x3, x3, 3336
	mov	w1, w4
	mov	w0, 32
	bl	dprint_normal
	b	.L1301
	.size	VCTRL_RecordPosTime, .-VCTRL_RecordPosTime
	.align	3
.LC862:
	.xword	.LANCHOR0
	.align	3
.LC863:
	.xword	.LANCHOR3
	.align	3
.LC865:
	.xword	.LC864
	.align	3
.LC866:
	.xword	g_TimeRecId
	.align	3
.LC867:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC868:
	.xword	g_TimeRecTable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_RunProcess
	.type	VCTRL_RunProcess, %function
VCTRL_RunProcess:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	bl	VCTRL_RecordPosTime
	ldr	x20, .LC869
	ldrb	w0, [x20, 1216]
	cmp	w0, 1
	beq	.L1320
.L1312:
	ldr	w0, [x20, 12]
	mov	w1, 100
	str	w1, [x20, 120]
	cmp	w0, wzr
	ldr	x21, .LC870
	ble	.L1313
	ldr	x1, [x21, 240]
	blr	x1
.L1313:
	ldr	x1, [x21, 24]
	mov	w0, 0
	mov	w22, 0
	blr	x1
	bl	SM_Wakeup
	ldr	w0, [x20, 8]
	mov	w1, 101
	str	w1, [x20, 120]
	cbz	w0, .L1321
.L1314:
	mov	w0, 102
	mov	w19, 0
	str	w0, [x20, 120]
	bl	VDMDRV_WakeUpVdm
.L1315:
	mov	w0, w19
	mov	w1, 0
	add	w19, w19, 1
	bl	DeleteRawPacketInBuffer
	cmp	w19, 4
	bne	.L1315
	ldr	x1, [x21, 32]
	mov	w0, 0
	blr	x1
	mov	w1, 105
	mov	w0, 1
	str	w1, [x20, 120]
	bl	VCTRL_RecordPosTime
	ldr	x3, [x21, 264]
	mov	w2, 10
	mov	w1, 0
	mov	w0, 0
	blr	x3
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1321:
	bl	VCTRL_DecSyntax
	mov	w22, w0
	b	.L1314
	.p2align 3
.L1320:
	mov	w0, 11
	bl	VCTRL_RecordPosTime
	strb	wzr, [x20, 1216]
	b	.L1312
	.size	VCTRL_RunProcess, .-VCTRL_RunProcess
	.align	3
.LC869:
	.xword	.LANCHOR0
	.align	3
.LC870:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DecodeThread
	.type	VCTRL_DecodeThread, %function
VCTRL_DecodeThread:
.L1323:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x0, x30
	mov	w21, 2
	mov	w24, 1
	mov	w22, 5
	bl	_mcount
	ldr	x20, .LC871
	ldr	x23, .LC872
	ldr	w0, [x20, 104]
.L1328:
	cmp	w0, 2
	str	w21, [x20, 100]
	bne	.L1348
	b	.L1324
	.p2align 3
.L1351:
	str	w21, [x20, 120]
	bl	VCTRL_RunProcess
	ldr	w0, [x20, 104]
	cmp	w0, 2
	beq	.L1324
.L1348:
	cmp	w0, 3
	bne	.L1351
.L1325:
	str	wzr, [x20, 100]
	mov	w0, 6
	str	w0, [x20, 120]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1324:
	str	w24, [x20, 100]
	str	w22, [x20, 120]
	.p2align 2
.L1330:
	ldr	x1, [x23, 240]
	mov	w0, 10
	blr	x1
	str	w22, [x20, 120]
	ldr	w0, [x20, 104]
	cmp	w0, 1
	beq	.L1328
	cmp	w0, 3
	bne	.L1330
	b	.L1325
	.size	VCTRL_DecodeThread, .-VCTRL_DecodeThread
	.align	3
.LC871:
	.xword	.LANCHOR0
	.align	3
.LC872:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CloseDrivers
	.type	VCTRL_CloseDrivers, %function
VCTRL_CloseDrivers:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	VCTRL_DeinitVdmHal
	mov	x0, x19
	bl	VCTRL_DeinitScdHal
	mov	x0, x19
	bl	VCTRL_UnmapVdmRegister
	bl	VCTRL_UnregisterInterrupt
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_CloseDrivers, .-VCTRL_CloseDrivers
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_OpenDrivers
	.type	VCTRL_OpenDrivers, %function
VCTRL_OpenDrivers:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	VCTRL_MapVdmRegister
	cbnz	w0, .L1362
	mov	x0, x19
	bl	VCTRL_InitVdmHal
	cbnz	w0, .L1363
	mov	x0, x19
	bl	VCTRL_InitScdHal
	cbnz	w0, .L1364
	bl	VCTRL_RegisterInterrupt
	cbnz	w0, .L1365
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1362:
	ldr	x3, .LC874
	mov	w4, 6968
.L1361:
	ldr	x2, .LC876
	mov	w1, w4
	add	x3, x3, 3360
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x19
	bl	VCTRL_CloseDrivers
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1363:
	ldr	x3, .LC874
	mov	w4, 6973
	b	.L1361
	.p2align 3
.L1364:
	ldr	x3, .LC874
	mov	w4, 6978
	b	.L1361
	.p2align 3
.L1365:
	ldr	x3, .LC874
	mov	w4, 6983
	b	.L1361
	.size	VCTRL_OpenDrivers, .-VCTRL_OpenDrivers
	.align	3
.LC874:
	.xword	.LANCHOR3
	.align	3
.LC876:
	.xword	.LC875
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CloseVfmw
	.type	VCTRL_CloseVfmw, %function
VCTRL_CloseVfmw:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC877
	ldr	w0, [x20, 96]
	cmp	w0, 1
	bne	.L1373
	mov	x19, 0
.L1369:
	add	x1, x20, 64
	mov	w0, w19
	ldr	x1, [x1, x19, lsl 3]
	add	x19, x19, 1
	cbz	x1, .L1368
	bl	VCTRL_DestroyChan
.L1368:
	cmp	x19, 4
	bne	.L1369
	bl	FSP_Exit
	ldr	w1, [x20, 100]
	mov	w2, 3
	str	w2, [x20, 104]
	cbz	w1, .L1371
	ldr	x21, .LC878
	mov	w0, 10
	mov	w19, 49
	ldr	x1, [x21, 240]
	blr	x1
	b	.L1372
	.p2align 3
.L1383:
	ldr	x1, [x21, 240]
	blr	x1
	subs	w19, w19, #1
	beq	.L1371
.L1372:
	ldr	w1, [x20, 100]
	mov	w0, 10
	cbnz	w1, .L1383
.L1371:
	add	x0, x20, 128
	bl	VCTRL_CloseDrivers
	str	wzr, [x20, 96]
	mov	w0, 0
.L1382:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1373:
	mov	w0, -1
	b	.L1382
	.size	VCTRL_CloseVfmw, .-VCTRL_CloseVfmw
	.align	3
.LC877:
	.xword	.LANCHOR0
	.align	3
.LC878:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_OpenVfmw
	.type	VCTRL_OpenVfmw, %function
VCTRL_OpenVfmw:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	bl	_mcount
	cbz	x22, .L1414
	ldr	x20, .LC885
	mov	x2, 8
	mov	w1, 0
	add	x0, x29, 64
	ldr	x3, [x20, 96]
	blr	x3
	ldr	x19, .LC886
	ldr	w21, [x19, 96]
	cbnz	w21, .L1405
	add	x23, x19, 1224
	ldr	x2, [x20, 160]
	mov	w1, 1024
	mov	x0, x23
	str	xzr, [x29, 72]
	blr	x2
	ldr	x1, .LC888
	mov	x0, x23
	ldr	x2, [x20, 192]
	blr	x2
	str	x0, [x29, 72]
	cbz	x0, .L1388
	ldr	x1, .LC890
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1407
	ldr	x1, .LC892
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1415
	ldr	x3, [x20, 168]
	mov	x1, 0
	mov	w2, 0
	blr	x3
	mov	w3, w0
	str	w0, [x19, 976]
	add	w0, w3, 4096
	mov	w1, 10000
	add	w0, w0, 904
	cmp	w0, w1
	bhi	.L1393
.L1421:
	mov	w1, 5000
	mov	w0, -5000
	cmp	w3, w1
	csel	w3, w3, w1, le
	cmp	w3, w0
	csel	w3, w3, w0, ge
.L1389:
	str	w3, [x19, 976]
.L1391:
	add	x23, x19, 1224
	ldr	x2, [x20, 160]
	mov	w1, 1024
	mov	x0, x23
	str	xzr, [x29, 72]
	blr	x2
	ldr	x1, .LC898
	mov	x0, x23
	ldr	x2, [x20, 192]
	blr	x2
	str	x0, [x29, 72]
	cbz	x0, .L1394
	ldr	x1, .LC890
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1395
	ldr	x1, .LC892
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1416
	ldr	x3, [x20, 168]
	mov	x1, 0
	mov	w2, 0
	blr	x3
	mov	w3, w0
	str	w0, [x19, 980]
	add	w0, w3, 4096
	mov	w1, 10000
	add	w0, w0, 904
	cmp	w0, w1
	bhi	.L1399
.L1420:
	mov	w21, 5000
	mov	w0, -5000
	cmp	w3, w21
	csel	w21, w3, w21, le
	cmp	w21, w0
	csel	w21, w21, w0, ge
.L1395:
	str	w21, [x19, 980]
.L1397:
	ldr	w0, [x19, 2248]
	str	xzr, [x29, 72]
	cbz	w0, .L1400
	ldr	x2, .LC901
	and	w4, w0, 1
	ubfx	x3, x0, 1, 1
	ubfx	x1, x0, 2, 1
	strb	w4, [x19, 2252]
	ubfx	x0, x0, 3, 1
	strb	w3, [x2, 92]
	strb	w1, [x19, 2253]
	strb	w0, [x19, 2254]
.L1401:
	add	x21, x19, 96
	ldr	x3, [x20, 96]
	mov	x2, 216
	mov	w1, 0
	mov	x0, x21
	mov	w23, -1
	add	x24, x19, 128
	blr	x3
	ldr	x3, [x20, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x19, 64
	blr	x3
	ldr	x0, .LC904
	mov	w1, 3
	str	x0, [x19, 1008]
	mov	w0, 134217728
	str	w0, [x29, 64]
	mov	w0, 75497472
	str	w1, [x19, 100]
	str	w0, [x29, 68]
	bl	FSP_Init
	ldr	x21, .LC905
	mov	x2, 48
	ldr	x3, [x20, 96]
	mov	w1, 0
	mov	x0, x21
	blr	x3
	ldr	x3, [x20, 104]
	mov	x2, 24
	add	x1, x22, 8
	add	x0, x19, 192
	stp	w23, w23, [x21, 16]
	stp	w23, w23, [x21, 24]
	blr	x3
	mov	x0, x24
	bl	VCTRL_OpenDrivers
	cbnz	w0, .L1405
	ldr	x2, [x20, 248]
	mov	w1, 1
	blr	x2
	ldr	x2, .LC906
	add	x0, x19, 112
	ldr	x1, .LC908
	ldr	x3, [x20, 384]
	blr	x3
	cbnz	w0, .L1417
	mov	w1, 1
	str	w1, [x19, 96]
.L1386:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1400:
	add	x21, x19, 1224
	ldr	x2, [x20, 160]
	mov	w1, 1024
	mov	x0, x21
	blr	x2
	ldr	x1, .LC903
	mov	x0, x21
	ldr	x2, [x20, 192]
	blr	x2
	str	x0, [x29, 72]
	cbz	x0, .L1401
	ldr	x1, .LC890
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1418
	ldr	x1, .LC892
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1419
	ldr	x3, [x20, 168]
	mov	x1, 0
	mov	w2, 0
	blr	x3
	mov	w1, w0
	str	w0, [x19, 2248]
.L1403:
	ldr	x2, .LC901
	and	w4, w1, 1
	ubfx	x3, x1, 1, 1
	ubfx	x0, x1, 2, 1
	strb	w4, [x19, 2252]
	ubfx	x1, x1, 3, 1
	strb	w3, [x2, 92]
	strb	w0, [x19, 2253]
	strb	w1, [x19, 2254]
	b	.L1401
	.p2align 3
.L1394:
	ldr	w3, [x19, 980]
	mov	w1, 10000
	add	w0, w3, 4096
	add	w0, w0, 904
	cmp	w0, w1
	bls	.L1420
.L1399:
	ldr	x2, .LC900
	mov	w1, 1077
	mov	w0, 32
	bl	dprint_normal
	ldr	w21, [x19, 980]
	mov	w1, 5000
	mov	w0, -5000
	cmp	w21, w1
	csel	w21, w21, w1, le
	cmp	w21, w0
	csel	w21, w21, w0, ge
	b	.L1395
	.p2align 3
.L1388:
	ldr	w3, [x19, 976]
	mov	w1, 10000
	add	w0, w3, 4096
	add	w0, w0, 904
	cmp	w0, w1
	bls	.L1421
.L1393:
	ldr	x2, .LC896
	mov	w1, 1035
	mov	w0, 32
	bl	dprint_normal
	ldr	w0, [x19, 976]
	mov	w3, 5000
	mov	w1, -5000
	cmp	w0, w3
	csel	w3, w0, w3, le
	cmp	w3, w1
	csel	w3, w3, w1, ge
	b	.L1389
	.p2align 3
.L1407:
	mov	w3, 0
	b	.L1389
	.p2align 3
.L1418:
	ldr	w1, [x19, 2248]
	b	.L1403
	.p2align 3
.L1405:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, -1
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1416:
	ldr	x3, .LC883
	mov	w4, 1063
	ldr	x2, .LC894
	mov	w1, w4
	add	x3, x3, 3424
	mov	w0, 20
	bl	dprint_normal
	b	.L1397
	.p2align 3
.L1415:
	ldr	x3, .LC883
	mov	w4, 1021
	ldr	x2, .LC894
	mov	w1, w4
	add	x3, x3, 3400
	mov	w0, 20
	bl	dprint_normal
	b	.L1391
	.p2align 3
.L1419:
	ldr	x3, .LC883
	mov	w4, 1114
	ldr	x2, .LC894
	mov	w1, w4
	add	x3, x3, 3456
	mov	w0, 20
	bl	dprint_normal
	b	.L1401
	.p2align 3
.L1417:
	mov	x0, x24
	bl	VCTRL_CloseDrivers
	mov	w0, w23
	b	.L1386
.L1414:
	ldr	x3, .LC883
	mov	w4, 7044
	ldr	x5, .LC882
	mov	w1, w4
	ldr	x2, .LC884
	add	x3, x3, 3384
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1386
	.size	VCTRL_OpenVfmw, .-VCTRL_OpenVfmw
	.align	3
.LC882:
	.xword	.LC881
	.align	3
.LC883:
	.xword	.LANCHOR3
	.align	3
.LC884:
	.xword	.LC105
	.align	3
.LC885:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC886:
	.xword	.LANCHOR0
	.align	3
.LC888:
	.xword	.LC887
	.align	3
.LC890:
	.xword	.LC889
	.align	3
.LC892:
	.xword	.LC891
	.align	3
.LC894:
	.xword	.LC893
	.align	3
.LC896:
	.xword	.LC895
	.align	3
.LC898:
	.xword	.LC897
	.align	3
.LC900:
	.xword	.LC899
	.align	3
.LC901:
	.xword	.LANCHOR1
	.align	3
.LC903:
	.xword	.LC902
	.align	3
.LC904:
	.xword	VCTRL_EventReport
	.align	3
.LC905:
	.xword	g_ChanCtx
	.align	3
.LC906:
	.xword	VCTRL_DecodeThread
	.align	3
.LC908:
	.xword	.LC907
	.global	s_pstVfmwChan
	.global	g_VfmwGlobalStat
	.global	g_VfmwChanStat
	.global	g_EventReportFunc
	.global	g_AppleAirplayMirrorinigFlag
	.global	g_IRQ_FLAG
	.global	g_SaveMemRecord
	.global	g_SaveFilePath
	.global	g_SaveRawAfterReset
	.global	g_SaveYUVBitDepth
	.global	g_SaveYuvEnd
	.global	g_SaveYuvBegin
	.global	g_SaveYuvCount
	.global	g_SaveElFileHandler
	.global	g_SaveReorderMetadataFileHandler
	.global	g_SaveMetadataFileHandler
	.global	g_SaveDecYuvFileHandler
	.global	g_SaveDispYuvFileHandler
	.global	g_SaveSegFileHandler
	.global	g_SaveRawFileHandler
	.global	g_ClkSelect
	.global	g_StatisticsEnable
	.global	g_MaskMMUErrIntEnable
	.global	g_StandardObedience
	.global	g_CurProcChan
	.global	g_H264FullPictureRepairDisable
	.global	g_NotDirect_8x8_InferenceFlag
	.global	g_AllowBPicBeforePPic
	.global	g_ExtraDisp
	.global	g_ExtraRef
	.global	g_ExtraCommand
	.global	g_RpuStartCode
	.section	.rodata
	.align	3
.LANCHOR2 = . + 0
	.type	__func__.11587, %object
	.size	__func__.11587, 20
__func__.11587:
	.string	"VfmwProc_SaveDecYUV"
	.zero	4
	.type	__func__.10789, %object
	.size	__func__.10789, 26
__func__.10789:
	.string	"VCTRL_HandleAllocMemEvent"
	.zero	6
	.type	__func__.10798, %object
	.size	__func__.10798, 28
__func__.10798:
	.string	"VCTRL_HandleReleaseMemEvent"
	.zero	4
	.type	__func__.10824, %object
	.size	__func__.10824, 33
__func__.10824:
	.string	"VCTRL_HandleAllocPreProcessEvent"
	.zero	7
	.type	__func__.10846, %object
	.size	__func__.10846, 18
__func__.10846:
	.string	"VCTRL_EventReport"
	.zero	6
	.type	__func__.10806, %object
	.size	__func__.10806, 33
__func__.10806:
	.string	"VCTRL_HandleReleaseBurstMemEvent"
	.zero	7
	.type	__func__.10814, %object
	.size	__func__.10814, 29
__func__.10814:
	.string	"VCTRL_HandleCancelAllocEvent"
	.align	3
.LANCHOR3 = . + 0
	.type	__func__.11728, %object
	.size	__func__.11728, 24
__func__.11728:
	.string	"VCTRL_SetLastFrameState"
	.type	__func__.10762, %object
	.size	__func__.10762, 17
__func__.10762:
	.string	"VCTRL_RecordData"
	.zero	7
	.type	__func__.10858, %object
	.size	__func__.10858, 18
__func__.10858:
	.string	"VCTRL_SetCallBack"
	.zero	6
	.type	__func__.10894, %object
	.size	__func__.10894, 25
__func__.10894:
	.string	"VCTRL_SetStreamInterface"
	.zero	7
	.type	__func__.10902, %object
	.size	__func__.10902, 30
__func__.10902:
	.string	"VCTRL_SetDeiMemQueryInterface"
	.zero	2
	.type	__func__.10913, %object
	.size	__func__.10913, 20
__func__.10913:
	.string	"VCTRL_GetStreamSize"
	.zero	4
	.type	__func__.10920, %object
	.size	__func__.10920, 20
__func__.10920:
	.string	"VCTRL_CheckFreshRaw"
	.zero	4
	.type	__func__.10927, %object
	.size	__func__.10927, 20
__func__.10927:
	.string	"VCTRL_CheckFreshSeg"
	.zero	4
	.type	__func__.10932, %object
	.size	__func__.10932, 25
__func__.10932:
	.string	"VCTRL_SetDiscardPicParam"
	.zero	7
	.type	__func__.10967, %object
	.size	__func__.10967, 23
__func__.10967:
	.string	"VCTRL_FreeChanResource"
	.zero	1
	.type	__func__.10950, %object
	.size	__func__.10950, 22
__func__.10950:
	.string	"VCTRL_FreeVdhResource"
	.zero	2
	.type	__func__.10956, %object
	.size	__func__.10956, 22
__func__.10956:
	.string	"VCTRL_FreeScdResource"
	.zero	2
	.type	__func__.10962, %object
	.size	__func__.10962, 22
__func__.10962:
	.string	"VCTRL_FreeCtxResource"
	.zero	2
	.type	__func__.11089, %object
	.size	__func__.11089, 17
__func__.11089:
	.string	"VCTRL_GetChanCfg"
	.zero	7
	.type	__func__.11145, %object
	.size	__func__.11145, 14
__func__.11145:
	.string	"VCTRL_SeekPts"
	.zero	2
	.type	__func__.11149, %object
	.size	__func__.11149, 20
__func__.11149:
	.string	"VCTRL_InitSyntaxCtx"
	.zero	4
	.type	__func__.11160, %object
	.size	__func__.11160, 20
__func__.11160:
	.string	"VCTRL_ReleaseStream"
	.zero	4
	.type	__func__.11192, %object
	.size	__func__.11192, 19
__func__.11192:
	.string	"VCTRL_GetChanImage"
	.zero	5
	.type	__FUNCTION__.11196, %object
	.size	__FUNCTION__.11196, 19
__FUNCTION__.11196:
	.string	"VCTRL_GetChanImage"
	.zero	5
	.type	__func__.11202, %object
	.size	__func__.11202, 23
__func__.11202:
	.string	"VCTRL_ReleaseChanImage"
	.zero	1
	.type	__FUNCTION__.11206, %object
	.size	__FUNCTION__.11206, 23
__FUNCTION__.11206:
	.string	"VCTRL_ReleaseChanImage"
	.zero	1
	.type	__func__.11214, %object
	.size	__func__.11214, 23
__func__.11214:
	.string	"VCTRL_GetHDRConfigInfo"
	.zero	1
	.type	__func__.11229, %object
	.size	__func__.11229, 18
__func__.11229:
	.string	"VCTRL_GetDecParam"
	.zero	6
	.type	__func__.11286, %object
	.size	__func__.11286, 20
__func__.11286:
	.string	"VCTRL_ClearDecparam"
	.zero	4
	.type	__func__.11304, %object
	.size	__func__.11304, 21
__func__.11304:
	.string	"VCTRL_VdmProcSedOnly"
	.zero	3
	.type	__func__.11314, %object
	.size	__func__.11314, 21
__func__.11314:
	.string	"VCTRL_GetImageBuffer"
	.zero	3
	.type	__func__.11325, %object
	.size	__func__.11325, 22
__func__.11325:
	.string	"VCTRL_ConfigFFFBSpeed"
	.zero	2
	.type	__func__.11330, %object
	.size	__func__.11330, 20
__func__.11330:
	.string	"VCTRL_ConfigPVRInfo"
	.zero	4
	.type	__func__.11334, %object
	.size	__func__.11334, 19
__func__.11334:
	.string	"VCTRL_IsChanActive"
	.zero	5
	.type	__func__.11338, %object
	.size	__func__.11338, 19
__func__.11338:
	.string	"VCTRL_VarifyOption"
	.zero	5
	.type	__func__.11356, %object
	.size	__func__.11356, 21
__func__.11356:
	.string	"VCTRL_GetChanMemSize"
	.zero	3
	.type	__func__.11439, %object
	.size	__func__.11439, 21
__func__.11439:
	.string	"VCTRL_GetChanIDByCtx"
	.zero	3
	.type	__func__.11461, %object
	.size	__func__.11461, 20
__func__.11461:
	.string	"VCTRL_DecChanSyntax"
	.zero	4
	.type	__func__.11497, %object
	.size	__func__.11497, 20
__func__.11497:
	.string	"VCTRL_GetChanImgNum"
	.zero	4
	.type	__func__.10941, %object
	.size	__func__.10941, 19
__func__.10941:
	.string	"VCTRL_GetChanState"
	.zero	5
	.type	g_VfmwProcCommandTable, %object
	.size	g_VfmwProcCommandTable, 2016
g_VfmwProcCommandTable:
	.word	0
	.zero	4
	.xword	VfmwProc_SetPrintLevel
	.string	"set print level"
	.zero	14
	.zero	2
	.word	2
	.zero	4
	.xword	VfmwProc_SetErrorThreshold
	.string	"set error threshold"
	.zero	10
	.zero	2
	.word	3
	.zero	4
	.xword	VfmwProc_SetDefaultOutputOrder
	.string	"set default output order"
	.zero	5
	.zero	2
	.word	4
	.zero	4
	.xword	VfmwProc_SetDecOrderOutput
	.string	"set dec order"
	.zero	16
	.zero	2
	.word	5
	.zero	4
	.xword	VfmwProc_SetDecMode
	.string	"set dec mode"
	.zero	17
	.zero	2
	.word	7
	.zero	4
	.xword	VfmwProc_SetDropStreamThreshold
	.string	"set drop stream threshold"
	.zero	4
	.zero	2
	.word	9
	.zero	4
	.xword	VfmwProc_SetFsWaterMark
	.string	"set fs water marker"
	.zero	10
	.zero	2
	.word	10
	.zero	4
	.xword	VfmwProc_SetUvmosEnable
	.string	"set uvmos enable"
	.zero	13
	.zero	2
	.word	11
	.zero	4
	.xword	VfmwProc_SetUSE_FF_APT_EN
	.string	"set ff apt enbale"
	.zero	12
	.zero	2
	.word	13
	.zero	4
	.xword	VfmwProc_SetCurProcChan
	.string	"set expected channel"
	.zero	9
	.zero	2
	.word	256
	.zero	4
	.xword	VfmwProc_PrintTracer
	.string	"print tracer informaton"
	.zero	6
	.zero	2
	.word	257
	.zero	4
	.xword	VfmwProc_SetScdPrint
	.string	"enable scd print control"
	.zero	5
	.zero	2
	.word	512
	.zero	4
	.xword	VfmwProc_SaveRaw
	.string	"save raw data"
	.zero	16
	.zero	2
	.word	513
	.zero	4
	.xword	VfmwProc_SaveSeg
	.string	"save seg data"
	.zero	16
	.zero	2
	.word	514
	.zero	4
	.xword	VfmwProc_SaveDispYUV
	.string	"save display yuv"
	.zero	13
	.zero	2
	.word	515
	.zero	4
	.xword	VfmwProc_SaveDecYUV
	.string	"save decode yuv"
	.zero	14
	.zero	2
	.word	528
	.zero	4
	.xword	VfmwProc_SaveMetadata
	.string	"save metadata"
	.zero	16
	.zero	2
	.word	530
	.zero	4
	.xword	VfmwProc_SaveReorderMetadata
	.string	"save reorder metadata"
	.zero	8
	.zero	2
	.word	531
	.zero	4
	.xword	VfmwProc_SaveEL
	.string	"save el stream"
	.zero	15
	.zero	2
	.word	544
	.zero	4
	.xword	VfmwProc_SetSaveRawAfterReset
	.string	"set save raw data after reset"
	.zero	2
	.word	545
	.zero	4
	.xword	VfmwProc_SetSaveYuvBitDepth
	.string	"set save yuv bit depth"
	.zero	7
	.zero	2
	.word	560
	.zero	4
	.xword	VfmwProc_SetSaveYuvBegin
	.string	"set save yuv begin"
	.zero	11
	.zero	2
	.word	561
	.zero	4
	.xword	VfmwProc_SetSaveYuvEnd
	.string	"set save yuv end"
	.zero	13
	.zero	2
	.word	768
	.zero	4
	.xword	VfmwProc_TestSuspend
	.string	"test suspend"
	.zero	17
	.zero	2
	.word	769
	.zero	4
	.xword	VfmwProc_TestResume
	.string	"test resume"
	.zero	18
	.zero	2
	.word	896
	.zero	4
	.xword	VfmwProc_TestStopChan
	.string	"test stop channel"
	.zero	12
	.zero	2
	.word	897
	.zero	4
	.xword	VfmwProc_TestResetChan
	.string	"test reset channel"
	.zero	11
	.zero	2
	.word	898
	.zero	4
	.xword	VfmwProc_TestStartChan
	.string	"test start channel"
	.zero	11
	.zero	2
	.word	899
	.zero	4
	.xword	VfmwProc_TestRestartChan
	.string	"test restart channel"
	.zero	9
	.zero	2
	.word	1024
	.zero	4
	.xword	VfmwProc_TestTimeSequence
	.string	"set thread sleep time in ms"
	.zero	2
	.zero	2
	.word	1026
	.zero	4
	.xword	VfmwProc_TestStopDec
	.ascii	"stop decode at given frame num"
	.zero	2
	.word	1280
	.zero	4
	.xword	VfmwProc_SetTraceCtrl
	.string	"set trace control"
	.zero	12
	.zero	2
	.word	1281
	.zero	4
	.xword	VfmwProc_SetTraceBSPeriod
	.string	"set trace bitstream period"
	.zero	3
	.zero	2
	.word	1282
	.zero	4
	.xword	VfmwProc_SetTraceFramePeriod
	.string	"set trace frame period"
	.zero	7
	.zero	2
	.word	1283
	.zero	4
	.xword	VfmwProc_SetTraceImgPeriod
	.string	"set trace image period"
	.zero	7
	.zero	2
	.word	1536
	.zero	4
	.xword	VfmwProc_OpenModuleLowly
	.string	"enable module lowdelay"
	.zero	7
	.zero	2
	.word	1537
	.zero	4
	.xword	VfmwProc_CloseModuleLowly
	.string	"disable module lowdelay"
	.zero	6
	.zero	2
	.word	1541
	.zero	4
	.xword	VfmwProc_SetSedOnlyEnable
	.string	"set sed only switch"
	.zero	10
	.zero	2
	.word	2304
	.zero	4
	.xword	VfmwProc_SetClkSelect
	.string	"set vdh clock selection"
	.zero	6
	.zero	2
	.word	2305
	.zero	4
	.xword	VfmwProc_SetStandardObedience
	.string	"set standard obedience"
	.zero	7
	.zero	2
	.word	2306
	.zero	4
	.xword	VfmwProc_SetStatisticsEnable
	.string	"set statistics enable"
	.zero	8
	.zero	2
	.word	65535
	.zero	4
	.xword	0
	.zero	32
	.type	__func__.11717, %object
	.size	__func__.11717, 22
__func__.11717:
	.string	"VCTRL_ShowProcCommand"
	.zero	2
	.type	__func__.11743, %object
	.size	__func__.11743, 22
__func__.11743:
	.string	"VCTRL_OutputLastFrame"
	.zero	2
	.type	__func__.11275, %object
	.size	__func__.11275, 15
__func__.11275:
	.string	"VCTRL_PostProc"
	.zero	1
	.type	__func__.11299, %object
	.size	__func__.11299, 18
__func__.11299:
	.string	"VCTRL_VdmPostProc"
	.zero	6
	.type	__func__.11799, %object
	.size	__func__.11799, 19
__func__.11799:
	.string	"VCTRL_OpenHardware"
	.zero	5
	.type	__func__.11068, %object
	.size	__func__.11068, 16
__func__.11068:
	.string	"VCTRL_StartChan"
	.type	__func__.11809, %object
	.size	__func__.11809, 20
__func__.11809:
	.string	"VCTRL_CloseHardware"
	.zero	4
	.type	__func__.11084, %object
	.size	__func__.11084, 15
__func__.11084:
	.string	"VCTRL_StopChan"
	.zero	1
	.type	__func__.11182, %object
	.size	__func__.11182, 26
__func__.11182:
	.string	"VCTRL_ResetChanWithOption"
	.zero	6
	.type	__func__.11167, %object
	.size	__func__.11167, 26
__func__.11167:
	.string	"VCTRL_MarkImageOutHanging"
	.zero	6
	.type	__func__.10979, %object
	.size	__func__.10979, 17
__func__.10979:
	.string	"VCTRL_CheckParam"
	.zero	7
	.type	__func__.11139, %object
	.size	__func__.11139, 17
__func__.11139:
	.string	"VCTRL_ConfigChan"
	.zero	7
	.type	__func__.11062, %object
	.size	__func__.11062, 18
__func__.11062:
	.string	"VCTRL_DestroyChan"
	.zero	6
	.type	__func__.11836, %object
	.size	__func__.11836, 21
__func__.11836:
	.string	"VCTRL_BindRequireMem"
	.zero	3
	.type	__func__.11842, %object
	.size	__func__.11842, 25
__func__.11842:
	.string	"VCTRL_SetFrameBufferMode"
	.zero	7
	.type	__func__.11850, %object
	.size	__func__.11850, 23
__func__.11850:
	.string	"VCTRL_BindExternBuffer"
	.zero	1
	.type	__func__.11858, %object
	.size	__func__.11858, 25
__func__.11858:
	.string	"VCTRL_UnBindExternBuffer"
	.zero	7
	.type	__func__.11864, %object
	.size	__func__.11864, 24
__func__.11864:
	.string	"VCTRL_SetFrameBufferNum"
	.type	__func__.11883, %object
	.size	__func__.11883, 24
__func__.11883:
	.string	"VCTRL_IsResolutionValid"
	.type	__func__.11895, %object
	.size	__func__.11895, 20
__func__.11895:
	.string	"VCTRL_RecordPosTime"
	.zero	4
	.type	__func__.11910, %object
	.size	__func__.11910, 18
__func__.11910:
	.string	"VCTRL_OpenDrivers"
	.zero	6
	.type	__func__.11925, %object
	.size	__func__.11925, 15
__func__.11925:
	.string	"VCTRL_OpenVfmw"
	.zero	1
	.type	__FUNCTION__.10869, %object
	.size	__FUNCTION__.10869, 24
__FUNCTION__.10869:
	.string	"VCTRL_GetExtraRefFrmNum"
	.type	__FUNCTION__.10875, %object
	.size	__FUNCTION__.10875, 25
__FUNCTION__.10875:
	.string	"VCTRL_GetExtraDispFrmNum"
	.zero	7
	.type	__FUNCTION__.10881, %object
	.size	__FUNCTION__.10881, 22
__FUNCTION__.10881:
	.string	"VCTRL_GetExtraCtrlCmd"
	.data
	.align	3
.LANCHOR1 = . + 0
	.type	g_ClkSelect, %object
	.size	g_ClkSelect, 4
g_ClkSelect:
	.word	-1
	.type	g_SaveYuvEnd, %object
	.size	g_SaveYuvEnd, 4
g_SaveYuvEnd:
	.word	-1
	.type	g_SaveYUVBitDepth, %object
	.size	g_SaveYUVBitDepth, 4
g_SaveYUVBitDepth:
	.word	8
	.zero	4
	.type	g_SaveFilePath, %object
	.size	g_SaveFilePath, 64
g_SaveFilePath:
	.byte	47
	.byte	109
	.byte	110
	.byte	116
	.byte	0
	.zero	59
	.type	g_DefaultOutputOrder, %object
	.size	g_DefaultOutputOrder, 4
g_DefaultOutputOrder:
	.word	7
	.type	g_SedOnlyEnable, %object
	.size	g_SedOnlyEnable, 4
g_SedOnlyEnable:
	.word	-1
	.type	g_IRQ_FLAG, %object
	.size	g_IRQ_FLAG, 4
g_IRQ_FLAG:
	.word	128
	.type	g_NotDirect_8x8_InferenceFlag, %object
	.size	g_NotDirect_8x8_InferenceFlag, 1
g_NotDirect_8x8_InferenceFlag:
	.byte	1
	.zero	3
	.type	g_MaskMMUErrIntEnable, %object
	.size	g_MaskMMUErrIntEnable, 4
g_MaskMMUErrIntEnable:
	.word	1
	.zero	4
	.type	g_RpuStartCode, %object
	.size	g_RpuStartCode, 5
g_RpuStartCode:
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	25
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC1:
	ASCII(.string	"Set statistics: %d\n" )
	.zero	4
.LC4:
	ASCII(.string	"Set standard obedience: %d\n" )
	.zero	4
.LC7:
	ASCII(.string	"g_ClkSelect(%d) set error! dat = %d not support\n" )
	.zero	7
.LC10:
	ASCII(.string	"------ g_TraceImgPeriod = %x ------\n" )
	.zero	3
.LC13:
	ASCII(.string	"------ g_TraceFramePeriod = %x ------\n" )
	.zero	1
.LC16:
	ASCII(.string	"------ g_TraceBsPeriod = %x ------\n" )
	.zero	4
.LC19:
	ASCII(.string	"------ g_TraceCtrl = %x ------\n" )
.LC22:
	ASCII(.string	"------ dec stop = %d ------\n" )
	.zero	3
.LC25:
	ASCII(.string	"------ dec task delay %d ms ------\n" )
	.zero	4
.LC28:
	ASCII(.string	"ERROR: set save yuv end failed, begin %d > end %d\n" )
	.zero	5
.LC31:
	ASCII(.string	"------ Set save yuv end[%d, %d] ------\n" )
.LC34:
	ASCII(.string	"ERROR: set save yuv begin failed, begin %d > end %d\n" )
	.zero	3
.LC37:
	ASCII(.string	"------ Set save yuv begin[%d, %d] ------\n" )
	.zero	6
.LC39:
	ASCII(.string	"ERROR: g_SaveYUVBitDepth should be 8 or 10! (not to be %d)\n" )
	.zero	4
.LC42:
	ASCII(.string	"------ g_SaveYUVBitDepth = %d ------\n" )
	.zero	2
.LC45:
	ASCII(.string	"SaveRawAfterReset = %d\n" )
.LC47:
	ASCII(.string	"SaveRawAfterReset can NOT be set to %d, must be 0 or 1\n" )
.LC52:
	ASCII(.string	"%s/vfmw_el_save_%d.dat" )
	.zero	1
.LC54:
	ASCII(.string	"OK create file '%s' for channel %d el stream save\n" )
	.zero	5
.LC56:
	ASCII(.string	"failed create file '%s' for el stream save!\n" )
	.zero	3
.LC58:
	ASCII(.string	">>>> close el stream saving >>>>\n" )
	.zero	6
.LC62:
	ASCII(.string	"%s not support now!\n" )
	.zero	3
.LC64:
	ASCII(.string	"NO SUCH CHANNEL : %d\n" )
	.zero	2
.LC67:
	ASCII(.string	"Pay attention to  CHANNEL : %d\n" )
.LC70:
	ASCII(.string	"g_Use_FFAPT_Enable = %d\n" )
	.zero	7
.LC72:
	ASCII(.string	"g_Use_FFAPT_Enable can NOT be set to %d, must be 0 or 1\n" )
	.zero	7
.LC75:
	ASCII(.string	"g_FsWaterMarkEnable = %d\n" )
	.zero	6
.LC77:
	ASCII(.string	"g_FsWaterMarkEnable can NOT be set to %d, must be 0 or 1\n" )
	.zero	6
.LC79:
	ASCII(.string	"Invalid output order %d\n" )
	.zero	7
.LC81:
	ASCII(.string	"set default output order %d\n" )
	.zero	3
.LC85:
	ASCII(.string	"PrintEnable = 0x%x\n" )
	.zero	4
.LC88:
	ASCII(.string	"%s ERROR: Arg Len %d != %d\n" )
	.zero	4
.LC91:
	ASCII(.string	"%s" )
	.zero	5
.LC93:
	ASCII(.string	"%s ERROR: VMM_CMD_Alloc %s size %d failed!\n" )
	.zero	4
.LC99:
	ASCII(.string	"%s ERROR: VMM_CMD_Release %s phy 0x%x failed!\n" )
	.zero	1
.LC103:
	ASCII(.string	"ChanID out of range" )
	.zero	4
.LC105:
	ASCII(.string	"%s %d: %s\n" )
	.zero	5
.LC107:
	ASCII(.string	"pMemInfo is NULL" )
	.zero	7
.LC111:
	ASCII(.string	"%s ERROR: VMM_CMD_BLK_OpsInvoke %d  Type failed!\n" )
	.zero	6
.LC114:
	ASCII(.string	"InstID out of range" )
	.zero	4
.LC119:
	ASCII(.string	"Chan inactive" )
	.zero	2
.LC123:
	ASCII(.string	"%s ERROR: VMM_CMD_ReleaseBurst failed!\n" )
.LC125:
	ASCII(.string	"%s ERROR: VMM_CMD_BLK_CancleCmd %d failed!\n" )
	.zero	4
.LC127:
	ASCII(.string	"g_VfmwCtrlData.event_report_vdec = NULL\n" )
	.zero	7
.LC129:
	ASCII(.string	"g_VfmwCtrlData.event_report_omxvdec = NULL\n" )
	.zero	4
.LC131:
	ASCII(.string	"%s Unkown Adapter Type: %d, Len: %d\n" )
	.zero	3
.LC137:
	ASCII(.string	"OK create file '%s' for channel %d metadata_reorder stream save\n" )
	.zero	7
.LC139:
	ASCII(.string	"failed create file '%s' for metadata_reorder stream save!\n" )
	.zero	5
.LC141:
	ASCII(.string	">>>> close metadata stream saving >>>>\n" )
.LC147:
	ASCII(.string	"OK create file '%s' for channel %d metadata stream save\n" )
	.zero	7
.LC149:
	ASCII(.string	"failed create file '%s' for metadata stream save!\n" )
	.zero	5
.LC156:
	ASCII(.string	"OK create file '%s' for channel %d seg stream save\n" )
	.zero	4
.LC158:
	ASCII(.string	"failed create file '%s' for seg stream save!\n" )
	.zero	2
.LC160:
	ASCII(.string	">>>> close seg stream saving >>>>\n" )
	.zero	5
.LC166:
	ASCII(.string	"OK create file '%s' for channel %d raw stream save\n" )
	.zero	4
.LC168:
	ASCII(.string	"failed create file '%s' for raw stream save!\n" )
	.zero	2
.LC170:
	ASCII(.string	">>>> close raw stream saving >>>>\n" )
	.zero	5
.LC175:
	ASCII(.string	"OK close yuv save.\n" )
	.zero	4
.LC178:
	ASCII(.string	"failed create file '%s' for yuv save!\n" )
	.zero	1
.LC180:
	ASCII(.string	"Failed to alloc YUV mem size %d!\n" )
	.zero	6
.LC182:
	ASCII(.string	"OK create file '%s' for chan %d yuv save.(crop %d)\n" )
	.zero	4
.LC187:
	ASCII(.string	"print memory tracer...\n" )
.LC190:
	ASCII(.string	"Disable SedOnly Func\n" )
	.zero	2
.LC192:
	ASCII(.string	"Enable SedOnly Func\n" )
	.zero	3
.LC194:
	ASCII(.string	"The channel number is to Large.\n" )
	.zero	7
.LC197:
	ASCII(.string	"------ s_pstVfmwChan[%d]->stSynExtraData.s32ModuleLowlyEnable = 1 ------\n" )
	.zero	6
.LC209:
	ASCII(.string	"VDMHAL_NULL_FUN_PRINT,L%d\n" )
	.zero	5
.LC211:
	ASCII(.string	"Wait sleep time out %d ms (isScdSleep=%d, isVdmSleep=%d)!\n" )
	.zero	5
.LC214:
	ASCII(.string	"Vfmw suspend totally take %d ms\n" )
	.zero	7
.LC216:
	ASCII(.string	"Force scd %d sleep.\n" )
	.zero	3
.LC218:
	ASCII(.string	"Force vdm %d sleep.\n" )
	.zero	3
.LC221:
	ASCII(.string	"proc cmd need no param:%p\n" )
	.zero	5
.LC227:
	ASCII(.string	"Vfmw resume totally take %d ms\n" )
.LC232:
	ASCII(.string	"%s, %d, pos(%d) error!\n" )
.LC238:
	ASCII(.string	"event_report null!" )
	.zero	5
.LC243:
	ASCII(.string	"%s Unkown Adapter Type: %d\n" )
	.zero	4
.LC252:
	ASCII(.string	"pstStreamParam is NULL" )
	.zero	1
.LC263:
	ASCII(.string	"pDeiMemIntf is NULL" )
	.zero	4
.LC272:
	ASCII(.string	"can NOT get a not-opened Chan's information of bitstream" )
	.zero	7
.LC279:
	ASCII(.string	"This Chan has not been created!!!" )
	.zero	6
.LC282:
	ASCII(.string	"Raw FreshNum=%d, FreshSize=%d\n" )
	.zero	1
.LC291:
	ASCII(.string	"Seg FreshNum=%d, FreshSize=%d\n" )
	.zero	1
.LC299:
	ASCII(.string	"pArgs is null" )
	.zero	2
.LC304:
	ASCII(.string	"%s FATAL: pstChan = NULL!\n" )
	.zero	5
.LC306:
	ASCII(.string	"%s FATAL: pChanMem_vdh = NULL!\n" )
.LC308:
	ASCII(.string	"%s FATAL: pChanMem_scd = NULL!\n" )
.LC310:
	ASCII(.string	"%s FATAL: pChanMem_ctx = NULL!\n" )
.LC318:
	ASCII(.string	"pstCfg is null" )
	.zero	1
.LC334:
	ASCII(.string	"chan not create" )
.LC343:
	ASCII(.string	"ChanID out of range!" )
	.zero	3
.LC348:
	ASCII(.string	"s_pstVfmwChan = NULL" )
	.zero	3
.LC358:
	ASCII(.string	"This channel is not opened" )
	.zero	5
.LC360:
	ASCII(.string	"pImage is NULL" )
	.zero	1
.LC364:
	ASCII(.string	"%s, %d, Phyaddr = 0x%x MetaDataPhyaddr = 0x%x image_id = %d\n" )
	.zero	3
.LC377:
	ASCII(.string	"vdm_ctrl.c,L%d: Chan inactive\n" )
	.zero	1
.LC379:
	ASCII(.string	"vdm_ctrl.c,L%d: This channel is not opened\n" )
	.zero	4
.LC382:
	ASCII(.string	"%s, %d, ===> Phyaddr 0x%x release Error, force to UnMark ImageOutHanging\n" )
	.zero	6
.LC384:
	ASCII(.string	"%s, %d, ===> Phyaddr 0x%x release success!! imageId = 0x%x\n" )
	.zero	4
.LC389:
	ASCII(.string	"vfmw_ctrl.c, line %d: ChanID out of range\n" )
	.zero	5
.LC391:
	ASCII(.string	"vfmw_ctrl.c, line %d: Chan %d is not open or not running\n" )
	.zero	6
.LC399:
	ASCII(.string	"pstHDRInput = null" )
	.zero	5
.LC405:
	ASCII(.string	"%s VidStd=%d Error!\n" )
	.zero	3
.LC409:
	ASCII(.string	"Get DecParam Type Failure!\n" )
	.zero	4
.LC412:
	ASCII(.string	"vfmw_ctrl.c, line %d: ChanID out of range is %d\n" )
	.zero	7
.LC414:
	ASCII(.string	"Chan %d is not open or not running\n" )
	.zero	4
.LC418:
	ASCII(.string	"ChanId out of range" )
	.zero	4
.LC425:
	ASCII(.string	"%s unsupport VidStd %d\n" )
.LC433:
	ASCII(.string	"This channel is not running" )
	.zero	4
.LC443:
	ASCII(.string	"%s unsupport VidStd %d.\n" )
	.zero	7
.LC451:
	ASCII(.string	"can NOT start a not-opened Chan" )
.LC453:
	ASCII(.string	"pArgs = null" )
	.zero	3
.LC475:
	ASCII(.string	"%s param invalid.\n" )
	.zero	5
.LC477:
	ASCII(.string	"pChanOption = null" )
	.zero	5
.LC481:
	ASCII(.string	"pDetailMemSize = null" )
	.zero	2
.LC484:
	ASCII(.string	"ERROR: s32MaxRefFrameNum(%d), g_ExtraRef(%d), s32DisplayFrameNum(%d), g_ExtraDisp(%d)\n" )
	.zero	1
.LC490:
	ASCII(.string	"Register irq %d failed!\n" )
	.zero	7
.LC498:
	ASCII(.string	"MEM_MapRegisterAddr reg 0x%x failed!\n" )
	.zero	2
.LC503:
	ASCII(.string	"VDMDRV_GetHalMemSize Vdh %d failed!\n" )
	.zero	3
.LC505:
	ASCII(.string	"MEM_AllocMemBlock Vdh %d failed!\n" )
	.zero	6
.LC507:
	ASCII(.string	"VDMDRV_OpenHAL Vdh %d failed!\n" )
	.zero	1
.LC513:
	ASCII(.string	"MEM_AllocMemBlock Scd %d failed!\n" )
	.zero	6
.LC515:
	ASCII(.string	"SM_OpenSCDDrv Scd %d failed!\n" )
	.zero	2
.LC518:
	ASCII(.string	"(safe,warn,danger) :amount = %d,%d,%d,%d\n" )
	.zero	6
.LC520:
	ASCII(.string	"strm_ctrl: I->IPB\n" )
	.zero	5
.LC522:
	ASCII(.string	"strm_ctrl: IPB->I\n" )
	.zero	5
.LC524:
	ASCII(.string	"(CurrMode,NextMode) = %d,%d\n" )
	.zero	3
.LC530:
	ASCII(.string	"pCtx = null" )
	.zero	4
.LC537:
	ASCII(.string	"Chan:%d pic_pts: %lld\n" )
	.zero	1
.LC539:
	ASCII(.string	"Chan:%d pic_usertag: %lld\n" )
	.zero	5
.LC541:
	ASCII(.string	"Chan:%d pic_pts: %lld pic_usertag = %lld\n" )
	.zero	6
.LC552:
	ASCII(.string	"Syntax is stopped from This channel" )
	.zero	4
.LC554:
	ASCII(.string	"[%d] vdm busy\n" )
	.zero	1
.LC556:
	ASCII(.string	"[%d] no frame\n" )
	.zero	1
.LC558:
	ASCII(.string	"[%d] no stream\n" )
.LC560:
	ASCII(.string	"Chan:%d seg_pts: %lld, seg_usertag = %lld\n" )
	.zero	5
.LC576:
	ASCII(.string	"pRefImgNum = null" )
	.zero	6
.LC578:
	ASCII(.string	"pReadImgNum = null" )
	.zero	5
.LC580:
	ASCII(.string	"pNewImgNum = null" )
	.zero	6
.LC582:
	ASCII(.string	"%s not support std %d\n" )
	.zero	1
.LC590:
	ASCII(.string	"pstChanState = NULL" )
	.zero	4
.LC599:
	ASCII(.string	"pShowStr = null" )
.LC604:
	ASCII(.string	"  0x%-15x %s" )
	.zero	3
.LC610:
	ASCII(.string	"Command \"0x%x\" not registerd!\n" )
	.zero	1
.LC623:
	ASCII(.string	"Last frame output failed!\n" )
	.zero	5
.LC625:
	ASCII(.string	"Last frame output successed!\n" )
	.zero	2
.LC627:
	ASCII(.string	"Last frame already output, image id: %d!\n" )
	.zero	6
.LC643:
	ASCII(.string	"Chan id out of range!" )
	.zero	2
.LC648:
	ASCII(.string	"Chan not created!" )
	.zero	6
.LC650:
	ASCII(.string	"Chan not open!" )
	.zero	1
.LC661:
	ASCII(.string	"WARNING: vidio std not setted!" )
	.zero	1
.LC671:
	ASCII(.string	"start chan %d: VCTRL_StartChan return %d\n" )
	.zero	6
.LC685:
	ASCII(.string	"This Chan has not been created or has been destroyed !" )
	.zero	1
.LC689:
	ASCII(.string	"VCTRL_StopChanWithCheck fail!\n" )
	.zero	1
.LC697:
	ASCII(.string	"\n====>%s, %d=====> prepare\n" )
	.zero	4
.LC700:
	ASCII(.string	"====>%s, %d=====> end\n\n" )
.LC707:
	ASCII(.string	"Param Invalid of PChanOption is NULL\n" )
	.zero	2
.LC711:
	ASCII(.string	"line %d VCTRL_GetChanMemSize failed!\n" )
	.zero	2
.LC714:
	ASCII(.string	"vfmw have max(%d) channels opened, can NOT create more channels\n" )
	.zero	7
.LC716:
	ASCII(.string	"L: %d : part we can NOT alloc buffer for channel context\n" )
	.zero	6
.LC718:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel context\n" )
	.zero	6
.LC720:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel vdh\n" )
	.zero	2
.LC722:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel vdh, %#x < %#x\n" )
	.zero	7
.LC724:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel scd\n" )
	.zero	2
.LC726:
	ASCII(.string	"L: %d : can NOT alloc buffer for SCD\n" )
	.zero	2
.LC729:
	ASCII(.string	"Chan:%d can NOT enable FSP instance\n" )
	.zero	3
.LC731:
	ASCII(.string	"Chan:%d hal mem %d overlap scd mem %d\n" )
	.zero	1
.LC740:
	ASCII(.string	"can NOT config a not-opened Chan" )
	.zero	7
.LC742:
	ASCII(.string	"pstCfg = null" )
	.zero	2
.LC744:
	ASCII(.string	"VFMW didn't support std %d.\n" )
	.zero	3
.LC746:
	ASCII(.string	"%s check standard support failed.\n" )
	.zero	5
.LC748:
	ASCII(.string	"%s config not change, no need to proceed.\n" )
	.zero	5
.LC757:
	ASCII(.string	"chan %d: new UvmosEnable = %d\n" )
	.zero	1
.LC760:
	ASCII(.string	"chan %d: SetUvmosEnable failed!\n" )
	.zero	7
.LC762:
	ASCII(.string	"chan %d: new StrmOFThr = %d\n" )
	.zero	3
.LC765:
	ASCII(.string	"chan %d: new DecMode = %d\n" )
	.zero	5
.LC768:
	ASCII(.string	"chan %d: GetChanCfg failed!\n" )
	.zero	3
.LC770:
	ASCII(.string	"chan %d: new DecOrderOutput = %d\n" )
	.zero	6
.LC773:
	ASCII(.string	"chan %d: new ChanErrThr = %d\n" )
	.zero	2
.LC776:
	ASCII(.string	"reset chan %d: VCTRL_ResetChan return %d\n" )
	.zero	6
.LC781:
	ASCII(.string	"%s:L%d: %s\n" )
	.zero	4
.LC784:
	ASCII(.string	"This Chan has not been created or has been destroyed !!!" )
	.zero	7
.LC786:
	ASCII(.string	"can NOT stop a not-opened Chan" )
	.zero	1
.LC791:
	ASCII(.string	"stop chan %d: VCTRL_StopChan return %d\n" )
.LC813:
	ASCII(.string	"pMem = NULL" )
	.zero	4
.LC815:
	ASCII(.string	"%s Mem UniqueID %llx != Chan UniqueID %llx, ignor this bind operation.\n" )
.LC830:
	ASCII(.string	"pExternBuffer = NULL" )
	.zero	3
.LC832:
	ASCII(.string	"Attached buffer phy:%x, but vir addr is NULL\n" )
	.zero	2
.LC855:
	ASCII(.string	"Resolution min(w=%d,h=%d), this stream (w=%d,h=%d) invalid!\n" )
	.zero	3
.LC857:
	ASCII(.string	"Resolution max(w = %d, h = %d), this stream (w = %d, h = %d) invalid!\n" )
	.zero	1
.LC859:
	ASCII(.string	"Std(%d) not support 4K(w = %d, h = %d)\n" )
.LC864:
	ASCII(.string	"%s,%d,pos(%d) error!\n" )
	.zero	2
.LC875:
	ASCII(.string	"%s %d ERROR exit.\n" )
	.zero	5
.LC881:
	ASCII(.string	"pArgs null!" )
	.zero	4
.LC887:
	ASCII(.string	"g_ExtraRef=" )
	.zero	4
.LC889:
	ASCII(.string	"=" )
	.zero	6
.LC891:
	ASCII(.string	" " )
	.zero	6
.LC893:
	ASCII(.string	"fuction return value is null,%s %d unknow error!!\n" )
	.zero	5
.LC895:
	ASCII(.string	"ERROR: g_ExtraRef = %d is out of [ -5000, 5000 ]!\n" )
	.zero	5
.LC897:
	ASCII(.string	"g_ExtraDisp=" )
	.zero	3
.LC899:
	ASCII(.string	"ERROR: g_ExtraDisp = %d is out of [ -5000, 5000 ]!\n" )
	.zero	4
.LC902:
	ASCII(.string	"g_ExtraCommand=" )
.LC907:
	ASCII(.string	"HI_VFMW_VideoDecode" )
	.bss
	.align	3
.LANCHOR0 = . + 0
	.type	g_StatisticsEnable, %object
	.size	g_StatisticsEnable, 4
g_StatisticsEnable:
	.zero	4
	.type	g_StandardObedience, %object
	.size	g_StandardObedience, 4
g_StandardObedience:
	.zero	4
	.type	g_StopDec, %object
	.size	g_StopDec, 4
g_StopDec:
	.zero	4
	.type	g_SleepTime, %object
	.size	g_SleepTime, 4
g_SleepTime:
	.zero	4
	.type	g_SaveYuvBegin, %object
	.size	g_SaveYuvBegin, 4
g_SaveYuvBegin:
	.zero	4
	.type	g_SaveRawAfterReset, %object
	.size	g_SaveRawAfterReset, 4
g_SaveRawAfterReset:
	.zero	4
	.type	g_SaveElFileHandler, %object
	.size	g_SaveElFileHandler, 32
g_SaveElFileHandler:
	.zero	32
	.type	save_file_cnt.11605, %object
	.size	save_file_cnt.11605, 4
save_file_cnt.11605:
	.zero	4
	.type	g_CurProcChan, %object
	.size	g_CurProcChan, 4
g_CurProcChan:
	.zero	4
	.type	s_pstVfmwChan, %object
	.size	s_pstVfmwChan, 32
s_pstVfmwChan:
	.zero	32
	.type	g_VfmwCtrlData, %object
	.size	g_VfmwCtrlData, 216
g_VfmwCtrlData:
	.zero	216
	.type	g_SaveReorderMetadataFileHandler, %object
	.size	g_SaveReorderMetadataFileHandler, 32
g_SaveReorderMetadataFileHandler:
	.zero	32
	.type	save_file_cnt.11599, %object
	.size	save_file_cnt.11599, 4
save_file_cnt.11599:
	.zero	4
	.zero	4
	.type	g_SaveMetadataFileHandler, %object
	.size	g_SaveMetadataFileHandler, 32
g_SaveMetadataFileHandler:
	.zero	32
	.type	save_file_cnt.11593, %object
	.size	save_file_cnt.11593, 4
save_file_cnt.11593:
	.zero	4
	.zero	4
	.type	g_SaveSegFileHandler, %object
	.size	g_SaveSegFileHandler, 32
g_SaveSegFileHandler:
	.zero	32
	.type	save_file_cnt.11575, %object
	.size	save_file_cnt.11575, 4
save_file_cnt.11575:
	.zero	4
	.zero	4
	.type	g_SaveRawFileHandler, %object
	.size	g_SaveRawFileHandler, 32
g_SaveRawFileHandler:
	.zero	32
	.type	save_file_cnt.11569, %object
	.size	save_file_cnt.11569, 4
save_file_cnt.11569:
	.zero	4
	.zero	4
	.type	g_SaveDispYuvFileHandler, %object
	.size	g_SaveDispYuvFileHandler, 32
g_SaveDispYuvFileHandler:
	.zero	32
	.type	g_SaveMemRecord, %object
	.size	g_SaveMemRecord, 32
g_SaveMemRecord:
	.zero	32
	.type	SaveFileCnt.11583, %object
	.size	SaveFileCnt.11583, 4
SaveFileCnt.11583:
	.zero	4
	.type	g_SaveYuvCount, %object
	.size	g_SaveYuvCount, 4
g_SaveYuvCount:
	.zero	4
	.type	last_rec_pos_time.11193, %object
	.size	last_rec_pos_time.11193, 16
last_rec_pos_time.11193:
	.zero	16
	.type	g_VfmwChanStat, %object
	.size	g_VfmwChanStat, 400
g_VfmwChanStat:
	.zero	400
	.type	last_rec_pos_time.11203, %object
	.size	last_rec_pos_time.11203, 16
last_rec_pos_time.11203:
	.zero	16
	.type	g_ExtraRef, %object
	.size	g_ExtraRef, 4
g_ExtraRef:
	.zero	4
	.type	g_ExtraDisp, %object
	.size	g_ExtraDisp, 4
g_ExtraDisp:
	.zero	4
	.type	g_IrqDevHandle, %object
	.size	g_IrqDevHandle, 4
g_IrqDevHandle:
	.zero	4
	.zero	4
	.type	ChanPriTab.11465, %object
	.size	ChanPriTab.11465, 16
ChanPriTab.11465:
	.zero	16
	.type	g_EventReportFunc, %object
	.size	g_EventReportFunc, 8
g_EventReportFunc:
	.zero	8
	.type	PrioArray.11067, %object
	.size	PrioArray.11067, 16
PrioArray.11067:
	.zero	16
	.type	Capability.11138, %object
	.size	Capability.11138, 148
Capability.11138:
	.zero	148
	.zero	4
	.type	PrioArray.11137, %object
	.size	PrioArray.11137, 16
PrioArray.11137:
	.zero	16
	.type	g_EsBufValidFlag, %object
	.size	g_EsBufValidFlag, 16
g_EsBufValidFlag:
	.zero	16
	.type	g_IsrFlag, %object
	.size	g_IsrFlag, 1
g_IsrFlag:
	.zero	1
	.zero	7
	.type	g_CmdLine, %object
	.size	g_CmdLine, 1024
g_CmdLine:
	.zero	1024
	.type	g_ExtraCommand, %object
	.size	g_ExtraCommand, 4
g_ExtraCommand:
	.zero	4
	.type	g_AllowBPicBeforePPic, %object
	.size	g_AllowBPicBeforePPic, 1
g_AllowBPicBeforePPic:
	.zero	1
	.type	g_H264FullPictureRepairDisable, %object
	.size	g_H264FullPictureRepairDisable, 1
g_H264FullPictureRepairDisable:
	.zero	1
	.type	g_AppleAirplayMirrorinigFlag, %object
	.size	g_AppleAirplayMirrorinigFlag, 1
g_AppleAirplayMirrorinigFlag:
	.zero	1
	.zero	1
	.type	g_VfmwGlobalStat, %object
	.size	g_VfmwGlobalStat, 60
g_VfmwGlobalStat:
	.zero	60
	.zero	4
	.type	g_SaveDecYuvFileHandler, %object
	.size	g_SaveDecYuvFileHandler, 32
g_SaveDecYuvFileHandler:
	.zero	32
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
