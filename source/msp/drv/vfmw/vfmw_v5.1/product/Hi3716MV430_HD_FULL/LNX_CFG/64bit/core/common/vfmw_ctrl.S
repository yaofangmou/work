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
	.type	VCTRL_GetChanView1Image, %function
VCTRL_GetChanView1Image:
	sub	sp, sp, #544
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x1
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 108]
	cbz	w0, .L172
	mov	w20, 1
	mov	w0, 3
	ldr	w2, [x19, 444]
	mov	w1, -1
	ldr	w3, [x19, 452]
	str	w0, [x19, 152]
	mov	w0, w20
	str	w1, [x19, 92]
	str	w20, [x19, 108]
	str	w2, [x19, 456]
	str	w3, [x19, 460]
.L169:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	add	sp, sp, 544
	ret
	.p2align 3
.L172:
	ldr	x22, .LC186
	add	x1, x29, 56
	add	x22, x22, 64
	ldr	x0, [x22, w21, sxtw 3]
	add	x0, x0, 221184
	add	x0, x0, 112
	bl	SYNTAX_ReceiveImage
	cmp	w0, 1
	mov	w20, w0
	bne	.L173
	ldr	w0, [x19, 112]
	ldr	w1, [x29, 168]
	cmp	w0, w1
	bge	.L161
	ldr	w2, [x29, 144]
	mov	w1, 3
	ldr	w3, [x29, 500]
	ldr	w4, [x29, 508]
	ldr	w0, [x29, 164]
	str	w2, [x19, 92]
	str	w1, [x19, 152]
	str	w3, [x19, 456]
	str	w4, [x19, 460]
	cbz	w0, .L170
	str	w20, [x19, 108]
	.p2align 2
.L170:
	mov	w0, w20
.L177:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	add	sp, sp, 544
	ret
	.p2align 3
.L173:
	ldr	x0, [x22, w21, sxtw 3]
	add	x0, x0, 221184
	add	x0, x0, 112
	bl	SYNTAX_ReturnImage
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	add	sp, sp, 544
	ret
	.p2align 3
.L161:
	bgt	.L174
	cbz	w0, .L175
	ldr	x0, [x22, w21, sxtw 3]
	mov	x1, x19
	add	x0, x0, 221184
	add	x0, x0, 112
	bl	SYNTAX_ReleaseImage
	ldr	w0, [x29, 164]
	cbz	w0, .L176
	ldr	x3, .LC187
	mov	w1, 3107
	ldr	x2, .LC193
	mov	w0, w20
	ldr	w4, [x19, 112]
	bl	dprint_normal
	ldr	x3, .LC194
	mov	x2, 536
	add	x1, x29, 56
	mov	x0, x19
	ldr	x3, [x3, 104]
	blr	x3
	str	w20, [x19, 108]
	ldr	w3, [x29, 500]
	mov	w1, -1
	ldr	w2, [x29, 508]
	mov	w0, 3
	str	w1, [x19, 92]
	str	w0, [x19, 152]
	str	w3, [x19, 456]
	str	w2, [x19, 460]
	b	.L170
	.p2align 3
.L175:
	ldr	x0, [x22, w21, sxtw 3]
	add	x0, x0, 221184
	add	x0, x0, 112
	bl	SYNTAX_ReturnImage
	ldr	x0, [x22, w21, sxtw 3]
	mov	x1, x19
	add	x0, x0, 221184
	add	x0, x0, 112
	bl	SYNTAX_ReleaseImage
	ldr	x3, .LC187
	mov	w0, w20
	ldr	x2, .LC191
	mov	w1, 3092
	ldr	w4, [x19, 112]
	mov	w20, -2
	bl	dprint_normal
	mov	w0, w20
	b	.L177
	.p2align 3
.L174:
	ldr	x0, [x22, w21, sxtw 3]
	add	x0, x0, 221184
	add	x0, x0, 112
	bl	SYNTAX_ReturnImage
	ldr	x0, [x22, w21, sxtw 3]
	mov	x1, x19
	add	x0, x0, 221184
	add	x0, x0, 112
	bl	SYNTAX_ReleaseImage
	ldr	x3, .LC187
	mov	w0, w20
	ldr	x2, .LC189
	mov	w1, 3083
	ldr	w4, [x19, 112]
	mov	w20, -2
	ldr	w5, [x29, 168]
	bl	dprint_normal
	mov	w0, w20
	b	.L177
.L176:
	ldr	x0, [x22, w21, sxtw 3]
	add	x1, x29, 56
	add	x0, x0, 221184
	add	x0, x0, 112
	bl	SYNTAX_ReleaseImage
	ldr	x3, .LC187
	mov	w1, 3107
	ldr	x2, .LC193
	mov	w0, w20
	ldr	w4, [x19, 112]
	bl	dprint_normal
	mov	w0, -2
	b	.L169
	.size	VCTRL_GetChanView1Image, .-VCTRL_GetChanView1Image
	.align	3
.LC186:
	.xword	.LANCHOR0
	.align	3
.LC187:
	.xword	.LANCHOR3
	.align	3
.LC189:
	.xword	.LC188
	.align	3
.LC191:
	.xword	.LC190
	.align	3
.LC193:
	.xword	.LC192
	.align	3
.LC194:
	.xword	vfmw_Osal_Func_Ptr_S
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
	ldr	x19, .LC196
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
.LC196:
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
	ldr	x2, .LC198
	mov	w1, 5398
	mov	w0, 32
	bl	dprint_normal
	bl	DBG_PrintTracer
	ldp	x29, x30, [sp], 16
	ret
	.size	VfmwProc_PrintTracer, .-VfmwProc_PrintTracer
	.align	3
.LC198:
	.xword	.LC197
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
	ldr	x3, .LC199
	cbz	w0, .L183
	ldr	x2, .LC203
	mov	w4, 1
	mov	w1, 5930
	mov	w0, 32
	str	w4, [x3, 84]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L183:
	ldr	x2, .LC201
	mov	w1, 5925
	mov	w0, 32
	str	wzr, [x3, 84]
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetSedOnlyEnable, .-VfmwProc_SetSedOnlyEnable
	.align	3
.LC199:
	.xword	.LANCHOR1
	.align	3
.LC201:
	.xword	.LC200
	.align	3
.LC203:
	.xword	.LC202
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
	bhi	.L187
	ldr	x5, .LC206
	mov	w3, w4
	ldr	x2, .LC208
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
.L187:
	ldr	x2, .LC205
	mov	w1, 5896
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_CloseModuleLowly, .-VfmwProc_CloseModuleLowly
	.align	3
.LC205:
	.xword	.LC204
	.align	3
.LC206:
	.xword	.LANCHOR0
	.align	3
.LC208:
	.xword	.LC207
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
	bhi	.L191
	ldr	x5, .LC211
	mov	w3, w4
	ldr	x2, .LC212
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
.L191:
	ldr	x2, .LC210
	mov	w1, 5880
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_OpenModuleLowly, .-VfmwProc_OpenModuleLowly
	.align	3
.LC210:
	.xword	.LC204
	.align	3
.LC211:
	.xword	.LANCHOR0
	.align	3
.LC212:
	.xword	.LC207
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_SetLastFrameState.part.22, %function
VCTRL_SetLastFrameState.part.22:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC215
	mov	w4, 6193
	ldr	x5, .LC214
	mov	w1, w4
	ldr	x2, .LC216
	add	x3, x3, 24
	mov	w0, 0
	bl	dprint_normal
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_SetLastFrameState.part.22, .-VCTRL_SetLastFrameState.part.22
	.align	3
.LC214:
	.xword	.LC103
	.align	3
.LC215:
	.xword	.LANCHOR3
	.align	3
.LC216:
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
	ldr	x21, .LC217
	ldr	x0, [x21]
	blr	x0
	ldr	x25, .LC218
	mov	w23, w0
	ldr	x1, [x25]
	cbz	x1, .L194
	mov	w0, 0
	blr	x1
.L196:
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
	b	.L195
	.p2align 3
.L197:
	bl	VDMDRV_GetSleepStage
	cmp	w0, 2
	mov	w19, 1
	mov	w22, w19
	beq	.L200
.L231:
	tst	w24, w22
	mov	w0, 10
	bne	.L200
	subs	w20, w20, #1
	beq	.L232
	ldr	x1, [x21, 240]
	blr	x1
	cmp	w19, 1
	ccmp	w24, 1, 0, eq
	beq	.L200
.L195:
	mov	w0, 0
	bl	SCDDRV_GetSleepStage
	cmp	w0, 2
	mov	w0, 0
	beq	.L197
	bl	VDMDRV_GetSleepStage
	cmp	w0, 2
	mov	w22, w19
	bne	.L231
	mov	w24, 1
	b	.L231
	.p2align 3
.L232:
	ldr	x0, [x21]
	blr	x0
	cmp	w26, w0
	sub	w3, w0, w26
	bls	.L203
	mvn	w26, w26
	add	w3, w26, w0
.L203:
	ldr	x2, .LC222
	mov	w5, w24
	mov	w4, w19
	mov	w1, 270
	mov	w0, 0
	bl	dprint_normal
	cbnz	w19, .L218
	ldr	x2, .LC227
	mov	w3, 0
	mov	w1, 276
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	bl	SCDDRV_ForceSleep
.L218:
	cbnz	w24, .L200
	ldr	x2, .LC229
	mov	w3, 0
	mov	w1, 285
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	bl	VDMDRV_ForceSleep
.L200:
	ldr	x1, [x25, 64]
	cbz	x1, .L207
	mov	w0, 0
	blr	x1
.L207:
	ldr	x1, [x25, 48]
	cbz	x1, .L233
	mov	w0, 0
	blr	x1
	ldr	x1, [x25, 16]
	cbz	x1, .L234
.L210:
	mov	w0, 0
	blr	x1
.L211:
	ldr	x20, .LC223
	ldr	w1, [x20, 96]
	cmp	w1, 1
	bne	.L212
	ldr	w1, [x20, 100]
	mov	w2, 2
	str	w2, [x20, 104]
	cmp	w1, 1
	beq	.L214
	ldr	x1, [x21, 240]
	mov	w0, 10
	mov	w19, 49
	blr	x1
	b	.L215
	.p2align 3
.L235:
	ldr	x1, [x21, 240]
	blr	x1
	subs	w19, w19, #1
	beq	.L214
.L215:
	ldr	w1, [x20, 100]
	mov	w0, 10
	cmp	w1, 1
	bne	.L235
.L214:
	str	wzr, [x20, 104]
.L212:
	ldr	x0, [x21]
	blr	x0
	cmp	w23, w0
	sub	w3, w0, w23
	bls	.L217
	mvn	w23, w23
	add	w3, w23, w0
.L217:
	ldr	x2, .LC225
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
.L233:
	mov	w3, 320
	ldr	x2, .LC220
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldr	x1, [x25, 16]
	cbnz	x1, .L210
	.p2align 2
.L234:
	mov	w3, 325
	ldr	x2, .LC220
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L211
	.p2align 3
.L194:
	mov	w3, 343
	ldr	x2, .LC220
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L196
	.size	VCTRL_Suspend, .-VCTRL_Suspend
	.align	3
.LC217:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC218:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC220:
	.xword	.LC219
	.align	3
.LC222:
	.xword	.LC221
	.align	3
.LC223:
	.xword	.LANCHOR0
	.align	3
.LC225:
	.xword	.LC224
	.align	3
.LC227:
	.xword	.LC226
	.align	3
.LC229:
	.xword	.LC228
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
	ldr	x2, .LC232
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
.LC232:
	.xword	.LC231
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
	ldr	x21, .LC233
	ldr	x0, [x21]
	blr	x0
	ldr	x19, .LC234
	mov	w22, w0
	ldr	x1, [x19, 8]
	cbz	x1, .L257
	mov	w0, 0
	blr	x1
	ldr	x1, [x19, 40]
	cbz	x1, .L258
.L240:
	mov	w0, 0
	blr	x1
.L241:
	ldr	x1, [x19, 56]
	cbz	x1, .L242
	mov	w0, 0
	blr	x1
.L242:
	mov	w0, 0
	bl	SCDDRV_ExitSleep
	mov	w0, 0
	bl	VDMDRV_ExitSleep
	ldr	x20, .LC236
	ldr	w0, [x20, 96]
	cmp	w0, 1
	bne	.L243
	ldr	w2, [x20, 100]
	str	w0, [x20, 104]
	cmp	w2, 2
	beq	.L245
	ldr	x1, [x21, 240]
	mov	w0, 10
	mov	w19, 49
	blr	x1
	b	.L246
	.p2align 3
.L259:
	ldr	x1, [x21, 240]
	blr	x1
	subs	w19, w19, #1
	beq	.L245
.L246:
	ldr	w1, [x20, 100]
	mov	w0, 10
	cmp	w1, 2
	bne	.L259
.L245:
	str	wzr, [x20, 104]
.L243:
	ldr	x0, [x21]
	blr	x0
	cmp	w22, w0
	sub	w3, w0, w22
	bls	.L248
	mvn	w3, w22
	add	w3, w3, w0
.L248:
	ldr	x2, .LC238
	mov	w1, 426
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L257:
	mov	w3, 383
	ldr	x2, .LC235
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldr	x1, [x19, 40]
	cbnz	x1, .L240
	.p2align 2
.L258:
	mov	w3, 388
	ldr	x2, .LC235
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L241
	.size	VCTRL_Resume, .-VCTRL_Resume
	.align	3
.LC233:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC234:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC235:
	.xword	.LC219
	.align	3
.LC236:
	.xword	.LANCHOR0
	.align	3
.LC238:
	.xword	.LC237
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
	ldr	x2, .LC240
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
.LC240:
	.xword	.LC231
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
	bhi	.L266
	ldr	x3, .LC244
	ldrb	w0, [x3, x19]
	cmp	w0, 14
	bhi	.L265
	add	w4, w0, 1
	uxtb	w4, w4
.L264:
	lsl	x2, x19, 4
	ldr	x1, .LC245
	sub	x2, x2, x19
	strb	w4, [x3, x19]
	add	x0, x2, x0, sxtw
	str	w20, [x1, x0, lsl 2]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L265:
	mov	w4, 1
	mov	w0, 0
	b	.L264
	.p2align 3
.L266:
	ldr	x3, .LC241
	mov	w4, 565
	ldr	x2, .LC243
	mov	w5, w19
	add	x3, x3, 48
	mov	w1, w4
	mov	w0, 32
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_RecordData, .-VCTRL_RecordData
	.align	3
.LC241:
	.xword	.LANCHOR3
	.align	3
.LC243:
	.xword	.LC242
	.align	3
.LC244:
	.xword	g_DataRecId
	.align	3
.LC245:
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
	ldr	x1, .LC246
	mov	w0, 0
	ldr	x1, [x1, 256]
	blr	x1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_InformVdmFree, .-VCTRL_InformVdmFree
	.align	3
.LC246:
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
	ldr	x1, .LC247
	mov	w0, 0
	ldr	x1, [x1, 256]
	blr	x1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_ExtraWakeUpThread, .-VCTRL_ExtraWakeUpThread
	.align	3
.LC247:
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
	cbz	x20, .L278
	cbz	w19, .L274
	cmp	w19, 1
	beq	.L275
	ldr	x3, .LC250
	mov	w4, w19
	ldr	x2, .LC254
	mov	w1, 991
	add	x3, x3, 72
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
.L272:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L275:
	ldr	x1, .LC252
	mov	w0, 0
	str	x20, [x1, 288]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L274:
	ldr	x1, .LC252
	mov	w0, 0
	str	x20, [x1, 280]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L278:
	ldr	x3, .LC250
	mov	w4, 978
	ldr	x5, .LC249
	mov	w1, w4
	ldr	x2, .LC251
	add	x3, x3, 72
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L272
	.size	VCTRL_SetCallBack, .-VCTRL_SetCallBack
	.align	3
.LC249:
	.xword	.LC248
	.align	3
.LC250:
	.xword	.LANCHOR3
	.align	3
.LC251:
	.xword	.LC105
	.align	3
.LC252:
	.xword	.LANCHOR0
	.align	3
.LC254:
	.xword	.LC253
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
	ldr	x19, .LC256
	ldr	x0, .LC255
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
.LC255:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC256:
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
	bhi	.L286
	ldr	x0, .LC260
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L287
	cbz	x20, .L288
	ldr	x3, .LC264
	add	x0, x0, 24576
	mov	x2, 24
	mov	x1, x20
	add	x0, x0, 2264
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L282:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L286:
	ldr	x3, .LC258
	mov	w4, 1154
	ldr	x5, .LC257
.L285:
	ldr	x2, .LC259
	add	x3, x3, 96
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L282
.L288:
	ldr	x3, .LC258
	mov	w4, 1156
	ldr	x5, .LC263
	b	.L285
.L287:
	ldr	x3, .LC258
	mov	w4, 1155
	ldr	x5, .LC261
	mov	w1, w4
	ldr	x2, .LC259
	add	x3, x3, 96
	bl	dprint_normal
	mov	w0, -1
	b	.L282
	.size	VCTRL_SetStreamInterface, .-VCTRL_SetStreamInterface
	.align	3
.LC257:
	.xword	.LC103
	.align	3
.LC258:
	.xword	.LANCHOR3
	.align	3
.LC259:
	.xword	.LC105
	.align	3
.LC260:
	.xword	.LANCHOR0
	.align	3
.LC261:
	.xword	.LC119
	.align	3
.LC263:
	.xword	.LC262
	.align	3
.LC264:
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
	bhi	.L292
	ldr	x0, .LC266
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L292
	add	x0, x0, 24576
	ldr	x19, [sp, 16]
	add	x0, x0, 2264
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L292:
	mov	x0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetStreamInterface, .-VCTRL_GetStreamInterface
	.align	3
.LC266:
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
	bhi	.L299
	ldr	x0, .LC271
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L300
	cbz	x20, .L301
	ldr	x3, .LC275
	add	x0, x0, 24576
	mov	x2, 16
	mov	x1, x20
	add	x0, x0, 2320
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L295:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L299:
	ldr	x3, .LC269
	mov	w4, 1176
	ldr	x5, .LC268
.L298:
	ldr	x2, .LC270
	add	x3, x3, 128
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L295
.L301:
	ldr	x3, .LC269
	mov	w4, 1178
	ldr	x5, .LC274
	b	.L298
.L300:
	ldr	x3, .LC269
	mov	w4, 1177
	ldr	x5, .LC272
	mov	w1, w4
	ldr	x2, .LC270
	add	x3, x3, 128
	bl	dprint_normal
	mov	w0, -1
	b	.L295
	.size	VCTRL_SetDeiMemQueryInterface, .-VCTRL_SetDeiMemQueryInterface
	.align	3
.LC268:
	.xword	.LC103
	.align	3
.LC269:
	.xword	.LANCHOR3
	.align	3
.LC270:
	.xword	.LC105
	.align	3
.LC271:
	.xword	.LANCHOR0
	.align	3
.LC272:
	.xword	.LC119
	.align	3
.LC274:
	.xword	.LC273
	.align	3
.LC275:
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
	bhi	.L309
	ldr	x0, .LC280
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L310
	ldr	w2, [x0, 16]
	cmp	w2, 1
	bne	.L311
	mov	x2, 10648
	mov	x1, x20
	movk	x2, 0x1, lsl 16
	add	x0, x0, x2
	bl	GetSegStreamSize
.L305:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L311:
	ldr	x3, .LC278
	mov	w4, 1197
	ldr	x5, .LC283
.L308:
	ldr	x2, .LC279
	add	x3, x3, 160
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L309:
	ldr	x3, .LC278
	mov	w4, 1195
	ldr	x5, .LC277
	b	.L308
.L310:
	ldr	x3, .LC278
	mov	w4, 1196
	ldr	x5, .LC281
	mov	w1, w4
	ldr	x2, .LC279
	add	x3, x3, 160
	bl	dprint_normal
	mov	w0, -1
	b	.L305
	.size	VCTRL_GetStreamSize, .-VCTRL_GetStreamSize
	.align	3
.LC277:
	.xword	.LC103
	.align	3
.LC278:
	.xword	.LANCHOR3
	.align	3
.LC279:
	.xword	.LC105
	.align	3
.LC280:
	.xword	.LANCHOR0
	.align	3
.LC281:
	.xword	.LC119
	.align	3
.LC283:
	.xword	.LC282
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
	bhi	.L321
	ldr	x0, .LC288
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L322
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L323
	add	x0, x0, 24576
	add	x1, x29, 40
	add	x19, x0, 2432
	mov	x0, x19
	bl	GetRawStreamNum
	cbnz	w0, .L320
	add	x1, x29, 44
	mov	x0, x19
	bl	GetRawStreamSize
	cbnz	w0, .L320
	ldr	x2, .LC293
	mov	w1, 1218
	ldp	w3, w4, [x29, 40]
	mov	w0, 20
	bl	dprint_normal
	ldr	w0, [x29, 40]
	cmp	w0, wzr
	ble	.L320
	ldr	w0, [x29, 44]
	cmp	w0, 3
	csetm	w0, le
.L314:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L323:
	ldr	x3, .LC286
	mov	w4, 1211
	ldr	x5, .LC291
.L319:
	ldr	x2, .LC287
	add	x3, x3, 184
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L320:
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L321:
	ldr	x3, .LC286
	mov	w4, 1209
	ldr	x5, .LC285
	b	.L319
.L322:
	ldr	x3, .LC286
	mov	w4, 1210
	ldr	x5, .LC290
	mov	w1, w4
	ldr	x2, .LC287
	add	x3, x3, 184
	bl	dprint_normal
	mov	w0, -1
	b	.L314
	.size	VCTRL_CheckFreshRaw, .-VCTRL_CheckFreshRaw
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
.LC290:
	.xword	.LC289
	.align	3
.LC291:
	.xword	.LC282
	.align	3
.LC293:
	.xword	.LC292
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
	bhi	.L330
	ldr	x0, .LC298
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L331
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L332
	mov	x3, 10648
	add	x2, x29, 44
	movk	x3, 0x1, lsl 16
	add	x1, x29, 40
	add	x0, x0, x3
	bl	GetFreshSegStream
	ldr	x2, .LC302
	mov	w1, 1241
	ldp	w3, w4, [x29, 40]
	mov	w0, 20
	bl	dprint_normal
	ldr	w0, [x29, 40]
	cmp	w0, wzr
	csetm	w0, le
.L326:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L332:
	ldr	x3, .LC296
	mov	w4, 1236
	ldr	x5, .LC300
.L329:
	ldr	x2, .LC297
	add	x3, x3, 208
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L330:
	ldr	x3, .LC296
	mov	w4, 1234
	ldr	x5, .LC295
	b	.L329
.L331:
	ldr	x3, .LC296
	mov	w4, 1235
	ldr	x5, .LC299
	mov	w1, w4
	ldr	x2, .LC297
	add	x3, x3, 208
	bl	dprint_normal
	mov	w0, -1
	b	.L326
	.size	VCTRL_CheckFreshSeg, .-VCTRL_CheckFreshSeg
	.align	3
.LC295:
	.xword	.LC103
	.align	3
.LC296:
	.xword	.LANCHOR3
	.align	3
.LC297:
	.xword	.LC105
	.align	3
.LC298:
	.xword	.LANCHOR0
	.align	3
.LC299:
	.xword	.LC289
	.align	3
.LC300:
	.xword	.LC282
	.align	3
.LC302:
	.xword	.LC301
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
	bhi	.L340
	ldr	x19, .LC307
	add	x19, x19, 64
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L341
	cbz	x21, .L342
	ldr	x3, .LC311
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
	bls	.L338
	str	wzr, [x0, 72]
	mov	w0, 0
.L335:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L338:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L340:
	ldr	x3, .LC305
	mov	w4, 1253
	ldr	x5, .LC304
.L339:
	ldr	x2, .LC306
	add	x3, x3, 232
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L335
.L342:
	ldr	x3, .LC305
	mov	w4, 1255
	ldr	x5, .LC310
	b	.L339
.L341:
	ldr	x3, .LC305
	mov	w4, 1254
	ldr	x5, .LC308
	mov	w1, w4
	ldr	x2, .LC306
	add	x3, x3, 232
	bl	dprint_normal
	mov	w0, -1
	b	.L335
	.size	VCTRL_SetDiscardPicParam, .-VCTRL_SetDiscardPicParam
	.align	3
.LC304:
	.xword	.LC103
	.align	3
.LC305:
	.xword	.LANCHOR3
	.align	3
.LC306:
	.xword	.LC105
	.align	3
.LC307:
	.xword	.LANCHOR0
	.align	3
.LC308:
	.xword	.LC119
	.align	3
.LC310:
	.xword	.LC309
	.align	3
.LC311:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_USERDEC_PartitionMem
	.type	VCTRL_USERDEC_PartitionMem, %function
VCTRL_USERDEC_PartitionMem:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w19, w2
	mov	w20, w1
	bl	_mcount
	ldr	x3, .LC313
	mov	x2, 36
	mov	w1, 0
	add	x0, x29, 56
	ldr	x3, [x3, 96]
	blr	x3
	mov	w3, 1
	strb	w3, [x29, 60]
	mov	w3, 8
	mov	w4, 20
	strb	w3, [x29, 61]
	mov	w2, 0
	mov	w3, 6
	add	x1, x29, 56
	mov	w0, w21
	str	w4, [x29, 56]
	stp	w20, w19, [x29, 64]
	stp	w3, wzr, [x29, 80]
	bl	FSP_ArrangeFsPool
	mov	w19, w0
	cmn	w19, #1
	mov	w0, 0
	beq	.L346
.L344:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
.L346:
	ldr	x3, .LC314
	mov	w1, 1350
	ldr	x2, .LC316
	mov	w0, 0
	add	x3, x3, 264
	bl	dprint_normal
	mov	w0, w19
	b	.L344
	.size	VCTRL_USERDEC_PartitionMem, .-VCTRL_USERDEC_PartitionMem
	.align	3
.LC313:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC314:
	.xword	.LANCHOR3
	.align	3
.LC316:
	.xword	.LC315
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_USERDEC_GetFrameBuffer
	.type	VCTRL_USERDEC_GetFrameBuffer, %function
VCTRL_USERDEC_GetFrameBuffer:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 3
	bhi	.L360
	ldr	x0, .LC321
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L361
	ldr	w0, [x0, 128]
	cmp	w0, 20
	bne	.L362
	mov	w0, w19
	bl	FSP_IsNewFsAvailable
	cmp	w0, 1
	bne	.L355
	mov	w1, 0
	mov	w0, w19
	bl	FSP_NewLogicFs
	mov	w21, w0
	tbnz	w0, #31, .L363
	mov	w1, w0
	mov	w0, w19
	bl	FSP_GetLogicFs
	mov	x1, x0
	cbz	x0, .L353
	ldr	x0, [x0, 32]
	cbz	x0, .L353
	ldr	w2, [x1, 500]
	mov	w0, 0
	str	w2, [x20, 24]
	ldr	w2, [x1, 200]
	str	w2, [x20, 20]
	ldr	x1, [x1, 32]
	ldr	w1, [x1, 40]
	str	w1, [x20, 16]
.L349:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L355:
	mov	w0, -1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L362:
	ldr	x3, .LC319
	mov	w4, 1364
	ldr	x5, .LC325
.L359:
	ldr	x2, .LC320
	add	x3, x3, 296
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L360:
	ldr	x3, .LC319
	mov	w4, 1362
	ldr	x5, .LC318
	b	.L359
	.p2align 3
.L363:
	ldr	x3, .LC319
	mov	w1, 1375
	ldr	x2, .LC327
	mov	w0, 0
	add	x3, x3, 296
	bl	dprint_normal
	mov	w0, -1
	b	.L349
.L353:
	ldr	x3, .LC319
	mov	w4, w21
	ldr	x2, .LC329
	mov	w1, 1383
	add	x3, x3, 296
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L349
.L361:
	ldr	x3, .LC319
	mov	w4, 1363
	ldr	x5, .LC323
	mov	w1, w4
	ldr	x2, .LC320
	add	x3, x3, 296
	bl	dprint_normal
	mov	w0, -1
	b	.L349
	.size	VCTRL_USERDEC_GetFrameBuffer, .-VCTRL_USERDEC_GetFrameBuffer
	.align	3
.LC318:
	.xword	.LC317
	.align	3
.LC319:
	.xword	.LANCHOR3
	.align	3
.LC320:
	.xword	.LC105
	.align	3
.LC321:
	.xword	.LANCHOR0
	.align	3
.LC323:
	.xword	.LC322
	.align	3
.LC325:
	.xword	.LC324
	.align	3
.LC327:
	.xword	.LC326
	.align	3
.LC329:
	.xword	.LC328
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_USERDEC_PutFrameBuffer
	.type	VCTRL_USERDEC_PutFrameBuffer, %function
VCTRL_USERDEC_PutFrameBuffer:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	w21, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w21, 3
	bhi	.L374
	ldr	x22, .LC334
	add	x22, x22, 64
	ldr	x0, [x22, w21, sxtw 3]
	cbz	x0, .L375
	ldr	w26, [x0, 128]
	cmp	w26, 20
	bne	.L376
	ldr	x27, .LC337
	add	x0, x0, 217088
	mov	x2, 56
	mov	x1, x19
	add	x0, x0, 3232
	ldr	x3, [x27, 104]
	blr	x3
	ldr	x24, [x22, w21, sxtw 3]
	mov	w1, 0
	mov	w0, w21
	add	x24, x24, 217088
	add	x20, x24, 3232
	ldr	w2, [x20, 24]
	bl	FSP_GetLogicFs_By_DecAddr
	mov	x23, x0
	cbz	x0, .L377
	ldr	w25, [x20, 4]
	cmp	w25, 1
	beq	.L370
	ldr	w1, [x23, 4]
	mov	w0, w21
	bl	FSP_ClearLogicFs
	mov	w0, 0
.L366:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L370:
	add	x19, x0, 56
	ldr	w0, [x0, 4]
	mov	x2, 4
	mov	w1, 0
	str	w0, [x19, 88]
	ldr	x0, [x20, 48]
	str	x0, [x19, 200]
	ldr	x0, [x20, 48]
	str	x0, [x19, 208]
	ldr	x0, [x20, 48]
	str	x0, [x19, 216]
	ldr	x0, [x20, 48]
	str	x0, [x19, 224]
	str	w25, [x23, 56]
	stp	wzr, wzr, [x19, 4]
	str	wzr, [x19, 12]
	str	wzr, [x19, 20]
	ldr	w0, [x20, 8]
	str	w0, [x19, 32]
	ldr	w0, [x20, 12]
	str	w0, [x19, 36]
	ldr	w0, [x20, 8]
	str	w0, [x19, 40]
	lsr	w4, w0, 1
	ldr	w0, [x20, 12]
	str	w0, [x19, 44]
	str	wzr, [x19, 64]
	lsr	w3, w0, 1
	str	wzr, [x19, 96]
	ldr	w0, [x20, 28]
	str	w0, [x19, 424]
	add	x0, x23, 212
	ldr	w5, [x20, 40]
	str	w5, [x19, 428]
	stp	w4, w3, [x19, 48]
	ldr	w3, [x20, 24]
	str	w3, [x19, 444]
	ldr	w4, [x20, 32]
	ldr	x3, [x27, 96]
	str	w4, [x19, 452]
	blr	x3
	ldrb	w0, [x19, 157]
	mov	w2, w25
	ldrb	w1, [x19, 156]
	and	w0, w0, -4
	and	w1, w1, 224
	orr	w0, w0, 12
	bfi	w1, w25, 5, 3
	bfi	w0, w25, 4, 2
	strb	w1, [x19, 156]
	strb	w0, [x19, 157]
	mov	w0, w21
	ldr	w1, [x20, 20]
	str	w1, [x19, 144]
	ldr	w1, [x24, 3232]
	str	w1, [x19, 520]
	ldr	w1, [x23, 4]
	bl	FSP_SetDisplay
	ldr	x2, [x22, w21, sxtw 3]
	mov	x4, x19
	mov	w1, w26
	mov	w0, w21
	add	x2, x2, 221184
	add	x3, x2, 128
	add	x2, x2, 120
	bl	InsertImgToVoQueue
	cmp	w0, 1
	mov	w0, 0
	beq	.L366
	ldr	w1, [x23, 4]
	mov	w2, 0
	mov	w0, w21
	bl	FSP_SetDisplay
	ldr	x1, [x19, 168]
	mov	w0, w21
	bl	FreeUsdByDec
	str	xzr, [x19, 168]
	ldr	x1, [x19, 176]
	mov	w0, w21
	bl	FreeUsdByDec
	str	xzr, [x19, 176]
	mov	w0, -1
	b	.L366
	.p2align 3
.L376:
	ldr	x3, .LC332
	mov	w4, 1402
	ldr	x5, .LC336
.L373:
	ldr	x2, .LC333
	add	x3, x3, 328
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	ldr	x27, [sp, 80]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L374:
	ldr	x3, .LC332
	mov	w4, 1400
	ldr	x5, .LC331
	b	.L373
.L375:
	ldr	x3, .LC332
	mov	w4, 1401
	ldr	x5, .LC335
	mov	w1, w4
	ldr	x2, .LC333
	add	x3, x3, 328
	bl	dprint_normal
	mov	w0, -1
	b	.L366
.L377:
	ldr	x3, .LC332
	mov	w1, 1412
	ldr	x2, .LC339
	mov	w0, 1
	ldr	w4, [x20, 24]
	add	x3, x3, 328
	bl	dprint_normal
	mov	w0, -1
	b	.L366
	.size	VCTRL_USERDEC_PutFrameBuffer, .-VCTRL_USERDEC_PutFrameBuffer
	.align	3
.LC331:
	.xword	.LC317
	.align	3
.LC332:
	.xword	.LANCHOR3
	.align	3
.LC333:
	.xword	.LC105
	.align	3
.LC334:
	.xword	.LANCHOR0
	.align	3
.LC335:
	.xword	.LC322
	.align	3
.LC336:
	.xword	.LC324
	.align	3
.LC337:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC339:
	.xword	.LC338
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_USERDEC_RecycleFrameBuffer
	.type	VCTRL_USERDEC_RecycleFrameBuffer, %function
VCTRL_USERDEC_RecycleFrameBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L380
	ldr	w0, [x19, 616]
	mov	w1, w20
	mov	w2, 0
	bl	FSP_SetDisplay
	ldr	w0, [x19, 616]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L381
	ldr	w0, [x19, 616]
	ldr	x1, [x20, 168]
	bl	FreeUsdByDec
	str	xzr, [x20, 168]
	ldr	x1, [x20, 176]
	ldr	w0, [x19, 616]
	bl	FreeUsdByDec
	str	xzr, [x20, 176]
	mov	w0, 1
.L379:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L381:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L380:
	mov	w0, -2
	b	.L379
	.size	VCTRL_USERDEC_RecycleFrameBuffer, .-VCTRL_USERDEC_RecycleFrameBuffer
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
	cbz	x19, .L401
	ldr	x20, [x19, 16]
	cbz	x20, .L402
	ldr	w0, [x20, 16]
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	bl	MEM_DelMemRecord
	ldr	w0, [x19]
	cmp	w0, 1
	beq	.L403
.L387:
	ldr	x20, [x19, 24]
	cbz	x20, .L404
.L388:
	ldr	w0, [x20, 16]
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	bl	MEM_DelMemRecord
	ldr	w0, [x19, 4]
	cmp	w0, 1
	beq	.L405
.L389:
	ldr	x20, [x19, 32]
	cbz	x20, .L406
.L390:
	ldr	w0, [x20, 16]
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	bl	MEM_DelMemRecord
	ldr	w0, [x19, 8]
	cmp	w0, 1
	beq	.L407
.L391:
	ldr	x1, .LC350
	ldr	x0, [x20, 8]
	ldr	x1, [x1, 328]
	blr	x1
	mov	w0, 0
.L385:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L407:
	ldr	w0, [x20, 16]
	cbz	w0, .L391
	ldr	x1, [x20, 8]
	bl	MEM_ReleaseMemBlock
	mov	w0, 0
	b	.L385
	.p2align 3
.L405:
	ldr	w0, [x20, 16]
	cbz	w0, .L389
	ldr	x1, [x20, 8]
	bl	MEM_ReleaseMemBlock
	ldr	x20, [x19, 32]
	cbnz	x20, .L390
.L406:
	ldr	x3, .LC341
	mov	w1, 1566
	ldr	x2, .LC349
	mov	w0, 0
	add	x3, x3, 432
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L403:
	ldr	w0, [x20, 16]
	cbz	w0, .L387
	ldr	x1, [x20, 8]
	bl	MEM_ReleaseMemBlock
	ldr	x20, [x19, 24]
	cbnz	x20, .L388
	.p2align 2
.L404:
	ldr	x3, .LC341
	mov	w1, 1544
	ldr	x2, .LC347
	mov	w0, 0
	add	x3, x3, 408
	bl	dprint_normal
	b	.L389
	.p2align 3
.L402:
	ldr	x3, .LC341
	mov	w1, 1522
	ldr	x2, .LC345
	mov	w0, 0
	add	x3, x3, 384
	bl	dprint_normal
	b	.L387
.L401:
	ldr	x3, .LC341
	mov	w1, 1588
	ldr	x2, .LC343
	mov	w0, 0
	add	x3, x3, 360
	bl	dprint_normal
	mov	w0, -1
	b	.L385
	.size	VCTRL_FreeChanResource, .-VCTRL_FreeChanResource
	.align	3
.LC341:
	.xword	.LANCHOR3
	.align	3
.LC343:
	.xword	.LC342
	.align	3
.LC345:
	.xword	.LC344
	.align	3
.LC347:
	.xword	.LC346
	.align	3
.LC349:
	.xword	.LC348
	.align	3
.LC350:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanCtxSize
	.type	VCTRL_GetChanCtxSize, %function
VCTRL_GetChanCtxSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 25
	beq	.L411
	mov	w0, 51600
	movk	w0, 0x7, lsl 16
	str	w0, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L411:
	mov	w0, 52288
	movk	w0, 0xb0, lsl 16
	str	w0, [x20]
	ldp	x19, x20, [sp, 16]
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
	mov	w0, 32768
	str	w0, [x19]
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
	bhi	.L419
	ldr	x0, .LC354
	add	x0, x0, 64
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L420
	cbz	x20, .L421
	ldr	x3, .LC358
	add	x1, x1, 217088
	mov	x2, 156
	add	x1, x1, 3072
	mov	x0, x20
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L415:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L419:
	ldr	x3, .LC352
	mov	w4, 2387
	ldr	x5, .LC351
.L418:
	ldr	x2, .LC353
	add	x3, x3, 456
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L415
.L421:
	ldr	x3, .LC352
	mov	w4, 2389
	ldr	x5, .LC357
	b	.L418
.L420:
	ldr	x3, .LC352
	mov	w4, 2388
	ldr	x5, .LC355
	b	.L418
	.size	VCTRL_GetChanCfg, .-VCTRL_GetChanCfg
	.align	3
.LC351:
	.xword	.LC103
	.align	3
.LC352:
	.xword	.LANCHOR3
	.align	3
.LC353:
	.xword	.LC105
	.align	3
.LC354:
	.xword	.LANCHOR0
	.align	3
.LC355:
	.xword	.LC119
	.align	3
.LC357:
	.xword	.LC356
	.align	3
.LC358:
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
	ldr	x0, .LC360
	ldr	w1, [x19, 8]
	add	x0, x0, 64
	ldr	x0, [x0, w20, sxtw 3]
	add	x0, x0, 217088
	ldr	w2, [x0, 3080]
	cmp	w2, w1
	bne	.L435
	ldr	w2, [x0, 3100]
	ldr	w1, [x19, 28]
	cmp	w2, w1
	bne	.L435
	ldr	w2, [x0, 3096]
	ldr	w1, [x19, 24]
	cmp	w2, w1
	bne	.L435
	ldr	w2, [x0, 3104]
	ldr	w1, [x19, 32]
	cmp	w2, w1
	bne	.L435
	ldr	w2, [x0, 3108]
	ldr	w1, [x19, 36]
	cmp	w2, w1
	bne	.L435
	ldr	w2, [x0, 3112]
	ldr	w1, [x19, 40]
	cmp	w2, w1
	bne	.L435
	ldr	w2, [x0, 3128]
	ldr	w1, [x19, 56]
	cmp	w2, w1
	bne	.L435
	ldr	w2, [x0, 3212]
	ldr	w1, [x19, 140]
	cmp	w2, w1
	bne	.L435
	ldr	w2, [x0, 3140]
	ldr	w1, [x19, 68]
	cmp	w2, w1
	bne	.L435
	ldr	w2, [x0, 3136]
	ldr	w1, [x19, 64]
	cmp	w2, w1
	bne	.L435
	ldr	w2, [x0, 3132]
	ldr	w1, [x19, 60]
	cmp	w2, w1
	bne	.L435
	ldr	w2, [x0, 3144]
	ldr	w1, [x19, 72]
	cmp	w2, w1
	bne	.L435
	ldr	w1, [x0, 3204]
	ldr	w0, [x19, 132]
	ldp	x19, x20, [sp, 16]
	cmp	w1, w0
	csetm	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L435:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_CheckCommonParameter, .-VCTRL_CheckCommonParameter
	.align	3
.LC360:
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
	ldr	x0, .LC362
	add	x0, x0, 64
	ldr	x19, [x0, w20, sxtw 3]
	ldr	w0, [x19, 128]
	cmp	w0, 22
	beq	.L441
	mov	x1, x21
	mov	w0, w20
	bl	VCTRL_CheckCommonParameter
	cbnz	w0, .L441
	add	x19, x19, 217088
	ldr	w1, [x19, 3080]
	cmp	w1, 1
	beq	.L442
	sub	w1, w1, #10
	cmp	w1, 2
	bhi	.L437
	ldr	w0, [x21, 12]
	ldr	w1, [x19, 3084]
	cmp	w1, w0
	csetm	w0, ne
.L437:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L442:
	ldr	w1, [x19, 3084]
	ldr	w0, [x21, 12]
	cmp	w1, w0
	bne	.L441
	ldr	w0, [x21, 16]
	ldr	w1, [x19, 3088]
	ldr	x21, [sp, 32]
	cmp	w1, w0
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L441:
	mov	w0, -1
	b	.L437
	.size	VCTRL_CmpConfigParameter, .-VCTRL_CmpConfigParameter
	.align	3
.LC362:
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
	ldr	x0, .LC364
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
.LC364:
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
	ble	.L445
	ldr	w1, [x19, 108]
	cmp	w1, wzr
	ble	.L445
	ldr	x1, .LC366
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
.L445:
	ldr	x0, .LC366
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
.LC366:
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
	bhi	.L453
	ldr	x0, .LC371
	add	x0, x0, 64
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L454
	add	x1, x1, 128
	mov	w0, 3
	bl	PDT_GetAttribute
	cbnz	w0, .L451
	mov	x1, x20
	mov	w0, w19
	bl	SM_SeekPts
	cmp	w0, wzr
	csetm	w0, ne
.L449:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L451:
	mov	w0, -1
	b	.L449
	.p2align 3
.L453:
	ldr	x3, .LC369
	mov	w4, 2758
	ldr	x5, .LC368
.L452:
	ldr	x2, .LC370
	add	x3, x3, 480
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L449
.L454:
	ldr	x3, .LC369
	mov	w4, 2759
	ldr	x5, .LC373
	b	.L452
	.size	VCTRL_SeekPts, .-VCTRL_SeekPts
	.align	3
.LC368:
	.xword	.LC103
	.align	3
.LC369:
	.xword	.LANCHOR3
	.align	3
.LC370:
	.xword	.LC105
	.align	3
.LC371:
	.xword	.LANCHOR0
	.align	3
.LC373:
	.xword	.LC372
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
	bhi	.L459
	ldr	x0, .LC379
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L460
	mov	w0, w19
	bl	SM_Reset
	cmp	w0, wzr
	csetm	w0, ne
.L457:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L459:
	ldr	x3, .LC377
	mov	w4, 2895
	ldr	x5, .LC376
	mov	w1, w4
	ldr	x2, .LC378
	add	x3, x3, 496
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L457
.L460:
	ldr	x3, .LC377
	mov	w4, 2896
	ldr	x5, .LC381
	mov	w1, w4
	ldr	x2, .LC378
	add	x3, x3, 496
	bl	dprint_normal
	mov	w0, -1
	b	.L457
	.size	VCTRL_ReleaseStream, .-VCTRL_ReleaseStream
	.align	3
.LC376:
	.xword	.LC375
	.align	3
.LC377:
	.xword	.LANCHOR3
	.align	3
.LC378:
	.xword	.LC105
	.align	3
.LC379:
	.xword	.LANCHOR0
	.align	3
.LC381:
	.xword	.LC380
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
	bhi	.L464
	ldr	x0, .LC383
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L464
	ldr	x0, [x0, 8]
.L462:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L464:
	mov	x0, -1
	b	.L462
	.size	VCTRL_GetChanUniqueID, .-VCTRL_GetChanUniqueID
	.align	3
.LC383:
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
	bhi	.L489
	ldr	x22, .LC388
	add	x23, x22, 64
	ldr	x0, [x23, w19, sxtw 3]
	cbz	x0, .L490
	ldr	w0, [x0, 16]
	cmp	w0, 1
	bne	.L491
	cbz	x20, .L492
	ldr	x21, .LC393
	mov	w0, 4
	ldr	x1, [x21, 24]
	blr	x1
	ldr	x0, [x23, w19, sxtw 3]
	cbz	x0, .L471
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L471
	add	x0, x0, 221184
	mov	x1, x20
	add	x0, x0, 112
	bl	SYNTAX_ReceiveImage
	cmp	w0, 1
	mov	w23, w0
	beq	.L493
	mov	w0, 9
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L478
	mov	w23, -1
.L476:
	ldr	x1, [x21, 32]
	mov	w0, 4
	blr	x1
.L487:
	mov	w0, w23
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L493:
	ldr	w0, [x20, 116]
	mov	w1, -1
	str	w1, [x20, 92]
	cmp	w0, 1
	bne	.L474
	mov	x1, x20
	mov	w0, w19
	bl	VCTRL_GetChanView1Image
	mov	w23, w0
	mov	w0, 9
	bl	CHECK_REC_POS_ENABLE
	cbz	w0, .L475
	.p2align 2
.L478:
	ldr	x0, [x21]
	blr	x0
	mov	w4, w0
	add	x3, x22, 544
	ldr	x1, .LC394
	ldr	w0, [x3, w19, sxtw 2]
	ldr	w1, [x1]
	sub	w0, w4, w0
	cmp	w0, w1
	bhi	.L494
.L475:
	cmp	w23, 1
	mov	w23, -1
	bne	.L476
	.p2align 2
.L479:
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
	cbz	w0, .L495
.L477:
	ldr	x3, .LC386
	mov	w4, 3211
	ldr	x2, .LC396
	mov	w1, w4
	ldr	w7, [x20, 88]
	add	x3, x3, 520
	ldr	w6, [x20, 276]
	mov	w0, 26
	ldr	w5, [x20, 444]
	mov	w23, 0
	bl	dprint_normal
	b	.L476
	.p2align 3
.L474:
	mov	w0, 9
	bl	CHECK_REC_POS_ENABLE
	cbz	w0, .L479
	b	.L478
	.p2align 3
.L494:
	lsl	w2, w19, 24
	ldr	x0, .LC386
	cmp	w23, 1
	add	w2, w2, 589824
	csinc	w2, w2, w2, ne
	mov	w1, 3197
	add	x0, x0, 544
	str	w4, [x3, w19, sxtw 2]
	bl	DBG_AddTrace
	b	.L475
	.p2align 3
.L495:
	ldr	x0, [x21]
	blr	x0
	str	w0, [x22, 36]
	b	.L477
	.p2align 3
.L471:
	ldr	x1, [x21, 32]
	mov	w0, 4
	mov	w23, -1
	blr	x1
	mov	w0, w23
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L491:
	ldr	x3, .LC386
	mov	w4, 3156
	ldr	x5, .LC390
.L488:
	ldr	x2, .LC387
	add	x3, x3, 520
	mov	w1, w4
	mov	w0, 0
	mov	w23, -1
	bl	dprint_normal
	b	.L487
	.p2align 3
.L489:
	ldr	x3, .LC386
	mov	w4, 3154
	ldr	x5, .LC385
	b	.L488
.L492:
	ldr	x3, .LC386
	mov	w4, 3157
	ldr	x5, .LC392
	b	.L488
.L490:
	ldr	x3, .LC386
	mov	w4, 3155
	ldr	x5, .LC389
	mov	w1, w4
	ldr	x2, .LC387
	add	x3, x3, 520
	mov	w23, -1
	bl	dprint_normal
	b	.L487
	.size	VCTRL_GetChanImage, .-VCTRL_GetChanImage
	.align	3
.LC385:
	.xword	.LC103
	.align	3
.LC386:
	.xword	.LANCHOR3
	.align	3
.LC387:
	.xword	.LC105
	.align	3
.LC388:
	.xword	.LANCHOR0
	.align	3
.LC389:
	.xword	.LC119
	.align	3
.LC390:
	.xword	.LC322
	.align	3
.LC392:
	.xword	.LC391
	.align	3
.LC393:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC394:
	.xword	g_TraceImgPeriod
	.align	3
.LC396:
	.xword	.LC395
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ReleaseChanImage
	.type	VCTRL_ReleaseChanImage, %function
VCTRL_ReleaseChanImage:
	sub	sp, sp, #544
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 3
	bhi	.L520
	ldr	x23, .LC403
	add	x21, x23, 64
	ldr	x0, [x21, w20, sxtw 3]
	cbz	x0, .L521
	ldr	w0, [x0, 16]
	cmp	w0, 1
	bne	.L522
	cbz	x19, .L523
	ldr	x22, .LC407
	mov	w0, 4
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x0, [x21, w20, sxtw 3]
	cbz	x0, .L524
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L525
	add	x0, x0, 221184
	mov	x1, x19
	add	x0, x0, 112
	bl	SYNTAX_ReleaseImage
	ldr	w25, [x19, 92]
	mov	w24, w0
	cmn	w25, #1
	beq	.L504
	ldr	w0, [x19, 456]
	cbnz	w0, .L526
.L504:
	mov	w0, 10
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L527
.L518:
	ldr	x21, .LC401
.L506:
	cmp	w24, 1
	beq	.L508
	mov	w4, 3282
	ldr	x2, .LC414
	ldr	w5, [x19, 444]
	mov	w1, w4
	add	x3, x21, 568
	mov	w0, 26
	bl	dprint_normal
	mov	x1, x19
	mov	w0, w20
	bl	FSP_UnMarkImageOutHanging
.L509:
	ldr	x1, [x22, 32]
	mov	w0, 4
	blr	x1
	cmp	w24, 1
	csetm	w0, ne
.L498:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	add	sp, sp, 544
	ret
	.p2align 3
.L527:
	ldr	x0, [x22]
	add	x23, x23, 960
	blr	x0
	mov	w3, w0
	ldr	x1, .LC412
	ldr	w0, [x23, w20, sxtw 2]
	ldr	w1, [x1]
	sub	w0, w3, w0
	cmp	w0, w1
	bls	.L518
	lsl	w2, w20, 24
	ldr	x21, .LC401
	cmp	w24, 1
	add	w2, w2, 655360
	csinc	w2, w2, w2, ne
	mov	w1, 3275
	add	x0, x21, 592
	str	w3, [x23, w20, sxtw 2]
	bl	DBG_AddTrace
	b	.L506
	.p2align 3
.L508:
	mov	w4, 3287
	ldr	x2, .LC416
	ldr	w6, [x19, 88]
	add	x3, x21, 568
	ldr	w5, [x19, 444]
	mov	w1, w4
	mov	w0, 26
	bl	dprint_normal
	b	.L509
	.p2align 3
.L526:
	mov	x2, 536
	mov	w1, 0
	add	x0, x29, 88
	bl	memset
	str	w25, [x29, 176]
	ldr	x0, [x21, w20, sxtw 3]
	add	x1, x29, 88
	add	x0, x0, 221184
	add	x0, x0, 112
	bl	SYNTAX_ReleaseImage
	mov	w24, w0
	mov	w0, 10
	bl	CHECK_REC_POS_ENABLE
	cbz	w0, .L518
	b	.L527
	.p2align 3
.L525:
	ldr	x1, [x22, 32]
	mov	w0, 4
	blr	x1
	mov	w3, 3243
	ldr	x2, .LC411
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L498
	.p2align 3
.L522:
	ldr	x3, .LC401
	mov	w4, 3227
	ldr	x5, .LC405
.L519:
	ldr	x2, .LC402
	add	x3, x3, 568
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L498
	.p2align 3
.L520:
	ldr	x3, .LC401
	mov	w4, 3225
	ldr	x5, .LC400
	b	.L519
.L523:
	ldr	x3, .LC401
	mov	w4, 3228
	ldr	x5, .LC406
	b	.L519
.L521:
	ldr	x3, .LC401
	mov	w4, 3226
	ldr	x5, .LC404
	mov	w1, w4
	ldr	x2, .LC402
	add	x3, x3, 568
	bl	dprint_normal
	mov	w0, -1
	b	.L498
.L524:
	ldr	x1, [x22, 32]
	mov	w0, 4
	blr	x1
	mov	w3, 3235
	ldr	x2, .LC409
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L498
	.size	VCTRL_ReleaseChanImage, .-VCTRL_ReleaseChanImage
	.align	3
.LC400:
	.xword	.LC103
	.align	3
.LC401:
	.xword	.LANCHOR3
	.align	3
.LC402:
	.xword	.LC105
	.align	3
.LC403:
	.xword	.LANCHOR0
	.align	3
.LC404:
	.xword	.LC119
	.align	3
.LC405:
	.xword	.LC322
	.align	3
.LC406:
	.xword	.LC391
	.align	3
.LC407:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC409:
	.xword	.LC408
	.align	3
.LC411:
	.xword	.LC410
	.align	3
.LC412:
	.xword	g_TraceImgPeriod
	.align	3
.LC414:
	.xword	.LC413
	.align	3
.LC416:
	.xword	.LC415
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
	bhi	.L529
	ldr	x0, .LC419
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L529
	ldr	w1, [x0, 16]
	cmp	w1, 1
	beq	.L532
	mov	w3, 3307
	ldr	x2, .LC423
	mov	w4, w19
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, 22
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L529:
	mov	w3, 3301
	ldr	x2, .LC421
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	mov	w0, 22
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L532:
	ldr	w0, [x0, 128]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetVidStd, .-VCTRL_GetVidStd
	.align	3
.LC419:
	.xword	.LANCHOR0
	.align	3
.LC421:
	.xword	.LC420
	.align	3
.LC423:
	.xword	.LC422
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
	bhi	.L539
	ldr	x0, .LC428
	add	x0, x0, 64
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L540
	cbz	x19, .L541
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
.L533:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L539:
	ldr	x3, .LC426
	mov	w4, 3316
	ldr	x5, .LC425
.L538:
	ldr	x2, .LC427
	add	x3, x3, 616
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L540:
	ldr	x3, .LC426
	mov	w4, 3317
	ldr	x5, .LC429
	mov	w1, w4
	ldr	x2, .LC427
	add	x3, x3, 616
	bl	dprint_normal
	b	.L533
	.p2align 3
.L541:
	ldr	x3, .LC426
	mov	w4, 3318
	ldr	x5, .LC431
	b	.L538
	.size	VCTRL_GetHDRConfigInfo, .-VCTRL_GetHDRConfigInfo
	.align	3
.LC425:
	.xword	.LC103
	.align	3
.LC426:
	.xword	.LANCHOR3
	.align	3
.LC427:
	.xword	.LC105
	.align	3
.LC428:
	.xword	.LANCHOR0
	.align	3
.LC429:
	.xword	.LC119
	.align	3
.LC431:
	.xword	.LC430
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
	bhi	.L561
	ldr	x0, .LC433
	add	x0, x0, 64
	ldr	x20, [x0, w19, sxtw 3]
	cbz	x20, .L561
	ldr	x2, [x20, 16]
	mov	x0, 4294967297
	mov	x1, 0
	cmp	x2, x0
	bne	.L543
	ldr	w4, [x20, 128]
	cmp	w4, 20
	bls	.L564
.L544:
	ldr	x3, .LC435
	mov	w1, 3461
	ldr	x2, .LC437
	mov	w0, 0
	add	x3, x3, 640
	bl	dprint_normal
	mov	x1, 0
	b	.L543
	.p2align 3
.L561:
	mov	x1, 0
.L543:
	mov	x0, x1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L564:
	ldr	x0, .LC434
	ldrb	w0, [x0,w4,uxtw]
	adr	x1, .Lrtx546
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx546:
	.section	.rodata
	.align	0
	.align	2
.L546:
	.byte	(.L545 - .Lrtx546) / 4
	.byte	(.L552 - .Lrtx546) / 4
	.byte	(.L550 - .Lrtx546) / 4
	.byte	(.L549 - .Lrtx546) / 4
	.byte	(.L550 - .Lrtx546) / 4
	.byte	(.L544 - .Lrtx546) / 4
	.byte	(.L551 - .Lrtx546) / 4
	.byte	(.L544 - .Lrtx546) / 4
	.byte	(.L544 - .Lrtx546) / 4
	.byte	(.L544 - .Lrtx546) / 4
	.byte	(.L552 - .Lrtx546) / 4
	.byte	(.L552 - .Lrtx546) / 4
	.byte	(.L552 - .Lrtx546) / 4
	.byte	(.L552 - .Lrtx546) / 4
	.byte	(.L550 - .Lrtx546) / 4
	.byte	(.L554 - .Lrtx546) / 4
	.byte	(.L555 - .Lrtx546) / 4
	.byte	(.L544 - .Lrtx546) / 4
	.byte	(.L544 - .Lrtx546) / 4
	.byte	(.L544 - .Lrtx546) / 4
	.byte	(.L561 - .Lrtx546) / 4
	.text
	.p2align 3
.L552:
	add	x0, x20, 221184
	ldr	x19, [x0, 128]
.L556:
	cbz	x19, .L561
	ldr	x0, .LC438
	ldr	x0, [x0]
	blr	x0
	str	w0, [x20, 40]
	mov	x1, x19
	mov	x0, x1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L550:
	add	x0, x20, 221184
	ldr	x19, [x0, 1160]
	b	.L556
	.p2align 3
.L549:
	add	x0, x20, 221184
	ldr	x19, [x0, 160]
	b	.L556
	.p2align 3
.L555:
	add	x0, x20, 221184
	ldr	x19, [x0, 2600]
	b	.L556
	.p2align 3
.L545:
	add	x0, x20, 221184
	ldr	x19, [x0, 736]
	b	.L556
	.p2align 3
.L554:
	add	x0, x20, 221184
	ldr	x19, [x0, 352]
	b	.L556
	.p2align 3
.L551:
	add	x0, x20, 221184
	ldr	x19, [x0, 144]
	b	.L556
	.size	VCTRL_GetDecParam, .-VCTRL_GetDecParam
	.align	3
.LC433:
	.xword	.LANCHOR0
	.align	3
.LC434:
	.xword	.L546
	.align	3
.LC435:
	.xword	.LANCHOR3
	.align	3
.LC437:
	.xword	.LC436
	.align	3
.LC438:
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
	cbz	x19, .L573
	cbz	w20, .L568
	cmp	w20, 16
	beq	.L569
	mov	w0, 0
.L567:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L569:
	ldr	w0, [x19, 4932]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	uxtb	w0, w0
	ret
	.p2align 3
.L568:
	ldrb	w0, [x19, 940]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L573:
	ldr	x2, .LC441
	mov	w1, 3480
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	b	.L567
	.size	VCTRL_IsSedOnlyMode, .-VCTRL_IsSedOnlyMode
	.align	3
.LC441:
	.xword	.LC440
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
	bhi	.L575
	ldr	x20, .LC442
	add	x20, x20, 64
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L575
	ldr	x1, [x0, 16]
	mov	x0, 4294967297
	cmp	x1, x0
	beq	.L578
	ldr	x2, .LC446
	mov	w3, w19
	mov	w1, 3519
	mov	w0, 20
	mov	w21, 0
	bl	dprint_normal
.L577:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L578:
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbz	x0, .L583
	ldr	x0, [x20, w19, sxtw 3]
	mov	w21, 0
	stp	wzr, wzr, [x0, 108]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L575:
	mov	w3, 3513
	ldr	x2, .LC444
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
.L583:
	ldr	x22, [x20, w19, sxtw 3]
	ldr	x0, .LC447
	ldr	w21, [x22, 108]
	cbz	w21, .L584
	ldr	x0, [x0]
	blr	x0
	ldr	x1, [x20, w19, sxtw 3]
	ldr	w2, [x1, 112]
	cmp	w0, w2
	bls	.L581
	sub	w0, w0, w2
	mov	w21, 0
	cmp	w0, 40
	bls	.L577
.L581:
	mov	w21, 1
	stp	wzr, wzr, [x1, 108]
	b	.L577
.L584:
	ldr	x0, [x0]
	mov	w1, 1
	str	w1, [x22, 108]
	blr	x0
	str	w0, [x22, 112]
	b	.L577
	.size	VCTRL_ChanDecparamInValidFlag, .-VCTRL_ChanDecparamInValidFlag
	.align	3
.LC442:
	.xword	.LANCHOR0
	.align	3
.LC444:
	.xword	.LC443
	.align	3
.LC446:
	.xword	.LC445
	.align	3
.LC447:
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
	bhi	.L601
	ldr	x0, .LC452
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L602
	ldr	w4, [x0, 128]
	cmp	w4, 16
	bls	.L603
.L589:
	ldr	x3, .LC450
	mov	w1, 3989
	ldr	x2, .LC456
	mov	w0, 1
	add	x3, x3, 664
	bl	dprint_normal
	b	.L585
	.p2align 3
.L603:
	ldr	x1, .LC454
	ldrb	w1, [x1,w4,uxtw]
	adr	x2, .Lrtx591
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx591:
	.section	.rodata
	.align	0
	.align	2
.L591:
	.byte	(.L590 - .Lrtx591) / 4
	.byte	(.L592 - .Lrtx591) / 4
	.byte	(.L595 - .Lrtx591) / 4
	.byte	(.L594 - .Lrtx591) / 4
	.byte	(.L595 - .Lrtx591) / 4
	.byte	(.L589 - .Lrtx591) / 4
	.byte	(.L596 - .Lrtx591) / 4
	.byte	(.L589 - .Lrtx591) / 4
	.byte	(.L589 - .Lrtx591) / 4
	.byte	(.L589 - .Lrtx591) / 4
	.byte	(.L592 - .Lrtx591) / 4
	.byte	(.L592 - .Lrtx591) / 4
	.byte	(.L592 - .Lrtx591) / 4
	.byte	(.L592 - .Lrtx591) / 4
	.byte	(.L595 - .Lrtx591) / 4
	.byte	(.L599 - .Lrtx591) / 4
	.byte	(.L600 - .Lrtx591) / 4
	.text
	.p2align 3
.L592:
	add	x0, x0, 221184
	str	xzr, [x0, 128]
.L585:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L601:
	ldr	x3, .LC450
	mov	w4, 3887
	ldr	x5, .LC449
	mov	w1, w4
	ldr	x2, .LC451
	add	x3, x3, 664
	mov	w0, 0
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L595:
	add	x0, x0, 221184
	str	xzr, [x0, 1160]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L599:
	add	x0, x0, 221184
	str	xzr, [x0, 352]
	b	.L585
	.p2align 3
.L596:
	add	x0, x0, 221184
	str	xzr, [x0, 144]
	b	.L585
	.p2align 3
.L594:
	add	x0, x0, 221184
	str	xzr, [x0, 160]
	b	.L585
	.p2align 3
.L600:
	add	x0, x0, 221184
	str	xzr, [x0, 2600]
	b	.L585
	.p2align 3
.L590:
	add	x0, x0, 221184
	str	xzr, [x0, 736]
	b	.L585
	.p2align 3
.L602:
	ldr	x3, .LC450
	mov	w4, 3888
	ldr	x5, .LC453
	mov	w1, w4
	ldr	x2, .LC451
	add	x3, x3, 664
	bl	dprint_normal
	b	.L585
	.size	VCTRL_ClearDecparam, .-VCTRL_ClearDecparam
	.align	3
.LC449:
	.xword	.LC317
	.align	3
.LC450:
	.xword	.LANCHOR3
	.align	3
.LC451:
	.xword	.LC105
	.align	3
.LC452:
	.xword	.LANCHOR0
	.align	3
.LC453:
	.xword	.LC380
	.align	3
.LC454:
	.xword	.L591
	.align	3
.LC456:
	.xword	.LC455
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
	bhi	.L615
	ldr	x19, .LC461
	add	x19, x19, 64
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L616
	ldr	w0, [x0, 20]
	cmp	w0, 1
	beq	.L608
	ldr	x3, .LC459
	mov	w4, 4016
	ldr	x5, .LC464
.L614:
	ldr	x2, .LC460
	add	x3, x3, 688
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L604:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L608:
	mov	w0, w20
	bl	VCTRL_GetDecParam
	cbz	x0, .L604
	ldr	x0, [x19, w20, sxtw 3]
	ldr	w1, [x0, 128]
	cbz	w1, .L609
	cmp	w1, 16
	bne	.L604
	add	x0, x0, 221184
	mov	w1, w21
	add	x0, x0, 120
	bl	HEVCDEC_VDMProcSedOnly
	b	.L604
	.p2align 3
.L615:
	ldr	x3, .LC459
	mov	w4, 4014
	ldr	x5, .LC458
	b	.L614
	.p2align 3
.L609:
	add	x0, x0, 221184
	mov	w1, w21
	add	x0, x0, 120
	bl	H264DEC_VDMProcSedOnly
	b	.L604
	.p2align 3
.L616:
	ldr	x3, .LC459
	mov	w4, 4015
	ldr	x5, .LC462
	mov	w1, w4
	ldr	x2, .LC460
	add	x3, x3, 688
	bl	dprint_normal
	b	.L604
	.size	VCTRL_VdmProcSedOnly, .-VCTRL_VdmProcSedOnly
	.align	3
.LC458:
	.xword	.LC317
	.align	3
.LC459:
	.xword	.LANCHOR3
	.align	3
.LC460:
	.xword	.LC105
	.align	3
.LC461:
	.xword	.LANCHOR0
	.align	3
.LC462:
	.xword	.LC322
	.align	3
.LC464:
	.xword	.LC463
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
	bhi	.L636
	ldr	x0, .LC469
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L637
	ldr	w1, [x0, 20]
	cmp	w1, 1
	bne	.L638
	ldr	w4, [x0, 128]
	cmp	w4, 20
	bls	.L639
.L622:
	ldr	x3, .LC467
	mov	w1, 4160
	ldr	x2, .LC474
	mov	w0, 0
	add	x3, x3, 712
	bl	dprint_normal
	mov	w0, 0
.L619:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L639:
	ldr	x1, .LC472
	ldrb	w1, [x1,w4,uxtw]
	adr	x2, .Lrtx624
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx624:
	.section	.rodata
	.align	0
	.align	2
.L624:
	.byte	(.L623 - .Lrtx624) / 4
	.byte	(.L625 - .Lrtx624) / 4
	.byte	(.L626 - .Lrtx624) / 4
	.byte	(.L627 - .Lrtx624) / 4
	.byte	(.L628 - .Lrtx624) / 4
	.byte	(.L622 - .Lrtx624) / 4
	.byte	(.L629 - .Lrtx624) / 4
	.byte	(.L622 - .Lrtx624) / 4
	.byte	(.L622 - .Lrtx624) / 4
	.byte	(.L622 - .Lrtx624) / 4
	.byte	(.L630 - .Lrtx624) / 4
	.byte	(.L630 - .Lrtx624) / 4
	.byte	(.L630 - .Lrtx624) / 4
	.byte	(.L631 - .Lrtx624) / 4
	.byte	(.L628 - .Lrtx624) / 4
	.byte	(.L632 - .Lrtx624) / 4
	.byte	(.L633 - .Lrtx624) / 4
	.byte	(.L622 - .Lrtx624) / 4
	.byte	(.L622 - .Lrtx624) / 4
	.byte	(.L622 - .Lrtx624) / 4
	.byte	(.L634 - .Lrtx624) / 4
	.text
	.p2align 3
.L634:
	mov	w0, 0
	b	.L619
	.p2align 3
.L633:
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	HEVCDEC_GetImageBuffer
	b	.L619
	.p2align 3
.L632:
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	MVC_DEC_GetImageBuffer
	b	.L619
	.p2align 3
.L631:
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	VP8DEC_GetImageBuffer
	b	.L619
	.p2align 3
.L630:
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	VP6DEC_GetImageBuffer
	b	.L619
	.p2align 3
.L629:
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	AVSDEC_GetImageBuffer
	b	.L619
	.p2align 3
.L628:
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	H263DEC_GetImageBuffer
	b	.L619
	.p2align 3
.L627:
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	MPEG2DEC_GetImageBuffer
	b	.L619
	.p2align 3
.L626:
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	MPEG4DEC_GetImageBuffer
	b	.L619
	.p2align 3
.L625:
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	VC1DEC_GetImageBuffer
	b	.L619
	.p2align 3
.L623:
	add	x0, x0, 221184
	add	x0, x0, 120
	bl	H264DEC_GetImageBuffer
	b	.L619
	.p2align 3
.L638:
	ldr	x3, .LC467
	mov	w4, 4053
	ldr	x5, .LC471
.L635:
	ldr	x2, .LC468
	add	x3, x3, 712
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L619
	.p2align 3
.L636:
	ldr	x3, .LC467
	mov	w4, 4051
	ldr	x5, .LC466
	b	.L635
.L637:
	ldr	x3, .LC467
	mov	w4, 4052
	ldr	x5, .LC470
	mov	w1, w4
	ldr	x2, .LC468
	add	x3, x3, 712
	bl	dprint_normal
	mov	w0, -1
	b	.L619
	.size	VCTRL_GetImageBuffer, .-VCTRL_GetImageBuffer
	.align	3
.LC466:
	.xword	.LC103
	.align	3
.LC467:
	.xword	.LANCHOR3
	.align	3
.LC468:
	.xword	.LC105
	.align	3
.LC469:
	.xword	.LANCHOR0
	.align	3
.LC470:
	.xword	.LC372
	.align	3
.LC471:
	.xword	.LC463
	.align	3
.LC472:
	.xword	.L624
	.align	3
.LC474:
	.xword	.LC473
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
	bhi	.L647
	ldr	x0, .LC479
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L648
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L649
	cbz	x20, .L650
	add	x2, x0, 217088
	ldr	w1, [x20]
	mov	w0, 0
	str	w1, [x2, 3920]
.L642:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L649:
	ldr	x3, .LC477
	mov	w4, 4171
	ldr	x5, .LC482
.L646:
	ldr	x2, .LC478
	add	x3, x3, 736
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L642
	.p2align 3
.L647:
	ldr	x3, .LC477
	mov	w4, 4169
	ldr	x5, .LC476
	b	.L646
.L648:
	ldr	x3, .LC477
	mov	w4, 4170
	ldr	x5, .LC480
	mov	w1, w4
	ldr	x2, .LC478
	add	x3, x3, 736
	bl	dprint_normal
	mov	w0, -1
	b	.L642
.L650:
	ldr	x3, .LC477
	mov	w4, 4172
	ldr	x5, .LC484
	b	.L646
	.size	VCTRL_ConfigFFFBSpeed, .-VCTRL_ConfigFFFBSpeed
	.align	3
.LC476:
	.xword	.LC103
	.align	3
.LC477:
	.xword	.LANCHOR3
	.align	3
.LC478:
	.xword	.LC105
	.align	3
.LC479:
	.xword	.LANCHOR0
	.align	3
.LC480:
	.xword	.LC372
	.align	3
.LC482:
	.xword	.LC481
	.align	3
.LC484:
	.xword	.LC483
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
	bhi	.L658
	ldr	x0, .LC489
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L659
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L660
	cbz	x20, .L661
	ldr	x3, .LC493
	add	x0, x0, 217088
	mov	x2, 24
	mov	x1, x20
	add	x0, x0, 3956
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L653:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L660:
	ldr	x3, .LC487
	mov	w4, 4183
	ldr	x5, .LC491
.L657:
	ldr	x2, .LC488
	add	x3, x3, 760
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L653
	.p2align 3
.L658:
	ldr	x3, .LC487
	mov	w4, 4181
	ldr	x5, .LC486
	b	.L657
.L661:
	ldr	x3, .LC487
	mov	w4, 4184
	ldr	x5, .LC492
	b	.L657
.L659:
	ldr	x3, .LC487
	mov	w4, 4182
	ldr	x5, .LC490
	mov	w1, w4
	ldr	x2, .LC488
	add	x3, x3, 760
	bl	dprint_normal
	mov	w0, -1
	b	.L653
	.size	VCTRL_ConfigPVRInfo, .-VCTRL_ConfigPVRInfo
	.align	3
.LC486:
	.xword	.LC103
	.align	3
.LC487:
	.xword	.LANCHOR3
	.align	3
.LC488:
	.xword	.LC105
	.align	3
.LC489:
	.xword	.LANCHOR0
	.align	3
.LC490:
	.xword	.LC372
	.align	3
.LC491:
	.xword	.LC481
	.align	3
.LC492:
	.xword	.LC483
	.align	3
.LC493:
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
	bhi	.L669
	ldr	x0, .LC498
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L668
	ldr	w1, [x0, 16]
	cbz	w1, .L668
	ldr	w1, [x0, 20]
	cbz	w1, .L668
	ldr	w1, [x0, 28]
	cbz	w1, .L668
	ldr	w0, [x0, 128]
	cmp	w0, 22
	csetm	w0, eq
.L664:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L668:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L669:
	ldr	x3, .LC496
	mov	w4, 4193
	ldr	x5, .LC495
	mov	w1, w4
	ldr	x2, .LC497
	add	x3, x3, 784
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L664
	.size	VCTRL_IsChanActive, .-VCTRL_IsChanActive
	.align	3
.LC495:
	.xword	.LC103
	.align	3
.LC496:
	.xword	.LANCHOR3
	.align	3
.LC497:
	.xword	.LC105
	.align	3
.LC498:
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
	ldr	x23, .LC502
	str	wzr, [x22]
.L675:
	mov	w0, w19
	bl	VCTRL_IsChanActive
	cbz	w0, .L677
.L672:
	add	x19, x19, 1
	cmp	x19, 4
	bne	.L675
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L677:
	add	x2, x23, 64
	add	x1, x29, 76
	mov	w0, 3
	ldr	x20, [x2, x19, lsl 3]
	ldr	w2, [x20, 128]
	str	w2, [x29, 76]
	bl	PDT_GetAttribute
	cbnz	w0, .L673
	ldr	w0, [x21]
	add	w0, w0, 1
	str	w0, [x21]
.L673:
	ldr	w0, [x20, 128]
	cmp	w0, 1
	bne	.L672
	ldr	w0, [x22]
	add	w0, w0, 1
	str	w0, [x22]
	b	.L672
	.size	VCTRL_GetActiveChanNum, .-VCTRL_GetActiveChanNum
	.align	3
.LC502:
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
	tbnz	w0, #31, .L679
	ldr	w1, [x19, 44]
	mov	w0, 262143
	cmp	w1, w0
	ble	.L679
	ldr	w1, [x19, 36]
	mov	w0, 0
	cmp	w1, 1
	beq	.L683
.L680:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L683:
	ldr	w1, [x19, 20]
	cmp	w1, wzr
	ble	.L679
	ldr	w1, [x19, 24]
	cmp	w1, wzr
	bgt	.L680
	.p2align 2
.L679:
	ldr	x3, .LC504
	mov	w1, 4217
	ldr	x2, .LC506
	mov	w0, 1
	add	x3, x3, 808
	bl	dprint_normal
	mov	w0, -1
	b	.L680
	.size	VCTRL_VarifyOption, .-VCTRL_VarifyOption
	.align	3
.LC504:
	.xword	.LANCHOR3
	.align	3
.LC506:
	.xword	.LC505
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetMemSize_onDecode
	.type	VCTRL_GetMemSize_onDecode, %function
VCTRL_GetMemSize_onDecode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x1
	mov	w21, w0
	mov	x0, x30
	mov	x20, x2
	bl	_mcount
	ldr	w0, [x19, 44]
	mov	w3, 51600
	mov	w1, 52288
	movk	w3, 0x7, lsl 16
	add	w0, w0, 1039
	movk	w1, 0xb0, lsl 16
	cmp	w21, 25
	and	w0, w0, -1024
	add	w0, w0, 32768
	csel	w3, w3, w1, ne
	stp	w0, w3, [x20, 4]
	ldr	w0, [x19, 36]
	cbz	w0, .L691
	ldr	w1, [x19, 12]
	cmp	w1, wzr
	ble	.L692
	sxtw	x2, w1
	lsl	x0, x2, 7
	sub	x2, x0, x2
	lsl	x2, x2, 5
.L687:
	ldp	w5, w6, [x19, 20]
	mov	w0, 2208
	mov	w4, 4000
	cmp	w21, 25
	str	w1, [x19, 12]
	smull	x0, w6, w0
	smaddl	x0, w5, w4, x0
	add	x3, x0, x2
	beq	.L689
	mov	w0, 46660
	ldr	w1, [x20, 8]
	movk	w0, 0x9, lsl 16
	cmp	w3, w0
	csel	w0, w3, w0, cs
	add	w1, w1, w0
	str	w1, [x20, 8]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L691:
	mov	w0, 46660
	mov	w1, w3
	movk	w0, 0x9, lsl 16
	add	w1, w1, w0
	str	w1, [x20, 8]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L689:
	mov	w1, 2240
	mov	w4, 3992
	and	x3, x3, 4294967295
	mov	w0, 46660
	smull	x6, w6, w1
	smaddl	x5, w5, w4, x6
	movk	w0, 0x9, lsl 16
	ldr	w1, [x20, 8]
	add	x2, x5, x2
	cmp	x2, x3
	csel	x3, x2, x3, cs
	cmp	w3, w0
	csel	w0, w3, w0, cs
	add	w1, w1, w0
	str	w1, [x20, 8]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L692:
	mov	x2, 28416
	mov	w1, 136
	movk	x2, 0x8, lsl 16
	b	.L687
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
	stp	x21, x22, [sp, 32]
	mov	w22, w0
	mov	x19, x1
	mov	x0, x30
	mov	x20, x2
	mov	w21, w3
	bl	_mcount
	cbz	x19, .L704
	cbz	x20, .L705
	cmp	w21, 2
	beq	.L697
	ldr	x0, .LC513
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
	blt	.L706
	str	w0, [x19, 28]
	str	w1, [x19, 48]
.L697:
	mov	x0, x19
	bl	VCTRL_VarifyOption
	cbnz	w0, .L699
	mov	x2, x20
	mov	x1, x19
	mov	w0, w22
	bl	VCTRL_GetMemSize_onDecode
.L695:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L699:
	mov	w0, -1
	b	.L695
	.p2align 3
.L706:
	ldr	x2, .LC515
	mov	w1, 4291
	mov	w0, 32
	bl	dprint_normal
	mov	w0, -1
	b	.L695
.L705:
	ldr	x3, .LC509
	mov	w4, 4282
	ldr	x5, .LC512
.L703:
	ldr	x2, .LC510
	add	x3, x3, 832
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L695
.L704:
	ldr	x3, .LC509
	mov	w4, 4281
	ldr	x5, .LC508
	b	.L703
	.size	VCTRL_GetChanMemSize, .-VCTRL_GetChanMemSize
	.align	3
.LC508:
	.xword	.LC507
	.align	3
.LC509:
	.xword	.LANCHOR3
	.align	3
.LC510:
	.xword	.LC105
	.align	3
.LC512:
	.xword	.LC511
	.align	3
.LC513:
	.xword	.LANCHOR0
	.align	3
.LC515:
	.xword	.LC514
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
	ldr	x21, .LC516
	ldr	x22, .LC517
	mov	w0, 0
	ldr	x23, [x21, 400]
	ldrsw	x20, [x22, 88]
	bl	VFMW_GetString
	ldr	x19, .LC518
	mov	x3, x0
	mov	x2, x20
	ldr	x1, .LC519
	add	x20, x19, 984
	mov	w0, 127
	mov	x4, x20
	blr	x23
	cbnz	w0, .L711
	add	x19, x19, 96
	mov	w0, 4
	ldrsw	x23, [x22, 88]
	ldr	x22, [x21, 400]
	mov	w21, 1
	str	w21, [x19, 200]
	bl	VFMW_GetString
	ldr	x1, .LC522
	mov	x3, x0
	mov	x4, x20
	mov	x2, x23
	mov	w0, 136
	blr	x22
	cbnz	w0, .L712
	str	w21, [x19, 204]
.L709:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L711:
	ldr	x2, .LC521
	mov	w3, 127
	mov	w1, 4314
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L709
	.p2align 3
.L712:
	ldr	x2, .LC521
	mov	w3, 136
	mov	w1, 4322
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L709
	.size	VCTRL_RegisterInterrupt, .-VCTRL_RegisterInterrupt
	.align	3
.LC516:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC517:
	.xword	.LANCHOR1
	.align	3
.LC518:
	.xword	.LANCHOR0
	.align	3
.LC519:
	.xword	VCTRL_Isr_0
	.align	3
.LC521:
	.xword	.LC520
	.align	3
.LC522:
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
	ldr	x19, .LC525
	ldr	w0, [x19, 296]
	cmp	w0, 1
	beq	.L716
.L714:
	ldr	w0, [x19, 300]
	cmp	w0, 1
	beq	.L717
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L717:
	ldr	x1, .LC526
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
.L716:
	ldr	x1, .LC526
	mov	w0, 0
	ldr	x21, [x1, 408]
	bl	VFMW_GetString
	add	x2, x19, 984
	mov	x1, x0
	mov	w0, 127
	blr	x21
	str	wzr, [x19, 296]
	b	.L714
	.size	VCTRL_UnregisterInterrupt, .-VCTRL_UnregisterInterrupt
	.align	3
.LC525:
	.xword	.LANCHOR0
	.align	3
.LC526:
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
	cbnz	w0, .L721
	ldr	w0, [x19, 16]
	ldr	w2, [x19, 24]
	ldr	x1, [x19, 8]
	bl	MEM_AddMemRecord
.L720:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L721:
	ldr	x2, .LC529
	mov	w3, -121438208
	mov	w1, 4377
	mov	w0, 0
	mov	w20, -1
	bl	dprint_normal
	b	.L720
	.size	VCTRL_MapVdmRegister, .-VCTRL_MapVdmRegister
	.align	3
.LC529:
	.xword	.LC528
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
	cbz	w20, .L723
	mov	x1, x22
	mov	w0, w21
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC530
	mov	x2, 32
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
.L723:
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
.LC530:
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
	ldr	x21, .LC531
	mov	w0, 15
	ldr	x20, [x21, 136]
	bl	VFMW_GetString
	mov	x1, 20
	mov	x2, x0
	mov	w3, 0
	add	x0, x29, 48
	blr	x20
	ldr	x20, .LC532
	strb	wzr, [x29, 67]
	ldr	x1, [x20, 88]
	cbz	x1, .L728
	mov	w0, 0
	blr	x1
	cmp	w0, wzr
	mov	w2, w0
	ble	.L728
	mov	w4, 0
	mov	x3, x19
	mov	w1, 0
	add	x0, x29, 48
	str	wzr, [x19, 28]
	bl	MEM_AllocMemBlock
	cbnz	w0, .L729
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
	cbz	x1, .L730
	add	x0, x29, 72
	blr	x1
	mov	w19, w0
	cbnz	w0, .L730
	bl	VDMDRV_Init
.L731:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L728:
	ldr	x2, .LC534
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
.L730:
	ldr	x2, .LC538
	mov	w3, 0
	mov	w1, 4510
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L731
	.p2align 3
.L729:
	ldr	x2, .LC536
	mov	w3, 0
	mov	w1, 4496
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L731
	.size	VCTRL_InitVdmHal, .-VCTRL_InitVdmHal
	.align	3
.LC531:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC532:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC534:
	.xword	.LC533
	.align	3
.LC536:
	.xword	.LC535
	.align	3
.LC538:
	.xword	.LC537
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
	cbz	w0, .L746
	ldr	w0, [x19, 80]
	cmp	w0, wzr
	cset	w23, ne
.L739:
	ldr	w20, [x19, 24]
	ldr	w21, [x19, 16]
	ldr	x22, [x19, 8]
	cbz	w20, .L740
	ldr	x0, .LC539
	ldr	x1, [x0, 104]
	cbz	x1, .L752
	mov	w0, 0
	blr	x1
	cbz	w23, .L743
.L744:
	ldr	x3, .LC540
	mov	x2, 32
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
.L740:
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
.L752:
	mov	w3, 4550
	ldr	x2, .LC541
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	cbnz	w23, .L744
	.p2align 2
.L743:
	ldr	w0, [x19, 16]
	ldr	x1, [x19, 8]
	bl	MEM_ReleaseMemBlock
	b	.L744
	.p2align 3
.L746:
	mov	w23, 0
	b	.L739
	.size	VCTRL_DeinitVdmHal, .-VCTRL_DeinitVdmHal
	.align	3
.LC539:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC540:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC541:
	.xword	.LC219
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
	ldr	x1, .LC542
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
	cbnz	w0, .L754
	ldr	w2, [x19, 56]
	ldr	x1, [x19, 40]
	ldr	w0, [x19, 48]
	bl	MEM_AddMemRecord
	ldr	w0, [x19, 48]
	mov	w2, 0
	ldr	w1, [x19, 56]
	bl	SM_OpenSCDDrv
	mov	w19, w0
	cbnz	w0, .L755
	bl	SM_InstInit
.L756:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L754:
	ldr	x2, .LC544
	mov	w3, 0
	mov	w1, 4592
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L756
	.p2align 3
.L755:
	ldr	x2, .LC546
	mov	w3, 0
	mov	w1, 4600
	mov	w0, 0
	mov	w19, -1
	bl	dprint_normal
	b	.L756
	.size	VCTRL_InitScdHal, .-VCTRL_InitScdHal
	.align	3
.LC542:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC544:
	.xword	.LC543
	.align	3
.LC546:
	.xword	.LC545
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
	cbz	w0, .L758
	ldr	w0, [x19, 80]
	cbz	w0, .L758
	ldr	w20, [x19, 56]
	ldr	w22, [x19, 48]
	ldr	x21, [x19, 40]
	cbz	w20, .L762
	mov	w0, 0
	add	x23, x19, 32
	bl	SM_CloseSCDDrv
.L760:
	ldr	x3, .LC547
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	ldr	x3, [x3, 96]
	blr	x3
.L762:
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
.L758:
	ldr	w20, [x19, 56]
	ldr	w22, [x19, 48]
	ldr	x21, [x19, 40]
	cbz	w20, .L762
	mov	w0, 0
	add	x23, x19, 32
	bl	SM_CloseSCDDrv
	ldr	w0, [x19, 48]
	ldr	x1, [x19, 40]
	bl	MEM_ReleaseMemBlock
	b	.L760
	.size	VCTRL_DeinitScdHal, .-VCTRL_DeinitScdHal
	.align	3
.LC547:
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
	ldr	x2, .LC549
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
	beq	.L775
	cmp	w19, w22
	mov	w19, w21
	blt	.L776
.L772:
	ldr	x2, .LC555
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
.L776:
	ldr	x2, .LC553
	mov	w1, 4670
	mov	w0, 25
	mov	w19, 3
	bl	dprint_normal
	b	.L772
	.p2align 3
.L775:
	cmp	w20, w22
	mov	w19, w21
	ble	.L772
	ldr	x2, .LC551
	mov	w1, 4662
	mov	w0, 25
	mov	w19, 0
	bl	dprint_normal
	b	.L772
	.size	VCTRL_GetNextDecodeMode, .-VCTRL_GetNextDecodeMode
	.align	3
.LC549:
	.xword	.LC548
	.align	3
.LC551:
	.xword	.LC550
	.align	3
.LC553:
	.xword	.LC552
	.align	3
.LC555:
	.xword	.LC554
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
	ldr	x2, .LC558
	mov	x0, 0
.L780:
	add	x1, x2, 64
	ldr	x1, [x1, x0, lsl 3]
	cbz	x1, .L778
	ldr	w1, [x1, 28]
	str	w1, [x19, x0, lsl 2]
.L779:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L780
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L778:
	str	wzr, [x19, x0, lsl 2]
	b	.L779
	.size	VCTRL_GetChanPriorityTab, .-VCTRL_GetChanPriorityTab
	.align	3
.LC558:
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
	cbz	x19, .L792
	ldr	x3, .LC564
	mov	x0, 0
.L786:
	add	x1, x3, 64
	ldr	x2, [x1, x0, lsl 3]
	add	x1, x2, 221184
	add	x1, x1, 120
	cbz	x2, .L785
	cmp	x19, x1
	beq	.L784
.L785:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L786
	mov	w0, -1
.L784:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L792:
	ldr	x3, .LC562
	mov	w4, 4703
	ldr	x5, .LC561
	mov	w1, w4
	ldr	x2, .LC563
	add	x3, x3, 856
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L784
	.size	VCTRL_GetChanIDByCtx, .-VCTRL_GetChanIDByCtx
	.align	3
.LC561:
	.xword	.LC560
	.align	3
.LC562:
	.xword	.LANCHOR3
	.align	3
.LC563:
	.xword	.LC105
	.align	3
.LC564:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_USERDEC_Init
	.type	VCTRL_USERDEC_Init, %function
VCTRL_USERDEC_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x3, .LC566
	mov	x2, 624
	mov	w1, 0
	mov	x0, x19
	ldr	w21, [x19, 608]
	ldr	x3, [x3, 96]
	blr	x3
	str	w21, [x19, 608]
	add	x0, x19, 8
	bl	ResetVoQueue
	str	x20, [x19]
	mov	x0, x19
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x19, 616]
	beq	.L796
	mov	w0, 1
.L794:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L796:
	ldr	x2, .LC568
	mov	w1, 1324
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -20
	b	.L794
	.size	VCTRL_USERDEC_Init, .-VCTRL_USERDEC_Init
	.align	3
.LC566:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC568:
	.xword	.LC567
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
	ldr	x0, .LC569
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L812
	ldr	w1, [x0, 128]
	cmp	w1, 20
	bls	.L813
.L797:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L813:
	ldr	x2, .LC573
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx801
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx801:
	.section	.rodata
	.align	0
	.align	2
.L801:
	.byte	(.L800 - .Lrtx801) / 4
	.byte	(.L802 - .Lrtx801) / 4
	.byte	(.L803 - .Lrtx801) / 4
	.byte	(.L804 - .Lrtx801) / 4
	.byte	(.L805 - .Lrtx801) / 4
	.byte	(.L797 - .Lrtx801) / 4
	.byte	(.L806 - .Lrtx801) / 4
	.byte	(.L797 - .Lrtx801) / 4
	.byte	(.L797 - .Lrtx801) / 4
	.byte	(.L797 - .Lrtx801) / 4
	.byte	(.L807 - .Lrtx801) / 4
	.byte	(.L807 - .Lrtx801) / 4
	.byte	(.L807 - .Lrtx801) / 4
	.byte	(.L808 - .Lrtx801) / 4
	.byte	(.L805 - .Lrtx801) / 4
	.byte	(.L809 - .Lrtx801) / 4
	.byte	(.L810 - .Lrtx801) / 4
	.byte	(.L797 - .Lrtx801) / 4
	.byte	(.L797 - .Lrtx801) / 4
	.byte	(.L797 - .Lrtx801) / 4
	.byte	(.L811 - .Lrtx801) / 4
	.text
	.p2align 3
.L811:
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	VCTRL_USERDEC_Init
	b	.L797
	.p2align 3
.L810:
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	HEVCDEC_Init
	b	.L797
	.p2align 3
.L809:
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	MVC_DEC_Init
	b	.L797
	.p2align 3
.L808:
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	VP8DEC_Init
	b	.L797
	.p2align 3
.L807:
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	VP6DEC_Init
	b	.L797
	.p2align 3
.L806:
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	AVSDEC_Init
	b	.L797
	.p2align 3
.L805:
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	H263DEC_Init
	b	.L797
	.p2align 3
.L804:
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	MPEG2DEC_Init
	b	.L797
	.p2align 3
.L803:
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	MPEG4DEC_Init
	b	.L797
	.p2align 3
.L802:
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	VC1DEC_Init
	b	.L797
	.p2align 3
.L800:
	add	x1, x0, 217088
	add	x0, x0, 221184
	add	x1, x1, 3288
	add	x0, x0, 120
	bl	H264DEC_Init
	b	.L797
	.p2align 3
.L812:
	ldr	x3, .LC571
	mov	w4, 2780
	ldr	x5, .LC570
	mov	w1, w4
	ldr	x2, .LC572
	add	x3, x3, 880
	bl	dprint_normal
	b	.L797
	.size	VCTRL_InitSyntaxCtx, .-VCTRL_InitSyntaxCtx
	.align	3
.LC569:
	.xword	.LANCHOR0
	.align	3
.LC570:
	.xword	.LC119
	.align	3
.LC571:
	.xword	.LANCHOR3
	.align	3
.LC572:
	.xword	.LC105
	.align	3
.LC573:
	.xword	.L801
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DecChanProcessPts
	.type	VCTRL_DecChanProcessPts, %function
VCTRL_DecChanProcessPts:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x21, .LC575
	add	x0, x21, 64
	ldr	x0, [x0, w20, sxtw 3]
	add	x6, x0, 217088
	ldr	w2, [x6, 3080]
	cmp	w2, 1
	beq	.L845
	cmp	w2, 6
	sub	w0, w2, #2
	ccmp	w2, 18, 4, ne
	ccmp	w0, 1, 0, ne
	bls	.L816
.L817:
	ldr	x4, [x19, 40]
	cmn	x4, #1
	beq	.L846
	str	x4, [x6, 3320]
.L827:
	ldr	x5, [x19, 56]
	mov	w3, w20
	str	x5, [x6, 3336]
	mov	w1, 4824
	ldr	x2, .LC581
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
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L845:
	add	x0, x0, 221184
	ldr	x0, [x0, 120]
	ldrsb	w0, [x0, 572]
	cmp	w0, 1
	bne	.L817
	.p2align 2
.L816:
	add	x3, x19, 8
	add	x1, x6, 3856
	mov	w0, w20
	bl	IsNewpicSeg
	cbnz	w0, .L818
	add	x0, x21, 64
	ldr	x0, [x0, w20, sxtw 3]
	add	x0, x0, 217088
	ldr	w1, [x0, 3080]
	cmp	w1, 3
	ldr	x1, [x0, 3328]
	beq	.L843
	cmn	x1, #1
	beq	.L820
.L843:
	str	x1, [x0, 3320]
.L820:
	ldr	x3, [x0, 3344]
	mov	x2, -1
	ldr	x1, [x0, 3360]
	str	x2, [x0, 3328]
	str	x3, [x0, 3336]
	str	x1, [x0, 3352]
	cbnz	x1, .L821
	ldr	x1, [x19, 64]
	str	x1, [x0, 3352]
.L821:
	ldr	w2, [x0, 3384]
	add	x21, x21, 64
	ldr	w3, [x0, 3388]
	ldr	w1, [x0, 3396]
	ldr	w5, [x0, 3380]
	str	w2, [x0, 3372]
	ldr	x4, [x0, 3320]
	ldr	x2, .LC577
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
	beq	.L847
.L822:
	ldr	x1, [x19, 40]
	cmn	x1, #1
	beq	.L824
.L844:
	str	x1, [x0, 3328]
.L824:
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
.L823:
	ldr	x4, [x0, 3336]
	mov	w3, w20
	ldr	x2, .LC579
	mov	w1, 4807
	mov	w0, 24
	bl	dprint_normal
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L846:
	ldr	x4, [x6, 3320]
	b	.L827
	.p2align 3
.L818:
	add	x21, x21, 64
	ldr	x0, [x21, w20, sxtw 3]
	add	x0, x0, 217088
	ldr	w1, [x0, 3080]
	cmp	w1, 3
	bne	.L822
	b	.L823
	.p2align 3
.L847:
	ldr	x1, [x19, 40]
	b	.L844
	.size	VCTRL_DecChanProcessPts, .-VCTRL_DecChanProcessPts
	.align	3
.LC575:
	.xword	.LANCHOR0
	.align	3
.LC577:
	.xword	.LC576
	.align	3
.LC579:
	.xword	.LC578
	.align	3
.LC581:
	.xword	.LC580
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
	ldr	x0, .LC583
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w0, [x0, 128]
	cmp	w0, 20
	beq	.L849
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbnz	x0, .L851
.L849:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L851:
	mov	w0, -2
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_DecChanCheckDecParam, .-VCTRL_DecChanCheckDecParam
	.align	3
.LC583:
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
	bhi	.L880
	ldr	x22, .LC588
	add	x21, x22, 64
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L881
	ldr	w1, [x0, 20]
	cmp	w1, 1
	bne	.L882
	ldr	w20, [x0, 32]
	cbnz	w20, .L883
	mov	w0, w19
	bl	IsPrintStateAllow
	mov	w23, w0
	ldr	x0, [x21, w19, sxtw 3]
	ldr	w0, [x0, 128]
	cmp	w0, 20
	beq	.L861
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbnz	x0, .L884
.L861:
	mov	w0, w19
	bl	VCTRL_GetImageBuffer
	cmp	w0, 1
	beq	.L885
	cmp	w23, 1
	mov	w20, -3
	beq	.L886
.L873:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L884:
	cmp	w23, 1
	beq	.L864
	mov	w20, -2
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L885:
	add	x0, x22, 64
	ldr	x0, [x0, w19, sxtw 3]
	add	x21, x0, 217088
	add	x24, x21, 3400
	ldrb	w1, [x24, 1]
	cbnz	w1, .L863
	add	x0, x0, 221184
	ldr	w0, [x0, 80]
	cbz	w0, .L887
.L863:
	ldr	x4, [x21, 3440]
	mov	w3, w19
	ldr	x5, [x21, 3456]
	mov	w1, 4896
	ldr	x2, .LC600
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
.L864:
	ldr	x2, .LC594
	mov	w3, w19
	mov	w1, 4862
	mov	w0, 23
	mov	w20, -2
	bl	dprint_normal
	b	.L873
	.p2align 3
.L886:
	ldr	x2, .LC596
	mov	w3, w19
	mov	w1, 4873
	mov	w0, 23
	bl	dprint_normal
	b	.L873
	.p2align 3
.L882:
	ldr	x3, .LC586
	mov	w4, 4852
	ldr	x5, .LC590
.L877:
	ldr	x2, .LC587
	add	x3, x3, 904
	mov	w1, w4
	mov	w0, 0
	mov	w20, -1
	bl	dprint_normal
	b	.L873
	.p2align 3
.L883:
	ldr	x3, .LC586
	mov	w4, 4853
	ldr	x5, .LC592
	b	.L877
	.p2align 3
.L887:
	add	x1, x21, 3408
	mov	w0, w19
	bl	SM_ReadSegStream
	cbz	w0, .L863
	cmp	w23, 1
	mov	w20, -4
	bne	.L873
	ldr	x2, .LC598
	mov	w3, w19
	mov	w1, 4888
	mov	w0, 23
	bl	dprint_normal
	b	.L873
	.p2align 3
.L880:
	ldr	x3, .LC586
	mov	w4, 4850
	ldr	x5, .LC585
	b	.L877
.L881:
	ldr	x3, .LC586
	mov	w4, 4851
	ldr	x5, .LC589
	mov	w1, w4
	ldr	x2, .LC587
	add	x3, x3, 904
	mov	w20, -1
	bl	dprint_normal
	b	.L873
	.size	VCTRL_DecChanSyntax, .-VCTRL_DecChanSyntax
	.align	3
.LC585:
	.xword	.LC103
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
	.xword	.LC322
	.align	3
.LC590:
	.xword	.LC463
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
	ldr	x19, .LC602
	mov	x0, 0
.L891:
	add	x1, x19, 64
	add	x2, x19, 992
	ldr	x1, [x1, x0, lsl 3]
	cbz	x1, .L889
	ldr	w1, [x1, 28]
	str	w1, [x2, x0, lsl 2]
.L890:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L891
	ldr	x24, .LC603
	mov	w21, -1
	.p2align 2
.L892:
	ldr	w1, [x19, 992]
	mov	w20, 1
	ldr	w0, [x19, 996]
	cmp	w1, w0
	blt	.L893
	mov	w0, w1
	mov	w20, 0
.L893:
	ldr	w1, [x19, 1000]
	cmp	w0, w1
	bge	.L920
	ldr	w0, [x19, 1004]
	mov	w20, 2
	cmp	w1, w0
	bge	.L921
.L909:
	mov	w20, 3
	add	x3, x19, 992
	add	x1, x19, 96
	add	w2, w20, 1
	cmp	w0, wzr
	sxtw	x23, w20
	str	wzr, [x3, w20, sxtw 2]
	str	w2, [x1, 28]
	ble	.L896
.L924:
	add	x0, x19, 64
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L892
	ldr	w1, [x0, 20]
	cmp	w1, 1
	bne	.L892
	add	x0, x0, 217088
	ldr	w1, [x0, 3104]
	cmp	w1, wzr
	ble	.L898
	ldr	w0, [x0, 3108]
	cbz	w0, .L922
.L898:
	mov	w22, 500
	b	.L906
	.p2align 3
.L901:
	cbnz	w21, .L923
	ldr	x0, [x0, x23, lsl 3]
	add	x0, x0, 221184
	ldr	w1, [x0, 100]
	cmp	w1, 1
	beq	.L904
	subs	w22, w22, #1
	beq	.L892
.L906:
	mov	w0, w20
	bl	VCTRL_DecChanSyntax
	mov	w21, w0
	cmn	w21, #1
	add	x0, x19, 64
	bne	.L901
	ldr	x4, [x19, 1008]
	cbz	x4, .L902
	mov	w3, 0
	mov	x2, 0
	mov	w1, 21
	mov	w0, w20
	blr	x4
.L902:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L920:
	mov	w1, w0
	ldr	w0, [x19, 1004]
	cmp	w1, w0
	blt	.L909
.L921:
	mov	w0, w1
	add	x3, x19, 992
	add	x1, x19, 96
	add	w2, w20, 1
	cmp	w0, wzr
	sxtw	x23, w20
	str	wzr, [x3, w20, sxtw 2]
	str	w2, [x1, 28]
	bgt	.L924
.L896:
	str	wzr, [x1, 28]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L923:
	add	x0, x19, 64
	ldr	x0, [x0, x23, lsl 3]
	add	x0, x0, 221184
.L904:
	str	wzr, [x0, 100]
	b	.L892
	.p2align 3
.L889:
	add	x1, x19, 992
	str	wzr, [x1, x0, lsl 2]
	b	.L890
	.p2align 3
.L922:
	add	x1, x29, 72
	mov	w0, w20
	bl	SM_GetInfo
	cbnz	w0, .L925
.L899:
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
	cbz	w1, .L900
	str	wzr, [x0, 3288]
	str	wzr, [x0, 3292]
	b	.L898
.L900:
	ldr	w1, [x0, 3100]
	str	w1, [x0, 3288]
	str	w1, [x0, 3292]
	b	.L898
.L925:
	ldr	x3, [x24, 96]
	mov	x2, 24
	mov	w1, 0
	add	x0, x29, 72
	blr	x3
	b	.L899
	.size	VCTRL_DecSyntax, .-VCTRL_DecSyntax
	.align	3
.LC602:
	.xword	.LANCHOR0
	.align	3
.LC603:
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
	bhi	.L942
	ldr	x0, .LC607
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L942
	ldr	w1, [x0, 128]
	cmp	w1, 20
	bls	.L943
.L942:
	mov	x0, 0
.L927:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L943:
	ldr	x2, .LC608
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx929
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx929:
	.section	.rodata
	.align	0
	.align	2
.L929:
	.byte	(.L939 - .Lrtx929) / 4
	.byte	(.L930 - .Lrtx929) / 4
	.byte	(.L931 - .Lrtx929) / 4
	.byte	(.L932 - .Lrtx929) / 4
	.byte	(.L933 - .Lrtx929) / 4
	.byte	(.L942 - .Lrtx929) / 4
	.byte	(.L934 - .Lrtx929) / 4
	.byte	(.L942 - .Lrtx929) / 4
	.byte	(.L942 - .Lrtx929) / 4
	.byte	(.L942 - .Lrtx929) / 4
	.byte	(.L935 - .Lrtx929) / 4
	.byte	(.L935 - .Lrtx929) / 4
	.byte	(.L935 - .Lrtx929) / 4
	.byte	(.L936 - .Lrtx929) / 4
	.byte	(.L933 - .Lrtx929) / 4
	.byte	(.L937 - .Lrtx929) / 4
	.byte	(.L938 - .Lrtx929) / 4
	.byte	(.L942 - .Lrtx929) / 4
	.byte	(.L942 - .Lrtx929) / 4
	.byte	(.L942 - .Lrtx929) / 4
	.byte	(.L939 - .Lrtx929) / 4
	.text
	.p2align 3
.L939:
	add	x0, x0, 221184
	ldr	x19, [sp, 16]
	add	x0, x0, 128
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L930:
	add	x0, x0, 270336
	add	x0, x0, 3800
	b	.L927
	.p2align 3
.L938:
	add	x0, x0, 229376
	add	x0, x0, 296
	b	.L927
	.p2align 3
.L937:
	add	x0, x0, 221184
	add	x0, x0, 1032
	b	.L927
	.p2align 3
.L932:
	add	x0, x0, 303104
	add	x0, x0, 248
	b	.L927
	.p2align 3
.L931:
	add	x0, x0, 241664
	add	x0, x0, 2280
	b	.L927
	.p2align 3
.L936:
	add	x0, x0, 229376
	add	x0, x0, 136
	b	.L927
	.p2align 3
.L935:
	add	x0, x0, 233472
	add	x0, x0, 568
	b	.L927
	.p2align 3
.L934:
	add	x0, x0, 233472
	add	x0, x0, 4040
	b	.L927
	.p2align 3
.L933:
	add	x0, x0, 241664
	add	x0, x0, 2304
	b	.L927
	.size	VCTRL_GetChanVoQue, .-VCTRL_GetChanVoQue
	.align	3
.LC607:
	.xword	.LANCHOR0
	.align	3
.LC608:
	.xword	.L929
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
	mov	x22, x1
	mov	x21, x2
	mov	x23, x3
	bl	_mcount
	cmp	w19, 3
	bhi	.L958
	ldr	x20, .LC613
	add	x20, x20, 64
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L959
	cbz	x22, .L960
	cbz	x21, .L961
	cbz	x23, .L962
	mov	w0, w19
	bl	VCTRL_GetChanVoQue
	cbz	x0, .L951
	mov	x2, x23
	mov	x1, x21
	bl	SYNTAX_GetQueueImgNum
	ldr	x0, [x20, w19, sxtw 3]
	ldr	w4, [x0, 128]
	cbz	w4, .L963
	cmp	w4, 16
	beq	.L964
	cmp	w4, 17
	beq	.L965
	cmp	w4, 15
	beq	.L966
	cmp	w4, 18
	beq	.L967
	mov	w0, 2
	str	w0, [x22]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L958:
	ldr	x3, .LC611
	mov	w4, 5107
	ldr	x5, .LC610
.L957:
	ldr	x2, .LC612
	add	x3, x3, 928
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L944:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L951:
	str	wzr, [x23]
	str	wzr, [x21]
	str	wzr, [x22]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L963:
	add	x0, x0, 245760
	ldr	w0, [x0, 3824]
	str	w0, [x22]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L964:
	add	x0, x0, 221184
	ldr	x0, [x0, 2504]
	ldr	w0, [x0, 184]
	str	w0, [x22]
	b	.L944
	.p2align 3
.L966:
	add	x0, x0, 11345920
	ldr	w0, [x0, 528]
	str	w0, [x22]
	b	.L944
	.p2align 3
.L959:
	ldr	x3, .LC611
	mov	w4, 5108
	ldr	x5, .LC614
	mov	w1, w4
	ldr	x2, .LC612
	add	x3, x3, 928
	bl	dprint_normal
	b	.L944
	.p2align 3
.L960:
	ldr	x3, .LC611
	mov	w4, 5109
	ldr	x5, .LC616
	b	.L957
	.p2align 3
.L961:
	ldr	x3, .LC611
	mov	w4, 5110
	ldr	x5, .LC618
	b	.L957
	.p2align 3
.L962:
	ldr	x3, .LC611
	mov	w4, 5111
	ldr	x5, .LC620
	b	.L957
	.p2align 3
.L967:
	ldr	x3, .LC611
	mov	w1, 5156
	ldr	x2, .LC622
	mov	w0, 32
	add	x3, x3, 928
	bl	dprint_normal
	b	.L944
	.p2align 3
.L965:
	ldr	x3, .LC611
	mov	w1, 5140
	ldr	x2, .LC622
	mov	w0, 32
	add	x3, x3, 928
	bl	dprint_normal
	b	.L944
	.size	VCTRL_GetChanImgNum, .-VCTRL_GetChanImgNum
	.align	3
.LC610:
	.xword	.LC103
	.align	3
.LC611:
	.xword	.LANCHOR3
	.align	3
.LC612:
	.xword	.LC105
	.align	3
.LC613:
	.xword	.LANCHOR0
	.align	3
.LC614:
	.xword	.LC372
	.align	3
.LC616:
	.xword	.LC615
	.align	3
.LC618:
	.xword	.LC617
	.align	3
.LC620:
	.xword	.LC619
	.align	3
.LC622:
	.xword	.LC621
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
	bhi	.L974
	ldr	x22, .LC627
	sxtw	x21, w20
	add	x23, x22, 64
	ldr	x0, [x23, w20, sxtw 3]
	cbz	x0, .L975
	cbz	x19, .L976
	ldr	x0, .LC631
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
.L968:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L974:
	ldr	x3, .LC625
	mov	w4, 1273
	ldr	x5, .LC624
.L973:
	ldr	x2, .LC626
	add	x3, x3, 952
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L976:
	ldr	x3, .LC625
	mov	w4, 1275
	ldr	x5, .LC630
	b	.L973
	.p2align 3
.L975:
	ldr	x3, .LC625
	mov	w4, 1274
	ldr	x5, .LC628
	mov	w1, w4
	ldr	x2, .LC626
	add	x3, x3, 952
	bl	dprint_normal
	b	.L968
	.size	VCTRL_GetChanState, .-VCTRL_GetChanState
	.align	3
.LC624:
	.xword	.LC375
	.align	3
.LC625:
	.xword	.LANCHOR3
	.align	3
.LC626:
	.xword	.LC105
	.align	3
.LC627:
	.xword	.LANCHOR0
	.align	3
.LC628:
	.xword	.LC380
	.align	3
.LC630:
	.xword	.LC629
	.align	3
.LC631:
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
	cbz	w19, .L981
	ldr	x5, .LC636
	mov	w3, 1
	ldr	x0, .LC634
	add	x5, x5, 976
	b	.L979
	.p2align 3
.L980:
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
	beq	.L978
	ldr	x0, [x2, 8]
.L979:
	uxtw	x2, w3
	cbnz	x0, .L980
.L978:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L981:
	ldr	x0, .LC635
	b	.L978
	.size	VCTRL_GetVfmwProcHandler, .-VCTRL_GetVfmwProcHandler
	.align	3
.LC634:
	.xword	VfmwProc_SetErrorThreshold
	.align	3
.LC635:
	.xword	VfmwProc_SetPrintLevel
	.align	3
.LC636:
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
	cbz	x21, .L986
	cmp	w19, 40
	bhi	.L985
	uxtw	x0, w19
	ldr	x3, .LC640
	lsl	x1, x0, 2
	ldr	x5, .LC642
	sub	x0, x1, x0
	add	x3, x3, 976
	lsl	x0, x0, 4
	ldr	x2, .LC644
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
.L984:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L985:
	mov	w0, -1
	b	.L984
.L986:
	ldr	x3, .LC640
	mov	w4, 6148
	ldr	x5, .LC639
	mov	w1, w4
	ldr	x2, .LC641
	add	x3, x3, 2992
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L984
	.size	VCTRL_ShowProcCommand, .-VCTRL_ShowProcCommand
	.align	3
.LC639:
	.xword	.LC638
	.align	3
.LC640:
	.xword	.LANCHOR3
	.align	3
.LC641:
	.xword	.LC105
	.align	3
.LC642:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC644:
	.xword	.LC643
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
	cbz	x20, .L997
	cbz	w19, .L994
	ldr	x6, .LC648
	mov	w4, 1
	ldr	x7, .LC646
	add	x6, x6, 976
	b	.L990
	.p2align 3
.L995:
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
	beq	.L989
	ldr	x7, [x2, 8]
.L990:
	uxtw	x2, w4
	cbnz	x7, .L995
	ldr	x2, .LC650
	mov	w3, w19
	mov	w1, 6179
	mov	w0, 32
	bl	dprint_normal
.L997:
	mov	w0, -2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L994:
	ldr	x7, .LC647
.L989:
	mov	x0, x20
	blr	x7
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetDbgOption, .-VCTRL_SetDbgOption
	.align	3
.LC646:
	.xword	VfmwProc_SetErrorThreshold
	.align	3
.LC647:
	.xword	VfmwProc_SetPrintLevel
	.align	3
.LC648:
	.xword	.LANCHOR3
	.align	3
.LC650:
	.xword	.LC649
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
	bhi	.L1004
	ldr	x0, .LC652
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L998
	str	w20, [x0, 140]
.L998:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1004:
	bl	VCTRL_SetLastFrameState.part.22
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetLastFrameState, .-VCTRL_SetLastFrameState
	.align	3
.LC652:
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
	cbz	w20, .L1012
	cmp	w20, 1
	mov	w0, 3
	mov	w1, 4
	csel	w0, w0, w1, eq
	cmp	w19, 3
	bhi	.L1019
.L1009:
	ldr	x1, .LC654
	add	x2, x1, 64
	ldr	x2, [x2, w19, sxtw 3]
	cbz	x2, .L1010
	str	w0, [x2, 140]
.L1010:
	ldr	x4, [x1, 1008]
	cbz	x4, .L1005
	add	x2, x29, 48
	mov	w3, 4
	mov	w1, 44
	mov	w0, w19
	str	w20, [x2, -8]!
	blr	x4
.L1005:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1012:
	cmp	w19, 3
	mov	w0, 2
	bls	.L1009
.L1019:
	bl	VCTRL_SetLastFrameState.part.22
	ldr	x1, .LC654
	b	.L1010
	.size	VCTRL_ReportLastFrame, .-VCTRL_ReportLastFrame
	.align	3
.LC654:
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
	bhi	.L1039
	ldr	x19, .LC659
	add	x0, x19, 64
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L1040
	add	x0, x0, 221184
	ldr	w1, [x0, 112]
	cmp	w1, 16
	bls	.L1041
.L1024:
	add	x1, x0, 112
	mov	w0, w20
	bl	SYNTAX_MarkImageEos
	cmn	w0, #1
	mov	w19, w0
	beq	.L1035
	cbz	w0, .L1036
	mov	w1, w0
	mov	w0, w20
	bl	VCTRL_ReportLastFrame
	ldr	x2, .LC667
	sub	w3, w19, #2
	mov	w1, 6332
	mov	w0, 3
	bl	dprint_normal
	mov	w0, w19
.L1022:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1041:
	ldr	x2, .LC661
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx1026
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx1026:
	.section	.rodata
	.align	0
	.align	2
.L1026:
	.byte	(.L1025 - .Lrtx1026) / 4
	.byte	(.L1027 - .Lrtx1026) / 4
	.byte	(.L1028 - .Lrtx1026) / 4
	.byte	(.L1029 - .Lrtx1026) / 4
	.byte	(.L1030 - .Lrtx1026) / 4
	.byte	(.L1024 - .Lrtx1026) / 4
	.byte	(.L1031 - .Lrtx1026) / 4
	.byte	(.L1024 - .Lrtx1026) / 4
	.byte	(.L1024 - .Lrtx1026) / 4
	.byte	(.L1024 - .Lrtx1026) / 4
	.byte	(.L1024 - .Lrtx1026) / 4
	.byte	(.L1024 - .Lrtx1026) / 4
	.byte	(.L1024 - .Lrtx1026) / 4
	.byte	(.L1024 - .Lrtx1026) / 4
	.byte	(.L1030 - .Lrtx1026) / 4
	.byte	(.L1032 - .Lrtx1026) / 4
	.byte	(.L1033 - .Lrtx1026) / 4
	.text
	.p2align 3
.L1036:
	mov	w0, w20
	mov	w1, 0
	bl	VCTRL_ReportLastFrame
	ldr	x2, .LC665
	mov	w1, 6327
	mov	w0, 3
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1035:
	mov	w0, w20
	mov	w1, 1
	bl	VCTRL_ReportLastFrame
	ldr	x2, .LC663
	mov	w1, 6322
	mov	w0, 3
	bl	dprint_normal
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1033:
	add	x0, x0, 120
	add	x19, x19, 64
	bl	HEVCDEC_FlushRemainImg
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	b	.L1024
	.p2align 3
.L1032:
	add	x0, x0, 120
	add	x19, x19, 64
	bl	MVC_DEC_FlushRemainImg
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	b	.L1024
	.p2align 3
.L1031:
	add	x0, x0, 120
	add	x19, x19, 64
	bl	AVSDEC_FlushRemainImg
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	b	.L1024
	.p2align 3
.L1030:
	add	x0, x0, 120
	add	x19, x19, 64
	bl	H263DEC_FlushRemainImg
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	b	.L1024
	.p2align 3
.L1029:
	add	x0, x0, 120
	add	x19, x19, 64
	bl	MPEG2DEC_FlushRemainImg
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	b	.L1024
	.p2align 3
.L1028:
	add	x0, x0, 120
	add	x19, x19, 64
	bl	MPEG4DEC_FlushRemainImg
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	b	.L1024
	.p2align 3
.L1027:
	add	x0, x0, 120
	add	x19, x19, 64
	bl	VC1DEC_FlushRemainImg
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	b	.L1024
	.p2align 3
.L1025:
	add	x0, x0, 120
	add	x19, x19, 64
	bl	H264DEC_FlushRemainImg
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 221184
	b	.L1024
	.p2align 3
.L1039:
	ldr	x3, .LC657
	mov	w4, 6232
	ldr	x5, .LC656
	mov	w1, w4
	ldr	x2, .LC658
	add	x3, x3, 3016
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1022
.L1040:
	ldr	x3, .LC657
	mov	w4, 6233
	ldr	x5, .LC660
	mov	w1, w4
	ldr	x2, .LC658
	add	x3, x3, 3016
	bl	dprint_normal
	mov	w0, -1
	b	.L1022
	.size	VCTRL_OutputLastFrame, .-VCTRL_OutputLastFrame
	.align	3
.LC656:
	.xword	.LC317
	.align	3
.LC657:
	.xword	.LANCHOR3
	.align	3
.LC658:
	.xword	.LC105
	.align	3
.LC659:
	.xword	.LANCHOR0
	.align	3
.LC660:
	.xword	.LC380
	.align	3
.LC661:
	.xword	.L1026
	.align	3
.LC663:
	.xword	.LC662
	.align	3
.LC665:
	.xword	.LC664
	.align	3
.LC667:
	.xword	.LC666
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
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	x22, x2
	mov	w23, w3
	bl	_mcount
	ldr	x21, .LC669
	add	x0, x21, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1065
	ldr	w1, [x0, 128]
	cmp	w1, 16
	bls	.L1066
.L1042:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1066:
	ldr	x2, .LC673
	ldrh	w1, [x2,w1,uxtw #1]
	adr	x2, .Lrtx1046
	add	x1, x2, w1, sxth #2
	br	x1
.Lrtx1046:
	.section	.rodata
	.align	0
	.align	2
.L1046:
	.2byte	(.L1045 - .Lrtx1046) / 4
	.2byte	(.L1047 - .Lrtx1046) / 4
	.2byte	(.L1048 - .Lrtx1046) / 4
	.2byte	(.L1049 - .Lrtx1046) / 4
	.2byte	(.L1050 - .Lrtx1046) / 4
	.2byte	(.L1042 - .Lrtx1046) / 4
	.2byte	(.L1051 - .Lrtx1046) / 4
	.2byte	(.L1042 - .Lrtx1046) / 4
	.2byte	(.L1042 - .Lrtx1046) / 4
	.2byte	(.L1042 - .Lrtx1046) / 4
	.2byte	(.L1052 - .Lrtx1046) / 4
	.2byte	(.L1052 - .Lrtx1046) / 4
	.2byte	(.L1052 - .Lrtx1046) / 4
	.2byte	(.L1053 - .Lrtx1046) / 4
	.2byte	(.L1050 - .Lrtx1046) / 4
	.2byte	(.L1054 - .Lrtx1046) / 4
	.2byte	(.L1055 - .Lrtx1046) / 4
	.text
	.p2align 3
.L1055:
	add	x0, x0, 221184
	mov	w1, w20
	add	x21, x21, 64
	mov	w5, w23
	mov	w4, 0
	mov	x3, x22
	mov	w2, 1
	add	x0, x0, 120
	bl	HEVCDEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 221184
	ldrb	w1, [x0, 129]
	cmp	w1, 1
	beq	.L1067
	str	xzr, [x0, 2600]
	b	.L1042
	.p2align 3
.L1054:
	add	x0, x0, 221184
	mov	w1, w20
	add	x21, x21, 64
	mov	w2, 1
	add	x0, x0, 120
	bl	MVC_DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 221184
	ldrb	w1, [x0, 121]
	cmp	w1, 1
	beq	.L1068
	str	xzr, [x0, 352]
	b	.L1042
	.p2align 3
.L1053:
	add	x0, x0, 221184
	mov	w1, w20
	add	x0, x0, 120
	add	x21, x21, 64
	bl	VP8DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 221184
	str	xzr, [x0, 128]
	b	.L1042
	.p2align 3
.L1052:
	add	x0, x0, 221184
	mov	w1, w20
	add	x0, x0, 120
	add	x21, x21, 64
	bl	VP6DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
.L1064:
	add	x0, x0, 221184
	str	xzr, [x0, 128]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1051:
	add	x0, x0, 221184
	mov	w1, w20
	add	x21, x21, 64
	add	x0, x0, 120
	bl	AVSDEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 221184
	ldrb	w1, [x0, 120]
	cmp	w1, 1
	beq	.L1069
	str	xzr, [x0, 144]
	b	.L1042
	.p2align 3
.L1050:
	add	x0, x0, 221184
	mov	w1, w20
	add	x21, x21, 64
	add	x0, x0, 120
	bl	H263DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 241664
	ldrb	w1, [x1, 2948]
	cmp	w1, 1
	beq	.L1070
.L1060:
	add	x0, x0, 221184
	str	xzr, [x0, 1160]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1049:
	add	x0, x0, 221184
	mov	w1, w20
	add	x21, x21, 64
	add	x0, x0, 120
	bl	MPEG2DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 221184
	ldrb	w1, [x0, 138]
	cmp	w1, 1
	beq	.L1071
	str	xzr, [x0, 160]
	b	.L1042
	.p2align 3
.L1048:
	add	x0, x0, 221184
	mov	w1, w20
	add	x21, x21, 64
	mov	x2, x22
	add	x0, x0, 120
	bl	MPEG4DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 241664
	ldrb	w1, [x1, 2924]
	cmp	w1, 1
	bne	.L1060
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 241664
	strb	wzr, [x1, 2924]
	b	.L1060
	.p2align 3
.L1047:
	add	x0, x0, 221184
	mov	w1, w20
	add	x21, x21, 64
	add	x0, x0, 120
	bl	VC1DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 233472
	ldrb	w1, [x1, 2560]
	cmp	w1, 1
	bne	.L1064
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 233472
	strb	wzr, [x1, 2560]
	b	.L1064
	.p2align 3
.L1045:
	add	x0, x0, 221184
	mov	w1, w20
	add	x21, x21, 64
	mov	w5, w23
	mov	w4, 0
	mov	x3, x22
	mov	w2, 1
	add	x0, x0, 120
	bl	H264DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 233472
	ldrb	w1, [x1, 2760]
	cmp	w1, 1
	beq	.L1072
.L1056:
	add	x0, x0, 221184
	str	xzr, [x0, 736]
	b	.L1042
	.p2align 3
.L1071:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 221184
	strb	wzr, [x0, 138]
	str	xzr, [x0, 160]
	b	.L1042
	.p2align 3
.L1069:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 221184
	strb	wzr, [x0, 120]
	str	xzr, [x0, 144]
	b	.L1042
	.p2align 3
.L1068:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 221184
	strb	wzr, [x0, 121]
	str	xzr, [x0, 352]
	b	.L1042
	.p2align 3
.L1067:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 221184
	strb	wzr, [x0, 129]
	str	xzr, [x0, 2600]
	b	.L1042
	.p2align 3
.L1065:
	ldr	x3, .LC671
	mov	w4, 3750
	ldr	x5, .LC670
	mov	w1, w4
	ldr	x2, .LC672
	add	x3, x3, 3040
	bl	dprint_normal
	b	.L1042
	.p2align 3
.L1070:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 241664
	strb	wzr, [x1, 2948]
	b	.L1060
	.p2align 3
.L1072:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 233472
	strb	wzr, [x1, 2760]
	b	.L1056
	.size	VCTRL_PostProc, .-VCTRL_PostProc
	.align	3
.LC669:
	.xword	.LANCHOR0
	.align	3
.LC670:
	.xword	.LC119
	.align	3
.LC671:
	.xword	.LANCHOR3
	.align	3
.LC672:
	.xword	.LC105
	.align	3
.LC673:
	.xword	.L1046
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
	bhi	.L1082
	ldr	x0, .LC678
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1083
	ldr	w0, [x0, 20]
	cmp	w0, 1
	beq	.L1077
	ldr	x3, .LC676
	mov	w4, 4000
	ldr	x5, .LC680
.L1081:
	ldr	x2, .LC677
	add	x3, x3, 3056
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L1073:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1077:
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbz	x0, .L1073
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
.L1082:
	ldr	x3, .LC676
	mov	w4, 3998
	ldr	x5, .LC675
	b	.L1081
	.p2align 3
.L1083:
	ldr	x3, .LC676
	mov	w4, 3999
	ldr	x5, .LC679
	mov	w1, w4
	ldr	x2, .LC677
	add	x3, x3, 3056
	bl	dprint_normal
	b	.L1073
	.size	VCTRL_VdmPostProc, .-VCTRL_VdmPostProc
	.align	3
.LC675:
	.xword	.LC103
	.align	3
.LC676:
	.xword	.LANCHOR3
	.align	3
.LC677:
	.xword	.LC105
	.align	3
.LC678:
	.xword	.LANCHOR0
	.align	3
.LC679:
	.xword	.LC119
	.align	3
.LC680:
	.xword	.LC463
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
	bhi	.L1103
	ldr	x0, .LC686
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1104
	ldr	w1, [x0, 16]
	cmp	w1, 1
	beq	.L1089
	ldr	x3, .LC684
	mov	w4, 6528
	ldr	x5, .LC690
.L1102:
	ldr	x2, .LC685
	add	x3, x3, 3080
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L1085:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1089:
	add	x1, x29, 48
	ldr	w19, [x0, 128]
	mov	w0, 3
	str	w19, [x1, -4]!
	bl	PDT_GetAttribute
	cbnz	w0, .L1085
	add	x0, x29, 36
	add	x1, x29, 40
	bl	VCTRL_GetActiveChanNum
	ldr	w0, [x29, 36]
	cbz	w0, .L1105
.L1091:
	ldr	w0, [x29, 40]
	cmp	w0, wzr
	ccmp	w19, 1, 0, eq
	bne	.L1085
	ldr	x0, .LC691
	ldr	x1, [x0, 56]
	cbz	x1, .L1085
	mov	w0, 0
	blr	x1
	b	.L1085
	.p2align 3
.L1103:
	ldr	x3, .LC684
	mov	w4, 6524
	ldr	x5, .LC683
	b	.L1102
	.p2align 3
.L1104:
	ldr	x3, .LC684
	mov	w4, 6527
	ldr	x5, .LC688
	mov	w1, w4
	ldr	x2, .LC685
	add	x3, x3, 3080
	bl	dprint_normal
	b	.L1085
	.p2align 3
.L1105:
	ldr	x20, .LC691
	ldr	x1, [x20, 8]
	cbz	x1, .L1106
	mov	w0, 0
	blr	x1
.L1093:
	ldr	x1, [x20, 40]
	cbz	x1, .L1107
	mov	w0, 0
	blr	x1
	b	.L1091
.L1106:
	mov	w3, 6402
	ldr	x2, .LC692
	mov	w1, w3
	bl	dprint_normal
	b	.L1093
.L1107:
	mov	w3, 6449
	ldr	x2, .LC692
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	b	.L1091
	.size	VCTRL_OpenHardware, .-VCTRL_OpenHardware
	.align	3
.LC683:
	.xword	.LC682
	.align	3
.LC684:
	.xword	.LANCHOR3
	.align	3
.LC685:
	.xword	.LC105
	.align	3
.LC686:
	.xword	.LANCHOR0
	.align	3
.LC688:
	.xword	.LC687
	.align	3
.LC690:
	.xword	.LC689
	.align	3
.LC691:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC692:
	.xword	.LC219
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
	bhi	.L1120
	ldr	x20, .LC697
	add	x22, x20, 64
	ldr	x0, [x22, w19, sxtw 3]
	cbz	x0, .L1121
	ldr	w21, [x0, 16]
	cmp	w21, 1
	bne	.L1122
	ldr	w0, [x0, 128]
	cmp	w0, 22
	beq	.L1123
	mov	w0, w19
	bl	SM_Start
	ldr	x0, [x22, w19, sxtw 3]
	str	w21, [x0, 24]
	str	wzr, [x0, 32]
	str	w21, [x0, 124]
	ldr	x0, [x22, w19, sxtw 3]
	ldr	w1, [x0, 28]
	cbnz	w1, .L1114
	ldr	x4, .LC702
	mov	x3, x20
	str	w21, [x0, 28]
	mov	x0, 0
.L1117:
	add	x1, x20, 64
	add	x2, x3, 1016
	ldr	x1, [x1, x0, lsl 3]
	cbz	x1, .L1115
	ldr	w1, [x1, 28]
	str	w1, [x2, x0, lsl 2]
	str	w1, [x4, x0, lsl 2]
.L1116:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L1117
	add	x0, x20, 1016
	bl	VDMDRV_SetPriority
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
.L1114:
	mov	w0, w19
	add	x20, x20, 64
	bl	VDMDRV_ClearChanIsDec
	mov	w0, w19
	bl	VCTRL_OpenHardware
	ldr	x21, .LC703
	ldr	x0, .LC704
	mov	x2, 12
	mov	w1, 0
	ldr	x3, [x21, 96]
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 720
	ldr	x0, .LC705
	mov	w1, 0
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 2
	ldr	x0, .LC706
	mov	w1, 0
	blr	x3
	ldr	x0, .LC707
	mov	x2, 120
	ldr	x3, [x21, 96]
	mov	w1, 0
	blr	x3
	ldr	x1, [x20, w19, sxtw 3]
	mov	w2, 1
	mov	w0, 0
	str	w2, [x1, 20]
.L1110:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1115:
	add	x1, x3, 1016
	str	wzr, [x4, x0, lsl 2]
	str	wzr, [x1, x0, lsl 2]
	b	.L1116
	.p2align 3
.L1122:
	ldr	x3, .LC695
	mov	w4, 2274
	ldr	x5, .LC699
.L1119:
	ldr	x2, .LC696
	add	x3, x3, 3104
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1110
.L1120:
	ldr	x3, .LC695
	mov	w4, 2272
	ldr	x5, .LC694
	b	.L1119
.L1123:
	ldr	x3, .LC695
	mov	w4, 2275
	ldr	x5, .LC701
	b	.L1119
.L1121:
	ldr	x3, .LC695
	mov	w4, 2273
	ldr	x5, .LC698
	mov	w1, w4
	ldr	x2, .LC696
	add	x3, x3, 3104
	bl	dprint_normal
	mov	w0, -1
	b	.L1110
	.size	VCTRL_StartChan, .-VCTRL_StartChan
	.align	3
.LC694:
	.xword	.LC103
	.align	3
.LC695:
	.xword	.LANCHOR3
	.align	3
.LC696:
	.xword	.LC105
	.align	3
.LC697:
	.xword	.LANCHOR0
	.align	3
.LC698:
	.xword	.LC289
	.align	3
.LC699:
	.xword	.LC481
	.align	3
.LC701:
	.xword	.LC700
	.align	3
.LC702:
	.xword	g_ChanCtx
	.align	3
.LC703:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC704:
	.xword	g_TimeRecId
	.align	3
.LC705:
	.xword	g_TimeRecTable
	.align	3
.LC706:
	.xword	g_DataRecId
	.align	3
.LC707:
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
	ldr	x2, .LC711
	mov	w3, w19
	mov	w1, 5793
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestStartChan, .-VfmwProc_TestStartChan
	.align	3
.LC711:
	.xword	.LC710
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
	bhi	.L1137
	ldr	x0, .LC715
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1138
	ldr	w1, [x0, 16]
	cmp	w1, 1
	beq	.L1129
	ldr	x3, .LC713
	mov	w4, 6570
	ldr	x5, .LC717
.L1136:
	ldr	x2, .LC714
	add	x3, x3, 3120
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
.L1125:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1129:
	add	x1, x29, 48
	ldr	w20, [x0, 128]
	mov	w0, 3
	str	w20, [x1, -4]!
	bl	PDT_GetAttribute
	cbnz	w0, .L1125
	add	x0, x29, 36
	add	x1, x29, 40
	bl	VCTRL_GetActiveChanNum
	ldr	w0, [x29, 36]
	cbz	w0, .L1139
.L1131:
	ldr	w0, [x29, 40]
	cmp	w0, wzr
	ccmp	w20, 1, 0, eq
	bne	.L1125
	ldr	x0, .LC718
	ldr	x1, [x0, 64]
	cbz	x1, .L1125
	mov	w0, 0
	blr	x1
	b	.L1125
	.p2align 3
.L1137:
	ldr	x3, .LC713
	mov	w4, 6566
	ldr	x5, .LC712
	b	.L1136
	.p2align 3
.L1138:
	ldr	x3, .LC713
	mov	w4, 6569
	ldr	x5, .LC716
	mov	w1, w4
	ldr	x2, .LC714
	add	x3, x3, 3120
	bl	dprint_normal
	b	.L1125
	.p2align 3
.L1139:
	mov	w0, w19
	bl	SCDDRV_ResetSCD
	mov	w0, w19
	bl	VDMDRV_ResetVDH
	b	.L1131
	.size	VCTRL_CloseHardware, .-VCTRL_CloseHardware
	.align	3
.LC712:
	.xword	.LC682
	.align	3
.LC713:
	.xword	.LANCHOR3
	.align	3
.LC714:
	.xword	.LC105
	.align	3
.LC715:
	.xword	.LANCHOR0
	.align	3
.LC716:
	.xword	.LC687
	.align	3
.LC717:
	.xword	.LC689
	.align	3
.LC718:
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
	bhi	.L1146
	ldr	x20, .LC723
	add	x20, x20, 64
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1147
	ldr	w1, [x0, 16]
	cmp	w1, 1
	bne	.L1145
	str	wzr, [x0, 20]
	str	w1, [x0, 32]
	mov	w0, w19
	bl	SM_Stop
	cbnz	w0, .L1145
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
.L1142:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1145:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1146:
	ldr	x3, .LC721
	mov	w4, 2357
	ldr	x5, .LC720
	mov	w1, w4
	ldr	x2, .LC722
	add	x3, x3, 3144
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1142
.L1147:
	ldr	x3, .LC721
	mov	w4, 2358
	ldr	x5, .LC725
	mov	w1, w4
	ldr	x2, .LC722
	add	x3, x3, 3144
	bl	dprint_normal
	mov	w0, -1
	b	.L1142
	.size	VCTRL_StopChan, .-VCTRL_StopChan
	.align	3
.LC720:
	.xword	.LC103
	.align	3
.LC721:
	.xword	.LANCHOR3
	.align	3
.LC722:
	.xword	.LC105
	.align	3
.LC723:
	.xword	.LANCHOR0
	.align	3
.LC725:
	.xword	.LC724
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
	ldr	x19, .LC727
	b	.L1150
	.p2align 3
.L1154:
	ldr	x1, [x19, 240]
	mov	w0, 10
	add	w20, w20, 1
	blr	x1
	cmp	w20, 50
	beq	.L1152
.L1150:
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
	mov	w0, w22
	bl	VCTRL_StopChan
	mov	w21, w0
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	cbnz	w21, .L1154
	cmp	w20, 49
	bgt	.L1152
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1152:
	ldr	x2, .LC729
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
.LC727:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC729:
	.xword	.LC728
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ResetChanWithOption
	.type	VCTRL_ResetChanWithOption, %function
VCTRL_ResetChanWithOption:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	sxtw	x19, w0
	mov	x0, x30
	mov	x24, x1
	bl	_mcount
	ldr	x20, .LC730
	ldr	x0, [x20]
	blr	x0
	mov	w22, w0
	cmp	w19, 3
	bhi	.L1176
	ldr	x21, .LC734
	add	x26, x21, 64
	ldr	x0, [x26, w19, sxtw 3]
	cbz	x0, .L1177
	ldr	x23, .LC732
	mov	w4, 2966
	ldr	x2, .LC737
	mov	w1, w4
	add	x3, x23, 3160
	mov	w0, 26
	bl	dprint_normal
	ldr	x1, [x26, w19, sxtw 3]
	mov	w0, w19
	ldr	w25, [x1, 20]
	bl	VCTRL_StopChan
	ldr	x1, [x20, 24]
	mov	w0, 4
	blr	x1
	ldr	x1, [x26, w19, sxtw 3]
	cbz	x1, .L1178
	add	x1, x1, 221184
	mov	w0, w19
	add	x1, x1, 112
	bl	SYNTAX_MarkImageOutHanging
.L1160:
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
	cbz	w0, .L1179
.L1161:
	ldr	w0, [x21, 20]
	cbnz	w0, .L1180
.L1162:
	cbnz	w25, .L1181
.L1166:
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	mov	w4, 3019
	ldr	x2, .LC740
	mov	w1, w4
	add	x3, x23, 3160
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
.L1157:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1180:
	add	x24, x21, 432
	str	w19, [x29, 92]
	ldr	x0, [x24, w19, sxtw 3]
	cbz	x0, .L1162
	mov	w0, 512
	add	x1, x29, 92
	bl	VCTRL_SetDbgOption
	ldr	x0, [x24, w19, sxtw 3]
	cbz	x0, .L1162
	add	x1, x29, 92
	mov	w0, 512
	bl	VCTRL_SetDbgOption
	cbz	w25, .L1166
.L1181:
	mov	w0, w19
	bl	VCTRL_StartChan
	b	.L1166
	.p2align 3
.L1179:
	mov	w0, w19
	bl	SM_Reset
	b	.L1161
	.p2align 3
.L1178:
	mov	w4, 2916
	ldr	x5, .LC738
	ldr	x2, .LC733
	add	x3, x23, 3192
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	b	.L1160
	.p2align 3
.L1176:
	ldr	x3, .LC732
	mov	w4, 2963
	ldr	x5, .LC731
	mov	w1, w4
	ldr	x2, .LC733
	add	x3, x3, 3160
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1157
.L1177:
	ldr	x3, .LC732
	mov	w4, 2964
	ldr	x5, .LC735
	mov	w1, w4
	ldr	x2, .LC733
	add	x3, x3, 3160
	bl	dprint_normal
	mov	w0, -1
	b	.L1157
	.size	VCTRL_ResetChanWithOption, .-VCTRL_ResetChanWithOption
	.align	3
.LC730:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC731:
	.xword	.LC375
	.align	3
.LC732:
	.xword	.LANCHOR3
	.align	3
.LC733:
	.xword	.LC105
	.align	3
.LC734:
	.xword	.LANCHOR0
	.align	3
.LC735:
	.xword	.LC380
	.align	3
.LC737:
	.xword	.LC736
	.align	3
.LC738:
	.xword	.LC119
	.align	3
.LC740:
	.xword	.LC739
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
	ldr	x3, .LC743
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
.LC743:
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
	stp	x27, x28, [sp, 80]
	mov	w24, w0
	mov	x0, x30
	mov	x20, x1
	mov	w19, w2
	bl	_mcount
	ldr	x21, .LC744
	ldr	x0, [x21]
	blr	x0
	mov	w27, w0
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
	cbz	x20, .L1255
	ldr	w0, [x20, 28]
	tbnz	w0, #31, .L1186
	ldr	w1, [x20, 44]
	mov	w0, 262143
	cmp	w1, w0
	ble	.L1186
	ldr	w0, [x20, 36]
	cmp	w0, 1
	beq	.L1256
.L1187:
	ldr	w0, [x20, 160]
	cmp	w0, 1
	bls	.L1220
	str	wzr, [x20, 160]
.L1220:
	mov	w23, 52288
	mov	w0, 51600
	movk	w0, 0x7, lsl 16
	cmp	w24, 25
	movk	w23, 0xb0, lsl 16
	mov	w3, w19
	csel	w23, w23, w0, eq
	add	x2, x29, 120
	mov	x1, x20
	mov	w0, w24
	stp	wzr, wzr, [x20, 172]
	bl	VCTRL_GetChanMemSize
	cbnz	w0, .L1257
	ldr	x25, .LC751
	add	x0, x25, 64
	ldr	x1, [x25, 64]
	cbz	x1, .L1258
	ldr	x1, [x0, 8]
	cbz	x1, .L1230
	ldr	x1, [x0, 16]
	cbz	x1, .L1231
	ldr	x0, [x0, 24]
	cbz	x0, .L1232
	ldr	x2, .LC753
	mov	w3, 4
	mov	w1, 2047
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
.L1248:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
	.p2align 3
.L1256:
	ldr	w0, [x20, 20]
	cmp	w0, wzr
	ble	.L1186
	ldr	w0, [x20, 24]
	cmp	w0, wzr
	bgt	.L1187
	.p2align 2
.L1186:
	ldr	x3, .LC747
	mov	w1, 1777
	ldr	x2, .LC748
	mov	w0, 1
	add	x3, x3, 3224
	bl	dprint_normal
.L1185:
	mov	w0, -1
	b	.L1248
	.p2align 3
.L1258:
	mov	w22, 0
	mov	w26, 0
.L1221:
	ldr	x0, [x21]
	add	x19, x20, 64
	blr	x0
	ldr	x3, [x21, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 136
	blr	x3
	ldr	x0, [x19, 56]
	cbz	x0, .L1192
	ldr	w0, [x19, 64]
	cbnz	w0, .L1193
.L1192:
	mov	w0, 7
	str	wzr, [x29, 164]
	bl	VFMW_GetString
	ldr	w2, [x29, 128]
	mov	w4, 1
	add	x3, x29, 136
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1259
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
.L1196:
	ldr	x3, [x21, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 136
	blr	x3
	ldr	x0, [x19, 8]
	cbz	x0, .L1226
	ldr	w0, [x19, 16]
	cbnz	w0, .L1198
.L1226:
	ldr	w0, [x20, 160]
	cmp	w0, 1
	beq	.L1199
	mov	w0, 8
	str	wzr, [x29, 164]
	bl	VFMW_GetString
	ldr	w2, [x29, 120]
	mov	w4, 0
	add	x3, x29, 136
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1260
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
.L1203:
	ldr	x3, [x21, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 136
	blr	x3
	ldr	x0, [x19, 32]
	cbz	x0, .L1228
	ldr	w0, [x19, 40]
	cbnz	w0, .L1207
.L1228:
	mov	w0, 9
	str	wzr, [x29, 164]
	bl	VFMW_GetString
	ldr	w2, [x29, 124]
	add	x3, x29, 136
	mov	w4, 0
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1261
	ldr	w0, [x29, 152]
	ldr	w2, [x29, 160]
	ldr	x1, [x29, 144]
	bl	MEM_AddMemRecord
	ldr	w0, [x29, 152]
	str	w0, [x29, 232]
	ldr	x0, [x29, 144]
	str	x0, [x29, 240]
	ldr	w0, [x29, 160]
	str	w0, [x29, 248]
	mov	w0, 1
	str	w0, [x29, 108]
.L1249:
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
	add	x28, x19, 217088
	str	x19, [x0, w22, sxtw 3]
	sub	w0, w23, #204800
	sub	w0, w0, #1544
	cmp	w0, w2
	csel	w2, w0, w2, ls
	mov	x0, x19
	blr	x3
	ldr	x3, [x21, 104]
	mov	x1, x20
	mov	x2, 184
	add	x0, x28, 3984
	blr	x3
	str	w23, [x28, 3884]
	str	w24, [x19, 148]
	add	x1, x19, 221184
	str	w24, [x28, 3304]
	sxtw	x24, w22
	str	wzr, [x28, 3916]
	str	w22, [x19, 4]
	ldr	x2, .LC766
	ldr	w0, [x20]
	str	w0, [x19, 144]
	mov	w0, 22
	str	w0, [x19, 128]
	str	w0, [x1, 112]
	str	wzr, [x19, 36]
	ldr	w0, [x20, 180]
	str	w0, [x19, 84]
	add	x0, x19, 24576
	add	x0, x0, 2344
	ldr	w1, [x20, 172]
	str	w1, [x0, 76]
	lsl	x1, x24, 4
	str	x0, [x2, x1]
	ldr	w1, [x20, 176]
	str	w1, [x0, 80]
	add	x1, x19, 280
	mov	w0, w22
	bl	FSP_EnableInstance
	cbnz	w0, .L1262
	mov	w0, w22
	bl	VCTRL_ResetChan
	ldr	w0, [x29, 104]
	str	w0, [x19, 152]
	ldr	w0, [x29, 108]
	str	w0, [x19, 156]
	ldr	w0, [x29, 112]
	str	w0, [x19, 160]
	ldr	w5, [x29, 248]
	ldr	w0, [x20, 160]
	ldr	w1, [x29, 232]
	str	w0, [x19, 56]
	sub	w0, w5, #32768
	sub	w0, w0, #16
	add	w4, w1, 1039
	add	w4, w4, w0
	str	w5, [x19, 272]
	and	w4, w4, -1024
	add	w5, w1, w5
	stp	w0, w4, [x19, 168]
	ldr	w0, [x29, 256]
	add	w4, w4, 32768
	str	w0, [x19, 200]
	cmp	w4, w5
	ldr	x0, [x29, 264]
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
	str	x0, [x19, 256]
	mov	w0, 32768
	str	w1, [x19, 164]
	str	w1, [x19, 264]
	str	w0, [x19, 176]
	bhi	.L1263
	add	x1, x19, 208896
	str	w22, [x19, 4]
	stp	w22, w22, [x19, 44]
	mov	w0, w22
	sxtw	x23, w23
	str	w22, [x1, 2584]
	sub	x23, x23, #200704
	sub	x23, x23, #3592
	uxth	x26, w26
	bl	SM_ClearInst
	add	x25, x25, 560
	ldr	x1, [x19, 192]
	mov	w0, w22
	add	x1, x1, x23
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
	lsl	x0, x24, 2
	ldr	x3, [x21, 96]
	sub	x0, x0, x24
	mov	x2, 100
	lsl	x1, x0, 5
	sub	w27, w19, w27
	add	x0, x0, x1
	mov	w1, 0
	add	x24, x0, x24
	add	x24, x25, x24
	mov	x0, x24
	blr	x3
	stp	w27, wzr, [x24, 44]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
	.p2align 3
.L1199:
	str	wzr, [x29, 104]
	str	wzr, [x29, 208]
	str	xzr, [x29, 216]
	str	wzr, [x29, 224]
	b	.L1203
	.p2align 3
.L1193:
	ldr	x3, [x21, 104]
	mov	x2, 24
	add	x1, x20, 112
	add	x0, x29, 256
	blr	x3
	ldr	w0, [x29, 128]
	ldr	w2, [x29, 272]
	cmp	w2, w0
	blt	.L1264
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_AddMemRecord
	b	.L1196
	.p2align 3
.L1207:
	ldr	x3, [x21, 104]
	add	x1, x20, 88
	add	x0, x29, 232
	mov	x2, 24
	blr	x3
	ldr	x1, [x29, 240]
	cbz	x1, .L1212
	ldr	w0, [x29, 124]
	ldr	w2, [x29, 248]
	cmp	w2, w0
	blt	.L1212
	ldr	w0, [x29, 232]
	bl	MEM_AddMemRecord
	b	.L1249
	.p2align 3
.L1198:
	ldr	x3, [x21, 104]
	mov	x2, 24
	mov	x1, x19
	add	x0, x29, 208
	blr	x3
	ldr	w0, [x20, 160]
	ldr	w4, [x29, 224]
	cmp	w0, 1
	beq	.L1205
	ldr	w5, [x29, 120]
	cmp	w4, w5
	blt	.L1265
.L1205:
	ldr	w0, [x29, 208]
	mov	w2, w4
	ldr	x1, [x29, 216]
	bl	MEM_AddMemRecord
	b	.L1203
	.p2align 3
.L1261:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L1266
.L1209:
	ldr	w0, [x29, 104]
	cmp	w0, 1
	beq	.L1267
.L1210:
	mov	w3, 1817
	ldr	x2, .LC763
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1248
	.p2align 3
.L1260:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L1268
.L1201:
	mov	w3, 1881
	ldr	x2, .LC759
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1248
	.p2align 3
.L1262:
	ldr	x2, .LC768
	mov	w3, w22
	mov	w1, 2086
	mov	w0, 1
	bl	dprint_normal
.L1217:
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
	b	.L1248
	.p2align 3
.L1263:
	ldr	x2, .LC770
	mov	w3, w22
	mov	w1, 2118
	mov	w0, 1
	bl	dprint_normal
	b	.L1217
	.p2align 3
.L1230:
	mov	w22, 1
	mov	w26, w22
	b	.L1221
	.p2align 3
.L1231:
	mov	w22, 2
	mov	w26, w22
	b	.L1221
	.p2align 3
.L1232:
	mov	w22, 3
	mov	w26, w22
	b	.L1221
	.p2align 3
.L1259:
	mov	w3, 1938
	ldr	x2, .LC755
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	b	.L1185
	.p2align 3
.L1212:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L1269
.L1214:
	ldr	w0, [x29, 104]
	cmp	w0, 1
	beq	.L1270
.L1215:
	mov	w3, 1845
	ldr	x2, .LC765
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	b	.L1185
	.p2align 3
.L1257:
	mov	w3, 2033
	ldr	x2, .LC750
	mov	w1, w3
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1248
	.p2align 3
.L1267:
	ldr	w0, [x29, 208]
	ldr	x1, [x29, 216]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 208]
	ldr	w2, [x29, 224]
	ldr	x1, [x29, 216]
	bl	MEM_DelMemRecord
	b	.L1210
.L1266:
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 256]
	ldr	w2, [x29, 272]
	ldr	x1, [x29, 264]
	bl	MEM_DelMemRecord
	b	.L1209
.L1268:
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 256]
	ldr	w2, [x29, 272]
	ldr	x1, [x29, 264]
	bl	MEM_DelMemRecord
	b	.L1201
.L1264:
	mov	w3, 1954
	ldr	x2, .LC757
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	b	.L1185
.L1265:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L1271
.L1206:
	mov	w3, 1912
	ldr	x2, .LC761
	mov	w1, w3
	mov	w0, 1
	bl	dprint_normal
	b	.L1185
.L1270:
	ldr	w0, [x29, 208]
	ldr	x1, [x29, 216]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 208]
	ldr	w2, [x29, 224]
	ldr	x1, [x29, 216]
	bl	MEM_DelMemRecord
	b	.L1215
.L1269:
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 256]
	ldr	w2, [x29, 272]
	ldr	x1, [x29, 264]
	bl	MEM_DelMemRecord
	b	.L1214
.L1255:
	ldr	x2, .LC746
	mov	w1, 1757
	mov	w0, 0
	bl	dprint_normal
	b	.L1185
.L1271:
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 256]
	ldr	w2, [x29, 272]
	ldr	x1, [x29, 264]
	bl	MEM_DelMemRecord
	ldr	w5, [x29, 120]
	ldr	w4, [x29, 224]
	b	.L1206
	.size	VCTRL_CreateChan, .-VCTRL_CreateChan
	.align	3
.LC744:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC746:
	.xword	.LC745
	.align	3
.LC747:
	.xword	.LANCHOR3
	.align	3
.LC748:
	.xword	.LC505
	.align	3
.LC750:
	.xword	.LC749
	.align	3
.LC751:
	.xword	.LANCHOR0
	.align	3
.LC753:
	.xword	.LC752
	.align	3
.LC755:
	.xword	.LC754
	.align	3
.LC757:
	.xword	.LC756
	.align	3
.LC759:
	.xword	.LC758
	.align	3
.LC761:
	.xword	.LC760
	.align	3
.LC763:
	.xword	.LC762
	.align	3
.LC765:
	.xword	.LC764
	.align	3
.LC766:
	.xword	s_SmIIS
	.align	3
.LC768:
	.xword	.LC767
	.align	3
.LC770:
	.xword	.LC769
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
	bhi	.L1323
	ldr	x20, .LC776
	add	x0, x20, 64
	ldr	x0, [x0, w22, sxtw 3]
	cbz	x0, .L1324
	ldr	w0, [x0, 16]
	cmp	w0, 1
	bne	.L1325
	cbz	x19, .L1326
	add	x21, x20, 1032
	mov	w0, 0
	mov	x1, x21
	bl	PDT_GetAttribute
	ldr	w21, [x19, 8]
	ldr	w0, [x20, 1052]
	cmp	w0, 21
	bhi	.L1279
	cmp	w0, w21
	beq	.L1280
	add	x0, x20, 1056
	add	x2, x20, 1180
	.p2align 2
.L1282:
	ldr	w1, [x0]
	add	x0, x0, 4
	cmp	w1, 21
	bhi	.L1279
	cmp	w1, w21
	beq	.L1280
	cmp	x2, x0
	bne	.L1282
.L1280:
	mov	x1, x19
	mov	w0, w22
	bl	VCTRL_CmpConfigParameter
	cbz	w0, .L1327
	add	x24, x20, 64
	ldr	x23, .LC788
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
	beq	.L1328
	str	wzr, [x1, 120]
.L1284:
	ldr	w0, [x19, 88]
	cbz	w0, .L1285
	mov	w0, 1
	str	w0, [x29, 120]
.L1285:
	ldr	w1, [x19, 80]
	ldr	w0, [x19, 8]
	str	w1, [x29, 112]
	cbz	w0, .L1319
	cmp	w0, 16
	mov	w0, 0
	bne	.L1287
.L1319:
	ldr	w0, [x19, 52]
.L1287:
	str	w0, [x29, 108]
	mov	w1, 0
	mov	x0, 0
.L1289:
	add	x2, x20, 64
	ldr	x2, [x0, x2]
	add	x0, x0, 8
	cmp	x2, xzr
	csinc	w1, w1, w1, eq
	cmp	x0, 32
	bne	.L1289
	cmp	w1, 1
	ldr	x24, .LC789
	ble	.L1329
.L1290:
	str	wzr, [x29, 108]
.L1292:
	ldrsb	w0, [x19]
	cmp	w0, 1
	beq	.L1293
	ldr	w0, [x29, 108]
.L1294:
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
	beq	.L1330
.L1295:
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
	ble	.L1296
	ldr	w2, [x19, 108]
	cmp	w2, wzr
	ble	.L1296
	str	w1, [x0, 3176]
	ldr	w1, [x19, 108]
	str	w1, [x0, 3180]
.L1297:
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
	beq	.L1298
	mov	w0, w22
	bl	VCTRL_ResetChan
	ldr	w0, [x19, 8]
	cmp	w0, 20
	beq	.L1331
.L1320:
	ldr	x1, [x24, w22, sxtw 3]
	add	x0, x1, 221184
	ldr	w2, [x1, 128]
.L1298:
	add	x5, x1, 217088
	str	w2, [x0, 112]
	ldr	x4, .LC792
	mov	x3, x20
	mov	x0, 0
	ldrsb	w2, [x5, 3072]
	str	w2, [x1, 288]
.L1303:
	add	x1, x20, 64
	add	x2, x3, 1184
	ldr	x1, [x1, x0, lsl 3]
	cbz	x1, .L1301
	ldr	w1, [x1, 28]
	str	w1, [x2, x0, lsl 2]
	str	w1, [x4, x0, lsl 2]
.L1302:
	add	x0, x0, 1
	cmp	x0, 4
	bne	.L1303
	add	x0, x20, 1184
	bl	VDMDRV_SetPriority
	mov	w0, w22
	bl	VDMDRV_ClearChanIsDec
	mov	w0, 0
.L1316:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1327:
	ldr	x3, .LC774
	mov	w1, 2680
	ldr	x2, .LC787
	add	x3, x3, 3248
	bl	dprint_normal
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1301:
	add	x1, x3, 1184
	str	wzr, [x4, x0, lsl 2]
	str	wzr, [x1, x0, lsl 2]
	b	.L1302
	.p2align 3
.L1279:
	ldr	x2, .LC783
	mov	w3, w21
	mov	w1, 2476
	mov	w0, 0
	bl	dprint_normal
	ldr	x3, .LC774
	mov	w1, 2672
	ldr	x2, .LC785
	mov	w0, 0
	add	x3, x3, 3248
	bl	dprint_normal
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1296:
	mov	w2, 1920
	mov	w1, 1088
	str	w2, [x0, 3176]
	str	w1, [x0, 3180]
	b	.L1297
	.p2align 3
.L1293:
	mov	w0, 0
	str	wzr, [x29, 108]
	b	.L1294
	.p2align 3
.L1328:
	ldp	w4, w3, [x19, 92]
	ldr	w0, [x19, 136]
	str	w0, [x1, 120]
	str	w2, [x29, 116]
	stp	w4, w3, [x29, 124]
	b	.L1284
	.p2align 3
.L1329:
	ldr	w0, [x24, 84]
	cbz	w0, .L1290
	cmp	w0, 1
	bne	.L1292
	str	w0, [x29, 108]
	b	.L1292
	.p2align 3
.L1330:
	ldr	w2, [x19, 40]
	b	.L1295
.L1331:
	mov	w2, 1088
	mov	w1, 1920
	mov	w0, w22
	bl	VCTRL_USERDEC_PartitionMem
	cbz	w0, .L1320
	ldr	x2, .LC791
	mov	w1, 2734
	mov	w0, 1
	bl	dprint_normal
	mov	w0, -1
	b	.L1316
	.p2align 3
.L1325:
	ldr	x3, .LC774
	mov	w4, 2663
	ldr	x5, .LC779
.L1321:
	ldr	x2, .LC775
	add	x3, x3, 3248
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1316
.L1323:
	ldr	x3, .LC774
	mov	w4, 2661
	ldr	x5, .LC773
	b	.L1321
.L1326:
	ldr	x3, .LC774
	mov	w4, 2664
	ldr	x5, .LC781
	b	.L1321
.L1324:
	ldr	x3, .LC774
	mov	w4, 2662
	ldr	x5, .LC777
	mov	w1, w4
	ldr	x2, .LC775
	add	x3, x3, 3248
	bl	dprint_normal
	mov	w0, -1
	b	.L1316
	.size	VCTRL_ConfigChan, .-VCTRL_ConfigChan
	.align	3
.LC773:
	.xword	.LC103
	.align	3
.LC774:
	.xword	.LANCHOR3
	.align	3
.LC775:
	.xword	.LC105
	.align	3
.LC776:
	.xword	.LANCHOR0
	.align	3
.LC777:
	.xword	.LC119
	.align	3
.LC779:
	.xword	.LC778
	.align	3
.LC781:
	.xword	.LC780
	.align	3
.LC783:
	.xword	.LC782
	.align	3
.LC785:
	.xword	.LC784
	.align	3
.LC787:
	.xword	.LC786
	.align	3
.LC788:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC789:
	.xword	.LANCHOR1
	.align	3
.LC791:
	.xword	.LC790
	.align	3
.LC792:
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
	ldr	x2, .LC798
	mov	w0, 32
	lsr	w20, w4, 24
	and	w19, w4, 16777215
	mov	w4, w19
	mov	w3, w20
	bl	dprint_normal
	ldr	x3, .LC799
	mov	w1, 0
	mov	x2, 156
	add	x0, x29, 32
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 32
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbz	w0, .L1335
	ldr	x2, .LC801
	mov	w3, w20
	mov	w1, 5240
	mov	w0, 32
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1335:
	add	x1, x29, 32
	mov	w0, w20
	str	w19, [x29, 164]
	bl	VCTRL_ConfigChan
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetUvmosEnable, .-VfmwProc_SetUvmosEnable
	.align	3
.LC798:
	.xword	.LC797
	.align	3
.LC799:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC801:
	.xword	.LC800
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
	ldr	x2, .LC803
	mov	w0, 32
	lsr	w20, w4, 24
	and	w19, w4, 16777215
	mov	w4, w19
	mov	w3, w20
	bl	dprint_normal
	ldr	x3, .LC804
	mov	w1, 0
	mov	x2, 156
	add	x0, x29, 32
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 32
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1336
	add	x1, x29, 32
	mov	w0, w20
	str	w19, [x29, 64]
	bl	VCTRL_ConfigChan
.L1336:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetDropStreamThreshold, .-VfmwProc_SetDropStreamThreshold
	.align	3
.LC803:
	.xword	.LC802
	.align	3
.LC804:
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
	ldr	x2, .LC806
	mov	w0, 32
	lsr	w20, w4, 24
	and	w19, w4, 7
	mov	w4, w19
	mov	w3, w20
	bl	dprint_normal
	ldr	x3, .LC807
	mov	w1, 0
	mov	x2, 156
	add	x0, x29, 32
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 32
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbz	w0, .L1341
	ldr	x2, .LC809
	mov	w3, w20
	mov	w1, 5304
	mov	w0, 32
	bl	dprint_normal
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1341:
	add	x1, x29, 32
	mov	w0, w20
	str	w19, [x29, 68]
	bl	VCTRL_ConfigChan
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetDecMode, .-VfmwProc_SetDecMode
	.align	3
.LC806:
	.xword	.LC805
	.align	3
.LC807:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC809:
	.xword	.LC808
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
	ldr	x2, .LC811
	mov	w0, 32
	lsr	w20, w4, 24
	and	w19, w4, 3
	mov	w4, w19
	mov	w3, w20
	bl	dprint_normal
	ldr	x3, .LC812
	mov	w1, 0
	mov	x2, 156
	add	x0, x29, 32
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 32
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1342
	add	x1, x29, 32
	mov	w0, w20
	str	w19, [x29, 72]
	bl	VCTRL_ConfigChan
.L1342:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetDecOrderOutput, .-VfmwProc_SetDecOrderOutput
	.align	3
.LC811:
	.xword	.LC810
	.align	3
.LC812:
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
	ldr	x2, .LC814
	mov	w0, 32
	lsr	w20, w4, 24
	and	w19, w4, 16777215
	mov	w4, w19
	mov	w3, w20
	bl	dprint_normal
	ldr	x3, .LC815
	mov	w1, 0
	mov	x2, 156
	add	x0, x29, 32
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 32
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1344
	add	x1, x29, 32
	mov	w0, w20
	str	w19, [x29, 60]
	bl	VCTRL_ConfigChan
.L1344:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetErrorThreshold, .-VfmwProc_SetErrorThreshold
	.align	3
.LC814:
	.xword	.LC813
	.align	3
.LC815:
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
	ldr	x2, .LC817
	mov	w3, w19
	mov	w1, 5781
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestResetChan, .-VfmwProc_TestResetChan
	.align	3
.LC817:
	.xword	.LC816
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
	ldr	x20, .LC818
	ldr	x0, [x20]
	blr	x0
	mov	w23, w0
	ldr	x1, [x20, 24]
	mov	w0, 0
	blr	x1
	cmp	w19, 3
	bhi	.L1358
	ldr	x22, .LC823
	add	x0, x22, 64
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L1359
	ldr	w21, [x1, 16]
	cmp	w21, 1
	bne	.L1360
	str	wzr, [x1, 20]
	mov	w0, 0
	ldr	x1, [x20, 32]
	blr	x1
	mov	w0, w19
	bl	SCDDRV_IsChanDec
	cbnz	w0, .L1361
.L1352:
	ldr	x1, [x20, 24]
	mov	w0, 0
	blr	x1
	ldr	x1, [x20, 24]
	mov	w0, 4
	blr	x1
	mov	w0, w19
	bl	VCTRL_StopChan
	ldr	x1, [x20, 32]
	cbnz	w0, .L1362
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
	ldr	x4, .LC828
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
.L1349:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L1361:
	mov	w0, w19
	ldr	x24, [x20, 264]
	bl	SCDDRV_IsChanDec
	cmp	w0, wzr
	mov	w2, 500
	cset	w1, eq
	mov	w0, w21
	blr	x24
	b	.L1352
	.p2align 3
.L1360:
	ldr	x3, .LC820
	mov	w4, 2196
	ldr	x5, .LC827
.L1357:
	ldr	x2, .LC822
	mov	w1, w4
	add	x3, x3, 3272
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
.L1362:
	mov	w0, 4
	blr	x1
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	mov	w0, -1
	b	.L1349
	.p2align 3
.L1358:
	ldr	x3, .LC820
	mov	w4, 2182
	ldr	x5, .LC819
	b	.L1357
.L1359:
	ldr	x3, .LC820
	mov	w4, 2189
	ldr	x5, .LC825
	b	.L1357
	.size	VCTRL_DestroyChan, .-VCTRL_DestroyChan
	.align	3
.LC818:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC819:
	.xword	.LC103
	.align	3
.LC820:
	.xword	.LANCHOR3
	.align	3
.LC822:
	.xword	.LC821
	.align	3
.LC823:
	.xword	.LANCHOR0
	.align	3
.LC825:
	.xword	.LC824
	.align	3
.LC827:
	.xword	.LC826
	.align	3
.LC828:
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
	ldr	x2, .LC832
	mov	w3, w19
	mov	w1, 5805
	mov	w0, 32
	bl	dprint_normal
	mov	w0, w19
	bl	VCTRL_ResetChan
	mov	w4, w0
	ldr	x2, .LC833
	mov	w3, w19
	mov	w1, 5807
	mov	w0, 32
	bl	dprint_normal
	mov	w0, w19
	bl	VCTRL_StartChan
	mov	w4, w0
	ldr	x2, .LC834
	mov	w3, w19
	mov	w1, 5809
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestRestartChan, .-VfmwProc_TestRestartChan
	.align	3
.LC832:
	.xword	.LC831
	.align	3
.LC833:
	.xword	.LC816
	.align	3
.LC834:
	.xword	.LC710
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
	ldr	x2, .LC835
	mov	w3, w19
	mov	w1, 5770
	mov	w0, 32
	bl	dprint_normal
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestStopChan, .-VfmwProc_TestStopChan
	.align	3
.LC835:
	.xword	.LC831
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
	ldr	x0, .LC836
	mov	w1, 1
	add	x0, x0, 1200
	str	w1, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_EnableEsBuf, .-VCTRL_EnableEsBuf
	.align	3
.LC836:
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
	ldr	x0, .LC838
	add	x0, x0, 1200
	str	wzr, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_DisableEsBuf, .-VCTRL_DisableEsBuf
	.align	3
.LC838:
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
	ldr	x0, .LC840
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
.LC840:
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
	ldr	x0, .LC842
	add	x0, x0, 1200
	ldr	w0, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_IfEsBufEnable, .-VCTRL_IfEsBufEnable
	.align	3
.LC842:
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
	ldr	x0, .LC844
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	ldr	x19, [sp, 16]
	add	x0, x0, 217088
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 3116]
	ret
	.size	VCTRL_GetChanCrcMode, .-VCTRL_GetChanCrcMode
	.align	3
.LC844:
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
	ldr	x0, .LC846
	add	x0, x0, 64
	ldr	x0, [x0, w20, sxtw 3]
	add	x0, x0, 221184
	str	w19, [x0, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetChanWaitFsFlag, .-VCTRL_SetChanWaitFsFlag
	.align	3
.LC846:
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
	bhi	.L1379
	ldr	x19, .LC851
	add	x19, x19, 64
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L1380
	cbz	x21, .L1381
	ldr	x4, [x21, 64]
	ldr	x5, [x0, 8]
	and	x0, x4, -4294901761
	cmp	x0, x5
	bne	.L1382
	mov	x1, x21
	mov	w0, w20
	bl	FSP_BindRequireFs
	mov	w21, w0
	cbz	w0, .L1383
.L1377:
	cmp	w21, wzr
	csetm	w0, ne
.L1373:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1383:
	ldr	x1, [x19, w20, sxtw 3]
	ldr	w1, [x1, 124]
	cmp	w1, 1
	bne	.L1377
	ldr	x1, .LC857
	ldr	x1, [x1, 256]
	blr	x1
	ldr	x0, [x19, w20, sxtw 3]
	str	wzr, [x0, 124]
	b	.L1377
	.p2align 3
.L1382:
	ldr	x3, .LC849
	mov	w1, 6654
	ldr	x2, .LC856
	mov	w0, 1
	add	x3, x3, 3296
	bl	dprint_normal
	mov	w0, -1
	b	.L1373
	.p2align 3
.L1379:
	ldr	x3, .LC849
	mov	w4, 6644
	ldr	x5, .LC848
.L1378:
	ldr	x2, .LC850
	add	x3, x3, 3296
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1373
.L1381:
	ldr	x3, .LC849
	mov	w4, 6646
	ldr	x5, .LC854
	b	.L1378
.L1380:
	ldr	x3, .LC849
	mov	w4, 6645
	ldr	x5, .LC852
	mov	w1, w4
	ldr	x2, .LC850
	add	x3, x3, 3296
	bl	dprint_normal
	mov	w0, -1
	b	.L1373
	.size	VCTRL_BindRequireMem, .-VCTRL_BindRequireMem
	.align	3
.LC848:
	.xword	.LC317
	.align	3
.LC849:
	.xword	.LANCHOR3
	.align	3
.LC850:
	.xword	.LC105
	.align	3
.LC851:
	.xword	.LANCHOR0
	.align	3
.LC852:
	.xword	.LC380
	.align	3
.LC854:
	.xword	.LC853
	.align	3
.LC856:
	.xword	.LC855
	.align	3
.LC857:
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
	bhi	.L1388
	ldr	x0, .LC862
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1389
	mov	w1, w20
	mov	w0, w19
	bl	FSP_SetFrameBufferMode
	cmp	w0, wzr
	csetm	w0, ne
.L1386:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1388:
	ldr	x3, .LC860
	mov	w4, 6676
	ldr	x5, .LC859
	mov	w1, w4
	ldr	x2, .LC861
	add	x3, x3, 3320
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1386
.L1389:
	ldr	x3, .LC860
	mov	w4, 6677
	ldr	x5, .LC863
	mov	w1, w4
	ldr	x2, .LC861
	add	x3, x3, 3320
	bl	dprint_normal
	mov	w0, -1
	b	.L1386
	.size	VCTRL_SetFrameBufferMode, .-VCTRL_SetFrameBufferMode
	.align	3
.LC859:
	.xword	.LC317
	.align	3
.LC860:
	.xword	.LANCHOR3
	.align	3
.LC861:
	.xword	.LC105
	.align	3
.LC862:
	.xword	.LANCHOR0
	.align	3
.LC863:
	.xword	.LC322
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
	bhi	.L1402
	ldr	x0, .LC868
	add	x0, x0, 64
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L1403
	cbz	x19, .L1404
	mov	w0, w20
	mov	x1, x19
	bl	FSP_BindExternFs
	mov	w20, w0
	cbz	w0, .L1405
.L1396:
	cmp	w20, wzr
	csetm	w0, ne
.L1392:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1405:
	ldr	w0, [x19, 32]
	add	x19, x19, 152
	ldr	w2, [x19, -96]
	ldr	x1, [x19, -112]
	bl	MEM_AddMemRecord
	ldr	w3, [x19, 32]
	cbz	w3, .L1396
	ldr	x0, [x19, 40]
	cbnz	x0, .L1396
	ldr	x2, .LC873
	mov	w1, 6705
	bl	dprint_normal
	b	.L1396
	.p2align 3
.L1402:
	ldr	x3, .LC866
	mov	w4, 6690
	ldr	x5, .LC865
.L1401:
	ldr	x2, .LC867
	add	x3, x3, 3352
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1392
.L1404:
	ldr	x3, .LC866
	mov	w4, 6692
	ldr	x5, .LC871
	b	.L1401
.L1403:
	ldr	x3, .LC866
	mov	w4, 6691
	ldr	x5, .LC869
	mov	w1, w4
	ldr	x2, .LC867
	add	x3, x3, 3352
	bl	dprint_normal
	mov	w0, -1
	b	.L1392
	.size	VCTRL_BindExternBuffer, .-VCTRL_BindExternBuffer
	.align	3
.LC865:
	.xword	.LC317
	.align	3
.LC866:
	.xword	.LANCHOR3
	.align	3
.LC867:
	.xword	.LC105
	.align	3
.LC868:
	.xword	.LANCHOR0
	.align	3
.LC869:
	.xword	.LC322
	.align	3
.LC871:
	.xword	.LC870
	.align	3
.LC873:
	.xword	.LC872
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
	bhi	.L1416
	ldr	x0, .LC878
	add	x0, x0, 64
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L1417
	cbz	x19, .L1418
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
	cbnz	w3, .L1419
.L1411:
	cmp	w20, wzr
	csetm	w0, ne
.L1408:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1419:
	ldr	x0, [x19, 40]
	cbnz	x0, .L1411
	ldr	x2, .LC881
	mov	w1, 6731
	bl	dprint_normal
	b	.L1411
	.p2align 3
.L1416:
	ldr	x3, .LC876
	mov	w4, 6718
	ldr	x5, .LC875
.L1415:
	ldr	x2, .LC877
	add	x3, x3, 3376
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1408
.L1418:
	ldr	x3, .LC876
	mov	w4, 6720
	ldr	x5, .LC880
	b	.L1415
.L1417:
	ldr	x3, .LC876
	mov	w4, 6719
	ldr	x5, .LC879
	mov	w1, w4
	ldr	x2, .LC877
	add	x3, x3, 3376
	bl	dprint_normal
	mov	w0, -1
	b	.L1408
	.size	VCTRL_UnBindExternBuffer, .-VCTRL_UnBindExternBuffer
	.align	3
.LC875:
	.xword	.LC317
	.align	3
.LC876:
	.xword	.LANCHOR3
	.align	3
.LC877:
	.xword	.LC105
	.align	3
.LC878:
	.xword	.LANCHOR0
	.align	3
.LC879:
	.xword	.LC322
	.align	3
.LC880:
	.xword	.LC870
	.align	3
.LC881:
	.xword	.LC872
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
	bhi	.L1423
	mov	w1, w20
	mov	w0, w19
	bl	FSP_SetDispFsNum
	cmp	w0, wzr
	csetm	w0, ne
.L1422:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1423:
	ldr	x3, .LC884
	mov	w4, 6741
	ldr	x5, .LC883
	mov	w1, w4
	ldr	x2, .LC885
	add	x3, x3, 3408
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1422
	.size	VCTRL_SetFrameBufferNum, .-VCTRL_SetFrameBufferNum
	.align	3
.LC883:
	.xword	.LC317
	.align	3
.LC884:
	.xword	.LANCHOR3
	.align	3
.LC885:
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
	ldr	x3, .LC886
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
.LC886:
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
	ldr	x0, .LC888
	add	x0, x0, 64
	ldr	x0, [x0, w19, sxtw 3]
	ldr	x19, [sp, 16]
	add	x0, x0, 217088
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 3172]
	ret
	.size	VCTRL_GetExtraFrameNum, .-VCTRL_GetExtraFrameNum
	.align	3
.LC888:
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
	bls	.L1428
	cmp	w19, wzr
	ldr	x19, [sp, 16]
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1428:
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
	bhi	.L1440
	ldr	x0, .LC893
	add	x0, x0, 64
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L1441
	mul	w0, w20, w21
	cmp	w0, 1023
	ble	.L1442
	add	x2, x1, 217088
	ldr	w3, [x2, 3176]
	cmp	w3, wzr
	ble	.L1434
	ldr	w4, [x2, 3180]
	cmp	w4, wzr
	ble	.L1434
	mul	w2, w3, w4
	cmp	w0, w2
	bgt	.L1443
.L1434:
	cmp	w0, 2088960
	mov	w0, 1
	ble	.L1431
	ldr	w3, [x1, 128]
	and	w1, w3, -3
	cmp	w1, 16
	beq	.L1431
	cmp	w3, 17
	ccmp	w3, wzr, 4, ne
	beq	.L1431
	ldr	x2, .LC900
	mov	w5, w21
	mov	w4, w20
	mov	w1, 6804
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
.L1431:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1440:
	ldr	x3, .LC891
	mov	w4, 6780
	ldr	x5, .LC890
.L1439:
	ldr	x2, .LC892
	add	x3, x3, 3432
	mov	w1, w4
	mov	w0, 0
	bl	dprint_normal
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1441:
	ldr	x3, .LC891
	mov	w4, 6781
	ldr	x5, .LC894
	b	.L1439
	.p2align 3
.L1442:
	mov	w4, 32
	ldr	x2, .LC896
	mov	w6, w21
	mov	w5, w20
	mov	w3, w4
	mov	w1, 6788
	mov	w0, 0
	bl	dprint_normal
	mov	w0, 0
	b	.L1431
	.p2align 3
.L1443:
	ldr	x2, .LC898
	mov	w6, w21
	mov	w5, w20
	mov	w1, 6796
	mov	w0, 32
	bl	dprint_normal
	mov	w0, 0
	b	.L1431
	.size	VCTRL_IsResolutionValid, .-VCTRL_IsResolutionValid
	.align	3
.LC890:
	.xword	.LC317
	.align	3
.LC891:
	.xword	.LANCHOR3
	.align	3
.LC892:
	.xword	.LC105
	.align	3
.LC893:
	.xword	.LANCHOR0
	.align	3
.LC894:
	.xword	.LC322
	.align	3
.LC896:
	.xword	.LC895
	.align	3
.LC898:
	.xword	.LC897
	.align	3
.LC900:
	.xword	.LC899
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
	ldr	x0, .LC902
	ldr	w1, [x0]
	cmp	w1, 1
	beq	.L1450
.L1444:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1450:
	cmp	w19, 11
	bhi	.L1451
	ldr	x22, .LC906
	uxtw	x21, w19
	ldrb	w1, [x22, x21]
	cmp	w1, 14
	mov	w20, w1
	bhi	.L1452
.L1448:
	cmp	w19, 10
	beq	.L1453
.L1449:
	ldr	x0, .LC907
	ldr	x0, [x0, 8]
	blr	x0
	lsl	x1, x21, 4
	ldr	x3, .LC908
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
.L1452:
	strb	wzr, [x22, x21]
	mov	w20, 0
	b	.L1448
	.p2align 3
.L1453:
	mov	w1, 1
	strb	w1, [x0, 1216]
	b	.L1449
	.p2align 3
.L1451:
	ldr	x3, .LC903
	mov	w4, 6876
	ldr	x2, .LC905
	mov	w5, w19
	add	x3, x3, 3456
	mov	w1, w4
	mov	w0, 32
	bl	dprint_normal
	b	.L1444
	.size	VCTRL_RecordPosTime, .-VCTRL_RecordPosTime
	.align	3
.LC902:
	.xword	.LANCHOR0
	.align	3
.LC903:
	.xword	.LANCHOR3
	.align	3
.LC905:
	.xword	.LC904
	.align	3
.LC906:
	.xword	g_TimeRecId
	.align	3
.LC907:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC908:
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
	ldr	x20, .LC909
	ldrb	w0, [x20, 1216]
	cmp	w0, 1
	beq	.L1463
.L1455:
	ldr	w0, [x20, 12]
	mov	w1, 100
	str	w1, [x20, 120]
	cmp	w0, wzr
	ldr	x21, .LC910
	ble	.L1456
	ldr	x1, [x21, 240]
	blr	x1
.L1456:
	ldr	x1, [x21, 24]
	mov	w0, 0
	mov	w22, 0
	blr	x1
	bl	SM_Wakeup
	ldr	w0, [x20, 8]
	mov	w1, 101
	str	w1, [x20, 120]
	cbz	w0, .L1464
.L1457:
	mov	w0, 102
	mov	w19, 0
	str	w0, [x20, 120]
	bl	VDMDRV_WakeUpVdm
.L1458:
	mov	w0, w19
	mov	w1, 0
	add	w19, w19, 1
	bl	DeleteRawPacketInBuffer
	cmp	w19, 4
	bne	.L1458
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
.L1464:
	bl	VCTRL_DecSyntax
	mov	w22, w0
	b	.L1457
	.p2align 3
.L1463:
	mov	w0, 11
	bl	VCTRL_RecordPosTime
	strb	wzr, [x20, 1216]
	b	.L1455
	.size	VCTRL_RunProcess, .-VCTRL_RunProcess
	.align	3
.LC909:
	.xword	.LANCHOR0
	.align	3
.LC910:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DecodeThread
	.type	VCTRL_DecodeThread, %function
VCTRL_DecodeThread:
.L1466:
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
	ldr	x20, .LC911
	ldr	x23, .LC912
	ldr	w0, [x20, 104]
.L1471:
	cmp	w0, 2
	str	w21, [x20, 100]
	bne	.L1491
	b	.L1467
	.p2align 3
.L1494:
	str	w21, [x20, 120]
	bl	VCTRL_RunProcess
	ldr	w0, [x20, 104]
	cmp	w0, 2
	beq	.L1467
.L1491:
	cmp	w0, 3
	bne	.L1494
.L1468:
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
.L1467:
	str	w24, [x20, 100]
	str	w22, [x20, 120]
	.p2align 2
.L1473:
	ldr	x1, [x23, 240]
	mov	w0, 10
	blr	x1
	str	w22, [x20, 120]
	ldr	w0, [x20, 104]
	cmp	w0, 1
	beq	.L1471
	cmp	w0, 3
	bne	.L1473
	b	.L1468
	.size	VCTRL_DecodeThread, .-VCTRL_DecodeThread
	.align	3
.LC911:
	.xword	.LANCHOR0
	.align	3
.LC912:
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
	cbnz	w0, .L1505
	mov	x0, x19
	bl	VCTRL_InitVdmHal
	cbnz	w0, .L1506
	mov	x0, x19
	bl	VCTRL_InitScdHal
	cbnz	w0, .L1507
	bl	VCTRL_RegisterInterrupt
	cbnz	w0, .L1508
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1505:
	ldr	x3, .LC914
	mov	w4, 6968
.L1504:
	ldr	x2, .LC916
	mov	w1, w4
	add	x3, x3, 3480
	mov	w0, 1
	bl	dprint_normal
	mov	x0, x19
	bl	VCTRL_CloseDrivers
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1506:
	ldr	x3, .LC914
	mov	w4, 6973
	b	.L1504
	.p2align 3
.L1507:
	ldr	x3, .LC914
	mov	w4, 6978
	b	.L1504
	.p2align 3
.L1508:
	ldr	x3, .LC914
	mov	w4, 6983
	b	.L1504
	.size	VCTRL_OpenDrivers, .-VCTRL_OpenDrivers
	.align	3
.LC914:
	.xword	.LANCHOR3
	.align	3
.LC916:
	.xword	.LC915
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
	ldr	x20, .LC917
	ldr	w0, [x20, 96]
	cmp	w0, 1
	bne	.L1516
	mov	x19, 0
.L1512:
	add	x1, x20, 64
	mov	w0, w19
	ldr	x1, [x1, x19, lsl 3]
	add	x19, x19, 1
	cbz	x1, .L1511
	bl	VCTRL_DestroyChan
.L1511:
	cmp	x19, 4
	bne	.L1512
	bl	FSP_Exit
	ldr	w1, [x20, 100]
	mov	w2, 3
	str	w2, [x20, 104]
	cbz	w1, .L1514
	ldr	x21, .LC918
	mov	w0, 10
	mov	w19, 49
	ldr	x1, [x21, 240]
	blr	x1
	b	.L1515
	.p2align 3
.L1526:
	ldr	x1, [x21, 240]
	blr	x1
	subs	w19, w19, #1
	beq	.L1514
.L1515:
	ldr	w1, [x20, 100]
	mov	w0, 10
	cbnz	w1, .L1526
.L1514:
	add	x0, x20, 128
	bl	VCTRL_CloseDrivers
	str	wzr, [x20, 96]
	mov	w0, 0
.L1525:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1516:
	mov	w0, -1
	b	.L1525
	.size	VCTRL_CloseVfmw, .-VCTRL_CloseVfmw
	.align	3
.LC917:
	.xword	.LANCHOR0
	.align	3
.LC918:
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
	cbz	x22, .L1557
	ldr	x20, .LC925
	mov	x2, 8
	mov	w1, 0
	add	x0, x29, 64
	ldr	x3, [x20, 96]
	blr	x3
	ldr	x19, .LC926
	ldr	w21, [x19, 96]
	cbnz	w21, .L1548
	add	x23, x19, 1224
	ldr	x2, [x20, 160]
	mov	w1, 1024
	mov	x0, x23
	str	xzr, [x29, 72]
	blr	x2
	ldr	x1, .LC928
	mov	x0, x23
	ldr	x2, [x20, 192]
	blr	x2
	str	x0, [x29, 72]
	cbz	x0, .L1531
	ldr	x1, .LC930
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1550
	ldr	x1, .LC932
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1558
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
	bhi	.L1536
.L1564:
	mov	w1, 5000
	mov	w0, -5000
	cmp	w3, w1
	csel	w3, w3, w1, le
	cmp	w3, w0
	csel	w3, w3, w0, ge
.L1532:
	str	w3, [x19, 976]
.L1534:
	add	x23, x19, 1224
	ldr	x2, [x20, 160]
	mov	w1, 1024
	mov	x0, x23
	str	xzr, [x29, 72]
	blr	x2
	ldr	x1, .LC938
	mov	x0, x23
	ldr	x2, [x20, 192]
	blr	x2
	str	x0, [x29, 72]
	cbz	x0, .L1537
	ldr	x1, .LC930
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1538
	ldr	x1, .LC932
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1559
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
	bhi	.L1542
.L1563:
	mov	w21, 5000
	mov	w0, -5000
	cmp	w3, w21
	csel	w21, w3, w21, le
	cmp	w21, w0
	csel	w21, w21, w0, ge
.L1538:
	str	w21, [x19, 980]
.L1540:
	ldr	w0, [x19, 2248]
	str	xzr, [x29, 72]
	cbz	w0, .L1543
	ldr	x2, .LC941
	and	w4, w0, 1
	ubfx	x3, x0, 1, 1
	ubfx	x1, x0, 2, 1
	strb	w4, [x19, 2252]
	ubfx	x0, x0, 3, 1
	strb	w3, [x2, 92]
	strb	w1, [x19, 2253]
	strb	w0, [x19, 2254]
.L1544:
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
	ldr	x0, .LC944
	mov	w1, 3
	str	x0, [x19, 1008]
	mov	w0, 134217728
	str	w0, [x29, 64]
	mov	w0, 75497472
	str	w1, [x19, 100]
	str	w0, [x29, 68]
	bl	FSP_Init
	ldr	x21, .LC945
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
	cbnz	w0, .L1548
	ldr	x2, [x20, 248]
	mov	w1, 1
	blr	x2
	ldr	x2, .LC946
	add	x0, x19, 112
	ldr	x1, .LC948
	ldr	x3, [x20, 384]
	blr	x3
	cbnz	w0, .L1560
	mov	w1, 1
	str	w1, [x19, 96]
.L1529:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1543:
	add	x21, x19, 1224
	ldr	x2, [x20, 160]
	mov	w1, 1024
	mov	x0, x21
	blr	x2
	ldr	x1, .LC943
	mov	x0, x21
	ldr	x2, [x20, 192]
	blr	x2
	str	x0, [x29, 72]
	cbz	x0, .L1544
	ldr	x1, .LC930
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1561
	ldr	x1, .LC932
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1562
	ldr	x3, [x20, 168]
	mov	x1, 0
	mov	w2, 0
	blr	x3
	mov	w1, w0
	str	w0, [x19, 2248]
.L1546:
	ldr	x2, .LC941
	and	w4, w1, 1
	ubfx	x3, x1, 1, 1
	ubfx	x0, x1, 2, 1
	strb	w4, [x19, 2252]
	ubfx	x1, x1, 3, 1
	strb	w3, [x2, 92]
	strb	w0, [x19, 2253]
	strb	w1, [x19, 2254]
	b	.L1544
	.p2align 3
.L1537:
	ldr	w3, [x19, 980]
	mov	w1, 10000
	add	w0, w3, 4096
	add	w0, w0, 904
	cmp	w0, w1
	bls	.L1563
.L1542:
	ldr	x2, .LC940
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
	b	.L1538
	.p2align 3
.L1531:
	ldr	w3, [x19, 976]
	mov	w1, 10000
	add	w0, w3, 4096
	add	w0, w0, 904
	cmp	w0, w1
	bls	.L1564
.L1536:
	ldr	x2, .LC936
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
	b	.L1532
	.p2align 3
.L1550:
	mov	w3, 0
	b	.L1532
	.p2align 3
.L1561:
	ldr	w1, [x19, 2248]
	b	.L1546
	.p2align 3
.L1548:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, -1
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1559:
	ldr	x3, .LC923
	mov	w4, 1063
	ldr	x2, .LC934
	mov	w1, w4
	add	x3, x3, 3544
	mov	w0, 20
	bl	dprint_normal
	b	.L1540
	.p2align 3
.L1558:
	ldr	x3, .LC923
	mov	w4, 1021
	ldr	x2, .LC934
	mov	w1, w4
	add	x3, x3, 3520
	mov	w0, 20
	bl	dprint_normal
	b	.L1534
	.p2align 3
.L1562:
	ldr	x3, .LC923
	mov	w4, 1114
	ldr	x2, .LC934
	mov	w1, w4
	add	x3, x3, 3576
	mov	w0, 20
	bl	dprint_normal
	b	.L1544
	.p2align 3
.L1560:
	mov	x0, x24
	bl	VCTRL_CloseDrivers
	mov	w0, w23
	b	.L1529
.L1557:
	ldr	x3, .LC923
	mov	w4, 7044
	ldr	x5, .LC922
	mov	w1, w4
	ldr	x2, .LC924
	add	x3, x3, 3504
	mov	w0, 0
	bl	dprint_normal
	mov	w0, -1
	b	.L1529
	.size	VCTRL_OpenVfmw, .-VCTRL_OpenVfmw
	.align	3
.LC922:
	.xword	.LC921
	.align	3
.LC923:
	.xword	.LANCHOR3
	.align	3
.LC924:
	.xword	.LC105
	.align	3
.LC925:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC926:
	.xword	.LANCHOR0
	.align	3
.LC928:
	.xword	.LC927
	.align	3
.LC930:
	.xword	.LC929
	.align	3
.LC932:
	.xword	.LC931
	.align	3
.LC934:
	.xword	.LC933
	.align	3
.LC936:
	.xword	.LC935
	.align	3
.LC938:
	.xword	.LC937
	.align	3
.LC940:
	.xword	.LC939
	.align	3
.LC941:
	.xword	.LANCHOR1
	.align	3
.LC943:
	.xword	.LC942
	.align	3
.LC944:
	.xword	VCTRL_EventReport
	.align	3
.LC945:
	.xword	g_ChanCtx
	.align	3
.LC946:
	.xword	VCTRL_DecodeThread
	.align	3
.LC948:
	.xword	.LC947
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
	.type	__func__.14420, %object
	.size	__func__.14420, 20
__func__.14420:
	.string	"VfmwProc_SaveDecYUV"
	.zero	4
	.type	__func__.13501, %object
	.size	__func__.13501, 26
__func__.13501:
	.string	"VCTRL_HandleAllocMemEvent"
	.zero	6
	.type	__func__.13510, %object
	.size	__func__.13510, 28
__func__.13510:
	.string	"VCTRL_HandleReleaseMemEvent"
	.zero	4
	.type	__func__.13536, %object
	.size	__func__.13536, 33
__func__.13536:
	.string	"VCTRL_HandleAllocPreProcessEvent"
	.zero	7
	.type	__func__.13558, %object
	.size	__func__.13558, 18
__func__.13558:
	.string	"VCTRL_EventReport"
	.zero	6
	.type	__func__.13518, %object
	.size	__func__.13518, 33
__func__.13518:
	.string	"VCTRL_HandleReleaseBurstMemEvent"
	.zero	7
	.type	__func__.13526, %object
	.size	__func__.13526, 29
__func__.13526:
	.string	"VCTRL_HandleCancelAllocEvent"
	.align	3
.LANCHOR3 = . + 0
	.type	__func__.13951, %object
	.size	__func__.13951, 24
__func__.13951:
	.string	"VCTRL_GetChanView1Image"
	.type	__func__.14561, %object
	.size	__func__.14561, 24
__func__.14561:
	.string	"VCTRL_SetLastFrameState"
	.type	__func__.13474, %object
	.size	__func__.13474, 17
__func__.13474:
	.string	"VCTRL_RecordData"
	.zero	7
	.type	__func__.13570, %object
	.size	__func__.13570, 18
__func__.13570:
	.string	"VCTRL_SetCallBack"
	.zero	6
	.type	__func__.13606, %object
	.size	__func__.13606, 25
__func__.13606:
	.string	"VCTRL_SetStreamInterface"
	.zero	7
	.type	__func__.13614, %object
	.size	__func__.13614, 30
__func__.13614:
	.string	"VCTRL_SetDeiMemQueryInterface"
	.zero	2
	.type	__func__.13625, %object
	.size	__func__.13625, 20
__func__.13625:
	.string	"VCTRL_GetStreamSize"
	.zero	4
	.type	__func__.13632, %object
	.size	__func__.13632, 20
__func__.13632:
	.string	"VCTRL_CheckFreshRaw"
	.zero	4
	.type	__func__.13639, %object
	.size	__func__.13639, 20
__func__.13639:
	.string	"VCTRL_CheckFreshSeg"
	.zero	4
	.type	__func__.13644, %object
	.size	__func__.13644, 25
__func__.13644:
	.string	"VCTRL_SetDiscardPicParam"
	.zero	7
	.type	__func__.13666, %object
	.size	__func__.13666, 27
__func__.13666:
	.string	"VCTRL_USERDEC_PartitionMem"
	.zero	5
	.type	__func__.13673, %object
	.size	__func__.13673, 29
__func__.13673:
	.string	"VCTRL_USERDEC_GetFrameBuffer"
	.zero	3
	.type	__func__.13681, %object
	.size	__func__.13681, 29
__func__.13681:
	.string	"VCTRL_USERDEC_PutFrameBuffer"
	.zero	3
	.type	__func__.13712, %object
	.size	__func__.13712, 23
__func__.13712:
	.string	"VCTRL_FreeChanResource"
	.zero	1
	.type	__func__.13695, %object
	.size	__func__.13695, 22
__func__.13695:
	.string	"VCTRL_FreeVdhResource"
	.zero	2
	.type	__func__.13701, %object
	.size	__func__.13701, 22
__func__.13701:
	.string	"VCTRL_FreeScdResource"
	.zero	2
	.type	__func__.13707, %object
	.size	__func__.13707, 22
__func__.13707:
	.string	"VCTRL_FreeCtxResource"
	.zero	2
	.type	__func__.13835, %object
	.size	__func__.13835, 17
__func__.13835:
	.string	"VCTRL_GetChanCfg"
	.zero	7
	.type	__func__.13891, %object
	.size	__func__.13891, 14
__func__.13891:
	.string	"VCTRL_SeekPts"
	.zero	2
	.type	__func__.13916, %object
	.size	__func__.13916, 20
__func__.13916:
	.string	"VCTRL_ReleaseStream"
	.zero	4
	.type	__func__.13961, %object
	.size	__func__.13961, 19
__func__.13961:
	.string	"VCTRL_GetChanImage"
	.zero	5
	.type	__FUNCTION__.13965, %object
	.size	__FUNCTION__.13965, 19
__FUNCTION__.13965:
	.string	"VCTRL_GetChanImage"
	.zero	5
	.type	__func__.13971, %object
	.size	__func__.13971, 23
__func__.13971:
	.string	"VCTRL_ReleaseChanImage"
	.zero	1
	.type	__FUNCTION__.13976, %object
	.size	__FUNCTION__.13976, 23
__FUNCTION__.13976:
	.string	"VCTRL_ReleaseChanImage"
	.zero	1
	.type	__func__.13984, %object
	.size	__func__.13984, 23
__func__.13984:
	.string	"VCTRL_GetHDRConfigInfo"
	.zero	1
	.type	__func__.14009, %object
	.size	__func__.14009, 18
__func__.14009:
	.string	"VCTRL_GetDecParam"
	.zero	6
	.type	__func__.14091, %object
	.size	__func__.14091, 20
__func__.14091:
	.string	"VCTRL_ClearDecparam"
	.zero	4
	.type	__func__.14118, %object
	.size	__func__.14118, 21
__func__.14118:
	.string	"VCTRL_VdmProcSedOnly"
	.zero	3
	.type	__func__.14128, %object
	.size	__func__.14128, 21
__func__.14128:
	.string	"VCTRL_GetImageBuffer"
	.zero	3
	.type	__func__.14149, %object
	.size	__func__.14149, 22
__func__.14149:
	.string	"VCTRL_ConfigFFFBSpeed"
	.zero	2
	.type	__func__.14154, %object
	.size	__func__.14154, 20
__func__.14154:
	.string	"VCTRL_ConfigPVRInfo"
	.zero	4
	.type	__func__.14158, %object
	.size	__func__.14158, 19
__func__.14158:
	.string	"VCTRL_IsChanActive"
	.zero	5
	.type	__func__.14162, %object
	.size	__func__.14162, 19
__func__.14162:
	.string	"VCTRL_VarifyOption"
	.zero	5
	.type	__func__.14180, %object
	.size	__func__.14180, 21
__func__.14180:
	.string	"VCTRL_GetChanMemSize"
	.zero	3
	.type	__func__.14263, %object
	.size	__func__.14263, 21
__func__.14263:
	.string	"VCTRL_GetChanIDByCtx"
	.zero	3
	.type	__func__.13895, %object
	.size	__func__.13895, 20
__func__.13895:
	.string	"VCTRL_InitSyntaxCtx"
	.zero	4
	.type	__func__.14285, %object
	.size	__func__.14285, 20
__func__.14285:
	.string	"VCTRL_DecChanSyntax"
	.zero	4
	.type	__func__.14330, %object
	.size	__func__.14330, 20
__func__.14330:
	.string	"VCTRL_GetChanImgNum"
	.zero	4
	.type	__func__.13653, %object
	.size	__func__.13653, 19
__func__.13653:
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
	.type	__func__.14550, %object
	.size	__func__.14550, 22
__func__.14550:
	.string	"VCTRL_ShowProcCommand"
	.zero	2
	.type	__func__.14576, %object
	.size	__func__.14576, 22
__func__.14576:
	.string	"VCTRL_OutputLastFrame"
	.zero	2
	.type	__func__.14071, %object
	.size	__func__.14071, 15
__func__.14071:
	.string	"VCTRL_PostProc"
	.zero	1
	.type	__func__.14113, %object
	.size	__func__.14113, 18
__func__.14113:
	.string	"VCTRL_VdmPostProc"
	.zero	6
	.type	__func__.14637, %object
	.size	__func__.14637, 19
__func__.14637:
	.string	"VCTRL_OpenHardware"
	.zero	5
	.type	__func__.13814, %object
	.size	__func__.13814, 16
__func__.13814:
	.string	"VCTRL_StartChan"
	.type	__func__.14647, %object
	.size	__func__.14647, 20
__func__.14647:
	.string	"VCTRL_CloseHardware"
	.zero	4
	.type	__func__.13830, %object
	.size	__func__.13830, 15
__func__.13830:
	.string	"VCTRL_StopChan"
	.zero	1
	.type	__func__.13938, %object
	.size	__func__.13938, 26
__func__.13938:
	.string	"VCTRL_ResetChanWithOption"
	.zero	6
	.type	__func__.13923, %object
	.size	__func__.13923, 26
__func__.13923:
	.string	"VCTRL_MarkImageOutHanging"
	.zero	6
	.type	__func__.13725, %object
	.size	__func__.13725, 17
__func__.13725:
	.string	"VCTRL_CheckParam"
	.zero	7
	.type	__func__.13885, %object
	.size	__func__.13885, 17
__func__.13885:
	.string	"VCTRL_ConfigChan"
	.zero	7
	.type	__func__.13808, %object
	.size	__func__.13808, 18
__func__.13808:
	.string	"VCTRL_DestroyChan"
	.zero	6
	.type	__func__.14674, %object
	.size	__func__.14674, 21
__func__.14674:
	.string	"VCTRL_BindRequireMem"
	.zero	3
	.type	__func__.14680, %object
	.size	__func__.14680, 25
__func__.14680:
	.string	"VCTRL_SetFrameBufferMode"
	.zero	7
	.type	__func__.14688, %object
	.size	__func__.14688, 23
__func__.14688:
	.string	"VCTRL_BindExternBuffer"
	.zero	1
	.type	__func__.14696, %object
	.size	__func__.14696, 25
__func__.14696:
	.string	"VCTRL_UnBindExternBuffer"
	.zero	7
	.type	__func__.14702, %object
	.size	__func__.14702, 24
__func__.14702:
	.string	"VCTRL_SetFrameBufferNum"
	.type	__func__.14721, %object
	.size	__func__.14721, 24
__func__.14721:
	.string	"VCTRL_IsResolutionValid"
	.type	__func__.14733, %object
	.size	__func__.14733, 20
__func__.14733:
	.string	"VCTRL_RecordPosTime"
	.zero	4
	.type	__func__.14748, %object
	.size	__func__.14748, 18
__func__.14748:
	.string	"VCTRL_OpenDrivers"
	.zero	6
	.type	__func__.14763, %object
	.size	__func__.14763, 15
__func__.14763:
	.string	"VCTRL_OpenVfmw"
	.zero	1
	.type	__FUNCTION__.13581, %object
	.size	__FUNCTION__.13581, 24
__FUNCTION__.13581:
	.string	"VCTRL_GetExtraRefFrmNum"
	.type	__FUNCTION__.13587, %object
	.size	__FUNCTION__.13587, 25
__FUNCTION__.13587:
	.string	"VCTRL_GetExtraDispFrmNum"
	.zero	7
	.type	__FUNCTION__.13593, %object
	.size	__FUNCTION__.13593, 22
__FUNCTION__.13593:
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
.LC188:
	ASCII(.string	"%s: view_0 id(%d) > view_1 id(%d), error!\n" )
	.zero	5
.LC190:
	ASCII(.string	"%s: continuous view0 id(%d)!\n" )
	.zero	2
.LC192:
	ASCII(.string	"%s: continuous view1 id(%d)!\n" )
	.zero	2
.LC197:
	ASCII(.string	"print memory tracer...\n" )
.LC200:
	ASCII(.string	"Disable SedOnly Func\n" )
	.zero	2
.LC202:
	ASCII(.string	"Enable SedOnly Func\n" )
	.zero	3
.LC204:
	ASCII(.string	"The channel number is to Large.\n" )
	.zero	7
.LC207:
	ASCII(.string	"------ s_pstVfmwChan[%d]->stSynExtraData.s32ModuleLowlyEnable = 1 ------\n" )
	.zero	6
.LC219:
	ASCII(.string	"VDMHAL_NULL_FUN_PRINT,L%d\n" )
	.zero	5
.LC221:
	ASCII(.string	"Wait sleep time out %d ms (isScdSleep=%d, isVdmSleep=%d)!\n" )
	.zero	5
.LC224:
	ASCII(.string	"Vfmw suspend totally take %d ms\n" )
	.zero	7
.LC226:
	ASCII(.string	"Force scd %d sleep.\n" )
	.zero	3
.LC228:
	ASCII(.string	"Force vdm %d sleep.\n" )
	.zero	3
.LC231:
	ASCII(.string	"proc cmd need no param:%p\n" )
	.zero	5
.LC237:
	ASCII(.string	"Vfmw resume totally take %d ms\n" )
.LC242:
	ASCII(.string	"%s, %d, pos(%d) error!\n" )
.LC248:
	ASCII(.string	"event_report null!" )
	.zero	5
.LC253:
	ASCII(.string	"%s Unkown Adapter Type: %d\n" )
	.zero	4
.LC262:
	ASCII(.string	"pstStreamParam is NULL" )
	.zero	1
.LC273:
	ASCII(.string	"pDeiMemIntf is NULL" )
	.zero	4
.LC282:
	ASCII(.string	"can NOT get a not-opened Chan's information of bitstream" )
	.zero	7
.LC289:
	ASCII(.string	"This Chan has not been created!!!" )
	.zero	6
.LC292:
	ASCII(.string	"Raw FreshNum=%d, FreshSize=%d\n" )
	.zero	1
.LC301:
	ASCII(.string	"Seg FreshNum=%d, FreshSize=%d\n" )
	.zero	1
.LC309:
	ASCII(.string	"pArgs is null" )
	.zero	2
.LC315:
	ASCII(.string	"%s arrange fs pool failed!\n" )
	.zero	4
.LC317:
	ASCII(.string	"ChanId out of range" )
	.zero	4
.LC322:
	ASCII(.string	"This channel is not opened" )
	.zero	5
.LC324:
	ASCII(.string	"eVidStd != USER" )
.LC326:
	ASCII(.string	"%s no available fs.\n" )
	.zero	3
.LC328:
	ASCII(.string	"%s logic fs(ID %d) invalid.\n" )
	.zero	3
.LC338:
	ASCII(.string	"%s: can not find logic fs by dec phy addr 0x%llx.\n" )
	.zero	5
.LC342:
	ASCII(.string	"%s FATAL: pstChan = NULL!\n" )
	.zero	5
.LC344:
	ASCII(.string	"%s FATAL: pChanMem_vdh = NULL!\n" )
.LC346:
	ASCII(.string	"%s FATAL: pChanMem_scd = NULL!\n" )
.LC348:
	ASCII(.string	"%s FATAL: pChanMem_ctx = NULL!\n" )
.LC356:
	ASCII(.string	"pstCfg is null" )
	.zero	1
.LC372:
	ASCII(.string	"chan not create" )
.LC375:
	ASCII(.string	"ChanID out of range!" )
	.zero	3
.LC380:
	ASCII(.string	"s_pstVfmwChan = NULL" )
	.zero	3
.LC391:
	ASCII(.string	"pImage is NULL" )
	.zero	1
.LC395:
	ASCII(.string	"%s, %d, Phyaddr = 0x%x MetaDataPhyaddr = 0x%x image_id = %d\n" )
	.zero	3
.LC408:
	ASCII(.string	"vdm_ctrl.c,L%d: Chan inactive\n" )
	.zero	1
.LC410:
	ASCII(.string	"vdm_ctrl.c,L%d: This channel is not opened\n" )
	.zero	4
.LC413:
	ASCII(.string	"%s, %d, ===> Phyaddr 0x%x release Error, force to UnMark ImageOutHanging\n" )
	.zero	6
.LC415:
	ASCII(.string	"%s, %d, ===> Phyaddr 0x%x release success!! imageId = 0x%x\n" )
	.zero	4
.LC420:
	ASCII(.string	"vfmw_ctrl.c, line %d: ChanID out of range\n" )
	.zero	5
.LC422:
	ASCII(.string	"vfmw_ctrl.c, line %d: Chan %d is not open or not running\n" )
	.zero	6
.LC430:
	ASCII(.string	"pstHDRInput = null" )
	.zero	5
.LC436:
	ASCII(.string	"%s VidStd=%d Error!\n" )
	.zero	3
.LC440:
	ASCII(.string	"Get DecParam Type Failure!\n" )
	.zero	4
.LC443:
	ASCII(.string	"vfmw_ctrl.c, line %d: ChanID out of range is %d\n" )
	.zero	7
.LC445:
	ASCII(.string	"Chan %d is not open or not running\n" )
	.zero	4
.LC455:
	ASCII(.string	"%s unsupport VidStd %d\n" )
.LC463:
	ASCII(.string	"This channel is not running" )
	.zero	4
.LC473:
	ASCII(.string	"%s unsupport VidStd %d.\n" )
	.zero	7
.LC481:
	ASCII(.string	"can NOT start a not-opened Chan" )
.LC483:
	ASCII(.string	"pArgs = null" )
	.zero	3
.LC505:
	ASCII(.string	"%s param invalid.\n" )
	.zero	5
.LC507:
	ASCII(.string	"pChanOption = null" )
	.zero	5
.LC511:
	ASCII(.string	"pDetailMemSize = null" )
	.zero	2
.LC514:
	ASCII(.string	"ERROR: s32MaxRefFrameNum(%d), g_ExtraRef(%d), s32DisplayFrameNum(%d), g_ExtraDisp(%d)\n" )
	.zero	1
.LC520:
	ASCII(.string	"Register irq %d failed!\n" )
	.zero	7
.LC528:
	ASCII(.string	"MEM_MapRegisterAddr reg 0x%x failed!\n" )
	.zero	2
.LC533:
	ASCII(.string	"VDMDRV_GetHalMemSize Vdh %d failed!\n" )
	.zero	3
.LC535:
	ASCII(.string	"MEM_AllocMemBlock Vdh %d failed!\n" )
	.zero	6
.LC537:
	ASCII(.string	"VDMDRV_OpenHAL Vdh %d failed!\n" )
	.zero	1
.LC543:
	ASCII(.string	"MEM_AllocMemBlock Scd %d failed!\n" )
	.zero	6
.LC545:
	ASCII(.string	"SM_OpenSCDDrv Scd %d failed!\n" )
	.zero	2
.LC548:
	ASCII(.string	"(safe,warn,danger) :amount = %d,%d,%d,%d\n" )
	.zero	6
.LC550:
	ASCII(.string	"strm_ctrl: I->IPB\n" )
	.zero	5
.LC552:
	ASCII(.string	"strm_ctrl: IPB->I\n" )
	.zero	5
.LC554:
	ASCII(.string	"(CurrMode,NextMode) = %d,%d\n" )
	.zero	3
.LC560:
	ASCII(.string	"pCtx = null" )
	.zero	4
.LC567:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC576:
	ASCII(.string	"Chan:%d pic_pts: %lld\n" )
	.zero	1
.LC578:
	ASCII(.string	"Chan:%d pic_usertag: %lld\n" )
	.zero	5
.LC580:
	ASCII(.string	"Chan:%d pic_pts: %lld pic_usertag = %lld\n" )
	.zero	6
.LC591:
	ASCII(.string	"Syntax is stopped from This channel" )
	.zero	4
.LC593:
	ASCII(.string	"[%d] vdm busy\n" )
	.zero	1
.LC595:
	ASCII(.string	"[%d] no frame\n" )
	.zero	1
.LC597:
	ASCII(.string	"[%d] no stream\n" )
.LC599:
	ASCII(.string	"Chan:%d seg_pts: %lld, seg_usertag = %lld\n" )
	.zero	5
.LC615:
	ASCII(.string	"pRefImgNum = null" )
	.zero	6
.LC617:
	ASCII(.string	"pReadImgNum = null" )
	.zero	5
.LC619:
	ASCII(.string	"pNewImgNum = null" )
	.zero	6
.LC621:
	ASCII(.string	"%s not support std %d\n" )
	.zero	1
.LC629:
	ASCII(.string	"pstChanState = NULL" )
	.zero	4
.LC638:
	ASCII(.string	"pShowStr = null" )
.LC643:
	ASCII(.string	"  0x%-15x %s" )
	.zero	3
.LC649:
	ASCII(.string	"Command \"0x%x\" not registerd!\n" )
	.zero	1
.LC662:
	ASCII(.string	"Last frame output failed!\n" )
	.zero	5
.LC664:
	ASCII(.string	"Last frame output successed!\n" )
	.zero	2
.LC666:
	ASCII(.string	"Last frame already output, image id: %d!\n" )
	.zero	6
.LC682:
	ASCII(.string	"Chan id out of range!" )
	.zero	2
.LC687:
	ASCII(.string	"Chan not created!" )
	.zero	6
.LC689:
	ASCII(.string	"Chan not open!" )
	.zero	1
.LC700:
	ASCII(.string	"WARNING: vidio std not setted!" )
	.zero	1
.LC710:
	ASCII(.string	"start chan %d: VCTRL_StartChan return %d\n" )
	.zero	6
.LC724:
	ASCII(.string	"This Chan has not been created or has been destroyed !" )
	.zero	1
.LC728:
	ASCII(.string	"VCTRL_StopChanWithCheck fail!\n" )
	.zero	1
.LC736:
	ASCII(.string	"\n====>%s, %d=====> prepare\n" )
	.zero	4
.LC739:
	ASCII(.string	"====>%s, %d=====> end\n\n" )
.LC745:
	ASCII(.string	"Param Invalid of PChanOption is NULL\n" )
	.zero	2
.LC749:
	ASCII(.string	"line %d VCTRL_GetChanMemSize failed!\n" )
	.zero	2
.LC752:
	ASCII(.string	"vfmw have max(%d) channels opened, can NOT create more channels\n" )
	.zero	7
.LC754:
	ASCII(.string	"L: %d : part we can NOT alloc buffer for channel context\n" )
	.zero	6
.LC756:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel context\n" )
	.zero	6
.LC758:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel vdh\n" )
	.zero	2
.LC760:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel vdh, %#x < %#x\n" )
	.zero	7
.LC762:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel scd\n" )
	.zero	2
.LC764:
	ASCII(.string	"L: %d : can NOT alloc buffer for SCD\n" )
	.zero	2
.LC767:
	ASCII(.string	"Chan:%d can NOT enable FSP instance\n" )
	.zero	3
.LC769:
	ASCII(.string	"Chan:%d hal mem %d overlap scd mem %d\n" )
	.zero	1
.LC778:
	ASCII(.string	"can NOT config a not-opened Chan" )
	.zero	7
.LC780:
	ASCII(.string	"pstCfg = null" )
	.zero	2
.LC782:
	ASCII(.string	"VFMW didn't support std %d.\n" )
	.zero	3
.LC784:
	ASCII(.string	"%s check standard support failed.\n" )
	.zero	5
.LC786:
	ASCII(.string	"%s config not change, no need to proceed.\n" )
	.zero	5
.LC790:
	ASCII(.string	"can NOT VCTRL_PartitionMemForStdUser\n" )
	.zero	2
.LC797:
	ASCII(.string	"chan %d: new UvmosEnable = %d\n" )
	.zero	1
.LC800:
	ASCII(.string	"chan %d: SetUvmosEnable failed!\n" )
	.zero	7
.LC802:
	ASCII(.string	"chan %d: new StrmOFThr = %d\n" )
	.zero	3
.LC805:
	ASCII(.string	"chan %d: new DecMode = %d\n" )
	.zero	5
.LC808:
	ASCII(.string	"chan %d: GetChanCfg failed!\n" )
	.zero	3
.LC810:
	ASCII(.string	"chan %d: new DecOrderOutput = %d\n" )
	.zero	6
.LC813:
	ASCII(.string	"chan %d: new ChanErrThr = %d\n" )
	.zero	2
.LC816:
	ASCII(.string	"reset chan %d: VCTRL_ResetChan return %d\n" )
	.zero	6
.LC821:
	ASCII(.string	"%s:L%d: %s\n" )
	.zero	4
.LC824:
	ASCII(.string	"This Chan has not been created or has been destroyed !!!" )
	.zero	7
.LC826:
	ASCII(.string	"can NOT stop a not-opened Chan" )
	.zero	1
.LC831:
	ASCII(.string	"stop chan %d: VCTRL_StopChan return %d\n" )
.LC853:
	ASCII(.string	"pMem = NULL" )
	.zero	4
.LC855:
	ASCII(.string	"%s Mem UniqueID %llx != Chan UniqueID %llx, ignor this bind operation.\n" )
.LC870:
	ASCII(.string	"pExternBuffer = NULL" )
	.zero	3
.LC872:
	ASCII(.string	"Attached buffer phy:%x, but vir addr is NULL\n" )
	.zero	2
.LC895:
	ASCII(.string	"Resolution min(w=%d,h=%d), this stream (w=%d,h=%d) invalid!\n" )
	.zero	3
.LC897:
	ASCII(.string	"Resolution max(w = %d, h = %d), this stream (w = %d, h = %d) invalid!\n" )
	.zero	1
.LC899:
	ASCII(.string	"Std(%d) not support 4K(w = %d, h = %d)\n" )
.LC904:
	ASCII(.string	"%s,%d,pos(%d) error!\n" )
	.zero	2
.LC915:
	ASCII(.string	"%s %d ERROR exit.\n" )
	.zero	5
.LC921:
	ASCII(.string	"pArgs null!" )
	.zero	4
.LC927:
	ASCII(.string	"g_ExtraRef=" )
	.zero	4
.LC929:
	ASCII(.string	"=" )
	.zero	6
.LC931:
	ASCII(.string	" " )
	.zero	6
.LC933:
	ASCII(.string	"fuction return value is null,%s %d unknow error!!\n" )
	.zero	5
.LC935:
	ASCII(.string	"ERROR: g_ExtraRef = %d is out of [ -5000, 5000 ]!\n" )
	.zero	5
.LC937:
	ASCII(.string	"g_ExtraDisp=" )
	.zero	3
.LC939:
	ASCII(.string	"ERROR: g_ExtraDisp = %d is out of [ -5000, 5000 ]!\n" )
	.zero	4
.LC942:
	ASCII(.string	"g_ExtraCommand=" )
.LC947:
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
	.type	save_file_cnt.14438, %object
	.size	save_file_cnt.14438, 4
save_file_cnt.14438:
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
	.type	save_file_cnt.14432, %object
	.size	save_file_cnt.14432, 4
save_file_cnt.14432:
	.zero	4
	.zero	4
	.type	g_SaveMetadataFileHandler, %object
	.size	g_SaveMetadataFileHandler, 32
g_SaveMetadataFileHandler:
	.zero	32
	.type	save_file_cnt.14426, %object
	.size	save_file_cnt.14426, 4
save_file_cnt.14426:
	.zero	4
	.zero	4
	.type	g_SaveSegFileHandler, %object
	.size	g_SaveSegFileHandler, 32
g_SaveSegFileHandler:
	.zero	32
	.type	save_file_cnt.14408, %object
	.size	save_file_cnt.14408, 4
save_file_cnt.14408:
	.zero	4
	.zero	4
	.type	g_SaveRawFileHandler, %object
	.size	g_SaveRawFileHandler, 32
g_SaveRawFileHandler:
	.zero	32
	.type	save_file_cnt.14402, %object
	.size	save_file_cnt.14402, 4
save_file_cnt.14402:
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
	.type	SaveFileCnt.14416, %object
	.size	SaveFileCnt.14416, 4
SaveFileCnt.14416:
	.zero	4
	.type	g_SaveYuvCount, %object
	.size	g_SaveYuvCount, 4
g_SaveYuvCount:
	.zero	4
	.type	last_rec_pos_time.13962, %object
	.size	last_rec_pos_time.13962, 16
last_rec_pos_time.13962:
	.zero	16
	.type	g_VfmwChanStat, %object
	.size	g_VfmwChanStat, 400
g_VfmwChanStat:
	.zero	400
	.type	last_rec_pos_time.13973, %object
	.size	last_rec_pos_time.13973, 16
last_rec_pos_time.13973:
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
	.type	ChanPriTab.14289, %object
	.size	ChanPriTab.14289, 16
ChanPriTab.14289:
	.zero	16
	.type	g_EventReportFunc, %object
	.size	g_EventReportFunc, 8
g_EventReportFunc:
	.zero	8
	.type	PrioArray.13813, %object
	.size	PrioArray.13813, 16
PrioArray.13813:
	.zero	16
	.type	Capability.13884, %object
	.size	Capability.13884, 148
Capability.13884:
	.zero	148
	.zero	4
	.type	PrioArray.13883, %object
	.size	PrioArray.13883, 16
PrioArray.13883:
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
