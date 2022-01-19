#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vfmw_ctrl.c"
	.global	_mcount
	.text
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
	ldr	x0, .LC0
	ldr	w1, [x19]
	str	w1, [x0]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetPrintLevel, .-VfmwProc_SetPrintLevel
	.align	3
.LC0:
	.xword	g_PrintEnable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_OpenScdLowdly, %function
VfmwProc_OpenScdLowdly:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	mov	w1, 1
	ldr	x2, .LC1
	lsl	x0, x0, 4
	ldr	x0, [x2, x0]
	str	w1, [x0, 48]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_OpenScdLowdly, .-VfmwProc_OpenScdLowdly
	.align	3
.LC1:
	.xword	s_SmIIS
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_CloseScdLowdly, %function
VfmwProc_CloseScdLowdly:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	ldr	x1, .LC2
	lsl	x0, x0, 4
	ldr	x0, [x1, x0]
	str	wzr, [x0, 48]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_CloseScdLowdly, .-VfmwProc_CloseScdLowdly
	.align	3
.LC2:
	.xword	s_SmIIS
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_EventReport
	.type	VCTRL_EventReport, %function
VCTRL_EventReport:
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
	cmp	w19, 31
	bhi	.L16
	ldr	x4, .LC8
	ldr	x0, [x4, w19, sxtw 3]
	cbz	x0, .L17
	ldr	w3, [x0, 32]
	cbz	w3, .L9
	cmp	w3, 1
	bne	.L18
	ldr	x3, [x4, 584]
	cbz	x3, .L19
.L12:
	mov	x2, x21
	mov	w1, w20
	mov	w0, w19
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L18:
	ldr	x2, .LC5
	mov	w4, w22
	ldr	x1, .LC16
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
.L6:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L9:
	ldr	x3, [x4, 576]
	cbnz	x3, .L12
	ldr	x1, .LC12
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L6
	.p2align 3
.L16:
	ldr	x4, .LC4
	mov	w3, 872
	ldr	x2, .LC5
	mov	w0, 0
	ldr	x1, .LC7
	bl	dprint_vfmw
	mov	w0, -1
	b	.L6
.L17:
	ldr	x4, .LC10
	mov	w3, 873
	ldr	x2, .LC5
	ldr	x1, .LC7
	bl	dprint_vfmw
	mov	w0, -1
	b	.L6
.L19:
	ldr	x1, .LC14
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L6
	.size	VCTRL_EventReport, .-VCTRL_EventReport
	.align	3
.LC4:
	.xword	.LC3
	.align	3
.LC5:
	.xword	.LANCHOR0
	.align	3
.LC7:
	.xword	.LC6
	.align	3
.LC8:
	.xword	.LANCHOR1
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
	.type	VfmwProc_SetStandardObedience, %function
VfmwProc_SetStandardObedience:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x4, .LC17
	ldr	x1, .LC19
	mov	w2, w3
	str	w3, [x4, 608]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetStandardObedience, .-VfmwProc_SetStandardObedience
	.align	3
.LC17:
	.xword	.LANCHOR1
	.align	3
.LC19:
	.xword	.LC18
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
	ldr	w3, [x19]
	cmp	w3, 4
	bhi	.L22
	ldr	x0, .LC20
	str	w3, [x0]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L22:
	ldr	x2, .LC20
	mov	w0, 32
	ldr	x1, .LC22
	ldr	w2, [x2]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetClkSelect, .-VfmwProc_SetClkSelect
	.align	3
.LC20:
	.xword	.LANCHOR2
	.align	3
.LC22:
	.xword	.LC21
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetCompressPara, %function
VfmwProc_SetCompressPara:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC23
	mov	x2, 16
	ldp	w20, w21, [x19]
	mov	w1, 0
	add	x0, x29, 64
	ldr	x3, [x3, 96]
	ldp	w23, w22, [x19, 8]
	ldr	w19, [x19, 16]
	blr	x3
	cbz	w21, .L76
	cbz	w23, .L77
	mov	w0, 1
	cmp	w22, 625
	stp	w0, w0, [x29, 64]
	beq	.L71
	bls	.L78
	cmp	w22, 750
	beq	.L32
	cmp	w22, 875
	bne	.L34
	mov	w0, 3
	str	w0, [x29, 72]
.L34:
	cmp	w19, 625
	beq	.L36
	bls	.L79
	cmp	w19, 750
	beq	.L39
	cmp	w19, 875
	bne	.L35
	mov	w0, 3
	str	w0, [x29, 76]
.L35:
	mov	w4, 1
	ldr	x1, .LC29
	mov	w6, w19
	mov	w5, w22
	mov	w3, w4
	mov	w2, w20
	mov	w0, 32
	bl	dprint_vfmw
	b	.L26
	.p2align 3
.L76:
	ldr	x1, .LC25
	mov	w3, -1
	mov	w2, w20
	mov	w0, 32
	stp	wzr, wzr, [x29, 64]
	stp	w3, w3, [x29, 72]
	bl	dprint_vfmw
.L26:
	ldr	x0, .LC30
	sxtw	x2, w20
	ldr	x1, [x0, w20, sxtw 3]
	cbz	x1, .L80
.L42:
	ldr	x1, .LC40
	mov	w2, w20
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L77:
	mov	w6, 1
	ldr	x1, .LC27
	mov	w2, w20
	mov	w5, -1
	mov	w4, 0
	mov	w3, w6
	mov	w0, 32
	stp	w6, wzr, [x29, 64]
	stp	w5, w5, [x29, 72]
	bl	dprint_vfmw
	ldr	x0, .LC30
	sxtw	x2, w20
	ldr	x1, [x0, w20, sxtw 3]
	cbnz	x1, .L42
.L80:
	lsl	x4, x2, 4
	add	x3, x0, 616
	add	x0, x3, x4
	ldr	w5, [x29, 76]
	ldp	w7, w6, [x29, 68]
	ldr	x1, .LC32
	mov	w2, w20
	str	w5, [x0, 12]
	ldr	w5, [x29, 64]
	stp	w7, w6, [x0, 4]
	str	w5, [x3, x4]
	mov	w0, 32
	bl	dprint_vfmw
	ldr	w2, [x29, 64]
	mov	w0, 32
	ldr	x1, .LC34
	bl	dprint_vfmw
	ldr	w2, [x29, 68]
	mov	w0, 32
	ldr	x1, .LC36
	bl	dprint_vfmw
	ldp	w2, w3, [x29, 72]
	ldr	x1, .LC38
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L78:
	cmp	w22, 500
	bne	.L34
	str	wzr, [x29, 72]
	b	.L34
	.p2align 3
.L32:
	mov	w0, 2
.L71:
	str	w0, [x29, 72]
	b	.L34
	.p2align 3
.L79:
	cmp	w19, 500
	bne	.L35
	str	wzr, [x29, 76]
	b	.L35
	.p2align 3
.L39:
	mov	w0, 2
	str	w0, [x29, 76]
	b	.L35
	.p2align 3
.L36:
	mov	w0, 1
	str	w0, [x29, 76]
	b	.L35
	.size	VfmwProc_SetCompressPara, .-VfmwProc_SetCompressPara
	.align	3
.LC23:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC25:
	.xword	.LC24
	.align	3
.LC27:
	.xword	.LC26
	.align	3
.LC29:
	.xword	.LC28
	.align	3
.LC30:
	.xword	.LANCHOR1
	.align	3
.LC32:
	.xword	.LC31
	.align	3
.LC34:
	.xword	.LC33
	.align	3
.LC36:
	.xword	.LC35
	.align	3
.LC38:
	.xword	.LC37
	.align	3
.LC40:
	.xword	.LC39
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetTunnelLineNumber, %function
VfmwProc_SetTunnelLineNumber:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x4, .LC42
	ldr	x1, .LC44
	mov	w2, w3
	str	w3, [x4]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetTunnelLineNumber, .-VfmwProc_SetTunnelLineNumber
	.align	3
.LC42:
	.xword	g_TunnelLineNumber
	.align	3
.LC44:
	.xword	.LC43
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetSaveYuvBitWidth, %function
VfmwProc_SetSaveYuvBitWidth:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	and	w0, w3, -3
	cmp	w0, 8
	bne	.L85
	ldr	x4, .LC47
	mov	w2, w3
	ldr	x1, .LC49
	mov	w0, 32
	str	w3, [x4, 4]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L85:
	ldr	x1, .LC46
	mov	w2, w3
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetSaveYuvBitWidth, .-VfmwProc_SetSaveYuvBitWidth
	.align	3
.LC46:
	.xword	.LC45
	.align	3
.LC47:
	.xword	.LANCHOR2
	.align	3
.LC49:
	.xword	.LC48
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
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x4, .LC50
	ldr	x1, .LC52
	mov	w2, w3
	str	w3, [x4]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetTraceImgPeriod, .-VfmwProc_SetTraceImgPeriod
	.align	3
.LC50:
	.xword	g_TraceImgPeriod
	.align	3
.LC52:
	.xword	.LC51
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
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x4, .LC53
	ldr	x1, .LC55
	mov	w2, w3
	str	w3, [x4]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetTraceFramePeriod, .-VfmwProc_SetTraceFramePeriod
	.align	3
.LC53:
	.xword	g_TraceFramePeriod
	.align	3
.LC55:
	.xword	.LC54
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
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x4, .LC56
	ldr	x1, .LC58
	mov	w2, w3
	str	w3, [x4]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetTraceBSPeriod, .-VfmwProc_SetTraceBSPeriod
	.align	3
.LC56:
	.xword	g_TraceBsPeriod
	.align	3
.LC58:
	.xword	.LC57
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
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x4, .LC59
	ldr	x1, .LC61
	mov	w2, w3
	str	w3, [x4]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetTraceCtrl, .-VfmwProc_SetTraceCtrl
	.align	3
.LC59:
	.xword	g_TraceCtrl
	.align	3
.LC61:
	.xword	.LC60
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
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x4, .LC62
	ldr	x1, .LC64
	mov	w2, w3
	str	w3, [x4, 1128]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestStopDec, .-VfmwProc_TestStopDec
	.align	3
.LC62:
	.xword	.LANCHOR1
	.align	3
.LC64:
	.xword	.LC63
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
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x4, .LC65
	ldr	x1, .LC67
	mov	w2, w3
	str	w3, [x4, 1132]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestTimeSequence, .-VfmwProc_TestTimeSequence
	.align	3
.LC65:
	.xword	.LANCHOR1
	.align	3
.LC67:
	.xword	.LC66
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SaveEL, %function
VfmwProc_SaveEL:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	cmp	w19, 31
	bhi	.L92
	ldr	x21, .LC68
	add	x20, x21, 1136
	ldr	x0, [x20, w19, uxtw 3]
	cbz	x0, .L97
	ldr	x1, .LC78
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x1, .LC69
	ldr	x0, [x20, w19, uxtw 3]
	ldr	x1, [x1, 72]
	blr	x1
	str	xzr, [x20, w19, uxtw 3]
.L92:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L97:
	ldr	x22, .LC69
	mov	x1, 50
	ldr	w0, [x21, 1392]
	ldr	x3, .LC70
	mov	w4, w0
	ldr	x2, .LC72
	add	w0, w0, 1
	ldr	x5, [x22, 136]
	add	x3, x3, 8
	str	w0, [x21, 1392]
	add	x0, x29, 56
	blr	x5
	ldr	x3, [x22, 64]
	mov	w2, 0
	mov	w1, 66
	add	x0, x29, 56
	blr	x3
	str	w19, [x21, 1396]
	str	x0, [x20, w19, uxtw 3]
	cbz	x0, .L95
	ldr	x1, .LC74
	mov	w3, w19
	add	x2, x29, 56
	mov	w0, 32
	bl	dprint_vfmw
	b	.L92
	.p2align 3
.L95:
	ldr	x1, .LC76
	add	x2, x29, 56
	mov	w0, 32
	bl	dprint_vfmw
	b	.L92
	.size	VfmwProc_SaveEL, .-VfmwProc_SaveEL
	.align	3
.LC68:
	.xword	.LANCHOR1
	.align	3
.LC69:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC70:
	.xword	.LANCHOR2
	.align	3
.LC72:
	.xword	.LC71
	.align	3
.LC74:
	.xword	.LC73
	.align	3
.LC76:
	.xword	.LC75
	.align	3
.LC78:
	.xword	.LC77
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
	ldr	w3, [x19]
	cmp	w3, 32
	bhi	.L101
	ldr	x4, .LC82
	mov	w2, w3
	ldr	x1, .LC84
	mov	w0, 32
	str	w3, [x4, 1400]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L101:
	ldr	x1, .LC81
	mov	w2, w3
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetCurProcChan, .-VfmwProc_SetCurProcChan
	.align	3
.LC81:
	.xword	.LC80
	.align	3
.LC82:
	.xword	.LANCHOR1
	.align	3
.LC84:
	.xword	.LC83
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetSaveFileAfterReset, %function
VfmwProc_SetSaveFileAfterReset:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	cmp	w3, 1
	bls	.L105
	ldr	x1, .LC89
	mov	w2, w3
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L105:
	ldr	x4, .LC85
	mov	w2, w3
	ldr	x1, .LC87
	mov	w0, 32
	str	w3, [x4, 1404]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetSaveFileAfterReset, .-VfmwProc_SetSaveFileAfterReset
	.align	3
.LC85:
	.xword	.LANCHOR1
	.align	3
.LC87:
	.xword	.LC86
	.align	3
.LC89:
	.xword	.LC88
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
	ldr	w3, [x19]
	cmp	w3, 1
	bls	.L109
	ldr	x1, .LC94
	mov	w2, w3
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L109:
	ldr	x4, .LC90
	mov	w2, w3
	ldr	x1, .LC92
	mov	w0, 32
	str	w3, [x4]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetUSE_FF_APT_EN, .-VfmwProc_SetUSE_FF_APT_EN
	.align	3
.LC90:
	.xword	USE_FF_APT_EN
	.align	3
.LC92:
	.xword	.LC91
	.align	3
.LC94:
	.xword	.LC93
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetVp9DecFrameNum, %function
VfmwProc_SetVp9DecFrameNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x4, .LC95
	ldr	x1, .LC97
	mov	w2, w3
	str	w3, [x4]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetVp9DecFrameNum, .-VfmwProc_SetVp9DecFrameNum
	.align	3
.LC95:
	.xword	g_CfgVp9FrmNum
	.align	3
.LC97:
	.xword	.LC96
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
	bhi	.L114
	ldr	x1, .LC101
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x0, .LC102
	str	w19, [x0, 72]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L114:
	ldr	x1, .LC99
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetDefaultOutputOrder, .-VfmwProc_SetDefaultOutputOrder
	.align	3
.LC99:
	.xword	.LC98
	.align	3
.LC101:
	.xword	.LC100
	.align	3
.LC102:
	.xword	.LANCHOR2
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
	cmp	w19, 31
	bhi	.L118
	ldr	x21, .LC103
	add	x20, x21, 1408
	ldr	x0, [x20, w19, uxtw 3]
	cbz	x0, .L123
	ldr	x1, .LC111
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x1, .LC104
	ldr	x0, [x20, w19, uxtw 3]
	ldr	x1, [x1, 72]
	blr	x1
	str	xzr, [x20, w19, uxtw 3]
.L118:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L123:
	ldr	x22, .LC104
	mov	w0, 24
	ldr	x23, [x22, 136]
	bl	VFMW_GetString
	ldr	w1, [x21, 1664]
	mov	x2, x0
	ldr	x3, .LC105
	add	x0, x29, 72
	mov	w4, w1
	add	w1, w1, 1
	add	x3, x3, 8
	str	w1, [x21, 1664]
	mov	x1, 50
	blr	x23
	ldr	x3, [x22, 64]
	mov	w2, 0
	mov	w1, 66
	add	x0, x29, 72
	blr	x3
	str	w19, [x21, 1668]
	str	x0, [x20, w19, uxtw 3]
	cbz	x0, .L121
	ldr	x1, .LC107
	mov	w3, w19
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L118
	.p2align 3
.L121:
	ldr	x1, .LC109
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L118
	.size	VfmwProc_SaveReorderMetadata, .-VfmwProc_SaveReorderMetadata
	.align	3
.LC103:
	.xword	.LANCHOR1
	.align	3
.LC104:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC105:
	.xword	.LANCHOR2
	.align	3
.LC107:
	.xword	.LC106
	.align	3
.LC109:
	.xword	.LC108
	.align	3
.LC111:
	.xword	.LC110
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
	cmp	w19, 31
	bls	.L130
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L130:
	ldr	x20, .LC113
	mov	w1, w19
	mov	w0, 2
	ldr	x2, [x20, 48]
	blr	x2
	ldr	x22, .LC114
	add	x21, x22, 1672
	ldr	x0, [x21, w19, uxtw 3]
	cbz	x0, .L131
	ldr	x1, .LC120
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x0, [x21, w19, uxtw 3]
	ldr	x1, [x20, 72]
	blr	x1
	str	xzr, [x21, w19, uxtw 3]
.L129:
	ldr	x2, [x20, 56]
	mov	w1, w19
	mov	w0, 2
	blr	x2
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L131:
	mov	w0, 23
	ldr	x23, [x20, 136]
	bl	VFMW_GetString
	mov	x2, x0
	ldr	w1, [x22, 1928]
	add	x0, x29, 72
	ldr	x3, .LC115
	mov	w4, w1
	add	w1, w1, 1
	add	x3, x3, 8
	str	w1, [x22, 1928]
	mov	x1, 50
	blr	x23
	ldr	x3, [x20, 64]
	mov	w2, 0
	mov	w1, 66
	add	x0, x29, 72
	blr	x3
	str	w19, [x22, 1932]
	str	x0, [x21, w19, uxtw 3]
	cbz	x0, .L127
	ldr	x1, .LC117
	mov	w3, w19
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L129
.L127:
	ldr	x1, .LC119
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L129
	.size	VfmwProc_SaveMetadata, .-VfmwProc_SaveMetadata
	.align	3
.LC113:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC114:
	.xword	.LANCHOR1
	.align	3
.LC115:
	.xword	.LANCHOR2
	.align	3
.LC117:
	.xword	.LC116
	.align	3
.LC119:
	.xword	.LC118
	.align	3
.LC120:
	.xword	.LC110
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_Save1DYUV, %function
VfmwProc_Save1DYUV:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC122
	ldp	w21, w23, [x20]
	ldr	w24, [x20, 8]
	ldr	x1, [x19, 424]
	mov	w0, w21
	blr	x1
	mov	x20, x0
	cbz	x0, .L138
	mov	w0, 22
	ldr	x22, [x19, 136]
	bl	VFMW_GetString
	mov	x2, x0
	ldr	x3, .LC125
	mov	w4, w21
	mov	x1, 50
	add	x0, x29, 72
	add	x3, x3, 8
	blr	x22
	ldr	x3, [x19, 64]
	mov	w2, 0
	mov	w1, 66
	add	x0, x29, 72
	blr	x3
	mov	x21, x0
	cbz	x0, .L135
	ldr	x1, .LC126
	ldr	x5, [x1, 296]
	cbz	x5, .L136
	mov	w4, 1
	mov	w3, w24
	mov	w2, w23
	mov	x1, x20
	blr	x5
.L137:
	ldr	x1, [x19, 72]
	mov	x0, x21
	blr	x1
	ldr	x1, .LC130
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
.L134:
	ldr	x1, [x19, 312]
	mov	x0, x20
	blr	x1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L136:
	ldr	x1, .LC128
	mov	w2, 6578
	mov	w0, 0
	bl	dprint_vfmw
	b	.L137
	.p2align 3
.L138:
	ldr	x1, .LC124
	mov	w2, w21
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x1, [x19, 312]
	mov	x0, x20
	blr	x1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L135:
	ldr	x1, .LC132
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L134
	.size	VfmwProc_Save1DYUV, .-VfmwProc_Save1DYUV
	.align	3
.LC122:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC124:
	.xword	.LC123
	.align	3
.LC125:
	.xword	.LANCHOR2
	.align	3
.LC126:
	.xword	g_vdm_hal_fun_ptr
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
	cmp	w19, 31
	bhi	.L139
	ldr	x21, .LC133
	add	x20, x21, 1936
	ldr	x0, [x20, w19, uxtw 3]
	cbz	x0, .L144
	ldr	x1, .LC141
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x1, .LC134
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
	ldr	x22, .LC134
	mov	w0, 19
	ldr	x23, [x22, 136]
	bl	VFMW_GetString
	ldr	w1, [x21, 2192]
	mov	x2, x0
	ldr	x3, .LC135
	add	x0, x29, 72
	mov	w4, w1
	add	w1, w1, 1
	add	x3, x3, 8
	str	w1, [x21, 2192]
	mov	x1, 50
	blr	x23
	ldr	x3, [x22, 64]
	mov	w2, 0
	mov	w1, 66
	add	x0, x29, 72
	blr	x3
	str	w19, [x21, 2196]
	str	x0, [x20, w19, uxtw 3]
	cbz	x0, .L142
	ldr	x1, .LC137
	mov	w3, w19
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L139
	.p2align 3
.L142:
	ldr	x1, .LC139
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L139
	.size	VfmwProc_SaveSeg, .-VfmwProc_SaveSeg
	.align	3
.LC133:
	.xword	.LANCHOR1
	.align	3
.LC134:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC135:
	.xword	.LANCHOR2
	.align	3
.LC137:
	.xword	.LC136
	.align	3
.LC139:
	.xword	.LC138
	.align	3
.LC141:
	.xword	.LC140
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_Savestream, %function
VfmwProc_Savestream:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	cmp	w19, 31
	bhi	.L145
	ldr	x21, .LC143
	add	x20, x21, 2200
	ldr	x0, [x20, w19, uxtw 3]
	cbz	x0, .L150
	ldr	x1, .LC151
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x1, .LC144
	ldr	x0, [x20, w19, uxtw 3]
	ldr	x1, [x1, 72]
	blr	x1
	str	xzr, [x20, w19, uxtw 3]
.L145:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L150:
	ldr	x22, .LC144
	mov	w0, 18
	ldr	x23, [x22, 136]
	bl	VFMW_GetString
	ldr	w1, [x21, 2456]
	mov	x2, x0
	ldr	x3, .LC145
	add	x0, x29, 72
	mov	w4, w1
	add	w1, w1, 1
	add	x3, x3, 8
	str	w1, [x21, 2456]
	mov	x1, 50
	blr	x23
	ldr	x3, [x22, 64]
	mov	w2, 0
	mov	w1, 66
	add	x0, x29, 72
	blr	x3
	str	w19, [x21, 2460]
	str	x0, [x20, w19, uxtw 3]
	cbz	x0, .L148
	ldr	x1, .LC147
	mov	w3, w19
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L145
	.p2align 3
.L148:
	ldr	x1, .LC149
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L145
	.size	VfmwProc_Savestream, .-VfmwProc_Savestream
	.align	3
.LC143:
	.xword	.LANCHOR1
	.align	3
.LC144:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC145:
	.xword	.LANCHOR2
	.align	3
.LC147:
	.xword	.LC146
	.align	3
.LC149:
	.xword	.LC148
	.align	3
.LC151:
	.xword	.LC150
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SaveYUV, %function
VfmwProc_SaveYUV:
	stp	x29, x30, [sp, -176]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w20, [x19]
	cmp	w20, 31
	bls	.L161
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L161:
	ldr	x21, .LC153
	mov	w1, w20
	mov	w0, 2
	ldr	x2, [x21, 48]
	blr	x2
	ldr	x19, .LC154
	add	x22, x19, 2464
	ldr	x0, [x22, w20, uxtw 3]
	cbz	x0, .L162
	ldr	x1, .LC163
	mov	w0, 32
	add	x23, x19, 2728
	bl	dprint_vfmw
	ldr	x0, [x22, w20, uxtw 3]
	ldr	x1, [x21, 72]
	blr	x1
	str	xzr, [x22, w20, uxtw 3]
	ldr	x1, .LC155
	mov	w2, -1
	ldr	w0, [x19, 2744]
	str	w2, [x1, 76]
	add	x1, x19, 2560
	stp	xzr, xzr, [x1, 200]
	stp	xzr, xzr, [x1, 216]
	str	xzr, [x19, 2792]
	str	xzr, [x19, 2800]
	str	wzr, [x19, 2808]
	str	xzr, [x19, 2816]
	cbnz	w0, .L163
.L157:
	ldr	x2, [x21, 56]
	mov	w1, w20
	mov	w0, 2
	blr	x2
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L163:
	ldr	x1, [x19, 2736]
	bl	MEM_ReleaseMemBlock
	ldr	w2, [x19, 2752]
	ldr	x1, [x19, 2736]
	ldr	w0, [x19, 2744]
	bl	MEM_DelMemRecord
	ldr	x3, [x21, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	b	.L157
	.p2align 3
.L162:
	mov	w0, 20
	ldr	x23, [x21, 136]
	bl	VFMW_GetString
	ldr	x24, .LC155
	ldr	w1, [x19, 2720]
	mov	x2, x0
	add	x3, x24, 8
	add	x0, x29, 72
	mov	w4, w1
	add	w1, w1, 1
	str	w1, [x19, 2720]
	mov	x1, 100
	blr	x23
	ldr	x3, [x21, 64]
	mov	w2, 0
	mov	w1, 578
	add	x0, x29, 72
	blr	x3
	str	x0, [x22, w20, uxtw 3]
	cbz	x0, .L154
	add	x23, x19, 2728
	ldr	x3, [x21, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	mov	w1, 3
	mov	w0, 27
	str	w1, [x23, 28]
	bl	VFMW_GetString
	mov	w4, 0
	mov	x3, x23
	mov	w2, 47185920
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbz	w0, .L155
	ldr	x1, .LC157
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, [x22, w20, uxtw 3]
	ldr	x1, [x21, 72]
	blr	x1
	str	xzr, [x22, w20, uxtw 3]
	add	x2, x19, 2560
	mov	w0, -1
	stp	xzr, xzr, [x2, 200]
	stp	xzr, xzr, [x2, 216]
	str	xzr, [x19, 2792]
	str	xzr, [x19, 2800]
	str	wzr, [x19, 2808]
	str	w0, [x24, 76]
	b	.L157
.L154:
	ldr	x1, .LC161
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L157
	.p2align 3
.L155:
	ldr	w2, [x23, 24]
	ldr	x1, [x23, 8]
	ldr	w0, [x23, 16]
	bl	MEM_AddMemRecord
	ldr	x5, [x23, 8]
	lsr	w1, w20, 24
	mov	x0, 23592960
	and	w7, w20, 3
	add	x6, x5, 9437184
	str	x6, [x19, 2768]
	mov	x6, 25952256
	add	x0, x5, x0
	add	x6, x5, x6
	str	x6, [x19, 2784]
	mov	x6, 28311552
	mov	w3, w1
	add	x6, x5, x6
	str	w1, [x24, 76]
	ldr	x1, .LC159
	mov	w4, w7
	str	x5, [x19, 2776]
	add	x2, x29, 72
	str	x0, [x19, 2792]
	mov	w0, 32
	str	x6, [x19, 2816]
	add	x6, x5, 11796480
	add	x5, x5, 14155776
	str	w7, [x19, 2808]
	str	x6, [x19, 2760]
	str	x5, [x19, 2800]
	bl	dprint_vfmw
	b	.L157
	.size	VfmwProc_SaveYUV, .-VfmwProc_SaveYUV
	.align	3
.LC153:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC154:
	.xword	.LANCHOR1
	.align	3
.LC155:
	.xword	.LANCHOR2
	.align	3
.LC157:
	.xword	.LC156
	.align	3
.LC159:
	.xword	.LC158
	.align	3
.LC161:
	.xword	.LC160
	.align	3
.LC163:
	.xword	.LC162
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_ReleaseHalMem, %function
VCTRL_ReleaseHalMem:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC166
	ldr	w0, [x19, 312]
	cbz	w0, .L165
	ldr	x0, .LC167
	ldr	x1, [x0, 120]
	cbz	x1, .L182
	mov	w0, 0
	blr	x1
.L168:
	ldr	w2, [x19, 312]
	ldr	x1, [x19, 296]
	ldr	w0, [x19, 304]
	bl	MEM_DelMemRecord
	ldr	w0, [x19, 304]
	ldr	x1, [x19, 296]
	bl	MEM_ReleaseMemBlock
	ldr	x3, .LC168
	mov	x2, 32
	mov	w1, 0
	add	x0, x19, 288
	ldr	x3, [x3, 96]
	blr	x3
.L165:
	ldr	w2, [x19, 376]
	cbnz	w2, .L183
.L169:
	ldr	w0, [x19, 344]
	cbnz	w0, .L184
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L184:
	mov	w0, 0
	bl	SM_CloseSCDDrv
	ldr	w2, [x19, 344]
	ldr	x1, [x19, 328]
	ldr	w0, [x19, 336]
	bl	MEM_DelMemRecord
	ldr	w0, [x19, 336]
	ldr	x1, [x19, 328]
	bl	MEM_ReleaseMemBlock
	ldr	x3, .LC168
	mov	x2, 32
	mov	w1, 0
	add	x0, x19, 320
	ldr	x3, [x3, 96]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L183:
	ldr	x1, [x19, 360]
	ldr	w0, [x19, 368]
	bl	MEM_DelMemRecord
	ldr	w0, [x19, 368]
	ldr	x1, [x19, 360]
	bl	MEM_ReleaseMemBlock
	ldr	x3, .LC168
	mov	x2, 32
	mov	w1, 0
	add	x0, x19, 352
	ldr	x3, [x3, 96]
	blr	x3
	b	.L169
	.p2align 3
.L182:
	ldr	x1, .LC169
	mov	w2, 1815
	mov	w0, 0
	bl	dprint_vfmw
	b	.L168
	.size	VCTRL_ReleaseHalMem, .-VCTRL_ReleaseHalMem
	.align	3
.LC166:
	.xword	.LANCHOR1
	.align	3
.LC167:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC168:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC169:
	.xword	.LC127
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
	ldr	x19, .LC171
	ldr	w0, [x20]
	mov	w2, 67108864
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
.LC171:
	.xword	g_PrintEnable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_PrintTracer, %function
VfmwProc_PrintTracer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC173
	mov	w0, 32
	ldr	w19, [x19]
	bl	dprint_vfmw
	mov	w0, w19
	bl	DBG_PrintTracer
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_PrintTracer, .-VfmwProc_PrintTracer
	.align	3
.LC173:
	.xword	.LC172
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetSegBypass, %function
VfmwProc_SetSegBypass:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	ldr	x2, .LC174
	cbz	w0, .L190
	ldr	x1, .LC178
	mov	w3, 1
	mov	w0, 32
	str	w3, [x2, 80]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L190:
	ldr	x1, .LC176
	mov	w0, 32
	str	wzr, [x2, 80]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetSegBypass, .-VfmwProc_SetSegBypass
	.align	3
.LC174:
	.xword	.LANCHOR2
	.align	3
.LC176:
	.xword	.LC175
	.align	3
.LC178:
	.xword	.LC177
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetSmmuIrqEnable, %function
VfmwProc_SetSmmuIrqEnable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	cbnz	w0, .L191
	ldr	x19, .LC179
	ldr	w0, [x19, 84]
	cmp	w0, 1
	beq	.L194
	ldr	x1, .LC183
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, 1
	str	w0, [x19, 84]
.L191:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L194:
	ldr	x1, .LC181
	mov	w0, 32
	bl	dprint_vfmw
	str	wzr, [x19, 84]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetSmmuIrqEnable, .-VfmwProc_SetSmmuIrqEnable
	.align	3
.LC179:
	.xword	.LANCHOR2
	.align	3
.LC181:
	.xword	.LC180
	.align	3
.LC183:
	.xword	.LC182
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
	ldr	x2, .LC184
	cbz	w0, .L198
	ldr	x1, .LC188
	mov	w3, 1
	mov	w0, 32
	str	w3, [x2, 88]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L198:
	ldr	x1, .LC186
	mov	w0, 32
	str	wzr, [x2, 88]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetSedOnlyEnable, .-VfmwProc_SetSedOnlyEnable
	.align	3
.LC184:
	.xword	.LANCHOR2
	.align	3
.LC186:
	.xword	.LC185
	.align	3
.LC188:
	.xword	.LC187
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
	ldr	w3, [x19]
	cmp	w3, 31
	bhi	.L202
	ldr	x5, .LC191
	mov	w2, w3
	ldr	x1, .LC192
	mov	w4, 1
	mov	w0, 32
	ldr	x3, [x5, w3, uxtw 3]
	str	w4, [x3, 1352]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L202:
	ldr	x1, .LC190
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_OpenModuleLowly, .-VfmwProc_OpenModuleLowly
	.align	3
.LC190:
	.xword	.LC189
	.align	3
.LC191:
	.xword	.LANCHOR1
	.align	3
.LC192:
	.xword	.LC43
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_DelRecordEsBuf.isra.5, %function
VCTRL_DelRecordEsBuf.isra.5:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	x2, [x19]
	ldr	w0, [x2, 16]
	cbz	w0, .L203
	ldr	w1, [x2, 24]
	cbz	w1, .L203
	cmp	w20, 1
	ldr	x1, .LC193
	beq	.L213
	str	w0, [x29, 48]
	add	x0, x29, 32
	ldr	x1, [x1, 360]
	ldr	x2, [x2, 8]
	str	x2, [x29, 40]
	blr	x1
.L206:
	ldr	x0, [x19]
	ldr	w2, [x0, 24]
	ldr	x1, [x0, 8]
	ldr	w0, [x0, 16]
	bl	MEM_DelMemRecord
.L203:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L213:
	ldr	x1, [x1, 328]
	ldr	x0, [x2, 8]
	blr	x1
	b	.L206
	.size	VCTRL_DelRecordEsBuf.isra.5, .-VCTRL_DelRecordEsBuf.isra.5
	.align	3
.LC193:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_StopTask.part.15, %function
VCTRL_StopTask.part.15:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC194
	ldr	w0, [x20, 260]
	cmp	w0, 1
	beq	.L217
	ldr	x21, .LC195
	mov	w0, 10
	mov	w19, 49
	ldr	x1, [x21, 240]
	blr	x1
	b	.L218
	.p2align 3
.L225:
	ldr	x1, [x21, 240]
	blr	x1
	subs	w19, w19, #1
	beq	.L224
.L218:
	ldr	w1, [x20, 260]
	mov	w0, 10
	cmp	w1, 1
	bne	.L225
.L217:
	str	wzr, [x20, 264]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L224:
	str	wzr, [x20, 264]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VCTRL_StopTask.part.15, .-VCTRL_StopTask.part.15
	.align	3
.LC194:
	.xword	.LANCHOR1
	.align	3
.LC195:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_StartTask.part.16, %function
VCTRL_StartTask.part.16:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC196
	ldr	w0, [x20, 260]
	cmp	w0, 2
	beq	.L229
	ldr	x21, .LC197
	mov	w0, 10
	mov	w19, 49
	ldr	x1, [x21, 240]
	blr	x1
	b	.L230
	.p2align 3
.L237:
	ldr	x1, [x21, 240]
	blr	x1
	subs	w19, w19, #1
	beq	.L236
.L230:
	ldr	w1, [x20, 260]
	mov	w0, 10
	cmp	w1, 2
	bne	.L237
.L229:
	str	wzr, [x20, 264]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L236:
	str	wzr, [x20, 264]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VCTRL_StartTask.part.16, .-VCTRL_StartTask.part.16
	.align	3
.LC196:
	.xword	.LANCHOR1
	.align	3
.LC197:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_SetLastFrameState.part.24, %function
VCTRL_SetLastFrameState.part.24:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC200
	mov	w3, 7172
	ldr	x4, .LC199
	mov	w0, 0
	ldr	x1, .LC201
	add	x2, x2, 24
	bl	dprint_vfmw
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_SetLastFrameState.part.24, .-VCTRL_SetLastFrameState.part.24
	.align	3
.LC199:
	.xword	.LC198
	.align	3
.LC200:
	.xword	.LANCHOR0
	.align	3
.LC201:
	.xword	.LC6
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_CanBeDecodedByHardWare.part.26, %function
VCTRL_CanBeDecodedByHardWare.part.26:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sub	w0, w19, #19
	cmp	w0, 1
	ccmp	w19, 14, 4, hi
	ldr	x19, [sp, 16]
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_CanBeDecodedByHardWare.part.26, .-VCTRL_CanBeDecodedByHardWare.part.26
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
	ldr	w3, [x19]
	cmp	w3, 31
	bhi	.L243
	ldr	x4, .LC203
	mov	w2, w3
	ldr	x1, .LC204
	mov	w0, 32
	ldr	x3, [x4, w3, uxtw 3]
	str	wzr, [x3, 1352]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L243:
	ldr	x1, .LC202
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_CloseModuleLowly, .-VfmwProc_CloseModuleLowly
	.align	3
.LC202:
	.xword	.LC189
	.align	3
.LC203:
	.xword	.LANCHOR1
	.align	3
.LC204:
	.xword	.LC43
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
	ldr	x21, .LC205
	ldr	x0, [x21]
	blr	x0
	ldr	x24, .LC206
	mov	w25, w0
	ldr	x1, [x24]
	cbz	x1, .L245
	mov	w0, 0
	blr	x1
.L246:
	mov	w0, 0
	mov	w20, 32
	mov	w22, 0
	mov	w19, 0
	bl	SCDDRV_PrepareSleep
	mov	w0, 0
	bl	VDMDRV_PrepareSleep
	ldr	x0, [x21]
	blr	x0
	mov	w26, w0
	b	.L257
	.p2align 3
.L247:
	bl	VDMDRV_GetSleepStage
	cmp	w0, 2
	mov	w19, 1
	mov	w23, w19
	beq	.L250
.L281:
	tst	w23, w22
	mov	w0, 10
	bne	.L250
	subs	w20, w20, #1
	beq	.L282
	ldr	x1, [x21, 240]
	blr	x1
	cmp	w19, 1
	ccmp	w22, 1, 0, eq
	beq	.L250
.L257:
	mov	w0, 0
	bl	SCDDRV_GetSleepStage
	cmp	w0, 2
	mov	w0, 0
	beq	.L247
	bl	VDMDRV_GetSleepStage
	cmp	w0, 2
	mov	w23, w19
	bne	.L281
	mov	w22, 1
	b	.L281
	.p2align 3
.L282:
	ldr	x0, [x21]
	blr	x0
	cmp	w26, w0
	sub	w2, w0, w26
	bls	.L253
	mvn	w26, w26
	add	w2, w26, w0
.L253:
	ldr	x1, .LC209
	mov	w4, w22
	mov	w3, w19
	mov	w0, 0
	bl	dprint_vfmw
	cbnz	w19, .L269
	ldr	x1, .LC215
	mov	w2, 0
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	bl	SCDDRV_ForceSleep
.L269:
	cbnz	w22, .L250
	ldr	x1, .LC217
	mov	w2, 0
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	bl	VDMDRV_ForceSleep
.L250:
	ldr	x0, .LC210
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L283
.L259:
	ldr	x0, .LC211
	add	x1, x0, 256
	ldr	w0, [x0, 256]
	cmp	w0, 1
	beq	.L284
.L266:
	ldr	x0, [x21]
	blr	x0
	cmp	w25, w0
	sub	w2, w0, w25
	bls	.L268
	mvn	w25, w25
	add	w2, w25, w0
.L268:
	ldr	x1, .LC213
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L283:
	ldr	x1, [x24, 64]
	cbz	x1, .L260
	mov	w0, 0
	blr	x1
.L260:
	ldr	x1, [x24, 48]
	cbz	x1, .L261
	mov	w0, 0
	blr	x1
	ldr	x1, [x24, 16]
	cbz	x1, .L263
.L285:
	mov	w0, 0
	blr	x1
.L264:
	ldr	x1, [x24, 80]
	cbz	x1, .L259
	mov	w0, 0
	blr	x1
	ldr	x0, .LC211
	add	x1, x0, 256
	ldr	w0, [x0, 256]
	cmp	w0, 1
	bne	.L266
	.p2align 2
.L284:
	mov	w0, 2
	str	w0, [x1, 8]
	bl	VCTRL_StopTask.part.15
	b	.L266
.L261:
	ldr	x1, .LC207
	mov	w2, 345
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x1, [x24, 16]
	cbnz	x1, .L285
	.p2align 2
.L263:
	ldr	x1, .LC207
	mov	w2, 350
	mov	w0, 0
	bl	dprint_vfmw
	b	.L264
	.p2align 3
.L245:
	ldr	x1, .LC207
	mov	w2, 247
	mov	w0, 0
	bl	dprint_vfmw
	b	.L246
	.size	VCTRL_Suspend, .-VCTRL_Suspend
	.align	3
.LC205:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC206:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC207:
	.xword	.LC127
	.align	3
.LC209:
	.xword	.LC208
	.align	3
.LC210:
	.xword	g_HalDisable
	.align	3
.LC211:
	.xword	.LANCHOR1
	.align	3
.LC213:
	.xword	.LC212
	.align	3
.LC215:
	.xword	.LC214
	.align	3
.LC217:
	.xword	.LC216
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
	ldr	x1, .LC220
	mov	x2, x19
	mov	w0, 22
	bl	dprint_vfmw
	bl	VCTRL_Suspend
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestSuspend, .-VfmwProc_TestSuspend
	.align	3
.LC220:
	.xword	.LC219
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Resume
	.type	VCTRL_Resume, %function
VCTRL_Resume:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC221
	ldr	x0, [x20]
	blr	x0
	mov	w19, w0
	ldr	x0, .LC222
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L307
.L288:
	mov	w0, 0
	bl	SCDDRV_ExitSleep
	mov	w0, 0
	bl	VDMDRV_ExitSleep
	ldr	x0, .LC225
	add	x1, x0, 256
	ldr	w0, [x0, 256]
	cmp	w0, 1
	beq	.L308
.L298:
	ldr	x0, [x20]
	blr	x0
	cmp	w19, w0
	sub	w2, w0, w19
	bls	.L300
	mvn	w2, w19
	add	w2, w2, w0
.L300:
	ldr	x1, .LC227
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L307:
	ldr	x21, .LC223
	ldr	x1, [x21, 8]
	cbz	x1, .L309
	mov	w0, 0
	blr	x1
.L290:
	ldr	x1, [x21, 40]
	cbz	x1, .L310
	mov	w0, 0
	blr	x1
.L292:
	ldr	x1, [x21, 56]
	cbz	x1, .L293
	mov	w0, 0
	blr	x1
.L293:
	ldr	x1, [x21, 72]
	cbz	x1, .L294
	mov	w0, 0
	blr	x1
.L294:
	ldr	x1, [x21, 136]
	cbz	x1, .L295
	mov	w0, 0
	blr	x1
.L296:
	ldr	x0, [x21, 144]
	cbz	x0, .L297
	blr	x0
	b	.L288
	.p2align 3
.L308:
	str	w0, [x1, 8]
	bl	VCTRL_StartTask.part.16
	b	.L298
	.p2align 3
.L310:
	ldr	x1, .LC224
	mov	w2, 392
	mov	w0, 0
	bl	dprint_vfmw
	b	.L292
	.p2align 3
.L295:
	ldr	x1, .LC224
	mov	w2, 399
	mov	w0, 0
	bl	dprint_vfmw
	b	.L296
	.p2align 3
.L297:
	ldr	x1, .LC224
	mov	w2, 400
	mov	w0, 0
	bl	dprint_vfmw
	b	.L288
	.p2align 3
.L309:
	ldr	x1, .LC224
	mov	w2, 387
	mov	w0, 0
	bl	dprint_vfmw
	b	.L290
	.size	VCTRL_Resume, .-VCTRL_Resume
	.align	3
.LC221:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC222:
	.xword	g_HalDisable
	.align	3
.LC223:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC224:
	.xword	.LC127
	.align	3
.LC225:
	.xword	.LANCHOR1
	.align	3
.LC227:
	.xword	.LC226
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
	ldr	x1, .LC229
	mov	x2, x19
	mov	w0, 22
	bl	dprint_vfmw
	bl	VCTRL_Resume
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestResume, .-VfmwProc_TestResume
	.align	3
.LC229:
	.xword	.LC219
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ChanCtx_Init
	.type	ChanCtx_Init, %function
ChanCtx_Init:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC233
	ldr	x0, .LC232
	mov	x2, 384
	mov	w1, 0
	ldr	x3, [x0, 96]
	mov	x0, x19
	blr	x3
	add	x0, x19, 128
	add	x1, x19, 256
	mov	w2, -1
	.p2align 2
.L313:
	str	w2, [x0], 4
	cmp	x0, x1
	bne	.L313
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ChanCtx_Init, .-ChanCtx_Init
	.align	3
.LC232:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC233:
	.xword	g_ChanCtx
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
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	cmp	w21, 11
	bhi	.L321
	ldr	x22, .LC239
	uxtw	x20, w21
	ldrb	w0, [x22, x20]
	cmp	w0, 14
	mov	w19, w0
	bhi	.L322
	cmp	w21, 10
	beq	.L323
.L320:
	ldr	x0, .LC241
	ldr	x0, [x0, 8]
	blr	x0
	lsl	x1, x20, 4
	ldr	x2, .LC242
	sub	x1, x1, x20
	add	x19, x1, x19, sxtw
	ldrb	w1, [x22, x20]
	add	w1, w1, 1
	strb	w1, [x22, x20]
	str	w0, [x2, x19, lsl 2]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L322:
	strb	wzr, [x22, x20]
	cmp	w21, 10
	mov	w19, 0
	bne	.L320
.L323:
	ldr	x0, .LC240
	mov	w1, 1
	strb	w1, [x0, 2824]
	b	.L320
	.p2align 3
.L321:
	ldr	x2, .LC236
	mov	w4, w21
	ldr	x1, .LC238
	mov	w3, 641
	add	x2, x2, 48
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VCTRL_RecordPosTime, .-VCTRL_RecordPosTime
	.align	3
.LC236:
	.xword	.LANCHOR0
	.align	3
.LC238:
	.xword	.LC237
	.align	3
.LC239:
	.xword	g_TimeRecId
	.align	3
.LC240:
	.xword	.LANCHOR1
	.align	3
.LC241:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC242:
	.xword	g_TimeRecTable
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
	bhi	.L329
	ldr	x3, .LC246
	ldrb	w0, [x3, x19]
	cmp	w0, 14
	bhi	.L328
	add	w4, w0, 1
	uxtb	w4, w4
.L327:
	lsl	x2, x19, 4
	ldr	x1, .LC247
	sub	x2, x2, x19
	strb	w4, [x3, x19]
	add	x0, x2, x0, sxtw
	str	w20, [x1, x0, lsl 2]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L328:
	mov	w4, 1
	mov	w0, 0
	b	.L327
	.p2align 3
.L329:
	ldr	x2, .LC243
	mov	w4, w19
	ldr	x1, .LC245
	mov	w3, 664
	add	x2, x2, 72
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_RecordData, .-VCTRL_RecordData
	.align	3
.LC243:
	.xword	.LANCHOR0
	.align	3
.LC245:
	.xword	.LC244
	.align	3
.LC246:
	.xword	g_DataRecId
	.align	3
.LC247:
	.xword	g_DataTable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Isr_1
	.type	VCTRL_Isr_1, %function
VCTRL_Isr_1:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1
	bl	VDMDRV_IsrProcess
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_Isr_1, .-VCTRL_Isr_1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Isr_2
	.type	VCTRL_Isr_2, %function
VCTRL_Isr_2:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 2
	bl	VDMDRV_IsrProcess
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_Isr_2, .-VCTRL_Isr_2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Scd_Isr_1
	.type	VCTRL_Scd_Isr_1, %function
VCTRL_Scd_Isr_1:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1
	bl	SM_SCDIntServeProc
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_Scd_Isr_1, .-VCTRL_Scd_Isr_1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Scd_Isr_2
	.type	VCTRL_Scd_Isr_2, %function
VCTRL_Scd_Isr_2:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 2
	bl	SM_SCDIntServeProc
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_Scd_Isr_2, .-VCTRL_Scd_Isr_2
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
	ldr	x1, .LC248
	mov	w0, 0
	ldr	x1, [x1, 256]
	blr	x1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_InformVdmFree, .-VCTRL_InformVdmFree
	.align	3
.LC248:
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
	ldr	x1, .LC249
	mov	w0, 0
	ldr	x1, [x1, 256]
	blr	x1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_ExtraWakeUpThread, .-VCTRL_ExtraWakeUpThread
	.align	3
.LC249:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetMoreGapEnable
	.type	VCTRL_SetMoreGapEnable, %function
VCTRL_SetMoreGapEnable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 31
	bhi	.L342
	ldr	x0, .LC253
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L343
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L344
	cmp	w20, 1
	bhi	.L341
	str	w20, [x0, 1336]
	mov	w0, 0
.L338:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L341:
	str	wzr, [x0, 1336]
	mov	w0, -1
	b	.L338
	.p2align 3
.L344:
	ldr	x2, .LC251
	mov	w3, 801
	ldr	x4, .LC256
	mov	w0, 0
	ldr	x1, .LC252
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L338
	.p2align 3
.L342:
	ldr	x2, .LC251
	mov	w3, 799
	ldr	x4, .LC250
	mov	w0, 0
	ldr	x1, .LC252
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L338
.L343:
	ldr	x2, .LC251
	mov	w3, 800
	ldr	x4, .LC254
	ldr	x1, .LC252
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L338
	.size	VCTRL_SetMoreGapEnable, .-VCTRL_SetMoreGapEnable
	.align	3
.LC250:
	.xword	.LC198
	.align	3
.LC251:
	.xword	.LANCHOR0
	.align	3
.LC252:
	.xword	.LC6
	.align	3
.LC253:
	.xword	.LANCHOR1
	.align	3
.LC254:
	.xword	.LC9
	.align	3
.LC256:
	.xword	.LC255
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
	cbz	x20, .L353
	cbz	w19, .L349
	cmp	w19, 1
	beq	.L350
	ldr	x2, .LC259
	mov	w3, w19
	ldr	x1, .LC263
	mov	w0, 0
	add	x2, x2, 120
	bl	dprint_vfmw
	mov	w0, -1
.L347:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L350:
	ldr	x1, .LC261
	mov	w0, 0
	str	x20, [x1, 584]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L349:
	ldr	x1, .LC261
	mov	w0, 0
	str	x20, [x1, 576]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L353:
	ldr	x2, .LC259
	mov	w3, 914
	ldr	x4, .LC258
	mov	w0, 0
	ldr	x1, .LC260
	add	x2, x2, 120
	bl	dprint_vfmw
	mov	w0, -1
	b	.L347
	.size	VCTRL_SetCallBack, .-VCTRL_SetCallBack
	.align	3
.LC258:
	.xword	.LC257
	.align	3
.LC259:
	.xword	.LANCHOR0
	.align	3
.LC260:
	.xword	.LC6
	.align	3
.LC261:
	.xword	.LANCHOR1
	.align	3
.LC263:
	.xword	.LC262
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_StopTask
	.type	VCTRL_StopTask, %function
VCTRL_StopTask:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC264
	add	x1, x0, 256
	ldr	w0, [x0, 256]
	cmp	w0, 1
	bne	.L356
	mov	w0, 2
	str	w0, [x1, 8]
	bl	VCTRL_StopTask.part.15
.L355:
	ldp	x29, x30, [sp], 16
	ret
	.p2align 3
.L356:
	mov	w0, -1
	b	.L355
	.size	VCTRL_StopTask, .-VCTRL_StopTask
	.align	3
.LC264:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_StartTask
	.type	VCTRL_StartTask, %function
VCTRL_StartTask:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC266
	add	x1, x0, 256
	ldr	w0, [x0, 256]
	cmp	w0, 1
	bne	.L359
	str	w0, [x1, 8]
	bl	VCTRL_StartTask.part.16
.L358:
	ldp	x29, x30, [sp], 16
	ret
	.p2align 3
.L359:
	mov	w0, -1
	b	.L358
	.size	VCTRL_StartTask, .-VCTRL_StartTask
	.align	3
.LC266:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetStreamInterface
	.type	VCTRL_SetStreamInterface, %function
VCTRL_SetStreamInterface:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x21, x1
	mov	x0, x30
	bl	_mcount
	cbz	x21, .L365
	cmp	w20, 31
	bhi	.L366
	ldr	x19, .LC274
	sxtw	x22, w20
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L367
	ldr	x20, .LC276
	mov	x2, 24
	mov	x1, x21
	add	x0, x0, 192
	add	x19, x19, 2832
	ldr	x3, [x20, 104]
	blr	x3
	lsl	x0, x22, 2
	ldr	x3, [x20, 104]
	sub	x0, x0, x22
	mov	x2, 24
	mov	x1, x21
	add	x0, x19, x0, lsl 3
	blr	x3
	mov	w0, 0
.L362:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L366:
	ldr	x2, .LC270
	mov	w3, 1133
	ldr	x4, .LC273
	mov	w0, 0
	ldr	x1, .LC271
	add	x2, x2, 144
	bl	dprint_vfmw
	mov	w0, -1
	b	.L362
.L367:
	ldr	x2, .LC270
	mov	w3, 1134
	ldr	x4, .LC275
	ldr	x1, .LC271
	add	x2, x2, 144
	bl	dprint_vfmw
	mov	w0, -1
	b	.L362
.L365:
	ldr	x2, .LC270
	mov	w3, 1132
	ldr	x4, .LC269
	mov	w0, 0
	ldr	x1, .LC271
	add	x2, x2, 144
	bl	dprint_vfmw
	mov	w0, -1
	b	.L362
	.size	VCTRL_SetStreamInterface, .-VCTRL_SetStreamInterface
	.align	3
.LC269:
	.xword	.LC268
	.align	3
.LC270:
	.xword	.LANCHOR0
	.align	3
.LC271:
	.xword	.LC6
	.align	3
.LC273:
	.xword	.LC272
	.align	3
.LC274:
	.xword	.LANCHOR1
	.align	3
.LC275:
	.xword	.LC9
	.align	3
.LC276:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetSendStreamAgainFlag
	.type	VCTRL_SetSendStreamAgainFlag, %function
VCTRL_SetSendStreamAgainFlag:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 31
	bhi	.L372
	ldr	x0, .LC281
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L373
	add	x2, x0, 503808
	mov	w0, 0
	str	w20, [x2, 1996]
.L370:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L372:
	ldr	x2, .LC279
	mov	w3, 1145
	ldr	x4, .LC278
	mov	w0, 0
	ldr	x1, .LC280
	add	x2, x2, 176
	bl	dprint_vfmw
	mov	w0, -1
	b	.L370
.L373:
	ldr	x2, .LC279
	mov	w3, 1146
	ldr	x4, .LC282
	ldr	x1, .LC280
	add	x2, x2, 176
	bl	dprint_vfmw
	mov	w0, -1
	b	.L370
	.size	VCTRL_SetSendStreamAgainFlag, .-VCTRL_SetSendStreamAgainFlag
	.align	3
.LC278:
	.xword	.LC272
	.align	3
.LC279:
	.xword	.LANCHOR0
	.align	3
.LC280:
	.xword	.LC6
	.align	3
.LC281:
	.xword	.LANCHOR1
	.align	3
.LC282:
	.xword	.LC9
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetSendStreamAgainFlag
	.type	VCTRL_GetSendStreamAgainFlag, %function
VCTRL_GetSendStreamAgainFlag:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L378
	ldr	x0, .LC286
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L379
	add	x0, x0, 503808
	ldr	w0, [x0, 1996]
.L376:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L378:
	ldr	x2, .LC284
	mov	w3, 1155
	ldr	x4, .LC283
	mov	w0, 0
	ldr	x1, .LC285
	add	x2, x2, 208
	bl	dprint_vfmw
	mov	w0, -1
	b	.L376
.L379:
	ldr	x2, .LC284
	mov	w3, 1156
	ldr	x4, .LC287
	ldr	x1, .LC285
	add	x2, x2, 208
	bl	dprint_vfmw
	mov	w0, -1
	b	.L376
	.size	VCTRL_GetSendStreamAgainFlag, .-VCTRL_GetSendStreamAgainFlag
	.align	3
.LC283:
	.xword	.LC272
	.align	3
.LC284:
	.xword	.LANCHOR0
	.align	3
.LC285:
	.xword	.LC6
	.align	3
.LC286:
	.xword	.LANCHOR1
	.align	3
.LC287:
	.xword	.LC9
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetStreamInterface
	.type	VCTRL_GetStreamInterface, %function
VCTRL_GetStreamInterface:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L384
	ldr	x20, .LC288
	sxtw	x2, w19
	ldr	x1, [x20, w19, sxtw 3]
	cbz	x1, .L384
	ldr	x3, .LC289
	lsl	x0, x2, 2
	sub	x0, x0, x2
	add	x4, x20, 2832
	mov	x2, 24
	add	x1, x1, 192
	ldr	x3, [x3, 120]
	add	x0, x4, x0, lsl 3
	blr	x3
	cbnz	w0, .L385
	ldr	x0, [x20, w19, sxtw 3]
	add	x0, x0, 192
.L381:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L384:
	mov	x0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L385:
	ldr	x1, .LC291
	mov	w3, w19
	mov	w2, 1171
	mov	w0, 0
	bl	dprint_vfmw
	mov	x0, 0
	b	.L381
	.size	VCTRL_GetStreamInterface, .-VCTRL_GetStreamInterface
	.align	3
.LC288:
	.xword	.LANCHOR1
	.align	3
.LC289:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC291:
	.xword	.LC290
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
	cmp	w19, 31
	bhi	.L391
	ldr	x0, .LC296
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L392
	ldr	w2, [x0, 4]
	cmp	w2, 1
	bne	.L393
	mov	x2, 34600
	mov	x1, x20
	movk	x2, 0x1, lsl 16
	add	x0, x0, x2
	bl	GetSegStreamSize
.L388:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L393:
	ldr	x2, .LC294
	mov	w3, 1186
	ldr	x4, .LC300
	mov	w0, 0
	ldr	x1, .LC295
	add	x2, x2, 240
	bl	dprint_vfmw
	mov	w0, -1
	b	.L388
	.p2align 3
.L391:
	ldr	x2, .LC294
	mov	w3, 1184
	ldr	x4, .LC293
	mov	w0, 0
	ldr	x1, .LC295
	add	x2, x2, 240
	bl	dprint_vfmw
	mov	w0, -1
	b	.L388
.L392:
	ldr	x2, .LC294
	mov	w3, 1185
	ldr	x4, .LC298
	ldr	x1, .LC295
	add	x2, x2, 240
	bl	dprint_vfmw
	mov	w0, -1
	b	.L388
	.size	VCTRL_GetStreamSize, .-VCTRL_GetStreamSize
	.align	3
.LC293:
	.xword	.LC198
	.align	3
.LC294:
	.xword	.LANCHOR0
	.align	3
.LC295:
	.xword	.LC6
	.align	3
.LC296:
	.xword	.LANCHOR1
	.align	3
.LC298:
	.xword	.LC297
	.align	3
.LC300:
	.xword	.LC299
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
	cmp	w19, 31
	stp	wzr, wzr, [x29, 40]
	bhi	.L401
	ldr	x0, .LC304
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L402
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L403
	add	x19, x0, 1808
	add	x1, x29, 40
	mov	x0, x19
	bl	GetRawStreamNum
	cbnz	w0, .L400
	add	x1, x29, 44
	mov	x0, x19
	bl	GetRawStreamSize
	cbnz	w0, .L400
	ldr	x1, .LC308
	mov	w0, 22
	ldp	w2, w3, [x29, 40]
	bl	dprint_vfmw
	ldr	w0, [x29, 40]
	cmp	w0, wzr
	ble	.L400
	ldr	w0, [x29, 44]
	cmp	w0, 3
	csetm	w0, le
.L396:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L400:
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L403:
	ldr	x2, .LC302
	mov	w3, 1200
	ldr	x4, .LC306
	mov	w0, 0
	ldr	x1, .LC303
	add	x2, x2, 264
	bl	dprint_vfmw
	mov	w0, -1
	b	.L396
	.p2align 3
.L401:
	ldr	x2, .LC302
	mov	w3, 1198
	ldr	x4, .LC301
	mov	w0, 0
	ldr	x1, .LC303
	add	x2, x2, 264
	bl	dprint_vfmw
	mov	w0, -1
	b	.L396
.L402:
	ldr	x2, .LC302
	mov	w3, 1199
	ldr	x4, .LC305
	ldr	x1, .LC303
	add	x2, x2, 264
	bl	dprint_vfmw
	mov	w0, -1
	b	.L396
	.size	VCTRL_CheckFreshRaw, .-VCTRL_CheckFreshRaw
	.align	3
.LC301:
	.xword	.LC198
	.align	3
.LC302:
	.xword	.LANCHOR0
	.align	3
.LC303:
	.xword	.LC6
	.align	3
.LC304:
	.xword	.LANCHOR1
	.align	3
.LC305:
	.xword	.LC297
	.align	3
.LC306:
	.xword	.LC299
	.align	3
.LC308:
	.xword	.LC307
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
	cmp	w19, 31
	stp	wzr, wzr, [x29, 40]
	bhi	.L409
	ldr	x0, .LC312
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L410
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L411
	mov	x3, 34600
	add	x2, x29, 44
	movk	x3, 0x1, lsl 16
	add	x1, x29, 40
	add	x0, x0, x3
	bl	GetFreshSegStream
	ldr	x1, .LC316
	mov	w0, 22
	ldp	w2, w3, [x29, 40]
	bl	dprint_vfmw
	ldr	w0, [x29, 40]
	cmp	w0, wzr
	csetm	w0, le
.L406:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L411:
	ldr	x2, .LC310
	mov	w3, 1223
	ldr	x4, .LC314
	mov	w0, 0
	ldr	x1, .LC311
	add	x2, x2, 288
	bl	dprint_vfmw
	mov	w0, -1
	b	.L406
	.p2align 3
.L409:
	ldr	x2, .LC310
	mov	w3, 1221
	ldr	x4, .LC309
	mov	w0, 0
	ldr	x1, .LC311
	add	x2, x2, 288
	bl	dprint_vfmw
	mov	w0, -1
	b	.L406
.L410:
	ldr	x2, .LC310
	mov	w3, 1222
	ldr	x4, .LC313
	ldr	x1, .LC311
	add	x2, x2, 288
	bl	dprint_vfmw
	mov	w0, -1
	b	.L406
	.size	VCTRL_CheckFreshSeg, .-VCTRL_CheckFreshSeg
	.align	3
.LC309:
	.xword	.LC198
	.align	3
.LC310:
	.xword	.LANCHOR0
	.align	3
.LC311:
	.xword	.LC6
	.align	3
.LC312:
	.xword	.LANCHOR1
	.align	3
.LC313:
	.xword	.LC297
	.align	3
.LC314:
	.xword	.LC299
	.align	3
.LC316:
	.xword	.LC315
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
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 31
	bhi	.L418
	cbz	x20, .L419
	ldr	x21, .LC322
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L420
	ldr	x3, .LC324
	mov	x1, x20
	mov	x2, 8
	add	x0, x0, 1664
	ldr	x3, [x3, 104]
	blr	x3
	ldr	x1, [x21, w19, sxtw 3]
	ldr	w0, [x1, 1664]
	sub	w0, w0, #1
	cmp	w0, 1
	bls	.L417
	mov	w0, 0
	str	wzr, [x1, 1664]
.L414:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L417:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L418:
	ldr	x2, .LC318
	mov	w3, 1239
	ldr	x4, .LC317
	mov	w0, 0
	ldr	x1, .LC319
	add	x2, x2, 312
	bl	dprint_vfmw
	mov	w0, -1
	b	.L414
.L420:
	ldr	x2, .LC318
	mov	w3, 1241
	ldr	x4, .LC323
	ldr	x1, .LC319
	add	x2, x2, 312
	bl	dprint_vfmw
	mov	w0, -1
	b	.L414
.L419:
	ldr	x2, .LC318
	mov	w3, 1240
	ldr	x4, .LC321
	mov	w0, 0
	ldr	x1, .LC319
	add	x2, x2, 312
	bl	dprint_vfmw
	mov	w0, -1
	b	.L414
	.size	VCTRL_SetDiscardPicParam, .-VCTRL_SetDiscardPicParam
	.align	3
.LC317:
	.xword	.LC198
	.align	3
.LC318:
	.xword	.LANCHOR0
	.align	3
.LC319:
	.xword	.LC6
	.align	3
.LC321:
	.xword	.LC320
	.align	3
.LC322:
	.xword	.LANCHOR1
	.align	3
.LC323:
	.xword	.LC9
	.align	3
.LC324:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_PartitionMemForStdUser
	.type	VCTRL_PartitionMemForStdUser, %function
VCTRL_PartitionMemForStdUser:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w20, w0
	mov	x0, x30
	mov	w23, w1
	mov	w21, w2
	mov	w25, w3
	mov	w26, w4
	bl	_mcount
	ldr	x19, .LC325
	cmp	w23, 31
	ccmp	w21, 31, 4, gt
	ldr	x22, [x19, w20, sxtw 3]
	ble	.L433
	cmp	w25, wzr
	ccmp	w26, wzr, 4, ne
	beq	.L434
	ldr	x24, .LC330
	mov	x2, 20
	mov	w1, 0
	add	x0, x29, 88
	ldr	x3, [x24, 96]
	blr	x3
	strb	wzr, [x29, 89]
	mov	w2, 1
	add	x1, x29, 88
	mov	w0, w20
	strb	wzr, [x29, 90]
	stp	w23, w21, [x29, 92]
	stp	w23, w21, [x29, 100]
	strb	wzr, [x29, 91]
	strb	w2, [x29, 88]
	bl	FSP_ConfigInstance
	mov	w21, w0
	cbnz	w0, .L425
	add	x3, x29, 84
	mov	w2, w26
	mov	w1, w25
	mov	w0, w20
	bl	FSP_ConfigFrameBuf
	cbnz	w0, .L435
	add	x23, x19, 3600
	mov	w0, w20
	mov	x1, x23
	bl	FSP_GetInstInfo
	ldrsb	w0, [x23, 2]
	mov	w1, 16
	cmp	w0, w1
	csel	w0, w0, w1, le
	str	w0, [x22, 596]
	cmp	w0, 2
	ble	.L436
	ldr	w0, [x23, 4]
	add	x20, x22, 528
	ldr	x3, [x24, 96]
	mov	x2, 64
	str	w0, [x22, 592]
	mov	w1, 0
	mov	x0, x20
	blr	x3
	ldr	w0, [x22, 596]
	cmp	w0, wzr
	ble	.L423
	sub	w4, w0, #1
	mov	w3, 92
	mov	x2, 108
	add	x1, x19, 3616
	mov	x0, x20
	umaddl	x2, w4, w3, x2
	add	x3, x23, x2
	.p2align 2
.L430:
	ldr	w2, [x1], 92
	str	w2, [x0], 4
	cmp	x1, x3
	bne	.L430
.L423:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
.L434:
	ldr	x1, .LC329
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L423
.L425:
	ldr	x1, .LC337
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L423
.L435:
	ldr	x1, .LC332
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L423
.L436:
	ldr	x2, .LC333
	mov	w3, 1351
	ldr	x1, .LC335
	mov	w0, 0
	add	x2, x2, 344
	mov	w21, -1
	bl	dprint_vfmw
	b	.L423
.L433:
	ldr	x1, .LC327
	mov	w3, w21
	mov	w2, w23
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L423
	.size	VCTRL_PartitionMemForStdUser, .-VCTRL_PartitionMemForStdUser
	.align	3
.LC325:
	.xword	.LANCHOR1
	.align	3
.LC327:
	.xword	.LC326
	.align	3
.LC329:
	.xword	.LC328
	.align	3
.LC330:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC332:
	.xword	.LC331
	.align	3
.LC333:
	.xword	.LANCHOR0
	.align	3
.LC335:
	.xword	.LC334
	.align	3
.LC337:
	.xword	.LC336
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
	.global	DelAllFrameMemRecord
	.type	DelAllFrameMemRecord, %function
DelAllFrameMemRecord:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	add	x20, x1, 2304
	bl	_mcount
	cbz	x19, .L456
	.p2align 2
.L451:
	ldr	w0, [x19]
	cmp	w0, 255
	beq	.L441
	ldr	w2, [x19, 12]
	ldr	w0, [x19, 32]
	ldr	x1, [x19, 24]
	bl	MEM_DelMemRecord
.L441:
	ldr	w0, [x19, 4]
	cmp	w0, 255
	beq	.L442
	ldr	w2, [x19, 16]
	ldr	w0, [x19, 48]
	ldr	x1, [x19, 40]
	bl	MEM_DelMemRecord
.L442:
	ldr	w0, [x19, 8]
	cmp	w0, 255
	beq	.L443
	ldr	w2, [x19, 20]
	ldr	w0, [x19, 64]
	ldr	x1, [x19, 56]
	bl	MEM_DelMemRecord
.L443:
	add	x19, x19, 72
	cmp	x19, x20
	bne	.L451
	mov	w0, 0
.L440:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L456:
	ldr	x2, .LC343
	mov	w3, 1390
	ldr	x4, .LC342
	mov	w0, 0
	ldr	x1, .LC344
	add	x2, x2, 376
	bl	dprint_vfmw
	mov	w0, -1
	b	.L440
	.size	DelAllFrameMemRecord, .-DelAllFrameMemRecord
	.align	3
.LC342:
	.xword	.LC341
	.align	3
.LC343:
	.xword	.LANCHOR0
	.align	3
.LC344:
	.xword	.LC6
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_FreeChanResource
	.type	VCTRL_FreeChanResource, %function
VCTRL_FreeChanResource:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L486
	ldr	x20, [x19]
	cbz	x20, .L487
	ldr	w0, [x19, 48]
	cmp	w0, 1
	beq	.L462
	ldr	w0, [x20, 16]
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	bl	MEM_DelMemRecord
.L463:
	ldr	w0, [x19, 52]
	cmp	w0, 1
	beq	.L488
.L461:
	ldr	x20, [x19, 8]
	cbz	x20, .L489
	ldr	w0, [x20, 16]
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	bl	MEM_DelMemRecord
	ldr	w0, [x19, 56]
	cmp	w0, 1
	beq	.L490
.L466:
	ldr	x20, [x19, 40]
	cbz	x20, .L491
	ldr	w0, [x20, 16]
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	bl	MEM_DelMemRecord
	ldr	w0, [x20, 16]
	cbnz	w0, .L492
.L468:
	ldr	x20, [x19, 16]
	cbz	x20, .L493
.L469:
	ldr	w0, [x20, 16]
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	bl	MEM_DelMemRecord
	ldr	w0, [x19, 60]
	cmp	w0, 1
	bne	.L470
	ldr	w0, [x20, 16]
	cbnz	w0, .L494
.L470:
	ldr	x1, .LC360
	ldr	x0, [x20, 8]
	ldr	x1, [x1, 328]
	blr	x1
	mov	w0, 0
.L459:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L462:
	ldr	x1, [x19, 24]
	cbz	x1, .L495
	mov	w0, w21
	bl	DelAllFrameMemRecord
	cbz	w0, .L463
	ldr	x1, .LC353
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x19, 52]
	cmp	w0, 1
	bne	.L461
	.p2align 2
.L488:
	ldr	w0, [x20, 16]
	cbz	w0, .L461
	ldr	x1, [x20, 8]
	bl	MEM_ReleaseMemBlock
	b	.L461
	.p2align 3
.L492:
	ldr	x1, [x20, 8]
	bl	MEM_ReleaseMemBlock
	ldr	x20, [x19, 16]
	cbnz	x20, .L469
.L493:
	ldr	x2, .LC345
	mov	w0, 0
	ldr	x1, .LC359
	add	x2, x2, 400
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L490:
	ldr	w0, [x20, 16]
	cbz	w0, .L466
	ldr	x1, [x20, 8]
	bl	MEM_ReleaseMemBlock
	b	.L466
	.p2align 3
.L491:
	ldr	x2, .LC345
	mov	w0, 0
	ldr	x1, .LC357
	add	x2, x2, 400
	bl	dprint_vfmw
	b	.L468
	.p2align 3
.L489:
	ldr	x2, .LC345
	mov	w0, 0
	ldr	x1, .LC355
	add	x2, x2, 400
	bl	dprint_vfmw
	b	.L466
	.p2align 3
.L494:
	ldr	x1, [x20, 8]
	bl	MEM_ReleaseMemBlock
	mov	w0, 0
	b	.L459
	.p2align 3
.L495:
	ldr	x2, .LC345
	mov	w0, 0
	ldr	x1, .LC351
	add	x2, x2, 400
	bl	dprint_vfmw
	b	.L463
	.p2align 3
.L487:
	ldr	x2, .LC345
	mov	w0, 0
	ldr	x1, .LC349
	add	x2, x2, 400
	bl	dprint_vfmw
	b	.L461
.L486:
	ldr	x2, .LC345
	mov	w0, 0
	ldr	x1, .LC347
	add	x2, x2, 400
	bl	dprint_vfmw
	mov	w0, -1
	b	.L459
	.size	VCTRL_FreeChanResource, .-VCTRL_FreeChanResource
	.align	3
.LC345:
	.xword	.LANCHOR0
	.align	3
.LC347:
	.xword	.LC346
	.align	3
.LC349:
	.xword	.LC348
	.align	3
.LC351:
	.xword	.LC350
	.align	3
.LC353:
	.xword	.LC352
	.align	3
.LC355:
	.xword	.LC354
	.align	3
.LC357:
	.xword	.LC356
	.align	3
.LC359:
	.xword	.LC358
	.align	3
.LC360:
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
	cmp	w19, 26
	beq	.L499
	mov	w0, 47888
	movk	w0, 0xf, lsl 16
	str	w0, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L499:
	mov	w0, 18336
	movk	w0, 0xb5, lsl 16
	str	w0, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetChanCtxSize, .-VCTRL_GetChanCtxSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetVfmwChanNum
	.type	VCTRL_GetVfmwChanNum, %function
VCTRL_GetVfmwChanNum:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC361
	mov	w0, 0
	add	x3, x1, 256
	.p2align 2
.L502:
	ldr	x2, [x1], 8
	cmp	x2, xzr
	csinc	w0, w0, w0, eq
	cmp	x1, x3
	bne	.L502
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_GetVfmwChanNum, .-VCTRL_GetVfmwChanNum
	.align	3
.LC361:
	.xword	.LANCHOR1
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
	cmp	w19, 31
	bhi	.L511
	cbz	x20, .L512
	ldr	x0, .LC368
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L513
	ldr	x3, .LC370
	mov	x2, 148
	add	x1, x1, 44
	mov	x0, x20
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L508:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L511:
	ldr	x2, .LC364
	mov	w3, 2604
	ldr	x4, .LC363
	mov	w0, 0
	ldr	x1, .LC365
	add	x2, x2, 424
	bl	dprint_vfmw
	mov	w0, -1
	b	.L508
.L513:
	ldr	x2, .LC364
	mov	w3, 2606
	ldr	x4, .LC369
	mov	w0, 0
	ldr	x1, .LC365
	add	x2, x2, 424
	bl	dprint_vfmw
	mov	w0, -1
	b	.L508
.L512:
	ldr	x2, .LC364
	mov	w3, 2605
	ldr	x4, .LC367
	mov	w0, 0
	ldr	x1, .LC365
	add	x2, x2, 424
	bl	dprint_vfmw
	mov	w0, -1
	b	.L508
	.size	VCTRL_GetChanCfg, .-VCTRL_GetChanCfg
	.align	3
.LC363:
	.xword	.LC198
	.align	3
.LC364:
	.xword	.LANCHOR0
	.align	3
.LC365:
	.xword	.LC6
	.align	3
.LC367:
	.xword	.LC366
	.align	3
.LC368:
	.xword	.LANCHOR1
	.align	3
.LC369:
	.xword	.LC9
	.align	3
.LC370:
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
	ldr	x0, .LC371
	ldr	w1, [x19, 8]
	ldr	x0, [x0, w20, sxtw 3]
	ldr	w2, [x0, 52]
	cmp	w2, w1
	bne	.L526
	ldr	w2, [x0, 72]
	ldr	w1, [x19, 28]
	cmp	w2, w1
	bne	.L526
	ldr	w2, [x0, 68]
	ldr	w1, [x19, 24]
	cmp	w2, w1
	bne	.L526
	ldr	w2, [x0, 76]
	ldr	w1, [x19, 32]
	cmp	w2, w1
	bne	.L526
	ldr	w2, [x0, 80]
	ldr	w1, [x19, 36]
	cmp	w2, w1
	bne	.L526
	ldr	w2, [x0, 84]
	ldr	w1, [x19, 40]
	cmp	w2, w1
	bne	.L526
	ldr	w2, [x0, 100]
	ldr	w1, [x19, 56]
	cmp	w2, w1
	bne	.L526
	ldr	w2, [x0, 112]
	ldr	w1, [x19, 68]
	cmp	w2, w1
	bne	.L526
	ldr	w2, [x0, 108]
	ldr	w1, [x19, 64]
	cmp	w2, w1
	bne	.L526
	ldr	w2, [x0, 104]
	ldr	w1, [x19, 60]
	cmp	w2, w1
	bne	.L526
	ldr	w2, [x0, 116]
	ldr	w1, [x19, 72]
	cmp	w2, w1
	bne	.L526
	ldr	w1, [x0, 176]
	ldr	w0, [x19, 132]
	ldp	x19, x20, [sp, 16]
	cmp	w1, w0
	csetm	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L526:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_CheckCommonParameter, .-VCTRL_CheckCommonParameter
	.align	3
.LC371:
	.xword	.LANCHOR1
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
	ldr	x0, .LC372
	ldr	x19, [x0, w20, sxtw 3]
	ldr	w0, [x19, 672]
	cmp	w0, 22
	beq	.L532
	mov	x1, x21
	mov	w0, w20
	bl	VCTRL_CheckCommonParameter
	cbnz	w0, .L532
	ldr	w1, [x19, 52]
	cmp	w1, 1
	beq	.L533
	sub	w1, w1, #10
	cmp	w1, 2
	bhi	.L528
	ldr	w0, [x21, 12]
	ldr	w1, [x19, 56]
	cmp	w1, w0
	csetm	w0, ne
.L528:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L533:
	ldr	w1, [x19, 56]
	ldr	w0, [x21, 12]
	cmp	w1, w0
	bne	.L532
	ldr	w0, [x21, 16]
	ldr	w1, [x19, 60]
	ldr	x21, [sp, 32]
	cmp	w1, w0
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L532:
	mov	w0, -1
	b	.L528
	.size	VCTRL_CmpConfigParameter, .-VCTRL_CmpConfigParameter
	.align	3
.LC372:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CheckChanWH
	.type	VCTRL_CheckChanWH, %function
VCTRL_CheckChanWH:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, .LC373
	ldr	x2, .LC374
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w2, [x2]
	ldr	w3, [x0, 1412]
	cmp	w3, w2
	bgt	.L535
	ldr	x1, .LC375
	ldr	w3, [x0, 1416]
	mov	w0, 0
	ldr	w1, [x1]
	cmp	w3, w1
	ble	.L536
.L535:
	ldr	w1, [x20, 8]
	mov	w0, 0
	cmp	w1, wzr
	and	w3, w1, -3
	ccmp	w1, 20, 4, ne
	ccmp	w3, 13, 4, ne
	cset	w1, ne
	cbnz	w1, .L540
.L536:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L540:
	ldr	x3, .LC375
	ldr	x1, .LC377
	ldr	w3, [x3]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L536
	.size	VCTRL_CheckChanWH, .-VCTRL_CheckChanWH
	.align	3
.LC373:
	.xword	.LANCHOR1
	.align	3
.LC374:
	.xword	g_ChipMaxWidth
	.align	3
.LC375:
	.xword	g_ChipMaxHeight
	.align	3
.LC377:
	.xword	.LC376
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ConfigChanCompress
	.type	VCTRL_ConfigChanCompress, %function
VCTRL_ConfigChanCompress:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x1
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x20, 56]
	sxtw	x2, w19
	ldr	x1, .LC378
	cmp	w0, 2
	ldr	x0, [x1, w19, sxtw 3]
	beq	.L546
	add	x1, x1, 616
	lsl	x2, x2, 4
	add	x3, x1, x2
	add	x0, x0, 680
	ldr	w2, [x1, x2]
	ldr	w1, [x3, 4]
	str	w2, [x0, 640]
	cmp	w1, 1
	str	w1, [x0, 644]
	beq	.L547
	mov	w1, -1
	str	w1, [x0, 648]
.L545:
	str	w1, [x0, 652]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L547:
	ldp	w2, w1, [x3, 8]
	str	w2, [x0, 648]
	b	.L545
	.p2align 3
.L546:
	add	x2, x0, 1280
	mov	w1, -1
	stp	wzr, wzr, [x2, 40]
	stp	w1, w1, [x2, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_ConfigChanCompress, .-VCTRL_ConfigChanCompress
	.align	3
.LC378:
	.xword	.LANCHOR1
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
	ldr	x0, .LC380
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L554
	ldr	w0, [x0, 672]
	sub	w2, w0, #10
	cmp	w2, 2
	bls	.L555
.L551:
	cmp	w0, 14
	ccmp	w0, 4, 4, ne
	beq	.L553
	mov	x1, x20
	mov	w0, w19
	bl	SM_SeekPts
	cmp	w0, wzr
	csetm	w0, ne
.L550:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L555:
	ldr	x1, .LC384
	ldr	w1, [x1, 2200]
	tbnz	x1, 0, .L551
.L553:
	mov	w0, -1
	b	.L550
.L554:
	ldr	x2, .LC382
	mov	w3, 3004
	ldr	x4, .LC381
	ldr	x1, .LC383
	add	x2, x2, 448
	bl	dprint_vfmw
	mov	w0, -1
	b	.L550
	.size	VCTRL_SeekPts, .-VCTRL_SeekPts
	.align	3
.LC380:
	.xword	.LANCHOR1
	.align	3
.LC381:
	.xword	.LC9
	.align	3
.LC382:
	.xword	.LANCHOR0
	.align	3
.LC383:
	.xword	.LC6
	.align	3
.LC384:
	.xword	.LANCHOR3
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
	cmp	w19, 31
	bhi	.L560
	ldr	x0, .LC389
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L561
	mov	w0, w19
	bl	SM_Reset
	cmp	w0, wzr
	csetm	w0, ne
.L558:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L560:
	ldr	x2, .LC387
	mov	w3, 3249
	ldr	x4, .LC386
	mov	w0, 0
	ldr	x1, .LC388
	add	x2, x2, 464
	bl	dprint_vfmw
	mov	w0, -1
	b	.L558
.L561:
	ldr	x2, .LC387
	mov	w3, 3250
	ldr	x4, .LC391
	ldr	x1, .LC388
	add	x2, x2, 464
	bl	dprint_vfmw
	mov	w0, -1
	b	.L558
	.size	VCTRL_ReleaseStream, .-VCTRL_ReleaseStream
	.align	3
.LC386:
	.xword	.LC385
	.align	3
.LC387:
	.xword	.LANCHOR0
	.align	3
.LC388:
	.xword	.LC6
	.align	3
.LC389:
	.xword	.LANCHOR1
	.align	3
.LC391:
	.xword	.LC390
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ImageOutputEnable
	.type	VCTRL_ImageOutputEnable, %function
VCTRL_ImageOutputEnable:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cmp	w19, 31
	bhi	.L565
	ldr	x20, .LC395
	mov	w0, 4
	ldr	x1, [x20, 24]
	blr	x1
	ldr	x1, .LC396
	mov	w0, 4
	ldr	w2, [x21]
	ldr	x1, [x1, w19, sxtw 3]
	str	w2, [x1, 12]
	ldr	x1, [x20, 32]
	blr	x1
	mov	w0, 0
.L564:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L565:
	ldr	x2, .LC393
	mov	w3, 3319
	ldr	x4, .LC392
	mov	w0, 0
	ldr	x1, .LC394
	add	x2, x2, 488
	bl	dprint_vfmw
	mov	w0, -1
	b	.L564
	.size	VCTRL_ImageOutputEnable, .-VCTRL_ImageOutputEnable
	.align	3
.LC392:
	.xword	.LC198
	.align	3
.LC393:
	.xword	.LANCHOR0
	.align	3
.LC394:
	.xword	.LC6
	.align	3
.LC395:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC396:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_TryToRelSpecialFrm
	.type	VCTRL_TryToRelSpecialFrm, %function
VCTRL_TryToRelSpecialFrm:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	w24, w0
	mov	x0, x30
	mov	w22, w1
	bl	_mcount
	cmp	w24, 31
	bhi	.L600
	ldr	x19, .LC400
	ldr	x1, [x19, w24, sxtw 3]
	cbz	x1, .L601
	add	x0, x1, 507904
	ldr	w3, [x0, 2016]
	cbz	w3, .L570
	ldr	w0, [x0, 1492]
	mov	w2, 0
	cmp	w22, w0
	bne	.L573
	b	.L602
	.p2align 3
.L574:
	add	x0, x0, 3165
	add	x0, x1, x0, lsl 4
	ldr	w0, [x0, 4]
	cmp	w22, w0
	beq	.L571
.L573:
	add	w2, w2, 1
	cmp	w3, w2
	mov	w20, w2
	sxtw	x0, w2
	add	x0, x0, 28672
	bne	.L574
.L570:
	mov	w0, -1
.L593:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L602:
	mov	w20, 0
	.p2align 2
.L571:
	add	x0, x1, 495616
	ldr	w0, [x0, 4024]
	cmp	w0, w22
	beq	.L603
	add	x0, x1, 499712
	mov	w21, 1
	add	x0, x0, 20
	b	.L578
	.p2align 3
.L575:
	add	w21, w21, 1
	cmp	w21, 32
	beq	.L604
.L578:
	ldr	w2, [x0]
	add	x0, x0, 92
	cmp	w22, w2
	bne	.L575
.L581:
	ldr	x25, .LC401
	mov	w0, 3
	sub	w22, w3, #1
	sxtw	x21, w21
	ldr	x1, [x25, 24]
	blr	x1
	lsl	x0, x21, 2
	ldr	x3, [x19, w24, sxtw 3]
	sub	x0, x0, x21
	ldr	x2, [x25, 32]
	lsl	x1, x0, 3
	mov	w0, 3
	sub	x21, x1, x21
	add	x1, x3, x21, lsl 2
	add	x3, x1, 495616
	add	x1, x1, 499712
	strb	wzr, [x3, 4018]
	strb	wzr, [x1, 2866]
	blr	x2
	cmp	w22, w20
	bls	.L585
	sxtw	x21, w24
	uxtw	x23, w20
	.p2align 2
.L577:
	add	w20, w20, 1
	add	x23, x23, 28672
	add	x0, x23, 3165
	ldr	x3, [x19, x21, lsl 3]
	uxtw	x23, w20
	ldr	x4, [x25, 104]
	add	x1, x23, 28672
	mov	x2, 16
	add	x1, x1, 3165
	add	x0, x3, x0, lsl 4
	add	x1, x3, x1, lsl 4
	blr	x4
	cmp	w20, w22
	bcc	.L577
.L576:
	uxtw	x0, w22
	ldr	x4, [x19, w24, sxtw 3]
	add	x0, x0, 28672
	ldr	x3, [x25, 96]
	add	x0, x0, 3165
	mov	x2, 16
	mov	w1, 0
	add	x0, x4, x0, lsl 4
	blr	x3
	ldr	x1, [x19, w24, sxtw 3]
	mov	w0, 0
	add	x1, x1, 507904
	ldr	w2, [x1, 2016]
	sub	w2, w2, #1
	str	w2, [x1, 2016]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L604:
	add	x2, x1, 475136
	ldr	x20, .LC398
	ldr	x1, .LC405
	mov	w3, 3474
	add	x20, x20, 512
	mov	w0, 1
	ldrsb	w4, [x2, 2331]
	mov	x2, x20
	bl	dprint_vfmw
	ldr	x6, [x19, w24, sxtw 3]
	add	x0, x6, 475136
	ldrsb	w0, [x0, 2331]
	cmp	w0, wzr
	ble	.L570
	ldr	x22, .LC403
	mov	w23, 0
	sxtw	x21, w24
	.p2align 2
.L580:
	sxtw	x4, w23
	mov	w0, 1
	lsl	x5, x4, 2
	mov	w3, 3477
	sub	x5, x5, x4
	mov	x2, x20
	lsl	x5, x5, 3
	mov	x1, x22
	sub	x4, x5, x4
	add	w23, w23, w0
	add	x4, x6, x4, lsl 2
	add	x4, x4, 495616
	ldr	w4, [x4, 4024]
	bl	dprint_vfmw
	ldr	x6, [x19, x21, lsl 3]
	add	x0, x6, 475136
	ldrsb	w0, [x0, 2331]
	cmp	w0, w23
	bgt	.L580
	b	.L570
.L600:
	ldr	x2, .LC398
	mov	w3, 3439
	ldr	x4, .LC397
	mov	w0, 0
	ldr	x1, .LC399
	add	x2, x2, 512
	bl	dprint_vfmw
	mov	w0, -1
	b	.L593
.L585:
	mov	w22, w20
	b	.L576
.L603:
	mov	w21, 0
	b	.L581
.L601:
	ldr	x2, .LC398
	mov	w3, 3440
	ldr	x4, .LC397
	mov	w0, 0
	ldr	x1, .LC399
	add	x2, x2, 512
	bl	dprint_vfmw
	mov	w0, -1
	b	.L593
	.size	VCTRL_TryToRelSpecialFrm, .-VCTRL_TryToRelSpecialFrm
	.align	3
.LC397:
	.xword	.LC198
	.align	3
.LC398:
	.xword	.LANCHOR0
	.align	3
.LC399:
	.xword	.LC6
	.align	3
.LC400:
	.xword	.LANCHOR1
	.align	3
.LC401:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC403:
	.xword	.LC402
	.align	3
.LC405:
	.xword	.LC404
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanImage
	.type	VCTRL_GetChanImage, %function
VCTRL_GetChanImage:
	sub	sp, sp, #640
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 31
	bhi	.L636
	ldr	x21, .LC410
	ldr	x0, [x21, w20, sxtw 3]
	cbz	x0, .L637
	cbz	x19, .L638
	ldr	x22, .LC414
	mov	w0, 4
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x0, [x21, w20, sxtw 3]
	cbz	x0, .L639
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L640
	ldr	w1, [x0, 12]
	cmp	w1, 1
	bne	.L641
	add	x0, x0, 507904
	mov	x1, x19
	add	x0, x0, 2088
	bl	SYNTAX_ReceiveImage
	cmp	w0, 1
	mov	w24, w0
	beq	.L642
	mov	w0, 9
	mov	w23, -1
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L625
.L624:
	ldr	x1, [x21, w20, sxtw 3]
	mov	w0, 4
	ldr	x2, [x22, 32]
	add	x1, x1, 524288
	ldrb	w1, [x1, 1600]
	strb	w1, [x19, 392]
	blr	x2
.L634:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, w23
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 640
	ret
	.p2align 3
.L642:
	ldr	w1, [x19, 192]
	mov	w0, -1
	str	w0, [x19, 188]
	cmp	w1, 1
	beq	.L643
.L614:
	mov	w0, 9
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L644
	ldr	x0, [x21, w20, sxtw 3]
	mov	w23, 0
	ldr	w1, [x19, 64]
	str	w1, [x0, 504]
	ldr	w1, [x19, 276]
	str	w1, [x0, 508]
	b	.L624
	.p2align 3
.L648:
	ldr	x0, [x21, w20, sxtw 3]
	add	x1, x29, 64
	add	x0, x0, 507904
	add	x0, x0, 2088
	bl	SYNTAX_ReceiveImage
	cmp	w0, 1
	bne	.L645
	ldr	w0, [x19, 184]
	ldr	w1, [x29, 248]
	cmp	w0, w1
	bge	.L617
	ldp	w3, w4, [x29, 84]
	ldp	w2, w1, [x29, 92]
	ldr	w0, [x29, 212]
	mov	w5, 3
	ldr	w23, [x29, 244]
	mov	w24, 1
	str	w0, [x19, 188]
	stp	w3, w4, [x19, 196]
	stp	w2, w1, [x19, 204]
	str	w5, [x19, 276]
	cbz	w23, .L622
	mov	w23, 0
	str	w24, [x19, 180]
.L622:
	mov	w0, 9
	bl	CHECK_REC_POS_ENABLE
	cbz	w0, .L623
	.p2align 2
.L625:
	ldr	x0, [x22]
	blr	x0
	mov	w3, w0
	ldr	x1, .LC427
	ldr	x0, .LC428
	add	x1, x1, 2208
	ldr	w2, [x0]
	ldr	w0, [x1, w20, sxtw 2]
	sub	w0, w3, w0
	cmp	w0, w2
	bhi	.L646
.L623:
	cbnz	w23, .L624
.L647:
	ldr	x0, [x21, w20, sxtw 3]
	mov	w23, 0
	ldr	w1, [x19, 64]
	str	w1, [x0, 504]
	ldr	w1, [x19, 276]
	str	w1, [x0, 508]
	b	.L624
	.p2align 3
.L644:
	mov	w23, 0
	b	.L625
	.p2align 3
.L646:
	lsl	w2, w20, 24
	ldr	x0, .LC408
	add	w2, w2, 589824
	cmp	w24, 1
	str	w3, [x1, w20, sxtw 2]
	csinc	w2, w2, w2, ne
	add	x0, x0, 568
	mov	w1, 3752
	bl	DBG_AddTrace
	cbz	w23, .L647
	b	.L624
	.p2align 3
.L643:
	ldr	w1, [x19, 180]
	cbz	w1, .L648
	ldp	w2, w3, [x19, 20]
	mov	w1, 3
	str	w24, [x19, 180]
	str	w0, [x19, 188]
	stp	w2, w3, [x19, 196]
	str	w1, [x19, 276]
	b	.L614
	.p2align 3
.L641:
	ldr	x1, [x22, 32]
	mov	w0, 4
	mov	w23, -1
	blr	x1
	ldr	x2, .LC408
	mov	w0, 0
	ldr	x1, .LC420
	add	x2, x2, 544
	bl	dprint_vfmw
	b	.L634
	.p2align 3
.L640:
	ldr	x1, [x22, 32]
	mov	w0, 4
	mov	w23, -1
	blr	x1
	ldr	x1, .LC418
	mov	w2, w20
	mov	w0, 0
	bl	dprint_vfmw
	b	.L634
	.p2align 3
.L636:
	ldr	x2, .LC408
	mov	w3, 3599
	ldr	x4, .LC407
	mov	w0, 0
	ldr	x1, .LC409
	add	x2, x2, 544
	mov	w23, -1
	bl	dprint_vfmw
	b	.L634
	.p2align 3
.L645:
	ldr	x1, [x21, w20, sxtw 3]
	mov	w23, w0
	add	x0, x1, 507904
	add	x0, x0, 2088
	bl	SYNTAX_ReturnImage
	ldr	x1, [x22, 32]
	mov	w0, 4
	blr	x1
	b	.L634
.L617:
	bgt	.L649
	cbnz	w0, .L620
	ldr	x0, [x21, w20, sxtw 3]
	mov	w23, -1
	mov	w24, -2
	add	x0, x0, 507904
	add	x0, x0, 2088
	bl	SYNTAX_ReturnImage
	ldr	x0, [x21, w20, sxtw 3]
	mov	x1, x19
	add	x0, x0, 507904
	add	x0, x0, 2088
	bl	SYNTAX_ReleaseImage
	ldr	x2, .LC408
	mov	w0, 1
	ldr	x1, .LC424
	ldr	w3, [x19, 184]
	add	x2, x2, 544
	bl	dprint_vfmw
	b	.L622
.L638:
	ldr	x2, .LC408
	mov	w3, 3601
	ldr	x4, .LC413
	mov	w0, 0
	ldr	x1, .LC409
	add	x2, x2, 544
	mov	w23, -1
	bl	dprint_vfmw
	b	.L634
.L620:
	ldr	x0, [x21, w20, sxtw 3]
	mov	x1, x19
	add	x0, x0, 507904
	add	x0, x0, 2088
	bl	SYNTAX_ReleaseImage
	ldr	w0, [x29, 244]
	cbz	w0, .L650
	ldr	x2, .LC408
	mov	w0, 1
	ldr	x1, .LC426
	ldr	w3, [x19, 184]
	add	x2, x2, 544
	bl	dprint_vfmw
	ldr	x3, [x22, 104]
	mov	x2, 640
	add	x1, x29, 64
	mov	x0, x19
	blr	x3
	ldp	w3, w4, [x29, 84]
	mov	w2, -1
	mov	w1, 3
	mov	w0, 1
	str	w2, [x19, 188]
	str	w0, [x19, 180]
	stp	w3, w4, [x19, 196]
	str	w1, [x19, 276]
	b	.L614
.L649:
	ldr	x0, [x21, w20, sxtw 3]
	mov	w23, -1
	mov	w24, -2
	add	x0, x0, 507904
	add	x0, x0, 2088
	bl	SYNTAX_ReturnImage
	ldr	x0, [x21, w20, sxtw 3]
	mov	x1, x19
	add	x0, x0, 507904
	add	x0, x0, 2088
	bl	SYNTAX_ReleaseImage
	ldr	x2, .LC408
	mov	w0, 1
	ldr	x1, .LC422
	ldr	w3, [x19, 184]
	add	x2, x2, 544
	ldr	w4, [x29, 248]
	bl	dprint_vfmw
	b	.L622
.L637:
	ldr	x2, .LC408
	mov	w3, 3600
	ldr	x4, .LC411
	mov	w23, -1
	ldr	x1, .LC409
	add	x2, x2, 544
	bl	dprint_vfmw
	b	.L634
.L639:
	ldr	x1, [x22, 32]
	mov	w0, 4
	mov	w23, -1
	blr	x1
	ldr	x1, .LC416
	mov	w2, 3608
	mov	w0, 0
	bl	dprint_vfmw
	b	.L634
.L650:
	ldr	x0, [x21, w20, sxtw 3]
	add	x1, x29, 64
	mov	w23, -1
	mov	w24, -2
	add	x0, x0, 507904
	add	x0, x0, 2088
	bl	SYNTAX_ReleaseImage
	ldr	x2, .LC408
	mov	w0, 1
	ldr	x1, .LC426
	ldr	w3, [x19, 184]
	add	x2, x2, 544
	bl	dprint_vfmw
	b	.L622
	.size	VCTRL_GetChanImage, .-VCTRL_GetChanImage
	.align	3
.LC407:
	.xword	.LC198
	.align	3
.LC408:
	.xword	.LANCHOR0
	.align	3
.LC409:
	.xword	.LC6
	.align	3
.LC410:
	.xword	.LANCHOR1
	.align	3
.LC411:
	.xword	.LC9
	.align	3
.LC413:
	.xword	.LC412
	.align	3
.LC414:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC416:
	.xword	.LC415
	.align	3
.LC418:
	.xword	.LC417
	.align	3
.LC420:
	.xword	.LC419
	.align	3
.LC422:
	.xword	.LC421
	.align	3
.LC424:
	.xword	.LC423
	.align	3
.LC426:
	.xword	.LC425
	.align	3
.LC427:
	.xword	.LANCHOR3
	.align	3
.LC428:
	.xword	g_TraceImgPeriod
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ReleaseChanImage
	.type	VCTRL_ReleaseChanImage, %function
VCTRL_ReleaseChanImage:
	sub	sp, sp, #640
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 31
	bhi	.L672
	ldr	x21, .LC433
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L673
	ldr	w0, [x0, 4]
	cmp	w0, 1
	bne	.L674
	cbz	x20, .L675
	ldr	x22, .LC438
	mov	w0, 4
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L676
	ldr	w0, [x0, 4]
	cmp	w0, 1
	bne	.L677
	ldr	w1, [x20, 20]
	mov	w0, w19
	bl	VCTRL_TryToRelSpecialFrm
	cbz	w0, .L678
	ldr	x0, [x21, w19, sxtw 3]
	mov	x1, x20
	add	x0, x0, 507904
	add	x0, x0, 2088
	bl	SYNTAX_ReleaseImage
	mov	w23, w0
	ldr	w2, [x20, 188]
	cmn	w2, #1
	beq	.L660
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x29, 64
	str	w2, [x29, 212]
	add	x0, x0, 507904
	add	x0, x0, 2088
	bl	SYNTAX_ReleaseImage
	mov	w23, w0
.L660:
	mov	w0, 10
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L679
.L662:
	cmp	w23, 1
	csetm	w19, ne
	cbnz	w19, .L680
.L664:
	ldr	x1, [x22, 32]
	mov	w0, 4
	blr	x1
.L653:
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 640
	ret
	.p2align 3
.L678:
	ldr	x1, [x22, 32]
	mov	w0, 4
	mov	w19, 0
	blr	x1
	ldr	x1, .LC443
	mov	w2, 3825
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	ldp	x21, x22, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 640
	ret
	.p2align 3
.L680:
	ldr	x2, .LC431
	mov	w0, 0
	ldr	x1, .LC447
	add	x2, x2, 592
	bl	dprint_vfmw
	b	.L664
	.p2align 3
.L679:
	ldr	x0, [x22]
	blr	x0
	mov	w4, w0
	ldr	x3, .LC444
	ldr	x0, .LC445
	add	x3, x3, 2336
	ldr	w1, [x0]
	ldr	w0, [x3, w19, sxtw 2]
	sub	w0, w4, w0
	cmp	w0, w1
	bls	.L662
	lsl	w2, w19, 24
	ldr	x0, .LC431
	cmp	w23, 1
	add	w2, w2, 655360
	csinc	w2, w2, w2, ne
	mov	w1, 3854
	add	x0, x0, 616
	str	w4, [x3, w19, sxtw 2]
	bl	DBG_AddTrace
	b	.L662
	.p2align 3
.L677:
	ldr	x1, .LC441
	mov	w2, 3813
	mov	w0, 0
.L671:
	bl	dprint_vfmw
	mov	w19, -1
	ldr	x1, [x22, 32]
	mov	w0, 4
	blr	x1
	b	.L653
	.p2align 3
.L674:
	ldr	x2, .LC431
	mov	w3, 3797
	ldr	x4, .LC436
	mov	w0, 0
	ldr	x1, .LC432
	add	x2, x2, 592
	mov	w19, -1
	bl	dprint_vfmw
	b	.L653
	.p2align 3
.L672:
	ldr	x2, .LC431
	mov	w3, 3795
	ldr	x4, .LC430
	mov	w0, 0
	ldr	x1, .LC432
	add	x2, x2, 592
	mov	w19, -1
	bl	dprint_vfmw
	b	.L653
.L675:
	ldr	x2, .LC431
	mov	w3, 3798
	ldr	x4, .LC437
	mov	w0, 0
	ldr	x1, .LC432
	add	x2, x2, 592
	mov	w19, -1
	bl	dprint_vfmw
	b	.L653
.L673:
	ldr	x2, .LC431
	mov	w3, 3796
	ldr	x4, .LC434
	mov	w19, -1
	ldr	x1, .LC432
	add	x2, x2, 592
	bl	dprint_vfmw
	b	.L653
.L676:
	ldr	x1, .LC439
	mov	w2, 3804
	b	.L671
	.size	VCTRL_ReleaseChanImage, .-VCTRL_ReleaseChanImage
	.align	3
.LC430:
	.xword	.LC198
	.align	3
.LC431:
	.xword	.LANCHOR0
	.align	3
.LC432:
	.xword	.LC6
	.align	3
.LC433:
	.xword	.LANCHOR1
	.align	3
.LC434:
	.xword	.LC9
	.align	3
.LC436:
	.xword	.LC435
	.align	3
.LC437:
	.xword	.LC412
	.align	3
.LC438:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC439:
	.xword	.LC415
	.align	3
.LC441:
	.xword	.LC440
	.align	3
.LC443:
	.xword	.LC442
	.align	3
.LC444:
	.xword	.LANCHOR3
	.align	3
.LC445:
	.xword	g_TraceImgPeriod
	.align	3
.LC447:
	.xword	.LC446
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
	cmp	w19, 31
	bhi	.L682
	ldr	x0, .LC449
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L682
	ldr	w1, [x0, 4]
	cmp	w1, 1
	beq	.L685
	ldr	x1, .LC453
	mov	w3, w19
	mov	w2, 3881
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 22
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L682:
	ldr	x1, .LC451
	mov	w2, 3875
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 22
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L685:
	ldr	w0, [x0, 672]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetVidStd, .-VCTRL_GetVidStd
	.align	3
.LC449:
	.xword	.LANCHOR1
	.align	3
.LC451:
	.xword	.LC450
	.align	3
.LC453:
	.xword	.LC452
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetHDRConfigInfo
	.type	VCTRL_GetHDRConfigInfo, %function
VCTRL_GetHDRConfigInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 31
	bhi	.L691
	ldr	x0, .LC457
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L692
	cbz	x20, .L693
	ldrb	w1, [x1, 44]
	strb	w1, [x20, 65]
	ldr	x1, [x0, w19, sxtw 3]
	ldrb	w1, [x1, 46]
	strb	w1, [x20, 66]
	ldr	x1, [x0, w19, sxtw 3]
	ldr	w1, [x1, 156]
	str	w1, [x20, 76]
	ldr	x1, [x0, w19, sxtw 3]
	ldr	w1, [x1, 160]
	str	w1, [x20, 68]
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w0, [x0, 164]
	str	w0, [x20, 72]
.L686:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L691:
	ldr	x2, .LC455
	mov	w3, 3890
	ldr	x4, .LC454
	mov	w0, 0
	ldr	x1, .LC456
	add	x2, x2, 640
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L692:
	ldr	x2, .LC455
	mov	w3, 3891
	ldr	x4, .LC458
	mov	w0, 0
	ldr	x1, .LC456
	add	x2, x2, 640
	bl	dprint_vfmw
	b	.L686
	.p2align 3
.L693:
	ldr	x2, .LC455
	mov	w3, 3892
	ldr	x4, .LC460
	mov	w0, 0
	ldr	x1, .LC456
	add	x2, x2, 640
	bl	dprint_vfmw
	b	.L686
	.size	VCTRL_GetHDRConfigInfo, .-VCTRL_GetHDRConfigInfo
	.align	3
.LC454:
	.xword	.LC198
	.align	3
.LC455:
	.xword	.LANCHOR0
	.align	3
.LC456:
	.xword	.LC6
	.align	3
.LC457:
	.xword	.LANCHOR1
	.align	3
.LC458:
	.xword	.LC9
	.align	3
.LC460:
	.xword	.LC459
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
	cmp	w19, 31
	bhi	.L717
	ldr	x0, .LC461
	ldr	x20, [x0, w19, sxtw 3]
	cbz	x20, .L717
	ldr	w0, [x20, 4]
	mov	x1, 0
	cmp	w0, 1
	bne	.L695
	ldr	w0, [x20, 8]
	cmp	w0, 1
	bne	.L695
	ldr	w3, [x20, 672]
	cmp	w3, 18
	bls	.L718
.L696:
	ldr	x2, .LC463
	mov	w0, 0
	ldr	x1, .LC465
	add	x2, x2, 664
	bl	dprint_vfmw
	mov	x1, 0
	b	.L695
	.p2align 3
.L717:
	mov	x1, 0
.L695:
	mov	x0, x1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L718:
	ldr	x0, .LC462
	ldrb	w0, [x0,w3,uxtw]
	adr	x1, .Lrtx698
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx698:
	.section	.rodata
	.align	0
	.align	2
.L698:
	.byte	(.L697 - .Lrtx698) / 4
	.byte	(.L706 - .Lrtx698) / 4
	.byte	(.L700 - .Lrtx698) / 4
	.byte	(.L706 - .Lrtx698) / 4
	.byte	(.L696 - .Lrtx698) / 4
	.byte	(.L706 - .Lrtx698) / 4
	.byte	(.L703 - .Lrtx698) / 4
	.byte	(.L696 - .Lrtx698) / 4
	.byte	(.L706 - .Lrtx698) / 4
	.byte	(.L706 - .Lrtx698) / 4
	.byte	(.L706 - .Lrtx698) / 4
	.byte	(.L706 - .Lrtx698) / 4
	.byte	(.L706 - .Lrtx698) / 4
	.byte	(.L706 - .Lrtx698) / 4
	.byte	(.L696 - .Lrtx698) / 4
	.byte	(.L708 - .Lrtx698) / 4
	.byte	(.L709 - .Lrtx698) / 4
	.byte	(.L706 - .Lrtx698) / 4
	.byte	(.L711 - .Lrtx698) / 4
	.text
	.p2align 3
.L706:
	add	x0, x20, 507904
	ldr	x19, [x0, 2104]
.L712:
	cbz	x19, .L717
	ldr	x0, .LC466
	ldr	x0, [x0]
	blr	x0
	str	w0, [x20, 40]
	mov	x1, x19
	mov	x0, x1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L703:
	add	x0, x20, 507904
	ldr	x19, [x0, 2120]
	b	.L712
	.p2align 3
.L708:
	add	x0, x20, 507904
	ldr	x19, [x0, 2328]
	b	.L712
	.p2align 3
.L709:
	add	x0, x20, 512000
	ldr	x19, [x0, 1056]
	b	.L712
	.p2align 3
.L700:
	add	x0, x20, 507904
	ldr	x19, [x0, 3136]
	b	.L712
	.p2align 3
.L711:
	add	x0, x20, 507904
	ldr	x19, [x0, 2144]
	b	.L712
	.p2align 3
.L697:
	add	x0, x20, 507904
	ldr	x19, [x0, 2712]
	b	.L712
	.size	VCTRL_GetDecParam, .-VCTRL_GetDecParam
	.align	3
.LC461:
	.xword	.LANCHOR1
	.align	3
.LC462:
	.xword	.L698
	.align	3
.LC463:
	.xword	.LANCHOR0
	.align	3
.LC465:
	.xword	.LC464
	.align	3
.LC466:
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
	cbz	x19, .L727
	cbz	w20, .L722
	cmp	w20, 16
	beq	.L723
	mov	w0, 0
.L721:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L723:
	ldr	w0, [x19, 5188]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	uxtb	w0, w0
	ret
	.p2align 3
.L722:
	ldrb	w0, [x19, 1188]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L727:
	ldr	x1, .LC468
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L721
	.size	VCTRL_IsSedOnlyMode, .-VCTRL_IsSedOnlyMode
	.align	3
.LC468:
	.xword	.LC467
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
	cmp	w19, 31
	bhi	.L746
	ldr	x0, .LC473
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w1, [x0, 672]
	cmp	w1, 18
	bls	.L747
.L728:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L747:
	ldr	x2, .LC474
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx732
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx732:
	.section	.rodata
	.align	0
	.align	2
.L732:
	.byte	(.L731 - .Lrtx732) / 4
	.byte	(.L741 - .Lrtx732) / 4
	.byte	(.L734 - .Lrtx732) / 4
	.byte	(.L741 - .Lrtx732) / 4
	.byte	(.L728 - .Lrtx732) / 4
	.byte	(.L741 - .Lrtx732) / 4
	.byte	(.L737 - .Lrtx732) / 4
	.byte	(.L728 - .Lrtx732) / 4
	.byte	(.L741 - .Lrtx732) / 4
	.byte	(.L741 - .Lrtx732) / 4
	.byte	(.L741 - .Lrtx732) / 4
	.byte	(.L741 - .Lrtx732) / 4
	.byte	(.L741 - .Lrtx732) / 4
	.byte	(.L741 - .Lrtx732) / 4
	.byte	(.L728 - .Lrtx732) / 4
	.byte	(.L742 - .Lrtx732) / 4
	.byte	(.L743 - .Lrtx732) / 4
	.byte	(.L741 - .Lrtx732) / 4
	.byte	(.L745 - .Lrtx732) / 4
	.text
	.p2align 3
.L741:
	add	x0, x0, 507904
	str	xzr, [x0, 2104]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L746:
	ldr	x4, .LC470
	mov	w3, 4340
	ldr	x2, .LC471
	mov	w0, 0
	ldr	x1, .LC472
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L737:
	add	x0, x0, 507904
	str	xzr, [x0, 2120]
	b	.L728
	.p2align 3
.L742:
	add	x0, x0, 507904
	str	xzr, [x0, 2328]
	b	.L728
	.p2align 3
.L743:
	add	x0, x0, 512000
	str	xzr, [x0, 1056]
	b	.L728
	.p2align 3
.L734:
	add	x0, x0, 507904
	str	xzr, [x0, 3136]
	b	.L728
	.p2align 3
.L745:
	add	x0, x0, 507904
	str	xzr, [x0, 2144]
	b	.L728
	.p2align 3
.L731:
	add	x0, x0, 507904
	str	xzr, [x0, 2712]
	b	.L728
	.size	VCTRL_ClearDecparam, .-VCTRL_ClearDecparam
	.align	3
.LC470:
	.xword	.LC469
	.align	3
.LC471:
	.xword	.LANCHOR4
	.align	3
.LC472:
	.xword	.LC6
	.align	3
.LC473:
	.xword	.LANCHOR1
	.align	3
.LC474:
	.xword	.L732
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
	mov	w19, w0
	mov	x0, x30
	mov	w21, w1
	bl	_mcount
	cmp	w19, 31
	bhi	.L758
	ldr	x20, .LC479
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L759
	ldr	w0, [x0, 8]
	cmp	w0, 1
	beq	.L752
	ldr	x2, .LC477
	mov	w3, 4420
	ldr	x4, .LC482
	mov	w0, 0
	ldr	x1, .LC478
	add	x2, x2, 24
	bl	dprint_vfmw
.L748:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L752:
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbz	x0, .L748
	ldr	x0, [x20, w19, sxtw 3]
	ldr	w1, [x0, 672]
	cbz	w1, .L753
	cmp	w1, 16
	bne	.L748
	add	x0, x0, 507904
	mov	w1, w21
	add	x0, x0, 2096
	bl	HEVCDEC_VDMProcSedOnly
	b	.L748
	.p2align 3
.L758:
	ldr	x2, .LC477
	mov	w3, 4418
	ldr	x4, .LC476
	mov	w0, 0
	ldr	x1, .LC478
	add	x2, x2, 24
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L753:
	add	x0, x0, 507904
	mov	w1, w21
	add	x0, x0, 2096
	bl	H264DEC_VDMProcSedOnly
	b	.L748
	.p2align 3
.L759:
	ldr	x2, .LC477
	mov	w3, 4419
	ldr	x4, .LC480
	ldr	x1, .LC478
	add	x2, x2, 24
	bl	dprint_vfmw
	b	.L748
	.size	VCTRL_VdmProcSedOnly, .-VCTRL_VdmProcSedOnly
	.align	3
.LC476:
	.xword	.LC475
	.align	3
.LC477:
	.xword	.LANCHOR4
	.align	3
.LC478:
	.xword	.LC6
	.align	3
.LC479:
	.xword	.LANCHOR1
	.align	3
.LC480:
	.xword	.LC435
	.align	3
.LC482:
	.xword	.LC481
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
	cmp	w19, 31
	bhi	.L784
	ldr	x0, .LC486
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L785
	ldr	w0, [x1, 8]
	cmp	w0, 1
	bne	.L786
	ldr	w2, [x1, 672]
	cmp	w2, 18
	bls	.L787
.L780:
	mov	w0, 0
	b	.L762
	.p2align 3
.L787:
	ldr	x3, .LC489
	ldrb	w2, [x3,w2,uxtw]
	adr	x3, .Lrtx766
	add	x2, x3, w2, sxtb #2
	br	x2
.Lrtx766:
	.section	.rodata
	.align	0
	.align	2
.L766:
	.byte	(.L765 - .Lrtx766) / 4
	.byte	(.L767 - .Lrtx766) / 4
	.byte	(.L768 - .Lrtx766) / 4
	.byte	(.L769 - .Lrtx766) / 4
	.byte	(.L780 - .Lrtx766) / 4
	.byte	(.L770 - .Lrtx766) / 4
	.byte	(.L771 - .Lrtx766) / 4
	.byte	(.L780 - .Lrtx766) / 4
	.byte	(.L772 - .Lrtx766) / 4
	.byte	(.L773 - .Lrtx766) / 4
	.byte	(.L774 - .Lrtx766) / 4
	.byte	(.L774 - .Lrtx766) / 4
	.byte	(.L774 - .Lrtx766) / 4
	.byte	(.L775 - .Lrtx766) / 4
	.byte	(.L780 - .Lrtx766) / 4
	.byte	(.L776 - .Lrtx766) / 4
	.byte	(.L777 - .Lrtx766) / 4
	.byte	(.L778 - .Lrtx766) / 4
	.byte	(.L779 - .Lrtx766) / 4
	.text
	.p2align 3
.L779:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	AVS2DEC_GetImageBuffer
.L762:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L778:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	VP9DEC_GetImageBuffer
	b	.L762
	.p2align 3
.L777:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	HEVCDEC_GetImageBuffer
	b	.L762
	.p2align 3
.L776:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	MVC_DEC_GetImageBuffer
	b	.L762
	.p2align 3
.L775:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	VP8DEC_GetImageBuffer
	b	.L762
	.p2align 3
.L774:
	ldr	x2, .LC490
	ldr	w2, [x2, 2200]
	tbz	x2, 0, .L762
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	VP6DEC_GetImageBuffer
	b	.L762
	.p2align 3
.L773:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	REAL9DEC_GetImageBuffer
	b	.L762
	.p2align 3
.L772:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	REAL8DEC_GetImageBuffer
	b	.L762
	.p2align 3
.L771:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	AVSDEC_GetImageBuffer
	b	.L762
	.p2align 3
.L770:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	DIVX3DEC_GetImageBuffer
	b	.L762
	.p2align 3
.L769:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	MPEG2DEC_GetImageBuffer
	b	.L762
	.p2align 3
.L768:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	MPEG4DEC_GetImageBuffer
	b	.L762
	.p2align 3
.L767:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	VC1DEC_GetImageBuffer
	b	.L762
	.p2align 3
.L765:
	add	x0, x1, 507904
	add	x0, x0, 2096
	bl	H264DEC_GetImageBuffer
	b	.L762
	.p2align 3
.L786:
	ldr	x2, .LC484
	mov	w3, 4455
	ldr	x4, .LC488
	mov	w0, 0
	ldr	x1, .LC485
	add	x2, x2, 48
	bl	dprint_vfmw
	mov	w0, -1
	b	.L762
	.p2align 3
.L784:
	ldr	x2, .LC484
	mov	w3, 4453
	ldr	x4, .LC483
	mov	w0, 0
	ldr	x1, .LC485
	add	x2, x2, 48
	bl	dprint_vfmw
	mov	w0, -1
	b	.L762
.L785:
	ldr	x2, .LC484
	mov	w3, 4454
	ldr	x4, .LC487
	mov	w0, 0
	ldr	x1, .LC485
	add	x2, x2, 48
	bl	dprint_vfmw
	mov	w0, -1
	b	.L762
	.size	VCTRL_GetImageBuffer, .-VCTRL_GetImageBuffer
	.align	3
.LC483:
	.xword	.LC475
	.align	3
.LC484:
	.xword	.LANCHOR4
	.align	3
.LC485:
	.xword	.LC6
	.align	3
.LC486:
	.xword	.LANCHOR1
	.align	3
.LC487:
	.xword	.LC435
	.align	3
.LC488:
	.xword	.LC481
	.align	3
.LC489:
	.xword	.L766
	.align	3
.LC490:
	.xword	.LANCHOR3
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
	cmp	w19, 31
	bhi	.L794
	ldr	x0, .LC494
	ldr	x2, [x0, w19, sxtw 3]
	cbz	x2, .L795
	ldr	w0, [x2, 4]
	cmp	w0, 1
	bne	.L796
	cbz	x20, .L797
	ldr	w1, [x20]
	mov	w0, 0
	str	w1, [x2, 1340]
.L790:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L796:
	ldr	x2, .LC492
	mov	w3, 4571
	ldr	x4, .LC498
	mov	w0, 0
	ldr	x1, .LC493
	add	x2, x2, 72
	bl	dprint_vfmw
	mov	w0, -1
	b	.L790
	.p2align 3
.L794:
	ldr	x2, .LC492
	mov	w3, 4569
	ldr	x4, .LC491
	mov	w0, 0
	ldr	x1, .LC493
	add	x2, x2, 72
	bl	dprint_vfmw
	mov	w0, -1
	b	.L790
.L795:
	ldr	x2, .LC492
	mov	w3, 4570
	ldr	x4, .LC496
	mov	w0, 0
	ldr	x1, .LC493
	add	x2, x2, 72
	bl	dprint_vfmw
	mov	w0, -1
	b	.L790
.L797:
	ldr	x2, .LC492
	mov	w3, 4572
	ldr	x4, .LC500
	mov	w0, 0
	ldr	x1, .LC493
	add	x2, x2, 72
	bl	dprint_vfmw
	mov	w0, -1
	b	.L790
	.size	VCTRL_ConfigFFFBSpeed, .-VCTRL_ConfigFFFBSpeed
	.align	3
.LC491:
	.xword	.LC198
	.align	3
.LC492:
	.xword	.LANCHOR4
	.align	3
.LC493:
	.xword	.LC6
	.align	3
.LC494:
	.xword	.LANCHOR1
	.align	3
.LC496:
	.xword	.LC495
	.align	3
.LC498:
	.xword	.LC497
	.align	3
.LC500:
	.xword	.LC499
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
	cmp	w19, 31
	bhi	.L804
	ldr	x0, .LC504
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L805
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L806
	cbz	x20, .L807
	ldr	x3, .LC508
	mov	x2, 20
	mov	x1, x20
	add	x0, x0, 1376
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L800:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L806:
	ldr	x2, .LC502
	mov	w3, 4584
	ldr	x4, .LC506
	mov	w0, 0
	ldr	x1, .LC503
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L800
	.p2align 3
.L804:
	ldr	x2, .LC502
	mov	w3, 4582
	ldr	x4, .LC501
	mov	w0, 0
	ldr	x1, .LC503
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L800
.L807:
	ldr	x2, .LC502
	mov	w3, 4585
	ldr	x4, .LC507
	mov	w0, 0
	ldr	x1, .LC503
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L800
.L805:
	ldr	x2, .LC502
	mov	w3, 4583
	ldr	x4, .LC505
	ldr	x1, .LC503
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L800
	.size	VCTRL_ConfigPVRInfo, .-VCTRL_ConfigPVRInfo
	.align	3
.LC501:
	.xword	.LC198
	.align	3
.LC502:
	.xword	.LANCHOR4
	.align	3
.LC503:
	.xword	.LC6
	.align	3
.LC504:
	.xword	.LANCHOR1
	.align	3
.LC505:
	.xword	.LC495
	.align	3
.LC506:
	.xword	.LC497
	.align	3
.LC507:
	.xword	.LC499
	.align	3
.LC508:
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
	cmp	w19, 31
	bhi	.L815
	ldr	x0, .LC512
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L814
	ldr	w1, [x0, 4]
	cbz	w1, .L814
	ldr	w1, [x0, 8]
	cbz	w1, .L814
	ldr	w1, [x0, 20]
	cbz	w1, .L814
	ldr	w0, [x0, 672]
	cmp	w0, 22
	csetm	w0, eq
.L810:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L814:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L815:
	ldr	x2, .LC510
	mov	w3, 4594
	ldr	x4, .LC509
	mov	w0, 0
	ldr	x1, .LC511
	add	x2, x2, 120
	bl	dprint_vfmw
	mov	w0, -1
	b	.L810
	.size	VCTRL_IsChanActive, .-VCTRL_IsChanActive
	.align	3
.LC509:
	.xword	.LC198
	.align	3
.LC510:
	.xword	.LANCHOR4
	.align	3
.LC511:
	.xword	.LC6
	.align	3
.LC512:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	USERDEC_Init
	.type	USERDEC_Init, %function
USERDEC_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L832
	ldr	x3, .LC516
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
	ldr	x3, .LC517
	mov	x0, 0
	b	.L821
	.p2align 3
.L819:
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L833
.L821:
	ldr	x2, [x3, x0, lsl 3]
	add	x1, x2, 507904
	add	x1, x1, 2096
	cbz	x2, .L819
	cmp	x19, x1
	bne	.L819
	cmn	w0, #1
	str	w0, [x19, 616]
	mov	w0, 1
	beq	.L823
.L827:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L833:
	mov	w0, -1
	str	w0, [x19, 616]
.L823:
	ldr	x1, .LC519
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L827
.L832:
	ldr	x2, .LC513
	mov	w0, 0
	ldr	x1, .LC515
	add	x2, x2, 144
	bl	dprint_vfmw
	mov	w0, -20
	b	.L827
	.size	USERDEC_Init, .-USERDEC_Init
	.align	3
.LC513:
	.xword	.LANCHOR4
	.align	3
.LC515:
	.xword	.LC514
	.align	3
.LC516:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC517:
	.xword	.LANCHOR1
	.align	3
.LC519:
	.xword	.LC518
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	USERDEC_RecycleImage
	.type	USERDEC_RecycleImage, %function
USERDEC_RecycleImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L836
	ldr	w0, [x19, 616]
	mov	w1, w20
	mov	w2, 0
	bl	FSP_SetDisplay
	ldr	w0, [x19, 616]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L837
	ldr	w0, [x19, 616]
	ldr	x1, [x20, 544]
	bl	FreeUsdByDec
	str	xzr, [x20, 544]
	ldr	x1, [x20, 552]
	ldr	w0, [x19, 616]
	bl	FreeUsdByDec
	str	xzr, [x20, 552]
	mov	w0, 1
.L835:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L837:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L836:
	mov	w0, -2
	b	.L835
	.size	USERDEC_RecycleImage, .-USERDEC_RecycleImage
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetUsrdecFrame
	.type	VCTRL_GetUsrdecFrame, %function
VCTRL_GetUsrdecFrame:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x23, .LC520
	ldr	x0, [x23, w20, sxtw 3]
	cbz	x0, .L852
	ldr	w1, [x0, 672]
	cmp	w1, 20
	bne	.L853
	ldr	w0, [x0, 596]
	cmp	w0, 2
	ble	.L854
	mov	w1, 1
	mov	w0, w20
	bl	FSP_NewLogicFs
	mov	w22, w0
	tbnz	w0, #31, .L855
	mov	w1, w0
	mov	w0, w20
	bl	FSP_GetLogicFs
	mov	x19, x0
	ldr	x1, .LC531
	mov	w2, w22
	mov	w0, 18
	bl	dprint_vfmw
	cbz	x19, .L856
	ldr	x0, [x19, 32]
	cbz	x0, .L845
	ldr	x1, [x19, 40]
	cbz	x1, .L845
	ldr	w2, [x0, 8]
	mov	w0, 18
	ldr	w3, [x1, 8]
	ldr	x1, .LC535
	bl	dprint_vfmw
	ldr	x0, [x19, 32]
	ldr	w0, [x0, 8]
	str	w0, [x21, 40]
	ldr	x0, [x23, w20, sxtw 3]
	ldr	w0, [x0, 592]
	str	w0, [x21, 20]
	ldr	x0, [x19, 32]
	ldr	w0, [x0, 24]
	str	w0, [x21, 24]
	ldr	x0, [x19, 32]
	ldr	w0, [x0, 24]
	bl	MEM_Phy2Vir
	str	x0, [x21, 32]
	mov	w1, 0
.L840:
	mov	w0, w1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L853:
	ldr	x1, .LC525
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L840
	.p2align 3
.L854:
	ldr	x1, .LC527
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L840
	.p2align 3
.L845:
	ldr	x1, .LC537
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L840
	.p2align 3
.L855:
	ldr	x1, .LC529
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L840
.L852:
	ldr	x2, .LC522
	mov	w3, 4786
	ldr	x1, .LC523
	ldr	x4, .LC521
	add	x2, x2, 160
	bl	dprint_vfmw
	mov	w1, -1
	b	.L840
.L856:
	ldr	x1, .LC533
	mov	w2, 4814
	mov	w0, 22
	bl	dprint_vfmw
	mov	w1, -1
	b	.L840
	.size	VCTRL_GetUsrdecFrame, .-VCTRL_GetUsrdecFrame
	.align	3
.LC520:
	.xword	.LANCHOR1
	.align	3
.LC521:
	.xword	.LC9
	.align	3
.LC522:
	.xword	.LANCHOR4
	.align	3
.LC523:
	.xword	.LC6
	.align	3
.LC525:
	.xword	.LC524
	.align	3
.LC527:
	.xword	.LC526
	.align	3
.LC529:
	.xword	.LC528
	.align	3
.LC531:
	.xword	.LC530
	.align	3
.LC533:
	.xword	.LC532
	.align	3
.LC535:
	.xword	.LC534
	.align	3
.LC537:
	.xword	.LC536
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InitSyntaxCtx
	.type	InitSyntaxCtx, %function
InitSyntaxCtx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC538
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L876
	ldr	w0, [x1, 672]
	cmp	w0, 20
	bls	.L877
.L857:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L877:
	ldr	x2, .LC542
	ldrb	w0, [x2,w0,uxtw]
	adr	x2, .Lrtx861
	add	x0, x2, w0, sxtb #2
	br	x0
.Lrtx861:
	.section	.rodata
	.align	0
	.align	2
.L861:
	.byte	(.L860 - .Lrtx861) / 4
	.byte	(.L862 - .Lrtx861) / 4
	.byte	(.L863 - .Lrtx861) / 4
	.byte	(.L864 - .Lrtx861) / 4
	.byte	(.L857 - .Lrtx861) / 4
	.byte	(.L865 - .Lrtx861) / 4
	.byte	(.L866 - .Lrtx861) / 4
	.byte	(.L857 - .Lrtx861) / 4
	.byte	(.L867 - .Lrtx861) / 4
	.byte	(.L868 - .Lrtx861) / 4
	.byte	(.L869 - .Lrtx861) / 4
	.byte	(.L869 - .Lrtx861) / 4
	.byte	(.L869 - .Lrtx861) / 4
	.byte	(.L870 - .Lrtx861) / 4
	.byte	(.L857 - .Lrtx861) / 4
	.byte	(.L871 - .Lrtx861) / 4
	.byte	(.L872 - .Lrtx861) / 4
	.byte	(.L873 - .Lrtx861) / 4
	.byte	(.L874 - .Lrtx861) / 4
	.byte	(.L857 - .Lrtx861) / 4
	.byte	(.L875 - .Lrtx861) / 4
	.text
	.p2align 3
.L875:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	USERDEC_Init
	b	.L857
	.p2align 3
.L874:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	AVS2DEC_Init
	b	.L857
	.p2align 3
.L873:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	VP9DEC_Init
	b	.L857
	.p2align 3
.L872:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	HEVCDEC_Init
	b	.L857
	.p2align 3
.L871:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	MVC_DEC_Init
	b	.L857
	.p2align 3
.L870:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	VP8DEC_Init
	b	.L857
	.p2align 3
.L869:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	VP6DEC_Init
	b	.L857
	.p2align 3
.L868:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	REAL9DEC_Init
	b	.L857
	.p2align 3
.L867:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	REAL8DEC_Init
	b	.L857
	.p2align 3
.L866:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	AVSDEC_Init
	b	.L857
	.p2align 3
.L865:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	DIVX3DEC_Init
	b	.L857
	.p2align 3
.L864:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	MPEG2DEC_Init
	b	.L857
	.p2align 3
.L863:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	MPEG4DEC_Init
	b	.L857
	.p2align 3
.L862:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	VC1DEC_Init
	b	.L857
	.p2align 3
.L860:
	add	x0, x1, 507904
	add	x1, x1, 680
	add	x0, x0, 2096
	bl	H264DEC_Init
	b	.L857
	.p2align 3
.L876:
	ldr	x2, .LC540
	mov	w3, 4863
	ldr	x4, .LC539
	mov	w0, 0
	ldr	x1, .LC541
	add	x2, x2, 184
	bl	dprint_vfmw
	b	.L857
	.size	InitSyntaxCtx, .-InitSyntaxCtx
	.align	3
.LC538:
	.xword	.LANCHOR1
	.align	3
.LC539:
	.xword	.LC9
	.align	3
.LC540:
	.xword	.LANCHOR4
	.align	3
.LC541:
	.xword	.LC6
	.align	3
.LC542:
	.xword	.L861
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
	ldr	w0, [x19, 36]
	tbnz	w0, #31, .L879
	ldr	w0, [x19, 12]
	cmp	w0, 31
	ble	.L879
	ldr	w0, [x19, 16]
	cmp	w0, 31
	ble	.L879
	ldr	w1, [x19, 56]
	mov	w0, 262143
	cmp	w1, w0
	ble	.L879
	ldr	w0, [x19, 44]
	cmp	w0, 1
	beq	.L885
	cmp	w0, 2
	mov	w0, 0
	bne	.L881
	ldr	w0, [x19, 20]
	cmp	w0, wzr
	ble	.L879
	ldr	w0, [x19, 24]
	cmp	w0, wzr
	ble	.L879
.L884:
	ldr	w0, [x19, 28]
	cmp	w0, wzr
	ble	.L879
	ldr	w0, [x19, 32]
	cmp	w0, wzr
	bgt	.L886
.L879:
	ldr	x1, .LC544
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, -1
.L881:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L886:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L885:
	ldr	w0, [x19, 20]
	cmp	w0, wzr
	bgt	.L884
	b	.L879
	.size	VCTRL_VarifyOption, .-VCTRL_VarifyOption
	.align	3
.LC544:
	.xword	.LC543
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetMemSize_onDecode
	.type	VCTRL_GetMemSize_onDecode, %function
VCTRL_GetMemSize_onDecode:
	sub	sp, sp, #64
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	mov	x19, x1
	mov	w21, w0
	mov	x0, x30
	mov	x20, x2
	bl	_mcount
	ldp	w5, w0, [x19, 36]
	mov	w4, 1
	cbz	w0, .L889
	mov	w4, 17
	add	w0, w5, 1
	cmp	w0, w4
	csel	w4, w0, w4, le
.L889:
	ldr	x1, .LC545
	sub	w0, w21, #27
	mov	w7, -2
	cmp	w0, 5
	csinv	w7, w7, wzr, ls
	ldr	x8, [x1, 128]
	cbz	x8, .L893
	ldr	w0, [x19, 60]
	mov	w6, 0
	ldr	x22, .LC548
	mov	w1, 2147483647
	add	w5, w5, w0
	ldp	w2, w3, [x19, 12]
	add	x0, x22, 2464
	add	w5, w5, 2
	str	x0, [sp]
	mov	w0, 1
	blr	x8
	cbnz	w0, .L893
	ldr	w0, [x22, 2464]
	add	w0, w0, 16
	str	w0, [x20]
	ldr	w0, [x19, 256]
	cmp	w0, 17
	beq	.L905
	ldr	w0, [x19, 56]
	add	w0, w0, 32768
	add	w0, w0, 16
	str	w0, [x20, 4]
.L895:
	mov	w0, 1024
	movk	w0, 0x2, lsl 16
	str	w0, [x20, 12]
	ldr	w0, [x19, 256]
	cbz	w0, .L906
	cmp	w0, 15
	bne	.L899
	ldp	w4, w0, [x19, 28]
	mov	w1, 3992
	ldr	w2, [x19, 20]
	mov	w3, 4064
	mov	w5, 2240
	smull	x4, w4, w1
	smaddl	x1, w2, w3, x4
	madd	w3, w0, w5, w1
.L898:
	mov	w2, 47888
	mov	w1, 18336
	cmp	w21, 26
	movk	w2, 0xf, lsl 16
	movk	w1, 0xb5, lsl 16
	add	sp, x29, 0
	csel	w1, w2, w1, ne
	mov	w0, 0
	add	w1, w3, w1
	str	w1, [x20, 8]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L906:
	ldp	w4, w0, [x19, 28]
	mov	w1, 4000
	ldr	w2, [x19, 20]
	mov	w3, 4064
	mov	w5, 2208
	smull	x4, w4, w1
	smaddl	x1, w2, w3, x4
	madd	w3, w0, w5, w1
	b	.L898
	.p2align 3
.L893:
	ldr	x1, .LC547
	mov	w2, 5019
	mov	w0, 0
	bl	dprint_vfmw
	add	sp, x29, 0
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L905:
	str	wzr, [x20, 4]
	b	.L895
	.p2align 3
.L899:
	mov	w1, 62160
	cmp	w0, 16
	movk	w1, 0x13, lsl 16
	csel	w3, w1, wzr, eq
	b	.L898
	.size	VCTRL_GetMemSize_onDecode, .-VCTRL_GetMemSize_onDecode
	.align	3
.LC545:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC547:
	.xword	.LC546
	.align	3
.LC548:
	.xword	.LANCHOR3
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
	mov	w21, w0
	mov	x0, x30
	mov	w20, w3
	mov	x19, x1
	mov	x22, x2
	bl	_mcount
	cmp	w20, 2
	beq	.L908
	ldr	x0, .LC550
	mov	w6, 16
	ldr	w2, [x19, 36]
	ldr	w4, [x19, 60]
	ldr	w3, [x0, 3696]
	ldr	w5, [x0, 3700]
	add	w0, w2, w3
	cmp	w0, w6
	add	w1, w4, w5
	csel	w0, w0, w6, le
	cmp	w0, wzr
	ccmp	w1, wzr, 1, ge
	blt	.L915
	str	w0, [x19, 36]
	str	w1, [x19, 60]
.L908:
	mov	x0, x19
	bl	VCTRL_VarifyOption
	cbnz	w0, .L911
	mov	x2, x22
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_GetMemSize_onDecode
.L910:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L911:
	mov	w0, -1
	b	.L910
	.p2align 3
.L915:
	ldr	x1, .LC552
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, -1
	b	.L910
	.size	VCTRL_GetChanMemSize, .-VCTRL_GetChanMemSize
	.align	3
.LC550:
	.xword	.LANCHOR3
	.align	3
.LC552:
	.xword	.LC551
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CloseDrivers
	.type	CloseDrivers, %function
CloseDrivers:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 96
	bl	_mcount
	bl	SM_InstInit
	ldr	w2, [x19, 120]
	cbnz	w2, .L940
	ldr	w21, [x19, 152]
	ldr	w22, [x19, 144]
	ldr	x23, [x19, 136]
	cbnz	w21, .L941
.L918:
	mov	w2, w21
	mov	x1, x23
	mov	w0, w22
	add	x20, x19, 224
	bl	MEM_DelMemRecord
	ldr	w21, [x19, 248]
	ldr	w22, [x19, 240]
	ldr	x23, [x19, 232]
	cbnz	w21, .L942
.L919:
	mov	w2, w21
	mov	w0, w22
	mov	x1, x23
	bl	MEM_DelMemRecord
	ldr	w20, [x19, 216]
	ldr	w21, [x19, 208]
	ldr	x22, [x19, 200]
	cbnz	w20, .L943
.L920:
	mov	w2, w20
	mov	x1, x22
	mov	w0, w21
	add	x19, x19, 256
	bl	MEM_DelMemRecord
	ldr	w20, [x19, 24]
	ldr	w21, [x19, 16]
	ldr	x22, [x19, 8]
	cbnz	w20, .L944
	mov	w2, w20
	mov	x1, x22
	mov	w0, w21
	bl	MEM_DelMemRecord
	ldr	x19, .LC554
	ldr	w0, [x19, 592]
	cmp	w0, 1
	beq	.L945
.L922:
	ldr	w0, [x19, 596]
	cmp	w0, 1
	beq	.L946
.L923:
	ldr	w0, [x19, 600]
	add	x19, x19, 256
	cmp	w0, 1
	beq	.L947
.L924:
	bl	HEVCDEC_ReleaseHevcGlbMem
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L940:
	ldr	x1, [x19, 104]
	ldr	w0, [x19, 112]
	bl	MEM_DelMemRecord
	ldr	w0, [x19, 112]
	ldr	x1, [x19, 104]
	bl	MEM_ReleaseMemBlock
	ldr	x3, .LC553
	mov	x2, 32
	mov	w1, 0
	mov	x0, x20
	ldr	x3, [x3, 96]
	blr	x3
	ldr	w21, [x19, 152]
	ldr	w22, [x19, 144]
	ldr	x23, [x19, 136]
	cbz	w21, .L918
.L941:
	mov	x1, x23
	mov	w0, w22
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC553
	mov	x2, 32
	mov	w1, 0
	add	x0, x19, 128
	ldr	x3, [x3, 96]
	blr	x3
	b	.L918
	.p2align 3
.L944:
	mov	x1, x22
	mov	w0, w21
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC553
	mov	x2, 32
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	mov	w2, w20
	mov	x1, x22
	mov	w0, w21
	bl	MEM_DelMemRecord
	ldr	x19, .LC554
	ldr	w0, [x19, 592]
	cmp	w0, 1
	bne	.L922
.L945:
	ldr	x1, .LC553
	mov	w0, 0
	ldr	x21, [x1, 416]
	bl	VFMW_GetString
	ldr	x2, .LC555
	mov	x1, x0
	mov	w0, 127
	add	x2, x2, 3704
	blr	x21
	str	wzr, [x19, 592]
	ldr	w0, [x19, 596]
	cmp	w0, 1
	bne	.L923
	.p2align 2
.L946:
	ldr	x1, .LC553
	mov	w0, 4
	add	x19, x19, 256
	ldr	x21, [x1, 416]
	bl	VFMW_GetString
	ldr	x2, .LC555
	mov	x1, x0
	mov	w0, 136
	add	x2, x2, 3704
	blr	x21
	str	wzr, [x19, 340]
	ldr	w0, [x19, 344]
	cmp	w0, 1
	bne	.L924
.L947:
	ldr	x1, .LC553
	mov	w0, 13
	ldr	x20, [x1, 416]
	bl	VFMW_GetString
	ldr	x2, .LC555
	mov	x1, x0
	mov	w0, 181
	add	x2, x2, 3704
	blr	x20
	str	wzr, [x19, 344]
	bl	HEVCDEC_ReleaseHevcGlbMem
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L943:
	mov	x1, x22
	mov	w0, w21
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC553
	mov	x2, 32
	mov	w1, 0
	add	x0, x19, 192
	ldr	x3, [x3, 96]
	blr	x3
	b	.L920
	.p2align 3
.L942:
	mov	x1, x23
	mov	w0, w22
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC553
	mov	x2, 32
	mov	w1, 0
	mov	x0, x20
	ldr	x3, [x3, 96]
	blr	x3
	b	.L919
	.size	CloseDrivers, .-CloseDrivers
	.align	3
.LC553:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC554:
	.xword	.LANCHOR1
	.align	3
.LC555:
	.xword	.LANCHOR3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	OpenDrivers
	.type	OpenDrivers, %function
OpenDrivers:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 128
	bl	_mcount
	ldr	x21, .LC557
	ldr	x22, .LC558
	mov	x2, 1256
	mov	w1, 0
	ldr	x3, [x21, 96]
	mov	x0, x22
	blr	x3
	mov	x2, x20
	mov	w1, 65536
	mov	w0, -121438208
	bl	MEM_MapRegisterAddr
	cbnz	w0, .L949
	ldr	w2, [x19, 152]
	add	x20, x19, 224
	ldr	x1, [x19, 136]
	ldr	w0, [x19, 144]
	bl	MEM_AddMemRecord
	mov	w0, 53248
	ldr	x3, [x19, 136]
	mov	x2, x20
	mov	w1, 4096
	movk	w0, 0xf8c3, lsl 16
	str	x3, [x22]
	bl	MEM_MapRegisterAddr
	cbnz	w0, .L950
	ldr	w2, [x20, 24]
	mov	w23, 49152
	ldr	x1, [x20, 8]
	add	x24, x19, 192
	ldr	w0, [x20, 16]
	movk	w23, 0xf8c3, lsl 16
	bl	MEM_AddMemRecord
	ldr	x3, [x20, 8]
	mov	x2, x24
	mov	w1, 4096
	mov	w0, w23
	str	x3, [x22, 16]
	bl	MEM_MapRegisterAddr
	cbnz	w0, .L968
	ldr	w2, [x19, 216]
	add	x20, x19, 96
	ldr	x1, [x19, 200]
	ldr	w0, [x19, 208]
	bl	MEM_AddMemRecord
	ldr	x22, [x21, 136]
	ldr	x1, .LC561
	mov	w0, 12
	str	w23, [x1]
	bl	VFMW_GetString
	mov	w3, 1
	mov	x2, x0
	mov	x1, 20
	add	x0, x29, 104
	blr	x22
	mov	w0, 3
	mov	w4, 0
	str	w0, [x20, 28]
	mov	x3, x20
	mov	w2, 18048
	mov	w1, 0
	add	x0, x29, 104
	bl	MEM_AllocMemBlock
	cbz	w0, .L969
	ldr	x2, .LC562
	mov	w4, 18048
	ldr	x1, .LC564
	mov	w3, 1
	add	x2, x2, 200
	mov	w0, 0
	bl	dprint_vfmw
.L965:
	ldr	x3, [x21, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x20
	blr	x3
	mov	x0, x19
	bl	CloseDrivers
	mov	w0, -1
.L953:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L969:
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	ldr	w0, [x20, 16]
	bl	MEM_AddMemRecord
	ldr	w1, [x20, 24]
	ldr	w0, [x20, 16]
	bl	SCDDRV_CfgDspMem
	mov	w0, 0
	bl	VDMDRV_Init
	bl	SM_InstInit
	ldr	x24, .LC565
	mov	w0, 0
	ldr	x23, [x21, 408]
	ldrsw	x25, [x24, 92]
	bl	VFMW_GetString
	ldr	x22, .LC566
	mov	x3, x0
	ldr	x1, .LC567
	mov	x2, x25
	add	x22, x22, 3704
	mov	w0, 127
	mov	x4, x22
	blr	x23
	cbnz	w0, .L970
	ldr	x23, .LC570
	mov	w0, 4
	ldrsw	x26, [x24, 92]
	mov	w27, 1
	add	x23, x23, 256
	ldr	x25, [x21, 408]
	str	w27, [x23, 336]
	bl	VFMW_GetString
	ldr	x1, .LC571
	mov	x3, x0
	mov	x4, x22
	mov	x2, x26
	mov	w0, 136
	blr	x25
	cbnz	w0, .L971
	mov	w0, 13
	ldrsw	x25, [x24, 92]
	str	w27, [x23, 340]
	ldr	x24, [x21, 408]
	bl	VFMW_GetString
	ldr	x1, .LC572
	mov	x3, x0
	mov	x4, x22
	mov	x2, x25
	mov	w0, 181
	blr	x24
	cbnz	w0, .L972
	str	w27, [x23, 344]
	bl	HEVCDEC_AllocHevcGlbMem
	cbz	w0, .L953
	ldr	x1, .LC574
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L953
	.p2align 3
.L968:
	ldr	x1, .LC560
	mov	w2, w23
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x3, [x21, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x24
	blr	x3
	mov	x0, x19
	bl	CloseDrivers
	mov	w0, -1
	b	.L953
	.p2align 3
.L949:
	ldr	x1, .LC560
	mov	w2, -121438208
.L964:
	mov	w0, 0
	bl	dprint_vfmw
	b	.L965
	.p2align 3
.L950:
	mov	w2, 53248
	ldr	x1, .LC560
	movk	w2, 0xf8c3, lsl 16
	b	.L964
.L970:
	ldr	x1, .LC569
	mov	w2, 127
	b	.L964
.L971:
	ldr	x1, .LC569
	mov	w2, 136
	b	.L964
.L972:
	ldr	x1, .LC569
	mov	w2, 181
	b	.L964
	.size	OpenDrivers, .-OpenDrivers
	.align	3
.LC557:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC558:
	.xword	g_HwMem
	.align	3
.LC560:
	.xword	.LC559
	.align	3
.LC561:
	.xword	s_ScdRegPhyBaseAddr
	.align	3
.LC562:
	.xword	.LANCHOR4
	.align	3
.LC564:
	.xword	.LC563
	.align	3
.LC565:
	.xword	.LANCHOR2
	.align	3
.LC566:
	.xword	.LANCHOR3
	.align	3
.LC567:
	.xword	VCTRL_Isr_0
	.align	3
.LC569:
	.xword	.LC568
	.align	3
.LC570:
	.xword	.LANCHOR1
	.align	3
.LC571:
	.xword	VCTRL_Scd_Isr
	.align	3
.LC572:
	.xword	VCTRL_MMU_ISR
	.align	3
.LC574:
	.xword	.LC573
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
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1006
	ldr	x20, .LC581
	mov	x2, 8
	mov	w1, 0
	add	x0, x29, 64
	ldr	x3, [x20, 96]
	blr	x3
	ldr	x22, .LC582
	ldr	w19, [x22, 256]
	cbnz	w19, .L1005
	ldr	x21, .LC583
	mov	w1, 1024
	ldr	x2, [x20, 160]
	add	x23, x21, 3712
	str	xzr, [x29, 72]
	mov	x0, x23
	blr	x2
	ldr	x1, .LC585
	mov	x0, x23
	ldr	x2, [x20, 192]
	blr	x2
	str	x0, [x29, 72]
	cbz	x0, .L977
	ldr	x1, .LC587
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L997
	ldr	x1, .LC589
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1007
	ldr	x3, [x20, 168]
	mov	w2, 0
	mov	x1, 0
	blr	x3
	mov	w2, w0
	str	w0, [x21, 3696]
	add	w0, w2, 4096
	mov	w1, 10000
	add	w0, w0, 904
	cmp	w0, w1
	bhi	.L982
.L1012:
	mov	w0, 5000
	mov	w1, -5000
	cmp	w2, w0
	csel	w0, w2, w0, le
	cmp	w0, w1
	csel	w0, w0, w1, ge
.L978:
	str	w0, [x21, 3696]
.L980:
	add	x23, x21, 3712
	ldr	x2, [x20, 160]
	mov	w1, 1024
	mov	x0, x23
	str	xzr, [x29, 72]
	blr	x2
	ldr	x1, .LC595
	mov	x0, x23
	ldr	x2, [x20, 192]
	blr	x2
	str	x0, [x29, 72]
	cbz	x0, .L983
	ldr	x1, .LC587
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L984
	ldr	x1, .LC589
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1008
	ldr	x3, [x20, 168]
	mov	w2, 0
	mov	x1, 0
	blr	x3
	mov	w2, w0
	str	w0, [x21, 3700]
	add	w0, w2, 4096
	mov	w1, 10000
	add	w0, w0, 904
	cmp	w0, w1
	bhi	.L988
.L1013:
	mov	w19, 5000
	mov	w0, -5000
	cmp	w2, w19
	csel	w19, w2, w19, le
	cmp	w19, w0
	csel	w19, w19, w0, ge
.L984:
	str	w19, [x21, 3700]
.L986:
	ldr	x23, .LC598
	str	xzr, [x29, 72]
	ldr	w0, [x23, 384]
	cbz	w0, .L989
	ldr	x2, .LC599
	and	w4, w0, 1
	ubfx	x3, x0, 1, 1
	ubfx	x1, x0, 2, 1
	strb	w4, [x23, 388]
	ubfx	x0, x0, 3, 1
	strb	w3, [x2, 96]
	strb	w1, [x23, 389]
	strb	w0, [x23, 390]
.L990:
	add	x19, x22, 256
	ldr	x3, [x20, 96]
	mov	x2, 352
	mov	w1, 0
	mov	x0, x19
	blr	x3
	ldr	x3, [x20, 96]
	mov	x2, 256
	mov	w1, 0
	mov	x0, x22
	blr	x3
	ldr	x2, .LC602
	mov	w1, 1
	add	x0, x29, 64
	str	w1, [x22, 260]
	str	x2, [x23, 392]
	mov	w1, 75497472
	mov	w2, 134217728
	stp	w2, w1, [x29, 64]
	bl	MEM_InitMemManager
	bl	FSP_Init
	ldr	x19, .LC603
	ldr	x3, [x20, 96]
	mov	x2, 384
	mov	w1, 0
	mov	x0, x19
	blr	x3
	add	x0, x19, 128
	add	x1, x19, 256
	mov	w2, -1
	.p2align 2
.L994:
	str	w2, [x0], 4
	cmp	x1, x0
	bne	.L994
	ldr	x3, [x20, 96]
	mov	x2, 128
	mov	w1, 0
	add	x0, x23, 400
	add	x19, x22, 288
	blr	x3
	mov	x0, x19
	bl	OpenDrivers
	cbnz	w0, .L1005
	ldr	x2, [x20, 248]
	mov	w1, 1
	blr	x2
	ldr	x2, .LC606
	add	x0, x22, 272
	ldr	x1, .LC608
	ldr	x3, [x20, 400]
	blr	x3
	cbnz	w0, .L1009
	mov	w1, 1
	str	w1, [x22, 256]
.L975:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L989:
	add	x21, x21, 3712
	ldr	x2, [x20, 160]
	mov	w1, 1024
	mov	x0, x21
	blr	x2
	ldr	x1, .LC601
	mov	x0, x21
	ldr	x2, [x20, 192]
	blr	x2
	str	x0, [x29, 72]
	cbz	x0, .L990
	ldr	x1, .LC587
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1010
	ldr	x1, .LC589
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L1011
	ldr	x3, [x20, 168]
	mov	x1, 0
	mov	w2, 0
	blr	x3
	mov	w1, w0
	str	w0, [x23, 384]
.L992:
	ldr	x2, .LC599
	and	w4, w1, 1
	ubfx	x3, x1, 1, 1
	ubfx	x0, x1, 2, 1
	strb	w4, [x23, 388]
	ubfx	x1, x1, 3, 1
	strb	w3, [x2, 96]
	strb	w0, [x23, 389]
	strb	w1, [x23, 390]
	b	.L990
.L977:
	ldr	w2, [x21, 3696]
	mov	w1, 10000
	add	w0, w2, 4096
	add	w0, w0, 904
	cmp	w0, w1
	bls	.L1012
.L982:
	ldr	x1, .LC593
	mov	w0, 32
	bl	dprint_vfmw
	ldr	w0, [x21, 3696]
	mov	w2, 5000
	mov	w1, -5000
	cmp	w0, w2
	csel	w0, w0, w2, le
	cmp	w0, w1
	csel	w0, w0, w1, ge
	b	.L978
.L983:
	ldr	w2, [x21, 3700]
	mov	w1, 10000
	add	w0, w2, 4096
	add	w0, w0, 904
	cmp	w0, w1
	bls	.L1013
.L988:
	ldr	x1, .LC597
	mov	w0, 32
	bl	dprint_vfmw
	ldr	w19, [x21, 3700]
	mov	w1, 5000
	mov	w0, -5000
	cmp	w19, w1
	csel	w19, w19, w1, le
	cmp	w19, w0
	csel	w19, w19, w0, ge
	b	.L984
.L997:
	mov	w0, 0
	b	.L978
.L1010:
	ldr	w1, [x23, 384]
	b	.L992
.L1009:
	mov	x0, x19
	bl	CloseDrivers
.L1005:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	mov	w0, -1
	ldp	x29, x30, [sp], 80
	ret
.L1008:
	ldr	x2, .LC579
	mov	w3, 6032
	ldr	x1, .LC591
	mov	w0, 22
	add	x2, x2, 256
	bl	dprint_vfmw
	b	.L986
.L1007:
	ldr	x2, .LC579
	mov	w3, 5990
	ldr	x1, .LC591
	mov	w0, 22
	add	x2, x2, 232
	bl	dprint_vfmw
	b	.L980
.L1011:
	ldr	x2, .LC579
	mov	w3, 6083
	ldr	x1, .LC591
	mov	w0, 22
	add	x2, x2, 280
	bl	dprint_vfmw
	b	.L990
.L1006:
	ldr	x2, .LC579
	mov	w3, 938
	ldr	x4, .LC578
	mov	w0, 0
	ldr	x1, .LC580
	add	x2, x2, 216
	bl	dprint_vfmw
	mov	w0, -1
	b	.L975
	.size	VCTRL_OpenVfmw, .-VCTRL_OpenVfmw
	.align	3
.LC578:
	.xword	.LC577
	.align	3
.LC579:
	.xword	.LANCHOR4
	.align	3
.LC580:
	.xword	.LC6
	.align	3
.LC581:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC582:
	.xword	.LANCHOR1
	.align	3
.LC583:
	.xword	.LANCHOR3
	.align	3
.LC585:
	.xword	.LC584
	.align	3
.LC587:
	.xword	.LC586
	.align	3
.LC589:
	.xword	.LC588
	.align	3
.LC591:
	.xword	.LC590
	.align	3
.LC593:
	.xword	.LC592
	.align	3
.LC595:
	.xword	.LC594
	.align	3
.LC597:
	.xword	.LC596
	.align	3
.LC598:
	.xword	.LANCHOR5
	.align	3
.LC599:
	.xword	.LANCHOR2
	.align	3
.LC601:
	.xword	.LC600
	.align	3
.LC602:
	.xword	VCTRL_EventReport
	.align	3
.LC603:
	.xword	g_ChanCtx
	.align	3
.LC606:
	.xword	VFMW_CTRL_thread_proc
	.align	3
.LC608:
	.xword	.LC607
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetNextDecodeMode
	.type	GetNextDecodeMode, %function
GetNextDecodeMode:
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
	lsl	w3, w19, 1
	movk	w0, 0x5555, lsl 16
	cmp	w19, wzr
	csel	w20, w20, w19, lt
	ldr	x1, .LC613
	smull	x0, w3, w0
	asr	w20, w20, 3
	mov	w5, w22
	lsr	x0, x0, 32
	mov	w4, w19
	sub	w3, w0, w3, asr 31
	mov	w2, w20
	mov	w0, 30
	bl	dprint_vfmw
	cmp	w21, 3
	beq	.L1019
	cmp	w19, w22
	mov	w19, w21
	blt	.L1020
.L1016:
	ldr	x1, .LC619
	mov	w3, w19
	mov	w2, w21
	mov	w0, 30
	bl	dprint_vfmw
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1020:
	ldr	x1, .LC617
	mov	w0, 30
	mov	w19, 3
	bl	dprint_vfmw
	b	.L1016
	.p2align 3
.L1019:
	cmp	w20, w22
	mov	w19, w21
	ble	.L1016
	ldr	x1, .LC615
	mov	w0, 30
	mov	w19, 0
	bl	dprint_vfmw
	b	.L1016
	.size	GetNextDecodeMode, .-GetNextDecodeMode
	.align	3
.LC613:
	.xword	.LC612
	.align	3
.LC615:
	.xword	.LC614
	.align	3
.LC617:
	.xword	.LC616
	.align	3
.LC619:
	.xword	.LC618
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
	ldr	x3, .LC620
	mov	x0, 0
	b	.L1024
	.p2align 3
.L1022:
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L1030
.L1024:
	ldr	x2, [x3, x0, lsl 3]
	add	x1, x2, 507904
	add	x1, x1, 2096
	cbz	x2, .L1022
	cmp	x19, x1
	bne	.L1022
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1030:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetChanIDByCtx, .-VCTRL_GetChanIDByCtx
	.align	3
.LC620:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanIDByMemAddr
	.type	VCTRL_GetChanIDByMemAddr, %function
VCTRL_GetChanIDByMemAddr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x6, .LC621
	mov	x5, 0
.L1036:
	ldr	x4, [x6, x5, lsl 3]
	mov	w0, w5
	cbz	x4, .L1032
	add	x1, x4, 503808
	add	x4, x4, 507904
	add	x1, x1, 2032
	add	x4, x4, 240
	.p2align 2
.L1035:
	ldr	w2, [x1]
	cmp	w2, w19
	bhi	.L1033
	ldr	w3, [x1, -20]
	add	w2, w2, w3
	cmp	w19, w2
	bcc	.L1034
.L1033:
	add	x1, x1, 72
	cmp	x1, x4
	bne	.L1035
.L1032:
	add	x5, x5, 1
	cmp	x5, 32
	bne	.L1036
	mov	w0, -1
.L1034:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetChanIDByMemAddr, .-VCTRL_GetChanIDByMemAddr
	.align	3
.LC621:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecChanProcessPts
	.type	DecChanProcessPts, %function
DecChanProcessPts:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x21, .LC622
	ldr	x4, [x21, w20, sxtw 3]
	ldr	w2, [x4, 52]
	cmp	w2, 1
	beq	.L1074
	cmp	w2, 6
	sub	w0, w2, #2
	ccmp	w2, 18, 4, ne
	ccmp	w0, 1, 0, ne
	bls	.L1045
.L1046:
	ldr	x2, [x19, 40]
	cmn	x2, #1
	beq	.L1075
	str	x2, [x4, 744]
.L1056:
	ldr	x3, [x19, 56]
	mov	w0, 29
	str	x3, [x4, 760]
	ldr	x1, .LC628
	ldr	x5, [x19, 64]
	str	x5, [x4, 776]
	ldr	w5, [x19, 72]
	str	w5, [x4, 792]
	ldr	w5, [x19, 76]
	str	w5, [x4, 796]
	ldr	w5, [x19, 80]
	str	w5, [x4, 800]
	ldr	w5, [x19, 84]
	str	w5, [x4, 816]
	ldrb	w5, [x19, 20]
	strb	w5, [x4, 736]
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1074:
	add	x0, x4, 507904
	ldr	x0, [x0, 2096]
	ldrsb	w0, [x0, 604]
	cmp	w0, 1
	bne	.L1046
.L1045:
	add	x3, x19, 8
	add	x1, x4, 1280
	mov	w0, w20
	bl	IsNewpicSeg
	cbz	w0, .L1076
	ldr	x0, [x21, w20, sxtw 3]
	ldr	w1, [x0, 52]
	cmp	w1, 3
	beq	.L1052
.L1051:
	ldr	x1, [x19, 40]
	cmn	x1, #1
	beq	.L1053
.L1073:
	str	x1, [x0, 752]
.L1053:
	ldr	x1, [x19, 56]
	str	x1, [x0, 768]
	ldr	x1, [x19, 64]
	str	x1, [x0, 784]
	ldr	w1, [x19, 72]
	str	w1, [x0, 804]
	ldr	w1, [x19, 76]
	str	w1, [x0, 808]
	ldr	w1, [x19, 80]
	str	w1, [x0, 812]
	ldr	w1, [x19, 84]
	str	w1, [x0, 820]
.L1052:
	ldr	x2, [x0, 760]
	mov	w0, 29
	ldr	x1, .LC626
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1076:
	ldr	x0, [x21, w20, sxtw 3]
	ldr	w1, [x0, 52]
	cmp	w1, 3
	ldr	x1, [x0, 752]
	beq	.L1072
	cmn	x1, #1
	beq	.L1049
.L1072:
	str	x1, [x0, 744]
.L1049:
	ldr	x3, [x0, 768]
	mov	x2, -1
	ldr	x1, [x0, 784]
	str	x2, [x0, 752]
	str	x3, [x0, 760]
	str	x1, [x0, 776]
	cbnz	x1, .L1050
	ldr	x1, [x19, 64]
	str	x1, [x0, 776]
.L1050:
	ldr	w6, [x0, 804]
	ldr	w5, [x0, 808]
	ldr	w4, [x0, 812]
	ldr	w3, [x0, 820]
	ldr	x1, .LC624
	ldr	x2, [x0, 744]
	str	w6, [x0, 792]
	str	w5, [x0, 796]
	str	w4, [x0, 800]
	str	w3, [x0, 816]
	mov	w0, 29
	bl	dprint_vfmw
	ldr	x0, [x21, w20, sxtw 3]
	ldr	w1, [x0, 52]
	cmp	w1, 3
	bne	.L1051
	ldr	x1, [x19, 40]
	b	.L1073
	.p2align 3
.L1075:
	ldr	x2, [x4, 744]
	b	.L1056
	.size	DecChanProcessPts, .-DecChanProcessPts
	.align	3
.LC622:
	.xword	.LANCHOR1
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
	.global	DecChanCheckDecParam
	.type	DecChanCheckDecParam, %function
DecChanCheckDecParam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC629
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w0, [x0, 672]
	sub	w1, w0, #10
	cmp	w1, 2
	bhi	.L1078
	ldr	x1, .LC630
	ldr	w1, [x1, 2200]
	tbz	x1, 0, .L1079
.L1078:
	and	w1, w0, -17
	cmp	w1, 4
	ccmp	w0, 14, 4, ne
	beq	.L1079
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbnz	x0, .L1081
.L1079:
	mov	w0, 0
.L1080:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1081:
	mov	w0, -2
	b	.L1080
	.size	DecChanCheckDecParam, .-DecChanCheckDecParam
	.align	3
.LC629:
	.xword	.LANCHOR1
	.align	3
.LC630:
	.xword	.LANCHOR3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecChanSyntax
	.type	DecChanSyntax, %function
DecChanSyntax:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L1122
	ldr	x21, .LC634
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L1123
	ldr	w1, [x0, 8]
	cmp	w1, 1
	bne	.L1124
	ldr	w1, [x0, 24]
	cbnz	w1, .L1125
	ldr	x23, .LC639
	str	wzr, [x0, 512]
	ldr	x0, [x23]
	blr	x0
	ldr	x22, .LC640
	mov	w2, w0
	ldr	x0, .LC641
	add	x1, x22, 528
	ldr	w3, [x0]
	ldr	w0, [x1, w19, sxtw 2]
	sub	w0, w2, w0
	cmp	w0, w3
	mov	w0, w19
	bls	.L1094
	str	w2, [x1, w19, sxtw 2]
	bl	DecChanCheckDecParam
	cmn	w0, #2
	mov	w20, w0
	beq	.L1126
	mov	w0, w19
	bl	VCTRL_GetImageBuffer
	cmp	w0, 1
	bne	.L1104
	mov	w20, w0
.L1105:
	ldr	x1, [x21, w19, sxtw 3]
	add	x0, x1, 475136
	ldr	w3, [x0, 2360]
	cmp	w3, 1
	beq	.L1127
	cmp	w3, 3
	beq	.L1128
	add	x24, x1, 824
	ldrb	w0, [x24, 1]
	cbnz	w0, .L1098
	ldr	w0, [x1, 1672]
	cbz	w0, .L1129
.L1098:
	ldr	x2, [x24, 40]
	mov	w0, 29
	ldr	x3, [x24, 56]
	ldr	x1, .LC653
	bl	dprint_vfmw
	mov	x1, x24
	mov	w0, w19
	bl	DecChanProcessPts
	mov	w0, 3
	bl	CHECK_REC_POS_ENABLE
	cmp	w20, 1
	ccmp	w0, wzr, 4, eq
	bne	.L1130
.L1100:
	ldr	x1, [x21, w19, sxtw 3]
	mov	x0, x24
	add	x2, x1, 507904
	ldr	w1, [x1, 672]
	add	x2, x2, 2096
	bl	DecodeStream
	mov	w0, 4
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L1101
.L1102:
	mov	w20, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1094:
	bl	DecChanCheckDecParam
	cmn	w0, #2
	mov	w20, w0
	bne	.L1131
.L1111:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1131:
	mov	w0, w19
	mov	w20, -3
	bl	VCTRL_GetImageBuffer
	cmp	w0, 1
	bne	.L1111
	mov	w20, 0
	b	.L1105
	.p2align 3
.L1126:
	ldr	x1, .LC643
	mov	w2, w19
	mov	w0, 23
	bl	dprint_vfmw
	b	.L1111
	.p2align 3
.L1101:
	ldr	x0, [x23]
	add	x22, x22, 656
	blr	x0
	mov	w1, w0
	ldr	x2, .LC654
	ldr	w0, [x22, w19, sxtw 2]
	ldr	w2, [x2]
	sub	w0, w1, w0
	cmp	w0, w2
	bls	.L1102
	mov	w0, w19
	str	w1, [x22, w19, sxtw 2]
	bl	VCTRL_GetDecParam
	cbz	x0, .L1102
	ldr	x0, .LC632
	lsl	w2, w19, 24
	add	w2, w2, 262144
	mov	w1, 5746
	add	x0, x0, 312
	mov	w20, 0
	bl	DBG_AddTrace
	b	.L1111
.L1127:
	ldr	x1, .LC647
	mov	w0, 31
	mov	w20, -3
	bl	dprint_vfmw
	b	.L1111
	.p2align 3
.L1104:
	ldr	x1, .LC645
	mov	w2, w19
	mov	w0, 23
	mov	w20, -3
	bl	dprint_vfmw
	b	.L1111
	.p2align 3
.L1124:
	ldr	x2, .LC632
	mov	w3, 5646
	ldr	x4, .LC636
	mov	w0, 0
	ldr	x1, .LC633
	add	x2, x2, 296
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1111
	.p2align 3
.L1125:
	ldr	x2, .LC632
	mov	w3, 5647
	ldr	x4, .LC638
	mov	w0, 0
	ldr	x1, .LC633
	add	x2, x2, 296
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1111
	.p2align 3
.L1129:
	add	x1, x1, 832
	mov	w0, w19
	bl	SM_ReadSegStream
	cbz	w0, .L1098
	cmp	w20, 1
	beq	.L1132
.L1099:
	ldr	x0, [x21, w19, sxtw 3]
	mov	w1, 1
	mov	w20, -4
	str	w1, [x0, 512]
	b	.L1111
	.p2align 3
.L1122:
	ldr	x2, .LC632
	mov	w3, 5644
	ldr	x4, .LC631
	mov	w0, 0
	ldr	x1, .LC633
	add	x2, x2, 296
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1111
	.p2align 3
.L1130:
	ldr	x0, .LC632
	lsl	w2, w19, 24
	add	w2, w2, 196608
	mov	w1, 5728
	add	x0, x0, 312
	bl	DBG_AddTrace
	b	.L1100
.L1123:
	ldr	x2, .LC632
	mov	w3, 5645
	ldr	x4, .LC635
	mov	w20, -1
	ldr	x1, .LC633
	add	x2, x2, 296
	bl	dprint_vfmw
	b	.L1111
.L1128:
	ldr	w2, [x1, 1616]
	mov	w0, 31
	ldr	x1, .LC649
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1111
.L1132:
	ldr	x1, .LC651
	mov	w2, w19
	mov	w0, 23
	bl	dprint_vfmw
	b	.L1099
	.size	DecChanSyntax, .-DecChanSyntax
	.align	3
.LC631:
	.xword	.LC198
	.align	3
.LC632:
	.xword	.LANCHOR4
	.align	3
.LC633:
	.xword	.LC6
	.align	3
.LC634:
	.xword	.LANCHOR1
	.align	3
.LC635:
	.xword	.LC435
	.align	3
.LC636:
	.xword	.LC481
	.align	3
.LC638:
	.xword	.LC637
	.align	3
.LC639:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC640:
	.xword	.LANCHOR5
	.align	3
.LC641:
	.xword	g_TraceBsPeriod
	.align	3
.LC643:
	.xword	.LC642
	.align	3
.LC645:
	.xword	.LC644
	.align	3
.LC647:
	.xword	.LC646
	.align	3
.LC649:
	.xword	.LC648
	.align	3
.LC651:
	.xword	.LC650
	.align	3
.LC653:
	.xword	.LC652
	.align	3
.LC654:
	.xword	g_TraceFramePeriod
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecSyntax
	.type	DecSyntax, %function
DecSyntax:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC657
	ldr	x23, .LC658
	mov	x0, 0
	b	.L1136
	.p2align 3
.L1164:
	ldr	w1, [x1, 20]
	str	w1, [x2, x0, lsl 2]
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L1163
.L1136:
	ldr	x1, [x21, x0, lsl 3]
	add	x2, x23, 784
	cbnz	x1, .L1164
	add	x1, x23, 784
	str	wzr, [x1, x0, lsl 2]
	add	x0, x0, 1
	cmp	x0, 32
	bne	.L1136
.L1163:
	ldr	x24, .LC659
	mov	w20, -1
	.p2align 2
.L1137:
	ldr	w3, [x23, 784]
	add	x1, x23, 788
	mov	w0, 0
	mov	w19, 0
	.p2align 2
.L1138:
	add	w0, w0, 1
	cmp	w0, 32
	beq	.L1165
.L1140:
	ldr	w2, [x1]
	add	x1, x1, 4
	cmp	w3, w2
	bge	.L1138
	mov	w19, w0
	add	w0, w0, 1
	cmp	w0, 32
	mov	w3, w2
	bne	.L1140
.L1165:
	add	x2, x23, 784
	add	x0, x21, 256
	add	w1, w19, 1
	cmp	w3, wzr
	sxtw	x25, w19
	str	wzr, [x2, w19, sxtw 2]
	str	w1, [x0, 28]
	ble	.L1141
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L1137
	ldr	w1, [x0, 8]
	cmp	w1, 1
	bne	.L1137
	ldr	w1, [x0, 76]
	cmp	w1, wzr
	ble	.L1143
	ldr	w0, [x0, 80]
	cbz	w0, .L1166
.L1143:
	mov	w22, 500
	b	.L1151
	.p2align 3
.L1146:
	ldr	x0, [x21, x25, lsl 3]
	cbnz	w20, .L1149
	ldr	w1, [x0, 1704]
	cmp	w1, 1
	beq	.L1149
	subs	w22, w22, #1
	beq	.L1137
.L1151:
	mov	w0, w19
	bl	DecChanSyntax
	cmn	w0, #1
	mov	w20, w0
	bne	.L1146
	ldr	x4, [x23, 392]
	cbz	x4, .L1147
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	mov	w0, w19
	blr	x4
.L1147:
	mov	w0, w20
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
.L1149:
	str	wzr, [x0, 1704]
	b	.L1137
.L1166:
	add	x1, x29, 88
	mov	w0, w19
	bl	SM_GetInfo
	cbnz	w0, .L1167
.L1144:
	ldr	x20, [x21, x25, lsl 3]
	ldr	w1, [x29, 100]
	ldr	w2, [x20, 76]
	ldr	w0, [x20, 688]
	bl	GetNextDecodeMode
	str	w0, [x20, 688]
	ldr	x1, [x21, x25, lsl 3]
	ldr	w0, [x1, 688]
	cbz	w0, .L1145
	str	wzr, [x1, 680]
	str	wzr, [x1, 684]
	b	.L1143
.L1141:
	str	wzr, [x0, 28]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
.L1145:
	ldr	w0, [x1, 72]
	str	w0, [x1, 680]
	str	w0, [x1, 684]
	b	.L1143
.L1167:
	ldr	x3, [x24, 96]
	mov	x2, 24
	mov	w1, 0
	add	x0, x29, 88
	blr	x3
	b	.L1144
	.size	DecSyntax, .-DecSyntax
	.align	3
.LC657:
	.xword	.LANCHOR1
	.align	3
.LC658:
	.xword	.LANCHOR5
	.align	3
.LC659:
	.xword	vfmw_Osal_Func_Ptr_S
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
	ldr	x20, .LC662
	ldrb	w0, [x20, 2824]
	cmp	w0, 1
	beq	.L1177
.L1169:
	ldr	w0, [x20, 1132]
	mov	w1, 100
	str	w1, [x20, 280]
	cmp	w0, wzr
	ldr	x21, .LC663
	ble	.L1170
	ldr	x1, [x21, 240]
	blr	x1
.L1170:
	ldr	x1, [x21, 24]
	mov	w0, 0
	mov	w22, 0
	blr	x1
	bl	SM_Wakeup
	ldr	w0, [x20, 1128]
	mov	w1, 101
	str	w1, [x20, 280]
	cbz	w0, .L1178
.L1171:
	mov	w0, 102
	mov	w19, 0
	str	w0, [x20, 280]
	bl	VDMDRV_WakeUpVdm
	.p2align 2
.L1172:
	mov	w0, w19
	mov	w1, 0
	add	w19, w19, 1
	bl	DeleteRawPacketInBuffer
	cmp	w19, 32
	bne	.L1172
	ldr	x1, [x21, 32]
	mov	w0, 0
	blr	x1
	mov	w1, 105
	mov	w0, 1
	str	w1, [x20, 280]
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
.L1178:
	bl	DecSyntax
	mov	w22, w0
	b	.L1171
.L1177:
	mov	w0, 11
	bl	VCTRL_RecordPosTime
	strb	wzr, [x20, 2824]
	b	.L1169
	.size	VCTRL_RunProcess, .-VCTRL_RunProcess
	.align	3
.LC662:
	.xword	.LANCHOR1
	.align	3
.LC663:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VFMW_CTRL_thread_proc
	.type	VFMW_CTRL_thread_proc, %function
VFMW_CTRL_thread_proc:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x0, x30
	mov	w21, 2
	bl	_mcount
	ldr	x20, .LC664
	ldr	x25, .LC666
	ldr	x22, .LC670
	ldr	x26, .LC668
	ldr	x23, .LC672
	ldr	x24, .LC673
.L1180:
.L1187:
	mov	x1, x25
	mov	w0, 2
	str	wzr, [x20, 280]
	bl	dprint_vfmw
	str	w21, [x20, 260]
	ldr	w0, [x20, 264]
	cmp	w0, 2
	bne	.L1202
	b	.L1185
	.p2align 3
.L1204:
	str	w21, [x20, 280]
	bl	VCTRL_RunProcess
	mov	x1, x22
	mov	w0, 22
	bl	dprint_vfmw
	ldr	w0, [x20, 264]
	cmp	w0, 2
	beq	.L1185
.L1202:
	cmp	w0, 3
	bne	.L1204
.L1183:
	ldr	x1, .LC675
	mov	w2, 6
	mov	w0, 2
	str	w2, [x20, 280]
	bl	dprint_vfmw
	str	wzr, [x20, 260]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1185:
	mov	w2, 4
	mov	x1, x26
	mov	w0, 2
	str	w2, [x20, 280]
	mov	w27, 5
	bl	dprint_vfmw
	mov	w0, 1
	str	w0, [x20, 260]
	b	.L1182
	.p2align 3
.L1205:
	ldr	x1, [x24, 240]
	blr	x1
.L1182:
	mov	x1, x23
	mov	w0, 22
	str	w27, [x20, 280]
	bl	dprint_vfmw
	ldr	w1, [x20, 264]
	mov	w0, 10
	cmp	w1, 1
	beq	.L1187
	cmp	w1, 3
	bne	.L1205
	b	.L1183
	.size	VFMW_CTRL_thread_proc, .-VFMW_CTRL_thread_proc
	.align	3
.LC664:
	.xword	.LANCHOR1
	.align	3
.LC666:
	.xword	.LC665
	.align	3
.LC668:
	.xword	.LC667
	.align	3
.LC670:
	.xword	.LC669
	.align	3
.LC672:
	.xword	.LC671
	.align	3
.LC673:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC675:
	.xword	.LC674
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
	ldr	x0, .LC677
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1225
	ldr	w1, [x0, 672]
	cmp	w1, 20
	bls	.L1226
.L1225:
	mov	x0, 0
.L1207:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1226:
	ldr	x2, .LC678
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx1209
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx1209:
	.section	.rodata
	.align	0
	.align	2
.L1209:
	.byte	(.L1223 - .Lrtx1209) / 4
	.byte	(.L1210 - .Lrtx1209) / 4
	.byte	(.L1211 - .Lrtx1209) / 4
	.byte	(.L1212 - .Lrtx1209) / 4
	.byte	(.L1225 - .Lrtx1209) / 4
	.byte	(.L1213 - .Lrtx1209) / 4
	.byte	(.L1214 - .Lrtx1209) / 4
	.byte	(.L1225 - .Lrtx1209) / 4
	.byte	(.L1215 - .Lrtx1209) / 4
	.byte	(.L1216 - .Lrtx1209) / 4
	.byte	(.L1217 - .Lrtx1209) / 4
	.byte	(.L1217 - .Lrtx1209) / 4
	.byte	(.L1217 - .Lrtx1209) / 4
	.byte	(.L1218 - .Lrtx1209) / 4
	.byte	(.L1225 - .Lrtx1209) / 4
	.byte	(.L1219 - .Lrtx1209) / 4
	.byte	(.L1220 - .Lrtx1209) / 4
	.byte	(.L1221 - .Lrtx1209) / 4
	.byte	(.L1222 - .Lrtx1209) / 4
	.byte	(.L1225 - .Lrtx1209) / 4
	.byte	(.L1223 - .Lrtx1209) / 4
	.text
	.p2align 3
.L1223:
	add	x0, x0, 507904
	ldr	x19, [sp, 16]
	add	x0, x0, 2104
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1210:
	add	x0, x0, 561152
	add	x0, x0, 2392
	b	.L1207
	.p2align 3
.L1220:
	add	x0, x0, 516096
	add	x0, x0, 848
	b	.L1207
	.p2align 3
.L1219:
	add	x0, x0, 507904
	add	x0, x0, 3008
	b	.L1207
	.p2align 3
.L1218:
	add	x0, x0, 516096
	add	x0, x0, 2136
	b	.L1207
	.p2align 3
.L1217:
	add	x0, x0, 520192
	add	x0, x0, 2568
	b	.L1207
	.p2align 3
.L1222:
	add	x0, x0, 528384
	add	x0, x0, 488
	b	.L1207
	.p2align 3
.L1221:
	add	x0, x0, 786432
	add	x0, x0, 2040
	b	.L1207
	.p2align 3
.L1212:
	add	x0, x0, 598016
	add	x0, x0, 784
	b	.L1207
	.p2align 3
.L1211:
	add	x0, x0, 532480
	add	x0, x0, 240
	b	.L1207
	.p2align 3
.L1216:
	add	x0, x0, 561152
	add	x0, x0, 3792
	b	.L1207
	.p2align 3
.L1215:
	add	x0, x0, 561152
	add	x0, x0, 3816
	b	.L1207
	.p2align 3
.L1214:
	add	x0, x0, 524288
	add	x0, x0, 1976
	b	.L1207
	.p2align 3
.L1213:
	add	x0, x0, 548864
	add	x0, x0, 3760
	b	.L1207
	.size	VCTRL_GetChanVoQue, .-VCTRL_GetChanVoQue
	.align	3
.LC677:
	.xword	.LANCHOR1
	.align	3
.LC678:
	.xword	.L1209
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_FindOccupiedFrame
	.type	VCTRL_FindOccupiedFrame, %function
VCTRL_FindOccupiedFrame:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L1243
	mov	w0, w19
	bl	VCTRL_GetChanVoQue
	mov	x20, x0
	cbz	x0, .L1237
	add	x2, x29, 48
	add	x1, x29, 40
	str	wzr, [x29, 40]
	str	wzr, [x2, -4]!
	bl	GetQueueImgNum
	ldr	w2, [x29, 40]
	mov	w0, -1
	cbz	w2, .L1229
	cmp	w2, 32
	bhi	.L1244
.L1231:
	ldr	x1, .LC684
	ldrh	w0, [x20, 4]
	ldr	x5, [x1, w19, sxtw 3]
	and	x0, x0, 63
	add	x0, x0, 2
	add	x6, x5, 507904
	ldr	x4, [x20, x0, lsl 3]
	ldr	w3, [x6, 2016]
	cmp	w3, 32
	bhi	.L1232
	mov	w1, 1
	b	.L1234
	.p2align 3
.L1235:
	ldrh	w0, [x20, 4]
	cmp	w3, 33
	add	w0, w0, w1
	add	w1, w1, 1
	and	x0, x0, 63
	add	x0, x0, 2
	ldr	x4, [x20, x0, lsl 3]
	beq	.L1232
.L1234:
	ubfiz	x0, x3, 4, 32
	ldr	w4, [x4, 20]
	add	x0, x5, x0
	add	w3, w3, 1
	add	x0, x0, 507904
	cmp	w1, w2
	str	wzr, [x0, 1488]
	str	w4, [x0, 1492]
	str	xzr, [x0, 1496]
	str	w3, [x6, 2016]
	bcc	.L1235
	mov	w0, 0
.L1229:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1232:
	ldr	x1, .LC686
	mov	w2, w19
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1229
	.p2align 3
.L1244:
	ldr	x1, .LC683
	mov	w3, 32
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w2, [x29, 40]
	cbnz	w2, .L1231
	mov	w0, 0
	b	.L1229
.L1237:
	mov	w0, -1
	b	.L1229
.L1243:
	ldr	x2, .LC680
	mov	w3, 3265
	ldr	x4, .LC679
	mov	w0, 0
	ldr	x1, .LC681
	add	x2, x2, 328
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1229
	.size	VCTRL_FindOccupiedFrame, .-VCTRL_FindOccupiedFrame
	.align	3
.LC679:
	.xword	.LC198
	.align	3
.LC680:
	.xword	.LANCHOR4
	.align	3
.LC681:
	.xword	.LC6
	.align	3
.LC683:
	.xword	.LC682
	.align	3
.LC684:
	.xword	.LANCHOR1
	.align	3
.LC686:
	.xword	.LC685
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ReportOccupiedFrame
	.type	VCTRL_ReportOccupiedFrame, %function
VCTRL_ReportOccupiedFrame:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w22, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w22, 31
	bhi	.L1262
	cbz	x19, .L1263
	mov	w0, w22
	bl	VCTRL_GetChanVoQue
	mov	x20, x0
	cbz	x0, .L1255
	ldr	x21, .LC692
	add	x23, x29, 80
	mov	w0, 4
	str	wzr, [x29, 72]
	ldr	x1, [x21, 24]
	str	wzr, [x23, -4]!
	blr	x1
	mov	x2, x23
	add	x1, x29, 72
	mov	x0, x20
	bl	GetQueueImgNum
	ldr	w2, [x29, 72]
	cbnz	w2, .L1264
	ldr	x6, .LC694
	ldr	x4, [x6, w22, sxtw 3]
	add	x0, x4, 507904
	ldr	w0, [x0, 2016]
	cbz	w0, .L1253
	mov	w2, 0
	sxtw	x0, w22
	.p2align 2
.L1254:
	sxtw	x3, w2
	add	w2, w2, 1
	add	x1, x3, 28672
	lsl	x3, x3, 4
	add	x1, x1, 3165
	add	x5, x19, x3
	lsl	x1, x1, 4
	sxth	w2, w2
	add	x4, x4, x1
	ldr	w4, [x4, 4]
	str	w4, [x5, 4]
	ldr	x4, [x6, x0, lsl 3]
	add	x1, x4, x1
	ldr	x1, [x1, 8]
	str	x1, [x5, 8]
	str	wzr, [x19, x3]
	ldr	x4, [x6, x0, lsl 3]
	add	x1, x4, 507904
	ldr	w1, [x1, 2016]
	cmp	w2, w1
	bcc	.L1254
	str	w1, [x19, 528]
	b	.L1253
	.p2align 3
.L1264:
	cmp	w2, 32
	bhi	.L1265
.L1250:
	mov	w0, 0
	.p2align 2
.L1252:
	ldrh	w1, [x20, 4]
	sbfiz	x3, x0, 4, 32
	add	w5, w0, 1
	add	x4, x19, x3
	add	w0, w1, w0
	and	x1, x0, 63
	sxth	w0, w5
	add	x1, x1, 2
	cmp	w2, w0
	ldr	x1, [x20, x1, lsl 3]
	ldr	w5, [x1, 20]
	str	w5, [x4, 4]
	ldr	x1, [x1, 504]
	str	x1, [x4, 8]
	str	wzr, [x19, x3]
	bhi	.L1252
	uxth	w1, w2
.L1251:
	ldrh	w0, [x20, 4]
	add	w0, w1, w0
	and	w0, w0, 63
	strh	w0, [x20, 4]
	str	w2, [x19, 528]
.L1253:
	ldr	x1, [x21, 32]
	mov	w0, 4
	blr	x1
	mov	w0, 0
.L1247:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1265:
	ldr	x1, .LC693
	mov	w3, 32
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w2, [x29, 72]
	cbnz	w2, .L1250
	mov	w2, 0
	mov	w1, 0
	b	.L1251
.L1255:
	mov	w0, -1
	b	.L1247
.L1262:
	ldr	x2, .LC688
	mov	w3, 3341
	ldr	x4, .LC687
	mov	w0, 0
	ldr	x1, .LC689
	add	x2, x2, 352
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1247
.L1263:
	ldr	x2, .LC688
	mov	w3, 3342
	ldr	x4, .LC691
	mov	w0, 0
	ldr	x1, .LC689
	add	x2, x2, 352
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1247
	.size	VCTRL_ReportOccupiedFrame, .-VCTRL_ReportOccupiedFrame
	.align	3
.LC687:
	.xword	.LC198
	.align	3
.LC688:
	.xword	.LANCHOR4
	.align	3
.LC689:
	.xword	.LC6
	.align	3
.LC691:
	.xword	.LC690
	.align	3
.LC692:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC693:
	.xword	.LC682
	.align	3
.LC694:
	.xword	.LANCHOR1
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
	mov	x20, x1
	mov	x0, x30
	mov	x21, x2
	mov	x22, x3
	bl	_mcount
	cbz	x20, .L1279
	cbz	x21, .L1280
	cbz	x22, .L1281
	cmp	w19, 31
	bhi	.L1282
	ldr	x23, .LC704
	ldr	x0, [x23, w19, sxtw 3]
	cbz	x0, .L1283
	mov	w0, w19
	bl	VCTRL_GetChanVoQue
	cbz	x0, .L1273
	mov	x1, x21
	mov	x2, x22
	bl	GetQueueImgNum
	ldr	x1, [x23, w19, sxtw 3]
	ldr	w0, [x1, 672]
	cbz	w0, .L1284
	cmp	w0, 16
	beq	.L1285
	cmp	w0, 17
	beq	.L1286
	cmp	w0, 15
	beq	.L1287
	cmp	w0, 18
	beq	.L1288
	mov	w0, 2
	str	w0, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1273:
	str	wzr, [x22]
	str	wzr, [x21]
	str	wzr, [x20]
.L1266:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1282:
	ldr	x2, .LC697
	mov	w3, 5855
	ldr	x4, .LC703
	mov	w0, 0
	ldr	x1, .LC698
	add	x2, x2, 384
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1284:
	add	x1, x1, 536576
	ldr	w0, [x1, 1704]
	str	w0, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1285:
	add	x1, x1, 512000
	ldr	w0, [x1, 1376]
	str	w0, [x20]
	b	.L1266
	.p2align 3
.L1286:
	mov	w0, 9
	str	w0, [x20]
	b	.L1266
	.p2align 3
.L1279:
	ldr	x2, .LC697
	mov	w3, 5852
	ldr	x4, .LC696
	mov	w0, 0
	ldr	x1, .LC698
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L1266
	.p2align 3
.L1280:
	ldr	x2, .LC697
	mov	w3, 5853
	ldr	x4, .LC700
	mov	w0, 0
	ldr	x1, .LC698
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L1266
	.p2align 3
.L1288:
	mov	w0, 5
	str	w0, [x20]
	b	.L1266
	.p2align 3
.L1281:
	ldr	x2, .LC697
	mov	w3, 5854
	ldr	x4, .LC702
	mov	w0, 0
	ldr	x1, .LC698
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L1266
	.p2align 3
.L1287:
	add	x1, x1, 11632640
	ldr	w0, [x1, 2920]
	str	w0, [x20]
	b	.L1266
	.p2align 3
.L1283:
	ldr	x2, .LC697
	mov	w3, 5856
	ldr	x4, .LC705
	ldr	x1, .LC698
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L1266
	.size	VCTRL_GetChanImgNum, .-VCTRL_GetChanImgNum
	.align	3
.LC696:
	.xword	.LC695
	.align	3
.LC697:
	.xword	.LANCHOR4
	.align	3
.LC698:
	.xword	.LC6
	.align	3
.LC700:
	.xword	.LC699
	.align	3
.LC702:
	.xword	.LC701
	.align	3
.LC703:
	.xword	.LC198
	.align	3
.LC704:
	.xword	.LANCHOR1
	.align	3
.LC705:
	.xword	.LC9
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanState
	.type	VCTRL_GetChanState, %function
VCTRL_GetChanState:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1299
	cmp	w20, 31
	bhi	.L1300
	ldr	x21, .LC713
	ldr	x0, [x21, w20, sxtw 3]
	cbz	x0, .L1301
	ldr	x0, .LC715
	mov	x2, 100
	mov	w1, 0
	str	wzr, [x29, 68]
	stp	wzr, wzr, [x29, 60]
	ldr	x3, [x0, 96]
	mov	x0, x19
	blr	x3
	ldr	x0, [x21, w20, sxtw 3]
	ldr	w0, [x0, 1296]
	str	w0, [x19, 32]
	ldr	x0, [x21, w20, sxtw 3]
	ldr	w0, [x0, 1300]
	str	w0, [x19, 36]
	ldr	x0, [x21, w20, sxtw 3]
	ldr	w0, [x0, 1304]
	str	w0, [x19, 44]
	ldr	x5, [x21, w20, sxtw 3]
	add	x0, x5, 475136
	ldrsb	w0, [x0, 2331]
	cmp	w0, wzr
	ble	.L1297
	mov	x2, 40974
	sub	w4, w0, #1
	mov	w3, 92
	movk	x2, 0x7, lsl 16
	add	x0, x5, 495616
	mov	w1, 0
	umaddl	x2, w4, w3, x2
	add	x0, x0, 4018
	add	x3, x5, x2
	.p2align 2
.L1296:
	ldrsb	w2, [x0], 92
	cmp	w2, 3
	csinc	w1, w1, w1, ne
	cmp	x0, x3
	bne	.L1296
.L1294:
	str	w1, [x19, 84]
	add	x3, x29, 68
	add	x2, x29, 64
	mov	w0, w20
	ldr	x4, [x21, w20, sxtw 3]
	add	x1, x29, 60
	sxtw	x22, w20
	add	x4, x4, 475136
	ldrsb	w4, [x4, 2331]
	str	w4, [x19, 92]
	bl	VCTRL_GetChanImgNum
	ldr	x2, .LC716
	lsl	x1, x22, 6
	add	x22, x1, x22, lsl 3
	add	x1, x29, 72
	add	x2, x2, 912
	ldp	w3, w0, [x29, 64]
	add	x22, x2, x22
	add	w0, w3, w0
	str	w0, [x19, 48]
	mov	w0, w20
	ldr	w2, [x22, 20]
	str	w2, [x19, 96]
	ldr	w2, [x22, 8]
	str	w2, [x19, 20]
	bl	SM_GetInfo
	ldp	w1, w2, [x29, 88]
	ldr	w0, [x29, 80]
	cmp	w2, 10
	stp	w1, w0, [x19, 52]
	cset	w0, gt
	str	w0, [x19, 80]
	mov	x0, 63536
	ldr	x1, [x21, w20, sxtw 3]
	movk	x0, 0x7, lsl 16
	add	x0, x1, x0
	ldrb	w0, [x0, 3616]
	and	w0, w0, 1
	str	w0, [x19, 88]
.L1289:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1300:
	ldr	x2, .LC710
	mov	w3, 1262
	ldr	x4, .LC712
	mov	w0, 0
	ldr	x1, .LC711
	add	x2, x2, 408
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1301:
	ldr	x2, .LC710
	mov	w3, 1263
	ldr	x4, .LC714
	ldr	x1, .LC711
	add	x2, x2, 408
	bl	dprint_vfmw
	b	.L1289
.L1297:
	mov	w1, 0
	b	.L1294
.L1299:
	ldr	x2, .LC710
	mov	w3, 1261
	ldr	x4, .LC709
	mov	w0, 0
	ldr	x1, .LC711
	add	x2, x2, 408
	bl	dprint_vfmw
	b	.L1289
	.size	VCTRL_GetChanState, .-VCTRL_GetChanState
	.align	3
.LC709:
	.xword	.LC708
	.align	3
.LC710:
	.xword	.LANCHOR4
	.align	3
.LC711:
	.xword	.LC6
	.align	3
.LC712:
	.xword	.LC385
	.align	3
.LC713:
	.xword	.LANCHOR1
	.align	3
.LC714:
	.xword	.LC390
	.align	3
.LC715:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC716:
	.xword	.LANCHOR5
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanWidth
	.type	VCTRL_GetChanWidth, %function
VCTRL_GetChanWidth:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L1306
	ldr	x0, .LC721
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1307
	ldr	w0, [x0, 1412]
.L1304:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1306:
	ldr	x2, .LC719
	mov	w3, 5919
	ldr	x4, .LC718
	mov	w0, 0
	ldr	x1, .LC720
	add	x2, x2, 432
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1304
.L1307:
	ldr	x2, .LC719
	mov	w3, 5920
	ldr	x4, .LC722
	ldr	x1, .LC720
	add	x2, x2, 432
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1304
	.size	VCTRL_GetChanWidth, .-VCTRL_GetChanWidth
	.align	3
.LC718:
	.xword	.LC198
	.align	3
.LC719:
	.xword	.LANCHOR4
	.align	3
.LC720:
	.xword	.LC6
	.align	3
.LC721:
	.xword	.LANCHOR1
	.align	3
.LC722:
	.xword	.LC9
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanHeight
	.type	VCTRL_GetChanHeight, %function
VCTRL_GetChanHeight:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L1312
	ldr	x0, .LC726
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1313
	ldr	w0, [x0, 1416]
.L1310:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1312:
	ldr	x2, .LC724
	mov	w3, 5927
	ldr	x4, .LC723
	mov	w0, 0
	ldr	x1, .LC725
	add	x2, x2, 456
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1310
.L1313:
	ldr	x2, .LC724
	mov	w3, 5928
	ldr	x4, .LC727
	ldr	x1, .LC725
	add	x2, x2, 456
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1310
	.size	VCTRL_GetChanHeight, .-VCTRL_GetChanHeight
	.align	3
.LC723:
	.xword	.LC198
	.align	3
.LC724:
	.xword	.LANCHOR4
	.align	3
.LC725:
	.xword	.LC6
	.align	3
.LC726:
	.xword	.LANCHOR1
	.align	3
.LC727:
	.xword	.LC9
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanCapLevel
	.type	VCTRL_GetChanCapLevel, %function
VCTRL_GetChanCapLevel:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L1318
	ldr	x0, .LC731
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1317
	ldr	w0, [x0, 36]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1318:
	ldr	x2, .LC729
	mov	w3, 5935
	ldr	x4, .LC728
	mov	w0, 0
	ldr	x1, .LC730
	add	x2, x2, 480
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1317:
	mov	w0, 33
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetChanCapLevel, .-VCTRL_GetChanCapLevel
	.align	3
.LC728:
	.xword	.LC198
	.align	3
.LC729:
	.xword	.LANCHOR4
	.align	3
.LC730:
	.xword	.LC6
	.align	3
.LC731:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetVdecExtra
	.type	VCTRL_SetVdecExtra, %function
VCTRL_SetVdecExtra:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x20, .LC732
	add	w0, w21, 4096
	mov	w1, 10000
	add	w0, w0, 904
	mov	w2, w21
	cmp	w0, w1
	str	w21, [x20, 3696]
	bhi	.L1324
.L1320:
	mov	w3, 5000
	mov	w1, -5000
	cmp	w2, w3
	add	w0, w19, 4096
	csel	w2, w2, w3, le
	add	w0, w0, 904
	cmp	w2, w1
	mov	w3, 10000
	csel	w2, w2, w1, ge
	str	w19, [x20, 3700]
	cmp	w0, w3
	str	w2, [x20, 3696]
	bhi	.L1325
.L1321:
	mov	w2, 5000
	mov	w0, -5000
	cmp	w19, w2
	csel	w19, w19, w2, le
	cmp	w19, w0
	csel	w19, w19, w0, ge
	str	w19, [x20, 3700]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1324:
	ldr	x1, .LC734
	mov	w0, 32
	bl	dprint_vfmw
	ldr	w2, [x20, 3696]
	b	.L1320
	.p2align 3
.L1325:
	ldr	x1, .LC736
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	w19, [x20, 3700]
	b	.L1321
	.size	VCTRL_SetVdecExtra, .-VCTRL_SetVdecExtra
	.align	3
.LC732:
	.xword	.LANCHOR3
	.align	3
.LC734:
	.xword	.LC733
	.align	3
.LC736:
	.xword	.LC735
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VfmwProcGetHandler
	.type	VfmwProcGetHandler, %function
VfmwProcGetHandler:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbz	w19, .L1330
	ldr	x3, .LC739
	mov	w1, 1
	ldr	x0, .LC737
	add	x3, x3, 504
	b	.L1328
	.p2align 3
.L1329:
	ldr	w4, [x3, x4]
	add	w1, w1, 1
	ubfiz	x2, x1, 4, 32
	cmp	w4, w19
	add	x2, x3, x2
	beq	.L1327
	ldr	x0, [x2, 8]
.L1328:
	ubfiz	x4, x1, 4, 32
	cbnz	x0, .L1329
.L1327:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1330:
	ldr	x0, .LC738
	b	.L1327
	.size	VfmwProcGetHandler, .-VfmwProcGetHandler
	.align	3
.LC737:
	.xword	VfmwProc_SetErrorThread
	.align	3
.LC738:
	.xword	VfmwProc_SetPrintLevel
	.align	3
.LC739:
	.xword	.LANCHOR4
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
	cbz	x20, .L1341
	cbz	w19, .L1338
	ldr	x4, .LC743
	mov	w0, 1
	ldr	x5, .LC741
	add	x4, x4, 504
	b	.L1334
	.p2align 3
.L1339:
	ldr	w6, [x4, x6]
	add	w0, w0, 1
	ubfiz	x3, x0, 4, 32
	cmp	w19, w6
	add	x3, x4, x3
	beq	.L1333
	ldr	x5, [x3, 8]
.L1334:
	ubfiz	x6, x0, 4, 32
	cbnz	x5, .L1339
	ldr	x1, .LC745
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
.L1341:
	mov	w0, -2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1338:
	ldr	x5, .LC742
.L1333:
	mov	x0, x20
	blr	x5
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetDbgOption, .-VCTRL_SetDbgOption
	.align	3
.LC741:
	.xword	VfmwProc_SetErrorThread
	.align	3
.LC742:
	.xword	VfmwProc_SetPrintLevel
	.align	3
.LC743:
	.xword	.LANCHOR4
	.align	3
.LC745:
	.xword	.LC744
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
	cmp	w19, 31
	bhi	.L1348
	ldr	x0, .LC747
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1342
	str	w20, [x0, 516]
.L1342:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1348:
	bl	VCTRL_SetLastFrameState.part.24
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetLastFrameState, .-VCTRL_SetLastFrameState
	.align	3
.LC747:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ReportLastFrame
	.type	VCTRL_ReportLastFrame, %function
VCTRL_ReportLastFrame:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	w20, w1
	mov	x0, x30
	bl	_mcount
	cbz	w20, .L1356
	cmp	w20, 1
	mov	w0, 3
	mov	w1, 4
	csel	w0, w0, w1, eq
	cmp	w19, 31
	bhi	.L1363
.L1353:
	ldr	x21, .LC748
	ldr	x1, [x21, w19, sxtw 3]
	cbz	x1, .L1354
	str	w0, [x1, 516]
.L1354:
	ldr	x0, .LC749
	ldr	x4, [x0, 392]
	cbz	x4, .L1355
	add	x2, x29, 64
	mov	w3, 4
	mov	w1, 115
	mov	w0, w19
	str	w20, [x2, -8]!
	blr	x4
.L1355:
	ldr	x4, [x21, w19, sxtw 3]
	mov	w3, w20
	ldr	x1, .LC751
	mov	w2, w19
	mov	w0, 1
	ldr	w4, [x4, 516]
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1356:
	cmp	w19, 31
	mov	w0, 2
	bls	.L1353
.L1363:
	bl	VCTRL_SetLastFrameState.part.24
	ldr	x21, .LC748
	b	.L1354
	.size	VCTRL_ReportLastFrame, .-VCTRL_ReportLastFrame
	.align	3
.LC748:
	.xword	.LANCHOR1
	.align	3
.LC749:
	.xword	.LANCHOR5
	.align	3
.LC751:
	.xword	.LC750
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
	cmp	w20, 31
	bhi	.L1392
	ldr	x0, .LC755
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L1393
	add	x0, x0, 507904
	ldr	w1, [x0, 2088]
	cmp	w1, 18
	bls	.L1394
.L1385:
	mov	w1, 1
	mov	w0, w20
	bl	VCTRL_ReportLastFrame
	ldr	x1, .LC759
	mov	w0, 2
	bl	dprint_vfmw
	mov	w0, -1
.L1366:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1394:
	ldr	x2, .LC757
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx1370
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx1370:
	.section	.rodata
	.align	0
	.align	2
.L1370:
	.byte	(.L1369 - .Lrtx1370) / 4
	.byte	(.L1371 - .Lrtx1370) / 4
	.byte	(.L1372 - .Lrtx1370) / 4
	.byte	(.L1373 - .Lrtx1370) / 4
	.byte	(.L1385 - .Lrtx1370) / 4
	.byte	(.L1374 - .Lrtx1370) / 4
	.byte	(.L1375 - .Lrtx1370) / 4
	.byte	(.L1385 - .Lrtx1370) / 4
	.byte	(.L1376 - .Lrtx1370) / 4
	.byte	(.L1377 - .Lrtx1370) / 4
	.byte	(.L1378 - .Lrtx1370) / 4
	.byte	(.L1378 - .Lrtx1370) / 4
	.byte	(.L1378 - .Lrtx1370) / 4
	.byte	(.L1379 - .Lrtx1370) / 4
	.byte	(.L1385 - .Lrtx1370) / 4
	.byte	(.L1380 - .Lrtx1370) / 4
	.byte	(.L1381 - .Lrtx1370) / 4
	.byte	(.L1382 - .Lrtx1370) / 4
	.byte	(.L1383 - .Lrtx1370) / 4
	.text
	.p2align 3
.L1383:
	add	x0, x0, 2096
	bl	AVS2DEC_GetRemainImg
	mov	w19, w0
	.p2align 2
.L1368:
	cmn	w19, #1
	beq	.L1385
	cbnz	w19, .L1395
	mov	w0, w20
	mov	w1, 0
	bl	VCTRL_ReportLastFrame
	ldr	x1, .LC761
	mov	w0, 2
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1382:
	add	x0, x0, 2096
	bl	VP9DEC_GetRemainImg
	mov	w19, w0
	b	.L1368
	.p2align 3
.L1381:
	add	x0, x0, 2096
	bl	HEVCDEC_GetRemainImg
	mov	w19, w0
	b	.L1368
	.p2align 3
.L1380:
	add	x0, x0, 2096
	bl	MVC_DEC_GetRemainImg
	mov	w19, w0
	b	.L1368
	.p2align 3
.L1379:
	add	x0, x0, 2096
	bl	VP8DEC_GetRemainImg
	mov	w19, w0
	b	.L1368
	.p2align 3
.L1378:
	add	x0, x0, 2096
	bl	VP6DEC_GetRemainImg
	mov	w19, w0
	b	.L1368
	.p2align 3
.L1377:
	add	x0, x0, 2096
	bl	REAL9DEC_GetRemainImg
	mov	w19, w0
	b	.L1368
	.p2align 3
.L1376:
	add	x0, x0, 2096
	bl	REAL8DEC_GetRemainImg
	mov	w19, w0
	b	.L1368
	.p2align 3
.L1375:
	add	x0, x0, 2096
	bl	AVSDEC_GetRemainImg
	mov	w19, w0
	b	.L1368
	.p2align 3
.L1374:
	add	x0, x0, 2096
	bl	DIVX3DEC_GetRemainImg
	mov	w19, w0
	b	.L1368
	.p2align 3
.L1373:
	add	x0, x0, 2096
	bl	MPEG2DEC_GetRemainImg
	mov	w19, w0
	b	.L1368
	.p2align 3
.L1372:
	add	x0, x0, 2096
	bl	MPEG4DEC_GetRemainImg
	mov	w19, w0
	b	.L1368
	.p2align 3
.L1371:
	add	x0, x0, 2096
	bl	VC1DEC_GetRemainImg
	mov	w19, w0
	b	.L1368
	.p2align 3
.L1369:
	add	x0, x0, 2096
	bl	H264DEC_GetRemainImg
	mov	w19, w0
	b	.L1368
	.p2align 3
.L1395:
	mov	w1, w19
	mov	w0, w20
	bl	VCTRL_ReportLastFrame
	ldr	x1, .LC763
	sub	w2, w19, #2
	mov	w0, 2
	bl	dprint_vfmw
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1392:
	ldr	x2, .LC753
	mov	w3, 7212
	ldr	x4, .LC752
	mov	w0, 0
	ldr	x1, .LC754
	add	x2, x2, 1224
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1366
.L1393:
	ldr	x2, .LC753
	mov	w3, 7213
	ldr	x4, .LC756
	ldr	x1, .LC754
	add	x2, x2, 1224
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1366
	.size	VCTRL_OutputLastFrame, .-VCTRL_OutputLastFrame
	.align	3
.LC752:
	.xword	.LC198
	.align	3
.LC753:
	.xword	.LANCHOR4
	.align	3
.LC754:
	.xword	.LC6
	.align	3
.LC755:
	.xword	.LANCHOR1
	.align	3
.LC756:
	.xword	.LC9
	.align	3
.LC757:
	.xword	.L1370
	.align	3
.LC759:
	.xword	.LC758
	.align	3
.LC761:
	.xword	.LC760
	.align	3
.LC763:
	.xword	.LC762
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
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	x23, x2
	mov	w22, w3
	bl	_mcount
	ldr	x21, .LC764
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L1435
	ldr	w1, [x0, 672]
	ldr	w24, [x0, 1352]
	cmp	w1, 18
	bls	.L1436
.L1396:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1436:
	ldr	x2, .LC768
	ldrh	w1, [x2,w1,uxtw #1]
	adr	x2, .Lrtx1400
	add	x1, x2, w1, sxth #2
	br	x1
.Lrtx1400:
	.section	.rodata
	.align	0
	.align	2
.L1400:
	.2byte	(.L1399 - .Lrtx1400) / 4
	.2byte	(.L1401 - .Lrtx1400) / 4
	.2byte	(.L1402 - .Lrtx1400) / 4
	.2byte	(.L1403 - .Lrtx1400) / 4
	.2byte	(.L1396 - .Lrtx1400) / 4
	.2byte	(.L1404 - .Lrtx1400) / 4
	.2byte	(.L1405 - .Lrtx1400) / 4
	.2byte	(.L1396 - .Lrtx1400) / 4
	.2byte	(.L1406 - .Lrtx1400) / 4
	.2byte	(.L1407 - .Lrtx1400) / 4
	.2byte	(.L1408 - .Lrtx1400) / 4
	.2byte	(.L1408 - .Lrtx1400) / 4
	.2byte	(.L1408 - .Lrtx1400) / 4
	.2byte	(.L1409 - .Lrtx1400) / 4
	.2byte	(.L1396 - .Lrtx1400) / 4
	.2byte	(.L1410 - .Lrtx1400) / 4
	.2byte	(.L1411 - .Lrtx1400) / 4
	.2byte	(.L1412 - .Lrtx1400) / 4
	.2byte	(.L1413 - .Lrtx1400) / 4
	.text
	.p2align 3
.L1413:
	add	x0, x0, 507904
	mov	w3, w22
	mov	w2, w24
	mov	w1, w20
	add	x0, x0, 2096
	bl	AVS2DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	ldrb	w0, [x0, 2096]
	cmp	w0, 1
	beq	.L1437
.L1421:
	cmp	w24, 1
	beq	.L1396
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	str	xzr, [x0, 2144]
	b	.L1396
	.p2align 3
.L1412:
	add	x0, x0, 507904
	mov	w3, w22
	mov	w2, w24
	mov	w1, w20
	add	x0, x0, 2096
	bl	VP9DEC_VDMPostProc
	cmp	w24, 1
	beq	.L1396
.L1433:
	ldr	x0, [x21, w19, sxtw 3]
.L1434:
	add	x0, x0, 507904
	str	xzr, [x0, 2104]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1411:
	add	x0, x0, 507904
	mov	w5, w22
	mov	w4, w24
	mov	x3, x23
	mov	w2, 1
	mov	w1, w20
	add	x0, x0, 2096
	bl	HEVCDEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	ldrb	w0, [x0, 2107]
	cmp	w0, 1
	beq	.L1438
.L1416:
	cmp	w24, 1
	beq	.L1396
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 512000
	str	xzr, [x0, 1056]
	b	.L1396
	.p2align 3
.L1410:
	add	x0, x0, 507904
	mov	w1, w20
	mov	w2, 1
	add	x0, x0, 2096
	bl	MVC_DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	ldrb	w1, [x0, 2097]
	cmp	w1, 1
	beq	.L1439
	str	xzr, [x0, 2328]
	b	.L1396
	.p2align 3
.L1409:
	add	x0, x0, 507904
	mov	w1, w20
	add	x0, x0, 2096
	bl	VP8DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	str	xzr, [x0, 2104]
	b	.L1396
	.p2align 3
.L1408:
	add	x0, x0, 507904
	mov	w1, w20
	add	x0, x0, 2096
	bl	VP6DEC_VDMPostProc
	b	.L1433
	.p2align 3
.L1407:
	mov	w0, w22
	bl	VDMDRV_GetMb0QpInCurrPic
	mov	w2, w0
	ldr	x3, [x21, w19, sxtw 3]
	mov	w1, w20
	add	x0, x3, 507904
	add	x0, x0, 2096
	bl	REAL9DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	str	xzr, [x0, 2104]
	b	.L1396
	.p2align 3
.L1406:
	mov	w0, w22
	bl	VDMDRV_GetMb0QpInCurrPic
	mov	w2, w0
	ldr	x3, [x21, w19, sxtw 3]
	mov	w1, w20
	add	x0, x3, 507904
	add	x0, x0, 2096
	bl	REAL8DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	str	xzr, [x0, 2104]
	b	.L1396
	.p2align 3
.L1405:
	add	x0, x0, 507904
	mov	w1, w20
	add	x0, x0, 2096
	bl	AVSDEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	ldrb	w1, [x0, 2096]
	cmp	w1, 1
	beq	.L1440
	str	xzr, [x0, 2120]
	b	.L1396
	.p2align 3
.L1404:
	mov	w0, w22
	bl	VDMDRV_GetSwitchRounding
	mov	w2, w0
	ldr	x3, [x21, w19, sxtw 3]
	mov	w1, w20
	add	x0, x3, 507904
	add	x0, x0, 2096
	bl	DIVX3DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	str	xzr, [x0, 2104]
	b	.L1396
	.p2align 3
.L1403:
	add	x0, x0, 507904
	mov	w1, w20
	add	x0, x0, 2096
	bl	MPEG2DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 598016
	ldrb	w1, [x1, 1410]
	cmp	w1, 1
	bne	.L1434
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 598016
	strb	wzr, [x1, 1410]
	b	.L1434
	.p2align 3
.L1402:
	add	x0, x0, 507904
	mov	w1, w20
	mov	x2, x23
	add	x0, x0, 2096
	bl	MPEG4DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 532480
	ldrb	w1, [x1, 884]
	cmp	w1, 1
	beq	.L1441
.L1419:
	add	x0, x0, 507904
	str	xzr, [x0, 3136]
	b	.L1396
	.p2align 3
.L1401:
	add	x0, x0, 507904
	mov	w1, w20
	add	x0, x0, 2096
	bl	VC1DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 524288
	ldrb	w1, [x1, 527]
	cmp	w1, 1
	bne	.L1434
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 524288
	strb	wzr, [x1, 527]
	b	.L1434
	.p2align 3
.L1399:
	add	x0, x0, 507904
	mov	w5, w22
	mov	w4, w24
	mov	x3, x23
	mov	w2, 1
	mov	w1, w20
	add	x0, x0, 2096
	bl	H264DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 524288
	ldrb	w0, [x0, 640]
	cmp	w0, 1
	beq	.L1442
.L1414:
	cmp	w24, 1
	beq	.L1396
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	str	xzr, [x0, 2712]
	b	.L1396
	.p2align 3
.L1440:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	strb	wzr, [x0, 2096]
	str	xzr, [x0, 2120]
	b	.L1396
	.p2align 3
.L1439:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	strb	wzr, [x0, 2097]
	str	xzr, [x0, 2328]
	b	.L1396
	.p2align 3
.L1435:
	ldr	x2, .LC766
	mov	w3, 4215
	ldr	x4, .LC765
	ldr	x1, .LC767
	add	x2, x2, 1248
	bl	dprint_vfmw
	b	.L1396
	.p2align 3
.L1441:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 532480
	strb	wzr, [x1, 884]
	b	.L1419
.L1442:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 524288
	strb	wzr, [x0, 640]
	b	.L1414
.L1438:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	strb	wzr, [x0, 2107]
	b	.L1416
.L1437:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 507904
	strb	wzr, [x0, 2096]
	b	.L1421
	.size	VCTRL_PostProc, .-VCTRL_PostProc
	.align	3
.LC764:
	.xword	.LANCHOR1
	.align	3
.LC765:
	.xword	.LC9
	.align	3
.LC766:
	.xword	.LANCHOR4
	.align	3
.LC767:
	.xword	.LC6
	.align	3
.LC768:
	.xword	.L1400
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
	cmp	w19, 31
	bhi	.L1451
	ldr	x0, .LC772
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1452
	ldr	w0, [x0, 8]
	cmp	w0, 1
	beq	.L1447
	ldr	x2, .LC770
	mov	w3, 4405
	ldr	x4, .LC774
	mov	w0, 0
	ldr	x1, .LC771
	add	x2, x2, 1264
	bl	dprint_vfmw
.L1443:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1447:
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbz	x0, .L1443
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
.L1451:
	ldr	x2, .LC770
	mov	w3, 4403
	ldr	x4, .LC769
	mov	w0, 0
	ldr	x1, .LC771
	add	x2, x2, 1264
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1452:
	ldr	x2, .LC770
	mov	w3, 4404
	ldr	x4, .LC773
	ldr	x1, .LC771
	add	x2, x2, 1264
	bl	dprint_vfmw
	b	.L1443
	.size	VCTRL_VdmPostProc, .-VCTRL_VdmPostProc
	.align	3
.LC769:
	.xword	.LC475
	.align	3
.LC770:
	.xword	.LANCHOR4
	.align	3
.LC771:
	.xword	.LC6
	.align	3
.LC772:
	.xword	.LANCHOR1
	.align	3
.LC773:
	.xword	.LC435
	.align	3
.LC774:
	.xword	.LC481
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SvdecLastFrame
	.type	VCTRL_SvdecLastFrame, %function
VCTRL_SvdecLastFrame:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 31
	bhi	.L1456
	add	w1, w20, 2
	mov	w0, w19
	bl	VCTRL_ReportLastFrame
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1456:
	ldr	x2, .LC776
	mov	w3, 7338
	ldr	x4, .LC775
	mov	w0, 0
	ldr	x1, .LC777
	add	x2, x2, 1288
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SvdecLastFrame, .-VCTRL_SvdecLastFrame
	.align	3
.LC775:
	.xword	.LC198
	.align	3
.LC776:
	.xword	.LANCHOR4
	.align	3
.LC777:
	.xword	.LC6
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Get_YuvFormat
	.type	Get_YuvFormat, %function
Get_YuvFormat:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w19, 6
	bls	.L1475
	ldr	x1, .LC780
	mov	w3, w19
	mov	w2, 7822
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 13
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1475:
	ldr	x0, .LC778
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx1460
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1460:
	.section	.rodata
	.align	0
	.align	2
.L1460:
	.byte	(.L1459 - .Lrtx1460) / 4
	.byte	(.L1461 - .Lrtx1460) / 4
	.byte	(.L1462 - .Lrtx1460) / 4
	.byte	(.L1463 - .Lrtx1460) / 4
	.byte	(.L1464 - .Lrtx1460) / 4
	.byte	(.L1465 - .Lrtx1460) / 4
	.byte	(.L1466 - .Lrtx1460) / 4
	.text
	.p2align 3
.L1465:
	cmp	w20, 1
	mov	w1, 12
	mov	w0, 13
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1466:
	cmp	w20, 1
	mov	w0, 7
	csinc	w0, w0, wzr, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1459:
	cmp	w20, 1
	mov	w0, 6
	csel	w0, wzr, w0, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1461:
	cmp	w20, 1
	mov	w1, 8
	mov	w0, 2
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1462:
	cmp	w20, 1
	mov	w1, 10
	mov	w0, 4
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1463:
	cmp	w20, 1
	mov	w1, 9
	mov	w0, 3
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1464:
	cmp	w20, 1
	mov	w1, 11
	mov	w0, 5
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	Get_YuvFormat, .-Get_YuvFormat
	.align	3
.LC778:
	.xword	.L1460
	.align	3
.LC780:
	.xword	.LC779
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDH_PutUsrdecFrame
	.type	VDH_PutUsrdecFrame, %function
VDH_PutUsrdecFrame:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w21, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x20, 40]
	mov	w0, w21
	bl	FSP_GetLogicIdByPhyAddr
	cmn	w0, #1
	mov	w22, w0
	beq	.L1485
	ldr	w0, [x20, 4]
	cmp	w0, 1
	beq	.L1479
	mov	w0, w21
	mov	w2, 0
	mov	w1, w22
	bl	FSP_ClearLogicFs
	mov	w0, 0
.L1478:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1479:
	ldr	w0, [x20, 48]
	bl	MEM_Phy2Vir
	cbz	x0, .L1486
.L1480:
	mov	w1, w22
	mov	w0, w21
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L1487
	str	w22, [x0, 148]
	mov	w23, 1
	ldr	x0, [x20, 64]
	str	x0, [x19, 576]
	ldr	x0, [x20, 64]
	str	x0, [x19, 584]
	ldr	x0, [x20, 64]
	str	x0, [x19, 592]
	ldr	x0, [x20, 64]
	str	x0, [x19, 600]
	stp	w23, wzr, [x19]
	stp	wzr, wzr, [x19, 8]
	ldr	w0, [x20, 40]
	str	w0, [x19, 20]
	str	w0, [x19, 36]
	ldr	w1, [x20, 48]
	str	w1, [x19, 24]
	str	w1, [x19, 40]
	bl	MEM_Phy2Vir
	str	x0, [x19, 504]
	ldr	w0, [x19, 24]
	bl	MEM_Phy2Vir
	str	x0, [x19, 512]
	ldr	w0, [x19, 20]
	mov	x2, 4
	ldr	w1, [x20, 44]
	ldr	w3, [x19, 24]
	add	w1, w0, w1
	str	w1, [x19, 28]
	ldr	x4, .LC787
	ldr	w0, [x20, 44]
	str	wzr, [x19, 52]
	add	w0, w3, w0
	str	w0, [x19, 32]
	ldr	w0, [x20, 12]
	str	w0, [x19, 68]
	ldr	w0, [x20, 16]
	str	w0, [x19, 72]
	ldr	w0, [x20, 12]
	str	w0, [x19, 76]
	lsr	w1, w0, 1
	ldr	w0, [x20, 16]
	stp	w0, w1, [x19, 80]
	lsr	w0, w0, 1
	str	w0, [x19, 88]
	mov	w1, 0
	add	x0, x19, 64
	ldr	w3, [x20, 44]
	ldr	x4, [x4, 96]
	stp	wzr, w3, [x19, 108]
	str	wzr, [x19, 152]
	lsr	w3, w3, 1
	str	w23, [x19, 164]
	str	w3, [x19, 116]
	blr	x4
	ldrb	w0, [x19, 65]
	ldrb	w1, [x19, 64]
	and	w0, w0, -4
	and	w1, w1, 224
	orr	w0, w0, 12
	bfi	w1, w23, 5, 3
	bfi	w0, w23, 4, 2
	strb	w1, [x19, 64]
	strb	w0, [x19, 65]
	ldr	w0, [x20, 24]
	str	w0, [x19, 212]
	bl	MEM_Phy2Vir
	str	x0, [x19, 520]
	ldr	w1, [x20]
	ldr	w0, [x20, 8]
	bl	Get_YuvFormat
	cmp	w0, 13
	beq	.L1488
	str	w0, [x19, 388]
	mov	w24, 20
	mov	w2, w23
	mov	w1, w22
	ldr	w3, [x20, 56]
	mov	w0, w21
	str	w3, [x19, 364]
	ldr	w3, [x20, 60]
	str	w3, [x19, 360]
	ldr	w3, [x20, 52]
	str	w3, [x19, 368]
	str	w24, [x19, 296]
	bl	FSP_SetDisplay
	ldr	x2, .LC790
	mov	x4, x19
	mov	w1, w24
	mov	w0, w21
	ldr	x2, [x2, w21, sxtw 3]
	add	x2, x2, 507904
	add	x3, x2, 2104
	add	x2, x2, 2096
	bl	InsertImgToVoQueue
	cmp	w0, 1
	mov	w0, 0
	beq	.L1478
	ldr	x1, [x19, 544]
	mov	w0, w21
	bl	FreeUsdByDec
	str	xzr, [x19, 544]
	ldr	x1, [x19, 552]
	mov	w0, w21
	bl	FreeUsdByDec
	str	xzr, [x19, 552]
	mov	w0, w21
	mov	w2, 0
	mov	w1, w22
	bl	FSP_SetDisplay
	mov	w0, -1
	b	.L1478
	.p2align 3
.L1486:
	ldr	w0, [x20, 4]
	cmp	w0, 1
	bne	.L1480
	ldr	x1, .LC784
	mov	w0, 0
	ldr	w2, [x20, 48]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1478
.L1485:
	ldr	x1, .LC782
	mov	w0, 0
	ldr	w2, [x20, 40]
	bl	dprint_vfmw
	mov	w0, w22
	b	.L1478
.L1488:
	ldr	x1, .LC789
	mov	w2, w0
	mov	w0, w23
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1478
.L1487:
	ldr	x1, .LC786
	mov	w2, 4698
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1478
	.size	VDH_PutUsrdecFrame, .-VDH_PutUsrdecFrame
	.align	3
.LC782:
	.xword	.LC781
	.align	3
.LC784:
	.xword	.LC783
	.align	3
.LC786:
	.xword	.LC785
	.align	3
.LC787:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC789:
	.xword	.LC788
	.align	3
.LC790:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_PutUsrdecFrame
	.type	VCTRL_PutUsrdecFrame, %function
VCTRL_PutUsrdecFrame:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x20, .LC791
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1497
	cbz	x21, .L1498
	ldr	w2, [x0, 672]
	cmp	w2, 20
	bne	.L1499
	ldr	x3, .LC799
	mov	x1, x21
	mov	x2, 72
	add	x0, x0, 600
	ldr	x3, [x3, 104]
	blr	x3
	ldr	x1, [x20, w19, sxtw 3]
	mov	w0, w19
	add	x1, x1, 600
	bl	VDH_PutUsrdecFrame
	cbnz	w0, .L1500
.L1491:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1499:
	ldr	x1, .LC798
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1491
	.p2align 3
.L1500:
	ldr	x1, .LC801
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1491
.L1498:
	ldr	x2, .LC793
	mov	w3, 4839
	ldr	x4, .LC796
	mov	w0, 0
	ldr	x1, .LC794
	add	x2, x2, 1312
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1491
.L1497:
	ldr	x2, .LC793
	mov	w3, 4838
	ldr	x4, .LC792
	ldr	x1, .LC794
	add	x2, x2, 1312
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1491
	.size	VCTRL_PutUsrdecFrame, .-VCTRL_PutUsrdecFrame
	.align	3
.LC791:
	.xword	.LANCHOR1
	.align	3
.LC792:
	.xword	.LC9
	.align	3
.LC793:
	.xword	.LANCHOR4
	.align	3
.LC794:
	.xword	.LC6
	.align	3
.LC796:
	.xword	.LC795
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
	.global	VCTRL_CanBeDecodedByHardWare
	.type	VCTRL_CanBeDecodedByHardWare, %function
VCTRL_CanBeDecodedByHardWare:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 4
	mov	w0, 0
	ccmp	w19, 7, 4, ne
	beq	.L1503
	mov	w0, w19
	bl	VCTRL_CanBeDecodedByHardWare.part.26
.L1503:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_CanBeDecodedByHardWare, .-VCTRL_CanBeDecodedByHardWare
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IsChanOpenAndRun
	.type	VCTRL_IsChanOpenAndRun, %function
VCTRL_IsChanOpenAndRun:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 4]
	cmp	w0, 1
	beq	.L1508
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1508:
	ldr	w0, [x19, 8]
	ldr	x19, [sp, 16]
	cmp	w0, 1
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_IsChanOpenAndRun, .-VCTRL_IsChanOpenAndRun
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_OpenHardware
	.type	VCTRL_OpenHardware, %function
VCTRL_OpenHardware:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	cmp	w21, 31
	bhi	.L1544
	ldr	x20, .LC804
	ldr	x0, [x20, w21, sxtw 3]
	cbz	x0, .L1545
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L1513
	ldr	w0, [x0, 672]
	cmp	w0, 22
	beq	.L1513
	cmp	w0, 7
	ccmp	w0, 4, 4, ne
	beq	.L1509
	bl	VCTRL_CanBeDecodedByHardWare.part.26
	cbz	w0, .L1509
	mov	x19, 0
	mov	w22, 0
	.p2align 2
.L1518:
	mov	w0, w19
	bl	VCTRL_IsChanActive
	cbnz	w0, .L1517
	ldr	x0, [x20, x19, lsl 3]
	ldr	w1, [x0, 672]
	cmp	w1, 4
	mov	w0, w1
	ccmp	w1, 7, 4, ne
	beq	.L1517
	bl	VCTRL_CanBeDecodedByHardWare.part.26
	cmp	w0, wzr
	csinc	w22, w22, w22, eq
.L1517:
	add	x19, x19, 1
	cmp	x19, 32
	bne	.L1518
	cmp	w22, 1
	beq	.L1546
.L1519:
	mov	x0, x20
	add	x3, x20, 256
	mov	w2, 0
	.p2align 2
.L1526:
	ldr	x1, [x0]
	add	x0, x0, 8
	cbz	x1, .L1525
	ldr	w1, [x1, 672]
	cmp	w1, 6
	csinc	w2, w2, wzr, ne
.L1525:
	cmp	x0, x3
	bne	.L1526
	cmp	w2, 1
	beq	.L1547
.L1527:
	ldr	x0, [x20, w21, sxtw 3]
	ldr	w0, [x0, 672]
	cmp	w0, 1
	bne	.L1509
	ldr	x0, .LC809
	ldrb	w0, [x0]
	cmp	w0, 1
	bne	.L1548
	ldr	x0, .LC810
	ldr	x1, [x0, 56]
	cbz	x1, .L1509
	mov	w0, 0
	blr	x1
	b	.L1509
	.p2align 3
.L1513:
	ldr	x1, .LC808
	mov	w2, 7883
	mov	w0, 0
	bl	dprint_vfmw
.L1509:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1544:
	ldr	x1, .LC803
	mov	w2, 7871
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1546:
	ldr	x19, .LC809
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L1549
	mov	w1, 0
	mov	w0, w22
	bl	VDH_Need_Module
.L1522:
	ldrb	w0, [x19]
	cmp	w0, 1
	bne	.L1523
	ldr	x0, .LC810
	ldr	x1, [x0, 40]
	cbz	x1, .L1550
	mov	w0, 0
	blr	x1
	b	.L1519
.L1547:
	ldr	x0, .LC809
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L1551
	mov	w1, 0
	mov	w0, 3
	bl	VDH_Need_Module
	b	.L1527
.L1551:
	ldr	x0, .LC810
	ldr	x1, [x0, 24]
	cbz	x1, .L1552
	mov	w0, 0
	blr	x1
	b	.L1527
.L1549:
	ldr	x0, .LC810
	ldr	x1, [x0, 8]
	cbz	x1, .L1553
	mov	w0, 0
	blr	x1
	b	.L1522
.L1545:
	ldr	x1, .LC806
	mov	w2, 7877
	bl	dprint_vfmw
	b	.L1509
.L1548:
	mov	w1, 0
	mov	w0, 2
	bl	VDH_Need_Module
	b	.L1509
.L1523:
	mov	w1, 0
	mov	w0, 0
	bl	VDH_Need_Module
	b	.L1519
.L1550:
	ldr	x1, .LC811
	mov	w2, 7932
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1519
.L1552:
	ldr	x1, .LC811
	mov	w2, 7963
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1527
.L1553:
	ldr	x1, .LC811
	mov	w2, 7918
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1522
	.size	VCTRL_OpenHardware, .-VCTRL_OpenHardware
	.align	3
.LC803:
	.xword	.LC802
	.align	3
.LC804:
	.xword	.LANCHOR1
	.align	3
.LC806:
	.xword	.LC805
	.align	3
.LC808:
	.xword	.LC807
	.align	3
.LC809:
	.xword	g_HalDisable
	.align	3
.LC810:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC811:
	.xword	.LC127
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_StartChan
	.type	VCTRL_StartChan, %function
VCTRL_StartChan:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	cmp	w20, 31
	bhi	.L1565
	ldr	x19, .LC816
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L1566
	ldr	w21, [x0, 4]
	cmp	w21, 1
	bne	.L1567
	ldr	w0, [x0, 672]
	cmp	w0, 22
	beq	.L1568
	mov	w0, w20
	bl	SM_Start
	ldr	x0, [x19, w20, sxtw 3]
	add	x1, x0, 507904
	str	w21, [x1, 2084]
	str	w21, [x0, 8]
	ldr	x0, [x19, w20, sxtw 3]
	str	w21, [x0, 12]
	ldr	x0, [x19, w20, sxtw 3]
	str	wzr, [x0, 24]
	ldr	x0, [x19, w20, sxtw 3]
	str	w21, [x0, 16]
	ldr	x1, [x19, w20, sxtw 3]
	ldr	w0, [x1, 20]
	cbnz	w0, .L1560
	str	w21, [x1, 20]
	mov	x1, 0
	ldr	x0, .LC821
	ldr	x5, .LC822
	b	.L1563
	.p2align 3
.L1570:
	ldr	w4, [x2, 20]
	str	w4, [x3, x1, lsl 2]
	ldr	w2, [x2, 20]
	str	w2, [x5, x1, lsl 2]
	add	x1, x1, 1
	cmp	x1, 32
	beq	.L1569
.L1563:
	ldr	x2, [x19, x1, lsl 3]
	add	x3, x0, 3216
	cbnz	x2, .L1570
	add	x2, x0, 3216
	str	wzr, [x5, x1, lsl 2]
	str	wzr, [x2, x1, lsl 2]
	add	x1, x1, 1
	cmp	x1, 32
	bne	.L1563
	.p2align 2
.L1569:
	add	x0, x0, 3216
	bl	VDMDRV_SetPriority
	mov	w0, w20
	bl	VDMDRV_ClearChanIsDec
.L1560:
	mov	w0, w20
	bl	VDMDRV_ClearChanIsDec
	mov	w0, w20
	bl	VCTRL_OpenHardware
	ldr	x19, .LC823
	ldr	x0, .LC824
	mov	x2, 12
	mov	w1, 0
	ldr	x3, [x19, 96]
	blr	x3
	ldr	x3, [x19, 96]
	mov	x2, 720
	ldr	x0, .LC825
	mov	w1, 0
	blr	x3
	ldr	x3, [x19, 96]
	mov	x2, 2
	ldr	x0, .LC826
	mov	w1, 0
	blr	x3
	ldr	x0, .LC827
	mov	x2, 120
	ldr	x3, [x19, 96]
	mov	w1, 0
	blr	x3
	mov	w0, 0
.L1556:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1567:
	ldr	x2, .LC814
	mov	w3, 2486
	ldr	x4, .LC818
	mov	w0, 0
	ldr	x1, .LC815
	add	x2, x2, 1336
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1556
.L1565:
	ldr	x2, .LC814
	mov	w3, 2484
	ldr	x4, .LC813
	mov	w0, 0
	ldr	x1, .LC815
	add	x2, x2, 1336
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1556
.L1568:
	ldr	x2, .LC814
	mov	w3, 2487
	ldr	x4, .LC820
	mov	w0, 0
	ldr	x1, .LC815
	add	x2, x2, 1336
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1556
.L1566:
	ldr	x2, .LC814
	mov	w3, 2485
	ldr	x4, .LC817
	ldr	x1, .LC815
	add	x2, x2, 1336
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1556
	.size	VCTRL_StartChan, .-VCTRL_StartChan
	.align	3
.LC813:
	.xword	.LC198
	.align	3
.LC814:
	.xword	.LANCHOR4
	.align	3
.LC815:
	.xword	.LC6
	.align	3
.LC816:
	.xword	.LANCHOR1
	.align	3
.LC817:
	.xword	.LC297
	.align	3
.LC818:
	.xword	.LC497
	.align	3
.LC820:
	.xword	.LC819
	.align	3
.LC821:
	.xword	.LANCHOR5
	.align	3
.LC822:
	.xword	g_ChanCtx
	.align	3
.LC823:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC824:
	.xword	g_TimeRecId
	.align	3
.LC825:
	.xword	g_TimeRecTable
	.align	3
.LC826:
	.xword	g_DataRecId
	.align	3
.LC827:
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
	mov	w3, w0
	ldr	x1, .LC830
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestStartChan, .-VfmwProc_TestStartChan
	.align	3
.LC830:
	.xword	.LC829
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CloseHardware
	.type	VCTRL_CloseHardware, %function
VCTRL_CloseHardware:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w25, w0
	mov	x0, x30
	mov	w24, 0
	mov	w22, 0
	bl	_mcount
	ldr	x19, .LC831
	mov	w0, 0
	add	x23, x19, 256
	b	.L1581
	.p2align 3
.L1623:
	ldr	w1, [x20, 4]
	cmp	w1, 1
	beq	.L1620
.L1573:
	add	x19, x19, 8
	cmp	x19, x23
	beq	.L1621
.L1581:
	ldr	x20, [x19]
	cbz	x20, .L1573
	ldr	w21, [x20, 672]
	cbnz	w0, .L1574
	ldr	w1, [x20, 4]
	cmp	w1, 1
	beq	.L1622
.L1574:
	cmp	w22, wzr
	ccmp	w21, 1, 0, eq
	beq	.L1623
.L1577:
	cmp	w24, wzr
	ccmp	w21, 6, 0, eq
	bne	.L1573
	ldr	w1, [x20, 4]
	cmp	w1, 1
	bne	.L1573
	ldr	w26, [x20, 8]
.L1601:
	cmp	w26, 1
	add	x19, x19, 8
	csinc	w24, w24, wzr, ne
	cmp	x19, x23
	bne	.L1581
	.p2align 2
.L1621:
	cbnz	w0, .L1582
	ldr	x19, .LC832
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L1587
	mov	w0, w25
	bl	SCDDRV_ResetSCD
	mov	w0, w25
	bl	VDMDRV_ResetVDH
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L1587
	mov	w1, 0
	mov	w0, 1
	bl	VDH_UnNeed_Module
	ldrb	w0, [x19]
	cmp	w0, 1
	bne	.L1590
.L1629:
	ldr	x0, .LC833
	ldr	x1, [x0, 48]
	cbz	x1, .L1624
	mov	w0, 0
	blr	x1
.L1593:
	mov	w0, 0
	bl	SCDDRV_SetStateIdle
.L1582:
	cbnz	w24, .L1594
	ldr	x0, .LC832
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L1625
	mov	w1, 0
	mov	w0, 3
	bl	VDH_UnNeed_Module
.L1594:
	cbnz	w22, .L1572
	ldr	x0, .LC832
	ldrb	w0, [x0]
	cmp	w0, 1
	bne	.L1626
	ldr	x0, .LC833
	ldr	x1, [x0, 64]
	cbz	x1, .L1572
	mov	w0, 0
	blr	x1
.L1572:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1622:
	ldr	w26, [x20, 8]
	cmp	w26, 1
	beq	.L1627
.L1576:
	cmp	w21, 1
	ccmp	w22, wzr, 0, eq
	bne	.L1577
.L1600:
	cmp	w26, 1
	csinc	w22, w22, wzr, ne
	cmp	w21, 6
	ccmp	w24, wzr, 0, eq
	beq	.L1601
	b	.L1573
	.p2align 3
.L1627:
	cmp	w21, 4
	ccmp	w21, 7, 4, ne
	beq	.L1576
	mov	w0, w21
	bl	VCTRL_CanBeDecodedByHardWare.part.26
	cmp	w0, wzr
	cset	w0, ne
	b	.L1576
.L1587:
	ldr	x0, .LC833
	ldr	x1, [x0, 16]
	cbz	x1, .L1628
	mov	w0, 0
	blr	x1
.L1589:
	mov	w0, 0
	bl	VDMDRV_SetStateIdle
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L1629
.L1590:
	mov	w1, 0
	mov	w0, 0
	bl	VDH_UnNeed_Module
	b	.L1582
.L1626:
	mov	w1, 0
	mov	w0, 2
	bl	VDH_UnNeed_Module
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L1625:
	ldr	x0, .LC833
	ldr	x1, [x0, 32]
	cbz	x1, .L1630
	mov	w0, 0
	blr	x1
	b	.L1594
.L1624:
	ldr	x1, .LC834
	mov	w2, 8057
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1593
.L1628:
	ldr	x1, .LC834
	mov	w2, 8042
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1589
.L1630:
	ldr	x1, .LC834
	mov	w2, 8075
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1594
.L1620:
	ldr	w26, [x20, 8]
	b	.L1600
	.size	VCTRL_CloseHardware, .-VCTRL_CloseHardware
	.align	3
.LC831:
	.xword	.LANCHOR1
	.align	3
.LC832:
	.xword	g_HalDisable
	.align	3
.LC833:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC834:
	.xword	.LC127
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
	cmp	w19, 31
	bhi	.L1637
	ldr	x20, .LC839
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1638
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L1636
	str	w1, [x0, 24]
	mov	w0, w19
	ldr	x1, [x20, w19, sxtw 3]
	str	wzr, [x1, 12]
	ldr	x1, [x20, w19, sxtw 3]
	str	wzr, [x1, 8]
	bl	SM_Stop
	cbnz	w0, .L1636
	mov	w1, 0
	mov	w0, w19
	bl	DeleteRawPacketInBuffer
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	ldr	x1, [x20, w19, sxtw 3]
	mov	w0, w19
	str	wzr, [x1, 24]
	bl	VCTRL_CloseHardware
	mov	w0, 0
.L1633:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1636:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1637:
	ldr	x2, .LC837
	mov	w3, 2571
	ldr	x4, .LC836
	mov	w0, 0
	ldr	x1, .LC838
	add	x2, x2, 1352
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1633
.L1638:
	ldr	x2, .LC837
	mov	w3, 2572
	ldr	x4, .LC841
	ldr	x1, .LC838
	add	x2, x2, 1352
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1633
	.size	VCTRL_StopChan, .-VCTRL_StopChan
	.align	3
.LC836:
	.xword	.LC198
	.align	3
.LC837:
	.xword	.LANCHOR4
	.align	3
.LC838:
	.xword	.LC6
	.align	3
.LC839:
	.xword	.LANCHOR1
	.align	3
.LC841:
	.xword	.LC840
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
	ldr	x19, .LC842
	b	.L1641
	.p2align 3
.L1645:
	ldr	x1, [x19, 240]
	mov	w0, 10
	add	w20, w20, 1
	blr	x1
	cmp	w20, 50
	beq	.L1643
.L1641:
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
	mov	w0, w22
	bl	VCTRL_StopChan
	mov	w21, w0
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	cbnz	w21, .L1645
	cmp	w20, 49
	bgt	.L1643
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1643:
	ldr	x1, .LC844
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VCTRL_StopChanWithCheck, .-VCTRL_StopChanWithCheck
	.align	3
.LC842:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC844:
	.xword	.LC843
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ResetChanWithOption
	.type	VCTRL_ResetChanWithOption, %function
VCTRL_ResetChanWithOption:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	cmp	w19, 31
	bhi	.L1672
	ldr	x20, .LC848
	sxtw	x21, w19
	ldr	x1, [x20, w19, sxtw 3]
	cbz	x1, .L1673
	ldr	w0, [x22]
	cmp	w0, 1
	bhi	.L1674
	mov	w0, w19
	ldr	w24, [x1, 8]
	bl	VCTRL_StopChan
	ldr	x23, .LC852
	ldr	x3, [x20, w19, sxtw 3]
	lsl	x1, x21, 6
	ldr	x0, .LC853
	add	x21, x1, x21, lsl 3
	ldr	x4, [x23, 96]
	mov	x2, 72
	add	x0, x0, 912
	str	wzr, [x3, 520]
	str	wzr, [x3, 524]
	mov	w1, 0
	add	x0, x0, x21
	blr	x4
	mov	w1, 0
	mov	w0, w19
	bl	VCTRL_SetSendStreamAgainFlag
	ldr	x1, [x23, 24]
	mov	w0, 4
	blr	x1
	mov	w0, w19
	bl	VCTRL_FindOccupiedFrame
	ldr	x1, [x23, 32]
	mov	w0, 4
	blr	x1
	ldr	x1, [x20, w19, sxtw 3]
	mov	w0, w19
	ldr	w2, [x22, 4]
	str	w2, [x1, 1344]
	bl	InitSyntaxCtx
	ldr	x0, [x20, w19, sxtw 3]
	add	x1, x0, 507904
	ldr	w0, [x0, 672]
	add	x1, x1, 2096
	bl	ReleaseCurPic
	ldr	x0, [x20, w19, sxtw 3]
	mov	x2, 456
	ldr	x3, [x23, 96]
	mov	w1, 0
	add	x0, x0, 824
	blr	x3
	ldr	x0, [x20, w19, sxtw 3]
	mov	x1, -1
	ldr	w2, [x0, 1616]
	str	x1, [x0, 744]
	cmp	w2, 1
	str	x1, [x0, 752]
	str	wzr, [x0, 1280]
	str	wzr, [x0, 1708]
	beq	.L1675
.L1651:
	ldr	w0, [x0, 672]
	cmp	w0, 20
	beq	.L1652
	ldr	w0, [x22, 8]
	cbz	w0, .L1676
.L1652:
	mov	w0, w19
	bl	FSP_EmptyInstance
.L1653:
	mov	w0, w19
	bl	InitUsdPool
	ldr	w0, [x22]
	cbz	w0, .L1677
.L1654:
	ldr	w0, [x20, 1404]
	cbz	w0, .L1655
	add	x20, x20, 2200
	str	w19, [x29, 76]
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1657
	mov	w0, 512
	add	x1, x29, 76
	bl	VCTRL_SetDbgOption
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1657
	add	x1, x29, 76
	mov	w0, 512
	bl	VCTRL_SetDbgOption
.L1657:
	ldr	x1, .LC855
	mov	w0, 32
	bl	dprint_vfmw
.L1655:
	cbnz	w24, .L1678
.L1659:
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	mov	w0, 0
.L1648:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1677:
	mov	w0, w19
	bl	SM_Reset
	b	.L1654
	.p2align 3
.L1678:
	mov	w0, w19
	bl	VCTRL_StartChan
	b	.L1659
	.p2align 3
.L1675:
	add	x1, x0, 507904
	str	wzr, [x0, 1672]
	str	wzr, [x1, 2020]
	b	.L1651
	.p2align 3
.L1676:
	mov	w0, w19
	bl	FSP_ResetInstance
	b	.L1653
	.p2align 3
.L1674:
	ldr	x1, .LC851
	mov	w2, 3151
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1648
	.p2align 3
.L1672:
	ldr	x2, .LC846
	mov	w3, 3146
	ldr	x4, .LC845
	mov	w0, 0
	ldr	x1, .LC847
	add	x2, x2, 1368
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1648
.L1673:
	ldr	x2, .LC846
	mov	w3, 3147
	ldr	x4, .LC849
	mov	w0, 0
	ldr	x1, .LC847
	add	x2, x2, 1368
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1648
	.size	VCTRL_ResetChanWithOption, .-VCTRL_ResetChanWithOption
	.align	3
.LC845:
	.xword	.LC385
	.align	3
.LC846:
	.xword	.LANCHOR4
	.align	3
.LC847:
	.xword	.LC6
	.align	3
.LC848:
	.xword	.LANCHOR1
	.align	3
.LC849:
	.xword	.LC390
	.align	3
.LC851:
	.xword	.LC850
	.align	3
.LC852:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC853:
	.xword	.LANCHOR5
	.align	3
.LC855:
	.xword	.LC854
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ResetChan
	.type	VCTRL_ResetChan, %function
VCTRL_ResetChan:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L1701
	ldr	x20, .LC861
	ldr	x1, [x20, w19, sxtw 3]
	cbz	x1, .L1702
	mov	w0, w19
	ldr	w22, [x1, 8]
	bl	VCTRL_StopChan
	ldr	x21, .LC863
	ldr	x1, [x20, w19, sxtw 3]
	mov	w0, 4
	ldr	x2, [x21, 24]
	str	wzr, [x1, 520]
	str	wzr, [x1, 524]
	blr	x2
	ldr	x0, [x20, w19, sxtw 3]
	ldr	w1, [x0, 1616]
	cmp	w1, 1
	beq	.L1703
.L1683:
	sxtw	x1, w19
	ldr	x3, .LC864
	lsl	x0, x1, 6
	ldr	x4, [x21, 96]
	add	x3, x3, 912
	add	x0, x0, x1, lsl 3
	mov	x2, 72
	add	x0, x3, x0
	mov	w1, 0
	blr	x4
	mov	w1, 0
	mov	w0, w19
	bl	VCTRL_SetSendStreamAgainFlag
	ldr	x1, [x20, w19, sxtw 3]
	mov	w0, w19
	str	wzr, [x1, 1344]
	bl	InitSyntaxCtx
	ldr	x0, [x20, w19, sxtw 3]
	mov	x2, 456
	ldr	x3, [x21, 96]
	mov	w1, 0
	add	x0, x0, 824
	blr	x3
	ldr	x0, [x20, w19, sxtw 3]
	mov	x2, -1
	add	x1, x0, 507904
	str	x2, [x0, 744]
	str	x2, [x0, 752]
	str	wzr, [x0, 1280]
	str	wzr, [x1, 2040]
	str	wzr, [x1, 2044]
	str	wzr, [x1, 2048]
	str	wzr, [x0, 1708]
	ldr	w2, [x0, 1616]
	cmp	w2, 1
	beq	.L1704
.L1684:
	ldr	w0, [x0, 672]
	cmp	w0, 20
	mov	w0, w19
	beq	.L1685
	bl	FSP_ResetInstance
.L1686:
	ldr	x1, [x21, 32]
	mov	w0, 4
	blr	x1
	mov	w0, w19
	bl	InitUsdPool
	mov	w0, w19
	bl	SM_Reset
	ldr	w0, [x20, 1404]
	cbz	w0, .L1687
	add	x20, x20, 2200
	str	w19, [x29, 60]
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1689
	mov	w0, 512
	add	x1, x29, 60
	bl	VCTRL_SetDbgOption
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1689
	add	x1, x29, 60
	mov	w0, 512
	bl	VCTRL_SetDbgOption
.L1689:
	ldr	x1, .LC865
	mov	w0, 32
	bl	dprint_vfmw
.L1687:
	cbnz	w22, .L1705
.L1691:
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	mov	w0, 0
.L1681:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1705:
	mov	w0, w19
	bl	VCTRL_StartChan
	b	.L1691
	.p2align 3
.L1685:
	bl	FSP_EmptyInstance
	b	.L1686
	.p2align 3
.L1704:
	str	wzr, [x0, 1672]
	str	wzr, [x1, 2020]
	b	.L1684
	.p2align 3
.L1703:
	add	x1, x0, 507904
	ldr	w2, [x0, 672]
	ldr	w1, [x1, 2088]
	cmp	w1, w2
	bne	.L1683
	str	wzr, [x0, 12]
	mov	w0, w19
	bl	VCTRL_FindOccupiedFrame
	b	.L1683
	.p2align 3
.L1701:
	ldr	x2, .LC859
	mov	w3, 3489
	ldr	x4, .LC858
	mov	w0, 0
	ldr	x1, .LC860
	add	x2, x2, 1400
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1681
.L1702:
	ldr	x2, .LC859
	mov	w3, 3490
	ldr	x4, .LC862
	mov	w0, 0
	ldr	x1, .LC860
	add	x2, x2, 1400
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1681
	.size	VCTRL_ResetChan, .-VCTRL_ResetChan
	.align	3
.LC858:
	.xword	.LC385
	.align	3
.LC859:
	.xword	.LANCHOR4
	.align	3
.LC860:
	.xword	.LC6
	.align	3
.LC861:
	.xword	.LANCHOR1
	.align	3
.LC862:
	.xword	.LC390
	.align	3
.LC863:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC864:
	.xword	.LANCHOR5
	.align	3
.LC865:
	.xword	.LC854
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CreateChan
	.type	VCTRL_CreateChan, %function
VCTRL_CreateChan:
	stp	x29, x30, [sp, -416]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w20, w0
	mov	x0, x30
	mov	x27, x1
	mov	w19, w2
	bl	_mcount
	ldr	x22, .LC868
	mov	x2, 72
	mov	w1, 0
	add	x0, x29, 200
	str	wzr, [x29, 108]
	ldr	x3, [x22, 96]
	blr	x3
	ldr	x3, [x22, 96]
	mov	x2, 144
	mov	w1, 0
	add	x0, x29, 272
	blr	x3
	ldr	x3, [x22, 96]
	mov	x2, 16
	mov	w1, 0
	add	x0, x29, 112
	blr	x3
	ldr	x3, [x22, 96]
	mov	x2, 16
	mov	w1, 0
	add	x0, x29, 128
	blr	x3
	cbz	x27, .L1844
	ldr	w0, [x27, 36]
	tbnz	w0, #31, .L1709
	ldr	w0, [x27, 12]
	cmp	w0, 31
	ble	.L1709
	ldr	w0, [x27, 16]
	cmp	w0, 31
	ble	.L1709
	ldr	w1, [x27, 56]
	mov	w0, 262143
	cmp	w1, w0
	ble	.L1709
	ldr	w0, [x27, 44]
	cmp	w0, 1
	beq	.L1845
	cmp	w0, 2
	bne	.L1711
	ldr	w0, [x27, 20]
	cmp	w0, wzr
	ble	.L1709
	ldr	w0, [x27, 24]
	cmp	w0, wzr
	ble	.L1709
.L1836:
	ldr	w0, [x27, 28]
	cmp	w0, wzr
	ble	.L1709
	ldr	w0, [x27, 32]
	cmp	w0, wzr
	bgt	.L1711
.L1709:
	ldr	x1, .LC871
	mov	w0, 0
	bl	dprint_vfmw
.L1708:
	mov	w0, -1
.L1866:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 416
	ret
	.p2align 3
.L1711:
	ldr	w0, [x27, 216]
	cmp	w0, 1
	bls	.L1713
	str	wzr, [x27, 216]
.L1713:
	mov	w3, w19
	mov	w0, 47888
	mov	w19, 18336
	movk	w0, 0xf, lsl 16
	cmp	w20, 26
	movk	w19, 0xb5, lsl 16
	mov	w21, 1
	csel	w19, w19, w0, eq
	add	x2, x29, 128
	mov	x1, x27
	mov	w0, w20
	stp	w21, w21, [x27, 240]
	bl	VCTRL_GetChanMemSize
	cbnz	w0, .L1846
	ldr	x25, .LC874
	ldr	x0, [x25]
	cbz	x0, .L1847
	add	x0, x25, 8
	b	.L1718
	.p2align 3
.L1849:
	add	w21, w21, 1
	cmp	w21, 32
	beq	.L1848
.L1718:
	ldr	x1, [x0]
	add	x0, x0, 8
	cbnz	x1, .L1849
.L1717:
	ldr	w0, [x27, 252]
	cmp	w0, 1
	beq	.L1779
.L1720:
	cmp	w21, 31
	bhi	.L1772
	mov	x1, x25
	add	x3, x25, 256
	mov	w0, 0
	.p2align 2
.L1722:
	ldr	x2, [x1], 8
	cmp	x2, xzr
	csinc	w0, w0, w0, eq
	cmp	x3, x1
	bne	.L1722
	cbz	w0, .L1850
	mov	w26, 0
	add	x23, x29, 168
.L1723:
	ldr	x3, [x22, 96]
	add	x24, x27, 72
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	ldr	x0, [x24, 56]
	cbz	x0, .L1733
	ldr	w0, [x24, 64]
	cbnz	w0, .L1734
.L1733:
	mov	w1, 3
	mov	w0, 7
	str	w1, [x29, 196]
	bl	VFMW_GetString
	ldr	w2, [x29, 136]
	mov	w4, 1
	mov	x3, x23
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1851
	ldr	w0, [x29, 184]
	ldr	w2, [x29, 192]
	ldr	x1, [x29, 176]
	bl	MEM_AddMemRecord
	ldr	w0, [x29, 184]
	str	w0, [x29, 320]
	ldr	x0, [x29, 176]
	str	x0, [x29, 328]
	ldr	w0, [x29, 192]
	str	w0, [x29, 336]
	mov	w0, 1
	str	w0, [x29, 120]
.L1737:
	ldr	x3, [x22, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	ldr	x0, [x24, 8]
	cbz	x0, .L1774
	ldr	w0, [x24, 16]
	cbnz	w0, .L1739
.L1774:
	ldr	w0, [x27, 216]
	cmp	w0, 1
	beq	.L1740
	mov	w1, 3
	mov	w0, 8
	str	w1, [x29, 196]
	bl	VFMW_GetString
	ldr	w2, [x29, 128]
	mov	w4, 0
	mov	x3, x23
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1852
	ldr	w0, [x29, 184]
	ldr	w2, [x29, 192]
	ldr	x1, [x29, 176]
	bl	MEM_AddMemRecord
	ldr	w0, [x29, 184]
	str	w0, [x29, 272]
	ldr	x0, [x29, 176]
	str	x0, [x29, 280]
	ldr	w0, [x29, 192]
	str	w0, [x29, 288]
	mov	w0, 1
	str	w0, [x29, 112]
.L1744:
	ldr	w0, [x29, 132]
	cbnz	w0, .L1835
.L1754:
	ldr	x3, [x22, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	ldr	w0, [x29, 140]
	cmp	w0, wzr
	ble	.L1762
	mov	w0, 3
	str	w0, [x29, 196]
	mov	w0, 11
	bl	VFMW_GetString
	ldr	w2, [x29, 140]
	mov	w4, 0
	mov	x3, x23
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1853
	ldr	x1, [x29, 176]
	ldr	w0, [x29, 184]
	ldr	w2, [x29, 192]
	bl	MEM_AddMemRecord
	ldr	x0, [x29, 176]
	ldr	w1, [x29, 184]
	str	x0, [x29, 352]
	ldr	w0, [x29, 192]
	str	w1, [x29, 344]
	str	w0, [x29, 360]
.L1762:
	ldr	x3, [x22, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	ldr	w0, [x27, 192]
	cbz	w0, .L1763
	ldr	w1, [x27, 208]
	cbz	w1, .L1763
	str	w1, [x29, 192]
	ldr	w1, [x27, 248]
	str	w0, [x29, 184]
	cmp	w1, 1
	beq	.L1854
	ldr	x1, [x22, 352]
	mov	x0, x23
	str	wzr, [x29, 196]
	blr	x1
	mov	x1, x0
	str	x0, [x29, 176]
.L1765:
	ldr	w2, [x29, 192]
	ldr	w0, [x29, 184]
	bl	MEM_AddMemRecord
	ldr	w1, [x29, 184]
	ldr	w2, [x29, 192]
	ldr	x0, [x29, 176]
	str	w1, [x29, 392]
	str	x0, [x29, 400]
	str	w2, [x29, 408]
.L1763:
	ldr	x1, [x22, 24]
	mov	w0, 0
	sxtw	x23, w19
	sxtw	x26, w21
	blr	x1
	ldr	x3, [x22, 96]
	sub	x2, x23, #204800
	ldr	x0, [x29, 328]
	sub	x2, x2, #1544
	mov	w1, 0
	str	x0, [x25, w21, sxtw 3]
	blr	x3
	ldr	x0, [x25, w21, sxtw 3]
	mov	x1, x27
	ldr	x3, [x22, 104]
	mov	x2, 264
	add	x0, x0, 1400
	blr	x3
	ldr	x0, [x25, w21, sxtw 3]
	mov	w1, 22
	ldr	x3, .LC910
	str	w20, [x0, 36]
	str	w19, [x0, 1308]
	ldr	x0, [x25, w21, sxtw 3]
	str	w21, [x0]
	str	w20, [x0, 708]
	str	wzr, [x0, 1336]
	ldr	x0, [x25, w21, sxtw 3]
	ldr	w2, [x27]
	str	w2, [x0, 32]
	ldr	x0, [x25, w21, sxtw 3]
	add	x2, x0, 507904
	str	w1, [x0, 672]
	str	w1, [x2, 2088]
	str	wzr, [x0, 28]
	ldr	x0, [x25, w21, sxtw 3]
	ldr	w2, [x27, 248]
	add	x1, x0, 507904
	str	w2, [x1, 2064]
	lsl	x1, x26, 4
	mov	w2, 30
	str	w2, [x0, 1712]
	add	x2, x0, 1720
	str	x2, [x3, x1]
	add	x1, x0, 475136
	add	x1, x1, 2328
	ldr	w0, [x27, 240]
	str	w0, [x2, 76]
	ldr	w0, [x27, 244]
	str	w0, [x2, 80]
	mov	w0, w21
	bl	FSP_EnableInstance
	cbnz	w0, .L1855
	mov	w0, w21
	mov	w20, 0
	mov	w24, 255
	bl	VCTRL_ResetChan
	ldr	x0, [x25, w21, sxtw 3]
	ldp	w3, w2, [x29, 112]
	add	x1, x0, 503808
	ldr	w4, [x29, 120]
	add	x7, x1, 1792
	str	w3, [x0, 432]
	str	w2, [x0, 436]
	str	w4, [x0, 440]
	add	x0, x0, 507904
	stp	wzr, wzr, [x7, 180]
	stp	wzr, wzr, [x7, 188]
	str	wzr, [x1, 1988]
	str	wzr, [x1, 1992]
	ldr	w1, [x27, 216]
	str	w1, [x0, 2028]
	str	wzr, [x0, 2020]
	ldr	w1, [x27, 252]
	str	w1, [x0, 2080]
	str	wzr, [x0, 2084]
	.p2align 2
.L1768:
	uxtw	x1, w20
	ldr	x0, [x25, x26, lsl 3]
	lsl	x19, x1, 6
	ldr	x4, [x22, 96]
	add	x19, x19, x1, lsl 3
	mov	x2, 72
	add	x3, x19, 503808
	mov	w1, 0
	add	x3, x3, 2000
	add	w20, w20, 1
	add	x0, x0, x3
	blr	x4
	ldr	x0, [x25, x26, lsl 3]
	cmp	w20, 32
	add	x1, x0, x19
	add	x1, x1, 503808
	str	w24, [x1, 2000]
	str	w24, [x1, 2004]
	str	w24, [x1, 2008]
	bne	.L1768
	ldr	x3, [x22, 96]
	add	x0, x0, 507904
	mov	x2, 1248
	mov	w1, 0
	add	x0, x0, 208
	blr	x3
	ldr	x0, [x25, x26, lsl 3]
	mov	x2, 24
	ldr	x3, [x22, 96]
	mov	w1, 0
	add	x0, x0, 507904
	add	x0, x0, 1456
	blr	x3
	ldr	x1, .LC915
	ldr	x0, [x25, x26, lsl 3]
	add	x1, x1, 3344
	ldr	x3, [x29, 280]
	ldr	w7, [x29, 272]
	ldr	w5, [x29, 312]
	str	wzr, [x1, x26, lsl 2]
	ldr	x1, [x29, 304]
	str	x1, [x0, 312]
	ldr	w1, [x29, 320]
	str	w1, [x0, 352]
	ldr	x1, [x29, 328]
	str	x1, [x0, 344]
	ldr	w1, [x29, 336]
	str	w1, [x0, 360]
	ldr	w1, [x29, 392]
	str	w1, [x0, 416]
	ldr	x1, [x29, 400]
	str	x1, [x0, 408]
	ldr	w1, [x29, 408]
	str	w1, [x0, 424]
	ldr	x1, [x29, 352]
	ldr	w6, [x29, 288]
	ldr	w2, [x29, 296]
	str	x3, [x0, 280]
	str	x1, [x0, 376]
	add	x1, x0, 475136
	ldr	w3, [x29, 344]
	str	w7, [x0, 288]
	str	w5, [x0, 328]
	ldr	w4, [x29, 360]
	str	w6, [x0, 296]
	str	w2, [x0, 320]
	str	w3, [x0, 384]
	str	w4, [x0, 392]
	str	w7, [x0, 472]
	str	w6, [x0, 476]
	add	x6, x0, 256
	str	wzr, [x1, 2360]
	add	w1, w3, 15
	str	w21, [x0]
	and	w1, w1, -16
	stp	wzr, wzr, [x6, 192]
	stp	w2, w5, [x6, 200]
	str	w3, [x0, 464]
	ldr	x2, [x25, x26, lsl 3]
	str	w4, [x0, 468]
	mov	w4, 14848
	add	x3, x2, 458752
	str	w1, [x0, 480]
	str	w1, [x0, 488]
	str	w1, [x0, 496]
	mov	w1, 131072
	str	w4, [x0, 484]
	mov	w4, 32768
	str	w1, [x0, 500]
	str	w4, [x0, 492]
	mov	w0, w21
	str	w21, [x2, 264]
	str	w21, [x2, 268]
	str	w21, [x3, 1960]
	bl	SM_ClearInst
	ldr	x2, [x25, x26, lsl 3]
	sub	x1, x23, #200704
	sub	x1, x1, #3592
	mov	w0, w21
	ldr	x2, [x2, 344]
	add	x1, x2, x1
	bl	OpenUsdPool_WithMem
	ldr	x1, [x25, x26, lsl 3]
	mov	w2, 1
	mov	w0, w21
	str	w2, [x1, 4]
	bl	VDMDRV_ClearChanIsDec
	bl	VDMDRV_ParamInit
	ldr	x19, [x25, x26, lsl 3]
	ldr	x0, [x22]
	add	x19, x19, 507904
	blr	x0
	ldr	x1, [x22, 32]
	str	w0, [x19, 2036]
	mov	w0, 0
	blr	x1
	mov	w0, w21
.L1827:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 416
	ret
	.p2align 3
.L1850:
	add	x24, x25, 256
	mov	w26, 3
	mov	w0, 15
	ldr	x23, [x22, 136]
	str	w26, [x24, 60]
	bl	VFMW_GetString
	mov	x2, x0
	mov	w3, 0
	mov	x1, 20
	add	x0, x29, 144
	blr	x23
	ldr	x28, .LC879
	ldr	x0, [x28, 96]
	cbz	x0, .L1724
	blr	x0
	cmp	w0, wzr
	mov	w23, w0
	ble	.L1724
	mov	w2, w0
	mov	w4, 0
	add	x3, x25, 288
	mov	w1, 0
	add	x0, x29, 144
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1725
	ldr	w2, [x24, 56]
	add	x23, x29, 168
	ldr	x1, [x24, 40]
	ldr	w0, [x24, 48]
	bl	MEM_AddMemRecord
	ldr	x3, [x22, 96]
	mov	w1, 0
	mov	x2, 20
	mov	x0, x23
	blr	x3
	str	wzr, [x29, 176]
	ldr	w0, [x24, 48]
	str	w0, [x29, 168]
	ldr	x1, [x28, 112]
	ldr	w0, [x24, 56]
	str	w0, [x29, 172]
	cbz	x1, .L1726
	mov	x0, x23
	blr	x1
	cbnz	w0, .L1726
	mov	w0, 16
	str	w26, [x24, 124]
	ldr	x28, [x22, 136]
	bl	VFMW_GetString
	mov	x2, x0
	mov	w3, 0
	mov	x1, 20
	add	x0, x29, 144
	blr	x28
	mov	w4, 1
	add	x3, x25, 352
	mov	w2, 10240
	mov	w1, 0
	add	x0, x29, 144
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1727
	ldr	w2, [x24, 120]
	ldr	x1, [x24, 104]
	ldr	w0, [x24, 112]
	bl	MEM_AddMemRecord
	ldr	x28, [x22, 136]
	ldr	x1, .LC880
	ldr	w0, [x24, 112]
	str	w0, [x1, 1212]
	add	w0, w0, 4096
	add	w0, w0, 1024
	str	w0, [x1, 1216]
	mov	w0, 17
	bl	VFMW_GetString
	mov	x2, x0
	mov	w3, 0
	mov	x1, 20
	add	x0, x29, 144
	blr	x28
	str	w26, [x24, 92]
	mov	w2, 8192
	add	x0, x29, 144
	movk	w2, 0x3, lsl 16
	mov	w4, 0
	add	x3, x25, 320
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1856
	ldr	w2, [x24, 88]
	mov	w26, 1
	ldr	x1, [x24, 72]
	ldr	w0, [x24, 80]
	bl	MEM_AddMemRecord
	ldr	w0, [x24, 80]
	mov	w2, 0
	ldr	w1, [x24, 88]
	bl	SM_OpenSCDDrv
	cbz	w0, .L1723
	ldr	x24, .LC881
	mov	w3, 0
	ldr	x1, .LC893
	mov	w0, 0
	add	x2, x24, 1416
	bl	dprint_vfmw
	b	.L1730
	.p2align 3
.L1848:
	ldr	w0, [x27, 252]
	cmp	w0, 1
	bne	.L1772
.L1779:
	add	x1, x29, 108
	mov	w0, 1
	bl	PDT_GetAttribute
	ldr	w0, [x29, 108]
	cmp	w0, 1
	ccmp	w21, 15, 4, ne
	ble	.L1720
	ldr	x1, .LC876
	mov	w2, w21
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1827
	.p2align 3
.L1835:
	ldr	x3, [x22, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	ldr	x0, [x24, 32]
	cbz	x0, .L1748
	ldr	w0, [x24, 24]
	cbz	w0, .L1748
	ldr	w0, [x24, 40]
	cbz	w0, .L1748
	ldr	w1, [x29, 132]
	cmp	w0, w1
	bge	.L1857
	ldr	w0, [x29, 296]
	.p2align 2
.L1751:
	cbz	w0, .L1753
	ldr	x0, [x29, 304]
	cbz	x0, .L1753
	ldr	w0, [x29, 132]
	ldr	w1, [x29, 312]
	cmp	w1, w0
	bge	.L1754
.L1753:
	ldr	w0, [x29, 120]
	cmp	w0, 1
	beq	.L1858
.L1755:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L1859
.L1756:
	ldr	x24, .LC881
	mov	w0, 1
	ldr	x1, .LC907
	add	x2, x24, 1464
	bl	dprint_vfmw
	b	.L1757
.L1748:
	mov	w0, 3
	str	w0, [x29, 196]
	mov	w0, 9
	bl	VFMW_GetString
	ldr	w2, [x29, 132]
	mov	w4, 0
	mov	x3, x23
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1750
	ldr	x1, [x29, 176]
	ldr	w0, [x29, 184]
	ldr	w2, [x29, 192]
	bl	MEM_AddMemRecord
	ldr	x1, [x29, 176]
	ldr	w0, [x29, 184]
	str	x1, [x29, 304]
	ldr	w1, [x29, 192]
	str	w1, [x29, 312]
	mov	w1, 1
	str	w0, [x29, 296]
	str	w1, [x29, 116]
	b	.L1751
.L1740:
	str	wzr, [x29, 112]
	str	wzr, [x29, 272]
	str	xzr, [x29, 280]
	str	wzr, [x29, 288]
	b	.L1744
.L1845:
	ldr	w0, [x27, 20]
	cmp	w0, wzr
	bgt	.L1836
	b	.L1709
	.p2align 3
.L1750:
	ldr	x24, .LC881
	mov	w3, 1691
	ldr	x1, .LC905
	mov	w0, 1
	ldr	w4, [x29, 132]
	add	x2, x24, 1464
	bl	dprint_vfmw
	ldr	w0, [x29, 296]
	b	.L1751
.L1734:
	ldr	x3, [x22, 104]
	mov	x2, 24
	add	x1, x27, 120
	add	x0, x29, 320
	blr	x3
	ldr	w0, [x29, 136]
	ldr	w2, [x29, 336]
	cmp	w2, w0
	blt	.L1860
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_AddMemRecord
	b	.L1737
.L1724:
	ldr	x24, .LC881
	mov	w3, 0
	ldr	x1, .LC883
	mov	w0, 0
	add	x2, x24, 1416
	bl	dprint_vfmw
.L1730:
	bl	VCTRL_ReleaseHalMem
	ldr	x1, .LC895
	add	x2, x24, 1440
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1827
.L1739:
	ldr	x3, [x22, 104]
	mov	x2, 24
	mov	x1, x24
	add	x0, x29, 272
	blr	x3
	ldr	w0, [x27, 216]
	ldr	w2, [x29, 288]
	cmp	w0, 1
	beq	.L1746
	ldr	w4, [x29, 128]
	cmp	w2, w4
	blt	.L1861
.L1746:
	ldr	w0, [x29, 272]
	ldr	x1, [x29, 280]
	bl	MEM_AddMemRecord
	b	.L1744
.L1854:
	ldr	x1, [x22, 320]
	mov	w2, 3
	mov	x0, x23
	str	w2, [x29, 196]
	blr	x1
	mov	x1, x0
	str	x0, [x29, 176]
	b	.L1765
.L1853:
	ldr	w0, [x29, 120]
	cmp	w0, 1
	beq	.L1862
.L1759:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L1863
.L1760:
	ldr	w0, [x29, 116]
	cmp	w0, 1
	beq	.L1864
.L1761:
	ldr	x1, .LC909
	mov	w2, 2079
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x24, .LC881
.L1757:
	ldr	x1, .LC912
	add	x2, x24, 1440
	mov	w0, 1
	bl	dprint_vfmw
	cbz	w26, .L1708
	bl	VCTRL_ReleaseHalMem
	mov	w0, -1
	b	.L1827
.L1857:
	ldr	x3, [x22, 104]
	mov	x2, 24
	add	x1, x27, 96
	add	x0, x29, 296
	blr	x3
	ldr	w0, [x29, 296]
	ldr	w2, [x29, 312]
	ldr	x1, [x29, 304]
	bl	MEM_AddMemRecord
	ldr	w0, [x29, 296]
	b	.L1751
.L1864:
	ldr	w0, [x29, 296]
	ldr	x1, [x29, 304]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 296]
	ldr	w2, [x29, 312]
	ldr	x1, [x29, 304]
	bl	MEM_DelMemRecord
	b	.L1761
.L1863:
	ldr	w0, [x29, 272]
	ldr	x1, [x29, 280]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 272]
	ldr	w2, [x29, 288]
	ldr	x1, [x29, 280]
	bl	MEM_DelMemRecord
	b	.L1760
.L1862:
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 320]
	ldr	w2, [x29, 336]
	ldr	x1, [x29, 328]
	bl	MEM_DelMemRecord
	b	.L1759
.L1847:
	mov	w21, 0
	b	.L1717
.L1852:
	ldr	w0, [x29, 120]
	cmp	w0, 1
	beq	.L1865
.L1742:
	ldr	x1, .LC901
	mov	w2, 1750
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x24, .LC881
	b	.L1757
.L1851:
	ldr	x1, .LC897
	mov	w2, 1961
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x24, .LC881
	b	.L1757
.L1855:
	ldr	x1, .LC914
	mov	w2, w21
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w21
	bl	FSP_DisableInstance
	mov	w0, w21
	bl	CloseUsdPool_WithMem
	ldr	x1, [x25, w21, sxtw 3]
	mov	w0, w21
	str	xzr, [x25, w21, sxtw 3]
	add	x3, x1, 507904
	add	x2, x1, 503808
	ldr	w6, [x1, 436]
	add	x2, x2, 2000
	ldr	w4, [x1, 432]
	ldr	w5, [x1, 440]
	stp	w4, w6, [x29, 252]
	ldr	w19, [x3, 2064]
	ldr	w4, [x3, 2028]
	add	x3, x1, 304
	str	w5, [x29, 260]
	add	x5, x1, 272
	str	w4, [x29, 248]
	add	x4, x1, 336
	stp	x5, x3, [x29, 200]
	add	x3, x1, 400
	add	x1, x1, 368
	str	x2, [x29, 224]
	stp	x3, x1, [x29, 232]
	str	x4, [x29, 216]
	bl	VDMDRV_ClearChanIsDec
	ldr	x1, [x22, 32]
	mov	w0, 0
	blr	x1
	add	x1, x29, 232
	mov	w0, w19
	bl	VCTRL_DelRecordEsBuf.isra.5
	add	x1, x29, 200
	mov	w0, w21
	bl	VCTRL_FreeChanResource
	mov	w0, -1
	b	.L1827
.L1726:
	ldr	x1, .LC887
	mov	w2, 0
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x24, .LC881
	b	.L1730
.L1772:
	ldr	x1, .LC878
	mov	w2, 32
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1827
.L1846:
	ldr	x1, .LC873
	mov	w2, 2167
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1827
.L1856:
	ldr	x24, .LC881
	mov	w4, 8192
	ldr	x1, .LC891
	movk	w4, 0x3, lsl 16
	mov	w3, 0
	add	x2, x24, 1416
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1730
.L1725:
	ldr	x24, .LC881
	mov	w4, w23
	ldr	x1, .LC885
	mov	w3, 0
	add	x2, x24, 1416
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1730
.L1727:
	ldr	x24, .LC881
	mov	w4, 10240
	ldr	x1, .LC889
	mov	w3, 0
	add	x2, x24, 1416
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1730
.L1865:
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 320]
	ldr	w2, [x29, 336]
	ldr	x1, [x29, 328]
	bl	MEM_DelMemRecord
	b	.L1742
.L1860:
	ldr	x1, .LC899
	mov	w2, 1977
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x24, .LC881
	b	.L1757
.L1859:
	ldr	w0, [x29, 272]
	ldr	x1, [x29, 280]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 272]
	ldr	w2, [x29, 288]
	ldr	x1, [x29, 280]
	bl	MEM_DelMemRecord
	b	.L1756
.L1858:
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 320]
	ldr	w2, [x29, 336]
	ldr	x1, [x29, 328]
	bl	MEM_DelMemRecord
	b	.L1755
.L1844:
	ldr	x1, .LC870
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1866
.L1861:
	ldr	w0, [x29, 120]
	cmp	w0, 1
	beq	.L1867
.L1747:
	ldr	x1, .LC903
	mov	w3, w2
	mov	w0, 1
	mov	w2, 1781
	bl	dprint_vfmw
	ldr	x24, .LC881
	b	.L1757
.L1867:
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_ReleaseMemBlock
	ldr	w2, [x29, 336]
	ldr	w0, [x29, 320]
	ldr	x1, [x29, 328]
	bl	MEM_DelMemRecord
	ldr	w4, [x29, 128]
	ldr	w2, [x29, 288]
	b	.L1747
	.size	VCTRL_CreateChan, .-VCTRL_CreateChan
	.align	3
.LC868:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC870:
	.xword	.LC869
	.align	3
.LC871:
	.xword	.LC543
	.align	3
.LC873:
	.xword	.LC872
	.align	3
.LC874:
	.xword	.LANCHOR1
	.align	3
.LC876:
	.xword	.LC875
	.align	3
.LC878:
	.xword	.LC877
	.align	3
.LC879:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC880:
	.xword	g_HwMem
	.align	3
.LC881:
	.xword	.LANCHOR4
	.align	3
.LC883:
	.xword	.LC882
	.align	3
.LC885:
	.xword	.LC884
	.align	3
.LC887:
	.xword	.LC886
	.align	3
.LC889:
	.xword	.LC888
	.align	3
.LC891:
	.xword	.LC890
	.align	3
.LC893:
	.xword	.LC892
	.align	3
.LC895:
	.xword	.LC894
	.align	3
.LC897:
	.xword	.LC896
	.align	3
.LC899:
	.xword	.LC898
	.align	3
.LC901:
	.xword	.LC900
	.align	3
.LC903:
	.xword	.LC902
	.align	3
.LC905:
	.xword	.LC904
	.align	3
.LC907:
	.xword	.LC906
	.align	3
.LC909:
	.xword	.LC908
	.align	3
.LC910:
	.xword	s_SmIIS
	.align	3
.LC912:
	.xword	.LC911
	.align	3
.LC914:
	.xword	.LC913
	.align	3
.LC915:
	.xword	.LANCHOR5
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ConfigChan
	.type	VCTRL_ConfigChan, %function
VCTRL_ConfigChan:
	stp	x29, x30, [sp, -176]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w19, w0
	mov	x24, x1
	mov	x0, x30
	bl	_mcount
	cbz	x24, .L1927
	cmp	w19, 31
	bhi	.L1928
	ldr	x21, .LC923
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L1929
	ldr	w0, [x0, 4]
	cmp	w0, 1
	bne	.L1930
	mov	x1, x24
	mov	w0, w19
	bl	VCTRL_CheckChanWH
	mov	w20, w0
	cbnz	w0, .L1931
	ldr	x22, .LC928
	add	x23, x22, 3472
	mov	x1, x23
	bl	PDT_GetAttribute
	ldr	w0, [x22, 3492]
	ldr	w2, [x24, 8]
	cmp	w0, 21
	bhi	.L1876
	cmp	w0, w2
	beq	.L1877
	add	x0, x22, 3496
	add	x3, x22, 3620
	.p2align 2
.L1879:
	ldr	w1, [x0]
	add	x0, x0, 4
	cmp	w1, 21
	bhi	.L1876
	cmp	w1, w2
	beq	.L1877
	cmp	x3, x0
	bne	.L1879
.L1877:
	cmp	w2, 8
	str	wzr, [x29, 96]
	beq	.L1932
.L1880:
	cmp	w2, 9
	beq	.L1933
	cmp	w2, 5
	str	wzr, [x29, 96]
	beq	.L1934
.L1907:
	mov	x1, x24
	mov	w0, w19
	bl	VCTRL_CmpConfigParameter
	cbz	w0, .L1935
	ldr	x23, .LC933
	mov	x2, 148
	ldr	x0, [x21, w19, sxtw 3]
	mov	x1, x24
	ldr	x3, [x23, 104]
	add	x0, x0, 44
	blr	x3
	ldr	x0, [x21, w19, sxtw 3]
	mov	x2, 80
	ldr	w1, [x24, 24]
	str	w1, [x0, 20]
	ldr	x0, [x21, w19, sxtw 3]
	ldr	w1, [x24, 8]
	ldr	x3, [x23, 96]
	str	w1, [x0, 672]
	ldr	w1, [x24, 100]
	str	w1, [x0, 1624]
	mov	w1, 0
	add	x0, x29, 96
	blr	x3
	ldr	x1, [x21, w19, sxtw 3]
	ldr	w2, [x1, 456]
	cbnz	w2, .L1936
.L1887:
	ldr	w2, [x24, 24]
	add	x1, x1, 507904
	ldr	w0, [x24, 84]
	strb	w2, [x29, 104]
	ldr	w2, [x24, 8]
	cmp	w0, 1
	str	w2, [x29, 108]
	mov	w2, 49152
	movk	w2, 0xf8c3, lsl 16
	str	w2, [x29, 120]
	beq	.L1937
	str	wzr, [x1, 2076]
.L1889:
	ldr	w0, [x24, 88]
	cbz	w0, .L1890
	mov	w0, 1
	str	w0, [x29, 152]
.L1890:
	ldr	w1, [x24, 80]
	ldr	w0, [x24, 8]
	str	wzr, [x29, 136]
	str	w1, [x29, 144]
	cbnz	w0, .L1938
.L1926:
	ldr	w0, [x24, 52]
.L1892:
	str	w0, [x29, 140]
	add	x3, x21, 256
	mov	w1, 0
	mov	x0, x21
	.p2align 2
.L1894:
	ldr	x2, [x0], 8
	cmp	x2, xzr
	csinc	w1, w1, w1, eq
	cmp	x3, x0
	bne	.L1894
	cmp	w1, 1
	ldr	x25, .LC934
	ble	.L1939
.L1895:
	str	wzr, [x29, 140]
.L1896:
	ldr	x0, [x21, w19, sxtw 3]
	ldrsb	w0, [x0, 44]
	cmp	w0, 1
	beq	.L1940
.L1897:
	ldr	x3, [x23, 104]
	add	x26, x24, 12
	mov	x2, 12
	mov	x1, x26
	add	x0, x29, 124
	blr	x3
	add	x1, x29, 96
	mov	w0, w19
	bl	SM_Config
	ldr	x3, [x23, 96]
	mov	x2, 1
	mov	w1, 0
	add	x0, x29, 88
	blr	x3
	ldr	w0, [x24, 84]
	cmp	w0, 1
	beq	.L1941
.L1898:
	ldr	x0, [x21, w19, sxtw 3]
	ldr	w1, [x25, 72]
	ldr	w2, [x0, 352]
	cmp	w1, 7
	str	w2, [x0, 1312]
	ldr	w2, [x0, 360]
	str	w2, [x0, 1316]
	ldr	w2, [x0, 448]
	str	w2, [x0, 696]
	ldr	w2, [x0, 452]
	str	w2, [x0, 700]
	ldr	w2, [x0, 480]
	str	w2, [x0, 712]
	ldr	w2, [x0, 484]
	str	w2, [x0, 716]
	ldr	w2, [x0, 488]
	str	w2, [x0, 720]
	ldr	w2, [x0, 492]
	str	w2, [x0, 724]
	ldr	w2, [x0, 496]
	str	w2, [x0, 728]
	ldr	w2, [x0, 500]
	str	w2, [x0, 732]
	ldr	w2, [x24, 28]
	str	w2, [x0, 684]
	ldr	w2, [x24, 28]
	str	w2, [x0, 680]
	ldr	w2, [x24, 36]
	str	w2, [x0, 688]
	beq	.L1942
.L1899:
	str	w1, [x0, 704]
	mov	w25, 1
	ldr	w1, [x24, 44]
	str	w1, [x0, 692]
	ldr	w1, [x24, 132]
	str	w1, [x0, 1364]
	ldr	w1, [x24, 140]
	str	w1, [x0, 1700]
	str	w25, [x0, 1368]
	str	w25, [x0, 1372]
	ldr	w1, [x24, 72]
	cmp	w1, w25
	cset	w1, eq
	str	w1, [x0, 1348]
	ldr	w1, [x24, 76]
	str	w1, [x0, 1352]
	ldr	w1, [x24, 48]
	str	w1, [x0, 1356]
	ldr	w1, [x29, 140]
	str	w1, [x0, 1360]
	str	wzr, [x0, 1672]
	str	wzr, [x0, 1692]
	str	wzr, [x0, 1708]
	add	x0, x0, 507904
	ldrsb	w1, [x24, 1]
	strb	w1, [x0, 2024]
	mov	x1, x24
	mov	w0, w19
	bl	VCTRL_ConfigChanCompress
	ldr	x0, [x21, w19, sxtw 3]
	mov	x2, 12
	ldr	x3, [x23, 104]
	mov	x1, x26
	add	x0, x0, 1284
	blr	x3
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 507904
	ldr	w2, [x0, 672]
	ldr	w0, [x1, 2088]
	cmp	w0, w2
	beq	.L1900
	mov	w0, w19
	bl	VCTRL_ResetChan
	ldr	w1, [x24, 8]
	ldr	x0, [x21, w19, sxtw 3]
	cmp	w1, 20
	beq	.L1901
	ldr	w2, [x0, 672]
	add	x1, x0, 507904
.L1900:
	ldr	x4, .LC937
	mov	x0, 0
	str	w2, [x1, 2088]
	b	.L1905
	.p2align 3
.L1944:
	ldr	w3, [x1, 20]
	str	w3, [x2, x0, lsl 2]
	ldr	w1, [x1, 20]
	str	w1, [x4, x0, lsl 2]
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L1943
.L1905:
	ldr	x1, [x21, x0, lsl 3]
	add	x2, x22, 3624
	cbnz	x1, .L1944
	add	x1, x22, 3624
	str	wzr, [x4, x0, lsl 2]
	str	wzr, [x1, x0, lsl 2]
	add	x0, x0, 1
	cmp	x0, 32
	bne	.L1905
.L1943:
	add	x0, x22, 3624
	bl	VDMDRV_SetPriority
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L1935:
	ldr	x1, .LC932
	mov	w20, 0
	bl	dprint_vfmw
.L1924:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L1876:
	ldr	x1, .LC930
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L1936:
	ldr	w0, [x1, 460]
	cmp	w0, 15
	ble	.L1887
	mov	w0, w2
	str	w2, [x29, 112]
	bl	MEM_Phy2Vir
	str	x0, [x29, 96]
	ldr	x1, [x21, w19, sxtw 3]
	ldr	w0, [x1, 460]
	sub	w0, w0, #16
	str	w0, [x29, 116]
	b	.L1887
	.p2align 3
.L1938:
	cmp	w0, 16
	mov	w0, 0
	beq	.L1926
	b	.L1892
	.p2align 3
.L1933:
	add	x0, x29, 96
	bl	REAL9DEC_Support
	ldr	w0, [x29, 96]
	cbz	w0, .L1881
	ldr	w2, [x24, 8]
	str	wzr, [x29, 96]
	cmp	w2, 5
	bne	.L1907
	b	.L1934
.L1939:
	ldr	w0, [x25, 88]
	cbnz	w0, .L1896
	b	.L1895
.L1932:
	add	x0, x29, 96
	bl	REAL8DEC_Support
	ldr	w0, [x29, 96]
	cbz	w0, .L1881
	ldr	w2, [x24, 8]
	b	.L1880
.L1934:
	add	x0, x29, 96
	bl	DIVX3DEC_Support
	ldr	w0, [x29, 96]
	cbnz	w0, .L1907
.L1881:
	mov	w20, -1
	b	.L1924
.L1930:
	ldr	x2, .LC920
	mov	w3, 2792
	ldr	x4, .LC925
	mov	w0, 0
	ldr	x1, .LC921
	add	x2, x2, 1488
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1924
.L1942:
	ldr	w1, [x24, 40]
	b	.L1899
.L1940:
	str	wzr, [x29, 140]
	b	.L1897
.L1937:
	ldr	w2, [x24, 92]
	str	w2, [x29, 156]
	ldr	w2, [x24, 96]
	str	w0, [x29, 148]
	str	w2, [x29, 160]
	ldr	w0, [x24, 136]
	str	w0, [x1, 2076]
	b	.L1889
.L1941:
	strb	w0, [x29, 88]
	add	x1, x29, 88
	mov	w0, w19
	bl	FSP_ConfigAttribute
	b	.L1898
.L1931:
	ldr	x1, .LC927
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1924
.L1901:
	ldr	w3, [x0, 472]
	ldr	w4, [x0, 476]
	ldr	w1, [x0, 1412]
	ldr	w2, [x0, 1416]
	mov	w0, w19
	bl	VCTRL_PartitionMemForStdUser
	cbnz	w0, .L1902
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 507904
	ldr	w2, [x0, 672]
	b	.L1900
.L1928:
	ldr	x2, .LC920
	mov	w3, 2790
	ldr	x4, .LC922
	mov	w0, 0
	ldr	x1, .LC921
	add	x2, x2, 1488
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1924
.L1929:
	ldr	x2, .LC920
	mov	w3, 2791
	ldr	x4, .LC924
	mov	w20, -1
	ldr	x1, .LC921
	add	x2, x2, 1488
	bl	dprint_vfmw
	b	.L1924
.L1927:
	ldr	x2, .LC920
	mov	w3, 2789
	ldr	x4, .LC919
	mov	w0, 0
	ldr	x1, .LC921
	add	x2, x2, 1488
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1924
.L1902:
	ldr	x1, .LC936
	mov	w0, w25
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1924
	.size	VCTRL_ConfigChan, .-VCTRL_ConfigChan
	.align	3
.LC919:
	.xword	.LC918
	.align	3
.LC920:
	.xword	.LANCHOR4
	.align	3
.LC921:
	.xword	.LC6
	.align	3
.LC922:
	.xword	.LC385
	.align	3
.LC923:
	.xword	.LANCHOR1
	.align	3
.LC924:
	.xword	.LC390
	.align	3
.LC925:
	.xword	.LC255
	.align	3
.LC927:
	.xword	.LC926
	.align	3
.LC928:
	.xword	.LANCHOR5
	.align	3
.LC930:
	.xword	.LC929
	.align	3
.LC932:
	.xword	.LC931
	.align	3
.LC933:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC934:
	.xword	.LANCHOR2
	.align	3
.LC936:
	.xword	.LC935
	.align	3
.LC937:
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
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x1, .LC943
	lsr	w20, w3, 24
	and	w19, w3, 16777215
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC944
	mov	w1, 0
	mov	x2, 148
	add	x0, x29, 40
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 40
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbz	w0, .L1948
	ldr	x1, .LC946
	mov	w2, w20
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1948:
	add	x1, x29, 40
	mov	w0, w20
	str	w19, [x29, 172]
	bl	VCTRL_ConfigChan
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetUvmosEnable, .-VfmwProc_SetUvmosEnable
	.align	3
.LC943:
	.xword	.LC942
	.align	3
.LC944:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC946:
	.xword	.LC945
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetDropStreamThread, %function
VfmwProc_SetDropStreamThread:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x1, .LC948
	lsr	w20, w3, 24
	and	w19, w3, 16777215
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC949
	mov	w1, 0
	mov	x2, 148
	add	x0, x29, 40
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 40
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1949
	add	x1, x29, 40
	mov	w0, w20
	str	w19, [x29, 72]
	bl	VCTRL_ConfigChan
.L1949:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetDropStreamThread, .-VfmwProc_SetDropStreamThread
	.align	3
.LC948:
	.xword	.LC947
	.align	3
.LC949:
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
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x1, .LC951
	lsr	w20, w3, 24
	and	w19, w3, 7
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC952
	mov	w1, 0
	mov	x2, 148
	add	x0, x29, 40
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 40
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbz	w0, .L1954
	ldr	x1, .LC954
	mov	w2, w20
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1954:
	add	x1, x29, 40
	mov	w0, w20
	str	w19, [x29, 76]
	bl	VCTRL_ConfigChan
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetDecMode, .-VfmwProc_SetDecMode
	.align	3
.LC951:
	.xword	.LC950
	.align	3
.LC952:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC954:
	.xword	.LC953
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
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x1, .LC956
	lsr	w20, w3, 24
	and	w19, w3, 3
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC957
	mov	w1, 0
	mov	x2, 148
	add	x0, x29, 40
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 40
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1955
	add	x1, x29, 40
	mov	w0, w20
	str	w19, [x29, 80]
	bl	VCTRL_ConfigChan
.L1955:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetDecOrderOutput, .-VfmwProc_SetDecOrderOutput
	.align	3
.LC956:
	.xword	.LC955
	.align	3
.LC957:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetErrorThread, %function
VfmwProc_SetErrorThread:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x1, .LC959
	lsr	w20, w3, 24
	and	w19, w3, 16777215
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC960
	mov	w1, 0
	mov	x2, 148
	add	x0, x29, 40
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 40
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1957
	add	x1, x29, 40
	mov	w0, w20
	str	w19, [x29, 68]
	bl	VCTRL_ConfigChan
.L1957:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 192
	ret
	.size	VfmwProc_SetErrorThread, .-VfmwProc_SetErrorThread
	.align	3
.LC959:
	.xword	.LC958
	.align	3
.LC960:
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
	mov	w3, w0
	ldr	x1, .LC962
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestResetChan, .-VfmwProc_TestResetChan
	.align	3
.LC962:
	.xword	.LC961
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DestroyChan
	.type	VCTRL_DestroyChan, %function
VCTRL_DestroyChan:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC963
	mov	w0, 0
	ldr	x1, [x21, 24]
	blr	x1
	cmp	w20, 31
	bhi	.L1977
	ldr	x19, .LC968
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L1978
	ldr	w22, [x0, 4]
	cmp	w22, 1
	bne	.L1979
	str	wzr, [x0, 8]
	mov	w0, 0
	ldr	x1, [x21, 32]
	blr	x1
	mov	w0, w20
	bl	SCDDRV_IsChanDec
	cbnz	w0, .L1980
.L1965:
	ldr	x1, [x21, 24]
	mov	w0, 0
	sxtw	x22, w20
	blr	x1
	ldr	x2, .LC973
	mov	w0, 4
	ldr	x1, [x21, 24]
	str	wzr, [x2, w20, sxtw 2]
	blr	x1
	mov	w0, w20
	bl	VCTRL_StopChan
	ldr	x1, [x21, 32]
	cbnz	w0, .L1981
	mov	w0, 4
	lsl	x22, x22, 4
	blr	x1
	mov	w0, w20
	bl	VCTRL_ResetChan
	bl	VDMDRV_ParamInit
	ldr	x1, .LC974
	mov	w0, 4
	ldr	x2, [x21, 24]
	add	x1, x1, 400
	str	wzr, [x1, w20, sxtw 2]
	blr	x2
	mov	w0, w20
	bl	FSP_DisableInstance
	mov	w0, w20
	bl	CloseUsdPool_WithMem
	ldr	x1, [x19, w20, sxtw 3]
	mov	w0, w20
	ldr	x4, .LC975
	add	x3, x1, 507904
	add	x2, x1, 503808
	ldr	w5, [x1, 440]
	add	x2, x2, 2000
	str	w5, [x29, 132]
	ldr	w5, [x1, 432]
	str	w5, [x29, 124]
	ldr	w5, [x1, 436]
	ldr	w23, [x3, 2064]
	str	x2, [x29, 96]
	add	x2, x1, 400
	str	w5, [x29, 128]
	ldr	w5, [x3, 2028]
	add	x3, x1, 272
	str	xzr, [x4, x22]
	str	x2, [x29, 104]
	add	x2, x1, 368
	str	x3, [x29, 72]
	add	x3, x1, 304
	add	x1, x1, 336
	str	w5, [x29, 120]
	stp	x3, x1, [x29, 80]
	str	x2, [x29, 112]
	str	xzr, [x19, w20, sxtw 3]
	bl	VDMDRV_ClearChanIsDec
	mov	w0, w20
	bl	SCDDRV_ResetSCD
	mov	w0, w20
	bl	VDMDRV_ResetVDH
	add	x3, x19, 616
	ldr	x4, [x21, 32]
	add	x1, x3, x22
	mov	w2, -1
	mov	w0, 4
	str	wzr, [x3, x22]
	stp	wzr, w2, [x1, 4]
	str	w2, [x1, 12]
	blr	x4
	ldr	x1, [x21, 32]
	mov	w0, 0
	blr	x1
	ldr	x2, [x21, 48]
	mov	w1, w20
	mov	w0, 1
	blr	x2
	add	x1, x29, 104
	mov	w0, w23
	bl	VCTRL_DelRecordEsBuf.isra.5
	add	x1, x29, 72
	mov	w0, w20
	bl	VCTRL_FreeChanResource
	ldr	x2, [x21, 56]
	mov	w1, w20
	mov	w0, 1
	blr	x2
	mov	x0, x19
	add	x3, x19, 256
	mov	w1, 0
	.p2align 2
.L1968:
	ldr	x2, [x0], 8
	cmp	x2, xzr
	csinc	w1, w1, w1, eq
	cmp	x0, x3
	bne	.L1968
	mov	w19, 0
	cbnz	w1, .L1962
	bl	VCTRL_ReleaseHalMem
.L1962:
	mov	w0, w19
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 144
	ret
.L1980:
	mov	w0, w20
	ldr	x23, [x21, 264]
	bl	SCDDRV_IsChanDec
	cmp	w0, wzr
	mov	w2, 500
	cset	w1, eq
	mov	w0, w22
	blr	x23
	b	.L1965
.L1979:
	ldr	x2, .LC965
	mov	w3, 2391
	ldr	x4, .LC972
	mov	w0, 0
	ldr	x1, .LC967
	add	x2, x2, 1512
.L1976:
	bl	dprint_vfmw
	mov	w19, -1
	ldr	x1, [x21, 32]
	mov	w0, 0
	blr	x1
	ldr	x23, [sp, 48]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 144
	ret
.L1981:
	mov	w0, 4
	mov	w19, -1
	blr	x1
	ldr	x1, [x21, 32]
	mov	w0, 0
	blr	x1
	b	.L1962
.L1977:
	ldr	x2, .LC965
	mov	w3, 2377
	ldr	x4, .LC964
	mov	w0, 0
	ldr	x1, .LC967
	add	x2, x2, 1512
	b	.L1976
.L1978:
	ldr	x2, .LC965
	mov	w3, 2384
	ldr	x4, .LC970
	ldr	x1, .LC967
	add	x2, x2, 1512
	b	.L1976
	.size	VCTRL_DestroyChan, .-VCTRL_DestroyChan
	.align	3
.LC963:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC964:
	.xword	.LC198
	.align	3
.LC965:
	.xword	.LANCHOR4
	.align	3
.LC967:
	.xword	.LC966
	.align	3
.LC968:
	.xword	.LANCHOR1
	.align	3
.LC970:
	.xword	.LC969
	.align	3
.LC972:
	.xword	.LC971
	.align	3
.LC973:
	.xword	g_LowDelaySeqIndex
	.align	3
.LC974:
	.xword	.LANCHOR5
	.align	3
.LC975:
	.xword	s_SmIIS
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
	ldr	x20, .LC979
	ldr	w0, [x20, 256]
	cmp	w0, 1
	bne	.L1989
	mov	x19, 0
	.p2align 2
.L1985:
	ldr	x1, [x20, x19, lsl 3]
	mov	w0, w19
	add	x19, x19, 1
	cbz	x1, .L1984
	bl	VCTRL_DestroyChan
.L1984:
	cmp	x19, 32
	bne	.L1985
	bl	FSP_Exit
	ldr	x21, .LC980
	ldr	w1, [x20, 260]
	mov	w2, 3
	str	w2, [x20, 264]
	cbz	w1, .L1987
	ldr	x1, [x21, 240]
	mov	w0, 10
	mov	w19, 49
	blr	x1
	b	.L1988
	.p2align 3
.L1999:
	ldr	x1, [x21, 240]
	blr	x1
	subs	w19, w19, #1
	beq	.L1987
.L1988:
	ldr	w1, [x20, 260]
	mov	w0, 10
	cbnz	w1, .L1999
.L1987:
	ldr	x0, .LC981
	mov	x2, 128
	ldr	x3, [x21, 96]
	mov	w1, 0
	add	x0, x0, 400
	blr	x3
	add	x0, x20, 288
	bl	CloseDrivers
	str	wzr, [x20, 256]
	mov	w0, 0
.L1998:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1989:
	mov	w0, -1
	b	.L1998
	.size	VCTRL_CloseVfmw, .-VCTRL_CloseVfmw
	.align	3
.LC979:
	.xword	.LANCHOR1
	.align	3
.LC980:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC981:
	.xword	.LANCHOR5
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
	mov	w3, w0
	ldr	x1, .LC984
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, w19
	bl	VCTRL_ResetChan
	mov	w3, w0
	ldr	x1, .LC985
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, w19
	bl	VCTRL_StartChan
	mov	w3, w0
	ldr	x1, .LC986
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestRestartChan, .-VfmwProc_TestRestartChan
	.align	3
.LC984:
	.xword	.LC983
	.align	3
.LC985:
	.xword	.LC961
	.align	3
.LC986:
	.xword	.LC829
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
	mov	w3, w0
	ldr	x1, .LC987
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestStopChan, .-VfmwProc_TestStopChan
	.align	3
.LC987:
	.xword	.LC983
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_InitDspCode
	.type	VCTRL_InitDspCode, %function
VCTRL_InitDspCode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, 6
	beq	.L2012
	mov	w19, 2
	cmp	w20, wzr
	csel	w19, w19, wzr, eq
.L2003:
	ldr	x0, .LC988
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L2014
	mov	w1, w19
	mov	w0, 0
	bl	VDH_Require_DspCode
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2014:
	ldr	x20, .LC989
	ldr	x1, [x20, 8]
	cbz	x1, .L2015
	mov	w0, 0
	blr	x1
.L2006:
	ldr	x1, [x20, 40]
	cbz	x1, .L2016
	mov	w0, 0
	blr	x1
.L2008:
	ldr	x1, [x20, 24]
	cbz	x1, .L2017
	mov	w0, 0
	blr	x1
.L2010:
	mov	w1, w19
	mov	w0, 0
	bl	SCDDRV_LoadDspCode
	mov	w0, w21
	bl	VCTRL_CloseHardware
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2012:
	mov	w19, 1
	b	.L2003
	.p2align 3
.L2015:
	ldr	x1, .LC990
	mov	w2, 3055
	mov	w0, 0
	bl	dprint_vfmw
	b	.L2006
	.p2align 3
.L2016:
	ldr	x1, .LC990
	mov	w2, 3056
	mov	w0, 0
	bl	dprint_vfmw
	b	.L2008
	.p2align 3
.L2017:
	ldr	x1, .LC990
	mov	w2, 3057
	mov	w0, 0
	bl	dprint_vfmw
	b	.L2010
	.size	VCTRL_InitDspCode, .-VCTRL_InitDspCode
	.align	3
.LC988:
	.xword	g_HalDisable
	.align	3
.LC989:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC990:
	.xword	.LC127
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_LoadDspCode
	.type	VCTRL_LoadDspCode, %function
VCTRL_LoadDspCode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC991
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w1, [x0, 672]
	cbnz	w1, .L2030
	ldr	w21, [x0, 1356]
	mov	w0, 0
	cmp	w21, wzr
	cset	w3, eq
	cmp	w1, 6
	cset	w2, ne
	tst	w3, w2
	beq	.L2049
.L2036:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2030:
	cmp	w1, 6
	mov	w3, 1
	cset	w2, ne
	mov	w21, 0
	tst	w3, w2
	mov	w0, 0
	bne	.L2036
.L2049:
	ldr	x20, .LC992
	add	x0, x20, 404
	add	x3, x20, 528
	ldr	w2, [x20, 400]
	cbz	w2, .L2021
	b	.L2020
	.p2align 3
.L2051:
	beq	.L2050
.L2021:
	ldr	w2, [x0]
	add	x0, x0, 4
	cmp	x3, x0
	cbz	w2, .L2051
.L2020:
	cmp	w2, 1
	beq	.L2052
	cmp	w1, 6
	mov	w0, 0
	beq	.L2036
	ldr	x1, .LC996
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2036
	.p2align 3
.L2050:
	mov	w0, w19
	bl	VCTRL_InitDspCode
	cmp	w21, 1
	beq	.L2053
	add	x20, x20, 400
	mov	w1, 2
	mov	w0, 0
	str	w1, [x20, w19, sxtw 2]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2053:
	add	x20, x20, 400
	mov	w0, 0
	str	w21, [x20, w19, sxtw 2]
	b	.L2036
	.p2align 3
.L2052:
	cmp	w21, 1
	mov	w0, 0
	beq	.L2036
	ldr	x1, .LC994
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2036
	.size	VCTRL_LoadDspCode, .-VCTRL_LoadDspCode
	.align	3
.LC991:
	.xword	.LANCHOR1
	.align	3
.LC992:
	.xword	.LANCHOR5
	.align	3
.LC994:
	.xword	.LC993
	.align	3
.LC996:
	.xword	.LC995
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetChanFsPartitionState
	.type	VCTRL_SetChanFsPartitionState, %function
VCTRL_SetChanFsPartitionState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x0, .LC999
	ldr	x0, [x0, w20, sxtw 3]
	add	x0, x0, 475136
	str	w19, [x0, 2360]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetChanFsPartitionState, .-VCTRL_SetChanFsPartitionState
	.align	3
.LC999:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetCurChanFsSize
	.type	VCTRL_GetCurChanFsSize, %function
VCTRL_GetCurChanFsSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC1000
	ldr	x0, [x0, w19, sxtw 3]
	ldr	x19, [sp, 16]
	add	x0, x0, 503808
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 1972]
	ret
	.size	VCTRL_GetCurChanFsSize, .-VCTRL_GetCurChanFsSize
	.align	3
.LC1000:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRT_SetChanCtrlState
	.type	VCTRT_SetChanCtrlState, %function
VCTRT_SetChanCtrlState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w19, 1
	beq	.L2058
	cbz	w19, .L2059
	cmp	w19, 2
	bne	.L2067
	ldr	x0, .LC1001
	add	x0, x0, 3344
	ldr	w1, [x0, w20, sxtw 2]
	cmp	w1, 1
	beq	.L2063
.L2065:
	str	w19, [x0, w20, sxtw 2]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2067:
	mov	w0, 0
.L2057:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2059:
	ldr	x1, .LC1001
	mov	w0, 0
	add	x1, x1, 3344
	str	wzr, [x1, w20, sxtw 2]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2058:
	ldr	x0, .LC1001
	add	x0, x0, 3344
	ldr	w1, [x0, w20, sxtw 2]
	cbz	w1, .L2065
.L2063:
	mov	w0, -1
	b	.L2057
	.size	VCTRT_SetChanCtrlState, .-VCTRT_SetChanCtrlState
	.align	3
.LC1001:
	.xword	.LANCHOR5
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_AddFrameBufMemoryRecord
	.type	VCTRL_AddFrameBufMemoryRecord, %function
VCTRL_AddFrameBufMemoryRecord:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	cmp	w0, 255
	beq	.L2069
	ldr	w2, [x19, 12]
	ldr	w0, [x19, 32]
	ldr	x1, [x19, 24]
	bl	MEM_AddMemRecord
.L2069:
	ldr	w0, [x19, 4]
	cmp	w0, 255
	beq	.L2070
	ldr	w2, [x19, 16]
	ldr	w0, [x19, 48]
	ldr	x1, [x19, 40]
	bl	MEM_AddMemRecord
.L2070:
	ldr	w0, [x19, 8]
	cmp	w0, 255
	beq	.L2068
	ldr	w2, [x19, 20]
	ldr	w0, [x19, 64]
	ldr	x1, [x19, 56]
	bl	MEM_AddMemRecord
.L2068:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_AddFrameBufMemoryRecord, .-VCTRL_AddFrameBufMemoryRecord
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetSingleFrameBufToChan
	.type	VCTRL_SetSingleFrameBufToChan, %function
VCTRL_SetSingleFrameBufToChan:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x22, .LC1003
	ldr	w4, [x20, 12]
	ldr	x0, [x22, w19, sxtw 3]
	add	x1, x0, 507904
	ldr	w5, [x1, 1448]
	cmp	w5, w4
	beq	.L2082
	add	x0, x0, 503808
	ldr	w0, [x0, 1968]
	cbz	w0, .L2109
.L2082:
	ldr	w0, [x1, 264]
	cbz	w0, .L2084
	ldr	w0, [x1, 1480]
	cbz	w0, .L2110
.L2084:
	ldr	x23, .LC1009
	mov	w0, 8
	ldr	x1, [x23, 24]
	blr	x1
	ldr	x4, [x22, w19, sxtw 3]
	add	x2, x4, 503808
	ldr	w0, [x2, 2000]
	cmp	w0, 255
	beq	.L2093
	add	x2, x2, 2072
	mov	x1, 1
	b	.L2086
	.p2align 3
.L2112:
	add	w1, w1, 1
	cmp	w1, 32
	beq	.L2111
.L2086:
	ldr	w3, [x2]
	add	x2, x2, 72
	cmp	w3, 255
	bne	.L2112
.L2085:
	lsl	x0, x1, 6
	ldr	x3, [x23, 104]
	add	x0, x0, x1, lsl 3
	mov	x2, 72
	add	x0, x0, 503808
	mov	x1, x20
	add	x0, x0, 2000
	sxtw	x21, w19
	add	x0, x4, x0
	blr	x3
	ldr	x1, [x22, w19, sxtw 3]
	mov	x0, x20
	add	x1, x1, 507904
	ldr	w2, [x1, 1480]
	add	w2, w2, 1
	str	w2, [x1, 1480]
	bl	VCTRL_AddFrameBufMemoryRecord
	mov	x0, x21
	ldr	x1, .LC1010
	lsl	x21, x21, 6
	add	x0, x21, x0, lsl 3
	add	x1, x1, 912
	add	x21, x1, x0
	ldr	w0, [x21, 24]
	cmp	w0, 2
	beq	.L2113
.L2088:
	ldr	x0, [x22, w19, sxtw 3]
	add	x0, x0, 507904
	ldr	w0, [x0, 1484]
	cbnz	w0, .L2089
.L2091:
	mov	w19, 0
.L2090:
	ldr	x1, [x23, 32]
	mov	w0, 8
	blr	x1
	mov	w0, w19
.L2104:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2110:
	ldr	w5, [x20, 8]
	cmp	w5, 255
	bne	.L2084
	ldr	x2, .LC1004
	mov	w4, 0
	ldr	x1, .LC1008
	mov	w3, 8188
	add	x2, x2, 1536
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2104
	.p2align 3
.L2111:
	ldr	x2, .LC1004
	ldr	x1, .LC1014
.L2106:
	mov	w3, w19
	add	x2, x2, 1536
	mov	w0, 1
	mov	w19, -1
	bl	dprint_vfmw
	b	.L2090
	.p2align 3
.L2113:
	ldr	w0, [x21, 52]
	cbnz	w0, .L2088
	ldr	x0, [x23]
	blr	x0
	str	w0, [x21, 52]
	mov	w1, 3
	str	w1, [x21, 24]
	b	.L2088
	.p2align 3
.L2089:
	mov	x1, x20
	mov	w0, w19
	bl	FSP_SetSingleFrameBuf
	cbz	w0, .L2091
	ldr	x2, .LC1004
	ldr	x1, .LC1012
	b	.L2106
.L2093:
	mov	x1, 0
	b	.L2085
.L2109:
	ldr	x2, .LC1004
	mov	w3, 8178
	ldr	x1, .LC1006
	mov	w0, 1
	add	x2, x2, 1536
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2104
	.size	VCTRL_SetSingleFrameBufToChan, .-VCTRL_SetSingleFrameBufToChan
	.align	3
.LC1003:
	.xword	.LANCHOR1
	.align	3
.LC1004:
	.xword	.LANCHOR4
	.align	3
.LC1006:
	.xword	.LC1005
	.align	3
.LC1008:
	.xword	.LC1007
	.align	3
.LC1009:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1010:
	.xword	.LANCHOR5
	.align	3
.LC1012:
	.xword	.LC1011
	.align	3
.LC1014:
	.xword	.LC1013
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_AllocMemToDecoder
	.type	VCTRL_AllocMemToDecoder, %function
VCTRL_AllocMemToDecoder:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x21, .LC1016
	add	x3, x21, 3344
	ldr	w0, [x3, w19, sxtw 2]
	cbz	w0, .L2124
	ldr	x2, .LC1023
	mov	w3, w19
	ldr	x1, .LC1025
	mov	w0, 0
	add	x2, x2, 1568
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, -1
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2124:
	ldr	x23, .LC1017
	mov	x2, 72
	mov	x1, x20
	add	x0, x29, x2
	mov	w5, 1
	str	w5, [x3, w19, sxtw 2]
	ldr	x4, [x23, 104]
	blr	x4
	add	x1, x29, 72
	mov	w0, w19
	bl	VCTRL_SetSingleFrameBufToChan
	ldr	x22, .LC1018
	mov	w20, w0
	ldr	x0, [x22, w19, sxtw 3]
	add	x2, x0, 475136
	cbnz	w20, .L2125
.L2117:
	ldr	x1, .LC1022
	mov	w3, 2
	mov	w0, 31
	str	w3, [x2, 2360]
	bl	dprint_vfmw
	ldr	x0, [x22, w19, sxtw 3]
	add	x0, x0, 507904
	ldr	w0, [x0, 2084]
	cmp	w0, 1
	beq	.L2126
.L2118:
	add	x21, x21, 3344
	mov	w0, w20
	str	wzr, [x21, w19, sxtw 2]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2125:
	add	x1, x0, 503808
	add	x2, x0, 475136
	ldr	w0, [x1, 1972]
	cbz	w0, .L2117
	ldr	x1, .LC1020
	mov	w2, w19
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x0, [x22, w19, sxtw 3]
	mov	w1, 3
	add	x2, x0, 475136
	str	w1, [x2, 2360]
	b	.L2117
	.p2align 3
.L2126:
	ldr	x1, [x23, 256]
	mov	w0, 0
	blr	x1
	ldr	x0, [x22, w19, sxtw 3]
	add	x0, x0, 507904
	str	wzr, [x0, 2084]
	b	.L2118
	.size	VCTRL_AllocMemToDecoder, .-VCTRL_AllocMemToDecoder
	.align	3
.LC1016:
	.xword	.LANCHOR5
	.align	3
.LC1017:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1018:
	.xword	.LANCHOR1
	.align	3
.LC1020:
	.xword	.LC1019
	.align	3
.LC1022:
	.xword	.LC1021
	.align	3
.LC1023:
	.xword	.LANCHOR4
	.align	3
.LC1025:
	.xword	.LC1024
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetFsSize
	.type	VCTRL_GetFsSize, %function
VCTRL_GetFsSize:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	w21, w2
	bl	_mcount
	ldr	x3, .LC1027
	mov	x2, 24
	mov	w1, 0
	add	x0, x29, 56
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x0, .LC1028
	ldr	x6, [x0, 104]
	cbz	x6, .L2128
	ldr	x4, .LC1029
	add	x5, x29, 56
	mov	w3, 0
	mov	w2, w21
	mov	w1, w20
	mov	w0, w19
	ldr	x4, [x4, w19, sxtw 3]
	add	x4, x4, 507904
	ldr	w4, [x4, 2088]
	blr	x6
.L2128:
	ldr	w0, [x29, 60]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.size	VCTRL_GetFsSize, .-VCTRL_GetFsSize
	.align	3
.LC1027:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1028:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC1029:
	.xword	.LANCHOR1
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
	ldr	x0, .LC1030
	mov	w1, 1
	add	x0, x0, 3752
	str	w1, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_EnableEsBuf, .-VCTRL_EnableEsBuf
	.align	3
.LC1030:
	.xword	.LANCHOR5
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
	ldr	x0, .LC1032
	add	x0, x0, 3752
	str	wzr, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_DisableEsBuf, .-VCTRL_DisableEsBuf
	.align	3
.LC1032:
	.xword	.LANCHOR5
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
	ldr	x0, .LC1034
	add	x0, x0, 3752
	ldr	w0, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_IfEsBufEnable, .-VCTRL_IfEsBufEnable
	.align	3
.LC1034:
	.xword	.LANCHOR5
	.global	g_EsBufValidFlag
	.global	g_StopDec
	.global	g_SleepTime
	.global	s_VfmwSavePath
	.global	MemRecord_YUV
	.global	pPixelArray
	.global	pVl_2bit
	.global	pUl_2bit
	.global	pY_2bit
	.global	pVl
	.global	pUl
	.global	pY
	.global	g_eVdmVersion
	.global	g_VdmCharacter
	.global	g_StandardObedience
	.global	g_CurProcChan
	.global	g_SegBypassEnable
	.global	g_ResetCreateNewSave
	.global	g_SaveYUVBitWidth
	.global	save_yuv_with_crop
	.global	save_el_chan_num
	.global	vfmw_save_el_file
	.global	save_metadata_reorder_chan_num
	.global	vfmw_save_metadata_reorder_file
	.global	save_metadata_chan_num
	.global	vfmw_save_metadata_file
	.global	save_yuv_chan_num
	.global	vfmw_save_yuv_file
	.global	save_seg_chan_num
	.global	vfmw_save_seg_file
	.global	save_str_chan_num
	.global	vfmw_save_str_file
	.global	g_not_allow_H264FullPictureRepair_flag
	.global	g_not_direct_8x8_inference_flag
	.global	g_allow_B_before_P
	.global	extra_cmd
	.global	extra_disp
	.global	extra_ref
	.global	g_VfmwGlobalStat
	.global	g_VfmwChanStat
	.global	s_pstVfmwChan
	.global	AcceleratorCharacter
	.global	g_event_report
	.global	g_IsrFlag
	.global	g_VfmwCompressPara
	.global	g_DSPState
	.global	g_ClkSelect
	.global	mask_mmu_err_int
	.global	g_apple_airplay_mirrorinig_flag
	.global	g_IRQ_FLAG
	.global	g_SedOnlyEnable
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.17160, %object
	.size	__func__.17160, 18
__func__.17160:
	.string	"VCTRL_EventReport"
	.zero	6
	.type	__func__.18381, %object
	.size	__func__.18381, 24
__func__.18381:
	.string	"VCTRL_SetLastFrameState"
	.type	__func__.17099, %object
	.size	__func__.17099, 20
__func__.17099:
	.string	"VCTRL_RecordPosTime"
	.zero	4
	.type	__func__.17104, %object
	.size	__func__.17104, 17
__func__.17104:
	.string	"VCTRL_RecordData"
	.zero	7
	.type	__func__.17151, %object
	.size	__func__.17151, 23
__func__.17151:
	.string	"VCTRL_SetMoreGapEnable"
	.zero	1
	.type	__func__.17172, %object
	.size	__func__.17172, 18
__func__.17172:
	.string	"VCTRL_SetCallBack"
	.zero	6
	.type	__func__.17212, %object
	.size	__func__.17212, 25
__func__.17212:
	.string	"VCTRL_SetStreamInterface"
	.zero	7
	.type	__func__.17217, %object
	.size	__func__.17217, 29
__func__.17217:
	.string	"VCTRL_SetSendStreamAgainFlag"
	.zero	3
	.type	__func__.17221, %object
	.size	__func__.17221, 29
__func__.17221:
	.string	"VCTRL_GetSendStreamAgainFlag"
	.zero	3
	.type	__func__.17231, %object
	.size	__func__.17231, 20
__func__.17231:
	.string	"VCTRL_GetStreamSize"
	.zero	4
	.type	__func__.17238, %object
	.size	__func__.17238, 20
__func__.17238:
	.string	"VCTRL_CheckFreshRaw"
	.zero	4
	.type	__func__.17245, %object
	.size	__func__.17245, 20
__func__.17245:
	.string	"VCTRL_CheckFreshSeg"
	.zero	4
	.type	__func__.17250, %object
	.size	__func__.17250, 25
__func__.17250:
	.string	"VCTRL_SetDiscardPicParam"
	.zero	7
	.type	__FUNCTION__.17278, %object
	.size	__FUNCTION__.17278, 29
__FUNCTION__.17278:
	.string	"VCTRL_PartitionMemForStdUser"
	.zero	3
	.type	__func__.17293, %object
	.size	__func__.17293, 21
__func__.17293:
	.string	"DelAllFrameMemRecord"
	.zero	3
	.type	__func__.17303, %object
	.size	__func__.17303, 23
__func__.17303:
	.string	"VCTRL_FreeChanResource"
	.zero	1
	.type	__func__.17485, %object
	.size	__func__.17485, 17
__func__.17485:
	.string	"VCTRL_GetChanCfg"
	.zero	7
	.type	__func__.17546, %object
	.size	__func__.17546, 14
__func__.17546:
	.string	"VCTRL_SeekPts"
	.zero	2
	.type	__func__.17579, %object
	.size	__func__.17579, 20
__func__.17579:
	.string	"VCTRL_ReleaseStream"
	.zero	4
	.type	__func__.17599, %object
	.size	__func__.17599, 24
__func__.17599:
	.string	"VCTRL_ImageOutputEnable"
	.type	__func__.17638, %object
	.size	__func__.17638, 25
__func__.17638:
	.string	"VCTRL_TryToRelSpecialFrm"
	.zero	7
	.type	__func__.17662, %object
	.size	__func__.17662, 19
__func__.17662:
	.string	"VCTRL_GetChanImage"
	.zero	5
	.type	__FUNCTION__.17670, %object
	.size	__FUNCTION__.17670, 19
__FUNCTION__.17670:
	.string	"VCTRL_GetChanImage"
	.zero	5
	.type	__func__.17677, %object
	.size	__func__.17677, 23
__func__.17677:
	.string	"VCTRL_ReleaseChanImage"
	.zero	1
	.type	__FUNCTION__.17681, %object
	.size	__FUNCTION__.17681, 23
__FUNCTION__.17681:
	.string	"VCTRL_ReleaseChanImage"
	.zero	1
	.type	__func__.17689, %object
	.size	__func__.17689, 23
__func__.17689:
	.string	"VCTRL_GetHDRConfigInfo"
	.zero	1
	.type	__func__.17716, %object
	.size	__func__.17716, 18
__func__.17716:
	.string	"VCTRL_GetDecParam"
	.align	3
.LANCHOR4 = . + 0
	.type	__func__.17807, %object
	.size	__func__.17807, 20
__func__.17807:
	.string	"VCTRL_ClearDecparam"
	.zero	4
	.type	__func__.17837, %object
	.size	__func__.17837, 21
__func__.17837:
	.string	"VCTRL_VdmProcSedOnly"
	.zero	3
	.type	__func__.17847, %object
	.size	__func__.17847, 21
__func__.17847:
	.string	"VCTRL_GetImageBuffer"
	.zero	3
	.type	__func__.17871, %object
	.size	__func__.17871, 22
__func__.17871:
	.string	"VCTRL_ConfigFFFBSpeed"
	.zero	2
	.type	__func__.17876, %object
	.size	__func__.17876, 20
__func__.17876:
	.string	"VCTRL_ConfigPVRInfo"
	.zero	4
	.type	__func__.17880, %object
	.size	__func__.17880, 19
__func__.17880:
	.string	"VCTRL_IsChanActive"
	.zero	5
	.type	__func__.17886, %object
	.size	__func__.17886, 13
__func__.17886:
	.string	"USERDEC_Init"
	.zero	3
	.type	__func__.17905, %object
	.size	__func__.17905, 21
__func__.17905:
	.string	"VCTRL_GetUsrdecFrame"
	.zero	3
	.type	__func__.17915, %object
	.size	__func__.17915, 14
__func__.17915:
	.string	"InitSyntaxCtx"
	.zero	2
	.type	__func__.17971, %object
	.size	__func__.17971, 12
__func__.17971:
	.string	"OpenDrivers"
	.zero	4
	.type	__func__.17181, %object
	.size	__func__.17181, 15
__func__.17181:
	.string	"VCTRL_OpenVfmw"
	.zero	1
	.type	__FUNCTION__.18111, %object
	.size	__FUNCTION__.18111, 18
__FUNCTION__.18111:
	.string	"GetExtraRefFrmNum"
	.zero	6
	.type	__FUNCTION__.18117, %object
	.size	__FUNCTION__.18117, 19
__FUNCTION__.18117:
	.string	"GetExtraDispFrmNum"
	.zero	5
	.type	__FUNCTION__.18123, %object
	.size	__FUNCTION__.18123, 16
__FUNCTION__.18123:
	.string	"GetExtraCtrlCmd"
	.type	__func__.18056, %object
	.size	__func__.18056, 14
__func__.18056:
	.string	"DecChanSyntax"
	.zero	2
	.type	__FUNCTION__.18057, %object
	.size	__FUNCTION__.18057, 14
__FUNCTION__.18057:
	.string	"DecChanSyntax"
	.zero	2
	.type	__func__.17588, %object
	.size	__func__.17588, 24
__func__.17588:
	.string	"VCTRL_FindOccupiedFrame"
	.type	__func__.17609, %object
	.size	__func__.17609, 26
__func__.17609:
	.string	"VCTRL_ReportOccupiedFrame"
	.zero	6
	.type	__func__.18088, %object
	.size	__func__.18088, 20
__func__.18088:
	.string	"VCTRL_GetChanImgNum"
	.zero	4
	.type	__func__.17261, %object
	.size	__func__.17261, 19
__func__.17261:
	.string	"VCTRL_GetChanState"
	.zero	5
	.type	__func__.18092, %object
	.size	__func__.18092, 19
__func__.18092:
	.string	"VCTRL_GetChanWidth"
	.zero	5
	.type	__func__.18096, %object
	.size	__func__.18096, 20
__func__.18096:
	.string	"VCTRL_GetChanHeight"
	.zero	4
	.type	__func__.18100, %object
	.size	__func__.18100, 22
__func__.18100:
	.string	"VCTRL_GetChanCapLevel"
	.zero	2
	.type	g_ProcCommandTable, %object
	.size	g_ProcCommandTable, 720
g_ProcCommandTable:
	.word	0
	.zero	4
	.xword	VfmwProc_SetPrintLevel
	.word	2
	.zero	4
	.xword	VfmwProc_SetErrorThread
	.word	3
	.zero	4
	.xword	VfmwProc_SetDefaultOutputOrder
	.word	4
	.zero	4
	.xword	VfmwProc_SetDecOrderOutput
	.word	5
	.zero	4
	.xword	VfmwProc_SetDecMode
	.word	7
	.zero	4
	.xword	VfmwProc_SetDropStreamThread
	.word	8
	.zero	4
	.xword	VfmwProc_SetVp9DecFrameNum
	.word	9
	.zero	4
	.xword	VfmwProc_SetUvmosEnable
	.word	11
	.zero	4
	.xword	VfmwProc_SetUSE_FF_APT_EN
	.word	12
	.zero	4
	.xword	VfmwProc_SetSaveFileAfterReset
	.word	13
	.zero	4
	.xword	VfmwProc_SetCurProcChan
	.word	256
	.zero	4
	.xword	VfmwProc_PrintTracer
	.word	257
	.zero	4
	.xword	VfmwProc_SetScdPrint
	.word	512
	.zero	4
	.xword	VfmwProc_Savestream
	.word	513
	.zero	4
	.xword	VfmwProc_SaveSeg
	.word	514
	.zero	4
	.xword	VfmwProc_SaveYUV
	.word	516
	.zero	4
	.xword	VfmwProc_Save1DYUV
	.word	528
	.zero	4
	.xword	VfmwProc_SaveMetadata
	.word	544
	.zero	4
	.xword	VfmwProc_SaveReorderMetadata
	.word	560
	.zero	4
	.xword	VfmwProc_SaveEL
	.word	768
	.zero	4
	.xword	VfmwProc_TestSuspend
	.word	769
	.zero	4
	.xword	VfmwProc_TestResume
	.word	896
	.zero	4
	.xword	VfmwProc_TestStopChan
	.word	897
	.zero	4
	.xword	VfmwProc_TestResetChan
	.word	898
	.zero	4
	.xword	VfmwProc_TestStartChan
	.word	899
	.zero	4
	.xword	VfmwProc_TestRestartChan
	.word	1024
	.zero	4
	.xword	VfmwProc_TestTimeSequence
	.word	1026
	.zero	4
	.xword	VfmwProc_TestStopDec
	.word	1280
	.zero	4
	.xword	VfmwProc_SetTraceCtrl
	.word	1281
	.zero	4
	.xword	VfmwProc_SetTraceBSPeriod
	.word	1282
	.zero	4
	.xword	VfmwProc_SetTraceFramePeriod
	.word	1283
	.zero	4
	.xword	VfmwProc_SetTraceImgPeriod
	.word	1285
	.zero	4
	.xword	VfmwProc_SetSaveYuvBitWidth
	.word	1536
	.zero	4
	.xword	VfmwProc_OpenModuleLowly
	.word	1537
	.zero	4
	.xword	VfmwProc_CloseModuleLowly
	.word	1538
	.zero	4
	.xword	VfmwProc_SetTunnelLineNumber
	.word	1539
	.zero	4
	.xword	VfmwProc_OpenScdLowdly
	.word	1540
	.zero	4
	.xword	VfmwProc_CloseScdLowdly
	.word	1541
	.zero	4
	.xword	VfmwProc_SetSedOnlyEnable
	.word	1792
	.zero	4
	.xword	VfmwProc_SetSmmuIrqEnable
	.word	2048
	.zero	4
	.xword	VfmwProc_SetCompressPara
	.word	2304
	.zero	4
	.xword	VfmwProc_SetClkSelect
	.word	2305
	.zero	4
	.xword	VfmwProc_SetStandardObedience
	.word	2306
	.zero	4
	.xword	VfmwProc_SetSegBypass
	.word	65535
	.zero	4
	.xword	0
	.type	__func__.18396, %object
	.size	__func__.18396, 22
__func__.18396:
	.string	"VCTRL_OutputLastFrame"
	.zero	2
	.type	__func__.17781, %object
	.size	__func__.17781, 15
__func__.17781:
	.string	"VCTRL_PostProc"
	.zero	1
	.type	__func__.17832, %object
	.size	__func__.17832, 18
__func__.17832:
	.string	"VCTRL_VdmPostProc"
	.zero	6
	.type	__func__.18423, %object
	.size	__func__.18423, 21
__func__.18423:
	.string	"VCTRL_SvdecLastFrame"
	.zero	3
	.type	__func__.17911, %object
	.size	__func__.17911, 21
__func__.17911:
	.string	"VCTRL_PutUsrdecFrame"
	.zero	3
	.type	__func__.17464, %object
	.size	__func__.17464, 16
__func__.17464:
	.string	"VCTRL_StartChan"
	.type	__func__.17480, %object
	.size	__func__.17480, 15
__func__.17480:
	.string	"VCTRL_StopChan"
	.zero	1
	.type	__func__.17573, %object
	.size	__func__.17573, 26
__func__.17573:
	.string	"VCTRL_ResetChanWithOption"
	.zero	6
	.type	__func__.17652, %object
	.size	__func__.17652, 16
__func__.17652:
	.string	"VCTRL_ResetChan"
	.type	__func__.17370, %object
	.size	__func__.17370, 18
__func__.17370:
	.string	"VCTRL_AllocHalMem"
	.zero	6
	.type	__func__.17446, %object
	.size	__func__.17446, 17
__func__.17446:
	.string	"VCTRL_CreateChan"
	.zero	7
	.type	__func__.17327, %object
	.size	__func__.17327, 18
__func__.17327:
	.string	"VCTRL_AllocSCDMem"
	.zero	6
	.type	__func__.17531, %object
	.size	__func__.17531, 17
__func__.17531:
	.string	"VCTRL_ConfigChan"
	.zero	7
	.type	__func__.17458, %object
	.size	__func__.17458, 18
__func__.17458:
	.string	"VCTRL_DestroyChan"
	.zero	6
	.type	__func__.18518, %object
	.size	__func__.18518, 30
__func__.18518:
	.string	"VCTRL_SetSingleFrameBufToChan"
	.zero	2
	.type	__func__.18530, %object
	.size	__func__.18530, 24
__func__.18530:
	.string	"VCTRL_AllocMemToDecoder"
	.data
	.align	3
.LANCHOR2 = . + 0
	.type	g_ClkSelect, %object
	.size	g_ClkSelect, 4
g_ClkSelect:
	.word	-1
	.type	g_SaveYUVBitWidth, %object
	.size	g_SaveYUVBitWidth, 4
g_SaveYUVBitWidth:
	.word	8
	.type	s_VfmwSavePath, %object
	.size	s_VfmwSavePath, 64
s_VfmwSavePath:
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
	.type	save_yuv_chan_num, %object
	.size	save_yuv_chan_num, 4
save_yuv_chan_num:
	.word	-1
	.type	g_SegBypassEnable, %object
	.size	g_SegBypassEnable, 4
g_SegBypassEnable:
	.word	1
	.type	mask_mmu_err_int, %object
	.size	mask_mmu_err_int, 4
mask_mmu_err_int:
	.word	1
	.type	g_SedOnlyEnable, %object
	.size	g_SedOnlyEnable, 4
g_SedOnlyEnable:
	.word	1
	.type	g_IRQ_FLAG, %object
	.size	g_IRQ_FLAG, 4
g_IRQ_FLAG:
	.word	128
	.type	g_not_direct_8x8_inference_flag, %object
	.size	g_not_direct_8x8_inference_flag, 1
g_not_direct_8x8_inference_flag:
	.byte	1
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC3:
	ASCII(.string	"InstID out of range" )
	.zero	4
.LC6:
	ASCII(.string	"%s %d: %s\n" )
	.zero	5
.LC9:
	ASCII(.string	"Chan inactive" )
	.zero	2
.LC11:
	ASCII(.string	"s_VfmwCTrl.event_report_vdec = NULL\n" )
	.zero	3
.LC13:
	ASCII(.string	"s_VfmwCTrl.event_report_omxvdec = NULL\n" )
.LC15:
	ASCII(.string	"%s Unkown Adapter Type: %d, Len: %d\n" )
	.zero	3
.LC18:
	ASCII(.string	"Set standard obedience: %d\n" )
	.zero	4
.LC21:
	ASCII(.string	"g_ClkSelect(%d) set error! dat = %d not support\n" )
	.zero	7
.LC24:
	ASCII(.string	"ChanID:%d, Compress Disable!" )
	.zero	3
.LC26:
	ASCII(.string	"ChanID: %d, VcmpEn: %d, LossCmpEN: %d\n" )
	.zero	1
.LC28:
	ASCII(.string	"ChanID: %d, VcmpEn: %d, LossCmpEN: %d, YRatio: 0.%d, UVRatio: 0.%d\n" )
	.zero	4
.LC31:
	ASCII(.string	"ChanID:%d; " )
	.zero	4
.LC33:
	ASCII(.string	"VCmpEnable:%d; " )
.LC35:
	ASCII(.string	"LossCmpEnable:%d; " )
	.zero	5
.LC37:
	ASCII(.string	"YCmpRatio:%d, YCmpRatio:%d\n" )
	.zero	4
.LC39:
	ASCII(.string	"ChanID %d Already Create! Can not be set!!\n" )
	.zero	4
.LC43:
	ASCII(.string	"------ s_pstVfmwChan[%d]->stSynExtraData.s32ModuleLowlyEnable = 1 ------\n" )
	.zero	6
.LC45:
	ASCII(.string	"ERROR: g_SaveYUVBitWidth should be 8 or 10! (not to be %d)\n" )
	.zero	4
.LC48:
	ASCII(.string	"------ g_SaveYUVBitWidth = %d ------\n" )
	.zero	2
.LC51:
	ASCII(.string	"------ g_TraceImgPeriod = %x ------\n" )
	.zero	3
.LC54:
	ASCII(.string	"------ g_TraceFramePeriod = %x ------\n" )
	.zero	1
.LC57:
	ASCII(.string	"------ g_TraceBsPeriod = %x ------\n" )
	.zero	4
.LC60:
	ASCII(.string	"------ g_TraceCtrl = %x ------\n" )
.LC63:
	ASCII(.string	"------ dec stop = %d ------\n" )
	.zero	3
.LC66:
	ASCII(.string	"------ dec task delay %d ms ------\n" )
	.zero	4
.LC71:
	ASCII(.string	"%s/vfmw_el_save_%d.dat" )
	.zero	1
.LC73:
	ASCII(.string	"OK create file '%s' for channel %d el stream save\n" )
	.zero	5
.LC75:
	ASCII(.string	"failed create file '%s' for el stream save!\n" )
	.zero	3
.LC77:
	ASCII(.string	">>>> close el stream saving >>>>\n" )
	.zero	6
.LC80:
	ASCII(.string	"NO SUCH CHANNEL : %d\n" )
	.zero	2
.LC83:
	ASCII(.string	"Pay attention to  CHANNEL : %d\n" )
.LC86:
	ASCII(.string	"ResetCreateNewSave = %d\n" )
	.zero	7
.LC88:
	ASCII(.string	"ResetCreateNewSave can NOT be set to %d, must be 0 or 1\n" )
	.zero	7
.LC91:
	ASCII(.string	"USE_FF_APT_EN = %d\n" )
	.zero	4
.LC93:
	ASCII(.string	"USE_FF_APT_EN can NOT be set to %d, must be 0 or 1\n" )
	.zero	4
.LC96:
	ASCII(.string	"g_CfgVp9FrmNum = %d\n" )
	.zero	3
.LC98:
	ASCII(.string	"Invalid output order %d\n" )
	.zero	7
.LC100:
	ASCII(.string	"set default output order %d\n" )
	.zero	3
.LC106:
	ASCII(.string	"OK create file '%s' for channel %d metadata_reorder stream save\n" )
	.zero	7
.LC108:
	ASCII(.string	"failed create file '%s' for metadata_reorder stream save!\n" )
	.zero	5
.LC110:
	ASCII(.string	">>>> close metadata stream saving >>>>\n" )
.LC116:
	ASCII(.string	"OK create file '%s' for channel %d metadata stream save\n" )
	.zero	7
.LC118:
	ASCII(.string	"failed create file '%s' for metadata stream save!\n" )
	.zero	5
.LC123:
	ASCII(.string	"address '0x%x' is not valid!\n" )
	.zero	2
.LC127:
	ASCII(.string	"VDMHAL_NULL_FUN_PRINT,L%d\n" )
	.zero	5
.LC129:
	ASCII(.string	"1d image has been saved to '%s'\n" )
	.zero	7
.LC131:
	ASCII(.string	"open file '%s' fail!\n" )
	.zero	2
.LC136:
	ASCII(.string	"OK create file '%s' for channel %d seg stream save\n" )
	.zero	4
.LC138:
	ASCII(.string	"failed create file '%s' for seg stream save!\n" )
	.zero	2
.LC140:
	ASCII(.string	">>>> close seg stream saving >>>>\n" )
	.zero	5
.LC146:
	ASCII(.string	"OK create file '%s' for channel %d raw stream save\n" )
	.zero	4
.LC148:
	ASCII(.string	"failed create file '%s' for raw stream save!\n" )
	.zero	2
.LC150:
	ASCII(.string	">>>> close raw stream saving >>>>\n" )
	.zero	5
.LC156:
	ASCII(.string	"Failed to alloc VFMW_DumpImageTmp size %d!\n" )
	.zero	4
.LC158:
	ASCII(.string	"OK create file '%s' for chan %d yuv save.(crop %d)\n" )
	.zero	4
.LC160:
	ASCII(.string	"failed create file '%s' for yuv save!\n" )
	.zero	1
.LC162:
	ASCII(.string	"OK close yuv save.\n" )
	.zero	4
.LC172:
	ASCII(.string	"print memory tracer...\n" )
.LC175:
	ASCII(.string	"Disable seg bypass.\n" )
	.zero	3
.LC177:
	ASCII(.string	"Enable seg bypass.\n" )
	.zero	4
.LC180:
	ASCII(.string	"unmask vfmw mmu err int!\n" )
	.zero	6
.LC182:
	ASCII(.string	"mask vfmw mmu err int!\n" )
.LC185:
	ASCII(.string	"Disable SedOnly Func\n" )
	.zero	2
.LC187:
	ASCII(.string	"Enable SedOnly Func\n" )
	.zero	3
.LC189:
	ASCII(.string	"The channel number is to Large.\n" )
	.zero	7
.LC198:
	ASCII(.string	"ChanID out of range" )
	.zero	4
.LC208:
	ASCII(.string	"Wait sleep time out %d ms (isScdSleep=%d, isVdmSleep=%d)!\n" )
	.zero	5
.LC212:
	ASCII(.string	"Vfmw suspend totally take %d ms\n" )
	.zero	7
.LC214:
	ASCII(.string	"Force scd %d sleep.\n" )
	.zero	3
.LC216:
	ASCII(.string	"Force vdm %d sleep.\n" )
	.zero	3
.LC219:
	ASCII(.string	"proc cmd need no param:%p\n" )
	.zero	5
.LC226:
	ASCII(.string	"Vfmw resume totally take %d ms\n" )
.LC237:
	ASCII(.string	"%s,%d,pos(%d) error!\n" )
	.zero	2
.LC244:
	ASCII(.string	"%s, %d, pos(%d) error!\n" )
.LC255:
	ASCII(.string	"can NOT config a not-opened Chan" )
	.zero	7
.LC257:
	ASCII(.string	"event_report null!" )
	.zero	5
.LC262:
	ASCII(.string	"%s Unkown Adapter Type: %d\n" )
	.zero	4
.LC268:
	ASCII(.string	"pstStreamParam is NULL" )
	.zero	1
.LC272:
	ASCII(.string	"ChanID invalid" )
	.zero	1
.LC290:
	ASCII(.string	"L: %d, Stream Interface Error!!, ChanID: %d\n" )
	.zero	3
.LC297:
	ASCII(.string	"This Chan has not been created!!!" )
	.zero	6
.LC299:
	ASCII(.string	"can NOT get a not-opened Chan's information of bitstream" )
	.zero	7
.LC307:
	ASCII(.string	"Raw FreshNum=%d, FreshSize=%d\n" )
	.zero	1
.LC315:
	ASCII(.string	"Seg FreshNum=%d, FreshSize=%d\n" )
	.zero	1
.LC320:
	ASCII(.string	"pArgs is null" )
	.zero	2
.LC326:
	ASCII(.string	"image size abnormal(%dx%d)\n" )
	.zero	4
.LC328:
	ASCII(.string	"no mem to arrange for soft dec\n" )
.LC331:
	ASCII(.string	"partition fs memory fail!\n" )
	.zero	5
.LC334:
	ASCII(.string	"%s: L%d : vdm chan memory is too small to support user decoder\n" )
.LC336:
	ASCII(.string	"FSP_ConfigInstance fail!\n" )
	.zero	6
.LC341:
	ASCII(.string	"parameter err, null pointer!!!" )
	.zero	1
.LC346:
	ASCII(.string	"%s FATAL: pstChan = NULL!\n" )
	.zero	5
.LC348:
	ASCII(.string	"%s FATAL: pChanMem_vdh = NULL!\n" )
.LC350:
	ASCII(.string	"%s FATAL: pChanMem_frm = NULL!\n" )
.LC352:
	ASCII(.string	"DelAllFrameMemRecord err in VCTRL_FreeChanResource !\n" )
	.zero	2
.LC354:
	ASCII(.string	"%s FATAL: pChanMem_scd = NULL!\n" )
.LC356:
	ASCII(.string	"%s FATAL: pChanMem_hal = NULL!\n" )
.LC358:
	ASCII(.string	"%s FATAL: pChanMem_ctx = NULL!\n" )
.LC366:
	ASCII(.string	"pstCfg is null" )
	.zero	1
.LC376:
	ASCII(.string	"Chip not support beyond %dx%d when Std != H264/VP8/MVC/USER.\n" )
	.zero	2
.LC385:
	ASCII(.string	"ChanID out of range!" )
	.zero	3
.LC390:
	ASCII(.string	"s_pstVfmwChan = NULL" )
	.zero	3
.LC402:
	ASCII(.string	"%s,%d,s_pstVfmwChan[chanID]->FspInst.stDecFsRec[i].PhyFS.PhyAddr = 0x%x\n" )
	.zero	7
.LC404:
	ASCII(.string	"%s,%d,can't find special frame match DecFs Num = %d\n" )
	.zero	3
.LC412:
	ASCII(.string	"pImage is NULL" )
	.zero	1
.LC415:
	ASCII(.string	"vdm_ctrl.c,L%d: Chan inactive\n" )
	.zero	1
.LC417:
	ASCII(.string	"This channel %d is not opened!\n" )
.LC419:
	ASCII(.string	"%s cannot output!\n" )
	.zero	5
.LC421:
	ASCII(.string	"%s: view_0 id(%d) > view_1 id(%d), error!\n" )
	.zero	5
.LC423:
	ASCII(.string	"%s: continuous view0 id(%d)!\n" )
	.zero	2
.LC425:
	ASCII(.string	"%s: continuous view1 id(%d)!\n" )
	.zero	2
.LC435:
	ASCII(.string	"This channel is not opened" )
	.zero	5
.LC440:
	ASCII(.string	"vdm_ctrl.c,L%d: This channel is not opened\n" )
	.zero	4
.LC442:
	ASCII(.string	"vdm_ctrl.c,L%d: VCTRL_TryToRelSpecialFrm success!\n" )
	.zero	5
.LC446:
	ASCII(.string	"%s call SYNTAX_ReleaseImage failed\n" )
	.zero	4
.LC450:
	ASCII(.string	"vfmw_ctrl.c, line %d: ChanID out of range\n" )
	.zero	5
.LC452:
	ASCII(.string	"vfmw_ctrl.c, line %d: Chan %d is not open or not running\n" )
	.zero	6
.LC459:
	ASCII(.string	"pstHDRInput = null" )
	.zero	5
.LC464:
	ASCII(.string	"%s VidStd=%d Error!\n" )
	.zero	3
.LC467:
	ASCII(.string	"Get DecParam Type Failure!\n" )
	.zero	4
.LC469:
	ASCII(.string	"ChanId invalid!" )
.LC475:
	ASCII(.string	"ChanId out of range" )
	.zero	4
.LC481:
	ASCII(.string	"This channel is not running" )
	.zero	4
.LC495:
	ASCII(.string	"chan not create" )
.LC497:
	ASCII(.string	"can NOT start a not-opened Chan" )
.LC499:
	ASCII(.string	"NULL == pArgs" )
	.zero	2
.LC514:
	ASCII(.string	"%s param invalid!\n" )
	.zero	5
.LC518:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err!\n" )
	.zero	5
.LC524:
	ASCII(.string	"VCTRL_GetUsrdecFrame but VFMW_USER != s_pstVfmwChan[ChanID]->eVidStd!\n" )
	.zero	1
.LC526:
	ASCII(.string	"VCTRL_GetUsrdecFrame but s_pstVfmwChan[ChanID]->s32UsrdecFrameNum < MIN_USERDEC_FRAME_NUM!\n" )
	.zero	4
.LC528:
	ASCII(.string	"get frame store fail!\n" )
	.zero	1
.LC530:
	ASCII(.string	"get image buffer ok: LogicFsID = %d\n" )
	.zero	3
.LC532:
	ASCII(.string	"line: %d, pLf is NULL!\n" )
.LC534:
	ASCII(.string	"decode %p, disp %p, tf %p\n" )
	.zero	5
.LC536:
	ASCII(.string	"VCTRL_GetUsrdecFrame get LogicFs fail!\n" )
.LC543:
	ASCII(.string	"CAP_LEVEL_USER_DEFINE_WITH_OPTION option is illegal.\n" )
	.zero	2
.LC546:
	ASCII(.string	"VCTRL_GetChanMemSizeByOption L%d: arrange return failure\n" )
	.zero	6
.LC551:
	ASCII(.string	"ERROR: s32MaxRefFrameNum(%d), extra_ref(%d), s32DisplayFrameNum(%d), extra_disp(%d)\n" )
	.zero	3
.LC559:
	ASCII(.string	"MEM_MapRegisterAddr reg 0x%x failed!\n" )
	.zero	2
.LC563:
	ASCII(.string	"%s alloc dsp mem size %d failed!\n" )
	.zero	6
.LC568:
	ASCII(.string	"Register irq %d failed!\n" )
	.zero	7
.LC573:
	ASCII(.string	"HEVCDEC_AllocHevcGlbMem Error!\n" )
.LC577:
	ASCII(.string	"pArgs = NULL" )
	.zero	3
.LC584:
	ASCII(.string	"extra_ref=" )
	.zero	5
.LC586:
	ASCII(.string	"=" )
	.zero	6
.LC588:
	ASCII(.string	" " )
	.zero	6
.LC590:
	ASCII(.string	"fuction return value is null,%s %d unknow error!!\n" )
	.zero	5
.LC592:
	ASCII(.string	"ERROR: extra_ref = %d is out of [ -5000, 5000 ]!\n" )
	.zero	6
.LC594:
	ASCII(.string	"extra_disp=" )
	.zero	4
.LC596:
	ASCII(.string	"ERROR: extra_disp = %d is out of [ -5000, 5000 ]!\n" )
	.zero	5
.LC600:
	ASCII(.string	"extra_cmd=" )
	.zero	5
.LC607:
	ASCII(.string	"HI_VFMW_VideoDecode" )
	.zero	4
.LC612:
	ASCII(.string	"(safe,warn,danger) :amount = %d,%d,%d,%d\n" )
	.zero	6
.LC614:
	ASCII(.string	"strm_ctrl: I->IPB\n" )
	.zero	5
.LC616:
	ASCII(.string	"strm_ctrl: IPB->I\n" )
	.zero	5
.LC618:
	ASCII(.string	"(CurrMode,NextMode) = %d,%d\n" )
	.zero	3
.LC623:
	ASCII(.string	"pic_pts: %lld\n" )
	.zero	1
.LC625:
	ASCII(.string	"pic_usertag: %lld\n" )
	.zero	5
.LC627:
	ASCII(.string	"pic_pts: %lld pic_usertag = %lld\n" )
	.zero	6
.LC637:
	ASCII(.string	"Syntax is stopped from This channel" )
	.zero	4
.LC642:
	ASCII(.string	"[%d] vdm busy\n" )
	.zero	1
.LC644:
	ASCII(.string	"[%d] no frame\n" )
	.zero	1
.LC646:
	ASCII(.string	"DFS, Wait Partition\n" )
	.zero	3
.LC648:
	ASCII(.string	"DFS, Partition fail, u32DynamicFrameStoreAllocEn: %d, eFspPartitionState: %d\n" )
	.zero	2
.LC650:
	ASCII(.string	"[%d] no stream\n" )
.LC652:
	ASCII(.string	"seg_pts: %lld, seg_usertag = %lld\n" )
	.zero	5
.LC665:
	ASCII(.string	"Thread running...\n" )
	.zero	5
.LC667:
	ASCII(.string	"Thread stopped!\n" )
	.zero	7
.LC669:
	ASCII(.string	"thread running...\n" )
	.zero	5
.LC671:
	ASCII(.string	"thread stopped...\n" )
	.zero	5
.LC674:
	ASCII(.string	"Thread killed!\n" )
.LC682:
	ASCII(.string	"ERROR:ReadNum = %d larger than VFMW_MAX_RESERVE_NUM(%d)\n" )
	.zero	7
.LC685:
	ASCII(.string	"The array of occupied frames is overflow, s_pstVfmwChan[%d]->specialFrameNum = %d" )
	.zero	6
.LC690:
	ASCII(.string	"pSpecialFrmInfo = null!!!" )
	.zero	6
.LC695:
	ASCII(.string	"pRefImgNum  = null" )
	.zero	5
.LC699:
	ASCII(.string	"pReadImgNum = null" )
	.zero	5
.LC701:
	ASCII(.string	"pNewImgNum  = null" )
	.zero	5
.LC708:
	ASCII(.string	"pstChanState = NULL" )
	.zero	4
.LC733:
	ASCII(.string	"SetVdecExtra ERROR: extra_ref = %d is out of [ -5000, 5000 ]!\n" )
	.zero	1
.LC735:
	ASCII(.string	"SetVdecExtra ERROR: extra_disp = %d is out of [ -5000, 5000 ]!\n" )
.LC744:
	ASCII(.string	"Command \"%d\" not registerd!\n" )
	.zero	3
.LC750:
	ASCII(.string	"Chan %d Report Last Frame, Value=%d, LastFrameState=%d\n" )
.LC758:
	ASCII(.string	"Last frame output failed!\n" )
	.zero	5
.LC760:
	ASCII(.string	"Last frame output successed!\n" )
	.zero	2
.LC762:
	ASCII(.string	"Last frame already output, image id: %d!\n" )
	.zero	6
.LC779:
	ASCII(.string	"line %d can not know YuvFormat = %d\n" )
	.zero	3
.LC781:
	ASCII(.string	"userdec frame(phy=%#x) address error!\n" )
	.zero	1
.LC783:
	ASCII(.string	"can not map vir addr for usrdat frame(cbphy=%#x)\n" )
	.zero	6
.LC785:
	ASCII(.string	"line: %d, pLogic is Null!\n" )
	.zero	5
.LC788:
	ASCII(.string	"eYuvFormat %d is not support!!\n" )
.LC795:
	ASCII(.string	"pUsrdecFrame == NULL" )
	.zero	3
.LC797:
	ASCII(.string	"VCTRL_PutUsrdecFrame: VidStd is %d\n" )
	.zero	4
.LC800:
	ASCII(.string	"VCTRL_PutUsrdecFrame return err\n" )
	.zero	7
.LC802:
	ASCII(.string	"L:%d ChanID out of range\n" )
	.zero	6
.LC805:
	ASCII(.string	"L:%d This Chan has not been created!!!\n" )
.LC807:
	ASCII(.string	"L:%d WARNING: vidio std not setted!\n" )
	.zero	3
.LC819:
	ASCII(.string	"WARNING: vidio std not setted!" )
	.zero	1
.LC829:
	ASCII(.string	"start chan %d: VCTRL_StartChan return %d\n" )
	.zero	6
.LC840:
	ASCII(.string	"This Chan has not been created or has been destroyed !" )
	.zero	1
.LC843:
	ASCII(.string	"VCTRL_StopChanWithCheck fail!\n" )
	.zero	1
.LC850:
	ASCII(.string	"vdm_ctrl.c,L%d: pOption->s32KeepBS error\n" )
	.zero	6
.LC854:
	ASCII(.string	"-------------------------------------------------------------------------\n" )
	.zero	5
.LC869:
	ASCII(.string	"Param Invalid of PChanOption is NULL\n" )
	.zero	2
.LC872:
	ASCII(.string	"line %d VCTRL_GetChanMemSize failed!\n" )
	.zero	2
.LC875:
	ASCII(.string	"ChanID: %d is out of range!\n" )
	.zero	3
.LC877:
	ASCII(.string	"vfmw have max(%d) channels opened, can NOT create more channels\n" )
	.zero	7
.LC882:
	ASCII(.string	"%s get Vdh %d hal mem size failed!\n" )
	.zero	4
.LC884:
	ASCII(.string	"%s alloc Vdh %d hal mem size %d failed!\n" )
	.zero	7
.LC886:
	ASCII(.string	"VDMHAL_OpenHAL Vdh %d failed!\n" )
	.zero	1
.LC888:
	ASCII(.string	"%s alloc vdh %d vp9 prob mem size %d failed!\n" )
	.zero	2
.LC890:
	ASCII(.string	"%s alloc Scd %d hal mem size %d failed!\n" )
	.zero	7
.LC892:
	ASCII(.string	"%s open Scd %d drv failed!\n" )
	.zero	4
.LC894:
	ASCII(.string	"%s alloc hal mem failed!\n" )
	.zero	6
.LC896:
	ASCII(.string	"L: %d : part we can NOT alloc buffer for channel context\n" )
	.zero	6
.LC898:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel context\n" )
	.zero	6
.LC900:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel vdh\n" )
	.zero	2
.LC902:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel vdh, %#x < %#x\n" )
	.zero	7
.LC904:
	ASCII(.string	"%s :%d Alloc failed ScdDetailMem:%d\n" )
	.zero	3
.LC906:
	ASCII(.string	"%s allc chan scd failed!\n" )
	.zero	6
.LC908:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel Hal Mem\n" )
	.zero	6
.LC911:
	ASCII(.string	"%s alloc mem for vfmw failed!\n" )
	.zero	1
.LC913:
	ASCII(.string	"Chan:%d can NOT enable FSP instance\n" )
	.zero	3
.LC918:
	ASCII(.string	"pstCfg = NULL" )
	.zero	2
.LC926:
	ASCII(.string	"VCTRL_CheckChanWH return err.\n" )
	.zero	1
.LC929:
	ASCII(.string	"VFMW didn't support std %d.\n" )
	.zero	3
.LC931:
	ASCII(.string	"VCTRL_ConfigChan with same config paramater.\n" )
	.zero	2
.LC935:
	ASCII(.string	"can NOT VCTRL_PartitionMemForStdUser\n" )
	.zero	2
.LC942:
	ASCII(.string	"chan %d: new UvmosEnable = %d\n" )
	.zero	1
.LC945:
	ASCII(.string	"chan %d: SetUvmosEnable failed!\n" )
	.zero	7
.LC947:
	ASCII(.string	"chan %d: new StrmOFThr = %d\n" )
	.zero	3
.LC950:
	ASCII(.string	"chan %d: new DecMode = %d\n" )
	.zero	5
.LC953:
	ASCII(.string	"chan %d: GetChanCfg failed!\n" )
	.zero	3
.LC955:
	ASCII(.string	"chan %d: new DecOrderOutput = %d\n" )
	.zero	6
.LC958:
	ASCII(.string	"chan %d: new ChanErrThr = %d\n" )
	.zero	2
.LC961:
	ASCII(.string	"reset chan %d: VCTRL_ResetChan return %d\n" )
	.zero	6
.LC966:
	ASCII(.string	"%s:L%d: %s\n" )
	.zero	4
.LC969:
	ASCII(.string	"This Chan has not been created or has been destroyed !!!" )
	.zero	7
.LC971:
	ASCII(.string	"can NOT stop a not-opened Chan" )
	.zero	1
.LC983:
	ASCII(.string	"stop chan %d: VCTRL_StopChan return %d\n" )
.LC993:
	ASCII(.string	"WARNNING: dsp in lowdelay state, we can not supported  avs in the same time!!!\n" )
.LC995:
	ASCII(.string	"WARNNING: dsp in avs state, we can not supported  lowdelay in the same time!!!\n" )
.LC1005:
	ASCII(.string	"%s, %d, actul size = 0x%x, except size= 0x%x\n" )
	.zero	2
.LC1007:
	ASCII(.string	"%s, %d, CfgFrameNum = %x, PmvNodeStatus= 0x%x\n" )
	.zero	1
.LC1011:
	ASCII(.string	"%s: Chan %d set single frame failed!\n" )
	.zero	2
.LC1013:
	ASCII(.string	"%s: Chan %d no frame buffer store!\n" )
	.zero	4
.LC1019:
	ASCII(.string	"DFS, request frame store fail!, chanid: %d\n" )
	.zero	4
.LC1021:
	ASCII(.string	"DFS, set decoding thread state to success!\n " )
	.zero	3
.LC1024:
	ASCII(.string	"%s set chan %d ctrl state CHAN_FRAME_STORE_ALLOC failed!\n" )
	.bss
	.align	3
.LANCHOR1 = . + 0
.LANCHOR3 = . + 4352
.LANCHOR5 = . + 8704
	.type	s_pstVfmwChan, %object
	.size	s_pstVfmwChan, 256
s_pstVfmwChan:
	.zero	256
	.type	s_VfmwCTrl, %object
	.size	s_VfmwCTrl, 352
s_VfmwCTrl:
	.zero	352
	.type	g_StandardObedience, %object
	.size	g_StandardObedience, 4
g_StandardObedience:
	.zero	4
	.zero	4
	.type	g_VfmwCompressPara, %object
	.size	g_VfmwCompressPara, 512
g_VfmwCompressPara:
	.zero	512
	.type	g_StopDec, %object
	.size	g_StopDec, 4
g_StopDec:
	.zero	4
	.type	g_SleepTime, %object
	.size	g_SleepTime, 4
g_SleepTime:
	.zero	4
	.type	vfmw_save_el_file, %object
	.size	vfmw_save_el_file, 256
vfmw_save_el_file:
	.zero	256
	.type	save_file_cnt.18259, %object
	.size	save_file_cnt.18259, 4
save_file_cnt.18259:
	.zero	4
	.type	save_el_chan_num, %object
	.size	save_el_chan_num, 4
save_el_chan_num:
	.zero	4
	.type	g_CurProcChan, %object
	.size	g_CurProcChan, 4
g_CurProcChan:
	.zero	4
	.type	g_ResetCreateNewSave, %object
	.size	g_ResetCreateNewSave, 4
g_ResetCreateNewSave:
	.zero	4
	.type	vfmw_save_metadata_reorder_file, %object
	.size	vfmw_save_metadata_reorder_file, 256
vfmw_save_metadata_reorder_file:
	.zero	256
	.type	save_file_cnt.18253, %object
	.size	save_file_cnt.18253, 4
save_file_cnt.18253:
	.zero	4
	.type	save_metadata_reorder_chan_num, %object
	.size	save_metadata_reorder_chan_num, 4
save_metadata_reorder_chan_num:
	.zero	4
	.type	vfmw_save_metadata_file, %object
	.size	vfmw_save_metadata_file, 256
vfmw_save_metadata_file:
	.zero	256
	.type	save_file_cnt.18247, %object
	.size	save_file_cnt.18247, 4
save_file_cnt.18247:
	.zero	4
	.type	save_metadata_chan_num, %object
	.size	save_metadata_chan_num, 4
save_metadata_chan_num:
	.zero	4
	.type	vfmw_save_seg_file, %object
	.size	vfmw_save_seg_file, 256
vfmw_save_seg_file:
	.zero	256
	.type	save_file_cnt.18225, %object
	.size	save_file_cnt.18225, 4
save_file_cnt.18225:
	.zero	4
	.type	save_seg_chan_num, %object
	.size	save_seg_chan_num, 4
save_seg_chan_num:
	.zero	4
	.type	vfmw_save_str_file, %object
	.size	vfmw_save_str_file, 256
vfmw_save_str_file:
	.zero	256
	.type	save_file_cnt.18219, %object
	.size	save_file_cnt.18219, 4
save_file_cnt.18219:
	.zero	4
	.type	save_str_chan_num, %object
	.size	save_str_chan_num, 4
save_str_chan_num:
	.zero	4
	.type	vfmw_save_yuv_file, %object
	.size	vfmw_save_yuv_file, 256
vfmw_save_yuv_file:
	.zero	256
	.type	save_file_cnt.18232, %object
	.size	save_file_cnt.18232, 4
save_file_cnt.18232:
	.zero	4
	.zero	4
	.type	MemRecord_YUV, %object
	.size	MemRecord_YUV, 32
MemRecord_YUV:
	.zero	32
	.type	pVl, %object
	.size	pVl, 8
pVl:
	.zero	8
	.type	pUl, %object
	.size	pUl, 8
pUl:
	.zero	8
	.type	pY, %object
	.size	pY, 8
pY:
	.zero	8
	.type	pVl_2bit, %object
	.size	pVl_2bit, 8
pVl_2bit:
	.zero	8
	.type	pUl_2bit, %object
	.size	pUl_2bit, 8
pUl_2bit:
	.zero	8
	.type	pY_2bit, %object
	.size	pY_2bit, 8
pY_2bit:
	.zero	8
	.type	save_yuv_with_crop, %object
	.size	save_yuv_with_crop, 4
save_yuv_with_crop:
	.zero	4
	.zero	4
	.type	pPixelArray, %object
	.size	pPixelArray, 8
pPixelArray:
	.zero	8
	.type	g_IsrFlag, %object
	.size	g_IsrFlag, 1
g_IsrFlag:
	.zero	1
	.zero	7
	.type	s_StreamIntf, %object
	.size	s_StreamIntf, 768
s_StreamIntf:
	.zero	768
	.type	FspInstInfo.17274, %object
	.size	FspInstInfo.17274, 2952
FspInstInfo.17274:
	.zero	2952
	.type	g_VdmCharacter, %object
	.size	g_VdmCharacter, 4
g_VdmCharacter:
	.zero	4
	.zero	4
	.type	last_rec_pos_time.17667, %object
	.size	last_rec_pos_time.17667, 128
last_rec_pos_time.17667:
	.zero	128
	.type	last_rec_pos_time.17678, %object
	.size	last_rec_pos_time.17678, 128
last_rec_pos_time.17678:
	.zero	128
	.type	MemArrange.17946, %object
	.size	MemArrange.17946, 1232
MemArrange.17946:
	.zero	1232
	.type	extra_ref, %object
	.size	extra_ref, 4
extra_ref:
	.zero	4
	.type	extra_disp, %object
	.size	extra_disp, 4
extra_disp:
	.zero	4
	.type	g_VfmwIrqHandle, %object
	.size	g_VfmwIrqHandle, 4
g_VfmwIrqHandle:
	.zero	4
	.zero	4
	.type	cmdline, %object
	.size	cmdline, 1024
cmdline:
	.zero	1024
	.type	extra_cmd, %object
	.size	extra_cmd, 4
extra_cmd:
	.zero	4
	.type	g_allow_B_before_P, %object
	.size	g_allow_B_before_P, 1
g_allow_B_before_P:
	.zero	1
	.type	g_not_allow_H264FullPictureRepair_flag, %object
	.size	g_not_allow_H264FullPictureRepair_flag, 1
g_not_allow_H264FullPictureRepair_flag:
	.zero	1
	.type	g_apple_airplay_mirrorinig_flag, %object
	.size	g_apple_airplay_mirrorinig_flag, 1
g_apple_airplay_mirrorinig_flag:
	.zero	1
	.zero	1
	.type	g_event_report, %object
	.size	g_event_report, 8
g_event_report:
	.zero	8
	.type	g_DSPState, %object
	.size	g_DSPState, 128
g_DSPState:
	.zero	128
	.type	last_rec_pos_time.18051, %object
	.size	last_rec_pos_time.18051, 128
last_rec_pos_time.18051:
	.zero	128
	.type	last_rec_pos_decparam_time.18052, %object
	.size	last_rec_pos_decparam_time.18052, 128
last_rec_pos_decparam_time.18052:
	.zero	128
	.type	ChanPriTab.18001, %object
	.size	ChanPriTab.18001, 128
ChanPriTab.18001:
	.zero	128
	.type	g_VfmwChanStat, %object
	.size	g_VfmwChanStat, 2304
g_VfmwChanStat:
	.zero	2304
	.type	PrioArray.17463, %object
	.size	PrioArray.17463, 128
PrioArray.17463:
	.zero	128
	.type	s_ChanControlState, %object
	.size	s_ChanControlState, 128
s_ChanControlState:
	.zero	128
	.type	Capability.17527, %object
	.size	Capability.17527, 148
Capability.17527:
	.zero	148
	.zero	4
	.type	PrioArray.17526, %object
	.size	PrioArray.17526, 128
PrioArray.17526:
	.zero	128
	.type	g_EsBufValidFlag, %object
	.size	g_EsBufValidFlag, 128
g_EsBufValidFlag:
	.zero	128
	.type	g_eVdmVersion, %object
	.size	g_eVdmVersion, 4
g_eVdmVersion:
	.zero	4
	.zero	4
	.type	g_VfmwGlobalStat, %object
	.size	g_VfmwGlobalStat, 64
g_VfmwGlobalStat:
	.zero	64
	.type	AcceleratorCharacter, %object
	.size	AcceleratorCharacter, 8
AcceleratorCharacter:
	.zero	8
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
